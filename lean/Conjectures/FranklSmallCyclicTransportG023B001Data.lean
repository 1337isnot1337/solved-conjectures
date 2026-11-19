module

public import Conjectures.FranklSmallCyclicRowCoverage
public import Conjectures.FranklSmallCyclicCanonicalWords
public import Conjectures.FranklSmallCyclicOrbit7Block023Data

/-! 128 literal targets sharing one source proof block.
Original words and row indices are retained; weights may be transported.
-/
@[expose] public section

namespace FranklSmallCyclic.TransportBatches.G023.B001.Data

-- Period 7, original row 1506, representative 3049.
def source0 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨89, by decide +kernel⟩

def target0 : Weights.Entry :=
  { word := [0, 12, 0, 4, 2, 0, 2], weights := [0, 0, 1, 0] }

def points0 : List (ℕ × ℕ) := [(0, 1), (1, 2), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 1507, representative 3000.
def source1 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨42, by decide +kernel⟩

def target1 : Weights.Entry :=
  { word := [0, 12, 0, 4, 2, 0, 4], weights := [1, 0, 0, 1] }

def points1 : List (ℕ × ℕ) := [(0, 0), (1, 2), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 1513, representative 2989.
def source2 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨31, by decide +kernel⟩

def target2 : Weights.Entry :=
  { word := [0, 12, 0, 4, 2, 8, 4], weights := [1, 0, 0, 1] }

-- Period 7, original row 1517, representative 3008.
def source3 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨50, by decide +kernel⟩

def target3 : Weights.Entry :=
  { word := [0, 12, 0, 4, 4, 4, 0], weights := [0, 0, 0, 1] }

def points3 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 5), (4, 6), (5, 4), (6, 3)]

-- Period 7, original row 1527, representative 3005.
def source4 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨47, by decide +kernel⟩

def target4 : Weights.Entry :=
  { word := [0, 12, 0, 4, 10, 0, 1], weights := [0, 0, 1, 0] }

def points4 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 1528, representative 3021.
def source5 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨62, by decide +kernel⟩

def target5 : Weights.Entry :=
  { word := [0, 12, 0, 4, 10, 0, 2], weights := [0, 0, 1, 0] }

def points5 : List (ℕ × ℕ) := [(0, 1), (1, 2), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 1529, representative 2998.
def source6 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨40, by decide +kernel⟩

def target6 : Weights.Entry :=
  { word := [0, 12, 0, 4, 10, 0, 4], weights := [1, 0, 0, 1] }

def points6 : List (ℕ × ℕ) := [(0, 0), (1, 2), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 1535, representative 2982.
def source7 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨24, by decide +kernel⟩

def target7 : Weights.Entry :=
  { word := [0, 12, 0, 4, 10, 8, 4], weights := [1, 0, 0, 1] }

-- Period 7, original row 1539, representative 3005.
def source8 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨47, by decide +kernel⟩

def target8 : Weights.Entry :=
  { word := [0, 12, 0, 4, 12, 4, 0], weights := [0, 0, 0, 1] }

def points8 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 5), (4, 6), (5, 4), (6, 3)]

-- Period 7, original row 1552, representative 3046.
def source9 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨86, by decide +kernel⟩

def target9 : Weights.Entry :=
  { word := [0, 12, 2, 0, 1, 0, 2], weights := [0, 1, 0, 1] }

-- Period 7, original row 1559, representative 2978.
def source10 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨20, by decide +kernel⟩

def target10 : Weights.Entry :=
  { word := [0, 12, 2, 0, 1, 8, 2], weights := [0, 1, 0, 1] }

-- Period 7, original row 1560, representative 2974.
def source11 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨16, by decide +kernel⟩

def target11 : Weights.Entry :=
  { word := [0, 12, 2, 0, 1, 8, 4], weights := [0, 1, 0, 1] }

-- Period 7, original row 1565, representative 3013.
def source12 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨54, by decide +kernel⟩

def target12 : Weights.Entry :=
  { word := [0, 12, 2, 0, 9, 0, 1], weights := [0, 0, 1, 1] }

def points12 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 1566, representative 3047.
def source13 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨87, by decide +kernel⟩

def target13 : Weights.Entry :=
  { word := [0, 12, 2, 0, 9, 0, 2], weights := [0, 1, 0, 1] }

-- Period 7, original row 1567, representative 2997.
def source14 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨39, by decide +kernel⟩

def target14 : Weights.Entry :=
  { word := [0, 12, 2, 0, 9, 0, 4], weights := [0, 1, 0, 1] }

-- Period 7, original row 1573, representative 2966.
def source15 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨8, by decide +kernel⟩

def target15 : Weights.Entry :=
  { word := [0, 12, 2, 0, 9, 8, 2], weights := [0, 1, 0, 1] }

-- Period 7, original row 1574, representative 2970.
def source16 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨12, by decide +kernel⟩

def target16 : Weights.Entry :=
  { word := [0, 12, 2, 0, 9, 8, 4], weights := [0, 1, 0, 1] }

-- Period 7, original row 1579, representative 3007.
def source17 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨49, by decide +kernel⟩

def target17 : Weights.Entry :=
  { word := [0, 12, 2, 8, 2, 0, 1], weights := [0, 1, 1, 0] }

def points17 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 1580, representative 3036.
def source18 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨76, by decide +kernel⟩

def target18 : Weights.Entry :=
  { word := [0, 12, 2, 8, 2, 0, 2], weights := [0, 1, 1, 0] }

-- Period 7, original row 1593, representative 3004.
def source19 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨46, by decide +kernel⟩

def target19 : Weights.Entry :=
  { word := [0, 12, 2, 8, 10, 0, 1], weights := [0, 1, 1, 0] }

def points19 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 1594, representative 3015.
def source20 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨56, by decide +kernel⟩

def target20 : Weights.Entry :=
  { word := [0, 12, 2, 8, 10, 0, 2], weights := [0, 1, 1, 0] }

-- Period 7, original row 1602, representative 3046.
def source21 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨86, by decide +kernel⟩

def target21 : Weights.Entry :=
  { word := [0, 12, 4, 4, 0, 0, 2], weights := [1, 0, 0, 1] }

def points21 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6)]

-- Period 7, original row 1609, representative 2978.
def source22 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨20, by decide +kernel⟩

def target22 : Weights.Entry :=
  { word := [0, 12, 4, 4, 0, 8, 2], weights := [1, 0, 0, 1] }

def points22 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6)]

-- Period 7, original row 1610, representative 2974.
def source23 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨16, by decide +kernel⟩

def target23 : Weights.Entry :=
  { word := [0, 12, 4, 4, 0, 8, 4], weights := [1, 0, 0, 1] }

def points23 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6)]

-- Period 7, original row 1615, representative 3010.
def source24 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨52, by decide +kernel⟩

def target24 : Weights.Entry :=
  { word := [0, 12, 4, 4, 8, 0, 1], weights := [0, 0, 1, 1] }

def points24 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 1616, representative 3030.
def source25 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨70, by decide +kernel⟩

def target25 : Weights.Entry :=
  { word := [0, 12, 4, 4, 8, 0, 2], weights := [1, 0, 1, 0] }

-- Period 7, original row 1617, representative 2995.
def source26 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨37, by decide +kernel⟩

def target26 : Weights.Entry :=
  { word := [0, 12, 4, 4, 8, 0, 4], weights := [1, 0, 0, 1] }

-- Period 7, original row 1634, representative 3009.
def source27 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨51, by decide +kernel⟩

def target27 : Weights.Entry :=
  { word := [0, 12, 8, 4, 2, 0, 1], weights := [0, 0, 1, 0] }

def points27 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 1635, representative 3050.
def source28 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨90, by decide +kernel⟩

def target28 : Weights.Entry :=
  { word := [0, 12, 8, 4, 2, 0, 2], weights := [0, 0, 1, 0] }

-- Period 7, original row 1636, representative 3001.
def source29 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨43, by decide +kernel⟩

def target29 : Weights.Entry :=
  { word := [0, 12, 8, 4, 2, 0, 4], weights := [1, 0, 0, 1] }

-- Period 7, original row 1642, representative 2990.
def source30 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨32, by decide +kernel⟩

def target30 : Weights.Entry :=
  { word := [0, 12, 8, 4, 2, 8, 4], weights := [1, 0, 0, 1] }

-- Period 7, original row 1646, representative 3003.
def source31 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨45, by decide +kernel⟩

def target31 : Weights.Entry :=
  { word := [0, 12, 8, 4, 4, 4, 0], weights := [0, 0, 1, 1] }

def points31 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 1660, representative 3006.
def source32 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨48, by decide +kernel⟩

def target32 : Weights.Entry :=
  { word := [0, 12, 8, 4, 10, 0, 1], weights := [0, 0, 1, 0] }

def points32 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 1661, representative 3022.
def source33 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨63, by decide +kernel⟩

def target33 : Weights.Entry :=
  { word := [0, 12, 8, 4, 10, 0, 2], weights := [0, 0, 1, 0] }

-- Period 7, original row 1662, representative 2999.
def source34 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨41, by decide +kernel⟩

def target34 : Weights.Entry :=
  { word := [0, 12, 8, 4, 10, 0, 4], weights := [1, 0, 0, 1] }

-- Period 7, original row 1668, representative 2983.
def source35 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨25, by decide +kernel⟩

def target35 : Weights.Entry :=
  { word := [0, 12, 8, 4, 10, 8, 4], weights := [1, 0, 0, 1] }

-- Period 7, original row 1672, representative 3002.
def source36 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨44, by decide +kernel⟩

def target36 : Weights.Entry :=
  { word := [0, 12, 8, 4, 12, 4, 0], weights := [0, 0, 1, 1] }

def points36 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 1691, representative 2979.
def source37 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨21, by decide +kernel⟩

def target37 : Weights.Entry :=
  { word := [0, 12, 10, 0, 1, 8, 2], weights := [0, 1, 0, 1] }

-- Period 7, original row 1692, representative 2975.
def source38 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨17, by decide +kernel⟩

def target38 : Weights.Entry :=
  { word := [0, 12, 10, 0, 1, 8, 4], weights := [0, 1, 0, 1] }

-- Period 7, original row 1698, representative 2967.
def source39 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨9, by decide +kernel⟩

def target39 : Weights.Entry :=
  { word := [0, 12, 10, 0, 9, 8, 2], weights := [0, 1, 0, 1] }

-- Period 7, original row 1699, representative 2971.
def source40 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨13, by decide +kernel⟩

def target40 : Weights.Entry :=
  { word := [0, 12, 10, 0, 9, 8, 4], weights := [0, 1, 0, 1] }

-- Period 7, original row 1717, representative 2979.
def source41 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨21, by decide +kernel⟩

def target41 : Weights.Entry :=
  { word := [0, 12, 12, 4, 0, 8, 2], weights := [1, 0, 0, 1] }

def points41 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6)]

-- Period 7, original row 1718, representative 2975.
def source42 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨17, by decide +kernel⟩

def target42 : Weights.Entry :=
  { word := [0, 12, 12, 4, 0, 8, 4], weights := [1, 0, 0, 1] }

def points42 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6)]

-- Period 7, original row 1723, representative 3011.
def source43 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨53, by decide +kernel⟩

def target43 : Weights.Entry :=
  { word := [0, 12, 12, 4, 8, 0, 1], weights := [0, 0, 1, 1] }

def points43 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 1724, representative 3031.
def source44 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨71, by decide +kernel⟩

def target44 : Weights.Entry :=
  { word := [0, 12, 12, 4, 8, 0, 2], weights := [1, 0, 1, 0] }

-- Period 7, original row 1725, representative 2996.
def source45 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨38, by decide +kernel⟩

def target45 : Weights.Entry :=
  { word := [0, 12, 12, 4, 8, 0, 4], weights := [1, 0, 0, 1] }

-- Period 7, original row 1745, representative 2992.
def source46 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨34, by decide +kernel⟩

def target46 : Weights.Entry :=
  { word := [1, 0, 1, 4, 2, 8, 4], weights := [1, 0, 0, 1] }

def points46 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 1761, representative 3053.
def source47 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨93, by decide +kernel⟩

def target47 : Weights.Entry :=
  { word := [1, 0, 1, 4, 10, 0, 4], weights := [1, 0, 0, 1] }

def points47 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 1767, representative 2985.
def source48 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨27, by decide +kernel⟩

def target48 : Weights.Entry :=
  { word := [1, 0, 1, 4, 10, 8, 4], weights := [1, 0, 0, 1] }

def points48 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 1793, representative 2963.
def source49 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨5, by decide +kernel⟩

def target49 : Weights.Entry :=
  { word := [1, 0, 2, 2, 2, 8, 4], weights := [1, 0, 0, 1] }

def points49 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 1800, representative 3053.
def source50 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨93, by decide +kernel⟩

def target50 : Weights.Entry :=
  { word := [1, 0, 2, 2, 10, 0, 4], weights := [1, 0, 0, 1] }

def points50 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 5), (5, 4), (6, 6)]

-- Period 7, original row 1813, representative 3053.
def source51 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨93, by decide +kernel⟩

def target51 : Weights.Entry :=
  { word := [1, 0, 9, 4, 4, 4, 0], weights := [0, 0, 1, 1] }

def points51 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 4), (5, 3), (6, 5)]

-- Period 7, original row 1817, representative 3023.
def source52 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨64, by decide +kernel⟩

def target52 : Weights.Entry :=
  { word := [1, 0, 9, 4, 12, 4, 0], weights := [0, 0, 1, 0] }

def points52 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 1828, representative 2964.
def source53 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨6, by decide +kernel⟩

def target53 : Weights.Entry :=
  { word := [1, 0, 10, 2, 2, 8, 4], weights := [1, 0, 0, 1] }

def points53 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 1836, representative 2958.
def source54 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨0, by decide +kernel⟩

def target54 : Weights.Entry :=
  { word := [1, 0, 10, 2, 10, 8, 4], weights := [1, 0, 0, 1] }

def points54 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 1849, representative 2977.
def source55 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨19, by decide +kernel⟩

def target55 : Weights.Entry :=
  { word := [1, 4, 2, 0, 1, 8, 2], weights := [0, 1, 0, 1] }

def points55 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 1850, representative 2973.
def source56 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨15, by decide +kernel⟩

def target56 : Weights.Entry :=
  { word := [1, 4, 2, 0, 1, 8, 4], weights := [0, 1, 0, 1] }

def points56 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 1855, representative 3058.
def source57 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨97, by decide +kernel⟩

def target57 : Weights.Entry :=
  { word := [1, 4, 2, 0, 9, 0, 1], weights := [0, 0, 1, 1] }

def points57 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 1856, representative 3058.
def source58 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨97, by decide +kernel⟩

def target58 : Weights.Entry :=
  { word := [1, 4, 2, 0, 9, 0, 2], weights := [0, 1, 0, 1] }

def points58 : List (ℕ × ℕ) := [(0, 1), (1, 2), (2, 0), (3, 6), (4, 4), (5, 5), (6, 3)]

-- Period 7, original row 1857, representative 3040.
def source59 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨80, by decide +kernel⟩

def target59 : Weights.Entry :=
  { word := [1, 4, 2, 0, 9, 0, 4], weights := [0, 1, 0, 1] }

def points59 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 1863, representative 2965.
def source60 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨7, by decide +kernel⟩

def target60 : Weights.Entry :=
  { word := [1, 4, 2, 0, 9, 8, 2], weights := [0, 1, 0, 1] }

def points60 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 1864, representative 2969.
def source61 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨11, by decide +kernel⟩

def target61 : Weights.Entry :=
  { word := [1, 4, 2, 0, 9, 8, 4], weights := [0, 1, 0, 1] }

def points61 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 1869, representative 3037.
def source62 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨77, by decide +kernel⟩

def target62 : Weights.Entry :=
  { word := [1, 4, 2, 8, 2, 0, 1], weights := [1, 1, 0, 0] }

def points62 : List (ℕ × ℕ) := [(0, 2), (1, 0), (2, 1), (3, 6), (4, 3), (5, 4), (6, 5)]

-- Period 7, original row 1870, representative 3037.
def source63 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨77, by decide +kernel⟩

def target63 : Weights.Entry :=
  { word := [1, 4, 2, 8, 2, 0, 2], weights := [1, 0, 1, 0] }

def points63 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 2), (3, 6), (4, 3), (5, 5), (6, 4)]

-- Period 7, original row 1883, representative 3016.
def source64 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨57, by decide +kernel⟩

def target64 : Weights.Entry :=
  { word := [1, 4, 2, 8, 10, 0, 1], weights := [0, 1, 1, 0] }

def points64 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 1884, representative 3016.
def source65 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨57, by decide +kernel⟩

def target65 : Weights.Entry :=
  { word := [1, 4, 2, 8, 10, 0, 2], weights := [0, 1, 1, 0] }

def points65 : List (ℕ × ℕ) := [(0, 1), (1, 2), (2, 0), (3, 6), (4, 4), (5, 5), (6, 3)]

-- Period 7, original row 1899, representative 2977.
def source66 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨19, by decide +kernel⟩

def target66 : Weights.Entry :=
  { word := [1, 4, 4, 4, 0, 8, 2], weights := [1, 0, 0, 1] }

def points66 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6)]

-- Period 7, original row 1900, representative 2973.
def source67 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨15, by decide +kernel⟩

def target67 : Weights.Entry :=
  { word := [1, 4, 4, 4, 0, 8, 4], weights := [1, 0, 0, 1] }

def points67 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6)]

-- Period 7, original row 1905, representative 3051.
def source68 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨91, by decide +kernel⟩

def target68 : Weights.Entry :=
  { word := [1, 4, 4, 4, 8, 0, 1], weights := [0, 0, 1, 1] }

def points68 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 1906, representative 3032.
def source69 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨72, by decide +kernel⟩

def target69 : Weights.Entry :=
  { word := [1, 4, 4, 4, 8, 0, 2], weights := [1, 0, 1, 0] }

def points69 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 1907, representative 3034.
def source70 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨74, by decide +kernel⟩

def target70 : Weights.Entry :=
  { word := [1, 4, 4, 4, 8, 0, 4], weights := [1, 0, 0, 1] }

def points70 : List (ℕ × ℕ) := [(0, 0), (1, 2), (2, 1), (3, 3), (4, 6), (5, 4), (6, 5)]

-- Period 7, original row 1919, representative 3041.
def source71 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨81, by decide +kernel⟩

def target71 : Weights.Entry :=
  { word := [1, 4, 8, 4, 2, 0, 1], weights := [1, 0, 0, 0] }

def points71 : List (ℕ × ℕ) := [(0, 2), (1, 0), (2, 1), (3, 6), (4, 3), (5, 4), (6, 5)]

-- Period 7, original row 1920, representative 3059.
def source72 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨98, by decide +kernel⟩

def target72 : Weights.Entry :=
  { word := [1, 4, 8, 4, 2, 0, 2], weights := [0, 0, 1, 0] }

def points72 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 1921, representative 3059.
def source73 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨98, by decide +kernel⟩

def target73 : Weights.Entry :=
  { word := [1, 4, 8, 4, 2, 0, 4], weights := [1, 0, 0, 0] }

def points73 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 2), (3, 5), (4, 4), (5, 3), (6, 6)]

-- Period 7, original row 1927, representative 2991.
def source74 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨33, by decide +kernel⟩

def target74 : Weights.Entry :=
  { word := [1, 4, 8, 4, 2, 8, 4], weights := [1, 0, 0, 1] }

def points74 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 1931, representative 3034.
def source75 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨74, by decide +kernel⟩

def target75 : Weights.Entry :=
  { word := [1, 4, 8, 4, 4, 4, 0], weights := [0, 0, 1, 1] }

def points75 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 1945, representative 3019.
def source76 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨60, by decide +kernel⟩

def target76 : Weights.Entry :=
  { word := [1, 4, 8, 4, 10, 0, 1], weights := [0, 0, 1, 0] }

def points76 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 1946, representative 3027.
def source77 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨67, by decide +kernel⟩

def target77 : Weights.Entry :=
  { word := [1, 4, 8, 4, 10, 0, 2], weights := [0, 0, 1, 0] }

def points77 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 1947, representative 3054.
def source78 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨94, by decide +kernel⟩

def target78 : Weights.Entry :=
  { word := [1, 4, 8, 4, 10, 0, 4], weights := [1, 0, 0, 1] }

def points78 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 1953, representative 2984.
def source79 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨26, by decide +kernel⟩

def target79 : Weights.Entry :=
  { word := [1, 4, 8, 4, 10, 8, 4], weights := [1, 0, 0, 1] }

def points79 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 1957, representative 3014.
def source80 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨55, by decide +kernel⟩

def target80 : Weights.Entry :=
  { word := [1, 4, 8, 4, 12, 4, 0], weights := [0, 0, 1, 1] }

def points80 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 1976, representative 2980.
def source81 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨22, by decide +kernel⟩

def target81 : Weights.Entry :=
  { word := [1, 4, 10, 0, 1, 8, 2], weights := [0, 1, 0, 1] }

def points81 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 1977, representative 2976.
def source82 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨18, by decide +kernel⟩

def target82 : Weights.Entry :=
  { word := [1, 4, 10, 0, 1, 8, 4], weights := [0, 1, 0, 1] }

def points82 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 1983, representative 2968.
def source83 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨10, by decide +kernel⟩

def target83 : Weights.Entry :=
  { word := [1, 4, 10, 0, 9, 8, 2], weights := [0, 1, 0, 1] }

def points83 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 1984, representative 2972.
def source84 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨14, by decide +kernel⟩

def target84 : Weights.Entry :=
  { word := [1, 4, 10, 0, 9, 8, 4], weights := [0, 1, 0, 1] }

def points84 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 2002, representative 2980.
def source85 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨22, by decide +kernel⟩

def target85 : Weights.Entry :=
  { word := [1, 4, 12, 4, 0, 8, 2], weights := [1, 0, 0, 1] }

def points85 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6)]

-- Period 7, original row 2003, representative 2976.
def source86 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨18, by decide +kernel⟩

def target86 : Weights.Entry :=
  { word := [1, 4, 12, 4, 0, 8, 4], weights := [1, 0, 0, 1] }

def points86 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6)]

-- Period 7, original row 2008, representative 3052.
def source87 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨92, by decide +kernel⟩

def target87 : Weights.Entry :=
  { word := [1, 4, 12, 4, 8, 0, 1], weights := [0, 0, 1, 1] }

def points87 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 2009, representative 3033.
def source88 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨73, by decide +kernel⟩

def target88 : Weights.Entry :=
  { word := [1, 4, 12, 4, 8, 0, 2], weights := [1, 0, 1, 0] }

def points88 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 2010, representative 3035.
def source89 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨75, by decide +kernel⟩

def target89 : Weights.Entry :=
  { word := [1, 4, 12, 4, 8, 0, 4], weights := [1, 0, 0, 1] }

def points89 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 2022, representative 3049.
def source90 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨89, by decide +kernel⟩

def target90 : Weights.Entry :=
  { word := [1, 8, 1, 4, 2, 0, 1], weights := [0, 0, 1, 0] }

def points90 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 2023, representative 3008.
def source91 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨50, by decide +kernel⟩

def target91 : Weights.Entry :=
  { word := [1, 8, 1, 4, 2, 0, 2], weights := [0, 0, 1, 0] }

def points91 : List (ℕ × ℕ) := [(0, 1), (1, 2), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 2024, representative 3000.
def source92 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨42, by decide +kernel⟩

def target92 : Weights.Entry :=
  { word := [1, 8, 1, 4, 2, 0, 4], weights := [1, 0, 0, 1] }

def points92 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 2030, representative 2993.
def source93 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨35, by decide +kernel⟩

def target93 : Weights.Entry :=
  { word := [1, 8, 1, 4, 2, 8, 4], weights := [1, 0, 0, 1] }

def points93 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 2034, representative 3049.
def source94 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨89, by decide +kernel⟩

def target94 : Weights.Entry :=
  { word := [1, 8, 1, 4, 4, 4, 0], weights := [0, 0, 0, 1] }

def points94 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 5), (4, 6), (5, 4), (6, 3)]

-- Period 7, original row 2044, representative 3021.
def source95 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨62, by decide +kernel⟩

def target95 : Weights.Entry :=
  { word := [1, 8, 1, 4, 10, 0, 1], weights := [0, 0, 1, 0] }

def points95 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 2045, representative 3005.
def source96 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨47, by decide +kernel⟩

def target96 : Weights.Entry :=
  { word := [1, 8, 1, 4, 10, 0, 2], weights := [0, 0, 1, 0] }

def points96 : List (ℕ × ℕ) := [(0, 1), (1, 2), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 2046, representative 2998.
def source97 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨40, by decide +kernel⟩

def target97 : Weights.Entry :=
  { word := [1, 8, 1, 4, 10, 0, 4], weights := [1, 0, 0, 1] }

def points97 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 2052, representative 2986.
def source98 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨28, by decide +kernel⟩

def target98 : Weights.Entry :=
  { word := [1, 8, 1, 4, 10, 8, 4], weights := [1, 0, 0, 1] }

def points98 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 2056, representative 3021.
def source99 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨62, by decide +kernel⟩

def target99 : Weights.Entry :=
  { word := [1, 8, 1, 4, 12, 4, 0], weights := [0, 0, 0, 1] }

def points99 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 5), (4, 6), (5, 4), (6, 3)]

-- Period 7, original row 2068, representative 3055.
def source100 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨95, by decide +kernel⟩

def target100 : Weights.Entry :=
  { word := [1, 8, 2, 2, 2, 0, 1], weights := [0, 1, 0, 0] }

def points100 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 2069, representative 3038.
def source101 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨78, by decide +kernel⟩

def target101 : Weights.Entry :=
  { word := [1, 8, 2, 2, 2, 0, 2], weights := [0, 1, 0, 0] }

def points101 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 2070, representative 3042.
def source102 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨82, by decide +kernel⟩

def target102 : Weights.Entry :=
  { word := [1, 8, 2, 2, 2, 0, 4], weights := [1, 0, 0, 1] }

def points102 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 2078, representative 2959.
def source103 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨1, by decide +kernel⟩

def target103 : Weights.Entry :=
  { word := [1, 8, 2, 2, 2, 8, 4], weights := [1, 0, 0, 1] }

def points103 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 2083, representative 3024.
def source104 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨65, by decide +kernel⟩

def target104 : Weights.Entry :=
  { word := [1, 8, 2, 2, 10, 0, 1], weights := [0, 1, 0, 0] }

def points104 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 2084, representative 3017.
def source105 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨58, by decide +kernel⟩

def target105 : Weights.Entry :=
  { word := [1, 8, 2, 2, 10, 0, 2], weights := [0, 1, 0, 0] }

def points105 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 2085, representative 3043.
def source106 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨83, by decide +kernel⟩

def target106 : Weights.Entry :=
  { word := [1, 8, 2, 2, 10, 0, 4], weights := [1, 0, 0, 1] }

def points106 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 2098, representative 3056.
def source107 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨96, by decide +kernel⟩

def target107 : Weights.Entry :=
  { word := [1, 8, 2, 10, 2, 0, 1], weights := [0, 1, 0, 0] }

def points107 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 2099, representative 3039.
def source108 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨79, by decide +kernel⟩

def target108 : Weights.Entry :=
  { word := [1, 8, 2, 10, 2, 0, 2], weights := [0, 1, 0, 0] }

def points108 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 2100, representative 3045.
def source109 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨85, by decide +kernel⟩

def target109 : Weights.Entry :=
  { word := [1, 8, 2, 10, 2, 0, 4], weights := [1, 1, 0, 0] }

def points109 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 2107, representative 2962.
def source110 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨4, by decide +kernel⟩

def target110 : Weights.Entry :=
  { word := [1, 8, 2, 10, 2, 8, 4], weights := [1, 0, 0, 1] }

def points110 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 2112, representative 3025.
def source111 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨66, by decide +kernel⟩

def target111 : Weights.Entry :=
  { word := [1, 8, 2, 10, 10, 0, 1], weights := [0, 1, 0, 0] }

def points111 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 2113, representative 3018.
def source112 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨59, by decide +kernel⟩

def target112 : Weights.Entry :=
  { word := [1, 8, 2, 10, 10, 0, 2], weights := [0, 1, 0, 0] }

def points112 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 2114, representative 3044.
def source113 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨84, by decide +kernel⟩

def target113 : Weights.Entry :=
  { word := [1, 8, 2, 10, 10, 0, 4], weights := [1, 1, 0, 0] }

def points113 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 2134, representative 3060.
def source114 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨99, by decide +kernel⟩

def target114 : Weights.Entry :=
  { word := [1, 8, 8, 4, 4, 4, 0], weights := [0, 0, 1, 1] }

def points114 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 2142, representative 3028.
def source115 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨68, by decide +kernel⟩

def target115 : Weights.Entry :=
  { word := [1, 8, 8, 4, 12, 4, 0], weights := [0, 0, 1, 0] }

def points115 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 2150, representative 3048.
def source116 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨88, by decide +kernel⟩

def target116 : Weights.Entry :=
  { word := [1, 8, 9, 4, 4, 4, 0], weights := [0, 0, 1, 1] }

def points116 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 2154, representative 3020.
def source117 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨61, by decide +kernel⟩

def target117 : Weights.Entry :=
  { word := [1, 8, 9, 4, 12, 4, 0], weights := [0, 0, 1, 0] }

def points117 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 2165, representative 2960.
def source118 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨2, by decide +kernel⟩

def target118 : Weights.Entry :=
  { word := [1, 8, 10, 2, 2, 8, 4], weights := [1, 0, 0, 1] }

def points118 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 2180, representative 2961.
def source119 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨3, by decide +kernel⟩

def target119 : Weights.Entry :=
  { word := [1, 8, 10, 10, 2, 8, 4], weights := [1, 0, 0, 1] }

def points119 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 2201, representative 3046.
def source120 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨86, by decide +kernel⟩

def target120 : Weights.Entry :=
  { word := [1, 12, 2, 0, 1, 0, 2], weights := [0, 1, 0, 1] }

def points120 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 2208, representative 2978.
def source121 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨20, by decide +kernel⟩

def target121 : Weights.Entry :=
  { word := [1, 12, 2, 0, 1, 8, 2], weights := [0, 1, 0, 1] }

def points121 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 2209, representative 2974.
def source122 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨16, by decide +kernel⟩

def target122 : Weights.Entry :=
  { word := [1, 12, 2, 0, 1, 8, 4], weights := [0, 1, 0, 1] }

def points122 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 2214, representative 3013.
def source123 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨54, by decide +kernel⟩

def target123 : Weights.Entry :=
  { word := [1, 12, 2, 0, 9, 0, 1], weights := [0, 0, 1, 1] }

def points123 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 2215, representative 3047.
def source124 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨87, by decide +kernel⟩

def target124 : Weights.Entry :=
  { word := [1, 12, 2, 0, 9, 0, 2], weights := [0, 1, 0, 1] }

def points124 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 2216, representative 2997.
def source125 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨39, by decide +kernel⟩

def target125 : Weights.Entry :=
  { word := [1, 12, 2, 0, 9, 0, 4], weights := [0, 1, 0, 1] }

def points125 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 2222, representative 2966.
def source126 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨8, by decide +kernel⟩

def target126 : Weights.Entry :=
  { word := [1, 12, 2, 0, 9, 8, 2], weights := [0, 1, 0, 1] }

def points126 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 2223, representative 2970.
def source127 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨12, by decide +kernel⟩

def target127 : Weights.Entry :=
  { word := [1, 12, 2, 0, 9, 8, 4], weights := [0, 1, 0, 1] }

def points127 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

def period7Entries : List Weights.Entry := [target0, target1, target2, target3, target4, target5, target6, target7, target8, target9, target10, target11, target12, target13, target14, target15, target16, target17, target18, target19, target20, target21, target22, target23, target24, target25, target26, target27, target28, target29, target30, target31, target32, target33, target34, target35, target36, target37, target38, target39, target40, target41, target42, target43, target44, target45, target46, target47, target48, target49, target50, target51, target52, target53, target54, target55, target56, target57, target58, target59, target60, target61, target62, target63, target64, target65, target66, target67, target68, target69, target70, target71, target72, target73, target74, target75, target76, target77, target78, target79, target80, target81, target82, target83, target84, target85, target86, target87, target88, target89, target90, target91, target92, target93, target94, target95, target96, target97, target98, target99, target100, target101, target102, target103, target104, target105, target106, target107, target108, target109, target110, target111, target112, target113, target114, target115, target116, target117, target118, target119, target120, target121, target122, target123, target124, target125, target126, target127]

def period7Chunk : RowCoverage.Chunk where
  rows := [⟨1506, target0⟩, ⟨1507, target1⟩, ⟨1513, target2⟩, ⟨1517, target3⟩, ⟨1527, target4⟩, ⟨1528, target5⟩, ⟨1529, target6⟩, ⟨1535, target7⟩, ⟨1539, target8⟩, ⟨1552, target9⟩, ⟨1559, target10⟩, ⟨1560, target11⟩, ⟨1565, target12⟩, ⟨1566, target13⟩, ⟨1567, target14⟩, ⟨1573, target15⟩, ⟨1574, target16⟩, ⟨1579, target17⟩, ⟨1580, target18⟩, ⟨1593, target19⟩, ⟨1594, target20⟩, ⟨1602, target21⟩, ⟨1609, target22⟩, ⟨1610, target23⟩, ⟨1615, target24⟩, ⟨1616, target25⟩, ⟨1617, target26⟩, ⟨1634, target27⟩, ⟨1635, target28⟩, ⟨1636, target29⟩, ⟨1642, target30⟩, ⟨1646, target31⟩, ⟨1660, target32⟩, ⟨1661, target33⟩, ⟨1662, target34⟩, ⟨1668, target35⟩, ⟨1672, target36⟩, ⟨1691, target37⟩, ⟨1692, target38⟩, ⟨1698, target39⟩, ⟨1699, target40⟩, ⟨1717, target41⟩, ⟨1718, target42⟩, ⟨1723, target43⟩, ⟨1724, target44⟩, ⟨1725, target45⟩, ⟨1745, target46⟩, ⟨1761, target47⟩, ⟨1767, target48⟩, ⟨1793, target49⟩, ⟨1800, target50⟩, ⟨1813, target51⟩, ⟨1817, target52⟩, ⟨1828, target53⟩, ⟨1836, target54⟩, ⟨1849, target55⟩, ⟨1850, target56⟩, ⟨1855, target57⟩, ⟨1856, target58⟩, ⟨1857, target59⟩, ⟨1863, target60⟩, ⟨1864, target61⟩, ⟨1869, target62⟩, ⟨1870, target63⟩, ⟨1883, target64⟩, ⟨1884, target65⟩, ⟨1899, target66⟩, ⟨1900, target67⟩, ⟨1905, target68⟩, ⟨1906, target69⟩, ⟨1907, target70⟩, ⟨1919, target71⟩, ⟨1920, target72⟩, ⟨1921, target73⟩, ⟨1927, target74⟩, ⟨1931, target75⟩, ⟨1945, target76⟩, ⟨1946, target77⟩, ⟨1947, target78⟩, ⟨1953, target79⟩, ⟨1957, target80⟩, ⟨1976, target81⟩, ⟨1977, target82⟩, ⟨1983, target83⟩, ⟨1984, target84⟩, ⟨2002, target85⟩, ⟨2003, target86⟩, ⟨2008, target87⟩, ⟨2009, target88⟩, ⟨2010, target89⟩, ⟨2022, target90⟩, ⟨2023, target91⟩, ⟨2024, target92⟩, ⟨2030, target93⟩, ⟨2034, target94⟩, ⟨2044, target95⟩, ⟨2045, target96⟩, ⟨2046, target97⟩, ⟨2052, target98⟩, ⟨2056, target99⟩, ⟨2068, target100⟩, ⟨2069, target101⟩, ⟨2070, target102⟩, ⟨2078, target103⟩, ⟨2083, target104⟩, ⟨2084, target105⟩, ⟨2085, target106⟩, ⟨2098, target107⟩, ⟨2099, target108⟩, ⟨2100, target109⟩, ⟨2107, target110⟩, ⟨2112, target111⟩, ⟨2113, target112⟩, ⟨2114, target113⟩, ⟨2134, target114⟩, ⟨2142, target115⟩, ⟨2150, target116⟩, ⟨2154, target117⟩, ⟨2165, target118⟩, ⟨2180, target119⟩, ⟨2201, target120⟩, ⟨2208, target121⟩, ⟨2209, target122⟩, ⟨2214, target123⟩, ⟨2215, target124⟩, ⟨2216, target125⟩, ⟨2222, target126⟩, ⟨2223, target127⟩]
  indexMask := 2342817384494962189863831947825087977519054646446545343262437954106632531064672546303515211671074500652534260039876376498552920387392727157489942488335405510950791792893194998136689582071865770335912181961461252422891706180561998591698547648157947237785282711992928872121042130953234506751438280975476419585524178635324321955067895274380475223323419305224353165095878656053749369889107109023934553566523406707393761043314762202127667961903050190524883593124355606322262270862596261623108006040814035079458966371765940892719824544142426963235398731755554655407512266231771305779827268693630140100383574614465906911365220147842151283605325958957157515133946393168866967552
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

end FranklSmallCyclic.TransportBatches.G023.B001.Data
