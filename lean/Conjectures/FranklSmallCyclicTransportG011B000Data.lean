module

public import Conjectures.FranklSmallCyclicRowCoverage
public import Conjectures.FranklSmallCyclicCanonicalWords
public import Conjectures.FranklSmallCyclicOrbit7Block011Data

/-! 128 literal targets sharing one source proof block.
Original words and row indices are retained; weights may be transported.
-/
@[expose] public section

namespace FranklSmallCyclic.TransportBatches.G011.B000.Data

-- Period 7, original row 10, representative 1466.
def source0 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨45, by decide +kernel⟩

def target0 : Weights.Entry :=
  { word := [0, 0, 1, 4, 2, 8, 10], weights := [0, 0, 1, 0] }

-- Period 7, original row 11, representative 1533.
def source1 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨112, by decide +kernel⟩

def target1 : Weights.Entry :=
  { word := [0, 0, 1, 4, 2, 8, 12], weights := [1, 0, 0, 1] }

-- Period 7, original row 32, representative 1449.
def source2 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨28, by decide +kernel⟩

def target2 : Weights.Entry :=
  { word := [0, 0, 1, 4, 10, 8, 10], weights := [0, 0, 1, 0] }

-- Period 7, original row 33, representative 1526.
def source3 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨105, by decide +kernel⟩

def target3 : Weights.Entry :=
  { word := [0, 0, 1, 4, 10, 8, 12], weights := [1, 0, 0, 1] }

-- Period 7, original row 59, representative 1464.
def source4 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨43, by decide +kernel⟩

def target4 : Weights.Entry :=
  { word := [0, 0, 2, 2, 2, 8, 10], weights := [0, 1, 0, 0] }

-- Period 7, original row 60, representative 1504.
def source5 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨83, by decide +kernel⟩

def target5 : Weights.Entry :=
  { word := [0, 0, 2, 2, 2, 8, 12], weights := [1, 0, 0, 1] }

-- Period 7, original row 74, representative 1447.
def source6 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨26, by decide +kernel⟩

def target6 : Weights.Entry :=
  { word := [0, 0, 2, 2, 10, 8, 10], weights := [0, 1, 0, 0] }

-- Period 7, original row 75, representative 1498.
def source7 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨77, by decide +kernel⟩

def target7 : Weights.Entry :=
  { word := [0, 0, 2, 2, 10, 8, 12], weights := [1, 0, 0, 1] }

-- Period 7, original row 81, representative 1430.
def source8 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨9, by decide +kernel⟩

def target8 : Weights.Entry :=
  { word := [0, 0, 6, 2, 0, 8, 9], weights := [1, 0, 0, 1] }

-- Period 7, original row 82, representative 1493.
def source9 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨72, by decide +kernel⟩

def target9 : Weights.Entry :=
  { word := [0, 0, 6, 2, 0, 8, 10], weights := [1, 0, 0, 1] }

-- Period 7, original row 83, representative 1493.
def source10 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨72, by decide +kernel⟩

def target10 : Weights.Entry :=
  { word := [0, 0, 6, 2, 0, 8, 12], weights := [1, 0, 0, 1] }

def points10 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 89, representative 1423.
def source11 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨2, by decide +kernel⟩

def target11 : Weights.Entry :=
  { word := [0, 0, 6, 2, 8, 8, 9], weights := [0, 1, 0, 0] }

-- Period 7, original row 90, representative 1477.
def source12 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨56, by decide +kernel⟩

def target12 : Weights.Entry :=
  { word := [0, 0, 6, 2, 8, 8, 10], weights := [0, 1, 0, 0] }

-- Period 7, original row 91, representative 1484.
def source13 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨63, by decide +kernel⟩

def target13 : Weights.Entry :=
  { word := [0, 0, 6, 2, 8, 8, 12], weights := [1, 0, 0, 1] }

-- Period 7, original row 110, representative 1465.
def source14 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨44, by decide +kernel⟩

def target14 : Weights.Entry :=
  { word := [0, 0, 10, 2, 2, 8, 10], weights := [0, 1, 0, 0] }

-- Period 7, original row 111, representative 1505.
def source15 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨84, by decide +kernel⟩

def target15 : Weights.Entry :=
  { word := [0, 0, 10, 2, 2, 8, 12], weights := [1, 0, 0, 1] }

-- Period 7, original row 118, representative 1448.
def source16 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨27, by decide +kernel⟩

def target16 : Weights.Entry :=
  { word := [0, 0, 10, 2, 10, 8, 10], weights := [0, 1, 0, 0] }

-- Period 7, original row 119, representative 1499.
def source17 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨78, by decide +kernel⟩

def target17 : Weights.Entry :=
  { word := [0, 0, 10, 2, 10, 8, 12], weights := [1, 0, 0, 1] }

-- Period 7, original row 516, representative 1468.
def source18 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨47, by decide +kernel⟩

def target18 : Weights.Entry :=
  { word := [0, 4, 0, 4, 2, 8, 10], weights := [0, 0, 1, 0] }

-- Period 7, original row 517, representative 1529.
def source19 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨108, by decide +kernel⟩

def target19 : Weights.Entry :=
  { word := [0, 4, 0, 4, 2, 8, 12], weights := [1, 0, 0, 1] }

-- Period 7, original row 538, representative 1451.
def source20 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨30, by decide +kernel⟩

def target20 : Weights.Entry :=
  { word := [0, 4, 0, 4, 10, 8, 10], weights := [0, 0, 1, 0] }

-- Period 7, original row 539, representative 1522.
def source21 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨101, by decide +kernel⟩

def target21 : Weights.Entry :=
  { word := [0, 4, 0, 4, 10, 8, 12], weights := [1, 0, 0, 1] }

-- Period 7, original row 563, representative 1435.
def source22 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨14, by decide +kernel⟩

def target22 : Weights.Entry :=
  { word := [0, 4, 2, 0, 1, 8, 9], weights := [0, 1, 0, 1] }

-- Period 7, original row 564, representative 1518.
def source23 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨97, by decide +kernel⟩

def target23 : Weights.Entry :=
  { word := [0, 4, 2, 0, 1, 8, 10], weights := [0, 1, 0, 1] }

-- Period 7, original row 565, representative 1514.
def source24 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨93, by decide +kernel⟩

def target24 : Weights.Entry :=
  { word := [0, 4, 2, 0, 1, 8, 12], weights := [0, 1, 0, 1] }

-- Period 7, original row 577, representative 1431.
def source25 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨10, by decide +kernel⟩

def target25 : Weights.Entry :=
  { word := [0, 4, 2, 0, 9, 8, 9], weights := [0, 1, 0, 1] }

-- Period 7, original row 578, representative 1506.
def source26 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨85, by decide +kernel⟩

def target26 : Weights.Entry :=
  { word := [0, 4, 2, 0, 9, 8, 10], weights := [0, 1, 0, 1] }

-- Period 7, original row 579, representative 1510.
def source27 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨89, by decide +kernel⟩

def target27 : Weights.Entry :=
  { word := [0, 4, 2, 0, 9, 8, 12], weights := [0, 1, 0, 1] }

-- Period 7, original row 587, representative 1459.
def source28 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨38, by decide +kernel⟩

def target28 : Weights.Entry :=
  { word := [0, 4, 2, 8, 2, 8, 10], weights := [0, 1, 1, 0] }

-- Period 7, original row 601, representative 1442.
def source29 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨21, by decide +kernel⟩

def target29 : Weights.Entry :=
  { word := [0, 4, 2, 8, 10, 8, 10], weights := [0, 1, 1, 0] }

-- Period 7, original row 613, representative 1435.
def source30 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨14, by decide +kernel⟩

def target30 : Weights.Entry :=
  { word := [0, 4, 4, 4, 0, 8, 9], weights := [1, 0, 0, 1] }

def points30 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6)]

-- Period 7, original row 614, representative 1518.
def source31 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨97, by decide +kernel⟩

def target31 : Weights.Entry :=
  { word := [0, 4, 4, 4, 0, 8, 10], weights := [1, 0, 0, 1] }

def points31 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6)]

-- Period 7, original row 615, representative 1514.
def source32 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨93, by decide +kernel⟩

def target32 : Weights.Entry :=
  { word := [0, 4, 4, 4, 0, 8, 12], weights := [1, 0, 0, 1] }

def points32 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6)]

-- Period 7, original row 627, representative 1424.
def source33 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨3, by decide +kernel⟩

def target33 : Weights.Entry :=
  { word := [0, 4, 4, 4, 8, 8, 9], weights := [1, 0, 1, 0] }

-- Period 7, original row 628, representative 1478.
def source34 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨57, by decide +kernel⟩

def target34 : Weights.Entry :=
  { word := [0, 4, 4, 4, 8, 8, 10], weights := [1, 0, 1, 0] }

-- Period 7, original row 629, representative 1485.
def source35 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨64, by decide +kernel⟩

def target35 : Weights.Entry :=
  { word := [0, 4, 4, 4, 8, 8, 12], weights := [1, 0, 0, 1] }

-- Period 7, original row 634, representative 1474.
def source36 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨53, by decide +kernel⟩

def target36 : Weights.Entry :=
  { word := [0, 4, 6, 8, 8, 8, 10], weights := [0, 1, 1, 0] }

-- Period 7, original row 645, representative 1471.
def source37 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨50, by decide +kernel⟩

def target37 : Weights.Entry :=
  { word := [0, 4, 8, 4, 2, 8, 10], weights := [0, 0, 1, 0] }

-- Period 7, original row 646, representative 1532.
def source38 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨111, by decide +kernel⟩

def target38 : Weights.Entry :=
  { word := [0, 4, 8, 4, 2, 8, 12], weights := [1, 0, 0, 1] }

-- Period 7, original row 671, representative 1454.
def source39 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨33, by decide +kernel⟩

def target39 : Weights.Entry :=
  { word := [0, 4, 8, 4, 10, 8, 10], weights := [0, 0, 1, 0] }

-- Period 7, original row 672, representative 1525.
def source40 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨104, by decide +kernel⟩

def target40 : Weights.Entry :=
  { word := [0, 4, 8, 4, 10, 8, 12], weights := [1, 0, 0, 1] }

-- Period 7, original row 695, representative 1438.
def source41 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨17, by decide +kernel⟩

def target41 : Weights.Entry :=
  { word := [0, 4, 10, 0, 1, 8, 9], weights := [0, 1, 0, 1] }

-- Period 7, original row 696, representative 1521.
def source42 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨100, by decide +kernel⟩

def target42 : Weights.Entry :=
  { word := [0, 4, 10, 0, 1, 8, 10], weights := [0, 1, 0, 1] }

-- Period 7, original row 697, representative 1517.
def source43 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨96, by decide +kernel⟩

def target43 : Weights.Entry :=
  { word := [0, 4, 10, 0, 1, 8, 12], weights := [0, 1, 0, 1] }

-- Period 7, original row 702, representative 1434.
def source44 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨13, by decide +kernel⟩

def target44 : Weights.Entry :=
  { word := [0, 4, 10, 0, 9, 8, 9], weights := [0, 1, 0, 1] }

-- Period 7, original row 703, representative 1509.
def source45 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨88, by decide +kernel⟩

def target45 : Weights.Entry :=
  { word := [0, 4, 10, 0, 9, 8, 10], weights := [0, 1, 0, 1] }

-- Period 7, original row 704, representative 1513.
def source46 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨92, by decide +kernel⟩

def target46 : Weights.Entry :=
  { word := [0, 4, 10, 0, 9, 8, 12], weights := [0, 1, 0, 1] }

-- Period 7, original row 707, representative 1458.
def source47 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨37, by decide +kernel⟩

def target47 : Weights.Entry :=
  { word := [0, 4, 10, 8, 2, 8, 10], weights := [0, 1, 1, 0] }

-- Period 7, original row 716, representative 1441.
def source48 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨20, by decide +kernel⟩

def target48 : Weights.Entry :=
  { word := [0, 4, 10, 8, 10, 8, 10], weights := [0, 1, 1, 0] }

-- Period 7, original row 721, representative 1438.
def source49 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨17, by decide +kernel⟩

def target49 : Weights.Entry :=
  { word := [0, 4, 12, 4, 0, 8, 9], weights := [1, 0, 0, 1] }

def points49 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6)]

-- Period 7, original row 722, representative 1521.
def source50 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨100, by decide +kernel⟩

def target50 : Weights.Entry :=
  { word := [0, 4, 12, 4, 0, 8, 10], weights := [1, 0, 0, 1] }

def points50 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6)]

-- Period 7, original row 723, representative 1517.
def source51 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨96, by decide +kernel⟩

def target51 : Weights.Entry :=
  { word := [0, 4, 12, 4, 0, 8, 12], weights := [1, 0, 0, 1] }

def points51 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6)]

-- Period 7, original row 735, representative 1427.
def source52 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨6, by decide +kernel⟩

def target52 : Weights.Entry :=
  { word := [0, 4, 12, 4, 8, 8, 9], weights := [1, 0, 1, 0] }

-- Period 7, original row 736, representative 1481.
def source53 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨60, by decide +kernel⟩

def target53 : Weights.Entry :=
  { word := [0, 4, 12, 4, 8, 8, 10], weights := [1, 0, 1, 0] }

-- Period 7, original row 737, representative 1488.
def source54 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨67, by decide +kernel⟩

def target54 : Weights.Entry :=
  { word := [0, 4, 12, 4, 8, 8, 12], weights := [1, 0, 0, 1] }

-- Period 7, original row 823, representative 1472.
def source55 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨51, by decide +kernel⟩

def target55 : Weights.Entry :=
  { word := [0, 8, 0, 4, 2, 8, 10], weights := [0, 0, 1, 0] }

-- Period 7, original row 824, representative 1535.
def source56 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨114, by decide +kernel⟩

def target56 : Weights.Entry :=
  { word := [0, 8, 0, 4, 2, 8, 12], weights := [1, 0, 0, 1] }

-- Period 7, original row 849, representative 1455.
def source57 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨34, by decide +kernel⟩

def target57 : Weights.Entry :=
  { word := [0, 8, 0, 4, 10, 8, 10], weights := [0, 0, 1, 0] }

-- Period 7, original row 850, representative 1528.
def source58 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨107, by decide +kernel⟩

def target58 : Weights.Entry :=
  { word := [0, 8, 0, 4, 10, 8, 12], weights := [1, 0, 0, 1] }

-- Period 7, original row 897, representative 1548.
def source59 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨127, by decide +kernel⟩

def target59 : Weights.Entry :=
  { word := [0, 8, 1, 4, 2, 0, 10], weights := [0, 0, 1, 0] }

-- Period 7, original row 898, representative 1542.
def source60 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨121, by decide +kernel⟩

def target60 : Weights.Entry :=
  { word := [0, 8, 1, 4, 2, 0, 12], weights := [1, 0, 0, 1] }

-- Period 7, original row 902, representative 1467.
def source61 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨46, by decide +kernel⟩

def target61 : Weights.Entry :=
  { word := [0, 8, 1, 4, 2, 8, 10], weights := [0, 0, 1, 0] }

-- Period 7, original row 903, representative 1534.
def source62 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨113, by decide +kernel⟩

def target62 : Weights.Entry :=
  { word := [0, 8, 1, 4, 2, 8, 12], weights := [1, 0, 0, 1] }

-- Period 7, original row 919, representative 1545.
def source63 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨124, by decide +kernel⟩

def target63 : Weights.Entry :=
  { word := [0, 8, 1, 4, 10, 0, 10], weights := [0, 0, 1, 0] }

-- Period 7, original row 920, representative 1540.
def source64 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨119, by decide +kernel⟩

def target64 : Weights.Entry :=
  { word := [0, 8, 1, 4, 10, 0, 12], weights := [1, 0, 0, 1] }

-- Period 7, original row 924, representative 1450.
def source65 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨29, by decide +kernel⟩

def target65 : Weights.Entry :=
  { word := [0, 8, 1, 4, 10, 8, 10], weights := [0, 0, 1, 0] }

-- Period 7, original row 925, representative 1527.
def source66 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨106, by decide +kernel⟩

def target66 : Weights.Entry :=
  { word := [0, 8, 1, 4, 10, 8, 12], weights := [1, 0, 0, 1] }

-- Period 7, original row 951, representative 1460.
def source67 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨39, by decide +kernel⟩

def target67 : Weights.Entry :=
  { word := [0, 8, 2, 2, 2, 8, 10], weights := [0, 1, 0, 0] }

-- Period 7, original row 952, representative 1500.
def source68 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨79, by decide +kernel⟩

def target68 : Weights.Entry :=
  { word := [0, 8, 2, 2, 2, 8, 12], weights := [1, 0, 0, 1] }

-- Period 7, original row 966, representative 1443.
def source69 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨22, by decide +kernel⟩

def target69 : Weights.Entry :=
  { word := [0, 8, 2, 2, 10, 8, 10], weights := [0, 1, 0, 0] }

-- Period 7, original row 967, representative 1494.
def source70 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨73, by decide +kernel⟩

def target70 : Weights.Entry :=
  { word := [0, 8, 2, 2, 10, 8, 12], weights := [1, 0, 0, 1] }

-- Period 7, original row 980, representative 1463.
def source71 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨42, by decide +kernel⟩

def target71 : Weights.Entry :=
  { word := [0, 8, 2, 10, 2, 8, 10], weights := [0, 1, 0, 0] }

-- Period 7, original row 981, representative 1503.
def source72 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨82, by decide +kernel⟩

def target72 : Weights.Entry :=
  { word := [0, 8, 2, 10, 2, 8, 12], weights := [1, 0, 0, 1] }

-- Period 7, original row 994, representative 1446.
def source73 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨25, by decide +kernel⟩

def target73 : Weights.Entry :=
  { word := [0, 8, 2, 10, 10, 8, 10], weights := [0, 1, 0, 0] }

-- Period 7, original row 995, representative 1497.
def source74 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨76, by decide +kernel⟩

def target74 : Weights.Entry :=
  { word := [0, 8, 2, 10, 10, 8, 12], weights := [1, 0, 0, 1] }

-- Period 7, original row 1017, representative 1428.
def source75 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨7, by decide +kernel⟩

def target75 : Weights.Entry :=
  { word := [0, 8, 6, 2, 0, 8, 9], weights := [1, 0, 0, 1] }

-- Period 7, original row 1018, representative 1491.
def source76 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨70, by decide +kernel⟩

def target76 : Weights.Entry :=
  { word := [0, 8, 6, 2, 0, 8, 10], weights := [1, 0, 0, 1] }

-- Period 7, original row 1019, representative 1489.
def source77 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨68, by decide +kernel⟩

def target77 : Weights.Entry :=
  { word := [0, 8, 6, 2, 0, 8, 12], weights := [1, 0, 0, 1] }

-- Period 7, original row 1025, representative 1421.
def source78 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨0, by decide +kernel⟩

def target78 : Weights.Entry :=
  { word := [0, 8, 6, 2, 8, 8, 9], weights := [0, 1, 0, 0] }

-- Period 7, original row 1026, representative 1475.
def source79 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨54, by decide +kernel⟩

def target79 : Weights.Entry :=
  { word := [0, 8, 6, 2, 8, 8, 10], weights := [0, 1, 0, 0] }

-- Period 7, original row 1027, representative 1482.
def source80 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨61, by decide +kernel⟩

def target80 : Weights.Entry :=
  { word := [0, 8, 6, 2, 8, 8, 12], weights := [1, 0, 0, 1] }

-- Period 7, original row 1032, representative 1429.
def source81 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨8, by decide +kernel⟩

def target81 : Weights.Entry :=
  { word := [0, 8, 6, 10, 0, 8, 9], weights := [1, 0, 0, 1] }

-- Period 7, original row 1033, representative 1492.
def source82 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨71, by decide +kernel⟩

def target82 : Weights.Entry :=
  { word := [0, 8, 6, 10, 0, 8, 10], weights := [1, 0, 0, 1] }

-- Period 7, original row 1034, representative 1490.
def source83 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨69, by decide +kernel⟩

def target83 : Weights.Entry :=
  { word := [0, 8, 6, 10, 0, 8, 12], weights := [1, 0, 0, 1] }

-- Period 7, original row 1039, representative 1422.
def source84 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨1, by decide +kernel⟩

def target84 : Weights.Entry :=
  { word := [0, 8, 6, 10, 8, 8, 9], weights := [0, 1, 0, 0] }

-- Period 7, original row 1040, representative 1476.
def source85 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨55, by decide +kernel⟩

def target85 : Weights.Entry :=
  { word := [0, 8, 6, 10, 8, 8, 10], weights := [0, 1, 0, 0] }

-- Period 7, original row 1041, representative 1483.
def source86 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨62, by decide +kernel⟩

def target86 : Weights.Entry :=
  { word := [0, 8, 6, 10, 8, 8, 12], weights := [0, 1, 0, 0] }

-- Period 7, original row 1086, representative 1461.
def source87 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨40, by decide +kernel⟩

def target87 : Weights.Entry :=
  { word := [0, 8, 10, 2, 2, 8, 10], weights := [0, 1, 0, 0] }

-- Period 7, original row 1087, representative 1501.
def source88 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨80, by decide +kernel⟩

def target88 : Weights.Entry :=
  { word := [0, 8, 10, 2, 2, 8, 12], weights := [1, 0, 0, 1] }

-- Period 7, original row 1094, representative 1444.
def source89 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨23, by decide +kernel⟩

def target89 : Weights.Entry :=
  { word := [0, 8, 10, 2, 10, 8, 10], weights := [0, 1, 0, 0] }

-- Period 7, original row 1095, representative 1495.
def source90 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨74, by decide +kernel⟩

def target90 : Weights.Entry :=
  { word := [0, 8, 10, 2, 10, 8, 12], weights := [1, 0, 0, 1] }

-- Period 7, original row 1101, representative 1462.
def source91 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨41, by decide +kernel⟩

def target91 : Weights.Entry :=
  { word := [0, 8, 10, 10, 2, 8, 10], weights := [0, 1, 0, 0] }

-- Period 7, original row 1102, representative 1502.
def source92 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨81, by decide +kernel⟩

def target92 : Weights.Entry :=
  { word := [0, 8, 10, 10, 2, 8, 12], weights := [1, 0, 0, 1] }

-- Period 7, original row 1108, representative 1445.
def source93 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨24, by decide +kernel⟩

def target93 : Weights.Entry :=
  { word := [0, 8, 10, 10, 10, 8, 10], weights := [0, 1, 0, 0] }

-- Period 7, original row 1109, representative 1496.
def source94 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨75, by decide +kernel⟩

def target94 : Weights.Entry :=
  { word := [0, 8, 10, 10, 10, 8, 12], weights := [1, 0, 0, 1] }

-- Period 7, original row 1509, representative 1548.
def source95 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨127, by decide +kernel⟩

def target95 : Weights.Entry :=
  { word := [0, 12, 0, 4, 2, 0, 9], weights := [0, 0, 1, 0] }

def points95 : List (ℕ × ℕ) := [(0, 0), (1, 2), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 1511, representative 1542.
def source96 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨121, by decide +kernel⟩

def target96 : Weights.Entry :=
  { word := [0, 12, 0, 4, 2, 0, 12], weights := [1, 0, 0, 1] }

def points96 : List (ℕ × ℕ) := [(0, 0), (1, 2), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 1515, representative 1469.
def source97 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨48, by decide +kernel⟩

def target97 : Weights.Entry :=
  { word := [0, 12, 0, 4, 2, 8, 10], weights := [0, 0, 1, 0] }

-- Period 7, original row 1516, representative 1530.
def source98 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨109, by decide +kernel⟩

def target98 : Weights.Entry :=
  { word := [0, 12, 0, 4, 2, 8, 12], weights := [1, 0, 0, 1] }

-- Period 7, original row 1531, representative 1545.
def source99 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨124, by decide +kernel⟩

def target99 : Weights.Entry :=
  { word := [0, 12, 0, 4, 10, 0, 9], weights := [0, 0, 1, 0] }

def points99 : List (ℕ × ℕ) := [(0, 0), (1, 2), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 1533, representative 1540.
def source100 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨119, by decide +kernel⟩

def target100 : Weights.Entry :=
  { word := [0, 12, 0, 4, 10, 0, 12], weights := [1, 0, 0, 1] }

def points100 : List (ℕ × ℕ) := [(0, 0), (1, 2), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 1537, representative 1452.
def source101 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨31, by decide +kernel⟩

def target101 : Weights.Entry :=
  { word := [0, 12, 0, 4, 10, 8, 10], weights := [0, 0, 1, 0] }

-- Period 7, original row 1538, representative 1523.
def source102 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨102, by decide +kernel⟩

def target102 : Weights.Entry :=
  { word := [0, 12, 0, 4, 10, 8, 12], weights := [1, 0, 0, 1] }

-- Period 7, original row 1557, representative 1538.
def source103 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨117, by decide +kernel⟩

def target103 : Weights.Entry :=
  { word := [0, 12, 2, 0, 1, 0, 12], weights := [0, 1, 0, 1] }

-- Period 7, original row 1562, representative 1436.
def source104 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨15, by decide +kernel⟩

def target104 : Weights.Entry :=
  { word := [0, 12, 2, 0, 1, 8, 9], weights := [0, 1, 0, 1] }

-- Period 7, original row 1563, representative 1519.
def source105 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨98, by decide +kernel⟩

def target105 : Weights.Entry :=
  { word := [0, 12, 2, 0, 1, 8, 10], weights := [0, 1, 0, 1] }

-- Period 7, original row 1564, representative 1515.
def source106 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨94, by decide +kernel⟩

def target106 : Weights.Entry :=
  { word := [0, 12, 2, 0, 1, 8, 12], weights := [0, 1, 0, 1] }

-- Period 7, original row 1571, representative 1539.
def source107 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨118, by decide +kernel⟩

def target107 : Weights.Entry :=
  { word := [0, 12, 2, 0, 9, 0, 12], weights := [0, 1, 0, 1] }

-- Period 7, original row 1576, representative 1432.
def source108 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨11, by decide +kernel⟩

def target108 : Weights.Entry :=
  { word := [0, 12, 2, 0, 9, 8, 9], weights := [0, 1, 0, 1] }

-- Period 7, original row 1577, representative 1507.
def source109 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨86, by decide +kernel⟩

def target109 : Weights.Entry :=
  { word := [0, 12, 2, 0, 9, 8, 10], weights := [0, 1, 0, 1] }

-- Period 7, original row 1578, representative 1511.
def source110 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨90, by decide +kernel⟩

def target110 : Weights.Entry :=
  { word := [0, 12, 2, 0, 9, 8, 12], weights := [0, 1, 0, 1] }

-- Period 7, original row 1582, representative 1547.
def source111 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨126, by decide +kernel⟩

def target111 : Weights.Entry :=
  { word := [0, 12, 2, 8, 2, 0, 9], weights := [0, 1, 1, 0] }

-- Period 7, original row 1586, representative 1457.
def source112 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨36, by decide +kernel⟩

def target112 : Weights.Entry :=
  { word := [0, 12, 2, 8, 2, 8, 10], weights := [0, 1, 1, 0] }

-- Period 7, original row 1596, representative 1544.
def source113 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨123, by decide +kernel⟩

def target113 : Weights.Entry :=
  { word := [0, 12, 2, 8, 10, 0, 9], weights := [0, 1, 1, 0] }

-- Period 7, original row 1600, representative 1440.
def source114 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨19, by decide +kernel⟩

def target114 : Weights.Entry :=
  { word := [0, 12, 2, 8, 10, 8, 10], weights := [0, 1, 1, 0] }

-- Period 7, original row 1607, representative 1538.
def source115 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨117, by decide +kernel⟩

def target115 : Weights.Entry :=
  { word := [0, 12, 4, 4, 0, 0, 12], weights := [1, 0, 0, 1] }

def points115 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6)]

-- Period 7, original row 1612, representative 1436.
def source116 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨15, by decide +kernel⟩

def target116 : Weights.Entry :=
  { word := [0, 12, 4, 4, 0, 8, 9], weights := [1, 0, 0, 1] }

def points116 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6)]

-- Period 7, original row 1613, representative 1519.
def source117 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨98, by decide +kernel⟩

def target117 : Weights.Entry :=
  { word := [0, 12, 4, 4, 0, 8, 10], weights := [1, 0, 0, 1] }

def points117 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6)]

-- Period 7, original row 1614, representative 1515.
def source118 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨94, by decide +kernel⟩

def target118 : Weights.Entry :=
  { word := [0, 12, 4, 4, 0, 8, 12], weights := [1, 0, 0, 1] }

def points118 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6)]

-- Period 7, original row 1621, representative 1536.
def source119 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨115, by decide +kernel⟩

def target119 : Weights.Entry :=
  { word := [0, 12, 4, 4, 8, 0, 12], weights := [1, 0, 0, 1] }

-- Period 7, original row 1626, representative 1425.
def source120 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨4, by decide +kernel⟩

def target120 : Weights.Entry :=
  { word := [0, 12, 4, 4, 8, 8, 9], weights := [1, 0, 1, 0] }

-- Period 7, original row 1627, representative 1479.
def source121 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨58, by decide +kernel⟩

def target121 : Weights.Entry :=
  { word := [0, 12, 4, 4, 8, 8, 10], weights := [1, 0, 1, 0] }

-- Period 7, original row 1628, representative 1486.
def source122 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨65, by decide +kernel⟩

def target122 : Weights.Entry :=
  { word := [0, 12, 4, 4, 8, 8, 12], weights := [1, 0, 0, 1] }

-- Period 7, original row 1633, representative 1473.
def source123 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨52, by decide +kernel⟩

def target123 : Weights.Entry :=
  { word := [0, 12, 6, 8, 8, 8, 10], weights := [0, 1, 1, 0] }

-- Period 7, original row 1640, representative 1543.
def source124 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨122, by decide +kernel⟩

def target124 : Weights.Entry :=
  { word := [0, 12, 8, 4, 2, 0, 12], weights := [1, 0, 0, 1] }

-- Period 7, original row 1644, representative 1470.
def source125 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨49, by decide +kernel⟩

def target125 : Weights.Entry :=
  { word := [0, 12, 8, 4, 2, 8, 10], weights := [0, 0, 1, 0] }

-- Period 7, original row 1645, representative 1531.
def source126 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨110, by decide +kernel⟩

def target126 : Weights.Entry :=
  { word := [0, 12, 8, 4, 2, 8, 12], weights := [1, 0, 0, 1] }

-- Period 7, original row 1664, representative 1546.
def source127 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨125, by decide +kernel⟩

def target127 : Weights.Entry :=
  { word := [0, 12, 8, 4, 10, 0, 9], weights := [0, 0, 1, 0] }

def period7Entries : List Weights.Entry := [target0, target1, target2, target3, target4, target5, target6, target7, target8, target9, target10, target11, target12, target13, target14, target15, target16, target17, target18, target19, target20, target21, target22, target23, target24, target25, target26, target27, target28, target29, target30, target31, target32, target33, target34, target35, target36, target37, target38, target39, target40, target41, target42, target43, target44, target45, target46, target47, target48, target49, target50, target51, target52, target53, target54, target55, target56, target57, target58, target59, target60, target61, target62, target63, target64, target65, target66, target67, target68, target69, target70, target71, target72, target73, target74, target75, target76, target77, target78, target79, target80, target81, target82, target83, target84, target85, target86, target87, target88, target89, target90, target91, target92, target93, target94, target95, target96, target97, target98, target99, target100, target101, target102, target103, target104, target105, target106, target107, target108, target109, target110, target111, target112, target113, target114, target115, target116, target117, target118, target119, target120, target121, target122, target123, target124, target125, target126, target127]

def period7Chunk : RowCoverage.Chunk where
  rows := [⟨10, target0⟩, ⟨11, target1⟩, ⟨32, target2⟩, ⟨33, target3⟩, ⟨59, target4⟩, ⟨60, target5⟩, ⟨74, target6⟩, ⟨75, target7⟩, ⟨81, target8⟩, ⟨82, target9⟩, ⟨83, target10⟩, ⟨89, target11⟩, ⟨90, target12⟩, ⟨91, target13⟩, ⟨110, target14⟩, ⟨111, target15⟩, ⟨118, target16⟩, ⟨119, target17⟩, ⟨516, target18⟩, ⟨517, target19⟩, ⟨538, target20⟩, ⟨539, target21⟩, ⟨563, target22⟩, ⟨564, target23⟩, ⟨565, target24⟩, ⟨577, target25⟩, ⟨578, target26⟩, ⟨579, target27⟩, ⟨587, target28⟩, ⟨601, target29⟩, ⟨613, target30⟩, ⟨614, target31⟩, ⟨615, target32⟩, ⟨627, target33⟩, ⟨628, target34⟩, ⟨629, target35⟩, ⟨634, target36⟩, ⟨645, target37⟩, ⟨646, target38⟩, ⟨671, target39⟩, ⟨672, target40⟩, ⟨695, target41⟩, ⟨696, target42⟩, ⟨697, target43⟩, ⟨702, target44⟩, ⟨703, target45⟩, ⟨704, target46⟩, ⟨707, target47⟩, ⟨716, target48⟩, ⟨721, target49⟩, ⟨722, target50⟩, ⟨723, target51⟩, ⟨735, target52⟩, ⟨736, target53⟩, ⟨737, target54⟩, ⟨823, target55⟩, ⟨824, target56⟩, ⟨849, target57⟩, ⟨850, target58⟩, ⟨897, target59⟩, ⟨898, target60⟩, ⟨902, target61⟩, ⟨903, target62⟩, ⟨919, target63⟩, ⟨920, target64⟩, ⟨924, target65⟩, ⟨925, target66⟩, ⟨951, target67⟩, ⟨952, target68⟩, ⟨966, target69⟩, ⟨967, target70⟩, ⟨980, target71⟩, ⟨981, target72⟩, ⟨994, target73⟩, ⟨995, target74⟩, ⟨1017, target75⟩, ⟨1018, target76⟩, ⟨1019, target77⟩, ⟨1025, target78⟩, ⟨1026, target79⟩, ⟨1027, target80⟩, ⟨1032, target81⟩, ⟨1033, target82⟩, ⟨1034, target83⟩, ⟨1039, target84⟩, ⟨1040, target85⟩, ⟨1041, target86⟩, ⟨1086, target87⟩, ⟨1087, target88⟩, ⟨1094, target89⟩, ⟨1095, target90⟩, ⟨1101, target91⟩, ⟨1102, target92⟩, ⟨1108, target93⟩, ⟨1109, target94⟩, ⟨1509, target95⟩, ⟨1511, target96⟩, ⟨1515, target97⟩, ⟨1516, target98⟩, ⟨1531, target99⟩, ⟨1533, target100⟩, ⟨1537, target101⟩, ⟨1538, target102⟩, ⟨1557, target103⟩, ⟨1562, target104⟩, ⟨1563, target105⟩, ⟨1564, target106⟩, ⟨1571, target107⟩, ⟨1576, target108⟩, ⟨1577, target109⟩, ⟨1578, target110⟩, ⟨1582, target111⟩, ⟨1586, target112⟩, ⟨1596, target113⟩, ⟨1600, target114⟩, ⟨1607, target115⟩, ⟨1612, target116⟩, ⟨1613, target117⟩, ⟨1614, target118⟩, ⟨1621, target119⟩, ⟨1626, target120⟩, ⟨1627, target121⟩, ⟨1628, target122⟩, ⟨1633, target123⟩, ⟨1640, target124⟩, ⟨1644, target125⟩, ⟨1645, target126⟩, ⟨1664, target127⟩]
  indexMask := 820189213514802881116472393059956313977581186641769313254679432710899467694822219665085524976434718302660409485782807265112844935732962688394261550093364929028616612018999281762753510341790099939904828842354600756862301596342740530922045493370953923073922920639549568667944124797278257148001057919009736938342853761241595388946339851961205400554550985305948797665965608381033727289406801903879812883707221774417153759465259210266825588333974386970904453593495789469530719762699625055734668134386240512
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

end FranklSmallCyclic.TransportBatches.G011.B000.Data
