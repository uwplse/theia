/* Like V4, but doesn't pre-flatten sequences anymore since they don't flatten as far as I thought */

/* 
  TODO:
    - make type checking work
    - write a version of the currying python tutor example
    - imperative language?
    - fix prop key warning
    - speed up using react devtools
    - *KOOL*
    - add two states side-by-side
    - print original program text
*/

let rlist = (l) => l |> Array.of_list |> React.array;

/* https://stackoverflow.com/a/244104 */
let (--) = (i, j) => {
  let rec aux = (n, acc) => if (n < i) { acc } else { aux(n - 1, [n, ...acc]) };
  aux(j, [])
};

/* TODO: modularize per example/language */
let values = [["closure"], ["muclosure"], ["cc"]];
let labels = ["LAMBDA", "LAMBDA-SYNTAX", "IMP-SYNTAX", "FUN-UNTYPED-COMMON"];

let rec appNodesEq = (v1, v2) => {
  switch (v1, v2) {
  | ([], []) => true
  | ([], [_, ..._]) => false
  | ([_, ..._], []) => false
  | ([s1, ...v1], [s2, ...v2]) => (s1 == s2) && appNodesEq(v1, v2)
  }
};

let rec appNodeIn = (s, vs) => {
  switch (vs) {
  | [] => false
  | [v, ...vs] => appNodesEq(s, v) || appNodeIn(s, vs)
  }
};

type kNode =
  | Token(string)
  | Apply(list(string), list(kNode))
  | Freezer(list(string), list(kNode), int)
  | Sequence((kNode, kNode))
  | Map(list(kNode))
  | KV((kNode, kNode))
  | Cell(string, list(kNode));

type cell('a) = {label: string, body: list('a)};

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
  | Sequence((l, r)) => "Sequence(" ++ kNodeDebugPrint(l) ++ ", " ++ kNodeDebugPrint(r) ++ ")"
  | Map(l) => "Map(" ++ (List.map(kNodeDebugPrint, l) |> prettyList) ++ ")"
  | KV((k, v)) => "KV(" ++ kNodeDebugPrint(k) ++ ", " ++ kNodeDebugPrint(v) ++ ")"
  | Cell(label, children) => "Cell(" ++ label ++ ", " ++ prettyList(List.map(kNodeDebugPrint, children)) ++ ")"
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

let flip = (f, x, y) => f(y, x);

let cleanLabels = List.fold_left(flip(cleanLabel), _, labels);

/* extracts name from a freezer */
let extractName = (s) => {
  s |> Js.String.substring(~from=8, ~to_=Js.String.length(s) - 2) |> cleanLabels
};

module Decode = {
  open Json.Decode;

  /* unneccesary function wrapping to skirt let rec limitations */
  let rec config = (json) => {
    (field("label", string) |> andThen(
      fun (s) =>
        switch (s) {
        | "<T>" => (json) => json |> field("args", list(cell))
        | _ => (json) => json |> cell |> (x => [x])
        }
    ))(json)
  }
  and cell = (json) => {
    let s = json |> field("label", string);
    Cell(
      s |> Js.String.substring(~from=1, ~to_=(Js.String.length(s) - 1)),
      json |> field("args", list(kNode))
    )
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
        | _ when Js.String.startsWith("<", s) && Js.String.endsWith(">", s) => cell
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
      json |> field("label", string) |> cleanLabels |> Js.String.split("_") |> Array.to_list,
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
    Sequence(json |> field("args", pair(kNode, kNode)))
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
  | Freezer2(freezer)
  | Sequence2(list(kNode2))
  | Map2(list(kNode2))
  | Kont2(kNode2, list(freezer))
  | KV2((kNode2, kNode2))
  | Value2(list(string), list(kNode2))
  | Cell2(string, list(kNode2))
and freezer = {ops: list(string), args: list(kNode2), holePos: int};

let rec kNode2DebugPrint = (k) =>
  switch (k) {
  | Token2(s) => "Token2(" ++ s ++ ")"
  | Apply2(ss, args) => "Apply2(" ++ prettyList(List.map((s) => "\"" ++ s ++ "\"", ss)) ++ ", " ++ prettyList(List.map(kNode2DebugPrint, args)) ++ ")"
  | Value2(ss, args) => "Value2(" ++ prettyList(List.map((s) => "\"" ++ s ++ "\"", ss)) ++ ", " ++ prettyList(List.map(kNode2DebugPrint, args)) ++ ")"
  | Freezer2(f) => "Freezer2(" ++ debugFreezer(f) ++ ")"
  | Sequence2(l) => "Sequence2(" ++ (List.map(kNode2DebugPrint, l) |> prettyList) ++ ")"
  | Map2(l) => "Map2(" ++ (List.map(kNode2DebugPrint, l) |> prettyList) ++ ")"
  | Kont2(e, fs) => "Kont2(" ++ kNode2DebugPrint(e) ++ ", " ++ (List.map(debugFreezer, fs) |> prettyList) ++ ")"
  | KV2((k, v)) => "KV2(" ++ kNode2DebugPrint(k) ++ ", " ++ kNode2DebugPrint(v) ++ ")"
  | Cell2(s, args) => "Cell2(" ++ s ++ ", " ++ prettyList(List.map(kNode2DebugPrint, args)) ++ ")"
  }
and debugEntry2 = ((k, v)) => kNode2DebugPrint(k) ++ "->" ++ kNode2DebugPrint(v)
and debugFreezer = ({ops, args, holePos}) => {
  "freezer2(" ++ prettyList(List.map((s) => "\"" ++ s ++ "\"", ops)) ++ ", " ++ prettyList(List.map(kNode2DebugPrint, args)) ++ ", " ++ string_of_int(holePos) ++ ")"
};

let rec kNode2DebugPrintShort = (k) =>
  switch (k) {
  | Token2(_) => "Tk"
  | Apply2(_, args) => "App(" ++ prettyList(List.map(kNode2DebugPrintShort, args)) ++ ")"
  | Freezer2(_) => "Fz"
  | Sequence2(l) => "Seq(" ++ prettyList(List.map(kNode2DebugPrintShort, l)) ++ ")"
  | Map2(_) => "Map"
  | Kont2(_) => "Kont"
  | KV2(_) => "KV"
  | Value2(_, args) => "Val(" ++ prettyList(List.map(kNode2DebugPrintShort, args)) ++ ")"
  | Cell2(_, args) => "Cell(" ++ prettyList(List.map(kNode2DebugPrintShort, args)) ++ ")"
  };

type seqDebug =
  | Seq(seqDebug, seqDebug)
  | ApplyS(list(seqDebug))
  | FreezerS(list(seqDebug))
  | MapS(list(seqDebug))
  | KVS(seqDebug, seqDebug)
  | CellS(list(seqDebug))
  | NoSeq;

let rec seqDebugPrint = (s) =>
  switch (s) {
  | Seq(l, r) => "Seq(" ++ seqDebugPrint(l) ++ ", " ++ seqDebugPrint(r) ++ ")"
  | NoSeq => "NS"
  | ApplyS(ss) => "App(" ++ prettyList(List.map(seqDebugPrint, ss)) ++ ")"
  | FreezerS(ss) => "F(" ++ prettyList(List.map(seqDebugPrint, ss)) ++ ")"
  | MapS(ss) => "Map(" ++ prettyList(List.map(seqDebugPrint, ss)) ++ ")"
  | KVS(l, r) => "KV(" ++ seqDebugPrint(l) ++ ", " ++ seqDebugPrint(r) ++ ")"
  | CellS(ss) => "Cell(" ++ prettyList(List.map(seqDebugPrint, ss)) ++ ")"
  };

let notIsSeq = (s) =>
  switch (s) {
  | Seq(_) => false
  | _ => true
  };

let isNoSeq = (s) =>
  switch (s) {
  | NoSeq => true
  | _ => false
  }

let noSeq = List.for_all(isNoSeq);

let rec kNodeToSeqDebug = (kn) =>
  switch (kn) {
  | Sequence((l, r)) => Seq(kNodeToSeqDebug(l), kNodeToSeqDebug(r))
  | Token(_) => NoSeq
  | Apply(_, kns) => {
    let convertedKNS = List.map(kNodeToSeqDebug, kns);
    if (noSeq(convertedKNS)) {
      NoSeq
    } else {
      ApplyS(convertedKNS)
    }
  }
  | Freezer(_, kns, _) => {
    let convertedKNS = List.map(kNodeToSeqDebug, kns);
    FreezerS(convertedKNS)
  } 
  | Map(kns) => {
    let convertedKNS = List.map(kNodeToSeqDebug, kns);
      if (noSeq(convertedKNS)) {
        NoSeq
      } else {
        MapS(convertedKNS)
      }
    }
  | KV((l, r)) => {
    let (cK, cV) = (kNodeToSeqDebug(l), kNodeToSeqDebug(r));
      if (noSeq([cK, cV])) {
        NoSeq
      } else {
        KVS(cK, cV)
      }
    }
  | Cell(_, kns) => {
    let convertedKNS = List.map(kNodeToSeqDebug, kns);
    if (noSeq(convertedKNS)) {
      NoSeq
    } else {
      ApplyS(convertedKNS)
    }
  }
};

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

let rec extractFreezers = (fs) =>
  switch (fs) {
  | [] => []
  | [Freezer2(f), ...t] => [f, ...extractFreezers(t)]
  | _ => raise(CompileError("expected a freezer"))
  };

/* [[n], [n, f, f], [n, f]] => [n, kont(n, [f, f]), kont(n, [f])] */
let convertToKont = (l: list(kNode2)) : kNode2 =>
  switch (l) {
  | [] => raise(CompileError("Got an empty list in convertToKont."))
  | [n] => n
  | [n, ...fs] => Kont2(n, extractFreezers(fs))
  };

let convertSequence = (s) => Sequence2(s |> splitSeq |> List.map(convertToKont));

/* TODO: for now, assuming that KV is a single-entry map */

/* top-level visiting */
let rec kNodeToKNode2 = (kn) =>
  switch (kn) {
  | Token(s) => Token2(s)
  | Apply(ss, kns) =>
    if (appNodeIn(ss, values)) {
      Value2(ss, List.map(kNodeToKNode2, kns))
    } else {
      Apply2(ss, List.map(kNodeToKNode2, kns))
    }
  | Freezer(ss, kns, i) => Freezer2({ops: ss, args: List.map(kNodeToKNode2, kns), holePos: i})
  /* when we hit a sequence node, switch to aux */
  | Sequence(_) => convertSequence(flattenSequence(kn, []))
  | Map(kns) => Map2(List.map(compileKeys2, kns))
  | KV(_) => Map2([compileKeys2(kn)])
  | Cell(label, kns) => Cell2(label, List.map(kNodeToKNode2, kns))
  }
/* flatten sequence. we assume that the sequence is a spined tree that leans right */
and flattenSequence = (kn, seqList) => {
  switch (kn) {
  | Sequence((l, r)) => {
    let visitedLeft = flattenSequence(l, []);
    let visitedRight = flattenSequence(r, []);
    seqList @ visitedLeft @ visitedRight
  }
  | _ => seqList @ [kNodeToKNode2(kn)]
  }
}
and compileKeys2 = (kn) =>
  switch (kn) {
  | KV((k, v)) => KV2((kNodeToKNode2(k), kNodeToKNode2(v)))
  | _ => raise(CompileError("Expected key-value pair")) /* todo: add node to this error */
  };

/* and finally pretty printing! */
let render_open_brack = <span style=(ReactDOMRe.Style.make(~color="blue", ()))> {ReasonReact.string("[")} </span>;
let render_close_brack = <span style=(ReactDOMRe.Style.make(~color="blue", ()))> {ReasonReact.string("]")} </span>;

let rec kn2Pretty = (~parens=true, k) =>
  switch (k) {
  | Token2(s) => <> {React.string(s)} </>
  | Apply2(ops, args) => Util.interleave(List.map(React.string, ops), List.map(kn2Pretty, args)) |> Util.prettierList(~parens)
  | Freezer2(_) => raise(CompileError("There shouldn't be a Freezer2!"))
  /* | Sequence2(l) => <> {Util.interleave(List.map(kn2Pretty, l), (1--(List.length(l) - 1)) |> List.map(_ => React.string(" ~> "))) |> Util.prettierList} </> */
  | Sequence2(l) => <> {List.mapi((i, kn) => <div key={string_of_int(i)}> {kn2Pretty(~parens=false, kn)} </div>, l) |> List.rev |> Array.of_list |> React.array} </>
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
  | Value2(ops, args) =>
    <fieldset style=(ReactDOMRe.Style.make(~display="inline", ()))>
      <legend> {Util.interleave(ops, (1--(List.length(ops) - 1)) |> List.map(_ => "•")) |> List.fold_left((++), "") |> React.string} </legend>
      /* {Util.interleave(List.map(kn2Pretty, args), (1--(List.length(args) - 1)) |> List.map(_ => React.string("|"))) |> Util.prettierList(~parens=false)} */
      /* TODO: add padding */
      <table style=(ReactDOMRe.Style.make(~display="inline-table", ()))>
        /* TODO: thead? */
        <tbody>
          <tr>
            {args |> List.mapi((i, arg) => <td key={string_of_int(i)} style=(ReactDOMRe.Style.make(~border="1px solid gray", ()))> {kn2Pretty(arg)} </td>) |> rlist}
          </tr>
        </tbody>
      </table>
    </fieldset>
  | Cell2(label, children) =>
    <fieldset>
      <legend> {React.string(label)} </legend>
      {rlist(List.map(kn2Pretty(~parens=false), children))}
    </fieldset>
}
/* bracket style */
and prettyFreeze = (~nestNum=0, {ops, args, holePos}, arg) => {
  let newArgs = Util.insert(<> render_open_brack arg render_close_brack </>, List.map(kn2Pretty, args), holePos);
  Util.interleave(List.map(React.string, ops), newArgs) |> Util.prettierList(~parens=false)
}
/* underline style */
/* and prettyFreeze = (~nestNum=0, {ops, args, holePos}, arg) => {
  let newArgs = Util.insert(<span style=(ReactDOMRe.Style.make(~borderBottom="1px solid blue", ~paddingBottom=(string_of_int(nestNum*2) ++ "px"), ()))> arg </span>, List.map(kn2Pretty, args), holePos);
  Util.interleave(List.map(React.string, ops), newArgs) |> Util.prettierList
} */
and prettyKont2List = (~nestNum=0, kn, fs) =>
  switch (fs) {
  | [] => kn2Pretty(~parens=false, kn)
  | [f, ...fs] => prettyFreeze(~nestNum, f, prettyKont2List(~nestNum=nestNum+1, kn, fs))
  }
and kn2PrettyList = (xs) => xs |> List.map((s) => <div> {kn2Pretty(s)} </div>) |> List.fold_left((s1, s2) => <> s1 s2 </>, <> </>);

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

let cellPrint = ({label, body}, printer, i) => {
  <fieldset key={string_of_int(i)}>
    <legend> {React.string(label)} </legend>
    {printer(body)}
  </fieldset>
};

let cellsPrint = (printer, cs) => cs |> List.mapi((i, c) => cellPrint(c, printer, i));

type configuration = {k: list(ReasonReact.reactElement)};

type state = {trace: option(list(ReasonReact.reactElement)), currentConfig: int};

type action =
  | UpdateMachineState(configuration)
  | StepBack
  | StepForward;

type print =
  | KNode
  | KNode2
  | KNode2Short
  | Json
  | Theia;

/* TODO: error handling */
let handleClick = (~path, ~log, ~print=Theia, dispatch, _event) => {
  let callback = (json) =>
    switch (print) {
    | KNode => json |> Decode.kAst |> List.mapi((i, ast) => <div key={string_of_int(i)}> {ast |> kNodeDebugPrint |> React.string} </div>) |> rlist
    | KNode2 => json |> Decode.kAst |> List.map(ast => ast |> kNodeToKNode2 |> kNode2DebugPrint |> React.string) |> rlist
    | KNode2Short => json |> Decode.kAst |> List.map(ast => ast |> kNodeToKNode2 |> kNode2DebugPrintShort |> React.string) |> rlist
    | Json => json |> Json.stringify |> React.string
    | Theia => json |> Decode.kAst |> List.map(kNodeToKNode2) |> kn2PrettyList
    /* | SeqDebug =>
        <>
        <div>
          (json |> Decode.kAst |> List.map(ast => ast |> kNodeDebugPrint |> React.string) |> Array.of_list |> React.array)
        </div>
        <div>
          (json |> Decode.kAst |> List.map(ast => ast |> kNodeToSeqDebug |> seqDebugPrint |> React.string) |> Array.of_list |> React.array)
        </div>
        </> */
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

  /* TODO: use a drop-down menu? */
  <div>
    <button onClick={_ => dispatch(StepBack)}>
      {React.string("<-")}
    </button>
    <button onClick={_ => dispatch(StepForward)}>
      {React.string("->")}
    </button>
    <button onClick={handleClick(~path="http://localhost:8080/arithmetic-log/",
                                 ~log="execute-423906835.log",
                                 dispatch)}>
      {React.string("arith-rw")}
    </button>
    <button onClick={handleClick(~path="http://localhost:8080/lets++-callcc-env1-5/",
                                 ~log="execute-1800280225.log",
                                 dispatch)}>
      {React.string("callcc")}
    </button>
    <button onClick={handleClick(/* ~path="http://localhost:8080/lets++-factorial-letrec-5/",
                                 ~log="execute-332225037.log", */
                                 /* ~path="http://localhost:8080/lets++-factorial-letrec-short/",
                                 ~log="execute-1327604975.log", */
                                 ~path="http://localhost:8080/lets++-factorial-letrec-semishort/",
                                 ~log="execute-2113856637.log",
                                 dispatch)}>
      {React.string("factorial letrec")}
    </button>
    <button onClick={handleClick(~path="http://localhost:8080/imp-sum-short/",
                                 ~log="execute-694863693.log",
                                 /* ~path="http://localhost:8080/imp-sum/",
                                 ~log="execute-1666052739.log", */
                                 dispatch)}>
      {React.string("imp plus")}
    </button>
    <button onClick={handleClick(~path="http://localhost:8080/curried-add-2/",
                                 ~log="execute-50597497.log",
                                 /* ~path="http://localhost:8080/curried-add/",
                                 ~log="execute-776883472.log", */
                                 dispatch)}>
      {React.string("curried add")}
    </button>
    <button onClick={handleClick(~path="http://localhost:8080/types-plus-5/",
                                 ~log="execute-172182753.log",
                                 /* ~print=Json, */
                                 dispatch)}>
      {React.string("types plus")}
    </button>
    /* TODO: this is returning some weird results. Not all type variables are distinct. Perhaps need to be tracking a different type of state. */
    <button onClick={handleClick(~path="http://localhost:8080/types-composition/",
                                 ~log="execute-1458594712.log",
                                 /* ~print=Json, */
                                 dispatch)}>
      {React.string("types composition")}
    </button>
    <button onClick={handleClick(~path="http://localhost:8080/fun-factorial/",
                                 ~log="execute-1500377579.log",
                                 /* ~print=Json, */
                                 dispatch)}>
      {React.string("fun factorial")}
    </button>
    /* TODO: breaks b/c freezer assumptions are violated */
    /* <button onClick={handleClick(~path="http://localhost:8080/types-if/",
                                 ~log="execute-587178947.log",
                                 ~print=Json,
                                 dispatch)}>
      {React.string("types if")}
    </button> */
    {
      let renderConfig = (my_option) =>
        switch (my_option) {
        | None => <> </>
        | Some(v) => v
        };

      switch (state.trace) {
      | None => <> </>
      | Some(s) =>
        <div>
          <div style=(ReactDOMRe.Style.make(~float="left", ~minWidth="200px", ()))>
            /* {s->Belt.List.get(state.currentConfig - 1)->renderConfig} */
            {s->Belt.List.get(state.currentConfig)->renderConfig}
            /* {s->Belt.List.get(state.currentConfig + 1)->renderConfig} */
          </div>
          <div style=(ReactDOMRe.Style.make(~float="left", ~minWidth="200px", ()))>
            <ReactVisualDiff
              left={s->Belt.List.get(state.currentConfig)->renderConfig}
              right={s->Belt.List.get(state.currentConfig + 1)->renderConfig}
              diffProps={[|"children", "type", "className", "style"|]}
            />
          </div>
          <div style=(ReactDOMRe.Style.make(~float="left", ~minWidth="200px", ()))>
          {s->Belt.List.get(state.currentConfig + 1)->renderConfig}
          </div>
        </div>
      }
    }
  </div>;
};
