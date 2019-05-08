type line = {
  start: point,
  end_: point,
  thickness: option(int)
}
and point = {
  x: int,
  y: int
};

module Decode = {
  let point = json =>
    Json.Decode.{
      x: json |> field("x", int),
      y: json |> field("y", int)
    };

  let line = json =>
    Json.Decode.{
      start:     json |> field("start", point),
      end_:      json |> field("end", point),
      thickness: json |> optional(field("thickness", int))
    };
};

let data = {| {
  "start": { "x": 1, "y": -4 },
  "end":   { "x": 5, "y": 8 }
} |};

let line = data |> Json.parseOrRaise
                |> Decode.line;

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
  | Apply(string, list(kNode));

let rec kNodePretty = (k) =>
  switch (k) {
  | Token(s) => s
  | Apply(s, args) => s ++ ": [" ++ List.fold_right(fun (s1, s2) => s1 ++ ", " ++ s2, List.map(kNodePretty, args), "") ++ "]"
  };

module IdDecode = {
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
      json |> field("label", string),
      json |> field("args", list(kNode()))
    )
  }
  and kToken = (json) => {
    Token(json |> field("token", string))
  };

  let kAst = (json) => json |> field("term", kNode());
  
  /* {
    term: json |> field("term", )
    x: json |> field("x", int),
    y: json |> field("y", int)
  }; */
};

let idDecoded = idJson |> Json.parseOrRaise |> IdDecode.kAst;

let handleClick = (_event) => Js.log(idDecoded |> kNodePretty);

[@react.component]
let make = () =>
  <div onClick={handleClick}>
    {ReasonReact.string("foo bar")}
  </div>;
