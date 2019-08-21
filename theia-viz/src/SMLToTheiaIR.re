/* Compiler from SML configuration to TheiaIR */
open SMLLec1;
open TheiaSML;
open Util;

/* I really wish there was a way to write sorry in OCaml/Reason! */
let sorry = Atom(React.string("sorry"));
let sorryFn = (_) => sorry;

let compileBinop = (bop) =>
    switch (bop) {
        | Plus => Atom(React.string("+"))
    };

let compileSMLValue = (v) =>
  switch (v) {
    | VInt(n) => Value2([], [Atom(React.string(string_of_int(n)))])
    | VBinop(bop) => Value2([], [compileBinop(bop)])
  };

/* TODO: fix the off-by-one error with linebreaks getting captured in evaluation contexts. */
let rec compileExpr = (ast) =>
  switch (ast) {
    | Int(n) => Atom(React.string(string_of_int(n)))
    | BinopCall(e1, bop, e2) => Apply2([<> </>, React.string(" "), React.string(" "), <> </>], [compileExpr(e1), compileBinop(bop), compileExpr(e2)])
    | BinopCallExit(e1, bop, e2) => Apply2([<> </>, React.string(" "), React.string(" "), <> </>], [compileExpr(e1), compileBinop(bop), compileExpr(e2)])
    | Var(x) => Atom(React.string(x))
    | Value(v) => compileSMLValue(v)
    /* TODO: don't use sequences */
    | ValList([vb]) => Apply2([React.string("val "), React.string(";")], [compileValBind(vb)])
    | ValList(bindings) => 
        let ops = [React.string("val ")] @ ((1--(List.length(bindings) - 1)) |> List.fold_left((l, _) => [<> {React.string(";")} <br /> {React.string("val ")} </>, ...l], [])) @ [React.string(";")];
        Apply2(ops, List.map(compileValBind, bindings))
    | Binop(bop) => compileBinop(bop)
    /* | _ => raise(failwith("unimplemented SML AST compile to TheiaIR")) */
  }
and compileValBind = (vb) =>
    switch (vb) {
      | ValBind(x, e) => Apply2([<> </>, React.string(" = "), <> </>], [Atom(React.string(x)), compileExpr(e)])
    };

/* {ops: list(string), args: list(theiaIR), holePos: int} */
let compileSMLEvalCtx = (ec) =>
  switch (ec) {
    | ECBinopCallL((), bop, e2) => {ops: [<> </>, React.string(" "), React.string(" "), <> </>], args: [compileBinop(bop), compileExpr(e2)], holePos: 0}
    | ECBinopCallBOp(e1, (), e2) => {ops: [<> </>, React.string(" "), React.string(" "), <> </>], args: [compileExpr(e1), compileExpr(e2)], holePos: 1}
    | ECBinopCallR(e1, bop, ()) => {ops: [<> </>, React.string(" "), React.string(" "), <> </>], args: [compileExpr(e1), compileBinop(bop)], holePos: 2}
    | ECValBindVar((), e) => {ops: [<> </>, React.string(" = "), <> </>], args: [compileExpr(e)], holePos: 0}
    | ECValBindExpr(x, ()) => {ops: [<> </>, React.string(" = "), <> </>], args: [Atom(React.string(x))], holePos: 1}
    | ECValListEnter(prevBindings, (), nextBindings) =>
        let ops = [React.string("val ")] @ ((1--(List.length(prevBindings) + List.length(nextBindings))) |> List.fold_left((l, _) => [<> {React.string(";")} <br /> {React.string("val ")} </>, ...l], [])) @ [React.string(";")];
        {ops, args: List.map(compileValBind, prevBindings @ nextBindings), holePos: List.length(prevBindings)}
    | ECValListExit(prevBindings, (), nextBindings) =>
        let ops = [React.string("val ")] @ ((1--(List.length(prevBindings) + List.length(nextBindings))) |> List.fold_left((l, _) => [<> {React.string(";")} <br /> {React.string("val ")} </>, ...l], [])) @ [React.string(";")];
        {ops, args: List.map(compileValBind, prevBindings @ nextBindings), holePos: List.length(prevBindings)}
    | ECVBinopCallBOp(v1, ()) => {ops: [<> </>, React.string(" "), <> </>], args: [compileSMLValue(v1)], holePos: 1}
    | ECVBinopCallR(v1, bop, ()) => {ops: [<> </>, React.string(" "), React.string(" "), <> </>], args: [compileSMLValue(v1), compileSMLValue(bop)], holePos: 2}
    /* | _ => raise(failwith("todo")) */
  };

/* turn into a Map2 of KV2's. */
let compileKVs = ((k, v)) => 
    switch (v) {
        | None => KV2((Atom(React.string(k)), Atom(<> </>)))
        | Some(v) => KV2((Atom(React.string(k)), compileSMLValue(v)))
    };
let compileStack = (s) => Map2(List.map(compileKVs, s) |> List.rev);

let compileRewrite = (rw: option(rewrite)) => 
  switch (rw) {
    | Some({focus, ctxs}) => Kont2(compileExpr(focus), List.map(compileSMLEvalCtx, ctxs));
    | None => Atom(<> </>)
  };

let compileFrame = ({stack, rewrite}) => Sequence2([compileStack(stack), compileRewrite(rewrite)]);

let compileGrammar = (g) =>
    switch (g) {
        | Expr(e) => compileExpr(e)
        | VB(vb) => compileValBind(vb)
    };

let compileProgram = ({focus, ctxs}: program) => Kont2(compileGrammar(focus), List.map(compileSMLEvalCtx, ctxs))

let smlToTheiaIR = ({program, frames}) => Sequence2([Cell2("program", [compileProgram(program)]), Cell2("frames", List.map(compileFrame, frames))]);
