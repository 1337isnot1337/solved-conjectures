module

public import Conjectures.FranklSmallCyclicRowCoverage
public import Conjectures.FranklSmallCyclicCanonicalWords
public import Conjectures.FranklSmallCyclicOrbit8Block003Data

/-! 90 literal targets sharing one source proof block.
Original words and row indices are retained; weights may be transported.
-/
@[expose] public section

namespace FranklSmallCyclic.TransportBatches.G029.B002.Data

-- Period 8, original row 8400, representative 3766.
def source0 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B003.Data.entryAt ⟨69, by decide +kernel⟩

def target0 : Weights.Entry :=
  { word := [10, 10, 10, 8, 9, 8, 8], weights := [1, 1, 1, 1] }

def points0 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 8402, representative 3794.
def source1 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B003.Data.entryAt ⟨97, by decide +kernel⟩

def target1 : Weights.Entry :=
  { word := [10, 10, 10, 8, 10, 8, 0], weights := [1, 0, 1, 0] }

def points1 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 8472, representative 3781.
def source2 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B003.Data.entryAt ⟨84, by decide +kernel⟩

def target2 : Weights.Entry :=
  { word := [12, 0, 4, 10, 0, 12, 10], weights := [1, 0, 1, 1] }

-- Period 8, original row 8565, representative 3780.
def source3 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B003.Data.entryAt ⟨83, by decide +kernel⟩

def target3 : Weights.Entry :=
  { word := [12, 0, 12, 10, 0, 12, 10], weights := [1, 0, 1, 1] }

-- Period 8, original row 8703, representative 3783.
def source4 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B003.Data.entryAt ⟨86, by decide +kernel⟩

def target4 : Weights.Entry :=
  { word := [12, 4, 8, 8, 1, 12, 10], weights := [1, 0, 1, 1] }

-- Period 8, original row 8991, representative 3787.
def source5 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B003.Data.entryAt ⟨90, by decide +kernel⟩

def target5 : Weights.Entry :=
  { word := [12, 10, 0, 9, 8, 2, 2], weights := [1, 1, 0, 1] }

def points5 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 8992, representative 3783.
def source6 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B003.Data.entryAt ⟨86, by decide +kernel⟩

def target6 : Weights.Entry :=
  { word := [12, 10, 0, 9, 8, 2, 10], weights := [1, 1, 0, 1] }

def points6 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 8998, representative 3786.
def source7 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B003.Data.entryAt ⟨89, by decide +kernel⟩

def target7 : Weights.Entry :=
  { word := [12, 10, 0, 9, 8, 10, 2], weights := [1, 1, 0, 1] }

def points7 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 8999, representative 3782.
def source8 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B003.Data.entryAt ⟨85, by decide +kernel⟩

def target8 : Weights.Entry :=
  { word := [12, 10, 0, 9, 8, 10, 10], weights := [1, 1, 0, 1] }

-- Period 8, original row 9004, representative 3748.
def source9 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B003.Data.entryAt ⟨51, by decide +kernel⟩

def target9 : Weights.Entry :=
  { word := [12, 10, 0, 12, 2, 0, 1], weights := [1, 1, 0, 1] }

def points9 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 9005, representative 3785.
def source10 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B003.Data.entryAt ⟨88, by decide +kernel⟩

def target10 : Weights.Entry :=
  { word := [12, 10, 0, 12, 2, 0, 2], weights := [1, 1, 0, 1] }

def points10 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 9007, representative 3793.
def source11 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B003.Data.entryAt ⟨96, by decide +kernel⟩

def target11 : Weights.Entry :=
  { word := [12, 10, 0, 12, 2, 0, 8], weights := [1, 1, 0, 1] }

def points11 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 9009, representative 3781.
def source12 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B003.Data.entryAt ⟨84, by decide +kernel⟩

def target12 : Weights.Entry :=
  { word := [12, 10, 0, 12, 2, 0, 10], weights := [1, 1, 0, 1] }

def points12 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 9011, representative 3748.
def source13 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B003.Data.entryAt ⟨51, by decide +kernel⟩

def target13 : Weights.Entry :=
  { word := [12, 10, 0, 12, 4, 4, 0], weights := [1, 1, 1, 0] }

def points13 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 5), (4, 6), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 9012, representative 3747.
def source14 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B003.Data.entryAt ⟨50, by decide +kernel⟩

def target14 : Weights.Entry :=
  { word := [12, 10, 0, 12, 10, 0, 1], weights := [1, 1, 0, 1] }

def points14 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 9013, representative 3784.
def source15 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B003.Data.entryAt ⟨87, by decide +kernel⟩

def target15 : Weights.Entry :=
  { word := [12, 10, 0, 12, 10, 0, 2], weights := [1, 1, 0, 1] }

def points15 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 9015, representative 3792.
def source16 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B003.Data.entryAt ⟨95, by decide +kernel⟩

def target16 : Weights.Entry :=
  { word := [12, 10, 0, 12, 10, 0, 8], weights := [1, 1, 0, 1] }

def points16 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 9017, representative 3780.
def source17 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B003.Data.entryAt ⟨83, by decide +kernel⟩

def target17 : Weights.Entry :=
  { word := [12, 10, 0, 12, 10, 0, 10], weights := [1, 1, 0, 1] }

def points17 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 9019, representative 3747.
def source18 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B003.Data.entryAt ⟨50, by decide +kernel⟩

def target18 : Weights.Entry :=
  { word := [12, 10, 0, 12, 12, 4, 0], weights := [1, 1, 1, 0] }

def points18 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 5), (4, 6), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 9020, representative 3808.
def source19 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B003.Data.entryAt ⟨111, by decide +kernel⟩

def target19 : Weights.Entry :=
  { word := [12, 10, 8, 2, 8, 2, 0], weights := [0, 1, 0, 1] }

def points19 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 9021, representative 3790.
def source20 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B003.Data.entryAt ⟨93, by decide +kernel⟩

def target20 : Weights.Entry :=
  { word := [12, 10, 8, 2, 8, 2, 8], weights := [0, 1, 0, 1] }

def points20 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 9024, representative 3806.
def source21 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B003.Data.entryAt ⟨109, by decide +kernel⟩

def target21 : Weights.Entry :=
  { word := [12, 10, 8, 2, 8, 10, 0], weights := [0, 1, 0, 1] }

def points21 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 9025, representative 3788.
def source22 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B003.Data.entryAt ⟨91, by decide +kernel⟩

def target22 : Weights.Entry :=
  { word := [12, 10, 8, 2, 8, 10, 8], weights := [0, 1, 0, 1] }

def points22 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 9026, representative 3708.
def source23 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B003.Data.entryAt ⟨13, by decide +kernel⟩

def target23 : Weights.Entry :=
  { word := [12, 10, 8, 4, 4, 4, 0], weights := [1, 0, 1, 0] }

def points23 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 9027, representative 3704.
def source24 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B003.Data.entryAt ⟨9, by decide +kernel⟩

def target24 : Weights.Entry :=
  { word := [12, 10, 8, 4, 4, 12, 0], weights := [1, 0, 1, 0] }

def points24 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 9028, representative 3709.
def source25 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B003.Data.entryAt ⟨14, by decide +kernel⟩

def target25 : Weights.Entry :=
  { word := [12, 10, 8, 4, 12, 4, 0], weights := [1, 0, 1, 0] }

def points25 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 9029, representative 3705.
def source26 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B003.Data.entryAt ⟨10, by decide +kernel⟩

def target26 : Weights.Entry :=
  { word := [12, 10, 8, 4, 12, 12, 0], weights := [1, 0, 1, 0] }

def points26 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 9030, representative 3803.
def source27 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B003.Data.entryAt ⟨106, by decide +kernel⟩

def target27 : Weights.Entry :=
  { word := [12, 10, 8, 8, 4, 2, 0], weights := [0, 1, 1, 0] }

def points27 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 9031, representative 3703.
def source28 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B003.Data.entryAt ⟨8, by decide +kernel⟩

def target28 : Weights.Entry :=
  { word := [12, 10, 8, 8, 4, 6, 0], weights := [0, 1, 1, 0] }

def points28 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 9032, representative 3801.
def source29 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B003.Data.entryAt ⟨104, by decide +kernel⟩

def target29 : Weights.Entry :=
  { word := [12, 10, 8, 8, 4, 10, 0], weights := [0, 1, 1, 0] }

def points29 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 9033, representative 3802.
def source30 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B003.Data.entryAt ⟨105, by decide +kernel⟩

def target30 : Weights.Entry :=
  { word := [12, 10, 8, 8, 12, 2, 0], weights := [0, 1, 1, 0] }

def points30 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 9034, representative 3702.
def source31 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B003.Data.entryAt ⟨7, by decide +kernel⟩

def target31 : Weights.Entry :=
  { word := [12, 10, 8, 8, 12, 6, 0], weights := [0, 1, 1, 0] }

def points31 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 9035, representative 3800.
def source32 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B003.Data.entryAt ⟨103, by decide +kernel⟩

def target32 : Weights.Entry :=
  { word := [12, 10, 8, 8, 12, 10, 0], weights := [0, 1, 1, 0] }

def points32 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 9036, representative 3809.
def source33 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B003.Data.entryAt ⟨112, by decide +kernel⟩

def target33 : Weights.Entry :=
  { word := [12, 10, 8, 10, 8, 2, 0], weights := [0, 1, 0, 1] }

def points33 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 9037, representative 3791.
def source34 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B003.Data.entryAt ⟨94, by decide +kernel⟩

def target34 : Weights.Entry :=
  { word := [12, 10, 8, 10, 8, 2, 8], weights := [0, 1, 0, 1] }

def points34 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 9038, representative 3712.
def source35 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B003.Data.entryAt ⟨17, by decide +kernel⟩

def target35 : Weights.Entry :=
  { word := [12, 10, 8, 10, 8, 6, 0], weights := [0, 1, 1, 0] }

def points35 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 9039, representative 3701.
def source36 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B003.Data.entryAt ⟨6, by decide +kernel⟩

def target36 : Weights.Entry :=
  { word := [12, 10, 8, 10, 8, 6, 8], weights := [1, 1, 1, 1] }

def points36 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 9042, representative 3807.
def source37 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B003.Data.entryAt ⟨110, by decide +kernel⟩

def target37 : Weights.Entry :=
  { word := [12, 10, 8, 10, 8, 10, 0], weights := [0, 1, 0, 1] }

def points37 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 9043, representative 3789.
def source38 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B003.Data.entryAt ⟨92, by decide +kernel⟩

def target38 : Weights.Entry :=
  { word := [12, 10, 8, 10, 8, 10, 8], weights := [0, 1, 0, 1] }

def points38 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 9046, representative 3711.
def source39 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B003.Data.entryAt ⟨16, by decide +kernel⟩

def target39 : Weights.Entry :=
  { word := [12, 10, 8, 12, 4, 4, 0], weights := [0, 1, 1, 0] }

def points39 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 9047, representative 3700.
def source40 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B003.Data.entryAt ⟨5, by decide +kernel⟩

def target40 : Weights.Entry :=
  { word := [12, 10, 8, 12, 4, 4, 8], weights := [1, 1, 1, 1] }

def points40 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 9048, representative 3707.
def source41 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B003.Data.entryAt ⟨12, by decide +kernel⟩

def target41 : Weights.Entry :=
  { word := [12, 10, 8, 12, 4, 12, 0], weights := [0, 1, 1, 0] }

def points41 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 9049, representative 3698.
def source42 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B003.Data.entryAt ⟨3, by decide +kernel⟩

def target42 : Weights.Entry :=
  { word := [12, 10, 8, 12, 4, 12, 8], weights := [1, 1, 1, 1] }

def points42 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 9050, representative 3710.
def source43 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B003.Data.entryAt ⟨15, by decide +kernel⟩

def target43 : Weights.Entry :=
  { word := [12, 10, 8, 12, 12, 4, 0], weights := [0, 1, 1, 0] }

def points43 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 9051, representative 3699.
def source44 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B003.Data.entryAt ⟨4, by decide +kernel⟩

def target44 : Weights.Entry :=
  { word := [12, 10, 8, 12, 12, 4, 8], weights := [1, 1, 1, 1] }

def points44 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 9052, representative 3706.
def source45 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B003.Data.entryAt ⟨11, by decide +kernel⟩

def target45 : Weights.Entry :=
  { word := [12, 10, 8, 12, 12, 12, 0], weights := [0, 1, 1, 0] }

def points45 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 9053, representative 3697.
def source46 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B003.Data.entryAt ⟨2, by decide +kernel⟩

def target46 : Weights.Entry :=
  { word := [12, 10, 8, 12, 12, 12, 8], weights := [1, 1, 1, 1] }

def points46 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 9068, representative 3782.
def source47 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B003.Data.entryAt ⟨85, by decide +kernel⟩

def target47 : Weights.Entry :=
  { word := [12, 12, 8, 8, 1, 12, 10], weights := [1, 0, 1, 1] }

def points47 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 9, original row 21, representative 3816.
def source48 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B003.Data.entryAt ⟨119, by decide +kernel⟩

def target48 : Weights.Entry :=
  { word := [0, 0, 1, 4, 8, 12, 12], weights := [1, 0, 0, 1] }

def points48 : List (ℕ × ℕ) := [(0, 8), (1, 0), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 9, original row 44, representative 3819.
def source49 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B003.Data.entryAt ⟨122, by decide +kernel⟩

def target49 : Weights.Entry :=
  { word := [0, 0, 1, 12, 8, 12, 12], weights := [1, 0, 1, 0] }

def points49 : List (ℕ × ℕ) := [(0, 8), (1, 0), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 9, original row 527, representative 3816.
def source50 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B003.Data.entryAt ⟨119, by decide +kernel⟩

def target50 : Weights.Entry :=
  { word := [0, 4, 0, 4, 8, 12, 12], weights := [1, 0, 0, 1] }

def points50 : List (ℕ × ℕ) := [(0, 8), (1, 0), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 9, original row 550, representative 3819.
def source51 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B003.Data.entryAt ⟨122, by decide +kernel⟩

def target51 : Weights.Entry :=
  { word := [0, 4, 0, 12, 8, 12, 12], weights := [1, 0, 1, 0] }

def points51 : List (ℕ × ℕ) := [(0, 8), (1, 0), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 9, original row 1758, representative 3816.
def source52 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B003.Data.entryAt ⟨119, by decide +kernel⟩

def target52 : Weights.Entry :=
  { word := [1, 0, 1, 4, 8, 12, 12], weights := [1, 0, 0, 1] }

def points52 : List (ℕ × ℕ) := [(0, 8), (1, 0), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 9, original row 1781, representative 3819.
def source53 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B003.Data.entryAt ⟨122, by decide +kernel⟩

def target53 : Weights.Entry :=
  { word := [1, 0, 1, 12, 8, 12, 12], weights := [1, 0, 1, 0] }

def points53 : List (ℕ × ℕ) := [(0, 8), (1, 0), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 9, original row 2390, representative 3744.
def source54 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B003.Data.entryAt ⟨47, by decide +kernel⟩

def target54 : Weights.Entry :=
  { word := [2, 0, 0, 9, 4, 12, 12], weights := [1, 0, 1, 1] }

def points54 : List (ℕ × ℕ) := [(0, 8), (1, 0), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 9, original row 2394, representative 3740.
def source55 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B003.Data.entryAt ⟨43, by decide +kernel⟩

def target55 : Weights.Entry :=
  { word := [2, 0, 0, 9, 12, 12, 12], weights := [1, 0, 1, 1] }

def points55 : List (ℕ × ℕ) := [(0, 8), (1, 0), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 9, original row 3400, representative 3744.
def source56 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B003.Data.entryAt ⟨47, by decide +kernel⟩

def target56 : Weights.Entry :=
  { word := [4, 0, 0, 9, 4, 12, 12], weights := [1, 0, 1, 1] }

def points56 : List (ℕ × ℕ) := [(0, 8), (1, 0), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 9, original row 3404, representative 3740.
def source57 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B003.Data.entryAt ⟨43, by decide +kernel⟩

def target57 : Weights.Entry :=
  { word := [4, 0, 0, 9, 12, 12, 12], weights := [1, 0, 1, 1] }

def points57 : List (ℕ × ℕ) := [(0, 8), (1, 0), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 9, original row 3460, representative 3748.
def source58 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B003.Data.entryAt ⟨51, by decide +kernel⟩

def target58 : Weights.Entry :=
  { word := [4, 0, 4, 10, 0, 12, 10], weights := [1, 0, 1, 1] }

def points58 : List (ℕ × ℕ) := [(0, 8), (1, 0), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 9, original row 3461, representative 3748.
def source59 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B003.Data.entryAt ⟨51, by decide +kernel⟩

def target59 : Weights.Entry :=
  { word := [4, 0, 4, 10, 0, 12, 12], weights := [1, 0, 1, 1] }

def points59 : List (ℕ × ℕ) := [(0, 7), (1, 0), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 8)]

-- Period 9, original row 3469, representative 3746.
def source60 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B003.Data.entryAt ⟨49, by decide +kernel⟩

def target60 : Weights.Entry :=
  { word := [4, 0, 4, 10, 8, 12, 12], weights := [1, 0, 1, 1] }

def points60 : List (ℕ × ℕ) := [(0, 8), (1, 0), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 9, original row 3491, representative 3743.
def source61 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B003.Data.entryAt ⟨46, by decide +kernel⟩

def target61 : Weights.Entry :=
  { word := [4, 0, 8, 9, 4, 12, 12], weights := [1, 0, 1, 1] }

def points61 : List (ℕ × ℕ) := [(0, 8), (1, 0), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 9, original row 3553, representative 3747.
def source62 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B003.Data.entryAt ⟨50, by decide +kernel⟩

def target62 : Weights.Entry :=
  { word := [4, 0, 12, 10, 0, 12, 10], weights := [1, 0, 1, 1] }

def points62 : List (ℕ × ℕ) := [(0, 8), (1, 0), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 9, original row 3554, representative 3747.
def source63 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B003.Data.entryAt ⟨50, by decide +kernel⟩

def target63 : Weights.Entry :=
  { word := [4, 0, 12, 10, 0, 12, 12], weights := [1, 0, 1, 1] }

def points63 : List (ℕ × ℕ) := [(0, 7), (1, 0), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 8)]

-- Period 9, original row 3562, representative 3745.
def source64 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B003.Data.entryAt ⟨48, by decide +kernel⟩

def target64 : Weights.Entry :=
  { word := [4, 0, 12, 10, 8, 12, 12], weights := [1, 0, 1, 1] }

def points64 : List (ℕ × ℕ) := [(0, 8), (1, 0), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 9, original row 8219, representative 3748.
def source65 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B003.Data.entryAt ⟨51, by decide +kernel⟩

def target65 : Weights.Entry :=
  { word := [10, 10, 0, 12, 2, 0, 2], weights := [1, 1, 0, 1] }

def points65 : List (ℕ × ℕ) := [(0, 2), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1)]

-- Period 9, original row 8227, representative 3747.
def source66 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B003.Data.entryAt ⟨50, by decide +kernel⟩

def target66 : Weights.Entry :=
  { word := [10, 10, 0, 12, 10, 0, 2], weights := [1, 1, 0, 1] }

def points66 : List (ℕ × ℕ) := [(0, 2), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1)]

-- Period 9, original row 8235, representative 3744.
def source67 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B003.Data.entryAt ⟨47, by decide +kernel⟩

def target67 : Weights.Entry :=
  { word := [10, 10, 2, 8, 1, 0, 2], weights := [1, 1, 0, 1] }

def points67 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 9, original row 8236, representative 3744.
def source68 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B003.Data.entryAt ⟨47, by decide +kernel⟩

def target68 : Weights.Entry :=
  { word := [10, 10, 2, 8, 1, 0, 4], weights := [1, 1, 0, 1] }

def points68 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 9, original row 8249, representative 3743.
def source69 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B003.Data.entryAt ⟨46, by decide +kernel⟩

def target69 : Weights.Entry :=
  { word := [10, 10, 2, 8, 9, 0, 2], weights := [1, 1, 0, 1] }

def points69 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 9, original row 8261, representative 3816.
def source70 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B003.Data.entryAt ⟨119, by decide +kernel⟩

def target70 : Weights.Entry :=
  { word := [10, 10, 8, 2, 0, 1, 0], weights := [1, 0, 0, 1] }

def points70 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 9, original row 8263, representative 3816.
def source71 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B003.Data.entryAt ⟨119, by decide +kernel⟩

def target71 : Weights.Entry :=
  { word := [10, 10, 8, 2, 0, 2, 0], weights := [1, 0, 0, 1] }

def points71 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 9, original row 8310, representative 3819.
def source72 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B003.Data.entryAt ⟨122, by decide +kernel⟩

def target72 : Weights.Entry :=
  { word := [10, 10, 8, 10, 0, 1, 0], weights := [0, 1, 0, 1] }

def points72 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 9, original row 8312, representative 3819.
def source73 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B003.Data.entryAt ⟨122, by decide +kernel⟩

def target73 : Weights.Entry :=
  { word := [10, 10, 8, 10, 0, 2, 0], weights := [0, 1, 0, 1] }

def points73 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 9, original row 8341, representative 3746.
def source74 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B003.Data.entryAt ⟨49, by decide +kernel⟩

def target74 : Weights.Entry :=
  { word := [10, 10, 8, 12, 2, 0, 2], weights := [1, 1, 0, 1] }

def points74 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 9, original row 8363, representative 3745.
def source75 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B003.Data.entryAt ⟨48, by decide +kernel⟩

def target75 : Weights.Entry :=
  { word := [10, 10, 8, 12, 10, 0, 2], weights := [1, 1, 0, 1] }

def points75 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 9, original row 8379, representative 3740.
def source76 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B003.Data.entryAt ⟨43, by decide +kernel⟩

def target76 : Weights.Entry :=
  { word := [10, 10, 10, 8, 1, 0, 2], weights := [1, 1, 0, 1] }

def points76 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 9, original row 8380, representative 3740.
def source77 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B003.Data.entryAt ⟨43, by decide +kernel⟩

def target77 : Weights.Entry :=
  { word := [10, 10, 10, 8, 1, 0, 4], weights := [1, 1, 0, 1] }

def points77 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 9, original row 9005, representative 3748.
def source78 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B003.Data.entryAt ⟨51, by decide +kernel⟩

def target78 : Weights.Entry :=
  { word := [12, 10, 0, 12, 2, 0, 2], weights := [1, 1, 0, 1] }

def points78 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 9, original row 9013, representative 3747.
def source79 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B003.Data.entryAt ⟨50, by decide +kernel⟩

def target79 : Weights.Entry :=
  { word := [12, 10, 0, 12, 10, 0, 2], weights := [1, 1, 0, 1] }

def points79 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 10, original row 21, representative 3816.
def source80 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B003.Data.entryAt ⟨119, by decide +kernel⟩

def target80 : Weights.Entry :=
  { word := [0, 0, 1, 4, 8, 12, 12], weights := [1, 0, 0, 1] }

def points80 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 10, original row 44, representative 3819.
def source81 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B003.Data.entryAt ⟨122, by decide +kernel⟩

def target81 : Weights.Entry :=
  { word := [0, 0, 1, 12, 8, 12, 12], weights := [1, 0, 1, 0] }

def points81 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 10, original row 527, representative 3816.
def source82 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B003.Data.entryAt ⟨119, by decide +kernel⟩

def target82 : Weights.Entry :=
  { word := [0, 4, 0, 4, 8, 12, 12], weights := [1, 0, 0, 1] }

def points82 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 10, original row 550, representative 3819.
def source83 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B003.Data.entryAt ⟨122, by decide +kernel⟩

def target83 : Weights.Entry :=
  { word := [0, 4, 0, 12, 8, 12, 12], weights := [1, 0, 1, 0] }

def points83 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 10, original row 1758, representative 3816.
def source84 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B003.Data.entryAt ⟨119, by decide +kernel⟩

def target84 : Weights.Entry :=
  { word := [1, 0, 1, 4, 8, 12, 12], weights := [1, 0, 0, 1] }

def points84 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 10, original row 1781, representative 3819.
def source85 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B003.Data.entryAt ⟨122, by decide +kernel⟩

def target85 : Weights.Entry :=
  { word := [1, 0, 1, 12, 8, 12, 12], weights := [1, 0, 1, 0] }

def points85 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 10, original row 8261, representative 3816.
def source86 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B003.Data.entryAt ⟨119, by decide +kernel⟩

def target86 : Weights.Entry :=
  { word := [10, 10, 8, 2, 0, 1, 0], weights := [1, 0, 0, 1] }

def points86 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 10, original row 8263, representative 3816.
def source87 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B003.Data.entryAt ⟨119, by decide +kernel⟩

def target87 : Weights.Entry :=
  { word := [10, 10, 8, 2, 0, 2, 0], weights := [1, 0, 0, 1] }

def points87 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 10, original row 8310, representative 3819.
def source88 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B003.Data.entryAt ⟨122, by decide +kernel⟩

def target88 : Weights.Entry :=
  { word := [10, 10, 8, 10, 0, 1, 0], weights := [0, 1, 0, 1] }

def points88 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 10, original row 8312, representative 3819.
def source89 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B003.Data.entryAt ⟨122, by decide +kernel⟩

def target89 : Weights.Entry :=
  { word := [10, 10, 8, 10, 0, 2, 0], weights := [0, 1, 0, 1] }

def points89 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

def period8Entries : List Weights.Entry := [target0, target1, target2, target3, target4, target5, target6, target7, target8, target9, target10, target11, target12, target13, target14, target15, target16, target17, target18, target19, target20, target21, target22, target23, target24, target25, target26, target27, target28, target29, target30, target31, target32, target33, target34, target35, target36, target37, target38, target39, target40, target41, target42, target43, target44, target45, target46, target47]

def period8Chunk : RowCoverage.Chunk where
  rows := [⟨8400, target0⟩, ⟨8402, target1⟩, ⟨8472, target2⟩, ⟨8565, target3⟩, ⟨8703, target4⟩, ⟨8991, target5⟩, ⟨8992, target6⟩, ⟨8998, target7⟩, ⟨8999, target8⟩, ⟨9004, target9⟩, ⟨9005, target10⟩, ⟨9007, target11⟩, ⟨9009, target12⟩, ⟨9011, target13⟩, ⟨9012, target14⟩, ⟨9013, target15⟩, ⟨9015, target16⟩, ⟨9017, target17⟩, ⟨9019, target18⟩, ⟨9020, target19⟩, ⟨9021, target20⟩, ⟨9024, target21⟩, ⟨9025, target22⟩, ⟨9026, target23⟩, ⟨9027, target24⟩, ⟨9028, target25⟩, ⟨9029, target26⟩, ⟨9030, target27⟩, ⟨9031, target28⟩, ⟨9032, target29⟩, ⟨9033, target30⟩, ⟨9034, target31⟩, ⟨9035, target32⟩, ⟨9036, target33⟩, ⟨9037, target34⟩, ⟨9038, target35⟩, ⟨9039, target36⟩, ⟨9042, target37⟩, ⟨9043, target38⟩, ⟨9046, target39⟩, ⟨9047, target40⟩, ⟨9048, target41⟩, ⟨9049, target42⟩, ⟨9050, target43⟩, ⟨9051, target44⟩, ⟨9052, target45⟩, ⟨9053, target46⟩, ⟨9068, target47⟩]
  indexMask := 549575172506516037889760094356098917783505538585283358977514158509177341565838501872205653380401126784339736676501678797846231183292618507042275221109811879240311503713406625525897281769719925052808996267311575611712791270586455640399355405191344779954461538437114049999633006951715903257126687096156279705159654324439685049041190735412614119924511187417927619976907709608009523618454038071260338218247802382400368527645365810471912073815851340705810835597636813603251618654647591531377316782230907018795433056915044764301488805148183431294752738528434963020041701860353650692733127758739192655015953046613647498719350945873345426415444781124811188871052620368809323969064604627490927645577451383588579507425732957624880634709683338036342242069129969660275541627406421395622916925514416252110593277484962275321153150147225983759092148868502069516534600947994069293532152970140583778671962374223474124915447809067540720828644867667122642365190877017878851997625480419892283526150357168534429049308066030551882251501848816052852514220104406456987170801086566912777437176509989038619594958456288022592900913730352265852504348138377914337059902850198654900236647692215288195054538317913260558320153784669409506531761695343169198805314379489164672396650351972062927982900186040986230764243622309618835147387205363975994915069384830962090817337536244850581977971451115759524196129187082614980420399392451557236859249295154635478418449180820998924470167870690307292390673858202781309508929086193579050783377363568170057080492614564596071827083056806197479218715480955123168357046647540333689623128817587600951007795620596704071146625318147418677781793911429960281495311929275013367824949659976540492547954563548845232912890910563421288060967097224660277097526348543034924539600996625751555372603207027703684669981545252258198155490195620808057806681698277271579899042003859716468691314658121517615829921595340622174291704716740628386828522842357912784989839785981185671011474572718307119003395142367237120002764212238080468212181265034859947260866325264497520136328031329325293819511714176906608670223160193656496067092642186242721058346169559978570663062045236113590537290698546741828047925478962337505275439713876183499816984429804709918971137555711636486125593730920010530200118576973870702250910600641393856022309871934335763526615620698655211067309570041361063307865572427299473396215774343371942951523611892753509777420147691960688879064016535109835544767810742701639584354594090971581565608906849896844163377658558578333532322594256780182519291132783401311407103250912661645207822211136248640383908100089181569526716177423590545680306752803791800822036864639818002764951550905325931321363743456614127179895277021824211076901765120
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

def period9Entries : List Weights.Entry := [target48, target49, target50, target51, target52, target53, target54, target55, target56, target57, target58, target59, target60, target61, target62, target63, target64, target65, target66, target67, target68, target69, target70, target71, target72, target73, target74, target75, target76, target77, target78, target79]

def period9Chunk : RowCoverage.Chunk where
  rows := [⟨21, target48⟩, ⟨44, target49⟩, ⟨527, target50⟩, ⟨550, target51⟩, ⟨1758, target52⟩, ⟨1781, target53⟩, ⟨2390, target54⟩, ⟨2394, target55⟩, ⟨3400, target56⟩, ⟨3404, target57⟩, ⟨3460, target58⟩, ⟨3461, target59⟩, ⟨3469, target60⟩, ⟨3491, target61⟩, ⟨3553, target62⟩, ⟨3554, target63⟩, ⟨3562, target64⟩, ⟨8219, target65⟩, ⟨8227, target66⟩, ⟨8235, target67⟩, ⟨8236, target68⟩, ⟨8249, target69⟩, ⟨8261, target70⟩, ⟨8263, target71⟩, ⟨8310, target72⟩, ⟨8312, target73⟩, ⟨8341, target74⟩, ⟨8363, target75⟩, ⟨8379, target76⟩, ⟨8380, target77⟩, ⟨9005, target78⟩, ⟨9013, target79⟩]
  indexMask := 15312428629306523059304744495773417990342431570444229970926611427860083770665642375124628469673887256956434266188415298836411811252155409623242249645365218825463574212364865801612756560422174712024985640180704461716723747998407869172460092714414148605608282745322990422194538858029936440215330184084081198158229948378550308764250519258357083251261294485574591307592292474387710273397408704183376342594230778737456809281868004891000103735590510316118415312923674529155937743930655378714233939073841923979166903522549412073593915243850929863673184473142723839906526235118365493709410808675601719019920507177801709804970287132647366686330948498862181848429093536178838532020338382054724451934151177131515823254876969853700260661809135902810281406876897815073332871994686587286507661079170468624462825328884764574982234773224541388073782069684638601061191939762916092133912899791622145811121062167957009160844494440252088142375008845453834411522910474681172739565699936341820120419233253066454817279621859151605146050070696909456987831800777168420192481907817130980614873213279434036425058034449030619801701866369886006804508431900281839779256375915833872508984335423599775976926407512884523545673807876956662665156142512794196710875764089284602040964583803209734896141221176237978254373360343464626979589488164889826645704215766721077459012869228483324090542799519829901861785249048093715281242806210375951131314638694034167201487114507127196936861664973786177322881995346617627792356062806758745723441587127810819042270923469990860506516489648467961421792841530794139588801449531200201762783410794237373251314697893258819266290976881098511504475938086603999683434776220283971451194961375099379223580958786508095492487685803983016742820222570564923295745509346335681848599234300255217571316559018289485946419649000800945318079267030113943057811707708533313696442251398156223785373820408383240394993521992574570942669408837545985313379723152260139493922688366212852142012604178233886901197300167696917745058261409498565147216827277654175303475307878199604806742282988876124850852174207528592324421276700621327267691586435994644809694152034477185056897810745459921328622717103057055399782254240074157971954505658620201518016503015197749466911732478676812745888629461954758040080578821614477193516113591343053896197014136187686486674880752010177029003496565598920897554637604863201121214416975473394711991184612103120526678875248077290851739291929309473314623176873421731179420299843863381989714043016806972801512678164510673231695650149699068191192562143022717861787192926428955284410452147073981940255560240377127570373866188947471102517572348955181279129909565937061755717269699738571071164247169368732497870631993344
  count := 32

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

def period10Entries : List Weights.Entry := [target80, target81, target82, target83, target84, target85, target86, target87, target88, target89]

def period10Chunk : RowCoverage.Chunk where
  rows := [⟨21, target80⟩, ⟨44, target81⟩, ⟨527, target82⟩, ⟨550, target83⟩, ⟨1758, target84⟩, ⟨1781, target85⟩, ⟨8261, target86⟩, ⟨8263, target87⟩, ⟨8310, target88⟩, ⟨8312, target89⟩]
  indexMask := 1812316197769415524294095506939562234987343170640311573540013131773674381016922390617437382724499415612099531213864418550620799920679271686325304599291965875956625922523038275019898244593056833010100993216371851583978052903767025213471275342667533700803378019711817142095203301114698259426130591617728137809112188367599213742570163404836296627454578305188638486025319983413376667009179457270436758978555560795656530922039013149523891831119814431670001073821999772709147766022790950139900969011218864701865174473930646152906139120615605106086079824084685860038438494686671050158032159456637073426884268963323323535907544051277876761548864067346780382358863707579761445041177565851732974498468114578434041050703930972243863680143572787990677919721984895826152966380886270075571029143403106799348700450772436597630631779172191845799505230464173072271614746412107561544500523463053452697383423981086343446162410390437049775917256316981044131050063817255005637360422534270431519837952385522325390612446427082621022696714838625421445169749702591270695326979566817243225655471320295444789454307935093893132490712042745108600773379461830269556408972112758182260963212958977163279200029659710215398550161404369090429406639316237042148465057886552930586958564851814467692218607964846208402952959150989018989162274843420765328772745504981563930982605398220781071833937927562609169517745562059002480535634767408901692120439363688018415198956227448402198551550014019413679856784997198726914115237872662155137863877727236304987210107315977916549753837577995817317413421048490888784368820819039583897567353973061293622802458394828246618480001301653894822052487514632511492031591444497604610642872559795418012303648344372590857011523190970903855415041387180804273566192695075532612884979725631999469259614524855820924612262738115201212496360569696609189754878321632665070128163434327825824268000805285911676314103349253387883292186790261798266096465511318028351856206411866545491610434853158501622609905283372765693441291600429625405793615960289487772102388126993483208105455084623110012330910612394892522279368796787141876387298495757187753705665667565949448578308453731425753790860189757124268526101015892920622950852579857570705631103778334947474602257660082095062504758671639682726294125536798678902961796621382685764924751924485203369268277463082491786224454150621608605552948434253950737794585301339453127056412170336892632707300115785429680125117531629487655945519426879028068330466988818082865120495126127312896
  count := 10

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

end FranklSmallCyclic.TransportBatches.G029.B002.Data
