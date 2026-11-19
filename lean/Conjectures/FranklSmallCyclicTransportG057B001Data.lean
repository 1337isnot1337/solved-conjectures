module

public import Conjectures.FranklSmallCyclicRowCoverage
public import Conjectures.FranklSmallCyclicCanonicalWords
public import Conjectures.FranklSmallCyclicOrbit9Block004Data

/-! 128 literal targets sharing one source proof block.
Original words and row indices are retained; weights may be transported.
-/
@[expose] public section

namespace FranklSmallCyclic.TransportBatches.G057.B001.Data

-- Period 9, original row 3620, representative 7290.
def source0 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B004.Data.entryAt ⟨28, by decide +kernel⟩

def target0 : Weights.Entry :=
  { word := [4, 2, 8, 2, 0, 8, 12], weights := [1, 0, 0, 1] }

def points0 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 8), (8, 7)]

-- Period 9, original row 3628, representative 7285.
def source1 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B004.Data.entryAt ⟨23, by decide +kernel⟩

def target1 : Weights.Entry :=
  { word := [4, 2, 8, 2, 8, 8, 12], weights := [1, 0, 0, 1] }

-- Period 9, original row 3652, representative 7291.
def source2 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B004.Data.entryAt ⟨29, by decide +kernel⟩

def target2 : Weights.Entry :=
  { word := [4, 2, 8, 10, 0, 8, 10], weights := [1, 0, 0, 1] }

-- Period 9, original row 3653, representative 7291.
def source3 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B004.Data.entryAt ⟨29, by decide +kernel⟩

def target3 : Weights.Entry :=
  { word := [4, 2, 8, 10, 0, 8, 12], weights := [1, 0, 0, 1] }

def points3 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 8), (8, 7)]

-- Period 9, original row 3664, representative 7286.
def source4 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B004.Data.entryAt ⟨24, by decide +kernel⟩

def target4 : Weights.Entry :=
  { word := [4, 2, 8, 10, 8, 8, 12], weights := [1, 0, 0, 1] }

-- Period 9, original row 3678, representative 7339.
def source5 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B004.Data.entryAt ⟨77, by decide +kernel⟩

def target5 : Weights.Entry :=
  { word := [4, 4, 4, 8, 8, 2, 10], weights := [0, 1, 1, 0] }

-- Period 9, original row 3680, representative 7331.
def source6 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B004.Data.entryAt ⟨69, by decide +kernel⟩

def target6 : Weights.Entry :=
  { word := [4, 4, 4, 8, 8, 10, 10], weights := [0, 1, 1, 0] }

-- Period 9, original row 3694, representative 7337.
def source7 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B004.Data.entryAt ⟨75, by decide +kernel⟩

def target7 : Weights.Entry :=
  { word := [4, 4, 8, 8, 2, 2, 10], weights := [0, 1, 1, 0] }

-- Period 9, original row 3696, representative 7329.
def source8 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B004.Data.entryAt ⟨67, by decide +kernel⟩

def target8 : Weights.Entry :=
  { word := [4, 4, 8, 8, 2, 10, 10], weights := [0, 1, 1, 0] }

-- Period 9, original row 3703, representative 7336.
def source9 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B004.Data.entryAt ⟨74, by decide +kernel⟩

def target9 : Weights.Entry :=
  { word := [4, 4, 8, 8, 10, 2, 10], weights := [0, 1, 1, 0] }

-- Period 9, original row 3705, representative 7328.
def source10 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B004.Data.entryAt ⟨66, by decide +kernel⟩

def target10 : Weights.Entry :=
  { word := [4, 4, 8, 8, 10, 10, 10], weights := [0, 1, 1, 0] }

-- Period 9, original row 3708, representative 7338.
def source11 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B004.Data.entryAt ⟨76, by decide +kernel⟩

def target11 : Weights.Entry :=
  { word := [4, 4, 12, 8, 8, 2, 10], weights := [0, 1, 1, 0] }

-- Period 9, original row 3710, representative 7330.
def source12 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B004.Data.entryAt ⟨68, by decide +kernel⟩

def target12 : Weights.Entry :=
  { word := [4, 4, 12, 8, 8, 10, 10], weights := [0, 1, 1, 0] }

-- Period 9, original row 3728, representative 7380.
def source13 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B004.Data.entryAt ⟨118, by decide +kernel⟩

def target13 : Weights.Entry :=
  { word := [4, 8, 0, 4, 2, 0, 10], weights := [1, 0, 1, 0] }

def points13 : List (ℕ × ℕ) := [(0, 0), (1, 2), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 3729, representative 7388.
def source14 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B004.Data.entryAt ⟨126, by decide +kernel⟩

def target14 : Weights.Entry :=
  { word := [4, 8, 0, 4, 2, 0, 12], weights := [1, 0, 0, 1] }

def points14 : List (ℕ × ℕ) := [(0, 0), (1, 2), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 3733, representative 7340.
def source15 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B004.Data.entryAt ⟨78, by decide +kernel⟩

def target15 : Weights.Entry :=
  { word := [4, 8, 0, 4, 2, 8, 10], weights := [1, 0, 1, 0] }

def points15 : List (ℕ × ℕ) := [(0, 0), (1, 2), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 3734, representative 7348.
def source16 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B004.Data.entryAt ⟨86, by decide +kernel⟩

def target16 : Weights.Entry :=
  { word := [4, 8, 0, 4, 2, 8, 12], weights := [1, 0, 0, 1] }

def points16 : List (ℕ × ℕ) := [(0, 0), (1, 2), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 3754, representative 7381.
def source17 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B004.Data.entryAt ⟨119, by decide +kernel⟩

def target17 : Weights.Entry :=
  { word := [4, 8, 0, 4, 10, 0, 10], weights := [1, 0, 1, 0] }

def points17 : List (ℕ × ℕ) := [(0, 0), (1, 2), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 3755, representative 7389.
def source18 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B004.Data.entryAt ⟨127, by decide +kernel⟩

def target18 : Weights.Entry :=
  { word := [4, 8, 0, 4, 10, 0, 12], weights := [1, 0, 0, 1] }

def points18 : List (ℕ × ℕ) := [(0, 0), (1, 2), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 3759, representative 7341.
def source19 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B004.Data.entryAt ⟨79, by decide +kernel⟩

def target19 : Weights.Entry :=
  { word := [4, 8, 0, 4, 10, 8, 10], weights := [1, 0, 1, 0] }

def points19 : List (ℕ × ℕ) := [(0, 0), (1, 2), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 3760, representative 7349.
def source20 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B004.Data.entryAt ⟨87, by decide +kernel⟩

def target20 : Weights.Entry :=
  { word := [4, 8, 0, 4, 10, 8, 12], weights := [1, 0, 0, 1] }

def points20 : List (ℕ × ℕ) := [(0, 0), (1, 2), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 3772, representative 7387.
def source21 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B004.Data.entryAt ⟨125, by decide +kernel⟩

def target21 : Weights.Entry :=
  { word := [4, 8, 0, 12, 2, 0, 10], weights := [1, 0, 1, 0] }

def points21 : List (ℕ × ℕ) := [(0, 0), (1, 2), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 3777, representative 7347.
def source22 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B004.Data.entryAt ⟨85, by decide +kernel⟩

def target22 : Weights.Entry :=
  { word := [4, 8, 0, 12, 2, 8, 10], weights := [1, 0, 1, 0] }

def points22 : List (ℕ × ℕ) := [(0, 0), (1, 2), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 3778, representative 7355.
def source23 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B004.Data.entryAt ⟨93, by decide +kernel⟩

def target23 : Weights.Entry :=
  { word := [4, 8, 0, 12, 2, 8, 12], weights := [1, 0, 1, 0] }

def points23 : List (ℕ × ℕ) := [(0, 0), (1, 2), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 3797, representative 7384.
def source24 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B004.Data.entryAt ⟨122, by decide +kernel⟩

def target24 : Weights.Entry :=
  { word := [4, 8, 0, 12, 10, 0, 10], weights := [1, 0, 1, 0] }

def points24 : List (ℕ × ℕ) := [(0, 0), (1, 2), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 3802, representative 7344.
def source25 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B004.Data.entryAt ⟨82, by decide +kernel⟩

def target25 : Weights.Entry :=
  { word := [4, 8, 0, 12, 10, 8, 10], weights := [1, 0, 1, 0] }

def points25 : List (ℕ × ℕ) := [(0, 0), (1, 2), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 3803, representative 7352.
def source26 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B004.Data.entryAt ⟨90, by decide +kernel⟩

def target26 : Weights.Entry :=
  { word := [4, 8, 0, 12, 10, 8, 12], weights := [1, 0, 1, 0] }

def points26 : List (ℕ × ℕ) := [(0, 0), (1, 2), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 3816, representative 7356.
def source27 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B004.Data.entryAt ⟨94, by decide +kernel⟩

def target27 : Weights.Entry :=
  { word := [4, 8, 4, 2, 0, 8, 10], weights := [1, 0, 0, 1] }

-- Period 9, original row 3817, representative 7356.
def source28 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B004.Data.entryAt ⟨94, by decide +kernel⟩

def target28 : Weights.Entry :=
  { word := [4, 8, 4, 2, 0, 8, 12], weights := [1, 0, 0, 1] }

def points28 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 8), (8, 7)]

-- Period 9, original row 3825, representative 7357.
def source29 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B004.Data.entryAt ⟨95, by decide +kernel⟩

def target29 : Weights.Entry :=
  { word := [4, 8, 4, 2, 8, 8, 12], weights := [1, 0, 0, 1] }

-- Period 9, original row 3851, representative 7363.
def source30 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B004.Data.entryAt ⟨101, by decide +kernel⟩

def target30 : Weights.Entry :=
  { word := [4, 8, 4, 10, 0, 8, 10], weights := [1, 0, 0, 1] }

-- Period 9, original row 3852, representative 7363.
def source31 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B004.Data.entryAt ⟨101, by decide +kernel⟩

def target31 : Weights.Entry :=
  { word := [4, 8, 4, 10, 0, 8, 12], weights := [1, 0, 0, 1] }

def points31 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 8), (8, 7)]

-- Period 9, original row 3859, representative 7360.
def source32 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B004.Data.entryAt ⟨98, by decide +kernel⟩

def target32 : Weights.Entry :=
  { word := [4, 8, 4, 10, 8, 8, 12], weights := [1, 0, 0, 1] }

-- Period 9, original row 3924, representative 7361.
def source33 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B004.Data.entryAt ⟨99, by decide +kernel⟩

def target33 : Weights.Entry :=
  { word := [4, 8, 12, 2, 0, 8, 10], weights := [1, 0, 0, 1] }

-- Period 9, original row 3925, representative 7361.
def source34 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B004.Data.entryAt ⟨99, by decide +kernel⟩

def target34 : Weights.Entry :=
  { word := [4, 8, 12, 2, 0, 8, 12], weights := [1, 0, 0, 1] }

def points34 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 8), (8, 7)]

-- Period 9, original row 3933, representative 7358.
def source35 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B004.Data.entryAt ⟨96, by decide +kernel⟩

def target35 : Weights.Entry :=
  { word := [4, 8, 12, 2, 8, 8, 12], weights := [1, 0, 0, 1] }

-- Period 9, original row 3959, representative 7362.
def source36 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B004.Data.entryAt ⟨100, by decide +kernel⟩

def target36 : Weights.Entry :=
  { word := [4, 8, 12, 10, 0, 8, 10], weights := [1, 0, 0, 1] }

-- Period 9, original row 3960, representative 7362.
def source37 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B004.Data.entryAt ⟨100, by decide +kernel⟩

def target37 : Weights.Entry :=
  { word := [4, 8, 12, 10, 0, 8, 12], weights := [1, 0, 0, 1] }

def points37 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 8), (8, 7)]

-- Period 9, original row 3967, representative 7359.
def source38 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B004.Data.entryAt ⟨97, by decide +kernel⟩

def target38 : Weights.Entry :=
  { word := [4, 8, 12, 10, 8, 8, 12], weights := [1, 0, 0, 1] }

-- Period 9, original row 3978, representative 7264.
def source39 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B004.Data.entryAt ⟨2, by decide +kernel⟩

def target39 : Weights.Entry :=
  { word := [4, 10, 0, 9, 8, 1, 12], weights := [1, 1, 0, 1] }

def points39 : List (ℕ × ℕ) := [(0, 0), (1, 2), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 3980, representative 7262.
def source40 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B004.Data.entryAt ⟨0, by decide +kernel⟩

def target40 : Weights.Entry :=
  { word := [4, 10, 0, 9, 8, 2, 10], weights := [1, 1, 0, 1] }

def points40 : List (ℕ × ℕ) := [(0, 0), (1, 2), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 3983, representative 7270.
def source41 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B004.Data.entryAt ⟨8, by decide +kernel⟩

def target41 : Weights.Entry :=
  { word := [4, 10, 0, 9, 8, 8, 12], weights := [1, 1, 0, 1] }

def points41 : List (ℕ × ℕ) := [(0, 0), (1, 2), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 3997, representative 7280.
def source42 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B004.Data.entryAt ⟨18, by decide +kernel⟩

def target42 : Weights.Entry :=
  { word := [4, 10, 0, 12, 2, 0, 10], weights := [1, 1, 1, 0] }

def points42 : List (ℕ × ℕ) := [(0, 0), (1, 2), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 3998, representative 7284.
def source43 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B004.Data.entryAt ⟨22, by decide +kernel⟩

def target43 : Weights.Entry :=
  { word := [4, 10, 0, 12, 2, 0, 12], weights := [1, 1, 0, 1] }

def points43 : List (ℕ × ℕ) := [(0, 0), (1, 2), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 4005, representative 7278.
def source44 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B004.Data.entryAt ⟨16, by decide +kernel⟩

def target44 : Weights.Entry :=
  { word := [4, 10, 0, 12, 10, 0, 10], weights := [1, 1, 1, 0] }

def points44 : List (ℕ × ℕ) := [(0, 0), (1, 2), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 4006, representative 7282.
def source45 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B004.Data.entryAt ⟨20, by decide +kernel⟩

def target45 : Weights.Entry :=
  { word := [4, 10, 0, 12, 10, 0, 12], weights := [1, 1, 0, 1] }

def points45 : List (ℕ × ℕ) := [(0, 0), (1, 2), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 4043, representative 7335.
def source46 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B004.Data.entryAt ⟨73, by decide +kernel⟩

def target46 : Weights.Entry :=
  { word := [4, 12, 4, 8, 8, 2, 10], weights := [0, 1, 1, 0] }

-- Period 9, original row 4045, representative 7327.
def source47 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B004.Data.entryAt ⟨65, by decide +kernel⟩

def target47 : Weights.Entry :=
  { word := [4, 12, 4, 8, 8, 10, 10], weights := [0, 1, 1, 0] }

-- Period 9, original row 4059, representative 7333.
def source48 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B004.Data.entryAt ⟨71, by decide +kernel⟩

def target48 : Weights.Entry :=
  { word := [4, 12, 8, 8, 2, 2, 10], weights := [0, 1, 1, 0] }

-- Period 9, original row 4061, representative 7325.
def source49 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B004.Data.entryAt ⟨63, by decide +kernel⟩

def target49 : Weights.Entry :=
  { word := [4, 12, 8, 8, 2, 10, 10], weights := [0, 1, 1, 0] }

-- Period 9, original row 4068, representative 7332.
def source50 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B004.Data.entryAt ⟨70, by decide +kernel⟩

def target50 : Weights.Entry :=
  { word := [4, 12, 8, 8, 10, 2, 10], weights := [0, 1, 1, 0] }

-- Period 9, original row 4070, representative 7324.
def source51 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B004.Data.entryAt ⟨62, by decide +kernel⟩

def target51 : Weights.Entry :=
  { word := [4, 12, 8, 8, 10, 10, 10], weights := [0, 1, 1, 0] }

-- Period 9, original row 4073, representative 7334.
def source52 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B004.Data.entryAt ⟨72, by decide +kernel⟩

def target52 : Weights.Entry :=
  { word := [4, 12, 12, 8, 8, 2, 10], weights := [0, 1, 1, 0] }

-- Period 9, original row 4075, representative 7326.
def source53 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B004.Data.entryAt ⟨64, by decide +kernel⟩

def target53 : Weights.Entry :=
  { word := [4, 12, 12, 8, 8, 10, 10], weights := [0, 1, 1, 0] }

-- Period 9, original row 7403, representative 7317.
def source54 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B004.Data.entryAt ⟨55, by decide +kernel⟩

def target54 : Weights.Entry :=
  { word := [10, 0, 0, 9, 4, 4, 4], weights := [1, 0, 1, 1] }

def points54 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2)]

-- Period 9, original row 7405, representative 7276.
def source55 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B004.Data.entryAt ⟨14, by decide +kernel⟩

def target55 : Weights.Entry :=
  { word := [10, 0, 0, 9, 4, 12, 4], weights := [1, 0, 1, 1] }

def points55 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2)]

-- Period 9, original row 7407, representative 7316.
def source56 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B004.Data.entryAt ⟨54, by decide +kernel⟩

def target56 : Weights.Entry :=
  { word := [10, 0, 0, 9, 12, 4, 4], weights := [1, 0, 1, 1] }

def points56 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2)]

-- Period 9, original row 7409, representative 7275.
def source57 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B004.Data.entryAt ⟨13, by decide +kernel⟩

def target57 : Weights.Entry :=
  { word := [10, 0, 0, 9, 12, 12, 4], weights := [1, 0, 1, 1] }

def points57 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2)]

-- Period 9, original row 7413, representative 7298.
def source58 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B004.Data.entryAt ⟨36, by decide +kernel⟩

def target58 : Weights.Entry :=
  { word := [10, 0, 0, 12, 0, 4, 2], weights := [0, 0, 1, 1] }

def points58 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2)]

-- Period 9, original row 7414, representative 7298.
def source59 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B004.Data.entryAt ⟨36, by decide +kernel⟩

def target59 : Weights.Entry :=
  { word := [10, 0, 0, 12, 0, 4, 4], weights := [0, 0, 1, 1] }

def points59 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2)]

-- Period 9, original row 7427, representative 7388.
def source60 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B004.Data.entryAt ⟨126, by decide +kernel⟩

def target60 : Weights.Entry :=
  { word := [10, 0, 4, 2, 0, 8, 2], weights := [1, 0, 0, 1] }

def points60 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 7428, representative 7388.
def source61 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B004.Data.entryAt ⟨126, by decide +kernel⟩

def target61 : Weights.Entry :=
  { word := [10, 0, 4, 2, 0, 8, 4], weights := [1, 0, 0, 1] }

def points61 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 7458, representative 7284.
def source62 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B004.Data.entryAt ⟨22, by decide +kernel⟩

def target62 : Weights.Entry :=
  { word := [10, 0, 4, 10, 0, 12, 2], weights := [1, 0, 1, 1] }

def points62 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 7459, representative 7284.
def source63 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B004.Data.entryAt ⟨22, by decide +kernel⟩

def target63 : Weights.Entry :=
  { word := [10, 0, 4, 10, 0, 12, 4], weights := [1, 0, 1, 1] }

def points63 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 7464, representative 7323.
def source64 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B004.Data.entryAt ⟨61, by decide +kernel⟩

def target64 : Weights.Entry :=
  { word := [10, 0, 4, 10, 8, 4, 4], weights := [1, 0, 1, 1] }

def points64 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 7469, representative 7283.
def source65 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B004.Data.entryAt ⟨21, by decide +kernel⟩

def target65 : Weights.Entry :=
  { word := [10, 0, 4, 10, 8, 12, 4], weights := [1, 0, 1, 1] }

def points65 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 7488, representative 7295.
def source66 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B004.Data.entryAt ⟨33, by decide +kernel⟩

def target66 : Weights.Entry :=
  { word := [10, 0, 8, 4, 8, 4, 4], weights := [1, 0, 0, 1] }

def points66 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 7492, representative 7315.
def source67 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B004.Data.entryAt ⟨53, by decide +kernel⟩

def target67 : Weights.Entry :=
  { word := [10, 0, 8, 9, 4, 4, 4], weights := [1, 0, 1, 1] }

def points67 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 7494, representative 7274.
def source68 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B004.Data.entryAt ⟨12, by decide +kernel⟩

def target68 : Weights.Entry :=
  { word := [10, 0, 8, 9, 4, 12, 4], weights := [1, 0, 1, 1] }

def points68 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 7496, representative 7314.
def source69 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B004.Data.entryAt ⟨52, by decide +kernel⟩

def target69 : Weights.Entry :=
  { word := [10, 0, 8, 9, 12, 4, 4], weights := [1, 0, 1, 1] }

def points69 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 7498, representative 7273.
def source70 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B004.Data.entryAt ⟨11, by decide +kernel⟩

def target70 : Weights.Entry :=
  { word := [10, 0, 8, 9, 12, 12, 4], weights := [1, 0, 1, 1] }

def points70 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 7504, representative 7297.
def source71 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B004.Data.entryAt ⟨35, by decide +kernel⟩

def target71 : Weights.Entry :=
  { word := [10, 0, 8, 12, 0, 4, 2], weights := [0, 0, 1, 1] }

def points71 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 7505, representative 7297.
def source72 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B004.Data.entryAt ⟨35, by decide +kernel⟩

def target72 : Weights.Entry :=
  { word := [10, 0, 8, 12, 0, 4, 4], weights := [0, 0, 1, 1] }

def points72 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 7518, representative 7296.
def source73 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B004.Data.entryAt ⟨34, by decide +kernel⟩

def target73 : Weights.Entry :=
  { word := [10, 0, 8, 12, 8, 4, 4], weights := [0, 0, 1, 1] }

def points73 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 7524, representative 7306.
def source74 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B004.Data.entryAt ⟨44, by decide +kernel⟩

def target74 : Weights.Entry :=
  { word := [10, 0, 9, 8, 1, 4, 2], weights := [1, 0, 1, 1] }

def points74 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 7525, representative 7306.
def source75 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B004.Data.entryAt ⟨44, by decide +kernel⟩

def target75 : Weights.Entry :=
  { word := [10, 0, 9, 8, 1, 4, 4], weights := [1, 0, 1, 1] }

def points75 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 7529, representative 7264.
def source76 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B004.Data.entryAt ⟨2, by decide +kernel⟩

def target76 : Weights.Entry :=
  { word := [10, 0, 9, 8, 1, 12, 2], weights := [1, 0, 1, 1] }

def points76 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 7530, representative 7264.
def source77 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B004.Data.entryAt ⟨2, by decide +kernel⟩

def target77 : Weights.Entry :=
  { word := [10, 0, 9, 8, 1, 12, 4], weights := [1, 0, 1, 1] }

def points77 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 7534, representative 7305.
def source78 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B004.Data.entryAt ⟨43, by decide +kernel⟩

def target78 : Weights.Entry :=
  { word := [10, 0, 9, 8, 9, 4, 4], weights := [1, 0, 1, 1] }

def points78 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 7536, representative 7263.
def source79 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B004.Data.entryAt ⟨1, by decide +kernel⟩

def target79 : Weights.Entry :=
  { word := [10, 0, 9, 8, 9, 12, 4], weights := [1, 0, 1, 1] }

def points79 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 7544, representative 7389.
def source80 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B004.Data.entryAt ⟨127, by decide +kernel⟩

def target80 : Weights.Entry :=
  { word := [10, 0, 12, 2, 0, 8, 2], weights := [1, 0, 0, 1] }

def points80 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 7545, representative 7389.
def source81 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B004.Data.entryAt ⟨127, by decide +kernel⟩

def target81 : Weights.Entry :=
  { word := [10, 0, 12, 2, 0, 8, 4], weights := [1, 0, 0, 1] }

def points81 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 7566, representative 7322.
def source82 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B004.Data.entryAt ⟨60, by decide +kernel⟩

def target82 : Weights.Entry :=
  { word := [10, 0, 12, 10, 0, 4, 2], weights := [1, 0, 1, 1] }

def points82 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 7567, representative 7322.
def source83 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B004.Data.entryAt ⟨60, by decide +kernel⟩

def target83 : Weights.Entry :=
  { word := [10, 0, 12, 10, 0, 4, 4], weights := [1, 0, 1, 1] }

def points83 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 7580, representative 7282.
def source84 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B004.Data.entryAt ⟨20, by decide +kernel⟩

def target84 : Weights.Entry :=
  { word := [10, 0, 12, 10, 0, 12, 2], weights := [1, 0, 1, 1] }

def points84 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 7581, representative 7282.
def source85 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B004.Data.entryAt ⟨20, by decide +kernel⟩

def target85 : Weights.Entry :=
  { word := [10, 0, 12, 10, 0, 12, 4], weights := [1, 0, 1, 1] }

def points85 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 7586, representative 7321.
def source86 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B004.Data.entryAt ⟨59, by decide +kernel⟩

def target86 : Weights.Entry :=
  { word := [10, 0, 12, 10, 8, 4, 4], weights := [1, 0, 1, 1] }

def points86 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 7591, representative 7281.
def source87 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B004.Data.entryAt ⟨19, by decide +kernel⟩

def target87 : Weights.Entry :=
  { word := [10, 0, 12, 10, 8, 12, 4], weights := [1, 0, 1, 1] }

def points87 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 7821, representative 7372.
def source88 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B004.Data.entryAt ⟨110, by decide +kernel⟩

def target88 : Weights.Entry :=
  { word := [10, 8, 0, 4, 2, 0, 4], weights := [1, 0, 0, 1] }

def points88 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2)]

-- Period 9, original row 7826, representative 7356.
def source89 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B004.Data.entryAt ⟨94, by decide +kernel⟩

def target89 : Weights.Entry :=
  { word := [10, 8, 0, 4, 2, 8, 2], weights := [1, 0, 0, 1] }

def points89 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2)]

-- Period 9, original row 7827, representative 7364.
def source90 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B004.Data.entryAt ⟨102, by decide +kernel⟩

def target90 : Weights.Entry :=
  { word := [10, 8, 0, 4, 2, 8, 4], weights := [1, 0, 0, 1] }

def points90 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2)]

-- Period 9, original row 7837, representative 7290.
def source91 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B004.Data.entryAt ⟨28, by decide +kernel⟩

def target91 : Weights.Entry :=
  { word := [10, 8, 0, 4, 8, 4, 2], weights := [1, 0, 0, 1] }

def points91 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2)]

-- Period 9, original row 7838, representative 7292.
def source92 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B004.Data.entryAt ⟨30, by decide +kernel⟩

def target92 : Weights.Entry :=
  { word := [10, 8, 0, 4, 8, 4, 4], weights := [1, 0, 0, 1] }

def points92 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2)]

-- Period 9, original row 7847, representative 7377.
def source93 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B004.Data.entryAt ⟨115, by decide +kernel⟩

def target93 : Weights.Entry :=
  { word := [10, 8, 0, 4, 10, 0, 4], weights := [1, 0, 0, 1] }

def points93 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2)]

-- Period 9, original row 7852, representative 7361.
def source94 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B004.Data.entryAt ⟨99, by decide +kernel⟩

def target94 : Weights.Entry :=
  { word := [10, 8, 0, 4, 10, 8, 2], weights := [1, 0, 0, 1] }

def points94 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2)]

-- Period 9, original row 7853, representative 7369.
def source95 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B004.Data.entryAt ⟨107, by decide +kernel⟩

def target95 : Weights.Entry :=
  { word := [10, 8, 0, 4, 10, 8, 4], weights := [1, 0, 0, 1] }

def points95 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2)]

-- Period 9, original row 7863, representative 7294.
def source96 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B004.Data.entryAt ⟨32, by decide +kernel⟩

def target96 : Weights.Entry :=
  { word := [10, 8, 0, 12, 0, 4, 2], weights := [1, 0, 0, 1] }

def points96 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 7864, representative 7294.
def source97 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B004.Data.entryAt ⟨32, by decide +kernel⟩

def target97 : Weights.Entry :=
  { word := [10, 8, 0, 12, 0, 4, 4], weights := [1, 0, 0, 1] }

def points97 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 7873, representative 7379.
def source98 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B004.Data.entryAt ⟨117, by decide +kernel⟩

def target98 : Weights.Entry :=
  { word := [10, 8, 0, 12, 2, 0, 4], weights := [1, 0, 0, 1] }

def points98 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2)]

-- Period 9, original row 7878, representative 7363.
def source99 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B004.Data.entryAt ⟨101, by decide +kernel⟩

def target99 : Weights.Entry :=
  { word := [10, 8, 0, 12, 2, 8, 2], weights := [1, 0, 0, 1] }

def points99 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2)]

-- Period 9, original row 7879, representative 7371.
def source100 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B004.Data.entryAt ⟨109, by decide +kernel⟩

def target100 : Weights.Entry :=
  { word := [10, 8, 0, 12, 2, 8, 4], weights := [1, 0, 0, 1] }

def points100 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2)]

-- Period 9, original row 7888, representative 7291.
def source101 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B004.Data.entryAt ⟨29, by decide +kernel⟩

def target101 : Weights.Entry :=
  { word := [10, 8, 0, 12, 8, 4, 2], weights := [1, 0, 0, 1] }

def points101 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2)]

-- Period 9, original row 7889, representative 7293.
def source102 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B004.Data.entryAt ⟨31, by decide +kernel⟩

def target102 : Weights.Entry :=
  { word := [10, 8, 0, 12, 8, 4, 4], weights := [1, 0, 0, 1] }

def points102 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2)]

-- Period 9, original row 7898, representative 7378.
def source103 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B004.Data.entryAt ⟨116, by decide +kernel⟩

def target103 : Weights.Entry :=
  { word := [10, 8, 0, 12, 10, 0, 4], weights := [1, 0, 0, 1] }

def points103 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2)]

-- Period 9, original row 7903, representative 7362.
def source104 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B004.Data.entryAt ⟨100, by decide +kernel⟩

def target104 : Weights.Entry :=
  { word := [10, 8, 0, 12, 10, 8, 2], weights := [1, 0, 0, 1] }

def points104 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2)]

-- Period 9, original row 7904, representative 7370.
def source105 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B004.Data.entryAt ⟨108, by decide +kernel⟩

def target105 : Weights.Entry :=
  { word := [10, 8, 0, 12, 10, 8, 4], weights := [1, 0, 0, 1] }

def points105 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2)]

-- Period 9, original row 7922, representative 7348.
def source106 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B004.Data.entryAt ⟨86, by decide +kernel⟩

def target106 : Weights.Entry :=
  { word := [10, 8, 4, 2, 0, 8, 2], weights := [1, 0, 0, 1] }

def points106 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 7923, representative 7348.
def source107 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B004.Data.entryAt ⟨86, by decide +kernel⟩

def target107 : Weights.Entry :=
  { word := [10, 8, 4, 2, 0, 8, 4], weights := [1, 0, 0, 1] }

def points107 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 7934, representative 7353.
def source108 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B004.Data.entryAt ⟨91, by decide +kernel⟩

def target108 : Weights.Entry :=
  { word := [10, 8, 4, 2, 8, 8, 4], weights := [1, 0, 0, 1] }

def points108 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 7949, representative 7355.
def source109 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B004.Data.entryAt ⟨93, by decide +kernel⟩

def target109 : Weights.Entry :=
  { word := [10, 8, 4, 10, 0, 8, 2], weights := [0, 1, 0, 1] }

def points109 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 7950, representative 7355.
def source110 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B004.Data.entryAt ⟨93, by decide +kernel⟩

def target110 : Weights.Entry :=
  { word := [10, 8, 4, 10, 0, 8, 4], weights := [0, 1, 0, 1] }

def points110 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 7958, representative 7354.
def source111 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B004.Data.entryAt ⟨92, by decide +kernel⟩

def target111 : Weights.Entry :=
  { word := [10, 8, 4, 10, 8, 8, 4], weights := [0, 1, 0, 1] }

def points111 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 7961, representative 7268.
def source112 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B004.Data.entryAt ⟨6, by decide +kernel⟩

def target112 : Weights.Entry :=
  { word := [10, 8, 4, 10, 8, 12, 4], weights := [2, 2, 1, 3] }

def points112 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 7985, representative 7373.
def source113 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B004.Data.entryAt ⟨111, by decide +kernel⟩

def target113 : Weights.Entry :=
  { word := [10, 8, 8, 4, 2, 0, 4], weights := [1, 0, 0, 1] }

def points113 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 7990, representative 7357.
def source114 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B004.Data.entryAt ⟨95, by decide +kernel⟩

def target114 : Weights.Entry :=
  { word := [10, 8, 8, 4, 2, 8, 2], weights := [1, 0, 0, 1] }

def points114 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 7991, representative 7365.
def source115 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B004.Data.entryAt ⟨103, by decide +kernel⟩

def target115 : Weights.Entry :=
  { word := [10, 8, 8, 4, 2, 8, 4], weights := [1, 0, 0, 1] }

def points115 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 8003, representative 7285.
def source116 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B004.Data.entryAt ⟨23, by decide +kernel⟩

def target116 : Weights.Entry :=
  { word := [10, 8, 8, 4, 8, 4, 2], weights := [1, 0, 0, 1] }

def points116 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 8004, representative 7287.
def source117 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B004.Data.entryAt ⟨25, by decide +kernel⟩

def target117 : Weights.Entry :=
  { word := [10, 8, 8, 4, 8, 4, 4], weights := [1, 0, 0, 1] }

def points117 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 8015, representative 7374.
def source118 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B004.Data.entryAt ⟨112, by decide +kernel⟩

def target118 : Weights.Entry :=
  { word := [10, 8, 8, 4, 10, 0, 4], weights := [1, 0, 0, 1] }

def points118 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 8020, representative 7358.
def source119 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B004.Data.entryAt ⟨96, by decide +kernel⟩

def target119 : Weights.Entry :=
  { word := [10, 8, 8, 4, 10, 8, 2], weights := [1, 0, 0, 1] }

def points119 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 8021, representative 7366.
def source120 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B004.Data.entryAt ⟨104, by decide +kernel⟩

def target120 : Weights.Entry :=
  { word := [10, 8, 8, 4, 10, 8, 4], weights := [1, 0, 0, 1] }

def points120 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 8029, representative 7311.
def source121 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B004.Data.entryAt ⟨49, by decide +kernel⟩

def target121 : Weights.Entry :=
  { word := [10, 8, 8, 8, 1, 4, 2], weights := [1, 0, 1, 1] }

def points121 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 8030, representative 7311.
def source122 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B004.Data.entryAt ⟨49, by decide +kernel⟩

def target122 : Weights.Entry :=
  { word := [10, 8, 8, 8, 1, 4, 4], weights := [1, 0, 1, 1] }

def points122 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 8034, representative 7270.
def source123 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B004.Data.entryAt ⟨8, by decide +kernel⟩

def target123 : Weights.Entry :=
  { word := [10, 8, 8, 8, 1, 12, 2], weights := [1, 0, 1, 1] }

def points123 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 8035, representative 7270.
def source124 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B004.Data.entryAt ⟨8, by decide +kernel⟩

def target124 : Weights.Entry :=
  { word := [10, 8, 8, 8, 1, 12, 4], weights := [1, 0, 1, 1] }

def points124 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 8039, representative 7310.
def source125 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B004.Data.entryAt ⟨48, by decide +kernel⟩

def target125 : Weights.Entry :=
  { word := [10, 8, 8, 8, 9, 4, 4], weights := [1, 0, 1, 1] }

def points125 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 8041, representative 7269.
def source126 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B004.Data.entryAt ⟨7, by decide +kernel⟩

def target126 : Weights.Entry :=
  { word := [10, 8, 8, 8, 9, 12, 4], weights := [1, 0, 1, 1] }

def points126 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 8047, representative 7289.
def source127 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B004.Data.entryAt ⟨27, by decide +kernel⟩

def target127 : Weights.Entry :=
  { word := [10, 8, 8, 12, 0, 4, 2], weights := [1, 0, 0, 1] }

def points127 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

def period9Entries : List Weights.Entry := [target0, target1, target2, target3, target4, target5, target6, target7, target8, target9, target10, target11, target12, target13, target14, target15, target16, target17, target18, target19, target20, target21, target22, target23, target24, target25, target26, target27, target28, target29, target30, target31, target32, target33, target34, target35, target36, target37, target38, target39, target40, target41, target42, target43, target44, target45, target46, target47, target48, target49, target50, target51, target52, target53, target54, target55, target56, target57, target58, target59, target60, target61, target62, target63, target64, target65, target66, target67, target68, target69, target70, target71, target72, target73, target74, target75, target76, target77, target78, target79, target80, target81, target82, target83, target84, target85, target86, target87, target88, target89, target90, target91, target92, target93, target94, target95, target96, target97, target98, target99, target100, target101, target102, target103, target104, target105, target106, target107, target108, target109, target110, target111, target112, target113, target114, target115, target116, target117, target118, target119, target120, target121, target122, target123, target124, target125, target126, target127]

def period9Chunk : RowCoverage.Chunk where
  rows := [⟨3620, target0⟩, ⟨3628, target1⟩, ⟨3652, target2⟩, ⟨3653, target3⟩, ⟨3664, target4⟩, ⟨3678, target5⟩, ⟨3680, target6⟩, ⟨3694, target7⟩, ⟨3696, target8⟩, ⟨3703, target9⟩, ⟨3705, target10⟩, ⟨3708, target11⟩, ⟨3710, target12⟩, ⟨3728, target13⟩, ⟨3729, target14⟩, ⟨3733, target15⟩, ⟨3734, target16⟩, ⟨3754, target17⟩, ⟨3755, target18⟩, ⟨3759, target19⟩, ⟨3760, target20⟩, ⟨3772, target21⟩, ⟨3777, target22⟩, ⟨3778, target23⟩, ⟨3797, target24⟩, ⟨3802, target25⟩, ⟨3803, target26⟩, ⟨3816, target27⟩, ⟨3817, target28⟩, ⟨3825, target29⟩, ⟨3851, target30⟩, ⟨3852, target31⟩, ⟨3859, target32⟩, ⟨3924, target33⟩, ⟨3925, target34⟩, ⟨3933, target35⟩, ⟨3959, target36⟩, ⟨3960, target37⟩, ⟨3967, target38⟩, ⟨3978, target39⟩, ⟨3980, target40⟩, ⟨3983, target41⟩, ⟨3997, target42⟩, ⟨3998, target43⟩, ⟨4005, target44⟩, ⟨4006, target45⟩, ⟨4043, target46⟩, ⟨4045, target47⟩, ⟨4059, target48⟩, ⟨4061, target49⟩, ⟨4068, target50⟩, ⟨4070, target51⟩, ⟨4073, target52⟩, ⟨4075, target53⟩, ⟨7403, target54⟩, ⟨7405, target55⟩, ⟨7407, target56⟩, ⟨7409, target57⟩, ⟨7413, target58⟩, ⟨7414, target59⟩, ⟨7427, target60⟩, ⟨7428, target61⟩, ⟨7458, target62⟩, ⟨7459, target63⟩, ⟨7464, target64⟩, ⟨7469, target65⟩, ⟨7488, target66⟩, ⟨7492, target67⟩, ⟨7494, target68⟩, ⟨7496, target69⟩, ⟨7498, target70⟩, ⟨7504, target71⟩, ⟨7505, target72⟩, ⟨7518, target73⟩, ⟨7524, target74⟩, ⟨7525, target75⟩, ⟨7529, target76⟩, ⟨7530, target77⟩, ⟨7534, target78⟩, ⟨7536, target79⟩, ⟨7544, target80⟩, ⟨7545, target81⟩, ⟨7566, target82⟩, ⟨7567, target83⟩, ⟨7580, target84⟩, ⟨7581, target85⟩, ⟨7586, target86⟩, ⟨7591, target87⟩, ⟨7821, target88⟩, ⟨7826, target89⟩, ⟨7827, target90⟩, ⟨7837, target91⟩, ⟨7838, target92⟩, ⟨7847, target93⟩, ⟨7852, target94⟩, ⟨7853, target95⟩, ⟨7863, target96⟩, ⟨7864, target97⟩, ⟨7873, target98⟩, ⟨7878, target99⟩, ⟨7879, target100⟩, ⟨7888, target101⟩, ⟨7889, target102⟩, ⟨7898, target103⟩, ⟨7903, target104⟩, ⟨7904, target105⟩, ⟨7922, target106⟩, ⟨7923, target107⟩, ⟨7934, target108⟩, ⟨7949, target109⟩, ⟨7950, target110⟩, ⟨7958, target111⟩, ⟨7961, target112⟩, ⟨7985, target113⟩, ⟨7990, target114⟩, ⟨7991, target115⟩, ⟨8003, target116⟩, ⟨8004, target117⟩, ⟨8015, target118⟩, ⟨8020, target119⟩, ⟨8021, target120⟩, ⟨8029, target121⟩, ⟨8030, target122⟩, ⟨8034, target123⟩, ⟨8035, target124⟩, ⟨8039, target125⟩, ⟨8041, target126⟩, ⟨8047, target127⟩]
  indexMask := 24942300165151232066805066787186077168222855940653658035844236573009951076763668914849005788764790547749493099123376743594987567737440386693539421310065822293856224880370163356012145810113526514526775174370086508683289501265321349732974234294959798615467496278473265183718986542020074513579308815689987995125786491738820723230817154330688462682218487635449352658921304993473951589757491536165364845591135468822895298600039149365574545118927648086569162507369889516755802691887611115729547284648043421498038352561495396887728358096855901067249467462593903165213201533017882721972775527304601387977472741271484993713599428556041953283349911484933334698412898168771013987685774746429100243703724835666798324086454270476624402845953436109487847368743486442486777037333482832060416099472854934378348258783155980814506556232859764802999519790162215398134944195070420613304111986634800981662576155198165093768476007182811857952943708366749471881817068616857884211277861701172450434729216889208276039672058621984878778730308693503956319099967190191922147487958155377966353700248576617578250331174439041873829226697764308809565008198547682208570463004216257022930176912877282661722273452715697830164170262327754650130228389368510011617454670267650997310883338184341080397755435671923903405882013504966333271483356626247354918997940014458191704428201624901299729943902782190534291458881861259333750283576630671000534755541761236601289918282529101160663068989120708174982875744785292801415931694723898932460712482484347584893390832759146536760370453562043576182843527306715563309093096562926524994359661996304846169666512685219901585768477031252447287374958878895194922516304729742109610500062304094104784758867505266164302172605586020778454928706182035101819057100830839615675483081816741280707870158680434269005982304819595581225461385572147579360610542909462902062013903699128803159433628403591142966018558522581079551730180843661240487507258576863608043707150146151093399227524173792436066697682691234162235925807007773092768017696886932699716567243333288185524246843296190255583821106434736898417080962935502218144241578362878467061587206966092777084207338110032804197607676760442801158362180096582070933835854900475329379441781670507161053151461375858345704205355486289208900426675881039986931735422944020608161142549755764771290015160257769318053492572526120229995406217694706964362566179541903813637618579983369848131604709376
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

end FranklSmallCyclic.TransportBatches.G057.B001.Data
