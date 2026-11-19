module

public import Conjectures.FranklSmallCyclicRowCoverage
public import Conjectures.FranklSmallCyclicCanonicalWords
public import Conjectures.FranklSmallCyclicOrbit9Block011Data

/-! 2 literal targets sharing one source proof block.
Original words and row indices are retained; weights may be transported.
-/
@[expose] public section

namespace FranklSmallCyclic.TransportBatches.G064.B004.Data

-- Period 10, original row 4038, representative 8165.
def source0 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B011.Data.entryAt ⟨6, by decide +kernel⟩

def target0 : Weights.Entry :=
  { word := [4, 10, 8, 12, 12, 4, 0], weights := [0, 1, 1, 0] }

def points0 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 10, original row 4040, representative 8161.
def source1 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B011.Data.entryAt ⟨2, by decide +kernel⟩

def target1 : Weights.Entry :=
  { word := [4, 10, 8, 12, 12, 12, 0], weights := [0, 1, 1, 0] }

def points1 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

def period10Entries : List Weights.Entry := [target0, target1]

def period10Chunk : RowCoverage.Chunk where
  rows := [⟨4038, target0⟩, ⟨4040, target1⟩]
  indexMask := 18117259106365532958025794779629853412452546325545478876355041304781789759443350344162347794179464931603637986482617219067887498442251975731540696160279482715866425655554770828357280360975940068549648425050567945623491963164740938431329896832626864420654059865709787220515517859947111375855180074166649543376243404761736160052865596794239108287958771548051680419910472044001445175303653676227616095938362162502075136087634174467718718959521396205660939608340036256571022340132374560192869877694888046536738336090837104577279618581004489334624967183829820902377762349116376807381147110924616158448816680042115546557243118302887266623137985019702377181527848987698624577026444166684381158804938943134050309882910566579377887023088302122577876287237007491555990641489955439619596049079932312869143216828355077240457886110874036640414289809543405615623443120709029213872639814309619937976660777482256220484804609785182210756593132857807811234849767535421233735697687097965708856795934780724487136123499163034874349408530619016426439928631067489853924947072198421818760058024948363678335866389385770002771624245694957485553129753692215943595613143192858790589110812685691903433626036576597885731416278892354801354114334720
  count := 2

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

end FranklSmallCyclic.TransportBatches.G064.B004.Data
