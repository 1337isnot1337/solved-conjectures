module

public import Conjectures.FranklSmallCyclicRowCoverage
public import Conjectures.FranklSmallCyclicCanonicalWords
public import Conjectures.FranklSmallCyclicOrbit9Block001Data

/-! 128 literal targets sharing one source proof block.
Original words and row indices are retained; weights may be transported.
-/
@[expose] public section

namespace FranklSmallCyclic.TransportBatches.G054.B000.Data

-- Period 9, original row 129, representative 6913.
def source0 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨37, by decide +kernel⟩

def target0 : Weights.Entry :=
  { word := [0, 1, 0, 9, 4, 12, 12], weights := [1, 0, 1, 1] }

-- Period 9, original row 133, representative 6909.
def source1 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨33, by decide +kernel⟩

def target1 : Weights.Entry :=
  { word := [0, 1, 0, 9, 12, 12, 12], weights := [1, 0, 1, 1] }

-- Period 9, original row 189, representative 6917.
def source2 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨41, by decide +kernel⟩

def target2 : Weights.Entry :=
  { word := [0, 1, 4, 10, 0, 12, 10], weights := [1, 0, 1, 1] }

-- Period 9, original row 190, representative 6917.
def source3 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨41, by decide +kernel⟩

def target3 : Weights.Entry :=
  { word := [0, 1, 4, 10, 0, 12, 12], weights := [1, 0, 1, 1] }

def points3 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 8), (8, 7)]

-- Period 9, original row 198, representative 6915.
def source4 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨39, by decide +kernel⟩

def target4 : Weights.Entry :=
  { word := [0, 1, 4, 10, 8, 12, 12], weights := [1, 0, 1, 1] }

-- Period 9, original row 220, representative 6912.
def source5 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨36, by decide +kernel⟩

def target5 : Weights.Entry :=
  { word := [0, 1, 8, 9, 4, 12, 12], weights := [1, 0, 1, 1] }

-- Period 9, original row 282, representative 6916.
def source6 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨40, by decide +kernel⟩

def target6 : Weights.Entry :=
  { word := [0, 1, 12, 10, 0, 12, 10], weights := [1, 0, 1, 1] }

-- Period 9, original row 283, representative 6916.
def source7 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨40, by decide +kernel⟩

def target7 : Weights.Entry :=
  { word := [0, 1, 12, 10, 0, 12, 12], weights := [1, 0, 1, 1] }

def points7 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 8), (8, 7)]

-- Period 9, original row 291, representative 6914.
def source8 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨38, by decide +kernel⟩

def target8 : Weights.Entry :=
  { word := [0, 1, 12, 10, 8, 12, 12], weights := [1, 0, 1, 1] }

-- Period 9, original row 309, representative 6905.
def source9 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨30, by decide +kernel⟩

def target9 : Weights.Entry :=
  { word := [0, 2, 0, 8, 8, 12, 12], weights := [0, 1, 0, 1] }

-- Period 9, original row 364, representative 6877.
def source10 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨3, by decide +kernel⟩

def target10 : Weights.Entry :=
  { word := [0, 2, 2, 2, 8, 12, 10], weights := [0, 1, 0, 1] }

-- Period 9, original row 365, representative 6897.
def source11 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨22, by decide +kernel⟩

def target11 : Weights.Entry :=
  { word := [0, 2, 2, 2, 8, 12, 12], weights := [0, 1, 0, 1] }

-- Period 9, original row 381, representative 6917.
def source12 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨41, by decide +kernel⟩

def target12 : Weights.Entry :=
  { word := [0, 2, 2, 10, 0, 12, 10], weights := [0, 1, 1, 1] }

def points12 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 382, representative 6917.
def source13 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨41, by decide +kernel⟩

def target13 : Weights.Entry :=
  { word := [0, 2, 2, 10, 0, 12, 12], weights := [0, 1, 1, 1] }

def points13 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6), (7, 8), (8, 7)]

-- Period 9, original row 409, representative 6880.
def source14 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨6, by decide +kernel⟩

def target14 : Weights.Entry :=
  { word := [0, 2, 2, 10, 8, 12, 10], weights := [0, 1, 1, 0] }

-- Period 9, original row 410, representative 6900.
def source15 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨25, by decide +kernel⟩

def target15 : Weights.Entry :=
  { word := [0, 2, 2, 10, 8, 12, 12], weights := [0, 1, 0, 1] }

-- Period 9, original row 462, representative 6878.
def source16 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨4, by decide +kernel⟩

def target16 : Weights.Entry :=
  { word := [0, 2, 10, 2, 8, 12, 10], weights := [0, 1, 0, 1] }

-- Period 9, original row 463, representative 6898.
def source17 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨23, by decide +kernel⟩

def target17 : Weights.Entry :=
  { word := [0, 2, 10, 2, 8, 12, 12], weights := [0, 1, 0, 1] }

-- Period 9, original row 483, representative 6916.
def source18 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨40, by decide +kernel⟩

def target18 : Weights.Entry :=
  { word := [0, 2, 10, 10, 0, 12, 10], weights := [0, 1, 1, 1] }

def points18 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 484, representative 6916.
def source19 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨40, by decide +kernel⟩

def target19 : Weights.Entry :=
  { word := [0, 2, 10, 10, 0, 12, 12], weights := [0, 1, 1, 1] }

def points19 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6), (7, 8), (8, 7)]

-- Period 9, original row 504, representative 6879.
def source20 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨5, by decide +kernel⟩

def target20 : Weights.Entry :=
  { word := [0, 2, 10, 10, 8, 12, 10], weights := [0, 1, 1, 0] }

-- Period 9, original row 505, representative 6899.
def source21 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨24, by decide +kernel⟩

def target21 : Weights.Entry :=
  { word := [0, 2, 10, 10, 8, 12, 12], weights := [0, 1, 0, 1] }

-- Period 9, original row 593, representative 6958.
def source22 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨82, by decide +kernel⟩

def target22 : Weights.Entry :=
  { word := [0, 4, 2, 8, 8, 12, 10], weights := [0, 1, 1, 0] }

-- Period 9, original row 659, representative 6963.
def source23 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨87, by decide +kernel⟩

def target23 : Weights.Entry :=
  { word := [0, 4, 8, 4, 8, 12, 10], weights := [1, 0, 1, 0] }

-- Period 9, original row 660, representative 6969.
def source24 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨93, by decide +kernel⟩

def target24 : Weights.Entry :=
  { word := [0, 4, 8, 4, 8, 12, 12], weights := [1, 0, 0, 1] }

-- Period 9, original row 687, representative 6964.
def source25 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨88, by decide +kernel⟩

def target25 : Weights.Entry :=
  { word := [0, 4, 8, 12, 8, 12, 10], weights := [1, 0, 1, 0] }

-- Period 9, original row 688, representative 6970.
def source26 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨94, by decide +kernel⟩

def target26 : Weights.Entry :=
  { word := [0, 4, 8, 12, 8, 12, 12], weights := [1, 0, 1, 0] }

-- Period 9, original row 713, representative 6957.
def source27 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨81, by decide +kernel⟩

def target27 : Weights.Entry :=
  { word := [0, 4, 10, 8, 8, 12, 10], weights := [0, 1, 1, 0] }

-- Period 9, original row 745, representative 6902.
def source28 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨27, by decide +kernel⟩

def target28 : Weights.Entry :=
  { word := [0, 6, 0, 12, 8, 12, 12], weights := [0, 1, 0, 1] }

-- Period 9, original row 776, representative 6881.
def source29 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨7, by decide +kernel⟩

def target29 : Weights.Entry :=
  { word := [0, 6, 8, 12, 8, 12, 10], weights := [0, 1, 1, 0] }

-- Period 9, original row 777, representative 6901.
def source30 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨26, by decide +kernel⟩

def target30 : Weights.Entry :=
  { word := [0, 6, 8, 12, 8, 12, 12], weights := [0, 1, 0, 1] }

-- Period 9, original row 800, representative 6973.
def source31 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨97, by decide +kernel⟩

def target31 : Weights.Entry :=
  { word := [0, 8, 0, 0, 1, 12, 12], weights := [0, 0, 1, 1] }

-- Period 9, original row 804, representative 6959.
def source32 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨83, by decide +kernel⟩

def target32 : Weights.Entry :=
  { word := [0, 8, 0, 0, 9, 12, 12], weights := [0, 0, 1, 1] }

-- Period 9, original row 812, representative 6973.
def source33 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨97, by decide +kernel⟩

def target33 : Weights.Entry :=
  { word := [0, 8, 0, 4, 0, 12, 12], weights := [0, 0, 1, 1] }

def points33 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 838, representative 6971.
def source34 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨95, by decide +kernel⟩

def target34 : Weights.Entry :=
  { word := [0, 8, 0, 4, 8, 12, 12], weights := [1, 0, 0, 1] }

-- Period 9, original row 860, representative 6974.
def source35 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨98, by decide +kernel⟩

def target35 : Weights.Entry :=
  { word := [0, 8, 0, 8, 1, 12, 12], weights := [0, 1, 1, 0] }

-- Period 9, original row 867, representative 6975.
def source36 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨99, by decide +kernel⟩

def target36 : Weights.Entry :=
  { word := [0, 8, 0, 8, 8, 12, 12], weights := [0, 1, 0, 1] }

-- Period 9, original row 871, representative 6960.
def source37 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨84, by decide +kernel⟩

def target37 : Weights.Entry :=
  { word := [0, 8, 0, 8, 9, 12, 12], weights := [0, 1, 1, 0] }

-- Period 9, original row 881, representative 6974.
def source38 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨98, by decide +kernel⟩

def target38 : Weights.Entry :=
  { word := [0, 8, 0, 12, 0, 12, 12], weights := [1, 0, 1, 0] }

def points38 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 890, representative 6972.
def source39 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨96, by decide +kernel⟩

def target39 : Weights.Entry :=
  { word := [0, 8, 0, 12, 8, 12, 12], weights := [1, 0, 1, 0] }

-- Period 9, original row 913, representative 6965.
def source40 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨89, by decide +kernel⟩

def target40 : Weights.Entry :=
  { word := [0, 8, 1, 4, 8, 12, 12], weights := [1, 0, 0, 1] }

-- Period 9, original row 936, representative 6968.
def source41 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨92, by decide +kernel⟩

def target41 : Weights.Entry :=
  { word := [0, 8, 1, 12, 8, 12, 12], weights := [1, 0, 1, 0] }

-- Period 9, original row 1007, representative 6952.
def source42 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨76, by decide +kernel⟩

def target42 : Weights.Entry :=
  { word := [0, 8, 4, 8, 4, 12, 12], weights := [0, 1, 0, 1] }

-- Period 9, original row 1011, representative 6950.
def source43 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨74, by decide +kernel⟩

def target43 : Weights.Entry :=
  { word := [0, 8, 4, 8, 12, 12, 12], weights := [0, 1, 0, 1] }

-- Period 9, original row 1058, representative 6954.
def source44 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨78, by decide +kernel⟩

def target44 : Weights.Entry :=
  { word := [0, 8, 8, 8, 4, 12, 12], weights := [0, 1, 0, 1] }

-- Period 9, original row 1063, representative 6953.
def source45 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨77, by decide +kernel⟩

def target45 : Weights.Entry :=
  { word := [0, 8, 8, 8, 12, 12, 12], weights := [0, 1, 0, 1] }

-- Period 9, original row 1121, representative 6951.
def source46 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨75, by decide +kernel⟩

def target46 : Weights.Entry :=
  { word := [0, 8, 12, 8, 4, 12, 12], weights := [0, 1, 0, 1] }

-- Period 9, original row 1125, representative 6949.
def source47 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨73, by decide +kernel⟩

def target47 : Weights.Entry :=
  { word := [0, 8, 12, 8, 12, 12, 12], weights := [0, 1, 0, 1] }

-- Period 9, original row 1193, representative 6911.
def source48 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨35, by decide +kernel⟩

def target48 : Weights.Entry :=
  { word := [0, 9, 0, 9, 4, 12, 12], weights := [1, 1, 1, 1] }

-- Period 9, original row 1197, representative 6907.
def source49 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨32, by decide +kernel⟩

def target49 : Weights.Entry :=
  { word := [0, 9, 0, 9, 12, 12, 12], weights := [1, 1, 1, 1] }

-- Period 9, original row 1304, representative 6910.
def source50 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨34, by decide +kernel⟩

def target50 : Weights.Entry :=
  { word := [0, 9, 8, 9, 4, 12, 12], weights := [1, 1, 1, 1] }

-- Period 9, original row 1308, representative 6906.
def source51 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨31, by decide +kernel⟩

def target51 : Weights.Entry :=
  { word := [0, 9, 8, 9, 12, 12, 12], weights := [1, 1, 1, 1] }

-- Period 9, original row 1358, representative 6904.
def source52 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨29, by decide +kernel⟩

def target52 : Weights.Entry :=
  { word := [0, 10, 0, 8, 8, 12, 12], weights := [0, 1, 0, 1] }

-- Period 9, original row 1373, representative 6903.
def source53 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨28, by decide +kernel⟩

def target53 : Weights.Entry :=
  { word := [0, 10, 0, 12, 8, 12, 12], weights := [0, 1, 0, 1] }

-- Period 9, original row 1408, representative 6893.
def source54 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨18, by decide +kernel⟩

def target54 : Weights.Entry :=
  { word := [0, 10, 2, 2, 8, 12, 12], weights := [0, 1, 0, 1] }

-- Period 9, original row 1435, representative 6876.
def source55 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨2, by decide +kernel⟩

def target55 : Weights.Entry :=
  { word := [0, 10, 2, 10, 8, 12, 10], weights := [0, 1, 1, 0] }

-- Period 9, original row 1436, representative 6896.
def source56 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨21, by decide +kernel⟩

def target56 : Weights.Entry :=
  { word := [0, 10, 2, 10, 8, 12, 12], weights := [0, 1, 0, 1] }

-- Period 9, original row 1482, representative 6874.
def source57 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨0, by decide +kernel⟩

def target57 : Weights.Entry :=
  { word := [0, 10, 10, 2, 8, 12, 10], weights := [0, 1, 0, 1] }

-- Period 9, original row 1483, representative 6894.
def source58 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨19, by decide +kernel⟩

def target58 : Weights.Entry :=
  { word := [0, 10, 10, 2, 8, 12, 12], weights := [0, 1, 0, 1] }

-- Period 9, original row 1503, representative 6875.
def source59 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨1, by decide +kernel⟩

def target59 : Weights.Entry :=
  { word := [0, 10, 10, 10, 8, 12, 10], weights := [0, 1, 1, 0] }

-- Period 9, original row 1504, representative 6895.
def source60 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨20, by decide +kernel⟩

def target60 : Weights.Entry :=
  { word := [0, 10, 10, 10, 8, 12, 12], weights := [0, 1, 0, 1] }

-- Period 9, original row 1526, representative 6965.
def source61 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨89, by decide +kernel⟩

def target61 : Weights.Entry :=
  { word := [0, 12, 0, 4, 8, 12, 12], weights := [1, 0, 0, 1] }

def points61 : List (ℕ × ℕ) := [(0, 0), (1, 2), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 1549, representative 6968.
def source62 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨92, by decide +kernel⟩

def target62 : Weights.Entry :=
  { word := [0, 12, 0, 12, 8, 12, 12], weights := [1, 0, 1, 0] }

def points62 : List (ℕ × ℕ) := [(0, 0), (1, 2), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 1592, representative 6956.
def source63 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨80, by decide +kernel⟩

def target63 : Weights.Entry :=
  { word := [0, 12, 2, 8, 8, 12, 10], weights := [0, 1, 1, 0] }

-- Period 9, original row 1658, representative 6961.
def source64 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨85, by decide +kernel⟩

def target64 : Weights.Entry :=
  { word := [0, 12, 8, 4, 8, 12, 10], weights := [1, 0, 1, 0] }

-- Period 9, original row 1659, representative 6966.
def source65 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨90, by decide +kernel⟩

def target65 : Weights.Entry :=
  { word := [0, 12, 8, 4, 8, 12, 12], weights := [1, 0, 0, 1] }

-- Period 9, original row 1686, representative 6962.
def source66 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨86, by decide +kernel⟩

def target66 : Weights.Entry :=
  { word := [0, 12, 8, 12, 8, 12, 10], weights := [1, 0, 1, 0] }

-- Period 9, original row 1687, representative 6967.
def source67 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨91, by decide +kernel⟩

def target67 : Weights.Entry :=
  { word := [0, 12, 8, 12, 8, 12, 12], weights := [1, 0, 1, 0] }

-- Period 9, original row 1712, representative 6955.
def source68 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨79, by decide +kernel⟩

def target68 : Weights.Entry :=
  { word := [0, 12, 10, 8, 8, 12, 10], weights := [0, 1, 1, 0] }

-- Period 9, original row 1882, representative 6958.
def source69 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨82, by decide +kernel⟩

def target69 : Weights.Entry :=
  { word := [1, 4, 2, 8, 8, 12, 10], weights := [0, 1, 1, 0] }

def points69 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 1943, representative 6963.
def source70 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨87, by decide +kernel⟩

def target70 : Weights.Entry :=
  { word := [1, 4, 8, 4, 8, 12, 10], weights := [1, 0, 1, 0] }

def points70 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 1944, representative 6969.
def source71 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨93, by decide +kernel⟩

def target71 : Weights.Entry :=
  { word := [1, 4, 8, 4, 8, 12, 12], weights := [1, 0, 0, 1] }

def points71 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 1971, representative 6964.
def source72 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨88, by decide +kernel⟩

def target72 : Weights.Entry :=
  { word := [1, 4, 8, 12, 8, 12, 10], weights := [1, 0, 1, 0] }

def points72 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 1972, representative 6970.
def source73 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨94, by decide +kernel⟩

def target73 : Weights.Entry :=
  { word := [1, 4, 8, 12, 8, 12, 12], weights := [1, 0, 1, 0] }

def points73 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 1997, representative 6957.
def source74 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨81, by decide +kernel⟩

def target74 : Weights.Entry :=
  { word := [1, 4, 10, 8, 8, 12, 10], weights := [0, 1, 1, 0] }

def points74 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 2043, representative 6965.
def source75 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨89, by decide +kernel⟩

def target75 : Weights.Entry :=
  { word := [1, 8, 1, 4, 8, 12, 12], weights := [1, 0, 0, 1] }

def points75 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 2066, representative 6968.
def source76 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨92, by decide +kernel⟩

def target76 : Weights.Entry :=
  { word := [1, 8, 1, 12, 8, 12, 12], weights := [1, 0, 1, 0] }

def points76 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 2241, representative 6956.
def source77 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨80, by decide +kernel⟩

def target77 : Weights.Entry :=
  { word := [1, 12, 2, 8, 8, 12, 10], weights := [0, 1, 1, 0] }

def points77 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 2302, representative 6961.
def source78 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨85, by decide +kernel⟩

def target78 : Weights.Entry :=
  { word := [1, 12, 8, 4, 8, 12, 10], weights := [1, 0, 1, 0] }

def points78 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 2303, representative 6966.
def source79 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨90, by decide +kernel⟩

def target79 : Weights.Entry :=
  { word := [1, 12, 8, 4, 8, 12, 12], weights := [1, 0, 0, 1] }

def points79 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 2330, representative 6962.
def source80 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨86, by decide +kernel⟩

def target80 : Weights.Entry :=
  { word := [1, 12, 8, 12, 8, 12, 10], weights := [1, 0, 1, 0] }

def points80 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 2331, representative 6967.
def source81 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨91, by decide +kernel⟩

def target81 : Weights.Entry :=
  { word := [1, 12, 8, 12, 8, 12, 12], weights := [1, 0, 1, 0] }

def points81 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 2356, representative 6955.
def source82 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨79, by decide +kernel⟩

def target82 : Weights.Entry :=
  { word := [1, 12, 10, 8, 8, 12, 10], weights := [0, 1, 1, 0] }

def points82 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 4108, representative 6942.
def source83 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨66, by decide +kernel⟩

def target83 : Weights.Entry :=
  { word := [8, 0, 0, 9, 4, 12, 12], weights := [1, 0, 1, 1] }

-- Period 9, original row 4112, representative 6938.
def source84 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨62, by decide +kernel⟩

def target84 : Weights.Entry :=
  { word := [8, 0, 0, 9, 12, 12, 12], weights := [1, 0, 1, 1] }

-- Period 9, original row 4122, representative 6934.
def source85 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨58, by decide +kernel⟩

def target85 : Weights.Entry :=
  { word := [8, 0, 0, 12, 0, 12, 12], weights := [1, 0, 1, 0] }

-- Period 9, original row 4144, representative 6922.
def source86 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨46, by decide +kernel⟩

def target86 : Weights.Entry :=
  { word := [8, 0, 1, 4, 8, 12, 12], weights := [1, 0, 0, 1] }

-- Period 9, original row 4180, representative 6929.
def source87 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨53, by decide +kernel⟩

def target87 : Weights.Entry :=
  { word := [8, 0, 1, 12, 8, 12, 12], weights := [1, 0, 1, 0] }

-- Period 9, original row 4302, representative 6948.
def source88 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨72, by decide +kernel⟩

def target88 : Weights.Entry :=
  { word := [8, 0, 4, 10, 0, 12, 10], weights := [1, 0, 1, 1] }

-- Period 9, original row 4303, representative 6948.
def source89 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨72, by decide +kernel⟩

def target89 : Weights.Entry :=
  { word := [8, 0, 4, 10, 0, 12, 12], weights := [1, 0, 1, 1] }

def points89 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 8), (8, 7)]

-- Period 9, original row 4311, representative 6946.
def source90 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨70, by decide +kernel⟩

def target90 : Weights.Entry :=
  { word := [8, 0, 4, 10, 8, 12, 12], weights := [1, 0, 1, 1] }

-- Period 9, original row 4367, representative 6941.
def source91 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨65, by decide +kernel⟩

def target91 : Weights.Entry :=
  { word := [8, 0, 8, 9, 4, 12, 12], weights := [1, 0, 1, 1] }

-- Period 9, original row 4371, representative 6937.
def source92 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨61, by decide +kernel⟩

def target92 : Weights.Entry :=
  { word := [8, 0, 8, 9, 12, 12, 12], weights := [1, 0, 1, 1] }

-- Period 9, original row 4478, representative 6947.
def source93 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨71, by decide +kernel⟩

def target93 : Weights.Entry :=
  { word := [8, 0, 12, 10, 0, 12, 10], weights := [1, 0, 1, 1] }

-- Period 9, original row 4479, representative 6947.
def source94 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨71, by decide +kernel⟩

def target94 : Weights.Entry :=
  { word := [8, 0, 12, 10, 0, 12, 12], weights := [1, 0, 1, 1] }

def points94 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 8), (8, 7)]

-- Period 9, original row 4487, representative 6945.
def source95 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨69, by decide +kernel⟩

def target95 : Weights.Entry :=
  { word := [8, 0, 12, 10, 8, 12, 12], weights := [1, 0, 1, 1] }

-- Period 9, original row 4721, representative 6892.
def source96 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨17, by decide +kernel⟩

def target96 : Weights.Entry :=
  { word := [8, 2, 0, 9, 8, 12, 12], weights := [0, 3, 1, 0] }

-- Period 9, original row 4742, representative 6891.
def source97 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨16, by decide +kernel⟩

def target97 : Weights.Entry :=
  { word := [8, 2, 0, 10, 8, 12, 12], weights := [0, 3, 0, 1] }

-- Period 9, original row 4846, representative 6885.
def source98 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨11, by decide +kernel⟩

def target98 : Weights.Entry :=
  { word := [8, 2, 2, 10, 8, 12, 12], weights := [1, 1, 1, 1] }

-- Period 9, original row 4916, representative 6890.
def source99 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨15, by decide +kernel⟩

def target99 : Weights.Entry :=
  { word := [8, 2, 8, 10, 8, 12, 12], weights := [0, 3, 0, 1] }

-- Period 9, original row 5001, representative 6884.
def source100 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨10, by decide +kernel⟩

def target100 : Weights.Entry :=
  { word := [8, 2, 10, 10, 8, 12, 12], weights := [1, 1, 1, 1] }

-- Period 9, original row 5023, representative 6922.
def source101 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨46, by decide +kernel⟩

def target101 : Weights.Entry :=
  { word := [8, 4, 0, 4, 8, 12, 12], weights := [1, 0, 0, 1] }

def points101 : List (ℕ × ℕ) := [(0, 0), (1, 2), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 5059, representative 6929.
def source102 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨53, by decide +kernel⟩

def target102 : Weights.Entry :=
  { word := [8, 4, 0, 12, 8, 12, 12], weights := [1, 0, 1, 0] }

def points102 : List (ℕ × ℕ) := [(0, 0), (1, 2), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 5181, representative 6920.
def source103 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨44, by decide +kernel⟩

def target103 : Weights.Entry :=
  { word := [8, 4, 8, 4, 8, 12, 10], weights := [1, 0, 1, 0] }

-- Period 9, original row 5182, representative 6927.
def source104 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨51, by decide +kernel⟩

def target104 : Weights.Entry :=
  { word := [8, 4, 8, 4, 8, 12, 12], weights := [1, 0, 0, 1] }

-- Period 9, original row 5223, representative 6921.
def source105 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨45, by decide +kernel⟩

def target105 : Weights.Entry :=
  { word := [8, 4, 8, 12, 8, 12, 10], weights := [1, 0, 1, 0] }

-- Period 9, original row 5224, representative 6928.
def source106 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨52, by decide +kernel⟩

def target106 : Weights.Entry :=
  { word := [8, 4, 8, 12, 8, 12, 12], weights := [1, 0, 1, 0] }

-- Period 9, original row 5311, representative 6886.
def source107 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨12, by decide +kernel⟩

def target107 : Weights.Entry :=
  { word := [8, 6, 8, 12, 8, 12, 12], weights := [1, 1, 1, 1] }

-- Period 9, original row 5340, representative 6932.
def source108 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨56, by decide +kernel⟩

def target108 : Weights.Entry :=
  { word := [8, 8, 0, 4, 0, 12, 12], weights := [1, 0, 1, 2] }

-- Period 9, original row 5366, representative 6930.
def source109 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨54, by decide +kernel⟩

def target109 : Weights.Entry :=
  { word := [8, 8, 0, 4, 8, 12, 12], weights := [1, 0, 0, 1] }

-- Period 9, original row 5388, representative 6940.
def source110 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨64, by decide +kernel⟩

def target110 : Weights.Entry :=
  { word := [8, 8, 0, 9, 4, 12, 12], weights := [1, 1, 1, 1] }

-- Period 9, original row 5392, representative 6936.
def source111 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨60, by decide +kernel⟩

def target111 : Weights.Entry :=
  { word := [8, 8, 0, 9, 12, 12, 12], weights := [1, 1, 1, 1] }

-- Period 9, original row 5404, representative 6933.
def source112 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨57, by decide +kernel⟩

def target112 : Weights.Entry :=
  { word := [8, 8, 0, 12, 0, 12, 12], weights := [1, 0, 1, 0] }

-- Period 9, original row 5429, representative 6931.
def source113 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨55, by decide +kernel⟩

def target113 : Weights.Entry :=
  { word := [8, 8, 0, 12, 8, 12, 12], weights := [1, 0, 1, 0] }

-- Period 9, original row 5465, representative 6923.
def source114 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨47, by decide +kernel⟩

def target114 : Weights.Entry :=
  { word := [8, 8, 1, 4, 8, 12, 12], weights := [1, 0, 0, 1] }

-- Period 9, original row 5501, representative 6926.
def source115 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨50, by decide +kernel⟩

def target115 : Weights.Entry :=
  { word := [8, 8, 1, 12, 8, 12, 12], weights := [1, 0, 1, 0] }

-- Period 9, original row 5634, representative 6944.
def source116 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨68, by decide +kernel⟩

def target116 : Weights.Entry :=
  { word := [8, 8, 4, 10, 8, 12, 12], weights := [1, 1, 1, 1] }

-- Period 9, original row 5716, representative 6939.
def source117 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨63, by decide +kernel⟩

def target117 : Weights.Entry :=
  { word := [8, 8, 8, 9, 4, 12, 12], weights := [1, 1, 1, 1] }

-- Period 9, original row 5720, representative 6935.
def source118 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨59, by decide +kernel⟩

def target118 : Weights.Entry :=
  { word := [8, 8, 8, 9, 12, 12, 12], weights := [1, 1, 1, 1] }

-- Period 9, original row 5841, representative 6943.
def source119 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨67, by decide +kernel⟩

def target119 : Weights.Entry :=
  { word := [8, 8, 12, 10, 8, 12, 12], weights := [1, 1, 1, 1] }

-- Period 9, original row 6115, representative 6889.
def source120 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨14, by decide +kernel⟩

def target120 : Weights.Entry :=
  { word := [8, 10, 0, 9, 8, 12, 12], weights := [0, 3, 1, 0] }

-- Period 9, original row 6136, representative 6888.
def source121 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨13, by decide +kernel⟩

def target121 : Weights.Entry :=
  { word := [8, 10, 0, 10, 8, 12, 12], weights := [0, 3, 0, 1] }

-- Period 9, original row 6209, representative 6883.
def source122 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨9, by decide +kernel⟩

def target122 : Weights.Entry :=
  { word := [8, 10, 2, 10, 8, 12, 12], weights := [1, 1, 1, 1] }

-- Period 9, original row 6331, representative 6882.
def source123 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨8, by decide +kernel⟩

def target123 : Weights.Entry :=
  { word := [8, 10, 10, 10, 8, 12, 12], weights := [1, 1, 1, 1] }

-- Period 9, original row 6353, representative 6923.
def source124 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨47, by decide +kernel⟩

def target124 : Weights.Entry :=
  { word := [8, 12, 0, 4, 8, 12, 12], weights := [1, 0, 0, 1] }

def points124 : List (ℕ × ℕ) := [(0, 0), (1, 2), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 6389, representative 6926.
def source125 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨50, by decide +kernel⟩

def target125 : Weights.Entry :=
  { word := [8, 12, 0, 12, 8, 12, 12], weights := [1, 0, 1, 0] }

def points125 : List (ℕ × ℕ) := [(0, 0), (1, 2), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 6511, representative 6918.
def source126 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨42, by decide +kernel⟩

def target126 : Weights.Entry :=
  { word := [8, 12, 8, 4, 8, 12, 10], weights := [1, 0, 1, 0] }

-- Period 9, original row 6512, representative 6924.
def source127 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨48, by decide +kernel⟩

def target127 : Weights.Entry :=
  { word := [8, 12, 8, 4, 8, 12, 12], weights := [1, 0, 0, 1] }

def period9Entries : List Weights.Entry := [target0, target1, target2, target3, target4, target5, target6, target7, target8, target9, target10, target11, target12, target13, target14, target15, target16, target17, target18, target19, target20, target21, target22, target23, target24, target25, target26, target27, target28, target29, target30, target31, target32, target33, target34, target35, target36, target37, target38, target39, target40, target41, target42, target43, target44, target45, target46, target47, target48, target49, target50, target51, target52, target53, target54, target55, target56, target57, target58, target59, target60, target61, target62, target63, target64, target65, target66, target67, target68, target69, target70, target71, target72, target73, target74, target75, target76, target77, target78, target79, target80, target81, target82, target83, target84, target85, target86, target87, target88, target89, target90, target91, target92, target93, target94, target95, target96, target97, target98, target99, target100, target101, target102, target103, target104, target105, target106, target107, target108, target109, target110, target111, target112, target113, target114, target115, target116, target117, target118, target119, target120, target121, target122, target123, target124, target125, target126, target127]

def period9Chunk : RowCoverage.Chunk where
  rows := [⟨129, target0⟩, ⟨133, target1⟩, ⟨189, target2⟩, ⟨190, target3⟩, ⟨198, target4⟩, ⟨220, target5⟩, ⟨282, target6⟩, ⟨283, target7⟩, ⟨291, target8⟩, ⟨309, target9⟩, ⟨364, target10⟩, ⟨365, target11⟩, ⟨381, target12⟩, ⟨382, target13⟩, ⟨409, target14⟩, ⟨410, target15⟩, ⟨462, target16⟩, ⟨463, target17⟩, ⟨483, target18⟩, ⟨484, target19⟩, ⟨504, target20⟩, ⟨505, target21⟩, ⟨593, target22⟩, ⟨659, target23⟩, ⟨660, target24⟩, ⟨687, target25⟩, ⟨688, target26⟩, ⟨713, target27⟩, ⟨745, target28⟩, ⟨776, target29⟩, ⟨777, target30⟩, ⟨800, target31⟩, ⟨804, target32⟩, ⟨812, target33⟩, ⟨838, target34⟩, ⟨860, target35⟩, ⟨867, target36⟩, ⟨871, target37⟩, ⟨881, target38⟩, ⟨890, target39⟩, ⟨913, target40⟩, ⟨936, target41⟩, ⟨1007, target42⟩, ⟨1011, target43⟩, ⟨1058, target44⟩, ⟨1063, target45⟩, ⟨1121, target46⟩, ⟨1125, target47⟩, ⟨1193, target48⟩, ⟨1197, target49⟩, ⟨1304, target50⟩, ⟨1308, target51⟩, ⟨1358, target52⟩, ⟨1373, target53⟩, ⟨1408, target54⟩, ⟨1435, target55⟩, ⟨1436, target56⟩, ⟨1482, target57⟩, ⟨1483, target58⟩, ⟨1503, target59⟩, ⟨1504, target60⟩, ⟨1526, target61⟩, ⟨1549, target62⟩, ⟨1592, target63⟩, ⟨1658, target64⟩, ⟨1659, target65⟩, ⟨1686, target66⟩, ⟨1687, target67⟩, ⟨1712, target68⟩, ⟨1882, target69⟩, ⟨1943, target70⟩, ⟨1944, target71⟩, ⟨1971, target72⟩, ⟨1972, target73⟩, ⟨1997, target74⟩, ⟨2043, target75⟩, ⟨2066, target76⟩, ⟨2241, target77⟩, ⟨2302, target78⟩, ⟨2303, target79⟩, ⟨2330, target80⟩, ⟨2331, target81⟩, ⟨2356, target82⟩, ⟨4108, target83⟩, ⟨4112, target84⟩, ⟨4122, target85⟩, ⟨4144, target86⟩, ⟨4180, target87⟩, ⟨4302, target88⟩, ⟨4303, target89⟩, ⟨4311, target90⟩, ⟨4367, target91⟩, ⟨4371, target92⟩, ⟨4478, target93⟩, ⟨4479, target94⟩, ⟨4487, target95⟩, ⟨4721, target96⟩, ⟨4742, target97⟩, ⟨4846, target98⟩, ⟨4916, target99⟩, ⟨5001, target100⟩, ⟨5023, target101⟩, ⟨5059, target102⟩, ⟨5181, target103⟩, ⟨5182, target104⟩, ⟨5223, target105⟩, ⟨5224, target106⟩, ⟨5311, target107⟩, ⟨5340, target108⟩, ⟨5366, target109⟩, ⟨5388, target110⟩, ⟨5392, target111⟩, ⟨5404, target112⟩, ⟨5429, target113⟩, ⟨5465, target114⟩, ⟨5501, target115⟩, ⟨5634, target116⟩, ⟨5716, target117⟩, ⟨5720, target118⟩, ⟨5841, target119⟩, ⟨6115, target120⟩, ⟨6136, target121⟩, ⟨6209, target122⟩, ⟨6331, target123⟩, ⟨6353, target124⟩, ⟨6389, target125⟩, ⟨6511, target126⟩, ⟨6512, target127⟩]
  indexMask := 30438484312730384838467448011727943295058528225551009075506574646439318946808387718143291018972026096509027884796494446633710595911170003654432665109580329956423784946236043390775540541176949026383841483715946119570203912348544973921755977194637523160614034998929411595507010327499681279367119923348130869761295514182684690021985019607661801434039595301633665352313514391106891922754310971682559280351918981927291597437095026935217669415241753664289932792197068338772820218596196292508876974733869357524969863532810528445423171750820238382915239239944915681938125446381657676315401916423781707034164236756147497187732988800502036328273007069339657098604283849189193715515318801243415120384310638765904064623923519569822480788379184260759591830023630609808087291582945427811274752543636513554012507712141662831584921784631695066298192128808259318698662984881888782257194304555379794451229786907530451576410141691330185696555722587237429123592188028287654073487366197112059415241280732349513873920888419533964541315702741968035036958533842795454425383733745319084098788653324563517533031167854012139844575059265988271256428743672641429558780943497644596502809487106885654724937848367966942989000611585843519149490984255744857439858469670469291437119926113164815875136893410930128367040095533931518803654594833164067097089307527800709497629097989521645383955612596583937172634660112783813216758610650418259207411564254621847394557849920007594512868337096408623046463708515980085154704652850597081441807814912941102665073704319589783946380445781236194313328123883036843580569670560250288312117924067770283007419207156098506690583114899486664083872716991615086518770484541819638759622995153633085630422843162733596714126581168149480261049263450612241509981159082692941777877666531631217012406766714082057061232550204048713531938448397469872916707875203283337883201236978867169836060892660432908152793270449474285888085366757788598732232086888865091177968669468655616
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

end FranklSmallCyclic.TransportBatches.G054.B000.Data
