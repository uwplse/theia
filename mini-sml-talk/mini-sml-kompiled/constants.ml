type sort = 
|SortEnvCellOpt
|SortBool
|SortK
|SortKResult
|SortEnvCell
|SortMap
|SortKCell
|SortDec
|SortBytes
|SortKItem
|SortDecs
|SortIOInt
|SortIOError
|SortStringBuffer
|SortTCell
|SortVal
|SortInt
|SortStream
|SortIOString
|Sort'Hash'KVariable
|SortKConfigVar
|SortKCellOpt
|SortString
|SortFloat
|SortTCellFragment
|SortSet
|SortIOFile
|SortId
|SortCell
|SortList
|SortExp
type klabel = 
|Lbl'Hash'ENFILE
|Lbl'Hash'argv
|LblnotBool_
|Lbl'Hash'ENETRESET
|LblMap'Coln'lookup
|Lbl'Hash'stderr_K'Hyph'IO
|Lbl'Hash'ETOOMANYREFS
|LblnoKCell
|Lbl'Hash'seek'LPar'_'Comm'_'RPar'_K'Hyph'IO
|LblsignExtendBitRangeInt
|Lbl_'EqlsEqls'Bool__BOOL
|LblisSet
|Lbl_modInt__INT'Hyph'COMMON
|Lbl'Hash'getenv
|Lbl'Hash'ENOPROTOOPT
|Lbl'Hash'parseKAST
|Lbl'Hash'freezerval_'Eqls'__MINI'Hyph'SML'Hyph'SYNTAX0_
|Lbl'Hash'EMLINK
|LblintersectSet
|Lbl_in_keys'LPar'_'RPar'_MAP
|Lbl'Hash'EADDRNOTAVAIL
|LblfindChar
|LblSet'Coln'in
|LblisK
|LblString2Int
|Lbl'Hash'False
|Lbl_'Slsh'Int__INT'Hyph'COMMON
|Lbl_'_LT_Eqls'Set__SET
|LblnoEnvCell
|Lbl'Hash'EAGAIN
|LblisIOError
|Lbl'Hash'ENOEXEC
|Lbl'Hash'Floor
|LblmakeList
|Lbl'Hash'ENOMEM
|Lbl_'LSqB'_'_LT_Hyph'undef'RSqB'
|Lbl'Hash'Bottom
|Lbl'Hash'unlock'LPar'_'Comm'_'RPar'_K'Hyph'IO
|Lbl'Hash'EDEADLK
|Lbl_'EqlsEqls'Int_
|Lbl'Hash'EINTR
|Lbl_andThenBool__BOOL
|Lbl_'ColnSlshEqls'K_
|Lbl_'EqlsSlshEqls'Int__INT'Hyph'COMMON
|Lbl'Hash'ENOLCK
|Lbl'Hash'ENOTCONN
|Lblproject'Coln'Set
|Lbl'Hash'EADDRINUSE
|Lbl'Hash'system
|LblisString
|Lbl'Hash'True
|Lblis'Hash'KVariable
|LblisList
|Lbl'Hash'freezer_'Plus'__MINI'Hyph'SML'Hyph'SYNTAX0_
|LblreplaceAll'LPar'_'Comm'_'Comm'_'RPar'_STRING
|Lbl'Hash'Or
|Lbl'Hash'Not
|Lblproject'Coln'Val
|LblfindString
|Lbl'_LT_'k'_GT_'
|LblabsInt
|Lbl'Hash'Equals
|LblisEnvCell
|Lbl_'_GT_'String__STRING
|Lbl'Hash'EOPNOTSUPP
|Lbl_'EqlsEqls'String__STRING
|LblisKConfigVar
|LblisVal
|LblisDecs
|Lbl'Hash'ESRCH
|LblisKResult
|LblisCell
|Lblvalues
|Lbl'Hash'Forall
|LblList'Coln'get
|Lbl'Hash'EMFILE
|Lbl'Hash'lstat'LPar'_'RPar'_K'Hyph'IO
|Lbl_'_GT__GT_'Int__INT'Hyph'COMMON
|Lblproject'Coln'KCell
|LblSetItem
|Lblproject'Coln'Map
|LblunsignedBytes
|Lbl'Stop'List
|Lbl'Hash'EDOM
|Lbl'Hash'remove
|Lbl'Stop'List'LBraQuot'_'SCln'__MINI'Hyph'SML'Hyph'SYNTAX'QuotRBra'
|Lbl'Hash'configuration_K'Hyph'REFLECTION
|LblrandInt
|LblisFloat
|Lbl'Hash'close'LPar'_'RPar'_K'Hyph'IO
|Lbl'Hash'mkstemp
|Lblproject'Coln'IOString
|Lblkeys_list'LPar'_'RPar'_MAP
|LblfreshId
|LblchrChar
|Lbl_orElseBool__BOOL
|Lblproject'Coln'Exp
|Lbl'Hash'EACCES
|LblList'Coln'range
|Lbl'Hash'EPFNOSUPPORT
|Lbl'Hash'Ceil
|Lblproject'Coln'KResult
|Lbl_'Plus'Int_
|LblisKCell
|Lbl'Hash'unknownIOError
|Lbl_orBool__BOOL
|LblinitEnvCell
|LblupdateMap
|Lbl'Hash'EALREADY
|LblInt2String
|Lblproject'Coln'Cell
|Lbl'Hash'ECONNRESET
|Lbl'Hash'ESOCKTNOSUPPORT
|Lbl'Hash'Implies
|Lbl'Hash'lock'LPar'_'Comm'_'RPar'_K'Hyph'IO
|Lbl_'EqlsSlshEqls'K_
|LblcountAllOccurrences'LPar'_'Comm'_'RPar'_STRING
|LblfillList
|Lbl'Hash'ENOTTY
|LblbitRangeInt
|Lbl_'_LT_'String__STRING
|Lbl'Hash'ENOSYS
|Lbl_List_
|Lbl'Hash'ThreadLocal
|Lbl'Hash'open'LPar'_'Comm'_'RPar'_K'Hyph'IO
|Lbl_'_LT_'Int__INT'Hyph'COMMON
|Lbl_'PipeHyph_GT_'_
|Lbl_'Hyph'Map__MAP
|Lbl_xorBool__BOOL
|Lbl_'Xor_Perc'Int___INT'Hyph'COMMON
|Lbl'Hash'EIO
|Lbl'Hash'EISDIR
|Lbl'Hash'ENOBUFS
|Lblproject'Coln'Bool
|Lbl'Hash'EMSGSIZE
|Lbl'Hash'tempFile'LPar'_'Comm'_'RPar'_K'Hyph'IO
|Lbl'Hash'sort
|Lbl_'EqlsEqls'K_
|Lbl_'Star'Int__INT'Hyph'COMMON
|Lblproject'Coln'List
|Lbl'Hash'open'LPar'_'RPar'_K'Hyph'IO
|Lbl'_LT_'env'_GT_'
|LblreplaceFirst'LPar'_'Comm'_'Comm'_'RPar'_STRING
|Lblproject'Coln'EnvCell
|LblisDec
|Lbl'Hash'putc'LPar'_'Comm'_'RPar'_K'Hyph'IO
|Lbl'Hash'projectInt
|LblisIOString
|Lbl'Stop'Map
|Lbl'Hash'EOVERFLOW
|Lbl'Hash'EHOSTDOWN
|Lbl'Hash'logToFile
|Lblproject'Coln'IOFile
|Lbl_'EqlsSlshEqls'String__STRING
|Lbl'Hash'read'LPar'_'Comm'_'RPar'_K'Hyph'IO
|Lbl'Hash'EHOSTUNREACH
|Lbl'Hash'ECONNREFUSED
|Lbl'Hash'EPERM
|Lbl_'_LT_Eqls'Int__INT'Hyph'COMMON
|Lbl'Hash'Exists
|LblbigEndianBytes
|LblId2String
|LblisInt
|Lbl'Hash'fresh
|LblMap'Coln'choice
|Lbl_Set_
|Lblproject'Coln'Stream
|Lbl_impliesBool__BOOL
|Lbl'Hash'getc'LPar'_'RPar'_K'Hyph'IO
|Lbl'Hash'ENOTEMPTY
|Lbl'_LT_'T'_GT_'
|Lbl'Hash'Thread
|Lbl'Hash'EINVAL
|Lbl_'Pipe'Int__INT'Hyph'COMMON
|Lbl'Hash'EWOULDBLOCK
|Lbl_'SCln'__MINI'Hyph'SML'Hyph'SYNTAX
|LblisBool
|LblminInt'LPar'_'Comm'_'RPar'_INT'Hyph'COMMON
|Lbl_'_LT_Eqls'String__STRING
|LblordChar
|LblrfindChar
|Lbl_'_LT__LT_'Int__INT'Hyph'COMMON
|Lbl_'_GT_'Int__INT'Hyph'COMMON
|Lblproject'Coln'Int
|Lbl'Hash'EOF
|Lbl_Map_
|LblisIOInt
|LbldirectionalityChar
|LblFloat2String
|Lbl'Hash'opendir'LPar'_'RPar'_K'Hyph'IO
|Lbl'Hash'EEXIST
|Lblproject'Coln'Decs
|LblinitKCell
|Lbl'Hash'EPIPE
|Lbl'Hash'ERANGE
|LblsizeList
|Lbl'Hash'EISCONN
|Lbl'Stop'Set
|Lblval_'Eqls'__MINI'Hyph'SML'Hyph'SYNTAX
|LblString2Id
|Lbl'Hash'ENETDOWN
|Lbl_'ColnEqls'K_
|Lblproject'Coln'IOError
|Lbl'Hash'noParse
|Lbl_'EqlsSlshEqls'Bool__BOOL
|Lbl'Hash'ENXIO
|LblremoveAll
|LblisTCell
|Lbl_andBool_
|Lbl_divInt__INT'Hyph'COMMON
|Lbl_xorInt__INT'Hyph'COMMON
|LbllengthString
|LblinitTCell
|LblsignedBytes
|LblmaxInt'LPar'_'Comm'_'RPar'_INT'Hyph'COMMON
|LblFloatFormat
|Lbl_'Plus'String__STRING
|Lbl'Hash'EINPROGRESS
|Lblproject'Coln'IOInt
|Lbl'Hash'ENOSPC
|LblrfindString
|Lbl'_LT_'T'_GT_Hyph'fragment
|Lbl'Hash'stat'LPar'_'RPar'_K'Hyph'IO
|Lbl_'Plus'__MINI'Hyph'SML'Hyph'SYNTAX
|LblupdateList
|Lbl'Hash'ENOTDIR
|LblSet'Coln'choice
|Lblproject'Coln'KCellOpt
|LblcategoryChar
|LblSet'Coln'difference
|Lbl'Hash'buffer
|Lbl'Hash'ENETUNREACH
|LblfreshInt
|Lbl'Hash'ESHUTDOWN
|Lbl'Hash'write'LPar'_'Comm'_'RPar'_K'Hyph'IO
|LblisKCellOpt
|Lbl'Hash'EPROTOTYPE
|Lbl'Hash'projectString
|Lbl_'And'Int__INT'Hyph'COMMON
|Lbl'Hash'EBUSY
|LblString2Float
|LblMap'Coln'lookupOrDefault
|Lbl'Hash'if_'Hash'then_'Hash'else_'Hash'fi_K'Hyph'EQUAL
|Lbl'Hash'stdout_K'Hyph'IO
|Lblproject'Coln'TCell
|LbllittleEndianBytes
|Lbl'Hash'EBADF
|Lbl'Hash'ECONNABORTED
|Lbllog2Int
|Lbl_'_GT_Eqls'Int__INT'Hyph'COMMON
|Lbl'Hash'stdin_K'Hyph'IO
|LblBase2String
|Lblproject'Coln'TCellFragment
|LblListItem
|Lblproject'Coln'Dec
|Lbl_'_GT_Eqls'String__STRING
|LblisStream
|Lbl_'Hyph'Int__INT'Hyph'COMMON
|Lbl'Hash'ENOTSOCK
|Lbl_'_LT_Eqls'Map__MAP
|Lbl'Hash'ENOENT
|LblnewUUID_STRING
|Lbl'Hash'ELOOP
|Lbl'Hash'AG
|Lblproject'Coln'Float
|LblsizeMap
|Lbl'Hash'E2BIG
|Lbl_dividesInt__INT'Hyph'COMMON
|LblisId
|LblsubstrString
|Lblproject'Coln'String
|Lblproject'Coln'Id
|Lblsize
|Lbl'Hash'freezer_'Plus'__MINI'Hyph'SML'Hyph'SYNTAX1_
|Lbl'Hash'EAFNOSUPPORT
|Lbl'Hash'ESPIPE
|Lbl'Hash'ETIMEDOUT
|Lbl_'Xor_'Int__INT'Hyph'COMMON
|Lbl'Hash'EROFS
|Lbl'Hash'systemResult'LPar'_'Comm'_'Comm'_'RPar'_K'Hyph'IO
|Lbl_inList_
|Lbl'Hash'EDESTADDRREQ
|LblisMap
|LblsrandInt
|Lbl'Tild'Int__INT'Hyph'COMMON
|LblisKItem
|Lbl'Hash'EPROTONOSUPPORT
|Lbl'Hash'ENAMETOOLONG
|LblList'Coln'set
|LblString2Base
|LblisTCellFragment
|Lblproject'Coln'EnvCellOpt
|Lblreplace'LPar'_'Comm'_'Comm'_'Comm'_'RPar'_STRING
|Lbl'Hash'ENODEV
|Lbl_'LSqB'_'_LT_Hyph'_'RSqB'_MAP
|Lbl'Hash'ECHILD
|Lbl'Hash'EFAULT
|Lbl'Hash'tell'LPar'_'RPar'_K'Hyph'IO
|Lblkeys
|Lbl_'Perc'Int__INT'Hyph'COMMON
|LblgetKLabel
|LblisEnvCellOpt
|Lbl'Hash'seekEnd'LPar'_'Comm'_'RPar'_K'Hyph'IO
|LblisExp
|LblisIOFile
|Lbl'Hash'And
|Lbl'Hash'EXDEV
|Lbl'Hash'EFBIG
let print_sort(c: sort) : string = match c with 
|SortEnvCellOpt -> "EnvCellOpt"
|SortBool -> "Bool"
|SortK -> "K"
|SortKResult -> "KResult"
|SortEnvCell -> "EnvCell"
|SortMap -> "Map"
|SortKCell -> "KCell"
|SortDec -> "Dec"
|SortBytes -> "Bytes"
|SortKItem -> "KItem"
|SortDecs -> "Decs"
|SortIOInt -> "IOInt"
|SortIOError -> "IOError"
|SortStringBuffer -> "StringBuffer"
|SortTCell -> "TCell"
|SortVal -> "Val"
|SortInt -> "Int"
|SortStream -> "Stream"
|SortIOString -> "IOString"
|Sort'Hash'KVariable -> "#KVariable"
|SortKConfigVar -> "KConfigVar"
|SortKCellOpt -> "KCellOpt"
|SortString -> "String"
|SortFloat -> "Float"
|SortTCellFragment -> "TCellFragment"
|SortSet -> "Set"
|SortIOFile -> "IOFile"
|SortId -> "Id"
|SortCell -> "Cell"
|SortList -> "List"
|SortExp -> "Exp"
let print_klabel(c: klabel) : string = match c with 
|Lbl'Hash'ENFILE -> "#ENFILE"
|Lbl'Hash'argv -> "#argv"
|LblnotBool_ -> "`notBool_`"
|Lbl'Hash'ENETRESET -> "#ENETRESET"
|LblMap'Coln'lookup -> "`Map:lookup`"
|Lbl'Hash'stderr_K'Hyph'IO -> "`#stderr_K-IO`"
|Lbl'Hash'ETOOMANYREFS -> "#ETOOMANYREFS"
|LblnoKCell -> "noKCell"
|Lbl'Hash'seek'LPar'_'Comm'_'RPar'_K'Hyph'IO -> "`#seek(_,_)_K-IO`"
|LblsignExtendBitRangeInt -> "signExtendBitRangeInt"
|Lbl_'EqlsEqls'Bool__BOOL -> "`_==Bool__BOOL`"
|LblisSet -> "isSet"
|Lbl_modInt__INT'Hyph'COMMON -> "`_modInt__INT-COMMON`"
|Lbl'Hash'getenv -> "#getenv"
|Lbl'Hash'ENOPROTOOPT -> "#ENOPROTOOPT"
|Lbl'Hash'parseKAST -> "#parseKAST"
|Lbl'Hash'freezerval_'Eqls'__MINI'Hyph'SML'Hyph'SYNTAX0_ -> "`#freezerval_=__MINI-SML-SYNTAX0_`"
|Lbl'Hash'EMLINK -> "#EMLINK"
|LblintersectSet -> "intersectSet"
|Lbl_in_keys'LPar'_'RPar'_MAP -> "`_in_keys(_)_MAP`"
|Lbl'Hash'EADDRNOTAVAIL -> "#EADDRNOTAVAIL"
|LblfindChar -> "findChar"
|LblSet'Coln'in -> "`Set:in`"
|LblisK -> "isK"
|LblString2Int -> "`String2Int`"
|Lbl'Hash'False -> "#False"
|Lbl_'Slsh'Int__INT'Hyph'COMMON -> "`_/Int__INT-COMMON`"
|Lbl_'_LT_Eqls'Set__SET -> "`_<=Set__SET`"
|LblnoEnvCell -> "noEnvCell"
|Lbl'Hash'EAGAIN -> "#EAGAIN"
|LblisIOError -> "isIOError"
|Lbl'Hash'ENOEXEC -> "#ENOEXEC"
|Lbl'Hash'Floor -> "#Floor"
|LblmakeList -> "makeList"
|Lbl'Hash'ENOMEM -> "#ENOMEM"
|Lbl_'LSqB'_'_LT_Hyph'undef'RSqB' -> "`_[_<-undef]`"
|Lbl'Hash'Bottom -> "#Bottom"
|Lbl'Hash'unlock'LPar'_'Comm'_'RPar'_K'Hyph'IO -> "`#unlock(_,_)_K-IO`"
|Lbl'Hash'EDEADLK -> "#EDEADLK"
|Lbl_'EqlsEqls'Int_ -> "`_==Int_`"
|Lbl'Hash'EINTR -> "#EINTR"
|Lbl_andThenBool__BOOL -> "`_andThenBool__BOOL`"
|Lbl_'ColnSlshEqls'K_ -> "`_:/=K_`"
|Lbl_'EqlsSlshEqls'Int__INT'Hyph'COMMON -> "`_=/=Int__INT-COMMON`"
|Lbl'Hash'ENOLCK -> "#ENOLCK"
|Lbl'Hash'ENOTCONN -> "#ENOTCONN"
|Lblproject'Coln'Set -> "`project:Set`"
|Lbl'Hash'EADDRINUSE -> "#EADDRINUSE"
|Lbl'Hash'system -> "#system"
|LblisString -> "isString"
|Lbl'Hash'True -> "#True"
|Lblis'Hash'KVariable -> "`is#KVariable`"
|LblisList -> "isList"
|Lbl'Hash'freezer_'Plus'__MINI'Hyph'SML'Hyph'SYNTAX0_ -> "`#freezer_+__MINI-SML-SYNTAX0_`"
|LblreplaceAll'LPar'_'Comm'_'Comm'_'RPar'_STRING -> "`replaceAll(_,_,_)_STRING`"
|Lbl'Hash'Or -> "#Or"
|Lbl'Hash'Not -> "#Not"
|Lblproject'Coln'Val -> "`project:Val`"
|LblfindString -> "findString"
|Lbl'_LT_'k'_GT_' -> "`<k>`"
|LblabsInt -> "absInt"
|Lbl'Hash'Equals -> "#Equals"
|LblisEnvCell -> "isEnvCell"
|Lbl_'_GT_'String__STRING -> "`_>String__STRING`"
|Lbl'Hash'EOPNOTSUPP -> "#EOPNOTSUPP"
|Lbl_'EqlsEqls'String__STRING -> "`_==String__STRING`"
|LblisKConfigVar -> "isKConfigVar"
|LblisVal -> "isVal"
|LblisDecs -> "isDecs"
|Lbl'Hash'ESRCH -> "#ESRCH"
|LblisKResult -> "isKResult"
|LblisCell -> "isCell"
|Lblvalues -> "values"
|Lbl'Hash'Forall -> "#Forall"
|LblList'Coln'get -> "`List:get`"
|Lbl'Hash'EMFILE -> "#EMFILE"
|Lbl'Hash'lstat'LPar'_'RPar'_K'Hyph'IO -> "`#lstat(_)_K-IO`"
|Lbl_'_GT__GT_'Int__INT'Hyph'COMMON -> "`_>>Int__INT-COMMON`"
|Lblproject'Coln'KCell -> "`project:KCell`"
|LblSetItem -> "`SetItem`"
|Lblproject'Coln'Map -> "`project:Map`"
|LblunsignedBytes -> "unsignedBytes"
|Lbl'Stop'List -> "`.List`"
|Lbl'Hash'EDOM -> "#EDOM"
|Lbl'Hash'remove -> "#remove"
|Lbl'Stop'List'LBraQuot'_'SCln'__MINI'Hyph'SML'Hyph'SYNTAX'QuotRBra' -> "`.List{\"_;__MINI-SML-SYNTAX\"}`"
|Lbl'Hash'configuration_K'Hyph'REFLECTION -> "`#configuration_K-REFLECTION`"
|LblrandInt -> "randInt"
|LblisFloat -> "isFloat"
|Lbl'Hash'close'LPar'_'RPar'_K'Hyph'IO -> "`#close(_)_K-IO`"
|Lbl'Hash'mkstemp -> "#mkstemp"
|Lblproject'Coln'IOString -> "`project:IOString`"
|Lblkeys_list'LPar'_'RPar'_MAP -> "`keys_list(_)_MAP`"
|LblfreshId -> "freshId"
|LblchrChar -> "chrChar"
|Lbl_orElseBool__BOOL -> "`_orElseBool__BOOL`"
|Lblproject'Coln'Exp -> "`project:Exp`"
|Lbl'Hash'EACCES -> "#EACCES"
|LblList'Coln'range -> "`List:range`"
|Lbl'Hash'EPFNOSUPPORT -> "#EPFNOSUPPORT"
|Lbl'Hash'Ceil -> "#Ceil"
|Lblproject'Coln'KResult -> "`project:KResult`"
|Lbl_'Plus'Int_ -> "`_+Int_`"
|LblisKCell -> "isKCell"
|Lbl'Hash'unknownIOError -> "#unknownIOError"
|Lbl_orBool__BOOL -> "`_orBool__BOOL`"
|LblinitEnvCell -> "initEnvCell"
|LblupdateMap -> "updateMap"
|Lbl'Hash'EALREADY -> "#EALREADY"
|LblInt2String -> "`Int2String`"
|Lblproject'Coln'Cell -> "`project:Cell`"
|Lbl'Hash'ECONNRESET -> "#ECONNRESET"
|Lbl'Hash'ESOCKTNOSUPPORT -> "#ESOCKTNOSUPPORT"
|Lbl'Hash'Implies -> "#Implies"
|Lbl'Hash'lock'LPar'_'Comm'_'RPar'_K'Hyph'IO -> "`#lock(_,_)_K-IO`"
|Lbl_'EqlsSlshEqls'K_ -> "`_=/=K_`"
|LblcountAllOccurrences'LPar'_'Comm'_'RPar'_STRING -> "`countAllOccurrences(_,_)_STRING`"
|LblfillList -> "fillList"
|Lbl'Hash'ENOTTY -> "#ENOTTY"
|LblbitRangeInt -> "bitRangeInt"
|Lbl_'_LT_'String__STRING -> "`_<String__STRING`"
|Lbl'Hash'ENOSYS -> "#ENOSYS"
|Lbl_List_ -> "`_List_`"
|Lbl'Hash'ThreadLocal -> "#ThreadLocal"
|Lbl'Hash'open'LPar'_'Comm'_'RPar'_K'Hyph'IO -> "`#open(_,_)_K-IO`"
|Lbl_'_LT_'Int__INT'Hyph'COMMON -> "`_<Int__INT-COMMON`"
|Lbl_'PipeHyph_GT_'_ -> "`_|->_`"
|Lbl_'Hyph'Map__MAP -> "`_-Map__MAP`"
|Lbl_xorBool__BOOL -> "`_xorBool__BOOL`"
|Lbl_'Xor_Perc'Int___INT'Hyph'COMMON -> "`_^%Int___INT-COMMON`"
|Lbl'Hash'EIO -> "#EIO"
|Lbl'Hash'EISDIR -> "#EISDIR"
|Lbl'Hash'ENOBUFS -> "#ENOBUFS"
|Lblproject'Coln'Bool -> "`project:Bool`"
|Lbl'Hash'EMSGSIZE -> "#EMSGSIZE"
|Lbl'Hash'tempFile'LPar'_'Comm'_'RPar'_K'Hyph'IO -> "`#tempFile(_,_)_K-IO`"
|Lbl'Hash'sort -> "#sort"
|Lbl_'EqlsEqls'K_ -> "`_==K_`"
|Lbl_'Star'Int__INT'Hyph'COMMON -> "`_*Int__INT-COMMON`"
|Lblproject'Coln'List -> "`project:List`"
|Lbl'Hash'open'LPar'_'RPar'_K'Hyph'IO -> "`#open(_)_K-IO`"
|Lbl'_LT_'env'_GT_' -> "`<env>`"
|LblreplaceFirst'LPar'_'Comm'_'Comm'_'RPar'_STRING -> "`replaceFirst(_,_,_)_STRING`"
|Lblproject'Coln'EnvCell -> "`project:EnvCell`"
|LblisDec -> "isDec"
|Lbl'Hash'putc'LPar'_'Comm'_'RPar'_K'Hyph'IO -> "`#putc(_,_)_K-IO`"
|Lbl'Hash'projectInt -> "#projectInt"
|LblisIOString -> "isIOString"
|Lbl'Stop'Map -> "`.Map`"
|Lbl'Hash'EOVERFLOW -> "#EOVERFLOW"
|Lbl'Hash'EHOSTDOWN -> "#EHOSTDOWN"
|Lbl'Hash'logToFile -> "#logToFile"
|Lblproject'Coln'IOFile -> "`project:IOFile`"
|Lbl_'EqlsSlshEqls'String__STRING -> "`_=/=String__STRING`"
|Lbl'Hash'read'LPar'_'Comm'_'RPar'_K'Hyph'IO -> "`#read(_,_)_K-IO`"
|Lbl'Hash'EHOSTUNREACH -> "#EHOSTUNREACH"
|Lbl'Hash'ECONNREFUSED -> "#ECONNREFUSED"
|Lbl'Hash'EPERM -> "#EPERM"
|Lbl_'_LT_Eqls'Int__INT'Hyph'COMMON -> "`_<=Int__INT-COMMON`"
|Lbl'Hash'Exists -> "#Exists"
|LblbigEndianBytes -> "bigEndianBytes"
|LblId2String -> "`Id2String`"
|LblisInt -> "isInt"
|Lbl'Hash'fresh -> "#fresh"
|LblMap'Coln'choice -> "`Map:choice`"
|Lbl_Set_ -> "`_Set_`"
|Lblproject'Coln'Stream -> "`project:Stream`"
|Lbl_impliesBool__BOOL -> "`_impliesBool__BOOL`"
|Lbl'Hash'getc'LPar'_'RPar'_K'Hyph'IO -> "`#getc(_)_K-IO`"
|Lbl'Hash'ENOTEMPTY -> "#ENOTEMPTY"
|Lbl'_LT_'T'_GT_' -> "`<T>`"
|Lbl'Hash'Thread -> "#Thread"
|Lbl'Hash'EINVAL -> "#EINVAL"
|Lbl_'Pipe'Int__INT'Hyph'COMMON -> "`_|Int__INT-COMMON`"
|Lbl'Hash'EWOULDBLOCK -> "#EWOULDBLOCK"
|Lbl_'SCln'__MINI'Hyph'SML'Hyph'SYNTAX -> "`_;__MINI-SML-SYNTAX`"
|LblisBool -> "isBool"
|LblminInt'LPar'_'Comm'_'RPar'_INT'Hyph'COMMON -> "`minInt(_,_)_INT-COMMON`"
|Lbl_'_LT_Eqls'String__STRING -> "`_<=String__STRING`"
|LblordChar -> "ordChar"
|LblrfindChar -> "rfindChar"
|Lbl_'_LT__LT_'Int__INT'Hyph'COMMON -> "`_<<Int__INT-COMMON`"
|Lbl_'_GT_'Int__INT'Hyph'COMMON -> "`_>Int__INT-COMMON`"
|Lblproject'Coln'Int -> "`project:Int`"
|Lbl'Hash'EOF -> "#EOF"
|Lbl_Map_ -> "`_Map_`"
|LblisIOInt -> "isIOInt"
|LbldirectionalityChar -> "directionalityChar"
|LblFloat2String -> "`Float2String`"
|Lbl'Hash'opendir'LPar'_'RPar'_K'Hyph'IO -> "`#opendir(_)_K-IO`"
|Lbl'Hash'EEXIST -> "#EEXIST"
|Lblproject'Coln'Decs -> "`project:Decs`"
|LblinitKCell -> "initKCell"
|Lbl'Hash'EPIPE -> "#EPIPE"
|Lbl'Hash'ERANGE -> "#ERANGE"
|LblsizeList -> "sizeList"
|Lbl'Hash'EISCONN -> "#EISCONN"
|Lbl'Stop'Set -> "`.Set`"
|Lblval_'Eqls'__MINI'Hyph'SML'Hyph'SYNTAX -> "`val_=__MINI-SML-SYNTAX`"
|LblString2Id -> "`String2Id`"
|Lbl'Hash'ENETDOWN -> "#ENETDOWN"
|Lbl_'ColnEqls'K_ -> "`_:=K_`"
|Lblproject'Coln'IOError -> "`project:IOError`"
|Lbl'Hash'noParse -> "#noParse"
|Lbl_'EqlsSlshEqls'Bool__BOOL -> "`_=/=Bool__BOOL`"
|Lbl'Hash'ENXIO -> "#ENXIO"
|LblremoveAll -> "removeAll"
|LblisTCell -> "isTCell"
|Lbl_andBool_ -> "`_andBool_`"
|Lbl_divInt__INT'Hyph'COMMON -> "`_divInt__INT-COMMON`"
|Lbl_xorInt__INT'Hyph'COMMON -> "`_xorInt__INT-COMMON`"
|LbllengthString -> "lengthString"
|LblinitTCell -> "initTCell"
|LblsignedBytes -> "signedBytes"
|LblmaxInt'LPar'_'Comm'_'RPar'_INT'Hyph'COMMON -> "`maxInt(_,_)_INT-COMMON`"
|LblFloatFormat -> "`FloatFormat`"
|Lbl_'Plus'String__STRING -> "`_+String__STRING`"
|Lbl'Hash'EINPROGRESS -> "#EINPROGRESS"
|Lblproject'Coln'IOInt -> "`project:IOInt`"
|Lbl'Hash'ENOSPC -> "#ENOSPC"
|LblrfindString -> "rfindString"
|Lbl'_LT_'T'_GT_Hyph'fragment -> "`<T>-fragment`"
|Lbl'Hash'stat'LPar'_'RPar'_K'Hyph'IO -> "`#stat(_)_K-IO`"
|Lbl_'Plus'__MINI'Hyph'SML'Hyph'SYNTAX -> "`_+__MINI-SML-SYNTAX`"
|LblupdateList -> "updateList"
|Lbl'Hash'ENOTDIR -> "#ENOTDIR"
|LblSet'Coln'choice -> "`Set:choice`"
|Lblproject'Coln'KCellOpt -> "`project:KCellOpt`"
|LblcategoryChar -> "categoryChar"
|LblSet'Coln'difference -> "`Set:difference`"
|Lbl'Hash'buffer -> "#buffer"
|Lbl'Hash'ENETUNREACH -> "#ENETUNREACH"
|LblfreshInt -> "freshInt"
|Lbl'Hash'ESHUTDOWN -> "#ESHUTDOWN"
|Lbl'Hash'write'LPar'_'Comm'_'RPar'_K'Hyph'IO -> "`#write(_,_)_K-IO`"
|LblisKCellOpt -> "isKCellOpt"
|Lbl'Hash'EPROTOTYPE -> "#EPROTOTYPE"
|Lbl'Hash'projectString -> "#projectString"
|Lbl_'And'Int__INT'Hyph'COMMON -> "`_&Int__INT-COMMON`"
|Lbl'Hash'EBUSY -> "#EBUSY"
|LblString2Float -> "`String2Float`"
|LblMap'Coln'lookupOrDefault -> "`Map:lookupOrDefault`"
|Lbl'Hash'if_'Hash'then_'Hash'else_'Hash'fi_K'Hyph'EQUAL -> "`#if_#then_#else_#fi_K-EQUAL`"
|Lbl'Hash'stdout_K'Hyph'IO -> "`#stdout_K-IO`"
|Lblproject'Coln'TCell -> "`project:TCell`"
|LbllittleEndianBytes -> "littleEndianBytes"
|Lbl'Hash'EBADF -> "#EBADF"
|Lbl'Hash'ECONNABORTED -> "#ECONNABORTED"
|Lbllog2Int -> "log2Int"
|Lbl_'_GT_Eqls'Int__INT'Hyph'COMMON -> "`_>=Int__INT-COMMON`"
|Lbl'Hash'stdin_K'Hyph'IO -> "`#stdin_K-IO`"
|LblBase2String -> "`Base2String`"
|Lblproject'Coln'TCellFragment -> "`project:TCellFragment`"
|LblListItem -> "`ListItem`"
|Lblproject'Coln'Dec -> "`project:Dec`"
|Lbl_'_GT_Eqls'String__STRING -> "`_>=String__STRING`"
|LblisStream -> "isStream"
|Lbl_'Hyph'Int__INT'Hyph'COMMON -> "`_-Int__INT-COMMON`"
|Lbl'Hash'ENOTSOCK -> "#ENOTSOCK"
|Lbl_'_LT_Eqls'Map__MAP -> "`_<=Map__MAP`"
|Lbl'Hash'ENOENT -> "#ENOENT"
|LblnewUUID_STRING -> "`newUUID_STRING`"
|Lbl'Hash'ELOOP -> "#ELOOP"
|Lbl'Hash'AG -> "#AG"
|Lblproject'Coln'Float -> "`project:Float`"
|LblsizeMap -> "sizeMap"
|Lbl'Hash'E2BIG -> "#E2BIG"
|Lbl_dividesInt__INT'Hyph'COMMON -> "`_dividesInt__INT-COMMON`"
|LblisId -> "isId"
|LblsubstrString -> "substrString"
|Lblproject'Coln'String -> "`project:String`"
|Lblproject'Coln'Id -> "`project:Id`"
|Lblsize -> "size"
|Lbl'Hash'freezer_'Plus'__MINI'Hyph'SML'Hyph'SYNTAX1_ -> "`#freezer_+__MINI-SML-SYNTAX1_`"
|Lbl'Hash'EAFNOSUPPORT -> "#EAFNOSUPPORT"
|Lbl'Hash'ESPIPE -> "#ESPIPE"
|Lbl'Hash'ETIMEDOUT -> "#ETIMEDOUT"
|Lbl_'Xor_'Int__INT'Hyph'COMMON -> "`_^Int__INT-COMMON`"
|Lbl'Hash'EROFS -> "#EROFS"
|Lbl'Hash'systemResult'LPar'_'Comm'_'Comm'_'RPar'_K'Hyph'IO -> "`#systemResult(_,_,_)_K-IO`"
|Lbl_inList_ -> "`_inList_`"
|Lbl'Hash'EDESTADDRREQ -> "#EDESTADDRREQ"
|LblisMap -> "isMap"
|LblsrandInt -> "srandInt"
|Lbl'Tild'Int__INT'Hyph'COMMON -> "`~Int__INT-COMMON`"
|LblisKItem -> "isKItem"
|Lbl'Hash'EPROTONOSUPPORT -> "#EPROTONOSUPPORT"
|Lbl'Hash'ENAMETOOLONG -> "#ENAMETOOLONG"
|LblList'Coln'set -> "`List:set`"
|LblString2Base -> "`String2Base`"
|LblisTCellFragment -> "isTCellFragment"
|Lblproject'Coln'EnvCellOpt -> "`project:EnvCellOpt`"
|Lblreplace'LPar'_'Comm'_'Comm'_'Comm'_'RPar'_STRING -> "`replace(_,_,_,_)_STRING`"
|Lbl'Hash'ENODEV -> "#ENODEV"
|Lbl_'LSqB'_'_LT_Hyph'_'RSqB'_MAP -> "`_[_<-_]_MAP`"
|Lbl'Hash'ECHILD -> "#ECHILD"
|Lbl'Hash'EFAULT -> "#EFAULT"
|Lbl'Hash'tell'LPar'_'RPar'_K'Hyph'IO -> "`#tell(_)_K-IO`"
|Lblkeys -> "keys"
|Lbl_'Perc'Int__INT'Hyph'COMMON -> "`_%Int__INT-COMMON`"
|LblgetKLabel -> "getKLabel"
|LblisEnvCellOpt -> "isEnvCellOpt"
|Lbl'Hash'seekEnd'LPar'_'Comm'_'RPar'_K'Hyph'IO -> "`#seekEnd(_,_)_K-IO`"
|LblisExp -> "isExp"
|LblisIOFile -> "isIOFile"
|Lbl'Hash'And -> "#And"
|Lbl'Hash'EXDEV -> "#EXDEV"
|Lbl'Hash'EFBIG -> "#EFBIG"
let print_klabel_string(c: klabel) : string = match c with 
|Lbl'Hash'ENFILE -> "#ENFILE"
|Lbl'Hash'argv -> "#argv"
|LblnotBool_ -> "notBool_"
|Lbl'Hash'ENETRESET -> "#ENETRESET"
|LblMap'Coln'lookup -> "Map:lookup"
|Lbl'Hash'stderr_K'Hyph'IO -> "#stderr_K-IO"
|Lbl'Hash'ETOOMANYREFS -> "#ETOOMANYREFS"
|LblnoKCell -> "noKCell"
|Lbl'Hash'seek'LPar'_'Comm'_'RPar'_K'Hyph'IO -> "#seek(_,_)_K-IO"
|LblsignExtendBitRangeInt -> "signExtendBitRangeInt"
|Lbl_'EqlsEqls'Bool__BOOL -> "_==Bool__BOOL"
|LblisSet -> "isSet"
|Lbl_modInt__INT'Hyph'COMMON -> "_modInt__INT-COMMON"
|Lbl'Hash'getenv -> "#getenv"
|Lbl'Hash'ENOPROTOOPT -> "#ENOPROTOOPT"
|Lbl'Hash'parseKAST -> "#parseKAST"
|Lbl'Hash'freezerval_'Eqls'__MINI'Hyph'SML'Hyph'SYNTAX0_ -> "#freezerval_=__MINI-SML-SYNTAX0_"
|Lbl'Hash'EMLINK -> "#EMLINK"
|LblintersectSet -> "intersectSet"
|Lbl_in_keys'LPar'_'RPar'_MAP -> "_in_keys(_)_MAP"
|Lbl'Hash'EADDRNOTAVAIL -> "#EADDRNOTAVAIL"
|LblfindChar -> "findChar"
|LblSet'Coln'in -> "Set:in"
|LblisK -> "isK"
|LblString2Int -> "String2Int"
|Lbl'Hash'False -> "#False"
|Lbl_'Slsh'Int__INT'Hyph'COMMON -> "_/Int__INT-COMMON"
|Lbl_'_LT_Eqls'Set__SET -> "_<=Set__SET"
|LblnoEnvCell -> "noEnvCell"
|Lbl'Hash'EAGAIN -> "#EAGAIN"
|LblisIOError -> "isIOError"
|Lbl'Hash'ENOEXEC -> "#ENOEXEC"
|Lbl'Hash'Floor -> "#Floor"
|LblmakeList -> "makeList"
|Lbl'Hash'ENOMEM -> "#ENOMEM"
|Lbl_'LSqB'_'_LT_Hyph'undef'RSqB' -> "_[_<-undef]"
|Lbl'Hash'Bottom -> "#Bottom"
|Lbl'Hash'unlock'LPar'_'Comm'_'RPar'_K'Hyph'IO -> "#unlock(_,_)_K-IO"
|Lbl'Hash'EDEADLK -> "#EDEADLK"
|Lbl_'EqlsEqls'Int_ -> "_==Int_"
|Lbl'Hash'EINTR -> "#EINTR"
|Lbl_andThenBool__BOOL -> "_andThenBool__BOOL"
|Lbl_'ColnSlshEqls'K_ -> "_:/=K_"
|Lbl_'EqlsSlshEqls'Int__INT'Hyph'COMMON -> "_=/=Int__INT-COMMON"
|Lbl'Hash'ENOLCK -> "#ENOLCK"
|Lbl'Hash'ENOTCONN -> "#ENOTCONN"
|Lblproject'Coln'Set -> "project:Set"
|Lbl'Hash'EADDRINUSE -> "#EADDRINUSE"
|Lbl'Hash'system -> "#system"
|LblisString -> "isString"
|Lbl'Hash'True -> "#True"
|Lblis'Hash'KVariable -> "is#KVariable"
|LblisList -> "isList"
|Lbl'Hash'freezer_'Plus'__MINI'Hyph'SML'Hyph'SYNTAX0_ -> "#freezer_+__MINI-SML-SYNTAX0_"
|LblreplaceAll'LPar'_'Comm'_'Comm'_'RPar'_STRING -> "replaceAll(_,_,_)_STRING"
|Lbl'Hash'Or -> "#Or"
|Lbl'Hash'Not -> "#Not"
|Lblproject'Coln'Val -> "project:Val"
|LblfindString -> "findString"
|Lbl'_LT_'k'_GT_' -> "<k>"
|LblabsInt -> "absInt"
|Lbl'Hash'Equals -> "#Equals"
|LblisEnvCell -> "isEnvCell"
|Lbl_'_GT_'String__STRING -> "_>String__STRING"
|Lbl'Hash'EOPNOTSUPP -> "#EOPNOTSUPP"
|Lbl_'EqlsEqls'String__STRING -> "_==String__STRING"
|LblisKConfigVar -> "isKConfigVar"
|LblisVal -> "isVal"
|LblisDecs -> "isDecs"
|Lbl'Hash'ESRCH -> "#ESRCH"
|LblisKResult -> "isKResult"
|LblisCell -> "isCell"
|Lblvalues -> "values"
|Lbl'Hash'Forall -> "#Forall"
|LblList'Coln'get -> "List:get"
|Lbl'Hash'EMFILE -> "#EMFILE"
|Lbl'Hash'lstat'LPar'_'RPar'_K'Hyph'IO -> "#lstat(_)_K-IO"
|Lbl_'_GT__GT_'Int__INT'Hyph'COMMON -> "_>>Int__INT-COMMON"
|Lblproject'Coln'KCell -> "project:KCell"
|LblSetItem -> "SetItem"
|Lblproject'Coln'Map -> "project:Map"
|LblunsignedBytes -> "unsignedBytes"
|Lbl'Stop'List -> ".List"
|Lbl'Hash'EDOM -> "#EDOM"
|Lbl'Hash'remove -> "#remove"
|Lbl'Stop'List'LBraQuot'_'SCln'__MINI'Hyph'SML'Hyph'SYNTAX'QuotRBra' -> ".List{\"_;__MINI-SML-SYNTAX\"}"
|Lbl'Hash'configuration_K'Hyph'REFLECTION -> "#configuration_K-REFLECTION"
|LblrandInt -> "randInt"
|LblisFloat -> "isFloat"
|Lbl'Hash'close'LPar'_'RPar'_K'Hyph'IO -> "#close(_)_K-IO"
|Lbl'Hash'mkstemp -> "#mkstemp"
|Lblproject'Coln'IOString -> "project:IOString"
|Lblkeys_list'LPar'_'RPar'_MAP -> "keys_list(_)_MAP"
|LblfreshId -> "freshId"
|LblchrChar -> "chrChar"
|Lbl_orElseBool__BOOL -> "_orElseBool__BOOL"
|Lblproject'Coln'Exp -> "project:Exp"
|Lbl'Hash'EACCES -> "#EACCES"
|LblList'Coln'range -> "List:range"
|Lbl'Hash'EPFNOSUPPORT -> "#EPFNOSUPPORT"
|Lbl'Hash'Ceil -> "#Ceil"
|Lblproject'Coln'KResult -> "project:KResult"
|Lbl_'Plus'Int_ -> "_+Int_"
|LblisKCell -> "isKCell"
|Lbl'Hash'unknownIOError -> "#unknownIOError"
|Lbl_orBool__BOOL -> "_orBool__BOOL"
|LblinitEnvCell -> "initEnvCell"
|LblupdateMap -> "updateMap"
|Lbl'Hash'EALREADY -> "#EALREADY"
|LblInt2String -> "Int2String"
|Lblproject'Coln'Cell -> "project:Cell"
|Lbl'Hash'ECONNRESET -> "#ECONNRESET"
|Lbl'Hash'ESOCKTNOSUPPORT -> "#ESOCKTNOSUPPORT"
|Lbl'Hash'Implies -> "#Implies"
|Lbl'Hash'lock'LPar'_'Comm'_'RPar'_K'Hyph'IO -> "#lock(_,_)_K-IO"
|Lbl_'EqlsSlshEqls'K_ -> "_=/=K_"
|LblcountAllOccurrences'LPar'_'Comm'_'RPar'_STRING -> "countAllOccurrences(_,_)_STRING"
|LblfillList -> "fillList"
|Lbl'Hash'ENOTTY -> "#ENOTTY"
|LblbitRangeInt -> "bitRangeInt"
|Lbl_'_LT_'String__STRING -> "_<String__STRING"
|Lbl'Hash'ENOSYS -> "#ENOSYS"
|Lbl_List_ -> "_List_"
|Lbl'Hash'ThreadLocal -> "#ThreadLocal"
|Lbl'Hash'open'LPar'_'Comm'_'RPar'_K'Hyph'IO -> "#open(_,_)_K-IO"
|Lbl_'_LT_'Int__INT'Hyph'COMMON -> "_<Int__INT-COMMON"
|Lbl_'PipeHyph_GT_'_ -> "_|->_"
|Lbl_'Hyph'Map__MAP -> "_-Map__MAP"
|Lbl_xorBool__BOOL -> "_xorBool__BOOL"
|Lbl_'Xor_Perc'Int___INT'Hyph'COMMON -> "_^%Int___INT-COMMON"
|Lbl'Hash'EIO -> "#EIO"
|Lbl'Hash'EISDIR -> "#EISDIR"
|Lbl'Hash'ENOBUFS -> "#ENOBUFS"
|Lblproject'Coln'Bool -> "project:Bool"
|Lbl'Hash'EMSGSIZE -> "#EMSGSIZE"
|Lbl'Hash'tempFile'LPar'_'Comm'_'RPar'_K'Hyph'IO -> "#tempFile(_,_)_K-IO"
|Lbl'Hash'sort -> "#sort"
|Lbl_'EqlsEqls'K_ -> "_==K_"
|Lbl_'Star'Int__INT'Hyph'COMMON -> "_*Int__INT-COMMON"
|Lblproject'Coln'List -> "project:List"
|Lbl'Hash'open'LPar'_'RPar'_K'Hyph'IO -> "#open(_)_K-IO"
|Lbl'_LT_'env'_GT_' -> "<env>"
|LblreplaceFirst'LPar'_'Comm'_'Comm'_'RPar'_STRING -> "replaceFirst(_,_,_)_STRING"
|Lblproject'Coln'EnvCell -> "project:EnvCell"
|LblisDec -> "isDec"
|Lbl'Hash'putc'LPar'_'Comm'_'RPar'_K'Hyph'IO -> "#putc(_,_)_K-IO"
|Lbl'Hash'projectInt -> "#projectInt"
|LblisIOString -> "isIOString"
|Lbl'Stop'Map -> ".Map"
|Lbl'Hash'EOVERFLOW -> "#EOVERFLOW"
|Lbl'Hash'EHOSTDOWN -> "#EHOSTDOWN"
|Lbl'Hash'logToFile -> "#logToFile"
|Lblproject'Coln'IOFile -> "project:IOFile"
|Lbl_'EqlsSlshEqls'String__STRING -> "_=/=String__STRING"
|Lbl'Hash'read'LPar'_'Comm'_'RPar'_K'Hyph'IO -> "#read(_,_)_K-IO"
|Lbl'Hash'EHOSTUNREACH -> "#EHOSTUNREACH"
|Lbl'Hash'ECONNREFUSED -> "#ECONNREFUSED"
|Lbl'Hash'EPERM -> "#EPERM"
|Lbl_'_LT_Eqls'Int__INT'Hyph'COMMON -> "_<=Int__INT-COMMON"
|Lbl'Hash'Exists -> "#Exists"
|LblbigEndianBytes -> "bigEndianBytes"
|LblId2String -> "Id2String"
|LblisInt -> "isInt"
|Lbl'Hash'fresh -> "#fresh"
|LblMap'Coln'choice -> "Map:choice"
|Lbl_Set_ -> "_Set_"
|Lblproject'Coln'Stream -> "project:Stream"
|Lbl_impliesBool__BOOL -> "_impliesBool__BOOL"
|Lbl'Hash'getc'LPar'_'RPar'_K'Hyph'IO -> "#getc(_)_K-IO"
|Lbl'Hash'ENOTEMPTY -> "#ENOTEMPTY"
|Lbl'_LT_'T'_GT_' -> "<T>"
|Lbl'Hash'Thread -> "#Thread"
|Lbl'Hash'EINVAL -> "#EINVAL"
|Lbl_'Pipe'Int__INT'Hyph'COMMON -> "_|Int__INT-COMMON"
|Lbl'Hash'EWOULDBLOCK -> "#EWOULDBLOCK"
|Lbl_'SCln'__MINI'Hyph'SML'Hyph'SYNTAX -> "_;__MINI-SML-SYNTAX"
|LblisBool -> "isBool"
|LblminInt'LPar'_'Comm'_'RPar'_INT'Hyph'COMMON -> "minInt(_,_)_INT-COMMON"
|Lbl_'_LT_Eqls'String__STRING -> "_<=String__STRING"
|LblordChar -> "ordChar"
|LblrfindChar -> "rfindChar"
|Lbl_'_LT__LT_'Int__INT'Hyph'COMMON -> "_<<Int__INT-COMMON"
|Lbl_'_GT_'Int__INT'Hyph'COMMON -> "_>Int__INT-COMMON"
|Lblproject'Coln'Int -> "project:Int"
|Lbl'Hash'EOF -> "#EOF"
|Lbl_Map_ -> "_Map_"
|LblisIOInt -> "isIOInt"
|LbldirectionalityChar -> "directionalityChar"
|LblFloat2String -> "Float2String"
|Lbl'Hash'opendir'LPar'_'RPar'_K'Hyph'IO -> "#opendir(_)_K-IO"
|Lbl'Hash'EEXIST -> "#EEXIST"
|Lblproject'Coln'Decs -> "project:Decs"
|LblinitKCell -> "initKCell"
|Lbl'Hash'EPIPE -> "#EPIPE"
|Lbl'Hash'ERANGE -> "#ERANGE"
|LblsizeList -> "sizeList"
|Lbl'Hash'EISCONN -> "#EISCONN"
|Lbl'Stop'Set -> ".Set"
|Lblval_'Eqls'__MINI'Hyph'SML'Hyph'SYNTAX -> "val_=__MINI-SML-SYNTAX"
|LblString2Id -> "String2Id"
|Lbl'Hash'ENETDOWN -> "#ENETDOWN"
|Lbl_'ColnEqls'K_ -> "_:=K_"
|Lblproject'Coln'IOError -> "project:IOError"
|Lbl'Hash'noParse -> "#noParse"
|Lbl_'EqlsSlshEqls'Bool__BOOL -> "_=/=Bool__BOOL"
|Lbl'Hash'ENXIO -> "#ENXIO"
|LblremoveAll -> "removeAll"
|LblisTCell -> "isTCell"
|Lbl_andBool_ -> "_andBool_"
|Lbl_divInt__INT'Hyph'COMMON -> "_divInt__INT-COMMON"
|Lbl_xorInt__INT'Hyph'COMMON -> "_xorInt__INT-COMMON"
|LbllengthString -> "lengthString"
|LblinitTCell -> "initTCell"
|LblsignedBytes -> "signedBytes"
|LblmaxInt'LPar'_'Comm'_'RPar'_INT'Hyph'COMMON -> "maxInt(_,_)_INT-COMMON"
|LblFloatFormat -> "FloatFormat"
|Lbl_'Plus'String__STRING -> "_+String__STRING"
|Lbl'Hash'EINPROGRESS -> "#EINPROGRESS"
|Lblproject'Coln'IOInt -> "project:IOInt"
|Lbl'Hash'ENOSPC -> "#ENOSPC"
|LblrfindString -> "rfindString"
|Lbl'_LT_'T'_GT_Hyph'fragment -> "<T>-fragment"
|Lbl'Hash'stat'LPar'_'RPar'_K'Hyph'IO -> "#stat(_)_K-IO"
|Lbl_'Plus'__MINI'Hyph'SML'Hyph'SYNTAX -> "_+__MINI-SML-SYNTAX"
|LblupdateList -> "updateList"
|Lbl'Hash'ENOTDIR -> "#ENOTDIR"
|LblSet'Coln'choice -> "Set:choice"
|Lblproject'Coln'KCellOpt -> "project:KCellOpt"
|LblcategoryChar -> "categoryChar"
|LblSet'Coln'difference -> "Set:difference"
|Lbl'Hash'buffer -> "#buffer"
|Lbl'Hash'ENETUNREACH -> "#ENETUNREACH"
|LblfreshInt -> "freshInt"
|Lbl'Hash'ESHUTDOWN -> "#ESHUTDOWN"
|Lbl'Hash'write'LPar'_'Comm'_'RPar'_K'Hyph'IO -> "#write(_,_)_K-IO"
|LblisKCellOpt -> "isKCellOpt"
|Lbl'Hash'EPROTOTYPE -> "#EPROTOTYPE"
|Lbl'Hash'projectString -> "#projectString"
|Lbl_'And'Int__INT'Hyph'COMMON -> "_&Int__INT-COMMON"
|Lbl'Hash'EBUSY -> "#EBUSY"
|LblString2Float -> "String2Float"
|LblMap'Coln'lookupOrDefault -> "Map:lookupOrDefault"
|Lbl'Hash'if_'Hash'then_'Hash'else_'Hash'fi_K'Hyph'EQUAL -> "#if_#then_#else_#fi_K-EQUAL"
|Lbl'Hash'stdout_K'Hyph'IO -> "#stdout_K-IO"
|Lblproject'Coln'TCell -> "project:TCell"
|LbllittleEndianBytes -> "littleEndianBytes"
|Lbl'Hash'EBADF -> "#EBADF"
|Lbl'Hash'ECONNABORTED -> "#ECONNABORTED"
|Lbllog2Int -> "log2Int"
|Lbl_'_GT_Eqls'Int__INT'Hyph'COMMON -> "_>=Int__INT-COMMON"
|Lbl'Hash'stdin_K'Hyph'IO -> "#stdin_K-IO"
|LblBase2String -> "Base2String"
|Lblproject'Coln'TCellFragment -> "project:TCellFragment"
|LblListItem -> "ListItem"
|Lblproject'Coln'Dec -> "project:Dec"
|Lbl_'_GT_Eqls'String__STRING -> "_>=String__STRING"
|LblisStream -> "isStream"
|Lbl_'Hyph'Int__INT'Hyph'COMMON -> "_-Int__INT-COMMON"
|Lbl'Hash'ENOTSOCK -> "#ENOTSOCK"
|Lbl_'_LT_Eqls'Map__MAP -> "_<=Map__MAP"
|Lbl'Hash'ENOENT -> "#ENOENT"
|LblnewUUID_STRING -> "newUUID_STRING"
|Lbl'Hash'ELOOP -> "#ELOOP"
|Lbl'Hash'AG -> "#AG"
|Lblproject'Coln'Float -> "project:Float"
|LblsizeMap -> "sizeMap"
|Lbl'Hash'E2BIG -> "#E2BIG"
|Lbl_dividesInt__INT'Hyph'COMMON -> "_dividesInt__INT-COMMON"
|LblisId -> "isId"
|LblsubstrString -> "substrString"
|Lblproject'Coln'String -> "project:String"
|Lblproject'Coln'Id -> "project:Id"
|Lblsize -> "size"
|Lbl'Hash'freezer_'Plus'__MINI'Hyph'SML'Hyph'SYNTAX1_ -> "#freezer_+__MINI-SML-SYNTAX1_"
|Lbl'Hash'EAFNOSUPPORT -> "#EAFNOSUPPORT"
|Lbl'Hash'ESPIPE -> "#ESPIPE"
|Lbl'Hash'ETIMEDOUT -> "#ETIMEDOUT"
|Lbl_'Xor_'Int__INT'Hyph'COMMON -> "_^Int__INT-COMMON"
|Lbl'Hash'EROFS -> "#EROFS"
|Lbl'Hash'systemResult'LPar'_'Comm'_'Comm'_'RPar'_K'Hyph'IO -> "#systemResult(_,_,_)_K-IO"
|Lbl_inList_ -> "_inList_"
|Lbl'Hash'EDESTADDRREQ -> "#EDESTADDRREQ"
|LblisMap -> "isMap"
|LblsrandInt -> "srandInt"
|Lbl'Tild'Int__INT'Hyph'COMMON -> "~Int__INT-COMMON"
|LblisKItem -> "isKItem"
|Lbl'Hash'EPROTONOSUPPORT -> "#EPROTONOSUPPORT"
|Lbl'Hash'ENAMETOOLONG -> "#ENAMETOOLONG"
|LblList'Coln'set -> "List:set"
|LblString2Base -> "String2Base"
|LblisTCellFragment -> "isTCellFragment"
|Lblproject'Coln'EnvCellOpt -> "project:EnvCellOpt"
|Lblreplace'LPar'_'Comm'_'Comm'_'Comm'_'RPar'_STRING -> "replace(_,_,_,_)_STRING"
|Lbl'Hash'ENODEV -> "#ENODEV"
|Lbl_'LSqB'_'_LT_Hyph'_'RSqB'_MAP -> "_[_<-_]_MAP"
|Lbl'Hash'ECHILD -> "#ECHILD"
|Lbl'Hash'EFAULT -> "#EFAULT"
|Lbl'Hash'tell'LPar'_'RPar'_K'Hyph'IO -> "#tell(_)_K-IO"
|Lblkeys -> "keys"
|Lbl_'Perc'Int__INT'Hyph'COMMON -> "_%Int__INT-COMMON"
|LblgetKLabel -> "getKLabel"
|LblisEnvCellOpt -> "isEnvCellOpt"
|Lbl'Hash'seekEnd'LPar'_'Comm'_'RPar'_K'Hyph'IO -> "#seekEnd(_,_)_K-IO"
|LblisExp -> "isExp"
|LblisIOFile -> "isIOFile"
|Lbl'Hash'And -> "#And"
|Lbl'Hash'EXDEV -> "#EXDEV"
|Lbl'Hash'EFBIG -> "#EFBIG"
let parse_sort(c: string) : sort = match c with 
|"EnvCellOpt" -> SortEnvCellOpt
|"Bool" -> SortBool
|"K" -> SortK
|"KResult" -> SortKResult
|"EnvCell" -> SortEnvCell
|"Map" -> SortMap
|"KCell" -> SortKCell
|"Dec" -> SortDec
|"Bytes" -> SortBytes
|"KItem" -> SortKItem
|"Decs" -> SortDecs
|"IOInt" -> SortIOInt
|"IOError" -> SortIOError
|"StringBuffer" -> SortStringBuffer
|"TCell" -> SortTCell
|"Val" -> SortVal
|"Int" -> SortInt
|"Stream" -> SortStream
|"IOString" -> SortIOString
|"#KVariable" -> Sort'Hash'KVariable
|"KConfigVar" -> SortKConfigVar
|"KCellOpt" -> SortKCellOpt
|"String" -> SortString
|"Float" -> SortFloat
|"TCellFragment" -> SortTCellFragment
|"Set" -> SortSet
|"IOFile" -> SortIOFile
|"Id" -> SortId
|"Cell" -> SortCell
|"List" -> SortList
|"Exp" -> SortExp
| _ -> invalid_arg ("parse_sort: " ^ c)
let parse_klabel(c: string) : klabel = match c with 
|"#ENFILE" -> Lbl'Hash'ENFILE
|"#argv" -> Lbl'Hash'argv
|"notBool_" -> LblnotBool_
|"#ENETRESET" -> Lbl'Hash'ENETRESET
|"Map:lookup" -> LblMap'Coln'lookup
|"#stderr_K-IO" -> Lbl'Hash'stderr_K'Hyph'IO
|"#ETOOMANYREFS" -> Lbl'Hash'ETOOMANYREFS
|"noKCell" -> LblnoKCell
|"#seek(_,_)_K-IO" -> Lbl'Hash'seek'LPar'_'Comm'_'RPar'_K'Hyph'IO
|"signExtendBitRangeInt" -> LblsignExtendBitRangeInt
|"_==Bool__BOOL" -> Lbl_'EqlsEqls'Bool__BOOL
|"isSet" -> LblisSet
|"_modInt__INT-COMMON" -> Lbl_modInt__INT'Hyph'COMMON
|"#getenv" -> Lbl'Hash'getenv
|"#ENOPROTOOPT" -> Lbl'Hash'ENOPROTOOPT
|"#parseKAST" -> Lbl'Hash'parseKAST
|"#freezerval_=__MINI-SML-SYNTAX0_" -> Lbl'Hash'freezerval_'Eqls'__MINI'Hyph'SML'Hyph'SYNTAX0_
|"#EMLINK" -> Lbl'Hash'EMLINK
|"intersectSet" -> LblintersectSet
|"_in_keys(_)_MAP" -> Lbl_in_keys'LPar'_'RPar'_MAP
|"#EADDRNOTAVAIL" -> Lbl'Hash'EADDRNOTAVAIL
|"findChar" -> LblfindChar
|"Set:in" -> LblSet'Coln'in
|"isK" -> LblisK
|"String2Int" -> LblString2Int
|"#False" -> Lbl'Hash'False
|"_/Int__INT-COMMON" -> Lbl_'Slsh'Int__INT'Hyph'COMMON
|"_<=Set__SET" -> Lbl_'_LT_Eqls'Set__SET
|"noEnvCell" -> LblnoEnvCell
|"#EAGAIN" -> Lbl'Hash'EAGAIN
|"isIOError" -> LblisIOError
|"#ENOEXEC" -> Lbl'Hash'ENOEXEC
|"#Floor" -> Lbl'Hash'Floor
|"makeList" -> LblmakeList
|"#ENOMEM" -> Lbl'Hash'ENOMEM
|"_[_<-undef]" -> Lbl_'LSqB'_'_LT_Hyph'undef'RSqB'
|"#Bottom" -> Lbl'Hash'Bottom
|"#unlock(_,_)_K-IO" -> Lbl'Hash'unlock'LPar'_'Comm'_'RPar'_K'Hyph'IO
|"#EDEADLK" -> Lbl'Hash'EDEADLK
|"_==Int_" -> Lbl_'EqlsEqls'Int_
|"#EINTR" -> Lbl'Hash'EINTR
|"_andThenBool__BOOL" -> Lbl_andThenBool__BOOL
|"_:/=K_" -> Lbl_'ColnSlshEqls'K_
|"_=/=Int__INT-COMMON" -> Lbl_'EqlsSlshEqls'Int__INT'Hyph'COMMON
|"#ENOLCK" -> Lbl'Hash'ENOLCK
|"#ENOTCONN" -> Lbl'Hash'ENOTCONN
|"project:Set" -> Lblproject'Coln'Set
|"#EADDRINUSE" -> Lbl'Hash'EADDRINUSE
|"#system" -> Lbl'Hash'system
|"isString" -> LblisString
|"#True" -> Lbl'Hash'True
|"is#KVariable" -> Lblis'Hash'KVariable
|"isList" -> LblisList
|"#freezer_+__MINI-SML-SYNTAX0_" -> Lbl'Hash'freezer_'Plus'__MINI'Hyph'SML'Hyph'SYNTAX0_
|"replaceAll(_,_,_)_STRING" -> LblreplaceAll'LPar'_'Comm'_'Comm'_'RPar'_STRING
|"#Or" -> Lbl'Hash'Or
|"#Not" -> Lbl'Hash'Not
|"project:Val" -> Lblproject'Coln'Val
|"findString" -> LblfindString
|"<k>" -> Lbl'_LT_'k'_GT_'
|"absInt" -> LblabsInt
|"#Equals" -> Lbl'Hash'Equals
|"isEnvCell" -> LblisEnvCell
|"_>String__STRING" -> Lbl_'_GT_'String__STRING
|"#EOPNOTSUPP" -> Lbl'Hash'EOPNOTSUPP
|"_==String__STRING" -> Lbl_'EqlsEqls'String__STRING
|"isKConfigVar" -> LblisKConfigVar
|"isVal" -> LblisVal
|"isDecs" -> LblisDecs
|"#ESRCH" -> Lbl'Hash'ESRCH
|"isKResult" -> LblisKResult
|"isCell" -> LblisCell
|"values" -> Lblvalues
|"#Forall" -> Lbl'Hash'Forall
|"List:get" -> LblList'Coln'get
|"#EMFILE" -> Lbl'Hash'EMFILE
|"#lstat(_)_K-IO" -> Lbl'Hash'lstat'LPar'_'RPar'_K'Hyph'IO
|"_>>Int__INT-COMMON" -> Lbl_'_GT__GT_'Int__INT'Hyph'COMMON
|"project:KCell" -> Lblproject'Coln'KCell
|"SetItem" -> LblSetItem
|"project:Map" -> Lblproject'Coln'Map
|"unsignedBytes" -> LblunsignedBytes
|".List" -> Lbl'Stop'List
|"#EDOM" -> Lbl'Hash'EDOM
|"#remove" -> Lbl'Hash'remove
|".List{\"_;__MINI-SML-SYNTAX\"}" -> Lbl'Stop'List'LBraQuot'_'SCln'__MINI'Hyph'SML'Hyph'SYNTAX'QuotRBra'
|"#configuration_K-REFLECTION" -> Lbl'Hash'configuration_K'Hyph'REFLECTION
|"randInt" -> LblrandInt
|"isFloat" -> LblisFloat
|"#close(_)_K-IO" -> Lbl'Hash'close'LPar'_'RPar'_K'Hyph'IO
|"#mkstemp" -> Lbl'Hash'mkstemp
|"project:IOString" -> Lblproject'Coln'IOString
|"keys_list(_)_MAP" -> Lblkeys_list'LPar'_'RPar'_MAP
|"freshId" -> LblfreshId
|"chrChar" -> LblchrChar
|"_orElseBool__BOOL" -> Lbl_orElseBool__BOOL
|"project:Exp" -> Lblproject'Coln'Exp
|"#EACCES" -> Lbl'Hash'EACCES
|"List:range" -> LblList'Coln'range
|"#EPFNOSUPPORT" -> Lbl'Hash'EPFNOSUPPORT
|"#Ceil" -> Lbl'Hash'Ceil
|"project:KResult" -> Lblproject'Coln'KResult
|"_+Int_" -> Lbl_'Plus'Int_
|"isKCell" -> LblisKCell
|"#unknownIOError" -> Lbl'Hash'unknownIOError
|"_orBool__BOOL" -> Lbl_orBool__BOOL
|"initEnvCell" -> LblinitEnvCell
|"updateMap" -> LblupdateMap
|"#EALREADY" -> Lbl'Hash'EALREADY
|"Int2String" -> LblInt2String
|"project:Cell" -> Lblproject'Coln'Cell
|"#ECONNRESET" -> Lbl'Hash'ECONNRESET
|"#ESOCKTNOSUPPORT" -> Lbl'Hash'ESOCKTNOSUPPORT
|"#Implies" -> Lbl'Hash'Implies
|"#lock(_,_)_K-IO" -> Lbl'Hash'lock'LPar'_'Comm'_'RPar'_K'Hyph'IO
|"_=/=K_" -> Lbl_'EqlsSlshEqls'K_
|"countAllOccurrences(_,_)_STRING" -> LblcountAllOccurrences'LPar'_'Comm'_'RPar'_STRING
|"fillList" -> LblfillList
|"#ENOTTY" -> Lbl'Hash'ENOTTY
|"bitRangeInt" -> LblbitRangeInt
|"_<String__STRING" -> Lbl_'_LT_'String__STRING
|"#ENOSYS" -> Lbl'Hash'ENOSYS
|"_List_" -> Lbl_List_
|"#ThreadLocal" -> Lbl'Hash'ThreadLocal
|"#open(_,_)_K-IO" -> Lbl'Hash'open'LPar'_'Comm'_'RPar'_K'Hyph'IO
|"_<Int__INT-COMMON" -> Lbl_'_LT_'Int__INT'Hyph'COMMON
|"_|->_" -> Lbl_'PipeHyph_GT_'_
|"_-Map__MAP" -> Lbl_'Hyph'Map__MAP
|"_xorBool__BOOL" -> Lbl_xorBool__BOOL
|"_^%Int___INT-COMMON" -> Lbl_'Xor_Perc'Int___INT'Hyph'COMMON
|"#EIO" -> Lbl'Hash'EIO
|"#EISDIR" -> Lbl'Hash'EISDIR
|"#ENOBUFS" -> Lbl'Hash'ENOBUFS
|"project:Bool" -> Lblproject'Coln'Bool
|"#EMSGSIZE" -> Lbl'Hash'EMSGSIZE
|"#tempFile(_,_)_K-IO" -> Lbl'Hash'tempFile'LPar'_'Comm'_'RPar'_K'Hyph'IO
|"#sort" -> Lbl'Hash'sort
|"_==K_" -> Lbl_'EqlsEqls'K_
|"_*Int__INT-COMMON" -> Lbl_'Star'Int__INT'Hyph'COMMON
|"project:List" -> Lblproject'Coln'List
|"#open(_)_K-IO" -> Lbl'Hash'open'LPar'_'RPar'_K'Hyph'IO
|"<env>" -> Lbl'_LT_'env'_GT_'
|"replaceFirst(_,_,_)_STRING" -> LblreplaceFirst'LPar'_'Comm'_'Comm'_'RPar'_STRING
|"project:EnvCell" -> Lblproject'Coln'EnvCell
|"isDec" -> LblisDec
|"#putc(_,_)_K-IO" -> Lbl'Hash'putc'LPar'_'Comm'_'RPar'_K'Hyph'IO
|"#projectInt" -> Lbl'Hash'projectInt
|"isIOString" -> LblisIOString
|".Map" -> Lbl'Stop'Map
|"#EOVERFLOW" -> Lbl'Hash'EOVERFLOW
|"#EHOSTDOWN" -> Lbl'Hash'EHOSTDOWN
|"#logToFile" -> Lbl'Hash'logToFile
|"project:IOFile" -> Lblproject'Coln'IOFile
|"_=/=String__STRING" -> Lbl_'EqlsSlshEqls'String__STRING
|"#read(_,_)_K-IO" -> Lbl'Hash'read'LPar'_'Comm'_'RPar'_K'Hyph'IO
|"#EHOSTUNREACH" -> Lbl'Hash'EHOSTUNREACH
|"#ECONNREFUSED" -> Lbl'Hash'ECONNREFUSED
|"#EPERM" -> Lbl'Hash'EPERM
|"_<=Int__INT-COMMON" -> Lbl_'_LT_Eqls'Int__INT'Hyph'COMMON
|"#Exists" -> Lbl'Hash'Exists
|"bigEndianBytes" -> LblbigEndianBytes
|"Id2String" -> LblId2String
|"isInt" -> LblisInt
|"#fresh" -> Lbl'Hash'fresh
|"Map:choice" -> LblMap'Coln'choice
|"_Set_" -> Lbl_Set_
|"project:Stream" -> Lblproject'Coln'Stream
|"_impliesBool__BOOL" -> Lbl_impliesBool__BOOL
|"#getc(_)_K-IO" -> Lbl'Hash'getc'LPar'_'RPar'_K'Hyph'IO
|"#ENOTEMPTY" -> Lbl'Hash'ENOTEMPTY
|"<T>" -> Lbl'_LT_'T'_GT_'
|"#Thread" -> Lbl'Hash'Thread
|"#EINVAL" -> Lbl'Hash'EINVAL
|"_|Int__INT-COMMON" -> Lbl_'Pipe'Int__INT'Hyph'COMMON
|"#EWOULDBLOCK" -> Lbl'Hash'EWOULDBLOCK
|"_;__MINI-SML-SYNTAX" -> Lbl_'SCln'__MINI'Hyph'SML'Hyph'SYNTAX
|"isBool" -> LblisBool
|"minInt(_,_)_INT-COMMON" -> LblminInt'LPar'_'Comm'_'RPar'_INT'Hyph'COMMON
|"_<=String__STRING" -> Lbl_'_LT_Eqls'String__STRING
|"ordChar" -> LblordChar
|"rfindChar" -> LblrfindChar
|"_<<Int__INT-COMMON" -> Lbl_'_LT__LT_'Int__INT'Hyph'COMMON
|"_>Int__INT-COMMON" -> Lbl_'_GT_'Int__INT'Hyph'COMMON
|"project:Int" -> Lblproject'Coln'Int
|"#EOF" -> Lbl'Hash'EOF
|"_Map_" -> Lbl_Map_
|"isIOInt" -> LblisIOInt
|"directionalityChar" -> LbldirectionalityChar
|"Float2String" -> LblFloat2String
|"#opendir(_)_K-IO" -> Lbl'Hash'opendir'LPar'_'RPar'_K'Hyph'IO
|"#EEXIST" -> Lbl'Hash'EEXIST
|"project:Decs" -> Lblproject'Coln'Decs
|"initKCell" -> LblinitKCell
|"#EPIPE" -> Lbl'Hash'EPIPE
|"#ERANGE" -> Lbl'Hash'ERANGE
|"sizeList" -> LblsizeList
|"#EISCONN" -> Lbl'Hash'EISCONN
|".Set" -> Lbl'Stop'Set
|"val_=__MINI-SML-SYNTAX" -> Lblval_'Eqls'__MINI'Hyph'SML'Hyph'SYNTAX
|"String2Id" -> LblString2Id
|"#ENETDOWN" -> Lbl'Hash'ENETDOWN
|"_:=K_" -> Lbl_'ColnEqls'K_
|"project:IOError" -> Lblproject'Coln'IOError
|"#noParse" -> Lbl'Hash'noParse
|"_=/=Bool__BOOL" -> Lbl_'EqlsSlshEqls'Bool__BOOL
|"#ENXIO" -> Lbl'Hash'ENXIO
|"removeAll" -> LblremoveAll
|"isTCell" -> LblisTCell
|"_andBool_" -> Lbl_andBool_
|"_divInt__INT-COMMON" -> Lbl_divInt__INT'Hyph'COMMON
|"_xorInt__INT-COMMON" -> Lbl_xorInt__INT'Hyph'COMMON
|"lengthString" -> LbllengthString
|"initTCell" -> LblinitTCell
|"signedBytes" -> LblsignedBytes
|"maxInt(_,_)_INT-COMMON" -> LblmaxInt'LPar'_'Comm'_'RPar'_INT'Hyph'COMMON
|"FloatFormat" -> LblFloatFormat
|"_+String__STRING" -> Lbl_'Plus'String__STRING
|"#EINPROGRESS" -> Lbl'Hash'EINPROGRESS
|"project:IOInt" -> Lblproject'Coln'IOInt
|"#ENOSPC" -> Lbl'Hash'ENOSPC
|"rfindString" -> LblrfindString
|"<T>-fragment" -> Lbl'_LT_'T'_GT_Hyph'fragment
|"#stat(_)_K-IO" -> Lbl'Hash'stat'LPar'_'RPar'_K'Hyph'IO
|"_+__MINI-SML-SYNTAX" -> Lbl_'Plus'__MINI'Hyph'SML'Hyph'SYNTAX
|"updateList" -> LblupdateList
|"#ENOTDIR" -> Lbl'Hash'ENOTDIR
|"Set:choice" -> LblSet'Coln'choice
|"project:KCellOpt" -> Lblproject'Coln'KCellOpt
|"categoryChar" -> LblcategoryChar
|"Set:difference" -> LblSet'Coln'difference
|"#buffer" -> Lbl'Hash'buffer
|"#ENETUNREACH" -> Lbl'Hash'ENETUNREACH
|"freshInt" -> LblfreshInt
|"#ESHUTDOWN" -> Lbl'Hash'ESHUTDOWN
|"#write(_,_)_K-IO" -> Lbl'Hash'write'LPar'_'Comm'_'RPar'_K'Hyph'IO
|"isKCellOpt" -> LblisKCellOpt
|"#EPROTOTYPE" -> Lbl'Hash'EPROTOTYPE
|"#projectString" -> Lbl'Hash'projectString
|"_&Int__INT-COMMON" -> Lbl_'And'Int__INT'Hyph'COMMON
|"#EBUSY" -> Lbl'Hash'EBUSY
|"String2Float" -> LblString2Float
|"Map:lookupOrDefault" -> LblMap'Coln'lookupOrDefault
|"#if_#then_#else_#fi_K-EQUAL" -> Lbl'Hash'if_'Hash'then_'Hash'else_'Hash'fi_K'Hyph'EQUAL
|"#stdout_K-IO" -> Lbl'Hash'stdout_K'Hyph'IO
|"project:TCell" -> Lblproject'Coln'TCell
|"littleEndianBytes" -> LbllittleEndianBytes
|"#EBADF" -> Lbl'Hash'EBADF
|"#ECONNABORTED" -> Lbl'Hash'ECONNABORTED
|"log2Int" -> Lbllog2Int
|"_>=Int__INT-COMMON" -> Lbl_'_GT_Eqls'Int__INT'Hyph'COMMON
|"#stdin_K-IO" -> Lbl'Hash'stdin_K'Hyph'IO
|"Base2String" -> LblBase2String
|"project:TCellFragment" -> Lblproject'Coln'TCellFragment
|"ListItem" -> LblListItem
|"project:Dec" -> Lblproject'Coln'Dec
|"_>=String__STRING" -> Lbl_'_GT_Eqls'String__STRING
|"isStream" -> LblisStream
|"_-Int__INT-COMMON" -> Lbl_'Hyph'Int__INT'Hyph'COMMON
|"#ENOTSOCK" -> Lbl'Hash'ENOTSOCK
|"_<=Map__MAP" -> Lbl_'_LT_Eqls'Map__MAP
|"#ENOENT" -> Lbl'Hash'ENOENT
|"newUUID_STRING" -> LblnewUUID_STRING
|"#ELOOP" -> Lbl'Hash'ELOOP
|"#AG" -> Lbl'Hash'AG
|"project:Float" -> Lblproject'Coln'Float
|"sizeMap" -> LblsizeMap
|"#E2BIG" -> Lbl'Hash'E2BIG
|"_dividesInt__INT-COMMON" -> Lbl_dividesInt__INT'Hyph'COMMON
|"isId" -> LblisId
|"substrString" -> LblsubstrString
|"project:String" -> Lblproject'Coln'String
|"project:Id" -> Lblproject'Coln'Id
|"size" -> Lblsize
|"#freezer_+__MINI-SML-SYNTAX1_" -> Lbl'Hash'freezer_'Plus'__MINI'Hyph'SML'Hyph'SYNTAX1_
|"#EAFNOSUPPORT" -> Lbl'Hash'EAFNOSUPPORT
|"#ESPIPE" -> Lbl'Hash'ESPIPE
|"#ETIMEDOUT" -> Lbl'Hash'ETIMEDOUT
|"_^Int__INT-COMMON" -> Lbl_'Xor_'Int__INT'Hyph'COMMON
|"#EROFS" -> Lbl'Hash'EROFS
|"#systemResult(_,_,_)_K-IO" -> Lbl'Hash'systemResult'LPar'_'Comm'_'Comm'_'RPar'_K'Hyph'IO
|"_inList_" -> Lbl_inList_
|"#EDESTADDRREQ" -> Lbl'Hash'EDESTADDRREQ
|"isMap" -> LblisMap
|"srandInt" -> LblsrandInt
|"~Int__INT-COMMON" -> Lbl'Tild'Int__INT'Hyph'COMMON
|"isKItem" -> LblisKItem
|"#EPROTONOSUPPORT" -> Lbl'Hash'EPROTONOSUPPORT
|"#ENAMETOOLONG" -> Lbl'Hash'ENAMETOOLONG
|"List:set" -> LblList'Coln'set
|"String2Base" -> LblString2Base
|"isTCellFragment" -> LblisTCellFragment
|"project:EnvCellOpt" -> Lblproject'Coln'EnvCellOpt
|"replace(_,_,_,_)_STRING" -> Lblreplace'LPar'_'Comm'_'Comm'_'Comm'_'RPar'_STRING
|"#ENODEV" -> Lbl'Hash'ENODEV
|"_[_<-_]_MAP" -> Lbl_'LSqB'_'_LT_Hyph'_'RSqB'_MAP
|"#ECHILD" -> Lbl'Hash'ECHILD
|"#EFAULT" -> Lbl'Hash'EFAULT
|"#tell(_)_K-IO" -> Lbl'Hash'tell'LPar'_'RPar'_K'Hyph'IO
|"keys" -> Lblkeys
|"_%Int__INT-COMMON" -> Lbl_'Perc'Int__INT'Hyph'COMMON
|"getKLabel" -> LblgetKLabel
|"isEnvCellOpt" -> LblisEnvCellOpt
|"#seekEnd(_,_)_K-IO" -> Lbl'Hash'seekEnd'LPar'_'Comm'_'RPar'_K'Hyph'IO
|"isExp" -> LblisExp
|"isIOFile" -> LblisIOFile
|"#And" -> Lbl'Hash'And
|"#EXDEV" -> Lbl'Hash'EXDEV
|"#EFBIG" -> Lbl'Hash'EFBIG
| _ -> invalid_arg ("parse_klabel: " ^ c)
let collection_for (c: klabel) : klabel = match c with 
|LblSetItem -> Lbl_Set_
|Lbl_Set_ -> Lbl_Set_
|Lbl_List_ -> Lbl_List_
|Lbl'Stop'Map -> Lbl_Map_
|Lbl'Stop'Set -> Lbl_Set_
|Lbl_'PipeHyph_GT_'_ -> Lbl_Map_
|LblListItem -> Lbl_List_
|Lbl_Map_ -> Lbl_Map_
|Lbl'Stop'List -> Lbl_List_
| _ -> invalid_arg "collection_for"
let unit_for (c: klabel) : klabel = match c with 
|Lbl_Set_ -> Lbl'Stop'Set
|Lbl_List_ -> Lbl'Stop'List
|Lbl_Map_ -> Lbl'Stop'Map
| _ -> invalid_arg "unit_for"
let el_for (c: klabel) : klabel = match c with 
|Lbl_Set_ -> LblSetItem
|Lbl_List_ -> LblListItem
|Lbl_Map_ -> Lbl_'PipeHyph_GT_'_
| _ -> invalid_arg "el_for"
let unit_for_array (c: sort) : klabel = match c with 
| _ -> invalid_arg "unit_for_array"
let el_for_array (c: sort) : klabel = match c with 
| _ -> invalid_arg "el_for_array"
module Dynarray : sig
  type 'a t
  val make : int -> 'a -> 'a t
  val length : 'a t -> int
  val get : 'a t -> int -> 'a
  val set : 'a t -> int -> 'a -> unit
  val compare : ('a list -> 'a list -> int) -> 'a t -> 'a t -> int
  val fold_left : ('a -> 'b -> 'a) -> 'a -> 'b t -> 'a
  val fold_right : ('a -> 'b -> 'b) -> 'a t -> 'b -> 'b
  val iteri : (int -> 'a -> unit) -> 'a t -> unit
end = struct
  type 'a t = { size: int;                mutable arr: 'a array;                default: 'a }
  let make size default = { size=size; arr=Array.make (min size 10) default; default=default}
  let length arr = arr.size
  let get arr idx = if idx >= Array.length arr.arr && idx < arr.size then arr.default else Array.get arr.arr idx
  let calc_size arr at_least = let double = Array.length arr.arr * 2 in
    let at_most = if double > arr.size then arr.size else double in
    if at_least > at_most then at_least else at_most
  let upgrade_size arr size = let old = arr.arr in    arr.arr <- Array.make size arr.default;    Array.blit old 0 arr.arr 0 (Array.length old)
  let set arr idx value= if idx >= Array.length arr.arr && idx < arr.size then upgrade_size arr (calc_size arr (idx + 1));
    Array.set arr.arr idx value
  let compare_arr f a b = let smaller,larger = if Array.length a.arr < Array.length b.arr then a,b else b,a in
  upgrade_size smaller (Array.length larger.arr);
  f (Array.to_list a.arr) (Array.to_list b.arr)
  let compare f a b = let v = Pervasives.compare a.size b.size in if v = 0 then compare_arr f a b else v
  let fold_left f init arr = snd (Array.fold_left (fun (i,x) a -> if i > 0 then (i - 1, f x a) else (0,x))  (arr.size,init) arr.arr)
  let fold_right f arr init = snd (Array.fold_right (fun a (i,x) -> if i > 0 then (i - 1, x) else (0, f a x)) arr.arr (Array.length arr.arr - arr.size, init))
  let iteri f arr = Array.iteri (fun i a -> if i < arr.size then f i a else ()) arr.arr
end


module type S =
sig
  type m
  type s
  type t = kitem list
  and kitem = KToken of sort * string
            | InjectedKLabel of klabel
            | Map of sort * klabel * m
            | List of sort * klabel * t list
            | Set of sort * klabel * s
            | Array of sort * t * t Dynarray.t
            | Int of Z.t
            | Float of Gmp.FR.t * int * int
            | String of string
            | Bytes of bytes
            | StringBuffer of Buffer.t
            | Bool of bool
            | ThreadLocal
            | Thread of t * t * t * t
            | Bottom
            | KApply0 of klabel
            | KApply1 of klabel * t
            | KApply2 of klabel * t * t
            | KApply3 of klabel * t * t * t
            | KApply4 of klabel * t * t * t * t
  val compare : t -> t -> int
  val compare_kitem : kitem -> kitem -> int
  val compare_klist : t list -> t list -> int
  val equal_k : t -> t -> bool
  val hash_k : t -> int
  val hash_k_param : int -> t -> int
end
module rec K : (S with type m = K.t Map.Make(K).t and type s = Set.Make(K).t)  =
struct
  module KMap = Map.Make(K)
  module KSet = Set.Make(K)
  type m = K.t KMap.t
  and s = KSet.t
  and t = kitem list
  and kitem = KToken of sort * string
            | InjectedKLabel of klabel
            | Map of sort * klabel * m
            | List of sort * klabel * t list
            | Set of sort * klabel * s
            | Array of sort * t * t Dynarray.t
            | Int of Z.t
            | Float of Gmp.FR.t * int * int
            | String of string
            | Bytes of bytes
            | StringBuffer of Buffer.t
            | Bool of bool
            | ThreadLocal
            | Thread of t * t * t * t
            | Bottom
            | KApply0 of klabel
            | KApply1 of klabel * t
            | KApply2 of klabel * t * t
            | KApply3 of klabel * t * t * t
            | KApply4 of klabel * t * t * t * t
let rec hash_k c = match c with
    | [] -> 1
    | hd :: tl -> (hash_k tl) * 31 + hash_kitem hd
  and hash_kitem c = match c with
    | KApply0(lbl) -> (Hashtbl.hash lbl)
    | KApply1(lbl,k0) -> ((Hashtbl.hash lbl)) * 37 + hash_k k0
    | KApply2(lbl,k0,k1) -> (((Hashtbl.hash lbl)) * 37 + hash_k k0) * 37 + hash_k k1
    | KApply3(lbl,k0,k1,k2) -> ((((Hashtbl.hash lbl)) * 37 + hash_k k0) * 37 + hash_k k1) * 37 + hash_k k2
    | KApply4(lbl,k0,k1,k2,k3) -> (((((Hashtbl.hash lbl)) * 37 + hash_k k0) * 37 + hash_k k1) * 37 + hash_k k2) * 37 + hash_k k3
    | KToken(s, st) -> Hashtbl.hash s * 41 + Hashtbl.hash st
    | InjectedKLabel kl -> Hashtbl.hash kl
    | Map(_,k,m) -> Hashtbl.hash k * 43 + KMap.fold (fun k v accum -> accum + (hash_k k lxor hash_k v)) m 0
    | List(_,k,l) -> Hashtbl.hash k * 47 + hash_klist l
    | Set(_,k,s) -> Hashtbl.hash k * 53 + KSet.fold (fun k accum -> accum + hash_k k) s 0
    | Array(k,_,l) -> Hashtbl.hash k * 61 + (Dynarray.length l)
    | Int i -> Z.hash i
    | Float (f,_,_) -> Hashtbl.hash (Gmp.FR.to_float f)
    | String s -> Hashtbl.hash s
    | StringBuffer s -> Hashtbl.hash (Buffer.contents s)
    | Bytes b -> Hashtbl.hash b
    | Bool b -> Hashtbl.hash b
    | Bottom -> 1
    | ThreadLocal -> 2
    | Thread(k1,k2,k3,k4) -> ((((Hashtbl.hash Lbl'Hash'Thread) * 37 + hash_k k1) * 37 + hash_k k2) * 37 + hash_k k3) * 36 + hash_k k4
  and hash_klist c = match c with
    | [] -> 1
    | hd :: tl -> (hash_klist tl) * 59 + hash_k hd
let rec hash_k_param_fld ((l,max) as lmax) = function 
  | [] -> lmax
  | h::t -> if max < 0 then lmax else hash_k_param_fld (h::l,max-1) t

let hash_k_param_add_kitem k max =
  hash_k_param_fld max k

let rec qfld l1 h max = match l1 with 
  | [] -> let (l2,max) = max in if l2 = [] then h else qfld l2 h ([],max)
  | ki :: kq -> match ki with 
    | KApply0(lbl) -> 
        qfld kq (31*h + Hashtbl.hash lbl) (
        max)
    | KApply1(lbl,k0) -> 
        qfld kq (31*h + Hashtbl.hash lbl) (
        hash_k_param_add_kitem k0 (
        max))
    | KApply2(lbl,k0,k1) -> 
        qfld kq (31*h + Hashtbl.hash lbl) (
        hash_k_param_add_kitem k0 (
        hash_k_param_add_kitem k1 (
        max)))
    | KApply3(lbl,k0,k1,k2) -> 
        qfld kq (31*h + Hashtbl.hash lbl) (
        hash_k_param_add_kitem k0 (
        hash_k_param_add_kitem k1 (
        hash_k_param_add_kitem k2 (
        max))))
    | KApply4(lbl,k0,k1,k2,k3) -> 
        qfld kq (31*h + Hashtbl.hash lbl) (
        hash_k_param_add_kitem k0 (
        hash_k_param_add_kitem k1 (
        hash_k_param_add_kitem k2 (
        hash_k_param_add_kitem k3 (
        max)))))
    | KToken(s, st) ->
        qfld kq (31*h + Hashtbl.hash s * 41 + Hashtbl.hash st) (
        max)
    | InjectedKLabel lbl ->
        qfld kq (31*h + Hashtbl.hash lbl) (
        max)
    | Map(_,lbl,m) -> 
        qfld kq (31*h + 43 * Hashtbl.hash lbl) (
        KMap.fold (fun k v max -> hash_k_param_add_kitem v (hash_k_param_add_kitem k max)) m max)
    | List(_,lbl,l) ->
        qfld kq (31*h + 47 * Hashtbl.hash lbl) (
        List.fold_left (fun max k -> hash_k_param_add_kitem k max) max l)
    | Set(_,lbl,s) ->
        qfld kq (31*h + 53 * Hashtbl.hash lbl) (
        KSet.fold (fun k max -> hash_k_param_add_kitem k max) s max)
    | Array(lbl,_,l) -> 
        qfld kq (31*h + 61 * Hashtbl.hash lbl + Dynarray.length l) (
        max)
    | Int i -> qfld kq (31*h + Z.hash i) (
        max)
    | Float (f,_,_) -> qfld kq (31*h + Hashtbl.hash (Gmp.FR.to_float f)) (
        max)
    | String s -> qfld kq (31*h + Hashtbl.hash s) (
        max)
    | Bytes b -> qfld kq (31*h + Hashtbl.hash b) (
        max)
    | StringBuffer s -> qfld kq (31*h + Hashtbl.hash (Buffer.contents s)) (
        max)
    | Bool b -> qfld kq (31*h + Hashtbl.hash b) (
        max)
    | Bottom -> qfld kq (31*h + 1) (
        max)
    | ThreadLocal -> qfld kq (31*h + 2) (
        max)
    | Thread(k1,k2,k3,k4) -> qfld kq (31*h + Hashtbl.hash Lbl'Hash'Thread) (hash_k_param_add_kitem k1 (hash_k_param_add_kitem k2 (hash_k_param_add_kitem k3 (hash_k_param_add_kitem k4 max))))

let hash_k_param max k = 
    qfld [] 0 (hash_k_param_add_kitem k ([],max))

  let rec equal_k c1 c2 = if c1 == c2 then true else match (c1, c2) with
    | [], [] -> true
    | (hd1 :: tl1), (hd2 :: tl2) -> equal_kitem hd1 hd2 && equal_k tl1 tl2
    | _ -> false
  and equal_kitem c1 c2 = if c1 == c2 then true else match (c1, c2) with
    | KApply0(lbl1),KApply0(lbl2) -> lbl1 = lbl2
    | KApply1(lbl1,k0_1),KApply1(lbl2,k0_2) -> lbl1 = lbl2 && equal_k k0_1 k0_2
    | KApply2(lbl1,k0_1,k1_1),KApply2(lbl2,k0_2,k1_2) -> lbl1 = lbl2 && equal_k k0_1 k0_2 && equal_k k1_1 k1_2
    | KApply3(lbl1,k0_1,k1_1,k2_1),KApply3(lbl2,k0_2,k1_2,k2_2) -> lbl1 = lbl2 && equal_k k0_1 k0_2 && equal_k k1_1 k1_2 && equal_k k2_1 k2_2
    | KApply4(lbl1,k0_1,k1_1,k2_1,k3_1),KApply4(lbl2,k0_2,k1_2,k2_2,k3_2) -> lbl1 = lbl2 && equal_k k0_1 k0_2 && equal_k k1_1 k1_2 && equal_k k2_1 k2_2 && equal_k k3_1 k3_2
    | (KToken(s1, st1)), (KToken(s2, st2)) -> s1 = s2 && st1 = st2
    | (InjectedKLabel kl1), (InjectedKLabel kl2) -> kl1 = kl2
    | (Map (_,k1,m1)), (Map (_,k2,m2)) -> k1 = k2 && KMap.cardinal m1 = KMap.cardinal m2 && (KMap.equal) (equal_k) m1 m2
    | (List (_,k1,l1)), (List (_,k2,l2)) -> k1 = k2 && equal_klist l1 l2
    | (Set (_,k1,s1)), (Set (_,k2,s2)) -> k1 = k2 && KSet.cardinal s1 = KSet.cardinal s2 && (KSet.equal) s1 s2
    | (Array (s1,k1,l1)), (Array (s2,k2,l2)) -> s1 = s2 && equal_k k1 k2 && l1 == l2
    | (Int i1), (Int i2) -> Z.equal i1 i2
    | (Float (f1,e1,p1)), (Float (f2,e2,p2)) -> e1 = e2 && p1 = p2 && Gmp.FR.compare f1 f2 = 0
    | (String s1), (String s2) -> s1 = s2
    | (Bytes b1), (Bytes b2) -> b1 == b2
    | (StringBuffer s1), (StringBuffer s2) -> s1 == s2
    | (Bool b1), (Bool b2) -> b1 = b2
    | Bottom, Bottom -> true
    | _ -> false
  and equal_klist c1 c2 = if c1 == c2 then true else match (c1, c2) with
    | [], [] -> true
    | (hd1 :: tl1), (hd2 :: tl2) -> equal_k hd1 hd2 && equal_klist tl1 tl2
    | _ -> false
  let rec compare c1 c2 = if c1 == c2 then 0 else match (c1, c2) with
    | [], [] -> 0
    | (hd1 :: tl1), (hd2 :: tl2) -> let v = compare_kitem hd1 hd2 in if v = 0 then compare tl1 tl2 else v
    | (_ :: _), _ -> -1
    | _ -> 1
  and compare_kitem c1 c2 = if c1 == c2 then 0 else match (c1, c2) with
    | KApply0(lbl1),KApply0(lbl2) -> Pervasives.compare lbl1 lbl2
    | KApply1(lbl1,k0_1),KApply1(lbl2,k0_2) -> (let v = Pervasives.compare lbl1 lbl2 in if v = 0 then compare k0_1 k0_2
 else v)
    | KApply2(lbl1,k0_1,k1_1),KApply2(lbl2,k0_2,k1_2) -> (let v = Pervasives.compare lbl1 lbl2 in if v = 0 then (let v = compare k0_1 k0_2 in if v = 0 then compare k1_1 k1_2
 else v)
 else v)
    | KApply3(lbl1,k0_1,k1_1,k2_1),KApply3(lbl2,k0_2,k1_2,k2_2) -> (let v = Pervasives.compare lbl1 lbl2 in if v = 0 then (let v = compare k0_1 k0_2 in if v = 0 then (let v = compare k1_1 k1_2 in if v = 0 then compare k2_1 k2_2
 else v)
 else v)
 else v)
    | KApply4(lbl1,k0_1,k1_1,k2_1,k3_1),KApply4(lbl2,k0_2,k1_2,k2_2,k3_2) -> (let v = Pervasives.compare lbl1 lbl2 in if v = 0 then (let v = compare k0_1 k0_2 in if v = 0 then (let v = compare k1_1 k1_2 in if v = 0 then (let v = compare k2_1 k2_2 in if v = 0 then compare k3_1 k3_2
 else v)
 else v)
 else v)
 else v)
    | (KToken(s1, st1)), (KToken(s2, st2)) -> let v = Pervasives.compare s1 s2 in if v = 0 then Pervasives.compare st1 st2 else v
    | (InjectedKLabel kl1), (InjectedKLabel kl2) -> Pervasives.compare kl1 kl2
    | (Map (_,k1,m1)), (Map (_,k2,m2)) -> let v = Pervasives.compare k1 k2 in if v = 0 then (KMap.compare) compare m1 m2 else v
    | (List (_,k1,l1)), (List (_,k2,l2)) -> let v = Pervasives.compare k1 k2 in if v = 0 then compare_klist l1 l2 else v
    | (Set (_,k1,s1)), (Set (_,k2,s2)) -> let v = Pervasives.compare k1 k2 in if v = 0 then (KSet.compare) s1 s2 else v
    | (Array (s1,k1,l1)), (Array (s2,k2,l2)) -> let v = Pervasives.compare s1 s2 in if v = 0 then let v = compare k1 k2 in if v = 0 then Dynarray.compare compare_klist l1 l2 else v else v
    | (Int i1), (Int i2) -> Z.compare i1 i2
    | (Float (f1,e1,p1)), (Float (f2,e2,p2)) -> let v = e2 - e1 in if v = 0 then let v2 = p2 - p1 in if v2 = 0 then Gmp.FR.compare f1 f2 else v2 else v
    | (String s1), (String s2) -> Pervasives.compare s1 s2
    | (Bytes b1), (Bytes b2) -> Pervasives.compare b1 b2
    | (StringBuffer s1), (StringBuffer s2) -> Pervasives.compare (Buffer.contents s1) (Buffer.contents s2)
    | (Bool b1), (Bool b2) -> if b1 = b2 then 0 else if b1 then -1 else 1
    | Bottom, Bottom -> 0
    | ThreadLocal, ThreadLocal -> 0
    | Thread (k11, k12, k13, k14), Thread (k21, k22, k23, k24) -> let v = compare k11 k21 in if v = 0 then let v = compare k12 k22 in if v = 0 then let v = compare k13 k23 in if v = 0 then compare k14 k24 else v else v else v
    | KApply0 _, _ -> -1
    | _, KApply0 _ -> 1
    | KApply1 _, _ -> -1
    | _, KApply1 _ -> 1
    | KApply2 _, _ -> -1
    | _, KApply2 _ -> 1
    | KApply3 _, _ -> -1
    | _, KApply3 _ -> 1
    | KApply4 _, _ -> -1
    | _, KApply4 _ -> 1
    | KToken(_, _), _ -> -1
    | _, KToken(_, _) -> 1
    | InjectedKLabel(_), _ -> -1
    | _, InjectedKLabel(_) -> 1
    | Map(_), _ -> -1
    | _, Map(_) -> 1
    | List(_), _ -> -1
    | _, List(_) -> 1
    | Set(_), _ -> -1
    | _, Set(_) -> 1
    | Array(_), _ -> -1
    | _, Array(_) -> 1
    | Int(_), _ -> -1
    | _, Int(_) -> 1
    | Float(_), _ -> -1
    | _, Float(_) -> 1
    | String(_), _ -> -1
    | _, String(_) -> 1
    | Bytes(_), _ -> -1
    | _, Bytes(_) -> 1
    | StringBuffer(_), _ -> -1
    | _, StringBuffer(_) -> 1
    | Bool(_), _ -> -1
    | _, Bool(_) -> 1
    | Bottom, _ -> -1
    | _, Bottom -> 1
    | ThreadLocal, _ -> -1
    | _, ThreadLocal -> 1
  and compare_klist c1 c2 = match (c1, c2) with
    | [], [] -> 0
    | (hd1 :: tl1), (hd2 :: tl2) -> let v = compare hd1 hd2 in if v = 0 then compare_klist tl1 tl2 else v
    | (_ :: _), _ -> -1
    | _ -> 1
end
type normal_kitem = KApply of klabel * K.t list
                  | KItem of K.kitem
open K
let normalize (k: kitem) : normal_kitem = match k with 
  | KApply0(lbl) -> KApply (lbl, [])
  | KApply1(lbl,k0) -> KApply (lbl, [k0])
  | KApply2(lbl,k0,k1) -> KApply (lbl, [k0; k1])
  | KApply3(lbl,k0,k1,k2) -> KApply (lbl, [k0; k1; k2])
  | KApply4(lbl,k0,k1,k2,k3) -> KApply (lbl, [k0; k1; k2; k3])
| v -> KItem v
let denormalize (k: normal_kitem) : kitem = match k with 
  | KApply (lbl, []) -> KApply0(lbl)
  | KApply (lbl, [k0]) -> KApply1(lbl,k0)
  | KApply (lbl, [k0; k1]) -> KApply2(lbl,k0,k1)
  | KApply (lbl, [k0; k1; k2]) -> KApply3(lbl,k0,k1,k2)
  | KApply (lbl, [k0; k1; k2; k3]) -> KApply4(lbl,k0,k1,k2,k3)
| KItem v -> v
| KApply (_, _) -> invalid_arg "denormalize"
type k = K.t
let denormalize0  (c: unit) : k list = match c with () -> []
let normalize0 (c: k list) = match c with [] -> ()
| _ -> invalid_arg "normalize0"
let denormalize1  (c: k) : k list = match c with (k0) -> [k0]
let normalize1 (c: k list) = match c with [k0] -> (k0)
| _ -> invalid_arg "normalize1"
let denormalize2  (c: k * k) : k list = match c with (k0,k1) -> [k0; k1]
let normalize2 (c: k list) = match c with [k0; k1] -> (k0,k1)
| _ -> invalid_arg "normalize2"
let denormalize3  (c: k * k * k) : k list = match c with (k0,k1,k2) -> [k0; k1; k2]
let normalize3 (c: k list) = match c with [k0; k1; k2] -> (k0,k1,k2)
| _ -> invalid_arg "normalize3"
let denormalize4  (c: k * k * k * k) : k list = match c with (k0,k1,k2,k3) -> [k0; k1; k2; k3]
let normalize4 (c: k list) = match c with [k0; k1; k2; k3] -> (k0,k1,k2,k3)
| _ -> invalid_arg "normalize4"
let int0 = lazy (Int (Z.of_string "0"))
let int1 = lazy (Int (Z.of_string "1"))
let int2 = lazy (Int (Z.of_string "2"))
let int'Hyph'1 = lazy (Int (Z.of_string "-1"))
let const'Hash'EPFNOSUPPORT = KApply0(Lbl'Hash'EPFNOSUPPORT)
let const'Hash'ENOTCONN = KApply0(Lbl'Hash'ENOTCONN)
let const'Hash'ECONNREFUSED = KApply0(Lbl'Hash'ECONNREFUSED)
let constnoKCell = KApply0(LblnoKCell)
let const'Hash'EWOULDBLOCK = KApply0(Lbl'Hash'EWOULDBLOCK)
let const'Hash'ERANGE = KApply0(Lbl'Hash'ERANGE)
let const'Hash'EMSGSIZE = KApply0(Lbl'Hash'EMSGSIZE)
let const'Hash'ENOTSOCK = KApply0(Lbl'Hash'ENOTSOCK)
let const'Hash'ENETDOWN = KApply0(Lbl'Hash'ENETDOWN)
let const'Hash'ENOENT = KApply0(Lbl'Hash'ENOENT)
let const'Hash'Bottom = KApply0(Lbl'Hash'Bottom)
let const'Hash'ENFILE = KApply0(Lbl'Hash'ENFILE)
let const'Stop'Map = KApply0(Lbl'Stop'Map)
let const'Hash'ENETRESET = KApply0(Lbl'Hash'ENETRESET)
let const'Hash'EXDEV = KApply0(Lbl'Hash'EXDEV)
let const'Hash'ENXIO = KApply0(Lbl'Hash'ENXIO)
let const'Hash'ENOSYS = KApply0(Lbl'Hash'ENOSYS)
let constnewUUID_STRING = KApply0(LblnewUUID_STRING)
let const'Hash'EALREADY = KApply0(Lbl'Hash'EALREADY)
let const'Hash'EHOSTUNREACH = KApply0(Lbl'Hash'EHOSTUNREACH)
let const'Hash'ECONNRESET = KApply0(Lbl'Hash'ECONNRESET)
let const'Hash'ESOCKTNOSUPPORT = KApply0(Lbl'Hash'ESOCKTNOSUPPORT)
let const'Hash'EPROTONOSUPPORT = KApply0(Lbl'Hash'EPROTONOSUPPORT)
let const'Stop'Set = KApply0(Lbl'Stop'Set)
let const'Hash'EADDRINUSE = KApply0(Lbl'Hash'EADDRINUSE)
let const'Stop'List = KApply0(Lbl'Stop'List)
let const'Hash'EAFNOSUPPORT = KApply0(Lbl'Hash'EAFNOSUPPORT)
let const'Hash'EAGAIN = KApply0(Lbl'Hash'EAGAIN)
let const'Hash'False = KApply0(Lbl'Hash'False)
let const'Hash'configuration_K'Hyph'REFLECTION = KApply0(Lbl'Hash'configuration_K'Hyph'REFLECTION)
let const'Hash'ENOLCK = KApply0(Lbl'Hash'ENOLCK)
let const'Hash'EINTR = KApply0(Lbl'Hash'EINTR)
let const'Hash'EISDIR = KApply0(Lbl'Hash'EISDIR)
let constnoEnvCell = KApply0(LblnoEnvCell)
let const'Hash'ENOTTY = KApply0(Lbl'Hash'ENOTTY)
let const'Hash'EOVERFLOW = KApply0(Lbl'Hash'EOVERFLOW)
let const'Hash'EADDRNOTAVAIL = KApply0(Lbl'Hash'EADDRNOTAVAIL)
let const'Hash'ENOTEMPTY = KApply0(Lbl'Hash'ENOTEMPTY)
let const'Hash'ECONNABORTED = KApply0(Lbl'Hash'ECONNABORTED)
let const'Hash'ENOSPC = KApply0(Lbl'Hash'ENOSPC)
let const'Hash'ENOEXEC = KApply0(Lbl'Hash'ENOEXEC)
let const'Hash'EIO = KApply0(Lbl'Hash'EIO)
let const'Hash'EOF = KApply0(Lbl'Hash'EOF)
let const'Hash'ENOPROTOOPT = KApply0(Lbl'Hash'ENOPROTOOPT)
let const'Hash'ECHILD = KApply0(Lbl'Hash'ECHILD)
let const'Hash'EOPNOTSUPP = KApply0(Lbl'Hash'EOPNOTSUPP)
let const'Hash'EDESTADDRREQ = KApply0(Lbl'Hash'EDESTADDRREQ)
let const'Hash'EBADF = KApply0(Lbl'Hash'EBADF)
let const'Hash'ENOMEM = KApply0(Lbl'Hash'ENOMEM)
let const'Hash'ESRCH = KApply0(Lbl'Hash'ESRCH)
let const'Hash'EBUSY = KApply0(Lbl'Hash'EBUSY)
let constinitEnvCell = KApply0(LblinitEnvCell)
let const'Hash'stdout_K'Hyph'IO = KApply0(Lbl'Hash'stdout_K'Hyph'IO)
let const'Hash'ENOTDIR = KApply0(Lbl'Hash'ENOTDIR)
let const'Hash'ENOBUFS = KApply0(Lbl'Hash'ENOBUFS)
let const'Hash'ETIMEDOUT = KApply0(Lbl'Hash'ETIMEDOUT)
let const'Hash'ELOOP = KApply0(Lbl'Hash'ELOOP)
let const'Hash'argv = KApply0(Lbl'Hash'argv)
let const'Hash'stderr_K'Hyph'IO = KApply0(Lbl'Hash'stderr_K'Hyph'IO)
let const'Hash'EPERM = KApply0(Lbl'Hash'EPERM)
let const'Hash'EMLINK = KApply0(Lbl'Hash'EMLINK)
let const'Hash'True = KApply0(Lbl'Hash'True)
let const'Hash'EPIPE = KApply0(Lbl'Hash'EPIPE)
let const'Hash'ENAMETOOLONG = KApply0(Lbl'Hash'ENAMETOOLONG)
let const'Hash'ENODEV = KApply0(Lbl'Hash'ENODEV)
let const'Hash'ETOOMANYREFS = KApply0(Lbl'Hash'ETOOMANYREFS)
let const'Hash'EMFILE = KApply0(Lbl'Hash'EMFILE)
let const'Hash'EHOSTDOWN = KApply0(Lbl'Hash'EHOSTDOWN)
let const'Hash'EINVAL = KApply0(Lbl'Hash'EINVAL)
let const'Hash'EINPROGRESS = KApply0(Lbl'Hash'EINPROGRESS)
let const'Hash'stdin_K'Hyph'IO = KApply0(Lbl'Hash'stdin_K'Hyph'IO)
let const'Hash'EISCONN = KApply0(Lbl'Hash'EISCONN)
let const'Hash'EPROTOTYPE = KApply0(Lbl'Hash'EPROTOTYPE)
let const'Hash'EFBIG = KApply0(Lbl'Hash'EFBIG)
let const'Hash'ENETUNREACH = KApply0(Lbl'Hash'ENETUNREACH)
let const'Hash'EACCES = KApply0(Lbl'Hash'EACCES)
let const'Hash'EDEADLK = KApply0(Lbl'Hash'EDEADLK)
let const'Stop'List'LBraQuot'_'SCln'__MINI'Hyph'SML'Hyph'SYNTAX'QuotRBra' = KApply0(Lbl'Stop'List'LBraQuot'_'SCln'__MINI'Hyph'SML'Hyph'SYNTAX'QuotRBra')
let const'Hash'EROFS = KApply0(Lbl'Hash'EROFS)
let const'Hash'EEXIST = KApply0(Lbl'Hash'EEXIST)
let const'Hash'E2BIG = KApply0(Lbl'Hash'E2BIG)
let const'Hash'ESPIPE = KApply0(Lbl'Hash'ESPIPE)
let const'Hash'ThreadLocal = KApply0(Lbl'Hash'ThreadLocal)
let const'Hash'EFAULT = KApply0(Lbl'Hash'EFAULT)
let const'Hash'EDOM = KApply0(Lbl'Hash'EDOM)
let const'Hash'ESHUTDOWN = KApply0(Lbl'Hash'ESHUTDOWN)
let val_for (c: klabel) (k : k) (v : k) : normal_kitem = match c with
|_ -> KApply((el_for c), [k;v])
