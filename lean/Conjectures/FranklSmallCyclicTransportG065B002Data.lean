module

public import Conjectures.FranklSmallCyclicRowCoverage
public import Conjectures.FranklSmallCyclicCanonicalWords
public import Conjectures.FranklSmallCyclicOrbit9Block012Data

/-! 128 literal targets sharing one source proof block.
Original words and row indices are retained; weights may be transported.
-/
@[expose] public section

namespace FranklSmallCyclic.TransportBatches.G065.B002.Data

-- Period 9, original row 4689, representative 8308.
def source0 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B012.Data.entryAt ⟨21, by decide +kernel⟩

def target0 : Weights.Entry :=
  { word := [8, 2, 0, 8, 1, 4, 4], weights := [0, 2, 1, 1] }

def points0 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2)]

-- Period 9, original row 4696, representative 8304.
def source1 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B012.Data.entryAt ⟨17, by decide +kernel⟩

def target1 : Weights.Entry :=
  { word := [8, 2, 0, 8, 9, 4, 4], weights := [0, 2, 1, 1] }

def points1 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2)]

-- Period 9, original row 4709, representative 8343.
def source2 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B012.Data.entryAt ⟨56, by decide +kernel⟩

def target2 : Weights.Entry :=
  { word := [8, 2, 0, 9, 8, 4, 4], weights := [0, 3, 1, 0] }

def points2 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2)]

-- Period 9, original row 4737, representative 8345.
def source3 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B012.Data.entryAt ⟨58, by decide +kernel⟩

def target3 : Weights.Entry :=
  { word := [8, 2, 0, 10, 8, 4, 4], weights := [0, 2, 0, 1] }

def points3 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2)]

-- Period 9, original row 4824, representative 8318.
def source4 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B012.Data.entryAt ⟨31, by decide +kernel⟩

def target4 : Weights.Entry :=
  { word := [8, 2, 2, 10, 8, 4, 2], weights := [1, 1, 1, 1] }

def points4 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 4825, representative 8336.
def source5 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B012.Data.entryAt ⟨49, by decide +kernel⟩

def target5 : Weights.Entry :=
  { word := [8, 2, 2, 10, 8, 4, 4], weights := [1, 1, 1, 1] }

def points5 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 4907, representative 8344.
def source6 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B012.Data.entryAt ⟨57, by decide +kernel⟩

def target6 : Weights.Entry :=
  { word := [8, 2, 8, 10, 8, 4, 4], weights := [0, 2, 0, 1] }

def points6 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 4979, representative 8317.
def source7 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B012.Data.entryAt ⟨30, by decide +kernel⟩

def target7 : Weights.Entry :=
  { word := [8, 2, 10, 10, 8, 4, 2], weights := [1, 1, 1, 1] }

def points7 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 4980, representative 8335.
def source8 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B012.Data.entryAt ⟨48, by decide +kernel⟩

def target8 : Weights.Entry :=
  { word := [8, 2, 10, 10, 8, 4, 4], weights := [1, 1, 1, 1] }

def points8 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 5016, representative 8370.
def source9 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B012.Data.entryAt ⟨83, by decide +kernel⟩

def target9 : Weights.Entry :=
  { word := [8, 4, 0, 4, 8, 4, 2], weights := [1, 0, 0, 1] }

def points9 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2)]

-- Period 9, original row 5017, representative 8380.
def source10 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B012.Data.entryAt ⟨93, by decide +kernel⟩

def target10 : Weights.Entry :=
  { word := [8, 4, 0, 4, 8, 4, 4], weights := [1, 0, 0, 1] }

def points10 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2)]

-- Period 9, original row 5052, representative 8377.
def source11 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B012.Data.entryAt ⟨90, by decide +kernel⟩

def target11 : Weights.Entry :=
  { word := [8, 4, 0, 12, 8, 4, 2], weights := [1, 0, 0, 1] }

def points11 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2)]

-- Period 9, original row 5053, representative 8387.
def source12 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B012.Data.entryAt ⟨100, by decide +kernel⟩

def target12 : Weights.Entry :=
  { word := [8, 4, 0, 12, 8, 4, 4], weights := [1, 0, 0, 1] }

def points12 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2)]

-- Period 9, original row 5173, representative 8375.
def source13 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B012.Data.entryAt ⟨88, by decide +kernel⟩

def target13 : Weights.Entry :=
  { word := [8, 4, 8, 4, 8, 4, 2], weights := [1, 0, 0, 1] }

def points13 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 5174, representative 8385.
def source14 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B012.Data.entryAt ⟨98, by decide +kernel⟩

def target14 : Weights.Entry :=
  { word := [8, 4, 8, 4, 8, 4, 4], weights := [1, 0, 0, 1] }

def points14 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 5215, representative 8376.
def source15 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B012.Data.entryAt ⟨89, by decide +kernel⟩

def target15 : Weights.Entry :=
  { word := [8, 4, 8, 12, 8, 4, 2], weights := [1, 0, 0, 1] }

def points15 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 5216, representative 8386.
def source16 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B012.Data.entryAt ⟨99, by decide +kernel⟩

def target16 : Weights.Entry :=
  { word := [8, 4, 8, 12, 8, 4, 4], weights := [1, 0, 0, 1] }

def points16 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 5302, representative 8319.
def source17 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B012.Data.entryAt ⟨32, by decide +kernel⟩

def target17 : Weights.Entry :=
  { word := [8, 6, 8, 12, 8, 4, 2], weights := [1, 1, 1, 1] }

def points17 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 5303, representative 8337.
def source18 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B012.Data.entryAt ⟨50, by decide +kernel⟩

def target18 : Weights.Entry :=
  { word := [8, 6, 8, 12, 8, 4, 4], weights := [1, 1, 1, 1] }

def points18 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 5359, representative 8378.
def source19 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B012.Data.entryAt ⟨91, by decide +kernel⟩

def target19 : Weights.Entry :=
  { word := [8, 8, 0, 4, 8, 4, 2], weights := [1, 0, 0, 1] }

def points19 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2)]

-- Period 9, original row 5360, representative 8388.
def source20 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B012.Data.entryAt ⟨101, by decide +kernel⟩

def target20 : Weights.Entry :=
  { word := [8, 8, 0, 4, 8, 4, 4], weights := [1, 0, 0, 1] }

def points20 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2)]

-- Period 9, original row 5385, representative 8397.
def source21 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B012.Data.entryAt ⟨110, by decide +kernel⟩

def target21 : Weights.Entry :=
  { word := [8, 8, 0, 9, 4, 4, 4], weights := [1, 1, 1, 1] }

def points21 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2)]

-- Period 9, original row 5389, representative 8393.
def source22 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B012.Data.entryAt ⟨106, by decide +kernel⟩

def target22 : Weights.Entry :=
  { word := [8, 8, 0, 9, 12, 4, 4], weights := [1, 1, 1, 1] }

def points22 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2)]

-- Period 9, original row 5397, representative 8390.
def source23 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B012.Data.entryAt ⟨103, by decide +kernel⟩

def target23 : Weights.Entry :=
  { word := [8, 8, 0, 12, 0, 4, 2], weights := [1, 0, 0, 1] }

def points23 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2)]

-- Period 9, original row 5398, representative 8390.
def source24 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B012.Data.entryAt ⟨103, by decide +kernel⟩

def target24 : Weights.Entry :=
  { word := [8, 8, 0, 12, 0, 4, 4], weights := [1, 0, 0, 1] }

def points24 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2)]

-- Period 9, original row 5422, representative 8379.
def source25 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B012.Data.entryAt ⟨92, by decide +kernel⟩

def target25 : Weights.Entry :=
  { word := [8, 8, 0, 12, 8, 4, 2], weights := [1, 0, 0, 1] }

def points25 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2)]

-- Period 9, original row 5423, representative 8389.
def source26 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B012.Data.entryAt ⟨102, by decide +kernel⟩

def target26 : Weights.Entry :=
  { word := [8, 8, 0, 12, 8, 4, 4], weights := [1, 0, 0, 1] }

def points26 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2)]

-- Period 9, original row 5458, representative 8371.
def source27 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B012.Data.entryAt ⟨84, by decide +kernel⟩

def target27 : Weights.Entry :=
  { word := [8, 8, 1, 4, 8, 4, 2], weights := [1, 0, 0, 1] }

def points27 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 5459, representative 8381.
def source28 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B012.Data.entryAt ⟨94, by decide +kernel⟩

def target28 : Weights.Entry :=
  { word := [8, 8, 1, 4, 8, 4, 4], weights := [1, 0, 0, 1] }

def points28 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 5494, representative 8374.
def source29 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B012.Data.entryAt ⟨87, by decide +kernel⟩

def target29 : Weights.Entry :=
  { word := [8, 8, 1, 12, 8, 4, 2], weights := [1, 0, 0, 1] }

def points29 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 5495, representative 8384.
def source30 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B012.Data.entryAt ⟨97, by decide +kernel⟩

def target30 : Weights.Entry :=
  { word := [8, 8, 1, 12, 8, 4, 4], weights := [1, 0, 0, 1] }

def points30 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 5628, representative 8401.
def source31 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B012.Data.entryAt ⟨114, by decide +kernel⟩

def target31 : Weights.Entry :=
  { word := [8, 8, 4, 10, 8, 4, 4], weights := [1, 1, 1, 1] }

def points31 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 5713, representative 8396.
def source32 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B012.Data.entryAt ⟨109, by decide +kernel⟩

def target32 : Weights.Entry :=
  { word := [8, 8, 8, 9, 4, 4, 4], weights := [1, 1, 1, 1] }

def points32 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 5717, representative 8392.
def source33 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B012.Data.entryAt ⟨105, by decide +kernel⟩

def target33 : Weights.Entry :=
  { word := [8, 8, 8, 9, 12, 4, 4], weights := [1, 1, 1, 1] }

def points33 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 5835, representative 8400.
def source34 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B012.Data.entryAt ⟨113, by decide +kernel⟩

def target34 : Weights.Entry :=
  { word := [8, 8, 12, 10, 8, 4, 4], weights := [1, 1, 1, 1] }

def points34 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 6066, representative 8338.
def source35 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B012.Data.entryAt ⟨51, by decide +kernel⟩

def target35 : Weights.Entry :=
  { word := [8, 10, 0, 1, 8, 4, 4], weights := [0, 3, 1, 0] }

def points35 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2)]

-- Period 9, original row 6082, representative 8307.
def source36 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B012.Data.entryAt ⟨20, by decide +kernel⟩

def target36 : Weights.Entry :=
  { word := [8, 10, 0, 8, 1, 4, 2], weights := [0, 2, 1, 1] }

def points36 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2)]

-- Period 9, original row 6083, representative 8307.
def source37 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B012.Data.entryAt ⟨20, by decide +kernel⟩

def target37 : Weights.Entry :=
  { word := [8, 10, 0, 8, 1, 4, 4], weights := [0, 2, 1, 1] }

def points37 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2)]

-- Period 9, original row 6090, representative 8303.
def source38 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B012.Data.entryAt ⟨16, by decide +kernel⟩

def target38 : Weights.Entry :=
  { word := [8, 10, 0, 8, 9, 4, 4], weights := [0, 2, 1, 1] }

def points38 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2)]

-- Period 9, original row 6103, representative 8339.
def source39 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B012.Data.entryAt ⟨52, by decide +kernel⟩

def target39 : Weights.Entry :=
  { word := [8, 10, 0, 9, 8, 4, 4], weights := [0, 3, 1, 0] }

def points39 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2)]

-- Period 9, original row 6131, representative 8341.
def source40 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B012.Data.entryAt ⟨54, by decide +kernel⟩

def target40 : Weights.Entry :=
  { word := [8, 10, 0, 10, 8, 4, 4], weights := [0, 2, 0, 1] }

def points40 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2)]

-- Period 9, original row 6187, representative 8316.
def source41 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B012.Data.entryAt ⟨29, by decide +kernel⟩

def target41 : Weights.Entry :=
  { word := [8, 10, 2, 10, 8, 4, 2], weights := [1, 1, 1, 1] }

def points41 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 6188, representative 8334.
def source42 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B012.Data.entryAt ⟨47, by decide +kernel⟩

def target42 : Weights.Entry :=
  { word := [8, 10, 2, 10, 8, 4, 4], weights := [1, 1, 1, 1] }

def points42 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 6270, representative 8340.
def source43 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B012.Data.entryAt ⟨53, by decide +kernel⟩

def target43 : Weights.Entry :=
  { word := [8, 10, 8, 10, 8, 4, 4], weights := [0, 2, 0, 1] }

def points43 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 6309, representative 8315.
def source44 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B012.Data.entryAt ⟨28, by decide +kernel⟩

def target44 : Weights.Entry :=
  { word := [8, 10, 10, 10, 8, 4, 2], weights := [1, 1, 1, 1] }

def points44 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 6310, representative 8333.
def source45 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B012.Data.entryAt ⟨46, by decide +kernel⟩

def target45 : Weights.Entry :=
  { word := [8, 10, 10, 10, 8, 4, 4], weights := [1, 1, 1, 1] }

def points45 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 6346, representative 8371.
def source46 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B012.Data.entryAt ⟨84, by decide +kernel⟩

def target46 : Weights.Entry :=
  { word := [8, 12, 0, 4, 8, 4, 2], weights := [1, 0, 0, 1] }

def points46 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2)]

-- Period 9, original row 6347, representative 8381.
def source47 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B012.Data.entryAt ⟨94, by decide +kernel⟩

def target47 : Weights.Entry :=
  { word := [8, 12, 0, 4, 8, 4, 4], weights := [1, 0, 0, 1] }

def points47 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2)]

-- Period 9, original row 6382, representative 8374.
def source48 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B012.Data.entryAt ⟨87, by decide +kernel⟩

def target48 : Weights.Entry :=
  { word := [8, 12, 0, 12, 8, 4, 2], weights := [1, 0, 0, 1] }

def points48 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2)]

-- Period 9, original row 6383, representative 8384.
def source49 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B012.Data.entryAt ⟨97, by decide +kernel⟩

def target49 : Weights.Entry :=
  { word := [8, 12, 0, 12, 8, 4, 4], weights := [1, 0, 0, 1] }

def points49 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2)]

-- Period 9, original row 6503, representative 8372.
def source50 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B012.Data.entryAt ⟨85, by decide +kernel⟩

def target50 : Weights.Entry :=
  { word := [8, 12, 8, 4, 8, 4, 2], weights := [1, 0, 0, 1] }

def points50 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 6504, representative 8382.
def source51 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B012.Data.entryAt ⟨95, by decide +kernel⟩

def target51 : Weights.Entry :=
  { word := [8, 12, 8, 4, 8, 4, 4], weights := [1, 0, 0, 1] }

def points51 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 6545, representative 8373.
def source52 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B012.Data.entryAt ⟨86, by decide +kernel⟩

def target52 : Weights.Entry :=
  { word := [8, 12, 8, 12, 8, 4, 2], weights := [1, 0, 0, 1] }

def points52 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 6546, representative 8383.
def source53 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B012.Data.entryAt ⟨96, by decide +kernel⟩

def target53 : Weights.Entry :=
  { word := [8, 12, 8, 12, 8, 4, 4], weights := [1, 0, 0, 1] }

def points53 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 6639, representative 8370.
def source54 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B012.Data.entryAt ⟨83, by decide +kernel⟩

def target54 : Weights.Entry :=
  { word := [9, 0, 1, 4, 8, 4, 2], weights := [1, 0, 0, 1] }

def points54 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 6640, representative 8380.
def source55 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B012.Data.entryAt ⟨93, by decide +kernel⟩

def target55 : Weights.Entry :=
  { word := [9, 0, 1, 4, 8, 4, 4], weights := [1, 0, 0, 1] }

def points55 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 6675, representative 8377.
def source56 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B012.Data.entryAt ⟨90, by decide +kernel⟩

def target56 : Weights.Entry :=
  { word := [9, 0, 1, 12, 8, 4, 2], weights := [1, 0, 0, 1] }

def points56 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 6676, representative 8387.
def source57 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B012.Data.entryAt ⟨100, by decide +kernel⟩

def target57 : Weights.Entry :=
  { word := [9, 0, 1, 12, 8, 4, 4], weights := [1, 0, 0, 1] }

def points57 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 6807, representative 8403.
def source58 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B012.Data.entryAt ⟨116, by decide +kernel⟩

def target58 : Weights.Entry :=
  { word := [9, 0, 4, 10, 8, 4, 4], weights := [0, 1, 1, 1] }

def points58 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 6836, representative 8398.
def source59 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B012.Data.entryAt ⟨111, by decide +kernel⟩

def target59 : Weights.Entry :=
  { word := [9, 0, 8, 9, 4, 4, 4], weights := [1, 0, 1, 1] }

def points59 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 6840, representative 8394.
def source60 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B012.Data.entryAt ⟨107, by decide +kernel⟩

def target60 : Weights.Entry :=
  { word := [9, 0, 8, 9, 12, 4, 4], weights := [1, 0, 1, 1] }

def points60 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 6933, representative 8404.
def source61 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B012.Data.entryAt ⟨117, by decide +kernel⟩

def target61 : Weights.Entry :=
  { word := [9, 0, 12, 10, 0, 4, 2], weights := [1, 0, 1, 1] }

def points61 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 6934, representative 8404.
def source62 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B012.Data.entryAt ⟨117, by decide +kernel⟩

def target62 : Weights.Entry :=
  { word := [9, 0, 12, 10, 0, 4, 4], weights := [1, 0, 1, 1] }

def points62 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 6953, representative 8402.
def source63 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B012.Data.entryAt ⟨115, by decide +kernel⟩

def target63 : Weights.Entry :=
  { word := [9, 0, 12, 10, 8, 4, 4], weights := [0, 1, 1, 1] }

def points63 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 7075, representative 8371.
def source64 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B012.Data.entryAt ⟨84, by decide +kernel⟩

def target64 : Weights.Entry :=
  { word := [9, 8, 1, 4, 8, 4, 2], weights := [1, 0, 0, 1] }

def points64 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 7076, representative 8381.
def source65 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B012.Data.entryAt ⟨94, by decide +kernel⟩

def target65 : Weights.Entry :=
  { word := [9, 8, 1, 4, 8, 4, 4], weights := [1, 0, 0, 1] }

def points65 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 7111, representative 8374.
def source66 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B012.Data.entryAt ⟨87, by decide +kernel⟩

def target66 : Weights.Entry :=
  { word := [9, 8, 1, 12, 8, 4, 2], weights := [1, 0, 0, 1] }

def points66 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 7112, representative 8384.
def source67 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B012.Data.entryAt ⟨97, by decide +kernel⟩

def target67 : Weights.Entry :=
  { word := [9, 8, 1, 12, 8, 4, 4], weights := [1, 0, 0, 1] }

def points67 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 10, original row 126, representative 8366.
def source68 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B012.Data.entryAt ⟨79, by decide +kernel⟩

def target68 : Weights.Entry :=
  { word := [0, 1, 0, 9, 4, 4, 4], weights := [1, 0, 1, 1] }

def points68 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 10, original row 130, representative 8362.
def source69 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B012.Data.entryAt ⟨75, by decide +kernel⟩

def target69 : Weights.Entry :=
  { word := [0, 1, 0, 9, 12, 4, 4], weights := [1, 0, 1, 1] }

def points69 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 10, original row 136, representative 8314.
def source70 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B012.Data.entryAt ⟨27, by decide +kernel⟩

def target70 : Weights.Entry :=
  { word := [0, 1, 0, 12, 0, 4, 2], weights := [1, 0, 1, 0] }

def points70 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 10, original row 137, representative 8314.
def source71 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B012.Data.entryAt ⟨27, by decide +kernel⟩

def target71 : Weights.Entry :=
  { word := [0, 1, 0, 12, 0, 4, 4], weights := [1, 0, 1, 0] }

def points71 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 8), (8, 7)]

-- Period 10, original row 192, representative 8368.
def source72 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B012.Data.entryAt ⟨81, by decide +kernel⟩

def target72 : Weights.Entry :=
  { word := [0, 1, 4, 10, 8, 4, 4], weights := [1, 0, 1, 1] }

def points72 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 10, original row 217, representative 8365.
def source73 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B012.Data.entryAt ⟨78, by decide +kernel⟩

def target73 : Weights.Entry :=
  { word := [0, 1, 8, 9, 4, 4, 4], weights := [1, 0, 1, 1] }

def points73 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 10, original row 221, representative 8361.
def source74 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B012.Data.entryAt ⟨74, by decide +kernel⟩

def target74 : Weights.Entry :=
  { word := [0, 1, 8, 9, 12, 4, 4], weights := [1, 0, 1, 1] }

def points74 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 10, original row 265, representative 8369.
def source75 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B012.Data.entryAt ⟨82, by decide +kernel⟩

def target75 : Weights.Entry :=
  { word := [0, 1, 12, 10, 0, 4, 2], weights := [1, 0, 1, 1] }

def points75 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 10, original row 266, representative 8369.
def source76 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B012.Data.entryAt ⟨82, by decide +kernel⟩

def target76 : Weights.Entry :=
  { word := [0, 1, 12, 10, 0, 4, 4], weights := [1, 0, 1, 1] }

def points76 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 8), (8, 7)]

-- Period 10, original row 285, representative 8367.
def source77 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B012.Data.entryAt ⟨80, by decide +kernel⟩

def target77 : Weights.Entry :=
  { word := [0, 1, 12, 10, 8, 4, 4], weights := [1, 0, 1, 1] }

def points77 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 10, original row 295, representative 8314.
def source78 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B012.Data.entryAt ⟨27, by decide +kernel⟩

def target78 : Weights.Entry :=
  { word := [0, 2, 0, 8, 1, 4, 2], weights := [0, 1, 1, 0] }

def points78 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 10, original row 296, representative 8314.
def source79 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B012.Data.entryAt ⟨27, by decide +kernel⟩

def target79 : Weights.Entry :=
  { word := [0, 2, 0, 8, 1, 4, 4], weights := [0, 1, 1, 0] }

def points79 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6), (7, 8), (8, 7)]

-- Period 10, original row 303, representative 8302.
def source80 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B012.Data.entryAt ⟨15, by decide +kernel⟩

def target80 : Weights.Entry :=
  { word := [0, 2, 0, 8, 4, 4, 4], weights := [0, 1, 0, 1] }

def points80 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 10, original row 305, representative 8358.
def source81 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B012.Data.entryAt ⟨71, by decide +kernel⟩

def target81 : Weights.Entry :=
  { word := [0, 2, 0, 8, 8, 4, 4], weights := [0, 1, 0, 1] }

def points81 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 10, original row 310, representative 8306.
def source82 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B012.Data.entryAt ⟨19, by decide +kernel⟩

def target82 : Weights.Entry :=
  { word := [0, 2, 0, 8, 9, 4, 4], weights := [0, 1, 1, 0] }

def points82 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 10, original row 314, representative 8298.
def source83 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B012.Data.entryAt ⟨11, by decide +kernel⟩

def target83 : Weights.Entry :=
  { word := [0, 2, 0, 8, 12, 4, 4], weights := [0, 1, 0, 1] }

def points83 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 10, original row 343, representative 8328.
def source84 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B012.Data.entryAt ⟨41, by decide +kernel⟩

def target84 : Weights.Entry :=
  { word := [0, 2, 2, 2, 8, 4, 2], weights := [0, 1, 0, 1] }

def points84 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 10, original row 344, representative 8352.
def source85 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B012.Data.entryAt ⟨65, by decide +kernel⟩

def target85 : Weights.Entry :=
  { word := [0, 2, 2, 2, 8, 4, 4], weights := [0, 1, 0, 1] }

def points85 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 10, original row 392, representative 8329.
def source86 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B012.Data.entryAt ⟨42, by decide +kernel⟩

def target86 : Weights.Entry :=
  { word := [0, 2, 2, 10, 8, 4, 2], weights := [0, 1, 1, 0] }

def points86 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 10, original row 393, representative 8353.
def source87 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B012.Data.entryAt ⟨66, by decide +kernel⟩

def target87 : Weights.Entry :=
  { word := [0, 2, 2, 10, 8, 4, 4], weights := [0, 1, 0, 1] }

def points87 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 10, original row 411, representative 8301.
def source88 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B012.Data.entryAt ⟨14, by decide +kernel⟩

def target88 : Weights.Entry :=
  { word := [0, 2, 8, 8, 4, 4, 4], weights := [0, 1, 0, 1] }

def points88 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 10, original row 416, representative 8297.
def source89 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B012.Data.entryAt ⟨10, by decide +kernel⟩

def target89 : Weights.Entry :=
  { word := [0, 2, 8, 8, 12, 4, 4], weights := [0, 1, 0, 1] }

def points89 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 10, original row 441, representative 8326.
def source90 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B012.Data.entryAt ⟨39, by decide +kernel⟩

def target90 : Weights.Entry :=
  { word := [0, 2, 10, 2, 8, 4, 2], weights := [0, 1, 0, 1] }

def points90 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 10, original row 442, representative 8350.
def source91 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B012.Data.entryAt ⟨63, by decide +kernel⟩

def target91 : Weights.Entry :=
  { word := [0, 2, 10, 2, 8, 4, 4], weights := [0, 1, 0, 1] }

def points91 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 10, original row 466, representative 8369.
def source92 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B012.Data.entryAt ⟨82, by decide +kernel⟩

def target92 : Weights.Entry :=
  { word := [0, 2, 10, 10, 0, 4, 2], weights := [0, 1, 1, 1] }

def points92 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 10, original row 467, representative 8369.
def source93 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B012.Data.entryAt ⟨82, by decide +kernel⟩

def target93 : Weights.Entry :=
  { word := [0, 2, 10, 10, 0, 4, 4], weights := [0, 1, 1, 1] }

def points93 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6), (7, 8), (8, 7)]

-- Period 10, original row 487, representative 8327.
def source94 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B012.Data.entryAt ⟨40, by decide +kernel⟩

def target94 : Weights.Entry :=
  { word := [0, 2, 10, 10, 8, 4, 2], weights := [0, 1, 1, 0] }

def points94 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 10, original row 488, representative 8351.
def source95 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B012.Data.entryAt ⟨64, by decide +kernel⟩

def target95 : Weights.Entry :=
  { word := [0, 2, 10, 10, 8, 4, 4], weights := [0, 1, 0, 1] }

def points95 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 10, original row 738, representative 8331.
def source96 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B012.Data.entryAt ⟨44, by decide +kernel⟩

def target96 : Weights.Entry :=
  { word := [0, 6, 0, 12, 8, 4, 2], weights := [0, 1, 1, 0] }

def points96 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 10, original row 739, representative 8355.
def source97 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B012.Data.entryAt ⟨68, by decide +kernel⟩

def target97 : Weights.Entry :=
  { word := [0, 6, 0, 12, 8, 4, 4], weights := [0, 1, 0, 1] }

def points97 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 10, original row 753, representative 8321.
def source98 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B012.Data.entryAt ⟨34, by decide +kernel⟩

def target98 : Weights.Entry :=
  { word := [0, 6, 2, 8, 8, 4, 2], weights := [0, 1, 1, 0] }

def points98 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 10, original row 768, representative 8330.
def source99 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B012.Data.entryAt ⟨43, by decide +kernel⟩

def target99 : Weights.Entry :=
  { word := [0, 6, 8, 12, 8, 4, 2], weights := [0, 1, 1, 0] }

def points99 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 10, original row 769, representative 8354.
def source100 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B012.Data.entryAt ⟨67, by decide +kernel⟩

def target100 : Weights.Entry :=
  { word := [0, 6, 8, 12, 8, 4, 4], weights := [0, 1, 0, 1] }

def points100 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 10, original row 780, representative 8320.
def source101 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B012.Data.entryAt ⟨33, by decide +kernel⟩

def target101 : Weights.Entry :=
  { word := [0, 6, 10, 8, 8, 4, 2], weights := [0, 1, 1, 0] }

def points101 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 10, original row 861, representative 8412.
def source102 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B012.Data.entryAt ⟨125, by decide +kernel⟩

def target102 : Weights.Entry :=
  { word := [0, 8, 0, 8, 4, 4, 4], weights := [0, 1, 0, 1] }

def points102 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 10, original row 872, representative 8410.
def source103 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B012.Data.entryAt ⟨123, by decide +kernel⟩

def target103 : Weights.Entry :=
  { word := [0, 8, 0, 8, 12, 4, 4], weights := [0, 1, 0, 1] }

def points103 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 10, original row 1004, representative 8408.
def source104 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B012.Data.entryAt ⟨121, by decide +kernel⟩

def target104 : Weights.Entry :=
  { word := [0, 8, 4, 8, 4, 4, 4], weights := [0, 1, 0, 1] }

def points104 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 10, original row 1008, representative 8406.
def source105 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B012.Data.entryAt ⟨119, by decide +kernel⟩

def target105 : Weights.Entry :=
  { word := [0, 8, 4, 8, 12, 4, 4], weights := [0, 1, 0, 1] }

def points105 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 10, original row 1054, representative 8411.
def source106 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B012.Data.entryAt ⟨124, by decide +kernel⟩

def target106 : Weights.Entry :=
  { word := [0, 8, 8, 8, 4, 4, 4], weights := [0, 1, 0, 1] }

def points106 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 10, original row 1059, representative 8409.
def source107 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B012.Data.entryAt ⟨122, by decide +kernel⟩

def target107 : Weights.Entry :=
  { word := [0, 8, 8, 8, 12, 4, 4], weights := [0, 1, 0, 1] }

def points107 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 10, original row 1118, representative 8407.
def source108 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B012.Data.entryAt ⟨120, by decide +kernel⟩

def target108 : Weights.Entry :=
  { word := [0, 8, 12, 8, 4, 4, 4], weights := [0, 1, 0, 1] }

def points108 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 10, original row 1122, representative 8405.
def source109 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B012.Data.entryAt ⟨118, by decide +kernel⟩

def target109 : Weights.Entry :=
  { word := [0, 8, 12, 8, 12, 4, 4], weights := [0, 1, 0, 1] }

def points109 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 10, original row 1168, representative 8309.
def source110 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B012.Data.entryAt ⟨22, by decide +kernel⟩

def target110 : Weights.Entry :=
  { word := [0, 9, 0, 4, 8, 4, 2], weights := [1, 0, 1, 0] }

def points110 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 10, original row 1169, representative 8311.
def source111 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B012.Data.entryAt ⟨24, by decide +kernel⟩

def target111 : Weights.Entry :=
  { word := [0, 9, 0, 4, 8, 4, 4], weights := [1, 0, 0, 1] }

def points111 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 10, original row 1190, representative 8364.
def source112 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B012.Data.entryAt ⟨77, by decide +kernel⟩

def target112 : Weights.Entry :=
  { word := [0, 9, 0, 9, 4, 4, 4], weights := [1, 1, 1, 1] }

def points112 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 10, original row 1194, representative 8360.
def source113 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B012.Data.entryAt ⟨73, by decide +kernel⟩

def target113 : Weights.Entry :=
  { word := [0, 9, 0, 9, 12, 4, 4], weights := [1, 1, 1, 1] }

def points113 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 10, original row 1202, representative 8313.
def source114 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B012.Data.entryAt ⟨26, by decide +kernel⟩

def target114 : Weights.Entry :=
  { word := [0, 9, 0, 12, 0, 4, 2], weights := [1, 0, 1, 0] }

def points114 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 10, original row 1203, representative 8313.
def source115 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B012.Data.entryAt ⟨26, by decide +kernel⟩

def target115 : Weights.Entry :=
  { word := [0, 9, 0, 12, 0, 4, 4], weights := [1, 0, 1, 0] }

def points115 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 8), (8, 7)]

-- Period 10, original row 1227, representative 8310.
def source116 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B012.Data.entryAt ⟨23, by decide +kernel⟩

def target116 : Weights.Entry :=
  { word := [0, 9, 0, 12, 8, 4, 2], weights := [1, 0, 1, 0] }

def points116 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 10, original row 1228, representative 8312.
def source117 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B012.Data.entryAt ⟨25, by decide +kernel⟩

def target117 : Weights.Entry :=
  { word := [0, 9, 0, 12, 8, 4, 4], weights := [1, 0, 1, 0] }

def points117 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 10, original row 1301, representative 8363.
def source118 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B012.Data.entryAt ⟨76, by decide +kernel⟩

def target118 : Weights.Entry :=
  { word := [0, 9, 8, 9, 4, 4, 4], weights := [1, 1, 1, 1] }

def points118 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 10, original row 1305, representative 8359.
def source119 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B012.Data.entryAt ⟨72, by decide +kernel⟩

def target119 : Weights.Entry :=
  { word := [0, 9, 8, 9, 12, 4, 4], weights := [1, 1, 1, 1] }

def points119 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 10, original row 1344, representative 8313.
def source120 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B012.Data.entryAt ⟨26, by decide +kernel⟩

def target120 : Weights.Entry :=
  { word := [0, 10, 0, 8, 1, 4, 2], weights := [0, 1, 1, 0] }

def points120 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 10, original row 1345, representative 8313.
def source121 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B012.Data.entryAt ⟨26, by decide +kernel⟩

def target121 : Weights.Entry :=
  { word := [0, 10, 0, 8, 1, 4, 4], weights := [0, 1, 1, 0] }

def points121 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6), (7, 8), (8, 7)]

-- Period 10, original row 1352, representative 8300.
def source122 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B012.Data.entryAt ⟨13, by decide +kernel⟩

def target122 : Weights.Entry :=
  { word := [0, 10, 0, 8, 4, 4, 4], weights := [0, 1, 0, 1] }

def points122 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 10, original row 1354, representative 8357.
def source123 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B012.Data.entryAt ⟨70, by decide +kernel⟩

def target123 : Weights.Entry :=
  { word := [0, 10, 0, 8, 8, 4, 4], weights := [0, 1, 0, 1] }

def points123 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 10, original row 1359, representative 8305.
def source124 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B012.Data.entryAt ⟨18, by decide +kernel⟩

def target124 : Weights.Entry :=
  { word := [0, 10, 0, 8, 9, 4, 4], weights := [0, 1, 1, 0] }

def points124 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 10, original row 1363, representative 8296.
def source125 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B012.Data.entryAt ⟨9, by decide +kernel⟩

def target125 : Weights.Entry :=
  { word := [0, 10, 0, 8, 12, 4, 4], weights := [0, 1, 0, 1] }

def points125 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 10, original row 1366, representative 8332.
def source126 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B012.Data.entryAt ⟨45, by decide +kernel⟩

def target126 : Weights.Entry :=
  { word := [0, 10, 0, 12, 8, 4, 2], weights := [0, 1, 1, 0] }

def points126 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 10, original row 1367, representative 8356.
def source127 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B012.Data.entryAt ⟨69, by decide +kernel⟩

def target127 : Weights.Entry :=
  { word := [0, 10, 0, 12, 8, 4, 4], weights := [0, 1, 0, 1] }

def points127 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

def period9Entries : List Weights.Entry := [target0, target1, target2, target3, target4, target5, target6, target7, target8, target9, target10, target11, target12, target13, target14, target15, target16, target17, target18, target19, target20, target21, target22, target23, target24, target25, target26, target27, target28, target29, target30, target31, target32, target33, target34, target35, target36, target37, target38, target39, target40, target41, target42, target43, target44, target45, target46, target47, target48, target49, target50, target51, target52, target53, target54, target55, target56, target57, target58, target59, target60, target61, target62, target63, target64, target65, target66, target67]

def period9Chunk : RowCoverage.Chunk where
  rows := [⟨4689, target0⟩, ⟨4696, target1⟩, ⟨4709, target2⟩, ⟨4737, target3⟩, ⟨4824, target4⟩, ⟨4825, target5⟩, ⟨4907, target6⟩, ⟨4979, target7⟩, ⟨4980, target8⟩, ⟨5016, target9⟩, ⟨5017, target10⟩, ⟨5052, target11⟩, ⟨5053, target12⟩, ⟨5173, target13⟩, ⟨5174, target14⟩, ⟨5215, target15⟩, ⟨5216, target16⟩, ⟨5302, target17⟩, ⟨5303, target18⟩, ⟨5359, target19⟩, ⟨5360, target20⟩, ⟨5385, target21⟩, ⟨5389, target22⟩, ⟨5397, target23⟩, ⟨5398, target24⟩, ⟨5422, target25⟩, ⟨5423, target26⟩, ⟨5458, target27⟩, ⟨5459, target28⟩, ⟨5494, target29⟩, ⟨5495, target30⟩, ⟨5628, target31⟩, ⟨5713, target32⟩, ⟨5717, target33⟩, ⟨5835, target34⟩, ⟨6066, target35⟩, ⟨6082, target36⟩, ⟨6083, target37⟩, ⟨6090, target38⟩, ⟨6103, target39⟩, ⟨6131, target40⟩, ⟨6187, target41⟩, ⟨6188, target42⟩, ⟨6270, target43⟩, ⟨6309, target44⟩, ⟨6310, target45⟩, ⟨6346, target46⟩, ⟨6347, target47⟩, ⟨6382, target48⟩, ⟨6383, target49⟩, ⟨6503, target50⟩, ⟨6504, target51⟩, ⟨6545, target52⟩, ⟨6546, target53⟩, ⟨6639, target54⟩, ⟨6640, target55⟩, ⟨6675, target56⟩, ⟨6676, target57⟩, ⟨6807, target58⟩, ⟨6836, target59⟩, ⟨6840, target60⟩, ⟨6933, target61⟩, ⟨6934, target62⟩, ⟨6953, target63⟩, ⟨7075, target64⟩, ⟨7076, target65⟩, ⟨7111, target66⟩, ⟨7112, target67⟩]
  indexMask := 126304964550652581958193928874473023729646312254030002216225504757625797532440970776379825950065948684857304043540264783232289026378212274371274357010514834888056923450664889032564183183497239298135759981823812306955973754310675577347673614298579528801816766836492804770237952064162945109576541156014278455675637726316565138711563379395341335006665888259970961836213495004553914180384508155917262849685873969761075403103861832760453863924612721491909679386523828597884144869353211624873157597059673669644584210052932269745009070772439862719262106943676827420222863474970938130702786013126125127560813353869246120595492237299885061500035947826484103235254660415869234452861661663525634068663158966787690671668653984434807608570657979634836117619513259814638489940902715984858110732051167984676894319189781350033415842488303083863727006569088088640806312475871584043293583768294317518736780678975775265119327173154923522252940060261487829558766416175065061909598086155038208807553747427459610407735869359747659829543362796016571390772825136260380328551611723825505304415855905030741577544455547910690614333519798354269877362249859009366217736740296660008101676604865308647724705224958196874135970662329886325504481952018957757918076783978601741690755313430359269981568991212487035473137791928186680923160162093928932660231812733922520870834841995447680598091770706805946980408459245746086953286705608025768009924680876796669069900787437646610799333361184809948776375304726025852585569954542954767028769540940728831591950243651595454704851936299025821392733689469100994971352138265623503753754760669673357721715804489597472804249082760454476883111927415877810724611471161926478137683582007964588359770792470581137548398930224263664502482618346284985373064718077954566261733292268964126099426135545152481758969979638194313336748304645373245841935978676727288824394829176017018625426505746157031282085973963252323427894561427543793526452649896027967033560711491435580971915519706338756582721458252216502046819793084625082794082929458720473437250175632256956079219975989762921581308580863954291904929941728590694787777447680491547865260642602582016
  count := 68

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

def period10Entries : List Weights.Entry := [target68, target69, target70, target71, target72, target73, target74, target75, target76, target77, target78, target79, target80, target81, target82, target83, target84, target85, target86, target87, target88, target89, target90, target91, target92, target93, target94, target95, target96, target97, target98, target99, target100, target101, target102, target103, target104, target105, target106, target107, target108, target109, target110, target111, target112, target113, target114, target115, target116, target117, target118, target119, target120, target121, target122, target123, target124, target125, target126, target127]

def period10Chunk : RowCoverage.Chunk where
  rows := [⟨126, target68⟩, ⟨130, target69⟩, ⟨136, target70⟩, ⟨137, target71⟩, ⟨192, target72⟩, ⟨217, target73⟩, ⟨221, target74⟩, ⟨265, target75⟩, ⟨266, target76⟩, ⟨285, target77⟩, ⟨295, target78⟩, ⟨296, target79⟩, ⟨303, target80⟩, ⟨305, target81⟩, ⟨310, target82⟩, ⟨314, target83⟩, ⟨343, target84⟩, ⟨344, target85⟩, ⟨392, target86⟩, ⟨393, target87⟩, ⟨411, target88⟩, ⟨416, target89⟩, ⟨441, target90⟩, ⟨442, target91⟩, ⟨466, target92⟩, ⟨467, target93⟩, ⟨487, target94⟩, ⟨488, target95⟩, ⟨738, target96⟩, ⟨739, target97⟩, ⟨753, target98⟩, ⟨768, target99⟩, ⟨769, target100⟩, ⟨780, target101⟩, ⟨861, target102⟩, ⟨872, target103⟩, ⟨1004, target104⟩, ⟨1008, target105⟩, ⟨1054, target106⟩, ⟨1059, target107⟩, ⟨1118, target108⟩, ⟨1122, target109⟩, ⟨1168, target110⟩, ⟨1169, target111⟩, ⟨1190, target112⟩, ⟨1194, target113⟩, ⟨1202, target114⟩, ⟨1203, target115⟩, ⟨1227, target116⟩, ⟨1228, target117⟩, ⟨1301, target118⟩, ⟨1305, target119⟩, ⟨1344, target120⟩, ⟨1345, target121⟩, ⟨1352, target122⟩, ⟨1354, target123⟩, ⟨1359, target124⟩, ⟨1363, target125⟩, ⟨1366, target126⟩, ⟨1367, target127⟩]
  indexMask := 5046042254186475911429991232380004218320041724201664142736731805421369133781198219802685425001560720670969756457207422990086225796763168206176123463220341004758529502448115756352519087873970505721198075502203957023949620369384586499120373557113098502136738750029788613264162531799196397022334995051126754980514888104621546781101004082671470393982211918855547975806457875981143945244553931940853210208434602901504
  count := 60

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

end FranklSmallCyclic.TransportBatches.G065.B002.Data
