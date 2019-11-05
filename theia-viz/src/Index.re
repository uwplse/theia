/* ReactDOMRe.renderToElementWithId(<Component1 message="Hello! Click this text." />, "index1");

ReactDOMRe.renderToElementWithId(<Component2 greeting="Hello!" />, "index2"); */

/* ReactDOMRe.renderToElementWithId(<ParseKAST2 />, "index1"); */
/* ReactDOMRe.renderToElementWithId(<ParseKAST3 />, "index2"); */
/* ReactDOMRe.renderToElementWithId(<ParseKAST4 />, "index3"); */
/* ReactDOMRe.renderToElementWithId(<ParseKAST5 />, "index4"); */

// let trace = SMLLec1.silly2 |> SMLLec1.interpretTrace |> List.map(SMLToTheiaIR.smlToTheiaIR);
// let trace = CEK.ex0 |> CEK.interpretTrace |> List.map(CEKToTheiaIR.cekToTheiaIR);

type test = {name: string, example: SMLV2.focus};

let tests =
  [
    {name: "ex0", example: SMLV2.ex0},
    {name: "ex1", example: SMLV2.ex1},
    {name: "ex2", example: SMLV2.ex2},
    {name: "ex3", example: SMLV2.ex3},
    {name: "ex4", example: SMLV2.ex4},
    {name: "ex5", example: SMLV2.ex5},
  ]

let trace = ({name, example}) => TheiaSML.{name, states: example |> SMLV2.interpretTrace |> List.map(SMLV2ToTheiaIR.smlV2ToTheiaIR)};

ReactDOMRe.renderToElementWithId(<TheiaSML theiaIRTraces={List.map(trace, tests)} />, "index4");

// Js.Console.log(SMLLec1.ex0 |> SMLLec1.interpretTrace |> List.rev |> List.hd |> SMLLec1.extract);
// Js.Console.log(SMLLec1.ex1 |> SMLLec1.interpretTrace |> List.rev |> List.hd |> SMLLec1.extract);
// Js.Console.log(SMLLec1.ex2 |> SMLLec1.interpretTrace |> List.rev |> List.hd |> SMLLec1.extract);
// Js.Console.log(SMLLec1.ex3 |> SMLLec1.interpretTrace |> List.rev |> List.hd |> SMLLec1.extract);
