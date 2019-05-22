/* Like ParseKAST2, but parses flattened KSequence nodes. */
type kNode =
  | Token(string)
  | Apply(list(string), list(kNode))
  | Freezer(list(string), list(kNode), int)
  | Sequence(list(kNode));

type kNodeKontList =
  | KLToken(string)
  | KLApply(list(string), list(kNodeKontList))
  | KLKontList(kNodeKontList, list(freezer))
and freezer = {ops: list(string), args: list(kNodeKontList), hole: int}

exception CompileError;

let rec compileKNodeToKNodeKontList = (kn : kNode) : kNodeKontList =>
  switch (kn) {
  | Token(s) => KLToken(s)
  | Apply(ss, ks) => KLApply(ss, List.map(compileKNodeToKNodeKontList, ks))
  | Sequence([]) => raise(CompileError)
  | Sequence([e, ...fs]) => KLKontList(compileKNodeToKNodeKontList(e), List.map(compileFreezer, fs))
  | _ => raise(CompileError)
  }
and compileFreezer = (kn) : freezer => {
  switch (kn) {
  | Freezer(ops, args, hole) => {ops, args: List.map(compileKNodeToKNodeKontList, args), hole}
  | _ => raise(CompileError)
  }
};

let prettyList = (ss) => {
  let rec loop = (ss) =>
    switch (ss) {
    | [] => ""
    | [s] => s
    | [s, ...ss] => s ++ ", " ++ loop(ss)
    };
  "[" ++ loop(ss) ++ "]"
};

let prettierList = (ss) => {
  let rec loop = (ss) =>
    switch (ss) {
    | [] => <> </>
    | [s] => <> s </>
    | [s, ...ss] => <> s {React.string(" ")} {loop(ss)} </>
    };
  <> {React.string("(")} {loop(ss)} {React.string(")")} </>
};

let rec interleave = (xs, ys) =>
  switch (xs, ys) {
  | ([], _) => ys
  | ([x, ...xs], _) => [x, ...interleave(ys, xs)]
  };

let split = (list, n) => {
  let rec aux = (i, acc) => fun
    | [] => (List.rev(acc), [])
    | [h, ...t] as l => if (i == 0) { (List.rev(acc), l) }
                        else { aux(i-1, [h, ...acc], t) };
  aux(n, [], list)
};

let insert = (x, xs, i) => {
  let (xs, ys) = split(xs, i);
  xs @ [x, ...ys]
};

let rec kNodeDebugPrint = (k) =>
  switch (k) {
  | Token(s) => "Token(" ++ s ++ ")"
  | Apply(ss, args) => "Apply(" ++ prettyList(List.map((s) => "\"" ++ s ++ "\"", ss)) ++ ", " ++ prettyList(List.map(kNodeDebugPrint, args)) ++ ")"
  | Freezer(ops, args, hole) => "Freezer(" ++ prettyList(ops) ++ ", " ++ prettyList(List.map(kNodeDebugPrint, args)) ++ ", " ++ string_of_int(hole) ++ ")"
  | Sequence(l) => "Sequence(" ++ prettyList(List.map(kNodeDebugPrint, l)) ++ ")"
  };

let rec knklDebugPrint = (k) =>
  switch (k) {
  | KLToken(s) => "KLToken(" ++ s ++ ")"
  | KLApply(ss, args) => "KLApply(" ++ prettyList(List.map((s) => "\"" ++ s ++ "\"", ss)) ++ ", " ++ prettyList(List.map(knklDebugPrint, args)) ++ ")"
  | KLKontList(kn, fs) => "KLKontList(\n  " ++ knklDebugPrint(kn) ++ ",\n  " ++ prettyList(List.map(freezerDebugPrint, fs)) ++ ")"
  }
and freezerDebugPrint = ({ops, args, hole}) => "freezer(" ++ prettyList(ops) ++ ", " ++ prettyList(List.map(knklDebugPrint, args)) ++ ", " ++ string_of_int(hole) ++ ")"

let render_open_brack = <span style=(ReactDOMRe.Style.make(~color="Crimson", ()))> {ReasonReact.string("[")} </span>;
let render_close_brack = <span style=(ReactDOMRe.Style.make(~color="Crimson", ()))> {ReasonReact.string("]")} </span>;

let rec knklPretty = (k) =>
  switch (k) {
  | KLToken(s) => <> {React.string(s)} </>
  | KLApply(ops, args) => interleave(List.map(React.string, ops), List.map(knklPretty, args)) |> prettierList
  | KLKontList(kn, fs) => prettyKontList(kn, List.rev(fs))
}
and prettyFreeze = (f, arg) => {
  let newArgs = insert(<> render_open_brack arg render_close_brack </>, List.map(knklPretty, f.args), f.hole);
  interleave(List.map(React.string, f.ops), newArgs) |> prettierList
}
/* TODO: might need to reverse the fs */
and prettyKontList = (kn, fs) =>
  switch (fs) {
  | [] => knklPretty(kn)
  | [f, ...fs] => prettyFreeze(f, prettyKontList(kn, fs))
  };

let cleanLabel = (s) => {
  let suffix = "_LAMBDA";
  if (Js.String.endsWith(suffix, s)) {
    Js.String.substring(s, ~from=0, ~to_=(Js.String.length(s) - Js.String.length(suffix)))
  } else {
    s
  }
};

/* extracts name from a freezer */
let extractName = (s) => {
  Js.String.substring(~from=8, ~to_=Js.String.length(s) - 9, s);
}

module Decode = {
  open Json.Decode;

  /* unneccesary function wrapping to skirt let rec limitations */
  let rec kNode = (json) => {
    (field("node", string) |> andThen(
      fun (s) =>
        switch (s) {
        | "KToken" => kToken
        | "KApply" => kApply
        | _ => failwith("Unknown node type")
        }
    ))(json)
  }
  and kToken = (json) => {
    Token(json |> field("token", string))
  }
  and kApply = (json) => {
    (field("label", string) |> andThen(
      fun (s) =>
        switch (s) {
        | "#KSequence" => seq
        | _ when Js.String.startsWith("#freezer", s) => freezer
        | _ => apply
        }
    ))(json)
  }
  and apply = (json) => {
    Apply(
      json |> field("label", string) |> cleanLabel |> Js.String.split("_") |> Array.to_list,
      json |> field("args", list(kNode))
    )
  }
  and freezer = (json) => {
    let label = json |> field("label", string);
    let holePos = 1 - (label |> Js.String.charAt(Js.String.length(label) - 2) |> int_of_string);
    Freezer(
      label |> extractName |> Js.String.split("_") |> Array.to_list,
      json |> field("args", list(kNode)),
      holePos
    )
  }
  and seq = (json) => {
    Sequence(json |> field("args", list(kNode)));
  };

  let kAst = (json) => json |> field("term", kNode);
};  

let decode = (json) => json |> Json.parseOrRaise |> Decode.kAst;

/* https://stackoverflow.com/a/244104 */
let (--) = (i, j) => {
    let rec aux = (n, acc) => if (n < i) { acc } else { aux(n - 1, [n, ...acc]) };
    aux(j, [])
};

let fetchLoggedStates = (file, callback) => {
  Js.Promise.(
    Fetch.fetch(file)
    |> then_(Fetch.Response.json)
    |> then_(json => { resolve(callback(json)) })
  );
};

let fetchLogStateIDs = (file) => {
  Js.Promise.(
    Fetch.fetch(file)
    |> then_(Fetch.Response.text)
    |> then_((text) => { 
      let trimmedText = text |> Js.String.trim
                             |> Js.String.splitByRe([%bs.re "/\\n/g"])
                             |> Array.map((s) => s |> Belt_Option.getExn |> Js.String.splitByRe([%bs.re "/\\s|_/g"]))
                             |> Array.to_list
                             |> List.filter((arr) => Array.length(arr) >= 4)
                             |> Array.of_list;
      let states = trimmedText |> Array.map((arr) => arr[2]) |> Array.map(Belt_Option.getExn) |> Array.to_list;
      resolve(states)
    })
  );
};

type configuration = {k: ReasonReact.reactElement};

type state = {currentConfig: option(ReasonReact.reactElement)};

type action =
  | UpdateMachineState(configuration);

/* TODO: error handling */
let handleClick = (dispatch, _event) => {
  let path = "http://localhost:8080/lets++-uberflat-log/";
  let log = "execute-146023363.log";
  /* let callback = (json) => json |> Decode.kAst |> compileKNodeToKNodeKontList |> knklPretty; */
  /* let callback = (json) => json |> Decode.kAst |> kNodeDebugPrint |> React.string; */
  let callback = (json) => json |> Json.stringify |> React.string;
  let fetchedLogStateIDs = fetchLogStateIDs(path ++ log);
  Js.Promise.(fetchedLogStateIDs |> then_((fetched) => fetched |> List.fold_left(
    (p, file) => p |> then_((s1) => {
      fetchLoggedStates(path ++ "null_blobs/" ++ file ++ ".json", callback) |> then_(s2 => resolve(<> s1 <div> s2 </div> </>))
    }),
    resolve(<> </>),
    _)
    |> then_((s) => {dispatch(UpdateMachineState({k: s})); resolve()})))
    |> ignore;
};

[@react.component]
let make = () => {
  let (state, dispatch) = React.useReducer((_state, action) =>
  switch (action) {
  | UpdateMachineState(s) => {currentConfig: Some(s.k)}
  }, {currentConfig: None});

  <div>
    <button onClick={handleClick(dispatch)}>
      {ReasonReact.string("foo bar")}
    </button>
    {
      switch (state.currentConfig) {
      | None => <> {React.string("No state!")} </>
      | Some(s) => s
      }
    }
  </div>;
};
