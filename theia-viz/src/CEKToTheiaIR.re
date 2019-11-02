open CEK;
open TheiaUtil;
open TheiaSML;

let lambdaSymbol = [%raw {|'\u03bb'|}];
let largeCircle = [%raw {|'\u25ef'|}];

let rec compileLam = ({var, body}) => Apply2([lambdaSymbol, React.string(". "), <> </>],
[Atom(React.string(var)), compileExpr(body)])

and compileExpr = (e) =>
  switch (e) {
    | Var(x) => Atom(React.string(x))
    | App(e1, e2) => Apply2([<> </>, React.string(" "), <> </>], [compileExpr(e1), compileExpr(e2)])
    | Lam(lam) => compileLam(lam)
    | Int(n) => Atom(React.string(string_of_int(n)))
  };

let rec compileValue = (v) =>
  switch (v) {
    | VInt(n) => Value2([], [Atom(React.string(string_of_int(n)))])
    | VClo(lam, env) => Value2(["closure"], [compileLam(lam), renderEnv(compileValue, env)])
  };

let compileC = (c) =>
  switch (c) {
    | Left(e) => compileExpr(e)
    | Right(v) => compileValue(v)
  };

let compileE = renderEnv(compileValue);

let compileFrame = (f) =>
  switch (f) {
    | AppL((), expr, env) => Value2(["AppL"], [Atom(largeCircle), compileExpr(expr), compileE(env)])
    | AppR(value, ()) => Value2(["AppR"], [compileValue(value), Atom(largeCircle)])
  };

let compileK = (k) => VSequence(List.map(compileFrame, k));

let cekToTheiaIR = ({c, e, k}) => VSequence([Cell2("c", [compileC(c)]), Cell2("e", [compileE(e)]),
Cell2("k", [compileK(k)])]);
