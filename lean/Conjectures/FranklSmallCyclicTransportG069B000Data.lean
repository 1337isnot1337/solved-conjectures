module

public import Conjectures.FranklSmallCyclicRowCoverage
public import Conjectures.FranklSmallCyclicCanonicalWords
public import Conjectures.FranklSmallCyclicOrbit9Block016Data

/-! 128 literal targets sharing one source proof block.
Original words and row indices are retained; weights may be transported.
-/
@[expose] public section

namespace FranklSmallCyclic.TransportBatches.G069.B000.Data

-- Period 9, original row 150, representative 8827.
def source0 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B016.Data.entryAt ⟨28, by decide +kernel⟩

def target0 : Weights.Entry :=
  { word := [0, 1, 4, 2, 0, 8, 2], weights := [1, 0, 0, 1] }

-- Period 9, original row 151, representative 8827.
def source1 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B016.Data.entryAt ⟨28, by decide +kernel⟩

def target1 : Weights.Entry :=
  { word := [0, 1, 4, 2, 0, 8, 4], weights := [1, 0, 0, 1] }

def points1 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 8), (8, 7)]

-- Period 9, original row 162, representative 8828.
def source2 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B016.Data.entryAt ⟨29, by decide +kernel⟩

def target2 : Weights.Entry :=
  { word := [0, 1, 4, 2, 8, 8, 4], weights := [1, 0, 0, 1] }

-- Period 9, original row 178, representative 8834.
def source3 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B016.Data.entryAt ⟨35, by decide +kernel⟩

def target3 : Weights.Entry :=
  { word := [0, 1, 4, 10, 0, 8, 2], weights := [1, 0, 0, 1] }

-- Period 9, original row 179, representative 8834.
def source4 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B016.Data.entryAt ⟨35, by decide +kernel⟩

def target4 : Weights.Entry :=
  { word := [0, 1, 4, 10, 0, 8, 4], weights := [1, 0, 0, 1] }

def points4 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 8), (8, 7)]

-- Period 9, original row 194, representative 8831.
def source5 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B016.Data.entryAt ⟨32, by decide +kernel⟩

def target5 : Weights.Entry :=
  { word := [0, 1, 4, 10, 8, 8, 4], weights := [1, 0, 0, 1] }

-- Period 9, original row 239, representative 8832.
def source6 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B016.Data.entryAt ⟨33, by decide +kernel⟩

def target6 : Weights.Entry :=
  { word := [0, 1, 12, 2, 0, 8, 2], weights := [1, 0, 0, 1] }

-- Period 9, original row 240, representative 8832.
def source7 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B016.Data.entryAt ⟨33, by decide +kernel⟩

def target7 : Weights.Entry :=
  { word := [0, 1, 12, 2, 0, 8, 4], weights := [1, 0, 0, 1] }

def points7 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 8), (8, 7)]

-- Period 9, original row 251, representative 8829.
def source8 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B016.Data.entryAt ⟨30, by decide +kernel⟩

def target8 : Weights.Entry :=
  { word := [0, 1, 12, 2, 8, 8, 4], weights := [1, 0, 0, 1] }

-- Period 9, original row 271, representative 8833.
def source9 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B016.Data.entryAt ⟨34, by decide +kernel⟩

def target9 : Weights.Entry :=
  { word := [0, 1, 12, 10, 0, 8, 2], weights := [1, 0, 0, 1] }

-- Period 9, original row 272, representative 8833.
def source10 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B016.Data.entryAt ⟨34, by decide +kernel⟩

def target10 : Weights.Entry :=
  { word := [0, 1, 12, 10, 0, 8, 4], weights := [1, 0, 0, 1] }

def points10 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 8), (8, 7)]

-- Period 9, original row 287, representative 8830.
def source11 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B016.Data.entryAt ⟨31, by decide +kernel⟩

def target11 : Weights.Entry :=
  { word := [0, 1, 12, 10, 8, 8, 4], weights := [1, 0, 0, 1] }

-- Period 9, original row 322, representative 8827.
def source12 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B016.Data.entryAt ⟨28, by decide +kernel⟩

def target12 : Weights.Entry :=
  { word := [0, 2, 2, 2, 0, 8, 2], weights := [0, 1, 0, 1] }

def points12 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 323, representative 8827.
def source13 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B016.Data.entryAt ⟨28, by decide +kernel⟩

def target13 : Weights.Entry :=
  { word := [0, 2, 2, 2, 0, 8, 4], weights := [0, 1, 0, 1] }

def points13 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6), (7, 8), (8, 7)]

-- Period 9, original row 334, representative 8835.
def source14 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B016.Data.entryAt ⟨36, by decide +kernel⟩

def target14 : Weights.Entry :=
  { word := [0, 2, 2, 2, 8, 0, 4], weights := [1, 0, 0, 1] }

-- Period 9, original row 350, representative 8819.
def source15 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B016.Data.entryAt ⟨20, by decide +kernel⟩

def target15 : Weights.Entry :=
  { word := [0, 2, 2, 2, 8, 8, 2], weights := [1, 0, 0, 1] }

-- Period 9, original row 351, representative 8823.
def source16 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B016.Data.entryAt ⟨24, by decide +kernel⟩

def target16 : Weights.Entry :=
  { word := [0, 2, 2, 2, 8, 8, 4], weights := [1, 0, 0, 1] }

-- Period 9, original row 370, representative 8834.
def source17 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B016.Data.entryAt ⟨35, by decide +kernel⟩

def target17 : Weights.Entry :=
  { word := [0, 2, 2, 10, 0, 8, 2], weights := [0, 1, 0, 1] }

def points17 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 371, representative 8834.
def source18 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B016.Data.entryAt ⟨35, by decide +kernel⟩

def target18 : Weights.Entry :=
  { word := [0, 2, 2, 10, 0, 8, 4], weights := [0, 1, 0, 1] }

def points18 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6), (7, 8), (8, 7)]

-- Period 9, original row 385, representative 8836.
def source19 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B016.Data.entryAt ⟨37, by decide +kernel⟩

def target19 : Weights.Entry :=
  { word := [0, 2, 2, 10, 8, 0, 4], weights := [1, 1, 0, 0] }

-- Period 9, original row 398, representative 8822.
def source20 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B016.Data.entryAt ⟨23, by decide +kernel⟩

def target20 : Weights.Entry :=
  { word := [0, 2, 2, 10, 8, 8, 2], weights := [0, 1, 1, 0] }

-- Period 9, original row 399, representative 8826.
def source21 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B016.Data.entryAt ⟨27, by decide +kernel⟩

def target21 : Weights.Entry :=
  { word := [0, 2, 2, 10, 8, 8, 4], weights := [1, 0, 0, 1] }

-- Period 9, original row 427, representative 8832.
def source22 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B016.Data.entryAt ⟨33, by decide +kernel⟩

def target22 : Weights.Entry :=
  { word := [0, 2, 10, 2, 0, 8, 2], weights := [0, 1, 0, 1] }

def points22 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 428, representative 8832.
def source23 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B016.Data.entryAt ⟨33, by decide +kernel⟩

def target23 : Weights.Entry :=
  { word := [0, 2, 10, 2, 0, 8, 4], weights := [0, 1, 0, 1] }

def points23 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6), (7, 8), (8, 7)]

-- Period 9, original row 448, representative 8820.
def source24 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B016.Data.entryAt ⟨21, by decide +kernel⟩

def target24 : Weights.Entry :=
  { word := [0, 2, 10, 2, 8, 8, 2], weights := [1, 0, 0, 1] }

-- Period 9, original row 449, representative 8824.
def source25 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B016.Data.entryAt ⟨25, by decide +kernel⟩

def target25 : Weights.Entry :=
  { word := [0, 2, 10, 2, 8, 8, 4], weights := [1, 0, 0, 1] }

-- Period 9, original row 472, representative 8833.
def source26 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B016.Data.entryAt ⟨34, by decide +kernel⟩

def target26 : Weights.Entry :=
  { word := [0, 2, 10, 10, 0, 8, 2], weights := [0, 1, 0, 1] }

def points26 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 473, representative 8833.
def source27 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B016.Data.entryAt ⟨34, by decide +kernel⟩

def target27 : Weights.Entry :=
  { word := [0, 2, 10, 10, 0, 8, 4], weights := [0, 1, 0, 1] }

def points27 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6), (7, 8), (8, 7)]

-- Period 9, original row 493, representative 8821.
def source28 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B016.Data.entryAt ⟨22, by decide +kernel⟩

def target28 : Weights.Entry :=
  { word := [0, 2, 10, 10, 8, 8, 2], weights := [0, 1, 1, 0] }

-- Period 9, original row 494, representative 8825.
def source29 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B016.Data.entryAt ⟨26, by decide +kernel⟩

def target29 : Weights.Entry :=
  { word := [0, 2, 10, 10, 8, 8, 4], weights := [1, 0, 0, 1] }

-- Period 9, original row 1152, representative 8815.
def source30 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B016.Data.entryAt ⟨16, by decide +kernel⟩

def target30 : Weights.Entry :=
  { word := [0, 9, 0, 4, 2, 0, 4], weights := [1, 0, 0, 1] }

-- Period 9, original row 1157, representative 8807.
def source31 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B016.Data.entryAt ⟨8, by decide +kernel⟩

def target31 : Weights.Entry :=
  { word := [0, 9, 0, 4, 2, 8, 2], weights := [1, 0, 1, 0] }

-- Period 9, original row 1158, representative 8811.
def source32 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B016.Data.entryAt ⟨12, by decide +kernel⟩

def target32 : Weights.Entry :=
  { word := [0, 9, 0, 4, 2, 8, 4], weights := [1, 0, 0, 1] }

-- Period 9, original row 1178, representative 8816.
def source33 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B016.Data.entryAt ⟨17, by decide +kernel⟩

def target33 : Weights.Entry :=
  { word := [0, 9, 0, 4, 10, 0, 4], weights := [1, 0, 0, 1] }

-- Period 9, original row 1183, representative 8808.
def source34 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B016.Data.entryAt ⟨9, by decide +kernel⟩

def target34 : Weights.Entry :=
  { word := [0, 9, 0, 4, 10, 8, 2], weights := [1, 0, 1, 0] }

-- Period 9, original row 1184, representative 8812.
def source35 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B016.Data.entryAt ⟨13, by decide +kernel⟩

def target35 : Weights.Entry :=
  { word := [0, 9, 0, 4, 10, 8, 4], weights := [1, 0, 0, 1] }

-- Period 9, original row 1212, representative 8818.
def source36 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B016.Data.entryAt ⟨19, by decide +kernel⟩

def target36 : Weights.Entry :=
  { word := [0, 9, 0, 12, 2, 0, 4], weights := [1, 0, 1, 0] }

-- Period 9, original row 1217, representative 8810.
def source37 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B016.Data.entryAt ⟨11, by decide +kernel⟩

def target37 : Weights.Entry :=
  { word := [0, 9, 0, 12, 2, 8, 2], weights := [1, 0, 1, 0] }

-- Period 9, original row 1218, representative 8814.
def source38 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B016.Data.entryAt ⟨15, by decide +kernel⟩

def target38 : Weights.Entry :=
  { word := [0, 9, 0, 12, 2, 8, 4], weights := [1, 0, 1, 0] }

-- Period 9, original row 1237, representative 8817.
def source39 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B016.Data.entryAt ⟨18, by decide +kernel⟩

def target39 : Weights.Entry :=
  { word := [0, 9, 0, 12, 10, 0, 4], weights := [1, 0, 1, 0] }

-- Period 9, original row 1242, representative 8809.
def source40 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B016.Data.entryAt ⟨10, by decide +kernel⟩

def target40 : Weights.Entry :=
  { word := [0, 9, 0, 12, 10, 8, 2], weights := [1, 0, 1, 0] }

-- Period 9, original row 1243, representative 8813.
def source41 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B016.Data.entryAt ⟨14, by decide +kernel⟩

def target41 : Weights.Entry :=
  { word := [0, 9, 0, 12, 10, 8, 4], weights := [1, 0, 1, 0] }

-- Period 9, original row 1377, representative 8805.
def source42 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B016.Data.entryAt ⟨6, by decide +kernel⟩

def target42 : Weights.Entry :=
  { word := [0, 10, 2, 2, 8, 0, 4], weights := [1, 0, 0, 1] }

-- Period 9, original row 1394, representative 8801.
def source43 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B016.Data.entryAt ⟨2, by decide +kernel⟩

def target43 : Weights.Entry :=
  { word := [0, 10, 2, 2, 8, 8, 4], weights := [1, 0, 0, 1] }

-- Period 9, original row 1411, representative 8806.
def source44 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B016.Data.entryAt ⟨7, by decide +kernel⟩

def target44 : Weights.Entry :=
  { word := [0, 10, 2, 10, 8, 0, 4], weights := [1, 1, 0, 0] }

-- Period 9, original row 1424, representative 8800.
def source45 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B016.Data.entryAt ⟨1, by decide +kernel⟩

def target45 : Weights.Entry :=
  { word := [0, 10, 2, 10, 8, 8, 2], weights := [0, 1, 1, 0] }

-- Period 9, original row 1425, representative 8804.
def source46 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B016.Data.entryAt ⟨5, by decide +kernel⟩

def target46 : Weights.Entry :=
  { word := [0, 10, 2, 10, 8, 8, 4], weights := [1, 0, 0, 1] }

-- Period 9, original row 1469, representative 8802.
def source47 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B016.Data.entryAt ⟨3, by decide +kernel⟩

def target47 : Weights.Entry :=
  { word := [0, 10, 10, 2, 8, 8, 4], weights := [1, 0, 0, 1] }

-- Period 9, original row 1492, representative 8799.
def source48 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B016.Data.entryAt ⟨0, by decide +kernel⟩

def target48 : Weights.Entry :=
  { word := [0, 10, 10, 10, 8, 8, 2], weights := [0, 1, 1, 0] }

-- Period 9, original row 1493, representative 8803.
def source49 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B016.Data.entryAt ⟨4, by decide +kernel⟩

def target49 : Weights.Entry :=
  { word := [0, 10, 10, 10, 8, 8, 4], weights := [1, 0, 0, 1] }

-- Period 9, original row 2410, representative 8815.
def source50 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B016.Data.entryAt ⟨16, by decide +kernel⟩

def target50 : Weights.Entry :=
  { word := [2, 0, 4, 2, 0, 8, 1], weights := [1, 0, 0, 1] }

def points50 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 2433, representative 8818.
def source51 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B016.Data.entryAt ⟨19, by decide +kernel⟩

def target51 : Weights.Entry :=
  { word := [2, 0, 4, 10, 0, 8, 1], weights := [0, 1, 0, 1] }

def points51 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 2468, representative 8835.
def source52 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B016.Data.entryAt ⟨36, by decide +kernel⟩

def target52 : Weights.Entry :=
  { word := [2, 0, 8, 4, 4, 4, 0], weights := [1, 0, 0, 1] }

def points52 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 2470, representative 8805.
def source53 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B016.Data.entryAt ⟨6, by decide +kernel⟩

def target53 : Weights.Entry :=
  { word := [2, 0, 8, 4, 4, 12, 0], weights := [1, 0, 0, 1] }

def points53 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 2498, representative 8836.
def source54 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B016.Data.entryAt ⟨37, by decide +kernel⟩

def target54 : Weights.Entry :=
  { word := [2, 0, 8, 12, 4, 4, 0], weights := [0, 0, 1, 1] }

def points54 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 2500, representative 8806.
def source55 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B016.Data.entryAt ⟨7, by decide +kernel⟩

def target55 : Weights.Entry :=
  { word := [2, 0, 8, 12, 4, 12, 0], weights := [0, 0, 1, 1] }

def points55 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 2527, representative 8816.
def source56 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B016.Data.entryAt ⟨17, by decide +kernel⟩

def target56 : Weights.Entry :=
  { word := [2, 0, 12, 2, 0, 8, 1], weights := [1, 0, 0, 1] }

def points56 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 2555, representative 8817.
def source57 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B016.Data.entryAt ⟨18, by decide +kernel⟩

def target57 : Weights.Entry :=
  { word := [2, 0, 12, 10, 0, 8, 1], weights := [0, 1, 0, 1] }

def points57 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 2800, representative 8903.
def source58 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B016.Data.entryAt ⟨104, by decide +kernel⟩

def target58 : Weights.Entry :=
  { word := [2, 8, 0, 2, 2, 10, 8], weights := [1, 0, 0, 1] }

-- Period 9, original row 2804, representative 8912.
def source59 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B016.Data.entryAt ⟨113, by decide +kernel⟩

def target59 : Weights.Entry :=
  { word := [2, 8, 0, 2, 10, 10, 8], weights := [1, 0, 0, 1] }

-- Period 9, original row 2805, representative 8827.
def source60 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B016.Data.entryAt ⟨28, by decide +kernel⟩

def target60 : Weights.Entry :=
  { word := [2, 8, 0, 4, 2, 0, 1], weights := [1, 0, 0, 1] }

def points60 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2)]

-- Period 9, original row 2817, representative 8827.
def source61 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B016.Data.entryAt ⟨28, by decide +kernel⟩

def target61 : Weights.Entry :=
  { word := [2, 8, 0, 4, 4, 4, 0], weights := [1, 0, 1, 0] }

def points61 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 5), (4, 6), (5, 4), (6, 3), (7, 1), (8, 2)]

-- Period 9, original row 2820, representative 8881.
def source62 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B016.Data.entryAt ⟨82, by decide +kernel⟩

def target62 : Weights.Entry :=
  { word := [2, 8, 0, 4, 6, 0, 8], weights := [1, 0, 0, 1] }

-- Period 9, original row 2822, representative 8859.
def source63 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B016.Data.entryAt ⟨60, by decide +kernel⟩

def target63 : Weights.Entry :=
  { word := [2, 8, 0, 4, 6, 8, 8], weights := [1, 0, 0, 1] }

-- Period 9, original row 2831, representative 8832.
def source64 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B016.Data.entryAt ⟨33, by decide +kernel⟩

def target64 : Weights.Entry :=
  { word := [2, 8, 0, 4, 10, 0, 1], weights := [1, 0, 0, 1] }

def points64 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2)]

-- Period 9, original row 2843, representative 8832.
def source65 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B016.Data.entryAt ⟨33, by decide +kernel⟩

def target65 : Weights.Entry :=
  { word := [2, 8, 0, 4, 12, 4, 0], weights := [1, 0, 1, 0] }

def points65 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 5), (4, 6), (5, 4), (6, 3), (7, 1), (8, 2)]

-- Period 9, original row 2846, representative 8914.
def source66 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B016.Data.entryAt ⟨115, by decide +kernel⟩

def target66 : Weights.Entry :=
  { word := [2, 8, 0, 10, 2, 10, 8], weights := [1, 0, 0, 1] }

-- Period 9, original row 2848, representative 8913.
def source67 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B016.Data.entryAt ⟨114, by decide +kernel⟩

def target67 : Weights.Entry :=
  { word := [2, 8, 0, 10, 10, 10, 8], weights := [1, 0, 0, 1] }

-- Period 9, original row 2857, representative 8834.
def source68 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B016.Data.entryAt ⟨35, by decide +kernel⟩

def target68 : Weights.Entry :=
  { word := [2, 8, 0, 12, 2, 0, 1], weights := [1, 0, 0, 1] }

def points68 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2)]

-- Period 9, original row 2869, representative 8834.
def source69 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B016.Data.entryAt ⟨35, by decide +kernel⟩

def target69 : Weights.Entry :=
  { word := [2, 8, 0, 12, 4, 4, 0], weights := [1, 0, 1, 0] }

def points69 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 5), (4, 6), (5, 4), (6, 3), (7, 1), (8, 2)]

-- Period 9, original row 2871, representative 8886.
def source70 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B016.Data.entryAt ⟨87, by decide +kernel⟩

def target70 : Weights.Entry :=
  { word := [2, 8, 0, 12, 6, 0, 8], weights := [1, 0, 0, 1] }

-- Period 9, original row 2873, representative 8864.
def source71 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B016.Data.entryAt ⟨65, by decide +kernel⟩

def target71 : Weights.Entry :=
  { word := [2, 8, 0, 12, 6, 8, 8], weights := [1, 0, 0, 1] }

-- Period 9, original row 2882, representative 8833.
def source72 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B016.Data.entryAt ⟨34, by decide +kernel⟩

def target72 : Weights.Entry :=
  { word := [2, 8, 0, 12, 10, 0, 1], weights := [1, 0, 0, 1] }

def points72 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2)]

-- Period 9, original row 2894, representative 8833.
def source73 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B016.Data.entryAt ⟨34, by decide +kernel⟩

def target73 : Weights.Entry :=
  { word := [2, 8, 0, 12, 12, 4, 0], weights := [1, 0, 1, 0] }

def points73 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 5), (4, 6), (5, 4), (6, 3), (7, 1), (8, 2)]

-- Period 9, original row 2897, representative 8839.
def source74 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B016.Data.entryAt ⟨40, by decide +kernel⟩

def target74 : Weights.Entry :=
  { word := [2, 8, 2, 0, 1, 8, 8], weights := [0, 0, 1, 0] }

-- Period 9, original row 2900, representative 8840.
def source75 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B016.Data.entryAt ⟨41, by decide +kernel⟩

def target75 : Weights.Entry :=
  { word := [2, 8, 2, 0, 9, 8, 8], weights := [0, 0, 1, 0] }

-- Period 9, original row 2907, representative 8811.
def source76 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B016.Data.entryAt ⟨12, by decide +kernel⟩

def target76 : Weights.Entry :=
  { word := [2, 8, 4, 2, 0, 8, 1], weights := [1, 0, 0, 1] }

def points76 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 2915, representative 8915.
def source77 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B016.Data.entryAt ⟨116, by decide +kernel⟩

def target77 : Weights.Entry :=
  { word := [2, 8, 4, 2, 0, 9, 8], weights := [1, 0, 0, 1] }

-- Period 9, original row 2917, representative 8915.
def source78 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B016.Data.entryAt ⟨116, by decide +kernel⟩

def target78 : Weights.Entry :=
  { word := [2, 8, 4, 2, 0, 10, 8], weights := [1, 0, 0, 1] }

def points78 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 8), (8, 7)]

-- Period 9, original row 2923, representative 8920.
def source79 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B016.Data.entryAt ⟨121, by decide +kernel⟩

def target79 : Weights.Entry :=
  { word := [2, 8, 4, 2, 8, 10, 8], weights := [1, 0, 0, 1] }

-- Period 9, original row 2925, representative 8887.
def source80 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B016.Data.entryAt ⟨88, by decide +kernel⟩

def target80 : Weights.Entry :=
  { word := [2, 8, 4, 4, 4, 0, 8], weights := [1, 0, 0, 1] }

-- Period 9, original row 2927, representative 8865.
def source81 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B016.Data.entryAt ⟨66, by decide +kernel⟩

def target81 : Weights.Entry :=
  { word := [2, 8, 4, 4, 4, 8, 8], weights := [1, 0, 0, 1] }

-- Period 9, original row 2929, representative 8892.
def source82 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B016.Data.entryAt ⟨93, by decide +kernel⟩

def target82 : Weights.Entry :=
  { word := [2, 8, 4, 4, 12, 0, 8], weights := [1, 0, 0, 1] }

-- Period 9, original row 2931, representative 8870.
def source83 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B016.Data.entryAt ⟨71, by decide +kernel⟩

def target83 : Weights.Entry :=
  { word := [2, 8, 4, 4, 12, 8, 8], weights := [1, 0, 0, 1] }

-- Period 9, original row 2934, representative 8814.
def source84 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B016.Data.entryAt ⟨15, by decide +kernel⟩

def target84 : Weights.Entry :=
  { word := [2, 8, 4, 10, 0, 8, 1], weights := [0, 1, 0, 1] }

def points84 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 2941, representative 8922.
def source85 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B016.Data.entryAt ⟨123, by decide +kernel⟩

def target85 : Weights.Entry :=
  { word := [2, 8, 4, 10, 0, 9, 8], weights := [1, 0, 0, 1] }

-- Period 9, original row 2942, representative 8922.
def source86 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B016.Data.entryAt ⟨123, by decide +kernel⟩

def target86 : Weights.Entry :=
  { word := [2, 8, 4, 10, 0, 10, 8], weights := [1, 0, 0, 1] }

def points86 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 8), (8, 7)]

-- Period 9, original row 2946, representative 8921.
def source87 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B016.Data.entryAt ⟨122, by decide +kernel⟩

def target87 : Weights.Entry :=
  { word := [2, 8, 4, 10, 8, 10, 8], weights := [1, 0, 0, 1] }

-- Period 9, original row 2949, representative 8894.
def source88 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B016.Data.entryAt ⟨95, by decide +kernel⟩

def target88 : Weights.Entry :=
  { word := [2, 8, 4, 12, 4, 0, 8], weights := [1, 0, 0, 1] }

-- Period 9, original row 2951, representative 8872.
def source89 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B016.Data.entryAt ⟨73, by decide +kernel⟩

def target89 : Weights.Entry :=
  { word := [2, 8, 4, 12, 4, 8, 8], weights := [1, 0, 0, 1] }

-- Period 9, original row 2952, representative 8893.
def source90 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B016.Data.entryAt ⟨94, by decide +kernel⟩

def target90 : Weights.Entry :=
  { word := [2, 8, 4, 12, 12, 0, 8], weights := [1, 0, 0, 1] }

-- Period 9, original row 2954, representative 8871.
def source91 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B016.Data.entryAt ⟨72, by decide +kernel⟩

def target91 : Weights.Entry :=
  { word := [2, 8, 4, 12, 12, 8, 8], weights := [1, 0, 0, 1] }

-- Period 9, original row 2964, representative 8908.
def source92 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B016.Data.entryAt ⟨109, by decide +kernel⟩

def target92 : Weights.Entry :=
  { word := [2, 8, 8, 2, 2, 10, 8], weights := [1, 0, 0, 1] }

-- Period 9, original row 2968, representative 8909.
def source93 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B016.Data.entryAt ⟨110, by decide +kernel⟩

def target93 : Weights.Entry :=
  { word := [2, 8, 8, 2, 10, 10, 8], weights := [1, 0, 0, 1] }

-- Period 9, original row 2969, representative 8828.
def source94 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B016.Data.entryAt ⟨29, by decide +kernel⟩

def target94 : Weights.Entry :=
  { word := [2, 8, 8, 4, 2, 0, 1], weights := [1, 0, 0, 1] }

def points94 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 2981, representative 8823.
def source95 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B016.Data.entryAt ⟨24, by decide +kernel⟩

def target95 : Weights.Entry :=
  { word := [2, 8, 8, 4, 4, 4, 0], weights := [1, 0, 0, 1] }

def points95 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 2983, representative 8801.
def source96 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B016.Data.entryAt ⟨2, by decide +kernel⟩

def target96 : Weights.Entry :=
  { word := [2, 8, 8, 4, 4, 12, 0], weights := [1, 0, 0, 1] }

def points96 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 2986, representative 8884.
def source97 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B016.Data.entryAt ⟨85, by decide +kernel⟩

def target97 : Weights.Entry :=
  { word := [2, 8, 8, 4, 6, 0, 8], weights := [1, 0, 0, 1] }

-- Period 9, original row 2988, representative 8862.
def source98 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B016.Data.entryAt ⟨63, by decide +kernel⟩

def target98 : Weights.Entry :=
  { word := [2, 8, 8, 4, 6, 8, 8], weights := [1, 0, 0, 1] }

-- Period 9, original row 2999, representative 8829.
def source99 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B016.Data.entryAt ⟨30, by decide +kernel⟩

def target99 : Weights.Entry :=
  { word := [2, 8, 8, 4, 10, 0, 1], weights := [1, 0, 0, 1] }

def points99 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 3011, representative 8824.
def source100 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B016.Data.entryAt ⟨25, by decide +kernel⟩

def target100 : Weights.Entry :=
  { word := [2, 8, 8, 4, 12, 4, 0], weights := [1, 0, 0, 1] }

def points100 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 3013, representative 8802.
def source101 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B016.Data.entryAt ⟨3, by decide +kernel⟩

def target101 : Weights.Entry :=
  { word := [2, 8, 8, 4, 12, 12, 0], weights := [1, 0, 0, 1] }

def points101 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 3030, representative 8911.
def source102 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B016.Data.entryAt ⟨112, by decide +kernel⟩

def target102 : Weights.Entry :=
  { word := [2, 8, 8, 10, 2, 10, 8], weights := [1, 0, 0, 1] }

-- Period 9, original row 3032, representative 8910.
def source103 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B016.Data.entryAt ⟨111, by decide +kernel⟩

def target103 : Weights.Entry :=
  { word := [2, 8, 8, 10, 10, 10, 8], weights := [1, 0, 0, 1] }

-- Period 9, original row 3043, representative 8831.
def source104 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B016.Data.entryAt ⟨32, by decide +kernel⟩

def target104 : Weights.Entry :=
  { word := [2, 8, 8, 12, 2, 0, 1], weights := [1, 0, 0, 1] }

def points104 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 3055, representative 8826.
def source105 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B016.Data.entryAt ⟨27, by decide +kernel⟩

def target105 : Weights.Entry :=
  { word := [2, 8, 8, 12, 4, 4, 0], weights := [1, 0, 0, 1] }

def points105 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 3057, representative 8804.
def source106 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B016.Data.entryAt ⟨5, by decide +kernel⟩

def target106 : Weights.Entry :=
  { word := [2, 8, 8, 12, 4, 12, 0], weights := [1, 0, 0, 1] }

def points106 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 3059, representative 8885.
def source107 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B016.Data.entryAt ⟨86, by decide +kernel⟩

def target107 : Weights.Entry :=
  { word := [2, 8, 8, 12, 6, 0, 8], weights := [1, 0, 0, 1] }

-- Period 9, original row 3061, representative 8863.
def source108 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B016.Data.entryAt ⟨64, by decide +kernel⟩

def target108 : Weights.Entry :=
  { word := [2, 8, 8, 12, 6, 8, 8], weights := [1, 0, 0, 1] }

-- Period 9, original row 3072, representative 8830.
def source109 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B016.Data.entryAt ⟨31, by decide +kernel⟩

def target109 : Weights.Entry :=
  { word := [2, 8, 8, 12, 10, 0, 1], weights := [1, 0, 0, 1] }

def points109 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 3084, representative 8825.
def source110 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B016.Data.entryAt ⟨26, by decide +kernel⟩

def target110 : Weights.Entry :=
  { word := [2, 8, 8, 12, 12, 4, 0], weights := [1, 0, 0, 1] }

def points110 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 3086, representative 8803.
def source111 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B016.Data.entryAt ⟨4, by decide +kernel⟩

def target111 : Weights.Entry :=
  { word := [2, 8, 8, 12, 12, 12, 0], weights := [1, 0, 0, 1] }

def points111 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 3105, representative 8837.
def source112 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B016.Data.entryAt ⟨38, by decide +kernel⟩

def target112 : Weights.Entry :=
  { word := [2, 8, 10, 0, 1, 8, 8], weights := [0, 0, 1, 0] }

-- Period 9, original row 3108, representative 8838.
def source113 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B016.Data.entryAt ⟨39, by decide +kernel⟩

def target113 : Weights.Entry :=
  { word := [2, 8, 10, 0, 9, 8, 8], weights := [0, 0, 1, 0] }

-- Period 9, original row 3115, representative 8812.
def source114 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B016.Data.entryAt ⟨13, by decide +kernel⟩

def target114 : Weights.Entry :=
  { word := [2, 8, 12, 2, 0, 8, 1], weights := [1, 0, 0, 1] }

def points114 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 3123, representative 8916.
def source115 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B016.Data.entryAt ⟨117, by decide +kernel⟩

def target115 : Weights.Entry :=
  { word := [2, 8, 12, 2, 0, 9, 8], weights := [1, 0, 0, 1] }

-- Period 9, original row 3125, representative 8916.
def source116 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B016.Data.entryAt ⟨117, by decide +kernel⟩

def target116 : Weights.Entry :=
  { word := [2, 8, 12, 2, 0, 10, 8], weights := [1, 0, 0, 1] }

def points116 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 8), (8, 7)]

-- Period 9, original row 3131, representative 8917.
def source117 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B016.Data.entryAt ⟨118, by decide +kernel⟩

def target117 : Weights.Entry :=
  { word := [2, 8, 12, 2, 8, 10, 8], weights := [1, 0, 0, 1] }

-- Period 9, original row 3133, representative 8888.
def source118 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B016.Data.entryAt ⟨89, by decide +kernel⟩

def target118 : Weights.Entry :=
  { word := [2, 8, 12, 4, 4, 0, 8], weights := [1, 0, 0, 1] }

-- Period 9, original row 3135, representative 8866.
def source119 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B016.Data.entryAt ⟨67, by decide +kernel⟩

def target119 : Weights.Entry :=
  { word := [2, 8, 12, 4, 4, 8, 8], weights := [1, 0, 0, 1] }

-- Period 9, original row 3137, representative 8889.
def source120 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B016.Data.entryAt ⟨90, by decide +kernel⟩

def target120 : Weights.Entry :=
  { word := [2, 8, 12, 4, 12, 0, 8], weights := [1, 0, 0, 1] }

-- Period 9, original row 3139, representative 8867.
def source121 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B016.Data.entryAt ⟨68, by decide +kernel⟩

def target121 : Weights.Entry :=
  { word := [2, 8, 12, 4, 12, 8, 8], weights := [1, 0, 0, 1] }

-- Period 9, original row 3142, representative 8813.
def source122 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B016.Data.entryAt ⟨14, by decide +kernel⟩

def target122 : Weights.Entry :=
  { word := [2, 8, 12, 10, 0, 8, 1], weights := [0, 1, 0, 1] }

def points122 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 3149, representative 8919.
def source123 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B016.Data.entryAt ⟨120, by decide +kernel⟩

def target123 : Weights.Entry :=
  { word := [2, 8, 12, 10, 0, 9, 8], weights := [1, 0, 0, 1] }

-- Period 9, original row 3150, representative 8919.
def source124 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B016.Data.entryAt ⟨120, by decide +kernel⟩

def target124 : Weights.Entry :=
  { word := [2, 8, 12, 10, 0, 10, 8], weights := [1, 0, 0, 1] }

def points124 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 8), (8, 7)]

-- Period 9, original row 3156, representative 8918.
def source125 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B016.Data.entryAt ⟨119, by decide +kernel⟩

def target125 : Weights.Entry :=
  { word := [2, 8, 12, 10, 8, 10, 8], weights := [1, 0, 0, 1] }

-- Period 9, original row 3159, representative 8891.
def source126 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B016.Data.entryAt ⟨92, by decide +kernel⟩

def target126 : Weights.Entry :=
  { word := [2, 8, 12, 12, 4, 0, 8], weights := [1, 0, 0, 1] }

-- Period 9, original row 3161, representative 8869.
def source127 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B016.Data.entryAt ⟨70, by decide +kernel⟩

def target127 : Weights.Entry :=
  { word := [2, 8, 12, 12, 4, 8, 8], weights := [1, 0, 0, 1] }

def period9Entries : List Weights.Entry := [target0, target1, target2, target3, target4, target5, target6, target7, target8, target9, target10, target11, target12, target13, target14, target15, target16, target17, target18, target19, target20, target21, target22, target23, target24, target25, target26, target27, target28, target29, target30, target31, target32, target33, target34, target35, target36, target37, target38, target39, target40, target41, target42, target43, target44, target45, target46, target47, target48, target49, target50, target51, target52, target53, target54, target55, target56, target57, target58, target59, target60, target61, target62, target63, target64, target65, target66, target67, target68, target69, target70, target71, target72, target73, target74, target75, target76, target77, target78, target79, target80, target81, target82, target83, target84, target85, target86, target87, target88, target89, target90, target91, target92, target93, target94, target95, target96, target97, target98, target99, target100, target101, target102, target103, target104, target105, target106, target107, target108, target109, target110, target111, target112, target113, target114, target115, target116, target117, target118, target119, target120, target121, target122, target123, target124, target125, target126, target127]

def period9Chunk : RowCoverage.Chunk where
  rows := [⟨150, target0⟩, ⟨151, target1⟩, ⟨162, target2⟩, ⟨178, target3⟩, ⟨179, target4⟩, ⟨194, target5⟩, ⟨239, target6⟩, ⟨240, target7⟩, ⟨251, target8⟩, ⟨271, target9⟩, ⟨272, target10⟩, ⟨287, target11⟩, ⟨322, target12⟩, ⟨323, target13⟩, ⟨334, target14⟩, ⟨350, target15⟩, ⟨351, target16⟩, ⟨370, target17⟩, ⟨371, target18⟩, ⟨385, target19⟩, ⟨398, target20⟩, ⟨399, target21⟩, ⟨427, target22⟩, ⟨428, target23⟩, ⟨448, target24⟩, ⟨449, target25⟩, ⟨472, target26⟩, ⟨473, target27⟩, ⟨493, target28⟩, ⟨494, target29⟩, ⟨1152, target30⟩, ⟨1157, target31⟩, ⟨1158, target32⟩, ⟨1178, target33⟩, ⟨1183, target34⟩, ⟨1184, target35⟩, ⟨1212, target36⟩, ⟨1217, target37⟩, ⟨1218, target38⟩, ⟨1237, target39⟩, ⟨1242, target40⟩, ⟨1243, target41⟩, ⟨1377, target42⟩, ⟨1394, target43⟩, ⟨1411, target44⟩, ⟨1424, target45⟩, ⟨1425, target46⟩, ⟨1469, target47⟩, ⟨1492, target48⟩, ⟨1493, target49⟩, ⟨2410, target50⟩, ⟨2433, target51⟩, ⟨2468, target52⟩, ⟨2470, target53⟩, ⟨2498, target54⟩, ⟨2500, target55⟩, ⟨2527, target56⟩, ⟨2555, target57⟩, ⟨2800, target58⟩, ⟨2804, target59⟩, ⟨2805, target60⟩, ⟨2817, target61⟩, ⟨2820, target62⟩, ⟨2822, target63⟩, ⟨2831, target64⟩, ⟨2843, target65⟩, ⟨2846, target66⟩, ⟨2848, target67⟩, ⟨2857, target68⟩, ⟨2869, target69⟩, ⟨2871, target70⟩, ⟨2873, target71⟩, ⟨2882, target72⟩, ⟨2894, target73⟩, ⟨2897, target74⟩, ⟨2900, target75⟩, ⟨2907, target76⟩, ⟨2915, target77⟩, ⟨2917, target78⟩, ⟨2923, target79⟩, ⟨2925, target80⟩, ⟨2927, target81⟩, ⟨2929, target82⟩, ⟨2931, target83⟩, ⟨2934, target84⟩, ⟨2941, target85⟩, ⟨2942, target86⟩, ⟨2946, target87⟩, ⟨2949, target88⟩, ⟨2951, target89⟩, ⟨2952, target90⟩, ⟨2954, target91⟩, ⟨2964, target92⟩, ⟨2968, target93⟩, ⟨2969, target94⟩, ⟨2981, target95⟩, ⟨2983, target96⟩, ⟨2986, target97⟩, ⟨2988, target98⟩, ⟨2999, target99⟩, ⟨3011, target100⟩, ⟨3013, target101⟩, ⟨3030, target102⟩, ⟨3032, target103⟩, ⟨3043, target104⟩, ⟨3055, target105⟩, ⟨3057, target106⟩, ⟨3059, target107⟩, ⟨3061, target108⟩, ⟨3072, target109⟩, ⟨3084, target110⟩, ⟨3086, target111⟩, ⟨3105, target112⟩, ⟨3108, target113⟩, ⟨3115, target114⟩, ⟨3123, target115⟩, ⟨3125, target116⟩, ⟨3131, target117⟩, ⟨3133, target118⟩, ⟨3135, target119⟩, ⟨3137, target120⟩, ⟨3139, target121⟩, ⟨3142, target122⟩, ⟨3149, target123⟩, ⟨3150, target124⟩, ⟨3156, target125⟩, ⟨3159, target126⟩, ⟨3161, target127⟩]
  indexMask := 4609980813730065268586510478490256175667554393021260890486952249353330830739079197628358214759935080637965016482903535171297422326963224652697895966196410507254136423023298076727353674378309200166282711544619458613692306221425846738521341098335328581974858718776167515330097813854264612751119831188924674338629801500148699148063401172872648974371839110847224034996537096658093122873550146105481650132396463453462456916683694143575863404368397459098019530965571357784682415162364563452660221043867163209586453183988353379331988506087658842787193476353889202240667247824674484505815556282874948328103803804156113398023859589539608405965417436976739315610542614442872097754015796040486014930632477765410453233697984672201152576177895039598935045782352592011957096339656494830751579451808628793562240331112356513250006167701688903952809494987771478609360463355520643193403788499194313132560461631339250361163279481896497284737009388093908658509685765177344
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

end FranklSmallCyclic.TransportBatches.G069.B000.Data
