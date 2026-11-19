module

public import Conjectures.FranklSmallCyclicRowCoverage
public import Conjectures.FranklSmallCyclicCanonicalWords
public import Conjectures.FranklSmallCyclicOrbit8Block021Data

/-! 128 literal targets sharing one source proof block.
Original words and row indices are retained; weights may be transported.
-/
@[expose] public section

namespace FranklSmallCyclic.TransportBatches.G047.B001.Data

-- Period 8, original row 1441, representative 6012.
def source0 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B021.Data.entryAt ⟨6, by decide +kernel⟩

def target0 : Weights.Entry :=
  { word := [0, 10, 8, 4, 12, 12, 0], weights := [1, 0, 1, 0] }

-- Period 8, original row 1458, representative 6102.
def source1 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B021.Data.entryAt ⟨96, by decide +kernel⟩

def target1 : Weights.Entry :=
  { word := [0, 10, 10, 2, 8, 1, 8], weights := [1, 0, 0, 1] }

-- Period 8, original row 1460, representative 6106.
def source2 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B021.Data.entryAt ⟨100, by decide +kernel⟩

def target2 : Weights.Entry :=
  { word := [0, 10, 10, 2, 8, 2, 8], weights := [1, 0, 0, 1] }

-- Period 8, original row 1467, representative 6015.
def source3 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B021.Data.entryAt ⟨9, by decide +kernel⟩

def target3 : Weights.Entry :=
  { word := [0, 10, 10, 2, 8, 8, 1], weights := [0, 1, 0, 1] }

def points3 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 1470, representative 6118.
def source4 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B021.Data.entryAt ⟨112, by decide +kernel⟩

def target4 : Weights.Entry :=
  { word := [0, 10, 10, 2, 8, 8, 8], weights := [1, 0, 0, 1] }

-- Period 8, original row 1475, representative 6086.
def source5 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B021.Data.entryAt ⟨80, by decide +kernel⟩

def target5 : Weights.Entry :=
  { word := [0, 10, 10, 2, 8, 9, 8], weights := [1, 0, 0, 1] }

-- Period 8, original row 1477, representative 6090.
def source6 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B021.Data.entryAt ⟨84, by decide +kernel⟩

def target6 : Weights.Entry :=
  { word := [0, 10, 10, 2, 8, 10, 8], weights := [1, 0, 0, 1] }

-- Period 8, original row 1478, representative 6012.
def source7 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B021.Data.entryAt ⟨6, by decide +kernel⟩

def target7 : Weights.Entry :=
  { word := [0, 10, 10, 2, 8, 12, 0], weights := [0, 1, 0, 1] }

def points7 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 1484, representative 6103.
def source8 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B021.Data.entryAt ⟨97, by decide +kernel⟩

def target8 : Weights.Entry :=
  { word := [0, 10, 10, 10, 8, 1, 8], weights := [0, 1, 1, 0] }

-- Period 8, original row 1485, representative 6107.
def source9 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B021.Data.entryAt ⟨101, by decide +kernel⟩

def target9 : Weights.Entry :=
  { word := [0, 10, 10, 10, 8, 2, 8], weights := [0, 1, 1, 0] }

-- Period 8, original row 1491, representative 6016.
def source10 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B021.Data.entryAt ⟨10, by decide +kernel⟩

def target10 : Weights.Entry :=
  { word := [0, 10, 10, 10, 8, 8, 1], weights := [0, 1, 0, 1] }

def points10 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 1494, representative 6119.
def source11 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B021.Data.entryAt ⟨113, by decide +kernel⟩

def target11 : Weights.Entry :=
  { word := [0, 10, 10, 10, 8, 8, 8], weights := [0, 1, 1, 0] }

-- Period 8, original row 1498, representative 6087.
def source12 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B021.Data.entryAt ⟨81, by decide +kernel⟩

def target12 : Weights.Entry :=
  { word := [0, 10, 10, 10, 8, 9, 8], weights := [0, 1, 1, 0] }

-- Period 8, original row 1499, representative 6091.
def source13 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B021.Data.entryAt ⟨85, by decide +kernel⟩

def target13 : Weights.Entry :=
  { word := [0, 10, 10, 10, 8, 10, 8], weights := [0, 1, 1, 0] }

-- Period 8, original row 3421, representative 6042.
def source14 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B021.Data.entryAt ⟨36, by decide +kernel⟩

def target14 : Weights.Entry :=
  { word := [4, 0, 4, 2, 0, 8, 2], weights := [1, 0, 0, 1] }

-- Period 8, original row 3449, representative 6045.
def source15 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B021.Data.entryAt ⟨39, by decide +kernel⟩

def target15 : Weights.Entry :=
  { word := [4, 0, 4, 10, 0, 8, 2], weights := [1, 0, 0, 1] }

-- Period 8, original row 3510, representative 6043.
def source16 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B021.Data.entryAt ⟨37, by decide +kernel⟩

def target16 : Weights.Entry :=
  { word := [4, 0, 12, 2, 0, 8, 2], weights := [1, 0, 0, 1] }

-- Period 8, original row 3542, representative 6044.
def source17 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B021.Data.entryAt ⟨38, by decide +kernel⟩

def target17 : Weights.Entry :=
  { word := [4, 0, 12, 10, 0, 8, 2], weights := [1, 0, 0, 1] }

-- Period 8, original row 3677, representative 6037.
def source18 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B021.Data.entryAt ⟨31, by decide +kernel⟩

def target18 : Weights.Entry :=
  { word := [4, 4, 4, 8, 8, 2, 2], weights := [0, 1, 1, 0] }

-- Period 8, original row 3679, representative 6035.
def source19 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B021.Data.entryAt ⟨29, by decide +kernel⟩

def target19 : Weights.Entry :=
  { word := [4, 4, 4, 8, 8, 10, 2], weights := [0, 1, 1, 0] }

-- Period 8, original row 3693, representative 6037.
def source20 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B021.Data.entryAt ⟨31, by decide +kernel⟩

def target20 : Weights.Entry :=
  { word := [4, 4, 8, 8, 2, 2, 2], weights := [0, 1, 1, 0] }

def points20 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 3695, representative 6033.
def source21 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B021.Data.entryAt ⟨27, by decide +kernel⟩

def target21 : Weights.Entry :=
  { word := [4, 4, 8, 8, 2, 10, 2], weights := [0, 1, 1, 0] }

-- Period 8, original row 3702, representative 6036.
def source22 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B021.Data.entryAt ⟨30, by decide +kernel⟩

def target22 : Weights.Entry :=
  { word := [4, 4, 8, 8, 10, 2, 2], weights := [0, 1, 1, 0] }

-- Period 8, original row 3704, representative 6032.
def source23 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B021.Data.entryAt ⟨26, by decide +kernel⟩

def target23 : Weights.Entry :=
  { word := [4, 4, 8, 8, 10, 10, 2], weights := [0, 1, 1, 0] }

-- Period 8, original row 3707, representative 6036.
def source24 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B021.Data.entryAt ⟨30, by decide +kernel⟩

def target24 : Weights.Entry :=
  { word := [4, 4, 12, 8, 8, 2, 2], weights := [0, 1, 1, 0] }

def points24 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 3709, representative 6034.
def source25 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B021.Data.entryAt ⟨28, by decide +kernel⟩

def target25 : Weights.Entry :=
  { word := [4, 4, 12, 8, 8, 10, 2], weights := [0, 1, 1, 0] }

-- Period 8, original row 3724, representative 6042.
def source26 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B021.Data.entryAt ⟨36, by decide +kernel⟩

def target26 : Weights.Entry :=
  { word := [4, 8, 0, 4, 2, 0, 2], weights := [1, 0, 0, 1] }

def points26 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 3730, representative 6038.
def source27 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B021.Data.entryAt ⟨32, by decide +kernel⟩

def target27 : Weights.Entry :=
  { word := [4, 8, 0, 4, 2, 8, 2], weights := [1, 0, 1, 0] }

-- Period 8, original row 3750, representative 6043.
def source28 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B021.Data.entryAt ⟨37, by decide +kernel⟩

def target28 : Weights.Entry :=
  { word := [4, 8, 0, 4, 10, 0, 2], weights := [1, 0, 0, 1] }

def points28 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 3756, representative 6039.
def source29 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B021.Data.entryAt ⟨33, by decide +kernel⟩

def target29 : Weights.Entry :=
  { word := [4, 8, 0, 4, 10, 8, 2], weights := [1, 0, 1, 0] }

-- Period 8, original row 3768, representative 6045.
def source30 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B021.Data.entryAt ⟨39, by decide +kernel⟩

def target30 : Weights.Entry :=
  { word := [4, 8, 0, 12, 2, 0, 2], weights := [1, 0, 0, 1] }

def points30 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 3774, representative 6041.
def source31 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B021.Data.entryAt ⟨35, by decide +kernel⟩

def target31 : Weights.Entry :=
  { word := [4, 8, 0, 12, 2, 8, 2], weights := [1, 0, 1, 0] }

-- Period 8, original row 3793, representative 6044.
def source32 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B021.Data.entryAt ⟨38, by decide +kernel⟩

def target32 : Weights.Entry :=
  { word := [4, 8, 0, 12, 10, 0, 2], weights := [1, 0, 0, 1] }

def points32 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 3799, representative 6040.
def source33 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B021.Data.entryAt ⟨34, by decide +kernel⟩

def target33 : Weights.Entry :=
  { word := [4, 8, 0, 12, 10, 8, 2], weights := [1, 0, 1, 0] }

-- Period 8, original row 3812, representative 6038.
def source34 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B021.Data.entryAt ⟨32, by decide +kernel⟩

def target34 : Weights.Entry :=
  { word := [4, 8, 4, 2, 0, 8, 2], weights := [0, 1, 0, 1] }

def points34 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 3843, representative 6133.
def source35 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B021.Data.entryAt ⟨127, by decide +kernel⟩

def target35 : Weights.Entry :=
  { word := [4, 8, 4, 8, 12, 10, 8], weights := [0, 1, 1, 0] }

-- Period 8, original row 3847, representative 6041.
def source36 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B021.Data.entryAt ⟨35, by decide +kernel⟩

def target36 : Weights.Entry :=
  { word := [4, 8, 4, 10, 0, 8, 2], weights := [0, 1, 0, 1] }

def points36 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 3920, representative 6039.
def source37 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B021.Data.entryAt ⟨33, by decide +kernel⟩

def target37 : Weights.Entry :=
  { word := [4, 8, 12, 2, 0, 8, 2], weights := [0, 1, 0, 1] }

def points37 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 3947, representative 6132.
def source38 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B021.Data.entryAt ⟨126, by decide +kernel⟩

def target38 : Weights.Entry :=
  { word := [4, 8, 12, 8, 4, 10, 8], weights := [0, 1, 1, 0] }

-- Period 8, original row 3951, representative 6131.
def source39 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B021.Data.entryAt ⟨125, by decide +kernel⟩

def target39 : Weights.Entry :=
  { word := [4, 8, 12, 8, 12, 10, 8], weights := [0, 1, 1, 0] }

-- Period 8, original row 3955, representative 6040.
def source40 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B021.Data.entryAt ⟨34, by decide +kernel⟩

def target40 : Weights.Entry :=
  { word := [4, 8, 12, 10, 0, 8, 2], weights := [0, 1, 0, 1] }

def points40 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 4042, representative 6033.
def source41 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B021.Data.entryAt ⟨27, by decide +kernel⟩

def target41 : Weights.Entry :=
  { word := [4, 12, 4, 8, 8, 2, 2], weights := [0, 1, 1, 0] }

def points41 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 4044, representative 6031.
def source42 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B021.Data.entryAt ⟨25, by decide +kernel⟩

def target42 : Weights.Entry :=
  { word := [4, 12, 4, 8, 8, 10, 2], weights := [0, 1, 1, 0] }

-- Period 8, original row 4058, representative 6035.
def source43 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B021.Data.entryAt ⟨29, by decide +kernel⟩

def target43 : Weights.Entry :=
  { word := [4, 12, 8, 8, 2, 2, 2], weights := [0, 1, 1, 0] }

def points43 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 4060, representative 6031.
def source44 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B021.Data.entryAt ⟨25, by decide +kernel⟩

def target44 : Weights.Entry :=
  { word := [4, 12, 8, 8, 2, 10, 2], weights := [0, 1, 1, 0] }

def points44 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 4067, representative 6034.
def source45 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B021.Data.entryAt ⟨28, by decide +kernel⟩

def target45 : Weights.Entry :=
  { word := [4, 12, 8, 8, 10, 2, 2], weights := [0, 1, 1, 0] }

def points45 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 4069, representative 6030.
def source46 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B021.Data.entryAt ⟨24, by decide +kernel⟩

def target46 : Weights.Entry :=
  { word := [4, 12, 8, 8, 10, 10, 2], weights := [0, 1, 1, 0] }

-- Period 8, original row 4072, representative 6032.
def source47 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B021.Data.entryAt ⟨26, by decide +kernel⟩

def target47 : Weights.Entry :=
  { word := [4, 12, 12, 8, 8, 2, 2], weights := [0, 1, 1, 0] }

def points47 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 4074, representative 6030.
def source48 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B021.Data.entryAt ⟨24, by decide +kernel⟩

def target48 : Weights.Entry :=
  { word := [4, 12, 12, 8, 8, 10, 2], weights := [0, 1, 1, 0] }

def points48 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 4203, representative 6073.
def source49 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B021.Data.entryAt ⟨67, by decide +kernel⟩

def target49 : Weights.Entry :=
  { word := [8, 0, 2, 2, 2, 8, 1], weights := [1, 0, 0, 1] }

def points49 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 4218, representative 6074.
def source50 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B021.Data.entryAt ⟨68, by decide +kernel⟩

def target50 : Weights.Entry :=
  { word := [8, 0, 2, 2, 10, 8, 1], weights := [1, 0, 0, 1] }

def points50 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 4232, representative 6080.
def source51 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B021.Data.entryAt ⟨74, by decide +kernel⟩

def target51 : Weights.Entry :=
  { word := [8, 0, 2, 10, 2, 8, 1], weights := [1, 0, 0, 1] }

def points51 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 4246, representative 6077.
def source52 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B021.Data.entryAt ⟨71, by decide +kernel⟩

def target52 : Weights.Entry :=
  { word := [8, 0, 2, 10, 10, 8, 1], weights := [1, 0, 0, 1] }

def points52 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 4258, representative 6127.
def source53 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B021.Data.entryAt ⟨121, by decide +kernel⟩

def target53 : Weights.Entry :=
  { word := [8, 0, 4, 2, 0, 8, 1], weights := [0, 1, 0, 1] }

def points53 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 4290, representative 6130.
def source54 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B021.Data.entryAt ⟨124, by decide +kernel⟩

def target54 : Weights.Entry :=
  { word := [8, 0, 4, 10, 0, 8, 1], weights := [0, 1, 0, 1] }

def points54 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 4316, representative 6081.
def source55 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B021.Data.entryAt ⟨75, by decide +kernel⟩

def target55 : Weights.Entry :=
  { word := [8, 0, 6, 2, 0, 8, 1], weights := [1, 0, 0, 1] }

def points55 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 4324, representative 6082.
def source56 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B021.Data.entryAt ⟨76, by decide +kernel⟩

def target56 : Weights.Entry :=
  { word := [8, 0, 6, 2, 8, 8, 1], weights := [1, 0, 0, 1] }

def points56 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 4331, representative 6084.
def source57 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B021.Data.entryAt ⟨78, by decide +kernel⟩

def target57 : Weights.Entry :=
  { word := [8, 0, 6, 10, 0, 8, 1], weights := [1, 0, 0, 1] }

def points57 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 4338, representative 6083.
def source58 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B021.Data.entryAt ⟨77, by decide +kernel⟩

def target58 : Weights.Entry :=
  { word := [8, 0, 6, 10, 8, 8, 1], weights := [0, 1, 1, 0] }

def points58 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 4357, representative 6121.
def source59 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B021.Data.entryAt ⟨115, by decide +kernel⟩

def target59 : Weights.Entry :=
  { word := [8, 0, 8, 4, 4, 12, 0], weights := [0, 0, 1, 1] }

def points59 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 4363, representative 6050.
def source60 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B021.Data.entryAt ⟨44, by decide +kernel⟩

def target60 : Weights.Entry :=
  { word := [8, 0, 8, 8, 4, 6, 0], weights := [0, 1, 1, 0] }

def points60 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 4378, representative 6122.
def source61 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B021.Data.entryAt ⟨116, by decide +kernel⟩

def target61 : Weights.Entry :=
  { word := [8, 0, 8, 12, 4, 12, 0], weights := [0, 0, 1, 1] }

def points61 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 4382, representative 6101.
def source62 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B021.Data.entryAt ⟨95, by decide +kernel⟩

def target62 : Weights.Entry :=
  { word := [8, 0, 9, 4, 4, 12, 0], weights := [1, 0, 0, 1] }

def points62 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 4386, representative 6102.
def source63 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B021.Data.entryAt ⟨96, by decide +kernel⟩

def target63 : Weights.Entry :=
  { word := [8, 0, 9, 4, 12, 12, 0], weights := [1, 0, 0, 1] }

def points63 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 4390, representative 6104.
def source64 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B021.Data.entryAt ⟨98, by decide +kernel⟩

def target64 : Weights.Entry :=
  { word := [8, 0, 9, 12, 4, 12, 0], weights := [0, 1, 1, 0] }

def points64 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 4394, representative 6103.
def source65 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B021.Data.entryAt ⟨97, by decide +kernel⟩

def target65 : Weights.Entry :=
  { word := [8, 0, 9, 12, 12, 12, 0], weights := [0, 1, 1, 0] }

def points65 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 4397, representative 6078.
def source66 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B021.Data.entryAt ⟨72, by decide +kernel⟩

def target66 : Weights.Entry :=
  { word := [8, 0, 10, 2, 2, 8, 1], weights := [1, 0, 0, 1] }

def points66 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 4405, representative 6075.
def source67 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B021.Data.entryAt ⟨69, by decide +kernel⟩

def target67 : Weights.Entry :=
  { word := [8, 0, 10, 2, 10, 8, 1], weights := [1, 0, 0, 1] }

def points67 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 4412, representative 6079.
def source68 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B021.Data.entryAt ⟨73, by decide +kernel⟩

def target68 : Weights.Entry :=
  { word := [8, 0, 10, 10, 2, 8, 1], weights := [0, 1, 1, 0] }

def points68 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 4419, representative 6076.
def source69 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B021.Data.entryAt ⟨70, by decide +kernel⟩

def target69 : Weights.Entry :=
  { word := [8, 0, 10, 10, 10, 8, 1], weights := [0, 1, 1, 0] }

def points69 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 4431, representative 6128.
def source70 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B021.Data.entryAt ⟨122, by decide +kernel⟩

def target70 : Weights.Entry :=
  { word := [8, 0, 12, 2, 0, 8, 1], weights := [0, 1, 0, 1] }

def points70 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 4466, representative 6129.
def source71 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B021.Data.entryAt ⟨123, by decide +kernel⟩

def target71 : Weights.Entry :=
  { word := [8, 0, 12, 10, 0, 8, 1], weights := [0, 1, 0, 1] }

def points71 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 4666, representative 6007.
def source72 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B021.Data.entryAt ⟨1, by decide +kernel⟩

def target72 : Weights.Entry :=
  { word := [8, 2, 0, 1, 0, 8, 0], weights := [0, 1, 0, 0] }

def points72 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 4680, representative 6007.
def source73 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B021.Data.entryAt ⟨1, by decide +kernel⟩

def target73 : Weights.Entry :=
  { word := [8, 2, 0, 2, 0, 8, 0], weights := [0, 1, 0, 0] }

def points73 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 5), (4, 6), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 4702, representative 6008.
def source74 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B021.Data.entryAt ⟨2, by decide +kernel⟩

def target74 : Weights.Entry :=
  { word := [8, 2, 0, 9, 0, 8, 0], weights := [0, 1, 0, 0] }

def points74 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 4729, representative 6008.
def source75 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B021.Data.entryAt ⟨2, by decide +kernel⟩

def target75 : Weights.Entry :=
  { word := [8, 2, 0, 10, 0, 8, 0], weights := [0, 1, 0, 0] }

def points75 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 5), (4, 6), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 4892, representative 6006.
def source76 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B021.Data.entryAt ⟨0, by decide +kernel⟩

def target76 : Weights.Entry :=
  { word := [8, 2, 8, 10, 0, 8, 0], weights := [0, 1, 0, 0] }

def points76 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 5074, representative 6057.
def source77 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B021.Data.entryAt ⟨51, by decide +kernel⟩

def target77 : Weights.Entry :=
  { word := [8, 4, 2, 0, 1, 8, 1], weights := [0, 1, 2, 1] }

def points77 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 5077, representative 6058.
def source78 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B021.Data.entryAt ⟨52, by decide +kernel⟩

def target78 : Weights.Entry :=
  { word := [8, 4, 2, 0, 9, 8, 1], weights := [0, 1, 2, 1] }

def points78 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 5103, representative 6109.
def source79 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B021.Data.entryAt ⟨103, by decide +kernel⟩

def target79 : Weights.Entry :=
  { word := [8, 4, 4, 4, 0, 8, 1], weights := [1, 0, 0, 1] }

def points79 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 5117, representative 6110.
def source80 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B021.Data.entryAt ⟨104, by decide +kernel⟩

def target80 : Weights.Entry :=
  { word := [8, 4, 4, 4, 8, 8, 1], weights := [1, 0, 0, 1] }

def points80 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 5131, representative 6116.
def source81 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B021.Data.entryAt ⟨110, by decide +kernel⟩

def target81 : Weights.Entry :=
  { word := [8, 4, 4, 12, 0, 8, 1], weights := [1, 0, 0, 1] }

def points81 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 5145, representative 6113.
def source82 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B021.Data.entryAt ⟨107, by decide +kernel⟩

def target82 : Weights.Entry :=
  { word := [8, 4, 4, 12, 8, 8, 1], weights := [0, 1, 1, 0] }

def points82 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 5152, representative 6056.
def source83 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B021.Data.entryAt ⟨50, by decide +kernel⟩

def target83 : Weights.Entry :=
  { word := [8, 4, 6, 8, 8, 8, 1], weights := [0, 1, 1, 0] }

def points83 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 5171, representative 6105.
def source84 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B021.Data.entryAt ⟨99, by decide +kernel⟩

def target84 : Weights.Entry :=
  { word := [8, 4, 8, 4, 4, 12, 0], weights := [1, 0, 0, 1] }

def points84 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 5197, representative 6106.
def source85 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B021.Data.entryAt ⟨100, by decide +kernel⟩

def target85 : Weights.Entry :=
  { word := [8, 4, 8, 4, 12, 12, 0], weights := [1, 0, 0, 1] }

def points85 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 5213, representative 6108.
def source86 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B021.Data.entryAt ⟨102, by decide +kernel⟩

def target86 : Weights.Entry :=
  { word := [8, 4, 8, 12, 4, 12, 0], weights := [0, 1, 1, 0] }

def points86 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 5239, representative 6107.
def source87 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B021.Data.entryAt ⟨101, by decide +kernel⟩

def target87 : Weights.Entry :=
  { word := [8, 4, 8, 12, 12, 12, 0], weights := [0, 1, 1, 0] }

def points87 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 5241, representative 6060.
def source88 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B021.Data.entryAt ⟨54, by decide +kernel⟩

def target88 : Weights.Entry :=
  { word := [8, 4, 10, 0, 1, 8, 1], weights := [0, 1, 2, 1] }

def points88 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 5244, representative 6059.
def source89 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B021.Data.entryAt ⟨53, by decide +kernel⟩

def target89 : Weights.Entry :=
  { word := [8, 4, 10, 0, 9, 8, 1], weights := [0, 1, 2, 1] }

def points89 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 5253, representative 6114.
def source90 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B021.Data.entryAt ⟨108, by decide +kernel⟩

def target90 : Weights.Entry :=
  { word := [8, 4, 12, 4, 0, 8, 1], weights := [1, 0, 0, 1] }

def points90 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 5267, representative 6111.
def source91 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B021.Data.entryAt ⟨105, by decide +kernel⟩

def target91 : Weights.Entry :=
  { word := [8, 4, 12, 4, 8, 8, 1], weights := [1, 0, 0, 1] }

def points91 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 5274, representative 6115.
def source92 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B021.Data.entryAt ⟨109, by decide +kernel⟩

def target92 : Weights.Entry :=
  { word := [8, 4, 12, 12, 0, 8, 1], weights := [1, 0, 0, 1] }

def points92 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 5288, representative 6112.
def source93 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B021.Data.entryAt ⟨106, by decide +kernel⟩

def target93 : Weights.Entry :=
  { word := [8, 4, 12, 12, 8, 8, 1], weights := [0, 1, 1, 0] }

def points93 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 5524, representative 6061.
def source94 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B021.Data.entryAt ⟨55, by decide +kernel⟩

def target94 : Weights.Entry :=
  { word := [8, 8, 2, 2, 2, 8, 1], weights := [1, 0, 0, 1] }

def points94 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 5539, representative 6062.
def source95 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B021.Data.entryAt ⟨56, by decide +kernel⟩

def target95 : Weights.Entry :=
  { word := [8, 8, 2, 2, 10, 8, 1], weights := [1, 0, 0, 1] }

def points95 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 5553, representative 6068.
def source96 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B021.Data.entryAt ⟨62, by decide +kernel⟩

def target96 : Weights.Entry :=
  { word := [8, 8, 2, 10, 2, 8, 1], weights := [0, 1, 1, 0] }

def points96 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 5567, representative 6065.
def source97 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B021.Data.entryAt ⟨59, by decide +kernel⟩

def target97 : Weights.Entry :=
  { word := [8, 8, 2, 10, 10, 8, 1], weights := [0, 1, 1, 0] }

def points97 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 5579, representative 6123.
def source98 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B021.Data.entryAt ⟨117, by decide +kernel⟩

def target98 : Weights.Entry :=
  { word := [8, 8, 4, 2, 0, 8, 1], weights := [0, 1, 0, 1] }

def points98 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 5618, representative 6126.
def source99 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B021.Data.entryAt ⟨120, by decide +kernel⟩

def target99 : Weights.Entry :=
  { word := [8, 8, 4, 10, 0, 8, 1], weights := [0, 1, 0, 1] }

def points99 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 5642, representative 6069.
def source100 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B021.Data.entryAt ⟨63, by decide +kernel⟩

def target100 : Weights.Entry :=
  { word := [8, 8, 6, 2, 0, 8, 1], weights := [1, 0, 0, 1] }

def points100 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 5650, representative 6070.
def source101 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B021.Data.entryAt ⟨64, by decide +kernel⟩

def target101 : Weights.Entry :=
  { word := [8, 8, 6, 2, 8, 8, 1], weights := [1, 0, 0, 1] }

def points101 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 5657, representative 6072.
def source102 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B021.Data.entryAt ⟨66, by decide +kernel⟩

def target102 : Weights.Entry :=
  { word := [8, 8, 6, 10, 0, 8, 1], weights := [1, 0, 0, 1] }

def points102 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 5664, representative 6071.
def source103 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B021.Data.entryAt ⟨65, by decide +kernel⟩

def target103 : Weights.Entry :=
  { word := [8, 8, 6, 10, 8, 8, 1], weights := [0, 1, 1, 0] }

def points103 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 5693, representative 6117.
def source104 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B021.Data.entryAt ⟨111, by decide +kernel⟩

def target104 : Weights.Entry :=
  { word := [8, 8, 8, 4, 4, 12, 0], weights := [1, 0, 0, 1] }

def points104 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 5701, representative 6118.
def source105 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B021.Data.entryAt ⟨112, by decide +kernel⟩

def target105 : Weights.Entry :=
  { word := [8, 8, 8, 4, 12, 12, 0], weights := [1, 0, 0, 1] }

def points105 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 5707, representative 6049.
def source106 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B021.Data.entryAt ⟨43, by decide +kernel⟩

def target106 : Weights.Entry :=
  { word := [8, 8, 8, 8, 4, 6, 0], weights := [0, 1, 1, 0] }

def points106 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 5712, representative 6048.
def source107 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B021.Data.entryAt ⟨42, by decide +kernel⟩

def target107 : Weights.Entry :=
  { word := [8, 8, 8, 8, 12, 6, 0], weights := [0, 1, 1, 0] }

def points107 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 5727, representative 6120.
def source108 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B021.Data.entryAt ⟨114, by decide +kernel⟩

def target108 : Weights.Entry :=
  { word := [8, 8, 8, 12, 4, 12, 0], weights := [0, 1, 1, 0] }

def points108 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 5734, representative 6119.
def source109 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B021.Data.entryAt ⟨113, by decide +kernel⟩

def target109 : Weights.Entry :=
  { word := [8, 8, 8, 12, 12, 12, 0], weights := [0, 1, 1, 0] }

def points109 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 5738, representative 6085.
def source110 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B021.Data.entryAt ⟨79, by decide +kernel⟩

def target110 : Weights.Entry :=
  { word := [8, 8, 9, 4, 4, 12, 0], weights := [1, 0, 0, 1] }

def points110 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 5742, representative 6086.
def source111 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B021.Data.entryAt ⟨80, by decide +kernel⟩

def target111 : Weights.Entry :=
  { word := [8, 8, 9, 4, 12, 12, 0], weights := [1, 0, 0, 1] }

def points111 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 5746, representative 6088.
def source112 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B021.Data.entryAt ⟨82, by decide +kernel⟩

def target112 : Weights.Entry :=
  { word := [8, 8, 9, 12, 4, 12, 0], weights := [0, 1, 1, 0] }

def points112 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 5750, representative 6087.
def source113 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B021.Data.entryAt ⟨81, by decide +kernel⟩

def target113 : Weights.Entry :=
  { word := [8, 8, 9, 12, 12, 12, 0], weights := [0, 1, 1, 0] }

def points113 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 5753, representative 6066.
def source114 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B021.Data.entryAt ⟨60, by decide +kernel⟩

def target114 : Weights.Entry :=
  { word := [8, 8, 10, 2, 2, 8, 1], weights := [1, 0, 0, 1] }

def points114 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 5761, representative 6063.
def source115 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B021.Data.entryAt ⟨57, by decide +kernel⟩

def target115 : Weights.Entry :=
  { word := [8, 8, 10, 2, 10, 8, 1], weights := [1, 0, 0, 1] }

def points115 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 5768, representative 6067.
def source116 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B021.Data.entryAt ⟨61, by decide +kernel⟩

def target116 : Weights.Entry :=
  { word := [8, 8, 10, 10, 2, 8, 1], weights := [0, 1, 1, 0] }

def points116 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 5775, representative 6064.
def source117 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B021.Data.entryAt ⟨58, by decide +kernel⟩

def target117 : Weights.Entry :=
  { word := [8, 8, 10, 10, 10, 8, 1], weights := [0, 1, 1, 0] }

def points117 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 5787, representative 6124.
def source118 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B021.Data.entryAt ⟨118, by decide +kernel⟩

def target118 : Weights.Entry :=
  { word := [8, 8, 12, 2, 0, 8, 1], weights := [0, 1, 0, 1] }

def points118 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 5825, representative 6125.
def source119 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B021.Data.entryAt ⟨119, by decide +kernel⟩

def target119 : Weights.Entry :=
  { word := [8, 8, 12, 10, 0, 8, 1], weights := [0, 1, 0, 1] }

def points119 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 6404, representative 6052.
def source120 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B021.Data.entryAt ⟨46, by decide +kernel⟩

def target120 : Weights.Entry :=
  { word := [8, 12, 2, 0, 1, 8, 1], weights := [0, 1, 2, 1] }

def points120 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 6407, representative 6053.
def source121 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B021.Data.entryAt ⟨47, by decide +kernel⟩

def target121 : Weights.Entry :=
  { word := [8, 12, 2, 0, 9, 8, 1], weights := [0, 1, 2, 1] }

def points121 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 6423, representative 6132.
def source122 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B021.Data.entryAt ⟨126, by decide +kernel⟩

def target122 : Weights.Entry :=
  { word := [8, 12, 2, 8, 10, 8, 2], weights := [0, 1, 1, 0] }

def points122 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 6433, representative 6093.
def source123 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B021.Data.entryAt ⟨87, by decide +kernel⟩

def target123 : Weights.Entry :=
  { word := [8, 12, 4, 4, 0, 8, 1], weights := [1, 0, 0, 1] }

def points123 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 6447, representative 6094.
def source124 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B021.Data.entryAt ⟨88, by decide +kernel⟩

def target124 : Weights.Entry :=
  { word := [8, 12, 4, 4, 8, 8, 1], weights := [1, 0, 0, 1] }

def points124 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 6461, representative 6100.
def source125 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B021.Data.entryAt ⟨94, by decide +kernel⟩

def target125 : Weights.Entry :=
  { word := [8, 12, 4, 12, 0, 8, 1], weights := [1, 0, 0, 1] }

def points125 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 6475, representative 6097.
def source126 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B021.Data.entryAt ⟨91, by decide +kernel⟩

def target126 : Weights.Entry :=
  { word := [8, 12, 4, 12, 8, 8, 1], weights := [0, 1, 1, 0] }

def points126 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 6482, representative 6051.
def source127 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B021.Data.entryAt ⟨45, by decide +kernel⟩

def target127 : Weights.Entry :=
  { word := [8, 12, 6, 8, 8, 8, 1], weights := [0, 1, 1, 0] }

def points127 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

def period8Entries : List Weights.Entry := [target0, target1, target2, target3, target4, target5, target6, target7, target8, target9, target10, target11, target12, target13, target14, target15, target16, target17, target18, target19, target20, target21, target22, target23, target24, target25, target26, target27, target28, target29, target30, target31, target32, target33, target34, target35, target36, target37, target38, target39, target40, target41, target42, target43, target44, target45, target46, target47, target48, target49, target50, target51, target52, target53, target54, target55, target56, target57, target58, target59, target60, target61, target62, target63, target64, target65, target66, target67, target68, target69, target70, target71, target72, target73, target74, target75, target76, target77, target78, target79, target80, target81, target82, target83, target84, target85, target86, target87, target88, target89, target90, target91, target92, target93, target94, target95, target96, target97, target98, target99, target100, target101, target102, target103, target104, target105, target106, target107, target108, target109, target110, target111, target112, target113, target114, target115, target116, target117, target118, target119, target120, target121, target122, target123, target124, target125, target126, target127]

def period8Chunk : RowCoverage.Chunk where
  rows := [⟨1441, target0⟩, ⟨1458, target1⟩, ⟨1460, target2⟩, ⟨1467, target3⟩, ⟨1470, target4⟩, ⟨1475, target5⟩, ⟨1477, target6⟩, ⟨1478, target7⟩, ⟨1484, target8⟩, ⟨1485, target9⟩, ⟨1491, target10⟩, ⟨1494, target11⟩, ⟨1498, target12⟩, ⟨1499, target13⟩, ⟨3421, target14⟩, ⟨3449, target15⟩, ⟨3510, target16⟩, ⟨3542, target17⟩, ⟨3677, target18⟩, ⟨3679, target19⟩, ⟨3693, target20⟩, ⟨3695, target21⟩, ⟨3702, target22⟩, ⟨3704, target23⟩, ⟨3707, target24⟩, ⟨3709, target25⟩, ⟨3724, target26⟩, ⟨3730, target27⟩, ⟨3750, target28⟩, ⟨3756, target29⟩, ⟨3768, target30⟩, ⟨3774, target31⟩, ⟨3793, target32⟩, ⟨3799, target33⟩, ⟨3812, target34⟩, ⟨3843, target35⟩, ⟨3847, target36⟩, ⟨3920, target37⟩, ⟨3947, target38⟩, ⟨3951, target39⟩, ⟨3955, target40⟩, ⟨4042, target41⟩, ⟨4044, target42⟩, ⟨4058, target43⟩, ⟨4060, target44⟩, ⟨4067, target45⟩, ⟨4069, target46⟩, ⟨4072, target47⟩, ⟨4074, target48⟩, ⟨4203, target49⟩, ⟨4218, target50⟩, ⟨4232, target51⟩, ⟨4246, target52⟩, ⟨4258, target53⟩, ⟨4290, target54⟩, ⟨4316, target55⟩, ⟨4324, target56⟩, ⟨4331, target57⟩, ⟨4338, target58⟩, ⟨4357, target59⟩, ⟨4363, target60⟩, ⟨4378, target61⟩, ⟨4382, target62⟩, ⟨4386, target63⟩, ⟨4390, target64⟩, ⟨4394, target65⟩, ⟨4397, target66⟩, ⟨4405, target67⟩, ⟨4412, target68⟩, ⟨4419, target69⟩, ⟨4431, target70⟩, ⟨4466, target71⟩, ⟨4666, target72⟩, ⟨4680, target73⟩, ⟨4702, target74⟩, ⟨4729, target75⟩, ⟨4892, target76⟩, ⟨5074, target77⟩, ⟨5077, target78⟩, ⟨5103, target79⟩, ⟨5117, target80⟩, ⟨5131, target81⟩, ⟨5145, target82⟩, ⟨5152, target83⟩, ⟨5171, target84⟩, ⟨5197, target85⟩, ⟨5213, target86⟩, ⟨5239, target87⟩, ⟨5241, target88⟩, ⟨5244, target89⟩, ⟨5253, target90⟩, ⟨5267, target91⟩, ⟨5274, target92⟩, ⟨5288, target93⟩, ⟨5524, target94⟩, ⟨5539, target95⟩, ⟨5553, target96⟩, ⟨5567, target97⟩, ⟨5579, target98⟩, ⟨5618, target99⟩, ⟨5642, target100⟩, ⟨5650, target101⟩, ⟨5657, target102⟩, ⟨5664, target103⟩, ⟨5693, target104⟩, ⟨5701, target105⟩, ⟨5707, target106⟩, ⟨5712, target107⟩, ⟨5727, target108⟩, ⟨5734, target109⟩, ⟨5738, target110⟩, ⟨5742, target111⟩, ⟨5746, target112⟩, ⟨5750, target113⟩, ⟨5753, target114⟩, ⟨5761, target115⟩, ⟨5768, target116⟩, ⟨5775, target117⟩, ⟨5787, target118⟩, ⟨5825, target119⟩, ⟨6404, target120⟩, ⟨6407, target121⟩, ⟨6423, target122⟩, ⟨6433, target123⟩, ⟨6447, target124⟩, ⟨6461, target125⟩, ⟨6475, target126⟩, ⟨6482, target127⟩]
  indexMask := 19046353478301242783656797583681537602287242977145104720399051478906397186844016577460028963450939315778647253757651479872257008253002832081963341272907768933055327784866600464641141522057672638516791648179420680582331752845580874754238192752087113188513890741907107359544570362715497633148552754005510918717440912864526249590944174290809517081928818926823121102726460216026824756045185289200829518018995437996981400450896645707742022311471672386497291900199745478078902992861071372518127668493671606222194622412261473839633017143989677544248817255107183111133286835704583538004624564243085161616271759493344534087410119373871461818006949586433399942999890497323476002342726953794046275018650981996066505151524985757364671874107131109828563918097613859104134806400515229768276215184209239852723270022708986944808051475509440317044653467873454623049076073991769655850587091537487452359449366156210505611496298964875233175312802359648512463586973647135572226382485963155601569577854173507227409333064524251322915977762281408368612810112230846765939588194235071083603363651998799704317005610122781767354675152917710603727041857994553074085428007398653496784652902853035482850312442109086803164887422176325363699512263284290761778760996490281553647867498260348697852944896104271235371922461850934557206263160144458655991207499074108587431157652876063215991265561826354721629590554203360483782155733642867902861764417257646231611258272619750392259314649308890473542252770878914140090675311823692876305671731875953035199110075465612501068429844372002793973564052162879560047601357429308283500305853455652736579426950517086024860114750949817355084530234085591741484163281161067229800865045827139040227856645118331686978371776214279567071809306194529258828260484125494763851611858469787581035592203420167600123312416832953754751770858110238095331744661159916264909699342682854435674572628117243765356411942289682885120654325059913124568417974706957800179761152
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

end FranklSmallCyclic.TransportBatches.G047.B001.Data
