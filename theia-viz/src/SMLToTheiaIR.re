/* Compiler from SML configuration to TheiaIR */
open SMLLec1;
open TheiaSML;

let sorry = Atom("sorry");
let sorryFn = (_) => sorry;

let compileSMLAST = (ast) =>
  switch (ast) {
    | Int(n) => Atom(string_of_int(n))
    | _ => raise(failwith("unimplemented SML AST compile to TheiaIR"))
  };

let compileSMLValue = (v) =>
  switch (v) {
    | VInt(n) => Value2([], [Atom(string_of_int(n))])
  };

let compileAstOrValue = (aov) =>
  switch (aov) {
    | AST(ast) => compileSMLAST(ast)
    | Value(v) => compileSMLValue(v)
  };

let compileSMLEvalCtx = (ec) => raise(failwith("unimplemented ec compilation"));

/* turn into a Map2 of KV2's. */
let compileKVs = ((k, v)) => KV2((Atom(k), compileSMLValue(v)))
let compileStack = (s) => Map2(List.map(compileKVs, s));

let compileRewrite = ({astOrValue, ctxs}) => Kont2(compileAstOrValue(astOrValue), List.map(compileSMLEvalCtx, ctxs));

let compileFrame = ({stack, rewrite}) => Sequence2([compileRewrite(rewrite), compileStack(stack)]);

let smlToTheiaIR = (c) => Cell2("frames", List.map(compileFrame, c));
