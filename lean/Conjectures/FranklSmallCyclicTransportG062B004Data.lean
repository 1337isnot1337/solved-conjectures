module

public import Conjectures.FranklSmallCyclicRowCoverage
public import Conjectures.FranklSmallCyclicCanonicalWords
public import Conjectures.FranklSmallCyclicOrbit9Block009Data

/-! 90 literal targets sharing one source proof block.
Original words and row indices are retained; weights may be transported.
-/
@[expose] public section

namespace FranklSmallCyclic.TransportBatches.G062.B004.Data

-- Period 10, original row 2184, representative 8028.
def source0 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨125, by decide +kernel⟩

def target0 : Weights.Entry :=
  { word := [1, 8, 10, 10, 2, 8, 12], weights := [1, 0, 0, 1] }

def points0 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 10, original row 2189, representative 7970.
def source1 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨67, by decide +kernel⟩

def target1 : Weights.Entry :=
  { word := [1, 8, 10, 10, 10, 8, 9], weights := [0, 1, 0, 0] }

def points1 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 10, original row 2190, representative 8000.
def source2 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨97, by decide +kernel⟩

def target2 : Weights.Entry :=
  { word := [1, 8, 10, 10, 10, 8, 10], weights := [0, 1, 0, 0] }

def points2 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 10, original row 2191, representative 8020.
def source3 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨117, by decide +kernel⟩

def target3 : Weights.Entry :=
  { word := [1, 8, 10, 10, 10, 8, 12], weights := [1, 0, 0, 1] }

def points3 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 10, original row 2211, representative 7991.
def source4 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨88, by decide +kernel⟩

def target4 : Weights.Entry :=
  { word := [1, 12, 2, 0, 1, 8, 9], weights := [0, 1, 0, 1] }

def points4 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 10, original row 2225, representative 7987.
def source5 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨84, by decide +kernel⟩

def target5 : Weights.Entry :=
  { word := [1, 12, 2, 0, 9, 8, 9], weights := [0, 1, 0, 1] }

def points5 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 10, original row 2235, representative 8007.
def source6 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨104, by decide +kernel⟩

def target6 : Weights.Entry :=
  { word := [1, 12, 2, 8, 2, 8, 10], weights := [0, 1, 1, 0] }

def points6 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 10, original row 2249, representative 7995.
def source7 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨92, by decide +kernel⟩

def target7 : Weights.Entry :=
  { word := [1, 12, 2, 8, 10, 8, 10], weights := [0, 1, 1, 0] }

def points7 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 10, original row 2261, representative 7991.
def source8 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨88, by decide +kernel⟩

def target8 : Weights.Entry :=
  { word := [1, 12, 4, 4, 0, 8, 9], weights := [1, 0, 0, 1] }

def points8 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 10, original row 2275, representative 7981.
def source9 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨78, by decide +kernel⟩

def target9 : Weights.Entry :=
  { word := [1, 12, 4, 4, 8, 8, 9], weights := [1, 0, 1, 0] }

def points9 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 10, original row 2288, representative 8015.
def source10 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨112, by decide +kernel⟩

def target10 : Weights.Entry :=
  { word := [1, 12, 8, 4, 2, 8, 10], weights := [0, 0, 1, 0] }

def points10 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 10, original row 2314, representative 8003.
def source11 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨100, by decide +kernel⟩

def target11 : Weights.Entry :=
  { word := [1, 12, 8, 4, 10, 8, 10], weights := [0, 0, 1, 0] }

def points11 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 10, original row 2315, representative 8023.
def source12 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨120, by decide +kernel⟩

def target12 : Weights.Entry :=
  { word := [1, 12, 8, 4, 10, 8, 12], weights := [1, 0, 0, 1] }

def points12 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 10, original row 2338, representative 7992.
def source13 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨89, by decide +kernel⟩

def target13 : Weights.Entry :=
  { word := [1, 12, 10, 0, 1, 8, 9], weights := [0, 1, 0, 1] }

def points13 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 10, original row 2345, representative 7988.
def source14 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨85, by decide +kernel⟩

def target14 : Weights.Entry :=
  { word := [1, 12, 10, 0, 9, 8, 9], weights := [0, 1, 0, 1] }

def points14 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 10, original row 2350, representative 8006.
def source15 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨103, by decide +kernel⟩

def target15 : Weights.Entry :=
  { word := [1, 12, 10, 8, 2, 8, 10], weights := [0, 1, 1, 0] }

def points15 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 10, original row 2359, representative 7994.
def source16 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨91, by decide +kernel⟩

def target16 : Weights.Entry :=
  { word := [1, 12, 10, 8, 10, 8, 10], weights := [0, 1, 1, 0] }

def points16 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 10, original row 2364, representative 7992.
def source17 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨89, by decide +kernel⟩

def target17 : Weights.Entry :=
  { word := [1, 12, 12, 4, 0, 8, 9], weights := [1, 0, 0, 1] }

def points17 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 10, original row 2378, representative 7982.
def source18 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨79, by decide +kernel⟩

def target18 : Weights.Entry :=
  { word := [1, 12, 12, 4, 8, 8, 9], weights := [1, 0, 1, 0] }

def points18 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 10, original row 5848, representative 7990.
def source19 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨87, by decide +kernel⟩

def target19 : Weights.Entry :=
  { word := [8, 9, 0, 1, 4, 2, 0], weights := [1, 0, 1, 0] }

def points19 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2)]

-- Period 10, original row 5852, representative 7991.
def source20 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨88, by decide +kernel⟩

def target20 : Weights.Entry :=
  { word := [8, 9, 0, 1, 4, 10, 0], weights := [1, 0, 1, 0] }

def points20 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2)]

-- Period 10, original row 5854, representative 7993.
def source21 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨90, by decide +kernel⟩

def target21 : Weights.Entry :=
  { word := [8, 9, 0, 1, 12, 2, 0], weights := [1, 0, 1, 0] }

def points21 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2)]

-- Period 10, original row 5858, representative 7992.
def source22 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨89, by decide +kernel⟩

def target22 : Weights.Entry :=
  { word := [8, 9, 0, 1, 12, 10, 0], weights := [1, 0, 1, 0] }

def points22 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2)]

-- Period 10, original row 5860, representative 7990.
def source23 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨87, by decide +kernel⟩

def target23 : Weights.Entry :=
  { word := [8, 9, 0, 2, 2, 2, 0], weights := [1, 0, 0, 1] }

def points23 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 5), (4, 6), (5, 4), (6, 3), (7, 1), (8, 2)]

-- Period 10, original row 5862, representative 7991.
def source24 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨88, by decide +kernel⟩

def target24 : Weights.Entry :=
  { word := [8, 9, 0, 2, 2, 10, 0], weights := [1, 0, 0, 1] }

def points24 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 5), (4, 6), (5, 4), (6, 3), (7, 1), (8, 2)]

-- Period 10, original row 5864, representative 7993.
def source25 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨90, by decide +kernel⟩

def target25 : Weights.Entry :=
  { word := [8, 9, 0, 2, 10, 2, 0], weights := [1, 0, 0, 1] }

def points25 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 5), (4, 6), (5, 4), (6, 3), (7, 1), (8, 2)]

-- Period 10, original row 5866, representative 7992.
def source26 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨89, by decide +kernel⟩

def target26 : Weights.Entry :=
  { word := [8, 9, 0, 2, 10, 10, 0], weights := [1, 0, 0, 1] }

def points26 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 5), (4, 6), (5, 4), (6, 3), (7, 1), (8, 2)]

-- Period 10, original row 5888, representative 7984.
def source27 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨81, by decide +kernel⟩

def target27 : Weights.Entry :=
  { word := [8, 9, 0, 4, 6, 8, 0], weights := [1, 0, 1, 0] }

def points27 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 5), (4, 6), (5, 4), (6, 3), (7, 1), (8, 2)]

-- Period 10, original row 5947, representative 7985.
def source28 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨82, by decide +kernel⟩

def target28 : Weights.Entry :=
  { word := [8, 9, 0, 12, 6, 8, 0], weights := [1, 0, 1, 0] }

def points28 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 5), (4, 6), (5, 4), (6, 3), (7, 1), (8, 2)]

-- Period 10, original row 5973, representative 7972.
def source29 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨69, by decide +kernel⟩

def target29 : Weights.Entry :=
  { word := [8, 9, 4, 4, 4, 8, 0], weights := [0, 0, 1, 0] }

def points29 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 10, original row 5977, representative 7973.
def source30 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨70, by decide +kernel⟩

def target30 : Weights.Entry :=
  { word := [8, 9, 4, 4, 12, 8, 0], weights := [0, 0, 1, 0] }

def points30 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 10, original row 5980, representative 7975.
def source31 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨72, by decide +kernel⟩

def target31 : Weights.Entry :=
  { word := [8, 9, 4, 12, 4, 8, 0], weights := [0, 0, 1, 0] }

def points31 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 10, original row 5983, representative 7974.
def source32 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨71, by decide +kernel⟩

def target32 : Weights.Entry :=
  { word := [8, 9, 4, 12, 12, 8, 0], weights := [0, 0, 1, 0] }

def points32 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 10, original row 5985, representative 7986.
def source33 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨83, by decide +kernel⟩

def target33 : Weights.Entry :=
  { word := [8, 9, 8, 1, 4, 2, 0], weights := [1, 0, 1, 0] }

def points33 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 10, original row 5989, representative 7987.
def source34 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨84, by decide +kernel⟩

def target34 : Weights.Entry :=
  { word := [8, 9, 8, 1, 4, 10, 0], weights := [1, 0, 1, 0] }

def points34 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 10, original row 5991, representative 7989.
def source35 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨86, by decide +kernel⟩

def target35 : Weights.Entry :=
  { word := [8, 9, 8, 1, 12, 2, 0], weights := [1, 0, 1, 0] }

def points35 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 10, original row 5995, representative 7988.
def source36 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨85, by decide +kernel⟩

def target36 : Weights.Entry :=
  { word := [8, 9, 8, 1, 12, 10, 0], weights := [1, 0, 1, 0] }

def points36 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 10, original row 5997, representative 7980.
def source37 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨77, by decide +kernel⟩

def target37 : Weights.Entry :=
  { word := [8, 9, 8, 2, 2, 2, 0], weights := [0, 1, 0, 1] }

def points37 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 10, original row 5999, representative 7981.
def source38 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨78, by decide +kernel⟩

def target38 : Weights.Entry :=
  { word := [8, 9, 8, 2, 2, 10, 0], weights := [0, 1, 0, 1] }

def points38 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 10, original row 6001, representative 7983.
def source39 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨80, by decide +kernel⟩

def target39 : Weights.Entry :=
  { word := [8, 9, 8, 2, 10, 2, 0], weights := [0, 1, 0, 1] }

def points39 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 10, original row 6003, representative 7982.
def source40 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨79, by decide +kernel⟩

def target40 : Weights.Entry :=
  { word := [8, 9, 8, 2, 10, 10, 0], weights := [0, 1, 0, 1] }

def points40 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 10, original row 6011, representative 7978.
def source41 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨75, by decide +kernel⟩

def target41 : Weights.Entry :=
  { word := [8, 9, 8, 4, 6, 8, 0], weights := [0, 0, 1, 0] }

def points41 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 10, original row 6018, representative 7977.
def source42 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨74, by decide +kernel⟩

def target42 : Weights.Entry :=
  { word := [8, 9, 8, 8, 6, 2, 0], weights := [0, 1, 1, 0] }

def points42 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 10, original row 6020, representative 7976.
def source43 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨73, by decide +kernel⟩

def target43 : Weights.Entry :=
  { word := [8, 9, 8, 8, 6, 10, 0], weights := [0, 1, 1, 0] }

def points43 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 10, original row 6040, representative 7979.
def source44 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨76, by decide +kernel⟩

def target44 : Weights.Entry :=
  { word := [8, 9, 8, 12, 6, 8, 0], weights := [0, 0, 1, 0] }

def points44 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 10, original row 6048, representative 7968.
def source45 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨65, by decide +kernel⟩

def target45 : Weights.Entry :=
  { word := [8, 9, 12, 4, 4, 8, 0], weights := [0, 0, 1, 0] }

def points45 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 10, original row 6052, representative 7969.
def source46 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨66, by decide +kernel⟩

def target46 : Weights.Entry :=
  { word := [8, 9, 12, 4, 12, 8, 0], weights := [0, 0, 1, 0] }

def points46 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 10, original row 6055, representative 7971.
def source47 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨68, by decide +kernel⟩

def target47 : Weights.Entry :=
  { word := [8, 9, 12, 12, 4, 8, 0], weights := [0, 0, 1, 0] }

def points47 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 10, original row 6058, representative 7970.
def source48 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨67, by decide +kernel⟩

def target48 : Weights.Entry :=
  { word := [8, 9, 12, 12, 12, 8, 0], weights := [0, 0, 1, 0] }

def points48 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 10, original row 7928, representative 8030.
def source49 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨127, by decide +kernel⟩

def target49 : Weights.Entry :=
  { word := [10, 8, 4, 2, 0, 9, 0], weights := [1, 0, 0, 1] }

def points49 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 10, original row 7930, representative 8030.
def source50 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨127, by decide +kernel⟩

def target50 : Weights.Entry :=
  { word := [10, 8, 4, 2, 0, 10, 0], weights := [1, 0, 0, 1] }

def points50 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 10, original row 7940, representative 8026.
def source51 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨123, by decide +kernel⟩

def target51 : Weights.Entry :=
  { word := [10, 8, 4, 4, 4, 8, 0], weights := [1, 0, 0, 1] }

def points51 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 10, original row 7944, representative 8027.
def source52 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨124, by decide +kernel⟩

def target52 : Weights.Entry :=
  { word := [10, 8, 4, 4, 12, 8, 0], weights := [1, 0, 0, 1] }

def points52 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 10, original row 7964, representative 8029.
def source53 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨126, by decide +kernel⟩

def target53 : Weights.Entry :=
  { word := [10, 8, 4, 12, 4, 8, 0], weights := [1, 0, 0, 1] }

def points53 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 10, original row 7967, representative 8028.
def source54 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨125, by decide +kernel⟩

def target54 : Weights.Entry :=
  { word := [10, 8, 4, 12, 12, 8, 0], weights := [1, 0, 0, 1] }

def points54 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 10, original row 8128, representative 8025.
def source55 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨122, by decide +kernel⟩

def target55 : Weights.Entry :=
  { word := [10, 8, 12, 2, 0, 8, 0], weights := [1, 0, 0, 1] }

def points55 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 10, original row 8136, representative 8022.
def source56 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨119, by decide +kernel⟩

def target56 : Weights.Entry :=
  { word := [10, 8, 12, 2, 0, 9, 0], weights := [1, 0, 0, 1] }

def points56 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 10, original row 8138, representative 8022.
def source57 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨119, by decide +kernel⟩

def target57 : Weights.Entry :=
  { word := [10, 8, 12, 2, 0, 10, 0], weights := [1, 0, 0, 1] }

def points57 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 10, original row 8140, representative 8024.
def source58 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨121, by decide +kernel⟩

def target58 : Weights.Entry :=
  { word := [10, 8, 12, 2, 8, 2, 0], weights := [1, 0, 0, 1] }

def points58 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 10, original row 8144, representative 8023.
def source59 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨120, by decide +kernel⟩

def target59 : Weights.Entry :=
  { word := [10, 8, 12, 2, 8, 10, 0], weights := [1, 0, 0, 1] }

def points59 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 10, original row 8148, representative 8018.
def source60 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨115, by decide +kernel⟩

def target60 : Weights.Entry :=
  { word := [10, 8, 12, 4, 4, 8, 0], weights := [1, 0, 0, 1] }

def points60 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 10, original row 8152, representative 8019.
def source61 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨116, by decide +kernel⟩

def target61 : Weights.Entry :=
  { word := [10, 8, 12, 4, 12, 8, 0], weights := [1, 0, 0, 1] }

def points61 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 10, original row 8174, representative 8021.
def source62 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨118, by decide +kernel⟩

def target62 : Weights.Entry :=
  { word := [10, 8, 12, 12, 4, 8, 0], weights := [1, 0, 0, 1] }

def points62 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 10, original row 8177, representative 8020.
def source63 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨117, by decide +kernel⟩

def target63 : Weights.Entry :=
  { word := [10, 8, 12, 12, 12, 8, 0], weights := [1, 0, 0, 1] }

def points63 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 10, original row 8822, representative 8017.
def source64 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨114, by decide +kernel⟩

def target64 : Weights.Entry :=
  { word := [12, 8, 4, 2, 0, 8, 0], weights := [0, 1, 0, 0] }

def points64 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 10, original row 8830, representative 8014.
def source65 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨111, by decide +kernel⟩

def target65 : Weights.Entry :=
  { word := [12, 8, 4, 2, 0, 9, 0], weights := [0, 1, 0, 0] }

def points65 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 10, original row 8832, representative 8014.
def source66 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨111, by decide +kernel⟩

def target66 : Weights.Entry :=
  { word := [12, 8, 4, 2, 0, 10, 0], weights := [0, 1, 0, 0] }

def points66 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 10, original row 8834, representative 8016.
def source67 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨113, by decide +kernel⟩

def target67 : Weights.Entry :=
  { word := [12, 8, 4, 2, 8, 2, 0], weights := [0, 1, 0, 0] }

def points67 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 10, original row 8838, representative 8015.
def source68 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨112, by decide +kernel⟩

def target68 : Weights.Entry :=
  { word := [12, 8, 4, 2, 8, 10, 0], weights := [0, 1, 0, 0] }

def points68 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 10, original row 8842, representative 8010.
def source69 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨107, by decide +kernel⟩

def target69 : Weights.Entry :=
  { word := [12, 8, 4, 4, 4, 8, 0], weights := [0, 0, 1, 0] }

def points69 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 10, original row 8846, representative 8011.
def source70 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨108, by decide +kernel⟩

def target70 : Weights.Entry :=
  { word := [12, 8, 4, 4, 12, 8, 0], weights := [0, 0, 1, 0] }

def points70 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 10, original row 8848, representative 8009.
def source71 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨106, by decide +kernel⟩

def target71 : Weights.Entry :=
  { word := [12, 8, 4, 8, 4, 2, 0], weights := [0, 1, 1, 0] }

def points71 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 10, original row 8850, representative 8007.
def source72 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨104, by decide +kernel⟩

def target72 : Weights.Entry :=
  { word := [12, 8, 4, 8, 4, 10, 0], weights := [0, 1, 1, 0] }

def points72 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 10, original row 8852, representative 8008.
def source73 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨105, by decide +kernel⟩

def target73 : Weights.Entry :=
  { word := [12, 8, 4, 8, 12, 2, 0], weights := [0, 1, 1, 0] }

def points73 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 10, original row 8854, representative 8006.
def source74 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨103, by decide +kernel⟩

def target74 : Weights.Entry :=
  { word := [12, 8, 4, 8, 12, 10, 0], weights := [0, 1, 1, 0] }

def points74 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 10, original row 8876, representative 8013.
def source75 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨110, by decide +kernel⟩

def target75 : Weights.Entry :=
  { word := [12, 8, 4, 12, 4, 8, 0], weights := [0, 0, 1, 0] }

def points75 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 10, original row 8879, representative 8012.
def source76 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨109, by decide +kernel⟩

def target76 : Weights.Entry :=
  { word := [12, 8, 4, 12, 12, 8, 0], weights := [0, 0, 1, 0] }

def points76 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 10, original row 8930, representative 8005.
def source77 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨102, by decide +kernel⟩

def target77 : Weights.Entry :=
  { word := [12, 8, 12, 2, 0, 8, 0], weights := [0, 1, 0, 0] }

def points77 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 10, original row 8938, representative 8002.
def source78 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨99, by decide +kernel⟩

def target78 : Weights.Entry :=
  { word := [12, 8, 12, 2, 0, 9, 0], weights := [0, 1, 0, 0] }

def points78 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 10, original row 8940, representative 8002.
def source79 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨99, by decide +kernel⟩

def target79 : Weights.Entry :=
  { word := [12, 8, 12, 2, 0, 10, 0], weights := [0, 1, 0, 0] }

def points79 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 10, original row 8942, representative 8004.
def source80 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨101, by decide +kernel⟩

def target80 : Weights.Entry :=
  { word := [12, 8, 12, 2, 8, 2, 0], weights := [0, 1, 0, 0] }

def points80 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 10, original row 8946, representative 8003.
def source81 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨100, by decide +kernel⟩

def target81 : Weights.Entry :=
  { word := [12, 8, 12, 2, 8, 10, 0], weights := [0, 1, 0, 0] }

def points81 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 10, original row 8950, representative 7998.
def source82 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨95, by decide +kernel⟩

def target82 : Weights.Entry :=
  { word := [12, 8, 12, 4, 4, 8, 0], weights := [0, 0, 1, 0] }

def points82 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 10, original row 8954, representative 7999.
def source83 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨96, by decide +kernel⟩

def target83 : Weights.Entry :=
  { word := [12, 8, 12, 4, 12, 8, 0], weights := [0, 0, 1, 0] }

def points83 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 10, original row 8956, representative 7997.
def source84 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨94, by decide +kernel⟩

def target84 : Weights.Entry :=
  { word := [12, 8, 12, 8, 4, 2, 0], weights := [0, 1, 1, 0] }

def points84 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 10, original row 8958, representative 7995.
def source85 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨92, by decide +kernel⟩

def target85 : Weights.Entry :=
  { word := [12, 8, 12, 8, 4, 10, 0], weights := [0, 1, 1, 0] }

def points85 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 10, original row 8960, representative 7996.
def source86 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨93, by decide +kernel⟩

def target86 : Weights.Entry :=
  { word := [12, 8, 12, 8, 12, 2, 0], weights := [0, 1, 1, 0] }

def points86 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 10, original row 8962, representative 7994.
def source87 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨91, by decide +kernel⟩

def target87 : Weights.Entry :=
  { word := [12, 8, 12, 8, 12, 10, 0], weights := [0, 1, 1, 0] }

def points87 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 10, original row 8984, representative 8001.
def source88 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨98, by decide +kernel⟩

def target88 : Weights.Entry :=
  { word := [12, 8, 12, 12, 4, 8, 0], weights := [0, 0, 1, 0] }

def points88 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 10, original row 8987, representative 8000.
def source89 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨97, by decide +kernel⟩

def target89 : Weights.Entry :=
  { word := [12, 8, 12, 12, 12, 8, 0], weights := [0, 0, 1, 0] }

def points89 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

def period10Entries : List Weights.Entry := [target0, target1, target2, target3, target4, target5, target6, target7, target8, target9, target10, target11, target12, target13, target14, target15, target16, target17, target18, target19, target20, target21, target22, target23, target24, target25, target26, target27, target28, target29, target30, target31, target32, target33, target34, target35, target36, target37, target38, target39, target40, target41, target42, target43, target44, target45, target46, target47, target48, target49, target50, target51, target52, target53, target54, target55, target56, target57, target58, target59, target60, target61, target62, target63, target64, target65, target66, target67, target68, target69, target70, target71, target72, target73, target74, target75, target76, target77, target78, target79, target80, target81, target82, target83, target84, target85, target86, target87, target88, target89]

def period10Chunk : RowCoverage.Chunk where
  rows := [⟨2184, target0⟩, ⟨2189, target1⟩, ⟨2190, target2⟩, ⟨2191, target3⟩, ⟨2211, target4⟩, ⟨2225, target5⟩, ⟨2235, target6⟩, ⟨2249, target7⟩, ⟨2261, target8⟩, ⟨2275, target9⟩, ⟨2288, target10⟩, ⟨2314, target11⟩, ⟨2315, target12⟩, ⟨2338, target13⟩, ⟨2345, target14⟩, ⟨2350, target15⟩, ⟨2359, target16⟩, ⟨2364, target17⟩, ⟨2378, target18⟩, ⟨5848, target19⟩, ⟨5852, target20⟩, ⟨5854, target21⟩, ⟨5858, target22⟩, ⟨5860, target23⟩, ⟨5862, target24⟩, ⟨5864, target25⟩, ⟨5866, target26⟩, ⟨5888, target27⟩, ⟨5947, target28⟩, ⟨5973, target29⟩, ⟨5977, target30⟩, ⟨5980, target31⟩, ⟨5983, target32⟩, ⟨5985, target33⟩, ⟨5989, target34⟩, ⟨5991, target35⟩, ⟨5995, target36⟩, ⟨5997, target37⟩, ⟨5999, target38⟩, ⟨6001, target39⟩, ⟨6003, target40⟩, ⟨6011, target41⟩, ⟨6018, target42⟩, ⟨6020, target43⟩, ⟨6040, target44⟩, ⟨6048, target45⟩, ⟨6052, target46⟩, ⟨6055, target47⟩, ⟨6058, target48⟩, ⟨7928, target49⟩, ⟨7930, target50⟩, ⟨7940, target51⟩, ⟨7944, target52⟩, ⟨7964, target53⟩, ⟨7967, target54⟩, ⟨8128, target55⟩, ⟨8136, target56⟩, ⟨8138, target57⟩, ⟨8140, target58⟩, ⟨8144, target59⟩, ⟨8148, target60⟩, ⟨8152, target61⟩, ⟨8174, target62⟩, ⟨8177, target63⟩, ⟨8822, target64⟩, ⟨8830, target65⟩, ⟨8832, target66⟩, ⟨8834, target67⟩, ⟨8838, target68⟩, ⟨8842, target69⟩, ⟨8846, target70⟩, ⟨8848, target71⟩, ⟨8850, target72⟩, ⟨8852, target73⟩, ⟨8854, target74⟩, ⟨8876, target75⟩, ⟨8879, target76⟩, ⟨8930, target77⟩, ⟨8938, target78⟩, ⟨8940, target79⟩, ⟨8942, target80⟩, ⟨8946, target81⟩, ⟨8950, target82⟩, ⟨8954, target83⟩, ⟨8956, target84⟩, ⟨8958, target85⟩, ⟨8960, target86⟩, ⟨8962, target87⟩, ⟨8984, target88⟩, ⟨8987, target89⟩]
  indexMask := 255695785581178052924958905762513815664721424736885271748545336766821977194706149631713577340235093913601850053441547768688177940993382749561216427724963159081147177286411940122025995055795479595612098506717214954139860958295437089663077301490576832417594359986579645286743753589857329141550237527251300648338031511054070460160275787754054915664172933985794310614092281493408493403471451166789908323346804361191186662804698278309737684493745141924089217173513041122372734587759486924437668544563113850135914356144208603909511011278009612649410007902863774551632533236883053020274456835255832799554383864035381487456526479160690636565008202230091619609698625895702051111780151354402226674952134465666615510636444822365465898504667738588569460416981972795927742623798183268625250337454712762765567467456929009754867559397864351057490554442705530761929798159545827602005889367389786278397558635329294786729300456369833537612636513635899103702063860867911848789664236694405043211271429958499695409071874157182999322976985369751204329236834148457648855077476157179303626545775356826380534428625042160662648495587017678376059506850647698599997959230591546010675247326624107265636198016031792116091280005265457242796760476353185942418126213372494835260945231888674674370289902785283930962148212173843246400100116494708709213712515175190622260394296477035371954643893353930966177082557691389405151807692176996313858171964737211106880358025402336871984478823957583529802732706461298409941319275949239200639318147994757618484091817894541683439595671553002383644615689809459836792213645818232543421719434352775789008672276881149563752438067591741129745915102519623628638386715421357625594591854914221096442143985773224886118261276724498879612337016346372463476415833759307141827444847229209767652435952469178544726746858785558371870010384517669822488612993876378367157178322842759503157827915962011094985051722444744869549186025180540496581879281943707377868535717541237821730807251348380409997736714855500495688203576408072387162989683309676964379266543883946074995590388588064160586225257024432263027078195450096954788355393183268545529276686857594875133731364456488214682794900707746664881643061077740582985633025370825077759403782789246148571641716471467991691903319191256370155573929338016847945834830409406255769355700634303400466870161273418466556626931141785698618584017826333748830944445593390057748157671493543146819755021148202335268085912474932916944844518915892237858704944976222134863508094432168674428610568276850384169449976343222476446464346166893343367574589372901238141977687742937652349662020311100099535529902863971799703953584688912286264759940351995391782963733376279923618546396714950329368576
  count := 90

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

end FranklSmallCyclic.TransportBatches.G062.B004.Data
