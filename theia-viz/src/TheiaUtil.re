open TheiaSML;

/* misc stuff */
type either('a, 'b) =
  | Left('a)
  | Right('b);

/* environment stuff */
type keyVal('a) = {key: string, value: 'a};
type env('a) = list(keyVal('a));

let rec lookup = (k, stack) =>
  switch (stack) {
    | [] => None
    | [{key, value}, ...stack] => if (key == k) { Some(value) } else { lookup(k, stack) }
  }

let renderEnv = (renderValue, env) => {
  Map2(List.map(({key, value}) => KV2((Atom(React.string(key)), renderValue(value))), env))
};

/* interpreter boilerplate */
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
