module

public import Conjectures.FranklSmallCyclicRowCoverage
public import Conjectures.FranklSmallCyclicCanonicalWords
public import Conjectures.FranklSmallCyclicWeightsPilotData

/-! 76 literal targets sharing one source proof block.
Original words and row indices are retained; weights may be transported.
-/
@[expose] public section

namespace FranklSmallCyclic.TransportBatches.G076.B000.Data

-- Period 7, original row 23, representative 1.
def source0 : Weights.Entry :=
  { word := [4, 0, 12, 2, 0, 2, 0], weights := [0, 1, 0, 0] }

def target0 : Weights.Entry :=
  { word := [0, 0, 1, 4, 10, 0, 2], weights := [0, 0, 1, 0] }

def points0 : List (ℕ × ℕ) := [(0, 2), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 62, representative 1.
def source1 : Weights.Entry :=
  { word := [4, 0, 12, 2, 0, 2, 0], weights := [0, 1, 0, 0] }

def target1 : Weights.Entry :=
  { word := [0, 0, 2, 2, 10, 0, 2], weights := [0, 1, 0, 0] }

def points1 : List (ℕ × ℕ) := [(0, 2), (2, 0), (3, 6), (4, 4), (5, 5), (6, 3)]

-- Period 7, original row 121, representative 3012.
def source2 : Weights.Entry :=
  { word := [0, 12, 2, 0, 1, 0, 4], weights := [0, 1, 0, 1] }

def target2 : Weights.Entry :=
  { word := [0, 1, 0, 1, 4, 10, 0], weights := [1, 0, 1, 0] }

def points2 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 124, representative 3012.
def source3 : Weights.Entry :=
  { word := [0, 12, 2, 0, 1, 0, 4], weights := [0, 1, 0, 1] }

def target3 : Weights.Entry :=
  { word := [0, 1, 0, 2, 2, 10, 0], weights := [1, 0, 0, 1] }

def points3 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 5), (4, 6), (5, 4), (6, 3)]

-- Period 7, original row 235, representative 1.
def source4 : Weights.Entry :=
  { word := [4, 0, 12, 2, 0, 2, 0], weights := [0, 1, 0, 0] }

def target4 : Weights.Entry :=
  { word := [0, 1, 12, 2, 0, 2, 0], weights := [0, 1, 0, 0] }

def points4 : List (ℕ × ℕ) := [(0, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 423, representative 1.
def source5 : Weights.Entry :=
  { word := [4, 0, 12, 2, 0, 2, 0], weights := [0, 1, 0, 0] }

def target5 : Weights.Entry :=
  { word := [0, 2, 10, 2, 0, 2, 0], weights := [1, 0, 0, 0] }

def points5 : List (ℕ × ℕ) := [(0, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6)]

-- Period 7, original row 528, representative 1.
def source6 : Weights.Entry :=
  { word := [4, 0, 12, 2, 0, 2, 0], weights := [0, 1, 0, 0] }

def target6 : Weights.Entry :=
  { word := [0, 4, 0, 4, 10, 0, 1], weights := [0, 0, 1, 0] }

def points6 : List (ℕ × ℕ) := [(0, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 540, representative 1.
def source7 : Weights.Entry :=
  { word := [4, 0, 12, 2, 0, 2, 0], weights := [0, 1, 0, 0] }

def target7 : Weights.Entry :=
  { word := [0, 4, 0, 4, 12, 4, 0], weights := [0, 0, 0, 1] }

def points7 : List (ℕ × ℕ) := [(0, 1), (2, 0), (3, 5), (4, 6), (5, 4), (6, 3)]

-- Period 7, original row 1551, representative 3012.
def source8 : Weights.Entry :=
  { word := [0, 12, 2, 0, 1, 0, 4], weights := [0, 1, 0, 1] }

def target8 : Weights.Entry :=
  { word := [0, 12, 2, 0, 1, 0, 1], weights := [0, 1, 0, 1] }

def points8 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 1601, representative 3012.
def source9 : Weights.Entry :=
  { word := [0, 12, 2, 0, 1, 0, 4], weights := [0, 1, 0, 1] }

def target9 : Weights.Entry :=
  { word := [0, 12, 4, 4, 0, 0, 1], weights := [1, 0, 0, 1] }

def points9 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6)]

-- Period 7, original row 1760, representative 1.
def source10 : Weights.Entry :=
  { word := [4, 0, 12, 2, 0, 2, 0], weights := [0, 1, 0, 0] }

def target10 : Weights.Entry :=
  { word := [1, 0, 1, 4, 10, 0, 2], weights := [0, 0, 1, 0] }

def points10 : List (ℕ × ℕ) := [(0, 2), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 1799, representative 1.
def source11 : Weights.Entry :=
  { word := [4, 0, 12, 2, 0, 2, 0], weights := [0, 1, 0, 0] }

def target11 : Weights.Entry :=
  { word := [1, 0, 2, 2, 10, 0, 2], weights := [0, 1, 0, 0] }

def points11 : List (ℕ × ℕ) := [(0, 2), (2, 0), (3, 6), (4, 4), (5, 5), (6, 3)]

-- Period 7, original row 2200, representative 3012.
def source12 : Weights.Entry :=
  { word := [0, 12, 2, 0, 1, 0, 4], weights := [0, 1, 0, 1] }

def target12 : Weights.Entry :=
  { word := [1, 12, 2, 0, 1, 0, 1], weights := [0, 1, 0, 1] }

def points12 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 2250, representative 3012.
def source13 : Weights.Entry :=
  { word := [0, 12, 2, 0, 1, 0, 4], weights := [0, 1, 0, 1] }

def target13 : Weights.Entry :=
  { word := [1, 12, 4, 4, 0, 0, 1], weights := [1, 0, 0, 1] }

def points13 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6)]

-- Period 7, original row 3504, representative 1.
def source14 : Weights.Entry :=
  { word := [4, 0, 12, 2, 0, 2, 0], weights := [0, 1, 0, 0] }

def target14 : Weights.Entry :=
  { word := [4, 0, 12, 2, 0, 1, 0], weights := [0, 1, 0, 0] }

def points14 : List (ℕ × ℕ) := [(0, 0), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 3526, representative 1.
def source15 : Weights.Entry :=
  { word := [4, 0, 12, 2, 0, 2, 0], weights := [0, 1, 0, 0] }

def target15 : Weights.Entry :=
  { word := [4, 0, 12, 4, 4, 0, 0], weights := [0, 0, 1, 0] }

def points15 : List (ℕ × ℕ) := [(0, 0), (2, 2), (3, 3), (4, 5), (5, 4), (6, 6)]

-- Period 8, original row 143, representative 3696.
def source16 : Weights.Entry :=
  { word := [0, 1, 0, 12, 0, 12, 12], weights := [1, 0, 1, 0] }

def target16 : Weights.Entry :=
  { word := [0, 1, 0, 12, 0, 12, 12], weights := [1, 0, 1, 0] }

-- Period 8, original row 224, representative 3739.
def source17 : Weights.Entry :=
  { word := [0, 1, 8, 9, 12, 12, 12], weights := [1, 0, 1, 1] }

def target17 : Weights.Entry :=
  { word := [0, 1, 8, 9, 12, 12, 12], weights := [1, 0, 1, 1] }

-- Period 8, original row 268, representative 3961.
def source18 : Weights.Entry :=
  { word := [0, 2, 10, 10, 0, 4, 10], weights := [0, 1, 1, 1] }

def target18 : Weights.Entry :=
  { word := [0, 1, 12, 10, 0, 4, 10], weights := [1, 0, 1, 1] }

def points18 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6), (7, 7)]

-- Period 8, original row 269, representative 3961.
def source19 : Weights.Entry :=
  { word := [0, 2, 10, 10, 0, 4, 10], weights := [0, 1, 1, 1] }

def target19 : Weights.Entry :=
  { word := [0, 1, 12, 10, 0, 4, 12], weights := [1, 0, 1, 1] }

def points19 : List (ℕ × ℕ) := [(0, 7), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6), (7, 0)]

-- Period 8, original row 288, representative 4329.
def source20 : Weights.Entry :=
  { word := [0, 1, 12, 10, 8, 8, 12], weights := [1, 0, 0, 1] }

def target20 : Weights.Entry :=
  { word := [0, 1, 12, 10, 8, 8, 12], weights := [1, 0, 0, 1] }

-- Period 8, original row 302, representative 3696.
def source21 : Weights.Entry :=
  { word := [0, 1, 0, 12, 0, 12, 12], weights := [1, 0, 1, 0] }

def target21 : Weights.Entry :=
  { word := [0, 2, 0, 8, 1, 12, 12], weights := [0, 1, 1, 0] }

def points21 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6), (7, 7)]

-- Period 8, original row 469, representative 3961.
def source22 : Weights.Entry :=
  { word := [0, 2, 10, 10, 0, 4, 10], weights := [0, 1, 1, 1] }

def target22 : Weights.Entry :=
  { word := [0, 2, 10, 10, 0, 4, 10], weights := [0, 1, 1, 1] }

-- Period 8, original row 470, representative 3961.
def source23 : Weights.Entry :=
  { word := [0, 2, 10, 10, 0, 4, 10], weights := [0, 1, 1, 1] }

def target23 : Weights.Entry :=
  { word := [0, 2, 10, 10, 0, 4, 12], weights := [0, 1, 1, 1] }

def points23 : List (ℕ × ℕ) := [(0, 7), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 0)]

-- Period 8, original row 529, representative 1.
def source24 : Weights.Entry :=
  { word := [4, 0, 12, 2, 0, 2, 0], weights := [0, 1, 0, 0] }

def target24 : Weights.Entry :=
  { word := [0, 4, 0, 4, 10, 0, 2], weights := [0, 0, 1, 0] }

def points24 : List (ℕ × ℕ) := [(0, 1), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 8, original row 1552, representative 3012.
def source25 : Weights.Entry :=
  { word := [0, 12, 2, 0, 1, 0, 4], weights := [0, 1, 0, 1] }

def target25 : Weights.Entry :=
  { word := [0, 12, 2, 0, 1, 0, 2], weights := [0, 1, 0, 1] }

def points25 : List (ℕ × ℕ) := [(0, 7), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 8, original row 1553, representative 3012.
def source26 : Weights.Entry :=
  { word := [0, 12, 2, 0, 1, 0, 4], weights := [0, 1, 0, 1] }

def target26 : Weights.Entry :=
  { word := [0, 12, 2, 0, 1, 0, 4], weights := [0, 1, 0, 1] }

-- Period 8, original row 1602, representative 3012.
def source27 : Weights.Entry :=
  { word := [0, 12, 2, 0, 1, 0, 4], weights := [0, 1, 0, 1] }

def target27 : Weights.Entry :=
  { word := [0, 12, 4, 4, 0, 0, 2], weights := [1, 0, 0, 1] }

def points27 : List (ℕ × ℕ) := [(0, 7), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6)]

-- Period 8, original row 1603, representative 3012.
def source28 : Weights.Entry :=
  { word := [0, 12, 2, 0, 1, 0, 4], weights := [0, 1, 0, 1] }

def target28 : Weights.Entry :=
  { word := [0, 12, 4, 4, 0, 0, 4], weights := [1, 0, 0, 1] }

def points28 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6)]

-- Period 8, original row 2201, representative 3012.
def source29 : Weights.Entry :=
  { word := [0, 12, 2, 0, 1, 0, 4], weights := [0, 1, 0, 1] }

def target29 : Weights.Entry :=
  { word := [1, 12, 2, 0, 1, 0, 2], weights := [0, 1, 0, 1] }

def points29 : List (ℕ × ℕ) := [(0, 7), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 8, original row 2202, representative 3012.
def source30 : Weights.Entry :=
  { word := [0, 12, 2, 0, 1, 0, 4], weights := [0, 1, 0, 1] }

def target30 : Weights.Entry :=
  { word := [1, 12, 2, 0, 1, 0, 4], weights := [0, 1, 0, 1] }

def points30 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 8, original row 2251, representative 3012.
def source31 : Weights.Entry :=
  { word := [0, 12, 2, 0, 1, 0, 4], weights := [0, 1, 0, 1] }

def target31 : Weights.Entry :=
  { word := [1, 12, 4, 4, 0, 0, 2], weights := [1, 0, 0, 1] }

def points31 : List (ℕ × ℕ) := [(0, 7), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6)]

-- Period 8, original row 2252, representative 3012.
def source32 : Weights.Entry :=
  { word := [0, 12, 2, 0, 1, 0, 4], weights := [0, 1, 0, 1] }

def target32 : Weights.Entry :=
  { word := [1, 12, 4, 4, 0, 0, 4], weights := [1, 0, 0, 1] }

def points32 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6)]

-- Period 8, original row 2382, representative 3012.
def source33 : Weights.Entry :=
  { word := [0, 12, 2, 0, 1, 0, 4], weights := [0, 1, 0, 1] }

def target33 : Weights.Entry :=
  { word := [2, 0, 0, 1, 4, 10, 0], weights := [1, 0, 1, 0] }

def points33 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 8, original row 2385, representative 3012.
def source34 : Weights.Entry :=
  { word := [0, 12, 2, 0, 1, 0, 4], weights := [0, 1, 0, 1] }

def target34 : Weights.Entry :=
  { word := [2, 0, 0, 2, 2, 10, 0], weights := [1, 0, 0, 1] }

def points34 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 5), (4, 6), (5, 4), (6, 3)]

-- Period 8, original row 2629, representative 5450.
def source35 : Weights.Entry :=
  { word := [4, 0, 4, 10, 0, 4, 8], weights := [1, 0, 2, 1] }

def target35 : Weights.Entry :=
  { word := [2, 2, 2, 8, 1, 0, 8], weights := [2, 1, 0, 1] }

def points35 : List (ℕ × ℕ) := [(0, 1), (1, 7), (2, 2), (3, 4), (4, 5), (5, 3), (6, 6), (7, 0)]

-- Period 8, original row 3392, representative 3012.
def source36 : Weights.Entry :=
  { word := [0, 12, 2, 0, 1, 0, 4], weights := [0, 1, 0, 1] }

def target36 : Weights.Entry :=
  { word := [4, 0, 0, 1, 4, 10, 0], weights := [1, 0, 1, 0] }

def points36 : List (ℕ × ℕ) := [(0, 2), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 8, original row 3395, representative 3012.
def source37 : Weights.Entry :=
  { word := [0, 12, 2, 0, 1, 0, 4], weights := [0, 1, 0, 1] }

def target37 : Weights.Entry :=
  { word := [4, 0, 0, 2, 2, 10, 0], weights := [1, 0, 0, 1] }

def points37 : List (ℕ × ℕ) := [(0, 2), (1, 0), (2, 7), (3, 5), (4, 6), (5, 4), (6, 3)]

-- Period 8, original row 3447, representative 5450.
def source38 : Weights.Entry :=
  { word := [4, 0, 4, 10, 0, 4, 8], weights := [1, 0, 2, 1] }

def target38 : Weights.Entry :=
  { word := [4, 0, 4, 10, 0, 4, 8], weights := [1, 0, 2, 1] }

-- Period 8, original row 3506, representative 1.
def source39 : Weights.Entry :=
  { word := [4, 0, 12, 2, 0, 2, 0], weights := [0, 1, 0, 0] }

def target39 : Weights.Entry :=
  { word := [4, 0, 12, 2, 0, 2, 0], weights := [0, 1, 0, 0] }

-- Period 8, original row 4105, representative 5450.
def source40 : Weights.Entry :=
  { word := [4, 0, 4, 10, 0, 4, 8], weights := [1, 0, 2, 1] }

def target40 : Weights.Entry :=
  { word := [8, 0, 0, 9, 4, 4, 4], weights := [1, 0, 1, 2] }

def points40 : List (ℕ × ℕ) := [(0, 0), (1, 2), (2, 7), (3, 5), (4, 4), (5, 6), (6, 3), (7, 1)]

-- Period 8, original row 4744, representative 5450.
def source41 : Weights.Entry :=
  { word := [4, 0, 4, 10, 0, 4, 8], weights := [1, 0, 2, 1] }

def target41 : Weights.Entry :=
  { word := [8, 2, 0, 12, 2, 0, 2], weights := [1, 2, 0, 1] }

def points41 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 6030, representative 3579.
def source42 : Weights.Entry :=
  { word := [8, 9, 8, 9, 12, 12, 12], weights := [1, 1, 1, 1] }

def target42 : Weights.Entry :=
  { word := [8, 9, 8, 9, 12, 12, 12], weights := [1, 1, 1, 1] }

-- Period 8, original row 6279, representative 3718.
def source43 : Weights.Entry :=
  { word := [8, 10, 8, 10, 8, 12, 12], weights := [0, 3, 0, 1] }

def target43 : Weights.Entry :=
  { word := [8, 10, 8, 10, 8, 12, 12], weights := [0, 3, 0, 1] }

-- Period 8, original row 7631, representative 3961.
def source44 : Weights.Entry :=
  { word := [0, 2, 10, 10, 0, 4, 10], weights := [0, 1, 1, 1] }

def target44 : Weights.Entry :=
  { word := [10, 2, 0, 12, 10, 0, 1], weights := [1, 1, 0, 1] }

def points44 : List (ℕ × ℕ) := [(0, 2), (1, 0), (2, 7), (3, 5), (4, 6), (5, 4), (6, 3), (7, 1)]

-- Period 8, original row 7638, representative 3961.
def source45 : Weights.Entry :=
  { word := [0, 2, 10, 10, 0, 4, 10], weights := [0, 1, 1, 1] }

def target45 : Weights.Entry :=
  { word := [10, 2, 0, 12, 12, 4, 0], weights := [1, 1, 1, 0] }

def points45 : List (ℕ × ℕ) := [(0, 2), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1)]

-- Period 8, original row 7962, representative 3345.
def source46 : Weights.Entry :=
  { word := [10, 8, 4, 10, 8, 12, 12], weights := [2, 2, 1, 3] }

def target46 : Weights.Entry :=
  { word := [10, 8, 4, 10, 8, 12, 12], weights := [2, 2, 1, 3] }

-- Period 8, original row 8086, representative 4329.
def source47 : Weights.Entry :=
  { word := [0, 1, 12, 10, 8, 8, 12], weights := [1, 0, 0, 1] }

def target47 : Weights.Entry :=
  { word := [10, 8, 8, 12, 10, 0, 1], weights := [1, 0, 0, 1] }

def points47 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 8117, representative 3340.
def source48 : Weights.Entry :=
  { word := [10, 10, 8, 9, 8, 9, 12], weights := [1, 1, 0, 1] }

def target48 : Weights.Entry :=
  { word := [10, 8, 9, 8, 9, 12, 12], weights := [1, 0, 1, 1] }

def points48 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 8172, representative 3344.
def source49 : Weights.Entry :=
  { word := [10, 8, 12, 10, 8, 12, 12], weights := [2, 1, 1, 2] }

def target49 : Weights.Entry :=
  { word := [10, 8, 12, 10, 8, 12, 12], weights := [2, 1, 1, 2] }

-- Period 8, original row 8185, representative 3696.
def source50 : Weights.Entry :=
  { word := [0, 1, 0, 12, 0, 12, 12], weights := [1, 0, 1, 0] }

def target50 : Weights.Entry :=
  { word := [10, 10, 0, 9, 0, 4, 0], weights := [0, 1, 1, 0] }

def points50 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 5), (4, 6), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 8201, representative 3696.
def source51 : Weights.Entry :=
  { word := [0, 1, 0, 12, 0, 12, 12], weights := [1, 0, 1, 0] }

def target51 : Weights.Entry :=
  { word := [10, 10, 0, 10, 0, 0, 1], weights := [0, 1, 0, 1] }

def points51 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 8307, representative 3340.
def source52 : Weights.Entry :=
  { word := [10, 10, 8, 9, 8, 9, 12], weights := [1, 1, 0, 1] }

def target52 : Weights.Entry :=
  { word := [10, 10, 8, 9, 8, 9, 12], weights := [1, 1, 0, 1] }

-- Period 8, original row 8351, representative 3345.
def source53 : Weights.Entry :=
  { word := [10, 8, 4, 10, 8, 12, 12], weights := [2, 2, 1, 3] }

def target53 : Weights.Entry :=
  { word := [10, 10, 8, 12, 2, 8, 12], weights := [3, 1, 2, 2] }

def points53 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 8360, representative 3718.
def source54 : Weights.Entry :=
  { word := [8, 10, 8, 10, 8, 12, 12], weights := [0, 3, 0, 1] }

def target54 : Weights.Entry :=
  { word := [10, 10, 8, 12, 8, 12, 8], weights := [1, 0, 3, 0] }

def points54 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 8361, representative 3518.
def source55 : Weights.Entry :=
  { word := [10, 10, 8, 12, 8, 12, 10], weights := [2, 1, 2, 1] }

def target55 : Weights.Entry :=
  { word := [10, 10, 8, 12, 8, 12, 10], weights := [2, 1, 2, 1] }

-- Period 8, original row 8373, representative 3344.
def source56 : Weights.Entry :=
  { word := [10, 8, 12, 10, 8, 12, 12], weights := [2, 1, 1, 2] }

def target56 : Weights.Entry :=
  { word := [10, 10, 8, 12, 10, 8, 12], weights := [2, 1, 1, 2] }

def points56 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 8392, representative 3739.
def source57 : Weights.Entry :=
  { word := [0, 1, 8, 9, 12, 12, 12], weights := [1, 0, 1, 1] }

def target57 : Weights.Entry :=
  { word := [10, 10, 10, 8, 9, 0, 1], weights := [1, 1, 0, 1] }

def points57 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 8401, representative 3579.
def source58 : Weights.Entry :=
  { word := [8, 9, 8, 9, 12, 12, 12], weights := [1, 1, 1, 1] }

def target58 : Weights.Entry :=
  { word := [10, 10, 10, 8, 9, 8, 9], weights := [1, 1, 1, 1] }

def points58 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 8613, representative 3961.
def source59 : Weights.Entry :=
  { word := [0, 2, 10, 10, 0, 4, 10], weights := [0, 1, 1, 1] }

def target59 : Weights.Entry :=
  { word := [12, 2, 0, 12, 10, 0, 1], weights := [1, 1, 0, 1] }

def points59 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 5), (4, 6), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 8620, representative 3961.
def source60 : Weights.Entry :=
  { word := [0, 2, 10, 10, 0, 4, 10], weights := [0, 1, 1, 1] }

def target60 : Weights.Entry :=
  { word := [12, 2, 0, 12, 12, 4, 0], weights := [1, 1, 1, 0] }

def points60 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 9045, representative 3518.
def source61 : Weights.Entry :=
  { word := [10, 10, 8, 12, 8, 12, 10], weights := [2, 1, 2, 1] }

def target61 : Weights.Entry :=
  { word := [12, 10, 8, 10, 8, 12, 12], weights := [1, 2, 1, 2] }

def points61 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 9082, representative 4495.
def source62 : Weights.Entry :=
  { word := [12, 12, 12, 8, 8, 10, 10], weights := [0, 1, 1, 0] }

def target62 : Weights.Entry :=
  { word := [12, 12, 8, 8, 10, 10, 10], weights := [0, 1, 1, 0] }

def points62 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 9087, representative 4495.
def source63 : Weights.Entry :=
  { word := [12, 12, 12, 8, 8, 10, 10], weights := [0, 1, 1, 0] }

def target63 : Weights.Entry :=
  { word := [12, 12, 12, 8, 8, 10, 10], weights := [0, 1, 1, 0] }

-- Period 9, original row 2404, representative 3696.
def source64 : Weights.Entry :=
  { word := [0, 1, 0, 12, 0, 12, 12], weights := [1, 0, 1, 0] }

def target64 : Weights.Entry :=
  { word := [2, 0, 0, 12, 0, 12, 12], weights := [1, 0, 1, 0] }

def points64 : List (ℕ × ℕ) := [(0, 8), (1, 0), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 9, original row 3414, representative 3696.
def source65 : Weights.Entry :=
  { word := [0, 1, 0, 12, 0, 12, 12], weights := [1, 0, 1, 0] }

def target65 : Weights.Entry :=
  { word := [4, 0, 0, 12, 0, 12, 12], weights := [1, 0, 1, 0] }

def points65 : List (ℕ × ℕ) := [(0, 8), (1, 0), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 9, original row 3495, representative 3739.
def source66 : Weights.Entry :=
  { word := [0, 1, 8, 9, 12, 12, 12], weights := [1, 0, 1, 1] }

def target66 : Weights.Entry :=
  { word := [4, 0, 8, 9, 12, 12, 12], weights := [1, 0, 1, 1] }

def points66 : List (ℕ × ℕ) := [(0, 8), (1, 0), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 9, original row 3539, representative 3961.
def source67 : Weights.Entry :=
  { word := [0, 2, 10, 10, 0, 4, 10], weights := [0, 1, 1, 1] }

def target67 : Weights.Entry :=
  { word := [4, 0, 12, 10, 0, 4, 10], weights := [1, 0, 1, 1] }

def points67 : List (ℕ × ℕ) := [(0, 8), (1, 0), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6), (7, 7)]

-- Period 9, original row 3540, representative 3961.
def source68 : Weights.Entry :=
  { word := [0, 2, 10, 10, 0, 4, 10], weights := [0, 1, 1, 1] }

def target68 : Weights.Entry :=
  { word := [4, 0, 12, 10, 0, 4, 12], weights := [1, 0, 1, 1] }

def points68 : List (ℕ × ℕ) := [(0, 7), (1, 0), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6), (7, 8)]

-- Period 9, original row 3559, representative 4329.
def source69 : Weights.Entry :=
  { word := [0, 1, 12, 10, 8, 8, 12], weights := [1, 0, 0, 1] }

def target69 : Weights.Entry :=
  { word := [4, 0, 12, 10, 8, 8, 12], weights := [1, 0, 0, 1] }

def points69 : List (ℕ × ℕ) := [(0, 8), (1, 0), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 9, original row 7632, representative 3961.
def source70 : Weights.Entry :=
  { word := [0, 2, 10, 10, 0, 4, 10], weights := [0, 1, 1, 1] }

def target70 : Weights.Entry :=
  { word := [10, 2, 0, 12, 10, 0, 2], weights := [1, 1, 0, 1] }

def points70 : List (ℕ × ℕ) := [(0, 2), (1, 0), (2, 7), (3, 5), (4, 6), (5, 4), (6, 3), (7, 1)]

-- Period 9, original row 8087, representative 4329.
def source71 : Weights.Entry :=
  { word := [0, 1, 12, 10, 8, 8, 12], weights := [1, 0, 0, 1] }

def target71 : Weights.Entry :=
  { word := [10, 8, 8, 12, 10, 0, 2], weights := [1, 0, 0, 1] }

def points71 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 9, original row 8202, representative 3696.
def source72 : Weights.Entry :=
  { word := [0, 1, 0, 12, 0, 12, 12], weights := [1, 0, 1, 0] }

def target72 : Weights.Entry :=
  { word := [10, 10, 0, 10, 0, 0, 2], weights := [0, 1, 0, 1] }

def points72 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 9, original row 8203, representative 3696.
def source73 : Weights.Entry :=
  { word := [0, 1, 0, 12, 0, 12, 12], weights := [1, 0, 1, 0] }

def target73 : Weights.Entry :=
  { word := [10, 10, 0, 10, 0, 0, 4], weights := [0, 1, 0, 1] }

def points73 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 9, original row 8393, representative 3739.
def source74 : Weights.Entry :=
  { word := [0, 1, 8, 9, 12, 12, 12], weights := [1, 0, 1, 1] }

def target74 : Weights.Entry :=
  { word := [10, 10, 10, 8, 9, 0, 2], weights := [1, 1, 0, 1] }

def points74 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 9, original row 8614, representative 3961.
def source75 : Weights.Entry :=
  { word := [0, 2, 10, 10, 0, 4, 10], weights := [0, 1, 1, 1] }

def target75 : Weights.Entry :=
  { word := [12, 2, 0, 12, 10, 0, 2], weights := [1, 1, 0, 1] }

def points75 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 5), (4, 6), (5, 4), (6, 3), (7, 2)]

def period7Entries : List Weights.Entry := [target0, target1, target2, target3, target4, target5, target6, target7, target8, target9, target10, target11, target12, target13, target14, target15]

def period7Chunk : RowCoverage.Chunk where
  rows := [⟨23, target0⟩, ⟨62, target1⟩, ⟨121, target2⟩, ⟨124, target3⟩, ⟨235, target4⟩, ⟨423, target5⟩, ⟨528, target6⟩, ⟨540, target7⟩, ⟨1551, target8⟩, ⟨1601, target9⟩, ⟨1760, target10⟩, ⟨1799, target11⟩, ⟨2200, target12⟩, ⟨2250, target13⟩, ⟨3504, target14⟩, ⟨3526, target15⟩]
  indexMask := 270249447493901739136316538883603934810337390352120262633890170557126403108951779701587675044918027399090983423676445419199679110907090941198368472177877625660467331793712917299143219224851568358843407645960693714085893159794459059622724061588260066259855270345250453815872919778296832491605416373575131678171599513065086396931229824802645646665699080241811639015908192637104161875001325404719004480886806699911255518501815192376925249105096470850522202115523684644331076598387891744237424170119413503235776058518452014421839932183205369533545537211405177128625339879219853385871163344498221365174332394066575589194150839646931663346652167416085750351500845315136236542326987865292624665056176564342498033606217987670017653133418585997571808663941676602108595458098241464158338963678862923326504540260836915702017559936400024008883553865393357176005100091937420751312114445219282324166901771404077790612000269411067569600931641328366555318207871439728658321217205090412578747313459127923035602462290573693936330725459612231831020495772914732669846346312955461632
  count := 16

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

def period8Entries : List Weights.Entry := [target16, target17, target18, target19, target20, target21, target22, target23, target24, target25, target26, target27, target28, target29, target30, target31, target32, target33, target34, target35, target36, target37, target38, target39, target40, target41, target42, target43, target44, target45, target46, target47, target48, target49, target50, target51, target52, target53, target54, target55, target56, target57, target58, target59, target60, target61, target62, target63]

def period8Chunk : RowCoverage.Chunk where
  rows := [⟨143, target16⟩, ⟨224, target17⟩, ⟨268, target18⟩, ⟨269, target19⟩, ⟨288, target20⟩, ⟨302, target21⟩, ⟨469, target22⟩, ⟨470, target23⟩, ⟨529, target24⟩, ⟨1552, target25⟩, ⟨1553, target26⟩, ⟨1602, target27⟩, ⟨1603, target28⟩, ⟨2201, target29⟩, ⟨2202, target30⟩, ⟨2251, target31⟩, ⟨2252, target32⟩, ⟨2382, target33⟩, ⟨2385, target34⟩, ⟨2629, target35⟩, ⟨3392, target36⟩, ⟨3395, target37⟩, ⟨3447, target38⟩, ⟨3506, target39⟩, ⟨4105, target40⟩, ⟨4744, target41⟩, ⟨6030, target42⟩, ⟨6279, target43⟩, ⟨7631, target44⟩, ⟨7638, target45⟩, ⟨7962, target46⟩, ⟨8086, target47⟩, ⟨8117, target48⟩, ⟨8172, target49⟩, ⟨8185, target50⟩, ⟨8201, target51⟩, ⟨8307, target52⟩, ⟨8351, target53⟩, ⟨8360, target54⟩, ⟨8361, target55⟩, ⟨8373, target56⟩, ⟨8392, target57⟩, ⟨8401, target58⟩, ⟨8613, target59⟩, ⟨8620, target60⟩, ⟨9045, target61⟩, ⟨9082, target62⟩, ⟨9087, target63⟩]
  indexMask := 297121829242366939647567124925974196758596332099794864057942772782097169226905995684982018607124479882451151128509804964127510113720238126809557796796428450670726643765822607447046919998784007826480360342145528452229280733897653680595086263556636847657512615918825797256914088564295675388265915105086968886113388129820344800719878579924375387573644015483552284215449681345564583555394652677717179844811411546106852025228213847705051608047848157421575415159932571396455388165947321442776569876389558055021566603774506213877420384185699586616105507025742471175630684089275167370530591776318238759229023914894129922374796400686628722615567783062159844707498691281647484792141152449690434665170193936568074291325417451006698831311774441122217333804163872502552837182661158925446221045378765487982625715541034356240070840639543008842805212711510173419191213779222126867184506518528885366944099314297976485628190893027509095224233120774790027317642576791286809783721977025665529260018212284974377754975704398894408930124561656330544229692268199803934368125888883215993792430966273704841127014980651468172221771587684484836200341108193634251290203194825893379079585054041388220683642710860510907572417205835065158164731379942484273932663936710836667336349062249603074030884341124200761020287846558651734044479942240355914482729118286170742626540173044538754344994906018216459563353902709663162067767385860965895864974074531454173395430530394044417428768503888249149709716296505222570229555963639892215645255036405291292531267231101592637610572046608127885688247578310452586123882061010100376704816040551108124779001022906752611378590415904588730656506895533415937441266462638038361721275925797944749515034697888490019104022191888353982647193402633354319341532108502382765018974085210508875102443807516865731310030952020509786617338352113044723617461746388387871140591040928832554951319799144567836558091240525484834803371319327508313085933054704180003129494533278084831764224077643088673686226381917804100422564893330100136226256791289495852277125743663962992341160959293715731859603676193833705459125772835967846720203406957387356847928006987591069863704723813531356922727752863868277275549039547808380042711992685831320517213923110263329350828394080255777853561784084152118361042814758355785512903410793009229927717787177590724845826880711308195715837424002075381996872769100804640879445327684072410734699263946830195877530597749800994320917248950788240337047129345285627183334135473351404200153541099253763106965093267770546217795178516220104174910853661333225796433513888618847455875889029847186092521104221603857542478855123299560192832185477690997245240739063009078746057361381493264828741197020075708640987917001646906714296510947786752
  count := 48

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

def period9Entries : List Weights.Entry := [target64, target65, target66, target67, target68, target69, target70, target71, target72, target73, target74, target75]

def period9Chunk : RowCoverage.Chunk where
  rows := [⟨2404, target64⟩, ⟨3414, target65⟩, ⟨3495, target66⟩, ⟨3539, target67⟩, ⟨3540, target68⟩, ⟨3559, target69⟩, ⟨7632, target70⟩, ⟨8087, target71⟩, ⟨8202, target72⟩, ⟨8203, target73⟩, ⟨8393, target74⟩, ⟨8614, target75⟩]
  indexMask := 11813610545120058782980995766887333242544355079004783933409236892254252130109963877161165090592778675448524233101597010383706628958916929474246599033555950932757438221146381830833908575931547300437391253232987691306249462213197925520962661274172939230872709371684438930559759073087490522472982469374691300228994886989473099347784223196036027729794168643751488064807099307485477129323553083794870603349038731809500295719632041744127548485397484738735970299458116053465714686615941919969301186904383740582292924898335804324790868467878487375634698089347955147612457119744125486861520169082709337108664779376812581041609429078899261785001556249886188582242099264290469677769857140335900624895502522914337376453210426781309765158436035051587617615030624430475586341360232889254521718023575848316026019956963111007727803218030886750072049884905299982152242978367465395963282570004422836693829245177034208834932445000534360558927340891961455108909977779954947793195570357329342058194811633252550775510002026990223051938677071083662239189666077878428436674237109053117624503047750565164100625976814801922893783788894116914932151597291761233858892168245249271826524054100289264913004189083813525265366303141604222225278891213036305917423461784458024855662592519163084059865199978239036197684979823464009633758979559635347748778236261371618907406003441414505889184028323308116628097306749281749172049120106333834884476987463275807435570019893149365523346432022061822345621567358026827483059870044271878648421603138805793617652668298172478546379347750470208530049068618113173651797460594620308582909859768343017843738464412392317488784669952025377818556500800080286169043855839227019091630756892746222640618395906689440681237118543228078972807690894593782546713764521564027500279081664455766079099683135916494614909102167358868938824599566962781890900036189524830218207095229778220662981132664018210819650682578706994941037021315799995934434677323814147760801156136457624411508381607952301956864703512612948299269869029691490567660211602204696466383736869499102795551450573937221742881495066205679053416733525896375083087406957951654307348266499226946811232800389168381385435521593779776479188018279958028792373356049441302610147616090552968613573260143457010267891022198317058666618103655237572412768962283909555127424935670230489783836929419830661687749925193609368162083277876235198039407897951707386834654934229205359972989155045155303155894439178698330443632532150656552610323818193846631769164002044504909714309223141106902575731195446174307106672212930559997256653134180713480637614694821875679232
  count := 12

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

end FranklSmallCyclic.TransportBatches.G076.B000.Data
