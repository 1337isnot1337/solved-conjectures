module

public import Conjectures.FranklSmallCyclicRowCoverage
public import Conjectures.FranklSmallCyclicCanonicalWords
public import Conjectures.FranklSmallCyclicOrbit7Block007Data

/-! 128 literal targets sharing one source proof block.
Original words and row indices are retained; weights may be transported.
-/
@[expose] public section

namespace FranklSmallCyclic.TransportBatches.G007.B001.Data

-- Period 7, original row 3424, representative 922.
def source0 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B007.Data.entryAt ⟨13, by decide +kernel⟩

def target0 : Weights.Entry :=
  { word := [4, 0, 4, 2, 0, 8, 9], weights := [1, 0, 0, 1] }

def points0 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 3426, representative 1000.
def source1 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B007.Data.entryAt ⟨91, by decide +kernel⟩

def target1 : Weights.Entry :=
  { word := [4, 0, 4, 2, 0, 8, 12], weights := [1, 0, 0, 1] }

def points1 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 3434, representative 1001.
def source2 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B007.Data.entryAt ⟨92, by decide +kernel⟩

def target2 : Weights.Entry :=
  { word := [4, 0, 4, 2, 8, 8, 12], weights := [1, 0, 0, 1] }

-- Period 7, original row 3452, representative 925.
def source3 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B007.Data.entryAt ⟨16, by decide +kernel⟩

def target3 : Weights.Entry :=
  { word := [4, 0, 4, 10, 0, 8, 9], weights := [1, 0, 0, 1] }

def points3 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 3454, representative 1007.
def source4 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B007.Data.entryAt ⟨98, by decide +kernel⟩

def target4 : Weights.Entry :=
  { word := [4, 0, 4, 10, 0, 8, 12], weights := [1, 0, 0, 1] }

def points4 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 3466, representative 1004.
def source5 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B007.Data.entryAt ⟨95, by decide +kernel⟩

def target5 : Weights.Entry :=
  { word := [4, 0, 4, 10, 8, 8, 12], weights := [1, 0, 0, 1] }

-- Period 7, original row 3513, representative 923.
def source6 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B007.Data.entryAt ⟨14, by decide +kernel⟩

def target6 : Weights.Entry :=
  { word := [4, 0, 12, 2, 0, 8, 9], weights := [1, 0, 0, 1] }

def points6 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 3515, representative 1005.
def source7 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B007.Data.entryAt ⟨96, by decide +kernel⟩

def target7 : Weights.Entry :=
  { word := [4, 0, 12, 2, 0, 8, 12], weights := [1, 0, 0, 1] }

def points7 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 3523, representative 1002.
def source8 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B007.Data.entryAt ⟨93, by decide +kernel⟩

def target8 : Weights.Entry :=
  { word := [4, 0, 12, 2, 8, 8, 12], weights := [1, 0, 0, 1] }

-- Period 7, original row 3545, representative 924.
def source9 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B007.Data.entryAt ⟨15, by decide +kernel⟩

def target9 : Weights.Entry :=
  { word := [4, 0, 12, 10, 0, 8, 9], weights := [1, 0, 0, 1] }

def points9 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 3547, representative 1006.
def source10 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B007.Data.entryAt ⟨97, by decide +kernel⟩

def target10 : Weights.Entry :=
  { word := [4, 0, 12, 10, 0, 8, 12], weights := [1, 0, 0, 1] }

def points10 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 3559, representative 1003.
def source11 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B007.Data.entryAt ⟨94, by decide +kernel⟩

def target11 : Weights.Entry :=
  { word := [4, 0, 12, 10, 8, 8, 12], weights := [1, 0, 0, 1] }

-- Period 7, original row 3727, representative 1030.
def source12 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B007.Data.entryAt ⟨121, by decide +kernel⟩

def target12 : Weights.Entry :=
  { word := [4, 8, 0, 4, 2, 0, 9], weights := [1, 0, 1, 0] }

def points12 : List (ℕ × ℕ) := [(0, 0), (1, 2), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 3729, representative 1013.
def source13 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B007.Data.entryAt ⟨104, by decide +kernel⟩

def target13 : Weights.Entry :=
  { word := [4, 8, 0, 4, 2, 0, 12], weights := [1, 0, 0, 1] }

def points13 : List (ℕ × ℕ) := [(0, 0), (1, 2), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 3734, representative 974.
def source14 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B007.Data.entryAt ⟨65, by decide +kernel⟩

def target14 : Weights.Entry :=
  { word := [4, 8, 0, 4, 2, 8, 12], weights := [1, 0, 0, 1] }

-- Period 7, original row 3753, representative 1031.
def source15 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B007.Data.entryAt ⟨122, by decide +kernel⟩

def target15 : Weights.Entry :=
  { word := [4, 8, 0, 4, 10, 0, 9], weights := [1, 0, 1, 0] }

def points15 : List (ℕ × ℕ) := [(0, 0), (1, 2), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 3755, representative 1014.
def source16 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B007.Data.entryAt ⟨105, by decide +kernel⟩

def target16 : Weights.Entry :=
  { word := [4, 8, 0, 4, 10, 0, 12], weights := [1, 0, 0, 1] }

def points16 : List (ℕ × ℕ) := [(0, 0), (1, 2), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 3760, representative 975.
def source17 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B007.Data.entryAt ⟨66, by decide +kernel⟩

def target17 : Weights.Entry :=
  { word := [4, 8, 0, 4, 10, 8, 12], weights := [1, 0, 0, 1] }

-- Period 7, original row 3773, representative 1020.
def source18 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B007.Data.entryAt ⟨111, by decide +kernel⟩

def target18 : Weights.Entry :=
  { word := [4, 8, 0, 12, 2, 0, 12], weights := [1, 0, 1, 0] }

def points18 : List (ℕ × ℕ) := [(0, 0), (1, 2), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 3778, representative 977.
def source19 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B007.Data.entryAt ⟨68, by decide +kernel⟩

def target19 : Weights.Entry :=
  { word := [4, 8, 0, 12, 2, 8, 12], weights := [1, 0, 1, 0] }

-- Period 7, original row 3796, representative 1034.
def source20 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B007.Data.entryAt ⟨125, by decide +kernel⟩

def target20 : Weights.Entry :=
  { word := [4, 8, 0, 12, 10, 0, 9], weights := [1, 0, 1, 0] }

def points20 : List (ℕ × ℕ) := [(0, 0), (1, 2), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 3798, representative 1017.
def source21 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B007.Data.entryAt ⟨108, by decide +kernel⟩

def target21 : Weights.Entry :=
  { word := [4, 8, 0, 12, 10, 0, 12], weights := [1, 0, 1, 0] }

def points21 : List (ℕ × ℕ) := [(0, 0), (1, 2), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 3803, representative 976.
def source22 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B007.Data.entryAt ⟨67, by decide +kernel⟩

def target22 : Weights.Entry :=
  { word := [4, 8, 0, 12, 10, 8, 12], weights := [1, 0, 1, 0] }

-- Period 7, original row 3815, representative 918.
def source23 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B007.Data.entryAt ⟨9, by decide +kernel⟩

def target23 : Weights.Entry :=
  { word := [4, 8, 4, 2, 0, 8, 9], weights := [1, 0, 0, 1] }

-- Period 7, original row 3817, representative 992.
def source24 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B007.Data.entryAt ⟨83, by decide +kernel⟩

def target24 : Weights.Entry :=
  { word := [4, 8, 4, 2, 0, 8, 12], weights := [1, 0, 0, 1] }

-- Period 7, original row 3825, representative 993.
def source25 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B007.Data.entryAt ⟨84, by decide +kernel⟩

def target25 : Weights.Entry :=
  { word := [4, 8, 4, 2, 8, 8, 12], weights := [1, 0, 0, 1] }

-- Period 7, original row 3850, representative 921.
def source26 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B007.Data.entryAt ⟨12, by decide +kernel⟩

def target26 : Weights.Entry :=
  { word := [4, 8, 4, 10, 0, 8, 9], weights := [1, 0, 0, 1] }

-- Period 7, original row 3852, representative 999.
def source27 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B007.Data.entryAt ⟨90, by decide +kernel⟩

def target27 : Weights.Entry :=
  { word := [4, 8, 4, 10, 0, 8, 12], weights := [1, 0, 0, 1] }

-- Period 7, original row 3859, representative 996.
def source28 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B007.Data.entryAt ⟨87, by decide +kernel⟩

def target28 : Weights.Entry :=
  { word := [4, 8, 4, 10, 8, 8, 12], weights := [1, 0, 0, 1] }

-- Period 7, original row 3923, representative 919.
def source29 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B007.Data.entryAt ⟨10, by decide +kernel⟩

def target29 : Weights.Entry :=
  { word := [4, 8, 12, 2, 0, 8, 9], weights := [1, 0, 0, 1] }

-- Period 7, original row 3925, representative 997.
def source30 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B007.Data.entryAt ⟨88, by decide +kernel⟩

def target30 : Weights.Entry :=
  { word := [4, 8, 12, 2, 0, 8, 12], weights := [1, 0, 0, 1] }

-- Period 7, original row 3933, representative 994.
def source31 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B007.Data.entryAt ⟨85, by decide +kernel⟩

def target31 : Weights.Entry :=
  { word := [4, 8, 12, 2, 8, 8, 12], weights := [1, 0, 0, 1] }

-- Period 7, original row 3958, representative 920.
def source32 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B007.Data.entryAt ⟨11, by decide +kernel⟩

def target32 : Weights.Entry :=
  { word := [4, 8, 12, 10, 0, 8, 9], weights := [1, 0, 0, 1] }

-- Period 7, original row 3960, representative 998.
def source33 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B007.Data.entryAt ⟨89, by decide +kernel⟩

def target33 : Weights.Entry :=
  { word := [4, 8, 12, 10, 0, 8, 12], weights := [1, 0, 0, 1] }

-- Period 7, original row 3967, representative 995.
def source34 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B007.Data.entryAt ⟨86, by decide +kernel⟩

def target34 : Weights.Entry :=
  { word := [4, 8, 12, 10, 8, 8, 12], weights := [1, 0, 0, 1] }

-- Period 7, original row 4520, representative 1026.
def source35 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B007.Data.entryAt ⟨117, by decide +kernel⟩

def target35 : Weights.Entry :=
  { word := [8, 1, 4, 2, 0, 8, 1], weights := [0, 1, 0, 1] }

def points35 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 4521, representative 1030.
def source36 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B007.Data.entryAt ⟨121, by decide +kernel⟩

def target36 : Weights.Entry :=
  { word := [8, 1, 4, 2, 0, 8, 2], weights := [0, 1, 0, 1] }

def points36 : List (ℕ × ℕ) := [(0, 2), (1, 0), (2, 1), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 4548, representative 1029.
def source37 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B007.Data.entryAt ⟨120, by decide +kernel⟩

def target37 : Weights.Entry :=
  { word := [8, 1, 4, 10, 0, 8, 1], weights := [0, 1, 0, 1] }

def points37 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 4585, representative 1024.
def source38 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B007.Data.entryAt ⟨115, by decide +kernel⟩

def target38 : Weights.Entry :=
  { word := [8, 1, 8, 4, 4, 12, 0], weights := [0, 0, 1, 1] }

def points38 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 4587, representative 1008.
def source39 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B007.Data.entryAt ⟨99, by decide +kernel⟩

def target39 : Weights.Entry :=
  { word := [8, 1, 8, 8, 4, 6, 0], weights := [0, 1, 1, 0] }

def points39 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 4602, representative 1025.
def source40 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B007.Data.entryAt ⟨116, by decide +kernel⟩

def target40 : Weights.Entry :=
  { word := [8, 1, 8, 12, 4, 12, 0], weights := [0, 0, 1, 1] }

def points40 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 4609, representative 1027.
def source41 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B007.Data.entryAt ⟨118, by decide +kernel⟩

def target41 : Weights.Entry :=
  { word := [8, 1, 12, 2, 0, 8, 1], weights := [0, 1, 0, 1] }

def points41 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 4610, representative 1031.
def source42 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B007.Data.entryAt ⟨122, by decide +kernel⟩

def target42 : Weights.Entry :=
  { word := [8, 1, 12, 2, 0, 8, 2], weights := [0, 1, 0, 1] }

def points42 : List (ℕ × ℕ) := [(0, 2), (1, 0), (2, 1), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 4641, representative 1028.
def source43 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B007.Data.entryAt ⟨119, by decide +kernel⟩

def target43 : Weights.Entry :=
  { word := [8, 1, 12, 10, 0, 8, 1], weights := [0, 1, 0, 1] }

def points43 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 4642, representative 1034.
def source44 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B007.Data.entryAt ⟨125, by decide +kernel⟩

def target44 : Weights.Entry :=
  { word := [8, 1, 12, 10, 0, 8, 2], weights := [0, 1, 0, 1] }

def points44 : List (ℕ × ℕ) := [(0, 2), (1, 0), (2, 1), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 5872, representative 922.
def source45 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B007.Data.entryAt ⟨13, by decide +kernel⟩

def target45 : Weights.Entry :=
  { word := [8, 9, 0, 4, 2, 0, 1], weights := [1, 0, 0, 1] }

def points45 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 5873, representative 922.
def source46 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B007.Data.entryAt ⟨13, by decide +kernel⟩

def target46 : Weights.Entry :=
  { word := [8, 9, 0, 4, 2, 0, 2], weights := [1, 0, 0, 1] }

def points46 : List (ℕ × ℕ) := [(0, 1), (1, 2), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 5879, representative 918.
def source47 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B007.Data.entryAt ⟨9, by decide +kernel⟩

def target47 : Weights.Entry :=
  { word := [8, 9, 0, 4, 2, 8, 2], weights := [1, 0, 0, 1] }

def points47 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 5884, representative 922.
def source48 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B007.Data.entryAt ⟨13, by decide +kernel⟩

def target48 : Weights.Entry :=
  { word := [8, 9, 0, 4, 4, 4, 0], weights := [1, 0, 1, 0] }

def points48 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 5), (4, 6), (5, 4), (6, 3)]

-- Period 7, original row 5898, representative 923.
def source49 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B007.Data.entryAt ⟨14, by decide +kernel⟩

def target49 : Weights.Entry :=
  { word := [8, 9, 0, 4, 10, 0, 1], weights := [1, 0, 0, 1] }

def points49 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 5899, representative 923.
def source50 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B007.Data.entryAt ⟨14, by decide +kernel⟩

def target50 : Weights.Entry :=
  { word := [8, 9, 0, 4, 10, 0, 2], weights := [1, 0, 0, 1] }

def points50 : List (ℕ × ℕ) := [(0, 1), (1, 2), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 5905, representative 919.
def source51 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B007.Data.entryAt ⟨10, by decide +kernel⟩

def target51 : Weights.Entry :=
  { word := [8, 9, 0, 4, 10, 8, 2], weights := [1, 0, 0, 1] }

def points51 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 5910, representative 923.
def source52 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B007.Data.entryAt ⟨14, by decide +kernel⟩

def target52 : Weights.Entry :=
  { word := [8, 9, 0, 4, 12, 4, 0], weights := [1, 0, 1, 0] }

def points52 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 5), (4, 6), (5, 4), (6, 3)]

-- Period 7, original row 5932, representative 925.
def source53 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B007.Data.entryAt ⟨16, by decide +kernel⟩

def target53 : Weights.Entry :=
  { word := [8, 9, 0, 12, 2, 0, 1], weights := [1, 0, 0, 1] }

def points53 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 5933, representative 925.
def source54 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B007.Data.entryAt ⟨16, by decide +kernel⟩

def target54 : Weights.Entry :=
  { word := [8, 9, 0, 12, 2, 0, 2], weights := [1, 0, 0, 1] }

def points54 : List (ℕ × ℕ) := [(0, 1), (1, 2), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 5939, representative 921.
def source55 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B007.Data.entryAt ⟨12, by decide +kernel⟩

def target55 : Weights.Entry :=
  { word := [8, 9, 0, 12, 2, 8, 2], weights := [1, 0, 0, 1] }

def points55 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 5944, representative 925.
def source56 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B007.Data.entryAt ⟨16, by decide +kernel⟩

def target56 : Weights.Entry :=
  { word := [8, 9, 0, 12, 4, 4, 0], weights := [1, 0, 1, 0] }

def points56 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 5), (4, 6), (5, 4), (6, 3)]

-- Period 7, original row 5957, representative 924.
def source57 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B007.Data.entryAt ⟨15, by decide +kernel⟩

def target57 : Weights.Entry :=
  { word := [8, 9, 0, 12, 10, 0, 1], weights := [1, 0, 0, 1] }

def points57 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 5958, representative 924.
def source58 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B007.Data.entryAt ⟨15, by decide +kernel⟩

def target58 : Weights.Entry :=
  { word := [8, 9, 0, 12, 10, 0, 2], weights := [1, 0, 0, 1] }

def points58 : List (ℕ × ℕ) := [(0, 1), (1, 2), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 5964, representative 920.
def source59 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B007.Data.entryAt ⟨11, by decide +kernel⟩

def target59 : Weights.Entry :=
  { word := [8, 9, 0, 12, 10, 8, 2], weights := [1, 0, 0, 1] }

def points59 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 5969, representative 924.
def source60 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B007.Data.entryAt ⟨15, by decide +kernel⟩

def target60 : Weights.Entry :=
  { word := [8, 9, 0, 12, 12, 4, 0], weights := [1, 0, 1, 0] }

def points60 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 5), (4, 6), (5, 4), (6, 3)]

-- Period 7, original row 6005, representative 914.
def source61 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B007.Data.entryAt ⟨5, by decide +kernel⟩

def target61 : Weights.Entry :=
  { word := [8, 9, 8, 4, 4, 4, 0], weights := [1, 0, 0, 1] }

def points61 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 6007, representative 910.
def source62 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B007.Data.entryAt ⟨1, by decide +kernel⟩

def target62 : Weights.Entry :=
  { word := [8, 9, 8, 4, 4, 12, 0], weights := [1, 0, 0, 1] }

def points62 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 6013, representative 915.
def source63 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B007.Data.entryAt ⟨6, by decide +kernel⟩

def target63 : Weights.Entry :=
  { word := [8, 9, 8, 4, 12, 4, 0], weights := [1, 0, 0, 1] }

def points63 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 6015, representative 911.
def source64 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B007.Data.entryAt ⟨2, by decide +kernel⟩

def target64 : Weights.Entry :=
  { word := [8, 9, 8, 4, 12, 12, 0], weights := [1, 0, 0, 1] }

def points64 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 6017, representative 909.
def source65 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B007.Data.entryAt ⟨0, by decide +kernel⟩

def target65 : Weights.Entry :=
  { word := [8, 9, 8, 8, 4, 6, 0], weights := [0, 1, 1, 0] }

def points65 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 6035, representative 917.
def source66 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B007.Data.entryAt ⟨8, by decide +kernel⟩

def target66 : Weights.Entry :=
  { word := [8, 9, 8, 12, 4, 4, 0], weights := [0, 1, 1, 0] }

def points66 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 6037, representative 913.
def source67 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B007.Data.entryAt ⟨4, by decide +kernel⟩

def target67 : Weights.Entry :=
  { word := [8, 9, 8, 12, 4, 12, 0], weights := [0, 1, 1, 0] }

def points67 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 6042, representative 916.
def source68 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B007.Data.entryAt ⟨7, by decide +kernel⟩

def target68 : Weights.Entry :=
  { word := [8, 9, 8, 12, 12, 4, 0], weights := [0, 1, 1, 0] }

def points68 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 6044, representative 912.
def source69 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B007.Data.entryAt ⟨3, by decide +kernel⟩

def target69 : Weights.Entry :=
  { word := [8, 9, 8, 12, 12, 12, 0], weights := [0, 1, 1, 0] }

def points69 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 7427, representative 1013.
def source70 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B007.Data.entryAt ⟨104, by decide +kernel⟩

def target70 : Weights.Entry :=
  { word := [10, 0, 4, 2, 0, 8, 2], weights := [1, 0, 0, 1] }

def points70 : List (ℕ × ℕ) := [(0, 2), (1, 0), (2, 1), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 7428, representative 1013.
def source71 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B007.Data.entryAt ⟨104, by decide +kernel⟩

def target71 : Weights.Entry :=
  { word := [10, 0, 4, 2, 0, 8, 4], weights := [1, 0, 0, 1] }

def points71 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 7439, representative 1018.
def source72 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B007.Data.entryAt ⟨109, by decide +kernel⟩

def target72 : Weights.Entry :=
  { word := [10, 0, 4, 2, 8, 8, 4], weights := [1, 0, 0, 1] }

def points72 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 7450, representative 1020.
def source73 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B007.Data.entryAt ⟨111, by decide +kernel⟩

def target73 : Weights.Entry :=
  { word := [10, 0, 4, 10, 0, 8, 2], weights := [0, 1, 0, 1] }

def points73 : List (ℕ × ℕ) := [(0, 2), (1, 0), (2, 1), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 7451, representative 1020.
def source74 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B007.Data.entryAt ⟨111, by decide +kernel⟩

def target74 : Weights.Entry :=
  { word := [10, 0, 4, 10, 0, 8, 4], weights := [0, 1, 0, 1] }

def points74 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 7466, representative 1019.
def source75 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B007.Data.entryAt ⟨110, by decide +kernel⟩

def target75 : Weights.Entry :=
  { word := [10, 0, 4, 10, 8, 8, 4], weights := [0, 1, 0, 1] }

def points75 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 7544, representative 1014.
def source76 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B007.Data.entryAt ⟨105, by decide +kernel⟩

def target76 : Weights.Entry :=
  { word := [10, 0, 12, 2, 0, 8, 2], weights := [1, 0, 0, 1] }

def points76 : List (ℕ × ℕ) := [(0, 2), (1, 0), (2, 1), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 7545, representative 1014.
def source77 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B007.Data.entryAt ⟨105, by decide +kernel⟩

def target77 : Weights.Entry :=
  { word := [10, 0, 12, 2, 0, 8, 4], weights := [1, 0, 0, 1] }

def points77 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 7556, representative 1015.
def source78 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B007.Data.entryAt ⟨106, by decide +kernel⟩

def target78 : Weights.Entry :=
  { word := [10, 0, 12, 2, 8, 8, 4], weights := [1, 0, 0, 1] }

def points78 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 7572, representative 1017.
def source79 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B007.Data.entryAt ⟨108, by decide +kernel⟩

def target79 : Weights.Entry :=
  { word := [10, 0, 12, 10, 0, 8, 2], weights := [0, 1, 0, 1] }

def points79 : List (ℕ × ℕ) := [(0, 2), (1, 0), (2, 1), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 7573, representative 1017.
def source80 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B007.Data.entryAt ⟨108, by decide +kernel⟩

def target80 : Weights.Entry :=
  { word := [10, 0, 12, 10, 0, 8, 4], weights := [0, 1, 0, 1] }

def points80 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 7588, representative 1016.
def source81 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B007.Data.entryAt ⟨107, by decide +kernel⟩

def target81 : Weights.Entry :=
  { word := [10, 0, 12, 10, 8, 8, 4], weights := [0, 1, 0, 1] }

def points81 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 7640, representative 937.
def source82 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B007.Data.entryAt ⟨28, by decide +kernel⟩

def target82 : Weights.Entry :=
  { word := [10, 2, 2, 8, 0, 8, 0], weights := [1, 0, 1, 0] }

def points82 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 7652, representative 931.
def source83 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B007.Data.entryAt ⟨22, by decide +kernel⟩

def target83 : Weights.Entry :=
  { word := [10, 2, 2, 8, 2, 8, 0], weights := [1, 0, 1, 0] }

def points83 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 7654, representative 936.
def source84 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B007.Data.entryAt ⟨27, by decide +kernel⟩

def target84 : Weights.Entry :=
  { word := [10, 2, 2, 8, 8, 8, 0], weights := [1, 0, 1, 0] }

def points84 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 7666, representative 930.
def source85 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B007.Data.entryAt ⟨21, by decide +kernel⟩

def target85 : Weights.Entry :=
  { word := [10, 2, 2, 8, 10, 8, 0], weights := [1, 0, 1, 0] }

def points85 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 7780, representative 935.
def source86 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B007.Data.entryAt ⟨26, by decide +kernel⟩

def target86 : Weights.Entry :=
  { word := [10, 2, 10, 8, 0, 8, 0], weights := [1, 0, 1, 0] }

def points86 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 7792, representative 929.
def source87 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B007.Data.entryAt ⟨20, by decide +kernel⟩

def target87 : Weights.Entry :=
  { word := [10, 2, 10, 8, 2, 8, 0], weights := [1, 0, 1, 0] }

def points87 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 7794, representative 934.
def source88 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B007.Data.entryAt ⟨25, by decide +kernel⟩

def target88 : Weights.Entry :=
  { word := [10, 2, 10, 8, 8, 8, 0], weights := [1, 0, 1, 0] }

def points88 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 7806, representative 928.
def source89 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B007.Data.entryAt ⟨19, by decide +kernel⟩

def target89 : Weights.Entry :=
  { word := [10, 2, 10, 8, 10, 8, 0], weights := [1, 0, 1, 0] }

def points89 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 7820, representative 1000.
def source90 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B007.Data.entryAt ⟨91, by decide +kernel⟩

def target90 : Weights.Entry :=
  { word := [10, 8, 0, 4, 2, 0, 2], weights := [1, 0, 0, 1] }

def points90 : List (ℕ × ℕ) := [(0, 1), (1, 2), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 7821, representative 966.
def source91 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B007.Data.entryAt ⟨57, by decide +kernel⟩

def target91 : Weights.Entry :=
  { word := [10, 8, 0, 4, 2, 0, 4], weights := [1, 0, 0, 1] }

def points91 : List (ℕ × ℕ) := [(0, 1), (1, 2), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 7826, representative 992.
def source92 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B007.Data.entryAt ⟨83, by decide +kernel⟩

def target92 : Weights.Entry :=
  { word := [10, 8, 0, 4, 2, 8, 2], weights := [1, 0, 0, 1] }

def points92 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 7827, representative 954.
def source93 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B007.Data.entryAt ⟨45, by decide +kernel⟩

def target93 : Weights.Entry :=
  { word := [10, 8, 0, 4, 2, 8, 4], weights := [1, 0, 0, 1] }

def points93 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 7846, representative 1005.
def source94 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B007.Data.entryAt ⟨96, by decide +kernel⟩

def target94 : Weights.Entry :=
  { word := [10, 8, 0, 4, 10, 0, 2], weights := [1, 0, 0, 1] }

def points94 : List (ℕ × ℕ) := [(0, 1), (1, 2), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 7847, representative 971.
def source95 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B007.Data.entryAt ⟨62, by decide +kernel⟩

def target95 : Weights.Entry :=
  { word := [10, 8, 0, 4, 10, 0, 4], weights := [1, 0, 0, 1] }

def points95 : List (ℕ × ℕ) := [(0, 1), (1, 2), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 7852, representative 997.
def source96 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B007.Data.entryAt ⟨88, by decide +kernel⟩

def target96 : Weights.Entry :=
  { word := [10, 8, 0, 4, 10, 8, 2], weights := [1, 0, 0, 1] }

def points96 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 7853, representative 959.
def source97 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B007.Data.entryAt ⟨50, by decide +kernel⟩

def target97 : Weights.Entry :=
  { word := [10, 8, 0, 4, 10, 8, 4], weights := [1, 0, 0, 1] }

def points97 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 7872, representative 1007.
def source98 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B007.Data.entryAt ⟨98, by decide +kernel⟩

def target98 : Weights.Entry :=
  { word := [10, 8, 0, 12, 2, 0, 2], weights := [1, 0, 0, 1] }

def points98 : List (ℕ × ℕ) := [(0, 1), (1, 2), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 7873, representative 973.
def source99 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B007.Data.entryAt ⟨64, by decide +kernel⟩

def target99 : Weights.Entry :=
  { word := [10, 8, 0, 12, 2, 0, 4], weights := [1, 0, 0, 1] }

def points99 : List (ℕ × ℕ) := [(0, 1), (1, 2), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 7878, representative 999.
def source100 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B007.Data.entryAt ⟨90, by decide +kernel⟩

def target100 : Weights.Entry :=
  { word := [10, 8, 0, 12, 2, 8, 2], weights := [1, 0, 0, 1] }

def points100 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 7879, representative 961.
def source101 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B007.Data.entryAt ⟨52, by decide +kernel⟩

def target101 : Weights.Entry :=
  { word := [10, 8, 0, 12, 2, 8, 4], weights := [1, 0, 0, 1] }

def points101 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 7897, representative 1006.
def source102 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B007.Data.entryAt ⟨97, by decide +kernel⟩

def target102 : Weights.Entry :=
  { word := [10, 8, 0, 12, 10, 0, 2], weights := [1, 0, 0, 1] }

def points102 : List (ℕ × ℕ) := [(0, 1), (1, 2), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 7898, representative 972.
def source103 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B007.Data.entryAt ⟨63, by decide +kernel⟩

def target103 : Weights.Entry :=
  { word := [10, 8, 0, 12, 10, 0, 4], weights := [1, 0, 0, 1] }

def points103 : List (ℕ × ℕ) := [(0, 1), (1, 2), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 7903, representative 998.
def source104 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B007.Data.entryAt ⟨89, by decide +kernel⟩

def target104 : Weights.Entry :=
  { word := [10, 8, 0, 12, 10, 8, 2], weights := [1, 0, 0, 1] }

def points104 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 7904, representative 960.
def source105 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B007.Data.entryAt ⟨51, by decide +kernel⟩

def target105 : Weights.Entry :=
  { word := [10, 8, 0, 12, 10, 8, 4], weights := [1, 0, 0, 1] }

def points105 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 7922, representative 974.
def source106 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B007.Data.entryAt ⟨65, by decide +kernel⟩

def target106 : Weights.Entry :=
  { word := [10, 8, 4, 2, 0, 8, 2], weights := [1, 0, 0, 1] }

def points106 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 7923, representative 938.
def source107 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B007.Data.entryAt ⟨29, by decide +kernel⟩

def target107 : Weights.Entry :=
  { word := [10, 8, 4, 2, 0, 8, 4], weights := [1, 0, 0, 1] }

def points107 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 7934, representative 943.
def source108 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B007.Data.entryAt ⟨34, by decide +kernel⟩

def target108 : Weights.Entry :=
  { word := [10, 8, 4, 2, 8, 8, 4], weights := [1, 0, 0, 1] }

def points108 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 7949, representative 977.
def source109 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B007.Data.entryAt ⟨68, by decide +kernel⟩

def target109 : Weights.Entry :=
  { word := [10, 8, 4, 10, 0, 8, 2], weights := [0, 1, 0, 1] }

def points109 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 7950, representative 945.
def source110 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B007.Data.entryAt ⟨36, by decide +kernel⟩

def target110 : Weights.Entry :=
  { word := [10, 8, 4, 10, 0, 8, 4], weights := [0, 1, 0, 1] }

def points110 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 7958, representative 944.
def source111 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B007.Data.entryAt ⟨35, by decide +kernel⟩

def target111 : Weights.Entry :=
  { word := [10, 8, 4, 10, 8, 8, 4], weights := [0, 1, 0, 1] }

def points111 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 7984, representative 1001.
def source112 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B007.Data.entryAt ⟨92, by decide +kernel⟩

def target112 : Weights.Entry :=
  { word := [10, 8, 8, 4, 2, 0, 2], weights := [1, 0, 0, 1] }

def points112 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 7985, representative 967.
def source113 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B007.Data.entryAt ⟨58, by decide +kernel⟩

def target113 : Weights.Entry :=
  { word := [10, 8, 8, 4, 2, 0, 4], weights := [1, 0, 0, 1] }

def points113 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 7990, representative 993.
def source114 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B007.Data.entryAt ⟨84, by decide +kernel⟩

def target114 : Weights.Entry :=
  { word := [10, 8, 8, 4, 2, 8, 2], weights := [1, 0, 0, 1] }

def points114 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 7991, representative 955.
def source115 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B007.Data.entryAt ⟨46, by decide +kernel⟩

def target115 : Weights.Entry :=
  { word := [10, 8, 8, 4, 2, 8, 4], weights := [1, 0, 0, 1] }

def points115 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8014, representative 1002.
def source116 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B007.Data.entryAt ⟨93, by decide +kernel⟩

def target116 : Weights.Entry :=
  { word := [10, 8, 8, 4, 10, 0, 2], weights := [1, 0, 0, 1] }

def points116 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8015, representative 968.
def source117 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B007.Data.entryAt ⟨59, by decide +kernel⟩

def target117 : Weights.Entry :=
  { word := [10, 8, 8, 4, 10, 0, 4], weights := [1, 0, 0, 1] }

def points117 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8020, representative 994.
def source118 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B007.Data.entryAt ⟨85, by decide +kernel⟩

def target118 : Weights.Entry :=
  { word := [10, 8, 8, 4, 10, 8, 2], weights := [1, 0, 0, 1] }

def points118 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8021, representative 956.
def source119 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B007.Data.entryAt ⟨47, by decide +kernel⟩

def target119 : Weights.Entry :=
  { word := [10, 8, 8, 4, 10, 8, 4], weights := [1, 0, 0, 1] }

def points119 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8058, representative 1004.
def source120 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B007.Data.entryAt ⟨95, by decide +kernel⟩

def target120 : Weights.Entry :=
  { word := [10, 8, 8, 12, 2, 0, 2], weights := [1, 0, 0, 1] }

def points120 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8059, representative 970.
def source121 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B007.Data.entryAt ⟨61, by decide +kernel⟩

def target121 : Weights.Entry :=
  { word := [10, 8, 8, 12, 2, 0, 4], weights := [1, 0, 0, 1] }

def points121 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8064, representative 996.
def source122 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B007.Data.entryAt ⟨87, by decide +kernel⟩

def target122 : Weights.Entry :=
  { word := [10, 8, 8, 12, 2, 8, 2], weights := [1, 0, 0, 1] }

def points122 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8065, representative 958.
def source123 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B007.Data.entryAt ⟨49, by decide +kernel⟩

def target123 : Weights.Entry :=
  { word := [10, 8, 8, 12, 2, 8, 4], weights := [1, 0, 0, 1] }

def points123 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8087, representative 1003.
def source124 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B007.Data.entryAt ⟨94, by decide +kernel⟩

def target124 : Weights.Entry :=
  { word := [10, 8, 8, 12, 10, 0, 2], weights := [1, 0, 0, 1] }

def points124 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8088, representative 969.
def source125 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B007.Data.entryAt ⟨60, by decide +kernel⟩

def target125 : Weights.Entry :=
  { word := [10, 8, 8, 12, 10, 0, 4], weights := [1, 0, 0, 1] }

def points125 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8093, representative 995.
def source126 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B007.Data.entryAt ⟨86, by decide +kernel⟩

def target126 : Weights.Entry :=
  { word := [10, 8, 8, 12, 10, 8, 2], weights := [1, 0, 0, 1] }

def points126 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8094, representative 957.
def source127 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B007.Data.entryAt ⟨48, by decide +kernel⟩

def target127 : Weights.Entry :=
  { word := [10, 8, 8, 12, 10, 8, 4], weights := [1, 0, 0, 1] }

def points127 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

def period7Entries : List Weights.Entry := [target0, target1, target2, target3, target4, target5, target6, target7, target8, target9, target10, target11, target12, target13, target14, target15, target16, target17, target18, target19, target20, target21, target22, target23, target24, target25, target26, target27, target28, target29, target30, target31, target32, target33, target34, target35, target36, target37, target38, target39, target40, target41, target42, target43, target44, target45, target46, target47, target48, target49, target50, target51, target52, target53, target54, target55, target56, target57, target58, target59, target60, target61, target62, target63, target64, target65, target66, target67, target68, target69, target70, target71, target72, target73, target74, target75, target76, target77, target78, target79, target80, target81, target82, target83, target84, target85, target86, target87, target88, target89, target90, target91, target92, target93, target94, target95, target96, target97, target98, target99, target100, target101, target102, target103, target104, target105, target106, target107, target108, target109, target110, target111, target112, target113, target114, target115, target116, target117, target118, target119, target120, target121, target122, target123, target124, target125, target126, target127]

def period7Chunk : RowCoverage.Chunk where
  rows := [⟨3424, target0⟩, ⟨3426, target1⟩, ⟨3434, target2⟩, ⟨3452, target3⟩, ⟨3454, target4⟩, ⟨3466, target5⟩, ⟨3513, target6⟩, ⟨3515, target7⟩, ⟨3523, target8⟩, ⟨3545, target9⟩, ⟨3547, target10⟩, ⟨3559, target11⟩, ⟨3727, target12⟩, ⟨3729, target13⟩, ⟨3734, target14⟩, ⟨3753, target15⟩, ⟨3755, target16⟩, ⟨3760, target17⟩, ⟨3773, target18⟩, ⟨3778, target19⟩, ⟨3796, target20⟩, ⟨3798, target21⟩, ⟨3803, target22⟩, ⟨3815, target23⟩, ⟨3817, target24⟩, ⟨3825, target25⟩, ⟨3850, target26⟩, ⟨3852, target27⟩, ⟨3859, target28⟩, ⟨3923, target29⟩, ⟨3925, target30⟩, ⟨3933, target31⟩, ⟨3958, target32⟩, ⟨3960, target33⟩, ⟨3967, target34⟩, ⟨4520, target35⟩, ⟨4521, target36⟩, ⟨4548, target37⟩, ⟨4585, target38⟩, ⟨4587, target39⟩, ⟨4602, target40⟩, ⟨4609, target41⟩, ⟨4610, target42⟩, ⟨4641, target43⟩, ⟨4642, target44⟩, ⟨5872, target45⟩, ⟨5873, target46⟩, ⟨5879, target47⟩, ⟨5884, target48⟩, ⟨5898, target49⟩, ⟨5899, target50⟩, ⟨5905, target51⟩, ⟨5910, target52⟩, ⟨5932, target53⟩, ⟨5933, target54⟩, ⟨5939, target55⟩, ⟨5944, target56⟩, ⟨5957, target57⟩, ⟨5958, target58⟩, ⟨5964, target59⟩, ⟨5969, target60⟩, ⟨6005, target61⟩, ⟨6007, target62⟩, ⟨6013, target63⟩, ⟨6015, target64⟩, ⟨6017, target65⟩, ⟨6035, target66⟩, ⟨6037, target67⟩, ⟨6042, target68⟩, ⟨6044, target69⟩, ⟨7427, target70⟩, ⟨7428, target71⟩, ⟨7439, target72⟩, ⟨7450, target73⟩, ⟨7451, target74⟩, ⟨7466, target75⟩, ⟨7544, target76⟩, ⟨7545, target77⟩, ⟨7556, target78⟩, ⟨7572, target79⟩, ⟨7573, target80⟩, ⟨7588, target81⟩, ⟨7640, target82⟩, ⟨7652, target83⟩, ⟨7654, target84⟩, ⟨7666, target85⟩, ⟨7780, target86⟩, ⟨7792, target87⟩, ⟨7794, target88⟩, ⟨7806, target89⟩, ⟨7820, target90⟩, ⟨7821, target91⟩, ⟨7826, target92⟩, ⟨7827, target93⟩, ⟨7846, target94⟩, ⟨7847, target95⟩, ⟨7852, target96⟩, ⟨7853, target97⟩, ⟨7872, target98⟩, ⟨7873, target99⟩, ⟨7878, target100⟩, ⟨7879, target101⟩, ⟨7897, target102⟩, ⟨7898, target103⟩, ⟨7903, target104⟩, ⟨7904, target105⟩, ⟨7922, target106⟩, ⟨7923, target107⟩, ⟨7934, target108⟩, ⟨7949, target109⟩, ⟨7950, target110⟩, ⟨7958, target111⟩, ⟨7984, target112⟩, ⟨7985, target113⟩, ⟨7990, target114⟩, ⟨7991, target115⟩, ⟨8014, target116⟩, ⟨8015, target117⟩, ⟨8020, target118⟩, ⟨8021, target119⟩, ⟨8058, target120⟩, ⟨8059, target121⟩, ⟨8064, target122⟩, ⟨8065, target123⟩, ⟨8087, target124⟩, ⟨8088, target125⟩, ⟨8093, target126⟩, ⟨8094, target127⟩]
  indexMask := 5243358432216777477385269135996348387411083995327967650115112252256024235773452112328157727772076551113354061279031629092182193086651392229077551363677158284237315189012722287752190498941310667990962120733943775390697594663713975628788024650186580531918054384761722654589936099343598734238982458414086896280086481863641107508565122012359553505912651144152937286375586390378846389841306345420074114254962913883785379257514757058853722214549837072681456552847991672823330281985236984577663293765485533942154271764382097779826960236874950458758315508651678102452626775892423328521772539306520718011201764624104990610975926967487608761089225456444560742102237046641926965715366666661579898662674277864972695900342189548946842878245217393238004225751452353967964370917979408569935826849037012770510294117798612907150337719838947971076116923304595073389383810655530453497881175590862141337819683006902287492830705309036795349843889455445121358510869149972818847866860093053989383676093507053200237381025934298217532219271862014466785750085414034280150925994727932248347090369572414558169672778473934525903581812388473236325445804203250196301001549463082850758172761110355406922732715477966133601582770131597610053385306265294648745772946652111815351078704496873454080565023766806950022195263810452698547753584169538672620656512540291055740180359615989985972376052035155208886726023826017021869060459352380804806918636363969421259780916349839697957651381308017375120733579581730316792720730817126042780632323952495428892878076207411597250409041830928366204576834302091076927690634924259527628559652870554381999851772578666894520495797760497036669642780242881853460208747713560521199868686720122567093693751435550378844027705485888527841349536492406193982654981093191715949165437727295117637009559360088837402241292157389057581500287602972024157063331264568934650770724551839001940610489223998116487744677739122004849437536016240703172238665344320837479308475393793671872173856552603217222373065891577248152201931433644691805731656815104960306668258569465633378714854688535548123582530251027873884479662558738395095107340508370216585958413829428935363027656370637758039809859053457073807499950452947291308711724542170487217028655495538897686736234910740965047893635317163533136263627182816407769831203830178076006179481876301627111486893055924488916208948247381852681031413232095924237226418504931928891536518031574323499090836922404382365974528
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

end FranklSmallCyclic.TransportBatches.G007.B001.Data
