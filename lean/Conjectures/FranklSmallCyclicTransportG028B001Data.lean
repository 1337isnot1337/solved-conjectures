module

public import Conjectures.FranklSmallCyclicRowCoverage
public import Conjectures.FranklSmallCyclicCanonicalWords
public import Conjectures.FranklSmallCyclicOrbit8Block002Data

/-! 128 literal targets sharing one source proof block.
Original words and row indices are retained; weights may be transported.
-/
@[expose] public section

namespace FranklSmallCyclic.TransportBatches.G028.B001.Data

-- Period 8, original row 7824, representative 3634.
def source0 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B002.Data.entryAt ⟨68, by decide +kernel⟩

def target0 : Weights.Entry :=
  { word := [10, 8, 0, 4, 2, 0, 10], weights := [1, 0, 1, 0] }

-- Period 8, original row 7829, representative 3618.
def source1 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B002.Data.entryAt ⟨52, by decide +kernel⟩

def target1 : Weights.Entry :=
  { word := [10, 8, 0, 4, 2, 8, 10], weights := [1, 0, 1, 0] }

-- Period 8, original row 7849, representative 3643.
def source2 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B002.Data.entryAt ⟨77, by decide +kernel⟩

def target2 : Weights.Entry :=
  { word := [10, 8, 0, 4, 10, 0, 9], weights := [1, 0, 0, 1] }

def points2 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 7850, representative 3635.
def source3 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B002.Data.entryAt ⟨69, by decide +kernel⟩

def target3 : Weights.Entry :=
  { word := [10, 8, 0, 4, 10, 0, 10], weights := [1, 0, 1, 0] }

-- Period 8, original row 7855, representative 3619.
def source4 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B002.Data.entryAt ⟨53, by decide +kernel⟩

def target4 : Weights.Entry :=
  { word := [10, 8, 0, 4, 10, 8, 10], weights := [1, 0, 1, 0] }

-- Period 8, original row 7875, representative 3649.
def source5 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B002.Data.entryAt ⟨83, by decide +kernel⟩

def target5 : Weights.Entry :=
  { word := [10, 8, 0, 12, 2, 0, 9], weights := [1, 0, 0, 1] }

def points5 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 7876, representative 3641.
def source6 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B002.Data.entryAt ⟨75, by decide +kernel⟩

def target6 : Weights.Entry :=
  { word := [10, 8, 0, 12, 2, 0, 10], weights := [1, 0, 1, 0] }

-- Period 8, original row 7881, representative 3625.
def source7 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B002.Data.entryAt ⟨59, by decide +kernel⟩

def target7 : Weights.Entry :=
  { word := [10, 8, 0, 12, 2, 8, 10], weights := [1, 0, 1, 0] }

-- Period 8, original row 7900, representative 3646.
def source8 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B002.Data.entryAt ⟨80, by decide +kernel⟩

def target8 : Weights.Entry :=
  { word := [10, 8, 0, 12, 10, 0, 9], weights := [1, 0, 0, 1] }

def points8 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 7901, representative 3638.
def source9 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B002.Data.entryAt ⟨72, by decide +kernel⟩

def target9 : Weights.Entry :=
  { word := [10, 8, 0, 12, 10, 0, 10], weights := [1, 0, 1, 0] }

-- Period 8, original row 7906, representative 3622.
def source10 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B002.Data.entryAt ⟨56, by decide +kernel⟩

def target10 : Weights.Entry :=
  { word := [10, 8, 0, 12, 10, 8, 10], weights := [1, 0, 1, 0] }

-- Period 8, original row 7912, representative 3606.
def source11 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B002.Data.entryAt ⟨40, by decide +kernel⟩

def target11 : Weights.Entry :=
  { word := [10, 8, 2, 0, 1, 8, 9], weights := [0, 0, 1, 0] }

def points11 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 7915, representative 3607.
def source12 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B002.Data.entryAt ⟨41, by decide +kernel⟩

def target12 : Weights.Entry :=
  { word := [10, 8, 2, 0, 9, 8, 9], weights := [0, 0, 1, 0] }

def points12 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 7925, representative 3610.
def source13 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B002.Data.entryAt ⟨44, by decide +kernel⟩

def target13 : Weights.Entry :=
  { word := [10, 8, 4, 2, 0, 8, 9], weights := [1, 0, 0, 1] }

def points13 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 7926, representative 3626.
def source14 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B002.Data.entryAt ⟨60, by decide +kernel⟩

def target14 : Weights.Entry :=
  { word := [10, 8, 4, 2, 0, 8, 10], weights := [1, 0, 0, 1] }

-- Period 8, original row 7952, representative 3613.
def source15 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B002.Data.entryAt ⟨47, by decide +kernel⟩

def target15 : Weights.Entry :=
  { word := [10, 8, 4, 10, 0, 8, 9], weights := [0, 1, 0, 1] }

def points15 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 7953, representative 3629.
def source16 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B002.Data.entryAt ⟨63, by decide +kernel⟩

def target16 : Weights.Entry :=
  { word := [10, 8, 4, 10, 0, 8, 10], weights := [1, 0, 0, 1] }

-- Period 8, original row 7987, representative 3647.
def source17 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B002.Data.entryAt ⟨81, by decide +kernel⟩

def target17 : Weights.Entry :=
  { word := [10, 8, 8, 4, 2, 0, 9], weights := [1, 0, 0, 1] }

def points17 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 7988, representative 3639.
def source18 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B002.Data.entryAt ⟨73, by decide +kernel⟩

def target18 : Weights.Entry :=
  { word := [10, 8, 8, 4, 2, 0, 10], weights := [1, 0, 1, 0] }

-- Period 8, original row 7993, representative 3623.
def source19 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B002.Data.entryAt ⟨57, by decide +kernel⟩

def target19 : Weights.Entry :=
  { word := [10, 8, 8, 4, 2, 8, 10], weights := [1, 0, 1, 0] }

-- Period 8, original row 8017, representative 3644.
def source20 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B002.Data.entryAt ⟨78, by decide +kernel⟩

def target20 : Weights.Entry :=
  { word := [10, 8, 8, 4, 10, 0, 9], weights := [1, 0, 0, 1] }

def points20 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 8018, representative 3636.
def source21 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B002.Data.entryAt ⟨70, by decide +kernel⟩

def target21 : Weights.Entry :=
  { word := [10, 8, 8, 4, 10, 0, 10], weights := [1, 0, 1, 0] }

-- Period 8, original row 8023, representative 3620.
def source22 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B002.Data.entryAt ⟨54, by decide +kernel⟩

def target22 : Weights.Entry :=
  { word := [10, 8, 8, 4, 10, 8, 10], weights := [1, 0, 1, 0] }

-- Period 8, original row 8061, representative 3648.
def source23 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B002.Data.entryAt ⟨82, by decide +kernel⟩

def target23 : Weights.Entry :=
  { word := [10, 8, 8, 12, 2, 0, 9], weights := [1, 0, 0, 1] }

def points23 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 8062, representative 3640.
def source24 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B002.Data.entryAt ⟨74, by decide +kernel⟩

def target24 : Weights.Entry :=
  { word := [10, 8, 8, 12, 2, 0, 10], weights := [1, 0, 1, 0] }

-- Period 8, original row 8067, representative 3624.
def source25 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B002.Data.entryAt ⟨58, by decide +kernel⟩

def target25 : Weights.Entry :=
  { word := [10, 8, 8, 12, 2, 8, 10], weights := [1, 0, 1, 0] }

-- Period 8, original row 8090, representative 3645.
def source26 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B002.Data.entryAt ⟨79, by decide +kernel⟩

def target26 : Weights.Entry :=
  { word := [10, 8, 8, 12, 10, 0, 9], weights := [1, 0, 0, 1] }

def points26 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 8091, representative 3637.
def source27 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B002.Data.entryAt ⟨71, by decide +kernel⟩

def target27 : Weights.Entry :=
  { word := [10, 8, 8, 12, 10, 0, 10], weights := [1, 0, 1, 0] }

-- Period 8, original row 8096, representative 3621.
def source28 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B002.Data.entryAt ⟨55, by decide +kernel⟩

def target28 : Weights.Entry :=
  { word := [10, 8, 8, 12, 10, 8, 10], weights := [1, 0, 1, 0] }

-- Period 8, original row 8120, representative 3609.
def source29 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B002.Data.entryAt ⟨43, by decide +kernel⟩

def target29 : Weights.Entry :=
  { word := [10, 8, 10, 0, 1, 8, 9], weights := [0, 0, 1, 0] }

def points29 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 8123, representative 3608.
def source30 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B002.Data.entryAt ⟨42, by decide +kernel⟩

def target30 : Weights.Entry :=
  { word := [10, 8, 10, 0, 9, 8, 9], weights := [0, 0, 1, 0] }

def points30 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 8133, representative 3611.
def source31 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B002.Data.entryAt ⟨45, by decide +kernel⟩

def target31 : Weights.Entry :=
  { word := [10, 8, 12, 2, 0, 8, 9], weights := [1, 0, 0, 1] }

def points31 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 8134, representative 3627.
def source32 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B002.Data.entryAt ⟨61, by decide +kernel⟩

def target32 : Weights.Entry :=
  { word := [10, 8, 12, 2, 0, 8, 10], weights := [1, 0, 0, 1] }

-- Period 8, original row 8160, representative 3612.
def source33 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B002.Data.entryAt ⟨46, by decide +kernel⟩

def target33 : Weights.Entry :=
  { word := [10, 8, 12, 10, 0, 8, 9], weights := [0, 1, 0, 1] }

def points33 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 8161, representative 3628.
def source34 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B002.Data.entryAt ⟨62, by decide +kernel⟩

def target34 : Weights.Entry :=
  { word := [10, 8, 12, 10, 0, 8, 10], weights := [1, 0, 0, 1] }

-- Period 8, original row 8184, representative 3574.
def source35 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B002.Data.entryAt ⟨9, by decide +kernel⟩

def target35 : Weights.Entry :=
  { word := [10, 10, 0, 2, 0, 8, 9], weights := [2, 1, 0, 1] }

def points35 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 8186, representative 3691.
def source36 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B002.Data.entryAt ⟨125, by decide +kernel⟩

def target36 : Weights.Entry :=
  { word := [10, 10, 0, 9, 0, 4, 8], weights := [1, 1, 2, 0] }

def points36 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 8189, representative 3690.
def source37 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B002.Data.entryAt ⟨124, by decide +kernel⟩

def target37 : Weights.Entry :=
  { word := [10, 10, 0, 9, 0, 12, 8], weights := [1, 1, 2, 0] }

def points37 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 8192, representative 3678.
def source38 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B002.Data.entryAt ⟨112, by decide +kernel⟩

def target38 : Weights.Entry :=
  { word := [10, 10, 0, 9, 8, 2, 2], weights := [1, 1, 0, 1] }

def points38 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 8199, representative 3677.
def source39 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B002.Data.entryAt ⟨111, by decide +kernel⟩

def target39 : Weights.Entry :=
  { word := [10, 10, 0, 9, 8, 10, 2], weights := [1, 1, 0, 1] }

def points39 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 8202, representative 3662.
def source40 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B002.Data.entryAt ⟨96, by decide +kernel⟩

def target40 : Weights.Entry :=
  { word := [10, 10, 0, 10, 0, 0, 2], weights := [0, 1, 0, 1] }

def points40 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 8205, representative 3578.
def source41 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B002.Data.entryAt ⟨13, by decide +kernel⟩

def target41 : Weights.Entry :=
  { word := [10, 10, 0, 10, 0, 0, 9], weights := [0, 1, 0, 1] }

def points41 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 8212, representative 3577.
def source42 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B002.Data.entryAt ⟨12, by decide +kernel⟩

def target42 : Weights.Entry :=
  { word := [10, 10, 0, 10, 0, 8, 9], weights := [0, 1, 0, 1] }

def points42 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 8219, representative 3674.
def source43 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B002.Data.entryAt ⟨108, by decide +kernel⟩

def target43 : Weights.Entry :=
  { word := [10, 10, 0, 12, 2, 0, 2], weights := [1, 1, 0, 1] }

def points43 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 8222, representative 3590.
def source44 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B002.Data.entryAt ⟨24, by decide +kernel⟩

def target44 : Weights.Entry :=
  { word := [10, 10, 0, 12, 2, 0, 9], weights := [1, 1, 0, 1] }

def points44 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 8227, representative 3673.
def source45 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B002.Data.entryAt ⟨107, by decide +kernel⟩

def target45 : Weights.Entry :=
  { word := [10, 10, 0, 12, 10, 0, 2], weights := [1, 1, 0, 1] }

def points45 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 8230, representative 3588.
def source46 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B002.Data.entryAt ⟨22, by decide +kernel⟩

def target46 : Weights.Entry :=
  { word := [10, 10, 0, 12, 10, 0, 9], weights := [1, 1, 0, 1] }

def points46 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 8235, representative 3668.
def source47 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B002.Data.entryAt ⟨102, by decide +kernel⟩

def target47 : Weights.Entry :=
  { word := [10, 10, 2, 8, 1, 0, 2], weights := [1, 1, 0, 1] }

def points47 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 8238, representative 3586.
def source48 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B002.Data.entryAt ⟨20, by decide +kernel⟩

def target48 : Weights.Entry :=
  { word := [10, 10, 2, 8, 1, 0, 9], weights := [1, 1, 0, 1] }

def points48 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 8243, representative 3582.
def source49 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B002.Data.entryAt ⟨16, by decide +kernel⟩

def target49 : Weights.Entry :=
  { word := [10, 10, 2, 8, 1, 8, 9], weights := [1, 1, 1, 1] }

def points49 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 8245, representative 3684.
def source50 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B002.Data.entryAt ⟨118, by decide +kernel⟩

def target50 : Weights.Entry :=
  { word := [10, 10, 2, 8, 8, 4, 0], weights := [1, 0, 1, 0] }

def points50 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 8247, representative 3683.
def source51 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B002.Data.entryAt ⟨117, by decide +kernel⟩

def target51 : Weights.Entry :=
  { word := [10, 10, 2, 8, 8, 12, 0], weights := [1, 0, 1, 0] }

def points51 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 8249, representative 3667.
def source52 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B002.Data.entryAt ⟨101, by decide +kernel⟩

def target52 : Weights.Entry :=
  { word := [10, 10, 2, 8, 9, 0, 2], weights := [1, 1, 0, 1] }

def points52 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 8252, representative 3584.
def source53 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B002.Data.entryAt ⟨18, by decide +kernel⟩

def target53 : Weights.Entry :=
  { word := [10, 10, 2, 8, 9, 0, 9], weights := [1, 1, 0, 1] }

def points53 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 8257, representative 3580.
def source54 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B002.Data.entryAt ⟨14, by decide +kernel⟩

def target54 : Weights.Entry :=
  { word := [10, 10, 2, 8, 9, 8, 9], weights := [1, 1, 1, 1] }

def points54 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 8260, representative 3687.
def source55 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B002.Data.entryAt ⟨121, by decide +kernel⟩

def target55 : Weights.Entry :=
  { word := [10, 10, 8, 1, 0, 12, 0], weights := [2, 1, 1, 0] }

def points55 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 8266, representative 3692.
def source56 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B002.Data.entryAt ⟨126, by decide +kernel⟩

def target56 : Weights.Entry :=
  { word := [10, 10, 8, 2, 0, 8, 1], weights := [1, 0, 0, 1] }

def points56 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 8267, representative 3660.
def source57 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B002.Data.entryAt ⟨94, by decide +kernel⟩

def target57 : Weights.Entry :=
  { word := [10, 10, 8, 2, 0, 8, 2], weights := [1, 0, 0, 1] }

def points57 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 8270, representative 3575.
def source58 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B002.Data.entryAt ⟨10, by decide +kernel⟩

def target58 : Weights.Entry :=
  { word := [10, 10, 8, 2, 0, 8, 9], weights := [1, 0, 0, 1] }

def points58 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 8294, representative 3689.
def source59 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B002.Data.entryAt ⟨123, by decide +kernel⟩

def target59 : Weights.Entry :=
  { word := [10, 10, 8, 9, 0, 4, 0], weights := [0, 1, 1, 0] }

def points59 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 8295, representative 3686.
def source60 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B002.Data.entryAt ⟨120, by decide +kernel⟩

def target60 : Weights.Entry :=
  { word := [10, 10, 8, 9, 0, 4, 8], weights := [1, 1, 2, 0] }

def points60 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 8297, representative 3688.
def source61 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B002.Data.entryAt ⟨122, by decide +kernel⟩

def target61 : Weights.Entry :=
  { word := [10, 10, 8, 9, 0, 12, 0], weights := [0, 1, 1, 0] }

def points61 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 8298, representative 3685.
def source62 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B002.Data.entryAt ⟨119, by decide +kernel⟩

def target62 : Weights.Entry :=
  { word := [10, 10, 8, 9, 0, 12, 8], weights := [1, 1, 2, 0] }

def points62 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 8301, representative 3676.
def source63 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B002.Data.entryAt ⟨110, by decide +kernel⟩

def target63 : Weights.Entry :=
  { word := [10, 10, 8, 9, 8, 2, 2], weights := [1, 1, 0, 1] }

def points63 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 8308, representative 3675.
def source64 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B002.Data.entryAt ⟨109, by decide +kernel⟩

def target64 : Weights.Entry :=
  { word := [10, 10, 8, 9, 8, 10, 2], weights := [1, 1, 0, 1] }

def points64 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 8316, representative 3693.
def source65 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B002.Data.entryAt ⟨127, by decide +kernel⟩

def target65 : Weights.Entry :=
  { word := [10, 10, 8, 10, 0, 8, 1], weights := [0, 1, 0, 1] }

def points65 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 8317, representative 3661.
def source66 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B002.Data.entryAt ⟨95, by decide +kernel⟩

def target66 : Weights.Entry :=
  { word := [10, 10, 8, 10, 0, 8, 2], weights := [0, 1, 0, 1] }

def points66 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 8320, representative 3576.
def source67 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B002.Data.entryAt ⟨11, by decide +kernel⟩

def target67 : Weights.Entry :=
  { word := [10, 10, 8, 10, 0, 8, 9], weights := [0, 1, 0, 1] }

def points67 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 8341, representative 3672.
def source68 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B002.Data.entryAt ⟨106, by decide +kernel⟩

def target68 : Weights.Entry :=
  { word := [10, 10, 8, 12, 2, 0, 2], weights := [1, 1, 0, 1] }

def points68 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 8344, representative 3589.
def source69 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B002.Data.entryAt ⟨23, by decide +kernel⟩

def target69 : Weights.Entry :=
  { word := [10, 10, 8, 12, 2, 0, 9], weights := [1, 1, 0, 1] }

def points69 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 8347, representative 3670.
def source70 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B002.Data.entryAt ⟨104, by decide +kernel⟩

def target70 : Weights.Entry :=
  { word := [10, 10, 8, 12, 2, 8, 2], weights := [1, 1, 1, 1] }

def points70 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 8356, representative 3664.
def source71 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B002.Data.entryAt ⟨98, by decide +kernel⟩

def target71 : Weights.Entry :=
  { word := [10, 10, 8, 12, 8, 4, 2], weights := [2, 1, 2, 1] }

def points71 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 8359, representative 3663.
def source72 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B002.Data.entryAt ⟨97, by decide +kernel⟩

def target72 : Weights.Entry :=
  { word := [10, 10, 8, 12, 8, 12, 2], weights := [2, 1, 2, 1] }

def points72 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 8363, representative 3671.
def source73 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B002.Data.entryAt ⟨105, by decide +kernel⟩

def target73 : Weights.Entry :=
  { word := [10, 10, 8, 12, 10, 0, 2], weights := [1, 1, 0, 1] }

def points73 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 8366, representative 3587.
def source74 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B002.Data.entryAt ⟨21, by decide +kernel⟩

def target74 : Weights.Entry :=
  { word := [10, 10, 8, 12, 10, 0, 9], weights := [1, 1, 0, 1] }

def points74 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 8369, representative 3669.
def source75 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B002.Data.entryAt ⟨103, by decide +kernel⟩

def target75 : Weights.Entry :=
  { word := [10, 10, 8, 12, 10, 8, 2], weights := [1, 1, 1, 1] }

def points75 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 8379, representative 3666.
def source76 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B002.Data.entryAt ⟨100, by decide +kernel⟩

def target76 : Weights.Entry :=
  { word := [10, 10, 10, 8, 1, 0, 2], weights := [1, 1, 0, 1] }

def points76 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 8382, representative 3585.
def source77 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B002.Data.entryAt ⟨19, by decide +kernel⟩

def target77 : Weights.Entry :=
  { word := [10, 10, 10, 8, 1, 0, 9], weights := [1, 1, 0, 1] }

def points77 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 8387, representative 3581.
def source78 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B002.Data.entryAt ⟨15, by decide +kernel⟩

def target78 : Weights.Entry :=
  { word := [10, 10, 10, 8, 1, 8, 9], weights := [1, 1, 1, 1] }

def points78 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 8389, representative 3682.
def source79 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B002.Data.entryAt ⟨116, by decide +kernel⟩

def target79 : Weights.Entry :=
  { word := [10, 10, 10, 8, 8, 4, 0], weights := [1, 0, 1, 0] }

def points79 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 8391, representative 3681.
def source80 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B002.Data.entryAt ⟨115, by decide +kernel⟩

def target80 : Weights.Entry :=
  { word := [10, 10, 10, 8, 8, 12, 0], weights := [1, 0, 1, 0] }

def points80 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 8393, representative 3665.
def source81 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B002.Data.entryAt ⟨99, by decide +kernel⟩

def target81 : Weights.Entry :=
  { word := [10, 10, 10, 8, 9, 0, 2], weights := [1, 1, 0, 1] }

def points81 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 8396, representative 3583.
def source82 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B002.Data.entryAt ⟨17, by decide +kernel⟩

def target82 : Weights.Entry :=
  { word := [10, 10, 10, 8, 9, 0, 9], weights := [1, 1, 0, 1] }

def points82 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 8410, representative 3570.
def source83 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B002.Data.entryAt ⟨5, by decide +kernel⟩

def target83 : Weights.Entry :=
  { word := [12, 0, 0, 9, 4, 4, 12], weights := [1, 0, 1, 1] }

def points83 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 8414, representative 3569.
def source84 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B002.Data.entryAt ⟨4, by decide +kernel⟩

def target84 : Weights.Entry :=
  { word := [12, 0, 0, 9, 12, 4, 12], weights := [1, 0, 1, 1] }

def points84 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 8438, representative 3634.
def source85 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B002.Data.entryAt ⟨68, by decide +kernel⟩

def target85 : Weights.Entry :=
  { word := [12, 0, 4, 2, 0, 8, 12], weights := [0, 1, 0, 1] }

def points85 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 8446, representative 3639.
def source86 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B002.Data.entryAt ⟨73, by decide +kernel⟩

def target86 : Weights.Entry :=
  { word := [12, 0, 4, 2, 8, 8, 12], weights := [0, 1, 0, 1] }

def points86 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 8466, representative 3641.
def source87 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B002.Data.entryAt ⟨75, by decide +kernel⟩

def target87 : Weights.Entry :=
  { word := [12, 0, 4, 10, 0, 8, 12], weights := [0, 1, 0, 1] }

def points87 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 8476, representative 3573.
def source88 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B002.Data.entryAt ⟨8, by decide +kernel⟩

def target88 : Weights.Entry :=
  { word := [12, 0, 4, 10, 8, 4, 12], weights := [0, 1, 1, 1] }

def points88 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 8478, representative 3640.
def source89 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B002.Data.entryAt ⟨74, by decide +kernel⟩

def target89 : Weights.Entry :=
  { word := [12, 0, 4, 10, 8, 8, 12], weights := [0, 1, 0, 1] }

def points89 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 8501, representative 3568.
def source90 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B002.Data.entryAt ⟨3, by decide +kernel⟩

def target90 : Weights.Entry :=
  { word := [12, 0, 8, 9, 4, 4, 12], weights := [1, 0, 1, 1] }

def points90 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 8505, representative 3567.
def source91 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B002.Data.entryAt ⟨2, by decide +kernel⟩

def target91 : Weights.Entry :=
  { word := [12, 0, 8, 9, 12, 4, 12], weights := [1, 0, 1, 1] }

def points91 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 8527, representative 3635.
def source92 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B002.Data.entryAt ⟨69, by decide +kernel⟩

def target92 : Weights.Entry :=
  { word := [12, 0, 12, 2, 0, 8, 12], weights := [0, 1, 0, 1] }

def points92 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 8535, representative 3636.
def source93 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B002.Data.entryAt ⟨70, by decide +kernel⟩

def target93 : Weights.Entry :=
  { word := [12, 0, 12, 2, 8, 8, 12], weights := [0, 1, 0, 1] }

def points93 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 8552, representative 3572.
def source94 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B002.Data.entryAt ⟨7, by decide +kernel⟩

def target94 : Weights.Entry :=
  { word := [12, 0, 12, 10, 0, 4, 12], weights := [1, 0, 1, 1] }

def points94 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 8559, representative 3638.
def source95 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B002.Data.entryAt ⟨72, by decide +kernel⟩

def target95 : Weights.Entry :=
  { word := [12, 0, 12, 10, 0, 8, 12], weights := [0, 1, 0, 1] }

def points95 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 8569, representative 3571.
def source96 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B002.Data.entryAt ⟨6, by decide +kernel⟩

def target96 : Weights.Entry :=
  { word := [12, 0, 12, 10, 8, 4, 12], weights := [0, 1, 1, 1] }

def points96 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 8571, representative 3637.
def source97 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B002.Data.entryAt ⟨71, by decide +kernel⟩

def target97 : Weights.Entry :=
  { word := [12, 0, 12, 10, 8, 8, 12], weights := [0, 1, 0, 1] }

def points97 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 8741, representative 3630.
def source98 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B002.Data.entryAt ⟨64, by decide +kernel⟩

def target98 : Weights.Entry :=
  { word := [12, 8, 0, 4, 2, 0, 12], weights := [1, 0, 0, 1] }

def points98 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 8746, representative 3626.
def source99 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B002.Data.entryAt ⟨60, by decide +kernel⟩

def target99 : Weights.Entry :=
  { word := [12, 8, 0, 4, 2, 8, 12], weights := [1, 0, 0, 1] }

def points99 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 8767, representative 3631.
def source100 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B002.Data.entryAt ⟨65, by decide +kernel⟩

def target100 : Weights.Entry :=
  { word := [12, 8, 0, 4, 10, 0, 12], weights := [1, 0, 0, 1] }

def points100 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 8772, representative 3627.
def source101 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B002.Data.entryAt ⟨61, by decide +kernel⟩

def target101 : Weights.Entry :=
  { word := [12, 8, 0, 4, 10, 8, 12], weights := [1, 0, 0, 1] }

def points101 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 8785, representative 3633.
def source102 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B002.Data.entryAt ⟨67, by decide +kernel⟩

def target102 : Weights.Entry :=
  { word := [12, 8, 0, 12, 2, 0, 12], weights := [1, 0, 0, 1] }

def points102 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 8790, representative 3629.
def source103 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B002.Data.entryAt ⟨63, by decide +kernel⟩

def target103 : Weights.Entry :=
  { word := [12, 8, 0, 12, 2, 8, 12], weights := [1, 0, 0, 1] }

def points103 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 8810, representative 3632.
def source104 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B002.Data.entryAt ⟨66, by decide +kernel⟩

def target104 : Weights.Entry :=
  { word := [12, 8, 0, 12, 10, 0, 12], weights := [1, 0, 0, 1] }

def points104 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 8815, representative 3628.
def source105 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B002.Data.entryAt ⟨62, by decide +kernel⟩

def target105 : Weights.Entry :=
  { word := [12, 8, 0, 12, 10, 8, 12], weights := [1, 0, 0, 1] }

def points105 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 8829, representative 3618.
def source106 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B002.Data.entryAt ⟨52, by decide +kernel⟩

def target106 : Weights.Entry :=
  { word := [12, 8, 4, 2, 0, 8, 12], weights := [0, 1, 0, 1] }

def points106 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 8837, representative 3623.
def source107 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B002.Data.entryAt ⟨57, by decide +kernel⟩

def target107 : Weights.Entry :=
  { word := [12, 8, 4, 2, 8, 8, 12], weights := [0, 1, 0, 1] }

def points107 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 8864, representative 3625.
def source108 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B002.Data.entryAt ⟨59, by decide +kernel⟩

def target108 : Weights.Entry :=
  { word := [12, 8, 4, 10, 0, 8, 12], weights := [0, 1, 0, 1] }

def points108 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 8869, representative 3566.
def source109 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B002.Data.entryAt ⟨1, by decide +kernel⟩

def target109 : Weights.Entry :=
  { word := [12, 8, 4, 10, 8, 4, 12], weights := [1, 1, 1, 1] }

def points109 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 8871, representative 3624.
def source110 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B002.Data.entryAt ⟨58, by decide +kernel⟩

def target110 : Weights.Entry :=
  { word := [12, 8, 4, 10, 8, 8, 12], weights := [0, 1, 0, 1] }

def points110 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 8937, representative 3619.
def source111 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B002.Data.entryAt ⟨53, by decide +kernel⟩

def target111 : Weights.Entry :=
  { word := [12, 8, 12, 2, 0, 8, 12], weights := [0, 1, 0, 1] }

def points111 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 8945, representative 3620.
def source112 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B002.Data.entryAt ⟨54, by decide +kernel⟩

def target112 : Weights.Entry :=
  { word := [12, 8, 12, 2, 8, 8, 12], weights := [0, 1, 0, 1] }

def points112 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 8972, representative 3622.
def source113 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B002.Data.entryAt ⟨56, by decide +kernel⟩

def target113 : Weights.Entry :=
  { word := [12, 8, 12, 10, 0, 8, 12], weights := [0, 1, 0, 1] }

def points113 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 8977, representative 3565.
def source114 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B002.Data.entryAt ⟨0, by decide +kernel⟩

def target114 : Weights.Entry :=
  { word := [12, 8, 12, 10, 8, 4, 12], weights := [1, 1, 1, 1] }

def points114 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 8979, representative 3621.
def source115 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B002.Data.entryAt ⟨55, by decide +kernel⟩

def target115 : Weights.Entry :=
  { word := [12, 8, 12, 10, 8, 8, 12], weights := [0, 1, 0, 1] }

def points115 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 8989, representative 3658.
def source116 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B002.Data.entryAt ⟨92, by decide +kernel⟩

def target116 : Weights.Entry :=
  { word := [12, 10, 0, 9, 8, 1, 4], weights := [1, 1, 0, 1] }

def points116 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 8993, representative 3659.
def source117 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B002.Data.entryAt ⟨93, by decide +kernel⟩

def target117 : Weights.Entry :=
  { word := [12, 10, 0, 9, 8, 8, 4], weights := [1, 1, 0, 1] }

def points117 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 8996, representative 3657.
def source118 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B002.Data.entryAt ⟨91, by decide +kernel⟩

def target118 : Weights.Entry :=
  { word := [12, 10, 0, 9, 8, 9, 4], weights := [1, 1, 0, 1] }

def points118 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 9000, representative 3654.
def source119 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B002.Data.entryAt ⟨88, by decide +kernel⟩

def target119 : Weights.Entry :=
  { word := [12, 10, 0, 10, 8, 0, 4], weights := [0, 1, 0, 1] }

def points119 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 9002, representative 3653.
def source120 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B002.Data.entryAt ⟨87, by decide +kernel⟩

def target120 : Weights.Entry :=
  { word := [12, 10, 0, 10, 8, 8, 4], weights := [0, 1, 0, 1] }

def points120 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 9006, representative 3656.
def source121 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B002.Data.entryAt ⟨90, by decide +kernel⟩

def target121 : Weights.Entry :=
  { word := [12, 10, 0, 12, 2, 0, 4], weights := [1, 1, 0, 1] }

def points121 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 9008, representative 3680.
def source122 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B002.Data.entryAt ⟨114, by decide +kernel⟩

def target122 : Weights.Entry :=
  { word := [12, 10, 0, 12, 2, 0, 9], weights := [1, 1, 0, 1] }

def points122 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 9014, representative 3655.
def source123 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B002.Data.entryAt ⟨89, by decide +kernel⟩

def target123 : Weights.Entry :=
  { word := [12, 10, 0, 12, 10, 0, 4], weights := [1, 1, 0, 1] }

def points123 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 9016, representative 3679.
def source124 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B002.Data.entryAt ⟨113, by decide +kernel⟩

def target124 : Weights.Entry :=
  { word := [12, 10, 0, 12, 10, 0, 9], weights := [1, 1, 0, 1] }

def points124 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 9022, representative 3651.
def source125 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B002.Data.entryAt ⟨85, by decide +kernel⟩

def target125 : Weights.Entry :=
  { word := [12, 10, 8, 2, 8, 8, 4], weights := [0, 1, 0, 1] }

def points125 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 9040, representative 3652.
def source126 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B002.Data.entryAt ⟨86, by decide +kernel⟩

def target126 : Weights.Entry :=
  { word := [12, 10, 8, 10, 8, 8, 4], weights := [0, 1, 0, 1] }

def points126 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 9044, representative 3650.
def source127 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B002.Data.entryAt ⟨84, by decide +kernel⟩

def target127 : Weights.Entry :=
  { word := [12, 10, 8, 10, 8, 12, 4], weights := [1, 2, 1, 2] }

def points127 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

def period8Entries : List Weights.Entry := [target0, target1, target2, target3, target4, target5, target6, target7, target8, target9, target10, target11, target12, target13, target14, target15, target16, target17, target18, target19, target20, target21, target22, target23, target24, target25, target26, target27, target28, target29, target30, target31, target32, target33, target34, target35, target36, target37, target38, target39, target40, target41, target42, target43, target44, target45, target46, target47, target48, target49, target50, target51, target52, target53, target54, target55, target56, target57, target58, target59, target60, target61, target62, target63, target64, target65, target66, target67, target68, target69, target70, target71, target72, target73, target74, target75, target76, target77, target78, target79, target80, target81, target82, target83, target84, target85, target86, target87, target88, target89, target90, target91, target92, target93, target94, target95, target96, target97, target98, target99, target100, target101, target102, target103, target104, target105, target106, target107, target108, target109, target110, target111, target112, target113, target114, target115, target116, target117, target118, target119, target120, target121, target122, target123, target124, target125, target126, target127]

def period8Chunk : RowCoverage.Chunk where
  rows := [⟨7824, target0⟩, ⟨7829, target1⟩, ⟨7849, target2⟩, ⟨7850, target3⟩, ⟨7855, target4⟩, ⟨7875, target5⟩, ⟨7876, target6⟩, ⟨7881, target7⟩, ⟨7900, target8⟩, ⟨7901, target9⟩, ⟨7906, target10⟩, ⟨7912, target11⟩, ⟨7915, target12⟩, ⟨7925, target13⟩, ⟨7926, target14⟩, ⟨7952, target15⟩, ⟨7953, target16⟩, ⟨7987, target17⟩, ⟨7988, target18⟩, ⟨7993, target19⟩, ⟨8017, target20⟩, ⟨8018, target21⟩, ⟨8023, target22⟩, ⟨8061, target23⟩, ⟨8062, target24⟩, ⟨8067, target25⟩, ⟨8090, target26⟩, ⟨8091, target27⟩, ⟨8096, target28⟩, ⟨8120, target29⟩, ⟨8123, target30⟩, ⟨8133, target31⟩, ⟨8134, target32⟩, ⟨8160, target33⟩, ⟨8161, target34⟩, ⟨8184, target35⟩, ⟨8186, target36⟩, ⟨8189, target37⟩, ⟨8192, target38⟩, ⟨8199, target39⟩, ⟨8202, target40⟩, ⟨8205, target41⟩, ⟨8212, target42⟩, ⟨8219, target43⟩, ⟨8222, target44⟩, ⟨8227, target45⟩, ⟨8230, target46⟩, ⟨8235, target47⟩, ⟨8238, target48⟩, ⟨8243, target49⟩, ⟨8245, target50⟩, ⟨8247, target51⟩, ⟨8249, target52⟩, ⟨8252, target53⟩, ⟨8257, target54⟩, ⟨8260, target55⟩, ⟨8266, target56⟩, ⟨8267, target57⟩, ⟨8270, target58⟩, ⟨8294, target59⟩, ⟨8295, target60⟩, ⟨8297, target61⟩, ⟨8298, target62⟩, ⟨8301, target63⟩, ⟨8308, target64⟩, ⟨8316, target65⟩, ⟨8317, target66⟩, ⟨8320, target67⟩, ⟨8341, target68⟩, ⟨8344, target69⟩, ⟨8347, target70⟩, ⟨8356, target71⟩, ⟨8359, target72⟩, ⟨8363, target73⟩, ⟨8366, target74⟩, ⟨8369, target75⟩, ⟨8379, target76⟩, ⟨8382, target77⟩, ⟨8387, target78⟩, ⟨8389, target79⟩, ⟨8391, target80⟩, ⟨8393, target81⟩, ⟨8396, target82⟩, ⟨8410, target83⟩, ⟨8414, target84⟩, ⟨8438, target85⟩, ⟨8446, target86⟩, ⟨8466, target87⟩, ⟨8476, target88⟩, ⟨8478, target89⟩, ⟨8501, target90⟩, ⟨8505, target91⟩, ⟨8527, target92⟩, ⟨8535, target93⟩, ⟨8552, target94⟩, ⟨8559, target95⟩, ⟨8569, target96⟩, ⟨8571, target97⟩, ⟨8741, target98⟩, ⟨8746, target99⟩, ⟨8767, target100⟩, ⟨8772, target101⟩, ⟨8785, target102⟩, ⟨8790, target103⟩, ⟨8810, target104⟩, ⟨8815, target105⟩, ⟨8829, target106⟩, ⟨8837, target107⟩, ⟨8864, target108⟩, ⟨8869, target109⟩, ⟨8871, target110⟩, ⟨8937, target111⟩, ⟨8945, target112⟩, ⟨8972, target113⟩, ⟨8977, target114⟩, ⟨8979, target115⟩, ⟨8989, target116⟩, ⟨8993, target117⟩, ⟨8996, target118⟩, ⟨9000, target119⟩, ⟨9002, target120⟩, ⟨9006, target121⟩, ⟨9008, target122⟩, ⟨9014, target123⟩, ⟨9016, target124⟩, ⟨9022, target125⟩, ⟨9040, target126⟩, ⟨9044, target127⟩]
  indexMask := 34802450395229486954295148043037705580769877031527457728272065257569780728755196687464492451974724636670719067560206213024374564302657762357676949270080376008927475294541104236973249382364879596455405699290976165684061683675399261045491089243028085143645532386222039145354480999692822125728503520064400419613229007722111006723150691442072367456845258741372606578361469761779974223146458356547308800639237477926917283977356126948347606779672545424380528524993582907100044814557854100385813897510498106132059814005240121547719680785665386309531333566503884206768650667325079563242743686600544501571402823524562897391467660117223338263799712315835925384609888921880214596249701765293751518737442331145722065194197074943576605144541516065466818529327893512457417060467186002228044641110926933993128963767482692151260569488050323378302837081397550029776464320409882201393196302751469780031887405073331194581080105393575802121390753051852893389415921724862952277535219883971932004873004027840812846907170518648002714226067566353789444309792040143135021850621271834046294096747885226154479000274374704616926115375547344022221024225782473848450925271082995651666946314383637694013917363355678404061079863748580014988992841223089386372332891364748109950898373256306650603563248103869473401702186028519824456167034919638673203105567963079966641135460034489368326618408753047936029168085506323689937237122456931515403355353222337300884585816965816443667761465707575058240969558063285971209668107667975317266735138267693052277886721832410254875403430016602779378170939140678036544989188243940946888229951775279460821047847044519927145517916527364073577117298825689480065940017411254778794187692241786028967784798318689211722780840290588891713084076393104700059173147680641289613250377053588384414291661177945052392728383143326757600697789822064324332765702361605177120231819951918837916117180204799615105349681834735856741275649273177405614881100160816785705132198654275375268649329170849910691819088368895591534905927744372106495700644926109802507634737273488276279390612439757453553299861256586083835271392167774236287593379171269508700855199849076386722595759761353074844775769768401417299375860558382064326817309213562469124493424243495548419280216422982292058775146313022446535436085675850955670521409319163392146118795511958547575816801265850700057642250261690323492801859567690454271773846249813129760759829714749734483665281840668784302100908956699842204456896817989282961564957176488532324014145782534466644993581486276067145946409147760157541391386493024032831006854540540684506195032999695057848381471594762351653944245393103339105430233410751611890925208258998448796893854803486439001584693149052538052028119668628266156032
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

end FranklSmallCyclic.TransportBatches.G028.B001.Data
