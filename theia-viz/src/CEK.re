/* CEK Abstract Machine */
type hole = unit;

type lambda = {var: string, body: expr}
and expr =
  | Var(string)
  | App(expr, expr)
  | Lam(lambda)
  | Int(int)
and value =
  | VInt(int)
  | VClo(lambda, env)
and env = TheiaUtil.env(value)
and frame =
  | AppL(hole, expr, env)
  | AppR(value, hole);

type kont = list(frame);

type configuration = {c: TheiaUtil.either(expr, value), e: env, k: kont};

let step = (c: configuration): option(configuration) =>
  switch (c) {
    | {c: Left(Var(x)), e, k} =>
      switch (TheiaUtil.lookup(x, e)) {
        | None => None
        | Some(v) => Some({c: Right(v), e, k})
      }
    | {c: Left(App(e1, e2)), e, k} => Some({c: Left(e1), e, k: [AppL((), e2, e), ...k]})
    | {c: Left(Lam(lam)), e, k} => Some({c: Right(VClo(lam, e)), e, k})
    | {c: Left(Int(n)), e, k} => Some({c: Right(VInt(n)), e, k})

    | {c: Right(v), e: env1, k: [AppL((), e, env2), ...k]} => Some({c: Left(e), e: env2, k: [AppR(v,
    ()),
    ...k]})
    | {c: Right(v), e: env1, k: [AppR(VClo({var, body}, env2), ()), ...k]} => Some({c: Left(body),
    e: [{key: var, value: v}, ...env2], k})
    | _ => None
  };

let isFinal = (c) => false;

let injectExpr = (e) => {c: Left(e), e: [], k: []};

let interpretTraceBounded = (~maxDepth=100, p) => TheiaUtil.takeWhileInclusive((c) => !isFinal(c), TheiaUtil.iterateMaybeMaxDepth(maxDepth, step, injectExpr(p)));
let interpretTrace = (p) => TheiaUtil.takeWhileInclusive((c) => !isFinal(c),
TheiaUtil.iterateMaybe(step, injectExpr(p)));

let ex0 =
  App(
    App(
      Lam({var: "x", body:
        Lam({var: "y", body:
          Var("x")})}),
      Int(1)
      ),
    Int(2)
  );
