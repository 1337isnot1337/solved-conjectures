module

public import Conjectures.FranklSmallCyclicRowCoverage
public import Conjectures.FranklSmallCyclicCanonicalWords
public import Conjectures.FranklSmallCyclicOrbit9Block009Data

/-! 128 literal targets sharing one source proof block.
Original words and row indices are retained; weights may be transported.
-/
@[expose] public section

namespace FranklSmallCyclic.TransportBatches.G062.B002.Data

-- Period 9, original row 5941, representative 7923.
def source0 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨20, by decide +kernel⟩

def target0 : Weights.Entry :=
  { word := [8, 9, 0, 12, 2, 8, 8], weights := [1, 0, 0, 1] }

def points0 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2)]

-- Period 9, original row 5946, representative 7903.
def source1 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨0, by decide +kernel⟩

def target1 : Weights.Entry :=
  { word := [8, 9, 0, 12, 6, 0, 8], weights := [1, 0, 0, 1] }

def points1 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2)]

-- Period 9, original row 5947, representative 7985.
def source2 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨82, by decide +kernel⟩

def target2 : Weights.Entry :=
  { word := [8, 9, 0, 12, 6, 8, 0], weights := [1, 0, 1, 0] }

def points2 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 5), (4, 6), (5, 4), (6, 3), (7, 1), (8, 2)]

-- Period 9, original row 5960, representative 7926.
def source3 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨23, by decide +kernel⟩

def target3 : Weights.Entry :=
  { word := [8, 9, 0, 12, 10, 0, 8], weights := [1, 0, 0, 1] }

def points3 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2)]

-- Period 9, original row 5966, representative 7922.
def source4 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨19, by decide +kernel⟩

def target4 : Weights.Entry :=
  { word := [8, 9, 0, 12, 10, 8, 8], weights := [1, 0, 0, 1] }

def points4 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2)]

-- Period 9, original row 5973, representative 7972.
def source5 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨69, by decide +kernel⟩

def target5 : Weights.Entry :=
  { word := [8, 9, 4, 4, 4, 8, 0], weights := [0, 0, 1, 0] }

def points5 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 5977, representative 7973.
def source6 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨70, by decide +kernel⟩

def target6 : Weights.Entry :=
  { word := [8, 9, 4, 4, 12, 8, 0], weights := [0, 0, 1, 0] }

def points6 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 5980, representative 7975.
def source7 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨72, by decide +kernel⟩

def target7 : Weights.Entry :=
  { word := [8, 9, 4, 12, 4, 8, 0], weights := [0, 0, 1, 0] }

def points7 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 5983, representative 7974.
def source8 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨71, by decide +kernel⟩

def target8 : Weights.Entry :=
  { word := [8, 9, 4, 12, 12, 8, 0], weights := [0, 0, 1, 0] }

def points8 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 5985, representative 7986.
def source9 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨83, by decide +kernel⟩

def target9 : Weights.Entry :=
  { word := [8, 9, 8, 1, 4, 2, 0], weights := [1, 0, 1, 0] }

def points9 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 5989, representative 7987.
def source10 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨84, by decide +kernel⟩

def target10 : Weights.Entry :=
  { word := [8, 9, 8, 1, 4, 10, 0], weights := [1, 0, 1, 0] }

def points10 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 5991, representative 7989.
def source11 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨86, by decide +kernel⟩

def target11 : Weights.Entry :=
  { word := [8, 9, 8, 1, 12, 2, 0], weights := [1, 0, 1, 0] }

def points11 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 5995, representative 7988.
def source12 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨85, by decide +kernel⟩

def target12 : Weights.Entry :=
  { word := [8, 9, 8, 1, 12, 10, 0], weights := [1, 0, 1, 0] }

def points12 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 5997, representative 7980.
def source13 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨77, by decide +kernel⟩

def target13 : Weights.Entry :=
  { word := [8, 9, 8, 2, 2, 2, 0], weights := [0, 1, 0, 1] }

def points13 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 5998, representative 7913.
def source14 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨10, by decide +kernel⟩

def target14 : Weights.Entry :=
  { word := [8, 9, 8, 2, 2, 2, 8], weights := [0, 1, 0, 1] }

def points14 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 5999, representative 7981.
def source15 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨78, by decide +kernel⟩

def target15 : Weights.Entry :=
  { word := [8, 9, 8, 2, 2, 10, 0], weights := [0, 1, 0, 1] }

def points15 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 6000, representative 7905.
def source16 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨2, by decide +kernel⟩

def target16 : Weights.Entry :=
  { word := [8, 9, 8, 2, 2, 10, 8], weights := [1, 0, 0, 1] }

-- Period 9, original row 6001, representative 7983.
def source17 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨80, by decide +kernel⟩

def target17 : Weights.Entry :=
  { word := [8, 9, 8, 2, 10, 2, 0], weights := [0, 1, 0, 1] }

def points17 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 6002, representative 7914.
def source18 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨11, by decide +kernel⟩

def target18 : Weights.Entry :=
  { word := [8, 9, 8, 2, 10, 2, 8], weights := [0, 1, 0, 1] }

def points18 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 6003, representative 7982.
def source19 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨79, by decide +kernel⟩

def target19 : Weights.Entry :=
  { word := [8, 9, 8, 2, 10, 10, 0], weights := [0, 1, 0, 1] }

def points19 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 6004, representative 7906.
def source20 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨3, by decide +kernel⟩

def target20 : Weights.Entry :=
  { word := [8, 9, 8, 2, 10, 10, 8], weights := [1, 0, 0, 1] }

-- Period 9, original row 6011, representative 7978.
def source21 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨75, by decide +kernel⟩

def target21 : Weights.Entry :=
  { word := [8, 9, 8, 4, 6, 8, 0], weights := [0, 0, 1, 0] }

def points21 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 6018, representative 7977.
def source22 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨74, by decide +kernel⟩

def target22 : Weights.Entry :=
  { word := [8, 9, 8, 8, 6, 2, 0], weights := [0, 1, 1, 0] }

def points22 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 6020, representative 7976.
def source23 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨73, by decide +kernel⟩

def target23 : Weights.Entry :=
  { word := [8, 9, 8, 8, 6, 10, 0], weights := [0, 1, 1, 0] }

def points23 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 6031, representative 7916.
def source24 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨13, by decide +kernel⟩

def target24 : Weights.Entry :=
  { word := [8, 9, 8, 10, 2, 2, 8], weights := [0, 1, 0, 1] }

def points24 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 6032, representative 7908.
def source25 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨5, by decide +kernel⟩

def target25 : Weights.Entry :=
  { word := [8, 9, 8, 10, 2, 10, 8], weights := [0, 1, 1, 0] }

-- Period 9, original row 6033, representative 7915.
def source26 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨12, by decide +kernel⟩

def target26 : Weights.Entry :=
  { word := [8, 9, 8, 10, 10, 2, 8], weights := [0, 1, 0, 1] }

def points26 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 6034, representative 7907.
def source27 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨4, by decide +kernel⟩

def target27 : Weights.Entry :=
  { word := [8, 9, 8, 10, 10, 10, 8], weights := [0, 1, 1, 0] }

-- Period 9, original row 6040, representative 7979.
def source28 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨76, by decide +kernel⟩

def target28 : Weights.Entry :=
  { word := [8, 9, 8, 12, 6, 8, 0], weights := [0, 0, 1, 0] }

def points28 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 6048, representative 7968.
def source29 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨65, by decide +kernel⟩

def target29 : Weights.Entry :=
  { word := [8, 9, 12, 4, 4, 8, 0], weights := [0, 0, 1, 0] }

def points29 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 6052, representative 7969.
def source30 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨66, by decide +kernel⟩

def target30 : Weights.Entry :=
  { word := [8, 9, 12, 4, 12, 8, 0], weights := [0, 0, 1, 0] }

def points30 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 6055, representative 7971.
def source31 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨68, by decide +kernel⟩

def target31 : Weights.Entry :=
  { word := [8, 9, 12, 12, 4, 8, 0], weights := [0, 0, 1, 0] }

def points31 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 6058, representative 7970.
def source32 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨67, by decide +kernel⟩

def target32 : Weights.Entry :=
  { word := [8, 9, 12, 12, 12, 8, 0], weights := [0, 0, 1, 0] }

def points32 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 6336, representative 7930.
def source33 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨27, by decide +kernel⟩

def target33 : Weights.Entry :=
  { word := [8, 12, 0, 4, 2, 0, 9], weights := [1, 0, 0, 1] }

def points33 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2)]

-- Period 9, original row 6358, representative 7931.
def source34 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨28, by decide +kernel⟩

def target34 : Weights.Entry :=
  { word := [8, 12, 0, 4, 10, 0, 9], weights := [1, 0, 0, 1] }

def points34 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2)]

-- Period 9, original row 6372, representative 7937.
def source35 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨34, by decide +kernel⟩

def target35 : Weights.Entry :=
  { word := [8, 12, 0, 12, 2, 0, 9], weights := [1, 0, 0, 1] }

def points35 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2)]

-- Period 9, original row 6394, representative 7934.
def source36 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨31, by decide +kernel⟩

def target36 : Weights.Entry :=
  { word := [8, 12, 0, 12, 10, 0, 9], weights := [1, 0, 0, 1] }

def points36 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2)]

-- Period 9, original row 6413, representative 7929.
def source37 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨26, by decide +kernel⟩

def target37 : Weights.Entry :=
  { word := [8, 12, 2, 8, 2, 0, 9], weights := [0, 1, 1, 0] }

def points37 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 6421, representative 7928.
def source38 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨25, by decide +kernel⟩

def target38 : Weights.Entry :=
  { word := [8, 12, 2, 8, 10, 0, 9], weights := [0, 1, 1, 0] }

def points38 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 6430, representative 7938.
def source39 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨35, by decide +kernel⟩

def target39 : Weights.Entry :=
  { word := [8, 12, 4, 4, 0, 0, 9], weights := [1, 0, 0, 1] }

def points39 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 6437, representative 7904.
def source40 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨1, by decide +kernel⟩

def target40 : Weights.Entry :=
  { word := [8, 12, 4, 4, 0, 8, 9], weights := [1, 0, 0, 1] }

def points40 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 6444, representative 7939.
def source41 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨36, by decide +kernel⟩

def target41 : Weights.Entry :=
  { word := [8, 12, 4, 4, 8, 0, 9], weights := [1, 0, 0, 1] }

def points41 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 6451, representative 7905.
def source42 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨2, by decide +kernel⟩

def target42 : Weights.Entry :=
  { word := [8, 12, 4, 4, 8, 8, 9], weights := [1, 0, 0, 1] }

def points42 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 6458, representative 7943.
def source43 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨40, by decide +kernel⟩

def target43 : Weights.Entry :=
  { word := [8, 12, 4, 12, 0, 0, 9], weights := [1, 0, 0, 1] }

def points43 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 6465, representative 7911.
def source44 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨8, by decide +kernel⟩

def target44 : Weights.Entry :=
  { word := [8, 12, 4, 12, 0, 8, 9], weights := [1, 0, 0, 1] }

def points44 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 6472, representative 7942.
def source45 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨39, by decide +kernel⟩

def target45 : Weights.Entry :=
  { word := [8, 12, 4, 12, 8, 0, 9], weights := [0, 1, 1, 0] }

def points45 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 6479, representative 7908.
def source46 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨5, by decide +kernel⟩

def target46 : Weights.Entry :=
  { word := [8, 12, 4, 12, 8, 8, 9], weights := [0, 1, 1, 0] }

def points46 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 6491, representative 7935.
def source47 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨32, by decide +kernel⟩

def target47 : Weights.Entry :=
  { word := [8, 12, 8, 4, 2, 0, 9], weights := [1, 0, 0, 1] }

def points47 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 6517, representative 7932.
def source48 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨29, by decide +kernel⟩

def target48 : Weights.Entry :=
  { word := [8, 12, 8, 4, 10, 0, 9], weights := [1, 0, 0, 1] }

def points48 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 6533, representative 7936.
def source49 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨33, by decide +kernel⟩

def target49 : Weights.Entry :=
  { word := [8, 12, 8, 12, 2, 0, 9], weights := [0, 1, 1, 0] }

def points49 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 6559, representative 7933.
def source50 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨30, by decide +kernel⟩

def target50 : Weights.Entry :=
  { word := [8, 12, 8, 12, 10, 0, 9], weights := [0, 1, 1, 0] }

def points50 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 6587, representative 7909.
def source51 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨6, by decide +kernel⟩

def target51 : Weights.Entry :=
  { word := [8, 12, 12, 4, 0, 8, 9], weights := [1, 0, 0, 1] }

def points51 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 6594, representative 7940.
def source52 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨37, by decide +kernel⟩

def target52 : Weights.Entry :=
  { word := [8, 12, 12, 4, 8, 0, 9], weights := [1, 0, 0, 1] }

def points52 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 6601, representative 7906.
def source53 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨3, by decide +kernel⟩

def target53 : Weights.Entry :=
  { word := [8, 12, 12, 4, 8, 8, 9], weights := [1, 0, 0, 1] }

def points53 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 6608, representative 7910.
def source54 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨7, by decide +kernel⟩

def target54 : Weights.Entry :=
  { word := [8, 12, 12, 12, 0, 8, 9], weights := [1, 0, 0, 1] }

def points54 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 6615, representative 7941.
def source55 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨38, by decide +kernel⟩

def target55 : Weights.Entry :=
  { word := [8, 12, 12, 12, 8, 0, 9], weights := [0, 1, 1, 0] }

def points55 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 6622, representative 7907.
def source56 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨4, by decide +kernel⟩

def target56 : Weights.Entry :=
  { word := [8, 12, 12, 12, 8, 8, 9], weights := [0, 1, 1, 0] }

def points56 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 6629, representative 7950.
def source57 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨47, by decide +kernel⟩

def target57 : Weights.Entry :=
  { word := [9, 0, 1, 4, 2, 0, 9], weights := [1, 0, 1, 0] }

def points57 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 6651, representative 7951.
def source58 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨48, by decide +kernel⟩

def target58 : Weights.Entry :=
  { word := [9, 0, 1, 4, 10, 0, 9], weights := [1, 0, 1, 0] }

def points58 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 6665, representative 7957.
def source59 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨54, by decide +kernel⟩

def target59 : Weights.Entry :=
  { word := [9, 0, 1, 12, 2, 0, 9], weights := [1, 0, 1, 0] }

def points59 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 6687, representative 7954.
def source60 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨51, by decide +kernel⟩

def target60 : Weights.Entry :=
  { word := [9, 0, 1, 12, 10, 0, 9], weights := [1, 0, 1, 0] }

def points60 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 6701, representative 7950.
def source61 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨47, by decide +kernel⟩

def target61 : Weights.Entry :=
  { word := [9, 0, 2, 2, 2, 0, 9], weights := [1, 1, 0, 0] }

def points61 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 5), (5, 4), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 6716, representative 7951.
def source62 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨48, by decide +kernel⟩

def target62 : Weights.Entry :=
  { word := [9, 0, 2, 2, 10, 0, 9], weights := [1, 1, 0, 0] }

def points62 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 5), (5, 4), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 6731, representative 7957.
def source63 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨54, by decide +kernel⟩

def target63 : Weights.Entry :=
  { word := [9, 0, 2, 10, 2, 0, 9], weights := [1, 1, 0, 0] }

def points63 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 5), (5, 4), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 6745, representative 7954.
def source64 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨51, by decide +kernel⟩

def target64 : Weights.Entry :=
  { word := [9, 0, 2, 10, 10, 0, 9], weights := [1, 1, 0, 0] }

def points64 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 5), (5, 4), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 6764, representative 7924.
def source65 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨21, by decide +kernel⟩

def target65 : Weights.Entry :=
  { word := [9, 0, 4, 2, 0, 8, 9], weights := [1, 0, 0, 1] }

def points65 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 6796, representative 7927.
def source66 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨24, by decide +kernel⟩

def target66 : Weights.Entry :=
  { word := [9, 0, 4, 10, 0, 8, 9], weights := [1, 0, 0, 1] }

def points66 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 6907, representative 7925.
def source67 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨22, by decide +kernel⟩

def target67 : Weights.Entry :=
  { word := [9, 0, 12, 2, 0, 8, 9], weights := [1, 0, 0, 1] }

def points67 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 6942, representative 7926.
def source68 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨23, by decide +kernel⟩

def target68 : Weights.Entry :=
  { word := [9, 0, 12, 10, 0, 8, 9], weights := [1, 0, 0, 1] }

def points68 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 6967, representative 7958.
def source69 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨55, by decide +kernel⟩

def target69 : Weights.Entry :=
  { word := [9, 4, 4, 4, 0, 0, 9], weights := [1, 0, 0, 1] }

def points69 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 6974, representative 7912.
def source70 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨9, by decide +kernel⟩

def target70 : Weights.Entry :=
  { word := [9, 4, 4, 4, 0, 8, 9], weights := [1, 0, 0, 1] }

def points70 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 6981, representative 7959.
def source71 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨56, by decide +kernel⟩

def target71 : Weights.Entry :=
  { word := [9, 4, 4, 4, 8, 0, 9], weights := [1, 0, 0, 1] }

def points71 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 6988, representative 7913.
def source72 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨10, by decide +kernel⟩

def target72 : Weights.Entry :=
  { word := [9, 4, 4, 4, 8, 8, 9], weights := [1, 0, 1, 0] }

def points72 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 6995, representative 7963.
def source73 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨60, by decide +kernel⟩

def target73 : Weights.Entry :=
  { word := [9, 4, 4, 12, 0, 0, 9], weights := [1, 0, 0, 1] }

def points73 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 7002, representative 7919.
def source74 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨16, by decide +kernel⟩

def target74 : Weights.Entry :=
  { word := [9, 4, 4, 12, 0, 8, 9], weights := [1, 0, 1, 0] }

def points74 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 7009, representative 7962.
def source75 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨59, by decide +kernel⟩

def target75 : Weights.Entry :=
  { word := [9, 4, 4, 12, 8, 0, 9], weights := [0, 1, 1, 0] }

def points75 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 7016, representative 7916.
def source76 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨13, by decide +kernel⟩

def target76 : Weights.Entry :=
  { word := [9, 4, 4, 12, 8, 8, 9], weights := [1, 0, 1, 0] }

def points76 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 7023, representative 7917.
def source77 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨14, by decide +kernel⟩

def target77 : Weights.Entry :=
  { word := [9, 4, 12, 4, 0, 8, 9], weights := [1, 0, 0, 1] }

def points77 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 7030, representative 7960.
def source78 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨57, by decide +kernel⟩

def target78 : Weights.Entry :=
  { word := [9, 4, 12, 4, 8, 0, 9], weights := [1, 0, 0, 1] }

def points78 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 7037, representative 7914.
def source79 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨11, by decide +kernel⟩

def target79 : Weights.Entry :=
  { word := [9, 4, 12, 4, 8, 8, 9], weights := [1, 0, 1, 0] }

def points79 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 7044, representative 7918.
def source80 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨15, by decide +kernel⟩

def target80 : Weights.Entry :=
  { word := [9, 4, 12, 12, 0, 8, 9], weights := [1, 0, 1, 0] }

def points80 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 7051, representative 7961.
def source81 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨58, by decide +kernel⟩

def target81 : Weights.Entry :=
  { word := [9, 4, 12, 12, 8, 0, 9], weights := [0, 1, 1, 0] }

def points81 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 7058, representative 7915.
def source82 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨12, by decide +kernel⟩

def target82 : Weights.Entry :=
  { word := [9, 4, 12, 12, 8, 8, 9], weights := [1, 0, 1, 0] }

def points82 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 7065, representative 7930.
def source83 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨27, by decide +kernel⟩

def target83 : Weights.Entry :=
  { word := [9, 8, 1, 4, 2, 0, 9], weights := [1, 0, 0, 1] }

def points83 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 7087, representative 7931.
def source84 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨28, by decide +kernel⟩

def target84 : Weights.Entry :=
  { word := [9, 8, 1, 4, 10, 0, 9], weights := [1, 0, 0, 1] }

def points84 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 7101, representative 7937.
def source85 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨34, by decide +kernel⟩

def target85 : Weights.Entry :=
  { word := [9, 8, 1, 12, 2, 0, 9], weights := [1, 0, 0, 1] }

def points85 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 7123, representative 7934.
def source86 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨31, by decide +kernel⟩

def target86 : Weights.Entry :=
  { word := [9, 8, 1, 12, 10, 0, 9], weights := [1, 0, 0, 1] }

def points86 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 7137, representative 7946.
def source87 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨43, by decide +kernel⟩

def target87 : Weights.Entry :=
  { word := [9, 8, 2, 2, 2, 0, 9], weights := [0, 1, 0, 0] }

def points87 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 7152, representative 7947.
def source88 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨44, by decide +kernel⟩

def target88 : Weights.Entry :=
  { word := [9, 8, 2, 2, 10, 0, 9], weights := [0, 1, 0, 0] }

def points88 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 7167, representative 7949.
def source89 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨46, by decide +kernel⟩

def target89 : Weights.Entry :=
  { word := [9, 8, 2, 10, 2, 0, 9], weights := [0, 1, 0, 0] }

def points89 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 7181, representative 7948.
def source90 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨45, by decide +kernel⟩

def target90 : Weights.Entry :=
  { word := [9, 8, 2, 10, 10, 0, 9], weights := [0, 1, 0, 0] }

def points90 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 7303, representative 7938.
def source91 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨35, by decide +kernel⟩

def target91 : Weights.Entry :=
  { word := [9, 12, 4, 4, 0, 0, 9], weights := [1, 0, 0, 1] }

def points91 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 7310, representative 7904.
def source92 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨1, by decide +kernel⟩

def target92 : Weights.Entry :=
  { word := [9, 12, 4, 4, 0, 8, 9], weights := [1, 0, 0, 1] }

def points92 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 7317, representative 7939.
def source93 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨36, by decide +kernel⟩

def target93 : Weights.Entry :=
  { word := [9, 12, 4, 4, 8, 0, 9], weights := [1, 0, 0, 1] }

def points93 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 7324, representative 7905.
def source94 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨2, by decide +kernel⟩

def target94 : Weights.Entry :=
  { word := [9, 12, 4, 4, 8, 8, 9], weights := [1, 0, 0, 1] }

def points94 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 7331, representative 7943.
def source95 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨40, by decide +kernel⟩

def target95 : Weights.Entry :=
  { word := [9, 12, 4, 12, 0, 0, 9], weights := [1, 0, 0, 1] }

def points95 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 7338, representative 7911.
def source96 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨8, by decide +kernel⟩

def target96 : Weights.Entry :=
  { word := [9, 12, 4, 12, 0, 8, 9], weights := [1, 0, 0, 1] }

def points96 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 7345, representative 7942.
def source97 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨39, by decide +kernel⟩

def target97 : Weights.Entry :=
  { word := [9, 12, 4, 12, 8, 0, 9], weights := [0, 1, 1, 0] }

def points97 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 7352, representative 7908.
def source98 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨5, by decide +kernel⟩

def target98 : Weights.Entry :=
  { word := [9, 12, 4, 12, 8, 8, 9], weights := [0, 1, 1, 0] }

def points98 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 7359, representative 7909.
def source99 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨6, by decide +kernel⟩

def target99 : Weights.Entry :=
  { word := [9, 12, 12, 4, 0, 8, 9], weights := [1, 0, 0, 1] }

def points99 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 7366, representative 7940.
def source100 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨37, by decide +kernel⟩

def target100 : Weights.Entry :=
  { word := [9, 12, 12, 4, 8, 0, 9], weights := [1, 0, 0, 1] }

def points100 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 7373, representative 7906.
def source101 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨3, by decide +kernel⟩

def target101 : Weights.Entry :=
  { word := [9, 12, 12, 4, 8, 8, 9], weights := [1, 0, 0, 1] }

def points101 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 7380, representative 7910.
def source102 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨7, by decide +kernel⟩

def target102 : Weights.Entry :=
  { word := [9, 12, 12, 12, 0, 8, 9], weights := [1, 0, 0, 1] }

def points102 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 7387, representative 7941.
def source103 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨38, by decide +kernel⟩

def target103 : Weights.Entry :=
  { word := [9, 12, 12, 12, 8, 0, 9], weights := [0, 1, 1, 0] }

def points103 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 7394, representative 7907.
def source104 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨4, by decide +kernel⟩

def target104 : Weights.Entry :=
  { word := [9, 12, 12, 12, 8, 8, 9], weights := [0, 1, 1, 0] }

def points104 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 7928, representative 8030.
def source105 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨127, by decide +kernel⟩

def target105 : Weights.Entry :=
  { word := [10, 8, 4, 2, 0, 9, 0], weights := [1, 0, 0, 1] }

def points105 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 7930, representative 8030.
def source106 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨127, by decide +kernel⟩

def target106 : Weights.Entry :=
  { word := [10, 8, 4, 2, 0, 10, 0], weights := [1, 0, 0, 1] }

def points106 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 7940, representative 8026.
def source107 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨123, by decide +kernel⟩

def target107 : Weights.Entry :=
  { word := [10, 8, 4, 4, 4, 8, 0], weights := [1, 0, 0, 1] }

def points107 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 7944, representative 8027.
def source108 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨124, by decide +kernel⟩

def target108 : Weights.Entry :=
  { word := [10, 8, 4, 4, 12, 8, 0], weights := [1, 0, 0, 1] }

def points108 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 7964, representative 8029.
def source109 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨126, by decide +kernel⟩

def target109 : Weights.Entry :=
  { word := [10, 8, 4, 12, 4, 8, 0], weights := [1, 0, 0, 1] }

def points109 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 7967, representative 8028.
def source110 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨125, by decide +kernel⟩

def target110 : Weights.Entry :=
  { word := [10, 8, 4, 12, 12, 8, 0], weights := [1, 0, 0, 1] }

def points110 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 8128, representative 8025.
def source111 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨122, by decide +kernel⟩

def target111 : Weights.Entry :=
  { word := [10, 8, 12, 2, 0, 8, 0], weights := [1, 0, 0, 1] }

def points111 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 8136, representative 8022.
def source112 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨119, by decide +kernel⟩

def target112 : Weights.Entry :=
  { word := [10, 8, 12, 2, 0, 9, 0], weights := [1, 0, 0, 1] }

def points112 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 8138, representative 8022.
def source113 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨119, by decide +kernel⟩

def target113 : Weights.Entry :=
  { word := [10, 8, 12, 2, 0, 10, 0], weights := [1, 0, 0, 1] }

def points113 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 8140, representative 8024.
def source114 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨121, by decide +kernel⟩

def target114 : Weights.Entry :=
  { word := [10, 8, 12, 2, 8, 2, 0], weights := [1, 0, 0, 1] }

def points114 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 8144, representative 8023.
def source115 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨120, by decide +kernel⟩

def target115 : Weights.Entry :=
  { word := [10, 8, 12, 2, 8, 10, 0], weights := [1, 0, 0, 1] }

def points115 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 8148, representative 8018.
def source116 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨115, by decide +kernel⟩

def target116 : Weights.Entry :=
  { word := [10, 8, 12, 4, 4, 8, 0], weights := [1, 0, 0, 1] }

def points116 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 8152, representative 8019.
def source117 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨116, by decide +kernel⟩

def target117 : Weights.Entry :=
  { word := [10, 8, 12, 4, 12, 8, 0], weights := [1, 0, 0, 1] }

def points117 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 8174, representative 8021.
def source118 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨118, by decide +kernel⟩

def target118 : Weights.Entry :=
  { word := [10, 8, 12, 12, 4, 8, 0], weights := [1, 0, 0, 1] }

def points118 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 8177, representative 8020.
def source119 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨117, by decide +kernel⟩

def target119 : Weights.Entry :=
  { word := [10, 8, 12, 12, 12, 8, 0], weights := [1, 0, 0, 1] }

def points119 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 8822, representative 8017.
def source120 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨114, by decide +kernel⟩

def target120 : Weights.Entry :=
  { word := [12, 8, 4, 2, 0, 8, 0], weights := [0, 1, 0, 0] }

def points120 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 8830, representative 8014.
def source121 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨111, by decide +kernel⟩

def target121 : Weights.Entry :=
  { word := [12, 8, 4, 2, 0, 9, 0], weights := [0, 1, 0, 0] }

def points121 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 8832, representative 8014.
def source122 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨111, by decide +kernel⟩

def target122 : Weights.Entry :=
  { word := [12, 8, 4, 2, 0, 10, 0], weights := [0, 1, 0, 0] }

def points122 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 8834, representative 8016.
def source123 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨113, by decide +kernel⟩

def target123 : Weights.Entry :=
  { word := [12, 8, 4, 2, 8, 2, 0], weights := [0, 1, 0, 0] }

def points123 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 8838, representative 8015.
def source124 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨112, by decide +kernel⟩

def target124 : Weights.Entry :=
  { word := [12, 8, 4, 2, 8, 10, 0], weights := [0, 1, 0, 0] }

def points124 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 8842, representative 8010.
def source125 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨107, by decide +kernel⟩

def target125 : Weights.Entry :=
  { word := [12, 8, 4, 4, 4, 8, 0], weights := [0, 0, 1, 0] }

def points125 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 8846, representative 8011.
def source126 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨108, by decide +kernel⟩

def target126 : Weights.Entry :=
  { word := [12, 8, 4, 4, 12, 8, 0], weights := [0, 0, 1, 0] }

def points126 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 8848, representative 8009.
def source127 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨106, by decide +kernel⟩

def target127 : Weights.Entry :=
  { word := [12, 8, 4, 8, 4, 2, 0], weights := [0, 1, 1, 0] }

def points127 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

def period9Entries : List Weights.Entry := [target0, target1, target2, target3, target4, target5, target6, target7, target8, target9, target10, target11, target12, target13, target14, target15, target16, target17, target18, target19, target20, target21, target22, target23, target24, target25, target26, target27, target28, target29, target30, target31, target32, target33, target34, target35, target36, target37, target38, target39, target40, target41, target42, target43, target44, target45, target46, target47, target48, target49, target50, target51, target52, target53, target54, target55, target56, target57, target58, target59, target60, target61, target62, target63, target64, target65, target66, target67, target68, target69, target70, target71, target72, target73, target74, target75, target76, target77, target78, target79, target80, target81, target82, target83, target84, target85, target86, target87, target88, target89, target90, target91, target92, target93, target94, target95, target96, target97, target98, target99, target100, target101, target102, target103, target104, target105, target106, target107, target108, target109, target110, target111, target112, target113, target114, target115, target116, target117, target118, target119, target120, target121, target122, target123, target124, target125, target126, target127]

def period9Chunk : RowCoverage.Chunk where
  rows := [⟨5941, target0⟩, ⟨5946, target1⟩, ⟨5947, target2⟩, ⟨5960, target3⟩, ⟨5966, target4⟩, ⟨5973, target5⟩, ⟨5977, target6⟩, ⟨5980, target7⟩, ⟨5983, target8⟩, ⟨5985, target9⟩, ⟨5989, target10⟩, ⟨5991, target11⟩, ⟨5995, target12⟩, ⟨5997, target13⟩, ⟨5998, target14⟩, ⟨5999, target15⟩, ⟨6000, target16⟩, ⟨6001, target17⟩, ⟨6002, target18⟩, ⟨6003, target19⟩, ⟨6004, target20⟩, ⟨6011, target21⟩, ⟨6018, target22⟩, ⟨6020, target23⟩, ⟨6031, target24⟩, ⟨6032, target25⟩, ⟨6033, target26⟩, ⟨6034, target27⟩, ⟨6040, target28⟩, ⟨6048, target29⟩, ⟨6052, target30⟩, ⟨6055, target31⟩, ⟨6058, target32⟩, ⟨6336, target33⟩, ⟨6358, target34⟩, ⟨6372, target35⟩, ⟨6394, target36⟩, ⟨6413, target37⟩, ⟨6421, target38⟩, ⟨6430, target39⟩, ⟨6437, target40⟩, ⟨6444, target41⟩, ⟨6451, target42⟩, ⟨6458, target43⟩, ⟨6465, target44⟩, ⟨6472, target45⟩, ⟨6479, target46⟩, ⟨6491, target47⟩, ⟨6517, target48⟩, ⟨6533, target49⟩, ⟨6559, target50⟩, ⟨6587, target51⟩, ⟨6594, target52⟩, ⟨6601, target53⟩, ⟨6608, target54⟩, ⟨6615, target55⟩, ⟨6622, target56⟩, ⟨6629, target57⟩, ⟨6651, target58⟩, ⟨6665, target59⟩, ⟨6687, target60⟩, ⟨6701, target61⟩, ⟨6716, target62⟩, ⟨6731, target63⟩, ⟨6745, target64⟩, ⟨6764, target65⟩, ⟨6796, target66⟩, ⟨6907, target67⟩, ⟨6942, target68⟩, ⟨6967, target69⟩, ⟨6974, target70⟩, ⟨6981, target71⟩, ⟨6988, target72⟩, ⟨6995, target73⟩, ⟨7002, target74⟩, ⟨7009, target75⟩, ⟨7016, target76⟩, ⟨7023, target77⟩, ⟨7030, target78⟩, ⟨7037, target79⟩, ⟨7044, target80⟩, ⟨7051, target81⟩, ⟨7058, target82⟩, ⟨7065, target83⟩, ⟨7087, target84⟩, ⟨7101, target85⟩, ⟨7123, target86⟩, ⟨7137, target87⟩, ⟨7152, target88⟩, ⟨7167, target89⟩, ⟨7181, target90⟩, ⟨7303, target91⟩, ⟨7310, target92⟩, ⟨7317, target93⟩, ⟨7324, target94⟩, ⟨7331, target95⟩, ⟨7338, target96⟩, ⟨7345, target97⟩, ⟨7352, target98⟩, ⟨7359, target99⟩, ⟨7366, target100⟩, ⟨7373, target101⟩, ⟨7380, target102⟩, ⟨7387, target103⟩, ⟨7394, target104⟩, ⟨7928, target105⟩, ⟨7930, target106⟩, ⟨7940, target107⟩, ⟨7944, target108⟩, ⟨7964, target109⟩, ⟨7967, target110⟩, ⟨8128, target111⟩, ⟨8136, target112⟩, ⟨8138, target113⟩, ⟨8140, target114⟩, ⟨8144, target115⟩, ⟨8148, target116⟩, ⟨8152, target117⟩, ⟨8174, target118⟩, ⟨8177, target119⟩, ⟨8822, target120⟩, ⟨8830, target121⟩, ⟨8832, target122⟩, ⟨8834, target123⟩, ⟨8838, target124⟩, ⟨8842, target125⟩, ⟨8846, target126⟩, ⟨8848, target127⟩]
  indexMask := 413113251731298573312466986025448493250097831297999849901868045205968943787772264941751472214005101805801078728487875959978910718746360786816753009497048733162250134025819772394008532706947468644333818647508579683500421215943067964512061902976751227991753086153404159455913232779843195961556180351458500845248124705110571601459388909041527121403205606435517549155159561670217823487602301501521357150255638893857785662699627608526833617919286630411184664675434333991564579112474908361515870540079546579362981505802014185840741505197411577437606431684316250794196382707079736431253495979969925455689212315057169795045774056106058613469284947654627900735526741935260591056265337373590715490444869943263992711402402343793950437162097519852990828345032868317382419964700956195654558916531393697696258604286586700233975400092021241015762783207731516976789184321376606554805068970031899268284822773569508523581926367697322318073732346195299402368803891133785267061817428536157596807586823181534713365464016616024704032463765892830034641329701166802965269926250547482836643563542395325664398960951955773212658230292374921503563527724401136931591736111987862448890543600301078848253888023818205423393122921939339909956386672757640493128493888659958989463955357771565195029145745196459753923253519833428251321626688899248429766686781423614516182035803844584508121190051009636908945522886690628727895347388035264505096827327192286444031883659639872672692215709078667682210069078944815658883498887488607143902956423785145052812683660863177131706514979649314099707055835474336662757681119948362331540131340349676895570419170437905345036332201957913944711359441136481754797643574230064555703659754551103309515386710051165703751671439623104374847594093790939185411626206022949965222663455677456990795203534199707781133128640454133381862191220557099384777129777992010737179931145149014883683522982519060057373729188546720402868230667144353011611892828726046380664292372846523897279365681900628626340166183346006839848972124347978993759798848359535041262551522294067915745836407953429555960673242808760083724496137735567552847887650430750890418642664122774519583821534202513401519969952455674868180035403586115689927737317348078270810119942548444155956272486304910398691484857449062872166479748329961022177277237217500931221959384950635627106784654377144624675847590862929557763551191909499840778817016465210273521551321307249845915542714932998429720929230250340904697996148004866069473662018785204965521526407880507689260572180857489173087292150462183290137220544483064336171435347208786898220300156118848260403189034583352574110849940614544565120407772919395493912124694869311488
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

end FranklSmallCyclic.TransportBatches.G062.B002.Data
