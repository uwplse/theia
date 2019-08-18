/* ReactDOMRe.renderToElementWithId(<Component1 message="Hello! Click this text." />, "index1");

ReactDOMRe.renderToElementWithId(<Component2 greeting="Hello!" />, "index2"); */

/* ReactDOMRe.renderToElementWithId(<ParseKAST2 />, "index1"); */
/* ReactDOMRe.renderToElementWithId(<ParseKAST3 />, "index2"); */
/* ReactDOMRe.renderToElementWithId(<ParseKAST4 />, "index3"); */
/* ReactDOMRe.renderToElementWithId(<ParseKAST5 />, "index4"); */

let trace = SMLLec1.exLec0 |> SMLLec1.interpretTrace |> List.map(SMLToTheiaIR.smlToTheiaIR);
ReactDOMRe.renderToElementWithId(<TheiaSML theiaIRTrace=trace />, "index4");

// Js.Console.log(SMLLec1.ex0 |> SMLLec1.interpretTrace |> List.rev |> List.hd |> SMLLec1.extract);
// Js.Console.log(SMLLec1.ex1 |> SMLLec1.interpretTrace |> List.rev |> List.hd |> SMLLec1.extract);
// Js.Console.log(SMLLec1.ex2 |> SMLLec1.interpretTrace |> List.rev |> List.hd |> SMLLec1.extract);
// Js.Console.log(SMLLec1.ex3 |> SMLLec1.interpretTrace |> List.rev |> List.hd |> SMLLec1.extract);

