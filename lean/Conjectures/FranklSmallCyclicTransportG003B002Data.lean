module

public import Conjectures.FranklSmallCyclicRowCoverage
public import Conjectures.FranklSmallCyclicCanonicalWords
public import Conjectures.FranklSmallCyclicOrbit7Block003Data

/-! 30 literal targets sharing one source proof block.
Original words and row indices are retained; weights may be transported.
-/
@[expose] public section

namespace FranklSmallCyclic.TransportBatches.G003.B002.Data

-- Period 7, original row 8762, representative 471.
def source0 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B003.Data.entryAt ⟨75, by decide +kernel⟩

def target0 : Weights.Entry :=
  { word := [12, 8, 0, 4, 10, 0, 2], weights := [1, 0, 0, 1] }

def points0 : List (ℕ × ℕ) := [(0, 1), (1, 2), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8768, representative 463.
def source1 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B003.Data.entryAt ⟨68, by decide +kernel⟩

def target1 : Weights.Entry :=
  { word := [12, 8, 0, 4, 10, 8, 2], weights := [1, 0, 0, 1] }

def points1 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8780, representative 473.
def source2 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B003.Data.entryAt ⟨77, by decide +kernel⟩

def target2 : Weights.Entry :=
  { word := [12, 8, 0, 12, 2, 0, 2], weights := [1, 0, 0, 1] }

def points2 : List (ℕ × ℕ) := [(0, 1), (1, 2), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8786, representative 465.
def source3 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B003.Data.entryAt ⟨70, by decide +kernel⟩

def target3 : Weights.Entry :=
  { word := [12, 8, 0, 12, 2, 8, 2], weights := [1, 0, 0, 1] }

def points3 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8800, representative 511.
def source4 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B003.Data.entryAt ⟨115, by decide +kernel⟩

def target4 : Weights.Entry :=
  { word := [12, 8, 0, 12, 8, 4, 12], weights := [1, 0, 0, 1] }

def points4 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8803, representative 491.
def source5 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B003.Data.entryAt ⟨95, by decide +kernel⟩

def target5 : Weights.Entry :=
  { word := [12, 8, 0, 12, 8, 12, 12], weights := [1, 0, 0, 1] }

def points5 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8805, representative 472.
def source6 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B003.Data.entryAt ⟨76, by decide +kernel⟩

def target6 : Weights.Entry :=
  { word := [12, 8, 0, 12, 10, 0, 2], weights := [1, 0, 0, 1] }

def points6 : List (ℕ × ℕ) := [(0, 1), (1, 2), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8811, representative 464.
def source7 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B003.Data.entryAt ⟨69, by decide +kernel⟩

def target7 : Weights.Entry :=
  { word := [12, 8, 0, 12, 10, 8, 2], weights := [1, 0, 0, 1] }

def points7 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8824, representative 450.
def source8 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B003.Data.entryAt ⟨55, by decide +kernel⟩

def target8 : Weights.Entry :=
  { word := [12, 8, 4, 2, 0, 8, 2], weights := [0, 1, 0, 1] }

def points8 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8859, representative 453.
def source9 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B003.Data.entryAt ⟨58, by decide +kernel⟩

def target9 : Weights.Entry :=
  { word := [12, 8, 4, 10, 0, 8, 2], weights := [0, 1, 0, 1] }

def points9 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8869, representative 522.
def source10 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B003.Data.entryAt ⟨126, by decide +kernel⟩

def target10 : Weights.Entry :=
  { word := [12, 8, 4, 10, 8, 4, 12], weights := [1, 1, 1, 1] }

def points10 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8874, representative 502.
def source11 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B003.Data.entryAt ⟨106, by decide +kernel⟩

def target11 : Weights.Entry :=
  { word := [12, 8, 4, 10, 8, 12, 12], weights := [1, 1, 1, 1] }

def points11 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8932, representative 451.
def source12 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B003.Data.entryAt ⟨56, by decide +kernel⟩

def target12 : Weights.Entry :=
  { word := [12, 8, 12, 2, 0, 8, 2], weights := [0, 1, 0, 1] }

def points12 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8967, representative 452.
def source13 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B003.Data.entryAt ⟨57, by decide +kernel⟩

def target13 : Weights.Entry :=
  { word := [12, 8, 12, 10, 0, 8, 2], weights := [0, 1, 0, 1] }

def points13 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8977, representative 521.
def source14 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B003.Data.entryAt ⟨125, by decide +kernel⟩

def target14 : Weights.Entry :=
  { word := [12, 8, 12, 10, 8, 4, 12], weights := [1, 1, 1, 1] }

def points14 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8982, representative 501.
def source15 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B003.Data.entryAt ⟨105, by decide +kernel⟩

def target15 : Weights.Entry :=
  { word := [12, 8, 12, 10, 8, 12, 12], weights := [1, 1, 1, 1] }

def points15 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 9008, representative 506.
def source16 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B003.Data.entryAt ⟨110, by decide +kernel⟩

def target16 : Weights.Entry :=
  { word := [12, 10, 0, 12, 2, 0, 9], weights := [1, 1, 0, 1] }

def points16 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 9016, representative 505.
def source17 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B003.Data.entryAt ⟨109, by decide +kernel⟩

def target17 : Weights.Entry :=
  { word := [12, 10, 0, 12, 10, 0, 9], weights := [1, 1, 0, 1] }

def points17 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 9054, representative 431.
def source18 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B003.Data.entryAt ⟨36, by decide +kernel⟩

def target18 : Weights.Entry :=
  { word := [12, 12, 4, 8, 8, 2, 2], weights := [0, 1, 1, 0] }

def points18 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 9056, representative 427.
def source19 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B003.Data.entryAt ⟨32, by decide +kernel⟩

def target19 : Weights.Entry :=
  { word := [12, 12, 4, 8, 8, 10, 2], weights := [0, 1, 1, 0] }

def points19 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 9064, representative 514.
def source20 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B003.Data.entryAt ⟨118, by decide +kernel⟩

def target20 : Weights.Entry :=
  { word := [12, 12, 8, 8, 1, 4, 12], weights := [1, 0, 1, 1] }

def points20 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 9069, representative 498.
def source21 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B003.Data.entryAt ⟨102, by decide +kernel⟩

def target21 : Weights.Entry :=
  { word := [12, 12, 8, 8, 1, 12, 12], weights := [1, 0, 1, 1] }

def points21 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 9070, representative 433.
def source22 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B003.Data.entryAt ⟨38, by decide +kernel⟩

def target22 : Weights.Entry :=
  { word := [12, 12, 8, 8, 2, 2, 2], weights := [0, 1, 1, 0] }

def points22 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 9072, representative 429.
def source23 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B003.Data.entryAt ⟨34, by decide +kernel⟩

def target23 : Weights.Entry :=
  { word := [12, 12, 8, 8, 2, 10, 2], weights := [0, 1, 1, 0] }

def points23 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 9076, representative 513.
def source24 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B003.Data.entryAt ⟨117, by decide +kernel⟩

def target24 : Weights.Entry :=
  { word := [12, 12, 8, 8, 9, 4, 12], weights := [1, 0, 1, 1] }

def points24 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 9078, representative 497.
def source25 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B003.Data.entryAt ⟨101, by decide +kernel⟩

def target25 : Weights.Entry :=
  { word := [12, 12, 8, 8, 9, 12, 12], weights := [1, 0, 1, 1] }

def points25 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 9079, representative 432.
def source26 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B003.Data.entryAt ⟨37, by decide +kernel⟩

def target26 : Weights.Entry :=
  { word := [12, 12, 8, 8, 10, 2, 2], weights := [0, 1, 1, 0] }

def points26 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 9081, representative 428.
def source27 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B003.Data.entryAt ⟨33, by decide +kernel⟩

def target27 : Weights.Entry :=
  { word := [12, 12, 8, 8, 10, 10, 2], weights := [0, 1, 1, 0] }

def points27 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 9084, representative 430.
def source28 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B003.Data.entryAt ⟨35, by decide +kernel⟩

def target28 : Weights.Entry :=
  { word := [12, 12, 12, 8, 8, 2, 2], weights := [0, 1, 1, 0] }

def points28 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 9086, representative 426.
def source29 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B003.Data.entryAt ⟨31, by decide +kernel⟩

def target29 : Weights.Entry :=
  { word := [12, 12, 12, 8, 8, 10, 2], weights := [0, 1, 1, 0] }

def points29 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

def period7Entries : List Weights.Entry := [target0, target1, target2, target3, target4, target5, target6, target7, target8, target9, target10, target11, target12, target13, target14, target15, target16, target17, target18, target19, target20, target21, target22, target23, target24, target25, target26, target27, target28, target29]

def period7Chunk : RowCoverage.Chunk where
  rows := [⟨8762, target0⟩, ⟨8768, target1⟩, ⟨8780, target2⟩, ⟨8786, target3⟩, ⟨8800, target4⟩, ⟨8803, target5⟩, ⟨8805, target6⟩, ⟨8811, target7⟩, ⟨8824, target8⟩, ⟨8859, target9⟩, ⟨8869, target10⟩, ⟨8874, target11⟩, ⟨8932, target12⟩, ⟨8967, target13⟩, ⟨8977, target14⟩, ⟨8982, target15⟩, ⟨9008, target16⟩, ⟨9016, target17⟩, ⟨9054, target18⟩, ⟨9056, target19⟩, ⟨9064, target20⟩, ⟨9069, target21⟩, ⟨9070, target22⟩, ⟨9072, target23⟩, ⟨9076, target24⟩, ⟨9078, target25⟩, ⟨9079, target26⟩, ⟨9081, target27⟩, ⟨9084, target28⟩, ⟨9086, target29⟩]
  indexMask := 186416681130187413837737958450422497531487965541978955742785515175807091802489116993093751234978395272293084443948902462477719165435958762712674313029769660184850284872724791871290083001257230858724774445951403913426388243567512601248729024397839350379409710810071586395042327411870275739258424476052109819989123148525518030035100863547764401906560596405234555059922248137307258294914582349744341077881941940128680253649673109624857941680228710660490354575497020885288754212288509391308569992124388853158715517749675779284287825226102891455558658351659975357451218026028103976383035576867241084779529433046909590424162040393997651749473017377002987024114658929026914083665306956594811054271555130799343584456108374799996141324450589213279230821541483536792147873027127387234101781159033152592934748084196051873503444062173807700270910659388691661492843131700246661628288566863924996716858178106205324680860780139025283419907666492103931185508612651059032011915698913827514876943993602643263420118000274952358379454064361180904687901666084424005284605229348459168619097527577088106501684256590588553737975993205345684166683578491707252373481600873650064856747316421632196123543474182270175555979512247986471887983386029082875715242312317022477502429194344228522682022459527149887511378544972253004044778815782461089951612170771694082247776658584907853459953766085576362296399568076662778231211339524003572235489378594577896017997410772909929758231663386682883653782033513363236047071066686036244836984810179010765948885734846649356440721339780352997230855771331427504069202198146530466743039462427842469841751854450939200375709856025991075093758031972030842829023966209128900540736504163136652352131889853734696553599151316492499011219842455986727245154782500788117653509030476031018718506782190517803520320087844431032172875931247619116830618316670730169131218670599644868275886605644574381692189828166458314891635999520409064707726397213930125384966820370985649324220229871689495357750099380175270623080887375659712334951879122364241915975820189886150102606744872293554013941879134611797115412674676043778164854142792179015090438390819865288981591856153450889480797408011754263211226470597845495209900718358135640907139816103343479477143931545100425121939683388336796698227005984688502458345587733420443486051157195829664701410923175598818074969024756871652254767029179424185724116359736745033488125186098396235144130819661472246815162732467758548693901371819232817666186893434083740108644133680688944587019496187176922464100205141611736478369343823862740476699565932748649866359948887386741049962404517555542196993648590922201428510055984537787852173743926664104101687016353694258240634732623500037817674072820725174290479175039975424
  count := 30

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

end FranklSmallCyclic.TransportBatches.G003.B002.Data
