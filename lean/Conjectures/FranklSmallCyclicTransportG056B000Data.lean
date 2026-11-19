module

public import Conjectures.FranklSmallCyclicRowCoverage
public import Conjectures.FranklSmallCyclicCanonicalWords
public import Conjectures.FranklSmallCyclicOrbit9Block003Data

/-! 128 literal targets sharing one source proof block.
Original words and row indices are retained; weights may be transported.
-/
@[expose] public section

namespace FranklSmallCyclic.TransportBatches.G056.B000.Data

-- Period 9, original row 127, representative 7133.
def source0 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨1, by decide +kernel⟩

def target0 : Weights.Entry :=
  { word := [0, 1, 0, 9, 4, 4, 12], weights := [1, 0, 1, 1] }

-- Period 9, original row 193, representative 7135.
def source1 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨3, by decide +kernel⟩

def target1 : Weights.Entry :=
  { word := [0, 1, 4, 10, 8, 4, 12], weights := [1, 0, 1, 1] }

-- Period 9, original row 218, representative 7132.
def source2 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨0, by decide +kernel⟩

def target2 : Weights.Entry :=
  { word := [0, 1, 8, 9, 4, 4, 12], weights := [1, 0, 1, 1] }

-- Period 9, original row 286, representative 7134.
def source3 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨2, by decide +kernel⟩

def target3 : Weights.Entry :=
  { word := [0, 1, 12, 10, 8, 4, 12], weights := [1, 0, 1, 1] }

-- Period 9, original row 590, representative 7183.
def source4 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨50, by decide +kernel⟩

def target4 : Weights.Entry :=
  { word := [0, 4, 2, 8, 8, 4, 10], weights := [0, 1, 1, 0] }

-- Period 9, original row 654, representative 7190.
def source5 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨57, by decide +kernel⟩

def target5 : Weights.Entry :=
  { word := [0, 4, 8, 4, 8, 4, 10], weights := [1, 0, 1, 0] }

-- Period 9, original row 655, representative 7198.
def source6 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨65, by decide +kernel⟩

def target6 : Weights.Entry :=
  { word := [0, 4, 8, 4, 8, 4, 12], weights := [1, 0, 0, 1] }

-- Period 9, original row 682, representative 7191.
def source7 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨58, by decide +kernel⟩

def target7 : Weights.Entry :=
  { word := [0, 4, 8, 12, 8, 4, 10], weights := [1, 0, 1, 0] }

-- Period 9, original row 683, representative 7199.
def source8 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨66, by decide +kernel⟩

def target8 : Weights.Entry :=
  { word := [0, 4, 8, 12, 8, 4, 12], weights := [1, 0, 1, 0] }

-- Period 9, original row 710, representative 7182.
def source9 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨49, by decide +kernel⟩

def target9 : Weights.Entry :=
  { word := [0, 4, 10, 8, 8, 4, 10], weights := [0, 1, 1, 0] }

-- Period 9, original row 796, representative 7202.
def source10 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨69, by decide +kernel⟩

def target10 : Weights.Entry :=
  { word := [0, 8, 0, 0, 1, 4, 10], weights := [0, 0, 1, 1] }

-- Period 9, original row 797, representative 7202.
def source11 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨69, by decide +kernel⟩

def target11 : Weights.Entry :=
  { word := [0, 8, 0, 0, 1, 4, 12], weights := [0, 0, 1, 1] }

def points11 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 8), (8, 7)]

-- Period 9, original row 802, representative 7184.
def source12 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨51, by decide +kernel⟩

def target12 : Weights.Entry :=
  { word := [0, 8, 0, 0, 9, 4, 12], weights := [0, 0, 1, 1] }

-- Period 9, original row 808, representative 7202.
def source13 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨69, by decide +kernel⟩

def target13 : Weights.Entry :=
  { word := [0, 8, 0, 4, 0, 4, 10], weights := [0, 0, 1, 1] }

def points13 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 809, representative 7202.
def source14 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨69, by decide +kernel⟩

def target14 : Weights.Entry :=
  { word := [0, 8, 0, 4, 0, 4, 12], weights := [0, 0, 1, 1] }

def points14 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6), (7, 8), (8, 7)]

-- Period 9, original row 834, representative 7192.
def source15 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨59, by decide +kernel⟩

def target15 : Weights.Entry :=
  { word := [0, 8, 0, 4, 8, 4, 10], weights := [1, 0, 1, 0] }

-- Period 9, original row 835, representative 7200.
def source16 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨67, by decide +kernel⟩

def target16 : Weights.Entry :=
  { word := [0, 8, 0, 4, 8, 4, 12], weights := [1, 0, 0, 1] }

-- Period 9, original row 856, representative 7203.
def source17 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨70, by decide +kernel⟩

def target17 : Weights.Entry :=
  { word := [0, 8, 0, 8, 1, 4, 10], weights := [0, 1, 1, 0] }

-- Period 9, original row 857, representative 7203.
def source18 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨70, by decide +kernel⟩

def target18 : Weights.Entry :=
  { word := [0, 8, 0, 8, 1, 4, 12], weights := [0, 1, 1, 0] }

def points18 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 8), (8, 7)]

-- Period 9, original row 862, representative 7179.
def source19 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨46, by decide +kernel⟩

def target19 : Weights.Entry :=
  { word := [0, 8, 0, 8, 4, 4, 12], weights := [0, 1, 0, 1] }

-- Period 9, original row 865, representative 7204.
def source20 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨71, by decide +kernel⟩

def target20 : Weights.Entry :=
  { word := [0, 8, 0, 8, 8, 4, 12], weights := [0, 1, 0, 1] }

-- Period 9, original row 869, representative 7185.
def source21 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨52, by decide +kernel⟩

def target21 : Weights.Entry :=
  { word := [0, 8, 0, 8, 9, 4, 12], weights := [0, 1, 1, 0] }

-- Period 9, original row 873, representative 7177.
def source22 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨44, by decide +kernel⟩

def target22 : Weights.Entry :=
  { word := [0, 8, 0, 8, 12, 4, 12], weights := [0, 1, 0, 1] }

-- Period 9, original row 877, representative 7203.
def source23 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨70, by decide +kernel⟩

def target23 : Weights.Entry :=
  { word := [0, 8, 0, 12, 0, 4, 10], weights := [1, 0, 1, 0] }

def points23 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 878, representative 7203.
def source24 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨70, by decide +kernel⟩

def target24 : Weights.Entry :=
  { word := [0, 8, 0, 12, 0, 4, 12], weights := [1, 0, 1, 0] }

def points24 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6), (7, 8), (8, 7)]

-- Period 9, original row 886, representative 7193.
def source25 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨60, by decide +kernel⟩

def target25 : Weights.Entry :=
  { word := [0, 8, 0, 12, 8, 4, 10], weights := [1, 0, 1, 0] }

-- Period 9, original row 887, representative 7201.
def source26 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨68, by decide +kernel⟩

def target26 : Weights.Entry :=
  { word := [0, 8, 0, 12, 8, 4, 12], weights := [1, 0, 1, 0] }

-- Period 9, original row 909, representative 7186.
def source27 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨53, by decide +kernel⟩

def target27 : Weights.Entry :=
  { word := [0, 8, 1, 4, 8, 4, 10], weights := [1, 0, 1, 0] }

-- Period 9, original row 910, representative 7194.
def source28 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨61, by decide +kernel⟩

def target28 : Weights.Entry :=
  { word := [0, 8, 1, 4, 8, 4, 12], weights := [1, 0, 0, 1] }

-- Period 9, original row 932, representative 7189.
def source29 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨56, by decide +kernel⟩

def target29 : Weights.Entry :=
  { word := [0, 8, 1, 12, 8, 4, 10], weights := [1, 0, 1, 0] }

-- Period 9, original row 933, representative 7197.
def source30 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨64, by decide +kernel⟩

def target30 : Weights.Entry :=
  { word := [0, 8, 1, 12, 8, 4, 12], weights := [1, 0, 1, 0] }

-- Period 9, original row 1005, representative 7175.
def source31 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨42, by decide +kernel⟩

def target31 : Weights.Entry :=
  { word := [0, 8, 4, 8, 4, 4, 12], weights := [0, 1, 0, 1] }

-- Period 9, original row 1009, representative 7173.
def source32 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨40, by decide +kernel⟩

def target32 : Weights.Entry :=
  { word := [0, 8, 4, 8, 12, 4, 12], weights := [0, 1, 0, 1] }

-- Period 9, original row 1055, representative 7178.
def source33 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨45, by decide +kernel⟩

def target33 : Weights.Entry :=
  { word := [0, 8, 8, 8, 4, 4, 12], weights := [0, 1, 0, 1] }

-- Period 9, original row 1060, representative 7176.
def source34 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨43, by decide +kernel⟩

def target34 : Weights.Entry :=
  { word := [0, 8, 8, 8, 12, 4, 12], weights := [0, 1, 0, 1] }

-- Period 9, original row 1119, representative 7174.
def source35 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨41, by decide +kernel⟩

def target35 : Weights.Entry :=
  { word := [0, 8, 12, 8, 4, 4, 12], weights := [0, 1, 0, 1] }

-- Period 9, original row 1123, representative 7172.
def source36 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨39, by decide +kernel⟩

def target36 : Weights.Entry :=
  { word := [0, 8, 12, 8, 12, 4, 12], weights := [0, 1, 0, 1] }

-- Period 9, original row 1522, representative 7186.
def source37 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨53, by decide +kernel⟩

def target37 : Weights.Entry :=
  { word := [0, 12, 0, 4, 8, 4, 10], weights := [1, 0, 1, 0] }

def points37 : List (ℕ × ℕ) := [(0, 0), (1, 2), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 1523, representative 7194.
def source38 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨61, by decide +kernel⟩

def target38 : Weights.Entry :=
  { word := [0, 12, 0, 4, 8, 4, 12], weights := [1, 0, 0, 1] }

def points38 : List (ℕ × ℕ) := [(0, 0), (1, 2), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 1545, representative 7189.
def source39 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨56, by decide +kernel⟩

def target39 : Weights.Entry :=
  { word := [0, 12, 0, 12, 8, 4, 10], weights := [1, 0, 1, 0] }

def points39 : List (ℕ × ℕ) := [(0, 0), (1, 2), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 1546, representative 7197.
def source40 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨64, by decide +kernel⟩

def target40 : Weights.Entry :=
  { word := [0, 12, 0, 12, 8, 4, 12], weights := [1, 0, 1, 0] }

def points40 : List (ℕ × ℕ) := [(0, 0), (1, 2), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 1589, representative 7181.
def source41 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨48, by decide +kernel⟩

def target41 : Weights.Entry :=
  { word := [0, 12, 2, 8, 8, 4, 10], weights := [0, 1, 1, 0] }

-- Period 9, original row 1653, representative 7187.
def source42 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨54, by decide +kernel⟩

def target42 : Weights.Entry :=
  { word := [0, 12, 8, 4, 8, 4, 10], weights := [1, 0, 1, 0] }

-- Period 9, original row 1654, representative 7195.
def source43 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨62, by decide +kernel⟩

def target43 : Weights.Entry :=
  { word := [0, 12, 8, 4, 8, 4, 12], weights := [1, 0, 0, 1] }

-- Period 9, original row 1681, representative 7188.
def source44 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨55, by decide +kernel⟩

def target44 : Weights.Entry :=
  { word := [0, 12, 8, 12, 8, 4, 10], weights := [1, 0, 1, 0] }

-- Period 9, original row 1682, representative 7196.
def source45 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨63, by decide +kernel⟩

def target45 : Weights.Entry :=
  { word := [0, 12, 8, 12, 8, 4, 12], weights := [1, 0, 1, 0] }

-- Period 9, original row 1709, representative 7180.
def source46 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨47, by decide +kernel⟩

def target46 : Weights.Entry :=
  { word := [0, 12, 10, 8, 8, 4, 10], weights := [0, 1, 1, 0] }

-- Period 9, original row 1879, representative 7183.
def source47 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨50, by decide +kernel⟩

def target47 : Weights.Entry :=
  { word := [1, 4, 2, 8, 8, 4, 10], weights := [0, 1, 1, 0] }

def points47 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 1938, representative 7190.
def source48 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨57, by decide +kernel⟩

def target48 : Weights.Entry :=
  { word := [1, 4, 8, 4, 8, 4, 10], weights := [1, 0, 1, 0] }

def points48 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 1939, representative 7198.
def source49 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨65, by decide +kernel⟩

def target49 : Weights.Entry :=
  { word := [1, 4, 8, 4, 8, 4, 12], weights := [1, 0, 0, 1] }

def points49 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 1966, representative 7191.
def source50 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨58, by decide +kernel⟩

def target50 : Weights.Entry :=
  { word := [1, 4, 8, 12, 8, 4, 10], weights := [1, 0, 1, 0] }

def points50 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 1967, representative 7199.
def source51 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨66, by decide +kernel⟩

def target51 : Weights.Entry :=
  { word := [1, 4, 8, 12, 8, 4, 12], weights := [1, 0, 1, 0] }

def points51 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 1994, representative 7182.
def source52 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨49, by decide +kernel⟩

def target52 : Weights.Entry :=
  { word := [1, 4, 10, 8, 8, 4, 10], weights := [0, 1, 1, 0] }

def points52 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 2039, representative 7186.
def source53 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨53, by decide +kernel⟩

def target53 : Weights.Entry :=
  { word := [1, 8, 1, 4, 8, 4, 10], weights := [1, 0, 1, 0] }

def points53 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 2040, representative 7194.
def source54 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨61, by decide +kernel⟩

def target54 : Weights.Entry :=
  { word := [1, 8, 1, 4, 8, 4, 12], weights := [1, 0, 0, 1] }

def points54 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 2062, representative 7189.
def source55 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨56, by decide +kernel⟩

def target55 : Weights.Entry :=
  { word := [1, 8, 1, 12, 8, 4, 10], weights := [1, 0, 1, 0] }

def points55 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 2063, representative 7197.
def source56 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨64, by decide +kernel⟩

def target56 : Weights.Entry :=
  { word := [1, 8, 1, 12, 8, 4, 12], weights := [1, 0, 1, 0] }

def points56 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 2238, representative 7181.
def source57 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨48, by decide +kernel⟩

def target57 : Weights.Entry :=
  { word := [1, 12, 2, 8, 8, 4, 10], weights := [0, 1, 1, 0] }

def points57 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 2297, representative 7187.
def source58 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨54, by decide +kernel⟩

def target58 : Weights.Entry :=
  { word := [1, 12, 8, 4, 8, 4, 10], weights := [1, 0, 1, 0] }

def points58 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 2298, representative 7195.
def source59 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨62, by decide +kernel⟩

def target59 : Weights.Entry :=
  { word := [1, 12, 8, 4, 8, 4, 12], weights := [1, 0, 0, 1] }

def points59 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 2325, representative 7188.
def source60 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨55, by decide +kernel⟩

def target60 : Weights.Entry :=
  { word := [1, 12, 8, 12, 8, 4, 10], weights := [1, 0, 1, 0] }

def points60 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 2326, representative 7196.
def source61 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨63, by decide +kernel⟩

def target61 : Weights.Entry :=
  { word := [1, 12, 8, 12, 8, 4, 12], weights := [1, 0, 1, 0] }

def points61 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 2353, representative 7180.
def source62 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨47, by decide +kernel⟩

def target62 : Weights.Entry :=
  { word := [1, 12, 10, 8, 8, 4, 10], weights := [0, 1, 1, 0] }

def points62 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 3184, representative 7260.
def source63 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨126, by decide +kernel⟩

def target63 : Weights.Entry :=
  { word := [2, 10, 0, 9, 8, 9, 12], weights := [1, 1, 0, 1] }

-- Period 9, original row 3186, representative 7258.
def source64 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨124, by decide +kernel⟩

def target64 : Weights.Entry :=
  { word := [2, 10, 0, 9, 8, 10, 10], weights := [1, 1, 0, 1] }

-- Period 9, original row 3192, representative 7256.
def source65 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨122, by decide +kernel⟩

def target65 : Weights.Entry :=
  { word := [2, 10, 0, 10, 0, 0, 10], weights := [1, 1, 0, 0] }

-- Period 9, original row 3193, representative 7256.
def source66 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨122, by decide +kernel⟩

def target66 : Weights.Entry :=
  { word := [2, 10, 0, 10, 0, 0, 12], weights := [1, 1, 0, 0] }

def points66 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 8), (8, 7)]

-- Period 9, original row 3199, representative 7252.
def source67 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨118, by decide +kernel⟩

def target67 : Weights.Entry :=
  { word := [2, 10, 0, 10, 0, 8, 12], weights := [1, 0, 0, 1] }

-- Period 9, original row 3201, representative 7255.
def source68 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨121, by decide +kernel⟩

def target68 : Weights.Entry :=
  { word := [2, 10, 0, 10, 8, 0, 12], weights := [1, 1, 0, 0] }

-- Period 9, original row 3203, representative 7249.
def source69 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨115, by decide +kernel⟩

def target69 : Weights.Entry :=
  { word := [2, 10, 0, 10, 8, 8, 12], weights := [1, 0, 0, 1] }

-- Period 9, original row 3259, representative 7250.
def source70 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨116, by decide +kernel⟩

def target70 : Weights.Entry :=
  { word := [2, 10, 8, 2, 0, 8, 10], weights := [1, 0, 0, 1] }

-- Period 9, original row 3260, representative 7250.
def source71 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨116, by decide +kernel⟩

def target71 : Weights.Entry :=
  { word := [2, 10, 8, 2, 0, 8, 12], weights := [1, 0, 0, 1] }

def points71 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 8), (8, 7)]

-- Period 9, original row 3266, representative 7253.
def source72 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨119, by decide +kernel⟩

def target72 : Weights.Entry :=
  { word := [2, 10, 8, 2, 8, 0, 12], weights := [1, 0, 0, 1] }

-- Period 9, original row 3270, representative 7247.
def source73 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨113, by decide +kernel⟩

def target73 : Weights.Entry :=
  { word := [2, 10, 8, 2, 8, 8, 12], weights := [1, 0, 0, 1] }

-- Period 9, original row 3290, representative 7261.
def source74 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨127, by decide +kernel⟩

def target74 : Weights.Entry :=
  { word := [2, 10, 8, 9, 8, 2, 10], weights := [1, 1, 0, 1] }

-- Period 9, original row 3295, representative 7259.
def source75 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨125, by decide +kernel⟩

def target75 : Weights.Entry :=
  { word := [2, 10, 8, 9, 8, 9, 12], weights := [1, 1, 0, 1] }

-- Period 9, original row 3297, representative 7257.
def source76 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨123, by decide +kernel⟩

def target76 : Weights.Entry :=
  { word := [2, 10, 8, 9, 8, 10, 10], weights := [1, 1, 0, 1] }

-- Period 9, original row 3309, representative 7251.
def source77 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨117, by decide +kernel⟩

def target77 : Weights.Entry :=
  { word := [2, 10, 8, 10, 0, 8, 10], weights := [1, 0, 0, 1] }

-- Period 9, original row 3310, representative 7251.
def source78 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨117, by decide +kernel⟩

def target78 : Weights.Entry :=
  { word := [2, 10, 8, 10, 0, 8, 12], weights := [1, 0, 0, 1] }

def points78 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 8), (8, 7)]

-- Period 9, original row 3317, representative 7254.
def source79 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨120, by decide +kernel⟩

def target79 : Weights.Entry :=
  { word := [2, 10, 8, 10, 8, 0, 12], weights := [1, 1, 0, 0] }

-- Period 9, original row 3323, representative 7248.
def source80 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨114, by decide +kernel⟩

def target80 : Weights.Entry :=
  { word := [2, 10, 8, 10, 8, 8, 12], weights := [1, 0, 0, 1] }

-- Period 9, original row 3985, representative 7260.
def source81 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨126, by decide +kernel⟩

def target81 : Weights.Entry :=
  { word := [4, 10, 0, 9, 8, 9, 12], weights := [1, 1, 0, 1] }

def points81 : List (ℕ × ℕ) := [(0, 0), (1, 2), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 3987, representative 7258.
def source82 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨124, by decide +kernel⟩

def target82 : Weights.Entry :=
  { word := [4, 10, 0, 9, 8, 10, 10], weights := [1, 1, 0, 1] }

def points82 : List (ℕ × ℕ) := [(0, 0), (1, 2), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 3989, representative 7255.
def source83 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨121, by decide +kernel⟩

def target83 : Weights.Entry :=
  { word := [4, 10, 0, 10, 8, 0, 12], weights := [1, 1, 0, 0] }

def points83 : List (ℕ × ℕ) := [(0, 0), (1, 2), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 3991, representative 7249.
def source84 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨115, by decide +kernel⟩

def target84 : Weights.Entry :=
  { word := [4, 10, 0, 10, 8, 8, 12], weights := [1, 0, 0, 1] }

def points84 : List (ℕ × ℕ) := [(0, 0), (1, 2), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 4011, representative 7245.
def source85 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨111, by decide +kernel⟩

def target85 : Weights.Entry :=
  { word := [4, 10, 8, 2, 8, 8, 12], weights := [1, 0, 0, 1] }

-- Period 9, original row 4029, representative 7246.
def source86 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨112, by decide +kernel⟩

def target86 : Weights.Entry :=
  { word := [4, 10, 8, 10, 8, 8, 12], weights := [1, 0, 0, 1] }

-- Period 9, original row 4106, representative 7166.
def source87 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨33, by decide +kernel⟩

def target87 : Weights.Entry :=
  { word := [8, 0, 0, 9, 4, 4, 12], weights := [1, 0, 1, 1] }

-- Period 9, original row 4110, representative 7162.
def source88 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨29, by decide +kernel⟩

def target88 : Weights.Entry :=
  { word := [8, 0, 0, 9, 12, 4, 12], weights := [1, 0, 1, 1] }

-- Period 9, original row 4118, representative 7158.
def source89 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨25, by decide +kernel⟩

def target89 : Weights.Entry :=
  { word := [8, 0, 0, 12, 0, 4, 10], weights := [1, 0, 1, 0] }

-- Period 9, original row 4119, representative 7158.
def source90 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨25, by decide +kernel⟩

def target90 : Weights.Entry :=
  { word := [8, 0, 0, 12, 0, 4, 12], weights := [1, 0, 1, 0] }

def points90 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 8), (8, 7)]

-- Period 9, original row 4140, representative 7137.
def source91 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨4, by decide +kernel⟩

def target91 : Weights.Entry :=
  { word := [8, 0, 1, 4, 8, 4, 10], weights := [1, 0, 1, 0] }

-- Period 9, original row 4141, representative 7147.
def source92 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨14, by decide +kernel⟩

def target92 : Weights.Entry :=
  { word := [8, 0, 1, 4, 8, 4, 12], weights := [1, 0, 0, 1] }

-- Period 9, original row 4176, representative 7144.
def source93 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨11, by decide +kernel⟩

def target93 : Weights.Entry :=
  { word := [8, 0, 1, 12, 8, 4, 10], weights := [1, 0, 1, 0] }

-- Period 9, original row 4177, representative 7154.
def source94 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨21, by decide +kernel⟩

def target94 : Weights.Entry :=
  { word := [8, 0, 1, 12, 8, 4, 12], weights := [1, 0, 1, 0] }

-- Period 9, original row 4306, representative 7170.
def source95 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨37, by decide +kernel⟩

def target95 : Weights.Entry :=
  { word := [8, 0, 4, 10, 8, 4, 12], weights := [1, 0, 1, 1] }

-- Period 9, original row 4365, representative 7165.
def source96 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨32, by decide +kernel⟩

def target96 : Weights.Entry :=
  { word := [8, 0, 8, 9, 4, 4, 12], weights := [1, 0, 1, 1] }

-- Period 9, original row 4369, representative 7161.
def source97 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨28, by decide +kernel⟩

def target97 : Weights.Entry :=
  { word := [8, 0, 8, 9, 12, 4, 12], weights := [1, 0, 1, 1] }

-- Period 9, original row 4464, representative 7171.
def source98 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨38, by decide +kernel⟩

def target98 : Weights.Entry :=
  { word := [8, 0, 12, 10, 0, 4, 10], weights := [1, 0, 1, 1] }

-- Period 9, original row 4465, representative 7171.
def source99 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨38, by decide +kernel⟩

def target99 : Weights.Entry :=
  { word := [8, 0, 12, 10, 0, 4, 12], weights := [1, 0, 1, 1] }

def points99 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 8), (8, 7)]

-- Period 9, original row 4482, representative 7169.
def source100 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨36, by decide +kernel⟩

def target100 : Weights.Entry :=
  { word := [8, 0, 12, 10, 8, 4, 12], weights := [1, 0, 1, 1] }

-- Period 9, original row 5019, representative 7137.
def source101 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨4, by decide +kernel⟩

def target101 : Weights.Entry :=
  { word := [8, 4, 0, 4, 8, 4, 10], weights := [1, 0, 1, 0] }

def points101 : List (ℕ × ℕ) := [(0, 0), (1, 2), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 5020, representative 7147.
def source102 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨14, by decide +kernel⟩

def target102 : Weights.Entry :=
  { word := [8, 4, 0, 4, 8, 4, 12], weights := [1, 0, 0, 1] }

def points102 : List (ℕ × ℕ) := [(0, 0), (1, 2), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 5055, representative 7144.
def source103 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨11, by decide +kernel⟩

def target103 : Weights.Entry :=
  { word := [8, 4, 0, 12, 8, 4, 10], weights := [1, 0, 1, 0] }

def points103 : List (ℕ × ℕ) := [(0, 0), (1, 2), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 5056, representative 7154.
def source104 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨21, by decide +kernel⟩

def target104 : Weights.Entry :=
  { word := [8, 4, 0, 12, 8, 4, 12], weights := [1, 0, 1, 0] }

def points104 : List (ℕ × ℕ) := [(0, 0), (1, 2), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 5176, representative 7142.
def source105 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨9, by decide +kernel⟩

def target105 : Weights.Entry :=
  { word := [8, 4, 8, 4, 8, 4, 10], weights := [1, 0, 1, 0] }

-- Period 9, original row 5177, representative 7152.
def source106 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨19, by decide +kernel⟩

def target106 : Weights.Entry :=
  { word := [8, 4, 8, 4, 8, 4, 12], weights := [1, 0, 0, 1] }

-- Period 9, original row 5218, representative 7143.
def source107 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨10, by decide +kernel⟩

def target107 : Weights.Entry :=
  { word := [8, 4, 8, 12, 8, 4, 10], weights := [1, 0, 1, 0] }

-- Period 9, original row 5219, representative 7153.
def source108 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨20, by decide +kernel⟩

def target108 : Weights.Entry :=
  { word := [8, 4, 8, 12, 8, 4, 12], weights := [1, 0, 1, 0] }

-- Period 9, original row 5362, representative 7145.
def source109 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨12, by decide +kernel⟩

def target109 : Weights.Entry :=
  { word := [8, 8, 0, 4, 8, 4, 10], weights := [1, 0, 1, 0] }

-- Period 9, original row 5363, representative 7155.
def source110 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨22, by decide +kernel⟩

def target110 : Weights.Entry :=
  { word := [8, 8, 0, 4, 8, 4, 12], weights := [1, 0, 0, 1] }

-- Period 9, original row 5386, representative 7164.
def source111 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨31, by decide +kernel⟩

def target111 : Weights.Entry :=
  { word := [8, 8, 0, 9, 4, 4, 12], weights := [1, 1, 1, 1] }

-- Period 9, original row 5390, representative 7160.
def source112 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨27, by decide +kernel⟩

def target112 : Weights.Entry :=
  { word := [8, 8, 0, 9, 12, 4, 12], weights := [1, 1, 1, 1] }

-- Period 9, original row 5400, representative 7157.
def source113 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨24, by decide +kernel⟩

def target113 : Weights.Entry :=
  { word := [8, 8, 0, 12, 0, 4, 10], weights := [1, 0, 1, 0] }

-- Period 9, original row 5401, representative 7157.
def source114 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨24, by decide +kernel⟩

def target114 : Weights.Entry :=
  { word := [8, 8, 0, 12, 0, 4, 12], weights := [1, 0, 1, 0] }

def points114 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 8), (8, 7)]

-- Period 9, original row 5425, representative 7146.
def source115 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨13, by decide +kernel⟩

def target115 : Weights.Entry :=
  { word := [8, 8, 0, 12, 8, 4, 10], weights := [1, 0, 1, 0] }

-- Period 9, original row 5426, representative 7156.
def source116 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨23, by decide +kernel⟩

def target116 : Weights.Entry :=
  { word := [8, 8, 0, 12, 8, 4, 12], weights := [1, 0, 1, 0] }

-- Period 9, original row 5461, representative 7138.
def source117 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨5, by decide +kernel⟩

def target117 : Weights.Entry :=
  { word := [8, 8, 1, 4, 8, 4, 10], weights := [1, 0, 1, 0] }

-- Period 9, original row 5462, representative 7148.
def source118 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨15, by decide +kernel⟩

def target118 : Weights.Entry :=
  { word := [8, 8, 1, 4, 8, 4, 12], weights := [1, 0, 0, 1] }

-- Period 9, original row 5497, representative 7141.
def source119 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨8, by decide +kernel⟩

def target119 : Weights.Entry :=
  { word := [8, 8, 1, 12, 8, 4, 10], weights := [1, 0, 1, 0] }

-- Period 9, original row 5498, representative 7151.
def source120 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨18, by decide +kernel⟩

def target120 : Weights.Entry :=
  { word := [8, 8, 1, 12, 8, 4, 12], weights := [1, 0, 1, 0] }

-- Period 9, original row 5629, representative 7168.
def source121 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨35, by decide +kernel⟩

def target121 : Weights.Entry :=
  { word := [8, 8, 4, 10, 8, 4, 12], weights := [1, 1, 1, 1] }

-- Period 9, original row 5714, representative 7163.
def source122 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨30, by decide +kernel⟩

def target122 : Weights.Entry :=
  { word := [8, 8, 8, 9, 4, 4, 12], weights := [1, 1, 1, 1] }

-- Period 9, original row 5718, representative 7159.
def source123 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨26, by decide +kernel⟩

def target123 : Weights.Entry :=
  { word := [8, 8, 8, 9, 12, 4, 12], weights := [1, 1, 1, 1] }

-- Period 9, original row 5836, representative 7167.
def source124 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨34, by decide +kernel⟩

def target124 : Weights.Entry :=
  { word := [8, 8, 12, 10, 8, 4, 12], weights := [1, 1, 1, 1] }

-- Period 9, original row 6349, representative 7138.
def source125 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨5, by decide +kernel⟩

def target125 : Weights.Entry :=
  { word := [8, 12, 0, 4, 8, 4, 10], weights := [1, 0, 1, 0] }

def points125 : List (ℕ × ℕ) := [(0, 0), (1, 2), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 6350, representative 7148.
def source126 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨15, by decide +kernel⟩

def target126 : Weights.Entry :=
  { word := [8, 12, 0, 4, 8, 4, 12], weights := [1, 0, 0, 1] }

def points126 : List (ℕ × ℕ) := [(0, 0), (1, 2), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 6385, representative 7141.
def source127 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨8, by decide +kernel⟩

def target127 : Weights.Entry :=
  { word := [8, 12, 0, 12, 8, 4, 10], weights := [1, 0, 1, 0] }

def points127 : List (ℕ × ℕ) := [(0, 0), (1, 2), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

def period9Entries : List Weights.Entry := [target0, target1, target2, target3, target4, target5, target6, target7, target8, target9, target10, target11, target12, target13, target14, target15, target16, target17, target18, target19, target20, target21, target22, target23, target24, target25, target26, target27, target28, target29, target30, target31, target32, target33, target34, target35, target36, target37, target38, target39, target40, target41, target42, target43, target44, target45, target46, target47, target48, target49, target50, target51, target52, target53, target54, target55, target56, target57, target58, target59, target60, target61, target62, target63, target64, target65, target66, target67, target68, target69, target70, target71, target72, target73, target74, target75, target76, target77, target78, target79, target80, target81, target82, target83, target84, target85, target86, target87, target88, target89, target90, target91, target92, target93, target94, target95, target96, target97, target98, target99, target100, target101, target102, target103, target104, target105, target106, target107, target108, target109, target110, target111, target112, target113, target114, target115, target116, target117, target118, target119, target120, target121, target122, target123, target124, target125, target126, target127]

def period9Chunk : RowCoverage.Chunk where
  rows := [⟨127, target0⟩, ⟨193, target1⟩, ⟨218, target2⟩, ⟨286, target3⟩, ⟨590, target4⟩, ⟨654, target5⟩, ⟨655, target6⟩, ⟨682, target7⟩, ⟨683, target8⟩, ⟨710, target9⟩, ⟨796, target10⟩, ⟨797, target11⟩, ⟨802, target12⟩, ⟨808, target13⟩, ⟨809, target14⟩, ⟨834, target15⟩, ⟨835, target16⟩, ⟨856, target17⟩, ⟨857, target18⟩, ⟨862, target19⟩, ⟨865, target20⟩, ⟨869, target21⟩, ⟨873, target22⟩, ⟨877, target23⟩, ⟨878, target24⟩, ⟨886, target25⟩, ⟨887, target26⟩, ⟨909, target27⟩, ⟨910, target28⟩, ⟨932, target29⟩, ⟨933, target30⟩, ⟨1005, target31⟩, ⟨1009, target32⟩, ⟨1055, target33⟩, ⟨1060, target34⟩, ⟨1119, target35⟩, ⟨1123, target36⟩, ⟨1522, target37⟩, ⟨1523, target38⟩, ⟨1545, target39⟩, ⟨1546, target40⟩, ⟨1589, target41⟩, ⟨1653, target42⟩, ⟨1654, target43⟩, ⟨1681, target44⟩, ⟨1682, target45⟩, ⟨1709, target46⟩, ⟨1879, target47⟩, ⟨1938, target48⟩, ⟨1939, target49⟩, ⟨1966, target50⟩, ⟨1967, target51⟩, ⟨1994, target52⟩, ⟨2039, target53⟩, ⟨2040, target54⟩, ⟨2062, target55⟩, ⟨2063, target56⟩, ⟨2238, target57⟩, ⟨2297, target58⟩, ⟨2298, target59⟩, ⟨2325, target60⟩, ⟨2326, target61⟩, ⟨2353, target62⟩, ⟨3184, target63⟩, ⟨3186, target64⟩, ⟨3192, target65⟩, ⟨3193, target66⟩, ⟨3199, target67⟩, ⟨3201, target68⟩, ⟨3203, target69⟩, ⟨3259, target70⟩, ⟨3260, target71⟩, ⟨3266, target72⟩, ⟨3270, target73⟩, ⟨3290, target74⟩, ⟨3295, target75⟩, ⟨3297, target76⟩, ⟨3309, target77⟩, ⟨3310, target78⟩, ⟨3317, target79⟩, ⟨3323, target80⟩, ⟨3985, target81⟩, ⟨3987, target82⟩, ⟨3989, target83⟩, ⟨3991, target84⟩, ⟨4011, target85⟩, ⟨4029, target86⟩, ⟨4106, target87⟩, ⟨4110, target88⟩, ⟨4118, target89⟩, ⟨4119, target90⟩, ⟨4140, target91⟩, ⟨4141, target92⟩, ⟨4176, target93⟩, ⟨4177, target94⟩, ⟨4306, target95⟩, ⟨4365, target96⟩, ⟨4369, target97⟩, ⟨4464, target98⟩, ⟨4465, target99⟩, ⟨4482, target100⟩, ⟨5019, target101⟩, ⟨5020, target102⟩, ⟨5055, target103⟩, ⟨5056, target104⟩, ⟨5176, target105⟩, ⟨5177, target106⟩, ⟨5218, target107⟩, ⟨5219, target108⟩, ⟨5362, target109⟩, ⟨5363, target110⟩, ⟨5386, target111⟩, ⟨5390, target112⟩, ⟨5400, target113⟩, ⟨5401, target114⟩, ⟨5425, target115⟩, ⟨5426, target116⟩, ⟨5461, target117⟩, ⟨5462, target118⟩, ⟨5497, target119⟩, ⟨5498, target120⟩, ⟨5629, target121⟩, ⟨5714, target122⟩, ⟨5718, target123⟩, ⟨5836, target124⟩, ⟨6349, target125⟩, ⟨6350, target126⟩, ⟨6385, target127⟩]
  indexMask := 119267554529231333571467003679419126163074310916742119186788143045778407555960367026645872807763058830974238405091660293306749373768584429772787453037079943853492348556568565726346559774373698580921376155049951928224410613950555837026538312184658604346794376141461323394614254090003477247298516273998711330586006432277034313675969609617077472658417868307691011973579231929390785786112883127205660958165934101971887768001291406288244741372877576056126425462833024747493810395959078650932694778239144979795627796157288340266989425844995479603244124604259626676289250250075285303229495048886223480784221234520564955001666341291817053716411662271313928516389155996489970664882258132788597703167374738668643334954038581499425801507314331195899640051451452605864086612716238111380658518546071069422061321810904879740905773929936062970979895173845994376332554483727371466575335840378163883919696921044690966402150166046672905566429892591861989506671704333411705733766110108134661950098991496367735178413163225043612881245332083696988567201281894071082172939104183736732687838782328570136667259006873671247495002144315456539784398563315623118015392851469343211071989871920376107359319339503883057537241736470574678827999840587858355230675170280717453626219643202502615261957431786710111824238305255870941193029772058530973824511613523275376053647989088971204323570366305819060750909428751469953714914894551819741900252330162053651796039560556287773635875791632100938539910642855496141329484130787578950854146520956945321246938378508727265526052253400164043114866896593216349794830476818386330293342048961773318787849289666926223782662441851159247196593851119364592090877214873314127366729466195961724330142034131461734050163811264613837654729548426764945296243062273155055135914041505015839170671604321252815844393394790077884063554429738442864471399389124988478249726675254021011164100331341073955673948609182043824843861694349312
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

end FranklSmallCyclic.TransportBatches.G056.B000.Data
