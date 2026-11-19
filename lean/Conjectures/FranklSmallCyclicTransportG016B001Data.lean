module

public import Conjectures.FranklSmallCyclicRowCoverage
public import Conjectures.FranklSmallCyclicCanonicalWords
public import Conjectures.FranklSmallCyclicOrbit7Block016Data

/-! 128 literal targets sharing one source proof block.
Original words and row indices are retained; weights may be transported.
-/
@[expose] public section

namespace FranklSmallCyclic.TransportBatches.G016.B001.Data

-- Period 7, original row 3612, representative 2102.
def source0 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B016.Data.entryAt ⟨41, by decide +kernel⟩

def target0 : Weights.Entry :=
  { word := [4, 2, 8, 2, 0, 2, 8], weights := [0, 1, 0, 1] }

def points0 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6)]

-- Period 7, original row 3617, representative 2110.
def source1 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B016.Data.entryAt ⟨49, by decide +kernel⟩

def target1 : Weights.Entry :=
  { word := [4, 2, 8, 2, 0, 8, 8], weights := [1, 0, 0, 1] }

-- Period 7, original row 3622, representative 2103.
def source2 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B016.Data.entryAt ⟨42, by decide +kernel⟩

def target2 : Weights.Entry :=
  { word := [4, 2, 8, 2, 0, 9, 8], weights := [1, 0, 0, 1] }

-- Period 7, original row 3624, representative 2103.
def source3 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B016.Data.entryAt ⟨42, by decide +kernel⟩

def target3 : Weights.Entry :=
  { word := [4, 2, 8, 2, 0, 10, 8], weights := [0, 1, 0, 1] }

def points3 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6)]

-- Period 7, original row 3626, representative 2107.
def source4 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B016.Data.entryAt ⟨46, by decide +kernel⟩

def target4 : Weights.Entry :=
  { word := [4, 2, 8, 2, 8, 2, 8], weights := [1, 0, 0, 1] }

-- Period 7, original row 3630, representative 2104.
def source5 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B016.Data.entryAt ⟨43, by decide +kernel⟩

def target5 : Weights.Entry :=
  { word := [4, 2, 8, 2, 8, 10, 8], weights := [1, 0, 0, 1] }

-- Period 7, original row 3642, representative 2109.
def source6 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B016.Data.entryAt ⟨48, by decide +kernel⟩

def target6 : Weights.Entry :=
  { word := [4, 2, 8, 10, 0, 1, 8], weights := [1, 0, 0, 1] }

-- Period 7, original row 3644, representative 2109.
def source7 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B016.Data.entryAt ⟨48, by decide +kernel⟩

def target7 : Weights.Entry :=
  { word := [4, 2, 8, 10, 0, 2, 8], weights := [0, 1, 0, 1] }

def points7 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6)]

-- Period 7, original row 3650, representative 2111.
def source8 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B016.Data.entryAt ⟨50, by decide +kernel⟩

def target8 : Weights.Entry :=
  { word := [4, 2, 8, 10, 0, 8, 8], weights := [1, 0, 0, 1] }

-- Period 7, original row 3655, representative 2106.
def source9 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B016.Data.entryAt ⟨45, by decide +kernel⟩

def target9 : Weights.Entry :=
  { word := [4, 2, 8, 10, 0, 9, 8], weights := [1, 0, 0, 1] }

-- Period 7, original row 3657, representative 2106.
def source10 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B016.Data.entryAt ⟨45, by decide +kernel⟩

def target10 : Weights.Entry :=
  { word := [4, 2, 8, 10, 0, 10, 8], weights := [0, 1, 0, 1] }

def points10 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6)]

-- Period 7, original row 3660, representative 2108.
def source11 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B016.Data.entryAt ⟨47, by decide +kernel⟩

def target11 : Weights.Entry :=
  { word := [4, 2, 8, 10, 8, 2, 8], weights := [1, 0, 0, 1] }

-- Period 7, original row 3666, representative 2105.
def source12 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B016.Data.entryAt ⟨44, by decide +kernel⟩

def target12 : Weights.Entry :=
  { word := [4, 2, 8, 10, 8, 10, 8], weights := [1, 0, 0, 1] }

-- Period 7, original row 3681, representative 2151.
def source13 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B016.Data.entryAt ⟨90, by decide +kernel⟩

def target13 : Weights.Entry :=
  { word := [4, 4, 8, 0, 1, 4, 8], weights := [0, 0, 1, 0] }

-- Period 7, original row 3682, representative 2070.
def source14 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B016.Data.entryAt ⟨9, by decide +kernel⟩

def target14 : Weights.Entry :=
  { word := [4, 4, 8, 0, 1, 12, 8], weights := [0, 0, 1, 0] }

-- Period 7, original row 3685, representative 2152.
def source15 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B016.Data.entryAt ⟨91, by decide +kernel⟩

def target15 : Weights.Entry :=
  { word := [4, 4, 8, 8, 1, 4, 8], weights := [1, 1, 1, 0] }

def points15 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 2), (3, 5), (4, 3), (5, 4), (6, 6)]

-- Period 7, original row 3690, representative 2071.
def source16 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B016.Data.entryAt ⟨10, by decide +kernel⟩

def target16 : Weights.Entry :=
  { word := [4, 4, 8, 8, 1, 12, 8], weights := [0, 0, 1, 0] }

-- Period 7, original row 3697, representative 2168.
def source17 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B016.Data.entryAt ⟨106, by decide +kernel⟩

def target17 : Weights.Entry :=
  { word := [4, 4, 8, 8, 4, 6, 0], weights := [0, 1, 1, 0] }

def points17 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 3706, representative 2167.
def source18 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B016.Data.entryAt ⟨105, by decide +kernel⟩

def target18 : Weights.Entry :=
  { word := [4, 4, 8, 8, 12, 6, 0], weights := [0, 1, 1, 0] }

def points18 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 3736, representative 2096.
def source19 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B016.Data.entryAt ⟨35, by decide +kernel⟩

def target19 : Weights.Entry :=
  { word := [4, 8, 0, 4, 4, 4, 8], weights := [1, 0, 0, 1] }

-- Period 7, original row 3743, representative 2100.
def source20 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B016.Data.entryAt ⟨39, by decide +kernel⟩

def target20 : Weights.Entry :=
  { word := [4, 8, 0, 4, 8, 4, 8], weights := [1, 0, 1, 0] }

-- Period 7, original row 3762, representative 2097.
def source21 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B016.Data.entryAt ⟨36, by decide +kernel⟩

def target21 : Weights.Entry :=
  { word := [4, 8, 0, 4, 12, 4, 8], weights := [1, 0, 0, 1] }

-- Period 7, original row 3780, representative 2099.
def source22 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B016.Data.entryAt ⟨38, by decide +kernel⟩

def target22 : Weights.Entry :=
  { word := [4, 8, 0, 12, 4, 4, 8], weights := [1, 0, 0, 1] }

-- Period 7, original row 3786, representative 2101.
def source23 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B016.Data.entryAt ⟨40, by decide +kernel⟩

def target23 : Weights.Entry :=
  { word := [4, 8, 0, 12, 8, 4, 8], weights := [1, 0, 1, 0] }

-- Period 7, original row 3805, representative 2098.
def source24 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B016.Data.entryAt ⟨37, by decide +kernel⟩

def target24 : Weights.Entry :=
  { word := [4, 8, 0, 12, 12, 4, 8], weights := [1, 0, 0, 1] }

-- Period 7, original row 3882, representative 2092.
def source25 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B016.Data.entryAt ⟨31, by decide +kernel⟩

def target25 : Weights.Entry :=
  { word := [4, 8, 8, 4, 4, 4, 8], weights := [1, 0, 0, 1] }

-- Period 7, original row 3883, representative 2178.
def source26 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B016.Data.entryAt ⟨116, by decide +kernel⟩

def target26 : Weights.Entry :=
  { word := [4, 8, 8, 4, 4, 12, 0], weights := [1, 0, 0, 1] }

def points26 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 3890, representative 2093.
def source27 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B016.Data.entryAt ⟨32, by decide +kernel⟩

def target27 : Weights.Entry :=
  { word := [4, 8, 8, 4, 12, 4, 8], weights := [1, 0, 0, 1] }

-- Period 7, original row 3891, representative 2179.
def source28 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B016.Data.entryAt ⟨117, by decide +kernel⟩

def target28 : Weights.Entry :=
  { word := [4, 8, 8, 4, 12, 12, 0], weights := [1, 0, 0, 1] }

def points28 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 3893, representative 2170.
def source29 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B016.Data.entryAt ⟨108, by decide +kernel⟩

def target29 : Weights.Entry :=
  { word := [4, 8, 8, 8, 4, 6, 0], weights := [0, 1, 1, 0] }

def points29 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 3898, representative 2169.
def source30 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B016.Data.entryAt ⟨107, by decide +kernel⟩

def target30 : Weights.Entry :=
  { word := [4, 8, 8, 8, 12, 6, 0], weights := [0, 1, 1, 0] }

def points30 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 3904, representative 2095.
def source31 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B016.Data.entryAt ⟨34, by decide +kernel⟩

def target31 : Weights.Entry :=
  { word := [4, 8, 8, 12, 4, 4, 8], weights := [1, 0, 0, 1] }

-- Period 7, original row 3905, representative 2181.
def source32 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B016.Data.entryAt ⟨119, by decide +kernel⟩

def target32 : Weights.Entry :=
  { word := [4, 8, 8, 12, 4, 12, 0], weights := [0, 1, 1, 0] }

def points32 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 3911, representative 2094.
def source33 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B016.Data.entryAt ⟨33, by decide +kernel⟩

def target33 : Weights.Entry :=
  { word := [4, 8, 8, 12, 12, 4, 8], weights := [1, 0, 0, 1] }

-- Period 7, original row 3912, representative 2180.
def source34 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B016.Data.entryAt ⟨118, by decide +kernel⟩

def target34 : Weights.Entry :=
  { word := [4, 8, 8, 12, 12, 12, 0], weights := [0, 1, 1, 0] }

def points34 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 4046, representative 2146.
def source35 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B016.Data.entryAt ⟨85, by decide +kernel⟩

def target35 : Weights.Entry :=
  { word := [4, 12, 8, 0, 1, 4, 8], weights := [0, 0, 1, 0] }

-- Period 7, original row 4047, representative 2068.
def source36 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B016.Data.entryAt ⟨7, by decide +kernel⟩

def target36 : Weights.Entry :=
  { word := [4, 12, 8, 0, 1, 12, 8], weights := [0, 0, 1, 0] }

-- Period 7, original row 4050, representative 2147.
def source37 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B016.Data.entryAt ⟨86, by decide +kernel⟩

def target37 : Weights.Entry :=
  { word := [4, 12, 8, 8, 1, 4, 8], weights := [0, 0, 1, 0] }

-- Period 7, original row 4055, representative 2069.
def source38 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B016.Data.entryAt ⟨8, by decide +kernel⟩

def target38 : Weights.Entry :=
  { word := [4, 12, 8, 8, 1, 12, 8], weights := [0, 0, 1, 0] }

-- Period 7, original row 4062, representative 2166.
def source39 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B016.Data.entryAt ⟨104, by decide +kernel⟩

def target39 : Weights.Entry :=
  { word := [4, 12, 8, 8, 4, 6, 0], weights := [0, 1, 1, 0] }

def points39 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 4071, representative 2165.
def source40 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B016.Data.entryAt ⟨103, by decide +kernel⟩

def target40 : Weights.Entry :=
  { word := [4, 12, 8, 8, 12, 6, 0], weights := [0, 1, 1, 0] }

def points40 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 4109, representative 2156.
def source41 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B016.Data.entryAt ⟨95, by decide +kernel⟩

def target41 : Weights.Entry :=
  { word := [8, 0, 0, 9, 12, 4, 4], weights := [1, 0, 1, 1] }

def points41 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 5), (4, 4), (5, 6), (6, 3)]

-- Period 7, original row 4115, representative 2128.
def source42 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B016.Data.entryAt ⟨67, by decide +kernel⟩

def target42 : Weights.Entry :=
  { word := [8, 0, 0, 12, 0, 4, 2], weights := [0, 0, 0, 1] }

def points42 : List (ℕ × ℕ) := [(0, 2), (1, 0), (2, 1), (3, 5), (4, 4), (5, 6), (6, 3)]

-- Period 7, original row 4116, representative 2128.
def source43 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B016.Data.entryAt ⟨67, by decide +kernel⟩

def target43 : Weights.Entry :=
  { word := [8, 0, 0, 12, 0, 4, 4], weights := [0, 0, 0, 1] }

def points43 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 5), (4, 4), (5, 6), (6, 3)]

-- Period 7, original row 4137, representative 2102.
def source44 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B016.Data.entryAt ⟨41, by decide +kernel⟩

def target44 : Weights.Entry :=
  { word := [8, 0, 1, 4, 8, 4, 2], weights := [1, 0, 0, 1] }

def points44 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 4138, representative 2120.
def source45 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B016.Data.entryAt ⟨59, by decide +kernel⟩

def target45 : Weights.Entry :=
  { word := [8, 0, 1, 4, 8, 4, 4], weights := [1, 0, 1, 0] }

def points45 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 5), (4, 4), (5, 6), (6, 3)]

-- Period 7, original row 4173, representative 2109.
def source46 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B016.Data.entryAt ⟨48, by decide +kernel⟩

def target46 : Weights.Entry :=
  { word := [8, 0, 1, 12, 8, 4, 2], weights := [1, 0, 0, 1] }

def points46 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 4174, representative 2123.
def source47 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B016.Data.entryAt ⟨62, by decide +kernel⟩

def target47 : Weights.Entry :=
  { word := [8, 0, 1, 12, 8, 4, 4], weights := [1, 0, 1, 0] }

def points47 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 5), (4, 4), (5, 6), (6, 3)]

-- Period 7, original row 4305, representative 2152.
def source48 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B016.Data.entryAt ⟨91, by decide +kernel⟩

def target48 : Weights.Entry :=
  { word := [8, 0, 4, 10, 8, 4, 4], weights := [0, 1, 1, 1] }

def points48 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 4364, representative 2160.
def source49 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B016.Data.entryAt ⟨99, by decide +kernel⟩

def target49 : Weights.Entry :=
  { word := [8, 0, 8, 9, 4, 4, 4], weights := [1, 0, 1, 1] }

def points49 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 4368, representative 2155.
def source50 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B016.Data.entryAt ⟨94, by decide +kernel⟩

def target50 : Weights.Entry :=
  { word := [8, 0, 8, 9, 12, 4, 4], weights := [1, 0, 1, 1] }

def points50 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 4461, representative 2159.
def source51 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B016.Data.entryAt ⟨98, by decide +kernel⟩

def target51 : Weights.Entry :=
  { word := [8, 0, 12, 10, 0, 4, 2], weights := [1, 0, 1, 1] }

def points51 : List (ℕ × ℕ) := [(0, 2), (1, 0), (2, 1), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 4462, representative 2159.
def source52 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B016.Data.entryAt ⟨98, by decide +kernel⟩

def target52 : Weights.Entry :=
  { word := [8, 0, 12, 10, 0, 4, 4], weights := [1, 0, 1, 1] }

def points52 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 4481, representative 2150.
def source53 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B016.Data.entryAt ⟨89, by decide +kernel⟩

def target53 : Weights.Entry :=
  { word := [8, 0, 12, 10, 8, 4, 4], weights := [0, 1, 1, 1] }

def points53 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 4667, representative 2080.
def source54 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B016.Data.entryAt ⟨19, by decide +kernel⟩

def target54 : Weights.Entry :=
  { word := [8, 2, 0, 1, 0, 12, 0], weights := [0, 3, 1, 0] }

def points54 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 5), (4, 6), (5, 4), (6, 3)]

-- Period 7, original row 4670, representative 2151.
def source55 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B016.Data.entryAt ⟨90, by decide +kernel⟩

def target55 : Weights.Entry :=
  { word := [8, 2, 0, 1, 8, 2, 2], weights := [0, 1, 0, 0] }

def points55 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 4677, representative 2146.
def source56 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B016.Data.entryAt ⟨85, by decide +kernel⟩

def target56 : Weights.Entry :=
  { word := [8, 2, 0, 1, 8, 10, 2], weights := [0, 1, 0, 0] }

def points56 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 4681, representative 2080.
def source57 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B016.Data.entryAt ⟨19, by decide +kernel⟩

def target57 : Weights.Entry :=
  { word := [8, 2, 0, 2, 0, 8, 1], weights := [0, 3, 0, 1] }

def points57 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 4684, representative 2145.
def source58 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B016.Data.entryAt ⟨84, by decide +kernel⟩

def target58 : Weights.Entry :=
  { word := [8, 2, 0, 6, 0, 4, 8], weights := [1, 1, 1, 1] }

-- Period 7, original row 4685, representative 2065.
def source59 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B016.Data.entryAt ⟨4, by decide +kernel⟩

def target59 : Weights.Entry :=
  { word := [8, 2, 0, 6, 0, 12, 8], weights := [1, 1, 1, 1] }

-- Period 7, original row 4686, representative 2130.
def source60 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B016.Data.entryAt ⟨69, by decide +kernel⟩

def target60 : Weights.Entry :=
  { word := [8, 2, 0, 6, 8, 4, 8], weights := [1, 1, 1, 1] }

-- Period 7, original row 4690, representative 2079.
def source61 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B016.Data.entryAt ⟨18, by decide +kernel⟩

def target61 : Weights.Entry :=
  { word := [8, 2, 0, 8, 1, 4, 8], weights := [0, 1, 1, 0] }

-- Period 7, original row 4700, representative 2128.
def source62 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B016.Data.entryAt ⟨67, by decide +kernel⟩

def target62 : Weights.Entry :=
  { word := [8, 2, 0, 9, 0, 4, 0], weights := [0, 0, 1, 0] }

def points62 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 4), (4, 6), (5, 5), (6, 3)]

-- Period 7, original row 4701, representative 2079.
def source63 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B016.Data.entryAt ⟨18, by decide +kernel⟩

def target63 : Weights.Entry :=
  { word := [8, 2, 0, 9, 0, 4, 8], weights := [0, 1, 1, 0] }

def points63 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 6), (4, 4), (5, 5), (6, 3)]

-- Period 7, original row 4703, representative 2091.
def source64 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B016.Data.entryAt ⟨30, by decide +kernel⟩

def target64 : Weights.Entry :=
  { word := [8, 2, 0, 9, 0, 12, 0], weights := [0, 1, 1, 0] }

def points64 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 5), (4, 6), (5, 4), (6, 3)]

-- Period 7, original row 4704, representative 2063.
def source65 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B016.Data.entryAt ⟨2, by decide +kernel⟩

def target65 : Weights.Entry :=
  { word := [8, 2, 0, 9, 0, 12, 8], weights := [0, 1, 1, 0] }

-- Period 7, original row 4707, representative 2152.
def source66 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B016.Data.entryAt ⟨91, by decide +kernel⟩

def target66 : Weights.Entry :=
  { word := [8, 2, 0, 9, 8, 2, 2], weights := [0, 1, 1, 1] }

def points66 : List (ℕ × ℕ) := [(0, 1), (1, 2), (2, 0), (3, 4), (4, 6), (5, 5), (6, 3)]

-- Period 7, original row 4717, representative 2147.
def source67 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B016.Data.entryAt ⟨86, by decide +kernel⟩

def target67 : Weights.Entry :=
  { word := [8, 2, 0, 9, 8, 10, 2], weights := [0, 1, 0, 0] }

def points67 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 4722, representative 2128.
def source68 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B016.Data.entryAt ⟨67, by decide +kernel⟩

def target68 : Weights.Entry :=
  { word := [8, 2, 0, 10, 0, 0, 1], weights := [0, 0, 0, 1] }

def points68 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 4), (4, 5), (5, 6), (6, 3)]

-- Period 7, original row 4723, representative 2128.
def source69 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B016.Data.entryAt ⟨67, by decide +kernel⟩

def target69 : Weights.Entry :=
  { word := [8, 2, 0, 10, 0, 0, 2], weights := [0, 0, 0, 1] }

def points69 : List (ℕ × ℕ) := [(0, 0), (1, 2), (2, 1), (3, 4), (4, 5), (5, 6), (6, 3)]

-- Period 7, original row 4730, representative 2091.
def source70 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B016.Data.entryAt ⟨30, by decide +kernel⟩

def target70 : Weights.Entry :=
  { word := [8, 2, 0, 10, 0, 8, 1], weights := [0, 1, 0, 1] }

def points70 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 4749, representative 2156.
def source71 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B016.Data.entryAt ⟨95, by decide +kernel⟩

def target71 : Weights.Entry :=
  { word := [8, 2, 0, 12, 10, 0, 1], weights := [1, 1, 0, 1] }

def points71 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 4750, representative 2156.
def source72 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B016.Data.entryAt ⟨95, by decide +kernel⟩

def target72 : Weights.Entry :=
  { word := [8, 2, 0, 12, 10, 0, 2], weights := [1, 1, 0, 1] }

def points72 : List (ℕ × ℕ) := [(0, 1), (1, 2), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 4756, representative 2156.
def source73 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B016.Data.entryAt ⟨95, by decide +kernel⟩

def target73 : Weights.Entry :=
  { word := [8, 2, 0, 12, 12, 4, 0], weights := [1, 1, 1, 0] }

def points73 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 5), (4, 6), (5, 4), (6, 3)]

-- Period 7, original row 4762, representative 2085.
def source74 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B016.Data.entryAt ⟨24, by decide +kernel⟩

def target74 : Weights.Entry :=
  { word := [8, 2, 2, 2, 0, 8, 1], weights := [1, 0, 0, 1] }

def points74 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 4763, representative 2096.
def source75 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B016.Data.entryAt ⟨35, by decide +kernel⟩

def target75 : Weights.Entry :=
  { word := [8, 2, 2, 2, 0, 8, 2], weights := [1, 0, 0, 1] }

def points75 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 4773, representative 2120.
def source76 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B016.Data.entryAt ⟨59, by decide +kernel⟩

def target76 : Weights.Entry :=
  { word := [8, 2, 2, 2, 8, 0, 1], weights := [1, 0, 0, 1] }

def points76 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 4774, representative 2112.
def source77 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B016.Data.entryAt ⟨51, by decide +kernel⟩

def target77 : Weights.Entry :=
  { word := [8, 2, 2, 2, 8, 0, 2], weights := [1, 1, 0, 0] }

def points77 : List (ℕ × ℕ) := [(0, 1), (1, 2), (2, 0), (3, 4), (4, 6), (5, 5), (6, 3)]

-- Period 7, original row 4785, representative 2081.
def source78 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B016.Data.entryAt ⟨20, by decide +kernel⟩

def target78 : Weights.Entry :=
  { word := [8, 2, 2, 2, 8, 8, 1], weights := [1, 0, 0, 1] }

def points78 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 4786, representative 2092.
def source79 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B016.Data.entryAt ⟨31, by decide +kernel⟩

def target79 : Weights.Entry :=
  { word := [8, 2, 2, 2, 8, 8, 2], weights := [1, 0, 0, 1] }

def points79 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 4801, representative 2088.
def source80 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B016.Data.entryAt ⟨27, by decide +kernel⟩

def target80 : Weights.Entry :=
  { word := [8, 2, 2, 10, 0, 8, 1], weights := [1, 0, 0, 1] }

def points80 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 4802, representative 2099.
def source81 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B016.Data.entryAt ⟨38, by decide +kernel⟩

def target81 : Weights.Entry :=
  { word := [8, 2, 2, 10, 0, 8, 2], weights := [1, 0, 0, 1] }

def points81 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 4812, representative 2078.
def source82 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B016.Data.entryAt ⟨17, by decide +kernel⟩

def target82 : Weights.Entry :=
  { word := [8, 2, 2, 10, 0, 12, 0], weights := [0, 1, 1, 0] }

def points82 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 4813, representative 2123.
def source83 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B016.Data.entryAt ⟨62, by decide +kernel⟩

def target83 : Weights.Entry :=
  { word := [8, 2, 2, 10, 8, 0, 1], weights := [1, 0, 0, 1] }

def points83 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 4814, representative 2119.
def source84 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B016.Data.entryAt ⟨58, by decide +kernel⟩

def target84 : Weights.Entry :=
  { word := [8, 2, 2, 10, 8, 0, 2], weights := [1, 1, 0, 0] }

def points84 : List (ℕ × ℕ) := [(0, 1), (1, 2), (2, 0), (3, 4), (4, 6), (5, 5), (6, 3)]

-- Period 7, original row 4826, representative 2076.
def source85 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B016.Data.entryAt ⟨15, by decide +kernel⟩

def target85 : Weights.Entry :=
  { word := [8, 2, 2, 10, 8, 4, 8], weights := [0, 1, 1, 0] }

-- Period 7, original row 4830, representative 2084.
def source86 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B016.Data.entryAt ⟨23, by decide +kernel⟩

def target86 : Weights.Entry :=
  { word := [8, 2, 2, 10, 8, 8, 1], weights := [1, 0, 0, 1] }

def points86 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 4831, representative 2095.
def source87 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B016.Data.entryAt ⟨34, by decide +kernel⟩

def target87 : Weights.Entry :=
  { word := [8, 2, 2, 10, 8, 8, 2], weights := [1, 0, 0, 1] }

def points87 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 4841, representative 2077.
def source88 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B016.Data.entryAt ⟨16, by decide +kernel⟩

def target88 : Weights.Entry :=
  { word := [8, 2, 2, 10, 8, 12, 0], weights := [0, 1, 1, 0] }

def points88 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 4852, representative 2089.
def source89 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B016.Data.entryAt ⟨28, by decide +kernel⟩

def target89 : Weights.Entry :=
  { word := [8, 2, 8, 2, 0, 8, 1], weights := [0, 1, 0, 1] }

def points89 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 4853, representative 2100.
def source90 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B016.Data.entryAt ⟨39, by decide +kernel⟩

def target90 : Weights.Entry :=
  { word := [8, 2, 8, 2, 0, 8, 2], weights := [0, 1, 0, 1] }

def points90 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 4865, representative 2141.
def source91 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B016.Data.entryAt ⟨80, by decide +kernel⟩

def target91 : Weights.Entry :=
  { word := [8, 2, 8, 2, 8, 6, 0], weights := [0, 1, 0, 0] }

def points91 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 4871, representative 2139.
def source92 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B016.Data.entryAt ⟨78, by decide +kernel⟩

def target92 : Weights.Entry :=
  { word := [8, 2, 8, 4, 4, 4, 0], weights := [1, 0, 1, 0] }

def points92 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 4872, representative 2135.
def source93 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B016.Data.entryAt ⟨74, by decide +kernel⟩

def target93 : Weights.Entry :=
  { word := [8, 2, 8, 4, 4, 12, 0], weights := [1, 0, 1, 0] }

def points93 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 4873, representative 2137.
def source94 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B016.Data.entryAt ⟨76, by decide +kernel⟩

def target94 : Weights.Entry :=
  { word := [8, 2, 8, 4, 12, 4, 0], weights := [1, 0, 1, 0] }

def points94 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 4874, representative 2133.
def source95 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B016.Data.entryAt ⟨72, by decide +kernel⟩

def target95 : Weights.Entry :=
  { word := [8, 2, 8, 4, 12, 12, 0], weights := [1, 0, 1, 0] }

def points95 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 4875, representative 2130.
def source96 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B016.Data.entryAt ⟨69, by decide +kernel⟩

def target96 : Weights.Entry :=
  { word := [8, 2, 8, 6, 0, 4, 8], weights := [1, 1, 1, 1] }

def points96 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 4876, representative 2064.
def source97 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B016.Data.entryAt ⟨3, by decide +kernel⟩

def target97 : Weights.Entry :=
  { word := [8, 2, 8, 6, 0, 12, 8], weights := [1, 0, 1, 1] }

-- Period 7, original row 4877, representative 2129.
def source98 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B016.Data.entryAt ⟨68, by decide +kernel⟩

def target98 : Weights.Entry :=
  { word := [8, 2, 8, 6, 8, 4, 8], weights := [0, 1, 1, 0] }

-- Period 7, original row 4880, representative 2132.
def source99 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B016.Data.entryAt ⟨71, by decide +kernel⟩

def target99 : Weights.Entry :=
  { word := [8, 2, 8, 8, 4, 6, 0], weights := [0, 1, 1, 0] }

def points99 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 4884, representative 2131.
def source100 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B016.Data.entryAt ⟨70, by decide +kernel⟩

def target100 : Weights.Entry :=
  { word := [8, 2, 8, 8, 12, 6, 0], weights := [0, 1, 1, 0] }

def points100 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 4891, representative 2143.
def source101 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B016.Data.entryAt ⟨82, by decide +kernel⟩

def target101 : Weights.Entry :=
  { word := [8, 2, 8, 10, 0, 6, 0], weights := [0, 1, 1, 0] }

def points101 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 4893, representative 2090.
def source102 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B016.Data.entryAt ⟨29, by decide +kernel⟩

def target102 : Weights.Entry :=
  { word := [8, 2, 8, 10, 0, 8, 1], weights := [0, 1, 0, 1] }

def points102 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 4894, representative 2101.
def source103 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B016.Data.entryAt ⟨40, by decide +kernel⟩

def target103 : Weights.Entry :=
  { word := [8, 2, 8, 10, 0, 8, 2], weights := [0, 1, 0, 1] }

def points103 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 4904, representative 2144.
def source104 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B016.Data.entryAt ⟨83, by decide +kernel⟩

def target104 : Weights.Entry :=
  { word := [8, 2, 8, 10, 0, 12, 0], weights := [0, 1, 1, 0] }

def points104 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 4909, representative 2142.
def source105 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B016.Data.entryAt ⟨81, by decide +kernel⟩

def target105 : Weights.Entry :=
  { word := [8, 2, 8, 10, 8, 6, 0], weights := [0, 1, 0, 0] }

def points105 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 4917, representative 2140.
def source106 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B016.Data.entryAt ⟨79, by decide +kernel⟩

def target106 : Weights.Entry :=
  { word := [8, 2, 8, 12, 4, 4, 0], weights := [0, 1, 1, 0] }

def points106 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 4918, representative 2076.
def source107 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B016.Data.entryAt ⟨15, by decide +kernel⟩

def target107 : Weights.Entry :=
  { word := [8, 2, 8, 12, 4, 4, 8], weights := [0, 1, 1, 0] }

def points107 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 4919, representative 2136.
def source108 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B016.Data.entryAt ⟨75, by decide +kernel⟩

def target108 : Weights.Entry :=
  { word := [8, 2, 8, 12, 4, 12, 0], weights := [0, 1, 1, 0] }

def points108 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 4921, representative 2138.
def source109 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B016.Data.entryAt ⟨77, by decide +kernel⟩

def target109 : Weights.Entry :=
  { word := [8, 2, 8, 12, 12, 4, 0], weights := [0, 1, 1, 0] }

def points109 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 4922, representative 2072.
def source110 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B016.Data.entryAt ⟨11, by decide +kernel⟩

def target110 : Weights.Entry :=
  { word := [8, 2, 8, 12, 12, 4, 8], weights := [0, 1, 1, 0] }

-- Period 7, original row 4923, representative 2134.
def source111 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B016.Data.entryAt ⟨73, by decide +kernel⟩

def target111 : Weights.Entry :=
  { word := [8, 2, 8, 12, 12, 12, 0], weights := [0, 1, 1, 0] }

def points111 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 4930, representative 2086.
def source112 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B016.Data.entryAt ⟨25, by decide +kernel⟩

def target112 : Weights.Entry :=
  { word := [8, 2, 10, 2, 0, 8, 1], weights := [1, 0, 0, 1] }

def points112 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 4931, representative 2097.
def source113 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B016.Data.entryAt ⟨36, by decide +kernel⟩

def target113 : Weights.Entry :=
  { word := [8, 2, 10, 2, 0, 8, 2], weights := [1, 0, 0, 1] }

def points113 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 4946, representative 2082.
def source114 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B016.Data.entryAt ⟨21, by decide +kernel⟩

def target114 : Weights.Entry :=
  { word := [8, 2, 10, 2, 8, 8, 1], weights := [1, 0, 0, 1] }

def points114 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 4947, representative 2093.
def source115 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B016.Data.entryAt ⟨32, by decide +kernel⟩

def target115 : Weights.Entry :=
  { word := [8, 2, 10, 2, 8, 8, 2], weights := [1, 0, 0, 1] }

def points115 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 4957, representative 2073.
def source116 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B016.Data.entryAt ⟨12, by decide +kernel⟩

def target116 : Weights.Entry :=
  { word := [8, 2, 10, 2, 8, 12, 0], weights := [1, 2, 0, 1] }

def points116 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 4963, representative 2087.
def source117 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B016.Data.entryAt ⟨26, by decide +kernel⟩

def target117 : Weights.Entry :=
  { word := [8, 2, 10, 10, 0, 8, 1], weights := [1, 0, 0, 1] }

def points117 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 4964, representative 2098.
def source118 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B016.Data.entryAt ⟨37, by decide +kernel⟩

def target118 : Weights.Entry :=
  { word := [8, 2, 10, 10, 0, 8, 2], weights := [1, 0, 0, 1] }

def points118 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 4974, representative 2075.
def source119 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B016.Data.entryAt ⟨14, by decide +kernel⟩

def target119 : Weights.Entry :=
  { word := [8, 2, 10, 10, 0, 12, 0], weights := [0, 1, 1, 0] }

def points119 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 4981, representative 2072.
def source120 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B016.Data.entryAt ⟨11, by decide +kernel⟩

def target120 : Weights.Entry :=
  { word := [8, 2, 10, 10, 8, 4, 8], weights := [0, 1, 1, 0] }

def points120 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 4985, representative 2083.
def source121 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B016.Data.entryAt ⟨22, by decide +kernel⟩

def target121 : Weights.Entry :=
  { word := [8, 2, 10, 10, 8, 8, 1], weights := [1, 0, 0, 1] }

def points121 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 4986, representative 2094.
def source122 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B016.Data.entryAt ⟨33, by decide +kernel⟩

def target122 : Weights.Entry :=
  { word := [8, 2, 10, 10, 8, 8, 2], weights := [1, 0, 0, 1] }

def points122 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 4996, representative 2074.
def source123 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B016.Data.entryAt ⟨13, by decide +kernel⟩

def target123 : Weights.Entry :=
  { word := [8, 2, 10, 10, 8, 12, 0], weights := [0, 1, 1, 0] }

def points123 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 5016, representative 2102.
def source124 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B016.Data.entryAt ⟨41, by decide +kernel⟩

def target124 : Weights.Entry :=
  { word := [8, 4, 0, 4, 8, 4, 2], weights := [1, 0, 1, 0] }

def points124 : List (ℕ × ℕ) := [(0, 1), (1, 2), (2, 0), (3, 5), (4, 6), (5, 4), (6, 3)]

-- Period 7, original row 5017, representative 2112.
def source125 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B016.Data.entryAt ⟨51, by decide +kernel⟩

def target125 : Weights.Entry :=
  { word := [8, 4, 0, 4, 8, 4, 4], weights := [1, 0, 0, 1] }

def points125 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 5052, representative 2109.
def source126 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B016.Data.entryAt ⟨48, by decide +kernel⟩

def target126 : Weights.Entry :=
  { word := [8, 4, 0, 12, 8, 4, 2], weights := [1, 0, 1, 0] }

def points126 : List (ℕ × ℕ) := [(0, 1), (1, 2), (2, 0), (3, 5), (4, 6), (5, 4), (6, 3)]

-- Period 7, original row 5053, representative 2119.
def source127 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B016.Data.entryAt ⟨58, by decide +kernel⟩

def target127 : Weights.Entry :=
  { word := [8, 4, 0, 12, 8, 4, 4], weights := [1, 0, 0, 1] }

def points127 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

def period7Entries : List Weights.Entry := [target0, target1, target2, target3, target4, target5, target6, target7, target8, target9, target10, target11, target12, target13, target14, target15, target16, target17, target18, target19, target20, target21, target22, target23, target24, target25, target26, target27, target28, target29, target30, target31, target32, target33, target34, target35, target36, target37, target38, target39, target40, target41, target42, target43, target44, target45, target46, target47, target48, target49, target50, target51, target52, target53, target54, target55, target56, target57, target58, target59, target60, target61, target62, target63, target64, target65, target66, target67, target68, target69, target70, target71, target72, target73, target74, target75, target76, target77, target78, target79, target80, target81, target82, target83, target84, target85, target86, target87, target88, target89, target90, target91, target92, target93, target94, target95, target96, target97, target98, target99, target100, target101, target102, target103, target104, target105, target106, target107, target108, target109, target110, target111, target112, target113, target114, target115, target116, target117, target118, target119, target120, target121, target122, target123, target124, target125, target126, target127]

def period7Chunk : RowCoverage.Chunk where
  rows := [⟨3612, target0⟩, ⟨3617, target1⟩, ⟨3622, target2⟩, ⟨3624, target3⟩, ⟨3626, target4⟩, ⟨3630, target5⟩, ⟨3642, target6⟩, ⟨3644, target7⟩, ⟨3650, target8⟩, ⟨3655, target9⟩, ⟨3657, target10⟩, ⟨3660, target11⟩, ⟨3666, target12⟩, ⟨3681, target13⟩, ⟨3682, target14⟩, ⟨3685, target15⟩, ⟨3690, target16⟩, ⟨3697, target17⟩, ⟨3706, target18⟩, ⟨3736, target19⟩, ⟨3743, target20⟩, ⟨3762, target21⟩, ⟨3780, target22⟩, ⟨3786, target23⟩, ⟨3805, target24⟩, ⟨3882, target25⟩, ⟨3883, target26⟩, ⟨3890, target27⟩, ⟨3891, target28⟩, ⟨3893, target29⟩, ⟨3898, target30⟩, ⟨3904, target31⟩, ⟨3905, target32⟩, ⟨3911, target33⟩, ⟨3912, target34⟩, ⟨4046, target35⟩, ⟨4047, target36⟩, ⟨4050, target37⟩, ⟨4055, target38⟩, ⟨4062, target39⟩, ⟨4071, target40⟩, ⟨4109, target41⟩, ⟨4115, target42⟩, ⟨4116, target43⟩, ⟨4137, target44⟩, ⟨4138, target45⟩, ⟨4173, target46⟩, ⟨4174, target47⟩, ⟨4305, target48⟩, ⟨4364, target49⟩, ⟨4368, target50⟩, ⟨4461, target51⟩, ⟨4462, target52⟩, ⟨4481, target53⟩, ⟨4667, target54⟩, ⟨4670, target55⟩, ⟨4677, target56⟩, ⟨4681, target57⟩, ⟨4684, target58⟩, ⟨4685, target59⟩, ⟨4686, target60⟩, ⟨4690, target61⟩, ⟨4700, target62⟩, ⟨4701, target63⟩, ⟨4703, target64⟩, ⟨4704, target65⟩, ⟨4707, target66⟩, ⟨4717, target67⟩, ⟨4722, target68⟩, ⟨4723, target69⟩, ⟨4730, target70⟩, ⟨4749, target71⟩, ⟨4750, target72⟩, ⟨4756, target73⟩, ⟨4762, target74⟩, ⟨4763, target75⟩, ⟨4773, target76⟩, ⟨4774, target77⟩, ⟨4785, target78⟩, ⟨4786, target79⟩, ⟨4801, target80⟩, ⟨4802, target81⟩, ⟨4812, target82⟩, ⟨4813, target83⟩, ⟨4814, target84⟩, ⟨4826, target85⟩, ⟨4830, target86⟩, ⟨4831, target87⟩, ⟨4841, target88⟩, ⟨4852, target89⟩, ⟨4853, target90⟩, ⟨4865, target91⟩, ⟨4871, target92⟩, ⟨4872, target93⟩, ⟨4873, target94⟩, ⟨4874, target95⟩, ⟨4875, target96⟩, ⟨4876, target97⟩, ⟨4877, target98⟩, ⟨4880, target99⟩, ⟨4884, target100⟩, ⟨4891, target101⟩, ⟨4893, target102⟩, ⟨4894, target103⟩, ⟨4904, target104⟩, ⟨4909, target105⟩, ⟨4917, target106⟩, ⟨4918, target107⟩, ⟨4919, target108⟩, ⟨4921, target109⟩, ⟨4922, target110⟩, ⟨4923, target111⟩, ⟨4930, target112⟩, ⟨4931, target113⟩, ⟨4946, target114⟩, ⟨4947, target115⟩, ⟨4957, target116⟩, ⟨4963, target117⟩, ⟨4964, target118⟩, ⟨4974, target119⟩, ⟨4981, target120⟩, ⟨4985, target121⟩, ⟨4986, target122⟩, ⟨4996, target123⟩, ⟨5016, target124⟩, ⟨5017, target125⟩, ⟨5052, target126⟩, ⟨5053, target127⟩]
  indexMask := 1908355799912639089774009006477670486902314117929742687907135582021511044724277460200882319232617057282700470105775188310420437563671159850248721278370404313043321255857467221272325118361847615779246803252439245819002151223367192883531117221568504122132543450138037078375030644388438856762889895856424254726802545784263899172017469255895389308902900219766877950269965545637715974912747053034825670746408538022312124268220505897718528872618692736554629593792677273791508437777872465763859307873862508631234973911022525508638697569252448179417676785922704965721000151064352564954398874997763116213751697464789430807408339907795168113330792963498456841503963854951856380876986116574883874736174364339244695692632884705144746414054630403660728530658062423538526914945657877220516894171481189698264616165974570807852932557668278699496391932809853300335904248301117282302887901961750973096295140209501538776234765239961811043155489929471497818373970400355520637349510348345620728297217196960403721840556464076883146130977822791697057185028369258741726768547573457417197424452552919377425910400425711489469398071271495667821867044776049143760240093985228804300291494013971773030067400180788879779240949340781091732505706244640838797709067579239063064614164414707564468319379828913543590112368978770444086864297814759775683951070156817267853438032828492100325043485685144924497998569595466883880374801893076739842306946063038596292291210465646560029402008480350075554275633046220088663348603666039880266052104661596506286310031360
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

end FranklSmallCyclic.TransportBatches.G016.B001.Data
