# Always be at the latest core.
use v6.*;
use lib 't/packages';
use Test;
use Test::Helpers;
plan 3;

# output of "perl6 -e '.say for CORE::.keys.sort.map: { qq:!c/  Q{$_},/ }'"
my @allowed =
    c => (
      Q{!INIT_VALUES},
      Q{$!},
      Q{$/},
      Q{$=pod},
      Q{$?BITS},
      Q{$?COMPILATION-ID},
      Q{$?NL},
      Q{$?TABSTOP},
      Q{$_},
      Q{&CLONE-HASH-DECONTAINERIZED},
      Q{&CLONE-LIST-DECONTAINERIZED},
      Q{&COMP_EXCEPTION},
      Q{CORE-SETTING-REV},
      Q{&CREATE_RATIONAL_FROM_INTS},
      Q{&DEPRECATED},
      Q{&DIVIDE_NUMBERS},
      Q{&DUMP},
      Q{&DYNAMIC},
      Q{&DYNAMIC-FALLBACK},
      Q{&ENUM_VALUES},
      Q{&EVAL},
      Q{&EVALFILE},
      Q{&EXCEPTION},
      Q{&GATHER},
      Q{&GENERATE-ROLE-FROM-VALUE},
      Q{&HOW},
      Q{&HYPER},
      Q{&HYPERWHATEVER},
      Q{&INDIRECT_NAME_LOOKUP},
      Q{&MD-ARRAY-SLICE},
      Q{&MD-ARRAY-SLICE-ONE-POSITION},
      Q{&METAOP_ASSIGN},
      Q{&METAOP_CROSS},
      Q{&METAOP_HYPER},
      Q{&METAOP_HYPER_CALL},
      Q{&METAOP_HYPER_POSTFIX},
      Q{&METAOP_HYPER_POSTFIX_ARGS},
      Q{&METAOP_HYPER_PREFIX},
      Q{&METAOP_NEGATE},
      Q{&METAOP_REDUCE_CHAIN},
      Q{&METAOP_REDUCE_LEFT},
      Q{&METAOP_REDUCE_LIST},
      Q{&METAOP_REDUCE_LISTINFIX},
      Q{&METAOP_REDUCE_RIGHT},
      Q{&METAOP_REDUCE_XOR},
      Q{&METAOP_REVERSE},
      Q{&METAOP_TEST_ASSIGN:<&&>},
      Q{&METAOP_TEST_ASSIGN:<//>},
      Q{&METAOP_TEST_ASSIGN:<and>},
      Q{&METAOP_TEST_ASSIGN:<andthen>},
      Q{&METAOP_TEST_ASSIGN:<notandthen>},
      Q{&METAOP_TEST_ASSIGN:<or>},
      Q{&METAOP_TEST_ASSIGN:<orelse>},
      Q{&METAOP_TEST_ASSIGN:<||>},
      Q{&METAOP_ZIP},
      Q{&ORDER},
      Q{&POSITIONS},
      Q{&QX},
      Q{&REACT},
      Q{&REACT-ONE-WHENEVER},
      Q{&REQUIRE_IMPORT},
      Q{&RETURN-LIST},
      Q{&RUN-MAIN},
      Q{&SEQUENCE},
      Q{&SLICE_MORE_HASH},
      Q{&SLICE_MORE_LIST},
      Q{&SLICE_ONE_HASH},
      Q{&SLICE_ONE_LIST},
      Q{&SUPPLY},
      Q{&SUPPLY-ONE-EMIT},
      Q{&SUPPLY-ONE-WHENEVER},
      Q{&THROW},
      Q{&THROW-NIL},
      Q{&UNBASE},
      Q{&UNBASE_BRACKET},
      Q{&VAR},
      Q{&WHAT},
      Q{&WHENEVER},
      Q{&abs},
      Q{&acos},
      Q{&acosec},
      Q{&acosech},
      Q{&acosh},
      Q{&acotan},
      Q{&acotanh},
      Q{&all},
      Q{&any},
      Q{&append},
      Q{&asec},
      Q{&asech},
      Q{&asin},
      Q{&asinh},
      Q{&atan},
      Q{&atan2},
      Q{&atanh},
      Q{&atomic-add-fetch},
      Q{&atomic-assign},
      Q{&atomic-dec-fetch},
      Q{&atomic-fetch},
      Q{&atomic-fetch-add},
      Q{&atomic-fetch-dec},
      Q{&atomic-fetch-inc},
      Q{&atomic-fetch-sub},
      Q{&atomic-inc-fetch},
      Q{&atomic-sub-fetch},
      Q{&await},
      Q{&bag},
      Q{&cache},
      Q{&callframe},
      Q{&callsame},
      Q{&callwith},
      Q{&cas},
      Q{&categorize},
      Q{&ceiling},
      Q{&chars},
      Q{&chdir},
      Q{&chmod},
      Q{&chomp},
      Q{&chop},
      Q{&chr},
      Q{&chrs},
      Q{&circumfix:<:{ }>},
      Q{&circumfix:<[ ]>},
      Q{&circumfix:<{ }>},
      Q{&cis},
      Q{&classify},
      Q{&close},
      Q{&comb},
      Q{&combinations},
      Q{&copy},
      Q{&cos},
      Q{&cosec},
      Q{&cosech},
      Q{&cosh},
      Q{&cotan},
      Q{&cotanh},
      Q{&cross},
      Q{&dd},
      Q{&deepmap},
      Q{&defined},
      Q{&die},
      Q{&dir},
      Q{&done},
      Q{&duckmap},
      Q{&elems},
      Q{&emit},
      Q{&end},
      Q{&exit},
      Q{&exp},
      Q{&expmod},
      Q{&fail},
      Q{&fc},
      Q{&first},
      Q{&flat},
      Q{&flip},
      Q{&floor},
      Q{&from-json},
      Q{&full-barrier},
      Q{&get},
      Q{&getc},
      Q{&gethostname},
      Q{&gist},
      Q{&goto},
      Q{&grep},
      Q{&hash},
      Q{&index},
      Q{&indices},
      Q{&indir},
      Q{&infix:<!=>},
      Q{&infix:<!~~>},
      Q{&infix:<%%>},
      Q{&infix:<%>},
      Q{&infix:<&&>},
      Q{&infix:<&>},
      Q{&infix:<(&)>},
      Q{&infix:<(+)>},
      Q{&infix:<(-)>},
      Q{&infix:<(.)>},
      Q{&infix:<(^)>},
      Q{&infix:<(cont)>},
      Q{&infix:<(elem)>},
      Q{&infix:<(|)>},
      Q{&infix:<**>},
      Q{&infix:<*>},
      Q{&infix:<+&>},
      Q{&infix:<+>},
      Q{&infix:<+^>},
      Q{&infix:<+|>},
      Q{&infix:<,>},
      Q{&infix:<->},
      Q{&infix:<...>},
      Q{&infix:<...^>},
      Q{&infix:<^...>},
      Q{&infix:<^...^>},
      Q{&infix:<..>},
      Q{&infix:<..^>},
      Q{&infix:<//>},
      Q{&infix:</>},
      Q{&infix:<=:=>},
      Q{&infix:<===>},
      Q{&infix:<==>},
      Q{&infix:<=>},
      Q{&infix:<=~=>},
      Q{&infix:<=~>},
      Q{&infix:<?&>},
      Q{&infix:<?^>},
      Q{&infix:<?|>},
      Q{&infix:<X>},
      Q{&infix:<Z>},
      Q{&infix:<^..>},
      Q{&infix:<^..^>},
      Q{&infix:<^>},
      Q{&infix:<^^>},
      Q{&infix:<after>},
      Q{&infix:<and>},
      Q{&infix:<andthen>},
      Q{&infix:<before>},
      Q{&infix:<but>},
      Q{&infix:<cmp>},
      Q{&infix:<coll>},
      Q{&infix:<div>},
      Q{&infix:<does>},
      Q{&infix:<eq>},
      Q{&infix:<eqv>},
      Q{&infix:<gcd>},
      Q{&infix:<ge>},
      Q{&infix:<gt>},
      Q{&infix:<lcm>},
      Q{&infix:<le>},
      Q{&infix:<leg>},
      Q{&infix:<lt>},
      Q{&infix:<max>},
      Q{&infix:<min>},
      Q{&infix:<minmax>},
      Q{&infix:<mod>},
      Q{&infix:<ne>},
      Q{&infix:<notandthen>},
      Q{&infix:<o>},
      Q{&infix:<or>},
      Q{&infix:<orelse>},
      Q{&infix:<unicmp>},
      Q{&infix:<x>},
      Q{&infix:<xor>},
      Q{&infix:<xx>},
      Q{&infix:<|>},
      Q{&infix:<||>},
      Q{&infix:<~&>},
      Q{&infix:<~>},
      Q{&infix:<~^>},
      Q{&infix:<~|>},
      Q{&infix:<~~>},
      Q{&infix:<×>},
      Q{&infix:<÷>},
      Q{&infix:<…>},
      Q{&infix:<…^>},
      Q{&infix:<^…>},
      Q{&infix:<^…^>},
      Q{&infix:<∈>},
      Q{&infix:<∉>},
      Q{&infix:<∋>},
      Q{&infix:<∌>},
      Q{&infix:<−>},
      Q{&infix:<∖>},
      Q{&infix:<∘>},
      Q{&infix:<∩>},
      Q{&infix:<∪>},
      Q{&infix:<≅>},
      Q{&infix:<≠>},
      Q{&infix:<≤>},
      Q{&infix:<≥>},
      Q{&infix:<≼>},
      Q{&infix:<≽>},
      Q{&infix:<⊂>},
      Q{&infix:<⊃>},
      Q{&infix:<⊄>},
      Q{&infix:<⊅>},
      Q{&infix:<⊆>},
      Q{&infix:<⊇>},
      Q{&infix:<⊈>},
      Q{&infix:<⊉>},
      Q{&infix:<⊍>},
      Q{&infix:<⊎>},
      Q{&infix:<⊖>},
      Q{&infix:<⚛+=>},
      Q{&infix:<⚛-=>},
      Q{&infix:<⚛=>},
      Q{&infix:<⚛−=>},
      Q{&infix:<(==)>},
      Q{&infix:<≡>},
      Q{&infix:<≢>},
      Q{&infix:«(<)»},
      Q{&infix:«(<+)»},
      Q{&infix:«(<=)»},
      Q{&infix:«(>)»},
      Q{&infix:«(>+)»},
      Q{&infix:«(>=)»},
      Q{&infix:«+<»},
      Q{&infix:«+>»},
      Q{&infix:«<=>»},
      Q{&infix:«<=»},
      Q{&infix:«<»},
      Q{&infix:«=>»},
      Q{&infix:«>=»},
      Q{&infix:«>»},
      Q{&infix:«~<»},
      Q{&infix:«~>»},
      Q{&is-prime},
      Q{&item},
      Q{&join},
      Q{&keys},
      Q{&kv},
      Q{&last},
      Q{&lastcall},
      Q{&lc},
      Q{&leave},
      Q{&lines},
      Q{&link},
      Q{&list},
      Q{&log},
      Q{&log10},
      Q{&log2},
      Q{&lsb},
      Q{&make},
      Q{&map},
      Q{&max},
      Q{&min},
      Q{&minmax},
      Q{&mix},
      Q{&mkdir},
      Q{&move},
      Q{&msb},
      Q{&next},
      Q{&nextcallee},
      Q{&nextsame},
      Q{&nextwith},
      Q{&nodemap},
      Q{&none},
      Q{&not},
      Q{&note},
      Q{&one},
      Q{&open},
      Q{&ord},
      Q{&ords},
      Q{&pair},
      Q{&pairs},
      Q{&parse-base},
      Q{&parse-names},
      Q{&permutations},
      Q{&pick},
      Q{&pop},
      Q{&postcircumfix:<[ ]>},
      Q{&postcircumfix:<[; ]>},
      Q{&postcircumfix:<{ }>},
      Q{&postcircumfix:<{; }>},
      Q{&postfix:<++>},
      Q{&postfix:<-->},
      Q{&postfix:<i>},
      Q{&postfix:<ⁿ>},
      Q{&postfix:<⚛++>},
      Q{&postfix:<⚛-->},
      Q{&prefix:<!>},
      Q{&prefix:<++>},
      Q{&prefix:<++⚛>},
      Q{&prefix:<+>},
      Q{&prefix:<+^>},
      Q{&prefix:<-->},
      Q{&prefix:<--⚛>},
      Q{&prefix:<->},
      Q{&prefix:<?>},
      Q{&prefix:<?^>},
      Q{&prefix:<^>},
      Q{&prefix:<let>},
      Q{&prefix:<not>},
      Q{&prefix:<so>},
      Q{&prefix:<temp>},
      Q{&prefix:<|>},
      Q{&prefix:<~>},
      Q{&prefix:<~^>},
      Q{&prefix:<−>},
      Q{&prefix:<⚛>},
      Q{&prepend},
      Q{&print},
      Q{&printf},
      Q{&proceed},
      Q{&produce},
      Q{&prompt},
      Q{&push},
      Q{&put},
      Q{&rand},
      Q{&redo},
      Q{&reduce},
      Q{&rename},
      Q{&repeated},
      Q{&return},
      Q{&return-rw},
      Q{&reverse},
      Q{&rindex},
      Q{&rmdir},
      Q{&roll},
      Q{&roots},
      Q{&rotate},
      Q{&round},
      Q{&roundrobin},
      Q{&run},
      Q{&samecase},
      Q{&samemark},
      Q{&samewith},
      Q{&say},
      Q{&sec},
      Q{&sech},
      Q{&set},
      Q{&shell},
      Q{&shift},
      Q{&sign},
      Q{&signal},
      Q{&sin},
      Q{&sinh},
      Q{&sleep},
      Q{&sleep-timer},
      Q{&sleep-until},
      Q{&slip},
      Q{&slurp},
      Q{&so},
      Q{&sort},
      Q{&splice},
      Q{&split},
      Q{&sprintf},
      Q{&spurt},
      Q{&sqrt},
      Q{&squish},
      Q{&srand},
      Q{&subbuf-rw},
      Q{&substr},
      Q{&substr-rw},
      Q{&succeed},
      Q{&sum},
      Q{&symlink},
      Q{&take},
      Q{&take-rw},
      Q{&tan},
      Q{&tanh},
      Q{&tc},
      Q{&tclc},
      Q{&term:<now>},
      Q{&term:<time>},
      Q{&to-json},
      Q{&trait_mod:<does>},
      Q{&trait_mod:<handles>},
      Q{&trait_mod:<hides>},
      Q{&trait_mod:<is>},
      Q{&trait_mod:<of>},
      Q{&trait_mod:<returns>},
      Q{&trait_mod:<trusts>},
      Q{&trait_mod:<will>},
      Q{&trim},
      Q{&trim-leading},
      Q{&trim-trailing},
      Q{&truncate},
      Q{&uc},
      Q{&undefine},
      Q{&unimatch},
      Q{&uniname},
      Q{&uninames},
      Q{&uniparse},
      Q{&uniprop},
      Q{&uniprop-bool},
      Q{&uniprop-int},
      Q{&uniprop-str},
      Q{&uniprops},
      Q{&unique},
      Q{&unival},
      Q{&univals},
      Q{&unlink},
      Q{&unpolar},
      Q{&unshift},
      Q{&val},
      Q{&values},
      Q{&warn},
      Q{&wordcase},
      Q{&words},
      Q{&zip},
      Q{AST},
      Q{Any},
      Q{Array},
      Q{Associative},
      Q{Attribute},
      Q{Awaitable},
      Q{Awaiter},
      Q{Backtrace},
      Q{Bag},
      Q{BagHash},
      Q{Baggy},
      Q{BigEndian},
      Q{Blob},
      Q{Block},
      Q{Bool},
      Q{Broken},
      Q{Buf},
      Q{CX},
      Q{CallFrame},
      Q{Callable},
      Q{Cancellation},
      Q{Capture},
      Q{Channel},
      Q{Code},
      Q{Collation},
      Q{CompUnit},
      Q{Compiler},
      Q{Complex},
      Q{ComplexStr},
      Q{ContainerDescriptor},
      Q{Cool},
      Q{CurrentThreadScheduler},
      Q{Cursor},
      Q{Date},
      Q{DateTime},
      Q{Dateish},
      Q{Deprecation},
      Q{Distribution},
      Q{Distro},
      Q{Duration},
      Q{EXPORTHOW},
      Q{Empty},
      Q{Encoding},
      Q{Endian},
      Q{Enumeration},
      Q{Exception},
      Q{Exceptions},
      Q{Failure},
      Q{False},
      Q{FatRat},
      Q{FileChangeEvent},
      Q{FileChanged},
      Q{FileRenamed},
      Q{ForeignCode},
      Q{Grammar},
      Q{HardRoutine},
      Q{Hash},
      Q{Hyper},
      Q{HyperConfiguration},
      Q{HyperSeq},
      Q{HyperWhatever},
      Q{IO},
      Q{Inf},
      Q{Instant},
      Q{Int},
      Q{IntAttrRef},
      Q{IntLexRef},
      Q{IntPosRef},
      Q{IntStr},
      Q{Iterable},
      Q{IterationBuffer},
      Q{IterationEnd},
      Q{Iterator},
      Q{JSONException},
      Q{Junction},
      Q{Kept},
      Q{Kernel},
      Q{Label},
      Q{Less},
      Q{List},
      Q{LittleEndian},
      Q{Lock},
      Q{Macro},
      Q{Map},
      Q{Match},
      Q{Metamodel},
      Q{Method},
      Q{MethodDispatcher},
      Q{Mix},
      Q{MixHash},
      Q{Mixy},
      Q{More},
      Q{Mu},
      Q{MultiDispatcher},
      Q{NFC},
      Q{NFD},
      Q{NFKC},
      Q{NFKD},
      Q{NQPMatchRole},
      Q{NQPdidMATCH},
      Q{NaN},
      Q{NativeEndian},
      Q{Nil},
      Q{Num},
      Q{NumAttrRef},
      Q{NumLexRef},
      Q{NumPosRef},
      Q{NumStr},
      Q{Numeric},
      Q{NumericEnumeration},
      Q{NumericStringyEnumeration},
      Q{ObjAt},
      Q{Order},
      Q{PF_INET},
      Q{PF_INET6},
      Q{PF_LOCAL},
      Q{PF_MAX},
      Q{PF_UNIX},
      Q{PF_UNSPEC},
      Q{PROCESS},
      Q{PROTO_TCP},
      Q{PROTO_UDP},
      Q{Pair},
      Q{Parameter},
      Q{Perl},
      Q{PhasersList},
      Q{Planned},
      Q{Pod},
      Q{Positional},
      Q{PositionalBindFailover},
      Q{PredictiveIterator},
      Q{Proc},
      Q{Promise},
      Q{PromiseStatus},
      Q{ProtocolFamily},
      Q{ProtocolType},
      Q{Proxy},
      Q{PseudoStash},
      Q{QuantHash},
      Q{REPL},
      Q{RaceSeq},
      Q{Raku},
      Q{RakuAST},
      Q{Rakudo},
      Q{Range},
      Q{Rat},
      Q{RatStr},
      Q{Rational},
      Q{Real},
      Q{Regex},
      Q{Routine},
      Q{SIGABRT},
      Q{SIGALRM},
      Q{SIGBREAK},
      Q{SIGBUS},
      Q{SIGCHLD},
      Q{SIGCONT},
      Q{SIGEMT},
      Q{SIGFPE},
      Q{SIGHUP},
      Q{SIGILL},
      Q{SIGINFO},
      Q{SIGINT},
      Q{SIGIO},
      Q{SIGKILL},
      Q{SIGPIPE},
      Q{SIGPROF},
      Q{SIGPWR},
      Q{SIGQUIT},
      Q{SIGSEGV},
      Q{SIGSTKFLT},
      Q{SIGSTOP},
      Q{SIGSYS},
      Q{SIGTERM},
      Q{SIGTHR},
      Q{SIGTRAP},
      Q{SIGTSTP},
      Q{SIGTTIN},
      Q{SIGTTOU},
      Q{SIGURG},
      Q{SIGUSR1},
      Q{SIGUSR2},
      Q{SIGVTALRM},
      Q{SIGWINCH},
      Q{SIGXCPU},
      Q{SIGXFSZ},
      Q{SOCK_DGRAM},
      Q{SOCK_MAX},
      Q{SOCK_PACKET},
      Q{SOCK_RAW},
      Q{SOCK_RDM},
      Q{SOCK_SEQPACKET},
      Q{SOCK_STREAM},
      Q{Same},
      Q{Scalar},
      Q{Scheduler},
      Q{SeekFromBeginning},
      Q{SeekFromCurrent},
      Q{SeekFromEnd},
      Q{SeekType},
      Q{Semaphore},
      Q{Seq},
      Q{Sequence},
      Q{Set},
      Q{SetHash},
      Q{Setty},
      Q{Signal},
      Q{Signature},
      Q{Slang},
      Q{Slip},
      Q{SocketType},
      Q{SoftRoutine},
      Q{Stash},
      Q{Str},
      Q{StrAttrRef},
      Q{StrDistance},
      Q{StrLexRef},
      Q{StrPosRef},
      Q{Stringy},
      Q{StringyEnumeration},
      Q{Sub},
      Q{Submethod},
      Q{Supplier},
      Q{Supply},
      Q{Systemic},
      Q{Tap},
      Q{Tappable},
      Q{Thread},
      Q{ThreadPoolScheduler},
      Q{True},
      Q{UINT64_UPPER},
      Q{UInt},
      Q{Uni},
      Q{VM},
      Q{ValueObjAt},
      Q{Variable},
      Q{Version},
      Q{WalkList},
      Q{Whatever},
      Q{WhateverCode},
      Q{WrapDispatcher},
      Q{X},
      Q{array},
      Q{atomicint},
      Q{blob16},
      Q{blob32},
      Q{blob64},
      Q{blob8},
      Q{buf16},
      Q{buf32},
      Q{buf64},
      Q{buf8},
      Q{byte},
      Q{e},
      Q{i},
      Q{int},
      Q{int16},
      Q{int32},
      Q{int64},
      Q{int8},
      Q{num},
      Q{num32},
      Q{num64},
      Q{pi},
      Q{str},
      Q{tau},
      Q{uint},
      Q{uint16},
      Q{uint32},
      Q{uint64},
      Q{uint8},
      Q{utf16},
      Q{utf32},
      Q{utf8},
      Q{π},
      Q{τ},
      Q{𝑒},
    ),
    d => (
        Q{$!},
        Q{$/},
        Q{$=pod},
        Q{$_},
        Q{$¢},
        Q{&REACT},
        Q{&REACT-ONE-WHENEVER},
        Q{&await},
        Q{&infix:<≼>},
        Q{&infix:<≽>},
        Q{&infix:«(<+)»},
        Q{&infix:«(>+)»},
        Q{&undefine},
        Q{CORE-SETTING-REV},
    ),
    e => (
        Q{$!},
        Q{$/},
        Q{$=pod},
        Q{$_},
        Q{$¢},
        Q{&sprintf},
        Q{CORE-SETTING-REV},
        Q{Formatter},
        Q{Grammar},
        Q{PseudoStash},
    );

for @allowed -> (:key($rev), :value(@syms)) {
    has-symbols(CORE::{"v6$rev"}.WHO, @syms, "Symbols in CORE::v6{$rev}");
}

# vim: expandtab shiftwidth=4
