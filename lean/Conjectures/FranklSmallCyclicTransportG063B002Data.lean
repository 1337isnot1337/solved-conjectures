module

public import Conjectures.FranklSmallCyclicRowCoverage
public import Conjectures.FranklSmallCyclicCanonicalWords
public import Conjectures.FranklSmallCyclicOrbit9Block010Data

/-! 128 literal targets sharing one source proof block.
Original words and row indices are retained; weights may be transported.
-/
@[expose] public section

namespace FranklSmallCyclic.TransportBatches.G063.B002.Data

-- Period 9, original row 2565, representative 8123.
def source0 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨92, by decide +kernel⟩

def target0 : Weights.Entry :=
  { word := [2, 0, 12, 10, 0, 12, 4], weights := [1, 0, 1, 1] }

def points0 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 8), (8, 7)]

-- Period 9, original row 2575, representative 8121.
def source1 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨90, by decide +kernel⟩

def target1 : Weights.Entry :=
  { word := [2, 0, 12, 10, 8, 12, 4], weights := [1, 0, 1, 1] }

-- Period 9, original row 2828, representative 8107.
def source2 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨76, by decide +kernel⟩

def target2 : Weights.Entry :=
  { word := [2, 8, 0, 4, 8, 12, 4], weights := [1, 0, 0, 1] }

-- Period 9, original row 2854, representative 8114.
def source3 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨83, by decide +kernel⟩

def target3 : Weights.Entry :=
  { word := [2, 8, 0, 12, 0, 12, 4], weights := [1, 0, 1, 0] }

-- Period 9, original row 2879, representative 8110.
def source4 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨79, by decide +kernel⟩

def target4 : Weights.Entry :=
  { word := [2, 8, 0, 12, 8, 12, 4], weights := [1, 0, 1, 0] }

-- Period 9, original row 2947, representative 8120.
def source5 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨89, by decide +kernel⟩

def target5 : Weights.Entry :=
  { word := [2, 8, 4, 10, 8, 12, 4], weights := [2, 2, 1, 3] }

-- Period 9, original row 2994, representative 8105.
def source6 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨74, by decide +kernel⟩

def target6 : Weights.Entry :=
  { word := [2, 8, 8, 4, 8, 12, 2], weights := [1, 0, 1, 0] }

-- Period 9, original row 2995, representative 8108.
def source7 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨77, by decide +kernel⟩

def target7 : Weights.Entry :=
  { word := [2, 8, 8, 4, 8, 12, 4], weights := [1, 0, 0, 1] }

-- Period 9, original row 3020, representative 8136.
def source8 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨105, by decide +kernel⟩

def target8 : Weights.Entry :=
  { word := [2, 8, 8, 8, 1, 12, 2], weights := [1, 0, 1, 1] }

-- Period 9, original row 3021, representative 8136.
def source9 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨105, by decide +kernel⟩

def target9 : Weights.Entry :=
  { word := [2, 8, 8, 8, 1, 12, 4], weights := [1, 0, 1, 1] }

def points9 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 8), (8, 7)]

-- Period 9, original row 3027, representative 8131.
def source10 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨100, by decide +kernel⟩

def target10 : Weights.Entry :=
  { word := [2, 8, 8, 8, 9, 12, 4], weights := [1, 0, 1, 1] }

-- Period 9, original row 3038, representative 8113.
def source11 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨82, by decide +kernel⟩

def target11 : Weights.Entry :=
  { word := [2, 8, 8, 12, 0, 12, 2], weights := [1, 0, 1, 0] }

-- Period 9, original row 3039, representative 8113.
def source12 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨82, by decide +kernel⟩

def target12 : Weights.Entry :=
  { word := [2, 8, 8, 12, 0, 12, 4], weights := [1, 0, 1, 0] }

def points12 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 8), (8, 7)]

-- Period 9, original row 3067, representative 8106.
def source13 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨75, by decide +kernel⟩

def target13 : Weights.Entry :=
  { word := [2, 8, 8, 12, 8, 12, 2], weights := [1, 0, 1, 0] }

-- Period 9, original row 3068, representative 8109.
def source14 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨78, by decide +kernel⟩

def target14 : Weights.Entry :=
  { word := [2, 8, 8, 12, 8, 12, 4], weights := [1, 0, 1, 0] }

-- Period 9, original row 3095, representative 8133.
def source15 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨102, by decide +kernel⟩

def target15 : Weights.Entry :=
  { word := [2, 8, 9, 8, 1, 12, 2], weights := [1, 0, 1, 1] }

-- Period 9, original row 3096, representative 8133.
def source16 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨102, by decide +kernel⟩

def target16 : Weights.Entry :=
  { word := [2, 8, 9, 8, 1, 12, 4], weights := [1, 0, 1, 1] }

def points16 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 8), (8, 7)]

-- Period 9, original row 3102, representative 8128.
def source17 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨97, by decide +kernel⟩

def target17 : Weights.Entry :=
  { word := [2, 8, 9, 8, 9, 12, 4], weights := [1, 0, 1, 1] }

-- Period 9, original row 3157, representative 8119.
def source18 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨88, by decide +kernel⟩

def target18 : Weights.Entry :=
  { word := [2, 8, 12, 10, 8, 12, 4], weights := [2, 1, 1, 2] }

-- Period 9, original row 3166, representative 8150.
def source19 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨119, by decide +kernel⟩

def target19 : Weights.Entry :=
  { word := [2, 10, 0, 1, 0, 12, 0], weights := [2, 1, 1, 0] }

def points19 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 5), (4, 6), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 3168, representative 8150.
def source20 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨119, by decide +kernel⟩

def target20 : Weights.Entry :=
  { word := [2, 10, 0, 2, 0, 8, 1], weights := [2, 1, 0, 1] }

def points20 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 3171, representative 8152.
def source21 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨121, by decide +kernel⟩

def target21 : Weights.Entry :=
  { word := [2, 10, 0, 9, 0, 4, 0], weights := [0, 1, 1, 0] }

def points21 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 5), (4, 6), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 3172, representative 8147.
def source22 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨116, by decide +kernel⟩

def target22 : Weights.Entry :=
  { word := [2, 10, 0, 9, 0, 4, 8], weights := [1, 1, 2, 0] }

-- Period 9, original row 3174, representative 8151.
def source23 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨120, by decide +kernel⟩

def target23 : Weights.Entry :=
  { word := [2, 10, 0, 9, 0, 12, 0], weights := [0, 1, 1, 0] }

def points23 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 5), (4, 6), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 3175, representative 8146.
def source24 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨115, by decide +kernel⟩

def target24 : Weights.Entry :=
  { word := [2, 10, 0, 9, 0, 12, 8], weights := [1, 1, 2, 0] }

-- Period 9, original row 3176, representative 8135.
def source25 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨104, by decide +kernel⟩

def target25 : Weights.Entry :=
  { word := [2, 10, 0, 9, 8, 1, 4], weights := [1, 1, 0, 1] }

def points25 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2)]

-- Period 9, original row 3178, representative 8134.
def source26 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨103, by decide +kernel⟩

def target26 : Weights.Entry :=
  { word := [2, 10, 0, 9, 8, 2, 2], weights := [1, 1, 0, 1] }

-- Period 9, original row 3180, representative 8136.
def source27 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨105, by decide +kernel⟩

def target27 : Weights.Entry :=
  { word := [2, 10, 0, 9, 8, 8, 4], weights := [1, 1, 0, 1] }

def points27 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2)]

-- Period 9, original row 3183, representative 8133.
def source28 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨102, by decide +kernel⟩

def target28 : Weights.Entry :=
  { word := [2, 10, 0, 9, 8, 9, 4], weights := [1, 1, 0, 1] }

def points28 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2)]

-- Period 9, original row 3185, representative 8132.
def source29 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨101, by decide +kernel⟩

def target29 : Weights.Entry :=
  { word := [2, 10, 0, 9, 8, 10, 2], weights := [1, 1, 0, 1] }

-- Period 9, original row 3187, representative 8152.
def source30 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨121, by decide +kernel⟩

def target30 : Weights.Entry :=
  { word := [2, 10, 0, 10, 0, 0, 1], weights := [0, 1, 0, 1] }

def points30 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 3195, representative 8151.
def source31 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨120, by decide +kernel⟩

def target31 : Weights.Entry :=
  { word := [2, 10, 0, 10, 0, 8, 1], weights := [0, 1, 0, 1] }

def points31 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 3196, representative 8114.
def source32 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨83, by decide +kernel⟩

def target32 : Weights.Entry :=
  { word := [2, 10, 0, 10, 0, 8, 4], weights := [0, 1, 0, 1] }

def points32 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 3200, representative 8115.
def source33 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨84, by decide +kernel⟩

def target33 : Weights.Entry :=
  { word := [2, 10, 0, 10, 8, 0, 4], weights := [0, 1, 0, 1] }

def points33 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2)]

-- Period 9, original row 3202, representative 8113.
def source34 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨82, by decide +kernel⟩

def target34 : Weights.Entry :=
  { word := [2, 10, 0, 10, 8, 8, 4], weights := [0, 1, 0, 1] }

def points34 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2)]

-- Period 9, original row 3206, representative 8124.
def source35 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨93, by decide +kernel⟩

def target35 : Weights.Entry :=
  { word := [2, 10, 0, 12, 2, 0, 4], weights := [1, 1, 0, 1] }

def points35 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2)]

-- Period 9, original row 3214, representative 8123.
def source36 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨92, by decide +kernel⟩

def target36 : Weights.Entry :=
  { word := [2, 10, 0, 12, 10, 0, 4], weights := [1, 1, 0, 1] }

def points36 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2)]

-- Period 9, original row 3231, representative 8140.
def source37 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨109, by decide +kernel⟩

def target37 : Weights.Entry :=
  { word := [2, 10, 2, 8, 8, 4, 0], weights := [1, 0, 1, 0] }

def points37 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 3233, representative 8139.
def source38 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨108, by decide +kernel⟩

def target38 : Weights.Entry :=
  { word := [2, 10, 2, 8, 8, 12, 0], weights := [1, 0, 1, 0] }

def points38 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 3236, representative 8126.
def source39 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨95, by decide +kernel⟩

def target39 : Weights.Entry :=
  { word := [2, 10, 2, 8, 9, 0, 4], weights := [1, 1, 0, 1] }

def points39 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 3248, representative 8143.
def source40 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨112, by decide +kernel⟩

def target40 : Weights.Entry :=
  { word := [2, 10, 8, 1, 0, 12, 0], weights := [2, 1, 1, 0] }

def points40 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 3254, representative 8148.
def source41 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨117, by decide +kernel⟩

def target41 : Weights.Entry :=
  { word := [2, 10, 8, 2, 0, 8, 1], weights := [1, 0, 0, 1] }

def points41 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 3255, representative 8107.
def source42 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨76, by decide +kernel⟩

def target42 : Weights.Entry :=
  { word := [2, 10, 8, 2, 0, 8, 2], weights := [1, 0, 0, 1] }

def points42 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 3256, representative 8107.
def source43 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨76, by decide +kernel⟩

def target43 : Weights.Entry :=
  { word := [2, 10, 8, 2, 0, 8, 4], weights := [1, 0, 0, 1] }

def points43 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 3265, representative 8111.
def source44 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨80, by decide +kernel⟩

def target44 : Weights.Entry :=
  { word := [2, 10, 8, 2, 8, 0, 4], weights := [1, 0, 0, 1] }

def points44 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 3269, representative 8108.
def source45 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨77, by decide +kernel⟩

def target45 : Weights.Entry :=
  { word := [2, 10, 8, 2, 8, 8, 4], weights := [1, 0, 0, 1] }

def points45 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 3282, representative 8145.
def source46 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨114, by decide +kernel⟩

def target46 : Weights.Entry :=
  { word := [2, 10, 8, 9, 0, 4, 0], weights := [0, 1, 1, 0] }

def points46 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 3283, representative 8142.
def source47 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨111, by decide +kernel⟩

def target47 : Weights.Entry :=
  { word := [2, 10, 8, 9, 0, 4, 8], weights := [1, 1, 2, 0] }

-- Period 9, original row 3285, representative 8144.
def source48 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨113, by decide +kernel⟩

def target48 : Weights.Entry :=
  { word := [2, 10, 8, 9, 0, 12, 0], weights := [0, 1, 1, 0] }

def points48 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 3286, representative 8141.
def source49 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨110, by decide +kernel⟩

def target49 : Weights.Entry :=
  { word := [2, 10, 8, 9, 0, 12, 8], weights := [1, 1, 2, 0] }

-- Period 9, original row 3287, representative 8130.
def source50 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨99, by decide +kernel⟩

def target50 : Weights.Entry :=
  { word := [2, 10, 8, 9, 8, 1, 4], weights := [1, 1, 0, 1] }

def points50 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 3289, representative 8129.
def source51 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨98, by decide +kernel⟩

def target51 : Weights.Entry :=
  { word := [2, 10, 8, 9, 8, 2, 2], weights := [1, 1, 0, 1] }

-- Period 9, original row 3291, representative 8131.
def source52 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨100, by decide +kernel⟩

def target52 : Weights.Entry :=
  { word := [2, 10, 8, 9, 8, 8, 4], weights := [1, 1, 0, 1] }

def points52 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 3294, representative 8128.
def source53 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨97, by decide +kernel⟩

def target53 : Weights.Entry :=
  { word := [2, 10, 8, 9, 8, 9, 4], weights := [1, 1, 0, 1] }

def points53 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 3296, representative 8127.
def source54 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨96, by decide +kernel⟩

def target54 : Weights.Entry :=
  { word := [2, 10, 8, 9, 8, 10, 2], weights := [1, 1, 0, 1] }

-- Period 9, original row 3304, representative 8149.
def source55 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨118, by decide +kernel⟩

def target55 : Weights.Entry :=
  { word := [2, 10, 8, 10, 0, 8, 1], weights := [0, 1, 0, 1] }

def points55 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 3305, representative 8110.
def source56 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨79, by decide +kernel⟩

def target56 : Weights.Entry :=
  { word := [2, 10, 8, 10, 0, 8, 2], weights := [0, 1, 0, 1] }

def points56 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 3306, representative 8110.
def source57 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨79, by decide +kernel⟩

def target57 : Weights.Entry :=
  { word := [2, 10, 8, 10, 0, 8, 4], weights := [0, 1, 0, 1] }

def points57 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 3316, representative 8112.
def source58 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨81, by decide +kernel⟩

def target58 : Weights.Entry :=
  { word := [2, 10, 8, 10, 8, 0, 4], weights := [0, 1, 0, 1] }

def points58 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 3322, representative 8109.
def source59 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨78, by decide +kernel⟩

def target59 : Weights.Entry :=
  { word := [2, 10, 8, 10, 8, 8, 4], weights := [0, 1, 0, 1] }

def points59 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 3330, representative 8122.
def source60 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨91, by decide +kernel⟩

def target60 : Weights.Entry :=
  { word := [2, 10, 8, 12, 2, 0, 4], weights := [1, 1, 0, 1] }

def points60 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 3335, representative 8118.
def source61 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨87, by decide +kernel⟩

def target61 : Weights.Entry :=
  { word := [2, 10, 8, 12, 2, 8, 2], weights := [1, 1, 1, 1] }

-- Period 9, original row 3336, representative 8120.
def source62 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨89, by decide +kernel⟩

def target62 : Weights.Entry :=
  { word := [2, 10, 8, 12, 2, 8, 4], weights := [3, 1, 2, 2] }

def points62 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 3344, representative 8116.
def source63 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨85, by decide +kernel⟩

def target63 : Weights.Entry :=
  { word := [2, 10, 8, 12, 8, 4, 2], weights := [2, 1, 2, 1] }

-- Period 9, original row 3347, representative 8104.
def source64 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨73, by decide +kernel⟩

def target64 : Weights.Entry :=
  { word := [2, 10, 8, 12, 8, 12, 2], weights := [2, 1, 2, 1] }

-- Period 9, original row 3352, representative 8121.
def source65 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨90, by decide +kernel⟩

def target65 : Weights.Entry :=
  { word := [2, 10, 8, 12, 10, 0, 4], weights := [1, 1, 0, 1] }

def points65 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 3357, representative 8117.
def source66 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨86, by decide +kernel⟩

def target66 : Weights.Entry :=
  { word := [2, 10, 8, 12, 10, 8, 2], weights := [1, 1, 1, 1] }

-- Period 9, original row 3358, representative 8119.
def source67 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨88, by decide +kernel⟩

def target67 : Weights.Entry :=
  { word := [2, 10, 8, 12, 10, 8, 4], weights := [2, 1, 1, 2] }

def points67 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 3377, representative 8138.
def source68 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨107, by decide +kernel⟩

def target68 : Weights.Entry :=
  { word := [2, 10, 10, 8, 8, 4, 0], weights := [1, 0, 1, 0] }

def points68 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 3379, representative 8137.
def source69 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨106, by decide +kernel⟩

def target69 : Weights.Entry :=
  { word := [2, 10, 10, 8, 8, 12, 0], weights := [1, 0, 1, 0] }

def points69 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 3382, representative 8125.
def source70 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨94, by decide +kernel⟩

def target70 : Weights.Entry :=
  { word := [2, 10, 10, 8, 9, 0, 4], weights := [1, 1, 0, 1] }

def points70 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 3667, representative 8116.
def source71 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨85, by decide +kernel⟩

def target71 : Weights.Entry :=
  { word := [4, 2, 8, 10, 8, 12, 4], weights := [1, 2, 1, 2] }

def points71 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 3688, representative 8134.
def source72 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨103, by decide +kernel⟩

def target72 : Weights.Entry :=
  { word := [4, 4, 8, 8, 1, 12, 2], weights := [1, 0, 1, 1] }

def points72 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 3689, representative 8134.
def source73 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨103, by decide +kernel⟩

def target73 : Weights.Entry :=
  { word := [4, 4, 8, 8, 1, 12, 4], weights := [1, 0, 1, 1] }

def points73 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 3700, representative 8129.
def source74 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨98, by decide +kernel⟩

def target74 : Weights.Entry :=
  { word := [4, 4, 8, 8, 9, 12, 4], weights := [1, 0, 1, 1] }

def points74 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 3746, representative 8107.
def source75 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨76, by decide +kernel⟩

def target75 : Weights.Entry :=
  { word := [4, 8, 0, 4, 8, 12, 4], weights := [1, 0, 0, 1] }

def points75 : List (ℕ × ℕ) := [(0, 0), (1, 2), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 3789, representative 8110.
def source76 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨79, by decide +kernel⟩

def target76 : Weights.Entry :=
  { word := [4, 8, 0, 12, 8, 12, 4], weights := [1, 0, 1, 0] }

def points76 : List (ℕ × ℕ) := [(0, 0), (1, 2), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 3861, representative 8118.
def source77 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨87, by decide +kernel⟩

def target77 : Weights.Entry :=
  { word := [4, 8, 4, 10, 8, 12, 4], weights := [1, 1, 1, 1] }

def points77 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 3969, representative 8117.
def source78 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨86, by decide +kernel⟩

def target78 : Weights.Entry :=
  { word := [4, 8, 12, 10, 8, 12, 4], weights := [1, 1, 1, 1] }

def points78 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 3977, representative 8135.
def source79 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨104, by decide +kernel⟩

def target79 : Weights.Entry :=
  { word := [4, 10, 0, 9, 8, 1, 4], weights := [1, 1, 0, 1] }

def points79 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 3979, representative 8134.
def source80 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨103, by decide +kernel⟩

def target80 : Weights.Entry :=
  { word := [4, 10, 0, 9, 8, 2, 2], weights := [1, 1, 0, 1] }

def points80 : List (ℕ × ℕ) := [(0, 0), (1, 2), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 3981, representative 8136.
def source81 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨105, by decide +kernel⟩

def target81 : Weights.Entry :=
  { word := [4, 10, 0, 9, 8, 8, 4], weights := [1, 1, 0, 1] }

def points81 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 3984, representative 8133.
def source82 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨102, by decide +kernel⟩

def target82 : Weights.Entry :=
  { word := [4, 10, 0, 9, 8, 9, 4], weights := [1, 1, 0, 1] }

def points82 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 3986, representative 8132.
def source83 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨101, by decide +kernel⟩

def target83 : Weights.Entry :=
  { word := [4, 10, 0, 9, 8, 10, 2], weights := [1, 1, 0, 1] }

def points83 : List (ℕ × ℕ) := [(0, 0), (1, 2), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 3988, representative 8115.
def source84 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨84, by decide +kernel⟩

def target84 : Weights.Entry :=
  { word := [4, 10, 0, 10, 8, 0, 4], weights := [0, 1, 0, 1] }

def points84 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 3990, representative 8113.
def source85 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨82, by decide +kernel⟩

def target85 : Weights.Entry :=
  { word := [4, 10, 0, 10, 8, 8, 4], weights := [0, 1, 0, 1] }

def points85 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 3994, representative 8124.
def source86 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨93, by decide +kernel⟩

def target86 : Weights.Entry :=
  { word := [4, 10, 0, 12, 2, 0, 4], weights := [1, 1, 0, 1] }

def points86 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 4002, representative 8123.
def source87 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨92, by decide +kernel⟩

def target87 : Weights.Entry :=
  { word := [4, 10, 0, 12, 10, 0, 4], weights := [1, 1, 0, 1] }

def points87 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 4010, representative 8105.
def source88 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨74, by decide +kernel⟩

def target88 : Weights.Entry :=
  { word := [4, 10, 8, 2, 8, 8, 4], weights := [0, 1, 0, 1] }

def points88 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 4022, representative 8158.
def source89 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨127, by decide +kernel⟩

def target89 : Weights.Entry :=
  { word := [4, 10, 8, 8, 12, 6, 0], weights := [0, 1, 1, 0] }

def points89 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 4027, representative 8157.
def source90 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨126, by decide +kernel⟩

def target90 : Weights.Entry :=
  { word := [4, 10, 8, 10, 8, 6, 8], weights := [1, 1, 1, 1] }

-- Period 9, original row 4028, representative 8106.
def source91 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨75, by decide +kernel⟩

def target91 : Weights.Entry :=
  { word := [4, 10, 8, 10, 8, 8, 4], weights := [0, 1, 0, 1] }

def points91 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 4032, representative 8104.
def source92 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨73, by decide +kernel⟩

def target92 : Weights.Entry :=
  { word := [4, 10, 8, 10, 8, 12, 4], weights := [1, 2, 1, 2] }

def points92 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 4035, representative 8156.
def source93 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨125, by decide +kernel⟩

def target93 : Weights.Entry :=
  { word := [4, 10, 8, 12, 4, 4, 8], weights := [1, 1, 1, 1] }

-- Period 9, original row 4037, representative 8154.
def source94 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨123, by decide +kernel⟩

def target94 : Weights.Entry :=
  { word := [4, 10, 8, 12, 4, 12, 8], weights := [1, 1, 1, 1] }

-- Period 9, original row 4039, representative 8155.
def source95 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨124, by decide +kernel⟩

def target95 : Weights.Entry :=
  { word := [4, 10, 8, 12, 12, 4, 8], weights := [1, 1, 1, 1] }

-- Period 9, original row 4041, representative 8153.
def source96 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨122, by decide +kernel⟩

def target96 : Weights.Entry :=
  { word := [4, 10, 8, 12, 12, 12, 8], weights := [1, 1, 1, 1] }

-- Period 9, original row 4053, representative 8132.
def source97 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨101, by decide +kernel⟩

def target97 : Weights.Entry :=
  { word := [4, 12, 8, 8, 1, 12, 2], weights := [1, 0, 1, 1] }

def points97 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 4054, representative 8132.
def source98 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨101, by decide +kernel⟩

def target98 : Weights.Entry :=
  { word := [4, 12, 8, 8, 1, 12, 4], weights := [1, 0, 1, 1] }

def points98 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 4065, representative 8127.
def source99 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨96, by decide +kernel⟩

def target99 : Weights.Entry :=
  { word := [4, 12, 8, 8, 9, 12, 4], weights := [1, 0, 1, 1] }

def points99 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 4491, representative 8101.
def source100 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨70, by decide +kernel⟩

def target100 : Weights.Entry :=
  { word := [8, 1, 0, 1, 4, 2, 0], weights := [1, 1, 0, 0] }

def points100 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 4), (5, 5), (6, 3), (7, 1), (8, 2)]

-- Period 9, original row 4492, representative 8094.
def source101 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨63, by decide +kernel⟩

def target101 : Weights.Entry :=
  { word := [8, 1, 0, 1, 4, 10, 0], weights := [1, 0, 1, 0] }

def points101 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2)]

-- Period 9, original row 4493, representative 8101.
def source102 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨70, by decide +kernel⟩

def target102 : Weights.Entry :=
  { word := [8, 1, 0, 2, 2, 2, 0], weights := [1, 1, 0, 0] }

def points102 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 5), (4, 4), (5, 6), (6, 3), (7, 1), (8, 2)]

-- Period 9, original row 4495, representative 8094.
def source103 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨63, by decide +kernel⟩

def target103 : Weights.Entry :=
  { word := [8, 1, 0, 2, 2, 10, 0], weights := [1, 0, 0, 1] }

def points103 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 5), (4, 6), (5, 4), (6, 3), (7, 1), (8, 2)]

-- Period 9, original row 4519, representative 8077.
def source104 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨46, by decide +kernel⟩

def target104 : Weights.Entry :=
  { word := [8, 1, 4, 2, 0, 8, 0], weights := [0, 1, 0, 0] }

def points104 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 4527, representative 8071.
def source105 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨40, by decide +kernel⟩

def target105 : Weights.Entry :=
  { word := [8, 1, 4, 2, 0, 9, 0], weights := [0, 1, 0, 0] }

def points105 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 4529, representative 8071.
def source106 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨40, by decide +kernel⟩

def target106 : Weights.Entry :=
  { word := [8, 1, 4, 2, 0, 10, 0], weights := [0, 1, 0, 0] }

def points106 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 4531, representative 8076.
def source107 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨45, by decide +kernel⟩

def target107 : Weights.Entry :=
  { word := [8, 1, 4, 2, 8, 2, 0], weights := [0, 1, 0, 0] }

def points107 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 4535, representative 8072.
def source108 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨41, by decide +kernel⟩

def target108 : Weights.Entry :=
  { word := [8, 1, 4, 2, 8, 10, 0], weights := [0, 1, 0, 0] }

def points108 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 4539, representative 8074.
def source109 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨43, by decide +kernel⟩

def target109 : Weights.Entry :=
  { word := [8, 1, 4, 4, 4, 8, 0], weights := [0, 0, 1, 0] }

def points109 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 4541, representative 8073.
def source110 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨42, by decide +kernel⟩

def target110 : Weights.Entry :=
  { word := [8, 1, 4, 8, 4, 2, 0], weights := [0, 1, 1, 0] }

def points110 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 4), (5, 5), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 4543, representative 8070.
def source111 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨39, by decide +kernel⟩

def target111 : Weights.Entry :=
  { word := [8, 1, 4, 8, 4, 10, 0], weights := [0, 1, 1, 0] }

def points111 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 4571, representative 8075.
def source112 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨44, by decide +kernel⟩

def target112 : Weights.Entry :=
  { word := [8, 1, 4, 12, 4, 8, 0], weights := [0, 0, 1, 0] }

def points112 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 4573, representative 8102.
def source113 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨71, by decide +kernel⟩

def target113 : Weights.Entry :=
  { word := [8, 1, 8, 1, 4, 2, 0], weights := [1, 1, 0, 0] }

def points113 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 4), (5, 5), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 4574, representative 8095.
def source114 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨64, by decide +kernel⟩

def target114 : Weights.Entry :=
  { word := [8, 1, 8, 1, 4, 10, 0], weights := [1, 0, 1, 0] }

def points114 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 4575, representative 8097.
def source115 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨66, by decide +kernel⟩

def target115 : Weights.Entry :=
  { word := [8, 1, 8, 2, 2, 2, 0], weights := [0, 1, 0, 1] }

def points115 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 4577, representative 8090.
def source116 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨59, by decide +kernel⟩

def target116 : Weights.Entry :=
  { word := [8, 1, 8, 2, 2, 10, 0], weights := [0, 1, 0, 1] }

def points116 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 4579, representative 8098.
def source117 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨67, by decide +kernel⟩

def target117 : Weights.Entry :=
  { word := [8, 1, 8, 2, 10, 2, 0], weights := [0, 1, 0, 1] }

def points117 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 4581, representative 8091.
def source118 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨60, by decide +kernel⟩

def target118 : Weights.Entry :=
  { word := [8, 1, 8, 2, 10, 10, 0], weights := [0, 1, 0, 1] }

def points118 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 4608, representative 8069.
def source119 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨38, by decide +kernel⟩

def target119 : Weights.Entry :=
  { word := [8, 1, 12, 2, 0, 8, 0], weights := [0, 1, 0, 0] }

def points119 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 4616, representative 8063.
def source120 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨32, by decide +kernel⟩

def target120 : Weights.Entry :=
  { word := [8, 1, 12, 2, 0, 9, 0], weights := [0, 1, 0, 0] }

def points120 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 4618, representative 8063.
def source121 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨32, by decide +kernel⟩

def target121 : Weights.Entry :=
  { word := [8, 1, 12, 2, 0, 10, 0], weights := [0, 1, 0, 0] }

def points121 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 4620, representative 8068.
def source122 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨37, by decide +kernel⟩

def target122 : Weights.Entry :=
  { word := [8, 1, 12, 2, 8, 2, 0], weights := [0, 1, 0, 0] }

def points122 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 4624, representative 8064.
def source123 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨33, by decide +kernel⟩

def target123 : Weights.Entry :=
  { word := [8, 1, 12, 2, 8, 10, 0], weights := [0, 1, 0, 0] }

def points123 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 4628, representative 8066.
def source124 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨35, by decide +kernel⟩

def target124 : Weights.Entry :=
  { word := [8, 1, 12, 4, 4, 8, 0], weights := [0, 0, 1, 0] }

def points124 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 4630, representative 8065.
def source125 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨34, by decide +kernel⟩

def target125 : Weights.Entry :=
  { word := [8, 1, 12, 8, 4, 2, 0], weights := [0, 1, 1, 0] }

def points125 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 4), (5, 5), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 4632, representative 8062.
def source126 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨31, by decide +kernel⟩

def target126 : Weights.Entry :=
  { word := [8, 1, 12, 8, 4, 10, 0], weights := [0, 1, 1, 0] }

def points126 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 4664, representative 8067.
def source127 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨36, by decide +kernel⟩

def target127 : Weights.Entry :=
  { word := [8, 1, 12, 12, 4, 8, 0], weights := [0, 0, 1, 0] }

def points127 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

def period9Entries : List Weights.Entry := [target0, target1, target2, target3, target4, target5, target6, target7, target8, target9, target10, target11, target12, target13, target14, target15, target16, target17, target18, target19, target20, target21, target22, target23, target24, target25, target26, target27, target28, target29, target30, target31, target32, target33, target34, target35, target36, target37, target38, target39, target40, target41, target42, target43, target44, target45, target46, target47, target48, target49, target50, target51, target52, target53, target54, target55, target56, target57, target58, target59, target60, target61, target62, target63, target64, target65, target66, target67, target68, target69, target70, target71, target72, target73, target74, target75, target76, target77, target78, target79, target80, target81, target82, target83, target84, target85, target86, target87, target88, target89, target90, target91, target92, target93, target94, target95, target96, target97, target98, target99, target100, target101, target102, target103, target104, target105, target106, target107, target108, target109, target110, target111, target112, target113, target114, target115, target116, target117, target118, target119, target120, target121, target122, target123, target124, target125, target126, target127]

def period9Chunk : RowCoverage.Chunk where
  rows := [⟨2565, target0⟩, ⟨2575, target1⟩, ⟨2828, target2⟩, ⟨2854, target3⟩, ⟨2879, target4⟩, ⟨2947, target5⟩, ⟨2994, target6⟩, ⟨2995, target7⟩, ⟨3020, target8⟩, ⟨3021, target9⟩, ⟨3027, target10⟩, ⟨3038, target11⟩, ⟨3039, target12⟩, ⟨3067, target13⟩, ⟨3068, target14⟩, ⟨3095, target15⟩, ⟨3096, target16⟩, ⟨3102, target17⟩, ⟨3157, target18⟩, ⟨3166, target19⟩, ⟨3168, target20⟩, ⟨3171, target21⟩, ⟨3172, target22⟩, ⟨3174, target23⟩, ⟨3175, target24⟩, ⟨3176, target25⟩, ⟨3178, target26⟩, ⟨3180, target27⟩, ⟨3183, target28⟩, ⟨3185, target29⟩, ⟨3187, target30⟩, ⟨3195, target31⟩, ⟨3196, target32⟩, ⟨3200, target33⟩, ⟨3202, target34⟩, ⟨3206, target35⟩, ⟨3214, target36⟩, ⟨3231, target37⟩, ⟨3233, target38⟩, ⟨3236, target39⟩, ⟨3248, target40⟩, ⟨3254, target41⟩, ⟨3255, target42⟩, ⟨3256, target43⟩, ⟨3265, target44⟩, ⟨3269, target45⟩, ⟨3282, target46⟩, ⟨3283, target47⟩, ⟨3285, target48⟩, ⟨3286, target49⟩, ⟨3287, target50⟩, ⟨3289, target51⟩, ⟨3291, target52⟩, ⟨3294, target53⟩, ⟨3296, target54⟩, ⟨3304, target55⟩, ⟨3305, target56⟩, ⟨3306, target57⟩, ⟨3316, target58⟩, ⟨3322, target59⟩, ⟨3330, target60⟩, ⟨3335, target61⟩, ⟨3336, target62⟩, ⟨3344, target63⟩, ⟨3347, target64⟩, ⟨3352, target65⟩, ⟨3357, target66⟩, ⟨3358, target67⟩, ⟨3377, target68⟩, ⟨3379, target69⟩, ⟨3382, target70⟩, ⟨3667, target71⟩, ⟨3688, target72⟩, ⟨3689, target73⟩, ⟨3700, target74⟩, ⟨3746, target75⟩, ⟨3789, target76⟩, ⟨3861, target77⟩, ⟨3969, target78⟩, ⟨3977, target79⟩, ⟨3979, target80⟩, ⟨3981, target81⟩, ⟨3984, target82⟩, ⟨3986, target83⟩, ⟨3988, target84⟩, ⟨3990, target85⟩, ⟨3994, target86⟩, ⟨4002, target87⟩, ⟨4010, target88⟩, ⟨4022, target89⟩, ⟨4027, target90⟩, ⟨4028, target91⟩, ⟨4032, target92⟩, ⟨4035, target93⟩, ⟨4037, target94⟩, ⟨4039, target95⟩, ⟨4041, target96⟩, ⟨4053, target97⟩, ⟨4054, target98⟩, ⟨4065, target99⟩, ⟨4491, target100⟩, ⟨4492, target101⟩, ⟨4493, target102⟩, ⟨4495, target103⟩, ⟨4519, target104⟩, ⟨4527, target105⟩, ⟨4529, target106⟩, ⟨4531, target107⟩, ⟨4535, target108⟩, ⟨4539, target109⟩, ⟨4541, target110⟩, ⟨4543, target111⟩, ⟨4571, target112⟩, ⟨4573, target113⟩, ⟨4574, target114⟩, ⟨4575, target115⟩, ⟨4577, target116⟩, ⟨4579, target117⟩, ⟨4581, target118⟩, ⟨4608, target119⟩, ⟨4616, target120⟩, ⟨4618, target121⟩, ⟨4620, target122⟩, ⟨4624, target123⟩, ⟨4628, target124⟩, ⟨4630, target125⟩, ⟨4632, target126⟩, ⟨4664, target127⟩]
  indexMask := 1009020005520127025250785210035868904341029448567868102947231519290283566251797939255017916813861504881661448307587869574569012069177491115532578262039416258370920776050829979079243407347178184071344512955289139195784087319748327089073535945172694776650440511698641851548207770219243171406174339687015241254888536155271938625458874480593726557618116770712726348684088056978748990917467813150797290240911633618447985501719434254962727153688124710908438470338550145207344870439650298319471080437564815146059503373159889223371878904418275648174881655656192859001600197230505589715250131040607270105285512230578186711871260590660936699418892179952652018670952415352194282629323137974053964729915530633703245370171937299107607402155119413095429749919143279091352557501171656411356415991987875950037159335711410676895874457437507143870348052573674679458406090547696384775858903853515929292577611835995657166686977561896055716820994593179629681652575341711060366035443222111577047131002396510822243202124952145238263875247520015704017575335126592379678599829272479549645968150590657407586403397912518916515688838646662470588246914813701728628839709264006797872156853916636445116106014547281865118610247729937548107655476391184949923324672973549022282231226620400521007384221115454358434450763096377174662155682165416025649496871683682030994450922221451005075047928373622213432139927012375164033358739820616089600
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

end FranklSmallCyclic.TransportBatches.G063.B002.Data
