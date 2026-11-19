module

public import Conjectures.FranklSmallCyclicRowCoverage
public import Conjectures.FranklSmallCyclicCanonicalWords
public import Conjectures.FranklSmallCyclicOrbit8Block001Data

/-! 128 literal targets sharing one source proof block.
Original words and row indices are retained; weights may be transported.
-/
@[expose] public section

namespace FranklSmallCyclic.TransportBatches.G027.B001.Data

-- Period 8, original row 7678, representative 3558.
def source0 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B001.Data.entryAt ⟨121, by decide +kernel⟩

def target0 : Weights.Entry :=
  { word := [10, 2, 8, 2, 0, 8, 10], weights := [1, 0, 0, 1] }

-- Period 8, original row 7709, representative 3563.
def source1 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B001.Data.entryAt ⟨126, by decide +kernel⟩

def target1 : Weights.Entry :=
  { word := [10, 2, 8, 9, 8, 2, 10], weights := [1, 1, 0, 1] }

-- Period 8, original row 7716, representative 3561.
def source2 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B001.Data.entryAt ⟨124, by decide +kernel⟩

def target2 : Weights.Entry :=
  { word := [10, 2, 8, 9, 8, 10, 10], weights := [1, 1, 0, 1] }

-- Period 8, original row 7728, representative 3559.
def source3 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B001.Data.entryAt ⟨122, by decide +kernel⟩

def target3 : Weights.Entry :=
  { word := [10, 2, 8, 10, 0, 8, 10], weights := [1, 0, 0, 1] }

-- Period 8, original row 7821, representative 3502.
def source4 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B001.Data.entryAt ⟨66, by decide +kernel⟩

def target4 : Weights.Entry :=
  { word := [10, 8, 0, 4, 2, 0, 4], weights := [1, 0, 0, 1] }

def points4 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 7827, representative 3494.
def source5 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B001.Data.entryAt ⟨58, by decide +kernel⟩

def target5 : Weights.Entry :=
  { word := [10, 8, 0, 4, 2, 8, 4], weights := [1, 0, 0, 1] }

def points5 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 7838, representative 3465.
def source6 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B001.Data.entryAt ⟨29, by decide +kernel⟩

def target6 : Weights.Entry :=
  { word := [10, 8, 0, 4, 8, 4, 4], weights := [1, 0, 0, 1] }

def points6 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 7840, representative 3529.
def source7 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B001.Data.entryAt ⟨92, by decide +kernel⟩

def target7 : Weights.Entry :=
  { word := [10, 8, 0, 4, 8, 4, 10], weights := [1, 0, 1, 0] }

-- Period 8, original row 7842, representative 3439.
def source8 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B001.Data.entryAt ⟨3, by decide +kernel⟩

def target8 : Weights.Entry :=
  { word := [10, 8, 0, 4, 8, 12, 4], weights := [1, 0, 0, 1] }

def points8 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 7847, representative 3507.
def source9 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B001.Data.entryAt ⟨71, by decide +kernel⟩

def target9 : Weights.Entry :=
  { word := [10, 8, 0, 4, 10, 0, 4], weights := [1, 0, 0, 1] }

def points9 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 7853, representative 3499.
def source10 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B001.Data.entryAt ⟨63, by decide +kernel⟩

def target10 : Weights.Entry :=
  { word := [10, 8, 0, 4, 10, 8, 4], weights := [1, 0, 0, 1] }

def points10 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 7864, representative 3467.
def source11 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B001.Data.entryAt ⟨31, by decide +kernel⟩

def target11 : Weights.Entry :=
  { word := [10, 8, 0, 12, 0, 4, 4], weights := [1, 0, 0, 1] }

def points11 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 7866, representative 3534.
def source12 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B001.Data.entryAt ⟨97, by decide +kernel⟩

def target12 : Weights.Entry :=
  { word := [10, 8, 0, 12, 0, 4, 10], weights := [1, 0, 1, 0] }

-- Period 8, original row 7868, representative 3441.
def source13 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B001.Data.entryAt ⟨5, by decide +kernel⟩

def target13 : Weights.Entry :=
  { word := [10, 8, 0, 12, 0, 12, 4], weights := [1, 0, 0, 1] }

def points13 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 7873, representative 3509.
def source14 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B001.Data.entryAt ⟨73, by decide +kernel⟩

def target14 : Weights.Entry :=
  { word := [10, 8, 0, 12, 2, 0, 4], weights := [1, 0, 0, 1] }

def points14 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 7879, representative 3501.
def source15 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B001.Data.entryAt ⟨65, by decide +kernel⟩

def target15 : Weights.Entry :=
  { word := [10, 8, 0, 12, 2, 8, 4], weights := [1, 0, 0, 1] }

def points15 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 7889, representative 3466.
def source16 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B001.Data.entryAt ⟨30, by decide +kernel⟩

def target16 : Weights.Entry :=
  { word := [10, 8, 0, 12, 8, 4, 4], weights := [1, 0, 0, 1] }

def points16 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 7891, representative 3532.
def source17 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B001.Data.entryAt ⟨95, by decide +kernel⟩

def target17 : Weights.Entry :=
  { word := [10, 8, 0, 12, 8, 4, 10], weights := [1, 0, 1, 0] }

-- Period 8, original row 7893, representative 3440.
def source18 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B001.Data.entryAt ⟨4, by decide +kernel⟩

def target18 : Weights.Entry :=
  { word := [10, 8, 0, 12, 8, 12, 4], weights := [1, 0, 0, 1] }

def points18 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 7898, representative 3508.
def source19 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B001.Data.entryAt ⟨72, by decide +kernel⟩

def target19 : Weights.Entry :=
  { word := [10, 8, 0, 12, 10, 0, 4], weights := [1, 0, 0, 1] }

def points19 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 7904, representative 3500.
def source20 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B001.Data.entryAt ⟨64, by decide +kernel⟩

def target20 : Weights.Entry :=
  { word := [10, 8, 0, 12, 10, 8, 4], weights := [1, 0, 0, 1] }

def points20 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 7923, representative 3486.
def source21 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B001.Data.entryAt ⟨50, by decide +kernel⟩

def target21 : Weights.Entry :=
  { word := [10, 8, 4, 2, 0, 8, 4], weights := [1, 0, 0, 1] }

def points21 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 7934, representative 3491.
def source22 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B001.Data.entryAt ⟨55, by decide +kernel⟩

def target22 : Weights.Entry :=
  { word := [10, 8, 4, 2, 8, 8, 4], weights := [1, 0, 0, 1] }

def points22 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 7950, representative 3493.
def source23 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B001.Data.entryAt ⟨57, by decide +kernel⟩

def target23 : Weights.Entry :=
  { word := [10, 8, 4, 10, 0, 8, 4], weights := [0, 1, 0, 1] }

def points23 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 7958, representative 3492.
def source24 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B001.Data.entryAt ⟨56, by decide +kernel⟩

def target24 : Weights.Entry :=
  { word := [10, 8, 4, 10, 8, 8, 4], weights := [0, 1, 0, 1] }

def points24 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 7961, representative 3451.
def source25 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B001.Data.entryAt ⟨15, by decide +kernel⟩

def target25 : Weights.Entry :=
  { word := [10, 8, 4, 10, 8, 12, 4], weights := [2, 2, 1, 3] }

def points25 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 7985, representative 3503.
def source26 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B001.Data.entryAt ⟨67, by decide +kernel⟩

def target26 : Weights.Entry :=
  { word := [10, 8, 8, 4, 2, 0, 4], weights := [1, 0, 0, 1] }

def points26 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 7991, representative 3495.
def source27 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B001.Data.entryAt ⟨59, by decide +kernel⟩

def target27 : Weights.Entry :=
  { word := [10, 8, 8, 4, 2, 8, 4], weights := [1, 0, 0, 1] }

def points27 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 8004, representative 3462.
def source28 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B001.Data.entryAt ⟨26, by decide +kernel⟩

def target28 : Weights.Entry :=
  { word := [10, 8, 8, 4, 8, 4, 4], weights := [1, 0, 0, 1] }

def points28 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 8006, representative 3530.
def source29 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B001.Data.entryAt ⟨93, by decide +kernel⟩

def target29 : Weights.Entry :=
  { word := [10, 8, 8, 4, 8, 4, 10], weights := [1, 0, 1, 0] }

-- Period 8, original row 8009, representative 3436.
def source30 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B001.Data.entryAt ⟨0, by decide +kernel⟩

def target30 : Weights.Entry :=
  { word := [10, 8, 8, 4, 8, 12, 4], weights := [1, 0, 0, 1] }

def points30 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 8011, representative 3519.
def source31 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B001.Data.entryAt ⟨82, by decide +kernel⟩

def target31 : Weights.Entry :=
  { word := [10, 8, 8, 4, 8, 12, 10], weights := [1, 0, 1, 0] }

-- Period 8, original row 8015, representative 3504.
def source32 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B001.Data.entryAt ⟨68, by decide +kernel⟩

def target32 : Weights.Entry :=
  { word := [10, 8, 8, 4, 10, 0, 4], weights := [1, 0, 0, 1] }

def points32 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 8021, representative 3496.
def source33 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B001.Data.entryAt ⟨60, by decide +kernel⟩

def target33 : Weights.Entry :=
  { word := [10, 8, 8, 4, 10, 8, 4], weights := [1, 0, 0, 1] }

def points33 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 8030, representative 3478.
def source34 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B001.Data.entryAt ⟨42, by decide +kernel⟩

def target34 : Weights.Entry :=
  { word := [10, 8, 8, 8, 1, 4, 4], weights := [1, 0, 1, 1] }

def points34 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 8032, representative 3539.
def source35 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B001.Data.entryAt ⟨102, by decide +kernel⟩

def target35 : Weights.Entry :=
  { word := [10, 8, 8, 8, 1, 4, 10], weights := [1, 0, 1, 1] }

-- Period 8, original row 8035, representative 3453.
def source36 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B001.Data.entryAt ⟨17, by decide +kernel⟩

def target36 : Weights.Entry :=
  { word := [10, 8, 8, 8, 1, 12, 4], weights := [1, 0, 1, 1] }

def points36 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 8037, representative 3525.
def source37 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B001.Data.entryAt ⟨88, by decide +kernel⟩

def target37 : Weights.Entry :=
  { word := [10, 8, 8, 8, 1, 12, 10], weights := [1, 0, 1, 1] }

-- Period 8, original row 8039, representative 3477.
def source38 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B001.Data.entryAt ⟨41, by decide +kernel⟩

def target38 : Weights.Entry :=
  { word := [10, 8, 8, 8, 9, 4, 4], weights := [1, 0, 1, 1] }

def points38 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 8041, representative 3452.
def source39 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B001.Data.entryAt ⟨16, by decide +kernel⟩

def target39 : Weights.Entry :=
  { word := [10, 8, 8, 8, 9, 12, 4], weights := [1, 0, 1, 1] }

def points39 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 8048, representative 3464.
def source40 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B001.Data.entryAt ⟨28, by decide +kernel⟩

def target40 : Weights.Entry :=
  { word := [10, 8, 8, 12, 0, 4, 4], weights := [1, 0, 0, 1] }

def points40 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 8050, representative 3533.
def source41 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B001.Data.entryAt ⟨96, by decide +kernel⟩

def target41 : Weights.Entry :=
  { word := [10, 8, 8, 12, 0, 4, 10], weights := [1, 0, 1, 0] }

-- Period 8, original row 8053, representative 3438.
def source42 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B001.Data.entryAt ⟨2, by decide +kernel⟩

def target42 : Weights.Entry :=
  { word := [10, 8, 8, 12, 0, 12, 4], weights := [1, 0, 0, 1] }

def points42 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 8055, representative 3521.
def source43 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B001.Data.entryAt ⟨84, by decide +kernel⟩

def target43 : Weights.Entry :=
  { word := [10, 8, 8, 12, 0, 12, 10], weights := [1, 0, 1, 0] }

-- Period 8, original row 8059, representative 3506.
def source44 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B001.Data.entryAt ⟨70, by decide +kernel⟩

def target44 : Weights.Entry :=
  { word := [10, 8, 8, 12, 2, 0, 4], weights := [1, 0, 0, 1] }

def points44 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 8065, representative 3498.
def source45 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B001.Data.entryAt ⟨62, by decide +kernel⟩

def target45 : Weights.Entry :=
  { word := [10, 8, 8, 12, 2, 8, 4], weights := [1, 0, 0, 1] }

def points45 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 8077, representative 3463.
def source46 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B001.Data.entryAt ⟨27, by decide +kernel⟩

def target46 : Weights.Entry :=
  { word := [10, 8, 8, 12, 8, 4, 4], weights := [1, 0, 0, 1] }

def points46 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 8079, representative 3531.
def source47 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B001.Data.entryAt ⟨94, by decide +kernel⟩

def target47 : Weights.Entry :=
  { word := [10, 8, 8, 12, 8, 4, 10], weights := [1, 0, 1, 0] }

-- Period 8, original row 8082, representative 3437.
def source48 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B001.Data.entryAt ⟨1, by decide +kernel⟩

def target48 : Weights.Entry :=
  { word := [10, 8, 8, 12, 8, 12, 4], weights := [1, 0, 0, 1] }

def points48 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 8084, representative 3520.
def source49 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B001.Data.entryAt ⟨83, by decide +kernel⟩

def target49 : Weights.Entry :=
  { word := [10, 8, 8, 12, 8, 12, 10], weights := [1, 0, 1, 0] }

-- Period 8, original row 8088, representative 3505.
def source50 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B001.Data.entryAt ⟨69, by decide +kernel⟩

def target50 : Weights.Entry :=
  { word := [10, 8, 8, 12, 10, 0, 4], weights := [1, 0, 0, 1] }

def points50 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 8094, representative 3497.
def source51 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B001.Data.entryAt ⟨61, by decide +kernel⟩

def target51 : Weights.Entry :=
  { word := [10, 8, 8, 12, 10, 8, 4], weights := [1, 0, 0, 1] }

def points51 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 8105, representative 3473.
def source52 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B001.Data.entryAt ⟨37, by decide +kernel⟩

def target52 : Weights.Entry :=
  { word := [10, 8, 9, 8, 1, 4, 4], weights := [1, 0, 1, 1] }

def points52 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 8107, representative 3537.
def source53 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B001.Data.entryAt ⟨100, by decide +kernel⟩

def target53 : Weights.Entry :=
  { word := [10, 8, 9, 8, 1, 4, 10], weights := [1, 0, 1, 1] }

-- Period 8, original row 8110, representative 3447.
def source54 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B001.Data.entryAt ⟨11, by decide +kernel⟩

def target54 : Weights.Entry :=
  { word := [10, 8, 9, 8, 1, 12, 4], weights := [1, 0, 1, 1] }

def points54 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 8112, representative 3523.
def source55 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B001.Data.entryAt ⟨86, by decide +kernel⟩

def target55 : Weights.Entry :=
  { word := [10, 8, 9, 8, 1, 12, 10], weights := [1, 0, 1, 1] }

-- Period 8, original row 8114, representative 3472.
def source56 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B001.Data.entryAt ⟨36, by decide +kernel⟩

def target56 : Weights.Entry :=
  { word := [10, 8, 9, 8, 9, 4, 4], weights := [1, 0, 1, 1] }

def points56 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 8116, representative 3446.
def source57 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B001.Data.entryAt ⟨10, by decide +kernel⟩

def target57 : Weights.Entry :=
  { word := [10, 8, 9, 8, 9, 12, 4], weights := [1, 0, 1, 1] }

def points57 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 8131, representative 3487.
def source58 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B001.Data.entryAt ⟨51, by decide +kernel⟩

def target58 : Weights.Entry :=
  { word := [10, 8, 12, 2, 0, 8, 4], weights := [1, 0, 0, 1] }

def points58 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 8142, representative 3488.
def source59 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B001.Data.entryAt ⟨52, by decide +kernel⟩

def target59 : Weights.Entry :=
  { word := [10, 8, 12, 2, 8, 8, 4], weights := [1, 0, 0, 1] }

def points59 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 8158, representative 3490.
def source60 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B001.Data.entryAt ⟨54, by decide +kernel⟩

def target60 : Weights.Entry :=
  { word := [10, 8, 12, 10, 0, 8, 4], weights := [0, 1, 0, 1] }

def points60 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 8166, representative 3476.
def source61 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B001.Data.entryAt ⟨40, by decide +kernel⟩

def target61 : Weights.Entry :=
  { word := [10, 8, 12, 10, 8, 4, 4], weights := [2, 1, 1, 2] }

def points61 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 8168, representative 3489.
def source62 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B001.Data.entryAt ⟨53, by decide +kernel⟩

def target62 : Weights.Entry :=
  { word := [10, 8, 12, 10, 8, 8, 4], weights := [0, 1, 0, 1] }

def points62 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 8171, representative 3450.
def source63 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B001.Data.entryAt ⟨14, by decide +kernel⟩

def target63 : Weights.Entry :=
  { word := [10, 8, 12, 10, 8, 12, 4], weights := [2, 1, 1, 2] }

def points63 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 8193, representative 3547.
def source64 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B001.Data.entryAt ⟨110, by decide +kernel⟩

def target64 : Weights.Entry :=
  { word := [10, 10, 0, 9, 8, 2, 10], weights := [1, 1, 0, 1] }

-- Period 8, original row 8200, representative 3545.
def source65 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B001.Data.entryAt ⟨108, by decide +kernel⟩

def target65 : Weights.Entry :=
  { word := [10, 10, 0, 9, 8, 10, 10], weights := [1, 1, 0, 1] }

-- Period 8, original row 8206, representative 3543.
def source66 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B001.Data.entryAt ⟨106, by decide +kernel⟩

def target66 : Weights.Entry :=
  { word := [10, 10, 0, 10, 0, 0, 10], weights := [1, 1, 0, 0] }

-- Period 8, original row 8223, representative 3557.
def source67 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B001.Data.entryAt ⟨120, by decide +kernel⟩

def target67 : Weights.Entry :=
  { word := [10, 10, 0, 12, 2, 0, 10], weights := [1, 1, 1, 0] }

-- Period 8, original row 8231, representative 3555.
def source68 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B001.Data.entryAt ⟨118, by decide +kernel⟩

def target68 : Weights.Entry :=
  { word := [10, 10, 0, 12, 10, 0, 10], weights := [1, 1, 1, 0] }

-- Period 8, original row 8239, representative 3553.
def source69 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B001.Data.entryAt ⟨116, by decide +kernel⟩

def target69 : Weights.Entry :=
  { word := [10, 10, 2, 8, 1, 0, 10], weights := [1, 1, 0, 1] }

-- Period 8, original row 8253, representative 3551.
def source70 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B001.Data.entryAt ⟨114, by decide +kernel⟩

def target70 : Weights.Entry :=
  { word := [10, 10, 2, 8, 9, 0, 10], weights := [1, 1, 0, 1] }

-- Period 8, original row 8271, representative 3541.
def source71 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B001.Data.entryAt ⟨104, by decide +kernel⟩

def target71 : Weights.Entry :=
  { word := [10, 10, 8, 2, 0, 8, 10], weights := [1, 0, 0, 1] }

-- Period 8, original row 8302, representative 3546.
def source72 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B001.Data.entryAt ⟨109, by decide +kernel⟩

def target72 : Weights.Entry :=
  { word := [10, 10, 8, 9, 8, 2, 10], weights := [1, 1, 0, 1] }

-- Period 8, original row 8309, representative 3544.
def source73 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B001.Data.entryAt ⟨107, by decide +kernel⟩

def target73 : Weights.Entry :=
  { word := [10, 10, 8, 9, 8, 10, 10], weights := [1, 1, 0, 1] }

-- Period 8, original row 8321, representative 3542.
def source74 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B001.Data.entryAt ⟨105, by decide +kernel⟩

def target74 : Weights.Entry :=
  { word := [10, 10, 8, 10, 0, 8, 10], weights := [1, 0, 0, 1] }

-- Period 8, original row 8345, representative 3556.
def source75 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B001.Data.entryAt ⟨119, by decide +kernel⟩

def target75 : Weights.Entry :=
  { word := [10, 10, 8, 12, 2, 0, 10], weights := [1, 1, 1, 0] }

-- Period 8, original row 8350, representative 3549.
def source76 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B001.Data.entryAt ⟨112, by decide +kernel⟩

def target76 : Weights.Entry :=
  { word := [10, 10, 8, 12, 2, 8, 10], weights := [1, 1, 1, 1] }

-- Period 8, original row 8358, representative 3528.
def source77 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B001.Data.entryAt ⟨91, by decide +kernel⟩

def target77 : Weights.Entry :=
  { word := [10, 10, 8, 12, 8, 4, 10], weights := [2, 1, 2, 1] }

-- Period 8, original row 8367, representative 3554.
def source78 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B001.Data.entryAt ⟨117, by decide +kernel⟩

def target78 : Weights.Entry :=
  { word := [10, 10, 8, 12, 10, 0, 10], weights := [1, 1, 1, 0] }

-- Period 8, original row 8372, representative 3548.
def source79 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B001.Data.entryAt ⟨111, by decide +kernel⟩

def target79 : Weights.Entry :=
  { word := [10, 10, 8, 12, 10, 8, 10], weights := [1, 1, 1, 1] }

-- Period 8, original row 8383, representative 3552.
def source80 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B001.Data.entryAt ⟨115, by decide +kernel⟩

def target80 : Weights.Entry :=
  { word := [10, 10, 10, 8, 1, 0, 10], weights := [1, 1, 0, 1] }

-- Period 8, original row 8397, representative 3550.
def source81 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B001.Data.entryAt ⟨113, by decide +kernel⟩

def target81 : Weights.Entry :=
  { word := [10, 10, 10, 8, 9, 0, 10], weights := [1, 1, 0, 1] }

-- Period 8, original row 8412, representative 3553.
def source82 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B001.Data.entryAt ⟨116, by decide +kernel⟩

def target82 : Weights.Entry :=
  { word := [12, 0, 0, 9, 4, 12, 12], weights := [1, 0, 1, 1] }

def points82 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 8416, representative 3552.
def source83 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B001.Data.entryAt ⟨115, by decide +kernel⟩

def target83 : Weights.Entry :=
  { word := [12, 0, 0, 9, 12, 12, 12], weights := [1, 0, 1, 1] }

def points83 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 8423, representative 3560.
def source84 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B001.Data.entryAt ⟨123, by decide +kernel⟩

def target84 : Weights.Entry :=
  { word := [12, 0, 0, 12, 0, 4, 12], weights := [0, 0, 1, 1] }

def points84 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 8426, representative 3543.
def source85 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B001.Data.entryAt ⟨106, by decide +kernel⟩

def target85 : Weights.Entry :=
  { word := [12, 0, 0, 12, 0, 12, 12], weights := [0, 0, 1, 1] }

def points85 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 8473, representative 3557.
def source86 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B001.Data.entryAt ⟨120, by decide +kernel⟩

def target86 : Weights.Entry :=
  { word := [12, 0, 4, 10, 0, 12, 12], weights := [0, 1, 1, 1] }

def points86 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 8481, representative 3556.
def source87 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B001.Data.entryAt ⟨119, by decide +kernel⟩

def target87 : Weights.Entry :=
  { word := [12, 0, 4, 10, 8, 12, 12], weights := [0, 1, 1, 1] }

def points87 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 8503, representative 3551.
def source88 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B001.Data.entryAt ⟨114, by decide +kernel⟩

def target88 : Weights.Entry :=
  { word := [12, 0, 8, 9, 4, 12, 12], weights := [1, 0, 1, 1] }

def points88 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 8507, representative 3550.
def source89 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B001.Data.entryAt ⟨113, by decide +kernel⟩

def target89 : Weights.Entry :=
  { word := [12, 0, 8, 9, 12, 12, 12], weights := [1, 0, 1, 1] }

def points89 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 8566, representative 3555.
def source90 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B001.Data.entryAt ⟨118, by decide +kernel⟩

def target90 : Weights.Entry :=
  { word := [12, 0, 12, 10, 0, 12, 12], weights := [0, 1, 1, 1] }

def points90 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 8574, representative 3554.
def source91 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B001.Data.entryAt ⟨117, by decide +kernel⟩

def target91 : Weights.Entry :=
  { word := [12, 0, 12, 10, 8, 12, 12], weights := [0, 1, 1, 1] }

def points91 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 8586, representative 3538.
def source92 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B001.Data.entryAt ⟨101, by decide +kernel⟩

def target92 : Weights.Entry :=
  { word := [12, 2, 0, 9, 8, 1, 12], weights := [1, 1, 0, 1] }

def points92 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 8591, representative 3539.
def source93 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B001.Data.entryAt ⟨102, by decide +kernel⟩

def target93 : Weights.Entry :=
  { word := [12, 2, 0, 9, 8, 8, 12], weights := [1, 1, 0, 1] }

def points93 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 8593, representative 3537.
def source94 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B001.Data.entryAt ⟨100, by decide +kernel⟩

def target94 : Weights.Entry :=
  { word := [12, 2, 0, 9, 8, 9, 12], weights := [1, 1, 0, 1] }

def points94 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 8602, representative 3536.
def source95 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B001.Data.entryAt ⟨99, by decide +kernel⟩

def target95 : Weights.Entry :=
  { word := [12, 2, 0, 10, 0, 0, 12], weights := [0, 1, 0, 1] }

def points95 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 8608, representative 3534.
def source96 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B001.Data.entryAt ⟨97, by decide +kernel⟩

def target96 : Weights.Entry :=
  { word := [12, 2, 0, 10, 0, 8, 12], weights := [0, 1, 0, 1] }

def points96 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 8610, representative 3535.
def source97 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B001.Data.entryAt ⟨98, by decide +kernel⟩

def target97 : Weights.Entry :=
  { word := [12, 2, 0, 10, 8, 0, 12], weights := [0, 1, 0, 1] }

def points97 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 8612, representative 3533.
def source98 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B001.Data.entryAt ⟨96, by decide +kernel⟩

def target98 : Weights.Entry :=
  { word := [12, 2, 0, 10, 8, 8, 12], weights := [0, 1, 0, 1] }

def points98 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 8619, representative 3540.
def source99 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B001.Data.entryAt ⟨103, by decide +kernel⟩

def target99 : Weights.Entry :=
  { word := [12, 2, 0, 12, 10, 0, 12], weights := [1, 1, 0, 1] }

def points99 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 8632, representative 3529.
def source100 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B001.Data.entryAt ⟨92, by decide +kernel⟩

def target100 : Weights.Entry :=
  { word := [12, 2, 8, 2, 0, 8, 12], weights := [0, 1, 0, 1] }

def points100 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 8640, representative 3530.
def source101 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B001.Data.entryAt ⟨93, by decide +kernel⟩

def target101 : Weights.Entry :=
  { word := [12, 2, 8, 2, 8, 8, 12], weights := [0, 1, 0, 1] }

def points101 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 8665, representative 3532.
def source102 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B001.Data.entryAt ⟨95, by decide +kernel⟩

def target102 : Weights.Entry :=
  { word := [12, 2, 8, 10, 0, 8, 12], weights := [0, 1, 0, 1] }

def points102 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 8676, representative 3531.
def source103 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B001.Data.entryAt ⟨94, by decide +kernel⟩

def target103 : Weights.Entry :=
  { word := [12, 2, 8, 10, 8, 8, 12], weights := [0, 1, 0, 1] }

def points103 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 8680, representative 3528.
def source104 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B001.Data.entryAt ⟨91, by decide +kernel⟩

def target104 : Weights.Entry :=
  { word := [12, 2, 8, 10, 8, 12, 12], weights := [1, 2, 1, 2] }

def points104 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 8699, representative 3564.
def source105 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B001.Data.entryAt ⟨127, by decide +kernel⟩

def target105 : Weights.Entry :=
  { word := [12, 4, 8, 8, 1, 4, 12], weights := [1, 0, 1, 1] }

def points105 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 8704, representative 3547.
def source106 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B001.Data.entryAt ⟨110, by decide +kernel⟩

def target106 : Weights.Entry :=
  { word := [12, 4, 8, 8, 1, 12, 12], weights := [1, 0, 1, 1] }

def points106 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 8711, representative 3563.
def source107 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B001.Data.entryAt ⟨126, by decide +kernel⟩

def target107 : Weights.Entry :=
  { word := [12, 4, 8, 8, 9, 4, 12], weights := [1, 0, 1, 1] }

def points107 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 8713, representative 3546.
def source108 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B001.Data.entryAt ⟨109, by decide +kernel⟩

def target108 : Weights.Entry :=
  { word := [12, 4, 8, 8, 9, 12, 12], weights := [1, 0, 1, 1] }

def points108 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 8757, representative 3558.
def source109 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B001.Data.entryAt ⟨121, by decide +kernel⟩

def target109 : Weights.Entry :=
  { word := [12, 8, 0, 4, 8, 4, 12], weights := [1, 0, 0, 1] }

def points109 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 8760, representative 3541.
def source110 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B001.Data.entryAt ⟨104, by decide +kernel⟩

def target110 : Weights.Entry :=
  { word := [12, 8, 0, 4, 8, 12, 12], weights := [1, 0, 0, 1] }

def points110 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 8800, representative 3559.
def source111 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B001.Data.entryAt ⟨122, by decide +kernel⟩

def target111 : Weights.Entry :=
  { word := [12, 8, 0, 12, 8, 4, 12], weights := [1, 0, 0, 1] }

def points111 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 8803, representative 3542.
def source112 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B001.Data.entryAt ⟨105, by decide +kernel⟩

def target112 : Weights.Entry :=
  { word := [12, 8, 0, 12, 8, 12, 12], weights := [1, 0, 0, 1] }

def points112 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 8874, representative 3549.
def source113 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B001.Data.entryAt ⟨112, by decide +kernel⟩

def target113 : Weights.Entry :=
  { word := [12, 8, 4, 10, 8, 12, 12], weights := [1, 1, 1, 1] }

def points113 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 8982, representative 3548.
def source114 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B001.Data.entryAt ⟨111, by decide +kernel⟩

def target114 : Weights.Entry :=
  { word := [12, 8, 12, 10, 8, 12, 12], weights := [1, 1, 1, 1] }

def points114 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 8990, representative 3524.
def source115 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B001.Data.entryAt ⟨87, by decide +kernel⟩

def target115 : Weights.Entry :=
  { word := [12, 10, 0, 9, 8, 1, 12], weights := [1, 1, 0, 1] }

def points115 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 8995, representative 3525.
def source116 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B001.Data.entryAt ⟨88, by decide +kernel⟩

def target116 : Weights.Entry :=
  { word := [12, 10, 0, 9, 8, 8, 12], weights := [1, 1, 0, 1] }

def points116 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 8997, representative 3523.
def source117 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B001.Data.entryAt ⟨86, by decide +kernel⟩

def target117 : Weights.Entry :=
  { word := [12, 10, 0, 9, 8, 9, 12], weights := [1, 1, 0, 1] }

def points117 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 9001, representative 3522.
def source118 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B001.Data.entryAt ⟨85, by decide +kernel⟩

def target118 : Weights.Entry :=
  { word := [12, 10, 0, 10, 8, 0, 12], weights := [0, 1, 0, 1] }

def points118 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 9003, representative 3521.
def source119 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B001.Data.entryAt ⟨84, by decide +kernel⟩

def target119 : Weights.Entry :=
  { word := [12, 10, 0, 10, 8, 8, 12], weights := [0, 1, 0, 1] }

def points119 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 9010, representative 3527.
def source120 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B001.Data.entryAt ⟨90, by decide +kernel⟩

def target120 : Weights.Entry :=
  { word := [12, 10, 0, 12, 2, 0, 12], weights := [1, 1, 0, 1] }

def points120 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 9018, representative 3526.
def source121 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B001.Data.entryAt ⟨89, by decide +kernel⟩

def target121 : Weights.Entry :=
  { word := [12, 10, 0, 12, 10, 0, 12], weights := [1, 1, 0, 1] }

def points121 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 9023, representative 3519.
def source122 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B001.Data.entryAt ⟨82, by decide +kernel⟩

def target122 : Weights.Entry :=
  { word := [12, 10, 8, 2, 8, 8, 12], weights := [0, 1, 0, 1] }

def points122 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 9041, representative 3520.
def source123 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B001.Data.entryAt ⟨83, by decide +kernel⟩

def target123 : Weights.Entry :=
  { word := [12, 10, 8, 10, 8, 8, 12], weights := [0, 1, 0, 1] }

def points123 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 9064, representative 3562.
def source124 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B001.Data.entryAt ⟨125, by decide +kernel⟩

def target124 : Weights.Entry :=
  { word := [12, 12, 8, 8, 1, 4, 12], weights := [1, 0, 1, 1] }

def points124 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 9069, representative 3545.
def source125 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B001.Data.entryAt ⟨108, by decide +kernel⟩

def target125 : Weights.Entry :=
  { word := [12, 12, 8, 8, 1, 12, 12], weights := [1, 0, 1, 1] }

def points125 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 9076, representative 3561.
def source126 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B001.Data.entryAt ⟨124, by decide +kernel⟩

def target126 : Weights.Entry :=
  { word := [12, 12, 8, 8, 9, 4, 12], weights := [1, 0, 1, 1] }

def points126 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 9078, representative 3544.
def source127 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B001.Data.entryAt ⟨107, by decide +kernel⟩

def target127 : Weights.Entry :=
  { word := [12, 12, 8, 8, 9, 12, 12], weights := [1, 0, 1, 1] }

def points127 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

def period8Entries : List Weights.Entry := [target0, target1, target2, target3, target4, target5, target6, target7, target8, target9, target10, target11, target12, target13, target14, target15, target16, target17, target18, target19, target20, target21, target22, target23, target24, target25, target26, target27, target28, target29, target30, target31, target32, target33, target34, target35, target36, target37, target38, target39, target40, target41, target42, target43, target44, target45, target46, target47, target48, target49, target50, target51, target52, target53, target54, target55, target56, target57, target58, target59, target60, target61, target62, target63, target64, target65, target66, target67, target68, target69, target70, target71, target72, target73, target74, target75, target76, target77, target78, target79, target80, target81, target82, target83, target84, target85, target86, target87, target88, target89, target90, target91, target92, target93, target94, target95, target96, target97, target98, target99, target100, target101, target102, target103, target104, target105, target106, target107, target108, target109, target110, target111, target112, target113, target114, target115, target116, target117, target118, target119, target120, target121, target122, target123, target124, target125, target126, target127]

def period8Chunk : RowCoverage.Chunk where
  rows := [⟨7678, target0⟩, ⟨7709, target1⟩, ⟨7716, target2⟩, ⟨7728, target3⟩, ⟨7821, target4⟩, ⟨7827, target5⟩, ⟨7838, target6⟩, ⟨7840, target7⟩, ⟨7842, target8⟩, ⟨7847, target9⟩, ⟨7853, target10⟩, ⟨7864, target11⟩, ⟨7866, target12⟩, ⟨7868, target13⟩, ⟨7873, target14⟩, ⟨7879, target15⟩, ⟨7889, target16⟩, ⟨7891, target17⟩, ⟨7893, target18⟩, ⟨7898, target19⟩, ⟨7904, target20⟩, ⟨7923, target21⟩, ⟨7934, target22⟩, ⟨7950, target23⟩, ⟨7958, target24⟩, ⟨7961, target25⟩, ⟨7985, target26⟩, ⟨7991, target27⟩, ⟨8004, target28⟩, ⟨8006, target29⟩, ⟨8009, target30⟩, ⟨8011, target31⟩, ⟨8015, target32⟩, ⟨8021, target33⟩, ⟨8030, target34⟩, ⟨8032, target35⟩, ⟨8035, target36⟩, ⟨8037, target37⟩, ⟨8039, target38⟩, ⟨8041, target39⟩, ⟨8048, target40⟩, ⟨8050, target41⟩, ⟨8053, target42⟩, ⟨8055, target43⟩, ⟨8059, target44⟩, ⟨8065, target45⟩, ⟨8077, target46⟩, ⟨8079, target47⟩, ⟨8082, target48⟩, ⟨8084, target49⟩, ⟨8088, target50⟩, ⟨8094, target51⟩, ⟨8105, target52⟩, ⟨8107, target53⟩, ⟨8110, target54⟩, ⟨8112, target55⟩, ⟨8114, target56⟩, ⟨8116, target57⟩, ⟨8131, target58⟩, ⟨8142, target59⟩, ⟨8158, target60⟩, ⟨8166, target61⟩, ⟨8168, target62⟩, ⟨8171, target63⟩, ⟨8193, target64⟩, ⟨8200, target65⟩, ⟨8206, target66⟩, ⟨8223, target67⟩, ⟨8231, target68⟩, ⟨8239, target69⟩, ⟨8253, target70⟩, ⟨8271, target71⟩, ⟨8302, target72⟩, ⟨8309, target73⟩, ⟨8321, target74⟩, ⟨8345, target75⟩, ⟨8350, target76⟩, ⟨8358, target77⟩, ⟨8367, target78⟩, ⟨8372, target79⟩, ⟨8383, target80⟩, ⟨8397, target81⟩, ⟨8412, target82⟩, ⟨8416, target83⟩, ⟨8423, target84⟩, ⟨8426, target85⟩, ⟨8473, target86⟩, ⟨8481, target87⟩, ⟨8503, target88⟩, ⟨8507, target89⟩, ⟨8566, target90⟩, ⟨8574, target91⟩, ⟨8586, target92⟩, ⟨8591, target93⟩, ⟨8593, target94⟩, ⟨8602, target95⟩, ⟨8608, target96⟩, ⟨8610, target97⟩, ⟨8612, target98⟩, ⟨8619, target99⟩, ⟨8632, target100⟩, ⟨8640, target101⟩, ⟨8665, target102⟩, ⟨8676, target103⟩, ⟨8680, target104⟩, ⟨8699, target105⟩, ⟨8704, target106⟩, ⟨8711, target107⟩, ⟨8713, target108⟩, ⟨8757, target109⟩, ⟨8760, target110⟩, ⟨8800, target111⟩, ⟨8803, target112⟩, ⟨8874, target113⟩, ⟨8982, target114⟩, ⟨8990, target115⟩, ⟨8995, target116⟩, ⟨8997, target117⟩, ⟨9001, target118⟩, ⟨9003, target119⟩, ⟨9010, target120⟩, ⟨9018, target121⟩, ⟨9023, target122⟩, ⟨9041, target123⟩, ⟨9064, target124⟩, ⟨9069, target125⟩, ⟨9076, target126⟩, ⟨9078, target127⟩]
  indexMask := 704546851335323106944377300541353866367607991401209780604434434377129718225693941285662195469351905436952344475537696557737701158955917821199829240597192422628152813077156995612647647053725872355718833129326022680532924956419781773518383601481315182220833221007023464680930500362648323628202650686929179193076019566398797085818008870511514585430901652848421073328953959191817901986192993267996948232786672012350662514367627967481257998832152146563416952414288512108489669243453198946436929975452574837607959781521349210383245605500685699619450499561942149711774216605967447490622678763277313452093101930536326014934345516964597549927169602207190340139446515946112793255822645187755459421350784119098947100362763707953972883393078271546642635740636244637986717784961507148254517187904496530815331501642661149373514935207312226640394535593816235780915946579442458005985726870654941352582680105329212725437078625675042317824635743577507304702942368207407199154341489050857759429944133316824493765238435321869575024890213010034433950961478762608186764074412590414380225238788971287236557703597189718841782264244477760459987480908746303176762196080982578514453701582100913550724438125040213787315120320277374345177043816856209435256892338282295152330284377350839753895274546086955627360511921213881726232861720434246310399661562207240962957498135138952038027744905268400579857363338611804433805617549709398620784445452841043844395375392935457172048671252863394051335385138599989191001400725283158788489712703476515060389035751384476613749342043716019161318707092770991379141210935415750285176076915796007240727180883083918169956179663765904504929843524586497312464432233708285779051945787331223565762974190576723499837829399987283128546619147546222735751879729346515433987464628907224762743725145991243009357703466477547862649349310456548941263783292814255082645356837693504765772945163480771174336383484948085227871070255307168266635495507986883902400211834509764130236680788811173787706709762839686266472500522140497387023981764337553760399956259832251656861201640587689267558350943607379600948214077125510236651681809912361408986154539723846313332744054731944000979650256390543013989807857018831839798321614613681821774455932836295420084512394998486330203693319425749430352226376902056973560349080638505923471243522633584595560919699859449109527093201078902085387923650929034716310370185990816747870767846955429738364300602200239327529044003210715358878998263814301948912120187413605781414160170584983682968291651435078845470594013922533242243178464407427392114192182067440030431097598998957293480584695776722168812329871396637414240270061754549748104124963369180343857424767048264907180512546263242861821903943816619939118414800355328
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

end FranklSmallCyclic.TransportBatches.G027.B001.Data
