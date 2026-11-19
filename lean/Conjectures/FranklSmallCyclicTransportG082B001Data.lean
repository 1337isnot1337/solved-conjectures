module

public import Conjectures.FranklSmallCyclicRowCoverage
public import Conjectures.FranklSmallCyclicCanonicalWords
public import Conjectures.FranklSmallCyclicOrbit10Block004Data

/-! 43 literal targets sharing one source proof block.
Original words and row indices are retained; weights may be transported.
-/
@[expose] public section

namespace FranklSmallCyclic.TransportBatches.G082.B001.Data

-- Period 10, original row 8599, representative 9718.
def source0 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B004.Data.entryAt ⟨14, by decide +kernel⟩

def target0 : Weights.Entry :=
  { word := [12, 2, 0, 10, 0, 0, 8], weights := [0, 1, 0, 1] }

def points0 : List (ℕ × ℕ) := [(0, 7), (1, 8), (2, 9), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8606, representative 9717.
def source1 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B004.Data.entryAt ⟨13, by decide +kernel⟩

def target1 : Weights.Entry :=
  { word := [12, 2, 0, 10, 0, 8, 8], weights := [0, 1, 0, 1] }

def points1 : List (ℕ × ℕ) := [(0, 9), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8616, representative 9731.
def source2 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B004.Data.entryAt ⟨27, by decide +kernel⟩

def target2 : Weights.Entry :=
  { word := [12, 2, 0, 12, 10, 0, 8], weights := [1, 1, 0, 1] }

def points2 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8629, representative 9705.
def source3 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B004.Data.entryAt ⟨1, by decide +kernel⟩

def target3 : Weights.Entry :=
  { word := [12, 2, 8, 2, 0, 8, 8], weights := [0, 1, 0, 1] }

def points3 : List (ℕ × ℕ) := [(0, 9), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8654, representative 9704.
def source4 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B004.Data.entryAt ⟨0, by decide +kernel⟩

def target4 : Weights.Entry :=
  { word := [12, 2, 8, 10, 0, 1, 8], weights := [0, 1, 0, 1] }

def points4 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8656, representative 9704.
def source5 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B004.Data.entryAt ⟨0, by decide +kernel⟩

def target5 : Weights.Entry :=
  { word := [12, 2, 8, 10, 0, 2, 8], weights := [0, 1, 0, 1] }

def points5 : List (ℕ × ℕ) := [(0, 7), (1, 9), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8662, representative 9706.
def source6 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B004.Data.entryAt ⟨2, by decide +kernel⟩

def target6 : Weights.Entry :=
  { word := [12, 2, 8, 10, 0, 8, 8], weights := [0, 1, 0, 1] }

def points6 : List (ℕ × ℕ) := [(0, 9), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8690, representative 9759.
def source7 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B004.Data.entryAt ⟨55, by decide +kernel⟩

def target7 : Weights.Entry :=
  { word := [12, 4, 4, 8, 8, 2, 10], weights := [0, 1, 1, 0] }

-- Period 10, original row 8692, representative 9757.
def source8 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B004.Data.entryAt ⟨53, by decide +kernel⟩

def target8 : Weights.Entry :=
  { word := [12, 4, 4, 8, 8, 10, 10], weights := [0, 1, 1, 0] }

-- Period 10, original row 8706, representative 9759.
def source9 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B004.Data.entryAt ⟨55, by decide +kernel⟩

def target9 : Weights.Entry :=
  { word := [12, 4, 8, 8, 2, 2, 10], weights := [0, 1, 1, 0] }

def points9 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8708, representative 9755.
def source10 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B004.Data.entryAt ⟨51, by decide +kernel⟩

def target10 : Weights.Entry :=
  { word := [12, 4, 8, 8, 2, 10, 10], weights := [0, 1, 1, 0] }

-- Period 10, original row 8715, representative 9758.
def source11 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B004.Data.entryAt ⟨54, by decide +kernel⟩

def target11 : Weights.Entry :=
  { word := [12, 4, 8, 8, 10, 2, 10], weights := [0, 1, 1, 0] }

-- Period 10, original row 8717, representative 9754.
def source12 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B004.Data.entryAt ⟨50, by decide +kernel⟩

def target12 : Weights.Entry :=
  { word := [12, 4, 8, 8, 10, 10, 10], weights := [0, 1, 1, 0] }

-- Period 10, original row 8720, representative 9758.
def source13 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B004.Data.entryAt ⟨54, by decide +kernel⟩

def target13 : Weights.Entry :=
  { word := [12, 4, 12, 8, 8, 2, 10], weights := [0, 1, 1, 0] }

def points13 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8722, representative 9756.
def source14 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B004.Data.entryAt ⟨52, by decide +kernel⟩

def target14 : Weights.Entry :=
  { word := [12, 4, 12, 8, 8, 10, 10], weights := [0, 1, 1, 0] }

-- Period 10, original row 8745, representative 9760.
def source15 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B004.Data.entryAt ⟨56, by decide +kernel⟩

def target15 : Weights.Entry :=
  { word := [12, 8, 0, 4, 2, 8, 10], weights := [1, 0, 1, 0] }

def points15 : List (ℕ × ℕ) := [(0, 0), (1, 2), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8), (9, 9)]

-- Period 10, original row 8771, representative 9761.
def source16 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B004.Data.entryAt ⟨57, by decide +kernel⟩

def target16 : Weights.Entry :=
  { word := [12, 8, 0, 4, 10, 8, 10], weights := [1, 0, 1, 0] }

def points16 : List (ℕ × ℕ) := [(0, 0), (1, 2), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8), (9, 9)]

-- Period 10, original row 8789, representative 9767.
def source17 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B004.Data.entryAt ⟨63, by decide +kernel⟩

def target17 : Weights.Entry :=
  { word := [12, 8, 0, 12, 2, 8, 10], weights := [1, 0, 1, 0] }

def points17 : List (ℕ × ℕ) := [(0, 0), (1, 2), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8), (9, 9)]

-- Period 10, original row 8814, representative 9764.
def source18 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B004.Data.entryAt ⟨60, by decide +kernel⟩

def target18 : Weights.Entry :=
  { word := [12, 8, 0, 12, 10, 8, 10], weights := [1, 0, 1, 0] }

def points18 : List (ℕ × ℕ) := [(0, 0), (1, 2), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8), (9, 9)]

-- Period 10, original row 8827, representative 9736.
def source19 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B004.Data.entryAt ⟨32, by decide +kernel⟩

def target19 : Weights.Entry :=
  { word := [12, 8, 4, 2, 0, 8, 9], weights := [0, 1, 0, 1] }

def points19 : List (ℕ × ℕ) := [(0, 9), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8828, representative 9760.
def source20 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B004.Data.entryAt ⟨56, by decide +kernel⟩

def target20 : Weights.Entry :=
  { word := [12, 8, 4, 2, 0, 8, 10], weights := [0, 1, 0, 1] }

def points20 : List (ℕ × ℕ) := [(0, 9), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8829, representative 9760.
def source21 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B004.Data.entryAt ⟨56, by decide +kernel⟩

def target21 : Weights.Entry :=
  { word := [12, 8, 4, 2, 0, 8, 12], weights := [0, 1, 0, 1] }

def points21 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8837, representative 9765.
def source22 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B004.Data.entryAt ⟨61, by decide +kernel⟩

def target22 : Weights.Entry :=
  { word := [12, 8, 4, 2, 8, 8, 12], weights := [0, 1, 0, 1] }

def points22 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8862, representative 9739.
def source23 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B004.Data.entryAt ⟨35, by decide +kernel⟩

def target23 : Weights.Entry :=
  { word := [12, 8, 4, 10, 0, 8, 9], weights := [0, 1, 0, 1] }

def points23 : List (ℕ × ℕ) := [(0, 9), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8863, representative 9767.
def source24 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B004.Data.entryAt ⟨63, by decide +kernel⟩

def target24 : Weights.Entry :=
  { word := [12, 8, 4, 10, 0, 8, 10], weights := [0, 1, 0, 1] }

def points24 : List (ℕ × ℕ) := [(0, 9), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8864, representative 9767.
def source25 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B004.Data.entryAt ⟨63, by decide +kernel⟩

def target25 : Weights.Entry :=
  { word := [12, 8, 4, 10, 0, 8, 12], weights := [0, 1, 0, 1] }

def points25 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8871, representative 9766.
def source26 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B004.Data.entryAt ⟨62, by decide +kernel⟩

def target26 : Weights.Entry :=
  { word := [12, 8, 4, 10, 8, 8, 12], weights := [0, 1, 0, 1] }

def points26 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8935, representative 9737.
def source27 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B004.Data.entryAt ⟨33, by decide +kernel⟩

def target27 : Weights.Entry :=
  { word := [12, 8, 12, 2, 0, 8, 9], weights := [0, 1, 0, 1] }

def points27 : List (ℕ × ℕ) := [(0, 9), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8936, representative 9761.
def source28 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B004.Data.entryAt ⟨57, by decide +kernel⟩

def target28 : Weights.Entry :=
  { word := [12, 8, 12, 2, 0, 8, 10], weights := [0, 1, 0, 1] }

def points28 : List (ℕ × ℕ) := [(0, 9), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8937, representative 9761.
def source29 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B004.Data.entryAt ⟨57, by decide +kernel⟩

def target29 : Weights.Entry :=
  { word := [12, 8, 12, 2, 0, 8, 12], weights := [0, 1, 0, 1] }

def points29 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8945, representative 9762.
def source30 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B004.Data.entryAt ⟨58, by decide +kernel⟩

def target30 : Weights.Entry :=
  { word := [12, 8, 12, 2, 8, 8, 12], weights := [0, 1, 0, 1] }

def points30 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8970, representative 9738.
def source31 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B004.Data.entryAt ⟨34, by decide +kernel⟩

def target31 : Weights.Entry :=
  { word := [12, 8, 12, 10, 0, 8, 9], weights := [0, 1, 0, 1] }

def points31 : List (ℕ × ℕ) := [(0, 9), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8971, representative 9764.
def source32 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B004.Data.entryAt ⟨60, by decide +kernel⟩

def target32 : Weights.Entry :=
  { word := [12, 8, 12, 10, 0, 8, 10], weights := [0, 1, 0, 1] }

def points32 : List (ℕ × ℕ) := [(0, 9), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8972, representative 9764.
def source33 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B004.Data.entryAt ⟨60, by decide +kernel⟩

def target33 : Weights.Entry :=
  { word := [12, 8, 12, 10, 0, 8, 12], weights := [0, 1, 0, 1] }

def points33 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8979, representative 9763.
def source34 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B004.Data.entryAt ⟨59, by decide +kernel⟩

def target34 : Weights.Entry :=
  { word := [12, 8, 12, 10, 8, 8, 12], weights := [0, 1, 0, 1] }

def points34 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 9055, representative 9755.
def source35 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B004.Data.entryAt ⟨51, by decide +kernel⟩

def target35 : Weights.Entry :=
  { word := [12, 12, 4, 8, 8, 2, 10], weights := [0, 1, 1, 0] }

def points35 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 9057, representative 9753.
def source36 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B004.Data.entryAt ⟨49, by decide +kernel⟩

def target36 : Weights.Entry :=
  { word := [12, 12, 4, 8, 8, 10, 10], weights := [0, 1, 1, 0] }

-- Period 10, original row 9071, representative 9757.
def source37 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B004.Data.entryAt ⟨53, by decide +kernel⟩

def target37 : Weights.Entry :=
  { word := [12, 12, 8, 8, 2, 2, 10], weights := [0, 1, 1, 0] }

def points37 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 9073, representative 9753.
def source38 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B004.Data.entryAt ⟨49, by decide +kernel⟩

def target38 : Weights.Entry :=
  { word := [12, 12, 8, 8, 2, 10, 10], weights := [0, 1, 1, 0] }

def points38 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 9080, representative 9756.
def source39 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B004.Data.entryAt ⟨52, by decide +kernel⟩

def target39 : Weights.Entry :=
  { word := [12, 12, 8, 8, 10, 2, 10], weights := [0, 1, 1, 0] }

def points39 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 9082, representative 9752.
def source40 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B004.Data.entryAt ⟨48, by decide +kernel⟩

def target40 : Weights.Entry :=
  { word := [12, 12, 8, 8, 10, 10, 10], weights := [0, 1, 1, 0] }

-- Period 10, original row 9085, representative 9754.
def source41 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B004.Data.entryAt ⟨50, by decide +kernel⟩

def target41 : Weights.Entry :=
  { word := [12, 12, 12, 8, 8, 2, 10], weights := [0, 1, 1, 0] }

def points41 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 9087, representative 9752.
def source42 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B004.Data.entryAt ⟨48, by decide +kernel⟩

def target42 : Weights.Entry :=
  { word := [12, 12, 12, 8, 8, 10, 10], weights := [0, 1, 1, 0] }

def points42 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

def period10Entries : List Weights.Entry := [target0, target1, target2, target3, target4, target5, target6, target7, target8, target9, target10, target11, target12, target13, target14, target15, target16, target17, target18, target19, target20, target21, target22, target23, target24, target25, target26, target27, target28, target29, target30, target31, target32, target33, target34, target35, target36, target37, target38, target39, target40, target41, target42]

def period10Chunk : RowCoverage.Chunk where
  rows := [⟨8599, target0⟩, ⟨8606, target1⟩, ⟨8616, target2⟩, ⟨8629, target3⟩, ⟨8654, target4⟩, ⟨8656, target5⟩, ⟨8662, target6⟩, ⟨8690, target7⟩, ⟨8692, target8⟩, ⟨8706, target9⟩, ⟨8708, target10⟩, ⟨8715, target11⟩, ⟨8717, target12⟩, ⟨8720, target13⟩, ⟨8722, target14⟩, ⟨8745, target15⟩, ⟨8771, target16⟩, ⟨8789, target17⟩, ⟨8814, target18⟩, ⟨8827, target19⟩, ⟨8828, target20⟩, ⟨8829, target21⟩, ⟨8837, target22⟩, ⟨8862, target23⟩, ⟨8863, target24⟩, ⟨8864, target25⟩, ⟨8871, target26⟩, ⟨8935, target27⟩, ⟨8936, target28⟩, ⟨8937, target29⟩, ⟨8945, target30⟩, ⟨8970, target31⟩, ⟨8971, target32⟩, ⟨8972, target33⟩, ⟨8979, target34⟩, ⟨9055, target35⟩, ⟨9057, target36⟩, ⟨9071, target37⟩, ⟨9073, target38⟩, ⟨9080, target39⟩, ⟨9082, target40⟩, ⟨9085, target41⟩, ⟨9087, target42⟩]
  indexMask := 371424268557712370303544177869682132576467376124458463980020071365781442777024183777549752113060601953255444180087924994996220820881859848152989876306621489934433212837592158191262253531756441436682424835679886437401055791521102498604105116818207937647299814287305196359884912446602600586685509870211167447472697257658378727127059701703204056009819812407262399084426262919272829237115389985109341017769478872117859474754693586788311761844332114647738604479115456819372932478883108100440845987954321567028807761075894790042114066163099473916285174661497771502528158457557877851153543771876233455710115230002604626543127954216237387670542779804958038419423959580578236761642922866584540623611891900126450141286890990806256492782237344066834458891140004203114997006137296214905893631361124558820008838521637162637463050189390741540233164608628553945137186717836652211368658794490197927123939016614683502411856768281127097701314290378568162403303851717439762115932870148906326262130993726722179691715695562821501063197557870335517547604257182376378756073222343629433895714503569259292730498235149848334820122885913274026968474434014162619150478834543593282876243069468395685619994126161653071450264709890664811199701188012439934786735843607091649819686111597330930911117709549055846064463618021128383008362765509436407400507017152650512946853035284357051136787856159790621581972284144808353739683023710863739727478280205754653412678236551917424455311166336336743742032800632838496910198577494410266701893525416071476007933294693156266709183318085089275848510423821018556523612809383590930637097320672973114177254763220058017321619045991759110930403032728148181668234082245838226063571915660809275519687719077136427509553214548852033355038026549912422979959639967158471669744750309148596166910163177590785427537188950031305644125558594566603957184547847433780451789253310022494264266393294935434093701198755342653009984133505989109198418192594177270529280985168332943881600643900542368770661160290795222299547017159388465067569392279463729159176037584361592240576118448421477108922238554870182680050518638855723974175942443675611287482296773129832790029315002486365140837246741591022689014818686868272097273288739645545210781953191133372127367743866767985191248571868707800816401555747558796667930737625541533102359334914203940118989902497942742198394392675557115254504986210962042806656831254519974818209305583232066492235404900126364622417886196219685267122489182949521907391020172515009238535223636178856634301056754805182543037388374163087334802957291118707220330367289238700962669123791115059179808105214892052447054926965859319724216193152351922824763062016165471063065334299572449653766218711070043711713634707446551592826555164786688
  count := 43

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

end FranklSmallCyclic.TransportBatches.G082.B001.Data
