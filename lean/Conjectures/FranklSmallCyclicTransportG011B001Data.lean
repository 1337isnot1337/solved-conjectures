module

public import Conjectures.FranklSmallCyclicRowCoverage
public import Conjectures.FranklSmallCyclicCanonicalWords
public import Conjectures.FranklSmallCyclicOrbit7Block011Data

/-! 128 literal targets sharing one source proof block.
Original words and row indices are retained; weights may be transported.
-/
@[expose] public section

namespace FranklSmallCyclic.TransportBatches.G011.B001.Data

-- Period 7, original row 1666, representative 1541.
def source0 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨120, by decide +kernel⟩

def target0 : Weights.Entry :=
  { word := [0, 12, 8, 4, 10, 0, 12], weights := [1, 0, 0, 1] }

-- Period 7, original row 1670, representative 1453.
def source1 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨32, by decide +kernel⟩

def target1 : Weights.Entry :=
  { word := [0, 12, 8, 4, 10, 8, 10], weights := [0, 0, 1, 0] }

-- Period 7, original row 1671, representative 1524.
def source2 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨103, by decide +kernel⟩

def target2 : Weights.Entry :=
  { word := [0, 12, 8, 4, 10, 8, 12], weights := [1, 0, 0, 1] }

-- Period 7, original row 1694, representative 1437.
def source3 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨16, by decide +kernel⟩

def target3 : Weights.Entry :=
  { word := [0, 12, 10, 0, 1, 8, 9], weights := [0, 1, 0, 1] }

-- Period 7, original row 1695, representative 1520.
def source4 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨99, by decide +kernel⟩

def target4 : Weights.Entry :=
  { word := [0, 12, 10, 0, 1, 8, 10], weights := [0, 1, 0, 1] }

-- Period 7, original row 1696, representative 1516.
def source5 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨95, by decide +kernel⟩

def target5 : Weights.Entry :=
  { word := [0, 12, 10, 0, 1, 8, 12], weights := [0, 1, 0, 1] }

-- Period 7, original row 1701, representative 1433.
def source6 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨12, by decide +kernel⟩

def target6 : Weights.Entry :=
  { word := [0, 12, 10, 0, 9, 8, 9], weights := [0, 1, 0, 1] }

-- Period 7, original row 1702, representative 1508.
def source7 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨87, by decide +kernel⟩

def target7 : Weights.Entry :=
  { word := [0, 12, 10, 0, 9, 8, 10], weights := [0, 1, 0, 1] }

-- Period 7, original row 1703, representative 1512.
def source8 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨91, by decide +kernel⟩

def target8 : Weights.Entry :=
  { word := [0, 12, 10, 0, 9, 8, 12], weights := [0, 1, 0, 1] }

-- Period 7, original row 1706, representative 1456.
def source9 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨35, by decide +kernel⟩

def target9 : Weights.Entry :=
  { word := [0, 12, 10, 8, 2, 8, 10], weights := [0, 1, 1, 0] }

-- Period 7, original row 1715, representative 1439.
def source10 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨18, by decide +kernel⟩

def target10 : Weights.Entry :=
  { word := [0, 12, 10, 8, 10, 8, 10], weights := [0, 1, 1, 0] }

-- Period 7, original row 1720, representative 1437.
def source11 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨16, by decide +kernel⟩

def target11 : Weights.Entry :=
  { word := [0, 12, 12, 4, 0, 8, 9], weights := [1, 0, 0, 1] }

def points11 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6)]

-- Period 7, original row 1721, representative 1520.
def source12 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨99, by decide +kernel⟩

def target12 : Weights.Entry :=
  { word := [0, 12, 12, 4, 0, 8, 10], weights := [1, 0, 0, 1] }

def points12 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6)]

-- Period 7, original row 1722, representative 1516.
def source13 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨95, by decide +kernel⟩

def target13 : Weights.Entry :=
  { word := [0, 12, 12, 4, 0, 8, 12], weights := [1, 0, 0, 1] }

def points13 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6)]

-- Period 7, original row 1729, representative 1537.
def source14 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨116, by decide +kernel⟩

def target14 : Weights.Entry :=
  { word := [0, 12, 12, 4, 8, 0, 12], weights := [1, 0, 0, 1] }

-- Period 7, original row 1734, representative 1426.
def source15 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨5, by decide +kernel⟩

def target15 : Weights.Entry :=
  { word := [0, 12, 12, 4, 8, 8, 9], weights := [1, 0, 1, 0] }

-- Period 7, original row 1735, representative 1480.
def source16 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨59, by decide +kernel⟩

def target16 : Weights.Entry :=
  { word := [0, 12, 12, 4, 8, 8, 10], weights := [1, 0, 1, 0] }

-- Period 7, original row 1736, representative 1487.
def source17 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨66, by decide +kernel⟩

def target17 : Weights.Entry :=
  { word := [0, 12, 12, 4, 8, 8, 12], weights := [1, 0, 0, 1] }

-- Period 7, original row 1747, representative 1466.
def source18 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨45, by decide +kernel⟩

def target18 : Weights.Entry :=
  { word := [1, 0, 1, 4, 2, 8, 10], weights := [0, 0, 1, 0] }

def points18 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 1748, representative 1533.
def source19 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨112, by decide +kernel⟩

def target19 : Weights.Entry :=
  { word := [1, 0, 1, 4, 2, 8, 12], weights := [1, 0, 0, 1] }

def points19 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 1769, representative 1449.
def source20 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨28, by decide +kernel⟩

def target20 : Weights.Entry :=
  { word := [1, 0, 1, 4, 10, 8, 10], weights := [0, 0, 1, 0] }

def points20 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 1770, representative 1526.
def source21 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨105, by decide +kernel⟩

def target21 : Weights.Entry :=
  { word := [1, 0, 1, 4, 10, 8, 12], weights := [1, 0, 0, 1] }

def points21 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 1796, representative 1464.
def source22 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨43, by decide +kernel⟩

def target22 : Weights.Entry :=
  { word := [1, 0, 2, 2, 2, 8, 10], weights := [0, 1, 0, 0] }

def points22 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 1797, representative 1504.
def source23 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨83, by decide +kernel⟩

def target23 : Weights.Entry :=
  { word := [1, 0, 2, 2, 2, 8, 12], weights := [1, 0, 0, 1] }

def points23 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 1811, representative 1447.
def source24 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨26, by decide +kernel⟩

def target24 : Weights.Entry :=
  { word := [1, 0, 2, 2, 10, 8, 10], weights := [0, 1, 0, 0] }

def points24 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 1812, representative 1498.
def source25 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨77, by decide +kernel⟩

def target25 : Weights.Entry :=
  { word := [1, 0, 2, 2, 10, 8, 12], weights := [1, 0, 0, 1] }

def points25 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 1831, representative 1465.
def source26 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨44, by decide +kernel⟩

def target26 : Weights.Entry :=
  { word := [1, 0, 10, 2, 2, 8, 10], weights := [0, 1, 0, 0] }

def points26 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 1832, representative 1505.
def source27 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨84, by decide +kernel⟩

def target27 : Weights.Entry :=
  { word := [1, 0, 10, 2, 2, 8, 12], weights := [1, 0, 0, 1] }

def points27 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 1839, representative 1448.
def source28 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨27, by decide +kernel⟩

def target28 : Weights.Entry :=
  { word := [1, 0, 10, 2, 10, 8, 10], weights := [0, 1, 0, 0] }

def points28 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 1840, representative 1499.
def source29 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨78, by decide +kernel⟩

def target29 : Weights.Entry :=
  { word := [1, 0, 10, 2, 10, 8, 12], weights := [1, 0, 0, 1] }

def points29 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 1852, representative 1435.
def source30 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨14, by decide +kernel⟩

def target30 : Weights.Entry :=
  { word := [1, 4, 2, 0, 1, 8, 9], weights := [0, 1, 0, 1] }

def points30 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 1853, representative 1518.
def source31 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨97, by decide +kernel⟩

def target31 : Weights.Entry :=
  { word := [1, 4, 2, 0, 1, 8, 10], weights := [0, 1, 0, 1] }

def points31 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 1854, representative 1514.
def source32 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨93, by decide +kernel⟩

def target32 : Weights.Entry :=
  { word := [1, 4, 2, 0, 1, 8, 12], weights := [0, 1, 0, 1] }

def points32 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 1866, representative 1431.
def source33 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨10, by decide +kernel⟩

def target33 : Weights.Entry :=
  { word := [1, 4, 2, 0, 9, 8, 9], weights := [0, 1, 0, 1] }

def points33 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 1867, representative 1506.
def source34 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨85, by decide +kernel⟩

def target34 : Weights.Entry :=
  { word := [1, 4, 2, 0, 9, 8, 10], weights := [0, 1, 0, 1] }

def points34 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 1868, representative 1510.
def source35 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨89, by decide +kernel⟩

def target35 : Weights.Entry :=
  { word := [1, 4, 2, 0, 9, 8, 12], weights := [0, 1, 0, 1] }

def points35 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 1876, representative 1459.
def source36 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨38, by decide +kernel⟩

def target36 : Weights.Entry :=
  { word := [1, 4, 2, 8, 2, 8, 10], weights := [0, 1, 1, 0] }

def points36 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 1890, representative 1442.
def source37 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨21, by decide +kernel⟩

def target37 : Weights.Entry :=
  { word := [1, 4, 2, 8, 10, 8, 10], weights := [0, 1, 1, 0] }

def points37 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 1902, representative 1435.
def source38 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨14, by decide +kernel⟩

def target38 : Weights.Entry :=
  { word := [1, 4, 4, 4, 0, 8, 9], weights := [1, 0, 0, 1] }

def points38 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6)]

-- Period 7, original row 1903, representative 1518.
def source39 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨97, by decide +kernel⟩

def target39 : Weights.Entry :=
  { word := [1, 4, 4, 4, 0, 8, 10], weights := [1, 0, 0, 1] }

def points39 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6)]

-- Period 7, original row 1904, representative 1514.
def source40 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨93, by decide +kernel⟩

def target40 : Weights.Entry :=
  { word := [1, 4, 4, 4, 0, 8, 12], weights := [1, 0, 0, 1] }

def points40 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6)]

-- Period 7, original row 1916, representative 1424.
def source41 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨3, by decide +kernel⟩

def target41 : Weights.Entry :=
  { word := [1, 4, 4, 4, 8, 8, 9], weights := [1, 0, 1, 0] }

def points41 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 1917, representative 1478.
def source42 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨57, by decide +kernel⟩

def target42 : Weights.Entry :=
  { word := [1, 4, 4, 4, 8, 8, 10], weights := [1, 0, 1, 0] }

def points42 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 1918, representative 1485.
def source43 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨64, by decide +kernel⟩

def target43 : Weights.Entry :=
  { word := [1, 4, 4, 4, 8, 8, 12], weights := [1, 0, 0, 1] }

def points43 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 1929, representative 1471.
def source44 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨50, by decide +kernel⟩

def target44 : Weights.Entry :=
  { word := [1, 4, 8, 4, 2, 8, 10], weights := [0, 0, 1, 0] }

def points44 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 1930, representative 1532.
def source45 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨111, by decide +kernel⟩

def target45 : Weights.Entry :=
  { word := [1, 4, 8, 4, 2, 8, 12], weights := [1, 0, 0, 1] }

def points45 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 1955, representative 1454.
def source46 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨33, by decide +kernel⟩

def target46 : Weights.Entry :=
  { word := [1, 4, 8, 4, 10, 8, 10], weights := [0, 0, 1, 0] }

def points46 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 1956, representative 1525.
def source47 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨104, by decide +kernel⟩

def target47 : Weights.Entry :=
  { word := [1, 4, 8, 4, 10, 8, 12], weights := [1, 0, 0, 1] }

def points47 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 1979, representative 1438.
def source48 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨17, by decide +kernel⟩

def target48 : Weights.Entry :=
  { word := [1, 4, 10, 0, 1, 8, 9], weights := [0, 1, 0, 1] }

def points48 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 1980, representative 1521.
def source49 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨100, by decide +kernel⟩

def target49 : Weights.Entry :=
  { word := [1, 4, 10, 0, 1, 8, 10], weights := [0, 1, 0, 1] }

def points49 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 1981, representative 1517.
def source50 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨96, by decide +kernel⟩

def target50 : Weights.Entry :=
  { word := [1, 4, 10, 0, 1, 8, 12], weights := [0, 1, 0, 1] }

def points50 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 1986, representative 1434.
def source51 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨13, by decide +kernel⟩

def target51 : Weights.Entry :=
  { word := [1, 4, 10, 0, 9, 8, 9], weights := [0, 1, 0, 1] }

def points51 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 1987, representative 1509.
def source52 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨88, by decide +kernel⟩

def target52 : Weights.Entry :=
  { word := [1, 4, 10, 0, 9, 8, 10], weights := [0, 1, 0, 1] }

def points52 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 1988, representative 1513.
def source53 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨92, by decide +kernel⟩

def target53 : Weights.Entry :=
  { word := [1, 4, 10, 0, 9, 8, 12], weights := [0, 1, 0, 1] }

def points53 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 1991, representative 1458.
def source54 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨37, by decide +kernel⟩

def target54 : Weights.Entry :=
  { word := [1, 4, 10, 8, 2, 8, 10], weights := [0, 1, 1, 0] }

def points54 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 2000, representative 1441.
def source55 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨20, by decide +kernel⟩

def target55 : Weights.Entry :=
  { word := [1, 4, 10, 8, 10, 8, 10], weights := [0, 1, 1, 0] }

def points55 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 2005, representative 1438.
def source56 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨17, by decide +kernel⟩

def target56 : Weights.Entry :=
  { word := [1, 4, 12, 4, 0, 8, 9], weights := [1, 0, 0, 1] }

def points56 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6)]

-- Period 7, original row 2006, representative 1521.
def source57 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨100, by decide +kernel⟩

def target57 : Weights.Entry :=
  { word := [1, 4, 12, 4, 0, 8, 10], weights := [1, 0, 0, 1] }

def points57 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6)]

-- Period 7, original row 2007, representative 1517.
def source58 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨96, by decide +kernel⟩

def target58 : Weights.Entry :=
  { word := [1, 4, 12, 4, 0, 8, 12], weights := [1, 0, 0, 1] }

def points58 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6)]

-- Period 7, original row 2019, representative 1427.
def source59 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨6, by decide +kernel⟩

def target59 : Weights.Entry :=
  { word := [1, 4, 12, 4, 8, 8, 9], weights := [1, 0, 1, 0] }

def points59 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 2020, representative 1481.
def source60 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨60, by decide +kernel⟩

def target60 : Weights.Entry :=
  { word := [1, 4, 12, 4, 8, 8, 10], weights := [1, 0, 1, 0] }

def points60 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 2021, representative 1488.
def source61 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨67, by decide +kernel⟩

def target61 : Weights.Entry :=
  { word := [1, 4, 12, 4, 8, 8, 12], weights := [1, 0, 0, 1] }

def points61 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 2027, representative 1548.
def source62 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨127, by decide +kernel⟩

def target62 : Weights.Entry :=
  { word := [1, 8, 1, 4, 2, 0, 10], weights := [0, 0, 1, 0] }

def points62 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 2028, representative 1542.
def source63 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨121, by decide +kernel⟩

def target63 : Weights.Entry :=
  { word := [1, 8, 1, 4, 2, 0, 12], weights := [1, 0, 0, 1] }

def points63 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 2032, representative 1467.
def source64 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨46, by decide +kernel⟩

def target64 : Weights.Entry :=
  { word := [1, 8, 1, 4, 2, 8, 10], weights := [0, 0, 1, 0] }

def points64 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 2033, representative 1534.
def source65 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨113, by decide +kernel⟩

def target65 : Weights.Entry :=
  { word := [1, 8, 1, 4, 2, 8, 12], weights := [1, 0, 0, 1] }

def points65 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 2049, representative 1545.
def source66 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨124, by decide +kernel⟩

def target66 : Weights.Entry :=
  { word := [1, 8, 1, 4, 10, 0, 10], weights := [0, 0, 1, 0] }

def points66 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 2050, representative 1540.
def source67 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨119, by decide +kernel⟩

def target67 : Weights.Entry :=
  { word := [1, 8, 1, 4, 10, 0, 12], weights := [1, 0, 0, 1] }

def points67 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 2054, representative 1450.
def source68 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨29, by decide +kernel⟩

def target68 : Weights.Entry :=
  { word := [1, 8, 1, 4, 10, 8, 10], weights := [0, 0, 1, 0] }

def points68 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 2055, representative 1527.
def source69 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨106, by decide +kernel⟩

def target69 : Weights.Entry :=
  { word := [1, 8, 1, 4, 10, 8, 12], weights := [1, 0, 0, 1] }

def points69 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 2081, representative 1460.
def source70 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨39, by decide +kernel⟩

def target70 : Weights.Entry :=
  { word := [1, 8, 2, 2, 2, 8, 10], weights := [0, 1, 0, 0] }

def points70 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 2082, representative 1500.
def source71 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨79, by decide +kernel⟩

def target71 : Weights.Entry :=
  { word := [1, 8, 2, 2, 2, 8, 12], weights := [1, 0, 0, 1] }

def points71 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 2096, representative 1443.
def source72 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨22, by decide +kernel⟩

def target72 : Weights.Entry :=
  { word := [1, 8, 2, 2, 10, 8, 10], weights := [0, 1, 0, 0] }

def points72 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 2097, representative 1494.
def source73 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨73, by decide +kernel⟩

def target73 : Weights.Entry :=
  { word := [1, 8, 2, 2, 10, 8, 12], weights := [1, 0, 0, 1] }

def points73 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 2110, representative 1463.
def source74 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨42, by decide +kernel⟩

def target74 : Weights.Entry :=
  { word := [1, 8, 2, 10, 2, 8, 10], weights := [0, 1, 0, 0] }

def points74 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 2111, representative 1503.
def source75 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨82, by decide +kernel⟩

def target75 : Weights.Entry :=
  { word := [1, 8, 2, 10, 2, 8, 12], weights := [1, 0, 0, 1] }

def points75 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 2124, representative 1446.
def source76 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨25, by decide +kernel⟩

def target76 : Weights.Entry :=
  { word := [1, 8, 2, 10, 10, 8, 10], weights := [0, 1, 0, 0] }

def points76 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 2125, representative 1497.
def source77 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨76, by decide +kernel⟩

def target77 : Weights.Entry :=
  { word := [1, 8, 2, 10, 10, 8, 12], weights := [1, 0, 0, 1] }

def points77 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 2168, representative 1461.
def source78 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨40, by decide +kernel⟩

def target78 : Weights.Entry :=
  { word := [1, 8, 10, 2, 2, 8, 10], weights := [0, 1, 0, 0] }

def points78 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 2169, representative 1501.
def source79 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨80, by decide +kernel⟩

def target79 : Weights.Entry :=
  { word := [1, 8, 10, 2, 2, 8, 12], weights := [1, 0, 0, 1] }

def points79 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 2176, representative 1444.
def source80 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨23, by decide +kernel⟩

def target80 : Weights.Entry :=
  { word := [1, 8, 10, 2, 10, 8, 10], weights := [0, 1, 0, 0] }

def points80 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 2177, representative 1495.
def source81 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨74, by decide +kernel⟩

def target81 : Weights.Entry :=
  { word := [1, 8, 10, 2, 10, 8, 12], weights := [1, 0, 0, 1] }

def points81 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 2183, representative 1462.
def source82 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨41, by decide +kernel⟩

def target82 : Weights.Entry :=
  { word := [1, 8, 10, 10, 2, 8, 10], weights := [0, 1, 0, 0] }

def points82 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 2184, representative 1502.
def source83 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨81, by decide +kernel⟩

def target83 : Weights.Entry :=
  { word := [1, 8, 10, 10, 2, 8, 12], weights := [1, 0, 0, 1] }

def points83 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 2190, representative 1445.
def source84 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨24, by decide +kernel⟩

def target84 : Weights.Entry :=
  { word := [1, 8, 10, 10, 10, 8, 10], weights := [0, 1, 0, 0] }

def points84 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 2191, representative 1496.
def source85 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨75, by decide +kernel⟩

def target85 : Weights.Entry :=
  { word := [1, 8, 10, 10, 10, 8, 12], weights := [1, 0, 0, 1] }

def points85 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 2206, representative 1538.
def source86 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨117, by decide +kernel⟩

def target86 : Weights.Entry :=
  { word := [1, 12, 2, 0, 1, 0, 12], weights := [0, 1, 0, 1] }

def points86 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 2211, representative 1436.
def source87 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨15, by decide +kernel⟩

def target87 : Weights.Entry :=
  { word := [1, 12, 2, 0, 1, 8, 9], weights := [0, 1, 0, 1] }

def points87 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 2212, representative 1519.
def source88 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨98, by decide +kernel⟩

def target88 : Weights.Entry :=
  { word := [1, 12, 2, 0, 1, 8, 10], weights := [0, 1, 0, 1] }

def points88 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 2213, representative 1515.
def source89 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨94, by decide +kernel⟩

def target89 : Weights.Entry :=
  { word := [1, 12, 2, 0, 1, 8, 12], weights := [0, 1, 0, 1] }

def points89 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 2220, representative 1539.
def source90 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨118, by decide +kernel⟩

def target90 : Weights.Entry :=
  { word := [1, 12, 2, 0, 9, 0, 12], weights := [0, 1, 0, 1] }

def points90 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 2225, representative 1432.
def source91 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨11, by decide +kernel⟩

def target91 : Weights.Entry :=
  { word := [1, 12, 2, 0, 9, 8, 9], weights := [0, 1, 0, 1] }

def points91 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 2226, representative 1507.
def source92 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨86, by decide +kernel⟩

def target92 : Weights.Entry :=
  { word := [1, 12, 2, 0, 9, 8, 10], weights := [0, 1, 0, 1] }

def points92 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 2227, representative 1511.
def source93 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨90, by decide +kernel⟩

def target93 : Weights.Entry :=
  { word := [1, 12, 2, 0, 9, 8, 12], weights := [0, 1, 0, 1] }

def points93 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 2231, representative 1547.
def source94 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨126, by decide +kernel⟩

def target94 : Weights.Entry :=
  { word := [1, 12, 2, 8, 2, 0, 9], weights := [0, 1, 1, 0] }

def points94 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 2235, representative 1457.
def source95 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨36, by decide +kernel⟩

def target95 : Weights.Entry :=
  { word := [1, 12, 2, 8, 2, 8, 10], weights := [0, 1, 1, 0] }

def points95 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 2245, representative 1544.
def source96 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨123, by decide +kernel⟩

def target96 : Weights.Entry :=
  { word := [1, 12, 2, 8, 10, 0, 9], weights := [0, 1, 1, 0] }

def points96 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 2249, representative 1440.
def source97 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨19, by decide +kernel⟩

def target97 : Weights.Entry :=
  { word := [1, 12, 2, 8, 10, 8, 10], weights := [0, 1, 1, 0] }

def points97 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 2256, representative 1538.
def source98 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨117, by decide +kernel⟩

def target98 : Weights.Entry :=
  { word := [1, 12, 4, 4, 0, 0, 12], weights := [1, 0, 0, 1] }

def points98 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6)]

-- Period 7, original row 2261, representative 1436.
def source99 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨15, by decide +kernel⟩

def target99 : Weights.Entry :=
  { word := [1, 12, 4, 4, 0, 8, 9], weights := [1, 0, 0, 1] }

def points99 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6)]

-- Period 7, original row 2262, representative 1519.
def source100 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨98, by decide +kernel⟩

def target100 : Weights.Entry :=
  { word := [1, 12, 4, 4, 0, 8, 10], weights := [1, 0, 0, 1] }

def points100 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6)]

-- Period 7, original row 2263, representative 1515.
def source101 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨94, by decide +kernel⟩

def target101 : Weights.Entry :=
  { word := [1, 12, 4, 4, 0, 8, 12], weights := [1, 0, 0, 1] }

def points101 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6)]

-- Period 7, original row 2270, representative 1536.
def source102 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨115, by decide +kernel⟩

def target102 : Weights.Entry :=
  { word := [1, 12, 4, 4, 8, 0, 12], weights := [1, 0, 0, 1] }

def points102 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 2275, representative 1425.
def source103 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨4, by decide +kernel⟩

def target103 : Weights.Entry :=
  { word := [1, 12, 4, 4, 8, 8, 9], weights := [1, 0, 1, 0] }

def points103 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 2276, representative 1479.
def source104 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨58, by decide +kernel⟩

def target104 : Weights.Entry :=
  { word := [1, 12, 4, 4, 8, 8, 10], weights := [1, 0, 1, 0] }

def points104 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 2277, representative 1486.
def source105 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨65, by decide +kernel⟩

def target105 : Weights.Entry :=
  { word := [1, 12, 4, 4, 8, 8, 12], weights := [1, 0, 0, 1] }

def points105 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 2284, representative 1543.
def source106 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨122, by decide +kernel⟩

def target106 : Weights.Entry :=
  { word := [1, 12, 8, 4, 2, 0, 12], weights := [1, 0, 0, 1] }

def points106 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 2288, representative 1470.
def source107 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨49, by decide +kernel⟩

def target107 : Weights.Entry :=
  { word := [1, 12, 8, 4, 2, 8, 10], weights := [0, 0, 1, 0] }

def points107 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 2289, representative 1531.
def source108 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨110, by decide +kernel⟩

def target108 : Weights.Entry :=
  { word := [1, 12, 8, 4, 2, 8, 12], weights := [1, 0, 0, 1] }

def points108 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 2308, representative 1546.
def source109 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨125, by decide +kernel⟩

def target109 : Weights.Entry :=
  { word := [1, 12, 8, 4, 10, 0, 9], weights := [0, 0, 1, 0] }

def points109 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 2310, representative 1541.
def source110 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨120, by decide +kernel⟩

def target110 : Weights.Entry :=
  { word := [1, 12, 8, 4, 10, 0, 12], weights := [1, 0, 0, 1] }

def points110 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 2314, representative 1453.
def source111 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨32, by decide +kernel⟩

def target111 : Weights.Entry :=
  { word := [1, 12, 8, 4, 10, 8, 10], weights := [0, 0, 1, 0] }

def points111 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 2315, representative 1524.
def source112 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨103, by decide +kernel⟩

def target112 : Weights.Entry :=
  { word := [1, 12, 8, 4, 10, 8, 12], weights := [1, 0, 0, 1] }

def points112 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 2338, representative 1437.
def source113 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨16, by decide +kernel⟩

def target113 : Weights.Entry :=
  { word := [1, 12, 10, 0, 1, 8, 9], weights := [0, 1, 0, 1] }

def points113 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 2339, representative 1520.
def source114 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨99, by decide +kernel⟩

def target114 : Weights.Entry :=
  { word := [1, 12, 10, 0, 1, 8, 10], weights := [0, 1, 0, 1] }

def points114 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 2340, representative 1516.
def source115 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨95, by decide +kernel⟩

def target115 : Weights.Entry :=
  { word := [1, 12, 10, 0, 1, 8, 12], weights := [0, 1, 0, 1] }

def points115 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 2345, representative 1433.
def source116 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨12, by decide +kernel⟩

def target116 : Weights.Entry :=
  { word := [1, 12, 10, 0, 9, 8, 9], weights := [0, 1, 0, 1] }

def points116 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 2346, representative 1508.
def source117 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨87, by decide +kernel⟩

def target117 : Weights.Entry :=
  { word := [1, 12, 10, 0, 9, 8, 10], weights := [0, 1, 0, 1] }

def points117 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 2347, representative 1512.
def source118 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨91, by decide +kernel⟩

def target118 : Weights.Entry :=
  { word := [1, 12, 10, 0, 9, 8, 12], weights := [0, 1, 0, 1] }

def points118 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 2350, representative 1456.
def source119 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨35, by decide +kernel⟩

def target119 : Weights.Entry :=
  { word := [1, 12, 10, 8, 2, 8, 10], weights := [0, 1, 1, 0] }

def points119 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 2359, representative 1439.
def source120 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨18, by decide +kernel⟩

def target120 : Weights.Entry :=
  { word := [1, 12, 10, 8, 10, 8, 10], weights := [0, 1, 1, 0] }

def points120 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 2364, representative 1437.
def source121 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨16, by decide +kernel⟩

def target121 : Weights.Entry :=
  { word := [1, 12, 12, 4, 0, 8, 9], weights := [1, 0, 0, 1] }

def points121 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6)]

-- Period 7, original row 2365, representative 1520.
def source122 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨99, by decide +kernel⟩

def target122 : Weights.Entry :=
  { word := [1, 12, 12, 4, 0, 8, 10], weights := [1, 0, 0, 1] }

def points122 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6)]

-- Period 7, original row 2366, representative 1516.
def source123 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨95, by decide +kernel⟩

def target123 : Weights.Entry :=
  { word := [1, 12, 12, 4, 0, 8, 12], weights := [1, 0, 0, 1] }

def points123 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6)]

-- Period 7, original row 2373, representative 1537.
def source124 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨116, by decide +kernel⟩

def target124 : Weights.Entry :=
  { word := [1, 12, 12, 4, 8, 0, 12], weights := [1, 0, 0, 1] }

def points124 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 2378, representative 1426.
def source125 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨5, by decide +kernel⟩

def target125 : Weights.Entry :=
  { word := [1, 12, 12, 4, 8, 8, 9], weights := [1, 0, 1, 0] }

def points125 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 2379, representative 1480.
def source126 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨59, by decide +kernel⟩

def target126 : Weights.Entry :=
  { word := [1, 12, 12, 4, 8, 8, 10], weights := [1, 0, 1, 0] }

def points126 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 2380, representative 1487.
def source127 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨66, by decide +kernel⟩

def target127 : Weights.Entry :=
  { word := [1, 12, 12, 4, 8, 8, 12], weights := [1, 0, 0, 1] }

def points127 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

def period7Entries : List Weights.Entry := [target0, target1, target2, target3, target4, target5, target6, target7, target8, target9, target10, target11, target12, target13, target14, target15, target16, target17, target18, target19, target20, target21, target22, target23, target24, target25, target26, target27, target28, target29, target30, target31, target32, target33, target34, target35, target36, target37, target38, target39, target40, target41, target42, target43, target44, target45, target46, target47, target48, target49, target50, target51, target52, target53, target54, target55, target56, target57, target58, target59, target60, target61, target62, target63, target64, target65, target66, target67, target68, target69, target70, target71, target72, target73, target74, target75, target76, target77, target78, target79, target80, target81, target82, target83, target84, target85, target86, target87, target88, target89, target90, target91, target92, target93, target94, target95, target96, target97, target98, target99, target100, target101, target102, target103, target104, target105, target106, target107, target108, target109, target110, target111, target112, target113, target114, target115, target116, target117, target118, target119, target120, target121, target122, target123, target124, target125, target126, target127]

def period7Chunk : RowCoverage.Chunk where
  rows := [⟨1666, target0⟩, ⟨1670, target1⟩, ⟨1671, target2⟩, ⟨1694, target3⟩, ⟨1695, target4⟩, ⟨1696, target5⟩, ⟨1701, target6⟩, ⟨1702, target7⟩, ⟨1703, target8⟩, ⟨1706, target9⟩, ⟨1715, target10⟩, ⟨1720, target11⟩, ⟨1721, target12⟩, ⟨1722, target13⟩, ⟨1729, target14⟩, ⟨1734, target15⟩, ⟨1735, target16⟩, ⟨1736, target17⟩, ⟨1747, target18⟩, ⟨1748, target19⟩, ⟨1769, target20⟩, ⟨1770, target21⟩, ⟨1796, target22⟩, ⟨1797, target23⟩, ⟨1811, target24⟩, ⟨1812, target25⟩, ⟨1831, target26⟩, ⟨1832, target27⟩, ⟨1839, target28⟩, ⟨1840, target29⟩, ⟨1852, target30⟩, ⟨1853, target31⟩, ⟨1854, target32⟩, ⟨1866, target33⟩, ⟨1867, target34⟩, ⟨1868, target35⟩, ⟨1876, target36⟩, ⟨1890, target37⟩, ⟨1902, target38⟩, ⟨1903, target39⟩, ⟨1904, target40⟩, ⟨1916, target41⟩, ⟨1917, target42⟩, ⟨1918, target43⟩, ⟨1929, target44⟩, ⟨1930, target45⟩, ⟨1955, target46⟩, ⟨1956, target47⟩, ⟨1979, target48⟩, ⟨1980, target49⟩, ⟨1981, target50⟩, ⟨1986, target51⟩, ⟨1987, target52⟩, ⟨1988, target53⟩, ⟨1991, target54⟩, ⟨2000, target55⟩, ⟨2005, target56⟩, ⟨2006, target57⟩, ⟨2007, target58⟩, ⟨2019, target59⟩, ⟨2020, target60⟩, ⟨2021, target61⟩, ⟨2027, target62⟩, ⟨2028, target63⟩, ⟨2032, target64⟩, ⟨2033, target65⟩, ⟨2049, target66⟩, ⟨2050, target67⟩, ⟨2054, target68⟩, ⟨2055, target69⟩, ⟨2081, target70⟩, ⟨2082, target71⟩, ⟨2096, target72⟩, ⟨2097, target73⟩, ⟨2110, target74⟩, ⟨2111, target75⟩, ⟨2124, target76⟩, ⟨2125, target77⟩, ⟨2168, target78⟩, ⟨2169, target79⟩, ⟨2176, target80⟩, ⟨2177, target81⟩, ⟨2183, target82⟩, ⟨2184, target83⟩, ⟨2190, target84⟩, ⟨2191, target85⟩, ⟨2206, target86⟩, ⟨2211, target87⟩, ⟨2212, target88⟩, ⟨2213, target89⟩, ⟨2220, target90⟩, ⟨2225, target91⟩, ⟨2226, target92⟩, ⟨2227, target93⟩, ⟨2231, target94⟩, ⟨2235, target95⟩, ⟨2245, target96⟩, ⟨2249, target97⟩, ⟨2256, target98⟩, ⟨2261, target99⟩, ⟨2262, target100⟩, ⟨2263, target101⟩, ⟨2270, target102⟩, ⟨2275, target103⟩, ⟨2276, target104⟩, ⟨2277, target105⟩, ⟨2284, target106⟩, ⟨2288, target107⟩, ⟨2289, target108⟩, ⟨2308, target109⟩, ⟨2310, target110⟩, ⟨2314, target111⟩, ⟨2315, target112⟩, ⟨2338, target113⟩, ⟨2339, target114⟩, ⟨2340, target115⟩, ⟨2345, target116⟩, ⟨2346, target117⟩, ⟨2347, target118⟩, ⟨2350, target119⟩, ⟨2359, target120⟩, ⟨2364, target121⟩, ⟨2365, target122⟩, ⟨2366, target123⟩, ⟨2373, target124⟩, ⟨2378, target125⟩, ⟨2379, target126⟩, ⟨2380, target127⟩]
  indexMask := 497037018460248744969293307903971001830913826977851318040329465360051218151312429474405997662750326019017518007802398581385387316311251834406157077018854404209625931516262098889936639479093001600875028697623788591039960977894750989880708978955057517616575772447295955136174646341553034050583705926216756200104441354241421090038994795225466681289993372643287790245897631264082005727249436244251037625550982014709056635231818341850850047494511780510165058704402926391052759962631237630162484416553772073756070713225265357068175992911946884820346135056983350650828000396729504353544242533910708836498476706861259989582921052068958778824540836387419559028578840164131982262894981718236600675434885548966103406801540087808
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

end FranklSmallCyclic.TransportBatches.G011.B001.Data
