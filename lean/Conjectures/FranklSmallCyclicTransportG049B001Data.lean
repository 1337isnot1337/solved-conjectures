module

public import Conjectures.FranklSmallCyclicRowCoverage
public import Conjectures.FranklSmallCyclicCanonicalWords
public import Conjectures.FranklSmallCyclicOrbit8Block023Data

/-! 128 literal targets sharing one source proof block.
Original words and row indices are retained; weights may be transported.
-/
@[expose] public section

namespace FranklSmallCyclic.TransportBatches.G049.B001.Data

-- Period 8, original row 1074, representative 6327.
def source0 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B023.Data.entryAt ⟨65, by decide +kernel⟩

def target0 : Weights.Entry :=
  { word := [0, 8, 9, 4, 12, 12, 0], weights := [0, 0, 1, 0] }

-- Period 8, original row 1081, representative 6332.
def source1 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B023.Data.entryAt ⟨70, by decide +kernel⟩

def target1 : Weights.Entry :=
  { word := [0, 8, 10, 2, 2, 8, 1], weights := [0, 1, 0, 0] }

-- Period 8, original row 1082, representative 6378.
def source2 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B023.Data.entryAt ⟨116, by decide +kernel⟩

def target2 : Weights.Entry :=
  { word := [0, 8, 10, 2, 2, 8, 2], weights := [0, 1, 0, 0] }

-- Period 8, original row 1089, representative 6324.
def source3 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B023.Data.entryAt ⟨62, by decide +kernel⟩

def target3 : Weights.Entry :=
  { word := [0, 8, 10, 2, 10, 8, 1], weights := [0, 1, 0, 0] }

-- Period 8, original row 1090, representative 6362.
def source4 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B023.Data.entryAt ⟨100, by decide +kernel⟩

def target4 : Weights.Entry :=
  { word := [0, 8, 10, 2, 10, 8, 2], weights := [0, 1, 0, 0] }

-- Period 8, original row 1096, representative 6333.
def source5 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B023.Data.entryAt ⟨71, by decide +kernel⟩

def target5 : Weights.Entry :=
  { word := [0, 8, 10, 10, 2, 8, 1], weights := [0, 1, 0, 0] }

-- Period 8, original row 1097, representative 6379.
def source6 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B023.Data.entryAt ⟨117, by decide +kernel⟩

def target6 : Weights.Entry :=
  { word := [0, 8, 10, 10, 2, 8, 2], weights := [0, 1, 0, 0] }

-- Period 8, original row 1103, representative 6325.
def source7 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B023.Data.entryAt ⟨63, by decide +kernel⟩

def target7 : Weights.Entry :=
  { word := [0, 8, 10, 10, 10, 8, 1], weights := [0, 1, 0, 0] }

-- Period 8, original row 1104, representative 6363.
def source8 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B023.Data.entryAt ⟨101, by decide +kernel⟩

def target8 : Weights.Entry :=
  { word := [0, 8, 10, 10, 10, 8, 2], weights := [0, 1, 0, 0] }

-- Period 8, original row 1126, representative 6353.
def source9 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B023.Data.entryAt ⟨91, by decide +kernel⟩

def target9 : Weights.Entry :=
  { word := [0, 9, 0, 1, 4, 2, 0], weights := [1, 0, 1, 0] }

def points9 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 1130, representative 6354.
def source10 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B023.Data.entryAt ⟨92, by decide +kernel⟩

def target10 : Weights.Entry :=
  { word := [0, 9, 0, 1, 4, 10, 0], weights := [1, 1, 0, 0] }

-- Period 8, original row 1132, representative 6356.
def source11 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B023.Data.entryAt ⟨94, by decide +kernel⟩

def target11 : Weights.Entry :=
  { word := [0, 9, 0, 1, 12, 2, 0], weights := [1, 0, 1, 0] }

def points11 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 1136, representative 6355.
def source12 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B023.Data.entryAt ⟨93, by decide +kernel⟩

def target12 : Weights.Entry :=
  { word := [0, 9, 0, 1, 12, 10, 0], weights := [1, 1, 0, 0] }

-- Period 8, original row 1138, representative 6353.
def source13 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B023.Data.entryAt ⟨91, by decide +kernel⟩

def target13 : Weights.Entry :=
  { word := [0, 9, 0, 2, 2, 2, 0], weights := [1, 0, 0, 1] }

def points13 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 5), (4, 6), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 1140, representative 6354.
def source14 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B023.Data.entryAt ⟨92, by decide +kernel⟩

def target14 : Weights.Entry :=
  { word := [0, 9, 0, 2, 2, 10, 0], weights := [1, 1, 0, 0] }

def points14 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 6), (6, 5), (7, 7)]

-- Period 8, original row 1142, representative 6356.
def source15 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B023.Data.entryAt ⟨94, by decide +kernel⟩

def target15 : Weights.Entry :=
  { word := [0, 9, 0, 2, 10, 2, 0], weights := [1, 0, 0, 1] }

def points15 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 5), (4, 6), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 1144, representative 6355.
def source16 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B023.Data.entryAt ⟨93, by decide +kernel⟩

def target16 : Weights.Entry :=
  { word := [0, 9, 0, 2, 10, 10, 0], weights := [1, 1, 0, 0] }

def points16 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 6), (6, 5), (7, 7)]

-- Period 8, original row 1166, representative 6347.
def source17 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B023.Data.entryAt ⟨85, by decide +kernel⟩

def target17 : Weights.Entry :=
  { word := [0, 9, 0, 4, 6, 8, 0], weights := [1, 0, 1, 0] }

def points17 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 5), (4, 6), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 1225, representative 6348.
def source18 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B023.Data.entryAt ⟨86, by decide +kernel⟩

def target18 : Weights.Entry :=
  { word := [0, 9, 0, 12, 6, 8, 0], weights := [1, 0, 1, 0] }

def points18 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 5), (4, 6), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 1251, representative 6331.
def source19 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B023.Data.entryAt ⟨69, by decide +kernel⟩

def target19 : Weights.Entry :=
  { word := [0, 9, 4, 4, 4, 8, 0], weights := [0, 0, 1, 0] }

def points19 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 1255, representative 6332.
def source20 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B023.Data.entryAt ⟨70, by decide +kernel⟩

def target20 : Weights.Entry :=
  { word := [0, 9, 4, 4, 12, 8, 0], weights := [0, 0, 1, 0] }

def points20 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 1258, representative 6334.
def source21 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B023.Data.entryAt ⟨72, by decide +kernel⟩

def target21 : Weights.Entry :=
  { word := [0, 9, 4, 12, 4, 8, 0], weights := [0, 0, 1, 0] }

def points21 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 1261, representative 6333.
def source22 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B023.Data.entryAt ⟨71, by decide +kernel⟩

def target22 : Weights.Entry :=
  { word := [0, 9, 4, 12, 12, 8, 0], weights := [0, 0, 1, 0] }

def points22 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 1263, representative 6349.
def source23 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B023.Data.entryAt ⟨87, by decide +kernel⟩

def target23 : Weights.Entry :=
  { word := [0, 9, 8, 1, 4, 2, 0], weights := [1, 0, 1, 0] }

def points23 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 1267, representative 6350.
def source24 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B023.Data.entryAt ⟨88, by decide +kernel⟩

def target24 : Weights.Entry :=
  { word := [0, 9, 8, 1, 4, 10, 0], weights := [1, 1, 0, 0] }

-- Period 8, original row 1269, representative 6352.
def source25 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B023.Data.entryAt ⟨90, by decide +kernel⟩

def target25 : Weights.Entry :=
  { word := [0, 9, 8, 1, 12, 2, 0], weights := [1, 0, 1, 0] }

def points25 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 1273, representative 6351.
def source26 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B023.Data.entryAt ⟨89, by decide +kernel⟩

def target26 : Weights.Entry :=
  { word := [0, 9, 8, 1, 12, 10, 0], weights := [1, 1, 0, 0] }

-- Period 8, original row 1275, representative 6343.
def source27 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B023.Data.entryAt ⟨81, by decide +kernel⟩

def target27 : Weights.Entry :=
  { word := [0, 9, 8, 2, 2, 2, 0], weights := [0, 1, 0, 1] }

def points27 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 1277, representative 6344.
def source28 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B023.Data.entryAt ⟨82, by decide +kernel⟩

def target28 : Weights.Entry :=
  { word := [0, 9, 8, 2, 2, 10, 0], weights := [1, 1, 0, 0] }

-- Period 8, original row 1279, representative 6346.
def source29 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B023.Data.entryAt ⟨84, by decide +kernel⟩

def target29 : Weights.Entry :=
  { word := [0, 9, 8, 2, 10, 2, 0], weights := [0, 1, 0, 1] }

def points29 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 1281, representative 6345.
def source30 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B023.Data.entryAt ⟨83, by decide +kernel⟩

def target30 : Weights.Entry :=
  { word := [0, 9, 8, 2, 10, 10, 0], weights := [1, 1, 0, 0] }

-- Period 8, original row 1289, representative 6341.
def source31 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B023.Data.entryAt ⟨79, by decide +kernel⟩

def target31 : Weights.Entry :=
  { word := [0, 9, 8, 4, 6, 8, 0], weights := [0, 0, 1, 0] }

def points31 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 1296, representative 6340.
def source32 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B023.Data.entryAt ⟨78, by decide +kernel⟩

def target32 : Weights.Entry :=
  { word := [0, 9, 8, 8, 6, 2, 0], weights := [0, 1, 1, 0] }

def points32 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 1298, representative 6339.
def source33 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B023.Data.entryAt ⟨77, by decide +kernel⟩

def target33 : Weights.Entry :=
  { word := [0, 9, 8, 8, 6, 10, 0], weights := [0, 1, 1, 0] }

-- Period 8, original row 1318, representative 6342.
def source34 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B023.Data.entryAt ⟨80, by decide +kernel⟩

def target34 : Weights.Entry :=
  { word := [0, 9, 8, 12, 6, 8, 0], weights := [0, 0, 1, 0] }

def points34 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 1326, representative 6323.
def source35 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B023.Data.entryAt ⟨61, by decide +kernel⟩

def target35 : Weights.Entry :=
  { word := [0, 9, 12, 4, 4, 8, 0], weights := [0, 0, 1, 0] }

def points35 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 1330, representative 6324.
def source36 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B023.Data.entryAt ⟨62, by decide +kernel⟩

def target36 : Weights.Entry :=
  { word := [0, 9, 12, 4, 12, 8, 0], weights := [0, 0, 1, 0] }

def points36 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 1333, representative 6326.
def source37 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B023.Data.entryAt ⟨64, by decide +kernel⟩

def target37 : Weights.Entry :=
  { word := [0, 9, 12, 12, 4, 8, 0], weights := [0, 0, 1, 0] }

def points37 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 1336, representative 6325.
def source38 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B023.Data.entryAt ⟨63, by decide +kernel⟩

def target38 : Weights.Entry :=
  { word := [0, 9, 12, 12, 12, 8, 0], weights := [0, 0, 1, 0] }

def points38 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 1384, representative 6337.
def source39 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B023.Data.entryAt ⟨75, by decide +kernel⟩

def target39 : Weights.Entry :=
  { word := [0, 10, 2, 2, 8, 2, 0], weights := [0, 1, 0, 1] }

def points39 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 1391, representative 6338.
def source40 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B023.Data.entryAt ⟨76, by decide +kernel⟩

def target40 : Weights.Entry :=
  { word := [0, 10, 2, 2, 8, 8, 0], weights := [0, 1, 0, 1] }

def points40 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 1399, representative 6335.
def source41 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B023.Data.entryAt ⟨73, by decide +kernel⟩

def target41 : Weights.Entry :=
  { word := [0, 10, 2, 2, 8, 9, 0], weights := [0, 1, 0, 1] }

def points41 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 1401, representative 6336.
def source42 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B023.Data.entryAt ⟨74, by decide +kernel⟩

def target42 : Weights.Entry :=
  { word := [0, 10, 2, 2, 8, 10, 0], weights := [1, 1, 0, 0] }

-- Period 8, original row 1459, representative 6329.
def source43 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B023.Data.entryAt ⟨67, by decide +kernel⟩

def target43 : Weights.Entry :=
  { word := [0, 10, 10, 2, 8, 2, 0], weights := [0, 1, 0, 1] }

def points43 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 1466, representative 6330.
def source44 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B023.Data.entryAt ⟨68, by decide +kernel⟩

def target44 : Weights.Entry :=
  { word := [0, 10, 10, 2, 8, 8, 0], weights := [0, 1, 0, 0] }

def points44 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 1474, representative 6327.
def source45 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B023.Data.entryAt ⟨65, by decide +kernel⟩

def target45 : Weights.Entry :=
  { word := [0, 10, 10, 2, 8, 9, 0], weights := [0, 1, 0, 0] }

def points45 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 1476, representative 6328.
def source46 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B023.Data.entryAt ⟨66, by decide +kernel⟩

def target46 : Weights.Entry :=
  { word := [0, 10, 10, 2, 8, 10, 0], weights := [1, 1, 0, 0] }

-- Period 8, original row 1512, representative 6383.
def source47 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B023.Data.entryAt ⟨121, by decide +kernel⟩

def target47 : Weights.Entry :=
  { word := [0, 12, 0, 4, 2, 8, 2], weights := [0, 0, 1, 0] }

-- Period 8, original row 1534, representative 6367.
def source48 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B023.Data.entryAt ⟨105, by decide +kernel⟩

def target48 : Weights.Entry :=
  { word := [0, 12, 0, 4, 10, 8, 2], weights := [0, 0, 1, 0] }

-- Period 8, original row 1558, representative 6354.
def source49 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B023.Data.entryAt ⟨92, by decide +kernel⟩

def target49 : Weights.Entry :=
  { word := [0, 12, 2, 0, 1, 8, 1], weights := [0, 0, 1, 1] }

def points49 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 1572, representative 6350.
def source50 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B023.Data.entryAt ⟨88, by decide +kernel⟩

def target50 : Weights.Entry :=
  { word := [0, 12, 2, 0, 9, 8, 1], weights := [0, 0, 1, 1] }

def points50 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 1584, representative 6374.
def source51 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B023.Data.entryAt ⟨112, by decide +kernel⟩

def target51 : Weights.Entry :=
  { word := [0, 12, 2, 8, 2, 8, 2], weights := [0, 1, 1, 0] }

-- Period 8, original row 1598, representative 6358.
def source52 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B023.Data.entryAt ⟨96, by decide +kernel⟩

def target52 : Weights.Entry :=
  { word := [0, 12, 2, 8, 10, 8, 2], weights := [0, 1, 1, 0] }

-- Period 8, original row 1608, representative 6354.
def source53 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B023.Data.entryAt ⟨92, by decide +kernel⟩

def target53 : Weights.Entry :=
  { word := [0, 12, 4, 4, 0, 8, 1], weights := [0, 0, 1, 1] }

def points53 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 3), (6, 4), (7, 2)]

-- Period 8, original row 1622, representative 6344.
def source54 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B023.Data.entryAt ⟨82, by decide +kernel⟩

def target54 : Weights.Entry :=
  { word := [0, 12, 4, 4, 8, 8, 1], weights := [0, 0, 1, 1] }

def points54 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 1629, representative 6339.
def source55 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B023.Data.entryAt ⟨77, by decide +kernel⟩

def target55 : Weights.Entry :=
  { word := [0, 12, 6, 8, 8, 8, 1], weights := [0, 1, 1, 0] }

def points55 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 1641, representative 6384.
def source56 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B023.Data.entryAt ⟨122, by decide +kernel⟩

def target56 : Weights.Entry :=
  { word := [0, 12, 8, 4, 2, 8, 2], weights := [0, 0, 1, 0] }

-- Period 8, original row 1648, representative 6336.
def source57 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B023.Data.entryAt ⟨74, by decide +kernel⟩

def target57 : Weights.Entry :=
  { word := [0, 12, 8, 4, 4, 12, 0], weights := [0, 0, 1, 1] }

def points57 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 1667, representative 6368.
def source58 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B023.Data.entryAt ⟨106, by decide +kernel⟩

def target58 : Weights.Entry :=
  { word := [0, 12, 8, 4, 10, 8, 2], weights := [0, 0, 1, 0] }

-- Period 8, original row 1674, representative 6328.
def source59 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B023.Data.entryAt ⟨66, by decide +kernel⟩

def target59 : Weights.Entry :=
  { word := [0, 12, 8, 4, 12, 12, 0], weights := [0, 0, 1, 1] }

def points59 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 1690, representative 6355.
def source60 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B023.Data.entryAt ⟨93, by decide +kernel⟩

def target60 : Weights.Entry :=
  { word := [0, 12, 10, 0, 1, 8, 1], weights := [0, 0, 1, 1] }

def points60 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 1697, representative 6351.
def source61 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B023.Data.entryAt ⟨89, by decide +kernel⟩

def target61 : Weights.Entry :=
  { word := [0, 12, 10, 0, 9, 8, 1], weights := [0, 0, 1, 1] }

def points61 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 1704, representative 6373.
def source62 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B023.Data.entryAt ⟨111, by decide +kernel⟩

def target62 : Weights.Entry :=
  { word := [0, 12, 10, 8, 2, 8, 2], weights := [0, 1, 1, 0] }

-- Period 8, original row 1713, representative 6357.
def source63 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B023.Data.entryAt ⟨95, by decide +kernel⟩

def target63 : Weights.Entry :=
  { word := [0, 12, 10, 8, 10, 8, 2], weights := [0, 1, 1, 0] }

-- Period 8, original row 1716, representative 6355.
def source64 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B023.Data.entryAt ⟨93, by decide +kernel⟩

def target64 : Weights.Entry :=
  { word := [0, 12, 12, 4, 0, 8, 1], weights := [0, 0, 1, 1] }

def points64 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 3), (6, 4), (7, 2)]

-- Period 8, original row 1730, representative 6345.
def source65 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B023.Data.entryAt ⟨83, by decide +kernel⟩

def target65 : Weights.Entry :=
  { word := [0, 12, 12, 4, 8, 8, 1], weights := [0, 0, 1, 1] }

def points65 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 1744, representative 6386.
def source66 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B023.Data.entryAt ⟨124, by decide +kernel⟩

def target66 : Weights.Entry :=
  { word := [1, 0, 1, 4, 2, 8, 2], weights := [0, 0, 1, 0] }

def points66 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 8, original row 1766, representative 6370.
def source67 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B023.Data.entryAt ⟨108, by decide +kernel⟩

def target67 : Weights.Entry :=
  { word := [1, 0, 1, 4, 10, 8, 2], weights := [0, 0, 1, 0] }

def points67 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 8, original row 1792, representative 6381.
def source68 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B023.Data.entryAt ⟨119, by decide +kernel⟩

def target68 : Weights.Entry :=
  { word := [1, 0, 2, 2, 2, 8, 2], weights := [0, 1, 0, 0] }

def points68 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 8, original row 1807, representative 6365.
def source69 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B023.Data.entryAt ⟨103, by decide +kernel⟩

def target69 : Weights.Entry :=
  { word := [1, 0, 2, 2, 10, 8, 2], weights := [0, 1, 0, 0] }

def points69 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 8, original row 1827, representative 6382.
def source70 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B023.Data.entryAt ⟨120, by decide +kernel⟩

def target70 : Weights.Entry :=
  { word := [1, 0, 10, 2, 2, 8, 2], weights := [0, 1, 0, 0] }

def points70 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 8, original row 1835, representative 6366.
def source71 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B023.Data.entryAt ⟨104, by decide +kernel⟩

def target71 : Weights.Entry :=
  { word := [1, 0, 10, 2, 10, 8, 2], weights := [0, 1, 0, 0] }

def points71 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 8, original row 1848, representative 6353.
def source72 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B023.Data.entryAt ⟨91, by decide +kernel⟩

def target72 : Weights.Entry :=
  { word := [1, 4, 2, 0, 1, 8, 1], weights := [0, 1, 0, 1] }

def points72 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 8, original row 1862, representative 6349.
def source73 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B023.Data.entryAt ⟨87, by decide +kernel⟩

def target73 : Weights.Entry :=
  { word := [1, 4, 2, 0, 9, 8, 1], weights := [0, 1, 0, 1] }

def points73 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 8, original row 1874, representative 6376.
def source74 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B023.Data.entryAt ⟨114, by decide +kernel⟩

def target74 : Weights.Entry :=
  { word := [1, 4, 2, 8, 2, 8, 2], weights := [0, 1, 1, 0] }

def points74 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 8, original row 1888, representative 6360.
def source75 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B023.Data.entryAt ⟨98, by decide +kernel⟩

def target75 : Weights.Entry :=
  { word := [1, 4, 2, 8, 10, 8, 2], weights := [0, 1, 1, 0] }

def points75 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 8, original row 1898, representative 6353.
def source76 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B023.Data.entryAt ⟨91, by decide +kernel⟩

def target76 : Weights.Entry :=
  { word := [1, 4, 4, 4, 0, 8, 1], weights := [1, 0, 0, 1] }

def points76 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6), (7, 7)]

-- Period 8, original row 1912, representative 6343.
def source77 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B023.Data.entryAt ⟨81, by decide +kernel⟩

def target77 : Weights.Entry :=
  { word := [1, 4, 4, 4, 8, 8, 1], weights := [1, 0, 1, 0] }

def points77 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 8, original row 1926, representative 6385.
def source78 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B023.Data.entryAt ⟨123, by decide +kernel⟩

def target78 : Weights.Entry :=
  { word := [1, 4, 8, 4, 2, 8, 2], weights := [0, 0, 1, 0] }

def points78 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 8, original row 1933, representative 6337.
def source79 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B023.Data.entryAt ⟨75, by decide +kernel⟩

def target79 : Weights.Entry :=
  { word := [1, 4, 8, 4, 4, 12, 0], weights := [1, 0, 1, 0] }

def points79 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 8, original row 1952, representative 6369.
def source80 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B023.Data.entryAt ⟨107, by decide +kernel⟩

def target80 : Weights.Entry :=
  { word := [1, 4, 8, 4, 10, 8, 2], weights := [0, 0, 1, 0] }

def points80 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 8, original row 1959, representative 6329.
def source81 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B023.Data.entryAt ⟨67, by decide +kernel⟩

def target81 : Weights.Entry :=
  { word := [1, 4, 8, 4, 12, 12, 0], weights := [1, 0, 1, 0] }

def points81 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 8, original row 1975, representative 6356.
def source82 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B023.Data.entryAt ⟨94, by decide +kernel⟩

def target82 : Weights.Entry :=
  { word := [1, 4, 10, 0, 1, 8, 1], weights := [0, 1, 0, 1] }

def points82 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 8, original row 1982, representative 6352.
def source83 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B023.Data.entryAt ⟨90, by decide +kernel⟩

def target83 : Weights.Entry :=
  { word := [1, 4, 10, 0, 9, 8, 1], weights := [0, 1, 0, 1] }

def points83 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 8, original row 1989, representative 6375.
def source84 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B023.Data.entryAt ⟨113, by decide +kernel⟩

def target84 : Weights.Entry :=
  { word := [1, 4, 10, 8, 2, 8, 2], weights := [0, 1, 1, 0] }

def points84 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 8, original row 1998, representative 6359.
def source85 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B023.Data.entryAt ⟨97, by decide +kernel⟩

def target85 : Weights.Entry :=
  { word := [1, 4, 10, 8, 10, 8, 2], weights := [0, 1, 1, 0] }

def points85 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 8, original row 2001, representative 6356.
def source86 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B023.Data.entryAt ⟨94, by decide +kernel⟩

def target86 : Weights.Entry :=
  { word := [1, 4, 12, 4, 0, 8, 1], weights := [1, 0, 0, 1] }

def points86 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6), (7, 7)]

-- Period 8, original row 2015, representative 6346.
def source87 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B023.Data.entryAt ⟨84, by decide +kernel⟩

def target87 : Weights.Entry :=
  { word := [1, 4, 12, 4, 8, 8, 1], weights := [1, 0, 1, 0] }

def points87 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 8, original row 2029, representative 6387.
def source88 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B023.Data.entryAt ⟨125, by decide +kernel⟩

def target88 : Weights.Entry :=
  { word := [1, 8, 1, 4, 2, 8, 2], weights := [0, 0, 1, 0] }

def points88 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 8, original row 2051, representative 6371.
def source89 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B023.Data.entryAt ⟨109, by decide +kernel⟩

def target89 : Weights.Entry :=
  { word := [1, 8, 1, 4, 10, 8, 2], weights := [0, 0, 1, 0] }

def points89 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 8, original row 2076, representative 6331.
def source90 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B023.Data.entryAt ⟨69, by decide +kernel⟩

def target90 : Weights.Entry :=
  { word := [1, 8, 2, 2, 2, 8, 1], weights := [0, 1, 0, 0] }

def points90 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 8, original row 2077, representative 6377.
def source91 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B023.Data.entryAt ⟨115, by decide +kernel⟩

def target91 : Weights.Entry :=
  { word := [1, 8, 2, 2, 2, 8, 2], weights := [0, 1, 0, 0] }

def points91 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 8, original row 2091, representative 6323.
def source92 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B023.Data.entryAt ⟨61, by decide +kernel⟩

def target92 : Weights.Entry :=
  { word := [1, 8, 2, 2, 10, 8, 1], weights := [0, 1, 0, 0] }

def points92 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 8, original row 2092, representative 6361.
def source93 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B023.Data.entryAt ⟨99, by decide +kernel⟩

def target93 : Weights.Entry :=
  { word := [1, 8, 2, 2, 10, 8, 2], weights := [0, 1, 0, 0] }

def points93 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 8, original row 2093, representative 6389.
def source94 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B023.Data.entryAt ⟨127, by decide +kernel⟩

def target94 : Weights.Entry :=
  { word := [1, 8, 2, 2, 10, 8, 4], weights := [1, 0, 0, 1] }

def points94 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 8, original row 2105, representative 6334.
def source95 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B023.Data.entryAt ⟨72, by decide +kernel⟩

def target95 : Weights.Entry :=
  { word := [1, 8, 2, 10, 2, 8, 1], weights := [0, 1, 0, 0] }

def points95 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 8, original row 2106, representative 6380.
def source96 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B023.Data.entryAt ⟨118, by decide +kernel⟩

def target96 : Weights.Entry :=
  { word := [1, 8, 2, 10, 2, 8, 2], weights := [0, 1, 0, 0] }

def points96 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 8, original row 2119, representative 6326.
def source97 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B023.Data.entryAt ⟨64, by decide +kernel⟩

def target97 : Weights.Entry :=
  { word := [1, 8, 2, 10, 10, 8, 1], weights := [0, 1, 0, 0] }

def points97 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 8, original row 2120, representative 6364.
def source98 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B023.Data.entryAt ⟨102, by decide +kernel⟩

def target98 : Weights.Entry :=
  { word := [1, 8, 2, 10, 10, 8, 2], weights := [0, 1, 0, 0] }

def points98 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 8, original row 2136, representative 6338.
def source99 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B023.Data.entryAt ⟨76, by decide +kernel⟩

def target99 : Weights.Entry :=
  { word := [1, 8, 8, 4, 4, 12, 0], weights := [1, 0, 1, 0] }

def points99 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 8, original row 2144, representative 6330.
def source100 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B023.Data.entryAt ⟨68, by decide +kernel⟩

def target100 : Weights.Entry :=
  { word := [1, 8, 8, 4, 12, 12, 0], weights := [0, 0, 1, 0] }

def points100 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 8, original row 2152, representative 6335.
def source101 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B023.Data.entryAt ⟨73, by decide +kernel⟩

def target101 : Weights.Entry :=
  { word := [1, 8, 9, 4, 4, 12, 0], weights := [1, 0, 1, 0] }

def points101 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 8, original row 2156, representative 6327.
def source102 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B023.Data.entryAt ⟨65, by decide +kernel⟩

def target102 : Weights.Entry :=
  { word := [1, 8, 9, 4, 12, 12, 0], weights := [0, 0, 1, 0] }

def points102 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 8, original row 2163, representative 6332.
def source103 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B023.Data.entryAt ⟨70, by decide +kernel⟩

def target103 : Weights.Entry :=
  { word := [1, 8, 10, 2, 2, 8, 1], weights := [0, 1, 0, 0] }

def points103 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 8, original row 2164, representative 6378.
def source104 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B023.Data.entryAt ⟨116, by decide +kernel⟩

def target104 : Weights.Entry :=
  { word := [1, 8, 10, 2, 2, 8, 2], weights := [0, 1, 0, 0] }

def points104 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 8, original row 2171, representative 6324.
def source105 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B023.Data.entryAt ⟨62, by decide +kernel⟩

def target105 : Weights.Entry :=
  { word := [1, 8, 10, 2, 10, 8, 1], weights := [0, 1, 0, 0] }

def points105 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 8, original row 2172, representative 6362.
def source106 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B023.Data.entryAt ⟨100, by decide +kernel⟩

def target106 : Weights.Entry :=
  { word := [1, 8, 10, 2, 10, 8, 2], weights := [0, 1, 0, 0] }

def points106 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 8, original row 2178, representative 6333.
def source107 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B023.Data.entryAt ⟨71, by decide +kernel⟩

def target107 : Weights.Entry :=
  { word := [1, 8, 10, 10, 2, 8, 1], weights := [0, 1, 0, 0] }

def points107 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 8, original row 2179, representative 6379.
def source108 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B023.Data.entryAt ⟨117, by decide +kernel⟩

def target108 : Weights.Entry :=
  { word := [1, 8, 10, 10, 2, 8, 2], weights := [0, 1, 0, 0] }

def points108 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 8, original row 2185, representative 6325.
def source109 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B023.Data.entryAt ⟨63, by decide +kernel⟩

def target109 : Weights.Entry :=
  { word := [1, 8, 10, 10, 10, 8, 1], weights := [0, 1, 0, 0] }

def points109 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 8, original row 2186, representative 6363.
def source110 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B023.Data.entryAt ⟨101, by decide +kernel⟩

def target110 : Weights.Entry :=
  { word := [1, 8, 10, 10, 10, 8, 2], weights := [0, 1, 0, 0] }

def points110 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 8, original row 2207, representative 6354.
def source111 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B023.Data.entryAt ⟨92, by decide +kernel⟩

def target111 : Weights.Entry :=
  { word := [1, 12, 2, 0, 1, 8, 1], weights := [0, 0, 1, 1] }

def points111 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 2221, representative 6350.
def source112 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B023.Data.entryAt ⟨88, by decide +kernel⟩

def target112 : Weights.Entry :=
  { word := [1, 12, 2, 0, 9, 8, 1], weights := [0, 0, 1, 1] }

def points112 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 2233, representative 6374.
def source113 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B023.Data.entryAt ⟨112, by decide +kernel⟩

def target113 : Weights.Entry :=
  { word := [1, 12, 2, 8, 2, 8, 2], weights := [0, 1, 1, 0] }

def points113 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 8, original row 2247, representative 6358.
def source114 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B023.Data.entryAt ⟨96, by decide +kernel⟩

def target114 : Weights.Entry :=
  { word := [1, 12, 2, 8, 10, 8, 2], weights := [0, 1, 1, 0] }

def points114 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 8, original row 2257, representative 6354.
def source115 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B023.Data.entryAt ⟨92, by decide +kernel⟩

def target115 : Weights.Entry :=
  { word := [1, 12, 4, 4, 0, 8, 1], weights := [0, 0, 1, 1] }

def points115 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 3), (6, 4), (7, 2)]

-- Period 8, original row 2271, representative 6344.
def source116 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B023.Data.entryAt ⟨82, by decide +kernel⟩

def target116 : Weights.Entry :=
  { word := [1, 12, 4, 4, 8, 8, 1], weights := [0, 0, 1, 1] }

def points116 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 2285, representative 6384.
def source117 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B023.Data.entryAt ⟨122, by decide +kernel⟩

def target117 : Weights.Entry :=
  { word := [1, 12, 8, 4, 2, 8, 2], weights := [0, 0, 1, 0] }

def points117 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 8, original row 2292, representative 6336.
def source118 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B023.Data.entryAt ⟨74, by decide +kernel⟩

def target118 : Weights.Entry :=
  { word := [1, 12, 8, 4, 4, 12, 0], weights := [0, 0, 1, 1] }

def points118 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 2311, representative 6368.
def source119 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B023.Data.entryAt ⟨106, by decide +kernel⟩

def target119 : Weights.Entry :=
  { word := [1, 12, 8, 4, 10, 8, 2], weights := [0, 0, 1, 0] }

def points119 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 8, original row 2318, representative 6328.
def source120 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B023.Data.entryAt ⟨66, by decide +kernel⟩

def target120 : Weights.Entry :=
  { word := [1, 12, 8, 4, 12, 12, 0], weights := [0, 0, 1, 1] }

def points120 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 2334, representative 6355.
def source121 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B023.Data.entryAt ⟨93, by decide +kernel⟩

def target121 : Weights.Entry :=
  { word := [1, 12, 10, 0, 1, 8, 1], weights := [0, 0, 1, 1] }

def points121 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 2341, representative 6351.
def source122 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B023.Data.entryAt ⟨89, by decide +kernel⟩

def target122 : Weights.Entry :=
  { word := [1, 12, 10, 0, 9, 8, 1], weights := [0, 0, 1, 1] }

def points122 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 2348, representative 6373.
def source123 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B023.Data.entryAt ⟨111, by decide +kernel⟩

def target123 : Weights.Entry :=
  { word := [1, 12, 10, 8, 2, 8, 2], weights := [0, 1, 1, 0] }

def points123 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 8, original row 2357, representative 6357.
def source124 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B023.Data.entryAt ⟨95, by decide +kernel⟩

def target124 : Weights.Entry :=
  { word := [1, 12, 10, 8, 10, 8, 2], weights := [0, 1, 1, 0] }

def points124 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 8, original row 2360, representative 6355.
def source125 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B023.Data.entryAt ⟨93, by decide +kernel⟩

def target125 : Weights.Entry :=
  { word := [1, 12, 12, 4, 0, 8, 1], weights := [0, 0, 1, 1] }

def points125 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 3), (6, 4), (7, 2)]

-- Period 8, original row 2374, representative 6345.
def source126 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B023.Data.entryAt ⟨83, by decide +kernel⟩

def target126 : Weights.Entry :=
  { word := [1, 12, 12, 4, 8, 8, 1], weights := [0, 0, 1, 1] }

def points126 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 3134, representative 6389.
def source127 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B023.Data.entryAt ⟨127, by decide +kernel⟩

def target127 : Weights.Entry :=
  { word := [2, 8, 12, 4, 4, 8, 0], weights := [1, 0, 0, 1] }

def points127 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

def period8Entries : List Weights.Entry := [target0, target1, target2, target3, target4, target5, target6, target7, target8, target9, target10, target11, target12, target13, target14, target15, target16, target17, target18, target19, target20, target21, target22, target23, target24, target25, target26, target27, target28, target29, target30, target31, target32, target33, target34, target35, target36, target37, target38, target39, target40, target41, target42, target43, target44, target45, target46, target47, target48, target49, target50, target51, target52, target53, target54, target55, target56, target57, target58, target59, target60, target61, target62, target63, target64, target65, target66, target67, target68, target69, target70, target71, target72, target73, target74, target75, target76, target77, target78, target79, target80, target81, target82, target83, target84, target85, target86, target87, target88, target89, target90, target91, target92, target93, target94, target95, target96, target97, target98, target99, target100, target101, target102, target103, target104, target105, target106, target107, target108, target109, target110, target111, target112, target113, target114, target115, target116, target117, target118, target119, target120, target121, target122, target123, target124, target125, target126, target127]

def period8Chunk : RowCoverage.Chunk where
  rows := [⟨1074, target0⟩, ⟨1081, target1⟩, ⟨1082, target2⟩, ⟨1089, target3⟩, ⟨1090, target4⟩, ⟨1096, target5⟩, ⟨1097, target6⟩, ⟨1103, target7⟩, ⟨1104, target8⟩, ⟨1126, target9⟩, ⟨1130, target10⟩, ⟨1132, target11⟩, ⟨1136, target12⟩, ⟨1138, target13⟩, ⟨1140, target14⟩, ⟨1142, target15⟩, ⟨1144, target16⟩, ⟨1166, target17⟩, ⟨1225, target18⟩, ⟨1251, target19⟩, ⟨1255, target20⟩, ⟨1258, target21⟩, ⟨1261, target22⟩, ⟨1263, target23⟩, ⟨1267, target24⟩, ⟨1269, target25⟩, ⟨1273, target26⟩, ⟨1275, target27⟩, ⟨1277, target28⟩, ⟨1279, target29⟩, ⟨1281, target30⟩, ⟨1289, target31⟩, ⟨1296, target32⟩, ⟨1298, target33⟩, ⟨1318, target34⟩, ⟨1326, target35⟩, ⟨1330, target36⟩, ⟨1333, target37⟩, ⟨1336, target38⟩, ⟨1384, target39⟩, ⟨1391, target40⟩, ⟨1399, target41⟩, ⟨1401, target42⟩, ⟨1459, target43⟩, ⟨1466, target44⟩, ⟨1474, target45⟩, ⟨1476, target46⟩, ⟨1512, target47⟩, ⟨1534, target48⟩, ⟨1558, target49⟩, ⟨1572, target50⟩, ⟨1584, target51⟩, ⟨1598, target52⟩, ⟨1608, target53⟩, ⟨1622, target54⟩, ⟨1629, target55⟩, ⟨1641, target56⟩, ⟨1648, target57⟩, ⟨1667, target58⟩, ⟨1674, target59⟩, ⟨1690, target60⟩, ⟨1697, target61⟩, ⟨1704, target62⟩, ⟨1713, target63⟩, ⟨1716, target64⟩, ⟨1730, target65⟩, ⟨1744, target66⟩, ⟨1766, target67⟩, ⟨1792, target68⟩, ⟨1807, target69⟩, ⟨1827, target70⟩, ⟨1835, target71⟩, ⟨1848, target72⟩, ⟨1862, target73⟩, ⟨1874, target74⟩, ⟨1888, target75⟩, ⟨1898, target76⟩, ⟨1912, target77⟩, ⟨1926, target78⟩, ⟨1933, target79⟩, ⟨1952, target80⟩, ⟨1959, target81⟩, ⟨1975, target82⟩, ⟨1982, target83⟩, ⟨1989, target84⟩, ⟨1998, target85⟩, ⟨2001, target86⟩, ⟨2015, target87⟩, ⟨2029, target88⟩, ⟨2051, target89⟩, ⟨2076, target90⟩, ⟨2077, target91⟩, ⟨2091, target92⟩, ⟨2092, target93⟩, ⟨2093, target94⟩, ⟨2105, target95⟩, ⟨2106, target96⟩, ⟨2119, target97⟩, ⟨2120, target98⟩, ⟨2136, target99⟩, ⟨2144, target100⟩, ⟨2152, target101⟩, ⟨2156, target102⟩, ⟨2163, target103⟩, ⟨2164, target104⟩, ⟨2171, target105⟩, ⟨2172, target106⟩, ⟨2178, target107⟩, ⟨2179, target108⟩, ⟨2185, target109⟩, ⟨2186, target110⟩, ⟨2207, target111⟩, ⟨2221, target112⟩, ⟨2233, target113⟩, ⟨2247, target114⟩, ⟨2257, target115⟩, ⟨2271, target116⟩, ⟨2285, target117⟩, ⟨2292, target118⟩, ⟨2311, target119⟩, ⟨2318, target120⟩, ⟨2334, target121⟩, ⟨2341, target122⟩, ⟨2348, target123⟩, ⟨2357, target124⟩, ⟨2360, target125⟩, ⟨2374, target126⟩, ⟨3134, target127⟩]
  indexMask := 26792078741419563665162533012329707994930004709445873417636344826171852690707859235049531146575654403276030788335268609942130692366778094291294315347346202506780404891706446903456188640402865748925240374546921210907396433275780596848876999312754809451685076600301389513078014791676674694222099096905555934639712959957533114414921917833359706983430370087094451240324630951880144115618708580137954893297785063828015266256672378111415890935960775310463495912003745262890873763265153566891823419960319214325778011907425383628555342027855544301454958873176498845469851167817542131924297948711092896775800952741592080024642997249277533190835663547641271610023468243113855368575394946139197066407634690406794109270796734326242486345434995801518193326168396789915579982008333773943916846624264404628543137061060853938869446599022001406081296074746895481132566448661328974147319187510881554448860252146768471284375446479036129834377154639514076425748480
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

end FranklSmallCyclic.TransportBatches.G049.B001.Data
