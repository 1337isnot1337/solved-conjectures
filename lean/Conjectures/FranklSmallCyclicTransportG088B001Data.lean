module

public import Conjectures.FranklSmallCyclicRowCoverage
public import Conjectures.FranklSmallCyclicCanonicalWords
public import Conjectures.FranklSmallCyclicOrbit10Block010Data

/-! 41 literal targets sharing one source proof block.
Original words and row indices are retained; weights may be transported.
-/
@[expose] public section

namespace FranklSmallCyclic.TransportBatches.G088.B001.Data

-- Period 10, original row 7258, representative 10144.
def source0 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B010.Data.entryAt ⟨56, by decide +kernel⟩

def target0 : Weights.Entry :=
  { word := [9, 8, 10, 2, 2, 8, 10], weights := [1, 0, 0, 1] }

def points0 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8), (9, 9)]

-- Period 10, original row 7266, representative 10141.
def source1 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B010.Data.entryAt ⟨53, by decide +kernel⟩

def target1 : Weights.Entry :=
  { word := [9, 8, 10, 2, 10, 8, 10], weights := [1, 0, 0, 1] }

def points1 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8), (9, 9)]

-- Period 10, original row 7267, representative 10149.
def source2 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B010.Data.entryAt ⟨61, by decide +kernel⟩

def target2 : Weights.Entry :=
  { word := [9, 8, 10, 2, 10, 8, 12], weights := [1, 0, 0, 1] }

def points2 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8), (9, 9)]

-- Period 10, original row 7273, representative 10145.
def source3 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B010.Data.entryAt ⟨57, by decide +kernel⟩

def target3 : Weights.Entry :=
  { word := [9, 8, 10, 10, 2, 8, 10], weights := [0, 1, 1, 0] }

def points3 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8), (9, 9)]

-- Period 10, original row 7280, representative 10142.
def source4 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B010.Data.entryAt ⟨54, by decide +kernel⟩

def target4 : Weights.Entry :=
  { word := [9, 8, 10, 10, 10, 8, 10], weights := [0, 1, 1, 0] }

def points4 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8), (9, 9)]

-- Period 10, original row 7281, representative 10150.
def source5 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B010.Data.entryAt ⟨62, by decide +kernel⟩

def target5 : Weights.Entry :=
  { word := [9, 8, 10, 10, 10, 8, 12], weights := [1, 0, 0, 1] }

def points5 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8), (9, 9)]

-- Period 10, original row 7310, representative 10101.
def source6 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B010.Data.entryAt ⟨13, by decide +kernel⟩

def target6 : Weights.Entry :=
  { word := [9, 12, 4, 4, 0, 8, 9], weights := [1, 0, 0, 1] }

def points6 : List (ℕ × ℕ) := [(0, 9), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 7324, representative 10102.
def source7 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B010.Data.entryAt ⟨14, by decide +kernel⟩

def target7 : Weights.Entry :=
  { word := [9, 12, 4, 4, 8, 8, 9], weights := [1, 0, 0, 1] }

def points7 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 7338, representative 10108.
def source8 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B010.Data.entryAt ⟨20, by decide +kernel⟩

def target8 : Weights.Entry :=
  { word := [9, 12, 4, 12, 0, 8, 9], weights := [1, 0, 0, 1] }

def points8 : List (ℕ × ℕ) := [(0, 9), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 7352, representative 10105.
def source9 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B010.Data.entryAt ⟨17, by decide +kernel⟩

def target9 : Weights.Entry :=
  { word := [9, 12, 4, 12, 8, 8, 9], weights := [0, 1, 1, 0] }

def points9 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 7359, representative 10106.
def source10 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B010.Data.entryAt ⟨18, by decide +kernel⟩

def target10 : Weights.Entry :=
  { word := [9, 12, 12, 4, 0, 8, 9], weights := [1, 0, 0, 1] }

def points10 : List (ℕ × ℕ) := [(0, 9), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 7373, representative 10103.
def source11 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B010.Data.entryAt ⟨15, by decide +kernel⟩

def target11 : Weights.Entry :=
  { word := [9, 12, 12, 4, 8, 8, 9], weights := [1, 0, 0, 1] }

def points11 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 7380, representative 10107.
def source12 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B010.Data.entryAt ⟨19, by decide +kernel⟩

def target12 : Weights.Entry :=
  { word := [9, 12, 12, 12, 0, 8, 9], weights := [1, 0, 0, 1] }

def points12 : List (ℕ × ℕ) := [(0, 9), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 7394, representative 10104.
def source13 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B010.Data.entryAt ⟨16, by decide +kernel⟩

def target13 : Weights.Entry :=
  { word := [9, 12, 12, 12, 8, 8, 9], weights := [0, 1, 1, 0] }

def points13 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 7911, representative 10127.
def source14 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B010.Data.entryAt ⟨39, by decide +kernel⟩

def target14 : Weights.Entry :=
  { word := [10, 8, 2, 0, 1, 8, 8], weights := [0, 0, 1, 0] }

def points14 : List (ℕ × ℕ) := [(0, 9), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 7914, representative 10128.
def source15 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B010.Data.entryAt ⟨40, by decide +kernel⟩

def target15 : Weights.Entry :=
  { word := [10, 8, 2, 0, 9, 8, 8], weights := [0, 0, 1, 0] }

def points15 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 7941, representative 10147.
def source16 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B010.Data.entryAt ⟨59, by decide +kernel⟩

def target16 : Weights.Entry :=
  { word := [10, 8, 4, 4, 4, 8, 8], weights := [1, 0, 0, 1] }

def points16 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8119, representative 10125.
def source17 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B010.Data.entryAt ⟨37, by decide +kernel⟩

def target17 : Weights.Entry :=
  { word := [10, 8, 10, 0, 1, 8, 8], weights := [0, 0, 1, 0] }

def points17 : List (ℕ × ℕ) := [(0, 9), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8122, representative 10126.
def source18 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B010.Data.entryAt ⟨38, by decide +kernel⟩

def target18 : Weights.Entry :=
  { word := [10, 8, 10, 0, 9, 8, 8], weights := [0, 0, 1, 0] }

def points18 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8149, representative 10148.
def source19 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B010.Data.entryAt ⟨60, by decide +kernel⟩

def target19 : Weights.Entry :=
  { word := [10, 8, 12, 4, 4, 8, 8], weights := [1, 0, 0, 1] }

def points19 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8153, representative 10149.
def source20 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B010.Data.entryAt ⟨61, by decide +kernel⟩

def target20 : Weights.Entry :=
  { word := [10, 8, 12, 4, 12, 8, 8], weights := [1, 0, 0, 1] }

def points20 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8175, representative 10151.
def source21 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B010.Data.entryAt ⟨63, by decide +kernel⟩

def target21 : Weights.Entry :=
  { word := [10, 8, 12, 12, 4, 8, 8], weights := [1, 0, 0, 1] }

def points21 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8178, representative 10150.
def source22 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B010.Data.entryAt ⟨62, by decide +kernel⟩

def target22 : Weights.Entry :=
  { word := [10, 8, 12, 12, 12, 8, 8], weights := [1, 0, 0, 1] }

def points22 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8843, representative 10139.
def source23 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B010.Data.entryAt ⟨51, by decide +kernel⟩

def target23 : Weights.Entry :=
  { word := [12, 8, 4, 4, 4, 8, 8], weights := [1, 0, 0, 1] }

def points23 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8847, representative 10144.
def source24 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B010.Data.entryAt ⟨56, by decide +kernel⟩

def target24 : Weights.Entry :=
  { word := [12, 8, 4, 4, 12, 8, 8], weights := [1, 0, 0, 1] }

def points24 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8849, representative 10137.
def source25 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B010.Data.entryAt ⟨49, by decide +kernel⟩

def target25 : Weights.Entry :=
  { word := [12, 8, 4, 8, 4, 2, 8], weights := [0, 1, 1, 0] }

def points25 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8851, representative 10132.
def source26 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B010.Data.entryAt ⟨44, by decide +kernel⟩

def target26 : Weights.Entry :=
  { word := [12, 8, 4, 8, 4, 10, 8], weights := [0, 1, 1, 0] }

def points26 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8853, representative 10136.
def source27 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B010.Data.entryAt ⟨48, by decide +kernel⟩

def target27 : Weights.Entry :=
  { word := [12, 8, 4, 8, 12, 2, 8], weights := [0, 1, 1, 0] }

def points27 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8855, representative 10131.
def source28 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B010.Data.entryAt ⟨43, by decide +kernel⟩

def target28 : Weights.Entry :=
  { word := [12, 8, 4, 8, 12, 10, 8], weights := [0, 1, 1, 0] }

def points28 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8877, representative 10146.
def source29 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B010.Data.entryAt ⟨58, by decide +kernel⟩

def target29 : Weights.Entry :=
  { word := [12, 8, 4, 12, 4, 8, 8], weights := [0, 1, 1, 0] }

def points29 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8880, representative 10145.
def source30 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B010.Data.entryAt ⟨57, by decide +kernel⟩

def target30 : Weights.Entry :=
  { word := [12, 8, 4, 12, 12, 8, 8], weights := [0, 1, 1, 0] }

def points30 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8907, representative 10138.
def source31 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B010.Data.entryAt ⟨50, by decide +kernel⟩

def target31 : Weights.Entry :=
  { word := [12, 8, 8, 8, 6, 2, 8], weights := [0, 1, 1, 0] }

def points31 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8909, representative 10133.
def source32 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B010.Data.entryAt ⟨45, by decide +kernel⟩

def target32 : Weights.Entry :=
  { word := [12, 8, 8, 8, 6, 10, 8], weights := [0, 1, 1, 0] }

def points32 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8951, representative 10140.
def source33 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B010.Data.entryAt ⟨52, by decide +kernel⟩

def target33 : Weights.Entry :=
  { word := [12, 8, 12, 4, 4, 8, 8], weights := [1, 0, 0, 1] }

def points33 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8955, representative 10141.
def source34 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B010.Data.entryAt ⟨53, by decide +kernel⟩

def target34 : Weights.Entry :=
  { word := [12, 8, 12, 4, 12, 8, 8], weights := [1, 0, 0, 1] }

def points34 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8957, representative 10135.
def source35 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B010.Data.entryAt ⟨47, by decide +kernel⟩

def target35 : Weights.Entry :=
  { word := [12, 8, 12, 8, 4, 2, 8], weights := [0, 1, 1, 0] }

def points35 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8959, representative 10130.
def source36 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B010.Data.entryAt ⟨42, by decide +kernel⟩

def target36 : Weights.Entry :=
  { word := [12, 8, 12, 8, 4, 10, 8], weights := [0, 1, 1, 0] }

def points36 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8961, representative 10134.
def source37 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B010.Data.entryAt ⟨46, by decide +kernel⟩

def target37 : Weights.Entry :=
  { word := [12, 8, 12, 8, 12, 2, 8], weights := [0, 1, 1, 0] }

def points37 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8963, representative 10129.
def source38 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B010.Data.entryAt ⟨41, by decide +kernel⟩

def target38 : Weights.Entry :=
  { word := [12, 8, 12, 8, 12, 10, 8], weights := [0, 1, 1, 0] }

def points38 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8985, representative 10143.
def source39 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B010.Data.entryAt ⟨55, by decide +kernel⟩

def target39 : Weights.Entry :=
  { word := [12, 8, 12, 12, 4, 8, 8], weights := [0, 1, 1, 0] }

def points39 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8988, representative 10142.
def source40 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B010.Data.entryAt ⟨54, by decide +kernel⟩

def target40 : Weights.Entry :=
  { word := [12, 8, 12, 12, 12, 8, 8], weights := [0, 1, 1, 0] }

def points40 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

def period10Entries : List Weights.Entry := [target0, target1, target2, target3, target4, target5, target6, target7, target8, target9, target10, target11, target12, target13, target14, target15, target16, target17, target18, target19, target20, target21, target22, target23, target24, target25, target26, target27, target28, target29, target30, target31, target32, target33, target34, target35, target36, target37, target38, target39, target40]

def period10Chunk : RowCoverage.Chunk where
  rows := [⟨7258, target0⟩, ⟨7266, target1⟩, ⟨7267, target2⟩, ⟨7273, target3⟩, ⟨7280, target4⟩, ⟨7281, target5⟩, ⟨7310, target6⟩, ⟨7324, target7⟩, ⟨7338, target8⟩, ⟨7352, target9⟩, ⟨7359, target10⟩, ⟨7373, target11⟩, ⟨7380, target12⟩, ⟨7394, target13⟩, ⟨7911, target14⟩, ⟨7914, target15⟩, ⟨7941, target16⟩, ⟨8119, target17⟩, ⟨8122, target18⟩, ⟨8149, target19⟩, ⟨8153, target20⟩, ⟨8175, target21⟩, ⟨8178, target22⟩, ⟨8843, target23⟩, ⟨8847, target24⟩, ⟨8849, target25⟩, ⟨8851, target26⟩, ⟨8853, target27⟩, ⟨8855, target28⟩, ⟨8877, target29⟩, ⟨8880, target30⟩, ⟨8907, target31⟩, ⟨8909, target32⟩, ⟨8951, target33⟩, ⟨8955, target34⟩, ⟨8957, target35⟩, ⟨8959, target36⟩, ⟨8961, target37⟩, ⟨8963, target38⟩, ⟨8985, target39⟩, ⟨8988, target40⟩]
  indexMask := 511391571162132431010737889189837870795619053429946359087735577349720039866756340333972783298527716349752641350108299224987985850805001538128659951416822389894199588169441827759528144434907897045251807689636715562004111341093922090216570810740139356992452519685961422060398705217932644499118047414159576260747907571826990581842549747675572111964503490512418816567049781395927469872963678480341992977128174109080560831432350713316094253287322770262375284336362891999212085515755778804204129893448792626429870916116934876900203559140754957382903747815550234726378565468091281469706006335663999064575866817069061254203070448325915511737533440461695230088021749617574340896306893389781361335647123857225782182224130384884862556352773362194821803649099730625266463469398633329885299688206737024826061170114369690493739591947575731663334005441916842594978776025102740008143242058555541195158256423655293116529098430638356743287026013581719963158001286568863614206683882830328207246856320520317923153481259070975976079909025043326471804530270895608574077512343091131649165789209961085774607157947974682359149865948958124062072132269017617649699388805583361931109407009596740900982279234650003228193438218068767034677357239348246875538384785604524100478489295515256661608997428162974521639460303177477811015845468826296031088906890164872184976119498583492210239354426176502691577730354425355413663938210813861039587797642481290804977240237588140213728943798562546565013462609127031884276130071390169833681712680187344318300875541382043569985794112527246631174694294182168618736484190411528622231781536068072279545631853106508935693521467961169541560454447133077847941653970708740966793779823296494007504775621871148099341422391441296544403158764320867139202467214278842857345578203231787137314478602863912263309569645613431846020614208672370586565942734861098719562472025219104078412572863231765693879555505291089527484657935981865833873564357605678537492715423213081649173548858321370015312903862795325473418145654806430944803188045730896097180010344322777181777528467590014231124518573200642573911107724150329757346090834561168395904779166442130955602556842743474027285166247614792512413365744057188942422902322555050141146346546172449043892267822736548296672248937183731401225524422870681374895551591093539809731599062438713093482593053751140086901628299486029510515465814864257994033378347974062480149631150490001528685226393163582284244557682817743792078235344680979727894941090275950007020927301321361090780850373485946559094250693380022588119551389629187089974544060198691886422751795619755283314901831967207219963219279753237812456086836691111703490671436255475487248996871117442445560884384665501524033536
  count := 41

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

end FranklSmallCyclic.TransportBatches.G088.B001.Data
