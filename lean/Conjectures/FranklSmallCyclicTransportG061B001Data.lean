module

public import Conjectures.FranklSmallCyclicRowCoverage
public import Conjectures.FranklSmallCyclicCanonicalWords
public import Conjectures.FranklSmallCyclicOrbit9Block008Data

/-! 128 literal targets sharing one source proof block.
Original words and row indices are retained; weights may be transported.
-/
@[expose] public section

namespace FranklSmallCyclic.TransportBatches.G061.B001.Data

-- Period 9, original row 5838, representative 7785.
def source0 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B008.Data.entryAt ⟨10, by decide +kernel⟩

def target0 : Weights.Entry :=
  { word := [8, 8, 12, 10, 8, 8, 12], weights := [1, 0, 0, 1] }

-- Period 9, original row 5849, representative 7876.
def source1 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B008.Data.entryAt ⟨101, by decide +kernel⟩

def target1 : Weights.Entry :=
  { word := [8, 9, 0, 1, 4, 2, 8], weights := [1, 2, 1, 0] }

def points1 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2)]

-- Period 9, original row 5853, representative 7871.
def source2 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B008.Data.entryAt ⟨96, by decide +kernel⟩

def target2 : Weights.Entry :=
  { word := [8, 9, 0, 1, 4, 10, 8], weights := [1, 2, 1, 0] }

-- Period 9, original row 5855, representative 7879.
def source3 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B008.Data.entryAt ⟨104, by decide +kernel⟩

def target3 : Weights.Entry :=
  { word := [8, 9, 0, 1, 12, 2, 8], weights := [1, 2, 1, 0] }

def points3 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2)]

-- Period 9, original row 5859, representative 7874.
def source4 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B008.Data.entryAt ⟨99, by decide +kernel⟩

def target4 : Weights.Entry :=
  { word := [8, 9, 0, 1, 12, 10, 8], weights := [1, 2, 1, 0] }

-- Period 9, original row 5887, representative 7900.
def source5 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B008.Data.entryAt ⟨125, by decide +kernel⟩

def target5 : Weights.Entry :=
  { word := [8, 9, 0, 4, 6, 0, 8], weights := [1, 0, 0, 1] }

def points5 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2)]

-- Period 9, original row 5889, representative 7888.
def source6 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B008.Data.entryAt ⟨113, by decide +kernel⟩

def target6 : Weights.Entry :=
  { word := [8, 9, 0, 4, 6, 8, 8], weights := [1, 0, 0, 1] }

def points6 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2)]

-- Period 9, original row 5948, representative 7891.
def source7 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B008.Data.entryAt ⟨116, by decide +kernel⟩

def target7 : Weights.Entry :=
  { word := [8, 9, 0, 12, 6, 8, 8], weights := [1, 0, 0, 1] }

def points7 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2)]

-- Period 9, original row 5972, representative 7892.
def source8 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B008.Data.entryAt ⟨117, by decide +kernel⟩

def target8 : Weights.Entry :=
  { word := [8, 9, 4, 4, 4, 0, 8], weights := [1, 0, 0, 1] }

def points8 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 5974, representative 7880.
def source9 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B008.Data.entryAt ⟨105, by decide +kernel⟩

def target9 : Weights.Entry :=
  { word := [8, 9, 4, 4, 4, 8, 8], weights := [1, 0, 0, 1] }

def points9 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 5976, representative 7897.
def source10 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B008.Data.entryAt ⟨122, by decide +kernel⟩

def target10 : Weights.Entry :=
  { word := [8, 9, 4, 4, 12, 0, 8], weights := [1, 0, 0, 1] }

def points10 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 5978, representative 7885.
def source11 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B008.Data.entryAt ⟨110, by decide +kernel⟩

def target11 : Weights.Entry :=
  { word := [8, 9, 4, 4, 12, 8, 8], weights := [1, 0, 0, 1] }

def points11 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 5979, representative 7899.
def source12 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B008.Data.entryAt ⟨124, by decide +kernel⟩

def target12 : Weights.Entry :=
  { word := [8, 9, 4, 12, 4, 0, 8], weights := [1, 0, 0, 1] }

def points12 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 5981, representative 7887.
def source13 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B008.Data.entryAt ⟨112, by decide +kernel⟩

def target13 : Weights.Entry :=
  { word := [8, 9, 4, 12, 4, 8, 8], weights := [0, 1, 1, 0] }

def points13 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 5982, representative 7898.
def source14 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B008.Data.entryAt ⟨123, by decide +kernel⟩

def target14 : Weights.Entry :=
  { word := [8, 9, 4, 12, 12, 0, 8], weights := [0, 1, 1, 0] }

def points14 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 5984, representative 7886.
def source15 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B008.Data.entryAt ⟨111, by decide +kernel⟩

def target15 : Weights.Entry :=
  { word := [8, 9, 4, 12, 12, 8, 8], weights := [0, 1, 1, 0] }

def points15 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 5986, representative 7877.
def source16 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B008.Data.entryAt ⟨102, by decide +kernel⟩

def target16 : Weights.Entry :=
  { word := [8, 9, 8, 1, 4, 2, 8], weights := [1, 2, 1, 0] }

def points16 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 5990, representative 7872.
def source17 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B008.Data.entryAt ⟨97, by decide +kernel⟩

def target17 : Weights.Entry :=
  { word := [8, 9, 8, 1, 4, 10, 8], weights := [1, 2, 1, 0] }

-- Period 9, original row 5992, representative 7878.
def source18 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B008.Data.entryAt ⟨103, by decide +kernel⟩

def target18 : Weights.Entry :=
  { word := [8, 9, 8, 1, 12, 2, 8], weights := [1, 2, 1, 0] }

def points18 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 5996, representative 7873.
def source19 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B008.Data.entryAt ⟨98, by decide +kernel⟩

def target19 : Weights.Entry :=
  { word := [8, 9, 8, 1, 12, 10, 8], weights := [1, 2, 1, 0] }

-- Period 9, original row 6010, representative 7901.
def source20 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B008.Data.entryAt ⟨126, by decide +kernel⟩

def target20 : Weights.Entry :=
  { word := [8, 9, 8, 4, 6, 0, 8], weights := [1, 0, 0, 1] }

def points20 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 6012, representative 7889.
def source21 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B008.Data.entryAt ⟨114, by decide +kernel⟩

def target21 : Weights.Entry :=
  { word := [8, 9, 8, 4, 6, 8, 8], weights := [1, 0, 0, 1] }

def points21 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 6019, representative 7875.
def source22 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B008.Data.entryAt ⟨100, by decide +kernel⟩

def target22 : Weights.Entry :=
  { word := [8, 9, 8, 8, 6, 2, 8], weights := [0, 1, 1, 0] }

def points22 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 6021, representative 7870.
def source23 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B008.Data.entryAt ⟨95, by decide +kernel⟩

def target23 : Weights.Entry :=
  { word := [8, 9, 8, 8, 6, 10, 8], weights := [0, 1, 1, 0] }

-- Period 9, original row 6039, representative 7902.
def source24 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B008.Data.entryAt ⟨127, by decide +kernel⟩

def target24 : Weights.Entry :=
  { word := [8, 9, 8, 12, 6, 0, 8], weights := [0, 1, 1, 0] }

def points24 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 6041, representative 7890.
def source25 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B008.Data.entryAt ⟨115, by decide +kernel⟩

def target25 : Weights.Entry :=
  { word := [8, 9, 8, 12, 6, 8, 8], weights := [0, 1, 1, 0] }

def points25 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 6047, representative 7893.
def source26 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B008.Data.entryAt ⟨118, by decide +kernel⟩

def target26 : Weights.Entry :=
  { word := [8, 9, 12, 4, 4, 0, 8], weights := [1, 0, 0, 1] }

def points26 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 6049, representative 7881.
def source27 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B008.Data.entryAt ⟨106, by decide +kernel⟩

def target27 : Weights.Entry :=
  { word := [8, 9, 12, 4, 4, 8, 8], weights := [1, 0, 0, 1] }

def points27 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 6051, representative 7894.
def source28 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B008.Data.entryAt ⟨119, by decide +kernel⟩

def target28 : Weights.Entry :=
  { word := [8, 9, 12, 4, 12, 0, 8], weights := [1, 0, 0, 1] }

def points28 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 6053, representative 7882.
def source29 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B008.Data.entryAt ⟨107, by decide +kernel⟩

def target29 : Weights.Entry :=
  { word := [8, 9, 12, 4, 12, 8, 8], weights := [1, 0, 0, 1] }

def points29 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 6054, representative 7896.
def source30 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B008.Data.entryAt ⟨121, by decide +kernel⟩

def target30 : Weights.Entry :=
  { word := [8, 9, 12, 12, 4, 0, 8], weights := [1, 0, 0, 1] }

def points30 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 6056, representative 7884.
def source31 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B008.Data.entryAt ⟨109, by decide +kernel⟩

def target31 : Weights.Entry :=
  { word := [8, 9, 12, 12, 4, 8, 8], weights := [0, 1, 1, 0] }

def points31 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 6057, representative 7895.
def source32 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B008.Data.entryAt ⟨120, by decide +kernel⟩

def target32 : Weights.Entry :=
  { word := [8, 9, 12, 12, 12, 0, 8], weights := [0, 1, 1, 0] }

def points32 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 6059, representative 7883.
def source33 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B008.Data.entryAt ⟨108, by decide +kernel⟩

def target33 : Weights.Entry :=
  { word := [8, 9, 12, 12, 12, 8, 8], weights := [0, 1, 1, 0] }

def points33 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 6337, representative 7800.
def source34 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B008.Data.entryAt ⟨25, by decide +kernel⟩

def target34 : Weights.Entry :=
  { word := [8, 12, 0, 4, 2, 0, 10], weights := [1, 0, 1, 0] }

def points34 : List (ℕ × ℕ) := [(0, 0), (1, 2), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 6338, representative 7808.
def source35 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B008.Data.entryAt ⟨33, by decide +kernel⟩

def target35 : Weights.Entry :=
  { word := [8, 12, 0, 4, 2, 0, 12], weights := [1, 0, 0, 1] }

def points35 : List (ℕ × ℕ) := [(0, 0), (1, 2), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 6359, representative 7801.
def source36 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B008.Data.entryAt ⟨26, by decide +kernel⟩

def target36 : Weights.Entry :=
  { word := [8, 12, 0, 4, 10, 0, 10], weights := [1, 0, 1, 0] }

def points36 : List (ℕ × ℕ) := [(0, 0), (1, 2), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 6360, representative 7809.
def source37 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B008.Data.entryAt ⟨34, by decide +kernel⟩

def target37 : Weights.Entry :=
  { word := [8, 12, 0, 4, 10, 0, 12], weights := [1, 0, 0, 1] }

def points37 : List (ℕ × ℕ) := [(0, 0), (1, 2), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 6373, representative 7807.
def source38 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B008.Data.entryAt ⟨32, by decide +kernel⟩

def target38 : Weights.Entry :=
  { word := [8, 12, 0, 12, 2, 0, 10], weights := [1, 0, 1, 0] }

def points38 : List (ℕ × ℕ) := [(0, 0), (1, 2), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 6374, representative 7815.
def source39 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B008.Data.entryAt ⟨40, by decide +kernel⟩

def target39 : Weights.Entry :=
  { word := [8, 12, 0, 12, 2, 0, 12], weights := [1, 0, 1, 0] }

def points39 : List (ℕ × ℕ) := [(0, 0), (1, 2), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 6395, representative 7804.
def source40 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B008.Data.entryAt ⟨29, by decide +kernel⟩

def target40 : Weights.Entry :=
  { word := [8, 12, 0, 12, 10, 0, 10], weights := [1, 0, 1, 0] }

def points40 : List (ℕ × ℕ) := [(0, 0), (1, 2), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 6396, representative 7812.
def source41 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B008.Data.entryAt ⟨37, by decide +kernel⟩

def target41 : Weights.Entry :=
  { word := [8, 12, 0, 12, 10, 0, 12], weights := [1, 0, 1, 0] }

def points41 : List (ℕ × ℕ) := [(0, 0), (1, 2), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 6406, representative 7871.
def source42 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B008.Data.entryAt ⟨96, by decide +kernel⟩

def target42 : Weights.Entry :=
  { word := [8, 12, 2, 0, 1, 8, 9], weights := [0, 1, 2, 1] }

def points42 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 6409, representative 7872.
def source43 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B008.Data.entryAt ⟨97, by decide +kernel⟩

def target43 : Weights.Entry :=
  { word := [8, 12, 2, 0, 9, 8, 9], weights := [0, 1, 2, 1] }

def points43 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 6414, representative 7799.
def source44 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B008.Data.entryAt ⟨24, by decide +kernel⟩

def target44 : Weights.Entry :=
  { word := [8, 12, 2, 8, 2, 0, 10], weights := [0, 1, 1, 0] }

-- Period 9, original row 6422, representative 7798.
def source45 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B008.Data.entryAt ⟨23, by decide +kernel⟩

def target45 : Weights.Entry :=
  { word := [8, 12, 2, 8, 10, 0, 10], weights := [0, 1, 1, 0] }

-- Period 9, original row 6431, representative 7816.
def source46 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B008.Data.entryAt ⟨41, by decide +kernel⟩

def target46 : Weights.Entry :=
  { word := [8, 12, 4, 4, 0, 0, 10], weights := [1, 0, 0, 1] }

-- Period 9, original row 6432, representative 7816.
def source47 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B008.Data.entryAt ⟨41, by decide +kernel⟩

def target47 : Weights.Entry :=
  { word := [8, 12, 4, 4, 0, 0, 12], weights := [1, 0, 0, 1] }

def points47 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 8), (8, 7)]

-- Period 9, original row 6445, representative 7817.
def source48 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B008.Data.entryAt ⟨42, by decide +kernel⟩

def target48 : Weights.Entry :=
  { word := [8, 12, 4, 4, 8, 0, 10], weights := [1, 0, 1, 0] }

-- Period 9, original row 6446, representative 7821.
def source49 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B008.Data.entryAt ⟨46, by decide +kernel⟩

def target49 : Weights.Entry :=
  { word := [8, 12, 4, 4, 8, 0, 12], weights := [1, 0, 0, 1] }

-- Period 9, original row 6459, representative 7825.
def source50 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B008.Data.entryAt ⟨50, by decide +kernel⟩

def target50 : Weights.Entry :=
  { word := [8, 12, 4, 12, 0, 0, 10], weights := [1, 0, 1, 0] }

-- Period 9, original row 6460, representative 7825.
def source51 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B008.Data.entryAt ⟨50, by decide +kernel⟩

def target51 : Weights.Entry :=
  { word := [8, 12, 4, 12, 0, 0, 12], weights := [1, 0, 1, 0] }

def points51 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 8), (8, 7)]

-- Period 9, original row 6473, representative 7820.
def source52 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B008.Data.entryAt ⟨45, by decide +kernel⟩

def target52 : Weights.Entry :=
  { word := [8, 12, 4, 12, 8, 0, 10], weights := [1, 0, 1, 0] }

-- Period 9, original row 6474, representative 7824.
def source53 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B008.Data.entryAt ⟨49, by decide +kernel⟩

def target53 : Weights.Entry :=
  { word := [8, 12, 4, 12, 8, 0, 12], weights := [1, 0, 1, 0] }

-- Period 9, original row 6485, representative 7870.
def source54 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B008.Data.entryAt ⟨95, by decide +kernel⟩

def target54 : Weights.Entry :=
  { word := [8, 12, 6, 8, 8, 8, 9], weights := [0, 1, 1, 0] }

def points54 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 6492, representative 7805.
def source55 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B008.Data.entryAt ⟨30, by decide +kernel⟩

def target55 : Weights.Entry :=
  { word := [8, 12, 8, 4, 2, 0, 10], weights := [1, 0, 1, 0] }

-- Period 9, original row 6493, representative 7813.
def source56 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B008.Data.entryAt ⟨38, by decide +kernel⟩

def target56 : Weights.Entry :=
  { word := [8, 12, 8, 4, 2, 0, 12], weights := [1, 0, 0, 1] }

-- Period 9, original row 6518, representative 7802.
def source57 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B008.Data.entryAt ⟨27, by decide +kernel⟩

def target57 : Weights.Entry :=
  { word := [8, 12, 8, 4, 10, 0, 10], weights := [1, 0, 1, 0] }

-- Period 9, original row 6519, representative 7810.
def source58 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B008.Data.entryAt ⟨35, by decide +kernel⟩

def target58 : Weights.Entry :=
  { word := [8, 12, 8, 4, 10, 0, 12], weights := [1, 0, 0, 1] }

-- Period 9, original row 6534, representative 7806.
def source59 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B008.Data.entryAt ⟨31, by decide +kernel⟩

def target59 : Weights.Entry :=
  { word := [8, 12, 8, 12, 2, 0, 10], weights := [1, 0, 1, 0] }

-- Period 9, original row 6535, representative 7814.
def source60 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B008.Data.entryAt ⟨39, by decide +kernel⟩

def target60 : Weights.Entry :=
  { word := [8, 12, 8, 12, 2, 0, 12], weights := [1, 0, 1, 0] }

-- Period 9, original row 6560, representative 7803.
def source61 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B008.Data.entryAt ⟨28, by decide +kernel⟩

def target61 : Weights.Entry :=
  { word := [8, 12, 8, 12, 10, 0, 10], weights := [1, 0, 1, 0] }

-- Period 9, original row 6561, representative 7811.
def source62 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B008.Data.entryAt ⟨36, by decide +kernel⟩

def target62 : Weights.Entry :=
  { word := [8, 12, 8, 12, 10, 0, 12], weights := [1, 0, 1, 0] }

-- Period 9, original row 6573, representative 7874.
def source63 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B008.Data.entryAt ⟨99, by decide +kernel⟩

def target63 : Weights.Entry :=
  { word := [8, 12, 10, 0, 1, 8, 9], weights := [0, 1, 2, 1] }

def points63 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 6576, representative 7873.
def source64 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B008.Data.entryAt ⟨98, by decide +kernel⟩

def target64 : Weights.Entry :=
  { word := [8, 12, 10, 0, 9, 8, 9], weights := [0, 1, 2, 1] }

def points64 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 6595, representative 7818.
def source65 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B008.Data.entryAt ⟨43, by decide +kernel⟩

def target65 : Weights.Entry :=
  { word := [8, 12, 12, 4, 8, 0, 10], weights := [1, 0, 1, 0] }

-- Period 9, original row 6596, representative 7822.
def source66 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B008.Data.entryAt ⟨47, by decide +kernel⟩

def target66 : Weights.Entry :=
  { word := [8, 12, 12, 4, 8, 0, 12], weights := [1, 0, 0, 1] }

-- Period 9, original row 6616, representative 7819.
def source67 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B008.Data.entryAt ⟨44, by decide +kernel⟩

def target67 : Weights.Entry :=
  { word := [8, 12, 12, 12, 8, 0, 10], weights := [1, 0, 1, 0] }

-- Period 9, original row 6617, representative 7823.
def source68 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B008.Data.entryAt ⟨48, by decide +kernel⟩

def target68 : Weights.Entry :=
  { word := [8, 12, 12, 12, 8, 0, 12], weights := [1, 0, 1, 0] }

-- Period 9, original row 6630, representative 7836.
def source69 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B008.Data.entryAt ⟨61, by decide +kernel⟩

def target69 : Weights.Entry :=
  { word := [9, 0, 1, 4, 2, 0, 10], weights := [1, 0, 1, 0] }

def points69 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 6631, representative 7844.
def source70 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B008.Data.entryAt ⟨69, by decide +kernel⟩

def target70 : Weights.Entry :=
  { word := [9, 0, 1, 4, 2, 0, 12], weights := [1, 0, 0, 1] }

def points70 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 6652, representative 7837.
def source71 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B008.Data.entryAt ⟨62, by decide +kernel⟩

def target71 : Weights.Entry :=
  { word := [9, 0, 1, 4, 10, 0, 10], weights := [1, 0, 1, 0] }

def points71 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 6653, representative 7845.
def source72 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B008.Data.entryAt ⟨70, by decide +kernel⟩

def target72 : Weights.Entry :=
  { word := [9, 0, 1, 4, 10, 0, 12], weights := [1, 0, 0, 1] }

def points72 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 6666, representative 7843.
def source73 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B008.Data.entryAt ⟨68, by decide +kernel⟩

def target73 : Weights.Entry :=
  { word := [9, 0, 1, 12, 2, 0, 10], weights := [1, 0, 1, 0] }

def points73 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 6667, representative 7851.
def source74 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B008.Data.entryAt ⟨76, by decide +kernel⟩

def target74 : Weights.Entry :=
  { word := [9, 0, 1, 12, 2, 0, 12], weights := [1, 0, 1, 0] }

def points74 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 6688, representative 7840.
def source75 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B008.Data.entryAt ⟨65, by decide +kernel⟩

def target75 : Weights.Entry :=
  { word := [9, 0, 1, 12, 10, 0, 10], weights := [1, 0, 1, 0] }

def points75 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 6689, representative 7848.
def source76 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B008.Data.entryAt ⟨73, by decide +kernel⟩

def target76 : Weights.Entry :=
  { word := [9, 0, 1, 12, 10, 0, 12], weights := [1, 0, 1, 0] }

def points76 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 6702, representative 7836.
def source77 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B008.Data.entryAt ⟨61, by decide +kernel⟩

def target77 : Weights.Entry :=
  { word := [9, 0, 2, 2, 2, 0, 10], weights := [1, 1, 0, 0] }

def points77 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 5), (5, 4), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 6703, representative 7844.
def source78 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B008.Data.entryAt ⟨69, by decide +kernel⟩

def target78 : Weights.Entry :=
  { word := [9, 0, 2, 2, 2, 0, 12], weights := [1, 0, 0, 1] }

def points78 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 5), (5, 4), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 6709, representative 7892.
def source79 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B008.Data.entryAt ⟨117, by decide +kernel⟩

def target79 : Weights.Entry :=
  { word := [9, 0, 2, 2, 2, 8, 9], weights := [1, 0, 0, 1] }

def points79 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 6717, representative 7837.
def source80 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B008.Data.entryAt ⟨62, by decide +kernel⟩

def target80 : Weights.Entry :=
  { word := [9, 0, 2, 2, 10, 0, 10], weights := [1, 1, 0, 0] }

def points80 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 5), (5, 4), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 6718, representative 7845.
def source81 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B008.Data.entryAt ⟨70, by decide +kernel⟩

def target81 : Weights.Entry :=
  { word := [9, 0, 2, 2, 10, 0, 12], weights := [1, 0, 0, 1] }

def points81 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 5), (5, 4), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 6724, representative 7893.
def source82 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B008.Data.entryAt ⟨118, by decide +kernel⟩

def target82 : Weights.Entry :=
  { word := [9, 0, 2, 2, 10, 8, 9], weights := [1, 0, 0, 1] }

def points82 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 6732, representative 7843.
def source83 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B008.Data.entryAt ⟨68, by decide +kernel⟩

def target83 : Weights.Entry :=
  { word := [9, 0, 2, 10, 2, 0, 10], weights := [1, 1, 0, 0] }

def points83 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 5), (5, 4), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 6733, representative 7851.
def source84 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B008.Data.entryAt ⟨76, by decide +kernel⟩

def target84 : Weights.Entry :=
  { word := [9, 0, 2, 10, 2, 0, 12], weights := [1, 1, 0, 0] }

def points84 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 5), (5, 4), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 6738, representative 7899.
def source85 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B008.Data.entryAt ⟨124, by decide +kernel⟩

def target85 : Weights.Entry :=
  { word := [9, 0, 2, 10, 2, 8, 9], weights := [1, 0, 0, 1] }

def points85 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 6746, representative 7840.
def source86 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B008.Data.entryAt ⟨65, by decide +kernel⟩

def target86 : Weights.Entry :=
  { word := [9, 0, 2, 10, 10, 0, 10], weights := [1, 1, 0, 0] }

def points86 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 5), (5, 4), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 6747, representative 7848.
def source87 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B008.Data.entryAt ⟨73, by decide +kernel⟩

def target87 : Weights.Entry :=
  { word := [9, 0, 2, 10, 10, 0, 12], weights := [1, 1, 0, 0] }

def points87 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 5), (5, 4), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 6752, representative 7896.
def source88 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B008.Data.entryAt ⟨121, by decide +kernel⟩

def target88 : Weights.Entry :=
  { word := [9, 0, 2, 10, 10, 8, 9], weights := [1, 0, 0, 1] }

def points88 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 6765, representative 7790.
def source89 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B008.Data.entryAt ⟨15, by decide +kernel⟩

def target89 : Weights.Entry :=
  { word := [9, 0, 4, 2, 0, 8, 10], weights := [1, 0, 0, 1] }

def points89 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 6766, representative 7790.
def source90 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B008.Data.entryAt ⟨15, by decide +kernel⟩

def target90 : Weights.Entry :=
  { word := [9, 0, 4, 2, 0, 8, 12], weights := [1, 0, 0, 1] }

def points90 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 8), (8, 7)]

-- Period 9, original row 6774, representative 7791.
def source91 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B008.Data.entryAt ⟨16, by decide +kernel⟩

def target91 : Weights.Entry :=
  { word := [9, 0, 4, 2, 8, 8, 12], weights := [1, 0, 0, 1] }

def points91 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 6797, representative 7797.
def source92 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B008.Data.entryAt ⟨22, by decide +kernel⟩

def target92 : Weights.Entry :=
  { word := [9, 0, 4, 10, 0, 8, 10], weights := [1, 0, 0, 1] }

def points92 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 6798, representative 7797.
def source93 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B008.Data.entryAt ⟨22, by decide +kernel⟩

def target93 : Weights.Entry :=
  { word := [9, 0, 4, 10, 0, 8, 12], weights := [1, 0, 0, 1] }

def points93 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 8), (8, 7)]

-- Period 9, original row 6810, representative 7794.
def source94 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B008.Data.entryAt ⟨19, by decide +kernel⟩

def target94 : Weights.Entry :=
  { word := [9, 0, 4, 10, 8, 8, 12], weights := [1, 0, 0, 1] }

def points94 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 6873, representative 7897.
def source95 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B008.Data.entryAt ⟨122, by decide +kernel⟩

def target95 : Weights.Entry :=
  { word := [9, 0, 10, 2, 2, 8, 9], weights := [1, 0, 0, 1] }

def points95 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 6881, representative 7894.
def source96 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B008.Data.entryAt ⟨119, by decide +kernel⟩

def target96 : Weights.Entry :=
  { word := [9, 0, 10, 2, 10, 8, 9], weights := [1, 0, 0, 1] }

def points96 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 6888, representative 7898.
def source97 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B008.Data.entryAt ⟨123, by decide +kernel⟩

def target97 : Weights.Entry :=
  { word := [9, 0, 10, 10, 2, 8, 9], weights := [0, 1, 1, 0] }

def points97 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 6895, representative 7895.
def source98 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B008.Data.entryAt ⟨120, by decide +kernel⟩

def target98 : Weights.Entry :=
  { word := [9, 0, 10, 10, 10, 8, 9], weights := [0, 1, 1, 0] }

def points98 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 6908, representative 7795.
def source99 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B008.Data.entryAt ⟨20, by decide +kernel⟩

def target99 : Weights.Entry :=
  { word := [9, 0, 12, 2, 0, 8, 10], weights := [1, 0, 0, 1] }

def points99 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 6909, representative 7795.
def source100 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B008.Data.entryAt ⟨20, by decide +kernel⟩

def target100 : Weights.Entry :=
  { word := [9, 0, 12, 2, 0, 8, 12], weights := [1, 0, 0, 1] }

def points100 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 8), (8, 7)]

-- Period 9, original row 6917, representative 7792.
def source101 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B008.Data.entryAt ⟨17, by decide +kernel⟩

def target101 : Weights.Entry :=
  { word := [9, 0, 12, 2, 8, 8, 12], weights := [1, 0, 0, 1] }

def points101 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 6943, representative 7796.
def source102 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B008.Data.entryAt ⟨21, by decide +kernel⟩

def target102 : Weights.Entry :=
  { word := [9, 0, 12, 10, 0, 8, 10], weights := [1, 0, 0, 1] }

def points102 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 6944, representative 7796.
def source103 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B008.Data.entryAt ⟨21, by decide +kernel⟩

def target103 : Weights.Entry :=
  { word := [9, 0, 12, 10, 0, 8, 12], weights := [1, 0, 0, 1] }

def points103 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 8), (8, 7)]

-- Period 9, original row 6956, representative 7793.
def source104 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B008.Data.entryAt ⟨18, by decide +kernel⟩

def target104 : Weights.Entry :=
  { word := [9, 0, 12, 10, 8, 8, 12], weights := [1, 0, 0, 1] }

def points104 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 6968, representative 7852.
def source105 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B008.Data.entryAt ⟨77, by decide +kernel⟩

def target105 : Weights.Entry :=
  { word := [9, 4, 4, 4, 0, 0, 10], weights := [1, 0, 0, 1] }

def points105 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 6969, representative 7852.
def source106 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B008.Data.entryAt ⟨77, by decide +kernel⟩

def target106 : Weights.Entry :=
  { word := [9, 4, 4, 4, 0, 0, 12], weights := [1, 0, 0, 1] }

def points106 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 8), (8, 7)]

-- Period 9, original row 6982, representative 7853.
def source107 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B008.Data.entryAt ⟨78, by decide +kernel⟩

def target107 : Weights.Entry :=
  { word := [9, 4, 4, 4, 8, 0, 10], weights := [1, 0, 1, 0] }

def points107 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 6983, representative 7857.
def source108 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B008.Data.entryAt ⟨82, by decide +kernel⟩

def target108 : Weights.Entry :=
  { word := [9, 4, 4, 4, 8, 0, 12], weights := [1, 0, 0, 1] }

def points108 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 6996, representative 7861.
def source109 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B008.Data.entryAt ⟨86, by decide +kernel⟩

def target109 : Weights.Entry :=
  { word := [9, 4, 4, 12, 0, 0, 10], weights := [1, 0, 1, 0] }

def points109 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 6997, representative 7861.
def source110 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B008.Data.entryAt ⟨86, by decide +kernel⟩

def target110 : Weights.Entry :=
  { word := [9, 4, 4, 12, 0, 0, 12], weights := [1, 0, 1, 0] }

def points110 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 8), (8, 7)]

-- Period 9, original row 7010, representative 7856.
def source111 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B008.Data.entryAt ⟨81, by decide +kernel⟩

def target111 : Weights.Entry :=
  { word := [9, 4, 4, 12, 8, 0, 10], weights := [1, 0, 1, 0] }

def points111 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 7011, representative 7860.
def source112 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B008.Data.entryAt ⟨85, by decide +kernel⟩

def target112 : Weights.Entry :=
  { word := [9, 4, 4, 12, 8, 0, 12], weights := [1, 0, 1, 0] }

def points112 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 7031, representative 7854.
def source113 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B008.Data.entryAt ⟨79, by decide +kernel⟩

def target113 : Weights.Entry :=
  { word := [9, 4, 12, 4, 8, 0, 10], weights := [1, 0, 1, 0] }

def points113 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 7032, representative 7858.
def source114 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B008.Data.entryAt ⟨83, by decide +kernel⟩

def target114 : Weights.Entry :=
  { word := [9, 4, 12, 4, 8, 0, 12], weights := [1, 0, 0, 1] }

def points114 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 7052, representative 7855.
def source115 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B008.Data.entryAt ⟨80, by decide +kernel⟩

def target115 : Weights.Entry :=
  { word := [9, 4, 12, 12, 8, 0, 10], weights := [1, 0, 1, 0] }

def points115 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 7053, representative 7859.
def source116 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B008.Data.entryAt ⟨84, by decide +kernel⟩

def target116 : Weights.Entry :=
  { word := [9, 4, 12, 12, 8, 0, 12], weights := [1, 0, 1, 0] }

def points116 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 7066, representative 7800.
def source117 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B008.Data.entryAt ⟨25, by decide +kernel⟩

def target117 : Weights.Entry :=
  { word := [9, 8, 1, 4, 2, 0, 10], weights := [1, 0, 1, 0] }

def points117 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 7067, representative 7808.
def source118 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B008.Data.entryAt ⟨33, by decide +kernel⟩

def target118 : Weights.Entry :=
  { word := [9, 8, 1, 4, 2, 0, 12], weights := [1, 0, 0, 1] }

def points118 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 7088, representative 7801.
def source119 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B008.Data.entryAt ⟨26, by decide +kernel⟩

def target119 : Weights.Entry :=
  { word := [9, 8, 1, 4, 10, 0, 10], weights := [1, 0, 1, 0] }

def points119 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 7089, representative 7809.
def source120 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B008.Data.entryAt ⟨34, by decide +kernel⟩

def target120 : Weights.Entry :=
  { word := [9, 8, 1, 4, 10, 0, 12], weights := [1, 0, 0, 1] }

def points120 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 7102, representative 7807.
def source121 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B008.Data.entryAt ⟨32, by decide +kernel⟩

def target121 : Weights.Entry :=
  { word := [9, 8, 1, 12, 2, 0, 10], weights := [1, 0, 1, 0] }

def points121 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 7103, representative 7815.
def source122 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B008.Data.entryAt ⟨40, by decide +kernel⟩

def target122 : Weights.Entry :=
  { word := [9, 8, 1, 12, 2, 0, 12], weights := [1, 0, 1, 0] }

def points122 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 7124, representative 7804.
def source123 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B008.Data.entryAt ⟨29, by decide +kernel⟩

def target123 : Weights.Entry :=
  { word := [9, 8, 1, 12, 10, 0, 10], weights := [1, 0, 1, 0] }

def points123 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 7125, representative 7812.
def source124 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B008.Data.entryAt ⟨37, by decide +kernel⟩

def target124 : Weights.Entry :=
  { word := [9, 8, 1, 12, 10, 0, 12], weights := [1, 0, 1, 0] }

def points124 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 7138, representative 7828.
def source125 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B008.Data.entryAt ⟨53, by decide +kernel⟩

def target125 : Weights.Entry :=
  { word := [9, 8, 2, 2, 2, 0, 10], weights := [0, 1, 0, 0] }

def points125 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 7139, representative 7832.
def source126 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B008.Data.entryAt ⟨57, by decide +kernel⟩

def target126 : Weights.Entry :=
  { word := [9, 8, 2, 2, 2, 0, 12], weights := [1, 0, 0, 1] }

def points126 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 7145, representative 7880.
def source127 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B008.Data.entryAt ⟨105, by decide +kernel⟩

def target127 : Weights.Entry :=
  { word := [9, 8, 2, 2, 2, 8, 9], weights := [1, 0, 0, 1] }

def points127 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

def period9Entries : List Weights.Entry := [target0, target1, target2, target3, target4, target5, target6, target7, target8, target9, target10, target11, target12, target13, target14, target15, target16, target17, target18, target19, target20, target21, target22, target23, target24, target25, target26, target27, target28, target29, target30, target31, target32, target33, target34, target35, target36, target37, target38, target39, target40, target41, target42, target43, target44, target45, target46, target47, target48, target49, target50, target51, target52, target53, target54, target55, target56, target57, target58, target59, target60, target61, target62, target63, target64, target65, target66, target67, target68, target69, target70, target71, target72, target73, target74, target75, target76, target77, target78, target79, target80, target81, target82, target83, target84, target85, target86, target87, target88, target89, target90, target91, target92, target93, target94, target95, target96, target97, target98, target99, target100, target101, target102, target103, target104, target105, target106, target107, target108, target109, target110, target111, target112, target113, target114, target115, target116, target117, target118, target119, target120, target121, target122, target123, target124, target125, target126, target127]

def period9Chunk : RowCoverage.Chunk where
  rows := [⟨5838, target0⟩, ⟨5849, target1⟩, ⟨5853, target2⟩, ⟨5855, target3⟩, ⟨5859, target4⟩, ⟨5887, target5⟩, ⟨5889, target6⟩, ⟨5948, target7⟩, ⟨5972, target8⟩, ⟨5974, target9⟩, ⟨5976, target10⟩, ⟨5978, target11⟩, ⟨5979, target12⟩, ⟨5981, target13⟩, ⟨5982, target14⟩, ⟨5984, target15⟩, ⟨5986, target16⟩, ⟨5990, target17⟩, ⟨5992, target18⟩, ⟨5996, target19⟩, ⟨6010, target20⟩, ⟨6012, target21⟩, ⟨6019, target22⟩, ⟨6021, target23⟩, ⟨6039, target24⟩, ⟨6041, target25⟩, ⟨6047, target26⟩, ⟨6049, target27⟩, ⟨6051, target28⟩, ⟨6053, target29⟩, ⟨6054, target30⟩, ⟨6056, target31⟩, ⟨6057, target32⟩, ⟨6059, target33⟩, ⟨6337, target34⟩, ⟨6338, target35⟩, ⟨6359, target36⟩, ⟨6360, target37⟩, ⟨6373, target38⟩, ⟨6374, target39⟩, ⟨6395, target40⟩, ⟨6396, target41⟩, ⟨6406, target42⟩, ⟨6409, target43⟩, ⟨6414, target44⟩, ⟨6422, target45⟩, ⟨6431, target46⟩, ⟨6432, target47⟩, ⟨6445, target48⟩, ⟨6446, target49⟩, ⟨6459, target50⟩, ⟨6460, target51⟩, ⟨6473, target52⟩, ⟨6474, target53⟩, ⟨6485, target54⟩, ⟨6492, target55⟩, ⟨6493, target56⟩, ⟨6518, target57⟩, ⟨6519, target58⟩, ⟨6534, target59⟩, ⟨6535, target60⟩, ⟨6560, target61⟩, ⟨6561, target62⟩, ⟨6573, target63⟩, ⟨6576, target64⟩, ⟨6595, target65⟩, ⟨6596, target66⟩, ⟨6616, target67⟩, ⟨6617, target68⟩, ⟨6630, target69⟩, ⟨6631, target70⟩, ⟨6652, target71⟩, ⟨6653, target72⟩, ⟨6666, target73⟩, ⟨6667, target74⟩, ⟨6688, target75⟩, ⟨6689, target76⟩, ⟨6702, target77⟩, ⟨6703, target78⟩, ⟨6709, target79⟩, ⟨6717, target80⟩, ⟨6718, target81⟩, ⟨6724, target82⟩, ⟨6732, target83⟩, ⟨6733, target84⟩, ⟨6738, target85⟩, ⟨6746, target86⟩, ⟨6747, target87⟩, ⟨6752, target88⟩, ⟨6765, target89⟩, ⟨6766, target90⟩, ⟨6774, target91⟩, ⟨6797, target92⟩, ⟨6798, target93⟩, ⟨6810, target94⟩, ⟨6873, target95⟩, ⟨6881, target96⟩, ⟨6888, target97⟩, ⟨6895, target98⟩, ⟨6908, target99⟩, ⟨6909, target100⟩, ⟨6917, target101⟩, ⟨6943, target102⟩, ⟨6944, target103⟩, ⟨6956, target104⟩, ⟨6968, target105⟩, ⟨6969, target106⟩, ⟨6982, target107⟩, ⟨6983, target108⟩, ⟨6996, target109⟩, ⟨6997, target110⟩, ⟨7010, target111⟩, ⟨7011, target112⟩, ⟨7031, target113⟩, ⟨7032, target114⟩, ⟨7052, target115⟩, ⟨7053, target116⟩, ⟨7066, target117⟩, ⟨7067, target118⟩, ⟨7088, target119⟩, ⟨7089, target120⟩, ⟨7102, target121⟩, ⟨7103, target122⟩, ⟨7124, target123⟩, ⟨7125, target124⟩, ⟨7138, target125⟩, ⟨7139, target126⟩, ⟨7145, target127⟩]
  indexMask := 740254322813509548992519773084082848304371082292969922342665104867087859369977817634412812592376758426654482625370781128600664513229906320781088682168911960144130503257865805698057460211292832753023631168944657621491081099917744433576865041067782012557106483669526054571066589302429451064587108259552573350853592098745642341660138721117853217204630809051655784187680931688911539017478263806663917871701409806320998719164116786713725090824184565569533840155535566482930026251908198640672278078922923739412048215465784631323532673373441701597856791740585944552179902606039846156575127727103213507249883908187318564295077304985129481739993810482469739472783031634497260270232889349870598570657475768970856183610093094213629348384554289641314358794261673338323780239912919191291069896359235457489903682483220729142965795388443268708221258189565996353429932708809540448722109570355363379057042778232268873672509998565215314092399206958460515313732008108371099568957238583844518803788761030015958121355243317482170993288035473564895184641024108789949769023496626879134801629529870177434824431118323968720560462610653217995878983436495964749063634767944199405846444229994078048659996243519973394460351163001917319213383126175321744294941462516948225818416016700184965210548988630784400491094927104318601481608716175399792749387302783863187325258075462308959339097451935219139860025674993068956443328913769168798759325045379209461239605688231060388719556793295893009811275705383265178056438995485928979405426258449940412561763193153476193690672242676373427691674951532944462087490647296437095649050369344786554381062103259152333270043018175444151017088478905486702553735724177475543456596257962679877893843355050789563981333503734052635952956526799554836207557966290063480107640585067585006772488609447456107431524172573093899946822124643208307797224448576759779048039516803458222411579466254302618038142858393411602643916539646913505650756860107521573840082734094194692579274915928726385671578660762179492898477906797879253613059919822425166057048170530016208593823001714488806099815334621880384623098717451286859297494304630747970305081515560684900147265536
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

end FranklSmallCyclic.TransportBatches.G061.B001.Data
