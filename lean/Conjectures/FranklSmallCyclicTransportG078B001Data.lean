module

public import Conjectures.FranklSmallCyclicRowCoverage
public import Conjectures.FranklSmallCyclicCanonicalWords
public import Conjectures.FranklSmallCyclicOrbit10Block000Data

/-! 62 literal targets sharing one source proof block.
Original words and row indices are retained; weights may be transported.
-/
@[expose] public section

namespace FranklSmallCyclic.TransportBatches.G078.B001.Data

-- Period 10, original row 8329, representative 9472.
def source0 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B000.Data.entryAt ⟨24, by decide +kernel⟩

def target0 : Weights.Entry :=
  { word := [10, 10, 8, 10, 8, 0, 12], weights := [0, 1, 0, 1] }

def points0 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8335, representative 9469.
def source1 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B000.Data.entryAt ⟨21, by decide +kernel⟩

def target1 : Weights.Entry :=
  { word := [10, 10, 8, 10, 8, 8, 12], weights := [0, 1, 0, 1] }

def points1 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8344, representative 9493.
def source2 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B000.Data.entryAt ⟨45, by decide +kernel⟩

def target2 : Weights.Entry :=
  { word := [10, 10, 8, 12, 2, 0, 9], weights := [1, 1, 0, 1] }

def points2 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8345, representative 9493.
def source3 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B000.Data.entryAt ⟨45, by decide +kernel⟩

def target3 : Weights.Entry :=
  { word := [10, 10, 8, 12, 2, 0, 10], weights := [1, 1, 0, 1] }

def points3 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8346, representative 9499.
def source4 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B000.Data.entryAt ⟨51, by decide +kernel⟩

def target4 : Weights.Entry :=
  { word := [10, 10, 8, 12, 2, 0, 12], weights := [1, 1, 0, 1] }

def points4 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8350, representative 9491.
def source5 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B000.Data.entryAt ⟨43, by decide +kernel⟩

def target5 : Weights.Entry :=
  { word := [10, 10, 8, 12, 2, 8, 10], weights := [1, 1, 1, 1] }

-- Period 10, original row 8351, representative 9497.
def source6 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B000.Data.entryAt ⟨49, by decide +kernel⟩

def target6 : Weights.Entry :=
  { word := [10, 10, 8, 12, 2, 8, 12], weights := [3, 1, 2, 2] }

def points6 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8358, representative 9479.
def source7 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B000.Data.entryAt ⟨31, by decide +kernel⟩

def target7 : Weights.Entry :=
  { word := [10, 10, 8, 12, 8, 4, 10], weights := [2, 1, 2, 1] }

-- Period 10, original row 8361, representative 9462.
def source8 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B000.Data.entryAt ⟨14, by decide +kernel⟩

def target8 : Weights.Entry :=
  { word := [10, 10, 8, 12, 8, 12, 10], weights := [2, 1, 2, 1] }

-- Period 10, original row 8366, representative 9492.
def source9 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B000.Data.entryAt ⟨44, by decide +kernel⟩

def target9 : Weights.Entry :=
  { word := [10, 10, 8, 12, 10, 0, 9], weights := [1, 1, 0, 1] }

def points9 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8367, representative 9492.
def source10 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B000.Data.entryAt ⟨44, by decide +kernel⟩

def target10 : Weights.Entry :=
  { word := [10, 10, 8, 12, 10, 0, 10], weights := [1, 1, 0, 1] }

def points10 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8368, representative 9498.
def source11 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B000.Data.entryAt ⟨50, by decide +kernel⟩

def target11 : Weights.Entry :=
  { word := [10, 10, 8, 12, 10, 0, 12], weights := [1, 1, 0, 1] }

def points11 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8372, representative 9490.
def source12 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B000.Data.entryAt ⟨42, by decide +kernel⟩

def target12 : Weights.Entry :=
  { word := [10, 10, 8, 12, 10, 8, 10], weights := [1, 1, 1, 1] }

-- Period 10, original row 8373, representative 9496.
def source13 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B000.Data.entryAt ⟨48, by decide +kernel⟩

def target13 : Weights.Entry :=
  { word := [10, 10, 8, 12, 10, 8, 12], weights := [2, 1, 1, 2] }

def points13 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8382, representative 9484.
def source14 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B000.Data.entryAt ⟨36, by decide +kernel⟩

def target14 : Weights.Entry :=
  { word := [10, 10, 10, 8, 1, 0, 9], weights := [1, 1, 0, 1] }

def points14 : List (ℕ × ℕ) := [(0, 9), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8383, representative 9484.
def source15 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B000.Data.entryAt ⟨36, by decide +kernel⟩

def target15 : Weights.Entry :=
  { word := [10, 10, 10, 8, 1, 0, 10], weights := [1, 1, 0, 1] }

def points15 : List (ℕ × ℕ) := [(0, 8), (1, 7), (2, 9), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8384, representative 9484.
def source16 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B000.Data.entryAt ⟨36, by decide +kernel⟩

def target16 : Weights.Entry :=
  { word := [10, 10, 10, 8, 1, 0, 12], weights := [1, 1, 0, 1] }

def points16 : List (ℕ × ℕ) := [(0, 7), (1, 8), (2, 9), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8387, representative 9481.
def source17 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B000.Data.entryAt ⟨33, by decide +kernel⟩

def target17 : Weights.Entry :=
  { word := [10, 10, 10, 8, 1, 8, 9], weights := [1, 1, 1, 1] }

def points17 : List (ℕ × ℕ) := [(0, 9), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8396, representative 9482.
def source18 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B000.Data.entryAt ⟨34, by decide +kernel⟩

def target18 : Weights.Entry :=
  { word := [10, 10, 10, 8, 9, 0, 9], weights := [1, 1, 0, 1] }

def points18 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8397, representative 9482.
def source19 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B000.Data.entryAt ⟨34, by decide +kernel⟩

def target19 : Weights.Entry :=
  { word := [10, 10, 10, 8, 9, 0, 10], weights := [1, 1, 0, 1] }

def points19 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8398, representative 9483.
def source20 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B000.Data.entryAt ⟨35, by decide +kernel⟩

def target20 : Weights.Entry :=
  { word := [10, 10, 10, 8, 9, 0, 12], weights := [1, 1, 0, 1] }

def points20 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8401, representative 9480.
def source21 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B000.Data.entryAt ⟨32, by decide +kernel⟩

def target21 : Weights.Entry :=
  { word := [10, 10, 10, 8, 9, 8, 9], weights := [1, 1, 1, 1] }

def points21 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8412, representative 9489.
def source22 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B000.Data.entryAt ⟨41, by decide +kernel⟩

def target22 : Weights.Entry :=
  { word := [12, 0, 0, 9, 4, 12, 12], weights := [1, 0, 1, 1] }

def points22 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8), (9, 9)]

-- Period 10, original row 8416, representative 9484.
def source23 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B000.Data.entryAt ⟨36, by decide +kernel⟩

def target23 : Weights.Entry :=
  { word := [12, 0, 0, 9, 12, 12, 12], weights := [1, 0, 1, 1] }

def points23 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8), (9, 9)]

-- Period 10, original row 8426, representative 9478.
def source24 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B000.Data.entryAt ⟨30, by decide +kernel⟩

def target24 : Weights.Entry :=
  { word := [12, 0, 0, 12, 0, 12, 12], weights := [1, 0, 1, 0] }

def points24 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8), (9, 9)]

-- Period 10, original row 8472, representative 9495.
def source25 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B000.Data.entryAt ⟨47, by decide +kernel⟩

def target25 : Weights.Entry :=
  { word := [12, 0, 4, 10, 0, 12, 10], weights := [1, 0, 1, 1] }

def points25 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8), (9, 9)]

-- Period 10, original row 8473, representative 9495.
def source26 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B000.Data.entryAt ⟨47, by decide +kernel⟩

def target26 : Weights.Entry :=
  { word := [12, 0, 4, 10, 0, 12, 12], weights := [1, 0, 1, 1] }

def points26 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 8), (8, 7), (9, 9)]

-- Period 10, original row 8481, representative 9493.
def source27 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B000.Data.entryAt ⟨45, by decide +kernel⟩

def target27 : Weights.Entry :=
  { word := [12, 0, 4, 10, 8, 12, 12], weights := [1, 0, 1, 1] }

def points27 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8), (9, 9)]

-- Period 10, original row 8503, representative 9487.
def source28 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B000.Data.entryAt ⟨39, by decide +kernel⟩

def target28 : Weights.Entry :=
  { word := [12, 0, 8, 9, 4, 12, 12], weights := [1, 0, 1, 1] }

def points28 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8), (9, 9)]

-- Period 10, original row 8507, representative 9482.
def source29 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B000.Data.entryAt ⟨34, by decide +kernel⟩

def target29 : Weights.Entry :=
  { word := [12, 0, 8, 9, 12, 12, 12], weights := [1, 0, 1, 1] }

def points29 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8), (9, 9)]

-- Period 10, original row 8565, representative 9494.
def source30 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B000.Data.entryAt ⟨46, by decide +kernel⟩

def target30 : Weights.Entry :=
  { word := [12, 0, 12, 10, 0, 12, 10], weights := [1, 0, 1, 1] }

def points30 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8), (9, 9)]

-- Period 10, original row 8566, representative 9494.
def source31 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B000.Data.entryAt ⟨46, by decide +kernel⟩

def target31 : Weights.Entry :=
  { word := [12, 0, 12, 10, 0, 12, 12], weights := [1, 0, 1, 1] }

def points31 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 8), (8, 7), (9, 9)]

-- Period 10, original row 8574, representative 9492.
def source32 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B000.Data.entryAt ⟨44, by decide +kernel⟩

def target32 : Weights.Entry :=
  { word := [12, 0, 12, 10, 8, 12, 12], weights := [1, 0, 1, 1] }

def points32 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8), (9, 9)]

-- Period 10, original row 8590, representative 9455.
def source33 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B000.Data.entryAt ⟨7, by decide +kernel⟩

def target33 : Weights.Entry :=
  { word := [12, 2, 0, 9, 8, 8, 6], weights := [1, 1, 0, 1] }

def points33 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8680, representative 9479.
def source34 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B000.Data.entryAt ⟨31, by decide +kernel⟩

def target34 : Weights.Entry :=
  { word := [12, 2, 8, 10, 8, 12, 12], weights := [1, 2, 1, 2] }

def points34 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8703, representative 9509.
def source35 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B000.Data.entryAt ⟨61, by decide +kernel⟩

def target35 : Weights.Entry :=
  { word := [12, 4, 8, 8, 1, 12, 10], weights := [1, 0, 1, 1] }

def points35 : List (ℕ × ℕ) := [(0, 9), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8704, representative 9509.
def source36 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B000.Data.entryAt ⟨61, by decide +kernel⟩

def target36 : Weights.Entry :=
  { word := [12, 4, 8, 8, 1, 12, 12], weights := [1, 0, 1, 1] }

def points36 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8713, representative 9504.
def source37 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B000.Data.entryAt ⟨56, by decide +kernel⟩

def target37 : Weights.Entry :=
  { word := [12, 4, 8, 8, 9, 12, 12], weights := [1, 0, 1, 1] }

def points37 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8760, representative 9467.
def source38 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B000.Data.entryAt ⟨19, by decide +kernel⟩

def target38 : Weights.Entry :=
  { word := [12, 8, 0, 4, 8, 12, 12], weights := [1, 0, 0, 1] }

def points38 : List (ℕ × ℕ) := [(0, 0), (1, 2), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8), (9, 9)]

-- Period 10, original row 8803, representative 9470.
def source39 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B000.Data.entryAt ⟨22, by decide +kernel⟩

def target39 : Weights.Entry :=
  { word := [12, 8, 0, 12, 8, 12, 12], weights := [1, 0, 1, 0] }

def points39 : List (ℕ × ℕ) := [(0, 0), (1, 2), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8), (9, 9)]

-- Period 10, original row 8874, representative 9491.
def source40 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B000.Data.entryAt ⟨43, by decide +kernel⟩

def target40 : Weights.Entry :=
  { word := [12, 8, 4, 10, 8, 12, 12], weights := [1, 1, 1, 1] }

def points40 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8982, representative 9490.
def source41 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B000.Data.entryAt ⟨42, by decide +kernel⟩

def target41 : Weights.Entry :=
  { word := [12, 8, 12, 10, 8, 12, 12], weights := [1, 1, 1, 1] }

def points41 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8990, representative 9510.
def source42 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B000.Data.entryAt ⟨62, by decide +kernel⟩

def target42 : Weights.Entry :=
  { word := [12, 10, 0, 9, 8, 1, 12], weights := [1, 1, 0, 1] }

def points42 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8992, representative 9509.
def source43 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B000.Data.entryAt ⟨61, by decide +kernel⟩

def target43 : Weights.Entry :=
  { word := [12, 10, 0, 9, 8, 2, 10], weights := [1, 1, 0, 1] }

def points43 : List (ℕ × ℕ) := [(0, 0), (1, 2), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8), (9, 9)]

-- Period 10, original row 8994, representative 9453.
def source44 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B000.Data.entryAt ⟨5, by decide +kernel⟩

def target44 : Weights.Entry :=
  { word := [12, 10, 0, 9, 8, 8, 6], weights := [1, 1, 0, 1] }

def points44 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8995, representative 9511.
def source45 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B000.Data.entryAt ⟨63, by decide +kernel⟩

def target45 : Weights.Entry :=
  { word := [12, 10, 0, 9, 8, 8, 12], weights := [1, 1, 0, 1] }

def points45 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8997, representative 9508.
def source46 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B000.Data.entryAt ⟨60, by decide +kernel⟩

def target46 : Weights.Entry :=
  { word := [12, 10, 0, 9, 8, 9, 12], weights := [1, 1, 0, 1] }

def points46 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8999, representative 9507.
def source47 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B000.Data.entryAt ⟨59, by decide +kernel⟩

def target47 : Weights.Entry :=
  { word := [12, 10, 0, 9, 8, 10, 10], weights := [1, 1, 0, 1] }

def points47 : List (ℕ × ℕ) := [(0, 0), (1, 2), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8), (9, 9)]

-- Period 10, original row 9001, representative 9477.
def source48 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B000.Data.entryAt ⟨29, by decide +kernel⟩

def target48 : Weights.Entry :=
  { word := [12, 10, 0, 10, 8, 0, 12], weights := [0, 1, 0, 1] }

def points48 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 9003, representative 9475.
def source49 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B000.Data.entryAt ⟨27, by decide +kernel⟩

def target49 : Weights.Entry :=
  { word := [12, 10, 0, 10, 8, 8, 12], weights := [0, 1, 0, 1] }

def points49 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 9008, representative 9495.
def source50 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B000.Data.entryAt ⟨47, by decide +kernel⟩

def target50 : Weights.Entry :=
  { word := [12, 10, 0, 12, 2, 0, 9], weights := [1, 1, 0, 1] }

def points50 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 9009, representative 9495.
def source51 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B000.Data.entryAt ⟨47, by decide +kernel⟩

def target51 : Weights.Entry :=
  { word := [12, 10, 0, 12, 2, 0, 10], weights := [1, 1, 0, 1] }

def points51 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 9010, representative 9501.
def source52 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B000.Data.entryAt ⟨53, by decide +kernel⟩

def target52 : Weights.Entry :=
  { word := [12, 10, 0, 12, 2, 0, 12], weights := [1, 1, 0, 1] }

def points52 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 9016, representative 9494.
def source53 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B000.Data.entryAt ⟨46, by decide +kernel⟩

def target53 : Weights.Entry :=
  { word := [12, 10, 0, 12, 10, 0, 9], weights := [1, 1, 0, 1] }

def points53 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 9017, representative 9494.
def source54 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B000.Data.entryAt ⟨46, by decide +kernel⟩

def target54 : Weights.Entry :=
  { word := [12, 10, 0, 12, 10, 0, 10], weights := [1, 1, 0, 1] }

def points54 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 9018, representative 9500.
def source55 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B000.Data.entryAt ⟨52, by decide +kernel⟩

def target55 : Weights.Entry :=
  { word := [12, 10, 0, 12, 10, 0, 12], weights := [1, 1, 0, 1] }

def points55 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 9023, representative 9463.
def source56 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B000.Data.entryAt ⟨15, by decide +kernel⟩

def target56 : Weights.Entry :=
  { word := [12, 10, 8, 2, 8, 8, 12], weights := [0, 1, 0, 1] }

def points56 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 9041, representative 9464.
def source57 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B000.Data.entryAt ⟨16, by decide +kernel⟩

def target57 : Weights.Entry :=
  { word := [12, 10, 8, 10, 8, 8, 12], weights := [0, 1, 0, 1] }

def points57 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 9045, representative 9462.
def source58 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B000.Data.entryAt ⟨14, by decide +kernel⟩

def target58 : Weights.Entry :=
  { word := [12, 10, 8, 10, 8, 12, 12], weights := [1, 2, 1, 2] }

def points58 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 9068, representative 9507.
def source59 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B000.Data.entryAt ⟨59, by decide +kernel⟩

def target59 : Weights.Entry :=
  { word := [12, 12, 8, 8, 1, 12, 10], weights := [1, 0, 1, 1] }

def points59 : List (ℕ × ℕ) := [(0, 9), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 9069, representative 9507.
def source60 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B000.Data.entryAt ⟨59, by decide +kernel⟩

def target60 : Weights.Entry :=
  { word := [12, 12, 8, 8, 1, 12, 12], weights := [1, 0, 1, 1] }

def points60 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 9078, representative 9502.
def source61 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B000.Data.entryAt ⟨54, by decide +kernel⟩

def target61 : Weights.Entry :=
  { word := [12, 12, 8, 8, 9, 12, 12], weights := [1, 0, 1, 1] }

def points61 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

def period10Entries : List Weights.Entry := [target0, target1, target2, target3, target4, target5, target6, target7, target8, target9, target10, target11, target12, target13, target14, target15, target16, target17, target18, target19, target20, target21, target22, target23, target24, target25, target26, target27, target28, target29, target30, target31, target32, target33, target34, target35, target36, target37, target38, target39, target40, target41, target42, target43, target44, target45, target46, target47, target48, target49, target50, target51, target52, target53, target54, target55, target56, target57, target58, target59, target60, target61]

def period10Chunk : RowCoverage.Chunk where
  rows := [⟨8329, target0⟩, ⟨8335, target1⟩, ⟨8344, target2⟩, ⟨8345, target3⟩, ⟨8346, target4⟩, ⟨8350, target5⟩, ⟨8351, target6⟩, ⟨8358, target7⟩, ⟨8361, target8⟩, ⟨8366, target9⟩, ⟨8367, target10⟩, ⟨8368, target11⟩, ⟨8372, target12⟩, ⟨8373, target13⟩, ⟨8382, target14⟩, ⟨8383, target15⟩, ⟨8384, target16⟩, ⟨8387, target17⟩, ⟨8396, target18⟩, ⟨8397, target19⟩, ⟨8398, target20⟩, ⟨8401, target21⟩, ⟨8412, target22⟩, ⟨8416, target23⟩, ⟨8426, target24⟩, ⟨8472, target25⟩, ⟨8473, target26⟩, ⟨8481, target27⟩, ⟨8503, target28⟩, ⟨8507, target29⟩, ⟨8565, target30⟩, ⟨8566, target31⟩, ⟨8574, target32⟩, ⟨8590, target33⟩, ⟨8680, target34⟩, ⟨8703, target35⟩, ⟨8704, target36⟩, ⟨8713, target37⟩, ⟨8760, target38⟩, ⟨8803, target39⟩, ⟨8874, target40⟩, ⟨8982, target41⟩, ⟨8990, target42⟩, ⟨8992, target43⟩, ⟨8994, target44⟩, ⟨8995, target45⟩, ⟨8997, target46⟩, ⟨8999, target47⟩, ⟨9001, target48⟩, ⟨9003, target49⟩, ⟨9008, target50⟩, ⟨9009, target51⟩, ⟨9010, target52⟩, ⟨9016, target53⟩, ⟨9017, target54⟩, ⟨9018, target55⟩, ⟨9023, target56⟩, ⟨9041, target57⟩, ⟨9045, target58⟩, ⟨9068, target59⟩, ⟨9069, target60⟩, ⟨9078, target61⟩]
  indexMask := 564379362477577882659810909104644776660110636603834363641201811470680773924513680793649199626468345913480929234828859080625373574523100579256463228033525910989068336328072356056779086664436480899072896658166872427809112639294236125286289247752911550267563479288848670757120761885365238020667270982651200568296386929804364037173287997640080907092737619069086306072236346905264891015634988431181925493809871269179083533897838041972397660999823937827578491198642816438384291335976054226770458259302526117355025041652244941174472784822166002372423670241411789353316178036389960050200127272022756634813217262325216220749273797089451721926232767608160145495934887524219186267650558028306244354930602399460492990682732965700644858216186426237200021131348421361466912355946101987638620153735214639291287568434080971645660520071105060523632022482289183311103967068730943066233111968322464275192540011848744800800857326405293116477712328247451775264686018267900837106367785157464932141085165039309250811118588878575241178806941518651780399701346919303393267437077551841377304150427631908090817041013772744477525525950621136470555112286595528175260632263994418761849475813610415923873906750652781822563423814355677940188265825185776823458242383067800286998040499225260572006172464637869718972811299105555613807227908762376866802924192273817680540415467396090565410623742749104517121967755084822566858610690995319576400313929305663501671116090590535786425484233652128534867770842858260198557587121985293099636152627987300566769501279484215819102803607171453381752524499597873486150174442325084765862640251997899750392570499292861336850986533361675067479921200122897419034848244407632392583008465917695523250585135764421453309614028823240995222553742303186316692879193674925373854593266397449755851794979123008265217949476291297466927718694236550115827600327990199841699481421845371344455900549190697798090975572154440902227990136927110230050206557134469601242418862412861855454375256612365132146023565624549686938944609125478035972097850202098758934557138294893859048832234458341053683030272361524574328686839468271555414100912144199042096407613740685688776436534499437493389212873906993318426956686102920439329146259153782264958377545086666024376599020503871398452516611443958094867524903488859732405671435768673640930087146520075581929573179256450474518047865956310179391902701775100880126538069096977632838457700824357027818243503594372928263964833303921661259179728686058937947030936456369356339796703326700736596933701410263555652161157854260374556074229710409687537386741280346707029469590109335359132056737355609813983067358127434946224363298087363084704270187158356526817537648963339905981221825748585037125208900045518533586848564903936
  count := 62

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

end FranklSmallCyclic.TransportBatches.G078.B001.Data
