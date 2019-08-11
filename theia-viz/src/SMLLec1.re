/* TODO:
    - implement val binding
        - entirely in rewrite section, no nesting
        - with a program counter in a program section that controls flow and sends subexpressions to the rewrite area
          (add the program section back!)
        - with nested lets creating a sequence of frames
    - implement low-level variable lookup. will also give some indication of how to skip steps intelligently
 */
/* TODO: figure out how to do monads in reason/ocaml. there's some ppx stuff. */
/* Building up a very wrong, very simplistic SML interpreter. Grammar is not correct. */

type smlValue =
  | VInt(int);

type smlAST =
  | Int(int)
  | Plus(smlAST, smlAST)
  | Var(string)
  | ValList(list((string, smlAST)))
  /* needed for evaluation. shouldn't be produced by parser.
     allows us to write intermediate terms where subexpressions are already values. */
  | Value(smlValue);

type hole = unit;

type smlEvalCtx =
  | ECPlusL(hole, smlAST)
  | ECPlusR(smlValue, hole)
  | ECValList((string, hole), list((string, smlAST)));

let ex0 = Int(5);
let ex1 = Plus(Int(5), Int(5));
let ex2 = Plus(Int(1), Plus(Int(2), Int(3)));
let ex3 = Plus(Plus(Int(2), Int(3)), Int(1));
let ex4 = Plus(Var("x"), Int(2));
let ex5 = Plus(Var("x"), Var("y"));

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
type rewrite = { smlAST, ctxs: list(smlEvalCtx) };
type frame = { stack, rewrite }
type configuration = list(frame);

let rec lookup = (key, stack) =>
  switch (stack) {
    | [] => None
    | [(k, v), ...stack] => if (k == key) { Some(v) } else { lookup(key, stack) }
  };

let step = (c) =>
  switch (c) {
    /* int */
    |      [{ stack, rewrite: {smlAST: Int(n), ctxs} }] =>
      Some([{ stack, rewrite: {smlAST: Value(VInt(n)), ctxs} }])

    /* + */
    /* written in reverse b/c some patterns fight with each other for precedence, but not in this order. */
    /*- 5e. Evaluate +. */
    |      [{stack, rewrite: {smlAST: Plus(Value(VInt(v1)), Value(VInt(v2))), ctxs}}] =>
      Some([{stack, rewrite: {smlAST: Value(VInt(v1 + v2)), ctxs}}])
    /*- 4t. Focus on + after evaluating RHS. */
    |      [{stack, rewrite: {smlAST: Value(v2), ctxs: [ECPlusR(v1, ()), ...ctxs']}}] =>
      Some([{stack, rewrite: {smlAST: Plus(Value(v1), Value(v2)), ctxs: ctxs'}}])
    /*- 3t. Focus on RHS. */
    |      [{stack, rewrite: {smlAST: Plus(Value(v1), e2), ctxs}}] =>
      Some([{stack, rewrite: {smlAST: e2, ctxs: [ECPlusR(v1, ()), ...ctxs]}}])
    /*- 2t. Focus on + after evaluating LHS. */
    |      [{stack, rewrite: {smlAST: Value(v1), ctxs: [ECPlusL((), e2), ...ctxs']}}] =>
      Some([{stack, rewrite: {smlAST: Plus(Value(v1), e2), ctxs: ctxs'}}])
    /*- 1t. Focus on LHS. */
    |      [{stack, rewrite: {smlAST: Plus(e1, e2), ctxs}}] =>
      Some([{stack, rewrite: {smlAST: e1, ctxs: [ECPlusL((), e2), ...ctxs]}}])

    /* var lookup */
    /* TODO: this should be in the option monad */
    |      [{stack, rewrite: {smlAST: Var(x) , ctxs}}] =>
      switch (lookup(x, stack)) {
        | None => None
        | Some(value) => Some([{stack, rewrite: {smlAST: Value(value), ctxs}}])
      }

    | _ => None
  };

let inject = (e) => {
  [{ stack: [("x", VInt(27)), ("y", VInt(300)), ("x", VInt(16))], rewrite: { smlAST: e, ctxs: []} }]
};

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
    | [{ rewrite: {smlAST: Value(_), ctxs: []} }] => true
    | _ => false
  };

/* This is more robust in a lazy language! */
let interpretTrace = (p) => takeWhileInclusive((c) => !isFinal(c), iterateMaybe(step, inject(p)));

let extract = (c) =>
  switch (c) {
    | [{rewrite: {smlAST: Value(VInt(n))}}] => string_of_int(n)
  };
