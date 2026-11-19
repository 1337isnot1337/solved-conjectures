module

public import Conjectures.FranklSmallCyclicRowCoverage
public import Conjectures.FranklSmallCyclicCanonicalWords
public import Conjectures.FranklSmallCyclicOrbit8Block006Data

/-! 128 literal targets sharing one source proof block.
Original words and row indices are retained; weights may be transported.
-/
@[expose] public section

namespace FranklSmallCyclic.TransportBatches.G032.B000.Data

-- Period 8, original row 17, representative 4113.
def source0 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B006.Data.entryAt ⟨31, by decide +kernel⟩

def target0 : Weights.Entry :=
  { word := [0, 0, 1, 4, 8, 4, 10], weights := [1, 0, 1, 0] }

-- Period 8, original row 18, representative 4125.
def source1 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B006.Data.entryAt ⟨43, by decide +kernel⟩

def target1 : Weights.Entry :=
  { word := [0, 0, 1, 4, 8, 4, 12], weights := [1, 0, 0, 1] }

-- Period 8, original row 40, representative 4116.
def source2 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B006.Data.entryAt ⟨34, by decide +kernel⟩

def target2 : Weights.Entry :=
  { word := [0, 0, 1, 12, 8, 4, 10], weights := [1, 0, 1, 0] }

-- Period 8, original row 41, representative 4128.
def source3 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B006.Data.entryAt ⟨46, by decide +kernel⟩

def target3 : Weights.Entry :=
  { word := [0, 0, 1, 12, 8, 4, 12], weights := [1, 0, 1, 0] }

-- Period 8, original row 590, representative 4088.
def source4 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B006.Data.entryAt ⟨6, by decide +kernel⟩

def target4 : Weights.Entry :=
  { word := [0, 4, 2, 8, 8, 4, 10], weights := [0, 1, 1, 0] }

-- Period 8, original row 654, representative 4111.
def source5 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B006.Data.entryAt ⟨29, by decide +kernel⟩

def target5 : Weights.Entry :=
  { word := [0, 4, 8, 4, 8, 4, 10], weights := [1, 0, 1, 0] }

-- Period 8, original row 655, representative 4123.
def source6 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B006.Data.entryAt ⟨41, by decide +kernel⟩

def target6 : Weights.Entry :=
  { word := [0, 4, 8, 4, 8, 4, 12], weights := [1, 0, 0, 1] }

-- Period 8, original row 682, representative 4112.
def source7 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B006.Data.entryAt ⟨30, by decide +kernel⟩

def target7 : Weights.Entry :=
  { word := [0, 4, 8, 12, 8, 4, 10], weights := [1, 0, 1, 0] }

-- Period 8, original row 683, representative 4124.
def source8 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B006.Data.entryAt ⟨42, by decide +kernel⟩

def target8 : Weights.Entry :=
  { word := [0, 4, 8, 12, 8, 4, 12], weights := [1, 0, 1, 0] }

-- Period 8, original row 710, representative 4087.
def source9 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B006.Data.entryAt ⟨5, by decide +kernel⟩

def target9 : Weights.Entry :=
  { word := [0, 4, 10, 8, 8, 4, 10], weights := [0, 1, 1, 0] }

-- Period 8, original row 796, representative 4131.
def source10 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B006.Data.entryAt ⟨49, by decide +kernel⟩

def target10 : Weights.Entry :=
  { word := [0, 8, 0, 0, 1, 4, 10], weights := [0, 0, 1, 1] }

-- Period 8, original row 797, representative 4131.
def source11 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B006.Data.entryAt ⟨49, by decide +kernel⟩

def target11 : Weights.Entry :=
  { word := [0, 8, 0, 0, 1, 4, 12], weights := [0, 0, 1, 1] }

def points11 : List (ℕ × ℕ) := [(0, 7), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 0)]

-- Period 8, original row 802, representative 4105.
def source12 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B006.Data.entryAt ⟨23, by decide +kernel⟩

def target12 : Weights.Entry :=
  { word := [0, 8, 0, 0, 9, 4, 12], weights := [0, 0, 1, 1] }

-- Period 8, original row 808, representative 4131.
def source13 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B006.Data.entryAt ⟨49, by decide +kernel⟩

def target13 : Weights.Entry :=
  { word := [0, 8, 0, 4, 0, 4, 10], weights := [0, 0, 1, 1] }

def points13 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6), (7, 7)]

-- Period 8, original row 809, representative 4131.
def source14 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B006.Data.entryAt ⟨49, by decide +kernel⟩

def target14 : Weights.Entry :=
  { word := [0, 8, 0, 4, 0, 4, 12], weights := [0, 0, 1, 1] }

def points14 : List (ℕ × ℕ) := [(0, 7), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6), (7, 0)]

-- Period 8, original row 834, representative 4117.
def source15 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B006.Data.entryAt ⟨35, by decide +kernel⟩

def target15 : Weights.Entry :=
  { word := [0, 8, 0, 4, 8, 4, 10], weights := [1, 0, 1, 0] }

-- Period 8, original row 835, representative 4129.
def source16 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B006.Data.entryAt ⟨47, by decide +kernel⟩

def target16 : Weights.Entry :=
  { word := [0, 8, 0, 4, 8, 4, 12], weights := [1, 0, 0, 1] }

-- Period 8, original row 856, representative 4132.
def source17 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B006.Data.entryAt ⟨50, by decide +kernel⟩

def target17 : Weights.Entry :=
  { word := [0, 8, 0, 8, 1, 4, 10], weights := [0, 1, 1, 0] }

-- Period 8, original row 857, representative 4132.
def source18 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B006.Data.entryAt ⟨50, by decide +kernel⟩

def target18 : Weights.Entry :=
  { word := [0, 8, 0, 8, 1, 4, 12], weights := [0, 1, 1, 0] }

def points18 : List (ℕ × ℕ) := [(0, 7), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 0)]

-- Period 8, original row 865, representative 4133.
def source19 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B006.Data.entryAt ⟨51, by decide +kernel⟩

def target19 : Weights.Entry :=
  { word := [0, 8, 0, 8, 8, 4, 12], weights := [0, 1, 0, 1] }

-- Period 8, original row 869, representative 4106.
def source20 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B006.Data.entryAt ⟨24, by decide +kernel⟩

def target20 : Weights.Entry :=
  { word := [0, 8, 0, 8, 9, 4, 12], weights := [0, 1, 1, 0] }

-- Period 8, original row 877, representative 4132.
def source21 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B006.Data.entryAt ⟨50, by decide +kernel⟩

def target21 : Weights.Entry :=
  { word := [0, 8, 0, 12, 0, 4, 10], weights := [1, 0, 1, 0] }

def points21 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6), (7, 7)]

-- Period 8, original row 878, representative 4132.
def source22 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B006.Data.entryAt ⟨50, by decide +kernel⟩

def target22 : Weights.Entry :=
  { word := [0, 8, 0, 12, 0, 4, 12], weights := [1, 0, 1, 0] }

def points22 : List (ℕ × ℕ) := [(0, 7), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6), (7, 0)]

-- Period 8, original row 886, representative 4118.
def source23 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B006.Data.entryAt ⟨36, by decide +kernel⟩

def target23 : Weights.Entry :=
  { word := [0, 8, 0, 12, 8, 4, 10], weights := [1, 0, 1, 0] }

-- Period 8, original row 887, representative 4130.
def source24 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B006.Data.entryAt ⟨48, by decide +kernel⟩

def target24 : Weights.Entry :=
  { word := [0, 8, 0, 12, 8, 4, 12], weights := [1, 0, 1, 0] }

-- Period 8, original row 909, representative 4114.
def source25 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B006.Data.entryAt ⟨32, by decide +kernel⟩

def target25 : Weights.Entry :=
  { word := [0, 8, 1, 4, 8, 4, 10], weights := [1, 0, 1, 0] }

-- Period 8, original row 910, representative 4126.
def source26 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B006.Data.entryAt ⟨44, by decide +kernel⟩

def target26 : Weights.Entry :=
  { word := [0, 8, 1, 4, 8, 4, 12], weights := [1, 0, 0, 1] }

-- Period 8, original row 932, representative 4115.
def source27 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B006.Data.entryAt ⟨33, by decide +kernel⟩

def target27 : Weights.Entry :=
  { word := [0, 8, 1, 12, 8, 4, 10], weights := [1, 0, 1, 0] }

-- Period 8, original row 933, representative 4127.
def source28 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B006.Data.entryAt ⟨45, by decide +kernel⟩

def target28 : Weights.Entry :=
  { word := [0, 8, 1, 12, 8, 4, 12], weights := [1, 0, 1, 0] }

-- Period 8, original row 1522, representative 4107.
def source29 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B006.Data.entryAt ⟨25, by decide +kernel⟩

def target29 : Weights.Entry :=
  { word := [0, 12, 0, 4, 8, 4, 10], weights := [1, 0, 1, 0] }

-- Period 8, original row 1523, representative 4119.
def source30 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B006.Data.entryAt ⟨37, by decide +kernel⟩

def target30 : Weights.Entry :=
  { word := [0, 12, 0, 4, 8, 4, 12], weights := [1, 0, 0, 1] }

-- Period 8, original row 1545, representative 4110.
def source31 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B006.Data.entryAt ⟨28, by decide +kernel⟩

def target31 : Weights.Entry :=
  { word := [0, 12, 0, 12, 8, 4, 10], weights := [1, 0, 1, 0] }

-- Period 8, original row 1546, representative 4122.
def source32 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B006.Data.entryAt ⟨40, by decide +kernel⟩

def target32 : Weights.Entry :=
  { word := [0, 12, 0, 12, 8, 4, 12], weights := [1, 0, 1, 0] }

-- Period 8, original row 1589, representative 4086.
def source33 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B006.Data.entryAt ⟨4, by decide +kernel⟩

def target33 : Weights.Entry :=
  { word := [0, 12, 2, 8, 8, 4, 10], weights := [0, 1, 1, 0] }

-- Period 8, original row 1653, representative 4108.
def source34 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B006.Data.entryAt ⟨26, by decide +kernel⟩

def target34 : Weights.Entry :=
  { word := [0, 12, 8, 4, 8, 4, 10], weights := [1, 0, 1, 0] }

-- Period 8, original row 1654, representative 4120.
def source35 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B006.Data.entryAt ⟨38, by decide +kernel⟩

def target35 : Weights.Entry :=
  { word := [0, 12, 8, 4, 8, 4, 12], weights := [1, 0, 0, 1] }

-- Period 8, original row 1681, representative 4109.
def source36 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B006.Data.entryAt ⟨27, by decide +kernel⟩

def target36 : Weights.Entry :=
  { word := [0, 12, 8, 12, 8, 4, 10], weights := [1, 0, 1, 0] }

-- Period 8, original row 1682, representative 4121.
def source37 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B006.Data.entryAt ⟨39, by decide +kernel⟩

def target37 : Weights.Entry :=
  { word := [0, 12, 8, 12, 8, 4, 12], weights := [1, 0, 1, 0] }

-- Period 8, original row 1709, representative 4085.
def source38 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B006.Data.entryAt ⟨3, by decide +kernel⟩

def target38 : Weights.Entry :=
  { word := [0, 12, 10, 8, 8, 4, 10], weights := [0, 1, 1, 0] }

-- Period 8, original row 1754, representative 4113.
def source39 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B006.Data.entryAt ⟨31, by decide +kernel⟩

def target39 : Weights.Entry :=
  { word := [1, 0, 1, 4, 8, 4, 10], weights := [1, 0, 1, 0] }

def points39 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 8, original row 1755, representative 4125.
def source40 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B006.Data.entryAt ⟨43, by decide +kernel⟩

def target40 : Weights.Entry :=
  { word := [1, 0, 1, 4, 8, 4, 12], weights := [1, 0, 0, 1] }

def points40 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 8, original row 1777, representative 4116.
def source41 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B006.Data.entryAt ⟨34, by decide +kernel⟩

def target41 : Weights.Entry :=
  { word := [1, 0, 1, 12, 8, 4, 10], weights := [1, 0, 1, 0] }

def points41 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 8, original row 1778, representative 4128.
def source42 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B006.Data.entryAt ⟨46, by decide +kernel⟩

def target42 : Weights.Entry :=
  { word := [1, 0, 1, 12, 8, 4, 12], weights := [1, 0, 1, 0] }

def points42 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 8, original row 1879, representative 4088.
def source43 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B006.Data.entryAt ⟨6, by decide +kernel⟩

def target43 : Weights.Entry :=
  { word := [1, 4, 2, 8, 8, 4, 10], weights := [0, 1, 1, 0] }

def points43 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 8, original row 1938, representative 4111.
def source44 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B006.Data.entryAt ⟨29, by decide +kernel⟩

def target44 : Weights.Entry :=
  { word := [1, 4, 8, 4, 8, 4, 10], weights := [1, 0, 1, 0] }

def points44 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 8, original row 1939, representative 4123.
def source45 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B006.Data.entryAt ⟨41, by decide +kernel⟩

def target45 : Weights.Entry :=
  { word := [1, 4, 8, 4, 8, 4, 12], weights := [1, 0, 0, 1] }

def points45 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 8, original row 1966, representative 4112.
def source46 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B006.Data.entryAt ⟨30, by decide +kernel⟩

def target46 : Weights.Entry :=
  { word := [1, 4, 8, 12, 8, 4, 10], weights := [1, 0, 1, 0] }

def points46 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 8, original row 1967, representative 4124.
def source47 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B006.Data.entryAt ⟨42, by decide +kernel⟩

def target47 : Weights.Entry :=
  { word := [1, 4, 8, 12, 8, 4, 12], weights := [1, 0, 1, 0] }

def points47 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 8, original row 1994, representative 4087.
def source48 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B006.Data.entryAt ⟨5, by decide +kernel⟩

def target48 : Weights.Entry :=
  { word := [1, 4, 10, 8, 8, 4, 10], weights := [0, 1, 1, 0] }

def points48 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 8, original row 2039, representative 4114.
def source49 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B006.Data.entryAt ⟨32, by decide +kernel⟩

def target49 : Weights.Entry :=
  { word := [1, 8, 1, 4, 8, 4, 10], weights := [1, 0, 1, 0] }

def points49 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 8, original row 2040, representative 4126.
def source50 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B006.Data.entryAt ⟨44, by decide +kernel⟩

def target50 : Weights.Entry :=
  { word := [1, 8, 1, 4, 8, 4, 12], weights := [1, 0, 0, 1] }

def points50 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 8, original row 2062, representative 4115.
def source51 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B006.Data.entryAt ⟨33, by decide +kernel⟩

def target51 : Weights.Entry :=
  { word := [1, 8, 1, 12, 8, 4, 10], weights := [1, 0, 1, 0] }

def points51 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 8, original row 2063, representative 4127.
def source52 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B006.Data.entryAt ⟨45, by decide +kernel⟩

def target52 : Weights.Entry :=
  { word := [1, 8, 1, 12, 8, 4, 12], weights := [1, 0, 1, 0] }

def points52 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 8, original row 2238, representative 4086.
def source53 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B006.Data.entryAt ⟨4, by decide +kernel⟩

def target53 : Weights.Entry :=
  { word := [1, 12, 2, 8, 8, 4, 10], weights := [0, 1, 1, 0] }

def points53 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 8, original row 2297, representative 4108.
def source54 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B006.Data.entryAt ⟨26, by decide +kernel⟩

def target54 : Weights.Entry :=
  { word := [1, 12, 8, 4, 8, 4, 10], weights := [1, 0, 1, 0] }

def points54 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 8, original row 2298, representative 4120.
def source55 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B006.Data.entryAt ⟨38, by decide +kernel⟩

def target55 : Weights.Entry :=
  { word := [1, 12, 8, 4, 8, 4, 12], weights := [1, 0, 0, 1] }

def points55 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 8, original row 2325, representative 4109.
def source56 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B006.Data.entryAt ⟨27, by decide +kernel⟩

def target56 : Weights.Entry :=
  { word := [1, 12, 8, 12, 8, 4, 10], weights := [1, 0, 1, 0] }

def points56 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 8, original row 2326, representative 4121.
def source57 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B006.Data.entryAt ⟨39, by decide +kernel⟩

def target57 : Weights.Entry :=
  { word := [1, 12, 8, 12, 8, 4, 12], weights := [1, 0, 1, 0] }

def points57 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 8, original row 2353, representative 4085.
def source58 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B006.Data.entryAt ⟨3, by decide +kernel⟩

def target58 : Weights.Entry :=
  { word := [1, 12, 10, 8, 8, 4, 10], weights := [0, 1, 1, 0] }

def points58 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 8, original row 2438, representative 4084.
def source59 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B006.Data.entryAt ⟨2, by decide +kernel⟩

def target59 : Weights.Entry :=
  { word := [2, 0, 4, 10, 0, 8, 10], weights := [1, 0, 0, 1] }

-- Period 8, original row 2532, representative 4082.
def source60 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B006.Data.entryAt ⟨0, by decide +kernel⟩

def target60 : Weights.Entry :=
  { word := [2, 0, 12, 2, 0, 8, 10], weights := [1, 0, 0, 1] }

-- Period 8, original row 2560, representative 4083.
def source61 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B006.Data.entryAt ⟨1, by decide +kernel⟩

def target61 : Weights.Entry :=
  { word := [2, 0, 12, 10, 0, 8, 10], weights := [1, 0, 0, 1] }

-- Period 8, original row 2809, representative 4097.
def source62 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B006.Data.entryAt ⟨15, by decide +kernel⟩

def target62 : Weights.Entry :=
  { word := [2, 8, 0, 4, 2, 0, 9], weights := [1, 0, 1, 0] }

-- Period 8, original row 2810, representative 4089.
def source63 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B006.Data.entryAt ⟨7, by decide +kernel⟩

def target63 : Weights.Entry :=
  { word := [2, 8, 0, 4, 2, 0, 10], weights := [1, 0, 1, 0] }

-- Period 8, original row 2835, representative 4098.
def source64 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B006.Data.entryAt ⟨16, by decide +kernel⟩

def target64 : Weights.Entry :=
  { word := [2, 8, 0, 4, 10, 0, 9], weights := [1, 0, 1, 0] }

-- Period 8, original row 2836, representative 4090.
def source65 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B006.Data.entryAt ⟨8, by decide +kernel⟩

def target65 : Weights.Entry :=
  { word := [2, 8, 0, 4, 10, 0, 10], weights := [1, 0, 1, 0] }

-- Period 8, original row 2861, representative 4104.
def source66 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B006.Data.entryAt ⟨22, by decide +kernel⟩

def target66 : Weights.Entry :=
  { word := [2, 8, 0, 12, 2, 0, 9], weights := [1, 0, 1, 0] }

-- Period 8, original row 2862, representative 4096.
def source67 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B006.Data.entryAt ⟨14, by decide +kernel⟩

def target67 : Weights.Entry :=
  { word := [2, 8, 0, 12, 2, 0, 10], weights := [1, 0, 1, 0] }

-- Period 8, original row 2886, representative 4101.
def source68 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B006.Data.entryAt ⟨19, by decide +kernel⟩

def target68 : Weights.Entry :=
  { word := [2, 8, 0, 12, 10, 0, 9], weights := [1, 0, 1, 0] }

-- Period 8, original row 2887, representative 4093.
def source69 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B006.Data.entryAt ⟨11, by decide +kernel⟩

def target69 : Weights.Entry :=
  { word := [2, 8, 0, 12, 10, 0, 10], weights := [1, 0, 1, 0] }

-- Period 8, original row 2973, representative 4102.
def source70 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B006.Data.entryAt ⟨20, by decide +kernel⟩

def target70 : Weights.Entry :=
  { word := [2, 8, 8, 4, 2, 0, 9], weights := [1, 0, 1, 0] }

-- Period 8, original row 2974, representative 4094.
def source71 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B006.Data.entryAt ⟨12, by decide +kernel⟩

def target71 : Weights.Entry :=
  { word := [2, 8, 8, 4, 2, 0, 10], weights := [1, 0, 1, 0] }

-- Period 8, original row 3003, representative 4099.
def source72 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B006.Data.entryAt ⟨17, by decide +kernel⟩

def target72 : Weights.Entry :=
  { word := [2, 8, 8, 4, 10, 0, 9], weights := [1, 0, 1, 0] }

-- Period 8, original row 3004, representative 4091.
def source73 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B006.Data.entryAt ⟨9, by decide +kernel⟩

def target73 : Weights.Entry :=
  { word := [2, 8, 8, 4, 10, 0, 10], weights := [1, 0, 1, 0] }

-- Period 8, original row 3047, representative 4103.
def source74 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B006.Data.entryAt ⟨21, by decide +kernel⟩

def target74 : Weights.Entry :=
  { word := [2, 8, 8, 12, 2, 0, 9], weights := [1, 0, 1, 0] }

-- Period 8, original row 3048, representative 4095.
def source75 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B006.Data.entryAt ⟨13, by decide +kernel⟩

def target75 : Weights.Entry :=
  { word := [2, 8, 8, 12, 2, 0, 10], weights := [1, 0, 1, 0] }

-- Period 8, original row 3076, representative 4100.
def source76 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B006.Data.entryAt ⟨18, by decide +kernel⟩

def target76 : Weights.Entry :=
  { word := [2, 8, 8, 12, 10, 0, 9], weights := [1, 0, 1, 0] }

-- Period 8, original row 3077, representative 4092.
def source77 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B006.Data.entryAt ⟨10, by decide +kernel⟩

def target77 : Weights.Entry :=
  { word := [2, 8, 8, 12, 10, 0, 10], weights := [1, 0, 1, 0] }

-- Period 8, original row 3574, representative 4164.
def source78 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B006.Data.entryAt ⟨82, by decide +kernel⟩

def target78 : Weights.Entry :=
  { word := [4, 2, 0, 9, 8, 1, 12], weights := [1, 1, 0, 1] }

-- Period 8, original row 3579, representative 4165.
def source79 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B006.Data.entryAt ⟨83, by decide +kernel⟩

def target79 : Weights.Entry :=
  { word := [4, 2, 0, 9, 8, 8, 12], weights := [1, 1, 0, 1] }

-- Period 8, original row 3581, representative 4163.
def source80 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B006.Data.entryAt ⟨81, by decide +kernel⟩

def target80 : Weights.Entry :=
  { word := [4, 2, 0, 9, 8, 9, 12], weights := [1, 1, 0, 1] }

-- Period 8, original row 3590, representative 4162.
def source81 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B006.Data.entryAt ⟨80, by decide +kernel⟩

def target81 : Weights.Entry :=
  { word := [4, 2, 0, 10, 0, 0, 12], weights := [1, 1, 0, 0] }

-- Period 8, original row 3596, representative 4160.
def source82 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B006.Data.entryAt ⟨78, by decide +kernel⟩

def target82 : Weights.Entry :=
  { word := [4, 2, 0, 10, 0, 8, 12], weights := [1, 0, 0, 1] }

-- Period 8, original row 3598, representative 4161.
def source83 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B006.Data.entryAt ⟨79, by decide +kernel⟩

def target83 : Weights.Entry :=
  { word := [4, 2, 0, 10, 8, 0, 12], weights := [1, 1, 0, 0] }

-- Period 8, original row 3600, representative 4157.
def source84 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B006.Data.entryAt ⟨75, by decide +kernel⟩

def target84 : Weights.Entry :=
  { word := [4, 2, 0, 10, 8, 8, 12], weights := [1, 0, 0, 1] }

-- Period 8, original row 3607, representative 4166.
def source85 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B006.Data.entryAt ⟨84, by decide +kernel⟩

def target85 : Weights.Entry :=
  { word := [4, 2, 0, 12, 10, 0, 12], weights := [1, 1, 0, 1] }

-- Period 8, original row 3620, representative 4158.
def source86 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B006.Data.entryAt ⟨76, by decide +kernel⟩

def target86 : Weights.Entry :=
  { word := [4, 2, 8, 2, 0, 8, 12], weights := [1, 0, 0, 1] }

-- Period 8, original row 3628, representative 4155.
def source87 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B006.Data.entryAt ⟨73, by decide +kernel⟩

def target87 : Weights.Entry :=
  { word := [4, 2, 8, 2, 8, 8, 12], weights := [1, 0, 0, 1] }

-- Period 8, original row 3653, representative 4159.
def source88 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B006.Data.entryAt ⟨77, by decide +kernel⟩

def target88 : Weights.Entry :=
  { word := [4, 2, 8, 10, 0, 8, 12], weights := [1, 0, 0, 1] }

-- Period 8, original row 3664, representative 4156.
def source89 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B006.Data.entryAt ⟨74, by decide +kernel⟩

def target89 : Weights.Entry :=
  { word := [4, 2, 8, 10, 8, 8, 12], weights := [1, 0, 0, 1] }

-- Period 8, original row 3978, representative 4151.
def source90 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B006.Data.entryAt ⟨69, by decide +kernel⟩

def target90 : Weights.Entry :=
  { word := [4, 10, 0, 9, 8, 1, 12], weights := [1, 1, 0, 1] }

-- Period 8, original row 3983, representative 4152.
def source91 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B006.Data.entryAt ⟨70, by decide +kernel⟩

def target91 : Weights.Entry :=
  { word := [4, 10, 0, 9, 8, 8, 12], weights := [1, 1, 0, 1] }

-- Period 8, original row 3985, representative 4150.
def source92 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B006.Data.entryAt ⟨68, by decide +kernel⟩

def target92 : Weights.Entry :=
  { word := [4, 10, 0, 9, 8, 9, 12], weights := [1, 1, 0, 1] }

-- Period 8, original row 3989, representative 4149.
def source93 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B006.Data.entryAt ⟨67, by decide +kernel⟩

def target93 : Weights.Entry :=
  { word := [4, 10, 0, 10, 8, 0, 12], weights := [1, 1, 0, 0] }

-- Period 8, original row 3991, representative 4148.
def source94 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B006.Data.entryAt ⟨66, by decide +kernel⟩

def target94 : Weights.Entry :=
  { word := [4, 10, 0, 10, 8, 8, 12], weights := [1, 0, 0, 1] }

-- Period 8, original row 3998, representative 4154.
def source95 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B006.Data.entryAt ⟨72, by decide +kernel⟩

def target95 : Weights.Entry :=
  { word := [4, 10, 0, 12, 2, 0, 12], weights := [1, 1, 0, 1] }

-- Period 8, original row 4006, representative 4153.
def source96 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B006.Data.entryAt ⟨71, by decide +kernel⟩

def target96 : Weights.Entry :=
  { word := [4, 10, 0, 12, 10, 0, 12], weights := [1, 1, 0, 1] }

-- Period 8, original row 4011, representative 4146.
def source97 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B006.Data.entryAt ⟨64, by decide +kernel⟩

def target97 : Weights.Entry :=
  { word := [4, 10, 8, 2, 8, 8, 12], weights := [1, 0, 0, 1] }

-- Period 8, original row 4029, representative 4147.
def source98 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B006.Data.entryAt ⟨65, by decide +kernel⟩

def target98 : Weights.Entry :=
  { word := [4, 10, 8, 10, 8, 8, 12], weights := [1, 0, 0, 1] }

-- Period 8, original row 4522, representative 4097.
def source99 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B006.Data.entryAt ⟨15, by decide +kernel⟩

def target99 : Weights.Entry :=
  { word := [8, 1, 4, 2, 0, 8, 4], weights := [0, 1, 0, 1] }

def points99 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 4525, representative 4142.
def source100 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B006.Data.entryAt ⟨60, by decide +kernel⟩

def target100 : Weights.Entry :=
  { word := [8, 1, 4, 2, 0, 8, 10], weights := [1, 0, 0, 1] }

-- Period 8, original row 4533, representative 4102.
def source101 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B006.Data.entryAt ⟨20, by decide +kernel⟩

def target101 : Weights.Entry :=
  { word := [8, 1, 4, 2, 8, 8, 4], weights := [0, 1, 0, 1] }

def points101 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 4550, representative 4104.
def source102 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B006.Data.entryAt ⟨22, by decide +kernel⟩

def target102 : Weights.Entry :=
  { word := [8, 1, 4, 10, 0, 8, 4], weights := [0, 1, 0, 1] }

def points102 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 4553, representative 4145.
def source103 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B006.Data.entryAt ⟨63, by decide +kernel⟩

def target103 : Weights.Entry :=
  { word := [8, 1, 4, 10, 0, 8, 10], weights := [1, 0, 0, 1] }

-- Period 8, original row 4565, representative 4103.
def source104 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B006.Data.entryAt ⟨21, by decide +kernel⟩

def target104 : Weights.Entry :=
  { word := [8, 1, 4, 10, 8, 8, 4], weights := [0, 1, 0, 1] }

def points104 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 4611, representative 4098.
def source105 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B006.Data.entryAt ⟨16, by decide +kernel⟩

def target105 : Weights.Entry :=
  { word := [8, 1, 12, 2, 0, 8, 4], weights := [0, 1, 0, 1] }

def points105 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 4614, representative 4143.
def source106 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B006.Data.entryAt ⟨61, by decide +kernel⟩

def target106 : Weights.Entry :=
  { word := [8, 1, 12, 2, 0, 8, 10], weights := [1, 0, 0, 1] }

-- Period 8, original row 4622, representative 4099.
def source107 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B006.Data.entryAt ⟨17, by decide +kernel⟩

def target107 : Weights.Entry :=
  { word := [8, 1, 12, 2, 8, 8, 4], weights := [0, 1, 0, 1] }

def points107 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 4643, representative 4101.
def source108 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B006.Data.entryAt ⟨19, by decide +kernel⟩

def target108 : Weights.Entry :=
  { word := [8, 1, 12, 10, 0, 8, 4], weights := [0, 1, 0, 1] }

def points108 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 4646, representative 4144.
def source109 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B006.Data.entryAt ⟨62, by decide +kernel⟩

def target109 : Weights.Entry :=
  { word := [8, 1, 12, 10, 0, 8, 10], weights := [1, 0, 0, 1] }

-- Period 8, original row 4658, representative 4100.
def source110 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B006.Data.entryAt ⟨18, by decide +kernel⟩

def target110 : Weights.Entry :=
  { word := [8, 1, 12, 10, 8, 8, 4], weights := [0, 1, 0, 1] }

def points110 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 4669, representative 4209.
def source111 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B006.Data.entryAt ⟨127, by decide +kernel⟩

def target111 : Weights.Entry :=
  { word := [8, 2, 0, 1, 8, 1, 12], weights := [0, 1, 0, 0] }

-- Period 8, original row 4676, representative 4207.
def source112 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B006.Data.entryAt ⟨125, by decide +kernel⟩

def target112 : Weights.Entry :=
  { word := [8, 2, 0, 1, 8, 9, 12], weights := [0, 1, 0, 0] }

-- Period 8, original row 4716, representative 4208.
def source113 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B006.Data.entryAt ⟨126, by decide +kernel⟩

def target113 : Weights.Entry :=
  { word := [8, 2, 0, 9, 8, 9, 12], weights := [0, 1, 0, 0] }

-- Period 8, original row 4728, representative 4206.
def source114 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B006.Data.entryAt ⟨124, by decide +kernel⟩

def target114 : Weights.Entry :=
  { word := [8, 2, 0, 10, 0, 0, 12], weights := [0, 1, 0, 0] }

-- Period 8, original row 4734, representative 4202.
def source115 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B006.Data.entryAt ⟨120, by decide +kernel⟩

def target115 : Weights.Entry :=
  { word := [8, 2, 0, 10, 0, 8, 12], weights := [1, 0, 0, 1] }

-- Period 8, original row 4736, representative 4205.
def source116 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B006.Data.entryAt ⟨123, by decide +kernel⟩

def target116 : Weights.Entry :=
  { word := [8, 2, 0, 10, 8, 0, 12], weights := [0, 1, 0, 0] }

-- Period 8, original row 4740, representative 4195.
def source117 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B006.Data.entryAt ⟨113, by decide +kernel⟩

def target117 : Weights.Entry :=
  { word := [8, 2, 0, 10, 8, 8, 12], weights := [0, 1, 0, 0] }

-- Period 8, original row 4768, representative 4196.
def source118 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B006.Data.entryAt ⟨114, by decide +kernel⟩

def target118 : Weights.Entry :=
  { word := [8, 2, 2, 2, 0, 8, 12], weights := [1, 0, 0, 1] }

-- Period 8, original row 4779, representative 4203.
def source119 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B006.Data.entryAt ⟨121, by decide +kernel⟩

def target119 : Weights.Entry :=
  { word := [8, 2, 2, 2, 8, 0, 12], weights := [1, 0, 0, 1] }

-- Period 8, original row 4791, representative 4189.
def source120 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B006.Data.entryAt ⟨107, by decide +kernel⟩

def target120 : Weights.Entry :=
  { word := [8, 2, 2, 2, 8, 8, 12], weights := [1, 0, 0, 1] }

-- Period 8, original row 4807, representative 4199.
def source121 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B006.Data.entryAt ⟨117, by decide +kernel⟩

def target121 : Weights.Entry :=
  { word := [8, 2, 2, 10, 0, 8, 12], weights := [1, 0, 0, 1] }

-- Period 8, original row 4819, representative 4204.
def source122 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B006.Data.entryAt ⟨122, by decide +kernel⟩

def target122 : Weights.Entry :=
  { word := [8, 2, 2, 10, 8, 0, 12], weights := [1, 1, 0, 0] }

-- Period 8, original row 4836, representative 4192.
def source123 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B006.Data.entryAt ⟨110, by decide +kernel⟩

def target123 : Weights.Entry :=
  { word := [8, 2, 2, 10, 8, 8, 12], weights := [1, 0, 0, 1] }

-- Period 8, original row 4858, representative 4200.
def source124 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B006.Data.entryAt ⟨118, by decide +kernel⟩

def target124 : Weights.Entry :=
  { word := [8, 2, 8, 2, 0, 8, 12], weights := [1, 0, 0, 1] }

-- Period 8, original row 4868, representative 4193.
def source125 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B006.Data.entryAt ⟨111, by decide +kernel⟩

def target125 : Weights.Entry :=
  { word := [8, 2, 8, 2, 8, 8, 12], weights := [1, 0, 0, 1] }

-- Period 8, original row 4899, representative 4201.
def source126 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B006.Data.entryAt ⟨119, by decide +kernel⟩

def target126 : Weights.Entry :=
  { word := [8, 2, 8, 10, 0, 8, 12], weights := [1, 0, 0, 1] }

-- Period 8, original row 4912, representative 4194.
def source127 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B006.Data.entryAt ⟨112, by decide +kernel⟩

def target127 : Weights.Entry :=
  { word := [8, 2, 8, 10, 8, 8, 12], weights := [0, 1, 0, 0] }

def period8Entries : List Weights.Entry := [target0, target1, target2, target3, target4, target5, target6, target7, target8, target9, target10, target11, target12, target13, target14, target15, target16, target17, target18, target19, target20, target21, target22, target23, target24, target25, target26, target27, target28, target29, target30, target31, target32, target33, target34, target35, target36, target37, target38, target39, target40, target41, target42, target43, target44, target45, target46, target47, target48, target49, target50, target51, target52, target53, target54, target55, target56, target57, target58, target59, target60, target61, target62, target63, target64, target65, target66, target67, target68, target69, target70, target71, target72, target73, target74, target75, target76, target77, target78, target79, target80, target81, target82, target83, target84, target85, target86, target87, target88, target89, target90, target91, target92, target93, target94, target95, target96, target97, target98, target99, target100, target101, target102, target103, target104, target105, target106, target107, target108, target109, target110, target111, target112, target113, target114, target115, target116, target117, target118, target119, target120, target121, target122, target123, target124, target125, target126, target127]

def period8Chunk : RowCoverage.Chunk where
  rows := [⟨17, target0⟩, ⟨18, target1⟩, ⟨40, target2⟩, ⟨41, target3⟩, ⟨590, target4⟩, ⟨654, target5⟩, ⟨655, target6⟩, ⟨682, target7⟩, ⟨683, target8⟩, ⟨710, target9⟩, ⟨796, target10⟩, ⟨797, target11⟩, ⟨802, target12⟩, ⟨808, target13⟩, ⟨809, target14⟩, ⟨834, target15⟩, ⟨835, target16⟩, ⟨856, target17⟩, ⟨857, target18⟩, ⟨865, target19⟩, ⟨869, target20⟩, ⟨877, target21⟩, ⟨878, target22⟩, ⟨886, target23⟩, ⟨887, target24⟩, ⟨909, target25⟩, ⟨910, target26⟩, ⟨932, target27⟩, ⟨933, target28⟩, ⟨1522, target29⟩, ⟨1523, target30⟩, ⟨1545, target31⟩, ⟨1546, target32⟩, ⟨1589, target33⟩, ⟨1653, target34⟩, ⟨1654, target35⟩, ⟨1681, target36⟩, ⟨1682, target37⟩, ⟨1709, target38⟩, ⟨1754, target39⟩, ⟨1755, target40⟩, ⟨1777, target41⟩, ⟨1778, target42⟩, ⟨1879, target43⟩, ⟨1938, target44⟩, ⟨1939, target45⟩, ⟨1966, target46⟩, ⟨1967, target47⟩, ⟨1994, target48⟩, ⟨2039, target49⟩, ⟨2040, target50⟩, ⟨2062, target51⟩, ⟨2063, target52⟩, ⟨2238, target53⟩, ⟨2297, target54⟩, ⟨2298, target55⟩, ⟨2325, target56⟩, ⟨2326, target57⟩, ⟨2353, target58⟩, ⟨2438, target59⟩, ⟨2532, target60⟩, ⟨2560, target61⟩, ⟨2809, target62⟩, ⟨2810, target63⟩, ⟨2835, target64⟩, ⟨2836, target65⟩, ⟨2861, target66⟩, ⟨2862, target67⟩, ⟨2886, target68⟩, ⟨2887, target69⟩, ⟨2973, target70⟩, ⟨2974, target71⟩, ⟨3003, target72⟩, ⟨3004, target73⟩, ⟨3047, target74⟩, ⟨3048, target75⟩, ⟨3076, target76⟩, ⟨3077, target77⟩, ⟨3574, target78⟩, ⟨3579, target79⟩, ⟨3581, target80⟩, ⟨3590, target81⟩, ⟨3596, target82⟩, ⟨3598, target83⟩, ⟨3600, target84⟩, ⟨3607, target85⟩, ⟨3620, target86⟩, ⟨3628, target87⟩, ⟨3653, target88⟩, ⟨3664, target89⟩, ⟨3978, target90⟩, ⟨3983, target91⟩, ⟨3985, target92⟩, ⟨3989, target93⟩, ⟨3991, target94⟩, ⟨3998, target95⟩, ⟨4006, target96⟩, ⟨4011, target97⟩, ⟨4029, target98⟩, ⟨4522, target99⟩, ⟨4525, target100⟩, ⟨4533, target101⟩, ⟨4550, target102⟩, ⟨4553, target103⟩, ⟨4565, target104⟩, ⟨4611, target105⟩, ⟨4614, target106⟩, ⟨4622, target107⟩, ⟨4643, target108⟩, ⟨4646, target109⟩, ⟨4658, target110⟩, ⟨4669, target111⟩, ⟨4676, target112⟩, ⟨4716, target113⟩, ⟨4728, target114⟩, ⟨4734, target115⟩, ⟨4736, target116⟩, ⟨4740, target117⟩, ⟨4768, target118⟩, ⟨4779, target119⟩, ⟨4791, target120⟩, ⟨4807, target121⟩, ⟨4819, target122⟩, ⟨4836, target123⟩, ⟨4858, target124⟩, ⟨4868, target125⟩, ⟨4899, target126⟩, ⟨4912, target127⟩]
  indexMask := 456448424835497923364559627239374651099702603629776384903434232317782394746604999773433644274527353699458487814927110964978133258864799056049405503720582305422834595122177045318962474364779959043437261332913612989840994735415818286408053994808739790529172673518298296980944167091767785455515597146298539901722431171024366203342387803870923200031639412402889791736459573131024951432218784708175829371901447905514319756285530169526611858836701671743381570661591317409007756750011457496578947578825148611049265204481328621689121167902883055143218246031460898489528752194147698839305194169546547579592012336572852701135870240875865256759179543149627377237834534159308877631723728064850074941736541250556915240124090605901678629587688642365132594554584332760146131415998150136814383737286442830548971459377224331159639822566341888013957446829238518954706649554926005951143110579857887166954493997716465989938124982830135565495376593001283924442801993987512544666461068977382202023885088713672772801081814806750961183859058251546705545534908107811423706166852337451789629723162137936224957808990106152546188616864355734688242586320924831391829083494450876331285423115186411138659317534040398449692007390123423951548265637657051366822637759470184069872352921753071520523251056243160289665310849899389320712140469405594907206240833431017593113014033600533242275814198591019871906325367578214420192530506151061128981859605476750594722463873527056390660801194824477067235493975861735325696
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

end FranklSmallCyclic.TransportBatches.G032.B000.Data
