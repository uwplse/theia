/* Compiler from SML configuration to TheiaIR */
open SMLLec1;
open TheiaSML;
open Util;

/* I really wish there was a way to write sorry in OCaml/Reason! */
let sorry = Atom(React.string("sorry"));
let sorryFn = (_) => sorry;

let compileSMLValue = (v) =>
  switch (v) {
    | VInt(n) => Value2([], [Atom(React.string(string_of_int(n)))])
  };

/* TODO: fix the off-by-one error with linebreaks getting captured in evaluation contexts. */
let rec compileExpr = (ast) =>
  switch (ast) {
    | Int(n) => Atom(React.string(string_of_int(n)))
    | Plus(e1, e2) => Apply2([<> </>, React.string(" + "), <> </>], List.map(compileExpr, [e1, e2]))
    | Var(x) => Atom(React.string(x))
    | Value(v) => compileSMLValue(v)
    /* TODO: don't use sequences */
    | ValList([vb]) => Apply2([React.string("val "), React.string(";")], [compileValBind(vb)])
    | ValList(bindings) => 
        let ops = [React.string("val ")] @ ((1--(List.length(bindings) - 1)) |> List.fold_left((l, _) => [<> {React.string(";")} <br /> {React.string("val ")} </>, ...l], [])) @ [React.string(";")];
        Apply2(ops, List.map(compileValBind, bindings))
    /* | _ => raise(failwith("unimplemented SML AST compile to TheiaIR")) */
  }
and compileValBind = (vb) =>
    switch (vb) {
      | ValBind(x, e) => Apply2([<> </>, React.string(" = "), <> </>], [Atom(React.string(x)), compileExpr(e)])
    };

/* {ops: list(string), args: list(theiaIR), holePos: int} */
let compileSMLEvalCtx = (ec) =>
  switch (ec) {
    | ECPlusL((), e2) => {ops: [<> </>, React.string(" + "), <> </>], args: [compileExpr(e2)], holePos: 0}
    | ECPlusR(v1, ()) => {ops: [<> </>, React.string(" + "), <> </>], args: [compileSMLValue(v1)], holePos: 1}
    | ECValBindVar((), e) => {ops: [<> </>, React.string(" = "), <> </>], args: [compileExpr(e)], holePos: 0}
    | ECValBindExpr(x, ()) => {ops: [<> </>, React.string(" = "), <> </>], args: [Atom(React.string(x))], holePos: 1}
    | ECValList2(prevBindings, (), nextBindings) =>
        let ops = [React.string("val ")] @ ((1--(List.length(prevBindings) + List.length(nextBindings))) |> List.fold_left((l, _) => [<> {React.string(";")} <br /> {React.string("val ")} </>, ...l], [])) @ [React.string(";")];
        {ops, args: List.map(compileValBind, prevBindings @ nextBindings), holePos: List.length(prevBindings)}
    | ECValList(bindings, i) =>
        /* TODO: this is ugly! */
        let rec loop = (~newline=true, bs, idx) =>
        switch (bs) {
            | [] => ([], [])
            | [vb, ...bs] => 
                if (idx == i) {
                    /* let (ops, args) = ([React.string("val "), React.string(" = "), <> {React.string(";")} <br /> </>],
                    [compileExpr(e)]);
                    let (loop_ops, loop_args) = loop(bs, idx+1);
                    (ops @ loop_ops, args @ [Atom(<> </>)] @ loop_args) */
                    let (loop_ops, loop_args) = loop(bs, idx+1);
                    ([<> </>, ...loop_ops], loop_args)
                } else {

                    let (ops, args) = ([React.string("val "), React.string(";")],
                                       [compileValBind(vb)]);
                    let (loop_ops, loop_args) = loop(bs, idx+1);
                    if (newline) {
                        ([<br />] @ ops @ loop_ops, [Atom(<> </>)] @ args @ loop_args)
                    } else {
                        (ops @ loop_ops, args @ loop_args)
                    }
                }
        };
        let (ops, args) = loop(bindings, 0);
        {ops, args, holePos: 2*i}
    | ECValListVar(bindings, i) =>
        /* TODO: this is ugly! */
        let rec loop = (bs, idx) =>
        switch (bs) {
            | [] => ([], [])
            | [ValBind(x, e), ...bs] => 
                if (idx == i) {
                    let (ops, args) = ([React.string("val "), React.string(" = "), <> {React.string(";")} <br /> </>],
                    [compileExpr(e)]);
                    let (loop_ops, loop_args) = loop(bs, idx+1);
                    (ops @ loop_ops, args @ [Atom(<> </>)] @ loop_args)
                } else {
                    let (ops, args) = ([React.string("val "), <> {React.string(";")} <br /> </>],
                                       [compileValBind(ValBind(x, e))]);
                    let (loop_ops, loop_args) = loop(bs, idx+1);
                    (ops @ loop_ops, args @ [Atom(<> </>)] @ loop_args);
                }
        };
        let (ops, args) = loop(bindings, 0);
        {ops, args, holePos: 3*i}
    | ECValListExpr(bindings, i) =>
        /* TODO: this is ugly! */
        let rec loop = (bs, idx) =>
        switch (bs) {
            | [] => ([], [])
            | [ValBind(x, e), ...bs] => 
                if (idx == i) {
                    let (ops, args) = ([React.string("val "), React.string(" = "), <> {React.string(";")} <br /> </>],
                    [Atom(React.string(x))]);
                    let (loop_ops, loop_args) = loop(bs, idx+1);
                    (ops @ loop_ops, args @ [Atom(<> </>)] @ loop_args)
                } else {
                    let (ops, args) = ([React.string("val "), <> {React.string(";")} <br /> </>],
                                       [compileValBind(ValBind(x, e))]);
                    let (loop_ops, loop_args) = loop(bs, idx+1);
                    (ops @ loop_ops, args @ [Atom(<> </>)] @ loop_args);
                }
        };
        let (ops, args) = loop(bindings, 0);
        {ops, args, holePos: 3*i+1}
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
