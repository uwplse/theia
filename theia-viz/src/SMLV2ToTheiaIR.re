/* Compiler from SML configuration to TheiaIR */
open SMLV2;
open TheiaSML;
open Util;

/* I really wish there was a way to write sorry in OCaml/Reason! */
let sorry = Atom(React.string("sorry"));
let sorryFn = (_) => sorry;

let compileSCon = (sc: sCon) =>
  switch (sc) {
    | INT(n) => Atom(React.string(string_of_int(n)))
  };

let rec compileAtExp = (a) =>
  switch (a) {
    | SCON(sc) => compileSCon(sc)
    | ID(x) => Atom(React.string(x))
    // | RECORD(option(expRow))
    | LET(d, e) => Apply2([React.string("let "), React.string(" in "), React.string(" end")],
    [compileDec(d), compileExp(e)])
    | PARA(e) => Apply2([React.string("("), React.string(")")], [compileExp(e)])
  }

and compileExp = (e) =>
  switch (e) {
    | ATEXP(a) => compileAtExp(a)
  }

and compileDec = (d) =>
  switch (d) {
    | VAL(vb) => Apply2([React.string("val "), <> </>], [compileValBind(vb)])
  }

and compileValBind = (vb) =>
  switch (vb) {
    | PLAIN(p, e, None) => Apply2([<> </>, React.string(" = "), <> </>], [compilePat(p), compileExp(e)])
  }

and compileAtPat = (a) =>
  switch (a) {
    | ID(x) => Atom(React.string(x))
  }

and compilePat = (p) =>
  switch (p) {
    | ATPAT(a) => compileAtPat(a)
  };

let compileSVal = (sv: sVal) =>
  switch (sv) {
    | INT(n) => Value2([], [Atom(React.string(string_of_int(n)))])
  };

let compileVal_ = (v) =>
  switch (v) {
    | SVAL(sv) => compileSVal(sv)
  };

let compileFocus = (f) =>
  switch (f) {
    | AtExp(a) => compileAtExp(a)
    | Exp(e) => compileExp(e)
    | Val(v) => compileVal_(v)
    | Dec(d) => compileDec(d)
    | ValBind(vb) => compileValBind(vb)
    | Empty => Atom(React.string(""))
  };

let compileCtxt = (c) =>
  switch (c) {
    | LETD((), e) => { ops: [React.string("let "), React.string(" in "), React.string(" end")], args:
    [compileExp(e)], holePos: 0 }
    | VALBINDE(p, (), None) => { ops: [<> </>, React.string(" = "), <> </>], args: [compilePat(p)], holePos: 1 }
  };

let compileKVs = ((k, v)) => KV2((Atom(React.string(k)), compileVal_(v)));

let compileEnv = (e) => Map2(List.map(compileKVs, e) |> List.rev);

let compileRewrite = ({focus, ctxts}) => Kont2(compileFocus(focus), List.map(compileCtxt, (ctxts)));

let smlV2ToTheiaIR = ({ rewrite, env }) => VSequence([Cell2("env", [compileEnv(env)]),
                                                      Cell2("rewrite", [compileRewrite(rewrite)])]);
