/* goal: lambda x . x */
let idJson = {| {
  "format": "KAST",
  "version": 1,
  "term": {
    "node": "KApply",
    "label": "<k>",
    "variable": false,
    "arity": 1,
    "args": [
      {
        "node": "KApply",
        "label": "lambda_.__LAMBDA",
        "variable": false,
        "arity": 2,
        "args": [
          {
            "node": "KToken",
            "sort": "KVar",
            "token": "x"
          },
          {
            "node": "KToken",
            "sort": "KVar",
            "token": "x"
          }
        ]
      }
    ]
  }
} |};

/* input
<k>
  ( 1 + 2 * 3 ) / 4 ~> #freezer_<=__LAMBDA1_ ( 1 )
</k>
*/
/* goal
[( 1 + 2 * 3 ) / 4] <= 1
*/

let arithmetic1 = {| {
  "format": "KAST",
  "version": 1,
  "term": {
    "node": "KApply",
    "label": "<k>",
    "variable": false,
    "arity": 1,
    "args": [
      {
        "node": "KApply",
        "label": "#KSequence",
        "variable": false,
        "arity": 2,
        "args": [
          {
            "node": "KApply",
            "label": "_/__LAMBDA",
            "variable": false,
            "arity": 2,
            "args": [
              {
                "node": "KApply",
                "label": "_+__LAMBDA",
                "variable": false,
                "arity": 2,
                "args": [
                  {
                    "node": "KToken",
                    "sort": "Int",
                    "token": "1"
                  },
                  {
                    "node": "KApply",
                    "label": "_*__LAMBDA",
                    "variable": false,
                    "arity": 2,
                    "args": [
                      {
                        "node": "KToken",
                        "sort": "Int",
                        "token": "2"
                      },
                      {
                        "node": "KToken",
                        "sort": "Int",
                        "token": "3"
                      }
                    ]
                  }
                ]
              },
              {
                "node": "KToken",
                "sort": "Int",
                "token": "4"
              }
            ]
          },
          {
            "node": "KApply",
            "label": "#freezer_<=__LAMBDA1_",
            "variable": false,
            "arity": 1,
            "args": [
              {
                "node": "KToken",
                "sort": "Int",
                "token": "1"
              }
            ]
          }
        ]
      }
    ]
  }
} |}

/* input
<k>
  1 + 2 * 3 ~> #freezer_/__LAMBDA1_ ( 4 ) ~> #freezer_<=__LAMBDA1_ ( 1 )
</k>
*/
/* goal
[[( 1 + 2 * 3 )] / 4] <= 1
*/

let arithmetic2 = {|
  {
    "format": "KAST",
    "version": 1,
    "term": {
      "node": "KApply",
      "label": "<k>",
      "variable": false,
      "arity": 1,
      "args": [
        {
          "node": "KApply",
          "label": "#KSequence",
          "variable": false,
          "arity": 2,
          "args": [
            {
              "node": "KApply",
              "label": "_+__LAMBDA",
              "variable": false,
              "arity": 2,
              "args": [
                {
                  "node": "KToken",
                  "sort": "Int",
                  "token": "1"
                },
                {
                  "node": "KApply",
                  "label": "_*__LAMBDA",
                  "variable": false,
                  "arity": 2,
                  "args": [
                    {
                      "node": "KToken",
                      "sort": "Int",
                      "token": "2"
                    },
                    {
                      "node": "KToken",
                      "sort": "Int",
                      "token": "3"
                    }
                  ]
                }
              ]
            },
            {
              "node": "KApply",
              "label": "#KSequence",
              "variable": false,
              "arity": 2,
              "args": [
                {
                  "node": "KApply",
                  "label": "#freezer_/__LAMBDA1_",
                  "variable": false,
                  "arity": 1,
                  "args": [
                    {
                      "node": "KToken",
                      "sort": "Int",
                      "token": "4"
                    }
                  ]
                },
                {
                  "node": "KApply",
                  "label": "#freezer_<=__LAMBDA1_",
                  "variable": false,
                  "arity": 1,
                  "args": [
                    {
                      "node": "KToken",
                      "sort": "Int",
                      "token": "1"
                    }
                  ]
                }
              ]
            }
          ]
        }
      ]
    }
  }
|};

type kNode =
  | Token(string)
  | Apply(list(string), list(kNode))
  /* node and context. todo: need better representation. steal from previous Theia */
  | Kont(kNode, kNode)
  /* like apply, but the list of arguments has a hole at the position specified by the last arg */
  | EvalContext(list(string), list(kNode), int);

let prettyList = (ss) => {
  let rec loop = (ss) =>
    switch (ss) {
    | [] => ""
    | [s] => s
    | [s, ...ss] => s ++ ", " ++ loop(ss)
    };
  "[" ++ loop(ss) ++ "]"
};

let prettierList = (ss) => {
  let rec loop = (ss) =>
    switch (ss) {
    | [] => ""
    | [s] => s
    | [s, ...ss] => s ++ " " ++ loop(ss)
    };
  "(" ++ loop(ss) ++ ")"
};

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

let rec kNodeDebugPrint = (k) =>
  switch (k) {
  | Token(s) => "Token(" ++ s ++ ")"
  | Apply(ss, args) => "Apply(" ++ prettyList(ss) ++ ", " ++ prettyList(List.map(kNodeDebugPrint, args)) ++ ")"
  | Kont(e, ctx) => "Kont(" ++ kNodeDebugPrint(e) ++ ", " ++ kNodeDebugPrint(ctx) ++ ")"
  | EvalContext(s, args, i) => "EvalContext(" ++ prettyList(s) ++ ", " ++ prettyList(List.map(kNodeDebugPrint, args)) ++ ", " ++ string_of_int(i) ++ ")"
  };

let rec kNodePretty = (k) =>
  switch (k) {
  | Token(s) => s
  /* | Apply(s, args) => prettyList(s) ++ ": " ++ prettyList(List.map(kNodePretty, args)) */
  | Apply(s, args) => interleave(s, List.map(kNodePretty, args)) |> prettierList
  /* TODO: need to steal from prev Theia */
  | Kont(e, EvalContext(s, args, i)) => {
    let newArgs = insert("[" ++ kNodePretty(e) ++ "]", List.map(kNodePretty, args), i);
    interleave(s, newArgs) |> prettierList
  }
  | _ => Js.log(kNodeDebugPrint(k)); failwith("node pretty found a structure it shouldn't")
  };

let cleanLabel = (s) => {
  let suffix = "_LAMBDA";
  if (Js.String.endsWith(suffix, s)) {
    Js.String.substring(s, ~from=0, ~to_=(Js.String.length(s) - Js.String.length(suffix)))
  } else {
    s
  }
};

/* extracts name from a freezer */
let extractName = (s) => {
  Js.String.substring(~from=8, ~to_=Js.String.length(s) - 9, s);
}

module Decode = {
  open Json.Decode;

  /* todo: weird hack to get it to compile */
  let rec kNode = () => {
    field("node", string) |> andThen(
      fun (s) =>
        switch (s) {
        | "KApply" => kApply
        | "KToken" => kToken
        | _ => failwith("Unknown node type")
        }
    )
  }
  /* unneccesary function wrapping to skirt let rec limitations */
  and kApply = (json) => {
    (field("label", string) |> andThen(
      fun (s) =>
        switch (s) {
        | "#KSequence" => kontinuation
        | _ when Js.String.startsWith("#freezer", s) => freezer
        | _ => apply
        }
    ))(json)
  }
  and apply = (json) => {
    Apply(
      json |> field("label", string) |> cleanLabel |> Js.String.split("_") |> Array.to_list,
      json |> field("args", list(kNode()))
    )
  }
  and kontinuation = (json) => {
    let (e, ctx) = json |> field("args", pair(kNode(), kNode()));
    Kont(e, ctx)
  }
  and freezer = (json) => {
    let label = json |> field("label", string);
    let holePos = 1 - (label |> Js.String.charAt(Js.String.length(label) - 2) |> int_of_string);
    EvalContext(
      label |> extractName |> Js.String.split("_") |> Array.to_list,
      json |> field("args", list(kNode())),
      holePos
    )
  }
  and kToken = (json) => {
    Token(json |> field("token", string))
  };

  let kAst = (json) => json |> field("term", kNode());
};

let idDecoded = idJson |> Json.parseOrRaise |> Decode.kAst;

let decode = (json) => json |> Json.parseOrRaise |> Decode.kAst;

let handleClick = (_event) => Js.log(arithmetic1 |> decode |> kNodePretty);

[@react.component]
let make = () =>
  <div onClick={handleClick}>
    {ReasonReact.string("foo bar")}
  </div>;
