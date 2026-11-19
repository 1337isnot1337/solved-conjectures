module

public import Conjectures.FranklSmallCyclicRowCoverage
public import Conjectures.FranklSmallCyclicCanonicalWords
public import Conjectures.FranklSmallCyclicOrbit8Block009Data

/-! 128 literal targets sharing one source proof block.
Original words and row indices are retained; weights may be transported.
-/
@[expose] public section

namespace FranklSmallCyclic.TransportBatches.G035.B001.Data

-- Period 8, original row 5870, representative 4511.
def source0 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B009.Data.entryAt ⟨43, by decide +kernel⟩

def target0 : Weights.Entry :=
  { word := [8, 9, 0, 4, 0, 12, 8], weights := [1, 0, 3, 0] }

-- Period 8, original row 5872, representative 4551.
def source1 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B009.Data.entryAt ⟨83, by decide +kernel⟩

def target1 : Weights.Entry :=
  { word := [8, 9, 0, 4, 2, 0, 1], weights := [1, 0, 0, 1] }

def points1 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 5876, representative 4491.
def source2 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B009.Data.entryAt ⟨24, by decide +kernel⟩

def target2 : Weights.Entry :=
  { word := [8, 9, 0, 4, 2, 0, 9], weights := [1, 0, 0, 1] }

def points2 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 5884, representative 4551.
def source3 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B009.Data.entryAt ⟨83, by decide +kernel⟩

def target3 : Weights.Entry :=
  { word := [8, 9, 0, 4, 4, 4, 0], weights := [1, 0, 1, 0] }

def points3 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 5), (4, 6), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 5885, representative 4529.
def source4 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B009.Data.entryAt ⟨61, by decide +kernel⟩

def target4 : Weights.Entry :=
  { word := [8, 9, 0, 4, 4, 4, 8], weights := [1, 0, 0, 1] }

def points4 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 5892, representative 4533.
def source5 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B009.Data.entryAt ⟨65, by decide +kernel⟩

def target5 : Weights.Entry :=
  { word := [8, 9, 0, 4, 8, 4, 8], weights := [1, 0, 0, 1] }

def points5 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 5896, representative 4516.
def source6 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B009.Data.entryAt ⟨48, by decide +kernel⟩

def target6 : Weights.Entry :=
  { word := [8, 9, 0, 4, 8, 12, 8], weights := [1, 0, 1, 0] }

-- Period 8, original row 5898, representative 4552.
def source7 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B009.Data.entryAt ⟨84, by decide +kernel⟩

def target7 : Weights.Entry :=
  { word := [8, 9, 0, 4, 10, 0, 1], weights := [1, 0, 0, 1] }

def points7 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 5902, representative 4492.
def source8 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B009.Data.entryAt ⟨25, by decide +kernel⟩

def target8 : Weights.Entry :=
  { word := [8, 9, 0, 4, 10, 0, 9], weights := [1, 0, 0, 1] }

def points8 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 5910, representative 4552.
def source9 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B009.Data.entryAt ⟨84, by decide +kernel⟩

def target9 : Weights.Entry :=
  { word := [8, 9, 0, 4, 12, 4, 0], weights := [1, 0, 1, 0] }

def points9 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 5), (4, 6), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 5911, representative 4530.
def source10 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B009.Data.entryAt ⟨62, by decide +kernel⟩

def target10 : Weights.Entry :=
  { word := [8, 9, 0, 4, 12, 4, 8], weights := [1, 0, 0, 1] }

def points10 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 5926, representative 4535.
def source11 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B009.Data.entryAt ⟨67, by decide +kernel⟩

def target11 : Weights.Entry :=
  { word := [8, 9, 0, 12, 0, 4, 8], weights := [1, 0, 0, 1] }

def points11 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 5930, representative 4518.
def source12 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B009.Data.entryAt ⟨50, by decide +kernel⟩

def target12 : Weights.Entry :=
  { word := [8, 9, 0, 12, 0, 12, 8], weights := [1, 0, 1, 0] }

-- Period 8, original row 5932, representative 4554.
def source13 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B009.Data.entryAt ⟨86, by decide +kernel⟩

def target13 : Weights.Entry :=
  { word := [8, 9, 0, 12, 2, 0, 1], weights := [1, 0, 0, 1] }

def points13 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 5936, representative 4494.
def source14 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B009.Data.entryAt ⟨27, by decide +kernel⟩

def target14 : Weights.Entry :=
  { word := [8, 9, 0, 12, 2, 0, 9], weights := [1, 0, 0, 1] }

def points14 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 5944, representative 4554.
def source15 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B009.Data.entryAt ⟨86, by decide +kernel⟩

def target15 : Weights.Entry :=
  { word := [8, 9, 0, 12, 4, 4, 0], weights := [1, 0, 1, 0] }

def points15 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 5), (4, 6), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 5945, representative 4532.
def source16 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B009.Data.entryAt ⟨64, by decide +kernel⟩

def target16 : Weights.Entry :=
  { word := [8, 9, 0, 12, 4, 4, 8], weights := [1, 0, 0, 1] }

def points16 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 5951, representative 4534.
def source17 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B009.Data.entryAt ⟨66, by decide +kernel⟩

def target17 : Weights.Entry :=
  { word := [8, 9, 0, 12, 8, 4, 8], weights := [1, 0, 0, 1] }

def points17 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 5955, representative 4517.
def source18 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B009.Data.entryAt ⟨49, by decide +kernel⟩

def target18 : Weights.Entry :=
  { word := [8, 9, 0, 12, 8, 12, 8], weights := [1, 0, 1, 0] }

-- Period 8, original row 5957, representative 4553.
def source19 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B009.Data.entryAt ⟨85, by decide +kernel⟩

def target19 : Weights.Entry :=
  { word := [8, 9, 0, 12, 10, 0, 1], weights := [1, 0, 0, 1] }

def points19 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 5961, representative 4493.
def source20 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B009.Data.entryAt ⟨26, by decide +kernel⟩

def target20 : Weights.Entry :=
  { word := [8, 9, 0, 12, 10, 0, 9], weights := [1, 0, 0, 1] }

def points20 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 5969, representative 4553.
def source21 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B009.Data.entryAt ⟨85, by decide +kernel⟩

def target21 : Weights.Entry :=
  { word := [8, 9, 0, 12, 12, 4, 0], weights := [1, 0, 1, 0] }

def points21 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 5), (4, 6), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 5970, representative 4531.
def source22 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B009.Data.entryAt ⟨63, by decide +kernel⟩

def target22 : Weights.Entry :=
  { word := [8, 9, 0, 12, 12, 4, 8], weights := [1, 0, 0, 1] }

def points22 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 6005, representative 4547.
def source23 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B009.Data.entryAt ⟨79, by decide +kernel⟩

def target23 : Weights.Entry :=
  { word := [8, 9, 8, 4, 4, 4, 0], weights := [1, 0, 0, 1] }

def points23 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 6006, representative 4525.
def source24 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B009.Data.entryAt ⟨57, by decide +kernel⟩

def target24 : Weights.Entry :=
  { word := [8, 9, 8, 4, 4, 4, 8], weights := [1, 0, 0, 1] }

def points24 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 6007, representative 4543.
def source25 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B009.Data.entryAt ⟨75, by decide +kernel⟩

def target25 : Weights.Entry :=
  { word := [8, 9, 8, 4, 4, 12, 0], weights := [1, 0, 0, 1] }

def points25 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 6008, representative 4512.
def source26 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B009.Data.entryAt ⟨44, by decide +kernel⟩

def target26 : Weights.Entry :=
  { word := [8, 9, 8, 4, 4, 12, 8], weights := [1, 0, 0, 1] }

-- Period 8, original row 6013, representative 4548.
def source27 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B009.Data.entryAt ⟨80, by decide +kernel⟩

def target27 : Weights.Entry :=
  { word := [8, 9, 8, 4, 12, 4, 0], weights := [1, 0, 0, 1] }

def points27 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 6014, representative 4526.
def source28 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B009.Data.entryAt ⟨58, by decide +kernel⟩

def target28 : Weights.Entry :=
  { word := [8, 9, 8, 4, 12, 4, 8], weights := [1, 0, 0, 1] }

def points28 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 6015, representative 4544.
def source29 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B009.Data.entryAt ⟨76, by decide +kernel⟩

def target29 : Weights.Entry :=
  { word := [8, 9, 8, 4, 12, 12, 0], weights := [1, 0, 0, 1] }

def points29 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 6016, representative 4513.
def source30 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B009.Data.entryAt ⟨45, by decide +kernel⟩

def target30 : Weights.Entry :=
  { word := [8, 9, 8, 4, 12, 12, 8], weights := [1, 0, 0, 1] }

-- Period 8, original row 6017, representative 4542.
def source31 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B009.Data.entryAt ⟨74, by decide +kernel⟩

def target31 : Weights.Entry :=
  { word := [8, 9, 8, 8, 4, 6, 0], weights := [0, 1, 1, 0] }

def points31 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 6022, representative 4541.
def source32 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B009.Data.entryAt ⟨73, by decide +kernel⟩

def target32 : Weights.Entry :=
  { word := [8, 9, 8, 8, 12, 6, 0], weights := [0, 1, 1, 0] }

def points32 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 6035, representative 4550.
def source33 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B009.Data.entryAt ⟨82, by decide +kernel⟩

def target33 : Weights.Entry :=
  { word := [8, 9, 8, 12, 4, 4, 0], weights := [0, 1, 1, 0] }

def points33 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 6036, representative 4528.
def source34 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B009.Data.entryAt ⟨60, by decide +kernel⟩

def target34 : Weights.Entry :=
  { word := [8, 9, 8, 12, 4, 4, 8], weights := [1, 0, 0, 1] }

def points34 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 6037, representative 4546.
def source35 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B009.Data.entryAt ⟨78, by decide +kernel⟩

def target35 : Weights.Entry :=
  { word := [8, 9, 8, 12, 4, 12, 0], weights := [0, 1, 1, 0] }

def points35 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 6038, representative 4515.
def source36 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B009.Data.entryAt ⟨47, by decide +kernel⟩

def target36 : Weights.Entry :=
  { word := [8, 9, 8, 12, 4, 12, 8], weights := [1, 0, 0, 1] }

-- Period 8, original row 6042, representative 4549.
def source37 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B009.Data.entryAt ⟨81, by decide +kernel⟩

def target37 : Weights.Entry :=
  { word := [8, 9, 8, 12, 12, 4, 0], weights := [0, 1, 1, 0] }

def points37 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 6043, representative 4527.
def source38 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B009.Data.entryAt ⟨59, by decide +kernel⟩

def target38 : Weights.Entry :=
  { word := [8, 9, 8, 12, 12, 4, 8], weights := [1, 0, 0, 1] }

def points38 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 6044, representative 4545.
def source39 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B009.Data.entryAt ⟨77, by decide +kernel⟩

def target39 : Weights.Entry :=
  { word := [8, 9, 8, 12, 12, 12, 0], weights := [0, 1, 1, 0] }

def points39 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 6045, representative 4514.
def source40 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B009.Data.entryAt ⟨46, by decide +kernel⟩

def target40 : Weights.Entry :=
  { word := [8, 9, 8, 12, 12, 12, 8], weights := [1, 0, 0, 1] }

-- Period 8, original row 6077, representative 4511.
def source41 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B009.Data.entryAt ⟨43, by decide +kernel⟩

def target41 : Weights.Entry :=
  { word := [8, 10, 0, 2, 0, 8, 9], weights := [0, 3, 0, 1] }

def points41 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 6120, representative 4521.
def source42 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B009.Data.entryAt ⟨53, by decide +kernel⟩

def target42 : Weights.Entry :=
  { word := [8, 10, 0, 10, 0, 0, 9], weights := [0, 1, 0, 0] }

def points42 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 6127, representative 4518.
def source43 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B009.Data.entryAt ⟨50, by decide +kernel⟩

def target43 : Weights.Entry :=
  { word := [8, 10, 0, 10, 0, 8, 9], weights := [0, 1, 0, 1] }

def points43 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 6141, representative 4523.
def source44 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B009.Data.entryAt ⟨55, by decide +kernel⟩

def target44 : Weights.Entry :=
  { word := [8, 10, 0, 12, 2, 0, 9], weights := [1, 1, 0, 1] }

def points44 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 6149, representative 4522.
def source45 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B009.Data.entryAt ⟨54, by decide +kernel⟩

def target45 : Weights.Entry :=
  { word := [8, 10, 0, 12, 10, 0, 9], weights := [1, 1, 0, 1] }

def points45 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 6157, representative 4519.
def source46 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B009.Data.entryAt ⟨51, by decide +kernel⟩

def target46 : Weights.Entry :=
  { word := [8, 10, 2, 2, 8, 0, 9], weights := [1, 0, 0, 1] }

def points46 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 6169, representative 4512.
def source47 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B009.Data.entryAt ⟨44, by decide +kernel⟩

def target47 : Weights.Entry :=
  { word := [8, 10, 2, 2, 8, 8, 9], weights := [1, 0, 0, 1] }

def points47 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 6180, representative 4520.
def source48 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B009.Data.entryAt ⟨52, by decide +kernel⟩

def target48 : Weights.Entry :=
  { word := [8, 10, 2, 10, 8, 0, 9], weights := [1, 0, 0, 1] }

def points48 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 6197, representative 4515.
def source49 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B009.Data.entryAt ⟨47, by decide +kernel⟩

def target49 : Weights.Entry :=
  { word := [8, 10, 2, 10, 8, 8, 9], weights := [1, 0, 0, 1] }

def points49 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 6219, representative 4516.
def source50 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B009.Data.entryAt ⟨48, by decide +kernel⟩

def target50 : Weights.Entry :=
  { word := [8, 10, 8, 2, 0, 8, 9], weights := [0, 1, 0, 1] }

def points50 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 6260, representative 4517.
def source51 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B009.Data.entryAt ⟨49, by decide +kernel⟩

def target51 : Weights.Entry :=
  { word := [8, 10, 8, 10, 0, 8, 9], weights := [0, 1, 0, 1] }

def points51 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 6297, representative 4513.
def source52 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B009.Data.entryAt ⟨45, by decide +kernel⟩

def target52 : Weights.Entry :=
  { word := [8, 10, 10, 2, 8, 8, 9], weights := [1, 0, 0, 1] }

def points52 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 6319, representative 4514.
def source53 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B009.Data.entryAt ⟨46, by decide +kernel⟩

def target53 : Weights.Entry :=
  { word := [8, 10, 10, 10, 8, 8, 9], weights := [1, 0, 0, 1] }

def points53 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 6631, representative 4483.
def source54 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B009.Data.entryAt ⟨16, by decide +kernel⟩

def target54 : Weights.Entry :=
  { word := [9, 0, 1, 4, 2, 0, 12], weights := [1, 0, 0, 1] }

def points54 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 8, original row 6653, representative 4484.
def source55 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B009.Data.entryAt ⟨17, by decide +kernel⟩

def target55 : Weights.Entry :=
  { word := [9, 0, 1, 4, 10, 0, 12], weights := [1, 0, 0, 1] }

def points55 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 8, original row 6667, representative 4486.
def source56 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B009.Data.entryAt ⟨19, by decide +kernel⟩

def target56 : Weights.Entry :=
  { word := [9, 0, 1, 12, 2, 0, 12], weights := [1, 0, 1, 0] }

def points56 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 8, original row 6689, representative 4485.
def source57 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B009.Data.entryAt ⟨18, by decide +kernel⟩

def target57 : Weights.Entry :=
  { word := [9, 0, 1, 12, 10, 0, 12], weights := [1, 0, 1, 0] }

def points57 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 8, original row 6703, representative 4483.
def source58 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B009.Data.entryAt ⟨16, by decide +kernel⟩

def target58 : Weights.Entry :=
  { word := [9, 0, 2, 2, 2, 0, 12], weights := [1, 0, 0, 1] }

def points58 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 5), (5, 4), (6, 6), (7, 7)]

-- Period 8, original row 6718, representative 4484.
def source59 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B009.Data.entryAt ⟨17, by decide +kernel⟩

def target59 : Weights.Entry :=
  { word := [9, 0, 2, 2, 10, 0, 12], weights := [1, 0, 0, 1] }

def points59 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 5), (5, 4), (6, 6), (7, 7)]

-- Period 8, original row 6733, representative 4486.
def source60 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B009.Data.entryAt ⟨19, by decide +kernel⟩

def target60 : Weights.Entry :=
  { word := [9, 0, 2, 10, 2, 0, 12], weights := [1, 1, 0, 0] }

def points60 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 5), (5, 4), (6, 6), (7, 7)]

-- Period 8, original row 6747, representative 4485.
def source61 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B009.Data.entryAt ⟨18, by decide +kernel⟩

def target61 : Weights.Entry :=
  { word := [9, 0, 2, 10, 10, 0, 12], weights := [1, 1, 0, 0] }

def points61 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 5), (5, 4), (6, 6), (7, 7)]

-- Period 8, original row 6969, representative 4469.
def source62 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B009.Data.entryAt ⟨2, by decide +kernel⟩

def target62 : Weights.Entry :=
  { word := [9, 4, 4, 4, 0, 0, 12], weights := [1, 0, 0, 1] }

def points62 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 8, original row 6983, representative 4470.
def source63 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B009.Data.entryAt ⟨3, by decide +kernel⟩

def target63 : Weights.Entry :=
  { word := [9, 4, 4, 4, 8, 0, 12], weights := [1, 0, 0, 1] }

def points63 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 8, original row 6997, representative 4474.
def source64 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B009.Data.entryAt ⟨7, by decide +kernel⟩

def target64 : Weights.Entry :=
  { word := [9, 4, 4, 12, 0, 0, 12], weights := [1, 0, 1, 0] }

def points64 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 8, original row 7011, representative 4473.
def source65 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B009.Data.entryAt ⟨6, by decide +kernel⟩

def target65 : Weights.Entry :=
  { word := [9, 4, 4, 12, 8, 0, 12], weights := [1, 0, 1, 0] }

def points65 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 8, original row 7032, representative 4471.
def source66 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B009.Data.entryAt ⟨4, by decide +kernel⟩

def target66 : Weights.Entry :=
  { word := [9, 4, 12, 4, 8, 0, 12], weights := [1, 0, 0, 1] }

def points66 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 8, original row 7053, representative 4472.
def source67 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B009.Data.entryAt ⟨5, by decide +kernel⟩

def target67 : Weights.Entry :=
  { word := [9, 4, 12, 12, 8, 0, 12], weights := [1, 0, 1, 0] }

def points67 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 8, original row 7067, representative 4475.
def source68 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B009.Data.entryAt ⟨8, by decide +kernel⟩

def target68 : Weights.Entry :=
  { word := [9, 8, 1, 4, 2, 0, 12], weights := [1, 0, 0, 1] }

def points68 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 8, original row 7089, representative 4476.
def source69 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B009.Data.entryAt ⟨9, by decide +kernel⟩

def target69 : Weights.Entry :=
  { word := [9, 8, 1, 4, 10, 0, 12], weights := [1, 0, 0, 1] }

def points69 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 8, original row 7103, representative 4478.
def source70 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B009.Data.entryAt ⟨11, by decide +kernel⟩

def target70 : Weights.Entry :=
  { word := [9, 8, 1, 12, 2, 0, 12], weights := [1, 0, 1, 0] }

def points70 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 8, original row 7125, representative 4477.
def source71 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B009.Data.entryAt ⟨10, by decide +kernel⟩

def target71 : Weights.Entry :=
  { word := [9, 8, 1, 12, 10, 0, 12], weights := [1, 0, 1, 0] }

def points71 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 8, original row 7139, representative 4479.
def source72 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B009.Data.entryAt ⟨12, by decide +kernel⟩

def target72 : Weights.Entry :=
  { word := [9, 8, 2, 2, 2, 0, 12], weights := [1, 0, 0, 1] }

def points72 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 8, original row 7154, representative 4480.
def source73 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B009.Data.entryAt ⟨13, by decide +kernel⟩

def target73 : Weights.Entry :=
  { word := [9, 8, 2, 2, 10, 0, 12], weights := [1, 0, 0, 1] }

def points73 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 8, original row 7169, representative 4482.
def source74 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B009.Data.entryAt ⟨15, by decide +kernel⟩

def target74 : Weights.Entry :=
  { word := [9, 8, 2, 10, 2, 0, 12], weights := [1, 1, 0, 0] }

def points74 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 8, original row 7183, representative 4481.
def source75 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B009.Data.entryAt ⟨14, by decide +kernel⟩

def target75 : Weights.Entry :=
  { word := [9, 8, 2, 10, 10, 0, 12], weights := [1, 1, 0, 0] }

def points75 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 8, original row 7400, representative 4469.
def source76 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B009.Data.entryAt ⟨2, by decide +kernel⟩

def target76 : Weights.Entry :=
  { word := [10, 0, 0, 2, 2, 2, 8], weights := [1, 0, 0, 1] }

def points76 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 7411, representative 4474.
def source77 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B009.Data.entryAt ⟨7, by decide +kernel⟩

def target77 : Weights.Entry :=
  { word := [10, 0, 0, 10, 2, 2, 8], weights := [0, 1, 0, 1] }

def points77 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 7422, representative 4483.
def source78 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B009.Data.entryAt ⟨16, by decide +kernel⟩

def target78 : Weights.Entry :=
  { word := [10, 0, 4, 2, 0, 1, 8], weights := [1, 0, 0, 1] }

def points78 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 7429, representative 4487.
def source79 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B009.Data.entryAt ⟨20, by decide +kernel⟩

def target79 : Weights.Entry :=
  { word := [10, 0, 4, 2, 0, 8, 8], weights := [1, 0, 0, 1] }

def points79 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 7434, representative 4475.
def source80 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B009.Data.entryAt ⟨8, by decide +kernel⟩

def target80 : Weights.Entry :=
  { word := [10, 0, 4, 2, 0, 9, 8], weights := [1, 0, 0, 1] }

def points80 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 7444, representative 4483.
def source81 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B009.Data.entryAt ⟨16, by decide +kernel⟩

def target81 : Weights.Entry :=
  { word := [10, 0, 4, 4, 4, 0, 8], weights := [1, 0, 0, 1] }

def points81 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 7), (3, 6), (4, 4), (5, 5), (6, 3), (7, 2)]

-- Period 8, original row 7446, representative 4479.
def source82 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B009.Data.entryAt ⟨12, by decide +kernel⟩

def target82 : Weights.Entry :=
  { word := [10, 0, 4, 4, 4, 8, 8], weights := [1, 0, 0, 1] }

def points82 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 7447, representative 4486.
def source83 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B009.Data.entryAt ⟨19, by decide +kernel⟩

def target83 : Weights.Entry :=
  { word := [10, 0, 4, 10, 0, 1, 8], weights := [0, 1, 0, 1] }

def points83 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 7448, representative 4468.
def source84 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B009.Data.entryAt ⟨1, by decide +kernel⟩

def target84 : Weights.Entry :=
  { word := [10, 0, 4, 10, 0, 2, 8], weights := [0, 1, 0, 1] }

def points84 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 7452, representative 4490.
def source85 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B009.Data.entryAt ⟨23, by decide +kernel⟩

def target85 : Weights.Entry :=
  { word := [10, 0, 4, 10, 0, 8, 8], weights := [0, 1, 0, 1] }

def points85 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 7456, representative 4478.
def source86 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B009.Data.entryAt ⟨11, by decide +kernel⟩

def target86 : Weights.Entry :=
  { word := [10, 0, 4, 10, 0, 9, 8], weights := [0, 1, 0, 1] }

def points86 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 7463, representative 4467.
def source87 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B009.Data.entryAt ⟨0, by decide +kernel⟩

def target87 : Weights.Entry :=
  { word := [10, 0, 4, 10, 8, 2, 8], weights := [0, 1, 0, 1] }

def points87 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 7471, representative 4486.
def source88 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B009.Data.entryAt ⟨19, by decide +kernel⟩

def target88 : Weights.Entry :=
  { word := [10, 0, 4, 12, 4, 0, 8], weights := [0, 0, 1, 1] }

def points88 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 7), (3, 6), (4, 4), (5, 5), (6, 3), (7, 2)]

-- Period 8, original row 7473, representative 4482.
def source89 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B009.Data.entryAt ⟨15, by decide +kernel⟩

def target89 : Weights.Entry :=
  { word := [10, 0, 4, 12, 4, 8, 8], weights := [0, 0, 1, 1] }

def points89 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 7477, representative 4470.
def source90 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B009.Data.entryAt ⟨3, by decide +kernel⟩

def target90 : Weights.Entry :=
  { word := [10, 0, 8, 2, 2, 2, 8], weights := [1, 0, 0, 1] }

def points90 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 7481, representative 4471.
def source91 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B009.Data.entryAt ⟨4, by decide +kernel⟩

def target91 : Weights.Entry :=
  { word := [10, 0, 8, 2, 10, 2, 8], weights := [1, 0, 0, 1] }

def points91 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 7500, representative 4473.
def source92 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B009.Data.entryAt ⟨6, by decide +kernel⟩

def target92 : Weights.Entry :=
  { word := [10, 0, 8, 10, 2, 2, 8], weights := [0, 1, 0, 1] }

def points92 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 7502, representative 4472.
def source93 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B009.Data.entryAt ⟨5, by decide +kernel⟩

def target93 : Weights.Entry :=
  { word := [10, 0, 8, 10, 10, 2, 8], weights := [0, 1, 0, 1] }

def points93 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 7539, representative 4484.
def source94 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B009.Data.entryAt ⟨17, by decide +kernel⟩

def target94 : Weights.Entry :=
  { word := [10, 0, 12, 2, 0, 1, 8], weights := [1, 0, 0, 1] }

def points94 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 7546, representative 4488.
def source95 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B009.Data.entryAt ⟨21, by decide +kernel⟩

def target95 : Weights.Entry :=
  { word := [10, 0, 12, 2, 0, 8, 8], weights := [1, 0, 0, 1] }

def points95 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 7551, representative 4476.
def source96 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B009.Data.entryAt ⟨9, by decide +kernel⟩

def target96 : Weights.Entry :=
  { word := [10, 0, 12, 2, 0, 9, 8], weights := [1, 0, 0, 1] }

def points96 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 7561, representative 4484.
def source97 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B009.Data.entryAt ⟨17, by decide +kernel⟩

def target97 : Weights.Entry :=
  { word := [10, 0, 12, 4, 4, 0, 8], weights := [1, 0, 0, 1] }

def points97 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 7), (3, 6), (4, 4), (5, 5), (6, 3), (7, 2)]

-- Period 8, original row 7563, representative 4480.
def source98 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B009.Data.entryAt ⟨13, by decide +kernel⟩

def target98 : Weights.Entry :=
  { word := [10, 0, 12, 4, 4, 8, 8], weights := [1, 0, 0, 1] }

def points98 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 7564, representative 4485.
def source99 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B009.Data.entryAt ⟨18, by decide +kernel⟩

def target99 : Weights.Entry :=
  { word := [10, 0, 12, 10, 0, 1, 8], weights := [0, 1, 0, 1] }

def points99 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 7574, representative 4489.
def source100 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B009.Data.entryAt ⟨22, by decide +kernel⟩

def target100 : Weights.Entry :=
  { word := [10, 0, 12, 10, 0, 8, 8], weights := [0, 1, 0, 1] }

def points100 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 7578, representative 4477.
def source101 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B009.Data.entryAt ⟨10, by decide +kernel⟩

def target101 : Weights.Entry :=
  { word := [10, 0, 12, 10, 0, 9, 8], weights := [0, 1, 0, 1] }

def points101 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 7593, representative 4485.
def source102 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B009.Data.entryAt ⟨18, by decide +kernel⟩

def target102 : Weights.Entry :=
  { word := [10, 0, 12, 12, 4, 0, 8], weights := [0, 0, 1, 1] }

def points102 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 7), (3, 6), (4, 4), (5, 5), (6, 3), (7, 2)]

-- Period 8, original row 7595, representative 4481.
def source103 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B009.Data.entryAt ⟨14, by decide +kernel⟩

def target103 : Weights.Entry :=
  { word := [10, 0, 12, 12, 4, 8, 8], weights := [0, 0, 1, 1] }

def points103 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 8433, representative 4584.
def source104 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B009.Data.entryAt ⟨116, by decide +kernel⟩

def target104 : Weights.Entry :=
  { word := [12, 0, 4, 2, 0, 8, 2], weights := [0, 1, 0, 1] }

def points104 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 8437, representative 4507.
def source105 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B009.Data.entryAt ⟨39, by decide +kernel⟩

def target105 : Weights.Entry :=
  { word := [12, 0, 4, 2, 0, 8, 10], weights := [1, 0, 0, 1] }

-- Period 8, original row 8461, representative 4587.
def source106 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B009.Data.entryAt ⟨119, by decide +kernel⟩

def target106 : Weights.Entry :=
  { word := [12, 0, 4, 10, 0, 8, 2], weights := [0, 1, 0, 1] }

def points106 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 8465, representative 4510.
def source107 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B009.Data.entryAt ⟨42, by decide +kernel⟩

def target107 : Weights.Entry :=
  { word := [12, 0, 4, 10, 0, 8, 10], weights := [1, 0, 0, 1] }

-- Period 8, original row 8522, representative 4585.
def source108 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B009.Data.entryAt ⟨117, by decide +kernel⟩

def target108 : Weights.Entry :=
  { word := [12, 0, 12, 2, 0, 8, 2], weights := [0, 1, 0, 1] }

def points108 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 8526, representative 4508.
def source109 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B009.Data.entryAt ⟨40, by decide +kernel⟩

def target109 : Weights.Entry :=
  { word := [12, 0, 12, 2, 0, 8, 10], weights := [1, 0, 0, 1] }

-- Period 8, original row 8554, representative 4586.
def source110 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B009.Data.entryAt ⟨118, by decide +kernel⟩

def target110 : Weights.Entry :=
  { word := [12, 0, 12, 10, 0, 8, 2], weights := [0, 1, 0, 1] }

def points110 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 8558, representative 4509.
def source111 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B009.Data.entryAt ⟨41, by decide +kernel⟩

def target111 : Weights.Entry :=
  { word := [12, 0, 12, 10, 0, 8, 10], weights := [1, 0, 0, 1] }

-- Period 8, original row 8689, representative 4568.
def source112 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B009.Data.entryAt ⟨100, by decide +kernel⟩

def target112 : Weights.Entry :=
  { word := [12, 4, 4, 8, 8, 2, 2], weights := [0, 1, 1, 0] }

def points112 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 8690, representative 4502.
def source113 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B009.Data.entryAt ⟨34, by decide +kernel⟩

def target113 : Weights.Entry :=
  { word := [12, 4, 4, 8, 8, 2, 10], weights := [0, 1, 1, 0] }

-- Period 8, original row 8691, representative 4564.
def source114 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B009.Data.entryAt ⟨96, by decide +kernel⟩

def target114 : Weights.Entry :=
  { word := [12, 4, 4, 8, 8, 10, 2], weights := [0, 1, 1, 0] }

def points114 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 8692, representative 4500.
def source115 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B009.Data.entryAt ⟨32, by decide +kernel⟩

def target115 : Weights.Entry :=
  { word := [12, 4, 4, 8, 8, 10, 10], weights := [0, 1, 1, 0] }

-- Period 8, original row 8705, representative 4570.
def source116 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B009.Data.entryAt ⟨102, by decide +kernel⟩

def target116 : Weights.Entry :=
  { word := [12, 4, 8, 8, 2, 2, 2], weights := [0, 1, 1, 0] }

def points116 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 8706, representative 4502.
def source117 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B009.Data.entryAt ⟨34, by decide +kernel⟩

def target117 : Weights.Entry :=
  { word := [12, 4, 8, 8, 2, 2, 10], weights := [0, 1, 1, 0] }

def points117 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 8707, representative 4566.
def source118 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B009.Data.entryAt ⟨98, by decide +kernel⟩

def target118 : Weights.Entry :=
  { word := [12, 4, 8, 8, 2, 10, 2], weights := [0, 1, 1, 0] }

def points118 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 8708, representative 4498.
def source119 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B009.Data.entryAt ⟨30, by decide +kernel⟩

def target119 : Weights.Entry :=
  { word := [12, 4, 8, 8, 2, 10, 10], weights := [0, 1, 1, 0] }

-- Period 8, original row 8714, representative 4569.
def source120 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B009.Data.entryAt ⟨101, by decide +kernel⟩

def target120 : Weights.Entry :=
  { word := [12, 4, 8, 8, 10, 2, 2], weights := [0, 1, 1, 0] }

def points120 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 8715, representative 4501.
def source121 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B009.Data.entryAt ⟨33, by decide +kernel⟩

def target121 : Weights.Entry :=
  { word := [12, 4, 8, 8, 10, 2, 10], weights := [0, 1, 1, 0] }

-- Period 8, original row 8716, representative 4565.
def source122 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B009.Data.entryAt ⟨97, by decide +kernel⟩

def target122 : Weights.Entry :=
  { word := [12, 4, 8, 8, 10, 10, 2], weights := [0, 1, 1, 0] }

def points122 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 8717, representative 4497.
def source123 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B009.Data.entryAt ⟨29, by decide +kernel⟩

def target123 : Weights.Entry :=
  { word := [12, 4, 8, 8, 10, 10, 10], weights := [0, 1, 1, 0] }

-- Period 8, original row 8719, representative 4567.
def source124 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B009.Data.entryAt ⟨99, by decide +kernel⟩

def target124 : Weights.Entry :=
  { word := [12, 4, 12, 8, 8, 2, 2], weights := [0, 1, 1, 0] }

def points124 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 8720, representative 4501.
def source125 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B009.Data.entryAt ⟨33, by decide +kernel⟩

def target125 : Weights.Entry :=
  { word := [12, 4, 12, 8, 8, 2, 10], weights := [0, 1, 1, 0] }

def points125 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 8721, representative 4563.
def source126 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B009.Data.entryAt ⟨95, by decide +kernel⟩

def target126 : Weights.Entry :=
  { word := [12, 4, 12, 8, 8, 10, 2], weights := [0, 1, 1, 0] }

def points126 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 8722, representative 4499.
def source127 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B009.Data.entryAt ⟨31, by decide +kernel⟩

def target127 : Weights.Entry :=
  { word := [12, 4, 12, 8, 8, 10, 10], weights := [0, 1, 1, 0] }

def period8Entries : List Weights.Entry := [target0, target1, target2, target3, target4, target5, target6, target7, target8, target9, target10, target11, target12, target13, target14, target15, target16, target17, target18, target19, target20, target21, target22, target23, target24, target25, target26, target27, target28, target29, target30, target31, target32, target33, target34, target35, target36, target37, target38, target39, target40, target41, target42, target43, target44, target45, target46, target47, target48, target49, target50, target51, target52, target53, target54, target55, target56, target57, target58, target59, target60, target61, target62, target63, target64, target65, target66, target67, target68, target69, target70, target71, target72, target73, target74, target75, target76, target77, target78, target79, target80, target81, target82, target83, target84, target85, target86, target87, target88, target89, target90, target91, target92, target93, target94, target95, target96, target97, target98, target99, target100, target101, target102, target103, target104, target105, target106, target107, target108, target109, target110, target111, target112, target113, target114, target115, target116, target117, target118, target119, target120, target121, target122, target123, target124, target125, target126, target127]

def period8Chunk : RowCoverage.Chunk where
  rows := [⟨5870, target0⟩, ⟨5872, target1⟩, ⟨5876, target2⟩, ⟨5884, target3⟩, ⟨5885, target4⟩, ⟨5892, target5⟩, ⟨5896, target6⟩, ⟨5898, target7⟩, ⟨5902, target8⟩, ⟨5910, target9⟩, ⟨5911, target10⟩, ⟨5926, target11⟩, ⟨5930, target12⟩, ⟨5932, target13⟩, ⟨5936, target14⟩, ⟨5944, target15⟩, ⟨5945, target16⟩, ⟨5951, target17⟩, ⟨5955, target18⟩, ⟨5957, target19⟩, ⟨5961, target20⟩, ⟨5969, target21⟩, ⟨5970, target22⟩, ⟨6005, target23⟩, ⟨6006, target24⟩, ⟨6007, target25⟩, ⟨6008, target26⟩, ⟨6013, target27⟩, ⟨6014, target28⟩, ⟨6015, target29⟩, ⟨6016, target30⟩, ⟨6017, target31⟩, ⟨6022, target32⟩, ⟨6035, target33⟩, ⟨6036, target34⟩, ⟨6037, target35⟩, ⟨6038, target36⟩, ⟨6042, target37⟩, ⟨6043, target38⟩, ⟨6044, target39⟩, ⟨6045, target40⟩, ⟨6077, target41⟩, ⟨6120, target42⟩, ⟨6127, target43⟩, ⟨6141, target44⟩, ⟨6149, target45⟩, ⟨6157, target46⟩, ⟨6169, target47⟩, ⟨6180, target48⟩, ⟨6197, target49⟩, ⟨6219, target50⟩, ⟨6260, target51⟩, ⟨6297, target52⟩, ⟨6319, target53⟩, ⟨6631, target54⟩, ⟨6653, target55⟩, ⟨6667, target56⟩, ⟨6689, target57⟩, ⟨6703, target58⟩, ⟨6718, target59⟩, ⟨6733, target60⟩, ⟨6747, target61⟩, ⟨6969, target62⟩, ⟨6983, target63⟩, ⟨6997, target64⟩, ⟨7011, target65⟩, ⟨7032, target66⟩, ⟨7053, target67⟩, ⟨7067, target68⟩, ⟨7089, target69⟩, ⟨7103, target70⟩, ⟨7125, target71⟩, ⟨7139, target72⟩, ⟨7154, target73⟩, ⟨7169, target74⟩, ⟨7183, target75⟩, ⟨7400, target76⟩, ⟨7411, target77⟩, ⟨7422, target78⟩, ⟨7429, target79⟩, ⟨7434, target80⟩, ⟨7444, target81⟩, ⟨7446, target82⟩, ⟨7447, target83⟩, ⟨7448, target84⟩, ⟨7452, target85⟩, ⟨7456, target86⟩, ⟨7463, target87⟩, ⟨7471, target88⟩, ⟨7473, target89⟩, ⟨7477, target90⟩, ⟨7481, target91⟩, ⟨7500, target92⟩, ⟨7502, target93⟩, ⟨7539, target94⟩, ⟨7546, target95⟩, ⟨7551, target96⟩, ⟨7561, target97⟩, ⟨7563, target98⟩, ⟨7564, target99⟩, ⟨7574, target100⟩, ⟨7578, target101⟩, ⟨7593, target102⟩, ⟨7595, target103⟩, ⟨8433, target104⟩, ⟨8437, target105⟩, ⟨8461, target106⟩, ⟨8465, target107⟩, ⟨8522, target108⟩, ⟨8526, target109⟩, ⟨8554, target110⟩, ⟨8558, target111⟩, ⟨8689, target112⟩, ⟨8690, target113⟩, ⟨8691, target114⟩, ⟨8692, target115⟩, ⟨8705, target116⟩, ⟨8706, target117⟩, ⟨8707, target118⟩, ⟨8708, target119⟩, ⟨8714, target120⟩, ⟨8715, target121⟩, ⟨8716, target122⟩, ⟨8717, target123⟩, ⟨8719, target124⟩, ⟨8720, target125⟩, ⟨8721, target126⟩, ⟨8722, target127⟩]
  indexMask := 7413326339639725172833641580094400874011964340375772496703858691972164857668053865355605460331008068081729654187543628508240778081070188873126867375731177388585388082514062391097179408253328707100366597767076153167707823961595523885876999227189971188560833718051754104143639358925040110620296267329284847700522302740272437185400019196762466598400185980546739308609338544447480448033726997953176686222560644560839884816279560834459824148737502354833838124568030149562449639815769862543150573819287900475841259404161566561585086689118049491091982687894424151672428724163069419189188024161632523784846216447744657513865948205996557381598452694225287894201559710404110044604399396261514519955435691824735663224334719247321499831062027923892717680994413288997496323641725663548403597762140558976265368395649596956963779520618936240742000461456337665037295573841712388780854605862854204074815913832638735157602540510496800137917723778844126745804018440653449468062693931723485885902518519049964489812827307261973540323419277840699053716929727109274141328784529680933012862731134293566787444846832832975833031778037067120834280635012268708331527656332331650155565027792061066192161502321720797693946487943948464565460430234701015949946028383797523175904922587146007285761546728983090382916398846699754369389649753736145515899483927770702266129175348462059516340765637779647564684320291613982662648590713371783116963810189104700867759395530046804931538373124927878733545392753386946228855151598091922994006206511099407317211288216193247259871278709263063555307299854415953536106624719661686646497239877761214901439886061028724244998863332682679007817501717774168186992342504235301402719002614585484855199016322204320578847162911914636595554829079666495307228114145754943320770621594150271404037822386521700953782811181171914314429681846128622630199903373412195691637830950302854449281107918212213611087928031130645601729037628597410293128741209233552425435420355421230878949141180699424883623050359544664719683673922465408027452597643207832583992593019023681132981990524065653808210990596006578836820976845937783991674786025358607443524891753557484919491791037215035377594844713127650096072384788231497752794318225571498409159990829926272265316820080582106464858439810132614361659792210220399802377320700289381460318155558785186738269651116636089935875749632888223464652896325855374398783627168362602191002986460342923947985071138785360863293177888790570425506961890357173665405545903562196004963599467778577619567335221061425339352240414405640917609766445977334258143723208494172264484419276380356962025506881528678344070421213609984
  count := 128

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

end FranklSmallCyclic.TransportBatches.G035.B001.Data
