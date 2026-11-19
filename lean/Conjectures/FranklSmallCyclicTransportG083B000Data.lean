module

public import Conjectures.FranklSmallCyclicRowCoverage
public import Conjectures.FranklSmallCyclicCanonicalWords
public import Conjectures.FranklSmallCyclicOrbit10Block005Data

/-! 128 literal targets sharing one source proof block.
Original words and row indices are retained; weights may be transported.
-/
@[expose] public section

namespace FranklSmallCyclic.TransportBatches.G083.B000.Data

-- Period 10, original row 3170, representative 9792.
def source0 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B005.Data.entryAt ⟨24, by decide +kernel⟩

def target0 : Weights.Entry :=
  { word := [2, 10, 0, 2, 0, 8, 9], weights := [2, 1, 0, 1] }

-- Period 10, original row 3177, representative 9819.
def source1 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B005.Data.entryAt ⟨51, by decide +kernel⟩

def target1 : Weights.Entry :=
  { word := [2, 10, 0, 9, 8, 1, 12], weights := [1, 1, 0, 1] }

-- Period 10, original row 3179, representative 9817.
def source2 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B005.Data.entryAt ⟨49, by decide +kernel⟩

def target2 : Weights.Entry :=
  { word := [2, 10, 0, 9, 8, 2, 10], weights := [1, 1, 0, 1] }

-- Period 10, original row 3182, representative 9825.
def source3 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B005.Data.entryAt ⟨57, by decide +kernel⟩

def target3 : Weights.Entry :=
  { word := [2, 10, 0, 9, 8, 8, 12], weights := [1, 1, 0, 1] }

-- Period 10, original row 3184, representative 9815.
def source4 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B005.Data.entryAt ⟨47, by decide +kernel⟩

def target4 : Weights.Entry :=
  { word := [2, 10, 0, 9, 8, 9, 12], weights := [1, 1, 0, 1] }

-- Period 10, original row 3186, representative 9813.
def source5 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B005.Data.entryAt ⟨45, by decide +kernel⟩

def target5 : Weights.Entry :=
  { word := [2, 10, 0, 9, 8, 10, 10], weights := [1, 1, 0, 1] }

-- Period 10, original row 3191, representative 9807.
def source6 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B005.Data.entryAt ⟨39, by decide +kernel⟩

def target6 : Weights.Entry :=
  { word := [2, 10, 0, 10, 0, 0, 9], weights := [1, 1, 0, 0] }

-- Period 10, original row 3192, representative 9807.
def source7 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B005.Data.entryAt ⟨39, by decide +kernel⟩

def target7 : Weights.Entry :=
  { word := [2, 10, 0, 10, 0, 0, 10], weights := [1, 1, 0, 0] }

def points7 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 9), (9, 8)]

-- Period 10, original row 3193, representative 9807.
def source8 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B005.Data.entryAt ⟨39, by decide +kernel⟩

def target8 : Weights.Entry :=
  { word := [2, 10, 0, 10, 0, 0, 12], weights := [1, 1, 0, 0] }

def points8 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 8), (8, 9), (9, 7)]

-- Period 10, original row 3198, representative 9795.
def source9 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B005.Data.entryAt ⟨27, by decide +kernel⟩

def target9 : Weights.Entry :=
  { word := [2, 10, 0, 10, 0, 8, 9], weights := [1, 0, 0, 1] }

-- Period 10, original row 3199, representative 9803.
def source10 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B005.Data.entryAt ⟨35, by decide +kernel⟩

def target10 : Weights.Entry :=
  { word := [2, 10, 0, 10, 0, 8, 12], weights := [1, 0, 0, 1] }

-- Period 10, original row 3201, representative 9806.
def source11 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B005.Data.entryAt ⟨38, by decide +kernel⟩

def target11 : Weights.Entry :=
  { word := [2, 10, 0, 10, 8, 0, 12], weights := [1, 1, 0, 0] }

-- Period 10, original row 3203, representative 9800.
def source12 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B005.Data.entryAt ⟨32, by decide +kernel⟩

def target12 : Weights.Entry :=
  { word := [2, 10, 0, 10, 8, 8, 12], weights := [1, 0, 0, 1] }

-- Period 10, original row 3208, representative 9829.
def source13 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B005.Data.entryAt ⟨61, by decide +kernel⟩

def target13 : Weights.Entry :=
  { word := [2, 10, 0, 12, 2, 0, 9], weights := [1, 1, 1, 0] }

-- Period 10, original row 3209, representative 9829.
def source14 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B005.Data.entryAt ⟨61, by decide +kernel⟩

def target14 : Weights.Entry :=
  { word := [2, 10, 0, 12, 2, 0, 10], weights := [1, 1, 1, 0] }

def points14 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 9), (9, 8)]

-- Period 10, original row 3216, representative 9827.
def source15 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B005.Data.entryAt ⟨59, by decide +kernel⟩

def target15 : Weights.Entry :=
  { word := [2, 10, 0, 12, 10, 0, 9], weights := [1, 1, 1, 0] }

-- Period 10, original row 3217, representative 9827.
def source16 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B005.Data.entryAt ⟨59, by decide +kernel⟩

def target16 : Weights.Entry :=
  { word := [2, 10, 0, 12, 10, 0, 10], weights := [1, 1, 1, 0] }

def points16 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 9), (9, 8)]

-- Period 10, original row 3218, representative 9831.
def source17 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B005.Data.entryAt ⟨63, by decide +kernel⟩

def target17 : Weights.Entry :=
  { word := [2, 10, 0, 12, 10, 0, 12], weights := [1, 1, 0, 1] }

-- Period 10, original row 3229, representative 9811.
def source18 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B005.Data.entryAt ⟨43, by decide +kernel⟩

def target18 : Weights.Entry :=
  { word := [2, 10, 2, 8, 1, 8, 9], weights := [1, 1, 1, 1] }

-- Period 10, original row 3243, representative 9809.
def source19 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B005.Data.entryAt ⟨41, by decide +kernel⟩

def target19 : Weights.Entry :=
  { word := [2, 10, 2, 8, 9, 8, 9], weights := [1, 1, 1, 1] }

-- Period 10, original row 3258, representative 9793.
def source20 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B005.Data.entryAt ⟨25, by decide +kernel⟩

def target20 : Weights.Entry :=
  { word := [2, 10, 8, 2, 0, 8, 9], weights := [1, 0, 0, 1] }

-- Period 10, original row 3259, representative 9801.
def source21 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B005.Data.entryAt ⟨33, by decide +kernel⟩

def target21 : Weights.Entry :=
  { word := [2, 10, 8, 2, 0, 8, 10], weights := [1, 0, 0, 1] }

-- Period 10, original row 3260, representative 9801.
def source22 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B005.Data.entryAt ⟨33, by decide +kernel⟩

def target22 : Weights.Entry :=
  { word := [2, 10, 8, 2, 0, 8, 12], weights := [1, 0, 0, 1] }

def points22 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 8), (8, 7), (9, 9)]

-- Period 10, original row 3266, representative 9804.
def source23 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B005.Data.entryAt ⟨36, by decide +kernel⟩

def target23 : Weights.Entry :=
  { word := [2, 10, 8, 2, 8, 0, 12], weights := [1, 0, 0, 1] }

-- Period 10, original row 3270, representative 9798.
def source24 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B005.Data.entryAt ⟨30, by decide +kernel⟩

def target24 : Weights.Entry :=
  { word := [2, 10, 8, 2, 8, 8, 12], weights := [1, 0, 0, 1] }

-- Period 10, original row 3288, representative 9818.
def source25 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B005.Data.entryAt ⟨50, by decide +kernel⟩

def target25 : Weights.Entry :=
  { word := [2, 10, 8, 9, 8, 1, 12], weights := [1, 1, 0, 1] }

-- Period 10, original row 3290, representative 9816.
def source26 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B005.Data.entryAt ⟨48, by decide +kernel⟩

def target26 : Weights.Entry :=
  { word := [2, 10, 8, 9, 8, 2, 10], weights := [1, 1, 0, 1] }

-- Period 10, original row 3293, representative 9824.
def source27 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B005.Data.entryAt ⟨56, by decide +kernel⟩

def target27 : Weights.Entry :=
  { word := [2, 10, 8, 9, 8, 8, 12], weights := [1, 1, 0, 1] }

-- Period 10, original row 3295, representative 9814.
def source28 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B005.Data.entryAt ⟨46, by decide +kernel⟩

def target28 : Weights.Entry :=
  { word := [2, 10, 8, 9, 8, 9, 12], weights := [1, 1, 0, 1] }

-- Period 10, original row 3297, representative 9812.
def source29 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B005.Data.entryAt ⟨44, by decide +kernel⟩

def target29 : Weights.Entry :=
  { word := [2, 10, 8, 9, 8, 10, 10], weights := [1, 1, 0, 1] }

-- Period 10, original row 3308, representative 9794.
def source30 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B005.Data.entryAt ⟨26, by decide +kernel⟩

def target30 : Weights.Entry :=
  { word := [2, 10, 8, 10, 0, 8, 9], weights := [1, 0, 0, 1] }

-- Period 10, original row 3309, representative 9802.
def source31 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B005.Data.entryAt ⟨34, by decide +kernel⟩

def target31 : Weights.Entry :=
  { word := [2, 10, 8, 10, 0, 8, 10], weights := [1, 0, 0, 1] }

-- Period 10, original row 3310, representative 9802.
def source32 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B005.Data.entryAt ⟨34, by decide +kernel⟩

def target32 : Weights.Entry :=
  { word := [2, 10, 8, 10, 0, 8, 12], weights := [1, 0, 0, 1] }

def points32 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 8), (8, 7), (9, 9)]

-- Period 10, original row 3317, representative 9805.
def source33 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B005.Data.entryAt ⟨37, by decide +kernel⟩

def target33 : Weights.Entry :=
  { word := [2, 10, 8, 10, 8, 0, 12], weights := [1, 1, 0, 0] }

-- Period 10, original row 3323, representative 9799.
def source34 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B005.Data.entryAt ⟨31, by decide +kernel⟩

def target34 : Weights.Entry :=
  { word := [2, 10, 8, 10, 8, 8, 12], weights := [1, 0, 0, 1] }

-- Period 10, original row 3332, representative 9828.
def source35 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B005.Data.entryAt ⟨60, by decide +kernel⟩

def target35 : Weights.Entry :=
  { word := [2, 10, 8, 12, 2, 0, 9], weights := [1, 1, 1, 0] }

-- Period 10, original row 3333, representative 9828.
def source36 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B005.Data.entryAt ⟨60, by decide +kernel⟩

def target36 : Weights.Entry :=
  { word := [2, 10, 8, 12, 2, 0, 10], weights := [1, 1, 1, 0] }

def points36 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 9), (9, 8)]

-- Period 10, original row 3338, representative 9821.
def source37 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B005.Data.entryAt ⟨53, by decide +kernel⟩

def target37 : Weights.Entry :=
  { word := [2, 10, 8, 12, 2, 8, 10], weights := [1, 1, 1, 1] }

-- Period 10, original row 3339, representative 9823.
def source38 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B005.Data.entryAt ⟨55, by decide +kernel⟩

def target38 : Weights.Entry :=
  { word := [2, 10, 8, 12, 2, 8, 12], weights := [3, 1, 2, 2] }

-- Period 10, original row 3354, representative 9826.
def source39 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B005.Data.entryAt ⟨58, by decide +kernel⟩

def target39 : Weights.Entry :=
  { word := [2, 10, 8, 12, 10, 0, 9], weights := [1, 1, 1, 0] }

-- Period 10, original row 3355, representative 9826.
def source40 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B005.Data.entryAt ⟨58, by decide +kernel⟩

def target40 : Weights.Entry :=
  { word := [2, 10, 8, 12, 10, 0, 10], weights := [1, 1, 1, 0] }

def points40 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 9), (9, 8)]

-- Period 10, original row 3356, representative 9830.
def source41 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B005.Data.entryAt ⟨62, by decide +kernel⟩

def target41 : Weights.Entry :=
  { word := [2, 10, 8, 12, 10, 0, 12], weights := [1, 1, 0, 1] }

-- Period 10, original row 3360, representative 9820.
def source42 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B005.Data.entryAt ⟨52, by decide +kernel⟩

def target42 : Weights.Entry :=
  { word := [2, 10, 8, 12, 10, 8, 10], weights := [1, 1, 1, 1] }

-- Period 10, original row 3361, representative 9822.
def source43 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B005.Data.entryAt ⟨54, by decide +kernel⟩

def target43 : Weights.Entry :=
  { word := [2, 10, 8, 12, 10, 8, 12], weights := [2, 1, 1, 2] }

-- Period 10, original row 3375, representative 9810.
def source44 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B005.Data.entryAt ⟨42, by decide +kernel⟩

def target44 : Weights.Entry :=
  { word := [2, 10, 10, 8, 1, 8, 9], weights := [1, 1, 1, 1] }

-- Period 10, original row 3389, representative 9808.
def source45 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B005.Data.entryAt ⟨40, by decide +kernel⟩

def target45 : Weights.Entry :=
  { word := [2, 10, 10, 8, 9, 8, 9], weights := [1, 1, 1, 1] }

-- Period 10, original row 3978, representative 9819.
def source46 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B005.Data.entryAt ⟨51, by decide +kernel⟩

def target46 : Weights.Entry :=
  { word := [4, 10, 0, 9, 8, 1, 12], weights := [1, 1, 0, 1] }

def points46 : List (ℕ × ℕ) := [(0, 0), (1, 2), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8), (9, 9)]

-- Period 10, original row 3980, representative 9817.
def source47 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B005.Data.entryAt ⟨49, by decide +kernel⟩

def target47 : Weights.Entry :=
  { word := [4, 10, 0, 9, 8, 2, 10], weights := [1, 1, 0, 1] }

def points47 : List (ℕ × ℕ) := [(0, 0), (1, 2), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8), (9, 9)]

-- Period 10, original row 3983, representative 9825.
def source48 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B005.Data.entryAt ⟨57, by decide +kernel⟩

def target48 : Weights.Entry :=
  { word := [4, 10, 0, 9, 8, 8, 12], weights := [1, 1, 0, 1] }

def points48 : List (ℕ × ℕ) := [(0, 0), (1, 2), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8), (9, 9)]

-- Period 10, original row 3985, representative 9815.
def source49 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B005.Data.entryAt ⟨47, by decide +kernel⟩

def target49 : Weights.Entry :=
  { word := [4, 10, 0, 9, 8, 9, 12], weights := [1, 1, 0, 1] }

def points49 : List (ℕ × ℕ) := [(0, 0), (1, 2), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8), (9, 9)]

-- Period 10, original row 3987, representative 9813.
def source50 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B005.Data.entryAt ⟨45, by decide +kernel⟩

def target50 : Weights.Entry :=
  { word := [4, 10, 0, 9, 8, 10, 10], weights := [1, 1, 0, 1] }

def points50 : List (ℕ × ℕ) := [(0, 0), (1, 2), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8), (9, 9)]

-- Period 10, original row 3989, representative 9806.
def source51 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B005.Data.entryAt ⟨38, by decide +kernel⟩

def target51 : Weights.Entry :=
  { word := [4, 10, 0, 10, 8, 0, 12], weights := [1, 1, 0, 0] }

def points51 : List (ℕ × ℕ) := [(0, 0), (1, 2), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8), (9, 9)]

-- Period 10, original row 3991, representative 9800.
def source52 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B005.Data.entryAt ⟨32, by decide +kernel⟩

def target52 : Weights.Entry :=
  { word := [4, 10, 0, 10, 8, 8, 12], weights := [1, 0, 0, 1] }

def points52 : List (ℕ × ℕ) := [(0, 0), (1, 2), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8), (9, 9)]

-- Period 10, original row 3996, representative 9829.
def source53 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B005.Data.entryAt ⟨61, by decide +kernel⟩

def target53 : Weights.Entry :=
  { word := [4, 10, 0, 12, 2, 0, 9], weights := [1, 1, 1, 0] }

def points53 : List (ℕ × ℕ) := [(0, 0), (1, 2), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8), (9, 9)]

-- Period 10, original row 3997, representative 9829.
def source54 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B005.Data.entryAt ⟨61, by decide +kernel⟩

def target54 : Weights.Entry :=
  { word := [4, 10, 0, 12, 2, 0, 10], weights := [1, 1, 1, 0] }

def points54 : List (ℕ × ℕ) := [(0, 0), (1, 2), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 9), (9, 8)]

-- Period 10, original row 4004, representative 9827.
def source55 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B005.Data.entryAt ⟨59, by decide +kernel⟩

def target55 : Weights.Entry :=
  { word := [4, 10, 0, 12, 10, 0, 9], weights := [1, 1, 1, 0] }

def points55 : List (ℕ × ℕ) := [(0, 0), (1, 2), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8), (9, 9)]

-- Period 10, original row 4005, representative 9827.
def source56 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B005.Data.entryAt ⟨59, by decide +kernel⟩

def target56 : Weights.Entry :=
  { word := [4, 10, 0, 12, 10, 0, 10], weights := [1, 1, 1, 0] }

def points56 : List (ℕ × ℕ) := [(0, 0), (1, 2), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 9), (9, 8)]

-- Period 10, original row 4006, representative 9831.
def source57 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B005.Data.entryAt ⟨63, by decide +kernel⟩

def target57 : Weights.Entry :=
  { word := [4, 10, 0, 12, 10, 0, 12], weights := [1, 1, 0, 1] }

def points57 : List (ℕ × ℕ) := [(0, 0), (1, 2), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8), (9, 9)]

-- Period 10, original row 4011, representative 9796.
def source58 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B005.Data.entryAt ⟨28, by decide +kernel⟩

def target58 : Weights.Entry :=
  { word := [4, 10, 8, 2, 8, 8, 12], weights := [1, 0, 0, 1] }

-- Period 10, original row 4029, representative 9797.
def source59 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B005.Data.entryAt ⟨29, by decide +kernel⟩

def target59 : Weights.Entry :=
  { word := [4, 10, 8, 10, 8, 8, 12], weights := [1, 0, 0, 1] }

-- Period 10, original row 4512, representative 9807.
def source60 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B005.Data.entryAt ⟨39, by decide +kernel⟩

def target60 : Weights.Entry :=
  { word := [8, 1, 0, 12, 0, 12, 4], weights := [0, 0, 1, 1] }

def points60 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2), (9, 0)]

-- Period 10, original row 4525, representative 9776.
def source61 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B005.Data.entryAt ⟨8, by decide +kernel⟩

def target61 : Weights.Entry :=
  { word := [8, 1, 4, 2, 0, 8, 10], weights := [1, 0, 0, 1] }

-- Period 10, original row 4526, representative 9776.
def source62 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B005.Data.entryAt ⟨8, by decide +kernel⟩

def target62 : Weights.Entry :=
  { word := [8, 1, 4, 2, 0, 8, 12], weights := [1, 0, 0, 1] }

def points62 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 8), (8, 7), (9, 9)]

-- Period 10, original row 4534, representative 9777.
def source63 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B005.Data.entryAt ⟨9, by decide +kernel⟩

def target63 : Weights.Entry :=
  { word := [8, 1, 4, 2, 8, 8, 12], weights := [1, 0, 0, 1] }

-- Period 10, original row 4553, representative 9783.
def source64 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B005.Data.entryAt ⟨15, by decide +kernel⟩

def target64 : Weights.Entry :=
  { word := [8, 1, 4, 10, 0, 8, 10], weights := [1, 0, 0, 1] }

-- Period 10, original row 4554, representative 9783.
def source65 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B005.Data.entryAt ⟨15, by decide +kernel⟩

def target65 : Weights.Entry :=
  { word := [8, 1, 4, 10, 0, 8, 12], weights := [1, 0, 0, 1] }

def points65 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 8), (8, 7), (9, 9)]

-- Period 10, original row 4557, representative 9829.
def source66 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B005.Data.entryAt ⟨61, by decide +kernel⟩

def target66 : Weights.Entry :=
  { word := [8, 1, 4, 10, 0, 12, 2], weights := [0, 1, 1, 1] }

def points66 : List (ℕ × ℕ) := [(0, 9), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 4558, representative 9829.
def source67 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B005.Data.entryAt ⟨61, by decide +kernel⟩

def target67 : Weights.Entry :=
  { word := [8, 1, 4, 10, 0, 12, 4], weights := [0, 1, 1, 1] }

def points67 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 4566, representative 9780.
def source68 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B005.Data.entryAt ⟨12, by decide +kernel⟩

def target68 : Weights.Entry :=
  { word := [8, 1, 4, 10, 8, 8, 12], weights := [1, 0, 0, 1] }

-- Period 10, original row 4568, representative 9828.
def source69 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B005.Data.entryAt ⟨60, by decide +kernel⟩

def target69 : Weights.Entry :=
  { word := [8, 1, 4, 10, 8, 12, 4], weights := [0, 1, 1, 1] }

def points69 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 4614, representative 9781.
def source70 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B005.Data.entryAt ⟨13, by decide +kernel⟩

def target70 : Weights.Entry :=
  { word := [8, 1, 12, 2, 0, 8, 10], weights := [1, 0, 0, 1] }

-- Period 10, original row 4615, representative 9781.
def source71 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B005.Data.entryAt ⟨13, by decide +kernel⟩

def target71 : Weights.Entry :=
  { word := [8, 1, 12, 2, 0, 8, 12], weights := [1, 0, 0, 1] }

def points71 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 8), (8, 7), (9, 9)]

-- Period 10, original row 4623, representative 9778.
def source72 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B005.Data.entryAt ⟨10, by decide +kernel⟩

def target72 : Weights.Entry :=
  { word := [8, 1, 12, 2, 8, 8, 12], weights := [1, 0, 0, 1] }

-- Period 10, original row 4646, representative 9782.
def source73 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B005.Data.entryAt ⟨14, by decide +kernel⟩

def target73 : Weights.Entry :=
  { word := [8, 1, 12, 10, 0, 8, 10], weights := [1, 0, 0, 1] }

-- Period 10, original row 4647, representative 9782.
def source74 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B005.Data.entryAt ⟨14, by decide +kernel⟩

def target74 : Weights.Entry :=
  { word := [8, 1, 12, 10, 0, 8, 12], weights := [1, 0, 0, 1] }

def points74 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 8), (8, 7), (9, 9)]

-- Period 10, original row 4650, representative 9827.
def source75 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B005.Data.entryAt ⟨59, by decide +kernel⟩

def target75 : Weights.Entry :=
  { word := [8, 1, 12, 10, 0, 12, 2], weights := [0, 1, 1, 1] }

def points75 : List (ℕ × ℕ) := [(0, 9), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 4651, representative 9827.
def source76 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B005.Data.entryAt ⟨59, by decide +kernel⟩

def target76 : Weights.Entry :=
  { word := [8, 1, 12, 10, 0, 12, 4], weights := [0, 1, 1, 1] }

def points76 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 4659, representative 9779.
def source77 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B005.Data.entryAt ⟨11, by decide +kernel⟩

def target77 : Weights.Entry :=
  { word := [8, 1, 12, 10, 8, 8, 12], weights := [1, 0, 0, 1] }

-- Period 10, original row 4661, representative 9826.
def source78 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B005.Data.entryAt ⟨58, by decide +kernel⟩

def target78 : Weights.Entry :=
  { word := [8, 1, 12, 10, 8, 12, 4], weights := [0, 1, 1, 1] }

def points78 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 5869, representative 9792.
def source79 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B005.Data.entryAt ⟨24, by decide +kernel⟩

def target79 : Weights.Entry :=
  { word := [8, 9, 0, 4, 0, 12, 4], weights := [1, 0, 1, 2] }

def points79 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2), (9, 0)]

-- Period 10, original row 5895, representative 9793.
def source80 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B005.Data.entryAt ⟨25, by decide +kernel⟩

def target80 : Weights.Entry :=
  { word := [8, 9, 0, 4, 8, 12, 4], weights := [1, 0, 0, 1] }

def points80 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2), (9, 0)]

-- Period 10, original row 5914, representative 9811.
def source81 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B005.Data.entryAt ⟨43, by decide +kernel⟩

def target81 : Weights.Entry :=
  { word := [8, 9, 0, 9, 4, 12, 4], weights := [1, 1, 1, 1] }

def points81 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2), (9, 0)]

-- Period 10, original row 5918, representative 9810.
def source82 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B005.Data.entryAt ⟨42, by decide +kernel⟩

def target82 : Weights.Entry :=
  { word := [8, 9, 0, 9, 12, 12, 4], weights := [1, 1, 1, 1] }

def points82 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2), (9, 0)]

-- Period 10, original row 5929, representative 9795.
def source83 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B005.Data.entryAt ⟨27, by decide +kernel⟩

def target83 : Weights.Entry :=
  { word := [8, 9, 0, 12, 0, 12, 4], weights := [1, 0, 0, 1] }

def points83 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2), (9, 0)]

-- Period 10, original row 5954, representative 9794.
def source84 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B005.Data.entryAt ⟨26, by decide +kernel⟩

def target84 : Weights.Entry :=
  { word := [8, 9, 0, 12, 8, 12, 4], weights := [1, 0, 0, 1] }

def points84 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2), (9, 0)]

-- Period 10, original row 6025, representative 9809.
def source85 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B005.Data.entryAt ⟨41, by decide +kernel⟩

def target85 : Weights.Entry :=
  { word := [8, 9, 8, 9, 4, 12, 4], weights := [1, 1, 1, 1] }

def points85 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 6029, representative 9808.
def source86 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B005.Data.entryAt ⟨40, by decide +kernel⟩

def target86 : Weights.Entry :=
  { word := [8, 9, 8, 9, 12, 12, 4], weights := [1, 1, 1, 1] }

def points86 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 7418, representative 9807.
def source87 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B005.Data.entryAt ⟨39, by decide +kernel⟩

def target87 : Weights.Entry :=
  { word := [10, 0, 0, 12, 0, 12, 4], weights := [0, 0, 1, 1] }

def points87 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 0), (8, 1), (9, 2)]

-- Period 10, original row 7431, representative 9784.
def source88 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B005.Data.entryAt ⟨16, by decide +kernel⟩

def target88 : Weights.Entry :=
  { word := [10, 0, 4, 2, 0, 8, 10], weights := [1, 0, 0, 1] }

-- Period 10, original row 7432, representative 9784.
def source89 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B005.Data.entryAt ⟨16, by decide +kernel⟩

def target89 : Weights.Entry :=
  { word := [10, 0, 4, 2, 0, 8, 12], weights := [1, 0, 0, 1] }

def points89 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 8), (8, 7), (9, 9)]

-- Period 10, original row 7440, representative 9785.
def source90 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B005.Data.entryAt ⟨17, by decide +kernel⟩

def target90 : Weights.Entry :=
  { word := [10, 0, 4, 2, 8, 8, 12], weights := [1, 0, 0, 1] }

-- Period 10, original row 7454, representative 9791.
def source91 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B005.Data.entryAt ⟨23, by decide +kernel⟩

def target91 : Weights.Entry :=
  { word := [10, 0, 4, 10, 0, 8, 10], weights := [1, 0, 0, 1] }

-- Period 10, original row 7455, representative 9791.
def source92 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B005.Data.entryAt ⟨23, by decide +kernel⟩

def target92 : Weights.Entry :=
  { word := [10, 0, 4, 10, 0, 8, 12], weights := [1, 0, 0, 1] }

def points92 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 8), (8, 7), (9, 9)]

-- Period 10, original row 7467, representative 9788.
def source93 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B005.Data.entryAt ⟨20, by decide +kernel⟩

def target93 : Weights.Entry :=
  { word := [10, 0, 4, 10, 8, 8, 12], weights := [1, 0, 0, 1] }

-- Period 10, original row 7490, representative 9804.
def source94 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B005.Data.entryAt ⟨36, by decide +kernel⟩

def target94 : Weights.Entry :=
  { word := [10, 0, 8, 4, 8, 12, 4], weights := [1, 0, 0, 1] }

def points94 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 0), (9, 1)]

-- Period 10, original row 7509, representative 9806.
def source95 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B005.Data.entryAt ⟨38, by decide +kernel⟩

def target95 : Weights.Entry :=
  { word := [10, 0, 8, 12, 0, 12, 2], weights := [0, 0, 1, 1] }

def points95 : List (ℕ × ℕ) := [(0, 9), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 0), (9, 1)]

-- Period 10, original row 7510, representative 9806.
def source96 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B005.Data.entryAt ⟨38, by decide +kernel⟩

def target96 : Weights.Entry :=
  { word := [10, 0, 8, 12, 0, 12, 4], weights := [0, 0, 1, 1] }

def points96 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 0), (9, 1)]

-- Period 10, original row 7520, representative 9805.
def source97 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B005.Data.entryAt ⟨37, by decide +kernel⟩

def target97 : Weights.Entry :=
  { word := [10, 0, 8, 12, 8, 12, 4], weights := [0, 0, 1, 1] }

def points97 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 0), (9, 1)]

-- Period 10, original row 7529, representative 9819.
def source98 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B005.Data.entryAt ⟨51, by decide +kernel⟩

def target98 : Weights.Entry :=
  { word := [10, 0, 9, 8, 1, 12, 2], weights := [1, 0, 1, 1] }

def points98 : List (ℕ × ℕ) := [(0, 9), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 0), (9, 1)]

-- Period 10, original row 7530, representative 9819.
def source99 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B005.Data.entryAt ⟨51, by decide +kernel⟩

def target99 : Weights.Entry :=
  { word := [10, 0, 9, 8, 1, 12, 4], weights := [1, 0, 1, 1] }

def points99 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 0), (9, 1)]

-- Period 10, original row 7536, representative 9818.
def source100 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B005.Data.entryAt ⟨50, by decide +kernel⟩

def target100 : Weights.Entry :=
  { word := [10, 0, 9, 8, 9, 12, 4], weights := [1, 0, 1, 1] }

def points100 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 0), (9, 1)]

-- Period 10, original row 7548, representative 9789.
def source101 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B005.Data.entryAt ⟨21, by decide +kernel⟩

def target101 : Weights.Entry :=
  { word := [10, 0, 12, 2, 0, 8, 10], weights := [1, 0, 0, 1] }

-- Period 10, original row 7549, representative 9789.
def source102 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B005.Data.entryAt ⟨21, by decide +kernel⟩

def target102 : Weights.Entry :=
  { word := [10, 0, 12, 2, 0, 8, 12], weights := [1, 0, 0, 1] }

def points102 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 8), (8, 7), (9, 9)]

-- Period 10, original row 7557, representative 9786.
def source103 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B005.Data.entryAt ⟨18, by decide +kernel⟩

def target103 : Weights.Entry :=
  { word := [10, 0, 12, 2, 8, 8, 12], weights := [1, 0, 0, 1] }

-- Period 10, original row 7576, representative 9790.
def source104 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B005.Data.entryAt ⟨22, by decide +kernel⟩

def target104 : Weights.Entry :=
  { word := [10, 0, 12, 10, 0, 8, 10], weights := [1, 0, 0, 1] }

-- Period 10, original row 7577, representative 9790.
def source105 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B005.Data.entryAt ⟨22, by decide +kernel⟩

def target105 : Weights.Entry :=
  { word := [10, 0, 12, 10, 0, 8, 12], weights := [1, 0, 0, 1] }

def points105 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 8), (8, 7), (9, 9)]

-- Period 10, original row 7580, representative 9831.
def source106 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B005.Data.entryAt ⟨63, by decide +kernel⟩

def target106 : Weights.Entry :=
  { word := [10, 0, 12, 10, 0, 12, 2], weights := [1, 0, 1, 1] }

def points106 : List (ℕ × ℕ) := [(0, 9), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 0), (9, 1)]

-- Period 10, original row 7581, representative 9831.
def source107 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B005.Data.entryAt ⟨63, by decide +kernel⟩

def target107 : Weights.Entry :=
  { word := [10, 0, 12, 10, 0, 12, 4], weights := [1, 0, 1, 1] }

def points107 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 0), (9, 1)]

-- Period 10, original row 7589, representative 9787.
def source108 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B005.Data.entryAt ⟨19, by decide +kernel⟩

def target108 : Weights.Entry :=
  { word := [10, 0, 12, 10, 8, 8, 12], weights := [1, 0, 0, 1] }

-- Period 10, original row 7591, representative 9830.
def source109 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B005.Data.entryAt ⟨62, by decide +kernel⟩

def target109 : Weights.Entry :=
  { word := [10, 0, 12, 10, 8, 12, 4], weights := [1, 0, 1, 1] }

def points109 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 0), (9, 1)]

-- Period 10, original row 7823, representative 9776.
def source110 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B005.Data.entryAt ⟨8, by decide +kernel⟩

def target110 : Weights.Entry :=
  { word := [10, 8, 0, 4, 2, 0, 9], weights := [1, 0, 0, 1] }

def points110 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2), (9, 0)]

-- Period 10, original row 7824, representative 9776.
def source111 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B005.Data.entryAt ⟨8, by decide +kernel⟩

def target111 : Weights.Entry :=
  { word := [10, 8, 0, 4, 2, 0, 10], weights := [1, 0, 0, 1] }

def points111 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2), (9, 0)]

-- Period 10, original row 7825, representative 9784.
def source112 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B005.Data.entryAt ⟨16, by decide +kernel⟩

def target112 : Weights.Entry :=
  { word := [10, 8, 0, 4, 2, 0, 12], weights := [1, 0, 0, 1] }

def points112 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2), (9, 0)]

-- Period 10, original row 7830, representative 9768.
def source113 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B005.Data.entryAt ⟨0, by decide +kernel⟩

def target113 : Weights.Entry :=
  { word := [10, 8, 0, 4, 2, 8, 12], weights := [1, 0, 0, 1] }

-- Period 10, original row 7842, representative 9801.
def source114 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B005.Data.entryAt ⟨33, by decide +kernel⟩

def target114 : Weights.Entry :=
  { word := [10, 8, 0, 4, 8, 12, 4], weights := [1, 0, 0, 1] }

def points114 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2), (9, 0)]

-- Period 10, original row 7849, representative 9781.
def source115 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B005.Data.entryAt ⟨13, by decide +kernel⟩

def target115 : Weights.Entry :=
  { word := [10, 8, 0, 4, 10, 0, 9], weights := [1, 0, 0, 1] }

def points115 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2), (9, 0)]

-- Period 10, original row 7850, representative 9781.
def source116 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B005.Data.entryAt ⟨13, by decide +kernel⟩

def target116 : Weights.Entry :=
  { word := [10, 8, 0, 4, 10, 0, 10], weights := [1, 0, 0, 1] }

def points116 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2), (9, 0)]

-- Period 10, original row 7851, representative 9789.
def source117 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B005.Data.entryAt ⟨21, by decide +kernel⟩

def target117 : Weights.Entry :=
  { word := [10, 8, 0, 4, 10, 0, 12], weights := [1, 0, 0, 1] }

def points117 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2), (9, 0)]

-- Period 10, original row 7856, representative 9769.
def source118 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B005.Data.entryAt ⟨1, by decide +kernel⟩

def target118 : Weights.Entry :=
  { word := [10, 8, 0, 4, 10, 8, 12], weights := [1, 0, 0, 1] }

-- Period 10, original row 7868, representative 9803.
def source119 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B005.Data.entryAt ⟨35, by decide +kernel⟩

def target119 : Weights.Entry :=
  { word := [10, 8, 0, 12, 0, 12, 4], weights := [1, 0, 0, 1] }

def points119 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 7875, representative 9783.
def source120 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B005.Data.entryAt ⟨15, by decide +kernel⟩

def target120 : Weights.Entry :=
  { word := [10, 8, 0, 12, 2, 0, 9], weights := [1, 0, 0, 1] }

def points120 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2), (9, 0)]

-- Period 10, original row 7876, representative 9783.
def source121 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B005.Data.entryAt ⟨15, by decide +kernel⟩

def target121 : Weights.Entry :=
  { word := [10, 8, 0, 12, 2, 0, 10], weights := [1, 0, 0, 1] }

def points121 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2), (9, 0)]

-- Period 10, original row 7877, representative 9791.
def source122 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B005.Data.entryAt ⟨23, by decide +kernel⟩

def target122 : Weights.Entry :=
  { word := [10, 8, 0, 12, 2, 0, 12], weights := [1, 0, 0, 1] }

def points122 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2), (9, 0)]

-- Period 10, original row 7882, representative 9775.
def source123 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B005.Data.entryAt ⟨7, by decide +kernel⟩

def target123 : Weights.Entry :=
  { word := [10, 8, 0, 12, 2, 8, 12], weights := [1, 0, 1, 0] }

-- Period 10, original row 7893, representative 9802.
def source124 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B005.Data.entryAt ⟨34, by decide +kernel⟩

def target124 : Weights.Entry :=
  { word := [10, 8, 0, 12, 8, 12, 4], weights := [1, 0, 0, 1] }

def points124 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2), (9, 0)]

-- Period 10, original row 7900, representative 9782.
def source125 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B005.Data.entryAt ⟨14, by decide +kernel⟩

def target125 : Weights.Entry :=
  { word := [10, 8, 0, 12, 10, 0, 9], weights := [1, 0, 0, 1] }

def points125 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2), (9, 0)]

-- Period 10, original row 7901, representative 9782.
def source126 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B005.Data.entryAt ⟨14, by decide +kernel⟩

def target126 : Weights.Entry :=
  { word := [10, 8, 0, 12, 10, 0, 10], weights := [1, 0, 0, 1] }

def points126 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2), (9, 0)]

-- Period 10, original row 7902, representative 9790.
def source127 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B005.Data.entryAt ⟨22, by decide +kernel⟩

def target127 : Weights.Entry :=
  { word := [10, 8, 0, 12, 10, 0, 12], weights := [1, 0, 0, 1] }

def points127 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2), (9, 0)]

def period10Entries : List Weights.Entry := [target0, target1, target2, target3, target4, target5, target6, target7, target8, target9, target10, target11, target12, target13, target14, target15, target16, target17, target18, target19, target20, target21, target22, target23, target24, target25, target26, target27, target28, target29, target30, target31, target32, target33, target34, target35, target36, target37, target38, target39, target40, target41, target42, target43, target44, target45, target46, target47, target48, target49, target50, target51, target52, target53, target54, target55, target56, target57, target58, target59, target60, target61, target62, target63, target64, target65, target66, target67, target68, target69, target70, target71, target72, target73, target74, target75, target76, target77, target78, target79, target80, target81, target82, target83, target84, target85, target86, target87, target88, target89, target90, target91, target92, target93, target94, target95, target96, target97, target98, target99, target100, target101, target102, target103, target104, target105, target106, target107, target108, target109, target110, target111, target112, target113, target114, target115, target116, target117, target118, target119, target120, target121, target122, target123, target124, target125, target126, target127]

def period10Chunk : RowCoverage.Chunk where
  rows := [⟨3170, target0⟩, ⟨3177, target1⟩, ⟨3179, target2⟩, ⟨3182, target3⟩, ⟨3184, target4⟩, ⟨3186, target5⟩, ⟨3191, target6⟩, ⟨3192, target7⟩, ⟨3193, target8⟩, ⟨3198, target9⟩, ⟨3199, target10⟩, ⟨3201, target11⟩, ⟨3203, target12⟩, ⟨3208, target13⟩, ⟨3209, target14⟩, ⟨3216, target15⟩, ⟨3217, target16⟩, ⟨3218, target17⟩, ⟨3229, target18⟩, ⟨3243, target19⟩, ⟨3258, target20⟩, ⟨3259, target21⟩, ⟨3260, target22⟩, ⟨3266, target23⟩, ⟨3270, target24⟩, ⟨3288, target25⟩, ⟨3290, target26⟩, ⟨3293, target27⟩, ⟨3295, target28⟩, ⟨3297, target29⟩, ⟨3308, target30⟩, ⟨3309, target31⟩, ⟨3310, target32⟩, ⟨3317, target33⟩, ⟨3323, target34⟩, ⟨3332, target35⟩, ⟨3333, target36⟩, ⟨3338, target37⟩, ⟨3339, target38⟩, ⟨3354, target39⟩, ⟨3355, target40⟩, ⟨3356, target41⟩, ⟨3360, target42⟩, ⟨3361, target43⟩, ⟨3375, target44⟩, ⟨3389, target45⟩, ⟨3978, target46⟩, ⟨3980, target47⟩, ⟨3983, target48⟩, ⟨3985, target49⟩, ⟨3987, target50⟩, ⟨3989, target51⟩, ⟨3991, target52⟩, ⟨3996, target53⟩, ⟨3997, target54⟩, ⟨4004, target55⟩, ⟨4005, target56⟩, ⟨4006, target57⟩, ⟨4011, target58⟩, ⟨4029, target59⟩, ⟨4512, target60⟩, ⟨4525, target61⟩, ⟨4526, target62⟩, ⟨4534, target63⟩, ⟨4553, target64⟩, ⟨4554, target65⟩, ⟨4557, target66⟩, ⟨4558, target67⟩, ⟨4566, target68⟩, ⟨4568, target69⟩, ⟨4614, target70⟩, ⟨4615, target71⟩, ⟨4623, target72⟩, ⟨4646, target73⟩, ⟨4647, target74⟩, ⟨4650, target75⟩, ⟨4651, target76⟩, ⟨4659, target77⟩, ⟨4661, target78⟩, ⟨5869, target79⟩, ⟨5895, target80⟩, ⟨5914, target81⟩, ⟨5918, target82⟩, ⟨5929, target83⟩, ⟨5954, target84⟩, ⟨6025, target85⟩, ⟨6029, target86⟩, ⟨7418, target87⟩, ⟨7431, target88⟩, ⟨7432, target89⟩, ⟨7440, target90⟩, ⟨7454, target91⟩, ⟨7455, target92⟩, ⟨7467, target93⟩, ⟨7490, target94⟩, ⟨7509, target95⟩, ⟨7510, target96⟩, ⟨7520, target97⟩, ⟨7529, target98⟩, ⟨7530, target99⟩, ⟨7536, target100⟩, ⟨7548, target101⟩, ⟨7549, target102⟩, ⟨7557, target103⟩, ⟨7576, target104⟩, ⟨7577, target105⟩, ⟨7580, target106⟩, ⟨7581, target107⟩, ⟨7589, target108⟩, ⟨7591, target109⟩, ⟨7823, target110⟩, ⟨7824, target111⟩, ⟨7825, target112⟩, ⟨7830, target113⟩, ⟨7842, target114⟩, ⟨7849, target115⟩, ⟨7850, target116⟩, ⟨7851, target117⟩, ⟨7856, target118⟩, ⟨7868, target119⟩, ⟨7875, target120⟩, ⟨7876, target121⟩, ⟨7877, target122⟩, ⟨7882, target123⟩, ⟨7893, target124⟩, ⟨7900, target125⟩, ⟨7901, target126⟩, ⟨7902, target127⟩]
  indexMask := 960613018884116213508212838863022394114771747750024835387340202361074736110503443855020864059179604730697419541563455510746926287809163199187602455924972721100671749946006391221883647949061418866794845583039507082207914348973046716069475208255764315483466812817743140115561162069764461159860646001520398791564577325529778550994785690715207718635540614049423350659967076989999026122283723642723044644981906110343210613378176871069362000151698788245745526512794683857669508748341470664997993995228056663272992103388759520122090815840753007180980359038055118292406373591936335654655049650636404493949243136842788390981535020364232281741113775093641686357394099066349486310284589935320412622983973524956669003260367870837186885861512713814616944230555171844013335260493429516051333088996042567841583951775490653351323281789207905353423210630872213838914527076582423083181315743485732318339808555007576283664771637519182622531996664695797590701021311932071901447050277564631705214501143975291353349231662439448346383410779739602047661221490440784784505090002332828676779477159965126882578490171294958383779119585662211650519295370887069415938197348181081206704964410822886762147990050281679752917924677793816138776752344078467046717001090323837045708964708050003103689227192071613916174220766808861387199182987482006275153486470878542398645008169989709766084021637270250551796123898544181781608570158270430210967412230104409262326713775941419522220871882068547779505588029775912415705338768117805090465547520199756351640601337146544920927971812833629660140943458188171534878507172209904410248705824407093925438756315365131925021153846035672816310155846227785730983776685714712011670997086618018235589558474703229524574961163191636451187033698919520283322825082964769905338146894954942021863478495455555933741973535093019419721247742487755806051030832505523543781234396184289867422750803184187658247291486648985605247052887878515396390750929818900515552337054116034863468929861075786821694620411101633943446773435852463728088122143755489535426570028825806805059771858357226666412595616150286106075454358077431741970424035284463404417262562077759718140538149242282696871235808930887982541817985150308372271986407406266643667993376999207570873094173567429134000810425444146743333494524176140084316760690143249956730543388672956427952039546653857521484565971661102629899749619176006746112
  count := 128

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

end FranklSmallCyclic.TransportBatches.G083.B000.Data
