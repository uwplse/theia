/* Building up a very wrong, very simplistic SML interpreter. Grammar is not correct. */
/* - grammar reference: https://people.mpi-sws.org/~rossberg/sml.html */
/* TODO:
    - fix parentheses

    - implement val binding
        - with nested lets creating a sequence of frames
    - implement low-level variable lookup. will also give some indication of how to skip steps intelligently
 */
/* TODO: figure out how to do monads in reason/ocaml. there's some ppx stuff. */

/* TODO: highlight code blocks, too? Might be useful for nested let expressions. */

type smlValue =
  | VInt(int);

type expr =
  | Int(int)
  | Plus(expr, expr)
  | Var(string)
  | ValList(list(valBind))
  /* needed for evaluation. shouldn't be produced by parser.
     allows us to write intermediate terms where subexpressions are already values. */
  | Value(smlValue)
and valBind =
  | ValBind(string, expr);

type hole = unit;

type smlEvalCtx =
  | ECPlusL(hole, expr)
  | ECPlusR(smlValue, hole)
  | ECValBindVar(hole, expr)
  | ECValBindExpr(string, hole)
  | ECValListEnter(list(valBind), hole, list(valBind)) /* stores VBs before and after */
  | ECValListExit(list(valBind), hole, list(valBind)) /* stores VBs before and after */;

type grammar =
  | Expr(expr)
  | VB(valBind);

let ex0 = Int(5);
let ex1 = Plus(Int(5), Int(5));
let ex2 = Plus(Int(1), Plus(Int(2), Int(3)));
let ex3 = Plus(Plus(Int(2), Int(3)), Int(1));
let ex4 = Plus(Var("x"), Int(2));
let ex5 = Plus(Var("x"), Var("y"));
let ex6 = ValList([ValBind("x", Int(34))]);

/* A prefix of "My first ML program" from lecture 1. */
let exLec1 = ValList([ValBind("x", Int(34)),
                   ValBind("y", Int(17)),
                   ValBind("z", Plus(Plus(Var("x"), Var("y")), Plus(Var("y"), Int(2))))]);

let exLec0 = ValList([ValBind("x", Int(34)),
                      ValBind("y", Int(17)),
                      ValBind("z", Int(42))]);

/* Configuration (i.e. AM state description) */
/* TODO: separate progam and rewrite grammars?  */
/* TODO: add closure section to configuration. might also include ADTs there.
sort of a heap */
/* TODO: need pointers to the old evaluation area somehow. */
/* TODO: show rewrite history or not? */
/* TODO: pretty print configuration so it can be logged well. */
type stack = list((string, option(smlValue)));
/* might want expr to actually be an optional to support val bindings that don't end in an expression */
type rewrite = { focus: expr, ctxs: list(smlEvalCtx) };
type frame = { stack, rewrite: option(rewrite) }
/* TODO: remove the option here! */
type program = { focus: grammar, ctxs: list(smlEvalCtx) };
type configuration = { program, frames: list(frame) };

let rec lookup = (key, stack) =>
  switch (stack) {
    | [] => None
    | [(k, v), ...stack] => if (k == key) { Some(v) } else { lookup(key, stack) }
  };

let step = (c: configuration): option(configuration) =>
  switch (c) {
    /* rewrite int */
    |      {program, frames: [{ stack, rewrite: Some({focus: Int(n), ctxs}) }]} =>
      Some({program, frames: [{ stack, rewrite: Some({focus: Value(VInt(n)), ctxs}) }]})

    /* rewrite + */
    /* written in reverse b/c some patterns fight with each other for precedence, but not in this order. */
    /*- 5e. Evaluate +. */
    |      {program, frames: [{stack, rewrite: Some({focus: Plus(Value(VInt(v1)), Value(VInt(v2))), ctxs})}]} =>
      Some({program, frames: [{stack, rewrite: Some({focus: Value(VInt(v1 + v2)), ctxs})}]})
    /*- 4t. Focus on + after evaluating RHS. */
    |      {program, frames: [{stack, rewrite: Some({focus: Value(v2), ctxs: [ECPlusR(v1, ()), ...ctxs']})}]} =>
      Some({program, frames: [{stack, rewrite: Some({focus: Plus(Value(v1), Value(v2)), ctxs: ctxs'})}]})
    /*- 3t. Focus on RHS. */
    |      {program, frames: [{stack, rewrite: Some({focus: Plus(Value(v1), e2), ctxs})}]} =>
      Some({program, frames: [{stack, rewrite: Some({focus: e2, ctxs: [ECPlusR(v1, ()), ...ctxs]})}]})
    /*- 2t. Focus on + after evaluating LHS. */
    |      {program, frames: [{stack, rewrite: Some({focus: Value(v1), ctxs: [ECPlusL((), e2), ...ctxs']})}]} =>
      Some({program, frames: [{stack, rewrite: Some({focus: Plus(Value(v1), e2), ctxs: ctxs'})}]})
    /*- 1t. Focus on LHS. */
    |      {program, frames: [{stack, rewrite: Some({focus: Plus(e1, e2), ctxs})}]} =>
      Some({program, frames: [{stack, rewrite: Some({focus: e1, ctxs: [ECPlusL((), e2), ...ctxs]})}]})

    /* val list */
    /*- 10t. Leave val list.  */
    |      {program: {focus: VB(ValBind(x1, e1)), ctxs: [ECValListExit(prevB, (), []), ...ctxs]}, frames: [{stack: [(_, Some(v1)), ...stack], rewrite: None}]} =>
      Some({program: {focus: Expr(ValList(prevB @ [ValBind(x1, e1)])), ctxs}, frames: [{stack: [(x1, Some(v1)), ...stack], rewrite: None}]})
    /*- 9t. Focus on the next binding. */
    |      {program: {focus: VB(ValBind(x1, e1)), ctxs: [ECValListExit(prevB, (), [ValBind(x2, e2), ...bindings]), ...ctxs]}, frames: [{stack: [(_, Some(v1)), ...stack], rewrite: None}]} =>
      Some({program: {focus: VB(ValBind(x2, e2)), ctxs: [ECValListEnter(prevB @ [ValBind(x1, e1)], (), bindings), ...ctxs]}, frames: [{stack: [(x1, Some(v1)), ...stack], rewrite: None}]})
    /*- 8t. Refocus on val list. Note: Exit is used to prevent match ambiguity. */
    |      {program: {focus: Expr(e), ctxs: [ECValBindExpr(x, ()), ECValListEnter(prevB, (), postB), ...ctxs]}, frames: [{stack: [(_, Some(v)), ...stack], rewrite: None}]} =>
      Some({program: {focus: VB(ValBind(x, e)), ctxs: [ECValListExit(prevB, (), postB), ...ctxs]}, frames: [{stack: [(x, Some(v)), ...stack], rewrite: None}]})
    /*- 7e. Push value onto stack. */
    |      {program: {focus: Expr(e), ctxs: [ECValBindExpr(x, ()), ECValListEnter(prevB, (), postB), ...ctxs]}, frames: [{stack: [(_, None), ...stack], rewrite: Some({focus: Value(v), ctxs: []})}]}
    =>
      Some({program: {focus: Expr(e), ctxs: [ECValBindExpr(x, ()), ECValListEnter(prevB, (), postB), ...ctxs]}, frames: [{stack: [(x, Some(v)), ...stack], rewrite: None}]})
    /*- 6e. Push the subexpression into rewrite. */
    |      {program: {focus: Expr(e), ctxs: [ECValBindExpr(x, ()), ECValListEnter(prevB, (), postB), ...ctxs]}, frames: [{stack: [(_, None), ...stack], rewrite: None}]} =>
      Some({program: {focus: Expr(e), ctxs: [ECValBindExpr(x, ()), ECValListEnter(prevB, (), postB), ...ctxs]}, frames: [{stack: [(x, None), ...stack], rewrite: Some({focus: e, ctxs: []})}]})
    /*- 5t. Focus on subexpression. */
    |      {program: {focus: VB(ValBind(x, e)), ctxs: [ECValListEnter(prevB, (), postB), ...ctxs]}, frames: [{stack: [(_, None), ...stack], rewrite: None}]} =>
      Some({program: {focus: Expr(e), ctxs: [ECValBindExpr(x, ()), ECValListEnter(prevB, (), postB), ...ctxs]}, frames: [{stack: [(x, None), ...stack], rewrite: None}]})
    /*- 4t. Refocus on val list. */
    |      {program: {focus: Expr(Var(x)), ctxs: [ECValBindVar((), e), ECValListEnter(prevB, (), postB), ...ctxs]}, frames: [{stack: [(_, None), ...stack], rewrite: None}]} =>
      Some({program: {focus: VB(ValBind(x, e)), ctxs: [ECValListEnter(prevB, (), postB), ...ctxs]}, frames: [{stack: [(x, None), ...stack], rewrite: None}]})
    /*- 3e. Push variable onto stack. */
    |      {program: {focus: Expr(Var(x)), ctxs: [ECValBindVar((), e), ...ctxs]}, frames: [{stack, rewrite: None}]} =>
      Some({program: {focus: Expr(Var(x)), ctxs: [ECValBindVar((), e), ...ctxs]}, frames: [{stack: [(x, None), ...stack], rewrite: None}]})
    /*- 2t. Focus on variable. */
    |      {program: {focus: VB(ValBind(x, e)), ctxs: [ECValListEnter(prevB, (), postB), ...ctxs]}, frames: [{stack, rewrite: None}]} =>
      Some({program: {focus: Expr(Var(x)), ctxs: [ECValBindVar((), e), ECValListEnter(prevB, (), postB), ...ctxs]}, frames: [{stack, rewrite: None}]})
    /*- 1t. Focus on first binding  */
    |      {program: {focus: Expr(ValList([ValBind(x, e), ...bindings])), ctxs}, frames: []} =>
      Some({program: {focus: VB(ValBind(x, e)), ctxs: [ECValListEnter([], (), bindings), ...ctxs]}, frames: [{stack: [], rewrite: None}]})

    /* var lookup */
    /* TODO: this should be in the option monad */
    /* TODO: maybe make lookup handle the nested options (they arise from partially filled stacks) */
    |      {program, frames: [{stack, rewrite: Some({focus: Var(x) , ctxs})}]} =>
      switch (lookup(x, stack)) {
        | None | Some(None) => None
        | Some(Some(value)) => Some({program, frames: [{stack, rewrite: Some({focus: Value(value), ctxs})}]})
      }
    | _ => None
  };

let inject = (e) => {
  {program: { focus: Expr(e), ctxs: []}, frames: []}
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

let rec iterateMaybeAuxBounded = (i, f, x) =>
  if (i <= 0) {
    []
  } else {
    switch (x) {
      | None => []
      | Some(x) =>
          let fx = f(x);
          [x, ...iterateMaybeAuxBounded(i - 1, f, fx)]
      }
  };

/* lazy would make this easier! */
let iterateMaybeMaxDepth = (i, f, x) => iterateMaybeAuxBounded(i, f, Some(x));

let isNone = (o) =>
  switch (o) {
    | None => true
    | _ => false
  };

/* TODO: need to detect end using program segment somehow */
let isFinal = (c) =>
  switch (c) {
    /* | {frames: []} => true */
    // | {frames: [{ rewrite: {focus: Value(_), ctxs: []} }]} => true
    | _ => false
  };


let interpretTraceBounded = (~maxDepth=100, p) => takeWhileInclusive((c) => !isFinal(c), iterateMaybeMaxDepth(maxDepth, step, inject(p)));
let interpretTrace = (p) => takeWhileInclusive((c) => !isFinal(c), iterateMaybe(step, inject(p)));

let extract = (c) =>
  switch (c) {
    | {frames: [{rewrite: Some({focus: Value(VInt(n))})}]} => string_of_int(n)
  };
