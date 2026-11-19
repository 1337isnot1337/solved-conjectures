module

public import Conjectures.FranklSmallCyclicRowCoverage
public import Conjectures.FranklSmallCyclicCanonicalWords
public import Conjectures.FranklSmallCyclicOrbit7Block008Data

/-! 128 literal targets sharing one source proof block.
Original words and row indices are retained; weights may be transported.
-/
@[expose] public section

namespace FranklSmallCyclic.TransportBatches.G008.B001.Data

-- Period 7, original row 5774, representative 1149.
def source0 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B008.Data.entryAt ⟨112, by decide +kernel⟩

def target0 : Weights.Entry :=
  { word := [8, 8, 10, 10, 2, 8, 12], weights := [1, 0, 0, 1] }

-- Period 7, original row 5779, representative 1090.
def source1 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B008.Data.entryAt ⟨53, by decide +kernel⟩

def target1 : Weights.Entry :=
  { word := [8, 8, 10, 10, 10, 8, 9], weights := [0, 1, 1, 0] }

-- Period 7, original row 5780, representative 1164.
def source2 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B008.Data.entryAt ⟨127, by decide +kernel⟩

def target2 : Weights.Entry :=
  { word := [8, 8, 10, 10, 10, 8, 10], weights := [0, 1, 1, 0] }

-- Period 7, original row 5781, representative 1146.
def source3 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B008.Data.entryAt ⟨109, by decide +kernel⟩

def target3 : Weights.Entry :=
  { word := [8, 8, 10, 10, 10, 8, 12], weights := [1, 0, 0, 1] }

-- Period 7, original row 5791, representative 1128.
def source4 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B008.Data.entryAt ⟨91, by decide +kernel⟩

def target4 : Weights.Entry :=
  { word := [8, 8, 12, 2, 0, 8, 9], weights := [1, 0, 0, 1] }

-- Period 7, original row 5829, representative 1129.
def source5 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B008.Data.entryAt ⟨92, by decide +kernel⟩

def target5 : Weights.Entry :=
  { word := [8, 8, 12, 10, 0, 8, 9], weights := [1, 0, 0, 1] }

-- Period 7, original row 5849, representative 1083.
def source6 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B008.Data.entryAt ⟨46, by decide +kernel⟩

def target6 : Weights.Entry :=
  { word := [8, 9, 0, 1, 4, 2, 8], weights := [1, 2, 1, 0] }

def points6 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 5853, representative 1078.
def source7 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B008.Data.entryAt ⟨41, by decide +kernel⟩

def target7 : Weights.Entry :=
  { word := [8, 9, 0, 1, 4, 10, 8], weights := [1, 2, 1, 0] }

-- Period 7, original row 5855, representative 1086.
def source8 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B008.Data.entryAt ⟨49, by decide +kernel⟩

def target8 : Weights.Entry :=
  { word := [8, 9, 0, 1, 12, 2, 8], weights := [1, 2, 1, 0] }

def points8 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 5859, representative 1081.
def source9 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B008.Data.entryAt ⟨44, by decide +kernel⟩

def target9 : Weights.Entry :=
  { word := [8, 9, 0, 1, 12, 10, 8], weights := [1, 2, 1, 0] }

-- Period 7, original row 5861, representative 1119.
def source10 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B008.Data.entryAt ⟨82, by decide +kernel⟩

def target10 : Weights.Entry :=
  { word := [8, 9, 0, 2, 2, 2, 8], weights := [1, 0, 0, 1] }

def points10 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 5863, representative 1111.
def source11 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B008.Data.entryAt ⟨74, by decide +kernel⟩

def target11 : Weights.Entry :=
  { word := [8, 9, 0, 2, 2, 10, 8], weights := [1, 0, 0, 1] }

-- Period 7, original row 5865, representative 1124.
def source12 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B008.Data.entryAt ⟨87, by decide +kernel⟩

def target12 : Weights.Entry :=
  { word := [8, 9, 0, 2, 10, 2, 8], weights := [1, 0, 0, 1] }

def points12 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 5867, representative 1116.
def source13 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B008.Data.entryAt ⟨79, by decide +kernel⟩

def target13 : Weights.Entry :=
  { word := [8, 9, 0, 2, 10, 10, 8], weights := [1, 0, 0, 1] }

-- Period 7, original row 5875, representative 1131.
def source14 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B008.Data.entryAt ⟨94, by decide +kernel⟩

def target14 : Weights.Entry :=
  { word := [8, 9, 0, 4, 2, 0, 8], weights := [1, 0, 0, 1] }

def points14 : List (ℕ × ℕ) := [(0, 1), (1, 2), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 5881, representative 1127.
def source15 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B008.Data.entryAt ⟨90, by decide +kernel⟩

def target15 : Weights.Entry :=
  { word := [8, 9, 0, 4, 2, 8, 8], weights := [1, 0, 0, 1] }

def points15 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 5887, representative 1107.
def source16 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B008.Data.entryAt ⟨70, by decide +kernel⟩

def target16 : Weights.Entry :=
  { word := [8, 9, 0, 4, 6, 0, 8], weights := [1, 0, 0, 1] }

def points16 : List (ℕ × ℕ) := [(0, 1), (1, 2), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 5889, representative 1095.
def source17 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B008.Data.entryAt ⟨58, by decide +kernel⟩

def target17 : Weights.Entry :=
  { word := [8, 9, 0, 4, 6, 8, 8], weights := [1, 0, 0, 1] }

def points17 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 5901, representative 1132.
def source18 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B008.Data.entryAt ⟨95, by decide +kernel⟩

def target18 : Weights.Entry :=
  { word := [8, 9, 0, 4, 10, 0, 8], weights := [1, 0, 0, 1] }

def points18 : List (ℕ × ℕ) := [(0, 1), (1, 2), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 5907, representative 1128.
def source19 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B008.Data.entryAt ⟨91, by decide +kernel⟩

def target19 : Weights.Entry :=
  { word := [8, 9, 0, 4, 10, 8, 8], weights := [1, 0, 0, 1] }

def points19 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 5920, representative 1126.
def source20 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B008.Data.entryAt ⟨89, by decide +kernel⟩

def target20 : Weights.Entry :=
  { word := [8, 9, 0, 10, 2, 2, 8], weights := [0, 1, 0, 1] }

def points20 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 5921, representative 1118.
def source21 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B008.Data.entryAt ⟨81, by decide +kernel⟩

def target21 : Weights.Entry :=
  { word := [8, 9, 0, 10, 2, 10, 8], weights := [1, 0, 0, 1] }

-- Period 7, original row 5922, representative 1125.
def source22 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B008.Data.entryAt ⟨88, by decide +kernel⟩

def target22 : Weights.Entry :=
  { word := [8, 9, 0, 10, 10, 2, 8], weights := [0, 1, 0, 1] }

def points22 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 5923, representative 1117.
def source23 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B008.Data.entryAt ⟨80, by decide +kernel⟩

def target23 : Weights.Entry :=
  { word := [8, 9, 0, 10, 10, 10, 8], weights := [1, 0, 0, 1] }

-- Period 7, original row 5935, representative 1134.
def source24 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B008.Data.entryAt ⟨97, by decide +kernel⟩

def target24 : Weights.Entry :=
  { word := [8, 9, 0, 12, 2, 0, 8], weights := [1, 0, 0, 1] }

def points24 : List (ℕ × ℕ) := [(0, 1), (1, 2), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 5941, representative 1130.
def source25 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B008.Data.entryAt ⟨93, by decide +kernel⟩

def target25 : Weights.Entry :=
  { word := [8, 9, 0, 12, 2, 8, 8], weights := [1, 0, 0, 1] }

def points25 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 5946, representative 1110.
def source26 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B008.Data.entryAt ⟨73, by decide +kernel⟩

def target26 : Weights.Entry :=
  { word := [8, 9, 0, 12, 6, 0, 8], weights := [1, 0, 0, 1] }

def points26 : List (ℕ × ℕ) := [(0, 1), (1, 2), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 5948, representative 1098.
def source27 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B008.Data.entryAt ⟨61, by decide +kernel⟩

def target27 : Weights.Entry :=
  { word := [8, 9, 0, 12, 6, 8, 8], weights := [1, 0, 0, 1] }

def points27 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 5960, representative 1133.
def source28 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B008.Data.entryAt ⟨96, by decide +kernel⟩

def target28 : Weights.Entry :=
  { word := [8, 9, 0, 12, 10, 0, 8], weights := [1, 0, 0, 1] }

def points28 : List (ℕ × ℕ) := [(0, 1), (1, 2), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 5966, representative 1129.
def source29 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B008.Data.entryAt ⟨92, by decide +kernel⟩

def target29 : Weights.Entry :=
  { word := [8, 9, 0, 12, 10, 8, 8], weights := [1, 0, 0, 1] }

def points29 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 5972, representative 1099.
def source30 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B008.Data.entryAt ⟨62, by decide +kernel⟩

def target30 : Weights.Entry :=
  { word := [8, 9, 4, 4, 4, 0, 8], weights := [1, 0, 0, 1] }

def points30 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 5974, representative 1087.
def source31 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B008.Data.entryAt ⟨50, by decide +kernel⟩

def target31 : Weights.Entry :=
  { word := [8, 9, 4, 4, 4, 8, 8], weights := [1, 0, 0, 1] }

def points31 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 5976, representative 1104.
def source32 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B008.Data.entryAt ⟨67, by decide +kernel⟩

def target32 : Weights.Entry :=
  { word := [8, 9, 4, 4, 12, 0, 8], weights := [1, 0, 0, 1] }

def points32 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 5978, representative 1092.
def source33 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B008.Data.entryAt ⟨55, by decide +kernel⟩

def target33 : Weights.Entry :=
  { word := [8, 9, 4, 4, 12, 8, 8], weights := [1, 0, 0, 1] }

def points33 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 5979, representative 1106.
def source34 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B008.Data.entryAt ⟨69, by decide +kernel⟩

def target34 : Weights.Entry :=
  { word := [8, 9, 4, 12, 4, 0, 8], weights := [1, 0, 0, 1] }

def points34 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 5981, representative 1094.
def source35 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B008.Data.entryAt ⟨57, by decide +kernel⟩

def target35 : Weights.Entry :=
  { word := [8, 9, 4, 12, 4, 8, 8], weights := [0, 1, 1, 0] }

def points35 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 5982, representative 1105.
def source36 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B008.Data.entryAt ⟨68, by decide +kernel⟩

def target36 : Weights.Entry :=
  { word := [8, 9, 4, 12, 12, 0, 8], weights := [0, 1, 1, 0] }

def points36 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 5984, representative 1093.
def source37 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B008.Data.entryAt ⟨56, by decide +kernel⟩

def target37 : Weights.Entry :=
  { word := [8, 9, 4, 12, 12, 8, 8], weights := [0, 1, 1, 0] }

def points37 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 5986, representative 1084.
def source38 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B008.Data.entryAt ⟨47, by decide +kernel⟩

def target38 : Weights.Entry :=
  { word := [8, 9, 8, 1, 4, 2, 8], weights := [1, 2, 1, 0] }

def points38 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 5990, representative 1079.
def source39 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B008.Data.entryAt ⟨42, by decide +kernel⟩

def target39 : Weights.Entry :=
  { word := [8, 9, 8, 1, 4, 10, 8], weights := [1, 2, 1, 0] }

-- Period 7, original row 5992, representative 1085.
def source40 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B008.Data.entryAt ⟨48, by decide +kernel⟩

def target40 : Weights.Entry :=
  { word := [8, 9, 8, 1, 12, 2, 8], weights := [1, 2, 1, 0] }

def points40 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 5996, representative 1080.
def source41 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B008.Data.entryAt ⟨43, by decide +kernel⟩

def target41 : Weights.Entry :=
  { word := [8, 9, 8, 1, 12, 10, 8], weights := [1, 2, 1, 0] }

-- Period 7, original row 5998, representative 1120.
def source42 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B008.Data.entryAt ⟨83, by decide +kernel⟩

def target42 : Weights.Entry :=
  { word := [8, 9, 8, 2, 2, 2, 8], weights := [0, 1, 0, 1] }

def points42 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 6000, representative 1112.
def source43 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B008.Data.entryAt ⟨75, by decide +kernel⟩

def target43 : Weights.Entry :=
  { word := [8, 9, 8, 2, 2, 10, 8], weights := [1, 0, 0, 1] }

-- Period 7, original row 6002, representative 1121.
def source44 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B008.Data.entryAt ⟨84, by decide +kernel⟩

def target44 : Weights.Entry :=
  { word := [8, 9, 8, 2, 10, 2, 8], weights := [0, 1, 0, 1] }

def points44 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 6004, representative 1113.
def source45 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B008.Data.entryAt ⟨76, by decide +kernel⟩

def target45 : Weights.Entry :=
  { word := [8, 9, 8, 2, 10, 10, 8], weights := [1, 0, 0, 1] }

-- Period 7, original row 6010, representative 1108.
def source46 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B008.Data.entryAt ⟨71, by decide +kernel⟩

def target46 : Weights.Entry :=
  { word := [8, 9, 8, 4, 6, 0, 8], weights := [1, 0, 0, 1] }

def points46 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 6012, representative 1096.
def source47 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B008.Data.entryAt ⟨59, by decide +kernel⟩

def target47 : Weights.Entry :=
  { word := [8, 9, 8, 4, 6, 8, 8], weights := [1, 0, 0, 1] }

def points47 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 6019, representative 1082.
def source48 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B008.Data.entryAt ⟨45, by decide +kernel⟩

def target48 : Weights.Entry :=
  { word := [8, 9, 8, 8, 6, 2, 8], weights := [0, 1, 1, 0] }

def points48 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 6021, representative 1077.
def source49 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B008.Data.entryAt ⟨40, by decide +kernel⟩

def target49 : Weights.Entry :=
  { word := [8, 9, 8, 8, 6, 10, 8], weights := [0, 1, 1, 0] }

-- Period 7, original row 6031, representative 1123.
def source50 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B008.Data.entryAt ⟨86, by decide +kernel⟩

def target50 : Weights.Entry :=
  { word := [8, 9, 8, 10, 2, 2, 8], weights := [0, 1, 0, 1] }

def points50 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 6032, representative 1115.
def source51 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B008.Data.entryAt ⟨78, by decide +kernel⟩

def target51 : Weights.Entry :=
  { word := [8, 9, 8, 10, 2, 10, 8], weights := [0, 1, 1, 0] }

-- Period 7, original row 6033, representative 1122.
def source52 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B008.Data.entryAt ⟨85, by decide +kernel⟩

def target52 : Weights.Entry :=
  { word := [8, 9, 8, 10, 10, 2, 8], weights := [0, 1, 0, 1] }

def points52 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 6034, representative 1114.
def source53 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B008.Data.entryAt ⟨77, by decide +kernel⟩

def target53 : Weights.Entry :=
  { word := [8, 9, 8, 10, 10, 10, 8], weights := [0, 1, 1, 0] }

-- Period 7, original row 6039, representative 1109.
def source54 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B008.Data.entryAt ⟨72, by decide +kernel⟩

def target54 : Weights.Entry :=
  { word := [8, 9, 8, 12, 6, 0, 8], weights := [0, 1, 1, 0] }

def points54 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 6041, representative 1097.
def source55 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B008.Data.entryAt ⟨60, by decide +kernel⟩

def target55 : Weights.Entry :=
  { word := [8, 9, 8, 12, 6, 8, 8], weights := [0, 1, 1, 0] }

def points55 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 6047, representative 1100.
def source56 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B008.Data.entryAt ⟨63, by decide +kernel⟩

def target56 : Weights.Entry :=
  { word := [8, 9, 12, 4, 4, 0, 8], weights := [1, 0, 0, 1] }

def points56 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 6049, representative 1088.
def source57 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B008.Data.entryAt ⟨51, by decide +kernel⟩

def target57 : Weights.Entry :=
  { word := [8, 9, 12, 4, 4, 8, 8], weights := [1, 0, 0, 1] }

def points57 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 6051, representative 1101.
def source58 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B008.Data.entryAt ⟨64, by decide +kernel⟩

def target58 : Weights.Entry :=
  { word := [8, 9, 12, 4, 12, 0, 8], weights := [1, 0, 0, 1] }

def points58 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 6053, representative 1089.
def source59 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B008.Data.entryAt ⟨52, by decide +kernel⟩

def target59 : Weights.Entry :=
  { word := [8, 9, 12, 4, 12, 8, 8], weights := [1, 0, 0, 1] }

def points59 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 6054, representative 1103.
def source60 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B008.Data.entryAt ⟨66, by decide +kernel⟩

def target60 : Weights.Entry :=
  { word := [8, 9, 12, 12, 4, 0, 8], weights := [1, 0, 0, 1] }

def points60 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 6056, representative 1091.
def source61 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B008.Data.entryAt ⟨54, by decide +kernel⟩

def target61 : Weights.Entry :=
  { word := [8, 9, 12, 12, 4, 8, 8], weights := [0, 1, 1, 0] }

def points61 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 6057, representative 1102.
def source62 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B008.Data.entryAt ⟨65, by decide +kernel⟩

def target62 : Weights.Entry :=
  { word := [8, 9, 12, 12, 12, 0, 8], weights := [0, 1, 1, 0] }

def points62 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 6059, representative 1090.
def source63 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B008.Data.entryAt ⟨53, by decide +kernel⟩

def target63 : Weights.Entry :=
  { word := [8, 9, 12, 12, 12, 8, 8], weights := [0, 1, 1, 0] }

def points63 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 6406, representative 1078.
def source64 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B008.Data.entryAt ⟨41, by decide +kernel⟩

def target64 : Weights.Entry :=
  { word := [8, 12, 2, 0, 1, 8, 9], weights := [0, 1, 2, 1] }

def points64 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 6409, representative 1079.
def source65 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B008.Data.entryAt ⟨42, by decide +kernel⟩

def target65 : Weights.Entry :=
  { word := [8, 12, 2, 0, 9, 8, 9], weights := [0, 1, 2, 1] }

def points65 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 6417, representative 1154.
def source66 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B008.Data.entryAt ⟨117, by decide +kernel⟩

def target66 : Weights.Entry :=
  { word := [8, 12, 2, 8, 2, 8, 10], weights := [0, 1, 1, 0] }

-- Period 7, original row 6425, representative 1152.
def source67 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B008.Data.entryAt ⟨115, by decide +kernel⟩

def target67 : Weights.Entry :=
  { word := [8, 12, 2, 8, 10, 8, 10], weights := [0, 1, 1, 0] }

-- Period 7, original row 6437, representative 1111.
def source68 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B008.Data.entryAt ⟨74, by decide +kernel⟩

def target68 : Weights.Entry :=
  { word := [8, 12, 4, 4, 0, 8, 9], weights := [1, 0, 0, 1] }

def points68 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 6451, representative 1112.
def source69 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B008.Data.entryAt ⟨75, by decide +kernel⟩

def target69 : Weights.Entry :=
  { word := [8, 12, 4, 4, 8, 8, 9], weights := [1, 0, 0, 1] }

def points69 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 6465, representative 1118.
def source70 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B008.Data.entryAt ⟨81, by decide +kernel⟩

def target70 : Weights.Entry :=
  { word := [8, 12, 4, 12, 0, 8, 9], weights := [1, 0, 0, 1] }

def points70 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 6479, representative 1115.
def source71 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B008.Data.entryAt ⟨78, by decide +kernel⟩

def target71 : Weights.Entry :=
  { word := [8, 12, 4, 12, 8, 8, 9], weights := [0, 1, 1, 0] }

def points71 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 6485, representative 1077.
def source72 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B008.Data.entryAt ⟨40, by decide +kernel⟩

def target72 : Weights.Entry :=
  { word := [8, 12, 6, 8, 8, 8, 9], weights := [0, 1, 1, 0] }

def points72 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 6486, representative 1155.
def source73 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B008.Data.entryAt ⟨118, by decide +kernel⟩

def target73 : Weights.Entry :=
  { word := [8, 12, 6, 8, 8, 8, 10], weights := [0, 1, 1, 0] }

-- Period 7, original row 6573, representative 1081.
def source74 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B008.Data.entryAt ⟨44, by decide +kernel⟩

def target74 : Weights.Entry :=
  { word := [8, 12, 10, 0, 1, 8, 9], weights := [0, 1, 2, 1] }

def points74 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 6576, representative 1080.
def source75 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B008.Data.entryAt ⟨43, by decide +kernel⟩

def target75 : Weights.Entry :=
  { word := [8, 12, 10, 0, 9, 8, 9], weights := [0, 1, 2, 1] }

def points75 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 6579, representative 1153.
def source76 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B008.Data.entryAt ⟨116, by decide +kernel⟩

def target76 : Weights.Entry :=
  { word := [8, 12, 10, 8, 2, 8, 10], weights := [0, 1, 1, 0] }

-- Period 7, original row 6582, representative 1151.
def source77 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B008.Data.entryAt ⟨114, by decide +kernel⟩

def target77 : Weights.Entry :=
  { word := [8, 12, 10, 8, 10, 8, 10], weights := [0, 1, 1, 0] }

-- Period 7, original row 6587, representative 1116.
def source78 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B008.Data.entryAt ⟨79, by decide +kernel⟩

def target78 : Weights.Entry :=
  { word := [8, 12, 12, 4, 0, 8, 9], weights := [1, 0, 0, 1] }

def points78 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 6601, representative 1113.
def source79 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B008.Data.entryAt ⟨76, by decide +kernel⟩

def target79 : Weights.Entry :=
  { word := [8, 12, 12, 4, 8, 8, 9], weights := [1, 0, 0, 1] }

def points79 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 6608, representative 1117.
def source80 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B008.Data.entryAt ⟨80, by decide +kernel⟩

def target80 : Weights.Entry :=
  { word := [8, 12, 12, 12, 0, 8, 9], weights := [1, 0, 0, 1] }

def points80 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 6622, representative 1114.
def source81 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B008.Data.entryAt ⟨77, by decide +kernel⟩

def target81 : Weights.Entry :=
  { word := [8, 12, 12, 12, 8, 8, 9], weights := [0, 1, 1, 0] }

def points81 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 6709, representative 1099.
def source82 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B008.Data.entryAt ⟨62, by decide +kernel⟩

def target82 : Weights.Entry :=
  { word := [9, 0, 2, 2, 2, 8, 9], weights := [1, 0, 0, 1] }

def points82 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 6724, representative 1100.
def source83 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B008.Data.entryAt ⟨63, by decide +kernel⟩

def target83 : Weights.Entry :=
  { word := [9, 0, 2, 2, 10, 8, 9], weights := [1, 0, 0, 1] }

def points83 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 6738, representative 1106.
def source84 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B008.Data.entryAt ⟨69, by decide +kernel⟩

def target84 : Weights.Entry :=
  { word := [9, 0, 2, 10, 2, 8, 9], weights := [1, 0, 0, 1] }

def points84 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 6752, representative 1103.
def source85 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B008.Data.entryAt ⟨66, by decide +kernel⟩

def target85 : Weights.Entry :=
  { word := [9, 0, 2, 10, 10, 8, 9], weights := [1, 0, 0, 1] }

def points85 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 6764, representative 1131.
def source86 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B008.Data.entryAt ⟨94, by decide +kernel⟩

def target86 : Weights.Entry :=
  { word := [9, 0, 4, 2, 0, 8, 9], weights := [1, 0, 0, 1] }

def points86 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 6796, representative 1134.
def source87 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B008.Data.entryAt ⟨97, by decide +kernel⟩

def target87 : Weights.Entry :=
  { word := [9, 0, 4, 10, 0, 8, 9], weights := [1, 0, 0, 1] }

def points87 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 6873, representative 1104.
def source88 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B008.Data.entryAt ⟨67, by decide +kernel⟩

def target88 : Weights.Entry :=
  { word := [9, 0, 10, 2, 2, 8, 9], weights := [1, 0, 0, 1] }

def points88 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 6881, representative 1101.
def source89 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B008.Data.entryAt ⟨64, by decide +kernel⟩

def target89 : Weights.Entry :=
  { word := [9, 0, 10, 2, 10, 8, 9], weights := [1, 0, 0, 1] }

def points89 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 6888, representative 1105.
def source90 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B008.Data.entryAt ⟨68, by decide +kernel⟩

def target90 : Weights.Entry :=
  { word := [9, 0, 10, 10, 2, 8, 9], weights := [0, 1, 1, 0] }

def points90 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 6895, representative 1102.
def source91 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B008.Data.entryAt ⟨65, by decide +kernel⟩

def target91 : Weights.Entry :=
  { word := [9, 0, 10, 10, 10, 8, 9], weights := [0, 1, 1, 0] }

def points91 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 6907, representative 1132.
def source92 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B008.Data.entryAt ⟨95, by decide +kernel⟩

def target92 : Weights.Entry :=
  { word := [9, 0, 12, 2, 0, 8, 9], weights := [1, 0, 0, 1] }

def points92 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 6942, representative 1133.
def source93 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B008.Data.entryAt ⟨96, by decide +kernel⟩

def target93 : Weights.Entry :=
  { word := [9, 0, 12, 10, 0, 8, 9], weights := [1, 0, 0, 1] }

def points93 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 6974, representative 1119.
def source94 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B008.Data.entryAt ⟨82, by decide +kernel⟩

def target94 : Weights.Entry :=
  { word := [9, 4, 4, 4, 0, 8, 9], weights := [1, 0, 0, 1] }

def points94 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 6988, representative 1120.
def source95 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B008.Data.entryAt ⟨83, by decide +kernel⟩

def target95 : Weights.Entry :=
  { word := [9, 4, 4, 4, 8, 8, 9], weights := [1, 0, 1, 0] }

def points95 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 7002, representative 1126.
def source96 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B008.Data.entryAt ⟨89, by decide +kernel⟩

def target96 : Weights.Entry :=
  { word := [9, 4, 4, 12, 0, 8, 9], weights := [1, 0, 1, 0] }

def points96 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 7016, representative 1123.
def source97 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B008.Data.entryAt ⟨86, by decide +kernel⟩

def target97 : Weights.Entry :=
  { word := [9, 4, 4, 12, 8, 8, 9], weights := [1, 0, 1, 0] }

def points97 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 7023, representative 1124.
def source98 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B008.Data.entryAt ⟨87, by decide +kernel⟩

def target98 : Weights.Entry :=
  { word := [9, 4, 12, 4, 0, 8, 9], weights := [1, 0, 0, 1] }

def points98 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 7037, representative 1121.
def source99 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B008.Data.entryAt ⟨84, by decide +kernel⟩

def target99 : Weights.Entry :=
  { word := [9, 4, 12, 4, 8, 8, 9], weights := [1, 0, 1, 0] }

def points99 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 7044, representative 1125.
def source100 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B008.Data.entryAt ⟨88, by decide +kernel⟩

def target100 : Weights.Entry :=
  { word := [9, 4, 12, 12, 0, 8, 9], weights := [1, 0, 1, 0] }

def points100 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 7058, representative 1122.
def source101 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B008.Data.entryAt ⟨85, by decide +kernel⟩

def target101 : Weights.Entry :=
  { word := [9, 4, 12, 12, 8, 8, 9], weights := [1, 0, 1, 0] }

def points101 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 7145, representative 1087.
def source102 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B008.Data.entryAt ⟨50, by decide +kernel⟩

def target102 : Weights.Entry :=
  { word := [9, 8, 2, 2, 2, 8, 9], weights := [1, 0, 0, 1] }

def points102 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 7146, representative 1161.
def source103 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B008.Data.entryAt ⟨124, by decide +kernel⟩

def target103 : Weights.Entry :=
  { word := [9, 8, 2, 2, 2, 8, 10], weights := [1, 0, 0, 1] }

def points103 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 7147, representative 1143.
def source104 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B008.Data.entryAt ⟨106, by decide +kernel⟩

def target104 : Weights.Entry :=
  { word := [9, 8, 2, 2, 2, 8, 12], weights := [1, 0, 0, 1] }

def points104 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 7160, representative 1088.
def source105 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B008.Data.entryAt ⟨51, by decide +kernel⟩

def target105 : Weights.Entry :=
  { word := [9, 8, 2, 2, 10, 8, 9], weights := [1, 0, 0, 1] }

def points105 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 7161, representative 1162.
def source106 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B008.Data.entryAt ⟨125, by decide +kernel⟩

def target106 : Weights.Entry :=
  { word := [9, 8, 2, 2, 10, 8, 10], weights := [1, 0, 0, 1] }

def points106 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 7162, representative 1144.
def source107 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B008.Data.entryAt ⟨107, by decide +kernel⟩

def target107 : Weights.Entry :=
  { word := [9, 8, 2, 2, 10, 8, 12], weights := [1, 0, 0, 1] }

def points107 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 7174, representative 1094.
def source108 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B008.Data.entryAt ⟨57, by decide +kernel⟩

def target108 : Weights.Entry :=
  { word := [9, 8, 2, 10, 2, 8, 9], weights := [0, 1, 1, 0] }

def points108 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 7176, representative 1150.
def source109 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B008.Data.entryAt ⟨113, by decide +kernel⟩

def target109 : Weights.Entry :=
  { word := [9, 8, 2, 10, 2, 8, 12], weights := [1, 0, 0, 1] }

def points109 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 7188, representative 1091.
def source110 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B008.Data.entryAt ⟨54, by decide +kernel⟩

def target110 : Weights.Entry :=
  { word := [9, 8, 2, 10, 10, 8, 9], weights := [0, 1, 1, 0] }

def points110 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 7190, representative 1147.
def source111 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B008.Data.entryAt ⟨110, by decide +kernel⟩

def target111 : Weights.Entry :=
  { word := [9, 8, 2, 10, 10, 8, 12], weights := [1, 0, 0, 1] }

def points111 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 7257, representative 1092.
def source112 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B008.Data.entryAt ⟨55, by decide +kernel⟩

def target112 : Weights.Entry :=
  { word := [9, 8, 10, 2, 2, 8, 9], weights := [1, 0, 0, 1] }

def points112 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 7259, representative 1148.
def source113 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B008.Data.entryAt ⟨111, by decide +kernel⟩

def target113 : Weights.Entry :=
  { word := [9, 8, 10, 2, 2, 8, 12], weights := [1, 0, 0, 1] }

def points113 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 7265, representative 1089.
def source114 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B008.Data.entryAt ⟨52, by decide +kernel⟩

def target114 : Weights.Entry :=
  { word := [9, 8, 10, 2, 10, 8, 9], weights := [1, 0, 0, 1] }

def points114 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 7266, representative 1163.
def source115 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B008.Data.entryAt ⟨126, by decide +kernel⟩

def target115 : Weights.Entry :=
  { word := [9, 8, 10, 2, 10, 8, 10], weights := [1, 0, 0, 1] }

def points115 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 7267, representative 1145.
def source116 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B008.Data.entryAt ⟨108, by decide +kernel⟩

def target116 : Weights.Entry :=
  { word := [9, 8, 10, 2, 10, 8, 12], weights := [1, 0, 0, 1] }

def points116 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 7272, representative 1093.
def source117 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B008.Data.entryAt ⟨56, by decide +kernel⟩

def target117 : Weights.Entry :=
  { word := [9, 8, 10, 10, 2, 8, 9], weights := [0, 1, 1, 0] }

def points117 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 7274, representative 1149.
def source118 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B008.Data.entryAt ⟨112, by decide +kernel⟩

def target118 : Weights.Entry :=
  { word := [9, 8, 10, 10, 2, 8, 12], weights := [1, 0, 0, 1] }

def points118 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 7279, representative 1090.
def source119 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B008.Data.entryAt ⟨53, by decide +kernel⟩

def target119 : Weights.Entry :=
  { word := [9, 8, 10, 10, 10, 8, 9], weights := [0, 1, 1, 0] }

def points119 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 7280, representative 1164.
def source120 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B008.Data.entryAt ⟨127, by decide +kernel⟩

def target120 : Weights.Entry :=
  { word := [9, 8, 10, 10, 10, 8, 10], weights := [0, 1, 1, 0] }

def points120 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 7281, representative 1146.
def source121 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B008.Data.entryAt ⟨109, by decide +kernel⟩

def target121 : Weights.Entry :=
  { word := [9, 8, 10, 10, 10, 8, 12], weights := [1, 0, 0, 1] }

def points121 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 7310, representative 1111.
def source122 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B008.Data.entryAt ⟨74, by decide +kernel⟩

def target122 : Weights.Entry :=
  { word := [9, 12, 4, 4, 0, 8, 9], weights := [1, 0, 0, 1] }

def points122 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 7324, representative 1112.
def source123 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B008.Data.entryAt ⟨75, by decide +kernel⟩

def target123 : Weights.Entry :=
  { word := [9, 12, 4, 4, 8, 8, 9], weights := [1, 0, 0, 1] }

def points123 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 7338, representative 1118.
def source124 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B008.Data.entryAt ⟨81, by decide +kernel⟩

def target124 : Weights.Entry :=
  { word := [9, 12, 4, 12, 0, 8, 9], weights := [1, 0, 0, 1] }

def points124 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 7352, representative 1115.
def source125 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B008.Data.entryAt ⟨78, by decide +kernel⟩

def target125 : Weights.Entry :=
  { word := [9, 12, 4, 12, 8, 8, 9], weights := [0, 1, 1, 0] }

def points125 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 7359, representative 1116.
def source126 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B008.Data.entryAt ⟨79, by decide +kernel⟩

def target126 : Weights.Entry :=
  { word := [9, 12, 12, 4, 0, 8, 9], weights := [1, 0, 0, 1] }

def points126 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 7373, representative 1113.
def source127 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B008.Data.entryAt ⟨76, by decide +kernel⟩

def target127 : Weights.Entry :=
  { word := [9, 12, 12, 4, 8, 8, 9], weights := [1, 0, 0, 1] }

def points127 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

def period7Entries : List Weights.Entry := [target0, target1, target2, target3, target4, target5, target6, target7, target8, target9, target10, target11, target12, target13, target14, target15, target16, target17, target18, target19, target20, target21, target22, target23, target24, target25, target26, target27, target28, target29, target30, target31, target32, target33, target34, target35, target36, target37, target38, target39, target40, target41, target42, target43, target44, target45, target46, target47, target48, target49, target50, target51, target52, target53, target54, target55, target56, target57, target58, target59, target60, target61, target62, target63, target64, target65, target66, target67, target68, target69, target70, target71, target72, target73, target74, target75, target76, target77, target78, target79, target80, target81, target82, target83, target84, target85, target86, target87, target88, target89, target90, target91, target92, target93, target94, target95, target96, target97, target98, target99, target100, target101, target102, target103, target104, target105, target106, target107, target108, target109, target110, target111, target112, target113, target114, target115, target116, target117, target118, target119, target120, target121, target122, target123, target124, target125, target126, target127]

def period7Chunk : RowCoverage.Chunk where
  rows := [⟨5774, target0⟩, ⟨5779, target1⟩, ⟨5780, target2⟩, ⟨5781, target3⟩, ⟨5791, target4⟩, ⟨5829, target5⟩, ⟨5849, target6⟩, ⟨5853, target7⟩, ⟨5855, target8⟩, ⟨5859, target9⟩, ⟨5861, target10⟩, ⟨5863, target11⟩, ⟨5865, target12⟩, ⟨5867, target13⟩, ⟨5875, target14⟩, ⟨5881, target15⟩, ⟨5887, target16⟩, ⟨5889, target17⟩, ⟨5901, target18⟩, ⟨5907, target19⟩, ⟨5920, target20⟩, ⟨5921, target21⟩, ⟨5922, target22⟩, ⟨5923, target23⟩, ⟨5935, target24⟩, ⟨5941, target25⟩, ⟨5946, target26⟩, ⟨5948, target27⟩, ⟨5960, target28⟩, ⟨5966, target29⟩, ⟨5972, target30⟩, ⟨5974, target31⟩, ⟨5976, target32⟩, ⟨5978, target33⟩, ⟨5979, target34⟩, ⟨5981, target35⟩, ⟨5982, target36⟩, ⟨5984, target37⟩, ⟨5986, target38⟩, ⟨5990, target39⟩, ⟨5992, target40⟩, ⟨5996, target41⟩, ⟨5998, target42⟩, ⟨6000, target43⟩, ⟨6002, target44⟩, ⟨6004, target45⟩, ⟨6010, target46⟩, ⟨6012, target47⟩, ⟨6019, target48⟩, ⟨6021, target49⟩, ⟨6031, target50⟩, ⟨6032, target51⟩, ⟨6033, target52⟩, ⟨6034, target53⟩, ⟨6039, target54⟩, ⟨6041, target55⟩, ⟨6047, target56⟩, ⟨6049, target57⟩, ⟨6051, target58⟩, ⟨6053, target59⟩, ⟨6054, target60⟩, ⟨6056, target61⟩, ⟨6057, target62⟩, ⟨6059, target63⟩, ⟨6406, target64⟩, ⟨6409, target65⟩, ⟨6417, target66⟩, ⟨6425, target67⟩, ⟨6437, target68⟩, ⟨6451, target69⟩, ⟨6465, target70⟩, ⟨6479, target71⟩, ⟨6485, target72⟩, ⟨6486, target73⟩, ⟨6573, target74⟩, ⟨6576, target75⟩, ⟨6579, target76⟩, ⟨6582, target77⟩, ⟨6587, target78⟩, ⟨6601, target79⟩, ⟨6608, target80⟩, ⟨6622, target81⟩, ⟨6709, target82⟩, ⟨6724, target83⟩, ⟨6738, target84⟩, ⟨6752, target85⟩, ⟨6764, target86⟩, ⟨6796, target87⟩, ⟨6873, target88⟩, ⟨6881, target89⟩, ⟨6888, target90⟩, ⟨6895, target91⟩, ⟨6907, target92⟩, ⟨6942, target93⟩, ⟨6974, target94⟩, ⟨6988, target95⟩, ⟨7002, target96⟩, ⟨7016, target97⟩, ⟨7023, target98⟩, ⟨7037, target99⟩, ⟨7044, target100⟩, ⟨7058, target101⟩, ⟨7145, target102⟩, ⟨7146, target103⟩, ⟨7147, target104⟩, ⟨7160, target105⟩, ⟨7161, target106⟩, ⟨7162, target107⟩, ⟨7174, target108⟩, ⟨7176, target109⟩, ⟨7188, target110⟩, ⟨7190, target111⟩, ⟨7257, target112⟩, ⟨7259, target113⟩, ⟨7265, target114⟩, ⟨7266, target115⟩, ⟨7267, target116⟩, ⟨7272, target117⟩, ⟨7274, target118⟩, ⟨7279, target119⟩, ⟨7280, target120⟩, ⟨7281, target121⟩, ⟨7310, target122⟩, ⟨7324, target123⟩, ⟨7338, target124⟩, ⟨7352, target125⟩, ⟨7359, target126⟩, ⟨7373, target127⟩]
  indexMask := 312021660727471213822742205878163075957682578925760099470150213090852344116057852071973825232296145239077041015379397152245488318073228133282337474773236956677211138153348600613209442831908630586161490687581560838430116433043930849583645025473807642797475739909790065103629450157919133809788706200903612671302176108049361727793172856764853147289433336401507140902582066135846860068952236612953092634200266823061887030871241551681953385562582307557998198361265632960812222144565738999998606547596588512424092349237138281145606072360107289452348709357207974341189988253272622892013169902928273109252045951591674733050691630875419960604941941686609900635949502462098046916732766652926572346851908988637666584285336306772018601210146999434028548487485162926299041215522492220390896477240416353924671072478358369501956241337802666577941384200560500857461735555208480975954646860214772512757980031538434900064591775330791304309815479153329676467634150775800544639005401854944918107318683417939068229618679430815933477564806484959364979296731183692207918774565028421767060195625814356774693093682245773623541750837054351545415136249726556804767153859441933941837317986732192625646208240333059487337107367738596364708035327459772646141044788341229737426916108936054467008811230218365969967348196441171108612445691457517800218386456420530895395904462848260193836209904480956659824118894768039695846560360427978321810187180295954037792759594969247921333475619029309397519891037781118904059026093974484259974792356145595014340053467854987094939228116945080589988062749342068169229799747526465752467335122676749491151805343835376481217962208642285994199742885751142446395909337203411390529392639906018678845764156982026436059971963730632756931497842972398108338094911394790721922421462781027681197608407432307888696868878019388841241440309340512713291130992251860417645378713220296967815785867123478348795248969271288536273843783491399706285515807540812942823331422300635232206272987694251151635356528936687562108653676560210550758251346665645623040626941028350224213689969166856831777859716539477982761322515050966923205279447213156347772237026442966938457438940541349410974204831665983777003713206492746444118604090298483995574272
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

end FranklSmallCyclic.TransportBatches.G008.B001.Data
