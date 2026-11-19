module

public import Conjectures.FranklSmallCyclicRowCoverage
public import Conjectures.FranklSmallCyclicCanonicalWords
public import Conjectures.FranklSmallCyclicOrbit9Block016Data

/-! 128 literal targets sharing one source proof block.
Original words and row indices are retained; weights may be transported.
-/
@[expose] public section

namespace FranklSmallCyclic.TransportBatches.G069.B001.Data

-- Period 9, original row 3162, representative 8890.
def source0 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B016.Data.entryAt ⟨91, by decide +kernel⟩

def target0 : Weights.Entry :=
  { word := [2, 8, 12, 12, 12, 0, 8], weights := [1, 0, 0, 1] }

-- Period 9, original row 3164, representative 8868.
def source1 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B016.Data.entryAt ⟨69, by decide +kernel⟩

def target1 : Weights.Entry :=
  { word := [2, 8, 12, 12, 12, 8, 8], weights := [1, 0, 0, 1] }

-- Period 9, original row 3718, representative 8903.
def source2 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B016.Data.entryAt ⟨104, by decide +kernel⟩

def target2 : Weights.Entry :=
  { word := [4, 8, 0, 2, 2, 10, 8], weights := [1, 0, 0, 1] }

def points2 : List (ℕ × ℕ) := [(0, 0), (1, 2), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 3722, representative 8912.
def source3 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B016.Data.entryAt ⟨113, by decide +kernel⟩

def target3 : Weights.Entry :=
  { word := [4, 8, 0, 2, 10, 10, 8], weights := [1, 0, 0, 1] }

def points3 : List (ℕ × ℕ) := [(0, 0), (1, 2), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 3723, representative 8827.
def source4 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B016.Data.entryAt ⟨28, by decide +kernel⟩

def target4 : Weights.Entry :=
  { word := [4, 8, 0, 4, 2, 0, 1], weights := [1, 0, 0, 1] }

def points4 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 3735, representative 8827.
def source5 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B016.Data.entryAt ⟨28, by decide +kernel⟩

def target5 : Weights.Entry :=
  { word := [4, 8, 0, 4, 4, 4, 0], weights := [1, 0, 1, 0] }

def points5 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 5), (4, 6), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 3738, representative 8881.
def source6 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B016.Data.entryAt ⟨82, by decide +kernel⟩

def target6 : Weights.Entry :=
  { word := [4, 8, 0, 4, 6, 0, 8], weights := [1, 0, 0, 1] }

def points6 : List (ℕ × ℕ) := [(0, 0), (1, 2), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 3740, representative 8859.
def source7 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B016.Data.entryAt ⟨60, by decide +kernel⟩

def target7 : Weights.Entry :=
  { word := [4, 8, 0, 4, 6, 8, 8], weights := [1, 0, 0, 1] }

def points7 : List (ℕ × ℕ) := [(0, 0), (1, 2), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 3749, representative 8832.
def source8 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B016.Data.entryAt ⟨33, by decide +kernel⟩

def target8 : Weights.Entry :=
  { word := [4, 8, 0, 4, 10, 0, 1], weights := [1, 0, 0, 1] }

def points8 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 3761, representative 8832.
def source9 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B016.Data.entryAt ⟨33, by decide +kernel⟩

def target9 : Weights.Entry :=
  { word := [4, 8, 0, 4, 12, 4, 0], weights := [1, 0, 1, 0] }

def points9 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 5), (4, 6), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 3764, representative 8914.
def source10 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B016.Data.entryAt ⟨115, by decide +kernel⟩

def target10 : Weights.Entry :=
  { word := [4, 8, 0, 10, 2, 10, 8], weights := [1, 0, 0, 1] }

def points10 : List (ℕ × ℕ) := [(0, 0), (1, 2), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 3766, representative 8913.
def source11 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B016.Data.entryAt ⟨114, by decide +kernel⟩

def target11 : Weights.Entry :=
  { word := [4, 8, 0, 10, 10, 10, 8], weights := [1, 0, 0, 1] }

def points11 : List (ℕ × ℕ) := [(0, 0), (1, 2), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 3767, representative 8834.
def source12 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B016.Data.entryAt ⟨35, by decide +kernel⟩

def target12 : Weights.Entry :=
  { word := [4, 8, 0, 12, 2, 0, 1], weights := [1, 0, 0, 1] }

def points12 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 3779, representative 8834.
def source13 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B016.Data.entryAt ⟨35, by decide +kernel⟩

def target13 : Weights.Entry :=
  { word := [4, 8, 0, 12, 4, 4, 0], weights := [1, 0, 1, 0] }

def points13 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 5), (4, 6), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 3781, representative 8886.
def source14 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B016.Data.entryAt ⟨87, by decide +kernel⟩

def target14 : Weights.Entry :=
  { word := [4, 8, 0, 12, 6, 0, 8], weights := [1, 0, 0, 1] }

def points14 : List (ℕ × ℕ) := [(0, 0), (1, 2), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 3783, representative 8864.
def source15 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B016.Data.entryAt ⟨65, by decide +kernel⟩

def target15 : Weights.Entry :=
  { word := [4, 8, 0, 12, 6, 8, 8], weights := [1, 0, 0, 1] }

def points15 : List (ℕ × ℕ) := [(0, 0), (1, 2), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 3792, representative 8833.
def source16 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B016.Data.entryAt ⟨34, by decide +kernel⟩

def target16 : Weights.Entry :=
  { word := [4, 8, 0, 12, 10, 0, 1], weights := [1, 0, 0, 1] }

def points16 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 3804, representative 8833.
def source17 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B016.Data.entryAt ⟨34, by decide +kernel⟩

def target17 : Weights.Entry :=
  { word := [4, 8, 0, 12, 12, 4, 0], weights := [1, 0, 1, 0] }

def points17 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 5), (4, 6), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 3807, representative 8923.
def source18 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B016.Data.entryAt ⟨124, by decide +kernel⟩

def target18 : Weights.Entry :=
  { word := [4, 8, 4, 2, 0, 1, 8], weights := [1, 0, 0, 1] }

-- Period 9, original row 3809, representative 8923.
def source19 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B016.Data.entryAt ⟨124, by decide +kernel⟩

def target19 : Weights.Entry :=
  { word := [4, 8, 4, 2, 0, 2, 8], weights := [1, 0, 0, 1] }

def points19 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 8), (8, 7)]

-- Period 9, original row 3811, representative 8807.
def source20 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B016.Data.entryAt ⟨8, by decide +kernel⟩

def target20 : Weights.Entry :=
  { word := [4, 8, 4, 2, 0, 8, 1], weights := [0, 1, 0, 1] }

def points20 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 3819, representative 8895.
def source21 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B016.Data.entryAt ⟨96, by decide +kernel⟩

def target21 : Weights.Entry :=
  { word := [4, 8, 4, 2, 0, 9, 8], weights := [1, 0, 0, 1] }

-- Period 9, original row 3821, representative 8895.
def source22 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B016.Data.entryAt ⟨96, by decide +kernel⟩

def target22 : Weights.Entry :=
  { word := [4, 8, 4, 2, 0, 10, 8], weights := [1, 0, 0, 1] }

def points22 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 8), (8, 7)]

-- Period 9, original row 3827, representative 8900.
def source23 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B016.Data.entryAt ⟨101, by decide +kernel⟩

def target23 : Weights.Entry :=
  { word := [4, 8, 4, 2, 8, 10, 8], weights := [1, 0, 0, 1] }

-- Period 9, original row 3829, representative 8873.
def source24 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B016.Data.entryAt ⟨74, by decide +kernel⟩

def target24 : Weights.Entry :=
  { word := [4, 8, 4, 4, 4, 0, 8], weights := [1, 0, 0, 1] }

-- Period 9, original row 3831, representative 8851.
def source25 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B016.Data.entryAt ⟨52, by decide +kernel⟩

def target25 : Weights.Entry :=
  { word := [4, 8, 4, 4, 4, 8, 8], weights := [1, 0, 0, 1] }

-- Period 9, original row 3833, representative 8878.
def source26 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B016.Data.entryAt ⟨79, by decide +kernel⟩

def target26 : Weights.Entry :=
  { word := [4, 8, 4, 4, 12, 0, 8], weights := [1, 0, 0, 1] }

-- Period 9, original row 3835, representative 8856.
def source27 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B016.Data.entryAt ⟨57, by decide +kernel⟩

def target27 : Weights.Entry :=
  { word := [4, 8, 4, 4, 12, 8, 8], weights := [1, 0, 0, 1] }

-- Period 9, original row 3837, representative 8849.
def source28 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B016.Data.entryAt ⟨50, by decide +kernel⟩

def target28 : Weights.Entry :=
  { word := [4, 8, 4, 8, 4, 2, 8], weights := [0, 1, 1, 0] }

-- Period 9, original row 3839, representative 8844.
def source29 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B016.Data.entryAt ⟨45, by decide +kernel⟩

def target29 : Weights.Entry :=
  { word := [4, 8, 4, 8, 4, 10, 8], weights := [0, 1, 1, 0] }

-- Period 9, original row 3841, representative 8848.
def source30 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B016.Data.entryAt ⟨49, by decide +kernel⟩

def target30 : Weights.Entry :=
  { word := [4, 8, 4, 8, 12, 2, 8], weights := [0, 1, 1, 0] }

-- Period 9, original row 3843, representative 8843.
def source31 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B016.Data.entryAt ⟨44, by decide +kernel⟩

def target31 : Weights.Entry :=
  { word := [4, 8, 4, 8, 12, 10, 8], weights := [0, 1, 1, 0] }

-- Period 9, original row 3846, representative 8810.
def source32 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B016.Data.entryAt ⟨11, by decide +kernel⟩

def target32 : Weights.Entry :=
  { word := [4, 8, 4, 10, 0, 8, 1], weights := [0, 1, 0, 1] }

def points32 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 3853, representative 8902.
def source33 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B016.Data.entryAt ⟨103, by decide +kernel⟩

def target33 : Weights.Entry :=
  { word := [4, 8, 4, 10, 0, 9, 8], weights := [1, 0, 0, 1] }

-- Period 9, original row 3854, representative 8902.
def source34 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B016.Data.entryAt ⟨103, by decide +kernel⟩

def target34 : Weights.Entry :=
  { word := [4, 8, 4, 10, 0, 10, 8], weights := [1, 0, 0, 1] }

def points34 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 8), (8, 7)]

-- Period 9, original row 3860, representative 8901.
def source35 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B016.Data.entryAt ⟨102, by decide +kernel⟩

def target35 : Weights.Entry :=
  { word := [4, 8, 4, 10, 8, 10, 8], weights := [0, 1, 1, 0] }

-- Period 9, original row 3863, representative 8880.
def source36 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B016.Data.entryAt ⟨81, by decide +kernel⟩

def target36 : Weights.Entry :=
  { word := [4, 8, 4, 12, 4, 0, 8], weights := [1, 0, 0, 1] }

-- Period 9, original row 3865, representative 8858.
def source37 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B016.Data.entryAt ⟨59, by decide +kernel⟩

def target37 : Weights.Entry :=
  { word := [4, 8, 4, 12, 4, 8, 8], weights := [0, 1, 1, 0] }

-- Period 9, original row 3866, representative 8879.
def source38 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B016.Data.entryAt ⟨80, by decide +kernel⟩

def target38 : Weights.Entry :=
  { word := [4, 8, 4, 12, 12, 0, 8], weights := [0, 1, 1, 0] }

-- Period 9, original row 3868, representative 8857.
def source39 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B016.Data.entryAt ⟨58, by decide +kernel⟩

def target39 : Weights.Entry :=
  { word := [4, 8, 4, 12, 12, 8, 8], weights := [0, 1, 1, 0] }

-- Period 9, original row 3876, representative 8904.
def source40 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B016.Data.entryAt ⟨105, by decide +kernel⟩

def target40 : Weights.Entry :=
  { word := [4, 8, 8, 2, 2, 10, 8], weights := [1, 0, 0, 1] }

-- Period 9, original row 3880, representative 8905.
def source41 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B016.Data.entryAt ⟨106, by decide +kernel⟩

def target41 : Weights.Entry :=
  { word := [4, 8, 8, 2, 10, 10, 8], weights := [1, 0, 0, 1] }

-- Period 9, original row 3881, representative 8819.
def source42 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B016.Data.entryAt ⟨20, by decide +kernel⟩

def target42 : Weights.Entry :=
  { word := [4, 8, 8, 4, 4, 4, 0], weights := [1, 0, 0, 1] }

def points42 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 3886, representative 8882.
def source43 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B016.Data.entryAt ⟨83, by decide +kernel⟩

def target43 : Weights.Entry :=
  { word := [4, 8, 8, 4, 6, 0, 8], weights := [1, 0, 0, 1] }

-- Period 9, original row 3888, representative 8860.
def source44 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B016.Data.entryAt ⟨61, by decide +kernel⟩

def target44 : Weights.Entry :=
  { word := [4, 8, 8, 4, 6, 8, 8], weights := [1, 0, 0, 1] }

-- Period 9, original row 3889, representative 8820.
def source45 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B016.Data.entryAt ⟨21, by decide +kernel⟩

def target45 : Weights.Entry :=
  { word := [4, 8, 8, 4, 12, 4, 0], weights := [1, 0, 0, 1] }

def points45 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 3895, representative 8850.
def source46 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B016.Data.entryAt ⟨51, by decide +kernel⟩

def target46 : Weights.Entry :=
  { word := [4, 8, 8, 8, 6, 2, 8], weights := [0, 1, 1, 0] }

-- Period 9, original row 3897, representative 8845.
def source47 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B016.Data.entryAt ⟨46, by decide +kernel⟩

def target47 : Weights.Entry :=
  { word := [4, 8, 8, 8, 6, 10, 8], weights := [0, 1, 1, 0] }

-- Period 9, original row 3900, representative 8907.
def source48 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B016.Data.entryAt ⟨108, by decide +kernel⟩

def target48 : Weights.Entry :=
  { word := [4, 8, 8, 10, 2, 10, 8], weights := [0, 1, 1, 0] }

-- Period 9, original row 3902, representative 8906.
def source49 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B016.Data.entryAt ⟨107, by decide +kernel⟩

def target49 : Weights.Entry :=
  { word := [4, 8, 8, 10, 10, 10, 8], weights := [0, 1, 1, 0] }

-- Period 9, original row 3903, representative 8822.
def source50 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B016.Data.entryAt ⟨23, by decide +kernel⟩

def target50 : Weights.Entry :=
  { word := [4, 8, 8, 12, 4, 4, 0], weights := [0, 1, 1, 0] }

def points50 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 3905, representative 8800.
def source51 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B016.Data.entryAt ⟨1, by decide +kernel⟩

def target51 : Weights.Entry :=
  { word := [4, 8, 8, 12, 4, 12, 0], weights := [0, 1, 1, 0] }

def points51 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 3907, representative 8883.
def source52 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B016.Data.entryAt ⟨84, by decide +kernel⟩

def target52 : Weights.Entry :=
  { word := [4, 8, 8, 12, 6, 0, 8], weights := [0, 1, 1, 0] }

-- Period 9, original row 3909, representative 8861.
def source53 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B016.Data.entryAt ⟨62, by decide +kernel⟩

def target53 : Weights.Entry :=
  { word := [4, 8, 8, 12, 6, 8, 8], weights := [0, 1, 1, 0] }

-- Period 9, original row 3910, representative 8821.
def source54 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B016.Data.entryAt ⟨22, by decide +kernel⟩

def target54 : Weights.Entry :=
  { word := [4, 8, 8, 12, 12, 4, 0], weights := [0, 1, 1, 0] }

def points54 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 3912, representative 8799.
def source55 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B016.Data.entryAt ⟨0, by decide +kernel⟩

def target55 : Weights.Entry :=
  { word := [4, 8, 8, 12, 12, 12, 0], weights := [0, 1, 1, 0] }

def points55 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 3915, representative 8924.
def source56 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B016.Data.entryAt ⟨125, by decide +kernel⟩

def target56 : Weights.Entry :=
  { word := [4, 8, 12, 2, 0, 1, 8], weights := [1, 0, 0, 1] }

-- Period 9, original row 3917, representative 8924.
def source57 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B016.Data.entryAt ⟨125, by decide +kernel⟩

def target57 : Weights.Entry :=
  { word := [4, 8, 12, 2, 0, 2, 8], weights := [1, 0, 0, 1] }

def points57 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 8), (8, 7)]

-- Period 9, original row 3919, representative 8808.
def source58 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B016.Data.entryAt ⟨9, by decide +kernel⟩

def target58 : Weights.Entry :=
  { word := [4, 8, 12, 2, 0, 8, 1], weights := [0, 1, 0, 1] }

def points58 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 3927, representative 8896.
def source59 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B016.Data.entryAt ⟨97, by decide +kernel⟩

def target59 : Weights.Entry :=
  { word := [4, 8, 12, 2, 0, 9, 8], weights := [1, 0, 0, 1] }

-- Period 9, original row 3929, representative 8896.
def source60 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B016.Data.entryAt ⟨97, by decide +kernel⟩

def target60 : Weights.Entry :=
  { word := [4, 8, 12, 2, 0, 10, 8], weights := [1, 0, 0, 1] }

def points60 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 8), (8, 7)]

-- Period 9, original row 3931, representative 8925.
def source61 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B016.Data.entryAt ⟨126, by decide +kernel⟩

def target61 : Weights.Entry :=
  { word := [4, 8, 12, 2, 8, 2, 8], weights := [1, 0, 0, 1] }

-- Period 9, original row 3935, representative 8897.
def source62 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B016.Data.entryAt ⟨98, by decide +kernel⟩

def target62 : Weights.Entry :=
  { word := [4, 8, 12, 2, 8, 10, 8], weights := [1, 0, 0, 1] }

-- Period 9, original row 3937, representative 8874.
def source63 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B016.Data.entryAt ⟨75, by decide +kernel⟩

def target63 : Weights.Entry :=
  { word := [4, 8, 12, 4, 4, 0, 8], weights := [1, 0, 0, 1] }

-- Period 9, original row 3939, representative 8852.
def source64 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B016.Data.entryAt ⟨53, by decide +kernel⟩

def target64 : Weights.Entry :=
  { word := [4, 8, 12, 4, 4, 8, 8], weights := [1, 0, 0, 1] }

-- Period 9, original row 3941, representative 8875.
def source65 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B016.Data.entryAt ⟨76, by decide +kernel⟩

def target65 : Weights.Entry :=
  { word := [4, 8, 12, 4, 12, 0, 8], weights := [1, 0, 0, 1] }

-- Period 9, original row 3943, representative 8853.
def source66 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B016.Data.entryAt ⟨54, by decide +kernel⟩

def target66 : Weights.Entry :=
  { word := [4, 8, 12, 4, 12, 8, 8], weights := [1, 0, 0, 1] }

-- Period 9, original row 3945, representative 8847.
def source67 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B016.Data.entryAt ⟨48, by decide +kernel⟩

def target67 : Weights.Entry :=
  { word := [4, 8, 12, 8, 4, 2, 8], weights := [0, 1, 1, 0] }

-- Period 9, original row 3947, representative 8842.
def source68 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B016.Data.entryAt ⟨43, by decide +kernel⟩

def target68 : Weights.Entry :=
  { word := [4, 8, 12, 8, 4, 10, 8], weights := [0, 1, 1, 0] }

-- Period 9, original row 3949, representative 8846.
def source69 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B016.Data.entryAt ⟨47, by decide +kernel⟩

def target69 : Weights.Entry :=
  { word := [4, 8, 12, 8, 12, 2, 8], weights := [0, 1, 1, 0] }

-- Period 9, original row 3951, representative 8841.
def source70 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B016.Data.entryAt ⟨42, by decide +kernel⟩

def target70 : Weights.Entry :=
  { word := [4, 8, 12, 8, 12, 10, 8], weights := [0, 1, 1, 0] }

-- Period 9, original row 3954, representative 8809.
def source71 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B016.Data.entryAt ⟨10, by decide +kernel⟩

def target71 : Weights.Entry :=
  { word := [4, 8, 12, 10, 0, 8, 1], weights := [0, 1, 0, 1] }

def points71 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 3961, representative 8899.
def source72 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B016.Data.entryAt ⟨100, by decide +kernel⟩

def target72 : Weights.Entry :=
  { word := [4, 8, 12, 10, 0, 9, 8], weights := [1, 0, 0, 1] }

-- Period 9, original row 3962, representative 8899.
def source73 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B016.Data.entryAt ⟨100, by decide +kernel⟩

def target73 : Weights.Entry :=
  { word := [4, 8, 12, 10, 0, 10, 8], weights := [1, 0, 0, 1] }

def points73 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 8), (8, 7)]

-- Period 9, original row 3963, representative 8926.
def source74 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B016.Data.entryAt ⟨127, by decide +kernel⟩

def target74 : Weights.Entry :=
  { word := [4, 8, 12, 10, 8, 2, 8], weights := [0, 1, 1, 0] }

-- Period 9, original row 3968, representative 8898.
def source75 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B016.Data.entryAt ⟨99, by decide +kernel⟩

def target75 : Weights.Entry :=
  { word := [4, 8, 12, 10, 8, 10, 8], weights := [0, 1, 1, 0] }

-- Period 9, original row 3971, representative 8877.
def source76 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B016.Data.entryAt ⟨78, by decide +kernel⟩

def target76 : Weights.Entry :=
  { word := [4, 8, 12, 12, 4, 0, 8], weights := [1, 0, 0, 1] }

-- Period 9, original row 3973, representative 8855.
def source77 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B016.Data.entryAt ⟨56, by decide +kernel⟩

def target77 : Weights.Entry :=
  { word := [4, 8, 12, 12, 4, 8, 8], weights := [0, 1, 1, 0] }

-- Period 9, original row 3974, representative 8876.
def source78 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B016.Data.entryAt ⟨77, by decide +kernel⟩

def target78 : Weights.Entry :=
  { word := [4, 8, 12, 12, 12, 0, 8], weights := [0, 1, 1, 0] }

-- Period 9, original row 3976, representative 8854.
def source79 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B016.Data.entryAt ⟨55, by decide +kernel⟩

def target79 : Weights.Entry :=
  { word := [4, 8, 12, 12, 12, 8, 8], weights := [0, 1, 1, 0] }

-- Period 9, original row 4130, representative 8923.
def source80 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B016.Data.entryAt ⟨124, by decide +kernel⟩

def target80 : Weights.Entry :=
  { word := [8, 0, 1, 4, 2, 8, 2], weights := [1, 0, 0, 1] }

def points80 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 4152, representative 8924.
def source81 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B016.Data.entryAt ⟨125, by decide +kernel⟩

def target81 : Weights.Entry :=
  { word := [8, 0, 1, 4, 10, 8, 2], weights := [1, 0, 0, 1] }

def points81 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 4204, representative 8873.
def source82 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B016.Data.entryAt ⟨74, by decide +kernel⟩

def target82 : Weights.Entry :=
  { word := [8, 0, 2, 2, 2, 8, 2], weights := [1, 0, 0, 1] }

def points82 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 4205, representative 8887.
def source83 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B016.Data.entryAt ⟨88, by decide +kernel⟩

def target83 : Weights.Entry :=
  { word := [8, 0, 2, 2, 2, 8, 4], weights := [1, 0, 0, 1] }

def points83 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 4219, representative 8874.
def source84 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B016.Data.entryAt ⟨75, by decide +kernel⟩

def target84 : Weights.Entry :=
  { word := [8, 0, 2, 2, 10, 8, 2], weights := [1, 0, 0, 1] }

def points84 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 4220, representative 8888.
def source85 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B016.Data.entryAt ⟨89, by decide +kernel⟩

def target85 : Weights.Entry :=
  { word := [8, 0, 2, 2, 10, 8, 4], weights := [1, 0, 0, 1] }

def points85 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 4233, representative 8880.
def source86 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B016.Data.entryAt ⟨81, by decide +kernel⟩

def target86 : Weights.Entry :=
  { word := [8, 0, 2, 10, 2, 8, 2], weights := [1, 0, 0, 1] }

def points86 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 4234, representative 8894.
def source87 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B016.Data.entryAt ⟨95, by decide +kernel⟩

def target87 : Weights.Entry :=
  { word := [8, 0, 2, 10, 2, 8, 4], weights := [1, 0, 0, 1] }

def points87 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 4247, representative 8877.
def source88 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B016.Data.entryAt ⟨78, by decide +kernel⟩

def target88 : Weights.Entry :=
  { word := [8, 0, 2, 10, 10, 8, 2], weights := [1, 0, 0, 1] }

def points88 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 4248, representative 8891.
def source89 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B016.Data.entryAt ⟨92, by decide +kernel⟩

def target89 : Weights.Entry :=
  { word := [8, 0, 2, 10, 10, 8, 4], weights := [1, 0, 0, 1] }

def points89 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 4317, representative 8881.
def source90 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B016.Data.entryAt ⟨82, by decide +kernel⟩

def target90 : Weights.Entry :=
  { word := [8, 0, 6, 2, 0, 8, 2], weights := [1, 0, 0, 1] }

def points90 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 4318, representative 8881.
def source91 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B016.Data.entryAt ⟨82, by decide +kernel⟩

def target91 : Weights.Entry :=
  { word := [8, 0, 6, 2, 0, 8, 4], weights := [1, 0, 0, 1] }

def points91 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 4325, representative 8882.
def source92 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B016.Data.entryAt ⟨83, by decide +kernel⟩

def target92 : Weights.Entry :=
  { word := [8, 0, 6, 2, 8, 8, 2], weights := [1, 0, 0, 1] }

def points92 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 4326, representative 8884.
def source93 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B016.Data.entryAt ⟨85, by decide +kernel⟩

def target93 : Weights.Entry :=
  { word := [8, 0, 6, 2, 8, 8, 4], weights := [1, 0, 0, 1] }

def points93 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 4332, representative 8886.
def source94 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B016.Data.entryAt ⟨87, by decide +kernel⟩

def target94 : Weights.Entry :=
  { word := [8, 0, 6, 10, 0, 8, 2], weights := [1, 0, 0, 1] }

def points94 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 4333, representative 8886.
def source95 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B016.Data.entryAt ⟨87, by decide +kernel⟩

def target95 : Weights.Entry :=
  { word := [8, 0, 6, 10, 0, 8, 4], weights := [1, 0, 0, 1] }

def points95 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 4339, representative 8883.
def source96 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B016.Data.entryAt ⟨84, by decide +kernel⟩

def target96 : Weights.Entry :=
  { word := [8, 0, 6, 10, 8, 8, 2], weights := [0, 1, 1, 0] }

def points96 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 4340, representative 8885.
def source97 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B016.Data.entryAt ⟨86, by decide +kernel⟩

def target97 : Weights.Entry :=
  { word := [8, 0, 6, 10, 8, 8, 4], weights := [1, 0, 0, 1] }

def points97 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 4398, representative 8878.
def source98 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B016.Data.entryAt ⟨79, by decide +kernel⟩

def target98 : Weights.Entry :=
  { word := [8, 0, 10, 2, 2, 8, 2], weights := [1, 0, 0, 1] }

def points98 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 4399, representative 8892.
def source99 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B016.Data.entryAt ⟨93, by decide +kernel⟩

def target99 : Weights.Entry :=
  { word := [8, 0, 10, 2, 2, 8, 4], weights := [1, 0, 0, 1] }

def points99 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 4406, representative 8875.
def source100 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B016.Data.entryAt ⟨76, by decide +kernel⟩

def target100 : Weights.Entry :=
  { word := [8, 0, 10, 2, 10, 8, 2], weights := [1, 0, 0, 1] }

def points100 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 4407, representative 8889.
def source101 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B016.Data.entryAt ⟨90, by decide +kernel⟩

def target101 : Weights.Entry :=
  { word := [8, 0, 10, 2, 10, 8, 4], weights := [1, 0, 0, 1] }

def points101 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 4413, representative 8879.
def source102 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B016.Data.entryAt ⟨80, by decide +kernel⟩

def target102 : Weights.Entry :=
  { word := [8, 0, 10, 10, 2, 8, 2], weights := [0, 1, 1, 0] }

def points102 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 4414, representative 8893.
def source103 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B016.Data.entryAt ⟨94, by decide +kernel⟩

def target103 : Weights.Entry :=
  { word := [8, 0, 10, 10, 2, 8, 4], weights := [1, 0, 0, 1] }

def points103 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 4420, representative 8876.
def source104 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B016.Data.entryAt ⟨77, by decide +kernel⟩

def target104 : Weights.Entry :=
  { word := [8, 0, 10, 10, 10, 8, 2], weights := [0, 1, 1, 0] }

def points104 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 4421, representative 8890.
def source105 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B016.Data.entryAt ⟨91, by decide +kernel⟩

def target105 : Weights.Entry :=
  { word := [8, 0, 10, 10, 10, 8, 4], weights := [1, 0, 0, 1] }

def points105 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 5009, representative 8923.
def source106 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B016.Data.entryAt ⟨124, by decide +kernel⟩

def target106 : Weights.Entry :=
  { word := [8, 4, 0, 4, 2, 8, 2], weights := [1, 0, 0, 1] }

def points106 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2)]

-- Period 9, original row 5031, representative 8924.
def source107 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B016.Data.entryAt ⟨125, by decide +kernel⟩

def target107 : Weights.Entry :=
  { word := [8, 4, 0, 4, 10, 8, 2], weights := [1, 0, 0, 1] }

def points107 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2)]

-- Period 9, original row 5085, representative 8849.
def source108 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B016.Data.entryAt ⟨50, by decide +kernel⟩

def target108 : Weights.Entry :=
  { word := [8, 4, 2, 8, 2, 8, 2], weights := [0, 1, 1, 0] }

def points108 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 5093, representative 8847.
def source109 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B016.Data.entryAt ⟨48, by decide +kernel⟩

def target109 : Weights.Entry :=
  { word := [8, 4, 2, 8, 10, 8, 2], weights := [0, 1, 1, 0] }

def points109 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 5153, representative 8850.
def source110 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B016.Data.entryAt ⟨51, by decide +kernel⟩

def target110 : Weights.Entry :=
  { word := [8, 4, 6, 8, 8, 8, 2], weights := [0, 1, 1, 0] }

def points110 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 5190, representative 8925.
def source111 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B016.Data.entryAt ⟨126, by decide +kernel⟩

def target111 : Weights.Entry :=
  { word := [8, 4, 8, 4, 10, 8, 2], weights := [1, 0, 0, 1] }

def points111 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 5232, representative 8926.
def source112 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B016.Data.entryAt ⟨127, by decide +kernel⟩

def target112 : Weights.Entry :=
  { word := [8, 4, 8, 12, 10, 8, 2], weights := [0, 1, 1, 0] }

def points112 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 5247, representative 8848.
def source113 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B016.Data.entryAt ⟨49, by decide +kernel⟩

def target113 : Weights.Entry :=
  { word := [8, 4, 10, 8, 2, 8, 2], weights := [0, 1, 1, 0] }

def points113 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 5250, representative 8846.
def source114 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B016.Data.entryAt ⟨47, by decide +kernel⟩

def target114 : Weights.Entry :=
  { word := [8, 4, 10, 8, 10, 8, 2], weights := [0, 1, 1, 0] }

def points114 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 5319, representative 8839.
def source115 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B016.Data.entryAt ⟨40, by decide +kernel⟩

def target115 : Weights.Entry :=
  { word := [8, 8, 0, 1, 4, 8, 4], weights := [0, 1, 0, 0] }

def points115 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2)]

-- Period 9, original row 5325, representative 8837.
def source116 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B016.Data.entryAt ⟨38, by decide +kernel⟩

def target116 : Weights.Entry :=
  { word := [8, 8, 0, 1, 12, 8, 4], weights := [0, 1, 0, 0] }

def points116 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2)]

-- Period 9, original row 5451, representative 8895.
def source117 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B016.Data.entryAt ⟨96, by decide +kernel⟩

def target117 : Weights.Entry :=
  { word := [8, 8, 1, 4, 2, 8, 2], weights := [1, 0, 0, 1] }

def points117 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 5452, representative 8915.
def source118 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B016.Data.entryAt ⟨116, by decide +kernel⟩

def target118 : Weights.Entry :=
  { word := [8, 8, 1, 4, 2, 8, 4], weights := [1, 0, 0, 1] }

def points118 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 5473, representative 8896.
def source119 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B016.Data.entryAt ⟨97, by decide +kernel⟩

def target119 : Weights.Entry :=
  { word := [8, 8, 1, 4, 10, 8, 2], weights := [1, 0, 0, 1] }

def points119 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 5474, representative 8916.
def source120 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B016.Data.entryAt ⟨117, by decide +kernel⟩

def target120 : Weights.Entry :=
  { word := [8, 8, 1, 4, 10, 8, 4], weights := [1, 0, 0, 1] }

def points120 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 5487, representative 8902.
def source121 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B016.Data.entryAt ⟨103, by decide +kernel⟩

def target121 : Weights.Entry :=
  { word := [8, 8, 1, 12, 2, 8, 2], weights := [1, 0, 0, 1] }

def points121 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 5488, representative 8922.
def source122 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B016.Data.entryAt ⟨123, by decide +kernel⟩

def target122 : Weights.Entry :=
  { word := [8, 8, 1, 12, 2, 8, 4], weights := [1, 0, 0, 1] }

def points122 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 5509, representative 8899.
def source123 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B016.Data.entryAt ⟨100, by decide +kernel⟩

def target123 : Weights.Entry :=
  { word := [8, 8, 1, 12, 10, 8, 2], weights := [1, 0, 0, 1] }

def points123 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 5510, representative 8919.
def source124 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B016.Data.entryAt ⟨120, by decide +kernel⟩

def target124 : Weights.Entry :=
  { word := [8, 8, 1, 12, 10, 8, 4], weights := [1, 0, 0, 1] }

def points124 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 5525, representative 8851.
def source125 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B016.Data.entryAt ⟨52, by decide +kernel⟩

def target125 : Weights.Entry :=
  { word := [8, 8, 2, 2, 2, 8, 2], weights := [1, 0, 0, 1] }

def points125 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 5526, representative 8865.
def source126 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B016.Data.entryAt ⟨66, by decide +kernel⟩

def target126 : Weights.Entry :=
  { word := [8, 8, 2, 2, 2, 8, 4], weights := [1, 0, 0, 1] }

def points126 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 5540, representative 8852.
def source127 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B016.Data.entryAt ⟨53, by decide +kernel⟩

def target127 : Weights.Entry :=
  { word := [8, 8, 2, 2, 10, 8, 2], weights := [1, 0, 0, 1] }

def points127 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

def period9Entries : List Weights.Entry := [target0, target1, target2, target3, target4, target5, target6, target7, target8, target9, target10, target11, target12, target13, target14, target15, target16, target17, target18, target19, target20, target21, target22, target23, target24, target25, target26, target27, target28, target29, target30, target31, target32, target33, target34, target35, target36, target37, target38, target39, target40, target41, target42, target43, target44, target45, target46, target47, target48, target49, target50, target51, target52, target53, target54, target55, target56, target57, target58, target59, target60, target61, target62, target63, target64, target65, target66, target67, target68, target69, target70, target71, target72, target73, target74, target75, target76, target77, target78, target79, target80, target81, target82, target83, target84, target85, target86, target87, target88, target89, target90, target91, target92, target93, target94, target95, target96, target97, target98, target99, target100, target101, target102, target103, target104, target105, target106, target107, target108, target109, target110, target111, target112, target113, target114, target115, target116, target117, target118, target119, target120, target121, target122, target123, target124, target125, target126, target127]

def period9Chunk : RowCoverage.Chunk where
  rows := [⟨3162, target0⟩, ⟨3164, target1⟩, ⟨3718, target2⟩, ⟨3722, target3⟩, ⟨3723, target4⟩, ⟨3735, target5⟩, ⟨3738, target6⟩, ⟨3740, target7⟩, ⟨3749, target8⟩, ⟨3761, target9⟩, ⟨3764, target10⟩, ⟨3766, target11⟩, ⟨3767, target12⟩, ⟨3779, target13⟩, ⟨3781, target14⟩, ⟨3783, target15⟩, ⟨3792, target16⟩, ⟨3804, target17⟩, ⟨3807, target18⟩, ⟨3809, target19⟩, ⟨3811, target20⟩, ⟨3819, target21⟩, ⟨3821, target22⟩, ⟨3827, target23⟩, ⟨3829, target24⟩, ⟨3831, target25⟩, ⟨3833, target26⟩, ⟨3835, target27⟩, ⟨3837, target28⟩, ⟨3839, target29⟩, ⟨3841, target30⟩, ⟨3843, target31⟩, ⟨3846, target32⟩, ⟨3853, target33⟩, ⟨3854, target34⟩, ⟨3860, target35⟩, ⟨3863, target36⟩, ⟨3865, target37⟩, ⟨3866, target38⟩, ⟨3868, target39⟩, ⟨3876, target40⟩, ⟨3880, target41⟩, ⟨3881, target42⟩, ⟨3886, target43⟩, ⟨3888, target44⟩, ⟨3889, target45⟩, ⟨3895, target46⟩, ⟨3897, target47⟩, ⟨3900, target48⟩, ⟨3902, target49⟩, ⟨3903, target50⟩, ⟨3905, target51⟩, ⟨3907, target52⟩, ⟨3909, target53⟩, ⟨3910, target54⟩, ⟨3912, target55⟩, ⟨3915, target56⟩, ⟨3917, target57⟩, ⟨3919, target58⟩, ⟨3927, target59⟩, ⟨3929, target60⟩, ⟨3931, target61⟩, ⟨3935, target62⟩, ⟨3937, target63⟩, ⟨3939, target64⟩, ⟨3941, target65⟩, ⟨3943, target66⟩, ⟨3945, target67⟩, ⟨3947, target68⟩, ⟨3949, target69⟩, ⟨3951, target70⟩, ⟨3954, target71⟩, ⟨3961, target72⟩, ⟨3962, target73⟩, ⟨3963, target74⟩, ⟨3968, target75⟩, ⟨3971, target76⟩, ⟨3973, target77⟩, ⟨3974, target78⟩, ⟨3976, target79⟩, ⟨4130, target80⟩, ⟨4152, target81⟩, ⟨4204, target82⟩, ⟨4205, target83⟩, ⟨4219, target84⟩, ⟨4220, target85⟩, ⟨4233, target86⟩, ⟨4234, target87⟩, ⟨4247, target88⟩, ⟨4248, target89⟩, ⟨4317, target90⟩, ⟨4318, target91⟩, ⟨4325, target92⟩, ⟨4326, target93⟩, ⟨4332, target94⟩, ⟨4333, target95⟩, ⟨4339, target96⟩, ⟨4340, target97⟩, ⟨4398, target98⟩, ⟨4399, target99⟩, ⟨4406, target100⟩, ⟨4407, target101⟩, ⟨4413, target102⟩, ⟨4414, target103⟩, ⟨4420, target104⟩, ⟨4421, target105⟩, ⟨5009, target106⟩, ⟨5031, target107⟩, ⟨5085, target108⟩, ⟨5093, target109⟩, ⟨5153, target110⟩, ⟨5190, target111⟩, ⟨5232, target112⟩, ⟨5247, target113⟩, ⟨5250, target114⟩, ⟨5319, target115⟩, ⟨5325, target116⟩, ⟨5451, target117⟩, ⟨5452, target118⟩, ⟨5473, target119⟩, ⟨5474, target120⟩, ⟨5487, target121⟩, ⟨5488, target122⟩, ⟨5509, target123⟩, ⟨5510, target124⟩, ⟨5525, target125⟩, ⟨5526, target126⟩, ⟨5540, target127⟩]
  indexMask := 508411936170353351822091249261783194575619885658667489785745206290056756168553860975184037802522358382669337883443453402524143585950531227298143724864786519985582495161841638406720499562145468371042957316792052857519663897350700316178458417413902214671336015091824761852282424755341140926370715723115381400216145027230950677819448549802336528171149100938874747355560775003326791356057538837743667107106424859439620624797434883484749296787399381676175811315213633197230373897809126942428537236060565131525403818719781693933074225290949029477297241987756944443502910819439351527567009024720577428401761327352289717045280568760877535428954003391806233810336804119902395265835383388705720176809630354125649734430629675818444700832850945493995052352050854706736827459015861801878709826842795032490415757436965460733427195689500948823458223180822239178427610268457389342735447375578396936470354676290046425117982823231312559715532847834856923641796300659006355703937616190150155356773686310635502121760153290638057141188993121347857625335306374399113468057185218230515310291885266156953989140408401015756772192591638590365432764020933019439570466740145611158298388737083799943040673833889219031636560317397534634255387574482363204341955687293370878435058707427722913118988648951989368819211261501041029655428671853815190499104247368490590059189131529792089591414820859651751699101071306664202064777506097376244116589209129178490914681949954085680363365544484755416122635786400298615378606624239531739715508384380818964337145118247918511309852617602969480337130026242504603599428806197143027829562661800504025929154347256247329561539018865092382178890032528991608908374081536
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

end FranklSmallCyclic.TransportBatches.G069.B001.Data
