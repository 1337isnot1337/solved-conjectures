module

public import Conjectures.FranklSmallCyclicRowCoverage
public import Conjectures.FranklSmallCyclicCanonicalWords
public import Conjectures.FranklSmallCyclicOrbit9Block010Data

/-! 128 literal targets sharing one source proof block.
Original words and row indices are retained; weights may be transported.
-/
@[expose] public section

namespace FranklSmallCyclic.TransportBatches.G063.B000.Data

-- Period 9, original row 141, representative 8152.
def source0 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨121, by decide +kernel⟩

def target0 : Weights.Entry :=
  { word := [0, 1, 0, 12, 0, 12, 4], weights := [1, 0, 1, 0] }

-- Period 9, original row 300, representative 8152.
def source1 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨121, by decide +kernel⟩

def target1 : Weights.Entry :=
  { word := [0, 2, 0, 8, 1, 12, 4], weights := [0, 1, 1, 0] }

def points1 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 312, representative 8145.
def source2 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨114, by decide +kernel⟩

def target2 : Weights.Entry :=
  { word := [0, 2, 0, 8, 9, 12, 4], weights := [0, 1, 1, 0] }

-- Period 9, original row 414, representative 8140.
def source3 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨109, by decide +kernel⟩

def target3 : Weights.Entry :=
  { word := [0, 2, 8, 8, 4, 12, 4], weights := [0, 1, 0, 1] }

-- Period 9, original row 419, representative 8138.
def source4 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨107, by decide +kernel⟩

def target4 : Weights.Entry :=
  { word := [0, 2, 8, 8, 12, 12, 4], weights := [0, 1, 0, 1] }

-- Period 9, original row 556, representative 8101.
def source5 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨70, by decide +kernel⟩

def target5 : Weights.Entry :=
  { word := [0, 4, 2, 0, 1, 0, 9], weights := [0, 1, 0, 1] }

-- Period 9, original row 557, representative 8101.
def source6 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨70, by decide +kernel⟩

def target6 : Weights.Entry :=
  { word := [0, 4, 2, 0, 1, 0, 10], weights := [0, 1, 0, 1] }

def points6 : List (ℕ × ℕ) := [(0, 8), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 0), (8, 7)]

-- Period 9, original row 558, representative 8101.
def source7 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨70, by decide +kernel⟩

def target7 : Weights.Entry :=
  { word := [0, 4, 2, 0, 1, 0, 12], weights := [0, 1, 0, 1] }

def points7 : List (ℕ × ℕ) := [(0, 7), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 0), (8, 8)]

-- Period 9, original row 564, representative 8058.
def source8 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨27, by decide +kernel⟩

def target8 : Weights.Entry :=
  { word := [0, 4, 2, 0, 1, 8, 10], weights := [0, 1, 0, 1] }

-- Period 9, original row 565, representative 8058.
def source9 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨27, by decide +kernel⟩

def target9 : Weights.Entry :=
  { word := [0, 4, 2, 0, 1, 8, 12], weights := [0, 1, 0, 1] }

def points9 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 8), (8, 7)]

-- Period 9, original row 570, representative 8102.
def source10 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨71, by decide +kernel⟩

def target10 : Weights.Entry :=
  { word := [0, 4, 2, 0, 9, 0, 9], weights := [0, 1, 0, 1] }

-- Period 9, original row 571, representative 8102.
def source11 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨71, by decide +kernel⟩

def target11 : Weights.Entry :=
  { word := [0, 4, 2, 0, 9, 0, 10], weights := [0, 1, 0, 1] }

def points11 : List (ℕ × ℕ) := [(0, 8), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 0)]

-- Period 9, original row 572, representative 8103.
def source12 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨72, by decide +kernel⟩

def target12 : Weights.Entry :=
  { word := [0, 4, 2, 0, 9, 0, 12], weights := [0, 1, 0, 1] }

-- Period 9, original row 578, representative 8050.
def source13 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨19, by decide +kernel⟩

def target13 : Weights.Entry :=
  { word := [0, 4, 2, 0, 9, 8, 10], weights := [0, 1, 0, 1] }

-- Period 9, original row 579, representative 8054.
def source14 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨23, by decide +kernel⟩

def target14 : Weights.Entry :=
  { word := [0, 4, 2, 0, 9, 8, 12], weights := [0, 1, 0, 1] }

-- Period 9, original row 583, representative 8073.
def source15 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨42, by decide +kernel⟩

def target15 : Weights.Entry :=
  { word := [0, 4, 2, 8, 2, 0, 9], weights := [0, 1, 1, 0] }

-- Period 9, original row 584, representative 8073.
def source16 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨42, by decide +kernel⟩

def target16 : Weights.Entry :=
  { word := [0, 4, 2, 8, 2, 0, 10], weights := [0, 1, 1, 0] }

def points16 : List (ℕ × ℕ) := [(0, 8), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 0)]

-- Period 9, original row 597, representative 8065.
def source17 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨34, by decide +kernel⟩

def target17 : Weights.Entry :=
  { word := [0, 4, 2, 8, 10, 0, 9], weights := [0, 1, 1, 0] }

-- Period 9, original row 598, representative 8065.
def source18 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨34, by decide +kernel⟩

def target18 : Weights.Entry :=
  { word := [0, 4, 2, 8, 10, 0, 10], weights := [0, 1, 1, 0] }

def points18 : List (ℕ × ℕ) := [(0, 8), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 0)]

-- Period 9, original row 606, representative 8101.
def source19 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨70, by decide +kernel⟩

def target19 : Weights.Entry :=
  { word := [0, 4, 4, 4, 0, 0, 9], weights := [1, 0, 0, 1] }

def points19 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 607, representative 8101.
def source20 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨70, by decide +kernel⟩

def target20 : Weights.Entry :=
  { word := [0, 4, 4, 4, 0, 0, 10], weights := [1, 0, 0, 1] }

def points20 : List (ℕ × ℕ) := [(0, 8), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6), (7, 0), (8, 7)]

-- Period 9, original row 608, representative 8101.
def source21 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨70, by decide +kernel⟩

def target21 : Weights.Entry :=
  { word := [0, 4, 4, 4, 0, 0, 12], weights := [1, 0, 0, 1] }

def points21 : List (ℕ × ℕ) := [(0, 7), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6), (7, 0), (8, 8)]

-- Period 9, original row 614, representative 8058.
def source22 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨27, by decide +kernel⟩

def target22 : Weights.Entry :=
  { word := [0, 4, 4, 4, 0, 8, 10], weights := [1, 0, 0, 1] }

def points22 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 615, representative 8058.
def source23 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨27, by decide +kernel⟩

def target23 : Weights.Entry :=
  { word := [0, 4, 4, 4, 0, 8, 12], weights := [1, 0, 0, 1] }

def points23 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6), (7, 8), (8, 7)]

-- Period 9, original row 620, representative 8097.
def source24 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨66, by decide +kernel⟩

def target24 : Weights.Entry :=
  { word := [0, 4, 4, 4, 8, 0, 9], weights := [1, 0, 1, 0] }

-- Period 9, original row 621, representative 8097.
def source25 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨66, by decide +kernel⟩

def target25 : Weights.Entry :=
  { word := [0, 4, 4, 4, 8, 0, 10], weights := [1, 0, 1, 0] }

def points25 : List (ℕ × ℕ) := [(0, 8), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 0)]

-- Period 9, original row 622, representative 8099.
def source26 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨68, by decide +kernel⟩

def target26 : Weights.Entry :=
  { word := [0, 4, 4, 4, 8, 0, 12], weights := [1, 0, 0, 1] }

-- Period 9, original row 628, representative 8038.
def source27 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨7, by decide +kernel⟩

def target27 : Weights.Entry :=
  { word := [0, 4, 4, 4, 8, 8, 10], weights := [1, 0, 1, 0] }

-- Period 9, original row 629, representative 8044.
def source28 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨13, by decide +kernel⟩

def target28 : Weights.Entry :=
  { word := [0, 4, 4, 4, 8, 8, 12], weights := [1, 0, 0, 1] }

-- Period 9, original row 634, representative 8035.
def source29 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨4, by decide +kernel⟩

def target29 : Weights.Entry :=
  { word := [0, 4, 6, 8, 8, 8, 10], weights := [0, 1, 1, 0] }

-- Period 9, original row 639, representative 8076.
def source30 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨45, by decide +kernel⟩

def target30 : Weights.Entry :=
  { word := [0, 4, 8, 4, 2, 0, 9], weights := [0, 0, 1, 0] }

-- Period 9, original row 640, representative 8076.
def source31 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨45, by decide +kernel⟩

def target31 : Weights.Entry :=
  { word := [0, 4, 8, 4, 2, 0, 10], weights := [0, 0, 1, 0] }

def points31 : List (ℕ × ℕ) := [(0, 8), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 0)]

-- Period 9, original row 641, representative 8088.
def source32 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨57, by decide +kernel⟩

def target32 : Weights.Entry :=
  { word := [0, 4, 8, 4, 2, 0, 12], weights := [1, 0, 0, 1] }

-- Period 9, original row 646, representative 8032.
def source33 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨1, by decide +kernel⟩

def target33 : Weights.Entry :=
  { word := [0, 4, 8, 4, 2, 8, 12], weights := [1, 0, 0, 1] }

-- Period 9, original row 665, representative 8068.
def source34 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨37, by decide +kernel⟩

def target34 : Weights.Entry :=
  { word := [0, 4, 8, 4, 10, 0, 9], weights := [0, 0, 1, 0] }

-- Period 9, original row 666, representative 8068.
def source35 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨37, by decide +kernel⟩

def target35 : Weights.Entry :=
  { word := [0, 4, 8, 4, 10, 0, 10], weights := [0, 0, 1, 0] }

def points35 : List (ℕ × ℕ) := [(0, 8), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 0)]

-- Period 9, original row 667, representative 8082.
def source36 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨51, by decide +kernel⟩

def target36 : Weights.Entry :=
  { word := [0, 4, 8, 4, 10, 0, 12], weights := [1, 0, 0, 1] }

-- Period 9, original row 696, representative 8061.
def source37 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨30, by decide +kernel⟩

def target37 : Weights.Entry :=
  { word := [0, 4, 10, 0, 1, 8, 10], weights := [0, 1, 0, 1] }

-- Period 9, original row 697, representative 8061.
def source38 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨30, by decide +kernel⟩

def target38 : Weights.Entry :=
  { word := [0, 4, 10, 0, 1, 8, 12], weights := [0, 1, 0, 1] }

def points38 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 8), (8, 7)]

-- Period 9, original row 703, representative 8053.
def source39 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨22, by decide +kernel⟩

def target39 : Weights.Entry :=
  { word := [0, 4, 10, 0, 9, 8, 10], weights := [0, 1, 0, 1] }

-- Period 9, original row 704, representative 8057.
def source40 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨26, by decide +kernel⟩

def target40 : Weights.Entry :=
  { word := [0, 4, 10, 0, 9, 8, 12], weights := [0, 1, 0, 1] }

-- Period 9, original row 722, representative 8061.
def source41 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨30, by decide +kernel⟩

def target41 : Weights.Entry :=
  { word := [0, 4, 12, 4, 0, 8, 10], weights := [1, 0, 0, 1] }

def points41 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 723, representative 8061.
def source42 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨30, by decide +kernel⟩

def target42 : Weights.Entry :=
  { word := [0, 4, 12, 4, 0, 8, 12], weights := [1, 0, 0, 1] }

def points42 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6), (7, 8), (8, 7)]

-- Period 9, original row 728, representative 8098.
def source43 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨67, by decide +kernel⟩

def target43 : Weights.Entry :=
  { word := [0, 4, 12, 4, 8, 0, 9], weights := [1, 0, 1, 0] }

-- Period 9, original row 729, representative 8098.
def source44 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨67, by decide +kernel⟩

def target44 : Weights.Entry :=
  { word := [0, 4, 12, 4, 8, 0, 10], weights := [1, 0, 1, 0] }

def points44 : List (ℕ × ℕ) := [(0, 8), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 0)]

-- Period 9, original row 730, representative 8100.
def source45 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨69, by decide +kernel⟩

def target45 : Weights.Entry :=
  { word := [0, 4, 12, 4, 8, 0, 12], weights := [1, 0, 0, 1] }

-- Period 9, original row 736, representative 8041.
def source46 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨10, by decide +kernel⟩

def target46 : Weights.Entry :=
  { word := [0, 4, 12, 4, 8, 8, 10], weights := [1, 0, 1, 0] }

-- Period 9, original row 737, representative 8047.
def source47 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨16, by decide +kernel⟩

def target47 : Weights.Entry :=
  { word := [0, 4, 12, 4, 8, 8, 12], weights := [1, 0, 0, 1] }

-- Period 9, original row 790, representative 8158.
def source48 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨127, by decide +kernel⟩

def target48 : Weights.Entry :=
  { word := [0, 6, 10, 8, 8, 12, 2], weights := [0, 1, 1, 0] }

-- Period 9, original row 817, representative 8077.
def source49 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨46, by decide +kernel⟩

def target49 : Weights.Entry :=
  { word := [0, 8, 0, 4, 2, 0, 9], weights := [0, 0, 1, 0] }

-- Period 9, original row 818, representative 8077.
def source50 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨46, by decide +kernel⟩

def target50 : Weights.Entry :=
  { word := [0, 8, 0, 4, 2, 0, 10], weights := [0, 0, 1, 0] }

def points50 : List (ℕ × ℕ) := [(0, 8), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 0)]

-- Period 9, original row 819, representative 8089.
def source51 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨58, by decide +kernel⟩

def target51 : Weights.Entry :=
  { word := [0, 8, 0, 4, 2, 0, 12], weights := [1, 0, 0, 1] }

-- Period 9, original row 824, representative 8033.
def source52 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨2, by decide +kernel⟩

def target52 : Weights.Entry :=
  { word := [0, 8, 0, 4, 2, 8, 12], weights := [1, 0, 0, 1] }

-- Period 9, original row 843, representative 8069.
def source53 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨38, by decide +kernel⟩

def target53 : Weights.Entry :=
  { word := [0, 8, 0, 4, 10, 0, 9], weights := [0, 0, 1, 0] }

-- Period 9, original row 844, representative 8069.
def source54 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨38, by decide +kernel⟩

def target54 : Weights.Entry :=
  { word := [0, 8, 0, 4, 10, 0, 10], weights := [0, 0, 1, 0] }

def points54 : List (ℕ × ℕ) := [(0, 8), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 0)]

-- Period 9, original row 845, representative 8083.
def source55 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨52, by decide +kernel⟩

def target55 : Weights.Entry :=
  { word := [0, 8, 0, 4, 10, 0, 12], weights := [1, 0, 0, 1] }

-- Period 9, original row 896, representative 8071.
def source56 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨40, by decide +kernel⟩

def target56 : Weights.Entry :=
  { word := [0, 8, 1, 4, 2, 0, 9], weights := [0, 0, 1, 0] }

-- Period 9, original row 897, representative 8071.
def source57 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨40, by decide +kernel⟩

def target57 : Weights.Entry :=
  { word := [0, 8, 1, 4, 2, 0, 10], weights := [0, 0, 1, 0] }

def points57 : List (ℕ × ℕ) := [(0, 8), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 0)]

-- Period 9, original row 898, representative 8084.
def source58 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨53, by decide +kernel⟩

def target58 : Weights.Entry :=
  { word := [0, 8, 1, 4, 2, 0, 12], weights := [1, 0, 0, 1] }

-- Period 9, original row 918, representative 8063.
def source59 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨32, by decide +kernel⟩

def target59 : Weights.Entry :=
  { word := [0, 8, 1, 4, 10, 0, 9], weights := [0, 0, 1, 0] }

-- Period 9, original row 919, representative 8063.
def source60 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨32, by decide +kernel⟩

def target60 : Weights.Entry :=
  { word := [0, 8, 1, 4, 10, 0, 10], weights := [0, 0, 1, 0] }

def points60 : List (ℕ × ℕ) := [(0, 8), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 0)]

-- Period 9, original row 920, representative 8078.
def source61 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨47, by decide +kernel⟩

def target61 : Weights.Entry :=
  { word := [0, 8, 1, 4, 10, 0, 12], weights := [1, 0, 0, 1] }

-- Period 9, original row 942, representative 8074.
def source62 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨43, by decide +kernel⟩

def target62 : Weights.Entry :=
  { word := [0, 8, 2, 2, 2, 0, 9], weights := [0, 1, 0, 0] }

-- Period 9, original row 943, representative 8074.
def source63 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨43, by decide +kernel⟩

def target63 : Weights.Entry :=
  { word := [0, 8, 2, 2, 2, 0, 10], weights := [0, 1, 0, 0] }

def points63 : List (ℕ × ℕ) := [(0, 8), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 0)]

-- Period 9, original row 944, representative 8086.
def source64 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨55, by decide +kernel⟩

def target64 : Weights.Entry :=
  { word := [0, 8, 2, 2, 2, 0, 12], weights := [1, 0, 0, 1] }

-- Period 9, original row 957, representative 8066.
def source65 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨35, by decide +kernel⟩

def target65 : Weights.Entry :=
  { word := [0, 8, 2, 2, 10, 0, 9], weights := [0, 1, 0, 0] }

-- Period 9, original row 958, representative 8066.
def source66 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨35, by decide +kernel⟩

def target66 : Weights.Entry :=
  { word := [0, 8, 2, 2, 10, 0, 10], weights := [0, 1, 0, 0] }

def points66 : List (ℕ × ℕ) := [(0, 8), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 0)]

-- Period 9, original row 959, representative 8080.
def source67 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨49, by decide +kernel⟩

def target67 : Weights.Entry :=
  { word := [0, 8, 2, 2, 10, 0, 12], weights := [1, 0, 0, 1] }

-- Period 9, original row 972, representative 8075.
def source68 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨44, by decide +kernel⟩

def target68 : Weights.Entry :=
  { word := [0, 8, 2, 10, 2, 0, 9], weights := [0, 1, 0, 0] }

-- Period 9, original row 973, representative 8075.
def source69 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨44, by decide +kernel⟩

def target69 : Weights.Entry :=
  { word := [0, 8, 2, 10, 2, 0, 10], weights := [0, 1, 0, 0] }

def points69 : List (ℕ × ℕ) := [(0, 8), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 0)]

-- Period 9, original row 974, representative 8087.
def source70 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨56, by decide +kernel⟩

def target70 : Weights.Entry :=
  { word := [0, 8, 2, 10, 2, 0, 12], weights := [1, 1, 0, 0] }

-- Period 9, original row 986, representative 8067.
def source71 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨36, by decide +kernel⟩

def target71 : Weights.Entry :=
  { word := [0, 8, 2, 10, 10, 0, 9], weights := [0, 1, 0, 0] }

-- Period 9, original row 987, representative 8067.
def source72 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨36, by decide +kernel⟩

def target72 : Weights.Entry :=
  { word := [0, 8, 2, 10, 10, 0, 10], weights := [0, 1, 0, 0] }

def points72 : List (ℕ × ℕ) := [(0, 8), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 0)]

-- Period 9, original row 988, representative 8081.
def source73 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨50, by decide +kernel⟩

def target73 : Weights.Entry :=
  { word := [0, 8, 2, 10, 10, 0, 12], weights := [1, 1, 0, 0] }

-- Period 9, original row 1018, representative 8048.
def source74 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨17, by decide +kernel⟩

def target74 : Weights.Entry :=
  { word := [0, 8, 6, 2, 0, 8, 10], weights := [1, 0, 0, 1] }

-- Period 9, original row 1019, representative 8048.
def source75 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨17, by decide +kernel⟩

def target75 : Weights.Entry :=
  { word := [0, 8, 6, 2, 0, 8, 12], weights := [1, 0, 0, 1] }

def points75 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 8), (8, 7)]

-- Period 9, original row 1026, representative 8036.
def source76 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨5, by decide +kernel⟩

def target76 : Weights.Entry :=
  { word := [0, 8, 6, 2, 8, 8, 10], weights := [0, 1, 0, 0] }

-- Period 9, original row 1027, representative 8042.
def source77 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨11, by decide +kernel⟩

def target77 : Weights.Entry :=
  { word := [0, 8, 6, 2, 8, 8, 12], weights := [1, 0, 0, 1] }

-- Period 9, original row 1033, representative 8049.
def source78 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨18, by decide +kernel⟩

def target78 : Weights.Entry :=
  { word := [0, 8, 6, 10, 0, 8, 10], weights := [1, 0, 0, 1] }

-- Period 9, original row 1034, representative 8049.
def source79 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨18, by decide +kernel⟩

def target79 : Weights.Entry :=
  { word := [0, 8, 6, 10, 0, 8, 12], weights := [1, 0, 0, 1] }

def points79 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 8), (8, 7)]

-- Period 9, original row 1040, representative 8037.
def source80 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨6, by decide +kernel⟩

def target80 : Weights.Entry :=
  { word := [0, 8, 6, 10, 8, 8, 10], weights := [0, 1, 0, 0] }

-- Period 9, original row 1041, representative 8043.
def source81 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨12, by decide +kernel⟩

def target81 : Weights.Entry :=
  { word := [0, 8, 6, 10, 8, 8, 12], weights := [0, 1, 0, 0] }

-- Period 9, original row 1147, representative 8150.
def source82 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨119, by decide +kernel⟩

def target82 : Weights.Entry :=
  { word := [0, 9, 0, 4, 0, 12, 4], weights := [1, 0, 1, 2] }

-- Period 9, original row 1173, representative 8148.
def source83 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨117, by decide +kernel⟩

def target83 : Weights.Entry :=
  { word := [0, 9, 0, 4, 8, 12, 4], weights := [1, 0, 0, 1] }

-- Period 9, original row 1207, representative 8151.
def source84 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨120, by decide +kernel⟩

def target84 : Weights.Entry :=
  { word := [0, 9, 0, 12, 0, 12, 4], weights := [1, 0, 1, 0] }

-- Period 9, original row 1232, representative 8149.
def source85 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨118, by decide +kernel⟩

def target85 : Weights.Entry :=
  { word := [0, 9, 0, 12, 8, 12, 4], weights := [1, 0, 1, 0] }

-- Period 9, original row 1339, representative 8150.
def source86 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨119, by decide +kernel⟩

def target86 : Weights.Entry :=
  { word := [0, 10, 0, 0, 1, 12, 4], weights := [0, 1, 1, 2] }

def points86 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 1342, representative 8143.
def source87 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨112, by decide +kernel⟩

def target87 : Weights.Entry :=
  { word := [0, 10, 0, 0, 9, 12, 4], weights := [0, 1, 1, 2] }

-- Period 9, original row 1349, representative 8151.
def source88 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨120, by decide +kernel⟩

def target88 : Weights.Entry :=
  { word := [0, 10, 0, 8, 1, 12, 4], weights := [0, 1, 1, 0] }

def points88 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 1361, representative 8144.
def source89 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨113, by decide +kernel⟩

def target89 : Weights.Entry :=
  { word := [0, 10, 0, 8, 9, 12, 4], weights := [0, 1, 1, 0] }

-- Period 9, original row 1446, representative 8139.
def source90 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨108, by decide +kernel⟩

def target90 : Weights.Entry :=
  { word := [0, 10, 8, 8, 4, 12, 4], weights := [0, 1, 0, 1] }

-- Period 9, original row 1451, representative 8137.
def source91 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨106, by decide +kernel⟩

def target91 : Weights.Entry :=
  { word := [0, 10, 8, 8, 12, 12, 4], weights := [0, 1, 0, 1] }

-- Period 9, original row 1509, representative 8071.
def source92 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨40, by decide +kernel⟩

def target92 : Weights.Entry :=
  { word := [0, 12, 0, 4, 2, 0, 9], weights := [0, 0, 1, 0] }

def points92 : List (ℕ × ℕ) := [(0, 0), (1, 2), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 1510, representative 8071.
def source93 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨40, by decide +kernel⟩

def target93 : Weights.Entry :=
  { word := [0, 12, 0, 4, 2, 0, 10], weights := [0, 0, 1, 0] }

def points93 : List (ℕ × ℕ) := [(0, 8), (1, 2), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 0)]

-- Period 9, original row 1511, representative 8084.
def source94 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨53, by decide +kernel⟩

def target94 : Weights.Entry :=
  { word := [0, 12, 0, 4, 2, 0, 12], weights := [1, 0, 0, 1] }

def points94 : List (ℕ × ℕ) := [(0, 0), (1, 2), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 1531, representative 8063.
def source95 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨32, by decide +kernel⟩

def target95 : Weights.Entry :=
  { word := [0, 12, 0, 4, 10, 0, 9], weights := [0, 0, 1, 0] }

def points95 : List (ℕ × ℕ) := [(0, 0), (1, 2), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 1532, representative 8063.
def source96 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨32, by decide +kernel⟩

def target96 : Weights.Entry :=
  { word := [0, 12, 0, 4, 10, 0, 10], weights := [0, 0, 1, 0] }

def points96 : List (ℕ × ℕ) := [(0, 8), (1, 2), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 0)]

-- Period 9, original row 1533, representative 8078.
def source97 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨47, by decide +kernel⟩

def target97 : Weights.Entry :=
  { word := [0, 12, 0, 4, 10, 0, 12], weights := [1, 0, 0, 1] }

def points97 : List (ℕ × ℕ) := [(0, 0), (1, 2), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 1555, representative 8094.
def source98 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨63, by decide +kernel⟩

def target98 : Weights.Entry :=
  { word := [0, 12, 2, 0, 1, 0, 9], weights := [0, 1, 0, 1] }

-- Period 9, original row 1556, representative 8094.
def source99 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨63, by decide +kernel⟩

def target99 : Weights.Entry :=
  { word := [0, 12, 2, 0, 1, 0, 10], weights := [0, 1, 0, 1] }

def points99 : List (ℕ × ℕ) := [(0, 8), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 0), (8, 7)]

-- Period 9, original row 1557, representative 8094.
def source100 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨63, by decide +kernel⟩

def target100 : Weights.Entry :=
  { word := [0, 12, 2, 0, 1, 0, 12], weights := [0, 1, 0, 1] }

def points100 : List (ℕ × ℕ) := [(0, 7), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 0), (8, 8)]

-- Period 9, original row 1563, representative 8059.
def source101 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨28, by decide +kernel⟩

def target101 : Weights.Entry :=
  { word := [0, 12, 2, 0, 1, 8, 10], weights := [0, 1, 0, 1] }

-- Period 9, original row 1564, representative 8059.
def source102 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨28, by decide +kernel⟩

def target102 : Weights.Entry :=
  { word := [0, 12, 2, 0, 1, 8, 12], weights := [0, 1, 0, 1] }

def points102 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 8), (8, 7)]

-- Period 9, original row 1569, representative 8095.
def source103 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨64, by decide +kernel⟩

def target103 : Weights.Entry :=
  { word := [0, 12, 2, 0, 9, 0, 9], weights := [0, 1, 0, 1] }

-- Period 9, original row 1570, representative 8095.
def source104 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨64, by decide +kernel⟩

def target104 : Weights.Entry :=
  { word := [0, 12, 2, 0, 9, 0, 10], weights := [0, 1, 0, 1] }

def points104 : List (ℕ × ℕ) := [(0, 8), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 0)]

-- Period 9, original row 1571, representative 8096.
def source105 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨65, by decide +kernel⟩

def target105 : Weights.Entry :=
  { word := [0, 12, 2, 0, 9, 0, 12], weights := [0, 1, 0, 1] }

-- Period 9, original row 1577, representative 8051.
def source106 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨20, by decide +kernel⟩

def target106 : Weights.Entry :=
  { word := [0, 12, 2, 0, 9, 8, 10], weights := [0, 1, 0, 1] }

-- Period 9, original row 1578, representative 8055.
def source107 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨24, by decide +kernel⟩

def target107 : Weights.Entry :=
  { word := [0, 12, 2, 0, 9, 8, 12], weights := [0, 1, 0, 1] }

-- Period 9, original row 1582, representative 8070.
def source108 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨39, by decide +kernel⟩

def target108 : Weights.Entry :=
  { word := [0, 12, 2, 8, 2, 0, 9], weights := [0, 1, 1, 0] }

-- Period 9, original row 1583, representative 8070.
def source109 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨39, by decide +kernel⟩

def target109 : Weights.Entry :=
  { word := [0, 12, 2, 8, 2, 0, 10], weights := [0, 1, 1, 0] }

def points109 : List (ℕ × ℕ) := [(0, 8), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 0)]

-- Period 9, original row 1596, representative 8062.
def source110 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨31, by decide +kernel⟩

def target110 : Weights.Entry :=
  { word := [0, 12, 2, 8, 10, 0, 9], weights := [0, 1, 1, 0] }

-- Period 9, original row 1597, representative 8062.
def source111 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨31, by decide +kernel⟩

def target111 : Weights.Entry :=
  { word := [0, 12, 2, 8, 10, 0, 10], weights := [0, 1, 1, 0] }

def points111 : List (ℕ × ℕ) := [(0, 8), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 0)]

-- Period 9, original row 1605, representative 8094.
def source112 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨63, by decide +kernel⟩

def target112 : Weights.Entry :=
  { word := [0, 12, 4, 4, 0, 0, 9], weights := [1, 0, 0, 1] }

def points112 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 1606, representative 8094.
def source113 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨63, by decide +kernel⟩

def target113 : Weights.Entry :=
  { word := [0, 12, 4, 4, 0, 0, 10], weights := [1, 0, 0, 1] }

def points113 : List (ℕ × ℕ) := [(0, 8), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6), (7, 0), (8, 7)]

-- Period 9, original row 1607, representative 8094.
def source114 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨63, by decide +kernel⟩

def target114 : Weights.Entry :=
  { word := [0, 12, 4, 4, 0, 0, 12], weights := [1, 0, 0, 1] }

def points114 : List (ℕ × ℕ) := [(0, 7), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6), (7, 0), (8, 8)]

-- Period 9, original row 1613, representative 8059.
def source115 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨28, by decide +kernel⟩

def target115 : Weights.Entry :=
  { word := [0, 12, 4, 4, 0, 8, 10], weights := [1, 0, 0, 1] }

def points115 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 1614, representative 8059.
def source116 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨28, by decide +kernel⟩

def target116 : Weights.Entry :=
  { word := [0, 12, 4, 4, 0, 8, 12], weights := [1, 0, 0, 1] }

def points116 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6), (7, 8), (8, 7)]

-- Period 9, original row 1619, representative 8090.
def source117 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨59, by decide +kernel⟩

def target117 : Weights.Entry :=
  { word := [0, 12, 4, 4, 8, 0, 9], weights := [1, 0, 1, 0] }

-- Period 9, original row 1620, representative 8090.
def source118 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨59, by decide +kernel⟩

def target118 : Weights.Entry :=
  { word := [0, 12, 4, 4, 8, 0, 10], weights := [1, 0, 1, 0] }

def points118 : List (ℕ × ℕ) := [(0, 8), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 0)]

-- Period 9, original row 1621, representative 8092.
def source119 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨61, by decide +kernel⟩

def target119 : Weights.Entry :=
  { word := [0, 12, 4, 4, 8, 0, 12], weights := [1, 0, 0, 1] }

-- Period 9, original row 1627, representative 8039.
def source120 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨8, by decide +kernel⟩

def target120 : Weights.Entry :=
  { word := [0, 12, 4, 4, 8, 8, 10], weights := [1, 0, 1, 0] }

-- Period 9, original row 1628, representative 8045.
def source121 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨14, by decide +kernel⟩

def target121 : Weights.Entry :=
  { word := [0, 12, 4, 4, 8, 8, 12], weights := [1, 0, 0, 1] }

-- Period 9, original row 1633, representative 8034.
def source122 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨3, by decide +kernel⟩

def target122 : Weights.Entry :=
  { word := [0, 12, 6, 8, 8, 8, 10], weights := [0, 1, 1, 0] }

-- Period 9, original row 1638, representative 8072.
def source123 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨41, by decide +kernel⟩

def target123 : Weights.Entry :=
  { word := [0, 12, 8, 4, 2, 0, 9], weights := [0, 0, 1, 0] }

-- Period 9, original row 1639, representative 8072.
def source124 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨41, by decide +kernel⟩

def target124 : Weights.Entry :=
  { word := [0, 12, 8, 4, 2, 0, 10], weights := [0, 0, 1, 0] }

def points124 : List (ℕ × ℕ) := [(0, 8), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 0)]

-- Period 9, original row 1640, representative 8085.
def source125 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨54, by decide +kernel⟩

def target125 : Weights.Entry :=
  { word := [0, 12, 8, 4, 2, 0, 12], weights := [1, 0, 0, 1] }

-- Period 9, original row 1645, representative 8031.
def source126 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨0, by decide +kernel⟩

def target126 : Weights.Entry :=
  { word := [0, 12, 8, 4, 2, 8, 12], weights := [1, 0, 0, 1] }

-- Period 9, original row 1664, representative 8064.
def source127 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨33, by decide +kernel⟩

def target127 : Weights.Entry :=
  { word := [0, 12, 8, 4, 10, 0, 9], weights := [0, 0, 1, 0] }

def period9Entries : List Weights.Entry := [target0, target1, target2, target3, target4, target5, target6, target7, target8, target9, target10, target11, target12, target13, target14, target15, target16, target17, target18, target19, target20, target21, target22, target23, target24, target25, target26, target27, target28, target29, target30, target31, target32, target33, target34, target35, target36, target37, target38, target39, target40, target41, target42, target43, target44, target45, target46, target47, target48, target49, target50, target51, target52, target53, target54, target55, target56, target57, target58, target59, target60, target61, target62, target63, target64, target65, target66, target67, target68, target69, target70, target71, target72, target73, target74, target75, target76, target77, target78, target79, target80, target81, target82, target83, target84, target85, target86, target87, target88, target89, target90, target91, target92, target93, target94, target95, target96, target97, target98, target99, target100, target101, target102, target103, target104, target105, target106, target107, target108, target109, target110, target111, target112, target113, target114, target115, target116, target117, target118, target119, target120, target121, target122, target123, target124, target125, target126, target127]

def period9Chunk : RowCoverage.Chunk where
  rows := [⟨141, target0⟩, ⟨300, target1⟩, ⟨312, target2⟩, ⟨414, target3⟩, ⟨419, target4⟩, ⟨556, target5⟩, ⟨557, target6⟩, ⟨558, target7⟩, ⟨564, target8⟩, ⟨565, target9⟩, ⟨570, target10⟩, ⟨571, target11⟩, ⟨572, target12⟩, ⟨578, target13⟩, ⟨579, target14⟩, ⟨583, target15⟩, ⟨584, target16⟩, ⟨597, target17⟩, ⟨598, target18⟩, ⟨606, target19⟩, ⟨607, target20⟩, ⟨608, target21⟩, ⟨614, target22⟩, ⟨615, target23⟩, ⟨620, target24⟩, ⟨621, target25⟩, ⟨622, target26⟩, ⟨628, target27⟩, ⟨629, target28⟩, ⟨634, target29⟩, ⟨639, target30⟩, ⟨640, target31⟩, ⟨641, target32⟩, ⟨646, target33⟩, ⟨665, target34⟩, ⟨666, target35⟩, ⟨667, target36⟩, ⟨696, target37⟩, ⟨697, target38⟩, ⟨703, target39⟩, ⟨704, target40⟩, ⟨722, target41⟩, ⟨723, target42⟩, ⟨728, target43⟩, ⟨729, target44⟩, ⟨730, target45⟩, ⟨736, target46⟩, ⟨737, target47⟩, ⟨790, target48⟩, ⟨817, target49⟩, ⟨818, target50⟩, ⟨819, target51⟩, ⟨824, target52⟩, ⟨843, target53⟩, ⟨844, target54⟩, ⟨845, target55⟩, ⟨896, target56⟩, ⟨897, target57⟩, ⟨898, target58⟩, ⟨918, target59⟩, ⟨919, target60⟩, ⟨920, target61⟩, ⟨942, target62⟩, ⟨943, target63⟩, ⟨944, target64⟩, ⟨957, target65⟩, ⟨958, target66⟩, ⟨959, target67⟩, ⟨972, target68⟩, ⟨973, target69⟩, ⟨974, target70⟩, ⟨986, target71⟩, ⟨987, target72⟩, ⟨988, target73⟩, ⟨1018, target74⟩, ⟨1019, target75⟩, ⟨1026, target76⟩, ⟨1027, target77⟩, ⟨1033, target78⟩, ⟨1034, target79⟩, ⟨1040, target80⟩, ⟨1041, target81⟩, ⟨1147, target82⟩, ⟨1173, target83⟩, ⟨1207, target84⟩, ⟨1232, target85⟩, ⟨1339, target86⟩, ⟨1342, target87⟩, ⟨1349, target88⟩, ⟨1361, target89⟩, ⟨1446, target90⟩, ⟨1451, target91⟩, ⟨1509, target92⟩, ⟨1510, target93⟩, ⟨1511, target94⟩, ⟨1531, target95⟩, ⟨1532, target96⟩, ⟨1533, target97⟩, ⟨1555, target98⟩, ⟨1556, target99⟩, ⟨1557, target100⟩, ⟨1563, target101⟩, ⟨1564, target102⟩, ⟨1569, target103⟩, ⟨1570, target104⟩, ⟨1571, target105⟩, ⟨1577, target106⟩, ⟨1578, target107⟩, ⟨1582, target108⟩, ⟨1583, target109⟩, ⟨1596, target110⟩, ⟨1597, target111⟩, ⟨1605, target112⟩, ⟨1606, target113⟩, ⟨1607, target114⟩, ⟨1613, target115⟩, ⟨1614, target116⟩, ⟨1619, target117⟩, ⟨1620, target118⟩, ⟨1621, target119⟩, ⟨1627, target120⟩, ⟨1628, target121⟩, ⟨1633, target122⟩, ⟨1638, target123⟩, ⟨1639, target124⟩, ⟨1640, target125⟩, ⟨1645, target126⟩, ⟨1664, target127⟩]
  indexMask := 820188467985994101643881277369167042076694244300484250478428371257231344277254481708778729118449354051713282424405409647265943149187710998635203384837096673835519838565853982858982563513901907635669292282413574092273697057388349489493027769220296936490216818347456982773608711410988307136412885261839943136033756159655409166250755555528275502639376508298388757519251726765255661004985169747091060024720064566339366716259946327866046838279142929094356289496089305286894394908670436016573175418593476608
  count := 128

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

end FranklSmallCyclic.TransportBatches.G063.B000.Data
