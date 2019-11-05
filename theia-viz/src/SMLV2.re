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
/* TODO: how to represent derived forms??? */
/* TODO: how to make variable lookup more granular?? */


/* TODO: figure out how to do monads in reason/ocaml. there's some ppx stuff. */

/* TODO: highlight code blocks, too? Might be useful for nested let expressions. */
type hole = unit;

type vid = string;
type lab = string;
type basVal = string;

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
  | APP(exp, atExp)

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
  | BASVAL(basVal)
  | RECORD(record);

type strDec =
  | DEC(dec)
  | SEQ(strDec, strDec);

type topDec =
  | STRDEC(strDec, option(topDec));

type focus =
  | AtExp(atExp)
  | Exp(exp)
  | Val(val_)
  | Dec(dec)
  | ValBind(valBind)
  | StrDec(strDec)
  | TopDec(topDec)
  | ExpRow(expRow)
  | Record(record)
  | Empty;

type valEnv = list((vid, val_));

type ctxt =
  | LETD(hole, exp)
  | VALBINDE(pat, hole, option(valBind))
  | SEQL(hole, strDec)
  | APPL(hole, atExp)
  | APPR(val_, hole)
  /* is that a... */
  | RECORDER(hole)
  | EXPROWE(record, lab, hole, option(expRow));

type ctxts = list(ctxt);

type rewrite = { focus, ctxts };

type configuration = { rewrite, env: valEnv };

let apply = (f, v) =>
  switch (f, v) {
    | ("+", RECORD([("1", SVAL(INT(a))), ("2", SVAL(INT(b)))])) => SVAL(INT(a + b))
    | _ => failwith("unknown built-in function: " ++ f)
  }

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
    /* empty record */
    | { rewrite: { focus: AtExp(RECORD(None)), ctxts }, env } => Some({ rewrite: { focus:
    Val(RECORD([])), ctxts }, env })
    /* start non-empty record */
    | { rewrite: { focus: AtExp(RECORD(Some(er))), ctxts }, env } => Some({ rewrite: { focus:
    ExpRow(er), ctxts: [RECORDER(()), ...ctxts] }, env })
    /* complete non-empty record */
    | { rewrite: { focus: Record(r), ctxts: [RECORDER(()), ...ctxts] }, env } => Some({ rewrite: {
    focus: Val(RECORD(r)), ctxts }, env })

    // [93]
    | { rewrite: { focus: AtExp(LET(d, e)), ctxts }, env } => Some({ rewrite: { focus: Dec(d),
    ctxts: [LETD((), e), ...ctxts] }, env })
    | { rewrite: { focus: Empty, ctxts: [LETD((), e), ...ctxts] }, env } => Some({ rewrite: { focus:
    Exp(e), ctxts }, env })

    // [94]
    | { rewrite: { focus: AtExp(PARA(e)), ctxts }, env } => Some({ rewrite: { focus: Exp(e),
    ctxts }, env })

    /* Expression Rows */
    // [95]
    // start visiting
    | { rewrite: { focus: ExpRow({ lab, exp, rest }), ctxts }, env } => Some({ rewrite: {
    focus: Exp(exp), ctxts: [EXPROWE([], lab, (), rest), ...ctxts] }, env })
    // mid visiting
    | { rewrite: { focus: Val(v), ctxts: [EXPROWE(r, l, (), Some({ lab, exp, rest })), ...ctxts] }, env } => Some({
    rewrite: { focus: Exp(exp), ctxts: [EXPROWE(r @ [(l, v)], lab, (), rest), ...ctxts] }, env })
    // complete visiting
    | { rewrite: { focus: Val(v), ctxts: [EXPROWE(r, l, (), None), ...ctxts] }, env } => Some({
    rewrite: { focus: Record(r @ [(l, v)]), ctxts }, env })

    /* Expressions */
    // [96]
    | { rewrite: { focus: Exp(ATEXP(a)), ctxts }, env } => Some({ rewrite: { focus: AtExp(a), ctxts
    }, env })

    // helper rule for function application
    /* TODO: should take an APP and visit LHS */
    | { rewrite: { focus: Exp(APP(f, x)), ctxts }, env } => Some({ rewrite: { focus: Exp(f), ctxts:
    [APPL((), x), ...ctxts] }, env })

    // [101]
    /* TODO: may want a more coarse-grained traversal, not sure */
    | { rewrite: { focus: Val(BASVAL(f)), ctxts: [APPL((), a), ...ctxts] }, env } => Some({ rewrite:
    { focus: AtExp(a), ctxts: [APPR(BASVAL(f), ()), ...ctxts] }, env })
    | { rewrite: { focus: Val(v), ctxts: [APPR(BASVAL(f), ()), ...ctxts] }, env } => Some({ rewrite:
    { focus: Val(apply(f, v)), ctxts }, env })

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

    /* ... */

    /* Structure-level Declarations */
    // [156]
    | { rewrite: { focus: StrDec(DEC(d)), ctxts }, env } => Some({ rewrite: { focus: Dec(d), ctxts
    }, env })

    // [160]
    | { rewrite: { focus: StrDec(SEQ(sd1, sd2)), ctxts }, env } => Some({ rewrite: { focus:
    StrDec(sd1), ctxts: [SEQL((), sd2), ...ctxts] }, env })
    | { rewrite: { focus: Empty, ctxts: [SEQL((), sd2), ...ctxts] }, env } => Some({ rewrite: {
    focus: StrDec(sd2), ctxts }, env })

    /* ... */

    /* Top-level Declarations */
    // [184ish]
    | { rewrite: { focus: TopDec(STRDEC(sd, None)), ctxts }, env } => Some({ rewrite: { focus: StrDec(sd),
    ctxts }, env })
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

let inject = (e) => { rewrite: { focus: e, ctxts: [] }, env: [("+", BASVAL("+"))] };

let interpretTraceBounded = (~maxDepth=100, p) => TheiaUtil.takeWhileInclusive((c) => !isFinal(c), TheiaUtil.iterateMaybeMaxDepth(maxDepth, step, inject(p)));
let interpretTrace = (p) => TheiaUtil.takeWhileInclusive((c) => !isFinal(c), TheiaUtil.iterateMaybe(step, inject(p)));

// let extract = (c) =>
//   switch (c) {
//     | {frames: [{rewrite: {rewrite: Some(Value(VInt(n)))}}]} => string_of_int(n)
//   };
