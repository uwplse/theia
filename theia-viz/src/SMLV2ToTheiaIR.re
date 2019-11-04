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
    | RECORD(None) => Atom(React.string("()"))
    | RECORD(Some(er)) => Apply2([React.string("{"), React.string("}")], [compileExpRow(er)])
    | LET(d, e) => Apply2([React.string("let "), React.string(" in "), React.string(" end")],
    [compileDec(d), compileExp(e)])
    | PARA(e) => Apply2([React.string("("), React.string(")")], [compileExp(e)])
  }

and compileExpRow = ({ lab, exp, rest}) =>
  switch (rest) {
    | None => Apply2([<> </>, React.string("="), <> </>], [Atom(React.string(lab)),
    compileExp(exp)])
    | Some(er) => Apply2([<> </>, React.string("="), React.string(", "), <> </>], [Atom(React.string(lab)),
    compileExp(exp), compileExpRow(er)])
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

let rec compileVal_ = (v) =>
  switch (v) {
    | SVAL(sv) => compileSVal(sv)
    | RECORD([]) => Value2([], [Atom(React.string("()"))])
    | RECORD(r) => Value2([], [Apply2([React.string("{"), React.string("}")], [compileRecord(r)])])
  }

and compileRecord = (r) =>
  switch (r) {
    | [] => Atom(<> </>)
    | [(l, v)] => Apply2([<> </>, React.string("="), <> </>], [Atom(React.string(l)), compileVal_(v)])
    | [(l, v), ...r] => Apply2([<> </>, React.string("="), React.string(", "), <> </>], [Atom(React.string(l)), compileVal_(v), compileRecord(r)])
  }

let rec compileStrDec = (sd) =>
  switch (sd) {
    | DEC(d) => compileDec(d)
    | SEQ(sd1, sd2) => Apply2([<> </>, <> {React.string(";")} <br/> </>, <> </>], [compileStrDec(sd1),
    compileStrDec(sd2)])
  };

let compileTopDec = (td) =>
  switch (td) {
    | STRDEC(sd, None) => compileStrDec(sd)
  };

let compileFocus = (f) =>
  switch (f) {
    | AtExp(a) => compileAtExp(a)
    | Exp(e) => compileExp(e)
    | Val(v) => compileVal_(v)
    | Dec(d) => compileDec(d)
    | ValBind(vb) => compileValBind(vb)
    | StrDec(sd) => compileStrDec(sd)
    | TopDec(td) => compileTopDec(td)
    | ExpRow(er) => compileExpRow(er)
    | Record(r) => compileRecord(r)
    | Empty => Atom(<> </>)
  };

let compileCtxt = (c) =>
  switch (c) {
    | LETD((), e) => { ops: [React.string("let "), React.string(" in "), React.string(" end")], args:
    [compileExp(e)], holePos: 0 }
    | VALBINDE(p, (), None) => { ops: [<> </>, React.string(" = "), <> </>], args: [compilePat(p)],
    holePos: 1 }
    | SEQL((), sd2) => { ops: [<> </>, <> {React.string(";")} <br/> </>, <> </>], args:
    [compileStrDec(sd2)], holePos: 0 }
    | RECORDER(()) => { ops: [React.string("{"), React.string("}")], args: [], holePos: 0 }
    | EXPROWE(l, (), None) => { ops: [<> </>, React.string("="), <> </>], args: [Atom(React.string(l))],
    holePos: 1 }
    | EXPROWE(l, (), Some(er)) => { ops: [<> </>, React.string("="), React.string(", "), <> </>],
    args: [Atom(React.string(l)), compileExpRow(er)],
    holePos: 1 }
  };

let compileKVs = ((k, v)) => KV2((Atom(React.string(k)), compileVal_(v)));

let compileEnv = (e) => Map2(List.map(compileKVs, e) |> List.rev);

let compileRewrite = ({focus, ctxts}) => Kont2(compileFocus(focus), List.map(compileCtxt, (ctxts)));

let smlV2ToTheiaIR = ({ rewrite, env }) => VSequence([Cell2("env", [compileEnv(env)]),
                                                      Cell2("rewrite", [compileRewrite(rewrite)])]);
