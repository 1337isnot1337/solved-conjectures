module

public import Conjectures.FranklSmallCyclicRowCoverage
public import Conjectures.FranklSmallCyclicCanonicalWords
public import Conjectures.FranklSmallCyclicOrbit8Block000Data

/-! 128 literal targets sharing one source proof block.
Original words and row indices are retained; weights may be transported.
-/
@[expose] public section

namespace FranklSmallCyclic.TransportBatches.G026.B001.Data

-- Period 8, original row 7630, representative 3356.
def source0 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B000.Data.entryAt ⟨48, by decide +kernel⟩

def target0 : Weights.Entry :=
  { word := [10, 2, 0, 10, 8, 8, 12], weights := [1, 0, 0, 1] }

-- Period 8, original row 7633, representative 3435.
def source1 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B000.Data.entryAt ⟨127, by decide +kernel⟩

def target1 : Weights.Entry :=
  { word := [10, 2, 0, 12, 10, 0, 4], weights := [1, 1, 0, 1] }

def points1 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 7637, representative 3375.
def source2 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B000.Data.entryAt ⟨67, by decide +kernel⟩

def target2 : Weights.Entry :=
  { word := [10, 2, 0, 12, 10, 0, 12], weights := [1, 1, 0, 1] }

def points2 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 7648, representative 3365.
def source3 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B000.Data.entryAt ⟨57, by decide +kernel⟩

def target3 : Weights.Entry :=
  { word := [10, 2, 2, 8, 1, 0, 12], weights := [1, 1, 0, 1] }

def points3 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 7658, representative 3425.
def source4 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B000.Data.entryAt ⟨117, by decide +kernel⟩

def target4 : Weights.Entry :=
  { word := [10, 2, 2, 8, 9, 0, 4], weights := [1, 1, 0, 1] }

def points4 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 7662, representative 3364.
def source5 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B000.Data.entryAt ⟨56, by decide +kernel⟩

def target5 : Weights.Entry :=
  { word := [10, 2, 2, 8, 9, 0, 12], weights := [1, 1, 0, 1] }

def points5 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 7675, representative 3415.
def source6 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B000.Data.entryAt ⟨107, by decide +kernel⟩

def target6 : Weights.Entry :=
  { word := [10, 2, 8, 2, 0, 8, 4], weights := [1, 0, 0, 1] }

def points6 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 7679, representative 3352.
def source7 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B000.Data.entryAt ⟨44, by decide +kernel⟩

def target7 : Weights.Entry :=
  { word := [10, 2, 8, 2, 0, 8, 12], weights := [1, 0, 0, 1] }

-- Period 8, original row 7684, representative 3421.
def source8 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B000.Data.entryAt ⟨113, by decide +kernel⟩

def target8 : Weights.Entry :=
  { word := [10, 2, 8, 2, 8, 0, 4], weights := [1, 0, 0, 1] }

def points8 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 7685, representative 3358.
def source9 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B000.Data.entryAt ⟨50, by decide +kernel⟩

def target9 : Weights.Entry :=
  { word := [10, 2, 8, 2, 8, 0, 12], weights := [1, 0, 0, 1] }

def points9 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 7688, representative 3416.
def source10 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B000.Data.entryAt ⟨108, by decide +kernel⟩

def target10 : Weights.Entry :=
  { word := [10, 2, 8, 2, 8, 8, 4], weights := [1, 0, 0, 1] }

def points10 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 7689, representative 3353.
def source11 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B000.Data.entryAt ⟨45, by decide +kernel⟩

def target11 : Weights.Entry :=
  { word := [10, 2, 8, 2, 8, 8, 12], weights := [1, 0, 0, 1] }

-- Period 8, original row 7706, representative 3428.
def source12 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B000.Data.entryAt ⟨120, by decide +kernel⟩

def target12 : Weights.Entry :=
  { word := [10, 2, 8, 9, 8, 1, 4], weights := [1, 1, 0, 1] }

def points12 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 7707, representative 3368.
def source13 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B000.Data.entryAt ⟨60, by decide +kernel⟩

def target13 : Weights.Entry :=
  { word := [10, 2, 8, 9, 8, 1, 12], weights := [1, 1, 0, 1] }

def points13 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 7710, representative 3431.
def source14 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B000.Data.entryAt ⟨123, by decide +kernel⟩

def target14 : Weights.Entry :=
  { word := [10, 2, 8, 9, 8, 8, 4], weights := [1, 1, 0, 1] }

def points14 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 7711, representative 3307.
def source15 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B000.Data.entryAt ⟨2, by decide +kernel⟩

def target15 : Weights.Entry :=
  { word := [10, 2, 8, 9, 8, 8, 6], weights := [1, 1, 0, 1] }

def points15 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 7712, representative 3371.
def source16 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B000.Data.entryAt ⟨63, by decide +kernel⟩

def target16 : Weights.Entry :=
  { word := [10, 2, 8, 9, 8, 8, 12], weights := [1, 1, 0, 1] }

-- Period 8, original row 7713, representative 3426.
def source17 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B000.Data.entryAt ⟨118, by decide +kernel⟩

def target17 : Weights.Entry :=
  { word := [10, 2, 8, 9, 8, 9, 4], weights := [1, 1, 0, 1] }

def points17 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 7714, representative 3366.
def source18 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B000.Data.entryAt ⟨58, by decide +kernel⟩

def target18 : Weights.Entry :=
  { word := [10, 2, 8, 9, 8, 9, 12], weights := [1, 1, 0, 1] }

-- Period 8, original row 7725, representative 3418.
def source19 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B000.Data.entryAt ⟨110, by decide +kernel⟩

def target19 : Weights.Entry :=
  { word := [10, 2, 8, 10, 0, 8, 4], weights := [0, 1, 0, 1] }

def points19 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 7729, representative 3355.
def source20 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B000.Data.entryAt ⟨47, by decide +kernel⟩

def target20 : Weights.Entry :=
  { word := [10, 2, 8, 10, 0, 8, 12], weights := [1, 0, 0, 1] }

-- Period 8, original row 7735, representative 3422.
def source21 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B000.Data.entryAt ⟨114, by decide +kernel⟩

def target21 : Weights.Entry :=
  { word := [10, 2, 8, 10, 8, 0, 4], weights := [0, 1, 0, 1] }

def points21 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 7736, representative 3359.
def source22 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B000.Data.entryAt ⟨51, by decide +kernel⟩

def target22 : Weights.Entry :=
  { word := [10, 2, 8, 10, 8, 0, 12], weights := [0, 1, 0, 1] }

def points22 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 7741, representative 3417.
def source23 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B000.Data.entryAt ⟨109, by decide +kernel⟩

def target23 : Weights.Entry :=
  { word := [10, 2, 8, 10, 8, 8, 4], weights := [0, 1, 0, 1] }

def points23 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 7742, representative 3354.
def source24 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B000.Data.entryAt ⟨46, by decide +kernel⟩

def target24 : Weights.Entry :=
  { word := [10, 2, 8, 10, 8, 8, 12], weights := [1, 0, 0, 1] }

-- Period 8, original row 7749, representative 3434.
def source25 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B000.Data.entryAt ⟨126, by decide +kernel⟩

def target25 : Weights.Entry :=
  { word := [10, 2, 8, 12, 2, 0, 4], weights := [1, 1, 0, 1] }

def points25 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 7753, representative 3374.
def source26 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B000.Data.entryAt ⟨66, by decide +kernel⟩

def target26 : Weights.Entry :=
  { word := [10, 2, 8, 12, 2, 0, 12], weights := [1, 1, 0, 1] }

def points26 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 7765, representative 3433.
def source27 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B000.Data.entryAt ⟨125, by decide +kernel⟩

def target27 : Weights.Entry :=
  { word := [10, 2, 8, 12, 10, 0, 4], weights := [1, 1, 0, 1] }

def points27 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 7769, representative 3373.
def source28 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B000.Data.entryAt ⟨65, by decide +kernel⟩

def target28 : Weights.Entry :=
  { word := [10, 2, 8, 12, 10, 0, 12], weights := [1, 1, 0, 1] }

def points28 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 7771, representative 3430.
def source29 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B000.Data.entryAt ⟨122, by decide +kernel⟩

def target29 : Weights.Entry :=
  { word := [10, 2, 8, 12, 10, 8, 4], weights := [2, 1, 1, 2] }

def points29 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 7774, representative 3370.
def source30 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B000.Data.entryAt ⟨62, by decide +kernel⟩

def target30 : Weights.Entry :=
  { word := [10, 2, 8, 12, 10, 8, 12], weights := [2, 1, 1, 2] }

-- Period 8, original row 7788, representative 3363.
def source31 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B000.Data.entryAt ⟨55, by decide +kernel⟩

def target31 : Weights.Entry :=
  { word := [10, 2, 10, 8, 1, 0, 12], weights := [1, 1, 0, 1] }

def points31 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 7798, representative 3424.
def source32 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B000.Data.entryAt ⟨116, by decide +kernel⟩

def target32 : Weights.Entry :=
  { word := [10, 2, 10, 8, 9, 0, 4], weights := [1, 1, 0, 1] }

def points32 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 7802, representative 3362.
def source33 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B000.Data.entryAt ⟨54, by decide +kernel⟩

def target33 : Weights.Entry :=
  { word := [10, 2, 10, 8, 9, 0, 12], weights := [1, 1, 0, 1] }

def points33 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 7825, representative 3384.
def source34 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B000.Data.entryAt ⟨76, by decide +kernel⟩

def target34 : Weights.Entry :=
  { word := [10, 8, 0, 4, 2, 0, 12], weights := [1, 0, 0, 1] }

def points34 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 7830, representative 3376.
def source35 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B000.Data.entryAt ⟨68, by decide +kernel⟩

def target35 : Weights.Entry :=
  { word := [10, 8, 0, 4, 2, 8, 12], weights := [1, 0, 0, 1] }

-- Period 8, original row 7841, representative 3352.
def source36 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B000.Data.entryAt ⟨44, by decide +kernel⟩

def target36 : Weights.Entry :=
  { word := [10, 8, 0, 4, 8, 4, 12], weights := [1, 0, 0, 1] }

def points36 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 7844, representative 3326.
def source37 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B000.Data.entryAt ⟨21, by decide +kernel⟩

def target37 : Weights.Entry :=
  { word := [10, 8, 0, 4, 8, 12, 12], weights := [1, 0, 0, 1] }

-- Period 8, original row 7851, representative 3389.
def source38 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B000.Data.entryAt ⟨81, by decide +kernel⟩

def target38 : Weights.Entry :=
  { word := [10, 8, 0, 4, 10, 0, 12], weights := [1, 0, 0, 1] }

def points38 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 7856, representative 3377.
def source39 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B000.Data.entryAt ⟨69, by decide +kernel⟩

def target39 : Weights.Entry :=
  { word := [10, 8, 0, 4, 10, 8, 12], weights := [1, 0, 0, 1] }

-- Period 8, original row 7867, representative 3357.
def source40 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B000.Data.entryAt ⟨49, by decide +kernel⟩

def target40 : Weights.Entry :=
  { word := [10, 8, 0, 12, 0, 4, 12], weights := [1, 0, 0, 1] }

def points40 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 7870, representative 3331.
def source41 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B000.Data.entryAt ⟨26, by decide +kernel⟩

def target41 : Weights.Entry :=
  { word := [10, 8, 0, 12, 0, 12, 12], weights := [1, 0, 1, 0] }

-- Period 8, original row 7877, representative 3391.
def source42 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B000.Data.entryAt ⟨83, by decide +kernel⟩

def target42 : Weights.Entry :=
  { word := [10, 8, 0, 12, 2, 0, 12], weights := [1, 0, 0, 1] }

def points42 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 7882, representative 3383.
def source43 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B000.Data.entryAt ⟨75, by decide +kernel⟩

def target43 : Weights.Entry :=
  { word := [10, 8, 0, 12, 2, 8, 12], weights := [1, 0, 1, 0] }

-- Period 8, original row 7892, representative 3355.
def source44 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B000.Data.entryAt ⟨47, by decide +kernel⟩

def target44 : Weights.Entry :=
  { word := [10, 8, 0, 12, 8, 4, 12], weights := [1, 0, 0, 1] }

def points44 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 7895, representative 3329.
def source45 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B000.Data.entryAt ⟨24, by decide +kernel⟩

def target45 : Weights.Entry :=
  { word := [10, 8, 0, 12, 8, 12, 12], weights := [1, 0, 1, 0] }

-- Period 8, original row 7902, representative 3390.
def source46 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B000.Data.entryAt ⟨82, by decide +kernel⟩

def target46 : Weights.Entry :=
  { word := [10, 8, 0, 12, 10, 0, 12], weights := [1, 0, 0, 1] }

def points46 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 7907, representative 3380.
def source47 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B000.Data.entryAt ⟨72, by decide +kernel⟩

def target47 : Weights.Entry :=
  { word := [10, 8, 0, 12, 10, 8, 12], weights := [1, 0, 1, 0] }

-- Period 8, original row 7927, representative 3376.
def source48 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B000.Data.entryAt ⟨68, by decide +kernel⟩

def target48 : Weights.Entry :=
  { word := [10, 8, 4, 2, 0, 8, 12], weights := [1, 0, 0, 1] }

def points48 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 7935, representative 3381.
def source49 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B000.Data.entryAt ⟨73, by decide +kernel⟩

def target49 : Weights.Entry :=
  { word := [10, 8, 4, 2, 8, 8, 12], weights := [1, 0, 0, 1] }

-- Period 8, original row 7954, representative 3383.
def source50 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B000.Data.entryAt ⟨75, by decide +kernel⟩

def target50 : Weights.Entry :=
  { word := [10, 8, 4, 10, 0, 8, 12], weights := [0, 1, 0, 1] }

def points50 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 7959, representative 3382.
def source51 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B000.Data.entryAt ⟨74, by decide +kernel⟩

def target51 : Weights.Entry :=
  { word := [10, 8, 4, 10, 8, 8, 12], weights := [1, 0, 0, 1] }

-- Period 8, original row 7989, representative 3385.
def source52 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B000.Data.entryAt ⟨77, by decide +kernel⟩

def target52 : Weights.Entry :=
  { word := [10, 8, 8, 4, 2, 0, 12], weights := [1, 0, 0, 1] }

def points52 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 7994, representative 3381.
def source53 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B000.Data.entryAt ⟨73, by decide +kernel⟩

def target53 : Weights.Entry :=
  { word := [10, 8, 8, 4, 2, 8, 12], weights := [1, 0, 0, 1] }

def points53 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 8007, representative 3353.
def source54 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B000.Data.entryAt ⟨45, by decide +kernel⟩

def target54 : Weights.Entry :=
  { word := [10, 8, 8, 4, 8, 4, 12], weights := [1, 0, 0, 1] }

def points54 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 8012, representative 3327.
def source55 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B000.Data.entryAt ⟨22, by decide +kernel⟩

def target55 : Weights.Entry :=
  { word := [10, 8, 8, 4, 8, 12, 12], weights := [1, 0, 0, 1] }

-- Period 8, original row 8019, representative 3386.
def source56 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B000.Data.entryAt ⟨78, by decide +kernel⟩

def target56 : Weights.Entry :=
  { word := [10, 8, 8, 4, 10, 0, 12], weights := [1, 0, 0, 1] }

def points56 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 8024, representative 3378.
def source57 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B000.Data.entryAt ⟨70, by decide +kernel⟩

def target57 : Weights.Entry :=
  { word := [10, 8, 8, 4, 10, 8, 12], weights := [1, 0, 0, 1] }

-- Period 8, original row 8033, representative 3372.
def source58 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B000.Data.entryAt ⟨64, by decide +kernel⟩

def target58 : Weights.Entry :=
  { word := [10, 8, 8, 8, 1, 4, 12], weights := [1, 0, 1, 1] }

def points58 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 8038, representative 3347.
def source59 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B000.Data.entryAt ⟨39, by decide +kernel⟩

def target59 : Weights.Entry :=
  { word := [10, 8, 8, 8, 1, 12, 12], weights := [1, 0, 1, 1] }

-- Period 8, original row 8040, representative 3371.
def source60 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B000.Data.entryAt ⟨63, by decide +kernel⟩

def target60 : Weights.Entry :=
  { word := [10, 8, 8, 8, 9, 4, 12], weights := [1, 0, 1, 1] }

def points60 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 8042, representative 3346.
def source61 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B000.Data.entryAt ⟨38, by decide +kernel⟩

def target61 : Weights.Entry :=
  { word := [10, 8, 8, 8, 9, 12, 12], weights := [1, 0, 1, 1] }

-- Period 8, original row 8051, representative 3356.
def source62 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B000.Data.entryAt ⟨48, by decide +kernel⟩

def target62 : Weights.Entry :=
  { word := [10, 8, 8, 12, 0, 4, 12], weights := [1, 0, 0, 1] }

def points62 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 8056, representative 3330.
def source63 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B000.Data.entryAt ⟨25, by decide +kernel⟩

def target63 : Weights.Entry :=
  { word := [10, 8, 8, 12, 0, 12, 12], weights := [1, 0, 1, 0] }

-- Period 8, original row 8063, representative 3388.
def source64 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B000.Data.entryAt ⟨80, by decide +kernel⟩

def target64 : Weights.Entry :=
  { word := [10, 8, 8, 12, 2, 0, 12], weights := [1, 0, 0, 1] }

def points64 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 8068, representative 3382.
def source65 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B000.Data.entryAt ⟨74, by decide +kernel⟩

def target65 : Weights.Entry :=
  { word := [10, 8, 8, 12, 2, 8, 12], weights := [1, 0, 0, 1] }

def points65 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 8080, representative 3354.
def source66 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B000.Data.entryAt ⟨46, by decide +kernel⟩

def target66 : Weights.Entry :=
  { word := [10, 8, 8, 12, 8, 4, 12], weights := [1, 0, 0, 1] }

def points66 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 8085, representative 3328.
def source67 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B000.Data.entryAt ⟨23, by decide +kernel⟩

def target67 : Weights.Entry :=
  { word := [10, 8, 8, 12, 8, 12, 12], weights := [1, 0, 1, 0] }

-- Period 8, original row 8092, representative 3387.
def source68 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B000.Data.entryAt ⟨79, by decide +kernel⟩

def target68 : Weights.Entry :=
  { word := [10, 8, 8, 12, 10, 0, 12], weights := [1, 0, 0, 1] }

def points68 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 8097, representative 3379.
def source69 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B000.Data.entryAt ⟨71, by decide +kernel⟩

def target69 : Weights.Entry :=
  { word := [10, 8, 8, 12, 10, 8, 12], weights := [1, 0, 1, 0] }

-- Period 8, original row 8108, representative 3367.
def source70 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B000.Data.entryAt ⟨59, by decide +kernel⟩

def target70 : Weights.Entry :=
  { word := [10, 8, 9, 8, 1, 4, 12], weights := [1, 0, 1, 1] }

def points70 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 8113, representative 3341.
def source71 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B000.Data.entryAt ⟨35, by decide +kernel⟩

def target71 : Weights.Entry :=
  { word := [10, 8, 9, 8, 1, 12, 12], weights := [1, 0, 1, 1] }

-- Period 8, original row 8115, representative 3366.
def source72 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B000.Data.entryAt ⟨58, by decide +kernel⟩

def target72 : Weights.Entry :=
  { word := [10, 8, 9, 8, 9, 4, 12], weights := [1, 0, 1, 1] }

def points72 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 8135, representative 3377.
def source73 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B000.Data.entryAt ⟨69, by decide +kernel⟩

def target73 : Weights.Entry :=
  { word := [10, 8, 12, 2, 0, 8, 12], weights := [1, 0, 0, 1] }

def points73 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 8143, representative 3378.
def source74 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B000.Data.entryAt ⟨70, by decide +kernel⟩

def target74 : Weights.Entry :=
  { word := [10, 8, 12, 2, 8, 8, 12], weights := [1, 0, 0, 1] }

def points74 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 8162, representative 3380.
def source75 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B000.Data.entryAt ⟨72, by decide +kernel⟩

def target75 : Weights.Entry :=
  { word := [10, 8, 12, 10, 0, 8, 12], weights := [0, 1, 0, 1] }

def points75 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 8167, representative 3370.
def source76 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B000.Data.entryAt ⟨62, by decide +kernel⟩

def target76 : Weights.Entry :=
  { word := [10, 8, 12, 10, 8, 4, 12], weights := [2, 1, 1, 2] }

def points76 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 8169, representative 3379.
def source77 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B000.Data.entryAt ⟨71, by decide +kernel⟩

def target77 : Weights.Entry :=
  { word := [10, 8, 12, 10, 8, 8, 12], weights := [0, 1, 0, 1] }

def points77 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 8190, representative 3406.
def source78 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B000.Data.entryAt ⟨98, by decide +kernel⟩

def target78 : Weights.Entry :=
  { word := [10, 10, 0, 9, 8, 1, 4], weights := [1, 1, 0, 1] }

def points78 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 8191, representative 3343.
def source79 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B000.Data.entryAt ⟨37, by decide +kernel⟩

def target79 : Weights.Entry :=
  { word := [10, 10, 0, 9, 8, 1, 12], weights := [1, 1, 0, 1] }

def points79 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 8194, representative 3410.
def source80 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B000.Data.entryAt ⟨102, by decide +kernel⟩

def target80 : Weights.Entry :=
  { word := [10, 10, 0, 9, 8, 8, 4], weights := [1, 1, 0, 1] }

def points80 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 8195, representative 3306.
def source81 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B000.Data.entryAt ⟨1, by decide +kernel⟩

def target81 : Weights.Entry :=
  { word := [10, 10, 0, 9, 8, 8, 6], weights := [1, 1, 0, 1] }

def points81 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 8196, representative 3347.
def source82 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B000.Data.entryAt ⟨39, by decide +kernel⟩

def target82 : Weights.Entry :=
  { word := [10, 10, 0, 9, 8, 8, 12], weights := [1, 1, 0, 1] }

def points82 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 8197, representative 3404.
def source83 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B000.Data.entryAt ⟨96, by decide +kernel⟩

def target83 : Weights.Entry :=
  { word := [10, 10, 0, 9, 8, 9, 4], weights := [1, 1, 0, 1] }

def points83 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 8198, representative 3341.
def source84 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B000.Data.entryAt ⟨35, by decide +kernel⟩

def target84 : Weights.Entry :=
  { word := [10, 10, 0, 9, 8, 9, 12], weights := [1, 1, 0, 1] }

def points84 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 8207, representative 3335.
def source85 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B000.Data.entryAt ⟨30, by decide +kernel⟩

def target85 : Weights.Entry :=
  { word := [10, 10, 0, 10, 0, 0, 12], weights := [0, 1, 0, 1] }

def points85 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 8210, representative 3397.
def source86 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B000.Data.entryAt ⟨89, by decide +kernel⟩

def target86 : Weights.Entry :=
  { word := [10, 10, 0, 10, 0, 8, 4], weights := [0, 1, 0, 1] }

def points86 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 8213, representative 3331.
def source87 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B000.Data.entryAt ⟨26, by decide +kernel⟩

def target87 : Weights.Entry :=
  { word := [10, 10, 0, 10, 0, 8, 12], weights := [0, 1, 0, 1] }

def points87 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 8214, representative 3400.
def source88 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B000.Data.entryAt ⟨92, by decide +kernel⟩

def target88 : Weights.Entry :=
  { word := [10, 10, 0, 10, 8, 0, 4], weights := [0, 1, 0, 1] }

def points88 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 8215, representative 3334.
def source89 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B000.Data.entryAt ⟨29, by decide +kernel⟩

def target89 : Weights.Entry :=
  { word := [10, 10, 0, 10, 8, 0, 12], weights := [0, 1, 0, 1] }

def points89 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 8216, representative 3396.
def source90 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B000.Data.entryAt ⟨88, by decide +kernel⟩

def target90 : Weights.Entry :=
  { word := [10, 10, 0, 10, 8, 8, 4], weights := [0, 1, 0, 1] }

def points90 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 8217, representative 3330.
def source91 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B000.Data.entryAt ⟨25, by decide +kernel⟩

def target91 : Weights.Entry :=
  { word := [10, 10, 0, 10, 8, 8, 12], weights := [0, 1, 0, 1] }

def points91 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 8220, representative 3414.
def source92 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B000.Data.entryAt ⟨106, by decide +kernel⟩

def target92 : Weights.Entry :=
  { word := [10, 10, 0, 12, 2, 0, 4], weights := [1, 1, 0, 1] }

def points92 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 8224, representative 3351.
def source93 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B000.Data.entryAt ⟨43, by decide +kernel⟩

def target93 : Weights.Entry :=
  { word := [10, 10, 0, 12, 2, 0, 12], weights := [1, 1, 0, 1] }

def points93 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 8228, representative 3413.
def source94 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B000.Data.entryAt ⟨105, by decide +kernel⟩

def target94 : Weights.Entry :=
  { word := [10, 10, 0, 12, 10, 0, 4], weights := [1, 1, 0, 1] }

def points94 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 8232, representative 3350.
def source95 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B000.Data.entryAt ⟨42, by decide +kernel⟩

def target95 : Weights.Entry :=
  { word := [10, 10, 0, 12, 10, 0, 12], weights := [1, 1, 0, 1] }

def points95 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 8240, representative 3339.
def source96 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B000.Data.entryAt ⟨34, by decide +kernel⟩

def target96 : Weights.Entry :=
  { word := [10, 10, 2, 8, 1, 0, 12], weights := [1, 1, 0, 1] }

def points96 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 8250, representative 3402.
def source97 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B000.Data.entryAt ⟨94, by decide +kernel⟩

def target97 : Weights.Entry :=
  { word := [10, 10, 2, 8, 9, 0, 4], weights := [1, 1, 0, 1] }

def points97 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 8254, representative 3338.
def source98 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B000.Data.entryAt ⟨33, by decide +kernel⟩

def target98 : Weights.Entry :=
  { word := [10, 10, 2, 8, 9, 0, 12], weights := [1, 1, 0, 1] }

def points98 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 8268, representative 3392.
def source99 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B000.Data.entryAt ⟨84, by decide +kernel⟩

def target99 : Weights.Entry :=
  { word := [10, 10, 8, 2, 0, 8, 4], weights := [1, 0, 0, 1] }

def points99 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 8272, representative 3326.
def source100 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B000.Data.entryAt ⟨21, by decide +kernel⟩

def target100 : Weights.Entry :=
  { word := [10, 10, 8, 2, 0, 8, 12], weights := [1, 0, 0, 1] }

def points100 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 8277, representative 3398.
def source101 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B000.Data.entryAt ⟨90, by decide +kernel⟩

def target101 : Weights.Entry :=
  { word := [10, 10, 8, 2, 8, 0, 4], weights := [1, 0, 0, 1] }

def points101 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 8278, representative 3332.
def source102 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B000.Data.entryAt ⟨27, by decide +kernel⟩

def target102 : Weights.Entry :=
  { word := [10, 10, 8, 2, 8, 0, 12], weights := [1, 0, 0, 1] }

def points102 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 8281, representative 3393.
def source103 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B000.Data.entryAt ⟨85, by decide +kernel⟩

def target103 : Weights.Entry :=
  { word := [10, 10, 8, 2, 8, 8, 4], weights := [1, 0, 0, 1] }

def points103 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 8282, representative 3327.
def source104 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B000.Data.entryAt ⟨22, by decide +kernel⟩

def target104 : Weights.Entry :=
  { word := [10, 10, 8, 2, 8, 8, 12], weights := [1, 0, 0, 1] }

def points104 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 8299, representative 3405.
def source105 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B000.Data.entryAt ⟨97, by decide +kernel⟩

def target105 : Weights.Entry :=
  { word := [10, 10, 8, 9, 8, 1, 4], weights := [1, 1, 0, 1] }

def points105 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 8300, representative 3342.
def source106 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B000.Data.entryAt ⟨36, by decide +kernel⟩

def target106 : Weights.Entry :=
  { word := [10, 10, 8, 9, 8, 1, 12], weights := [1, 1, 0, 1] }

def points106 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 8303, representative 3409.
def source107 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B000.Data.entryAt ⟨101, by decide +kernel⟩

def target107 : Weights.Entry :=
  { word := [10, 10, 8, 9, 8, 8, 4], weights := [1, 1, 0, 1] }

def points107 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 8304, representative 3305.
def source108 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B000.Data.entryAt ⟨0, by decide +kernel⟩

def target108 : Weights.Entry :=
  { word := [10, 10, 8, 9, 8, 8, 6], weights := [1, 1, 0, 1] }

def points108 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 8305, representative 3346.
def source109 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B000.Data.entryAt ⟨38, by decide +kernel⟩

def target109 : Weights.Entry :=
  { word := [10, 10, 8, 9, 8, 8, 12], weights := [1, 1, 0, 1] }

def points109 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 8306, representative 3403.
def source110 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B000.Data.entryAt ⟨95, by decide +kernel⟩

def target110 : Weights.Entry :=
  { word := [10, 10, 8, 9, 8, 9, 4], weights := [1, 1, 0, 1] }

def points110 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 8318, representative 3395.
def source111 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B000.Data.entryAt ⟨87, by decide +kernel⟩

def target111 : Weights.Entry :=
  { word := [10, 10, 8, 10, 0, 8, 4], weights := [0, 1, 0, 1] }

def points111 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 8322, representative 3329.
def source112 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B000.Data.entryAt ⟨24, by decide +kernel⟩

def target112 : Weights.Entry :=
  { word := [10, 10, 8, 10, 0, 8, 12], weights := [0, 1, 0, 1] }

def points112 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 8328, representative 3399.
def source113 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B000.Data.entryAt ⟨91, by decide +kernel⟩

def target113 : Weights.Entry :=
  { word := [10, 10, 8, 10, 8, 0, 4], weights := [0, 1, 0, 1] }

def points113 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 8329, representative 3333.
def source114 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B000.Data.entryAt ⟨28, by decide +kernel⟩

def target114 : Weights.Entry :=
  { word := [10, 10, 8, 10, 8, 0, 12], weights := [0, 1, 0, 1] }

def points114 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 8334, representative 3394.
def source115 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B000.Data.entryAt ⟨86, by decide +kernel⟩

def target115 : Weights.Entry :=
  { word := [10, 10, 8, 10, 8, 8, 4], weights := [0, 1, 0, 1] }

def points115 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 8335, representative 3328.
def source116 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B000.Data.entryAt ⟨23, by decide +kernel⟩

def target116 : Weights.Entry :=
  { word := [10, 10, 8, 10, 8, 8, 12], weights := [0, 1, 0, 1] }

def points116 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 8342, representative 3412.
def source117 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B000.Data.entryAt ⟨104, by decide +kernel⟩

def target117 : Weights.Entry :=
  { word := [10, 10, 8, 12, 2, 0, 4], weights := [1, 1, 0, 1] }

def points117 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 8346, representative 3349.
def source118 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B000.Data.entryAt ⟨41, by decide +kernel⟩

def target118 : Weights.Entry :=
  { word := [10, 10, 8, 12, 2, 0, 12], weights := [1, 1, 0, 1] }

def points118 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 8348, representative 3408.
def source119 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B000.Data.entryAt ⟨100, by decide +kernel⟩

def target119 : Weights.Entry :=
  { word := [10, 10, 8, 12, 2, 8, 4], weights := [3, 1, 2, 2] }

def points119 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 8364, representative 3411.
def source120 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B000.Data.entryAt ⟨103, by decide +kernel⟩

def target120 : Weights.Entry :=
  { word := [10, 10, 8, 12, 10, 0, 4], weights := [1, 1, 0, 1] }

def points120 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 8368, representative 3348.
def source121 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B000.Data.entryAt ⟨40, by decide +kernel⟩

def target121 : Weights.Entry :=
  { word := [10, 10, 8, 12, 10, 0, 12], weights := [1, 1, 0, 1] }

def points121 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 8370, representative 3407.
def source122 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B000.Data.entryAt ⟨99, by decide +kernel⟩

def target122 : Weights.Entry :=
  { word := [10, 10, 8, 12, 10, 8, 4], weights := [2, 1, 1, 2] }

def points122 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 8384, representative 3337.
def source123 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B000.Data.entryAt ⟨32, by decide +kernel⟩

def target123 : Weights.Entry :=
  { word := [10, 10, 10, 8, 1, 0, 12], weights := [1, 1, 0, 1] }

def points123 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 8394, representative 3401.
def source124 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B000.Data.entryAt ⟨93, by decide +kernel⟩

def target124 : Weights.Entry :=
  { word := [10, 10, 10, 8, 9, 0, 4], weights := [1, 1, 0, 1] }

def points124 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 8398, representative 3336.
def source125 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B000.Data.entryAt ⟨31, by decide +kernel⟩

def target125 : Weights.Entry :=
  { word := [10, 10, 10, 8, 9, 0, 12], weights := [1, 1, 0, 1] }

def points125 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 8590, representative 3321.
def source126 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B000.Data.entryAt ⟨16, by decide +kernel⟩

def target126 : Weights.Entry :=
  { word := [12, 2, 0, 9, 8, 8, 6], weights := [1, 1, 0, 1] }

def points126 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 8994, representative 3320.
def source127 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B000.Data.entryAt ⟨15, by decide +kernel⟩

def target127 : Weights.Entry :=
  { word := [12, 10, 0, 9, 8, 8, 6], weights := [1, 1, 0, 1] }

def points127 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

def period8Entries : List Weights.Entry := [target0, target1, target2, target3, target4, target5, target6, target7, target8, target9, target10, target11, target12, target13, target14, target15, target16, target17, target18, target19, target20, target21, target22, target23, target24, target25, target26, target27, target28, target29, target30, target31, target32, target33, target34, target35, target36, target37, target38, target39, target40, target41, target42, target43, target44, target45, target46, target47, target48, target49, target50, target51, target52, target53, target54, target55, target56, target57, target58, target59, target60, target61, target62, target63, target64, target65, target66, target67, target68, target69, target70, target71, target72, target73, target74, target75, target76, target77, target78, target79, target80, target81, target82, target83, target84, target85, target86, target87, target88, target89, target90, target91, target92, target93, target94, target95, target96, target97, target98, target99, target100, target101, target102, target103, target104, target105, target106, target107, target108, target109, target110, target111, target112, target113, target114, target115, target116, target117, target118, target119, target120, target121, target122, target123, target124, target125, target126, target127]

def period8Chunk : RowCoverage.Chunk where
  rows := [⟨7630, target0⟩, ⟨7633, target1⟩, ⟨7637, target2⟩, ⟨7648, target3⟩, ⟨7658, target4⟩, ⟨7662, target5⟩, ⟨7675, target6⟩, ⟨7679, target7⟩, ⟨7684, target8⟩, ⟨7685, target9⟩, ⟨7688, target10⟩, ⟨7689, target11⟩, ⟨7706, target12⟩, ⟨7707, target13⟩, ⟨7710, target14⟩, ⟨7711, target15⟩, ⟨7712, target16⟩, ⟨7713, target17⟩, ⟨7714, target18⟩, ⟨7725, target19⟩, ⟨7729, target20⟩, ⟨7735, target21⟩, ⟨7736, target22⟩, ⟨7741, target23⟩, ⟨7742, target24⟩, ⟨7749, target25⟩, ⟨7753, target26⟩, ⟨7765, target27⟩, ⟨7769, target28⟩, ⟨7771, target29⟩, ⟨7774, target30⟩, ⟨7788, target31⟩, ⟨7798, target32⟩, ⟨7802, target33⟩, ⟨7825, target34⟩, ⟨7830, target35⟩, ⟨7841, target36⟩, ⟨7844, target37⟩, ⟨7851, target38⟩, ⟨7856, target39⟩, ⟨7867, target40⟩, ⟨7870, target41⟩, ⟨7877, target42⟩, ⟨7882, target43⟩, ⟨7892, target44⟩, ⟨7895, target45⟩, ⟨7902, target46⟩, ⟨7907, target47⟩, ⟨7927, target48⟩, ⟨7935, target49⟩, ⟨7954, target50⟩, ⟨7959, target51⟩, ⟨7989, target52⟩, ⟨7994, target53⟩, ⟨8007, target54⟩, ⟨8012, target55⟩, ⟨8019, target56⟩, ⟨8024, target57⟩, ⟨8033, target58⟩, ⟨8038, target59⟩, ⟨8040, target60⟩, ⟨8042, target61⟩, ⟨8051, target62⟩, ⟨8056, target63⟩, ⟨8063, target64⟩, ⟨8068, target65⟩, ⟨8080, target66⟩, ⟨8085, target67⟩, ⟨8092, target68⟩, ⟨8097, target69⟩, ⟨8108, target70⟩, ⟨8113, target71⟩, ⟨8115, target72⟩, ⟨8135, target73⟩, ⟨8143, target74⟩, ⟨8162, target75⟩, ⟨8167, target76⟩, ⟨8169, target77⟩, ⟨8190, target78⟩, ⟨8191, target79⟩, ⟨8194, target80⟩, ⟨8195, target81⟩, ⟨8196, target82⟩, ⟨8197, target83⟩, ⟨8198, target84⟩, ⟨8207, target85⟩, ⟨8210, target86⟩, ⟨8213, target87⟩, ⟨8214, target88⟩, ⟨8215, target89⟩, ⟨8216, target90⟩, ⟨8217, target91⟩, ⟨8220, target92⟩, ⟨8224, target93⟩, ⟨8228, target94⟩, ⟨8232, target95⟩, ⟨8240, target96⟩, ⟨8250, target97⟩, ⟨8254, target98⟩, ⟨8268, target99⟩, ⟨8272, target100⟩, ⟨8277, target101⟩, ⟨8278, target102⟩, ⟨8281, target103⟩, ⟨8282, target104⟩, ⟨8299, target105⟩, ⟨8300, target106⟩, ⟨8303, target107⟩, ⟨8304, target108⟩, ⟨8305, target109⟩, ⟨8306, target110⟩, ⟨8318, target111⟩, ⟨8322, target112⟩, ⟨8328, target113⟩, ⟨8329, target114⟩, ⟨8334, target115⟩, ⟨8335, target116⟩, ⟨8342, target117⟩, ⟨8346, target118⟩, ⟨8348, target119⟩, ⟨8364, target120⟩, ⟨8368, target121⟩, ⟨8370, target122⟩, ⟨8384, target123⟩, ⟨8394, target124⟩, ⟨8398, target125⟩, ⟨8590, target126⟩, ⟨8994, target127⟩]
  indexMask := 29092497243788232344556983553801028222166888775315064846270464927080959255429312027154951342248843432629412136331953920759329456227241548290704155943950771186493597884817626716955716870175873357585930050667942849070155689373869946780579802768712165660417340406722405151936380462324566783446660017193721972182487031758660942418500844864846827160634074992278664291565317196620461917357991474047284917618393265244061562636538790497240476106277713288519095915790254760373607838907935762593561694103295572185628605096503260838499342167376218044117793412659380904112974468858859914849129045251957553626455321865819884750476354300740045112320248987545212661533730392490469837795061193047410458025705607802830542924475373431279498040818938299726646423348747284643638401894180088245872449596422367607655046129308012877244236461939916428904095063786127835053114816471041982593747099494732179632738556093524993547048201338853944022053572348912390602119106033737966205467731916637479930539443406540498526713980544304854211730705741086998141557744207870087632532829342609600950859150664967582667282895622662704399136275424002984420141664835142684240219458878689136799290599994711213710109763916971989688048513297496304721146905322084951267580397118813123908079394864125346170384402659951459413063381111194955649385869351092293476658359048375192743758317573187930170594729579395900514350599538375811121900473107379707347513907387630058119355684547098768062771130247198569781930593115359403048952591717189518520902405010858067200521070957500116070945792466997336503863169630969247881328890854373372826242838837206635279326127775229023767201312534090563794313830510575271456884908067539303272825128400040613679472016473036983793662978544408633906945676294413084131334324522342959641860469615584949037131197359361209458118451379976558179913736017706790784036765923416352302359927862623547656268171800044498276612781895335867675167899588141510036644143806357804092385776046346069473413512347048211543351910337850785441248688658210707762601305347940049617157261638219571415881859804729931797014193570073998228742925326455579508885975523958124597620970381045706515506604064268817259505392023231911501548373076188788916734078350865903638480409286615696732888729955717997943375945587117148999683115784487375790711253490032166232624485497505024837495615416327392916274477999541114892245603280480970103207982692011701268780173999350974527555520691926254635458500606916378807039586422628604298370367464417193258832407987012888299870900111351649890506587755857622458121498280350954327803350290319709279829036094652836435516717831694472011046748747730353042459591994323183698163209158327177040031828786600358717642237532396463895609344
  count := 128

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

end FranklSmallCyclic.TransportBatches.G026.B001.Data
