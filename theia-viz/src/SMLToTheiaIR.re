/* Compiler from SML configuration to TheiaIR */
open SMLLec1;
open TheiaSML;

/* I really wish there was a way to write sorry in OCaml/Reason! */
let sorry = Atom("sorry");
let sorryFn = (_) => sorry;

let compileSMLValue = (v) =>
  switch (v) {
    | VInt(n) => Value2([], [Atom(string_of_int(n))])
  };

let rec compileSMLAST = (ast) =>
  switch (ast) {
    | Int(n) => Atom(string_of_int(n))
    | Plus(e1, e2) => Apply2(["", "+", ""], List.map(compileSMLAST, [e1, e2]))
    | Var(x) => Atom(x)
    | Value(v) => compileSMLValue(v)
    | _ => raise(failwith("unimplemented SML AST compile to TheiaIR"))
  };

/* {ops: list(string), args: list(theiaIR), holePos: int} */
let compileSMLEvalCtx = (ec) =>
  switch (ec) {
    | ECPlusL((), e2) => {ops: ["", "+", ""], args: [compileSMLAST(e2)], holePos: 0}
    | ECPlusR(v1, ()) => {ops: ["", "+", ""], args: [compileSMLValue(v1)], holePos: 1}
    | _ => raise(failwith("todo"))
  };

/* turn into a Map2 of KV2's. */
let compileKVs = ((k, v)) => KV2((Atom(k), compileSMLValue(v)))
let compileStack = (s) => Map2(List.map(compileKVs, s) |> List.rev);

let compileRewrite = ({smlAST, ctxs}) => Kont2(compileSMLAST(smlAST), List.map(compileSMLEvalCtx, ctxs));

let compileFrame = ({stack, rewrite}) => Sequence2([compileRewrite(rewrite), compileStack(stack)]);

let smlToTheiaIR = (c) => Cell2("frames", List.map(compileFrame, c));
