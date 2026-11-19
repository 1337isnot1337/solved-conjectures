module

public import Conjectures.FranklSmallCyclicRowCoverage
public import Conjectures.FranklSmallCyclicCanonicalWords
public import Conjectures.FranklSmallCyclicOrbit9Block003Data

/-! 128 literal targets sharing one source proof block.
Original words and row indices are retained; weights may be transported.
-/
@[expose] public section

namespace FranklSmallCyclic.TransportBatches.G056.B001.Data

-- Period 9, original row 6386, representative 7151.
def source0 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨18, by decide +kernel⟩

def target0 : Weights.Entry :=
  { word := [8, 12, 0, 12, 8, 4, 12], weights := [1, 0, 1, 0] }

def points0 : List (ℕ × ℕ) := [(0, 0), (1, 2), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 6506, representative 7139.
def source1 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨6, by decide +kernel⟩

def target1 : Weights.Entry :=
  { word := [8, 12, 8, 4, 8, 4, 10], weights := [1, 0, 1, 0] }

-- Period 9, original row 6507, representative 7149.
def source2 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨16, by decide +kernel⟩

def target2 : Weights.Entry :=
  { word := [8, 12, 8, 4, 8, 4, 12], weights := [1, 0, 0, 1] }

-- Period 9, original row 6548, representative 7140.
def source3 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨7, by decide +kernel⟩

def target3 : Weights.Entry :=
  { word := [8, 12, 8, 12, 8, 4, 10], weights := [1, 0, 1, 0] }

-- Period 9, original row 6549, representative 7150.
def source4 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨17, by decide +kernel⟩

def target4 : Weights.Entry :=
  { word := [8, 12, 8, 12, 8, 4, 12], weights := [1, 0, 1, 0] }

-- Period 9, original row 6642, representative 7137.
def source5 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨4, by decide +kernel⟩

def target5 : Weights.Entry :=
  { word := [9, 0, 1, 4, 8, 4, 10], weights := [1, 0, 1, 0] }

def points5 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 6643, representative 7147.
def source6 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨14, by decide +kernel⟩

def target6 : Weights.Entry :=
  { word := [9, 0, 1, 4, 8, 4, 12], weights := [1, 0, 0, 1] }

def points6 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 6678, representative 7144.
def source7 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨11, by decide +kernel⟩

def target7 : Weights.Entry :=
  { word := [9, 0, 1, 12, 8, 4, 10], weights := [1, 0, 1, 0] }

def points7 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 6679, representative 7154.
def source8 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨21, by decide +kernel⟩

def target8 : Weights.Entry :=
  { word := [9, 0, 1, 12, 8, 4, 12], weights := [1, 0, 1, 0] }

def points8 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 6808, representative 7170.
def source9 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨37, by decide +kernel⟩

def target9 : Weights.Entry :=
  { word := [9, 0, 4, 10, 8, 4, 12], weights := [1, 0, 1, 1] }

def points9 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 6837, representative 7165.
def source10 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨32, by decide +kernel⟩

def target10 : Weights.Entry :=
  { word := [9, 0, 8, 9, 4, 4, 12], weights := [1, 0, 1, 1] }

def points10 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 6841, representative 7161.
def source11 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨28, by decide +kernel⟩

def target11 : Weights.Entry :=
  { word := [9, 0, 8, 9, 12, 4, 12], weights := [1, 0, 1, 1] }

def points11 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 6936, representative 7171.
def source12 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨38, by decide +kernel⟩

def target12 : Weights.Entry :=
  { word := [9, 0, 12, 10, 0, 4, 10], weights := [1, 0, 1, 1] }

def points12 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 6937, representative 7171.
def source13 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨38, by decide +kernel⟩

def target13 : Weights.Entry :=
  { word := [9, 0, 12, 10, 0, 4, 12], weights := [1, 0, 1, 1] }

def points13 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 8), (8, 7)]

-- Period 9, original row 6954, representative 7169.
def source14 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨36, by decide +kernel⟩

def target14 : Weights.Entry :=
  { word := [9, 0, 12, 10, 8, 4, 12], weights := [1, 0, 1, 1] }

def points14 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 7078, representative 7138.
def source15 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨5, by decide +kernel⟩

def target15 : Weights.Entry :=
  { word := [9, 8, 1, 4, 8, 4, 10], weights := [1, 0, 1, 0] }

def points15 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 7079, representative 7148.
def source16 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨15, by decide +kernel⟩

def target16 : Weights.Entry :=
  { word := [9, 8, 1, 4, 8, 4, 12], weights := [1, 0, 0, 1] }

def points16 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 7114, representative 7141.
def source17 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨8, by decide +kernel⟩

def target17 : Weights.Entry :=
  { word := [9, 8, 1, 12, 8, 4, 10], weights := [1, 0, 1, 0] }

def points17 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 7115, representative 7151.
def source18 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨18, by decide +kernel⟩

def target18 : Weights.Entry :=
  { word := [9, 8, 1, 12, 8, 4, 12], weights := [1, 0, 1, 0] }

def points18 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 7418, representative 7256.
def source19 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨122, by decide +kernel⟩

def target19 : Weights.Entry :=
  { word := [10, 0, 0, 12, 0, 12, 4], weights := [0, 0, 1, 1] }

def points19 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2)]

-- Period 9, original row 7431, representative 7237.
def source20 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨103, by decide +kernel⟩

def target20 : Weights.Entry :=
  { word := [10, 0, 4, 2, 0, 8, 10], weights := [1, 0, 0, 1] }

-- Period 9, original row 7432, representative 7237.
def source21 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨103, by decide +kernel⟩

def target21 : Weights.Entry :=
  { word := [10, 0, 4, 2, 0, 8, 12], weights := [1, 0, 0, 1] }

def points21 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 8), (8, 7)]

-- Period 9, original row 7440, representative 7238.
def source22 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨104, by decide +kernel⟩

def target22 : Weights.Entry :=
  { word := [10, 0, 4, 2, 8, 8, 12], weights := [1, 0, 0, 1] }

-- Period 9, original row 7454, representative 7244.
def source23 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨110, by decide +kernel⟩

def target23 : Weights.Entry :=
  { word := [10, 0, 4, 10, 0, 8, 10], weights := [1, 0, 0, 1] }

-- Period 9, original row 7455, representative 7244.
def source24 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨110, by decide +kernel⟩

def target24 : Weights.Entry :=
  { word := [10, 0, 4, 10, 0, 8, 12], weights := [1, 0, 0, 1] }

def points24 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 8), (8, 7)]

-- Period 9, original row 7467, representative 7241.
def source25 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨107, by decide +kernel⟩

def target25 : Weights.Entry :=
  { word := [10, 0, 4, 10, 8, 8, 12], weights := [1, 0, 0, 1] }

-- Period 9, original row 7490, representative 7253.
def source26 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨119, by decide +kernel⟩

def target26 : Weights.Entry :=
  { word := [10, 0, 8, 4, 8, 12, 4], weights := [1, 0, 0, 1] }

def points26 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 7509, representative 7255.
def source27 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨121, by decide +kernel⟩

def target27 : Weights.Entry :=
  { word := [10, 0, 8, 12, 0, 12, 2], weights := [0, 0, 1, 1] }

def points27 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 7510, representative 7255.
def source28 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨121, by decide +kernel⟩

def target28 : Weights.Entry :=
  { word := [10, 0, 8, 12, 0, 12, 4], weights := [0, 0, 1, 1] }

def points28 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 7520, representative 7254.
def source29 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨120, by decide +kernel⟩

def target29 : Weights.Entry :=
  { word := [10, 0, 8, 12, 8, 12, 4], weights := [0, 0, 1, 1] }

def points29 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 7548, representative 7242.
def source30 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨108, by decide +kernel⟩

def target30 : Weights.Entry :=
  { word := [10, 0, 12, 2, 0, 8, 10], weights := [1, 0, 0, 1] }

-- Period 9, original row 7549, representative 7242.
def source31 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨108, by decide +kernel⟩

def target31 : Weights.Entry :=
  { word := [10, 0, 12, 2, 0, 8, 12], weights := [1, 0, 0, 1] }

def points31 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 8), (8, 7)]

-- Period 9, original row 7557, representative 7239.
def source32 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨105, by decide +kernel⟩

def target32 : Weights.Entry :=
  { word := [10, 0, 12, 2, 8, 8, 12], weights := [1, 0, 0, 1] }

-- Period 9, original row 7576, representative 7243.
def source33 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨109, by decide +kernel⟩

def target33 : Weights.Entry :=
  { word := [10, 0, 12, 10, 0, 8, 10], weights := [1, 0, 0, 1] }

-- Period 9, original row 7577, representative 7243.
def source34 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨109, by decide +kernel⟩

def target34 : Weights.Entry :=
  { word := [10, 0, 12, 10, 0, 8, 12], weights := [1, 0, 0, 1] }

def points34 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 8), (8, 7)]

-- Period 9, original row 7589, representative 7240.
def source35 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨106, by decide +kernel⟩

def target35 : Weights.Entry :=
  { word := [10, 0, 12, 10, 8, 8, 12], weights := [1, 0, 0, 1] }

-- Period 9, original row 7596, representative 7202.
def source36 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨69, by decide +kernel⟩

def target36 : Weights.Entry :=
  { word := [10, 2, 0, 1, 0, 8, 0], weights := [1, 1, 0, 0] }

def points36 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2)]

-- Period 9, original row 7597, representative 7202.
def source37 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨69, by decide +kernel⟩

def target37 : Weights.Entry :=
  { word := [10, 2, 0, 2, 0, 8, 0], weights := [1, 1, 0, 0] }

def points37 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 5), (4, 6), (5, 4), (6, 3), (7, 1), (8, 2)]

-- Period 9, original row 7600, representative 7203.
def source38 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨70, by decide +kernel⟩

def target38 : Weights.Entry :=
  { word := [10, 2, 0, 9, 0, 8, 0], weights := [0, 1, 1, 0] }

def points38 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2)]

-- Period 9, original row 7617, representative 7158.
def source39 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨25, by decide +kernel⟩

def target39 : Weights.Entry :=
  { word := [10, 2, 0, 10, 0, 0, 8], weights := [0, 1, 0, 1] }

def points39 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2)]

-- Period 9, original row 7621, representative 7203.
def source40 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨70, by decide +kernel⟩

def target40 : Weights.Entry :=
  { word := [10, 2, 0, 10, 0, 8, 0], weights := [0, 1, 0, 1] }

def points40 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 5), (4, 6), (5, 4), (6, 3), (7, 1), (8, 2)]

-- Period 9, original row 7624, representative 7157.
def source41 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨24, by decide +kernel⟩

def target41 : Weights.Entry :=
  { word := [10, 2, 0, 10, 0, 8, 8], weights := [0, 1, 0, 1] }

def points41 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2)]

-- Period 9, original row 7634, representative 7171.
def source42 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨38, by decide +kernel⟩

def target42 : Weights.Entry :=
  { word := [10, 2, 0, 12, 10, 0, 8], weights := [1, 1, 0, 1] }

def points42 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2)]

-- Period 9, original row 7640, representative 7179.
def source43 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨46, by decide +kernel⟩

def target43 : Weights.Entry :=
  { word := [10, 2, 2, 8, 0, 8, 0], weights := [1, 0, 1, 0] }

def points43 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 7642, representative 7133.
def source44 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨1, by decide +kernel⟩

def target44 : Weights.Entry :=
  { word := [10, 2, 2, 8, 1, 0, 1], weights := [1, 1, 0, 1] }

def points44 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 7645, representative 7166.
def source45 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨33, by decide +kernel⟩

def target45 : Weights.Entry :=
  { word := [10, 2, 2, 8, 1, 0, 8], weights := [1, 1, 0, 1] }

def points45 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 7650, representative 7164.
def source46 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨31, by decide +kernel⟩

def target46 : Weights.Entry :=
  { word := [10, 2, 2, 8, 1, 8, 8], weights := [1, 1, 1, 1] }

def points46 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 7652, representative 7175.
def source47 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨42, by decide +kernel⟩

def target47 : Weights.Entry :=
  { word := [10, 2, 2, 8, 2, 8, 0], weights := [1, 0, 1, 0] }

def points47 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 7654, representative 7178.
def source48 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨45, by decide +kernel⟩

def target48 : Weights.Entry :=
  { word := [10, 2, 2, 8, 8, 8, 0], weights := [1, 0, 1, 0] }

def points48 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 7656, representative 7132.
def source49 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨0, by decide +kernel⟩

def target49 : Weights.Entry :=
  { word := [10, 2, 2, 8, 9, 0, 1], weights := [1, 1, 0, 1] }

def points49 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 7659, representative 7165.
def source50 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨32, by decide +kernel⟩

def target50 : Weights.Entry :=
  { word := [10, 2, 2, 8, 9, 0, 8], weights := [1, 1, 0, 1] }

def points50 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 7664, representative 7163.
def source51 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨30, by decide +kernel⟩

def target51 : Weights.Entry :=
  { word := [10, 2, 2, 8, 9, 8, 8], weights := [1, 1, 1, 1] }

def points51 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 7666, representative 7174.
def source52 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨41, by decide +kernel⟩

def target52 : Weights.Entry :=
  { word := [10, 2, 2, 8, 10, 8, 0], weights := [1, 0, 1, 0] }

def points52 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 7667, representative 7184.
def source53 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨51, by decide +kernel⟩

def target53 : Weights.Entry :=
  { word := [10, 2, 8, 1, 0, 8, 0], weights := [1, 1, 0, 0] }

def points53 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 7669, representative 7147.
def source54 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨14, by decide +kernel⟩

def target54 : Weights.Entry :=
  { word := [10, 2, 8, 2, 0, 1, 8], weights := [1, 0, 0, 1] }

def points54 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 7671, representative 7147.
def source55 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨14, by decide +kernel⟩

def target55 : Weights.Entry :=
  { word := [10, 2, 8, 2, 0, 2, 8], weights := [1, 0, 0, 1] }

def points55 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 7672, representative 7200.
def source56 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨67, by decide +kernel⟩

def target56 : Weights.Entry :=
  { word := [10, 2, 8, 2, 0, 8, 0], weights := [1, 0, 0, 1] }

def points56 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 7676, representative 7155.
def source57 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨22, by decide +kernel⟩

def target57 : Weights.Entry :=
  { word := [10, 2, 8, 2, 0, 8, 8], weights := [1, 0, 0, 1] }

def points57 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 7680, representative 7194.
def source58 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨61, by decide +kernel⟩

def target58 : Weights.Entry :=
  { word := [10, 2, 8, 2, 0, 9, 0], weights := [1, 0, 0, 1] }

def points58 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 7681, representative 7148.
def source59 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨15, by decide +kernel⟩

def target59 : Weights.Entry :=
  { word := [10, 2, 8, 2, 0, 9, 8], weights := [1, 0, 0, 1] }

def points59 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 7682, representative 7194.
def source60 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨61, by decide +kernel⟩

def target60 : Weights.Entry :=
  { word := [10, 2, 8, 2, 0, 10, 0], weights := [1, 0, 0, 1] }

def points60 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 7683, representative 7148.
def source61 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨15, by decide +kernel⟩

def target61 : Weights.Entry :=
  { word := [10, 2, 8, 2, 0, 10, 8], weights := [1, 0, 0, 1] }

def points61 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 7686, representative 7198.
def source62 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨65, by decide +kernel⟩

def target62 : Weights.Entry :=
  { word := [10, 2, 8, 2, 8, 2, 0], weights := [1, 0, 0, 1] }

def points62 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 7687, representative 7152.
def source63 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨19, by decide +kernel⟩

def target63 : Weights.Entry :=
  { word := [10, 2, 8, 2, 8, 2, 8], weights := [1, 0, 0, 1] }

def points63 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 7690, representative 7195.
def source64 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨62, by decide +kernel⟩

def target64 : Weights.Entry :=
  { word := [10, 2, 8, 2, 8, 10, 0], weights := [1, 0, 0, 1] }

def points64 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 7691, representative 7149.
def source65 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨16, by decide +kernel⟩

def target65 : Weights.Entry :=
  { word := [10, 2, 8, 2, 8, 10, 8], weights := [1, 0, 0, 1] }

def points65 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 7697, representative 7204.
def source66 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨71, by decide +kernel⟩

def target66 : Weights.Entry :=
  { word := [10, 2, 8, 8, 0, 8, 0], weights := [1, 0, 1, 0] }

def points66 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 7703, representative 7185.
def source67 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨52, by decide +kernel⟩

def target67 : Weights.Entry :=
  { word := [10, 2, 8, 9, 0, 8, 0], weights := [0, 1, 1, 0] }

def points67 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 7718, representative 7154.
def source68 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨21, by decide +kernel⟩

def target68 : Weights.Entry :=
  { word := [10, 2, 8, 10, 0, 1, 8], weights := [0, 1, 0, 1] }

def points68 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 7720, representative 7154.
def source69 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨21, by decide +kernel⟩

def target69 : Weights.Entry :=
  { word := [10, 2, 8, 10, 0, 2, 8], weights := [0, 1, 0, 1] }

def points69 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 7722, representative 7201.
def source70 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨68, by decide +kernel⟩

def target70 : Weights.Entry :=
  { word := [10, 2, 8, 10, 0, 8, 0], weights := [0, 1, 0, 1] }

def points70 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 7726, representative 7156.
def source71 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨23, by decide +kernel⟩

def target71 : Weights.Entry :=
  { word := [10, 2, 8, 10, 0, 8, 8], weights := [0, 1, 0, 1] }

def points71 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 7730, representative 7197.
def source72 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨64, by decide +kernel⟩

def target72 : Weights.Entry :=
  { word := [10, 2, 8, 10, 0, 9, 0], weights := [0, 1, 0, 1] }

def points72 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 7731, representative 7151.
def source73 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨18, by decide +kernel⟩

def target73 : Weights.Entry :=
  { word := [10, 2, 8, 10, 0, 9, 8], weights := [0, 1, 0, 1] }

def points73 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 7732, representative 7197.
def source74 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨64, by decide +kernel⟩

def target74 : Weights.Entry :=
  { word := [10, 2, 8, 10, 0, 10, 0], weights := [0, 1, 0, 1] }

def points74 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 7733, representative 7151.
def source75 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨18, by decide +kernel⟩

def target75 : Weights.Entry :=
  { word := [10, 2, 8, 10, 0, 10, 8], weights := [0, 1, 0, 1] }

def points75 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 7737, representative 7199.
def source76 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨66, by decide +kernel⟩

def target76 : Weights.Entry :=
  { word := [10, 2, 8, 10, 8, 2, 0], weights := [0, 1, 0, 1] }

def points76 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 7738, representative 7153.
def source77 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨20, by decide +kernel⟩

def target77 : Weights.Entry :=
  { word := [10, 2, 8, 10, 8, 2, 8], weights := [0, 1, 0, 1] }

def points77 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 7743, representative 7196.
def source78 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨63, by decide +kernel⟩

def target78 : Weights.Entry :=
  { word := [10, 2, 8, 10, 8, 10, 0], weights := [0, 1, 0, 1] }

def points78 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 7744, representative 7150.
def source79 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨17, by decide +kernel⟩

def target79 : Weights.Entry :=
  { word := [10, 2, 8, 10, 8, 10, 8], weights := [0, 1, 0, 1] }

def points79 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 7747, representative 7135.
def source80 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨3, by decide +kernel⟩

def target80 : Weights.Entry :=
  { word := [10, 2, 8, 12, 2, 0, 1], weights := [1, 1, 0, 1] }

def points80 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 7750, representative 7170.
def source81 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨37, by decide +kernel⟩

def target81 : Weights.Entry :=
  { word := [10, 2, 8, 12, 2, 0, 8], weights := [1, 1, 0, 1] }

def points81 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 7755, representative 7168.
def source82 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨35, by decide +kernel⟩

def target82 : Weights.Entry :=
  { word := [10, 2, 8, 12, 2, 8, 8], weights := [1, 1, 1, 1] }

def points82 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 7763, representative 7134.
def source83 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨2, by decide +kernel⟩

def target83 : Weights.Entry :=
  { word := [10, 2, 8, 12, 10, 0, 1], weights := [1, 1, 0, 1] }

def points83 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 7766, representative 7169.
def source84 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨36, by decide +kernel⟩

def target84 : Weights.Entry :=
  { word := [10, 2, 8, 12, 10, 0, 8], weights := [1, 1, 0, 1] }

def points84 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 7772, representative 7167.
def source85 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨34, by decide +kernel⟩

def target85 : Weights.Entry :=
  { word := [10, 2, 8, 12, 10, 8, 8], weights := [1, 1, 1, 1] }

def points85 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 7780, representative 7177.
def source86 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨44, by decide +kernel⟩

def target86 : Weights.Entry :=
  { word := [10, 2, 10, 8, 0, 8, 0], weights := [1, 0, 1, 0] }

def points86 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 7785, representative 7162.
def source87 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨29, by decide +kernel⟩

def target87 : Weights.Entry :=
  { word := [10, 2, 10, 8, 1, 0, 8], weights := [1, 1, 0, 1] }

def points87 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 7790, representative 7160.
def source88 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨27, by decide +kernel⟩

def target88 : Weights.Entry :=
  { word := [10, 2, 10, 8, 1, 8, 8], weights := [1, 1, 1, 1] }

def points88 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 7792, representative 7173.
def source89 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨40, by decide +kernel⟩

def target89 : Weights.Entry :=
  { word := [10, 2, 10, 8, 2, 8, 0], weights := [1, 0, 1, 0] }

def points89 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 7794, representative 7176.
def source90 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨43, by decide +kernel⟩

def target90 : Weights.Entry :=
  { word := [10, 2, 10, 8, 8, 8, 0], weights := [1, 0, 1, 0] }

def points90 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 7799, representative 7161.
def source91 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨28, by decide +kernel⟩

def target91 : Weights.Entry :=
  { word := [10, 2, 10, 8, 9, 0, 8], weights := [1, 1, 0, 1] }

def points91 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 7804, representative 7159.
def source92 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨26, by decide +kernel⟩

def target92 : Weights.Entry :=
  { word := [10, 2, 10, 8, 9, 8, 8], weights := [1, 1, 1, 1] }

def points92 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 7806, representative 7172.
def source93 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨39, by decide +kernel⟩

def target93 : Weights.Entry :=
  { word := [10, 2, 10, 8, 10, 8, 0], weights := [1, 0, 1, 0] }

def points93 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 7824, representative 7229.
def source94 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨95, by decide +kernel⟩

def target94 : Weights.Entry :=
  { word := [10, 8, 0, 4, 2, 0, 10], weights := [1, 0, 1, 0] }

-- Period 9, original row 7825, representative 7237.
def source95 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨103, by decide +kernel⟩

def target95 : Weights.Entry :=
  { word := [10, 8, 0, 4, 2, 0, 12], weights := [1, 0, 0, 1] }

def points95 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2)]

-- Period 9, original row 7829, representative 7213.
def source96 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨79, by decide +kernel⟩

def target96 : Weights.Entry :=
  { word := [10, 8, 0, 4, 2, 8, 10], weights := [1, 0, 1, 0] }

-- Period 9, original row 7830, representative 7221.
def source97 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨87, by decide +kernel⟩

def target97 : Weights.Entry :=
  { word := [10, 8, 0, 4, 2, 8, 12], weights := [1, 0, 0, 1] }

-- Period 9, original row 7842, representative 7250.
def source98 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨116, by decide +kernel⟩

def target98 : Weights.Entry :=
  { word := [10, 8, 0, 4, 8, 12, 4], weights := [1, 0, 0, 1] }

def points98 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2)]

-- Period 9, original row 7850, representative 7234.
def source99 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨100, by decide +kernel⟩

def target99 : Weights.Entry :=
  { word := [10, 8, 0, 4, 10, 0, 10], weights := [1, 0, 1, 0] }

-- Period 9, original row 7851, representative 7242.
def source100 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨108, by decide +kernel⟩

def target100 : Weights.Entry :=
  { word := [10, 8, 0, 4, 10, 0, 12], weights := [1, 0, 0, 1] }

def points100 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2)]

-- Period 9, original row 7855, representative 7214.
def source101 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨80, by decide +kernel⟩

def target101 : Weights.Entry :=
  { word := [10, 8, 0, 4, 10, 8, 10], weights := [1, 0, 1, 0] }

-- Period 9, original row 7856, representative 7222.
def source102 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨88, by decide +kernel⟩

def target102 : Weights.Entry :=
  { word := [10, 8, 0, 4, 10, 8, 12], weights := [1, 0, 0, 1] }

-- Period 9, original row 7868, representative 7252.
def source103 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨118, by decide +kernel⟩

def target103 : Weights.Entry :=
  { word := [10, 8, 0, 12, 0, 12, 4], weights := [1, 0, 0, 1] }

def points103 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 7876, representative 7236.
def source104 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨102, by decide +kernel⟩

def target104 : Weights.Entry :=
  { word := [10, 8, 0, 12, 2, 0, 10], weights := [1, 0, 1, 0] }

-- Period 9, original row 7877, representative 7244.
def source105 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨110, by decide +kernel⟩

def target105 : Weights.Entry :=
  { word := [10, 8, 0, 12, 2, 0, 12], weights := [1, 0, 0, 1] }

def points105 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2)]

-- Period 9, original row 7881, representative 7220.
def source106 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨86, by decide +kernel⟩

def target106 : Weights.Entry :=
  { word := [10, 8, 0, 12, 2, 8, 10], weights := [1, 0, 1, 0] }

-- Period 9, original row 7882, representative 7228.
def source107 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨94, by decide +kernel⟩

def target107 : Weights.Entry :=
  { word := [10, 8, 0, 12, 2, 8, 12], weights := [1, 0, 1, 0] }

-- Period 9, original row 7893, representative 7251.
def source108 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨117, by decide +kernel⟩

def target108 : Weights.Entry :=
  { word := [10, 8, 0, 12, 8, 12, 4], weights := [1, 0, 0, 1] }

def points108 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2)]

-- Period 9, original row 7901, representative 7235.
def source109 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨101, by decide +kernel⟩

def target109 : Weights.Entry :=
  { word := [10, 8, 0, 12, 10, 0, 10], weights := [1, 0, 1, 0] }

-- Period 9, original row 7902, representative 7243.
def source110 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨109, by decide +kernel⟩

def target110 : Weights.Entry :=
  { word := [10, 8, 0, 12, 10, 0, 12], weights := [1, 0, 0, 1] }

def points110 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2)]

-- Period 9, original row 7906, representative 7217.
def source111 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨83, by decide +kernel⟩

def target111 : Weights.Entry :=
  { word := [10, 8, 0, 12, 10, 8, 10], weights := [1, 0, 1, 0] }

-- Period 9, original row 7907, representative 7225.
def source112 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨91, by decide +kernel⟩

def target112 : Weights.Entry :=
  { word := [10, 8, 0, 12, 10, 8, 12], weights := [1, 0, 1, 0] }

-- Period 9, original row 7926, representative 7221.
def source113 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨87, by decide +kernel⟩

def target113 : Weights.Entry :=
  { word := [10, 8, 4, 2, 0, 8, 10], weights := [1, 0, 0, 1] }

def points113 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 7927, representative 7221.
def source114 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨87, by decide +kernel⟩

def target114 : Weights.Entry :=
  { word := [10, 8, 4, 2, 0, 8, 12], weights := [1, 0, 0, 1] }

def points114 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 7935, representative 7226.
def source115 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨92, by decide +kernel⟩

def target115 : Weights.Entry :=
  { word := [10, 8, 4, 2, 8, 8, 12], weights := [1, 0, 0, 1] }

-- Period 9, original row 7953, representative 7228.
def source116 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨94, by decide +kernel⟩

def target116 : Weights.Entry :=
  { word := [10, 8, 4, 10, 0, 8, 10], weights := [0, 1, 0, 1] }

def points116 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 7954, representative 7228.
def source117 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨94, by decide +kernel⟩

def target117 : Weights.Entry :=
  { word := [10, 8, 4, 10, 0, 8, 12], weights := [0, 1, 0, 1] }

def points117 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 7959, representative 7227.
def source118 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨93, by decide +kernel⟩

def target118 : Weights.Entry :=
  { word := [10, 8, 4, 10, 8, 8, 12], weights := [1, 0, 0, 1] }

-- Period 9, original row 7988, representative 7230.
def source119 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨96, by decide +kernel⟩

def target119 : Weights.Entry :=
  { word := [10, 8, 8, 4, 2, 0, 10], weights := [1, 0, 1, 0] }

-- Period 9, original row 7989, representative 7238.
def source120 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨104, by decide +kernel⟩

def target120 : Weights.Entry :=
  { word := [10, 8, 8, 4, 2, 0, 12], weights := [1, 0, 0, 1] }

def points120 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 7993, representative 7218.
def source121 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨84, by decide +kernel⟩

def target121 : Weights.Entry :=
  { word := [10, 8, 8, 4, 2, 8, 10], weights := [1, 0, 1, 0] }

-- Period 9, original row 7994, representative 7226.
def source122 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨92, by decide +kernel⟩

def target122 : Weights.Entry :=
  { word := [10, 8, 8, 4, 2, 8, 12], weights := [1, 0, 0, 1] }

def points122 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 8008, representative 7245.
def source123 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨111, by decide +kernel⟩

def target123 : Weights.Entry :=
  { word := [10, 8, 8, 4, 8, 12, 2], weights := [1, 0, 0, 1] }

def points123 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 8009, representative 7247.
def source124 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨113, by decide +kernel⟩

def target124 : Weights.Entry :=
  { word := [10, 8, 8, 4, 8, 12, 4], weights := [1, 0, 0, 1] }

def points124 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 8018, representative 7231.
def source125 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨97, by decide +kernel⟩

def target125 : Weights.Entry :=
  { word := [10, 8, 8, 4, 10, 0, 10], weights := [1, 0, 1, 0] }

-- Period 9, original row 8019, representative 7239.
def source126 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨105, by decide +kernel⟩

def target126 : Weights.Entry :=
  { word := [10, 8, 8, 4, 10, 0, 12], weights := [1, 0, 0, 1] }

def points126 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 8023, representative 7215.
def source127 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨81, by decide +kernel⟩

def target127 : Weights.Entry :=
  { word := [10, 8, 8, 4, 10, 8, 10], weights := [1, 0, 1, 0] }

def period9Entries : List Weights.Entry := [target0, target1, target2, target3, target4, target5, target6, target7, target8, target9, target10, target11, target12, target13, target14, target15, target16, target17, target18, target19, target20, target21, target22, target23, target24, target25, target26, target27, target28, target29, target30, target31, target32, target33, target34, target35, target36, target37, target38, target39, target40, target41, target42, target43, target44, target45, target46, target47, target48, target49, target50, target51, target52, target53, target54, target55, target56, target57, target58, target59, target60, target61, target62, target63, target64, target65, target66, target67, target68, target69, target70, target71, target72, target73, target74, target75, target76, target77, target78, target79, target80, target81, target82, target83, target84, target85, target86, target87, target88, target89, target90, target91, target92, target93, target94, target95, target96, target97, target98, target99, target100, target101, target102, target103, target104, target105, target106, target107, target108, target109, target110, target111, target112, target113, target114, target115, target116, target117, target118, target119, target120, target121, target122, target123, target124, target125, target126, target127]

def period9Chunk : RowCoverage.Chunk where
  rows := [⟨6386, target0⟩, ⟨6506, target1⟩, ⟨6507, target2⟩, ⟨6548, target3⟩, ⟨6549, target4⟩, ⟨6642, target5⟩, ⟨6643, target6⟩, ⟨6678, target7⟩, ⟨6679, target8⟩, ⟨6808, target9⟩, ⟨6837, target10⟩, ⟨6841, target11⟩, ⟨6936, target12⟩, ⟨6937, target13⟩, ⟨6954, target14⟩, ⟨7078, target15⟩, ⟨7079, target16⟩, ⟨7114, target17⟩, ⟨7115, target18⟩, ⟨7418, target19⟩, ⟨7431, target20⟩, ⟨7432, target21⟩, ⟨7440, target22⟩, ⟨7454, target23⟩, ⟨7455, target24⟩, ⟨7467, target25⟩, ⟨7490, target26⟩, ⟨7509, target27⟩, ⟨7510, target28⟩, ⟨7520, target29⟩, ⟨7548, target30⟩, ⟨7549, target31⟩, ⟨7557, target32⟩, ⟨7576, target33⟩, ⟨7577, target34⟩, ⟨7589, target35⟩, ⟨7596, target36⟩, ⟨7597, target37⟩, ⟨7600, target38⟩, ⟨7617, target39⟩, ⟨7621, target40⟩, ⟨7624, target41⟩, ⟨7634, target42⟩, ⟨7640, target43⟩, ⟨7642, target44⟩, ⟨7645, target45⟩, ⟨7650, target46⟩, ⟨7652, target47⟩, ⟨7654, target48⟩, ⟨7656, target49⟩, ⟨7659, target50⟩, ⟨7664, target51⟩, ⟨7666, target52⟩, ⟨7667, target53⟩, ⟨7669, target54⟩, ⟨7671, target55⟩, ⟨7672, target56⟩, ⟨7676, target57⟩, ⟨7680, target58⟩, ⟨7681, target59⟩, ⟨7682, target60⟩, ⟨7683, target61⟩, ⟨7686, target62⟩, ⟨7687, target63⟩, ⟨7690, target64⟩, ⟨7691, target65⟩, ⟨7697, target66⟩, ⟨7703, target67⟩, ⟨7718, target68⟩, ⟨7720, target69⟩, ⟨7722, target70⟩, ⟨7726, target71⟩, ⟨7730, target72⟩, ⟨7731, target73⟩, ⟨7732, target74⟩, ⟨7733, target75⟩, ⟨7737, target76⟩, ⟨7738, target77⟩, ⟨7743, target78⟩, ⟨7744, target79⟩, ⟨7747, target80⟩, ⟨7750, target81⟩, ⟨7755, target82⟩, ⟨7763, target83⟩, ⟨7766, target84⟩, ⟨7772, target85⟩, ⟨7780, target86⟩, ⟨7785, target87⟩, ⟨7790, target88⟩, ⟨7792, target89⟩, ⟨7794, target90⟩, ⟨7799, target91⟩, ⟨7804, target92⟩, ⟨7806, target93⟩, ⟨7824, target94⟩, ⟨7825, target95⟩, ⟨7829, target96⟩, ⟨7830, target97⟩, ⟨7842, target98⟩, ⟨7850, target99⟩, ⟨7851, target100⟩, ⟨7855, target101⟩, ⟨7856, target102⟩, ⟨7868, target103⟩, ⟨7876, target104⟩, ⟨7877, target105⟩, ⟨7881, target106⟩, ⟨7882, target107⟩, ⟨7893, target108⟩, ⟨7901, target109⟩, ⟨7902, target110⟩, ⟨7906, target111⟩, ⟨7907, target112⟩, ⟨7926, target113⟩, ⟨7927, target114⟩, ⟨7935, target115⟩, ⟨7953, target116⟩, ⟨7954, target117⟩, ⟨7959, target118⟩, ⟨7988, target119⟩, ⟨7989, target120⟩, ⟨7993, target121⟩, ⟨7994, target122⟩, ⟨8008, target123⟩, ⟨8009, target124⟩, ⟨8018, target125⟩, ⟨8019, target126⟩, ⟨8023, target127⟩]
  indexMask := 1594445321595297918138245551775700724082141065982660420362100847722250270325246382540641778503176423516917374203674127935710717655398741350624739278291156886081776438461987551536965442878228091767296989396223521664741598180308783142739123582485524034454244348860659759027790013783380853709883566074093263264562697879558934451839473533149109670512624215579970731124201951629921814247083834981119641714476460622513516903103177289079815552898597954504183732920411692970320916373528980690836514633395551570503435836049942087293188516091501458870504490734440802466133818439965113412299394988865006190518536970397769410549926293446434296815689962756337495581898923162813524193542977296895119145873847123545570827004815068882254279530286947350606001600169416428387209907223216282468105901820152494628581379711946103921767563870248120391344729511752075103019933968350585101421261948970630519230882944185473407106606468703746545677395107957522468674789351794611025779947447715823300119138359106184059093629539908462505701345822631472932142271480323277488255740832477300279723116559184283986861752769744161096740422006806537956336337156728995524355310835193593354468264420174619108590407066366796937196270079314294086203121530161867579237607166533271883517441946370109983290549840908103403016056528929444685441057497346546439975055445603392258744179253407955445212066281784465498769880393557517612667350312117062984853785987667569348179427088814575196580105394767517528786932190707780267141828573129527017924229866075373992606772292699017701760480759751651909737104669270480613828920971600656269540257014338856286497542654560230661130120150343889357551369256549452960959878737675984967018103504270988445736485366159835476921140453659376006924494219086805794403510134028369848905987189323380650765220413530155453390433935981576553229927655453748293380236048525903049948281386525864688619461114950499777193958778152263512785705747396600720321067029996575459812723881673695097299837752896042981814278122315344004633094264347391218019029800962638940744691087615108421958340619115901835084313932498719046661768728132090152987027073334177653524921492187205868968489872349199105467503474132865354946399650187909959167946542149783488280096706686382246050930582834303234500182795685628329190890505561254781067315548438997630466390959877978528017091345601184823895749573876777105572030067307149353162300310140951708081689021996232343552
  count := 128

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

end FranklSmallCyclic.TransportBatches.G056.B001.Data
