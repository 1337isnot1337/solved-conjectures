module

public import Conjectures.FranklSmallCyclicRowCoverage
public import Conjectures.FranklSmallCyclicCanonicalWords
public import Conjectures.FranklSmallCyclicWeightsPilotData

/-! 106 literal targets sharing one source proof block.
Original words and row indices are retained; weights may be transported.
-/
@[expose] public section

namespace FranklSmallCyclic.TransportBatches.G077.B000.Data

-- Period 8, original row 121, representative 6482.
def source0 : Weights.Entry :=
  { word := [0, 12, 2, 0, 1, 0, 4], weights := [0, 1, 0, 1] }

def target0 : Weights.Entry :=
  { word := [0, 1, 0, 1, 4, 10, 0], weights := [1, 0, 1, 0] }

def points0 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (8, 2)]

-- Period 8, original row 124, representative 6482.
def source1 : Weights.Entry :=
  { word := [0, 12, 2, 0, 1, 0, 4], weights := [0, 1, 0, 1] }

def target1 : Weights.Entry :=
  { word := [0, 1, 0, 2, 2, 10, 0], weights := [1, 0, 0, 1] }

def points1 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 5), (4, 6), (5, 4), (6, 3), (8, 2)]

-- Period 8, original row 176, representative 5771.
def source2 : Weights.Entry :=
  { word := [4, 0, 4, 10, 0, 4, 8], weights := [1, 0, 2, 1] }

def target2 : Weights.Entry :=
  { word := [0, 1, 4, 10, 0, 4, 8], weights := [1, 0, 2, 1] }

def points2 : List (ℕ × ℕ) := [(0, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 0), (8, 7)]

-- Period 8, original row 368, representative 5771.
def source3 : Weights.Entry :=
  { word := [4, 0, 4, 10, 0, 4, 8], weights := [1, 0, 2, 1] }

def target3 : Weights.Entry :=
  { word := [0, 2, 2, 10, 0, 4, 8], weights := [0, 1, 2, 1] }

def points3 : List (ℕ × ℕ) := [(0, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6), (7, 0), (8, 7)]

-- Period 8, original row 1551, representative 6482.
def source4 : Weights.Entry :=
  { word := [0, 12, 2, 0, 1, 0, 4], weights := [0, 1, 0, 1] }

def target4 : Weights.Entry :=
  { word := [0, 12, 2, 0, 1, 0, 1], weights := [0, 1, 0, 1] }

def points4 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (8, 7)]

-- Period 8, original row 1601, representative 6482.
def source5 : Weights.Entry :=
  { word := [0, 12, 2, 0, 1, 0, 4], weights := [0, 1, 0, 1] }

def target5 : Weights.Entry :=
  { word := [0, 12, 4, 4, 0, 0, 1], weights := [1, 0, 0, 1] }

def points5 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6), (8, 7)]

-- Period 8, original row 2200, representative 6482.
def source6 : Weights.Entry :=
  { word := [0, 12, 2, 0, 1, 0, 4], weights := [0, 1, 0, 1] }

def target6 : Weights.Entry :=
  { word := [1, 12, 2, 0, 1, 0, 1], weights := [0, 1, 0, 1] }

def points6 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (8, 7)]

-- Period 8, original row 2250, representative 6482.
def source7 : Weights.Entry :=
  { word := [0, 12, 2, 0, 1, 0, 4], weights := [0, 1, 0, 1] }

def target7 : Weights.Entry :=
  { word := [1, 12, 4, 4, 0, 0, 1], weights := [1, 0, 0, 1] }

def points7 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6), (8, 7)]

-- Period 8, original row 4743, representative 5771.
def source8 : Weights.Entry :=
  { word := [4, 0, 4, 10, 0, 4, 8], weights := [1, 0, 2, 1] }

def target8 : Weights.Entry :=
  { word := [8, 2, 0, 12, 2, 0, 1], weights := [1, 2, 0, 1] }

def points8 : List (ℕ × ℕ) := [(0, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2)]

-- Period 8, original row 4748, representative 5771.
def source9 : Weights.Entry :=
  { word := [4, 0, 4, 10, 0, 4, 8], weights := [1, 0, 2, 1] }

def target9 : Weights.Entry :=
  { word := [8, 2, 0, 12, 4, 4, 0], weights := [1, 2, 1, 0] }

def points9 : List (ℕ × ℕ) := [(0, 0), (2, 7), (3, 5), (4, 6), (5, 4), (6, 3), (7, 1), (8, 2)]

-- Period 9, original row 121, representative 6482.
def source10 : Weights.Entry :=
  { word := [0, 12, 2, 0, 1, 0, 4], weights := [0, 1, 0, 1] }

def target10 : Weights.Entry :=
  { word := [0, 1, 0, 1, 4, 10, 0], weights := [1, 0, 1, 0] }

def points10 : List (ℕ × ℕ) := [(0, 1), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (8, 2)]

-- Period 9, original row 124, representative 6482.
def source11 : Weights.Entry :=
  { word := [0, 12, 2, 0, 1, 0, 4], weights := [0, 1, 0, 1] }

def target11 : Weights.Entry :=
  { word := [0, 1, 0, 2, 2, 10, 0], weights := [1, 0, 0, 1] }

def points11 : List (ℕ × ℕ) := [(0, 1), (1, 8), (2, 7), (3, 5), (4, 6), (5, 4), (6, 3), (8, 2)]

-- Period 9, original row 143, representative 6865.
def source12 : Weights.Entry :=
  { word := [0, 1, 0, 12, 0, 12, 12], weights := [1, 0, 1, 0] }

def target12 : Weights.Entry :=
  { word := [0, 1, 0, 12, 0, 12, 12], weights := [1, 0, 1, 0] }

-- Period 9, original row 224, representative 6908.
def source13 : Weights.Entry :=
  { word := [0, 1, 8, 9, 12, 12, 12], weights := [1, 0, 1, 1] }

def target13 : Weights.Entry :=
  { word := [0, 1, 8, 9, 12, 12, 12], weights := [1, 0, 1, 1] }

-- Period 9, original row 268, representative 7136.
def source14 : Weights.Entry :=
  { word := [0, 2, 10, 10, 0, 4, 10], weights := [0, 1, 1, 1] }

def target14 : Weights.Entry :=
  { word := [0, 1, 12, 10, 0, 4, 10], weights := [1, 0, 1, 1] }

def points14 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 269, representative 7136.
def source15 : Weights.Entry :=
  { word := [0, 2, 10, 10, 0, 4, 10], weights := [0, 1, 1, 1] }

def target15 : Weights.Entry :=
  { word := [0, 1, 12, 10, 0, 4, 12], weights := [1, 0, 1, 1] }

def points15 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6), (7, 8), (8, 7)]

-- Period 9, original row 288, representative 7638.
def source16 : Weights.Entry :=
  { word := [0, 1, 12, 10, 8, 8, 12], weights := [1, 0, 0, 1] }

def target16 : Weights.Entry :=
  { word := [0, 1, 12, 10, 8, 8, 12], weights := [1, 0, 0, 1] }

-- Period 9, original row 302, representative 6865.
def source17 : Weights.Entry :=
  { word := [0, 1, 0, 12, 0, 12, 12], weights := [1, 0, 1, 0] }

def target17 : Weights.Entry :=
  { word := [0, 2, 0, 8, 1, 12, 12], weights := [0, 1, 1, 0] }

def points17 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 469, representative 7136.
def source18 : Weights.Entry :=
  { word := [0, 2, 10, 10, 0, 4, 10], weights := [0, 1, 1, 1] }

def target18 : Weights.Entry :=
  { word := [0, 2, 10, 10, 0, 4, 10], weights := [0, 1, 1, 1] }

-- Period 9, original row 470, representative 7136.
def source19 : Weights.Entry :=
  { word := [0, 2, 10, 10, 0, 4, 10], weights := [0, 1, 1, 1] }

def target19 : Weights.Entry :=
  { word := [0, 2, 10, 10, 0, 4, 12], weights := [0, 1, 1, 1] }

def points19 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 8), (8, 7)]

-- Period 9, original row 1551, representative 6482.
def source20 : Weights.Entry :=
  { word := [0, 12, 2, 0, 1, 0, 4], weights := [0, 1, 0, 1] }

def target20 : Weights.Entry :=
  { word := [0, 12, 2, 0, 1, 0, 1], weights := [0, 1, 0, 1] }

def points20 : List (ℕ × ℕ) := [(0, 7), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (8, 8)]

-- Period 9, original row 1552, representative 6482.
def source21 : Weights.Entry :=
  { word := [0, 12, 2, 0, 1, 0, 4], weights := [0, 1, 0, 1] }

def target21 : Weights.Entry :=
  { word := [0, 12, 2, 0, 1, 0, 2], weights := [0, 1, 0, 1] }

def points21 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (8, 7)]

-- Period 9, original row 1553, representative 6482.
def source22 : Weights.Entry :=
  { word := [0, 12, 2, 0, 1, 0, 4], weights := [0, 1, 0, 1] }

def target22 : Weights.Entry :=
  { word := [0, 12, 2, 0, 1, 0, 4], weights := [0, 1, 0, 1] }

-- Period 9, original row 1601, representative 6482.
def source23 : Weights.Entry :=
  { word := [0, 12, 2, 0, 1, 0, 4], weights := [0, 1, 0, 1] }

def target23 : Weights.Entry :=
  { word := [0, 12, 4, 4, 0, 0, 1], weights := [1, 0, 0, 1] }

def points23 : List (ℕ × ℕ) := [(0, 7), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6), (8, 8)]

-- Period 9, original row 1602, representative 6482.
def source24 : Weights.Entry :=
  { word := [0, 12, 2, 0, 1, 0, 4], weights := [0, 1, 0, 1] }

def target24 : Weights.Entry :=
  { word := [0, 12, 4, 4, 0, 0, 2], weights := [1, 0, 0, 1] }

def points24 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6), (8, 7)]

-- Period 9, original row 1603, representative 6482.
def source25 : Weights.Entry :=
  { word := [0, 12, 2, 0, 1, 0, 4], weights := [0, 1, 0, 1] }

def target25 : Weights.Entry :=
  { word := [0, 12, 4, 4, 0, 0, 4], weights := [1, 0, 0, 1] }

def points25 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6), (8, 8)]

-- Period 9, original row 2200, representative 6482.
def source26 : Weights.Entry :=
  { word := [0, 12, 2, 0, 1, 0, 4], weights := [0, 1, 0, 1] }

def target26 : Weights.Entry :=
  { word := [1, 12, 2, 0, 1, 0, 1], weights := [0, 1, 0, 1] }

def points26 : List (ℕ × ℕ) := [(0, 7), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (8, 8)]

-- Period 9, original row 2201, representative 6482.
def source27 : Weights.Entry :=
  { word := [0, 12, 2, 0, 1, 0, 4], weights := [0, 1, 0, 1] }

def target27 : Weights.Entry :=
  { word := [1, 12, 2, 0, 1, 0, 2], weights := [0, 1, 0, 1] }

def points27 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (8, 7)]

-- Period 9, original row 2202, representative 6482.
def source28 : Weights.Entry :=
  { word := [0, 12, 2, 0, 1, 0, 4], weights := [0, 1, 0, 1] }

def target28 : Weights.Entry :=
  { word := [1, 12, 2, 0, 1, 0, 4], weights := [0, 1, 0, 1] }

def points28 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (8, 8)]

-- Period 9, original row 2250, representative 6482.
def source29 : Weights.Entry :=
  { word := [0, 12, 2, 0, 1, 0, 4], weights := [0, 1, 0, 1] }

def target29 : Weights.Entry :=
  { word := [1, 12, 4, 4, 0, 0, 1], weights := [1, 0, 0, 1] }

def points29 : List (ℕ × ℕ) := [(0, 7), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6), (8, 8)]

-- Period 9, original row 2251, representative 6482.
def source30 : Weights.Entry :=
  { word := [0, 12, 2, 0, 1, 0, 4], weights := [0, 1, 0, 1] }

def target30 : Weights.Entry :=
  { word := [1, 12, 4, 4, 0, 0, 2], weights := [1, 0, 0, 1] }

def points30 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6), (8, 7)]

-- Period 9, original row 2252, representative 6482.
def source31 : Weights.Entry :=
  { word := [0, 12, 2, 0, 1, 0, 4], weights := [0, 1, 0, 1] }

def target31 : Weights.Entry :=
  { word := [1, 12, 4, 4, 0, 0, 4], weights := [1, 0, 0, 1] }

def points31 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6), (8, 8)]

-- Period 9, original row 2382, representative 6482.
def source32 : Weights.Entry :=
  { word := [0, 12, 2, 0, 1, 0, 4], weights := [0, 1, 0, 1] }

def target32 : Weights.Entry :=
  { word := [2, 0, 0, 1, 4, 10, 0], weights := [1, 0, 1, 0] }

def points32 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (8, 1)]

-- Period 9, original row 2385, representative 6482.
def source33 : Weights.Entry :=
  { word := [0, 12, 2, 0, 1, 0, 4], weights := [0, 1, 0, 1] }

def target33 : Weights.Entry :=
  { word := [2, 0, 0, 2, 2, 10, 0], weights := [1, 0, 0, 1] }

def points33 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 5), (4, 6), (5, 4), (6, 3), (8, 1)]

-- Period 9, original row 3392, representative 6482.
def source34 : Weights.Entry :=
  { word := [0, 12, 2, 0, 1, 0, 4], weights := [0, 1, 0, 1] }

def target34 : Weights.Entry :=
  { word := [4, 0, 0, 1, 4, 10, 0], weights := [1, 0, 1, 0] }

def points34 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (8, 2)]

-- Period 9, original row 3395, representative 6482.
def source35 : Weights.Entry :=
  { word := [0, 12, 2, 0, 1, 0, 4], weights := [0, 1, 0, 1] }

def target35 : Weights.Entry :=
  { word := [4, 0, 0, 2, 2, 10, 0], weights := [1, 0, 0, 1] }

def points35 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 5), (4, 6), (5, 4), (6, 3), (8, 2)]

-- Period 9, original row 3447, representative 5771.
def source36 : Weights.Entry :=
  { word := [4, 0, 4, 10, 0, 4, 8], weights := [1, 0, 2, 1] }

def target36 : Weights.Entry :=
  { word := [4, 0, 4, 10, 0, 4, 8], weights := [1, 0, 2, 1] }

-- Period 9, original row 4744, representative 5771.
def source37 : Weights.Entry :=
  { word := [4, 0, 4, 10, 0, 4, 8], weights := [1, 0, 2, 1] }

def target37 : Weights.Entry :=
  { word := [8, 2, 0, 12, 2, 0, 2], weights := [1, 2, 0, 1] }

def points37 : List (ℕ × ℕ) := [(0, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2)]

-- Period 9, original row 6030, representative 6838.
def source38 : Weights.Entry :=
  { word := [8, 9, 8, 9, 12, 12, 12], weights := [1, 1, 1, 1] }

def target38 : Weights.Entry :=
  { word := [8, 9, 8, 9, 12, 12, 12], weights := [1, 1, 1, 1] }

-- Period 9, original row 6279, representative 6887.
def source39 : Weights.Entry :=
  { word := [8, 10, 8, 10, 8, 12, 12], weights := [0, 3, 0, 1] }

def target39 : Weights.Entry :=
  { word := [8, 10, 8, 10, 8, 12, 12], weights := [0, 3, 0, 1] }

-- Period 9, original row 7631, representative 7136.
def source40 : Weights.Entry :=
  { word := [0, 2, 10, 10, 0, 4, 10], weights := [0, 1, 1, 1] }

def target40 : Weights.Entry :=
  { word := [10, 2, 0, 12, 10, 0, 1], weights := [1, 1, 0, 1] }

def points40 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 5), (4, 6), (5, 4), (6, 3), (7, 1), (8, 2)]

-- Period 9, original row 7638, representative 7136.
def source41 : Weights.Entry :=
  { word := [0, 2, 10, 10, 0, 4, 10], weights := [0, 1, 1, 1] }

def target41 : Weights.Entry :=
  { word := [10, 2, 0, 12, 12, 4, 0], weights := [1, 1, 1, 0] }

def points41 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2)]

-- Period 9, original row 7962, representative 6784.
def source42 : Weights.Entry :=
  { word := [10, 8, 4, 10, 8, 12, 12], weights := [2, 2, 1, 3] }

def target42 : Weights.Entry :=
  { word := [10, 8, 4, 10, 8, 12, 12], weights := [2, 2, 1, 3] }

-- Period 9, original row 8086, representative 7638.
def source43 : Weights.Entry :=
  { word := [0, 1, 12, 10, 8, 8, 12], weights := [1, 0, 0, 1] }

def target43 : Weights.Entry :=
  { word := [10, 8, 8, 12, 10, 0, 1], weights := [1, 0, 0, 1] }

def points43 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 8117, representative 6790.
def source44 : Weights.Entry :=
  { word := [10, 10, 8, 9, 8, 9, 12], weights := [1, 1, 0, 1] }

def target44 : Weights.Entry :=
  { word := [10, 8, 9, 8, 9, 12, 12], weights := [1, 0, 1, 1] }

def points44 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 8172, representative 6783.
def source45 : Weights.Entry :=
  { word := [10, 8, 12, 10, 8, 12, 12], weights := [2, 1, 1, 2] }

def target45 : Weights.Entry :=
  { word := [10, 8, 12, 10, 8, 12, 12], weights := [2, 1, 1, 2] }

-- Period 9, original row 8185, representative 6865.
def source46 : Weights.Entry :=
  { word := [0, 1, 0, 12, 0, 12, 12], weights := [1, 0, 1, 0] }

def target46 : Weights.Entry :=
  { word := [10, 10, 0, 9, 0, 4, 0], weights := [0, 1, 1, 0] }

def points46 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 5), (4, 6), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 8201, representative 6865.
def source47 : Weights.Entry :=
  { word := [0, 1, 0, 12, 0, 12, 12], weights := [1, 0, 1, 0] }

def target47 : Weights.Entry :=
  { word := [10, 10, 0, 10, 0, 0, 1], weights := [0, 1, 0, 1] }

def points47 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 8307, representative 6790.
def source48 : Weights.Entry :=
  { word := [10, 10, 8, 9, 8, 9, 12], weights := [1, 1, 0, 1] }

def target48 : Weights.Entry :=
  { word := [10, 10, 8, 9, 8, 9, 12], weights := [1, 1, 0, 1] }

-- Period 9, original row 8351, representative 6784.
def source49 : Weights.Entry :=
  { word := [10, 8, 4, 10, 8, 12, 12], weights := [2, 2, 1, 3] }

def target49 : Weights.Entry :=
  { word := [10, 10, 8, 12, 2, 8, 12], weights := [3, 1, 2, 2] }

def points49 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 8360, representative 6887.
def source50 : Weights.Entry :=
  { word := [8, 10, 8, 10, 8, 12, 12], weights := [0, 3, 0, 1] }

def target50 : Weights.Entry :=
  { word := [10, 10, 8, 12, 8, 12, 8], weights := [1, 0, 3, 0] }

def points50 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 8361, representative 6757.
def source51 : Weights.Entry :=
  { word := [10, 10, 8, 12, 8, 12, 10], weights := [2, 1, 2, 1] }

def target51 : Weights.Entry :=
  { word := [10, 10, 8, 12, 8, 12, 10], weights := [2, 1, 2, 1] }

-- Period 9, original row 8373, representative 6783.
def source52 : Weights.Entry :=
  { word := [10, 8, 12, 10, 8, 12, 12], weights := [2, 1, 1, 2] }

def target52 : Weights.Entry :=
  { word := [10, 10, 8, 12, 10, 8, 12], weights := [2, 1, 1, 2] }

def points52 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 8392, representative 6908.
def source53 : Weights.Entry :=
  { word := [0, 1, 8, 9, 12, 12, 12], weights := [1, 0, 1, 1] }

def target53 : Weights.Entry :=
  { word := [10, 10, 10, 8, 9, 0, 1], weights := [1, 1, 0, 1] }

def points53 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 8401, representative 6838.
def source54 : Weights.Entry :=
  { word := [8, 9, 8, 9, 12, 12, 12], weights := [1, 1, 1, 1] }

def target54 : Weights.Entry :=
  { word := [10, 10, 10, 8, 9, 8, 9], weights := [1, 1, 1, 1] }

def points54 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 8613, representative 7136.
def source55 : Weights.Entry :=
  { word := [0, 2, 10, 10, 0, 4, 10], weights := [0, 1, 1, 1] }

def target55 : Weights.Entry :=
  { word := [12, 2, 0, 12, 10, 0, 1], weights := [1, 1, 0, 1] }

def points55 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 5), (4, 6), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 8620, representative 7136.
def source56 : Weights.Entry :=
  { word := [0, 2, 10, 10, 0, 4, 10], weights := [0, 1, 1, 1] }

def target56 : Weights.Entry :=
  { word := [12, 2, 0, 12, 12, 4, 0], weights := [1, 1, 1, 0] }

def points56 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 9045, representative 6757.
def source57 : Weights.Entry :=
  { word := [10, 10, 8, 12, 8, 12, 10], weights := [2, 1, 2, 1] }

def target57 : Weights.Entry :=
  { word := [12, 10, 8, 10, 8, 12, 12], weights := [1, 2, 1, 2] }

def points57 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 9082, representative 7205.
def source58 : Weights.Entry :=
  { word := [12, 12, 12, 8, 8, 10, 10], weights := [0, 1, 1, 0] }

def target58 : Weights.Entry :=
  { word := [12, 12, 8, 8, 10, 10, 10], weights := [0, 1, 1, 0] }

def points58 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 9087, representative 7205.
def source59 : Weights.Entry :=
  { word := [12, 12, 12, 8, 8, 10, 10], weights := [0, 1, 1, 0] }

def target59 : Weights.Entry :=
  { word := [12, 12, 12, 8, 8, 10, 10], weights := [0, 1, 1, 0] }

-- Period 10, original row 121, representative 6482.
def source60 : Weights.Entry :=
  { word := [0, 12, 2, 0, 1, 0, 4], weights := [0, 1, 0, 1] }

def target60 : Weights.Entry :=
  { word := [0, 1, 0, 1, 4, 10, 0], weights := [1, 0, 1, 0] }

def points60 : List (ℕ × ℕ) := [(0, 1), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (8, 2)]

-- Period 10, original row 124, representative 6482.
def source61 : Weights.Entry :=
  { word := [0, 12, 2, 0, 1, 0, 4], weights := [0, 1, 0, 1] }

def target61 : Weights.Entry :=
  { word := [0, 1, 0, 2, 2, 10, 0], weights := [1, 0, 0, 1] }

def points61 : List (ℕ × ℕ) := [(0, 1), (1, 8), (2, 7), (3, 5), (4, 6), (5, 4), (6, 3), (8, 2)]

-- Period 10, original row 143, representative 6865.
def source62 : Weights.Entry :=
  { word := [0, 1, 0, 12, 0, 12, 12], weights := [1, 0, 1, 0] }

def target62 : Weights.Entry :=
  { word := [0, 1, 0, 12, 0, 12, 12], weights := [1, 0, 1, 0] }

def points62 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 10, original row 224, representative 6908.
def source63 : Weights.Entry :=
  { word := [0, 1, 8, 9, 12, 12, 12], weights := [1, 0, 1, 1] }

def target63 : Weights.Entry :=
  { word := [0, 1, 8, 9, 12, 12, 12], weights := [1, 0, 1, 1] }

def points63 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 10, original row 268, representative 7136.
def source64 : Weights.Entry :=
  { word := [0, 2, 10, 10, 0, 4, 10], weights := [0, 1, 1, 1] }

def target64 : Weights.Entry :=
  { word := [0, 1, 12, 10, 0, 4, 10], weights := [1, 0, 1, 1] }

def points64 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 10, original row 269, representative 7136.
def source65 : Weights.Entry :=
  { word := [0, 2, 10, 10, 0, 4, 10], weights := [0, 1, 1, 1] }

def target65 : Weights.Entry :=
  { word := [0, 1, 12, 10, 0, 4, 12], weights := [1, 0, 1, 1] }

def points65 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6), (7, 8), (8, 7)]

-- Period 10, original row 288, representative 7638.
def source66 : Weights.Entry :=
  { word := [0, 1, 12, 10, 8, 8, 12], weights := [1, 0, 0, 1] }

def target66 : Weights.Entry :=
  { word := [0, 1, 12, 10, 8, 8, 12], weights := [1, 0, 0, 1] }

def points66 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 10, original row 302, representative 6865.
def source67 : Weights.Entry :=
  { word := [0, 1, 0, 12, 0, 12, 12], weights := [1, 0, 1, 0] }

def target67 : Weights.Entry :=
  { word := [0, 2, 0, 8, 1, 12, 12], weights := [0, 1, 1, 0] }

def points67 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 10, original row 469, representative 7136.
def source68 : Weights.Entry :=
  { word := [0, 2, 10, 10, 0, 4, 10], weights := [0, 1, 1, 1] }

def target68 : Weights.Entry :=
  { word := [0, 2, 10, 10, 0, 4, 10], weights := [0, 1, 1, 1] }

def points68 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 10, original row 470, representative 7136.
def source69 : Weights.Entry :=
  { word := [0, 2, 10, 10, 0, 4, 10], weights := [0, 1, 1, 1] }

def target69 : Weights.Entry :=
  { word := [0, 2, 10, 10, 0, 4, 12], weights := [0, 1, 1, 1] }

def points69 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 8), (8, 7)]

-- Period 10, original row 1551, representative 6482.
def source70 : Weights.Entry :=
  { word := [0, 12, 2, 0, 1, 0, 4], weights := [0, 1, 0, 1] }

def target70 : Weights.Entry :=
  { word := [0, 12, 2, 0, 1, 0, 1], weights := [0, 1, 0, 1] }

def points70 : List (ℕ × ℕ) := [(0, 7), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (8, 8)]

-- Period 10, original row 1552, representative 6482.
def source71 : Weights.Entry :=
  { word := [0, 12, 2, 0, 1, 0, 4], weights := [0, 1, 0, 1] }

def target71 : Weights.Entry :=
  { word := [0, 12, 2, 0, 1, 0, 2], weights := [0, 1, 0, 1] }

def points71 : List (ℕ × ℕ) := [(0, 7), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (8, 9)]

-- Period 10, original row 1553, representative 6482.
def source72 : Weights.Entry :=
  { word := [0, 12, 2, 0, 1, 0, 4], weights := [0, 1, 0, 1] }

def target72 : Weights.Entry :=
  { word := [0, 12, 2, 0, 1, 0, 4], weights := [0, 1, 0, 1] }

def points72 : List (ℕ × ℕ) := [(0, 8), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (8, 9)]

-- Period 10, original row 1601, representative 6482.
def source73 : Weights.Entry :=
  { word := [0, 12, 2, 0, 1, 0, 4], weights := [0, 1, 0, 1] }

def target73 : Weights.Entry :=
  { word := [0, 12, 4, 4, 0, 0, 1], weights := [1, 0, 0, 1] }

def points73 : List (ℕ × ℕ) := [(0, 7), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6), (8, 8)]

-- Period 10, original row 1602, representative 6482.
def source74 : Weights.Entry :=
  { word := [0, 12, 2, 0, 1, 0, 4], weights := [0, 1, 0, 1] }

def target74 : Weights.Entry :=
  { word := [0, 12, 4, 4, 0, 0, 2], weights := [1, 0, 0, 1] }

def points74 : List (ℕ × ℕ) := [(0, 7), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6), (8, 9)]

-- Period 10, original row 1603, representative 6482.
def source75 : Weights.Entry :=
  { word := [0, 12, 2, 0, 1, 0, 4], weights := [0, 1, 0, 1] }

def target75 : Weights.Entry :=
  { word := [0, 12, 4, 4, 0, 0, 4], weights := [1, 0, 0, 1] }

def points75 : List (ℕ × ℕ) := [(0, 8), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6), (8, 9)]

-- Period 10, original row 2200, representative 6482.
def source76 : Weights.Entry :=
  { word := [0, 12, 2, 0, 1, 0, 4], weights := [0, 1, 0, 1] }

def target76 : Weights.Entry :=
  { word := [1, 12, 2, 0, 1, 0, 1], weights := [0, 1, 0, 1] }

def points76 : List (ℕ × ℕ) := [(0, 7), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (8, 8)]

-- Period 10, original row 2201, representative 6482.
def source77 : Weights.Entry :=
  { word := [0, 12, 2, 0, 1, 0, 4], weights := [0, 1, 0, 1] }

def target77 : Weights.Entry :=
  { word := [1, 12, 2, 0, 1, 0, 2], weights := [0, 1, 0, 1] }

def points77 : List (ℕ × ℕ) := [(0, 7), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (8, 9)]

-- Period 10, original row 2202, representative 6482.
def source78 : Weights.Entry :=
  { word := [0, 12, 2, 0, 1, 0, 4], weights := [0, 1, 0, 1] }

def target78 : Weights.Entry :=
  { word := [1, 12, 2, 0, 1, 0, 4], weights := [0, 1, 0, 1] }

def points78 : List (ℕ × ℕ) := [(0, 8), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (8, 9)]

-- Period 10, original row 2250, representative 6482.
def source79 : Weights.Entry :=
  { word := [0, 12, 2, 0, 1, 0, 4], weights := [0, 1, 0, 1] }

def target79 : Weights.Entry :=
  { word := [1, 12, 4, 4, 0, 0, 1], weights := [1, 0, 0, 1] }

def points79 : List (ℕ × ℕ) := [(0, 7), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6), (8, 8)]

-- Period 10, original row 2251, representative 6482.
def source80 : Weights.Entry :=
  { word := [0, 12, 2, 0, 1, 0, 4], weights := [0, 1, 0, 1] }

def target80 : Weights.Entry :=
  { word := [1, 12, 4, 4, 0, 0, 2], weights := [1, 0, 0, 1] }

def points80 : List (ℕ × ℕ) := [(0, 7), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6), (8, 9)]

-- Period 10, original row 2252, representative 6482.
def source81 : Weights.Entry :=
  { word := [0, 12, 2, 0, 1, 0, 4], weights := [0, 1, 0, 1] }

def target81 : Weights.Entry :=
  { word := [1, 12, 4, 4, 0, 0, 4], weights := [1, 0, 0, 1] }

def points81 : List (ℕ × ℕ) := [(0, 8), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6), (8, 9)]

-- Period 10, original row 2382, representative 6482.
def source82 : Weights.Entry :=
  { word := [0, 12, 2, 0, 1, 0, 4], weights := [0, 1, 0, 1] }

def target82 : Weights.Entry :=
  { word := [2, 0, 0, 1, 4, 10, 0], weights := [1, 0, 1, 0] }

def points82 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (8, 1)]

-- Period 10, original row 2385, representative 6482.
def source83 : Weights.Entry :=
  { word := [0, 12, 2, 0, 1, 0, 4], weights := [0, 1, 0, 1] }

def target83 : Weights.Entry :=
  { word := [2, 0, 0, 2, 2, 10, 0], weights := [1, 0, 0, 1] }

def points83 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 5), (4, 6), (5, 4), (6, 3), (8, 1)]

-- Period 10, original row 2404, representative 6865.
def source84 : Weights.Entry :=
  { word := [0, 1, 0, 12, 0, 12, 12], weights := [1, 0, 1, 0] }

def target84 : Weights.Entry :=
  { word := [2, 0, 0, 12, 0, 12, 12], weights := [1, 0, 1, 0] }

def points84 : List (ℕ × ℕ) := [(0, 9), (1, 0), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 10, original row 3392, representative 6482.
def source85 : Weights.Entry :=
  { word := [0, 12, 2, 0, 1, 0, 4], weights := [0, 1, 0, 1] }

def target85 : Weights.Entry :=
  { word := [4, 0, 0, 1, 4, 10, 0], weights := [1, 0, 1, 0] }

def points85 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (8, 2)]

-- Period 10, original row 3395, representative 6482.
def source86 : Weights.Entry :=
  { word := [0, 12, 2, 0, 1, 0, 4], weights := [0, 1, 0, 1] }

def target86 : Weights.Entry :=
  { word := [4, 0, 0, 2, 2, 10, 0], weights := [1, 0, 0, 1] }

def points86 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 5), (4, 6), (5, 4), (6, 3), (8, 2)]

-- Period 10, original row 3414, representative 6865.
def source87 : Weights.Entry :=
  { word := [0, 1, 0, 12, 0, 12, 12], weights := [1, 0, 1, 0] }

def target87 : Weights.Entry :=
  { word := [4, 0, 0, 12, 0, 12, 12], weights := [1, 0, 1, 0] }

def points87 : List (ℕ × ℕ) := [(0, 9), (1, 0), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 10, original row 3495, representative 6908.
def source88 : Weights.Entry :=
  { word := [0, 1, 8, 9, 12, 12, 12], weights := [1, 0, 1, 1] }

def target88 : Weights.Entry :=
  { word := [4, 0, 8, 9, 12, 12, 12], weights := [1, 0, 1, 1] }

def points88 : List (ℕ × ℕ) := [(0, 9), (1, 0), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 10, original row 3539, representative 7136.
def source89 : Weights.Entry :=
  { word := [0, 2, 10, 10, 0, 4, 10], weights := [0, 1, 1, 1] }

def target89 : Weights.Entry :=
  { word := [4, 0, 12, 10, 0, 4, 10], weights := [1, 0, 1, 1] }

def points89 : List (ℕ × ℕ) := [(0, 9), (1, 0), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 10, original row 3540, representative 7136.
def source90 : Weights.Entry :=
  { word := [0, 2, 10, 10, 0, 4, 10], weights := [0, 1, 1, 1] }

def target90 : Weights.Entry :=
  { word := [4, 0, 12, 10, 0, 4, 12], weights := [1, 0, 1, 1] }

def points90 : List (ℕ × ℕ) := [(0, 9), (1, 0), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6), (7, 8), (8, 7)]

-- Period 10, original row 3559, representative 7638.
def source91 : Weights.Entry :=
  { word := [0, 1, 12, 10, 8, 8, 12], weights := [1, 0, 0, 1] }

def target91 : Weights.Entry :=
  { word := [4, 0, 12, 10, 8, 8, 12], weights := [1, 0, 0, 1] }

def points91 : List (ℕ × ℕ) := [(0, 9), (1, 0), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 10, original row 7631, representative 7136.
def source92 : Weights.Entry :=
  { word := [0, 2, 10, 10, 0, 4, 10], weights := [0, 1, 1, 1] }

def target92 : Weights.Entry :=
  { word := [10, 2, 0, 12, 10, 0, 1], weights := [1, 1, 0, 1] }

def points92 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 5), (4, 6), (5, 4), (6, 3), (7, 1), (8, 2)]

-- Period 10, original row 7632, representative 7136.
def source93 : Weights.Entry :=
  { word := [0, 2, 10, 10, 0, 4, 10], weights := [0, 1, 1, 1] }

def target93 : Weights.Entry :=
  { word := [10, 2, 0, 12, 10, 0, 2], weights := [1, 1, 0, 1] }

def points93 : List (ℕ × ℕ) := [(0, 0), (1, 9), (2, 7), (3, 5), (4, 6), (5, 4), (6, 3), (7, 1), (8, 2)]

-- Period 10, original row 7638, representative 7136.
def source94 : Weights.Entry :=
  { word := [0, 2, 10, 10, 0, 4, 10], weights := [0, 1, 1, 1] }

def target94 : Weights.Entry :=
  { word := [10, 2, 0, 12, 12, 4, 0], weights := [1, 1, 1, 0] }

def points94 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2)]

-- Period 10, original row 8086, representative 7638.
def source95 : Weights.Entry :=
  { word := [0, 1, 12, 10, 8, 8, 12], weights := [1, 0, 0, 1] }

def target95 : Weights.Entry :=
  { word := [10, 8, 8, 12, 10, 0, 1], weights := [1, 0, 0, 1] }

def points95 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 10, original row 8087, representative 7638.
def source96 : Weights.Entry :=
  { word := [0, 1, 12, 10, 8, 8, 12], weights := [1, 0, 0, 1] }

def target96 : Weights.Entry :=
  { word := [10, 8, 8, 12, 10, 0, 2], weights := [1, 0, 0, 1] }

def points96 : List (ℕ × ℕ) := [(0, 0), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 10, original row 8185, representative 6865.
def source97 : Weights.Entry :=
  { word := [0, 1, 0, 12, 0, 12, 12], weights := [1, 0, 1, 0] }

def target97 : Weights.Entry :=
  { word := [10, 10, 0, 9, 0, 4, 0], weights := [0, 1, 1, 0] }

def points97 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 5), (4, 6), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 10, original row 8201, representative 6865.
def source98 : Weights.Entry :=
  { word := [0, 1, 0, 12, 0, 12, 12], weights := [1, 0, 1, 0] }

def target98 : Weights.Entry :=
  { word := [10, 10, 0, 10, 0, 0, 1], weights := [0, 1, 0, 1] }

def points98 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 10, original row 8202, representative 6865.
def source99 : Weights.Entry :=
  { word := [0, 1, 0, 12, 0, 12, 12], weights := [1, 0, 1, 0] }

def target99 : Weights.Entry :=
  { word := [10, 10, 0, 10, 0, 0, 2], weights := [0, 1, 0, 1] }

def points99 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 9), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 10, original row 8203, representative 6865.
def source100 : Weights.Entry :=
  { word := [0, 1, 0, 12, 0, 12, 12], weights := [1, 0, 1, 0] }

def target100 : Weights.Entry :=
  { word := [10, 10, 0, 10, 0, 0, 4], weights := [0, 1, 0, 1] }

def points100 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 9), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 10, original row 8392, representative 6908.
def source101 : Weights.Entry :=
  { word := [0, 1, 8, 9, 12, 12, 12], weights := [1, 0, 1, 1] }

def target101 : Weights.Entry :=
  { word := [10, 10, 10, 8, 9, 0, 1], weights := [1, 1, 0, 1] }

def points101 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 10, original row 8393, representative 6908.
def source102 : Weights.Entry :=
  { word := [0, 1, 8, 9, 12, 12, 12], weights := [1, 0, 1, 1] }

def target102 : Weights.Entry :=
  { word := [10, 10, 10, 8, 9, 0, 2], weights := [1, 1, 0, 1] }

def points102 : List (ℕ × ℕ) := [(0, 0), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 10, original row 8613, representative 7136.
def source103 : Weights.Entry :=
  { word := [0, 2, 10, 10, 0, 4, 10], weights := [0, 1, 1, 1] }

def target103 : Weights.Entry :=
  { word := [12, 2, 0, 12, 10, 0, 1], weights := [1, 1, 0, 1] }

def points103 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 5), (4, 6), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 10, original row 8614, representative 7136.
def source104 : Weights.Entry :=
  { word := [0, 2, 10, 10, 0, 4, 10], weights := [0, 1, 1, 1] }

def target104 : Weights.Entry :=
  { word := [12, 2, 0, 12, 10, 0, 2], weights := [1, 1, 0, 1] }

def points104 : List (ℕ × ℕ) := [(0, 0), (1, 9), (2, 7), (3, 5), (4, 6), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 10, original row 8620, representative 7136.
def source105 : Weights.Entry :=
  { word := [0, 2, 10, 10, 0, 4, 10], weights := [0, 1, 1, 1] }

def target105 : Weights.Entry :=
  { word := [12, 2, 0, 12, 12, 4, 0], weights := [1, 1, 1, 0] }

def points105 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

def period8Entries : List Weights.Entry := [target0, target1, target2, target3, target4, target5, target6, target7, target8, target9]

def period8Chunk : RowCoverage.Chunk where
  rows := [⟨121, target0⟩, ⟨124, target1⟩, ⟨176, target2⟩, ⟨368, target3⟩, ⟨1551, target4⟩, ⟨1601, target5⟩, ⟨2200, target6⟩, ⟨2250, target7⟩, ⟨4743, target8⟩, ⟨4748, target9⟩]
  indexMask := 20127200557315640967396058090622177757201655643906647323746084167562042783102807977233040500503435530515889293582697796597423384070161583741144050421335829706084706142301095274870394231834968305490797664750187612386549432341319251767209107284679333329405710241144040767941434071330665879757103008792166409244988027968702145136792390714350878195063107507398081267081849696857650225819500348360137470800930199019464746242506519351620780308788869263819824117516368590258026960902656996737375625973156732554793341282916981067267564231255843497355513017961681408801848911262542138703340135542445293464361998851174359133057882592559816845534827117430841486029481573186608079083782514813970617327826641359950837770847606796519249795701121388288699610739016888169136580094261251767666609304277257580922718178454989327630454516803783808070690909758871759256425175794820517359536939491851894450248938173862594610859562532155877805173006231222636335168284285901447417997102418640926778130306113671097383645707117356382581236167726496888104246555239412457765033065343069860101241097532359470657281888449102309672803857485239064747926507233081041970973229391813982929623081651910140274757427253738825253501840724646550507011955514955886398203800728442702555689956868573210797431068285624018056881080605479145368578082106453963945124280444124983906432626083475823393378310450621958456876229682807698541490554044637952079578891322043567360180224
  count := 10

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

def period9Entries : List Weights.Entry := [target10, target11, target12, target13, target14, target15, target16, target17, target18, target19, target20, target21, target22, target23, target24, target25, target26, target27, target28, target29, target30, target31, target32, target33, target34, target35, target36, target37, target38, target39, target40, target41, target42, target43, target44, target45, target46, target47, target48, target49, target50, target51, target52, target53, target54, target55, target56, target57, target58, target59]

def period9Chunk : RowCoverage.Chunk where
  rows := [⟨121, target10⟩, ⟨124, target11⟩, ⟨143, target12⟩, ⟨224, target13⟩, ⟨268, target14⟩, ⟨269, target15⟩, ⟨288, target16⟩, ⟨302, target17⟩, ⟨469, target18⟩, ⟨470, target19⟩, ⟨1551, target20⟩, ⟨1552, target21⟩, ⟨1553, target22⟩, ⟨1601, target23⟩, ⟨1602, target24⟩, ⟨1603, target25⟩, ⟨2200, target26⟩, ⟨2201, target27⟩, ⟨2202, target28⟩, ⟨2250, target29⟩, ⟨2251, target30⟩, ⟨2252, target31⟩, ⟨2382, target32⟩, ⟨2385, target33⟩, ⟨3392, target34⟩, ⟨3395, target35⟩, ⟨3447, target36⟩, ⟨4744, target37⟩, ⟨6030, target38⟩, ⟨6279, target39⟩, ⟨7631, target40⟩, ⟨7638, target41⟩, ⟨7962, target42⟩, ⟨8086, target43⟩, ⟨8117, target44⟩, ⟨8172, target45⟩, ⟨8185, target46⟩, ⟨8201, target47⟩, ⟨8307, target48⟩, ⟨8351, target49⟩, ⟨8360, target50⟩, ⟨8361, target51⟩, ⟨8373, target52⟩, ⟨8392, target53⟩, ⟨8401, target54⟩, ⟨8613, target55⟩, ⟨8620, target56⟩, ⟨9045, target57⟩, ⟨9082, target58⟩, ⟨9087, target59⟩]
  indexMask := 297121829242366939647567124925974196758596332099794864057942772782097169226905995684982018607124479882451151128509804964127510113720238126809557796796428450670726643765822607447046919998784007826480360342145528452229280733897653680595086263556636847657512615918825797256914088564295675388265915105086968886113388129820344800719878579924375387573644015483552284215449681345564583555394652677717179844811411546106852025228213847705051608047848157421575415159932571396455388165947321442776569876389558055021566603774506213877420384185699586616105507025742471175630684089275167370530591776318238759229023914894129922374796400686628722615567783062159844707498691281647484792141152449690434665170193936568074291325417451006698831311774441122217333804163872502552837182661158925446221045378765487982625715541034356240070840639543008842805212711510173419191213779222126867184506518528885366944099314297976485628190893027509095224233120774790027317642576791286809783721977025665529260018212284974377754975704398894408930124561656330544229692268199803934368125888883215993792430966273704841127014980651468172221771587684484836200341108193634251290203194825893379079585054041388220683642710860510907572417205835065158164731379942484273932663936710836667336349062249603074030884341124200761020287846558651734044479942240355914482729118286170742626540173044538754344994906018216459563353902709663162067767385860965895864974074531454173395430530394044417428768503888249149709716296505222570229555963639892215645254501678184008997183804924204750698888165666432373427752021582909144739481179572682470105488329832358254243266385113850038328952815553462403737730018553516915132936490647658842571010533919244635420067182394030939199557886060266234964892763350915195756472173747607600622187826300477375477707827106547648701871668333726039360298940062191876472338649362150967137997695572336796528178945671032056981089364111511775920699272326246916829686426214671241024373618902970217664187628661691580121532437540738266659294359320260549749524004588855499164778107988954405711856225775717764698662111133602164579393562803623605995380110214404920077167593000512448062585823759441850770175236925573548560862932126463279967167746477632054337191348323512721798540677999652608530214252147725883367148744821667494759148932541899113268198667077543443026536403908996651207065666728231484422528049978018091328143229511080066546569896249568977941730574973432218634719488828287887963353436248529420114452612620351833283040528755105250936469937112884640714102100654666662001539075338616035236456251577128540583301968504627066638466728634828488231672665141612960048306669492014605437929712694208383217201762460421991290531410863681423910853177663171820283210918736691200
  count := 50

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

def period10Entries : List Weights.Entry := [target60, target61, target62, target63, target64, target65, target66, target67, target68, target69, target70, target71, target72, target73, target74, target75, target76, target77, target78, target79, target80, target81, target82, target83, target84, target85, target86, target87, target88, target89, target90, target91, target92, target93, target94, target95, target96, target97, target98, target99, target100, target101, target102, target103, target104, target105]

def period10Chunk : RowCoverage.Chunk where
  rows := [⟨121, target60⟩, ⟨124, target61⟩, ⟨143, target62⟩, ⟨224, target63⟩, ⟨268, target64⟩, ⟨269, target65⟩, ⟨288, target66⟩, ⟨302, target67⟩, ⟨469, target68⟩, ⟨470, target69⟩, ⟨1551, target70⟩, ⟨1552, target71⟩, ⟨1553, target72⟩, ⟨1601, target73⟩, ⟨1602, target74⟩, ⟨1603, target75⟩, ⟨2200, target76⟩, ⟨2201, target77⟩, ⟨2202, target78⟩, ⟨2250, target79⟩, ⟨2251, target80⟩, ⟨2252, target81⟩, ⟨2382, target82⟩, ⟨2385, target83⟩, ⟨2404, target84⟩, ⟨3392, target85⟩, ⟨3395, target86⟩, ⟨3414, target87⟩, ⟨3495, target88⟩, ⟨3539, target89⟩, ⟨3540, target90⟩, ⟨3559, target91⟩, ⟨7631, target92⟩, ⟨7632, target93⟩, ⟨7638, target94⟩, ⟨8086, target95⟩, ⟨8087, target96⟩, ⟨8185, target97⟩, ⟨8201, target98⟩, ⟨8202, target99⟩, ⟨8203, target100⟩, ⟨8392, target101⟩, ⟨8393, target102⟩, ⟨8613, target103⟩, ⟨8614, target104⟩, ⟨8620, target105⟩]
  indexMask := 773791490705363850285255222731120327386655257674813347638305016442429160643696214226401319022134991456769646256449318004066448550426053477184053840169641080199898729492773404085205895737364339905392144343571146369515628517511648354132849305413368713921141915284566800268031157333611916658253999865386681300393845079172080106263911320275948360885137434231935492250032439588157691954480315796419470011179448303203944269921865734686611249267598097224872843219075520829392459029158367675538646707027950885731361017227754888968340624509221664265906324414306738599693963138941307236550681686689296104574401339146806006775332122065425405772975630745021673522853813895174411606750531328804717318893189862820459330017667681840722689608301638595329540235867778273018115358044559436579930647557720630904293286724197360251555297021432569849676951120530262697802605448043555558319161540985792389675687275003663262973172426194784454965973279922300290537477400481604665287587549724120915124643115936694058149735799501664430308369394119661755444303941211744312763659531445258004519234864010607172567334807262032237261006317265707049517548329793781261084461922197253199869612399267063127838389337321903158761041486984129567118410741875755118959324447466139217617258122858328797880943252659117451990309516175176794436220458721591082896007102300616009664317532903280440586836908442876658775280716944011008798593840518694211920392525996136271291296356310733276989666484539165745154581924675582998877840635220655561097961976565096004776288032074034022826733580037548875896282543144558007198531717416090958459615738412879824490428260354116488789716967585628347342402563361253047246487859533262941723112501696269134058362189701385529426360122259309505701933231798845705744016010412623121777004689730860002760496840622036544804972517363251534583901091668081860784281721190734842732951871886171715066324998851896754965589264287012597600465256631413003473536112988130168999477281016165429414501448629549332966989412326180916129925465835454465486116093407969882389385623824552752924960400303980545629126526021069758956343998953805539733402463850440642719939552074721534374797351250144878925963628105910845936246426030755371216739814024677568234320954124847930512133445765479891682960310051788982672318098103632305798888475140276964483224009790371540258816202282477673112851129787173922922700034039385822405517881009619389765289845736514163366024415095567168325880146586798338639128200587576521683434966497459374663220402165934232926278186611111500003468114801566910965822208161695047033677579968252863261042630008705646592
  count := 46

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

end FranklSmallCyclic.TransportBatches.G077.B000.Data
