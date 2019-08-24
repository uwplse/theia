/* Building up a very wrong, very simplistic SML interpreter. Grammar is not correct. */
/* This time we're letting the program section do ALL the traversal and the rewrite do ALL the computation. */
/* - grammar reference: https://people.mpi-sws.org/~rossberg/sml.html */
/* TODO:
    - make all operations ATOMIC? only one thing at a time
    - fix the hacky ADTs
    - fix parentheses
    - if-then-else
    - functions
      - how to represent closures?
      - how to do pointers to functions in the code segment? need some way of accessing random parts of the AST that have been tagged as function entry points and then visualize that somehow
    - implement val binding
        - with nested lets creating a sequence of frames
    - implement low-level CCC variable lookup. will also give some indication of how to skip steps intelligently
 */
/* TODO: figure out how to do monads in reason/ocaml. there's some ppx stuff. */

/* TODO: highlight code blocks, too? Might be useful for nested let expressions. */
type hole = unit;

type binop =
  | Plus;

type smlValue =
  | VInt(int)
  | VBinop(binop) /* first class values ofc */
  | VBinopCall(smlValue, binop, smlValue) /* TODO: just a normal call? */;

type expr =
  | Int(int)
  | Binop(binop)
  | BinopCall(expr, binop, expr)
  | Var(string)
  | Let(dec, expr)
  /* needed for evaluation. shouldn't be produced by parser.
     allows us to write intermediate terms where subexpressions are already values. */
  | Value(smlValue)
  /* used when nothing more to do. TODO: maybe better as a flag somewhere */
  | BinopCallExit(expr, binop, expr)
and dec =
  | ValList(list(valBind))
  | ValListExit(list(valBind))
and valBind =
  | ValBind(string, expr);

/* TODO: these eval contexts should probably mirror the normal ADTs and not be packed into one */
type smlEvalCtx =
  | ECBinopCallBOp(expr, hole, expr)
  | ECBinopCallL(hole, binop, expr)
  | ECBinopCallR(expr, binop, hole)
  | ECValBindVar(hole, expr)
  | ECValBindExpr(string, hole)
  | ECLetDec(hole, expr)
  | ECLetExpr(dec, hole)
  | ECValListEnter(list(valBind), hole, list(valBind)) /* stores VBs before and after */
  | ECValListExit(list(valBind), hole, list(valBind)) /* stores VBs before and after */;

type smlValueEvalCtx =
  | ECVBinopCallL(hole) /* TODO: Do I need this? */
  | ECVBinopCallBOp(smlValue, hole)
  | ECVBinopCallR(smlValue, smlValue, hole);

type grammar =
  | Expr(expr)
  | Dec(dec)
  | VB(valBind);

let ex0 = Int(5);
let ex1 = BinopCall(Int(5), Plus, Int(5));
let ex2 = BinopCall(Int(1), Plus, BinopCall(Int(2), Plus, Int(3)));
let ex3 = BinopCall(BinopCall(Int(2), Plus, Int(3)), Plus, Int(1));
let ex4 = BinopCall(Var("x"), Plus, Int(2));
let ex5 = BinopCall(Var("x"), Plus, Var("y"));
let ex6 = ValList([ValBind("x", Int(34))]);

/* A prefix of "My first ML program" from lecture 1. */
let exLec1 = ValList([ValBind("x", Int(34)),
                   ValBind("y", Int(17)),
                   ValBind("z", BinopCall(BinopCall(Var("x"), Plus, Var("y")), Plus, BinopCall(Var("y"), Plus, Int(2))))]);

let exLec0 = ValList([ValBind("x", Int(34)),
                      ValBind("y", Int(17)),
                      ValBind("z", Int(42))]);

let exLec2 = ValList([ValBind("x", Int(34)),
                   ValBind("y", Int(17)),
                   ValBind("z", BinopCall(BinopCall(Var("x"), Plus, Var("y")), Plus, BinopCall(Var("y"), Plus, Int(2)))),
                   ValBind("q", BinopCall(Var("z"), Plus, Int(1)))]);

/*
fun silly2 () =
  let val x = 1
  in
    (let val x = 2 in x+1 end) +
    (let val y = x+2 in y+1 end)
  end
*/
let silly2 = Let(
  ValList([ValBind("x", Int(1))]),
    BinopCall(
      Let(ValList([ValBind("x", Int(2))]), BinopCall(Var("x"), Plus, Int(1))),
      Plus,
      Let(ValList([ValBind("y", BinopCall(Var("x"), Plus, Int(2)))]), BinopCall(Var("y"), Plus, Int(1)))))

/* Configuration (i.e. AM state description) */
/* TODO: separate progam and rewrite grammars?  */
/* TODO: add closure section to configuration. might also include ADTs there.
sort of a heap */
/* TODO: need pointers to the old evaluation area somehow. */
/* TODO: show rewrite history or not? */
/* TODO: pretty print configuration so it can be logged well. */

/* two-tiered stack. each let list adds a new tier so it can be removed later */
type stack = list(list((string, option(smlValue))));
/* might want expr to actually be an optional to support val bindings that don't end in an expression */
type rewrite = { focus: option(expr), valCtxs: list(smlValueEvalCtx) };
type frame = { stack, rewrite }
/* TODO: remove the option here! */
type program = { focus: grammar, ctxs: list(smlEvalCtx) };
type configuration = { program, frames: list(frame), savedEnvs: list(stack) };

let rec lookupOne = (key, oneStack) =>
  switch (oneStack) {
    | [] => None
    | [(k, v), ...oneStack] => if (k == key) { Some(v) } else { lookupOne(key, oneStack) }
  }

let rec lookup = (key, stack) =>
  switch (stack) {
    | [] => None
    | [os, ...stack] =>
      switch (lookupOne(key, os)) {
        | None => lookup(key, stack)
        | Some(v) => Some(v)
      }
  };

let step = (c: configuration): option(configuration) =>
  switch (c) {
    /* int */
    /* push int into rewrite */
    |      {program: {focus: Expr(Int(n)), ctxs}, frames: [{stack, rewrite: {focus: None, valCtxs}}, ...frames], savedEnvs} =>
      Some({program: {focus: Expr(Int(n)), ctxs}, frames: [{stack, rewrite: {focus: Some(Int(n)), valCtxs}}, ...frames], savedEnvs})

    /* evaluate int */
    |      {program, frames: [{stack, rewrite: {focus: Some(Int(n)), valCtxs}}, ...frames], savedEnvs} =>
      Some({program, frames: [{stack, rewrite: {focus: Some(Value(VInt(n))), valCtxs}}, ...frames], savedEnvs})

    /* binop */
    /* push binop into rewrite */
    |      {program: {focus: Expr(Binop(bop)), ctxs}, frames: [{stack, rewrite: {focus: None, valCtxs}}, ...frames], savedEnvs} =>
      Some({program: {focus: Expr(Binop(bop)), ctxs}, frames: [{stack, rewrite: {focus: Some(Binop(bop)), valCtxs}}, ...frames], savedEnvs})

    /* evaluate binop */
    |      {program, frames: [{stack, rewrite: {focus: Some(Binop(bop)), valCtxs}}, ...frames], savedEnvs} =>
      Some({program, frames: [{stack, rewrite: {focus: Some(Value(VBinop(bop))), valCtxs}}, ...frames], savedEnvs})

    /* evaluate binop call */
    /* TODO: feels like it should be an evaluation context or smth instead of shadowing every expression with a value */
    |      {program, frames: [{stack, rewrite: {focus: Some(Value(VBinopCall(VInt(v1), Plus, VInt(v2)))), valCtxs}}, ...frames], savedEnvs} =>
      Some({program, frames: [{stack, rewrite: {focus: Some(Value(VInt(v1 + v2))), valCtxs}}, ...frames], savedEnvs})

    /* focus on LHS of binop call */
    |      {program: {focus: Expr(BinopCall(e1, bop, e2)), ctxs}, frames, savedEnvs} =>
      Some({program: {focus: Expr(e1), ctxs: [ECBinopCallL((), bop, e2), ...ctxs]}, frames, savedEnvs})
    /* focus on binop in binop call */
    /* TODO: don't skip moving up on the refocus. just doing it for now, because it's easier to avoid ambiguity */
    |      {program: {focus: Expr(e1), ctxs: [ECBinopCallL((), bop, e2), ...ctxs]}, frames: [{stack, rewrite: {focus: Some(Value(v1)), valCtxs}}, ...frames], savedEnvs} =>
      Some({program: {focus: Expr(Binop(bop)), ctxs: [ECBinopCallBOp(e1, (), e2), ...ctxs]}, frames: [{stack, rewrite: {focus: None, valCtxs:[ECVBinopCallBOp(v1, ()), ...valCtxs]}}, ...frames], savedEnvs})
    /* focus on RHS of binop call */
    |      {program: {focus: Expr(Binop(bop)), ctxs: [ECBinopCallBOp(e1, (), e2), ...ctxs]}, frames: [{stack, rewrite: {focus: Some(Value(vbop)), valCtxs:[ECVBinopCallBOp(v1, ()), ...valCtxs]}}, ...frames], savedEnvs} =>
      Some({program: {focus: Expr(e2), ctxs: [ECBinopCallR(e1, bop, ()), ...ctxs]}, frames: [{stack, rewrite: {focus: None, valCtxs:[ECVBinopCallR(v1, vbop, ()), ...valCtxs]}}, ...frames], savedEnvs})
    /* focus up one level and move everything in rewrite to value position */
    |      {program: {focus: Expr(e2), ctxs: [ECBinopCallR(e1, bop, ()), ...ctxs]}, frames: [{stack, rewrite: {focus: Some(Value(v2)), valCtxs:[ECVBinopCallR(v1, vbop, ()), ...valCtxs]}}, ...frames], savedEnvs} =>
      Some({program: {focus: Expr(BinopCallExit(e1, bop, e2)), ctxs}, frames: [{stack, rewrite: {focus: Some(Value(VBinopCall(v1, bop, v2))), valCtxs}}, ...frames], savedEnvs})

    /* val bindings */
    /* focus on first binding */
    |      {program: {focus: Dec(ValList([ValBind(x, e), ...bindings])), ctxs}, frames, savedEnvs} =>
      Some({program: {focus: VB(ValBind(x, e)), ctxs: [ECValListEnter([], (), bindings), ...ctxs]}, frames, savedEnvs})
    /* focus on variable */
    |      {program: {focus: VB(ValBind(x, e)), ctxs: [ECValListEnter(prevB, (), nextB), ...ctxs]}, frames, savedEnvs} =>
      Some({program: {focus: Expr(Var(x)), ctxs: [ECValBindVar((), e), ECValListEnter(prevB, (), nextB), ...ctxs]}, frames, savedEnvs})
    /* TODO: I think I can avoid this doubling up of rules by using evaluation contexts for the stack, too */
    /* push variable on stack and focus on subexpression */
    |      {program: {focus: Expr(Var(x)), ctxs: [ECValBindVar((), e), ...ctxs]}, frames: [{stack: [os, ...stack], rewrite}, ...frames], savedEnvs} =>
      Some({program: {focus: Expr(e), ctxs: [ECValBindExpr(x, ()), ...ctxs]}, frames: [{stack: [[(x, None), ...os], ...stack], rewrite}, ...frames], savedEnvs})
    /* push value onto stack */
    |      {program: {focus: Expr(e), ctxs: [ECValBindExpr(_, ()), ...ctxs]}, frames: [{stack: [[(x, None), ...os], ...stack], rewrite: {focus: Some(Value(v)), valCtxs: []}}, ...frames], savedEnvs} =>
      Some({program: {focus: Expr(e), ctxs: [ECValBindExpr(x, ()), ...ctxs]}, frames: [{stack: [[(x, Some(v)), ...os], ...stack], rewrite: {focus: Some(Value(v)), valCtxs: []}}, ...frames], savedEnvs})
    /* move up a level and clear rw */
    |      {program: {focus: Expr(e), ctxs: [ECValBindExpr(x, ()), ECValListEnter(prevB, (), nextB), ...ctxs]}, frames: [{stack: [[(_, Some(v)), ...os], ...stack], rewrite: {focus: Some(Value(_)), valCtxs: []}}, ...frames], savedEnvs} =>
      Some({program: {focus: VB(ValBind(x, e)), ctxs: [ECValListExit(prevB, (), nextB), ...ctxs]}, frames: [{stack: [[(x, Some(v)), ...os], ...stack], rewrite: {focus: None, valCtxs: []}}, ...frames], savedEnvs})
    /* we're at the last binding. stop! */
    |      {program: {focus: VB(vb), ctxs: [ECValListExit(prevB, (), []), ...ctxs]}, frames, savedEnvs} =>
      Some({program: {focus: Dec(ValListExit(prevB @ [vb])), ctxs}, frames, savedEnvs})
    /* move onto next binding */
    |      {program: {focus: VB(vb1), ctxs: [ECValListExit(prevB, (), [vb2, ...nextB]), ...ctxs]}, frames, savedEnvs} =>
      Some({program: {focus: VB(vb2), ctxs: [ECValListEnter(prevB @ [vb1], (), nextB), ...ctxs]}, frames, savedEnvs})

    /* push var into rewrite */
    |      {program: {focus: Expr(Var(x)), ctxs}, frames: [{stack, rewrite: {focus: None, valCtxs}}, ...frames], savedEnvs} =>
      Some({program: {focus: Expr(Var(x)), ctxs}, frames: [{stack, rewrite: {focus: Some(Var(x)), valCtxs}}, ...frames], savedEnvs})

    /* var lookup */
    /* TODO: this should be in the option monad */
    /* TODO: maybe make lookup handle the nested options (they arise from partially filled stacks) */
    |      {program, frames: [{stack, rewrite: {focus: Some(Var(x)) , valCtxs}}, ...frames], savedEnvs} =>
      switch (lookup(x, stack)) {
        | None | Some(None) => None
        | Some(Some(value)) => Some({program, frames: [{stack, rewrite: {focus: Some(Value(value)), valCtxs}}, ...frames], savedEnvs})
      }

    /* local binding */
    /* TODO: change lookup to use previous bindings somehow. How to differentiate between lets and functions? Need a good way! */
    /* Focus on decl and add a new frame (TODO: there's an edge case here with the first let binding I think. Also need to separate the two steps) */
    |      {program: {focus: Expr(Let(d, e)), ctxs}, frames: [{stack, rewrite}, ...frames], savedEnvs} =>
      Some({program: {focus: Dec(d), ctxs: [ECLetDec((), e), ...ctxs]}, frames: [{stack: [[], ...stack], rewrite: {focus: None, valCtxs: []}}, ...frames], savedEnvs})
    /* focus on expr */
    |      {program: {focus: Dec(ValListExit(vbs)), ctxs: [ECLetDec((), e), ...ctxs]}, frames, savedEnvs} =>
      Some({program: {focus: Expr(e), ctxs: [ECLetExpr(ValListExit(vbs), ()), ...ctxs]}, frames, savedEnvs})
    /* leave let */
    |      {program: {focus: Expr(e), ctxs: [ECLetExpr(ValListExit(vbs), ()), ...ctxs]}, frames: [{stack: [os, ...stack], rewrite: {focus: Some(v), valCtxs: []}}, ...frames], savedEnvs} =>
      Some({program: {focus: Expr(Let(ValListExit(vbs), e)), ctxs}, frames: [{stack, rewrite: {focus: Some(v), valCtxs: []}}, ...frames], savedEnvs})
    /* TODO!!! This method doesn't quite work. Try tracing by hand. */
    | _ => None
  };

let injectExpr = (e) => {
  {program: { focus: Expr(e), ctxs: []}, frames: [{stack: [[/* ("x", Some(VInt(32))), ("y", Some(VInt(53))) */]], rewrite: {focus: None, valCtxs: []}}], savedEnvs: []}
};
let injectDec = (dec) => {
  {program: { focus: Dec(dec), ctxs: []}, frames: [{stack: [[/* ("x", Some(VInt(32))), ("y", Some(VInt(53))) */]], rewrite: {focus: None, valCtxs: []}}], savedEnvs: []}
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


let interpretTraceBounded = (~maxDepth=100, p) => takeWhileInclusive((c) => !isFinal(c), iterateMaybeMaxDepth(maxDepth, step, injectExpr(p)));
let interpretTrace = (p) => takeWhileInclusive((c) => !isFinal(c), iterateMaybe(step, injectExpr(p)));

let extract = (c) =>
  switch (c) {
    | {frames: [{rewrite: {focus: Some(Value(VInt(n)))}}]} => string_of_int(n)
  };
