/**
   This is a small example of a standalone text substitution scanner 
   It reads a name after the keyword name and substitutes all occurences 
   of "hello" with "hello <name>!". There is a sample input file 
   "sample.inp" provided in this directory 
*/

package org.jflex.example;

import java.io.*;
import java.util.*;

%%

%public
%class JFlexExample
%standalone

%unicode

%{
  static String service;
  static String filter;
  String url = "https://graph.microsoft.com/v1.0/me";
  static String search;
  
  public static void getUrl(String text) throws IOException {
		JFlexExample tokenizer = new JFlexExample(new StringReader(text));
		while(tokenizer.yylex() != JFlexExample.YYEOF){};
		String url = "https://graph.microsoft.com/v1.0/me";
		String finalUrl = url + "/" + service + "?$search=" + search;
		System.out.println(finalUrl);
  }
%}



WS = [ ]+
PFX_KW = {WS}

IDX = (_) (
	[0-9] |
	[1-9][0-9] |
	[1-9][0-9][0-9]
)

NUM2D = {PFX_KW} [1-9]([0-9]{2})
NUM4D_NOSPACE = [1-9]([0-9]{3})
NUM4D = {PFX_KW} {NUM4D_NOSPACE}
NUM5D = {PFX_KW} [1-9]([0-9]{4})
TNUM = (
	"zero"|"one"|"two"|"three"|"four"|"five"|"six"|"seven"|"eight"|"nine"|"ten"|
	"eleven"|"twelve"|"thirteen"|"fourteen"|"fifteen"|"sixteen"|"seventeen"|
	"eighteen"|"nineteen"|"twenty"|"thirty"|"forty"|"fifty"|"sixty"|"seventy"|
	"eighty"|"ninety"|"hundred"|"thousand"|"million"|"billion"|"trillion"|
	"hundreds"|"thousands"|"millions"|"billions"|"trillions"|
	"lakh"|"lakhs"|"crore"|"crores"
)

PLURAL_OR_POSSESSIVE = ("'")?("s")?("'")?

TNUM_ABBR = (
	"k" | "m" | "b" | "t"
)

ORDINAL_NUM_SUFFIX = (
		"st"|"nd"|"rd"|"th"
)

KW_COMMA = {PFX_KW} ","
QSTRING = "QSTRING" {IDX}

KW_A = {PFX_KW} "a"
KW_AM = {PFX_KW} "am"
KW_ABOVE = {PFX_KW} "above"
KW_ACROSS = {PFX_KW} "across"
KW_AFTER = {PFX_KW} "after"
KW_AGO = {PFX_KW} "ago"
KW_ALL = {PFX_KW} "all"
KW_AN = {PFX_KW} "an"
KW_AND = {PFX_KW} "and"
KW_AND_SYM = {PFX_KW} "&"
KW_ANNUAL = {PFX_KW} "annual"
KW_ANNUALLY = {PFX_KW} "annually"
KW_ARE = {PFX_KW} "are"
KW_AS = {PFX_KW} "as"
KW_AT = {PFX_KW} "at"
KW_ATLEAST = {PFX_KW} "atleast"
KW_ATMOST = {PFX_KW} "atmost"
KW_AVERAGE = {PFX_KW} "average"
KW_AVG = {PFX_KW} ("avg" | "avg.")
KW_BE = {PFX_KW} "be"
KW_BEEN = {PFX_KW} "been"
KW_BEFORE = {PFX_KW} "before"
KW_BELOW = {PFX_KW} "below"
KW_BEST = {PFX_KW} "best"
KW_BETWEEN = {PFX_KW} "between"
KW_BOTTOM = {PFX_KW} "bottom"
KW_BUT = {PFX_KW} "but"
KW_BY = {PFX_KW} "by"
//KW_COMMA = {PFX_KW} ","
KW_COMPARE = {PFX_KW} ("compare" | "comparison")
KW_COMPARED_TO = {PFX_KW} ( ("compare"("d")?) {WS} "to" )
KW_CONTAIN = {PFX_KW} ("contain"("s")? | "containing")
KW_COUNT = {PFX_KW} "count"
KW_DAILY = {PFX_KW} "daily"
KW_DASH = {PFX_KW} "-"
KW_DATE = {PFX_KW} "date"("s")?
KW_DAY = {PFX_KW} "day"{PLURAL_OR_POSSESSIVE}
KW_DETAILS = {PFX_KW} "detail"("s")?
KW_DISTINCT = {PFX_KW} ("distinct")
KW_DO = {PFX_KW} ("do" | "did" | "done")
KW_DURING = {PFX_KW} ("during")
KW_EACH = {PFX_KW} "each"
KW_EARLIER = {PFX_KW} "earlier"
KW_EARLIEST = {PFX_KW} "earliest"
KW_EQ_SIGN = {PFX_KW} "="
KW_NOT_EQ_SIGN = {PFX_KW} "!="
KW_NOT =  {PFX_KW} "not"
KW_NON =  {PFX_KW} "non"
KW_NOT_IN =  {PFX_KW} "not in"
KW_NOT_FOR =  {PFX_KW} "not for"
KW_EXCEPT =  {PFX_KW} ("except"|"excepting"){PLURAL_OR_POSSESSIVE}
KW_EXCLUDE =  {PFX_KW}  ("exclude"("d")? | "excluding"){PLURAL_OR_POSSESSIVE}
KW_DB_NOT_EQ_SIGN =  {PFX_KW} "<>"
KW_EVERY = {PFX_KW} "every"
KW_FIRST = {PFX_KW} "first"
KW_1ST = {PFX_KW} "1st"
KW_FOR = {PFX_KW} "for"
KW_FOUR = {PFX_KW} "four"
KW_4 = {PFX_KW} "4"
KW_FOURTH = {PFX_KW} "fourth"
KW_4TH = {PFX_KW} "4th"
KW_FROM = {PFX_KW} "from"
KW_GET = {PFX_KW} ("get" | "got")
KW_GROUP = {PFX_KW} "group"
KW_GROUPED = {PFX_KW} "grouped"
KW_GT_EQ_SIGN = {PFX_KW} ">="
KW_GT_SIGN = {PFX_KW} ">"
KW_HAD = {PFX_KW} "had"
KW_HAS = {PFX_KW} "has"
KW_HAVE = {PFX_KW} "have"
KW_HAVING = {PFX_KW} "having"
KW_HASH = {PFX_KW} "#"
KW_HASHOF = {PFX_KW} "#of"
KW_HIGH = {PFX_KW} "high"
KW_HIGHEST = {PFX_KW} "highest"
KW_HIGHLY = {PFX_KW} "highly"
KW_HIGHER = {PFX_KW} "higher"
KW_HOT = {PFX_KW} "hot"
KW_HOTTEST = {PFX_KW} "hottest"
KW_HOW = {PFX_KW} "how"
KW_HOW_OFTEN = {PFX_KW} "how often"
KW_I = {PFX_KW} "I"
KW_IN = {PFX_KW} "in"
KW_IN_TERMS_OF = {PFX_KW} "in terms of"
KW_INFO = {PFX_KW} "info"
KW_INTO = {PFX_KW} "into"
KW_IS = {PFX_KW} "is"
KW_IT = {PFX_KW} "it"
KW_KM = {PFX_KW} "km"
KW_LARGEST = {PFX_KW} "largest"
KW_LAST = {PFX_KW} "last"
KW_END = {PFX_KW} "end"
KW_LATER= {PFX_KW} "later"
KW_LATEST = {PFX_KW} "latest"
KW_LEAST = {PFX_KW} "least"
KW_LESS = {PFX_KW} "less"
KW_LESSER = {PFX_KW} "lesser"
KW_LIMIT = {PFX_KW} "limit"
KW_LIKE = {PFX_KW} "like"
KW_LIST = {PFX_KW} "list"
KW_LOWER = {PFX_KW} "lower"
KW_LOWEST = {PFX_KW} ("lowest"|"poor")
KW_LONGEST = {PFX_KW} "longest"
KW_LT_EQ_SIGN = {PFX_KW} "<="
KW_LT_SIGN = {PFX_KW} "<"
KW_MANY = {PFX_KW} "many"
KW_MAX = {PFX_KW} "max"
KW_MAXIMUM = {PFX_KW} "maximum"
KW_ME = {PFX_KW} "me"
KW_MEAN = {PFX_KW} "mean"
KW_MIN = {PFX_KW} "min"
KW_MINIMUM = {PFX_KW} "minimum"
KW_MONTH = {PFX_KW} ("month"|"FM"|"fiscal month"){PLURAL_OR_POSSESSIVE}
KW_MONTHLY = {PFX_KW} "monthly"
KW_JAN = {PFX_KW} "jan"
KW_JANUARY = {PFX_KW} "january"
KW_FEB = {PFX_KW} "feb"
KW_FEBRUARY = {PFX_KW} "february"
KW_MAR = {PFX_KW} "mar"
KW_MARCH = {PFX_KW} "march"
KW_APR = {PFX_KW} "apr"
KW_APRIL = {PFX_KW} "april"
KW_MAY = {PFX_KW} "may"
KW_JUN = {PFX_KW} "jun"
KW_JUNE = {PFX_KW} "june"
KW_JUL = {PFX_KW} "jul"
KW_JULY = {PFX_KW} "july"
KW_AUG = {PFX_KW} "aug"
KW_AUGUST = {PFX_KW} "august"
KW_SEP = {PFX_KW} "sep"
KW_SEPTEMBER = {PFX_KW} "september"
KW_OCT = {PFX_KW} "oct"
KW_OCTOBER = {PFX_KW} "october"
KW_NOV = {PFX_KW} "nov"
KW_NOVEMBER = {PFX_KW} "november"
KW_DEC = {PFX_KW} "dec"
KW_DECEMBER = {PFX_KW} "december"
KW_MORE = {PFX_KW} "more"
KW_MOST = {PFX_KW} "most"
KW_GREATEST = {PFX_KW} "greatest"
KW_GREATER = {PFX_KW} "greater"
KW_MUCH = {PFX_KW} "much"
KW_MY = {PFX_KW} "my"
KW_NEXT= {PFX_KW} "next"
KW_NO = {PFX_KW} "no"
KW_NUM = {PFX_KW} ("num" | "no.")
KW_NUMBER = {PFX_KW} "number"
KW_OF = {PFX_KW} "of"
KW_OLDEST = {PFX_KW} "oldest"
KW_ON = {PFX_KW} "on"
KW_ONE = {PFX_KW} "one"
KW_POPULAR = {PFX_KW} "popular"
KW_1 = {PFX_KW} "1"
KW_OR = {PFX_KW} "or"
KW_OVER = {PFX_KW} "over"
KW_OVER = {PFX_KW} "over"
KW_PER = {PFX_KW} "per"
KW_PERCENTAGE = {PFX_KW} "percentage"
KW_GROWTH = {PFX_KW} ("growth"|"change in"|"grew"|"decline"|"drop"|"drops"|"dropped"|"declined"|"declines"|"decrease"|"decreases"|"decreased"|"increase"|"increases"|"increased"|"loss"|"gain"|"loses"|"lost"|"gains"|"gain/loss"|"trend"|"trends"|"trending"|"delta")
KW_VARIANCE = {PFX_KW} "variance"
KW_PERCENT = {PFX_KW} "percent"
KW_PERCENT_SIGN = {PFX_KW} "%"
KW_PREV = {PFX_KW} "prev"
KW_PREVIOUS = {PFX_KW} "previous"
KW_PAST = {PFX_KW} "past"
KW_Q1 = {PFX_KW} "Q1"
KW_Q2 = {PFX_KW} "Q2"
KW_Q3 = {PFX_KW} "Q3"
KW_Q4 = {PFX_KW} "Q4"
KW_QUARTER = {PFX_KW} ("quarter"|"FQ"|"fiscal quarter"){PLURAL_OR_POSSESSIVE}
KW_QUARTERLY = {PFX_KW} "quarterly"
KW_RANGE = {PFX_KW} "range"("s")?
KW_RECENT = {PFX_KW} "recent"
KW_RECENTLY = {PFX_KW} "recently"
KW_RECORDS = {PFX_KW} "record"("s")?
KW_SECOND = {PFX_KW} "second"
KW_2ND = {PFX_KW} "2nd"
KW_SHORTEST = {PFX_KW} "shortest"
KW_SHOW = {PFX_KW} "show"
KW_SINCE = {PFX_KW} "since"
KW_NOW = {PFX_KW} "now"
KW_SMALLEST = {PFX_KW} "smallest"
KW_SORT = {PFX_KW} "sort"
KW_STD_DEV = {PFX_KW} ("stddev" | "std dev" | "standard dev" | "standard deviation" | "std deviation")
KW_SPLIT = {PFX_KW} "split"
KW_SUCH = {PFX_KW} "such"
KW_SUM = {PFX_KW} "sum"
KW_THAN = {PFX_KW} "than"
KW_THAT = {PFX_KW} "that"
KW_THE = {PFX_KW} "the"
KW_THEIR = {PFX_KW} "their"
KW_THEN = {PFX_KW} "then"
KW_THERE = {PFX_KW} "there"
KW_THESE = {PFX_KW} "these"
KW_THEY = {PFX_KW} "they"
KW_THIRD = {PFX_KW} "third"
KW_TODAY = {PFX_KW} "today"{PLURAL_OR_POSSESSIVE}
KW_TOTAL = {PFX_KW} "total"
KW_3RD = {PFX_KW} "3rd"
KW_THIS = {PFX_KW} "this"
KW_YTD = {PFX_KW} "ytd"
KW_YTD_WITH_HIPHEN = {PFX_KW} "y-t-d"
KW_MTD = {PFX_KW} "mtd"
KW_MTD_WITH_HIPHEN = {PFX_KW} "m-t-d"
KW_WTD = {PFX_KW} "wtd"
KW_WTD_WITH_HIPHEN = {PFX_KW} "w-t-d"
KW_QTD = {PFX_KW} "qtd"
KW_QTD_WITH_HIPHEN = {PFX_KW} "q-t-d"
KW_CURRENT = {PFX_KW} "current"
KW_THREE = {PFX_KW} "three"
KW_3 = {PFX_KW} "3"
KW_TILL = {PFX_KW} "till"
KW_TIME = {PFX_KW} "time"
KW_TO = {PFX_KW} "to"
KW_TOMORROW = {PFX_KW} "tomorrow"{PLURAL_OR_POSSESSIVE}
KW_TOP = {PFX_KW} ("top"|"topped")
KW_TWO = {PFX_KW} "two"
KW_2 = {PFX_KW} "2"
KW_UNDER = {PFX_KW} "under"
KW_UNIQUE = {PFX_KW} ("unique"|"uniq")
KW_DOLLAR = {PFX_KW} ( "dollar"("s")? | "usd" )
KW_USAGE = {PFX_KW} "usage"
KW_USE = {PFX_KW} "use"
KW_VS = {PFX_KW} ("vs"|"v/s")
KW_VERSUS = {PFX_KW} "versus"
KW_WAS = {PFX_KW} "was"
KW_WEEK = {PFX_KW} "week"{PLURAL_OR_POSSESSIVE}
KW_WEEKLY = {PFX_KW} "weekly"
KW_WEEKEND = {PFX_KW} ("weekend"|"weekends")
KW_WEEKDAY = {PFX_KW} ("weekday"|"weekdays")
KW_WERE = {PFX_KW} "were"
KW_WHAT = {PFX_KW} "what"
KW_WHEN = {PFX_KW} "when"
KW_WHERE = {PFX_KW} "where"
KW_WHILE = {PFX_KW} "while"
KW_WHICH = {PFX_KW} "which"
KW_WILL = {PFX_KW} "will"
KW_WISE = {PFX_KW} "wise"
KW_WITH = {PFX_KW} "with"
KW_WITHOUT = {PFX_KW} "without"
KW_WITH_RESPECT_TO = {PFX_KW} ("with respect to" | "w.r.t" | "with resp to")
KW_WORST = {PFX_KW} "worst"
KW_YEAR = {PFX_KW} ("year"|"FY"|"fiscal year"){PLURAL_OR_POSSESSIVE}
KW_YEARLY = {PFX_KW} "yearly"
KW_HOUR = {PFX_KW} "hour"{PLURAL_OR_POSSESSIVE}
KW_HOURLY = {PFX_KW} "hourly"
KW_YESTERDAY = {PFX_KW} "yesterday"{PLURAL_OR_POSSESSIVE}
KW_YOY = {PFX_KW} ("YoY"|"y-o-y"|"annualized")
KW_MOM = {PFX_KW} ("MoM"|"m-o-m")
KW_QOQ = {PFX_KW} ("QoQ"|"q-o-q")
KW_WOW = {PFX_KW} ("WoW"|"w-o-w")
KW_PY  = {PFX_KW} ("PY")
KW_CY  = {PFX_KW} ("CY"|"calendar year")
KW_HOURWISE = {PFX_KW} "hourwise"
KW_DATEWISE = {PFX_KW} "datewise"
KW_WEEKWISE = {PFX_KW} "weekwise"
KW_MONTHWISE = {PFX_KW} "monthwise"
KW_QUARTERWISE = {PFX_KW} "quarterwise"
KW_YEARWISE = {PFX_KW} "yearwise"
KW_STARTS_WITH = {PFX_KW} (("start"|"begin")("s")? | ("starting"|"beginning")) {KW_WITH}
KW_ENDS_WITH = {PFX_KW} ("end"("s")? | "ending") {KW_WITH}

KW_HAS_BEEN = ({KW_HAS} | {KW_HAD} | {KW_HAVE}) {PFX_KW} "been"

KW_PREPOSITION = {PFX_KW} (
	"aboard" | "about" | "above" | "across" | "after" | "against" | "along" | "alongside" | "amid" | "amidst" | "among" | "amongst" |
	"anti" | "around" | "as" | "astride" | "at" | "atop" | "bar" | "barring" | "before" | "behind" | "below" | "beneath" | "beside" |
	"besides" | "between" | "beyond" | "but" | "by" | "circa" | "concerning" | "considering" | "counting" | "cum" | "despite" |
	"down" | "during" | "following" | "for" | "from" | "given" | "gone" | "in" | "including" |
	"inside" | "into" | "less" | "like" | "minus" | "near" | "notwithstanding" | "of" | "off" | "on" | "onto" | "on to" | "opposite" |
	"outside" | "over" | "past" | "pending" | "per" | "plus" | "pro" | "re" | "regarding" | "respecting" | "round" | "save" |
	"saving" | "since" | "than" | "through" | "thru" | "throughout" | "till" | "to" | "touching" | "toward" | "towards" | "under" |
	"underneath" | "unlike" | "until" | "up" | "upon" | "versus" | "via" | "with" | "within" | "without" | "worth"
)

KW_COMPLEX_PREPOSITION = {PFX_KW} (
	"according to" | "ahead of" | "à la" | "along with" | "apart from" | "as for" | "aside from" | "as per" | "as to" | "as well as" |
	"away from" | "because of" | "but for" | "by means of" | "close to" | "contrary to" | "depending on" | "due to" |
	"forward of" | "further to" | "in addition to" | "in between" | "in case of" | "in face of" | "in favour of" | "in front of" |
	"in lieu of" | "in spite of" | "instead of" | "in view of" | "irrespective of" | "near to" | "next to" | "on account of" |
	"on behalf of" | "on board" | "on to " | "onto" | "on top of" | "opposite to" | "other than" | "out of" | "outside of" |
	"owing to" | "preparatory to" | "prior to" | "regardless of" | "save for" | "thanks to" | "together with" | "up against" |
	"up to" | "up until" | "vis-à-vis" | "with reference to" | "with regard to"
)

KW_CONJUCTION = {PFX_KW} (
	"than" | "rather than" | "whether" | "as much as " | "whereas" | "though" | "although" | "even though" | "while" | "if " | "only if" |
	"unless" | "until" | "that" | "assuming that" | "even if " | "in case" | "lest" | "That" | "what" | "whatever" | "which" |
	"whichever" | "Who" | "whoever" | "whom" | "whomever" | "whose" | "where" | "wherever" | "how" | "as though" | "as if" | "after" |
	"as long as " | "as soon as " | "before" | "by the time" | "now that" | "once" | "since" | "till" | "until" | "when" | "whenever" |
	"while" | "because " | "since" | "so that" | "in order" | "why" | "For" | "And" | "Nor" | "But" | "Or" | "Yet" | "So"
)

KW_MISC_IGNORE =  (
		{PFX_KW} (
			(
				"show" ({WS} "me")? {WS} "my"
			) |
			(
				"what" {WS} ("is"|"are") ({WS} "my")?
			) |
			(
				"how" {WS} "much" {WS} ("is"|"are") {WS} "my"
			) |
			(
				"what" {WS} ("is"|"are") ({WS} "the")?
			) |
			(
				"distribution" | "breakdown" | "relation" | "ratio" | "display"
			)
		)
) |
(
	{KW_PREPOSITION} | {KW_COMPLEX_PREPOSITION} | {KW_CONJUCTION}
)

DASH_NO_SPACE = {WS}?-{WS}?
AND = {KW_AND} | {KW_AND_SYM}
SEQUENCE_PREFIX = ({KW_COMMA})? ( {AND} | {KW_COMMA} | {KW_OR} | {KW_VS} | {KW_VERSUS} | {KW_COMPARED_TO} )?

MONTH_NAME = (
	{KW_JAN} | {KW_JANUARY} | {KW_FEB} | {KW_FEBRUARY} | {KW_MAR} | {KW_MARCH} |
	{KW_APR} | {KW_APRIL} | {KW_MAY} | {KW_JUN} | {KW_JUNE} | {KW_JUL} | {KW_JULY} |
	{KW_AUG} | {KW_AUGUST} | {KW_SEP} | {KW_SEPTEMBER} | {KW_OCT} | {KW_OCTOBER} |
	{KW_NOV} | {KW_NOVEMBER} | {KW_DEC} | {KW_DECEMBER}
)

MONTH_NAME_SEQUENCE = {MONTH_NAME} ( {SEQUENCE_PREFIX} {MONTH_NAME})*
MONTH_NAME_YEAR = {MONTH_NAME} ({DASH_NO_SPACE} | {KW_COMMA} | {KW_DASH} | {KW_OF} )? {NUM4D}
MONTH_NAME_YEAR_SEQUENCE = {MONTH_NAME_YEAR} ( {SEQUENCE_PREFIX} {MONTH_NAME_YEAR} )*
YEAR_SEQUENCE = {NUM4D} ( ({SEQUENCE_PREFIX}) ({NUM4D} | {NUM2D}) )*
GREATER_THAN_EQ = {KW_GT_EQ_SIGN} | ( {KW_GT_SIGN} {KW_EQ_SIGN} )

//QUARTER SEQUENCES..
QUARTER_OF_YEAR = ({FIRST_QUARTER_OF_YEAR} | {SECOND_QUARTER_OF_YEAR} | {THIRD_QUARTER_OF_YEAR} | {FOURTH_QUARTER_OF_YEAR})
QUARTER_YEAR_SEQUENCE = {QUARTER_OF_YEAR}( {SEQUENCE_PREFIX} {QUARTER_OF_YEAR} )*

//LAST = {KW_LAST} | {KW_PREV} | ( {KW_MOST} {KW_RECENT} )
ONE = {KW_ONE} | {KW_1}
TWO = {KW_TWO} | {KW_2}
THREE = {KW_THREE} | {KW_3}
FOUR = {KW_FOUR} | {KW_4}
FIRST = {KW_FIRST} | {KW_1ST}
SECOND = {KW_SECOND} | {KW_2ND}
THIRD = {KW_THIRD} | {KW_3RD}
FOURTH = {KW_FOURTH} | {KW_4TH}

YOY = (
	(
		{KW_YEAR} {DASH_NO_SPACE}? ({KW_OVER} | {KW_ON}) {DASH_NO_SPACE}? {KW_YEAR}
	) |
	(
		"year-over-year"
	) |
	(
		"year-on-year"
	) |
	(
		{KW_YOY}
	)
)

MOM = (
	(
		{KW_MONTH} {DASH_NO_SPACE}? ({KW_OVER} | {KW_ON}) {DASH_NO_SPACE}? {KW_MONTH}
	) |
	(
		"month-over-month"
	) |
	(
		"month-on-month"
	) |
	(
		{KW_MOM}
	)
)

QOQ = (
	(
		{KW_QUARTER} {DASH_NO_SPACE}? ({KW_OVER} | {KW_ON}) {DASH_NO_SPACE}? {KW_QUARTER}
	) |
	(
		"quarter-over-quarter"
	) |
	(
		"quarter-on-quarter"
	) |
	(
		{KW_QOQ}
	)
)

WOW = (
	(
		{KW_WEEK} {DASH_NO_SPACE}? {KW_OVER} {DASH_NO_SPACE}? {KW_WEEK}
	) |
	(
		"week-over-week"
	) |
	(
		{KW_WOW}
	) |
	(
		"week-on-week"
	) |
	(
		{KW_WEEK} {DASH_NO_SPACE}? {KW_ON} {DASH_NO_SPACE}? {KW_WEEK}
	)
)

OVER_TIME = (
	{KW_OVER} {KW_TIME}
)

BY_HOUR = (
	(
		{KW_BY} {KW_HOUR}
	) |
	(
		{KW_HOUR} {KW_WISE}
	) |
	(
		{KW_PER} {KW_HOUR}
	) |
	(
		{KW_ACROSS} {KW_HOUR}
	) |
	(
		{KW_EACH} {KW_HOUR}
	) |
	(
		{KW_EVERY} {KW_HOUR}
	) |
	(
		{KW_EACH} {AND}? {KW_EVERY}? {KW_HOUR}
	) |
	(
		{KW_HOURLY}
	) |
	(
		{KW_HOURWISE}
	)
)

BY_YEAR = (
	(
		{KW_YEAR}
	) |
	(
		{KW_YEARLY}
	) |
	(
		{KW_YEARWISE}
	) |
	(
		{KW_ANNUAL}
	) |
	(
		{KW_ANNUALLY}
	) |
	(
		{YOY}
	)
)

BY_QUARTER = (
	(
		{KW_QUARTER}
	) |
	(
		{KW_QUARTERLY}
	) |
	(
		{KW_QUARTERWISE}
	) |
	(
		{QOQ}
	)
)

BY_MONTH = (
	(
		{KW_MONTH}
	) |
	(
		{KW_MONTHLY}
	) |
	(
		{KW_MONTHWISE}
	) |
	(
		{MOM}
	)
)

KW_YEARLY = {PFX_KW} "yearly"
KW_ATTACHMENT = {PFX_KW} "attachment"{PLURAL_OR_POSSESSIVE}
KW_IMPORTATNT = {PFX_KW} "importan"("t")?("ce")?


/**SERVICES**/

PFX_MESSAGING = (("mail") | ("message"))
PFX_MESSAGING_SERVICE = ({PFX_KW}{PFX_MESSAGING}{PLURAL_OR_POSSESSIVE})


%%

{PFX_MESSAGING_SERVICE} { service = "messages"; }
{KW_IMPORTATNT} { filter = "importance eq 'high'"; }
{KW_HIGH} { filter = "importance eq 'high'"; }
{KW_FROM} { search = "from:" + yytext(); }

