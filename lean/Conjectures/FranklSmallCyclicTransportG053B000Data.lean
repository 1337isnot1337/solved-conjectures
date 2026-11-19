module

public import Conjectures.FranklSmallCyclicRowCoverage
public import Conjectures.FranklSmallCyclicCanonicalWords
public import Conjectures.FranklSmallCyclicOrbit9Block000Data

/-! 128 literal targets sharing one source proof block.
Original words and row indices are retained; weights may be transported.
-/
@[expose] public section

namespace FranklSmallCyclic.TransportBatches.G053.B000.Data

-- Period 9, original row 306, representative 6745.
def source0 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B000.Data.entryAt ⟨5, by decide +kernel⟩

def target0 : Weights.Entry :=
  { word := [0, 2, 0, 8, 8, 4, 6], weights := [0, 1, 0, 1] }

-- Period 9, original row 313, representative 6858.
def source1 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B000.Data.entryAt ⟨113, by decide +kernel⟩

def target1 : Weights.Entry :=
  { word := [0, 2, 0, 8, 9, 12, 12], weights := [0, 1, 1, 0] }

-- Period 9, original row 415, representative 6853.
def source2 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B000.Data.entryAt ⟨108, by decide +kernel⟩

def target2 : Weights.Entry :=
  { word := [0, 2, 8, 8, 4, 12, 12], weights := [0, 1, 0, 1] }

-- Period 9, original row 420, representative 6851.
def source3 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B000.Data.entryAt ⟨106, by decide +kernel⟩

def target3 : Weights.Entry :=
  { word := [0, 2, 8, 8, 12, 12, 12], weights := [0, 1, 0, 1] }

-- Period 9, original row 765, representative 6872.
def source4 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B000.Data.entryAt ⟨126, by decide +kernel⟩

def target4 : Weights.Entry :=
  { word := [0, 6, 2, 8, 8, 12, 10], weights := [0, 1, 1, 0] }

-- Period 9, original row 792, representative 6871.
def source5 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B000.Data.entryAt ⟨125, by decide +kernel⟩

def target5 : Weights.Entry :=
  { word := [0, 6, 10, 8, 8, 12, 10], weights := [0, 1, 1, 0] }

-- Period 9, original row 864, representative 6746.
def source6 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B000.Data.entryAt ⟨6, by decide +kernel⟩

def target6 : Weights.Entry :=
  { word := [0, 8, 0, 8, 8, 4, 6], weights := [0, 1, 0, 1] }

-- Period 9, original row 1149, representative 6863.
def source7 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B000.Data.entryAt ⟨118, by decide +kernel⟩

def target7 : Weights.Entry :=
  { word := [0, 9, 0, 4, 0, 12, 12], weights := [1, 0, 1, 2] }

-- Period 9, original row 1175, representative 6861.
def source8 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B000.Data.entryAt ⟨116, by decide +kernel⟩

def target8 : Weights.Entry :=
  { word := [0, 9, 0, 4, 8, 12, 12], weights := [1, 0, 0, 1] }

-- Period 9, original row 1209, representative 6864.
def source9 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B000.Data.entryAt ⟨119, by decide +kernel⟩

def target9 : Weights.Entry :=
  { word := [0, 9, 0, 12, 0, 12, 12], weights := [1, 0, 1, 0] }

-- Period 9, original row 1234, representative 6862.
def source10 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B000.Data.entryAt ⟨117, by decide +kernel⟩

def target10 : Weights.Entry :=
  { word := [0, 9, 0, 12, 8, 12, 12], weights := [1, 0, 1, 0] }

-- Period 9, original row 1341, representative 6863.
def source11 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B000.Data.entryAt ⟨118, by decide +kernel⟩

def target11 : Weights.Entry :=
  { word := [0, 10, 0, 0, 1, 12, 12], weights := [0, 1, 1, 2] }

def points11 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 1343, representative 6856.
def source12 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B000.Data.entryAt ⟨111, by decide +kernel⟩

def target12 : Weights.Entry :=
  { word := [0, 10, 0, 0, 9, 12, 12], weights := [0, 1, 1, 2] }

-- Period 9, original row 1351, representative 6864.
def source13 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B000.Data.entryAt ⟨119, by decide +kernel⟩

def target13 : Weights.Entry :=
  { word := [0, 10, 0, 8, 1, 12, 12], weights := [0, 1, 1, 0] }

def points13 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 1355, representative 6744.
def source14 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B000.Data.entryAt ⟨4, by decide +kernel⟩

def target14 : Weights.Entry :=
  { word := [0, 10, 0, 8, 8, 4, 6], weights := [0, 1, 0, 1] }

-- Period 9, original row 1362, representative 6857.
def source15 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B000.Data.entryAt ⟨112, by decide +kernel⟩

def target15 : Weights.Entry :=
  { word := [0, 10, 0, 8, 9, 12, 12], weights := [0, 1, 1, 0] }

-- Period 9, original row 1407, representative 6873.
def source16 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B000.Data.entryAt ⟨127, by decide +kernel⟩

def target16 : Weights.Entry :=
  { word := [0, 10, 2, 2, 8, 12, 10], weights := [0, 1, 0, 1] }

-- Period 9, original row 1447, representative 6852.
def source17 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B000.Data.entryAt ⟨107, by decide +kernel⟩

def target17 : Weights.Entry :=
  { word := [0, 10, 8, 8, 4, 12, 12], weights := [0, 1, 0, 1] }

-- Period 9, original row 1452, representative 6850.
def source18 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B000.Data.entryAt ⟨105, by decide +kernel⟩

def target18 : Weights.Entry :=
  { word := [0, 10, 8, 8, 12, 12, 12], weights := [0, 1, 0, 1] }

-- Period 9, original row 2445, representative 6822.
def source19 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B000.Data.entryAt ⟨78, by decide +kernel⟩

def target19 : Weights.Entry :=
  { word := [2, 0, 4, 10, 0, 12, 10], weights := [1, 0, 1, 1] }

-- Period 9, original row 2446, representative 6822.
def source20 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B000.Data.entryAt ⟨78, by decide +kernel⟩

def target20 : Weights.Entry :=
  { word := [2, 0, 4, 10, 0, 12, 12], weights := [1, 0, 1, 1] }

def points20 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 8), (8, 7)]

-- Period 9, original row 2454, representative 6820.
def source21 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B000.Data.entryAt ⟨76, by decide +kernel⟩

def target21 : Weights.Entry :=
  { word := [2, 0, 4, 10, 8, 12, 12], weights := [1, 0, 1, 1] }

-- Period 9, original row 2475, representative 6806.
def source22 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B000.Data.entryAt ⟨62, by decide +kernel⟩

def target22 : Weights.Entry :=
  { word := [2, 0, 8, 4, 8, 12, 12], weights := [1, 0, 0, 1] }

-- Period 9, original row 2479, representative 6814.
def source23 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B000.Data.entryAt ⟨70, by decide +kernel⟩

def target23 : Weights.Entry :=
  { word := [2, 0, 8, 9, 4, 12, 12], weights := [1, 0, 1, 1] }

-- Period 9, original row 2483, representative 6813.
def source24 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B000.Data.entryAt ⟨69, by decide +kernel⟩

def target24 : Weights.Entry :=
  { word := [2, 0, 8, 9, 12, 12, 12], weights := [1, 0, 1, 1] }

-- Period 9, original row 2496, representative 6810.
def source25 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B000.Data.entryAt ⟨66, by decide +kernel⟩

def target25 : Weights.Entry :=
  { word := [2, 0, 8, 12, 0, 12, 10], weights := [1, 0, 1, 0] }

-- Period 9, original row 2497, representative 6810.
def source26 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B000.Data.entryAt ⟨66, by decide +kernel⟩

def target26 : Weights.Entry :=
  { word := [2, 0, 8, 12, 0, 12, 12], weights := [1, 0, 1, 0] }

def points26 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 8), (8, 7)]

-- Period 9, original row 2505, representative 6807.
def source27 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B000.Data.entryAt ⟨63, by decide +kernel⟩

def target27 : Weights.Entry :=
  { word := [2, 0, 8, 12, 8, 12, 12], weights := [1, 0, 1, 0] }

-- Period 9, original row 2516, representative 6831.
def source28 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B000.Data.entryAt ⟨87, by decide +kernel⟩

def target28 : Weights.Entry :=
  { word := [2, 0, 9, 8, 1, 12, 10], weights := [1, 0, 1, 1] }

-- Period 9, original row 2517, representative 6831.
def source29 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B000.Data.entryAt ⟨87, by decide +kernel⟩

def target29 : Weights.Entry :=
  { word := [2, 0, 9, 8, 1, 12, 12], weights := [1, 0, 1, 1] }

def points29 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 8), (8, 7)]

-- Period 9, original row 2521, representative 6826.
def source30 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B000.Data.entryAt ⟨82, by decide +kernel⟩

def target30 : Weights.Entry :=
  { word := [2, 0, 9, 8, 9, 12, 12], weights := [1, 0, 1, 1] }

-- Period 9, original row 2567, representative 6821.
def source31 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B000.Data.entryAt ⟨77, by decide +kernel⟩

def target31 : Weights.Entry :=
  { word := [2, 0, 12, 10, 0, 12, 10], weights := [1, 0, 1, 1] }

-- Period 9, original row 2568, representative 6821.
def source32 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B000.Data.entryAt ⟨77, by decide +kernel⟩

def target32 : Weights.Entry :=
  { word := [2, 0, 12, 10, 0, 12, 12], weights := [1, 0, 1, 1] }

def points32 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 8), (8, 7)]

-- Period 9, original row 2576, representative 6819.
def source33 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B000.Data.entryAt ⟨75, by decide +kernel⟩

def target33 : Weights.Entry :=
  { word := [2, 0, 12, 10, 8, 12, 12], weights := [1, 0, 1, 1] }

-- Period 9, original row 2592, representative 6754.
def source34 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B000.Data.entryAt ⟨14, by decide +kernel⟩

def target34 : Weights.Entry :=
  { word := [2, 2, 0, 9, 8, 8, 6], weights := [1, 1, 0, 1] }

-- Period 9, original row 2697, representative 6753.
def source35 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B000.Data.entryAt ⟨13, by decide +kernel⟩

def target35 : Weights.Entry :=
  { word := [2, 2, 8, 9, 8, 8, 6], weights := [1, 1, 0, 1] }

-- Period 9, original row 2830, representative 6802.
def source36 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B000.Data.entryAt ⟨58, by decide +kernel⟩

def target36 : Weights.Entry :=
  { word := [2, 8, 0, 4, 8, 12, 12], weights := [1, 0, 0, 1] }

-- Period 9, original row 2856, representative 6809.
def source37 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B000.Data.entryAt ⟨65, by decide +kernel⟩

def target37 : Weights.Entry :=
  { word := [2, 8, 0, 12, 0, 12, 12], weights := [1, 0, 1, 0] }

-- Period 9, original row 2881, representative 6805.
def source38 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B000.Data.entryAt ⟨61, by decide +kernel⟩

def target38 : Weights.Entry :=
  { word := [2, 8, 0, 12, 8, 12, 12], weights := [1, 0, 1, 0] }

-- Period 9, original row 2948, representative 6818.
def source39 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B000.Data.entryAt ⟨74, by decide +kernel⟩

def target39 : Weights.Entry :=
  { word := [2, 8, 4, 10, 8, 12, 12], weights := [2, 2, 1, 3] }

-- Period 9, original row 2997, representative 6800.
def source40 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B000.Data.entryAt ⟨56, by decide +kernel⟩

def target40 : Weights.Entry :=
  { word := [2, 8, 8, 4, 8, 12, 10], weights := [1, 0, 1, 0] }

-- Period 9, original row 2998, representative 6803.
def source41 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B000.Data.entryAt ⟨59, by decide +kernel⟩

def target41 : Weights.Entry :=
  { word := [2, 8, 8, 4, 8, 12, 12], weights := [1, 0, 0, 1] }

-- Period 9, original row 3023, representative 6832.
def source42 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B000.Data.entryAt ⟨88, by decide +kernel⟩

def target42 : Weights.Entry :=
  { word := [2, 8, 8, 8, 1, 12, 10], weights := [1, 0, 1, 1] }

-- Period 9, original row 3024, representative 6832.
def source43 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B000.Data.entryAt ⟨88, by decide +kernel⟩

def target43 : Weights.Entry :=
  { word := [2, 8, 8, 8, 1, 12, 12], weights := [1, 0, 1, 1] }

def points43 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 8), (8, 7)]

-- Period 9, original row 3028, representative 6827.
def source44 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B000.Data.entryAt ⟨83, by decide +kernel⟩

def target44 : Weights.Entry :=
  { word := [2, 8, 8, 8, 9, 12, 12], weights := [1, 0, 1, 1] }

-- Period 9, original row 3041, representative 6808.
def source45 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B000.Data.entryAt ⟨64, by decide +kernel⟩

def target45 : Weights.Entry :=
  { word := [2, 8, 8, 12, 0, 12, 10], weights := [1, 0, 1, 0] }

-- Period 9, original row 3042, representative 6808.
def source46 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B000.Data.entryAt ⟨64, by decide +kernel⟩

def target46 : Weights.Entry :=
  { word := [2, 8, 8, 12, 0, 12, 12], weights := [1, 0, 1, 0] }

def points46 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 8), (8, 7)]

-- Period 9, original row 3070, representative 6801.
def source47 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B000.Data.entryAt ⟨57, by decide +kernel⟩

def target47 : Weights.Entry :=
  { word := [2, 8, 8, 12, 8, 12, 10], weights := [1, 0, 1, 0] }

-- Period 9, original row 3071, representative 6804.
def source48 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B000.Data.entryAt ⟨60, by decide +kernel⟩

def target48 : Weights.Entry :=
  { word := [2, 8, 8, 12, 8, 12, 12], weights := [1, 0, 1, 0] }

-- Period 9, original row 3098, representative 6829.
def source49 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B000.Data.entryAt ⟨85, by decide +kernel⟩

def target49 : Weights.Entry :=
  { word := [2, 8, 9, 8, 1, 12, 10], weights := [1, 0, 1, 1] }

-- Period 9, original row 3099, representative 6829.
def source50 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B000.Data.entryAt ⟨85, by decide +kernel⟩

def target50 : Weights.Entry :=
  { word := [2, 8, 9, 8, 1, 12, 12], weights := [1, 0, 1, 1] }

def points50 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 8), (8, 7)]

-- Period 9, original row 3103, representative 6824.
def source51 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B000.Data.entryAt ⟨80, by decide +kernel⟩

def target51 : Weights.Entry :=
  { word := [2, 8, 9, 8, 9, 12, 12], weights := [1, 0, 1, 1] }

-- Period 9, original row 3158, representative 6817.
def source52 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B000.Data.entryAt ⟨73, by decide +kernel⟩

def target52 : Weights.Entry :=
  { word := [2, 8, 12, 10, 8, 12, 12], weights := [2, 1, 1, 2] }

-- Period 9, original row 3181, representative 6752.
def source53 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B000.Data.entryAt ⟨12, by decide +kernel⟩

def target53 : Weights.Entry :=
  { word := [2, 10, 0, 9, 8, 8, 6], weights := [1, 1, 0, 1] }

-- Period 9, original row 3292, representative 6751.
def source54 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B000.Data.entryAt ⟨11, by decide +kernel⟩

def target54 : Weights.Entry :=
  { word := [2, 10, 8, 9, 8, 8, 6], weights := [1, 1, 0, 1] }

-- Period 9, original row 3349, representative 6799.
def source55 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B000.Data.entryAt ⟨55, by decide +kernel⟩

def target55 : Weights.Entry :=
  { word := [2, 10, 8, 12, 8, 12, 10], weights := [2, 1, 2, 1] }

-- Period 9, original row 3578, representative 6754.
def source56 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B000.Data.entryAt ⟨14, by decide +kernel⟩

def target56 : Weights.Entry :=
  { word := [4, 2, 0, 9, 8, 8, 6], weights := [1, 1, 0, 1] }

def points56 : List (ℕ × ℕ) := [(0, 0), (1, 2), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 3668, representative 6812.
def source57 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B000.Data.entryAt ⟨68, by decide +kernel⟩

def target57 : Weights.Entry :=
  { word := [4, 2, 8, 10, 8, 12, 12], weights := [1, 2, 1, 2] }

-- Period 9, original row 3691, representative 6830.
def source58 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B000.Data.entryAt ⟨86, by decide +kernel⟩

def target58 : Weights.Entry :=
  { word := [4, 4, 8, 8, 1, 12, 10], weights := [1, 0, 1, 1] }

-- Period 9, original row 3692, representative 6830.
def source59 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B000.Data.entryAt ⟨86, by decide +kernel⟩

def target59 : Weights.Entry :=
  { word := [4, 4, 8, 8, 1, 12, 12], weights := [1, 0, 1, 1] }

def points59 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 8), (8, 7)]

-- Period 9, original row 3701, representative 6825.
def source60 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B000.Data.entryAt ⟨81, by decide +kernel⟩

def target60 : Weights.Entry :=
  { word := [4, 4, 8, 8, 9, 12, 12], weights := [1, 0, 1, 1] }

-- Period 9, original row 3748, representative 6802.
def source61 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B000.Data.entryAt ⟨58, by decide +kernel⟩

def target61 : Weights.Entry :=
  { word := [4, 8, 0, 4, 8, 12, 12], weights := [1, 0, 0, 1] }

def points61 : List (ℕ × ℕ) := [(0, 0), (1, 2), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 3791, representative 6805.
def source62 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B000.Data.entryAt ⟨61, by decide +kernel⟩

def target62 : Weights.Entry :=
  { word := [4, 8, 0, 12, 8, 12, 12], weights := [1, 0, 1, 0] }

def points62 : List (ℕ × ℕ) := [(0, 0), (1, 2), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 3862, representative 6816.
def source63 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B000.Data.entryAt ⟨72, by decide +kernel⟩

def target63 : Weights.Entry :=
  { word := [4, 8, 4, 10, 8, 12, 12], weights := [1, 1, 1, 1] }

-- Period 9, original row 3970, representative 6815.
def source64 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B000.Data.entryAt ⟨71, by decide +kernel⟩

def target64 : Weights.Entry :=
  { word := [4, 8, 12, 10, 8, 12, 12], weights := [1, 1, 1, 1] }

-- Period 9, original row 3982, representative 6752.
def source65 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B000.Data.entryAt ⟨12, by decide +kernel⟩

def target65 : Weights.Entry :=
  { word := [4, 10, 0, 9, 8, 8, 6], weights := [1, 1, 0, 1] }

def points65 : List (ℕ × ℕ) := [(0, 0), (1, 2), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 4033, representative 6811.
def source66 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B000.Data.entryAt ⟨67, by decide +kernel⟩

def target66 : Weights.Entry :=
  { word := [4, 10, 8, 10, 8, 12, 12], weights := [1, 2, 1, 2] }

-- Period 9, original row 4056, representative 6828.
def source67 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B000.Data.entryAt ⟨84, by decide +kernel⟩

def target67 : Weights.Entry :=
  { word := [4, 12, 8, 8, 1, 12, 10], weights := [1, 0, 1, 1] }

-- Period 9, original row 4057, representative 6828.
def source68 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B000.Data.entryAt ⟨84, by decide +kernel⟩

def target68 : Weights.Entry :=
  { word := [4, 12, 8, 8, 1, 12, 12], weights := [1, 0, 1, 1] }

def points68 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 8), (8, 7)]

-- Period 9, original row 4066, representative 6823.
def source69 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B000.Data.entryAt ⟨79, by decide +kernel⟩

def target69 : Weights.Entry :=
  { word := [4, 12, 8, 8, 9, 12, 12], weights := [1, 0, 1, 1] }

-- Period 9, original row 4076, representative 6745.
def source70 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B000.Data.entryAt ⟨5, by decide +kernel⟩

def target70 : Weights.Entry :=
  { word := [6, 2, 8, 8, 0, 4, 0], weights := [1, 0, 1, 0] }

def points70 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 4077, representative 6746.
def source71 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B000.Data.entryAt ⟨6, by decide +kernel⟩

def target71 : Weights.Entry :=
  { word := [6, 2, 8, 8, 0, 8, 0], weights := [1, 0, 1, 0] }

def points71 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 4078, representative 6744.
def source72 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B000.Data.entryAt ⟨4, by decide +kernel⟩

def target72 : Weights.Entry :=
  { word := [6, 2, 8, 8, 0, 12, 0], weights := [1, 0, 1, 0] }

def points72 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 4079, representative 6743.
def source73 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B000.Data.entryAt ⟨3, by decide +kernel⟩

def target73 : Weights.Entry :=
  { word := [6, 2, 8, 8, 1, 4, 8], weights := [0, 1, 3, 0] }

-- Period 9, original row 4080, representative 6742.
def source74 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B000.Data.entryAt ⟨2, by decide +kernel⟩

def target74 : Weights.Entry :=
  { word := [6, 2, 8, 8, 1, 12, 8], weights := [0, 1, 3, 0] }

-- Period 9, original row 4081, representative 6754.
def source75 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B000.Data.entryAt ⟨14, by decide +kernel⟩

def target75 : Weights.Entry :=
  { word := [6, 8, 8, 8, 1, 4, 2], weights := [1, 0, 1, 1] }

def points75 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 4082, representative 6754.
def source76 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B000.Data.entryAt ⟨14, by decide +kernel⟩

def target76 : Weights.Entry :=
  { word := [6, 8, 8, 8, 1, 4, 4], weights := [1, 0, 1, 1] }

def points76 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 4083, representative 6756.
def source77 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B000.Data.entryAt ⟨16, by decide +kernel⟩

def target77 : Weights.Entry :=
  { word := [6, 8, 8, 8, 1, 4, 8], weights := [0, 0, 1, 0] }

-- Period 9, original row 4084, representative 6750.
def source78 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B000.Data.entryAt ⟨10, by decide +kernel⟩

def target78 : Weights.Entry :=
  { word := [6, 8, 8, 8, 1, 4, 10], weights := [1, 0, 1, 1] }

-- Period 9, original row 4085, representative 6750.
def source79 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B000.Data.entryAt ⟨10, by decide +kernel⟩

def target79 : Weights.Entry :=
  { word := [6, 8, 8, 8, 1, 4, 12], weights := [1, 0, 1, 1] }

def points79 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 8), (8, 7)]

-- Period 9, original row 4086, representative 6752.
def source80 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B000.Data.entryAt ⟨12, by decide +kernel⟩

def target80 : Weights.Entry :=
  { word := [6, 8, 8, 8, 1, 12, 2], weights := [1, 0, 1, 1] }

def points80 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 4087, representative 6752.
def source81 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B000.Data.entryAt ⟨12, by decide +kernel⟩

def target81 : Weights.Entry :=
  { word := [6, 8, 8, 8, 1, 12, 4], weights := [1, 0, 1, 1] }

def points81 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 4088, representative 6755.
def source82 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B000.Data.entryAt ⟨15, by decide +kernel⟩

def target82 : Weights.Entry :=
  { word := [6, 8, 8, 8, 1, 12, 8], weights := [0, 0, 1, 0] }

-- Period 9, original row 4089, representative 6748.
def source83 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B000.Data.entryAt ⟨8, by decide +kernel⟩

def target83 : Weights.Entry :=
  { word := [6, 8, 8, 8, 1, 12, 10], weights := [1, 0, 1, 1] }

-- Period 9, original row 4090, representative 6748.
def source84 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B000.Data.entryAt ⟨8, by decide +kernel⟩

def target84 : Weights.Entry :=
  { word := [6, 8, 8, 8, 1, 12, 12], weights := [1, 0, 1, 1] }

def points84 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 8), (8, 7)]

-- Period 9, original row 4091, representative 6753.
def source85 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B000.Data.entryAt ⟨13, by decide +kernel⟩

def target85 : Weights.Entry :=
  { word := [6, 8, 8, 8, 9, 4, 4], weights := [1, 0, 1, 1] }

def points85 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 4092, representative 6749.
def source86 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B000.Data.entryAt ⟨9, by decide +kernel⟩

def target86 : Weights.Entry :=
  { word := [6, 8, 8, 8, 9, 4, 12], weights := [1, 0, 1, 1] }

-- Period 9, original row 4093, representative 6751.
def source87 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B000.Data.entryAt ⟨11, by decide +kernel⟩

def target87 : Weights.Entry :=
  { word := [6, 8, 8, 8, 9, 12, 4], weights := [1, 0, 1, 1] }

def points87 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 4094, representative 6747.
def source88 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B000.Data.entryAt ⟨7, by decide +kernel⟩

def target88 : Weights.Entry :=
  { word := [6, 8, 8, 8, 9, 12, 12], weights := [1, 0, 1, 1] }

-- Period 9, original row 4095, representative 6741.
def source89 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B000.Data.entryAt ⟨1, by decide +kernel⟩

def target89 : Weights.Entry :=
  { word := [6, 10, 8, 8, 1, 4, 8], weights := [0, 1, 3, 0] }

-- Period 9, original row 4096, representative 6740.
def source90 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B000.Data.entryAt ⟨0, by decide +kernel⟩

def target90 : Weights.Entry :=
  { word := [6, 10, 8, 8, 1, 12, 8], weights := [0, 1, 3, 0] }

-- Period 9, original row 4500, representative 6845.
def source91 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B000.Data.entryAt ⟨100, by decide +kernel⟩

def target91 : Weights.Entry :=
  { word := [8, 1, 0, 9, 4, 12, 12], weights := [1, 0, 1, 1] }

-- Period 9, original row 4504, representative 6841.
def source92 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B000.Data.entryAt ⟨96, by decide +kernel⟩

def target92 : Weights.Entry :=
  { word := [8, 1, 0, 9, 12, 12, 12], weights := [1, 0, 1, 1] }

-- Period 9, original row 4514, representative 6837.
def source93 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B000.Data.entryAt ⟨93, by decide +kernel⟩

def target93 : Weights.Entry :=
  { word := [8, 1, 0, 12, 0, 12, 12], weights := [1, 0, 1, 0] }

-- Period 9, original row 4560, representative 6849.
def source94 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B000.Data.entryAt ⟨104, by decide +kernel⟩

def target94 : Weights.Entry :=
  { word := [8, 1, 4, 10, 0, 12, 10], weights := [1, 0, 1, 1] }

-- Period 9, original row 4561, representative 6849.
def source95 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B000.Data.entryAt ⟨104, by decide +kernel⟩

def target95 : Weights.Entry :=
  { word := [8, 1, 4, 10, 0, 12, 12], weights := [1, 0, 1, 1] }

def points95 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 8), (8, 7)]

-- Period 9, original row 4569, representative 6847.
def source96 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B000.Data.entryAt ⟨102, by decide +kernel⟩

def target96 : Weights.Entry :=
  { word := [8, 1, 4, 10, 8, 12, 12], weights := [1, 0, 1, 1] }

-- Period 9, original row 4591, representative 6844.
def source97 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B000.Data.entryAt ⟨99, by decide +kernel⟩

def target97 : Weights.Entry :=
  { word := [8, 1, 8, 9, 4, 12, 12], weights := [1, 0, 1, 1] }

-- Period 9, original row 4595, representative 6840.
def source98 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B000.Data.entryAt ⟨95, by decide +kernel⟩

def target98 : Weights.Entry :=
  { word := [8, 1, 8, 9, 12, 12, 12], weights := [1, 0, 1, 1] }

-- Period 9, original row 4653, representative 6848.
def source99 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B000.Data.entryAt ⟨103, by decide +kernel⟩

def target99 : Weights.Entry :=
  { word := [8, 1, 12, 10, 0, 12, 10], weights := [1, 0, 1, 1] }

-- Period 9, original row 4654, representative 6848.
def source100 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B000.Data.entryAt ⟨103, by decide +kernel⟩

def target100 : Weights.Entry :=
  { word := [8, 1, 12, 10, 0, 12, 12], weights := [1, 0, 1, 1] }

def points100 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 8), (8, 7)]

-- Period 9, original row 4662, representative 6846.
def source101 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B000.Data.entryAt ⟨101, by decide +kernel⟩

def target101 : Weights.Entry :=
  { word := [8, 1, 12, 10, 8, 12, 12], weights := [1, 0, 1, 1] }

-- Period 9, original row 4695, representative 6860.
def source102 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B000.Data.entryAt ⟨115, by decide +kernel⟩

def target102 : Weights.Entry :=
  { word := [8, 2, 0, 8, 1, 12, 12], weights := [0, 2, 1, 1] }

-- Period 9, original row 4699, representative 6855.
def source103 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B000.Data.entryAt ⟨110, by decide +kernel⟩

def target103 : Weights.Entry :=
  { word := [8, 2, 0, 8, 9, 12, 12], weights := [0, 2, 1, 1] }

-- Period 9, original row 4710, representative 6743.
def source104 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B000.Data.entryAt ⟨3, by decide +kernel⟩

def target104 : Weights.Entry :=
  { word := [8, 2, 0, 9, 8, 4, 6], weights := [0, 3, 1, 0] }

def points104 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2)]

-- Period 9, original row 4713, representative 6756.
def source105 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B000.Data.entryAt ⟨16, by decide +kernel⟩

def target105 : Weights.Entry :=
  { word := [8, 2, 0, 9, 8, 8, 6], weights := [0, 1, 0, 0] }

def points105 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2)]

-- Period 9, original row 4720, representative 6741.
def source106 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B000.Data.entryAt ⟨1, by decide +kernel⟩

def target106 : Weights.Entry :=
  { word := [8, 2, 0, 9, 8, 12, 6], weights := [0, 3, 1, 0] }

def points106 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2)]

-- Period 9, original row 4845, representative 6869.
def source107 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B000.Data.entryAt ⟨123, by decide +kernel⟩

def target107 : Weights.Entry :=
  { word := [8, 2, 2, 10, 8, 12, 10], weights := [1, 1, 1, 1] }

-- Period 9, original row 5000, representative 6868.
def source108 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B000.Data.entryAt ⟨122, by decide +kernel⟩

def target108 : Weights.Entry :=
  { word := [8, 2, 10, 10, 8, 12, 10], weights := [1, 1, 1, 1] }

-- Period 9, original row 5310, representative 6870.
def source109 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B000.Data.entryAt ⟨124, by decide +kernel⟩

def target109 : Weights.Entry :=
  { word := [8, 6, 8, 12, 8, 12, 10], weights := [1, 1, 1, 1] }

-- Period 9, original row 5871, representative 6835.
def source110 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B000.Data.entryAt ⟨91, by decide +kernel⟩

def target110 : Weights.Entry :=
  { word := [8, 9, 0, 4, 0, 12, 12], weights := [1, 0, 1, 2] }

-- Period 9, original row 5897, representative 6833.
def source111 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B000.Data.entryAt ⟨89, by decide +kernel⟩

def target111 : Weights.Entry :=
  { word := [8, 9, 0, 4, 8, 12, 12], weights := [1, 0, 0, 1] }

-- Period 9, original row 5915, representative 6843.
def source112 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B000.Data.entryAt ⟨98, by decide +kernel⟩

def target112 : Weights.Entry :=
  { word := [8, 9, 0, 9, 4, 12, 12], weights := [1, 1, 1, 1] }

-- Period 9, original row 5919, representative 6839.
def source113 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B000.Data.entryAt ⟨94, by decide +kernel⟩

def target113 : Weights.Entry :=
  { word := [8, 9, 0, 9, 12, 12, 12], weights := [1, 1, 1, 1] }

-- Period 9, original row 5931, representative 6836.
def source114 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B000.Data.entryAt ⟨92, by decide +kernel⟩

def target114 : Weights.Entry :=
  { word := [8, 9, 0, 12, 0, 12, 12], weights := [1, 0, 1, 0] }

-- Period 9, original row 5956, representative 6834.
def source115 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B000.Data.entryAt ⟨90, by decide +kernel⟩

def target115 : Weights.Entry :=
  { word := [8, 9, 0, 12, 8, 12, 12], weights := [1, 0, 1, 0] }

-- Period 9, original row 6026, representative 6842.
def source116 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B000.Data.entryAt ⟨97, by decide +kernel⟩

def target116 : Weights.Entry :=
  { word := [8, 9, 8, 9, 4, 12, 12], weights := [1, 1, 1, 1] }

-- Period 9, original row 6089, representative 6859.
def source117 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B000.Data.entryAt ⟨114, by decide +kernel⟩

def target117 : Weights.Entry :=
  { word := [8, 10, 0, 8, 1, 12, 12], weights := [0, 2, 1, 1] }

-- Period 9, original row 6093, representative 6854.
def source118 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B000.Data.entryAt ⟨109, by decide +kernel⟩

def target118 : Weights.Entry :=
  { word := [8, 10, 0, 8, 9, 12, 12], weights := [0, 2, 1, 1] }

-- Period 9, original row 6104, representative 6742.
def source119 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B000.Data.entryAt ⟨2, by decide +kernel⟩

def target119 : Weights.Entry :=
  { word := [8, 10, 0, 9, 8, 4, 6], weights := [0, 3, 1, 0] }

def points119 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2)]

-- Period 9, original row 6107, representative 6755.
def source120 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B000.Data.entryAt ⟨15, by decide +kernel⟩

def target120 : Weights.Entry :=
  { word := [8, 10, 0, 9, 8, 8, 6], weights := [0, 1, 0, 0] }

def points120 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2)]

-- Period 9, original row 6114, representative 6740.
def source121 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B000.Data.entryAt ⟨0, by decide +kernel⟩

def target121 : Weights.Entry :=
  { word := [8, 10, 0, 9, 8, 12, 6], weights := [0, 3, 1, 0] }

def points121 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2)]

-- Period 9, original row 6208, representative 6867.
def source122 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B000.Data.entryAt ⟨121, by decide +kernel⟩

def target122 : Weights.Entry :=
  { word := [8, 10, 2, 10, 8, 12, 10], weights := [1, 1, 1, 1] }

-- Period 9, original row 6330, representative 6866.
def source123 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B000.Data.entryAt ⟨120, by decide +kernel⟩

def target123 : Weights.Entry :=
  { word := [8, 10, 10, 10, 8, 12, 10], weights := [1, 1, 1, 1] }

-- Period 9, original row 7406, representative 6776.
def source124 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B000.Data.entryAt ⟨35, by decide +kernel⟩

def target124 : Weights.Entry :=
  { word := [10, 0, 0, 9, 4, 12, 12], weights := [1, 0, 1, 1] }

-- Period 9, original row 7410, representative 6773.
def source125 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B000.Data.entryAt ⟨32, by decide +kernel⟩

def target125 : Weights.Entry :=
  { word := [10, 0, 0, 9, 12, 12, 12], weights := [1, 0, 1, 1] }

-- Period 9, original row 7420, representative 6769.
def source126 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B000.Data.entryAt ⟨28, by decide +kernel⟩

def target126 : Weights.Entry :=
  { word := [10, 0, 0, 12, 0, 12, 12], weights := [1, 0, 1, 0] }

-- Period 9, original row 7461, representative 6788.
def source127 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B000.Data.entryAt ⟨45, by decide +kernel⟩

def target127 : Weights.Entry :=
  { word := [10, 0, 4, 10, 0, 12, 10], weights := [1, 0, 1, 1] }

def period9Entries : List Weights.Entry := [target0, target1, target2, target3, target4, target5, target6, target7, target8, target9, target10, target11, target12, target13, target14, target15, target16, target17, target18, target19, target20, target21, target22, target23, target24, target25, target26, target27, target28, target29, target30, target31, target32, target33, target34, target35, target36, target37, target38, target39, target40, target41, target42, target43, target44, target45, target46, target47, target48, target49, target50, target51, target52, target53, target54, target55, target56, target57, target58, target59, target60, target61, target62, target63, target64, target65, target66, target67, target68, target69, target70, target71, target72, target73, target74, target75, target76, target77, target78, target79, target80, target81, target82, target83, target84, target85, target86, target87, target88, target89, target90, target91, target92, target93, target94, target95, target96, target97, target98, target99, target100, target101, target102, target103, target104, target105, target106, target107, target108, target109, target110, target111, target112, target113, target114, target115, target116, target117, target118, target119, target120, target121, target122, target123, target124, target125, target126, target127]

def period9Chunk : RowCoverage.Chunk where
  rows := [⟨306, target0⟩, ⟨313, target1⟩, ⟨415, target2⟩, ⟨420, target3⟩, ⟨765, target4⟩, ⟨792, target5⟩, ⟨864, target6⟩, ⟨1149, target7⟩, ⟨1175, target8⟩, ⟨1209, target9⟩, ⟨1234, target10⟩, ⟨1341, target11⟩, ⟨1343, target12⟩, ⟨1351, target13⟩, ⟨1355, target14⟩, ⟨1362, target15⟩, ⟨1407, target16⟩, ⟨1447, target17⟩, ⟨1452, target18⟩, ⟨2445, target19⟩, ⟨2446, target20⟩, ⟨2454, target21⟩, ⟨2475, target22⟩, ⟨2479, target23⟩, ⟨2483, target24⟩, ⟨2496, target25⟩, ⟨2497, target26⟩, ⟨2505, target27⟩, ⟨2516, target28⟩, ⟨2517, target29⟩, ⟨2521, target30⟩, ⟨2567, target31⟩, ⟨2568, target32⟩, ⟨2576, target33⟩, ⟨2592, target34⟩, ⟨2697, target35⟩, ⟨2830, target36⟩, ⟨2856, target37⟩, ⟨2881, target38⟩, ⟨2948, target39⟩, ⟨2997, target40⟩, ⟨2998, target41⟩, ⟨3023, target42⟩, ⟨3024, target43⟩, ⟨3028, target44⟩, ⟨3041, target45⟩, ⟨3042, target46⟩, ⟨3070, target47⟩, ⟨3071, target48⟩, ⟨3098, target49⟩, ⟨3099, target50⟩, ⟨3103, target51⟩, ⟨3158, target52⟩, ⟨3181, target53⟩, ⟨3292, target54⟩, ⟨3349, target55⟩, ⟨3578, target56⟩, ⟨3668, target57⟩, ⟨3691, target58⟩, ⟨3692, target59⟩, ⟨3701, target60⟩, ⟨3748, target61⟩, ⟨3791, target62⟩, ⟨3862, target63⟩, ⟨3970, target64⟩, ⟨3982, target65⟩, ⟨4033, target66⟩, ⟨4056, target67⟩, ⟨4057, target68⟩, ⟨4066, target69⟩, ⟨4076, target70⟩, ⟨4077, target71⟩, ⟨4078, target72⟩, ⟨4079, target73⟩, ⟨4080, target74⟩, ⟨4081, target75⟩, ⟨4082, target76⟩, ⟨4083, target77⟩, ⟨4084, target78⟩, ⟨4085, target79⟩, ⟨4086, target80⟩, ⟨4087, target81⟩, ⟨4088, target82⟩, ⟨4089, target83⟩, ⟨4090, target84⟩, ⟨4091, target85⟩, ⟨4092, target86⟩, ⟨4093, target87⟩, ⟨4094, target88⟩, ⟨4095, target89⟩, ⟨4096, target90⟩, ⟨4500, target91⟩, ⟨4504, target92⟩, ⟨4514, target93⟩, ⟨4560, target94⟩, ⟨4561, target95⟩, ⟨4569, target96⟩, ⟨4591, target97⟩, ⟨4595, target98⟩, ⟨4653, target99⟩, ⟨4654, target100⟩, ⟨4662, target101⟩, ⟨4695, target102⟩, ⟨4699, target103⟩, ⟨4710, target104⟩, ⟨4713, target105⟩, ⟨4720, target106⟩, ⟨4845, target107⟩, ⟨5000, target108⟩, ⟨5310, target109⟩, ⟨5871, target110⟩, ⟨5897, target111⟩, ⟨5915, target112⟩, ⟨5919, target113⟩, ⟨5931, target114⟩, ⟨5956, target115⟩, ⟨6026, target116⟩, ⟨6089, target117⟩, ⟨6093, target118⟩, ⟨6104, target119⟩, ⟨6107, target120⟩, ⟨6114, target121⟩, ⟨6208, target122⟩, ⟨6330, target123⟩, ⟨7406, target124⟩, ⟨7410, target125⟩, ⟨7420, target126⟩, ⟨7461, target127⟩]
  indexMask := 96560087128504402217495393344560998189766195362010285671247399753576958765260612526922680946987783967472980757145583300350919783503427206621202730162794666223651889748012549319971772752649401500356502143587898914470710581766045601727773261811655319553485350133807768240600355237265972700236399930812666430209922372246477554098861922749455428599762289820115617619974783267436124845728497611897094648902437732602454688087949875361494367855144071010338448601166937735222091717531766589618938488624423641398796494060744386612218585236725495368437808958947870026688324459062698063312420832264714268276079705159312418875193607757027059289796505886764065961270108659516144591967227340815473829575356617736470600936344768108042278046049638663949572519401912339714936501521767966474978491404563376428286747268243521424461455050127904387477104959480931668509223277413830440989836230870359293872118785763044196983315828059671693248461880636083912682345692798501214672820988010697492512381224302132569373990358583989000800728913352325504554357756727381778590007984298180538451489021490203835430001634224181053024051233593319211805610184541714764795094810318138579735355892922749659847467824493831441709944390749783834460394685837003946037554400775986275217436074482427871533502612786486349957053230238407444433486459529499798814481700563077309997598009815219212466764340615030589885545638699868979271535468827786144516711749693945562879758945310700143341497809794264943051853238143245815611566204854751735360954209825593888188873672573896631233497192468937338412955498441048633266907374530809215196948365802378462389828123197682620486735951525620149652153741117421858828361270294662082296703860760265571363217144854766602252956325184892587234067816181825912407188223796149089646784845069694443338005978778984501956930991723319438468720454471543792815829668957395630016148653069211272995141270305585534316125214684677683849801146403928526106067988888138765623779806189308256005434779224023606535415174373846092279509968666370475323416537793223921174152256297450557765840447962361173722532476736349405256022144570965186582721219147328135550350988638027714300392967630195691459174494443555688623557676160349328416933533548837990401836613124926746384219710160896
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

end FranklSmallCyclic.TransportBatches.G053.B000.Data
