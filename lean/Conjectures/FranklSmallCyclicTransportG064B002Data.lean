module

public import Conjectures.FranklSmallCyclicRowCoverage
public import Conjectures.FranklSmallCyclicCanonicalWords
public import Conjectures.FranklSmallCyclicOrbit9Block011Data

/-! 128 literal targets sharing one source proof block.
Original words and row indices are retained; weights may be transported.
-/
@[expose] public section

namespace FranklSmallCyclic.TransportBatches.G064.B002.Data

-- Period 9, original row 4021, representative 8244.
def source0 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B011.Data.entryAt ⟨85, by decide +kernel⟩

def target0 : Weights.Entry :=
  { word := [4, 10, 8, 8, 12, 2, 0], weights := [0, 1, 1, 0] }

def points0 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 4023, representative 8242.
def source1 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B011.Data.entryAt ⟨83, by decide +kernel⟩

def target1 : Weights.Entry :=
  { word := [4, 10, 8, 8, 12, 10, 0], weights := [0, 1, 1, 0] }

def points1 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 4024, representative 8253.
def source2 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B011.Data.entryAt ⟨94, by decide +kernel⟩

def target2 : Weights.Entry :=
  { word := [4, 10, 8, 10, 8, 2, 0], weights := [0, 1, 0, 1] }

def points2 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 4025, representative 8210.
def source3 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B011.Data.entryAt ⟨51, by decide +kernel⟩

def target3 : Weights.Entry :=
  { word := [4, 10, 8, 10, 8, 2, 8], weights := [1, 0, 0, 1] }

-- Period 9, original row 4026, representative 8168.
def source4 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B011.Data.entryAt ⟨9, by decide +kernel⟩

def target4 : Weights.Entry :=
  { word := [4, 10, 8, 10, 8, 6, 0], weights := [0, 1, 1, 0] }

def points4 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 4030, representative 8251.
def source5 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B011.Data.entryAt ⟨92, by decide +kernel⟩

def target5 : Weights.Entry :=
  { word := [4, 10, 8, 10, 8, 10, 0], weights := [0, 1, 0, 1] }

def points5 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 4031, representative 8208.
def source6 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B011.Data.entryAt ⟨49, by decide +kernel⟩

def target6 : Weights.Entry :=
  { word := [4, 10, 8, 10, 8, 10, 8], weights := [1, 0, 0, 1] }

-- Period 9, original row 4034, representative 8167.
def source7 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B011.Data.entryAt ⟨8, by decide +kernel⟩

def target7 : Weights.Entry :=
  { word := [4, 10, 8, 12, 4, 4, 0], weights := [0, 1, 1, 0] }

def points7 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 4036, representative 8163.
def source8 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B011.Data.entryAt ⟨4, by decide +kernel⟩

def target8 : Weights.Entry :=
  { word := [4, 10, 8, 12, 4, 12, 0], weights := [0, 1, 1, 0] }

def points8 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 4038, representative 8165.
def source9 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B011.Data.entryAt ⟨6, by decide +kernel⟩

def target9 : Weights.Entry :=
  { word := [4, 10, 8, 12, 12, 4, 0], weights := [0, 1, 1, 0] }

def points9 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 4040, representative 8161.
def source10 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B011.Data.entryAt ⟨2, by decide +kernel⟩

def target10 : Weights.Entry :=
  { word := [4, 10, 8, 12, 12, 12, 0], weights := [0, 1, 1, 0] }

def points10 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 4048, representative 8284.
def source11 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B011.Data.entryAt ⟨125, by decide +kernel⟩

def target11 : Weights.Entry :=
  { word := [4, 12, 8, 8, 1, 4, 2], weights := [1, 0, 1, 1] }

def points11 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 4049, representative 8284.
def source12 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B011.Data.entryAt ⟨125, by decide +kernel⟩

def target12 : Weights.Entry :=
  { word := [4, 12, 8, 8, 1, 4, 4], weights := [1, 0, 1, 1] }

def points12 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 4063, representative 8282.
def source13 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B011.Data.entryAt ⟨123, by decide +kernel⟩

def target13 : Weights.Entry :=
  { word := [4, 12, 8, 8, 9, 4, 4], weights := [1, 0, 1, 1] }

def points13 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 4107, representative 8237.
def source14 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B011.Data.entryAt ⟨78, by decide +kernel⟩

def target14 : Weights.Entry :=
  { word := [8, 0, 0, 9, 4, 12, 4], weights := [1, 0, 1, 1] }

def points14 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2)]

-- Period 9, original row 4111, representative 8233.
def source15 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B011.Data.entryAt ⟨74, by decide +kernel⟩

def target15 : Weights.Entry :=
  { word := [8, 0, 0, 9, 12, 12, 4], weights := [1, 0, 1, 1] }

def points15 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2)]

-- Period 9, original row 4120, representative 8223.
def source16 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B011.Data.entryAt ⟨64, by decide +kernel⟩

def target16 : Weights.Entry :=
  { word := [8, 0, 0, 12, 0, 12, 4], weights := [0, 0, 1, 1] }

def points16 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2)]

-- Period 9, original row 4142, representative 8211.
def source17 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B011.Data.entryAt ⟨52, by decide +kernel⟩

def target17 : Weights.Entry :=
  { word := [8, 0, 1, 4, 8, 12, 4], weights := [1, 0, 0, 1] }

def points17 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 4178, representative 8218.
def source18 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B011.Data.entryAt ⟨59, by decide +kernel⟩

def target18 : Weights.Entry :=
  { word := [8, 0, 1, 12, 8, 12, 4], weights := [1, 0, 0, 1] }

def points18 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 4299, representative 8229.
def source19 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B011.Data.entryAt ⟨70, by decide +kernel⟩

def target19 : Weights.Entry :=
  { word := [8, 0, 4, 10, 0, 12, 2], weights := [0, 1, 1, 1] }

def points19 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 4300, representative 8229.
def source20 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B011.Data.entryAt ⟨70, by decide +kernel⟩

def target20 : Weights.Entry :=
  { word := [8, 0, 4, 10, 0, 12, 4], weights := [0, 1, 1, 1] }

def points20 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 4310, representative 8227.
def source21 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B011.Data.entryAt ⟨68, by decide +kernel⟩

def target21 : Weights.Entry :=
  { word := [8, 0, 4, 10, 8, 12, 4], weights := [0, 1, 1, 1] }

def points21 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 4366, representative 8236.
def source22 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B011.Data.entryAt ⟨77, by decide +kernel⟩

def target22 : Weights.Entry :=
  { word := [8, 0, 8, 9, 4, 12, 4], weights := [1, 0, 1, 1] }

def points22 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 4370, representative 8232.
def source23 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B011.Data.entryAt ⟨73, by decide +kernel⟩

def target23 : Weights.Entry :=
  { word := [8, 0, 8, 9, 12, 12, 4], weights := [1, 0, 1, 1] }

def points23 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 4475, representative 8228.
def source24 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B011.Data.entryAt ⟨69, by decide +kernel⟩

def target24 : Weights.Entry :=
  { word := [8, 0, 12, 10, 0, 12, 2], weights := [0, 1, 1, 1] }

def points24 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 4476, representative 8228.
def source25 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B011.Data.entryAt ⟨69, by decide +kernel⟩

def target25 : Weights.Entry :=
  { word := [8, 0, 12, 10, 0, 12, 4], weights := [0, 1, 1, 1] }

def points25 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 4486, representative 8226.
def source26 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B011.Data.entryAt ⟨67, by decide +kernel⟩

def target26 : Weights.Entry :=
  { word := [8, 0, 12, 10, 8, 12, 4], weights := [0, 1, 1, 1] }

def points26 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 4679, representative 8178.
def source27 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B011.Data.entryAt ⟨19, by decide +kernel⟩

def target27 : Weights.Entry :=
  { word := [8, 2, 0, 1, 8, 12, 4], weights := [0, 3, 1, 0] }

def points27 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2)]

-- Period 9, original row 4719, representative 8179.
def source28 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B011.Data.entryAt ⟨20, by decide +kernel⟩

def target28 : Weights.Entry :=
  { word := [8, 2, 0, 9, 8, 12, 4], weights := [0, 3, 1, 0] }

def points28 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2)]

-- Period 9, original row 4741, representative 8181.
def source29 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B011.Data.entryAt ⟨22, by decide +kernel⟩

def target29 : Weights.Entry :=
  { word := [8, 2, 0, 10, 8, 12, 4], weights := [0, 3, 0, 1] }

def points29 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2)]

-- Period 9, original row 4843, representative 8172.
def source30 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B011.Data.entryAt ⟨13, by decide +kernel⟩

def target30 : Weights.Entry :=
  { word := [8, 2, 2, 10, 8, 12, 4], weights := [1, 1, 1, 1] }

def points30 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 4915, representative 8180.
def source31 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B011.Data.entryAt ⟨21, by decide +kernel⟩

def target31 : Weights.Entry :=
  { word := [8, 2, 8, 10, 8, 12, 4], weights := [0, 3, 0, 1] }

def points31 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 4998, representative 8171.
def source32 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B011.Data.entryAt ⟨12, by decide +kernel⟩

def target32 : Weights.Entry :=
  { word := [8, 2, 10, 10, 8, 12, 4], weights := [1, 1, 1, 1] }

def points32 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 5021, representative 8211.
def source33 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B011.Data.entryAt ⟨52, by decide +kernel⟩

def target33 : Weights.Entry :=
  { word := [8, 4, 0, 4, 8, 12, 4], weights := [1, 0, 0, 1] }

def points33 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2)]

-- Period 9, original row 5057, representative 8218.
def source34 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B011.Data.entryAt ⟨59, by decide +kernel⟩

def target34 : Weights.Entry :=
  { word := [8, 4, 0, 12, 8, 12, 4], weights := [1, 0, 0, 1] }

def points34 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2)]

-- Period 9, original row 5178, representative 8209.
def source35 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B011.Data.entryAt ⟨50, by decide +kernel⟩

def target35 : Weights.Entry :=
  { word := [8, 4, 8, 4, 8, 12, 2], weights := [1, 0, 0, 1] }

def points35 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 5179, representative 8216.
def source36 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B011.Data.entryAt ⟨57, by decide +kernel⟩

def target36 : Weights.Entry :=
  { word := [8, 4, 8, 4, 8, 12, 4], weights := [1, 0, 0, 1] }

def points36 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 5220, representative 8210.
def source37 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B011.Data.entryAt ⟨51, by decide +kernel⟩

def target37 : Weights.Entry :=
  { word := [8, 4, 8, 12, 8, 12, 2], weights := [1, 0, 0, 1] }

def points37 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 5221, representative 8217.
def source38 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B011.Data.entryAt ⟨58, by decide +kernel⟩

def target38 : Weights.Entry :=
  { word := [8, 4, 8, 12, 8, 12, 4], weights := [1, 0, 0, 1] }

def points38 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 5308, representative 8173.
def source39 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B011.Data.entryAt ⟨14, by decide +kernel⟩

def target39 : Weights.Entry :=
  { word := [8, 6, 8, 12, 8, 12, 4], weights := [1, 1, 1, 1] }

def points39 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 5338, representative 8221.
def source40 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B011.Data.entryAt ⟨62, by decide +kernel⟩

def target40 : Weights.Entry :=
  { word := [8, 8, 0, 4, 0, 12, 4], weights := [1, 0, 1, 2] }

def points40 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2)]

-- Period 9, original row 5364, representative 8219.
def source41 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B011.Data.entryAt ⟨60, by decide +kernel⟩

def target41 : Weights.Entry :=
  { word := [8, 8, 0, 4, 8, 12, 4], weights := [1, 0, 0, 1] }

def points41 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2)]

-- Period 9, original row 5387, representative 8235.
def source42 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B011.Data.entryAt ⟨76, by decide +kernel⟩

def target42 : Weights.Entry :=
  { word := [8, 8, 0, 9, 4, 12, 4], weights := [1, 1, 1, 1] }

def points42 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2)]

-- Period 9, original row 5391, representative 8231.
def source43 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B011.Data.entryAt ⟨72, by decide +kernel⟩

def target43 : Weights.Entry :=
  { word := [8, 8, 0, 9, 12, 12, 4], weights := [1, 1, 1, 1] }

def points43 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2)]

-- Period 9, original row 5402, representative 8222.
def source44 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B011.Data.entryAt ⟨63, by decide +kernel⟩

def target44 : Weights.Entry :=
  { word := [8, 8, 0, 12, 0, 12, 4], weights := [1, 0, 0, 1] }

def points44 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2)]

-- Period 9, original row 5427, representative 8220.
def source45 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B011.Data.entryAt ⟨61, by decide +kernel⟩

def target45 : Weights.Entry :=
  { word := [8, 8, 0, 12, 8, 12, 4], weights := [1, 0, 0, 1] }

def points45 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2)]

-- Period 9, original row 5463, representative 8212.
def source46 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B011.Data.entryAt ⟨53, by decide +kernel⟩

def target46 : Weights.Entry :=
  { word := [8, 8, 1, 4, 8, 12, 4], weights := [1, 0, 0, 1] }

def points46 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 5499, representative 8215.
def source47 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B011.Data.entryAt ⟨56, by decide +kernel⟩

def target47 : Weights.Entry :=
  { word := [8, 8, 1, 12, 8, 12, 4], weights := [1, 0, 0, 1] }

def points47 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 5633, representative 8225.
def source48 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B011.Data.entryAt ⟨66, by decide +kernel⟩

def target48 : Weights.Entry :=
  { word := [8, 8, 4, 10, 8, 12, 4], weights := [1, 1, 1, 1] }

def points48 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 5715, representative 8234.
def source49 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B011.Data.entryAt ⟨75, by decide +kernel⟩

def target49 : Weights.Entry :=
  { word := [8, 8, 8, 9, 4, 12, 4], weights := [1, 1, 1, 1] }

def points49 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 5719, representative 8230.
def source50 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B011.Data.entryAt ⟨71, by decide +kernel⟩

def target50 : Weights.Entry :=
  { word := [8, 8, 8, 9, 12, 12, 4], weights := [1, 1, 1, 1] }

def points50 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 5840, representative 8224.
def source51 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B011.Data.entryAt ⟨65, by decide +kernel⟩

def target51 : Weights.Entry :=
  { word := [8, 8, 12, 10, 8, 12, 4], weights := [1, 1, 1, 1] }

def points51 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 6073, representative 8174.
def source52 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B011.Data.entryAt ⟨15, by decide +kernel⟩

def target52 : Weights.Entry :=
  { word := [8, 10, 0, 1, 8, 12, 4], weights := [0, 3, 1, 0] }

def points52 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2)]

-- Period 9, original row 6113, representative 8175.
def source53 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B011.Data.entryAt ⟨16, by decide +kernel⟩

def target53 : Weights.Entry :=
  { word := [8, 10, 0, 9, 8, 12, 4], weights := [0, 3, 1, 0] }

def points53 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2)]

-- Period 9, original row 6135, representative 8177.
def source54 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B011.Data.entryAt ⟨18, by decide +kernel⟩

def target54 : Weights.Entry :=
  { word := [8, 10, 0, 10, 8, 12, 4], weights := [0, 3, 0, 1] }

def points54 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2)]

-- Period 9, original row 6206, representative 8170.
def source55 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B011.Data.entryAt ⟨11, by decide +kernel⟩

def target55 : Weights.Entry :=
  { word := [8, 10, 2, 10, 8, 12, 4], weights := [1, 1, 1, 1] }

def points55 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 6278, representative 8176.
def source56 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B011.Data.entryAt ⟨17, by decide +kernel⟩

def target56 : Weights.Entry :=
  { word := [8, 10, 8, 10, 8, 12, 4], weights := [0, 3, 0, 1] }

def points56 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 6328, representative 8169.
def source57 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B011.Data.entryAt ⟨10, by decide +kernel⟩

def target57 : Weights.Entry :=
  { word := [8, 10, 10, 10, 8, 12, 4], weights := [1, 1, 1, 1] }

def points57 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 6351, representative 8212.
def source58 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B011.Data.entryAt ⟨53, by decide +kernel⟩

def target58 : Weights.Entry :=
  { word := [8, 12, 0, 4, 8, 12, 4], weights := [1, 0, 0, 1] }

def points58 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2)]

-- Period 9, original row 6387, representative 8215.
def source59 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B011.Data.entryAt ⟨56, by decide +kernel⟩

def target59 : Weights.Entry :=
  { word := [8, 12, 0, 12, 8, 12, 4], weights := [1, 0, 0, 1] }

def points59 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2)]

-- Period 9, original row 6508, representative 8207.
def source60 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B011.Data.entryAt ⟨48, by decide +kernel⟩

def target60 : Weights.Entry :=
  { word := [8, 12, 8, 4, 8, 12, 2], weights := [1, 0, 0, 1] }

def points60 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 6509, representative 8213.
def source61 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B011.Data.entryAt ⟨54, by decide +kernel⟩

def target61 : Weights.Entry :=
  { word := [8, 12, 8, 4, 8, 12, 4], weights := [1, 0, 0, 1] }

def points61 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 6550, representative 8208.
def source62 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B011.Data.entryAt ⟨49, by decide +kernel⟩

def target62 : Weights.Entry :=
  { word := [8, 12, 8, 12, 8, 12, 2], weights := [1, 0, 0, 1] }

def points62 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 6551, representative 8214.
def source63 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B011.Data.entryAt ⟨55, by decide +kernel⟩

def target63 : Weights.Entry :=
  { word := [8, 12, 8, 12, 8, 12, 4], weights := [1, 0, 0, 1] }

def points63 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 6644, representative 8211.
def source64 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B011.Data.entryAt ⟨52, by decide +kernel⟩

def target64 : Weights.Entry :=
  { word := [9, 0, 1, 4, 8, 12, 4], weights := [1, 0, 0, 1] }

def points64 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 6680, representative 8218.
def source65 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B011.Data.entryAt ⟨59, by decide +kernel⟩

def target65 : Weights.Entry :=
  { word := [9, 0, 1, 12, 8, 12, 4], weights := [1, 0, 0, 1] }

def points65 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 6801, representative 8229.
def source66 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B011.Data.entryAt ⟨70, by decide +kernel⟩

def target66 : Weights.Entry :=
  { word := [9, 0, 4, 10, 0, 12, 2], weights := [0, 1, 1, 1] }

def points66 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 6802, representative 8229.
def source67 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B011.Data.entryAt ⟨70, by decide +kernel⟩

def target67 : Weights.Entry :=
  { word := [9, 0, 4, 10, 0, 12, 4], weights := [0, 1, 1, 1] }

def points67 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 6812, representative 8227.
def source68 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B011.Data.entryAt ⟨68, by decide +kernel⟩

def target68 : Weights.Entry :=
  { word := [9, 0, 4, 10, 8, 12, 4], weights := [0, 1, 1, 1] }

def points68 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 6838, representative 8236.
def source69 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B011.Data.entryAt ⟨77, by decide +kernel⟩

def target69 : Weights.Entry :=
  { word := [9, 0, 8, 9, 4, 12, 4], weights := [1, 0, 1, 1] }

def points69 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 6842, representative 8232.
def source70 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B011.Data.entryAt ⟨73, by decide +kernel⟩

def target70 : Weights.Entry :=
  { word := [9, 0, 8, 9, 12, 12, 4], weights := [1, 0, 1, 1] }

def points70 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 6947, representative 8228.
def source71 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B011.Data.entryAt ⟨69, by decide +kernel⟩

def target71 : Weights.Entry :=
  { word := [9, 0, 12, 10, 0, 12, 2], weights := [0, 1, 1, 1] }

def points71 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 6948, representative 8228.
def source72 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B011.Data.entryAt ⟨69, by decide +kernel⟩

def target72 : Weights.Entry :=
  { word := [9, 0, 12, 10, 0, 12, 4], weights := [0, 1, 1, 1] }

def points72 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 6958, representative 8226.
def source73 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B011.Data.entryAt ⟨67, by decide +kernel⟩

def target73 : Weights.Entry :=
  { word := [9, 0, 12, 10, 8, 12, 4], weights := [0, 1, 1, 1] }

def points73 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 7080, representative 8212.
def source74 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B011.Data.entryAt ⟨53, by decide +kernel⟩

def target74 : Weights.Entry :=
  { word := [9, 8, 1, 4, 8, 12, 4], weights := [1, 0, 0, 1] }

def points74 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 7116, representative 8215.
def source75 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B011.Data.entryAt ⟨56, by decide +kernel⟩

def target75 : Weights.Entry :=
  { word := [9, 8, 1, 12, 8, 12, 4], weights := [1, 0, 0, 1] }

def points75 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 10, original row 128, representative 8206.
def source76 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B011.Data.entryAt ⟨47, by decide +kernel⟩

def target76 : Weights.Entry :=
  { word := [0, 1, 0, 9, 4, 12, 4], weights := [1, 0, 1, 1] }

def points76 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 10, original row 132, representative 8202.
def source77 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B011.Data.entryAt ⟨43, by decide +kernel⟩

def target77 : Weights.Entry :=
  { word := [0, 1, 0, 9, 12, 12, 4], weights := [1, 0, 1, 1] }

def points77 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 10, original row 186, representative 8198.
def source78 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B011.Data.entryAt ⟨39, by decide +kernel⟩

def target78 : Weights.Entry :=
  { word := [0, 1, 4, 10, 0, 12, 2], weights := [1, 0, 1, 1] }

def points78 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 10, original row 187, representative 8198.
def source79 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B011.Data.entryAt ⟨39, by decide +kernel⟩

def target79 : Weights.Entry :=
  { word := [0, 1, 4, 10, 0, 12, 4], weights := [1, 0, 1, 1] }

def points79 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 8), (8, 7)]

-- Period 10, original row 197, representative 8196.
def source80 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B011.Data.entryAt ⟨37, by decide +kernel⟩

def target80 : Weights.Entry :=
  { word := [0, 1, 4, 10, 8, 12, 4], weights := [1, 0, 1, 1] }

def points80 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 10, original row 219, representative 8205.
def source81 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B011.Data.entryAt ⟨46, by decide +kernel⟩

def target81 : Weights.Entry :=
  { word := [0, 1, 8, 9, 4, 12, 4], weights := [1, 0, 1, 1] }

def points81 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 10, original row 223, representative 8201.
def source82 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B011.Data.entryAt ⟨42, by decide +kernel⟩

def target82 : Weights.Entry :=
  { word := [0, 1, 8, 9, 12, 12, 4], weights := [1, 0, 1, 1] }

def points82 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 10, original row 279, representative 8197.
def source83 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B011.Data.entryAt ⟨38, by decide +kernel⟩

def target83 : Weights.Entry :=
  { word := [0, 1, 12, 10, 0, 12, 2], weights := [1, 0, 1, 1] }

def points83 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 10, original row 280, representative 8197.
def source84 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B011.Data.entryAt ⟨38, by decide +kernel⟩

def target84 : Weights.Entry :=
  { word := [0, 1, 12, 10, 0, 12, 4], weights := [1, 0, 1, 1] }

def points84 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 8), (8, 7)]

-- Period 10, original row 290, representative 8195.
def source85 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B011.Data.entryAt ⟨36, by decide +kernel⟩

def target85 : Weights.Entry :=
  { word := [0, 1, 12, 10, 8, 12, 4], weights := [1, 0, 1, 1] }

def points85 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 10, original row 308, representative 8194.
def source86 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B011.Data.entryAt ⟨35, by decide +kernel⟩

def target86 : Weights.Entry :=
  { word := [0, 2, 0, 8, 8, 12, 4], weights := [0, 1, 0, 1] }

def points86 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 10, original row 361, representative 8166.
def source87 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B011.Data.entryAt ⟨7, by decide +kernel⟩

def target87 : Weights.Entry :=
  { word := [0, 2, 2, 2, 8, 12, 2], weights := [0, 1, 0, 1] }

def points87 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 10, original row 362, representative 8188.
def source88 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B011.Data.entryAt ⟨29, by decide +kernel⟩

def target88 : Weights.Entry :=
  { word := [0, 2, 2, 2, 8, 12, 4], weights := [0, 1, 0, 1] }

def points88 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 10, original row 378, representative 8198.
def source89 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B011.Data.entryAt ⟨39, by decide +kernel⟩

def target89 : Weights.Entry :=
  { word := [0, 2, 2, 10, 0, 12, 2], weights := [0, 1, 1, 1] }

def points89 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 10, original row 379, representative 8198.
def source90 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B011.Data.entryAt ⟨39, by decide +kernel⟩

def target90 : Weights.Entry :=
  { word := [0, 2, 2, 10, 0, 12, 4], weights := [0, 1, 1, 1] }

def points90 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6), (7, 8), (8, 7)]

-- Period 10, original row 406, representative 8167.
def source91 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B011.Data.entryAt ⟨8, by decide +kernel⟩

def target91 : Weights.Entry :=
  { word := [0, 2, 2, 10, 8, 12, 2], weights := [0, 1, 1, 0] }

def points91 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 10, original row 407, representative 8189.
def source92 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B011.Data.entryAt ⟨30, by decide +kernel⟩

def target92 : Weights.Entry :=
  { word := [0, 2, 2, 10, 8, 12, 4], weights := [0, 1, 0, 1] }

def points92 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 10, original row 459, representative 8164.
def source93 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B011.Data.entryAt ⟨5, by decide +kernel⟩

def target93 : Weights.Entry :=
  { word := [0, 2, 10, 2, 8, 12, 2], weights := [0, 1, 0, 1] }

def points93 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 10, original row 460, representative 8186.
def source94 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B011.Data.entryAt ⟨27, by decide +kernel⟩

def target94 : Weights.Entry :=
  { word := [0, 2, 10, 2, 8, 12, 4], weights := [0, 1, 0, 1] }

def points94 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 10, original row 480, representative 8197.
def source95 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B011.Data.entryAt ⟨38, by decide +kernel⟩

def target95 : Weights.Entry :=
  { word := [0, 2, 10, 10, 0, 12, 2], weights := [0, 1, 1, 1] }

def points95 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 10, original row 481, representative 8197.
def source96 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B011.Data.entryAt ⟨38, by decide +kernel⟩

def target96 : Weights.Entry :=
  { word := [0, 2, 10, 10, 0, 12, 4], weights := [0, 1, 1, 1] }

def points96 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6), (7, 8), (8, 7)]

-- Period 10, original row 501, representative 8165.
def source97 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B011.Data.entryAt ⟨6, by decide +kernel⟩

def target97 : Weights.Entry :=
  { word := [0, 2, 10, 10, 8, 12, 2], weights := [0, 1, 1, 0] }

def points97 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 10, original row 502, representative 8187.
def source98 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B011.Data.entryAt ⟨28, by decide +kernel⟩

def target98 : Weights.Entry :=
  { word := [0, 2, 10, 10, 8, 12, 4], weights := [0, 1, 0, 1] }

def points98 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 10, original row 591, representative 8245.
def source99 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B011.Data.entryAt ⟨86, by decide +kernel⟩

def target99 : Weights.Entry :=
  { word := [0, 4, 2, 8, 8, 12, 2], weights := [0, 1, 1, 0] }

def points99 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 10, original row 656, representative 8252.
def source100 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B011.Data.entryAt ⟨93, by decide +kernel⟩

def target100 : Weights.Entry :=
  { word := [0, 4, 8, 4, 8, 12, 2], weights := [1, 0, 1, 0] }

def points100 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 10, original row 657, representative 8258.
def source101 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B011.Data.entryAt ⟨99, by decide +kernel⟩

def target101 : Weights.Entry :=
  { word := [0, 4, 8, 4, 8, 12, 4], weights := [1, 0, 0, 1] }

def points101 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 10, original row 684, representative 8253.
def source102 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B011.Data.entryAt ⟨94, by decide +kernel⟩

def target102 : Weights.Entry :=
  { word := [0, 4, 8, 12, 8, 12, 2], weights := [1, 0, 1, 0] }

def points102 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 10, original row 685, representative 8259.
def source103 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B011.Data.entryAt ⟨100, by decide +kernel⟩

def target103 : Weights.Entry :=
  { word := [0, 4, 8, 12, 8, 12, 4], weights := [1, 0, 1, 0] }

def points103 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 10, original row 711, representative 8244.
def source104 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B011.Data.entryAt ⟨85, by decide +kernel⟩

def target104 : Weights.Entry :=
  { word := [0, 4, 10, 8, 8, 12, 2], weights := [0, 1, 1, 0] }

def points104 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 10, original row 743, representative 8191.
def source105 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B011.Data.entryAt ⟨32, by decide +kernel⟩

def target105 : Weights.Entry :=
  { word := [0, 6, 0, 12, 8, 12, 4], weights := [0, 1, 0, 1] }

def points105 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 10, original row 763, representative 8159.
def source106 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B011.Data.entryAt ⟨0, by decide +kernel⟩

def target106 : Weights.Entry :=
  { word := [0, 6, 2, 8, 8, 12, 2], weights := [0, 1, 1, 0] }

def points106 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 10, original row 773, representative 8168.
def source107 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B011.Data.entryAt ⟨9, by decide +kernel⟩

def target107 : Weights.Entry :=
  { word := [0, 6, 8, 12, 8, 12, 2], weights := [0, 1, 1, 0] }

def points107 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 10, original row 774, representative 8190.
def source108 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B011.Data.entryAt ⟨31, by decide +kernel⟩

def target108 : Weights.Entry :=
  { word := [0, 6, 8, 12, 8, 12, 4], weights := [0, 1, 0, 1] }

def points108 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 10, original row 798, representative 8262.
def source109 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B011.Data.entryAt ⟨103, by decide +kernel⟩

def target109 : Weights.Entry :=
  { word := [0, 8, 0, 0, 1, 12, 4], weights := [0, 0, 1, 1] }

def points109 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 10, original row 803, representative 8248.
def source110 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B011.Data.entryAt ⟨89, by decide +kernel⟩

def target110 : Weights.Entry :=
  { word := [0, 8, 0, 0, 9, 12, 4], weights := [0, 0, 1, 1] }

def points110 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 10, original row 810, representative 8262.
def source111 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B011.Data.entryAt ⟨103, by decide +kernel⟩

def target111 : Weights.Entry :=
  { word := [0, 8, 0, 4, 0, 12, 4], weights := [0, 0, 1, 1] }

def points111 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 10, original row 836, representative 8260.
def source112 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B011.Data.entryAt ⟨101, by decide +kernel⟩

def target112 : Weights.Entry :=
  { word := [0, 8, 0, 4, 8, 12, 4], weights := [1, 0, 0, 1] }

def points112 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 10, original row 858, representative 8263.
def source113 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B011.Data.entryAt ⟨104, by decide +kernel⟩

def target113 : Weights.Entry :=
  { word := [0, 8, 0, 8, 1, 12, 4], weights := [0, 1, 1, 0] }

def points113 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 10, original row 866, representative 8264.
def source114 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B011.Data.entryAt ⟨105, by decide +kernel⟩

def target114 : Weights.Entry :=
  { word := [0, 8, 0, 8, 8, 12, 4], weights := [0, 1, 0, 1] }

def points114 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 10, original row 870, representative 8249.
def source115 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B011.Data.entryAt ⟨90, by decide +kernel⟩

def target115 : Weights.Entry :=
  { word := [0, 8, 0, 8, 9, 12, 4], weights := [0, 1, 1, 0] }

def points115 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 10, original row 879, representative 8263.
def source116 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B011.Data.entryAt ⟨104, by decide +kernel⟩

def target116 : Weights.Entry :=
  { word := [0, 8, 0, 12, 0, 12, 4], weights := [1, 0, 1, 0] }

def points116 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 10, original row 888, representative 8261.
def source117 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B011.Data.entryAt ⟨102, by decide +kernel⟩

def target117 : Weights.Entry :=
  { word := [0, 8, 0, 12, 8, 12, 4], weights := [1, 0, 1, 0] }

def points117 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 10, original row 911, representative 8254.
def source118 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B011.Data.entryAt ⟨95, by decide +kernel⟩

def target118 : Weights.Entry :=
  { word := [0, 8, 1, 4, 8, 12, 4], weights := [1, 0, 0, 1] }

def points118 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 10, original row 934, representative 8257.
def source119 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B011.Data.entryAt ⟨98, by decide +kernel⟩

def target119 : Weights.Entry :=
  { word := [0, 8, 1, 12, 8, 12, 4], weights := [1, 0, 1, 0] }

def points119 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 10, original row 1006, representative 8241.
def source120 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B011.Data.entryAt ⟨82, by decide +kernel⟩

def target120 : Weights.Entry :=
  { word := [0, 8, 4, 8, 4, 12, 4], weights := [0, 1, 0, 1] }

def points120 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 10, original row 1010, representative 8239.
def source121 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B011.Data.entryAt ⟨80, by decide +kernel⟩

def target121 : Weights.Entry :=
  { word := [0, 8, 4, 8, 12, 12, 4], weights := [0, 1, 0, 1] }

def points121 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 10, original row 1057, representative 8247.
def source122 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B011.Data.entryAt ⟨88, by decide +kernel⟩

def target122 : Weights.Entry :=
  { word := [0, 8, 8, 8, 4, 12, 4], weights := [0, 1, 0, 1] }

def points122 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 10, original row 1062, representative 8246.
def source123 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B011.Data.entryAt ⟨87, by decide +kernel⟩

def target123 : Weights.Entry :=
  { word := [0, 8, 8, 8, 12, 12, 4], weights := [0, 1, 0, 1] }

def points123 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 10, original row 1120, representative 8240.
def source124 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B011.Data.entryAt ⟨81, by decide +kernel⟩

def target124 : Weights.Entry :=
  { word := [0, 8, 12, 8, 4, 12, 4], weights := [0, 1, 0, 1] }

def points124 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 10, original row 1124, representative 8238.
def source125 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B011.Data.entryAt ⟨79, by decide +kernel⟩

def target125 : Weights.Entry :=
  { word := [0, 8, 12, 8, 12, 12, 4], weights := [0, 1, 0, 1] }

def points125 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 10, original row 1192, representative 8204.
def source126 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B011.Data.entryAt ⟨45, by decide +kernel⟩

def target126 : Weights.Entry :=
  { word := [0, 9, 0, 9, 4, 12, 4], weights := [1, 1, 1, 1] }

def points126 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 10, original row 1196, representative 8200.
def source127 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B011.Data.entryAt ⟨41, by decide +kernel⟩

def target127 : Weights.Entry :=
  { word := [0, 9, 0, 9, 12, 12, 4], weights := [1, 1, 1, 1] }

def points127 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

def period9Entries : List Weights.Entry := [target0, target1, target2, target3, target4, target5, target6, target7, target8, target9, target10, target11, target12, target13, target14, target15, target16, target17, target18, target19, target20, target21, target22, target23, target24, target25, target26, target27, target28, target29, target30, target31, target32, target33, target34, target35, target36, target37, target38, target39, target40, target41, target42, target43, target44, target45, target46, target47, target48, target49, target50, target51, target52, target53, target54, target55, target56, target57, target58, target59, target60, target61, target62, target63, target64, target65, target66, target67, target68, target69, target70, target71, target72, target73, target74, target75]

def period9Chunk : RowCoverage.Chunk where
  rows := [⟨4021, target0⟩, ⟨4023, target1⟩, ⟨4024, target2⟩, ⟨4025, target3⟩, ⟨4026, target4⟩, ⟨4030, target5⟩, ⟨4031, target6⟩, ⟨4034, target7⟩, ⟨4036, target8⟩, ⟨4038, target9⟩, ⟨4040, target10⟩, ⟨4048, target11⟩, ⟨4049, target12⟩, ⟨4063, target13⟩, ⟨4107, target14⟩, ⟨4111, target15⟩, ⟨4120, target16⟩, ⟨4142, target17⟩, ⟨4178, target18⟩, ⟨4299, target19⟩, ⟨4300, target20⟩, ⟨4310, target21⟩, ⟨4366, target22⟩, ⟨4370, target23⟩, ⟨4475, target24⟩, ⟨4476, target25⟩, ⟨4486, target26⟩, ⟨4679, target27⟩, ⟨4719, target28⟩, ⟨4741, target29⟩, ⟨4843, target30⟩, ⟨4915, target31⟩, ⟨4998, target32⟩, ⟨5021, target33⟩, ⟨5057, target34⟩, ⟨5178, target35⟩, ⟨5179, target36⟩, ⟨5220, target37⟩, ⟨5221, target38⟩, ⟨5308, target39⟩, ⟨5338, target40⟩, ⟨5364, target41⟩, ⟨5387, target42⟩, ⟨5391, target43⟩, ⟨5402, target44⟩, ⟨5427, target45⟩, ⟨5463, target46⟩, ⟨5499, target47⟩, ⟨5633, target48⟩, ⟨5715, target49⟩, ⟨5719, target50⟩, ⟨5840, target51⟩, ⟨6073, target52⟩, ⟨6113, target53⟩, ⟨6135, target54⟩, ⟨6206, target55⟩, ⟨6278, target56⟩, ⟨6328, target57⟩, ⟨6351, target58⟩, ⟨6387, target59⟩, ⟨6508, target60⟩, ⟨6509, target61⟩, ⟨6550, target62⟩, ⟨6551, target63⟩, ⟨6644, target64⟩, ⟨6680, target65⟩, ⟨6801, target66⟩, ⟨6802, target67⟩, ⟨6812, target68⟩, ⟨6838, target69⟩, ⟨6842, target70⟩, ⟨6947, target71⟩, ⟨6948, target72⟩, ⟨6958, target73⟩, ⟨7080, target74⟩, ⟨7116, target75⟩]
  indexMask := 1347252955206960874220735241327712253116227330712116962470404247332952590025810800770603940243842746109870482556018549927591557677354543603001966488864895383944113283809008664705919534671507126841938373894497414817028650059967425024805527740269763383933765313654826334909817061226861935006000020654922347566467443842388121620060235877487345245380274315797440630627723649731450014258253741403482625904957394335589792718680159201929085098825517295242592230032780646104001814919430301304890863012796255850067790022281649634277289341072616315867601961739525842388073085259211539101924630651507940496467670401312010522919868959449669226724440829576651863504584750134256293613137346414685130865084970057118545234213735650111220969577914860774819567833658182178176699805783923808219614602141235221328384308940076524809114879356475880721616933039152183090141651637163178305613623035249431504074095132192587661711788759635294597654608767076190443435672570512494540178758038408883446940432640064221789856537932582192033231987494598549397470682319781577234145794946118506810937825745347176232855702870810870199019488342697672852296834100622813270502538470732475903669359398205525256286266161066980156807156598371927420073316839298549339848166449508329692919154525765375305256401247525942239070455213782651373648723611464045172765593989158822169021445345247006232120538493646587646599253298765110530887166488693710380155719152139365188079681003564285010848111089719971088856317543571325339458874079407887499889324970161976284498062965315738302985944425424628848301622625639015656892329523991637802527911141416946224375038276637676116751094547633192000083452783520999182962357063876442169341087879716093876707885505140161165364459038078915519197040418732747794350633560260696850048794503915564626579985604280318083280768926310702266671576564023894143403488353798835241011049539070370487999035379812454630532492315413054368777173682874766469591714255576236982617782990022496270561873237815045510895841996573439085477118099771648627972789959856859251304742424181592667930646264023210385923969463205959588068414888993262226825034194368930241602814770040274944
  count := 76

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

def period10Entries : List Weights.Entry := [target76, target77, target78, target79, target80, target81, target82, target83, target84, target85, target86, target87, target88, target89, target90, target91, target92, target93, target94, target95, target96, target97, target98, target99, target100, target101, target102, target103, target104, target105, target106, target107, target108, target109, target110, target111, target112, target113, target114, target115, target116, target117, target118, target119, target120, target121, target122, target123, target124, target125, target126, target127]

def period10Chunk : RowCoverage.Chunk where
  rows := [⟨128, target76⟩, ⟨132, target77⟩, ⟨186, target78⟩, ⟨187, target79⟩, ⟨197, target80⟩, ⟨219, target81⟩, ⟨223, target82⟩, ⟨279, target83⟩, ⟨280, target84⟩, ⟨290, target85⟩, ⟨308, target86⟩, ⟨361, target87⟩, ⟨362, target88⟩, ⟨378, target89⟩, ⟨379, target90⟩, ⟨406, target91⟩, ⟨407, target92⟩, ⟨459, target93⟩, ⟨460, target94⟩, ⟨480, target95⟩, ⟨481, target96⟩, ⟨501, target97⟩, ⟨502, target98⟩, ⟨591, target99⟩, ⟨656, target100⟩, ⟨657, target101⟩, ⟨684, target102⟩, ⟨685, target103⟩, ⟨711, target104⟩, ⟨743, target105⟩, ⟨763, target106⟩, ⟨773, target107⟩, ⟨774, target108⟩, ⟨798, target109⟩, ⟨803, target110⟩, ⟨810, target111⟩, ⟨836, target112⟩, ⟨858, target113⟩, ⟨866, target114⟩, ⟨870, target115⟩, ⟨879, target116⟩, ⟨888, target117⟩, ⟨911, target118⟩, ⟨934, target119⟩, ⟨1006, target120⟩, ⟨1010, target121⟩, ⟨1057, target122⟩, ⟨1062, target123⟩, ⟨1120, target124⟩, ⟨1124, target125⟩, ⟨1192, target126⟩, ⟨1196, target127⟩]
  indexMask := 1143414651400616251981278927599022728180299950615448767639725748571325722696100407958826845245413200871228198713877744786368887852893783912961344734043117710522871686632031401722161671385670529537159357144521213999663026588362215675209118709240319505618373895146950964219011146438063606428475342629291737106450463233766567983503396821835266410892851079058292736
  count := 52

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

end FranklSmallCyclic.TransportBatches.G064.B002.Data
