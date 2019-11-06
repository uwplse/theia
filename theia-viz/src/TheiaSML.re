/* Theia with SML shim. */

/* TODO:
    - refactor into multiple files
    - use JSON trace intermediate format
*/
let rlist = (l) => l |> Array.of_list |> React.array;

/* https://stackoverflow.com/a/244104 */
let (--) = (i, j) => {
  let rec aux = (n, acc) => if (n < i) { acc } else { aux(n - 1, [n, ...acc]) };
  aux(j, [])
};

/* TODO: modularize per example/language */
let values = [["closure"], ["muclosure"], ["cc"]];
let labels = ["LAMBDA", "LAMBDA-SYNTAX", "IMP-SYNTAX", "FUN-UNTYPED-COMMON", "SML-SYNTAX"];

type cell('a) = {label: string, body: list('a)};

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

let prettyList = (ss) => {
  let rec loop = (ss) =>
    switch (ss) {
    | [] => ""
    | [s] => s
    | [s, ...ss] => s ++ ", " ++ loop(ss)
    };
  "[" ++ loop(ss) ++ "]"
};

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

type theiaIR =
  | Atom(ReasonReact.reactElement)
  | Apply2(list(ReasonReact.reactElement), list(theiaIR))
  | EvalCtx(evalCtx)
  | HSequence(list(theiaIR)) /* horizontal sequencing */
  | VSequence(list(theiaIR)) /* vertical sequencing */
  | Map2(list(theiaIR))
  | Kont2(theiaIR, list(evalCtx))
  | KV2((theiaIR, theiaIR))
  | Value2(list(string), list(theiaIR))
  | Cell2(string, list(theiaIR))
and evalCtx = {ops: list(ReasonReact.reactElement), args: list(theiaIR), holePos: int};

let rec theiaIRDebugPrint = (k) =>
  switch (k) {
  | Atom(s) => "Atom(" ++ /* s ++ */ ")"
  | Apply2(ss, args) => "Apply2(" /* ++ prettyList(List.map((s) => "\"" ++ s ++ "\"", ss)) */ ++ ", " ++ prettyList(List.map(theiaIRDebugPrint, args)) ++ ")"
  | Value2(ss, args) => "Value2(" ++ prettyList(List.map((s) => "\"" ++ s ++ "\"", ss)) ++ ", " ++ prettyList(List.map(theiaIRDebugPrint, args)) ++ ")"
  | EvalCtx(f) => "EvalCtx(" ++ debugFreezer(f) ++ ")"
  | Map2(l) => "Map2(" ++ (List.map(theiaIRDebugPrint, l) |> prettyList) ++ ")"
  | Kont2(e, fs) => "Kont2(" ++ theiaIRDebugPrint(e) ++ ", " ++ (List.map(debugFreezer, fs) |> prettyList) ++ ")"
  | KV2((k, v)) => "KV2(" ++ theiaIRDebugPrint(k) ++ ", " ++ theiaIRDebugPrint(v) ++ ")"
  | Cell2(s, args) => "Cell2(" ++ s ++ ", " ++ prettyList(List.map(theiaIRDebugPrint, args)) ++ ")"
  | _ => "TODO"
  }
and debugEntry2 = ((k, v)) => theiaIRDebugPrint(k) ++ "->" ++ theiaIRDebugPrint(v)
and debugFreezer = ({ops, args, holePos}) => {
  "evalctx(" ++ /* prettyList(List.map((s) => "\"" ++ s ++ "\"", ops)) ++ */ ", " ++ prettyList(List.map(theiaIRDebugPrint, args)) ++ ", " ++ string_of_int(holePos) ++ ")"
};

let rec theiaIRDebugPrintShort = (k) =>
  switch (k) {
  | Atom(_) => "Tk"
  | Apply2(_, args) => "App(" ++ prettyList(List.map(theiaIRDebugPrintShort, args)) ++ ")"
  | EvalCtx(_) => "Fz"
  | Map2(_) => "Map"
  | Kont2(_) => "Kont"
  | KV2(_) => "KV"
  | Value2(_, args) => "Val(" ++ prettyList(List.map(theiaIRDebugPrintShort, args)) ++ ")"
  | Cell2(_, args) => "Cell(" ++ prettyList(List.map(theiaIRDebugPrintShort, args)) ++ ")"
  | _ => "TODO"
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

/* and finally pretty printing! */
let render_open_brack = <span style=(ReactDOMRe.Style.make(~color="blue", ()))> {ReasonReact.string("[")} </span>;
let render_close_brack = <span style=(ReactDOMRe.Style.make(~color="blue", ()))> {ReasonReact.string("]")} </span>;

let rec kn2Pretty = (~parens=true, k) =>
  switch (k) {
  | Atom(s) => s
  | Apply2(ops, args) => Util.interleave(ops, List.map(kn2Pretty, args)) |> Util.prettierList(~parens, ~space=false)
  | EvalCtx(_) => raise(CompileError("There shouldn't be a EvalCtx!"))
  /* | Sequence(l) => <> {Util.interleave(List.map(kn2Pretty, l), (1--(List.length(l) - 1)) |> List.map(_ => React.string(" ~> "))) |> Util.prettierList} </> */
  | VSequence([kn]) => <> {kn2Pretty(~parens=false, kn)} </>
  | VSequence(l) => <> {List.mapi((i, kn) => <div key={string_of_int(i)} style=(ReactDOMRe.Style.make(~marginTop="10px", ()))> {kn2Pretty(~parens=false, kn)} </div>, l) /* |> List.rev */ |> Array.of_list |> React.array} </>
  | HSequence([kn]) => <> {kn2Pretty(~parens=false, kn)} </>
  | HSequence(l) => <div style=(ReactDOMRe.Style.make(~float="left", ()))> {List.mapi((i, kn) => <div key={string_of_int(i)} style=(ReactDOMRe.Style.make(~float="left", ~marginLeft="10px", ()))> {kn2Pretty(~parens=false, kn)} </div>, l) |> List.rev |> Array.of_list |> React.array} </div>
  | Map2([]) => kn2Pretty(Map2([KV2((Atom(Util.nbsp), Atom(Util.nbsp)))]))
  | Map2(l) => /* https://stackoverflow.com/a/3349181 */
      <table style=(ReactDOMRe.Style.make(~borderCollapse="collapse", ~borderStyle="hidden", ~display="inline-table", ()))>
        <thead>
            <tr>
                <th style=(ReactDOMRe.Style.make(~border="1px solid black", ~paddingRight="5px", ~textAlign="right", ()))> {React.string("Id")} </th>
                <th style=(ReactDOMRe.Style.make(~border="1px solid black", ~paddingLeft="5px", ~textAlign="left", ()))> {React.string("Val")} </th>
            </tr>
        </thead>
        <tbody>
          {
            l|>List.mapi((i, kv) => 
              <tr key=(string_of_int(i))>
                {kn2Pretty(kv)}
              </tr>)|>Array.of_list|>React.array
          }
        </tbody>
      </table>
  | Kont2(kn, fs) => prettyKont2List(~parens=false, kn, List.rev(fs))
  | KV2((k, v)) =>
      <>
        <td style=(ReactDOMRe.Style.make(~borderRight="1px solid black", ~paddingRight="5px", ~paddingTop="5px", ~textAlign="right", ()))> {kn2Pretty(k)} </td>
        <td style=(ReactDOMRe.Style.make(~borderLeft="1px solid black", ~paddingLeft="5px", ~paddingTop="5px", ~textAlign="left", ()))> {kn2Pretty(v)} </td>
      </>
  /* Simple values don't get big borders. */
  | Value2([], [arg]) =>
    <table style=(ReactDOMRe.Style.make(~display="inline-table", ()))>
        <tbody>
          <tr>
            <td style=(ReactDOMRe.Style.make(~border="1px solid gray", ()))> {kn2Pretty(~parens=false, arg)} </td>
          </tr>
        </tbody>
      </table>
  | Value2(ops, args) =>
    <fieldset style=(ReactDOMRe.Style.make(~display="inline", ()))>
      <legend> {Util.interleave(ops, (1--(List.length(ops) - 1)) |> List.map(_ => "•")) |> List.fold_left((++), "") |> React.string} </legend>
      /* {Util.interleave(List.map(kn2Pretty, args), (1--(List.length(args) - 1)) |> List.map(_ => React.string("|"))) |> Util.prettierList(~parens=false)} */
      /* TODO: add padding */
      <table style=(ReactDOMRe.Style.make(~display="inline-table", ()))>
        /* TODO: thead? */
        <tbody>
          <tr>
            {args |> List.mapi((i, arg) => <td key={string_of_int(i)} style=(ReactDOMRe.Style.make(~border="1px solid gray", ()))> {kn2Pretty(~parens=false, arg)} </td>) |> rlist}
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
/* and prettyFreeze = (~nestNum=0, {ops, args, holePos}, arg) => {
  let newArgs = Util.insert(<> render_open_brack arg render_close_brack </>, List.map(kn2Pretty, args), holePos);
  Util.interleave(ops, newArgs) |> Util.prettierList(~parens=false, ~space=false)
} */
/* underline style */
/* and prettyFreeze = (~nestNum=0, {ops, args, holePos}, arg) => {
  let newArgs = Util.insert(<span style=(ReactDOMRe.Style.make(~borderBottom="2px solid blue", ~paddingBottom=(string_of_int(nestNum*3) ++ "px"), ()))> arg </span>, List.map(kn2Pretty, args), holePos);
  Util.interleave(ops, newArgs) |> Util.prettierList(~parens=false, ~space=false)
} */
/* Hazel-style highlighting */
and prettyFreeze = (~nestNum=0, {ops, args, holePos}, arg) => {
  /* TODO: figure out opacity and lightness automatically based on max depth? sacrifices some completeness otherwise */
//   let parens = nestNum == 0 ? false : true;
  let newArgs = Util.insert(<div style=(ReactDOMRe.Style.make(~display="inline", ~backgroundColor="hsla(240, 100%, " ++ string_of_int(80 - nestNum*10) ++ "%, 0.33)", ()))> arg </div>, List.map(kn2Pretty, args), holePos);
  Util.interleave(ops, newArgs) |> Util.prettierList(~parens=false, ~space=false)
}
and prettyKont2List = (~nestNum=0, ~parens=false, kn, fs) =>
  switch (fs) {
  | [] => kn2Pretty(~parens, kn)
  | [f, ...fs] => prettyFreeze(~nestNum, f, prettyKont2List(~nestNum=nestNum+1, ~parens, kn, fs))
  }
and kn2PrettyList = (xs) => xs |> List.map((s) => <div style=(ReactDOMRe.Style.make(~fontSize="14px", ()))> {kn2Pretty(s)} </div>) |> List.fold_left((s1, s2) => <> s1 s2 </>, <> </>);

let fetchLoggedStates = (file, callback) => {
  Js.Promise.(
    Fetch.fetch(file)
    |> then_(Fetch.Response.json)
    |> then_(json => { resolve(callback(json)) })
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
  | TheiaIR
  | TheiaIRShort
  | Json
  | Theia;

/* TODO: error handling */
let handleClick = (~path, ~log, ~print=Theia, ~theiaIRTrace, dispatch, _event) => {
    dispatch(UpdateMachineState({k: List.map(kn2Pretty, theiaIRTrace)}));
  /* let callback = (json) =>
    switch (print) {
    // | KNode => json |> Decode.kAst |> List.mapi((i, ast) => <div key={string_of_int(i)}> {ast |> kNodeDebugPrint |> React.string} </div>) |> rlist
    // | TheiaIR => json |> Decode.kAst |> List.map(ast => ast |> kNodeToTheiaIR |> theiaIRDebugPrint |> React.string) |> rlist
    // | TheiaIRShort => json |> Decode.kAst |> List.map(ast => ast |> kNodeToTheiaIR |> theiaIRDebugPrintShort |> React.string) |> rlist
    // | Json => json |> Json.stringify |> React.string
    // | Theia => json |> Decode.kAst |> List.map(kNodeToTheiaIR) |> kn2PrettyList
    | Theia => theiaIRTrace |> kn2PrettyList
    | _ => raise(failwith("unsupported print method"))
    /* | SeqDebug =>
        <>
        <div>
          (json |> Decode.kAst |> List.map(ast => ast |> kNodeDebugPrint |> React.string) |> Array.of_list |> React.array)
        </div>
        <div>
          (json |> Decode.kAst |> List.map(ast => ast |> kNodeToSeqDebug |> seqDebugPrint |> React.string) |> Array.of_list |> React.array)
        </div>
        </> */
    }; */

  /* let fetchedLogStateIDs = fetchLogStateIDs(path ++ log);
  Js.Promise.(fetchedLogStateIDs |> then_((fetched) => fetched |> List.fold_left(
    (p, file) => p |> then_((s1) => {
      fetchLoggedStates(path ++ "null_blobs/" ++ file ++ ".json", callback) |> then_(s2 => resolve(s1 @ [s2]))
    }),
    resolve([]),
    _)
    |> then_((s) => {dispatch(UpdateMachineState({k: s})); resolve()})))
    |> ignore; */
};

type trace = { name: string, states: list(theiaIR) };

type traceOutput = {path: string, log: string, name: string};

[@react.component]
let make = (~theiaIRTraces: list(trace)) => {
  let (state, dispatch) = React.useReducer((state, action) =>
  switch (action) {
  | UpdateMachineState(s) => {trace: Some(s.k), currentConfig: 0}
  | StepBack => {...state, currentConfig: max(0, state.currentConfig - 1)}
  | StepForward => {...state, currentConfig: min(state.currentConfig + 1, List.length(Belt.Option.getWithDefault(state.trace, [<> </>])) - 1)}
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
    {theiaIRTraces |> List.map(({states, name}) =>
        <button onClick={handleClick(~path="", ~log="", ~theiaIRTrace=states, dispatch)}>
          {React.string(name)}
        </button>) |> rlist}
    {
      let renderConfig = (my_option) =>
        switch (my_option) {
        | None => <> </>
        | Some(v) => v
        };

      switch (state.trace) {
      | None => <> </>
      | Some(s) =>
        /* https://www.joomlashack.com/blog/tutorials/center-and-align-items-in-css-grid/ */
        let boxSize = 350;
        <div style=(ReactDOMRe.Style.make(~display="grid", ~gridTemplateColumns="fit-content(350px) 20px fit-content(350px) 20px fit-content(350px)", ~alignItems="center", ()))>
          <div style=(ReactDOMRe.Style.make(~float="left", ~maxWidth=(string_of_int(boxSize) ++ "px"), ()))>
            /* {s->Belt.List.get(state.currentConfig - 1)->renderConfig} */
            {s->Belt.List.get(state.currentConfig)->renderConfig}
            /* {s->Belt.List.get(state.currentConfig + 1)->renderConfig} */
          </div>
          <div style=(ReactDOMRe.Style.make(~float="left", ~textAlign="center", ()))>
            <b> {React.string("->")} </b>
          </div>
          <div style=(ReactDOMRe.Style.make(~float="left", ~maxWidth=(string_of_int(boxSize) ++ "px"), ()))>
            <ReactVisualDiff
              left={s->Belt.List.get(state.currentConfig)->renderConfig}
              right={s->Belt.List.get(state.currentConfig + 1)->renderConfig}
              diffProps={[|"children", "type", "className", "style"|]}
            />
          </div>
          <div style=(ReactDOMRe.Style.make(~float="left", ~textAlign="center", ()))>
            <b> {React.string("->")} </b>
          </div>
          <div style=(ReactDOMRe.Style.make(~float="left", ~maxWidth=(string_of_int(boxSize) ++ "px"), ()))>
          {s->Belt.List.get(state.currentConfig + 1)->renderConfig}
          </div>
        </div>
      }
    }
  </div>;
};
