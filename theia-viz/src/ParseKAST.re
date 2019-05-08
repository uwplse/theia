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

type kNode =
  | Token(string)
  | Apply(list(string), list(kNode));

let prettyList = (ss) => {
  let rec loop = (ss) =>
    switch (ss) {
    | [] => ""
    | [s] => s
    | [s, ...ss] => s ++ ", " ++ loop(ss)
    };
  "[" ++ loop(ss) ++ "]"
};

let rec prettierList = (ss) =>
  switch (ss) {
  | [] => ""
  | [s] => s
  | [s, ...ss] => s ++ " " ++ prettierList(ss)
  };

let rec interleave = (xs, ys) =>
  switch (xs, ys) {
  | ([], _) => ys
  | ([x, ...xs], _) => [x, ...interleave(ys, xs)]
  };

let rec kNodePretty = (k) =>
  switch (k) {
  | Token(s) => s
  /* | Apply(s, args) => prettyList(s) ++ ": " ++ prettyList(List.map(kNodePretty, args)) */
  | Apply(s, args) => interleave(s, List.map(kNodePretty, args)) |> prettierList
  };

let cleanLabel = (s) => {
  let suffix = "_LAMBDA";
  if (Js.String.endsWith(suffix, s)) {
    Js.String.substring(s, ~from=0, ~to_=(Js.String.length(s) - Js.String.length(suffix)))
  } else {
    s
  }
};

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
  and kApply = (json) => {
    Apply(
      json |> field("label", string) |> cleanLabel |> Js.String.split("_") |> Array.to_list,
      json |> field("args", list(kNode()))
    )
  }
  and kToken = (json) => {
    Token(json |> field("token", string))
  };

  let kAst = (json) => json |> field("term", kNode());
};

let idDecoded = idJson |> Json.parseOrRaise |> Decode.kAst;

let handleClick = (_event) => Js.log(idDecoded |> kNodePretty);

[@react.component]
let make = () =>
  <div onClick={handleClick}>
    {ReasonReact.string("foo bar")}
  </div>;
