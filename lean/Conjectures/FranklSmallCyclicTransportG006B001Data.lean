module

public import Conjectures.FranklSmallCyclicRowCoverage
public import Conjectures.FranklSmallCyclicCanonicalWords
public import Conjectures.FranklSmallCyclicOrbit7Block006Data

/-! 128 literal targets sharing one source proof block.
Original words and row indices are retained; weights may be transported.
-/
@[expose] public section

namespace FranklSmallCyclic.TransportBatches.G006.B001.Data

-- Period 7, original row 6014, representative 834.
def source0 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B006.Data.entryAt ⟨53, by decide +kernel⟩

def target0 : Weights.Entry :=
  { word := [8, 9, 8, 4, 12, 4, 8], weights := [1, 0, 0, 1] }

def points0 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 6016, representative 809.
def source1 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B006.Data.entryAt ⟨28, by decide +kernel⟩

def target1 : Weights.Entry :=
  { word := [8, 9, 8, 4, 12, 12, 8], weights := [1, 0, 0, 1] }

-- Period 7, original row 6022, representative 908.
def source2 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B006.Data.entryAt ⟨127, by decide +kernel⟩

def target2 : Weights.Entry :=
  { word := [8, 9, 8, 8, 12, 6, 0], weights := [0, 1, 1, 0] }

def points2 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 6036, representative 836.
def source3 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B006.Data.entryAt ⟨55, by decide +kernel⟩

def target3 : Weights.Entry :=
  { word := [8, 9, 8, 12, 4, 4, 8], weights := [1, 0, 0, 1] }

def points3 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 6038, representative 811.
def source4 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B006.Data.entryAt ⟨30, by decide +kernel⟩

def target4 : Weights.Entry :=
  { word := [8, 9, 8, 12, 4, 12, 8], weights := [1, 0, 0, 1] }

-- Period 7, original row 6043, representative 835.
def source5 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B006.Data.entryAt ⟨54, by decide +kernel⟩

def target5 : Weights.Entry :=
  { word := [8, 9, 8, 12, 12, 4, 8], weights := [1, 0, 0, 1] }

def points5 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 6045, representative 810.
def source6 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B006.Data.entryAt ⟨29, by decide +kernel⟩

def target6 : Weights.Entry :=
  { word := [8, 9, 8, 12, 12, 12, 8], weights := [1, 0, 0, 1] }

-- Period 7, original row 6065, representative 828.
def source7 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B006.Data.entryAt ⟨47, by decide +kernel⟩

def target7 : Weights.Entry :=
  { word := [8, 10, 0, 1, 8, 2, 10], weights := [0, 1, 0, 0] }

-- Period 7, original row 6072, representative 826.
def source8 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B006.Data.entryAt ⟨45, by decide +kernel⟩

def target8 : Weights.Entry :=
  { word := [8, 10, 0, 1, 8, 10, 10], weights := [0, 1, 0, 0] }

-- Period 7, original row 6077, representative 807.
def source9 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B006.Data.entryAt ⟨26, by decide +kernel⟩

def target9 : Weights.Entry :=
  { word := [8, 10, 0, 2, 0, 8, 9], weights := [0, 3, 0, 1] }

def points9 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 6102, representative 829.
def source10 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B006.Data.entryAt ⟨48, by decide +kernel⟩

def target10 : Weights.Entry :=
  { word := [8, 10, 0, 9, 8, 2, 10], weights := [0, 1, 0, 0] }

-- Period 7, original row 6112, representative 827.
def source11 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B006.Data.entryAt ⟨46, by decide +kernel⟩

def target11 : Weights.Entry :=
  { word := [8, 10, 0, 9, 8, 10, 10], weights := [0, 1, 0, 0] }

-- Period 7, original row 6120, representative 825.
def source12 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B006.Data.entryAt ⟨44, by decide +kernel⟩

def target12 : Weights.Entry :=
  { word := [8, 10, 0, 10, 0, 0, 9], weights := [0, 1, 0, 0] }

def points12 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 6121, representative 825.
def source13 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B006.Data.entryAt ⟨44, by decide +kernel⟩

def target13 : Weights.Entry :=
  { word := [8, 10, 0, 10, 0, 0, 10], weights := [0, 1, 0, 0] }

def points13 : List (ℕ × ℕ) := [(0, 1), (1, 2), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 6127, representative 814.
def source14 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B006.Data.entryAt ⟨33, by decide +kernel⟩

def target14 : Weights.Entry :=
  { word := [8, 10, 0, 10, 0, 8, 9], weights := [0, 1, 0, 1] }

def points14 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 6141, representative 831.
def source15 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B006.Data.entryAt ⟨50, by decide +kernel⟩

def target15 : Weights.Entry :=
  { word := [8, 10, 0, 12, 2, 0, 9], weights := [1, 1, 0, 1] }

def points15 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 6142, representative 831.
def source16 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B006.Data.entryAt ⟨50, by decide +kernel⟩

def target16 : Weights.Entry :=
  { word := [8, 10, 0, 12, 2, 0, 10], weights := [1, 1, 0, 1] }

def points16 : List (ℕ × ℕ) := [(0, 1), (1, 2), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 6149, representative 830.
def source17 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B006.Data.entryAt ⟨49, by decide +kernel⟩

def target17 : Weights.Entry :=
  { word := [8, 10, 0, 12, 10, 0, 9], weights := [1, 1, 0, 1] }

def points17 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 6150, representative 830.
def source18 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B006.Data.entryAt ⟨49, by decide +kernel⟩

def target18 : Weights.Entry :=
  { word := [8, 10, 0, 12, 10, 0, 10], weights := [1, 1, 0, 1] }

def points18 : List (ℕ × ℕ) := [(0, 1), (1, 2), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 6157, representative 823.
def source19 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B006.Data.entryAt ⟨42, by decide +kernel⟩

def target19 : Weights.Entry :=
  { word := [8, 10, 2, 2, 8, 0, 9], weights := [1, 0, 0, 1] }

def points19 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 6158, representative 821.
def source20 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B006.Data.entryAt ⟨40, by decide +kernel⟩

def target20 : Weights.Entry :=
  { word := [8, 10, 2, 2, 8, 0, 10], weights := [1, 1, 0, 0] }

-- Period 7, original row 6169, representative 808.
def source21 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B006.Data.entryAt ⟨27, by decide +kernel⟩

def target21 : Weights.Entry :=
  { word := [8, 10, 2, 2, 8, 8, 9], weights := [1, 0, 0, 1] }

def points21 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 6170, representative 815.
def source22 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B006.Data.entryAt ⟨34, by decide +kernel⟩

def target22 : Weights.Entry :=
  { word := [8, 10, 2, 2, 8, 8, 10], weights := [1, 0, 0, 1] }

-- Period 7, original row 6180, representative 824.
def source23 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B006.Data.entryAt ⟨43, by decide +kernel⟩

def target23 : Weights.Entry :=
  { word := [8, 10, 2, 10, 8, 0, 9], weights := [1, 0, 0, 1] }

def points23 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 6181, representative 822.
def source24 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B006.Data.entryAt ⟨41, by decide +kernel⟩

def target24 : Weights.Entry :=
  { word := [8, 10, 2, 10, 8, 0, 10], weights := [1, 1, 0, 0] }

-- Period 7, original row 6197, representative 811.
def source25 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B006.Data.entryAt ⟨30, by decide +kernel⟩

def target25 : Weights.Entry :=
  { word := [8, 10, 2, 10, 8, 8, 9], weights := [1, 0, 0, 1] }

def points25 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 6198, representative 818.
def source26 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B006.Data.entryAt ⟨37, by decide +kernel⟩

def target26 : Weights.Entry :=
  { word := [8, 10, 2, 10, 8, 8, 10], weights := [1, 0, 0, 1] }

-- Period 7, original row 6219, representative 812.
def source27 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B006.Data.entryAt ⟨31, by decide +kernel⟩

def target27 : Weights.Entry :=
  { word := [8, 10, 8, 2, 0, 8, 9], weights := [0, 1, 0, 1] }

def points27 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 6220, representative 819.
def source28 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B006.Data.entryAt ⟨38, by decide +kernel⟩

def target28 : Weights.Entry :=
  { word := [8, 10, 8, 2, 0, 8, 10], weights := [1, 0, 0, 1] }

-- Period 7, original row 6260, representative 813.
def source29 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B006.Data.entryAt ⟨32, by decide +kernel⟩

def target29 : Weights.Entry :=
  { word := [8, 10, 8, 10, 0, 8, 9], weights := [0, 1, 0, 1] }

def points29 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 6261, representative 820.
def source30 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B006.Data.entryAt ⟨39, by decide +kernel⟩

def target30 : Weights.Entry :=
  { word := [8, 10, 8, 10, 0, 8, 10], weights := [1, 0, 0, 1] }

-- Period 7, original row 6297, representative 809.
def source31 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B006.Data.entryAt ⟨28, by decide +kernel⟩

def target31 : Weights.Entry :=
  { word := [8, 10, 10, 2, 8, 8, 9], weights := [1, 0, 0, 1] }

def points31 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 6298, representative 816.
def source32 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B006.Data.entryAt ⟨35, by decide +kernel⟩

def target32 : Weights.Entry :=
  { word := [8, 10, 10, 2, 8, 8, 10], weights := [1, 0, 0, 1] }

-- Period 7, original row 6319, representative 810.
def source33 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B006.Data.entryAt ⟨29, by decide +kernel⟩

def target33 : Weights.Entry :=
  { word := [8, 10, 10, 10, 8, 8, 9], weights := [1, 0, 0, 1] }

def points33 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 6320, representative 817.
def source34 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B006.Data.entryAt ⟨36, by decide +kernel⟩

def target34 : Weights.Entry :=
  { word := [8, 10, 10, 10, 8, 8, 10], weights := [1, 0, 0, 1] }

-- Period 7, original row 6349, representative 859.
def source35 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B006.Data.entryAt ⟨78, by decide +kernel⟩

def target35 : Weights.Entry :=
  { word := [8, 12, 0, 4, 8, 4, 10], weights := [1, 0, 1, 0] }

-- Period 7, original row 6350, representative 873.
def source36 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B006.Data.entryAt ⟨92, by decide +kernel⟩

def target36 : Weights.Entry :=
  { word := [8, 12, 0, 4, 8, 4, 12], weights := [1, 0, 0, 1] }

-- Period 7, original row 6385, representative 862.
def source37 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B006.Data.entryAt ⟨81, by decide +kernel⟩

def target37 : Weights.Entry :=
  { word := [8, 12, 0, 12, 8, 4, 10], weights := [1, 0, 1, 0] }

-- Period 7, original row 6386, representative 876.
def source38 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B006.Data.entryAt ⟨95, by decide +kernel⟩

def target38 : Weights.Entry :=
  { word := [8, 12, 0, 12, 8, 4, 12], weights := [1, 0, 1, 0] }

-- Period 7, original row 6506, representative 860.
def source39 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B006.Data.entryAt ⟨79, by decide +kernel⟩

def target39 : Weights.Entry :=
  { word := [8, 12, 8, 4, 8, 4, 10], weights := [1, 0, 1, 0] }

-- Period 7, original row 6507, representative 874.
def source40 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B006.Data.entryAt ⟨93, by decide +kernel⟩

def target40 : Weights.Entry :=
  { word := [8, 12, 8, 4, 8, 4, 12], weights := [1, 0, 0, 1] }

-- Period 7, original row 6548, representative 861.
def source41 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B006.Data.entryAt ⟨80, by decide +kernel⟩

def target41 : Weights.Entry :=
  { word := [8, 12, 8, 12, 8, 4, 10], weights := [1, 0, 1, 0] }

-- Period 7, original row 6549, representative 875.
def source42 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B006.Data.entryAt ⟨94, by decide +kernel⟩

def target42 : Weights.Entry :=
  { word := [8, 12, 8, 12, 8, 4, 12], weights := [1, 0, 1, 0] }

-- Period 7, original row 6642, representative 854.
def source43 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B006.Data.entryAt ⟨73, by decide +kernel⟩

def target43 : Weights.Entry :=
  { word := [9, 0, 1, 4, 8, 4, 10], weights := [1, 0, 1, 0] }

def points43 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 6643, representative 880.
def source44 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B006.Data.entryAt ⟨99, by decide +kernel⟩

def target44 : Weights.Entry :=
  { word := [9, 0, 1, 4, 8, 4, 12], weights := [1, 0, 0, 1] }

def points44 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 6678, representative 857.
def source45 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B006.Data.entryAt ⟨76, by decide +kernel⟩

def target45 : Weights.Entry :=
  { word := [9, 0, 1, 12, 8, 4, 10], weights := [1, 0, 1, 0] }

def points45 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 6679, representative 883.
def source46 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B006.Data.entryAt ⟨102, by decide +kernel⟩

def target46 : Weights.Entry :=
  { word := [9, 0, 1, 12, 8, 4, 12], weights := [1, 0, 1, 0] }

def points46 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 6808, representative 905.
def source47 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B006.Data.entryAt ⟨124, by decide +kernel⟩

def target47 : Weights.Entry :=
  { word := [9, 0, 4, 10, 8, 4, 12], weights := [1, 0, 1, 1] }

def points47 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 6837, representative 899.
def source48 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B006.Data.entryAt ⟨118, by decide +kernel⟩

def target48 : Weights.Entry :=
  { word := [9, 0, 8, 9, 4, 4, 12], weights := [1, 0, 1, 1] }

def points48 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 6841, representative 895.
def source49 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B006.Data.entryAt ⟨114, by decide +kernel⟩

def target49 : Weights.Entry :=
  { word := [9, 0, 8, 9, 12, 4, 12], weights := [1, 0, 1, 1] }

def points49 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 6936, representative 906.
def source50 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B006.Data.entryAt ⟨125, by decide +kernel⟩

def target50 : Weights.Entry :=
  { word := [9, 0, 12, 10, 0, 4, 10], weights := [1, 0, 1, 1] }

def points50 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 6937, representative 906.
def source51 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B006.Data.entryAt ⟨125, by decide +kernel⟩

def target51 : Weights.Entry :=
  { word := [9, 0, 12, 10, 0, 4, 12], weights := [1, 0, 1, 1] }

def points51 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 6954, representative 904.
def source52 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B006.Data.entryAt ⟨123, by decide +kernel⟩

def target52 : Weights.Entry :=
  { word := [9, 0, 12, 10, 8, 4, 12], weights := [1, 0, 1, 1] }

def points52 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 7078, representative 855.
def source53 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B006.Data.entryAt ⟨74, by decide +kernel⟩

def target53 : Weights.Entry :=
  { word := [9, 8, 1, 4, 8, 4, 10], weights := [1, 0, 1, 0] }

def points53 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 7079, representative 881.
def source54 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B006.Data.entryAt ⟨100, by decide +kernel⟩

def target54 : Weights.Entry :=
  { word := [9, 8, 1, 4, 8, 4, 12], weights := [1, 0, 0, 1] }

def points54 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 7114, representative 856.
def source55 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B006.Data.entryAt ⟨75, by decide +kernel⟩

def target55 : Weights.Entry :=
  { word := [9, 8, 1, 12, 8, 4, 10], weights := [1, 0, 1, 0] }

def points55 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 7115, representative 882.
def source56 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B006.Data.entryAt ⟨101, by decide +kernel⟩

def target56 : Weights.Entry :=
  { word := [9, 8, 1, 12, 8, 4, 12], weights := [1, 0, 1, 0] }

def points56 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 7605, representative 804.
def source57 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B006.Data.entryAt ⟨24, by decide +kernel⟩

def target57 : Weights.Entry :=
  { word := [10, 2, 0, 9, 8, 2, 2], weights := [0, 1, 1, 1] }

def points57 : List (ℕ × ℕ) := [(0, 1), (1, 2), (2, 0), (3, 4), (4, 6), (5, 5), (6, 3)]

-- Period 7, original row 7612, representative 794.
def source58 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B006.Data.entryAt ⟨14, by decide +kernel⟩

def target58 : Weights.Entry :=
  { word := [10, 2, 0, 9, 8, 10, 2], weights := [1, 1, 0, 1] }

def points58 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 7617, representative 888.
def source59 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B006.Data.entryAt ⟨107, by decide +kernel⟩

def target59 : Weights.Entry :=
  { word := [10, 2, 0, 10, 0, 0, 8], weights := [0, 1, 0, 1] }

def points59 : List (ℕ × ℕ) := [(0, 1), (1, 2), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 7624, representative 886.
def source60 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B006.Data.entryAt ⟨105, by decide +kernel⟩

def target60 : Weights.Entry :=
  { word := [10, 2, 0, 10, 0, 8, 8], weights := [0, 1, 0, 1] }

def points60 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 7634, representative 906.
def source61 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B006.Data.entryAt ⟨125, by decide +kernel⟩

def target61 : Weights.Entry :=
  { word := [10, 2, 0, 12, 10, 0, 8], weights := [1, 1, 0, 1] }

def points61 : List (ℕ × ℕ) := [(0, 1), (1, 2), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 7643, representative 790.
def source62 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B006.Data.entryAt ⟨10, by decide +kernel⟩

def target62 : Weights.Entry :=
  { word := [10, 2, 2, 8, 1, 0, 2], weights := [1, 1, 0, 1] }

def points62 : List (ℕ × ℕ) := [(0, 2), (1, 0), (2, 1), (3, 4), (4, 5), (5, 6), (6, 3)]

-- Period 7, original row 7645, representative 900.
def source63 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B006.Data.entryAt ⟨119, by decide +kernel⟩

def target63 : Weights.Entry :=
  { word := [10, 2, 2, 8, 1, 0, 8], weights := [1, 1, 0, 1] }

def points63 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 7650, representative 898.
def source64 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B006.Data.entryAt ⟨117, by decide +kernel⟩

def target64 : Weights.Entry :=
  { word := [10, 2, 2, 8, 1, 8, 8], weights := [1, 1, 1, 1] }

def points64 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 7657, representative 789.
def source65 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B006.Data.entryAt ⟨9, by decide +kernel⟩

def target65 : Weights.Entry :=
  { word := [10, 2, 2, 8, 9, 0, 2], weights := [1, 1, 0, 1] }

def points65 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 7659, representative 899.
def source66 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B006.Data.entryAt ⟨118, by decide +kernel⟩

def target66 : Weights.Entry :=
  { word := [10, 2, 2, 8, 9, 0, 8], weights := [1, 1, 0, 1] }

def points66 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 7664, representative 897.
def source67 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B006.Data.entryAt ⟨116, by decide +kernel⟩

def target67 : Weights.Entry :=
  { word := [10, 2, 2, 8, 9, 8, 8], weights := [1, 1, 1, 1] }

def points67 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 7669, representative 880.
def source68 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B006.Data.entryAt ⟨99, by decide +kernel⟩

def target68 : Weights.Entry :=
  { word := [10, 2, 8, 2, 0, 1, 8], weights := [1, 0, 0, 1] }

def points68 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 7671, representative 872.
def source69 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B006.Data.entryAt ⟨91, by decide +kernel⟩

def target69 : Weights.Entry :=
  { word := [10, 2, 8, 2, 0, 2, 8], weights := [1, 0, 0, 1] }

def points69 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 7676, representative 884.
def source70 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B006.Data.entryAt ⟨103, by decide +kernel⟩

def target70 : Weights.Entry :=
  { word := [10, 2, 8, 2, 0, 8, 8], weights := [1, 0, 0, 1] }

def points70 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 7681, representative 881.
def source71 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B006.Data.entryAt ⟨100, by decide +kernel⟩

def target71 : Weights.Entry :=
  { word := [10, 2, 8, 2, 0, 9, 8], weights := [1, 0, 0, 1] }

def points71 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 7683, representative 873.
def source72 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B006.Data.entryAt ⟨92, by decide +kernel⟩

def target72 : Weights.Entry :=
  { word := [10, 2, 8, 2, 0, 10, 8], weights := [1, 0, 0, 1] }

def points72 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 7687, representative 877.
def source73 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B006.Data.entryAt ⟨96, by decide +kernel⟩

def target73 : Weights.Entry :=
  { word := [10, 2, 8, 2, 8, 2, 8], weights := [1, 0, 0, 1] }

def points73 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 7691, representative 874.
def source74 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B006.Data.entryAt ⟨93, by decide +kernel⟩

def target74 : Weights.Entry :=
  { word := [10, 2, 8, 2, 8, 10, 8], weights := [1, 0, 0, 1] }

def points74 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 7708, representative 803.
def source75 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B006.Data.entryAt ⟨23, by decide +kernel⟩

def target75 : Weights.Entry :=
  { word := [10, 2, 8, 9, 8, 2, 2], weights := [1, 1, 0, 1] }

def points75 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 7715, representative 793.
def source76 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B006.Data.entryAt ⟨13, by decide +kernel⟩

def target76 : Weights.Entry :=
  { word := [10, 2, 8, 9, 8, 10, 2], weights := [1, 1, 0, 1] }

def points76 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 7718, representative 883.
def source77 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B006.Data.entryAt ⟨102, by decide +kernel⟩

def target77 : Weights.Entry :=
  { word := [10, 2, 8, 10, 0, 1, 8], weights := [0, 1, 0, 1] }

def points77 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 7720, representative 879.
def source78 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B006.Data.entryAt ⟨98, by decide +kernel⟩

def target78 : Weights.Entry :=
  { word := [10, 2, 8, 10, 0, 2, 8], weights := [0, 1, 0, 1] }

def points78 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 7726, representative 885.
def source79 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B006.Data.entryAt ⟨104, by decide +kernel⟩

def target79 : Weights.Entry :=
  { word := [10, 2, 8, 10, 0, 8, 8], weights := [0, 1, 0, 1] }

def points79 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 7731, representative 882.
def source80 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B006.Data.entryAt ⟨101, by decide +kernel⟩

def target80 : Weights.Entry :=
  { word := [10, 2, 8, 10, 0, 9, 8], weights := [0, 1, 0, 1] }

def points80 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 7733, representative 876.
def source81 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B006.Data.entryAt ⟨95, by decide +kernel⟩

def target81 : Weights.Entry :=
  { word := [10, 2, 8, 10, 0, 10, 8], weights := [0, 1, 0, 1] }

def points81 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 7738, representative 878.
def source82 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B006.Data.entryAt ⟨97, by decide +kernel⟩

def target82 : Weights.Entry :=
  { word := [10, 2, 8, 10, 8, 2, 8], weights := [0, 1, 0, 1] }

def points82 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 7744, representative 875.
def source83 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B006.Data.entryAt ⟨94, by decide +kernel⟩

def target83 : Weights.Entry :=
  { word := [10, 2, 8, 10, 8, 10, 8], weights := [0, 1, 0, 1] }

def points83 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 7748, representative 800.
def source84 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B006.Data.entryAt ⟨20, by decide +kernel⟩

def target84 : Weights.Entry :=
  { word := [10, 2, 8, 12, 2, 0, 2], weights := [1, 1, 0, 1] }

def points84 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 7750, representative 905.
def source85 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B006.Data.entryAt ⟨124, by decide +kernel⟩

def target85 : Weights.Entry :=
  { word := [10, 2, 8, 12, 2, 0, 8], weights := [1, 1, 0, 1] }

def points85 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 7754, representative 798.
def source86 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B006.Data.entryAt ⟨18, by decide +kernel⟩

def target86 : Weights.Entry :=
  { word := [10, 2, 8, 12, 2, 8, 2], weights := [1, 1, 1, 1] }

def points86 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 7755, representative 903.
def source87 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B006.Data.entryAt ⟨122, by decide +kernel⟩

def target87 : Weights.Entry :=
  { word := [10, 2, 8, 12, 2, 8, 8], weights := [1, 1, 1, 1] }

def points87 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 7764, representative 799.
def source88 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B006.Data.entryAt ⟨19, by decide +kernel⟩

def target88 : Weights.Entry :=
  { word := [10, 2, 8, 12, 10, 0, 2], weights := [1, 1, 0, 1] }

def points88 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 7766, representative 904.
def source89 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B006.Data.entryAt ⟨123, by decide +kernel⟩

def target89 : Weights.Entry :=
  { word := [10, 2, 8, 12, 10, 0, 8], weights := [1, 1, 0, 1] }

def points89 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 7770, representative 797.
def source90 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B006.Data.entryAt ⟨17, by decide +kernel⟩

def target90 : Weights.Entry :=
  { word := [10, 2, 8, 12, 10, 8, 2], weights := [1, 1, 1, 1] }

def points90 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 7772, representative 902.
def source91 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B006.Data.entryAt ⟨121, by decide +kernel⟩

def target91 : Weights.Entry :=
  { word := [10, 2, 8, 12, 10, 8, 8], weights := [1, 1, 1, 1] }

def points91 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 7783, representative 788.
def source92 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B006.Data.entryAt ⟨8, by decide +kernel⟩

def target92 : Weights.Entry :=
  { word := [10, 2, 10, 8, 1, 0, 2], weights := [1, 1, 0, 1] }

def points92 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 7785, representative 896.
def source93 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B006.Data.entryAt ⟨115, by decide +kernel⟩

def target93 : Weights.Entry :=
  { word := [10, 2, 10, 8, 1, 0, 8], weights := [1, 1, 0, 1] }

def points93 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 7790, representative 894.
def source94 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B006.Data.entryAt ⟨113, by decide +kernel⟩

def target94 : Weights.Entry :=
  { word := [10, 2, 10, 8, 1, 8, 8], weights := [1, 1, 1, 1] }

def points94 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 7797, representative 787.
def source95 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B006.Data.entryAt ⟨7, by decide +kernel⟩

def target95 : Weights.Entry :=
  { word := [10, 2, 10, 8, 9, 0, 2], weights := [1, 1, 0, 1] }

def points95 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 7799, representative 895.
def source96 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B006.Data.entryAt ⟨114, by decide +kernel⟩

def target96 : Weights.Entry :=
  { word := [10, 2, 10, 8, 9, 0, 8], weights := [1, 1, 0, 1] }

def points96 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 7804, representative 893.
def source97 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B006.Data.entryAt ⟨112, by decide +kernel⟩

def target97 : Weights.Entry :=
  { word := [10, 2, 10, 8, 9, 8, 8], weights := [1, 1, 1, 1] }

def points97 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8409, representative 806.
def source98 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B006.Data.entryAt ⟨25, by decide +kernel⟩

def target98 : Weights.Entry :=
  { word := [12, 0, 0, 9, 4, 4, 4], weights := [1, 0, 1, 1] }

def points98 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8421, representative 888.
def source99 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B006.Data.entryAt ⟨107, by decide +kernel⟩

def target99 : Weights.Entry :=
  { word := [12, 0, 0, 12, 0, 4, 8], weights := [0, 0, 1, 1] }

def points99 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 6), (4, 4), (5, 5), (6, 3)]

-- Period 7, original row 8425, representative 825.
def source100 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B006.Data.entryAt ⟨44, by decide +kernel⟩

def target100 : Weights.Entry :=
  { word := [12, 0, 0, 12, 0, 12, 8], weights := [0, 0, 1, 0] }

def points100 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 8459, representative 907.
def source101 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B006.Data.entryAt ⟨126, by decide +kernel⟩

def target101 : Weights.Entry :=
  { word := [12, 0, 4, 10, 0, 4, 8], weights := [1, 0, 2, 1] }

def points101 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 8471, representative 831.
def source102 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B006.Data.entryAt ⟨50, by decide +kernel⟩

def target102 : Weights.Entry :=
  { word := [12, 0, 4, 10, 0, 12, 8], weights := [1, 0, 1, 1] }

def points102 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 8475, representative 804.
def source103 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B006.Data.entryAt ⟨24, by decide +kernel⟩

def target103 : Weights.Entry :=
  { word := [12, 0, 4, 10, 8, 4, 4], weights := [0, 1, 1, 1] }

def points103 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8496, representative 868.
def source104 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B006.Data.entryAt ⟨87, by decide +kernel⟩

def target104 : Weights.Entry :=
  { word := [12, 0, 8, 4, 4, 4, 8], weights := [0, 0, 1, 1] }

def points104 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8498, representative 821.
def source105 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B006.Data.entryAt ⟨40, by decide +kernel⟩

def target105 : Weights.Entry :=
  { word := [12, 0, 8, 4, 4, 12, 8], weights := [0, 0, 1, 1] }

def points105 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8500, representative 802.
def source106 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B006.Data.entryAt ⟨22, by decide +kernel⟩

def target106 : Weights.Entry :=
  { word := [12, 0, 8, 9, 4, 4, 4], weights := [1, 0, 1, 1] }

def points106 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8504, representative 801.
def source107 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B006.Data.entryAt ⟨21, by decide +kernel⟩

def target107 : Weights.Entry :=
  { word := [12, 0, 8, 9, 12, 4, 4], weights := [1, 0, 1, 1] }

def points107 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8513, representative 869.
def source108 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B006.Data.entryAt ⟨88, by decide +kernel⟩

def target108 : Weights.Entry :=
  { word := [12, 0, 8, 12, 4, 4, 8], weights := [0, 0, 1, 1] }

def points108 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8515, representative 822.
def source109 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B006.Data.entryAt ⟨41, by decide +kernel⟩

def target109 : Weights.Entry :=
  { word := [12, 0, 8, 12, 4, 12, 8], weights := [0, 0, 1, 1] }

def points109 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8549, representative 796.
def source110 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B006.Data.entryAt ⟨16, by decide +kernel⟩

def target110 : Weights.Entry :=
  { word := [12, 0, 12, 10, 0, 4, 4], weights := [1, 0, 1, 1] }

def points110 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8550, representative 901.
def source111 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B006.Data.entryAt ⟨120, by decide +kernel⟩

def target111 : Weights.Entry :=
  { word := [12, 0, 12, 10, 0, 4, 8], weights := [1, 0, 1, 1] }

def points111 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 8564, representative 830.
def source112 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B006.Data.entryAt ⟨49, by decide +kernel⟩

def target112 : Weights.Entry :=
  { word := [12, 0, 12, 10, 0, 12, 8], weights := [1, 0, 1, 1] }

def points112 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 8568, representative 795.
def source113 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B006.Data.entryAt ⟨15, by decide +kernel⟩

def target113 : Weights.Entry :=
  { word := [12, 0, 12, 10, 8, 4, 4], weights := [0, 1, 1, 1] }

def points113 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8599, representative 888.
def source114 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B006.Data.entryAt ⟨107, by decide +kernel⟩

def target114 : Weights.Entry :=
  { word := [12, 2, 0, 10, 0, 0, 8], weights := [0, 1, 0, 1] }

def points114 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8606, representative 887.
def source115 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B006.Data.entryAt ⟨106, by decide +kernel⟩

def target115 : Weights.Entry :=
  { word := [12, 2, 0, 10, 0, 8, 8], weights := [0, 1, 0, 1] }

def points115 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8616, representative 906.
def source116 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B006.Data.entryAt ⟨125, by decide +kernel⟩

def target116 : Weights.Entry :=
  { word := [12, 2, 0, 12, 10, 0, 8], weights := [1, 1, 0, 1] }

def points116 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8622, representative 854.
def source117 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B006.Data.entryAt ⟨73, by decide +kernel⟩

def target117 : Weights.Entry :=
  { word := [12, 2, 8, 2, 0, 1, 8], weights := [0, 1, 0, 1] }

def points117 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8624, representative 858.
def source118 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B006.Data.entryAt ⟨77, by decide +kernel⟩

def target118 : Weights.Entry :=
  { word := [12, 2, 8, 2, 0, 2, 8], weights := [0, 1, 0, 1] }

def points118 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8629, representative 866.
def source119 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B006.Data.entryAt ⟨85, by decide +kernel⟩

def target119 : Weights.Entry :=
  { word := [12, 2, 8, 2, 0, 8, 8], weights := [0, 1, 0, 1] }

def points119 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8634, representative 855.
def source120 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B006.Data.entryAt ⟨74, by decide +kernel⟩

def target120 : Weights.Entry :=
  { word := [12, 2, 8, 2, 0, 9, 8], weights := [0, 1, 0, 1] }

def points120 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8636, representative 859.
def source121 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B006.Data.entryAt ⟨78, by decide +kernel⟩

def target121 : Weights.Entry :=
  { word := [12, 2, 8, 2, 0, 10, 8], weights := [0, 1, 0, 1] }

def points121 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8638, representative 863.
def source122 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B006.Data.entryAt ⟨82, by decide +kernel⟩

def target122 : Weights.Entry :=
  { word := [12, 2, 8, 2, 8, 2, 8], weights := [0, 1, 0, 1] }

def points122 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8642, representative 860.
def source123 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B006.Data.entryAt ⟨79, by decide +kernel⟩

def target123 : Weights.Entry :=
  { word := [12, 2, 8, 2, 8, 10, 8], weights := [0, 1, 0, 1] }

def points123 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8654, representative 857.
def source124 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B006.Data.entryAt ⟨76, by decide +kernel⟩

def target124 : Weights.Entry :=
  { word := [12, 2, 8, 10, 0, 1, 8], weights := [0, 1, 0, 1] }

def points124 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8656, representative 865.
def source125 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B006.Data.entryAt ⟨84, by decide +kernel⟩

def target125 : Weights.Entry :=
  { word := [12, 2, 8, 10, 0, 2, 8], weights := [0, 1, 0, 1] }

def points125 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8657, representative 781.
def source126 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B006.Data.entryAt ⟨1, by decide +kernel⟩

def target126 : Weights.Entry :=
  { word := [12, 2, 8, 10, 0, 6, 0], weights := [0, 1, 1, 0] }

def points126 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8662, representative 867.
def source127 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B006.Data.entryAt ⟨86, by decide +kernel⟩

def target127 : Weights.Entry :=
  { word := [12, 2, 8, 10, 0, 8, 8], weights := [0, 1, 0, 1] }

def points127 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

def period7Entries : List Weights.Entry := [target0, target1, target2, target3, target4, target5, target6, target7, target8, target9, target10, target11, target12, target13, target14, target15, target16, target17, target18, target19, target20, target21, target22, target23, target24, target25, target26, target27, target28, target29, target30, target31, target32, target33, target34, target35, target36, target37, target38, target39, target40, target41, target42, target43, target44, target45, target46, target47, target48, target49, target50, target51, target52, target53, target54, target55, target56, target57, target58, target59, target60, target61, target62, target63, target64, target65, target66, target67, target68, target69, target70, target71, target72, target73, target74, target75, target76, target77, target78, target79, target80, target81, target82, target83, target84, target85, target86, target87, target88, target89, target90, target91, target92, target93, target94, target95, target96, target97, target98, target99, target100, target101, target102, target103, target104, target105, target106, target107, target108, target109, target110, target111, target112, target113, target114, target115, target116, target117, target118, target119, target120, target121, target122, target123, target124, target125, target126, target127]

def period7Chunk : RowCoverage.Chunk where
  rows := [⟨6014, target0⟩, ⟨6016, target1⟩, ⟨6022, target2⟩, ⟨6036, target3⟩, ⟨6038, target4⟩, ⟨6043, target5⟩, ⟨6045, target6⟩, ⟨6065, target7⟩, ⟨6072, target8⟩, ⟨6077, target9⟩, ⟨6102, target10⟩, ⟨6112, target11⟩, ⟨6120, target12⟩, ⟨6121, target13⟩, ⟨6127, target14⟩, ⟨6141, target15⟩, ⟨6142, target16⟩, ⟨6149, target17⟩, ⟨6150, target18⟩, ⟨6157, target19⟩, ⟨6158, target20⟩, ⟨6169, target21⟩, ⟨6170, target22⟩, ⟨6180, target23⟩, ⟨6181, target24⟩, ⟨6197, target25⟩, ⟨6198, target26⟩, ⟨6219, target27⟩, ⟨6220, target28⟩, ⟨6260, target29⟩, ⟨6261, target30⟩, ⟨6297, target31⟩, ⟨6298, target32⟩, ⟨6319, target33⟩, ⟨6320, target34⟩, ⟨6349, target35⟩, ⟨6350, target36⟩, ⟨6385, target37⟩, ⟨6386, target38⟩, ⟨6506, target39⟩, ⟨6507, target40⟩, ⟨6548, target41⟩, ⟨6549, target42⟩, ⟨6642, target43⟩, ⟨6643, target44⟩, ⟨6678, target45⟩, ⟨6679, target46⟩, ⟨6808, target47⟩, ⟨6837, target48⟩, ⟨6841, target49⟩, ⟨6936, target50⟩, ⟨6937, target51⟩, ⟨6954, target52⟩, ⟨7078, target53⟩, ⟨7079, target54⟩, ⟨7114, target55⟩, ⟨7115, target56⟩, ⟨7605, target57⟩, ⟨7612, target58⟩, ⟨7617, target59⟩, ⟨7624, target60⟩, ⟨7634, target61⟩, ⟨7643, target62⟩, ⟨7645, target63⟩, ⟨7650, target64⟩, ⟨7657, target65⟩, ⟨7659, target66⟩, ⟨7664, target67⟩, ⟨7669, target68⟩, ⟨7671, target69⟩, ⟨7676, target70⟩, ⟨7681, target71⟩, ⟨7683, target72⟩, ⟨7687, target73⟩, ⟨7691, target74⟩, ⟨7708, target75⟩, ⟨7715, target76⟩, ⟨7718, target77⟩, ⟨7720, target78⟩, ⟨7726, target79⟩, ⟨7731, target80⟩, ⟨7733, target81⟩, ⟨7738, target82⟩, ⟨7744, target83⟩, ⟨7748, target84⟩, ⟨7750, target85⟩, ⟨7754, target86⟩, ⟨7755, target87⟩, ⟨7764, target88⟩, ⟨7766, target89⟩, ⟨7770, target90⟩, ⟨7772, target91⟩, ⟨7783, target92⟩, ⟨7785, target93⟩, ⟨7790, target94⟩, ⟨7797, target95⟩, ⟨7799, target96⟩, ⟨7804, target97⟩, ⟨8409, target98⟩, ⟨8421, target99⟩, ⟨8425, target100⟩, ⟨8459, target101⟩, ⟨8471, target102⟩, ⟨8475, target103⟩, ⟨8496, target104⟩, ⟨8498, target105⟩, ⟨8500, target106⟩, ⟨8504, target107⟩, ⟨8513, target108⟩, ⟨8515, target109⟩, ⟨8549, target110⟩, ⟨8550, target111⟩, ⟨8564, target112⟩, ⟨8568, target113⟩, ⟨8599, target114⟩, ⟨8606, target115⟩, ⟨8616, target116⟩, ⟨8622, target117⟩, ⟨8624, target118⟩, ⟨8629, target119⟩, ⟨8634, target120⟩, ⟨8636, target121⟩, ⟨8638, target122⟩, ⟨8642, target123⟩, ⟨8654, target124⟩, ⟨8656, target125⟩, ⟨8657, target126⟩, ⟨8662, target127⟩]
  indexMask := 3494098812872374556104167908450093549548972571078596852690836171830038009996929734901283511688703059453060610764753367290803374091270214671760412703210702279066680684425614780394222517161844561941061905249286065386764155653657699721153289619710982406356795390704078496200927800713253496710335887241906220997262809788880202891196890201173856220634986653146590266116508427707143838188605114455660467102699901107147065228470590507915995509702631725204751272389867320110556681912439402893272338945061308976190508937540915326472716271377946158166293689397086015696879092411591075859610774747108726150340854372880228958059226852854879415026016285487731271115923109211828501803640268867142617915581911254743181641933708286622006252467673719142088923294250498716629840244588186756268839742054776905646862047221425906250448696927454677243724025373475826149741771177100041677282667036074466102958461387700998715917865946809436696427136039525850117342319942484734143630910051760277374247428262650554078055926722399580700078210117665685327916793715719066514536714682642219271465871321992191131508050207851093675613117299052627349128990988669405351090112206376770804062357495587360426482840421687029407043100951372055094944967779507481058837174503551984752272881870549815719978438998462216713648179105065707621023294580155815638932182897947099421358777862302274099441319776946823856561685581167951847702178591936639568061052801355553241696096480317757778510393090387074519144203195982101900870078664933744033701360357056904997242667451752903194670249150225617842815883819515391423134202273158612115070714307532644877044157818187296786094874350191561437108470485714127472078013794426520681872194591672353021629744927280765337418619331667721605191400975999140222535278975473352480851265381056747759364010957001089683737086382479232805345444945725568867856455739136605969330678691676717500818293659904412704575808828248350696725994128166784583066740351764666511588238046654246011336290235268767530684362132735586675915560898836996798951873666829650239695030430898476122372443493146385493919415084069826958945496912844470546962275122010275523262740552665649560162491657337323756075792644757349876337943297058644557013859838306739273564928935779138980066058934119614023883790406256899648215941960285046439416636299168251718270547146576933643996734337594399102088238417618668207465723017314278868819443311721381160504252212739314477323459394486547841348715715270833248660317705076760308465377766100465191866836160651886726579078134154678758571090049760585905139232999933441515326234158948274512587938625040376482215728647241728
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

end FranklSmallCyclic.TransportBatches.G006.B001.Data
