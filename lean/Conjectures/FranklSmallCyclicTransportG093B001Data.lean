module

public import Conjectures.FranklSmallCyclicRowCoverage
public import Conjectures.FranklSmallCyclicCanonicalWords
public import Conjectures.FranklSmallCyclicOrbit10Block015Data

/-! 38 literal targets sharing one source proof block.
Original words and row indices are retained; weights may be transported.
-/
@[expose] public section

namespace FranklSmallCyclic.TransportBatches.G093.B001.Data

-- Period 10, original row 4486, representative 10409.
def source0 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B015.Data.entryAt ⟨1, by decide +kernel⟩

def target0 : Weights.Entry :=
  { word := [8, 0, 12, 10, 8, 12, 4], weights := [0, 1, 1, 1] }

def points0 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 0), (9, 1)]

-- Period 10, original row 4672, representative 10452.
def source1 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B015.Data.entryAt ⟨44, by decide +kernel⟩

def target1 : Weights.Entry :=
  { word := [8, 2, 0, 1, 8, 4, 4], weights := [0, 3, 1, 0] }

def points1 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2), (9, 0)]

-- Period 10, original row 4688, representative 10424.
def source2 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B015.Data.entryAt ⟨16, by decide +kernel⟩

def target2 : Weights.Entry :=
  { word := [8, 2, 0, 8, 1, 4, 2], weights := [0, 2, 1, 1] }

def points2 : List (ℕ × ℕ) := [(0, 8), (1, 7), (2, 9), (3, 5), (4, 6), (5, 4), (6, 3), (7, 1), (8, 2), (9, 0)]

-- Period 10, original row 4689, representative 10424.
def source3 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B015.Data.entryAt ⟨16, by decide +kernel⟩

def target3 : Weights.Entry :=
  { word := [8, 2, 0, 8, 1, 4, 4], weights := [0, 2, 1, 1] }

def points3 : List (ℕ × ℕ) := [(0, 7), (1, 8), (2, 9), (3, 5), (4, 6), (5, 4), (6, 3), (7, 1), (8, 2), (9, 0)]

-- Period 10, original row 4696, representative 10422.
def source4 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B015.Data.entryAt ⟨14, by decide +kernel⟩

def target4 : Weights.Entry :=
  { word := [8, 2, 0, 8, 9, 4, 4], weights := [0, 2, 1, 1] }

def points4 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2), (9, 0)]

-- Period 10, original row 4709, representative 10453.
def source5 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B015.Data.entryAt ⟨45, by decide +kernel⟩

def target5 : Weights.Entry :=
  { word := [8, 2, 0, 9, 8, 4, 4], weights := [0, 3, 1, 0] }

def points5 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2), (9, 0)]

-- Period 10, original row 4737, representative 10455.
def source6 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B015.Data.entryAt ⟨47, by decide +kernel⟩

def target6 : Weights.Entry :=
  { word := [8, 2, 0, 10, 8, 4, 4], weights := [0, 2, 0, 1] }

def points6 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2), (9, 0)]

-- Period 10, original row 4824, representative 10441.
def source7 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B015.Data.entryAt ⟨33, by decide +kernel⟩

def target7 : Weights.Entry :=
  { word := [8, 2, 2, 10, 8, 4, 2], weights := [1, 1, 1, 1] }

def points7 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 4825, representative 10446.
def source8 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B015.Data.entryAt ⟨38, by decide +kernel⟩

def target8 : Weights.Entry :=
  { word := [8, 2, 2, 10, 8, 4, 4], weights := [1, 1, 1, 1] }

def points8 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 4907, representative 10454.
def source9 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B015.Data.entryAt ⟨46, by decide +kernel⟩

def target9 : Weights.Entry :=
  { word := [8, 2, 8, 10, 8, 4, 4], weights := [0, 2, 0, 1] }

def points9 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 4979, representative 10440.
def source10 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B015.Data.entryAt ⟨32, by decide +kernel⟩

def target10 : Weights.Entry :=
  { word := [8, 2, 10, 10, 8, 4, 2], weights := [1, 1, 1, 1] }

def points10 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 4980, representative 10445.
def source11 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B015.Data.entryAt ⟨37, by decide +kernel⟩

def target11 : Weights.Entry :=
  { word := [8, 2, 10, 10, 8, 4, 4], weights := [1, 1, 1, 1] }

def points11 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 5302, representative 10442.
def source12 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B015.Data.entryAt ⟨34, by decide +kernel⟩

def target12 : Weights.Entry :=
  { word := [8, 6, 8, 12, 8, 4, 2], weights := [1, 1, 1, 1] }

def points12 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 5303, representative 10447.
def source13 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B015.Data.entryAt ⟨39, by decide +kernel⟩

def target13 : Weights.Entry :=
  { word := [8, 6, 8, 12, 8, 4, 4], weights := [1, 1, 1, 1] }

def points13 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 5387, representative 10418.
def source14 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B015.Data.entryAt ⟨10, by decide +kernel⟩

def target14 : Weights.Entry :=
  { word := [8, 8, 0, 9, 4, 12, 4], weights := [1, 1, 1, 1] }

def points14 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2), (9, 0)]

-- Period 10, original row 5391, representative 10414.
def source15 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B015.Data.entryAt ⟨6, by decide +kernel⟩

def target15 : Weights.Entry :=
  { word := [8, 8, 0, 9, 12, 12, 4], weights := [1, 1, 1, 1] }

def points15 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2), (9, 0)]

-- Period 10, original row 5633, representative 10408.
def source16 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B015.Data.entryAt ⟨0, by decide +kernel⟩

def target16 : Weights.Entry :=
  { word := [8, 8, 4, 10, 8, 12, 4], weights := [1, 1, 1, 1] }

def points16 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 5715, representative 10417.
def source17 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B015.Data.entryAt ⟨9, by decide +kernel⟩

def target17 : Weights.Entry :=
  { word := [8, 8, 8, 9, 4, 12, 4], weights := [1, 1, 1, 1] }

def points17 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 5719, representative 10413.
def source18 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B015.Data.entryAt ⟨5, by decide +kernel⟩

def target18 : Weights.Entry :=
  { word := [8, 8, 8, 9, 12, 12, 4], weights := [1, 1, 1, 1] }

def points18 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 6066, representative 10448.
def source19 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B015.Data.entryAt ⟨40, by decide +kernel⟩

def target19 : Weights.Entry :=
  { word := [8, 10, 0, 1, 8, 4, 4], weights := [0, 3, 1, 0] }

def points19 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2), (9, 0)]

-- Period 10, original row 6082, representative 10423.
def source20 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B015.Data.entryAt ⟨15, by decide +kernel⟩

def target20 : Weights.Entry :=
  { word := [8, 10, 0, 8, 1, 4, 2], weights := [0, 2, 1, 1] }

def points20 : List (ℕ × ℕ) := [(0, 8), (1, 7), (2, 9), (3, 5), (4, 6), (5, 4), (6, 3), (7, 1), (8, 2), (9, 0)]

-- Period 10, original row 6083, representative 10423.
def source21 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B015.Data.entryAt ⟨15, by decide +kernel⟩

def target21 : Weights.Entry :=
  { word := [8, 10, 0, 8, 1, 4, 4], weights := [0, 2, 1, 1] }

def points21 : List (ℕ × ℕ) := [(0, 7), (1, 8), (2, 9), (3, 5), (4, 6), (5, 4), (6, 3), (7, 1), (8, 2), (9, 0)]

-- Period 10, original row 6090, representative 10421.
def source22 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B015.Data.entryAt ⟨13, by decide +kernel⟩

def target22 : Weights.Entry :=
  { word := [8, 10, 0, 8, 9, 4, 4], weights := [0, 2, 1, 1] }

def points22 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2), (9, 0)]

-- Period 10, original row 6103, representative 10449.
def source23 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B015.Data.entryAt ⟨41, by decide +kernel⟩

def target23 : Weights.Entry :=
  { word := [8, 10, 0, 9, 8, 4, 4], weights := [0, 3, 1, 0] }

def points23 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2), (9, 0)]

-- Period 10, original row 6131, representative 10451.
def source24 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B015.Data.entryAt ⟨43, by decide +kernel⟩

def target24 : Weights.Entry :=
  { word := [8, 10, 0, 10, 8, 4, 4], weights := [0, 2, 0, 1] }

def points24 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2), (9, 0)]

-- Period 10, original row 6187, representative 10439.
def source25 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B015.Data.entryAt ⟨31, by decide +kernel⟩

def target25 : Weights.Entry :=
  { word := [8, 10, 2, 10, 8, 4, 2], weights := [1, 1, 1, 1] }

def points25 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 6188, representative 10444.
def source26 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B015.Data.entryAt ⟨36, by decide +kernel⟩

def target26 : Weights.Entry :=
  { word := [8, 10, 2, 10, 8, 4, 4], weights := [1, 1, 1, 1] }

def points26 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 6270, representative 10450.
def source27 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B015.Data.entryAt ⟨42, by decide +kernel⟩

def target27 : Weights.Entry :=
  { word := [8, 10, 8, 10, 8, 4, 4], weights := [0, 2, 0, 1] }

def points27 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 6309, representative 10438.
def source28 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B015.Data.entryAt ⟨30, by decide +kernel⟩

def target28 : Weights.Entry :=
  { word := [8, 10, 10, 10, 8, 4, 2], weights := [1, 1, 1, 1] }

def points28 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 6310, representative 10443.
def source29 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B015.Data.entryAt ⟨35, by decide +kernel⟩

def target29 : Weights.Entry :=
  { word := [8, 10, 10, 10, 8, 4, 4], weights := [1, 1, 1, 1] }

def points29 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 6801, representative 10412.
def source30 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B015.Data.entryAt ⟨4, by decide +kernel⟩

def target30 : Weights.Entry :=
  { word := [9, 0, 4, 10, 0, 12, 2], weights := [0, 1, 1, 1] }

def points30 : List (ℕ × ℕ) := [(0, 9), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 0), (9, 1)]

-- Period 10, original row 6802, representative 10412.
def source31 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B015.Data.entryAt ⟨4, by decide +kernel⟩

def target31 : Weights.Entry :=
  { word := [9, 0, 4, 10, 0, 12, 4], weights := [0, 1, 1, 1] }

def points31 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 0), (9, 1)]

-- Period 10, original row 6812, representative 10410.
def source32 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B015.Data.entryAt ⟨2, by decide +kernel⟩

def target32 : Weights.Entry :=
  { word := [9, 0, 4, 10, 8, 12, 4], weights := [0, 1, 1, 1] }

def points32 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 0), (9, 1)]

-- Period 10, original row 6838, representative 10419.
def source33 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B015.Data.entryAt ⟨11, by decide +kernel⟩

def target33 : Weights.Entry :=
  { word := [9, 0, 8, 9, 4, 12, 4], weights := [1, 0, 1, 1] }

def points33 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 0), (9, 1)]

-- Period 10, original row 6842, representative 10415.
def source34 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B015.Data.entryAt ⟨7, by decide +kernel⟩

def target34 : Weights.Entry :=
  { word := [9, 0, 8, 9, 12, 12, 4], weights := [1, 0, 1, 1] }

def points34 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 0), (9, 1)]

-- Period 10, original row 6947, representative 10411.
def source35 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B015.Data.entryAt ⟨3, by decide +kernel⟩

def target35 : Weights.Entry :=
  { word := [9, 0, 12, 10, 0, 12, 2], weights := [0, 1, 1, 1] }

def points35 : List (ℕ × ℕ) := [(0, 9), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 0), (9, 1)]

-- Period 10, original row 6948, representative 10411.
def source36 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B015.Data.entryAt ⟨3, by decide +kernel⟩

def target36 : Weights.Entry :=
  { word := [9, 0, 12, 10, 0, 12, 4], weights := [0, 1, 1, 1] }

def points36 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 0), (9, 1)]

-- Period 10, original row 6958, representative 10409.
def source37 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B015.Data.entryAt ⟨1, by decide +kernel⟩

def target37 : Weights.Entry :=
  { word := [9, 0, 12, 10, 8, 12, 4], weights := [0, 1, 1, 1] }

def points37 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 0), (9, 1)]

def period10Entries : List Weights.Entry := [target0, target1, target2, target3, target4, target5, target6, target7, target8, target9, target10, target11, target12, target13, target14, target15, target16, target17, target18, target19, target20, target21, target22, target23, target24, target25, target26, target27, target28, target29, target30, target31, target32, target33, target34, target35, target36, target37]

def period10Chunk : RowCoverage.Chunk where
  rows := [⟨4486, target0⟩, ⟨4672, target1⟩, ⟨4688, target2⟩, ⟨4689, target3⟩, ⟨4696, target4⟩, ⟨4709, target5⟩, ⟨4737, target6⟩, ⟨4824, target7⟩, ⟨4825, target8⟩, ⟨4907, target9⟩, ⟨4979, target10⟩, ⟨4980, target11⟩, ⟨5302, target12⟩, ⟨5303, target13⟩, ⟨5387, target14⟩, ⟨5391, target15⟩, ⟨5633, target16⟩, ⟨5715, target17⟩, ⟨5719, target18⟩, ⟨6066, target19⟩, ⟨6082, target20⟩, ⟨6083, target21⟩, ⟨6090, target22⟩, ⟨6103, target23⟩, ⟨6131, target24⟩, ⟨6187, target25⟩, ⟨6188, target26⟩, ⟨6270, target27⟩, ⟨6309, target28⟩, ⟨6310, target29⟩, ⟨6801, target30⟩, ⟨6802, target31⟩, ⟨6812, target32⟩, ⟨6838, target33⟩, ⟨6842, target34⟩, ⟨6947, target35⟩, ⟨6948, target36⟩, ⟨6958, target37⟩]
  indexMask := 3692712853124087542292664044025931007990129694397429930776553452513832980774238270652197605796309591160667192672987768844075528518215306175118201657773687357259129370763548444549414829592579566787471497094275006960214953952339869736897221706481360867237470318474369370101741413575858641822726966715149164236798083657361570006907938840875471605748051136059760518801306025304635203770028397754897471381631846008757685318296803229467327104208699302253710471208018306475350370028805274901501123703466608489595174789814580231196910741390259019723064890455350283715240514479472003763934178568317937436275562005712417497753219521308437205213769965336806538527989995290883335148742349041210291762729163080295517841919477222983850275573573761185772240993453756311987826511439649431549288075257591698958108920028324140624321360795205038752881300517463499107549256728896907023525021950948751775216811510393218313250488401216938638114644342303204467729684979867077774204301206155669277074523962047681716748551375408849721389422616764136584216033305075774326974384581165212946996748270613442892130837344853323581503453283622542266101185792198604778739809688201972488882837805129165323213637100640010548186273247595387459983698944624775400041200162892350196690232252126200541959889796140719748114930161300897545582478674688157054937022493925471009952489045485611379705010688500362454990473375631596269523320002132132002278980863623244609253310701799278786844388051224560446170676154827108331762013882952331987494578513659191907011135755866846573546874500591852182050609119449038795502722750753466727761439114120324032197127365936072383471355549978881856191241558593238988867399299755276268722509718548478530672943538322512545934927778511158632818907504061084648967770196654835928732869463461027110135004782311032866304543803724817108515748294115291569782999767472715221182513231362037907038828518290290819191563146506332516519707223719995112252039235891534920897169049677130801037234893066957563110322542294217074150666019078881468229259038258522672031235064105506554546039538878452590992389927915477115338752
  count := 38

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

end FranklSmallCyclic.TransportBatches.G093.B001.Data
