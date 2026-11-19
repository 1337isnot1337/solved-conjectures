module

public import Conjectures.FranklSmallCyclicRowCoverage
public import Conjectures.FranklSmallCyclicCanonicalWords
public import Conjectures.FranklSmallCyclicWeightsPilotData

/-! 128 literal targets sharing one source proof block.
Original words and row indices are retained; weights may be transported.
-/
@[expose] public section

namespace FranklSmallCyclic.TransportBatches.G075.B000.Data

-- Period 7, original row 0, representative 3057.
def source0 : Weights.Entry :=
  { word := [0, 0, 1, 4, 2, 0, 1], weights := [0, 0, 1, 0] }

def target0 : Weights.Entry :=
  { word := [0, 0, 1, 4, 2, 0, 1], weights := [0, 0, 1, 0] }

-- Period 7, original row 2, representative 3057.
def source1 : Weights.Entry :=
  { word := [0, 0, 1, 4, 2, 0, 1], weights := [0, 0, 1, 0] }

def target1 : Weights.Entry :=
  { word := [0, 0, 1, 4, 2, 0, 4], weights := [1, 0, 0, 0] }

def points1 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 5), (4, 4), (5, 3), (6, 6)]

-- Period 7, original row 12, representative 3057.
def source2 : Weights.Entry :=
  { word := [0, 0, 1, 4, 2, 0, 1], weights := [0, 0, 1, 0] }

def target2 : Weights.Entry :=
  { word := [0, 0, 1, 4, 4, 4, 0], weights := [0, 0, 0, 1] }

def points2 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 6), (6, 5)]

-- Period 7, original row 22, representative 3026.
def source3 : Weights.Entry :=
  { word := [4, 0, 12, 2, 0, 2, 0], weights := [0, 1, 0, 0] }

def target3 : Weights.Entry :=
  { word := [0, 0, 1, 4, 10, 0, 1], weights := [0, 0, 1, 0] }

def points3 : List (ℕ × ℕ) := [(0, 1), (1, 2), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 34, representative 3026.
def source4 : Weights.Entry :=
  { word := [4, 0, 12, 2, 0, 2, 0], weights := [0, 1, 0, 0] }

def target4 : Weights.Entry :=
  { word := [0, 0, 1, 4, 12, 4, 0], weights := [0, 0, 0, 1] }

def points4 : List (ℕ × ℕ) := [(0, 1), (1, 2), (2, 0), (3, 5), (4, 6), (5, 4), (6, 3)]

-- Period 7, original row 46, representative 3057.
def source5 : Weights.Entry :=
  { word := [0, 0, 1, 4, 2, 0, 1], weights := [0, 0, 1, 0] }

def target5 : Weights.Entry :=
  { word := [0, 0, 2, 2, 2, 0, 1], weights := [0, 1, 0, 0] }

def points5 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 5), (5, 4), (6, 6)]

-- Period 7, original row 48, representative 3057.
def source6 : Weights.Entry :=
  { word := [0, 0, 1, 4, 2, 0, 1], weights := [0, 0, 1, 0] }

def target6 : Weights.Entry :=
  { word := [0, 0, 2, 2, 2, 0, 4], weights := [1, 0, 0, 0] }

def points6 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 4), (4, 5), (5, 3), (6, 6)]

-- Period 7, original row 61, representative 3026.
def source7 : Weights.Entry :=
  { word := [4, 0, 12, 2, 0, 2, 0], weights := [0, 1, 0, 0] }

def target7 : Weights.Entry :=
  { word := [0, 0, 2, 2, 10, 0, 1], weights := [0, 1, 0, 0] }

def points7 : List (ℕ × ℕ) := [(0, 1), (1, 2), (2, 0), (3, 6), (4, 4), (5, 5), (6, 3)]

-- Period 7, original row 120, representative 3057.
def source8 : Weights.Entry :=
  { word := [0, 0, 1, 4, 2, 0, 1], weights := [0, 0, 1, 0] }

def target8 : Weights.Entry :=
  { word := [0, 1, 0, 1, 4, 2, 0], weights := [0, 0, 1, 0] }

def points8 : List (ℕ × ℕ) := [(0, 1), (1, 2), (2, 0), (3, 4), (4, 6), (5, 5), (6, 3)]

-- Period 7, original row 122, representative 3057.
def source9 : Weights.Entry :=
  { word := [0, 0, 1, 4, 2, 0, 1], weights := [0, 0, 1, 0] }

def target9 : Weights.Entry :=
  { word := [0, 1, 0, 2, 2, 2, 0], weights := [0, 0, 0, 1] }

def points9 : List (ℕ × ℕ) := [(0, 1), (1, 2), (2, 0), (3, 4), (4, 5), (5, 6), (6, 3)]

-- Period 7, original row 143, representative 182.
def source10 : Weights.Entry :=
  { word := [0, 1, 0, 12, 0, 12, 12], weights := [1, 0, 1, 0] }

def target10 : Weights.Entry :=
  { word := [0, 1, 0, 12, 0, 12, 12], weights := [1, 0, 1, 0] }

-- Period 7, original row 144, representative 3057.
def source11 : Weights.Entry :=
  { word := [0, 0, 1, 4, 2, 0, 1], weights := [0, 0, 1, 0] }

def target11 : Weights.Entry :=
  { word := [0, 1, 4, 2, 0, 1, 0], weights := [0, 1, 0, 0] }

def points11 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 166, representative 3057.
def source12 : Weights.Entry :=
  { word := [0, 0, 1, 4, 2, 0, 1], weights := [0, 0, 1, 0] }

def target12 : Weights.Entry :=
  { word := [0, 1, 4, 4, 4, 0, 0], weights := [0, 0, 1, 0] }

def points12 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 4), (5, 5), (6, 3)]

-- Period 7, original row 176, representative 2161.
def source13 : Weights.Entry :=
  { word := [4, 0, 4, 10, 0, 4, 8], weights := [1, 0, 2, 1] }

def target13 : Weights.Entry :=
  { word := [0, 1, 4, 10, 0, 4, 8], weights := [1, 0, 2, 1] }

def points13 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 224, representative 213.
def source14 : Weights.Entry :=
  { word := [0, 1, 8, 9, 12, 12, 12], weights := [1, 0, 1, 1] }

def target14 : Weights.Entry :=
  { word := [0, 1, 8, 9, 12, 12, 12], weights := [1, 0, 1, 1] }

-- Period 7, original row 233, representative 3026.
def source15 : Weights.Entry :=
  { word := [4, 0, 12, 2, 0, 2, 0], weights := [0, 1, 0, 0] }

def target15 : Weights.Entry :=
  { word := [0, 1, 12, 2, 0, 1, 0], weights := [0, 1, 0, 0] }

def points15 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 255, representative 3026.
def source16 : Weights.Entry :=
  { word := [4, 0, 12, 2, 0, 2, 0], weights := [0, 1, 0, 0] }

def target16 : Weights.Entry :=
  { word := [0, 1, 12, 4, 4, 0, 0], weights := [0, 0, 1, 0] }

def points16 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 2), (3, 3), (4, 5), (5, 4), (6, 6)]

-- Period 7, original row 268, representative 805.
def source17 : Weights.Entry :=
  { word := [0, 2, 10, 10, 0, 4, 10], weights := [0, 1, 1, 1] }

def target17 : Weights.Entry :=
  { word := [0, 1, 12, 10, 0, 4, 10], weights := [1, 0, 1, 1] }

def points17 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6)]

-- Period 7, original row 288, representative 469.
def source18 : Weights.Entry :=
  { word := [0, 1, 12, 10, 8, 8, 12], weights := [1, 0, 0, 1] }

def target18 : Weights.Entry :=
  { word := [0, 1, 12, 10, 8, 8, 12], weights := [1, 0, 0, 1] }

-- Period 7, original row 302, representative 182.
def source19 : Weights.Entry :=
  { word := [0, 1, 0, 12, 0, 12, 12], weights := [1, 0, 1, 0] }

def target19 : Weights.Entry :=
  { word := [0, 2, 0, 8, 1, 12, 12], weights := [0, 1, 1, 0] }

def points19 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6)]

-- Period 7, original row 316, representative 3057.
def source20 : Weights.Entry :=
  { word := [0, 0, 1, 4, 2, 0, 1], weights := [0, 0, 1, 0] }

def target20 : Weights.Entry :=
  { word := [0, 2, 2, 2, 0, 1, 0], weights := [1, 0, 0, 0] }

def points20 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 3), (6, 4)]

-- Period 7, original row 368, representative 2161.
def source21 : Weights.Entry :=
  { word := [4, 0, 4, 10, 0, 4, 8], weights := [1, 0, 2, 1] }

def target21 : Weights.Entry :=
  { word := [0, 2, 2, 10, 0, 4, 8], weights := [0, 1, 2, 1] }

def points21 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6)]

-- Period 7, original row 421, representative 3026.
def source22 : Weights.Entry :=
  { word := [4, 0, 12, 2, 0, 2, 0], weights := [0, 1, 0, 0] }

def target22 : Weights.Entry :=
  { word := [0, 2, 10, 2, 0, 1, 0], weights := [1, 0, 0, 0] }

def points22 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6)]

-- Period 7, original row 469, representative 805.
def source23 : Weights.Entry :=
  { word := [0, 2, 10, 10, 0, 4, 10], weights := [0, 1, 1, 1] }

def target23 : Weights.Entry :=
  { word := [0, 2, 10, 10, 0, 4, 10], weights := [0, 1, 1, 1] }

-- Period 7, original row 507, representative 3057.
def source24 : Weights.Entry :=
  { word := [0, 0, 1, 4, 2, 0, 1], weights := [0, 0, 1, 0] }

def target24 : Weights.Entry :=
  { word := [0, 4, 0, 4, 2, 0, 2], weights := [0, 0, 1, 0] }

def points24 : List (ℕ × ℕ) := [(0, 0), (1, 2), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 508, representative 3057.
def source25 : Weights.Entry :=
  { word := [0, 0, 1, 4, 2, 0, 1], weights := [0, 0, 1, 0] }

def target25 : Weights.Entry :=
  { word := [0, 4, 0, 4, 2, 0, 4], weights := [1, 0, 0, 0] }

def points25 : List (ℕ × ℕ) := [(0, 1), (1, 2), (2, 0), (3, 5), (4, 4), (5, 3), (6, 6)]

-- Period 7, original row 529, representative 3026.
def source26 : Weights.Entry :=
  { word := [4, 0, 12, 2, 0, 2, 0], weights := [0, 1, 0, 0] }

def target26 : Weights.Entry :=
  { word := [0, 4, 0, 4, 10, 0, 2], weights := [0, 0, 1, 0] }

def points26 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 552, representative 3057.
def source27 : Weights.Entry :=
  { word := [0, 0, 1, 4, 2, 0, 1], weights := [0, 0, 1, 0] }

def target27 : Weights.Entry :=
  { word := [0, 4, 2, 0, 1, 0, 1], weights := [0, 1, 0, 0] }

def points27 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 2), (3, 5), (4, 3), (5, 4), (6, 6)]

-- Period 7, original row 553, representative 3057.
def source28 : Weights.Entry :=
  { word := [0, 0, 1, 4, 2, 0, 1], weights := [0, 0, 1, 0] }

def target28 : Weights.Entry :=
  { word := [0, 4, 2, 0, 1, 0, 2], weights := [0, 0, 1, 0] }

def points28 : List (ℕ × ℕ) := [(0, 2), (1, 0), (2, 1), (3, 4), (4, 3), (5, 5), (6, 6)]

-- Period 7, original row 602, representative 3057.
def source29 : Weights.Entry :=
  { word := [0, 0, 1, 4, 2, 0, 1], weights := [0, 0, 1, 0] }

def target29 : Weights.Entry :=
  { word := [0, 4, 4, 4, 0, 0, 1], weights := [1, 0, 0, 0] }

def points29 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 2), (3, 5), (4, 4), (5, 3), (6, 6)]

-- Period 7, original row 603, representative 3057.
def source30 : Weights.Entry :=
  { word := [0, 0, 1, 4, 2, 0, 1], weights := [0, 0, 1, 0] }

def target30 : Weights.Entry :=
  { word := [0, 4, 4, 4, 0, 0, 2], weights := [0, 0, 1, 0] }

def points30 : List (ℕ × ℕ) := [(0, 2), (1, 0), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 1553, representative 0.
def source31 : Weights.Entry :=
  { word := [0, 12, 2, 0, 1, 0, 4], weights := [0, 1, 0, 1] }

def target31 : Weights.Entry :=
  { word := [0, 12, 2, 0, 1, 0, 4], weights := [0, 1, 0, 1] }

-- Period 7, original row 1603, representative 0.
def source32 : Weights.Entry :=
  { word := [0, 12, 2, 0, 1, 0, 4], weights := [0, 1, 0, 1] }

def target32 : Weights.Entry :=
  { word := [0, 12, 4, 4, 0, 0, 4], weights := [1, 0, 0, 1] }

def points32 : List (ℕ × ℕ) := [(1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6)]

-- Period 7, original row 1737, representative 3057.
def source33 : Weights.Entry :=
  { word := [0, 0, 1, 4, 2, 0, 1], weights := [0, 0, 1, 0] }

def target33 : Weights.Entry :=
  { word := [1, 0, 1, 4, 2, 0, 1], weights := [0, 0, 1, 0] }

def points33 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 1739, representative 3057.
def source34 : Weights.Entry :=
  { word := [0, 0, 1, 4, 2, 0, 1], weights := [0, 0, 1, 0] }

def target34 : Weights.Entry :=
  { word := [1, 0, 1, 4, 2, 0, 4], weights := [1, 0, 0, 0] }

def points34 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 5), (4, 4), (5, 3), (6, 6)]

-- Period 7, original row 1749, representative 3057.
def source35 : Weights.Entry :=
  { word := [0, 0, 1, 4, 2, 0, 1], weights := [0, 0, 1, 0] }

def target35 : Weights.Entry :=
  { word := [1, 0, 1, 4, 4, 4, 0], weights := [0, 0, 0, 1] }

def points35 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 6), (6, 5)]

-- Period 7, original row 1759, representative 3026.
def source36 : Weights.Entry :=
  { word := [4, 0, 12, 2, 0, 2, 0], weights := [0, 1, 0, 0] }

def target36 : Weights.Entry :=
  { word := [1, 0, 1, 4, 10, 0, 1], weights := [0, 0, 1, 0] }

def points36 : List (ℕ × ℕ) := [(0, 1), (1, 2), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 1771, representative 3026.
def source37 : Weights.Entry :=
  { word := [4, 0, 12, 2, 0, 2, 0], weights := [0, 1, 0, 0] }

def target37 : Weights.Entry :=
  { word := [1, 0, 1, 4, 12, 4, 0], weights := [0, 0, 0, 1] }

def points37 : List (ℕ × ℕ) := [(0, 1), (1, 2), (2, 0), (3, 5), (4, 6), (5, 4), (6, 3)]

-- Period 7, original row 1783, representative 3057.
def source38 : Weights.Entry :=
  { word := [0, 0, 1, 4, 2, 0, 1], weights := [0, 0, 1, 0] }

def target38 : Weights.Entry :=
  { word := [1, 0, 2, 2, 2, 0, 1], weights := [0, 1, 0, 0] }

def points38 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 5), (5, 4), (6, 6)]

-- Period 7, original row 1785, representative 3057.
def source39 : Weights.Entry :=
  { word := [0, 0, 1, 4, 2, 0, 1], weights := [0, 0, 1, 0] }

def target39 : Weights.Entry :=
  { word := [1, 0, 2, 2, 2, 0, 4], weights := [1, 0, 0, 0] }

def points39 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 4), (4, 5), (5, 3), (6, 6)]

-- Period 7, original row 1798, representative 3026.
def source40 : Weights.Entry :=
  { word := [4, 0, 12, 2, 0, 2, 0], weights := [0, 1, 0, 0] }

def target40 : Weights.Entry :=
  { word := [1, 0, 2, 2, 10, 0, 1], weights := [0, 1, 0, 0] }

def points40 : List (ℕ × ℕ) := [(0, 1), (1, 2), (2, 0), (3, 6), (4, 4), (5, 5), (6, 3)]

-- Period 7, original row 1841, representative 3057.
def source41 : Weights.Entry :=
  { word := [0, 0, 1, 4, 2, 0, 1], weights := [0, 0, 1, 0] }

def target41 : Weights.Entry :=
  { word := [1, 4, 2, 0, 1, 0, 1], weights := [0, 1, 0, 0] }

def points41 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 2), (3, 5), (4, 3), (5, 4), (6, 6)]

-- Period 7, original row 1842, representative 3057.
def source42 : Weights.Entry :=
  { word := [0, 0, 1, 4, 2, 0, 1], weights := [0, 0, 1, 0] }

def target42 : Weights.Entry :=
  { word := [1, 4, 2, 0, 1, 0, 2], weights := [0, 0, 1, 0] }

def points42 : List (ℕ × ℕ) := [(0, 2), (1, 0), (2, 1), (3, 4), (4, 3), (5, 5), (6, 6)]

-- Period 7, original row 1891, representative 3057.
def source43 : Weights.Entry :=
  { word := [0, 0, 1, 4, 2, 0, 1], weights := [0, 0, 1, 0] }

def target43 : Weights.Entry :=
  { word := [1, 4, 4, 4, 0, 0, 1], weights := [1, 0, 0, 0] }

def points43 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 2), (3, 5), (4, 4), (5, 3), (6, 6)]

-- Period 7, original row 1892, representative 3057.
def source44 : Weights.Entry :=
  { word := [0, 0, 1, 4, 2, 0, 1], weights := [0, 0, 1, 0] }

def target44 : Weights.Entry :=
  { word := [1, 4, 4, 4, 0, 0, 2], weights := [0, 0, 1, 0] }

def points44 : List (ℕ × ℕ) := [(0, 2), (1, 0), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 2202, representative 0.
def source45 : Weights.Entry :=
  { word := [0, 12, 2, 0, 1, 0, 4], weights := [0, 1, 0, 1] }

def target45 : Weights.Entry :=
  { word := [1, 12, 2, 0, 1, 0, 4], weights := [0, 1, 0, 1] }

def points45 : List (ℕ × ℕ) := [(1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 2252, representative 0.
def source46 : Weights.Entry :=
  { word := [0, 12, 2, 0, 1, 0, 4], weights := [0, 1, 0, 1] }

def target46 : Weights.Entry :=
  { word := [1, 12, 4, 4, 0, 0, 4], weights := [1, 0, 0, 1] }

def points46 : List (ℕ × ℕ) := [(1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6)]

-- Period 7, original row 2382, representative 0.
def source47 : Weights.Entry :=
  { word := [0, 12, 2, 0, 1, 0, 4], weights := [0, 1, 0, 1] }

def target47 : Weights.Entry :=
  { word := [2, 0, 0, 1, 4, 10, 0], weights := [1, 0, 1, 0] }

def points47 : List (ℕ × ℕ) := [(1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 2385, representative 0.
def source48 : Weights.Entry :=
  { word := [0, 12, 2, 0, 1, 0, 4], weights := [0, 1, 0, 1] }

def target48 : Weights.Entry :=
  { word := [2, 0, 0, 2, 2, 10, 0], weights := [1, 0, 0, 1] }

def points48 : List (ℕ × ℕ) := [(1, 1), (2, 0), (3, 5), (4, 6), (5, 4), (6, 3)]

-- Period 7, original row 2405, representative 3057.
def source49 : Weights.Entry :=
  { word := [0, 0, 1, 4, 2, 0, 1], weights := [0, 0, 1, 0] }

def target49 : Weights.Entry :=
  { word := [2, 0, 4, 2, 0, 1, 0], weights := [0, 0, 0, 1] }

def points49 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 4), (4, 5), (5, 6), (6, 3)]

-- Period 7, original row 2407, representative 3057.
def source50 : Weights.Entry :=
  { word := [0, 0, 1, 4, 2, 0, 1], weights := [0, 0, 1, 0] }

def target50 : Weights.Entry :=
  { word := [2, 0, 4, 2, 0, 2, 0], weights := [0, 0, 0, 1] }

def points50 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 2), (3, 4), (4, 5), (5, 6), (6, 3)]

-- Period 7, original row 2427, representative 3057.
def source51 : Weights.Entry :=
  { word := [0, 0, 1, 4, 2, 0, 1], weights := [0, 0, 1, 0] }

def target51 : Weights.Entry :=
  { word := [2, 0, 4, 4, 4, 0, 0], weights := [0, 0, 0, 1] }

def points51 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 5), (4, 4), (5, 6), (6, 3)]

-- Period 7, original row 2629, representative 2161.
def source52 : Weights.Entry :=
  { word := [4, 0, 4, 10, 0, 4, 8], weights := [1, 0, 2, 1] }

def target52 : Weights.Entry :=
  { word := [2, 2, 2, 8, 1, 0, 8], weights := [2, 1, 0, 1] }

def points52 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 2), (3, 4), (4, 5), (5, 3), (6, 6)]

-- Period 7, original row 2773, representative 805.
def source53 : Weights.Entry :=
  { word := [0, 2, 10, 10, 0, 4, 10], weights := [0, 1, 1, 1] }

def target53 : Weights.Entry :=
  { word := [2, 2, 10, 8, 1, 0, 10], weights := [1, 1, 0, 1] }

def points53 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 5), (4, 4), (5, 3), (6, 6)]

-- Period 7, original row 3391, representative 3057.
def source54 : Weights.Entry :=
  { word := [0, 0, 1, 4, 2, 0, 1], weights := [0, 0, 1, 0] }

def target54 : Weights.Entry :=
  { word := [4, 0, 0, 1, 4, 2, 0], weights := [0, 1, 0, 0] }

def points54 : List (ℕ × ℕ) := [(0, 0), (1, 2), (2, 1), (3, 5), (4, 6), (5, 4), (6, 3)]

-- Period 7, original row 3393, representative 3057.
def source55 : Weights.Entry :=
  { word := [0, 0, 1, 4, 2, 0, 1], weights := [0, 0, 1, 0] }

def target55 : Weights.Entry :=
  { word := [4, 0, 0, 2, 2, 2, 0], weights := [0, 1, 0, 0] }

def points55 : List (ℕ × ℕ) := [(0, 0), (1, 2), (2, 1), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 3417, representative 3057.
def source56 : Weights.Entry :=
  { word := [0, 0, 1, 4, 2, 0, 1], weights := [0, 0, 1, 0] }

def target56 : Weights.Entry :=
  { word := [4, 0, 4, 2, 0, 2, 0], weights := [0, 1, 0, 0] }

def points56 : List (ℕ × ℕ) := [(0, 2), (1, 0), (2, 1), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 3447, representative 2161.
def source57 : Weights.Entry :=
  { word := [4, 0, 4, 10, 0, 4, 8], weights := [1, 0, 2, 1] }

def target57 : Weights.Entry :=
  { word := [4, 0, 4, 10, 0, 4, 8], weights := [1, 0, 2, 1] }

-- Period 7, original row 3506, representative 3026.
def source58 : Weights.Entry :=
  { word := [4, 0, 12, 2, 0, 2, 0], weights := [0, 1, 0, 0] }

def target58 : Weights.Entry :=
  { word := [4, 0, 12, 2, 0, 2, 0], weights := [0, 1, 0, 0] }

-- Period 7, original row 3540, representative 805.
def source59 : Weights.Entry :=
  { word := [0, 2, 10, 10, 0, 4, 10], weights := [0, 1, 1, 1] }

def target59 : Weights.Entry :=
  { word := [4, 0, 12, 10, 0, 4, 12], weights := [1, 0, 1, 1] }

def points59 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6)]

-- Period 7, original row 4105, representative 2161.
def source60 : Weights.Entry :=
  { word := [4, 0, 4, 10, 0, 4, 8], weights := [1, 0, 2, 1] }

def target60 : Weights.Entry :=
  { word := [8, 0, 0, 9, 4, 4, 4], weights := [1, 0, 1, 2] }

def points60 : List (ℕ × ℕ) := [(0, 1), (1, 2), (2, 0), (3, 5), (4, 4), (5, 6), (6, 3)]

-- Period 7, original row 4743, representative 2161.
def source61 : Weights.Entry :=
  { word := [4, 0, 4, 10, 0, 4, 8], weights := [1, 0, 2, 1] }

def target61 : Weights.Entry :=
  { word := [8, 2, 0, 12, 2, 0, 1], weights := [1, 2, 0, 1] }

def points61 : List (ℕ × ℕ) := [(0, 1), (1, 2), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 4744, representative 2161.
def source62 : Weights.Entry :=
  { word := [4, 0, 4, 10, 0, 4, 8], weights := [1, 0, 2, 1] }

def target62 : Weights.Entry :=
  { word := [8, 2, 0, 12, 2, 0, 2], weights := [1, 2, 0, 1] }

def points62 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 4748, representative 2161.
def source63 : Weights.Entry :=
  { word := [4, 0, 4, 10, 0, 4, 8], weights := [1, 0, 2, 1] }

def target63 : Weights.Entry :=
  { word := [8, 2, 0, 12, 4, 4, 0], weights := [1, 2, 1, 0] }

def points63 : List (ℕ × ℕ) := [(0, 1), (1, 2), (2, 0), (3, 5), (4, 6), (5, 4), (6, 3)]

-- Period 7, original row 6030, representative 29.
def source64 : Weights.Entry :=
  { word := [8, 9, 8, 9, 12, 12, 12], weights := [1, 1, 1, 1] }

def target64 : Weights.Entry :=
  { word := [8, 9, 8, 9, 12, 12, 12], weights := [1, 1, 1, 1] }

-- Period 7, original row 6279, representative 188.
def source65 : Weights.Entry :=
  { word := [8, 10, 8, 10, 8, 12, 12], weights := [0, 3, 0, 1] }

def target65 : Weights.Entry :=
  { word := [8, 10, 8, 10, 8, 12, 12], weights := [0, 3, 0, 1] }

-- Period 7, original row 7632, representative 805.
def source66 : Weights.Entry :=
  { word := [0, 2, 10, 10, 0, 4, 10], weights := [0, 1, 1, 1] }

def target66 : Weights.Entry :=
  { word := [10, 2, 0, 12, 10, 0, 2], weights := [1, 1, 0, 1] }

def points66 : List (ℕ × ℕ) := [(0, 1), (1, 2), (2, 0), (3, 5), (4, 6), (5, 4), (6, 3)]

-- Period 7, original row 7962, representative 126.
def source67 : Weights.Entry :=
  { word := [10, 8, 4, 10, 8, 12, 12], weights := [2, 2, 1, 3] }

def target67 : Weights.Entry :=
  { word := [10, 8, 4, 10, 8, 12, 12], weights := [2, 2, 1, 3] }

-- Period 7, original row 8086, representative 469.
def source68 : Weights.Entry :=
  { word := [0, 1, 12, 10, 8, 8, 12], weights := [1, 0, 0, 1] }

def target68 : Weights.Entry :=
  { word := [10, 8, 8, 12, 10, 0, 1], weights := [1, 0, 0, 1] }

def points68 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8117, representative 120.
def source69 : Weights.Entry :=
  { word := [10, 10, 8, 9, 8, 9, 12], weights := [1, 1, 0, 1] }

def target69 : Weights.Entry :=
  { word := [10, 8, 9, 8, 9, 12, 12], weights := [1, 0, 1, 1] }

def points69 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8172, representative 125.
def source70 : Weights.Entry :=
  { word := [10, 8, 12, 10, 8, 12, 12], weights := [2, 1, 1, 2] }

def target70 : Weights.Entry :=
  { word := [10, 8, 12, 10, 8, 12, 12], weights := [2, 1, 1, 2] }

-- Period 7, original row 8185, representative 182.
def source71 : Weights.Entry :=
  { word := [0, 1, 0, 12, 0, 12, 12], weights := [1, 0, 1, 0] }

def target71 : Weights.Entry :=
  { word := [10, 10, 0, 9, 0, 4, 0], weights := [0, 1, 1, 0] }

def points71 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 5), (4, 6), (5, 4), (6, 3)]

-- Period 7, original row 8201, representative 182.
def source72 : Weights.Entry :=
  { word := [0, 1, 0, 12, 0, 12, 12], weights := [1, 0, 1, 0] }

def target72 : Weights.Entry :=
  { word := [10, 10, 0, 10, 0, 0, 1], weights := [0, 1, 0, 1] }

def points72 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8307, representative 120.
def source73 : Weights.Entry :=
  { word := [10, 10, 8, 9, 8, 9, 12], weights := [1, 1, 0, 1] }

def target73 : Weights.Entry :=
  { word := [10, 10, 8, 9, 8, 9, 12], weights := [1, 1, 0, 1] }

-- Period 7, original row 8351, representative 126.
def source74 : Weights.Entry :=
  { word := [10, 8, 4, 10, 8, 12, 12], weights := [2, 2, 1, 3] }

def target74 : Weights.Entry :=
  { word := [10, 10, 8, 12, 2, 8, 12], weights := [3, 1, 2, 2] }

def points74 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8360, representative 188.
def source75 : Weights.Entry :=
  { word := [8, 10, 8, 10, 8, 12, 12], weights := [0, 3, 0, 1] }

def target75 : Weights.Entry :=
  { word := [10, 10, 8, 12, 8, 12, 8], weights := [1, 0, 3, 0] }

def points75 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8361, representative 106.
def source76 : Weights.Entry :=
  { word := [10, 10, 8, 12, 8, 12, 10], weights := [2, 1, 2, 1] }

def target76 : Weights.Entry :=
  { word := [10, 10, 8, 12, 8, 12, 10], weights := [2, 1, 2, 1] }

-- Period 7, original row 8373, representative 125.
def source77 : Weights.Entry :=
  { word := [10, 8, 12, 10, 8, 12, 12], weights := [2, 1, 1, 2] }

def target77 : Weights.Entry :=
  { word := [10, 10, 8, 12, 10, 8, 12], weights := [2, 1, 1, 2] }

def points77 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8392, representative 213.
def source78 : Weights.Entry :=
  { word := [0, 1, 8, 9, 12, 12, 12], weights := [1, 0, 1, 1] }

def target78 : Weights.Entry :=
  { word := [10, 10, 10, 8, 9, 0, 1], weights := [1, 1, 0, 1] }

def points78 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8401, representative 29.
def source79 : Weights.Entry :=
  { word := [8, 9, 8, 9, 12, 12, 12], weights := [1, 1, 1, 1] }

def target79 : Weights.Entry :=
  { word := [10, 10, 10, 8, 9, 8, 9], weights := [1, 1, 1, 1] }

def points79 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8413, representative 805.
def source80 : Weights.Entry :=
  { word := [0, 2, 10, 10, 0, 4, 10], weights := [0, 1, 1, 1] }

def target80 : Weights.Entry :=
  { word := [12, 0, 0, 9, 12, 4, 4], weights := [1, 0, 1, 1] }

def points80 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 4), (4, 5), (5, 6), (6, 3)]

-- Period 7, original row 8613, representative 805.
def source81 : Weights.Entry :=
  { word := [0, 2, 10, 10, 0, 4, 10], weights := [0, 1, 1, 1] }

def target81 : Weights.Entry :=
  { word := [12, 2, 0, 12, 10, 0, 1], weights := [1, 1, 0, 1] }

def points81 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 5), (4, 6), (5, 4), (6, 3)]

-- Period 7, original row 8620, representative 805.
def source82 : Weights.Entry :=
  { word := [0, 2, 10, 10, 0, 4, 10], weights := [0, 1, 1, 1] }

def target82 : Weights.Entry :=
  { word := [12, 2, 0, 12, 12, 4, 0], weights := [1, 1, 1, 0] }

def points82 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 9045, representative 106.
def source83 : Weights.Entry :=
  { word := [10, 10, 8, 12, 8, 12, 10], weights := [2, 1, 2, 1] }

def target83 : Weights.Entry :=
  { word := [12, 10, 8, 10, 8, 12, 12], weights := [1, 2, 1, 2] }

def points83 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 9082, representative 74.
def source84 : Weights.Entry :=
  { word := [12, 12, 12, 8, 8, 10, 10], weights := [0, 1, 1, 0] }

def target84 : Weights.Entry :=
  { word := [12, 12, 8, 8, 10, 10, 10], weights := [0, 1, 1, 0] }

def points84 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 9087, representative 74.
def source85 : Weights.Entry :=
  { word := [12, 12, 12, 8, 8, 10, 10], weights := [0, 1, 1, 0] }

def target85 : Weights.Entry :=
  { word := [12, 12, 12, 8, 8, 10, 10], weights := [0, 1, 1, 0] }

-- Period 8, original row 0, representative 3057.
def source86 : Weights.Entry :=
  { word := [0, 0, 1, 4, 2, 0, 1], weights := [0, 0, 1, 0] }

def target86 : Weights.Entry :=
  { word := [0, 0, 1, 4, 2, 0, 1], weights := [0, 0, 1, 0] }

def points86 : List (ℕ × ℕ) := [(0, 7), (1, 0), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 8, original row 1, representative 3057.
def source87 : Weights.Entry :=
  { word := [0, 0, 1, 4, 2, 0, 1], weights := [0, 0, 1, 0] }

def target87 : Weights.Entry :=
  { word := [0, 0, 1, 4, 2, 0, 2], weights := [0, 0, 1, 0] }

def points87 : List (ℕ × ℕ) := [(0, 7), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 8, original row 12, representative 3057.
def source88 : Weights.Entry :=
  { word := [0, 0, 1, 4, 2, 0, 1], weights := [0, 0, 1, 0] }

def target88 : Weights.Entry :=
  { word := [0, 0, 1, 4, 4, 4, 0], weights := [0, 0, 0, 1] }

def points88 : List (ℕ × ℕ) := [(0, 7), (1, 0), (2, 2), (3, 3), (4, 4), (5, 6), (6, 5)]

-- Period 8, original row 22, representative 3026.
def source89 : Weights.Entry :=
  { word := [4, 0, 12, 2, 0, 2, 0], weights := [0, 1, 0, 0] }

def target89 : Weights.Entry :=
  { word := [0, 0, 1, 4, 10, 0, 1], weights := [0, 0, 1, 0] }

def points89 : List (ℕ × ℕ) := [(0, 0), (1, 2), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 8, original row 23, representative 3026.
def source90 : Weights.Entry :=
  { word := [4, 0, 12, 2, 0, 2, 0], weights := [0, 1, 0, 0] }

def target90 : Weights.Entry :=
  { word := [0, 0, 1, 4, 10, 0, 2], weights := [0, 0, 1, 0] }

def points90 : List (ℕ × ℕ) := [(0, 1), (1, 2), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 8, original row 34, representative 3026.
def source91 : Weights.Entry :=
  { word := [4, 0, 12, 2, 0, 2, 0], weights := [0, 1, 0, 0] }

def target91 : Weights.Entry :=
  { word := [0, 0, 1, 4, 12, 4, 0], weights := [0, 0, 0, 1] }

def points91 : List (ℕ × ℕ) := [(0, 0), (1, 2), (2, 7), (3, 5), (4, 6), (5, 4), (6, 3)]

-- Period 8, original row 46, representative 3057.
def source92 : Weights.Entry :=
  { word := [0, 0, 1, 4, 2, 0, 1], weights := [0, 0, 1, 0] }

def target92 : Weights.Entry :=
  { word := [0, 0, 2, 2, 2, 0, 1], weights := [0, 1, 0, 0] }

def points92 : List (ℕ × ℕ) := [(0, 7), (1, 0), (2, 2), (3, 3), (4, 5), (5, 4), (6, 6)]

-- Period 8, original row 47, representative 3057.
def source93 : Weights.Entry :=
  { word := [0, 0, 1, 4, 2, 0, 1], weights := [0, 0, 1, 0] }

def target93 : Weights.Entry :=
  { word := [0, 0, 2, 2, 2, 0, 2], weights := [0, 1, 0, 0] }

def points93 : List (ℕ × ℕ) := [(0, 7), (1, 1), (2, 2), (3, 3), (4, 5), (5, 4), (6, 6)]

-- Period 8, original row 61, representative 3026.
def source94 : Weights.Entry :=
  { word := [4, 0, 12, 2, 0, 2, 0], weights := [0, 1, 0, 0] }

def target94 : Weights.Entry :=
  { word := [0, 0, 2, 2, 10, 0, 1], weights := [0, 1, 0, 0] }

def points94 : List (ℕ × ℕ) := [(0, 0), (1, 2), (2, 7), (3, 6), (4, 4), (5, 5), (6, 3)]

-- Period 8, original row 62, representative 3026.
def source95 : Weights.Entry :=
  { word := [4, 0, 12, 2, 0, 2, 0], weights := [0, 1, 0, 0] }

def target95 : Weights.Entry :=
  { word := [0, 0, 2, 2, 10, 0, 2], weights := [0, 1, 0, 0] }

def points95 : List (ℕ × ℕ) := [(0, 1), (1, 2), (2, 7), (3, 6), (4, 4), (5, 5), (6, 3)]

-- Period 8, original row 144, representative 3057.
def source96 : Weights.Entry :=
  { word := [0, 0, 1, 4, 2, 0, 1], weights := [0, 0, 1, 0] }

def target96 : Weights.Entry :=
  { word := [0, 1, 4, 2, 0, 1, 0], weights := [0, 1, 0, 0] }

def points96 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 8, original row 146, representative 3057.
def source97 : Weights.Entry :=
  { word := [0, 0, 1, 4, 2, 0, 1], weights := [0, 0, 1, 0] }

def target97 : Weights.Entry :=
  { word := [0, 1, 4, 2, 0, 2, 0], weights := [0, 1, 0, 0] }

def points97 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 8, original row 166, representative 3057.
def source98 : Weights.Entry :=
  { word := [0, 0, 1, 4, 2, 0, 1], weights := [0, 0, 1, 0] }

def target98 : Weights.Entry :=
  { word := [0, 1, 4, 4, 4, 0, 0], weights := [0, 0, 1, 0] }

def points98 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 7), (3, 6), (4, 4), (5, 5), (6, 3)]

-- Period 8, original row 233, representative 3026.
def source99 : Weights.Entry :=
  { word := [4, 0, 12, 2, 0, 2, 0], weights := [0, 1, 0, 0] }

def target99 : Weights.Entry :=
  { word := [0, 1, 12, 2, 0, 1, 0], weights := [0, 1, 0, 0] }

def points99 : List (ℕ × ℕ) := [(0, 1), (1, 7), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 8, original row 235, representative 3026.
def source100 : Weights.Entry :=
  { word := [4, 0, 12, 2, 0, 2, 0], weights := [0, 1, 0, 0] }

def target100 : Weights.Entry :=
  { word := [0, 1, 12, 2, 0, 2, 0], weights := [0, 1, 0, 0] }

def points100 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 8, original row 255, representative 3026.
def source101 : Weights.Entry :=
  { word := [4, 0, 12, 2, 0, 2, 0], weights := [0, 1, 0, 0] }

def target101 : Weights.Entry :=
  { word := [0, 1, 12, 4, 4, 0, 0], weights := [0, 0, 1, 0] }

def points101 : List (ℕ × ℕ) := [(0, 1), (1, 7), (2, 2), (3, 3), (4, 5), (5, 4), (6, 6)]

-- Period 8, original row 316, representative 3057.
def source102 : Weights.Entry :=
  { word := [0, 0, 1, 4, 2, 0, 1], weights := [0, 0, 1, 0] }

def target102 : Weights.Entry :=
  { word := [0, 2, 2, 2, 0, 1, 0], weights := [1, 0, 0, 0] }

def points102 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 7), (3, 6), (4, 5), (5, 3), (6, 4)]

-- Period 8, original row 318, representative 3057.
def source103 : Weights.Entry :=
  { word := [0, 0, 1, 4, 2, 0, 1], weights := [0, 0, 1, 0] }

def target103 : Weights.Entry :=
  { word := [0, 2, 2, 2, 0, 2, 0], weights := [1, 0, 0, 0] }

def points103 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 3), (6, 4)]

-- Period 8, original row 421, representative 3026.
def source104 : Weights.Entry :=
  { word := [4, 0, 12, 2, 0, 2, 0], weights := [0, 1, 0, 0] }

def target104 : Weights.Entry :=
  { word := [0, 2, 10, 2, 0, 1, 0], weights := [1, 0, 0, 0] }

def points104 : List (ℕ × ℕ) := [(0, 1), (1, 7), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6)]

-- Period 8, original row 423, representative 3026.
def source105 : Weights.Entry :=
  { word := [4, 0, 12, 2, 0, 2, 0], weights := [0, 1, 0, 0] }

def target105 : Weights.Entry :=
  { word := [0, 2, 10, 2, 0, 2, 0], weights := [1, 0, 0, 0] }

def points105 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6)]

-- Period 8, original row 506, representative 3057.
def source106 : Weights.Entry :=
  { word := [0, 0, 1, 4, 2, 0, 1], weights := [0, 0, 1, 0] }

def target106 : Weights.Entry :=
  { word := [0, 4, 0, 4, 2, 0, 1], weights := [0, 0, 1, 0] }

def points106 : List (ℕ × ℕ) := [(0, 7), (1, 0), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 8, original row 508, representative 3057.
def source107 : Weights.Entry :=
  { word := [0, 0, 1, 4, 2, 0, 1], weights := [0, 0, 1, 0] }

def target107 : Weights.Entry :=
  { word := [0, 4, 0, 4, 2, 0, 4], weights := [1, 0, 0, 0] }

def points107 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 5), (4, 4), (5, 3), (6, 6)]

-- Period 8, original row 518, representative 3057.
def source108 : Weights.Entry :=
  { word := [0, 0, 1, 4, 2, 0, 1], weights := [0, 0, 1, 0] }

def target108 : Weights.Entry :=
  { word := [0, 4, 0, 4, 4, 4, 0], weights := [0, 0, 0, 1] }

def points108 : List (ℕ × ℕ) := [(0, 7), (1, 0), (2, 1), (3, 3), (4, 4), (5, 6), (6, 5)]

-- Period 8, original row 528, representative 3026.
def source109 : Weights.Entry :=
  { word := [4, 0, 12, 2, 0, 2, 0], weights := [0, 1, 0, 0] }

def target109 : Weights.Entry :=
  { word := [0, 4, 0, 4, 10, 0, 1], weights := [0, 0, 1, 0] }

def points109 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 8, original row 540, representative 3026.
def source110 : Weights.Entry :=
  { word := [4, 0, 12, 2, 0, 2, 0], weights := [0, 1, 0, 0] }

def target110 : Weights.Entry :=
  { word := [0, 4, 0, 4, 12, 4, 0], weights := [0, 0, 0, 1] }

def points110 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 7), (3, 5), (4, 6), (5, 4), (6, 3)]

-- Period 8, original row 553, representative 3057.
def source111 : Weights.Entry :=
  { word := [0, 0, 1, 4, 2, 0, 1], weights := [0, 0, 1, 0] }

def target111 : Weights.Entry :=
  { word := [0, 4, 2, 0, 1, 0, 2], weights := [0, 1, 0, 0] }

def points111 : List (ℕ × ℕ) := [(0, 1), (1, 7), (2, 2), (3, 5), (4, 3), (5, 4), (6, 6)]

-- Period 8, original row 554, representative 3057.
def source112 : Weights.Entry :=
  { word := [0, 0, 1, 4, 2, 0, 1], weights := [0, 0, 1, 0] }

def target112 : Weights.Entry :=
  { word := [0, 4, 2, 0, 1, 0, 4], weights := [0, 1, 0, 0] }

def points112 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 2), (3, 5), (4, 3), (5, 4), (6, 6)]

-- Period 8, original row 603, representative 3057.
def source113 : Weights.Entry :=
  { word := [0, 0, 1, 4, 2, 0, 1], weights := [0, 0, 1, 0] }

def target113 : Weights.Entry :=
  { word := [0, 4, 4, 4, 0, 0, 2], weights := [1, 0, 0, 0] }

def points113 : List (ℕ × ℕ) := [(0, 1), (1, 7), (2, 2), (3, 5), (4, 4), (5, 3), (6, 6)]

-- Period 8, original row 604, representative 3057.
def source114 : Weights.Entry :=
  { word := [0, 0, 1, 4, 2, 0, 1], weights := [0, 0, 1, 0] }

def target114 : Weights.Entry :=
  { word := [0, 4, 4, 4, 0, 0, 4], weights := [1, 0, 0, 0] }

def points114 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 2), (3, 5), (4, 4), (5, 3), (6, 6)]

-- Period 8, original row 1737, representative 3057.
def source115 : Weights.Entry :=
  { word := [0, 0, 1, 4, 2, 0, 1], weights := [0, 0, 1, 0] }

def target115 : Weights.Entry :=
  { word := [1, 0, 1, 4, 2, 0, 1], weights := [0, 0, 1, 0] }

def points115 : List (ℕ × ℕ) := [(0, 7), (1, 0), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 8, original row 1738, representative 3057.
def source116 : Weights.Entry :=
  { word := [0, 0, 1, 4, 2, 0, 1], weights := [0, 0, 1, 0] }

def target116 : Weights.Entry :=
  { word := [1, 0, 1, 4, 2, 0, 2], weights := [0, 0, 1, 0] }

def points116 : List (ℕ × ℕ) := [(0, 7), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 8, original row 1749, representative 3057.
def source117 : Weights.Entry :=
  { word := [0, 0, 1, 4, 2, 0, 1], weights := [0, 0, 1, 0] }

def target117 : Weights.Entry :=
  { word := [1, 0, 1, 4, 4, 4, 0], weights := [0, 0, 0, 1] }

def points117 : List (ℕ × ℕ) := [(0, 7), (1, 0), (2, 2), (3, 3), (4, 4), (5, 6), (6, 5)]

-- Period 8, original row 1759, representative 3026.
def source118 : Weights.Entry :=
  { word := [4, 0, 12, 2, 0, 2, 0], weights := [0, 1, 0, 0] }

def target118 : Weights.Entry :=
  { word := [1, 0, 1, 4, 10, 0, 1], weights := [0, 0, 1, 0] }

def points118 : List (ℕ × ℕ) := [(0, 0), (1, 2), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 8, original row 1760, representative 3026.
def source119 : Weights.Entry :=
  { word := [4, 0, 12, 2, 0, 2, 0], weights := [0, 1, 0, 0] }

def target119 : Weights.Entry :=
  { word := [1, 0, 1, 4, 10, 0, 2], weights := [0, 0, 1, 0] }

def points119 : List (ℕ × ℕ) := [(0, 1), (1, 2), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 8, original row 1771, representative 3026.
def source120 : Weights.Entry :=
  { word := [4, 0, 12, 2, 0, 2, 0], weights := [0, 1, 0, 0] }

def target120 : Weights.Entry :=
  { word := [1, 0, 1, 4, 12, 4, 0], weights := [0, 0, 0, 1] }

def points120 : List (ℕ × ℕ) := [(0, 0), (1, 2), (2, 7), (3, 5), (4, 6), (5, 4), (6, 3)]

-- Period 8, original row 1783, representative 3057.
def source121 : Weights.Entry :=
  { word := [0, 0, 1, 4, 2, 0, 1], weights := [0, 0, 1, 0] }

def target121 : Weights.Entry :=
  { word := [1, 0, 2, 2, 2, 0, 1], weights := [0, 1, 0, 0] }

def points121 : List (ℕ × ℕ) := [(0, 7), (1, 0), (2, 2), (3, 3), (4, 5), (5, 4), (6, 6)]

-- Period 8, original row 1784, representative 3057.
def source122 : Weights.Entry :=
  { word := [0, 0, 1, 4, 2, 0, 1], weights := [0, 0, 1, 0] }

def target122 : Weights.Entry :=
  { word := [1, 0, 2, 2, 2, 0, 2], weights := [0, 1, 0, 0] }

def points122 : List (ℕ × ℕ) := [(0, 7), (1, 1), (2, 2), (3, 3), (4, 5), (5, 4), (6, 6)]

-- Period 8, original row 1798, representative 3026.
def source123 : Weights.Entry :=
  { word := [4, 0, 12, 2, 0, 2, 0], weights := [0, 1, 0, 0] }

def target123 : Weights.Entry :=
  { word := [1, 0, 2, 2, 10, 0, 1], weights := [0, 1, 0, 0] }

def points123 : List (ℕ × ℕ) := [(0, 0), (1, 2), (2, 7), (3, 6), (4, 4), (5, 5), (6, 3)]

-- Period 8, original row 1799, representative 3026.
def source124 : Weights.Entry :=
  { word := [4, 0, 12, 2, 0, 2, 0], weights := [0, 1, 0, 0] }

def target124 : Weights.Entry :=
  { word := [1, 0, 2, 2, 10, 0, 2], weights := [0, 1, 0, 0] }

def points124 : List (ℕ × ℕ) := [(0, 1), (1, 2), (2, 7), (3, 6), (4, 4), (5, 5), (6, 3)]

-- Period 8, original row 1842, representative 3057.
def source125 : Weights.Entry :=
  { word := [0, 0, 1, 4, 2, 0, 1], weights := [0, 0, 1, 0] }

def target125 : Weights.Entry :=
  { word := [1, 4, 2, 0, 1, 0, 2], weights := [0, 1, 0, 0] }

def points125 : List (ℕ × ℕ) := [(0, 1), (1, 7), (2, 2), (3, 5), (4, 3), (5, 4), (6, 6)]

-- Period 8, original row 1843, representative 3057.
def source126 : Weights.Entry :=
  { word := [0, 0, 1, 4, 2, 0, 1], weights := [0, 0, 1, 0] }

def target126 : Weights.Entry :=
  { word := [1, 4, 2, 0, 1, 0, 4], weights := [0, 1, 0, 0] }

def points126 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 2), (3, 5), (4, 3), (5, 4), (6, 6)]

-- Period 8, original row 1892, representative 3057.
def source127 : Weights.Entry :=
  { word := [0, 0, 1, 4, 2, 0, 1], weights := [0, 0, 1, 0] }

def target127 : Weights.Entry :=
  { word := [1, 4, 4, 4, 0, 0, 2], weights := [1, 0, 0, 0] }

def points127 : List (ℕ × ℕ) := [(0, 1), (1, 7), (2, 2), (3, 5), (4, 4), (5, 3), (6, 6)]

def period7Entries : List Weights.Entry := [target0, target1, target2, target3, target4, target5, target6, target7, target8, target9, target10, target11, target12, target13, target14, target15, target16, target17, target18, target19, target20, target21, target22, target23, target24, target25, target26, target27, target28, target29, target30, target31, target32, target33, target34, target35, target36, target37, target38, target39, target40, target41, target42, target43, target44, target45, target46, target47, target48, target49, target50, target51, target52, target53, target54, target55, target56, target57, target58, target59, target60, target61, target62, target63, target64, target65, target66, target67, target68, target69, target70, target71, target72, target73, target74, target75, target76, target77, target78, target79, target80, target81, target82, target83, target84, target85]

def period7Chunk : RowCoverage.Chunk where
  rows := [⟨0, target0⟩, ⟨2, target1⟩, ⟨12, target2⟩, ⟨22, target3⟩, ⟨34, target4⟩, ⟨46, target5⟩, ⟨48, target6⟩, ⟨61, target7⟩, ⟨120, target8⟩, ⟨122, target9⟩, ⟨143, target10⟩, ⟨144, target11⟩, ⟨166, target12⟩, ⟨176, target13⟩, ⟨224, target14⟩, ⟨233, target15⟩, ⟨255, target16⟩, ⟨268, target17⟩, ⟨288, target18⟩, ⟨302, target19⟩, ⟨316, target20⟩, ⟨368, target21⟩, ⟨421, target22⟩, ⟨469, target23⟩, ⟨507, target24⟩, ⟨508, target25⟩, ⟨529, target26⟩, ⟨552, target27⟩, ⟨553, target28⟩, ⟨602, target29⟩, ⟨603, target30⟩, ⟨1553, target31⟩, ⟨1603, target32⟩, ⟨1737, target33⟩, ⟨1739, target34⟩, ⟨1749, target35⟩, ⟨1759, target36⟩, ⟨1771, target37⟩, ⟨1783, target38⟩, ⟨1785, target39⟩, ⟨1798, target40⟩, ⟨1841, target41⟩, ⟨1842, target42⟩, ⟨1891, target43⟩, ⟨1892, target44⟩, ⟨2202, target45⟩, ⟨2252, target46⟩, ⟨2382, target47⟩, ⟨2385, target48⟩, ⟨2405, target49⟩, ⟨2407, target50⟩, ⟨2427, target51⟩, ⟨2629, target52⟩, ⟨2773, target53⟩, ⟨3391, target54⟩, ⟨3393, target55⟩, ⟨3417, target56⟩, ⟨3447, target57⟩, ⟨3506, target58⟩, ⟨3540, target59⟩, ⟨4105, target60⟩, ⟨4743, target61⟩, ⟨4744, target62⟩, ⟨4748, target63⟩, ⟨6030, target64⟩, ⟨6279, target65⟩, ⟨7632, target66⟩, ⟨7962, target67⟩, ⟨8086, target68⟩, ⟨8117, target69⟩, ⟨8172, target70⟩, ⟨8185, target71⟩, ⟨8201, target72⟩, ⟨8307, target73⟩, ⟨8351, target74⟩, ⟨8360, target75⟩, ⟨8361, target76⟩, ⟨8373, target77⟩, ⟨8392, target78⟩, ⟨8401, target79⟩, ⟨8413, target80⟩, ⟨8613, target81⟩, ⟨8620, target82⟩, ⟨9045, target83⟩, ⟨9082, target84⟩, ⟨9087, target85⟩]
  indexMask := 297121829242366939647567124925974196758596332099794864057942772782097169226905995684982018607124479882451151128509804964127510113720238126809557796796428450670726643765822607447046919998784007826480360345821342397678461551797082121757007350777430383436921324586137182340623721562137881697814657045169741084510166048437960247767124679950698393038435873985335237066885969773848682703354287899228564826860394709202348057005928639466356420549477204019876613665257450659432977275326923582533421252725385739102525186835918189743738026098279372536705581056643372797908308989646781350658545924817711814734335053511528102377635296135402987392158379120280120637868280538703827187103209384020510541866703808775699082542660250487032531521372647440793109504219542220496123873272888399906117151996116280600972888999025674034629957175232726608523643234333835112738005761310720997441161419980107588025783049915377521280608901628840874441773015605289689644521890250473088042643187791435516034627450511660231177926852901180031322023688958229417755335574399140639641786088912617411289395200777360432851402025588436950749721764806024932178321762821023861021155432909025531800553307912275550453500327432896849390247617132232402245004429578472706031735470519671959927170648407186980350661844930197522055447350335382071569667089469197152561100463993927437853001994620281106315233356877177829137985368687379096252107279803203088804636728073084944182049136383408765988165085139431238916686273511630156564379422914521591418704791296069550882637890577488152453152134573775861821100815252614311972027859881151919177890457030319942084310479152479767779531183621987505429980761037857920136563439437096403859230749492092803084065822658946812580569967822824653417322383519226347934363737002394200979455228076506545419669371579575846320234770561410672513262234275616332515741151184634645865823801743732339604560786964135238036440190254581090335990744876536541308082364775661188030930235945208190306697922074968616600843579051932147694950203670117796399879205984775179179183001959086151943652196781565673360367590699465731991383835508814535009128002846782964211868773958346585423634646414393369669893637170909985671962087574941933299210837459083742819702620777423415099433489699936998621880138630453565664636843145674396548048233103751583384735443957974933948254524834855748442795128819420904584033784918173868695730264850599893970176247263412253448814052911262098323764032007117164874322692642965639221668446492506815023062042599038326053043967137649996950217837632123778921759315999115209487215705895215458061891209515782343454523403068486478032841822995515104591246368787244291786889996154526456179385852553162314091861521841529451562334195074381134584680861417869317
  count := 86

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

def period8Entries : List Weights.Entry := [target86, target87, target88, target89, target90, target91, target92, target93, target94, target95, target96, target97, target98, target99, target100, target101, target102, target103, target104, target105, target106, target107, target108, target109, target110, target111, target112, target113, target114, target115, target116, target117, target118, target119, target120, target121, target122, target123, target124, target125, target126, target127]

def period8Chunk : RowCoverage.Chunk where
  rows := [⟨0, target86⟩, ⟨1, target87⟩, ⟨12, target88⟩, ⟨22, target89⟩, ⟨23, target90⟩, ⟨34, target91⟩, ⟨46, target92⟩, ⟨47, target93⟩, ⟨61, target94⟩, ⟨62, target95⟩, ⟨144, target96⟩, ⟨146, target97⟩, ⟨166, target98⟩, ⟨233, target99⟩, ⟨235, target100⟩, ⟨255, target101⟩, ⟨316, target102⟩, ⟨318, target103⟩, ⟨421, target104⟩, ⟨423, target105⟩, ⟨506, target106⟩, ⟨508, target107⟩, ⟨518, target108⟩, ⟨528, target109⟩, ⟨540, target110⟩, ⟨553, target111⟩, ⟨554, target112⟩, ⟨603, target113⟩, ⟨604, target114⟩, ⟨1737, target115⟩, ⟨1738, target116⟩, ⟨1749, target117⟩, ⟨1759, target118⟩, ⟨1760, target119⟩, ⟨1771, target120⟩, ⟨1783, target121⟩, ⟨1784, target122⟩, ⟨1798, target123⟩, ⟨1799, target124⟩, ⟨1842, target125⟩, ⟨1843, target126⟩, ⟨1892, target127⟩]
  indexMask := 353795085775812694651763122765948901835024219237234422947651804387856323953430542850782663641779271895343136278710354387236466603457093649091451761970278607928964880347202295597168995285648149357975312960206418411068917393142444368479762663297893045531747373015601671572974290579782078271414564191182809547678585080734109444037845660521810770547357764612910406834841133287151137058462204134374056002240873971239036282934055970918554314979648726469809636239679112629634345842288803603580039151750505954061815339796005453916602584120034586118928702535899475713828696625155
  count := 42

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

end FranklSmallCyclic.TransportBatches.G075.B000.Data
