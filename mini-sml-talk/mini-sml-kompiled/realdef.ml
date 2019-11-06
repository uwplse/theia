open Prelude
open Constants
open Constants.K
open Hooks
module Def = struct
let freshFunction (sort: string) (config: k) (counter: Z.t) : k = interned_bottom
let eval'Hash'argv (c: unit) (config: k) (guard: int) : k = let lbl = 
Lbl'Hash'argv and sort = 
SortList in match c with 
| _ -> try KREFLECTION.hook_argv c lbl sort config freshFunction
with Not_implemented -> match c with 
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize0 c)))])
let const'Hash'argv : k Lazy.t = lazy (eval'Hash'argv () interned_bottom (-1))
let evalnotBool_ (c: k) (config: k) (guard: int) : k = let lbl = 
LblnotBool_ and sort = 
SortBool in match c with 
| _ -> try BOOL.hook_not c lbl sort config freshFunction
with Not_implemented -> match c with 
(*{| rule `` `notBool_`(#token("true","Bool"))=>#token("false","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") [UNIQUE_ID(de18dba5cb1b6e56941a63279edb1d16da29d7a997a3e82cbc2b81b066eadf47) contentStartColumn(8) contentStartLine(325) org.kframework.attributes.Location(Location(325,8,325,29)) org.kframework.attributes.Source(Source(/Users/oft/k/include/builtin/domains.k)) org.kframework.definition.Production(syntax #RuleContent ::= #RuleBody [klabel(#ruleNoConditions) symbol()])]|}*)
| (((Bool true) :: [])) -> ((Bool false) :: [])
(*{| rule `` `notBool_`(#token("false","Bool"))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") [UNIQUE_ID(dbe4d83961158619e994f90623f08be11020d80c56685ef1ec2dd2b15760c474) contentStartColumn(8) contentStartLine(326) org.kframework.attributes.Location(Location(326,8,326,29)) org.kframework.attributes.Source(Source(/Users/oft/k/include/builtin/domains.k)) org.kframework.definition.Production(syntax #RuleContent ::= #RuleBody [klabel(#ruleNoConditions) symbol()])]|}*)
| (((Bool false) :: [])) -> ((Bool true) :: [])
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize1 c)))])
let evalMap'Coln'lookup (c: k * k) (config: k) (guard: int) : k = let lbl = 
LblMap'Coln'lookup and sort = 
SortKItem in match c with 
| _ -> try MAP.hook_lookup c lbl sort config freshFunction
with Not_implemented -> match c with 
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize2 c)))])
let eval'Hash'stderr_K'Hyph'IO (c: unit) (config: k) (guard: int) : k = let lbl = 
Lbl'Hash'stderr_K'Hyph'IO and sort = 
SortInt in match c with 
(*{| rule `` `#stderr_K-IO`(.KList)=>#token("2","Int")`` requires #token("true","Bool") ensures #token("true","Bool") [UNIQUE_ID(11ef087f50cc8e9fe0fe6a8b028370816f2f2a3573af358ab6ca98318723d0e5) contentStartColumn(8) contentStartLine(971) org.kframework.attributes.Location(Location(971,8,971,20)) org.kframework.attributes.Source(Source(/Users/oft/k/include/builtin/domains.k)) org.kframework.definition.Production(syntax #RuleContent ::= #RuleBody [klabel(#ruleNoConditions) symbol()])]|}*)
| () -> ((Lazy.force int2) :: [])
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize0 c)))])
let const'Hash'stderr_K'Hyph'IO : k Lazy.t = lazy (eval'Hash'stderr_K'Hyph'IO () interned_bottom (-1))
let eval'Hash'seek'LPar'_'Comm'_'RPar'_K'Hyph'IO (c: k * k) (config: k) (guard: int) : k = let lbl = 
Lbl'Hash'seek'LPar'_'Comm'_'RPar'_K'Hyph'IO and sort = 
SortK in match c with 
| _ -> try IO.hook_seek c lbl sort config freshFunction
with Not_implemented -> match c with 
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize2 c)))])
let eval_'Hyph'Int__INT'Hyph'COMMON (c: k * k) (config: k) (guard: int) : k = let lbl = 
Lbl_'Hyph'Int__INT'Hyph'COMMON and sort = 
SortInt in match c with 
| _ -> try INT.hook_sub c lbl sort config freshFunction
with Not_implemented -> match c with 
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize2 c)))])
let eval_'Perc'Int__INT'Hyph'COMMON (c: k * k) (config: k) (guard: int) : k = let lbl = 
Lbl_'Perc'Int__INT'Hyph'COMMON and sort = 
SortInt in match c with 
| _ -> try INT.hook_tmod c lbl sort config freshFunction
with Not_implemented -> match c with 
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize2 c)))])
let eval_'Plus'Int_ (c: k * k) (config: k) (guard: int) : k = let lbl = 
Lbl_'Plus'Int_ and sort = 
SortInt in match c with 
| _ -> try INT.hook_add c lbl sort config freshFunction
with Not_implemented -> match c with 
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize2 c)))])
let evalabsInt (c: k) (config: k) (guard: int) : k = let lbl = 
LblabsInt and sort = 
SortInt in match c with 
| _ -> try INT.hook_abs c lbl sort config freshFunction
with Not_implemented -> match c with 
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize1 c)))])
let evalisBool (c: k) (config: k) (guard: int) : k = let lbl = 
LblisBool and sort = 
SortBool in match c with 
| [Bool _] -> [Bool true]
(*{| rule ``isBool(#KToken(#token("Bool","KString"),_))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KToken (SortBool, var__0) :: [])) -> ((Bool true) :: [])
(*{| rule ``isBool(K)=>#token("false","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") [owise()]|}*)
| ((varK_1)) -> ((Bool false) :: [])
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize1 c)))])
let eval_andBool_ (c: k * k) (config: k) (guard: int) : k = let lbl = 
Lbl_andBool_ and sort = 
SortBool in match c with 
| _ -> try BOOL.hook_and c lbl sort config freshFunction
with Not_implemented -> match c with 
(*{| rule `` `_andBool_`(_2,#token("false","Bool"))=>#token("false","Bool")`` requires isBool(_2) ensures #token("true","Bool") [UNIQUE_ID(1a7512841ede635d09556466797d23f3f3cec57fe0fb6a68ce0c3a1cccb0b68f) contentStartColumn(8) contentStartLine(331) org.kframework.attributes.Location(Location(331,8,331,37)) org.kframework.attributes.Source(Source(/Users/oft/k/include/builtin/domains.k)) org.kframework.definition.Production(syntax #RuleContent ::= #RuleBody [klabel(#ruleNoConditions) symbol()])]|}*)
| (((Bool _ as var_2_2) :: []),((Bool false) :: [])) when true && (true) -> ((Bool false) :: [])
(*{| rule `` `_andBool_`(#token("true","Bool"),B)=>B`` requires isBool(B) ensures #token("true","Bool") [UNIQUE_ID(cd0a9b340fae24c9a05126d8df860cb7145fc64875711e36efaa694085559dc0) contentStartColumn(8) contentStartLine(328) org.kframework.attributes.Location(Location(328,8,328,37)) org.kframework.attributes.Source(Source(/Users/oft/k/include/builtin/domains.k)) org.kframework.definition.Production(syntax #RuleContent ::= #RuleBody [klabel(#ruleNoConditions) symbol()])]|}*)
| (((Bool true) :: []),((Bool _ as varB_3) :: [])) when true && (true) -> (varB_3 :: [])
(*{| rule `` `_andBool_`(B,#token("true","Bool"))=>B`` requires isBool(B) ensures #token("true","Bool") [UNIQUE_ID(b598bf51d1c959b7112e06b7f85a391ee5a18108acd52bb65ea27ef0381ed0e0) contentStartColumn(8) contentStartLine(329) org.kframework.attributes.Location(Location(329,8,329,37)) org.kframework.attributes.Source(Source(/Users/oft/k/include/builtin/domains.k)) org.kframework.definition.Production(syntax #RuleContent ::= #RuleBody [klabel(#ruleNoConditions) symbol()])]|}*)
| (((Bool _ as varB_4) :: []),((Bool true) :: [])) when true && (true) -> (varB_4 :: [])
(*{| rule `` `_andBool_`(#token("false","Bool"),_5)=>#token("false","Bool")`` requires isBool(_5) ensures #token("true","Bool") [UNIQUE_ID(e6ebe927ba416a1602679eb0166f22d394adf70452e0505c00f11c036a896253) contentStartColumn(8) contentStartLine(330) org.kframework.attributes.Location(Location(330,8,330,37)) org.kframework.attributes.Source(Source(/Users/oft/k/include/builtin/domains.k)) org.kframework.definition.Production(syntax #RuleContent ::= #RuleBody [klabel(#ruleNoConditions) symbol()])]|}*)
| (((Bool false) :: []),((Bool _ as var_5_5) :: [])) when true && (true) -> ((Bool false) :: [])
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize2 c)))])
let evalisInt (c: k) (config: k) (guard: int) : k = let lbl = 
LblisInt and sort = 
SortBool in match c with 
| [Int _] -> [Bool true]
(*{| rule ``isInt(#KToken(#token("Int","KString"),_))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KToken (SortInt, var__6) :: [])) -> ((Bool true) :: [])
(*{| rule ``isInt(K)=>#token("false","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") [owise()]|}*)
| ((varK_7)) -> ((Bool false) :: [])
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize1 c)))])
let eval_'EqlsEqls'K_ (c: k * k) (config: k) (guard: int) : k = let lbl = 
Lbl_'EqlsEqls'K_ and sort = 
SortBool in match c with 
| _ -> try KEQUAL.hook_eq c lbl sort config freshFunction
with Not_implemented -> match c with 
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize2 c)))])
let eval_'EqlsEqls'Int_ (c: k * k) (config: k) (guard: int) : k = let lbl = 
Lbl_'EqlsEqls'Int_ and sort = 
SortBool in match c with 
| _ -> try INT.hook_eq c lbl sort config freshFunction
with Not_implemented -> match c with 
(*{| rule `` `_==Int_`(I1,I2)=>`_==K_`(I1,I2)`` requires `_andBool_`(isInt(I1),isInt(I2)) ensures #token("true","Bool") [UNIQUE_ID(e92e4aa4a18bee70f2627cdafb8687e2dfcc0dd6a7f8cbb8d1bd17d751c2da2a) contentStartColumn(8) contentStartLine(450) org.kframework.attributes.Location(Location(450,8,450,40)) org.kframework.attributes.Source(Source(/Users/oft/k/include/builtin/domains.k)) org.kframework.definition.Production(syntax #RuleContent ::= #RuleBody [klabel(#ruleNoConditions) symbol()])]|}*)
| (((Int _ as varI1_8) :: []),((Int _ as varI2_9) :: [])) when ((true) && (true)) && (true) -> ((eval_'EqlsEqls'K_((varI1_8 :: []),(varI2_9 :: [])) config (-1)))
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize2 c)))])
let eval_'EqlsSlshEqls'Int__INT'Hyph'COMMON (c: k * k) (config: k) (guard: int) : k = let lbl = 
Lbl_'EqlsSlshEqls'Int__INT'Hyph'COMMON and sort = 
SortBool in match c with 
| _ -> try INT.hook_ne c lbl sort config freshFunction
with Not_implemented -> match c with 
(*{| rule `` `_=/=Int__INT-COMMON`(I1,I2)=>`notBool_`(`_==Int_`(I1,I2))`` requires `_andBool_`(isInt(I1),isInt(I2)) ensures #token("true","Bool") [UNIQUE_ID(c7d2c0a59e08886932e2824ea36b9a6d9035b597454d00e6a2ec8051790008e4) contentStartColumn(8) contentStartLine(451) org.kframework.attributes.Location(Location(451,8,451,53)) org.kframework.attributes.Source(Source(/Users/oft/k/include/builtin/domains.k)) org.kframework.definition.Production(syntax #RuleContent ::= #RuleBody [klabel(#ruleNoConditions) symbol()])]|}*)
| (((Int _ as varI1_10) :: []),((Int _ as varI2_11) :: [])) when ((true) && (true)) && (true) -> ([Bool ((not ((isTrue (eval_'EqlsEqls'Int_((varI1_10 :: []),(varI2_11 :: [])) config (-1))))))])
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize2 c)))])
let eval_modInt__INT'Hyph'COMMON (c: k * k) (config: k) (guard: int) : k = let lbl = 
Lbl_modInt__INT'Hyph'COMMON and sort = 
SortInt in match c with 
| _ -> try INT.hook_emod c lbl sort config freshFunction
with Not_implemented -> match c with 
(*{| rule `` `_modInt__INT-COMMON`(I1,I2)=>`_%Int__INT-COMMON`(`_+Int_`(`_%Int__INT-COMMON`(I1,absInt(I2)),absInt(I2)),absInt(I2))`` requires `_andBool_`(`_andBool_`(isInt(I1),isInt(I2)),`_=/=Int__INT-COMMON`(I2,#token("0","Int"))) ensures #token("true","Bool") [UNIQUE_ID(349e7885d30519af0529362007bdcac08d0c767a4e6d8f2d95738458db480024) concrete() contentStartColumn(5) contentStartLine(442) org.kframework.attributes.Location(Location(442,5,445,23)) org.kframework.attributes.Source(Source(/Users/oft/k/include/builtin/domains.k)) org.kframework.definition.Production(syntax #RuleContent ::= #RuleBody "requires" K [klabel(#ruleRequires) symbol()])]|}*)
| (((Int _ as varI1_12) :: []),((Int _ as varI2_13) :: [])) when ((((true) && (true))) && ((isTrue (eval_'EqlsSlshEqls'Int__INT'Hyph'COMMON((varI2_13 :: []),((Lazy.force int0) :: [])) config (-1))))) && (true) -> ((eval_'Perc'Int__INT'Hyph'COMMON(((eval_'Plus'Int_(((eval_'Perc'Int__INT'Hyph'COMMON((varI1_12 :: []),((evalabsInt((varI2_13 :: [])) config (-1)))) config (-1))),((evalabsInt((varI2_13 :: [])) config (-1)))) config (-1))),((evalabsInt((varI2_13 :: [])) config (-1)))) config (-1)))
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize2 c)))])
let eval_'_GT__GT_'Int__INT'Hyph'COMMON (c: k * k) (config: k) (guard: int) : k = let lbl = 
Lbl_'_GT__GT_'Int__INT'Hyph'COMMON and sort = 
SortInt in match c with 
| _ -> try INT.hook_shr c lbl sort config freshFunction
with Not_implemented -> match c with 
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize2 c)))])
let eval_'_LT__LT_'Int__INT'Hyph'COMMON (c: k * k) (config: k) (guard: int) : k = let lbl = 
Lbl_'_LT__LT_'Int__INT'Hyph'COMMON and sort = 
SortInt in match c with 
| _ -> try INT.hook_shl c lbl sort config freshFunction
with Not_implemented -> match c with 
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize2 c)))])
let evalbitRangeInt (c: k * k * k) (config: k) (guard: int) : k = let lbl = 
LblbitRangeInt and sort = 
SortInt in match c with 
| _ -> try INT.hook_bitRange c lbl sort config freshFunction
with Not_implemented -> match c with 
(*{| rule ``bitRangeInt(I,IDX,LEN)=>`_modInt__INT-COMMON`(`_>>Int__INT-COMMON`(I,IDX),`_<<Int__INT-COMMON`(#token("1","Int"),LEN))`` requires `_andBool_`(`_andBool_`(isInt(I),isInt(LEN)),isInt(IDX)) ensures #token("true","Bool") [UNIQUE_ID(9696fb097653d3bf835ff69704900862729ac3ea931db4dee5980a03febf253f) contentStartColumn(8) contentStartLine(435) org.kframework.attributes.Location(Location(435,8,435,85)) org.kframework.attributes.Source(Source(/Users/oft/k/include/builtin/domains.k)) org.kframework.definition.Production(syntax #RuleContent ::= #RuleBody [klabel(#ruleNoConditions) symbol()])]|}*)
| (((Int _ as varI_14) :: []),((Int _ as varIDX_15) :: []),((Int _ as varLEN_16) :: [])) when ((((true) && (true))) && (true)) && (true) -> ((eval_modInt__INT'Hyph'COMMON(((eval_'_GT__GT_'Int__INT'Hyph'COMMON((varI_14 :: []),(varIDX_15 :: [])) config (-1))),((eval_'_LT__LT_'Int__INT'Hyph'COMMON(((Lazy.force int1) :: []),(varLEN_16 :: [])) config (-1)))) config (-1)))
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize3 c)))])
let evalsignExtendBitRangeInt (c: k * k * k) (config: k) (guard: int) : k = let lbl = 
LblsignExtendBitRangeInt and sort = 
SortInt in match c with 
| _ -> try INT.hook_signExtendBitRange c lbl sort config freshFunction
with Not_implemented -> match c with 
(*{| rule ``signExtendBitRangeInt(I,IDX,LEN)=>`_-Int__INT-COMMON`(`_modInt__INT-COMMON`(`_+Int_`(bitRangeInt(I,IDX,LEN),`_<<Int__INT-COMMON`(#token("1","Int"),`_-Int__INT-COMMON`(LEN,#token("1","Int")))),`_<<Int__INT-COMMON`(#token("1","Int"),LEN)),`_<<Int__INT-COMMON`(#token("1","Int"),`_-Int__INT-COMMON`(LEN,#token("1","Int"))))`` requires `_andBool_`(`_andBool_`(isInt(I),isInt(LEN)),isInt(IDX)) ensures #token("true","Bool") [UNIQUE_ID(e7fdd3409040e5f315e4dbb166f3b5e776f841624be94972e6f7fb488b9818d5) contentStartColumn(8) contentStartLine(437) org.kframework.attributes.Location(Location(437,8,437,164)) org.kframework.attributes.Source(Source(/Users/oft/k/include/builtin/domains.k)) org.kframework.definition.Production(syntax #RuleContent ::= #RuleBody [klabel(#ruleNoConditions) symbol()])]|}*)
| (((Int _ as varI_17) :: []),((Int _ as varIDX_18) :: []),((Int _ as varLEN_19) :: [])) when ((((true) && (true))) && (true)) && (true) -> ((eval_'Hyph'Int__INT'Hyph'COMMON(((eval_modInt__INT'Hyph'COMMON(((eval_'Plus'Int_(((evalbitRangeInt((varI_17 :: []),(varIDX_18 :: []),(varLEN_19 :: [])) config (-1))),((eval_'_LT__LT_'Int__INT'Hyph'COMMON(((Lazy.force int1) :: []),((eval_'Hyph'Int__INT'Hyph'COMMON((varLEN_19 :: []),((Lazy.force int1) :: [])) config (-1)))) config (-1)))) config (-1))),((eval_'_LT__LT_'Int__INT'Hyph'COMMON(((Lazy.force int1) :: []),(varLEN_19 :: [])) config (-1)))) config (-1))),((eval_'_LT__LT_'Int__INT'Hyph'COMMON(((Lazy.force int1) :: []),((eval_'Hyph'Int__INT'Hyph'COMMON((varLEN_19 :: []),((Lazy.force int1) :: [])) config (-1)))) config (-1)))) config (-1)))
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize3 c)))])
let eval_'EqlsEqls'Bool__BOOL (c: k * k) (config: k) (guard: int) : k = let lbl = 
Lbl_'EqlsEqls'Bool__BOOL and sort = 
SortBool in match c with 
| _ -> try BOOL.hook_eq c lbl sort config freshFunction
with Not_implemented -> match c with 
(*{| rule `` `_==Bool__BOOL`(K1,K2)=>`_==K_`(K1,K2)`` requires `_andBool_`(isBool(K1),isBool(K2)) ensures #token("true","Bool") [UNIQUE_ID(a17699668426366833f88851c95d611be854ecef7a676d2061669bf689f05fd1) contentStartColumn(8) contentStartLine(824) org.kframework.attributes.Location(Location(824,8,824,43)) org.kframework.attributes.Source(Source(/Users/oft/k/include/builtin/domains.k)) org.kframework.definition.Production(syntax #RuleContent ::= #RuleBody [klabel(#ruleNoConditions) symbol()])]|}*)
| (((Bool _ as varK1_20) :: []),((Bool _ as varK2_21) :: [])) when ((true) && (true)) && (true) -> ((eval_'EqlsEqls'K_((varK1_20 :: []),(varK2_21 :: [])) config (-1)))
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize2 c)))])
let evalisSet (c: k) (config: k) (guard: int) : k = let lbl = 
LblisSet and sort = 
SortBool in match c with 
| [Set (s,_,_)] when (s = SortSet) -> [Bool true]
(*{| rule ``isSet(#KToken(#token("Set","KString"),_))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KToken (SortSet, var__22) :: [])) -> ((Bool true) :: [])
(*{| rule ``isSet(K)=>#token("false","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") [owise()]|}*)
| ((varK_23)) -> ((Bool false) :: [])
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize1 c)))])
let eval'Hash'getenv (c: k) (config: k) (guard: int) : k = let lbl = 
Lbl'Hash'getenv and sort = 
SortString in match c with 
| _ -> try KREFLECTION.hook_getenv c lbl sort config freshFunction
with Not_implemented -> match c with 
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize1 c)))])
let eval'Hash'parseKAST (c: k) (config: k) (guard: int) : k = let lbl = 
Lbl'Hash'parseKAST and sort = 
SortKItem in match c with 
| _ -> try KREFLECTION.hook_parseKAST c lbl sort config freshFunction
with Not_implemented -> match c with 
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize1 c)))])
let evalintersectSet (c: k * k) (config: k) (guard: int) : k = let lbl = 
LblintersectSet and sort = 
SortSet in match c with 
| _ -> try SET.hook_intersection c lbl sort config freshFunction
with Not_implemented -> match c with 
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize2 c)))])
let eval_in_keys'LPar'_'RPar'_MAP (c: k * k) (config: k) (guard: int) : k = let lbl = 
Lbl_in_keys'LPar'_'RPar'_MAP and sort = 
SortBool in match c with 
| _ -> try MAP.hook_in_keys c lbl sort config freshFunction
with Not_implemented -> match c with 
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize2 c)))])
let evalisString (c: k) (config: k) (guard: int) : k = let lbl = 
LblisString and sort = 
SortBool in match c with 
| [String _] -> [Bool true]
(*{| rule ``isString(#KToken(#token("String","KString"),_))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KToken (SortString, var__24) :: [])) -> ((Bool true) :: [])
(*{| rule ``isString(K)=>#token("false","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") [owise()]|}*)
| ((varK_25)) -> ((Bool false) :: [])
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize1 c)))])
let eval'Hash'if_'Hash'then_'Hash'else_'Hash'fi_K'Hyph'EQUAL (c: k * k * k) (config: k) (guard: int) : k = let lbl = 
Lbl'Hash'if_'Hash'then_'Hash'else_'Hash'fi_K'Hyph'EQUAL and sort = 
SortK in match c with 
| _ -> try KEQUAL.hook_ite c lbl sort config freshFunction
with Not_implemented -> match c with 
(*{| rule `` `#if_#then_#else_#fi_K-EQUAL`(C,B1,_11)=>B1`` requires `_andBool_`(isBool(C),C) ensures #token("true","Bool") [UNIQUE_ID(0883a4d4051090478d6b8a7ac8d4e0e15e7708308fa24e63137b9ac7e87383aa) contentStartColumn(8) contentStartLine(828) org.kframework.attributes.Location(Location(828,8,828,59)) org.kframework.attributes.Source(Source(/Users/oft/k/include/builtin/domains.k)) org.kframework.definition.Production(syntax #RuleContent ::= #RuleBody "requires" K [klabel(#ruleRequires) symbol()])]|}*)
| (((Bool _ as varC_26) :: []),(varB1_27),(var_11_28)) when ((true) && ((isTrue [varC_26]))) && (true) -> (varB1_27)
(*{| rule `` `#if_#then_#else_#fi_K-EQUAL`(C,_10,B2)=>B2`` requires `_andBool_`(isBool(C),`notBool_`(C)) ensures #token("true","Bool") [UNIQUE_ID(d46b5ae094d17de19ef9725da497c32e21813c6e4b5a0d6a2c4b03bd55bb312c) contentStartColumn(8) contentStartLine(829) org.kframework.attributes.Location(Location(829,8,829,67)) org.kframework.attributes.Source(Source(/Users/oft/k/include/builtin/domains.k)) org.kframework.definition.Production(syntax #RuleContent ::= #RuleBody "requires" K [klabel(#ruleRequires) symbol()])]|}*)
| (((Bool _ as varC_29) :: []),(var_10_30),(varB2_31)) when ((true) && ((not ((isTrue [varC_29]))))) && (true) -> (varB2_31)
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize3 c)))])
let evalfindString (c: k * k * k) (config: k) (guard: int) : k = let lbl = 
LblfindString and sort = 
SortInt in match c with 
| _ -> try STRING.hook_find c lbl sort config freshFunction
with Not_implemented -> match c with 
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize3 c)))])
let evalsubstrString (c: k * k * k) (config: k) (guard: int) : k = let lbl = 
LblsubstrString and sort = 
SortString in match c with 
| _ -> try STRING.hook_substr c lbl sort config freshFunction
with Not_implemented -> match c with 
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize3 c)))])
let evallengthString (c: k) (config: k) (guard: int) : k = let lbl = 
LbllengthString and sort = 
SortInt in match c with 
| _ -> try STRING.hook_length c lbl sort config freshFunction
with Not_implemented -> match c with 
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize1 c)))])
let eval_'_LT_Eqls'Int__INT'Hyph'COMMON (c: k * k) (config: k) (guard: int) : k = let lbl = 
Lbl_'_LT_Eqls'Int__INT'Hyph'COMMON and sort = 
SortBool in match c with 
| _ -> try INT.hook_le c lbl sort config freshFunction
with Not_implemented -> match c with 
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize2 c)))])
let eval_'_GT_Eqls'Int__INT'Hyph'COMMON (c: k * k) (config: k) (guard: int) : k = let lbl = 
Lbl_'_GT_Eqls'Int__INT'Hyph'COMMON and sort = 
SortBool in match c with 
| _ -> try INT.hook_ge c lbl sort config freshFunction
with Not_implemented -> match c with 
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize2 c)))])
let evalminInt'LPar'_'Comm'_'RPar'_INT'Hyph'COMMON (c: k * k) (config: k) (guard: int) : k = let lbl = 
LblminInt'LPar'_'Comm'_'RPar'_INT'Hyph'COMMON and sort = 
SortInt in match c with 
| _ -> try INT.hook_min c lbl sort config freshFunction
with Not_implemented -> match c with 
(*{| rule `` `minInt(_,_)_INT-COMMON`(I1,I2)=>I1`` requires `_andBool_`(`_andBool_`(isInt(I1),isInt(I2)),`_<=Int__INT-COMMON`(I1,I2)) ensures #token("true","Bool") [UNIQUE_ID(628811b0dff29238f352c2487c3ce94602588937778cb87756bde97ae8e06bdd) contentStartColumn(8) contentStartLine(447) org.kframework.attributes.Location(Location(447,8,447,57)) org.kframework.attributes.Source(Source(/Users/oft/k/include/builtin/domains.k)) org.kframework.definition.Production(syntax #RuleContent ::= #RuleBody "requires" K [klabel(#ruleRequires) symbol()])]|}*)
| (((Int _ as varI1_32) :: []),((Int _ as varI2_33) :: [])) when ((((true) && (true))) && ((isTrue (eval_'_LT_Eqls'Int__INT'Hyph'COMMON((varI1_32 :: []),(varI2_33 :: [])) config (-1))))) && (true) -> (varI1_32 :: [])
(*{| rule `` `minInt(_,_)_INT-COMMON`(I1,I2)=>I2`` requires `_andBool_`(`_andBool_`(isInt(I1),isInt(I2)),`_>=Int__INT-COMMON`(I1,I2)) ensures #token("true","Bool") [UNIQUE_ID(cdd4c3d99d0c5dcd705812c2c27997c1ea94506fa425495494c4123b96bc5ffb) contentStartColumn(8) contentStartLine(448) org.kframework.attributes.Location(Location(448,8,448,57)) org.kframework.attributes.Source(Source(/Users/oft/k/include/builtin/domains.k)) org.kframework.definition.Production(syntax #RuleContent ::= #RuleBody "requires" K [klabel(#ruleRequires) symbol()])]|}*)
| (((Int _ as varI1_34) :: []),((Int _ as varI2_35) :: [])) when ((((true) && (true))) && ((isTrue (eval_'_GT_Eqls'Int__INT'Hyph'COMMON((varI1_34 :: []),(varI2_35 :: [])) config (-1))))) && (true) -> (varI2_35 :: [])
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize2 c)))])
let eval_'EqlsEqls'String__STRING (c: k * k) (config: k) (guard: int) : k = let lbl = 
Lbl_'EqlsEqls'String__STRING and sort = 
SortBool in match c with 
| _ -> try STRING.hook_eq c lbl sort config freshFunction
with Not_implemented -> match c with 
(*{| rule `` `_==String__STRING`(S1,S2)=>`_==K_`(S1,S2)`` requires `_andBool_`(isString(S2),isString(S1)) ensures #token("true","Bool") [UNIQUE_ID(daddd877c886e178648c9a2a7a5b307a0f59225ac211c099829b467bb5ebf98d) contentStartColumn(8) contentStartLine(583) org.kframework.attributes.Location(Location(583,8,583,49)) org.kframework.attributes.Source(Source(/Users/oft/k/include/builtin/domains.k)) org.kframework.definition.Production(syntax #RuleContent ::= #RuleBody [klabel(#ruleNoConditions) symbol()])]|}*)
| (((String _ as varS1_36) :: []),((String _ as varS2_37) :: [])) when ((true) && (true)) && (true) -> ((eval_'EqlsEqls'K_((varS1_36 :: []),(varS2_37 :: [])) config (-1)))
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize2 c)))])
let eval_'EqlsSlshEqls'String__STRING (c: k * k) (config: k) (guard: int) : k = let lbl = 
Lbl_'EqlsSlshEqls'String__STRING and sort = 
SortBool in match c with 
| _ -> try STRING.hook_ne c lbl sort config freshFunction
with Not_implemented -> match c with 
(*{| rule `` `_=/=String__STRING`(S1,S2)=>`notBool_`(`_==String__STRING`(S1,S2))`` requires `_andBool_`(isString(S2),isString(S1)) ensures #token("true","Bool") [UNIQUE_ID(2a5c8974455ca9cde473273aeca1a4fa8072aa68d104bc94daa71ee7bf52c8a4) contentStartColumn(8) contentStartLine(582) org.kframework.attributes.Location(Location(582,8,582,65)) org.kframework.attributes.Source(Source(/Users/oft/k/include/builtin/domains.k)) org.kframework.definition.Production(syntax #RuleContent ::= #RuleBody [klabel(#ruleNoConditions) symbol()])]|}*)
| (((String _ as varS1_38) :: []),((String _ as varS2_39) :: [])) when ((true) && (true)) && (true) -> ([Bool ((not ((isTrue (eval_'EqlsEqls'String__STRING((varS1_38 :: []),(varS2_39 :: [])) config (-1))))))])
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize2 c)))])
let rec evalfindChar (c: k * k * k) (config: k) (guard: int) : k = let lbl = 
LblfindChar and sort = 
SortInt in match c with 
| _ -> try STRING.hook_findChar c lbl sort config freshFunction
with Not_implemented -> match c with 
(*{| rule ``findChar(_13,#token("\"\"","String"),_14)=>#token("-1","Int")`` requires `_andBool_`(isInt(_14),isString(_13)) ensures #token("true","Bool") [UNIQUE_ID(3c92cdc7bbe8b210d199a92b38a24538ca780f801572b653c3cb72d6d89a2adf) contentStartColumn(8) contentStartLine(600) org.kframework.attributes.Location(Location(600,8,600,32)) org.kframework.attributes.Source(Source(/Users/oft/k/include/builtin/domains.k)) org.kframework.definition.Production(syntax #RuleContent ::= #RuleBody [klabel(#ruleNoConditions) symbol()])]|}*)
| (((String _ as var_13_40) :: []),((String "") :: []),((Int _ as var_14_41) :: [])) when ((true) && (true)) && (true) -> ((Lazy.force int'Hyph'1) :: [])
(*{| rule ``findChar(S1,S2,I)=>`#if_#then_#else_#fi_K-EQUAL`(`_==Int_`(findString(S1,substrString(S2,#token("0","Int"),#token("1","Int")),I),#token("-1","Int")),findChar(S1,substrString(S2,#token("1","Int"),lengthString(S2)),I),`#if_#then_#else_#fi_K-EQUAL`(`_==Int_`(findChar(S1,substrString(S2,#token("1","Int"),lengthString(S2)),I),#token("-1","Int")),findString(S1,substrString(S2,#token("0","Int"),#token("1","Int")),I),`minInt(_,_)_INT-COMMON`(findString(S1,substrString(S2,#token("0","Int"),#token("1","Int")),I),findChar(S1,substrString(S2,#token("1","Int"),lengthString(S2)),I))))`` requires `_andBool_`(`_andBool_`(`_andBool_`(isInt(I),isString(S2)),isString(S1)),`_=/=String__STRING`(S2,#token("\"\"","String"))) ensures #token("true","Bool") [UNIQUE_ID(65605752e9d4c91bc32766eee7d89780c8af9cf625a388482ac4c557df876d0e) contentStartColumn(8) contentStartLine(599) org.kframework.attributes.Location(Location(599,8,599,431)) org.kframework.attributes.Source(Source(/Users/oft/k/include/builtin/domains.k)) org.kframework.definition.Production(syntax #RuleContent ::= #RuleBody "requires" K [klabel(#ruleRequires) symbol()])]|}*)
| (((String _ as varS1_42) :: []),((String _ as varS2_43) :: []),((Int _ as varI_44) :: [])) when ((((((true) && (true))) && (true))) && ((isTrue (eval_'EqlsSlshEqls'String__STRING((varS2_43 :: []),((String "") :: [])) config (-1))))) && (true) -> ((if ((isTrue (eval_'EqlsEqls'Int_(((evalfindString((varS1_42 :: []),((evalsubstrString((varS2_43 :: []),((Lazy.force int0) :: []),((Lazy.force int1) :: [])) config (-1))),(varI_44 :: [])) config (-1))),((Lazy.force int'Hyph'1) :: [])) config (-1)))) then (((evalfindChar((varS1_42 :: []),((evalsubstrString((varS2_43 :: []),((Lazy.force int1) :: []),((evallengthString((varS2_43 :: [])) config (-1)))) config (-1))),(varI_44 :: [])) config (-1)))) else (((if ((isTrue (eval_'EqlsEqls'Int_(((evalfindChar((varS1_42 :: []),((evalsubstrString((varS2_43 :: []),((Lazy.force int1) :: []),((evallengthString((varS2_43 :: [])) config (-1)))) config (-1))),(varI_44 :: [])) config (-1))),((Lazy.force int'Hyph'1) :: [])) config (-1)))) then (((evalfindString((varS1_42 :: []),((evalsubstrString((varS2_43 :: []),((Lazy.force int0) :: []),((Lazy.force int1) :: [])) config (-1))),(varI_44 :: [])) config (-1)))) else (((evalminInt'LPar'_'Comm'_'RPar'_INT'Hyph'COMMON(((evalfindString((varS1_42 :: []),((evalsubstrString((varS2_43 :: []),((Lazy.force int0) :: []),((Lazy.force int1) :: [])) config (-1))),(varI_44 :: [])) config (-1))),((evalfindChar((varS1_42 :: []),((evalsubstrString((varS2_43 :: []),((Lazy.force int1) :: []),((evallengthString((varS2_43 :: [])) config (-1)))) config (-1))),(varI_44 :: [])) config (-1)))) config (-1)))))))))
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize3 c)))])
let evalSet'Coln'in (c: k * k) (config: k) (guard: int) : k = let lbl = 
LblSet'Coln'in and sort = 
SortBool in match c with 
| _ -> try SET.hook_in c lbl sort config freshFunction
with Not_implemented -> match c with 
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize2 c)))])
let evalisK (c: k) (config: k) (guard: int) : k = let lbl = 
LblisK and sort = 
SortBool in match c with 
| [_] -> [Bool true] | _ -> [Bool false]
| [List (s,_,_)] when (s = SortList) -> [Bool true]
| [String _] -> [Bool true]
| [Bool _] -> [Bool true]
| _ -> [Bool true]
| [Map (s,_,_)] when (s = SortMap) -> [Bool true]
| [Int _] -> [Bool true]
| [Float _] -> [Bool true]
| [Set (s,_,_)] when (s = SortSet) -> [Bool true]
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize1 c)))])
let evalString2Int (c: k) (config: k) (guard: int) : k = let lbl = 
LblString2Int and sort = 
SortInt in match c with 
| _ -> try STRING.hook_string2int c lbl sort config freshFunction
with Not_implemented -> match c with 
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize1 c)))])
let eval_'Slsh'Int__INT'Hyph'COMMON (c: k * k) (config: k) (guard: int) : k = let lbl = 
Lbl_'Slsh'Int__INT'Hyph'COMMON and sort = 
SortInt in match c with 
| _ -> try INT.hook_tdiv c lbl sort config freshFunction
with Not_implemented -> match c with 
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize2 c)))])
let eval_'_LT_Eqls'Set__SET (c: k * k) (config: k) (guard: int) : k = let lbl = 
Lbl_'_LT_Eqls'Set__SET and sort = 
SortBool in match c with 
| _ -> try SET.hook_inclusion c lbl sort config freshFunction
with Not_implemented -> match c with 
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize2 c)))])
let evalisIOError (c: k) (config: k) (guard: int) : k = let lbl = 
LblisIOError and sort = 
SortBool in match c with 
(*{| rule ``isIOError(#EDOM(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(Lbl'Hash'EDOM) :: [])) -> ((Bool true) :: [])
(*{| rule ``isIOError(#ECONNRESET(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(Lbl'Hash'ECONNRESET) :: [])) -> ((Bool true) :: [])
(*{| rule ``isIOError(#EISCONN(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(Lbl'Hash'EISCONN) :: [])) -> ((Bool true) :: [])
(*{| rule ``isIOError(#EALREADY(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(Lbl'Hash'EALREADY) :: [])) -> ((Bool true) :: [])
(*{| rule ``isIOError(#EACCES(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(Lbl'Hash'EACCES) :: [])) -> ((Bool true) :: [])
(*{| rule ``isIOError(#EINPROGRESS(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(Lbl'Hash'EINPROGRESS) :: [])) -> ((Bool true) :: [])
(*{| rule ``isIOError(#ENOTCONN(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(Lbl'Hash'ENOTCONN) :: [])) -> ((Bool true) :: [])
(*{| rule ``isIOError(#ENODEV(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(Lbl'Hash'ENODEV) :: [])) -> ((Bool true) :: [])
(*{| rule ``isIOError(#ENOTSOCK(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(Lbl'Hash'ENOTSOCK) :: [])) -> ((Bool true) :: [])
(*{| rule ``isIOError(#ERANGE(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(Lbl'Hash'ERANGE) :: [])) -> ((Bool true) :: [])
(*{| rule ``isIOError(#ENAMETOOLONG(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(Lbl'Hash'ENAMETOOLONG) :: [])) -> ((Bool true) :: [])
(*{| rule ``isIOError(#EDESTADDRREQ(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(Lbl'Hash'EDESTADDRREQ) :: [])) -> ((Bool true) :: [])
(*{| rule ``isIOError(#EOF(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(Lbl'Hash'EOF) :: [])) -> ((Bool true) :: [])
(*{| rule ``isIOError(#ENFILE(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(Lbl'Hash'ENFILE) :: [])) -> ((Bool true) :: [])
(*{| rule ``isIOError(#EIO(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(Lbl'Hash'EIO) :: [])) -> ((Bool true) :: [])
(*{| rule ``isIOError(#E2BIG(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(Lbl'Hash'E2BIG) :: [])) -> ((Bool true) :: [])
(*{| rule ``isIOError(#KToken(#token("IOError","KString"),_))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KToken (SortIOError, var__45) :: [])) -> ((Bool true) :: [])
(*{| rule ``isIOError(#ESPIPE(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(Lbl'Hash'ESPIPE) :: [])) -> ((Bool true) :: [])
(*{| rule ``isIOError(#EAGAIN(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(Lbl'Hash'EAGAIN) :: [])) -> ((Bool true) :: [])
(*{| rule ``isIOError(#EPFNOSUPPORT(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(Lbl'Hash'EPFNOSUPPORT) :: [])) -> ((Bool true) :: [])
(*{| rule ``isIOError(#ENOLCK(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(Lbl'Hash'ENOLCK) :: [])) -> ((Bool true) :: [])
(*{| rule ``isIOError(#ENOSYS(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(Lbl'Hash'ENOSYS) :: [])) -> ((Bool true) :: [])
(*{| rule ``isIOError(#EMFILE(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(Lbl'Hash'EMFILE) :: [])) -> ((Bool true) :: [])
(*{| rule ``isIOError(#ENXIO(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(Lbl'Hash'ENXIO) :: [])) -> ((Bool true) :: [])
(*{| rule ``isIOError(#EXDEV(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(Lbl'Hash'EXDEV) :: [])) -> ((Bool true) :: [])
(*{| rule ``isIOError(#ENOTEMPTY(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(Lbl'Hash'ENOTEMPTY) :: [])) -> ((Bool true) :: [])
(*{| rule ``isIOError(#EADDRNOTAVAIL(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(Lbl'Hash'EADDRNOTAVAIL) :: [])) -> ((Bool true) :: [])
(*{| rule ``isIOError(#EINTR(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(Lbl'Hash'EINTR) :: [])) -> ((Bool true) :: [])
(*{| rule ``isIOError(#ELOOP(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(Lbl'Hash'ELOOP) :: [])) -> ((Bool true) :: [])
(*{| rule ``isIOError(#EEXIST(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(Lbl'Hash'EEXIST) :: [])) -> ((Bool true) :: [])
(*{| rule ``isIOError(#EWOULDBLOCK(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(Lbl'Hash'EWOULDBLOCK) :: [])) -> ((Bool true) :: [])
(*{| rule ``isIOError(#EPERM(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(Lbl'Hash'EPERM) :: [])) -> ((Bool true) :: [])
(*{| rule ``isIOError(#ENETRESET(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(Lbl'Hash'ENETRESET) :: [])) -> ((Bool true) :: [])
(*{| rule ``isIOError(#unknownIOError(K0))=>#token("true","Bool")`` requires isInt(K0) ensures #token("true","Bool") []|}*)
| ((KApply1(Lbl'Hash'unknownIOError,((Int _ as varK0_46) :: [])) :: [])) when true && (true) -> ((Bool true) :: [])
(*{| rule ``isIOError(#EPIPE(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(Lbl'Hash'EPIPE) :: [])) -> ((Bool true) :: [])
(*{| rule ``isIOError(#EPROTOTYPE(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(Lbl'Hash'EPROTOTYPE) :: [])) -> ((Bool true) :: [])
(*{| rule ``isIOError(#ENETUNREACH(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(Lbl'Hash'ENETUNREACH) :: [])) -> ((Bool true) :: [])
(*{| rule ``isIOError(#ENOTTY(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(Lbl'Hash'ENOTTY) :: [])) -> ((Bool true) :: [])
(*{| rule ``isIOError(#ENOTDIR(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(Lbl'Hash'ENOTDIR) :: [])) -> ((Bool true) :: [])
(*{| rule ``isIOError(#ECONNREFUSED(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(Lbl'Hash'ECONNREFUSED) :: [])) -> ((Bool true) :: [])
(*{| rule ``isIOError(#ENOPROTOOPT(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(Lbl'Hash'ENOPROTOOPT) :: [])) -> ((Bool true) :: [])
(*{| rule ``isIOError(#noParse(K0))=>#token("true","Bool")`` requires isString(K0) ensures #token("true","Bool") []|}*)
| ((KApply1(Lbl'Hash'noParse,((String _ as varK0_47) :: [])) :: [])) when true && (true) -> ((Bool true) :: [])
(*{| rule ``isIOError(#EAFNOSUPPORT(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(Lbl'Hash'EAFNOSUPPORT) :: [])) -> ((Bool true) :: [])
(*{| rule ``isIOError(#EFBIG(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(Lbl'Hash'EFBIG) :: [])) -> ((Bool true) :: [])
(*{| rule ``isIOError(#ECONNABORTED(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(Lbl'Hash'ECONNABORTED) :: [])) -> ((Bool true) :: [])
(*{| rule ``isIOError(#EPROTONOSUPPORT(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(Lbl'Hash'EPROTONOSUPPORT) :: [])) -> ((Bool true) :: [])
(*{| rule ``isIOError(#ENOBUFS(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(Lbl'Hash'ENOBUFS) :: [])) -> ((Bool true) :: [])
(*{| rule ``isIOError(#ETOOMANYREFS(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(Lbl'Hash'ETOOMANYREFS) :: [])) -> ((Bool true) :: [])
(*{| rule ``isIOError(#EMLINK(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(Lbl'Hash'EMLINK) :: [])) -> ((Bool true) :: [])
(*{| rule ``isIOError(#ECHILD(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(Lbl'Hash'ECHILD) :: [])) -> ((Bool true) :: [])
(*{| rule ``isIOError(#ENETDOWN(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(Lbl'Hash'ENETDOWN) :: [])) -> ((Bool true) :: [])
(*{| rule ``isIOError(#EFAULT(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(Lbl'Hash'EFAULT) :: [])) -> ((Bool true) :: [])
(*{| rule ``isIOError(#ESHUTDOWN(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(Lbl'Hash'ESHUTDOWN) :: [])) -> ((Bool true) :: [])
(*{| rule ``isIOError(#EISDIR(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(Lbl'Hash'EISDIR) :: [])) -> ((Bool true) :: [])
(*{| rule ``isIOError(#EBADF(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(Lbl'Hash'EBADF) :: [])) -> ((Bool true) :: [])
(*{| rule ``isIOError(#ETIMEDOUT(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(Lbl'Hash'ETIMEDOUT) :: [])) -> ((Bool true) :: [])
(*{| rule ``isIOError(#EOVERFLOW(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(Lbl'Hash'EOVERFLOW) :: [])) -> ((Bool true) :: [])
(*{| rule ``isIOError(#EADDRINUSE(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(Lbl'Hash'EADDRINUSE) :: [])) -> ((Bool true) :: [])
(*{| rule ``isIOError(#EROFS(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(Lbl'Hash'EROFS) :: [])) -> ((Bool true) :: [])
(*{| rule ``isIOError(#ENOMEM(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(Lbl'Hash'ENOMEM) :: [])) -> ((Bool true) :: [])
(*{| rule ``isIOError(#EBUSY(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(Lbl'Hash'EBUSY) :: [])) -> ((Bool true) :: [])
(*{| rule ``isIOError(#ENOSPC(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(Lbl'Hash'ENOSPC) :: [])) -> ((Bool true) :: [])
(*{| rule ``isIOError(#EOPNOTSUPP(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(Lbl'Hash'EOPNOTSUPP) :: [])) -> ((Bool true) :: [])
(*{| rule ``isIOError(#ESRCH(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(Lbl'Hash'ESRCH) :: [])) -> ((Bool true) :: [])
(*{| rule ``isIOError(#ENOENT(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(Lbl'Hash'ENOENT) :: [])) -> ((Bool true) :: [])
(*{| rule ``isIOError(#EDEADLK(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(Lbl'Hash'EDEADLK) :: [])) -> ((Bool true) :: [])
(*{| rule ``isIOError(#EHOSTDOWN(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(Lbl'Hash'EHOSTDOWN) :: [])) -> ((Bool true) :: [])
(*{| rule ``isIOError(#EINVAL(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(Lbl'Hash'EINVAL) :: [])) -> ((Bool true) :: [])
(*{| rule ``isIOError(#EMSGSIZE(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(Lbl'Hash'EMSGSIZE) :: [])) -> ((Bool true) :: [])
(*{| rule ``isIOError(#EHOSTUNREACH(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(Lbl'Hash'EHOSTUNREACH) :: [])) -> ((Bool true) :: [])
(*{| rule ``isIOError(#ENOEXEC(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(Lbl'Hash'ENOEXEC) :: [])) -> ((Bool true) :: [])
(*{| rule ``isIOError(#ESOCKTNOSUPPORT(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(Lbl'Hash'ESOCKTNOSUPPORT) :: [])) -> ((Bool true) :: [])
(*{| rule ``isIOError(K)=>#token("false","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") [owise()]|}*)
| ((varK_48)) -> ((Bool false) :: [])
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize1 c)))])
let evalmakeList (c: k * k) (config: k) (guard: int) : k = let lbl = 
LblmakeList and sort = 
SortList in match c with 
| _ -> try LIST.hook_make c lbl sort config freshFunction
with Not_implemented -> match c with 
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize2 c)))])
let eval_'LSqB'_'_LT_Hyph'undef'RSqB' (c: k * k) (config: k) (guard: int) : k = let lbl = 
Lbl_'LSqB'_'_LT_Hyph'undef'RSqB' and sort = 
SortMap in match c with 
| _ -> try MAP.hook_remove c lbl sort config freshFunction
with Not_implemented -> match c with 
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize2 c)))])
let eval'Hash'unlock'LPar'_'Comm'_'RPar'_K'Hyph'IO (c: k * k) (config: k) (guard: int) : k = let lbl = 
Lbl'Hash'unlock'LPar'_'Comm'_'RPar'_K'Hyph'IO and sort = 
SortK in match c with 
| _ -> try IO.hook_unlock c lbl sort config freshFunction
with Not_implemented -> match c with 
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize2 c)))])
let eval_andThenBool__BOOL (c: k * k) (config: k) (guard: int) : k = let lbl = 
Lbl_andThenBool__BOOL and sort = 
SortBool in match c with 
| _ -> try BOOL.hook_andThen c lbl sort config freshFunction
with Not_implemented -> match c with 
(*{| rule `` `_andThenBool__BOOL`(#token("true","Bool"),K)=>K`` requires isBool(K) ensures #token("true","Bool") [UNIQUE_ID(b058439c1adf0de5fb7afd07d638d2cda247a4344cbdc14812da46c5db5499df) contentStartColumn(8) contentStartLine(333) org.kframework.attributes.Location(Location(333,8,333,37)) org.kframework.attributes.Source(Source(/Users/oft/k/include/builtin/domains.k)) org.kframework.definition.Production(syntax #RuleContent ::= #RuleBody [klabel(#ruleNoConditions) symbol()])]|}*)
| (((Bool true) :: []),((Bool _ as varK_49) :: [])) when true && (true) -> (varK_49 :: [])
(*{| rule `` `_andThenBool__BOOL`(_0,#token("false","Bool"))=>#token("false","Bool")`` requires isBool(_0) ensures #token("true","Bool") [UNIQUE_ID(d0a6502b90e84545c10a45f7199b2a6d77f52d0841c63dcc792b60073f300e07) contentStartColumn(8) contentStartLine(336) org.kframework.attributes.Location(Location(336,8,336,36)) org.kframework.attributes.Source(Source(/Users/oft/k/include/builtin/domains.k)) org.kframework.definition.Production(syntax #RuleContent ::= #RuleBody [klabel(#ruleNoConditions) symbol()])]|}*)
| (((Bool _ as var_0_50) :: []),((Bool false) :: [])) when true && (true) -> ((Bool false) :: [])
(*{| rule `` `_andThenBool__BOOL`(#token("false","Bool"),_9)=>#token("false","Bool")`` requires isBool(_9) ensures #token("true","Bool") [UNIQUE_ID(34b51d1bff350ce2cd8b17b3af8effdfcf390962b57189087f3cc3b6bbe59cbc) contentStartColumn(8) contentStartLine(335) org.kframework.attributes.Location(Location(335,8,335,36)) org.kframework.attributes.Source(Source(/Users/oft/k/include/builtin/domains.k)) org.kframework.definition.Production(syntax #RuleContent ::= #RuleBody [klabel(#ruleNoConditions) symbol()])]|}*)
| (((Bool false) :: []),((Bool _ as var_9_51) :: [])) when true && (true) -> ((Bool false) :: [])
(*{| rule `` `_andThenBool__BOOL`(K,#token("true","Bool"))=>K`` requires isBool(K) ensures #token("true","Bool") [UNIQUE_ID(1aad8125a2ba7fcbd3c40ac487b7dc776993e9d167ac20f0210e14213abec45f) contentStartColumn(8) contentStartLine(334) org.kframework.attributes.Location(Location(334,8,334,37)) org.kframework.attributes.Source(Source(/Users/oft/k/include/builtin/domains.k)) org.kframework.definition.Production(syntax #RuleContent ::= #RuleBody [klabel(#ruleNoConditions) symbol()])]|}*)
| (((Bool _ as varK_52) :: []),((Bool true) :: [])) when true && (true) -> (varK_52 :: [])
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize2 c)))])
let eval_'ColnSlshEqls'K_ (c: k * k) (config: k) (guard: int) : k = let lbl = 
Lbl_'ColnSlshEqls'K_ and sort = 
SortBool in match c with 
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize2 c)))])
let evalproject'Coln'Set (c: k) (config: k) (guard: int) : k = let lbl = 
Lblproject'Coln'Set and sort = 
SortSet in match c with 
(*{| rule `` `project:Set`(K)=>K`` requires #token("true","Bool") ensures #token("true","Bool") [projection()]|}*)
| (((Set (SortSet,_,_) as varK_53) :: [])) -> (varK_53 :: [])
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize1 c)))])
let eval'Hash'system (c: k) (config: k) (guard: int) : k = let lbl = 
Lbl'Hash'system and sort = 
SortKItem in match c with 
| _ -> try IO.hook_system c lbl sort config freshFunction
with Not_implemented -> match c with 
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize1 c)))])
let evalis'Hash'KVariable (c: k) (config: k) (guard: int) : k = let lbl = 
Lblis'Hash'KVariable and sort = 
SortBool in match c with 
(*{| rule `` `is#KVariable`(#KToken(#token("#KVariable","KString"),_))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KToken (Sort'Hash'KVariable, var__54) :: [])) -> ((Bool true) :: [])
(*{| rule `` `is#KVariable`(K)=>#token("false","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") [owise()]|}*)
| ((varK_55)) -> ((Bool false) :: [])
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize1 c)))])
let evalisList (c: k) (config: k) (guard: int) : k = let lbl = 
LblisList and sort = 
SortBool in match c with 
| [List (s,_,_)] when (s = SortList) -> [Bool true]
(*{| rule ``isList(#KToken(#token("List","KString"),_))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KToken (SortList, var__56) :: [])) -> ((Bool true) :: [])
(*{| rule ``isList(K)=>#token("false","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") [owise()]|}*)
| ((varK_57)) -> ((Bool false) :: [])
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize1 c)))])
let eval_'Plus'String__STRING (c: k * k) (config: k) (guard: int) : k = let lbl = 
Lbl_'Plus'String__STRING and sort = 
SortString in match c with 
| _ -> try STRING.hook_concat c lbl sort config freshFunction
with Not_implemented -> match c with 
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize2 c)))])
let eval_'_GT_'Int__INT'Hyph'COMMON (c: k * k) (config: k) (guard: int) : k = let lbl = 
Lbl_'_GT_'Int__INT'Hyph'COMMON and sort = 
SortBool in match c with 
| _ -> try INT.hook_gt c lbl sort config freshFunction
with Not_implemented -> match c with 
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize2 c)))])
let rec evalreplace'LPar'_'Comm'_'Comm'_'Comm'_'RPar'_STRING (c: k * k * k * k) (config: k) (guard: int) : k = let lbl = 
Lblreplace'LPar'_'Comm'_'Comm'_'Comm'_'RPar'_STRING and sort = 
SortString in match c with 
| _ -> try STRING.hook_replace c lbl sort config freshFunction
with Not_implemented -> match c with 
(*{| rule `` `replace(_,_,_,_)_STRING`(Source,ToReplace,Replacement,Count)=>`_+String__STRING`(`_+String__STRING`(substrString(Source,#token("0","Int"),findString(Source,ToReplace,#token("0","Int"))),Replacement),`replace(_,_,_,_)_STRING`(substrString(Source,`_+Int_`(findString(Source,ToReplace,#token("0","Int")),lengthString(ToReplace)),lengthString(Source)),ToReplace,Replacement,`_-Int__INT-COMMON`(Count,#token("1","Int"))))`` requires `_andBool_`(`_andBool_`(`_andBool_`(`_andBool_`(isString(Replacement),isString(Source)),isInt(Count)),isString(ToReplace)),`_>Int__INT-COMMON`(Count,#token("0","Int"))) ensures #token("true","Bool") [UNIQUE_ID(c31e021d5c1d3c94eacc0f93439f207cdb512dc622c5ca3bbb1993e254e858b2) contentStartColumn(8) contentStartLine(616) org.kframework.attributes.Location(Location(616,8,619,30)) org.kframework.attributes.Source(Source(/Users/oft/k/include/builtin/domains.k)) org.kframework.definition.Production(syntax #RuleContent ::= #RuleBody "requires" K [klabel(#ruleRequires) symbol()])]|}*)
| (((String _ as varSource_58) :: []),((String _ as varToReplace_59) :: []),((String _ as varReplacement_60) :: []),((Int _ as varCount_61) :: [])) when ((((((((true) && (true))) && (true))) && (true))) && ((isTrue (eval_'_GT_'Int__INT'Hyph'COMMON((varCount_61 :: []),((Lazy.force int0) :: [])) config (-1))))) && (true) -> ((eval_'Plus'String__STRING(((eval_'Plus'String__STRING(((evalsubstrString((varSource_58 :: []),((Lazy.force int0) :: []),((evalfindString((varSource_58 :: []),(varToReplace_59 :: []),((Lazy.force int0) :: [])) config (-1)))) config (-1))),(varReplacement_60 :: [])) config (-1))),((evalreplace'LPar'_'Comm'_'Comm'_'Comm'_'RPar'_STRING(((evalsubstrString((varSource_58 :: []),((eval_'Plus'Int_(((evalfindString((varSource_58 :: []),(varToReplace_59 :: []),((Lazy.force int0) :: [])) config (-1))),((evallengthString((varToReplace_59 :: [])) config (-1)))) config (-1))),((evallengthString((varSource_58 :: [])) config (-1)))) config (-1))),(varToReplace_59 :: []),(varReplacement_60 :: []),((eval_'Hyph'Int__INT'Hyph'COMMON((varCount_61 :: []),((Lazy.force int1) :: [])) config (-1)))) config (-1)))) config (-1)))
(*{| rule `` `replace(_,_,_,_)_STRING`(Source,_15,_16,_0)=>Source`` requires `_andBool_`(`_andBool_`(`_andBool_`(isString(Source),isString(_15)),isString(_16)),`_==Int_`(_0,#token("0","Int"))) ensures #token("true","Bool") [UNIQUE_ID(ba5c0b944155cbe05f7bf6c179a2ed1e9baea983ec5099e8449b31926e9b3069) contentStartColumn(8) contentStartLine(620) org.kframework.attributes.Location(Location(620,8,620,49)) org.kframework.attributes.Source(Source(/Users/oft/k/include/builtin/domains.k)) org.kframework.definition.Production(syntax #RuleContent ::= #RuleBody [klabel(#ruleNoConditions) symbol()])]|}*)
| (((String _ as varSource_62) :: []),((String _ as var_15_63) :: []),((String _ as var_16_64) :: []),((Int _ as var_0_65) :: [])) when ((((((true) && (true))) && (true))) && ((isTrue (eval_'EqlsEqls'Int_((var_0_65 :: []),((Lazy.force int0) :: [])) config (-1))))) && (true) -> (varSource_62 :: [])
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize4 c)))])
let eval_'_LT_'Int__INT'Hyph'COMMON (c: k * k) (config: k) (guard: int) : k = let lbl = 
Lbl_'_LT_'Int__INT'Hyph'COMMON and sort = 
SortBool in match c with 
| _ -> try INT.hook_lt c lbl sort config freshFunction
with Not_implemented -> match c with 
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize2 c)))])
let rec evalcountAllOccurrences'LPar'_'Comm'_'RPar'_STRING (c: k * k) (config: k) (guard: int) : k = let lbl = 
LblcountAllOccurrences'LPar'_'Comm'_'RPar'_STRING and sort = 
SortInt in match c with 
| _ -> try STRING.hook_countAllOccurrences c lbl sort config freshFunction
with Not_implemented -> match c with 
(*{| rule `` `countAllOccurrences(_,_)_STRING`(Source,ToCount)=>`_+Int_`(#token("1","Int"),`countAllOccurrences(_,_)_STRING`(substrString(Source,`_+Int_`(findString(Source,ToCount,#token("0","Int")),lengthString(ToCount)),lengthString(Source)),ToCount))`` requires `_andBool_`(`_andBool_`(isString(ToCount),isString(Source)),`_>=Int__INT-COMMON`(findString(Source,ToCount,#token("0","Int")),#token("0","Int"))) ensures #token("true","Bool") [UNIQUE_ID(cac5cc69f22664b9114565589d4bf9e024f060fe6c6e7de8ba1a6258cb131ca6) contentStartColumn(8) contentStartLine(606) org.kframework.attributes.Location(Location(606,8,607,60)) org.kframework.attributes.Source(Source(/Users/oft/k/include/builtin/domains.k)) org.kframework.definition.Production(syntax #RuleContent ::= #RuleBody "requires" K [klabel(#ruleRequires) symbol()])]|}*)
| (((String _ as varSource_66) :: []),((String _ as varToCount_67) :: [])) when ((((true) && (true))) && ((isTrue (eval_'_GT_Eqls'Int__INT'Hyph'COMMON(((evalfindString((varSource_66 :: []),(varToCount_67 :: []),((Lazy.force int0) :: [])) config (-1))),((Lazy.force int0) :: [])) config (-1))))) && (true) -> ((eval_'Plus'Int_(((Lazy.force int1) :: []),((evalcountAllOccurrences'LPar'_'Comm'_'RPar'_STRING(((evalsubstrString((varSource_66 :: []),((eval_'Plus'Int_(((evalfindString((varSource_66 :: []),(varToCount_67 :: []),((Lazy.force int0) :: [])) config (-1))),((evallengthString((varToCount_67 :: [])) config (-1)))) config (-1))),((evallengthString((varSource_66 :: [])) config (-1)))) config (-1))),(varToCount_67 :: [])) config (-1)))) config (-1)))
(*{| rule `` `countAllOccurrences(_,_)_STRING`(Source,ToCount)=>#token("0","Int")`` requires `_andBool_`(`_andBool_`(isString(ToCount),isString(Source)),`_<Int__INT-COMMON`(findString(Source,ToCount,#token("0","Int")),#token("0","Int"))) ensures #token("true","Bool") [UNIQUE_ID(2272bce2d66010123f59618efecda77d2b38bc294ed3846fae6a97aa997f72a4) contentStartColumn(8) contentStartLine(604) org.kframework.attributes.Location(Location(604,8,605,59)) org.kframework.attributes.Source(Source(/Users/oft/k/include/builtin/domains.k)) org.kframework.definition.Production(syntax #RuleContent ::= #RuleBody "requires" K [klabel(#ruleRequires) symbol()])]|}*)
| (((String _ as varSource_68) :: []),((String _ as varToCount_69) :: [])) when ((((true) && (true))) && ((isTrue (eval_'_LT_'Int__INT'Hyph'COMMON(((evalfindString((varSource_68 :: []),(varToCount_69 :: []),((Lazy.force int0) :: [])) config (-1))),((Lazy.force int0) :: [])) config (-1))))) && (true) -> ((Lazy.force int0) :: [])
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize2 c)))])
let evalreplaceAll'LPar'_'Comm'_'Comm'_'RPar'_STRING (c: k * k * k) (config: k) (guard: int) : k = let lbl = 
LblreplaceAll'LPar'_'Comm'_'Comm'_'RPar'_STRING and sort = 
SortString in match c with 
| _ -> try STRING.hook_replaceAll c lbl sort config freshFunction
with Not_implemented -> match c with 
(*{| rule `` `replaceAll(_,_,_)_STRING`(Source,ToReplace,Replacement)=>`replace(_,_,_,_)_STRING`(Source,ToReplace,Replacement,`countAllOccurrences(_,_)_STRING`(Source,ToReplace))`` requires `_andBool_`(`_andBool_`(isString(Replacement),isString(Source)),isString(ToReplace)) ensures #token("true","Bool") [UNIQUE_ID(3358d86b83068ab68fc4f0ed02513db149426f011866db38ff0a5015e8fee30d) contentStartColumn(8) contentStartLine(621) org.kframework.attributes.Location(Location(621,8,621,154)) org.kframework.attributes.Source(Source(/Users/oft/k/include/builtin/domains.k)) org.kframework.definition.Production(syntax #RuleContent ::= #RuleBody [klabel(#ruleNoConditions) symbol()])]|}*)
| (((String _ as varSource_70) :: []),((String _ as varToReplace_71) :: []),((String _ as varReplacement_72) :: [])) when ((((true) && (true))) && (true)) && (true) -> ((evalreplace'LPar'_'Comm'_'Comm'_'Comm'_'RPar'_STRING((varSource_70 :: []),(varToReplace_71 :: []),(varReplacement_72 :: []),((evalcountAllOccurrences'LPar'_'Comm'_'RPar'_STRING((varSource_70 :: []),(varToReplace_71 :: [])) config (-1)))) config (-1)))
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize3 c)))])
let evalproject'Coln'Val (c: k) (config: k) (guard: int) : k = let lbl = 
Lblproject'Coln'Val and sort = 
SortVal in match c with 
(*{| rule `` `project:Val`(K)=>K`` requires #token("true","Bool") ensures #token("true","Bool") [projection()]|}*)
| ((varK_73 :: [])) -> (varK_73 :: [])
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize1 c)))])
let evalisMap (c: k) (config: k) (guard: int) : k = let lbl = 
LblisMap and sort = 
SortBool in match c with 
| [Map (s,_,_)] when (s = SortMap) -> [Bool true]
(*{| rule ``isMap(#KToken(#token("Map","KString"),_))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KToken (SortMap, var__74) :: [])) -> ((Bool true) :: [])
(*{| rule ``isMap(K)=>#token("false","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") [owise()]|}*)
| ((varK_75)) -> ((Bool false) :: [])
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize1 c)))])
let evalisEnvCell (c: k) (config: k) (guard: int) : k = let lbl = 
LblisEnvCell and sort = 
SortBool in match c with 
(*{| rule ``isEnvCell(`<env>`(K0))=>#token("true","Bool")`` requires isMap(K0) ensures #token("true","Bool") []|}*)
| ((KApply1(Lbl'_LT_'env'_GT_',((Map (SortMap,_,_) as varK0_76) :: [])) :: [])) when true && (true) -> ((Bool true) :: [])
(*{| rule ``isEnvCell(#KToken(#token("EnvCell","KString"),_))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KToken (SortEnvCell, var__77) :: [])) -> ((Bool true) :: [])
(*{| rule ``isEnvCell(K)=>#token("false","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") [owise()]|}*)
| ((varK_78)) -> ((Bool false) :: [])
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize1 c)))])
let eval_'_LT_'String__STRING (c: k * k) (config: k) (guard: int) : k = let lbl = 
Lbl_'_LT_'String__STRING and sort = 
SortBool in match c with 
| _ -> try STRING.hook_lt c lbl sort config freshFunction
with Not_implemented -> match c with 
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize2 c)))])
let eval_'_GT_'String__STRING (c: k * k) (config: k) (guard: int) : k = let lbl = 
Lbl_'_GT_'String__STRING and sort = 
SortBool in match c with 
| _ -> try STRING.hook_gt c lbl sort config freshFunction
with Not_implemented -> match c with 
(*{| rule `` `_>String__STRING`(S1,S2)=>`_<String__STRING`(S2,S1)`` requires `_andBool_`(isString(S2),isString(S1)) ensures #token("true","Bool") [UNIQUE_ID(85f6517ce0e2b7074d495585267afa5b0502e09d5bf63c57fb6c6d77174aa16a) contentStartColumn(8) contentStartLine(596) org.kframework.attributes.Location(Location(596,8,596,52)) org.kframework.attributes.Source(Source(/Users/oft/k/include/builtin/domains.k)) org.kframework.definition.Production(syntax #RuleContent ::= #RuleBody [klabel(#ruleNoConditions) symbol()])]|}*)
| (((String _ as varS1_79) :: []),((String _ as varS2_80) :: [])) when ((true) && (true)) && (true) -> ((eval_'_LT_'String__STRING((varS2_80 :: []),(varS1_79 :: [])) config (-1)))
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize2 c)))])
let evalisKConfigVar (c: k) (config: k) (guard: int) : k = let lbl = 
LblisKConfigVar and sort = 
SortBool in match c with 
(*{| rule ``isKConfigVar(#KToken(#token("KConfigVar","KString"),_))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KToken (SortKConfigVar, var__81) :: [])) -> ((Bool true) :: [])
(*{| rule ``isKConfigVar(K)=>#token("false","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") [owise()]|}*)
| ((varK_82)) -> ((Bool false) :: [])
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize1 c)))])
let evalisVal (c: k) (config: k) (guard: int) : k = let lbl = 
LblisVal and sort = 
SortBool in match c with 
| [Int _] -> [Bool true]
(*{| rule ``isVal(#KToken(#token("Int","KString"),_))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KToken (SortInt, var__83) :: [])) -> ((Bool true) :: [])
(*{| rule ``isVal(#KToken(#token("Val","KString"),_))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KToken (SortVal, var__84) :: [])) -> ((Bool true) :: [])
(*{| rule ``isVal(K)=>#token("false","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") [owise()]|}*)
| ((varK_85)) -> ((Bool false) :: [])
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize1 c)))])
let evalisId (c: k) (config: k) (guard: int) : k = let lbl = 
LblisId and sort = 
SortBool in match c with 
(*{| rule ``isId(#KToken(#token("Id","KString"),_))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KToken (SortId, var__86) :: [])) -> ((Bool true) :: [])
(*{| rule ``isId(K)=>#token("false","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") [owise()]|}*)
| ((varK_87)) -> ((Bool false) :: [])
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize1 c)))])
let rec evalisExp (c: k) (config: k) (guard: int) : k = let lbl = 
LblisExp and sort = 
SortBool in match c with 
| [Int _] -> [Bool true]
(*{| rule ``isExp(#KToken(#token("Int","KString"),_))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KToken (SortInt, var__88) :: [])) -> ((Bool true) :: [])
(*{| rule ``isExp(#KToken(#token("Exp","KString"),_))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KToken (SortExp, var__89) :: [])) -> ((Bool true) :: [])
(*{| rule ``isExp(`_+__MINI-SML-SYNTAX`(K0,K1))=>#token("true","Bool")`` requires `_andBool_`(isExp(K0),isExp(K1)) ensures #token("true","Bool") []|}*)
| ((KApply2(Lbl_'Plus'__MINI'Hyph'SML'Hyph'SYNTAX,(varK0_90 :: []),(varK1_91 :: [])) :: [])) when (((isTrue (evalisExp((varK0_90 :: [])) config (-1)))) && ((isTrue (evalisExp((varK1_91 :: [])) config (-1))))) && (true) -> ((Bool true) :: [])
(*{| rule ``isExp(#KToken(#token("Id","KString"),_))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KToken (SortId, var__92) :: [])) -> ((Bool true) :: [])
(*{| rule ``isExp(#KToken(#token("Val","KString"),_))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KToken (SortVal, var__93) :: [])) -> ((Bool true) :: [])
(*{| rule ``isExp(K)=>#token("false","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") [owise()]|}*)
| ((varK_94)) -> ((Bool false) :: [])
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize1 c)))])
let evalisDec (c: k) (config: k) (guard: int) : k = let lbl = 
LblisDec and sort = 
SortBool in match c with 
(*{| rule ``isDec(#KToken(#token("Dec","KString"),_))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KToken (SortDec, var__95) :: [])) -> ((Bool true) :: [])
(*{| rule ``isDec(`val_=__MINI-SML-SYNTAX`(K0,K1))=>#token("true","Bool")`` requires `_andBool_`(isId(K0),isExp(K1)) ensures #token("true","Bool") []|}*)
| ((KApply2(Lblval_'Eqls'__MINI'Hyph'SML'Hyph'SYNTAX,(varK0_96 :: []),(varK1_97 :: [])) :: [])) when (((isTrue (evalisId((varK0_96 :: [])) config (-1)))) && ((isTrue (evalisExp((varK1_97 :: [])) config (-1))))) && (true) -> ((Bool true) :: [])
(*{| rule ``isDec(K)=>#token("false","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") [owise()]|}*)
| ((varK_98)) -> ((Bool false) :: [])
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize1 c)))])
let rec evalisDecs (c: k) (config: k) (guard: int) : k = let lbl = 
LblisDecs and sort = 
SortBool in match c with 
(*{| rule ``isDecs(#KToken(#token("Decs","KString"),_))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KToken (SortDecs, var__99) :: [])) -> ((Bool true) :: [])
(*{| rule ``isDecs(`.List{"_;__MINI-SML-SYNTAX"}`(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(Lbl'Stop'List'LBraQuot'_'SCln'__MINI'Hyph'SML'Hyph'SYNTAX'QuotRBra') :: [])) -> ((Bool true) :: [])
(*{| rule ``isDecs(`_;__MINI-SML-SYNTAX`(K0,K1))=>#token("true","Bool")`` requires `_andBool_`(isDec(K0),isDecs(K1)) ensures #token("true","Bool") []|}*)
| ((KApply2(Lbl_'SCln'__MINI'Hyph'SML'Hyph'SYNTAX,(varK0_100 :: []),(varK1_101 :: [])) :: [])) when (((isTrue (evalisDec((varK0_100 :: [])) config (-1)))) && ((isTrue (evalisDecs((varK1_101 :: [])) config (-1))))) && (true) -> ((Bool true) :: [])
(*{| rule ``isDecs(K)=>#token("false","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") [owise()]|}*)
| ((varK_102)) -> ((Bool false) :: [])
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize1 c)))])
let evalisKResult (c: k) (config: k) (guard: int) : k = let lbl = 
LblisKResult and sort = 
SortBool in match c with 
| [Int _] -> [Bool true]
(*{| rule ``isKResult(#KToken(#token("Int","KString"),_))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KToken (SortInt, var__103) :: [])) -> ((Bool true) :: [])
(*{| rule ``isKResult(#KToken(#token("KResult","KString"),_))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KToken (SortKResult, var__104) :: [])) -> ((Bool true) :: [])
(*{| rule ``isKResult(#KToken(#token("Val","KString"),_))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KToken (SortVal, var__105) :: [])) -> ((Bool true) :: [])
(*{| rule ``isKResult(K)=>#token("false","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") [owise()]|}*)
| ((varK_106)) -> ((Bool false) :: [])
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize1 c)))])
let evalisKCell (c: k) (config: k) (guard: int) : k = let lbl = 
LblisKCell and sort = 
SortBool in match c with 
(*{| rule ``isKCell(`<k>`(K0))=>#token("true","Bool")`` requires isK(K0) ensures #token("true","Bool") []|}*)
| ((KApply1(Lbl'_LT_'k'_GT_',(varK0_107)) :: [])) when true && (true) -> ((Bool true) :: [])
(*{| rule ``isKCell(#KToken(#token("KCell","KString"),_))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KToken (SortKCell, var__108) :: [])) -> ((Bool true) :: [])
(*{| rule ``isKCell(K)=>#token("false","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") [owise()]|}*)
| ((varK_109)) -> ((Bool false) :: [])
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize1 c)))])
let evalisCell (c: k) (config: k) (guard: int) : k = let lbl = 
LblisCell and sort = 
SortBool in match c with 
(*{| rule ``isCell(`<k>`(K0))=>#token("true","Bool")`` requires isK(K0) ensures #token("true","Bool") []|}*)
| ((KApply1(Lbl'_LT_'k'_GT_',(varK0_110)) :: [])) when true && (true) -> ((Bool true) :: [])
(*{| rule ``isCell(#KToken(#token("Cell","KString"),_))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KToken (SortCell, var__111) :: [])) -> ((Bool true) :: [])
(*{| rule ``isCell(#KToken(#token("EnvCell","KString"),_))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KToken (SortEnvCell, var__112) :: [])) -> ((Bool true) :: [])
(*{| rule ``isCell(#KToken(#token("KCell","KString"),_))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KToken (SortKCell, var__113) :: [])) -> ((Bool true) :: [])
(*{| rule ``isCell(`<T>`(K0,K1))=>#token("true","Bool")`` requires `_andBool_`(isKCell(K0),isEnvCell(K1)) ensures #token("true","Bool") []|}*)
| ((KApply2(Lbl'_LT_'T'_GT_',(varK0_114 :: []),(varK1_115 :: [])) :: [])) when (((isTrue (evalisKCell((varK0_114 :: [])) config (-1)))) && ((isTrue (evalisEnvCell((varK1_115 :: [])) config (-1))))) && (true) -> ((Bool true) :: [])
(*{| rule ``isCell(`<env>`(K0))=>#token("true","Bool")`` requires isMap(K0) ensures #token("true","Bool") []|}*)
| ((KApply1(Lbl'_LT_'env'_GT_',((Map (SortMap,_,_) as varK0_116) :: [])) :: [])) when true && (true) -> ((Bool true) :: [])
(*{| rule ``isCell(#KToken(#token("TCell","KString"),_))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KToken (SortTCell, var__117) :: [])) -> ((Bool true) :: [])
(*{| rule ``isCell(K)=>#token("false","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") [owise()]|}*)
| ((varK_118)) -> ((Bool false) :: [])
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize1 c)))])
let evalvalues (c: k) (config: k) (guard: int) : k = let lbl = 
Lblvalues and sort = 
SortList in match c with 
| _ -> try MAP.hook_values c lbl sort config freshFunction
with Not_implemented -> match c with 
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize1 c)))])
let evalList'Coln'get (c: k * k) (config: k) (guard: int) : k = let lbl = 
LblList'Coln'get and sort = 
SortKItem in match c with 
| _ -> try LIST.hook_get c lbl sort config freshFunction
with Not_implemented -> match c with 
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize2 c)))])
let eval'Hash'lstat'LPar'_'RPar'_K'Hyph'IO (c: k) (config: k) (guard: int) : k = let lbl = 
Lbl'Hash'lstat'LPar'_'RPar'_K'Hyph'IO and sort = 
SortKItem in match c with 
| _ -> try IO.hook_lstat c lbl sort config freshFunction
with Not_implemented -> match c with 
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize1 c)))])
let evalproject'Coln'KCell (c: k) (config: k) (guard: int) : k = let lbl = 
Lblproject'Coln'KCell and sort = 
SortKCell in match c with 
(*{| rule `` `project:KCell`(K)=>K`` requires #token("true","Bool") ensures #token("true","Bool") [projection()]|}*)
| ((varK_119 :: [])) -> (varK_119 :: [])
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize1 c)))])
let evalSetItem (c: k) (config: k) (guard: int) : k = let lbl = 
LblSetItem and sort = 
SortSet in match c with 
| _ -> try SET.hook_element c lbl sort config freshFunction
with Not_implemented -> match c with 
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize1 c)))])
let evalproject'Coln'Map (c: k) (config: k) (guard: int) : k = let lbl = 
Lblproject'Coln'Map and sort = 
SortMap in match c with 
(*{| rule `` `project:Map`(K)=>K`` requires #token("true","Bool") ensures #token("true","Bool") [projection()]|}*)
| (((Map (SortMap,_,_) as varK_120) :: [])) -> (varK_120 :: [])
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize1 c)))])
let eval'Stop'List (c: unit) (config: k) (guard: int) : k = let lbl = 
Lbl'Stop'List and sort = 
SortList in match c with 
| _ -> try LIST.hook_unit c lbl sort config freshFunction
with Not_implemented -> match c with 
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize0 c)))])
let const'Stop'List : k Lazy.t = lazy (eval'Stop'List () interned_bottom (-1))
let eval'Hash'remove (c: k) (config: k) (guard: int) : k = let lbl = 
Lbl'Hash'remove and sort = 
SortK in match c with 
| _ -> try IO.hook_remove c lbl sort config freshFunction
with Not_implemented -> match c with 
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize1 c)))])
let evalrandInt (c: k) (config: k) (guard: int) : k = let lbl = 
LblrandInt and sort = 
SortInt in match c with 
| _ -> try INT.hook_rand c lbl sort config freshFunction
with Not_implemented -> match c with 
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize1 c)))])
let eval'Hash'configuration_K'Hyph'REFLECTION (c: unit) (config: k) (guard: int) : k = let lbl = 
Lbl'Hash'configuration_K'Hyph'REFLECTION and sort = 
SortK in match c with 
| _ -> try KREFLECTION.hook_configuration c lbl sort config freshFunction
with Not_implemented -> match c with 
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize0 c)))])
let evalisFloat (c: k) (config: k) (guard: int) : k = let lbl = 
LblisFloat and sort = 
SortBool in match c with 
| [Float _] -> [Bool true]
(*{| rule ``isFloat(#KToken(#token("Float","KString"),_))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KToken (SortFloat, var__121) :: [])) -> ((Bool true) :: [])
(*{| rule ``isFloat(K)=>#token("false","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") [owise()]|}*)
| ((varK_122)) -> ((Bool false) :: [])
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize1 c)))])
let eval'Hash'close'LPar'_'RPar'_K'Hyph'IO (c: k) (config: k) (guard: int) : k = let lbl = 
Lbl'Hash'close'LPar'_'RPar'_K'Hyph'IO and sort = 
SortK in match c with 
| _ -> try IO.hook_close c lbl sort config freshFunction
with Not_implemented -> match c with 
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize1 c)))])
let evalproject'Coln'IOString (c: k) (config: k) (guard: int) : k = let lbl = 
Lblproject'Coln'IOString and sort = 
SortIOString in match c with 
(*{| rule `` `project:IOString`(K)=>K`` requires #token("true","Bool") ensures #token("true","Bool") [projection()]|}*)
| ((varK_123 :: [])) -> (varK_123 :: [])
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize1 c)))])
let eval'Hash'mkstemp (c: k * k) (config: k) (guard: int) : k = let lbl = 
Lbl'Hash'mkstemp and sort = 
SortIOFile in match c with 
| _ -> try IO.hook_mkstemp c lbl sort config freshFunction
with Not_implemented -> match c with 
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize2 c)))])
let evalkeys_list'LPar'_'RPar'_MAP (c: k) (config: k) (guard: int) : k = let lbl = 
Lblkeys_list'LPar'_'RPar'_MAP and sort = 
SortList in match c with 
| _ -> try MAP.hook_keys_list c lbl sort config freshFunction
with Not_implemented -> match c with 
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize1 c)))])
let evalString2Id (c: k) (config: k) (guard: int) : k = let lbl = 
LblString2Id and sort = 
SortId in match c with 
| _ -> try STRING.hook_string2token c lbl sort config freshFunction
with Not_implemented -> match c with 
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize1 c)))])
let evalInt2String (c: k) (config: k) (guard: int) : k = let lbl = 
LblInt2String and sort = 
SortString in match c with 
| _ -> try STRING.hook_int2string c lbl sort config freshFunction
with Not_implemented -> match c with 
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize1 c)))])
let evalfreshId (c: k) (config: k) (guard: int) : k = let lbl = 
LblfreshId and sort = 
SortId in match c with 
(*{| rule ``freshId(I)=>`String2Id`(`_+String__STRING`(#token("\"_\"","String"),`Int2String`(I)))`` requires isInt(I) ensures #token("true","Bool") [UNIQUE_ID(cb89ef33f1b27d7db53de8a3c240cc3b944a9a0a9559c32b1b97c7bfec87bfa2) contentStartColumn(8) contentStartLine(791) org.kframework.attributes.Location(Location(791,8,791,62)) org.kframework.attributes.Source(Source(/Users/oft/k/include/builtin/domains.k)) org.kframework.definition.Production(syntax #RuleContent ::= #RuleBody [klabel(#ruleNoConditions) symbol()])]|}*)
| (((Int _ as varI_124) :: [])) when true && (true) -> ((evalString2Id(((eval_'Plus'String__STRING(((String "_") :: []),((evalInt2String((varI_124 :: [])) config (-1)))) config (-1)))) config (-1)))
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize1 c)))])
let evalchrChar (c: k) (config: k) (guard: int) : k = let lbl = 
LblchrChar and sort = 
SortString in match c with 
| _ -> try STRING.hook_chr c lbl sort config freshFunction
with Not_implemented -> match c with 
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize1 c)))])
let eval_orElseBool__BOOL (c: k * k) (config: k) (guard: int) : k = let lbl = 
Lbl_orElseBool__BOOL and sort = 
SortBool in match c with 
| _ -> try BOOL.hook_orElse c lbl sort config freshFunction
with Not_implemented -> match c with 
(*{| rule `` `_orElseBool__BOOL`(#token("false","Bool"),K)=>K`` requires isBool(K) ensures #token("true","Bool") [UNIQUE_ID(efdd958595a7fecb549f4368ba6097862b61abc903a6d33684803a3a0043bda8) contentStartColumn(8) contentStartLine(350) org.kframework.attributes.Location(Location(350,8,350,37)) org.kframework.attributes.Source(Source(/Users/oft/k/include/builtin/domains.k)) org.kframework.definition.Production(syntax #RuleContent ::= #RuleBody [klabel(#ruleNoConditions) symbol()])]|}*)
| (((Bool false) :: []),((Bool _ as varK_125) :: [])) when true && (true) -> (varK_125 :: [])
(*{| rule `` `_orElseBool__BOOL`(#token("true","Bool"),_3)=>#token("true","Bool")`` requires isBool(_3) ensures #token("true","Bool") [UNIQUE_ID(6ea998be2fb9b60b7964c4b4939293b6fecb47f52a53031c6227218949cf22f0) contentStartColumn(8) contentStartLine(348) org.kframework.attributes.Location(Location(348,8,348,33)) org.kframework.attributes.Source(Source(/Users/oft/k/include/builtin/domains.k)) org.kframework.definition.Production(syntax #RuleContent ::= #RuleBody [klabel(#ruleNoConditions) symbol()])]|}*)
| (((Bool true) :: []),((Bool _ as var_3_126) :: [])) when true && (true) -> ((Bool true) :: [])
(*{| rule `` `_orElseBool__BOOL`(_7,#token("true","Bool"))=>#token("true","Bool")`` requires isBool(_7) ensures #token("true","Bool") [UNIQUE_ID(2882f8b0a388fe37313c6b828cb9039a9838984f56e50b5095476c319b3dfbd8) contentStartColumn(8) contentStartLine(349) org.kframework.attributes.Location(Location(349,8,349,33)) org.kframework.attributes.Source(Source(/Users/oft/k/include/builtin/domains.k)) org.kframework.definition.Production(syntax #RuleContent ::= #RuleBody [klabel(#ruleNoConditions) symbol()])]|}*)
| (((Bool _ as var_7_127) :: []),((Bool true) :: [])) when true && (true) -> ((Bool true) :: [])
(*{| rule `` `_orElseBool__BOOL`(K,#token("false","Bool"))=>K`` requires isBool(K) ensures #token("true","Bool") [UNIQUE_ID(8c7774b237a73a62ffd53be8d97ac73eb2f040dcf41983ea18840919b416d291) contentStartColumn(8) contentStartLine(351) org.kframework.attributes.Location(Location(351,8,351,37)) org.kframework.attributes.Source(Source(/Users/oft/k/include/builtin/domains.k)) org.kframework.definition.Production(syntax #RuleContent ::= #RuleBody [klabel(#ruleNoConditions) symbol()])]|}*)
| (((Bool _ as varK_128) :: []),((Bool false) :: [])) when true && (true) -> (varK_128 :: [])
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize2 c)))])
let evalproject'Coln'Exp (c: k) (config: k) (guard: int) : k = let lbl = 
Lblproject'Coln'Exp and sort = 
SortExp in match c with 
(*{| rule `` `project:Exp`(K)=>K`` requires #token("true","Bool") ensures #token("true","Bool") [projection()]|}*)
| ((varK_129 :: [])) -> (varK_129 :: [])
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize1 c)))])
let evalList'Coln'range (c: k * k * k) (config: k) (guard: int) : k = let lbl = 
LblList'Coln'range and sort = 
SortList in match c with 
| _ -> try LIST.hook_range c lbl sort config freshFunction
with Not_implemented -> match c with 
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize3 c)))])
let evalproject'Coln'KResult (c: k) (config: k) (guard: int) : k = let lbl = 
Lblproject'Coln'KResult and sort = 
SortKResult in match c with 
(*{| rule `` `project:KResult`(K)=>K`` requires #token("true","Bool") ensures #token("true","Bool") [projection()]|}*)
| ((varK_130 :: [])) -> (varK_130 :: [])
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize1 c)))])
let eval_orBool__BOOL (c: k * k) (config: k) (guard: int) : k = let lbl = 
Lbl_orBool__BOOL and sort = 
SortBool in match c with 
| _ -> try BOOL.hook_or c lbl sort config freshFunction
with Not_implemented -> match c with 
(*{| rule `` `_orBool__BOOL`(_8,#token("true","Bool"))=>#token("true","Bool")`` requires isBool(_8) ensures #token("true","Bool") [UNIQUE_ID(497077a299480dbc06eccb33cd98338014bd125c4c601cb88a765dbcb334b14b) contentStartColumn(8) contentStartLine(344) org.kframework.attributes.Location(Location(344,8,344,34)) org.kframework.attributes.Source(Source(/Users/oft/k/include/builtin/domains.k)) org.kframework.definition.Production(syntax #RuleContent ::= #RuleBody [klabel(#ruleNoConditions) symbol()])]|}*)
| (((Bool _ as var_8_131) :: []),((Bool true) :: [])) when true && (true) -> ((Bool true) :: [])
(*{| rule `` `_orBool__BOOL`(B,#token("false","Bool"))=>B`` requires isBool(B) ensures #token("true","Bool") [UNIQUE_ID(630487d34ae5fc313a9b8cae2ad45b7b80671058bca3c97a7864774c5a431711) contentStartColumn(8) contentStartLine(346) org.kframework.attributes.Location(Location(346,8,346,32)) org.kframework.attributes.Source(Source(/Users/oft/k/include/builtin/domains.k)) org.kframework.definition.Production(syntax #RuleContent ::= #RuleBody [klabel(#ruleNoConditions) symbol()])]|}*)
| (((Bool _ as varB_132) :: []),((Bool false) :: [])) when true && (true) -> (varB_132 :: [])
(*{| rule `` `_orBool__BOOL`(#token("false","Bool"),B)=>B`` requires isBool(B) ensures #token("true","Bool") [UNIQUE_ID(ababa6e5e3735076933657815e24f99518fe532715ea97eae22ead8e30097b53) contentStartColumn(8) contentStartLine(345) org.kframework.attributes.Location(Location(345,8,345,32)) org.kframework.attributes.Source(Source(/Users/oft/k/include/builtin/domains.k)) org.kframework.definition.Production(syntax #RuleContent ::= #RuleBody [klabel(#ruleNoConditions) symbol()])]|}*)
| (((Bool false) :: []),((Bool _ as varB_133) :: [])) when true && (true) -> (varB_133 :: [])
(*{| rule `` `_orBool__BOOL`(#token("true","Bool"),_6)=>#token("true","Bool")`` requires isBool(_6) ensures #token("true","Bool") [UNIQUE_ID(166d732e9fd6609a71feb6d62f8a420d291ac81be018b646ee1177935b008f01) contentStartColumn(8) contentStartLine(343) org.kframework.attributes.Location(Location(343,8,343,34)) org.kframework.attributes.Source(Source(/Users/oft/k/include/builtin/domains.k)) org.kframework.definition.Production(syntax #RuleContent ::= #RuleBody [klabel(#ruleNoConditions) symbol()])]|}*)
| (((Bool true) :: []),((Bool _ as var_6_134) :: [])) when true && (true) -> ((Bool true) :: [])
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize2 c)))])
let eval'Stop'Map (c: unit) (config: k) (guard: int) : k = let lbl = 
Lbl'Stop'Map and sort = 
SortMap in match c with 
| _ -> try MAP.hook_unit c lbl sort config freshFunction
with Not_implemented -> match c with 
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize0 c)))])
let const'Stop'Map : k Lazy.t = lazy (eval'Stop'Map () interned_bottom (-1))
let evalinitEnvCell (c: unit) (config: k) (guard: int) : k = let lbl = 
LblinitEnvCell and sort = 
SortEnvCell in match c with 
(*{| rule ``initEnvCell(.KList)=>`<env>`(`.Map`(.KList))`` requires #token("true","Bool") ensures #token("true","Bool") [UNIQUE_ID(c7a3b857bb45cfd6e74b7a22ee3624d3c09e5603948d8474a27aea184c4c80ec) initializer()]|}*)
| () -> (KApply1(Lbl'_LT_'env'_GT_',((Lazy.force const'Stop'Map))) :: [])
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize0 c)))])
let constinitEnvCell : k Lazy.t = lazy (evalinitEnvCell () interned_bottom (-1))
let evalupdateMap (c: k * k) (config: k) (guard: int) : k = let lbl = 
LblupdateMap and sort = 
SortMap in match c with 
| _ -> try MAP.hook_updateAll c lbl sort config freshFunction
with Not_implemented -> match c with 
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize2 c)))])
let evalproject'Coln'Cell (c: k) (config: k) (guard: int) : k = let lbl = 
Lblproject'Coln'Cell and sort = 
SortCell in match c with 
(*{| rule `` `project:Cell`(K)=>K`` requires #token("true","Bool") ensures #token("true","Bool") [projection()]|}*)
| ((varK_135 :: [])) -> (varK_135 :: [])
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize1 c)))])
let eval_'EqlsSlshEqls'K_ (c: k * k) (config: k) (guard: int) : k = let lbl = 
Lbl_'EqlsSlshEqls'K_ and sort = 
SortBool in match c with 
| _ -> try KEQUAL.hook_ne c lbl sort config freshFunction
with Not_implemented -> match c with 
(*{| rule `` `_=/=K_`(K1,K2)=>`notBool_`(`_==K_`(K1,K2))`` requires `_andBool_`(isK(K1),isK(K2)) ensures #token("true","Bool") [UNIQUE_ID(0221882a8af3c088550dce160a5b2e48351ef2431aad518a72f3d65258a4066d) contentStartColumn(8) contentStartLine(822) org.kframework.attributes.Location(Location(822,8,822,45)) org.kframework.attributes.Source(Source(/Users/oft/k/include/builtin/domains.k)) org.kframework.definition.Production(syntax #RuleContent ::= #RuleBody [klabel(#ruleNoConditions) symbol()])]|}*)
| ((varK1_136),(varK2_137)) when ((true) && (true)) && (true) -> ([Bool ((not ((isTrue (eval_'EqlsEqls'K_((varK1_136),(varK2_137)) config (-1))))))])
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize2 c)))])
let eval'Hash'lock'LPar'_'Comm'_'RPar'_K'Hyph'IO (c: k * k) (config: k) (guard: int) : k = let lbl = 
Lbl'Hash'lock'LPar'_'Comm'_'RPar'_K'Hyph'IO and sort = 
SortK in match c with 
| _ -> try IO.hook_lock c lbl sort config freshFunction
with Not_implemented -> match c with 
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize2 c)))])
let evalfillList (c: k * k * k * k) (config: k) (guard: int) : k = let lbl = 
LblfillList and sort = 
SortList in match c with 
| _ -> try LIST.hook_fill c lbl sort config freshFunction
with Not_implemented -> match c with 
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize4 c)))])
let eval_List_ (c: k * k) (config: k) (guard: int) : k = let lbl = 
Lbl_List_ and sort = 
SortList in match c with 
| _ -> try LIST.hook_concat c lbl sort config freshFunction
with Not_implemented -> match c with 
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize2 c)))])
let eval'Hash'open'LPar'_'Comm'_'RPar'_K'Hyph'IO (c: k * k) (config: k) (guard: int) : k = let lbl = 
Lbl'Hash'open'LPar'_'Comm'_'RPar'_K'Hyph'IO and sort = 
SortIOInt in match c with 
| _ -> try IO.hook_open c lbl sort config freshFunction
with Not_implemented -> match c with 
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize2 c)))])
let eval_'PipeHyph_GT_'_ (c: k * k) (config: k) (guard: int) : k = let lbl = 
Lbl_'PipeHyph_GT_'_ and sort = 
SortMap in match c with 
| _ -> try MAP.hook_element c lbl sort config freshFunction
with Not_implemented -> match c with 
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize2 c)))])
let eval_xorBool__BOOL (c: k * k) (config: k) (guard: int) : k = let lbl = 
Lbl_xorBool__BOOL and sort = 
SortBool in match c with 
| _ -> try BOOL.hook_xor c lbl sort config freshFunction
with Not_implemented -> match c with 
(*{| rule `` `_xorBool__BOOL`(#token("false","Bool"),B)=>B`` requires isBool(B) ensures #token("true","Bool") [UNIQUE_ID(0b888132027262073a3306d90f4a55b0a4ea27984cd77fccd8bf29cd48efb665) contentStartColumn(8) contentStartLine(338) org.kframework.attributes.Location(Location(338,8,338,38)) org.kframework.attributes.Source(Source(/Users/oft/k/include/builtin/domains.k)) org.kframework.definition.Production(syntax #RuleContent ::= #RuleBody [klabel(#ruleNoConditions) symbol()])]|}*)
| (((Bool false) :: []),((Bool _ as varB_138) :: [])) when true && (true) -> (varB_138 :: [])
(*{| rule `` `_xorBool__BOOL`(B,B)=>#token("false","Bool")`` requires isBool(B) ensures #token("true","Bool") [UNIQUE_ID(70684b52edf7d3194cd01f6e5714b364631e8d96267df666bb689e5380e13cc4) contentStartColumn(8) contentStartLine(340) org.kframework.attributes.Location(Location(340,8,340,38)) org.kframework.attributes.Source(Source(/Users/oft/k/include/builtin/domains.k)) org.kframework.definition.Production(syntax #RuleContent ::= #RuleBody [klabel(#ruleNoConditions) symbol()])]|}*)
| (((Bool _ as varB_139) :: []),((Bool _ as varB_140) :: [])) when true && (((compare_kitem varB_140 varB_139) = 0) && true) -> ((Bool false) :: [])
(*{| rule `` `_xorBool__BOOL`(B,#token("false","Bool"))=>B`` requires isBool(B) ensures #token("true","Bool") [UNIQUE_ID(2eae84ae7b21312fecde18860149de73365b819e65aada5f952fc5b9101ae014) contentStartColumn(8) contentStartLine(339) org.kframework.attributes.Location(Location(339,8,339,38)) org.kframework.attributes.Source(Source(/Users/oft/k/include/builtin/domains.k)) org.kframework.definition.Production(syntax #RuleContent ::= #RuleBody [klabel(#ruleNoConditions) symbol()])]|}*)
| (((Bool _ as varB_141) :: []),((Bool false) :: [])) when true && (true) -> (varB_141 :: [])
(*{| rule `` `_xorBool__BOOL`(B1,B2)=>`notBool_`(`_==Bool__BOOL`(B1,B2))`` requires `_andBool_`(isBool(B2),isBool(B1)) ensures #token("true","Bool") [UNIQUE_ID(1c34683a46438798498c925345e696fc017c0665504d0877c44e540d820b1ec7) contentStartColumn(8) contentStartLine(341) org.kframework.attributes.Location(Location(341,8,341,57)) org.kframework.attributes.Source(Source(/Users/oft/k/include/builtin/domains.k)) org.kframework.definition.Production(syntax #RuleContent ::= #RuleBody [klabel(#ruleNoConditions) symbol()])]|}*)
| (((Bool _ as varB1_142) :: []),((Bool _ as varB2_143) :: [])) when ((true) && (true)) && (true) -> ([Bool ((not ((isTrue (eval_'EqlsEqls'Bool__BOOL((varB1_142 :: []),(varB2_143 :: [])) config (-1))))))])
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize2 c)))])
let eval_'Hyph'Map__MAP (c: k * k) (config: k) (guard: int) : k = let lbl = 
Lbl_'Hyph'Map__MAP and sort = 
SortMap in match c with 
| _ -> try MAP.hook_difference c lbl sort config freshFunction
with Not_implemented -> match c with 
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize2 c)))])
let eval_'Xor_Perc'Int___INT'Hyph'COMMON (c: k * k * k) (config: k) (guard: int) : k = let lbl = 
Lbl_'Xor_Perc'Int___INT'Hyph'COMMON and sort = 
SortInt in match c with 
| _ -> try INT.hook_powmod c lbl sort config freshFunction
with Not_implemented -> match c with 
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize3 c)))])
let evalproject'Coln'Bool (c: k) (config: k) (guard: int) : k = let lbl = 
Lblproject'Coln'Bool and sort = 
SortBool in match c with 
(*{| rule `` `project:Bool`(K)=>K`` requires #token("true","Bool") ensures #token("true","Bool") [projection()]|}*)
| (((Bool _ as varK_144) :: [])) -> (varK_144 :: [])
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize1 c)))])
let eval'Hash'sort (c: k) (config: k) (guard: int) : k = let lbl = 
Lbl'Hash'sort and sort = 
SortString in match c with 
| _ -> try KREFLECTION.hook_sort c lbl sort config freshFunction
with Not_implemented -> match c with 
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize1 c)))])
let eval_'Star'Int__INT'Hyph'COMMON (c: k * k) (config: k) (guard: int) : k = let lbl = 
Lbl_'Star'Int__INT'Hyph'COMMON and sort = 
SortInt in match c with 
| _ -> try INT.hook_mul c lbl sort config freshFunction
with Not_implemented -> match c with 
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize2 c)))])
let eval'Hash'open'LPar'_'RPar'_K'Hyph'IO (c: k) (config: k) (guard: int) : k = let lbl = 
Lbl'Hash'open'LPar'_'RPar'_K'Hyph'IO and sort = 
SortIOInt in match c with 
(*{| rule `` `#open(_)_K-IO`(S)=>`#open(_,_)_K-IO`(S,#token("\"r+\"","String"))`` requires isString(S) ensures #token("true","Bool") [UNIQUE_ID(ed7ee74167faa7f8e3a152e9e495d112a67407097a0bb306ac17e2ce4bebf100) contentStartColumn(8) contentStartLine(963) org.kframework.attributes.Location(Location(963,8,963,48)) org.kframework.attributes.Source(Source(/Users/oft/k/include/builtin/domains.k)) org.kframework.definition.Production(syntax #RuleContent ::= #RuleBody [klabel(#ruleNoConditions) symbol()])]|}*)
| (((String _ as varS_145) :: [])) when true && (true) -> ((eval'Hash'open'LPar'_'Comm'_'RPar'_K'Hyph'IO((varS_145 :: []),((String "r+") :: [])) config (-1)))
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize1 c)))])
let evalproject'Coln'List (c: k) (config: k) (guard: int) : k = let lbl = 
Lblproject'Coln'List and sort = 
SortList in match c with 
(*{| rule `` `project:List`(K)=>K`` requires #token("true","Bool") ensures #token("true","Bool") [projection()]|}*)
| (((List (SortList,_,_) as varK_146) :: [])) -> (varK_146 :: [])
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize1 c)))])
let evalreplaceFirst'LPar'_'Comm'_'Comm'_'RPar'_STRING (c: k * k * k) (config: k) (guard: int) : k = let lbl = 
LblreplaceFirst'LPar'_'Comm'_'Comm'_'RPar'_STRING and sort = 
SortString in match c with 
| _ -> try STRING.hook_replaceFirst c lbl sort config freshFunction
with Not_implemented -> match c with 
(*{| rule `` `replaceFirst(_,_,_)_STRING`(Source,ToReplace,Replacement)=>`_+String__STRING`(`_+String__STRING`(substrString(Source,#token("0","Int"),findString(Source,ToReplace,#token("0","Int"))),Replacement),substrString(Source,`_+Int_`(findString(Source,ToReplace,#token("0","Int")),lengthString(ToReplace)),lengthString(Source)))`` requires `_andBool_`(`_andBool_`(`_andBool_`(isString(Replacement),isString(Source)),isString(ToReplace)),`_>=Int__INT-COMMON`(findString(Source,ToReplace,#token("0","Int")),#token("0","Int"))) ensures #token("true","Bool") [UNIQUE_ID(f2b54bac62f00979d8edd558e3044e1ccb4a358be6473e27c47c496a66d70fb8) contentStartColumn(8) contentStartLine(609) org.kframework.attributes.Location(Location(609,8,611,66)) org.kframework.attributes.Source(Source(/Users/oft/k/include/builtin/domains.k)) org.kframework.definition.Production(syntax #RuleContent ::= #RuleBody "requires" K [klabel(#ruleRequires) symbol()])]|}*)
| (((String _ as varSource_147) :: []),((String _ as varToReplace_148) :: []),((String _ as varReplacement_149) :: [])) when ((((((true) && (true))) && (true))) && ((isTrue (eval_'_GT_Eqls'Int__INT'Hyph'COMMON(((evalfindString((varSource_147 :: []),(varToReplace_148 :: []),((Lazy.force int0) :: [])) config (-1))),((Lazy.force int0) :: [])) config (-1))))) && (true) -> ((eval_'Plus'String__STRING(((eval_'Plus'String__STRING(((evalsubstrString((varSource_147 :: []),((Lazy.force int0) :: []),((evalfindString((varSource_147 :: []),(varToReplace_148 :: []),((Lazy.force int0) :: [])) config (-1)))) config (-1))),(varReplacement_149 :: [])) config (-1))),((evalsubstrString((varSource_147 :: []),((eval_'Plus'Int_(((evalfindString((varSource_147 :: []),(varToReplace_148 :: []),((Lazy.force int0) :: [])) config (-1))),((evallengthString((varToReplace_148 :: [])) config (-1)))) config (-1))),((evallengthString((varSource_147 :: [])) config (-1)))) config (-1)))) config (-1)))
(*{| rule `` `replaceFirst(_,_,_)_STRING`(Source,ToReplace,_12)=>Source`` requires `_andBool_`(`_andBool_`(`_andBool_`(isString(Source),isString(ToReplace)),isString(_12)),`_<Int__INT-COMMON`(findString(Source,ToReplace,#token("0","Int")),#token("0","Int"))) ensures #token("true","Bool") [UNIQUE_ID(eab24751a87cd17e68c3d7dc8b69330870c6e883edacad860d85ba9fe84849d1) contentStartColumn(8) contentStartLine(612) org.kframework.attributes.Location(Location(612,8,613,57)) org.kframework.attributes.Source(Source(/Users/oft/k/include/builtin/domains.k)) org.kframework.definition.Production(syntax #RuleContent ::= #RuleBody "requires" K [klabel(#ruleRequires) symbol()])]|}*)
| (((String _ as varSource_150) :: []),((String _ as varToReplace_151) :: []),((String _ as var_12_152) :: [])) when ((((((true) && (true))) && (true))) && ((isTrue (eval_'_LT_'Int__INT'Hyph'COMMON(((evalfindString((varSource_150 :: []),(varToReplace_151 :: []),((Lazy.force int0) :: [])) config (-1))),((Lazy.force int0) :: [])) config (-1))))) && (true) -> (varSource_150 :: [])
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize3 c)))])
let evalproject'Coln'EnvCell (c: k) (config: k) (guard: int) : k = let lbl = 
Lblproject'Coln'EnvCell and sort = 
SortEnvCell in match c with 
(*{| rule `` `project:EnvCell`(K)=>K`` requires #token("true","Bool") ensures #token("true","Bool") [projection()]|}*)
| ((varK_153 :: [])) -> (varK_153 :: [])
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize1 c)))])
let eval'Hash'projectInt (c: k) (config: k) (guard: int) : k = let lbl = 
Lbl'Hash'projectInt and sort = 
SortInt in match c with 
(*{| rule ``#projectInt(I)=>I`` requires isInt(I) ensures #token("true","Bool") [UNIQUE_ID(739fb8b54e423562adb4baae72e9780ed9603edd8c0c7bde4efdfe2535c9ac6c) contentStartColumn(8) contentStartLine(996) org.kframework.attributes.Location(Location(996,8,996,31)) org.kframework.attributes.Source(Source(/Users/oft/k/include/builtin/domains.k)) org.kframework.definition.Production(syntax #RuleContent ::= #RuleBody [klabel(#ruleNoConditions) symbol()])]|}*)
| (((Int _ as varI_154) :: [])) when true && (true) -> (varI_154 :: [])
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize1 c)))])
let eval'Hash'putc'LPar'_'Comm'_'RPar'_K'Hyph'IO (c: k * k) (config: k) (guard: int) : k = let lbl = 
Lbl'Hash'putc'LPar'_'Comm'_'RPar'_K'Hyph'IO and sort = 
SortK in match c with 
| _ -> try IO.hook_putc c lbl sort config freshFunction
with Not_implemented -> match c with 
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize2 c)))])
let evalisIOString (c: k) (config: k) (guard: int) : k = let lbl = 
LblisIOString and sort = 
SortBool in match c with 
| [String _] -> [Bool true]
(*{| rule ``isIOString(#ENFILE(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(Lbl'Hash'ENFILE) :: [])) -> ((Bool true) :: [])
(*{| rule ``isIOString(#EOF(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(Lbl'Hash'EOF) :: [])) -> ((Bool true) :: [])
(*{| rule ``isIOString(#ENXIO(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(Lbl'Hash'ENXIO) :: [])) -> ((Bool true) :: [])
(*{| rule ``isIOString(#ENOTDIR(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(Lbl'Hash'ENOTDIR) :: [])) -> ((Bool true) :: [])
(*{| rule ``isIOString(#EALREADY(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(Lbl'Hash'EALREADY) :: [])) -> ((Bool true) :: [])
(*{| rule ``isIOString(#EMLINK(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(Lbl'Hash'EMLINK) :: [])) -> ((Bool true) :: [])
(*{| rule ``isIOString(#ECHILD(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(Lbl'Hash'ECHILD) :: [])) -> ((Bool true) :: [])
(*{| rule ``isIOString(#EOVERFLOW(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(Lbl'Hash'EOVERFLOW) :: [])) -> ((Bool true) :: [])
(*{| rule ``isIOString(#ECONNREFUSED(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(Lbl'Hash'ECONNREFUSED) :: [])) -> ((Bool true) :: [])
(*{| rule ``isIOString(#EADDRINUSE(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(Lbl'Hash'EADDRINUSE) :: [])) -> ((Bool true) :: [])
(*{| rule ``isIOString(#EFAULT(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(Lbl'Hash'EFAULT) :: [])) -> ((Bool true) :: [])
(*{| rule ``isIOString(#ENOBUFS(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(Lbl'Hash'ENOBUFS) :: [])) -> ((Bool true) :: [])
(*{| rule ``isIOString(#EWOULDBLOCK(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(Lbl'Hash'EWOULDBLOCK) :: [])) -> ((Bool true) :: [])
(*{| rule ``isIOString(#EISCONN(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(Lbl'Hash'EISCONN) :: [])) -> ((Bool true) :: [])
(*{| rule ``isIOString(#ELOOP(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(Lbl'Hash'ELOOP) :: [])) -> ((Bool true) :: [])
(*{| rule ``isIOString(#ETOOMANYREFS(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(Lbl'Hash'ETOOMANYREFS) :: [])) -> ((Bool true) :: [])
(*{| rule ``isIOString(#ENODEV(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(Lbl'Hash'ENODEV) :: [])) -> ((Bool true) :: [])
(*{| rule ``isIOString(#EXDEV(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(Lbl'Hash'EXDEV) :: [])) -> ((Bool true) :: [])
(*{| rule ``isIOString(#ENOTEMPTY(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(Lbl'Hash'ENOTEMPTY) :: [])) -> ((Bool true) :: [])
(*{| rule ``isIOString(#ENOSPC(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(Lbl'Hash'ENOSPC) :: [])) -> ((Bool true) :: [])
(*{| rule ``isIOString(#ERANGE(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(Lbl'Hash'ERANGE) :: [])) -> ((Bool true) :: [])
(*{| rule ``isIOString(#EPIPE(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(Lbl'Hash'EPIPE) :: [])) -> ((Bool true) :: [])
(*{| rule ``isIOString(#unknownIOError(K0))=>#token("true","Bool")`` requires isInt(K0) ensures #token("true","Bool") []|}*)
| ((KApply1(Lbl'Hash'unknownIOError,((Int _ as varK0_155) :: [])) :: [])) when true && (true) -> ((Bool true) :: [])
(*{| rule ``isIOString(#EAFNOSUPPORT(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(Lbl'Hash'EAFNOSUPPORT) :: [])) -> ((Bool true) :: [])
(*{| rule ``isIOString(#ENOSYS(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(Lbl'Hash'ENOSYS) :: [])) -> ((Bool true) :: [])
(*{| rule ``isIOString(#E2BIG(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(Lbl'Hash'E2BIG) :: [])) -> ((Bool true) :: [])
(*{| rule ``isIOString(#EMFILE(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(Lbl'Hash'EMFILE) :: [])) -> ((Bool true) :: [])
(*{| rule ``isIOString(#KToken(#token("String","KString"),_))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KToken (SortString, var__156) :: [])) -> ((Bool true) :: [])
(*{| rule ``isIOString(#noParse(K0))=>#token("true","Bool")`` requires isString(K0) ensures #token("true","Bool") []|}*)
| ((KApply1(Lbl'Hash'noParse,((String _ as varK0_157) :: [])) :: [])) when true && (true) -> ((Bool true) :: [])
(*{| rule ``isIOString(#EPFNOSUPPORT(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(Lbl'Hash'EPFNOSUPPORT) :: [])) -> ((Bool true) :: [])
(*{| rule ``isIOString(#ENAMETOOLONG(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(Lbl'Hash'ENAMETOOLONG) :: [])) -> ((Bool true) :: [])
(*{| rule ``isIOString(#ENOEXEC(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(Lbl'Hash'ENOEXEC) :: [])) -> ((Bool true) :: [])
(*{| rule ``isIOString(#ESOCKTNOSUPPORT(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(Lbl'Hash'ESOCKTNOSUPPORT) :: [])) -> ((Bool true) :: [])
(*{| rule ``isIOString(#KToken(#token("IOString","KString"),_))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KToken (SortIOString, var__158) :: [])) -> ((Bool true) :: [])
(*{| rule ``isIOString(#EBADF(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(Lbl'Hash'EBADF) :: [])) -> ((Bool true) :: [])
(*{| rule ``isIOString(#ECONNRESET(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(Lbl'Hash'ECONNRESET) :: [])) -> ((Bool true) :: [])
(*{| rule ``isIOString(#KToken(#token("IOError","KString"),_))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KToken (SortIOError, var__159) :: [])) -> ((Bool true) :: [])
(*{| rule ``isIOString(#ENETUNREACH(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(Lbl'Hash'ENETUNREACH) :: [])) -> ((Bool true) :: [])
(*{| rule ``isIOString(#ESHUTDOWN(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(Lbl'Hash'ESHUTDOWN) :: [])) -> ((Bool true) :: [])
(*{| rule ``isIOString(#ENOTCONN(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(Lbl'Hash'ENOTCONN) :: [])) -> ((Bool true) :: [])
(*{| rule ``isIOString(#ENETRESET(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(Lbl'Hash'ENETRESET) :: [])) -> ((Bool true) :: [])
(*{| rule ``isIOString(#EINTR(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(Lbl'Hash'EINTR) :: [])) -> ((Bool true) :: [])
(*{| rule ``isIOString(#EACCES(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(Lbl'Hash'EACCES) :: [])) -> ((Bool true) :: [])
(*{| rule ``isIOString(#EOPNOTSUPP(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(Lbl'Hash'EOPNOTSUPP) :: [])) -> ((Bool true) :: [])
(*{| rule ``isIOString(#ESPIPE(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(Lbl'Hash'ESPIPE) :: [])) -> ((Bool true) :: [])
(*{| rule ``isIOString(#EMSGSIZE(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(Lbl'Hash'EMSGSIZE) :: [])) -> ((Bool true) :: [])
(*{| rule ``isIOString(#ESRCH(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(Lbl'Hash'ESRCH) :: [])) -> ((Bool true) :: [])
(*{| rule ``isIOString(#EPROTONOSUPPORT(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(Lbl'Hash'EPROTONOSUPPORT) :: [])) -> ((Bool true) :: [])
(*{| rule ``isIOString(#EISDIR(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(Lbl'Hash'EISDIR) :: [])) -> ((Bool true) :: [])
(*{| rule ``isIOString(#EINPROGRESS(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(Lbl'Hash'EINPROGRESS) :: [])) -> ((Bool true) :: [])
(*{| rule ``isIOString(#EFBIG(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(Lbl'Hash'EFBIG) :: [])) -> ((Bool true) :: [])
(*{| rule ``isIOString(#EHOSTUNREACH(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(Lbl'Hash'EHOSTUNREACH) :: [])) -> ((Bool true) :: [])
(*{| rule ``isIOString(#ENOLCK(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(Lbl'Hash'ENOLCK) :: [])) -> ((Bool true) :: [])
(*{| rule ``isIOString(#EDEADLK(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(Lbl'Hash'EDEADLK) :: [])) -> ((Bool true) :: [])
(*{| rule ``isIOString(#ETIMEDOUT(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(Lbl'Hash'ETIMEDOUT) :: [])) -> ((Bool true) :: [])
(*{| rule ``isIOString(#EDESTADDRREQ(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(Lbl'Hash'EDESTADDRREQ) :: [])) -> ((Bool true) :: [])
(*{| rule ``isIOString(#EINVAL(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(Lbl'Hash'EINVAL) :: [])) -> ((Bool true) :: [])
(*{| rule ``isIOString(#EROFS(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(Lbl'Hash'EROFS) :: [])) -> ((Bool true) :: [])
(*{| rule ``isIOString(#EAGAIN(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(Lbl'Hash'EAGAIN) :: [])) -> ((Bool true) :: [])
(*{| rule ``isIOString(#ECONNABORTED(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(Lbl'Hash'ECONNABORTED) :: [])) -> ((Bool true) :: [])
(*{| rule ``isIOString(#EHOSTDOWN(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(Lbl'Hash'EHOSTDOWN) :: [])) -> ((Bool true) :: [])
(*{| rule ``isIOString(#ENOTTY(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(Lbl'Hash'ENOTTY) :: [])) -> ((Bool true) :: [])
(*{| rule ``isIOString(#ENOENT(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(Lbl'Hash'ENOENT) :: [])) -> ((Bool true) :: [])
(*{| rule ``isIOString(#EPROTOTYPE(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(Lbl'Hash'EPROTOTYPE) :: [])) -> ((Bool true) :: [])
(*{| rule ``isIOString(#EBUSY(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(Lbl'Hash'EBUSY) :: [])) -> ((Bool true) :: [])
(*{| rule ``isIOString(#EEXIST(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(Lbl'Hash'EEXIST) :: [])) -> ((Bool true) :: [])
(*{| rule ``isIOString(#EADDRNOTAVAIL(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(Lbl'Hash'EADDRNOTAVAIL) :: [])) -> ((Bool true) :: [])
(*{| rule ``isIOString(#ENOTSOCK(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(Lbl'Hash'ENOTSOCK) :: [])) -> ((Bool true) :: [])
(*{| rule ``isIOString(#ENETDOWN(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(Lbl'Hash'ENETDOWN) :: [])) -> ((Bool true) :: [])
(*{| rule ``isIOString(#ENOPROTOOPT(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(Lbl'Hash'ENOPROTOOPT) :: [])) -> ((Bool true) :: [])
(*{| rule ``isIOString(#EIO(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(Lbl'Hash'EIO) :: [])) -> ((Bool true) :: [])
(*{| rule ``isIOString(#EDOM(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(Lbl'Hash'EDOM) :: [])) -> ((Bool true) :: [])
(*{| rule ``isIOString(#ENOMEM(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(Lbl'Hash'ENOMEM) :: [])) -> ((Bool true) :: [])
(*{| rule ``isIOString(#EPERM(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(Lbl'Hash'EPERM) :: [])) -> ((Bool true) :: [])
(*{| rule ``isIOString(K)=>#token("false","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") [owise()]|}*)
| ((varK_160)) -> ((Bool false) :: [])
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize1 c)))])
let eval'Hash'logToFile (c: k * k) (config: k) (guard: int) : k = let lbl = 
Lbl'Hash'logToFile and sort = 
SortK in match c with 
| _ -> try IO.hook_log c lbl sort config freshFunction
with Not_implemented -> match c with 
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize2 c)))])
let evalproject'Coln'IOFile (c: k) (config: k) (guard: int) : k = let lbl = 
Lblproject'Coln'IOFile and sort = 
SortIOFile in match c with 
(*{| rule `` `project:IOFile`(K)=>K`` requires #token("true","Bool") ensures #token("true","Bool") [projection()]|}*)
| ((varK_161 :: [])) -> (varK_161 :: [])
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize1 c)))])
let eval'Hash'read'LPar'_'Comm'_'RPar'_K'Hyph'IO (c: k * k) (config: k) (guard: int) : k = let lbl = 
Lbl'Hash'read'LPar'_'Comm'_'RPar'_K'Hyph'IO and sort = 
SortIOString in match c with 
| _ -> try IO.hook_read c lbl sort config freshFunction
with Not_implemented -> match c with 
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize2 c)))])
let evalId2String (c: k) (config: k) (guard: int) : k = let lbl = 
LblId2String and sort = 
SortString in match c with 
| _ -> try STRING.hook_token2string c lbl sort config freshFunction
with Not_implemented -> match c with 
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize1 c)))])
let evalfreshInt (c: k) (config: k) (guard: int) : k = let lbl = 
LblfreshInt and sort = 
SortInt in match c with 
(*{| rule ``freshInt(I)=>I`` requires isInt(I) ensures #token("true","Bool") [UNIQUE_ID(d7221da1fa6b633137e79279efd265a289ea7e8496612615f43546422d446bc4) contentStartColumn(8) contentStartLine(455) org.kframework.attributes.Location(Location(455,8,455,28)) org.kframework.attributes.Source(Source(/Users/oft/k/include/builtin/domains.k)) org.kframework.definition.Production(syntax #RuleContent ::= #RuleBody [klabel(#ruleNoConditions) symbol()])]|}*)
| (((Int _ as varI_162) :: [])) when true && (true) -> (varI_162 :: [])
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize1 c)))])
let freshFunction (sort: string) (config: k) (counter: Z.t) : k = match sort with 
| "Id" -> (evalfreshId ([Int counter]) config (-1))
| "Int" -> (evalfreshInt ([Int counter]) config (-1))
| _ -> invalid_arg ("Cannot find fresh function for sort " ^ sort)let eval'Hash'fresh (c: k) (config: k) (guard: int) : k = let lbl = 
Lbl'Hash'fresh and sort = 
SortKItem in match c with 
| _ -> try KREFLECTION.hook_fresh c lbl sort config freshFunction
with Not_implemented -> match c with 
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize1 c)))])
let evalMap'Coln'choice (c: k) (config: k) (guard: int) : k = let lbl = 
LblMap'Coln'choice and sort = 
SortKItem in match c with 
| _ -> try MAP.hook_choice c lbl sort config freshFunction
with Not_implemented -> match c with 
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize1 c)))])
let eval_impliesBool__BOOL (c: k * k) (config: k) (guard: int) : k = let lbl = 
Lbl_impliesBool__BOOL and sort = 
SortBool in match c with 
| _ -> try BOOL.hook_implies c lbl sort config freshFunction
with Not_implemented -> match c with 
(*{| rule `` `_impliesBool__BOOL`(#token("true","Bool"),B)=>B`` requires isBool(B) ensures #token("true","Bool") [UNIQUE_ID(278435b95efb1a1ce04f6d701b12e6438c3cf3aee8019b41ea93b05755d379d7) contentStartColumn(8) contentStartLine(353) org.kframework.attributes.Location(Location(353,8,353,36)) org.kframework.attributes.Source(Source(/Users/oft/k/include/builtin/domains.k)) org.kframework.definition.Production(syntax #RuleContent ::= #RuleBody [klabel(#ruleNoConditions) symbol()])]|}*)
| (((Bool true) :: []),((Bool _ as varB_163) :: [])) when true && (true) -> (varB_163 :: [])
(*{| rule `` `_impliesBool__BOOL`(B,#token("false","Bool"))=>`notBool_`(B)`` requires isBool(B) ensures #token("true","Bool") [UNIQUE_ID(0129e06009c7500aefab482e1bc8e348010c6bd01acd15725172192c05a70831) contentStartColumn(8) contentStartLine(356) org.kframework.attributes.Location(Location(356,8,356,45)) org.kframework.attributes.Source(Source(/Users/oft/k/include/builtin/domains.k)) org.kframework.definition.Production(syntax #RuleContent ::= #RuleBody [klabel(#ruleNoConditions) symbol()])]|}*)
| (((Bool _ as varB_164) :: []),((Bool false) :: [])) when true && (true) -> ([Bool ((not ((isTrue [varB_164]))))])
(*{| rule `` `_impliesBool__BOOL`(#token("false","Bool"),_1)=>#token("true","Bool")`` requires isBool(_1) ensures #token("true","Bool") [UNIQUE_ID(3497d026ef9468fdac7e6b5de6841fad0118b17ca073ba25af4c5d8573a167b2) contentStartColumn(8) contentStartLine(354) org.kframework.attributes.Location(Location(354,8,354,40)) org.kframework.attributes.Source(Source(/Users/oft/k/include/builtin/domains.k)) org.kframework.definition.Production(syntax #RuleContent ::= #RuleBody [klabel(#ruleNoConditions) symbol()])]|}*)
| (((Bool false) :: []),((Bool _ as var_1_165) :: [])) when true && (true) -> ((Bool true) :: [])
(*{| rule `` `_impliesBool__BOOL`(_4,#token("true","Bool"))=>#token("true","Bool")`` requires isBool(_4) ensures #token("true","Bool") [UNIQUE_ID(7fdeea13463fa86d05e4d5bfb9e9c627b90ab57930f712fef1bfc08543a87d74) contentStartColumn(8) contentStartLine(355) org.kframework.attributes.Location(Location(355,8,355,39)) org.kframework.attributes.Source(Source(/Users/oft/k/include/builtin/domains.k)) org.kframework.definition.Production(syntax #RuleContent ::= #RuleBody [klabel(#ruleNoConditions) symbol()])]|}*)
| (((Bool _ as var_4_166) :: []),((Bool true) :: [])) when true && (true) -> ((Bool true) :: [])
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize2 c)))])
let evalproject'Coln'Stream (c: k) (config: k) (guard: int) : k = let lbl = 
Lblproject'Coln'Stream and sort = 
SortStream in match c with 
(*{| rule `` `project:Stream`(K)=>K`` requires #token("true","Bool") ensures #token("true","Bool") [projection()]|}*)
| ((varK_167 :: [])) -> (varK_167 :: [])
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize1 c)))])
let eval'Hash'getc'LPar'_'RPar'_K'Hyph'IO (c: k) (config: k) (guard: int) : k = let lbl = 
Lbl'Hash'getc'LPar'_'RPar'_K'Hyph'IO and sort = 
SortIOInt in match c with 
| _ -> try IO.hook_getc c lbl sort config freshFunction
with Not_implemented -> match c with 
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize1 c)))])
let eval_Set_ (c: k * k) (config: k) (guard: int) : k = let lbl = 
Lbl_Set_ and sort = 
SortSet in match c with 
| _ -> try SET.hook_concat c lbl sort config freshFunction
with Not_implemented -> match c with 
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize2 c)))])
let eval_'Pipe'Int__INT'Hyph'COMMON (c: k * k) (config: k) (guard: int) : k = let lbl = 
Lbl_'Pipe'Int__INT'Hyph'COMMON and sort = 
SortInt in match c with 
| _ -> try INT.hook_or c lbl sort config freshFunction
with Not_implemented -> match c with 
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize2 c)))])
let eval_'_LT_Eqls'String__STRING (c: k * k) (config: k) (guard: int) : k = let lbl = 
Lbl_'_LT_Eqls'String__STRING and sort = 
SortBool in match c with 
| _ -> try STRING.hook_le c lbl sort config freshFunction
with Not_implemented -> match c with 
(*{| rule `` `_<=String__STRING`(S1,S2)=>`notBool_`(`_<String__STRING`(S2,S1))`` requires `_andBool_`(isString(S2),isString(S1)) ensures #token("true","Bool") [UNIQUE_ID(2c1110a97c0d904a19992e4eac695692515cb703f5d689aaa6945290a696d662) contentStartColumn(8) contentStartLine(595) org.kframework.attributes.Location(Location(595,8,595,63)) org.kframework.attributes.Source(Source(/Users/oft/k/include/builtin/domains.k)) org.kframework.definition.Production(syntax #RuleContent ::= #RuleBody [klabel(#ruleNoConditions) symbol()])]|}*)
| (((String _ as varS1_168) :: []),((String _ as varS2_169) :: [])) when ((true) && (true)) && (true) -> ([Bool ((not ((isTrue (eval_'_LT_'String__STRING((varS2_169 :: []),(varS1_168 :: [])) config (-1))))))])
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize2 c)))])
let evalordChar (c: k) (config: k) (guard: int) : k = let lbl = 
LblordChar and sort = 
SortInt in match c with 
| _ -> try STRING.hook_ord c lbl sort config freshFunction
with Not_implemented -> match c with 
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize1 c)))])
let evalmaxInt'LPar'_'Comm'_'RPar'_INT'Hyph'COMMON (c: k * k) (config: k) (guard: int) : k = let lbl = 
LblmaxInt'LPar'_'Comm'_'RPar'_INT'Hyph'COMMON and sort = 
SortInt in match c with 
| _ -> try INT.hook_max c lbl sort config freshFunction
with Not_implemented -> match c with 
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize2 c)))])
let evalrfindString (c: k * k * k) (config: k) (guard: int) : k = let lbl = 
LblrfindString and sort = 
SortInt in match c with 
| _ -> try STRING.hook_rfind c lbl sort config freshFunction
with Not_implemented -> match c with 
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize3 c)))])
let rec evalrfindChar (c: k * k * k) (config: k) (guard: int) : k = let lbl = 
LblrfindChar and sort = 
SortInt in match c with 
| _ -> try STRING.hook_rfindChar c lbl sort config freshFunction
with Not_implemented -> match c with 
(*{| rule ``rfindChar(S1,S2,I)=>`maxInt(_,_)_INT-COMMON`(rfindString(S1,substrString(S2,#token("0","Int"),#token("1","Int")),I),rfindChar(S1,substrString(S2,#token("1","Int"),lengthString(S2)),I))`` requires `_andBool_`(`_andBool_`(`_andBool_`(isInt(I),isString(S2)),isString(S1)),`_=/=String__STRING`(S2,#token("\"\"","String"))) ensures #token("true","Bool") [UNIQUE_ID(648d51de4d84a45b83122ab4496582c61519a53709ae6ebb063bcadeef7b5e11) contentStartColumn(8) contentStartLine(601) org.kframework.attributes.Location(Location(601,8,601,182)) org.kframework.attributes.Source(Source(/Users/oft/k/include/builtin/domains.k)) org.kframework.definition.Production(syntax #RuleContent ::= #RuleBody "requires" K [klabel(#ruleRequires) symbol()])]|}*)
| (((String _ as varS1_170) :: []),((String _ as varS2_171) :: []),((Int _ as varI_172) :: [])) when ((((((true) && (true))) && (true))) && ((isTrue (eval_'EqlsSlshEqls'String__STRING((varS2_171 :: []),((String "") :: [])) config (-1))))) && (true) -> ((evalmaxInt'LPar'_'Comm'_'RPar'_INT'Hyph'COMMON(((evalrfindString((varS1_170 :: []),((evalsubstrString((varS2_171 :: []),((Lazy.force int0) :: []),((Lazy.force int1) :: [])) config (-1))),(varI_172 :: [])) config (-1))),((evalrfindChar((varS1_170 :: []),((evalsubstrString((varS2_171 :: []),((Lazy.force int1) :: []),((evallengthString((varS2_171 :: [])) config (-1)))) config (-1))),(varI_172 :: [])) config (-1)))) config (-1)))
(*{| rule ``rfindChar(_17,#token("\"\"","String"),_18)=>#token("-1","Int")`` requires `_andBool_`(isInt(_18),isString(_17)) ensures #token("true","Bool") [UNIQUE_ID(04cb290eea9d7c93a48f761cab20217a689222a306098df1120917b013944330) contentStartColumn(8) contentStartLine(602) org.kframework.attributes.Location(Location(602,8,602,33)) org.kframework.attributes.Source(Source(/Users/oft/k/include/builtin/domains.k)) org.kframework.definition.Production(syntax #RuleContent ::= #RuleBody [klabel(#ruleNoConditions) symbol()])]|}*)
| (((String _ as var_17_173) :: []),((String "") :: []),((Int _ as var_18_174) :: [])) when ((true) && (true)) && (true) -> ((Lazy.force int'Hyph'1) :: [])
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize3 c)))])
let evalproject'Coln'Int (c: k) (config: k) (guard: int) : k = let lbl = 
Lblproject'Coln'Int and sort = 
SortInt in match c with 
(*{| rule `` `project:Int`(K)=>K`` requires #token("true","Bool") ensures #token("true","Bool") [projection()]|}*)
| (((Int _ as varK_175) :: [])) -> (varK_175 :: [])
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize1 c)))])
let eval_Map_ (c: k * k) (config: k) (guard: int) : k = let lbl = 
Lbl_Map_ and sort = 
SortMap in match c with 
| _ -> try MAP.hook_concat c lbl sort config freshFunction
with Not_implemented -> match c with 
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize2 c)))])
let evalisIOInt (c: k) (config: k) (guard: int) : k = let lbl = 
LblisIOInt and sort = 
SortBool in match c with 
| [Int _] -> [Bool true]
(*{| rule ``isIOInt(#EAGAIN(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(Lbl'Hash'EAGAIN) :: [])) -> ((Bool true) :: [])
(*{| rule ``isIOInt(#KToken(#token("Int","KString"),_))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KToken (SortInt, var__176) :: [])) -> ((Bool true) :: [])
(*{| rule ``isIOInt(#ETIMEDOUT(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(Lbl'Hash'ETIMEDOUT) :: [])) -> ((Bool true) :: [])
(*{| rule ``isIOInt(#EPROTOTYPE(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(Lbl'Hash'EPROTOTYPE) :: [])) -> ((Bool true) :: [])
(*{| rule ``isIOInt(#ELOOP(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(Lbl'Hash'ELOOP) :: [])) -> ((Bool true) :: [])
(*{| rule ``isIOInt(#EDESTADDRREQ(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(Lbl'Hash'EDESTADDRREQ) :: [])) -> ((Bool true) :: [])
(*{| rule ``isIOInt(#unknownIOError(K0))=>#token("true","Bool")`` requires isInt(K0) ensures #token("true","Bool") []|}*)
| ((KApply1(Lbl'Hash'unknownIOError,((Int _ as varK0_177) :: [])) :: [])) when true && (true) -> ((Bool true) :: [])
(*{| rule ``isIOInt(#ENOTSOCK(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(Lbl'Hash'ENOTSOCK) :: [])) -> ((Bool true) :: [])
(*{| rule ``isIOInt(#ECONNRESET(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(Lbl'Hash'ECONNRESET) :: [])) -> ((Bool true) :: [])
(*{| rule ``isIOInt(#EHOSTDOWN(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(Lbl'Hash'EHOSTDOWN) :: [])) -> ((Bool true) :: [])
(*{| rule ``isIOInt(#ENETDOWN(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(Lbl'Hash'ENETDOWN) :: [])) -> ((Bool true) :: [])
(*{| rule ``isIOInt(#KToken(#token("IOError","KString"),_))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KToken (SortIOError, var__178) :: [])) -> ((Bool true) :: [])
(*{| rule ``isIOInt(#EIO(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(Lbl'Hash'EIO) :: [])) -> ((Bool true) :: [])
(*{| rule ``isIOInt(#ENOSPC(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(Lbl'Hash'ENOSPC) :: [])) -> ((Bool true) :: [])
(*{| rule ``isIOInt(#ENOEXEC(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(Lbl'Hash'ENOEXEC) :: [])) -> ((Bool true) :: [])
(*{| rule ``isIOInt(#EDEADLK(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(Lbl'Hash'EDEADLK) :: [])) -> ((Bool true) :: [])
(*{| rule ``isIOInt(#ENOTCONN(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(Lbl'Hash'ENOTCONN) :: [])) -> ((Bool true) :: [])
(*{| rule ``isIOInt(#EPERM(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(Lbl'Hash'EPERM) :: [])) -> ((Bool true) :: [])
(*{| rule ``isIOInt(#EAFNOSUPPORT(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(Lbl'Hash'EAFNOSUPPORT) :: [])) -> ((Bool true) :: [])
(*{| rule ``isIOInt(#ETOOMANYREFS(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(Lbl'Hash'ETOOMANYREFS) :: [])) -> ((Bool true) :: [])
(*{| rule ``isIOInt(#EHOSTUNREACH(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(Lbl'Hash'EHOSTUNREACH) :: [])) -> ((Bool true) :: [])
(*{| rule ``isIOInt(#EFAULT(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(Lbl'Hash'EFAULT) :: [])) -> ((Bool true) :: [])
(*{| rule ``isIOInt(#EACCES(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(Lbl'Hash'EACCES) :: [])) -> ((Bool true) :: [])
(*{| rule ``isIOInt(#EFBIG(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(Lbl'Hash'EFBIG) :: [])) -> ((Bool true) :: [])
(*{| rule ``isIOInt(#EPROTONOSUPPORT(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(Lbl'Hash'EPROTONOSUPPORT) :: [])) -> ((Bool true) :: [])
(*{| rule ``isIOInt(#ENOLCK(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(Lbl'Hash'ENOLCK) :: [])) -> ((Bool true) :: [])
(*{| rule ``isIOInt(#ESRCH(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(Lbl'Hash'ESRCH) :: [])) -> ((Bool true) :: [])
(*{| rule ``isIOInt(#ENOMEM(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(Lbl'Hash'ENOMEM) :: [])) -> ((Bool true) :: [])
(*{| rule ``isIOInt(#EISDIR(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(Lbl'Hash'EISDIR) :: [])) -> ((Bool true) :: [])
(*{| rule ``isIOInt(#ENOTTY(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(Lbl'Hash'ENOTTY) :: [])) -> ((Bool true) :: [])
(*{| rule ``isIOInt(#EINTR(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(Lbl'Hash'EINTR) :: [])) -> ((Bool true) :: [])
(*{| rule ``isIOInt(#ENXIO(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(Lbl'Hash'ENXIO) :: [])) -> ((Bool true) :: [])
(*{| rule ``isIOInt(#EMSGSIZE(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(Lbl'Hash'EMSGSIZE) :: [])) -> ((Bool true) :: [])
(*{| rule ``isIOInt(#EADDRINUSE(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(Lbl'Hash'EADDRINUSE) :: [])) -> ((Bool true) :: [])
(*{| rule ``isIOInt(#ENFILE(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(Lbl'Hash'ENFILE) :: [])) -> ((Bool true) :: [])
(*{| rule ``isIOInt(#EOVERFLOW(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(Lbl'Hash'EOVERFLOW) :: [])) -> ((Bool true) :: [])
(*{| rule ``isIOInt(#E2BIG(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(Lbl'Hash'E2BIG) :: [])) -> ((Bool true) :: [])
(*{| rule ``isIOInt(#KToken(#token("IOInt","KString"),_))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KToken (SortIOInt, var__179) :: [])) -> ((Bool true) :: [])
(*{| rule ``isIOInt(#noParse(K0))=>#token("true","Bool")`` requires isString(K0) ensures #token("true","Bool") []|}*)
| ((KApply1(Lbl'Hash'noParse,((String _ as varK0_180) :: [])) :: [])) when true && (true) -> ((Bool true) :: [])
(*{| rule ``isIOInt(#ENETRESET(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(Lbl'Hash'ENETRESET) :: [])) -> ((Bool true) :: [])
(*{| rule ``isIOInt(#ESHUTDOWN(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(Lbl'Hash'ESHUTDOWN) :: [])) -> ((Bool true) :: [])
(*{| rule ``isIOInt(#EBUSY(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(Lbl'Hash'EBUSY) :: [])) -> ((Bool true) :: [])
(*{| rule ``isIOInt(#EPIPE(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(Lbl'Hash'EPIPE) :: [])) -> ((Bool true) :: [])
(*{| rule ``isIOInt(#ESPIPE(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(Lbl'Hash'ESPIPE) :: [])) -> ((Bool true) :: [])
(*{| rule ``isIOInt(#ENOTDIR(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(Lbl'Hash'ENOTDIR) :: [])) -> ((Bool true) :: [])
(*{| rule ``isIOInt(#ERANGE(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(Lbl'Hash'ERANGE) :: [])) -> ((Bool true) :: [])
(*{| rule ``isIOInt(#ENOPROTOOPT(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(Lbl'Hash'ENOPROTOOPT) :: [])) -> ((Bool true) :: [])
(*{| rule ``isIOInt(#ECONNREFUSED(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(Lbl'Hash'ECONNREFUSED) :: [])) -> ((Bool true) :: [])
(*{| rule ``isIOInt(#ENOENT(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(Lbl'Hash'ENOENT) :: [])) -> ((Bool true) :: [])
(*{| rule ``isIOInt(#EADDRNOTAVAIL(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(Lbl'Hash'EADDRNOTAVAIL) :: [])) -> ((Bool true) :: [])
(*{| rule ``isIOInt(#EMLINK(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(Lbl'Hash'EMLINK) :: [])) -> ((Bool true) :: [])
(*{| rule ``isIOInt(#ESOCKTNOSUPPORT(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(Lbl'Hash'ESOCKTNOSUPPORT) :: [])) -> ((Bool true) :: [])
(*{| rule ``isIOInt(#EISCONN(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(Lbl'Hash'EISCONN) :: [])) -> ((Bool true) :: [])
(*{| rule ``isIOInt(#ENOBUFS(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(Lbl'Hash'ENOBUFS) :: [])) -> ((Bool true) :: [])
(*{| rule ``isIOInt(#EWOULDBLOCK(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(Lbl'Hash'EWOULDBLOCK) :: [])) -> ((Bool true) :: [])
(*{| rule ``isIOInt(#EINPROGRESS(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(Lbl'Hash'EINPROGRESS) :: [])) -> ((Bool true) :: [])
(*{| rule ``isIOInt(#EINVAL(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(Lbl'Hash'EINVAL) :: [])) -> ((Bool true) :: [])
(*{| rule ``isIOInt(#ECONNABORTED(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(Lbl'Hash'ECONNABORTED) :: [])) -> ((Bool true) :: [])
(*{| rule ``isIOInt(#ENAMETOOLONG(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(Lbl'Hash'ENAMETOOLONG) :: [])) -> ((Bool true) :: [])
(*{| rule ``isIOInt(#EOPNOTSUPP(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(Lbl'Hash'EOPNOTSUPP) :: [])) -> ((Bool true) :: [])
(*{| rule ``isIOInt(#EROFS(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(Lbl'Hash'EROFS) :: [])) -> ((Bool true) :: [])
(*{| rule ``isIOInt(#EMFILE(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(Lbl'Hash'EMFILE) :: [])) -> ((Bool true) :: [])
(*{| rule ``isIOInt(#EDOM(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(Lbl'Hash'EDOM) :: [])) -> ((Bool true) :: [])
(*{| rule ``isIOInt(#ENOSYS(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(Lbl'Hash'ENOSYS) :: [])) -> ((Bool true) :: [])
(*{| rule ``isIOInt(#ENETUNREACH(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(Lbl'Hash'ENETUNREACH) :: [])) -> ((Bool true) :: [])
(*{| rule ``isIOInt(#EOF(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(Lbl'Hash'EOF) :: [])) -> ((Bool true) :: [])
(*{| rule ``isIOInt(#ENOTEMPTY(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(Lbl'Hash'ENOTEMPTY) :: [])) -> ((Bool true) :: [])
(*{| rule ``isIOInt(#EBADF(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(Lbl'Hash'EBADF) :: [])) -> ((Bool true) :: [])
(*{| rule ``isIOInt(#EXDEV(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(Lbl'Hash'EXDEV) :: [])) -> ((Bool true) :: [])
(*{| rule ``isIOInt(#ENODEV(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(Lbl'Hash'ENODEV) :: [])) -> ((Bool true) :: [])
(*{| rule ``isIOInt(#EALREADY(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(Lbl'Hash'EALREADY) :: [])) -> ((Bool true) :: [])
(*{| rule ``isIOInt(#EPFNOSUPPORT(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(Lbl'Hash'EPFNOSUPPORT) :: [])) -> ((Bool true) :: [])
(*{| rule ``isIOInt(#ECHILD(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(Lbl'Hash'ECHILD) :: [])) -> ((Bool true) :: [])
(*{| rule ``isIOInt(#EEXIST(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(Lbl'Hash'EEXIST) :: [])) -> ((Bool true) :: [])
(*{| rule ``isIOInt(K)=>#token("false","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") [owise()]|}*)
| ((varK_181)) -> ((Bool false) :: [])
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize1 c)))])
let evaldirectionalityChar (c: k) (config: k) (guard: int) : k = let lbl = 
LbldirectionalityChar and sort = 
SortString in match c with 
| _ -> try STRING.hook_directionality c lbl sort config freshFunction
with Not_implemented -> match c with 
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize1 c)))])
let evalFloat2String (c: k) (config: k) (guard: int) : k = let lbl = 
LblFloat2String and sort = 
SortString in match c with 
| _ -> try STRING.hook_float2string c lbl sort config freshFunction
with Not_implemented -> match c with 
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize1 c)))])
let eval'Hash'opendir'LPar'_'RPar'_K'Hyph'IO (c: k) (config: k) (guard: int) : k = let lbl = 
Lbl'Hash'opendir'LPar'_'RPar'_K'Hyph'IO and sort = 
SortKItem in match c with 
| _ -> try IO.hook_opendir c lbl sort config freshFunction
with Not_implemented -> match c with 
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize1 c)))])
let evalproject'Coln'Decs (c: k) (config: k) (guard: int) : k = let lbl = 
Lblproject'Coln'Decs and sort = 
SortDecs in match c with 
(*{| rule `` `project:Decs`(K)=>K`` requires #token("true","Bool") ensures #token("true","Bool") [projection()]|}*)
| ((varK_182 :: [])) -> (varK_182 :: [])
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize1 c)))])
let evalinitKCell (c: k) (config: k) (guard: int) : k = let lbl = 
LblinitKCell and sort = 
SortKCell in match c with 
(*{| rule ``initKCell(Init)=>`<k>`(`project:Decs`(`Map:lookup`(Init,#token("$PGM","KConfigVar"))))`` requires isDecs(`project:Decs`(`Map:lookup`(Init,#token("$PGM","KConfigVar")))) ensures #token("true","Bool") [UNIQUE_ID(cfe67f42395d6cd9a75adcc9e3ff1a0eef0dc3d5acd6fbc9cf32a2fb0e23a710) initializer()]|}*)
| (((Map (SortMap,_,_) as varInit_183) :: [])) when (isTrue (evalisDecs(((evalproject'Coln'Decs(((evalMap'Coln'lookup((varInit_183 :: []),(KToken (SortKConfigVar, "$PGM") :: [])) config (-1)))) config (-1)))) config (-1))) && (true) -> (KApply1(Lbl'_LT_'k'_GT_',((evalproject'Coln'Decs(((evalMap'Coln'lookup((varInit_183 :: []),(KToken (SortKConfigVar, "$PGM") :: [])) config (-1)))) config (-1)))) :: [])
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize1 c)))])
let evalsizeList (c: k) (config: k) (guard: int) : k = let lbl = 
LblsizeList and sort = 
SortInt in match c with 
| _ -> try LIST.hook_size c lbl sort config freshFunction
with Not_implemented -> match c with 
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize1 c)))])
let eval'Stop'Set (c: unit) (config: k) (guard: int) : k = let lbl = 
Lbl'Stop'Set and sort = 
SortSet in match c with 
| _ -> try SET.hook_unit c lbl sort config freshFunction
with Not_implemented -> match c with 
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize0 c)))])
let const'Stop'Set : k Lazy.t = lazy (eval'Stop'Set () interned_bottom (-1))
let eval_'ColnEqls'K_ (c: k * k) (config: k) (guard: int) : k = let lbl = 
Lbl_'ColnEqls'K_ and sort = 
SortBool in match c with 
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize2 c)))])
let evalproject'Coln'IOError (c: k) (config: k) (guard: int) : k = let lbl = 
Lblproject'Coln'IOError and sort = 
SortIOError in match c with 
(*{| rule `` `project:IOError`(K)=>K`` requires #token("true","Bool") ensures #token("true","Bool") [projection()]|}*)
| ((varK_184 :: [])) -> (varK_184 :: [])
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize1 c)))])
let eval_'EqlsSlshEqls'Bool__BOOL (c: k * k) (config: k) (guard: int) : k = let lbl = 
Lbl_'EqlsSlshEqls'Bool__BOOL and sort = 
SortBool in match c with 
| _ -> try BOOL.hook_ne c lbl sort config freshFunction
with Not_implemented -> match c with 
(*{| rule `` `_=/=Bool__BOOL`(B1,B2)=>`notBool_`(`_==Bool__BOOL`(B1,B2))`` requires `_andBool_`(isBool(B2),isBool(B1)) ensures #token("true","Bool") [UNIQUE_ID(229c060a3ad56352e70dadb0089a132434aa77f4aaf4ef46e44d820031a08b83) contentStartColumn(8) contentStartLine(358) org.kframework.attributes.Location(Location(358,8,358,57)) org.kframework.attributes.Source(Source(/Users/oft/k/include/builtin/domains.k)) org.kframework.definition.Production(syntax #RuleContent ::= #RuleBody [klabel(#ruleNoConditions) symbol()])]|}*)
| (((Bool _ as varB1_185) :: []),((Bool _ as varB2_186) :: [])) when ((true) && (true)) && (true) -> ([Bool ((not ((isTrue (eval_'EqlsEqls'Bool__BOOL((varB1_185 :: []),(varB2_186 :: [])) config (-1))))))])
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize2 c)))])
let evalremoveAll (c: k * k) (config: k) (guard: int) : k = let lbl = 
LblremoveAll and sort = 
SortMap in match c with 
| _ -> try MAP.hook_removeAll c lbl sort config freshFunction
with Not_implemented -> match c with 
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize2 c)))])
let evalisTCell (c: k) (config: k) (guard: int) : k = let lbl = 
LblisTCell and sort = 
SortBool in match c with 
(*{| rule ``isTCell(#KToken(#token("TCell","KString"),_))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KToken (SortTCell, var__187) :: [])) -> ((Bool true) :: [])
(*{| rule ``isTCell(`<T>`(K0,K1))=>#token("true","Bool")`` requires `_andBool_`(isKCell(K0),isEnvCell(K1)) ensures #token("true","Bool") []|}*)
| ((KApply2(Lbl'_LT_'T'_GT_',(varK0_188 :: []),(varK1_189 :: [])) :: [])) when (((isTrue (evalisKCell((varK0_188 :: [])) config (-1)))) && ((isTrue (evalisEnvCell((varK1_189 :: [])) config (-1))))) && (true) -> ((Bool true) :: [])
(*{| rule ``isTCell(K)=>#token("false","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") [owise()]|}*)
| ((varK_190)) -> ((Bool false) :: [])
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize1 c)))])
let eval_divInt__INT'Hyph'COMMON (c: k * k) (config: k) (guard: int) : k = let lbl = 
Lbl_divInt__INT'Hyph'COMMON and sort = 
SortInt in match c with 
| _ -> try INT.hook_ediv c lbl sort config freshFunction
with Not_implemented -> match c with 
(*{| rule `` `_divInt__INT-COMMON`(I1,I2)=>`_/Int__INT-COMMON`(`_-Int__INT-COMMON`(I1,`_modInt__INT-COMMON`(I1,I2)),I2)`` requires `_andBool_`(`_andBool_`(isInt(I1),isInt(I2)),`_=/=Int__INT-COMMON`(I2,#token("0","Int"))) ensures #token("true","Bool") [UNIQUE_ID(dec7b64a3adc500c0e43eb9b85005f460f2e5f1e3f86332d66309fd7ea950fa6) contentStartColumn(8) contentStartLine(439) org.kframework.attributes.Location(Location(439,8,440,23)) org.kframework.attributes.Source(Source(/Users/oft/k/include/builtin/domains.k)) org.kframework.definition.Production(syntax #RuleContent ::= #RuleBody "requires" K [klabel(#ruleRequires) symbol()])]|}*)
| (((Int _ as varI1_191) :: []),((Int _ as varI2_192) :: [])) when ((((true) && (true))) && ((isTrue (eval_'EqlsSlshEqls'Int__INT'Hyph'COMMON((varI2_192 :: []),((Lazy.force int0) :: [])) config (-1))))) && (true) -> ((eval_'Slsh'Int__INT'Hyph'COMMON(((eval_'Hyph'Int__INT'Hyph'COMMON((varI1_191 :: []),((eval_modInt__INT'Hyph'COMMON((varI1_191 :: []),(varI2_192 :: [])) config (-1)))) config (-1))),(varI2_192 :: [])) config (-1)))
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize2 c)))])
let eval_xorInt__INT'Hyph'COMMON (c: k * k) (config: k) (guard: int) : k = let lbl = 
Lbl_xorInt__INT'Hyph'COMMON and sort = 
SortInt in match c with 
| _ -> try INT.hook_xor c lbl sort config freshFunction
with Not_implemented -> match c with 
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize2 c)))])
let evalinitTCell (c: k) (config: k) (guard: int) : k = let lbl = 
LblinitTCell and sort = 
SortTCell in match c with 
(*{| rule ``initTCell(Init)=>`<T>`(initKCell(Init),initEnvCell(.KList))`` requires #token("true","Bool") ensures #token("true","Bool") [UNIQUE_ID(255c2ffc9da69162cec0155bba08702b88d747b1729c3c54ec3705e3d4cf5d9c) initializer()]|}*)
| (((Map (SortMap,_,_) as varInit_193) :: [])) -> (KApply2(Lbl'_LT_'T'_GT_',((evalinitKCell((varInit_193 :: [])) config (-1))),((Lazy.force constinitEnvCell))) :: [])
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize1 c)))])
let evalFloatFormat (c: k * k) (config: k) (guard: int) : k = let lbl = 
LblFloatFormat and sort = 
SortString in match c with 
| _ -> try STRING.hook_floatFormat c lbl sort config freshFunction
with Not_implemented -> match c with 
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize2 c)))])
let evalproject'Coln'IOInt (c: k) (config: k) (guard: int) : k = let lbl = 
Lblproject'Coln'IOInt and sort = 
SortIOInt in match c with 
(*{| rule `` `project:IOInt`(K)=>K`` requires #token("true","Bool") ensures #token("true","Bool") [projection()]|}*)
| ((varK_194 :: [])) -> (varK_194 :: [])
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize1 c)))])
let eval'Hash'stat'LPar'_'RPar'_K'Hyph'IO (c: k) (config: k) (guard: int) : k = let lbl = 
Lbl'Hash'stat'LPar'_'RPar'_K'Hyph'IO and sort = 
SortKItem in match c with 
| _ -> try IO.hook_stat c lbl sort config freshFunction
with Not_implemented -> match c with 
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize1 c)))])
let evalupdateList (c: k * k * k) (config: k) (guard: int) : k = let lbl = 
LblupdateList and sort = 
SortList in match c with 
| _ -> try LIST.hook_updateAll c lbl sort config freshFunction
with Not_implemented -> match c with 
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize3 c)))])
let evalSet'Coln'choice (c: k) (config: k) (guard: int) : k = let lbl = 
LblSet'Coln'choice and sort = 
SortKItem in match c with 
| _ -> try SET.hook_choice c lbl sort config freshFunction
with Not_implemented -> match c with 
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize1 c)))])
let evalproject'Coln'KCellOpt (c: k) (config: k) (guard: int) : k = let lbl = 
Lblproject'Coln'KCellOpt and sort = 
SortKCellOpt in match c with 
(*{| rule `` `project:KCellOpt`(K)=>K`` requires #token("true","Bool") ensures #token("true","Bool") [projection()]|}*)
| ((varK_195 :: [])) -> (varK_195 :: [])
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize1 c)))])
let evalcategoryChar (c: k) (config: k) (guard: int) : k = let lbl = 
LblcategoryChar and sort = 
SortString in match c with 
| _ -> try STRING.hook_category c lbl sort config freshFunction
with Not_implemented -> match c with 
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize1 c)))])
let evalSet'Coln'difference (c: k * k) (config: k) (guard: int) : k = let lbl = 
LblSet'Coln'difference and sort = 
SortSet in match c with 
| _ -> try SET.hook_difference c lbl sort config freshFunction
with Not_implemented -> match c with 
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize2 c)))])
let evalisKCellOpt (c: k) (config: k) (guard: int) : k = let lbl = 
LblisKCellOpt and sort = 
SortBool in match c with 
(*{| rule ``isKCellOpt(#KToken(#token("KCellOpt","KString"),_))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KToken (SortKCellOpt, var__196) :: [])) -> ((Bool true) :: [])
(*{| rule ``isKCellOpt(#KToken(#token("KCell","KString"),_))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KToken (SortKCell, var__197) :: [])) -> ((Bool true) :: [])
(*{| rule ``isKCellOpt(`<k>`(K0))=>#token("true","Bool")`` requires isK(K0) ensures #token("true","Bool") []|}*)
| ((KApply1(Lbl'_LT_'k'_GT_',(varK0_198)) :: [])) when true && (true) -> ((Bool true) :: [])
(*{| rule ``isKCellOpt(noKCell(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(LblnoKCell) :: [])) -> ((Bool true) :: [])
(*{| rule ``isKCellOpt(K)=>#token("false","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") [owise()]|}*)
| ((varK_199)) -> ((Bool false) :: [])
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize1 c)))])
let eval'Hash'write'LPar'_'Comm'_'RPar'_K'Hyph'IO (c: k * k) (config: k) (guard: int) : k = let lbl = 
Lbl'Hash'write'LPar'_'Comm'_'RPar'_K'Hyph'IO and sort = 
SortK in match c with 
| _ -> try IO.hook_write c lbl sort config freshFunction
with Not_implemented -> match c with 
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize2 c)))])
let eval'Hash'projectString (c: k) (config: k) (guard: int) : k = let lbl = 
Lbl'Hash'projectString and sort = 
SortString in match c with 
(*{| rule ``#projectString(S)=>S`` requires isString(S) ensures #token("true","Bool") [UNIQUE_ID(50b59d3ce87d0d2b54a53aa9a104f7077b2797b166bd94e6bfa21fff362a0144) contentStartColumn(8) contentStartLine(994) org.kframework.attributes.Location(Location(994,8,994,37)) org.kframework.attributes.Source(Source(/Users/oft/k/include/builtin/domains.k)) org.kframework.definition.Production(syntax #RuleContent ::= #RuleBody [klabel(#ruleNoConditions) symbol()])]|}*)
| (((String _ as varS_200) :: [])) when true && (true) -> (varS_200 :: [])
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize1 c)))])
let eval_'And'Int__INT'Hyph'COMMON (c: k * k) (config: k) (guard: int) : k = let lbl = 
Lbl_'And'Int__INT'Hyph'COMMON and sort = 
SortInt in match c with 
| _ -> try INT.hook_and c lbl sort config freshFunction
with Not_implemented -> match c with 
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize2 c)))])
let evalMap'Coln'lookupOrDefault (c: k * k * k) (config: k) (guard: int) : k = let lbl = 
LblMap'Coln'lookupOrDefault and sort = 
SortKItem in match c with 
| _ -> try MAP.hook_lookupOrDefault c lbl sort config freshFunction
with Not_implemented -> match c with 
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize3 c)))])
let evalString2Float (c: k) (config: k) (guard: int) : k = let lbl = 
LblString2Float and sort = 
SortFloat in match c with 
| _ -> try STRING.hook_string2float c lbl sort config freshFunction
with Not_implemented -> match c with 
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize1 c)))])
let eval'Hash'stdout_K'Hyph'IO (c: unit) (config: k) (guard: int) : k = let lbl = 
Lbl'Hash'stdout_K'Hyph'IO and sort = 
SortInt in match c with 
(*{| rule `` `#stdout_K-IO`(.KList)=>#token("1","Int")`` requires #token("true","Bool") ensures #token("true","Bool") [UNIQUE_ID(fd57288699ac44a10b4d3e3c65ee3ad16f98646109e64ed7a5ac726279e39ae9) contentStartColumn(8) contentStartLine(970) org.kframework.attributes.Location(Location(970,8,970,20)) org.kframework.attributes.Source(Source(/Users/oft/k/include/builtin/domains.k)) org.kframework.definition.Production(syntax #RuleContent ::= #RuleBody [klabel(#ruleNoConditions) symbol()])]|}*)
| () -> ((Lazy.force int1) :: [])
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize0 c)))])
let const'Hash'stdout_K'Hyph'IO : k Lazy.t = lazy (eval'Hash'stdout_K'Hyph'IO () interned_bottom (-1))
let evalproject'Coln'TCell (c: k) (config: k) (guard: int) : k = let lbl = 
Lblproject'Coln'TCell and sort = 
SortTCell in match c with 
(*{| rule `` `project:TCell`(K)=>K`` requires #token("true","Bool") ensures #token("true","Bool") [projection()]|}*)
| ((varK_201 :: [])) -> (varK_201 :: [])
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize1 c)))])
let evallog2Int (c: k) (config: k) (guard: int) : k = let lbl = 
Lbllog2Int and sort = 
SortInt in match c with 
| _ -> try INT.hook_log2 c lbl sort config freshFunction
with Not_implemented -> match c with 
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize1 c)))])
let eval'Hash'stdin_K'Hyph'IO (c: unit) (config: k) (guard: int) : k = let lbl = 
Lbl'Hash'stdin_K'Hyph'IO and sort = 
SortInt in match c with 
(*{| rule `` `#stdin_K-IO`(.KList)=>#token("0","Int")`` requires #token("true","Bool") ensures #token("true","Bool") [UNIQUE_ID(595a161d3d44d3c588fcd417f7279ef70547c573e159ef5bfc70692b22149da9) contentStartColumn(8) contentStartLine(969) org.kframework.attributes.Location(Location(969,8,969,19)) org.kframework.attributes.Source(Source(/Users/oft/k/include/builtin/domains.k)) org.kframework.definition.Production(syntax #RuleContent ::= #RuleBody [klabel(#ruleNoConditions) symbol()])]|}*)
| () -> ((Lazy.force int0) :: [])
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize0 c)))])
let const'Hash'stdin_K'Hyph'IO : k Lazy.t = lazy (eval'Hash'stdin_K'Hyph'IO () interned_bottom (-1))
let evalBase2String (c: k * k) (config: k) (guard: int) : k = let lbl = 
LblBase2String and sort = 
SortString in match c with 
| _ -> try STRING.hook_base2string c lbl sort config freshFunction
with Not_implemented -> match c with 
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize2 c)))])
let evalproject'Coln'TCellFragment (c: k) (config: k) (guard: int) : k = let lbl = 
Lblproject'Coln'TCellFragment and sort = 
SortTCellFragment in match c with 
(*{| rule `` `project:TCellFragment`(K)=>K`` requires #token("true","Bool") ensures #token("true","Bool") [projection()]|}*)
| ((varK_202 :: [])) -> (varK_202 :: [])
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize1 c)))])
let evalListItem (c: k) (config: k) (guard: int) : k = let lbl = 
LblListItem and sort = 
SortList in match c with 
| _ -> try LIST.hook_element c lbl sort config freshFunction
with Not_implemented -> match c with 
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize1 c)))])
let evalisStream (c: k) (config: k) (guard: int) : k = let lbl = 
LblisStream and sort = 
SortBool in match c with 
(*{| rule ``isStream(#buffer(K0))=>#token("true","Bool")`` requires isK(K0) ensures #token("true","Bool") []|}*)
| ((KApply1(Lbl'Hash'buffer,(varK0_203)) :: [])) when true && (true) -> ((Bool true) :: [])
(*{| rule ``isStream(#KToken(#token("Stream","KString"),_))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KToken (SortStream, var__204) :: [])) -> ((Bool true) :: [])
(*{| rule ``isStream(K)=>#token("false","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") [owise()]|}*)
| ((varK_205)) -> ((Bool false) :: [])
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize1 c)))])
let eval_'_GT_Eqls'String__STRING (c: k * k) (config: k) (guard: int) : k = let lbl = 
Lbl_'_GT_Eqls'String__STRING and sort = 
SortBool in match c with 
| _ -> try STRING.hook_ge c lbl sort config freshFunction
with Not_implemented -> match c with 
(*{| rule `` `_>=String__STRING`(S1,S2)=>`notBool_`(`_<String__STRING`(S1,S2))`` requires `_andBool_`(isString(S2),isString(S1)) ensures #token("true","Bool") [UNIQUE_ID(2e24bd4be2ac7aa21b58ac7fe4e1e4e70e5e69437dff6c98e3ff986df28f5b21) contentStartColumn(8) contentStartLine(597) org.kframework.attributes.Location(Location(597,8,597,63)) org.kframework.attributes.Source(Source(/Users/oft/k/include/builtin/domains.k)) org.kframework.definition.Production(syntax #RuleContent ::= #RuleBody [klabel(#ruleNoConditions) symbol()])]|}*)
| (((String _ as varS1_206) :: []),((String _ as varS2_207) :: [])) when ((true) && (true)) && (true) -> ([Bool ((not ((isTrue (eval_'_LT_'String__STRING((varS1_206 :: []),(varS2_207 :: [])) config (-1))))))])
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize2 c)))])
let evalproject'Coln'Dec (c: k) (config: k) (guard: int) : k = let lbl = 
Lblproject'Coln'Dec and sort = 
SortDec in match c with 
(*{| rule `` `project:Dec`(K)=>K`` requires #token("true","Bool") ensures #token("true","Bool") [projection()]|}*)
| ((varK_208 :: [])) -> (varK_208 :: [])
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize1 c)))])
let eval_'_LT_Eqls'Map__MAP (c: k * k) (config: k) (guard: int) : k = let lbl = 
Lbl_'_LT_Eqls'Map__MAP and sort = 
SortBool in match c with 
| _ -> try MAP.hook_inclusion c lbl sort config freshFunction
with Not_implemented -> match c with 
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize2 c)))])
let evalnewUUID_STRING (c: unit) (config: k) (guard: int) : k = let lbl = 
LblnewUUID_STRING and sort = 
SortString in match c with 
| _ -> try STRING.hook_uuid c lbl sort config freshFunction
with Not_implemented -> match c with 
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize0 c)))])
let evalproject'Coln'Float (c: k) (config: k) (guard: int) : k = let lbl = 
Lblproject'Coln'Float and sort = 
SortFloat in match c with 
(*{| rule `` `project:Float`(K)=>K`` requires #token("true","Bool") ensures #token("true","Bool") [projection()]|}*)
| (((Float _ as varK_209) :: [])) -> (varK_209 :: [])
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize1 c)))])
let evalsizeMap (c: k) (config: k) (guard: int) : k = let lbl = 
LblsizeMap and sort = 
SortInt in match c with 
| _ -> try MAP.hook_size c lbl sort config freshFunction
with Not_implemented -> match c with 
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize1 c)))])
let eval_dividesInt__INT'Hyph'COMMON (c: k * k) (config: k) (guard: int) : k = let lbl = 
Lbl_dividesInt__INT'Hyph'COMMON and sort = 
SortBool in match c with 
(*{| rule `` `_dividesInt__INT-COMMON`(I1,I2)=>`_==Int_`(`_%Int__INT-COMMON`(I2,I1),#token("0","Int"))`` requires `_andBool_`(isInt(I1),isInt(I2)) ensures #token("true","Bool") [UNIQUE_ID(d16f043d519e2dafbb9eb769a82d8f798ba9eedf200a3a94ff757ff0c9766915) contentStartColumn(8) contentStartLine(452) org.kframework.attributes.Location(Location(452,8,452,58)) org.kframework.attributes.Source(Source(/Users/oft/k/include/builtin/domains.k)) org.kframework.definition.Production(syntax #RuleContent ::= #RuleBody [klabel(#ruleNoConditions) symbol()])]|}*)
| (((Int _ as varI1_210) :: []),((Int _ as varI2_211) :: [])) when ((true) && (true)) && (true) -> ((eval_'EqlsEqls'Int_(((eval_'Perc'Int__INT'Hyph'COMMON((varI2_211 :: []),(varI1_210 :: [])) config (-1))),((Lazy.force int0) :: [])) config (-1)))
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize2 c)))])
let evalproject'Coln'String (c: k) (config: k) (guard: int) : k = let lbl = 
Lblproject'Coln'String and sort = 
SortString in match c with 
(*{| rule `` `project:String`(K)=>K`` requires #token("true","Bool") ensures #token("true","Bool") [projection()]|}*)
| (((String _ as varK_212) :: [])) -> (varK_212 :: [])
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize1 c)))])
let evalproject'Coln'Id (c: k) (config: k) (guard: int) : k = let lbl = 
Lblproject'Coln'Id and sort = 
SortId in match c with 
(*{| rule `` `project:Id`(K)=>K`` requires #token("true","Bool") ensures #token("true","Bool") [projection()]|}*)
| ((varK_213 :: [])) -> (varK_213 :: [])
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize1 c)))])
let evalsize (c: k) (config: k) (guard: int) : k = let lbl = 
Lblsize and sort = 
SortInt in match c with 
| _ -> try SET.hook_size c lbl sort config freshFunction
with Not_implemented -> match c with 
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize1 c)))])
let eval_'Xor_'Int__INT'Hyph'COMMON (c: k * k) (config: k) (guard: int) : k = let lbl = 
Lbl_'Xor_'Int__INT'Hyph'COMMON and sort = 
SortInt in match c with 
| _ -> try INT.hook_pow c lbl sort config freshFunction
with Not_implemented -> match c with 
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize2 c)))])
let eval_inList_ (c: k * k) (config: k) (guard: int) : k = let lbl = 
Lbl_inList_ and sort = 
SortBool in match c with 
| _ -> try LIST.hook_in c lbl sort config freshFunction
with Not_implemented -> match c with 
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize2 c)))])
let evalsrandInt (c: k) (config: k) (guard: int) : k = let lbl = 
LblsrandInt and sort = 
SortK in match c with 
| _ -> try INT.hook_srand c lbl sort config freshFunction
with Not_implemented -> match c with 
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize1 c)))])
let eval'Tild'Int__INT'Hyph'COMMON (c: k) (config: k) (guard: int) : k = let lbl = 
Lbl'Tild'Int__INT'Hyph'COMMON and sort = 
SortInt in match c with 
| _ -> try INT.hook_not c lbl sort config freshFunction
with Not_implemented -> match c with 
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize1 c)))])
let evalisKItem (c: k) (config: k) (guard: int) : k = let lbl = 
LblisKItem and sort = 
SortBool in match c with 
| [_] -> [Bool true] | _ -> [Bool false]
| [List (s,_,_)] when (s = SortList) -> [Bool true]
| [String _] -> [Bool true]
| [Bool _] -> [Bool true]
| [Map (s,_,_)] when (s = SortMap) -> [Bool true]
| [Int _] -> [Bool true]
| [Float _] -> [Bool true]
| [Set (s,_,_)] when (s = SortSet) -> [Bool true]
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize1 c)))])
let evalList'Coln'set (c: k * k * k) (config: k) (guard: int) : k = let lbl = 
LblList'Coln'set and sort = 
SortList in match c with 
| _ -> try LIST.hook_update c lbl sort config freshFunction
with Not_implemented -> match c with 
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize3 c)))])
let evalString2Base (c: k * k) (config: k) (guard: int) : k = let lbl = 
LblString2Base and sort = 
SortInt in match c with 
| _ -> try STRING.hook_string2base c lbl sort config freshFunction
with Not_implemented -> match c with 
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize2 c)))])
let evalisEnvCellOpt (c: k) (config: k) (guard: int) : k = let lbl = 
LblisEnvCellOpt and sort = 
SortBool in match c with 
(*{| rule ``isEnvCellOpt(noEnvCell(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(LblnoEnvCell) :: [])) -> ((Bool true) :: [])
(*{| rule ``isEnvCellOpt(#KToken(#token("EnvCell","KString"),_))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KToken (SortEnvCell, var__214) :: [])) -> ((Bool true) :: [])
(*{| rule ``isEnvCellOpt(`<env>`(K0))=>#token("true","Bool")`` requires isMap(K0) ensures #token("true","Bool") []|}*)
| ((KApply1(Lbl'_LT_'env'_GT_',((Map (SortMap,_,_) as varK0_215) :: [])) :: [])) when true && (true) -> ((Bool true) :: [])
(*{| rule ``isEnvCellOpt(#KToken(#token("EnvCellOpt","KString"),_))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KToken (SortEnvCellOpt, var__216) :: [])) -> ((Bool true) :: [])
(*{| rule ``isEnvCellOpt(K)=>#token("false","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") [owise()]|}*)
| ((varK_217)) -> ((Bool false) :: [])
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize1 c)))])
let evalisTCellFragment (c: k) (config: k) (guard: int) : k = let lbl = 
LblisTCellFragment and sort = 
SortBool in match c with 
(*{| rule ``isTCellFragment(`<T>-fragment`(K0,K1))=>#token("true","Bool")`` requires `_andBool_`(isKCellOpt(K0),isEnvCellOpt(K1)) ensures #token("true","Bool") []|}*)
| ((KApply2(Lbl'_LT_'T'_GT_Hyph'fragment,(varK0_218 :: []),(varK1_219 :: [])) :: [])) when (((isTrue (evalisKCellOpt((varK0_218 :: [])) config (-1)))) && ((isTrue (evalisEnvCellOpt((varK1_219 :: [])) config (-1))))) && (true) -> ((Bool true) :: [])
(*{| rule ``isTCellFragment(#KToken(#token("TCellFragment","KString"),_))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KToken (SortTCellFragment, var__220) :: [])) -> ((Bool true) :: [])
(*{| rule ``isTCellFragment(K)=>#token("false","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") [owise()]|}*)
| ((varK_221)) -> ((Bool false) :: [])
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize1 c)))])
let evalproject'Coln'EnvCellOpt (c: k) (config: k) (guard: int) : k = let lbl = 
Lblproject'Coln'EnvCellOpt and sort = 
SortEnvCellOpt in match c with 
(*{| rule `` `project:EnvCellOpt`(K)=>K`` requires #token("true","Bool") ensures #token("true","Bool") [projection()]|}*)
| ((varK_222 :: [])) -> (varK_222 :: [])
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize1 c)))])
let eval_'LSqB'_'_LT_Hyph'_'RSqB'_MAP (c: k * k * k) (config: k) (guard: int) : k = let lbl = 
Lbl_'LSqB'_'_LT_Hyph'_'RSqB'_MAP and sort = 
SortMap in match c with 
| _ -> try MAP.hook_update c lbl sort config freshFunction
with Not_implemented -> match c with 
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize3 c)))])
let eval'Hash'tell'LPar'_'RPar'_K'Hyph'IO (c: k) (config: k) (guard: int) : k = let lbl = 
Lbl'Hash'tell'LPar'_'RPar'_K'Hyph'IO and sort = 
SortIOInt in match c with 
| _ -> try IO.hook_tell c lbl sort config freshFunction
with Not_implemented -> match c with 
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize1 c)))])
let evalkeys (c: k) (config: k) (guard: int) : k = let lbl = 
Lblkeys and sort = 
SortSet in match c with 
| _ -> try MAP.hook_keys c lbl sort config freshFunction
with Not_implemented -> match c with 
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize1 c)))])
let evalgetKLabel (c: k) (config: k) (guard: int) : k = let lbl = 
LblgetKLabel and sort = 
SortKItem in match c with 
| _ -> try KREFLECTION.hook_getKLabel c lbl sort config freshFunction
with Not_implemented -> match c with 
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize1 c)))])
let evalisIOFile (c: k) (config: k) (guard: int) : k = let lbl = 
LblisIOFile and sort = 
SortBool in match c with 
(*{| rule ``isIOFile(#EDEADLK(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(Lbl'Hash'EDEADLK) :: [])) -> ((Bool true) :: [])
(*{| rule ``isIOFile(#ENETDOWN(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(Lbl'Hash'ENETDOWN) :: [])) -> ((Bool true) :: [])
(*{| rule ``isIOFile(#ENETUNREACH(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(Lbl'Hash'ENETUNREACH) :: [])) -> ((Bool true) :: [])
(*{| rule ``isIOFile(#EBUSY(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(Lbl'Hash'EBUSY) :: [])) -> ((Bool true) :: [])
(*{| rule ``isIOFile(#ESPIPE(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(Lbl'Hash'ESPIPE) :: [])) -> ((Bool true) :: [])
(*{| rule ``isIOFile(#ESHUTDOWN(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(Lbl'Hash'ESHUTDOWN) :: [])) -> ((Bool true) :: [])
(*{| rule ``isIOFile(#ENOTCONN(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(Lbl'Hash'ENOTCONN) :: [])) -> ((Bool true) :: [])
(*{| rule ``isIOFile(#ECONNRESET(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(Lbl'Hash'ECONNRESET) :: [])) -> ((Bool true) :: [])
(*{| rule ``isIOFile(#KToken(#token("IOFile","KString"),_))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KToken (SortIOFile, var__223) :: [])) -> ((Bool true) :: [])
(*{| rule ``isIOFile(#EOF(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(Lbl'Hash'EOF) :: [])) -> ((Bool true) :: [])
(*{| rule ``isIOFile(#EALREADY(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(Lbl'Hash'EALREADY) :: [])) -> ((Bool true) :: [])
(*{| rule ``isIOFile(#EMFILE(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(Lbl'Hash'EMFILE) :: [])) -> ((Bool true) :: [])
(*{| rule ``isIOFile(#ENOPROTOOPT(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(Lbl'Hash'ENOPROTOOPT) :: [])) -> ((Bool true) :: [])
(*{| rule ``isIOFile(#ETIMEDOUT(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(Lbl'Hash'ETIMEDOUT) :: [])) -> ((Bool true) :: [])
(*{| rule ``isIOFile(#KToken(#token("IOError","KString"),_))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KToken (SortIOError, var__224) :: [])) -> ((Bool true) :: [])
(*{| rule ``isIOFile(#EHOSTDOWN(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(Lbl'Hash'EHOSTDOWN) :: [])) -> ((Bool true) :: [])
(*{| rule ``isIOFile(#ERANGE(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(Lbl'Hash'ERANGE) :: [])) -> ((Bool true) :: [])
(*{| rule ``isIOFile(#ENOENT(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(Lbl'Hash'ENOENT) :: [])) -> ((Bool true) :: [])
(*{| rule ``isIOFile(#ENOSPC(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(Lbl'Hash'ENOSPC) :: [])) -> ((Bool true) :: [])
(*{| rule ``isIOFile(#EINPROGRESS(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(Lbl'Hash'EINPROGRESS) :: [])) -> ((Bool true) :: [])
(*{| rule ``isIOFile(#ECONNABORTED(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(Lbl'Hash'ECONNABORTED) :: [])) -> ((Bool true) :: [])
(*{| rule ``isIOFile(#ELOOP(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(Lbl'Hash'ELOOP) :: [])) -> ((Bool true) :: [])
(*{| rule ``isIOFile(#EISDIR(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(Lbl'Hash'EISDIR) :: [])) -> ((Bool true) :: [])
(*{| rule ``isIOFile(#ENODEV(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(Lbl'Hash'ENODEV) :: [])) -> ((Bool true) :: [])
(*{| rule ``isIOFile(#noParse(K0))=>#token("true","Bool")`` requires isString(K0) ensures #token("true","Bool") []|}*)
| ((KApply1(Lbl'Hash'noParse,((String _ as varK0_225) :: [])) :: [])) when true && (true) -> ((Bool true) :: [])
(*{| rule ``isIOFile(#EHOSTUNREACH(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(Lbl'Hash'EHOSTUNREACH) :: [])) -> ((Bool true) :: [])
(*{| rule ``isIOFile(#EISCONN(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(Lbl'Hash'EISCONN) :: [])) -> ((Bool true) :: [])
(*{| rule ``isIOFile(#ECHILD(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(Lbl'Hash'ECHILD) :: [])) -> ((Bool true) :: [])
(*{| rule ``isIOFile(#unknownIOError(K0))=>#token("true","Bool")`` requires isInt(K0) ensures #token("true","Bool") []|}*)
| ((KApply1(Lbl'Hash'unknownIOError,((Int _ as varK0_226) :: [])) :: [])) when true && (true) -> ((Bool true) :: [])
(*{| rule ``isIOFile(#EXDEV(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(Lbl'Hash'EXDEV) :: [])) -> ((Bool true) :: [])
(*{| rule ``isIOFile(#EINVAL(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(Lbl'Hash'EINVAL) :: [])) -> ((Bool true) :: [])
(*{| rule ``isIOFile(#ENETRESET(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(Lbl'Hash'ENETRESET) :: [])) -> ((Bool true) :: [])
(*{| rule ``isIOFile(#EMLINK(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(Lbl'Hash'EMLINK) :: [])) -> ((Bool true) :: [])
(*{| rule ``isIOFile(#ETOOMANYREFS(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(Lbl'Hash'ETOOMANYREFS) :: [])) -> ((Bool true) :: [])
(*{| rule ``isIOFile(#ENXIO(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(Lbl'Hash'ENXIO) :: [])) -> ((Bool true) :: [])
(*{| rule ``isIOFile(#EOVERFLOW(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(Lbl'Hash'EOVERFLOW) :: [])) -> ((Bool true) :: [])
(*{| rule ``isIOFile(#ENOTDIR(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(Lbl'Hash'ENOTDIR) :: [])) -> ((Bool true) :: [])
(*{| rule ``isIOFile(#ECONNREFUSED(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(Lbl'Hash'ECONNREFUSED) :: [])) -> ((Bool true) :: [])
(*{| rule ``isIOFile(#EACCES(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(Lbl'Hash'EACCES) :: [])) -> ((Bool true) :: [])
(*{| rule ``isIOFile(#EPROTOTYPE(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(Lbl'Hash'EPROTOTYPE) :: [])) -> ((Bool true) :: [])
(*{| rule ``isIOFile(#EPIPE(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(Lbl'Hash'EPIPE) :: [])) -> ((Bool true) :: [])
(*{| rule ``isIOFile(#ENOEXEC(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(Lbl'Hash'ENOEXEC) :: [])) -> ((Bool true) :: [])
(*{| rule ``isIOFile(#EFAULT(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(Lbl'Hash'EFAULT) :: [])) -> ((Bool true) :: [])
(*{| rule ``isIOFile(#ENAMETOOLONG(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(Lbl'Hash'ENAMETOOLONG) :: [])) -> ((Bool true) :: [])
(*{| rule ``isIOFile(#ENOSYS(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(Lbl'Hash'ENOSYS) :: [])) -> ((Bool true) :: [])
(*{| rule ``isIOFile(#EEXIST(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(Lbl'Hash'EEXIST) :: [])) -> ((Bool true) :: [])
(*{| rule ``isIOFile(#ENOLCK(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(Lbl'Hash'ENOLCK) :: [])) -> ((Bool true) :: [])
(*{| rule ``isIOFile(#EIO(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(Lbl'Hash'EIO) :: [])) -> ((Bool true) :: [])
(*{| rule ``isIOFile(#ESRCH(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(Lbl'Hash'ESRCH) :: [])) -> ((Bool true) :: [])
(*{| rule ``isIOFile(#EINTR(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(Lbl'Hash'EINTR) :: [])) -> ((Bool true) :: [])
(*{| rule ``isIOFile(#EBADF(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(Lbl'Hash'EBADF) :: [])) -> ((Bool true) :: [])
(*{| rule ``isIOFile(#ESOCKTNOSUPPORT(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(Lbl'Hash'ESOCKTNOSUPPORT) :: [])) -> ((Bool true) :: [])
(*{| rule ``isIOFile(#EROFS(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(Lbl'Hash'EROFS) :: [])) -> ((Bool true) :: [])
(*{| rule ``isIOFile(#EDESTADDRREQ(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(Lbl'Hash'EDESTADDRREQ) :: [])) -> ((Bool true) :: [])
(*{| rule ``isIOFile(#EDOM(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(Lbl'Hash'EDOM) :: [])) -> ((Bool true) :: [])
(*{| rule ``isIOFile(#EPROTONOSUPPORT(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(Lbl'Hash'EPROTONOSUPPORT) :: [])) -> ((Bool true) :: [])
(*{| rule ``isIOFile(#ENOTEMPTY(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(Lbl'Hash'ENOTEMPTY) :: [])) -> ((Bool true) :: [])
(*{| rule ``isIOFile(#ENOTTY(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(Lbl'Hash'ENOTTY) :: [])) -> ((Bool true) :: [])
(*{| rule ``isIOFile(#EAFNOSUPPORT(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(Lbl'Hash'EAFNOSUPPORT) :: [])) -> ((Bool true) :: [])
(*{| rule ``isIOFile(#EPFNOSUPPORT(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(Lbl'Hash'EPFNOSUPPORT) :: [])) -> ((Bool true) :: [])
(*{| rule ``isIOFile(#EFBIG(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(Lbl'Hash'EFBIG) :: [])) -> ((Bool true) :: [])
(*{| rule ``isIOFile(#ENOTSOCK(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(Lbl'Hash'ENOTSOCK) :: [])) -> ((Bool true) :: [])
(*{| rule ``isIOFile(#EADDRNOTAVAIL(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(Lbl'Hash'EADDRNOTAVAIL) :: [])) -> ((Bool true) :: [])
(*{| rule ``isIOFile(#E2BIG(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(Lbl'Hash'E2BIG) :: [])) -> ((Bool true) :: [])
(*{| rule ``isIOFile(#ENOBUFS(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(Lbl'Hash'ENOBUFS) :: [])) -> ((Bool true) :: [])
(*{| rule ``isIOFile(#EMSGSIZE(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(Lbl'Hash'EMSGSIZE) :: [])) -> ((Bool true) :: [])
(*{| rule ``isIOFile(#ENFILE(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(Lbl'Hash'ENFILE) :: [])) -> ((Bool true) :: [])
(*{| rule ``isIOFile(#ENOMEM(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(Lbl'Hash'ENOMEM) :: [])) -> ((Bool true) :: [])
(*{| rule ``isIOFile(#EADDRINUSE(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(Lbl'Hash'EADDRINUSE) :: [])) -> ((Bool true) :: [])
(*{| rule ``isIOFile(`#tempFile(_,_)_K-IO`(K0,K1))=>#token("true","Bool")`` requires `_andBool_`(isString(K0),isInt(K1)) ensures #token("true","Bool") []|}*)
| ((KApply2(Lbl'Hash'tempFile'LPar'_'Comm'_'RPar'_K'Hyph'IO,((String _ as varK0_227) :: []),((Int _ as varK1_228) :: [])) :: [])) when ((true) && (true)) && (true) -> ((Bool true) :: [])
(*{| rule ``isIOFile(#EPERM(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(Lbl'Hash'EPERM) :: [])) -> ((Bool true) :: [])
(*{| rule ``isIOFile(#EWOULDBLOCK(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(Lbl'Hash'EWOULDBLOCK) :: [])) -> ((Bool true) :: [])
(*{| rule ``isIOFile(#EOPNOTSUPP(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(Lbl'Hash'EOPNOTSUPP) :: [])) -> ((Bool true) :: [])
(*{| rule ``isIOFile(#EAGAIN(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(Lbl'Hash'EAGAIN) :: [])) -> ((Bool true) :: [])
(*{| rule ``isIOFile(K)=>#token("false","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") [owise()]|}*)
| ((varK_229)) -> ((Bool false) :: [])
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize1 c)))])
let eval'Hash'seekEnd'LPar'_'Comm'_'RPar'_K'Hyph'IO (c: k * k) (config: k) (guard: int) : k = let lbl = 
Lbl'Hash'seekEnd'LPar'_'Comm'_'RPar'_K'Hyph'IO and sort = 
SortK in match c with 
| _ -> try IO.hook_seekEnd c lbl sort config freshFunction
with Not_implemented -> match c with 
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize2 c)))])
let eval (c: normal_kitem) (config: k) : k = match c with KApply(lbl, kl) -> (match lbl with 
|Lbl'Hash'argv -> eval'Hash'argv (normalize0 kl) config (-1)
|LblnotBool_ -> evalnotBool_ (normalize1 kl) config (-1)
|LblMap'Coln'lookup -> evalMap'Coln'lookup (normalize2 kl) config (-1)
|Lbl'Hash'stderr_K'Hyph'IO -> eval'Hash'stderr_K'Hyph'IO (normalize0 kl) config (-1)
|Lbl'Hash'seek'LPar'_'Comm'_'RPar'_K'Hyph'IO -> eval'Hash'seek'LPar'_'Comm'_'RPar'_K'Hyph'IO (normalize2 kl) config (-1)
|LblsignExtendBitRangeInt -> evalsignExtendBitRangeInt (normalize3 kl) config (-1)
|Lbl_'EqlsEqls'Bool__BOOL -> eval_'EqlsEqls'Bool__BOOL (normalize2 kl) config (-1)
|LblisSet -> evalisSet (normalize1 kl) config (-1)
|Lbl_modInt__INT'Hyph'COMMON -> eval_modInt__INT'Hyph'COMMON (normalize2 kl) config (-1)
|Lbl'Hash'getenv -> eval'Hash'getenv (normalize1 kl) config (-1)
|Lbl'Hash'parseKAST -> eval'Hash'parseKAST (normalize1 kl) config (-1)
|LblintersectSet -> evalintersectSet (normalize2 kl) config (-1)
|Lbl_in_keys'LPar'_'RPar'_MAP -> eval_in_keys'LPar'_'RPar'_MAP (normalize2 kl) config (-1)
|LblfindChar -> evalfindChar (normalize3 kl) config (-1)
|LblSet'Coln'in -> evalSet'Coln'in (normalize2 kl) config (-1)
|LblisK -> evalisK (normalize1 kl) config (-1)
|LblString2Int -> evalString2Int (normalize1 kl) config (-1)
|Lbl_'Slsh'Int__INT'Hyph'COMMON -> eval_'Slsh'Int__INT'Hyph'COMMON (normalize2 kl) config (-1)
|Lbl_'_LT_Eqls'Set__SET -> eval_'_LT_Eqls'Set__SET (normalize2 kl) config (-1)
|LblisIOError -> evalisIOError (normalize1 kl) config (-1)
|LblmakeList -> evalmakeList (normalize2 kl) config (-1)
|Lbl_'LSqB'_'_LT_Hyph'undef'RSqB' -> eval_'LSqB'_'_LT_Hyph'undef'RSqB' (normalize2 kl) config (-1)
|Lbl'Hash'unlock'LPar'_'Comm'_'RPar'_K'Hyph'IO -> eval'Hash'unlock'LPar'_'Comm'_'RPar'_K'Hyph'IO (normalize2 kl) config (-1)
|Lbl_'EqlsEqls'Int_ -> eval_'EqlsEqls'Int_ (normalize2 kl) config (-1)
|Lbl_andThenBool__BOOL -> eval_andThenBool__BOOL (normalize2 kl) config (-1)
|Lbl_'ColnSlshEqls'K_ -> eval_'ColnSlshEqls'K_ (normalize2 kl) config (-1)
|Lbl_'EqlsSlshEqls'Int__INT'Hyph'COMMON -> eval_'EqlsSlshEqls'Int__INT'Hyph'COMMON (normalize2 kl) config (-1)
|Lblproject'Coln'Set -> evalproject'Coln'Set (normalize1 kl) config (-1)
|Lbl'Hash'system -> eval'Hash'system (normalize1 kl) config (-1)
|Lblis'Hash'KVariable -> evalis'Hash'KVariable (normalize1 kl) config (-1)
|LblisString -> evalisString (normalize1 kl) config (-1)
|LblisList -> evalisList (normalize1 kl) config (-1)
|LblreplaceAll'LPar'_'Comm'_'Comm'_'RPar'_STRING -> evalreplaceAll'LPar'_'Comm'_'Comm'_'RPar'_STRING (normalize3 kl) config (-1)
|Lblproject'Coln'Val -> evalproject'Coln'Val (normalize1 kl) config (-1)
|LblfindString -> evalfindString (normalize3 kl) config (-1)
|LblabsInt -> evalabsInt (normalize1 kl) config (-1)
|LblisEnvCell -> evalisEnvCell (normalize1 kl) config (-1)
|Lbl_'_GT_'String__STRING -> eval_'_GT_'String__STRING (normalize2 kl) config (-1)
|Lbl_'EqlsEqls'String__STRING -> eval_'EqlsEqls'String__STRING (normalize2 kl) config (-1)
|LblisKConfigVar -> evalisKConfigVar (normalize1 kl) config (-1)
|LblisVal -> evalisVal (normalize1 kl) config (-1)
|LblisDecs -> evalisDecs (normalize1 kl) config (-1)
|LblisKResult -> evalisKResult (normalize1 kl) config (-1)
|LblisCell -> evalisCell (normalize1 kl) config (-1)
|Lblvalues -> evalvalues (normalize1 kl) config (-1)
|LblList'Coln'get -> evalList'Coln'get (normalize2 kl) config (-1)
|Lbl'Hash'lstat'LPar'_'RPar'_K'Hyph'IO -> eval'Hash'lstat'LPar'_'RPar'_K'Hyph'IO (normalize1 kl) config (-1)
|Lblproject'Coln'KCell -> evalproject'Coln'KCell (normalize1 kl) config (-1)
|Lbl_'_GT__GT_'Int__INT'Hyph'COMMON -> eval_'_GT__GT_'Int__INT'Hyph'COMMON (normalize2 kl) config (-1)
|LblSetItem -> evalSetItem (normalize1 kl) config (-1)
|Lblproject'Coln'Map -> evalproject'Coln'Map (normalize1 kl) config (-1)
|Lbl'Stop'List -> eval'Stop'List (normalize0 kl) config (-1)
|Lbl'Hash'remove -> eval'Hash'remove (normalize1 kl) config (-1)
|LblrandInt -> evalrandInt (normalize1 kl) config (-1)
|Lbl'Hash'configuration_K'Hyph'REFLECTION -> eval'Hash'configuration_K'Hyph'REFLECTION (normalize0 kl) config (-1)
|LblisFloat -> evalisFloat (normalize1 kl) config (-1)
|Lbl'Hash'close'LPar'_'RPar'_K'Hyph'IO -> eval'Hash'close'LPar'_'RPar'_K'Hyph'IO (normalize1 kl) config (-1)
|Lblproject'Coln'IOString -> evalproject'Coln'IOString (normalize1 kl) config (-1)
|Lbl'Hash'mkstemp -> eval'Hash'mkstemp (normalize2 kl) config (-1)
|Lblkeys_list'LPar'_'RPar'_MAP -> evalkeys_list'LPar'_'RPar'_MAP (normalize1 kl) config (-1)
|LblfreshId -> evalfreshId (normalize1 kl) config (-1)
|LblchrChar -> evalchrChar (normalize1 kl) config (-1)
|Lbl_orElseBool__BOOL -> eval_orElseBool__BOOL (normalize2 kl) config (-1)
|Lblproject'Coln'Exp -> evalproject'Coln'Exp (normalize1 kl) config (-1)
|LblList'Coln'range -> evalList'Coln'range (normalize3 kl) config (-1)
|Lblproject'Coln'KResult -> evalproject'Coln'KResult (normalize1 kl) config (-1)
|Lbl_'Plus'Int_ -> eval_'Plus'Int_ (normalize2 kl) config (-1)
|LblisKCell -> evalisKCell (normalize1 kl) config (-1)
|Lbl_orBool__BOOL -> eval_orBool__BOOL (normalize2 kl) config (-1)
|LblinitEnvCell -> evalinitEnvCell (normalize0 kl) config (-1)
|LblupdateMap -> evalupdateMap (normalize2 kl) config (-1)
|Lblproject'Coln'Cell -> evalproject'Coln'Cell (normalize1 kl) config (-1)
|LblInt2String -> evalInt2String (normalize1 kl) config (-1)
|Lbl_'EqlsSlshEqls'K_ -> eval_'EqlsSlshEqls'K_ (normalize2 kl) config (-1)
|Lbl'Hash'lock'LPar'_'Comm'_'RPar'_K'Hyph'IO -> eval'Hash'lock'LPar'_'Comm'_'RPar'_K'Hyph'IO (normalize2 kl) config (-1)
|LblcountAllOccurrences'LPar'_'Comm'_'RPar'_STRING -> evalcountAllOccurrences'LPar'_'Comm'_'RPar'_STRING (normalize2 kl) config (-1)
|LblfillList -> evalfillList (normalize4 kl) config (-1)
|LblbitRangeInt -> evalbitRangeInt (normalize3 kl) config (-1)
|Lbl_'_LT_'String__STRING -> eval_'_LT_'String__STRING (normalize2 kl) config (-1)
|Lbl_List_ -> eval_List_ (normalize2 kl) config (-1)
|Lbl_'_LT_'Int__INT'Hyph'COMMON -> eval_'_LT_'Int__INT'Hyph'COMMON (normalize2 kl) config (-1)
|Lbl'Hash'open'LPar'_'Comm'_'RPar'_K'Hyph'IO -> eval'Hash'open'LPar'_'Comm'_'RPar'_K'Hyph'IO (normalize2 kl) config (-1)
|Lbl_'PipeHyph_GT_'_ -> eval_'PipeHyph_GT_'_ (normalize2 kl) config (-1)
|Lbl_xorBool__BOOL -> eval_xorBool__BOOL (normalize2 kl) config (-1)
|Lbl_'Hyph'Map__MAP -> eval_'Hyph'Map__MAP (normalize2 kl) config (-1)
|Lbl_'Xor_Perc'Int___INT'Hyph'COMMON -> eval_'Xor_Perc'Int___INT'Hyph'COMMON (normalize3 kl) config (-1)
|Lblproject'Coln'Bool -> evalproject'Coln'Bool (normalize1 kl) config (-1)
|Lbl_'EqlsEqls'K_ -> eval_'EqlsEqls'K_ (normalize2 kl) config (-1)
|Lbl'Hash'sort -> eval'Hash'sort (normalize1 kl) config (-1)
|Lbl_'Star'Int__INT'Hyph'COMMON -> eval_'Star'Int__INT'Hyph'COMMON (normalize2 kl) config (-1)
|Lbl'Hash'open'LPar'_'RPar'_K'Hyph'IO -> eval'Hash'open'LPar'_'RPar'_K'Hyph'IO (normalize1 kl) config (-1)
|Lblproject'Coln'List -> evalproject'Coln'List (normalize1 kl) config (-1)
|LblreplaceFirst'LPar'_'Comm'_'Comm'_'RPar'_STRING -> evalreplaceFirst'LPar'_'Comm'_'Comm'_'RPar'_STRING (normalize3 kl) config (-1)
|Lblproject'Coln'EnvCell -> evalproject'Coln'EnvCell (normalize1 kl) config (-1)
|LblisDec -> evalisDec (normalize1 kl) config (-1)
|Lbl'Hash'projectInt -> eval'Hash'projectInt (normalize1 kl) config (-1)
|Lbl'Hash'putc'LPar'_'Comm'_'RPar'_K'Hyph'IO -> eval'Hash'putc'LPar'_'Comm'_'RPar'_K'Hyph'IO (normalize2 kl) config (-1)
|LblisIOString -> evalisIOString (normalize1 kl) config (-1)
|Lbl'Stop'Map -> eval'Stop'Map (normalize0 kl) config (-1)
|Lbl'Hash'logToFile -> eval'Hash'logToFile (normalize2 kl) config (-1)
|Lblproject'Coln'IOFile -> evalproject'Coln'IOFile (normalize1 kl) config (-1)
|Lbl_'EqlsSlshEqls'String__STRING -> eval_'EqlsSlshEqls'String__STRING (normalize2 kl) config (-1)
|Lbl'Hash'read'LPar'_'Comm'_'RPar'_K'Hyph'IO -> eval'Hash'read'LPar'_'Comm'_'RPar'_K'Hyph'IO (normalize2 kl) config (-1)
|Lbl_'_LT_Eqls'Int__INT'Hyph'COMMON -> eval_'_LT_Eqls'Int__INT'Hyph'COMMON (normalize2 kl) config (-1)
|LblId2String -> evalId2String (normalize1 kl) config (-1)
|LblisInt -> evalisInt (normalize1 kl) config (-1)
|Lbl'Hash'fresh -> eval'Hash'fresh (normalize1 kl) config (-1)
|LblMap'Coln'choice -> evalMap'Coln'choice (normalize1 kl) config (-1)
|Lbl_impliesBool__BOOL -> eval_impliesBool__BOOL (normalize2 kl) config (-1)
|Lblproject'Coln'Stream -> evalproject'Coln'Stream (normalize1 kl) config (-1)
|Lbl'Hash'getc'LPar'_'RPar'_K'Hyph'IO -> eval'Hash'getc'LPar'_'RPar'_K'Hyph'IO (normalize1 kl) config (-1)
|Lbl_Set_ -> eval_Set_ (normalize2 kl) config (-1)
|Lbl_'Pipe'Int__INT'Hyph'COMMON -> eval_'Pipe'Int__INT'Hyph'COMMON (normalize2 kl) config (-1)
|LblisBool -> evalisBool (normalize1 kl) config (-1)
|LblminInt'LPar'_'Comm'_'RPar'_INT'Hyph'COMMON -> evalminInt'LPar'_'Comm'_'RPar'_INT'Hyph'COMMON (normalize2 kl) config (-1)
|Lbl_'_LT_Eqls'String__STRING -> eval_'_LT_Eqls'String__STRING (normalize2 kl) config (-1)
|LblordChar -> evalordChar (normalize1 kl) config (-1)
|LblrfindChar -> evalrfindChar (normalize3 kl) config (-1)
|Lbl_'_LT__LT_'Int__INT'Hyph'COMMON -> eval_'_LT__LT_'Int__INT'Hyph'COMMON (normalize2 kl) config (-1)
|Lblproject'Coln'Int -> evalproject'Coln'Int (normalize1 kl) config (-1)
|Lbl_'_GT_'Int__INT'Hyph'COMMON -> eval_'_GT_'Int__INT'Hyph'COMMON (normalize2 kl) config (-1)
|Lbl_Map_ -> eval_Map_ (normalize2 kl) config (-1)
|LblisIOInt -> evalisIOInt (normalize1 kl) config (-1)
|LbldirectionalityChar -> evaldirectionalityChar (normalize1 kl) config (-1)
|LblFloat2String -> evalFloat2String (normalize1 kl) config (-1)
|Lbl'Hash'opendir'LPar'_'RPar'_K'Hyph'IO -> eval'Hash'opendir'LPar'_'RPar'_K'Hyph'IO (normalize1 kl) config (-1)
|Lblproject'Coln'Decs -> evalproject'Coln'Decs (normalize1 kl) config (-1)
|LblinitKCell -> evalinitKCell (normalize1 kl) config (-1)
|LblsizeList -> evalsizeList (normalize1 kl) config (-1)
|Lbl'Stop'Set -> eval'Stop'Set (normalize0 kl) config (-1)
|Lbl_'ColnEqls'K_ -> eval_'ColnEqls'K_ (normalize2 kl) config (-1)
|LblString2Id -> evalString2Id (normalize1 kl) config (-1)
|Lblproject'Coln'IOError -> evalproject'Coln'IOError (normalize1 kl) config (-1)
|Lbl_'EqlsSlshEqls'Bool__BOOL -> eval_'EqlsSlshEqls'Bool__BOOL (normalize2 kl) config (-1)
|LblremoveAll -> evalremoveAll (normalize2 kl) config (-1)
|LblisTCell -> evalisTCell (normalize1 kl) config (-1)
|Lbl_andBool_ -> eval_andBool_ (normalize2 kl) config (-1)
|Lbl_divInt__INT'Hyph'COMMON -> eval_divInt__INT'Hyph'COMMON (normalize2 kl) config (-1)
|Lbl_xorInt__INT'Hyph'COMMON -> eval_xorInt__INT'Hyph'COMMON (normalize2 kl) config (-1)
|LbllengthString -> evallengthString (normalize1 kl) config (-1)
|LblinitTCell -> evalinitTCell (normalize1 kl) config (-1)
|LblmaxInt'LPar'_'Comm'_'RPar'_INT'Hyph'COMMON -> evalmaxInt'LPar'_'Comm'_'RPar'_INT'Hyph'COMMON (normalize2 kl) config (-1)
|LblFloatFormat -> evalFloatFormat (normalize2 kl) config (-1)
|Lbl_'Plus'String__STRING -> eval_'Plus'String__STRING (normalize2 kl) config (-1)
|Lblproject'Coln'IOInt -> evalproject'Coln'IOInt (normalize1 kl) config (-1)
|LblrfindString -> evalrfindString (normalize3 kl) config (-1)
|Lbl'Hash'stat'LPar'_'RPar'_K'Hyph'IO -> eval'Hash'stat'LPar'_'RPar'_K'Hyph'IO (normalize1 kl) config (-1)
|LblupdateList -> evalupdateList (normalize3 kl) config (-1)
|LblSet'Coln'choice -> evalSet'Coln'choice (normalize1 kl) config (-1)
|Lblproject'Coln'KCellOpt -> evalproject'Coln'KCellOpt (normalize1 kl) config (-1)
|LblcategoryChar -> evalcategoryChar (normalize1 kl) config (-1)
|LblSet'Coln'difference -> evalSet'Coln'difference (normalize2 kl) config (-1)
|LblfreshInt -> evalfreshInt (normalize1 kl) config (-1)
|LblisKCellOpt -> evalisKCellOpt (normalize1 kl) config (-1)
|Lbl'Hash'write'LPar'_'Comm'_'RPar'_K'Hyph'IO -> eval'Hash'write'LPar'_'Comm'_'RPar'_K'Hyph'IO (normalize2 kl) config (-1)
|Lbl'Hash'projectString -> eval'Hash'projectString (normalize1 kl) config (-1)
|Lbl_'And'Int__INT'Hyph'COMMON -> eval_'And'Int__INT'Hyph'COMMON (normalize2 kl) config (-1)
|LblMap'Coln'lookupOrDefault -> evalMap'Coln'lookupOrDefault (normalize3 kl) config (-1)
|LblString2Float -> evalString2Float (normalize1 kl) config (-1)
|Lbl'Hash'if_'Hash'then_'Hash'else_'Hash'fi_K'Hyph'EQUAL -> eval'Hash'if_'Hash'then_'Hash'else_'Hash'fi_K'Hyph'EQUAL (normalize3 kl) config (-1)
|Lbl'Hash'stdout_K'Hyph'IO -> eval'Hash'stdout_K'Hyph'IO (normalize0 kl) config (-1)
|Lblproject'Coln'TCell -> evalproject'Coln'TCell (normalize1 kl) config (-1)
|Lbllog2Int -> evallog2Int (normalize1 kl) config (-1)
|Lbl_'_GT_Eqls'Int__INT'Hyph'COMMON -> eval_'_GT_Eqls'Int__INT'Hyph'COMMON (normalize2 kl) config (-1)
|Lbl'Hash'stdin_K'Hyph'IO -> eval'Hash'stdin_K'Hyph'IO (normalize0 kl) config (-1)
|LblBase2String -> evalBase2String (normalize2 kl) config (-1)
|Lblproject'Coln'TCellFragment -> evalproject'Coln'TCellFragment (normalize1 kl) config (-1)
|LblListItem -> evalListItem (normalize1 kl) config (-1)
|LblisStream -> evalisStream (normalize1 kl) config (-1)
|Lbl_'_GT_Eqls'String__STRING -> eval_'_GT_Eqls'String__STRING (normalize2 kl) config (-1)
|Lblproject'Coln'Dec -> evalproject'Coln'Dec (normalize1 kl) config (-1)
|Lbl_'Hyph'Int__INT'Hyph'COMMON -> eval_'Hyph'Int__INT'Hyph'COMMON (normalize2 kl) config (-1)
|Lbl_'_LT_Eqls'Map__MAP -> eval_'_LT_Eqls'Map__MAP (normalize2 kl) config (-1)
|LblnewUUID_STRING -> evalnewUUID_STRING (normalize0 kl) config (-1)
|Lblproject'Coln'Float -> evalproject'Coln'Float (normalize1 kl) config (-1)
|LblsizeMap -> evalsizeMap (normalize1 kl) config (-1)
|Lbl_dividesInt__INT'Hyph'COMMON -> eval_dividesInt__INT'Hyph'COMMON (normalize2 kl) config (-1)
|LblisId -> evalisId (normalize1 kl) config (-1)
|LblsubstrString -> evalsubstrString (normalize3 kl) config (-1)
|Lblproject'Coln'String -> evalproject'Coln'String (normalize1 kl) config (-1)
|Lblproject'Coln'Id -> evalproject'Coln'Id (normalize1 kl) config (-1)
|Lblsize -> evalsize (normalize1 kl) config (-1)
|Lbl_'Xor_'Int__INT'Hyph'COMMON -> eval_'Xor_'Int__INT'Hyph'COMMON (normalize2 kl) config (-1)
|Lbl_inList_ -> eval_inList_ (normalize2 kl) config (-1)
|LblisMap -> evalisMap (normalize1 kl) config (-1)
|LblsrandInt -> evalsrandInt (normalize1 kl) config (-1)
|Lbl'Tild'Int__INT'Hyph'COMMON -> eval'Tild'Int__INT'Hyph'COMMON (normalize1 kl) config (-1)
|LblisKItem -> evalisKItem (normalize1 kl) config (-1)
|LblList'Coln'set -> evalList'Coln'set (normalize3 kl) config (-1)
|LblString2Base -> evalString2Base (normalize2 kl) config (-1)
|LblisTCellFragment -> evalisTCellFragment (normalize1 kl) config (-1)
|Lblproject'Coln'EnvCellOpt -> evalproject'Coln'EnvCellOpt (normalize1 kl) config (-1)
|Lblreplace'LPar'_'Comm'_'Comm'_'Comm'_'RPar'_STRING -> evalreplace'LPar'_'Comm'_'Comm'_'Comm'_'RPar'_STRING (normalize4 kl) config (-1)
|Lbl_'LSqB'_'_LT_Hyph'_'RSqB'_MAP -> eval_'LSqB'_'_LT_Hyph'_'RSqB'_MAP (normalize3 kl) config (-1)
|Lbl'Hash'tell'LPar'_'RPar'_K'Hyph'IO -> eval'Hash'tell'LPar'_'RPar'_K'Hyph'IO (normalize1 kl) config (-1)
|Lblkeys -> evalkeys (normalize1 kl) config (-1)
|Lbl_'Perc'Int__INT'Hyph'COMMON -> eval_'Perc'Int__INT'Hyph'COMMON (normalize2 kl) config (-1)
|LblgetKLabel -> evalgetKLabel (normalize1 kl) config (-1)
|LblisEnvCellOpt -> evalisEnvCellOpt (normalize1 kl) config (-1)
|LblisIOFile -> evalisIOFile (normalize1 kl) config (-1)
|LblisExp -> evalisExp (normalize1 kl) config (-1)
|Lbl'Hash'seekEnd'LPar'_'Comm'_'RPar'_K'Hyph'IO -> eval'Hash'seekEnd'LPar'_'Comm'_'RPar'_K'Hyph'IO (normalize2 kl) config (-1)
| _ -> [denormalize c])
| _ -> [denormalize c]
let rec get_next_op_from_exp(c: kitem) : (k -> k * (step_function)) = step
and step (c:k) : k * step_function =
 try let config = c in match c with 
(*{| rule `<T>`(`<k>`(`` `.List{"_;__MINI-SML-SYNTAX"}`(.KList)=>.K``~>DotVar1),DotVar0) requires #token("true","Bool") ensures #token("true","Bool") [UNIQUE_ID(5f82339441eaad72e3debe9928a9dbbcf2f78ccd456d3a11c3d195fd64fafd89) contentStartColumn(8) contentStartLine(29) org.kframework.attributes.Location(Location(29,8,29,18)) org.kframework.attributes.Source(Source(/Users/oft/files/theia/mini-sml-talk/./mini-sml.k)) org.kframework.definition.Production(syntax #RuleContent ::= #RuleBody [klabel(#ruleNoConditions) symbol()])]|}*)
| (KApply2(Lbl'_LT_'T'_GT_',(KApply1(Lbl'_LT_'k'_GT_',(KApply0(Lbl'Stop'List'LBraQuot'_'SCln'__MINI'Hyph'SML'Hyph'SYNTAX'QuotRBra') :: varDotVar1_230)) :: []),(varDotVar0_231)) :: []) -> (((KApply2(Lbl'_LT_'T'_GT_',(KApply1(Lbl'_LT_'k'_GT_',(varDotVar1_230)) :: []),(varDotVar0_231)) :: [])), (StepFunc step))
(*{| rule `<T>`(`<k>`(``HOLE~>`#freezer_+__MINI-SML-SYNTAX1_`(K1)=>`_+__MINI-SML-SYNTAX`(HOLE,K1)``~>DotVar1),DotVar0) requires `_andBool_`(`_andBool_`(isExp(HOLE),isExp(K1)),`_andBool_`(#token("true","Bool"),isKResult(HOLE))) ensures #token("true","Bool") [UNIQUE_ID(66defc436193c3794eed3956d4fafdf45951ddf81ad82b238650800e345ed8e8) cool() left() org.kframework.attributes.Location(Location(13,18,13,43)) org.kframework.attributes.Source(Source(/Users/oft/files/theia/mini-sml-talk/./mini-sml.k)) productionID(846918683) strict()]|}*)
| (KApply2(Lbl'_LT_'T'_GT_',(KApply1(Lbl'_LT_'k'_GT_',(varHOLE_232 :: KApply1(Lbl'Hash'freezer_'Plus'__MINI'Hyph'SML'Hyph'SYNTAX1_,(varK1_233 :: [])) :: varDotVar1_234)) :: []),(varDotVar0_235)) :: []) when (((((isTrue (evalisExp((varHOLE_232 :: [])) config (-1)))) && ((isTrue (evalisExp((varK1_233 :: [])) config (-1)))))) && (((true) && ((isTrue (evalisKResult((varHOLE_232 :: [])) config (-1))))))) && (true) -> (((KApply2(Lbl'_LT_'T'_GT_',(KApply1(Lbl'_LT_'k'_GT_',(KApply2(Lbl_'Plus'__MINI'Hyph'SML'Hyph'SYNTAX,(varHOLE_232 :: []),(varK1_233 :: [])) :: varDotVar1_234)) :: []),(varDotVar0_235)) :: [])), (StepFunc step))
(*{| rule `<T>`(`<k>`(`` `_+__MINI-SML-SYNTAX`(K0,HOLE)=>HOLE~>`#freezer_+__MINI-SML-SYNTAX0_`(K0)``~>DotVar1),DotVar0) requires `_andBool_`(`_andBool_`(isExp(HOLE),isExp(K0)),`_andBool_`(#token("true","Bool"),`notBool_`(isKResult(HOLE)))) ensures #token("true","Bool") [UNIQUE_ID(796a6798611dd1aa6d0c492e3af96e0894a66526d288598855ea2db677015b9d) heat() left() org.kframework.attributes.Location(Location(13,18,13,43)) org.kframework.attributes.Source(Source(/Users/oft/files/theia/mini-sml-talk/./mini-sml.k)) productionID(846918683) strict()]|}*)
| (KApply2(Lbl'_LT_'T'_GT_',(KApply1(Lbl'_LT_'k'_GT_',(KApply2(Lbl_'Plus'__MINI'Hyph'SML'Hyph'SYNTAX,(varK0_236 :: []),(varHOLE_237 :: [])) :: varDotVar1_238)) :: []),(varDotVar0_239)) :: []) when (((((isTrue (evalisExp((varHOLE_237 :: [])) config (-1)))) && ((isTrue (evalisExp((varK0_236 :: [])) config (-1)))))) && (((true) && ((not ((isTrue (evalisKResult((varHOLE_237 :: [])) config (-1))))))))) && (true) -> (((KApply2(Lbl'_LT_'T'_GT_',(KApply1(Lbl'_LT_'k'_GT_',(varHOLE_237 :: KApply1(Lbl'Hash'freezer_'Plus'__MINI'Hyph'SML'Hyph'SYNTAX0_,(varK0_236 :: [])) :: varDotVar1_238)) :: []),(varDotVar0_239)) :: [])), (StepFunc step))
(*{| rule `<T>`(`<k>`(``HOLE~>`#freezer_+__MINI-SML-SYNTAX0_`(K0)=>`_+__MINI-SML-SYNTAX`(K0,HOLE)``~>DotVar1),DotVar0) requires `_andBool_`(`_andBool_`(isExp(HOLE),isExp(K0)),`_andBool_`(#token("true","Bool"),isKResult(HOLE))) ensures #token("true","Bool") [UNIQUE_ID(db935598794138448ca9f9cf9a5d078abe9a92a1c89e0e58170a8199c3fa26c7) cool() left() org.kframework.attributes.Location(Location(13,18,13,43)) org.kframework.attributes.Source(Source(/Users/oft/files/theia/mini-sml-talk/./mini-sml.k)) productionID(846918683) strict()]|}*)
| (KApply2(Lbl'_LT_'T'_GT_',(KApply1(Lbl'_LT_'k'_GT_',(varHOLE_240 :: KApply1(Lbl'Hash'freezer_'Plus'__MINI'Hyph'SML'Hyph'SYNTAX0_,(varK0_241 :: [])) :: varDotVar1_242)) :: []),(varDotVar0_243)) :: []) when (((((isTrue (evalisExp((varHOLE_240 :: [])) config (-1)))) && ((isTrue (evalisExp((varK0_241 :: [])) config (-1)))))) && (((true) && ((isTrue (evalisKResult((varHOLE_240 :: [])) config (-1))))))) && (true) -> (((KApply2(Lbl'_LT_'T'_GT_',(KApply1(Lbl'_LT_'k'_GT_',(KApply2(Lbl_'Plus'__MINI'Hyph'SML'Hyph'SYNTAX,(varK0_241 :: []),(varHOLE_240 :: [])) :: varDotVar1_242)) :: []),(varDotVar0_243)) :: [])), (StepFunc step))
(*{| rule `<T>`(`<k>`(`` `val_=__MINI-SML-SYNTAX`(K0,HOLE)=>HOLE~>`#freezerval_=__MINI-SML-SYNTAX0_`(K0)``~>DotVar1),DotVar0) requires `_andBool_`(`_andBool_`(isExp(HOLE),isId(K0)),`_andBool_`(#token("true","Bool"),`notBool_`(isKResult(HOLE)))) ensures #token("true","Bool") [UNIQUE_ID(30b83db681bd4bd99c570ce747edbcfa16a2b8ae82f2b72bbb8d5dc58130b122) heat() org.kframework.attributes.Location(Location(6,18,6,45)) org.kframework.attributes.Source(Source(/Users/oft/files/theia/mini-sml-talk/./mini-sml.k)) productionID(1987360300) strict(2)]|}*)
| (KApply2(Lbl'_LT_'T'_GT_',(KApply1(Lbl'_LT_'k'_GT_',(KApply2(Lblval_'Eqls'__MINI'Hyph'SML'Hyph'SYNTAX,(varK0_244 :: []),(varHOLE_245 :: [])) :: varDotVar1_246)) :: []),(varDotVar0_247)) :: []) when (((((isTrue (evalisExp((varHOLE_245 :: [])) config (-1)))) && ((isTrue (evalisId((varK0_244 :: [])) config (-1)))))) && (((true) && ((not ((isTrue (evalisKResult((varHOLE_245 :: [])) config (-1))))))))) && (true) -> (((KApply2(Lbl'_LT_'T'_GT_',(KApply1(Lbl'_LT_'k'_GT_',(varHOLE_245 :: KApply1(Lbl'Hash'freezerval_'Eqls'__MINI'Hyph'SML'Hyph'SYNTAX0_,(varK0_244 :: [])) :: varDotVar1_246)) :: []),(varDotVar0_247)) :: [])), (StepFunc step))
(*{| rule `<T>`(`<k>`(`` `_+__MINI-SML-SYNTAX`(I1,I2)=>`_+Int_`(I1,I2)``~>DotVar1),DotVar0) requires `_andBool_`(isInt(I1),isInt(I2)) ensures #token("true","Bool") [UNIQUE_ID(1cee67cbb334acb06f268bd5d9fbbda7b13f35e994fcffb6d2baeaec9e194864) contentStartColumn(8) contentStartLine(27) org.kframework.attributes.Location(Location(27,8,27,37)) org.kframework.attributes.Source(Source(/Users/oft/files/theia/mini-sml-talk/./mini-sml.k)) org.kframework.definition.Production(syntax #RuleContent ::= #RuleBody [klabel(#ruleNoConditions) symbol()])]|}*)
| (KApply2(Lbl'_LT_'T'_GT_',(KApply1(Lbl'_LT_'k'_GT_',(KApply2(Lbl_'Plus'__MINI'Hyph'SML'Hyph'SYNTAX,((Int _ as varI1_248) :: []),((Int _ as varI2_249) :: [])) :: varDotVar1_250)) :: []),(varDotVar0_251)) :: []) when ((true) && (true)) && (true) -> (((KApply2(Lbl'_LT_'T'_GT_',(KApply1(Lbl'_LT_'k'_GT_',((eval_'Plus'Int_((varI1_248 :: []),(varI2_249 :: [])) config (-1)) @ varDotVar1_250)) :: []),(varDotVar0_251)) :: [])), (StepFunc step))
(*{| rule `<T>`(`<k>`(`` `_;__MINI-SML-SYNTAX`(D,Ds)=>D~>Ds``~>DotVar1),DotVar0) requires `_andBool_`(isDec(D),isDecs(Ds)) ensures #token("true","Bool") [UNIQUE_ID(43b26d44d815ed035381c4079d6e9901193fc12b13d8178e035d9f0da4cfb12d) contentStartColumn(8) contentStartLine(30) org.kframework.attributes.Location(Location(30,8,30,34)) org.kframework.attributes.Source(Source(/Users/oft/files/theia/mini-sml-talk/./mini-sml.k)) org.kframework.definition.Production(syntax #RuleContent ::= #RuleBody [klabel(#ruleNoConditions) symbol()])]|}*)
| (KApply2(Lbl'_LT_'T'_GT_',(KApply1(Lbl'_LT_'k'_GT_',(KApply2(Lbl_'SCln'__MINI'Hyph'SML'Hyph'SYNTAX,(varD_252 :: []),(varDs_253 :: [])) :: varDotVar1_254)) :: []),(varDotVar0_255)) :: []) when (((isTrue (evalisDec((varD_252 :: [])) config (-1)))) && ((isTrue (evalisDecs((varDs_253 :: [])) config (-1))))) && (true) -> (((KApply2(Lbl'_LT_'T'_GT_',(KApply1(Lbl'_LT_'k'_GT_',(varD_252 :: varDs_253 :: varDotVar1_254)) :: []),(varDotVar0_255)) :: [])), (StepFunc step))
(*{| rule `<T>`(`<k>`(`` `_+__MINI-SML-SYNTAX`(HOLE,K1)=>HOLE~>`#freezer_+__MINI-SML-SYNTAX1_`(K1)``~>DotVar1),DotVar0) requires `_andBool_`(`_andBool_`(isExp(HOLE),isExp(K1)),`_andBool_`(#token("true","Bool"),`notBool_`(isKResult(HOLE)))) ensures #token("true","Bool") [UNIQUE_ID(dcb20c29dd364831c531d824e997f4abedfe6eba40d9195b10b10637d072aac2) heat() left() org.kframework.attributes.Location(Location(13,18,13,43)) org.kframework.attributes.Source(Source(/Users/oft/files/theia/mini-sml-talk/./mini-sml.k)) productionID(846918683) strict()]|}*)
| (KApply2(Lbl'_LT_'T'_GT_',(KApply1(Lbl'_LT_'k'_GT_',(KApply2(Lbl_'Plus'__MINI'Hyph'SML'Hyph'SYNTAX,(varHOLE_256 :: []),(varK1_257 :: [])) :: varDotVar1_258)) :: []),(varDotVar0_259)) :: []) when (((((isTrue (evalisExp((varHOLE_256 :: [])) config (-1)))) && ((isTrue (evalisExp((varK1_257 :: [])) config (-1)))))) && (((true) && ((not ((isTrue (evalisKResult((varHOLE_256 :: [])) config (-1))))))))) && (true) -> (((KApply2(Lbl'_LT_'T'_GT_',(KApply1(Lbl'_LT_'k'_GT_',(varHOLE_256 :: KApply1(Lbl'Hash'freezer_'Plus'__MINI'Hyph'SML'Hyph'SYNTAX1_,(varK1_257 :: [])) :: varDotVar1_258)) :: []),(varDotVar0_259)) :: [])), (StepFunc step))
(*{| rule `<T>`(`<k>`(``HOLE~>`#freezerval_=__MINI-SML-SYNTAX0_`(K0)=>`val_=__MINI-SML-SYNTAX`(K0,HOLE)``~>DotVar1),DotVar0) requires `_andBool_`(`_andBool_`(isExp(HOLE),isId(K0)),`_andBool_`(#token("true","Bool"),isKResult(HOLE))) ensures #token("true","Bool") [UNIQUE_ID(20f9f884b0cd91f7f254f9580795dcb0048661ab4a64e9bedd52617708f49065) cool() org.kframework.attributes.Location(Location(6,18,6,45)) org.kframework.attributes.Source(Source(/Users/oft/files/theia/mini-sml-talk/./mini-sml.k)) productionID(1987360300) strict(2)]|}*)
| (KApply2(Lbl'_LT_'T'_GT_',(KApply1(Lbl'_LT_'k'_GT_',(varHOLE_260 :: KApply1(Lbl'Hash'freezerval_'Eqls'__MINI'Hyph'SML'Hyph'SYNTAX0_,(varK0_261 :: [])) :: varDotVar1_262)) :: []),(varDotVar0_263)) :: []) when (((((isTrue (evalisExp((varHOLE_260 :: [])) config (-1)))) && ((isTrue (evalisId((varK0_261 :: [])) config (-1)))))) && (((true) && ((isTrue (evalisKResult((varHOLE_260 :: [])) config (-1))))))) && (true) -> (((KApply2(Lbl'_LT_'T'_GT_',(KApply1(Lbl'_LT_'k'_GT_',(KApply2(Lblval_'Eqls'__MINI'Hyph'SML'Hyph'SYNTAX,(varK0_261 :: []),(varHOLE_260 :: [])) :: varDotVar1_262)) :: []),(varDotVar0_263)) :: [])), (StepFunc step))
| _ -> lookups_step c c (-1)
with Sys.Break -> raise (Stuck c)
and lookups_step (c: k) (config: k) (guard: int) : k * step_function = match c with 
| (KApply2(Lbl'_LT_'T'_GT_',(KApply1(Lbl'_LT_'k'_GT_',(KApply2(Lblval_'Eqls'__MINI'Hyph'SML'Hyph'SYNTAX,(var_0_264 :: []),(var_1_265 :: [])) :: var_2_266)) :: []),(KApply1(Lbl'_LT_'env'_GT_',(var_3_267)) :: [])) :: []) when guard < 9(*{| rule `<T>`(`<k>`(`` `val_=__MINI-SML-SYNTAX`(X,V)~>Ds=>Ds``),`<env>`(``_0=>`_Map_`(`_|->_`(X,V),DotVar1)``)) requires `_andBool_`(#match(DotVar1,_0),`_andBool_`(isVal(V),isId(X))) ensures #token("true","Bool") [UNIQUE_ID(1f4f235e83b17b2a24a9cd1647bc46ddd3f9fbfdeb0f64a3623f42df086965cb) contentStartColumn(8) contentStartLine(32) org.kframework.attributes.Location(Location(32,8,33,39)) org.kframework.attributes.Source(Source(/Users/oft/files/theia/mini-sml-talk/./mini-sml.k)) org.kframework.definition.Production(syntax #RuleContent ::= #RuleBody [klabel(#ruleNoConditions) symbol()])]|}*)
 -> (let e = (var_3_267) in match e with 
| [Bottom] -> (lookups_step c config 9)
| ((Map (SortMap,_,_) as var_4_268) :: []) when ((true) && ((((isTrue (evalisVal((var_1_265 :: [])) config (-1)))) && ((isTrue (evalisId((var_0_264 :: [])) config (-1))))))) && (true) -> (((KApply2(Lbl'_LT_'T'_GT_',(KApply1(Lbl'_LT_'k'_GT_',(var_2_266)) :: []),(KApply1(Lbl'_LT_'env'_GT_',((eval_Map_(((eval_'PipeHyph_GT_'_((var_0_264 :: []),(var_1_265 :: [])) config (-1))),(var_4_268 :: [])) config (-1)))) :: [])) :: [])), (StepFunc step))| _ -> (lookups_step c config 9))
| (KApply2(Lbl'_LT_'T'_GT_',(KApply1(Lbl'_LT_'k'_GT_',(var_0_269 :: var_1_270)) :: []),(KApply1(Lbl'_LT_'env'_GT_',(var_2_271)) :: [])) :: []) when guard < 10(*{| rule `<T>`(`<k>`(``X=>V``~>DotVar1),`<env>`(_0)) requires `_andBool_`(`_andBool_`(#match(V,`Map:lookup`(_0,X)),#match(DotVar2,`_[_<-undef]`(_0,X))),`_andBool_`(isKItem(V),isKItem(X))) ensures #token("true","Bool") [UNIQUE_ID(eaf186a59dbd45cf3204c5f520931314a0752d407b113fb2055c95df08cbd665) contentStartColumn(8) contentStartLine(35) org.kframework.attributes.Location(Location(35,8,36,34)) org.kframework.attributes.Source(Source(/Users/oft/files/theia/mini-sml-talk/./mini-sml.k)) org.kframework.definition.Production(syntax #RuleContent ::= #RuleBody [klabel(#ruleNoConditions) symbol()])]|}*)
 -> (let e = ((evalMap'Coln'lookup((var_2_271),(var_0_269 :: [])) config (-1))) in match e with 
| [Bottom] -> (lookups_step c config 10)
| (var_3_272 :: []) -> (let e = ((eval_'LSqB'_'_LT_Hyph'undef'RSqB'((var_2_271),(var_0_269 :: [])) config (-1))) in match e with 
| [Bottom] -> (lookups_step c config 10)
| ((Map (SortMap,_,_) as var_4_273) :: []) when ((((true) && (true))) && (((true) && (true)))) && (true) -> (((KApply2(Lbl'_LT_'T'_GT_',(KApply1(Lbl'_LT_'k'_GT_',(var_3_272 :: var_1_270)) :: []),(KApply1(Lbl'_LT_'env'_GT_',(var_2_271)) :: [])) :: [])), (StepFunc step))| _ -> (lookups_step c config 10))| _ -> (lookups_step c config 10))
| _ -> raise (Stuck c)
let make_stuck (config: k) : k = config
let make_unstuck (config: k) : k = config
let get_thread_set (config: k) : k = [Map(SortMap,Lbl_Map_,KMap.empty)]
let set_thread_set (config: k) (set: k) : k = config
end
let () = Plugin.the_definition := Some (module Def)
