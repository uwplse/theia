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

let compileATExp = (a) =>
  switch (a) {
    | SCON(sc) => compileSCon(sc)
  };

let compileExp = (e) =>
  switch (e) {
    | ATEXP(a) => compileATExp(a)
  };

let compileSVal = (sv: sVal) =>
  switch (sv) {
    | INT(n) => Value2([], [Atom(React.string(string_of_int(n)))])
  };

let compileVal_ = (v) =>
  switch (v) {
    | SVAL(sv) => compileSVal(sv)
  };

let compileExpOrVal = (eov) =>
  switch (eov) {
    | Exp(e) => compileExp(e)
    | Val(v) => compileVal_(v)
  };

let smlV2ToTheiaIR = ({program}) => Cell2("program", [compileExpOrVal(program)]);
