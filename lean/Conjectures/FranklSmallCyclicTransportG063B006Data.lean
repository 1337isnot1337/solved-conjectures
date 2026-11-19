module

public import Conjectures.FranklSmallCyclicRowCoverage
public import Conjectures.FranklSmallCyclicCanonicalWords
public import Conjectures.FranklSmallCyclicOrbit9Block010Data

/-! 110 literal targets sharing one source proof block.
Original words and row indices are retained; weights may be transported.
-/
@[expose] public section

namespace FranklSmallCyclic.TransportBatches.G063.B006.Data

-- Period 10, original row 4575, representative 8097.
def source0 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨66, by decide +kernel⟩

def target0 : Weights.Entry :=
  { word := [8, 1, 8, 2, 2, 2, 0], weights := [0, 1, 0, 1] }

def points0 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 10, original row 4577, representative 8090.
def source1 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨59, by decide +kernel⟩

def target1 : Weights.Entry :=
  { word := [8, 1, 8, 2, 2, 10, 0], weights := [0, 1, 0, 1] }

def points1 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 10, original row 4579, representative 8098.
def source2 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨67, by decide +kernel⟩

def target2 : Weights.Entry :=
  { word := [8, 1, 8, 2, 10, 2, 0], weights := [0, 1, 0, 1] }

def points2 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 10, original row 4581, representative 8091.
def source3 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨60, by decide +kernel⟩

def target3 : Weights.Entry :=
  { word := [8, 1, 8, 2, 10, 10, 0], weights := [0, 1, 0, 1] }

def points3 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 10, original row 4608, representative 8069.
def source4 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨38, by decide +kernel⟩

def target4 : Weights.Entry :=
  { word := [8, 1, 12, 2, 0, 8, 0], weights := [0, 1, 0, 0] }

def points4 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 10, original row 4616, representative 8063.
def source5 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨32, by decide +kernel⟩

def target5 : Weights.Entry :=
  { word := [8, 1, 12, 2, 0, 9, 0], weights := [0, 1, 0, 0] }

def points5 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 10, original row 4618, representative 8063.
def source6 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨32, by decide +kernel⟩

def target6 : Weights.Entry :=
  { word := [8, 1, 12, 2, 0, 10, 0], weights := [0, 1, 0, 0] }

def points6 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 10, original row 4620, representative 8068.
def source7 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨37, by decide +kernel⟩

def target7 : Weights.Entry :=
  { word := [8, 1, 12, 2, 8, 2, 0], weights := [0, 1, 0, 0] }

def points7 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 10, original row 4624, representative 8064.
def source8 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨33, by decide +kernel⟩

def target8 : Weights.Entry :=
  { word := [8, 1, 12, 2, 8, 10, 0], weights := [0, 1, 0, 0] }

def points8 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 10, original row 4628, representative 8066.
def source9 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨35, by decide +kernel⟩

def target9 : Weights.Entry :=
  { word := [8, 1, 12, 4, 4, 8, 0], weights := [0, 0, 1, 0] }

def points9 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 10, original row 4630, representative 8065.
def source10 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨34, by decide +kernel⟩

def target10 : Weights.Entry :=
  { word := [8, 1, 12, 8, 4, 2, 0], weights := [0, 1, 1, 0] }

def points10 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 4), (5, 5), (6, 3), (7, 2), (8, 1)]

-- Period 10, original row 4632, representative 8062.
def source11 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨31, by decide +kernel⟩

def target11 : Weights.Entry :=
  { word := [8, 1, 12, 8, 4, 10, 0], weights := [0, 1, 1, 0] }

def points11 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 10, original row 4664, representative 8067.
def source12 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨36, by decide +kernel⟩

def target12 : Weights.Entry :=
  { word := [8, 1, 12, 12, 4, 8, 0], weights := [0, 0, 1, 0] }

def points12 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 10, original row 7397, representative 8101.
def source13 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨70, by decide +kernel⟩

def target13 : Weights.Entry :=
  { word := [10, 0, 0, 1, 4, 2, 0], weights := [1, 1, 0, 0] }

def points13 : List (ℕ × ℕ) := [(0, 2), (1, 7), (2, 8), (3, 6), (4, 4), (5, 5), (6, 3), (7, 0), (8, 1)]

-- Period 10, original row 7398, representative 8094.
def source14 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨63, by decide +kernel⟩

def target14 : Weights.Entry :=
  { word := [10, 0, 0, 1, 4, 10, 0], weights := [1, 0, 1, 0] }

def points14 : List (ℕ × ℕ) := [(0, 2), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 0), (8, 1)]

-- Period 10, original row 7399, representative 8101.
def source15 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨70, by decide +kernel⟩

def target15 : Weights.Entry :=
  { word := [10, 0, 0, 2, 2, 2, 0], weights := [1, 1, 0, 0] }

def points15 : List (ℕ × ℕ) := [(0, 2), (1, 7), (2, 8), (3, 5), (4, 4), (5, 6), (6, 3), (7, 0), (8, 1)]

-- Period 10, original row 7401, representative 8094.
def source16 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨63, by decide +kernel⟩

def target16 : Weights.Entry :=
  { word := [10, 0, 0, 2, 2, 10, 0], weights := [1, 0, 0, 1] }

def points16 : List (ℕ × ℕ) := [(0, 2), (1, 8), (2, 7), (3, 5), (4, 6), (5, 4), (6, 3), (7, 0), (8, 1)]

-- Period 10, original row 7425, representative 8089.
def source17 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨58, by decide +kernel⟩

def target17 : Weights.Entry :=
  { word := [10, 0, 4, 2, 0, 8, 0], weights := [1, 0, 0, 1] }

def points17 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 10, original row 7433, representative 8084.
def source18 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨53, by decide +kernel⟩

def target18 : Weights.Entry :=
  { word := [10, 0, 4, 2, 0, 9, 0], weights := [1, 0, 0, 1] }

def points18 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 10, original row 7435, representative 8084.
def source19 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨53, by decide +kernel⟩

def target19 : Weights.Entry :=
  { word := [10, 0, 4, 2, 0, 10, 0], weights := [1, 0, 0, 1] }

def points19 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 10, original row 7437, representative 8088.
def source20 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨57, by decide +kernel⟩

def target20 : Weights.Entry :=
  { word := [10, 0, 4, 2, 8, 2, 0], weights := [1, 0, 0, 1] }

def points20 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 10, original row 7441, representative 8085.
def source21 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨54, by decide +kernel⟩

def target21 : Weights.Entry :=
  { word := [10, 0, 4, 2, 8, 10, 0], weights := [1, 0, 0, 1] }

def points21 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 10, original row 7445, representative 8086.
def source22 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨55, by decide +kernel⟩

def target22 : Weights.Entry :=
  { word := [10, 0, 4, 4, 4, 8, 0], weights := [1, 0, 0, 1] }

def points22 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 10, original row 7472, representative 8087.
def source23 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨56, by decide +kernel⟩

def target23 : Weights.Entry :=
  { word := [10, 0, 4, 12, 4, 8, 0], weights := [0, 0, 1, 1] }

def points23 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 10, original row 7474, representative 8103.
def source24 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨72, by decide +kernel⟩

def target24 : Weights.Entry :=
  { word := [10, 0, 8, 1, 4, 2, 0], weights := [1, 1, 0, 0] }

def points24 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 4), (5, 5), (6, 3), (7, 2), (8, 1)]

-- Period 10, original row 7475, representative 8096.
def source25 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨65, by decide +kernel⟩

def target25 : Weights.Entry :=
  { word := [10, 0, 8, 1, 4, 10, 0], weights := [1, 0, 1, 0] }

def points25 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 10, original row 7476, representative 8099.
def source26 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨68, by decide +kernel⟩

def target26 : Weights.Entry :=
  { word := [10, 0, 8, 2, 2, 2, 0], weights := [1, 0, 0, 1] }

def points26 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 10, original row 7478, representative 8092.
def source27 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨61, by decide +kernel⟩

def target27 : Weights.Entry :=
  { word := [10, 0, 8, 2, 2, 10, 0], weights := [1, 0, 0, 1] }

def points27 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 10, original row 7480, representative 8100.
def source28 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨69, by decide +kernel⟩

def target28 : Weights.Entry :=
  { word := [10, 0, 8, 2, 10, 2, 0], weights := [1, 0, 0, 1] }

def points28 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 10, original row 7482, representative 8093.
def source29 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨62, by decide +kernel⟩

def target29 : Weights.Entry :=
  { word := [10, 0, 8, 2, 10, 10, 0], weights := [1, 0, 0, 1] }

def points29 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 10, original row 7542, representative 8083.
def source30 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨52, by decide +kernel⟩

def target30 : Weights.Entry :=
  { word := [10, 0, 12, 2, 0, 8, 0], weights := [1, 0, 0, 1] }

def points30 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 10, original row 7550, representative 8078.
def source31 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨47, by decide +kernel⟩

def target31 : Weights.Entry :=
  { word := [10, 0, 12, 2, 0, 9, 0], weights := [1, 0, 0, 1] }

def points31 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 10, original row 7552, representative 8078.
def source32 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨47, by decide +kernel⟩

def target32 : Weights.Entry :=
  { word := [10, 0, 12, 2, 0, 10, 0], weights := [1, 0, 0, 1] }

def points32 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 10, original row 7554, representative 8082.
def source33 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨51, by decide +kernel⟩

def target33 : Weights.Entry :=
  { word := [10, 0, 12, 2, 8, 2, 0], weights := [1, 0, 0, 1] }

def points33 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 10, original row 7558, representative 8079.
def source34 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨48, by decide +kernel⟩

def target34 : Weights.Entry :=
  { word := [10, 0, 12, 2, 8, 10, 0], weights := [1, 0, 0, 1] }

def points34 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 10, original row 7562, representative 8080.
def source35 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨49, by decide +kernel⟩

def target35 : Weights.Entry :=
  { word := [10, 0, 12, 4, 4, 8, 0], weights := [1, 0, 0, 1] }

def points35 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 10, original row 7594, representative 8081.
def source36 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨50, by decide +kernel⟩

def target36 : Weights.Entry :=
  { word := [10, 0, 12, 12, 4, 8, 0], weights := [0, 0, 1, 1] }

def points36 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 10, original row 7807, representative 8058.
def source37 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨27, by decide +kernel⟩

def target37 : Weights.Entry :=
  { word := [10, 8, 0, 1, 4, 2, 0], weights := [1, 0, 1, 0] }

def points37 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2)]

-- Period 10, original row 7808, representative 8059.
def source38 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨28, by decide +kernel⟩

def target38 : Weights.Entry :=
  { word := [10, 8, 0, 1, 4, 10, 0], weights := [1, 0, 1, 0] }

def points38 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2)]

-- Period 10, original row 7809, representative 8061.
def source39 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨30, by decide +kernel⟩

def target39 : Weights.Entry :=
  { word := [10, 8, 0, 1, 12, 2, 0], weights := [1, 0, 1, 0] }

def points39 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2)]

-- Period 10, original row 7810, representative 8060.
def source40 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨29, by decide +kernel⟩

def target40 : Weights.Entry :=
  { word := [10, 8, 0, 1, 12, 10, 0], weights := [1, 0, 1, 0] }

def points40 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2)]

-- Period 10, original row 7811, representative 8058.
def source41 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨27, by decide +kernel⟩

def target41 : Weights.Entry :=
  { word := [10, 8, 0, 2, 2, 2, 0], weights := [1, 0, 0, 1] }

def points41 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 5), (4, 6), (5, 4), (6, 3), (7, 1), (8, 2)]

-- Period 10, original row 7813, representative 8059.
def source42 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨28, by decide +kernel⟩

def target42 : Weights.Entry :=
  { word := [10, 8, 0, 2, 2, 10, 0], weights := [1, 0, 0, 1] }

def points42 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 5), (4, 6), (5, 4), (6, 3), (7, 1), (8, 2)]

-- Period 10, original row 7815, representative 8061.
def source43 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨30, by decide +kernel⟩

def target43 : Weights.Entry :=
  { word := [10, 8, 0, 2, 10, 2, 0], weights := [1, 0, 0, 1] }

def points43 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 5), (4, 6), (5, 4), (6, 3), (7, 1), (8, 2)]

-- Period 10, original row 7817, representative 8060.
def source44 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨29, by decide +kernel⟩

def target44 : Weights.Entry :=
  { word := [10, 8, 0, 2, 10, 10, 0], weights := [1, 0, 0, 1] }

def points44 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 5), (4, 6), (5, 4), (6, 3), (7, 1), (8, 2)]

-- Period 10, original row 7835, representative 8048.
def source45 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨17, by decide +kernel⟩

def target45 : Weights.Entry :=
  { word := [10, 8, 0, 4, 6, 8, 0], weights := [1, 0, 1, 0] }

def points45 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 5), (4, 6), (5, 4), (6, 3), (7, 1), (8, 2)]

-- Period 10, original row 7886, representative 8049.
def source46 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨18, by decide +kernel⟩

def target46 : Weights.Entry :=
  { word := [10, 8, 0, 12, 6, 8, 0], weights := [1, 0, 1, 0] }

def points46 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 5), (4, 6), (5, 4), (6, 3), (7, 1), (8, 2)]

-- Period 10, original row 7920, representative 8033.
def source47 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨2, by decide +kernel⟩

def target47 : Weights.Entry :=
  { word := [10, 8, 4, 2, 0, 8, 0], weights := [1, 0, 0, 1] }

def points47 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 10, original row 7932, representative 8032.
def source48 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨1, by decide +kernel⟩

def target48 : Weights.Entry :=
  { word := [10, 8, 4, 2, 8, 2, 0], weights := [1, 0, 0, 1] }

def points48 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 10, original row 7936, representative 8031.
def source49 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨0, by decide +kernel⟩

def target49 : Weights.Entry :=
  { word := [10, 8, 4, 2, 8, 10, 0], weights := [1, 0, 0, 1] }

def points49 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 10, original row 7971, representative 8054.
def source50 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨23, by decide +kernel⟩

def target50 : Weights.Entry :=
  { word := [10, 8, 8, 1, 4, 2, 0], weights := [1, 0, 1, 0] }

def points50 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 10, original row 7972, representative 8055.
def source51 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨24, by decide +kernel⟩

def target51 : Weights.Entry :=
  { word := [10, 8, 8, 1, 4, 10, 0], weights := [1, 0, 1, 0] }

def points51 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 10, original row 7973, representative 8057.
def source52 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨26, by decide +kernel⟩

def target52 : Weights.Entry :=
  { word := [10, 8, 8, 1, 12, 2, 0], weights := [1, 0, 1, 0] }

def points52 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 10, original row 7974, representative 8056.
def source53 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨25, by decide +kernel⟩

def target53 : Weights.Entry :=
  { word := [10, 8, 8, 1, 12, 10, 0], weights := [1, 0, 1, 0] }

def points53 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 10, original row 7975, representative 8044.
def source54 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨13, by decide +kernel⟩

def target54 : Weights.Entry :=
  { word := [10, 8, 8, 2, 2, 2, 0], weights := [1, 0, 0, 1] }

def points54 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 10, original row 7977, representative 8045.
def source55 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨14, by decide +kernel⟩

def target55 : Weights.Entry :=
  { word := [10, 8, 8, 2, 2, 10, 0], weights := [1, 0, 0, 1] }

def points55 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 10, original row 7979, representative 8047.
def source56 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨16, by decide +kernel⟩

def target56 : Weights.Entry :=
  { word := [10, 8, 8, 2, 10, 2, 0], weights := [1, 0, 0, 1] }

def points56 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 10, original row 7981, representative 8046.
def source57 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨15, by decide +kernel⟩

def target57 : Weights.Entry :=
  { word := [10, 8, 8, 2, 10, 10, 0], weights := [1, 0, 0, 1] }

def points57 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 10, original row 8001, representative 8042.
def source58 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨11, by decide +kernel⟩

def target58 : Weights.Entry :=
  { word := [10, 8, 8, 4, 6, 8, 0], weights := [1, 0, 0, 1] }

def points58 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 10, original row 8074, representative 8043.
def source59 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨12, by decide +kernel⟩

def target59 : Weights.Entry :=
  { word := [10, 8, 8, 12, 6, 8, 0], weights := [0, 0, 1, 0] }

def points59 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 10, original row 8403, representative 8101.
def source60 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨70, by decide +kernel⟩

def target60 : Weights.Entry :=
  { word := [12, 0, 0, 1, 4, 2, 0], weights := [1, 1, 0, 0] }

def points60 : List (ℕ × ℕ) := [(0, 1), (1, 7), (2, 8), (3, 6), (4, 4), (5, 5), (6, 3), (7, 0), (8, 2)]

-- Period 10, original row 8404, representative 8094.
def source61 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨63, by decide +kernel⟩

def target61 : Weights.Entry :=
  { word := [12, 0, 0, 1, 4, 10, 0], weights := [1, 0, 1, 0] }

def points61 : List (ℕ × ℕ) := [(0, 1), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 0), (8, 2)]

-- Period 10, original row 8405, representative 8101.
def source62 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨70, by decide +kernel⟩

def target62 : Weights.Entry :=
  { word := [12, 0, 0, 2, 2, 2, 0], weights := [1, 1, 0, 0] }

def points62 : List (ℕ × ℕ) := [(0, 1), (1, 7), (2, 8), (3, 5), (4, 4), (5, 6), (6, 3), (7, 0), (8, 2)]

-- Period 10, original row 8407, representative 8094.
def source63 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨63, by decide +kernel⟩

def target63 : Weights.Entry :=
  { word := [12, 0, 0, 2, 2, 10, 0], weights := [1, 0, 0, 1] }

def points63 : List (ℕ × ℕ) := [(0, 1), (1, 8), (2, 7), (3, 5), (4, 6), (5, 4), (6, 3), (7, 0), (8, 2)]

-- Period 10, original row 8431, representative 8077.
def source64 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨46, by decide +kernel⟩

def target64 : Weights.Entry :=
  { word := [12, 0, 4, 2, 0, 8, 0], weights := [0, 1, 0, 0] }

def points64 : List (ℕ × ℕ) := [(0, 1), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 0)]

-- Period 10, original row 8439, representative 8071.
def source65 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨40, by decide +kernel⟩

def target65 : Weights.Entry :=
  { word := [12, 0, 4, 2, 0, 9, 0], weights := [0, 1, 0, 0] }

def points65 : List (ℕ × ℕ) := [(0, 1), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 0)]

-- Period 10, original row 8441, representative 8071.
def source66 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨40, by decide +kernel⟩

def target66 : Weights.Entry :=
  { word := [12, 0, 4, 2, 0, 10, 0], weights := [0, 1, 0, 0] }

def points66 : List (ℕ × ℕ) := [(0, 1), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 0)]

-- Period 10, original row 8443, representative 8076.
def source67 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨45, by decide +kernel⟩

def target67 : Weights.Entry :=
  { word := [12, 0, 4, 2, 8, 2, 0], weights := [0, 1, 0, 0] }

def points67 : List (ℕ × ℕ) := [(0, 1), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 0)]

-- Period 10, original row 8447, representative 8072.
def source68 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨41, by decide +kernel⟩

def target68 : Weights.Entry :=
  { word := [12, 0, 4, 2, 8, 10, 0], weights := [0, 1, 0, 0] }

def points68 : List (ℕ × ℕ) := [(0, 1), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 0)]

-- Period 10, original row 8451, representative 8074.
def source69 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨43, by decide +kernel⟩

def target69 : Weights.Entry :=
  { word := [12, 0, 4, 4, 4, 8, 0], weights := [0, 0, 1, 0] }

def points69 : List (ℕ × ℕ) := [(0, 1), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 0)]

-- Period 10, original row 8453, representative 8073.
def source70 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨42, by decide +kernel⟩

def target70 : Weights.Entry :=
  { word := [12, 0, 4, 8, 4, 2, 0], weights := [0, 1, 1, 0] }

def points70 : List (ℕ × ℕ) := [(0, 1), (1, 7), (2, 8), (3, 6), (4, 4), (5, 5), (6, 3), (7, 2), (8, 0)]

-- Period 10, original row 8455, representative 8070.
def source71 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨39, by decide +kernel⟩

def target71 : Weights.Entry :=
  { word := [12, 0, 4, 8, 4, 10, 0], weights := [0, 1, 1, 0] }

def points71 : List (ℕ × ℕ) := [(0, 1), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 0)]

-- Period 10, original row 8483, representative 8075.
def source72 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨44, by decide +kernel⟩

def target72 : Weights.Entry :=
  { word := [12, 0, 4, 12, 4, 8, 0], weights := [0, 0, 1, 0] }

def points72 : List (ℕ × ℕ) := [(0, 1), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 0)]

-- Period 10, original row 8485, representative 8102.
def source73 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨71, by decide +kernel⟩

def target73 : Weights.Entry :=
  { word := [12, 0, 8, 1, 4, 2, 0], weights := [1, 1, 0, 0] }

def points73 : List (ℕ × ℕ) := [(0, 1), (1, 7), (2, 8), (3, 6), (4, 4), (5, 5), (6, 3), (7, 2), (8, 0)]

-- Period 10, original row 8486, representative 8095.
def source74 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨64, by decide +kernel⟩

def target74 : Weights.Entry :=
  { word := [12, 0, 8, 1, 4, 10, 0], weights := [1, 0, 1, 0] }

def points74 : List (ℕ × ℕ) := [(0, 1), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 0)]

-- Period 10, original row 8487, representative 8097.
def source75 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨66, by decide +kernel⟩

def target75 : Weights.Entry :=
  { word := [12, 0, 8, 2, 2, 2, 0], weights := [0, 1, 0, 1] }

def points75 : List (ℕ × ℕ) := [(0, 1), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 0)]

-- Period 10, original row 8489, representative 8090.
def source76 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨59, by decide +kernel⟩

def target76 : Weights.Entry :=
  { word := [12, 0, 8, 2, 2, 10, 0], weights := [0, 1, 0, 1] }

def points76 : List (ℕ × ℕ) := [(0, 1), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 0)]

-- Period 10, original row 8491, representative 8098.
def source77 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨67, by decide +kernel⟩

def target77 : Weights.Entry :=
  { word := [12, 0, 8, 2, 10, 2, 0], weights := [0, 1, 0, 1] }

def points77 : List (ℕ × ℕ) := [(0, 1), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 0)]

-- Period 10, original row 8493, representative 8091.
def source78 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨60, by decide +kernel⟩

def target78 : Weights.Entry :=
  { word := [12, 0, 8, 2, 10, 10, 0], weights := [0, 1, 0, 1] }

def points78 : List (ℕ × ℕ) := [(0, 1), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 0)]

-- Period 10, original row 8520, representative 8069.
def source79 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨38, by decide +kernel⟩

def target79 : Weights.Entry :=
  { word := [12, 0, 12, 2, 0, 8, 0], weights := [0, 1, 0, 0] }

def points79 : List (ℕ × ℕ) := [(0, 1), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 0)]

-- Period 10, original row 8528, representative 8063.
def source80 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨32, by decide +kernel⟩

def target80 : Weights.Entry :=
  { word := [12, 0, 12, 2, 0, 9, 0], weights := [0, 1, 0, 0] }

def points80 : List (ℕ × ℕ) := [(0, 1), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 0)]

-- Period 10, original row 8530, representative 8063.
def source81 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨32, by decide +kernel⟩

def target81 : Weights.Entry :=
  { word := [12, 0, 12, 2, 0, 10, 0], weights := [0, 1, 0, 0] }

def points81 : List (ℕ × ℕ) := [(0, 1), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 0)]

-- Period 10, original row 8532, representative 8068.
def source82 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨37, by decide +kernel⟩

def target82 : Weights.Entry :=
  { word := [12, 0, 12, 2, 8, 2, 0], weights := [0, 1, 0, 0] }

def points82 : List (ℕ × ℕ) := [(0, 1), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 0)]

-- Period 10, original row 8536, representative 8064.
def source83 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨33, by decide +kernel⟩

def target83 : Weights.Entry :=
  { word := [12, 0, 12, 2, 8, 10, 0], weights := [0, 1, 0, 0] }

def points83 : List (ℕ × ℕ) := [(0, 1), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 0)]

-- Period 10, original row 8540, representative 8066.
def source84 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨35, by decide +kernel⟩

def target84 : Weights.Entry :=
  { word := [12, 0, 12, 4, 4, 8, 0], weights := [0, 0, 1, 0] }

def points84 : List (ℕ × ℕ) := [(0, 1), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 0)]

-- Period 10, original row 8542, representative 8065.
def source85 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨34, by decide +kernel⟩

def target85 : Weights.Entry :=
  { word := [12, 0, 12, 8, 4, 2, 0], weights := [0, 1, 1, 0] }

def points85 : List (ℕ × ℕ) := [(0, 1), (1, 7), (2, 8), (3, 6), (4, 4), (5, 5), (6, 3), (7, 2), (8, 0)]

-- Period 10, original row 8544, representative 8062.
def source86 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨31, by decide +kernel⟩

def target86 : Weights.Entry :=
  { word := [12, 0, 12, 8, 4, 10, 0], weights := [0, 1, 1, 0] }

def points86 : List (ℕ × ℕ) := [(0, 1), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 0)]

-- Period 10, original row 8576, representative 8067.
def source87 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨36, by decide +kernel⟩

def target87 : Weights.Entry :=
  { word := [12, 0, 12, 12, 4, 8, 0], weights := [0, 0, 1, 0] }

def points87 : List (ℕ × ℕ) := [(0, 1), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 0)]

-- Period 10, original row 8723, representative 8058.
def source88 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨27, by decide +kernel⟩

def target88 : Weights.Entry :=
  { word := [12, 8, 0, 1, 4, 2, 0], weights := [1, 0, 1, 0] }

def points88 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 10, original row 8724, representative 8059.
def source89 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨28, by decide +kernel⟩

def target89 : Weights.Entry :=
  { word := [12, 8, 0, 1, 4, 10, 0], weights := [1, 0, 1, 0] }

def points89 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 10, original row 8725, representative 8061.
def source90 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨30, by decide +kernel⟩

def target90 : Weights.Entry :=
  { word := [12, 8, 0, 1, 12, 2, 0], weights := [1, 0, 1, 0] }

def points90 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 10, original row 8726, representative 8060.
def source91 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨29, by decide +kernel⟩

def target91 : Weights.Entry :=
  { word := [12, 8, 0, 1, 12, 10, 0], weights := [1, 0, 1, 0] }

def points91 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 10, original row 8727, representative 8058.
def source92 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨27, by decide +kernel⟩

def target92 : Weights.Entry :=
  { word := [12, 8, 0, 2, 2, 2, 0], weights := [1, 0, 0, 1] }

def points92 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 5), (4, 6), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 10, original row 8729, representative 8059.
def source93 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨28, by decide +kernel⟩

def target93 : Weights.Entry :=
  { word := [12, 8, 0, 2, 2, 10, 0], weights := [1, 0, 0, 1] }

def points93 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 5), (4, 6), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 10, original row 8731, representative 8061.
def source94 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨30, by decide +kernel⟩

def target94 : Weights.Entry :=
  { word := [12, 8, 0, 2, 10, 2, 0], weights := [1, 0, 0, 1] }

def points94 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 5), (4, 6), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 10, original row 8733, representative 8060.
def source95 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨29, by decide +kernel⟩

def target95 : Weights.Entry :=
  { word := [12, 8, 0, 2, 10, 10, 0], weights := [1, 0, 0, 1] }

def points95 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 5), (4, 6), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 10, original row 8751, representative 8048.
def source96 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨17, by decide +kernel⟩

def target96 : Weights.Entry :=
  { word := [12, 8, 0, 4, 6, 8, 0], weights := [1, 0, 1, 0] }

def points96 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 5), (4, 6), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 10, original row 8794, representative 8049.
def source97 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨18, by decide +kernel⟩

def target97 : Weights.Entry :=
  { word := [12, 8, 0, 12, 6, 8, 0], weights := [1, 0, 1, 0] }

def points97 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 5), (4, 6), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 10, original row 8881, representative 8050.
def source98 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨19, by decide +kernel⟩

def target98 : Weights.Entry :=
  { word := [12, 8, 8, 1, 4, 2, 0], weights := [1, 0, 1, 0] }

def points98 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 10, original row 8882, representative 8051.
def source99 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨20, by decide +kernel⟩

def target99 : Weights.Entry :=
  { word := [12, 8, 8, 1, 4, 10, 0], weights := [1, 0, 1, 0] }

def points99 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 10, original row 8883, representative 8053.
def source100 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨22, by decide +kernel⟩

def target100 : Weights.Entry :=
  { word := [12, 8, 8, 1, 12, 2, 0], weights := [1, 0, 1, 0] }

def points100 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 10, original row 8884, representative 8052.
def source101 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨21, by decide +kernel⟩

def target101 : Weights.Entry :=
  { word := [12, 8, 8, 1, 12, 10, 0], weights := [1, 0, 1, 0] }

def points101 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 10, original row 8885, representative 8038.
def source102 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨7, by decide +kernel⟩

def target102 : Weights.Entry :=
  { word := [12, 8, 8, 2, 2, 2, 0], weights := [0, 1, 0, 1] }

def points102 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 10, original row 8887, representative 8039.
def source103 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨8, by decide +kernel⟩

def target103 : Weights.Entry :=
  { word := [12, 8, 8, 2, 2, 10, 0], weights := [0, 1, 0, 1] }

def points103 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 10, original row 8889, representative 8041.
def source104 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨10, by decide +kernel⟩

def target104 : Weights.Entry :=
  { word := [12, 8, 8, 2, 10, 2, 0], weights := [0, 1, 0, 1] }

def points104 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 10, original row 8891, representative 8040.
def source105 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨9, by decide +kernel⟩

def target105 : Weights.Entry :=
  { word := [12, 8, 8, 2, 10, 10, 0], weights := [0, 1, 0, 1] }

def points105 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 10, original row 8899, representative 8036.
def source106 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨5, by decide +kernel⟩

def target106 : Weights.Entry :=
  { word := [12, 8, 8, 4, 6, 8, 0], weights := [0, 0, 1, 0] }

def points106 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 10, original row 8906, representative 8035.
def source107 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨4, by decide +kernel⟩

def target107 : Weights.Entry :=
  { word := [12, 8, 8, 8, 6, 2, 0], weights := [0, 1, 1, 0] }

def points107 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 10, original row 8908, representative 8034.
def source108 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨3, by decide +kernel⟩

def target108 : Weights.Entry :=
  { word := [12, 8, 8, 8, 6, 10, 0], weights := [0, 1, 1, 0] }

def points108 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 10, original row 8920, representative 8037.
def source109 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨6, by decide +kernel⟩

def target109 : Weights.Entry :=
  { word := [12, 8, 8, 12, 6, 8, 0], weights := [0, 0, 1, 0] }

def points109 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

def period10Entries : List Weights.Entry := [target0, target1, target2, target3, target4, target5, target6, target7, target8, target9, target10, target11, target12, target13, target14, target15, target16, target17, target18, target19, target20, target21, target22, target23, target24, target25, target26, target27, target28, target29, target30, target31, target32, target33, target34, target35, target36, target37, target38, target39, target40, target41, target42, target43, target44, target45, target46, target47, target48, target49, target50, target51, target52, target53, target54, target55, target56, target57, target58, target59, target60, target61, target62, target63, target64, target65, target66, target67, target68, target69, target70, target71, target72, target73, target74, target75, target76, target77, target78, target79, target80, target81, target82, target83, target84, target85, target86, target87, target88, target89, target90, target91, target92, target93, target94, target95, target96, target97, target98, target99, target100, target101, target102, target103, target104, target105, target106, target107, target108, target109]

def period10Chunk : RowCoverage.Chunk where
  rows := [⟨4575, target0⟩, ⟨4577, target1⟩, ⟨4579, target2⟩, ⟨4581, target3⟩, ⟨4608, target4⟩, ⟨4616, target5⟩, ⟨4618, target6⟩, ⟨4620, target7⟩, ⟨4624, target8⟩, ⟨4628, target9⟩, ⟨4630, target10⟩, ⟨4632, target11⟩, ⟨4664, target12⟩, ⟨7397, target13⟩, ⟨7398, target14⟩, ⟨7399, target15⟩, ⟨7401, target16⟩, ⟨7425, target17⟩, ⟨7433, target18⟩, ⟨7435, target19⟩, ⟨7437, target20⟩, ⟨7441, target21⟩, ⟨7445, target22⟩, ⟨7472, target23⟩, ⟨7474, target24⟩, ⟨7475, target25⟩, ⟨7476, target26⟩, ⟨7478, target27⟩, ⟨7480, target28⟩, ⟨7482, target29⟩, ⟨7542, target30⟩, ⟨7550, target31⟩, ⟨7552, target32⟩, ⟨7554, target33⟩, ⟨7558, target34⟩, ⟨7562, target35⟩, ⟨7594, target36⟩, ⟨7807, target37⟩, ⟨7808, target38⟩, ⟨7809, target39⟩, ⟨7810, target40⟩, ⟨7811, target41⟩, ⟨7813, target42⟩, ⟨7815, target43⟩, ⟨7817, target44⟩, ⟨7835, target45⟩, ⟨7886, target46⟩, ⟨7920, target47⟩, ⟨7932, target48⟩, ⟨7936, target49⟩, ⟨7971, target50⟩, ⟨7972, target51⟩, ⟨7973, target52⟩, ⟨7974, target53⟩, ⟨7975, target54⟩, ⟨7977, target55⟩, ⟨7979, target56⟩, ⟨7981, target57⟩, ⟨8001, target58⟩, ⟨8074, target59⟩, ⟨8403, target60⟩, ⟨8404, target61⟩, ⟨8405, target62⟩, ⟨8407, target63⟩, ⟨8431, target64⟩, ⟨8439, target65⟩, ⟨8441, target66⟩, ⟨8443, target67⟩, ⟨8447, target68⟩, ⟨8451, target69⟩, ⟨8453, target70⟩, ⟨8455, target71⟩, ⟨8483, target72⟩, ⟨8485, target73⟩, ⟨8486, target74⟩, ⟨8487, target75⟩, ⟨8489, target76⟩, ⟨8491, target77⟩, ⟨8493, target78⟩, ⟨8520, target79⟩, ⟨8528, target80⟩, ⟨8530, target81⟩, ⟨8532, target82⟩, ⟨8536, target83⟩, ⟨8540, target84⟩, ⟨8542, target85⟩, ⟨8544, target86⟩, ⟨8576, target87⟩, ⟨8723, target88⟩, ⟨8724, target89⟩, ⟨8725, target90⟩, ⟨8726, target91⟩, ⟨8727, target92⟩, ⟨8729, target93⟩, ⟨8731, target94⟩, ⟨8733, target95⟩, ⟨8751, target96⟩, ⟨8794, target97⟩, ⟨8881, target98⟩, ⟨8882, target99⟩, ⟨8883, target100⟩, ⟨8884, target101⟩, ⟨8885, target102⟩, ⟨8887, target103⟩, ⟨8889, target104⟩, ⟨8891, target105⟩, ⟨8899, target106⟩, ⟨8906, target107⟩, ⟨8908, target108⟩, ⟨8920, target109⟩]
  indexMask := 1540614733104444869230761801953219603736225636258676519602050102071973067095362599474579574709390168265241788688970297005780604779015478676234146600758837061441447525669044423549628239885841974963243425308670386671115103940485571223425882542712153363453297761118329645972111994253654352335365775655938070101294371759573971190060083820927488906846986760387403837706926192392099113487572994617519641118338082007306629945513684042487074342031290015906968174089278462255346459829600350030285140121109386669154077209062822876720311316626155493942923056150458462276932111722168670732035367670664245464120397907393850429347525220950750624940659069244899788079771555663650908903609459104928826542844129675198590380310669660107240065316110222026470401096937524011804908273790293315739922003356296198589972156956078998457501197400271689019315052066826591023418613319604491934613744754022538797918254934617057981360884943548299636281017158978525955094932953958313871638793632012409125486157231136747167652264527774766651219713152534368607059546252892576832178775661795252942230105040961823331542637422809686832160357065662987223893053888477417864926322236016433122526417278978697450737931725757539895731666856225774935470574587119580994198719962908184056490327523530288783341081603298764258261449912060995310501589147197641211245364631177773582799439740692346510743224934261795741307501404108140874374682990517360223833950908615841920796705465201613063989525087126546973820298267867188984054222676093455178316381937315025041996054580641018874648326016460383154344262496563167161105265759813782833356515874247210274892941568559054825590451246034642975471445721841151364490128911500686994524885493699625360901250652008841964099471111420313529814880670606176804228498538249862103091856858368198943524804245092784269563560039343722239095408254022106434595936726943558798155957177179136993074886794142925638394838637379470460163717171645412214785614628714039426016036501719973646805617032720269657872317953333741701002588520675219875196455049802433058023705664439956718329471700448709297691556052345654106688108971607797096747018739405270949759949833262554669277366699285688778975644685013659566162647312768379156050567944686365458188455694251958626694287487747997486290852252845509445664650944112683559809553582213545518660730932156273418608456505323000872698378301443966447365392678091568663279242061219024255418199194570407304328903090042915081846890354479778577353917906346951517496437569895777891086023591861193451427415447565482716695246140706278925424973909367556800847828664759629806239729005193031123799017168605760334962105490993860770503448486088515938394277192724215624078763815334695665664
  count := 110

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

end FranklSmallCyclic.TransportBatches.G063.B006.Data
