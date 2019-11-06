module MINI-SML-SYNTAX
  imports DOMAINS-SYNTAX

  syntax Val ::= Int

  syntax Dec ::= "val" Id "=" Exp [strict(2)]

  syntax Decs ::= List{Dec,";"}

  syntax Exp ::= Val
               | Id
               | "(" Exp ")" [bracket]
               | Exp "+" Exp [strict, left]

  syntax Val ::= Bool

  syntax Exp ::= Exp "<=" Exp [strict, left]
               | "if" Exp "then" Exp "else" Exp
endmodule

module MINI-SML
  imports MINI-SML-SYNTAX
  imports DOMAINS

  syntax KResult ::= Val

  configuration <T>
                  <k> $PGM:Decs </k>
                  <env> .Map </env>
                </T>

  rule I1:Int + I2:Int => I1 +Int I2

  rule .Decs => .
  rule D:Dec ; Ds:Decs => D ~> Ds

  rule <k> val X = V:Val ~> Ds => Ds </k>
       <env>... .Map => X |-> V </env>

  rule <k> X => V ...</k>
       <env>... X |-> V ...</env>

  rule I1:Int <= I2:Int => I1 <=Int I2

  rule if true  then E else _ => E
  rule if false then _ else E => E

endmodule