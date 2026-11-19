module

public import Conjectures.FranklSmallCyclicRowCoverage
public import Conjectures.FranklSmallCyclicCanonicalWords
public import Conjectures.FranklSmallCyclicOrbit10Block006Data

/-! 74 literal targets sharing one source proof block.
Original words and row indices are retained; weights may be transported.
-/
@[expose] public section

namespace FranklSmallCyclic.TransportBatches.G084.B001.Data

-- Period 10, original row 6197, representative 9892.
def source0 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B006.Data.entryAt ⟨60, by decide +kernel⟩

def target0 : Weights.Entry :=
  { word := [8, 10, 2, 10, 8, 8, 9], weights := [1, 0, 0, 1] }

def points0 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 6219, representative 9893.
def source1 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B006.Data.entryAt ⟨61, by decide +kernel⟩

def target1 : Weights.Entry :=
  { word := [8, 10, 8, 2, 0, 8, 9], weights := [0, 1, 0, 1] }

def points1 : List (ℕ × ℕ) := [(0, 9), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 6260, representative 9894.
def source2 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B006.Data.entryAt ⟨62, by decide +kernel⟩

def target2 : Weights.Entry :=
  { word := [8, 10, 8, 10, 0, 8, 9], weights := [0, 1, 0, 1] }

def points2 : List (ℕ × ℕ) := [(0, 9), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 6297, representative 9890.
def source3 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B006.Data.entryAt ⟨58, by decide +kernel⟩

def target3 : Weights.Entry :=
  { word := [8, 10, 10, 2, 8, 8, 9], weights := [1, 0, 0, 1] }

def points3 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 6319, representative 9891.
def source4 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B006.Data.entryAt ⟨59, by decide +kernel⟩

def target4 : Weights.Entry :=
  { word := [8, 10, 10, 10, 8, 8, 9], weights := [1, 0, 0, 1] }

def points4 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 7403, representative 9887.
def source5 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B006.Data.entryAt ⟨55, by decide +kernel⟩

def target5 : Weights.Entry :=
  { word := [10, 0, 0, 9, 4, 4, 4], weights := [1, 0, 1, 1] }

def points5 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 0), (8, 1), (9, 2)]

-- Period 10, original row 7405, representative 9839.
def source6 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B006.Data.entryAt ⟨7, by decide +kernel⟩

def target6 : Weights.Entry :=
  { word := [10, 0, 0, 9, 4, 12, 4], weights := [1, 0, 1, 1] }

def points6 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 0), (8, 1), (9, 2)]

-- Period 10, original row 7407, representative 9886.
def source7 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B006.Data.entryAt ⟨54, by decide +kernel⟩

def target7 : Weights.Entry :=
  { word := [10, 0, 0, 9, 12, 4, 4], weights := [1, 0, 1, 1] }

def points7 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 0), (8, 1), (9, 2)]

-- Period 10, original row 7409, representative 9838.
def source8 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B006.Data.entryAt ⟨6, by decide +kernel⟩

def target8 : Weights.Entry :=
  { word := [10, 0, 0, 9, 12, 12, 4], weights := [1, 0, 1, 1] }

def points8 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 0), (8, 1), (9, 2)]

-- Period 10, original row 7413, representative 9858.
def source9 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B006.Data.entryAt ⟨26, by decide +kernel⟩

def target9 : Weights.Entry :=
  { word := [10, 0, 0, 12, 0, 4, 2], weights := [0, 0, 1, 1] }

def points9 : List (ℕ × ℕ) := [(0, 8), (1, 7), (2, 9), (3, 5), (4, 6), (5, 4), (6, 3), (7, 0), (8, 1), (9, 2)]

-- Period 10, original row 7414, representative 9858.
def source10 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B006.Data.entryAt ⟨26, by decide +kernel⟩

def target10 : Weights.Entry :=
  { word := [10, 0, 0, 12, 0, 4, 4], weights := [0, 0, 1, 1] }

def points10 : List (ℕ × ℕ) := [(0, 7), (1, 8), (2, 9), (3, 5), (4, 6), (5, 4), (6, 3), (7, 0), (8, 1), (9, 2)]

-- Period 10, original row 7458, representative 9833.
def source11 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B006.Data.entryAt ⟨1, by decide +kernel⟩

def target11 : Weights.Entry :=
  { word := [10, 0, 4, 10, 0, 12, 2], weights := [1, 0, 1, 1] }

def points11 : List (ℕ × ℕ) := [(0, 9), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 0), (9, 1)]

-- Period 10, original row 7459, representative 9833.
def source12 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B006.Data.entryAt ⟨1, by decide +kernel⟩

def target12 : Weights.Entry :=
  { word := [10, 0, 4, 10, 0, 12, 4], weights := [1, 0, 1, 1] }

def points12 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 0), (9, 1)]

-- Period 10, original row 7464, representative 9881.
def source13 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B006.Data.entryAt ⟨49, by decide +kernel⟩

def target13 : Weights.Entry :=
  { word := [10, 0, 4, 10, 8, 4, 4], weights := [1, 0, 1, 1] }

def points13 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 0), (9, 1)]

-- Period 10, original row 7469, representative 9832.
def source14 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B006.Data.entryAt ⟨0, by decide +kernel⟩

def target14 : Weights.Entry :=
  { word := [10, 0, 4, 10, 8, 12, 4], weights := [1, 0, 1, 1] }

def points14 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 0), (9, 1)]

-- Period 10, original row 7488, representative 9855.
def source15 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B006.Data.entryAt ⟨23, by decide +kernel⟩

def target15 : Weights.Entry :=
  { word := [10, 0, 8, 4, 8, 4, 4], weights := [1, 0, 0, 1] }

def points15 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 0), (9, 1)]

-- Period 10, original row 7492, representative 9885.
def source16 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B006.Data.entryAt ⟨53, by decide +kernel⟩

def target16 : Weights.Entry :=
  { word := [10, 0, 8, 9, 4, 4, 4], weights := [1, 0, 1, 1] }

def points16 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 0), (9, 1)]

-- Period 10, original row 7494, representative 9837.
def source17 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B006.Data.entryAt ⟨5, by decide +kernel⟩

def target17 : Weights.Entry :=
  { word := [10, 0, 8, 9, 4, 12, 4], weights := [1, 0, 1, 1] }

def points17 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 0), (9, 1)]

-- Period 10, original row 7496, representative 9884.
def source18 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B006.Data.entryAt ⟨52, by decide +kernel⟩

def target18 : Weights.Entry :=
  { word := [10, 0, 8, 9, 12, 4, 4], weights := [1, 0, 1, 1] }

def points18 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 0), (9, 1)]

-- Period 10, original row 7498, representative 9836.
def source19 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B006.Data.entryAt ⟨4, by decide +kernel⟩

def target19 : Weights.Entry :=
  { word := [10, 0, 8, 9, 12, 12, 4], weights := [1, 0, 1, 1] }

def points19 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 0), (9, 1)]

-- Period 10, original row 7504, representative 9857.
def source20 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B006.Data.entryAt ⟨25, by decide +kernel⟩

def target20 : Weights.Entry :=
  { word := [10, 0, 8, 12, 0, 4, 2], weights := [0, 0, 1, 1] }

def points20 : List (ℕ × ℕ) := [(0, 9), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 0), (9, 1)]

-- Period 10, original row 7505, representative 9857.
def source21 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B006.Data.entryAt ⟨25, by decide +kernel⟩

def target21 : Weights.Entry :=
  { word := [10, 0, 8, 12, 0, 4, 4], weights := [0, 0, 1, 1] }

def points21 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 0), (9, 1)]

-- Period 10, original row 7518, representative 9856.
def source22 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B006.Data.entryAt ⟨24, by decide +kernel⟩

def target22 : Weights.Entry :=
  { word := [10, 0, 8, 12, 8, 4, 4], weights := [0, 0, 1, 1] }

def points22 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 0), (9, 1)]

-- Period 10, original row 7524, representative 9870.
def source23 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B006.Data.entryAt ⟨38, by decide +kernel⟩

def target23 : Weights.Entry :=
  { word := [10, 0, 9, 8, 1, 4, 2], weights := [1, 0, 1, 1] }

def points23 : List (ℕ × ℕ) := [(0, 9), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 0), (9, 1)]

-- Period 10, original row 7525, representative 9870.
def source24 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B006.Data.entryAt ⟨38, by decide +kernel⟩

def target24 : Weights.Entry :=
  { word := [10, 0, 9, 8, 1, 4, 4], weights := [1, 0, 1, 1] }

def points24 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 0), (9, 1)]

-- Period 10, original row 7534, representative 9869.
def source25 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B006.Data.entryAt ⟨37, by decide +kernel⟩

def target25 : Weights.Entry :=
  { word := [10, 0, 9, 8, 9, 4, 4], weights := [1, 0, 1, 1] }

def points25 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 0), (9, 1)]

-- Period 10, original row 7566, representative 9880.
def source26 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B006.Data.entryAt ⟨48, by decide +kernel⟩

def target26 : Weights.Entry :=
  { word := [10, 0, 12, 10, 0, 4, 2], weights := [1, 0, 1, 1] }

def points26 : List (ℕ × ℕ) := [(0, 9), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 0), (9, 1)]

-- Period 10, original row 7567, representative 9880.
def source27 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B006.Data.entryAt ⟨48, by decide +kernel⟩

def target27 : Weights.Entry :=
  { word := [10, 0, 12, 10, 0, 4, 4], weights := [1, 0, 1, 1] }

def points27 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 0), (9, 1)]

-- Period 10, original row 7586, representative 9879.
def source28 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B006.Data.entryAt ⟨47, by decide +kernel⟩

def target28 : Weights.Entry :=
  { word := [10, 0, 12, 10, 8, 4, 4], weights := [1, 0, 1, 1] }

def points28 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 0), (9, 1)]

-- Period 10, original row 7837, representative 9850.
def source29 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B006.Data.entryAt ⟨18, by decide +kernel⟩

def target29 : Weights.Entry :=
  { word := [10, 8, 0, 4, 8, 4, 2], weights := [1, 0, 1, 0] }

def points29 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 5), (4, 6), (5, 4), (6, 3), (7, 1), (8, 2), (9, 0)]

-- Period 10, original row 7838, representative 9852.
def source30 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B006.Data.entryAt ⟨20, by decide +kernel⟩

def target30 : Weights.Entry :=
  { word := [10, 8, 0, 4, 8, 4, 4], weights := [1, 0, 0, 1] }

def points30 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2), (9, 0)]

-- Period 10, original row 7863, representative 9854.
def source31 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B006.Data.entryAt ⟨22, by decide +kernel⟩

def target31 : Weights.Entry :=
  { word := [10, 8, 0, 12, 0, 4, 2], weights := [1, 0, 1, 0] }

def points31 : List (ℕ × ℕ) := [(0, 8), (1, 7), (2, 9), (3, 5), (4, 6), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 7864, representative 9854.
def source32 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B006.Data.entryAt ⟨22, by decide +kernel⟩

def target32 : Weights.Entry :=
  { word := [10, 8, 0, 12, 0, 4, 4], weights := [1, 0, 1, 0] }

def points32 : List (ℕ × ℕ) := [(0, 7), (1, 8), (2, 9), (3, 5), (4, 6), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 7888, representative 9851.
def source33 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B006.Data.entryAt ⟨19, by decide +kernel⟩

def target33 : Weights.Entry :=
  { word := [10, 8, 0, 12, 8, 4, 2], weights := [1, 0, 1, 0] }

def points33 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 5), (4, 6), (5, 4), (6, 3), (7, 1), (8, 2), (9, 0)]

-- Period 10, original row 7889, representative 9853.
def source34 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B006.Data.entryAt ⟨21, by decide +kernel⟩

def target34 : Weights.Entry :=
  { word := [10, 8, 0, 12, 8, 4, 4], weights := [1, 0, 0, 1] }

def points34 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2), (9, 0)]

-- Period 10, original row 8003, representative 9845.
def source35 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B006.Data.entryAt ⟨13, by decide +kernel⟩

def target35 : Weights.Entry :=
  { word := [10, 8, 8, 4, 8, 4, 2], weights := [1, 0, 0, 1] }

def points35 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8004, representative 9847.
def source36 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B006.Data.entryAt ⟨15, by decide +kernel⟩

def target36 : Weights.Entry :=
  { word := [10, 8, 8, 4, 8, 4, 4], weights := [1, 0, 0, 1] }

def points36 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8029, representative 9875.
def source37 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B006.Data.entryAt ⟨43, by decide +kernel⟩

def target37 : Weights.Entry :=
  { word := [10, 8, 8, 8, 1, 4, 2], weights := [1, 0, 1, 1] }

def points37 : List (ℕ × ℕ) := [(0, 9), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8030, representative 9875.
def source38 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B006.Data.entryAt ⟨43, by decide +kernel⟩

def target38 : Weights.Entry :=
  { word := [10, 8, 8, 8, 1, 4, 4], weights := [1, 0, 1, 1] }

def points38 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8039, representative 9874.
def source39 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B006.Data.entryAt ⟨42, by decide +kernel⟩

def target39 : Weights.Entry :=
  { word := [10, 8, 8, 8, 9, 4, 4], weights := [1, 0, 1, 1] }

def points39 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8047, representative 9849.
def source40 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B006.Data.entryAt ⟨17, by decide +kernel⟩

def target40 : Weights.Entry :=
  { word := [10, 8, 8, 12, 0, 4, 2], weights := [1, 0, 0, 1] }

def points40 : List (ℕ × ℕ) := [(0, 9), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8048, representative 9849.
def source41 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B006.Data.entryAt ⟨17, by decide +kernel⟩

def target41 : Weights.Entry :=
  { word := [10, 8, 8, 12, 0, 4, 4], weights := [1, 0, 0, 1] }

def points41 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8076, representative 9846.
def source42 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B006.Data.entryAt ⟨14, by decide +kernel⟩

def target42 : Weights.Entry :=
  { word := [10, 8, 8, 12, 8, 4, 2], weights := [1, 0, 0, 1] }

def points42 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8077, representative 9848.
def source43 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B006.Data.entryAt ⟨16, by decide +kernel⟩

def target43 : Weights.Entry :=
  { word := [10, 8, 8, 12, 8, 4, 4], weights := [1, 0, 0, 1] }

def points43 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8104, representative 9866.
def source44 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B006.Data.entryAt ⟨34, by decide +kernel⟩

def target44 : Weights.Entry :=
  { word := [10, 8, 9, 8, 1, 4, 2], weights := [1, 0, 1, 1] }

def points44 : List (ℕ × ℕ) := [(0, 9), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8105, representative 9866.
def source45 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B006.Data.entryAt ⟨34, by decide +kernel⟩

def target45 : Weights.Entry :=
  { word := [10, 8, 9, 8, 1, 4, 4], weights := [1, 0, 1, 1] }

def points45 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8114, representative 9865.
def source46 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B006.Data.entryAt ⟨33, by decide +kernel⟩

def target46 : Weights.Entry :=
  { word := [10, 8, 9, 8, 9, 4, 4], weights := [1, 0, 1, 1] }

def points46 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8166, representative 9873.
def source47 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B006.Data.entryAt ⟨41, by decide +kernel⟩

def target47 : Weights.Entry :=
  { word := [10, 8, 12, 10, 8, 4, 4], weights := [2, 1, 1, 2] }

def points47 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8409, representative 9887.
def source48 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B006.Data.entryAt ⟨55, by decide +kernel⟩

def target48 : Weights.Entry :=
  { word := [12, 0, 0, 9, 4, 4, 4], weights := [1, 0, 1, 1] }

def points48 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 0), (8, 2), (9, 1)]

-- Period 10, original row 8411, representative 9839.
def source49 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B006.Data.entryAt ⟨7, by decide +kernel⟩

def target49 : Weights.Entry :=
  { word := [12, 0, 0, 9, 4, 12, 4], weights := [1, 0, 1, 1] }

def points49 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 0), (8, 2), (9, 1)]

-- Period 10, original row 8413, representative 9886.
def source50 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B006.Data.entryAt ⟨54, by decide +kernel⟩

def target50 : Weights.Entry :=
  { word := [12, 0, 0, 9, 12, 4, 4], weights := [1, 0, 1, 1] }

def points50 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 0), (8, 2), (9, 1)]

-- Period 10, original row 8415, representative 9838.
def source51 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B006.Data.entryAt ⟨6, by decide +kernel⟩

def target51 : Weights.Entry :=
  { word := [12, 0, 0, 9, 12, 12, 4], weights := [1, 0, 1, 1] }

def points51 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 0), (8, 2), (9, 1)]

-- Period 10, original row 8419, representative 9858.
def source52 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B006.Data.entryAt ⟨26, by decide +kernel⟩

def target52 : Weights.Entry :=
  { word := [12, 0, 0, 12, 0, 4, 2], weights := [0, 0, 1, 1] }

def points52 : List (ℕ × ℕ) := [(0, 8), (1, 7), (2, 9), (3, 5), (4, 6), (5, 4), (6, 3), (7, 0), (8, 2), (9, 1)]

-- Period 10, original row 8420, representative 9858.
def source53 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B006.Data.entryAt ⟨26, by decide +kernel⟩

def target53 : Weights.Entry :=
  { word := [12, 0, 0, 12, 0, 4, 4], weights := [0, 0, 1, 1] }

def points53 : List (ℕ × ℕ) := [(0, 7), (1, 8), (2, 9), (3, 5), (4, 6), (5, 4), (6, 3), (7, 0), (8, 2), (9, 1)]

-- Period 10, original row 8475, representative 9878.
def source54 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B006.Data.entryAt ⟨46, by decide +kernel⟩

def target54 : Weights.Entry :=
  { word := [12, 0, 4, 10, 8, 4, 4], weights := [0, 1, 1, 1] }

def points54 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 0), (9, 1)]

-- Period 10, original row 8500, representative 9883.
def source55 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B006.Data.entryAt ⟨51, by decide +kernel⟩

def target55 : Weights.Entry :=
  { word := [12, 0, 8, 9, 4, 4, 4], weights := [1, 0, 1, 1] }

def points55 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 0), (9, 1)]

-- Period 10, original row 8502, representative 9835.
def source56 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B006.Data.entryAt ⟨3, by decide +kernel⟩

def target56 : Weights.Entry :=
  { word := [12, 0, 8, 9, 4, 12, 4], weights := [1, 0, 1, 1] }

def points56 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 0), (9, 1)]

-- Period 10, original row 8504, representative 9882.
def source57 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B006.Data.entryAt ⟨50, by decide +kernel⟩

def target57 : Weights.Entry :=
  { word := [12, 0, 8, 9, 12, 4, 4], weights := [1, 0, 1, 1] }

def points57 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 0), (9, 1)]

-- Period 10, original row 8506, representative 9834.
def source58 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B006.Data.entryAt ⟨2, by decide +kernel⟩

def target58 : Weights.Entry :=
  { word := [12, 0, 8, 9, 12, 12, 4], weights := [1, 0, 1, 1] }

def points58 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 0), (9, 1)]

-- Period 10, original row 8548, representative 9877.
def source59 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B006.Data.entryAt ⟨45, by decide +kernel⟩

def target59 : Weights.Entry :=
  { word := [12, 0, 12, 10, 0, 4, 2], weights := [1, 0, 1, 1] }

def points59 : List (ℕ × ℕ) := [(0, 9), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 0), (9, 1)]

-- Period 10, original row 8549, representative 9877.
def source60 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B006.Data.entryAt ⟨45, by decide +kernel⟩

def target60 : Weights.Entry :=
  { word := [12, 0, 12, 10, 0, 4, 4], weights := [1, 0, 1, 1] }

def points60 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 0), (9, 1)]

-- Period 10, original row 8568, representative 9876.
def source61 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B006.Data.entryAt ⟨44, by decide +kernel⟩

def target61 : Weights.Entry :=
  { word := [12, 0, 12, 10, 8, 4, 4], weights := [0, 1, 1, 1] }

def points61 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 0), (9, 1)]

-- Period 10, original row 8695, representative 9868.
def source62 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B006.Data.entryAt ⟨36, by decide +kernel⟩

def target62 : Weights.Entry :=
  { word := [12, 4, 8, 8, 1, 4, 2], weights := [1, 0, 1, 1] }

def points62 : List (ℕ × ℕ) := [(0, 9), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8696, representative 9868.
def source63 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B006.Data.entryAt ⟨36, by decide +kernel⟩

def target63 : Weights.Entry :=
  { word := [12, 4, 8, 8, 1, 4, 4], weights := [1, 0, 1, 1] }

def points63 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8710, representative 9867.
def source64 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B006.Data.entryAt ⟨35, by decide +kernel⟩

def target64 : Weights.Entry :=
  { word := [12, 4, 8, 8, 9, 4, 4], weights := [1, 0, 1, 1] }

def points64 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8753, representative 9850.
def source65 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B006.Data.entryAt ⟨18, by decide +kernel⟩

def target65 : Weights.Entry :=
  { word := [12, 8, 0, 4, 8, 4, 2], weights := [1, 0, 1, 0] }

def points65 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 5), (4, 6), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8754, representative 9852.
def source66 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B006.Data.entryAt ⟨20, by decide +kernel⟩

def target66 : Weights.Entry :=
  { word := [12, 8, 0, 4, 8, 4, 4], weights := [1, 0, 0, 1] }

def points66 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8796, representative 9851.
def source67 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B006.Data.entryAt ⟨19, by decide +kernel⟩

def target67 : Weights.Entry :=
  { word := [12, 8, 0, 12, 8, 4, 2], weights := [1, 0, 1, 0] }

def points67 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 5), (4, 6), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8797, representative 9853.
def source68 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B006.Data.entryAt ⟨21, by decide +kernel⟩

def target68 : Weights.Entry :=
  { word := [12, 8, 0, 12, 8, 4, 4], weights := [1, 0, 0, 1] }

def points68 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8868, representative 9872.
def source69 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B006.Data.entryAt ⟨40, by decide +kernel⟩

def target69 : Weights.Entry :=
  { word := [12, 8, 4, 10, 8, 4, 4], weights := [1, 1, 1, 1] }

def points69 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8976, representative 9871.
def source70 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B006.Data.entryAt ⟨39, by decide +kernel⟩

def target70 : Weights.Entry :=
  { word := [12, 8, 12, 10, 8, 4, 4], weights := [1, 1, 1, 1] }

def points70 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 9060, representative 9864.
def source71 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B006.Data.entryAt ⟨32, by decide +kernel⟩

def target71 : Weights.Entry :=
  { word := [12, 12, 8, 8, 1, 4, 2], weights := [1, 0, 1, 1] }

def points71 : List (ℕ × ℕ) := [(0, 9), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 9061, representative 9864.
def source72 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B006.Data.entryAt ⟨32, by decide +kernel⟩

def target72 : Weights.Entry :=
  { word := [12, 12, 8, 8, 1, 4, 4], weights := [1, 0, 1, 1] }

def points72 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 9075, representative 9863.
def source73 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B006.Data.entryAt ⟨31, by decide +kernel⟩

def target73 : Weights.Entry :=
  { word := [12, 12, 8, 8, 9, 4, 4], weights := [1, 0, 1, 1] }

def points73 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

def period10Entries : List Weights.Entry := [target0, target1, target2, target3, target4, target5, target6, target7, target8, target9, target10, target11, target12, target13, target14, target15, target16, target17, target18, target19, target20, target21, target22, target23, target24, target25, target26, target27, target28, target29, target30, target31, target32, target33, target34, target35, target36, target37, target38, target39, target40, target41, target42, target43, target44, target45, target46, target47, target48, target49, target50, target51, target52, target53, target54, target55, target56, target57, target58, target59, target60, target61, target62, target63, target64, target65, target66, target67, target68, target69, target70, target71, target72, target73]

def period10Chunk : RowCoverage.Chunk where
  rows := [⟨6197, target0⟩, ⟨6219, target1⟩, ⟨6260, target2⟩, ⟨6297, target3⟩, ⟨6319, target4⟩, ⟨7403, target5⟩, ⟨7405, target6⟩, ⟨7407, target7⟩, ⟨7409, target8⟩, ⟨7413, target9⟩, ⟨7414, target10⟩, ⟨7458, target11⟩, ⟨7459, target12⟩, ⟨7464, target13⟩, ⟨7469, target14⟩, ⟨7488, target15⟩, ⟨7492, target16⟩, ⟨7494, target17⟩, ⟨7496, target18⟩, ⟨7498, target19⟩, ⟨7504, target20⟩, ⟨7505, target21⟩, ⟨7518, target22⟩, ⟨7524, target23⟩, ⟨7525, target24⟩, ⟨7534, target25⟩, ⟨7566, target26⟩, ⟨7567, target27⟩, ⟨7586, target28⟩, ⟨7837, target29⟩, ⟨7838, target30⟩, ⟨7863, target31⟩, ⟨7864, target32⟩, ⟨7888, target33⟩, ⟨7889, target34⟩, ⟨8003, target35⟩, ⟨8004, target36⟩, ⟨8029, target37⟩, ⟨8030, target38⟩, ⟨8039, target39⟩, ⟨8047, target40⟩, ⟨8048, target41⟩, ⟨8076, target42⟩, ⟨8077, target43⟩, ⟨8104, target44⟩, ⟨8105, target45⟩, ⟨8114, target46⟩, ⟨8166, target47⟩, ⟨8409, target48⟩, ⟨8411, target49⟩, ⟨8413, target50⟩, ⟨8415, target51⟩, ⟨8419, target52⟩, ⟨8420, target53⟩, ⟨8475, target54⟩, ⟨8500, target55⟩, ⟨8502, target56⟩, ⟨8504, target57⟩, ⟨8506, target58⟩, ⟨8548, target59⟩, ⟨8549, target60⟩, ⟨8568, target61⟩, ⟨8695, target62⟩, ⟨8696, target63⟩, ⟨8710, target64⟩, ⟨8753, target65⟩, ⟨8754, target66⟩, ⟨8796, target67⟩, ⟨8797, target68⟩, ⟨8868, target69⟩, ⟨8976, target70⟩, ⟨9060, target71⟩, ⟨9061, target72⟩, ⟨9075, target73⟩]
  indexMask := 70347782092379513186068228397973782623890446635663918422812687731455043949797842166648493452190550708248154793437178124473536882017400803716490535917062440072770891936429604836176140686714515273449995520803994934540887659580172094852390797637630842010267093515992474555198996393186360458703615559791660813649935208379993115794836519916213027274119673848647543454528082823502561079859423425169628945803894034195079992155220753023561849960174530053407469493345318413535778182704134460990211993993236236827850528627790609662590187449878588773289655447929914387764049495900103045143091883008764757295048743455908655204642361015001943971778448830141669798458895483143172000669442074842695318806776379668593293405905822537454320850316304845296363799407112652311188928028499553433838875822838251069771183062255767682294615456291878809666690882224871957943039588843162741224964461944287004263496794397486666152151155700909843924885719270629864633318441299713034575899858280681607790675952173946746469090508471691486929173809638153826375596887142942709519718960737059397414358748645045818558823009533205719220560864813298953723683529941030985427862201830484548026054101796262179644545085272132782870019391599404283070981258472511442985456337025404389462327825940786076235628671424948346025438787908173544888939745307399395424705529200560168333891033571237729419107167312852621119049557695710489095824049422957070860376586203113284341758191790304520995154728220037208479466711311363308465220648756477867521313974738558647412800864283400136465889530902627750705216086479701998231616088303948590320932954825064926010873181238260894937021198510487424092675723469329099311499114096917680830188436490164028424883796408302456653500403878262837491413327589003744558851516981532079497565966817095829873536428165528726755078896650511165524081196920921501037821507952893715268016559157169685784773166113034398739487950428123162118316626016916494480120721473737137864026129681132131954275216899283323227579741635543273193495214892952128767537882543844744546086864725666791359857141016382050302190735474724342423628698388673125316143597214932722984622033105182213192469219489740521912347944937546635850141095698963246505688269959288114036137804674964938432338335808653754729316043542837114055445845198590261903095823243639448954561320835209501425364998948805016755623972583404457854748482004571630615821621355628702919082810515411030945965280636074197693626783023124115738309633132433686596369673111253014638962028604323717529601067852486318904002521141617276788947402738300508518108201505315566019923619184560909661997847411143150157421129488874253655775690482161257943763914752023547294792180510332280431504534159171787181821418005488069469109158412288
  count := 74

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

end FranklSmallCyclic.TransportBatches.G084.B001.Data
