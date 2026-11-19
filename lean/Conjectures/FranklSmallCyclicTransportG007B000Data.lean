module

public import Conjectures.FranklSmallCyclicRowCoverage
public import Conjectures.FranklSmallCyclicCanonicalWords
public import Conjectures.FranklSmallCyclicOrbit7Block007Data

/-! 128 literal targets sharing one source proof block.
Original words and row indices are retained; weights may be transported.
-/
@[expose] public section

namespace FranklSmallCyclic.TransportBatches.G007.B000.Data

-- Period 7, original row 153, representative 922.
def source0 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B007.Data.entryAt ⟨13, by decide +kernel⟩

def target0 : Weights.Entry :=
  { word := [0, 1, 4, 2, 0, 8, 9], weights := [1, 0, 0, 1] }

-- Period 7, original row 154, representative 1000.
def source1 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B007.Data.entryAt ⟨91, by decide +kernel⟩

def target1 : Weights.Entry :=
  { word := [0, 1, 4, 2, 0, 8, 10], weights := [1, 0, 0, 1] }

-- Period 7, original row 181, representative 925.
def source2 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B007.Data.entryAt ⟨16, by decide +kernel⟩

def target2 : Weights.Entry :=
  { word := [0, 1, 4, 10, 0, 8, 9], weights := [1, 0, 0, 1] }

-- Period 7, original row 182, representative 1007.
def source3 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B007.Data.entryAt ⟨98, by decide +kernel⟩

def target3 : Weights.Entry :=
  { word := [0, 1, 4, 10, 0, 8, 10], weights := [1, 0, 0, 1] }

-- Period 7, original row 242, representative 923.
def source4 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B007.Data.entryAt ⟨14, by decide +kernel⟩

def target4 : Weights.Entry :=
  { word := [0, 1, 12, 2, 0, 8, 9], weights := [1, 0, 0, 1] }

-- Period 7, original row 243, representative 1005.
def source5 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B007.Data.entryAt ⟨96, by decide +kernel⟩

def target5 : Weights.Entry :=
  { word := [0, 1, 12, 2, 0, 8, 10], weights := [1, 0, 0, 1] }

-- Period 7, original row 274, representative 924.
def source6 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B007.Data.entryAt ⟨15, by decide +kernel⟩

def target6 : Weights.Entry :=
  { word := [0, 1, 12, 10, 0, 8, 9], weights := [1, 0, 0, 1] }

-- Period 7, original row 275, representative 1006.
def source7 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B007.Data.entryAt ⟨97, by decide +kernel⟩

def target7 : Weights.Entry :=
  { word := [0, 1, 12, 10, 0, 8, 10], weights := [1, 0, 0, 1] }

-- Period 7, original row 325, representative 922.
def source8 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B007.Data.entryAt ⟨13, by decide +kernel⟩

def target8 : Weights.Entry :=
  { word := [0, 2, 2, 2, 0, 8, 9], weights := [0, 1, 0, 1] }

def points8 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6)]

-- Period 7, original row 326, representative 1000.
def source9 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B007.Data.entryAt ⟨91, by decide +kernel⟩

def target9 : Weights.Entry :=
  { word := [0, 2, 2, 2, 0, 8, 10], weights := [0, 1, 0, 1] }

def points9 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6)]

-- Period 7, original row 353, representative 914.
def source10 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B007.Data.entryAt ⟨5, by decide +kernel⟩

def target10 : Weights.Entry :=
  { word := [0, 2, 2, 2, 8, 8, 9], weights := [1, 0, 0, 1] }

-- Period 7, original row 354, representative 988.
def source11 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B007.Data.entryAt ⟨79, by decide +kernel⟩

def target11 : Weights.Entry :=
  { word := [0, 2, 2, 2, 8, 8, 10], weights := [1, 0, 0, 1] }

-- Period 7, original row 373, representative 925.
def source12 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B007.Data.entryAt ⟨16, by decide +kernel⟩

def target12 : Weights.Entry :=
  { word := [0, 2, 2, 10, 0, 8, 9], weights := [0, 1, 0, 1] }

def points12 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6)]

-- Period 7, original row 374, representative 1007.
def source13 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B007.Data.entryAt ⟨98, by decide +kernel⟩

def target13 : Weights.Entry :=
  { word := [0, 2, 2, 10, 0, 8, 10], weights := [0, 1, 0, 1] }

def points13 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6)]

-- Period 7, original row 401, representative 917.
def source14 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B007.Data.entryAt ⟨8, by decide +kernel⟩

def target14 : Weights.Entry :=
  { word := [0, 2, 2, 10, 8, 8, 9], weights := [0, 1, 1, 0] }

-- Period 7, original row 402, representative 991.
def source15 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B007.Data.entryAt ⟨82, by decide +kernel⟩

def target15 : Weights.Entry :=
  { word := [0, 2, 2, 10, 8, 8, 10], weights := [0, 1, 1, 0] }

-- Period 7, original row 430, representative 923.
def source16 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B007.Data.entryAt ⟨14, by decide +kernel⟩

def target16 : Weights.Entry :=
  { word := [0, 2, 10, 2, 0, 8, 9], weights := [0, 1, 0, 1] }

def points16 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6)]

-- Period 7, original row 431, representative 1005.
def source17 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B007.Data.entryAt ⟨96, by decide +kernel⟩

def target17 : Weights.Entry :=
  { word := [0, 2, 10, 2, 0, 8, 10], weights := [0, 1, 0, 1] }

def points17 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6)]

-- Period 7, original row 451, representative 915.
def source18 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B007.Data.entryAt ⟨6, by decide +kernel⟩

def target18 : Weights.Entry :=
  { word := [0, 2, 10, 2, 8, 8, 9], weights := [1, 0, 0, 1] }

-- Period 7, original row 452, representative 989.
def source19 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B007.Data.entryAt ⟨80, by decide +kernel⟩

def target19 : Weights.Entry :=
  { word := [0, 2, 10, 2, 8, 8, 10], weights := [1, 0, 0, 1] }

-- Period 7, original row 475, representative 924.
def source20 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B007.Data.entryAt ⟨15, by decide +kernel⟩

def target20 : Weights.Entry :=
  { word := [0, 2, 10, 10, 0, 8, 9], weights := [0, 1, 0, 1] }

def points20 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6)]

-- Period 7, original row 476, representative 1006.
def source21 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B007.Data.entryAt ⟨97, by decide +kernel⟩

def target21 : Weights.Entry :=
  { word := [0, 2, 10, 10, 0, 8, 10], weights := [0, 1, 0, 1] }

def points21 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6)]

-- Period 7, original row 496, representative 916.
def source22 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B007.Data.entryAt ⟨7, by decide +kernel⟩

def target22 : Weights.Entry :=
  { word := [0, 2, 10, 10, 8, 8, 9], weights := [0, 1, 1, 0] }

-- Period 7, original row 497, representative 990.
def source23 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B007.Data.entryAt ⟨81, by decide +kernel⟩

def target23 : Weights.Entry :=
  { word := [0, 2, 10, 10, 8, 8, 10], weights := [0, 1, 1, 0] }

-- Period 7, original row 590, representative 1012.
def source24 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B007.Data.entryAt ⟨103, by decide +kernel⟩

def target24 : Weights.Entry :=
  { word := [0, 4, 2, 8, 8, 4, 10], weights := [0, 1, 1, 0] }

-- Period 7, original row 710, representative 1011.
def source25 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B007.Data.entryAt ⟨102, by decide +kernel⟩

def target25 : Weights.Entry :=
  { word := [0, 4, 10, 8, 8, 4, 10], weights := [0, 1, 1, 0] }

-- Period 7, original row 749, representative 1008.
def source26 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B007.Data.entryAt ⟨99, by decide +kernel⟩

def target26 : Weights.Entry :=
  { word := [0, 6, 2, 8, 8, 0, 9], weights := [0, 1, 1, 0] }

-- Period 7, original row 750, representative 1021.
def source27 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B007.Data.entryAt ⟨112, by decide +kernel⟩

def target27 : Weights.Entry :=
  { word := [0, 6, 2, 8, 8, 0, 10], weights := [0, 1, 1, 0] }

-- Period 7, original row 752, representative 933.
def source28 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B007.Data.entryAt ⟨24, by decide +kernel⟩

def target28 : Weights.Entry :=
  { word := [0, 6, 2, 8, 8, 2, 10], weights := [0, 1, 1, 0] }

-- Period 7, original row 759, representative 909.
def source29 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B007.Data.entryAt ⟨0, by decide +kernel⟩

def target29 : Weights.Entry :=
  { word := [0, 6, 2, 8, 8, 8, 9], weights := [0, 1, 1, 0] }

-- Period 7, original row 760, representative 983.
def source30 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B007.Data.entryAt ⟨74, by decide +kernel⟩

def target30 : Weights.Entry :=
  { word := [0, 6, 2, 8, 8, 8, 10], weights := [0, 1, 1, 0] }

-- Period 7, original row 762, representative 927.
def source31 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B007.Data.entryAt ⟨18, by decide +kernel⟩

def target31 : Weights.Entry :=
  { word := [0, 6, 2, 8, 8, 10, 10], weights := [0, 1, 1, 0] }

-- Period 7, original row 779, representative 932.
def source32 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B007.Data.entryAt ⟨23, by decide +kernel⟩

def target32 : Weights.Entry :=
  { word := [0, 6, 10, 8, 8, 2, 10], weights := [0, 1, 1, 0] }

-- Period 7, original row 787, representative 982.
def source33 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B007.Data.entryAt ⟨73, by decide +kernel⟩

def target33 : Weights.Entry :=
  { word := [0, 6, 10, 8, 8, 8, 10], weights := [0, 1, 1, 0] }

-- Period 7, original row 789, representative 926.
def source34 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B007.Data.entryAt ⟨17, by decide +kernel⟩

def target34 : Weights.Entry :=
  { word := [0, 6, 10, 8, 8, 10, 10], weights := [0, 1, 1, 0] }

-- Period 7, original row 862, representative 937.
def source35 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B007.Data.entryAt ⟨28, by decide +kernel⟩

def target35 : Weights.Entry :=
  { word := [0, 8, 0, 8, 4, 4, 12], weights := [0, 1, 0, 1] }

-- Period 7, original row 873, representative 935.
def source36 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B007.Data.entryAt ⟨26, by decide +kernel⟩

def target36 : Weights.Entry :=
  { word := [0, 8, 0, 8, 12, 4, 12], weights := [0, 1, 0, 1] }

-- Period 7, original row 1005, representative 931.
def source37 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B007.Data.entryAt ⟨22, by decide +kernel⟩

def target37 : Weights.Entry :=
  { word := [0, 8, 4, 8, 4, 4, 12], weights := [0, 1, 0, 1] }

-- Period 7, original row 1009, representative 929.
def source38 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B007.Data.entryAt ⟨20, by decide +kernel⟩

def target38 : Weights.Entry :=
  { word := [0, 8, 4, 8, 12, 4, 12], weights := [0, 1, 0, 1] }

-- Period 7, original row 1055, representative 936.
def source39 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B007.Data.entryAt ⟨27, by decide +kernel⟩

def target39 : Weights.Entry :=
  { word := [0, 8, 8, 8, 4, 4, 12], weights := [0, 1, 0, 1] }

-- Period 7, original row 1060, representative 934.
def source40 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B007.Data.entryAt ⟨25, by decide +kernel⟩

def target40 : Weights.Entry :=
  { word := [0, 8, 8, 8, 12, 4, 12], weights := [0, 1, 0, 1] }

-- Period 7, original row 1119, representative 930.
def source41 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B007.Data.entryAt ⟨21, by decide +kernel⟩

def target41 : Weights.Entry :=
  { word := [0, 8, 12, 8, 4, 4, 12], weights := [0, 1, 0, 1] }

-- Period 7, original row 1123, representative 928.
def source42 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B007.Data.entryAt ⟨19, by decide +kernel⟩

def target42 : Weights.Entry :=
  { word := [0, 8, 12, 8, 12, 4, 12], weights := [0, 1, 0, 1] }

-- Period 7, original row 1154, representative 1026.
def source43 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B007.Data.entryAt ⟨117, by decide +kernel⟩

def target43 : Weights.Entry :=
  { word := [0, 9, 0, 4, 2, 0, 9], weights := [1, 0, 1, 0] }

-- Period 7, original row 1155, representative 1026.
def source44 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B007.Data.entryAt ⟨117, by decide +kernel⟩

def target44 : Weights.Entry :=
  { word := [0, 9, 0, 4, 2, 0, 10], weights := [1, 0, 1, 0] }

def points44 : List (ℕ × ℕ) := [(0, 0), (1, 2), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 1160, representative 978.
def source45 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B007.Data.entryAt ⟨69, by decide +kernel⟩

def target45 : Weights.Entry :=
  { word := [0, 9, 0, 4, 2, 8, 10], weights := [1, 0, 1, 0] }

-- Period 7, original row 1180, representative 1027.
def source46 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B007.Data.entryAt ⟨118, by decide +kernel⟩

def target46 : Weights.Entry :=
  { word := [0, 9, 0, 4, 10, 0, 9], weights := [1, 0, 1, 0] }

-- Period 7, original row 1181, representative 1027.
def source47 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B007.Data.entryAt ⟨118, by decide +kernel⟩

def target47 : Weights.Entry :=
  { word := [0, 9, 0, 4, 10, 0, 10], weights := [1, 0, 1, 0] }

def points47 : List (ℕ × ℕ) := [(0, 0), (1, 2), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 1186, representative 979.
def source48 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B007.Data.entryAt ⟨70, by decide +kernel⟩

def target48 : Weights.Entry :=
  { word := [0, 9, 0, 4, 10, 8, 10], weights := [1, 0, 1, 0] }

-- Period 7, original row 1214, representative 1029.
def source49 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B007.Data.entryAt ⟨120, by decide +kernel⟩

def target49 : Weights.Entry :=
  { word := [0, 9, 0, 12, 2, 0, 9], weights := [1, 0, 1, 0] }

-- Period 7, original row 1215, representative 1029.
def source50 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B007.Data.entryAt ⟨120, by decide +kernel⟩

def target50 : Weights.Entry :=
  { word := [0, 9, 0, 12, 2, 0, 10], weights := [1, 0, 1, 0] }

def points50 : List (ℕ × ℕ) := [(0, 0), (1, 2), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 1220, representative 981.
def source51 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B007.Data.entryAt ⟨72, by decide +kernel⟩

def target51 : Weights.Entry :=
  { word := [0, 9, 0, 12, 2, 8, 10], weights := [1, 0, 1, 0] }

-- Period 7, original row 1239, representative 1028.
def source52 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B007.Data.entryAt ⟨119, by decide +kernel⟩

def target52 : Weights.Entry :=
  { word := [0, 9, 0, 12, 10, 0, 9], weights := [1, 0, 1, 0] }

-- Period 7, original row 1240, representative 1028.
def source53 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B007.Data.entryAt ⟨119, by decide +kernel⟩

def target53 : Weights.Entry :=
  { word := [0, 9, 0, 12, 10, 0, 10], weights := [1, 0, 1, 0] }

def points53 : List (ℕ × ℕ) := [(0, 0), (1, 2), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 1245, representative 980.
def source54 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B007.Data.entryAt ⟨71, by decide +kernel⟩

def target54 : Weights.Entry :=
  { word := [0, 9, 0, 12, 10, 8, 10], weights := [1, 0, 1, 0] }

-- Period 7, original row 1379, representative 1024.
def source55 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B007.Data.entryAt ⟨115, by decide +kernel⟩

def target55 : Weights.Entry :=
  { word := [0, 10, 2, 2, 8, 0, 9], weights := [1, 1, 0, 0] }

-- Period 7, original row 1380, representative 1022.
def source56 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B007.Data.entryAt ⟨113, by decide +kernel⟩

def target56 : Weights.Entry :=
  { word := [0, 10, 2, 2, 8, 0, 10], weights := [1, 1, 0, 0] }

-- Period 7, original row 1396, representative 910.
def source57 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B007.Data.entryAt ⟨1, by decide +kernel⟩

def target57 : Weights.Entry :=
  { word := [0, 10, 2, 2, 8, 8, 9], weights := [1, 0, 0, 1] }

-- Period 7, original row 1397, representative 984.
def source58 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B007.Data.entryAt ⟨75, by decide +kernel⟩

def target58 : Weights.Entry :=
  { word := [0, 10, 2, 2, 8, 8, 10], weights := [1, 0, 0, 1] }

-- Period 7, original row 1413, representative 1025.
def source59 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B007.Data.entryAt ⟨116, by decide +kernel⟩

def target59 : Weights.Entry :=
  { word := [0, 10, 2, 10, 8, 0, 9], weights := [1, 1, 0, 0] }

-- Period 7, original row 1414, representative 1023.
def source60 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B007.Data.entryAt ⟨114, by decide +kernel⟩

def target60 : Weights.Entry :=
  { word := [0, 10, 2, 10, 8, 0, 10], weights := [1, 1, 0, 0] }

-- Period 7, original row 1427, representative 913.
def source61 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B007.Data.entryAt ⟨4, by decide +kernel⟩

def target61 : Weights.Entry :=
  { word := [0, 10, 2, 10, 8, 8, 9], weights := [0, 1, 1, 0] }

-- Period 7, original row 1428, representative 987.
def source62 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B007.Data.entryAt ⟨78, by decide +kernel⟩

def target62 : Weights.Entry :=
  { word := [0, 10, 2, 10, 8, 8, 10], weights := [0, 1, 1, 0] }

-- Period 7, original row 1471, representative 911.
def source63 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B007.Data.entryAt ⟨2, by decide +kernel⟩

def target63 : Weights.Entry :=
  { word := [0, 10, 10, 2, 8, 8, 9], weights := [1, 0, 0, 1] }

-- Period 7, original row 1472, representative 985.
def source64 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B007.Data.entryAt ⟨76, by decide +kernel⟩

def target64 : Weights.Entry :=
  { word := [0, 10, 10, 2, 8, 8, 10], weights := [1, 0, 0, 1] }

-- Period 7, original row 1495, representative 912.
def source65 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B007.Data.entryAt ⟨3, by decide +kernel⟩

def target65 : Weights.Entry :=
  { word := [0, 10, 10, 10, 8, 8, 9], weights := [0, 1, 1, 0] }

-- Period 7, original row 1496, representative 986.
def source66 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B007.Data.entryAt ⟨77, by decide +kernel⟩

def target66 : Weights.Entry :=
  { word := [0, 10, 10, 10, 8, 8, 10], weights := [0, 1, 1, 0] }

-- Period 7, original row 1589, representative 1010.
def source67 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B007.Data.entryAt ⟨101, by decide +kernel⟩

def target67 : Weights.Entry :=
  { word := [0, 12, 2, 8, 8, 4, 10], weights := [0, 1, 1, 0] }

-- Period 7, original row 1709, representative 1009.
def source68 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B007.Data.entryAt ⟨100, by decide +kernel⟩

def target68 : Weights.Entry :=
  { word := [0, 12, 10, 8, 8, 4, 10], weights := [0, 1, 1, 0] }

-- Period 7, original row 1879, representative 1012.
def source69 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B007.Data.entryAt ⟨103, by decide +kernel⟩

def target69 : Weights.Entry :=
  { word := [1, 4, 2, 8, 8, 4, 10], weights := [0, 1, 1, 0] }

def points69 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 1994, representative 1011.
def source70 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B007.Data.entryAt ⟨102, by decide +kernel⟩

def target70 : Weights.Entry :=
  { word := [1, 4, 10, 8, 8, 4, 10], weights := [0, 1, 1, 0] }

def points70 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 2238, representative 1010.
def source71 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B007.Data.entryAt ⟨101, by decide +kernel⟩

def target71 : Weights.Entry :=
  { word := [1, 12, 2, 8, 8, 4, 10], weights := [0, 1, 1, 0] }

def points71 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 2353, representative 1009.
def source72 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B007.Data.entryAt ⟨100, by decide +kernel⟩

def target72 : Weights.Entry :=
  { word := [1, 12, 10, 8, 8, 4, 10], weights := [0, 1, 1, 0] }

def points72 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 2415, representative 966.
def source73 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B007.Data.entryAt ⟨57, by decide +kernel⟩

def target73 : Weights.Entry :=
  { word := [2, 0, 4, 2, 0, 8, 10], weights := [1, 0, 0, 1] }

-- Period 7, original row 2416, representative 966.
def source74 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B007.Data.entryAt ⟨57, by decide +kernel⟩

def target74 : Weights.Entry :=
  { word := [2, 0, 4, 2, 0, 8, 12], weights := [1, 0, 0, 1] }

def points74 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 2424, representative 967.
def source75 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B007.Data.entryAt ⟨58, by decide +kernel⟩

def target75 : Weights.Entry :=
  { word := [2, 0, 4, 2, 8, 8, 12], weights := [1, 0, 0, 1] }

-- Period 7, original row 2438, representative 973.
def source76 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B007.Data.entryAt ⟨64, by decide +kernel⟩

def target76 : Weights.Entry :=
  { word := [2, 0, 4, 10, 0, 8, 10], weights := [1, 0, 0, 1] }

-- Period 7, original row 2439, representative 973.
def source77 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B007.Data.entryAt ⟨64, by decide +kernel⟩

def target77 : Weights.Entry :=
  { word := [2, 0, 4, 10, 0, 8, 12], weights := [1, 0, 0, 1] }

def points77 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 2451, representative 970.
def source78 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B007.Data.entryAt ⟨61, by decide +kernel⟩

def target78 : Weights.Entry :=
  { word := [2, 0, 4, 10, 8, 8, 12], weights := [1, 0, 0, 1] }

-- Period 7, original row 2532, representative 971.
def source79 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B007.Data.entryAt ⟨62, by decide +kernel⟩

def target79 : Weights.Entry :=
  { word := [2, 0, 12, 2, 0, 8, 10], weights := [1, 0, 0, 1] }

-- Period 7, original row 2533, representative 971.
def source80 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B007.Data.entryAt ⟨62, by decide +kernel⟩

def target80 : Weights.Entry :=
  { word := [2, 0, 12, 2, 0, 8, 12], weights := [1, 0, 0, 1] }

def points80 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 2541, representative 968.
def source81 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B007.Data.entryAt ⟨59, by decide +kernel⟩

def target81 : Weights.Entry :=
  { word := [2, 0, 12, 2, 8, 8, 12], weights := [1, 0, 0, 1] }

-- Period 7, original row 2560, representative 972.
def source82 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B007.Data.entryAt ⟨63, by decide +kernel⟩

def target82 : Weights.Entry :=
  { word := [2, 0, 12, 10, 0, 8, 10], weights := [1, 0, 0, 1] }

-- Period 7, original row 2561, representative 972.
def source83 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B007.Data.entryAt ⟨63, by decide +kernel⟩

def target83 : Weights.Entry :=
  { word := [2, 0, 12, 10, 0, 8, 12], weights := [1, 0, 0, 1] }

def points83 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 2573, representative 969.
def source84 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B007.Data.entryAt ⟨60, by decide +kernel⟩

def target84 : Weights.Entry :=
  { word := [2, 0, 12, 10, 8, 8, 12], weights := [1, 0, 0, 1] }

-- Period 7, original row 2810, representative 1030.
def source85 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B007.Data.entryAt ⟨121, by decide +kernel⟩

def target85 : Weights.Entry :=
  { word := [2, 8, 0, 4, 2, 0, 10], weights := [1, 0, 1, 0] }

-- Period 7, original row 2811, representative 1013.
def source86 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B007.Data.entryAt ⟨104, by decide +kernel⟩

def target86 : Weights.Entry :=
  { word := [2, 8, 0, 4, 2, 0, 12], weights := [1, 0, 0, 1] }

-- Period 7, original row 2815, representative 946.
def source87 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B007.Data.entryAt ⟨37, by decide +kernel⟩

def target87 : Weights.Entry :=
  { word := [2, 8, 0, 4, 2, 8, 10], weights := [1, 0, 1, 0] }

-- Period 7, original row 2816, representative 938.
def source88 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B007.Data.entryAt ⟨29, by decide +kernel⟩

def target88 : Weights.Entry :=
  { word := [2, 8, 0, 4, 2, 8, 12], weights := [1, 0, 0, 1] }

-- Period 7, original row 2836, representative 1031.
def source89 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B007.Data.entryAt ⟨122, by decide +kernel⟩

def target89 : Weights.Entry :=
  { word := [2, 8, 0, 4, 10, 0, 10], weights := [1, 0, 1, 0] }

-- Period 7, original row 2837, representative 1014.
def source90 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B007.Data.entryAt ⟨105, by decide +kernel⟩

def target90 : Weights.Entry :=
  { word := [2, 8, 0, 4, 10, 0, 12], weights := [1, 0, 0, 1] }

-- Period 7, original row 2841, representative 947.
def source91 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B007.Data.entryAt ⟨38, by decide +kernel⟩

def target91 : Weights.Entry :=
  { word := [2, 8, 0, 4, 10, 8, 10], weights := [1, 0, 1, 0] }

-- Period 7, original row 2842, representative 939.
def source92 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B007.Data.entryAt ⟨30, by decide +kernel⟩

def target92 : Weights.Entry :=
  { word := [2, 8, 0, 4, 10, 8, 12], weights := [1, 0, 0, 1] }

-- Period 7, original row 2863, representative 1020.
def source93 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B007.Data.entryAt ⟨111, by decide +kernel⟩

def target93 : Weights.Entry :=
  { word := [2, 8, 0, 12, 2, 0, 12], weights := [1, 0, 1, 0] }

-- Period 7, original row 2867, representative 953.
def source94 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B007.Data.entryAt ⟨44, by decide +kernel⟩

def target94 : Weights.Entry :=
  { word := [2, 8, 0, 12, 2, 8, 10], weights := [1, 0, 1, 0] }

-- Period 7, original row 2868, representative 945.
def source95 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B007.Data.entryAt ⟨36, by decide +kernel⟩

def target95 : Weights.Entry :=
  { word := [2, 8, 0, 12, 2, 8, 12], weights := [1, 0, 1, 0] }

-- Period 7, original row 2887, representative 1034.
def source96 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B007.Data.entryAt ⟨125, by decide +kernel⟩

def target96 : Weights.Entry :=
  { word := [2, 8, 0, 12, 10, 0, 10], weights := [1, 0, 1, 0] }

-- Period 7, original row 2888, representative 1017.
def source97 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B007.Data.entryAt ⟨108, by decide +kernel⟩

def target97 : Weights.Entry :=
  { word := [2, 8, 0, 12, 10, 0, 12], weights := [1, 0, 1, 0] }

-- Period 7, original row 2892, representative 950.
def source98 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B007.Data.entryAt ⟨41, by decide +kernel⟩

def target98 : Weights.Entry :=
  { word := [2, 8, 0, 12, 10, 8, 10], weights := [1, 0, 1, 0] }

-- Period 7, original row 2893, representative 942.
def source99 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B007.Data.entryAt ⟨33, by decide +kernel⟩

def target99 : Weights.Entry :=
  { word := [2, 8, 0, 12, 10, 8, 12], weights := [1, 0, 1, 0] }

-- Period 7, original row 2912, representative 962.
def source100 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B007.Data.entryAt ⟨53, by decide +kernel⟩

def target100 : Weights.Entry :=
  { word := [2, 8, 4, 2, 0, 8, 10], weights := [1, 0, 0, 1] }

-- Period 7, original row 2913, representative 954.
def source101 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B007.Data.entryAt ⟨45, by decide +kernel⟩

def target101 : Weights.Entry :=
  { word := [2, 8, 4, 2, 0, 8, 12], weights := [1, 0, 0, 1] }

-- Period 7, original row 2921, representative 955.
def source102 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B007.Data.entryAt ⟨46, by decide +kernel⟩

def target102 : Weights.Entry :=
  { word := [2, 8, 4, 2, 8, 8, 12], weights := [1, 0, 0, 1] }

-- Period 7, original row 2939, representative 965.
def source103 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B007.Data.entryAt ⟨56, by decide +kernel⟩

def target103 : Weights.Entry :=
  { word := [2, 8, 4, 10, 0, 8, 10], weights := [1, 0, 0, 1] }

-- Period 7, original row 2940, representative 961.
def source104 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B007.Data.entryAt ⟨52, by decide +kernel⟩

def target104 : Weights.Entry :=
  { word := [2, 8, 4, 10, 0, 8, 12], weights := [1, 0, 0, 1] }

-- Period 7, original row 2945, representative 958.
def source105 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B007.Data.entryAt ⟨49, by decide +kernel⟩

def target105 : Weights.Entry :=
  { word := [2, 8, 4, 10, 8, 8, 12], weights := [1, 0, 0, 1] }

-- Period 7, original row 2974, representative 1035.
def source106 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B007.Data.entryAt ⟨126, by decide +kernel⟩

def target106 : Weights.Entry :=
  { word := [2, 8, 8, 4, 2, 0, 10], weights := [1, 0, 1, 0] }

-- Period 7, original row 2975, representative 1018.
def source107 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B007.Data.entryAt ⟨109, by decide +kernel⟩

def target107 : Weights.Entry :=
  { word := [2, 8, 8, 4, 2, 0, 12], weights := [1, 0, 0, 1] }

-- Period 7, original row 2979, representative 951.
def source108 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B007.Data.entryAt ⟨42, by decide +kernel⟩

def target108 : Weights.Entry :=
  { word := [2, 8, 8, 4, 2, 8, 10], weights := [1, 0, 1, 0] }

-- Period 7, original row 2980, representative 943.
def source109 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B007.Data.entryAt ⟨34, by decide +kernel⟩

def target109 : Weights.Entry :=
  { word := [2, 8, 8, 4, 2, 8, 12], weights := [1, 0, 0, 1] }

-- Period 7, original row 3004, representative 1032.
def source110 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B007.Data.entryAt ⟨123, by decide +kernel⟩

def target110 : Weights.Entry :=
  { word := [2, 8, 8, 4, 10, 0, 10], weights := [1, 0, 1, 0] }

-- Period 7, original row 3005, representative 1015.
def source111 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B007.Data.entryAt ⟨106, by decide +kernel⟩

def target111 : Weights.Entry :=
  { word := [2, 8, 8, 4, 10, 0, 12], weights := [1, 0, 0, 1] }

-- Period 7, original row 3009, representative 948.
def source112 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B007.Data.entryAt ⟨39, by decide +kernel⟩

def target112 : Weights.Entry :=
  { word := [2, 8, 8, 4, 10, 8, 10], weights := [1, 0, 1, 0] }

-- Period 7, original row 3010, representative 940.
def source113 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B007.Data.entryAt ⟨31, by decide +kernel⟩

def target113 : Weights.Entry :=
  { word := [2, 8, 8, 4, 10, 8, 12], weights := [1, 0, 0, 1] }

-- Period 7, original row 3048, representative 1036.
def source114 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B007.Data.entryAt ⟨127, by decide +kernel⟩

def target114 : Weights.Entry :=
  { word := [2, 8, 8, 12, 2, 0, 10], weights := [1, 0, 1, 0] }

-- Period 7, original row 3049, representative 1019.
def source115 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B007.Data.entryAt ⟨110, by decide +kernel⟩

def target115 : Weights.Entry :=
  { word := [2, 8, 8, 12, 2, 0, 12], weights := [1, 0, 1, 0] }

-- Period 7, original row 3053, representative 952.
def source116 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B007.Data.entryAt ⟨43, by decide +kernel⟩

def target116 : Weights.Entry :=
  { word := [2, 8, 8, 12, 2, 8, 10], weights := [1, 0, 1, 0] }

-- Period 7, original row 3054, representative 944.
def source117 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B007.Data.entryAt ⟨35, by decide +kernel⟩

def target117 : Weights.Entry :=
  { word := [2, 8, 8, 12, 2, 8, 12], weights := [1, 0, 1, 0] }

-- Period 7, original row 3077, representative 1033.
def source118 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B007.Data.entryAt ⟨124, by decide +kernel⟩

def target118 : Weights.Entry :=
  { word := [2, 8, 8, 12, 10, 0, 10], weights := [1, 0, 1, 0] }

-- Period 7, original row 3078, representative 1016.
def source119 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B007.Data.entryAt ⟨107, by decide +kernel⟩

def target119 : Weights.Entry :=
  { word := [2, 8, 8, 12, 10, 0, 12], weights := [1, 0, 1, 0] }

-- Period 7, original row 3082, representative 949.
def source120 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B007.Data.entryAt ⟨40, by decide +kernel⟩

def target120 : Weights.Entry :=
  { word := [2, 8, 8, 12, 10, 8, 10], weights := [1, 0, 1, 0] }

-- Period 7, original row 3083, representative 941.
def source121 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B007.Data.entryAt ⟨32, by decide +kernel⟩

def target121 : Weights.Entry :=
  { word := [2, 8, 8, 12, 10, 8, 12], weights := [1, 0, 1, 0] }

-- Period 7, original row 3120, representative 963.
def source122 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B007.Data.entryAt ⟨54, by decide +kernel⟩

def target122 : Weights.Entry :=
  { word := [2, 8, 12, 2, 0, 8, 10], weights := [1, 0, 0, 1] }

-- Period 7, original row 3121, representative 959.
def source123 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B007.Data.entryAt ⟨50, by decide +kernel⟩

def target123 : Weights.Entry :=
  { word := [2, 8, 12, 2, 0, 8, 12], weights := [1, 0, 0, 1] }

-- Period 7, original row 3129, representative 956.
def source124 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B007.Data.entryAt ⟨47, by decide +kernel⟩

def target124 : Weights.Entry :=
  { word := [2, 8, 12, 2, 8, 8, 12], weights := [1, 0, 0, 1] }

-- Period 7, original row 3147, representative 964.
def source125 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B007.Data.entryAt ⟨55, by decide +kernel⟩

def target125 : Weights.Entry :=
  { word := [2, 8, 12, 10, 0, 8, 10], weights := [1, 0, 0, 1] }

-- Period 7, original row 3148, representative 960.
def source126 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B007.Data.entryAt ⟨51, by decide +kernel⟩

def target126 : Weights.Entry :=
  { word := [2, 8, 12, 10, 0, 8, 12], weights := [1, 0, 0, 1] }

-- Period 7, original row 3155, representative 957.
def source127 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B007.Data.entryAt ⟨48, by decide +kernel⟩

def target127 : Weights.Entry :=
  { word := [2, 8, 12, 10, 8, 8, 12], weights := [1, 0, 0, 1] }

def period7Entries : List Weights.Entry := [target0, target1, target2, target3, target4, target5, target6, target7, target8, target9, target10, target11, target12, target13, target14, target15, target16, target17, target18, target19, target20, target21, target22, target23, target24, target25, target26, target27, target28, target29, target30, target31, target32, target33, target34, target35, target36, target37, target38, target39, target40, target41, target42, target43, target44, target45, target46, target47, target48, target49, target50, target51, target52, target53, target54, target55, target56, target57, target58, target59, target60, target61, target62, target63, target64, target65, target66, target67, target68, target69, target70, target71, target72, target73, target74, target75, target76, target77, target78, target79, target80, target81, target82, target83, target84, target85, target86, target87, target88, target89, target90, target91, target92, target93, target94, target95, target96, target97, target98, target99, target100, target101, target102, target103, target104, target105, target106, target107, target108, target109, target110, target111, target112, target113, target114, target115, target116, target117, target118, target119, target120, target121, target122, target123, target124, target125, target126, target127]

def period7Chunk : RowCoverage.Chunk where
  rows := [⟨153, target0⟩, ⟨154, target1⟩, ⟨181, target2⟩, ⟨182, target3⟩, ⟨242, target4⟩, ⟨243, target5⟩, ⟨274, target6⟩, ⟨275, target7⟩, ⟨325, target8⟩, ⟨326, target9⟩, ⟨353, target10⟩, ⟨354, target11⟩, ⟨373, target12⟩, ⟨374, target13⟩, ⟨401, target14⟩, ⟨402, target15⟩, ⟨430, target16⟩, ⟨431, target17⟩, ⟨451, target18⟩, ⟨452, target19⟩, ⟨475, target20⟩, ⟨476, target21⟩, ⟨496, target22⟩, ⟨497, target23⟩, ⟨590, target24⟩, ⟨710, target25⟩, ⟨749, target26⟩, ⟨750, target27⟩, ⟨752, target28⟩, ⟨759, target29⟩, ⟨760, target30⟩, ⟨762, target31⟩, ⟨779, target32⟩, ⟨787, target33⟩, ⟨789, target34⟩, ⟨862, target35⟩, ⟨873, target36⟩, ⟨1005, target37⟩, ⟨1009, target38⟩, ⟨1055, target39⟩, ⟨1060, target40⟩, ⟨1119, target41⟩, ⟨1123, target42⟩, ⟨1154, target43⟩, ⟨1155, target44⟩, ⟨1160, target45⟩, ⟨1180, target46⟩, ⟨1181, target47⟩, ⟨1186, target48⟩, ⟨1214, target49⟩, ⟨1215, target50⟩, ⟨1220, target51⟩, ⟨1239, target52⟩, ⟨1240, target53⟩, ⟨1245, target54⟩, ⟨1379, target55⟩, ⟨1380, target56⟩, ⟨1396, target57⟩, ⟨1397, target58⟩, ⟨1413, target59⟩, ⟨1414, target60⟩, ⟨1427, target61⟩, ⟨1428, target62⟩, ⟨1471, target63⟩, ⟨1472, target64⟩, ⟨1495, target65⟩, ⟨1496, target66⟩, ⟨1589, target67⟩, ⟨1709, target68⟩, ⟨1879, target69⟩, ⟨1994, target70⟩, ⟨2238, target71⟩, ⟨2353, target72⟩, ⟨2415, target73⟩, ⟨2416, target74⟩, ⟨2424, target75⟩, ⟨2438, target76⟩, ⟨2439, target77⟩, ⟨2451, target78⟩, ⟨2532, target79⟩, ⟨2533, target80⟩, ⟨2541, target81⟩, ⟨2560, target82⟩, ⟨2561, target83⟩, ⟨2573, target84⟩, ⟨2810, target85⟩, ⟨2811, target86⟩, ⟨2815, target87⟩, ⟨2816, target88⟩, ⟨2836, target89⟩, ⟨2837, target90⟩, ⟨2841, target91⟩, ⟨2842, target92⟩, ⟨2863, target93⟩, ⟨2867, target94⟩, ⟨2868, target95⟩, ⟨2887, target96⟩, ⟨2888, target97⟩, ⟨2892, target98⟩, ⟨2893, target99⟩, ⟨2912, target100⟩, ⟨2913, target101⟩, ⟨2921, target102⟩, ⟨2939, target103⟩, ⟨2940, target104⟩, ⟨2945, target105⟩, ⟨2974, target106⟩, ⟨2975, target107⟩, ⟨2979, target108⟩, ⟨2980, target109⟩, ⟨3004, target110⟩, ⟨3005, target111⟩, ⟨3009, target112⟩, ⟨3010, target113⟩, ⟨3048, target114⟩, ⟨3049, target115⟩, ⟨3053, target116⟩, ⟨3054, target117⟩, ⟨3077, target118⟩, ⟨3078, target119⟩, ⟨3082, target120⟩, ⟨3083, target121⟩, ⟨3120, target122⟩, ⟨3121, target123⟩, ⟨3129, target124⟩, ⟨3147, target125⟩, ⟨3148, target126⟩, ⟨3155, target127⟩]
  indexMask := 56845504486032884782272279456671110669935607034617125417024357879395599612113783923184471523630053832326115104317990944295565672304799891387532829090815096264259613422133548683619141179006609755834515774667102077626198247937895927470680109702492663395370265973902418368609365474474936684936183428294677085768318859522072796644845617148839114424216256639554302219781472383123922276416566390208564651808897230490480752457258323148017307951883219789783768419898319300941206238300547136238539951992277694105120744758850976960366965001663903877451800450300754386598400214846724599040032026056186425856703924924623524058520657625545201850328888051911496442176528756483467762531607554225528533772986682025545443272346108718617909450167060528926738427527569179354333111092884553991522283546968701966667350924113612095350975138288802862957787916124737568168788150589842266790377385711594110386748660606496434411413237160419946973040804665894649824922623279104
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

end FranklSmallCyclic.TransportBatches.G007.B000.Data
