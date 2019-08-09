/* TODO: leave program section out/unused for now. It only complicates things. */
/* sml AST */
/* Building up a very wrong, very simplistic SML interpreter. Grammar is not correct. */
type smlAST =
  | Int(int)
  | Plus(smlAST, smlAST)
  | Var(string)
  | ValList(list((string, smlAST)));

type smlValue =
  | VInt(int);

type hole = ();

type smlEvalCtx =
  | ECPlusL(hole, smlAST)
  | ECPlusR(smlValue, hole)
  | ECValList((string, hole), list((string, smlAST)));

let ex0 = Int(5);

/* A prefix of "My first ML program" from lecture 1. */
let exLec1 = ValList([("x", Int(34)),
                   ("y", Int(17)),
                   ("z", Plus(Plus(Var("x"), Var("y")), Plus(Var("y"), Int(2))))]);

/* Configuration (i.e. AM state description) */
/* TODO: write evaluation contexts  */
/* TODO: add closure section to configuration. might also include ADTs there.
sort of a heap */
/* TODO: need pointers to the old evaluation area somehow. */
/* TODO: show rewrite history or not? */
/* TODO: pretty print configuration so it can be logged well. */
type stack = list((string, smlValue));
type astOrValue =
  | AST(smlAST)
  | Value(smlValue);
type rewrite = { astOrValue, ctxs: list(smlEvalCtx) };
type frame = { stack, rewrite }
type configuration = list(frame);

let eval = (c) =>
  switch (c) {
    /* rewrite */
    | [{ stack, rewrite: {astOrValue: AST(Int(n)), ctxs: []} }] =>
      [{ stack, rewrite: {astOrValue: Value(VInt(n)), ctxs: []} }]
    | _ => raise(failwith("unimplemented case"))
  };

let inject = (e) => {
  [{ stack: [], rewrite: { astOrValue: AST(e), ctxs: []} }]
};

let interpret = p => p |> inject |> eval;
