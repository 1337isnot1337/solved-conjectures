module

public import Conjectures.FranklSmallCyclicRowCoverage
public import Conjectures.FranklSmallCyclicCanonicalWords
public import Conjectures.FranklSmallCyclicOrbit7Block025Data

/-! 128 literal targets sharing one source proof block.
Original words and row indices are retained; weights may be transported.
-/
@[expose] public section

namespace FranklSmallCyclic.TransportBatches.G025.B002.Data

-- Period 7, original row 5608, representative 3234.
def source0 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨17, by decide +kernel⟩

def target0 : Weights.Entry :=
  { word := [8, 8, 4, 8, 4, 2, 0], weights := [0, 1, 1, 0] }

def points0 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 5610, representative 3232.
def source1 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨15, by decide +kernel⟩

def target1 : Weights.Entry :=
  { word := [8, 8, 4, 8, 4, 10, 0], weights := [0, 1, 1, 0] }

def points1 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 5612, representative 3233.
def source2 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨16, by decide +kernel⟩

def target2 : Weights.Entry :=
  { word := [8, 8, 4, 8, 12, 2, 0], weights := [0, 1, 1, 0] }

def points2 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 5614, representative 3231.
def source3 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨14, by decide +kernel⟩

def target3 : Weights.Entry :=
  { word := [8, 8, 4, 8, 12, 10, 0], weights := [0, 1, 1, 0] }

def points3 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 5636, representative 3238.
def source4 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨21, by decide +kernel⟩

def target4 : Weights.Entry :=
  { word := [8, 8, 4, 12, 4, 8, 0], weights := [0, 0, 1, 0] }

def points4 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 5639, representative 3237.
def source5 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨20, by decide +kernel⟩

def target5 : Weights.Entry :=
  { word := [8, 8, 4, 12, 12, 8, 0], weights := [0, 0, 1, 0] }

def points5 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 5671, representative 3260.
def source6 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨43, by decide +kernel⟩

def target6 : Weights.Entry :=
  { word := [8, 8, 8, 1, 4, 2, 0], weights := [1, 0, 1, 0] }

def points6 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 5675, representative 3261.
def source7 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨44, by decide +kernel⟩

def target7 : Weights.Entry :=
  { word := [8, 8, 8, 1, 4, 10, 0], weights := [1, 0, 1, 0] }

def points7 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 5677, representative 3263.
def source8 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨46, by decide +kernel⟩

def target8 : Weights.Entry :=
  { word := [8, 8, 8, 1, 12, 2, 0], weights := [1, 0, 1, 0] }

def points8 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 5681, representative 3262.
def source9 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨45, by decide +kernel⟩

def target9 : Weights.Entry :=
  { word := [8, 8, 8, 1, 12, 10, 0], weights := [1, 0, 1, 0] }

def points9 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 5683, representative 3253.
def source10 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨36, by decide +kernel⟩

def target10 : Weights.Entry :=
  { word := [8, 8, 8, 2, 2, 2, 0], weights := [0, 1, 0, 1] }

def points10 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 5685, representative 3254.
def source11 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨37, by decide +kernel⟩

def target11 : Weights.Entry :=
  { word := [8, 8, 8, 2, 2, 10, 0], weights := [0, 1, 0, 1] }

def points11 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 5687, representative 3256.
def source12 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨39, by decide +kernel⟩

def target12 : Weights.Entry :=
  { word := [8, 8, 8, 2, 10, 2, 0], weights := [0, 1, 0, 1] }

def points12 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 5689, representative 3255.
def source13 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨38, by decide +kernel⟩

def target13 : Weights.Entry :=
  { word := [8, 8, 8, 2, 10, 10, 0], weights := [0, 1, 0, 1] }

def points13 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 5695, representative 3252.
def source14 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨35, by decide +kernel⟩

def target14 : Weights.Entry :=
  { word := [8, 8, 8, 4, 6, 0, 0], weights := [0, 0, 1, 0] }

def points14 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 5697, representative 3250.
def source15 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨33, by decide +kernel⟩

def target15 : Weights.Entry :=
  { word := [8, 8, 8, 4, 6, 8, 0], weights := [0, 0, 1, 0] }

def points15 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 5708, representative 3249.
def source16 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨32, by decide +kernel⟩

def target16 : Weights.Entry :=
  { word := [8, 8, 8, 8, 6, 2, 0], weights := [0, 1, 1, 0] }

def points16 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 5710, representative 3248.
def source17 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨31, by decide +kernel⟩

def target17 : Weights.Entry :=
  { word := [8, 8, 8, 8, 6, 10, 0], weights := [0, 1, 1, 0] }

def points17 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 5730, representative 3251.
def source18 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨34, by decide +kernel⟩

def target18 : Weights.Entry :=
  { word := [8, 8, 8, 12, 6, 8, 0], weights := [0, 0, 1, 0] }

def points18 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 5782, representative 3228.
def source19 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨11, by decide +kernel⟩

def target19 : Weights.Entry :=
  { word := [8, 8, 12, 2, 0, 1, 0], weights := [0, 1, 0, 0] }

def points19 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 5784, representative 3224.
def source20 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨7, by decide +kernel⟩

def target20 : Weights.Entry :=
  { word := [8, 8, 12, 2, 0, 2, 0], weights := [0, 1, 0, 0] }

def points20 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 5786, representative 3230.
def source21 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨13, by decide +kernel⟩

def target21 : Weights.Entry :=
  { word := [8, 8, 12, 2, 0, 8, 0], weights := [0, 1, 0, 0] }

def points21 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 5794, representative 3229.
def source22 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨12, by decide +kernel⟩

def target22 : Weights.Entry :=
  { word := [8, 8, 12, 2, 0, 9, 0], weights := [0, 1, 0, 0] }

def points22 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 5796, representative 3225.
def source23 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨8, by decide +kernel⟩

def target23 : Weights.Entry :=
  { word := [8, 8, 12, 2, 0, 10, 0], weights := [0, 1, 0, 0] }

def points23 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 5798, representative 3227.
def source24 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨10, by decide +kernel⟩

def target24 : Weights.Entry :=
  { word := [8, 8, 12, 2, 8, 2, 0], weights := [0, 1, 0, 0] }

def points24 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 5802, representative 3226.
def source25 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨9, by decide +kernel⟩

def target25 : Weights.Entry :=
  { word := [8, 8, 12, 2, 8, 10, 0], weights := [0, 1, 0, 0] }

def points25 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 5804, representative 3222.
def source26 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨5, by decide +kernel⟩

def target26 : Weights.Entry :=
  { word := [8, 8, 12, 4, 4, 0, 0], weights := [0, 0, 1, 0] }

def points26 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 5806, representative 3218.
def source27 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨1, by decide +kernel⟩

def target27 : Weights.Entry :=
  { word := [8, 8, 12, 4, 4, 8, 0], weights := [0, 0, 1, 0] }

def points27 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 5808, representative 3223.
def source28 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨6, by decide +kernel⟩

def target28 : Weights.Entry :=
  { word := [8, 8, 12, 4, 12, 0, 0], weights := [0, 0, 1, 0] }

def points28 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 5810, representative 3219.
def source29 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨2, by decide +kernel⟩

def target29 : Weights.Entry :=
  { word := [8, 8, 12, 4, 12, 8, 0], weights := [0, 0, 1, 0] }

def points29 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 5815, representative 3217.
def source30 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨0, by decide +kernel⟩

def target30 : Weights.Entry :=
  { word := [8, 8, 12, 8, 4, 2, 0], weights := [0, 1, 1, 0] }

def points30 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 5843, representative 3221.
def source31 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨4, by decide +kernel⟩

def target31 : Weights.Entry :=
  { word := [8, 8, 12, 12, 4, 8, 0], weights := [0, 0, 1, 0] }

def points31 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 5846, representative 3220.
def source32 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨3, by decide +kernel⟩

def target32 : Weights.Entry :=
  { word := [8, 8, 12, 12, 12, 8, 0], weights := [0, 0, 1, 0] }

def points32 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 6755, representative 3289.
def source33 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨72, by decide +kernel⟩

def target33 : Weights.Entry :=
  { word := [9, 0, 4, 2, 0, 1, 0], weights := [0, 0, 0, 1] }

def points33 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 4), (4, 5), (5, 6), (6, 3)]

-- Period 7, original row 6757, representative 3289.
def source34 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨72, by decide +kernel⟩

def target34 : Weights.Entry :=
  { word := [9, 0, 4, 2, 0, 2, 0], weights := [0, 0, 0, 1] }

def points34 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 2), (3, 4), (4, 5), (5, 6), (6, 3)]

-- Period 7, original row 6759, representative 3292.
def source35 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨75, by decide +kernel⟩

def target35 : Weights.Entry :=
  { word := [9, 0, 4, 2, 0, 8, 0], weights := [0, 1, 0, 0] }

def points35 : List (ℕ × ℕ) := [(0, 2), (1, 0), (2, 1), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 6767, representative 3276.
def source36 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨59, by decide +kernel⟩

def target36 : Weights.Entry :=
  { word := [9, 0, 4, 2, 0, 9, 0], weights := [0, 1, 0, 0] }

def points36 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 6769, representative 3276.
def source37 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨59, by decide +kernel⟩

def target37 : Weights.Entry :=
  { word := [9, 0, 4, 2, 0, 10, 0], weights := [0, 1, 0, 0] }

def points37 : List (ℕ × ℕ) := [(0, 2), (1, 0), (2, 1), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 6771, representative 3291.
def source38 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨74, by decide +kernel⟩

def target38 : Weights.Entry :=
  { word := [9, 0, 4, 2, 8, 2, 0], weights := [0, 0, 0, 1] }

def points38 : List (ℕ × ℕ) := [(0, 1), (1, 2), (2, 0), (3, 4), (4, 5), (5, 6), (6, 3)]

-- Period 7, original row 6775, representative 3277.
def source39 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨60, by decide +kernel⟩

def target39 : Weights.Entry :=
  { word := [9, 0, 4, 2, 8, 10, 0], weights := [0, 1, 0, 0] }

def points39 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 6777, representative 3289.
def source40 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨72, by decide +kernel⟩

def target40 : Weights.Entry :=
  { word := [9, 0, 4, 4, 4, 0, 0], weights := [0, 0, 0, 1] }

def points40 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 5), (4, 4), (5, 6), (6, 3)]

-- Period 7, original row 6779, representative 3287.
def source41 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨70, by decide +kernel⟩

def target41 : Weights.Entry :=
  { word := [9, 0, 4, 4, 4, 8, 0], weights := [0, 0, 1, 0] }

def points41 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 6785, representative 3286.
def source42 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨69, by decide +kernel⟩

def target42 : Weights.Entry :=
  { word := [9, 0, 4, 8, 4, 2, 0], weights := [0, 0, 1, 1] }

def points42 : List (ℕ × ℕ) := [(0, 1), (1, 2), (2, 0), (3, 4), (4, 5), (5, 6), (6, 3)]

-- Period 7, original row 6787, representative 3271.
def source43 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨54, by decide +kernel⟩

def target43 : Weights.Entry :=
  { word := [9, 0, 4, 8, 4, 10, 0], weights := [0, 1, 1, 0] }

def points43 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 6815, representative 3288.
def source44 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨71, by decide +kernel⟩

def target44 : Weights.Entry :=
  { word := [9, 0, 4, 12, 4, 8, 0], weights := [0, 0, 1, 0] }

def points44 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 6817, representative 3290.
def source45 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨73, by decide +kernel⟩

def target45 : Weights.Entry :=
  { word := [9, 0, 8, 1, 4, 2, 0], weights := [1, 1, 0, 0] }

def points45 : List (ℕ × ℕ) := [(0, 2), (1, 0), (2, 1), (3, 6), (4, 4), (5, 5), (6, 3)]

-- Period 7, original row 6818, representative 3273.
def source46 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨56, by decide +kernel⟩

def target46 : Weights.Entry :=
  { word := [9, 0, 8, 1, 4, 10, 0], weights := [1, 0, 1, 0] }

def points46 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 6819, representative 3284.
def source47 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨67, by decide +kernel⟩

def target47 : Weights.Entry :=
  { word := [9, 0, 8, 2, 2, 2, 0], weights := [0, 1, 0, 1] }

def points47 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 6821, representative 3268.
def source48 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨51, by decide +kernel⟩

def target48 : Weights.Entry :=
  { word := [9, 0, 8, 2, 2, 10, 0], weights := [0, 1, 0, 1] }

def points48 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 6823, representative 3285.
def source49 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨68, by decide +kernel⟩

def target49 : Weights.Entry :=
  { word := [9, 0, 8, 2, 10, 2, 0], weights := [0, 1, 0, 1] }

def points49 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 6825, representative 3269.
def source50 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨52, by decide +kernel⟩

def target50 : Weights.Entry :=
  { word := [9, 0, 8, 2, 10, 10, 0], weights := [0, 1, 0, 1] }

def points50 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 6898, representative 3281.
def source51 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨64, by decide +kernel⟩

def target51 : Weights.Entry :=
  { word := [9, 0, 12, 2, 0, 1, 0], weights := [0, 1, 0, 0] }

def points51 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 6900, representative 3281.
def source52 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨64, by decide +kernel⟩

def target52 : Weights.Entry :=
  { word := [9, 0, 12, 2, 0, 2, 0], weights := [0, 1, 0, 0] }

def points52 : List (ℕ × ℕ) := [(0, 2), (1, 0), (2, 1), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 6902, representative 3283.
def source53 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨66, by decide +kernel⟩

def target53 : Weights.Entry :=
  { word := [9, 0, 12, 2, 0, 8, 0], weights := [0, 1, 0, 0] }

def points53 : List (ℕ × ℕ) := [(0, 2), (1, 0), (2, 1), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 6910, representative 3274.
def source54 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨57, by decide +kernel⟩

def target54 : Weights.Entry :=
  { word := [9, 0, 12, 2, 0, 9, 0], weights := [0, 1, 0, 0] }

def points54 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 6912, representative 3274.
def source55 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨57, by decide +kernel⟩

def target55 : Weights.Entry :=
  { word := [9, 0, 12, 2, 0, 10, 0], weights := [0, 1, 0, 0] }

def points55 : List (ℕ × ℕ) := [(0, 2), (1, 0), (2, 1), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 6914, representative 3282.
def source56 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨65, by decide +kernel⟩

def target56 : Weights.Entry :=
  { word := [9, 0, 12, 2, 8, 2, 0], weights := [0, 1, 0, 0] }

def points56 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 6918, representative 3275.
def source57 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨58, by decide +kernel⟩

def target57 : Weights.Entry :=
  { word := [9, 0, 12, 2, 8, 10, 0], weights := [0, 1, 0, 0] }

def points57 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 6920, representative 3281.
def source58 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨64, by decide +kernel⟩

def target58 : Weights.Entry :=
  { word := [9, 0, 12, 4, 4, 0, 0], weights := [0, 0, 1, 0] }

def points58 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 4), (5, 5), (6, 3)]

-- Period 7, original row 6922, representative 3279.
def source59 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨62, by decide +kernel⟩

def target59 : Weights.Entry :=
  { word := [9, 0, 12, 4, 4, 8, 0], weights := [0, 0, 1, 0] }

def points59 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 6927, representative 3278.
def source60 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨61, by decide +kernel⟩

def target60 : Weights.Entry :=
  { word := [9, 0, 12, 8, 4, 2, 0], weights := [0, 1, 1, 0] }

def points60 : List (ℕ × ℕ) := [(0, 2), (1, 0), (2, 1), (3, 6), (4, 4), (5, 5), (6, 3)]

-- Period 7, original row 6929, representative 3270.
def source61 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨53, by decide +kernel⟩

def target61 : Weights.Entry :=
  { word := [9, 0, 12, 8, 4, 10, 0], weights := [0, 1, 1, 0] }

def points61 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 6961, representative 3280.
def source62 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨63, by decide +kernel⟩

def target62 : Weights.Entry :=
  { word := [9, 0, 12, 12, 4, 8, 0], weights := [0, 0, 1, 0] }

def points62 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 7191, representative 3239.
def source63 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨22, by decide +kernel⟩

def target63 : Weights.Entry :=
  { word := [9, 8, 4, 4, 4, 0, 0], weights := [0, 0, 1, 0] }

def points63 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 7193, representative 3235.
def source64 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨18, by decide +kernel⟩

def target64 : Weights.Entry :=
  { word := [9, 8, 4, 4, 4, 8, 0], weights := [0, 0, 1, 0] }

def points64 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 7195, representative 3240.
def source65 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨23, by decide +kernel⟩

def target65 : Weights.Entry :=
  { word := [9, 8, 4, 4, 12, 0, 0], weights := [0, 0, 1, 0] }

def points65 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 7197, representative 3236.
def source66 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨19, by decide +kernel⟩

def target66 : Weights.Entry :=
  { word := [9, 8, 4, 4, 12, 8, 0], weights := [0, 0, 1, 0] }

def points66 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 7204, representative 3238.
def source67 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨21, by decide +kernel⟩

def target67 : Weights.Entry :=
  { word := [9, 8, 4, 12, 4, 8, 0], weights := [0, 0, 1, 0] }

def points67 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 7207, representative 3237.
def source68 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨20, by decide +kernel⟩

def target68 : Weights.Entry :=
  { word := [9, 8, 4, 12, 12, 8, 0], weights := [0, 0, 1, 0] }

def points68 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 7213, representative 3252.
def source69 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨35, by decide +kernel⟩

def target69 : Weights.Entry :=
  { word := [9, 8, 8, 4, 6, 0, 0], weights := [0, 0, 1, 0] }

def points69 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 7215, representative 3250.
def source70 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨33, by decide +kernel⟩

def target70 : Weights.Entry :=
  { word := [9, 8, 8, 4, 6, 8, 0], weights := [0, 0, 1, 0] }

def points70 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 7230, representative 3251.
def source71 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨34, by decide +kernel⟩

def target71 : Weights.Entry :=
  { word := [9, 8, 8, 12, 6, 8, 0], weights := [0, 0, 1, 0] }

def points71 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 7282, representative 3222.
def source72 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨5, by decide +kernel⟩

def target72 : Weights.Entry :=
  { word := [9, 8, 12, 4, 4, 0, 0], weights := [0, 0, 1, 0] }

def points72 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 7284, representative 3218.
def source73 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨1, by decide +kernel⟩

def target73 : Weights.Entry :=
  { word := [9, 8, 12, 4, 4, 8, 0], weights := [0, 0, 1, 0] }

def points73 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 7286, representative 3223.
def source74 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨6, by decide +kernel⟩

def target74 : Weights.Entry :=
  { word := [9, 8, 12, 4, 12, 0, 0], weights := [0, 0, 1, 0] }

def points74 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 7288, representative 3219.
def source75 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨2, by decide +kernel⟩

def target75 : Weights.Entry :=
  { word := [9, 8, 12, 4, 12, 8, 0], weights := [0, 0, 1, 0] }

def points75 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 7294, representative 3221.
def source76 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨4, by decide +kernel⟩

def target76 : Weights.Entry :=
  { word := [9, 8, 12, 12, 4, 8, 0], weights := [0, 0, 1, 0] }

def points76 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 7297, representative 3220.
def source77 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨3, by decide +kernel⟩

def target77 : Weights.Entry :=
  { word := [9, 8, 12, 12, 12, 8, 0], weights := [0, 0, 1, 0] }

def points77 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 8, original row 53, representative 3304.
def source78 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨87, by decide +kernel⟩

def target78 : Weights.Entry :=
  { word := [0, 0, 2, 2, 2, 8, 0], weights := [0, 1, 0, 0] }

def points78 : List (ℕ × ℕ) := [(0, 7), (1, 0), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 8, original row 68, representative 3303.
def source79 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨86, by decide +kernel⟩

def target79 : Weights.Entry :=
  { word := [0, 0, 2, 2, 10, 8, 0], weights := [0, 1, 0, 0] }

def points79 : List (ℕ × ℕ) := [(0, 7), (1, 0), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 8, original row 76, representative 3296.
def source80 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨79, by decide +kernel⟩

def target80 : Weights.Entry :=
  { word := [0, 0, 6, 2, 0, 8, 0], weights := [1, 0, 0, 0] }

def points80 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 8, original row 84, representative 3295.
def source81 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨78, by decide +kernel⟩

def target81 : Weights.Entry :=
  { word := [0, 0, 6, 2, 8, 8, 0], weights := [0, 1, 0, 0] }

def points81 : List (ℕ × ℕ) := [(0, 7), (1, 0), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 8, original row 104, representative 3302.
def source82 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨85, by decide +kernel⟩

def target82 : Weights.Entry :=
  { word := [0, 0, 10, 2, 2, 8, 0], weights := [0, 1, 0, 0] }

def points82 : List (ℕ × ℕ) := [(0, 7), (1, 0), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 8, original row 112, representative 3301.
def source83 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨84, by decide +kernel⟩

def target83 : Weights.Entry :=
  { word := [0, 0, 10, 2, 10, 8, 0], weights := [0, 1, 0, 0] }

def points83 : List (ℕ × ℕ) := [(0, 7), (1, 0), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 8, original row 509, representative 3289.
def source84 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨72, by decide +kernel⟩

def target84 : Weights.Entry :=
  { word := [0, 4, 0, 4, 2, 0, 8], weights := [0, 0, 1, 0] }

def points84 : List (ℕ × ℕ) := [(0, 7), (1, 0), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 8, original row 515, representative 3245.
def source85 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨28, by decide +kernel⟩

def target85 : Weights.Entry :=
  { word := [0, 4, 0, 4, 2, 8, 8], weights := [0, 0, 1, 0] }

def points85 : List (ℕ × ℕ) := [(0, 7), (1, 0), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 8, original row 531, representative 3281.
def source86 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨64, by decide +kernel⟩

def target86 : Weights.Entry :=
  { word := [0, 4, 0, 4, 10, 0, 8], weights := [0, 0, 1, 0] }

def points86 : List (ℕ × ℕ) := [(0, 7), (1, 0), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 8, original row 537, representative 3228.
def source87 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨11, by decide +kernel⟩

def target87 : Weights.Entry :=
  { word := [0, 4, 0, 4, 10, 8, 8], weights := [0, 0, 1, 0] }

def points87 : List (ℕ × ℕ) := [(0, 7), (1, 0), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 8, original row 827, representative 3296.
def source88 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨79, by decide +kernel⟩

def target88 : Weights.Entry :=
  { word := [0, 8, 0, 4, 6, 0, 0], weights := [0, 0, 1, 0] }

def points88 : List (ℕ × ℕ) := [(0, 1), (1, 2), (2, 7), (3, 5), (4, 6), (5, 4), (6, 3)]

-- Period 8, original row 996, representative 3304.
def source89 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨87, by decide +kernel⟩

def target89 : Weights.Entry :=
  { word := [0, 8, 4, 4, 4, 0, 0], weights := [0, 0, 1, 0] }

def points89 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 8, original row 1000, representative 3302.
def source90 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨85, by decide +kernel⟩

def target90 : Weights.Entry :=
  { word := [0, 8, 4, 4, 12, 0, 0], weights := [0, 0, 1, 0] }

def points90 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 8, original row 1046, representative 3295.
def source91 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨78, by decide +kernel⟩

def target91 : Weights.Entry :=
  { word := [0, 8, 8, 4, 6, 0, 0], weights := [0, 0, 1, 0] }

def points91 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 8, original row 1110, representative 3303.
def source92 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨86, by decide +kernel⟩

def target92 : Weights.Entry :=
  { word := [0, 8, 12, 4, 4, 0, 0], weights := [0, 0, 1, 0] }

def points92 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 8, original row 1114, representative 3301.
def source93 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨84, by decide +kernel⟩

def target93 : Weights.Entry :=
  { word := [0, 8, 12, 4, 12, 0, 0], weights := [0, 0, 1, 0] }

def points93 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 8, original row 1790, representative 3304.
def source94 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨87, by decide +kernel⟩

def target94 : Weights.Entry :=
  { word := [1, 0, 2, 2, 2, 8, 0], weights := [0, 1, 0, 0] }

def points94 : List (ℕ × ℕ) := [(0, 7), (1, 0), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 8, original row 1805, representative 3303.
def source95 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨86, by decide +kernel⟩

def target95 : Weights.Entry :=
  { word := [1, 0, 2, 2, 10, 8, 0], weights := [0, 1, 0, 0] }

def points95 : List (ℕ × ℕ) := [(0, 7), (1, 0), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 8, original row 1825, representative 3302.
def source96 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨85, by decide +kernel⟩

def target96 : Weights.Entry :=
  { word := [1, 0, 10, 2, 2, 8, 0], weights := [0, 1, 0, 0] }

def points96 : List (ℕ × ℕ) := [(0, 7), (1, 0), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 8, original row 1833, representative 3301.
def source97 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨84, by decide +kernel⟩

def target97 : Weights.Entry :=
  { word := [1, 0, 10, 2, 10, 8, 0], weights := [0, 1, 0, 0] }

def points97 : List (ℕ × ℕ) := [(0, 7), (1, 0), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 8, original row 2126, representative 3304.
def source98 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨87, by decide +kernel⟩

def target98 : Weights.Entry :=
  { word := [1, 8, 4, 4, 4, 0, 0], weights := [0, 0, 1, 0] }

def points98 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 8, original row 2130, representative 3302.
def source99 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨85, by decide +kernel⟩

def target99 : Weights.Entry :=
  { word := [1, 8, 4, 4, 12, 0, 0], weights := [0, 0, 1, 0] }

def points99 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 8, original row 2138, representative 3295.
def source100 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨78, by decide +kernel⟩

def target100 : Weights.Entry :=
  { word := [1, 8, 8, 4, 6, 0, 0], weights := [0, 0, 1, 0] }

def points100 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 8, original row 2192, representative 3303.
def source101 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨86, by decide +kernel⟩

def target101 : Weights.Entry :=
  { word := [1, 8, 12, 4, 4, 0, 0], weights := [0, 0, 1, 0] }

def points101 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 8, original row 2196, representative 3301.
def source102 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨84, by decide +kernel⟩

def target102 : Weights.Entry :=
  { word := [1, 8, 12, 4, 12, 0, 0], weights := [0, 0, 1, 0] }

def points102 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 8, original row 4255, representative 3289.
def source103 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨72, by decide +kernel⟩

def target103 : Weights.Entry :=
  { word := [8, 0, 4, 2, 0, 2, 0], weights := [0, 0, 0, 1] }

def points103 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 4), (4, 5), (5, 6), (6, 3)]

-- Period 8, original row 4428, representative 3281.
def source104 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨64, by decide +kernel⟩

def target104 : Weights.Entry :=
  { word := [8, 0, 12, 2, 0, 2, 0], weights := [0, 1, 0, 0] }

def points104 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 8, original row 5576, representative 3245.
def source105 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨28, by decide +kernel⟩

def target105 : Weights.Entry :=
  { word := [8, 8, 4, 2, 0, 2, 0], weights := [0, 1, 0, 0] }

def points105 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 8, original row 5784, representative 3228.
def source106 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨11, by decide +kernel⟩

def target106 : Weights.Entry :=
  { word := [8, 8, 12, 2, 0, 2, 0], weights := [0, 1, 0, 0] }

def points106 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 8, original row 6757, representative 3289.
def source107 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨72, by decide +kernel⟩

def target107 : Weights.Entry :=
  { word := [9, 0, 4, 2, 0, 2, 0], weights := [0, 0, 0, 1] }

def points107 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 4), (4, 5), (5, 6), (6, 3)]

-- Period 8, original row 6900, representative 3281.
def source108 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨64, by decide +kernel⟩

def target108 : Weights.Entry :=
  { word := [9, 0, 12, 2, 0, 2, 0], weights := [0, 1, 0, 0] }

def points108 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 9, original row 53, representative 3304.
def source109 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨87, by decide +kernel⟩

def target109 : Weights.Entry :=
  { word := [0, 0, 2, 2, 2, 8, 0], weights := [0, 1, 0, 0] }

def points109 : List (ℕ × ℕ) := [(0, 7), (1, 8), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 9, original row 68, representative 3303.
def source110 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨86, by decide +kernel⟩

def target110 : Weights.Entry :=
  { word := [0, 0, 2, 2, 10, 8, 0], weights := [0, 1, 0, 0] }

def points110 : List (ℕ × ℕ) := [(0, 7), (1, 8), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 9, original row 76, representative 3296.
def source111 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨79, by decide +kernel⟩

def target111 : Weights.Entry :=
  { word := [0, 0, 6, 2, 0, 8, 0], weights := [1, 0, 0, 0] }

def points111 : List (ℕ × ℕ) := [(0, 7), (1, 8), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 9, original row 84, representative 3295.
def source112 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨78, by decide +kernel⟩

def target112 : Weights.Entry :=
  { word := [0, 0, 6, 2, 8, 8, 0], weights := [0, 1, 0, 0] }

def points112 : List (ℕ × ℕ) := [(0, 7), (1, 8), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 9, original row 104, representative 3302.
def source113 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨85, by decide +kernel⟩

def target113 : Weights.Entry :=
  { word := [0, 0, 10, 2, 2, 8, 0], weights := [0, 1, 0, 0] }

def points113 : List (ℕ × ℕ) := [(0, 7), (1, 8), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 9, original row 112, representative 3301.
def source114 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨84, by decide +kernel⟩

def target114 : Weights.Entry :=
  { word := [0, 0, 10, 2, 10, 8, 0], weights := [0, 1, 0, 0] }

def points114 : List (ℕ × ℕ) := [(0, 7), (1, 8), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 9, original row 827, representative 3296.
def source115 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨79, by decide +kernel⟩

def target115 : Weights.Entry :=
  { word := [0, 8, 0, 4, 6, 0, 0], weights := [0, 0, 1, 0] }

def points115 : List (ℕ × ℕ) := [(0, 1), (1, 2), (2, 7), (3, 5), (4, 6), (5, 4), (6, 3)]

-- Period 9, original row 996, representative 3304.
def source116 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨87, by decide +kernel⟩

def target116 : Weights.Entry :=
  { word := [0, 8, 4, 4, 4, 0, 0], weights := [0, 0, 1, 0] }

def points116 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 9, original row 1000, representative 3302.
def source117 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨85, by decide +kernel⟩

def target117 : Weights.Entry :=
  { word := [0, 8, 4, 4, 12, 0, 0], weights := [0, 0, 1, 0] }

def points117 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 9, original row 1046, representative 3295.
def source118 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨78, by decide +kernel⟩

def target118 : Weights.Entry :=
  { word := [0, 8, 8, 4, 6, 0, 0], weights := [0, 0, 1, 0] }

def points118 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 9, original row 1110, representative 3303.
def source119 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨86, by decide +kernel⟩

def target119 : Weights.Entry :=
  { word := [0, 8, 12, 4, 4, 0, 0], weights := [0, 0, 1, 0] }

def points119 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 9, original row 1114, representative 3301.
def source120 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨84, by decide +kernel⟩

def target120 : Weights.Entry :=
  { word := [0, 8, 12, 4, 12, 0, 0], weights := [0, 0, 1, 0] }

def points120 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 9, original row 1790, representative 3304.
def source121 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨87, by decide +kernel⟩

def target121 : Weights.Entry :=
  { word := [1, 0, 2, 2, 2, 8, 0], weights := [0, 1, 0, 0] }

def points121 : List (ℕ × ℕ) := [(0, 7), (1, 8), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 9, original row 1805, representative 3303.
def source122 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨86, by decide +kernel⟩

def target122 : Weights.Entry :=
  { word := [1, 0, 2, 2, 10, 8, 0], weights := [0, 1, 0, 0] }

def points122 : List (ℕ × ℕ) := [(0, 7), (1, 8), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 9, original row 1825, representative 3302.
def source123 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨85, by decide +kernel⟩

def target123 : Weights.Entry :=
  { word := [1, 0, 10, 2, 2, 8, 0], weights := [0, 1, 0, 0] }

def points123 : List (ℕ × ℕ) := [(0, 7), (1, 8), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 9, original row 1833, representative 3301.
def source124 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨84, by decide +kernel⟩

def target124 : Weights.Entry :=
  { word := [1, 0, 10, 2, 10, 8, 0], weights := [0, 1, 0, 0] }

def points124 : List (ℕ × ℕ) := [(0, 7), (1, 8), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 9, original row 2126, representative 3304.
def source125 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨87, by decide +kernel⟩

def target125 : Weights.Entry :=
  { word := [1, 8, 4, 4, 4, 0, 0], weights := [0, 0, 1, 0] }

def points125 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 9, original row 2130, representative 3302.
def source126 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨85, by decide +kernel⟩

def target126 : Weights.Entry :=
  { word := [1, 8, 4, 4, 12, 0, 0], weights := [0, 0, 1, 0] }

def points126 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 9, original row 2138, representative 3295.
def source127 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨78, by decide +kernel⟩

def target127 : Weights.Entry :=
  { word := [1, 8, 8, 4, 6, 0, 0], weights := [0, 0, 1, 0] }

def points127 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3)]

def period7Entries : List Weights.Entry := [target0, target1, target2, target3, target4, target5, target6, target7, target8, target9, target10, target11, target12, target13, target14, target15, target16, target17, target18, target19, target20, target21, target22, target23, target24, target25, target26, target27, target28, target29, target30, target31, target32, target33, target34, target35, target36, target37, target38, target39, target40, target41, target42, target43, target44, target45, target46, target47, target48, target49, target50, target51, target52, target53, target54, target55, target56, target57, target58, target59, target60, target61, target62, target63, target64, target65, target66, target67, target68, target69, target70, target71, target72, target73, target74, target75, target76, target77]

def period7Chunk : RowCoverage.Chunk where
  rows := [⟨5608, target0⟩, ⟨5610, target1⟩, ⟨5612, target2⟩, ⟨5614, target3⟩, ⟨5636, target4⟩, ⟨5639, target5⟩, ⟨5671, target6⟩, ⟨5675, target7⟩, ⟨5677, target8⟩, ⟨5681, target9⟩, ⟨5683, target10⟩, ⟨5685, target11⟩, ⟨5687, target12⟩, ⟨5689, target13⟩, ⟨5695, target14⟩, ⟨5697, target15⟩, ⟨5708, target16⟩, ⟨5710, target17⟩, ⟨5730, target18⟩, ⟨5782, target19⟩, ⟨5784, target20⟩, ⟨5786, target21⟩, ⟨5794, target22⟩, ⟨5796, target23⟩, ⟨5798, target24⟩, ⟨5802, target25⟩, ⟨5804, target26⟩, ⟨5806, target27⟩, ⟨5808, target28⟩, ⟨5810, target29⟩, ⟨5815, target30⟩, ⟨5843, target31⟩, ⟨5846, target32⟩, ⟨6755, target33⟩, ⟨6757, target34⟩, ⟨6759, target35⟩, ⟨6767, target36⟩, ⟨6769, target37⟩, ⟨6771, target38⟩, ⟨6775, target39⟩, ⟨6777, target40⟩, ⟨6779, target41⟩, ⟨6785, target42⟩, ⟨6787, target43⟩, ⟨6815, target44⟩, ⟨6817, target45⟩, ⟨6818, target46⟩, ⟨6819, target47⟩, ⟨6821, target48⟩, ⟨6823, target49⟩, ⟨6825, target50⟩, ⟨6898, target51⟩, ⟨6900, target52⟩, ⟨6902, target53⟩, ⟨6910, target54⟩, ⟨6912, target55⟩, ⟨6914, target56⟩, ⟨6918, target57⟩, ⟨6920, target58⟩, ⟨6922, target59⟩, ⟨6927, target60⟩, ⟨6929, target61⟩, ⟨6961, target62⟩, ⟨7191, target63⟩, ⟨7193, target64⟩, ⟨7195, target65⟩, ⟨7197, target66⟩, ⟨7204, target67⟩, ⟨7207, target68⟩, ⟨7213, target69⟩, ⟨7215, target70⟩, ⟨7230, target71⟩, ⟨7282, target72⟩, ⟨7284, target73⟩, ⟨7286, target74⟩, ⟨7288, target75⟩, ⟨7294, target76⟩, ⟨7297, target77⟩]
  indexMask := 4656194506502265650123642883600544487938605922698669726622211555482301734329715416383655668095098165083174357459191083743898175310662792965584253320433574233027036116421836364864773047747339191746534526719190459281428819441797944813650141521136804954756379688404308044311904085707886080833217479912458890258553801863045908212900595938170704678451276345099471164838416711389132784712540137153320670776778717678782216392744366585278036794904720871230529217559357272961428140503290827898955306434490135785922340607804070096829447647002602177832327358912353198288345454155044679049446929718297988042075509512497013961685604379742730810130379266857735919152105792696875639039496977981855976430812951156681771134771200213297397128785314811801879241811126245396156404852226198162236865697280056531323008657412714997153417718003597038324523114405004605583864996193779457082609056251387804253329650112637963504884372495925077460105621364859842479813952150908712331170949853464293656242004304923099181218786779253690826747688407521930710190778841027028599345139375347951827319120395280826954411442647411908191518491911534695202725808870761083289059224607352283618461026175333080762773655373671049555295913067731409190983066832576710559022300024371347870016320170916358813548954634771566654518863438404680963008884144268619623786664778932759362485086703991842535262954361104292805883705628511854792333680800094435818950972598374300246202317995171588219714857559666166391286857655742441611746135552237256839101192757378150895519075774431662590904510974989562993816163064880759917960119130429750489116786672029947288010062983792664250380328590295459858036067752195389255212999348318552857278607096868865230956741594711674403216887353641147569517360079416301689579924753733480976039719918996973599585012405339917734352618755923632265849736753248406692853032298884187016202464557819661234000861356778178311327620020982026982077008074738480018777109588408092129247641433528758439184723730258076833958653839156584248986521305759128217377432384307433333194027208418090964747545215436925282656275696094537972766048746632192721114201287988782839661418936908183584134998477291154763367579995692350051869934465807548416
  count := 78

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem period7Chunk_entries :
    period7Chunk.rows.map RowCoverage.TaggedRow.entry = period7Entries := rfl

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem period7_index_check :
    RowCoverage.indexCheck CanonicalWords.count period7Chunk = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem period7_words_check :
    RowCoverage.wordsCheck CanonicalWords.wordAt period7Chunk = true := by
  decide +kernel

def period8Entries : List Weights.Entry := [target78, target79, target80, target81, target82, target83, target84, target85, target86, target87, target88, target89, target90, target91, target92, target93, target94, target95, target96, target97, target98, target99, target100, target101, target102, target103, target104, target105, target106, target107, target108]

def period8Chunk : RowCoverage.Chunk where
  rows := [⟨53, target78⟩, ⟨68, target79⟩, ⟨76, target80⟩, ⟨84, target81⟩, ⟨104, target82⟩, ⟨112, target83⟩, ⟨509, target84⟩, ⟨515, target85⟩, ⟨531, target86⟩, ⟨537, target87⟩, ⟨827, target88⟩, ⟨996, target89⟩, ⟨1000, target90⟩, ⟨1046, target91⟩, ⟨1110, target92⟩, ⟨1114, target93⟩, ⟨1790, target94⟩, ⟨1805, target95⟩, ⟨1825, target96⟩, ⟨1833, target97⟩, ⟨2126, target98⟩, ⟨2130, target99⟩, ⟨2138, target100⟩, ⟨2192, target101⟩, ⟨2196, target102⟩, ⟨4255, target103⟩, ⟨4428, target104⟩, ⟨5576, target105⟩, ⟨5784, target106⟩, ⟨6757, target107⟩, ⟨6900, target108⟩]
  indexMask := 12792931706656626926905734903389779124199848613708164101720267900046502756881034895341506634068469801605160970029436927734463993909532760163119918713567818574299861606035328260564959092792970580004176311313894293036050065869489705158500449745545534713042779672404277991801976837598167419245710413736096810723460441328396782820879907296119651560568895002076670828854552614922762971753370491177517202040106539426293575637247098988075419726788582285699108169330141173283061199269905801684292832733239946178917692765156091901853600203671744336225685631329447073926980561930426493813989012290975811748657108530502966988480808142355390507064615499556188894725371379575482950028756443100302681666879614344578412359495924703432150192751539936711851452830084691686975840590041092111077841663742905987790199628408448063490287421216975054592288781666745356343728040870542800893567088163690909356486047326493363774244866709057720690793166596987194139613383958351969628804089151006791584921574086965361532523087820775001579009931208580011642720357505840705107909249751098242790321651824008420002197141507654354285930664822440365217374268061611931497125125363964864691595731847390281025611321857644672266993483674658644393914023763530186957946235389574804737727696684040084327573720366726854107464943004929630666564360749153511045617230994329416206708984557226458581504348152082214534129513322848137956299443771748329430436498111255818763173519263461997795713063354668483654561590907683118188044623357961911901290194935389570205571342424872096934485617870936453382481293255800799429050714943651384564267331340250833475466033942458007064902472363844196701797869329850555850848398288865466480615936485966961042731176247571367992248457427566095922107191086561889244075162310929308711741022200699468806154558816145761473646908949521873706817440126166865268403529010127578029316371867612249751449160730837766477864270437261109080049560894312358819953031769601014033453950513696617329685938479680145539145196783369514448680424752463613743539457278018774759751512752321089074732665495209120043630592
  count := 31

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

def period9Entries : List Weights.Entry := [target109, target110, target111, target112, target113, target114, target115, target116, target117, target118, target119, target120, target121, target122, target123, target124, target125, target126, target127]

def period9Chunk : RowCoverage.Chunk where
  rows := [⟨53, target109⟩, ⟨68, target110⟩, ⟨76, target111⟩, ⟨84, target112⟩, ⟨104, target113⟩, ⟨112, target114⟩, ⟨827, target115⟩, ⟨996, target116⟩, ⟨1000, target117⟩, ⟨1046, target118⟩, ⟨1110, target119⟩, ⟨1114, target120⟩, ⟨1790, target121⟩, ⟨1805, target122⟩, ⟨1825, target123⟩, ⟨1833, target124⟩, ⟨2126, target125⟩, ⟨2130, target126⟩, ⟨2138, target127⟩]
  indexMask := 40172558433476686313893754303932484120125339915656179667232042704736074029326687490166504167487708439532721095388512329705516564850921612953401679194085325135593001425807469988584224076541021809161433438065401665539108720397618630405792052623137127382155981242746137867376281983260087607773672922489383034500498439946900146446645849096961338293880021375369436706328256442200983379418334984979301082415014016889360302200302873343720899341480478514374855891404240016450497848776920460597018367784899325775240879262168133648568748419104907142751495904758945287685287723141658339231062476845331768973637351569813752232374410059769847633524436238336
  count := 19

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

end FranklSmallCyclic.TransportBatches.G025.B002.Data
