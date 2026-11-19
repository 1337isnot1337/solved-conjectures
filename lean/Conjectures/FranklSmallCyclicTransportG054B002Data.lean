module

public import Conjectures.FranklSmallCyclicRowCoverage
public import Conjectures.FranklSmallCyclicCanonicalWords
public import Conjectures.FranklSmallCyclicOrbit9Block001Data

/-! 128 literal targets sharing one source proof block.
Original words and row indices are retained; weights may be transported.
-/
@[expose] public section

namespace FranklSmallCyclic.TransportBatches.G054.B002.Data

-- Period 9, original row 8333, representative 6886.
def source0 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨12, by decide +kernel⟩

def target0 : Weights.Entry :=
  { word := [10, 10, 8, 10, 8, 6, 8], weights := [1, 1, 1, 1] }

def points0 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 8336, representative 6967.
def source1 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨91, by decide +kernel⟩

def target1 : Weights.Entry :=
  { word := [10, 10, 8, 10, 8, 10, 0], weights := [0, 1, 0, 1] }

def points1 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 8337, representative 6925.
def source2 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨49, by decide +kernel⟩

def target2 : Weights.Entry :=
  { word := [10, 10, 8, 10, 8, 10, 8], weights := [0, 1, 0, 1] }

def points2 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 8338, representative 6891.
def source3 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨16, by decide +kernel⟩

def target3 : Weights.Entry :=
  { word := [10, 10, 8, 12, 0, 4, 8], weights := [1, 0, 3, 0] }

def points3 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 8339, representative 6888.
def source4 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨13, by decide +kernel⟩

def target4 : Weights.Entry :=
  { word := [10, 10, 8, 12, 0, 12, 8], weights := [1, 0, 3, 0] }

def points4 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 8340, representative 6915.
def source5 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨39, by decide +kernel⟩

def target5 : Weights.Entry :=
  { word := [10, 10, 8, 12, 2, 0, 1], weights := [1, 1, 0, 1] }

def points5 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 8343, representative 6946.
def source6 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨70, by decide +kernel⟩

def target6 : Weights.Entry :=
  { word := [10, 10, 8, 12, 2, 0, 8], weights := [1, 1, 0, 1] }

def points6 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 8349, representative 6944.
def source7 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨68, by decide +kernel⟩

def target7 : Weights.Entry :=
  { word := [10, 10, 8, 12, 2, 8, 8], weights := [1, 1, 1, 1] }

def points7 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 8352, representative 6900.
def source8 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨25, by decide +kernel⟩

def target8 : Weights.Entry :=
  { word := [10, 10, 8, 12, 4, 4, 0], weights := [1, 0, 1, 0] }

def points8 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 8353, representative 6885.
def source9 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨11, by decide +kernel⟩

def target9 : Weights.Entry :=
  { word := [10, 10, 8, 12, 4, 4, 8], weights := [1, 1, 1, 1] }

def points9 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 8354, representative 6896.
def source10 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨21, by decide +kernel⟩

def target10 : Weights.Entry :=
  { word := [10, 10, 8, 12, 4, 12, 0], weights := [1, 0, 1, 0] }

def points10 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 8355, representative 6883.
def source11 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨9, by decide +kernel⟩

def target11 : Weights.Entry :=
  { word := [10, 10, 8, 12, 4, 12, 8], weights := [1, 1, 1, 1] }

def points11 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 8357, representative 6890.
def source12 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨15, by decide +kernel⟩

def target12 : Weights.Entry :=
  { word := [10, 10, 8, 12, 8, 4, 8], weights := [1, 0, 3, 0] }

def points12 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 8362, representative 6914.
def source13 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨38, by decide +kernel⟩

def target13 : Weights.Entry :=
  { word := [10, 10, 8, 12, 10, 0, 1], weights := [1, 1, 0, 1] }

def points13 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 8365, representative 6945.
def source14 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨69, by decide +kernel⟩

def target14 : Weights.Entry :=
  { word := [10, 10, 8, 12, 10, 0, 8], weights := [1, 1, 0, 1] }

def points14 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 8371, representative 6943.
def source15 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨67, by decide +kernel⟩

def target15 : Weights.Entry :=
  { word := [10, 10, 8, 12, 10, 8, 8], weights := [1, 1, 1, 1] }

def points15 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 8374, representative 6899.
def source16 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨24, by decide +kernel⟩

def target16 : Weights.Entry :=
  { word := [10, 10, 8, 12, 12, 4, 0], weights := [1, 0, 1, 0] }

def points16 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 8375, representative 6884.
def source17 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨10, by decide +kernel⟩

def target17 : Weights.Entry :=
  { word := [10, 10, 8, 12, 12, 4, 8], weights := [1, 1, 1, 1] }

def points17 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 8376, representative 6895.
def source18 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨20, by decide +kernel⟩

def target18 : Weights.Entry :=
  { word := [10, 10, 8, 12, 12, 12, 0], weights := [1, 0, 1, 0] }

def points18 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 8377, representative 6882.
def source19 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨8, by decide +kernel⟩

def target19 : Weights.Entry :=
  { word := [10, 10, 8, 12, 12, 12, 8], weights := [1, 1, 1, 1] }

def points19 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 8378, representative 6909.
def source20 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨33, by decide +kernel⟩

def target20 : Weights.Entry :=
  { word := [10, 10, 10, 8, 1, 0, 1], weights := [1, 1, 0, 1] }

def points20 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 8381, representative 6938.
def source21 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨62, by decide +kernel⟩

def target21 : Weights.Entry :=
  { word := [10, 10, 10, 8, 1, 0, 8], weights := [1, 1, 0, 1] }

def points21 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 8385, representative 6907.
def source22 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨32, by decide +kernel⟩

def target22 : Weights.Entry :=
  { word := [10, 10, 10, 8, 1, 8, 1], weights := [1, 1, 1, 1] }

def points22 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 8386, representative 6936.
def source23 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨60, by decide +kernel⟩

def target23 : Weights.Entry :=
  { word := [10, 10, 10, 8, 1, 8, 8], weights := [1, 1, 1, 1] }

def points23 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 8388, representative 6950.
def source24 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨74, by decide +kernel⟩

def target24 : Weights.Entry :=
  { word := [10, 10, 10, 8, 2, 8, 0], weights := [1, 0, 1, 0] }

def points24 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 8390, representative 6953.
def source25 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨77, by decide +kernel⟩

def target25 : Weights.Entry :=
  { word := [10, 10, 10, 8, 8, 8, 0], weights := [1, 0, 1, 0] }

def points25 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 8395, representative 6937.
def source26 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨61, by decide +kernel⟩

def target26 : Weights.Entry :=
  { word := [10, 10, 10, 8, 9, 0, 8], weights := [1, 1, 0, 1] }

def points26 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 8399, representative 6906.
def source27 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨31, by decide +kernel⟩

def target27 : Weights.Entry :=
  { word := [10, 10, 10, 8, 9, 8, 1], weights := [1, 1, 1, 1] }

def points27 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 8400, representative 6935.
def source28 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨59, by decide +kernel⟩

def target28 : Weights.Entry :=
  { word := [10, 10, 10, 8, 9, 8, 8], weights := [1, 1, 1, 1] }

def points28 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 8402, representative 6949.
def source29 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨73, by decide +kernel⟩

def target29 : Weights.Entry :=
  { word := [10, 10, 10, 8, 10, 8, 0], weights := [1, 0, 1, 0] }

def points29 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 8410, representative 6995.
def source30 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨119, by decide +kernel⟩

def target30 : Weights.Entry :=
  { word := [12, 0, 0, 9, 4, 4, 12], weights := [1, 0, 1, 1] }

def points30 : List (ℕ × ℕ) := [(0, 0), (1, 2), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 8414, representative 6992.
def source31 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨116, by decide +kernel⟩

def target31 : Weights.Entry :=
  { word := [12, 0, 0, 9, 12, 4, 12], weights := [1, 0, 1, 1] }

def points31 : List (ℕ × ℕ) := [(0, 0), (1, 2), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 8422, representative 6989.
def source32 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨113, by decide +kernel⟩

def target32 : Weights.Entry :=
  { word := [12, 0, 0, 12, 0, 4, 10], weights := [1, 0, 1, 0] }

def points32 : List (ℕ × ℕ) := [(0, 0), (1, 2), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 8423, representative 6989.
def source33 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨113, by decide +kernel⟩

def target33 : Weights.Entry :=
  { word := [12, 0, 0, 12, 0, 4, 12], weights := [1, 0, 1, 0] }

def points33 : List (ℕ × ℕ) := [(0, 0), (1, 2), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6), (7, 8), (8, 7)]

-- Period 9, original row 8476, representative 6999.
def source34 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨123, by decide +kernel⟩

def target34 : Weights.Entry :=
  { word := [12, 0, 4, 10, 8, 4, 12], weights := [0, 1, 1, 1] }

def points34 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 8501, representative 6993.
def source35 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨117, by decide +kernel⟩

def target35 : Weights.Entry :=
  { word := [12, 0, 8, 9, 4, 4, 12], weights := [1, 0, 1, 1] }

def points35 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 8505, representative 6990.
def source36 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨114, by decide +kernel⟩

def target36 : Weights.Entry :=
  { word := [12, 0, 8, 9, 12, 4, 12], weights := [1, 0, 1, 1] }

def points36 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 8551, representative 7000.
def source37 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨124, by decide +kernel⟩

def target37 : Weights.Entry :=
  { word := [12, 0, 12, 10, 0, 4, 10], weights := [1, 0, 1, 1] }

def points37 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 8552, representative 7000.
def source38 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨124, by decide +kernel⟩

def target38 : Weights.Entry :=
  { word := [12, 0, 12, 10, 0, 4, 12], weights := [1, 0, 1, 1] }

def points38 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 8569, representative 6998.
def source39 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨122, by decide +kernel⟩

def target39 : Weights.Entry :=
  { word := [12, 0, 12, 10, 8, 4, 12], weights := [0, 1, 1, 1] }

def points39 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 8601, representative 6989.
def source40 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨113, by decide +kernel⟩

def target40 : Weights.Entry :=
  { word := [12, 2, 0, 10, 0, 0, 10], weights := [0, 1, 0, 1] }

def points40 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 8602, representative 6989.
def source41 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨113, by decide +kernel⟩

def target41 : Weights.Entry :=
  { word := [12, 2, 0, 10, 0, 0, 12], weights := [0, 1, 0, 1] }

def points41 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 8608, representative 6987.
def source42 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨111, by decide +kernel⟩

def target42 : Weights.Entry :=
  { word := [12, 2, 0, 10, 0, 8, 12], weights := [1, 0, 0, 1] }

def points42 : List (ℕ × ℕ) := [(0, 0), (1, 2), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 8610, representative 6988.
def source43 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨112, by decide +kernel⟩

def target43 : Weights.Entry :=
  { word := [12, 2, 0, 10, 8, 0, 12], weights := [0, 1, 0, 1] }

def points43 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 8612, representative 6986.
def source44 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨110, by decide +kernel⟩

def target44 : Weights.Entry :=
  { word := [12, 2, 0, 10, 8, 8, 12], weights := [1, 0, 0, 1] }

def points44 : List (ℕ × ℕ) := [(0, 0), (1, 2), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 8618, representative 7000.
def source45 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨124, by decide +kernel⟩

def target45 : Weights.Entry :=
  { word := [12, 2, 0, 12, 10, 0, 10], weights := [1, 1, 0, 1] }

def points45 : List (ℕ × ℕ) := [(0, 0), (1, 2), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 8631, representative 6976.
def source46 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨100, by decide +kernel⟩

def target46 : Weights.Entry :=
  { word := [12, 2, 8, 2, 0, 8, 10], weights := [0, 1, 0, 1] }

def points46 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 8632, representative 6976.
def source47 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨100, by decide +kernel⟩

def target47 : Weights.Entry :=
  { word := [12, 2, 8, 2, 0, 8, 12], weights := [0, 1, 0, 1] }

def points47 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 8640, representative 6977.
def source48 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨101, by decide +kernel⟩

def target48 : Weights.Entry :=
  { word := [12, 2, 8, 2, 8, 8, 12], weights := [0, 1, 0, 1] }

def points48 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 8664, representative 6979.
def source49 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨103, by decide +kernel⟩

def target49 : Weights.Entry :=
  { word := [12, 2, 8, 10, 0, 8, 10], weights := [0, 1, 0, 1] }

def points49 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 8665, representative 6979.
def source50 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨103, by decide +kernel⟩

def target50 : Weights.Entry :=
  { word := [12, 2, 8, 10, 0, 8, 12], weights := [0, 1, 0, 1] }

def points50 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 8676, representative 6978.
def source51 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨102, by decide +kernel⟩

def target51 : Weights.Entry :=
  { word := [12, 2, 8, 10, 8, 8, 12], weights := [0, 1, 0, 1] }

def points51 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 8756, representative 6976.
def source52 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨100, by decide +kernel⟩

def target52 : Weights.Entry :=
  { word := [12, 8, 0, 4, 8, 4, 10], weights := [1, 0, 1, 0] }

def points52 : List (ℕ × ℕ) := [(0, 0), (1, 2), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 8757, representative 6980.
def source53 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨104, by decide +kernel⟩

def target53 : Weights.Entry :=
  { word := [12, 8, 0, 4, 8, 4, 12], weights := [1, 0, 0, 1] }

def points53 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 8799, representative 6979.
def source54 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨103, by decide +kernel⟩

def target54 : Weights.Entry :=
  { word := [12, 8, 0, 12, 8, 4, 10], weights := [1, 0, 1, 0] }

def points54 : List (ℕ × ℕ) := [(0, 0), (1, 2), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 8800, representative 6983.
def source55 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨107, by decide +kernel⟩

def target55 : Weights.Entry :=
  { word := [12, 8, 0, 12, 8, 4, 12], weights := [1, 0, 0, 1] }

def points55 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 8869, representative 6997.
def source56 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨121, by decide +kernel⟩

def target56 : Weights.Entry :=
  { word := [12, 8, 4, 10, 8, 4, 12], weights := [1, 1, 1, 1] }

def points56 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 8977, representative 6996.
def source57 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨120, by decide +kernel⟩

def target57 : Weights.Entry :=
  { word := [12, 8, 12, 10, 8, 4, 12], weights := [1, 1, 1, 1] }

def points57 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 9004, representative 6917.
def source58 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨41, by decide +kernel⟩

def target58 : Weights.Entry :=
  { word := [12, 10, 0, 12, 2, 0, 1], weights := [1, 1, 0, 1] }

def points58 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 9007, representative 6948.
def source59 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨72, by decide +kernel⟩

def target59 : Weights.Entry :=
  { word := [12, 10, 0, 12, 2, 0, 8], weights := [1, 1, 0, 1] }

def points59 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 9011, representative 6917.
def source60 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨41, by decide +kernel⟩

def target60 : Weights.Entry :=
  { word := [12, 10, 0, 12, 4, 4, 0], weights := [1, 1, 1, 0] }

def points60 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 5), (4, 6), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 9012, representative 6916.
def source61 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨40, by decide +kernel⟩

def target61 : Weights.Entry :=
  { word := [12, 10, 0, 12, 10, 0, 1], weights := [1, 1, 0, 1] }

def points61 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 9015, representative 6947.
def source62 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨71, by decide +kernel⟩

def target62 : Weights.Entry :=
  { word := [12, 10, 0, 12, 10, 0, 8], weights := [1, 1, 0, 1] }

def points62 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 9019, representative 6916.
def source63 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨40, by decide +kernel⟩

def target63 : Weights.Entry :=
  { word := [12, 10, 0, 12, 12, 4, 0], weights := [1, 1, 1, 0] }

def points63 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 5), (4, 6), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 9020, representative 6963.
def source64 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨87, by decide +kernel⟩

def target64 : Weights.Entry :=
  { word := [12, 10, 8, 2, 8, 2, 0], weights := [0, 1, 0, 1] }

def points64 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 9021, representative 6920.
def source65 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨44, by decide +kernel⟩

def target65 : Weights.Entry :=
  { word := [12, 10, 8, 2, 8, 2, 8], weights := [0, 1, 0, 1] }

def points65 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 9024, representative 6961.
def source66 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨85, by decide +kernel⟩

def target66 : Weights.Entry :=
  { word := [12, 10, 8, 2, 8, 10, 0], weights := [0, 1, 0, 1] }

def points66 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 9025, representative 6918.
def source67 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨42, by decide +kernel⟩

def target67 : Weights.Entry :=
  { word := [12, 10, 8, 2, 8, 10, 8], weights := [0, 1, 0, 1] }

def points67 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 9026, representative 6877.
def source68 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨3, by decide +kernel⟩

def target68 : Weights.Entry :=
  { word := [12, 10, 8, 4, 4, 4, 0], weights := [1, 0, 1, 0] }

def points68 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 9028, representative 6878.
def source69 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨4, by decide +kernel⟩

def target69 : Weights.Entry :=
  { word := [12, 10, 8, 4, 12, 4, 0], weights := [1, 0, 1, 0] }

def points69 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 9029, representative 6874.
def source70 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨0, by decide +kernel⟩

def target70 : Weights.Entry :=
  { word := [12, 10, 8, 4, 12, 12, 0], weights := [1, 0, 1, 0] }

def points70 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 9030, representative 6958.
def source71 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨82, by decide +kernel⟩

def target71 : Weights.Entry :=
  { word := [12, 10, 8, 8, 4, 2, 0], weights := [0, 1, 1, 0] }

def points71 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 9032, representative 6956.
def source72 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨80, by decide +kernel⟩

def target72 : Weights.Entry :=
  { word := [12, 10, 8, 8, 4, 10, 0], weights := [0, 1, 1, 0] }

def points72 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 9033, representative 6957.
def source73 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨81, by decide +kernel⟩

def target73 : Weights.Entry :=
  { word := [12, 10, 8, 8, 12, 2, 0], weights := [0, 1, 1, 0] }

def points73 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 9035, representative 6955.
def source74 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨79, by decide +kernel⟩

def target74 : Weights.Entry :=
  { word := [12, 10, 8, 8, 12, 10, 0], weights := [0, 1, 1, 0] }

def points74 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 9036, representative 6964.
def source75 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨88, by decide +kernel⟩

def target75 : Weights.Entry :=
  { word := [12, 10, 8, 10, 8, 2, 0], weights := [0, 1, 0, 1] }

def points75 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 9037, representative 6921.
def source76 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨45, by decide +kernel⟩

def target76 : Weights.Entry :=
  { word := [12, 10, 8, 10, 8, 2, 8], weights := [0, 1, 0, 1] }

def points76 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 9038, representative 6881.
def source77 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨7, by decide +kernel⟩

def target77 : Weights.Entry :=
  { word := [12, 10, 8, 10, 8, 6, 0], weights := [0, 1, 1, 0] }

def points77 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 9042, representative 6962.
def source78 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨86, by decide +kernel⟩

def target78 : Weights.Entry :=
  { word := [12, 10, 8, 10, 8, 10, 0], weights := [0, 1, 0, 1] }

def points78 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 9043, representative 6919.
def source79 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨43, by decide +kernel⟩

def target79 : Weights.Entry :=
  { word := [12, 10, 8, 10, 8, 10, 8], weights := [0, 1, 0, 1] }

def points79 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 9046, representative 6880.
def source80 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨6, by decide +kernel⟩

def target80 : Weights.Entry :=
  { word := [12, 10, 8, 12, 4, 4, 0], weights := [0, 1, 1, 0] }

def points80 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 9048, representative 6876.
def source81 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨2, by decide +kernel⟩

def target81 : Weights.Entry :=
  { word := [12, 10, 8, 12, 4, 12, 0], weights := [0, 1, 1, 0] }

def points81 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 9050, representative 6879.
def source82 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨5, by decide +kernel⟩

def target82 : Weights.Entry :=
  { word := [12, 10, 8, 12, 12, 4, 0], weights := [0, 1, 1, 0] }

def points82 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 9052, representative 6875.
def source83 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨1, by decide +kernel⟩

def target83 : Weights.Entry :=
  { word := [12, 10, 8, 12, 12, 12, 0], weights := [0, 1, 1, 0] }

def points83 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 10, original row 129, representative 6913.
def source84 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨37, by decide +kernel⟩

def target84 : Weights.Entry :=
  { word := [0, 1, 0, 9, 4, 12, 12], weights := [1, 0, 1, 1] }

def points84 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 10, original row 133, representative 6909.
def source85 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨33, by decide +kernel⟩

def target85 : Weights.Entry :=
  { word := [0, 1, 0, 9, 12, 12, 12], weights := [1, 0, 1, 1] }

def points85 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 10, original row 189, representative 6917.
def source86 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨41, by decide +kernel⟩

def target86 : Weights.Entry :=
  { word := [0, 1, 4, 10, 0, 12, 10], weights := [1, 0, 1, 1] }

def points86 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 10, original row 190, representative 6917.
def source87 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨41, by decide +kernel⟩

def target87 : Weights.Entry :=
  { word := [0, 1, 4, 10, 0, 12, 12], weights := [1, 0, 1, 1] }

def points87 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 8), (8, 7)]

-- Period 10, original row 198, representative 6915.
def source88 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨39, by decide +kernel⟩

def target88 : Weights.Entry :=
  { word := [0, 1, 4, 10, 8, 12, 12], weights := [1, 0, 1, 1] }

def points88 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 10, original row 220, representative 6912.
def source89 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨36, by decide +kernel⟩

def target89 : Weights.Entry :=
  { word := [0, 1, 8, 9, 4, 12, 12], weights := [1, 0, 1, 1] }

def points89 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 10, original row 282, representative 6916.
def source90 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨40, by decide +kernel⟩

def target90 : Weights.Entry :=
  { word := [0, 1, 12, 10, 0, 12, 10], weights := [1, 0, 1, 1] }

def points90 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 10, original row 283, representative 6916.
def source91 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨40, by decide +kernel⟩

def target91 : Weights.Entry :=
  { word := [0, 1, 12, 10, 0, 12, 12], weights := [1, 0, 1, 1] }

def points91 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 8), (8, 7)]

-- Period 10, original row 291, representative 6914.
def source92 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨38, by decide +kernel⟩

def target92 : Weights.Entry :=
  { word := [0, 1, 12, 10, 8, 12, 12], weights := [1, 0, 1, 1] }

def points92 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 10, original row 309, representative 6905.
def source93 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨30, by decide +kernel⟩

def target93 : Weights.Entry :=
  { word := [0, 2, 0, 8, 8, 12, 12], weights := [0, 1, 0, 1] }

def points93 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 10, original row 364, representative 6877.
def source94 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨3, by decide +kernel⟩

def target94 : Weights.Entry :=
  { word := [0, 2, 2, 2, 8, 12, 10], weights := [0, 1, 0, 1] }

def points94 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 10, original row 365, representative 6897.
def source95 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨22, by decide +kernel⟩

def target95 : Weights.Entry :=
  { word := [0, 2, 2, 2, 8, 12, 12], weights := [0, 1, 0, 1] }

def points95 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 10, original row 381, representative 6917.
def source96 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨41, by decide +kernel⟩

def target96 : Weights.Entry :=
  { word := [0, 2, 2, 10, 0, 12, 10], weights := [0, 1, 1, 1] }

def points96 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 10, original row 382, representative 6917.
def source97 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨41, by decide +kernel⟩

def target97 : Weights.Entry :=
  { word := [0, 2, 2, 10, 0, 12, 12], weights := [0, 1, 1, 1] }

def points97 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6), (7, 8), (8, 7)]

-- Period 10, original row 409, representative 6880.
def source98 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨6, by decide +kernel⟩

def target98 : Weights.Entry :=
  { word := [0, 2, 2, 10, 8, 12, 10], weights := [0, 1, 1, 0] }

def points98 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 10, original row 410, representative 6900.
def source99 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨25, by decide +kernel⟩

def target99 : Weights.Entry :=
  { word := [0, 2, 2, 10, 8, 12, 12], weights := [0, 1, 0, 1] }

def points99 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 10, original row 462, representative 6878.
def source100 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨4, by decide +kernel⟩

def target100 : Weights.Entry :=
  { word := [0, 2, 10, 2, 8, 12, 10], weights := [0, 1, 0, 1] }

def points100 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 10, original row 463, representative 6898.
def source101 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨23, by decide +kernel⟩

def target101 : Weights.Entry :=
  { word := [0, 2, 10, 2, 8, 12, 12], weights := [0, 1, 0, 1] }

def points101 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 10, original row 483, representative 6916.
def source102 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨40, by decide +kernel⟩

def target102 : Weights.Entry :=
  { word := [0, 2, 10, 10, 0, 12, 10], weights := [0, 1, 1, 1] }

def points102 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 10, original row 484, representative 6916.
def source103 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨40, by decide +kernel⟩

def target103 : Weights.Entry :=
  { word := [0, 2, 10, 10, 0, 12, 12], weights := [0, 1, 1, 1] }

def points103 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6), (7, 8), (8, 7)]

-- Period 10, original row 504, representative 6879.
def source104 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨5, by decide +kernel⟩

def target104 : Weights.Entry :=
  { word := [0, 2, 10, 10, 8, 12, 10], weights := [0, 1, 1, 0] }

def points104 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 10, original row 505, representative 6899.
def source105 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨24, by decide +kernel⟩

def target105 : Weights.Entry :=
  { word := [0, 2, 10, 10, 8, 12, 12], weights := [0, 1, 0, 1] }

def points105 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 10, original row 593, representative 6958.
def source106 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨82, by decide +kernel⟩

def target106 : Weights.Entry :=
  { word := [0, 4, 2, 8, 8, 12, 10], weights := [0, 1, 1, 0] }

def points106 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 10, original row 659, representative 6963.
def source107 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨87, by decide +kernel⟩

def target107 : Weights.Entry :=
  { word := [0, 4, 8, 4, 8, 12, 10], weights := [1, 0, 1, 0] }

def points107 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 10, original row 660, representative 6969.
def source108 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨93, by decide +kernel⟩

def target108 : Weights.Entry :=
  { word := [0, 4, 8, 4, 8, 12, 12], weights := [1, 0, 0, 1] }

def points108 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 10, original row 687, representative 6964.
def source109 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨88, by decide +kernel⟩

def target109 : Weights.Entry :=
  { word := [0, 4, 8, 12, 8, 12, 10], weights := [1, 0, 1, 0] }

def points109 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 10, original row 688, representative 6970.
def source110 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨94, by decide +kernel⟩

def target110 : Weights.Entry :=
  { word := [0, 4, 8, 12, 8, 12, 12], weights := [1, 0, 1, 0] }

def points110 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 10, original row 713, representative 6957.
def source111 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨81, by decide +kernel⟩

def target111 : Weights.Entry :=
  { word := [0, 4, 10, 8, 8, 12, 10], weights := [0, 1, 1, 0] }

def points111 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 10, original row 745, representative 6902.
def source112 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨27, by decide +kernel⟩

def target112 : Weights.Entry :=
  { word := [0, 6, 0, 12, 8, 12, 12], weights := [0, 1, 0, 1] }

def points112 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 10, original row 776, representative 6881.
def source113 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨7, by decide +kernel⟩

def target113 : Weights.Entry :=
  { word := [0, 6, 8, 12, 8, 12, 10], weights := [0, 1, 1, 0] }

def points113 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 10, original row 777, representative 6901.
def source114 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨26, by decide +kernel⟩

def target114 : Weights.Entry :=
  { word := [0, 6, 8, 12, 8, 12, 12], weights := [0, 1, 0, 1] }

def points114 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 10, original row 800, representative 6973.
def source115 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨97, by decide +kernel⟩

def target115 : Weights.Entry :=
  { word := [0, 8, 0, 0, 1, 12, 12], weights := [0, 0, 1, 1] }

def points115 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 10, original row 804, representative 6959.
def source116 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨83, by decide +kernel⟩

def target116 : Weights.Entry :=
  { word := [0, 8, 0, 0, 9, 12, 12], weights := [0, 0, 1, 1] }

def points116 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 10, original row 812, representative 6973.
def source117 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨97, by decide +kernel⟩

def target117 : Weights.Entry :=
  { word := [0, 8, 0, 4, 0, 12, 12], weights := [0, 0, 1, 1] }

def points117 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 10, original row 838, representative 6971.
def source118 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨95, by decide +kernel⟩

def target118 : Weights.Entry :=
  { word := [0, 8, 0, 4, 8, 12, 12], weights := [1, 0, 0, 1] }

def points118 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 10, original row 860, representative 6974.
def source119 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨98, by decide +kernel⟩

def target119 : Weights.Entry :=
  { word := [0, 8, 0, 8, 1, 12, 12], weights := [0, 1, 1, 0] }

def points119 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 10, original row 867, representative 6975.
def source120 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨99, by decide +kernel⟩

def target120 : Weights.Entry :=
  { word := [0, 8, 0, 8, 8, 12, 12], weights := [0, 1, 0, 1] }

def points120 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 10, original row 871, representative 6960.
def source121 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨84, by decide +kernel⟩

def target121 : Weights.Entry :=
  { word := [0, 8, 0, 8, 9, 12, 12], weights := [0, 1, 1, 0] }

def points121 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 10, original row 881, representative 6974.
def source122 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨98, by decide +kernel⟩

def target122 : Weights.Entry :=
  { word := [0, 8, 0, 12, 0, 12, 12], weights := [1, 0, 1, 0] }

def points122 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 10, original row 890, representative 6972.
def source123 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨96, by decide +kernel⟩

def target123 : Weights.Entry :=
  { word := [0, 8, 0, 12, 8, 12, 12], weights := [1, 0, 1, 0] }

def points123 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 10, original row 913, representative 6965.
def source124 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨89, by decide +kernel⟩

def target124 : Weights.Entry :=
  { word := [0, 8, 1, 4, 8, 12, 12], weights := [1, 0, 0, 1] }

def points124 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 10, original row 936, representative 6968.
def source125 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨92, by decide +kernel⟩

def target125 : Weights.Entry :=
  { word := [0, 8, 1, 12, 8, 12, 12], weights := [1, 0, 1, 0] }

def points125 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 10, original row 1007, representative 6952.
def source126 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨76, by decide +kernel⟩

def target126 : Weights.Entry :=
  { word := [0, 8, 4, 8, 4, 12, 12], weights := [0, 1, 0, 1] }

def points126 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 10, original row 1011, representative 6950.
def source127 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨74, by decide +kernel⟩

def target127 : Weights.Entry :=
  { word := [0, 8, 4, 8, 12, 12, 12], weights := [0, 1, 0, 1] }

def points127 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

def period9Entries : List Weights.Entry := [target0, target1, target2, target3, target4, target5, target6, target7, target8, target9, target10, target11, target12, target13, target14, target15, target16, target17, target18, target19, target20, target21, target22, target23, target24, target25, target26, target27, target28, target29, target30, target31, target32, target33, target34, target35, target36, target37, target38, target39, target40, target41, target42, target43, target44, target45, target46, target47, target48, target49, target50, target51, target52, target53, target54, target55, target56, target57, target58, target59, target60, target61, target62, target63, target64, target65, target66, target67, target68, target69, target70, target71, target72, target73, target74, target75, target76, target77, target78, target79, target80, target81, target82, target83]

def period9Chunk : RowCoverage.Chunk where
  rows := [⟨8333, target0⟩, ⟨8336, target1⟩, ⟨8337, target2⟩, ⟨8338, target3⟩, ⟨8339, target4⟩, ⟨8340, target5⟩, ⟨8343, target6⟩, ⟨8349, target7⟩, ⟨8352, target8⟩, ⟨8353, target9⟩, ⟨8354, target10⟩, ⟨8355, target11⟩, ⟨8357, target12⟩, ⟨8362, target13⟩, ⟨8365, target14⟩, ⟨8371, target15⟩, ⟨8374, target16⟩, ⟨8375, target17⟩, ⟨8376, target18⟩, ⟨8377, target19⟩, ⟨8378, target20⟩, ⟨8381, target21⟩, ⟨8385, target22⟩, ⟨8386, target23⟩, ⟨8388, target24⟩, ⟨8390, target25⟩, ⟨8395, target26⟩, ⟨8399, target27⟩, ⟨8400, target28⟩, ⟨8402, target29⟩, ⟨8410, target30⟩, ⟨8414, target31⟩, ⟨8422, target32⟩, ⟨8423, target33⟩, ⟨8476, target34⟩, ⟨8501, target35⟩, ⟨8505, target36⟩, ⟨8551, target37⟩, ⟨8552, target38⟩, ⟨8569, target39⟩, ⟨8601, target40⟩, ⟨8602, target41⟩, ⟨8608, target42⟩, ⟨8610, target43⟩, ⟨8612, target44⟩, ⟨8618, target45⟩, ⟨8631, target46⟩, ⟨8632, target47⟩, ⟨8640, target48⟩, ⟨8664, target49⟩, ⟨8665, target50⟩, ⟨8676, target51⟩, ⟨8756, target52⟩, ⟨8757, target53⟩, ⟨8799, target54⟩, ⟨8800, target55⟩, ⟨8869, target56⟩, ⟨8977, target57⟩, ⟨9004, target58⟩, ⟨9007, target59⟩, ⟨9011, target60⟩, ⟨9012, target61⟩, ⟨9015, target62⟩, ⟨9019, target63⟩, ⟨9020, target64⟩, ⟨9021, target65⟩, ⟨9024, target66⟩, ⟨9025, target67⟩, ⟨9026, target68⟩, ⟨9028, target69⟩, ⟨9029, target70⟩, ⟨9030, target71⟩, ⟨9032, target72⟩, ⟨9033, target73⟩, ⟨9035, target74⟩, ⟨9036, target75⟩, ⟨9037, target76⟩, ⟨9038, target77⟩, ⟨9042, target78⟩, ⟨9043, target79⟩, ⟨9046, target80⟩, ⟨9048, target81⟩, ⟨9050, target82⟩, ⟨9052, target83⟩]
  indexMask := 11162335349428767175801047561411069616956719335983110609800653571184133149470772031944220797012977170129855787830180480601811837518212618304732865026835015047245915898731019060730883587653610899202102987682245425036624755657319926259625031370906853624768885709883694005581519860555424048279336737606870545074410393454456927654206731711020096908518147803585338840382238754498553369426592890014972617654592244111044390306995046486666042739258168734138284592685687740140027093993604420740826968169319443360724578683806957843421952816412929988423366504953964323374918195443898179632254100189334211307346733508907997138175370760973766596747434225151436954400165203539731977413897243802325081160057684464983442847914650864000840414547346987431125785111333402038370506016980403133642348103179722675650337467987034314688560236236227253893619815307675965845331843646673808037274139075689925541368791344108399973087924683144972304319530997998855918271124404065116909543340202765949357906705235129723834014567996111561313379468825281071344879707765223203890419136998220604375096991802741372874593020406167815914903285936810114874411554274527252419655913352057856225524880305447047961064435825203173184533524664205980344282781105126130085523050056022327908582664035560122600841164605324323880482784871766656363014645277401240158032572318784608178076551228304234951476099606765482650384024742886314197078533184587419492390785594451877803420994647194612633743263523279530402289473023686279768198870646467840649879090197657167144062077797009750482807205875577832845524746921619679054683084850770868280290959788045005371048148268942764916798140188146642293463987443354322014273520370584576209862578582620134505845544676936783900724910949333589730029579079832451055944118204743953878698036661964004051765908854826016099286216260428953219419447088159352343609118726770228312578565125962590590021894749633503778211238009258482285163646359950899519633700702750635050368139967791133293270596627164008135895860863831040426657770872277275411989944493703870469236215295647243550959015078193477015316169981901526102906198583197912016137847186781435598160390021098589636739420519035717160608359210371374128206589562846456037855985830354803220388412189684547757045736335190888268410282413032600127614806270175197933754163954254809986897894350283871366662510850033601677659996162644095586623716783857658512086184479560736385131705200260003929131095266406669469376945305464752848378036384857451640469874303046087969655719680258482050474637642101317005864809133854512087152759851396275077147650286612089729345391551424360216632396661888995289299970196004453596646706723693793748250411897213910029609067860627199368083440722155484055357967785229656271093760
  count := 84

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

def period10Entries : List Weights.Entry := [target84, target85, target86, target87, target88, target89, target90, target91, target92, target93, target94, target95, target96, target97, target98, target99, target100, target101, target102, target103, target104, target105, target106, target107, target108, target109, target110, target111, target112, target113, target114, target115, target116, target117, target118, target119, target120, target121, target122, target123, target124, target125, target126, target127]

def period10Chunk : RowCoverage.Chunk where
  rows := [⟨129, target84⟩, ⟨133, target85⟩, ⟨189, target86⟩, ⟨190, target87⟩, ⟨198, target88⟩, ⟨220, target89⟩, ⟨282, target90⟩, ⟨283, target91⟩, ⟨291, target92⟩, ⟨309, target93⟩, ⟨364, target94⟩, ⟨365, target95⟩, ⟨381, target96⟩, ⟨382, target97⟩, ⟨409, target98⟩, ⟨410, target99⟩, ⟨462, target100⟩, ⟨463, target101⟩, ⟨483, target102⟩, ⟨484, target103⟩, ⟨504, target104⟩, ⟨505, target105⟩, ⟨593, target106⟩, ⟨659, target107⟩, ⟨660, target108⟩, ⟨687, target109⟩, ⟨688, target110⟩, ⟨713, target111⟩, ⟨745, target112⟩, ⟨776, target113⟩, ⟨777, target114⟩, ⟨800, target115⟩, ⟨804, target116⟩, ⟨812, target117⟩, ⟨838, target118⟩, ⟨860, target119⟩, ⟨867, target120⟩, ⟨871, target121⟩, ⟨881, target122⟩, ⟨890, target123⟩, ⟨913, target124⟩, ⟨936, target125⟩, ⟨1007, target126⟩, ⟨1011, target127⟩]
  indexMask := 23316027292373176903838309933594758160880829165784234778665857899772289007753209166511121625952520451806167825082072336872406022062514090419576121035262903512663133733094110773551360095929764057241432481783923612597799148009685276555783255866191098061948874770092244680787024331296382288214788408336187392
  count := 44

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

end FranklSmallCyclic.TransportBatches.G054.B002.Data
