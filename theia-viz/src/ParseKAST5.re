/* Like V4, but doesn't flatten sequences anymore since they don't flatten as far as I thought */

/* 

  Need to remove flattening of KSequence nodes, it doesn’t flatten nested sequences, which poses a problem for my assumptions.

  Instead I need to visualize recursively. Not entirely sure how it works.

  Sequence is
  (n, n) => ~>
  (f, f) => more freezers?
  (n, f) =>  beginning of continuation
  (f, n) => shouldn’t happen?

  Copy from version 2, which is able to parse some things correctly, though it doesn’t handle the (n, n) case correctly. It wasn’t recursive enough iirc

  TODO:
    - rerun examples without sequences flattened
    - restore v2-style parsing of sequences and data representation
    - fix printing for arithmetic
    - fix printing for more complex examples
*/

/* https://stackoverflow.com/a/244104 */
let (--) = (i, j) => {
  let rec aux = (n, acc) => if (n < i) { acc } else { aux(n - 1, [n, ...acc]) };
  aux(j, [])
};

type kNode =
  | Token(string)
  | Apply(list(string), list(kNode))
  | Freezer(list(string), list(kNode), int)
  | Sequence(list(kNode))
  | Map(list(kNode))
  | KV((kNode, kNode));

let prettyList = (ss) => {
  let rec loop = (ss) =>
    switch (ss) {
    | [] => ""
    | [s] => s
    | [s, ...ss] => s ++ ", " ++ loop(ss)
    };
  "[" ++ loop(ss) ++ "]"
};

let rec kNodeDebugPrint = (k) =>
  switch (k) {
  | Token(s) => "Token(" ++ s ++ ")"
  | Apply(ss, args) => "Apply(" ++ prettyList(List.map((s) => "\"" ++ s ++ "\"", ss)) ++ ", " ++ prettyList(List.map(kNodeDebugPrint, args)) ++ ")"
  | Freezer(ops, args, hole) => "Freezer(" ++ prettyList(ops) ++ ", " ++ prettyList(List.map(kNodeDebugPrint, args)) ++ ", " ++ string_of_int(hole) ++ ")"
  | Sequence(l) => "Sequence(" ++ (List.map(kNodeDebugPrint, l) |> prettyList) ++ ")"
  | Map(l) => "Map(" ++ (List.map(kNodeDebugPrint, l) |> prettyList) ++ ")"
  | KV((k, v)) => "KV(" ++ kNodeDebugPrint(k) ++ ", " ++ kNodeDebugPrint(v) ++ ")"
  }
and debugEntry = ((k, v)) => kNodeDebugPrint(k) ++ "->" ++ kNodeDebugPrint(v);

/* JSON parsing */

let cleanLabel = (suffix, s) => {
  if (Js.String.endsWith(suffix, s)) {
    Js.String.substring(s, ~from=0, ~to_=(Js.String.length(s) - Js.String.length(suffix)))
  } else {
    s
  }
};

/* extracts name from a freezer */
let extractName = (s) => {
  s |> Js.String.substring(~from=8, ~to_=Js.String.length(s) - 2) |> cleanLabel("_LAMBDA") |> cleanLabel("_LAMBDA-SYNTAX")
};

module Decode = {
  open Json.Decode;

  /* unneccesary function wrapping to skirt let rec limitations */
  let rec config = (json) => {
    (field("label", string) |> andThen(
      fun (s) =>
        switch (s) {
        | "<T>" => (json) => json |> field("args", list(kNode))
        | _ => (json) => json |> kNode |> (x => [x])
        }
    ))(json)
    /* json |> field("args", list(kNode)) |> List.nth(_, 0) */
  }
  and kNode = (json) => {
    (field("node", string) |> andThen(
      fun (s) =>
        switch (s) {
        | "KToken" => kToken
        | "KApply" => kApply
        | "KVariable" => kVariable
        | _ => failwith("Unknown node type: " ++ s)
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
        | ".Map" => kEmptyMap
        | "_Map_" => kMap
        | "_|->_" => kKV /* TODO: if this case is hit, it might always be a single element map so just make a special case */
        | _ => apply
        }
    ))(json)
  }
  and kVariable = (json) => {
    /* TODO: this should be a new variant! */
    Token(json |> field("name", string))
  }
  and apply = (json) => {
    Apply(
      json |> field("label", string) |> cleanLabel("_LAMBDA") |> cleanLabel("_LAMBDA-SYNTAX") |> Js.String.split("_") |> Array.to_list,
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
    Sequence(json |> field("args", list(kNode)))
  }
  and kEmptyMap = (_) => {
    Map([])
  }
  and kMap = (json) => {
    Map(json |> field("args", list(kKV)));
  }
  and kKV = (json) => {
    KV(json |> field("args", pair(kNode, kNode)))
  }
  /* and mapKV = (json) => {
    (field("label", string) |> andThen(
      fun (s) =>
        switch (s) {
        | "_|->_" => field("args", pair(kNode, kNode))
        | _ => raise(DecodeError("expected a key-value pair, but got: " ++ s))
        }
    ))(json)
  } */;

  let kAst = (json) => json |> field("term", config);
};  

let decode = (json) => json |> Json.parseOrRaise |> Decode.kAst;

/* 
  now for the compilation step
  we parse sequences into continuations and normal sequences
  n = kNode, f = freezer
  [n, n, f, f, n, f] => [[n], [n, f, f], [n, f]] => [n, kont(n, [f, f]), kont(n, [f])]
 */

exception CompileError(string);

/* adapted from http://julio.meroh.net/2006/08/split-function-in-haskell.html */
/* just here for reference now */
let rec splitAux = (l, x) =>
  switch (l) {
  | [] => [[]]
  | [h, ...t] => {
      let rest = splitAux(t, x);
      let tail = [[h, ...List.hd(rest)], ...List.tl(rest)];
      if (h == x) {
		    [[], ...tail]
      } else {
        tail
      }
    }
  };

let split = (l, x) =>
  switch (l) {
  | [] => []
  | l  => List.tl(splitAux(l, x))
  };


/* TODO: use better way to grow datatypes like GADTs or something */
type kNode2 =
  | Token2(string)
  | Apply2(list(string), list(kNode2))
  | Freezer2(list(string), list(kNode2), int)
  | Sequence2(list(kNode2))
  | Map2(list(kNode2))
  | Kont2(kNode2, list(kNode2))
  | KV2((kNode2, kNode2));

let rec kNode2DebugPrint = (k) =>
  switch (k) {
  | Token2(s) => "Token2(" ++ s ++ ")"
  | Apply2(ss, args) => "Apply2(" ++ prettyList(List.map((s) => "\"" ++ s ++ "\"", ss)) ++ ", " ++ prettyList(List.map(kNode2DebugPrint, args)) ++ ")"
  | Freezer2(ops, args, hole) => "Freezer2(" ++ prettyList(ops) ++ ", " ++ prettyList(List.map(kNode2DebugPrint, args)) ++ ", " ++ string_of_int(hole) ++ ")"
  | Sequence2(l) => "Sequence2(" ++ (List.map(kNode2DebugPrint, l) |> prettyList) ++ ")"
  | Map2(l) => "Map2(" ++ (List.map(kNode2DebugPrint, l) |> prettyList) ++ ")"
  | Kont2(e, fs) => "Kont2(" ++ kNode2DebugPrint(e) ++ ", " ++ (List.map(kNode2DebugPrint, fs) |> prettyList) ++ ")"
  | KV2((k, v)) => "KV2(" ++ kNode2DebugPrint(k) ++ ", " ++ kNode2DebugPrint(v) ++ ")"
  }
and debugEntry2 = ((k, v)) => kNode2DebugPrint(k) ++ "->" ++ kNode2DebugPrint(v);

let rec splitSeqAux = (l) =>
  switch (l) {
  | [] => [[]]
  | [h, ...t] => {
      let rest = splitSeqAux(t);
      let tail = [[h, ...List.hd(rest)], ...List.tl(rest)];
      switch (h) {
      | Freezer2(_) => tail
      | _ => [[], ...tail]
      }
    }
  };

/* [n, n, f, f, n, f] => [[n], [n, f, f], [n, f]] */
let splitSeq = (l) =>
  switch (l) {
  | [] => []
  | l  => List.tl(splitSeqAux(l))
  };

/* [[n], [n, f, f], [n, f]] => [n, kont(n, [f, f]), kont(n, [f])] */
let convertToKont = (l: list(kNode2)) : kNode2 =>
  switch (l) {
  | [] => raise(CompileError("Got an empty list in convertToKont."))
  | [n] => n
  | [n, ...fs] => Kont2(n, fs)
  };

let convertSequence = List.map(convertToKont);

/* TODO: for now, assuming that KV is a single-entry map */
/* TODO: This is buggy!

Currently does this
Apply (["<k>"], [Sequence ([Apply (["", "+", ""], [Token (1), Apply (["", "*", ""], [Token (2), Token (3)])]), Sequence ([Freezer([, /, ], [Token(4)], 0), Freezer([, <=, ], [Token(1)], 0)])])])
=>
Apply2(["<k>"], [Sequence2([Apply2(["", "+", ""], [Token2(1), Apply2(["", "*", ""], [Token2(2), Token2(3)])]), Sequence2([Freezer2([, /, ], [Token2(4)], 0), Freezer2([, <=, ], [Token2(1)], 0)])])])
=>
Apply2(["<k>"], [Sequence2([Apply2(["", "+", ""], [Token2(1), Apply2(["", "*", ""], [Token2(2), Token2(3)])]), Sequence2([])])])

*/

/* 

Sequence([
  Apply(["", "+", ""], [Token(1), Apply(["", "*", ""], [Token(2), Token(3)])]),
  Sequence([ <-- this should be a list of freezers!!! there shouldn't be a sequence node here. maybe flatten doesn't work like I think it does
    Freezer([, /, ], [Token(4)], 0),
    Freezer([, <=, ], [Token(1)], 0)])])])
*/

let rec kNodeToKNode2 = (kn) =>
  switch (kn) {
    | Token(s) => Token2(s)
    | Apply(ss, kns) => Apply2(ss, List.map(kNodeToKNode2, kns))
    | Freezer(ss, kns, i) => Freezer2(ss, List.map(kNodeToKNode2, kns), i)
    | Sequence(kns) => Sequence2(List.map(kNodeToKNode2, kns) |> splitSeq |> convertSequence)
    | Map(kns) => Map2(List.map(compileKeys2, kns))
    | KV(_) => Map2([compileKeys2(kn)]);
    }
and compileKeys2 = (kn) =>
  switch (kn) {
  | KV((k, v)) => KV2((kNodeToKNode2(k), kNodeToKNode2(v)))
  | _ => raise(CompileError("Expected key-value pair")) /* todo: add node to this error */
  };

/* and finally pretty printing! */
let render_open_brack = <span style=(ReactDOMRe.Style.make(~color="Crimson", ()))> {ReasonReact.string("[")} </span>;
let render_close_brack = <span style=(ReactDOMRe.Style.make(~color="Crimson", ()))> {ReasonReact.string("]")} </span>;

let rec kn2Pretty = (k) =>
  switch (k) {
  | Token2(s) => <> {React.string(s)} </>
  | Apply2(ops, args) => Util.interleave(List.map(React.string, ops), List.map(kn2Pretty, args)) |> Util.prettierList
  | Freezer2(_) => raise(CompileError("There shouldn't be a Freezer2 outside a Kont2 node!"))
  | Sequence2(l) => <> {Util.interleave(List.map(kn2Pretty, l), (1--(List.length(l) - 1)) |> List.map(_ => React.string(" ~> "))) |> Util.prettierList} </>
  /* | Sequence2(l) => <> {kn2PrettyList(l)} </> */ /* TODO: almost right except for subexpressions that contain sequences like in callcc.
    I think it's better to just have a list of environments than a store them in the k node. This is a semantics problem.
    There are two ways to affect the visualization: change how individual elements are rendered or change the semantics. */
  | Map2([]) => 
      <table style=(ReactDOMRe.Style.make(~borderCollapse="collapse", ~display="inline-table", ()))>
        <tbody>  
          <tr>
            <td style=(ReactDOMRe.Style.make(~border="1px solid black", ()))> {React.string("/")} </td>
          </tr>
        </tbody>
      </table>
  | Map2(l) =>
      <table style=(ReactDOMRe.Style.make(~borderCollapse="collapse", ~display="inline-table", ()))>
        /* TODO: thead? */
        <tbody>
          {
            l|>List.mapi((i, kv) => 
              <tr key=(string_of_int(i))>
                {kn2Pretty(kv)}
              </tr>)|>Array.of_list|>React.array
          }
        </tbody>
      </table>
  | Kont2(kn, fs) => prettyKont2List(kn, List.rev(fs))
  | KV2((k, v)) =>
      <>
        <td style=(ReactDOMRe.Style.make(~border="1px solid black", ()))> {kn2Pretty(k)} </td>
        <td style=(ReactDOMRe.Style.make(~border="1px solid black", ()))> {kn2Pretty(v)} </td>
      </>
}
and prettyFreeze = (kn, arg) =>
  switch (kn) {
  | Freezer2(ops, args, hole) =>
      let newArgs = Util.insert(<> render_open_brack arg render_close_brack </>, List.map(kn2Pretty, args), hole);
      Util.interleave(List.map(React.string, ops), newArgs) |> Util.prettierList
  | _ => raise(CompileError("Expected freezer in prettyFreeze"))
  }
and prettyKont2List = (kn, fs) =>
  switch (fs) {
  | [] => kn2Pretty(kn)
  | [f, ...fs] => prettyFreeze(f, prettyKont2List(kn, fs))
  }
and kn2PrettyList = (xs) => List.fold_left((s1, s2) => <> s1 <div> {kn2Pretty(s2)} </div> </>, <> </>, xs);

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

type configuration = {k: list(ReasonReact.reactElement)};

type state = {trace: option(list(ReasonReact.reactElement)), currentConfig: int};

type action =
  | UpdateMachineState(configuration)
  | StepBack
  | StepForward;

type print =
  | KNode
  | KNode2
  | Json
  | Theia;

/* TODO: error handling */
let handleClick = (~path, ~log, ~print, dispatch, _event) => {
  let callback = (json) =>
    switch (print) {
    | KNode => json |> Decode.kAst |> List.map(ast => ast |> kNodeDebugPrint |> React.string) |> Array.of_list |> React.array
    | KNode2 => json |> Decode.kAst |> List.map(ast => ast |> kNodeToKNode2 |> kNode2DebugPrint |> React.string) |> Array.of_list |> React.array
    | Json => json |> Json.stringify |> React.string
    | Theia => json |> Decode.kAst |> List.map(kNodeToKNode2) |> kn2PrettyList
    };

  let fetchedLogStateIDs = fetchLogStateIDs(path ++ log);
  Js.Promise.(fetchedLogStateIDs |> then_((fetched) => fetched |> List.fold_left(
    (p, file) => p |> then_((s1) => {
      fetchLoggedStates(path ++ "null_blobs/" ++ file ++ ".json", callback) |> then_(s2 => resolve(s1 @ [s2]))
    }),
    resolve([]),
    _)
    |> then_((s) => {dispatch(UpdateMachineState({k: s})); resolve()})))
    |> ignore;
};

[@react.component]
let make = () => {
  let (state, dispatch) = React.useReducer((state, action) =>
  switch (action) {
  | UpdateMachineState(s) => {trace: Some(s.k), currentConfig: 0}
  | StepBack => {...state, currentConfig: max(0, state.currentConfig - 1)}
  | StepForward => {...state, currentConfig: min(state.currentConfig + 1, List.length(Belt_Option.getExn(state.trace)) - 1)}
  }, {trace: None, currentConfig: 0});

  /* register keyboard events */
  let handleKeyPressed = (e) => {
    switch (Webapi.Dom.KeyboardEvent.key(e)) {
    | "ArrowLeft" => dispatch(StepBack)
    | "ArrowRight" => dispatch(StepForward)
    | _ => ()
    }
  };
  Util.useKeyPressed(handleKeyPressed);

  <div>
    <button onClick={_ => dispatch(StepBack)}>
      {React.string("<-")}
    </button>
    <button onClick={_ => dispatch(StepForward)}>
      {React.string("->")}
    </button>
    <button onClick={handleClick(~path="http://localhost:8080/arithmetic-log/",
                                 ~log="execute-423906835.log",
                                 ~print=KNode,
                                 dispatch)}>
      {React.string("arith-rw")}
    </button>
    <button onClick={handleClick(~path="http://localhost:8080/lets++-callcc-env1/",
                                 ~log="execute-1800280225.log",
                                 ~print=Theia,
                                 dispatch)}>
      {React.string("callcc")}
    </button>
    <button onClick={handleClick(~path="http://localhost:8080/lets++-factorial-letrec/",
                                 ~log="execute-332225037.log",
                                 ~print=Theia,
                                 dispatch)}>
      {React.string("factorial letrec")}
    </button>
    /* this one doesn't work b/c it doesn't clean the data correctly. need to be smarter about data cleaning. */
    /* some use LAMBDA suffixes and some use LAMBDA-SYNTAX. need to know which one to use */
    /* <button onClick={handleClick(~path="http://localhost:8080/types-plus-log/",
                                 ~log="execute-172182753.log",
                                 dispatch)}>
      {React.string("types plus")}
    </button> */
    {
      let renderConfig = (my_option) =>
        switch (my_option) {
        | None => <> </>
        | Some(v) => v
        };

      switch (state.trace) {
      | None => <> {React.string("No state!")} </>
      | Some(s) =>
        <div>
          /* {s->Belt.List.get(state.currentConfig - 1)->renderConfig} */
          {s->Belt.List.get(state.currentConfig)->renderConfig}
          /* {s->Belt.List.get(state.currentConfig + 1)->renderConfig} */
        </div>
      }
    }
  </div>;
};
