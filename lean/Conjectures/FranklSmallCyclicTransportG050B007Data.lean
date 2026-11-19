module

public import Conjectures.FranklSmallCyclicRowCoverage
public import Conjectures.FranklSmallCyclicCanonicalWords
public import Conjectures.FranklSmallCyclicOrbit8Block024Data

/-! 7 literal targets sharing one source proof block.
Original words and row indices are retained; weights may be transported.
-/
@[expose] public section

namespace FranklSmallCyclic.TransportBatches.G050.B007.Data

-- Period 10, original row 3524, representative 6455.
def source0 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨65, by decide +kernel⟩

def target0 : Weights.Entry :=
  { word := [4, 0, 12, 2, 8, 10, 0], weights := [0, 1, 0, 0] }

def points0 : List (ℕ × ℕ) := [(0, 8), (1, 0), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 10, original row 3528, representative 6458.
def source1 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨68, by decide +kernel⟩

def target1 : Weights.Entry :=
  { word := [4, 0, 12, 4, 4, 8, 0], weights := [0, 0, 1, 0] }

def points1 : List (ℕ × ℕ) := [(0, 8), (1, 0), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 10, original row 3530, representative 6457.
def source2 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨67, by decide +kernel⟩

def target2 : Weights.Entry :=
  { word := [4, 0, 12, 8, 4, 2, 0], weights := [0, 1, 1, 0] }

def points2 : List (ℕ × ℕ) := [(0, 8), (1, 0), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 10, original row 3532, representative 6453.
def source3 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨63, by decide +kernel⟩

def target3 : Weights.Entry :=
  { word := [4, 0, 12, 8, 4, 10, 0], weights := [0, 1, 1, 0] }

def points3 : List (ℕ × ℕ) := [(0, 8), (1, 0), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 10, original row 3564, representative 6459.
def source4 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨69, by decide +kernel⟩

def target4 : Weights.Entry :=
  { word := [4, 0, 12, 12, 4, 8, 0], weights := [0, 0, 1, 0] }

def points4 : List (ℕ × ℕ) := [(0, 8), (1, 0), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 10, original row 3737, representative 6431.
def source5 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨41, by decide +kernel⟩

def target5 : Weights.Entry :=
  { word := [4, 8, 0, 4, 6, 0, 0], weights := [1, 0, 1, 0] }

def points5 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 5), (4, 6), (5, 4), (6, 3), (7, 2)]

-- Period 10, original row 3885, representative 6417.
def source6 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨27, by decide +kernel⟩

def target6 : Weights.Entry :=
  { word := [4, 8, 8, 4, 6, 0, 0], weights := [0, 0, 1, 0] }

def points6 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

def period10Entries : List Weights.Entry := [target0, target1, target2, target3, target4, target5, target6]

def period10Chunk : RowCoverage.Chunk where
  rows := [⟨3524, target0⟩, ⟨3528, target1⟩, ⟨3530, target2⟩, ⟨3532, target3⟩, ⟨3564, target4⟩, ⟨3737, target5⟩, ⟨3885, target6⟩]
  indexMask := 317346092044060362408985520827092197432063641257429925392703361000314638555205637593401450703813332280568763723821720765698148817764483842798465083936625354702975822490736320092354149629081523647872769228882072359066910018167900323614191702539217068044985347874730430152566391763966553246908409397501451194835950209222804424393454695969553671565191846447770234702196790756795321286211266625814510845935673905320899149311347686642183026384479795732436618732755826460404329143173345274226347586113040461973483002398028365642613441079875255837077456147105755352313724182366375395873125484633328874095544877309703654473955316061661219871563971490168901146017188167678351915529721206800163943985265379164928638812371578641807829732991968432223915672871528048012516555142949517753480576711189220581601042086130780446892592646188559826165775205769721062585413598883250719600645778993034024935671776349018816893216015338068250024735449241071647702586078308863535082954947784680935080062938733358491268305086083843367780098863932264285802183224236308363353094852876885139000091132814627423956962408800474951674841180342212128188708621973798491431317876293219104539436640225984512
  count := 7

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

end FranklSmallCyclic.TransportBatches.G050.B007.Data
