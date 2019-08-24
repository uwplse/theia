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

let rec compileSMLValue = (v) =>
  switch (v) {
    | VInt(n) => Value2([], [Atom(React.string(string_of_int(n)))])
    | VBinop(bop) => Value2([], [compileBinop(bop)])
    /* TODO: this seems wrong? using Apply2 instead of Value2. should the middle one be smlValue? */
    | VBinopCall(v1, bop, v2) => Apply2([<> </>, React.string(" "), React.string(" "), <> </>], [compileSMLValue(v1), compileSMLValue(VBinop(bop)), compileSMLValue(v2)])
  };

/* TODO: fix the off-by-one error with linebreaks getting captured in evaluation contexts. */
let rec compileExpr = (ast) =>
  switch (ast) {
    | Int(n) => Atom(React.string(string_of_int(n)))
    | BinopCall(e1, bop, e2) => Apply2([<> </>, React.string(" "), React.string(" "), <> </>], [compileExpr(e1), compileBinop(bop), compileExpr(e2)])
    | BinopCallExit(e1, bop, e2) => Apply2([<> </>, React.string(" "), React.string(" "), <> </>], [compileExpr(e1), compileBinop(bop), compileExpr(e2)])
    | Var(x) => Atom(React.string(x))
    | Value(v) => compileSMLValue(v)
    | Binop(bop) => compileBinop(bop)
    | Let(d, e) => Apply2([React.string("let "), React.string(" in "), React.string(" end")], [compileDec(d), compileExpr(e)])
    /* | _ => raise(failwith("unimplemented SML AST compile to TheiaIR")) */
  }
and compileDec = (dec) =>
  switch (dec) {
    | ValList(bindings) => 
        let ops = [React.string("val ")] @ ((1--(List.length(bindings) - 1)) |> List.fold_left((l, _) => [<> {React.string(";")} <br /> {React.string("val ")} </>, ...l], [])) @ [React.string(";")];
        Apply2(ops, List.map(compileValBind, bindings))
    | ValListExit(bindings) =>
        let ops = [React.string("val ")] @ ((1--(List.length(bindings) - 1)) |> List.fold_left((l, _) => [<> {React.string(";")} <br /> {React.string("val ")} </>, ...l], [])) @ [React.string(";")];
        Apply2(ops, List.map(compileValBind, bindings))
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
    | ECLetDec((), e) => {ops: [React.string("let "), React.string(" in "), React.string(" end")], args: [compileExpr(e)], holePos: 0}
    | ECLetExpr(d, ()) => {ops: [React.string("let "), React.string(" in "), React.string(" end")], args: [compileDec(d)], holePos: 1}
    | ECValBindVar((), e) => {ops: [<> </>, React.string(" = "), <> </>], args: [compileExpr(e)], holePos: 0}
    | ECValBindExpr(x, ()) => {ops: [<> </>, React.string(" = "), <> </>], args: [Atom(React.string(x))], holePos: 1}
    | ECValListEnter(prevBindings, (), nextBindings) =>
        let ops = [React.string("val ")] @ ((1--(List.length(prevBindings) + List.length(nextBindings))) |> List.fold_left((l, _) => [<> {React.string(";")} <br /> {React.string("val ")} </>, ...l], [])) @ [React.string(";")];
        {ops, args: List.map(compileValBind, prevBindings @ nextBindings), holePos: List.length(prevBindings)}
    | ECValListExit(prevBindings, (), nextBindings) =>
        let ops = [React.string("val ")] @ ((1--(List.length(prevBindings) + List.length(nextBindings))) |> List.fold_left((l, _) => [<> {React.string(";")} <br /> {React.string("val ")} </>, ...l], [])) @ [React.string(";")];
        {ops, args: List.map(compileValBind, prevBindings @ nextBindings), holePos: List.length(prevBindings)}
    /* | _ => raise(failwith("todo")) */
  };

let compileSMLValueEvalCtx = (ecv) =>
  switch (ecv) {
    | ECVBinopCallBOp(v1, ()) => {ops: [<> </>, React.string(" "), <> </>], args: [compileSMLValue(v1)], holePos: 1}
    | ECVBinopCallR(v1, bop, ()) => {ops: [<> </>, React.string(" "), React.string(" "), <> </>], args: [compileSMLValue(v1), compileSMLValue(bop)], holePos: 2}
  };

/* turn into a Map2 of KV2's. */
let compileKVs = ((k, v)) => 
    switch (v) {
        | None => KV2((Atom(React.string(k)), Atom(<> </>)))
        | Some(v) => KV2((Atom(React.string(k)), compileSMLValue(v)))
    };
let compileStack = (s) => Map2(List.map(compileKVs, s) |> List.rev);

let compileRewrite = (rw) => 
  switch (rw) {
    | {focus: None, valCtxs} => Kont2(Atom(<> </>), List.map(compileSMLValueEvalCtx, valCtxs));
    | {focus: Some(e), valCtxs} => Kont2(compileExpr(e), List.map(compileSMLValueEvalCtx, valCtxs))
  };

let compileFrame = ({stack, rewrite}) => VSequence([compileStack(stack), compileRewrite(rewrite)]);

let compileGrammar = (g) =>
    switch (g) {
        | Expr(e) => compileExpr(e)
        | Dec(d) => compileDec(d)
        | VB(vb) => compileValBind(vb)
    };

let compileProgram = ({focus, ctxs}: program) => Kont2(compileGrammar(focus), List.map(compileSMLEvalCtx, ctxs))

let smlToTheiaIR = ({program, frames}) => VSequence([Cell2("program", [compileProgram(program)]), Cell2("frames", [HSequence(List.map(compileFrame, frames))])]);
