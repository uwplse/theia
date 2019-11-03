/* Building up a very wrong, very simplistic SML interpreter. Grammar is not correct. */
/* This time we're letting the program section do ALL the traversal and the rewrite do ALL the computation. */
/* Following SML 97 and HaMLet closely.
 * Big difference: closure representation uses sharing like Sorin's OCaml visualizations.
 *   Should hopefully also enable simpler recursive function representation? Maybe?
 * 
 * ignoring id status, op prefix, vid is string
 * 
 * for now E = VE (obviously not sustainable)
 * for now no state
 */
/* HACK: unfolding all recursive functions to small-step AM. definitely has to be a better way to do
     this!*/
/* TODO: figure out how to do monads in reason/ocaml. there's some ppx stuff. */

/* TODO: highlight code blocks, too? Might be useful for nested let expressions. */
type hole = unit;

type vid = string;
type lab = string;

type sCon =
  | INT(int);

type atExp =
  | SCON(sCon)
  | ID(vid)
  | RECORD(option(expRow))
  | LET(dec, exp)
  | PARA(exp)

and expRow = { lab, exp, rest: option(expRow) }

and exp =
  | ATEXP(atExp)

and dec =
  /* no tyvar seq */
  | VAL(valBind)

and valBind =
  | PLAIN(pat, exp, option(valBind))

and atPat =
  /* no op */
  | ID(vid)

and pat =
  | ATPAT(atPat);

type sVal =
  | INT(int);

type record = list((lab, val_))

and val_ =
  | SVAL(sVal)
  | RECORD(record);

type focus =
  | AtExp(atExp)
  | Exp(exp)
  | Val(val_)
  | Dec(dec)
  | ValBind(valBind)
  | Empty;

type valEnv = list((vid, val_));

type ctxt =
  | LETD(hole, exp)
  | VALBINDE(pat, hole, option(valBind));

type ctxts = list(ctxt);

type rewrite = { focus, ctxts };

type configuration = { rewrite, env: valEnv };

let step = (c: configuration): option(configuration) =>
  switch (c) {
    /* Atomic Expressions */
    // [90]
    | { rewrite: { focus: AtExp(SCON(INT(n))), ctxts }, env } => Some({ rewrite: { focus:
    Val(SVAL(INT(n))), ctxts }, env })

    // [91]
    | { rewrite: { focus: AtExp(ID(x)), ctxts }, env } =>
      switch (Util.lookupOne(x, env)) {
        | None => None
        | Some(v) => Some({ rewrite: { focus: Val(v), ctxts }, env })
      }

    // [92]
    | { rewrite: { focus: AtExp(RECORD(None)), ctxts }, env } => Some({ rewrite: { focus:
    Val(RECORD([])), ctxts }, env })
    // | { rewrite: Exp(ATEXP(RECORD(Some(er)))), env } => Some(???)
    // | { rewrite: Exp(ATEXP(RECORD(Some({ lab, exp, rest })))), env } => Some({ rewrite:
    // Exp(ATEXP(RECORD(rest))), env })
    
    // [93]
    | { rewrite: { focus: AtExp(LET(d, e)), ctxts }, env } => Some({ rewrite: { focus: Dec(d),
    ctxts: [LETD((), e), ...ctxts] }, env })
    | { rewrite: { focus: Empty, ctxts: [LETD((), e), ...ctxts] }, env } => Some({ rewrite: { focus:
    Exp(e), ctxts }, env })

    // [94]
    | { rewrite: { focus: AtExp(PARA(e)), ctxts }, env } => Some({ rewrite: { focus: Exp(e),
    ctxts }, env })

    /* Expression Rows */
    /* Expressions */
    // [96]
    | { rewrite: { focus: Exp(ATEXP(a)), ctxts }, env } => Some({ rewrite: { focus: AtExp(a), ctxts
    }, env })

    /* Matches */
    /* Match Rules */

    /* Declarations */
    // [114]
    | { rewrite: { focus: Dec(VAL(vb)), ctxts }, env } => Some({ rewrite: { focus: ValBind(vb),
    ctxts }, env })

    /* Value Bindings */
    // [124ish]. too specialized
    | { rewrite: { focus: ValBind(PLAIN(p, e, vbs)), ctxts }, env } => Some({ rewrite: { focus:
    Exp(e), ctxts: [VALBINDE(p, (), vbs), ...ctxts] }, env })
    | { rewrite: { focus: Val(v), ctxts: [VALBINDE(ATPAT(ID(x)), (), None), ...ctxts] }, env } =>
    Some({ rewrite: { focus: Empty, ctxts }, env: [(x, v), ...env]})

    /* Type Bindings */
    /* Datatype Bindings */
    /* Constructor Bindings */
    /* Exception Bindings */
    /* Atomic Patterns */
    /* Pattern Rows */
    /* Patterns */
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
    // | {frames: [{ rewrite: {rewrite: Value(_), ctxs: []} }]} => true
    | _ => false
  };

// let injectExp = (e) => { rewrite: { focus: Exp(e), ctxts: [] }, env: [] };

let inject = (e) => { rewrite: { focus: e, ctxts: [] }, env: [] };

let interpretTraceBounded = (~maxDepth=100, p) => TheiaUtil.takeWhileInclusive((c) => !isFinal(c), TheiaUtil.iterateMaybeMaxDepth(maxDepth, step, inject(p)));
let interpretTrace = (p) => TheiaUtil.takeWhileInclusive((c) => !isFinal(c), TheiaUtil.iterateMaybe(step, inject(p)));

// let extract = (c) =>
//   switch (c) {
//     | {frames: [{rewrite: {rewrite: Some(Value(VInt(n)))}}]} => string_of_int(n)
//   };

/* example programs */
let ex0 = AtExp(SCON(INT(5)));
let ex1 = AtExp(LET(VAL(PLAIN(ATPAT(ID("x")), ATEXP(SCON(INT(5))), None)), ATEXP(ID("x"))));
