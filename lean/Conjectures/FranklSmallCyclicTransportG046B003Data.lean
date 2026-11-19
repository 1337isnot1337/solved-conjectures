module

public import Conjectures.FranklSmallCyclicRowCoverage
public import Conjectures.FranklSmallCyclicCanonicalWords
public import Conjectures.FranklSmallCyclicOrbit8Block020Data

/-! 60 literal targets sharing one source proof block.
Original words and row indices are retained; weights may be transported.
-/
@[expose] public section

namespace FranklSmallCyclic.TransportBatches.G046.B003.Data

-- Period 9, original row 1821, representative 5971.
def source0 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B020.Data.entryAt ⟨93, by decide +kernel⟩

def target0 : Weights.Entry :=
  { word := [1, 0, 9, 12, 4, 4, 8], weights := [0, 1, 1, 0] }

def points0 : List (ℕ × ℕ) := [(0, 8), (1, 0), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 9, original row 1823, representative 5949.
def source1 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B020.Data.entryAt ⟨71, by decide +kernel⟩

def target1 : Weights.Entry :=
  { word := [1, 0, 9, 12, 12, 4, 8], weights := [0, 0, 1, 0] }

def points1 : List (ℕ × ℕ) := [(0, 8), (1, 0), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 9, original row 4757, representative 5963.
def source2 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B020.Data.entryAt ⟨85, by decide +kernel⟩

def target2 : Weights.Entry :=
  { word := [8, 2, 2, 2, 0, 1, 0], weights := [1, 0, 0, 0] }

def points2 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 9, original row 4759, representative 5963.
def source3 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B020.Data.entryAt ⟨85, by decide +kernel⟩

def target3 : Weights.Entry :=
  { word := [8, 2, 2, 2, 0, 2, 0], weights := [1, 0, 0, 0] }

def points3 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 9, original row 4780, representative 5968.
def source4 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B020.Data.entryAt ⟨90, by decide +kernel⟩

def target4 : Weights.Entry :=
  { word := [8, 2, 2, 2, 8, 1, 0], weights := [1, 0, 0, 1] }

def points4 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 9, original row 4796, representative 5974.
def source5 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B020.Data.entryAt ⟨96, by decide +kernel⟩

def target5 : Weights.Entry :=
  { word := [8, 2, 2, 10, 0, 1, 0], weights := [0, 1, 1, 0] }

def points5 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 9, original row 4798, representative 5974.
def source6 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B020.Data.entryAt ⟨96, by decide +kernel⟩

def target6 : Weights.Entry :=
  { word := [8, 2, 2, 10, 0, 2, 0], weights := [0, 1, 1, 0] }

def points6 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 9, original row 4820, representative 5971.
def source7 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B020.Data.entryAt ⟨93, by decide +kernel⟩

def target7 : Weights.Entry :=
  { word := [8, 2, 2, 10, 8, 1, 0], weights := [0, 1, 1, 0] }

def points7 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 9, original row 4847, representative 6001.
def source8 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B020.Data.entryAt ⟨123, by decide +kernel⟩

def target8 : Weights.Entry :=
  { word := [8, 2, 8, 2, 0, 1, 0], weights := [0, 1, 0, 0] }

def points8 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 9, original row 4849, representative 6001.
def source9 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B020.Data.entryAt ⟨123, by decide +kernel⟩

def target9 : Weights.Entry :=
  { word := [8, 2, 8, 2, 0, 2, 0], weights := [0, 1, 0, 0] }

def points9 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 9, original row 4887, representative 6004.
def source10 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B020.Data.entryAt ⟨126, by decide +kernel⟩

def target10 : Weights.Entry :=
  { word := [8, 2, 8, 10, 0, 1, 0], weights := [0, 1, 0, 0] }

def points10 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 9, original row 4889, representative 6004.
def source11 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B020.Data.entryAt ⟨126, by decide +kernel⟩

def target11 : Weights.Entry :=
  { word := [8, 2, 8, 10, 0, 2, 0], weights := [0, 1, 0, 0] }

def points11 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 9, original row 4925, representative 5943.
def source12 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B020.Data.entryAt ⟨65, by decide +kernel⟩

def target12 : Weights.Entry :=
  { word := [8, 2, 10, 2, 0, 1, 0], weights := [1, 0, 0, 0] }

def points12 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 9, original row 4927, representative 5943.
def source13 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B020.Data.entryAt ⟨65, by decide +kernel⟩

def target13 : Weights.Entry :=
  { word := [8, 2, 10, 2, 0, 2, 0], weights := [1, 0, 0, 0] }

def points13 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 9, original row 4941, representative 5948.
def source14 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B020.Data.entryAt ⟨70, by decide +kernel⟩

def target14 : Weights.Entry :=
  { word := [8, 2, 10, 2, 8, 1, 0], weights := [0, 1, 0, 0] }

def points14 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 9, original row 4958, representative 5950.
def source15 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B020.Data.entryAt ⟨72, by decide +kernel⟩

def target15 : Weights.Entry :=
  { word := [8, 2, 10, 10, 0, 1, 0], weights := [0, 1, 1, 0] }

def points15 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 9, original row 4960, representative 5950.
def source16 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B020.Data.entryAt ⟨72, by decide +kernel⟩

def target16 : Weights.Entry :=
  { word := [8, 2, 10, 10, 0, 2, 0], weights := [0, 1, 1, 0] }

def points16 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 9, original row 4975, representative 5949.
def source17 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B020.Data.entryAt ⟨71, by decide +kernel⟩

def target17 : Weights.Entry :=
  { word := [8, 2, 10, 10, 8, 1, 0], weights := [0, 1, 0, 0] }

def points17 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 10, original row 13, representative 5963.
def source18 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B020.Data.entryAt ⟨85, by decide +kernel⟩

def target18 : Weights.Entry :=
  { word := [0, 0, 1, 4, 4, 4, 8], weights := [0, 0, 0, 1] }

def points18 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 10, original row 16, representative 6001.
def source19 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B020.Data.entryAt ⟨123, by decide +kernel⟩

def target19 : Weights.Entry :=
  { word := [0, 0, 1, 4, 8, 4, 8], weights := [0, 0, 1, 0] }

def points19 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 10, original row 35, representative 5943.
def source20 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B020.Data.entryAt ⟨65, by decide +kernel⟩

def target20 : Weights.Entry :=
  { word := [0, 0, 1, 4, 12, 4, 8], weights := [0, 0, 0, 1] }

def points20 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 10, original row 36, representative 5974.
def source21 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B020.Data.entryAt ⟨96, by decide +kernel⟩

def target21 : Weights.Entry :=
  { word := [0, 0, 1, 12, 4, 4, 8], weights := [0, 1, 1, 0] }

def points21 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 10, original row 39, representative 6004.
def source22 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B020.Data.entryAt ⟨126, by decide +kernel⟩

def target22 : Weights.Entry :=
  { word := [0, 0, 1, 12, 8, 4, 8], weights := [0, 0, 1, 0] }

def points22 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 10, original row 45, representative 5950.
def source23 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B020.Data.entryAt ⟨72, by decide +kernel⟩

def target23 : Weights.Entry :=
  { word := [0, 0, 1, 12, 12, 4, 8], weights := [0, 1, 1, 0] }

def points23 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 10, original row 93, representative 5968.
def source24 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B020.Data.entryAt ⟨90, by decide +kernel⟩

def target24 : Weights.Entry :=
  { word := [0, 0, 9, 4, 4, 4, 8], weights := [1, 0, 0, 1] }

def points24 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 10, original row 97, representative 5948.
def source25 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B020.Data.entryAt ⟨70, by decide +kernel⟩

def target25 : Weights.Entry :=
  { word := [0, 0, 9, 4, 12, 4, 8], weights := [0, 0, 1, 0] }

def points25 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 10, original row 100, representative 5971.
def source26 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B020.Data.entryAt ⟨93, by decide +kernel⟩

def target26 : Weights.Entry :=
  { word := [0, 0, 9, 12, 4, 4, 8], weights := [0, 1, 1, 0] }

def points26 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 10, original row 102, representative 5949.
def source27 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B020.Data.entryAt ⟨71, by decide +kernel⟩

def target27 : Weights.Entry :=
  { word := [0, 0, 9, 12, 12, 4, 8], weights := [0, 0, 1, 0] }

def points27 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 10, original row 519, representative 5963.
def source28 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B020.Data.entryAt ⟨85, by decide +kernel⟩

def target28 : Weights.Entry :=
  { word := [0, 4, 0, 4, 4, 4, 8], weights := [0, 0, 0, 1] }

def points28 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 10, original row 522, representative 6001.
def source29 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B020.Data.entryAt ⟨123, by decide +kernel⟩

def target29 : Weights.Entry :=
  { word := [0, 4, 0, 4, 8, 4, 8], weights := [0, 0, 1, 0] }

def points29 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 10, original row 541, representative 5943.
def source30 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B020.Data.entryAt ⟨65, by decide +kernel⟩

def target30 : Weights.Entry :=
  { word := [0, 4, 0, 4, 12, 4, 8], weights := [0, 0, 0, 1] }

def points30 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 10, original row 542, representative 5974.
def source31 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B020.Data.entryAt ⟨96, by decide +kernel⟩

def target31 : Weights.Entry :=
  { word := [0, 4, 0, 12, 4, 4, 8], weights := [0, 1, 1, 0] }

def points31 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 10, original row 545, representative 6004.
def source32 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B020.Data.entryAt ⟨126, by decide +kernel⟩

def target32 : Weights.Entry :=
  { word := [0, 4, 0, 12, 8, 4, 8], weights := [0, 0, 1, 0] }

def points32 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 10, original row 551, representative 5950.
def source33 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B020.Data.entryAt ⟨72, by decide +kernel⟩

def target33 : Weights.Entry :=
  { word := [0, 4, 0, 12, 12, 4, 8], weights := [0, 1, 1, 0] }

def points33 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 10, original row 1750, representative 5963.
def source34 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B020.Data.entryAt ⟨85, by decide +kernel⟩

def target34 : Weights.Entry :=
  { word := [1, 0, 1, 4, 4, 4, 8], weights := [0, 0, 0, 1] }

def points34 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 10, original row 1753, representative 6001.
def source35 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B020.Data.entryAt ⟨123, by decide +kernel⟩

def target35 : Weights.Entry :=
  { word := [1, 0, 1, 4, 8, 4, 8], weights := [0, 0, 1, 0] }

def points35 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 10, original row 1772, representative 5943.
def source36 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B020.Data.entryAt ⟨65, by decide +kernel⟩

def target36 : Weights.Entry :=
  { word := [1, 0, 1, 4, 12, 4, 8], weights := [0, 0, 0, 1] }

def points36 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 10, original row 1773, representative 5974.
def source37 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B020.Data.entryAt ⟨96, by decide +kernel⟩

def target37 : Weights.Entry :=
  { word := [1, 0, 1, 12, 4, 4, 8], weights := [0, 1, 1, 0] }

def points37 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 10, original row 1776, representative 6004.
def source38 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B020.Data.entryAt ⟨126, by decide +kernel⟩

def target38 : Weights.Entry :=
  { word := [1, 0, 1, 12, 8, 4, 8], weights := [0, 0, 1, 0] }

def points38 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 10, original row 1782, representative 5950.
def source39 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B020.Data.entryAt ⟨72, by decide +kernel⟩

def target39 : Weights.Entry :=
  { word := [1, 0, 1, 12, 12, 4, 8], weights := [0, 1, 1, 0] }

def points39 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 10, original row 1814, representative 5968.
def source40 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B020.Data.entryAt ⟨90, by decide +kernel⟩

def target40 : Weights.Entry :=
  { word := [1, 0, 9, 4, 4, 4, 8], weights := [1, 0, 0, 1] }

def points40 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 10, original row 1818, representative 5948.
def source41 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B020.Data.entryAt ⟨70, by decide +kernel⟩

def target41 : Weights.Entry :=
  { word := [1, 0, 9, 4, 12, 4, 8], weights := [0, 0, 1, 0] }

def points41 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 10, original row 1821, representative 5971.
def source42 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B020.Data.entryAt ⟨93, by decide +kernel⟩

def target42 : Weights.Entry :=
  { word := [1, 0, 9, 12, 4, 4, 8], weights := [0, 1, 1, 0] }

def points42 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 10, original row 1823, representative 5949.
def source43 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B020.Data.entryAt ⟨71, by decide +kernel⟩

def target43 : Weights.Entry :=
  { word := [1, 0, 9, 12, 12, 4, 8], weights := [0, 0, 1, 0] }

def points43 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 10, original row 4757, representative 5963.
def source44 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B020.Data.entryAt ⟨85, by decide +kernel⟩

def target44 : Weights.Entry :=
  { word := [8, 2, 2, 2, 0, 1, 0], weights := [1, 0, 0, 0] }

def points44 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 10, original row 4759, representative 5963.
def source45 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B020.Data.entryAt ⟨85, by decide +kernel⟩

def target45 : Weights.Entry :=
  { word := [8, 2, 2, 2, 0, 2, 0], weights := [1, 0, 0, 0] }

def points45 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 10, original row 4780, representative 5968.
def source46 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B020.Data.entryAt ⟨90, by decide +kernel⟩

def target46 : Weights.Entry :=
  { word := [8, 2, 2, 2, 8, 1, 0], weights := [1, 0, 0, 1] }

def points46 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 10, original row 4796, representative 5974.
def source47 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B020.Data.entryAt ⟨96, by decide +kernel⟩

def target47 : Weights.Entry :=
  { word := [8, 2, 2, 10, 0, 1, 0], weights := [0, 1, 1, 0] }

def points47 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 10, original row 4798, representative 5974.
def source48 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B020.Data.entryAt ⟨96, by decide +kernel⟩

def target48 : Weights.Entry :=
  { word := [8, 2, 2, 10, 0, 2, 0], weights := [0, 1, 1, 0] }

def points48 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 10, original row 4820, representative 5971.
def source49 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B020.Data.entryAt ⟨93, by decide +kernel⟩

def target49 : Weights.Entry :=
  { word := [8, 2, 2, 10, 8, 1, 0], weights := [0, 1, 1, 0] }

def points49 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 10, original row 4847, representative 6001.
def source50 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B020.Data.entryAt ⟨123, by decide +kernel⟩

def target50 : Weights.Entry :=
  { word := [8, 2, 8, 2, 0, 1, 0], weights := [0, 1, 0, 0] }

def points50 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 10, original row 4849, representative 6001.
def source51 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B020.Data.entryAt ⟨123, by decide +kernel⟩

def target51 : Weights.Entry :=
  { word := [8, 2, 8, 2, 0, 2, 0], weights := [0, 1, 0, 0] }

def points51 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 10, original row 4887, representative 6004.
def source52 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B020.Data.entryAt ⟨126, by decide +kernel⟩

def target52 : Weights.Entry :=
  { word := [8, 2, 8, 10, 0, 1, 0], weights := [0, 1, 0, 0] }

def points52 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 10, original row 4889, representative 6004.
def source53 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B020.Data.entryAt ⟨126, by decide +kernel⟩

def target53 : Weights.Entry :=
  { word := [8, 2, 8, 10, 0, 2, 0], weights := [0, 1, 0, 0] }

def points53 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 10, original row 4925, representative 5943.
def source54 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B020.Data.entryAt ⟨65, by decide +kernel⟩

def target54 : Weights.Entry :=
  { word := [8, 2, 10, 2, 0, 1, 0], weights := [1, 0, 0, 0] }

def points54 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 10, original row 4927, representative 5943.
def source55 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B020.Data.entryAt ⟨65, by decide +kernel⟩

def target55 : Weights.Entry :=
  { word := [8, 2, 10, 2, 0, 2, 0], weights := [1, 0, 0, 0] }

def points55 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 10, original row 4941, representative 5948.
def source56 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B020.Data.entryAt ⟨70, by decide +kernel⟩

def target56 : Weights.Entry :=
  { word := [8, 2, 10, 2, 8, 1, 0], weights := [0, 1, 0, 0] }

def points56 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 10, original row 4958, representative 5950.
def source57 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B020.Data.entryAt ⟨72, by decide +kernel⟩

def target57 : Weights.Entry :=
  { word := [8, 2, 10, 10, 0, 1, 0], weights := [0, 1, 1, 0] }

def points57 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 10, original row 4960, representative 5950.
def source58 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B020.Data.entryAt ⟨72, by decide +kernel⟩

def target58 : Weights.Entry :=
  { word := [8, 2, 10, 10, 0, 2, 0], weights := [0, 1, 1, 0] }

def points58 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 10, original row 4975, representative 5949.
def source59 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B020.Data.entryAt ⟨71, by decide +kernel⟩

def target59 : Weights.Entry :=
  { word := [8, 2, 10, 10, 8, 1, 0], weights := [0, 1, 0, 0] }

def points59 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

def period9Entries : List Weights.Entry := [target0, target1, target2, target3, target4, target5, target6, target7, target8, target9, target10, target11, target12, target13, target14, target15, target16, target17]

def period9Chunk : RowCoverage.Chunk where
  rows := [⟨1821, target0⟩, ⟨1823, target1⟩, ⟨4757, target2⟩, ⟨4759, target3⟩, ⟨4780, target4⟩, ⟨4796, target5⟩, ⟨4798, target6⟩, ⟨4820, target7⟩, ⟨4847, target8⟩, ⟨4849, target9⟩, ⟨4887, target10⟩, ⟨4889, target11⟩, ⟨4925, target12⟩, ⟨4927, target13⟩, ⟨4941, target14⟩, ⟨4958, target15⟩, ⟨4960, target16⟩, ⟨4975, target17⟩]
  indexMask := 4209640364536349739974976222157354711415931680666611537034116090325453667989544367303150568343302886547994160962489131542439561747880310659522297895361294447720692169421162351099420297572110689724169733321604368143558583584799740055455854649207512102665369590628584457819236561943950463022313148766205768426815933923450514787336673611804948359191509646939339361630535176423834028171935550463243768269493334951714527720638194556443963613817055131042200644434194868651257093042594683519100959721715705774516261241381376540552493765692675418639277437087126975112725095877305501321633119943225011372435944297059391655632891794722567819204546391286676997426315118654493876492592171948079285837642250349414326014134057564286042001492855618710991269665234481520126422592422827479479646514450623794727817678419101085835960703241385363712014496431905362994967748210884832238919624620861808854460545741069669837278397957168349580666078514665764611287465205923384803765131855819106995511199890540516837296603328894505738114579871765398855063640666007083202655836794205807767908555284690954566810874120284936619525050054719957047145779060636901032008993738703450412621878468478043567610211114187418911487368317443628256826952527286938333673063336339177930331315682525649138972363654380311455125159451816967087556818970402113736153807770311515223345430200576819712477184618019270258409323233060647005023327637909645436946140331645792043793219732722717425726341107730529487394318488468577440154214690437130616832
  count := 18

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem period9Chunk_entries :
    period9Chunk.rows.map RowCoverage.TaggedRow.entry = period9Entries := rfl

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem period9_index_check :
    RowCoverage.indexCheck CanonicalWords.count period9Chunk = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem period9_words_check :
    RowCoverage.wordsCheck CanonicalWords.wordAt period9Chunk = true := by
  decide +kernel

def period10Entries : List Weights.Entry := [target18, target19, target20, target21, target22, target23, target24, target25, target26, target27, target28, target29, target30, target31, target32, target33, target34, target35, target36, target37, target38, target39, target40, target41, target42, target43, target44, target45, target46, target47, target48, target49, target50, target51, target52, target53, target54, target55, target56, target57, target58, target59]

def period10Chunk : RowCoverage.Chunk where
  rows := [⟨13, target18⟩, ⟨16, target19⟩, ⟨35, target20⟩, ⟨36, target21⟩, ⟨39, target22⟩, ⟨45, target23⟩, ⟨93, target24⟩, ⟨97, target25⟩, ⟨100, target26⟩, ⟨102, target27⟩, ⟨519, target28⟩, ⟨522, target29⟩, ⟨541, target30⟩, ⟨542, target31⟩, ⟨545, target32⟩, ⟨551, target33⟩, ⟨1750, target34⟩, ⟨1753, target35⟩, ⟨1772, target36⟩, ⟨1773, target37⟩, ⟨1776, target38⟩, ⟨1782, target39⟩, ⟨1814, target40⟩, ⟨1818, target41⟩, ⟨1821, target42⟩, ⟨1823, target43⟩, ⟨4757, target44⟩, ⟨4759, target45⟩, ⟨4780, target46⟩, ⟨4796, target47⟩, ⟨4798, target48⟩, ⟨4820, target49⟩, ⟨4847, target50⟩, ⟨4849, target51⟩, ⟨4887, target52⟩, ⟨4889, target53⟩, ⟨4925, target54⟩, ⟨4927, target55⟩, ⟨4941, target56⟩, ⟨4958, target57⟩, ⟨4960, target58⟩, ⟨4975, target59⟩]
  indexMask := 4209640364536349739974976222157354711415931680666611537034116090325453667989544367303150568343302886547994160962489131542439561747880310659522297895361294447720692169421162351099420297572110689724169733321604368143558583584799740055455854649207512102665369590628584457819236561943950463022313148766205768426815933923450514787336673611804948359191509646939339361630535176423834028171935550463243768269493334951714527720638194556443963613817055131042200644434194868651257093042594683519100959721715705774516261241381376540552493765692675418639277437087126975112725095877305501321633119943225011372435944297059391655632891794722567819204546391286676997426315118654493876492592171948079285837642250349414326014134057564286042001492855618710991269665234481520126422592422827479479646514450623794727817678419101085835960703241385363712014496431905362994967748210884832238919624620861808854460545741069669837278397957168349580666078514665764611287465205923404704130764512941552678018695640544207080320191711638755364172909700992406012465368859603869647594130745697837252568545503378585965703269758635964438133415857750291700880082813111526262782843578345841614873316296752514777826211547030303450531211327063128700118213519642356754389631605497693655120852574758678131476414592154423139921348526083838784354026549858681595018593345588688961160541169105876910795850582095881765969857245713674808126488888767336422295733087402468358455680435431188618637162874855429274815708349139109066916977608296392368128
  count := 42

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

end FranklSmallCyclic.TransportBatches.G046.B003.Data
