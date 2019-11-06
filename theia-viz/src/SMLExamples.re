open SMLV2;

/* example "programs" */
/* 5 */
let ex0 = AtExp(SCON(INT(5)));
/* let val x = 5 in x end */
let ex1 = AtExp(LET(VAL(PLAIN(ATPAT(ID("x")), ATEXP(SCON(INT(5))), None)), ATEXP(ID("x"))));
/* val x = 34 */
let ex2 = TopDec(STRDEC(DEC(VAL(PLAIN(ATPAT(ID("x")),
                      ATEXP(SCON(INT(34))), None))), None));
/* val x = 34; val y = 17 */
let ex3 = TopDec(
            STRDEC(
              SEQ(
                DEC(
                  VAL(PLAIN(ATPAT(ID("x")),
                      ATEXP(SCON(INT(34))), None))), DEC(
                  VAL(PLAIN(ATPAT(ID("y")),
                      ATEXP(SCON(INT(17))), None)))), None));

/* {} () */
let ex4 = AtExp(RECORD(None));
/* { 1=5 } (5,) */
let ex5 = AtExp(RECORD(Some({ lab: "1", exp: ATEXP(SCON(INT(5))), rest: None })))
/* { 1=5, 2=78 } (5, 78) */
let ex6 = AtExp(RECORD(Some({ lab: "1", exp: ATEXP(SCON(INT(5))), rest: Some({ lab: "2", exp:
ATEXP(SCON(INT(78))), rest: None}) })))

/* TODO: no syntax sugar for records -> tuples or infix ops
  val x = 34;
  val y = 17;
  val z = + { 1=5, 2=78 }
*/
let ex7 = TopDec(
            STRDEC(
              SEQ(
                DEC(
                  VAL(PLAIN(ATPAT(ID("x")),
                      ATEXP(SCON(INT(34))), None))),
              SEQ(
                DEC(
                  VAL(PLAIN(ATPAT(ID("y")),
                      ATEXP(SCON(INT(17))), None))),
                DEC(
                  VAL(PLAIN(ATPAT(ID("z")),
                      APP(ATEXP(ID("+")), RECORD(Some({ lab: "1", exp: ATEXP(SCON(INT(5))), rest: Some({ lab: "2", exp:
ATEXP(SCON(INT(78))), rest: None}) }))), None))))), None));

/*
  val x = 34;
  val y = 17;
  val z = (x + y) + (y + 2)
*/
let ex8 = TopDec(
            STRDEC(
              SEQ(
                DEC(
                  VAL(PLAIN(ATPAT(ID("x")),
                      ATEXP(SCON(INT(34))), None))),
              SEQ(
                DEC(
                  VAL(PLAIN(ATPAT(ID("y")),
                      ATEXP(SCON(INT(17))), None))),
                DEC(
                  VAL(PLAIN(ATPAT(ID("z")),
                    APP(ATEXP(ID("+")), RECORD(Some({ lab: "1", exp: ATEXP(PARA(APP(ATEXP(ID("+")), RECORD(Some({ lab: "1", exp: ATEXP(ID("x")), rest: Some({ lab: "2", exp:
ATEXP(ID("y")), rest: None}) }))))), rest: Some({lab: "2", exp: ATEXP(PARA(APP(ATEXP(ID("+")), RECORD(Some({ lab: "1", exp: ATEXP(ID("y")), rest: Some({ lab: "2", exp:
ATEXP(SCON(INT(2))), rest: None}) }))))), rest: None})}))), None))))), None));

/*
  val x = 34;
  val y = 17;
  val z = (x + y) + (y + 2);
  val q = z + 1
*/
let ex9 = TopDec(
            STRDEC(
              SEQ(
                DEC(
                  VAL(PLAIN(ATPAT(ID("x")),
                      ATEXP(SCON(INT(34))), None))),
              SEQ(
                DEC(
                  VAL(PLAIN(ATPAT(ID("y")),
                      ATEXP(SCON(INT(17))), None))),
              SEQ(
                DEC(
                  VAL(PLAIN(ATPAT(ID("z")),
                    APP(ATEXP(ID("+")), RECORD(Some({ lab: "1", exp: ATEXP(PARA(APP(ATEXP(ID("+")), RECORD(Some({ lab: "1", exp: ATEXP(ID("x")), rest: Some({ lab: "2", exp:
ATEXP(ID("y")), rest: None}) }))))), rest: Some({lab: "2", exp: ATEXP(PARA(APP(ATEXP(ID("+")), RECORD(Some({ lab: "1", exp: ATEXP(ID("y")), rest: Some({ lab: "2", exp:
ATEXP(SCON(INT(2))), rest: None}) }))))), rest: None})}))), None))),
                DEC(
                  VAL(PLAIN(ATPAT(ID("q")),
                    APP(ATEXP(ID("+")), RECORD(Some({ lab: "1", exp: ATEXP(ID("z")), rest: Some({lab: "2", exp: ATEXP(SCON(INT(1))), rest: None})}))), None)))))), None));

let ex10 = TopDec(
  STRDEC(
    SEQ(DEC(VAL(PLAIN(ATPAT(ID("a")),
                      ATEXP(SCON(INT(1))), None))),
    SEQ(DEC(VAL(PLAIN(ATPAT(ID("b")),
                      ATEXP(SCON(INT(2))), None))),
        DEC(VAL(PLAIN(ATPAT(ID("a")),
                      ATEXP(SCON(INT(3))), None))))
    )
    , None)
);
