/* Compiler from SML configuration to TheiaIR */
open SMLLec1;
open TheiaSML;

/* I really wish there was a way to write sorry in OCaml/Reason! */
let sorry = Atom(React.string("sorry"));
let sorryFn = (_) => sorry;

let compileSMLValue = (v) =>
  switch (v) {
    | VInt(n) => Value2([], [Atom(React.string(string_of_int(n)))])
  };

/* TODO: these really shouldn't be strings but arbitrary HTML! That way newlines can be easy.
    For now formatting will just be ass. */
let rec compileSMLAST = (ast) =>
  switch (ast) {
    | Int(n) => Atom(React.string(string_of_int(n)))
    | Plus(e1, e2) => Apply2([React.string(""), React.string(" + "), React.string("")], List.map(compileSMLAST, [e1, e2]))
    | Var(x) => Atom(React.string(x))
    | Value(v) => compileSMLValue(v)
    /* TODO: don't use sequences */
    | ValList(bindings) => Sequence2(List.map(((x, e)) => Apply2([React.string("val "), React.string(" = "), <> {React.string(";")} <br /> </>], [Atom(React.string(x)), compileSMLAST(e)]), bindings))
    /* | _ => raise(failwith("unimplemented SML AST compile to TheiaIR")) */
  };

/* {ops: list(string), args: list(theiaIR), holePos: int} */
let compileSMLEvalCtx = (ec) =>
  switch (ec) {
    | ECPlusL((), e2) => {ops: [React.string(""), React.string(" + "), React.string("")], args: [compileSMLAST(e2)], holePos: 0}
    | ECPlusR(v1, ()) => {ops: [React.string(""), React.string(" + "), React.string("")], args: [compileSMLValue(v1)], holePos: 1}
    /* TODO: do for arbitrary lists */
    | ECValList((x, ()), bindings) => {ops: [React.string("val "), React.string(" = "), <> {React.string(";")} <br /> </>, React.string("")], args: [Atom(React.string(x)), Sequence2(List.map(((x, e)) => Apply2([React.string("val "), React.string(" = "), <> {React.string(";")} <br /> </>], [Atom(React.string(x)), compileSMLAST(e)]), bindings))], holePos: 1}
    /* | _ => raise(failwith("todo")) */
  };

/* turn into a Map2 of KV2's. */
let compileKVs = ((k, v)) => KV2((Atom(React.string(k)), compileSMLValue(v)))
let compileStack = (s) => Map2(List.map(compileKVs, s) |> List.rev);

let compileRewrite = ({smlAST, ctxs}: rewrite) => Kont2(compileSMLAST(smlAST), List.map(compileSMLEvalCtx, ctxs));

let compileFrame = ({stack, rewrite}) => Sequence2([compileStack(stack), compileRewrite(rewrite)]);

let compileProgram = ({smlAST, ctxs}: program) => Kont2(compileSMLAST(smlAST), List.map(compileSMLEvalCtx, ctxs));

let smlToTheiaIR = ({program, frames}) => Sequence2([Cell2("program", [compileProgram(program)]), Cell2("frames", List.map(compileFrame, frames))]);
