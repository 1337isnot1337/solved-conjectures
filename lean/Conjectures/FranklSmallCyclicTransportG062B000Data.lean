module

public import Conjectures.FranklSmallCyclicRowCoverage
public import Conjectures.FranklSmallCyclicCanonicalWords
public import Conjectures.FranklSmallCyclicOrbit9Block009Data

/-! 128 literal targets sharing one source proof block.
Original words and row indices are retained; weights may be transported.
-/
@[expose] public section

namespace FranklSmallCyclic.TransportBatches.G062.B000.Data

-- Period 9, original row 563, representative 7990.
def source0 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨87, by decide +kernel⟩

def target0 : Weights.Entry :=
  { word := [0, 4, 2, 0, 1, 8, 9], weights := [0, 1, 0, 1] }

-- Period 9, original row 577, representative 7986.
def source1 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨83, by decide +kernel⟩

def target1 : Weights.Entry :=
  { word := [0, 4, 2, 0, 9, 8, 9], weights := [0, 1, 0, 1] }

-- Period 9, original row 587, representative 8009.
def source2 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨106, by decide +kernel⟩

def target2 : Weights.Entry :=
  { word := [0, 4, 2, 8, 2, 8, 10], weights := [0, 1, 1, 0] }

-- Period 9, original row 601, representative 7997.
def source3 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨94, by decide +kernel⟩

def target3 : Weights.Entry :=
  { word := [0, 4, 2, 8, 10, 8, 10], weights := [0, 1, 1, 0] }

-- Period 9, original row 613, representative 7990.
def source4 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨87, by decide +kernel⟩

def target4 : Weights.Entry :=
  { word := [0, 4, 4, 4, 0, 8, 9], weights := [1, 0, 0, 1] }

def points4 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 627, representative 7980.
def source5 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨77, by decide +kernel⟩

def target5 : Weights.Entry :=
  { word := [0, 4, 4, 4, 8, 8, 9], weights := [1, 0, 1, 0] }

-- Period 9, original row 633, representative 7977.
def source6 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨74, by decide +kernel⟩

def target6 : Weights.Entry :=
  { word := [0, 4, 6, 8, 8, 8, 9], weights := [0, 1, 1, 0] }

-- Period 9, original row 645, representative 8016.
def source7 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨113, by decide +kernel⟩

def target7 : Weights.Entry :=
  { word := [0, 4, 8, 4, 2, 8, 10], weights := [0, 0, 1, 0] }

-- Period 9, original row 671, representative 8004.
def source8 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨101, by decide +kernel⟩

def target8 : Weights.Entry :=
  { word := [0, 4, 8, 4, 10, 8, 10], weights := [0, 0, 1, 0] }

-- Period 9, original row 672, representative 8024.
def source9 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨121, by decide +kernel⟩

def target9 : Weights.Entry :=
  { word := [0, 4, 8, 4, 10, 8, 12], weights := [1, 0, 0, 1] }

-- Period 9, original row 695, representative 7993.
def source10 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨90, by decide +kernel⟩

def target10 : Weights.Entry :=
  { word := [0, 4, 10, 0, 1, 8, 9], weights := [0, 1, 0, 1] }

-- Period 9, original row 702, representative 7989.
def source11 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨86, by decide +kernel⟩

def target11 : Weights.Entry :=
  { word := [0, 4, 10, 0, 9, 8, 9], weights := [0, 1, 0, 1] }

-- Period 9, original row 707, representative 8008.
def source12 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨105, by decide +kernel⟩

def target12 : Weights.Entry :=
  { word := [0, 4, 10, 8, 2, 8, 10], weights := [0, 1, 1, 0] }

-- Period 9, original row 716, representative 7996.
def source13 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨93, by decide +kernel⟩

def target13 : Weights.Entry :=
  { word := [0, 4, 10, 8, 10, 8, 10], weights := [0, 1, 1, 0] }

-- Period 9, original row 721, representative 7993.
def source14 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨90, by decide +kernel⟩

def target14 : Weights.Entry :=
  { word := [0, 4, 12, 4, 0, 8, 9], weights := [1, 0, 0, 1] }

def points14 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 735, representative 7983.
def source15 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨80, by decide +kernel⟩

def target15 : Weights.Entry :=
  { word := [0, 4, 12, 4, 8, 8, 9], weights := [1, 0, 1, 0] }

-- Period 9, original row 823, representative 8017.
def source16 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨114, by decide +kernel⟩

def target16 : Weights.Entry :=
  { word := [0, 8, 0, 4, 2, 8, 10], weights := [0, 0, 1, 0] }

-- Period 9, original row 849, representative 8005.
def source17 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨102, by decide +kernel⟩

def target17 : Weights.Entry :=
  { word := [0, 8, 0, 4, 10, 8, 10], weights := [0, 0, 1, 0] }

-- Period 9, original row 850, representative 8025.
def source18 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨122, by decide +kernel⟩

def target18 : Weights.Entry :=
  { word := [0, 8, 0, 4, 10, 8, 12], weights := [1, 0, 0, 1] }

-- Period 9, original row 902, representative 8014.
def source19 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨111, by decide +kernel⟩

def target19 : Weights.Entry :=
  { word := [0, 8, 1, 4, 2, 8, 10], weights := [0, 0, 1, 0] }

-- Period 9, original row 903, representative 8030.
def source20 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨127, by decide +kernel⟩

def target20 : Weights.Entry :=
  { word := [0, 8, 1, 4, 2, 8, 12], weights := [1, 0, 0, 1] }

-- Period 9, original row 924, representative 8002.
def source21 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨99, by decide +kernel⟩

def target21 : Weights.Entry :=
  { word := [0, 8, 1, 4, 10, 8, 10], weights := [0, 0, 1, 0] }

-- Period 9, original row 925, representative 8022.
def source22 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨119, by decide +kernel⟩

def target22 : Weights.Entry :=
  { word := [0, 8, 1, 4, 10, 8, 12], weights := [1, 0, 0, 1] }

-- Period 9, original row 950, representative 7972.
def source23 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨69, by decide +kernel⟩

def target23 : Weights.Entry :=
  { word := [0, 8, 2, 2, 2, 8, 9], weights := [0, 1, 0, 0] }

-- Period 9, original row 951, representative 8010.
def source24 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨107, by decide +kernel⟩

def target24 : Weights.Entry :=
  { word := [0, 8, 2, 2, 2, 8, 10], weights := [0, 1, 0, 0] }

-- Period 9, original row 952, representative 8026.
def source25 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨123, by decide +kernel⟩

def target25 : Weights.Entry :=
  { word := [0, 8, 2, 2, 2, 8, 12], weights := [1, 0, 0, 1] }

-- Period 9, original row 965, representative 7968.
def source26 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨65, by decide +kernel⟩

def target26 : Weights.Entry :=
  { word := [0, 8, 2, 2, 10, 8, 9], weights := [0, 1, 0, 0] }

-- Period 9, original row 966, representative 7998.
def source27 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨95, by decide +kernel⟩

def target27 : Weights.Entry :=
  { word := [0, 8, 2, 2, 10, 8, 10], weights := [0, 1, 0, 0] }

-- Period 9, original row 967, representative 8018.
def source28 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨115, by decide +kernel⟩

def target28 : Weights.Entry :=
  { word := [0, 8, 2, 2, 10, 8, 12], weights := [1, 0, 0, 1] }

-- Period 9, original row 979, representative 7975.
def source29 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨72, by decide +kernel⟩

def target29 : Weights.Entry :=
  { word := [0, 8, 2, 10, 2, 8, 9], weights := [0, 1, 0, 0] }

-- Period 9, original row 980, representative 8013.
def source30 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨110, by decide +kernel⟩

def target30 : Weights.Entry :=
  { word := [0, 8, 2, 10, 2, 8, 10], weights := [0, 1, 0, 0] }

-- Period 9, original row 981, representative 8029.
def source31 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨126, by decide +kernel⟩

def target31 : Weights.Entry :=
  { word := [0, 8, 2, 10, 2, 8, 12], weights := [1, 0, 0, 1] }

-- Period 9, original row 993, representative 7971.
def source32 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨68, by decide +kernel⟩

def target32 : Weights.Entry :=
  { word := [0, 8, 2, 10, 10, 8, 9], weights := [0, 1, 0, 0] }

-- Period 9, original row 994, representative 8001.
def source33 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨98, by decide +kernel⟩

def target33 : Weights.Entry :=
  { word := [0, 8, 2, 10, 10, 8, 10], weights := [0, 1, 0, 0] }

-- Period 9, original row 995, representative 8021.
def source34 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨118, by decide +kernel⟩

def target34 : Weights.Entry :=
  { word := [0, 8, 2, 10, 10, 8, 12], weights := [1, 0, 0, 1] }

-- Period 9, original row 1017, representative 7984.
def source35 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨81, by decide +kernel⟩

def target35 : Weights.Entry :=
  { word := [0, 8, 6, 2, 0, 8, 9], weights := [1, 0, 0, 1] }

-- Period 9, original row 1025, representative 7978.
def source36 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨75, by decide +kernel⟩

def target36 : Weights.Entry :=
  { word := [0, 8, 6, 2, 8, 8, 9], weights := [0, 1, 0, 0] }

-- Period 9, original row 1032, representative 7985.
def source37 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨82, by decide +kernel⟩

def target37 : Weights.Entry :=
  { word := [0, 8, 6, 10, 0, 8, 9], weights := [1, 0, 0, 1] }

-- Period 9, original row 1039, representative 7979.
def source38 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨76, by decide +kernel⟩

def target38 : Weights.Entry :=
  { word := [0, 8, 6, 10, 8, 8, 9], weights := [0, 1, 0, 0] }

-- Period 9, original row 1085, representative 7973.
def source39 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨70, by decide +kernel⟩

def target39 : Weights.Entry :=
  { word := [0, 8, 10, 2, 2, 8, 9], weights := [0, 1, 0, 0] }

-- Period 9, original row 1086, representative 8011.
def source40 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨108, by decide +kernel⟩

def target40 : Weights.Entry :=
  { word := [0, 8, 10, 2, 2, 8, 10], weights := [0, 1, 0, 0] }

-- Period 9, original row 1087, representative 8027.
def source41 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨124, by decide +kernel⟩

def target41 : Weights.Entry :=
  { word := [0, 8, 10, 2, 2, 8, 12], weights := [1, 0, 0, 1] }

-- Period 9, original row 1093, representative 7969.
def source42 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨66, by decide +kernel⟩

def target42 : Weights.Entry :=
  { word := [0, 8, 10, 2, 10, 8, 9], weights := [0, 1, 0, 0] }

-- Period 9, original row 1094, representative 7999.
def source43 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨96, by decide +kernel⟩

def target43 : Weights.Entry :=
  { word := [0, 8, 10, 2, 10, 8, 10], weights := [0, 1, 0, 0] }

-- Period 9, original row 1095, representative 8019.
def source44 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨116, by decide +kernel⟩

def target44 : Weights.Entry :=
  { word := [0, 8, 10, 2, 10, 8, 12], weights := [1, 0, 0, 1] }

-- Period 9, original row 1100, representative 7974.
def source45 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨71, by decide +kernel⟩

def target45 : Weights.Entry :=
  { word := [0, 8, 10, 10, 2, 8, 9], weights := [0, 1, 0, 0] }

-- Period 9, original row 1101, representative 8012.
def source46 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨109, by decide +kernel⟩

def target46 : Weights.Entry :=
  { word := [0, 8, 10, 10, 2, 8, 10], weights := [0, 1, 0, 0] }

-- Period 9, original row 1102, representative 8028.
def source47 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨125, by decide +kernel⟩

def target47 : Weights.Entry :=
  { word := [0, 8, 10, 10, 2, 8, 12], weights := [1, 0, 0, 1] }

-- Period 9, original row 1107, representative 7970.
def source48 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨67, by decide +kernel⟩

def target48 : Weights.Entry :=
  { word := [0, 8, 10, 10, 10, 8, 9], weights := [0, 1, 0, 0] }

-- Period 9, original row 1108, representative 8000.
def source49 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨97, by decide +kernel⟩

def target49 : Weights.Entry :=
  { word := [0, 8, 10, 10, 10, 8, 10], weights := [0, 1, 0, 0] }

-- Period 9, original row 1109, representative 8020.
def source50 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨117, by decide +kernel⟩

def target50 : Weights.Entry :=
  { word := [0, 8, 10, 10, 10, 8, 12], weights := [1, 0, 0, 1] }

-- Period 9, original row 1515, representative 8014.
def source51 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨111, by decide +kernel⟩

def target51 : Weights.Entry :=
  { word := [0, 12, 0, 4, 2, 8, 10], weights := [0, 0, 1, 0] }

def points51 : List (ℕ × ℕ) := [(0, 0), (1, 2), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 1516, representative 8030.
def source52 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨127, by decide +kernel⟩

def target52 : Weights.Entry :=
  { word := [0, 12, 0, 4, 2, 8, 12], weights := [1, 0, 0, 1] }

def points52 : List (ℕ × ℕ) := [(0, 0), (1, 2), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 1537, representative 8002.
def source53 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨99, by decide +kernel⟩

def target53 : Weights.Entry :=
  { word := [0, 12, 0, 4, 10, 8, 10], weights := [0, 0, 1, 0] }

def points53 : List (ℕ × ℕ) := [(0, 0), (1, 2), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 1538, representative 8022.
def source54 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨119, by decide +kernel⟩

def target54 : Weights.Entry :=
  { word := [0, 12, 0, 4, 10, 8, 12], weights := [1, 0, 0, 1] }

def points54 : List (ℕ × ℕ) := [(0, 0), (1, 2), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 1562, representative 7991.
def source55 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨88, by decide +kernel⟩

def target55 : Weights.Entry :=
  { word := [0, 12, 2, 0, 1, 8, 9], weights := [0, 1, 0, 1] }

-- Period 9, original row 1576, representative 7987.
def source56 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨84, by decide +kernel⟩

def target56 : Weights.Entry :=
  { word := [0, 12, 2, 0, 9, 8, 9], weights := [0, 1, 0, 1] }

-- Period 9, original row 1586, representative 8007.
def source57 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨104, by decide +kernel⟩

def target57 : Weights.Entry :=
  { word := [0, 12, 2, 8, 2, 8, 10], weights := [0, 1, 1, 0] }

-- Period 9, original row 1600, representative 7995.
def source58 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨92, by decide +kernel⟩

def target58 : Weights.Entry :=
  { word := [0, 12, 2, 8, 10, 8, 10], weights := [0, 1, 1, 0] }

-- Period 9, original row 1612, representative 7991.
def source59 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨88, by decide +kernel⟩

def target59 : Weights.Entry :=
  { word := [0, 12, 4, 4, 0, 8, 9], weights := [1, 0, 0, 1] }

def points59 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 1626, representative 7981.
def source60 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨78, by decide +kernel⟩

def target60 : Weights.Entry :=
  { word := [0, 12, 4, 4, 8, 8, 9], weights := [1, 0, 1, 0] }

-- Period 9, original row 1632, representative 7976.
def source61 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨73, by decide +kernel⟩

def target61 : Weights.Entry :=
  { word := [0, 12, 6, 8, 8, 8, 9], weights := [0, 1, 1, 0] }

-- Period 9, original row 1644, representative 8015.
def source62 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨112, by decide +kernel⟩

def target62 : Weights.Entry :=
  { word := [0, 12, 8, 4, 2, 8, 10], weights := [0, 0, 1, 0] }

-- Period 9, original row 1670, representative 8003.
def source63 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨100, by decide +kernel⟩

def target63 : Weights.Entry :=
  { word := [0, 12, 8, 4, 10, 8, 10], weights := [0, 0, 1, 0] }

-- Period 9, original row 1671, representative 8023.
def source64 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨120, by decide +kernel⟩

def target64 : Weights.Entry :=
  { word := [0, 12, 8, 4, 10, 8, 12], weights := [1, 0, 0, 1] }

-- Period 9, original row 1694, representative 7992.
def source65 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨89, by decide +kernel⟩

def target65 : Weights.Entry :=
  { word := [0, 12, 10, 0, 1, 8, 9], weights := [0, 1, 0, 1] }

-- Period 9, original row 1701, representative 7988.
def source66 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨85, by decide +kernel⟩

def target66 : Weights.Entry :=
  { word := [0, 12, 10, 0, 9, 8, 9], weights := [0, 1, 0, 1] }

-- Period 9, original row 1706, representative 8006.
def source67 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨103, by decide +kernel⟩

def target67 : Weights.Entry :=
  { word := [0, 12, 10, 8, 2, 8, 10], weights := [0, 1, 1, 0] }

-- Period 9, original row 1715, representative 7994.
def source68 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨91, by decide +kernel⟩

def target68 : Weights.Entry :=
  { word := [0, 12, 10, 8, 10, 8, 10], weights := [0, 1, 1, 0] }

-- Period 9, original row 1720, representative 7992.
def source69 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨89, by decide +kernel⟩

def target69 : Weights.Entry :=
  { word := [0, 12, 12, 4, 0, 8, 9], weights := [1, 0, 0, 1] }

def points69 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 1734, representative 7982.
def source70 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨79, by decide +kernel⟩

def target70 : Weights.Entry :=
  { word := [0, 12, 12, 4, 8, 8, 9], weights := [1, 0, 1, 0] }

-- Period 9, original row 1852, representative 7990.
def source71 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨87, by decide +kernel⟩

def target71 : Weights.Entry :=
  { word := [1, 4, 2, 0, 1, 8, 9], weights := [0, 1, 0, 1] }

def points71 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 1866, representative 7986.
def source72 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨83, by decide +kernel⟩

def target72 : Weights.Entry :=
  { word := [1, 4, 2, 0, 9, 8, 9], weights := [0, 1, 0, 1] }

def points72 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 1876, representative 8009.
def source73 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨106, by decide +kernel⟩

def target73 : Weights.Entry :=
  { word := [1, 4, 2, 8, 2, 8, 10], weights := [0, 1, 1, 0] }

def points73 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 1890, representative 7997.
def source74 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨94, by decide +kernel⟩

def target74 : Weights.Entry :=
  { word := [1, 4, 2, 8, 10, 8, 10], weights := [0, 1, 1, 0] }

def points74 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 1902, representative 7990.
def source75 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨87, by decide +kernel⟩

def target75 : Weights.Entry :=
  { word := [1, 4, 4, 4, 0, 8, 9], weights := [1, 0, 0, 1] }

def points75 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 1916, representative 7980.
def source76 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨77, by decide +kernel⟩

def target76 : Weights.Entry :=
  { word := [1, 4, 4, 4, 8, 8, 9], weights := [1, 0, 1, 0] }

def points76 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 1929, representative 8016.
def source77 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨113, by decide +kernel⟩

def target77 : Weights.Entry :=
  { word := [1, 4, 8, 4, 2, 8, 10], weights := [0, 0, 1, 0] }

def points77 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 1955, representative 8004.
def source78 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨101, by decide +kernel⟩

def target78 : Weights.Entry :=
  { word := [1, 4, 8, 4, 10, 8, 10], weights := [0, 0, 1, 0] }

def points78 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 1956, representative 8024.
def source79 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨121, by decide +kernel⟩

def target79 : Weights.Entry :=
  { word := [1, 4, 8, 4, 10, 8, 12], weights := [1, 0, 0, 1] }

def points79 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 1979, representative 7993.
def source80 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨90, by decide +kernel⟩

def target80 : Weights.Entry :=
  { word := [1, 4, 10, 0, 1, 8, 9], weights := [0, 1, 0, 1] }

def points80 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 1986, representative 7989.
def source81 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨86, by decide +kernel⟩

def target81 : Weights.Entry :=
  { word := [1, 4, 10, 0, 9, 8, 9], weights := [0, 1, 0, 1] }

def points81 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 1991, representative 8008.
def source82 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨105, by decide +kernel⟩

def target82 : Weights.Entry :=
  { word := [1, 4, 10, 8, 2, 8, 10], weights := [0, 1, 1, 0] }

def points82 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 2000, representative 7996.
def source83 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨93, by decide +kernel⟩

def target83 : Weights.Entry :=
  { word := [1, 4, 10, 8, 10, 8, 10], weights := [0, 1, 1, 0] }

def points83 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 2005, representative 7993.
def source84 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨90, by decide +kernel⟩

def target84 : Weights.Entry :=
  { word := [1, 4, 12, 4, 0, 8, 9], weights := [1, 0, 0, 1] }

def points84 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 2019, representative 7983.
def source85 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨80, by decide +kernel⟩

def target85 : Weights.Entry :=
  { word := [1, 4, 12, 4, 8, 8, 9], weights := [1, 0, 1, 0] }

def points85 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 2032, representative 8014.
def source86 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨111, by decide +kernel⟩

def target86 : Weights.Entry :=
  { word := [1, 8, 1, 4, 2, 8, 10], weights := [0, 0, 1, 0] }

def points86 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 2033, representative 8030.
def source87 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨127, by decide +kernel⟩

def target87 : Weights.Entry :=
  { word := [1, 8, 1, 4, 2, 8, 12], weights := [1, 0, 0, 1] }

def points87 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 2054, representative 8002.
def source88 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨99, by decide +kernel⟩

def target88 : Weights.Entry :=
  { word := [1, 8, 1, 4, 10, 8, 10], weights := [0, 0, 1, 0] }

def points88 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 2055, representative 8022.
def source89 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨119, by decide +kernel⟩

def target89 : Weights.Entry :=
  { word := [1, 8, 1, 4, 10, 8, 12], weights := [1, 0, 0, 1] }

def points89 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 2080, representative 7972.
def source90 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨69, by decide +kernel⟩

def target90 : Weights.Entry :=
  { word := [1, 8, 2, 2, 2, 8, 9], weights := [0, 1, 0, 0] }

def points90 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 2081, representative 8010.
def source91 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨107, by decide +kernel⟩

def target91 : Weights.Entry :=
  { word := [1, 8, 2, 2, 2, 8, 10], weights := [0, 1, 0, 0] }

def points91 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 2082, representative 8026.
def source92 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨123, by decide +kernel⟩

def target92 : Weights.Entry :=
  { word := [1, 8, 2, 2, 2, 8, 12], weights := [1, 0, 0, 1] }

def points92 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 2095, representative 7968.
def source93 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨65, by decide +kernel⟩

def target93 : Weights.Entry :=
  { word := [1, 8, 2, 2, 10, 8, 9], weights := [0, 1, 0, 0] }

def points93 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 2096, representative 7998.
def source94 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨95, by decide +kernel⟩

def target94 : Weights.Entry :=
  { word := [1, 8, 2, 2, 10, 8, 10], weights := [0, 1, 0, 0] }

def points94 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 2097, representative 8018.
def source95 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨115, by decide +kernel⟩

def target95 : Weights.Entry :=
  { word := [1, 8, 2, 2, 10, 8, 12], weights := [1, 0, 0, 1] }

def points95 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 2109, representative 7975.
def source96 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨72, by decide +kernel⟩

def target96 : Weights.Entry :=
  { word := [1, 8, 2, 10, 2, 8, 9], weights := [0, 1, 0, 0] }

def points96 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 2110, representative 8013.
def source97 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨110, by decide +kernel⟩

def target97 : Weights.Entry :=
  { word := [1, 8, 2, 10, 2, 8, 10], weights := [0, 1, 0, 0] }

def points97 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 2111, representative 8029.
def source98 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨126, by decide +kernel⟩

def target98 : Weights.Entry :=
  { word := [1, 8, 2, 10, 2, 8, 12], weights := [1, 0, 0, 1] }

def points98 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 2123, representative 7971.
def source99 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨68, by decide +kernel⟩

def target99 : Weights.Entry :=
  { word := [1, 8, 2, 10, 10, 8, 9], weights := [0, 1, 0, 0] }

def points99 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 2124, representative 8001.
def source100 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨98, by decide +kernel⟩

def target100 : Weights.Entry :=
  { word := [1, 8, 2, 10, 10, 8, 10], weights := [0, 1, 0, 0] }

def points100 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 2125, representative 8021.
def source101 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨118, by decide +kernel⟩

def target101 : Weights.Entry :=
  { word := [1, 8, 2, 10, 10, 8, 12], weights := [1, 0, 0, 1] }

def points101 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 2167, representative 7973.
def source102 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨70, by decide +kernel⟩

def target102 : Weights.Entry :=
  { word := [1, 8, 10, 2, 2, 8, 9], weights := [0, 1, 0, 0] }

def points102 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 2168, representative 8011.
def source103 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨108, by decide +kernel⟩

def target103 : Weights.Entry :=
  { word := [1, 8, 10, 2, 2, 8, 10], weights := [0, 1, 0, 0] }

def points103 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 2169, representative 8027.
def source104 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨124, by decide +kernel⟩

def target104 : Weights.Entry :=
  { word := [1, 8, 10, 2, 2, 8, 12], weights := [1, 0, 0, 1] }

def points104 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 2175, representative 7969.
def source105 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨66, by decide +kernel⟩

def target105 : Weights.Entry :=
  { word := [1, 8, 10, 2, 10, 8, 9], weights := [0, 1, 0, 0] }

def points105 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 2176, representative 7999.
def source106 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨96, by decide +kernel⟩

def target106 : Weights.Entry :=
  { word := [1, 8, 10, 2, 10, 8, 10], weights := [0, 1, 0, 0] }

def points106 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 2177, representative 8019.
def source107 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨116, by decide +kernel⟩

def target107 : Weights.Entry :=
  { word := [1, 8, 10, 2, 10, 8, 12], weights := [1, 0, 0, 1] }

def points107 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 2182, representative 7974.
def source108 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨71, by decide +kernel⟩

def target108 : Weights.Entry :=
  { word := [1, 8, 10, 10, 2, 8, 9], weights := [0, 1, 0, 0] }

def points108 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 2183, representative 8012.
def source109 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨109, by decide +kernel⟩

def target109 : Weights.Entry :=
  { word := [1, 8, 10, 10, 2, 8, 10], weights := [0, 1, 0, 0] }

def points109 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 2184, representative 8028.
def source110 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨125, by decide +kernel⟩

def target110 : Weights.Entry :=
  { word := [1, 8, 10, 10, 2, 8, 12], weights := [1, 0, 0, 1] }

def points110 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 2189, representative 7970.
def source111 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨67, by decide +kernel⟩

def target111 : Weights.Entry :=
  { word := [1, 8, 10, 10, 10, 8, 9], weights := [0, 1, 0, 0] }

def points111 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 2190, representative 8000.
def source112 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨97, by decide +kernel⟩

def target112 : Weights.Entry :=
  { word := [1, 8, 10, 10, 10, 8, 10], weights := [0, 1, 0, 0] }

def points112 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 2191, representative 8020.
def source113 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨117, by decide +kernel⟩

def target113 : Weights.Entry :=
  { word := [1, 8, 10, 10, 10, 8, 12], weights := [1, 0, 0, 1] }

def points113 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 2211, representative 7991.
def source114 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨88, by decide +kernel⟩

def target114 : Weights.Entry :=
  { word := [1, 12, 2, 0, 1, 8, 9], weights := [0, 1, 0, 1] }

def points114 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 2225, representative 7987.
def source115 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨84, by decide +kernel⟩

def target115 : Weights.Entry :=
  { word := [1, 12, 2, 0, 9, 8, 9], weights := [0, 1, 0, 1] }

def points115 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 2235, representative 8007.
def source116 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨104, by decide +kernel⟩

def target116 : Weights.Entry :=
  { word := [1, 12, 2, 8, 2, 8, 10], weights := [0, 1, 1, 0] }

def points116 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 2249, representative 7995.
def source117 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨92, by decide +kernel⟩

def target117 : Weights.Entry :=
  { word := [1, 12, 2, 8, 10, 8, 10], weights := [0, 1, 1, 0] }

def points117 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 2261, representative 7991.
def source118 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨88, by decide +kernel⟩

def target118 : Weights.Entry :=
  { word := [1, 12, 4, 4, 0, 8, 9], weights := [1, 0, 0, 1] }

def points118 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 2275, representative 7981.
def source119 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨78, by decide +kernel⟩

def target119 : Weights.Entry :=
  { word := [1, 12, 4, 4, 8, 8, 9], weights := [1, 0, 1, 0] }

def points119 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 2288, representative 8015.
def source120 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨112, by decide +kernel⟩

def target120 : Weights.Entry :=
  { word := [1, 12, 8, 4, 2, 8, 10], weights := [0, 0, 1, 0] }

def points120 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 2314, representative 8003.
def source121 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨100, by decide +kernel⟩

def target121 : Weights.Entry :=
  { word := [1, 12, 8, 4, 10, 8, 10], weights := [0, 0, 1, 0] }

def points121 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 2315, representative 8023.
def source122 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨120, by decide +kernel⟩

def target122 : Weights.Entry :=
  { word := [1, 12, 8, 4, 10, 8, 12], weights := [1, 0, 0, 1] }

def points122 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 2338, representative 7992.
def source123 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨89, by decide +kernel⟩

def target123 : Weights.Entry :=
  { word := [1, 12, 10, 0, 1, 8, 9], weights := [0, 1, 0, 1] }

def points123 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 2345, representative 7988.
def source124 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨85, by decide +kernel⟩

def target124 : Weights.Entry :=
  { word := [1, 12, 10, 0, 9, 8, 9], weights := [0, 1, 0, 1] }

def points124 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 2350, representative 8006.
def source125 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨103, by decide +kernel⟩

def target125 : Weights.Entry :=
  { word := [1, 12, 10, 8, 2, 8, 10], weights := [0, 1, 1, 0] }

def points125 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 2359, representative 7994.
def source126 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨91, by decide +kernel⟩

def target126 : Weights.Entry :=
  { word := [1, 12, 10, 8, 10, 8, 10], weights := [0, 1, 1, 0] }

def points126 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 2364, representative 7992.
def source127 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨89, by decide +kernel⟩

def target127 : Weights.Entry :=
  { word := [1, 12, 12, 4, 0, 8, 9], weights := [1, 0, 0, 1] }

def points127 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6), (7, 7), (8, 8)]

def period9Entries : List Weights.Entry := [target0, target1, target2, target3, target4, target5, target6, target7, target8, target9, target10, target11, target12, target13, target14, target15, target16, target17, target18, target19, target20, target21, target22, target23, target24, target25, target26, target27, target28, target29, target30, target31, target32, target33, target34, target35, target36, target37, target38, target39, target40, target41, target42, target43, target44, target45, target46, target47, target48, target49, target50, target51, target52, target53, target54, target55, target56, target57, target58, target59, target60, target61, target62, target63, target64, target65, target66, target67, target68, target69, target70, target71, target72, target73, target74, target75, target76, target77, target78, target79, target80, target81, target82, target83, target84, target85, target86, target87, target88, target89, target90, target91, target92, target93, target94, target95, target96, target97, target98, target99, target100, target101, target102, target103, target104, target105, target106, target107, target108, target109, target110, target111, target112, target113, target114, target115, target116, target117, target118, target119, target120, target121, target122, target123, target124, target125, target126, target127]

def period9Chunk : RowCoverage.Chunk where
  rows := [⟨563, target0⟩, ⟨577, target1⟩, ⟨587, target2⟩, ⟨601, target3⟩, ⟨613, target4⟩, ⟨627, target5⟩, ⟨633, target6⟩, ⟨645, target7⟩, ⟨671, target8⟩, ⟨672, target9⟩, ⟨695, target10⟩, ⟨702, target11⟩, ⟨707, target12⟩, ⟨716, target13⟩, ⟨721, target14⟩, ⟨735, target15⟩, ⟨823, target16⟩, ⟨849, target17⟩, ⟨850, target18⟩, ⟨902, target19⟩, ⟨903, target20⟩, ⟨924, target21⟩, ⟨925, target22⟩, ⟨950, target23⟩, ⟨951, target24⟩, ⟨952, target25⟩, ⟨965, target26⟩, ⟨966, target27⟩, ⟨967, target28⟩, ⟨979, target29⟩, ⟨980, target30⟩, ⟨981, target31⟩, ⟨993, target32⟩, ⟨994, target33⟩, ⟨995, target34⟩, ⟨1017, target35⟩, ⟨1025, target36⟩, ⟨1032, target37⟩, ⟨1039, target38⟩, ⟨1085, target39⟩, ⟨1086, target40⟩, ⟨1087, target41⟩, ⟨1093, target42⟩, ⟨1094, target43⟩, ⟨1095, target44⟩, ⟨1100, target45⟩, ⟨1101, target46⟩, ⟨1102, target47⟩, ⟨1107, target48⟩, ⟨1108, target49⟩, ⟨1109, target50⟩, ⟨1515, target51⟩, ⟨1516, target52⟩, ⟨1537, target53⟩, ⟨1538, target54⟩, ⟨1562, target55⟩, ⟨1576, target56⟩, ⟨1586, target57⟩, ⟨1600, target58⟩, ⟨1612, target59⟩, ⟨1626, target60⟩, ⟨1632, target61⟩, ⟨1644, target62⟩, ⟨1670, target63⟩, ⟨1671, target64⟩, ⟨1694, target65⟩, ⟨1701, target66⟩, ⟨1706, target67⟩, ⟨1715, target68⟩, ⟨1720, target69⟩, ⟨1734, target70⟩, ⟨1852, target71⟩, ⟨1866, target72⟩, ⟨1876, target73⟩, ⟨1890, target74⟩, ⟨1902, target75⟩, ⟨1916, target76⟩, ⟨1929, target77⟩, ⟨1955, target78⟩, ⟨1956, target79⟩, ⟨1979, target80⟩, ⟨1986, target81⟩, ⟨1991, target82⟩, ⟨2000, target83⟩, ⟨2005, target84⟩, ⟨2019, target85⟩, ⟨2032, target86⟩, ⟨2033, target87⟩, ⟨2054, target88⟩, ⟨2055, target89⟩, ⟨2080, target90⟩, ⟨2081, target91⟩, ⟨2082, target92⟩, ⟨2095, target93⟩, ⟨2096, target94⟩, ⟨2097, target95⟩, ⟨2109, target96⟩, ⟨2110, target97⟩, ⟨2111, target98⟩, ⟨2123, target99⟩, ⟨2124, target100⟩, ⟨2125, target101⟩, ⟨2167, target102⟩, ⟨2168, target103⟩, ⟨2169, target104⟩, ⟨2175, target105⟩, ⟨2176, target106⟩, ⟨2177, target107⟩, ⟨2182, target108⟩, ⟨2183, target109⟩, ⟨2184, target110⟩, ⟨2189, target111⟩, ⟨2190, target112⟩, ⟨2191, target113⟩, ⟨2211, target114⟩, ⟨2225, target115⟩, ⟨2235, target116⟩, ⟨2249, target117⟩, ⟨2261, target118⟩, ⟨2275, target119⟩, ⟨2288, target120⟩, ⟨2314, target121⟩, ⟨2315, target122⟩, ⟨2338, target123⟩, ⟨2345, target124⟩, ⟨2350, target125⟩, ⟨2359, target126⟩, ⟨2364, target127⟩]
  indexMask := 4449387433695233345330356726310272153557089888138176050539971757745882645534391663523912448736653756171786436000227003656165343631139836644831239427454246006532650760781880020494548339963572007179944037105830697955494018814815699415678330191206662181085428330481339812235075067916644434061303155115451142031343058725771249096346219580207796395532911967004059638579710451906046040015453326578917861902046098614291343695960333619992560402220864929242843260486694012252292652918368706634118447691970248928623823520971141091772087821973798141011092029191564742338414558958733405683319290114034580781730139990733464602117562982975827413530819913366894916460128194346530293016918542486519970930449372500144851100106752
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

end FranklSmallCyclic.TransportBatches.G062.B000.Data
