/* TODO:
    - implement val binding
        - entirely in rewrite section, no nesting
          - TODO: add x with no binding to environment first. then evaluate RHS. then pop back up. then add value to env
        - with a program counter in a program section that controls flow and sends subexpressions to the rewrite area
          (add the program section back!)
          - DO THIS ONE NEXT! IT'S THE MOST IMPORTANT ONE! IT WILL TELL ME THE MOST!
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
let ex6 = ValList([("x", Int(34))]);

/* A prefix of "My first ML program" from lecture 1. */
let exLec1 = ValList([("x", Int(34)),
                   ("y", Int(17)),
                   ("z", Plus(Plus(Var("x"), Var("y")), Plus(Var("y"), Int(2))))]);

let exLec0 = ValList([("x", Int(34)),
                      ("y", Int(17)),
                      ("z", Int(42))]);

/* Configuration (i.e. AM state description) */
/* TODO: separate progam and rewrite grammars?  */
/* TODO: add closure section to configuration. might also include ADTs there.
sort of a heap */
/* TODO: need pointers to the old evaluation area somehow. */
/* TODO: show rewrite history or not? */
/* TODO: pretty print configuration so it can be logged well. */
type stack = list((string, smlValue));
/* might want smlAST to actually be an optional to support val bindings that don't end in an expression */
type rewrite = { smlAST, ctxs: list(smlEvalCtx) };
type frame = { stack, rewrite }
type program = { smlAST, ctxs: list(smlEvalCtx) };
type configuration = { program, frames: list(frame) };

let rec lookup = (key, stack) =>
  switch (stack) {
    | [] => None
    | [(k, v), ...stack] => if (k == key) { Some(v) } else { lookup(key, stack) }
  };

/* really each rule should probably just move a *single* thing! */
let step = (c: configuration): option(configuration) =>
  switch (c) {
    /* int */
    |      {program, frames: [{ stack, rewrite: {smlAST: Int(n), ctxs} }]} =>
      Some({program, frames: [{ stack, rewrite: {smlAST: Value(VInt(n)), ctxs} }]})

    /* + */
    /* written in reverse b/c some patterns fight with each other for precedence, but not in this order. */
    /*- 5e. Evaluate +. */
    |      {program, frames: [{stack, rewrite: {smlAST: Plus(Value(VInt(v1)), Value(VInt(v2))), ctxs}}]} =>
      Some({program, frames: [{stack, rewrite: {smlAST: Value(VInt(v1 + v2)), ctxs}}]})
    /*- 4t. Focus on + after evaluating RHS. */
    |      {program, frames: [{stack, rewrite: {smlAST: Value(v2), ctxs: [ECPlusR(v1, ()), ...ctxs']}}]} =>
      Some({program, frames: [{stack, rewrite: {smlAST: Plus(Value(v1), Value(v2)), ctxs: ctxs'}}]})
    /*- 3t. Focus on RHS. */
    |      {program, frames: [{stack, rewrite: {smlAST: Plus(Value(v1), e2), ctxs}}]} =>
      Some({program, frames: [{stack, rewrite: {smlAST: e2, ctxs: [ECPlusR(v1, ()), ...ctxs]}}]})
    /*- 2t. Focus on + after evaluating LHS. */
    |      {program, frames: [{stack, rewrite: {smlAST: Value(v1), ctxs: [ECPlusL((), e2), ...ctxs']}}]} =>
      Some({program, frames: [{stack, rewrite: {smlAST: Plus(Value(v1), e2), ctxs: ctxs'}}]})
    /*- 1t. Focus on LHS. */
    |      {program, frames: [{stack, rewrite: {smlAST: Plus(e1, e2), ctxs}}]} =>
      Some({program, frames: [{stack, rewrite: {smlAST: e1, ctxs: [ECPlusL((), e2), ...ctxs]}}]})

    /* val list */
    /*- 1t. Focus on first binding  */
    |      {program, frames: [{stack, rewrite: {smlAST: ValList([(x, e), ...bindings]), ctxs}}]} =>
      Some({program, frames: [{stack, rewrite: {smlAST: e, ctxs: [ECValList((x, ()), bindings), ...ctxs]}}]})
    /*- 2e. Push binding onto stack and focus on next binding. */
    /* TODO: should be two rules? or at least two steps? */
    |      {program, frames: [{stack, rewrite: {smlAST: Value(v1), ctxs: [ECValList((x1, ()), [(x2, e2), ...bindings]), ...ctxs']}}]} =>
      Some({program, frames: [{stack: [(x1, v1), ...stack], rewrite: {smlAST: e2, ctxs: [ECValList((x2, ()), bindings), ...ctxs']}}]})
    /*- 3e. Push last binding onto stack. */
    /* TODO: what to return??? */
    |      {program, frames: [{stack, rewrite: {smlAST: Value(v), ctxs: [ECValList((x, ()), []), ...ctxs']}}]} =>
      Some({program, frames: [{stack: [(x, v), ...stack], rewrite: {smlAST: Value(VInt(-1)), ctxs: ctxs'}}]})

    /* var lookup */
    /* TODO: this should be in the option monad */
    |      {program, frames: [{stack, rewrite: {smlAST: Var(x) , ctxs}}]} =>
      switch (lookup(x, stack)) {
        | None => None
        | Some(value) => Some({program, frames: [{stack, rewrite: {smlAST: Value(value), ctxs}}]})
      }

    | _ => None
  };

let step2 = (c: configuration): option(configuration) =>
  switch (c) {
    /* rewrite int */
    |      {program, frames: [{ stack, rewrite: {smlAST: Int(n), ctxs} }]} =>
      Some({program, frames: [{ stack, rewrite: {smlAST: Value(VInt(n)), ctxs} }]})

    /* val list */
    /*- 1t. Focus on first binding  */
    |      {program: {smlAST: ValList([(x, e), ...bindings]), ctxs}, frames} =>
      Some({program: {smlAST: e, ctxs: [ECValList((x, ()), bindings), ...ctxs]}, frames: [{stack: [], rewrite: {smlAST: e, ctxs: []}}]})
    /*- 2e. Push binding onto stack and focus on next binding. */
    /* TODO: need to add a new evalctx that preserves the code! */
    |      {program: {smlAST: _e1, ctxs: [ECValList((x1, ()), [(x2, e2), ...bindings]), ...ctxs]}, frames: [{stack, rewrite: {smlAST: Value(v1), ctxs: []}}]} =>
      Some({program: {smlAST: e2, ctxs: [ECValList((x2, ()), bindings), ...ctxs]}, frames: [{stack: [(x1, v1), ...stack], rewrite: {smlAST: e2, ctxs: []}}]})
    /*- 3e. Push last binding onto stack. */
    /* TODO: what to return??? */
    |      {program: {smlAST: _e, ctxs: [ECValList((x, ()), []), ...ctxs]}, frames: [{stack, rewrite: {smlAST: Value(v), ctxs: []}}]} =>
      Some({program: {smlAST: Value(VInt(-1)), ctxs: ctxs}, frames: [{stack: [(x, v), ...stack], rewrite: {smlAST: Value(VInt(-1)), ctxs: []}}]})
    | _ => None
  };

let inject = (e) => {
  {program: { smlAST: e, ctxs: []}, frames: []}
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

/* TODO: need to detect end using program segment somehow */
let isFinal = (c) =>
  switch (c) {
    /* | {frames: []} => true */
    // | {frames: [{ rewrite: {smlAST: Value(_), ctxs: []} }]} => true
    | _ => false
  };

/* This is more robust in a lazy language! */
let interpretTrace = (p) => takeWhileInclusive((c) => !isFinal(c), iterateMaybe(step2, inject(p)));

let extract = (c) =>
  switch (c) {
    | {frames: [{rewrite: {smlAST: Value(VInt(n))}}]} => string_of_int(n)
  };
