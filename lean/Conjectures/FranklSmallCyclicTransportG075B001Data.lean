module

public import Conjectures.FranklSmallCyclicRowCoverage
public import Conjectures.FranklSmallCyclicCanonicalWords
public import Conjectures.FranklSmallCyclicWeightsPilotData

/-! 96 literal targets sharing one source proof block.
Original words and row indices are retained; weights may be transported.
-/
@[expose] public section

namespace FranklSmallCyclic.TransportBatches.G075.B001.Data

-- Period 8, original row 1893, representative 3057.
def source0 : Weights.Entry :=
  { word := [0, 0, 1, 4, 2, 0, 1], weights := [0, 0, 1, 0] }

def target0 : Weights.Entry :=
  { word := [1, 4, 4, 4, 0, 0, 4], weights := [1, 0, 0, 0] }

def points0 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 2), (3, 5), (4, 4), (5, 3), (6, 6)]

-- Period 8, original row 2381, representative 3057.
def source1 : Weights.Entry :=
  { word := [0, 0, 1, 4, 2, 0, 1], weights := [0, 0, 1, 0] }

def target1 : Weights.Entry :=
  { word := [2, 0, 0, 1, 4, 2, 0], weights := [0, 0, 1, 0] }

def points1 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 7), (3, 4), (4, 6), (5, 5), (6, 3)]

-- Period 8, original row 2383, representative 3057.
def source2 : Weights.Entry :=
  { word := [0, 0, 1, 4, 2, 0, 1], weights := [0, 0, 1, 0] }

def target2 : Weights.Entry :=
  { word := [2, 0, 0, 2, 2, 2, 0], weights := [0, 0, 0, 1] }

def points2 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 7), (3, 4), (4, 5), (5, 6), (6, 3)]

-- Period 8, original row 2404, representative 182.
def source3 : Weights.Entry :=
  { word := [0, 1, 0, 12, 0, 12, 12], weights := [1, 0, 1, 0] }

def target3 : Weights.Entry :=
  { word := [2, 0, 0, 12, 0, 12, 12], weights := [1, 0, 1, 0] }

def points3 : List (ℕ × ℕ) := [(0, 7), (1, 0), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 8, original row 2407, representative 3057.
def source4 : Weights.Entry :=
  { word := [0, 0, 1, 4, 2, 0, 1], weights := [0, 0, 1, 0] }

def target4 : Weights.Entry :=
  { word := [2, 0, 4, 2, 0, 2, 0], weights := [0, 0, 0, 1] }

def points4 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 4), (4, 5), (5, 6), (6, 3)]

-- Period 8, original row 3391, representative 3057.
def source5 : Weights.Entry :=
  { word := [0, 0, 1, 4, 2, 0, 1], weights := [0, 0, 1, 0] }

def target5 : Weights.Entry :=
  { word := [4, 0, 0, 1, 4, 2, 0], weights := [0, 0, 1, 0] }

def points5 : List (ℕ × ℕ) := [(0, 0), (1, 2), (2, 7), (3, 4), (4, 6), (5, 5), (6, 3)]

-- Period 8, original row 3393, representative 3057.
def source6 : Weights.Entry :=
  { word := [0, 0, 1, 4, 2, 0, 1], weights := [0, 0, 1, 0] }

def target6 : Weights.Entry :=
  { word := [4, 0, 0, 2, 2, 2, 0], weights := [0, 0, 0, 1] }

def points6 : List (ℕ × ℕ) := [(0, 0), (1, 2), (2, 7), (3, 4), (4, 5), (5, 6), (6, 3)]

-- Period 8, original row 3415, representative 3057.
def source7 : Weights.Entry :=
  { word := [0, 0, 1, 4, 2, 0, 1], weights := [0, 0, 1, 0] }

def target7 : Weights.Entry :=
  { word := [4, 0, 4, 2, 0, 1, 0], weights := [0, 1, 0, 0] }

def points7 : List (ℕ × ℕ) := [(0, 2), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 8, original row 3437, representative 3057.
def source8 : Weights.Entry :=
  { word := [0, 0, 1, 4, 2, 0, 1], weights := [0, 0, 1, 0] }

def target8 : Weights.Entry :=
  { word := [4, 0, 4, 4, 4, 0, 0], weights := [0, 0, 1, 0] }

def points8 : List (ℕ × ℕ) := [(0, 2), (1, 0), (2, 7), (3, 6), (4, 4), (5, 5), (6, 3)]

-- Period 8, original row 3504, representative 3026.
def source9 : Weights.Entry :=
  { word := [4, 0, 12, 2, 0, 2, 0], weights := [0, 1, 0, 0] }

def target9 : Weights.Entry :=
  { word := [4, 0, 12, 2, 0, 1, 0], weights := [0, 1, 0, 0] }

def points9 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 8, original row 3526, representative 3026.
def source10 : Weights.Entry :=
  { word := [4, 0, 12, 2, 0, 2, 0], weights := [0, 1, 0, 0] }

def target10 : Weights.Entry :=
  { word := [4, 0, 12, 4, 4, 0, 0], weights := [0, 0, 1, 0] }

def points10 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 2), (3, 3), (4, 5), (5, 4), (6, 6)]

-- Period 8, original row 8203, representative 182.
def source11 : Weights.Entry :=
  { word := [0, 1, 0, 12, 0, 12, 12], weights := [1, 0, 1, 0] }

def target11 : Weights.Entry :=
  { word := [10, 10, 0, 10, 0, 0, 4], weights := [0, 1, 0, 1] }

def points11 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 9, original row 0, representative 3057.
def source12 : Weights.Entry :=
  { word := [0, 0, 1, 4, 2, 0, 1], weights := [0, 0, 1, 0] }

def target12 : Weights.Entry :=
  { word := [0, 0, 1, 4, 2, 0, 1], weights := [0, 0, 1, 0] }

def points12 : List (ℕ × ℕ) := [(0, 7), (1, 8), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 9, original row 1, representative 3057.
def source13 : Weights.Entry :=
  { word := [0, 0, 1, 4, 2, 0, 1], weights := [0, 0, 1, 0] }

def target13 : Weights.Entry :=
  { word := [0, 0, 1, 4, 2, 0, 2], weights := [0, 0, 1, 0] }

def points13 : List (ℕ × ℕ) := [(0, 7), (1, 0), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 9, original row 12, representative 3057.
def source14 : Weights.Entry :=
  { word := [0, 0, 1, 4, 2, 0, 1], weights := [0, 0, 1, 0] }

def target14 : Weights.Entry :=
  { word := [0, 0, 1, 4, 4, 4, 0], weights := [0, 0, 0, 1] }

def points14 : List (ℕ × ℕ) := [(0, 7), (1, 8), (2, 2), (3, 3), (4, 4), (5, 6), (6, 5)]

-- Period 9, original row 22, representative 3026.
def source15 : Weights.Entry :=
  { word := [4, 0, 12, 2, 0, 2, 0], weights := [0, 1, 0, 0] }

def target15 : Weights.Entry :=
  { word := [0, 0, 1, 4, 10, 0, 1], weights := [0, 0, 1, 0] }

def points15 : List (ℕ × ℕ) := [(0, 8), (1, 2), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 9, original row 23, representative 3026.
def source16 : Weights.Entry :=
  { word := [4, 0, 12, 2, 0, 2, 0], weights := [0, 1, 0, 0] }

def target16 : Weights.Entry :=
  { word := [0, 0, 1, 4, 10, 0, 2], weights := [0, 0, 1, 0] }

def points16 : List (ℕ × ℕ) := [(0, 0), (1, 2), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 9, original row 34, representative 3026.
def source17 : Weights.Entry :=
  { word := [4, 0, 12, 2, 0, 2, 0], weights := [0, 1, 0, 0] }

def target17 : Weights.Entry :=
  { word := [0, 0, 1, 4, 12, 4, 0], weights := [0, 0, 0, 1] }

def points17 : List (ℕ × ℕ) := [(0, 8), (1, 2), (2, 7), (3, 5), (4, 6), (5, 4), (6, 3)]

-- Period 9, original row 46, representative 3057.
def source18 : Weights.Entry :=
  { word := [0, 0, 1, 4, 2, 0, 1], weights := [0, 0, 1, 0] }

def target18 : Weights.Entry :=
  { word := [0, 0, 2, 2, 2, 0, 1], weights := [0, 1, 0, 0] }

def points18 : List (ℕ × ℕ) := [(0, 7), (1, 8), (2, 2), (3, 3), (4, 5), (5, 4), (6, 6)]

-- Period 9, original row 47, representative 3057.
def source19 : Weights.Entry :=
  { word := [0, 0, 1, 4, 2, 0, 1], weights := [0, 0, 1, 0] }

def target19 : Weights.Entry :=
  { word := [0, 0, 2, 2, 2, 0, 2], weights := [0, 1, 0, 0] }

def points19 : List (ℕ × ℕ) := [(0, 7), (1, 0), (2, 2), (3, 3), (4, 5), (5, 4), (6, 6)]

-- Period 9, original row 61, representative 3026.
def source20 : Weights.Entry :=
  { word := [4, 0, 12, 2, 0, 2, 0], weights := [0, 1, 0, 0] }

def target20 : Weights.Entry :=
  { word := [0, 0, 2, 2, 10, 0, 1], weights := [0, 1, 0, 0] }

def points20 : List (ℕ × ℕ) := [(0, 8), (1, 2), (2, 7), (3, 6), (4, 4), (5, 5), (6, 3)]

-- Period 9, original row 62, representative 3026.
def source21 : Weights.Entry :=
  { word := [4, 0, 12, 2, 0, 2, 0], weights := [0, 1, 0, 0] }

def target21 : Weights.Entry :=
  { word := [0, 0, 2, 2, 10, 0, 2], weights := [0, 1, 0, 0] }

def points21 : List (ℕ × ℕ) := [(0, 0), (1, 2), (2, 7), (3, 6), (4, 4), (5, 5), (6, 3)]

-- Period 9, original row 144, representative 3057.
def source22 : Weights.Entry :=
  { word := [0, 0, 1, 4, 2, 0, 1], weights := [0, 0, 1, 0] }

def target22 : Weights.Entry :=
  { word := [0, 1, 4, 2, 0, 1, 0], weights := [0, 1, 0, 0] }

def points22 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 9, original row 146, representative 3057.
def source23 : Weights.Entry :=
  { word := [0, 0, 1, 4, 2, 0, 1], weights := [0, 0, 1, 0] }

def target23 : Weights.Entry :=
  { word := [0, 1, 4, 2, 0, 2, 0], weights := [0, 1, 0, 0] }

def points23 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 9, original row 166, representative 3057.
def source24 : Weights.Entry :=
  { word := [0, 0, 1, 4, 2, 0, 1], weights := [0, 0, 1, 0] }

def target24 : Weights.Entry :=
  { word := [0, 1, 4, 4, 4, 0, 0], weights := [0, 0, 1, 0] }

def points24 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 7), (3, 6), (4, 4), (5, 5), (6, 3)]

-- Period 9, original row 233, representative 3026.
def source25 : Weights.Entry :=
  { word := [4, 0, 12, 2, 0, 2, 0], weights := [0, 1, 0, 0] }

def target25 : Weights.Entry :=
  { word := [0, 1, 12, 2, 0, 1, 0], weights := [0, 1, 0, 0] }

def points25 : List (ℕ × ℕ) := [(0, 1), (1, 7), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 9, original row 235, representative 3026.
def source26 : Weights.Entry :=
  { word := [4, 0, 12, 2, 0, 2, 0], weights := [0, 1, 0, 0] }

def target26 : Weights.Entry :=
  { word := [0, 1, 12, 2, 0, 2, 0], weights := [0, 1, 0, 0] }

def points26 : List (ℕ × ℕ) := [(0, 1), (1, 8), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 9, original row 255, representative 3026.
def source27 : Weights.Entry :=
  { word := [4, 0, 12, 2, 0, 2, 0], weights := [0, 1, 0, 0] }

def target27 : Weights.Entry :=
  { word := [0, 1, 12, 4, 4, 0, 0], weights := [0, 0, 1, 0] }

def points27 : List (ℕ × ℕ) := [(0, 1), (1, 7), (2, 2), (3, 3), (4, 5), (5, 4), (6, 6)]

-- Period 9, original row 316, representative 3057.
def source28 : Weights.Entry :=
  { word := [0, 0, 1, 4, 2, 0, 1], weights := [0, 0, 1, 0] }

def target28 : Weights.Entry :=
  { word := [0, 2, 2, 2, 0, 1, 0], weights := [1, 0, 0, 0] }

def points28 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 7), (3, 6), (4, 5), (5, 3), (6, 4)]

-- Period 9, original row 318, representative 3057.
def source29 : Weights.Entry :=
  { word := [0, 0, 1, 4, 2, 0, 1], weights := [0, 0, 1, 0] }

def target29 : Weights.Entry :=
  { word := [0, 2, 2, 2, 0, 2, 0], weights := [1, 0, 0, 0] }

def points29 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 8), (3, 6), (4, 5), (5, 3), (6, 4)]

-- Period 9, original row 421, representative 3026.
def source30 : Weights.Entry :=
  { word := [4, 0, 12, 2, 0, 2, 0], weights := [0, 1, 0, 0] }

def target30 : Weights.Entry :=
  { word := [0, 2, 10, 2, 0, 1, 0], weights := [1, 0, 0, 0] }

def points30 : List (ℕ × ℕ) := [(0, 1), (1, 7), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6)]

-- Period 9, original row 423, representative 3026.
def source31 : Weights.Entry :=
  { word := [4, 0, 12, 2, 0, 2, 0], weights := [0, 1, 0, 0] }

def target31 : Weights.Entry :=
  { word := [0, 2, 10, 2, 0, 2, 0], weights := [1, 0, 0, 0] }

def points31 : List (ℕ × ℕ) := [(0, 1), (1, 8), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6)]

-- Period 9, original row 506, representative 3057.
def source32 : Weights.Entry :=
  { word := [0, 0, 1, 4, 2, 0, 1], weights := [0, 0, 1, 0] }

def target32 : Weights.Entry :=
  { word := [0, 4, 0, 4, 2, 0, 1], weights := [0, 0, 1, 0] }

def points32 : List (ℕ × ℕ) := [(0, 7), (1, 8), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 9, original row 507, representative 3057.
def source33 : Weights.Entry :=
  { word := [0, 0, 1, 4, 2, 0, 1], weights := [0, 0, 1, 0] }

def target33 : Weights.Entry :=
  { word := [0, 4, 0, 4, 2, 0, 2], weights := [0, 0, 1, 0] }

def points33 : List (ℕ × ℕ) := [(0, 7), (1, 0), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 9, original row 518, representative 3057.
def source34 : Weights.Entry :=
  { word := [0, 0, 1, 4, 2, 0, 1], weights := [0, 0, 1, 0] }

def target34 : Weights.Entry :=
  { word := [0, 4, 0, 4, 4, 4, 0], weights := [0, 0, 0, 1] }

def points34 : List (ℕ × ℕ) := [(0, 7), (1, 8), (2, 1), (3, 3), (4, 4), (5, 6), (6, 5)]

-- Period 9, original row 528, representative 3026.
def source35 : Weights.Entry :=
  { word := [4, 0, 12, 2, 0, 2, 0], weights := [0, 1, 0, 0] }

def target35 : Weights.Entry :=
  { word := [0, 4, 0, 4, 10, 0, 1], weights := [0, 0, 1, 0] }

def points35 : List (ℕ × ℕ) := [(0, 8), (1, 1), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 9, original row 529, representative 3026.
def source36 : Weights.Entry :=
  { word := [4, 0, 12, 2, 0, 2, 0], weights := [0, 1, 0, 0] }

def target36 : Weights.Entry :=
  { word := [0, 4, 0, 4, 10, 0, 2], weights := [0, 0, 1, 0] }

def points36 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 9, original row 540, representative 3026.
def source37 : Weights.Entry :=
  { word := [4, 0, 12, 2, 0, 2, 0], weights := [0, 1, 0, 0] }

def target37 : Weights.Entry :=
  { word := [0, 4, 0, 4, 12, 4, 0], weights := [0, 0, 0, 1] }

def points37 : List (ℕ × ℕ) := [(0, 8), (1, 1), (2, 7), (3, 5), (4, 6), (5, 4), (6, 3)]

-- Period 9, original row 1737, representative 3057.
def source38 : Weights.Entry :=
  { word := [0, 0, 1, 4, 2, 0, 1], weights := [0, 0, 1, 0] }

def target38 : Weights.Entry :=
  { word := [1, 0, 1, 4, 2, 0, 1], weights := [0, 0, 1, 0] }

def points38 : List (ℕ × ℕ) := [(0, 7), (1, 8), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 9, original row 1738, representative 3057.
def source39 : Weights.Entry :=
  { word := [0, 0, 1, 4, 2, 0, 1], weights := [0, 0, 1, 0] }

def target39 : Weights.Entry :=
  { word := [1, 0, 1, 4, 2, 0, 2], weights := [0, 0, 1, 0] }

def points39 : List (ℕ × ℕ) := [(0, 7), (1, 0), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 9, original row 1749, representative 3057.
def source40 : Weights.Entry :=
  { word := [0, 0, 1, 4, 2, 0, 1], weights := [0, 0, 1, 0] }

def target40 : Weights.Entry :=
  { word := [1, 0, 1, 4, 4, 4, 0], weights := [0, 0, 0, 1] }

def points40 : List (ℕ × ℕ) := [(0, 7), (1, 8), (2, 2), (3, 3), (4, 4), (5, 6), (6, 5)]

-- Period 9, original row 1759, representative 3026.
def source41 : Weights.Entry :=
  { word := [4, 0, 12, 2, 0, 2, 0], weights := [0, 1, 0, 0] }

def target41 : Weights.Entry :=
  { word := [1, 0, 1, 4, 10, 0, 1], weights := [0, 0, 1, 0] }

def points41 : List (ℕ × ℕ) := [(0, 8), (1, 2), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 9, original row 1760, representative 3026.
def source42 : Weights.Entry :=
  { word := [4, 0, 12, 2, 0, 2, 0], weights := [0, 1, 0, 0] }

def target42 : Weights.Entry :=
  { word := [1, 0, 1, 4, 10, 0, 2], weights := [0, 0, 1, 0] }

def points42 : List (ℕ × ℕ) := [(0, 0), (1, 2), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 9, original row 1771, representative 3026.
def source43 : Weights.Entry :=
  { word := [4, 0, 12, 2, 0, 2, 0], weights := [0, 1, 0, 0] }

def target43 : Weights.Entry :=
  { word := [1, 0, 1, 4, 12, 4, 0], weights := [0, 0, 0, 1] }

def points43 : List (ℕ × ℕ) := [(0, 8), (1, 2), (2, 7), (3, 5), (4, 6), (5, 4), (6, 3)]

-- Period 9, original row 1783, representative 3057.
def source44 : Weights.Entry :=
  { word := [0, 0, 1, 4, 2, 0, 1], weights := [0, 0, 1, 0] }

def target44 : Weights.Entry :=
  { word := [1, 0, 2, 2, 2, 0, 1], weights := [0, 1, 0, 0] }

def points44 : List (ℕ × ℕ) := [(0, 7), (1, 8), (2, 2), (3, 3), (4, 5), (5, 4), (6, 6)]

-- Period 9, original row 1784, representative 3057.
def source45 : Weights.Entry :=
  { word := [0, 0, 1, 4, 2, 0, 1], weights := [0, 0, 1, 0] }

def target45 : Weights.Entry :=
  { word := [1, 0, 2, 2, 2, 0, 2], weights := [0, 1, 0, 0] }

def points45 : List (ℕ × ℕ) := [(0, 7), (1, 0), (2, 2), (3, 3), (4, 5), (5, 4), (6, 6)]

-- Period 9, original row 1798, representative 3026.
def source46 : Weights.Entry :=
  { word := [4, 0, 12, 2, 0, 2, 0], weights := [0, 1, 0, 0] }

def target46 : Weights.Entry :=
  { word := [1, 0, 2, 2, 10, 0, 1], weights := [0, 1, 0, 0] }

def points46 : List (ℕ × ℕ) := [(0, 8), (1, 2), (2, 7), (3, 6), (4, 4), (5, 5), (6, 3)]

-- Period 9, original row 1799, representative 3026.
def source47 : Weights.Entry :=
  { word := [4, 0, 12, 2, 0, 2, 0], weights := [0, 1, 0, 0] }

def target47 : Weights.Entry :=
  { word := [1, 0, 2, 2, 10, 0, 2], weights := [0, 1, 0, 0] }

def points47 : List (ℕ × ℕ) := [(0, 0), (1, 2), (2, 7), (3, 6), (4, 4), (5, 5), (6, 3)]

-- Period 9, original row 3415, representative 3057.
def source48 : Weights.Entry :=
  { word := [0, 0, 1, 4, 2, 0, 1], weights := [0, 0, 1, 0] }

def target48 : Weights.Entry :=
  { word := [4, 0, 4, 2, 0, 1, 0], weights := [0, 1, 0, 0] }

def points48 : List (ℕ × ℕ) := [(0, 2), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 9, original row 3417, representative 3057.
def source49 : Weights.Entry :=
  { word := [0, 0, 1, 4, 2, 0, 1], weights := [0, 0, 1, 0] }

def target49 : Weights.Entry :=
  { word := [4, 0, 4, 2, 0, 2, 0], weights := [0, 1, 0, 0] }

def points49 : List (ℕ × ℕ) := [(0, 2), (1, 0), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 9, original row 3437, representative 3057.
def source50 : Weights.Entry :=
  { word := [0, 0, 1, 4, 2, 0, 1], weights := [0, 0, 1, 0] }

def target50 : Weights.Entry :=
  { word := [4, 0, 4, 4, 4, 0, 0], weights := [0, 0, 1, 0] }

def points50 : List (ℕ × ℕ) := [(0, 2), (1, 0), (2, 7), (3, 6), (4, 4), (5, 5), (6, 3)]

-- Period 9, original row 3504, representative 3026.
def source51 : Weights.Entry :=
  { word := [4, 0, 12, 2, 0, 2, 0], weights := [0, 1, 0, 0] }

def target51 : Weights.Entry :=
  { word := [4, 0, 12, 2, 0, 1, 0], weights := [0, 1, 0, 0] }

def points51 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 9, original row 3506, representative 3026.
def source52 : Weights.Entry :=
  { word := [4, 0, 12, 2, 0, 2, 0], weights := [0, 1, 0, 0] }

def target52 : Weights.Entry :=
  { word := [4, 0, 12, 2, 0, 2, 0], weights := [0, 1, 0, 0] }

def points52 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 9, original row 3526, representative 3026.
def source53 : Weights.Entry :=
  { word := [4, 0, 12, 2, 0, 2, 0], weights := [0, 1, 0, 0] }

def target53 : Weights.Entry :=
  { word := [4, 0, 12, 4, 4, 0, 0], weights := [0, 0, 1, 0] }

def points53 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 2), (3, 3), (4, 5), (5, 4), (6, 6)]

-- Period 10, original row 0, representative 3057.
def source54 : Weights.Entry :=
  { word := [0, 0, 1, 4, 2, 0, 1], weights := [0, 0, 1, 0] }

def target54 : Weights.Entry :=
  { word := [0, 0, 1, 4, 2, 0, 1], weights := [0, 0, 1, 0] }

def points54 : List (ℕ × ℕ) := [(0, 7), (1, 8), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 10, original row 1, representative 3057.
def source55 : Weights.Entry :=
  { word := [0, 0, 1, 4, 2, 0, 1], weights := [0, 0, 1, 0] }

def target55 : Weights.Entry :=
  { word := [0, 0, 1, 4, 2, 0, 2], weights := [0, 0, 1, 0] }

def points55 : List (ℕ × ℕ) := [(0, 7), (1, 9), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 10, original row 12, representative 3057.
def source56 : Weights.Entry :=
  { word := [0, 0, 1, 4, 2, 0, 1], weights := [0, 0, 1, 0] }

def target56 : Weights.Entry :=
  { word := [0, 0, 1, 4, 4, 4, 0], weights := [0, 0, 0, 1] }

def points56 : List (ℕ × ℕ) := [(0, 7), (1, 8), (2, 2), (3, 3), (4, 4), (5, 6), (6, 5)]

-- Period 10, original row 22, representative 3026.
def source57 : Weights.Entry :=
  { word := [4, 0, 12, 2, 0, 2, 0], weights := [0, 1, 0, 0] }

def target57 : Weights.Entry :=
  { word := [0, 0, 1, 4, 10, 0, 1], weights := [0, 0, 1, 0] }

def points57 : List (ℕ × ℕ) := [(0, 8), (1, 2), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 10, original row 23, representative 3026.
def source58 : Weights.Entry :=
  { word := [4, 0, 12, 2, 0, 2, 0], weights := [0, 1, 0, 0] }

def target58 : Weights.Entry :=
  { word := [0, 0, 1, 4, 10, 0, 2], weights := [0, 0, 1, 0] }

def points58 : List (ℕ × ℕ) := [(0, 9), (1, 2), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 10, original row 34, representative 3026.
def source59 : Weights.Entry :=
  { word := [4, 0, 12, 2, 0, 2, 0], weights := [0, 1, 0, 0] }

def target59 : Weights.Entry :=
  { word := [0, 0, 1, 4, 12, 4, 0], weights := [0, 0, 0, 1] }

def points59 : List (ℕ × ℕ) := [(0, 8), (1, 2), (2, 7), (3, 5), (4, 6), (5, 4), (6, 3)]

-- Period 10, original row 46, representative 3057.
def source60 : Weights.Entry :=
  { word := [0, 0, 1, 4, 2, 0, 1], weights := [0, 0, 1, 0] }

def target60 : Weights.Entry :=
  { word := [0, 0, 2, 2, 2, 0, 1], weights := [0, 1, 0, 0] }

def points60 : List (ℕ × ℕ) := [(0, 7), (1, 8), (2, 2), (3, 3), (4, 5), (5, 4), (6, 6)]

-- Period 10, original row 47, representative 3057.
def source61 : Weights.Entry :=
  { word := [0, 0, 1, 4, 2, 0, 1], weights := [0, 0, 1, 0] }

def target61 : Weights.Entry :=
  { word := [0, 0, 2, 2, 2, 0, 2], weights := [0, 1, 0, 0] }

def points61 : List (ℕ × ℕ) := [(0, 7), (1, 9), (2, 2), (3, 3), (4, 5), (5, 4), (6, 6)]

-- Period 10, original row 61, representative 3026.
def source62 : Weights.Entry :=
  { word := [4, 0, 12, 2, 0, 2, 0], weights := [0, 1, 0, 0] }

def target62 : Weights.Entry :=
  { word := [0, 0, 2, 2, 10, 0, 1], weights := [0, 1, 0, 0] }

def points62 : List (ℕ × ℕ) := [(0, 8), (1, 2), (2, 7), (3, 6), (4, 4), (5, 5), (6, 3)]

-- Period 10, original row 62, representative 3026.
def source63 : Weights.Entry :=
  { word := [4, 0, 12, 2, 0, 2, 0], weights := [0, 1, 0, 0] }

def target63 : Weights.Entry :=
  { word := [0, 0, 2, 2, 10, 0, 2], weights := [0, 1, 0, 0] }

def points63 : List (ℕ × ℕ) := [(0, 9), (1, 2), (2, 7), (3, 6), (4, 4), (5, 5), (6, 3)]

-- Period 10, original row 144, representative 3057.
def source64 : Weights.Entry :=
  { word := [0, 0, 1, 4, 2, 0, 1], weights := [0, 0, 1, 0] }

def target64 : Weights.Entry :=
  { word := [0, 1, 4, 2, 0, 1, 0], weights := [0, 1, 0, 0] }

def points64 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 10, original row 146, representative 3057.
def source65 : Weights.Entry :=
  { word := [0, 0, 1, 4, 2, 0, 1], weights := [0, 0, 1, 0] }

def target65 : Weights.Entry :=
  { word := [0, 1, 4, 2, 0, 2, 0], weights := [0, 1, 0, 0] }

def points65 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 10, original row 166, representative 3057.
def source66 : Weights.Entry :=
  { word := [0, 0, 1, 4, 2, 0, 1], weights := [0, 0, 1, 0] }

def target66 : Weights.Entry :=
  { word := [0, 1, 4, 4, 4, 0, 0], weights := [0, 0, 1, 0] }

def points66 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 7), (3, 6), (4, 4), (5, 5), (6, 3)]

-- Period 10, original row 233, representative 3026.
def source67 : Weights.Entry :=
  { word := [4, 0, 12, 2, 0, 2, 0], weights := [0, 1, 0, 0] }

def target67 : Weights.Entry :=
  { word := [0, 1, 12, 2, 0, 1, 0], weights := [0, 1, 0, 0] }

def points67 : List (ℕ × ℕ) := [(0, 1), (1, 7), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 10, original row 235, representative 3026.
def source68 : Weights.Entry :=
  { word := [4, 0, 12, 2, 0, 2, 0], weights := [0, 1, 0, 0] }

def target68 : Weights.Entry :=
  { word := [0, 1, 12, 2, 0, 2, 0], weights := [0, 1, 0, 0] }

def points68 : List (ℕ × ℕ) := [(0, 1), (1, 8), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 10, original row 255, representative 3026.
def source69 : Weights.Entry :=
  { word := [4, 0, 12, 2, 0, 2, 0], weights := [0, 1, 0, 0] }

def target69 : Weights.Entry :=
  { word := [0, 1, 12, 4, 4, 0, 0], weights := [0, 0, 1, 0] }

def points69 : List (ℕ × ℕ) := [(0, 1), (1, 7), (2, 2), (3, 3), (4, 5), (5, 4), (6, 6)]

-- Period 10, original row 316, representative 3057.
def source70 : Weights.Entry :=
  { word := [0, 0, 1, 4, 2, 0, 1], weights := [0, 0, 1, 0] }

def target70 : Weights.Entry :=
  { word := [0, 2, 2, 2, 0, 1, 0], weights := [1, 0, 0, 0] }

def points70 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 7), (3, 6), (4, 5), (5, 3), (6, 4)]

-- Period 10, original row 318, representative 3057.
def source71 : Weights.Entry :=
  { word := [0, 0, 1, 4, 2, 0, 1], weights := [0, 0, 1, 0] }

def target71 : Weights.Entry :=
  { word := [0, 2, 2, 2, 0, 2, 0], weights := [1, 0, 0, 0] }

def points71 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 8), (3, 6), (4, 5), (5, 3), (6, 4)]

-- Period 10, original row 421, representative 3026.
def source72 : Weights.Entry :=
  { word := [4, 0, 12, 2, 0, 2, 0], weights := [0, 1, 0, 0] }

def target72 : Weights.Entry :=
  { word := [0, 2, 10, 2, 0, 1, 0], weights := [1, 0, 0, 0] }

def points72 : List (ℕ × ℕ) := [(0, 1), (1, 7), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6)]

-- Period 10, original row 423, representative 3026.
def source73 : Weights.Entry :=
  { word := [4, 0, 12, 2, 0, 2, 0], weights := [0, 1, 0, 0] }

def target73 : Weights.Entry :=
  { word := [0, 2, 10, 2, 0, 2, 0], weights := [1, 0, 0, 0] }

def points73 : List (ℕ × ℕ) := [(0, 1), (1, 8), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6)]

-- Period 10, original row 506, representative 3057.
def source74 : Weights.Entry :=
  { word := [0, 0, 1, 4, 2, 0, 1], weights := [0, 0, 1, 0] }

def target74 : Weights.Entry :=
  { word := [0, 4, 0, 4, 2, 0, 1], weights := [0, 0, 1, 0] }

def points74 : List (ℕ × ℕ) := [(0, 7), (1, 8), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 10, original row 507, representative 3057.
def source75 : Weights.Entry :=
  { word := [0, 0, 1, 4, 2, 0, 1], weights := [0, 0, 1, 0] }

def target75 : Weights.Entry :=
  { word := [0, 4, 0, 4, 2, 0, 2], weights := [0, 0, 1, 0] }

def points75 : List (ℕ × ℕ) := [(0, 7), (1, 9), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 10, original row 518, representative 3057.
def source76 : Weights.Entry :=
  { word := [0, 0, 1, 4, 2, 0, 1], weights := [0, 0, 1, 0] }

def target76 : Weights.Entry :=
  { word := [0, 4, 0, 4, 4, 4, 0], weights := [0, 0, 0, 1] }

def points76 : List (ℕ × ℕ) := [(0, 7), (1, 8), (2, 1), (3, 3), (4, 4), (5, 6), (6, 5)]

-- Period 10, original row 528, representative 3026.
def source77 : Weights.Entry :=
  { word := [4, 0, 12, 2, 0, 2, 0], weights := [0, 1, 0, 0] }

def target77 : Weights.Entry :=
  { word := [0, 4, 0, 4, 10, 0, 1], weights := [0, 0, 1, 0] }

def points77 : List (ℕ × ℕ) := [(0, 8), (1, 1), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 10, original row 529, representative 3026.
def source78 : Weights.Entry :=
  { word := [4, 0, 12, 2, 0, 2, 0], weights := [0, 1, 0, 0] }

def target78 : Weights.Entry :=
  { word := [0, 4, 0, 4, 10, 0, 2], weights := [0, 0, 1, 0] }

def points78 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 10, original row 540, representative 3026.
def source79 : Weights.Entry :=
  { word := [4, 0, 12, 2, 0, 2, 0], weights := [0, 1, 0, 0] }

def target79 : Weights.Entry :=
  { word := [0, 4, 0, 4, 12, 4, 0], weights := [0, 0, 0, 1] }

def points79 : List (ℕ × ℕ) := [(0, 8), (1, 1), (2, 7), (3, 5), (4, 6), (5, 4), (6, 3)]

-- Period 10, original row 1737, representative 3057.
def source80 : Weights.Entry :=
  { word := [0, 0, 1, 4, 2, 0, 1], weights := [0, 0, 1, 0] }

def target80 : Weights.Entry :=
  { word := [1, 0, 1, 4, 2, 0, 1], weights := [0, 0, 1, 0] }

def points80 : List (ℕ × ℕ) := [(0, 7), (1, 8), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 10, original row 1738, representative 3057.
def source81 : Weights.Entry :=
  { word := [0, 0, 1, 4, 2, 0, 1], weights := [0, 0, 1, 0] }

def target81 : Weights.Entry :=
  { word := [1, 0, 1, 4, 2, 0, 2], weights := [0, 0, 1, 0] }

def points81 : List (ℕ × ℕ) := [(0, 7), (1, 9), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 10, original row 1749, representative 3057.
def source82 : Weights.Entry :=
  { word := [0, 0, 1, 4, 2, 0, 1], weights := [0, 0, 1, 0] }

def target82 : Weights.Entry :=
  { word := [1, 0, 1, 4, 4, 4, 0], weights := [0, 0, 0, 1] }

def points82 : List (ℕ × ℕ) := [(0, 7), (1, 8), (2, 2), (3, 3), (4, 4), (5, 6), (6, 5)]

-- Period 10, original row 1759, representative 3026.
def source83 : Weights.Entry :=
  { word := [4, 0, 12, 2, 0, 2, 0], weights := [0, 1, 0, 0] }

def target83 : Weights.Entry :=
  { word := [1, 0, 1, 4, 10, 0, 1], weights := [0, 0, 1, 0] }

def points83 : List (ℕ × ℕ) := [(0, 8), (1, 2), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 10, original row 1760, representative 3026.
def source84 : Weights.Entry :=
  { word := [4, 0, 12, 2, 0, 2, 0], weights := [0, 1, 0, 0] }

def target84 : Weights.Entry :=
  { word := [1, 0, 1, 4, 10, 0, 2], weights := [0, 0, 1, 0] }

def points84 : List (ℕ × ℕ) := [(0, 9), (1, 2), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 10, original row 1771, representative 3026.
def source85 : Weights.Entry :=
  { word := [4, 0, 12, 2, 0, 2, 0], weights := [0, 1, 0, 0] }

def target85 : Weights.Entry :=
  { word := [1, 0, 1, 4, 12, 4, 0], weights := [0, 0, 0, 1] }

def points85 : List (ℕ × ℕ) := [(0, 8), (1, 2), (2, 7), (3, 5), (4, 6), (5, 4), (6, 3)]

-- Period 10, original row 1783, representative 3057.
def source86 : Weights.Entry :=
  { word := [0, 0, 1, 4, 2, 0, 1], weights := [0, 0, 1, 0] }

def target86 : Weights.Entry :=
  { word := [1, 0, 2, 2, 2, 0, 1], weights := [0, 1, 0, 0] }

def points86 : List (ℕ × ℕ) := [(0, 7), (1, 8), (2, 2), (3, 3), (4, 5), (5, 4), (6, 6)]

-- Period 10, original row 1784, representative 3057.
def source87 : Weights.Entry :=
  { word := [0, 0, 1, 4, 2, 0, 1], weights := [0, 0, 1, 0] }

def target87 : Weights.Entry :=
  { word := [1, 0, 2, 2, 2, 0, 2], weights := [0, 1, 0, 0] }

def points87 : List (ℕ × ℕ) := [(0, 7), (1, 9), (2, 2), (3, 3), (4, 5), (5, 4), (6, 6)]

-- Period 10, original row 1798, representative 3026.
def source88 : Weights.Entry :=
  { word := [4, 0, 12, 2, 0, 2, 0], weights := [0, 1, 0, 0] }

def target88 : Weights.Entry :=
  { word := [1, 0, 2, 2, 10, 0, 1], weights := [0, 1, 0, 0] }

def points88 : List (ℕ × ℕ) := [(0, 8), (1, 2), (2, 7), (3, 6), (4, 4), (5, 5), (6, 3)]

-- Period 10, original row 1799, representative 3026.
def source89 : Weights.Entry :=
  { word := [4, 0, 12, 2, 0, 2, 0], weights := [0, 1, 0, 0] }

def target89 : Weights.Entry :=
  { word := [1, 0, 2, 2, 10, 0, 2], weights := [0, 1, 0, 0] }

def points89 : List (ℕ × ℕ) := [(0, 9), (1, 2), (2, 7), (3, 6), (4, 4), (5, 5), (6, 3)]

-- Period 10, original row 3415, representative 3057.
def source90 : Weights.Entry :=
  { word := [0, 0, 1, 4, 2, 0, 1], weights := [0, 0, 1, 0] }

def target90 : Weights.Entry :=
  { word := [4, 0, 4, 2, 0, 1, 0], weights := [0, 1, 0, 0] }

def points90 : List (ℕ × ℕ) := [(0, 2), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 10, original row 3417, representative 3057.
def source91 : Weights.Entry :=
  { word := [0, 0, 1, 4, 2, 0, 1], weights := [0, 0, 1, 0] }

def target91 : Weights.Entry :=
  { word := [4, 0, 4, 2, 0, 2, 0], weights := [0, 1, 0, 0] }

def points91 : List (ℕ × ℕ) := [(0, 2), (1, 0), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 10, original row 3437, representative 3057.
def source92 : Weights.Entry :=
  { word := [0, 0, 1, 4, 2, 0, 1], weights := [0, 0, 1, 0] }

def target92 : Weights.Entry :=
  { word := [4, 0, 4, 4, 4, 0, 0], weights := [0, 0, 1, 0] }

def points92 : List (ℕ × ℕ) := [(0, 2), (1, 0), (2, 7), (3, 6), (4, 4), (5, 5), (6, 3)]

-- Period 10, original row 3504, representative 3026.
def source93 : Weights.Entry :=
  { word := [4, 0, 12, 2, 0, 2, 0], weights := [0, 1, 0, 0] }

def target93 : Weights.Entry :=
  { word := [4, 0, 12, 2, 0, 1, 0], weights := [0, 1, 0, 0] }

def points93 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 10, original row 3506, representative 3026.
def source94 : Weights.Entry :=
  { word := [4, 0, 12, 2, 0, 2, 0], weights := [0, 1, 0, 0] }

def target94 : Weights.Entry :=
  { word := [4, 0, 12, 2, 0, 2, 0], weights := [0, 1, 0, 0] }

def points94 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 10, original row 3526, representative 3026.
def source95 : Weights.Entry :=
  { word := [4, 0, 12, 2, 0, 2, 0], weights := [0, 1, 0, 0] }

def target95 : Weights.Entry :=
  { word := [4, 0, 12, 4, 4, 0, 0], weights := [0, 0, 1, 0] }

def points95 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 2), (3, 3), (4, 5), (5, 4), (6, 6)]

def period8Entries : List Weights.Entry := [target0, target1, target2, target3, target4, target5, target6, target7, target8, target9, target10, target11]

def period8Chunk : RowCoverage.Chunk where
  rows := [⟨1893, target0⟩, ⟨2381, target1⟩, ⟨2383, target2⟩, ⟨2404, target3⟩, ⟨2407, target4⟩, ⟨3391, target5⟩, ⟨3393, target6⟩, ⟨3415, target7⟩, ⟨3437, target8⟩, ⟨3504, target9⟩, ⟨3526, target10⟩, ⟨8203, target11⟩]
  indexMask := 2233852181748563823540191733214787302294045003768284554100393546116549287626996316602909152307613669834664533598529587759329015439722872962275286558878832228513600100028811242575072922067042724167059152104635675026988823639263896699128403054391063144484659717193318230425620643020854345393768254049906444190413827338640334139209738879722618910407528520281192951488366425605670289980096692337904672142028688192876185888388916461784924685186057375771292658822832224752450319242879478029348367399249713615597043143541304049817656581904476582915671575963536791897082384137592528357478393653168374816061542636669484014576671420632573883657312323146386443736736625093969859224363291924995330886689112075115772796920440671624081779071808297596242749205994362537732972886850550519794712307213025219358959660694767102891255746267148827877545383353155905672345881151543341692779652936246802760746758767887177829098636810078141077468076410395499282002477974401061943250462599316921572516730246814636728303536976369134408906992488572019678748172932152548070724870929138936131570970666759245159516849745747341792120741204613263538613320643083612798984459725815469073116036411041661085861844071585613758274258493552508152957113949890914210029512555478789176808570896802034808688649784829394456276610069491385511652554039729369006711513919368849796534349555151297498109394132282606180057446036301892578178632343602690906966661058599142075264749961078823983779174136896974365254923734775561074723863678945797582260384018496421094480848959882867049990552446978660047372637465059159557396341139353823939346642194531973919608132120171418892540138836558841941060303968008979319598939178773652796519595110454407420453640788778045094683937883630670622835065015240923406509092585891881038227556776249327967038014526214190589986949157491326045350100294397366314010757804496019144633946786710752015824552132508309895647674338875232746005173530659739882451928287719115095754757349487027878905463689060678254690846424981916893346605275454541254926600320246125991021581683301865396198542172211505308759572211881284009323130274768597104148046357412332924072011360820444396848990210356427884109168629767837157923202022286824496756243592061710159548979796105545520194933510719720309622160578261774546110037484462296904072082878892442503265507231319980622352338908569633638909788389835246585448828224922692419239045720786641625278980461428968382138038834967163081747111979622326351537880618560141656064
  count := 12

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

def period9Entries : List Weights.Entry := [target12, target13, target14, target15, target16, target17, target18, target19, target20, target21, target22, target23, target24, target25, target26, target27, target28, target29, target30, target31, target32, target33, target34, target35, target36, target37, target38, target39, target40, target41, target42, target43, target44, target45, target46, target47, target48, target49, target50, target51, target52, target53]

def period9Chunk : RowCoverage.Chunk where
  rows := [⟨0, target12⟩, ⟨1, target13⟩, ⟨12, target14⟩, ⟨22, target15⟩, ⟨23, target16⟩, ⟨34, target17⟩, ⟨46, target18⟩, ⟨47, target19⟩, ⟨61, target20⟩, ⟨62, target21⟩, ⟨144, target22⟩, ⟨146, target23⟩, ⟨166, target24⟩, ⟨233, target25⟩, ⟨235, target26⟩, ⟨255, target27⟩, ⟨316, target28⟩, ⟨318, target29⟩, ⟨421, target30⟩, ⟨423, target31⟩, ⟨506, target32⟩, ⟨507, target33⟩, ⟨518, target34⟩, ⟨528, target35⟩, ⟨529, target36⟩, ⟨540, target37⟩, ⟨1737, target38⟩, ⟨1738, target39⟩, ⟨1749, target40⟩, ⟨1759, target41⟩, ⟨1760, target42⟩, ⟨1771, target43⟩, ⟨1783, target44⟩, ⟨1784, target45⟩, ⟨1798, target46⟩, ⟨1799, target47⟩, ⟨3415, target48⟩, ⟨3417, target49⟩, ⟨3437, target50⟩, ⟨3504, target51⟩, ⟨3506, target52⟩, ⟨3526, target53⟩]
  indexMask := 270249705223797389454296882968604716944740551573904942369020079353608298388929591228509138096668780663159987214996594701045746437513970194805114888012889476528559333299114037133510712864081442371337037013495334561305459884080570648655493179573678617802163208465225002462700000774821526755514873739866343530945871059713072655877937115537447118591395764558416249730642641373448405175556333159742671987339515877972803235979888447448246117266526485906819255087781181808296619198213442117659835683255383295296020774074911202792829117079380167422858788357137660828010285322316855576930722702313731052600072759950846818599670662952784937433575182931029178899273034185105644595463736773425743714575775720824366963439071572950725769688636442471691285633010046191296572327561458279403339390081787109433304359120584768817731348648860331040339427444017795637256242973677361829527351604065798290521270823855248739334255629872604866512274570489940140349488262244181656421397455878091138783474807804864156163628938555941503589320250867943019867635971883712344769375594388393987
  count := 42

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

def period10Entries : List Weights.Entry := [target54, target55, target56, target57, target58, target59, target60, target61, target62, target63, target64, target65, target66, target67, target68, target69, target70, target71, target72, target73, target74, target75, target76, target77, target78, target79, target80, target81, target82, target83, target84, target85, target86, target87, target88, target89, target90, target91, target92, target93, target94, target95]

def period10Chunk : RowCoverage.Chunk where
  rows := [⟨0, target54⟩, ⟨1, target55⟩, ⟨12, target56⟩, ⟨22, target57⟩, ⟨23, target58⟩, ⟨34, target59⟩, ⟨46, target60⟩, ⟨47, target61⟩, ⟨61, target62⟩, ⟨62, target63⟩, ⟨144, target64⟩, ⟨146, target65⟩, ⟨166, target66⟩, ⟨233, target67⟩, ⟨235, target68⟩, ⟨255, target69⟩, ⟨316, target70⟩, ⟨318, target71⟩, ⟨421, target72⟩, ⟨423, target73⟩, ⟨506, target74⟩, ⟨507, target75⟩, ⟨518, target76⟩, ⟨528, target77⟩, ⟨529, target78⟩, ⟨540, target79⟩, ⟨1737, target80⟩, ⟨1738, target81⟩, ⟨1749, target82⟩, ⟨1759, target83⟩, ⟨1760, target84⟩, ⟨1771, target85⟩, ⟨1783, target86⟩, ⟨1784, target87⟩, ⟨1798, target88⟩, ⟨1799, target89⟩, ⟨3415, target90⟩, ⟨3417, target91⟩, ⟨3437, target92⟩, ⟨3504, target93⟩, ⟨3506, target94⟩, ⟨3526, target95⟩]
  indexMask := 270249705223797389454296882968604716944740551573904942369020079353608298388929591228509138096668780663159987214996594701045746437513970194805114888012889476528559333299114037133510712864081442371337037013495334561305459884080570648655493179573678617802163208465225002462700000774821526755514873739866343530945871059713072655877937115537447118591395764558416249730642641373448405175556333159742671987339515877972803235979888447448246117266526485906819255087781181808296619198213442117659835683255383295296020774074911202792829117079380167422858788357137660828010285322316855576930722702313731052600072759950846818599670662952784937433575182931029178899273034185105644595463736773425743714575775720824366963439071572950725769688636442471691285633010046191296572327561458279403339390081787109433304359120584768817731348648860331040339427444017795637256242973677361829527351604065798290521270823855248739334255629872604866512274570489940140349488262244181656421397455878091138783474807804864156163628938555941503589320250867943019867635971883712344769375594388393987
  count := 42

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

end FranklSmallCyclic.TransportBatches.G075.B001.Data
