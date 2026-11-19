module

public import Conjectures.FranklSmallCyclicRowCoverage
public import Conjectures.FranklSmallCyclicCanonicalWords
public import Conjectures.FranklSmallCyclicOrbit7Block012Data

/-! 128 literal targets sharing one source proof block.
Original words and row indices are retained; weights may be transported.
-/
@[expose] public section

namespace FranklSmallCyclic.TransportBatches.G012.B001.Data

-- Period 7, original row 1872, representative 1574.
def source0 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B012.Data.entryAt ⟨25, by decide +kernel⟩

def target0 : Weights.Entry :=
  { word := [1, 4, 2, 8, 2, 0, 9], weights := [0, 1, 1, 0] }

def points0 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 1873, representative 1574.
def source1 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B012.Data.entryAt ⟨25, by decide +kernel⟩

def target1 : Weights.Entry :=
  { word := [1, 4, 2, 8, 2, 0, 10], weights := [0, 1, 1, 0] }

def points1 : List (ℕ × ℕ) := [(0, 0), (1, 2), (2, 1), (3, 3), (4, 5), (5, 4), (6, 6)]

-- Period 7, original row 1886, representative 1555.
def source2 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B012.Data.entryAt ⟨6, by decide +kernel⟩

def target2 : Weights.Entry :=
  { word := [1, 4, 2, 8, 10, 0, 9], weights := [0, 1, 1, 0] }

def points2 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 1887, representative 1555.
def source3 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B012.Data.entryAt ⟨6, by decide +kernel⟩

def target3 : Weights.Entry :=
  { word := [1, 4, 2, 8, 10, 0, 10], weights := [0, 1, 1, 0] }

def points3 : List (ℕ × ℕ) := [(0, 0), (1, 2), (2, 1), (3, 3), (4, 5), (5, 4), (6, 6)]

-- Period 7, original row 1895, representative 1594.
def source4 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B012.Data.entryAt ⟨45, by decide +kernel⟩

def target4 : Weights.Entry :=
  { word := [1, 4, 4, 4, 0, 0, 9], weights := [1, 0, 0, 0] }

def points4 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 2), (3, 5), (4, 4), (5, 3), (6, 6)]

-- Period 7, original row 1896, representative 1594.
def source5 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B012.Data.entryAt ⟨45, by decide +kernel⟩

def target5 : Weights.Entry :=
  { word := [1, 4, 4, 4, 0, 0, 10], weights := [0, 0, 1, 0] }

def points5 : List (ℕ × ℕ) := [(0, 2), (1, 0), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 1897, representative 1577.
def source6 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B012.Data.entryAt ⟨28, by decide +kernel⟩

def target6 : Weights.Entry :=
  { word := [1, 4, 4, 4, 0, 0, 12], weights := [0, 0, 1, 0] }

def points6 : List (ℕ × ℕ) := [(0, 2), (1, 0), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 1909, representative 1588.
def source7 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B012.Data.entryAt ⟨39, by decide +kernel⟩

def target7 : Weights.Entry :=
  { word := [1, 4, 4, 4, 8, 0, 9], weights := [1, 0, 1, 0] }

def points7 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 1910, representative 1569.
def source8 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B012.Data.entryAt ⟨20, by decide +kernel⟩

def target8 : Weights.Entry :=
  { word := [1, 4, 4, 4, 8, 0, 10], weights := [1, 0, 1, 0] }

def points8 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 1911, representative 1571.
def source9 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B012.Data.entryAt ⟨22, by decide +kernel⟩

def target9 : Weights.Entry :=
  { word := [1, 4, 4, 4, 8, 0, 12], weights := [1, 0, 0, 1] }

def points9 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 1923, representative 1579.
def source10 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B012.Data.entryAt ⟨30, by decide +kernel⟩

def target10 : Weights.Entry :=
  { word := [1, 4, 8, 4, 2, 0, 9], weights := [0, 0, 1, 0] }

def points10 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 1924, representative 1596.
def source11 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B012.Data.entryAt ⟨47, by decide +kernel⟩

def target11 : Weights.Entry :=
  { word := [1, 4, 8, 4, 2, 0, 10], weights := [0, 0, 1, 0] }

def points11 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 1925, representative 1596.
def source12 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B012.Data.entryAt ⟨47, by decide +kernel⟩

def target12 : Weights.Entry :=
  { word := [1, 4, 8, 4, 2, 0, 12], weights := [1, 0, 0, 0] }

def points12 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 2), (3, 5), (4, 4), (5, 3), (6, 6)]

-- Period 7, original row 1949, representative 1559.
def source13 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B012.Data.entryAt ⟨10, by decide +kernel⟩

def target13 : Weights.Entry :=
  { word := [1, 4, 8, 4, 10, 0, 9], weights := [0, 0, 1, 0] }

def points13 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 1950, representative 1565.
def source14 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B012.Data.entryAt ⟨16, by decide +kernel⟩

def target14 : Weights.Entry :=
  { word := [1, 4, 8, 4, 10, 0, 10], weights := [0, 0, 1, 0] }

def points14 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 1951, representative 1591.
def source15 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B012.Data.entryAt ⟨42, by decide +kernel⟩

def target15 : Weights.Entry :=
  { word := [1, 4, 8, 4, 10, 0, 12], weights := [1, 0, 0, 1] }

def points15 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 2012, representative 1589.
def source16 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B012.Data.entryAt ⟨40, by decide +kernel⟩

def target16 : Weights.Entry :=
  { word := [1, 4, 12, 4, 8, 0, 9], weights := [1, 0, 1, 0] }

def points16 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 2013, representative 1570.
def source17 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B012.Data.entryAt ⟨21, by decide +kernel⟩

def target17 : Weights.Entry :=
  { word := [1, 4, 12, 4, 8, 0, 10], weights := [1, 0, 1, 0] }

def points17 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 2014, representative 1572.
def source18 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B012.Data.entryAt ⟨23, by decide +kernel⟩

def target18 : Weights.Entry :=
  { word := [1, 4, 12, 4, 8, 0, 12], weights := [1, 0, 0, 1] }

def points18 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 2026, representative 1586.
def source19 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B012.Data.entryAt ⟨37, by decide +kernel⟩

def target19 : Weights.Entry :=
  { word := [1, 8, 1, 4, 2, 0, 9], weights := [0, 0, 1, 0] }

def points19 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 2048, representative 1560.
def source20 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B012.Data.entryAt ⟨11, by decide +kernel⟩

def target20 : Weights.Entry :=
  { word := [1, 8, 1, 4, 10, 0, 9], weights := [0, 0, 1, 0] }

def points20 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 2072, representative 1592.
def source21 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B012.Data.entryAt ⟨43, by decide +kernel⟩

def target21 : Weights.Entry :=
  { word := [1, 8, 2, 2, 2, 0, 9], weights := [0, 1, 0, 0] }

def points21 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 2073, representative 1575.
def source22 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B012.Data.entryAt ⟨26, by decide +kernel⟩

def target22 : Weights.Entry :=
  { word := [1, 8, 2, 2, 2, 0, 10], weights := [0, 1, 0, 0] }

def points22 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 2074, representative 1580.
def source23 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B012.Data.entryAt ⟨31, by decide +kernel⟩

def target23 : Weights.Entry :=
  { word := [1, 8, 2, 2, 2, 0, 12], weights := [1, 0, 0, 1] }

def points23 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 2087, representative 1562.
def source24 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B012.Data.entryAt ⟨13, by decide +kernel⟩

def target24 : Weights.Entry :=
  { word := [1, 8, 2, 2, 10, 0, 9], weights := [0, 1, 0, 0] }

def points24 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 2088, representative 1556.
def source25 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B012.Data.entryAt ⟨7, by decide +kernel⟩

def target25 : Weights.Entry :=
  { word := [1, 8, 2, 2, 10, 0, 10], weights := [0, 1, 0, 0] }

def points25 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 2089, representative 1581.
def source26 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B012.Data.entryAt ⟨32, by decide +kernel⟩

def target26 : Weights.Entry :=
  { word := [1, 8, 2, 2, 10, 0, 12], weights := [1, 0, 0, 1] }

def points26 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 2102, representative 1593.
def source27 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B012.Data.entryAt ⟨44, by decide +kernel⟩

def target27 : Weights.Entry :=
  { word := [1, 8, 2, 10, 2, 0, 9], weights := [0, 1, 0, 0] }

def points27 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 2103, representative 1576.
def source28 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B012.Data.entryAt ⟨27, by decide +kernel⟩

def target28 : Weights.Entry :=
  { word := [1, 8, 2, 10, 2, 0, 10], weights := [0, 1, 0, 0] }

def points28 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 2104, representative 1583.
def source29 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B012.Data.entryAt ⟨34, by decide +kernel⟩

def target29 : Weights.Entry :=
  { word := [1, 8, 2, 10, 2, 0, 12], weights := [1, 1, 0, 0] }

def points29 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 2116, representative 1563.
def source30 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B012.Data.entryAt ⟨14, by decide +kernel⟩

def target30 : Weights.Entry :=
  { word := [1, 8, 2, 10, 10, 0, 9], weights := [0, 1, 0, 0] }

def points30 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 2117, representative 1557.
def source31 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B012.Data.entryAt ⟨8, by decide +kernel⟩

def target31 : Weights.Entry :=
  { word := [1, 8, 2, 10, 10, 0, 10], weights := [0, 1, 0, 0] }

def points31 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 2118, representative 1582.
def source32 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B012.Data.entryAt ⟨33, by decide +kernel⟩

def target32 : Weights.Entry :=
  { word := [1, 8, 2, 10, 10, 0, 12], weights := [1, 1, 0, 0] }

def points32 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 2204, representative 1552.
def source33 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B012.Data.entryAt ⟨3, by decide +kernel⟩

def target33 : Weights.Entry :=
  { word := [1, 12, 2, 0, 1, 0, 9], weights := [0, 1, 0, 1] }

def points33 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 2205, representative 1584.
def source34 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B012.Data.entryAt ⟨35, by decide +kernel⟩

def target34 : Weights.Entry :=
  { word := [1, 12, 2, 0, 1, 0, 10], weights := [0, 1, 0, 1] }

def points34 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 2218, representative 1553.
def source35 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B012.Data.entryAt ⟨4, by decide +kernel⟩

def target35 : Weights.Entry :=
  { word := [1, 12, 2, 0, 9, 0, 9], weights := [0, 1, 0, 1] }

def points35 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 2219, representative 1585.
def source36 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B012.Data.entryAt ⟨36, by decide +kernel⟩

def target36 : Weights.Entry :=
  { word := [1, 12, 2, 0, 9, 0, 10], weights := [0, 1, 0, 1] }

def points36 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 2232, representative 1573.
def source37 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B012.Data.entryAt ⟨24, by decide +kernel⟩

def target37 : Weights.Entry :=
  { word := [1, 12, 2, 8, 2, 0, 10], weights := [0, 1, 1, 0] }

def points37 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 2246, representative 1554.
def source38 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B012.Data.entryAt ⟨5, by decide +kernel⟩

def target38 : Weights.Entry :=
  { word := [1, 12, 2, 8, 10, 0, 10], weights := [0, 1, 1, 0] }

def points38 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 2254, representative 1552.
def source39 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B012.Data.entryAt ⟨3, by decide +kernel⟩

def target39 : Weights.Entry :=
  { word := [1, 12, 4, 4, 0, 0, 9], weights := [1, 0, 0, 1] }

def points39 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6)]

-- Period 7, original row 2255, representative 1584.
def source40 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B012.Data.entryAt ⟨35, by decide +kernel⟩

def target40 : Weights.Entry :=
  { word := [1, 12, 4, 4, 0, 0, 10], weights := [1, 0, 0, 1] }

def points40 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6)]

-- Period 7, original row 2268, representative 1550.
def source41 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B012.Data.entryAt ⟨1, by decide +kernel⟩

def target41 : Weights.Entry :=
  { word := [1, 12, 4, 4, 8, 0, 9], weights := [1, 0, 1, 0] }

def points41 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 2269, representative 1567.
def source42 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B012.Data.entryAt ⟨18, by decide +kernel⟩

def target42 : Weights.Entry :=
  { word := [1, 12, 4, 4, 8, 0, 10], weights := [1, 0, 1, 0] }

def points42 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 2282, representative 1549.
def source43 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B012.Data.entryAt ⟨0, by decide +kernel⟩

def target43 : Weights.Entry :=
  { word := [1, 12, 8, 4, 2, 0, 9], weights := [0, 0, 1, 0] }

def points43 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 2283, representative 1587.
def source44 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B012.Data.entryAt ⟨38, by decide +kernel⟩

def target44 : Weights.Entry :=
  { word := [1, 12, 8, 4, 2, 0, 10], weights := [0, 0, 1, 0] }

def points44 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 2309, representative 1561.
def source45 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B012.Data.entryAt ⟨12, by decide +kernel⟩

def target45 : Weights.Entry :=
  { word := [1, 12, 8, 4, 10, 0, 10], weights := [0, 0, 1, 0] }

def points45 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 2371, representative 1551.
def source46 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B012.Data.entryAt ⟨2, by decide +kernel⟩

def target46 : Weights.Entry :=
  { word := [1, 12, 12, 4, 8, 0, 9], weights := [1, 0, 1, 0] }

def points46 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 2372, representative 1568.
def source47 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B012.Data.entryAt ⟨19, by decide +kernel⟩

def target47 : Weights.Entry :=
  { word := [1, 12, 12, 4, 8, 0, 10], weights := [1, 0, 1, 0] }

def points47 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 2389, representative 1643.
def source48 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B012.Data.entryAt ⟨94, by decide +kernel⟩

def target48 : Weights.Entry :=
  { word := [2, 0, 0, 9, 4, 12, 4], weights := [1, 0, 1, 1] }

-- Period 7, original row 2393, representative 1642.
def source49 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B012.Data.entryAt ⟨93, by decide +kernel⟩

def target49 : Weights.Entry :=
  { word := [2, 0, 0, 9, 12, 12, 4], weights := [1, 0, 1, 1] }

-- Period 7, original row 2402, representative 1625.
def source50 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B012.Data.entryAt ⟨76, by decide +kernel⟩

def target50 : Weights.Entry :=
  { word := [2, 0, 0, 12, 0, 12, 4], weights := [1, 0, 1, 0] }

-- Period 7, original row 2442, representative 1631.
def source51 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B012.Data.entryAt ⟨82, by decide +kernel⟩

def target51 : Weights.Entry :=
  { word := [2, 0, 4, 10, 0, 12, 2], weights := [1, 0, 1, 1] }

-- Period 7, original row 2443, representative 1631.
def source52 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B012.Data.entryAt ⟨82, by decide +kernel⟩

def target52 : Weights.Entry :=
  { word := [2, 0, 4, 10, 0, 12, 4], weights := [1, 0, 1, 1] }

def points52 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 2453, representative 1630.
def source53 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B012.Data.entryAt ⟨81, by decide +kernel⟩

def target53 : Weights.Entry :=
  { word := [2, 0, 4, 10, 8, 12, 4], weights := [1, 0, 1, 1] }

-- Period 7, original row 2474, representative 1622.
def source54 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B012.Data.entryAt ⟨73, by decide +kernel⟩

def target54 : Weights.Entry :=
  { word := [2, 0, 8, 4, 8, 12, 4], weights := [1, 0, 0, 1] }

-- Period 7, original row 2478, representative 1641.
def source55 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B012.Data.entryAt ⟨92, by decide +kernel⟩

def target55 : Weights.Entry :=
  { word := [2, 0, 8, 9, 4, 12, 4], weights := [1, 0, 1, 1] }

-- Period 7, original row 2482, representative 1640.
def source56 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B012.Data.entryAt ⟨91, by decide +kernel⟩

def target56 : Weights.Entry :=
  { word := [2, 0, 8, 9, 12, 12, 4], weights := [1, 0, 1, 1] }

-- Period 7, original row 2493, representative 1624.
def source57 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B012.Data.entryAt ⟨75, by decide +kernel⟩

def target57 : Weights.Entry :=
  { word := [2, 0, 8, 12, 0, 12, 2], weights := [1, 0, 1, 0] }

-- Period 7, original row 2494, representative 1624.
def source58 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B012.Data.entryAt ⟨75, by decide +kernel⟩

def target58 : Weights.Entry :=
  { word := [2, 0, 8, 12, 0, 12, 4], weights := [1, 0, 1, 0] }

def points58 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 2504, representative 1623.
def source59 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B012.Data.entryAt ⟨74, by decide +kernel⟩

def target59 : Weights.Entry :=
  { word := [2, 0, 8, 12, 8, 12, 4], weights := [1, 0, 1, 0] }

-- Period 7, original row 2513, representative 1636.
def source60 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B012.Data.entryAt ⟨87, by decide +kernel⟩

def target60 : Weights.Entry :=
  { word := [2, 0, 9, 8, 1, 12, 2], weights := [1, 0, 1, 1] }

-- Period 7, original row 2514, representative 1636.
def source61 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B012.Data.entryAt ⟨87, by decide +kernel⟩

def target61 : Weights.Entry :=
  { word := [2, 0, 9, 8, 1, 12, 4], weights := [1, 0, 1, 1] }

def points61 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 2520, representative 1635.
def source62 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B012.Data.entryAt ⟨86, by decide +kernel⟩

def target62 : Weights.Entry :=
  { word := [2, 0, 9, 8, 9, 12, 4], weights := [1, 0, 1, 1] }

-- Period 7, original row 2564, representative 1629.
def source63 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B012.Data.entryAt ⟨80, by decide +kernel⟩

def target63 : Weights.Entry :=
  { word := [2, 0, 12, 10, 0, 12, 2], weights := [1, 0, 1, 1] }

-- Period 7, original row 2565, representative 1629.
def source64 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B012.Data.entryAt ⟨80, by decide +kernel⟩

def target64 : Weights.Entry :=
  { word := [2, 0, 12, 10, 0, 12, 4], weights := [1, 0, 1, 1] }

def points64 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 2575, representative 1628.
def source65 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B012.Data.entryAt ⟨79, by decide +kernel⟩

def target65 : Weights.Entry :=
  { word := [2, 0, 12, 10, 8, 12, 4], weights := [1, 0, 1, 1] }

-- Period 7, original row 2623, representative 1611.
def source66 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B012.Data.entryAt ⟨62, by decide +kernel⟩

def target66 : Weights.Entry :=
  { word := [2, 2, 2, 8, 0, 4, 0], weights := [1, 0, 1, 0] }

def points66 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 3), (5, 4), (6, 5)]

-- Period 7, original row 2625, representative 1609.
def source67 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B012.Data.entryAt ⟨60, by decide +kernel⟩

def target67 : Weights.Entry :=
  { word := [2, 2, 2, 8, 0, 12, 0], weights := [1, 0, 1, 0] }

def points67 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 2637, representative 1610.
def source68 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B012.Data.entryAt ⟨61, by decide +kernel⟩

def target68 : Weights.Entry :=
  { word := [2, 2, 2, 8, 8, 4, 0], weights := [1, 0, 1, 0] }

def points68 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 2639, representative 1608.
def source69 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B012.Data.entryAt ⟨59, by decide +kernel⟩

def target69 : Weights.Entry :=
  { word := [2, 2, 2, 8, 8, 12, 0], weights := [1, 0, 1, 0] }

def points69 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 2765, representative 1607.
def source70 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B012.Data.entryAt ⟨58, by decide +kernel⟩

def target70 : Weights.Entry :=
  { word := [2, 2, 10, 8, 0, 4, 0], weights := [1, 0, 1, 0] }

def points70 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 3), (5, 4), (6, 5)]

-- Period 7, original row 2767, representative 1605.
def source71 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B012.Data.entryAt ⟨56, by decide +kernel⟩

def target71 : Weights.Entry :=
  { word := [2, 2, 10, 8, 0, 12, 0], weights := [1, 0, 1, 0] }

def points71 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 2779, representative 1606.
def source72 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B012.Data.entryAt ⟨57, by decide +kernel⟩

def target72 : Weights.Entry :=
  { word := [2, 2, 10, 8, 8, 4, 0], weights := [1, 0, 1, 0] }

def points72 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 2781, representative 1604.
def source73 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B012.Data.entryAt ⟨55, by decide +kernel⟩

def target73 : Weights.Entry :=
  { word := [2, 2, 10, 8, 8, 12, 0], weights := [1, 0, 1, 0] }

def points73 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 2828, representative 1616.
def source74 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B012.Data.entryAt ⟨67, by decide +kernel⟩

def target74 : Weights.Entry :=
  { word := [2, 8, 0, 4, 8, 12, 4], weights := [1, 0, 0, 1] }

-- Period 7, original row 2854, representative 1618.
def source75 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B012.Data.entryAt ⟨69, by decide +kernel⟩

def target75 : Weights.Entry :=
  { word := [2, 8, 0, 12, 0, 12, 4], weights := [1, 0, 1, 0] }

-- Period 7, original row 2879, representative 1617.
def source76 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B012.Data.entryAt ⟨68, by decide +kernel⟩

def target76 : Weights.Entry :=
  { word := [2, 8, 0, 12, 8, 12, 4], weights := [1, 0, 1, 0] }

-- Period 7, original row 2947, representative 1627.
def source77 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B012.Data.entryAt ⟨78, by decide +kernel⟩

def target77 : Weights.Entry :=
  { word := [2, 8, 4, 10, 8, 12, 4], weights := [2, 2, 1, 3] }

-- Period 7, original row 2994, representative 1619.
def source78 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B012.Data.entryAt ⟨70, by decide +kernel⟩

def target78 : Weights.Entry :=
  { word := [2, 8, 8, 4, 8, 12, 2], weights := [1, 0, 1, 0] }

-- Period 7, original row 2995, representative 1613.
def source79 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B012.Data.entryAt ⟨64, by decide +kernel⟩

def target79 : Weights.Entry :=
  { word := [2, 8, 8, 4, 8, 12, 4], weights := [1, 0, 0, 1] }

-- Period 7, original row 3020, representative 1639.
def source80 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B012.Data.entryAt ⟨90, by decide +kernel⟩

def target80 : Weights.Entry :=
  { word := [2, 8, 8, 8, 1, 12, 2], weights := [1, 0, 1, 1] }

-- Period 7, original row 3021, representative 1638.
def source81 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B012.Data.entryAt ⟨89, by decide +kernel⟩

def target81 : Weights.Entry :=
  { word := [2, 8, 8, 8, 1, 12, 4], weights := [1, 0, 1, 1] }

-- Period 7, original row 3027, representative 1637.
def source82 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B012.Data.entryAt ⟨88, by decide +kernel⟩

def target82 : Weights.Entry :=
  { word := [2, 8, 8, 8, 9, 12, 4], weights := [1, 0, 1, 1] }

-- Period 7, original row 3038, representative 1621.
def source83 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B012.Data.entryAt ⟨72, by decide +kernel⟩

def target83 : Weights.Entry :=
  { word := [2, 8, 8, 12, 0, 12, 2], weights := [1, 0, 1, 0] }

-- Period 7, original row 3039, representative 1615.
def source84 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B012.Data.entryAt ⟨66, by decide +kernel⟩

def target84 : Weights.Entry :=
  { word := [2, 8, 8, 12, 0, 12, 4], weights := [1, 0, 1, 0] }

-- Period 7, original row 3067, representative 1620.
def source85 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B012.Data.entryAt ⟨71, by decide +kernel⟩

def target85 : Weights.Entry :=
  { word := [2, 8, 8, 12, 8, 12, 2], weights := [1, 0, 1, 0] }

-- Period 7, original row 3068, representative 1614.
def source86 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B012.Data.entryAt ⟨65, by decide +kernel⟩

def target86 : Weights.Entry :=
  { word := [2, 8, 8, 12, 8, 12, 4], weights := [1, 0, 1, 0] }

-- Period 7, original row 3095, representative 1634.
def source87 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B012.Data.entryAt ⟨85, by decide +kernel⟩

def target87 : Weights.Entry :=
  { word := [2, 8, 9, 8, 1, 12, 2], weights := [1, 0, 1, 1] }

-- Period 7, original row 3096, representative 1633.
def source88 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B012.Data.entryAt ⟨84, by decide +kernel⟩

def target88 : Weights.Entry :=
  { word := [2, 8, 9, 8, 1, 12, 4], weights := [1, 0, 1, 1] }

-- Period 7, original row 3102, representative 1632.
def source89 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B012.Data.entryAt ⟨83, by decide +kernel⟩

def target89 : Weights.Entry :=
  { word := [2, 8, 9, 8, 9, 12, 4], weights := [1, 0, 1, 1] }

-- Period 7, original row 3157, representative 1626.
def source90 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B012.Data.entryAt ⟨77, by decide +kernel⟩

def target90 : Weights.Entry :=
  { word := [2, 8, 12, 10, 8, 12, 4], weights := [2, 1, 1, 2] }

-- Period 7, original row 3166, representative 1651.
def source91 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B012.Data.entryAt ⟨102, by decide +kernel⟩

def target91 : Weights.Entry :=
  { word := [2, 10, 0, 1, 0, 12, 0], weights := [2, 1, 1, 0] }

def points91 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 5), (4, 6), (5, 4), (6, 3)]

-- Period 7, original row 3168, representative 1651.
def source92 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B012.Data.entryAt ⟨102, by decide +kernel⟩

def target92 : Weights.Entry :=
  { word := [2, 10, 0, 2, 0, 8, 1], weights := [2, 1, 0, 1] }

def points92 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 3171, representative 1655.
def source93 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B012.Data.entryAt ⟨106, by decide +kernel⟩

def target93 : Weights.Entry :=
  { word := [2, 10, 0, 9, 0, 4, 0], weights := [0, 1, 1, 0] }

def points93 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 5), (4, 6), (5, 4), (6, 3)]

-- Period 7, original row 3172, representative 1650.
def source94 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B012.Data.entryAt ⟨101, by decide +kernel⟩

def target94 : Weights.Entry :=
  { word := [2, 10, 0, 9, 0, 4, 8], weights := [1, 1, 2, 0] }

-- Period 7, original row 3174, representative 1654.
def source95 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B012.Data.entryAt ⟨105, by decide +kernel⟩

def target95 : Weights.Entry :=
  { word := [2, 10, 0, 9, 0, 12, 0], weights := [0, 1, 1, 0] }

def points95 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 5), (4, 6), (5, 4), (6, 3)]

-- Period 7, original row 3175, representative 1649.
def source96 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B012.Data.entryAt ⟨100, by decide +kernel⟩

def target96 : Weights.Entry :=
  { word := [2, 10, 0, 9, 0, 12, 8], weights := [1, 1, 2, 0] }

-- Period 7, original row 3176, representative 1636.
def source97 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B012.Data.entryAt ⟨87, by decide +kernel⟩

def target97 : Weights.Entry :=
  { word := [2, 10, 0, 9, 8, 1, 4], weights := [1, 1, 0, 1] }

def points97 : List (ℕ × ℕ) := [(0, 1), (1, 2), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 3180, representative 1638.
def source98 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B012.Data.entryAt ⟨89, by decide +kernel⟩

def target98 : Weights.Entry :=
  { word := [2, 10, 0, 9, 8, 8, 4], weights := [1, 1, 0, 1] }

def points98 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 3183, representative 1633.
def source99 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B012.Data.entryAt ⟨84, by decide +kernel⟩

def target99 : Weights.Entry :=
  { word := [2, 10, 0, 9, 8, 9, 4], weights := [1, 1, 0, 1] }

def points99 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 3187, representative 1655.
def source100 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B012.Data.entryAt ⟨106, by decide +kernel⟩

def target100 : Weights.Entry :=
  { word := [2, 10, 0, 10, 0, 0, 1], weights := [0, 1, 0, 1] }

def points100 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 3189, representative 1625.
def source101 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B012.Data.entryAt ⟨76, by decide +kernel⟩

def target101 : Weights.Entry :=
  { word := [2, 10, 0, 10, 0, 0, 4], weights := [0, 1, 0, 1] }

def points101 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 3195, representative 1654.
def source102 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B012.Data.entryAt ⟨105, by decide +kernel⟩

def target102 : Weights.Entry :=
  { word := [2, 10, 0, 10, 0, 8, 1], weights := [0, 1, 0, 1] }

def points102 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 3196, representative 1618.
def source103 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B012.Data.entryAt ⟨69, by decide +kernel⟩

def target103 : Weights.Entry :=
  { word := [2, 10, 0, 10, 0, 8, 4], weights := [0, 1, 0, 1] }

def points103 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 3200, representative 1624.
def source104 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B012.Data.entryAt ⟨75, by decide +kernel⟩

def target104 : Weights.Entry :=
  { word := [2, 10, 0, 10, 8, 0, 4], weights := [0, 1, 0, 1] }

def points104 : List (ℕ × ℕ) := [(0, 1), (1, 2), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 3202, representative 1615.
def source105 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B012.Data.entryAt ⟨66, by decide +kernel⟩

def target105 : Weights.Entry :=
  { word := [2, 10, 0, 10, 8, 8, 4], weights := [0, 1, 0, 1] }

def points105 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 3206, representative 1631.
def source106 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B012.Data.entryAt ⟨82, by decide +kernel⟩

def target106 : Weights.Entry :=
  { word := [2, 10, 0, 12, 2, 0, 4], weights := [1, 1, 0, 1] }

def points106 : List (ℕ × ℕ) := [(0, 1), (1, 2), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 3214, representative 1629.
def source107 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B012.Data.entryAt ⟨80, by decide +kernel⟩

def target107 : Weights.Entry :=
  { word := [2, 10, 0, 12, 10, 0, 4], weights := [1, 1, 0, 1] }

def points107 : List (ℕ × ℕ) := [(0, 1), (1, 2), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 3222, representative 1643.
def source108 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B012.Data.entryAt ⟨94, by decide +kernel⟩

def target108 : Weights.Entry :=
  { word := [2, 10, 2, 8, 1, 0, 4], weights := [1, 1, 0, 1] }

def points108 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 3231, representative 1603.
def source109 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B012.Data.entryAt ⟨54, by decide +kernel⟩

def target109 : Weights.Entry :=
  { word := [2, 10, 2, 8, 8, 4, 0], weights := [1, 0, 1, 0] }

def points109 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 3233, representative 1602.
def source110 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B012.Data.entryAt ⟨53, by decide +kernel⟩

def target110 : Weights.Entry :=
  { word := [2, 10, 2, 8, 8, 12, 0], weights := [1, 0, 1, 0] }

def points110 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 3236, representative 1641.
def source111 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B012.Data.entryAt ⟨92, by decide +kernel⟩

def target111 : Weights.Entry :=
  { word := [2, 10, 2, 8, 9, 0, 4], weights := [1, 1, 0, 1] }

def points111 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 3245, representative 1668.
def source112 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B012.Data.entryAt ⟨119, by decide +kernel⟩

def target112 : Weights.Entry :=
  { word := [2, 10, 8, 0, 1, 4, 8], weights := [0, 1, 3, 0] }

-- Period 7, original row 3246, representative 1662.
def source113 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B012.Data.entryAt ⟨113, by decide +kernel⟩

def target113 : Weights.Entry :=
  { word := [2, 10, 8, 0, 1, 12, 8], weights := [0, 1, 3, 0] }

-- Period 7, original row 3248, representative 1646.
def source114 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B012.Data.entryAt ⟨97, by decide +kernel⟩

def target114 : Weights.Entry :=
  { word := [2, 10, 8, 1, 0, 12, 0], weights := [2, 1, 1, 0] }

def points114 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 3254, representative 1652.
def source115 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B012.Data.entryAt ⟨103, by decide +kernel⟩

def target115 : Weights.Entry :=
  { word := [2, 10, 8, 2, 0, 8, 1], weights := [1, 0, 0, 1] }

def points115 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 3256, representative 1616.
def source116 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B012.Data.entryAt ⟨67, by decide +kernel⟩

def target116 : Weights.Entry :=
  { word := [2, 10, 8, 2, 0, 8, 4], weights := [1, 0, 0, 1] }

def points116 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 3265, representative 1622.
def source117 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B012.Data.entryAt ⟨73, by decide +kernel⟩

def target117 : Weights.Entry :=
  { word := [2, 10, 8, 2, 8, 0, 4], weights := [1, 0, 0, 1] }

def points117 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 3269, representative 1613.
def source118 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B012.Data.entryAt ⟨64, by decide +kernel⟩

def target118 : Weights.Entry :=
  { word := [2, 10, 8, 2, 8, 8, 4], weights := [1, 0, 0, 1] }

def points118 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 3274, representative 1672.
def source119 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B012.Data.entryAt ⟨123, by decide +kernel⟩

def target119 : Weights.Entry :=
  { word := [2, 10, 8, 4, 4, 12, 0], weights := [1, 0, 1, 0] }

def points119 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 3276, representative 1673.
def source120 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B012.Data.entryAt ⟨124, by decide +kernel⟩

def target120 : Weights.Entry :=
  { word := [2, 10, 8, 4, 12, 12, 0], weights := [1, 0, 1, 0] }

def points120 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 3280, representative 1669.
def source121 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B012.Data.entryAt ⟨120, by decide +kernel⟩

def target121 : Weights.Entry :=
  { word := [2, 10, 8, 8, 1, 4, 8], weights := [0, 1, 3, 0] }

-- Period 7, original row 3281, representative 1663.
def source122 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B012.Data.entryAt ⟨114, by decide +kernel⟩

def target122 : Weights.Entry :=
  { word := [2, 10, 8, 8, 1, 12, 8], weights := [0, 1, 3, 0] }

-- Period 7, original row 3282, representative 1648.
def source123 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B012.Data.entryAt ⟨99, by decide +kernel⟩

def target123 : Weights.Entry :=
  { word := [2, 10, 8, 9, 0, 4, 0], weights := [0, 1, 1, 0] }

def points123 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 3283, representative 1645.
def source124 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B012.Data.entryAt ⟨96, by decide +kernel⟩

def target124 : Weights.Entry :=
  { word := [2, 10, 8, 9, 0, 4, 8], weights := [1, 1, 2, 0] }

-- Period 7, original row 3285, representative 1647.
def source125 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B012.Data.entryAt ⟨98, by decide +kernel⟩

def target125 : Weights.Entry :=
  { word := [2, 10, 8, 9, 0, 12, 0], weights := [0, 1, 1, 0] }

def points125 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 3286, representative 1644.
def source126 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B012.Data.entryAt ⟨95, by decide +kernel⟩

def target126 : Weights.Entry :=
  { word := [2, 10, 8, 9, 0, 12, 8], weights := [1, 1, 2, 0] }

-- Period 7, original row 3287, representative 1635.
def source127 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B012.Data.entryAt ⟨86, by decide +kernel⟩

def target127 : Weights.Entry :=
  { word := [2, 10, 8, 9, 8, 1, 4], weights := [1, 1, 0, 1] }

def points127 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

def period7Entries : List Weights.Entry := [target0, target1, target2, target3, target4, target5, target6, target7, target8, target9, target10, target11, target12, target13, target14, target15, target16, target17, target18, target19, target20, target21, target22, target23, target24, target25, target26, target27, target28, target29, target30, target31, target32, target33, target34, target35, target36, target37, target38, target39, target40, target41, target42, target43, target44, target45, target46, target47, target48, target49, target50, target51, target52, target53, target54, target55, target56, target57, target58, target59, target60, target61, target62, target63, target64, target65, target66, target67, target68, target69, target70, target71, target72, target73, target74, target75, target76, target77, target78, target79, target80, target81, target82, target83, target84, target85, target86, target87, target88, target89, target90, target91, target92, target93, target94, target95, target96, target97, target98, target99, target100, target101, target102, target103, target104, target105, target106, target107, target108, target109, target110, target111, target112, target113, target114, target115, target116, target117, target118, target119, target120, target121, target122, target123, target124, target125, target126, target127]

def period7Chunk : RowCoverage.Chunk where
  rows := [⟨1872, target0⟩, ⟨1873, target1⟩, ⟨1886, target2⟩, ⟨1887, target3⟩, ⟨1895, target4⟩, ⟨1896, target5⟩, ⟨1897, target6⟩, ⟨1909, target7⟩, ⟨1910, target8⟩, ⟨1911, target9⟩, ⟨1923, target10⟩, ⟨1924, target11⟩, ⟨1925, target12⟩, ⟨1949, target13⟩, ⟨1950, target14⟩, ⟨1951, target15⟩, ⟨2012, target16⟩, ⟨2013, target17⟩, ⟨2014, target18⟩, ⟨2026, target19⟩, ⟨2048, target20⟩, ⟨2072, target21⟩, ⟨2073, target22⟩, ⟨2074, target23⟩, ⟨2087, target24⟩, ⟨2088, target25⟩, ⟨2089, target26⟩, ⟨2102, target27⟩, ⟨2103, target28⟩, ⟨2104, target29⟩, ⟨2116, target30⟩, ⟨2117, target31⟩, ⟨2118, target32⟩, ⟨2204, target33⟩, ⟨2205, target34⟩, ⟨2218, target35⟩, ⟨2219, target36⟩, ⟨2232, target37⟩, ⟨2246, target38⟩, ⟨2254, target39⟩, ⟨2255, target40⟩, ⟨2268, target41⟩, ⟨2269, target42⟩, ⟨2282, target43⟩, ⟨2283, target44⟩, ⟨2309, target45⟩, ⟨2371, target46⟩, ⟨2372, target47⟩, ⟨2389, target48⟩, ⟨2393, target49⟩, ⟨2402, target50⟩, ⟨2442, target51⟩, ⟨2443, target52⟩, ⟨2453, target53⟩, ⟨2474, target54⟩, ⟨2478, target55⟩, ⟨2482, target56⟩, ⟨2493, target57⟩, ⟨2494, target58⟩, ⟨2504, target59⟩, ⟨2513, target60⟩, ⟨2514, target61⟩, ⟨2520, target62⟩, ⟨2564, target63⟩, ⟨2565, target64⟩, ⟨2575, target65⟩, ⟨2623, target66⟩, ⟨2625, target67⟩, ⟨2637, target68⟩, ⟨2639, target69⟩, ⟨2765, target70⟩, ⟨2767, target71⟩, ⟨2779, target72⟩, ⟨2781, target73⟩, ⟨2828, target74⟩, ⟨2854, target75⟩, ⟨2879, target76⟩, ⟨2947, target77⟩, ⟨2994, target78⟩, ⟨2995, target79⟩, ⟨3020, target80⟩, ⟨3021, target81⟩, ⟨3027, target82⟩, ⟨3038, target83⟩, ⟨3039, target84⟩, ⟨3067, target85⟩, ⟨3068, target86⟩, ⟨3095, target87⟩, ⟨3096, target88⟩, ⟨3102, target89⟩, ⟨3157, target90⟩, ⟨3166, target91⟩, ⟨3168, target92⟩, ⟨3171, target93⟩, ⟨3172, target94⟩, ⟨3174, target95⟩, ⟨3175, target96⟩, ⟨3176, target97⟩, ⟨3180, target98⟩, ⟨3183, target99⟩, ⟨3187, target100⟩, ⟨3189, target101⟩, ⟨3195, target102⟩, ⟨3196, target103⟩, ⟨3200, target104⟩, ⟨3202, target105⟩, ⟨3206, target106⟩, ⟨3214, target107⟩, ⟨3222, target108⟩, ⟨3231, target109⟩, ⟨3233, target110⟩, ⟨3236, target111⟩, ⟨3245, target112⟩, ⟨3246, target113⟩, ⟨3248, target114⟩, ⟨3254, target115⟩, ⟨3256, target116⟩, ⟨3265, target117⟩, ⟨3269, target118⟩, ⟨3274, target119⟩, ⟨3276, target120⟩, ⟨3280, target121⟩, ⟨3281, target122⟩, ⟨3282, target123⟩, ⟨3283, target124⟩, ⟨3285, target125⟩, ⟨3286, target126⟩, ⟨3287, target127⟩]
  indexMask := 571382008823245828094223979323862089389022815728594078617403025690010297513702030710126796650044060726617412778734864627981387121176867707815915134750510440890756877091481291026444070273801471457259333460460570564990472850683437326851735036148005119816995741899721426398457656046065508703049151200000804560691045355627771797679367624595709627976368410246740218958323657516171292103857665782526726938459766710316801212515644968613248950684573616882067113774827425865522951301092771379223215337518784284866826374451771511587110771410004822610639265132570467117372331905727433763981119947553251817479432810368536267924777930425647843257482232188519716910888888395788667987655893719001962030166053243606958348524346694695176091031132766138452848801630981608007392503421410620455993598899719533970777025578675256252830057622352092030166107342134451929485053360851840883696232613593658554403626386417298094713882210621595347889183859795671489300251555640825164393209580878553252758819588748083200
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

end FranklSmallCyclic.TransportBatches.G012.B001.Data
