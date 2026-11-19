module

public import Conjectures.FranklSmallCyclicRowCoverage
public import Conjectures.FranklSmallCyclicCanonicalWords
public import Conjectures.FranklSmallCyclicOrbit8Block024Data

/-! 128 literal targets sharing one source proof block.
Original words and row indices are retained; weights may be transported.
-/
@[expose] public section

namespace FranklSmallCyclic.TransportBatches.G050.B003.Data

-- Period 8, original row 5686, representative 6511.
def source0 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨120, by decide +kernel⟩

def target0 : Weights.Entry :=
  { word := [8, 8, 8, 2, 2, 10, 8], weights := [1, 0, 0, 1] }

-- Period 8, original row 5690, representative 6508.
def source1 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨117, by decide +kernel⟩

def target1 : Weights.Entry :=
  { word := [8, 8, 8, 2, 10, 10, 8], weights := [1, 0, 0, 1] }

-- Period 8, original row 5711, representative 6495.
def source2 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨104, by decide +kernel⟩

def target2 : Weights.Entry :=
  { word := [8, 8, 8, 8, 6, 10, 8], weights := [0, 1, 1, 0] }

-- Period 8, original row 5722, representative 6512.
def source3 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨121, by decide +kernel⟩

def target3 : Weights.Entry :=
  { word := [8, 8, 8, 10, 2, 10, 8], weights := [0, 1, 1, 0] }

-- Period 8, original row 5724, representative 6509.
def source4 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨118, by decide +kernel⟩

def target4 : Weights.Entry :=
  { word := [8, 8, 8, 10, 10, 10, 8], weights := [0, 1, 1, 0] }

-- Period 8, original row 5803, representative 6516.
def source5 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨125, by decide +kernel⟩

def target5 : Weights.Entry :=
  { word := [8, 8, 12, 2, 8, 10, 8], weights := [1, 0, 0, 1] }

-- Period 8, original row 5818, representative 6498.
def source6 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨107, by decide +kernel⟩

def target6 : Weights.Entry :=
  { word := [8, 8, 12, 8, 4, 10, 8], weights := [0, 1, 1, 0] }

-- Period 8, original row 5822, representative 6496.
def source7 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨105, by decide +kernel⟩

def target7 : Weights.Entry :=
  { word := [8, 8, 12, 8, 12, 10, 8], weights := [0, 1, 1, 0] }

-- Period 8, original row 5839, representative 6517.
def source8 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨126, by decide +kernel⟩

def target8 : Weights.Entry :=
  { word := [8, 8, 12, 10, 8, 10, 8], weights := [0, 1, 1, 0] }

-- Period 8, original row 6341, representative 6514.
def source9 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨123, by decide +kernel⟩

def target9 : Weights.Entry :=
  { word := [8, 12, 0, 4, 2, 8, 8], weights := [1, 0, 0, 1] }

def points9 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 6405, representative 6502.
def source10 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨111, by decide +kernel⟩

def target10 : Weights.Entry :=
  { word := [8, 12, 2, 0, 1, 8, 8], weights := [0, 1, 2, 1] }

def points10 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 6408, representative 6503.
def source11 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨112, by decide +kernel⟩

def target11 : Weights.Entry :=
  { word := [8, 12, 2, 0, 9, 8, 8], weights := [0, 1, 2, 1] }

def points11 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 6412, representative 6505.
def source12 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨114, by decide +kernel⟩

def target12 : Weights.Entry :=
  { word := [8, 12, 2, 8, 2, 0, 8], weights := [0, 1, 1, 0] }

def points12 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 6416, representative 6499.
def source13 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨108, by decide +kernel⟩

def target13 : Weights.Entry :=
  { word := [8, 12, 2, 8, 2, 8, 8], weights := [0, 1, 1, 0] }

def points13 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 6420, representative 6504.
def source14 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨113, by decide +kernel⟩

def target14 : Weights.Entry :=
  { word := [8, 12, 2, 8, 10, 0, 8], weights := [0, 1, 1, 0] }

def points14 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 6424, representative 6498.
def source15 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨107, by decide +kernel⟩

def target15 : Weights.Entry :=
  { word := [8, 12, 2, 8, 10, 8, 8], weights := [0, 1, 1, 0] }

def points15 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 6436, representative 6506.
def source16 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨115, by decide +kernel⟩

def target16 : Weights.Entry :=
  { word := [8, 12, 4, 4, 0, 8, 8], weights := [1, 0, 0, 1] }

def points16 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 6450, representative 6511.
def source17 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨120, by decide +kernel⟩

def target17 : Weights.Entry :=
  { word := [8, 12, 4, 4, 8, 8, 8], weights := [1, 0, 0, 1] }

def points17 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 6464, representative 6513.
def source18 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨122, by decide +kernel⟩

def target18 : Weights.Entry :=
  { word := [8, 12, 4, 12, 0, 8, 8], weights := [1, 0, 0, 1] }

def points18 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 6478, representative 6512.
def source19 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨121, by decide +kernel⟩

def target19 : Weights.Entry :=
  { word := [8, 12, 4, 12, 8, 8, 8], weights := [0, 1, 1, 0] }

def points19 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 6484, representative 6495.
def source20 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨104, by decide +kernel⟩

def target20 : Weights.Entry :=
  { word := [8, 12, 6, 8, 8, 8, 8], weights := [0, 1, 1, 0] }

def points20 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 6496, representative 6515.
def source21 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨124, by decide +kernel⟩

def target21 : Weights.Entry :=
  { word := [8, 12, 8, 4, 2, 8, 8], weights := [1, 0, 0, 1] }

def points21 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 6522, representative 6516.
def source22 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨125, by decide +kernel⟩

def target22 : Weights.Entry :=
  { word := [8, 12, 8, 4, 10, 8, 8], weights := [1, 0, 0, 1] }

def points22 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 6538, representative 6518.
def source23 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨127, by decide +kernel⟩

def target23 : Weights.Entry :=
  { word := [8, 12, 8, 12, 2, 8, 8], weights := [0, 1, 1, 0] }

def points23 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 6564, representative 6517.
def source24 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨126, by decide +kernel⟩

def target24 : Weights.Entry :=
  { word := [8, 12, 8, 12, 10, 8, 8], weights := [0, 1, 1, 0] }

def points24 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 6572, representative 6500.
def source25 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨109, by decide +kernel⟩

def target25 : Weights.Entry :=
  { word := [8, 12, 10, 0, 1, 8, 8], weights := [0, 1, 2, 1] }

def points25 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 6575, representative 6501.
def source26 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨110, by decide +kernel⟩

def target26 : Weights.Entry :=
  { word := [8, 12, 10, 0, 9, 8, 8], weights := [0, 1, 2, 1] }

def points26 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 6578, representative 6497.
def source27 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨106, by decide +kernel⟩

def target27 : Weights.Entry :=
  { word := [8, 12, 10, 8, 2, 8, 8], weights := [0, 1, 1, 0] }

def points27 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 6581, representative 6496.
def source28 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨105, by decide +kernel⟩

def target28 : Weights.Entry :=
  { word := [8, 12, 10, 8, 10, 8, 8], weights := [0, 1, 1, 0] }

def points28 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 6586, representative 6507.
def source29 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨116, by decide +kernel⟩

def target29 : Weights.Entry :=
  { word := [8, 12, 12, 4, 0, 8, 8], weights := [1, 0, 0, 1] }

def points29 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 6600, representative 6508.
def source30 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨117, by decide +kernel⟩

def target30 : Weights.Entry :=
  { word := [8, 12, 12, 4, 8, 8, 8], weights := [1, 0, 0, 1] }

def points30 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 6607, representative 6510.
def source31 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨119, by decide +kernel⟩

def target31 : Weights.Entry :=
  { word := [8, 12, 12, 12, 0, 8, 8], weights := [1, 0, 0, 1] }

def points31 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 6621, representative 6509.
def source32 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨118, by decide +kernel⟩

def target32 : Weights.Entry :=
  { word := [8, 12, 12, 12, 8, 8, 8], weights := [0, 1, 1, 0] }

def points32 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 6788, representative 6505.
def source33 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨114, by decide +kernel⟩

def target33 : Weights.Entry :=
  { word := [9, 0, 4, 8, 4, 10, 8], weights := [0, 1, 1, 0] }

def points33 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 8, original row 6930, representative 6504.
def source34 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨113, by decide +kernel⟩

def target34 : Weights.Entry :=
  { word := [9, 0, 12, 8, 4, 10, 8], weights := [0, 1, 1, 0] }

def points34 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 8, original row 7309, representative 6506.
def source35 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨115, by decide +kernel⟩

def target35 : Weights.Entry :=
  { word := [9, 12, 4, 4, 0, 8, 8], weights := [1, 0, 0, 1] }

def points35 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 7323, representative 6511.
def source36 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨120, by decide +kernel⟩

def target36 : Weights.Entry :=
  { word := [9, 12, 4, 4, 8, 8, 8], weights := [1, 0, 0, 1] }

def points36 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 7337, representative 6513.
def source37 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨122, by decide +kernel⟩

def target37 : Weights.Entry :=
  { word := [9, 12, 4, 12, 0, 8, 8], weights := [1, 0, 0, 1] }

def points37 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 7351, representative 6512.
def source38 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨121, by decide +kernel⟩

def target38 : Weights.Entry :=
  { word := [9, 12, 4, 12, 8, 8, 8], weights := [0, 1, 1, 0] }

def points38 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 7358, representative 6507.
def source39 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨116, by decide +kernel⟩

def target39 : Weights.Entry :=
  { word := [9, 12, 12, 4, 0, 8, 8], weights := [1, 0, 0, 1] }

def points39 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 7372, representative 6508.
def source40 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨117, by decide +kernel⟩

def target40 : Weights.Entry :=
  { word := [9, 12, 12, 4, 8, 8, 8], weights := [1, 0, 0, 1] }

def points40 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 7379, representative 6510.
def source41 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨119, by decide +kernel⟩

def target41 : Weights.Entry :=
  { word := [9, 12, 12, 12, 0, 8, 8], weights := [1, 0, 0, 1] }

def points41 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 7393, representative 6509.
def source42 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨118, by decide +kernel⟩

def target42 : Weights.Entry :=
  { word := [9, 12, 12, 12, 8, 8, 8], weights := [0, 1, 1, 0] }

def points42 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 9, original row 2, representative 6492.
def source43 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨101, by decide +kernel⟩

def target43 : Weights.Entry :=
  { word := [0, 0, 1, 4, 2, 0, 4], weights := [1, 0, 0, 1] }

def points43 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 9, original row 8, representative 6410.
def source44 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨20, by decide +kernel⟩

def target44 : Weights.Entry :=
  { word := [0, 0, 1, 4, 2, 8, 4], weights := [1, 0, 0, 1] }

def points44 : List (ℕ × ℕ) := [(0, 8), (1, 0), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 9, original row 24, representative 6488.
def source45 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨97, by decide +kernel⟩

def target45 : Weights.Entry :=
  { word := [0, 0, 1, 4, 10, 0, 4], weights := [1, 0, 0, 1] }

def points45 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 9, original row 30, representative 6398.
def source46 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨8, by decide +kernel⟩

def target46 : Weights.Entry :=
  { word := [0, 0, 1, 4, 10, 8, 4], weights := [1, 0, 0, 1] }

def points46 : List (ℕ × ℕ) := [(0, 8), (1, 0), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 9, original row 48, representative 6492.
def source47 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨101, by decide +kernel⟩

def target47 : Weights.Entry :=
  { word := [0, 0, 2, 2, 2, 0, 4], weights := [1, 0, 0, 1] }

def points47 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 2), (3, 3), (4, 5), (5, 4), (6, 6), (7, 7)]

-- Period 9, original row 56, representative 6405.
def source48 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨15, by decide +kernel⟩

def target48 : Weights.Entry :=
  { word := [0, 0, 2, 2, 2, 8, 4], weights := [1, 0, 0, 1] }

def points48 : List (ℕ × ℕ) := [(0, 8), (1, 0), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 9, original row 63, representative 6488.
def source49 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨97, by decide +kernel⟩

def target49 : Weights.Entry :=
  { word := [0, 0, 2, 2, 10, 0, 4], weights := [1, 0, 0, 1] }

def points49 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 2), (3, 3), (4, 5), (5, 4), (6, 6), (7, 7)]

-- Period 9, original row 71, representative 6393.
def source50 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨3, by decide +kernel⟩

def target50 : Weights.Entry :=
  { word := [0, 0, 2, 2, 10, 8, 4], weights := [1, 0, 0, 1] }

def points50 : List (ℕ × ℕ) := [(0, 8), (1, 0), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 9, original row 78, representative 6431.
def source51 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨41, by decide +kernel⟩

def target51 : Weights.Entry :=
  { word := [0, 0, 6, 2, 0, 8, 2], weights := [1, 0, 0, 1] }

def points51 : List (ℕ × ℕ) := [(0, 8), (1, 0), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 9, original row 79, representative 6431.
def source52 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨41, by decide +kernel⟩

def target52 : Weights.Entry :=
  { word := [0, 0, 6, 2, 0, 8, 4], weights := [1, 0, 0, 1] }

def points52 : List (ℕ × ℕ) := [(0, 7), (1, 0), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 8)]

-- Period 9, original row 86, representative 6417.
def source53 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨27, by decide +kernel⟩

def target53 : Weights.Entry :=
  { word := [0, 0, 6, 2, 8, 8, 2], weights := [0, 1, 0, 0] }

def points53 : List (ℕ × ℕ) := [(0, 8), (1, 0), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 9, original row 87, representative 6424.
def source54 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨34, by decide +kernel⟩

def target54 : Weights.Entry :=
  { word := [0, 0, 6, 2, 8, 8, 4], weights := [1, 0, 0, 1] }

def points54 : List (ℕ × ℕ) := [(0, 8), (1, 0), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 9, original row 107, representative 6406.
def source55 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨16, by decide +kernel⟩

def target55 : Weights.Entry :=
  { word := [0, 0, 10, 2, 2, 8, 4], weights := [1, 0, 0, 1] }

def points55 : List (ℕ × ℕ) := [(0, 8), (1, 0), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 9, original row 115, representative 6394.
def source56 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨4, by decide +kernel⟩

def target56 : Weights.Entry :=
  { word := [0, 0, 10, 2, 10, 8, 4], weights := [1, 0, 0, 1] }

def points56 : List (ℕ × ℕ) := [(0, 8), (1, 0), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 9, original row 120, representative 6492.
def source57 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨101, by decide +kernel⟩

def target57 : Weights.Entry :=
  { word := [0, 1, 0, 1, 4, 2, 0], weights := [1, 1, 0, 0] }

def points57 : List (ℕ × ℕ) := [(0, 1), (1, 2), (2, 7), (3, 4), (4, 6), (5, 5), (6, 3), (7, 8)]

-- Period 9, original row 122, representative 6492.
def source58 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨101, by decide +kernel⟩

def target58 : Weights.Entry :=
  { word := [0, 1, 0, 2, 2, 2, 0], weights := [1, 1, 0, 0] }

def points58 : List (ℕ × ℕ) := [(0, 1), (1, 2), (2, 7), (3, 4), (4, 5), (5, 6), (6, 3), (7, 8)]

-- Period 9, original row 148, representative 6477.
def source59 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨87, by decide +kernel⟩

def target59 : Weights.Entry :=
  { word := [0, 1, 4, 2, 0, 8, 0], weights := [0, 1, 0, 0] }

def points59 : List (ℕ × ℕ) := [(0, 7), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 8)]

-- Period 9, original row 156, representative 6466.
def source60 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨76, by decide +kernel⟩

def target60 : Weights.Entry :=
  { word := [0, 1, 4, 2, 0, 9, 0], weights := [0, 1, 0, 0] }

def points60 : List (ℕ × ℕ) := [(0, 8), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 9, original row 158, representative 6466.
def source61 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨76, by decide +kernel⟩

def target61 : Weights.Entry :=
  { word := [0, 1, 4, 2, 0, 10, 0], weights := [0, 1, 0, 0] }

def points61 : List (ℕ × ℕ) := [(0, 7), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 8)]

-- Period 9, original row 160, representative 6475.
def source62 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨85, by decide +kernel⟩

def target62 : Weights.Entry :=
  { word := [0, 1, 4, 2, 8, 2, 0], weights := [0, 1, 0, 0] }

def points62 : List (ℕ × ℕ) := [(0, 8), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 9, original row 164, representative 6467.
def source63 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨77, by decide +kernel⟩

def target63 : Weights.Entry :=
  { word := [0, 1, 4, 2, 8, 10, 0], weights := [0, 1, 0, 0] }

def points63 : List (ℕ × ℕ) := [(0, 8), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 9, original row 168, representative 6472.
def source64 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨82, by decide +kernel⟩

def target64 : Weights.Entry :=
  { word := [0, 1, 4, 4, 4, 8, 0], weights := [0, 0, 1, 0] }

def points64 : List (ℕ × ℕ) := [(0, 8), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 9, original row 170, representative 6471.
def source65 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨81, by decide +kernel⟩

def target65 : Weights.Entry :=
  { word := [0, 1, 4, 8, 4, 2, 0], weights := [0, 1, 1, 0] }

def points65 : List (ℕ × ℕ) := [(0, 8), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 9, original row 172, representative 6465.
def source66 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨75, by decide +kernel⟩

def target66 : Weights.Entry :=
  { word := [0, 1, 4, 8, 4, 10, 0], weights := [0, 1, 1, 0] }

def points66 : List (ℕ × ℕ) := [(0, 8), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 9, original row 200, representative 6473.
def source67 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨83, by decide +kernel⟩

def target67 : Weights.Entry :=
  { word := [0, 1, 4, 12, 4, 8, 0], weights := [0, 0, 1, 0] }

def points67 : List (ℕ × ℕ) := [(0, 8), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 9, original row 202, representative 6493.
def source68 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨102, by decide +kernel⟩

def target68 : Weights.Entry :=
  { word := [0, 1, 8, 1, 4, 2, 0], weights := [1, 1, 0, 0] }

def points68 : List (ℕ × ℕ) := [(0, 8), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 9, original row 203, representative 6483.
def source69 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨92, by decide +kernel⟩

def target69 : Weights.Entry :=
  { word := [0, 1, 8, 1, 4, 10, 0], weights := [1, 1, 0, 0] }

def points69 : List (ℕ × ℕ) := [(0, 8), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 9, original row 204, representative 6484.
def source70 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨93, by decide +kernel⟩

def target70 : Weights.Entry :=
  { word := [0, 1, 8, 2, 2, 2, 0], weights := [1, 1, 0, 0] }

def points70 : List (ℕ × ℕ) := [(0, 8), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 9, original row 206, representative 6480.
def source71 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨90, by decide +kernel⟩

def target71 : Weights.Entry :=
  { word := [0, 1, 8, 2, 2, 10, 0], weights := [1, 1, 0, 0] }

def points71 : List (ℕ × ℕ) := [(0, 8), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 9, original row 208, representative 6485.
def source72 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨94, by decide +kernel⟩

def target72 : Weights.Entry :=
  { word := [0, 1, 8, 2, 10, 2, 0], weights := [1, 1, 0, 0] }

def points72 : List (ℕ × ℕ) := [(0, 8), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 9, original row 210, representative 6481.
def source73 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨91, by decide +kernel⟩

def target73 : Weights.Entry :=
  { word := [0, 1, 8, 2, 10, 10, 0], weights := [1, 1, 0, 0] }

def points73 : List (ℕ × ℕ) := [(0, 8), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 9, original row 237, representative 6462.
def source74 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨72, by decide +kernel⟩

def target74 : Weights.Entry :=
  { word := [0, 1, 12, 2, 0, 8, 0], weights := [0, 1, 0, 0] }

def points74 : List (ℕ × ℕ) := [(0, 7), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 8)]

-- Period 9, original row 245, representative 6454.
def source75 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨64, by decide +kernel⟩

def target75 : Weights.Entry :=
  { word := [0, 1, 12, 2, 0, 9, 0], weights := [0, 1, 0, 0] }

def points75 : List (ℕ × ℕ) := [(0, 8), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 9, original row 247, representative 6454.
def source76 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨64, by decide +kernel⟩

def target76 : Weights.Entry :=
  { word := [0, 1, 12, 2, 0, 10, 0], weights := [0, 1, 0, 0] }

def points76 : List (ℕ × ℕ) := [(0, 7), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 8)]

-- Period 9, original row 249, representative 6460.
def source77 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨70, by decide +kernel⟩

def target77 : Weights.Entry :=
  { word := [0, 1, 12, 2, 8, 2, 0], weights := [0, 1, 0, 0] }

def points77 : List (ℕ × ℕ) := [(0, 8), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 9, original row 253, representative 6455.
def source78 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨65, by decide +kernel⟩

def target78 : Weights.Entry :=
  { word := [0, 1, 12, 2, 8, 10, 0], weights := [0, 1, 0, 0] }

def points78 : List (ℕ × ℕ) := [(0, 8), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 9, original row 257, representative 6458.
def source79 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨68, by decide +kernel⟩

def target79 : Weights.Entry :=
  { word := [0, 1, 12, 4, 4, 8, 0], weights := [0, 0, 1, 0] }

def points79 : List (ℕ × ℕ) := [(0, 8), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 9, original row 259, representative 6457.
def source80 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨67, by decide +kernel⟩

def target80 : Weights.Entry :=
  { word := [0, 1, 12, 8, 4, 2, 0], weights := [0, 1, 1, 0] }

def points80 : List (ℕ × ℕ) := [(0, 8), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 9, original row 261, representative 6453.
def source81 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨63, by decide +kernel⟩

def target81 : Weights.Entry :=
  { word := [0, 1, 12, 8, 4, 10, 0], weights := [0, 1, 1, 0] }

def points81 : List (ℕ × ℕ) := [(0, 8), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 9, original row 293, representative 6459.
def source82 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨69, by decide +kernel⟩

def target82 : Weights.Entry :=
  { word := [0, 1, 12, 12, 4, 8, 0], weights := [0, 0, 1, 0] }

def points82 : List (ℕ × ℕ) := [(0, 8), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 9, original row 320, representative 6477.
def source83 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨87, by decide +kernel⟩

def target83 : Weights.Entry :=
  { word := [0, 2, 2, 2, 0, 8, 0], weights := [1, 0, 0, 0] }

def points83 : List (ℕ × ℕ) := [(0, 7), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6), (7, 8)]

-- Period 9, original row 328, representative 6466.
def source84 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨76, by decide +kernel⟩

def target84 : Weights.Entry :=
  { word := [0, 2, 2, 2, 0, 9, 0], weights := [1, 0, 0, 0] }

def points84 : List (ℕ × ℕ) := [(0, 8), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6), (7, 7)]

-- Period 9, original row 330, representative 6466.
def source85 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨76, by decide +kernel⟩

def target85 : Weights.Entry :=
  { word := [0, 2, 2, 2, 0, 10, 0], weights := [1, 0, 0, 0] }

def points85 : List (ℕ × ℕ) := [(0, 7), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6), (7, 8)]

-- Period 9, original row 341, representative 6469.
def source86 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨79, by decide +kernel⟩

def target86 : Weights.Entry :=
  { word := [0, 2, 2, 2, 8, 2, 0], weights := [1, 1, 0, 0] }

def points86 : List (ℕ × ℕ) := [(0, 8), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 9, original row 348, representative 6476.
def source87 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨86, by decide +kernel⟩

def target87 : Weights.Entry :=
  { word := [0, 2, 2, 2, 8, 8, 0], weights := [1, 1, 0, 0] }

def points87 : List (ℕ × ℕ) := [(0, 8), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 9, original row 356, representative 6463.
def source88 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨73, by decide +kernel⟩

def target88 : Weights.Entry :=
  { word := [0, 2, 2, 2, 8, 9, 0], weights := [1, 1, 0, 0] }

def points88 : List (ℕ × ℕ) := [(0, 8), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 9, original row 358, representative 6464.
def source89 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨74, by decide +kernel⟩

def target89 : Weights.Entry :=
  { word := [0, 2, 2, 2, 8, 10, 0], weights := [1, 1, 0, 0] }

def points89 : List (ℕ × ℕ) := [(0, 8), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 9, original row 425, representative 6462.
def source90 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨72, by decide +kernel⟩

def target90 : Weights.Entry :=
  { word := [0, 2, 10, 2, 0, 8, 0], weights := [1, 0, 0, 0] }

def points90 : List (ℕ × ℕ) := [(0, 7), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6), (7, 8)]

-- Period 9, original row 433, representative 6454.
def source91 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨64, by decide +kernel⟩

def target91 : Weights.Entry :=
  { word := [0, 2, 10, 2, 0, 9, 0], weights := [1, 0, 0, 0] }

def points91 : List (ℕ × ℕ) := [(0, 8), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6), (7, 7)]

-- Period 9, original row 435, representative 6454.
def source92 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨64, by decide +kernel⟩

def target92 : Weights.Entry :=
  { word := [0, 2, 10, 2, 0, 10, 0], weights := [1, 0, 0, 0] }

def points92 : List (ℕ × ℕ) := [(0, 7), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6), (7, 8)]

-- Period 9, original row 439, representative 6456.
def source93 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨66, by decide +kernel⟩

def target93 : Weights.Entry :=
  { word := [0, 2, 10, 2, 8, 2, 0], weights := [1, 1, 0, 0] }

def points93 : List (ℕ × ℕ) := [(0, 8), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 9, original row 446, representative 6461.
def source94 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨71, by decide +kernel⟩

def target94 : Weights.Entry :=
  { word := [0, 2, 10, 2, 8, 8, 0], weights := [0, 1, 0, 0] }

def points94 : List (ℕ × ℕ) := [(0, 8), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 9, original row 454, representative 6451.
def source95 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨61, by decide +kernel⟩

def target95 : Weights.Entry :=
  { word := [0, 2, 10, 2, 8, 9, 0], weights := [0, 1, 0, 0] }

def points95 : List (ℕ × ℕ) := [(0, 8), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 9, original row 456, representative 6452.
def source96 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨62, by decide +kernel⟩

def target96 : Weights.Entry :=
  { word := [0, 2, 10, 2, 8, 10, 0], weights := [1, 1, 0, 0] }

def points96 : List (ℕ × ℕ) := [(0, 8), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 9, original row 508, representative 6492.
def source97 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨101, by decide +kernel⟩

def target97 : Weights.Entry :=
  { word := [0, 4, 0, 4, 2, 0, 4], weights := [1, 0, 0, 1] }

def points97 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 9, original row 514, representative 6410.
def source98 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨20, by decide +kernel⟩

def target98 : Weights.Entry :=
  { word := [0, 4, 0, 4, 2, 8, 4], weights := [1, 0, 0, 1] }

def points98 : List (ℕ × ℕ) := [(0, 8), (1, 0), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 9, original row 530, representative 6488.
def source99 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨97, by decide +kernel⟩

def target99 : Weights.Entry :=
  { word := [0, 4, 0, 4, 10, 0, 4], weights := [1, 0, 0, 1] }

def points99 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 9, original row 536, representative 6398.
def source100 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨8, by decide +kernel⟩

def target100 : Weights.Entry :=
  { word := [0, 4, 0, 4, 10, 8, 4], weights := [1, 0, 0, 1] }

def points100 : List (ℕ × ℕ) := [(0, 8), (1, 0), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 9, original row 552, representative 6492.
def source101 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨101, by decide +kernel⟩

def target101 : Weights.Entry :=
  { word := [0, 4, 2, 0, 1, 0, 1], weights := [0, 1, 0, 1] }

def points101 : List (ℕ × ℕ) := [(0, 7), (1, 8), (2, 1), (3, 4), (4, 3), (5, 5), (6, 6), (7, 2)]

-- Period 9, original row 553, representative 6492.
def source102 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨101, by decide +kernel⟩

def target102 : Weights.Entry :=
  { word := [0, 4, 2, 0, 1, 0, 2], weights := [0, 1, 0, 1] }

def points102 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 1), (3, 4), (4, 3), (5, 5), (6, 6), (7, 2)]

-- Period 9, original row 554, representative 6492.
def source103 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨101, by decide +kernel⟩

def target103 : Weights.Entry :=
  { word := [0, 4, 2, 0, 1, 0, 4], weights := [0, 1, 0, 1] }

def points103 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 1), (3, 4), (4, 3), (5, 5), (6, 6), (7, 2)]

-- Period 9, original row 566, representative 6493.
def source104 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨102, by decide +kernel⟩

def target104 : Weights.Entry :=
  { word := [0, 4, 2, 0, 9, 0, 1], weights := [0, 1, 0, 1] }

def points104 : List (ℕ × ℕ) := [(0, 2), (1, 8), (2, 7), (3, 6), (4, 4), (5, 5), (6, 3), (7, 1)]

-- Period 9, original row 567, representative 6493.
def source105 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨102, by decide +kernel⟩

def target105 : Weights.Entry :=
  { word := [0, 4, 2, 0, 9, 0, 2], weights := [0, 1, 0, 1] }

def points105 : List (ℕ × ℕ) := [(0, 2), (1, 0), (2, 7), (3, 6), (4, 4), (5, 5), (6, 3), (7, 1)]

-- Period 9, original row 580, representative 6471.
def source106 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨81, by decide +kernel⟩

def target106 : Weights.Entry :=
  { word := [0, 4, 2, 8, 2, 0, 1], weights := [0, 1, 1, 0] }

def points106 : List (ℕ × ℕ) := [(0, 2), (1, 8), (2, 7), (3, 6), (4, 4), (5, 5), (6, 3), (7, 1)]

-- Period 9, original row 581, representative 6471.
def source107 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨81, by decide +kernel⟩

def target107 : Weights.Entry :=
  { word := [0, 4, 2, 8, 2, 0, 2], weights := [0, 1, 1, 0] }

def points107 : List (ℕ × ℕ) := [(0, 2), (1, 0), (2, 7), (3, 6), (4, 4), (5, 5), (6, 3), (7, 1)]

-- Period 9, original row 594, representative 6457.
def source108 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨67, by decide +kernel⟩

def target108 : Weights.Entry :=
  { word := [0, 4, 2, 8, 10, 0, 1], weights := [0, 1, 1, 0] }

def points108 : List (ℕ × ℕ) := [(0, 2), (1, 8), (2, 7), (3, 6), (4, 4), (5, 5), (6, 3), (7, 1)]

-- Period 9, original row 595, representative 6457.
def source109 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨67, by decide +kernel⟩

def target109 : Weights.Entry :=
  { word := [0, 4, 2, 8, 10, 0, 2], weights := [0, 1, 1, 0] }

def points109 : List (ℕ × ℕ) := [(0, 2), (1, 0), (2, 7), (3, 6), (4, 4), (5, 5), (6, 3), (7, 1)]

-- Period 9, original row 602, representative 6492.
def source110 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨101, by decide +kernel⟩

def target110 : Weights.Entry :=
  { word := [0, 4, 4, 4, 0, 0, 1], weights := [1, 0, 0, 1] }

def points110 : List (ℕ × ℕ) := [(0, 7), (1, 8), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6), (7, 2)]

-- Period 9, original row 603, representative 6492.
def source111 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨101, by decide +kernel⟩

def target111 : Weights.Entry :=
  { word := [0, 4, 4, 4, 0, 0, 2], weights := [1, 0, 0, 1] }

def points111 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6), (7, 2)]

-- Period 9, original row 604, representative 6492.
def source112 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨101, by decide +kernel⟩

def target112 : Weights.Entry :=
  { word := [0, 4, 4, 4, 0, 0, 4], weights := [1, 0, 0, 1] }

def points112 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6), (7, 2)]

-- Period 9, original row 616, representative 6484.
def source113 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨93, by decide +kernel⟩

def target113 : Weights.Entry :=
  { word := [0, 4, 4, 4, 8, 0, 1], weights := [0, 0, 1, 1] }

def points113 : List (ℕ × ℕ) := [(0, 1), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 9, original row 617, representative 6484.
def source114 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨93, by decide +kernel⟩

def target114 : Weights.Entry :=
  { word := [0, 4, 4, 4, 8, 0, 2], weights := [0, 0, 1, 1] }

def points114 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 9, original row 635, representative 6475.
def source115 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨85, by decide +kernel⟩

def target115 : Weights.Entry :=
  { word := [0, 4, 8, 4, 2, 0, 1], weights := [0, 0, 1, 0] }

def points115 : List (ℕ × ℕ) := [(0, 1), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 9, original row 636, representative 6475.
def source116 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨85, by decide +kernel⟩

def target116 : Weights.Entry :=
  { word := [0, 4, 8, 4, 2, 0, 2], weights := [0, 0, 1, 0] }

def points116 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 9, original row 647, representative 6469.
def source117 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨79, by decide +kernel⟩

def target117 : Weights.Entry :=
  { word := [0, 4, 8, 4, 4, 4, 0], weights := [0, 0, 1, 1] }

def points117 : List (ℕ × ℕ) := [(0, 1), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 9, original row 661, representative 6460.
def source118 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨70, by decide +kernel⟩

def target118 : Weights.Entry :=
  { word := [0, 4, 8, 4, 10, 0, 1], weights := [0, 0, 1, 0] }

def points118 : List (ℕ × ℕ) := [(0, 1), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 9, original row 662, representative 6460.
def source119 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨70, by decide +kernel⟩

def target119 : Weights.Entry :=
  { word := [0, 4, 8, 4, 10, 0, 2], weights := [0, 0, 1, 0] }

def points119 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 9, original row 673, representative 6456.
def source120 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨66, by decide +kernel⟩

def target120 : Weights.Entry :=
  { word := [0, 4, 8, 4, 12, 4, 0], weights := [0, 0, 1, 1] }

def points120 : List (ℕ × ℕ) := [(0, 1), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 9, original row 724, representative 6485.
def source121 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨94, by decide +kernel⟩

def target121 : Weights.Entry :=
  { word := [0, 4, 12, 4, 8, 0, 1], weights := [0, 0, 1, 1] }

def points121 : List (ℕ × ℕ) := [(0, 1), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 9, original row 725, representative 6485.
def source122 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨94, by decide +kernel⟩

def target122 : Weights.Entry :=
  { word := [0, 4, 12, 4, 8, 0, 2], weights := [0, 0, 1, 1] }

def points122 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 9, original row 813, representative 6477.
def source123 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨87, by decide +kernel⟩

def target123 : Weights.Entry :=
  { word := [0, 8, 0, 4, 2, 0, 1], weights := [0, 0, 1, 0] }

def points123 : List (ℕ × ℕ) := [(0, 1), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 9, original row 814, representative 6477.
def source124 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨87, by decide +kernel⟩

def target124 : Weights.Entry :=
  { word := [0, 8, 0, 4, 2, 0, 2], weights := [0, 0, 1, 0] }

def points124 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 9, original row 825, representative 6477.
def source125 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨87, by decide +kernel⟩

def target125 : Weights.Entry :=
  { word := [0, 8, 0, 4, 4, 4, 0], weights := [0, 0, 0, 1] }

def points125 : List (ℕ × ℕ) := [(0, 1), (1, 8), (2, 7), (3, 5), (4, 6), (5, 4), (6, 3), (7, 2)]

-- Period 9, original row 839, representative 6462.
def source126 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨72, by decide +kernel⟩

def target126 : Weights.Entry :=
  { word := [0, 8, 0, 4, 10, 0, 1], weights := [0, 0, 1, 0] }

def points126 : List (ℕ × ℕ) := [(0, 1), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 9, original row 840, representative 6462.
def source127 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨72, by decide +kernel⟩

def target127 : Weights.Entry :=
  { word := [0, 8, 0, 4, 10, 0, 2], weights := [0, 0, 1, 0] }

def points127 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

def period8Entries : List Weights.Entry := [target0, target1, target2, target3, target4, target5, target6, target7, target8, target9, target10, target11, target12, target13, target14, target15, target16, target17, target18, target19, target20, target21, target22, target23, target24, target25, target26, target27, target28, target29, target30, target31, target32, target33, target34, target35, target36, target37, target38, target39, target40, target41, target42]

def period8Chunk : RowCoverage.Chunk where
  rows := [⟨5686, target0⟩, ⟨5690, target1⟩, ⟨5711, target2⟩, ⟨5722, target3⟩, ⟨5724, target4⟩, ⟨5803, target5⟩, ⟨5818, target6⟩, ⟨5822, target7⟩, ⟨5839, target8⟩, ⟨6341, target9⟩, ⟨6405, target10⟩, ⟨6408, target11⟩, ⟨6412, target12⟩, ⟨6416, target13⟩, ⟨6420, target14⟩, ⟨6424, target15⟩, ⟨6436, target16⟩, ⟨6450, target17⟩, ⟨6464, target18⟩, ⟨6478, target19⟩, ⟨6484, target20⟩, ⟨6496, target21⟩, ⟨6522, target22⟩, ⟨6538, target23⟩, ⟨6564, target24⟩, ⟨6572, target25⟩, ⟨6575, target26⟩, ⟨6578, target27⟩, ⟨6581, target28⟩, ⟨6586, target29⟩, ⟨6600, target30⟩, ⟨6607, target31⟩, ⟨6621, target32⟩, ⟨6788, target33⟩, ⟨6930, target34⟩, ⟨7309, target35⟩, ⟨7323, target36⟩, ⟨7337, target37⟩, ⟨7351, target38⟩, ⟨7358, target39⟩, ⟨7372, target40⟩, ⟨7379, target41⟩, ⟨7393, target42⟩]
  indexMask := 327178424919042666045843998057579150105480642055582185313664880467992060063541530809056254441344713008367612246073762275390495955054445810332994430331500302716826323989599931990509489441900692627765999317395035685970857584740988722960012178825341593941815023108741448374209107947148631130172143920040333303636957847413389930623785128091552598024560999380119657049411751815410036616650072430856044424661114315889576563478854186119059643888785498292527861696017405476175452395240596820770358870998990700917152054952394076682165577230993865465454849012134750719100181988368752731882153657848581132298133715441581694768550632038216401646959236947414370995601944815389212690765201051103422823773079913258634187533339747317884331854479406623600875640022866739786592954854955657518136084937422360671652104735256734667279915261223180467326721288934210319276626178911145829920161189859487408222412862326153009409811781936504365492048538012490687550879182504511718339273300052705315618470080351732956533276308170148767683054615160513065637512259351864300559887719732389148768770518404172099536567601794412808094804156589185042204515571207611156841293379746093452575681271532646186338962720713911715951677132717230457584681347969943537748731795321656649612493856752388258664244588139340107704198571602618557724564436811813698712557195516185904948231488555036412053743603456969797789472932134428046480182559768625606610174072014732430960808260768425977203063396453941963699899931942046844336336049607325455776612860928809835500848496873664013603961288254872222663830597311456046962772086820721625680828722003654792056911584656110068607686170428765805855076089742708152894287788327481900789355923576135992626658452280523378295379439880323513226031060844435854224226192496476012608837102315039953280062570776767207521758946693556989685074029997010869594489310402729780310354979513850715867167026779977718878282712812242974404617526457585880125390919897288541377936664797477898634079975766204381280899557583977508727829619139599560069223471068592429392374390369888097278875646162211098437962732863870035238101234279661216061317900993078589423750476161556909760220162845074159655432111897670645803120997336915951323181790821889607083564728320
  count := 43

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

def period9Entries : List Weights.Entry := [target43, target44, target45, target46, target47, target48, target49, target50, target51, target52, target53, target54, target55, target56, target57, target58, target59, target60, target61, target62, target63, target64, target65, target66, target67, target68, target69, target70, target71, target72, target73, target74, target75, target76, target77, target78, target79, target80, target81, target82, target83, target84, target85, target86, target87, target88, target89, target90, target91, target92, target93, target94, target95, target96, target97, target98, target99, target100, target101, target102, target103, target104, target105, target106, target107, target108, target109, target110, target111, target112, target113, target114, target115, target116, target117, target118, target119, target120, target121, target122, target123, target124, target125, target126, target127]

def period9Chunk : RowCoverage.Chunk where
  rows := [⟨2, target43⟩, ⟨8, target44⟩, ⟨24, target45⟩, ⟨30, target46⟩, ⟨48, target47⟩, ⟨56, target48⟩, ⟨63, target49⟩, ⟨71, target50⟩, ⟨78, target51⟩, ⟨79, target52⟩, ⟨86, target53⟩, ⟨87, target54⟩, ⟨107, target55⟩, ⟨115, target56⟩, ⟨120, target57⟩, ⟨122, target58⟩, ⟨148, target59⟩, ⟨156, target60⟩, ⟨158, target61⟩, ⟨160, target62⟩, ⟨164, target63⟩, ⟨168, target64⟩, ⟨170, target65⟩, ⟨172, target66⟩, ⟨200, target67⟩, ⟨202, target68⟩, ⟨203, target69⟩, ⟨204, target70⟩, ⟨206, target71⟩, ⟨208, target72⟩, ⟨210, target73⟩, ⟨237, target74⟩, ⟨245, target75⟩, ⟨247, target76⟩, ⟨249, target77⟩, ⟨253, target78⟩, ⟨257, target79⟩, ⟨259, target80⟩, ⟨261, target81⟩, ⟨293, target82⟩, ⟨320, target83⟩, ⟨328, target84⟩, ⟨330, target85⟩, ⟨341, target86⟩, ⟨348, target87⟩, ⟨356, target88⟩, ⟨358, target89⟩, ⟨425, target90⟩, ⟨433, target91⟩, ⟨435, target92⟩, ⟨439, target93⟩, ⟨446, target94⟩, ⟨454, target95⟩, ⟨456, target96⟩, ⟨508, target97⟩, ⟨514, target98⟩, ⟨530, target99⟩, ⟨536, target100⟩, ⟨552, target101⟩, ⟨553, target102⟩, ⟨554, target103⟩, ⟨566, target104⟩, ⟨567, target105⟩, ⟨580, target106⟩, ⟨581, target107⟩, ⟨594, target108⟩, ⟨595, target109⟩, ⟨602, target110⟩, ⟨603, target111⟩, ⟨604, target112⟩, ⟨616, target113⟩, ⟨617, target114⟩, ⟨635, target115⟩, ⟨636, target116⟩, ⟨647, target117⟩, ⟨661, target118⟩, ⟨662, target119⟩, ⟨673, target120⟩, ⟨724, target121⟩, ⟨725, target122⟩, ⟨813, target123⟩, ⟨814, target124⟩, ⟨825, target125⟩, ⟨839, target126⟩, ⟨840, target127⟩]
  indexMask := 10997563010004370890586521192067057688629796857225823242514579930846582966046698283655449959043082678433425889882296776442260120605654110998386967222786052269738810247839884488768241254202997319108560939625086555635894351192310521219837107045380829217028
  count := 85

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem period9Chunk_entries :
    period9Chunk.rows.map RowCoverage.TaggedRow.entry = period9Entries := rfl

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem period9_index_check :
    RowCoverage.indexCheck CanonicalWords.count period9Chunk = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem period9_words_check :
    RowCoverage.wordsCheck CanonicalWords.wordAt period9Chunk = true := by
  decide +kernel

end FranklSmallCyclic.TransportBatches.G050.B003.Data
