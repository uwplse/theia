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
    /* | ECValList((x, ()), bindings) => {ops: [React.string("val "), React.string(" = "), <> {React.string(";")} <br /> </>, React.string("")], args: [Atom(React.string(x)), Sequence2(List.map(((x, e)) => Apply2([React.string("val "), React.string(" = "), <> {React.string(";")} <br /> </>], [Atom(React.string(x)), compileSMLAST(e)]), bindings))], holePos: 1} */
    | ECValList(bindings, i) =>
        /* TODO: this is ugly! */
        let rec loop = (bs, idx) =>
        switch (bs) {
            | [] => ([], [])
            | [(x, e), ...bs] => 
                if (idx == i) {
                    let (ops, args) = ([React.string("val "), React.string(" = "), <> {React.string(";")} <br /> </>],
                    [Atom(React.string(x))]);
                    let (loop_ops, loop_args) = loop(bs, idx+1);
                    (ops @ loop_ops, args @ [Atom(React.string(""))] @ loop_args)
                } else {
                    let (ops, args) = ([React.string("val "), React.string(" = "), <> {React.string(";")} <br /> </>],
                                       [Atom(React.string(x)), compileSMLAST(e)]);
                    let (loop_ops, loop_args) = loop(bs, idx+1);
                    (ops @ loop_ops, args @ [Atom(React.string(""))] @ loop_args);
                }
        };
        let (ops, args) = loop(bindings, 0);
        {ops, args, holePos: 3*i+1}
    /* | _ => raise(failwith("todo")) */
  };

/* turn into a Map2 of KV2's. */
let compileKVs = ((k, v)) => KV2((Atom(React.string(k)), compileSMLValue(v)))
let compileStack = (s) => Map2(List.map(compileKVs, s) |> List.rev);

let compileRewrite = (rw: option(rewrite)) => 
  switch (rw) {
    | Some({focus, ctxs}) => Kont2(compileSMLAST(focus), List.map(compileSMLEvalCtx, ctxs));
    | None => Atom(React.string(""))
  };

let compileFrame = ({stack, rewrite}) => Sequence2([compileStack(stack), compileRewrite(rewrite)]);

let compileProgram = ({focus, ctxs}: program) => 
  switch (focus) {
    | Some(focus) => Kont2(compileSMLAST(focus), List.map(compileSMLEvalCtx, ctxs))
    | None => Atom(React.string(""))
  };

let smlToTheiaIR = ({program, frames}) => Sequence2([Cell2("program", [compileProgram(program)]), Cell2("frames", List.map(compileFrame, frames))]);
