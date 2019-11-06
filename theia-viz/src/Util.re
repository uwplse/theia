let rec interleave = (xs, ys) =>
  switch (xs, ys) {
  | ([], _) => ys
  | ([x, ...xs], _) => [x, ...interleave(ys, xs)]
  };

let split = (list, n) => {
  let rec aux = (i, acc) => fun
    | [] => (List.rev(acc), [])
    | [h, ...t] as l => if (i == 0) { (List.rev(acc), l) }
                        else { aux(i-1, [h, ...acc], t) };
  aux(n, [], list)
};

let insert = (x, xs, i) => {
  let (xs, ys) = split(xs, i);
  xs @ [x, ...ys]
};

let prettierList = (~parens=true, ~space=true, ss) => {
  let parens = false; /* manual override */
  let ss = List.filter((s) => s != React.string{""}, ss);
  let rec loop = (ss) =>
    switch (ss) {
    | [] => <> </>
    | [s] => <> s </>
    | [s, ...ss] =>
        if (space) {
            <> s {React.string(" ")} {loop(ss)} </>
        } else {
            <> s {loop(ss)} </>
        }
    };
  if (parens) {
    <> {React.string("(")} {loop(ss)} {React.string(")")} </>
  } else {
    <> {loop(ss)} </>
  }
};

/* https://github.com/glennsl/vrroom */
let nbsp = [%raw {|'\u00a0'|}];

/* https://dev.to/margaretkrutikova/reasonreact-use-dom-api-and-hooks-to-detect-click-outside-4f74 */
let useKeyPressed = (onKeyPressed: Dom.keyboardEvent => unit) => {
  open Webapi.Dom;
  React.useEffect0(() => {
    Document.addKeyDownEventListener(onKeyPressed, document);
    /* cleanup - unsubscribe on unmount. */
    Some(
      () => Document.removeKeyDownEventListener(onKeyPressed, document),
    );
  });
};

/* https://stackoverflow.com/a/244104 */
let (--) = (i, j) => {
  let rec aux = (n, acc) => if (n < i) { acc } else { aux(n - 1, [n, ...acc]) };
  aux(j, [])
};

let rec lookupOne = (key, oneStack) =>
  switch (oneStack) {
    | [] => None
    | [(k, v), ...oneStack] => if (k == key) { Some(v) } else { lookupOne(key, oneStack) }
  };
