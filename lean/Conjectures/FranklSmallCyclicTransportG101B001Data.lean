module

public import Conjectures.FranklSmallCyclicRowCoverage
public import Conjectures.FranklSmallCyclicCanonicalWords
public import Conjectures.FranklSmallCyclicOrbit10Block023Data

/-! 91 literal targets sharing one source proof block.
Original words and row indices are retained; weights may be transported.
-/
@[expose] public section

namespace FranklSmallCyclic.TransportBatches.G101.B001.Data

-- Period 10, original row 5823, representative 10982.
def source0 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B023.Data.entryAt ⟨62, by decide +kernel⟩

def target0 : Weights.Entry :=
  { word := [8, 8, 12, 10, 0, 1, 8], weights := [0, 1, 0, 1] }

def points0 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 5824, representative 10982.
def source1 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B023.Data.entryAt ⟨62, by decide +kernel⟩

def target1 : Weights.Entry :=
  { word := [8, 8, 12, 10, 0, 2, 8], weights := [0, 1, 0, 1] }

def points1 : List (ℕ × ℕ) := [(0, 7), (1, 9), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 5834, representative 10979.
def source2 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B023.Data.entryAt ⟨59, by decide +kernel⟩

def target2 : Weights.Entry :=
  { word := [8, 8, 12, 10, 8, 2, 8], weights := [0, 1, 0, 1] }

def points2 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 5842, representative 10960.
def source3 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B023.Data.entryAt ⟨40, by decide +kernel⟩

def target3 : Weights.Entry :=
  { word := [8, 8, 12, 12, 4, 0, 8], weights := [1, 0, 0, 1] }

def points3 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 5844, representative 10948.
def source4 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B023.Data.entryAt ⟨28, by decide +kernel⟩

def target4 : Weights.Entry :=
  { word := [8, 8, 12, 12, 4, 8, 8], weights := [0, 1, 1, 0] }

def points4 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 5845, representative 10957.
def source5 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B023.Data.entryAt ⟨37, by decide +kernel⟩

def target5 : Weights.Entry :=
  { word := [8, 8, 12, 12, 12, 0, 8], weights := [0, 1, 1, 0] }

def points5 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 5847, representative 10945.
def source6 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B023.Data.entryAt ⟨25, by decide +kernel⟩

def target6 : Weights.Entry :=
  { word := [8, 8, 12, 12, 12, 8, 8], weights := [0, 1, 1, 0] }

def points6 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 6335, representative 10921.
def source7 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B023.Data.entryAt ⟨1, by decide +kernel⟩

def target7 : Weights.Entry :=
  { word := [8, 12, 0, 4, 2, 0, 8], weights := [1, 0, 0, 1] }

def points7 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2), (9, 0)]

-- Period 10, original row 6357, representative 10926.
def source8 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B023.Data.entryAt ⟨6, by decide +kernel⟩

def target8 : Weights.Entry :=
  { word := [8, 12, 0, 4, 10, 0, 8], weights := [1, 0, 0, 1] }

def points8 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2), (9, 0)]

-- Period 10, original row 6371, representative 10928.
def source9 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B023.Data.entryAt ⟨8, by decide +kernel⟩

def target9 : Weights.Entry :=
  { word := [8, 12, 0, 12, 2, 0, 8], weights := [1, 0, 0, 1] }

def points9 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2), (9, 0)]

-- Period 10, original row 6393, representative 10927.
def source10 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B023.Data.entryAt ⟨7, by decide +kernel⟩

def target10 : Weights.Entry :=
  { word := [8, 12, 0, 12, 10, 0, 8], weights := [1, 0, 0, 1] }

def points10 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2), (9, 0)]

-- Period 10, original row 6457, representative 10920.
def source11 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B023.Data.entryAt ⟨0, by decide +kernel⟩

def target11 : Weights.Entry :=
  { word := [8, 12, 4, 12, 0, 0, 8], weights := [1, 0, 0, 1] }

def points11 : List (ℕ × ℕ) := [(0, 7), (1, 8), (2, 9), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 6490, representative 10922.
def source12 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B023.Data.entryAt ⟨2, by decide +kernel⟩

def target12 : Weights.Entry :=
  { word := [8, 12, 8, 4, 2, 0, 8], weights := [1, 0, 0, 1] }

def points12 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 6516, representative 10923.
def source13 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B023.Data.entryAt ⟨3, by decide +kernel⟩

def target13 : Weights.Entry :=
  { word := [8, 12, 8, 4, 10, 0, 8], weights := [1, 0, 0, 1] }

def points13 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 6532, representative 10925.
def source14 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B023.Data.entryAt ⟨5, by decide +kernel⟩

def target14 : Weights.Entry :=
  { word := [8, 12, 8, 12, 2, 0, 8], weights := [0, 1, 1, 0] }

def points14 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 6558, representative 10924.
def source15 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B023.Data.entryAt ⟨4, by decide +kernel⟩

def target15 : Weights.Entry :=
  { word := [8, 12, 8, 12, 10, 0, 8], weights := [0, 1, 1, 0] }

def points15 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 6634, representative 10976.
def source16 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B023.Data.entryAt ⟨56, by decide +kernel⟩

def target16 : Weights.Entry :=
  { word := [9, 0, 1, 4, 2, 8, 8], weights := [1, 0, 1, 0] }

def points16 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8), (9, 9)]

-- Period 10, original row 6656, representative 10981.
def source17 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B023.Data.entryAt ⟨61, by decide +kernel⟩

def target17 : Weights.Entry :=
  { word := [9, 0, 1, 4, 10, 8, 8], weights := [1, 0, 1, 0] }

def points17 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8), (9, 9)]

-- Period 10, original row 6670, representative 10983.
def source18 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B023.Data.entryAt ⟨63, by decide +kernel⟩

def target18 : Weights.Entry :=
  { word := [9, 0, 1, 12, 2, 8, 8], weights := [1, 0, 1, 0] }

def points18 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8), (9, 9)]

-- Period 10, original row 6692, representative 10982.
def source19 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B023.Data.entryAt ⟨62, by decide +kernel⟩

def target19 : Weights.Entry :=
  { word := [9, 0, 1, 12, 10, 8, 8], weights := [1, 0, 1, 0] }

def points19 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8), (9, 9)]

-- Period 10, original row 6708, representative 10954.
def source20 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B023.Data.entryAt ⟨34, by decide +kernel⟩

def target20 : Weights.Entry :=
  { word := [9, 0, 2, 2, 2, 8, 8], weights := [1, 0, 0, 1] }

def points20 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8), (9, 9)]

-- Period 10, original row 6723, representative 10959.
def source21 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B023.Data.entryAt ⟨39, by decide +kernel⟩

def target21 : Weights.Entry :=
  { word := [9, 0, 2, 2, 10, 8, 8], weights := [1, 0, 0, 1] }

def points21 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8), (9, 9)]

-- Period 10, original row 6737, representative 10961.
def source22 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B023.Data.entryAt ⟨41, by decide +kernel⟩

def target22 : Weights.Entry :=
  { word := [9, 0, 2, 10, 2, 8, 8], weights := [1, 0, 0, 1] }

def points22 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8), (9, 9)]

-- Period 10, original row 6751, representative 10960.
def source23 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B023.Data.entryAt ⟨40, by decide +kernel⟩

def target23 : Weights.Entry :=
  { word := [9, 0, 2, 10, 10, 8, 8], weights := [1, 0, 0, 1] }

def points23 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8), (9, 9)]

-- Period 10, original row 6768, representative 10921.
def source24 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B023.Data.entryAt ⟨1, by decide +kernel⟩

def target24 : Weights.Entry :=
  { word := [9, 0, 4, 2, 0, 9, 8], weights := [1, 0, 0, 1] }

def points24 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8), (9, 9)]

-- Period 10, original row 6770, representative 10921.
def source25 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B023.Data.entryAt ⟨1, by decide +kernel⟩

def target25 : Weights.Entry :=
  { word := [9, 0, 4, 2, 0, 10, 8], weights := [1, 0, 0, 1] }

def points25 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 8), (8, 7), (9, 9)]

-- Period 10, original row 6776, representative 10922.
def source26 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B023.Data.entryAt ⟨2, by decide +kernel⟩

def target26 : Weights.Entry :=
  { word := [9, 0, 4, 2, 8, 10, 8], weights := [1, 0, 0, 1] }

def points26 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8), (9, 9)]

-- Period 10, original row 6780, representative 10964.
def source27 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B023.Data.entryAt ⟨44, by decide +kernel⟩

def target27 : Weights.Entry :=
  { word := [9, 0, 4, 4, 4, 8, 8], weights := [0, 0, 1, 0] }

def points27 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8), (9, 9)]

-- Period 10, original row 6786, representative 10963.
def source28 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B023.Data.entryAt ⟨43, by decide +kernel⟩

def target28 : Weights.Entry :=
  { word := [9, 0, 4, 8, 4, 2, 8], weights := [0, 1, 1, 0] }

def points28 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8), (9, 9)]

-- Period 10, original row 6799, representative 10928.
def source29 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B023.Data.entryAt ⟨8, by decide +kernel⟩

def target29 : Weights.Entry :=
  { word := [9, 0, 4, 10, 0, 9, 8], weights := [1, 0, 0, 1] }

def points29 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8), (9, 9)]

-- Period 10, original row 6800, representative 10928.
def source30 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B023.Data.entryAt ⟨8, by decide +kernel⟩

def target30 : Weights.Entry :=
  { word := [9, 0, 4, 10, 0, 10, 8], weights := [1, 0, 0, 1] }

def points30 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 8), (8, 7), (9, 9)]

-- Period 10, original row 6811, representative 10925.
def source31 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B023.Data.entryAt ⟨5, by decide +kernel⟩

def target31 : Weights.Entry :=
  { word := [9, 0, 4, 10, 8, 10, 8], weights := [0, 1, 1, 0] }

def points31 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8), (9, 9)]

-- Period 10, original row 6816, representative 10967.
def source32 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B023.Data.entryAt ⟨47, by decide +kernel⟩

def target32 : Weights.Entry :=
  { word := [9, 0, 4, 12, 4, 8, 8], weights := [0, 0, 1, 0] }

def points32 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8), (9, 9)]

-- Period 10, original row 6872, representative 10955.
def source33 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B023.Data.entryAt ⟨35, by decide +kernel⟩

def target33 : Weights.Entry :=
  { word := [9, 0, 10, 2, 2, 8, 8], weights := [1, 0, 0, 1] }

def points33 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8), (9, 9)]

-- Period 10, original row 6880, representative 10956.
def source34 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B023.Data.entryAt ⟨36, by decide +kernel⟩

def target34 : Weights.Entry :=
  { word := [9, 0, 10, 2, 10, 8, 8], weights := [1, 0, 0, 1] }

def points34 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8), (9, 9)]

-- Period 10, original row 6887, representative 10958.
def source35 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B023.Data.entryAt ⟨38, by decide +kernel⟩

def target35 : Weights.Entry :=
  { word := [9, 0, 10, 10, 2, 8, 8], weights := [0, 1, 1, 0] }

def points35 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8), (9, 9)]

-- Period 10, original row 6894, representative 10957.
def source36 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B023.Data.entryAt ⟨37, by decide +kernel⟩

def target36 : Weights.Entry :=
  { word := [9, 0, 10, 10, 10, 8, 8], weights := [0, 1, 1, 0] }

def points36 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8), (9, 9)]

-- Period 10, original row 6911, representative 10926.
def source37 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B023.Data.entryAt ⟨6, by decide +kernel⟩

def target37 : Weights.Entry :=
  { word := [9, 0, 12, 2, 0, 9, 8], weights := [1, 0, 0, 1] }

def points37 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8), (9, 9)]

-- Period 10, original row 6913, representative 10926.
def source38 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B023.Data.entryAt ⟨6, by decide +kernel⟩

def target38 : Weights.Entry :=
  { word := [9, 0, 12, 2, 0, 10, 8], weights := [1, 0, 0, 1] }

def points38 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 8), (8, 7), (9, 9)]

-- Period 10, original row 6919, representative 10923.
def source39 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B023.Data.entryAt ⟨3, by decide +kernel⟩

def target39 : Weights.Entry :=
  { word := [9, 0, 12, 2, 8, 10, 8], weights := [1, 0, 0, 1] }

def points39 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8), (9, 9)]

-- Period 10, original row 6923, representative 10965.
def source40 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B023.Data.entryAt ⟨45, by decide +kernel⟩

def target40 : Weights.Entry :=
  { word := [9, 0, 12, 4, 4, 8, 8], weights := [0, 0, 1, 0] }

def points40 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8), (9, 9)]

-- Period 10, original row 6928, representative 10962.
def source41 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B023.Data.entryAt ⟨42, by decide +kernel⟩

def target41 : Weights.Entry :=
  { word := [9, 0, 12, 8, 4, 2, 8], weights := [0, 1, 1, 0] }

def points41 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8), (9, 9)]

-- Period 10, original row 6945, representative 10927.
def source42 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B023.Data.entryAt ⟨7, by decide +kernel⟩

def target42 : Weights.Entry :=
  { word := [9, 0, 12, 10, 0, 9, 8], weights := [1, 0, 0, 1] }

def points42 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8), (9, 9)]

-- Period 10, original row 6946, representative 10927.
def source43 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B023.Data.entryAt ⟨7, by decide +kernel⟩

def target43 : Weights.Entry :=
  { word := [9, 0, 12, 10, 0, 10, 8], weights := [1, 0, 0, 1] }

def points43 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 8), (8, 7), (9, 9)]

-- Period 10, original row 6957, representative 10924.
def source44 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B023.Data.entryAt ⟨4, by decide +kernel⟩

def target44 : Weights.Entry :=
  { word := [9, 0, 12, 10, 8, 10, 8], weights := [0, 1, 1, 0] }

def points44 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8), (9, 9)]

-- Period 10, original row 6962, representative 10966.
def source45 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B023.Data.entryAt ⟨46, by decide +kernel⟩

def target45 : Weights.Entry :=
  { word := [9, 0, 12, 12, 4, 8, 8], weights := [0, 0, 1, 0] }

def points45 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8), (9, 9)]

-- Period 10, original row 6973, representative 10968.
def source46 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B023.Data.entryAt ⟨48, by decide +kernel⟩

def target46 : Weights.Entry :=
  { word := [9, 4, 4, 4, 0, 8, 8], weights := [1, 0, 0, 1] }

def points46 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8), (9, 9)]

-- Period 10, original row 6987, representative 10973.
def source47 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B023.Data.entryAt ⟨53, by decide +kernel⟩

def target47 : Weights.Entry :=
  { word := [9, 4, 4, 4, 8, 8, 8], weights := [1, 0, 1, 0] }

def points47 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8), (9, 9)]

-- Period 10, original row 7001, representative 10975.
def source48 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B023.Data.entryAt ⟨55, by decide +kernel⟩

def target48 : Weights.Entry :=
  { word := [9, 4, 4, 12, 0, 8, 8], weights := [1, 0, 1, 0] }

def points48 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8), (9, 9)]

-- Period 10, original row 7015, representative 10974.
def source49 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B023.Data.entryAt ⟨54, by decide +kernel⟩

def target49 : Weights.Entry :=
  { word := [9, 4, 4, 12, 8, 8, 8], weights := [1, 0, 1, 0] }

def points49 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8), (9, 9)]

-- Period 10, original row 7022, representative 10969.
def source50 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B023.Data.entryAt ⟨49, by decide +kernel⟩

def target50 : Weights.Entry :=
  { word := [9, 4, 12, 4, 0, 8, 8], weights := [1, 0, 0, 1] }

def points50 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8), (9, 9)]

-- Period 10, original row 7036, representative 10970.
def source51 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B023.Data.entryAt ⟨50, by decide +kernel⟩

def target51 : Weights.Entry :=
  { word := [9, 4, 12, 4, 8, 8, 8], weights := [1, 0, 1, 0] }

def points51 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8), (9, 9)]

-- Period 10, original row 7043, representative 10972.
def source52 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B023.Data.entryAt ⟨52, by decide +kernel⟩

def target52 : Weights.Entry :=
  { word := [9, 4, 12, 12, 0, 8, 8], weights := [1, 0, 1, 0] }

def points52 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8), (9, 9)]

-- Period 10, original row 7057, representative 10971.
def source53 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B023.Data.entryAt ⟨51, by decide +kernel⟩

def target53 : Weights.Entry :=
  { word := [9, 4, 12, 12, 8, 8, 8], weights := [1, 0, 1, 0] }

def points53 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8), (9, 9)]

-- Period 10, original row 7064, representative 10921.
def source54 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B023.Data.entryAt ⟨1, by decide +kernel⟩

def target54 : Weights.Entry :=
  { word := [9, 8, 1, 4, 2, 0, 8], weights := [1, 0, 0, 1] }

def points54 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 7086, representative 10926.
def source55 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B023.Data.entryAt ⟨6, by decide +kernel⟩

def target55 : Weights.Entry :=
  { word := [9, 8, 1, 4, 10, 0, 8], weights := [1, 0, 0, 1] }

def points55 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 7100, representative 10928.
def source56 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B023.Data.entryAt ⟨8, by decide +kernel⟩

def target56 : Weights.Entry :=
  { word := [9, 8, 1, 12, 2, 0, 8], weights := [1, 0, 0, 1] }

def points56 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 7122, representative 10927.
def source57 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B023.Data.entryAt ⟨7, by decide +kernel⟩

def target57 : Weights.Entry :=
  { word := [9, 8, 1, 12, 10, 0, 8], weights := [1, 0, 0, 1] }

def points57 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 7136, representative 10964.
def source58 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B023.Data.entryAt ⟨44, by decide +kernel⟩

def target58 : Weights.Entry :=
  { word := [9, 8, 2, 2, 2, 0, 8], weights := [0, 1, 0, 0] }

def points58 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 7144, representative 10942.
def source59 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B023.Data.entryAt ⟨22, by decide +kernel⟩

def target59 : Weights.Entry :=
  { word := [9, 8, 2, 2, 2, 8, 8], weights := [1, 0, 0, 1] }

def points59 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8), (9, 9)]

-- Period 10, original row 7151, representative 10965.
def source60 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B023.Data.entryAt ⟨45, by decide +kernel⟩

def target60 : Weights.Entry :=
  { word := [9, 8, 2, 2, 10, 0, 8], weights := [0, 1, 0, 0] }

def points60 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 7159, representative 10947.
def source61 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B023.Data.entryAt ⟨27, by decide +kernel⟩

def target61 : Weights.Entry :=
  { word := [9, 8, 2, 2, 10, 8, 8], weights := [1, 0, 0, 1] }

def points61 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8), (9, 9)]

-- Period 10, original row 7166, representative 10967.
def source62 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B023.Data.entryAt ⟨47, by decide +kernel⟩

def target62 : Weights.Entry :=
  { word := [9, 8, 2, 10, 2, 0, 8], weights := [0, 1, 0, 0] }

def points62 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 7173, representative 10949.
def source63 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B023.Data.entryAt ⟨29, by decide +kernel⟩

def target63 : Weights.Entry :=
  { word := [9, 8, 2, 10, 2, 8, 8], weights := [0, 1, 1, 0] }

def points63 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8), (9, 9)]

-- Period 10, original row 7180, representative 10966.
def source64 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B023.Data.entryAt ⟨46, by decide +kernel⟩

def target64 : Weights.Entry :=
  { word := [9, 8, 2, 10, 10, 0, 8], weights := [0, 1, 0, 0] }

def points64 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 7187, representative 10948.
def source65 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B023.Data.entryAt ⟨28, by decide +kernel⟩

def target65 : Weights.Entry :=
  { word := [9, 8, 2, 10, 10, 8, 8], weights := [0, 1, 1, 0] }

def points65 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8), (9, 9)]

-- Period 10, original row 7192, representative 10954.
def source66 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B023.Data.entryAt ⟨34, by decide +kernel⟩

def target66 : Weights.Entry :=
  { word := [9, 8, 4, 4, 4, 0, 8], weights := [1, 0, 0, 1] }

def points66 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 7194, representative 10942.
def source67 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B023.Data.entryAt ⟨22, by decide +kernel⟩

def target67 : Weights.Entry :=
  { word := [9, 8, 4, 4, 4, 8, 8], weights := [1, 0, 0, 1] }

def points67 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 7196, representative 10955.
def source68 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B023.Data.entryAt ⟨35, by decide +kernel⟩

def target68 : Weights.Entry :=
  { word := [9, 8, 4, 4, 12, 0, 8], weights := [1, 0, 0, 1] }

def points68 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 7198, representative 10943.
def source69 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B023.Data.entryAt ⟨23, by decide +kernel⟩

def target69 : Weights.Entry :=
  { word := [9, 8, 4, 4, 12, 8, 8], weights := [1, 0, 0, 1] }

def points69 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8), (9, 9)]

-- Period 10, original row 7203, representative 10961.
def source70 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B023.Data.entryAt ⟨41, by decide +kernel⟩

def target70 : Weights.Entry :=
  { word := [9, 8, 4, 12, 4, 0, 8], weights := [1, 0, 0, 1] }

def points70 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 7205, representative 10949.
def source71 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B023.Data.entryAt ⟨29, by decide +kernel⟩

def target71 : Weights.Entry :=
  { word := [9, 8, 4, 12, 4, 8, 8], weights := [0, 1, 1, 0] }

def points71 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 7206, representative 10958.
def source72 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B023.Data.entryAt ⟨38, by decide +kernel⟩

def target72 : Weights.Entry :=
  { word := [9, 8, 4, 12, 12, 0, 8], weights := [0, 1, 1, 0] }

def points72 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 7208, representative 10946.
def source73 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B023.Data.entryAt ⟨26, by decide +kernel⟩

def target73 : Weights.Entry :=
  { word := [9, 8, 4, 12, 12, 8, 8], weights := [0, 1, 1, 0] }

def points73 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8), (9, 9)]

-- Period 10, original row 7214, representative 10951.
def source74 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B023.Data.entryAt ⟨31, by decide +kernel⟩

def target74 : Weights.Entry :=
  { word := [9, 8, 8, 4, 6, 0, 8], weights := [1, 0, 0, 1] }

def points74 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 7216, representative 10939.
def source75 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B023.Data.entryAt ⟨19, by decide +kernel⟩

def target75 : Weights.Entry :=
  { word := [9, 8, 8, 4, 6, 8, 8], weights := [1, 0, 0, 1] }

def points75 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 7229, representative 10952.
def source76 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B023.Data.entryAt ⟨32, by decide +kernel⟩

def target76 : Weights.Entry :=
  { word := [9, 8, 8, 12, 6, 0, 8], weights := [0, 1, 1, 0] }

def points76 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 7231, representative 10940.
def source77 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B023.Data.entryAt ⟨20, by decide +kernel⟩

def target77 : Weights.Entry :=
  { word := [9, 8, 8, 12, 6, 8, 8], weights := [0, 1, 1, 0] }

def points77 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 7256, representative 10943.
def source78 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B023.Data.entryAt ⟨23, by decide +kernel⟩

def target78 : Weights.Entry :=
  { word := [9, 8, 10, 2, 2, 8, 8], weights := [1, 0, 0, 1] }

def points78 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 7264, representative 10944.
def source79 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B023.Data.entryAt ⟨24, by decide +kernel⟩

def target79 : Weights.Entry :=
  { word := [9, 8, 10, 2, 10, 8, 8], weights := [1, 0, 0, 1] }

def points79 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8), (9, 9)]

-- Period 10, original row 7271, representative 10946.
def source80 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B023.Data.entryAt ⟨26, by decide +kernel⟩

def target80 : Weights.Entry :=
  { word := [9, 8, 10, 10, 2, 8, 8], weights := [0, 1, 1, 0] }

def points80 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 7278, representative 10945.
def source81 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B023.Data.entryAt ⟨25, by decide +kernel⟩

def target81 : Weights.Entry :=
  { word := [9, 8, 10, 10, 10, 8, 8], weights := [0, 1, 1, 0] }

def points81 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8), (9, 9)]

-- Period 10, original row 7283, representative 10959.
def source82 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B023.Data.entryAt ⟨39, by decide +kernel⟩

def target82 : Weights.Entry :=
  { word := [9, 8, 12, 4, 4, 0, 8], weights := [1, 0, 0, 1] }

def points82 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 7285, representative 10947.
def source83 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B023.Data.entryAt ⟨27, by decide +kernel⟩

def target83 : Weights.Entry :=
  { word := [9, 8, 12, 4, 4, 8, 8], weights := [1, 0, 0, 1] }

def points83 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 7287, representative 10956.
def source84 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B023.Data.entryAt ⟨36, by decide +kernel⟩

def target84 : Weights.Entry :=
  { word := [9, 8, 12, 4, 12, 0, 8], weights := [1, 0, 0, 1] }

def points84 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 7289, representative 10944.
def source85 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B023.Data.entryAt ⟨24, by decide +kernel⟩

def target85 : Weights.Entry :=
  { word := [9, 8, 12, 4, 12, 8, 8], weights := [1, 0, 0, 1] }

def points85 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 7293, representative 10960.
def source86 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B023.Data.entryAt ⟨40, by decide +kernel⟩

def target86 : Weights.Entry :=
  { word := [9, 8, 12, 12, 4, 0, 8], weights := [1, 0, 0, 1] }

def points86 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 7295, representative 10948.
def source87 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B023.Data.entryAt ⟨28, by decide +kernel⟩

def target87 : Weights.Entry :=
  { word := [9, 8, 12, 12, 4, 8, 8], weights := [0, 1, 1, 0] }

def points87 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 7296, representative 10957.
def source88 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B023.Data.entryAt ⟨37, by decide +kernel⟩

def target88 : Weights.Entry :=
  { word := [9, 8, 12, 12, 12, 0, 8], weights := [0, 1, 1, 0] }

def points88 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 7298, representative 10945.
def source89 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B023.Data.entryAt ⟨25, by decide +kernel⟩

def target89 : Weights.Entry :=
  { word := [9, 8, 12, 12, 12, 8, 8], weights := [0, 1, 1, 0] }

def points89 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 7330, representative 10920.
def source90 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B023.Data.entryAt ⟨0, by decide +kernel⟩

def target90 : Weights.Entry :=
  { word := [9, 12, 4, 12, 0, 0, 8], weights := [1, 0, 0, 1] }

def points90 : List (ℕ × ℕ) := [(0, 7), (1, 8), (2, 9), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

def period10Entries : List Weights.Entry := [target0, target1, target2, target3, target4, target5, target6, target7, target8, target9, target10, target11, target12, target13, target14, target15, target16, target17, target18, target19, target20, target21, target22, target23, target24, target25, target26, target27, target28, target29, target30, target31, target32, target33, target34, target35, target36, target37, target38, target39, target40, target41, target42, target43, target44, target45, target46, target47, target48, target49, target50, target51, target52, target53, target54, target55, target56, target57, target58, target59, target60, target61, target62, target63, target64, target65, target66, target67, target68, target69, target70, target71, target72, target73, target74, target75, target76, target77, target78, target79, target80, target81, target82, target83, target84, target85, target86, target87, target88, target89, target90]

def period10Chunk : RowCoverage.Chunk where
  rows := [⟨5823, target0⟩, ⟨5824, target1⟩, ⟨5834, target2⟩, ⟨5842, target3⟩, ⟨5844, target4⟩, ⟨5845, target5⟩, ⟨5847, target6⟩, ⟨6335, target7⟩, ⟨6357, target8⟩, ⟨6371, target9⟩, ⟨6393, target10⟩, ⟨6457, target11⟩, ⟨6490, target12⟩, ⟨6516, target13⟩, ⟨6532, target14⟩, ⟨6558, target15⟩, ⟨6634, target16⟩, ⟨6656, target17⟩, ⟨6670, target18⟩, ⟨6692, target19⟩, ⟨6708, target20⟩, ⟨6723, target21⟩, ⟨6737, target22⟩, ⟨6751, target23⟩, ⟨6768, target24⟩, ⟨6770, target25⟩, ⟨6776, target26⟩, ⟨6780, target27⟩, ⟨6786, target28⟩, ⟨6799, target29⟩, ⟨6800, target30⟩, ⟨6811, target31⟩, ⟨6816, target32⟩, ⟨6872, target33⟩, ⟨6880, target34⟩, ⟨6887, target35⟩, ⟨6894, target36⟩, ⟨6911, target37⟩, ⟨6913, target38⟩, ⟨6919, target39⟩, ⟨6923, target40⟩, ⟨6928, target41⟩, ⟨6945, target42⟩, ⟨6946, target43⟩, ⟨6957, target44⟩, ⟨6962, target45⟩, ⟨6973, target46⟩, ⟨6987, target47⟩, ⟨7001, target48⟩, ⟨7015, target49⟩, ⟨7022, target50⟩, ⟨7036, target51⟩, ⟨7043, target52⟩, ⟨7057, target53⟩, ⟨7064, target54⟩, ⟨7086, target55⟩, ⟨7100, target56⟩, ⟨7122, target57⟩, ⟨7136, target58⟩, ⟨7144, target59⟩, ⟨7151, target60⟩, ⟨7159, target61⟩, ⟨7166, target62⟩, ⟨7173, target63⟩, ⟨7180, target64⟩, ⟨7187, target65⟩, ⟨7192, target66⟩, ⟨7194, target67⟩, ⟨7196, target68⟩, ⟨7198, target69⟩, ⟨7203, target70⟩, ⟨7205, target71⟩, ⟨7206, target72⟩, ⟨7208, target73⟩, ⟨7214, target74⟩, ⟨7216, target75⟩, ⟨7229, target76⟩, ⟨7231, target77⟩, ⟨7256, target78⟩, ⟨7264, target79⟩, ⟨7271, target80⟩, ⟨7278, target81⟩, ⟨7283, target82⟩, ⟨7285, target83⟩, ⟨7287, target84⟩, ⟨7289, target85⟩, ⟨7293, target86⟩, ⟨7295, target87⟩, ⟨7296, target88⟩, ⟨7298, target89⟩, ⟨7330, target90⟩]
  indexMask := 35470574053639242282823600025613602446070175436675152848126265140979529106896003112801656469933522243540104665391130671907383269127698936275497186963032794085914248117352513633405442607481102021105942501713275018808537489569498790146086840952583244059465396355485547667715635597811354846851049120213625218633296179916292948046964705397474095287158514072219748409844732964689209416741226184008785495051383330968240743350591826845735604820453140315957270010064576023711050463283157723715258334824542095851380302825967577722297320351028740048627213981477342684580583199597199250508023448256714632172547899469950764843512715373245029124980780365273299950757304798475992846386540884071081673654821110009686626412320280934355501519592516716919596756965716927427757481834581937119754145842600957948856871627178005514097414660790803618518406710246716991401652598166404534826344865618952907637083339271740098061041889829154505366369548342252345682713524362617667934788335375706517911458311816626399622275177864877614632767253570814001542633556631651757220495672554329747996259392487169723414539448278994232416123764931849785147231372095604244262372733079533876789542339155809814459921016026099258786867837254761059337935976053913516220258889842876648781949652363718280607893415021398789319050459061159379303597693422496987178970525407812464458666989410523091992507371812181296626430397248316116297947303181883992102697376238933707912081798136894986656298315296575212556054321626784460647773407955521665241735160513885989498579976853938222760998658662874538525098239956277490984093806621295437436218829421236443501279703825323262909054304441709148896839086393170579236137695764288839372360592514114595015334430725291602793457774701743554023025318876017052541310267406443588548287556265989350403361108278478730600982967278005759181231262402748922542929697128973937175001370356076920164899599549371668839490964112991477822281185367737719027384874658144550487523355844930191126989341842348330401691255487328286506746721915483515384434282413764431473517803787729098593227270863099886911321099160894730515449002867761927506126511454526866010539234369639158497551254706702288010822705804437177221426587581948053648438198272
  count := 91

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

end FranklSmallCyclic.TransportBatches.G101.B001.Data
