module

public import Conjectures.FranklSmallCyclicRowCoverage
public import Conjectures.FranklSmallCyclicCanonicalWords
public import Conjectures.FranklSmallCyclicOrbit8Block003Data

/-! 128 literal targets sharing one source proof block.
Original words and row indices are retained; weights may be transported.
-/
@[expose] public section

namespace FranklSmallCyclic.TransportBatches.G029.B000.Data

-- Period 8, original row 21, representative 3816.
def source0 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B003.Data.entryAt ⟨119, by decide +kernel⟩

def target0 : Weights.Entry :=
  { word := [0, 0, 1, 4, 8, 12, 12], weights := [1, 0, 0, 1] }

-- Period 8, original row 44, representative 3819.
def source1 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B003.Data.entryAt ⟨122, by decide +kernel⟩

def target1 : Weights.Entry :=
  { word := [0, 0, 1, 12, 8, 12, 12], weights := [1, 0, 1, 0] }

-- Period 8, original row 129, representative 3744.
def source2 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B003.Data.entryAt ⟨47, by decide +kernel⟩

def target2 : Weights.Entry :=
  { word := [0, 1, 0, 9, 4, 12, 12], weights := [1, 0, 1, 1] }

-- Period 8, original row 133, representative 3740.
def source3 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B003.Data.entryAt ⟨43, by decide +kernel⟩

def target3 : Weights.Entry :=
  { word := [0, 1, 0, 9, 12, 12, 12], weights := [1, 0, 1, 1] }

-- Period 8, original row 189, representative 3748.
def source4 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B003.Data.entryAt ⟨51, by decide +kernel⟩

def target4 : Weights.Entry :=
  { word := [0, 1, 4, 10, 0, 12, 10], weights := [1, 0, 1, 1] }

-- Period 8, original row 190, representative 3748.
def source5 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B003.Data.entryAt ⟨51, by decide +kernel⟩

def target5 : Weights.Entry :=
  { word := [0, 1, 4, 10, 0, 12, 12], weights := [1, 0, 1, 1] }

def points5 : List (ℕ × ℕ) := [(0, 7), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 0)]

-- Period 8, original row 198, representative 3746.
def source6 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B003.Data.entryAt ⟨49, by decide +kernel⟩

def target6 : Weights.Entry :=
  { word := [0, 1, 4, 10, 8, 12, 12], weights := [1, 0, 1, 1] }

-- Period 8, original row 220, representative 3743.
def source7 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B003.Data.entryAt ⟨46, by decide +kernel⟩

def target7 : Weights.Entry :=
  { word := [0, 1, 8, 9, 4, 12, 12], weights := [1, 0, 1, 1] }

-- Period 8, original row 282, representative 3747.
def source8 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B003.Data.entryAt ⟨50, by decide +kernel⟩

def target8 : Weights.Entry :=
  { word := [0, 1, 12, 10, 0, 12, 10], weights := [1, 0, 1, 1] }

-- Period 8, original row 283, representative 3747.
def source9 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B003.Data.entryAt ⟨50, by decide +kernel⟩

def target9 : Weights.Entry :=
  { word := [0, 1, 12, 10, 0, 12, 12], weights := [1, 0, 1, 1] }

def points9 : List (ℕ × ℕ) := [(0, 7), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 0)]

-- Period 8, original row 291, representative 3745.
def source10 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B003.Data.entryAt ⟨48, by decide +kernel⟩

def target10 : Weights.Entry :=
  { word := [0, 1, 12, 10, 8, 12, 12], weights := [1, 0, 1, 1] }

-- Period 8, original row 309, representative 3736.
def source11 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B003.Data.entryAt ⟨40, by decide +kernel⟩

def target11 : Weights.Entry :=
  { word := [0, 2, 0, 8, 8, 12, 12], weights := [0, 1, 0, 1] }

-- Period 8, original row 364, representative 3708.
def source12 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B003.Data.entryAt ⟨13, by decide +kernel⟩

def target12 : Weights.Entry :=
  { word := [0, 2, 2, 2, 8, 12, 10], weights := [0, 1, 0, 1] }

-- Period 8, original row 365, representative 3728.
def source13 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B003.Data.entryAt ⟨32, by decide +kernel⟩

def target13 : Weights.Entry :=
  { word := [0, 2, 2, 2, 8, 12, 12], weights := [0, 1, 0, 1] }

-- Period 8, original row 381, representative 3748.
def source14 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B003.Data.entryAt ⟨51, by decide +kernel⟩

def target14 : Weights.Entry :=
  { word := [0, 2, 2, 10, 0, 12, 10], weights := [0, 1, 1, 1] }

def points14 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6), (7, 7)]

-- Period 8, original row 382, representative 3748.
def source15 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B003.Data.entryAt ⟨51, by decide +kernel⟩

def target15 : Weights.Entry :=
  { word := [0, 2, 2, 10, 0, 12, 12], weights := [0, 1, 1, 1] }

def points15 : List (ℕ × ℕ) := [(0, 7), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6), (7, 0)]

-- Period 8, original row 409, representative 3711.
def source16 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B003.Data.entryAt ⟨16, by decide +kernel⟩

def target16 : Weights.Entry :=
  { word := [0, 2, 2, 10, 8, 12, 10], weights := [0, 1, 1, 0] }

-- Period 8, original row 410, representative 3731.
def source17 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B003.Data.entryAt ⟨35, by decide +kernel⟩

def target17 : Weights.Entry :=
  { word := [0, 2, 2, 10, 8, 12, 12], weights := [0, 1, 0, 1] }

-- Period 8, original row 462, representative 3709.
def source18 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B003.Data.entryAt ⟨14, by decide +kernel⟩

def target18 : Weights.Entry :=
  { word := [0, 2, 10, 2, 8, 12, 10], weights := [0, 1, 0, 1] }

-- Period 8, original row 463, representative 3729.
def source19 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B003.Data.entryAt ⟨33, by decide +kernel⟩

def target19 : Weights.Entry :=
  { word := [0, 2, 10, 2, 8, 12, 12], weights := [0, 1, 0, 1] }

-- Period 8, original row 483, representative 3747.
def source20 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B003.Data.entryAt ⟨50, by decide +kernel⟩

def target20 : Weights.Entry :=
  { word := [0, 2, 10, 10, 0, 12, 10], weights := [0, 1, 1, 1] }

def points20 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6), (7, 7)]

-- Period 8, original row 484, representative 3747.
def source21 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B003.Data.entryAt ⟨50, by decide +kernel⟩

def target21 : Weights.Entry :=
  { word := [0, 2, 10, 10, 0, 12, 12], weights := [0, 1, 1, 1] }

def points21 : List (ℕ × ℕ) := [(0, 7), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6), (7, 0)]

-- Period 8, original row 504, representative 3710.
def source22 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B003.Data.entryAt ⟨15, by decide +kernel⟩

def target22 : Weights.Entry :=
  { word := [0, 2, 10, 10, 8, 12, 10], weights := [0, 1, 1, 0] }

-- Period 8, original row 505, representative 3730.
def source23 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B003.Data.entryAt ⟨34, by decide +kernel⟩

def target23 : Weights.Entry :=
  { word := [0, 2, 10, 10, 8, 12, 12], weights := [0, 1, 0, 1] }

-- Period 8, original row 593, representative 3803.
def source24 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B003.Data.entryAt ⟨106, by decide +kernel⟩

def target24 : Weights.Entry :=
  { word := [0, 4, 2, 8, 8, 12, 10], weights := [0, 1, 1, 0] }

-- Period 8, original row 659, representative 3808.
def source25 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B003.Data.entryAt ⟨111, by decide +kernel⟩

def target25 : Weights.Entry :=
  { word := [0, 4, 8, 4, 8, 12, 10], weights := [1, 0, 1, 0] }

-- Period 8, original row 660, representative 3814.
def source26 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B003.Data.entryAt ⟨117, by decide +kernel⟩

def target26 : Weights.Entry :=
  { word := [0, 4, 8, 4, 8, 12, 12], weights := [1, 0, 0, 1] }

-- Period 8, original row 687, representative 3809.
def source27 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B003.Data.entryAt ⟨112, by decide +kernel⟩

def target27 : Weights.Entry :=
  { word := [0, 4, 8, 12, 8, 12, 10], weights := [1, 0, 1, 0] }

-- Period 8, original row 688, representative 3815.
def source28 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B003.Data.entryAt ⟨118, by decide +kernel⟩

def target28 : Weights.Entry :=
  { word := [0, 4, 8, 12, 8, 12, 12], weights := [1, 0, 1, 0] }

-- Period 8, original row 713, representative 3802.
def source29 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B003.Data.entryAt ⟨105, by decide +kernel⟩

def target29 : Weights.Entry :=
  { word := [0, 4, 10, 8, 8, 12, 10], weights := [0, 1, 1, 0] }

-- Period 8, original row 745, representative 3733.
def source30 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B003.Data.entryAt ⟨37, by decide +kernel⟩

def target30 : Weights.Entry :=
  { word := [0, 6, 0, 12, 8, 12, 12], weights := [0, 1, 0, 1] }

-- Period 8, original row 765, representative 3703.
def source31 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B003.Data.entryAt ⟨8, by decide +kernel⟩

def target31 : Weights.Entry :=
  { word := [0, 6, 2, 8, 8, 12, 10], weights := [0, 1, 1, 0] }

-- Period 8, original row 776, representative 3712.
def source32 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B003.Data.entryAt ⟨17, by decide +kernel⟩

def target32 : Weights.Entry :=
  { word := [0, 6, 8, 12, 8, 12, 10], weights := [0, 1, 1, 0] }

-- Period 8, original row 777, representative 3732.
def source33 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B003.Data.entryAt ⟨36, by decide +kernel⟩

def target33 : Weights.Entry :=
  { word := [0, 6, 8, 12, 8, 12, 12], weights := [0, 1, 0, 1] }

-- Period 8, original row 792, representative 3702.
def source34 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B003.Data.entryAt ⟨7, by decide +kernel⟩

def target34 : Weights.Entry :=
  { word := [0, 6, 10, 8, 8, 12, 10], weights := [0, 1, 1, 0] }

-- Period 8, original row 800, representative 3822.
def source35 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B003.Data.entryAt ⟨125, by decide +kernel⟩

def target35 : Weights.Entry :=
  { word := [0, 8, 0, 0, 1, 12, 12], weights := [0, 0, 1, 1] }

-- Period 8, original row 804, representative 3804.
def source36 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B003.Data.entryAt ⟨107, by decide +kernel⟩

def target36 : Weights.Entry :=
  { word := [0, 8, 0, 0, 9, 12, 12], weights := [0, 0, 1, 1] }

-- Period 8, original row 812, representative 3822.
def source37 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B003.Data.entryAt ⟨125, by decide +kernel⟩

def target37 : Weights.Entry :=
  { word := [0, 8, 0, 4, 0, 12, 12], weights := [0, 0, 1, 1] }

def points37 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6), (7, 7)]

-- Period 8, original row 838, representative 3820.
def source38 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B003.Data.entryAt ⟨123, by decide +kernel⟩

def target38 : Weights.Entry :=
  { word := [0, 8, 0, 4, 8, 12, 12], weights := [1, 0, 0, 1] }

-- Period 8, original row 860, representative 3823.
def source39 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B003.Data.entryAt ⟨126, by decide +kernel⟩

def target39 : Weights.Entry :=
  { word := [0, 8, 0, 8, 1, 12, 12], weights := [0, 1, 1, 0] }

-- Period 8, original row 867, representative 3824.
def source40 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B003.Data.entryAt ⟨127, by decide +kernel⟩

def target40 : Weights.Entry :=
  { word := [0, 8, 0, 8, 8, 12, 12], weights := [0, 1, 0, 1] }

-- Period 8, original row 871, representative 3805.
def source41 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B003.Data.entryAt ⟨108, by decide +kernel⟩

def target41 : Weights.Entry :=
  { word := [0, 8, 0, 8, 9, 12, 12], weights := [0, 1, 1, 0] }

-- Period 8, original row 881, representative 3823.
def source42 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B003.Data.entryAt ⟨126, by decide +kernel⟩

def target42 : Weights.Entry :=
  { word := [0, 8, 0, 12, 0, 12, 12], weights := [1, 0, 1, 0] }

def points42 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6), (7, 7)]

-- Period 8, original row 890, representative 3821.
def source43 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B003.Data.entryAt ⟨124, by decide +kernel⟩

def target43 : Weights.Entry :=
  { word := [0, 8, 0, 12, 8, 12, 12], weights := [1, 0, 1, 0] }

-- Period 8, original row 913, representative 3817.
def source44 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B003.Data.entryAt ⟨120, by decide +kernel⟩

def target44 : Weights.Entry :=
  { word := [0, 8, 1, 4, 8, 12, 12], weights := [1, 0, 0, 1] }

-- Period 8, original row 936, representative 3818.
def source45 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B003.Data.entryAt ⟨121, by decide +kernel⟩

def target45 : Weights.Entry :=
  { word := [0, 8, 1, 12, 8, 12, 12], weights := [1, 0, 1, 0] }

-- Period 8, original row 1007, representative 3797.
def source46 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B003.Data.entryAt ⟨100, by decide +kernel⟩

def target46 : Weights.Entry :=
  { word := [0, 8, 4, 8, 4, 12, 12], weights := [0, 1, 0, 1] }

-- Period 8, original row 1011, representative 3795.
def source47 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B003.Data.entryAt ⟨98, by decide +kernel⟩

def target47 : Weights.Entry :=
  { word := [0, 8, 4, 8, 12, 12, 12], weights := [0, 1, 0, 1] }

-- Period 8, original row 1058, representative 3799.
def source48 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B003.Data.entryAt ⟨102, by decide +kernel⟩

def target48 : Weights.Entry :=
  { word := [0, 8, 8, 8, 4, 12, 12], weights := [0, 1, 0, 1] }

-- Period 8, original row 1063, representative 3798.
def source49 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B003.Data.entryAt ⟨101, by decide +kernel⟩

def target49 : Weights.Entry :=
  { word := [0, 8, 8, 8, 12, 12, 12], weights := [0, 1, 0, 1] }

-- Period 8, original row 1121, representative 3796.
def source50 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B003.Data.entryAt ⟨99, by decide +kernel⟩

def target50 : Weights.Entry :=
  { word := [0, 8, 12, 8, 4, 12, 12], weights := [0, 1, 0, 1] }

-- Period 8, original row 1125, representative 3794.
def source51 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B003.Data.entryAt ⟨97, by decide +kernel⟩

def target51 : Weights.Entry :=
  { word := [0, 8, 12, 8, 12, 12, 12], weights := [0, 1, 0, 1] }

-- Period 8, original row 1149, representative 3694.
def source52 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B003.Data.entryAt ⟨0, by decide +kernel⟩

def target52 : Weights.Entry :=
  { word := [0, 9, 0, 4, 0, 12, 12], weights := [1, 0, 1, 2] }

-- Period 8, original row 1193, representative 3742.
def source53 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B003.Data.entryAt ⟨45, by decide +kernel⟩

def target53 : Weights.Entry :=
  { word := [0, 9, 0, 9, 4, 12, 12], weights := [1, 1, 1, 1] }

-- Period 8, original row 1197, representative 3738.
def source54 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B003.Data.entryAt ⟨42, by decide +kernel⟩

def target54 : Weights.Entry :=
  { word := [0, 9, 0, 9, 12, 12, 12], weights := [1, 1, 1, 1] }

-- Period 8, original row 1209, representative 3695.
def source55 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B003.Data.entryAt ⟨1, by decide +kernel⟩

def target55 : Weights.Entry :=
  { word := [0, 9, 0, 12, 0, 12, 12], weights := [1, 0, 1, 0] }

-- Period 8, original row 1304, representative 3741.
def source56 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B003.Data.entryAt ⟨44, by decide +kernel⟩

def target56 : Weights.Entry :=
  { word := [0, 9, 8, 9, 4, 12, 12], weights := [1, 1, 1, 1] }

-- Period 8, original row 1308, representative 3737.
def source57 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B003.Data.entryAt ⟨41, by decide +kernel⟩

def target57 : Weights.Entry :=
  { word := [0, 9, 8, 9, 12, 12, 12], weights := [1, 1, 1, 1] }

-- Period 8, original row 1341, representative 3694.
def source58 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B003.Data.entryAt ⟨0, by decide +kernel⟩

def target58 : Weights.Entry :=
  { word := [0, 10, 0, 0, 1, 12, 12], weights := [0, 1, 1, 2] }

def points58 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6), (7, 7)]

-- Period 8, original row 1351, representative 3695.
def source59 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B003.Data.entryAt ⟨1, by decide +kernel⟩

def target59 : Weights.Entry :=
  { word := [0, 10, 0, 8, 1, 12, 12], weights := [0, 1, 1, 0] }

def points59 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6), (7, 7)]

-- Period 8, original row 1358, representative 3735.
def source60 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B003.Data.entryAt ⟨39, by decide +kernel⟩

def target60 : Weights.Entry :=
  { word := [0, 10, 0, 8, 8, 12, 12], weights := [0, 1, 0, 1] }

-- Period 8, original row 1373, representative 3734.
def source61 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B003.Data.entryAt ⟨38, by decide +kernel⟩

def target61 : Weights.Entry :=
  { word := [0, 10, 0, 12, 8, 12, 12], weights := [0, 1, 0, 1] }

-- Period 8, original row 1407, representative 3704.
def source62 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B003.Data.entryAt ⟨9, by decide +kernel⟩

def target62 : Weights.Entry :=
  { word := [0, 10, 2, 2, 8, 12, 10], weights := [0, 1, 0, 1] }

-- Period 8, original row 1408, representative 3724.
def source63 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B003.Data.entryAt ⟨28, by decide +kernel⟩

def target63 : Weights.Entry :=
  { word := [0, 10, 2, 2, 8, 12, 12], weights := [0, 1, 0, 1] }

-- Period 8, original row 1435, representative 3707.
def source64 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B003.Data.entryAt ⟨12, by decide +kernel⟩

def target64 : Weights.Entry :=
  { word := [0, 10, 2, 10, 8, 12, 10], weights := [0, 1, 1, 0] }

-- Period 8, original row 1436, representative 3727.
def source65 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B003.Data.entryAt ⟨31, by decide +kernel⟩

def target65 : Weights.Entry :=
  { word := [0, 10, 2, 10, 8, 12, 12], weights := [0, 1, 0, 1] }

-- Period 8, original row 1482, representative 3705.
def source66 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B003.Data.entryAt ⟨10, by decide +kernel⟩

def target66 : Weights.Entry :=
  { word := [0, 10, 10, 2, 8, 12, 10], weights := [0, 1, 0, 1] }

-- Period 8, original row 1483, representative 3725.
def source67 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B003.Data.entryAt ⟨29, by decide +kernel⟩

def target67 : Weights.Entry :=
  { word := [0, 10, 10, 2, 8, 12, 12], weights := [0, 1, 0, 1] }

-- Period 8, original row 1503, representative 3706.
def source68 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B003.Data.entryAt ⟨11, by decide +kernel⟩

def target68 : Weights.Entry :=
  { word := [0, 10, 10, 10, 8, 12, 10], weights := [0, 1, 1, 0] }

-- Period 8, original row 1504, representative 3726.
def source69 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B003.Data.entryAt ⟨30, by decide +kernel⟩

def target69 : Weights.Entry :=
  { word := [0, 10, 10, 10, 8, 12, 12], weights := [0, 1, 0, 1] }

-- Period 8, original row 1526, representative 3810.
def source70 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B003.Data.entryAt ⟨113, by decide +kernel⟩

def target70 : Weights.Entry :=
  { word := [0, 12, 0, 4, 8, 12, 12], weights := [1, 0, 0, 1] }

-- Period 8, original row 1549, representative 3813.
def source71 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B003.Data.entryAt ⟨116, by decide +kernel⟩

def target71 : Weights.Entry :=
  { word := [0, 12, 0, 12, 8, 12, 12], weights := [1, 0, 1, 0] }

-- Period 8, original row 1592, representative 3801.
def source72 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B003.Data.entryAt ⟨104, by decide +kernel⟩

def target72 : Weights.Entry :=
  { word := [0, 12, 2, 8, 8, 12, 10], weights := [0, 1, 1, 0] }

-- Period 8, original row 1658, representative 3806.
def source73 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B003.Data.entryAt ⟨109, by decide +kernel⟩

def target73 : Weights.Entry :=
  { word := [0, 12, 8, 4, 8, 12, 10], weights := [1, 0, 1, 0] }

-- Period 8, original row 1659, representative 3811.
def source74 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B003.Data.entryAt ⟨114, by decide +kernel⟩

def target74 : Weights.Entry :=
  { word := [0, 12, 8, 4, 8, 12, 12], weights := [1, 0, 0, 1] }

-- Period 8, original row 1686, representative 3807.
def source75 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B003.Data.entryAt ⟨110, by decide +kernel⟩

def target75 : Weights.Entry :=
  { word := [0, 12, 8, 12, 8, 12, 10], weights := [1, 0, 1, 0] }

-- Period 8, original row 1687, representative 3812.
def source76 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B003.Data.entryAt ⟨115, by decide +kernel⟩

def target76 : Weights.Entry :=
  { word := [0, 12, 8, 12, 8, 12, 12], weights := [1, 0, 1, 0] }

-- Period 8, original row 1712, representative 3800.
def source77 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B003.Data.entryAt ⟨103, by decide +kernel⟩

def target77 : Weights.Entry :=
  { word := [0, 12, 10, 8, 8, 12, 10], weights := [0, 1, 1, 0] }

-- Period 8, original row 1758, representative 3816.
def source78 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B003.Data.entryAt ⟨119, by decide +kernel⟩

def target78 : Weights.Entry :=
  { word := [1, 0, 1, 4, 8, 12, 12], weights := [1, 0, 0, 1] }

def points78 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 8, original row 1781, representative 3819.
def source79 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B003.Data.entryAt ⟨122, by decide +kernel⟩

def target79 : Weights.Entry :=
  { word := [1, 0, 1, 12, 8, 12, 12], weights := [1, 0, 1, 0] }

def points79 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 8, original row 1882, representative 3803.
def source80 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B003.Data.entryAt ⟨106, by decide +kernel⟩

def target80 : Weights.Entry :=
  { word := [1, 4, 2, 8, 8, 12, 10], weights := [0, 1, 1, 0] }

def points80 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 8, original row 1943, representative 3808.
def source81 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B003.Data.entryAt ⟨111, by decide +kernel⟩

def target81 : Weights.Entry :=
  { word := [1, 4, 8, 4, 8, 12, 10], weights := [1, 0, 1, 0] }

def points81 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 8, original row 1944, representative 3814.
def source82 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B003.Data.entryAt ⟨117, by decide +kernel⟩

def target82 : Weights.Entry :=
  { word := [1, 4, 8, 4, 8, 12, 12], weights := [1, 0, 0, 1] }

def points82 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 8, original row 1971, representative 3809.
def source83 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B003.Data.entryAt ⟨112, by decide +kernel⟩

def target83 : Weights.Entry :=
  { word := [1, 4, 8, 12, 8, 12, 10], weights := [1, 0, 1, 0] }

def points83 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 8, original row 1972, representative 3815.
def source84 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B003.Data.entryAt ⟨118, by decide +kernel⟩

def target84 : Weights.Entry :=
  { word := [1, 4, 8, 12, 8, 12, 12], weights := [1, 0, 1, 0] }

def points84 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 8, original row 1997, representative 3802.
def source85 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B003.Data.entryAt ⟨105, by decide +kernel⟩

def target85 : Weights.Entry :=
  { word := [1, 4, 10, 8, 8, 12, 10], weights := [0, 1, 1, 0] }

def points85 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 8, original row 2043, representative 3817.
def source86 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B003.Data.entryAt ⟨120, by decide +kernel⟩

def target86 : Weights.Entry :=
  { word := [1, 8, 1, 4, 8, 12, 12], weights := [1, 0, 0, 1] }

def points86 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 8, original row 2066, representative 3818.
def source87 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B003.Data.entryAt ⟨121, by decide +kernel⟩

def target87 : Weights.Entry :=
  { word := [1, 8, 1, 12, 8, 12, 12], weights := [1, 0, 1, 0] }

def points87 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 8, original row 2241, representative 3801.
def source88 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B003.Data.entryAt ⟨104, by decide +kernel⟩

def target88 : Weights.Entry :=
  { word := [1, 12, 2, 8, 8, 12, 10], weights := [0, 1, 1, 0] }

def points88 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 8, original row 2302, representative 3806.
def source89 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B003.Data.entryAt ⟨109, by decide +kernel⟩

def target89 : Weights.Entry :=
  { word := [1, 12, 8, 4, 8, 12, 10], weights := [1, 0, 1, 0] }

def points89 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 8, original row 2303, representative 3811.
def source90 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B003.Data.entryAt ⟨114, by decide +kernel⟩

def target90 : Weights.Entry :=
  { word := [1, 12, 8, 4, 8, 12, 12], weights := [1, 0, 0, 1] }

def points90 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 8, original row 2330, representative 3807.
def source91 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B003.Data.entryAt ⟨110, by decide +kernel⟩

def target91 : Weights.Entry :=
  { word := [1, 12, 8, 12, 8, 12, 10], weights := [1, 0, 1, 0] }

def points91 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 8, original row 2331, representative 3812.
def source92 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B003.Data.entryAt ⟨115, by decide +kernel⟩

def target92 : Weights.Entry :=
  { word := [1, 12, 8, 12, 8, 12, 12], weights := [1, 0, 1, 0] }

def points92 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 8, original row 2356, representative 3800.
def source93 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B003.Data.entryAt ⟨103, by decide +kernel⟩

def target93 : Weights.Entry :=
  { word := [1, 12, 10, 8, 8, 12, 10], weights := [0, 1, 1, 0] }

def points93 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 8, original row 3460, representative 3785.
def source94 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B003.Data.entryAt ⟨88, by decide +kernel⟩

def target94 : Weights.Entry :=
  { word := [4, 0, 4, 10, 0, 12, 10], weights := [1, 0, 1, 1] }

-- Period 8, original row 3553, representative 3784.
def source95 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B003.Data.entryAt ⟨87, by decide +kernel⟩

def target95 : Weights.Entry :=
  { word := [4, 0, 12, 10, 0, 12, 10], weights := [1, 0, 1, 1] }

-- Period 8, original row 3691, representative 3787.
def source96 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B003.Data.entryAt ⟨90, by decide +kernel⟩

def target96 : Weights.Entry :=
  { word := [4, 4, 8, 8, 1, 12, 10], weights := [1, 0, 1, 1] }

-- Period 8, original row 4056, representative 3786.
def source97 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B003.Data.entryAt ⟨89, by decide +kernel⟩

def target97 : Weights.Entry :=
  { word := [4, 12, 8, 8, 1, 12, 10], weights := [1, 0, 1, 1] }

-- Period 8, original row 4108, representative 3773.
def source98 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B003.Data.entryAt ⟨76, by decide +kernel⟩

def target98 : Weights.Entry :=
  { word := [8, 0, 0, 9, 4, 12, 12], weights := [1, 0, 1, 1] }

-- Period 8, original row 4112, representative 3769.
def source99 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B003.Data.entryAt ⟨72, by decide +kernel⟩

def target99 : Weights.Entry :=
  { word := [8, 0, 0, 9, 12, 12, 12], weights := [1, 0, 1, 1] }

-- Period 8, original row 4122, representative 3765.
def source100 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B003.Data.entryAt ⟨68, by decide +kernel⟩

def target100 : Weights.Entry :=
  { word := [8, 0, 0, 12, 0, 12, 12], weights := [1, 0, 1, 0] }

-- Period 8, original row 4144, representative 3757.
def source101 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B003.Data.entryAt ⟨60, by decide +kernel⟩

def target101 : Weights.Entry :=
  { word := [8, 0, 1, 4, 8, 12, 12], weights := [1, 0, 0, 1] }

-- Period 8, original row 4180, representative 3760.
def source102 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B003.Data.entryAt ⟨63, by decide +kernel⟩

def target102 : Weights.Entry :=
  { word := [8, 0, 1, 12, 8, 12, 12], weights := [1, 0, 1, 0] }

-- Period 8, original row 4302, representative 3793.
def source103 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B003.Data.entryAt ⟨96, by decide +kernel⟩

def target103 : Weights.Entry :=
  { word := [8, 0, 4, 10, 0, 12, 10], weights := [1, 0, 1, 1] }

-- Period 8, original row 4303, representative 3779.
def source104 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B003.Data.entryAt ⟨82, by decide +kernel⟩

def target104 : Weights.Entry :=
  { word := [8, 0, 4, 10, 0, 12, 12], weights := [1, 0, 1, 1] }

-- Period 8, original row 4311, representative 3777.
def source105 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B003.Data.entryAt ⟨80, by decide +kernel⟩

def target105 : Weights.Entry :=
  { word := [8, 0, 4, 10, 8, 12, 12], weights := [1, 0, 1, 1] }

-- Period 8, original row 4367, representative 3772.
def source106 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B003.Data.entryAt ⟨75, by decide +kernel⟩

def target106 : Weights.Entry :=
  { word := [8, 0, 8, 9, 4, 12, 12], weights := [1, 0, 1, 1] }

-- Period 8, original row 4371, representative 3768.
def source107 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B003.Data.entryAt ⟨71, by decide +kernel⟩

def target107 : Weights.Entry :=
  { word := [8, 0, 8, 9, 12, 12, 12], weights := [1, 0, 1, 1] }

-- Period 8, original row 4478, representative 3792.
def source108 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B003.Data.entryAt ⟨95, by decide +kernel⟩

def target108 : Weights.Entry :=
  { word := [8, 0, 12, 10, 0, 12, 10], weights := [1, 0, 1, 1] }

-- Period 8, original row 4479, representative 3778.
def source109 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B003.Data.entryAt ⟨81, by decide +kernel⟩

def target109 : Weights.Entry :=
  { word := [8, 0, 12, 10, 0, 12, 12], weights := [1, 0, 1, 1] }

-- Period 8, original row 4487, representative 3776.
def source110 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B003.Data.entryAt ⟨79, by decide +kernel⟩

def target110 : Weights.Entry :=
  { word := [8, 0, 12, 10, 8, 12, 12], weights := [1, 0, 1, 1] }

-- Period 8, original row 4721, representative 3723.
def source111 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B003.Data.entryAt ⟨27, by decide +kernel⟩

def target111 : Weights.Entry :=
  { word := [8, 2, 0, 9, 8, 12, 12], weights := [0, 3, 1, 0] }

-- Period 8, original row 4742, representative 3722.
def source112 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B003.Data.entryAt ⟨26, by decide +kernel⟩

def target112 : Weights.Entry :=
  { word := [8, 2, 0, 10, 8, 12, 12], weights := [0, 3, 0, 1] }

-- Period 8, original row 4845, representative 3700.
def source113 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B003.Data.entryAt ⟨5, by decide +kernel⟩

def target113 : Weights.Entry :=
  { word := [8, 2, 2, 10, 8, 12, 10], weights := [1, 1, 1, 1] }

-- Period 8, original row 4846, representative 3716.
def source114 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B003.Data.entryAt ⟨21, by decide +kernel⟩

def target114 : Weights.Entry :=
  { word := [8, 2, 2, 10, 8, 12, 12], weights := [1, 1, 1, 1] }

-- Period 8, original row 4916, representative 3721.
def source115 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B003.Data.entryAt ⟨25, by decide +kernel⟩

def target115 : Weights.Entry :=
  { word := [8, 2, 8, 10, 8, 12, 12], weights := [0, 3, 0, 1] }

-- Period 8, original row 5000, representative 3699.
def source116 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B003.Data.entryAt ⟨4, by decide +kernel⟩

def target116 : Weights.Entry :=
  { word := [8, 2, 10, 10, 8, 12, 10], weights := [1, 1, 1, 1] }

-- Period 8, original row 5001, representative 3715.
def source117 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B003.Data.entryAt ⟨20, by decide +kernel⟩

def target117 : Weights.Entry :=
  { word := [8, 2, 10, 10, 8, 12, 12], weights := [1, 1, 1, 1] }

-- Period 8, original row 5023, representative 3749.
def source118 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B003.Data.entryAt ⟨52, by decide +kernel⟩

def target118 : Weights.Entry :=
  { word := [8, 4, 0, 4, 8, 12, 12], weights := [1, 0, 0, 1] }

-- Period 8, original row 5059, representative 3756.
def source119 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B003.Data.entryAt ⟨59, by decide +kernel⟩

def target119 : Weights.Entry :=
  { word := [8, 4, 0, 12, 8, 12, 12], weights := [1, 0, 1, 0] }

-- Period 8, original row 5181, representative 3790.
def source120 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B003.Data.entryAt ⟨93, by decide +kernel⟩

def target120 : Weights.Entry :=
  { word := [8, 4, 8, 4, 8, 12, 10], weights := [1, 0, 1, 0] }

-- Period 8, original row 5182, representative 3754.
def source121 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B003.Data.entryAt ⟨57, by decide +kernel⟩

def target121 : Weights.Entry :=
  { word := [8, 4, 8, 4, 8, 12, 12], weights := [1, 0, 0, 1] }

-- Period 8, original row 5223, representative 3791.
def source122 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B003.Data.entryAt ⟨94, by decide +kernel⟩

def target122 : Weights.Entry :=
  { word := [8, 4, 8, 12, 8, 12, 10], weights := [1, 0, 1, 0] }

-- Period 8, original row 5224, representative 3755.
def source123 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B003.Data.entryAt ⟨58, by decide +kernel⟩

def target123 : Weights.Entry :=
  { word := [8, 4, 8, 12, 8, 12, 12], weights := [1, 0, 1, 0] }

-- Period 8, original row 5310, representative 3701.
def source124 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B003.Data.entryAt ⟨6, by decide +kernel⟩

def target124 : Weights.Entry :=
  { word := [8, 6, 8, 12, 8, 12, 10], weights := [1, 1, 1, 1] }

-- Period 8, original row 5311, representative 3717.
def source125 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B003.Data.entryAt ⟨22, by decide +kernel⟩

def target125 : Weights.Entry :=
  { word := [8, 6, 8, 12, 8, 12, 12], weights := [1, 1, 1, 1] }

-- Period 8, original row 5340, representative 3763.
def source126 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B003.Data.entryAt ⟨66, by decide +kernel⟩

def target126 : Weights.Entry :=
  { word := [8, 8, 0, 4, 0, 12, 12], weights := [1, 0, 1, 2] }

-- Period 8, original row 5366, representative 3761.
def source127 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B003.Data.entryAt ⟨64, by decide +kernel⟩

def target127 : Weights.Entry :=
  { word := [8, 8, 0, 4, 8, 12, 12], weights := [1, 0, 0, 1] }

def period8Entries : List Weights.Entry := [target0, target1, target2, target3, target4, target5, target6, target7, target8, target9, target10, target11, target12, target13, target14, target15, target16, target17, target18, target19, target20, target21, target22, target23, target24, target25, target26, target27, target28, target29, target30, target31, target32, target33, target34, target35, target36, target37, target38, target39, target40, target41, target42, target43, target44, target45, target46, target47, target48, target49, target50, target51, target52, target53, target54, target55, target56, target57, target58, target59, target60, target61, target62, target63, target64, target65, target66, target67, target68, target69, target70, target71, target72, target73, target74, target75, target76, target77, target78, target79, target80, target81, target82, target83, target84, target85, target86, target87, target88, target89, target90, target91, target92, target93, target94, target95, target96, target97, target98, target99, target100, target101, target102, target103, target104, target105, target106, target107, target108, target109, target110, target111, target112, target113, target114, target115, target116, target117, target118, target119, target120, target121, target122, target123, target124, target125, target126, target127]

def period8Chunk : RowCoverage.Chunk where
  rows := [⟨21, target0⟩, ⟨44, target1⟩, ⟨129, target2⟩, ⟨133, target3⟩, ⟨189, target4⟩, ⟨190, target5⟩, ⟨198, target6⟩, ⟨220, target7⟩, ⟨282, target8⟩, ⟨283, target9⟩, ⟨291, target10⟩, ⟨309, target11⟩, ⟨364, target12⟩, ⟨365, target13⟩, ⟨381, target14⟩, ⟨382, target15⟩, ⟨409, target16⟩, ⟨410, target17⟩, ⟨462, target18⟩, ⟨463, target19⟩, ⟨483, target20⟩, ⟨484, target21⟩, ⟨504, target22⟩, ⟨505, target23⟩, ⟨593, target24⟩, ⟨659, target25⟩, ⟨660, target26⟩, ⟨687, target27⟩, ⟨688, target28⟩, ⟨713, target29⟩, ⟨745, target30⟩, ⟨765, target31⟩, ⟨776, target32⟩, ⟨777, target33⟩, ⟨792, target34⟩, ⟨800, target35⟩, ⟨804, target36⟩, ⟨812, target37⟩, ⟨838, target38⟩, ⟨860, target39⟩, ⟨867, target40⟩, ⟨871, target41⟩, ⟨881, target42⟩, ⟨890, target43⟩, ⟨913, target44⟩, ⟨936, target45⟩, ⟨1007, target46⟩, ⟨1011, target47⟩, ⟨1058, target48⟩, ⟨1063, target49⟩, ⟨1121, target50⟩, ⟨1125, target51⟩, ⟨1149, target52⟩, ⟨1193, target53⟩, ⟨1197, target54⟩, ⟨1209, target55⟩, ⟨1304, target56⟩, ⟨1308, target57⟩, ⟨1341, target58⟩, ⟨1351, target59⟩, ⟨1358, target60⟩, ⟨1373, target61⟩, ⟨1407, target62⟩, ⟨1408, target63⟩, ⟨1435, target64⟩, ⟨1436, target65⟩, ⟨1482, target66⟩, ⟨1483, target67⟩, ⟨1503, target68⟩, ⟨1504, target69⟩, ⟨1526, target70⟩, ⟨1549, target71⟩, ⟨1592, target72⟩, ⟨1658, target73⟩, ⟨1659, target74⟩, ⟨1686, target75⟩, ⟨1687, target76⟩, ⟨1712, target77⟩, ⟨1758, target78⟩, ⟨1781, target79⟩, ⟨1882, target80⟩, ⟨1943, target81⟩, ⟨1944, target82⟩, ⟨1971, target83⟩, ⟨1972, target84⟩, ⟨1997, target85⟩, ⟨2043, target86⟩, ⟨2066, target87⟩, ⟨2241, target88⟩, ⟨2302, target89⟩, ⟨2303, target90⟩, ⟨2330, target91⟩, ⟨2331, target92⟩, ⟨2356, target93⟩, ⟨3460, target94⟩, ⟨3553, target95⟩, ⟨3691, target96⟩, ⟨4056, target97⟩, ⟨4108, target98⟩, ⟨4112, target99⟩, ⟨4122, target100⟩, ⟨4144, target101⟩, ⟨4180, target102⟩, ⟨4302, target103⟩, ⟨4303, target104⟩, ⟨4311, target105⟩, ⟨4367, target106⟩, ⟨4371, target107⟩, ⟨4478, target108⟩, ⟨4479, target109⟩, ⟨4487, target110⟩, ⟨4721, target111⟩, ⟨4742, target112⟩, ⟨4845, target113⟩, ⟨4846, target114⟩, ⟨4916, target115⟩, ⟨5000, target116⟩, ⟨5001, target117⟩, ⟨5023, target118⟩, ⟨5059, target119⟩, ⟨5181, target120⟩, ⟨5182, target121⟩, ⟨5223, target122⟩, ⟨5224, target123⟩, ⟨5310, target124⟩, ⟨5311, target125⟩, ⟨5340, target126⟩, ⟨5366, target127⟩]
  indexMask := 21230329735515720357682196652603705346965387732950656827945218197041048352757067832185237562134684934057893805108636908535570807721260985930970624820725751191346929828387326034777429726928935255991498737936042420891239699479180722077801584706765503916626763448516261060157820838506045896067086564594147667650490227605542440530144637118163889255361260753650684784395523377573981408253304412019184966856433802755071009526940614279468149649025399189489840949923518253901484627428673425917524392313489886876240350923743187720575521428164131313000943587927929723199172647672767720446912372129018813117550741904852599008547565155613595488607164537115239455001558040422939108045950062727954600868334013877064928691085524301885227556494277207350002917448305860672925550120331487390532698807548686474680045399416147245133734682600696901545876577447316959535479793443165469540766146832641134028621523849162794713541501990343096115968626995006796780346752354825098603517071491429302553015171423361522867188450193334563256831788968030294919107802711141697164022452428686952688315198256239351503904808506181717993063954265490408067975244758224552132637008902705140832274252429760341322659494039412340224452178401617855889959688494061409261509178368583208938677622528543439807444952935508040939038241552164812429437718571750839692639787776532529582818157948515401129539310237930394968854207912339200805721867855881482809861294963076412075647714327120762950906902183258883328486415392350038826969020588859551132912054086746916860195265677723349913311853335430878413574482389485315006649470223468664488190839797106474172488739717120
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

end FranklSmallCyclic.TransportBatches.G029.B000.Data
