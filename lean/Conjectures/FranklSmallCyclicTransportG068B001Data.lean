module

public import Conjectures.FranklSmallCyclicRowCoverage
public import Conjectures.FranklSmallCyclicCanonicalWords
public import Conjectures.FranklSmallCyclicOrbit9Block015Data

/-! 128 literal targets sharing one source proof block.
Original words and row indices are retained; weights may be transported.
-/
@[expose] public section

namespace FranklSmallCyclic.TransportBatches.G068.B001.Data

-- Period 9, original row 3898, representative 8791.
def source0 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B015.Data.entryAt ⟨120, by decide +kernel⟩

def target0 : Weights.Entry :=
  { word := [4, 8, 8, 8, 12, 6, 0], weights := [0, 1, 1, 0] }

def points0 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 4062, representative 8788.
def source1 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B015.Data.entryAt ⟨117, by decide +kernel⟩

def target1 : Weights.Entry :=
  { word := [4, 12, 8, 8, 4, 6, 0], weights := [0, 1, 1, 0] }

def points1 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 4071, representative 8787.
def source2 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B015.Data.entryAt ⟨116, by decide +kernel⟩

def target2 : Weights.Entry :=
  { word := [4, 12, 8, 8, 12, 6, 0], weights := [0, 1, 1, 0] }

def points2 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 4117, representative 8746.
def source3 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B015.Data.entryAt ⟨75, by decide +kernel⟩

def target3 : Weights.Entry :=
  { word := [8, 0, 0, 12, 0, 4, 8], weights := [0, 0, 1, 0] }

-- Period 9, original row 4136, representative 8716.
def source4 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B015.Data.entryAt ⟨45, by decide +kernel⟩

def target4 : Weights.Entry :=
  { word := [8, 0, 1, 4, 4, 4, 8], weights := [1, 0, 0, 1] }

-- Period 9, original row 4139, representative 8734.
def source5 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B015.Data.entryAt ⟨63, by decide +kernel⟩

def target5 : Weights.Entry :=
  { word := [8, 0, 1, 4, 8, 4, 8], weights := [1, 0, 1, 0] }

-- Period 9, original row 4158, representative 8700.
def source6 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B015.Data.entryAt ⟨29, by decide +kernel⟩

def target6 : Weights.Entry :=
  { word := [8, 0, 1, 4, 12, 4, 8], weights := [1, 0, 0, 1] }

-- Period 9, original row 4172, representative 8727.
def source7 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B015.Data.entryAt ⟨56, by decide +kernel⟩

def target7 : Weights.Entry :=
  { word := [8, 0, 1, 12, 4, 4, 8], weights := [1, 0, 0, 1] }

-- Period 9, original row 4175, representative 8741.
def source8 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B015.Data.entryAt ⟨70, by decide +kernel⟩

def target8 : Weights.Entry :=
  { word := [8, 0, 1, 12, 8, 4, 8], weights := [1, 0, 1, 0] }

-- Period 9, original row 4194, representative 8711.
def source9 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B015.Data.entryAt ⟨40, by decide +kernel⟩

def target9 : Weights.Entry :=
  { word := [8, 0, 1, 12, 12, 4, 8], weights := [1, 0, 0, 1] }

-- Period 9, original row 4289, representative 8748.
def source10 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B015.Data.entryAt ⟨77, by decide +kernel⟩

def target10 : Weights.Entry :=
  { word := [8, 0, 4, 10, 0, 4, 8], weights := [1, 0, 2, 1] }

-- Period 9, original row 4356, representative 8732.
def source11 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B015.Data.entryAt ⟨61, by decide +kernel⟩

def target11 : Weights.Entry :=
  { word := [8, 0, 8, 4, 4, 4, 8], weights := [1, 0, 0, 1] }

-- Period 9, original row 4377, representative 8733.
def source12 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B015.Data.entryAt ⟨62, by decide +kernel⟩

def target12 : Weights.Entry :=
  { word := [8, 0, 8, 12, 4, 4, 8], weights := [1, 0, 0, 1] }

-- Period 9, original row 4381, representative 8723.
def source13 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B015.Data.entryAt ⟨52, by decide +kernel⟩

def target13 : Weights.Entry :=
  { word := [8, 0, 9, 4, 4, 4, 8], weights := [1, 0, 0, 1] }

-- Period 9, original row 4385, representative 8707.
def source14 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B015.Data.entryAt ⟨36, by decide +kernel⟩

def target14 : Weights.Entry :=
  { word := [8, 0, 9, 4, 12, 4, 8], weights := [1, 0, 0, 1] }

-- Period 9, original row 4389, representative 8724.
def source15 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B015.Data.entryAt ⟨53, by decide +kernel⟩

def target15 : Weights.Entry :=
  { word := [8, 0, 9, 12, 4, 4, 8], weights := [1, 0, 0, 1] }

-- Period 9, original row 4393, representative 8708.
def source16 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B015.Data.entryAt ⟨37, by decide +kernel⟩

def target16 : Weights.Entry :=
  { word := [8, 0, 9, 12, 12, 4, 8], weights := [1, 0, 0, 1] }

-- Period 9, original row 4463, representative 8747.
def source17 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B015.Data.entryAt ⟨76, by decide +kernel⟩

def target17 : Weights.Entry :=
  { word := [8, 0, 12, 10, 0, 4, 8], weights := [1, 0, 1, 1] }

-- Period 9, original row 4666, representative 8785.
def source18 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B015.Data.entryAt ⟨114, by decide +kernel⟩

def target18 : Weights.Entry :=
  { word := [8, 2, 0, 1, 0, 8, 0], weights := [0, 1, 0, 0] }

def points18 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2)]

-- Period 9, original row 4667, representative 8678.
def source19 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B015.Data.entryAt ⟨7, by decide +kernel⟩

def target19 : Weights.Entry :=
  { word := [8, 2, 0, 1, 0, 12, 0], weights := [0, 3, 1, 0] }

def points19 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 5), (4, 6), (5, 4), (6, 3), (7, 1), (8, 2)]

-- Period 9, original row 4680, representative 8785.
def source20 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B015.Data.entryAt ⟨114, by decide +kernel⟩

def target20 : Weights.Entry :=
  { word := [8, 2, 0, 2, 0, 8, 0], weights := [0, 1, 0, 0] }

def points20 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 5), (4, 6), (5, 4), (6, 3), (7, 1), (8, 2)]

-- Period 9, original row 4681, representative 8678.
def source21 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B015.Data.entryAt ⟨7, by decide +kernel⟩

def target21 : Weights.Entry :=
  { word := [8, 2, 0, 2, 0, 8, 1], weights := [0, 3, 0, 1] }

def points21 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2)]

-- Period 9, original row 4682, representative 8744.
def source22 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B015.Data.entryAt ⟨73, by decide +kernel⟩

def target22 : Weights.Entry :=
  { word := [8, 2, 0, 2, 0, 8, 8], weights := [1, 2, 0, 1] }

-- Period 9, original row 4684, representative 8697.
def source23 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B015.Data.entryAt ⟨26, by decide +kernel⟩

def target23 : Weights.Entry :=
  { word := [8, 2, 0, 6, 0, 4, 8], weights := [1, 1, 1, 1] }

-- Period 9, original row 4686, representative 8682.
def source24 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B015.Data.entryAt ⟨11, by decide +kernel⟩

def target24 : Weights.Entry :=
  { word := [8, 2, 0, 6, 8, 4, 8], weights := [1, 1, 1, 1] }

-- Period 9, original row 4700, representative 8680.
def source25 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B015.Data.entryAt ⟨9, by decide +kernel⟩

def target25 : Weights.Entry :=
  { word := [8, 2, 0, 9, 0, 4, 0], weights := [0, 1, 0, 0] }

def points25 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 5), (4, 6), (5, 4), (6, 3), (7, 1), (8, 2)]

-- Period 9, original row 4702, representative 8786.
def source26 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B015.Data.entryAt ⟨115, by decide +kernel⟩

def target26 : Weights.Entry :=
  { word := [8, 2, 0, 9, 0, 8, 0], weights := [0, 1, 0, 0] }

def points26 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2)]

-- Period 9, original row 4703, representative 8679.
def source27 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B015.Data.entryAt ⟨8, by decide +kernel⟩

def target27 : Weights.Entry :=
  { word := [8, 2, 0, 9, 0, 12, 0], weights := [0, 1, 1, 0] }

def points27 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 5), (4, 6), (5, 4), (6, 3), (7, 1), (8, 2)]

-- Period 9, original row 4722, representative 8680.
def source28 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B015.Data.entryAt ⟨9, by decide +kernel⟩

def target28 : Weights.Entry :=
  { word := [8, 2, 0, 10, 0, 0, 1], weights := [0, 1, 0, 0] }

def points28 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2)]

-- Period 9, original row 4725, representative 8746.
def source29 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B015.Data.entryAt ⟨75, by decide +kernel⟩

def target29 : Weights.Entry :=
  { word := [8, 2, 0, 10, 0, 0, 8], weights := [0, 1, 0, 0] }

def points29 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2)]

-- Period 9, original row 4729, representative 8786.
def source30 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B015.Data.entryAt ⟨115, by decide +kernel⟩

def target30 : Weights.Entry :=
  { word := [8, 2, 0, 10, 0, 8, 0], weights := [0, 1, 0, 0] }

def points30 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 5), (4, 6), (5, 4), (6, 3), (7, 1), (8, 2)]

-- Period 9, original row 4730, representative 8679.
def source31 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B015.Data.entryAt ⟨8, by decide +kernel⟩

def target31 : Weights.Entry :=
  { word := [8, 2, 0, 10, 0, 8, 1], weights := [0, 1, 0, 1] }

def points31 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2)]

-- Period 9, original row 4732, representative 8745.
def source32 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B015.Data.entryAt ⟨74, by decide +kernel⟩

def target32 : Weights.Entry :=
  { word := [8, 2, 0, 10, 0, 8, 8], weights := [1, 0, 0, 1] }

-- Period 9, original row 4743, representative 8699.
def source33 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B015.Data.entryAt ⟨28, by decide +kernel⟩

def target33 : Weights.Entry :=
  { word := [8, 2, 0, 12, 2, 0, 1], weights := [1, 2, 0, 1] }

def points33 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2)]

-- Period 9, original row 4745, representative 8748.
def source34 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B015.Data.entryAt ⟨77, by decide +kernel⟩

def target34 : Weights.Entry :=
  { word := [8, 2, 0, 12, 2, 0, 8], weights := [1, 2, 0, 1] }

def points34 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2)]

-- Period 9, original row 4748, representative 8699.
def source35 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B015.Data.entryAt ⟨28, by decide +kernel⟩

def target35 : Weights.Entry :=
  { word := [8, 2, 0, 12, 4, 4, 0], weights := [1, 2, 1, 0] }

def points35 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 5), (4, 6), (5, 4), (6, 3), (7, 1), (8, 2)]

-- Period 9, original row 4749, representative 8698.
def source36 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B015.Data.entryAt ⟨27, by decide +kernel⟩

def target36 : Weights.Entry :=
  { word := [8, 2, 0, 12, 10, 0, 1], weights := [1, 1, 0, 1] }

def points36 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2)]

-- Period 9, original row 4752, representative 8747.
def source37 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B015.Data.entryAt ⟨76, by decide +kernel⟩

def target37 : Weights.Entry :=
  { word := [8, 2, 0, 12, 10, 0, 8], weights := [1, 1, 0, 1] }

def points37 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2)]

-- Period 9, original row 4756, representative 8698.
def source38 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B015.Data.entryAt ⟨27, by decide +kernel⟩

def target38 : Weights.Entry :=
  { word := [8, 2, 0, 12, 12, 4, 0], weights := [1, 1, 1, 0] }

def points38 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 5), (4, 6), (5, 4), (6, 3), (7, 1), (8, 2)]

-- Period 9, original row 4758, representative 8716.
def source39 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B015.Data.entryAt ⟨45, by decide +kernel⟩

def target39 : Weights.Entry :=
  { word := [8, 2, 2, 2, 0, 1, 8], weights := [1, 0, 0, 1] }

def points39 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 4760, representative 8716.
def source40 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B015.Data.entryAt ⟨45, by decide +kernel⟩

def target40 : Weights.Entry :=
  { word := [8, 2, 2, 2, 0, 2, 8], weights := [1, 0, 0, 1] }

def points40 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 4761, representative 8773.
def source41 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B015.Data.entryAt ⟨102, by decide +kernel⟩

def target41 : Weights.Entry :=
  { word := [8, 2, 2, 2, 0, 8, 0], weights := [1, 0, 0, 0] }

def points41 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 4765, representative 8728.
def source42 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B015.Data.entryAt ⟨57, by decide +kernel⟩

def target42 : Weights.Entry :=
  { word := [8, 2, 2, 2, 0, 8, 8], weights := [1, 0, 0, 1] }

-- Period 9, original row 4769, representative 8765.
def source43 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B015.Data.entryAt ⟨94, by decide +kernel⟩

def target43 : Weights.Entry :=
  { word := [8, 2, 2, 2, 0, 9, 0], weights := [1, 0, 0, 0] }

def points43 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 4770, representative 8717.
def source44 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B015.Data.entryAt ⟨46, by decide +kernel⟩

def target44 : Weights.Entry :=
  { word := [8, 2, 2, 2, 0, 9, 8], weights := [1, 0, 0, 1] }

-- Period 9, original row 4771, representative 8765.
def source45 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B015.Data.entryAt ⟨94, by decide +kernel⟩

def target45 : Weights.Entry :=
  { word := [8, 2, 2, 2, 0, 10, 0], weights := [1, 0, 0, 0] }

def points45 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 4772, representative 8717.
def source46 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B015.Data.entryAt ⟨46, by decide +kernel⟩

def target46 : Weights.Entry :=
  { word := [8, 2, 2, 2, 0, 10, 8], weights := [1, 0, 0, 1] }

def points46 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 8), (8, 7)]

-- Period 9, original row 4773, representative 8674.
def source47 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B015.Data.entryAt ⟨3, by decide +kernel⟩

def target47 : Weights.Entry :=
  { word := [8, 2, 2, 2, 8, 0, 1], weights := [1, 0, 0, 1] }

def points47 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 4776, representative 8732.
def source48 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B015.Data.entryAt ⟨61, by decide +kernel⟩

def target48 : Weights.Entry :=
  { word := [8, 2, 2, 2, 8, 0, 8], weights := [1, 0, 0, 1] }

def points48 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 4781, representative 8723.
def source49 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B015.Data.entryAt ⟨52, by decide +kernel⟩

def target49 : Weights.Entry :=
  { word := [8, 2, 2, 2, 8, 1, 8], weights := [1, 0, 0, 1] }

def points49 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 4782, representative 8771.
def source50 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B015.Data.entryAt ⟨100, by decide +kernel⟩

def target50 : Weights.Entry :=
  { word := [8, 2, 2, 2, 8, 2, 0], weights := [1, 0, 0, 1] }

def points50 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 4783, representative 8725.
def source51 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B015.Data.entryAt ⟨54, by decide +kernel⟩

def target51 : Weights.Entry :=
  { word := [8, 2, 2, 2, 8, 2, 8], weights := [1, 0, 0, 1] }

-- Period 9, original row 4784, representative 8774.
def source52 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B015.Data.entryAt ⟨103, by decide +kernel⟩

def target52 : Weights.Entry :=
  { word := [8, 2, 2, 2, 8, 8, 0], weights := [1, 0, 0, 1] }

def points52 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 4785, representative 8671.
def source53 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B015.Data.entryAt ⟨0, by decide +kernel⟩

def target53 : Weights.Entry :=
  { word := [8, 2, 2, 2, 8, 8, 1], weights := [1, 0, 0, 1] }

def points53 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 4788, representative 8729.
def source54 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B015.Data.entryAt ⟨58, by decide +kernel⟩

def target54 : Weights.Entry :=
  { word := [8, 2, 2, 2, 8, 8, 8], weights := [1, 0, 0, 1] }

-- Period 9, original row 4792, representative 8766.
def source55 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B015.Data.entryAt ⟨95, by decide +kernel⟩

def target55 : Weights.Entry :=
  { word := [8, 2, 2, 2, 8, 9, 0], weights := [1, 0, 0, 1] }

def points55 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 4793, representative 8718.
def source56 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B015.Data.entryAt ⟨47, by decide +kernel⟩

def target56 : Weights.Entry :=
  { word := [8, 2, 2, 2, 8, 9, 8], weights := [1, 0, 0, 1] }

-- Period 9, original row 4794, representative 8768.
def source57 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B015.Data.entryAt ⟨97, by decide +kernel⟩

def target57 : Weights.Entry :=
  { word := [8, 2, 2, 2, 8, 10, 0], weights := [1, 0, 0, 1] }

def points57 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 4795, representative 8720.
def source58 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B015.Data.entryAt ⟨49, by decide +kernel⟩

def target58 : Weights.Entry :=
  { word := [8, 2, 2, 2, 8, 10, 8], weights := [1, 0, 0, 1] }

-- Period 9, original row 4797, representative 8727.
def source59 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B015.Data.entryAt ⟨56, by decide +kernel⟩

def target59 : Weights.Entry :=
  { word := [8, 2, 2, 10, 0, 1, 8], weights := [1, 0, 0, 1] }

def points59 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 4799, representative 8727.
def source60 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B015.Data.entryAt ⟨56, by decide +kernel⟩

def target60 : Weights.Entry :=
  { word := [8, 2, 2, 10, 0, 2, 8], weights := [1, 0, 0, 1] }

def points60 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 4800, representative 8776.
def source61 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B015.Data.entryAt ⟨105, by decide +kernel⟩

def target61 : Weights.Entry :=
  { word := [8, 2, 2, 10, 0, 8, 0], weights := [0, 1, 1, 0] }

def points61 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 4801, representative 8673.
def source62 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B015.Data.entryAt ⟨2, by decide +kernel⟩

def target62 : Weights.Entry :=
  { word := [8, 2, 2, 10, 0, 8, 1], weights := [1, 0, 0, 1] }

def points62 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 4804, representative 8731.
def source63 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B015.Data.entryAt ⟨60, by decide +kernel⟩

def target63 : Weights.Entry :=
  { word := [8, 2, 2, 10, 0, 8, 8], weights := [1, 0, 0, 1] }

-- Period 9, original row 4808, representative 8770.
def source64 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B015.Data.entryAt ⟨99, by decide +kernel⟩

def target64 : Weights.Entry :=
  { word := [8, 2, 2, 10, 0, 9, 0], weights := [0, 1, 1, 0] }

def points64 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 4809, representative 8722.
def source65 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B015.Data.entryAt ⟨51, by decide +kernel⟩

def target65 : Weights.Entry :=
  { word := [8, 2, 2, 10, 0, 9, 8], weights := [1, 0, 0, 1] }

-- Period 9, original row 4810, representative 8770.
def source66 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B015.Data.entryAt ⟨99, by decide +kernel⟩

def target66 : Weights.Entry :=
  { word := [8, 2, 2, 10, 0, 10, 0], weights := [0, 1, 1, 0] }

def points66 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 4811, representative 8722.
def source67 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B015.Data.entryAt ⟨51, by decide +kernel⟩

def target67 : Weights.Entry :=
  { word := [8, 2, 2, 10, 0, 10, 8], weights := [1, 0, 0, 1] }

def points67 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 8), (8, 7)]

-- Period 9, original row 4813, representative 8675.
def source68 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B015.Data.entryAt ⟨4, by decide +kernel⟩

def target68 : Weights.Entry :=
  { word := [8, 2, 2, 10, 8, 0, 1], weights := [1, 0, 0, 1] }

def points68 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 4816, representative 8733.
def source69 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B015.Data.entryAt ⟨62, by decide +kernel⟩

def target69 : Weights.Entry :=
  { word := [8, 2, 2, 10, 8, 0, 8], weights := [1, 0, 0, 1] }

def points69 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 4821, representative 8724.
def source70 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B015.Data.entryAt ⟨53, by decide +kernel⟩

def target70 : Weights.Entry :=
  { word := [8, 2, 2, 10, 8, 1, 8], weights := [1, 0, 0, 1] }

def points70 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 4822, representative 8772.
def source71 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B015.Data.entryAt ⟨101, by decide +kernel⟩

def target71 : Weights.Entry :=
  { word := [8, 2, 2, 10, 8, 2, 0], weights := [0, 1, 1, 0] }

def points71 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 4823, representative 8726.
def source72 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B015.Data.entryAt ⟨55, by decide +kernel⟩

def target72 : Weights.Entry :=
  { word := [8, 2, 2, 10, 8, 2, 8], weights := [1, 0, 0, 1] }

-- Period 9, original row 4829, representative 8775.
def source73 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B015.Data.entryAt ⟨104, by decide +kernel⟩

def target73 : Weights.Entry :=
  { word := [8, 2, 2, 10, 8, 8, 0], weights := [0, 1, 1, 0] }

def points73 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 4830, representative 8672.
def source74 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B015.Data.entryAt ⟨1, by decide +kernel⟩

def target74 : Weights.Entry :=
  { word := [8, 2, 2, 10, 8, 8, 1], weights := [1, 0, 0, 1] }

def points74 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 4833, representative 8730.
def source75 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B015.Data.entryAt ⟨59, by decide +kernel⟩

def target75 : Weights.Entry :=
  { word := [8, 2, 2, 10, 8, 8, 8], weights := [1, 0, 0, 1] }

-- Period 9, original row 4837, representative 8767.
def source76 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B015.Data.entryAt ⟨96, by decide +kernel⟩

def target76 : Weights.Entry :=
  { word := [8, 2, 2, 10, 8, 9, 0], weights := [0, 1, 1, 0] }

def points76 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 4838, representative 8719.
def source77 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B015.Data.entryAt ⟨48, by decide +kernel⟩

def target77 : Weights.Entry :=
  { word := [8, 2, 2, 10, 8, 9, 8], weights := [1, 0, 0, 1] }

-- Period 9, original row 4839, representative 8769.
def source78 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B015.Data.entryAt ⟨98, by decide +kernel⟩

def target78 : Weights.Entry :=
  { word := [8, 2, 2, 10, 8, 10, 0], weights := [0, 1, 1, 0] }

def points78 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 4840, representative 8721.
def source79 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B015.Data.entryAt ⟨50, by decide +kernel⟩

def target79 : Weights.Entry :=
  { word := [8, 2, 2, 10, 8, 10, 8], weights := [1, 0, 0, 1] }

-- Period 9, original row 4848, representative 8734.
def source80 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B015.Data.entryAt ⟨63, by decide +kernel⟩

def target80 : Weights.Entry :=
  { word := [8, 2, 8, 2, 0, 1, 8], weights := [0, 1, 0, 1] }

def points80 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 4850, representative 8734.
def source81 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B015.Data.entryAt ⟨63, by decide +kernel⟩

def target81 : Weights.Entry :=
  { word := [8, 2, 8, 2, 0, 2, 8], weights := [0, 1, 0, 1] }

def points81 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 4851, representative 8783.
def source82 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B015.Data.entryAt ⟨112, by decide +kernel⟩

def target82 : Weights.Entry :=
  { word := [8, 2, 8, 2, 0, 8, 0], weights := [0, 1, 0, 0] }

def points82 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 4852, representative 8676.
def source83 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B015.Data.entryAt ⟨5, by decide +kernel⟩

def target83 : Weights.Entry :=
  { word := [8, 2, 8, 2, 0, 8, 1], weights := [0, 1, 0, 1] }

def points83 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 4855, representative 8742.
def source84 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B015.Data.entryAt ⟨71, by decide +kernel⟩

def target84 : Weights.Entry :=
  { word := [8, 2, 8, 2, 0, 8, 8], weights := [1, 0, 0, 1] }

-- Period 9, original row 4859, representative 8777.
def source85 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B015.Data.entryAt ⟨106, by decide +kernel⟩

def target85 : Weights.Entry :=
  { word := [8, 2, 8, 2, 0, 9, 0], weights := [0, 1, 0, 0] }

def points85 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 4860, representative 8735.
def source86 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B015.Data.entryAt ⟨64, by decide +kernel⟩

def target86 : Weights.Entry :=
  { word := [8, 2, 8, 2, 0, 9, 8], weights := [1, 0, 0, 1] }

-- Period 9, original row 4861, representative 8777.
def source87 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B015.Data.entryAt ⟨106, by decide +kernel⟩

def target87 : Weights.Entry :=
  { word := [8, 2, 8, 2, 0, 10, 0], weights := [0, 1, 0, 0] }

def points87 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 4862, representative 8735.
def source88 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B015.Data.entryAt ⟨64, by decide +kernel⟩

def target88 : Weights.Entry :=
  { word := [8, 2, 8, 2, 0, 10, 8], weights := [1, 0, 0, 1] }

def points88 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 8), (8, 7)]

-- Period 9, original row 4863, representative 8781.
def source89 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B015.Data.entryAt ⟨110, by decide +kernel⟩

def target89 : Weights.Entry :=
  { word := [8, 2, 8, 2, 8, 2, 0], weights := [0, 1, 0, 0] }

def points89 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 4864, representative 8739.
def source90 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B015.Data.entryAt ⟨68, by decide +kernel⟩

def target90 : Weights.Entry :=
  { word := [8, 2, 8, 2, 8, 2, 8], weights := [0, 1, 0, 0] }

-- Period 9, original row 4865, representative 8693.
def source91 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B015.Data.entryAt ⟨22, by decide +kernel⟩

def target91 : Weights.Entry :=
  { word := [8, 2, 8, 2, 8, 6, 0], weights := [0, 1, 0, 0] }

def points91 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 4869, representative 8778.
def source92 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B015.Data.entryAt ⟨107, by decide +kernel⟩

def target92 : Weights.Entry :=
  { word := [8, 2, 8, 2, 8, 10, 0], weights := [0, 1, 0, 0] }

def points92 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 4870, representative 8736.
def source93 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B015.Data.entryAt ⟨65, by decide +kernel⟩

def target93 : Weights.Entry :=
  { word := [8, 2, 8, 2, 8, 10, 8], weights := [0, 1, 0, 0] }

-- Period 9, original row 4871, representative 8691.
def source94 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B015.Data.entryAt ⟨20, by decide +kernel⟩

def target94 : Weights.Entry :=
  { word := [8, 2, 8, 4, 4, 4, 0], weights := [1, 0, 1, 0] }

def points94 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 4872, representative 8687.
def source95 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B015.Data.entryAt ⟨16, by decide +kernel⟩

def target95 : Weights.Entry :=
  { word := [8, 2, 8, 4, 4, 12, 0], weights := [1, 0, 1, 0] }

def points95 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 4873, representative 8689.
def source96 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B015.Data.entryAt ⟨18, by decide +kernel⟩

def target96 : Weights.Entry :=
  { word := [8, 2, 8, 4, 12, 4, 0], weights := [1, 0, 1, 0] }

def points96 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 4874, representative 8685.
def source97 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B015.Data.entryAt ⟨14, by decide +kernel⟩

def target97 : Weights.Entry :=
  { word := [8, 2, 8, 4, 12, 12, 0], weights := [1, 0, 1, 0] }

def points97 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 4875, representative 8682.
def source98 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B015.Data.entryAt ⟨11, by decide +kernel⟩

def target98 : Weights.Entry :=
  { word := [8, 2, 8, 6, 0, 4, 8], weights := [1, 1, 1, 1] }

def points98 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 4877, representative 8681.
def source99 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B015.Data.entryAt ⟨10, by decide +kernel⟩

def target99 : Weights.Entry :=
  { word := [8, 2, 8, 6, 8, 4, 8], weights := [0, 1, 1, 0] }

-- Period 9, original row 4879, representative 8752.
def source100 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B015.Data.entryAt ⟨81, by decide +kernel⟩

def target100 : Weights.Entry :=
  { word := [8, 2, 8, 8, 4, 2, 0], weights := [0, 1, 1, 0] }

def points100 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 4880, representative 8684.
def source101 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B015.Data.entryAt ⟨13, by decide +kernel⟩

def target101 : Weights.Entry :=
  { word := [8, 2, 8, 8, 4, 6, 0], weights := [0, 1, 1, 0] }

def points101 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 4882, representative 8750.
def source102 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B015.Data.entryAt ⟨79, by decide +kernel⟩

def target102 : Weights.Entry :=
  { word := [8, 2, 8, 8, 4, 10, 0], weights := [0, 1, 1, 0] }

def points102 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 4883, representative 8751.
def source103 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B015.Data.entryAt ⟨80, by decide +kernel⟩

def target103 : Weights.Entry :=
  { word := [8, 2, 8, 8, 12, 2, 0], weights := [0, 1, 1, 0] }

def points103 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 4884, representative 8683.
def source104 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B015.Data.entryAt ⟨12, by decide +kernel⟩

def target104 : Weights.Entry :=
  { word := [8, 2, 8, 8, 12, 6, 0], weights := [0, 1, 1, 0] }

def points104 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 4886, representative 8749.
def source105 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B015.Data.entryAt ⟨78, by decide +kernel⟩

def target105 : Weights.Entry :=
  { word := [8, 2, 8, 8, 12, 10, 0], weights := [0, 1, 1, 0] }

def points105 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 4888, representative 8741.
def source106 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B015.Data.entryAt ⟨70, by decide +kernel⟩

def target106 : Weights.Entry :=
  { word := [8, 2, 8, 10, 0, 1, 8], weights := [0, 1, 0, 1] }

def points106 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 4890, representative 8741.
def source107 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B015.Data.entryAt ⟨70, by decide +kernel⟩

def target107 : Weights.Entry :=
  { word := [8, 2, 8, 10, 0, 2, 8], weights := [0, 1, 0, 1] }

def points107 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 4891, representative 8695.
def source108 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B015.Data.entryAt ⟨24, by decide +kernel⟩

def target108 : Weights.Entry :=
  { word := [8, 2, 8, 10, 0, 6, 0], weights := [0, 1, 1, 0] }

def points108 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 4892, representative 8784.
def source109 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B015.Data.entryAt ⟨113, by decide +kernel⟩

def target109 : Weights.Entry :=
  { word := [8, 2, 8, 10, 0, 8, 0], weights := [0, 1, 0, 0] }

def points109 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 4893, representative 8677.
def source110 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B015.Data.entryAt ⟨6, by decide +kernel⟩

def target110 : Weights.Entry :=
  { word := [8, 2, 8, 10, 0, 8, 1], weights := [0, 1, 0, 1] }

def points110 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 4896, representative 8743.
def source111 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B015.Data.entryAt ⟨72, by decide +kernel⟩

def target111 : Weights.Entry :=
  { word := [8, 2, 8, 10, 0, 8, 8], weights := [1, 0, 0, 1] }

-- Period 9, original row 4900, representative 8780.
def source112 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B015.Data.entryAt ⟨109, by decide +kernel⟩

def target112 : Weights.Entry :=
  { word := [8, 2, 8, 10, 0, 9, 0], weights := [0, 1, 0, 0] }

def points112 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 4901, representative 8738.
def source113 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B015.Data.entryAt ⟨67, by decide +kernel⟩

def target113 : Weights.Entry :=
  { word := [8, 2, 8, 10, 0, 9, 8], weights := [1, 0, 0, 1] }

-- Period 9, original row 4902, representative 8780.
def source114 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B015.Data.entryAt ⟨109, by decide +kernel⟩

def target114 : Weights.Entry :=
  { word := [8, 2, 8, 10, 0, 10, 0], weights := [0, 1, 0, 0] }

def points114 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 4903, representative 8738.
def source115 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B015.Data.entryAt ⟨67, by decide +kernel⟩

def target115 : Weights.Entry :=
  { word := [8, 2, 8, 10, 0, 10, 8], weights := [1, 0, 0, 1] }

def points115 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 8), (8, 7)]

-- Period 9, original row 4904, representative 8696.
def source116 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B015.Data.entryAt ⟨25, by decide +kernel⟩

def target116 : Weights.Entry :=
  { word := [8, 2, 8, 10, 0, 12, 0], weights := [0, 1, 1, 0] }

def points116 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 4905, representative 8782.
def source117 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B015.Data.entryAt ⟨111, by decide +kernel⟩

def target117 : Weights.Entry :=
  { word := [8, 2, 8, 10, 8, 2, 0], weights := [0, 1, 0, 0] }

def points117 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 4906, representative 8740.
def source118 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B015.Data.entryAt ⟨69, by decide +kernel⟩

def target118 : Weights.Entry :=
  { word := [8, 2, 8, 10, 8, 2, 8], weights := [0, 1, 0, 0] }

-- Period 9, original row 4909, representative 8694.
def source119 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B015.Data.entryAt ⟨23, by decide +kernel⟩

def target119 : Weights.Entry :=
  { word := [8, 2, 8, 10, 8, 6, 0], weights := [0, 1, 0, 0] }

def points119 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 4913, representative 8779.
def source120 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B015.Data.entryAt ⟨108, by decide +kernel⟩

def target120 : Weights.Entry :=
  { word := [8, 2, 8, 10, 8, 10, 0], weights := [0, 1, 0, 0] }

def points120 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 4914, representative 8737.
def source121 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B015.Data.entryAt ⟨66, by decide +kernel⟩

def target121 : Weights.Entry :=
  { word := [8, 2, 8, 10, 8, 10, 8], weights := [0, 1, 0, 0] }

-- Period 9, original row 4917, representative 8692.
def source122 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B015.Data.entryAt ⟨21, by decide +kernel⟩

def target122 : Weights.Entry :=
  { word := [8, 2, 8, 12, 4, 4, 0], weights := [0, 1, 1, 0] }

def points122 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 4919, representative 8688.
def source123 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B015.Data.entryAt ⟨17, by decide +kernel⟩

def target123 : Weights.Entry :=
  { word := [8, 2, 8, 12, 4, 12, 0], weights := [0, 1, 1, 0] }

def points123 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 4921, representative 8690.
def source124 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B015.Data.entryAt ⟨19, by decide +kernel⟩

def target124 : Weights.Entry :=
  { word := [8, 2, 8, 12, 12, 4, 0], weights := [0, 1, 1, 0] }

def points124 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 4923, representative 8686.
def source125 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B015.Data.entryAt ⟨15, by decide +kernel⟩

def target125 : Weights.Entry :=
  { word := [8, 2, 8, 12, 12, 12, 0], weights := [0, 1, 1, 0] }

def points125 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 4926, representative 8700.
def source126 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B015.Data.entryAt ⟨29, by decide +kernel⟩

def target126 : Weights.Entry :=
  { word := [8, 2, 10, 2, 0, 1, 8], weights := [1, 0, 0, 1] }

def points126 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 4928, representative 8700.
def source127 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B015.Data.entryAt ⟨29, by decide +kernel⟩

def target127 : Weights.Entry :=
  { word := [8, 2, 10, 2, 0, 2, 8], weights := [1, 0, 0, 1] }

def points127 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

def period9Entries : List Weights.Entry := [target0, target1, target2, target3, target4, target5, target6, target7, target8, target9, target10, target11, target12, target13, target14, target15, target16, target17, target18, target19, target20, target21, target22, target23, target24, target25, target26, target27, target28, target29, target30, target31, target32, target33, target34, target35, target36, target37, target38, target39, target40, target41, target42, target43, target44, target45, target46, target47, target48, target49, target50, target51, target52, target53, target54, target55, target56, target57, target58, target59, target60, target61, target62, target63, target64, target65, target66, target67, target68, target69, target70, target71, target72, target73, target74, target75, target76, target77, target78, target79, target80, target81, target82, target83, target84, target85, target86, target87, target88, target89, target90, target91, target92, target93, target94, target95, target96, target97, target98, target99, target100, target101, target102, target103, target104, target105, target106, target107, target108, target109, target110, target111, target112, target113, target114, target115, target116, target117, target118, target119, target120, target121, target122, target123, target124, target125, target126, target127]

def period9Chunk : RowCoverage.Chunk where
  rows := [⟨3898, target0⟩, ⟨4062, target1⟩, ⟨4071, target2⟩, ⟨4117, target3⟩, ⟨4136, target4⟩, ⟨4139, target5⟩, ⟨4158, target6⟩, ⟨4172, target7⟩, ⟨4175, target8⟩, ⟨4194, target9⟩, ⟨4289, target10⟩, ⟨4356, target11⟩, ⟨4377, target12⟩, ⟨4381, target13⟩, ⟨4385, target14⟩, ⟨4389, target15⟩, ⟨4393, target16⟩, ⟨4463, target17⟩, ⟨4666, target18⟩, ⟨4667, target19⟩, ⟨4680, target20⟩, ⟨4681, target21⟩, ⟨4682, target22⟩, ⟨4684, target23⟩, ⟨4686, target24⟩, ⟨4700, target25⟩, ⟨4702, target26⟩, ⟨4703, target27⟩, ⟨4722, target28⟩, ⟨4725, target29⟩, ⟨4729, target30⟩, ⟨4730, target31⟩, ⟨4732, target32⟩, ⟨4743, target33⟩, ⟨4745, target34⟩, ⟨4748, target35⟩, ⟨4749, target36⟩, ⟨4752, target37⟩, ⟨4756, target38⟩, ⟨4758, target39⟩, ⟨4760, target40⟩, ⟨4761, target41⟩, ⟨4765, target42⟩, ⟨4769, target43⟩, ⟨4770, target44⟩, ⟨4771, target45⟩, ⟨4772, target46⟩, ⟨4773, target47⟩, ⟨4776, target48⟩, ⟨4781, target49⟩, ⟨4782, target50⟩, ⟨4783, target51⟩, ⟨4784, target52⟩, ⟨4785, target53⟩, ⟨4788, target54⟩, ⟨4792, target55⟩, ⟨4793, target56⟩, ⟨4794, target57⟩, ⟨4795, target58⟩, ⟨4797, target59⟩, ⟨4799, target60⟩, ⟨4800, target61⟩, ⟨4801, target62⟩, ⟨4804, target63⟩, ⟨4808, target64⟩, ⟨4809, target65⟩, ⟨4810, target66⟩, ⟨4811, target67⟩, ⟨4813, target68⟩, ⟨4816, target69⟩, ⟨4821, target70⟩, ⟨4822, target71⟩, ⟨4823, target72⟩, ⟨4829, target73⟩, ⟨4830, target74⟩, ⟨4833, target75⟩, ⟨4837, target76⟩, ⟨4838, target77⟩, ⟨4839, target78⟩, ⟨4840, target79⟩, ⟨4848, target80⟩, ⟨4850, target81⟩, ⟨4851, target82⟩, ⟨4852, target83⟩, ⟨4855, target84⟩, ⟨4859, target85⟩, ⟨4860, target86⟩, ⟨4861, target87⟩, ⟨4862, target88⟩, ⟨4863, target89⟩, ⟨4864, target90⟩, ⟨4865, target91⟩, ⟨4869, target92⟩, ⟨4870, target93⟩, ⟨4871, target94⟩, ⟨4872, target95⟩, ⟨4873, target96⟩, ⟨4874, target97⟩, ⟨4875, target98⟩, ⟨4877, target99⟩, ⟨4879, target100⟩, ⟨4880, target101⟩, ⟨4882, target102⟩, ⟨4883, target103⟩, ⟨4884, target104⟩, ⟨4886, target105⟩, ⟨4888, target106⟩, ⟨4890, target107⟩, ⟨4891, target108⟩, ⟨4892, target109⟩, ⟨4893, target110⟩, ⟨4896, target111⟩, ⟨4900, target112⟩, ⟨4901, target113⟩, ⟨4902, target114⟩, ⟨4903, target115⟩, ⟨4904, target116⟩, ⟨4905, target117⟩, ⟨4906, target118⟩, ⟨4909, target119⟩, ⟨4913, target120⟩, ⟨4914, target121⟩, ⟨4917, target122⟩, ⟨4919, target123⟩, ⟨4921, target124⟩, ⟨4923, target125⟩, ⟨4926, target126⟩, ⟨4928, target127⟩]
  indexMask := 38631888779150799815766032750827803151051662621610002023535536071654803608393112818065301775090077445247786040282513106874101463916872170363096316688126187745372937618266111654658610983361432645591753781033621495336883191327483537030010356843764411128995623295694565214397039958972431678621246996833773214997403859391708166459665839288038218308565794029953007706414903789643842381274473849182386610131396007889985183507584391768302682308151079768114272302186909910324212709654434416289716374190456904858363691266430678241179922452514878001141877416117297884766490868357241508383059081818554816006092794329483856892990095460203572677017475882151638245655215514700226829103297832954033043477648757493292230000847434847805848362248005723647622095559895951762089573897016304780356286275728214034735165304971231758803651492293087914063594112932575748814801395525660151604547284954842860294002982172788199397260791255758493953691348138884342011342740035838745636510164613751533880700351629410647185044126268036670108963212389883930263143183789504374340260162099487596917855996224646548249419603944789062044980722291855624860534122251098812951860998731818642447977937525905826027345186342207948746386436428596431539874012141442919792577392314852859454686481055148180706538483946456692882001935273841430330653917343575135876412143959176500424067961902723789008999093614479053946819031238648277270017819440042147510259696597944803793079838316902678583546353256024929897791861020837626999996416
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

end FranklSmallCyclic.TransportBatches.G068.B001.Data
