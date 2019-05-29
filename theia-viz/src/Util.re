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

let prettierList = (ss) => {
  let rec loop = (ss) =>
    switch (ss) {
    | [] => <> </>
    | [s] => <> s </>
    | [s, ...ss] => <> s {React.string(" ")} {loop(ss)} </>
    };
  <> {React.string("(")} {loop(ss)} {React.string(")")} </>
};

/* https://github.com/glennsl/vrroom */
let nbsp = [%raw {|'\u00a0'|}];
