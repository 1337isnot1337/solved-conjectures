module

public import Conjectures.FranklSmallCyclicRowCoverage
public import Conjectures.FranklSmallCyclicCanonicalWords
public import Conjectures.FranklSmallCyclicOrbit7Block005Data

/-! 128 literal targets sharing one source proof block.
Original words and row indices are retained; weights may be transported.
-/
@[expose] public section

namespace FranklSmallCyclic.TransportBatches.G005.B000.Data

-- Period 7, original row 21, representative 694.
def source0 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B005.Data.entryAt ⟨42, by decide +kernel⟩

def target0 : Weights.Entry :=
  { word := [0, 0, 1, 4, 8, 12, 12], weights := [1, 0, 0, 1] }

-- Period 7, original row 44, representative 697.
def source1 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B005.Data.entryAt ⟨45, by decide +kernel⟩

def target1 : Weights.Entry :=
  { word := [0, 0, 1, 12, 8, 12, 12], weights := [1, 0, 1, 0] }

-- Period 7, original row 139, representative 764.
def source2 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B005.Data.entryAt ⟨112, by decide +kernel⟩

def target2 : Weights.Entry :=
  { word := [0, 1, 0, 12, 0, 4, 10], weights := [1, 0, 1, 0] }

-- Period 7, original row 298, representative 764.
def source3 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B005.Data.entryAt ⟨112, by decide +kernel⟩

def target3 : Weights.Entry :=
  { word := [0, 2, 0, 8, 1, 4, 10], weights := [0, 1, 1, 0] }

def points3 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6)]

-- Period 7, original row 346, representative 776.
def source4 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B005.Data.entryAt ⟨124, by decide +kernel⟩

def target4 : Weights.Entry :=
  { word := [0, 2, 2, 2, 8, 4, 10], weights := [0, 1, 0, 1] }

-- Period 7, original row 395, representative 779.
def source5 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B005.Data.entryAt ⟨127, by decide +kernel⟩

def target5 : Weights.Entry :=
  { word := [0, 2, 2, 10, 8, 4, 10], weights := [0, 1, 1, 0] }

-- Period 7, original row 444, representative 777.
def source6 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B005.Data.entryAt ⟨125, by decide +kernel⟩

def target6 : Weights.Entry :=
  { word := [0, 2, 10, 2, 8, 4, 10], weights := [0, 1, 0, 1] }

-- Period 7, original row 490, representative 778.
def source7 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B005.Data.entryAt ⟨126, by decide +kernel⟩

def target7 : Weights.Entry :=
  { word := [0, 2, 10, 10, 8, 4, 10], weights := [0, 1, 1, 0] }

-- Period 7, original row 527, representative 686.
def source8 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B005.Data.entryAt ⟨34, by decide +kernel⟩

def target8 : Weights.Entry :=
  { word := [0, 4, 0, 4, 8, 12, 12], weights := [1, 0, 0, 1] }

-- Period 7, original row 550, representative 693.
def source9 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B005.Data.entryAt ⟨41, by decide +kernel⟩

def target9 : Weights.Entry :=
  { word := [0, 4, 0, 12, 8, 12, 12], weights := [1, 0, 1, 0] }

-- Period 7, original row 593, representative 679.
def source10 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B005.Data.entryAt ⟨27, by decide +kernel⟩

def target10 : Weights.Entry :=
  { word := [0, 4, 2, 8, 8, 12, 10], weights := [0, 1, 1, 0] }

-- Period 7, original row 659, representative 684.
def source11 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B005.Data.entryAt ⟨32, by decide +kernel⟩

def target11 : Weights.Entry :=
  { word := [0, 4, 8, 4, 8, 12, 10], weights := [1, 0, 1, 0] }

-- Period 7, original row 660, representative 691.
def source12 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B005.Data.entryAt ⟨39, by decide +kernel⟩

def target12 : Weights.Entry :=
  { word := [0, 4, 8, 4, 8, 12, 12], weights := [1, 0, 0, 1] }

-- Period 7, original row 687, representative 685.
def source13 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B005.Data.entryAt ⟨33, by decide +kernel⟩

def target13 : Weights.Entry :=
  { word := [0, 4, 8, 12, 8, 12, 10], weights := [1, 0, 1, 0] }

-- Period 7, original row 688, representative 692.
def source14 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B005.Data.entryAt ⟨40, by decide +kernel⟩

def target14 : Weights.Entry :=
  { word := [0, 4, 8, 12, 8, 12, 12], weights := [1, 0, 1, 0] }

-- Period 7, original row 713, representative 678.
def source15 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B005.Data.entryAt ⟨26, by decide +kernel⟩

def target15 : Weights.Entry :=
  { word := [0, 4, 10, 8, 8, 12, 10], weights := [0, 1, 1, 0] }

-- Period 7, original row 755, representative 771.
def source16 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B005.Data.entryAt ⟨119, by decide +kernel⟩

def target16 : Weights.Entry :=
  { word := [0, 6, 2, 8, 8, 4, 10], weights := [0, 1, 1, 0] }

-- Period 7, original row 782, representative 770.
def source17 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B005.Data.entryAt ⟨118, by decide +kernel⟩

def target17 : Weights.Entry :=
  { word := [0, 6, 10, 8, 8, 4, 10], weights := [0, 1, 1, 0] }

-- Period 7, original row 800, representative 700.
def source18 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B005.Data.entryAt ⟨48, by decide +kernel⟩

def target18 : Weights.Entry :=
  { word := [0, 8, 0, 0, 1, 12, 12], weights := [0, 0, 1, 1] }

-- Period 7, original row 804, representative 680.
def source19 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B005.Data.entryAt ⟨28, by decide +kernel⟩

def target19 : Weights.Entry :=
  { word := [0, 8, 0, 0, 9, 12, 12], weights := [0, 0, 1, 1] }

-- Period 7, original row 812, representative 700.
def source20 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B005.Data.entryAt ⟨48, by decide +kernel⟩

def target20 : Weights.Entry :=
  { word := [0, 8, 0, 4, 0, 12, 12], weights := [0, 0, 1, 1] }

def points20 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6)]

-- Period 7, original row 838, representative 698.
def source21 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B005.Data.entryAt ⟨46, by decide +kernel⟩

def target21 : Weights.Entry :=
  { word := [0, 8, 0, 4, 8, 12, 12], weights := [1, 0, 0, 1] }

-- Period 7, original row 860, representative 701.
def source22 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B005.Data.entryAt ⟨49, by decide +kernel⟩

def target22 : Weights.Entry :=
  { word := [0, 8, 0, 8, 1, 12, 12], weights := [0, 1, 1, 0] }

-- Period 7, original row 867, representative 702.
def source23 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B005.Data.entryAt ⟨50, by decide +kernel⟩

def target23 : Weights.Entry :=
  { word := [0, 8, 0, 8, 8, 12, 12], weights := [0, 1, 0, 1] }

-- Period 7, original row 871, representative 681.
def source24 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B005.Data.entryAt ⟨29, by decide +kernel⟩

def target24 : Weights.Entry :=
  { word := [0, 8, 0, 8, 9, 12, 12], weights := [0, 1, 1, 0] }

-- Period 7, original row 881, representative 701.
def source25 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B005.Data.entryAt ⟨49, by decide +kernel⟩

def target25 : Weights.Entry :=
  { word := [0, 8, 0, 12, 0, 12, 12], weights := [1, 0, 1, 0] }

def points25 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6)]

-- Period 7, original row 890, representative 699.
def source26 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B005.Data.entryAt ⟨47, by decide +kernel⟩

def target26 : Weights.Entry :=
  { word := [0, 8, 0, 12, 8, 12, 12], weights := [1, 0, 1, 0] }

-- Period 7, original row 913, representative 695.
def source27 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B005.Data.entryAt ⟨43, by decide +kernel⟩

def target27 : Weights.Entry :=
  { word := [0, 8, 1, 4, 8, 12, 12], weights := [1, 0, 0, 1] }

-- Period 7, original row 936, representative 696.
def source28 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B005.Data.entryAt ⟨44, by decide +kernel⟩

def target28 : Weights.Entry :=
  { word := [0, 8, 1, 12, 8, 12, 12], weights := [1, 0, 1, 0] }

-- Period 7, original row 1007, representative 673.
def source29 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B005.Data.entryAt ⟨21, by decide +kernel⟩

def target29 : Weights.Entry :=
  { word := [0, 8, 4, 8, 4, 12, 12], weights := [0, 1, 0, 1] }

-- Period 7, original row 1011, representative 671.
def source30 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B005.Data.entryAt ⟨19, by decide +kernel⟩

def target30 : Weights.Entry :=
  { word := [0, 8, 4, 8, 12, 12, 12], weights := [0, 1, 0, 1] }

-- Period 7, original row 1058, representative 675.
def source31 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B005.Data.entryAt ⟨23, by decide +kernel⟩

def target31 : Weights.Entry :=
  { word := [0, 8, 8, 8, 4, 12, 12], weights := [0, 1, 0, 1] }

-- Period 7, original row 1063, representative 674.
def source32 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B005.Data.entryAt ⟨22, by decide +kernel⟩

def target32 : Weights.Entry :=
  { word := [0, 8, 8, 8, 12, 12, 12], weights := [0, 1, 0, 1] }

-- Period 7, original row 1121, representative 672.
def source33 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B005.Data.entryAt ⟨20, by decide +kernel⟩

def target33 : Weights.Entry :=
  { word := [0, 8, 12, 8, 4, 12, 12], weights := [0, 1, 0, 1] }

-- Period 7, original row 1125, representative 670.
def source34 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B005.Data.entryAt ⟨18, by decide +kernel⟩

def target34 : Weights.Entry :=
  { word := [0, 8, 12, 8, 12, 12, 12], weights := [0, 1, 0, 1] }

-- Period 7, original row 1171, representative 761.
def source35 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B005.Data.entryAt ⟨109, by decide +kernel⟩

def target35 : Weights.Entry :=
  { word := [0, 9, 0, 4, 8, 4, 10], weights := [1, 0, 1, 0] }

-- Period 7, original row 1205, representative 763.
def source36 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B005.Data.entryAt ⟨111, by decide +kernel⟩

def target36 : Weights.Entry :=
  { word := [0, 9, 0, 12, 0, 4, 10], weights := [1, 0, 1, 0] }

-- Period 7, original row 1230, representative 762.
def source37 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B005.Data.entryAt ⟨110, by decide +kernel⟩

def target37 : Weights.Entry :=
  { word := [0, 9, 0, 12, 8, 4, 10], weights := [1, 0, 1, 0] }

-- Period 7, original row 1347, representative 763.
def source38 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B005.Data.entryAt ⟨111, by decide +kernel⟩

def target38 : Weights.Entry :=
  { word := [0, 10, 0, 8, 1, 4, 10], weights := [0, 1, 1, 0] }

def points38 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6)]

-- Period 7, original row 1389, representative 772.
def source39 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B005.Data.entryAt ⟨120, by decide +kernel⟩

def target39 : Weights.Entry :=
  { word := [0, 10, 2, 2, 8, 4, 10], weights := [0, 1, 0, 1] }

-- Period 7, original row 1421, representative 775.
def source40 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B005.Data.entryAt ⟨123, by decide +kernel⟩

def target40 : Weights.Entry :=
  { word := [0, 10, 2, 10, 8, 4, 10], weights := [0, 1, 1, 0] }

-- Period 7, original row 1464, representative 773.
def source41 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B005.Data.entryAt ⟨121, by decide +kernel⟩

def target41 : Weights.Entry :=
  { word := [0, 10, 10, 2, 8, 4, 10], weights := [0, 1, 0, 1] }

-- Period 7, original row 1489, representative 774.
def source42 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B005.Data.entryAt ⟨122, by decide +kernel⟩

def target42 : Weights.Entry :=
  { word := [0, 10, 10, 10, 8, 4, 10], weights := [0, 1, 1, 0] }

-- Period 7, original row 1526, representative 687.
def source43 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B005.Data.entryAt ⟨35, by decide +kernel⟩

def target43 : Weights.Entry :=
  { word := [0, 12, 0, 4, 8, 12, 12], weights := [1, 0, 0, 1] }

-- Period 7, original row 1549, representative 690.
def source44 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B005.Data.entryAt ⟨38, by decide +kernel⟩

def target44 : Weights.Entry :=
  { word := [0, 12, 0, 12, 8, 12, 12], weights := [1, 0, 1, 0] }

-- Period 7, original row 1592, representative 677.
def source45 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B005.Data.entryAt ⟨25, by decide +kernel⟩

def target45 : Weights.Entry :=
  { word := [0, 12, 2, 8, 8, 12, 10], weights := [0, 1, 1, 0] }

-- Period 7, original row 1658, representative 682.
def source46 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B005.Data.entryAt ⟨30, by decide +kernel⟩

def target46 : Weights.Entry :=
  { word := [0, 12, 8, 4, 8, 12, 10], weights := [1, 0, 1, 0] }

-- Period 7, original row 1659, representative 688.
def source47 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B005.Data.entryAt ⟨36, by decide +kernel⟩

def target47 : Weights.Entry :=
  { word := [0, 12, 8, 4, 8, 12, 12], weights := [1, 0, 0, 1] }

-- Period 7, original row 1686, representative 683.
def source48 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B005.Data.entryAt ⟨31, by decide +kernel⟩

def target48 : Weights.Entry :=
  { word := [0, 12, 8, 12, 8, 12, 10], weights := [1, 0, 1, 0] }

-- Period 7, original row 1687, representative 689.
def source49 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B005.Data.entryAt ⟨37, by decide +kernel⟩

def target49 : Weights.Entry :=
  { word := [0, 12, 8, 12, 8, 12, 12], weights := [1, 0, 1, 0] }

-- Period 7, original row 1712, representative 676.
def source50 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B005.Data.entryAt ⟨24, by decide +kernel⟩

def target50 : Weights.Entry :=
  { word := [0, 12, 10, 8, 8, 12, 10], weights := [0, 1, 1, 0] }

-- Period 7, original row 1758, representative 694.
def source51 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B005.Data.entryAt ⟨42, by decide +kernel⟩

def target51 : Weights.Entry :=
  { word := [1, 0, 1, 4, 8, 12, 12], weights := [1, 0, 0, 1] }

def points51 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 1781, representative 697.
def source52 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B005.Data.entryAt ⟨45, by decide +kernel⟩

def target52 : Weights.Entry :=
  { word := [1, 0, 1, 12, 8, 12, 12], weights := [1, 0, 1, 0] }

def points52 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 1882, representative 679.
def source53 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B005.Data.entryAt ⟨27, by decide +kernel⟩

def target53 : Weights.Entry :=
  { word := [1, 4, 2, 8, 8, 12, 10], weights := [0, 1, 1, 0] }

def points53 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 1943, representative 684.
def source54 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B005.Data.entryAt ⟨32, by decide +kernel⟩

def target54 : Weights.Entry :=
  { word := [1, 4, 8, 4, 8, 12, 10], weights := [1, 0, 1, 0] }

def points54 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 1944, representative 691.
def source55 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B005.Data.entryAt ⟨39, by decide +kernel⟩

def target55 : Weights.Entry :=
  { word := [1, 4, 8, 4, 8, 12, 12], weights := [1, 0, 0, 1] }

def points55 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 1971, representative 685.
def source56 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B005.Data.entryAt ⟨33, by decide +kernel⟩

def target56 : Weights.Entry :=
  { word := [1, 4, 8, 12, 8, 12, 10], weights := [1, 0, 1, 0] }

def points56 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 1972, representative 692.
def source57 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B005.Data.entryAt ⟨40, by decide +kernel⟩

def target57 : Weights.Entry :=
  { word := [1, 4, 8, 12, 8, 12, 12], weights := [1, 0, 1, 0] }

def points57 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 1997, representative 678.
def source58 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B005.Data.entryAt ⟨26, by decide +kernel⟩

def target58 : Weights.Entry :=
  { word := [1, 4, 10, 8, 8, 12, 10], weights := [0, 1, 1, 0] }

def points58 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 2043, representative 695.
def source59 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B005.Data.entryAt ⟨43, by decide +kernel⟩

def target59 : Weights.Entry :=
  { word := [1, 8, 1, 4, 8, 12, 12], weights := [1, 0, 0, 1] }

def points59 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 2066, representative 696.
def source60 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B005.Data.entryAt ⟨44, by decide +kernel⟩

def target60 : Weights.Entry :=
  { word := [1, 8, 1, 12, 8, 12, 12], weights := [1, 0, 1, 0] }

def points60 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 2241, representative 677.
def source61 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B005.Data.entryAt ⟨25, by decide +kernel⟩

def target61 : Weights.Entry :=
  { word := [1, 12, 2, 8, 8, 12, 10], weights := [0, 1, 1, 0] }

def points61 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 2302, representative 682.
def source62 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B005.Data.entryAt ⟨30, by decide +kernel⟩

def target62 : Weights.Entry :=
  { word := [1, 12, 8, 4, 8, 12, 10], weights := [1, 0, 1, 0] }

def points62 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 2303, representative 688.
def source63 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B005.Data.entryAt ⟨36, by decide +kernel⟩

def target63 : Weights.Entry :=
  { word := [1, 12, 8, 4, 8, 12, 12], weights := [1, 0, 0, 1] }

def points63 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 2330, representative 683.
def source64 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B005.Data.entryAt ⟨31, by decide +kernel⟩

def target64 : Weights.Entry :=
  { word := [1, 12, 8, 12, 8, 12, 10], weights := [1, 0, 1, 0] }

def points64 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 2331, representative 689.
def source65 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B005.Data.entryAt ⟨37, by decide +kernel⟩

def target65 : Weights.Entry :=
  { word := [1, 12, 8, 12, 8, 12, 12], weights := [1, 0, 1, 0] }

def points65 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 2356, representative 676.
def source66 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B005.Data.entryAt ⟨24, by decide +kernel⟩

def target66 : Weights.Entry :=
  { word := [1, 12, 10, 8, 8, 12, 10], weights := [0, 1, 1, 0] }

def points66 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 2388, representative 723.
def source67 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B005.Data.entryAt ⟨71, by decide +kernel⟩

def target67 : Weights.Entry :=
  { word := [2, 0, 0, 9, 4, 4, 12], weights := [1, 0, 1, 1] }

-- Period 7, original row 2392, representative 721.
def source68 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B005.Data.entryAt ⟨69, by decide +kernel⟩

def target68 : Weights.Entry :=
  { word := [2, 0, 0, 9, 12, 4, 12], weights := [1, 0, 1, 1] }

-- Period 7, original row 2400, representative 719.
def source69 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B005.Data.entryAt ⟨67, by decide +kernel⟩

def target69 : Weights.Entry :=
  { word := [2, 0, 0, 12, 0, 4, 10], weights := [1, 0, 1, 0] }

-- Period 7, original row 2401, representative 719.
def source70 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B005.Data.entryAt ⟨67, by decide +kernel⟩

def target70 : Weights.Entry :=
  { word := [2, 0, 0, 12, 0, 4, 12], weights := [1, 0, 1, 0] }

def points70 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 2449, representative 729.
def source71 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B005.Data.entryAt ⟨77, by decide +kernel⟩

def target71 : Weights.Entry :=
  { word := [2, 0, 4, 10, 8, 4, 12], weights := [1, 0, 1, 1] }

-- Period 7, original row 2473, representative 716.
def source72 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B005.Data.entryAt ⟨64, by decide +kernel⟩

def target72 : Weights.Entry :=
  { word := [2, 0, 8, 4, 8, 4, 12], weights := [1, 0, 0, 1] }

-- Period 7, original row 2477, representative 722.
def source73 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B005.Data.entryAt ⟨70, by decide +kernel⟩

def target73 : Weights.Entry :=
  { word := [2, 0, 8, 9, 4, 4, 12], weights := [1, 0, 1, 1] }

-- Period 7, original row 2481, representative 720.
def source74 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B005.Data.entryAt ⟨68, by decide +kernel⟩

def target74 : Weights.Entry :=
  { word := [2, 0, 8, 9, 12, 4, 12], weights := [1, 0, 1, 1] }

-- Period 7, original row 2491, representative 718.
def source75 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B005.Data.entryAt ⟨66, by decide +kernel⟩

def target75 : Weights.Entry :=
  { word := [2, 0, 8, 12, 0, 4, 10], weights := [1, 0, 1, 0] }

-- Period 7, original row 2492, representative 718.
def source76 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B005.Data.entryAt ⟨66, by decide +kernel⟩

def target76 : Weights.Entry :=
  { word := [2, 0, 8, 12, 0, 4, 12], weights := [1, 0, 1, 0] }

def points76 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 2503, representative 717.
def source77 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B005.Data.entryAt ⟨65, by decide +kernel⟩

def target77 : Weights.Entry :=
  { word := [2, 0, 8, 12, 8, 4, 12], weights := [1, 0, 1, 0] }

-- Period 7, original row 2511, representative 731.
def source78 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B005.Data.entryAt ⟨79, by decide +kernel⟩

def target78 : Weights.Entry :=
  { word := [2, 0, 9, 8, 1, 4, 10], weights := [1, 0, 1, 1] }

-- Period 7, original row 2512, representative 731.
def source79 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B005.Data.entryAt ⟨79, by decide +kernel⟩

def target79 : Weights.Entry :=
  { word := [2, 0, 9, 8, 1, 4, 12], weights := [1, 0, 1, 1] }

def points79 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 2519, representative 730.
def source80 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B005.Data.entryAt ⟨78, by decide +kernel⟩

def target80 : Weights.Entry :=
  { word := [2, 0, 9, 8, 9, 4, 12], weights := [1, 0, 1, 1] }

-- Period 7, original row 2553, representative 731.
def source81 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B005.Data.entryAt ⟨79, by decide +kernel⟩

def target81 : Weights.Entry :=
  { word := [2, 0, 12, 10, 0, 4, 10], weights := [1, 0, 1, 1] }

def points81 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 5), (4, 4), (5, 3), (6, 6)]

-- Period 7, original row 2554, representative 731.
def source82 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B005.Data.entryAt ⟨79, by decide +kernel⟩

def target82 : Weights.Entry :=
  { word := [2, 0, 12, 10, 0, 4, 12], weights := [1, 0, 1, 1] }

def points82 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 2), (3, 5), (4, 4), (5, 3), (6, 6)]

-- Period 7, original row 2571, representative 728.
def source83 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B005.Data.entryAt ⟨76, by decide +kernel⟩

def target83 : Weights.Entry :=
  { word := [2, 0, 12, 10, 8, 4, 12], weights := [1, 0, 1, 1] }

-- Period 7, original row 2603, representative 764.
def source84 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B005.Data.entryAt ⟨112, by decide +kernel⟩

def target84 : Weights.Entry :=
  { word := [2, 2, 0, 10, 0, 0, 10], weights := [1, 1, 0, 0] }

def points84 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 3), (4, 5), (5, 4), (6, 6)]

-- Period 7, original row 2664, representative 757.
def source85 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B005.Data.entryAt ⟨105, by decide +kernel⟩

def target85 : Weights.Entry :=
  { word := [2, 2, 8, 2, 0, 8, 10], weights := [1, 0, 0, 1] }

-- Period 7, original row 2714, representative 758.
def source86 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B005.Data.entryAt ⟨106, by decide +kernel⟩

def target86 : Weights.Entry :=
  { word := [2, 2, 8, 10, 0, 8, 10], weights := [1, 0, 0, 1] }

-- Period 7, original row 2826, representative 710.
def source87 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B005.Data.entryAt ⟨58, by decide +kernel⟩

def target87 : Weights.Entry :=
  { word := [2, 8, 0, 4, 8, 4, 10], weights := [1, 0, 1, 0] }

-- Period 7, original row 2827, representative 704.
def source88 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B005.Data.entryAt ⟨52, by decide +kernel⟩

def target88 : Weights.Entry :=
  { word := [2, 8, 0, 4, 8, 4, 12], weights := [1, 0, 0, 1] }

-- Period 7, original row 2852, representative 715.
def source89 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B005.Data.entryAt ⟨63, by decide +kernel⟩

def target89 : Weights.Entry :=
  { word := [2, 8, 0, 12, 0, 4, 10], weights := [1, 0, 1, 0] }

-- Period 7, original row 2853, representative 709.
def source90 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B005.Data.entryAt ⟨57, by decide +kernel⟩

def target90 : Weights.Entry :=
  { word := [2, 8, 0, 12, 0, 4, 12], weights := [1, 0, 1, 0] }

-- Period 7, original row 2877, representative 713.
def source91 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B005.Data.entryAt ⟨61, by decide +kernel⟩

def target91 : Weights.Entry :=
  { word := [2, 8, 0, 12, 8, 4, 10], weights := [1, 0, 1, 0] }

-- Period 7, original row 2878, representative 707.
def source92 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B005.Data.entryAt ⟨55, by decide +kernel⟩

def target92 : Weights.Entry :=
  { word := [2, 8, 0, 12, 8, 4, 12], weights := [1, 0, 1, 0] }

-- Period 7, original row 2992, representative 711.
def source93 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B005.Data.entryAt ⟨59, by decide +kernel⟩

def target93 : Weights.Entry :=
  { word := [2, 8, 8, 4, 8, 4, 10], weights := [1, 0, 1, 0] }

-- Period 7, original row 2993, representative 705.
def source94 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B005.Data.entryAt ⟨53, by decide +kernel⟩

def target94 : Weights.Entry :=
  { word := [2, 8, 8, 4, 8, 4, 12], weights := [1, 0, 0, 1] }

-- Period 7, original row 3018, representative 734.
def source95 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B005.Data.entryAt ⟨82, by decide +kernel⟩

def target95 : Weights.Entry :=
  { word := [2, 8, 8, 8, 1, 4, 10], weights := [1, 0, 1, 1] }

-- Period 7, original row 3019, representative 733.
def source96 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B005.Data.entryAt ⟨81, by decide +kernel⟩

def target96 : Weights.Entry :=
  { word := [2, 8, 8, 8, 1, 4, 12], weights := [1, 0, 1, 1] }

-- Period 7, original row 3026, representative 732.
def source97 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B005.Data.entryAt ⟨80, by decide +kernel⟩

def target97 : Weights.Entry :=
  { word := [2, 8, 8, 8, 9, 4, 12], weights := [1, 0, 1, 1] }

-- Period 7, original row 3036, representative 714.
def source98 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B005.Data.entryAt ⟨62, by decide +kernel⟩

def target98 : Weights.Entry :=
  { word := [2, 8, 8, 12, 0, 4, 10], weights := [1, 0, 1, 0] }

-- Period 7, original row 3037, representative 708.
def source99 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B005.Data.entryAt ⟨56, by decide +kernel⟩

def target99 : Weights.Entry :=
  { word := [2, 8, 8, 12, 0, 4, 12], weights := [1, 0, 1, 0] }

-- Period 7, original row 3065, representative 712.
def source100 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B005.Data.entryAt ⟨60, by decide +kernel⟩

def target100 : Weights.Entry :=
  { word := [2, 8, 8, 12, 8, 4, 10], weights := [1, 0, 1, 0] }

-- Period 7, original row 3066, representative 706.
def source101 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B005.Data.entryAt ⟨54, by decide +kernel⟩

def target101 : Weights.Entry :=
  { word := [2, 8, 8, 12, 8, 4, 12], weights := [1, 0, 1, 0] }

-- Period 7, original row 3093, representative 726.
def source102 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B005.Data.entryAt ⟨74, by decide +kernel⟩

def target102 : Weights.Entry :=
  { word := [2, 8, 9, 8, 1, 4, 10], weights := [1, 0, 1, 1] }

-- Period 7, original row 3094, representative 725.
def source103 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B005.Data.entryAt ⟨73, by decide +kernel⟩

def target103 : Weights.Entry :=
  { word := [2, 8, 9, 8, 1, 4, 12], weights := [1, 0, 1, 1] }

-- Period 7, original row 3101, representative 724.
def source104 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B005.Data.entryAt ⟨72, by decide +kernel⟩

def target104 : Weights.Entry :=
  { word := [2, 8, 9, 8, 9, 4, 12], weights := [1, 0, 1, 1] }

-- Period 7, original row 3153, representative 727.
def source105 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B005.Data.entryAt ⟨75, by decide +kernel⟩

def target105 : Weights.Entry :=
  { word := [2, 8, 12, 10, 8, 4, 12], weights := [2, 1, 1, 2] }

-- Period 7, original row 3179, representative 741.
def source106 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B005.Data.entryAt ⟨89, by decide +kernel⟩

def target106 : Weights.Entry :=
  { word := [2, 10, 0, 9, 8, 2, 10], weights := [1, 1, 0, 1] }

-- Period 7, original row 3186, representative 739.
def source107 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B005.Data.entryAt ⟨87, by decide +kernel⟩

def target107 : Weights.Entry :=
  { word := [2, 10, 0, 9, 8, 10, 10], weights := [1, 1, 0, 1] }

-- Period 7, original row 3192, representative 737.
def source108 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B005.Data.entryAt ⟨85, by decide +kernel⟩

def target108 : Weights.Entry :=
  { word := [2, 10, 0, 10, 0, 0, 10], weights := [1, 1, 0, 0] }

-- Period 7, original row 3209, representative 747.
def source109 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B005.Data.entryAt ⟨95, by decide +kernel⟩

def target109 : Weights.Entry :=
  { word := [2, 10, 0, 12, 2, 0, 10], weights := [1, 1, 1, 0] }

-- Period 7, original row 3217, representative 745.
def source110 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B005.Data.entryAt ⟨93, by decide +kernel⟩

def target110 : Weights.Entry :=
  { word := [2, 10, 0, 12, 10, 0, 10], weights := [1, 1, 1, 0] }

-- Period 7, original row 3225, representative 751.
def source111 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B005.Data.entryAt ⟨99, by decide +kernel⟩

def target111 : Weights.Entry :=
  { word := [2, 10, 2, 8, 1, 0, 10], weights := [1, 1, 0, 1] }

-- Period 7, original row 3239, representative 749.
def source112 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B005.Data.entryAt ⟨97, by decide +kernel⟩

def target112 : Weights.Entry :=
  { word := [2, 10, 2, 8, 9, 0, 10], weights := [1, 1, 0, 1] }

-- Period 7, original row 3259, representative 735.
def source113 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B005.Data.entryAt ⟨83, by decide +kernel⟩

def target113 : Weights.Entry :=
  { word := [2, 10, 8, 2, 0, 8, 10], weights := [1, 0, 0, 1] }

-- Period 7, original row 3290, representative 740.
def source114 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B005.Data.entryAt ⟨88, by decide +kernel⟩

def target114 : Weights.Entry :=
  { word := [2, 10, 8, 9, 8, 2, 10], weights := [1, 1, 0, 1] }

-- Period 7, original row 3297, representative 738.
def source115 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B005.Data.entryAt ⟨86, by decide +kernel⟩

def target115 : Weights.Entry :=
  { word := [2, 10, 8, 9, 8, 10, 10], weights := [1, 1, 0, 1] }

-- Period 7, original row 3309, representative 736.
def source116 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B005.Data.entryAt ⟨84, by decide +kernel⟩

def target116 : Weights.Entry :=
  { word := [2, 10, 8, 10, 0, 8, 10], weights := [1, 0, 0, 1] }

-- Period 7, original row 3333, representative 746.
def source117 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B005.Data.entryAt ⟨94, by decide +kernel⟩

def target117 : Weights.Entry :=
  { word := [2, 10, 8, 12, 2, 0, 10], weights := [1, 1, 1, 0] }

-- Period 7, original row 3338, representative 743.
def source118 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B005.Data.entryAt ⟨91, by decide +kernel⟩

def target118 : Weights.Entry :=
  { word := [2, 10, 8, 12, 2, 8, 10], weights := [1, 1, 1, 1] }

-- Period 7, original row 3346, representative 703.
def source119 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B005.Data.entryAt ⟨51, by decide +kernel⟩

def target119 : Weights.Entry :=
  { word := [2, 10, 8, 12, 8, 4, 10], weights := [2, 1, 2, 1] }

-- Period 7, original row 3355, representative 744.
def source120 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B005.Data.entryAt ⟨92, by decide +kernel⟩

def target120 : Weights.Entry :=
  { word := [2, 10, 8, 12, 10, 0, 10], weights := [1, 1, 1, 0] }

-- Period 7, original row 3360, representative 742.
def source121 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B005.Data.entryAt ⟨90, by decide +kernel⟩

def target121 : Weights.Entry :=
  { word := [2, 10, 8, 12, 10, 8, 10], weights := [1, 1, 1, 1] }

-- Period 7, original row 3371, representative 750.
def source122 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B005.Data.entryAt ⟨98, by decide +kernel⟩

def target122 : Weights.Entry :=
  { word := [2, 10, 10, 8, 1, 0, 10], weights := [1, 1, 0, 1] }

-- Period 7, original row 3385, representative 748.
def source123 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B005.Data.entryAt ⟨96, by decide +kernel⟩

def target123 : Weights.Entry :=
  { word := [2, 10, 10, 8, 9, 0, 10], weights := [1, 1, 0, 1] }

-- Period 7, original row 3411, representative 764.
def source124 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B005.Data.entryAt ⟨112, by decide +kernel⟩

def target124 : Weights.Entry :=
  { word := [4, 0, 0, 12, 0, 4, 12], weights := [1, 0, 1, 0] }

def points124 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 3588, representative 764.
def source125 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B005.Data.entryAt ⟨112, by decide +kernel⟩

def target125 : Weights.Entry :=
  { word := [4, 2, 0, 10, 0, 0, 9], weights := [1, 1, 0, 0] }

def points125 : List (ℕ × ℕ) := [(0, 1), (1, 2), (2, 0), (3, 3), (4, 5), (5, 4), (6, 6)]

-- Period 7, original row 3595, representative 756.
def source126 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B005.Data.entryAt ⟨104, by decide +kernel⟩

def target126 : Weights.Entry :=
  { word := [4, 2, 0, 10, 0, 8, 9], weights := [1, 0, 0, 1] }

-- Period 7, original row 3618, representative 754.
def source127 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B005.Data.entryAt ⟨102, by decide +kernel⟩

def target127 : Weights.Entry :=
  { word := [4, 2, 8, 2, 0, 8, 9], weights := [1, 0, 0, 1] }

def period7Entries : List Weights.Entry := [target0, target1, target2, target3, target4, target5, target6, target7, target8, target9, target10, target11, target12, target13, target14, target15, target16, target17, target18, target19, target20, target21, target22, target23, target24, target25, target26, target27, target28, target29, target30, target31, target32, target33, target34, target35, target36, target37, target38, target39, target40, target41, target42, target43, target44, target45, target46, target47, target48, target49, target50, target51, target52, target53, target54, target55, target56, target57, target58, target59, target60, target61, target62, target63, target64, target65, target66, target67, target68, target69, target70, target71, target72, target73, target74, target75, target76, target77, target78, target79, target80, target81, target82, target83, target84, target85, target86, target87, target88, target89, target90, target91, target92, target93, target94, target95, target96, target97, target98, target99, target100, target101, target102, target103, target104, target105, target106, target107, target108, target109, target110, target111, target112, target113, target114, target115, target116, target117, target118, target119, target120, target121, target122, target123, target124, target125, target126, target127]

def period7Chunk : RowCoverage.Chunk where
  rows := [⟨21, target0⟩, ⟨44, target1⟩, ⟨139, target2⟩, ⟨298, target3⟩, ⟨346, target4⟩, ⟨395, target5⟩, ⟨444, target6⟩, ⟨490, target7⟩, ⟨527, target8⟩, ⟨550, target9⟩, ⟨593, target10⟩, ⟨659, target11⟩, ⟨660, target12⟩, ⟨687, target13⟩, ⟨688, target14⟩, ⟨713, target15⟩, ⟨755, target16⟩, ⟨782, target17⟩, ⟨800, target18⟩, ⟨804, target19⟩, ⟨812, target20⟩, ⟨838, target21⟩, ⟨860, target22⟩, ⟨867, target23⟩, ⟨871, target24⟩, ⟨881, target25⟩, ⟨890, target26⟩, ⟨913, target27⟩, ⟨936, target28⟩, ⟨1007, target29⟩, ⟨1011, target30⟩, ⟨1058, target31⟩, ⟨1063, target32⟩, ⟨1121, target33⟩, ⟨1125, target34⟩, ⟨1171, target35⟩, ⟨1205, target36⟩, ⟨1230, target37⟩, ⟨1347, target38⟩, ⟨1389, target39⟩, ⟨1421, target40⟩, ⟨1464, target41⟩, ⟨1489, target42⟩, ⟨1526, target43⟩, ⟨1549, target44⟩, ⟨1592, target45⟩, ⟨1658, target46⟩, ⟨1659, target47⟩, ⟨1686, target48⟩, ⟨1687, target49⟩, ⟨1712, target50⟩, ⟨1758, target51⟩, ⟨1781, target52⟩, ⟨1882, target53⟩, ⟨1943, target54⟩, ⟨1944, target55⟩, ⟨1971, target56⟩, ⟨1972, target57⟩, ⟨1997, target58⟩, ⟨2043, target59⟩, ⟨2066, target60⟩, ⟨2241, target61⟩, ⟨2302, target62⟩, ⟨2303, target63⟩, ⟨2330, target64⟩, ⟨2331, target65⟩, ⟨2356, target66⟩, ⟨2388, target67⟩, ⟨2392, target68⟩, ⟨2400, target69⟩, ⟨2401, target70⟩, ⟨2449, target71⟩, ⟨2473, target72⟩, ⟨2477, target73⟩, ⟨2481, target74⟩, ⟨2491, target75⟩, ⟨2492, target76⟩, ⟨2503, target77⟩, ⟨2511, target78⟩, ⟨2512, target79⟩, ⟨2519, target80⟩, ⟨2553, target81⟩, ⟨2554, target82⟩, ⟨2571, target83⟩, ⟨2603, target84⟩, ⟨2664, target85⟩, ⟨2714, target86⟩, ⟨2826, target87⟩, ⟨2827, target88⟩, ⟨2852, target89⟩, ⟨2853, target90⟩, ⟨2877, target91⟩, ⟨2878, target92⟩, ⟨2992, target93⟩, ⟨2993, target94⟩, ⟨3018, target95⟩, ⟨3019, target96⟩, ⟨3026, target97⟩, ⟨3036, target98⟩, ⟨3037, target99⟩, ⟨3065, target100⟩, ⟨3066, target101⟩, ⟨3093, target102⟩, ⟨3094, target103⟩, ⟨3101, target104⟩, ⟨3153, target105⟩, ⟨3179, target106⟩, ⟨3186, target107⟩, ⟨3192, target108⟩, ⟨3209, target109⟩, ⟨3217, target110⟩, ⟨3225, target111⟩, ⟨3239, target112⟩, ⟨3259, target113⟩, ⟨3290, target114⟩, ⟨3297, target115⟩, ⟨3309, target116⟩, ⟨3333, target117⟩, ⟨3338, target118⟩, ⟨3346, target119⟩, ⟨3355, target120⟩, ⟨3360, target121⟩, ⟨3371, target122⟩, ⟨3385, target123⟩, ⟨3411, target124⟩, ⟨3588, target125⟩, ⟨3595, target126⟩, ⟨3618, target127⟩]
  indexMask := 1338210288309038859470116905998687876402480014498206062980362048536344273474755454615837333984787384774051643076801716914414202025091438326157376895322329920406438315205341731489491222171092816415718803893024118266358923210322486207843395768483666384228967483161308358750040936594071867432318892799600659635146284856973698722150016166548542754495397771115386907497271150486027912535293364192180129315902578624604836175487748996903979475960563145912110666396536995817652208076127870750258028900408706917525380684095209740698345363548475123771160434460060853317441403358694205367664608596093958136576754659388459025837523550093159604039773192528277564509400665767398213169963669855602703466289100608152193445120055651203282322645498162502162642644533031264099265980976936671699576536183226455151685056559228013872106898695276174316823058366090413329354950653944432652533677887888386746856672626517082211915715499530656745072079737572014993380698916639229968256061996915000581919900285773351403143355612948582578652168047219527230174904786062503222355254972340014516676265603009740474725433344
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

end FranklSmallCyclic.TransportBatches.G005.B000.Data
