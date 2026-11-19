module

public import Conjectures.FranklSmallCyclicRowCoverage
public import Conjectures.FranklSmallCyclicCanonicalWords
public import Conjectures.FranklSmallCyclicOrbit7Block001Data

/-! 128 literal targets sharing one source proof block.
Original words and row indices are retained; weights may be transported.
-/
@[expose] public section

namespace FranklSmallCyclic.TransportBatches.G001.B000.Data

-- Period 7, original row 129, representative 216.
def source0 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B001.Data.entryAt ⟨77, by decide +kernel⟩

def target0 : Weights.Entry :=
  { word := [0, 1, 0, 9, 4, 12, 12], weights := [1, 0, 1, 1] }

-- Period 7, original row 133, representative 214.
def source1 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B001.Data.entryAt ⟨75, by decide +kernel⟩

def target1 : Weights.Entry :=
  { word := [0, 1, 0, 9, 12, 12, 12], weights := [1, 0, 1, 1] }

-- Period 7, original row 190, representative 222.
def source2 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B001.Data.entryAt ⟨83, by decide +kernel⟩

def target2 : Weights.Entry :=
  { word := [0, 1, 4, 10, 0, 12, 12], weights := [1, 0, 1, 1] }

-- Period 7, original row 198, representative 220.
def source3 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B001.Data.entryAt ⟨81, by decide +kernel⟩

def target3 : Weights.Entry :=
  { word := [0, 1, 4, 10, 8, 12, 12], weights := [1, 0, 1, 1] }

-- Period 7, original row 220, representative 215.
def source4 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B001.Data.entryAt ⟨76, by decide +kernel⟩

def target4 : Weights.Entry :=
  { word := [0, 1, 8, 9, 4, 12, 12], weights := [1, 0, 1, 1] }

-- Period 7, original row 283, representative 221.
def source5 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B001.Data.entryAt ⟨82, by decide +kernel⟩

def target5 : Weights.Entry :=
  { word := [0, 1, 12, 10, 0, 12, 12], weights := [1, 0, 1, 1] }

-- Period 7, original row 291, representative 219.
def source6 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B001.Data.entryAt ⟨80, by decide +kernel⟩

def target6 : Weights.Entry :=
  { word := [0, 1, 12, 10, 8, 12, 12], weights := [1, 0, 1, 1] }

-- Period 7, original row 309, representative 208.
def source7 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B001.Data.entryAt ⟨70, by decide +kernel⟩

def target7 : Weights.Entry :=
  { word := [0, 2, 0, 8, 8, 12, 12], weights := [0, 1, 0, 1] }

-- Period 7, original row 313, representative 175.
def source8 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B001.Data.entryAt ⟨39, by decide +kernel⟩

def target8 : Weights.Entry :=
  { word := [0, 2, 0, 8, 9, 12, 12], weights := [0, 1, 1, 0] }

-- Period 7, original row 365, representative 204.
def source9 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B001.Data.entryAt ⟨66, by decide +kernel⟩

def target9 : Weights.Entry :=
  { word := [0, 2, 2, 2, 8, 12, 12], weights := [0, 1, 0, 1] }

-- Period 7, original row 382, representative 222.
def source10 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B001.Data.entryAt ⟨83, by decide +kernel⟩

def target10 : Weights.Entry :=
  { word := [0, 2, 2, 10, 0, 12, 12], weights := [0, 1, 1, 1] }

def points10 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6)]

-- Period 7, original row 410, representative 207.
def source11 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B001.Data.entryAt ⟨69, by decide +kernel⟩

def target11 : Weights.Entry :=
  { word := [0, 2, 2, 10, 8, 12, 12], weights := [0, 1, 0, 1] }

-- Period 7, original row 463, representative 205.
def source12 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B001.Data.entryAt ⟨67, by decide +kernel⟩

def target12 : Weights.Entry :=
  { word := [0, 2, 10, 2, 8, 12, 12], weights := [0, 1, 0, 1] }

-- Period 7, original row 484, representative 221.
def source13 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B001.Data.entryAt ⟨82, by decide +kernel⟩

def target13 : Weights.Entry :=
  { word := [0, 2, 10, 10, 0, 12, 12], weights := [0, 1, 1, 1] }

def points13 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6)]

-- Period 7, original row 505, representative 206.
def source14 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B001.Data.entryAt ⟨68, by decide +kernel⟩

def target14 : Weights.Entry :=
  { word := [0, 2, 10, 10, 8, 12, 12], weights := [0, 1, 0, 1] }

-- Period 7, original row 745, representative 197.
def source15 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B001.Data.entryAt ⟨59, by decide +kernel⟩

def target15 : Weights.Entry :=
  { word := [0, 6, 0, 12, 8, 12, 12], weights := [0, 1, 0, 1] }

-- Period 7, original row 777, representative 196.
def source16 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B001.Data.entryAt ⟨58, by decide +kernel⟩

def target16 : Weights.Entry :=
  { word := [0, 6, 8, 12, 8, 12, 12], weights := [0, 1, 0, 1] }

-- Period 7, original row 1149, representative 178.
def source17 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B001.Data.entryAt ⟨42, by decide +kernel⟩

def target17 : Weights.Entry :=
  { word := [0, 9, 0, 4, 0, 12, 12], weights := [1, 0, 1, 2] }

-- Period 7, original row 1175, representative 179.
def source18 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B001.Data.entryAt ⟨43, by decide +kernel⟩

def target18 : Weights.Entry :=
  { word := [0, 9, 0, 4, 8, 12, 12], weights := [1, 0, 0, 1] }

-- Period 7, original row 1193, representative 212.
def source19 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B001.Data.entryAt ⟨74, by decide +kernel⟩

def target19 : Weights.Entry :=
  { word := [0, 9, 0, 9, 4, 12, 12], weights := [1, 1, 1, 1] }

-- Period 7, original row 1197, representative 210.
def source20 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B001.Data.entryAt ⟨72, by decide +kernel⟩

def target20 : Weights.Entry :=
  { word := [0, 9, 0, 9, 12, 12, 12], weights := [1, 1, 1, 1] }

-- Period 7, original row 1209, representative 181.
def source21 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B001.Data.entryAt ⟨45, by decide +kernel⟩

def target21 : Weights.Entry :=
  { word := [0, 9, 0, 12, 0, 12, 12], weights := [1, 0, 1, 0] }

-- Period 7, original row 1234, representative 180.
def source22 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B001.Data.entryAt ⟨44, by decide +kernel⟩

def target22 : Weights.Entry :=
  { word := [0, 9, 0, 12, 8, 12, 12], weights := [1, 0, 1, 0] }

-- Period 7, original row 1304, representative 211.
def source23 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B001.Data.entryAt ⟨73, by decide +kernel⟩

def target23 : Weights.Entry :=
  { word := [0, 9, 8, 9, 4, 12, 12], weights := [1, 1, 1, 1] }

-- Period 7, original row 1308, representative 209.
def source24 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B001.Data.entryAt ⟨71, by decide +kernel⟩

def target24 : Weights.Entry :=
  { word := [0, 9, 8, 9, 12, 12, 12], weights := [1, 1, 1, 1] }

-- Period 7, original row 1341, representative 178.
def source25 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B001.Data.entryAt ⟨42, by decide +kernel⟩

def target25 : Weights.Entry :=
  { word := [0, 10, 0, 0, 1, 12, 12], weights := [0, 1, 1, 2] }

def points25 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6)]

-- Period 7, original row 1343, representative 173.
def source26 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B001.Data.entryAt ⟨37, by decide +kernel⟩

def target26 : Weights.Entry :=
  { word := [0, 10, 0, 0, 9, 12, 12], weights := [0, 1, 1, 2] }

-- Period 7, original row 1351, representative 181.
def source27 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B001.Data.entryAt ⟨45, by decide +kernel⟩

def target27 : Weights.Entry :=
  { word := [0, 10, 0, 8, 1, 12, 12], weights := [0, 1, 1, 0] }

def points27 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6)]

-- Period 7, original row 1358, representative 203.
def source28 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B001.Data.entryAt ⟨65, by decide +kernel⟩

def target28 : Weights.Entry :=
  { word := [0, 10, 0, 8, 8, 12, 12], weights := [0, 1, 0, 1] }

-- Period 7, original row 1362, representative 174.
def source29 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B001.Data.entryAt ⟨38, by decide +kernel⟩

def target29 : Weights.Entry :=
  { word := [0, 10, 0, 8, 9, 12, 12], weights := [0, 1, 1, 0] }

-- Period 7, original row 1373, representative 202.
def source30 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B001.Data.entryAt ⟨64, by decide +kernel⟩

def target30 : Weights.Entry :=
  { word := [0, 10, 0, 12, 8, 12, 12], weights := [0, 1, 0, 1] }

-- Period 7, original row 1408, representative 198.
def source31 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B001.Data.entryAt ⟨60, by decide +kernel⟩

def target31 : Weights.Entry :=
  { word := [0, 10, 2, 2, 8, 12, 12], weights := [0, 1, 0, 1] }

-- Period 7, original row 1436, representative 201.
def source32 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B001.Data.entryAt ⟨63, by decide +kernel⟩

def target32 : Weights.Entry :=
  { word := [0, 10, 2, 10, 8, 12, 12], weights := [0, 1, 0, 1] }

-- Period 7, original row 1483, representative 199.
def source33 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B001.Data.entryAt ⟨61, by decide +kernel⟩

def target33 : Weights.Entry :=
  { word := [0, 10, 10, 2, 8, 12, 12], weights := [0, 1, 0, 1] }

-- Period 7, original row 1504, representative 200.
def source34 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B001.Data.entryAt ⟨62, by decide +kernel⟩

def target34 : Weights.Entry :=
  { word := [0, 10, 10, 10, 8, 12, 12], weights := [0, 1, 0, 1] }

-- Period 7, original row 3170, representative 254.
def source35 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B001.Data.entryAt ⟨115, by decide +kernel⟩

def target35 : Weights.Entry :=
  { word := [2, 10, 0, 2, 0, 8, 9], weights := [2, 1, 0, 1] }

-- Period 7, original row 3177, representative 240.
def source36 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B001.Data.entryAt ⟨101, by decide +kernel⟩

def target36 : Weights.Entry :=
  { word := [2, 10, 0, 9, 8, 1, 12], weights := [1, 1, 0, 1] }

-- Period 7, original row 3182, representative 244.
def source37 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B001.Data.entryAt ⟨105, by decide +kernel⟩

def target37 : Weights.Entry :=
  { word := [2, 10, 0, 9, 8, 8, 12], weights := [1, 1, 0, 1] }

-- Period 7, original row 3184, representative 237.
def source38 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B001.Data.entryAt ⟨98, by decide +kernel⟩

def target38 : Weights.Entry :=
  { word := [2, 10, 0, 9, 8, 9, 12], weights := [1, 1, 0, 1] }

-- Period 7, original row 3191, representative 258.
def source39 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B001.Data.entryAt ⟨119, by decide +kernel⟩

def target39 : Weights.Entry :=
  { word := [2, 10, 0, 10, 0, 0, 9], weights := [1, 1, 0, 0] }

-- Period 7, original row 3193, representative 235.
def source40 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B001.Data.entryAt ⟨96, by decide +kernel⟩

def target40 : Weights.Entry :=
  { word := [2, 10, 0, 10, 0, 0, 12], weights := [1, 1, 0, 0] }

-- Period 7, original row 3198, representative 257.
def source41 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B001.Data.entryAt ⟨118, by decide +kernel⟩

def target41 : Weights.Entry :=
  { word := [2, 10, 0, 10, 0, 8, 9], weights := [1, 0, 0, 1] }

-- Period 7, original row 3199, representative 228.
def source42 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B001.Data.entryAt ⟨89, by decide +kernel⟩

def target42 : Weights.Entry :=
  { word := [2, 10, 0, 10, 0, 8, 12], weights := [1, 0, 0, 1] }

-- Period 7, original row 3201, representative 234.
def source43 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B001.Data.entryAt ⟨95, by decide +kernel⟩

def target43 : Weights.Entry :=
  { word := [2, 10, 0, 10, 8, 0, 12], weights := [1, 1, 0, 0] }

-- Period 7, original row 3203, representative 225.
def source44 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B001.Data.entryAt ⟨86, by decide +kernel⟩

def target44 : Weights.Entry :=
  { word := [2, 10, 0, 10, 8, 8, 12], weights := [1, 0, 0, 1] }

-- Period 7, original row 3210, representative 249.
def source45 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B001.Data.entryAt ⟨110, by decide +kernel⟩

def target45 : Weights.Entry :=
  { word := [2, 10, 0, 12, 2, 0, 12], weights := [1, 1, 0, 1] }

-- Period 7, original row 3218, representative 247.
def source46 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B001.Data.entryAt ⟨108, by decide +kernel⟩

def target46 : Weights.Entry :=
  { word := [2, 10, 0, 12, 10, 0, 12], weights := [1, 1, 0, 1] }

-- Period 7, original row 3226, representative 253.
def source47 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B001.Data.entryAt ⟨114, by decide +kernel⟩

def target47 : Weights.Entry :=
  { word := [2, 10, 2, 8, 1, 0, 12], weights := [1, 1, 0, 1] }

-- Period 7, original row 3229, representative 262.
def source48 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B001.Data.entryAt ⟨123, by decide +kernel⟩

def target48 : Weights.Entry :=
  { word := [2, 10, 2, 8, 1, 8, 9], weights := [1, 1, 1, 1] }

-- Period 7, original row 3238, representative 266.
def source49 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B001.Data.entryAt ⟨127, by decide +kernel⟩

def target49 : Weights.Entry :=
  { word := [2, 10, 2, 8, 9, 0, 9], weights := [1, 1, 0, 1] }

-- Period 7, original row 3240, representative 251.
def source50 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B001.Data.entryAt ⟨112, by decide +kernel⟩

def target50 : Weights.Entry :=
  { word := [2, 10, 2, 8, 9, 0, 12], weights := [1, 1, 0, 1] }

-- Period 7, original row 3243, representative 260.
def source51 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B001.Data.entryAt ⟨121, by decide +kernel⟩

def target51 : Weights.Entry :=
  { word := [2, 10, 2, 8, 9, 8, 9], weights := [1, 1, 1, 1] }

-- Period 7, original row 3258, representative 255.
def source52 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B001.Data.entryAt ⟨116, by decide +kernel⟩

def target52 : Weights.Entry :=
  { word := [2, 10, 8, 2, 0, 8, 9], weights := [1, 0, 0, 1] }

-- Period 7, original row 3260, representative 226.
def source53 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B001.Data.entryAt ⟨87, by decide +kernel⟩

def target53 : Weights.Entry :=
  { word := [2, 10, 8, 2, 0, 8, 12], weights := [1, 0, 0, 1] }

-- Period 7, original row 3266, representative 232.
def source54 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B001.Data.entryAt ⟨93, by decide +kernel⟩

def target54 : Weights.Entry :=
  { word := [2, 10, 8, 2, 8, 0, 12], weights := [1, 0, 0, 1] }

-- Period 7, original row 3270, representative 223.
def source55 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B001.Data.entryAt ⟨84, by decide +kernel⟩

def target55 : Weights.Entry :=
  { word := [2, 10, 8, 2, 8, 8, 12], weights := [1, 0, 0, 1] }

-- Period 7, original row 3288, representative 239.
def source56 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B001.Data.entryAt ⟨100, by decide +kernel⟩

def target56 : Weights.Entry :=
  { word := [2, 10, 8, 9, 8, 1, 12], weights := [1, 1, 0, 1] }

-- Period 7, original row 3293, representative 243.
def source57 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B001.Data.entryAt ⟨104, by decide +kernel⟩

def target57 : Weights.Entry :=
  { word := [2, 10, 8, 9, 8, 8, 12], weights := [1, 1, 0, 1] }

-- Period 7, original row 3295, representative 236.
def source58 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B001.Data.entryAt ⟨97, by decide +kernel⟩

def target58 : Weights.Entry :=
  { word := [2, 10, 8, 9, 8, 9, 12], weights := [1, 1, 0, 1] }

-- Period 7, original row 3308, representative 256.
def source59 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B001.Data.entryAt ⟨117, by decide +kernel⟩

def target59 : Weights.Entry :=
  { word := [2, 10, 8, 10, 0, 8, 9], weights := [1, 0, 0, 1] }

-- Period 7, original row 3310, representative 227.
def source60 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B001.Data.entryAt ⟨88, by decide +kernel⟩

def target60 : Weights.Entry :=
  { word := [2, 10, 8, 10, 0, 8, 12], weights := [1, 0, 0, 1] }

-- Period 7, original row 3317, representative 233.
def source61 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B001.Data.entryAt ⟨94, by decide +kernel⟩

def target61 : Weights.Entry :=
  { word := [2, 10, 8, 10, 8, 0, 12], weights := [1, 1, 0, 0] }

-- Period 7, original row 3323, representative 224.
def source62 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B001.Data.entryAt ⟨85, by decide +kernel⟩

def target62 : Weights.Entry :=
  { word := [2, 10, 8, 10, 8, 8, 12], weights := [1, 0, 0, 1] }

-- Period 7, original row 3334, representative 248.
def source63 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B001.Data.entryAt ⟨109, by decide +kernel⟩

def target63 : Weights.Entry :=
  { word := [2, 10, 8, 12, 2, 0, 12], weights := [1, 1, 0, 1] }

-- Period 7, original row 3339, representative 242.
def source64 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B001.Data.entryAt ⟨103, by decide +kernel⟩

def target64 : Weights.Entry :=
  { word := [2, 10, 8, 12, 2, 8, 12], weights := [3, 1, 2, 2] }

-- Period 7, original row 3356, representative 246.
def source65 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B001.Data.entryAt ⟨107, by decide +kernel⟩

def target65 : Weights.Entry :=
  { word := [2, 10, 8, 12, 10, 0, 12], weights := [1, 1, 0, 1] }

-- Period 7, original row 3361, representative 241.
def source66 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B001.Data.entryAt ⟨102, by decide +kernel⟩

def target66 : Weights.Entry :=
  { word := [2, 10, 8, 12, 10, 8, 12], weights := [2, 1, 1, 2] }

-- Period 7, original row 3372, representative 252.
def source67 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B001.Data.entryAt ⟨113, by decide +kernel⟩

def target67 : Weights.Entry :=
  { word := [2, 10, 10, 8, 1, 0, 12], weights := [1, 1, 0, 1] }

-- Period 7, original row 3375, representative 261.
def source68 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B001.Data.entryAt ⟨122, by decide +kernel⟩

def target68 : Weights.Entry :=
  { word := [2, 10, 10, 8, 1, 8, 9], weights := [1, 1, 1, 1] }

-- Period 7, original row 3384, representative 265.
def source69 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B001.Data.entryAt ⟨126, by decide +kernel⟩

def target69 : Weights.Entry :=
  { word := [2, 10, 10, 8, 9, 0, 9], weights := [1, 1, 0, 1] }

-- Period 7, original row 3386, representative 250.
def source70 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B001.Data.entryAt ⟨111, by decide +kernel⟩

def target70 : Weights.Entry :=
  { word := [2, 10, 10, 8, 9, 0, 12], weights := [1, 1, 0, 1] }

-- Period 7, original row 3389, representative 259.
def source71 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B001.Data.entryAt ⟨120, by decide +kernel⟩

def target71 : Weights.Entry :=
  { word := [2, 10, 10, 8, 9, 8, 9], weights := [1, 1, 1, 1] }

-- Period 7, original row 3460, representative 222.
def source72 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B001.Data.entryAt ⟨83, by decide +kernel⟩

def target72 : Weights.Entry :=
  { word := [4, 0, 4, 10, 0, 12, 10], weights := [1, 0, 1, 1] }

def points72 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 3553, representative 221.
def source73 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B001.Data.entryAt ⟨82, by decide +kernel⟩

def target73 : Weights.Entry :=
  { word := [4, 0, 12, 10, 0, 12, 10], weights := [1, 0, 1, 1] }

def points73 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 3668, representative 184.
def source74 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B001.Data.entryAt ⟨47, by decide +kernel⟩

def target74 : Weights.Entry :=
  { word := [4, 2, 8, 10, 8, 12, 12], weights := [1, 2, 1, 2] }

-- Period 7, original row 3691, representative 218.
def source75 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B001.Data.entryAt ⟨79, by decide +kernel⟩

def target75 : Weights.Entry :=
  { word := [4, 4, 8, 8, 1, 12, 10], weights := [1, 0, 1, 1] }

-- Period 7, original row 3978, representative 240.
def source76 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B001.Data.entryAt ⟨101, by decide +kernel⟩

def target76 : Weights.Entry :=
  { word := [4, 10, 0, 9, 8, 1, 12], weights := [1, 1, 0, 1] }

def points76 : List (ℕ × ℕ) := [(0, 0), (1, 2), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 3980, representative 264.
def source77 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B001.Data.entryAt ⟨125, by decide +kernel⟩

def target77 : Weights.Entry :=
  { word := [4, 10, 0, 9, 8, 2, 10], weights := [1, 1, 0, 1] }

-- Period 7, original row 3983, representative 245.
def source78 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B001.Data.entryAt ⟨106, by decide +kernel⟩

def target78 : Weights.Entry :=
  { word := [4, 10, 0, 9, 8, 8, 12], weights := [1, 1, 0, 1] }

-- Period 7, original row 3985, representative 238.
def source79 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B001.Data.entryAt ⟨99, by decide +kernel⟩

def target79 : Weights.Entry :=
  { word := [4, 10, 0, 9, 8, 9, 12], weights := [1, 1, 0, 1] }

-- Period 7, original row 3987, representative 263.
def source80 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B001.Data.entryAt ⟨124, by decide +kernel⟩

def target80 : Weights.Entry :=
  { word := [4, 10, 0, 9, 8, 10, 10], weights := [1, 1, 0, 1] }

-- Period 7, original row 3989, representative 234.
def source81 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B001.Data.entryAt ⟨95, by decide +kernel⟩

def target81 : Weights.Entry :=
  { word := [4, 10, 0, 10, 8, 0, 12], weights := [1, 1, 0, 0] }

def points81 : List (ℕ × ℕ) := [(0, 0), (1, 2), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 3991, representative 231.
def source82 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B001.Data.entryAt ⟨92, by decide +kernel⟩

def target82 : Weights.Entry :=
  { word := [4, 10, 0, 10, 8, 8, 12], weights := [1, 0, 0, 1] }

-- Period 7, original row 3998, representative 249.
def source83 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B001.Data.entryAt ⟨110, by decide +kernel⟩

def target83 : Weights.Entry :=
  { word := [4, 10, 0, 12, 2, 0, 12], weights := [1, 1, 0, 1] }

def points83 : List (ℕ × ℕ) := [(0, 0), (1, 2), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 4006, representative 247.
def source84 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B001.Data.entryAt ⟨108, by decide +kernel⟩

def target84 : Weights.Entry :=
  { word := [4, 10, 0, 12, 10, 0, 12], weights := [1, 1, 0, 1] }

def points84 : List (ℕ × ℕ) := [(0, 0), (1, 2), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 4011, representative 229.
def source85 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B001.Data.entryAt ⟨90, by decide +kernel⟩

def target85 : Weights.Entry :=
  { word := [4, 10, 8, 2, 8, 8, 12], weights := [1, 0, 0, 1] }

-- Period 7, original row 4029, representative 230.
def source86 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B001.Data.entryAt ⟨91, by decide +kernel⟩

def target86 : Weights.Entry :=
  { word := [4, 10, 8, 10, 8, 8, 12], weights := [1, 0, 0, 1] }

-- Period 7, original row 4033, representative 183.
def source87 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B001.Data.entryAt ⟨46, by decide +kernel⟩

def target87 : Weights.Entry :=
  { word := [4, 10, 8, 10, 8, 12, 12], weights := [1, 2, 1, 2] }

-- Period 7, original row 4056, representative 217.
def source88 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B001.Data.entryAt ⟨78, by decide +kernel⟩

def target88 : Weights.Entry :=
  { word := [4, 12, 8, 8, 1, 12, 10], weights := [1, 0, 1, 1] }

-- Period 7, original row 4512, representative 258.
def source89 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B001.Data.entryAt ⟨119, by decide +kernel⟩

def target89 : Weights.Entry :=
  { word := [8, 1, 0, 12, 0, 12, 4], weights := [0, 0, 1, 1] }

def points89 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 4590, representative 266.
def source90 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B001.Data.entryAt ⟨127, by decide +kernel⟩

def target90 : Weights.Entry :=
  { word := [8, 1, 8, 9, 4, 12, 4], weights := [1, 0, 1, 1] }

def points90 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 4594, representative 265.
def source91 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B001.Data.entryAt ⟨126, by decide +kernel⟩

def target91 : Weights.Entry :=
  { word := [8, 1, 8, 9, 12, 12, 4], weights := [1, 0, 1, 1] }

def points91 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 4695, representative 177.
def source92 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B001.Data.entryAt ⟨41, by decide +kernel⟩

def target92 : Weights.Entry :=
  { word := [8, 2, 0, 8, 1, 12, 12], weights := [0, 2, 1, 1] }

-- Period 7, original row 4699, representative 172.
def source93 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B001.Data.entryAt ⟨36, by decide +kernel⟩

def target93 : Weights.Entry :=
  { word := [8, 2, 0, 8, 9, 12, 12], weights := [0, 2, 1, 1] }

-- Period 7, original row 4721, representative 195.
def source94 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B001.Data.entryAt ⟨57, by decide +kernel⟩

def target94 : Weights.Entry :=
  { word := [8, 2, 0, 9, 8, 12, 12], weights := [0, 3, 1, 0] }

-- Period 7, original row 4742, representative 194.
def source95 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B001.Data.entryAt ⟨56, by decide +kernel⟩

def target95 : Weights.Entry :=
  { word := [8, 2, 0, 10, 8, 12, 12], weights := [0, 3, 0, 1] }

-- Period 7, original row 4846, representative 192.
def source96 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B001.Data.entryAt ⟨54, by decide +kernel⟩

def target96 : Weights.Entry :=
  { word := [8, 2, 2, 10, 8, 12, 12], weights := [1, 1, 1, 1] }

-- Period 7, original row 4916, representative 193.
def source97 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B001.Data.entryAt ⟨55, by decide +kernel⟩

def target97 : Weights.Entry :=
  { word := [8, 2, 8, 10, 8, 12, 12], weights := [0, 3, 0, 1] }

-- Period 7, original row 5001, representative 191.
def source98 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B001.Data.entryAt ⟨53, by decide +kernel⟩

def target98 : Weights.Entry :=
  { word := [8, 2, 10, 10, 8, 12, 12], weights := [1, 1, 1, 1] }

-- Period 7, original row 5311, representative 185.
def source99 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B001.Data.entryAt ⟨48, by decide +kernel⟩

def target99 : Weights.Entry :=
  { word := [8, 6, 8, 12, 8, 12, 12], weights := [1, 1, 1, 1] }

-- Period 7, original row 5869, representative 254.
def source100 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B001.Data.entryAt ⟨115, by decide +kernel⟩

def target100 : Weights.Entry :=
  { word := [8, 9, 0, 4, 0, 12, 4], weights := [1, 0, 1, 2] }

def points100 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 5895, representative 255.
def source101 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B001.Data.entryAt ⟨116, by decide +kernel⟩

def target101 : Weights.Entry :=
  { word := [8, 9, 0, 4, 8, 12, 4], weights := [1, 0, 0, 1] }

def points101 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 5914, representative 262.
def source102 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B001.Data.entryAt ⟨123, by decide +kernel⟩

def target102 : Weights.Entry :=
  { word := [8, 9, 0, 9, 4, 12, 4], weights := [1, 1, 1, 1] }

def points102 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 5918, representative 261.
def source103 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B001.Data.entryAt ⟨122, by decide +kernel⟩

def target103 : Weights.Entry :=
  { word := [8, 9, 0, 9, 12, 12, 4], weights := [1, 1, 1, 1] }

def points103 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 5929, representative 257.
def source104 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B001.Data.entryAt ⟨118, by decide +kernel⟩

def target104 : Weights.Entry :=
  { word := [8, 9, 0, 12, 0, 12, 4], weights := [1, 0, 0, 1] }

def points104 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 5954, representative 256.
def source105 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B001.Data.entryAt ⟨117, by decide +kernel⟩

def target105 : Weights.Entry :=
  { word := [8, 9, 0, 12, 8, 12, 4], weights := [1, 0, 0, 1] }

def points105 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 6025, representative 260.
def source106 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B001.Data.entryAt ⟨121, by decide +kernel⟩

def target106 : Weights.Entry :=
  { word := [8, 9, 8, 9, 4, 12, 4], weights := [1, 1, 1, 1] }

def points106 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 6029, representative 259.
def source107 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B001.Data.entryAt ⟨120, by decide +kernel⟩

def target107 : Weights.Entry :=
  { word := [8, 9, 8, 9, 12, 12, 4], weights := [1, 1, 1, 1] }

def points107 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 6089, representative 176.
def source108 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B001.Data.entryAt ⟨40, by decide +kernel⟩

def target108 : Weights.Entry :=
  { word := [8, 10, 0, 8, 1, 12, 12], weights := [0, 2, 1, 1] }

-- Period 7, original row 6093, representative 171.
def source109 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B001.Data.entryAt ⟨35, by decide +kernel⟩

def target109 : Weights.Entry :=
  { word := [8, 10, 0, 8, 9, 12, 12], weights := [0, 2, 1, 1] }

-- Period 7, original row 6115, representative 190.
def source110 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B001.Data.entryAt ⟨52, by decide +kernel⟩

def target110 : Weights.Entry :=
  { word := [8, 10, 0, 9, 8, 12, 12], weights := [0, 3, 1, 0] }

-- Period 7, original row 6136, representative 189.
def source111 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B001.Data.entryAt ⟨51, by decide +kernel⟩

def target111 : Weights.Entry :=
  { word := [8, 10, 0, 10, 8, 12, 12], weights := [0, 3, 0, 1] }

-- Period 7, original row 6209, representative 187.
def source112 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B001.Data.entryAt ⟨50, by decide +kernel⟩

def target112 : Weights.Entry :=
  { word := [8, 10, 2, 10, 8, 12, 12], weights := [1, 1, 1, 1] }

-- Period 7, original row 6331, representative 186.
def source113 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B001.Data.entryAt ⟨49, by decide +kernel⟩

def target113 : Weights.Entry :=
  { word := [8, 10, 10, 10, 8, 12, 12], weights := [1, 1, 1, 1] }

-- Period 7, original row 7404, representative 170.
def source114 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B001.Data.entryAt ⟨34, by decide +kernel⟩

def target114 : Weights.Entry :=
  { word := [10, 0, 0, 9, 4, 4, 12], weights := [1, 0, 1, 1] }

-- Period 7, original row 7405, representative 253.
def source115 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B001.Data.entryAt ⟨114, by decide +kernel⟩

def target115 : Weights.Entry :=
  { word := [10, 0, 0, 9, 4, 12, 4], weights := [1, 0, 1, 1] }

def points115 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 7406, representative 137.
def source116 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B001.Data.entryAt ⟨1, by decide +kernel⟩

def target116 : Weights.Entry :=
  { word := [10, 0, 0, 9, 4, 12, 12], weights := [1, 0, 1, 1] }

-- Period 7, original row 7408, representative 169.
def source117 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B001.Data.entryAt ⟨33, by decide +kernel⟩

def target117 : Weights.Entry :=
  { word := [10, 0, 0, 9, 12, 4, 12], weights := [1, 0, 1, 1] }

-- Period 7, original row 7409, representative 252.
def source118 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B001.Data.entryAt ⟨113, by decide +kernel⟩

def target118 : Weights.Entry :=
  { word := [10, 0, 0, 9, 12, 12, 4], weights := [1, 0, 1, 1] }

def points118 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 7410, representative 136.
def source119 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B001.Data.entryAt ⟨0, by decide +kernel⟩

def target119 : Weights.Entry :=
  { word := [10, 0, 0, 9, 12, 12, 12], weights := [1, 0, 1, 1] }

-- Period 7, original row 7416, representative 154.
def source120 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B001.Data.entryAt ⟨18, by decide +kernel⟩

def target120 : Weights.Entry :=
  { word := [10, 0, 0, 12, 0, 4, 10], weights := [1, 0, 1, 0] }

-- Period 7, original row 7417, representative 154.
def source121 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B001.Data.entryAt ⟨18, by decide +kernel⟩

def target121 : Weights.Entry :=
  { word := [10, 0, 0, 12, 0, 4, 12], weights := [1, 0, 1, 0] }

def points121 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 7418, representative 235.
def source122 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B001.Data.entryAt ⟨96, by decide +kernel⟩

def target122 : Weights.Entry :=
  { word := [10, 0, 0, 12, 0, 12, 4], weights := [0, 0, 1, 1] }

def points122 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 7458, representative 249.
def source123 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B001.Data.entryAt ⟨110, by decide +kernel⟩

def target123 : Weights.Entry :=
  { word := [10, 0, 4, 10, 0, 12, 2], weights := [1, 0, 1, 1] }

def points123 : List (ℕ × ℕ) := [(0, 2), (1, 0), (2, 1), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 7459, representative 249.
def source124 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B001.Data.entryAt ⟨110, by decide +kernel⟩

def target124 : Weights.Entry :=
  { word := [10, 0, 4, 10, 0, 12, 4], weights := [1, 0, 1, 1] }

def points124 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 7465, representative 166.
def source125 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B001.Data.entryAt ⟨30, by decide +kernel⟩

def target125 : Weights.Entry :=
  { word := [10, 0, 4, 10, 8, 4, 12], weights := [1, 0, 1, 1] }

-- Period 7, original row 7469, representative 248.
def source126 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B001.Data.entryAt ⟨109, by decide +kernel⟩

def target126 : Weights.Entry :=
  { word := [10, 0, 4, 10, 8, 12, 4], weights := [1, 0, 1, 1] }

def points126 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 7489, representative 151.
def source127 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B001.Data.entryAt ⟨15, by decide +kernel⟩

def target127 : Weights.Entry :=
  { word := [10, 0, 8, 4, 8, 4, 12], weights := [1, 0, 0, 1] }

def period7Entries : List Weights.Entry := [target0, target1, target2, target3, target4, target5, target6, target7, target8, target9, target10, target11, target12, target13, target14, target15, target16, target17, target18, target19, target20, target21, target22, target23, target24, target25, target26, target27, target28, target29, target30, target31, target32, target33, target34, target35, target36, target37, target38, target39, target40, target41, target42, target43, target44, target45, target46, target47, target48, target49, target50, target51, target52, target53, target54, target55, target56, target57, target58, target59, target60, target61, target62, target63, target64, target65, target66, target67, target68, target69, target70, target71, target72, target73, target74, target75, target76, target77, target78, target79, target80, target81, target82, target83, target84, target85, target86, target87, target88, target89, target90, target91, target92, target93, target94, target95, target96, target97, target98, target99, target100, target101, target102, target103, target104, target105, target106, target107, target108, target109, target110, target111, target112, target113, target114, target115, target116, target117, target118, target119, target120, target121, target122, target123, target124, target125, target126, target127]

def period7Chunk : RowCoverage.Chunk where
  rows := [⟨129, target0⟩, ⟨133, target1⟩, ⟨190, target2⟩, ⟨198, target3⟩, ⟨220, target4⟩, ⟨283, target5⟩, ⟨291, target6⟩, ⟨309, target7⟩, ⟨313, target8⟩, ⟨365, target9⟩, ⟨382, target10⟩, ⟨410, target11⟩, ⟨463, target12⟩, ⟨484, target13⟩, ⟨505, target14⟩, ⟨745, target15⟩, ⟨777, target16⟩, ⟨1149, target17⟩, ⟨1175, target18⟩, ⟨1193, target19⟩, ⟨1197, target20⟩, ⟨1209, target21⟩, ⟨1234, target22⟩, ⟨1304, target23⟩, ⟨1308, target24⟩, ⟨1341, target25⟩, ⟨1343, target26⟩, ⟨1351, target27⟩, ⟨1358, target28⟩, ⟨1362, target29⟩, ⟨1373, target30⟩, ⟨1408, target31⟩, ⟨1436, target32⟩, ⟨1483, target33⟩, ⟨1504, target34⟩, ⟨3170, target35⟩, ⟨3177, target36⟩, ⟨3182, target37⟩, ⟨3184, target38⟩, ⟨3191, target39⟩, ⟨3193, target40⟩, ⟨3198, target41⟩, ⟨3199, target42⟩, ⟨3201, target43⟩, ⟨3203, target44⟩, ⟨3210, target45⟩, ⟨3218, target46⟩, ⟨3226, target47⟩, ⟨3229, target48⟩, ⟨3238, target49⟩, ⟨3240, target50⟩, ⟨3243, target51⟩, ⟨3258, target52⟩, ⟨3260, target53⟩, ⟨3266, target54⟩, ⟨3270, target55⟩, ⟨3288, target56⟩, ⟨3293, target57⟩, ⟨3295, target58⟩, ⟨3308, target59⟩, ⟨3310, target60⟩, ⟨3317, target61⟩, ⟨3323, target62⟩, ⟨3334, target63⟩, ⟨3339, target64⟩, ⟨3356, target65⟩, ⟨3361, target66⟩, ⟨3372, target67⟩, ⟨3375, target68⟩, ⟨3384, target69⟩, ⟨3386, target70⟩, ⟨3389, target71⟩, ⟨3460, target72⟩, ⟨3553, target73⟩, ⟨3668, target74⟩, ⟨3691, target75⟩, ⟨3978, target76⟩, ⟨3980, target77⟩, ⟨3983, target78⟩, ⟨3985, target79⟩, ⟨3987, target80⟩, ⟨3989, target81⟩, ⟨3991, target82⟩, ⟨3998, target83⟩, ⟨4006, target84⟩, ⟨4011, target85⟩, ⟨4029, target86⟩, ⟨4033, target87⟩, ⟨4056, target88⟩, ⟨4512, target89⟩, ⟨4590, target90⟩, ⟨4594, target91⟩, ⟨4695, target92⟩, ⟨4699, target93⟩, ⟨4721, target94⟩, ⟨4742, target95⟩, ⟨4846, target96⟩, ⟨4916, target97⟩, ⟨5001, target98⟩, ⟨5311, target99⟩, ⟨5869, target100⟩, ⟨5895, target101⟩, ⟨5914, target102⟩, ⟨5918, target103⟩, ⟨5929, target104⟩, ⟨5954, target105⟩, ⟨6025, target106⟩, ⟨6029, target107⟩, ⟨6089, target108⟩, ⟨6093, target109⟩, ⟨6115, target110⟩, ⟨6136, target111⟩, ⟨6209, target112⟩, ⟨6331, target113⟩, ⟨7404, target114⟩, ⟨7405, target115⟩, ⟨7406, target116⟩, ⟨7408, target117⟩, ⟨7409, target118⟩, ⟨7410, target119⟩, ⟨7416, target120⟩, ⟨7417, target121⟩, ⟨7418, target122⟩, ⟨7458, target123⟩, ⟨7459, target124⟩, ⟨7465, target125⟩, ⟨7469, target126⟩, ⟨7489, target127⟩]
  indexMask := 25920177320281742071395219180597187604178261208203893287555536384197847992298572403864216229544868485452192738677444152629974719091320120096547081260479338553187453046339201106887911882600859880715543492629362021876504754424142515599894829899708009820201025966191331621695634267877242976352042895746331531831368570804377628754772876221278673297642862200783778460820158612988898721698783443178926893063574206883306009494100844394180015807290818874051722584660678857349760777731168940857636800103592394504355165679688916627217979279458179589558907840633659756548042379096793340182254513424872734950912172874160912299275924117276254336166553228686248133777293428751437520052266248798651147160533367716278262734191488836604706478610216352058530869689771187303461584203980476519361306735349589300467731160332933247341066774873597570511922818825754524343472230853182557903782789377621460382417211426008803758882703633724735685690848229332268489094609837359005878697175310373789579666313125607513456559569605870183408586400201576499651040587289105859632202039946075382558892780793999727332169921605575044143763423274883077581402503498074755969277603012208811328139060998191940876926884849775361962709480849175675350216385688378361258011926418714035221877541808335996235961887670218982647936430786138050824547937630349929003053856731415172401226847554285797073726003313587953189617639913381816889700005972407275072613046429983680258740476629670139798189704804438273026087567113871294617961932487700226785768882944563203166521883502019545533612483856487614272240539106055099390261300618232173698785591834325748529025273242864838867783632735768124569617968228184031153379342206465304355976149222240697651878654462990357849575393819140622606590413335072863511618943097834719711556311361183570710991006626108493084584237431389791026469311663547526144893087623468795813537161643184000992437760062211057062816331229163299725561550748898235497615796930865329552787830013729892156973876997923653901535816273771149694984581983151500066023153915604082710802502032112598484764705500038208897813476236102454811069603973409242041062778495795683860318682796763119323221483616261975635193491851532600605992105762497628055114651418885798192526295555439006824951034341554458198016
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

end FranklSmallCyclic.TransportBatches.G001.B000.Data
