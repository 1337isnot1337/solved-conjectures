module

public import Conjectures.FranklSmallCyclicRowCoverage
public import Conjectures.FranklSmallCyclicCanonicalWords
public import Conjectures.FranklSmallCyclicOrbit7Block025Data

/-! 128 literal targets sharing one source proof block.
Original words and row indices are retained; weights may be transported.
-/
@[expose] public section

namespace FranklSmallCyclic.TransportBatches.G025.B001.Data

-- Period 7, original row 1851, representative 3264.
def source0 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨47, by decide +kernel⟩

def target0 : Weights.Entry :=
  { word := [1, 4, 2, 0, 1, 8, 8], weights := [0, 1, 0, 1] }

def points0 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 1858, representative 3290.
def source1 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨73, by decide +kernel⟩

def target1 : Weights.Entry :=
  { word := [1, 4, 2, 0, 9, 0, 8], weights := [0, 1, 0, 1] }

def points1 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 1865, representative 3260.
def source2 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨43, by decide +kernel⟩

def target2 : Weights.Entry :=
  { word := [1, 4, 2, 0, 9, 8, 8], weights := [0, 1, 0, 1] }

def points2 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 1871, representative 3286.
def source3 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨69, by decide +kernel⟩

def target3 : Weights.Entry :=
  { word := [1, 4, 2, 8, 2, 0, 8], weights := [0, 1, 1, 0] }

def points3 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 1875, representative 3234.
def source4 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨17, by decide +kernel⟩

def target4 : Weights.Entry :=
  { word := [1, 4, 2, 8, 2, 8, 8], weights := [0, 1, 1, 0] }

def points4 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 1885, representative 3278.
def source5 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨61, by decide +kernel⟩

def target5 : Weights.Entry :=
  { word := [1, 4, 2, 8, 10, 0, 8], weights := [0, 1, 1, 0] }

def points5 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 1889, representative 3217.
def source6 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨0, by decide +kernel⟩

def target6 : Weights.Entry :=
  { word := [1, 4, 2, 8, 10, 8, 8], weights := [0, 1, 1, 0] }

def points6 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 1894, representative 3289.
def source7 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨72, by decide +kernel⟩

def target7 : Weights.Entry :=
  { word := [1, 4, 4, 4, 0, 0, 8], weights := [0, 0, 1, 0] }

def points7 : List (ℕ × ℕ) := [(0, 2), (1, 0), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 1901, representative 3264.
def source8 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨47, by decide +kernel⟩

def target8 : Weights.Entry :=
  { word := [1, 4, 4, 4, 0, 8, 8], weights := [1, 0, 0, 1] }

def points8 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6)]

-- Period 7, original row 1908, representative 3284.
def source9 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨67, by decide +kernel⟩

def target9 : Weights.Entry :=
  { word := [1, 4, 4, 4, 8, 0, 8], weights := [1, 0, 1, 0] }

def points9 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 1915, representative 3253.
def source10 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨36, by decide +kernel⟩

def target10 : Weights.Entry :=
  { word := [1, 4, 4, 4, 8, 8, 8], weights := [1, 0, 1, 0] }

def points10 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 1922, representative 3291.
def source11 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨74, by decide +kernel⟩

def target11 : Weights.Entry :=
  { word := [1, 4, 8, 4, 2, 0, 8], weights := [0, 0, 1, 0] }

def points11 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 1928, representative 3244.
def source12 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨27, by decide +kernel⟩

def target12 : Weights.Entry :=
  { word := [1, 4, 8, 4, 2, 8, 8], weights := [0, 0, 1, 0] }

def points12 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 1948, representative 3282.
def source13 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨65, by decide +kernel⟩

def target13 : Weights.Entry :=
  { word := [1, 4, 8, 4, 10, 0, 8], weights := [0, 0, 1, 0] }

def points13 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 1954, representative 3227.
def source14 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨10, by decide +kernel⟩

def target14 : Weights.Entry :=
  { word := [1, 4, 8, 4, 10, 8, 8], weights := [0, 0, 1, 0] }

def points14 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 1978, representative 3267.
def source15 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨50, by decide +kernel⟩

def target15 : Weights.Entry :=
  { word := [1, 4, 10, 0, 1, 8, 8], weights := [0, 1, 0, 1] }

def points15 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 1985, representative 3263.
def source16 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨46, by decide +kernel⟩

def target16 : Weights.Entry :=
  { word := [1, 4, 10, 0, 9, 8, 8], weights := [0, 1, 0, 1] }

def points16 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 1990, representative 3233.
def source17 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨16, by decide +kernel⟩

def target17 : Weights.Entry :=
  { word := [1, 4, 10, 8, 2, 8, 8], weights := [0, 1, 1, 0] }

def points17 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 2004, representative 3267.
def source18 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨50, by decide +kernel⟩

def target18 : Weights.Entry :=
  { word := [1, 4, 12, 4, 0, 8, 8], weights := [1, 0, 0, 1] }

def points18 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6)]

-- Period 7, original row 2011, representative 3285.
def source19 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨68, by decide +kernel⟩

def target19 : Weights.Entry :=
  { word := [1, 4, 12, 4, 8, 0, 8], weights := [1, 0, 1, 0] }

def points19 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 2018, representative 3256.
def source20 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨39, by decide +kernel⟩

def target20 : Weights.Entry :=
  { word := [1, 4, 12, 4, 8, 8, 8], weights := [1, 0, 1, 0] }

def points20 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 2025, representative 3276.
def source21 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨59, by decide +kernel⟩

def target21 : Weights.Entry :=
  { word := [1, 8, 1, 4, 2, 0, 8], weights := [0, 0, 1, 0] }

def points21 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 2031, representative 3246.
def source22 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨29, by decide +kernel⟩

def target22 : Weights.Entry :=
  { word := [1, 8, 1, 4, 2, 8, 8], weights := [0, 0, 1, 0] }

def points22 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 2047, representative 3274.
def source23 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨57, by decide +kernel⟩

def target23 : Weights.Entry :=
  { word := [1, 8, 1, 4, 10, 0, 8], weights := [0, 0, 1, 0] }

def points23 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 2053, representative 3229.
def source24 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨12, by decide +kernel⟩

def target24 : Weights.Entry :=
  { word := [1, 8, 1, 4, 10, 8, 8], weights := [0, 0, 1, 0] }

def points24 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 2071, representative 3287.
def source25 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨70, by decide +kernel⟩

def target25 : Weights.Entry :=
  { word := [1, 8, 2, 2, 2, 0, 8], weights := [0, 1, 0, 0] }

def points25 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 2075, representative 3300.
def source26 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨83, by decide +kernel⟩

def target26 : Weights.Entry :=
  { word := [1, 8, 2, 2, 2, 8, 0], weights := [0, 1, 0, 0] }

def points26 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 2079, representative 3235.
def source27 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨18, by decide +kernel⟩

def target27 : Weights.Entry :=
  { word := [1, 8, 2, 2, 2, 8, 8], weights := [0, 1, 0, 0] }

def points27 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 2086, representative 3279.
def source28 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨62, by decide +kernel⟩

def target28 : Weights.Entry :=
  { word := [1, 8, 2, 2, 10, 0, 8], weights := [0, 1, 0, 0] }

def points28 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 2090, representative 3299.
def source29 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨82, by decide +kernel⟩

def target29 : Weights.Entry :=
  { word := [1, 8, 2, 2, 10, 8, 0], weights := [0, 1, 0, 0] }

def points29 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 2094, representative 3218.
def source30 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨1, by decide +kernel⟩

def target30 : Weights.Entry :=
  { word := [1, 8, 2, 2, 10, 8, 8], weights := [0, 1, 0, 0] }

def points30 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 2101, representative 3288.
def source31 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨71, by decide +kernel⟩

def target31 : Weights.Entry :=
  { word := [1, 8, 2, 10, 2, 0, 8], weights := [0, 1, 0, 0] }

def points31 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 2108, representative 3238.
def source32 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨21, by decide +kernel⟩

def target32 : Weights.Entry :=
  { word := [1, 8, 2, 10, 2, 8, 8], weights := [0, 1, 0, 0] }

def points32 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 2115, representative 3280.
def source33 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨63, by decide +kernel⟩

def target33 : Weights.Entry :=
  { word := [1, 8, 2, 10, 10, 0, 8], weights := [0, 1, 0, 0] }

def points33 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 2122, representative 3221.
def source34 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨4, by decide +kernel⟩

def target34 : Weights.Entry :=
  { word := [1, 8, 2, 10, 10, 8, 8], weights := [0, 1, 0, 0] }

def points34 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 2126, representative 3304.
def source35 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨87, by decide +kernel⟩

def target35 : Weights.Entry :=
  { word := [1, 8, 4, 4, 4, 0, 0], weights := [0, 0, 1, 0] }

def points35 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 2128, representative 3300.
def source36 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨83, by decide +kernel⟩

def target36 : Weights.Entry :=
  { word := [1, 8, 4, 4, 4, 8, 0], weights := [0, 0, 1, 0] }

def points36 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 2130, representative 3302.
def source37 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨85, by decide +kernel⟩

def target37 : Weights.Entry :=
  { word := [1, 8, 4, 4, 12, 0, 0], weights := [0, 0, 1, 0] }

def points37 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 2132, representative 3298.
def source38 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨81, by decide +kernel⟩

def target38 : Weights.Entry :=
  { word := [1, 8, 4, 4, 12, 8, 0], weights := [0, 0, 1, 0] }

def points38 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 2138, representative 3295.
def source39 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨78, by decide +kernel⟩

def target39 : Weights.Entry :=
  { word := [1, 8, 8, 4, 6, 0, 0], weights := [0, 0, 1, 0] }

def points39 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 2140, representative 3293.
def source40 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨76, by decide +kernel⟩

def target40 : Weights.Entry :=
  { word := [1, 8, 8, 4, 6, 8, 0], weights := [0, 0, 1, 0] }

def points40 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 2162, representative 3298.
def source41 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨81, by decide +kernel⟩

def target41 : Weights.Entry :=
  { word := [1, 8, 10, 2, 2, 8, 0], weights := [0, 1, 0, 0] }

def points41 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 2166, representative 3236.
def source42 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨19, by decide +kernel⟩

def target42 : Weights.Entry :=
  { word := [1, 8, 10, 2, 2, 8, 8], weights := [0, 1, 0, 0] }

def points42 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 2170, representative 3297.
def source43 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨80, by decide +kernel⟩

def target43 : Weights.Entry :=
  { word := [1, 8, 10, 2, 10, 8, 0], weights := [0, 1, 0, 0] }

def points43 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 2174, representative 3219.
def source44 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨2, by decide +kernel⟩

def target44 : Weights.Entry :=
  { word := [1, 8, 10, 2, 10, 8, 8], weights := [0, 1, 0, 0] }

def points44 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 2181, representative 3237.
def source45 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨20, by decide +kernel⟩

def target45 : Weights.Entry :=
  { word := [1, 8, 10, 10, 2, 8, 8], weights := [0, 1, 0, 0] }

def points45 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 2188, representative 3220.
def source46 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨3, by decide +kernel⟩

def target46 : Weights.Entry :=
  { word := [1, 8, 10, 10, 10, 8, 8], weights := [0, 1, 0, 0] }

def points46 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 2192, representative 3303.
def source47 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨86, by decide +kernel⟩

def target47 : Weights.Entry :=
  { word := [1, 8, 12, 4, 4, 0, 0], weights := [0, 0, 1, 0] }

def points47 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 2194, representative 3299.
def source48 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨82, by decide +kernel⟩

def target48 : Weights.Entry :=
  { word := [1, 8, 12, 4, 4, 8, 0], weights := [0, 0, 1, 0] }

def points48 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 2196, representative 3301.
def source49 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨84, by decide +kernel⟩

def target49 : Weights.Entry :=
  { word := [1, 8, 12, 4, 12, 0, 0], weights := [0, 0, 1, 0] }

def points49 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 2198, representative 3297.
def source50 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨80, by decide +kernel⟩

def target50 : Weights.Entry :=
  { word := [1, 8, 12, 4, 12, 8, 0], weights := [0, 0, 1, 0] }

def points50 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 2203, representative 3272.
def source51 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨55, by decide +kernel⟩

def target51 : Weights.Entry :=
  { word := [1, 12, 2, 0, 1, 0, 8], weights := [0, 1, 0, 1] }

def points51 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 2210, representative 3265.
def source52 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨48, by decide +kernel⟩

def target52 : Weights.Entry :=
  { word := [1, 12, 2, 0, 1, 8, 8], weights := [0, 1, 0, 1] }

def points52 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 2217, representative 3273.
def source53 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨56, by decide +kernel⟩

def target53 : Weights.Entry :=
  { word := [1, 12, 2, 0, 9, 0, 8], weights := [0, 1, 0, 1] }

def points53 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 2224, representative 3261.
def source54 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨44, by decide +kernel⟩

def target54 : Weights.Entry :=
  { word := [1, 12, 2, 0, 9, 8, 8], weights := [0, 1, 0, 1] }

def points54 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 2230, representative 3271.
def source55 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨54, by decide +kernel⟩

def target55 : Weights.Entry :=
  { word := [1, 12, 2, 8, 2, 0, 8], weights := [0, 1, 1, 0] }

def points55 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 2234, representative 3232.
def source56 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨15, by decide +kernel⟩

def target56 : Weights.Entry :=
  { word := [1, 12, 2, 8, 2, 8, 8], weights := [0, 1, 1, 0] }

def points56 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 2244, representative 3270.
def source57 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨53, by decide +kernel⟩

def target57 : Weights.Entry :=
  { word := [1, 12, 2, 8, 10, 0, 8], weights := [0, 1, 1, 0] }

def points57 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 2253, representative 3272.
def source58 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨55, by decide +kernel⟩

def target58 : Weights.Entry :=
  { word := [1, 12, 4, 4, 0, 0, 8], weights := [1, 0, 0, 1] }

def points58 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6)]

-- Period 7, original row 2260, representative 3265.
def source59 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨48, by decide +kernel⟩

def target59 : Weights.Entry :=
  { word := [1, 12, 4, 4, 0, 8, 8], weights := [1, 0, 0, 1] }

def points59 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6)]

-- Period 7, original row 2267, representative 3268.
def source60 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨51, by decide +kernel⟩

def target60 : Weights.Entry :=
  { word := [1, 12, 4, 4, 8, 0, 8], weights := [1, 0, 1, 0] }

def points60 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 2274, representative 3254.
def source61 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨37, by decide +kernel⟩

def target61 : Weights.Entry :=
  { word := [1, 12, 4, 4, 8, 8, 8], weights := [1, 0, 1, 0] }

def points61 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 2281, representative 3277.
def source62 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨60, by decide +kernel⟩

def target62 : Weights.Entry :=
  { word := [1, 12, 8, 4, 2, 0, 8], weights := [0, 0, 1, 0] }

def points62 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 2287, representative 3243.
def source63 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨26, by decide +kernel⟩

def target63 : Weights.Entry :=
  { word := [1, 12, 8, 4, 2, 8, 8], weights := [0, 0, 1, 0] }

def points63 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 2307, representative 3275.
def source64 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨58, by decide +kernel⟩

def target64 : Weights.Entry :=
  { word := [1, 12, 8, 4, 10, 0, 8], weights := [0, 0, 1, 0] }

def points64 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 2313, representative 3226.
def source65 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨9, by decide +kernel⟩

def target65 : Weights.Entry :=
  { word := [1, 12, 8, 4, 10, 8, 8], weights := [0, 0, 1, 0] }

def points65 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 2337, representative 3266.
def source66 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨49, by decide +kernel⟩

def target66 : Weights.Entry :=
  { word := [1, 12, 10, 0, 1, 8, 8], weights := [0, 1, 0, 1] }

def points66 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 2344, representative 3262.
def source67 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨45, by decide +kernel⟩

def target67 : Weights.Entry :=
  { word := [1, 12, 10, 0, 9, 8, 8], weights := [0, 1, 0, 1] }

def points67 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 2349, representative 3231.
def source68 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨14, by decide +kernel⟩

def target68 : Weights.Entry :=
  { word := [1, 12, 10, 8, 2, 8, 8], weights := [0, 1, 1, 0] }

def points68 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 2363, representative 3266.
def source69 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨49, by decide +kernel⟩

def target69 : Weights.Entry :=
  { word := [1, 12, 12, 4, 0, 8, 8], weights := [1, 0, 0, 1] }

def points69 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6)]

-- Period 7, original row 2370, representative 3269.
def source70 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨52, by decide +kernel⟩

def target70 : Weights.Entry :=
  { word := [1, 12, 12, 4, 8, 0, 8], weights := [1, 0, 1, 0] }

def points70 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 2377, representative 3255.
def source71 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨38, by decide +kernel⟩

def target71 : Weights.Entry :=
  { word := [1, 12, 12, 4, 8, 8, 8], weights := [1, 0, 1, 0] }

def points71 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 4097, representative 3289.
def source72 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨72, by decide +kernel⟩

def target72 : Weights.Entry :=
  { word := [8, 0, 0, 1, 4, 2, 0], weights := [0, 0, 1, 0] }

def points72 : List (ℕ × ℕ) := [(0, 1), (1, 2), (2, 0), (3, 4), (4, 6), (5, 5), (6, 3)]

-- Period 7, original row 4098, representative 3272.
def source73 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨55, by decide +kernel⟩

def target73 : Weights.Entry :=
  { word := [8, 0, 0, 1, 4, 10, 0], weights := [1, 0, 1, 0] }

def points73 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 4099, representative 3289.
def source74 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨72, by decide +kernel⟩

def target74 : Weights.Entry :=
  { word := [8, 0, 0, 2, 2, 2, 0], weights := [0, 0, 0, 1] }

def points74 : List (ℕ × ℕ) := [(0, 1), (1, 2), (2, 0), (3, 4), (4, 5), (5, 6), (6, 3)]

-- Period 7, original row 4101, representative 3272.
def source75 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨55, by decide +kernel⟩

def target75 : Weights.Entry :=
  { word := [8, 0, 0, 2, 2, 10, 0], weights := [1, 0, 0, 1] }

def points75 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 5), (4, 6), (5, 4), (6, 3)]

-- Period 7, original row 4253, representative 3289.
def source76 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨72, by decide +kernel⟩

def target76 : Weights.Entry :=
  { word := [8, 0, 4, 2, 0, 1, 0], weights := [0, 0, 0, 1] }

def points76 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 4), (4, 5), (5, 6), (6, 3)]

-- Period 7, original row 4255, representative 3289.
def source77 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨72, by decide +kernel⟩

def target77 : Weights.Entry :=
  { word := [8, 0, 4, 2, 0, 2, 0], weights := [0, 0, 0, 1] }

def points77 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 2), (3, 4), (4, 5), (5, 6), (6, 3)]

-- Period 7, original row 4257, representative 3292.
def source78 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨75, by decide +kernel⟩

def target78 : Weights.Entry :=
  { word := [8, 0, 4, 2, 0, 8, 0], weights := [0, 1, 0, 0] }

def points78 : List (ℕ × ℕ) := [(0, 2), (1, 0), (2, 1), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 4265, representative 3276.
def source79 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨59, by decide +kernel⟩

def target79 : Weights.Entry :=
  { word := [8, 0, 4, 2, 0, 9, 0], weights := [0, 1, 0, 0] }

def points79 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 4267, representative 3276.
def source80 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨59, by decide +kernel⟩

def target80 : Weights.Entry :=
  { word := [8, 0, 4, 2, 0, 10, 0], weights := [0, 1, 0, 0] }

def points80 : List (ℕ × ℕ) := [(0, 2), (1, 0), (2, 1), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 4269, representative 3291.
def source81 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨74, by decide +kernel⟩

def target81 : Weights.Entry :=
  { word := [8, 0, 4, 2, 8, 2, 0], weights := [0, 0, 0, 1] }

def points81 : List (ℕ × ℕ) := [(0, 1), (1, 2), (2, 0), (3, 4), (4, 5), (5, 6), (6, 3)]

-- Period 7, original row 4273, representative 3277.
def source82 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨60, by decide +kernel⟩

def target82 : Weights.Entry :=
  { word := [8, 0, 4, 2, 8, 10, 0], weights := [0, 1, 0, 0] }

def points82 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 4275, representative 3289.
def source83 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨72, by decide +kernel⟩

def target83 : Weights.Entry :=
  { word := [8, 0, 4, 4, 4, 0, 0], weights := [0, 0, 0, 1] }

def points83 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 5), (4, 4), (5, 6), (6, 3)]

-- Period 7, original row 4277, representative 3287.
def source84 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨70, by decide +kernel⟩

def target84 : Weights.Entry :=
  { word := [8, 0, 4, 4, 4, 8, 0], weights := [0, 0, 1, 0] }

def points84 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 4283, representative 3286.
def source85 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨69, by decide +kernel⟩

def target85 : Weights.Entry :=
  { word := [8, 0, 4, 8, 4, 2, 0], weights := [0, 0, 1, 1] }

def points85 : List (ℕ × ℕ) := [(0, 1), (1, 2), (2, 0), (3, 4), (4, 5), (5, 6), (6, 3)]

-- Period 7, original row 4285, representative 3271.
def source86 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨54, by decide +kernel⟩

def target86 : Weights.Entry :=
  { word := [8, 0, 4, 8, 4, 10, 0], weights := [0, 1, 1, 0] }

def points86 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 4313, representative 3288.
def source87 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨71, by decide +kernel⟩

def target87 : Weights.Entry :=
  { word := [8, 0, 4, 12, 4, 8, 0], weights := [0, 0, 1, 0] }

def points87 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 4345, representative 3290.
def source88 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨73, by decide +kernel⟩

def target88 : Weights.Entry :=
  { word := [8, 0, 8, 1, 4, 2, 0], weights := [1, 1, 0, 0] }

def points88 : List (ℕ × ℕ) := [(0, 2), (1, 0), (2, 1), (3, 6), (4, 4), (5, 5), (6, 3)]

-- Period 7, original row 4346, representative 3273.
def source89 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨56, by decide +kernel⟩

def target89 : Weights.Entry :=
  { word := [8, 0, 8, 1, 4, 10, 0], weights := [1, 0, 1, 0] }

def points89 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 4347, representative 3284.
def source90 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨67, by decide +kernel⟩

def target90 : Weights.Entry :=
  { word := [8, 0, 8, 2, 2, 2, 0], weights := [0, 1, 0, 1] }

def points90 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 4349, representative 3268.
def source91 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨51, by decide +kernel⟩

def target91 : Weights.Entry :=
  { word := [8, 0, 8, 2, 2, 10, 0], weights := [0, 1, 0, 1] }

def points91 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 4351, representative 3285.
def source92 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨68, by decide +kernel⟩

def target92 : Weights.Entry :=
  { word := [8, 0, 8, 2, 10, 2, 0], weights := [0, 1, 0, 1] }

def points92 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 4353, representative 3269.
def source93 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨52, by decide +kernel⟩

def target93 : Weights.Entry :=
  { word := [8, 0, 8, 2, 10, 10, 0], weights := [0, 1, 0, 1] }

def points93 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 4426, representative 3281.
def source94 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨64, by decide +kernel⟩

def target94 : Weights.Entry :=
  { word := [8, 0, 12, 2, 0, 1, 0], weights := [0, 1, 0, 0] }

def points94 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 4428, representative 3281.
def source95 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨64, by decide +kernel⟩

def target95 : Weights.Entry :=
  { word := [8, 0, 12, 2, 0, 2, 0], weights := [0, 1, 0, 0] }

def points95 : List (ℕ × ℕ) := [(0, 2), (1, 0), (2, 1), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 4430, representative 3283.
def source96 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨66, by decide +kernel⟩

def target96 : Weights.Entry :=
  { word := [8, 0, 12, 2, 0, 8, 0], weights := [0, 1, 0, 0] }

def points96 : List (ℕ × ℕ) := [(0, 2), (1, 0), (2, 1), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 4438, representative 3274.
def source97 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨57, by decide +kernel⟩

def target97 : Weights.Entry :=
  { word := [8, 0, 12, 2, 0, 9, 0], weights := [0, 1, 0, 0] }

def points97 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 4440, representative 3274.
def source98 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨57, by decide +kernel⟩

def target98 : Weights.Entry :=
  { word := [8, 0, 12, 2, 0, 10, 0], weights := [0, 1, 0, 0] }

def points98 : List (ℕ × ℕ) := [(0, 2), (1, 0), (2, 1), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 4442, representative 3282.
def source99 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨65, by decide +kernel⟩

def target99 : Weights.Entry :=
  { word := [8, 0, 12, 2, 8, 2, 0], weights := [0, 1, 0, 0] }

def points99 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 4446, representative 3275.
def source100 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨58, by decide +kernel⟩

def target100 : Weights.Entry :=
  { word := [8, 0, 12, 2, 8, 10, 0], weights := [0, 1, 0, 0] }

def points100 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 4448, representative 3281.
def source101 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨64, by decide +kernel⟩

def target101 : Weights.Entry :=
  { word := [8, 0, 12, 4, 4, 0, 0], weights := [0, 0, 1, 0] }

def points101 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 4), (5, 5), (6, 3)]

-- Period 7, original row 4450, representative 3279.
def source102 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨62, by decide +kernel⟩

def target102 : Weights.Entry :=
  { word := [8, 0, 12, 4, 4, 8, 0], weights := [0, 0, 1, 0] }

def points102 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 4455, representative 3278.
def source103 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨61, by decide +kernel⟩

def target103 : Weights.Entry :=
  { word := [8, 0, 12, 8, 4, 2, 0], weights := [0, 1, 1, 0] }

def points103 : List (ℕ × ℕ) := [(0, 2), (1, 0), (2, 1), (3, 6), (4, 4), (5, 5), (6, 3)]

-- Period 7, original row 4457, representative 3270.
def source104 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨53, by decide +kernel⟩

def target104 : Weights.Entry :=
  { word := [8, 0, 12, 8, 4, 10, 0], weights := [0, 1, 1, 0] }

def points104 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 4489, representative 3280.
def source105 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨63, by decide +kernel⟩

def target105 : Weights.Entry :=
  { word := [8, 0, 12, 12, 4, 8, 0], weights := [0, 0, 1, 0] }

def points105 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 5317, representative 3264.
def source106 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨47, by decide +kernel⟩

def target106 : Weights.Entry :=
  { word := [8, 8, 0, 1, 4, 2, 0], weights := [1, 0, 1, 0] }

def points106 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 5321, representative 3265.
def source107 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨48, by decide +kernel⟩

def target107 : Weights.Entry :=
  { word := [8, 8, 0, 1, 4, 10, 0], weights := [1, 0, 1, 0] }

def points107 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 5323, representative 3267.
def source108 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨50, by decide +kernel⟩

def target108 : Weights.Entry :=
  { word := [8, 8, 0, 1, 12, 2, 0], weights := [1, 0, 1, 0] }

def points108 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 5327, representative 3266.
def source109 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨49, by decide +kernel⟩

def target109 : Weights.Entry :=
  { word := [8, 8, 0, 1, 12, 10, 0], weights := [1, 0, 1, 0] }

def points109 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 5329, representative 3264.
def source110 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨47, by decide +kernel⟩

def target110 : Weights.Entry :=
  { word := [8, 8, 0, 2, 2, 2, 0], weights := [1, 0, 0, 1] }

def points110 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 5), (4, 6), (5, 4), (6, 3)]

-- Period 7, original row 5331, representative 3265.
def source111 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨48, by decide +kernel⟩

def target111 : Weights.Entry :=
  { word := [8, 8, 0, 2, 2, 10, 0], weights := [1, 0, 0, 1] }

def points111 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 5), (4, 6), (5, 4), (6, 3)]

-- Period 7, original row 5333, representative 3267.
def source112 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨50, by decide +kernel⟩

def target112 : Weights.Entry :=
  { word := [8, 8, 0, 2, 10, 2, 0], weights := [1, 0, 0, 1] }

def points112 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 5), (4, 6), (5, 4), (6, 3)]

-- Period 7, original row 5335, representative 3266.
def source113 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨49, by decide +kernel⟩

def target113 : Weights.Entry :=
  { word := [8, 8, 0, 2, 10, 10, 0], weights := [1, 0, 0, 1] }

def points113 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 5), (4, 6), (5, 4), (6, 3)]

-- Period 7, original row 5355, representative 3259.
def source114 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨42, by decide +kernel⟩

def target114 : Weights.Entry :=
  { word := [8, 8, 0, 4, 6, 0, 0], weights := [1, 0, 1, 0] }

def points114 : List (ℕ × ℕ) := [(0, 1), (1, 2), (2, 0), (3, 5), (4, 6), (5, 4), (6, 3)]

-- Period 7, original row 5357, representative 3257.
def source115 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨40, by decide +kernel⟩

def target115 : Weights.Entry :=
  { word := [8, 8, 0, 4, 6, 8, 0], weights := [1, 0, 1, 0] }

def points115 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 5), (4, 6), (5, 4), (6, 3)]

-- Period 7, original row 5420, representative 3258.
def source116 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨41, by decide +kernel⟩

def target116 : Weights.Entry :=
  { word := [8, 8, 0, 12, 6, 8, 0], weights := [1, 0, 1, 0] }

def points116 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 5), (4, 6), (5, 4), (6, 3)]

-- Period 7, original row 5574, representative 3245.
def source117 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨28, by decide +kernel⟩

def target117 : Weights.Entry :=
  { word := [8, 8, 4, 2, 0, 1, 0], weights := [0, 1, 0, 0] }

def points117 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 5576, representative 3241.
def source118 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨24, by decide +kernel⟩

def target118 : Weights.Entry :=
  { word := [8, 8, 4, 2, 0, 2, 0], weights := [0, 1, 0, 0] }

def points118 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 5578, representative 3247.
def source119 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨30, by decide +kernel⟩

def target119 : Weights.Entry :=
  { word := [8, 8, 4, 2, 0, 8, 0], weights := [0, 1, 0, 0] }

def points119 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 5586, representative 3246.
def source120 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨29, by decide +kernel⟩

def target120 : Weights.Entry :=
  { word := [8, 8, 4, 2, 0, 9, 0], weights := [0, 1, 0, 0] }

def points120 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 5588, representative 3242.
def source121 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨25, by decide +kernel⟩

def target121 : Weights.Entry :=
  { word := [8, 8, 4, 2, 0, 10, 0], weights := [0, 1, 0, 0] }

def points121 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 5590, representative 3244.
def source122 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨27, by decide +kernel⟩

def target122 : Weights.Entry :=
  { word := [8, 8, 4, 2, 8, 2, 0], weights := [0, 1, 0, 0] }

def points122 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 5594, representative 3243.
def source123 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨26, by decide +kernel⟩

def target123 : Weights.Entry :=
  { word := [8, 8, 4, 2, 8, 10, 0], weights := [0, 1, 0, 0] }

def points123 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 5596, representative 3239.
def source124 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨22, by decide +kernel⟩

def target124 : Weights.Entry :=
  { word := [8, 8, 4, 4, 4, 0, 0], weights := [0, 0, 1, 0] }

def points124 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 5598, representative 3235.
def source125 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨18, by decide +kernel⟩

def target125 : Weights.Entry :=
  { word := [8, 8, 4, 4, 4, 8, 0], weights := [0, 0, 1, 0] }

def points125 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 5600, representative 3240.
def source126 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨23, by decide +kernel⟩

def target126 : Weights.Entry :=
  { word := [8, 8, 4, 4, 12, 0, 0], weights := [0, 0, 1, 0] }

def points126 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 5602, representative 3236.
def source127 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨19, by decide +kernel⟩

def target127 : Weights.Entry :=
  { word := [8, 8, 4, 4, 12, 8, 0], weights := [0, 0, 1, 0] }

def points127 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

def period7Entries : List Weights.Entry := [target0, target1, target2, target3, target4, target5, target6, target7, target8, target9, target10, target11, target12, target13, target14, target15, target16, target17, target18, target19, target20, target21, target22, target23, target24, target25, target26, target27, target28, target29, target30, target31, target32, target33, target34, target35, target36, target37, target38, target39, target40, target41, target42, target43, target44, target45, target46, target47, target48, target49, target50, target51, target52, target53, target54, target55, target56, target57, target58, target59, target60, target61, target62, target63, target64, target65, target66, target67, target68, target69, target70, target71, target72, target73, target74, target75, target76, target77, target78, target79, target80, target81, target82, target83, target84, target85, target86, target87, target88, target89, target90, target91, target92, target93, target94, target95, target96, target97, target98, target99, target100, target101, target102, target103, target104, target105, target106, target107, target108, target109, target110, target111, target112, target113, target114, target115, target116, target117, target118, target119, target120, target121, target122, target123, target124, target125, target126, target127]

def period7Chunk : RowCoverage.Chunk where
  rows := [⟨1851, target0⟩, ⟨1858, target1⟩, ⟨1865, target2⟩, ⟨1871, target3⟩, ⟨1875, target4⟩, ⟨1885, target5⟩, ⟨1889, target6⟩, ⟨1894, target7⟩, ⟨1901, target8⟩, ⟨1908, target9⟩, ⟨1915, target10⟩, ⟨1922, target11⟩, ⟨1928, target12⟩, ⟨1948, target13⟩, ⟨1954, target14⟩, ⟨1978, target15⟩, ⟨1985, target16⟩, ⟨1990, target17⟩, ⟨2004, target18⟩, ⟨2011, target19⟩, ⟨2018, target20⟩, ⟨2025, target21⟩, ⟨2031, target22⟩, ⟨2047, target23⟩, ⟨2053, target24⟩, ⟨2071, target25⟩, ⟨2075, target26⟩, ⟨2079, target27⟩, ⟨2086, target28⟩, ⟨2090, target29⟩, ⟨2094, target30⟩, ⟨2101, target31⟩, ⟨2108, target32⟩, ⟨2115, target33⟩, ⟨2122, target34⟩, ⟨2126, target35⟩, ⟨2128, target36⟩, ⟨2130, target37⟩, ⟨2132, target38⟩, ⟨2138, target39⟩, ⟨2140, target40⟩, ⟨2162, target41⟩, ⟨2166, target42⟩, ⟨2170, target43⟩, ⟨2174, target44⟩, ⟨2181, target45⟩, ⟨2188, target46⟩, ⟨2192, target47⟩, ⟨2194, target48⟩, ⟨2196, target49⟩, ⟨2198, target50⟩, ⟨2203, target51⟩, ⟨2210, target52⟩, ⟨2217, target53⟩, ⟨2224, target54⟩, ⟨2230, target55⟩, ⟨2234, target56⟩, ⟨2244, target57⟩, ⟨2253, target58⟩, ⟨2260, target59⟩, ⟨2267, target60⟩, ⟨2274, target61⟩, ⟨2281, target62⟩, ⟨2287, target63⟩, ⟨2307, target64⟩, ⟨2313, target65⟩, ⟨2337, target66⟩, ⟨2344, target67⟩, ⟨2349, target68⟩, ⟨2363, target69⟩, ⟨2370, target70⟩, ⟨2377, target71⟩, ⟨4097, target72⟩, ⟨4098, target73⟩, ⟨4099, target74⟩, ⟨4101, target75⟩, ⟨4253, target76⟩, ⟨4255, target77⟩, ⟨4257, target78⟩, ⟨4265, target79⟩, ⟨4267, target80⟩, ⟨4269, target81⟩, ⟨4273, target82⟩, ⟨4275, target83⟩, ⟨4277, target84⟩, ⟨4283, target85⟩, ⟨4285, target86⟩, ⟨4313, target87⟩, ⟨4345, target88⟩, ⟨4346, target89⟩, ⟨4347, target90⟩, ⟨4349, target91⟩, ⟨4351, target92⟩, ⟨4353, target93⟩, ⟨4426, target94⟩, ⟨4428, target95⟩, ⟨4430, target96⟩, ⟨4438, target97⟩, ⟨4440, target98⟩, ⟨4442, target99⟩, ⟨4446, target100⟩, ⟨4448, target101⟩, ⟨4450, target102⟩, ⟨4455, target103⟩, ⟨4457, target104⟩, ⟨4489, target105⟩, ⟨5317, target106⟩, ⟨5321, target107⟩, ⟨5323, target108⟩, ⟨5327, target109⟩, ⟨5329, target110⟩, ⟨5331, target111⟩, ⟨5333, target112⟩, ⟨5335, target113⟩, ⟨5355, target114⟩, ⟨5357, target115⟩, ⟨5420, target116⟩, ⟨5574, target117⟩, ⟨5576, target118⟩, ⟨5578, target119⟩, ⟨5586, target120⟩, ⟨5588, target121⟩, ⟨5590, target122⟩, ⟨5594, target123⟩, ⟨5596, target124⟩, ⟨5598, target125⟩, ⟨5600, target126⟩, ⟨5602, target127⟩]
  indexMask := 3123594219743064053493720930908812272083189895386152547322658461961426261576517852754259056839598844071470212094791091749428162158411820385017944695436104093975696852726340990677385811161871975027549663723526328258213076847040649859653887528852936096179611282625837893476785499322793812753627710846762215814372954037792850021249832354379455467040661170029477244566639601644604190896627660649599975161733886684361790289473822984109522704952394840035999069223558350325459665578685670838268798789779077525823240751112915720893521407647468751141286288954144917149912748991133444180744368177378093075501960425776892574284420112597364335556586059349461205640739361242951583576817063363078969136374530766654213134638764839382046125066889295991855632445658563089348989682614169318935888248728042615142810644993808764942051338956663718119355163863571622250524395110435005096800696376564844267438281248165172249131106129601466629818546737410430694164502996556874543470153170688141309038939666541453726110832618392593027396570010564181798468965977821179183603122960839846484464561637577345178295391999594871961165566557070935856444096092592437212609951178206025688246438056815294721076000847161548536485540077453737220028850076700889637134824183601674252419821541062176308081112783987509371844434328236416277381699605594950744731884770474530516490681772039746995862409560758617276003745801976087573023910841886264354096658886965325222532157206353294135260771707925079193309345481402601702838119566339463975940402230580250910475295410283658892317755047981958218334097797005800584847033255766961320049356144385885905097016246220958916782857414268512234888503672849850241181529849836003409817818365952
  count := 128

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

end FranklSmallCyclic.TransportBatches.G025.B001.Data
