/* TODO:
    - push ex0 through whole pipeline
    - implement plus
    - implement val binding
        - entirely in rewrite section, no nesting
        - with a program counter in a program section that controls flow and sends subexpressions to the rewrite area
        - with nested lets creating a sequence of frames
 */

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

let step = (c) =>
  switch (c) {
    /* rewrite */
    | [{ stack, rewrite: {astOrValue: AST(Int(n)), ctxs: []} }] =>
      Some([{ stack, rewrite: {astOrValue: Value(VInt(n)), ctxs: []} }])
    | _ => None
  };

let inject = (e) => {
  [{ stack: [], rewrite: { astOrValue: AST(e), ctxs: []} }]
};

/* 
-- https://stackoverflow.com/a/22472610
takeWhileInclusive :: (a -> Bool) -> [a] -> [a]
takeWhileInclusive _ [] = []
takeWhileInclusive p (x:xs) = x : if p x then takeWhileInclusive p xs
                                         else []
 */

/* https://stackoverflow.com/a/22472610 */
let rec takeWhileInclusive = (p, l) =>
  switch (l) {
    | [] => []
    | [x, ...xs] => [x, ...(if (p(x)) { takeWhileInclusive(p, xs) }
                                 else { [] })]
  };

let rec iterateMaybeAux = (f, x) =>
  switch (x) {
    | None => []
    | Some(x) =>
        let fx = f(x);
        [x, ...iterateMaybeAux(f, fx)]
    };

let iterateMaybe = (f, x) => iterateMaybeAux(f, Some(x));

let isNone = (o) =>
  switch (o) {
    | None => true
    | _ => false
  };

let isFinal = (c) =>
  switch (c) {
    | [] => true
    | [{ rewrite: {astOrValue: Value(_), ctxs: []} }] => true
    | _ => false
  };

/* This is more robust in a lazy language! */
let interpretTrace = (p) => takeWhileInclusive((c) => !isFinal(c), iterateMaybe(step, inject(p)));
