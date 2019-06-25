/* [@bs.module] external jsVisualDiff: ReasonReact.reactClass = "./VisualDiff";

[@bs.deriving abstract]
type jsProps = {
  left: ReasonReact.reactElement,
  right: ReasonReact.reactElement,
};

let make = (~left, ~right, children) =>
  ReasonReact.wrapJsForReason(
    ~reactClass=jsVisualDiff,
    ~props=jsProps(left, right),
    children,
  ); */

/* [@bs.module "../src/react-visual-diff/dist/index.js"][@react.component] */
/* [@bs.module "../node_modules/react-visual-diff/dist/index.js"][@react.component]
external make: (~left: ReasonReact.reactElement, ~right: ReasonReact.reactElement) => React.element = "default"; */
[@bs.module][@react.component]
external make: (~left: ReasonReact.reactElement, ~right: ReasonReact.reactElement) => React.element = "../node_modules/react-visual-diff/dist/index.js";
