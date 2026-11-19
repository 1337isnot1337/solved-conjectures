module

public import Conjectures.FranklSmallCyclicRowCoverage
public import Conjectures.FranklSmallCyclicCanonicalWords
public import Conjectures.FranklSmallCyclicOrbit10Block016Data

/-! 42 literal targets sharing one source proof block.
Original words and row indices are retained; weights may be transported.
-/
@[expose] public section

namespace FranklSmallCyclic.TransportBatches.G094.B001.Data

-- Period 10, original row 6189, representative 10520.
def source0 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B016.Data.entryAt ⟨48, by decide +kernel⟩

def target0 : Weights.Entry :=
  { word := [8, 10, 2, 10, 8, 4, 8], weights := [0, 1, 1, 0] }

def points0 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 6194, representative 10528.
def source1 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B016.Data.entryAt ⟨56, by decide +kernel⟩

def target1 : Weights.Entry :=
  { word := [8, 10, 2, 10, 8, 8, 2], weights := [1, 0, 0, 1] }

def points1 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 6195, representative 10530.
def source2 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B016.Data.entryAt ⟨58, by decide +kernel⟩

def target2 : Weights.Entry :=
  { word := [8, 10, 2, 10, 8, 8, 4], weights := [1, 0, 0, 1] }

def points2 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 6207, representative 10519.
def source3 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B016.Data.entryAt ⟨47, by decide +kernel⟩

def target3 : Weights.Entry :=
  { word := [8, 10, 2, 10, 8, 12, 8], weights := [0, 1, 1, 0] }

-- Period 10, original row 6216, representative 10533.
def source4 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B016.Data.entryAt ⟨61, by decide +kernel⟩

def target4 : Weights.Entry :=
  { word := [8, 10, 8, 2, 0, 8, 2], weights := [0, 1, 0, 1] }

def points4 : List (ℕ × ℕ) := [(0, 9), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 6217, representative 10533.
def source5 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B016.Data.entryAt ⟨61, by decide +kernel⟩

def target5 : Weights.Entry :=
  { word := [8, 10, 8, 2, 0, 8, 4], weights := [0, 1, 0, 1] }

def points5 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 6229, representative 10513.
def source6 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B016.Data.entryAt ⟨41, by decide +kernel⟩

def target6 : Weights.Entry :=
  { word := [8, 10, 8, 2, 8, 6, 8], weights := [0, 3, 0, 1] }

def points6 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 6230, representative 10534.
def source7 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B016.Data.entryAt ⟨62, by decide +kernel⟩

def target7 : Weights.Entry :=
  { word := [8, 10, 8, 2, 8, 8, 4], weights := [0, 1, 0, 1] }

def points7 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 6244, representative 10511.
def source8 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B016.Data.entryAt ⟨39, by decide +kernel⟩

def target8 : Weights.Entry :=
  { word := [8, 10, 8, 8, 4, 6, 8], weights := [0, 1, 1, 0] }

def points8 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 6248, representative 10509.
def source9 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B016.Data.entryAt ⟨37, by decide +kernel⟩

def target9 : Weights.Entry :=
  { word := [8, 10, 8, 8, 12, 6, 8], weights := [0, 1, 1, 0] }

def points9 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 6273, representative 10514.
def source10 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B016.Data.entryAt ⟨42, by decide +kernel⟩

def target10 : Weights.Entry :=
  { word := [8, 10, 8, 10, 8, 6, 8], weights := [0, 1, 1, 0] }

def points10 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 6274, representative 10535.
def source11 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B016.Data.entryAt ⟨63, by decide +kernel⟩

def target11 : Weights.Entry :=
  { word := [8, 10, 8, 10, 8, 8, 4], weights := [0, 1, 0, 0] }

def points11 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 6283, representative 10519.
def source12 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B016.Data.entryAt ⟨47, by decide +kernel⟩

def target12 : Weights.Entry :=
  { word := [8, 10, 8, 12, 4, 12, 8], weights := [0, 1, 1, 0] }

def points12 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 6287, representative 10517.
def source13 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B016.Data.entryAt ⟨45, by decide +kernel⟩

def target13 : Weights.Entry :=
  { word := [8, 10, 8, 12, 12, 12, 8], weights := [0, 1, 1, 0] }

-- Period 10, original row 6294, representative 10523.
def source14 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B016.Data.entryAt ⟨51, by decide +kernel⟩

def target14 : Weights.Entry :=
  { word := [8, 10, 10, 2, 8, 8, 2], weights := [1, 0, 0, 1] }

def points14 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 6295, representative 10525.
def source15 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B016.Data.entryAt ⟨53, by decide +kernel⟩

def target15 : Weights.Entry :=
  { word := [8, 10, 10, 2, 8, 8, 4], weights := [1, 0, 0, 1] }

def points15 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 6311, representative 10518.
def source16 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B016.Data.entryAt ⟨46, by decide +kernel⟩

def target16 : Weights.Entry :=
  { word := [8, 10, 10, 10, 8, 4, 8], weights := [0, 1, 1, 0] }

def points16 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 6316, representative 10524.
def source17 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B016.Data.entryAt ⟨52, by decide +kernel⟩

def target17 : Weights.Entry :=
  { word := [8, 10, 10, 10, 8, 8, 2], weights := [1, 0, 0, 1] }

def points17 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 6317, representative 10526.
def source18 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B016.Data.entryAt ⟨54, by decide +kernel⟩

def target18 : Weights.Entry :=
  { word := [8, 10, 10, 10, 8, 8, 4], weights := [1, 0, 0, 1] }

def points18 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 6329, representative 10517.
def source19 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B016.Data.entryAt ⟨45, by decide +kernel⟩

def target19 : Weights.Entry :=
  { word := [8, 10, 10, 10, 8, 12, 8], weights := [0, 1, 1, 0] }

def points19 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 6346, representative 10475.
def source20 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B016.Data.entryAt ⟨3, by decide +kernel⟩

def target20 : Weights.Entry :=
  { word := [8, 12, 0, 4, 8, 4, 2], weights := [1, 0, 1, 0] }

def points20 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 5), (4, 6), (5, 4), (6, 3), (7, 1), (8, 2), (9, 0)]

-- Period 10, original row 6347, representative 10485.
def source21 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B016.Data.entryAt ⟨13, by decide +kernel⟩

def target21 : Weights.Entry :=
  { word := [8, 12, 0, 4, 8, 4, 4], weights := [1, 0, 0, 1] }

def points21 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2), (9, 0)]

-- Period 10, original row 6382, representative 10478.
def source22 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B016.Data.entryAt ⟨6, by decide +kernel⟩

def target22 : Weights.Entry :=
  { word := [8, 12, 0, 12, 8, 4, 2], weights := [1, 0, 1, 0] }

def points22 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 5), (4, 6), (5, 4), (6, 3), (7, 1), (8, 2), (9, 0)]

-- Period 10, original row 6383, representative 10488.
def source23 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B016.Data.entryAt ⟨16, by decide +kernel⟩

def target23 : Weights.Entry :=
  { word := [8, 12, 0, 12, 8, 4, 4], weights := [1, 0, 0, 1] }

def points23 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2), (9, 0)]

-- Period 10, original row 6503, representative 10476.
def source24 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B016.Data.entryAt ⟨4, by decide +kernel⟩

def target24 : Weights.Entry :=
  { word := [8, 12, 8, 4, 8, 4, 2], weights := [1, 0, 0, 1] }

def points24 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 6504, representative 10486.
def source25 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B016.Data.entryAt ⟨14, by decide +kernel⟩

def target25 : Weights.Entry :=
  { word := [8, 12, 8, 4, 8, 4, 4], weights := [1, 0, 0, 1] }

def points25 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 6545, representative 10477.
def source26 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B016.Data.entryAt ⟨5, by decide +kernel⟩

def target26 : Weights.Entry :=
  { word := [8, 12, 8, 12, 8, 4, 2], weights := [1, 0, 0, 1] }

def points26 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 6546, representative 10487.
def source27 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B016.Data.entryAt ⟨15, by decide +kernel⟩

def target27 : Weights.Entry :=
  { word := [8, 12, 8, 12, 8, 4, 4], weights := [1, 0, 0, 1] }

def points27 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 6639, representative 10474.
def source28 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B016.Data.entryAt ⟨2, by decide +kernel⟩

def target28 : Weights.Entry :=
  { word := [9, 0, 1, 4, 8, 4, 2], weights := [1, 0, 1, 0] }

def points28 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 5), (4, 6), (5, 4), (6, 3), (7, 2), (8, 0), (9, 1)]

-- Period 10, original row 6640, representative 10484.
def source29 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B016.Data.entryAt ⟨12, by decide +kernel⟩

def target29 : Weights.Entry :=
  { word := [9, 0, 1, 4, 8, 4, 4], weights := [1, 0, 0, 1] }

def points29 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 0), (9, 1)]

-- Period 10, original row 6675, representative 10481.
def source30 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B016.Data.entryAt ⟨9, by decide +kernel⟩

def target30 : Weights.Entry :=
  { word := [9, 0, 1, 12, 8, 4, 2], weights := [1, 0, 1, 0] }

def points30 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 5), (4, 6), (5, 4), (6, 3), (7, 2), (8, 0), (9, 1)]

-- Period 10, original row 6676, representative 10491.
def source31 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B016.Data.entryAt ⟨19, by decide +kernel⟩

def target31 : Weights.Entry :=
  { word := [9, 0, 1, 12, 8, 4, 4], weights := [1, 0, 0, 1] }

def points31 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 0), (9, 1)]

-- Period 10, original row 6807, representative 10507.
def source32 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B016.Data.entryAt ⟨35, by decide +kernel⟩

def target32 : Weights.Entry :=
  { word := [9, 0, 4, 10, 8, 4, 4], weights := [0, 1, 1, 1] }

def points32 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 0), (9, 1)]

-- Period 10, original row 6836, representative 10502.
def source33 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B016.Data.entryAt ⟨30, by decide +kernel⟩

def target33 : Weights.Entry :=
  { word := [9, 0, 8, 9, 4, 4, 4], weights := [1, 0, 1, 1] }

def points33 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 0), (9, 1)]

-- Period 10, original row 6840, representative 10498.
def source34 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B016.Data.entryAt ⟨26, by decide +kernel⟩

def target34 : Weights.Entry :=
  { word := [9, 0, 8, 9, 12, 4, 4], weights := [1, 0, 1, 1] }

def points34 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 0), (9, 1)]

-- Period 10, original row 6933, representative 10508.
def source35 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B016.Data.entryAt ⟨36, by decide +kernel⟩

def target35 : Weights.Entry :=
  { word := [9, 0, 12, 10, 0, 4, 2], weights := [1, 0, 1, 1] }

def points35 : List (ℕ × ℕ) := [(0, 9), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 0), (9, 1)]

-- Period 10, original row 6934, representative 10508.
def source36 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B016.Data.entryAt ⟨36, by decide +kernel⟩

def target36 : Weights.Entry :=
  { word := [9, 0, 12, 10, 0, 4, 4], weights := [1, 0, 1, 1] }

def points36 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 0), (9, 1)]

-- Period 10, original row 6953, representative 10506.
def source37 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B016.Data.entryAt ⟨34, by decide +kernel⟩

def target37 : Weights.Entry :=
  { word := [9, 0, 12, 10, 8, 4, 4], weights := [0, 1, 1, 1] }

def points37 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 0), (9, 1)]

-- Period 10, original row 7075, representative 10475.
def source38 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B016.Data.entryAt ⟨3, by decide +kernel⟩

def target38 : Weights.Entry :=
  { word := [9, 8, 1, 4, 8, 4, 2], weights := [1, 0, 1, 0] }

def points38 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 5), (4, 6), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 7076, representative 10485.
def source39 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B016.Data.entryAt ⟨13, by decide +kernel⟩

def target39 : Weights.Entry :=
  { word := [9, 8, 1, 4, 8, 4, 4], weights := [1, 0, 0, 1] }

def points39 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 7111, representative 10478.
def source40 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B016.Data.entryAt ⟨6, by decide +kernel⟩

def target40 : Weights.Entry :=
  { word := [9, 8, 1, 12, 8, 4, 2], weights := [1, 0, 1, 0] }

def points40 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 5), (4, 6), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 7112, representative 10488.
def source41 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B016.Data.entryAt ⟨16, by decide +kernel⟩

def target41 : Weights.Entry :=
  { word := [9, 8, 1, 12, 8, 4, 4], weights := [1, 0, 0, 1] }

def points41 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

def period10Entries : List Weights.Entry := [target0, target1, target2, target3, target4, target5, target6, target7, target8, target9, target10, target11, target12, target13, target14, target15, target16, target17, target18, target19, target20, target21, target22, target23, target24, target25, target26, target27, target28, target29, target30, target31, target32, target33, target34, target35, target36, target37, target38, target39, target40, target41]

def period10Chunk : RowCoverage.Chunk where
  rows := [⟨6189, target0⟩, ⟨6194, target1⟩, ⟨6195, target2⟩, ⟨6207, target3⟩, ⟨6216, target4⟩, ⟨6217, target5⟩, ⟨6229, target6⟩, ⟨6230, target7⟩, ⟨6244, target8⟩, ⟨6248, target9⟩, ⟨6273, target10⟩, ⟨6274, target11⟩, ⟨6283, target12⟩, ⟨6287, target13⟩, ⟨6294, target14⟩, ⟨6295, target15⟩, ⟨6311, target16⟩, ⟨6316, target17⟩, ⟨6317, target18⟩, ⟨6329, target19⟩, ⟨6346, target20⟩, ⟨6347, target21⟩, ⟨6382, target22⟩, ⟨6383, target23⟩, ⟨6503, target24⟩, ⟨6504, target25⟩, ⟨6545, target26⟩, ⟨6546, target27⟩, ⟨6639, target28⟩, ⟨6640, target29⟩, ⟨6675, target30⟩, ⟨6676, target31⟩, ⟨6807, target32⟩, ⟨6836, target33⟩, ⟨6840, target34⟩, ⟨6933, target35⟩, ⟨6934, target36⟩, ⟨6953, target37⟩, ⟨7075, target38⟩, ⟨7076, target39⟩, ⟨7111, target40⟩, ⟨7112, target41⟩]
  indexMask := 126304964550652581958193928874473023729646312254030002216225504757625797532440970776379825950065948684857304043540264783232289026378212274371274357010514834888056923450664889032564183183497239298135759981823812306955973754310675577347675270076113497334637650585247432675855267873698320866412452747505678561674743005914579752734388727064683463078043334823114141548804239495068518888574044218491626562795462519208041586125439192918625880570897357764865517938057331746220669679383322751018993916689490366281017022944798826901335283725179608507491309219696081479617733903154674167601045649469010012286226729156872691308969629228253450959470568598527496064216399696463870912092128050403294885407888466608899093730844339050166563088267489598316933464040099569454546308423916112801992235463666240023271461098352464783742099953577855798742981708625298889225982257088633358792860671734284095366777984197019735773008023306879152353943176708338286840020589956616595316978924862590723146089852949507897089867788796745967650880195185087054975718738255425611936355391463004426981118650342521092311522793785136463201184328201205305736064346036921862412781354135383157792451720973278781282913137967481420991453122824764022152033888231181886218741176961579959892471349053652218764762371049267750721143829131268737181461409014740862692399187403686307948912904145684297196526164432518330841216193347495454000590075808500834680466331383570350457231451460322434663042045357215365020399131298303352556311563107216775754561483161698783016973379604464382597829879699920919436202938790165734206499675340401471686507025197249377623618683110342222612946789616176226101782526036332154268589624599392815293604912765450973152532034292818989935831591848540113760384472167590045845850454932058721340029659955353191922642901715346743632142037254817007953238685838277834366841749293288535487375840394638292095571479531020267678257225497633546271463254847634891754114773297695212425856550457454218152920396706309185766070891502000051140752431353452900935637971393452182992467423703996623985170797827432821005090526355778377194464538430057683143379160372101766587972014558937088
  count := 42

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

end FranklSmallCyclic.TransportBatches.G094.B001.Data
