/* Following SML 97 more closely. */
/* Implementation of Section 6 except:
   - no op
   - longvid, lab are Id
   - no id status
   - no tyvarseq
   - no rec
   - no and
   - only Id in lets not Pat
   - only evaluate Dec in let
*/

module SML-SYNTAX
  imports DOMAINS-SYNTAX

  syntax AtPat ::= "_"
                //  | SCon
                 | Id
                //  | "{" PatRow? "}"
                //  | "(" Pat ")" [bracket]

  syntax Pat ::= AtPat

  syntax SCon ::= Int

  syntax Val ::= val(SCon)

  syntax AtExp ::= SCon
                 | Id
                //  | "{" ExpRow? "}"
                 | "let" Dec "in" Exp "end"
                 | "(" Exp ")" [bracket]

  // syntax ExpRow ::= Id "=" Exp ("," ExpRow)?

  syntax Exp ::= AtExp

  syntax Dec ::= "val" ValBind

  syntax ValBind ::= Pat "=" Exp
endmodule

module SML
  imports SML-SYNTAX
  imports DOMAINS

  syntax KResult ::= Val

  configuration <T>
                  <k> $PGM:Exp </k>
                  <env> .Map </env>
                  // <store color="red"> .Map </store>
                </T>

  /* [90] */
  rule <k> S:SCon => val(S) ...</k>

  /* [91] */
  rule <k> X => V ...</k>
       <env>... X |-> V ...</env>

  /* [92]: TODO */
  /* [93ish] */
  rule <k> let D in E end => D ~> E ...</k>

  /* [94]: TODO */

  /* [114ish] */
  rule <k> val VB => VB ...</k>

  /* [124ish] */
  /* TODO: 114 should add to environment. 124 should just evaluate to an environment (or addition to
  it) */
  /* TODO: seems to trigger too early and adds expression to map instead of value */
  rule <k> X = V => . ...</k>
       <env>... .Map => (X |-> V) ...</env>

endmodule
