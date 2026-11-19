module

public import Conjectures.FranklSmallCyclicRowCoverage
public import Conjectures.FranklSmallCyclicCanonicalWords
public import Conjectures.FranklSmallCyclicOrbit8Block012Data

/-! 16 literal targets sharing one source proof block.
Original words and row indices are retained; weights may be transported.
-/
@[expose] public section

namespace FranklSmallCyclic.TransportBatches.G038.B004.Data

-- Period 10, original row 7942, representative 4913.
def source0 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B012.Data.entryAt ⟨61, by decide +kernel⟩

def target0 : Weights.Entry :=
  { word := [10, 8, 4, 4, 12, 0, 0], weights := [1, 0, 0, 1] }

def points0 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 10, original row 7999, representative 4931.
def source1 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B012.Data.entryAt ⟨79, by decide +kernel⟩

def target1 : Weights.Entry :=
  { word := [10, 8, 8, 4, 6, 0, 0], weights := [1, 0, 0, 1] }

def points1 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 10, original row 8124, representative 4905.
def source2 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B012.Data.entryAt ⟨53, by decide +kernel⟩

def target2 : Weights.Entry :=
  { word := [10, 8, 12, 2, 0, 1, 0], weights := [1, 0, 0, 1] }

def points2 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 10, original row 8126, representative 4905.
def source3 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B012.Data.entryAt ⟨53, by decide +kernel⟩

def target3 : Weights.Entry :=
  { word := [10, 8, 12, 2, 0, 2, 0], weights := [1, 0, 0, 1] }

def points3 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 10, original row 8146, representative 4900.
def source4 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B012.Data.entryAt ⟨48, by decide +kernel⟩

def target4 : Weights.Entry :=
  { word := [10, 8, 12, 4, 4, 0, 0], weights := [1, 0, 0, 1] }

def points4 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 10, original row 8150, representative 4901.
def source5 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B012.Data.entryAt ⟨49, by decide +kernel⟩

def target5 : Weights.Entry :=
  { word := [10, 8, 12, 4, 12, 0, 0], weights := [1, 0, 0, 1] }

def points5 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 10, original row 8749, representative 4938.
def source6 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B012.Data.entryAt ⟨86, by decide +kernel⟩

def target6 : Weights.Entry :=
  { word := [12, 8, 0, 4, 6, 0, 0], weights := [1, 0, 1, 0] }

def points6 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 5), (4, 6), (5, 4), (6, 3), (7, 2)]

-- Period 10, original row 8818, representative 4893.
def source7 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B012.Data.entryAt ⟨41, by decide +kernel⟩

def target7 : Weights.Entry :=
  { word := [12, 8, 4, 2, 0, 1, 0], weights := [0, 1, 0, 0] }

def points7 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 10, original row 8820, representative 4893.
def source8 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B012.Data.entryAt ⟨41, by decide +kernel⟩

def target8 : Weights.Entry :=
  { word := [12, 8, 4, 2, 0, 2, 0], weights := [0, 1, 0, 0] }

def points8 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 10, original row 8840, representative 4888.
def source9 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B012.Data.entryAt ⟨36, by decide +kernel⟩

def target9 : Weights.Entry :=
  { word := [12, 8, 4, 4, 4, 0, 0], weights := [0, 0, 1, 0] }

def points9 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 10, original row 8844, representative 4889.
def source10 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B012.Data.entryAt ⟨37, by decide +kernel⟩

def target10 : Weights.Entry :=
  { word := [12, 8, 4, 4, 12, 0, 0], weights := [0, 0, 1, 0] }

def points10 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 10, original row 8897, representative 4924.
def source11 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B012.Data.entryAt ⟨72, by decide +kernel⟩

def target11 : Weights.Entry :=
  { word := [12, 8, 8, 4, 6, 0, 0], weights := [0, 0, 1, 0] }

def points11 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 10, original row 8926, representative 4877.
def source12 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B012.Data.entryAt ⟨25, by decide +kernel⟩

def target12 : Weights.Entry :=
  { word := [12, 8, 12, 2, 0, 1, 0], weights := [0, 1, 0, 0] }

def points12 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 10, original row 8928, representative 4877.
def source13 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B012.Data.entryAt ⟨25, by decide +kernel⟩

def target13 : Weights.Entry :=
  { word := [12, 8, 12, 2, 0, 2, 0], weights := [0, 1, 0, 0] }

def points13 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 10, original row 8948, representative 4872.
def source14 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B012.Data.entryAt ⟨20, by decide +kernel⟩

def target14 : Weights.Entry :=
  { word := [12, 8, 12, 4, 4, 0, 0], weights := [0, 0, 1, 0] }

def points14 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 10, original row 8952, representative 4873.
def source15 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B012.Data.entryAt ⟨21, by decide +kernel⟩

def target15 : Weights.Entry :=
  { word := [12, 8, 12, 4, 12, 0, 0], weights := [0, 0, 1, 0] }

def points15 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

def period10Entries : List Weights.Entry := [target0, target1, target2, target3, target4, target5, target6, target7, target8, target9, target10, target11, target12, target13, target14, target15]

def period10Chunk : RowCoverage.Chunk where
  rows := [⟨7942, target0⟩, ⟨7999, target1⟩, ⟨8124, target2⟩, ⟨8126, target3⟩, ⟨8146, target4⟩, ⟨8150, target5⟩, ⟨8749, target6⟩, ⟨8818, target7⟩, ⟨8820, target8⟩, ⟨8840, target9⟩, ⟨8844, target10⟩, ⟨8897, target11⟩, ⟨8926, target12⟩, ⟨8928, target13⟩, ⟨8948, target14⟩, ⟨8952, target15⟩]
  indexMask := 7028297770622191928818285378219504504842813295013623815562470758274042613256167863982487363315856325477664471478544363193455158571704972732882348910359441662889991057823865292930909424470436744631698594283301618230314498994815265208602794334015288766138742993118885736450659155134235145782610104278172297407278978774275095560422102186038581653979639720330930535778885502326171945620776398572346365937145686472236047415790580388717133983747362430103390035632869439515024607997457334336941469060296580114424939256316420969943366802745594095179834089286735964258265830909399521135029703161158083137450458486431779873544217959114650654957141636140900846684230478788969784731394732649718263767500228201372302842580266063761049303158031799761859257058153902955237302602063136989269271837673641947819248623155987624306318322934214032438054417220234043838713348963261677485789344989248449582933589733032111023733160911486413784842306546092665159151581446447262459427429147568183208207084246960093790905654392156861443438512727429225761249021375669788222242131776078405379300987681802716190651354722107063495668836361007233601097249516691489367195265470177600049194738101979809974121598102241477927178154951489035572624738411223070685027340326302592651031926729021257276249970469158966014276578890034453918699336272388608853094400810090852225531821763703328380718677998051883187971061951477420076604623686576031051502488161569983790592391148899189539233729359890937117465235664475108918847840653334204807316888272144666274581007165441674442311980740902921302034082108513287924131786723062688912281589889541251209423659979424979853005201232042924083965799428757870869172317819240633406570984474433173666476627814775025433740615311369128638572919656831946276355635762034900095922411948617427271169711206027740144894607468476561423778930079524653868442886269903516762894156285360103615187239585717846820730189158444037069522986528333113318083442148837738918750796155988803664500460484499874686363400219819596549914944396831721633191018975838563182421691071753322742674456439496921562074473822489136569683842534636688256962013038809119043887998984528587075913602245277366482874169649977105729500468558516425891081225333673379543107185708802788467785201430883102081867040592934717562105240260811027171806121416319262028174493077790049484843856273341129230184494467686513624985074902176012053427255404623887402761769235300208072939464467525264600720716275789324446477056099183262796156402908821924341228696102663795031949338553961836753605429714614185806156606193384311033744709653852837253944374611824187252586220348831211990518593657500850778621454756094075748184268595583594040218932262737950123798485270528
  count := 16

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem period10Chunk_entries :
    period10Chunk.rows.map RowCoverage.TaggedRow.entry = period10Entries := rfl

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem period10_index_check :
    RowCoverage.indexCheck CanonicalWords.count period10Chunk = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem period10_words_check :
    RowCoverage.wordsCheck CanonicalWords.wordAt period10Chunk = true := by
  decide +kernel

end FranklSmallCyclic.TransportBatches.G038.B004.Data
