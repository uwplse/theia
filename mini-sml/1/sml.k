// just arithmetic and boolean rewriting with eval ctxts

module SML-SYNTAX
  imports DOMAINS-SYNTAX

syntax Val ::= Int | Bool

syntax Exp ::= Val
             | "(" Exp ")"          [bracket]
// Arithmetic
             | Exp "*" Exp          [strict, left]
             | Exp "/" Exp          [strict]
             > Exp "+" Exp          [strict, left]
             > Exp "<=" Exp         [strict]
endmodule

module SML
  imports SML-SYNTAX
  imports DOMAINS

  syntax KResult ::= Val

// Only a k cell.
  configuration <T>
                  <k> $PGM:Exp </k>
                </T>

// Arithmetic
  rule I1 * I2 => I1 *Int I2
  rule I1 / I2 => I1 /Int I2
  rule I1 + I2 => I1 +Int I2
  rule I1 <= I2 => I1 <=Int I2
endmodule
