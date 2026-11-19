module

public import Conjectures.FranklSmallCyclicRowCoverage
public import Conjectures.FranklSmallCyclicCanonicalWords
public import Conjectures.FranklSmallCyclicOrbit10Block020Data

/-! 63 literal targets sharing one source proof block.
Original words and row indices are retained; weights may be transported.
-/
@[expose] public section

namespace FranklSmallCyclic.TransportBatches.G098.B001.Data

-- Period 10, original row 5777, representative 10749.
def source0 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B020.Data.entryAt ⟨21, by decide +kernel⟩

def target0 : Weights.Entry :=
  { word := [8, 8, 10, 10, 10, 8, 4], weights := [1, 0, 0, 1] }

def points0 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 6339, representative 10776.
def source1 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B020.Data.entryAt ⟨48, by decide +kernel⟩

def target1 : Weights.Entry :=
  { word := [8, 12, 0, 4, 2, 8, 2], weights := [1, 0, 0, 1] }

def points1 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2), (9, 0)]

-- Period 10, original row 6361, representative 10777.
def source2 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B020.Data.entryAt ⟨49, by decide +kernel⟩

def target2 : Weights.Entry :=
  { word := [8, 12, 0, 4, 10, 8, 2], weights := [1, 0, 0, 1] }

def points2 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2), (9, 0)]

-- Period 10, original row 6375, representative 10783.
def source3 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B020.Data.entryAt ⟨55, by decide +kernel⟩

def target3 : Weights.Entry :=
  { word := [8, 12, 0, 12, 2, 8, 2], weights := [1, 0, 0, 1] }

def points3 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2), (9, 0)]

-- Period 10, original row 6397, representative 10780.
def source4 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B020.Data.entryAt ⟨52, by decide +kernel⟩

def target4 : Weights.Entry :=
  { word := [8, 12, 0, 12, 10, 8, 2], weights := [1, 0, 0, 1] }

def points4 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2), (9, 0)]

-- Period 10, original row 6434, representative 10784.
def source5 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B020.Data.entryAt ⟨56, by decide +kernel⟩

def target5 : Weights.Entry :=
  { word := [8, 12, 4, 4, 0, 8, 2], weights := [1, 0, 0, 1] }

def points5 : List (ℕ × ℕ) := [(0, 9), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 6435, representative 10784.
def source6 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B020.Data.entryAt ⟨56, by decide +kernel⟩

def target6 : Weights.Entry :=
  { word := [8, 12, 4, 4, 0, 8, 4], weights := [1, 0, 0, 1] }

def points6 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 6448, representative 10785.
def source7 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B020.Data.entryAt ⟨57, by decide +kernel⟩

def target7 : Weights.Entry :=
  { word := [8, 12, 4, 4, 8, 8, 2], weights := [1, 0, 0, 1] }

def points7 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 6449, representative 10789.
def source8 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B020.Data.entryAt ⟨61, by decide +kernel⟩

def target8 : Weights.Entry :=
  { word := [8, 12, 4, 4, 8, 8, 4], weights := [1, 0, 0, 1] }

def points8 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 6476, representative 10788.
def source9 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B020.Data.entryAt ⟨60, by decide +kernel⟩

def target9 : Weights.Entry :=
  { word := [8, 12, 4, 12, 8, 8, 2], weights := [0, 1, 1, 0] }

def points9 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 6494, representative 10781.
def source10 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B020.Data.entryAt ⟨53, by decide +kernel⟩

def target10 : Weights.Entry :=
  { word := [8, 12, 8, 4, 2, 8, 2], weights := [1, 0, 0, 1] }

def points10 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 6520, representative 10778.
def source11 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B020.Data.entryAt ⟨50, by decide +kernel⟩

def target11 : Weights.Entry :=
  { word := [8, 12, 8, 4, 10, 8, 2], weights := [1, 0, 0, 1] }

def points11 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 6536, representative 10782.
def source12 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B020.Data.entryAt ⟨54, by decide +kernel⟩

def target12 : Weights.Entry :=
  { word := [8, 12, 8, 12, 2, 8, 2], weights := [0, 1, 1, 0] }

def points12 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 6562, representative 10779.
def source13 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B020.Data.entryAt ⟨51, by decide +kernel⟩

def target13 : Weights.Entry :=
  { word := [8, 12, 8, 12, 10, 8, 2], weights := [0, 1, 1, 0] }

def points13 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 6598, representative 10786.
def source14 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B020.Data.entryAt ⟨58, by decide +kernel⟩

def target14 : Weights.Entry :=
  { word := [8, 12, 12, 4, 8, 8, 2], weights := [1, 0, 0, 1] }

def points14 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 6599, representative 10790.
def source15 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B020.Data.entryAt ⟨62, by decide +kernel⟩

def target15 : Weights.Entry :=
  { word := [8, 12, 12, 4, 8, 8, 4], weights := [1, 0, 0, 1] }

def points15 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 6619, representative 10787.
def source16 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B020.Data.entryAt ⟨59, by decide +kernel⟩

def target16 : Weights.Entry :=
  { word := [8, 12, 12, 12, 8, 8, 2], weights := [0, 1, 1, 0] }

def points16 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 6620, representative 10791.
def source17 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B020.Data.entryAt ⟨63, by decide +kernel⟩

def target17 : Weights.Entry :=
  { word := [8, 12, 12, 12, 8, 8, 4], weights := [1, 0, 0, 1] }

def points17 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 6706, representative 10754.
def source18 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B020.Data.entryAt ⟨26, by decide +kernel⟩

def target18 : Weights.Entry :=
  { word := [9, 0, 2, 2, 2, 8, 2], weights := [1, 0, 0, 1] }

def points18 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 0), (9, 1)]

-- Period 10, original row 6707, representative 10768.
def source19 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B020.Data.entryAt ⟨40, by decide +kernel⟩

def target19 : Weights.Entry :=
  { word := [9, 0, 2, 2, 2, 8, 4], weights := [1, 0, 0, 1] }

def points19 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 0), (9, 1)]

-- Period 10, original row 6721, representative 10755.
def source20 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B020.Data.entryAt ⟨27, by decide +kernel⟩

def target20 : Weights.Entry :=
  { word := [9, 0, 2, 2, 10, 8, 2], weights := [1, 0, 0, 1] }

def points20 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 0), (9, 1)]

-- Period 10, original row 6722, representative 10769.
def source21 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B020.Data.entryAt ⟨41, by decide +kernel⟩

def target21 : Weights.Entry :=
  { word := [9, 0, 2, 2, 10, 8, 4], weights := [1, 0, 0, 1] }

def points21 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 0), (9, 1)]

-- Period 10, original row 6735, representative 10761.
def source22 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B020.Data.entryAt ⟨33, by decide +kernel⟩

def target22 : Weights.Entry :=
  { word := [9, 0, 2, 10, 2, 8, 2], weights := [1, 0, 0, 1] }

def points22 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 0), (9, 1)]

-- Period 10, original row 6736, representative 10775.
def source23 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B020.Data.entryAt ⟨47, by decide +kernel⟩

def target23 : Weights.Entry :=
  { word := [9, 0, 2, 10, 2, 8, 4], weights := [1, 0, 0, 1] }

def points23 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 0), (9, 1)]

-- Period 10, original row 6749, representative 10758.
def source24 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B020.Data.entryAt ⟨30, by decide +kernel⟩

def target24 : Weights.Entry :=
  { word := [9, 0, 2, 10, 10, 8, 2], weights := [1, 0, 0, 1] }

def points24 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 0), (9, 1)]

-- Period 10, original row 6750, representative 10772.
def source25 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B020.Data.entryAt ⟨44, by decide +kernel⟩

def target25 : Weights.Entry :=
  { word := [9, 0, 2, 10, 10, 8, 4], weights := [1, 0, 0, 1] }

def points25 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 0), (9, 1)]

-- Period 10, original row 6870, representative 10759.
def source26 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B020.Data.entryAt ⟨31, by decide +kernel⟩

def target26 : Weights.Entry :=
  { word := [9, 0, 10, 2, 2, 8, 2], weights := [1, 0, 0, 1] }

def points26 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 0), (9, 1)]

-- Period 10, original row 6871, representative 10773.
def source27 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B020.Data.entryAt ⟨45, by decide +kernel⟩

def target27 : Weights.Entry :=
  { word := [9, 0, 10, 2, 2, 8, 4], weights := [1, 0, 0, 1] }

def points27 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 0), (9, 1)]

-- Period 10, original row 6878, representative 10756.
def source28 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B020.Data.entryAt ⟨28, by decide +kernel⟩

def target28 : Weights.Entry :=
  { word := [9, 0, 10, 2, 10, 8, 2], weights := [1, 0, 0, 1] }

def points28 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 0), (9, 1)]

-- Period 10, original row 6879, representative 10770.
def source29 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B020.Data.entryAt ⟨42, by decide +kernel⟩

def target29 : Weights.Entry :=
  { word := [9, 0, 10, 2, 10, 8, 4], weights := [1, 0, 0, 1] }

def points29 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 0), (9, 1)]

-- Period 10, original row 6885, representative 10760.
def source30 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B020.Data.entryAt ⟨32, by decide +kernel⟩

def target30 : Weights.Entry :=
  { word := [9, 0, 10, 10, 2, 8, 2], weights := [0, 1, 1, 0] }

def points30 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 0), (9, 1)]

-- Period 10, original row 6886, representative 10774.
def source31 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B020.Data.entryAt ⟨46, by decide +kernel⟩

def target31 : Weights.Entry :=
  { word := [9, 0, 10, 10, 2, 8, 4], weights := [1, 0, 0, 1] }

def points31 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 0), (9, 1)]

-- Period 10, original row 6892, representative 10757.
def source32 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B020.Data.entryAt ⟨29, by decide +kernel⟩

def target32 : Weights.Entry :=
  { word := [9, 0, 10, 10, 10, 8, 2], weights := [0, 1, 1, 0] }

def points32 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 0), (9, 1)]

-- Period 10, original row 6893, representative 10771.
def source33 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B020.Data.entryAt ⟨43, by decide +kernel⟩

def target33 : Weights.Entry :=
  { word := [9, 0, 10, 10, 10, 8, 4], weights := [1, 0, 0, 1] }

def points33 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 0), (9, 1)]

-- Period 10, original row 7068, representative 10776.
def source34 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B020.Data.entryAt ⟨48, by decide +kernel⟩

def target34 : Weights.Entry :=
  { word := [9, 8, 1, 4, 2, 8, 2], weights := [1, 0, 0, 1] }

def points34 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 7090, representative 10777.
def source35 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B020.Data.entryAt ⟨49, by decide +kernel⟩

def target35 : Weights.Entry :=
  { word := [9, 8, 1, 4, 10, 8, 2], weights := [1, 0, 0, 1] }

def points35 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 7104, representative 10783.
def source36 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B020.Data.entryAt ⟨55, by decide +kernel⟩

def target36 : Weights.Entry :=
  { word := [9, 8, 1, 12, 2, 8, 2], weights := [1, 0, 0, 1] }

def points36 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 7126, representative 10780.
def source37 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B020.Data.entryAt ⟨52, by decide +kernel⟩

def target37 : Weights.Entry :=
  { word := [9, 8, 1, 12, 10, 8, 2], weights := [1, 0, 0, 1] }

def points37 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 7142, representative 10732.
def source38 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B020.Data.entryAt ⟨4, by decide +kernel⟩

def target38 : Weights.Entry :=
  { word := [9, 8, 2, 2, 2, 8, 2], weights := [1, 0, 0, 1] }

def points38 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 7143, representative 10746.
def source39 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B020.Data.entryAt ⟨18, by decide +kernel⟩

def target39 : Weights.Entry :=
  { word := [9, 8, 2, 2, 2, 8, 4], weights := [1, 0, 0, 1] }

def points39 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 7157, representative 10733.
def source40 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B020.Data.entryAt ⟨5, by decide +kernel⟩

def target40 : Weights.Entry :=
  { word := [9, 8, 2, 2, 10, 8, 2], weights := [1, 0, 0, 1] }

def points40 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 7158, representative 10747.
def source41 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B020.Data.entryAt ⟨19, by decide +kernel⟩

def target41 : Weights.Entry :=
  { word := [9, 8, 2, 2, 10, 8, 4], weights := [1, 0, 0, 1] }

def points41 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 7171, representative 10739.
def source42 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B020.Data.entryAt ⟨11, by decide +kernel⟩

def target42 : Weights.Entry :=
  { word := [9, 8, 2, 10, 2, 8, 2], weights := [0, 1, 1, 0] }

def points42 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 7172, representative 10753.
def source43 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B020.Data.entryAt ⟨25, by decide +kernel⟩

def target43 : Weights.Entry :=
  { word := [9, 8, 2, 10, 2, 8, 4], weights := [1, 0, 0, 1] }

def points43 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 7185, representative 10736.
def source44 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B020.Data.entryAt ⟨8, by decide +kernel⟩

def target44 : Weights.Entry :=
  { word := [9, 8, 2, 10, 10, 8, 2], weights := [0, 1, 1, 0] }

def points44 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 7186, representative 10750.
def source45 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B020.Data.entryAt ⟨22, by decide +kernel⟩

def target45 : Weights.Entry :=
  { word := [9, 8, 2, 10, 10, 8, 4], weights := [1, 0, 0, 1] }

def points45 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 7254, representative 10737.
def source46 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B020.Data.entryAt ⟨9, by decide +kernel⟩

def target46 : Weights.Entry :=
  { word := [9, 8, 10, 2, 2, 8, 2], weights := [1, 0, 0, 1] }

def points46 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 7255, representative 10751.
def source47 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B020.Data.entryAt ⟨23, by decide +kernel⟩

def target47 : Weights.Entry :=
  { word := [9, 8, 10, 2, 2, 8, 4], weights := [1, 0, 0, 1] }

def points47 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 7262, representative 10734.
def source48 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B020.Data.entryAt ⟨6, by decide +kernel⟩

def target48 : Weights.Entry :=
  { word := [9, 8, 10, 2, 10, 8, 2], weights := [1, 0, 0, 1] }

def points48 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 7263, representative 10748.
def source49 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B020.Data.entryAt ⟨20, by decide +kernel⟩

def target49 : Weights.Entry :=
  { word := [9, 8, 10, 2, 10, 8, 4], weights := [1, 0, 0, 1] }

def points49 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 7269, representative 10738.
def source50 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B020.Data.entryAt ⟨10, by decide +kernel⟩

def target50 : Weights.Entry :=
  { word := [9, 8, 10, 10, 2, 8, 2], weights := [0, 1, 1, 0] }

def points50 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 7270, representative 10752.
def source51 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B020.Data.entryAt ⟨24, by decide +kernel⟩

def target51 : Weights.Entry :=
  { word := [9, 8, 10, 10, 2, 8, 4], weights := [1, 0, 0, 1] }

def points51 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 7276, representative 10735.
def source52 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B020.Data.entryAt ⟨7, by decide +kernel⟩

def target52 : Weights.Entry :=
  { word := [9, 8, 10, 10, 10, 8, 2], weights := [0, 1, 1, 0] }

def points52 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 7277, representative 10749.
def source53 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B020.Data.entryAt ⟨21, by decide +kernel⟩

def target53 : Weights.Entry :=
  { word := [9, 8, 10, 10, 10, 8, 4], weights := [1, 0, 0, 1] }

def points53 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 7307, representative 10784.
def source54 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B020.Data.entryAt ⟨56, by decide +kernel⟩

def target54 : Weights.Entry :=
  { word := [9, 12, 4, 4, 0, 8, 2], weights := [1, 0, 0, 1] }

def points54 : List (ℕ × ℕ) := [(0, 9), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 7308, representative 10784.
def source55 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B020.Data.entryAt ⟨56, by decide +kernel⟩

def target55 : Weights.Entry :=
  { word := [9, 12, 4, 4, 0, 8, 4], weights := [1, 0, 0, 1] }

def points55 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 7321, representative 10785.
def source56 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B020.Data.entryAt ⟨57, by decide +kernel⟩

def target56 : Weights.Entry :=
  { word := [9, 12, 4, 4, 8, 8, 2], weights := [1, 0, 0, 1] }

def points56 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 7322, representative 10789.
def source57 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B020.Data.entryAt ⟨61, by decide +kernel⟩

def target57 : Weights.Entry :=
  { word := [9, 12, 4, 4, 8, 8, 4], weights := [1, 0, 0, 1] }

def points57 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 7349, representative 10788.
def source58 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B020.Data.entryAt ⟨60, by decide +kernel⟩

def target58 : Weights.Entry :=
  { word := [9, 12, 4, 12, 8, 8, 2], weights := [0, 1, 1, 0] }

def points58 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 7370, representative 10786.
def source59 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B020.Data.entryAt ⟨58, by decide +kernel⟩

def target59 : Weights.Entry :=
  { word := [9, 12, 12, 4, 8, 8, 2], weights := [1, 0, 0, 1] }

def points59 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 7371, representative 10790.
def source60 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B020.Data.entryAt ⟨62, by decide +kernel⟩

def target60 : Weights.Entry :=
  { word := [9, 12, 12, 4, 8, 8, 4], weights := [1, 0, 0, 1] }

def points60 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 7391, representative 10787.
def source61 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B020.Data.entryAt ⟨59, by decide +kernel⟩

def target61 : Weights.Entry :=
  { word := [9, 12, 12, 12, 8, 8, 2], weights := [0, 1, 1, 0] }

def points61 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 7392, representative 10791.
def source62 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B020.Data.entryAt ⟨63, by decide +kernel⟩

def target62 : Weights.Entry :=
  { word := [9, 12, 12, 12, 8, 8, 4], weights := [1, 0, 0, 1] }

def points62 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

def period10Entries : List Weights.Entry := [target0, target1, target2, target3, target4, target5, target6, target7, target8, target9, target10, target11, target12, target13, target14, target15, target16, target17, target18, target19, target20, target21, target22, target23, target24, target25, target26, target27, target28, target29, target30, target31, target32, target33, target34, target35, target36, target37, target38, target39, target40, target41, target42, target43, target44, target45, target46, target47, target48, target49, target50, target51, target52, target53, target54, target55, target56, target57, target58, target59, target60, target61, target62]

def period10Chunk : RowCoverage.Chunk where
  rows := [⟨5777, target0⟩, ⟨6339, target1⟩, ⟨6361, target2⟩, ⟨6375, target3⟩, ⟨6397, target4⟩, ⟨6434, target5⟩, ⟨6435, target6⟩, ⟨6448, target7⟩, ⟨6449, target8⟩, ⟨6476, target9⟩, ⟨6494, target10⟩, ⟨6520, target11⟩, ⟨6536, target12⟩, ⟨6562, target13⟩, ⟨6598, target14⟩, ⟨6599, target15⟩, ⟨6619, target16⟩, ⟨6620, target17⟩, ⟨6706, target18⟩, ⟨6707, target19⟩, ⟨6721, target20⟩, ⟨6722, target21⟩, ⟨6735, target22⟩, ⟨6736, target23⟩, ⟨6749, target24⟩, ⟨6750, target25⟩, ⟨6870, target26⟩, ⟨6871, target27⟩, ⟨6878, target28⟩, ⟨6879, target29⟩, ⟨6885, target30⟩, ⟨6886, target31⟩, ⟨6892, target32⟩, ⟨6893, target33⟩, ⟨7068, target34⟩, ⟨7090, target35⟩, ⟨7104, target36⟩, ⟨7126, target37⟩, ⟨7142, target38⟩, ⟨7143, target39⟩, ⟨7157, target40⟩, ⟨7158, target41⟩, ⟨7171, target42⟩, ⟨7172, target43⟩, ⟨7185, target44⟩, ⟨7186, target45⟩, ⟨7254, target46⟩, ⟨7255, target47⟩, ⟨7262, target48⟩, ⟨7263, target49⟩, ⟨7269, target50⟩, ⟨7270, target51⟩, ⟨7276, target52⟩, ⟨7277, target53⟩, ⟨7307, target54⟩, ⟨7308, target55⟩, ⟨7321, target56⟩, ⟨7322, target57⟩, ⟨7349, target58⟩, ⟨7370, target59⟩, ⟨7371, target60⟩, ⟨7391, target61⟩, ⟨7392, target62⟩]
  indexMask := 245368842563600052691841049294279883900683430474535965963397151044405775130691029557486597445056059596022226786200049616508994940150413324272579719187018777778115579764783608389886810997284742634874325885293729849060366218224062048608505977681461516072469470908265723026794839093126020652165034464328306702777078245323897461320103256929956977202532194289853148882851607131246292552934063794531704354028624426210718070774492264559123582879292623683947924685786811492526209556039411774429726226704778809759257770338756833384016087531433377318094076430725012693397246580747604677607740297785000494719913063576862740541718729793983912887127621512241899337157228763996372990773000816225204537609000461755674340378385997221144078581873743492338998457897571611081740805974566045614432753604482318206624570209920858815081614341429418670104102602886403259218072016018109712549494254934403167511653624897146800989634361023034586685426133907727648932059508308810688987411076724667791495631030552601177479162076928288474333484726376154890913443433016525335706194387597472706812190975469076764779395235401616144337091338281645174447344269201641849243670854857467565093034107654957637262817314954405795319666698125084371475665639971179403721651784256741019500294975291351497758448385003902927686342889983137399283458867732510730211352131010785030146099950141242945230577018034529159383784920590804106563448009196475870936976091281682926247274931298469944121519534177861571824278571280786791087503190917491534716016694795057491592604085614965049424809556864197167067462676722415504885650272753766638403863959679338688634268852352057865421540800726335904549656693169429563870565862524949174910244320571729874383694418430077515403969865755493374438944534820709688818811252076424766182742179932761958642393502004345609598081351434453881224957576517265364745188679065096314269564087952336725620151545807545580711910572278621542626124192648930103197154816851466787855557350547670220036867521529337714238585807852608064195412018235809264345361663137197177415425733232842366004998213497530745414244525935731666506842439114996194619111104828844681628714423906422083707343501672873825191414573362158835529158677965619448531527777199293163156939997184
  count := 63

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

end FranklSmallCyclic.TransportBatches.G098.B001.Data
