module

public import Conjectures.FranklSmallCyclicRowCoverage
public import Conjectures.FranklSmallCyclicCanonicalWords
public import Conjectures.FranklSmallCyclicOrbit7Block012Data

/-! 24 literal targets sharing one source proof block.
Original words and row indices are retained; weights may be transported.
-/
@[expose] public section

namespace FranklSmallCyclic.TransportBatches.G012.B003.Data

-- Period 7, original row 8518, representative 1564.
def source0 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B012.Data.entryAt ⟨15, by decide +kernel⟩

def target0 : Weights.Entry :=
  { word := [12, 0, 12, 2, 0, 2, 0], weights := [0, 1, 0, 0] }

def points0 : List (ℕ × ℕ) := [(0, 2), (1, 0), (2, 1), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8520, representative 1566.
def source1 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B012.Data.entryAt ⟨17, by decide +kernel⟩

def target1 : Weights.Entry :=
  { word := [12, 0, 12, 2, 0, 8, 0], weights := [0, 1, 0, 0] }

def points1 : List (ℕ × ℕ) := [(0, 2), (1, 0), (2, 1), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8530, representative 1560.
def source2 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B012.Data.entryAt ⟨11, by decide +kernel⟩

def target2 : Weights.Entry :=
  { word := [12, 0, 12, 2, 0, 10, 0], weights := [0, 1, 0, 0] }

def points2 : List (ℕ × ℕ) := [(0, 2), (1, 0), (2, 1), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8532, representative 1565.
def source3 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B012.Data.entryAt ⟨16, by decide +kernel⟩

def target3 : Weights.Entry :=
  { word := [12, 0, 12, 2, 8, 2, 0], weights := [0, 1, 0, 0] }

def points3 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8536, representative 1561.
def source4 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B012.Data.entryAt ⟨12, by decide +kernel⟩

def target4 : Weights.Entry :=
  { word := [12, 0, 12, 2, 8, 10, 0], weights := [0, 1, 0, 0] }

def points4 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8538, representative 1558.
def source5 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B012.Data.entryAt ⟨9, by decide +kernel⟩

def target5 : Weights.Entry :=
  { word := [12, 0, 12, 4, 4, 0, 0], weights := [0, 0, 1, 0] }

def points5 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 4), (5, 5), (6, 3)]

-- Period 7, original row 8540, representative 1556.
def source6 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B012.Data.entryAt ⟨7, by decide +kernel⟩

def target6 : Weights.Entry :=
  { word := [12, 0, 12, 4, 4, 8, 0], weights := [0, 0, 1, 0] }

def points6 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8542, representative 1555.
def source7 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B012.Data.entryAt ⟨6, by decide +kernel⟩

def target7 : Weights.Entry :=
  { word := [12, 0, 12, 8, 4, 2, 0], weights := [0, 1, 1, 0] }

def points7 : List (ℕ × ℕ) := [(0, 2), (1, 0), (2, 1), (3, 6), (4, 4), (5, 5), (6, 3)]

-- Period 7, original row 8544, representative 1554.
def source8 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B012.Data.entryAt ⟨5, by decide +kernel⟩

def target8 : Weights.Entry :=
  { word := [12, 0, 12, 8, 4, 10, 0], weights := [0, 1, 1, 0] }

def points8 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8576, representative 1557.
def source9 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B012.Data.entryAt ⟨8, by decide +kernel⟩

def target9 : Weights.Entry :=
  { word := [12, 0, 12, 12, 4, 8, 0], weights := [0, 0, 1, 0] }

def points9 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 8, original row 510, representative 1594.
def source10 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B012.Data.entryAt ⟨45, by decide +kernel⟩

def target10 : Weights.Entry :=
  { word := [0, 4, 0, 4, 2, 0, 9], weights := [0, 0, 1, 0] }

def points10 : List (ℕ × ℕ) := [(0, 7), (1, 0), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 8, original row 511, representative 1577.
def source11 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B012.Data.entryAt ⟨28, by decide +kernel⟩

def target11 : Weights.Entry :=
  { word := [0, 4, 0, 4, 2, 0, 10], weights := [0, 0, 1, 0] }

def points11 : List (ℕ × ℕ) := [(0, 7), (1, 0), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 8, original row 512, representative 1594.
def source12 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B012.Data.entryAt ⟨45, by decide +kernel⟩

def target12 : Weights.Entry :=
  { word := [0, 4, 0, 4, 2, 0, 12], weights := [1, 0, 0, 0] }

def points12 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 5), (4, 4), (5, 3), (6, 6)]

-- Period 8, original row 532, representative 1564.
def source13 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B012.Data.entryAt ⟨15, by decide +kernel⟩

def target13 : Weights.Entry :=
  { word := [0, 4, 0, 4, 10, 0, 9], weights := [0, 0, 1, 0] }

def points13 : List (ℕ × ℕ) := [(0, 7), (1, 0), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 8, original row 533, representative 1558.
def source14 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B012.Data.entryAt ⟨9, by decide +kernel⟩

def target14 : Weights.Entry :=
  { word := [0, 4, 0, 4, 10, 0, 10], weights := [0, 0, 1, 0] }

def points14 : List (ℕ × ℕ) := [(0, 7), (1, 0), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 8, original row 534, representative 1590.
def source15 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B012.Data.entryAt ⟨41, by decide +kernel⟩

def target15 : Weights.Entry :=
  { word := [0, 4, 0, 4, 10, 0, 12], weights := [1, 0, 0, 1] }

def points15 : List (ℕ × ℕ) := [(0, 7), (1, 0), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 8, original row 2402, representative 1655.
def source16 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B012.Data.entryAt ⟨106, by decide +kernel⟩

def target16 : Weights.Entry :=
  { word := [2, 0, 0, 12, 0, 12, 4], weights := [1, 0, 1, 0] }

def points16 : List (ℕ × ℕ) := [(0, 7), (1, 0), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 8, original row 3189, representative 1655.
def source17 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B012.Data.entryAt ⟨106, by decide +kernel⟩

def target17 : Weights.Entry :=
  { word := [2, 10, 0, 10, 0, 0, 4], weights := [0, 1, 0, 1] }

def points17 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 8, original row 4517, representative 1594.
def source18 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B012.Data.entryAt ⟨45, by decide +kernel⟩

def target18 : Weights.Entry :=
  { word := [8, 1, 4, 2, 0, 2, 0], weights := [0, 1, 0, 0] }

def points18 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 8, original row 4606, representative 1564.
def source19 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B012.Data.entryAt ⟨15, by decide +kernel⟩

def target19 : Weights.Entry :=
  { word := [8, 1, 12, 2, 0, 2, 0], weights := [0, 1, 0, 0] }

def points19 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 8, original row 7423, representative 1594.
def source20 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B012.Data.entryAt ⟨45, by decide +kernel⟩

def target20 : Weights.Entry :=
  { word := [10, 0, 4, 2, 0, 2, 0], weights := [0, 0, 0, 1] }

def points20 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 4), (4, 5), (5, 6), (6, 3)]

-- Period 8, original row 7540, representative 1590.
def source21 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B012.Data.entryAt ⟨41, by decide +kernel⟩

def target21 : Weights.Entry :=
  { word := [10, 0, 12, 2, 0, 2, 0], weights := [1, 0, 0, 1] }

def points21 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 8, original row 8429, representative 1577.
def source22 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B012.Data.entryAt ⟨28, by decide +kernel⟩

def target22 : Weights.Entry :=
  { word := [12, 0, 4, 2, 0, 2, 0], weights := [0, 0, 0, 1] }

def points22 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 4), (4, 5), (5, 6), (6, 3)]

-- Period 8, original row 8518, representative 1558.
def source23 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B012.Data.entryAt ⟨9, by decide +kernel⟩

def target23 : Weights.Entry :=
  { word := [12, 0, 12, 2, 0, 2, 0], weights := [0, 1, 0, 0] }

def points23 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

def period7Entries : List Weights.Entry := [target0, target1, target2, target3, target4, target5, target6, target7, target8, target9]

def period7Chunk : RowCoverage.Chunk where
  rows := [⟨8518, target0⟩, ⟨8520, target1⟩, ⟨8530, target2⟩, ⟨8532, target3⟩, ⟨8536, target4⟩, ⟨8538, target5⟩, ⟨8540, target6⟩, ⟨8542, target7⟩, ⟨8544, target8⟩, ⟨8576, target9⟩]
  indexMask := 42977664811714000532418598877372903134061859796588221479570197451213223930949057347027895809200096154481837020037867985412521957322013804147787728886045575402985949771648025574533758964533145911501046753917373961166715835143405644027311217454082068363758958738336590878242391335377202480370565454179348280874290407140843949685228946567334298368923043069719949740166797997580768529372537702367227039462362911310219807565454630996645249815069163875257809588902998356679558772203346802198863545894515172107800305129248286274936540537134201784367189342071928905799298181158722286209943380380035214017567566608388463715892755284411346148282977094884419626641647020001346433179125276658688107496864576052999825692272442084975530244467034487064347299283395202296206260198211320233860651715607844057153078966370300909215306551466040239666365441187788057118888802385996247827926849669967787491453494992213082730117926466449809210331534473992855566348667070817904403842245951204369053507725398864870532735098817932513853544582410858270442690001112986609841937076522310328629687034686452063000259082459304053642508128443613454636894377428802264561383608767933192263285595550066826726090527463920119029304512068641457559344146853528455520098643481639100548106288575289560979199169238309063348019503575763777714259335273552325705773761632425121249644859003176502399379761657346541988008438880455958917766594678083958859596942186673805305493277141313939736038104425507642640720894098323281173656650667772786665092781466558218444230991279667693072895668573441964397944581483173300579560833141060100743852541485425822029196034117207011177627912440986017301366014370862382866726456672540629285588461046284983179090859979154618124040374058568944463252080277747848378837872988049074064992717833761847773683872183617187779177839059814587397344832475085483825745663908219450996779674418108158978621258646339803855739797934762608929217017229209329844000869037717830657205400290588614600834498442589671809341400809533988617525483136935341765757636282097766253290423633181782916609677480448272047450869610842985327786375350244090901518141266161519158130965379680520154111430492714514954328986211985571709570473297740805157694263827496236852127287019428596736657517094592387682506671435458834882212125499505269796866336610729542541301708126780999194969452721476302406118129285548315886286341686951743702745353327669640007872103449646396844414807973197052856142691215290582507888480005107677237851600938711203235732898159609197322361110723115804340068222143729729946562675826554734712020810397624290563325952
  count := 10

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem period7Chunk_entries :
    period7Chunk.rows.map RowCoverage.TaggedRow.entry = period7Entries := rfl

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem period7_index_check :
    RowCoverage.indexCheck CanonicalWords.count period7Chunk = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem period7_words_check :
    RowCoverage.wordsCheck CanonicalWords.wordAt period7Chunk = true := by
  decide +kernel

def period8Entries : List Weights.Entry := [target10, target11, target12, target13, target14, target15, target16, target17, target18, target19, target20, target21, target22, target23]

def period8Chunk : RowCoverage.Chunk where
  rows := [⟨510, target10⟩, ⟨511, target11⟩, ⟨512, target12⟩, ⟨532, target13⟩, ⟨533, target14⟩, ⟨534, target15⟩, ⟨2402, target16⟩, ⟨3189, target17⟩, ⟨4517, target18⟩, ⟨4606, target19⟩, ⟨7423, target20⟩, ⟨7540, target21⟩, ⟨8429, target22⟩, ⟨8518, target23⟩]
  indexMask := 149108728136830404803257695798538460012186304922689729598691148886068401968732205102216997597774462480807784124018083281782529604202827424208474087360767974443226726357490543912224486489542661307059180953760994695151014534019932918458835837018311965570763434161797575491800832935163930856203454987699383792357037309709094859653159732276887785706230747743090318292496849675975138315254681612389260001137083250491268216290647038717378213966748586269026387613394563419841537164672800029880762346081346377111922167839665843169530810820454310883805293265251471956360878876829517519679342862026480747232136598275034576120841738419176032807051965062563568407727632414932765831937968808299311210890946277184623959180989720887289994682314547877358343527387879935200224352829868158278848455265152646113346775334878059826319558411225939860742868096257180216977577677208984771455260312205504669851530399958758602616394266339650807978346238977106891818135274350006457360922321889541945238241539911568575210920578440567199377668702063420970939902348050473092163447649889553804070294666659891757253154530019819653556308707622612547286009141240656026545331632068753613750757240452422791754180926387936331222561314142138651823579505029501593447118393586757259731495422468765071523241336816356035899460856028085207634222342159959806450206574430829544778417660233577124108768585750445566189441928324406724299825515179685156035586065461145714975214957115289592107664324211646151134284719550469386648970434824978186171029446208317662789103296477298338823620425411525499086868206203957784803337842147323372866604016269196304814265586436435266457748469809625885601259309112061559029356165012250378726983156787716836855984046595243386897882326619278988335545395950933461288856774780176166339983719250128774830081780763219698505761206635403169652115489679878497685539840212895178636672807150193388723484028775620972111039303540259407703176983104103898980567136099686224617647808630974890177580118459294363160277924734083038547802196267355113712949117238369266431780014981904200354100807235562079387650708759770477767610912441622473367632063797284821108922473332851179220702247916587296924515009860362724846987350966799672469936777424530911197864678334744756246470144213898077679560945576440582128661549535217630617229136233763512227405188183965966485303474483088032402179309821679587398466542473238429578147007818471068800096032517898678508788409081037172728183825839000263146602596662740816947406853235160618585013270339354408515904228844738383494402573390133680426985929962427552662290432
  count := 14

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem period8Chunk_entries :
    period8Chunk.rows.map RowCoverage.TaggedRow.entry = period8Entries := rfl

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem period8_index_check :
    RowCoverage.indexCheck CanonicalWords.count period8Chunk = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem period8_words_check :
    RowCoverage.wordsCheck CanonicalWords.wordAt period8Chunk = true := by
  decide +kernel

end FranklSmallCyclic.TransportBatches.G012.B003.Data
