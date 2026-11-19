module

public import Conjectures.FranklSmallCyclicRowCoverage
public import Conjectures.FranklSmallCyclicCanonicalWords
public import Conjectures.FranklSmallCyclicOrbit9Block003Data

/-! 128 literal targets sharing one source proof block.
Original words and row indices are retained; weights may be transported.
-/
@[expose] public section

namespace FranklSmallCyclic.TransportBatches.G056.B002.Data

-- Period 9, original row 8024, representative 7223.
def source0 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨89, by decide +kernel⟩

def target0 : Weights.Entry :=
  { word := [10, 8, 8, 4, 10, 8, 12], weights := [1, 0, 0, 1] }

-- Period 9, original row 8052, representative 7249.
def source1 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨115, by decide +kernel⟩

def target1 : Weights.Entry :=
  { word := [10, 8, 8, 12, 0, 12, 2], weights := [1, 0, 0, 1] }

def points1 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 8053, representative 7249.
def source2 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨115, by decide +kernel⟩

def target2 : Weights.Entry :=
  { word := [10, 8, 8, 12, 0, 12, 4], weights := [1, 0, 0, 1] }

def points2 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 8062, representative 7233.
def source3 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨99, by decide +kernel⟩

def target3 : Weights.Entry :=
  { word := [10, 8, 8, 12, 2, 0, 10], weights := [1, 0, 1, 0] }

-- Period 9, original row 8063, representative 7241.
def source4 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨107, by decide +kernel⟩

def target4 : Weights.Entry :=
  { word := [10, 8, 8, 12, 2, 0, 12], weights := [1, 0, 0, 1] }

def points4 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 8067, representative 7219.
def source5 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨85, by decide +kernel⟩

def target5 : Weights.Entry :=
  { word := [10, 8, 8, 12, 2, 8, 10], weights := [1, 0, 1, 0] }

-- Period 9, original row 8068, representative 7227.
def source6 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨93, by decide +kernel⟩

def target6 : Weights.Entry :=
  { word := [10, 8, 8, 12, 2, 8, 12], weights := [1, 0, 0, 1] }

def points6 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 8081, representative 7246.
def source7 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨112, by decide +kernel⟩

def target7 : Weights.Entry :=
  { word := [10, 8, 8, 12, 8, 12, 2], weights := [1, 0, 0, 1] }

def points7 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 8082, representative 7248.
def source8 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨114, by decide +kernel⟩

def target8 : Weights.Entry :=
  { word := [10, 8, 8, 12, 8, 12, 4], weights := [1, 0, 0, 1] }

def points8 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 8091, representative 7232.
def source9 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨98, by decide +kernel⟩

def target9 : Weights.Entry :=
  { word := [10, 8, 8, 12, 10, 0, 10], weights := [1, 0, 1, 0] }

-- Period 9, original row 8092, representative 7240.
def source10 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨106, by decide +kernel⟩

def target10 : Weights.Entry :=
  { word := [10, 8, 8, 12, 10, 0, 12], weights := [1, 0, 0, 1] }

def points10 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 8096, representative 7216.
def source11 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨82, by decide +kernel⟩

def target11 : Weights.Entry :=
  { word := [10, 8, 8, 12, 10, 8, 10], weights := [1, 0, 1, 0] }

-- Period 9, original row 8097, representative 7224.
def source12 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨90, by decide +kernel⟩

def target12 : Weights.Entry :=
  { word := [10, 8, 8, 12, 10, 8, 12], weights := [1, 0, 1, 0] }

-- Period 9, original row 8109, representative 7260.
def source13 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨126, by decide +kernel⟩

def target13 : Weights.Entry :=
  { word := [10, 8, 9, 8, 1, 12, 2], weights := [1, 0, 1, 1] }

def points13 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 8110, representative 7260.
def source14 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨126, by decide +kernel⟩

def target14 : Weights.Entry :=
  { word := [10, 8, 9, 8, 1, 12, 4], weights := [1, 0, 1, 1] }

def points14 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 8116, representative 7259.
def source15 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨125, by decide +kernel⟩

def target15 : Weights.Entry :=
  { word := [10, 8, 9, 8, 9, 12, 4], weights := [1, 0, 1, 1] }

def points15 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 8134, representative 7222.
def source16 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨88, by decide +kernel⟩

def target16 : Weights.Entry :=
  { word := [10, 8, 12, 2, 0, 8, 10], weights := [1, 0, 0, 1] }

def points16 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 8135, representative 7222.
def source17 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨88, by decide +kernel⟩

def target17 : Weights.Entry :=
  { word := [10, 8, 12, 2, 0, 8, 12], weights := [1, 0, 0, 1] }

def points17 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 8143, representative 7223.
def source18 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨89, by decide +kernel⟩

def target18 : Weights.Entry :=
  { word := [10, 8, 12, 2, 8, 8, 12], weights := [1, 0, 0, 1] }

def points18 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 8161, representative 7225.
def source19 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨91, by decide +kernel⟩

def target19 : Weights.Entry :=
  { word := [10, 8, 12, 10, 0, 8, 10], weights := [0, 1, 0, 1] }

def points19 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 8162, representative 7225.
def source20 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨91, by decide +kernel⟩

def target20 : Weights.Entry :=
  { word := [10, 8, 12, 10, 0, 8, 12], weights := [0, 1, 0, 1] }

def points20 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 8169, representative 7224.
def source21 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨90, by decide +kernel⟩

def target21 : Weights.Entry :=
  { word := [10, 8, 12, 10, 8, 8, 12], weights := [0, 1, 0, 1] }

def points21 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 8424, representative 7256.
def source22 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨122, by decide +kernel⟩

def target22 : Weights.Entry :=
  { word := [12, 0, 0, 12, 0, 12, 4], weights := [0, 0, 1, 1] }

def points22 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 8437, representative 7229.
def source23 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨95, by decide +kernel⟩

def target23 : Weights.Entry :=
  { word := [12, 0, 4, 2, 0, 8, 10], weights := [0, 1, 0, 1] }

def points23 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 8438, representative 7229.
def source24 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨95, by decide +kernel⟩

def target24 : Weights.Entry :=
  { word := [12, 0, 4, 2, 0, 8, 12], weights := [0, 1, 0, 1] }

def points24 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 8446, representative 7230.
def source25 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨96, by decide +kernel⟩

def target25 : Weights.Entry :=
  { word := [12, 0, 4, 2, 8, 8, 12], weights := [0, 1, 0, 1] }

def points25 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 8465, representative 7236.
def source26 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨102, by decide +kernel⟩

def target26 : Weights.Entry :=
  { word := [12, 0, 4, 10, 0, 8, 10], weights := [0, 1, 0, 1] }

def points26 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 8466, representative 7236.
def source27 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨102, by decide +kernel⟩

def target27 : Weights.Entry :=
  { word := [12, 0, 4, 10, 0, 8, 12], weights := [0, 1, 0, 1] }

def points27 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 8478, representative 7233.
def source28 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨99, by decide +kernel⟩

def target28 : Weights.Entry :=
  { word := [12, 0, 4, 10, 8, 8, 12], weights := [0, 1, 0, 1] }

def points28 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 8526, representative 7234.
def source29 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨100, by decide +kernel⟩

def target29 : Weights.Entry :=
  { word := [12, 0, 12, 2, 0, 8, 10], weights := [0, 1, 0, 1] }

def points29 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 8527, representative 7234.
def source30 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨100, by decide +kernel⟩

def target30 : Weights.Entry :=
  { word := [12, 0, 12, 2, 0, 8, 12], weights := [0, 1, 0, 1] }

def points30 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 8535, representative 7231.
def source31 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨97, by decide +kernel⟩

def target31 : Weights.Entry :=
  { word := [12, 0, 12, 2, 8, 8, 12], weights := [0, 1, 0, 1] }

def points31 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 8558, representative 7235.
def source32 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨101, by decide +kernel⟩

def target32 : Weights.Entry :=
  { word := [12, 0, 12, 10, 0, 8, 10], weights := [0, 1, 0, 1] }

def points32 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 8559, representative 7235.
def source33 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨101, by decide +kernel⟩

def target33 : Weights.Entry :=
  { word := [12, 0, 12, 10, 0, 8, 12], weights := [0, 1, 0, 1] }

def points33 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 8571, representative 7232.
def source34 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨98, by decide +kernel⟩

def target34 : Weights.Entry :=
  { word := [12, 0, 12, 10, 8, 8, 12], weights := [0, 1, 0, 1] }

def points34 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 8578, representative 7202.
def source35 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨69, by decide +kernel⟩

def target35 : Weights.Entry :=
  { word := [12, 2, 0, 1, 0, 8, 0], weights := [1, 1, 0, 0] }

def points35 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 8579, representative 7202.
def source36 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨69, by decide +kernel⟩

def target36 : Weights.Entry :=
  { word := [12, 2, 0, 2, 0, 8, 0], weights := [1, 1, 0, 0] }

def points36 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 5), (4, 6), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 8582, representative 7203.
def source37 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨70, by decide +kernel⟩

def target37 : Weights.Entry :=
  { word := [12, 2, 0, 9, 0, 8, 0], weights := [0, 1, 1, 0] }

def points37 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 8599, representative 7158.
def source38 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨25, by decide +kernel⟩

def target38 : Weights.Entry :=
  { word := [12, 2, 0, 10, 0, 0, 8], weights := [0, 1, 0, 1] }

def points38 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 8603, representative 7203.
def source39 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨70, by decide +kernel⟩

def target39 : Weights.Entry :=
  { word := [12, 2, 0, 10, 0, 8, 0], weights := [0, 1, 0, 1] }

def points39 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 5), (4, 6), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 8606, representative 7157.
def source40 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨24, by decide +kernel⟩

def target40 : Weights.Entry :=
  { word := [12, 2, 0, 10, 0, 8, 8], weights := [0, 1, 0, 1] }

def points40 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 8616, representative 7171.
def source41 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨38, by decide +kernel⟩

def target41 : Weights.Entry :=
  { word := [12, 2, 0, 12, 10, 0, 8], weights := [1, 1, 0, 1] }

def points41 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 8622, representative 7137.
def source42 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨4, by decide +kernel⟩

def target42 : Weights.Entry :=
  { word := [12, 2, 8, 2, 0, 1, 8], weights := [0, 1, 0, 1] }

def points42 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 8624, representative 7137.
def source43 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨4, by decide +kernel⟩

def target43 : Weights.Entry :=
  { word := [12, 2, 8, 2, 0, 2, 8], weights := [0, 1, 0, 1] }

def points43 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 8625, representative 7192.
def source44 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨59, by decide +kernel⟩

def target44 : Weights.Entry :=
  { word := [12, 2, 8, 2, 0, 8, 0], weights := [0, 1, 0, 1] }

def points44 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 8629, representative 7145.
def source45 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨12, by decide +kernel⟩

def target45 : Weights.Entry :=
  { word := [12, 2, 8, 2, 0, 8, 8], weights := [0, 1, 0, 1] }

def points45 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 8633, representative 7186.
def source46 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨53, by decide +kernel⟩

def target46 : Weights.Entry :=
  { word := [12, 2, 8, 2, 0, 9, 0], weights := [0, 1, 0, 1] }

def points46 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 8634, representative 7138.
def source47 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨5, by decide +kernel⟩

def target47 : Weights.Entry :=
  { word := [12, 2, 8, 2, 0, 9, 8], weights := [0, 1, 0, 1] }

def points47 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 8635, representative 7186.
def source48 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨53, by decide +kernel⟩

def target48 : Weights.Entry :=
  { word := [12, 2, 8, 2, 0, 10, 0], weights := [0, 1, 0, 1] }

def points48 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 8636, representative 7138.
def source49 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨5, by decide +kernel⟩

def target49 : Weights.Entry :=
  { word := [12, 2, 8, 2, 0, 10, 8], weights := [0, 1, 0, 1] }

def points49 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 8637, representative 7190.
def source50 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨57, by decide +kernel⟩

def target50 : Weights.Entry :=
  { word := [12, 2, 8, 2, 8, 2, 0], weights := [0, 1, 0, 1] }

def points50 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 8638, representative 7142.
def source51 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨9, by decide +kernel⟩

def target51 : Weights.Entry :=
  { word := [12, 2, 8, 2, 8, 2, 8], weights := [0, 1, 0, 1] }

def points51 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 8641, representative 7187.
def source52 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨54, by decide +kernel⟩

def target52 : Weights.Entry :=
  { word := [12, 2, 8, 2, 8, 10, 0], weights := [0, 1, 0, 1] }

def points52 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 8642, representative 7139.
def source53 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨6, by decide +kernel⟩

def target53 : Weights.Entry :=
  { word := [12, 2, 8, 2, 8, 10, 8], weights := [0, 1, 0, 1] }

def points53 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 8647, representative 7183.
def source54 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨50, by decide +kernel⟩

def target54 : Weights.Entry :=
  { word := [12, 2, 8, 8, 4, 2, 0], weights := [0, 1, 1, 0] }

def points54 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 8649, representative 7181.
def source55 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨48, by decide +kernel⟩

def target55 : Weights.Entry :=
  { word := [12, 2, 8, 8, 4, 10, 0], weights := [0, 1, 1, 0] }

def points55 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 8650, representative 7182.
def source56 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨49, by decide +kernel⟩

def target56 : Weights.Entry :=
  { word := [12, 2, 8, 8, 12, 2, 0], weights := [0, 1, 1, 0] }

def points56 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 8652, representative 7180.
def source57 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨47, by decide +kernel⟩

def target57 : Weights.Entry :=
  { word := [12, 2, 8, 8, 12, 10, 0], weights := [0, 1, 1, 0] }

def points57 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 8654, representative 7144.
def source58 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨11, by decide +kernel⟩

def target58 : Weights.Entry :=
  { word := [12, 2, 8, 10, 0, 1, 8], weights := [0, 1, 0, 1] }

def points58 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 8656, representative 7144.
def source59 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨11, by decide +kernel⟩

def target59 : Weights.Entry :=
  { word := [12, 2, 8, 10, 0, 2, 8], weights := [0, 1, 0, 1] }

def points59 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 8658, representative 7193.
def source60 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨60, by decide +kernel⟩

def target60 : Weights.Entry :=
  { word := [12, 2, 8, 10, 0, 8, 0], weights := [0, 1, 0, 1] }

def points60 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 8662, representative 7146.
def source61 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨13, by decide +kernel⟩

def target61 : Weights.Entry :=
  { word := [12, 2, 8, 10, 0, 8, 8], weights := [0, 1, 0, 1] }

def points61 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 8666, representative 7189.
def source62 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨56, by decide +kernel⟩

def target62 : Weights.Entry :=
  { word := [12, 2, 8, 10, 0, 9, 0], weights := [0, 1, 0, 1] }

def points62 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 8667, representative 7141.
def source63 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨8, by decide +kernel⟩

def target63 : Weights.Entry :=
  { word := [12, 2, 8, 10, 0, 9, 8], weights := [0, 1, 0, 1] }

def points63 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 8668, representative 7189.
def source64 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨56, by decide +kernel⟩

def target64 : Weights.Entry :=
  { word := [12, 2, 8, 10, 0, 10, 0], weights := [0, 1, 0, 1] }

def points64 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 8669, representative 7141.
def source65 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨8, by decide +kernel⟩

def target65 : Weights.Entry :=
  { word := [12, 2, 8, 10, 0, 10, 8], weights := [0, 1, 0, 1] }

def points65 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 8671, representative 7191.
def source66 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨58, by decide +kernel⟩

def target66 : Weights.Entry :=
  { word := [12, 2, 8, 10, 8, 2, 0], weights := [0, 1, 0, 1] }

def points66 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 8672, representative 7143.
def source67 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨10, by decide +kernel⟩

def target67 : Weights.Entry :=
  { word := [12, 2, 8, 10, 8, 2, 8], weights := [0, 1, 0, 1] }

def points67 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 8677, representative 7188.
def source68 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨55, by decide +kernel⟩

def target68 : Weights.Entry :=
  { word := [12, 2, 8, 10, 8, 10, 0], weights := [0, 1, 0, 1] }

def points68 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 8678, representative 7140.
def source69 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨7, by decide +kernel⟩

def target69 : Weights.Entry :=
  { word := [12, 2, 8, 10, 8, 10, 8], weights := [0, 1, 0, 1] }

def points69 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 8690, representative 7212.
def source70 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨78, by decide +kernel⟩

def target70 : Weights.Entry :=
  { word := [12, 4, 4, 8, 8, 2, 10], weights := [0, 1, 1, 0] }

-- Period 9, original row 8692, representative 7210.
def source71 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨76, by decide +kernel⟩

def target71 : Weights.Entry :=
  { word := [12, 4, 4, 8, 8, 10, 10], weights := [0, 1, 1, 0] }

-- Period 9, original row 8706, representative 7212.
def source72 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨78, by decide +kernel⟩

def target72 : Weights.Entry :=
  { word := [12, 4, 8, 8, 2, 2, 10], weights := [0, 1, 1, 0] }

def points72 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 8708, representative 7208.
def source73 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨74, by decide +kernel⟩

def target73 : Weights.Entry :=
  { word := [12, 4, 8, 8, 2, 10, 10], weights := [0, 1, 1, 0] }

-- Period 9, original row 8712, representative 7261.
def source74 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨127, by decide +kernel⟩

def target74 : Weights.Entry :=
  { word := [12, 4, 8, 8, 9, 12, 4], weights := [1, 0, 1, 1] }

def points74 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 8715, representative 7211.
def source75 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨77, by decide +kernel⟩

def target75 : Weights.Entry :=
  { word := [12, 4, 8, 8, 10, 2, 10], weights := [0, 1, 1, 0] }

-- Period 9, original row 8717, representative 7207.
def source76 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨73, by decide +kernel⟩

def target76 : Weights.Entry :=
  { word := [12, 4, 8, 8, 10, 10, 10], weights := [0, 1, 1, 0] }

-- Period 9, original row 8720, representative 7211.
def source77 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨77, by decide +kernel⟩

def target77 : Weights.Entry :=
  { word := [12, 4, 12, 8, 8, 2, 10], weights := [0, 1, 1, 0] }

def points77 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 8722, representative 7209.
def source78 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨75, by decide +kernel⟩

def target78 : Weights.Entry :=
  { word := [12, 4, 12, 8, 8, 10, 10], weights := [0, 1, 1, 0] }

-- Period 9, original row 8740, representative 7229.
def source79 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨95, by decide +kernel⟩

def target79 : Weights.Entry :=
  { word := [12, 8, 0, 4, 2, 0, 10], weights := [1, 0, 1, 0] }

def points79 : List (ℕ × ℕ) := [(0, 0), (1, 2), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 8741, representative 7237.
def source80 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨103, by decide +kernel⟩

def target80 : Weights.Entry :=
  { word := [12, 8, 0, 4, 2, 0, 12], weights := [1, 0, 0, 1] }

def points80 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 8745, representative 7213.
def source81 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨79, by decide +kernel⟩

def target81 : Weights.Entry :=
  { word := [12, 8, 0, 4, 2, 8, 10], weights := [1, 0, 1, 0] }

def points81 : List (ℕ × ℕ) := [(0, 0), (1, 2), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 8746, representative 7221.
def source82 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨87, by decide +kernel⟩

def target82 : Weights.Entry :=
  { word := [12, 8, 0, 4, 2, 8, 12], weights := [1, 0, 0, 1] }

def points82 : List (ℕ × ℕ) := [(0, 0), (1, 2), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 8758, representative 7250.
def source83 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨116, by decide +kernel⟩

def target83 : Weights.Entry :=
  { word := [12, 8, 0, 4, 8, 12, 4], weights := [1, 0, 0, 1] }

def points83 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 8766, representative 7234.
def source84 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨100, by decide +kernel⟩

def target84 : Weights.Entry :=
  { word := [12, 8, 0, 4, 10, 0, 10], weights := [1, 0, 1, 0] }

def points84 : List (ℕ × ℕ) := [(0, 0), (1, 2), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 8767, representative 7242.
def source85 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨108, by decide +kernel⟩

def target85 : Weights.Entry :=
  { word := [12, 8, 0, 4, 10, 0, 12], weights := [1, 0, 0, 1] }

def points85 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 8771, representative 7214.
def source86 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨80, by decide +kernel⟩

def target86 : Weights.Entry :=
  { word := [12, 8, 0, 4, 10, 8, 10], weights := [1, 0, 1, 0] }

def points86 : List (ℕ × ℕ) := [(0, 0), (1, 2), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 8772, representative 7222.
def source87 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨88, by decide +kernel⟩

def target87 : Weights.Entry :=
  { word := [12, 8, 0, 4, 10, 8, 12], weights := [1, 0, 0, 1] }

def points87 : List (ℕ × ℕ) := [(0, 0), (1, 2), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 8784, representative 7236.
def source88 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨102, by decide +kernel⟩

def target88 : Weights.Entry :=
  { word := [12, 8, 0, 12, 2, 0, 10], weights := [1, 0, 1, 0] }

def points88 : List (ℕ × ℕ) := [(0, 0), (1, 2), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 8785, representative 7244.
def source89 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨110, by decide +kernel⟩

def target89 : Weights.Entry :=
  { word := [12, 8, 0, 12, 2, 0, 12], weights := [1, 0, 0, 1] }

def points89 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 8789, representative 7220.
def source90 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨86, by decide +kernel⟩

def target90 : Weights.Entry :=
  { word := [12, 8, 0, 12, 2, 8, 10], weights := [1, 0, 1, 0] }

def points90 : List (ℕ × ℕ) := [(0, 0), (1, 2), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 8790, representative 7228.
def source91 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨94, by decide +kernel⟩

def target91 : Weights.Entry :=
  { word := [12, 8, 0, 12, 2, 8, 12], weights := [1, 0, 1, 0] }

def points91 : List (ℕ × ℕ) := [(0, 0), (1, 2), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 8801, representative 7251.
def source92 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨117, by decide +kernel⟩

def target92 : Weights.Entry :=
  { word := [12, 8, 0, 12, 8, 12, 4], weights := [1, 0, 0, 1] }

def points92 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 8809, representative 7235.
def source93 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨101, by decide +kernel⟩

def target93 : Weights.Entry :=
  { word := [12, 8, 0, 12, 10, 0, 10], weights := [1, 0, 1, 0] }

def points93 : List (ℕ × ℕ) := [(0, 0), (1, 2), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 8810, representative 7243.
def source94 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨109, by decide +kernel⟩

def target94 : Weights.Entry :=
  { word := [12, 8, 0, 12, 10, 0, 12], weights := [1, 0, 0, 1] }

def points94 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 8814, representative 7217.
def source95 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨83, by decide +kernel⟩

def target95 : Weights.Entry :=
  { word := [12, 8, 0, 12, 10, 8, 10], weights := [1, 0, 1, 0] }

def points95 : List (ℕ × ℕ) := [(0, 0), (1, 2), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 8815, representative 7225.
def source96 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨91, by decide +kernel⟩

def target96 : Weights.Entry :=
  { word := [12, 8, 0, 12, 10, 8, 12], weights := [1, 0, 1, 0] }

def points96 : List (ℕ × ℕ) := [(0, 0), (1, 2), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 8828, representative 7213.
def source97 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨79, by decide +kernel⟩

def target97 : Weights.Entry :=
  { word := [12, 8, 4, 2, 0, 8, 10], weights := [0, 1, 0, 1] }

def points97 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 8829, representative 7213.
def source98 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨79, by decide +kernel⟩

def target98 : Weights.Entry :=
  { word := [12, 8, 4, 2, 0, 8, 12], weights := [0, 1, 0, 1] }

def points98 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 8837, representative 7218.
def source99 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨84, by decide +kernel⟩

def target99 : Weights.Entry :=
  { word := [12, 8, 4, 2, 8, 8, 12], weights := [0, 1, 0, 1] }

def points99 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 8863, representative 7220.
def source100 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨86, by decide +kernel⟩

def target100 : Weights.Entry :=
  { word := [12, 8, 4, 10, 0, 8, 10], weights := [0, 1, 0, 1] }

def points100 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 8864, representative 7220.
def source101 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨86, by decide +kernel⟩

def target101 : Weights.Entry :=
  { word := [12, 8, 4, 10, 0, 8, 12], weights := [0, 1, 0, 1] }

def points101 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 8871, representative 7219.
def source102 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨85, by decide +kernel⟩

def target102 : Weights.Entry :=
  { word := [12, 8, 4, 10, 8, 8, 12], weights := [0, 1, 0, 1] }

def points102 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 8936, representative 7214.
def source103 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨80, by decide +kernel⟩

def target103 : Weights.Entry :=
  { word := [12, 8, 12, 2, 0, 8, 10], weights := [0, 1, 0, 1] }

def points103 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 8937, representative 7214.
def source104 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨80, by decide +kernel⟩

def target104 : Weights.Entry :=
  { word := [12, 8, 12, 2, 0, 8, 12], weights := [0, 1, 0, 1] }

def points104 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 8945, representative 7215.
def source105 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨81, by decide +kernel⟩

def target105 : Weights.Entry :=
  { word := [12, 8, 12, 2, 8, 8, 12], weights := [0, 1, 0, 1] }

def points105 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 8971, representative 7217.
def source106 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨83, by decide +kernel⟩

def target106 : Weights.Entry :=
  { word := [12, 8, 12, 10, 0, 8, 10], weights := [0, 1, 0, 1] }

def points106 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 8972, representative 7217.
def source107 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨83, by decide +kernel⟩

def target107 : Weights.Entry :=
  { word := [12, 8, 12, 10, 0, 8, 12], weights := [0, 1, 0, 1] }

def points107 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 8979, representative 7216.
def source108 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨82, by decide +kernel⟩

def target108 : Weights.Entry :=
  { word := [12, 8, 12, 10, 8, 8, 12], weights := [0, 1, 0, 1] }

def points108 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 9055, representative 7208.
def source109 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨74, by decide +kernel⟩

def target109 : Weights.Entry :=
  { word := [12, 12, 4, 8, 8, 2, 10], weights := [0, 1, 1, 0] }

def points109 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 9057, representative 7206.
def source110 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨72, by decide +kernel⟩

def target110 : Weights.Entry :=
  { word := [12, 12, 4, 8, 8, 10, 10], weights := [0, 1, 1, 0] }

-- Period 9, original row 9065, representative 7258.
def source111 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨124, by decide +kernel⟩

def target111 : Weights.Entry :=
  { word := [12, 12, 8, 8, 1, 12, 2], weights := [1, 0, 1, 1] }

def points111 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 9066, representative 7258.
def source112 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨124, by decide +kernel⟩

def target112 : Weights.Entry :=
  { word := [12, 12, 8, 8, 1, 12, 4], weights := [1, 0, 1, 1] }

def points112 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 9071, representative 7210.
def source113 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨76, by decide +kernel⟩

def target113 : Weights.Entry :=
  { word := [12, 12, 8, 8, 2, 2, 10], weights := [0, 1, 1, 0] }

def points113 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 9073, representative 7206.
def source114 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨72, by decide +kernel⟩

def target114 : Weights.Entry :=
  { word := [12, 12, 8, 8, 2, 10, 10], weights := [0, 1, 1, 0] }

def points114 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 9077, representative 7257.
def source115 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨123, by decide +kernel⟩

def target115 : Weights.Entry :=
  { word := [12, 12, 8, 8, 9, 12, 4], weights := [1, 0, 1, 1] }

def points115 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 9080, representative 7209.
def source116 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨75, by decide +kernel⟩

def target116 : Weights.Entry :=
  { word := [12, 12, 8, 8, 10, 2, 10], weights := [0, 1, 1, 0] }

def points116 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 9085, representative 7207.
def source117 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨73, by decide +kernel⟩

def target117 : Weights.Entry :=
  { word := [12, 12, 12, 8, 8, 2, 10], weights := [0, 1, 1, 0] }

def points117 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 10, original row 127, representative 7133.
def source118 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨1, by decide +kernel⟩

def target118 : Weights.Entry :=
  { word := [0, 1, 0, 9, 4, 4, 12], weights := [1, 0, 1, 1] }

def points118 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 10, original row 193, representative 7135.
def source119 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨3, by decide +kernel⟩

def target119 : Weights.Entry :=
  { word := [0, 1, 4, 10, 8, 4, 12], weights := [1, 0, 1, 1] }

def points119 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 10, original row 218, representative 7132.
def source120 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨0, by decide +kernel⟩

def target120 : Weights.Entry :=
  { word := [0, 1, 8, 9, 4, 4, 12], weights := [1, 0, 1, 1] }

def points120 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 10, original row 286, representative 7134.
def source121 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨2, by decide +kernel⟩

def target121 : Weights.Entry :=
  { word := [0, 1, 12, 10, 8, 4, 12], weights := [1, 0, 1, 1] }

def points121 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 10, original row 590, representative 7183.
def source122 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨50, by decide +kernel⟩

def target122 : Weights.Entry :=
  { word := [0, 4, 2, 8, 8, 4, 10], weights := [0, 1, 1, 0] }

def points122 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 10, original row 654, representative 7190.
def source123 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨57, by decide +kernel⟩

def target123 : Weights.Entry :=
  { word := [0, 4, 8, 4, 8, 4, 10], weights := [1, 0, 1, 0] }

def points123 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 10, original row 655, representative 7198.
def source124 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨65, by decide +kernel⟩

def target124 : Weights.Entry :=
  { word := [0, 4, 8, 4, 8, 4, 12], weights := [1, 0, 0, 1] }

def points124 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 10, original row 682, representative 7191.
def source125 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨58, by decide +kernel⟩

def target125 : Weights.Entry :=
  { word := [0, 4, 8, 12, 8, 4, 10], weights := [1, 0, 1, 0] }

def points125 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 10, original row 683, representative 7199.
def source126 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨66, by decide +kernel⟩

def target126 : Weights.Entry :=
  { word := [0, 4, 8, 12, 8, 4, 12], weights := [1, 0, 1, 0] }

def points126 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 10, original row 710, representative 7182.
def source127 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B003.Data.entryAt ⟨49, by decide +kernel⟩

def target127 : Weights.Entry :=
  { word := [0, 4, 10, 8, 8, 4, 10], weights := [0, 1, 1, 0] }

def points127 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

def period9Entries : List Weights.Entry := [target0, target1, target2, target3, target4, target5, target6, target7, target8, target9, target10, target11, target12, target13, target14, target15, target16, target17, target18, target19, target20, target21, target22, target23, target24, target25, target26, target27, target28, target29, target30, target31, target32, target33, target34, target35, target36, target37, target38, target39, target40, target41, target42, target43, target44, target45, target46, target47, target48, target49, target50, target51, target52, target53, target54, target55, target56, target57, target58, target59, target60, target61, target62, target63, target64, target65, target66, target67, target68, target69, target70, target71, target72, target73, target74, target75, target76, target77, target78, target79, target80, target81, target82, target83, target84, target85, target86, target87, target88, target89, target90, target91, target92, target93, target94, target95, target96, target97, target98, target99, target100, target101, target102, target103, target104, target105, target106, target107, target108, target109, target110, target111, target112, target113, target114, target115, target116, target117]

def period9Chunk : RowCoverage.Chunk where
  rows := [⟨8024, target0⟩, ⟨8052, target1⟩, ⟨8053, target2⟩, ⟨8062, target3⟩, ⟨8063, target4⟩, ⟨8067, target5⟩, ⟨8068, target6⟩, ⟨8081, target7⟩, ⟨8082, target8⟩, ⟨8091, target9⟩, ⟨8092, target10⟩, ⟨8096, target11⟩, ⟨8097, target12⟩, ⟨8109, target13⟩, ⟨8110, target14⟩, ⟨8116, target15⟩, ⟨8134, target16⟩, ⟨8135, target17⟩, ⟨8143, target18⟩, ⟨8161, target19⟩, ⟨8162, target20⟩, ⟨8169, target21⟩, ⟨8424, target22⟩, ⟨8437, target23⟩, ⟨8438, target24⟩, ⟨8446, target25⟩, ⟨8465, target26⟩, ⟨8466, target27⟩, ⟨8478, target28⟩, ⟨8526, target29⟩, ⟨8527, target30⟩, ⟨8535, target31⟩, ⟨8558, target32⟩, ⟨8559, target33⟩, ⟨8571, target34⟩, ⟨8578, target35⟩, ⟨8579, target36⟩, ⟨8582, target37⟩, ⟨8599, target38⟩, ⟨8603, target39⟩, ⟨8606, target40⟩, ⟨8616, target41⟩, ⟨8622, target42⟩, ⟨8624, target43⟩, ⟨8625, target44⟩, ⟨8629, target45⟩, ⟨8633, target46⟩, ⟨8634, target47⟩, ⟨8635, target48⟩, ⟨8636, target49⟩, ⟨8637, target50⟩, ⟨8638, target51⟩, ⟨8641, target52⟩, ⟨8642, target53⟩, ⟨8647, target54⟩, ⟨8649, target55⟩, ⟨8650, target56⟩, ⟨8652, target57⟩, ⟨8654, target58⟩, ⟨8656, target59⟩, ⟨8658, target60⟩, ⟨8662, target61⟩, ⟨8666, target62⟩, ⟨8667, target63⟩, ⟨8668, target64⟩, ⟨8669, target65⟩, ⟨8671, target66⟩, ⟨8672, target67⟩, ⟨8677, target68⟩, ⟨8678, target69⟩, ⟨8690, target70⟩, ⟨8692, target71⟩, ⟨8706, target72⟩, ⟨8708, target73⟩, ⟨8712, target74⟩, ⟨8715, target75⟩, ⟨8717, target76⟩, ⟨8720, target77⟩, ⟨8722, target78⟩, ⟨8740, target79⟩, ⟨8741, target80⟩, ⟨8745, target81⟩, ⟨8746, target82⟩, ⟨8758, target83⟩, ⟨8766, target84⟩, ⟨8767, target85⟩, ⟨8771, target86⟩, ⟨8772, target87⟩, ⟨8784, target88⟩, ⟨8785, target89⟩, ⟨8789, target90⟩, ⟨8790, target91⟩, ⟨8801, target92⟩, ⟨8809, target93⟩, ⟨8810, target94⟩, ⟨8814, target95⟩, ⟨8815, target96⟩, ⟨8828, target97⟩, ⟨8829, target98⟩, ⟨8837, target99⟩, ⟨8863, target100⟩, ⟨8864, target101⟩, ⟨8871, target102⟩, ⟨8936, target103⟩, ⟨8937, target104⟩, ⟨8945, target105⟩, ⟨8971, target106⟩, ⟨8972, target107⟩, ⟨8979, target108⟩, ⟨9055, target109⟩, ⟨9057, target110⟩, ⟨9065, target111⟩, ⟨9066, target112⟩, ⟨9071, target113⟩, ⟨9073, target114⟩, ⟨9077, target115⟩, ⟨9080, target116⟩, ⟨9085, target117⟩]
  indexMask := 74584010762162435932639799431251682307505909454326473660817632161647753114559765246064098854914531462843961545643342151222813181625452190123033904482091053013113896670971763764549559951814637584423192714448253525279963128238013990866687053109697878272859382548995112500888784452185638420062389202885163378895483302016133998266103739942271336918301651170615415689218416665230473406537043580084253157152448424098515724472382185424947839081825296894852550443050366451914569596826868568301519800981093236047541705120654439941628847378409892650636060319900147636637262073138049569792701136016835214162169067776520501298065751327434944166752550111573718672845460223536720738764712266332540244354915405927439405771507376123840670116614251210267542866214797039919666183541185764721390627820673159965289042673639277468287813130027581108019718560923102271080845384180601553359327750416936912496960097513219134694119460237620884543935072992756545086450767348062738434303418772421999473094048540561043352119218475366210937581230567450826421471647493077327299544812162396895584549429781602047615906825149496014073217269650758682364292107411609765114675608206656695402297856474946430559076686363233622193878335536450656098166822638682973036154840327050478458964130739729888553835031379886989552345631947676126602560234774181529121818679496286217020617223544199798488259607825826810803636896131883493979919522983084902259181672960172016736991705886648607615463010476943281169853674637555085377047652006641148658398566899205304573402630498321972481203999706735523978106232371643063320437804089327833592731853093744268248616429791999457678530658291978418355329410363771838685082043245884377717426742716593852555983722007862999597472894029913877465906584814696478354628735253486849863566257620229466970022717637084510385580259916831567499439459402073460499642733151838870997327220654042565243997788609537875203975739363958796553144860375069227183226882840724951567715214785480419093885618037841329486970906108752830689088652098048813753727302974689093772812120630342725017284982840137246162286168109482554485723570506467405861714880365824481251934229142148480085992301303968792356079988711996482053951106587335133885022228052305508982650178441857833874118206351640074749878396704569359621785122606374812752490459979698624259706104490902234662563465509614609906300031592510861118385112493444964950433420917687737985393402251218283837677320137918173474846098337392514606677361036022394327255480298040657994053305374270842620237559045976309682064253785694906117575232812172526117602902995359384228613919351036325080802888647701848829608425087801245295572283367268965902370922703447197996695066056548486502424837585347577850361778618239399193908132450402304
  count := 118

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

def period10Entries : List Weights.Entry := [target118, target119, target120, target121, target122, target123, target124, target125, target126, target127]

def period10Chunk : RowCoverage.Chunk where
  rows := [⟨127, target118⟩, ⟨193, target119⟩, ⟨218, target120⟩, ⟨286, target121⟩, ⟨590, target122⟩, ⟨654, target123⟩, ⟨655, target124⟩, ⟨682, target125⟩, ⟨683, target126⟩, ⟨710, target127⟩]
  indexMask := 5386379223383012817025278742650576876650023479576178064182969469045709281337618086601591755051062893264629790719535471118745356889860889004627298474313252928797014322245160137348768847329208291545604546650953482240
  count := 10

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem period10Chunk_entries :
    period10Chunk.rows.map RowCoverage.TaggedRow.entry = period10Entries := rfl

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem period10_index_check :
    RowCoverage.indexCheck CanonicalWords.count period10Chunk = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem period10_words_check :
    RowCoverage.wordsCheck CanonicalWords.wordAt period10Chunk = true := by
  decide +kernel

end FranklSmallCyclic.TransportBatches.G056.B002.Data
