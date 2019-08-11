/* ReactDOMRe.renderToElementWithId(<Component1 message="Hello! Click this text." />, "index1");

ReactDOMRe.renderToElementWithId(<Component2 greeting="Hello!" />, "index2"); */

/* ReactDOMRe.renderToElementWithId(<ParseKAST2 />, "index1"); */
/* ReactDOMRe.renderToElementWithId(<ParseKAST3 />, "index2"); */
/* ReactDOMRe.renderToElementWithId(<ParseKAST4 />, "index3"); */
/* ReactDOMRe.renderToElementWithId(<ParseKAST5 />, "index4"); */
let singleton = (x) => [x];
let compiledEx0 = SMLLec1.ex0 |> SMLLec1.inject |> SMLToTheiaIR.smlToTheiaIR |> singleton;
let ex0Trace = SMLLec1.ex0 |> SMLLec1.interpretTrace |> List.map(SMLToTheiaIR.smlToTheiaIR);
ReactDOMRe.renderToElementWithId(<TheiaSML theiaIRTrace=ex0Trace />, "index4");
