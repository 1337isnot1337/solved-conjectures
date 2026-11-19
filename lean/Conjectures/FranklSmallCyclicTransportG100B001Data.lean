module

public import Conjectures.FranklSmallCyclicRowCoverage
public import Conjectures.FranklSmallCyclicCanonicalWords
public import Conjectures.FranklSmallCyclicOrbit10Block022Data

/-! 79 literal targets sharing one source proof block.
Original words and row indices are retained; weights may be transported.
-/
@[expose] public section

namespace FranklSmallCyclic.TransportBatches.G100.B001.Data

-- Period 10, original row 6420, representative 10897.
def source0 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B022.Data.entryAt ⟨41, by decide +kernel⟩

def target0 : Weights.Entry :=
  { word := [8, 12, 2, 8, 10, 0, 8], weights := [0, 1, 1, 0] }

def points0 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 6424, representative 10891.
def source1 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B022.Data.entryAt ⟨35, by decide +kernel⟩

def target1 : Weights.Entry :=
  { word := [8, 12, 2, 8, 10, 8, 8], weights := [0, 1, 1, 0] }

def points1 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 6429, representative 10915.
def source2 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B022.Data.entryAt ⟨59, by decide +kernel⟩

def target2 : Weights.Entry :=
  { word := [8, 12, 4, 4, 0, 0, 8], weights := [1, 0, 0, 1] }

def points2 : List (ℕ × ℕ) := [(0, 7), (1, 8), (2, 9), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 6436, representative 10899.
def source3 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B022.Data.entryAt ⟨43, by decide +kernel⟩

def target3 : Weights.Entry :=
  { word := [8, 12, 4, 4, 0, 8, 8], weights := [1, 0, 0, 1] }

def points3 : List (ℕ × ℕ) := [(0, 9), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 6442, representative 10856.
def source4 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B022.Data.entryAt ⟨0, by decide +kernel⟩

def target4 : Weights.Entry :=
  { word := [8, 12, 4, 4, 8, 0, 4], weights := [1, 0, 0, 1] }

def points4 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 6443, representative 10918.
def source5 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B022.Data.entryAt ⟨62, by decide +kernel⟩

def target5 : Weights.Entry :=
  { word := [8, 12, 4, 4, 8, 0, 8], weights := [1, 0, 0, 1] }

def points5 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 6450, representative 10904.
def source6 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B022.Data.entryAt ⟨48, by decide +kernel⟩

def target6 : Weights.Entry :=
  { word := [8, 12, 4, 4, 8, 8, 8], weights := [1, 0, 0, 1] }

def points6 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 6464, representative 10906.
def source7 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B022.Data.entryAt ⟨50, by decide +kernel⟩

def target7 : Weights.Entry :=
  { word := [8, 12, 4, 12, 0, 8, 8], weights := [1, 0, 0, 1] }

def points7 : List (ℕ × ℕ) := [(0, 9), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 6470, representative 10859.
def source8 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B022.Data.entryAt ⟨3, by decide +kernel⟩

def target8 : Weights.Entry :=
  { word := [8, 12, 4, 12, 8, 0, 4], weights := [1, 0, 0, 1] }

def points8 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 6471, representative 10919.
def source9 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B022.Data.entryAt ⟨63, by decide +kernel⟩

def target9 : Weights.Entry :=
  { word := [8, 12, 4, 12, 8, 0, 8], weights := [0, 1, 1, 0] }

def points9 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 6478, representative 10905.
def source10 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B022.Data.entryAt ⟨49, by decide +kernel⟩

def target10 : Weights.Entry :=
  { word := [8, 12, 4, 12, 8, 8, 8], weights := [0, 1, 1, 0] }

def points10 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 6484, representative 10888.
def source11 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B022.Data.entryAt ⟨32, by decide +kernel⟩

def target11 : Weights.Entry :=
  { word := [8, 12, 6, 8, 8, 8, 8], weights := [0, 1, 1, 0] }

def points11 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 6489, representative 10865.
def source12 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B022.Data.entryAt ⟨9, by decide +kernel⟩

def target12 : Weights.Entry :=
  { word := [8, 12, 8, 4, 2, 0, 4], weights := [1, 0, 0, 1] }

def points12 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 6496, representative 10908.
def source13 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B022.Data.entryAt ⟨52, by decide +kernel⟩

def target13 : Weights.Entry :=
  { word := [8, 12, 8, 4, 2, 8, 8], weights := [1, 0, 0, 1] }

def points13 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 6515, representative 10862.
def source14 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B022.Data.entryAt ⟨6, by decide +kernel⟩

def target14 : Weights.Entry :=
  { word := [8, 12, 8, 4, 10, 0, 4], weights := [1, 0, 0, 1] }

def points14 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 6522, representative 10909.
def source15 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B022.Data.entryAt ⟨53, by decide +kernel⟩

def target15 : Weights.Entry :=
  { word := [8, 12, 8, 4, 10, 8, 8], weights := [1, 0, 0, 1] }

def points15 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 6531, representative 10866.
def source16 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B022.Data.entryAt ⟨10, by decide +kernel⟩

def target16 : Weights.Entry :=
  { word := [8, 12, 8, 12, 2, 0, 4], weights := [1, 0, 0, 1] }

def points16 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 6538, representative 10911.
def source17 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B022.Data.entryAt ⟨55, by decide +kernel⟩

def target17 : Weights.Entry :=
  { word := [8, 12, 8, 12, 2, 8, 8], weights := [0, 1, 1, 0] }

def points17 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 6557, representative 10863.
def source18 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B022.Data.entryAt ⟨7, by decide +kernel⟩

def target18 : Weights.Entry :=
  { word := [8, 12, 8, 12, 10, 0, 4], weights := [1, 0, 0, 1] }

def points18 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 6564, representative 10910.
def source19 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B022.Data.entryAt ⟨54, by decide +kernel⟩

def target19 : Weights.Entry :=
  { word := [8, 12, 8, 12, 10, 8, 8], weights := [0, 1, 1, 0] }

def points19 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 6572, representative 10893.
def source20 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B022.Data.entryAt ⟨37, by decide +kernel⟩

def target20 : Weights.Entry :=
  { word := [8, 12, 10, 0, 1, 8, 8], weights := [0, 1, 2, 1] }

def points20 : List (ℕ × ℕ) := [(0, 9), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 6575, representative 10894.
def source21 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B022.Data.entryAt ⟨38, by decide +kernel⟩

def target21 : Weights.Entry :=
  { word := [8, 12, 10, 0, 9, 8, 8], weights := [0, 1, 2, 1] }

def points21 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 6578, representative 10890.
def source22 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B022.Data.entryAt ⟨34, by decide +kernel⟩

def target22 : Weights.Entry :=
  { word := [8, 12, 10, 8, 2, 8, 8], weights := [0, 1, 1, 0] }

def points22 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 6581, representative 10889.
def source23 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B022.Data.entryAt ⟨33, by decide +kernel⟩

def target23 : Weights.Entry :=
  { word := [8, 12, 10, 8, 10, 8, 8], weights := [0, 1, 1, 0] }

def points23 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 6586, representative 10900.
def source24 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B022.Data.entryAt ⟨44, by decide +kernel⟩

def target24 : Weights.Entry :=
  { word := [8, 12, 12, 4, 0, 8, 8], weights := [1, 0, 0, 1] }

def points24 : List (ℕ × ℕ) := [(0, 9), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 6592, representative 10857.
def source25 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B022.Data.entryAt ⟨1, by decide +kernel⟩

def target25 : Weights.Entry :=
  { word := [8, 12, 12, 4, 8, 0, 4], weights := [1, 0, 0, 1] }

def points25 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 6593, representative 10916.
def source26 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B022.Data.entryAt ⟨60, by decide +kernel⟩

def target26 : Weights.Entry :=
  { word := [8, 12, 12, 4, 8, 0, 8], weights := [1, 0, 0, 1] }

def points26 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 6600, representative 10901.
def source27 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B022.Data.entryAt ⟨45, by decide +kernel⟩

def target27 : Weights.Entry :=
  { word := [8, 12, 12, 4, 8, 8, 8], weights := [1, 0, 0, 1] }

def points27 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 6607, representative 10903.
def source28 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B022.Data.entryAt ⟨47, by decide +kernel⟩

def target28 : Weights.Entry :=
  { word := [8, 12, 12, 12, 0, 8, 8], weights := [1, 0, 0, 1] }

def points28 : List (ℕ × ℕ) := [(0, 9), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 6613, representative 10858.
def source29 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B022.Data.entryAt ⟨2, by decide +kernel⟩

def target29 : Weights.Entry :=
  { word := [8, 12, 12, 12, 8, 0, 4], weights := [1, 0, 0, 1] }

def points29 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 6614, representative 10917.
def source30 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B022.Data.entryAt ⟨61, by decide +kernel⟩

def target30 : Weights.Entry :=
  { word := [8, 12, 12, 12, 8, 0, 8], weights := [0, 1, 1, 0] }

def points30 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 6621, representative 10902.
def source31 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B022.Data.entryAt ⟨46, by decide +kernel⟩

def target31 : Weights.Entry :=
  { word := [8, 12, 12, 12, 8, 8, 8], weights := [0, 1, 1, 0] }

def points31 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 6627, representative 10876.
def source32 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B022.Data.entryAt ⟨20, by decide +kernel⟩

def target32 : Weights.Entry :=
  { word := [9, 0, 1, 4, 2, 0, 4], weights := [1, 0, 0, 1] }

def points32 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 0), (9, 1)]

-- Period 10, original row 6649, representative 10877.
def source33 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B022.Data.entryAt ⟨21, by decide +kernel⟩

def target33 : Weights.Entry :=
  { word := [9, 0, 1, 4, 10, 0, 4], weights := [1, 0, 0, 1] }

def points33 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 0), (9, 1)]

-- Period 10, original row 6663, representative 10883.
def source34 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B022.Data.entryAt ⟨27, by decide +kernel⟩

def target34 : Weights.Entry :=
  { word := [9, 0, 1, 12, 2, 0, 4], weights := [1, 0, 0, 1] }

def points34 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 0), (9, 1)]

-- Period 10, original row 6685, representative 10880.
def source35 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B022.Data.entryAt ⟨24, by decide +kernel⟩

def target35 : Weights.Entry :=
  { word := [9, 0, 1, 12, 10, 0, 4], weights := [1, 0, 0, 1] }

def points35 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 0), (9, 1)]

-- Period 10, original row 6699, representative 10876.
def source36 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B022.Data.entryAt ⟨20, by decide +kernel⟩

def target36 : Weights.Entry :=
  { word := [9, 0, 2, 2, 2, 0, 4], weights := [1, 0, 0, 1] }

def points36 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 4), (5, 5), (6, 3), (7, 2), (8, 0), (9, 1)]

-- Period 10, original row 6714, representative 10877.
def source37 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B022.Data.entryAt ⟨21, by decide +kernel⟩

def target37 : Weights.Entry :=
  { word := [9, 0, 2, 2, 10, 0, 4], weights := [1, 0, 0, 1] }

def points37 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 4), (5, 5), (6, 3), (7, 2), (8, 0), (9, 1)]

-- Period 10, original row 6729, representative 10883.
def source38 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B022.Data.entryAt ⟨27, by decide +kernel⟩

def target38 : Weights.Entry :=
  { word := [9, 0, 2, 10, 2, 0, 4], weights := [1, 0, 0, 1] }

def points38 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 4), (5, 5), (6, 3), (7, 2), (8, 0), (9, 1)]

-- Period 10, original row 6743, representative 10880.
def source39 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B022.Data.entryAt ⟨24, by decide +kernel⟩

def target39 : Weights.Entry :=
  { word := [9, 0, 2, 10, 10, 0, 4], weights := [1, 0, 0, 1] }

def points39 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 4), (5, 5), (6, 3), (7, 2), (8, 0), (9, 1)]

-- Period 10, original row 6788, representative 10898.
def source40 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B022.Data.entryAt ⟨42, by decide +kernel⟩

def target40 : Weights.Entry :=
  { word := [9, 0, 4, 8, 4, 10, 8], weights := [0, 1, 1, 0] }

def points40 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8), (9, 9)]

-- Period 10, original row 6822, representative 10918.
def source41 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B022.Data.entryAt ⟨62, by decide +kernel⟩

def target41 : Weights.Entry :=
  { word := [9, 0, 8, 2, 2, 10, 8], weights := [1, 0, 0, 1] }

def points41 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8), (9, 9)]

-- Period 10, original row 6826, representative 10916.
def source42 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B022.Data.entryAt ⟨60, by decide +kernel⟩

def target42 : Weights.Entry :=
  { word := [9, 0, 8, 2, 10, 10, 8], weights := [1, 0, 0, 1] }

def points42 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8), (9, 9)]

-- Period 10, original row 6845, representative 10919.
def source43 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B022.Data.entryAt ⟨63, by decide +kernel⟩

def target43 : Weights.Entry :=
  { word := [9, 0, 8, 10, 2, 10, 8], weights := [0, 1, 1, 0] }

def points43 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8), (9, 9)]

-- Period 10, original row 6847, representative 10917.
def source44 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B022.Data.entryAt ⟨61, by decide +kernel⟩

def target44 : Weights.Entry :=
  { word := [9, 0, 8, 10, 10, 10, 8], weights := [0, 1, 1, 0] }

def points44 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8), (9, 9)]

-- Period 10, original row 6930, representative 10897.
def source45 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B022.Data.entryAt ⟨41, by decide +kernel⟩

def target45 : Weights.Entry :=
  { word := [9, 0, 12, 8, 4, 10, 8], weights := [0, 1, 1, 0] }

def points45 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8), (9, 9)]

-- Period 10, original row 6979, representative 10872.
def source46 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B022.Data.entryAt ⟨16, by decide +kernel⟩

def target46 : Weights.Entry :=
  { word := [9, 4, 4, 4, 8, 0, 4], weights := [1, 0, 0, 1] }

def points46 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 7007, representative 10875.
def source47 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B022.Data.entryAt ⟨19, by decide +kernel⟩

def target47 : Weights.Entry :=
  { word := [9, 4, 4, 12, 8, 0, 4], weights := [1, 0, 0, 1] }

def points47 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 7028, representative 10873.
def source48 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B022.Data.entryAt ⟨17, by decide +kernel⟩

def target48 : Weights.Entry :=
  { word := [9, 4, 12, 4, 8, 0, 4], weights := [1, 0, 0, 1] }

def points48 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 7049, representative 10874.
def source49 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B022.Data.entryAt ⟨18, by decide +kernel⟩

def target49 : Weights.Entry :=
  { word := [9, 4, 12, 12, 8, 0, 4], weights := [1, 0, 0, 1] }

def points49 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 7063, representative 10860.
def source50 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B022.Data.entryAt ⟨4, by decide +kernel⟩

def target50 : Weights.Entry :=
  { word := [9, 8, 1, 4, 2, 0, 4], weights := [1, 0, 0, 1] }

def points50 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 7070, representative 10907.
def source51 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B022.Data.entryAt ⟨51, by decide +kernel⟩

def target51 : Weights.Entry :=
  { word := [9, 8, 1, 4, 2, 8, 8], weights := [1, 0, 1, 0] }

def points51 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8), (9, 9)]

-- Period 10, original row 7085, representative 10861.
def source52 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B022.Data.entryAt ⟨5, by decide +kernel⟩

def target52 : Weights.Entry :=
  { word := [9, 8, 1, 4, 10, 0, 4], weights := [1, 0, 0, 1] }

def points52 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 7092, representative 10912.
def source53 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B022.Data.entryAt ⟨56, by decide +kernel⟩

def target53 : Weights.Entry :=
  { word := [9, 8, 1, 4, 10, 8, 8], weights := [1, 0, 1, 0] }

def points53 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8), (9, 9)]

-- Period 10, original row 7099, representative 10867.
def source54 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B022.Data.entryAt ⟨11, by decide +kernel⟩

def target54 : Weights.Entry :=
  { word := [9, 8, 1, 12, 2, 0, 4], weights := [1, 0, 0, 1] }

def points54 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 7106, representative 10914.
def source55 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B022.Data.entryAt ⟨58, by decide +kernel⟩

def target55 : Weights.Entry :=
  { word := [9, 8, 1, 12, 2, 8, 8], weights := [1, 0, 1, 0] }

def points55 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8), (9, 9)]

-- Period 10, original row 7121, representative 10864.
def source56 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B022.Data.entryAt ⟨8, by decide +kernel⟩

def target56 : Weights.Entry :=
  { word := [9, 8, 1, 12, 10, 0, 4], weights := [1, 0, 0, 1] }

def points56 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 7128, representative 10913.
def source57 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B022.Data.entryAt ⟨57, by decide +kernel⟩

def target57 : Weights.Entry :=
  { word := [9, 8, 1, 12, 10, 8, 8], weights := [1, 0, 1, 0] }

def points57 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8), (9, 9)]

-- Period 10, original row 7135, representative 10868.
def source58 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B022.Data.entryAt ⟨12, by decide +kernel⟩

def target58 : Weights.Entry :=
  { word := [9, 8, 2, 2, 2, 0, 4], weights := [1, 0, 0, 1] }

def points58 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 7150, representative 10869.
def source59 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B022.Data.entryAt ⟨13, by decide +kernel⟩

def target59 : Weights.Entry :=
  { word := [9, 8, 2, 2, 10, 0, 4], weights := [1, 0, 0, 1] }

def points59 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 7165, representative 10871.
def source60 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B022.Data.entryAt ⟨15, by decide +kernel⟩

def target60 : Weights.Entry :=
  { word := [9, 8, 2, 10, 2, 0, 4], weights := [1, 0, 0, 1] }

def points60 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 7179, representative 10870.
def source61 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B022.Data.entryAt ⟨14, by decide +kernel⟩

def target61 : Weights.Entry :=
  { word := [9, 8, 2, 10, 10, 0, 4], weights := [1, 0, 0, 1] }

def points61 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 7302, representative 10915.
def source62 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B022.Data.entryAt ⟨59, by decide +kernel⟩

def target62 : Weights.Entry :=
  { word := [9, 12, 4, 4, 0, 0, 8], weights := [1, 0, 0, 1] }

def points62 : List (ℕ × ℕ) := [(0, 7), (1, 8), (2, 9), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 7309, representative 10899.
def source63 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B022.Data.entryAt ⟨43, by decide +kernel⟩

def target63 : Weights.Entry :=
  { word := [9, 12, 4, 4, 0, 8, 8], weights := [1, 0, 0, 1] }

def points63 : List (ℕ × ℕ) := [(0, 9), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 7315, representative 10856.
def source64 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B022.Data.entryAt ⟨0, by decide +kernel⟩

def target64 : Weights.Entry :=
  { word := [9, 12, 4, 4, 8, 0, 4], weights := [1, 0, 0, 1] }

def points64 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 7316, representative 10918.
def source65 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B022.Data.entryAt ⟨62, by decide +kernel⟩

def target65 : Weights.Entry :=
  { word := [9, 12, 4, 4, 8, 0, 8], weights := [1, 0, 0, 1] }

def points65 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 7323, representative 10904.
def source66 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B022.Data.entryAt ⟨48, by decide +kernel⟩

def target66 : Weights.Entry :=
  { word := [9, 12, 4, 4, 8, 8, 8], weights := [1, 0, 0, 1] }

def points66 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 7337, representative 10906.
def source67 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B022.Data.entryAt ⟨50, by decide +kernel⟩

def target67 : Weights.Entry :=
  { word := [9, 12, 4, 12, 0, 8, 8], weights := [1, 0, 0, 1] }

def points67 : List (ℕ × ℕ) := [(0, 9), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 7343, representative 10859.
def source68 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B022.Data.entryAt ⟨3, by decide +kernel⟩

def target68 : Weights.Entry :=
  { word := [9, 12, 4, 12, 8, 0, 4], weights := [1, 0, 0, 1] }

def points68 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 7344, representative 10919.
def source69 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B022.Data.entryAt ⟨63, by decide +kernel⟩

def target69 : Weights.Entry :=
  { word := [9, 12, 4, 12, 8, 0, 8], weights := [0, 1, 1, 0] }

def points69 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 7351, representative 10905.
def source70 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B022.Data.entryAt ⟨49, by decide +kernel⟩

def target70 : Weights.Entry :=
  { word := [9, 12, 4, 12, 8, 8, 8], weights := [0, 1, 1, 0] }

def points70 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 7358, representative 10900.
def source71 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B022.Data.entryAt ⟨44, by decide +kernel⟩

def target71 : Weights.Entry :=
  { word := [9, 12, 12, 4, 0, 8, 8], weights := [1, 0, 0, 1] }

def points71 : List (ℕ × ℕ) := [(0, 9), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 7364, representative 10857.
def source72 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B022.Data.entryAt ⟨1, by decide +kernel⟩

def target72 : Weights.Entry :=
  { word := [9, 12, 12, 4, 8, 0, 4], weights := [1, 0, 0, 1] }

def points72 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 7365, representative 10916.
def source73 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B022.Data.entryAt ⟨60, by decide +kernel⟩

def target73 : Weights.Entry :=
  { word := [9, 12, 12, 4, 8, 0, 8], weights := [1, 0, 0, 1] }

def points73 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 7372, representative 10901.
def source74 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B022.Data.entryAt ⟨45, by decide +kernel⟩

def target74 : Weights.Entry :=
  { word := [9, 12, 12, 4, 8, 8, 8], weights := [1, 0, 0, 1] }

def points74 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 7379, representative 10903.
def source75 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B022.Data.entryAt ⟨47, by decide +kernel⟩

def target75 : Weights.Entry :=
  { word := [9, 12, 12, 12, 0, 8, 8], weights := [1, 0, 0, 1] }

def points75 : List (ℕ × ℕ) := [(0, 9), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 7385, representative 10858.
def source76 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B022.Data.entryAt ⟨2, by decide +kernel⟩

def target76 : Weights.Entry :=
  { word := [9, 12, 12, 12, 8, 0, 4], weights := [1, 0, 0, 1] }

def points76 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 7386, representative 10917.
def source77 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B022.Data.entryAt ⟨61, by decide +kernel⟩

def target77 : Weights.Entry :=
  { word := [9, 12, 12, 12, 8, 0, 8], weights := [0, 1, 1, 0] }

def points77 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 7393, representative 10902.
def source78 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B022.Data.entryAt ⟨46, by decide +kernel⟩

def target78 : Weights.Entry :=
  { word := [9, 12, 12, 12, 8, 8, 8], weights := [0, 1, 1, 0] }

def points78 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

def period10Entries : List Weights.Entry := [target0, target1, target2, target3, target4, target5, target6, target7, target8, target9, target10, target11, target12, target13, target14, target15, target16, target17, target18, target19, target20, target21, target22, target23, target24, target25, target26, target27, target28, target29, target30, target31, target32, target33, target34, target35, target36, target37, target38, target39, target40, target41, target42, target43, target44, target45, target46, target47, target48, target49, target50, target51, target52, target53, target54, target55, target56, target57, target58, target59, target60, target61, target62, target63, target64, target65, target66, target67, target68, target69, target70, target71, target72, target73, target74, target75, target76, target77, target78]

def period10Chunk : RowCoverage.Chunk where
  rows := [⟨6420, target0⟩, ⟨6424, target1⟩, ⟨6429, target2⟩, ⟨6436, target3⟩, ⟨6442, target4⟩, ⟨6443, target5⟩, ⟨6450, target6⟩, ⟨6464, target7⟩, ⟨6470, target8⟩, ⟨6471, target9⟩, ⟨6478, target10⟩, ⟨6484, target11⟩, ⟨6489, target12⟩, ⟨6496, target13⟩, ⟨6515, target14⟩, ⟨6522, target15⟩, ⟨6531, target16⟩, ⟨6538, target17⟩, ⟨6557, target18⟩, ⟨6564, target19⟩, ⟨6572, target20⟩, ⟨6575, target21⟩, ⟨6578, target22⟩, ⟨6581, target23⟩, ⟨6586, target24⟩, ⟨6592, target25⟩, ⟨6593, target26⟩, ⟨6600, target27⟩, ⟨6607, target28⟩, ⟨6613, target29⟩, ⟨6614, target30⟩, ⟨6621, target31⟩, ⟨6627, target32⟩, ⟨6649, target33⟩, ⟨6663, target34⟩, ⟨6685, target35⟩, ⟨6699, target36⟩, ⟨6714, target37⟩, ⟨6729, target38⟩, ⟨6743, target39⟩, ⟨6788, target40⟩, ⟨6822, target41⟩, ⟨6826, target42⟩, ⟨6845, target43⟩, ⟨6847, target44⟩, ⟨6930, target45⟩, ⟨6979, target46⟩, ⟨7007, target47⟩, ⟨7028, target48⟩, ⟨7049, target49⟩, ⟨7063, target50⟩, ⟨7070, target51⟩, ⟨7085, target52⟩, ⟨7092, target53⟩, ⟨7099, target54⟩, ⟨7106, target55⟩, ⟨7121, target56⟩, ⟨7128, target57⟩, ⟨7135, target58⟩, ⟨7150, target59⟩, ⟨7165, target60⟩, ⟨7179, target61⟩, ⟨7302, target62⟩, ⟨7309, target63⟩, ⟨7315, target64⟩, ⟨7316, target65⟩, ⟨7323, target66⟩, ⟨7337, target67⟩, ⟨7343, target68⟩, ⟨7344, target69⟩, ⟨7351, target70⟩, ⟨7358, target71⟩, ⟨7364, target72⟩, ⟨7365, target73⟩, ⟨7372, target74⟩, ⟨7379, target75⟩, ⟨7385, target76⟩, ⟨7386, target77⟩, ⟨7393, target78⟩]
  indexMask := 331012313084099498019039118581969712445213713417440497724176722053525382219315745966965318479831847678482059522302837928333741485479284900123643909807419832574290887690084372508834765021695711418575772577942573111389739023327072672618579325013830934459409111230341377558473019328951050976932856141922670004168295738123354172081296290654167253063672749169000012156672681465175439153975212530999367595368487281102743866679846778018354230199537964083033695071356968561118598305369395560190241893593110874016129856864733090044855118555174430066525743533643943801994571813923117417463126525667794680628412113218693040122611347333717313739091587912608696967912094808489580308242577974430509101148713203204845459458896129171153418416061007554035543754628072364874211594031438627943563149220381790528238530385934700827390727506558023186713406634282746672071099865470578556645846112487706486353067405198356688244850499498152953483736240072215225737494497687601165717152976814708264480433513289170475031154496487227510797620877173693551479446033422414864121106447310270825898638216701468322653134589619326824624379312095012317029733311529501575979855674922292039381520729008117013865239378174172610067504813828890239439254765202275520220964866034248997832789951093971032946875376855645080923251954936811010754108201269500536792178278432532987087427516552616534439972106471497721956232336825776026079637836271908305741675829075185071150248032144955191673861811839912097331017682048129794548024755285705656568606862958804857720578978474390778920173276466900928196341602222849974363987686778838450072102248835161587492586999146477590834958363003415628560912796741276853746955957885316315958035835355586790453623311876906046745155852650398909596732093520308159743567117974673759860708596387030456338618536953653953431160673686868331068972315578954526601582261272242212672008589371563870684460117937436074005556302644566983404744430373553884670217110468181511668758933663651710767814114245845949817790941080185559017014306467119155967860860784897204324546417503017174153028259728830097696996810690382772773854031978718489193708441922473232706514551170906660052936339316743217783518519494817516613304104749533362543564332168014885077332787200
  count := 79

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

end FranklSmallCyclic.TransportBatches.G100.B001.Data
