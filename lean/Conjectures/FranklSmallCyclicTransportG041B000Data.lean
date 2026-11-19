module

public import Conjectures.FranklSmallCyclicRowCoverage
public import Conjectures.FranklSmallCyclicCanonicalWords
public import Conjectures.FranklSmallCyclicOrbit8Block015Data

/-! 128 literal targets sharing one source proof block.
Original words and row indices are retained; weights may be transported.
-/
@[expose] public section

namespace FranklSmallCyclic.TransportBatches.G041.B000.Data

-- Period 8, original row 19, representative 5245.
def source0 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B015.Data.entryAt ⟨9, by decide +kernel⟩

def target0 : Weights.Entry :=
  { word := [0, 0, 1, 4, 8, 12, 4], weights := [1, 0, 0, 1] }

-- Period 8, original row 42, representative 5248.
def source1 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B015.Data.entryAt ⟨12, by decide +kernel⟩

def target1 : Weights.Entry :=
  { word := [0, 0, 1, 12, 8, 12, 4], weights := [1, 0, 1, 0] }

-- Period 8, original row 136, representative 5358.
def source2 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B015.Data.entryAt ⟨122, by decide +kernel⟩

def target2 : Weights.Entry :=
  { word := [0, 1, 0, 12, 0, 4, 2], weights := [1, 0, 1, 0] }

-- Period 8, original row 137, representative 5358.
def source3 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B015.Data.entryAt ⟨122, by decide +kernel⟩

def target3 : Weights.Entry :=
  { word := [0, 1, 0, 12, 0, 4, 4], weights := [1, 0, 1, 0] }

def points3 : List (ℕ × ℕ) := [(0, 7), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 0)]

-- Period 8, original row 295, representative 5358.
def source4 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B015.Data.entryAt ⟨122, by decide +kernel⟩

def target4 : Weights.Entry :=
  { word := [0, 2, 0, 8, 1, 4, 2], weights := [0, 1, 1, 0] }

def points4 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6), (7, 7)]

-- Period 8, original row 296, representative 5358.
def source5 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B015.Data.entryAt ⟨122, by decide +kernel⟩

def target5 : Weights.Entry :=
  { word := [0, 2, 0, 8, 1, 4, 4], weights := [0, 1, 1, 0] }

def points5 : List (ℕ × ℕ) := [(0, 7), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6), (7, 0)]

-- Period 8, original row 303, representative 5261.
def source6 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B015.Data.entryAt ⟨25, by decide +kernel⟩

def target6 : Weights.Entry :=
  { word := [0, 2, 0, 8, 4, 4, 4], weights := [0, 1, 0, 1] }

-- Period 8, original row 310, representative 5348.
def source7 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B015.Data.entryAt ⟨112, by decide +kernel⟩

def target7 : Weights.Entry :=
  { word := [0, 2, 0, 8, 9, 4, 4], weights := [0, 1, 1, 0] }

-- Period 8, original row 314, representative 5257.
def source8 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B015.Data.entryAt ⟨21, by decide +kernel⟩

def target8 : Weights.Entry :=
  { word := [0, 2, 0, 8, 12, 4, 4], weights := [0, 1, 0, 1] }

-- Period 8, original row 411, representative 5260.
def source9 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B015.Data.entryAt ⟨24, by decide +kernel⟩

def target9 : Weights.Entry :=
  { word := [0, 2, 8, 8, 4, 4, 4], weights := [0, 1, 0, 1] }

-- Period 8, original row 416, representative 5256.
def source10 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B015.Data.entryAt ⟨20, by decide +kernel⟩

def target10 : Weights.Entry :=
  { word := [0, 2, 8, 8, 12, 4, 4], weights := [0, 1, 0, 1] }

-- Period 8, original row 656, representative 5237.
def source11 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B015.Data.entryAt ⟨1, by decide +kernel⟩

def target11 : Weights.Entry :=
  { word := [0, 4, 8, 4, 8, 12, 2], weights := [1, 0, 1, 0] }

-- Period 8, original row 657, representative 5243.
def source12 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B015.Data.entryAt ⟨7, by decide +kernel⟩

def target12 : Weights.Entry :=
  { word := [0, 4, 8, 4, 8, 12, 4], weights := [1, 0, 0, 1] }

-- Period 8, original row 684, representative 5238.
def source13 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B015.Data.entryAt ⟨2, by decide +kernel⟩

def target13 : Weights.Entry :=
  { word := [0, 4, 8, 12, 8, 12, 2], weights := [1, 0, 1, 0] }

-- Period 8, original row 685, representative 5244.
def source14 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B015.Data.entryAt ⟨8, by decide +kernel⟩

def target14 : Weights.Entry :=
  { word := [0, 4, 8, 12, 8, 12, 4], weights := [1, 0, 1, 0] }

-- Period 8, original row 798, representative 5251.
def source15 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B015.Data.entryAt ⟨15, by decide +kernel⟩

def target15 : Weights.Entry :=
  { word := [0, 8, 0, 0, 1, 12, 4], weights := [0, 0, 1, 1] }

-- Period 8, original row 810, representative 5251.
def source16 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B015.Data.entryAt ⟨15, by decide +kernel⟩

def target16 : Weights.Entry :=
  { word := [0, 8, 0, 4, 0, 12, 4], weights := [0, 0, 1, 1] }

def points16 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6), (7, 7)]

-- Period 8, original row 836, representative 5249.
def source17 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B015.Data.entryAt ⟨13, by decide +kernel⟩

def target17 : Weights.Entry :=
  { word := [0, 8, 0, 4, 8, 12, 4], weights := [1, 0, 0, 1] }

-- Period 8, original row 858, representative 5252.
def source18 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B015.Data.entryAt ⟨16, by decide +kernel⟩

def target18 : Weights.Entry :=
  { word := [0, 8, 0, 8, 1, 12, 4], weights := [0, 1, 1, 0] }

-- Period 8, original row 866, representative 5253.
def source19 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B015.Data.entryAt ⟨17, by decide +kernel⟩

def target19 : Weights.Entry :=
  { word := [0, 8, 0, 8, 8, 12, 4], weights := [0, 1, 0, 1] }

-- Period 8, original row 879, representative 5252.
def source20 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B015.Data.entryAt ⟨16, by decide +kernel⟩

def target20 : Weights.Entry :=
  { word := [0, 8, 0, 12, 0, 12, 4], weights := [1, 0, 1, 0] }

def points20 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6), (7, 7)]

-- Period 8, original row 888, representative 5250.
def source21 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B015.Data.entryAt ⟨14, by decide +kernel⟩

def target21 : Weights.Entry :=
  { word := [0, 8, 0, 12, 8, 12, 4], weights := [1, 0, 1, 0] }

-- Period 8, original row 911, representative 5246.
def source22 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B015.Data.entryAt ⟨10, by decide +kernel⟩

def target22 : Weights.Entry :=
  { word := [0, 8, 1, 4, 8, 12, 4], weights := [1, 0, 0, 1] }

-- Period 8, original row 934, representative 5247.
def source23 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B015.Data.entryAt ⟨11, by decide +kernel⟩

def target23 : Weights.Entry :=
  { word := [0, 8, 1, 12, 8, 12, 4], weights := [1, 0, 1, 0] }

-- Period 8, original row 1168, representative 5351.
def source24 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B015.Data.entryAt ⟨115, by decide +kernel⟩

def target24 : Weights.Entry :=
  { word := [0, 9, 0, 4, 8, 4, 2], weights := [1, 0, 1, 0] }

-- Period 8, original row 1169, representative 5353.
def source25 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B015.Data.entryAt ⟨117, by decide +kernel⟩

def target25 : Weights.Entry :=
  { word := [0, 9, 0, 4, 8, 4, 4], weights := [1, 0, 0, 1] }

-- Period 8, original row 1202, representative 5355.
def source26 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B015.Data.entryAt ⟨119, by decide +kernel⟩

def target26 : Weights.Entry :=
  { word := [0, 9, 0, 12, 0, 4, 2], weights := [1, 0, 1, 0] }

-- Period 8, original row 1203, representative 5355.
def source27 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B015.Data.entryAt ⟨119, by decide +kernel⟩

def target27 : Weights.Entry :=
  { word := [0, 9, 0, 12, 0, 4, 4], weights := [1, 0, 1, 0] }

def points27 : List (ℕ × ℕ) := [(0, 7), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 0)]

-- Period 8, original row 1227, representative 5352.
def source28 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B015.Data.entryAt ⟨116, by decide +kernel⟩

def target28 : Weights.Entry :=
  { word := [0, 9, 0, 12, 8, 4, 2], weights := [1, 0, 1, 0] }

-- Period 8, original row 1228, representative 5354.
def source29 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B015.Data.entryAt ⟨118, by decide +kernel⟩

def target29 : Weights.Entry :=
  { word := [0, 9, 0, 12, 8, 4, 4], weights := [1, 0, 1, 0] }

-- Period 8, original row 1344, representative 5355.
def source30 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B015.Data.entryAt ⟨119, by decide +kernel⟩

def target30 : Weights.Entry :=
  { word := [0, 10, 0, 8, 1, 4, 2], weights := [0, 1, 1, 0] }

def points30 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6), (7, 7)]

-- Period 8, original row 1345, representative 5355.
def source31 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B015.Data.entryAt ⟨119, by decide +kernel⟩

def target31 : Weights.Entry :=
  { word := [0, 10, 0, 8, 1, 4, 4], weights := [0, 1, 1, 0] }

def points31 : List (ℕ × ℕ) := [(0, 7), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6), (7, 0)]

-- Period 8, original row 1352, representative 5259.
def source32 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B015.Data.entryAt ⟨23, by decide +kernel⟩

def target32 : Weights.Entry :=
  { word := [0, 10, 0, 8, 4, 4, 4], weights := [0, 1, 0, 1] }

-- Period 8, original row 1359, representative 5347.
def source33 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B015.Data.entryAt ⟨111, by decide +kernel⟩

def target33 : Weights.Entry :=
  { word := [0, 10, 0, 8, 9, 4, 4], weights := [0, 1, 1, 0] }

-- Period 8, original row 1363, representative 5255.
def source34 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B015.Data.entryAt ⟨19, by decide +kernel⟩

def target34 : Weights.Entry :=
  { word := [0, 10, 0, 8, 12, 4, 4], weights := [0, 1, 0, 1] }

-- Period 8, original row 1443, representative 5258.
def source35 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B015.Data.entryAt ⟨22, by decide +kernel⟩

def target35 : Weights.Entry :=
  { word := [0, 10, 8, 8, 4, 4, 4], weights := [0, 1, 0, 1] }

-- Period 8, original row 1448, representative 5254.
def source36 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B015.Data.entryAt ⟨18, by decide +kernel⟩

def target36 : Weights.Entry :=
  { word := [0, 10, 8, 8, 12, 4, 4], weights := [0, 1, 0, 1] }

-- Period 8, original row 1524, representative 5239.
def source37 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B015.Data.entryAt ⟨3, by decide +kernel⟩

def target37 : Weights.Entry :=
  { word := [0, 12, 0, 4, 8, 12, 4], weights := [1, 0, 0, 1] }

-- Period 8, original row 1547, representative 5242.
def source38 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B015.Data.entryAt ⟨6, by decide +kernel⟩

def target38 : Weights.Entry :=
  { word := [0, 12, 0, 12, 8, 12, 4], weights := [1, 0, 1, 0] }

-- Period 8, original row 1656, representative 5240.
def source39 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B015.Data.entryAt ⟨4, by decide +kernel⟩

def target39 : Weights.Entry :=
  { word := [0, 12, 8, 4, 8, 12, 4], weights := [1, 0, 0, 1] }

-- Period 8, original row 1683, representative 5236.
def source40 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B015.Data.entryAt ⟨0, by decide +kernel⟩

def target40 : Weights.Entry :=
  { word := [0, 12, 8, 12, 8, 12, 2], weights := [1, 0, 1, 0] }

-- Period 8, original row 1684, representative 5241.
def source41 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B015.Data.entryAt ⟨5, by decide +kernel⟩

def target41 : Weights.Entry :=
  { word := [0, 12, 8, 12, 8, 12, 4], weights := [1, 0, 1, 0] }

-- Period 8, original row 1756, representative 5245.
def source42 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B015.Data.entryAt ⟨9, by decide +kernel⟩

def target42 : Weights.Entry :=
  { word := [1, 0, 1, 4, 8, 12, 4], weights := [1, 0, 0, 1] }

def points42 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 8, original row 1779, representative 5248.
def source43 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B015.Data.entryAt ⟨12, by decide +kernel⟩

def target43 : Weights.Entry :=
  { word := [1, 0, 1, 12, 8, 12, 4], weights := [1, 0, 1, 0] }

def points43 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 8, original row 1940, representative 5237.
def source44 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B015.Data.entryAt ⟨1, by decide +kernel⟩

def target44 : Weights.Entry :=
  { word := [1, 4, 8, 4, 8, 12, 2], weights := [1, 0, 1, 0] }

def points44 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 8, original row 1941, representative 5243.
def source45 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B015.Data.entryAt ⟨7, by decide +kernel⟩

def target45 : Weights.Entry :=
  { word := [1, 4, 8, 4, 8, 12, 4], weights := [1, 0, 0, 1] }

def points45 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 8, original row 1968, representative 5238.
def source46 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B015.Data.entryAt ⟨2, by decide +kernel⟩

def target46 : Weights.Entry :=
  { word := [1, 4, 8, 12, 8, 12, 2], weights := [1, 0, 1, 0] }

def points46 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 8, original row 1969, representative 5244.
def source47 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B015.Data.entryAt ⟨8, by decide +kernel⟩

def target47 : Weights.Entry :=
  { word := [1, 4, 8, 12, 8, 12, 4], weights := [1, 0, 1, 0] }

def points47 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 8, original row 2041, representative 5246.
def source48 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B015.Data.entryAt ⟨10, by decide +kernel⟩

def target48 : Weights.Entry :=
  { word := [1, 8, 1, 4, 8, 12, 4], weights := [1, 0, 0, 1] }

def points48 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 8, original row 2064, representative 5247.
def source49 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B015.Data.entryAt ⟨11, by decide +kernel⟩

def target49 : Weights.Entry :=
  { word := [1, 8, 1, 12, 8, 12, 4], weights := [1, 0, 1, 0] }

def points49 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 8, original row 2300, representative 5240.
def source50 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B015.Data.entryAt ⟨4, by decide +kernel⟩

def target50 : Weights.Entry :=
  { word := [1, 12, 8, 4, 8, 12, 4], weights := [1, 0, 0, 1] }

def points50 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 8, original row 2327, representative 5236.
def source51 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B015.Data.entryAt ⟨0, by decide +kernel⟩

def target51 : Weights.Entry :=
  { word := [1, 12, 8, 12, 8, 12, 2], weights := [1, 0, 1, 0] }

def points51 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 8, original row 2328, representative 5241.
def source52 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B015.Data.entryAt ⟨5, by decide +kernel⟩

def target52 : Weights.Entry :=
  { word := [1, 12, 8, 12, 8, 12, 4], weights := [1, 0, 1, 0] }

def points52 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 8, original row 2444, representative 5295.
def source53 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B015.Data.entryAt ⟨59, by decide +kernel⟩

def target53 : Weights.Entry :=
  { word := [2, 0, 4, 10, 0, 12, 8], weights := [1, 0, 1, 1] }

-- Period 8, original row 2469, representative 5320.
def source54 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B015.Data.entryAt ⟨84, by decide +kernel⟩

def target54 : Weights.Entry :=
  { word := [2, 0, 8, 4, 4, 4, 8], weights := [1, 0, 0, 1] }

-- Period 8, original row 2471, representative 5287.
def source55 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B015.Data.entryAt ⟨51, by decide +kernel⟩

def target55 : Weights.Entry :=
  { word := [2, 0, 8, 4, 4, 12, 8], weights := [1, 0, 0, 1] }

-- Period 8, original row 2488, representative 5268.
def source56 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B015.Data.entryAt ⟨32, by decide +kernel⟩

def target56 : Weights.Entry :=
  { word := [2, 0, 8, 12, 0, 4, 2], weights := [1, 0, 1, 0] }

-- Period 8, original row 2490, representative 5322.
def source57 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B015.Data.entryAt ⟨86, by decide +kernel⟩

def target57 : Weights.Entry :=
  { word := [2, 0, 8, 12, 0, 4, 8], weights := [0, 0, 1, 0] }

-- Period 8, original row 2495, representative 5289.
def source58 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B015.Data.entryAt ⟨53, by decide +kernel⟩

def target58 : Weights.Entry :=
  { word := [2, 0, 8, 12, 0, 12, 8], weights := [0, 0, 1, 0] }

-- Period 8, original row 2499, representative 5321.
def source59 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B015.Data.entryAt ⟨85, by decide +kernel⟩

def target59 : Weights.Entry :=
  { word := [2, 0, 8, 12, 4, 4, 8], weights := [1, 0, 0, 1] }

-- Period 8, original row 2501, representative 5288.
def source60 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B015.Data.entryAt ⟨52, by decide +kernel⟩

def target60 : Weights.Entry :=
  { word := [2, 0, 8, 12, 4, 12, 8], weights := [1, 0, 0, 1] }

-- Period 8, original row 2506, representative 5329.
def source61 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B015.Data.entryAt ⟨93, by decide +kernel⟩

def target61 : Weights.Entry :=
  { word := [2, 0, 9, 0, 1, 4, 8], weights := [0, 0, 1, 0] }

-- Period 8, original row 2507, representative 5298.
def source62 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B015.Data.entryAt ⟨62, by decide +kernel⟩

def target62 : Weights.Entry :=
  { word := [2, 0, 9, 0, 1, 12, 8], weights := [0, 0, 1, 0] }

-- Period 8, original row 2508, representative 5270.
def source63 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B015.Data.entryAt ⟨34, by decide +kernel⟩

def target63 : Weights.Entry :=
  { word := [2, 0, 9, 8, 1, 4, 2], weights := [1, 0, 1, 1] }

-- Period 8, original row 2510, representative 5330.
def source64 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B015.Data.entryAt ⟨94, by decide +kernel⟩

def target64 : Weights.Entry :=
  { word := [2, 0, 9, 8, 1, 4, 8], weights := [0, 0, 1, 0] }

-- Period 8, original row 2515, representative 5299.
def source65 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B015.Data.entryAt ⟨63, by decide +kernel⟩

def target65 : Weights.Entry :=
  { word := [2, 0, 9, 8, 1, 12, 8], weights := [0, 0, 1, 0] }

-- Period 8, original row 2550, representative 5270.
def source66 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B015.Data.entryAt ⟨34, by decide +kernel⟩

def target66 : Weights.Entry :=
  { word := [2, 0, 12, 10, 0, 4, 2], weights := [1, 0, 1, 1] }

def points66 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 2), (3, 5), (4, 4), (5, 3), (6, 6), (7, 1)]

-- Period 8, original row 2552, representative 5330.
def source67 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B015.Data.entryAt ⟨94, by decide +kernel⟩

def target67 : Weights.Entry :=
  { word := [2, 0, 12, 10, 0, 4, 8], weights := [1, 0, 0, 0] }

def points67 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 2), (3, 5), (4, 4), (5, 3), (6, 6), (7, 1)]

-- Period 8, original row 2566, representative 5294.
def source68 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B015.Data.entryAt ⟨58, by decide +kernel⟩

def target68 : Weights.Entry :=
  { word := [2, 0, 12, 10, 0, 12, 8], weights := [1, 0, 1, 1] }

-- Period 8, original row 2582, representative 5358.
def source69 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B015.Data.entryAt ⟨122, by decide +kernel⟩

def target69 : Weights.Entry :=
  { word := [2, 2, 0, 9, 0, 4, 0], weights := [0, 1, 1, 0] }

def points69 : List (ℕ × ℕ) := [(0, 7), (1, 1), (2, 2), (3, 4), (4, 6), (5, 5), (6, 3), (7, 0)]

-- Period 8, original row 2583, representative 5324.
def source70 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B015.Data.entryAt ⟨88, by decide +kernel⟩

def target70 : Weights.Entry :=
  { word := [2, 2, 0, 9, 0, 4, 8], weights := [1, 1, 2, 0] }

-- Period 8, original row 2585, representative 5355.
def source71 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B015.Data.entryAt ⟨119, by decide +kernel⟩

def target71 : Weights.Entry :=
  { word := [2, 2, 0, 9, 0, 12, 0], weights := [0, 1, 1, 0] }

def points71 : List (ℕ × ℕ) := [(0, 2), (1, 0), (2, 7), (3, 5), (4, 6), (5, 4), (6, 3), (7, 1)]

-- Period 8, original row 2586, representative 5291.
def source72 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B015.Data.entryAt ⟨55, by decide +kernel⟩

def target72 : Weights.Entry :=
  { word := [2, 2, 0, 9, 0, 12, 8], weights := [1, 1, 2, 0] }

-- Period 8, original row 2589, representative 5344.
def source73 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B015.Data.entryAt ⟨108, by decide +kernel⟩

def target73 : Weights.Entry :=
  { word := [2, 2, 0, 9, 8, 2, 2], weights := [1, 1, 0, 1] }

-- Period 8, original row 2596, representative 5337.
def source74 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B015.Data.entryAt ⟨101, by decide +kernel⟩

def target74 : Weights.Entry :=
  { word := [2, 2, 0, 9, 8, 10, 2], weights := [1, 1, 0, 1] }

-- Period 8, original row 2598, representative 5358.
def source75 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B015.Data.entryAt ⟨122, by decide +kernel⟩

def target75 : Weights.Entry :=
  { word := [2, 2, 0, 10, 0, 0, 1], weights := [0, 1, 0, 1] }

def points75 : List (ℕ × ℕ) := [(0, 7), (1, 1), (2, 2), (3, 4), (4, 5), (5, 6), (6, 3), (7, 0)]

-- Period 8, original row 2599, representative 5335.
def source76 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B015.Data.entryAt ⟨99, by decide +kernel⟩

def target76 : Weights.Entry :=
  { word := [2, 2, 0, 10, 0, 0, 2], weights := [1, 1, 0, 0] }

-- Period 8, original row 2606, representative 5355.
def source77 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B015.Data.entryAt ⟨119, by decide +kernel⟩

def target77 : Weights.Entry :=
  { word := [2, 2, 0, 10, 0, 8, 1], weights := [0, 1, 0, 1] }

def points77 : List (ℕ × ℕ) := [(0, 2), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1)]

-- Period 8, original row 2616, representative 5342.
def source78 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B015.Data.entryAt ⟨106, by decide +kernel⟩

def target78 : Weights.Entry :=
  { word := [2, 2, 0, 12, 10, 0, 2], weights := [1, 1, 0, 1] }

-- Period 8, original row 2623, representative 5261.
def source79 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B015.Data.entryAt ⟨25, by decide +kernel⟩

def target79 : Weights.Entry :=
  { word := [2, 2, 2, 8, 0, 4, 0], weights := [1, 0, 1, 0] }

def points79 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 2625, representative 5259.
def source80 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B015.Data.entryAt ⟨23, by decide +kernel⟩

def target80 : Weights.Entry :=
  { word := [2, 2, 2, 8, 0, 12, 0], weights := [1, 0, 1, 0] }

def points80 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 2627, representative 5346.
def source81 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B015.Data.entryAt ⟨110, by decide +kernel⟩

def target81 : Weights.Entry :=
  { word := [2, 2, 2, 8, 1, 0, 2], weights := [1, 1, 0, 1] }

-- Period 8, original row 2637, representative 5260.
def source82 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B015.Data.entryAt ⟨24, by decide +kernel⟩

def target82 : Weights.Entry :=
  { word := [2, 2, 2, 8, 8, 4, 0], weights := [1, 0, 1, 0] }

def points82 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 2639, representative 5258.
def source83 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B015.Data.entryAt ⟨22, by decide +kernel⟩

def target83 : Weights.Entry :=
  { word := [2, 2, 2, 8, 8, 12, 0], weights := [1, 0, 1, 0] }

def points83 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 2641, representative 5345.
def source84 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B015.Data.entryAt ⟨109, by decide +kernel⟩

def target84 : Weights.Entry :=
  { word := [2, 2, 2, 8, 9, 0, 2], weights := [1, 1, 0, 1] }

-- Period 8, original row 2651, representative 5325.
def source85 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B015.Data.entryAt ⟨89, by decide +kernel⟩

def target85 : Weights.Entry :=
  { word := [2, 2, 8, 0, 1, 4, 8], weights := [0, 1, 3, 0] }

-- Period 8, original row 2652, representative 5292.
def source86 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B015.Data.entryAt ⟨56, by decide +kernel⟩

def target86 : Weights.Entry :=
  { word := [2, 2, 8, 0, 1, 12, 8], weights := [0, 1, 3, 0] }

-- Period 8, original row 2659, representative 5353.
def source87 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B015.Data.entryAt ⟨117, by decide +kernel⟩

def target87 : Weights.Entry :=
  { word := [2, 2, 8, 2, 0, 8, 1], weights := [1, 0, 0, 1] }

def points87 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 2660, representative 5333.
def source88 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B015.Data.entryAt ⟨97, by decide +kernel⟩

def target88 : Weights.Entry :=
  { word := [2, 2, 8, 2, 0, 8, 2], weights := [1, 0, 0, 1] }

-- Period 8, original row 2685, representative 5326.
def source89 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B015.Data.entryAt ⟨90, by decide +kernel⟩

def target89 : Weights.Entry :=
  { word := [2, 2, 8, 8, 1, 4, 8], weights := [0, 1, 3, 0] }

-- Period 8, original row 2686, representative 5293.
def source90 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B015.Data.entryAt ⟨57, by decide +kernel⟩

def target90 : Weights.Entry :=
  { word := [2, 2, 8, 8, 1, 12, 8], weights := [0, 1, 3, 0] }

-- Period 8, original row 2687, representative 5348.
def source91 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B015.Data.entryAt ⟨112, by decide +kernel⟩

def target91 : Weights.Entry :=
  { word := [2, 2, 8, 9, 0, 4, 0], weights := [0, 1, 1, 0] }

def points91 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 2688, representative 5323.
def source92 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B015.Data.entryAt ⟨87, by decide +kernel⟩

def target92 : Weights.Entry :=
  { word := [2, 2, 8, 9, 0, 4, 8], weights := [1, 1, 2, 0] }

-- Period 8, original row 2690, representative 5347.
def source93 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B015.Data.entryAt ⟨111, by decide +kernel⟩

def target93 : Weights.Entry :=
  { word := [2, 2, 8, 9, 0, 12, 0], weights := [0, 1, 1, 0] }

def points93 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 2691, representative 5290.
def source94 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B015.Data.entryAt ⟨54, by decide +kernel⟩

def target94 : Weights.Entry :=
  { word := [2, 2, 8, 9, 0, 12, 8], weights := [1, 1, 2, 0] }

-- Period 8, original row 2694, representative 5343.
def source95 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B015.Data.entryAt ⟨107, by decide +kernel⟩

def target95 : Weights.Entry :=
  { word := [2, 2, 8, 9, 8, 2, 2], weights := [1, 1, 0, 1] }

-- Period 8, original row 2701, representative 5336.
def source96 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B015.Data.entryAt ⟨100, by decide +kernel⟩

def target96 : Weights.Entry :=
  { word := [2, 2, 8, 9, 8, 10, 2], weights := [1, 1, 0, 1] }

-- Period 8, original row 2709, representative 5354.
def source97 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B015.Data.entryAt ⟨118, by decide +kernel⟩

def target97 : Weights.Entry :=
  { word := [2, 2, 8, 10, 0, 8, 1], weights := [0, 1, 0, 1] }

def points97 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 2710, representative 5334.
def source98 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B015.Data.entryAt ⟨98, by decide +kernel⟩

def target98 : Weights.Entry :=
  { word := [2, 2, 8, 10, 0, 8, 2], weights := [1, 0, 0, 1] }

-- Period 8, original row 2726, representative 5272.
def source99 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B015.Data.entryAt ⟨36, by decide +kernel⟩

def target99 : Weights.Entry :=
  { word := [2, 2, 8, 10, 8, 6, 8], weights := [1, 1, 1, 1] }

-- Period 8, original row 2731, representative 5305.
def source100 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B015.Data.entryAt ⟨69, by decide +kernel⟩

def target100 : Weights.Entry :=
  { word := [2, 2, 8, 12, 0, 4, 8], weights := [1, 0, 2, 0] }

-- Period 8, original row 2732, representative 5276.
def source101 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B015.Data.entryAt ⟨40, by decide +kernel⟩

def target101 : Weights.Entry :=
  { word := [2, 2, 8, 12, 0, 12, 8], weights := [1, 0, 2, 0] }

-- Period 8, original row 2734, representative 5344.
def source102 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B015.Data.entryAt ⟨108, by decide +kernel⟩

def target102 : Weights.Entry :=
  { word := [2, 2, 8, 12, 2, 0, 2], weights := [1, 1, 0, 1] }

def points102 : List (ℕ × ℕ) := [(0, 7), (1, 1), (2, 0), (3, 6), (4, 3), (5, 5), (6, 4), (7, 2)]

-- Period 8, original row 2740, representative 5339.
def source103 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B015.Data.entryAt ⟨103, by decide +kernel⟩

def target103 : Weights.Entry :=
  { word := [2, 2, 8, 12, 2, 8, 2], weights := [1, 1, 1, 1] }

-- Period 8, original row 2744, representative 5303.
def source104 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B015.Data.entryAt ⟨67, by decide +kernel⟩

def target104 : Weights.Entry :=
  { word := [2, 2, 8, 12, 4, 4, 8], weights := [1, 1, 1, 1] }

-- Period 8, original row 2746, representative 5274.
def source105 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B015.Data.entryAt ⟨38, by decide +kernel⟩

def target105 : Weights.Entry :=
  { word := [2, 2, 8, 12, 4, 12, 8], weights := [1, 1, 1, 1] }

-- Period 8, original row 2747, representative 5304.
def source106 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B015.Data.entryAt ⟨68, by decide +kernel⟩

def target106 : Weights.Entry :=
  { word := [2, 2, 8, 12, 8, 4, 8], weights := [1, 0, 2, 0] }

-- Period 8, original row 2748, representative 5275.
def source107 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B015.Data.entryAt ⟨39, by decide +kernel⟩

def target107 : Weights.Entry :=
  { word := [2, 2, 8, 12, 8, 12, 8], weights := [1, 0, 2, 0] }

-- Period 8, original row 2750, representative 5340.
def source108 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B015.Data.entryAt ⟨104, by decide +kernel⟩

def target108 : Weights.Entry :=
  { word := [2, 2, 8, 12, 10, 0, 2], weights := [1, 1, 1, 0] }

-- Period 8, original row 2756, representative 5338.
def source109 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B015.Data.entryAt ⟨102, by decide +kernel⟩

def target109 : Weights.Entry :=
  { word := [2, 2, 8, 12, 10, 8, 2], weights := [1, 1, 1, 1] }

-- Period 8, original row 2762, representative 5302.
def source110 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B015.Data.entryAt ⟨66, by decide +kernel⟩

def target110 : Weights.Entry :=
  { word := [2, 2, 8, 12, 12, 4, 8], weights := [1, 1, 1, 1] }

-- Period 8, original row 2764, representative 5273.
def source111 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B015.Data.entryAt ⟨37, by decide +kernel⟩

def target111 : Weights.Entry :=
  { word := [2, 2, 8, 12, 12, 12, 8], weights := [1, 1, 1, 1] }

-- Period 8, original row 2765, representative 5257.
def source112 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B015.Data.entryAt ⟨21, by decide +kernel⟩

def target112 : Weights.Entry :=
  { word := [2, 2, 10, 8, 0, 4, 0], weights := [1, 0, 1, 0] }

def points112 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 2767, representative 5255.
def source113 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B015.Data.entryAt ⟨19, by decide +kernel⟩

def target113 : Weights.Entry :=
  { word := [2, 2, 10, 8, 0, 12, 0], weights := [1, 0, 1, 0] }

def points113 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 2769, representative 5342.
def source114 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B015.Data.entryAt ⟨106, by decide +kernel⟩

def target114 : Weights.Entry :=
  { word := [2, 2, 10, 8, 1, 0, 2], weights := [1, 1, 0, 1] }

def points114 : List (ℕ × ℕ) := [(0, 7), (1, 1), (2, 0), (3, 6), (4, 3), (5, 5), (6, 4), (7, 2)]

-- Period 8, original row 2779, representative 5256.
def source115 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B015.Data.entryAt ⟨20, by decide +kernel⟩

def target115 : Weights.Entry :=
  { word := [2, 2, 10, 8, 8, 4, 0], weights := [1, 0, 1, 0] }

def points115 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 2781, representative 5254.
def source116 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B015.Data.entryAt ⟨18, by decide +kernel⟩

def target116 : Weights.Entry :=
  { word := [2, 2, 10, 8, 8, 12, 0], weights := [1, 0, 1, 0] }

def points116 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 2783, representative 5341.
def source117 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B015.Data.entryAt ⟨105, by decide +kernel⟩

def target117 : Weights.Entry :=
  { word := [2, 2, 10, 8, 9, 0, 2], weights := [1, 1, 0, 1] }

-- Period 8, original row 2818, representative 5313.
def source118 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B015.Data.entryAt ⟨77, by decide +kernel⟩

def target118 : Weights.Entry :=
  { word := [2, 8, 0, 4, 4, 4, 8], weights := [1, 0, 0, 1] }

-- Period 8, original row 2823, representative 5265.
def source119 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B015.Data.entryAt ⟨29, by decide +kernel⟩

def target119 : Weights.Entry :=
  { word := [2, 8, 0, 4, 8, 4, 2], weights := [1, 0, 1, 0] }

-- Period 8, original row 2825, representative 5317.
def source120 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B015.Data.entryAt ⟨81, by decide +kernel⟩

def target120 : Weights.Entry :=
  { word := [2, 8, 0, 4, 8, 4, 8], weights := [1, 0, 1, 0] }

-- Period 8, original row 2829, representative 5284.
def source121 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B015.Data.entryAt ⟨48, by decide +kernel⟩

def target121 : Weights.Entry :=
  { word := [2, 8, 0, 4, 8, 12, 8], weights := [1, 0, 1, 0] }

-- Period 8, original row 2844, representative 5314.
def source122 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B015.Data.entryAt ⟨78, by decide +kernel⟩

def target122 : Weights.Entry :=
  { word := [2, 8, 0, 4, 12, 4, 8], weights := [1, 0, 0, 1] }

-- Period 8, original row 2849, representative 5267.
def source123 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B015.Data.entryAt ⟨31, by decide +kernel⟩

def target123 : Weights.Entry :=
  { word := [2, 8, 0, 12, 0, 4, 2], weights := [1, 0, 1, 0] }

-- Period 8, original row 2851, representative 5319.
def source124 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B015.Data.entryAt ⟨83, by decide +kernel⟩

def target124 : Weights.Entry :=
  { word := [2, 8, 0, 12, 0, 4, 8], weights := [1, 0, 1, 0] }

-- Period 8, original row 2855, representative 5286.
def source125 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B015.Data.entryAt ⟨50, by decide +kernel⟩

def target125 : Weights.Entry :=
  { word := [2, 8, 0, 12, 0, 12, 8], weights := [1, 0, 1, 0] }

-- Period 8, original row 2870, representative 5316.
def source126 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B015.Data.entryAt ⟨80, by decide +kernel⟩

def target126 : Weights.Entry :=
  { word := [2, 8, 0, 12, 4, 4, 8], weights := [1, 0, 0, 1] }

-- Period 8, original row 2874, representative 5266.
def source127 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B015.Data.entryAt ⟨30, by decide +kernel⟩

def target127 : Weights.Entry :=
  { word := [2, 8, 0, 12, 8, 4, 2], weights := [1, 0, 1, 0] }

def period8Entries : List Weights.Entry := [target0, target1, target2, target3, target4, target5, target6, target7, target8, target9, target10, target11, target12, target13, target14, target15, target16, target17, target18, target19, target20, target21, target22, target23, target24, target25, target26, target27, target28, target29, target30, target31, target32, target33, target34, target35, target36, target37, target38, target39, target40, target41, target42, target43, target44, target45, target46, target47, target48, target49, target50, target51, target52, target53, target54, target55, target56, target57, target58, target59, target60, target61, target62, target63, target64, target65, target66, target67, target68, target69, target70, target71, target72, target73, target74, target75, target76, target77, target78, target79, target80, target81, target82, target83, target84, target85, target86, target87, target88, target89, target90, target91, target92, target93, target94, target95, target96, target97, target98, target99, target100, target101, target102, target103, target104, target105, target106, target107, target108, target109, target110, target111, target112, target113, target114, target115, target116, target117, target118, target119, target120, target121, target122, target123, target124, target125, target126, target127]

def period8Chunk : RowCoverage.Chunk where
  rows := [⟨19, target0⟩, ⟨42, target1⟩, ⟨136, target2⟩, ⟨137, target3⟩, ⟨295, target4⟩, ⟨296, target5⟩, ⟨303, target6⟩, ⟨310, target7⟩, ⟨314, target8⟩, ⟨411, target9⟩, ⟨416, target10⟩, ⟨656, target11⟩, ⟨657, target12⟩, ⟨684, target13⟩, ⟨685, target14⟩, ⟨798, target15⟩, ⟨810, target16⟩, ⟨836, target17⟩, ⟨858, target18⟩, ⟨866, target19⟩, ⟨879, target20⟩, ⟨888, target21⟩, ⟨911, target22⟩, ⟨934, target23⟩, ⟨1168, target24⟩, ⟨1169, target25⟩, ⟨1202, target26⟩, ⟨1203, target27⟩, ⟨1227, target28⟩, ⟨1228, target29⟩, ⟨1344, target30⟩, ⟨1345, target31⟩, ⟨1352, target32⟩, ⟨1359, target33⟩, ⟨1363, target34⟩, ⟨1443, target35⟩, ⟨1448, target36⟩, ⟨1524, target37⟩, ⟨1547, target38⟩, ⟨1656, target39⟩, ⟨1683, target40⟩, ⟨1684, target41⟩, ⟨1756, target42⟩, ⟨1779, target43⟩, ⟨1940, target44⟩, ⟨1941, target45⟩, ⟨1968, target46⟩, ⟨1969, target47⟩, ⟨2041, target48⟩, ⟨2064, target49⟩, ⟨2300, target50⟩, ⟨2327, target51⟩, ⟨2328, target52⟩, ⟨2444, target53⟩, ⟨2469, target54⟩, ⟨2471, target55⟩, ⟨2488, target56⟩, ⟨2490, target57⟩, ⟨2495, target58⟩, ⟨2499, target59⟩, ⟨2501, target60⟩, ⟨2506, target61⟩, ⟨2507, target62⟩, ⟨2508, target63⟩, ⟨2510, target64⟩, ⟨2515, target65⟩, ⟨2550, target66⟩, ⟨2552, target67⟩, ⟨2566, target68⟩, ⟨2582, target69⟩, ⟨2583, target70⟩, ⟨2585, target71⟩, ⟨2586, target72⟩, ⟨2589, target73⟩, ⟨2596, target74⟩, ⟨2598, target75⟩, ⟨2599, target76⟩, ⟨2606, target77⟩, ⟨2616, target78⟩, ⟨2623, target79⟩, ⟨2625, target80⟩, ⟨2627, target81⟩, ⟨2637, target82⟩, ⟨2639, target83⟩, ⟨2641, target84⟩, ⟨2651, target85⟩, ⟨2652, target86⟩, ⟨2659, target87⟩, ⟨2660, target88⟩, ⟨2685, target89⟩, ⟨2686, target90⟩, ⟨2687, target91⟩, ⟨2688, target92⟩, ⟨2690, target93⟩, ⟨2691, target94⟩, ⟨2694, target95⟩, ⟨2701, target96⟩, ⟨2709, target97⟩, ⟨2710, target98⟩, ⟨2726, target99⟩, ⟨2731, target100⟩, ⟨2732, target101⟩, ⟨2734, target102⟩, ⟨2740, target103⟩, ⟨2744, target104⟩, ⟨2746, target105⟩, ⟨2747, target106⟩, ⟨2748, target107⟩, ⟨2750, target108⟩, ⟨2756, target109⟩, ⟨2762, target110⟩, ⟨2764, target111⟩, ⟨2765, target112⟩, ⟨2767, target113⟩, ⟨2769, target114⟩, ⟨2779, target115⟩, ⟨2781, target116⟩, ⟨2783, target117⟩, ⟨2818, target118⟩, ⟨2823, target119⟩, ⟨2825, target120⟩, ⟨2829, target121⟩, ⟨2844, target122⟩, ⟨2849, target123⟩, ⟨2851, target124⟩, ⟨2855, target125⟩, ⟨2870, target126⟩, ⟨2874, target127⟩]
  indexMask := 15365168169829763556377482299400419778975957544836896081883670745072520036354091810385958123112983090845663720188497506115551176346309091215583823761395922344123823209685575935099862147286288950307483398172266399189967090091369797297804788195734531897424410467652725348462267420871486269705383304562490344027228362841426793872264422196112169754131777789841142062158510024355793626961683729464387067047803555197690648869748090146287926788604993283356273935518117960616858056268742561807055121190995871643949789737874182223731657058898096944590938579489694678584827994554764619363848903025984053272501491066110537441174099918840132978884615482563927776664719290124163475204404772816065529931896001549616601540230588174408053641295613962217758621986711441284809934454105916899307676445058308185435497952299028814006100669566946972155952956573307018093038450884475355136
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

end FranklSmallCyclic.TransportBatches.G041.B000.Data
