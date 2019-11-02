/* Building up a very wrong, very simplistic SML interpreter. Grammar is not correct. */
/* This time we're letting the program section do ALL the traversal and the rewrite do ALL the computation. */
/* Following SML 97 closely.
 * Big difference: closure representation uses sharing like Sorin's OCaml visualizations.
 *   Should hopefully also enable simpler recursive function representation? Maybe?
 * 
 * ignoring id status, op prefix, vid is string
 * 
 * for now E = VE (obviously not sustainable)
 */
/* HACK: unfolding all recursive functions to small-step AM. definitely has to be a better way to do
     this!*/
/* TODO: figure out how to do monads in reason/ocaml. there's some ppx stuff. */

/* TODO: highlight code blocks, too? Might be useful for nested let expressions. */
type hole = unit;

type vid = string;

type sCon =
  | INT(int);

type atExp =
  | SCON(sCon)
  | ID(vid);

type exp =
  | ATEXP(atExp);

type sVal =
  | INT(int);

type val_ =
  | SVAL(sVal);

let ex0 = ATEXP(SCON(INT(5)));

type expOrVal =
  | Exp(exp)
  | Val(val_);

type valEnv = list((vid, val_));

type configuration = { program: expOrVal, env: valEnv };

let step = (c: configuration): option(configuration) =>
  switch (c) {
    /* [90] */
    | { program: Exp(ATEXP(SCON(INT(n)))), env } => Some({ program: Val(SVAL(INT(n))), env })
    /* [91] */
    | { program: Exp(ATEXP(ID(x))), env } =>
      switch (Util.lookupOne(x, env)) {
        | None => None
        | Some(v) => Some({ program: Val(v), env })
      }
    | _ => None
  };

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

let injectExp = (e) => { program: Exp(e), env: [] };

let interpretTraceBounded = (~maxDepth=100, p) => TheiaUtil.takeWhileInclusive((c) => !isFinal(c), TheiaUtil.iterateMaybeMaxDepth(maxDepth, step, injectExp(p)));
let interpretTrace = (p) => TheiaUtil.takeWhileInclusive((c) => !isFinal(c), TheiaUtil.iterateMaybe(step, injectExp(p)));

// let extract = (c) =>
//   switch (c) {
//     | {frames: [{rewrite: {focus: Some(Value(VInt(n)))}}]} => string_of_int(n)
//   };
