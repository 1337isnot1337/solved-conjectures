module

public import Conjectures.FranklSmallCyclicRowCoverage
public import Conjectures.FranklSmallCyclicCanonicalWords
public import Conjectures.FranklSmallCyclicOrbit9Block010Data

/-! 128 literal targets sharing one source proof block.
Original words and row indices are retained; weights may be transported.
-/
@[expose] public section

namespace FranklSmallCyclic.TransportBatches.G063.B004.Data

-- Period 10, original row 614, representative 8058.
def source0 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨27, by decide +kernel⟩

def target0 : Weights.Entry :=
  { word := [0, 4, 4, 4, 0, 8, 10], weights := [1, 0, 0, 1] }

def points0 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 10, original row 615, representative 8058.
def source1 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨27, by decide +kernel⟩

def target1 : Weights.Entry :=
  { word := [0, 4, 4, 4, 0, 8, 12], weights := [1, 0, 0, 1] }

def points1 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6), (7, 8), (8, 7)]

-- Period 10, original row 620, representative 8097.
def source2 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨66, by decide +kernel⟩

def target2 : Weights.Entry :=
  { word := [0, 4, 4, 4, 8, 0, 9], weights := [1, 0, 1, 0] }

def points2 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 10, original row 621, representative 8097.
def source3 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨66, by decide +kernel⟩

def target3 : Weights.Entry :=
  { word := [0, 4, 4, 4, 8, 0, 10], weights := [1, 0, 1, 0] }

def points3 : List (ℕ × ℕ) := [(0, 8), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 9)]

-- Period 10, original row 622, representative 8099.
def source4 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨68, by decide +kernel⟩

def target4 : Weights.Entry :=
  { word := [0, 4, 4, 4, 8, 0, 12], weights := [1, 0, 0, 1] }

def points4 : List (ℕ × ℕ) := [(0, 8), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 9)]

-- Period 10, original row 628, representative 8038.
def source5 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨7, by decide +kernel⟩

def target5 : Weights.Entry :=
  { word := [0, 4, 4, 4, 8, 8, 10], weights := [1, 0, 1, 0] }

def points5 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 10, original row 629, representative 8044.
def source6 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨13, by decide +kernel⟩

def target6 : Weights.Entry :=
  { word := [0, 4, 4, 4, 8, 8, 12], weights := [1, 0, 0, 1] }

def points6 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 10, original row 634, representative 8035.
def source7 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨4, by decide +kernel⟩

def target7 : Weights.Entry :=
  { word := [0, 4, 6, 8, 8, 8, 10], weights := [0, 1, 1, 0] }

def points7 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 10, original row 639, representative 8076.
def source8 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨45, by decide +kernel⟩

def target8 : Weights.Entry :=
  { word := [0, 4, 8, 4, 2, 0, 9], weights := [0, 0, 1, 0] }

def points8 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 10, original row 640, representative 8076.
def source9 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨45, by decide +kernel⟩

def target9 : Weights.Entry :=
  { word := [0, 4, 8, 4, 2, 0, 10], weights := [0, 0, 1, 0] }

def points9 : List (ℕ × ℕ) := [(0, 8), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 9)]

-- Period 10, original row 641, representative 8088.
def source10 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨57, by decide +kernel⟩

def target10 : Weights.Entry :=
  { word := [0, 4, 8, 4, 2, 0, 12], weights := [1, 0, 0, 1] }

def points10 : List (ℕ × ℕ) := [(0, 8), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 9)]

-- Period 10, original row 646, representative 8032.
def source11 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨1, by decide +kernel⟩

def target11 : Weights.Entry :=
  { word := [0, 4, 8, 4, 2, 8, 12], weights := [1, 0, 0, 1] }

def points11 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 10, original row 665, representative 8068.
def source12 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨37, by decide +kernel⟩

def target12 : Weights.Entry :=
  { word := [0, 4, 8, 4, 10, 0, 9], weights := [0, 0, 1, 0] }

def points12 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 10, original row 666, representative 8068.
def source13 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨37, by decide +kernel⟩

def target13 : Weights.Entry :=
  { word := [0, 4, 8, 4, 10, 0, 10], weights := [0, 0, 1, 0] }

def points13 : List (ℕ × ℕ) := [(0, 8), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 9)]

-- Period 10, original row 667, representative 8082.
def source14 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨51, by decide +kernel⟩

def target14 : Weights.Entry :=
  { word := [0, 4, 8, 4, 10, 0, 12], weights := [1, 0, 0, 1] }

def points14 : List (ℕ × ℕ) := [(0, 8), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 9)]

-- Period 10, original row 696, representative 8061.
def source15 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨30, by decide +kernel⟩

def target15 : Weights.Entry :=
  { word := [0, 4, 10, 0, 1, 8, 10], weights := [0, 1, 0, 1] }

def points15 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 10, original row 697, representative 8061.
def source16 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨30, by decide +kernel⟩

def target16 : Weights.Entry :=
  { word := [0, 4, 10, 0, 1, 8, 12], weights := [0, 1, 0, 1] }

def points16 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 8), (8, 7)]

-- Period 10, original row 703, representative 8053.
def source17 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨22, by decide +kernel⟩

def target17 : Weights.Entry :=
  { word := [0, 4, 10, 0, 9, 8, 10], weights := [0, 1, 0, 1] }

def points17 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 10, original row 704, representative 8057.
def source18 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨26, by decide +kernel⟩

def target18 : Weights.Entry :=
  { word := [0, 4, 10, 0, 9, 8, 12], weights := [0, 1, 0, 1] }

def points18 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 10, original row 722, representative 8061.
def source19 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨30, by decide +kernel⟩

def target19 : Weights.Entry :=
  { word := [0, 4, 12, 4, 0, 8, 10], weights := [1, 0, 0, 1] }

def points19 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 10, original row 723, representative 8061.
def source20 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨30, by decide +kernel⟩

def target20 : Weights.Entry :=
  { word := [0, 4, 12, 4, 0, 8, 12], weights := [1, 0, 0, 1] }

def points20 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6), (7, 8), (8, 7)]

-- Period 10, original row 728, representative 8098.
def source21 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨67, by decide +kernel⟩

def target21 : Weights.Entry :=
  { word := [0, 4, 12, 4, 8, 0, 9], weights := [1, 0, 1, 0] }

def points21 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 10, original row 729, representative 8098.
def source22 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨67, by decide +kernel⟩

def target22 : Weights.Entry :=
  { word := [0, 4, 12, 4, 8, 0, 10], weights := [1, 0, 1, 0] }

def points22 : List (ℕ × ℕ) := [(0, 8), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 9)]

-- Period 10, original row 730, representative 8100.
def source23 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨69, by decide +kernel⟩

def target23 : Weights.Entry :=
  { word := [0, 4, 12, 4, 8, 0, 12], weights := [1, 0, 0, 1] }

def points23 : List (ℕ × ℕ) := [(0, 8), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 9)]

-- Period 10, original row 736, representative 8041.
def source24 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨10, by decide +kernel⟩

def target24 : Weights.Entry :=
  { word := [0, 4, 12, 4, 8, 8, 10], weights := [1, 0, 1, 0] }

def points24 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 10, original row 737, representative 8047.
def source25 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨16, by decide +kernel⟩

def target25 : Weights.Entry :=
  { word := [0, 4, 12, 4, 8, 8, 12], weights := [1, 0, 0, 1] }

def points25 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 10, original row 790, representative 8158.
def source26 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨127, by decide +kernel⟩

def target26 : Weights.Entry :=
  { word := [0, 6, 10, 8, 8, 12, 2], weights := [0, 1, 1, 0] }

def points26 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 10, original row 817, representative 8077.
def source27 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨46, by decide +kernel⟩

def target27 : Weights.Entry :=
  { word := [0, 8, 0, 4, 2, 0, 9], weights := [0, 0, 1, 0] }

def points27 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 10, original row 818, representative 8077.
def source28 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨46, by decide +kernel⟩

def target28 : Weights.Entry :=
  { word := [0, 8, 0, 4, 2, 0, 10], weights := [0, 0, 1, 0] }

def points28 : List (ℕ × ℕ) := [(0, 8), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 9)]

-- Period 10, original row 819, representative 8089.
def source29 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨58, by decide +kernel⟩

def target29 : Weights.Entry :=
  { word := [0, 8, 0, 4, 2, 0, 12], weights := [1, 0, 0, 1] }

def points29 : List (ℕ × ℕ) := [(0, 8), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 9)]

-- Period 10, original row 824, representative 8033.
def source30 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨2, by decide +kernel⟩

def target30 : Weights.Entry :=
  { word := [0, 8, 0, 4, 2, 8, 12], weights := [1, 0, 0, 1] }

def points30 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 10, original row 843, representative 8069.
def source31 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨38, by decide +kernel⟩

def target31 : Weights.Entry :=
  { word := [0, 8, 0, 4, 10, 0, 9], weights := [0, 0, 1, 0] }

def points31 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 10, original row 844, representative 8069.
def source32 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨38, by decide +kernel⟩

def target32 : Weights.Entry :=
  { word := [0, 8, 0, 4, 10, 0, 10], weights := [0, 0, 1, 0] }

def points32 : List (ℕ × ℕ) := [(0, 8), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 9)]

-- Period 10, original row 845, representative 8083.
def source33 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨52, by decide +kernel⟩

def target33 : Weights.Entry :=
  { word := [0, 8, 0, 4, 10, 0, 12], weights := [1, 0, 0, 1] }

def points33 : List (ℕ × ℕ) := [(0, 8), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 9)]

-- Period 10, original row 896, representative 8071.
def source34 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨40, by decide +kernel⟩

def target34 : Weights.Entry :=
  { word := [0, 8, 1, 4, 2, 0, 9], weights := [0, 0, 1, 0] }

def points34 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 10, original row 897, representative 8071.
def source35 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨40, by decide +kernel⟩

def target35 : Weights.Entry :=
  { word := [0, 8, 1, 4, 2, 0, 10], weights := [0, 0, 1, 0] }

def points35 : List (ℕ × ℕ) := [(0, 8), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 9)]

-- Period 10, original row 898, representative 8084.
def source36 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨53, by decide +kernel⟩

def target36 : Weights.Entry :=
  { word := [0, 8, 1, 4, 2, 0, 12], weights := [1, 0, 0, 1] }

def points36 : List (ℕ × ℕ) := [(0, 8), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 9)]

-- Period 10, original row 918, representative 8063.
def source37 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨32, by decide +kernel⟩

def target37 : Weights.Entry :=
  { word := [0, 8, 1, 4, 10, 0, 9], weights := [0, 0, 1, 0] }

def points37 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 10, original row 919, representative 8063.
def source38 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨32, by decide +kernel⟩

def target38 : Weights.Entry :=
  { word := [0, 8, 1, 4, 10, 0, 10], weights := [0, 0, 1, 0] }

def points38 : List (ℕ × ℕ) := [(0, 8), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 9)]

-- Period 10, original row 920, representative 8078.
def source39 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨47, by decide +kernel⟩

def target39 : Weights.Entry :=
  { word := [0, 8, 1, 4, 10, 0, 12], weights := [1, 0, 0, 1] }

def points39 : List (ℕ × ℕ) := [(0, 8), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 9)]

-- Period 10, original row 942, representative 8074.
def source40 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨43, by decide +kernel⟩

def target40 : Weights.Entry :=
  { word := [0, 8, 2, 2, 2, 0, 9], weights := [0, 1, 0, 0] }

def points40 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 10, original row 943, representative 8074.
def source41 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨43, by decide +kernel⟩

def target41 : Weights.Entry :=
  { word := [0, 8, 2, 2, 2, 0, 10], weights := [0, 1, 0, 0] }

def points41 : List (ℕ × ℕ) := [(0, 8), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 9)]

-- Period 10, original row 944, representative 8086.
def source42 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨55, by decide +kernel⟩

def target42 : Weights.Entry :=
  { word := [0, 8, 2, 2, 2, 0, 12], weights := [1, 0, 0, 1] }

def points42 : List (ℕ × ℕ) := [(0, 8), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 9)]

-- Period 10, original row 957, representative 8066.
def source43 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨35, by decide +kernel⟩

def target43 : Weights.Entry :=
  { word := [0, 8, 2, 2, 10, 0, 9], weights := [0, 1, 0, 0] }

def points43 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 10, original row 958, representative 8066.
def source44 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨35, by decide +kernel⟩

def target44 : Weights.Entry :=
  { word := [0, 8, 2, 2, 10, 0, 10], weights := [0, 1, 0, 0] }

def points44 : List (ℕ × ℕ) := [(0, 8), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 9)]

-- Period 10, original row 959, representative 8080.
def source45 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨49, by decide +kernel⟩

def target45 : Weights.Entry :=
  { word := [0, 8, 2, 2, 10, 0, 12], weights := [1, 0, 0, 1] }

def points45 : List (ℕ × ℕ) := [(0, 8), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 9)]

-- Period 10, original row 972, representative 8075.
def source46 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨44, by decide +kernel⟩

def target46 : Weights.Entry :=
  { word := [0, 8, 2, 10, 2, 0, 9], weights := [0, 1, 0, 0] }

def points46 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 10, original row 973, representative 8075.
def source47 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨44, by decide +kernel⟩

def target47 : Weights.Entry :=
  { word := [0, 8, 2, 10, 2, 0, 10], weights := [0, 1, 0, 0] }

def points47 : List (ℕ × ℕ) := [(0, 8), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 9)]

-- Period 10, original row 974, representative 8087.
def source48 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨56, by decide +kernel⟩

def target48 : Weights.Entry :=
  { word := [0, 8, 2, 10, 2, 0, 12], weights := [1, 1, 0, 0] }

def points48 : List (ℕ × ℕ) := [(0, 8), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 9)]

-- Period 10, original row 986, representative 8067.
def source49 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨36, by decide +kernel⟩

def target49 : Weights.Entry :=
  { word := [0, 8, 2, 10, 10, 0, 9], weights := [0, 1, 0, 0] }

def points49 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 10, original row 987, representative 8067.
def source50 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨36, by decide +kernel⟩

def target50 : Weights.Entry :=
  { word := [0, 8, 2, 10, 10, 0, 10], weights := [0, 1, 0, 0] }

def points50 : List (ℕ × ℕ) := [(0, 8), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 9)]

-- Period 10, original row 988, representative 8081.
def source51 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨50, by decide +kernel⟩

def target51 : Weights.Entry :=
  { word := [0, 8, 2, 10, 10, 0, 12], weights := [1, 1, 0, 0] }

def points51 : List (ℕ × ℕ) := [(0, 8), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 9)]

-- Period 10, original row 1018, representative 8048.
def source52 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨17, by decide +kernel⟩

def target52 : Weights.Entry :=
  { word := [0, 8, 6, 2, 0, 8, 10], weights := [1, 0, 0, 1] }

def points52 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 10, original row 1019, representative 8048.
def source53 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨17, by decide +kernel⟩

def target53 : Weights.Entry :=
  { word := [0, 8, 6, 2, 0, 8, 12], weights := [1, 0, 0, 1] }

def points53 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 8), (8, 7)]

-- Period 10, original row 1026, representative 8036.
def source54 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨5, by decide +kernel⟩

def target54 : Weights.Entry :=
  { word := [0, 8, 6, 2, 8, 8, 10], weights := [0, 1, 0, 0] }

def points54 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 10, original row 1027, representative 8042.
def source55 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨11, by decide +kernel⟩

def target55 : Weights.Entry :=
  { word := [0, 8, 6, 2, 8, 8, 12], weights := [1, 0, 0, 1] }

def points55 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 10, original row 1033, representative 8049.
def source56 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨18, by decide +kernel⟩

def target56 : Weights.Entry :=
  { word := [0, 8, 6, 10, 0, 8, 10], weights := [1, 0, 0, 1] }

def points56 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 10, original row 1034, representative 8049.
def source57 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨18, by decide +kernel⟩

def target57 : Weights.Entry :=
  { word := [0, 8, 6, 10, 0, 8, 12], weights := [1, 0, 0, 1] }

def points57 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 8), (8, 7)]

-- Period 10, original row 1040, representative 8037.
def source58 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨6, by decide +kernel⟩

def target58 : Weights.Entry :=
  { word := [0, 8, 6, 10, 8, 8, 10], weights := [0, 1, 0, 0] }

def points58 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 10, original row 1041, representative 8043.
def source59 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨12, by decide +kernel⟩

def target59 : Weights.Entry :=
  { word := [0, 8, 6, 10, 8, 8, 12], weights := [0, 1, 0, 0] }

def points59 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 10, original row 1147, representative 8150.
def source60 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨119, by decide +kernel⟩

def target60 : Weights.Entry :=
  { word := [0, 9, 0, 4, 0, 12, 4], weights := [1, 0, 1, 2] }

def points60 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 10, original row 1173, representative 8148.
def source61 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨117, by decide +kernel⟩

def target61 : Weights.Entry :=
  { word := [0, 9, 0, 4, 8, 12, 4], weights := [1, 0, 0, 1] }

def points61 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 10, original row 1207, representative 8151.
def source62 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨120, by decide +kernel⟩

def target62 : Weights.Entry :=
  { word := [0, 9, 0, 12, 0, 12, 4], weights := [1, 0, 1, 0] }

def points62 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 10, original row 1232, representative 8149.
def source63 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨118, by decide +kernel⟩

def target63 : Weights.Entry :=
  { word := [0, 9, 0, 12, 8, 12, 4], weights := [1, 0, 1, 0] }

def points63 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 10, original row 1339, representative 8150.
def source64 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨119, by decide +kernel⟩

def target64 : Weights.Entry :=
  { word := [0, 10, 0, 0, 1, 12, 4], weights := [0, 1, 1, 2] }

def points64 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 10, original row 1342, representative 8143.
def source65 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨112, by decide +kernel⟩

def target65 : Weights.Entry :=
  { word := [0, 10, 0, 0, 9, 12, 4], weights := [0, 1, 1, 2] }

def points65 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 10, original row 1349, representative 8151.
def source66 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨120, by decide +kernel⟩

def target66 : Weights.Entry :=
  { word := [0, 10, 0, 8, 1, 12, 4], weights := [0, 1, 1, 0] }

def points66 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 10, original row 1361, representative 8144.
def source67 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨113, by decide +kernel⟩

def target67 : Weights.Entry :=
  { word := [0, 10, 0, 8, 9, 12, 4], weights := [0, 1, 1, 0] }

def points67 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 10, original row 1446, representative 8139.
def source68 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨108, by decide +kernel⟩

def target68 : Weights.Entry :=
  { word := [0, 10, 8, 8, 4, 12, 4], weights := [0, 1, 0, 1] }

def points68 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 10, original row 1451, representative 8137.
def source69 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨106, by decide +kernel⟩

def target69 : Weights.Entry :=
  { word := [0, 10, 8, 8, 12, 12, 4], weights := [0, 1, 0, 1] }

def points69 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 10, original row 1509, representative 8071.
def source70 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨40, by decide +kernel⟩

def target70 : Weights.Entry :=
  { word := [0, 12, 0, 4, 2, 0, 9], weights := [0, 0, 1, 0] }

def points70 : List (ℕ × ℕ) := [(0, 9), (1, 2), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 10, original row 1510, representative 8071.
def source71 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨40, by decide +kernel⟩

def target71 : Weights.Entry :=
  { word := [0, 12, 0, 4, 2, 0, 10], weights := [0, 0, 1, 0] }

def points71 : List (ℕ × ℕ) := [(0, 8), (1, 2), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 9)]

-- Period 10, original row 1511, representative 8084.
def source72 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨53, by decide +kernel⟩

def target72 : Weights.Entry :=
  { word := [0, 12, 0, 4, 2, 0, 12], weights := [1, 0, 0, 1] }

def points72 : List (ℕ × ℕ) := [(0, 8), (1, 2), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 9)]

-- Period 10, original row 1531, representative 8063.
def source73 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨32, by decide +kernel⟩

def target73 : Weights.Entry :=
  { word := [0, 12, 0, 4, 10, 0, 9], weights := [0, 0, 1, 0] }

def points73 : List (ℕ × ℕ) := [(0, 9), (1, 2), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 10, original row 1532, representative 8063.
def source74 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨32, by decide +kernel⟩

def target74 : Weights.Entry :=
  { word := [0, 12, 0, 4, 10, 0, 10], weights := [0, 0, 1, 0] }

def points74 : List (ℕ × ℕ) := [(0, 8), (1, 2), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 9)]

-- Period 10, original row 1533, representative 8078.
def source75 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨47, by decide +kernel⟩

def target75 : Weights.Entry :=
  { word := [0, 12, 0, 4, 10, 0, 12], weights := [1, 0, 0, 1] }

def points75 : List (ℕ × ℕ) := [(0, 8), (1, 2), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 9)]

-- Period 10, original row 1555, representative 8094.
def source76 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨63, by decide +kernel⟩

def target76 : Weights.Entry :=
  { word := [0, 12, 2, 0, 1, 0, 9], weights := [0, 1, 0, 1] }

def points76 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 10, original row 1556, representative 8094.
def source77 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨63, by decide +kernel⟩

def target77 : Weights.Entry :=
  { word := [0, 12, 2, 0, 1, 0, 10], weights := [0, 1, 0, 1] }

def points77 : List (ℕ × ℕ) := [(0, 8), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 9)]

-- Period 10, original row 1557, representative 8094.
def source78 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨63, by decide +kernel⟩

def target78 : Weights.Entry :=
  { word := [0, 12, 2, 0, 1, 0, 12], weights := [0, 1, 0, 1] }

def points78 : List (ℕ × ℕ) := [(0, 7), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 8), (8, 9)]

-- Period 10, original row 1563, representative 8059.
def source79 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨28, by decide +kernel⟩

def target79 : Weights.Entry :=
  { word := [0, 12, 2, 0, 1, 8, 10], weights := [0, 1, 0, 1] }

def points79 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 10, original row 1564, representative 8059.
def source80 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨28, by decide +kernel⟩

def target80 : Weights.Entry :=
  { word := [0, 12, 2, 0, 1, 8, 12], weights := [0, 1, 0, 1] }

def points80 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 8), (8, 7)]

-- Period 10, original row 1569, representative 8095.
def source81 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨64, by decide +kernel⟩

def target81 : Weights.Entry :=
  { word := [0, 12, 2, 0, 9, 0, 9], weights := [0, 1, 0, 1] }

def points81 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 10, original row 1570, representative 8095.
def source82 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨64, by decide +kernel⟩

def target82 : Weights.Entry :=
  { word := [0, 12, 2, 0, 9, 0, 10], weights := [0, 1, 0, 1] }

def points82 : List (ℕ × ℕ) := [(0, 8), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 9)]

-- Period 10, original row 1571, representative 8096.
def source83 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨65, by decide +kernel⟩

def target83 : Weights.Entry :=
  { word := [0, 12, 2, 0, 9, 0, 12], weights := [0, 1, 0, 1] }

def points83 : List (ℕ × ℕ) := [(0, 8), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 9)]

-- Period 10, original row 1577, representative 8051.
def source84 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨20, by decide +kernel⟩

def target84 : Weights.Entry :=
  { word := [0, 12, 2, 0, 9, 8, 10], weights := [0, 1, 0, 1] }

def points84 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 10, original row 1578, representative 8055.
def source85 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨24, by decide +kernel⟩

def target85 : Weights.Entry :=
  { word := [0, 12, 2, 0, 9, 8, 12], weights := [0, 1, 0, 1] }

def points85 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 10, original row 1582, representative 8070.
def source86 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨39, by decide +kernel⟩

def target86 : Weights.Entry :=
  { word := [0, 12, 2, 8, 2, 0, 9], weights := [0, 1, 1, 0] }

def points86 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 10, original row 1583, representative 8070.
def source87 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨39, by decide +kernel⟩

def target87 : Weights.Entry :=
  { word := [0, 12, 2, 8, 2, 0, 10], weights := [0, 1, 1, 0] }

def points87 : List (ℕ × ℕ) := [(0, 8), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 9)]

-- Period 10, original row 1596, representative 8062.
def source88 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨31, by decide +kernel⟩

def target88 : Weights.Entry :=
  { word := [0, 12, 2, 8, 10, 0, 9], weights := [0, 1, 1, 0] }

def points88 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 10, original row 1597, representative 8062.
def source89 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨31, by decide +kernel⟩

def target89 : Weights.Entry :=
  { word := [0, 12, 2, 8, 10, 0, 10], weights := [0, 1, 1, 0] }

def points89 : List (ℕ × ℕ) := [(0, 8), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 9)]

-- Period 10, original row 1605, representative 8094.
def source90 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨63, by decide +kernel⟩

def target90 : Weights.Entry :=
  { word := [0, 12, 4, 4, 0, 0, 9], weights := [1, 0, 0, 1] }

def points90 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 10, original row 1606, representative 8094.
def source91 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨63, by decide +kernel⟩

def target91 : Weights.Entry :=
  { word := [0, 12, 4, 4, 0, 0, 10], weights := [1, 0, 0, 1] }

def points91 : List (ℕ × ℕ) := [(0, 8), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6), (7, 7), (8, 9)]

-- Period 10, original row 1607, representative 8094.
def source92 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨63, by decide +kernel⟩

def target92 : Weights.Entry :=
  { word := [0, 12, 4, 4, 0, 0, 12], weights := [1, 0, 0, 1] }

def points92 : List (ℕ × ℕ) := [(0, 7), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6), (7, 8), (8, 9)]

-- Period 10, original row 1613, representative 8059.
def source93 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨28, by decide +kernel⟩

def target93 : Weights.Entry :=
  { word := [0, 12, 4, 4, 0, 8, 10], weights := [1, 0, 0, 1] }

def points93 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 10, original row 1614, representative 8059.
def source94 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨28, by decide +kernel⟩

def target94 : Weights.Entry :=
  { word := [0, 12, 4, 4, 0, 8, 12], weights := [1, 0, 0, 1] }

def points94 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6), (7, 8), (8, 7)]

-- Period 10, original row 1619, representative 8090.
def source95 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨59, by decide +kernel⟩

def target95 : Weights.Entry :=
  { word := [0, 12, 4, 4, 8, 0, 9], weights := [1, 0, 1, 0] }

def points95 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 10, original row 1620, representative 8090.
def source96 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨59, by decide +kernel⟩

def target96 : Weights.Entry :=
  { word := [0, 12, 4, 4, 8, 0, 10], weights := [1, 0, 1, 0] }

def points96 : List (ℕ × ℕ) := [(0, 8), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 9)]

-- Period 10, original row 1621, representative 8092.
def source97 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨61, by decide +kernel⟩

def target97 : Weights.Entry :=
  { word := [0, 12, 4, 4, 8, 0, 12], weights := [1, 0, 0, 1] }

def points97 : List (ℕ × ℕ) := [(0, 8), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 9)]

-- Period 10, original row 1627, representative 8039.
def source98 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨8, by decide +kernel⟩

def target98 : Weights.Entry :=
  { word := [0, 12, 4, 4, 8, 8, 10], weights := [1, 0, 1, 0] }

def points98 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 10, original row 1628, representative 8045.
def source99 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨14, by decide +kernel⟩

def target99 : Weights.Entry :=
  { word := [0, 12, 4, 4, 8, 8, 12], weights := [1, 0, 0, 1] }

def points99 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 10, original row 1633, representative 8034.
def source100 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨3, by decide +kernel⟩

def target100 : Weights.Entry :=
  { word := [0, 12, 6, 8, 8, 8, 10], weights := [0, 1, 1, 0] }

def points100 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 10, original row 1638, representative 8072.
def source101 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨41, by decide +kernel⟩

def target101 : Weights.Entry :=
  { word := [0, 12, 8, 4, 2, 0, 9], weights := [0, 0, 1, 0] }

def points101 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 10, original row 1639, representative 8072.
def source102 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨41, by decide +kernel⟩

def target102 : Weights.Entry :=
  { word := [0, 12, 8, 4, 2, 0, 10], weights := [0, 0, 1, 0] }

def points102 : List (ℕ × ℕ) := [(0, 8), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 9)]

-- Period 10, original row 1640, representative 8085.
def source103 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨54, by decide +kernel⟩

def target103 : Weights.Entry :=
  { word := [0, 12, 8, 4, 2, 0, 12], weights := [1, 0, 0, 1] }

def points103 : List (ℕ × ℕ) := [(0, 8), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 9)]

-- Period 10, original row 1645, representative 8031.
def source104 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨0, by decide +kernel⟩

def target104 : Weights.Entry :=
  { word := [0, 12, 8, 4, 2, 8, 12], weights := [1, 0, 0, 1] }

def points104 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 10, original row 1664, representative 8064.
def source105 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨33, by decide +kernel⟩

def target105 : Weights.Entry :=
  { word := [0, 12, 8, 4, 10, 0, 9], weights := [0, 0, 1, 0] }

def points105 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 10, original row 1665, representative 8064.
def source106 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨33, by decide +kernel⟩

def target106 : Weights.Entry :=
  { word := [0, 12, 8, 4, 10, 0, 10], weights := [0, 0, 1, 0] }

def points106 : List (ℕ × ℕ) := [(0, 8), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 9)]

-- Period 10, original row 1666, representative 8079.
def source107 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨48, by decide +kernel⟩

def target107 : Weights.Entry :=
  { word := [0, 12, 8, 4, 10, 0, 12], weights := [1, 0, 0, 1] }

def points107 : List (ℕ × ℕ) := [(0, 8), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 9)]

-- Period 10, original row 1695, representative 8060.
def source108 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨29, by decide +kernel⟩

def target108 : Weights.Entry :=
  { word := [0, 12, 10, 0, 1, 8, 10], weights := [0, 1, 0, 1] }

def points108 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 10, original row 1696, representative 8060.
def source109 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨29, by decide +kernel⟩

def target109 : Weights.Entry :=
  { word := [0, 12, 10, 0, 1, 8, 12], weights := [0, 1, 0, 1] }

def points109 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 8), (8, 7)]

-- Period 10, original row 1702, representative 8052.
def source110 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨21, by decide +kernel⟩

def target110 : Weights.Entry :=
  { word := [0, 12, 10, 0, 9, 8, 10], weights := [0, 1, 0, 1] }

def points110 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 10, original row 1703, representative 8056.
def source111 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨25, by decide +kernel⟩

def target111 : Weights.Entry :=
  { word := [0, 12, 10, 0, 9, 8, 12], weights := [0, 1, 0, 1] }

def points111 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 10, original row 1721, representative 8060.
def source112 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨29, by decide +kernel⟩

def target112 : Weights.Entry :=
  { word := [0, 12, 12, 4, 0, 8, 10], weights := [1, 0, 0, 1] }

def points112 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 10, original row 1722, representative 8060.
def source113 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨29, by decide +kernel⟩

def target113 : Weights.Entry :=
  { word := [0, 12, 12, 4, 0, 8, 12], weights := [1, 0, 0, 1] }

def points113 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6), (7, 8), (8, 7)]

-- Period 10, original row 1727, representative 8091.
def source114 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨60, by decide +kernel⟩

def target114 : Weights.Entry :=
  { word := [0, 12, 12, 4, 8, 0, 9], weights := [1, 0, 1, 0] }

def points114 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 10, original row 1728, representative 8091.
def source115 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨60, by decide +kernel⟩

def target115 : Weights.Entry :=
  { word := [0, 12, 12, 4, 8, 0, 10], weights := [1, 0, 1, 0] }

def points115 : List (ℕ × ℕ) := [(0, 8), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 9)]

-- Period 10, original row 1729, representative 8093.
def source116 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨62, by decide +kernel⟩

def target116 : Weights.Entry :=
  { word := [0, 12, 12, 4, 8, 0, 12], weights := [1, 0, 0, 1] }

def points116 : List (ℕ × ℕ) := [(0, 8), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 9)]

-- Period 10, original row 1735, representative 8040.
def source117 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨9, by decide +kernel⟩

def target117 : Weights.Entry :=
  { word := [0, 12, 12, 4, 8, 8, 10], weights := [1, 0, 1, 0] }

def points117 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 10, original row 1736, representative 8046.
def source118 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨15, by decide +kernel⟩

def target118 : Weights.Entry :=
  { word := [0, 12, 12, 4, 8, 8, 12], weights := [1, 0, 0, 1] }

def points118 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 10, original row 1845, representative 8101.
def source119 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨70, by decide +kernel⟩

def target119 : Weights.Entry :=
  { word := [1, 4, 2, 0, 1, 0, 9], weights := [0, 1, 0, 1] }

def points119 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 10, original row 1846, representative 8101.
def source120 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨70, by decide +kernel⟩

def target120 : Weights.Entry :=
  { word := [1, 4, 2, 0, 1, 0, 10], weights := [0, 1, 0, 1] }

def points120 : List (ℕ × ℕ) := [(0, 8), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 9)]

-- Period 10, original row 1847, representative 8101.
def source121 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨70, by decide +kernel⟩

def target121 : Weights.Entry :=
  { word := [1, 4, 2, 0, 1, 0, 12], weights := [0, 1, 0, 1] }

def points121 : List (ℕ × ℕ) := [(0, 7), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 8), (8, 9)]

-- Period 10, original row 1853, representative 8058.
def source122 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨27, by decide +kernel⟩

def target122 : Weights.Entry :=
  { word := [1, 4, 2, 0, 1, 8, 10], weights := [0, 1, 0, 1] }

def points122 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 10, original row 1854, representative 8058.
def source123 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨27, by decide +kernel⟩

def target123 : Weights.Entry :=
  { word := [1, 4, 2, 0, 1, 8, 12], weights := [0, 1, 0, 1] }

def points123 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 8), (8, 7)]

-- Period 10, original row 1859, representative 8102.
def source124 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨71, by decide +kernel⟩

def target124 : Weights.Entry :=
  { word := [1, 4, 2, 0, 9, 0, 9], weights := [0, 1, 0, 1] }

def points124 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 10, original row 1860, representative 8102.
def source125 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨71, by decide +kernel⟩

def target125 : Weights.Entry :=
  { word := [1, 4, 2, 0, 9, 0, 10], weights := [0, 1, 0, 1] }

def points125 : List (ℕ × ℕ) := [(0, 8), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 9)]

-- Period 10, original row 1861, representative 8103.
def source126 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨72, by decide +kernel⟩

def target126 : Weights.Entry :=
  { word := [1, 4, 2, 0, 9, 0, 12], weights := [0, 1, 0, 1] }

def points126 : List (ℕ × ℕ) := [(0, 8), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 9)]

-- Period 10, original row 1867, representative 8050.
def source127 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨19, by decide +kernel⟩

def target127 : Weights.Entry :=
  { word := [1, 4, 2, 0, 9, 8, 10], weights := [0, 1, 0, 1] }

def points127 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

def period10Entries : List Weights.Entry := [target0, target1, target2, target3, target4, target5, target6, target7, target8, target9, target10, target11, target12, target13, target14, target15, target16, target17, target18, target19, target20, target21, target22, target23, target24, target25, target26, target27, target28, target29, target30, target31, target32, target33, target34, target35, target36, target37, target38, target39, target40, target41, target42, target43, target44, target45, target46, target47, target48, target49, target50, target51, target52, target53, target54, target55, target56, target57, target58, target59, target60, target61, target62, target63, target64, target65, target66, target67, target68, target69, target70, target71, target72, target73, target74, target75, target76, target77, target78, target79, target80, target81, target82, target83, target84, target85, target86, target87, target88, target89, target90, target91, target92, target93, target94, target95, target96, target97, target98, target99, target100, target101, target102, target103, target104, target105, target106, target107, target108, target109, target110, target111, target112, target113, target114, target115, target116, target117, target118, target119, target120, target121, target122, target123, target124, target125, target126, target127]

def period10Chunk : RowCoverage.Chunk where
  rows := [⟨614, target0⟩, ⟨615, target1⟩, ⟨620, target2⟩, ⟨621, target3⟩, ⟨622, target4⟩, ⟨628, target5⟩, ⟨629, target6⟩, ⟨634, target7⟩, ⟨639, target8⟩, ⟨640, target9⟩, ⟨641, target10⟩, ⟨646, target11⟩, ⟨665, target12⟩, ⟨666, target13⟩, ⟨667, target14⟩, ⟨696, target15⟩, ⟨697, target16⟩, ⟨703, target17⟩, ⟨704, target18⟩, ⟨722, target19⟩, ⟨723, target20⟩, ⟨728, target21⟩, ⟨729, target22⟩, ⟨730, target23⟩, ⟨736, target24⟩, ⟨737, target25⟩, ⟨790, target26⟩, ⟨817, target27⟩, ⟨818, target28⟩, ⟨819, target29⟩, ⟨824, target30⟩, ⟨843, target31⟩, ⟨844, target32⟩, ⟨845, target33⟩, ⟨896, target34⟩, ⟨897, target35⟩, ⟨898, target36⟩, ⟨918, target37⟩, ⟨919, target38⟩, ⟨920, target39⟩, ⟨942, target40⟩, ⟨943, target41⟩, ⟨944, target42⟩, ⟨957, target43⟩, ⟨958, target44⟩, ⟨959, target45⟩, ⟨972, target46⟩, ⟨973, target47⟩, ⟨974, target48⟩, ⟨986, target49⟩, ⟨987, target50⟩, ⟨988, target51⟩, ⟨1018, target52⟩, ⟨1019, target53⟩, ⟨1026, target54⟩, ⟨1027, target55⟩, ⟨1033, target56⟩, ⟨1034, target57⟩, ⟨1040, target58⟩, ⟨1041, target59⟩, ⟨1147, target60⟩, ⟨1173, target61⟩, ⟨1207, target62⟩, ⟨1232, target63⟩, ⟨1339, target64⟩, ⟨1342, target65⟩, ⟨1349, target66⟩, ⟨1361, target67⟩, ⟨1446, target68⟩, ⟨1451, target69⟩, ⟨1509, target70⟩, ⟨1510, target71⟩, ⟨1511, target72⟩, ⟨1531, target73⟩, ⟨1532, target74⟩, ⟨1533, target75⟩, ⟨1555, target76⟩, ⟨1556, target77⟩, ⟨1557, target78⟩, ⟨1563, target79⟩, ⟨1564, target80⟩, ⟨1569, target81⟩, ⟨1570, target82⟩, ⟨1571, target83⟩, ⟨1577, target84⟩, ⟨1578, target85⟩, ⟨1582, target86⟩, ⟨1583, target87⟩, ⟨1596, target88⟩, ⟨1597, target89⟩, ⟨1605, target90⟩, ⟨1606, target91⟩, ⟨1607, target92⟩, ⟨1613, target93⟩, ⟨1614, target94⟩, ⟨1619, target95⟩, ⟨1620, target96⟩, ⟨1621, target97⟩, ⟨1627, target98⟩, ⟨1628, target99⟩, ⟨1633, target100⟩, ⟨1638, target101⟩, ⟨1639, target102⟩, ⟨1640, target103⟩, ⟨1645, target104⟩, ⟨1664, target105⟩, ⟨1665, target106⟩, ⟨1666, target107⟩, ⟨1695, target108⟩, ⟨1696, target109⟩, ⟨1702, target110⟩, ⟨1703, target111⟩, ⟨1721, target112⟩, ⟨1722, target113⟩, ⟨1727, target114⟩, ⟨1728, target115⟩, ⟨1729, target116⟩, ⟨1735, target117⟩, ⟨1736, target118⟩, ⟨1845, target119⟩, ⟨1846, target120⟩, ⟨1847, target121⟩, ⟨1853, target122⟩, ⟨1854, target123⟩, ⟨1859, target124⟩, ⟨1860, target125⟩, ⟨1861, target126⟩, ⟨1867, target127⟩]
  indexMask := 10834173632465840503699418373120231705710134036535671610228484679476750910843316276171885878718721961104056171971044032170325649553580481260367616737461833599087309544384415030832786571188309123852511999433987441094135677236075779553390372199027755972981062618031176908480055876737941625931842576708354397893523023400077522555607875625503623846691492589282070541301101662748562535886751604948974494257559764936429451785380124588392671477644167239851274288871127974610656576580626034344389371503654730557448295889637330854576925700128097072315480091278689473396736
  count := 128

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

end FranklSmallCyclic.TransportBatches.G063.B004.Data
