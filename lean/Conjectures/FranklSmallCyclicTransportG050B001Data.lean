module

public import Conjectures.FranklSmallCyclicRowCoverage
public import Conjectures.FranklSmallCyclicCanonicalWords
public import Conjectures.FranklSmallCyclicOrbit8Block024Data

/-! 128 literal targets sharing one source proof block.
Original words and row indices are retained; weights may be transported.
-/
@[expose] public section

namespace FranklSmallCyclic.TransportBatches.G050.B001.Data

-- Period 8, original row 1083, representative 6402.
def source0 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨12, by decide +kernel⟩

def target0 : Weights.Entry :=
  { word := [0, 8, 10, 2, 2, 8, 4], weights := [1, 0, 0, 1] }

-- Period 8, original row 1091, representative 6390.
def source1 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨0, by decide +kernel⟩

def target1 : Weights.Entry :=
  { word := [0, 8, 10, 2, 10, 8, 4], weights := [1, 0, 0, 1] }

-- Period 8, original row 1098, representative 6403.
def source2 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨13, by decide +kernel⟩

def target2 : Weights.Entry :=
  { word := [0, 8, 10, 10, 2, 8, 4], weights := [1, 0, 0, 1] }

-- Period 8, original row 1105, representative 6391.
def source3 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨1, by decide +kernel⟩

def target3 : Weights.Entry :=
  { word := [0, 8, 10, 10, 10, 8, 4], weights := [1, 0, 0, 1] }

-- Period 8, original row 1505, representative 6466.
def source4 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨76, by decide +kernel⟩

def target4 : Weights.Entry :=
  { word := [0, 12, 0, 4, 2, 0, 1], weights := [0, 0, 1, 0] }

def points4 : List (ℕ × ℕ) := [(0, 2), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1)]

-- Period 8, original row 1507, representative 6449.
def source5 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨59, by decide +kernel⟩

def target5 : Weights.Entry :=
  { word := [0, 12, 0, 4, 2, 0, 4], weights := [1, 0, 0, 1] }

-- Period 8, original row 1513, representative 6407.
def source6 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨17, by decide +kernel⟩

def target6 : Weights.Entry :=
  { word := [0, 12, 0, 4, 2, 8, 4], weights := [1, 0, 0, 1] }

-- Period 8, original row 1517, representative 6466.
def source7 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨76, by decide +kernel⟩

def target7 : Weights.Entry :=
  { word := [0, 12, 0, 4, 4, 4, 0], weights := [0, 0, 0, 1] }

def points7 : List (ℕ × ℕ) := [(0, 2), (1, 0), (2, 7), (3, 5), (4, 6), (5, 4), (6, 3), (7, 1)]

-- Period 8, original row 1527, representative 6454.
def source8 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨64, by decide +kernel⟩

def target8 : Weights.Entry :=
  { word := [0, 12, 0, 4, 10, 0, 1], weights := [0, 0, 1, 0] }

def points8 : List (ℕ × ℕ) := [(0, 2), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1)]

-- Period 8, original row 1529, representative 6447.
def source9 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨57, by decide +kernel⟩

def target9 : Weights.Entry :=
  { word := [0, 12, 0, 4, 10, 0, 4], weights := [1, 0, 0, 1] }

-- Period 8, original row 1535, representative 6395.
def source10 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨5, by decide +kernel⟩

def target10 : Weights.Entry :=
  { word := [0, 12, 0, 4, 10, 8, 4], weights := [1, 0, 0, 1] }

-- Period 8, original row 1539, representative 6454.
def source11 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨64, by decide +kernel⟩

def target11 : Weights.Entry :=
  { word := [0, 12, 0, 4, 12, 4, 0], weights := [0, 0, 0, 1] }

def points11 : List (ℕ × ℕ) := [(0, 2), (1, 0), (2, 7), (3, 5), (4, 6), (5, 4), (6, 3), (7, 1)]

-- Period 8, original row 1559, representative 6441.
def source12 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨51, by decide +kernel⟩

def target12 : Weights.Entry :=
  { word := [0, 12, 2, 0, 1, 8, 2], weights := [0, 1, 0, 1] }

-- Period 8, original row 1560, representative 6441.
def source13 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨51, by decide +kernel⟩

def target13 : Weights.Entry :=
  { word := [0, 12, 2, 0, 1, 8, 4], weights := [0, 1, 0, 1] }

def points13 : List (ℕ × ℕ) := [(0, 7), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 0)]

-- Period 8, original row 1565, representative 6483.
def source14 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨92, by decide +kernel⟩

def target14 : Weights.Entry :=
  { word := [0, 12, 2, 0, 9, 0, 1], weights := [0, 0, 1, 1] }

def points14 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 1567, representative 6446.
def source15 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨56, by decide +kernel⟩

def target15 : Weights.Entry :=
  { word := [0, 12, 2, 0, 9, 0, 4], weights := [0, 1, 0, 1] }

-- Period 8, original row 1573, representative 6433.
def source16 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨43, by decide +kernel⟩

def target16 : Weights.Entry :=
  { word := [0, 12, 2, 0, 9, 8, 2], weights := [0, 1, 0, 1] }

-- Period 8, original row 1574, representative 6437.
def source17 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨47, by decide +kernel⟩

def target17 : Weights.Entry :=
  { word := [0, 12, 2, 0, 9, 8, 4], weights := [0, 1, 0, 1] }

-- Period 8, original row 1579, representative 6465.
def source18 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨75, by decide +kernel⟩

def target18 : Weights.Entry :=
  { word := [0, 12, 2, 8, 2, 0, 1], weights := [0, 1, 1, 0] }

def points18 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 1593, representative 6453.
def source19 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨63, by decide +kernel⟩

def target19 : Weights.Entry :=
  { word := [0, 12, 2, 8, 10, 0, 1], weights := [0, 1, 1, 0] }

def points19 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 1609, representative 6441.
def source20 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨51, by decide +kernel⟩

def target20 : Weights.Entry :=
  { word := [0, 12, 4, 4, 0, 8, 2], weights := [1, 0, 0, 1] }

def points20 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6), (7, 7)]

-- Period 8, original row 1610, representative 6441.
def source21 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨51, by decide +kernel⟩

def target21 : Weights.Entry :=
  { word := [0, 12, 4, 4, 0, 8, 4], weights := [1, 0, 0, 1] }

def points21 : List (ℕ × ℕ) := [(0, 7), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6), (7, 0)]

-- Period 8, original row 1615, representative 6480.
def source22 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨90, by decide +kernel⟩

def target22 : Weights.Entry :=
  { word := [0, 12, 4, 4, 8, 0, 1], weights := [0, 0, 1, 1] }

def points22 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 1617, representative 6444.
def source23 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨54, by decide +kernel⟩

def target23 : Weights.Entry :=
  { word := [0, 12, 4, 4, 8, 0, 4], weights := [1, 0, 0, 1] }

-- Period 8, original row 1623, representative 6419.
def source24 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨29, by decide +kernel⟩

def target24 : Weights.Entry :=
  { word := [0, 12, 4, 4, 8, 8, 2], weights := [1, 0, 1, 0] }

-- Period 8, original row 1624, representative 6426.
def source25 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨36, by decide +kernel⟩

def target25 : Weights.Entry :=
  { word := [0, 12, 4, 4, 8, 8, 4], weights := [1, 0, 0, 1] }

-- Period 8, original row 1630, representative 6413.
def source26 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨23, by decide +kernel⟩

def target26 : Weights.Entry :=
  { word := [0, 12, 6, 8, 8, 8, 2], weights := [0, 1, 1, 0] }

-- Period 8, original row 1634, representative 6467.
def source27 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨77, by decide +kernel⟩

def target27 : Weights.Entry :=
  { word := [0, 12, 8, 4, 2, 0, 1], weights := [0, 0, 1, 0] }

def points27 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 1636, representative 6450.
def source28 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨60, by decide +kernel⟩

def target28 : Weights.Entry :=
  { word := [0, 12, 8, 4, 2, 0, 4], weights := [1, 0, 0, 1] }

-- Period 8, original row 1642, representative 6408.
def source29 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨18, by decide +kernel⟩

def target29 : Weights.Entry :=
  { word := [0, 12, 8, 4, 2, 8, 4], weights := [1, 0, 0, 1] }

-- Period 8, original row 1646, representative 6464.
def source30 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨74, by decide +kernel⟩

def target30 : Weights.Entry :=
  { word := [0, 12, 8, 4, 4, 4, 0], weights := [0, 0, 1, 1] }

def points30 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 1660, representative 6455.
def source31 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨65, by decide +kernel⟩

def target31 : Weights.Entry :=
  { word := [0, 12, 8, 4, 10, 0, 1], weights := [0, 0, 1, 0] }

def points31 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 1662, representative 6448.
def source32 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨58, by decide +kernel⟩

def target32 : Weights.Entry :=
  { word := [0, 12, 8, 4, 10, 0, 4], weights := [1, 0, 0, 1] }

-- Period 8, original row 1668, representative 6396.
def source33 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨6, by decide +kernel⟩

def target33 : Weights.Entry :=
  { word := [0, 12, 8, 4, 10, 8, 4], weights := [1, 0, 0, 1] }

-- Period 8, original row 1672, representative 6452.
def source34 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨62, by decide +kernel⟩

def target34 : Weights.Entry :=
  { word := [0, 12, 8, 4, 12, 4, 0], weights := [0, 0, 1, 1] }

def points34 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 1691, representative 6442.
def source35 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨52, by decide +kernel⟩

def target35 : Weights.Entry :=
  { word := [0, 12, 10, 0, 1, 8, 2], weights := [0, 1, 0, 1] }

-- Period 8, original row 1692, representative 6442.
def source36 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨52, by decide +kernel⟩

def target36 : Weights.Entry :=
  { word := [0, 12, 10, 0, 1, 8, 4], weights := [0, 1, 0, 1] }

def points36 : List (ℕ × ℕ) := [(0, 7), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 0)]

-- Period 8, original row 1698, representative 6434.
def source37 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨44, by decide +kernel⟩

def target37 : Weights.Entry :=
  { word := [0, 12, 10, 0, 9, 8, 2], weights := [0, 1, 0, 1] }

-- Period 8, original row 1699, representative 6438.
def source38 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨48, by decide +kernel⟩

def target38 : Weights.Entry :=
  { word := [0, 12, 10, 0, 9, 8, 4], weights := [0, 1, 0, 1] }

-- Period 8, original row 1717, representative 6442.
def source39 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨52, by decide +kernel⟩

def target39 : Weights.Entry :=
  { word := [0, 12, 12, 4, 0, 8, 2], weights := [1, 0, 0, 1] }

def points39 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6), (7, 7)]

-- Period 8, original row 1718, representative 6442.
def source40 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨52, by decide +kernel⟩

def target40 : Weights.Entry :=
  { word := [0, 12, 12, 4, 0, 8, 4], weights := [1, 0, 0, 1] }

def points40 : List (ℕ × ℕ) := [(0, 7), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6), (7, 0)]

-- Period 8, original row 1723, representative 6481.
def source41 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨91, by decide +kernel⟩

def target41 : Weights.Entry :=
  { word := [0, 12, 12, 4, 8, 0, 1], weights := [0, 0, 1, 1] }

def points41 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 1725, representative 6445.
def source42 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨55, by decide +kernel⟩

def target42 : Weights.Entry :=
  { word := [0, 12, 12, 4, 8, 0, 4], weights := [1, 0, 0, 1] }

-- Period 8, original row 1731, representative 6420.
def source43 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨30, by decide +kernel⟩

def target43 : Weights.Entry :=
  { word := [0, 12, 12, 4, 8, 8, 2], weights := [1, 0, 1, 0] }

-- Period 8, original row 1732, representative 6427.
def source44 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨37, by decide +kernel⟩

def target44 : Weights.Entry :=
  { word := [0, 12, 12, 4, 8, 8, 4], weights := [1, 0, 0, 1] }

-- Period 8, original row 1739, representative 6492.
def source45 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨101, by decide +kernel⟩

def target45 : Weights.Entry :=
  { word := [1, 0, 1, 4, 2, 0, 4], weights := [1, 0, 0, 1] }

def points45 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 8, original row 1745, representative 6410.
def source46 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨20, by decide +kernel⟩

def target46 : Weights.Entry :=
  { word := [1, 0, 1, 4, 2, 8, 4], weights := [1, 0, 0, 1] }

def points46 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 8, original row 1761, representative 6488.
def source47 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨97, by decide +kernel⟩

def target47 : Weights.Entry :=
  { word := [1, 0, 1, 4, 10, 0, 4], weights := [1, 0, 0, 1] }

def points47 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 8, original row 1767, representative 6398.
def source48 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨8, by decide +kernel⟩

def target48 : Weights.Entry :=
  { word := [1, 0, 1, 4, 10, 8, 4], weights := [1, 0, 0, 1] }

def points48 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 8, original row 1785, representative 6492.
def source49 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨101, by decide +kernel⟩

def target49 : Weights.Entry :=
  { word := [1, 0, 2, 2, 2, 0, 4], weights := [1, 0, 0, 1] }

def points49 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 5), (5, 4), (6, 6), (7, 7)]

-- Period 8, original row 1793, representative 6405.
def source50 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨15, by decide +kernel⟩

def target50 : Weights.Entry :=
  { word := [1, 0, 2, 2, 2, 8, 4], weights := [1, 0, 0, 1] }

def points50 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 8, original row 1800, representative 6488.
def source51 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨97, by decide +kernel⟩

def target51 : Weights.Entry :=
  { word := [1, 0, 2, 2, 10, 0, 4], weights := [1, 0, 0, 1] }

def points51 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 5), (5, 4), (6, 6), (7, 7)]

-- Period 8, original row 1808, representative 6393.
def source52 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨3, by decide +kernel⟩

def target52 : Weights.Entry :=
  { word := [1, 0, 2, 2, 10, 8, 4], weights := [1, 0, 0, 1] }

def points52 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 8, original row 1828, representative 6406.
def source53 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨16, by decide +kernel⟩

def target53 : Weights.Entry :=
  { word := [1, 0, 10, 2, 2, 8, 4], weights := [1, 0, 0, 1] }

def points53 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 8, original row 1836, representative 6394.
def source54 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨4, by decide +kernel⟩

def target54 : Weights.Entry :=
  { word := [1, 0, 10, 2, 10, 8, 4], weights := [1, 0, 0, 1] }

def points54 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 8, original row 1841, representative 6492.
def source55 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨101, by decide +kernel⟩

def target55 : Weights.Entry :=
  { word := [1, 4, 2, 0, 1, 0, 1], weights := [0, 1, 0, 1] }

def points55 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 1), (3, 4), (4, 3), (5, 5), (6, 6), (7, 2)]

-- Period 8, original row 1849, representative 6440.
def source56 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨50, by decide +kernel⟩

def target56 : Weights.Entry :=
  { word := [1, 4, 2, 0, 1, 8, 2], weights := [0, 1, 0, 1] }

def points56 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 8, original row 1850, representative 6440.
def source57 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨50, by decide +kernel⟩

def target57 : Weights.Entry :=
  { word := [1, 4, 2, 0, 1, 8, 4], weights := [0, 1, 0, 1] }

def points57 : List (ℕ × ℕ) := [(0, 7), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 0)]

-- Period 8, original row 1855, representative 6493.
def source58 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨102, by decide +kernel⟩

def target58 : Weights.Entry :=
  { word := [1, 4, 2, 0, 9, 0, 1], weights := [0, 1, 0, 1] }

def points58 : List (ℕ × ℕ) := [(0, 2), (1, 0), (2, 7), (3, 6), (4, 4), (5, 5), (6, 3), (7, 1)]

-- Period 8, original row 1857, representative 6474.
def source59 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨84, by decide +kernel⟩

def target59 : Weights.Entry :=
  { word := [1, 4, 2, 0, 9, 0, 4], weights := [0, 1, 0, 1] }

def points59 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 8, original row 1863, representative 6432.
def source60 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨42, by decide +kernel⟩

def target60 : Weights.Entry :=
  { word := [1, 4, 2, 0, 9, 8, 2], weights := [0, 1, 0, 1] }

def points60 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 8, original row 1864, representative 6436.
def source61 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨46, by decide +kernel⟩

def target61 : Weights.Entry :=
  { word := [1, 4, 2, 0, 9, 8, 4], weights := [0, 1, 0, 1] }

def points61 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 8, original row 1869, representative 6471.
def source62 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨81, by decide +kernel⟩

def target62 : Weights.Entry :=
  { word := [1, 4, 2, 8, 2, 0, 1], weights := [0, 1, 1, 0] }

def points62 : List (ℕ × ℕ) := [(0, 2), (1, 0), (2, 7), (3, 6), (4, 4), (5, 5), (6, 3), (7, 1)]

-- Period 8, original row 1883, representative 6457.
def source63 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨67, by decide +kernel⟩

def target63 : Weights.Entry :=
  { word := [1, 4, 2, 8, 10, 0, 1], weights := [0, 1, 1, 0] }

def points63 : List (ℕ × ℕ) := [(0, 2), (1, 0), (2, 7), (3, 6), (4, 4), (5, 5), (6, 3), (7, 1)]

-- Period 8, original row 1891, representative 6492.
def source64 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨101, by decide +kernel⟩

def target64 : Weights.Entry :=
  { word := [1, 4, 4, 4, 0, 0, 1], weights := [1, 0, 0, 1] }

def points64 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6), (7, 2)]

-- Period 8, original row 1899, representative 6440.
def source65 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨50, by decide +kernel⟩

def target65 : Weights.Entry :=
  { word := [1, 4, 4, 4, 0, 8, 2], weights := [1, 0, 0, 1] }

def points65 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6), (7, 7)]

-- Period 8, original row 1900, representative 6440.
def source66 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨50, by decide +kernel⟩

def target66 : Weights.Entry :=
  { word := [1, 4, 4, 4, 0, 8, 4], weights := [1, 0, 0, 1] }

def points66 : List (ℕ × ℕ) := [(0, 7), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6), (7, 0)]

-- Period 8, original row 1905, representative 6484.
def source67 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨93, by decide +kernel⟩

def target67 : Weights.Entry :=
  { word := [1, 4, 4, 4, 8, 0, 1], weights := [0, 0, 1, 1] }

def points67 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 1907, representative 6469.
def source68 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨79, by decide +kernel⟩

def target68 : Weights.Entry :=
  { word := [1, 4, 4, 4, 8, 0, 4], weights := [1, 0, 0, 1] }

def points68 : List (ℕ × ℕ) := [(0, 2), (1, 0), (2, 1), (3, 3), (4, 6), (5, 4), (6, 5), (7, 7)]

-- Period 8, original row 1913, representative 6418.
def source69 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨28, by decide +kernel⟩

def target69 : Weights.Entry :=
  { word := [1, 4, 4, 4, 8, 8, 2], weights := [1, 0, 1, 0] }

def points69 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 8, original row 1914, representative 6425.
def source70 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨35, by decide +kernel⟩

def target70 : Weights.Entry :=
  { word := [1, 4, 4, 4, 8, 8, 4], weights := [1, 0, 0, 1] }

def points70 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 8, original row 1919, representative 6475.
def source71 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨85, by decide +kernel⟩

def target71 : Weights.Entry :=
  { word := [1, 4, 8, 4, 2, 0, 1], weights := [0, 0, 1, 0] }

def points71 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 1921, representative 6475.
def source72 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨85, by decide +kernel⟩

def target72 : Weights.Entry :=
  { word := [1, 4, 8, 4, 2, 0, 4], weights := [1, 0, 0, 0] }

def points72 : List (ℕ × ℕ) := [(0, 7), (1, 0), (2, 1), (3, 6), (4, 3), (5, 4), (6, 5), (7, 2)]

-- Period 8, original row 1927, representative 6409.
def source73 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨19, by decide +kernel⟩

def target73 : Weights.Entry :=
  { word := [1, 4, 8, 4, 2, 8, 4], weights := [1, 0, 0, 1] }

def points73 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 8, original row 1931, representative 6469.
def source74 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨79, by decide +kernel⟩

def target74 : Weights.Entry :=
  { word := [1, 4, 8, 4, 4, 4, 0], weights := [0, 0, 1, 1] }

def points74 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 1945, representative 6460.
def source75 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨70, by decide +kernel⟩

def target75 : Weights.Entry :=
  { word := [1, 4, 8, 4, 10, 0, 1], weights := [0, 0, 1, 0] }

def points75 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 1947, representative 6468.
def source76 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨78, by decide +kernel⟩

def target76 : Weights.Entry :=
  { word := [1, 4, 8, 4, 10, 0, 4], weights := [1, 0, 0, 1] }

def points76 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 8, original row 1953, representative 6397.
def source77 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨7, by decide +kernel⟩

def target77 : Weights.Entry :=
  { word := [1, 4, 8, 4, 10, 8, 4], weights := [1, 0, 0, 1] }

def points77 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 8, original row 1957, representative 6456.
def source78 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨66, by decide +kernel⟩

def target78 : Weights.Entry :=
  { word := [1, 4, 8, 4, 12, 4, 0], weights := [0, 0, 1, 1] }

def points78 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 1976, representative 6443.
def source79 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨53, by decide +kernel⟩

def target79 : Weights.Entry :=
  { word := [1, 4, 10, 0, 1, 8, 2], weights := [0, 1, 0, 1] }

def points79 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 8, original row 1977, representative 6443.
def source80 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨53, by decide +kernel⟩

def target80 : Weights.Entry :=
  { word := [1, 4, 10, 0, 1, 8, 4], weights := [0, 1, 0, 1] }

def points80 : List (ℕ × ℕ) := [(0, 7), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 0)]

-- Period 8, original row 1983, representative 6435.
def source81 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨45, by decide +kernel⟩

def target81 : Weights.Entry :=
  { word := [1, 4, 10, 0, 9, 8, 2], weights := [0, 1, 0, 1] }

def points81 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 8, original row 1984, representative 6439.
def source82 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨49, by decide +kernel⟩

def target82 : Weights.Entry :=
  { word := [1, 4, 10, 0, 9, 8, 4], weights := [0, 1, 0, 1] }

def points82 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 8, original row 2002, representative 6443.
def source83 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨53, by decide +kernel⟩

def target83 : Weights.Entry :=
  { word := [1, 4, 12, 4, 0, 8, 2], weights := [1, 0, 0, 1] }

def points83 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6), (7, 7)]

-- Period 8, original row 2003, representative 6443.
def source84 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨53, by decide +kernel⟩

def target84 : Weights.Entry :=
  { word := [1, 4, 12, 4, 0, 8, 4], weights := [1, 0, 0, 1] }

def points84 : List (ℕ × ℕ) := [(0, 7), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6), (7, 0)]

-- Period 8, original row 2008, representative 6485.
def source85 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨94, by decide +kernel⟩

def target85 : Weights.Entry :=
  { word := [1, 4, 12, 4, 8, 0, 1], weights := [0, 0, 1, 1] }

def points85 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 2010, representative 6470.
def source86 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨80, by decide +kernel⟩

def target86 : Weights.Entry :=
  { word := [1, 4, 12, 4, 8, 0, 4], weights := [1, 0, 0, 1] }

def points86 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 8, original row 2016, representative 6421.
def source87 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨31, by decide +kernel⟩

def target87 : Weights.Entry :=
  { word := [1, 4, 12, 4, 8, 8, 2], weights := [1, 0, 1, 0] }

def points87 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 8, original row 2017, representative 6428.
def source88 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨38, by decide +kernel⟩

def target88 : Weights.Entry :=
  { word := [1, 4, 12, 4, 8, 8, 4], weights := [1, 0, 0, 1] }

def points88 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 8, original row 2022, representative 6466.
def source89 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨76, by decide +kernel⟩

def target89 : Weights.Entry :=
  { word := [1, 8, 1, 4, 2, 0, 1], weights := [0, 0, 1, 0] }

def points89 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 2024, representative 6479.
def source90 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨89, by decide +kernel⟩

def target90 : Weights.Entry :=
  { word := [1, 8, 1, 4, 2, 0, 4], weights := [1, 0, 0, 1] }

def points90 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 8, original row 2030, representative 6411.
def source91 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨21, by decide +kernel⟩

def target91 : Weights.Entry :=
  { word := [1, 8, 1, 4, 2, 8, 4], weights := [1, 0, 0, 1] }

def points91 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 8, original row 2034, representative 6466.
def source92 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨76, by decide +kernel⟩

def target92 : Weights.Entry :=
  { word := [1, 8, 1, 4, 4, 4, 0], weights := [0, 0, 0, 1] }

def points92 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 5), (4, 6), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 2044, representative 6454.
def source93 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨64, by decide +kernel⟩

def target93 : Weights.Entry :=
  { word := [1, 8, 1, 4, 10, 0, 1], weights := [0, 0, 1, 0] }

def points93 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 2046, representative 6478.
def source94 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨88, by decide +kernel⟩

def target94 : Weights.Entry :=
  { word := [1, 8, 1, 4, 10, 0, 4], weights := [1, 0, 0, 1] }

def points94 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 8, original row 2052, representative 6399.
def source95 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨9, by decide +kernel⟩

def target95 : Weights.Entry :=
  { word := [1, 8, 1, 4, 10, 8, 4], weights := [1, 0, 0, 1] }

def points95 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 8, original row 2056, representative 6454.
def source96 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨64, by decide +kernel⟩

def target96 : Weights.Entry :=
  { word := [1, 8, 1, 4, 12, 4, 0], weights := [0, 0, 0, 1] }

def points96 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 5), (4, 6), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 2068, representative 6472.
def source97 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨82, by decide +kernel⟩

def target97 : Weights.Entry :=
  { word := [1, 8, 2, 2, 2, 0, 1], weights := [0, 1, 0, 0] }

def points97 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 2070, representative 6490.
def source98 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨99, by decide +kernel⟩

def target98 : Weights.Entry :=
  { word := [1, 8, 2, 2, 2, 0, 4], weights := [1, 0, 0, 1] }

def points98 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 8, original row 2078, representative 6401.
def source99 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨11, by decide +kernel⟩

def target99 : Weights.Entry :=
  { word := [1, 8, 2, 2, 2, 8, 4], weights := [1, 0, 0, 1] }

def points99 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 8, original row 2083, representative 6458.
def source100 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨68, by decide +kernel⟩

def target100 : Weights.Entry :=
  { word := [1, 8, 2, 2, 10, 0, 1], weights := [0, 1, 0, 0] }

def points100 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 2085, representative 6486.
def source101 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨95, by decide +kernel⟩

def target101 : Weights.Entry :=
  { word := [1, 8, 2, 2, 10, 0, 4], weights := [1, 0, 0, 1] }

def points101 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 8, original row 2098, representative 6473.
def source102 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨83, by decide +kernel⟩

def target102 : Weights.Entry :=
  { word := [1, 8, 2, 10, 2, 0, 1], weights := [0, 1, 0, 0] }

def points102 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 2100, representative 6491.
def source103 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨100, by decide +kernel⟩

def target103 : Weights.Entry :=
  { word := [1, 8, 2, 10, 2, 0, 4], weights := [1, 1, 0, 0] }

def points103 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 8, original row 2107, representative 6404.
def source104 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨14, by decide +kernel⟩

def target104 : Weights.Entry :=
  { word := [1, 8, 2, 10, 2, 8, 4], weights := [1, 0, 0, 1] }

def points104 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 8, original row 2112, representative 6459.
def source105 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨69, by decide +kernel⟩

def target105 : Weights.Entry :=
  { word := [1, 8, 2, 10, 10, 0, 1], weights := [0, 1, 0, 0] }

def points105 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 2114, representative 6487.
def source106 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨96, by decide +kernel⟩

def target106 : Weights.Entry :=
  { word := [1, 8, 2, 10, 10, 0, 4], weights := [1, 1, 0, 0] }

def points106 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 8, original row 2121, representative 6392.
def source107 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨2, by decide +kernel⟩

def target107 : Weights.Entry :=
  { word := [1, 8, 2, 10, 10, 8, 4], weights := [1, 0, 0, 1] }

def points107 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 8, original row 2134, representative 6476.
def source108 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨86, by decide +kernel⟩

def target108 : Weights.Entry :=
  { word := [1, 8, 8, 4, 4, 4, 0], weights := [0, 0, 1, 1] }

def points108 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 2142, representative 6461.
def source109 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨71, by decide +kernel⟩

def target109 : Weights.Entry :=
  { word := [1, 8, 8, 4, 12, 4, 0], weights := [0, 0, 1, 0] }

def points109 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 2150, representative 6463.
def source110 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨73, by decide +kernel⟩

def target110 : Weights.Entry :=
  { word := [1, 8, 9, 4, 4, 4, 0], weights := [0, 0, 1, 1] }

def points110 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 2154, representative 6451.
def source111 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨61, by decide +kernel⟩

def target111 : Weights.Entry :=
  { word := [1, 8, 9, 4, 12, 4, 0], weights := [0, 0, 1, 0] }

def points111 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 2165, representative 6402.
def source112 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨12, by decide +kernel⟩

def target112 : Weights.Entry :=
  { word := [1, 8, 10, 2, 2, 8, 4], weights := [1, 0, 0, 1] }

def points112 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 8, original row 2173, representative 6390.
def source113 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨0, by decide +kernel⟩

def target113 : Weights.Entry :=
  { word := [1, 8, 10, 2, 10, 8, 4], weights := [1, 0, 0, 1] }

def points113 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 8, original row 2180, representative 6403.
def source114 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨13, by decide +kernel⟩

def target114 : Weights.Entry :=
  { word := [1, 8, 10, 10, 2, 8, 4], weights := [1, 0, 0, 1] }

def points114 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 8, original row 2187, representative 6391.
def source115 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨1, by decide +kernel⟩

def target115 : Weights.Entry :=
  { word := [1, 8, 10, 10, 10, 8, 4], weights := [1, 0, 0, 1] }

def points115 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 8, original row 2208, representative 6441.
def source116 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨51, by decide +kernel⟩

def target116 : Weights.Entry :=
  { word := [1, 12, 2, 0, 1, 8, 2], weights := [0, 1, 0, 1] }

def points116 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 8, original row 2209, representative 6441.
def source117 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨51, by decide +kernel⟩

def target117 : Weights.Entry :=
  { word := [1, 12, 2, 0, 1, 8, 4], weights := [0, 1, 0, 1] }

def points117 : List (ℕ × ℕ) := [(0, 7), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 0)]

-- Period 8, original row 2214, representative 6483.
def source118 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨92, by decide +kernel⟩

def target118 : Weights.Entry :=
  { word := [1, 12, 2, 0, 9, 0, 1], weights := [0, 0, 1, 1] }

def points118 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 2216, representative 6446.
def source119 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨56, by decide +kernel⟩

def target119 : Weights.Entry :=
  { word := [1, 12, 2, 0, 9, 0, 4], weights := [0, 1, 0, 1] }

def points119 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 8, original row 2222, representative 6433.
def source120 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨43, by decide +kernel⟩

def target120 : Weights.Entry :=
  { word := [1, 12, 2, 0, 9, 8, 2], weights := [0, 1, 0, 1] }

def points120 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 8, original row 2223, representative 6437.
def source121 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨47, by decide +kernel⟩

def target121 : Weights.Entry :=
  { word := [1, 12, 2, 0, 9, 8, 4], weights := [0, 1, 0, 1] }

def points121 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 8, original row 2228, representative 6465.
def source122 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨75, by decide +kernel⟩

def target122 : Weights.Entry :=
  { word := [1, 12, 2, 8, 2, 0, 1], weights := [0, 1, 1, 0] }

def points122 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 2242, representative 6453.
def source123 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨63, by decide +kernel⟩

def target123 : Weights.Entry :=
  { word := [1, 12, 2, 8, 10, 0, 1], weights := [0, 1, 1, 0] }

def points123 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 2258, representative 6441.
def source124 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨51, by decide +kernel⟩

def target124 : Weights.Entry :=
  { word := [1, 12, 4, 4, 0, 8, 2], weights := [1, 0, 0, 1] }

def points124 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6), (7, 7)]

-- Period 8, original row 2259, representative 6441.
def source125 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨51, by decide +kernel⟩

def target125 : Weights.Entry :=
  { word := [1, 12, 4, 4, 0, 8, 4], weights := [1, 0, 0, 1] }

def points125 : List (ℕ × ℕ) := [(0, 7), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6), (7, 0)]

-- Period 8, original row 2264, representative 6480.
def source126 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨90, by decide +kernel⟩

def target126 : Weights.Entry :=
  { word := [1, 12, 4, 4, 8, 0, 1], weights := [0, 0, 1, 1] }

def points126 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 2266, representative 6444.
def source127 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨54, by decide +kernel⟩

def target127 : Weights.Entry :=
  { word := [1, 12, 4, 4, 8, 0, 4], weights := [1, 0, 0, 1] }

def points127 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

def period8Entries : List Weights.Entry := [target0, target1, target2, target3, target4, target5, target6, target7, target8, target9, target10, target11, target12, target13, target14, target15, target16, target17, target18, target19, target20, target21, target22, target23, target24, target25, target26, target27, target28, target29, target30, target31, target32, target33, target34, target35, target36, target37, target38, target39, target40, target41, target42, target43, target44, target45, target46, target47, target48, target49, target50, target51, target52, target53, target54, target55, target56, target57, target58, target59, target60, target61, target62, target63, target64, target65, target66, target67, target68, target69, target70, target71, target72, target73, target74, target75, target76, target77, target78, target79, target80, target81, target82, target83, target84, target85, target86, target87, target88, target89, target90, target91, target92, target93, target94, target95, target96, target97, target98, target99, target100, target101, target102, target103, target104, target105, target106, target107, target108, target109, target110, target111, target112, target113, target114, target115, target116, target117, target118, target119, target120, target121, target122, target123, target124, target125, target126, target127]

def period8Chunk : RowCoverage.Chunk where
  rows := [⟨1083, target0⟩, ⟨1091, target1⟩, ⟨1098, target2⟩, ⟨1105, target3⟩, ⟨1505, target4⟩, ⟨1507, target5⟩, ⟨1513, target6⟩, ⟨1517, target7⟩, ⟨1527, target8⟩, ⟨1529, target9⟩, ⟨1535, target10⟩, ⟨1539, target11⟩, ⟨1559, target12⟩, ⟨1560, target13⟩, ⟨1565, target14⟩, ⟨1567, target15⟩, ⟨1573, target16⟩, ⟨1574, target17⟩, ⟨1579, target18⟩, ⟨1593, target19⟩, ⟨1609, target20⟩, ⟨1610, target21⟩, ⟨1615, target22⟩, ⟨1617, target23⟩, ⟨1623, target24⟩, ⟨1624, target25⟩, ⟨1630, target26⟩, ⟨1634, target27⟩, ⟨1636, target28⟩, ⟨1642, target29⟩, ⟨1646, target30⟩, ⟨1660, target31⟩, ⟨1662, target32⟩, ⟨1668, target33⟩, ⟨1672, target34⟩, ⟨1691, target35⟩, ⟨1692, target36⟩, ⟨1698, target37⟩, ⟨1699, target38⟩, ⟨1717, target39⟩, ⟨1718, target40⟩, ⟨1723, target41⟩, ⟨1725, target42⟩, ⟨1731, target43⟩, ⟨1732, target44⟩, ⟨1739, target45⟩, ⟨1745, target46⟩, ⟨1761, target47⟩, ⟨1767, target48⟩, ⟨1785, target49⟩, ⟨1793, target50⟩, ⟨1800, target51⟩, ⟨1808, target52⟩, ⟨1828, target53⟩, ⟨1836, target54⟩, ⟨1841, target55⟩, ⟨1849, target56⟩, ⟨1850, target57⟩, ⟨1855, target58⟩, ⟨1857, target59⟩, ⟨1863, target60⟩, ⟨1864, target61⟩, ⟨1869, target62⟩, ⟨1883, target63⟩, ⟨1891, target64⟩, ⟨1899, target65⟩, ⟨1900, target66⟩, ⟨1905, target67⟩, ⟨1907, target68⟩, ⟨1913, target69⟩, ⟨1914, target70⟩, ⟨1919, target71⟩, ⟨1921, target72⟩, ⟨1927, target73⟩, ⟨1931, target74⟩, ⟨1945, target75⟩, ⟨1947, target76⟩, ⟨1953, target77⟩, ⟨1957, target78⟩, ⟨1976, target79⟩, ⟨1977, target80⟩, ⟨1983, target81⟩, ⟨1984, target82⟩, ⟨2002, target83⟩, ⟨2003, target84⟩, ⟨2008, target85⟩, ⟨2010, target86⟩, ⟨2016, target87⟩, ⟨2017, target88⟩, ⟨2022, target89⟩, ⟨2024, target90⟩, ⟨2030, target91⟩, ⟨2034, target92⟩, ⟨2044, target93⟩, ⟨2046, target94⟩, ⟨2052, target95⟩, ⟨2056, target96⟩, ⟨2068, target97⟩, ⟨2070, target98⟩, ⟨2078, target99⟩, ⟨2083, target100⟩, ⟨2085, target101⟩, ⟨2098, target102⟩, ⟨2100, target103⟩, ⟨2107, target104⟩, ⟨2112, target105⟩, ⟨2114, target106⟩, ⟨2121, target107⟩, ⟨2134, target108⟩, ⟨2142, target109⟩, ⟨2150, target110⟩, ⟨2154, target111⟩, ⟨2165, target112⟩, ⟨2173, target113⟩, ⟨2180, target114⟩, ⟨2187, target115⟩, ⟨2208, target116⟩, ⟨2209, target117⟩, ⟨2214, target118⟩, ⟨2216, target119⟩, ⟨2222, target120⟩, ⟨2223, target121⟩, ⟨2228, target122⟩, ⟨2242, target123⟩, ⟨2258, target124⟩, ⟨2259, target125⟩, ⟨2264, target126⟩, ⟨2266, target127⟩]
  indexMask := 17176423999970551120745415853147598812203286946995797613454485409996183840670432129249535972798889321333786176273313141874807392663437222760787587973510309385111614911595210073801681851728258418639117418761820677595022180568498382098197514642136556809914101973754031315640117510177775439770778050357196918354384061796335560813558526183840614173594972406552840040283159325197917826907160323686822889608982167222984268711901333873457279269189241864200156578954917383033435763042779300256729475606469453774733538771427084936601835886919738427395154549115421710597168739977636993161858453150455787405487429293500252634649467934427284494122307337340621983312970942544735739412601081167872
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

end FranklSmallCyclic.TransportBatches.G050.B001.Data
