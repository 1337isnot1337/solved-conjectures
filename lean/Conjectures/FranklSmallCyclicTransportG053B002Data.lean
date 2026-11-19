module

public import Conjectures.FranklSmallCyclicRowCoverage
public import Conjectures.FranklSmallCyclicCanonicalWords
public import Conjectures.FranklSmallCyclicOrbit9Block000Data

/-! 108 literal targets sharing one source proof block.
Original words and row indices are retained; weights may be transported.
-/
@[expose] public section

namespace FranklSmallCyclic.TransportBatches.G053.B002.Data

-- Period 9, original row 8372, representative 6777.
def source0 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B000.Data.entryAt ⟨36, by decide +kernel⟩

def target0 : Weights.Entry :=
  { word := [10, 10, 8, 12, 10, 8, 10], weights := [1, 1, 1, 1] }

-- Period 9, original row 8382, representative 6841.
def source1 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B000.Data.entryAt ⟨96, by decide +kernel⟩

def target1 : Weights.Entry :=
  { word := [10, 10, 10, 8, 1, 0, 9], weights := [1, 1, 0, 1] }

def points1 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 8383, representative 6773.
def source2 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B000.Data.entryAt ⟨32, by decide +kernel⟩

def target2 : Weights.Entry :=
  { word := [10, 10, 10, 8, 1, 0, 10], weights := [1, 1, 0, 1] }

def points2 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 8384, representative 6773.
def source3 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B000.Data.entryAt ⟨32, by decide +kernel⟩

def target3 : Weights.Entry :=
  { word := [10, 10, 10, 8, 1, 0, 12], weights := [1, 1, 0, 1] }

def points3 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 8387, representative 6839.
def source4 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B000.Data.entryAt ⟨94, by decide +kernel⟩

def target4 : Weights.Entry :=
  { word := [10, 10, 10, 8, 1, 8, 9], weights := [1, 1, 1, 1] }

def points4 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 8389, representative 6851.
def source5 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B000.Data.entryAt ⟨106, by decide +kernel⟩

def target5 : Weights.Entry :=
  { word := [10, 10, 10, 8, 8, 4, 0], weights := [1, 0, 1, 0] }

def points5 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 8391, representative 6850.
def source6 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B000.Data.entryAt ⟨105, by decide +kernel⟩

def target6 : Weights.Entry :=
  { word := [10, 10, 10, 8, 8, 12, 0], weights := [1, 0, 1, 0] }

def points6 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 8394, representative 6813.
def source7 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B000.Data.entryAt ⟨69, by decide +kernel⟩

def target7 : Weights.Entry :=
  { word := [10, 10, 10, 8, 9, 0, 4], weights := [1, 1, 0, 1] }

def points7 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 8396, representative 6840.
def source8 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B000.Data.entryAt ⟨95, by decide +kernel⟩

def target8 : Weights.Entry :=
  { word := [10, 10, 10, 8, 9, 0, 9], weights := [1, 1, 0, 1] }

def points8 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 8397, representative 6771.
def source9 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B000.Data.entryAt ⟨30, by decide +kernel⟩

def target9 : Weights.Entry :=
  { word := [10, 10, 10, 8, 9, 0, 10], weights := [1, 1, 0, 1] }

-- Period 9, original row 8398, representative 6772.
def source10 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B000.Data.entryAt ⟨31, by decide +kernel⟩

def target10 : Weights.Entry :=
  { word := [10, 10, 10, 8, 9, 0, 12], weights := [1, 1, 0, 1] }

def points10 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 8412, representative 6776.
def source11 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B000.Data.entryAt ⟨35, by decide +kernel⟩

def target11 : Weights.Entry :=
  { word := [12, 0, 0, 9, 4, 12, 12], weights := [1, 0, 1, 1] }

def points11 : List (ℕ × ℕ) := [(0, 0), (1, 2), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 8416, representative 6773.
def source12 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B000.Data.entryAt ⟨32, by decide +kernel⟩

def target12 : Weights.Entry :=
  { word := [12, 0, 0, 9, 12, 12, 12], weights := [1, 0, 1, 1] }

def points12 : List (ℕ × ℕ) := [(0, 0), (1, 2), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 8426, representative 6769.
def source13 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B000.Data.entryAt ⟨28, by decide +kernel⟩

def target13 : Weights.Entry :=
  { word := [12, 0, 0, 12, 0, 12, 12], weights := [1, 0, 1, 0] }

def points13 : List (ℕ × ℕ) := [(0, 0), (1, 2), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 8472, representative 6782.
def source14 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B000.Data.entryAt ⟨41, by decide +kernel⟩

def target14 : Weights.Entry :=
  { word := [12, 0, 4, 10, 0, 12, 10], weights := [0, 1, 1, 1] }

def points14 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 8473, representative 6782.
def source15 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B000.Data.entryAt ⟨41, by decide +kernel⟩

def target15 : Weights.Entry :=
  { word := [12, 0, 4, 10, 0, 12, 12], weights := [0, 1, 1, 1] }

def points15 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 8481, representative 6780.
def source16 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B000.Data.entryAt ⟨39, by decide +kernel⟩

def target16 : Weights.Entry :=
  { word := [12, 0, 4, 10, 8, 12, 12], weights := [0, 1, 1, 1] }

def points16 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 8503, representative 6774.
def source17 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B000.Data.entryAt ⟨33, by decide +kernel⟩

def target17 : Weights.Entry :=
  { word := [12, 0, 8, 9, 4, 12, 12], weights := [1, 0, 1, 1] }

def points17 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 8507, representative 6771.
def source18 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B000.Data.entryAt ⟨30, by decide +kernel⟩

def target18 : Weights.Entry :=
  { word := [12, 0, 8, 9, 12, 12, 12], weights := [1, 0, 1, 1] }

def points18 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 8565, representative 6781.
def source19 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B000.Data.entryAt ⟨40, by decide +kernel⟩

def target19 : Weights.Entry :=
  { word := [12, 0, 12, 10, 0, 12, 10], weights := [0, 1, 1, 1] }

def points19 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 8566, representative 6781.
def source20 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B000.Data.entryAt ⟨40, by decide +kernel⟩

def target20 : Weights.Entry :=
  { word := [12, 0, 12, 10, 0, 12, 12], weights := [0, 1, 1, 1] }

def points20 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 8574, representative 6779.
def source21 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B000.Data.entryAt ⟨38, by decide +kernel⟩

def target21 : Weights.Entry :=
  { word := [12, 0, 12, 10, 8, 12, 12], weights := [0, 1, 1, 1] }

def points21 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 8590, representative 6750.
def source22 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B000.Data.entryAt ⟨10, by decide +kernel⟩

def target22 : Weights.Entry :=
  { word := [12, 2, 0, 9, 8, 8, 6], weights := [1, 1, 0, 1] }

def points22 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 8680, representative 6770.
def source23 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B000.Data.entryAt ⟨29, by decide +kernel⟩

def target23 : Weights.Entry :=
  { word := [12, 2, 8, 10, 8, 12, 12], weights := [1, 2, 1, 2] }

def points23 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 8703, representative 6796.
def source24 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B000.Data.entryAt ⟨52, by decide +kernel⟩

def target24 : Weights.Entry :=
  { word := [12, 4, 8, 8, 1, 12, 10], weights := [1, 0, 1, 1] }

def points24 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 8704, representative 6796.
def source25 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B000.Data.entryAt ⟨52, by decide +kernel⟩

def target25 : Weights.Entry :=
  { word := [12, 4, 8, 8, 1, 12, 12], weights := [1, 0, 1, 1] }

def points25 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 8713, representative 6791.
def source26 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B000.Data.entryAt ⟨47, by decide +kernel⟩

def target26 : Weights.Entry :=
  { word := [12, 4, 8, 8, 9, 12, 12], weights := [1, 0, 1, 1] }

def points26 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 8760, representative 6760.
def source27 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B000.Data.entryAt ⟨19, by decide +kernel⟩

def target27 : Weights.Entry :=
  { word := [12, 8, 0, 4, 8, 12, 12], weights := [1, 0, 0, 1] }

def points27 : List (ℕ × ℕ) := [(0, 0), (1, 2), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 8803, representative 6763.
def source28 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B000.Data.entryAt ⟨22, by decide +kernel⟩

def target28 : Weights.Entry :=
  { word := [12, 8, 0, 12, 8, 12, 12], weights := [1, 0, 1, 0] }

def points28 : List (ℕ × ℕ) := [(0, 0), (1, 2), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 8874, representative 6778.
def source29 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B000.Data.entryAt ⟨37, by decide +kernel⟩

def target29 : Weights.Entry :=
  { word := [12, 8, 4, 10, 8, 12, 12], weights := [1, 1, 1, 1] }

def points29 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 8982, representative 6777.
def source30 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B000.Data.entryAt ⟨36, by decide +kernel⟩

def target30 : Weights.Entry :=
  { word := [12, 8, 12, 10, 8, 12, 12], weights := [1, 1, 1, 1] }

def points30 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 8989, representative 6831.
def source31 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B000.Data.entryAt ⟨87, by decide +kernel⟩

def target31 : Weights.Entry :=
  { word := [12, 10, 0, 9, 8, 1, 4], weights := [1, 1, 0, 1] }

def points31 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 8990, representative 6797.
def source32 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B000.Data.entryAt ⟨53, by decide +kernel⟩

def target32 : Weights.Entry :=
  { word := [12, 10, 0, 9, 8, 1, 12], weights := [1, 1, 0, 1] }

def points32 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 8991, representative 6830.
def source33 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B000.Data.entryAt ⟨86, by decide +kernel⟩

def target33 : Weights.Entry :=
  { word := [12, 10, 0, 9, 8, 2, 2], weights := [1, 1, 0, 1] }

def points33 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 8992, representative 6796.
def source34 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B000.Data.entryAt ⟨52, by decide +kernel⟩

def target34 : Weights.Entry :=
  { word := [12, 10, 0, 9, 8, 2, 10], weights := [1, 1, 0, 1] }

def points34 : List (ℕ × ℕ) := [(0, 0), (1, 2), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 8993, representative 6832.
def source35 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B000.Data.entryAt ⟨88, by decide +kernel⟩

def target35 : Weights.Entry :=
  { word := [12, 10, 0, 9, 8, 8, 4], weights := [1, 1, 0, 1] }

def points35 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 8994, representative 6748.
def source36 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B000.Data.entryAt ⟨8, by decide +kernel⟩

def target36 : Weights.Entry :=
  { word := [12, 10, 0, 9, 8, 8, 6], weights := [1, 1, 0, 1] }

def points36 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 8995, representative 6798.
def source37 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B000.Data.entryAt ⟨54, by decide +kernel⟩

def target37 : Weights.Entry :=
  { word := [12, 10, 0, 9, 8, 8, 12], weights := [1, 1, 0, 1] }

def points37 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 8996, representative 6829.
def source38 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B000.Data.entryAt ⟨85, by decide +kernel⟩

def target38 : Weights.Entry :=
  { word := [12, 10, 0, 9, 8, 9, 4], weights := [1, 1, 0, 1] }

def points38 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 8997, representative 6795.
def source39 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B000.Data.entryAt ⟨51, by decide +kernel⟩

def target39 : Weights.Entry :=
  { word := [12, 10, 0, 9, 8, 9, 12], weights := [1, 1, 0, 1] }

def points39 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 8998, representative 6828.
def source40 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B000.Data.entryAt ⟨84, by decide +kernel⟩

def target40 : Weights.Entry :=
  { word := [12, 10, 0, 9, 8, 10, 2], weights := [1, 1, 0, 1] }

def points40 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 8999, representative 6794.
def source41 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B000.Data.entryAt ⟨50, by decide +kernel⟩

def target41 : Weights.Entry :=
  { word := [12, 10, 0, 9, 8, 10, 10], weights := [1, 1, 0, 1] }

def points41 : List (ℕ × ℕ) := [(0, 0), (1, 2), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 9000, representative 6810.
def source42 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B000.Data.entryAt ⟨66, by decide +kernel⟩

def target42 : Weights.Entry :=
  { word := [12, 10, 0, 10, 8, 0, 4], weights := [0, 1, 0, 1] }

def points42 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 9001, representative 6768.
def source43 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B000.Data.entryAt ⟨27, by decide +kernel⟩

def target43 : Weights.Entry :=
  { word := [12, 10, 0, 10, 8, 0, 12], weights := [0, 1, 0, 1] }

def points43 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 9002, representative 6808.
def source44 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B000.Data.entryAt ⟨64, by decide +kernel⟩

def target44 : Weights.Entry :=
  { word := [12, 10, 0, 10, 8, 8, 4], weights := [0, 1, 0, 1] }

def points44 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 9003, representative 6766.
def source45 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B000.Data.entryAt ⟨25, by decide +kernel⟩

def target45 : Weights.Entry :=
  { word := [12, 10, 0, 10, 8, 8, 12], weights := [0, 1, 0, 1] }

def points45 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 9006, representative 6822.
def source46 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B000.Data.entryAt ⟨78, by decide +kernel⟩

def target46 : Weights.Entry :=
  { word := [12, 10, 0, 12, 2, 0, 4], weights := [1, 1, 0, 1] }

def points46 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 9008, representative 6849.
def source47 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B000.Data.entryAt ⟨104, by decide +kernel⟩

def target47 : Weights.Entry :=
  { word := [12, 10, 0, 12, 2, 0, 9], weights := [1, 1, 0, 1] }

def points47 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 9009, representative 6782.
def source48 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B000.Data.entryAt ⟨41, by decide +kernel⟩

def target48 : Weights.Entry :=
  { word := [12, 10, 0, 12, 2, 0, 10], weights := [1, 1, 1, 0] }

def points48 : List (ℕ × ℕ) := [(0, 0), (1, 2), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 9010, representative 6788.
def source49 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B000.Data.entryAt ⟨45, by decide +kernel⟩

def target49 : Weights.Entry :=
  { word := [12, 10, 0, 12, 2, 0, 12], weights := [1, 1, 0, 1] }

def points49 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 9014, representative 6821.
def source50 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B000.Data.entryAt ⟨77, by decide +kernel⟩

def target50 : Weights.Entry :=
  { word := [12, 10, 0, 12, 10, 0, 4], weights := [1, 1, 0, 1] }

def points50 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 9016, representative 6848.
def source51 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B000.Data.entryAt ⟨103, by decide +kernel⟩

def target51 : Weights.Entry :=
  { word := [12, 10, 0, 12, 10, 0, 9], weights := [1, 1, 0, 1] }

def points51 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 9017, representative 6781.
def source52 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B000.Data.entryAt ⟨40, by decide +kernel⟩

def target52 : Weights.Entry :=
  { word := [12, 10, 0, 12, 10, 0, 10], weights := [1, 1, 1, 0] }

def points52 : List (ℕ × ℕ) := [(0, 0), (1, 2), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 9018, representative 6787.
def source53 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B000.Data.entryAt ⟨44, by decide +kernel⟩

def target53 : Weights.Entry :=
  { word := [12, 10, 0, 12, 10, 0, 12], weights := [1, 1, 0, 1] }

def points53 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 9022, representative 6800.
def source54 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B000.Data.entryAt ⟨56, by decide +kernel⟩

def target54 : Weights.Entry :=
  { word := [12, 10, 8, 2, 8, 8, 4], weights := [0, 1, 0, 1] }

def points54 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 9023, representative 6758.
def source55 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B000.Data.entryAt ⟨17, by decide +kernel⟩

def target55 : Weights.Entry :=
  { word := [12, 10, 8, 2, 8, 8, 12], weights := [0, 1, 0, 1] }

def points55 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 9027, representative 6873.
def source56 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B000.Data.entryAt ⟨127, by decide +kernel⟩

def target56 : Weights.Entry :=
  { word := [12, 10, 8, 4, 4, 12, 0], weights := [1, 0, 1, 0] }

def points56 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 9031, representative 6872.
def source57 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B000.Data.entryAt ⟨126, by decide +kernel⟩

def target57 : Weights.Entry :=
  { word := [12, 10, 8, 8, 4, 6, 0], weights := [0, 1, 1, 0] }

def points57 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 9034, representative 6871.
def source58 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B000.Data.entryAt ⟨125, by decide +kernel⟩

def target58 : Weights.Entry :=
  { word := [12, 10, 8, 8, 12, 6, 0], weights := [0, 1, 1, 0] }

def points58 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 9039, representative 6870.
def source59 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B000.Data.entryAt ⟨124, by decide +kernel⟩

def target59 : Weights.Entry :=
  { word := [12, 10, 8, 10, 8, 6, 8], weights := [1, 1, 1, 1] }

def points59 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 9040, representative 6801.
def source60 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B000.Data.entryAt ⟨57, by decide +kernel⟩

def target60 : Weights.Entry :=
  { word := [12, 10, 8, 10, 8, 8, 4], weights := [0, 1, 0, 1] }

def points60 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 9041, representative 6759.
def source61 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B000.Data.entryAt ⟨18, by decide +kernel⟩

def target61 : Weights.Entry :=
  { word := [12, 10, 8, 10, 8, 8, 12], weights := [0, 1, 0, 1] }

def points61 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 9044, representative 6799.
def source62 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B000.Data.entryAt ⟨55, by decide +kernel⟩

def target62 : Weights.Entry :=
  { word := [12, 10, 8, 10, 8, 12, 4], weights := [1, 2, 1, 2] }

def points62 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 9047, representative 6869.
def source63 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B000.Data.entryAt ⟨123, by decide +kernel⟩

def target63 : Weights.Entry :=
  { word := [12, 10, 8, 12, 4, 4, 8], weights := [1, 1, 1, 1] }

def points63 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 9049, representative 6867.
def source64 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B000.Data.entryAt ⟨121, by decide +kernel⟩

def target64 : Weights.Entry :=
  { word := [12, 10, 8, 12, 4, 12, 8], weights := [1, 1, 1, 1] }

def points64 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 9051, representative 6868.
def source65 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B000.Data.entryAt ⟨122, by decide +kernel⟩

def target65 : Weights.Entry :=
  { word := [12, 10, 8, 12, 12, 4, 8], weights := [1, 1, 1, 1] }

def points65 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 9053, representative 6866.
def source66 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B000.Data.entryAt ⟨120, by decide +kernel⟩

def target66 : Weights.Entry :=
  { word := [12, 10, 8, 12, 12, 12, 8], weights := [1, 1, 1, 1] }

def points66 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 9068, representative 6794.
def source67 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B000.Data.entryAt ⟨50, by decide +kernel⟩

def target67 : Weights.Entry :=
  { word := [12, 12, 8, 8, 1, 12, 10], weights := [1, 0, 1, 1] }

def points67 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 9069, representative 6794.
def source68 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B000.Data.entryAt ⟨50, by decide +kernel⟩

def target68 : Weights.Entry :=
  { word := [12, 12, 8, 8, 1, 12, 12], weights := [1, 0, 1, 1] }

def points68 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 9078, representative 6789.
def source69 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B000.Data.entryAt ⟨46, by decide +kernel⟩

def target69 : Weights.Entry :=
  { word := [12, 12, 8, 8, 9, 12, 12], weights := [1, 0, 1, 1] }

def points69 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 10, original row 306, representative 6745.
def source70 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B000.Data.entryAt ⟨5, by decide +kernel⟩

def target70 : Weights.Entry :=
  { word := [0, 2, 0, 8, 8, 4, 6], weights := [0, 1, 0, 1] }

def points70 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 10, original row 313, representative 6858.
def source71 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B000.Data.entryAt ⟨113, by decide +kernel⟩

def target71 : Weights.Entry :=
  { word := [0, 2, 0, 8, 9, 12, 12], weights := [0, 1, 1, 0] }

def points71 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 10, original row 415, representative 6853.
def source72 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B000.Data.entryAt ⟨108, by decide +kernel⟩

def target72 : Weights.Entry :=
  { word := [0, 2, 8, 8, 4, 12, 12], weights := [0, 1, 0, 1] }

def points72 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 10, original row 420, representative 6851.
def source73 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B000.Data.entryAt ⟨106, by decide +kernel⟩

def target73 : Weights.Entry :=
  { word := [0, 2, 8, 8, 12, 12, 12], weights := [0, 1, 0, 1] }

def points73 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 10, original row 765, representative 6872.
def source74 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B000.Data.entryAt ⟨126, by decide +kernel⟩

def target74 : Weights.Entry :=
  { word := [0, 6, 2, 8, 8, 12, 10], weights := [0, 1, 1, 0] }

def points74 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 10, original row 792, representative 6871.
def source75 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B000.Data.entryAt ⟨125, by decide +kernel⟩

def target75 : Weights.Entry :=
  { word := [0, 6, 10, 8, 8, 12, 10], weights := [0, 1, 1, 0] }

def points75 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 10, original row 864, representative 6746.
def source76 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B000.Data.entryAt ⟨6, by decide +kernel⟩

def target76 : Weights.Entry :=
  { word := [0, 8, 0, 8, 8, 4, 6], weights := [0, 1, 0, 1] }

def points76 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 10, original row 1149, representative 6863.
def source77 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B000.Data.entryAt ⟨118, by decide +kernel⟩

def target77 : Weights.Entry :=
  { word := [0, 9, 0, 4, 0, 12, 12], weights := [1, 0, 1, 2] }

def points77 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 10, original row 1175, representative 6861.
def source78 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B000.Data.entryAt ⟨116, by decide +kernel⟩

def target78 : Weights.Entry :=
  { word := [0, 9, 0, 4, 8, 12, 12], weights := [1, 0, 0, 1] }

def points78 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 10, original row 1209, representative 6864.
def source79 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B000.Data.entryAt ⟨119, by decide +kernel⟩

def target79 : Weights.Entry :=
  { word := [0, 9, 0, 12, 0, 12, 12], weights := [1, 0, 1, 0] }

def points79 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 10, original row 1234, representative 6862.
def source80 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B000.Data.entryAt ⟨117, by decide +kernel⟩

def target80 : Weights.Entry :=
  { word := [0, 9, 0, 12, 8, 12, 12], weights := [1, 0, 1, 0] }

def points80 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 10, original row 1341, representative 6863.
def source81 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B000.Data.entryAt ⟨118, by decide +kernel⟩

def target81 : Weights.Entry :=
  { word := [0, 10, 0, 0, 1, 12, 12], weights := [0, 1, 1, 2] }

def points81 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 10, original row 1343, representative 6856.
def source82 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B000.Data.entryAt ⟨111, by decide +kernel⟩

def target82 : Weights.Entry :=
  { word := [0, 10, 0, 0, 9, 12, 12], weights := [0, 1, 1, 2] }

def points82 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 10, original row 1351, representative 6864.
def source83 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B000.Data.entryAt ⟨119, by decide +kernel⟩

def target83 : Weights.Entry :=
  { word := [0, 10, 0, 8, 1, 12, 12], weights := [0, 1, 1, 0] }

def points83 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 10, original row 1355, representative 6744.
def source84 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B000.Data.entryAt ⟨4, by decide +kernel⟩

def target84 : Weights.Entry :=
  { word := [0, 10, 0, 8, 8, 4, 6], weights := [0, 1, 0, 1] }

def points84 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 10, original row 1362, representative 6857.
def source85 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B000.Data.entryAt ⟨112, by decide +kernel⟩

def target85 : Weights.Entry :=
  { word := [0, 10, 0, 8, 9, 12, 12], weights := [0, 1, 1, 0] }

def points85 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 10, original row 1407, representative 6873.
def source86 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B000.Data.entryAt ⟨127, by decide +kernel⟩

def target86 : Weights.Entry :=
  { word := [0, 10, 2, 2, 8, 12, 10], weights := [0, 1, 0, 1] }

def points86 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 10, original row 1447, representative 6852.
def source87 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B000.Data.entryAt ⟨107, by decide +kernel⟩

def target87 : Weights.Entry :=
  { word := [0, 10, 8, 8, 4, 12, 12], weights := [0, 1, 0, 1] }

def points87 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 10, original row 1452, representative 6850.
def source88 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B000.Data.entryAt ⟨105, by decide +kernel⟩

def target88 : Weights.Entry :=
  { word := [0, 10, 8, 8, 12, 12, 12], weights := [0, 1, 0, 1] }

def points88 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 10, original row 4076, representative 6745.
def source89 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B000.Data.entryAt ⟨5, by decide +kernel⟩

def target89 : Weights.Entry :=
  { word := [6, 2, 8, 8, 0, 4, 0], weights := [1, 0, 1, 0] }

def points89 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 10, original row 4077, representative 6746.
def source90 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B000.Data.entryAt ⟨6, by decide +kernel⟩

def target90 : Weights.Entry :=
  { word := [6, 2, 8, 8, 0, 8, 0], weights := [1, 0, 1, 0] }

def points90 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 10, original row 4078, representative 6744.
def source91 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B000.Data.entryAt ⟨4, by decide +kernel⟩

def target91 : Weights.Entry :=
  { word := [6, 2, 8, 8, 0, 12, 0], weights := [1, 0, 1, 0] }

def points91 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 10, original row 8180, representative 6863.
def source92 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B000.Data.entryAt ⟨118, by decide +kernel⟩

def target92 : Weights.Entry :=
  { word := [10, 10, 0, 1, 0, 12, 0], weights := [2, 1, 1, 0] }

def points92 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 5), (4, 6), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 10, original row 8182, representative 6863.
def source93 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B000.Data.entryAt ⟨118, by decide +kernel⟩

def target93 : Weights.Entry :=
  { word := [10, 10, 0, 2, 0, 8, 1], weights := [2, 1, 0, 1] }

def points93 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 10, original row 8188, representative 6864.
def source94 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B000.Data.entryAt ⟨119, by decide +kernel⟩

def target94 : Weights.Entry :=
  { word := [10, 10, 0, 9, 0, 12, 0], weights := [0, 1, 1, 0] }

def points94 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 5), (4, 6), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 10, original row 8209, representative 6864.
def source95 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B000.Data.entryAt ⟨119, by decide +kernel⟩

def target95 : Weights.Entry :=
  { word := [10, 10, 0, 10, 0, 8, 1], weights := [0, 1, 0, 1] }

def points95 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 10, original row 8245, representative 6853.
def source96 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B000.Data.entryAt ⟨108, by decide +kernel⟩

def target96 : Weights.Entry :=
  { word := [10, 10, 2, 8, 8, 4, 0], weights := [1, 0, 1, 0] }

def points96 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 10, original row 8247, representative 6852.
def source97 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B000.Data.entryAt ⟨107, by decide +kernel⟩

def target97 : Weights.Entry :=
  { word := [10, 10, 2, 8, 8, 12, 0], weights := [1, 0, 1, 0] }

def points97 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 10, original row 8260, representative 6856.
def source98 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B000.Data.entryAt ⟨111, by decide +kernel⟩

def target98 : Weights.Entry :=
  { word := [10, 10, 8, 1, 0, 12, 0], weights := [2, 1, 1, 0] }

def points98 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 10, original row 8266, representative 6861.
def source99 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B000.Data.entryAt ⟨116, by decide +kernel⟩

def target99 : Weights.Entry :=
  { word := [10, 10, 8, 2, 0, 8, 1], weights := [1, 0, 0, 1] }

def points99 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 10, original row 8294, representative 6858.
def source100 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B000.Data.entryAt ⟨113, by decide +kernel⟩

def target100 : Weights.Entry :=
  { word := [10, 10, 8, 9, 0, 4, 0], weights := [0, 1, 1, 0] }

def points100 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 10, original row 8297, representative 6857.
def source101 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B000.Data.entryAt ⟨112, by decide +kernel⟩

def target101 : Weights.Entry :=
  { word := [10, 10, 8, 9, 0, 12, 0], weights := [0, 1, 1, 0] }

def points101 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 10, original row 8316, representative 6862.
def source102 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B000.Data.entryAt ⟨117, by decide +kernel⟩

def target102 : Weights.Entry :=
  { word := [10, 10, 8, 10, 0, 8, 1], weights := [0, 1, 0, 1] }

def points102 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 10, original row 8389, representative 6851.
def source103 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B000.Data.entryAt ⟨106, by decide +kernel⟩

def target103 : Weights.Entry :=
  { word := [10, 10, 10, 8, 8, 4, 0], weights := [1, 0, 1, 0] }

def points103 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 10, original row 8391, representative 6850.
def source104 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B000.Data.entryAt ⟨105, by decide +kernel⟩

def target104 : Weights.Entry :=
  { word := [10, 10, 10, 8, 8, 12, 0], weights := [1, 0, 1, 0] }

def points104 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 10, original row 9027, representative 6873.
def source105 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B000.Data.entryAt ⟨127, by decide +kernel⟩

def target105 : Weights.Entry :=
  { word := [12, 10, 8, 4, 4, 12, 0], weights := [1, 0, 1, 0] }

def points105 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 10, original row 9031, representative 6872.
def source106 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B000.Data.entryAt ⟨126, by decide +kernel⟩

def target106 : Weights.Entry :=
  { word := [12, 10, 8, 8, 4, 6, 0], weights := [0, 1, 1, 0] }

def points106 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 10, original row 9034, representative 6871.
def source107 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B000.Data.entryAt ⟨125, by decide +kernel⟩

def target107 : Weights.Entry :=
  { word := [12, 10, 8, 8, 12, 6, 0], weights := [0, 1, 1, 0] }

def points107 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

def period9Entries : List Weights.Entry := [target0, target1, target2, target3, target4, target5, target6, target7, target8, target9, target10, target11, target12, target13, target14, target15, target16, target17, target18, target19, target20, target21, target22, target23, target24, target25, target26, target27, target28, target29, target30, target31, target32, target33, target34, target35, target36, target37, target38, target39, target40, target41, target42, target43, target44, target45, target46, target47, target48, target49, target50, target51, target52, target53, target54, target55, target56, target57, target58, target59, target60, target61, target62, target63, target64, target65, target66, target67, target68, target69]

def period9Chunk : RowCoverage.Chunk where
  rows := [⟨8372, target0⟩, ⟨8382, target1⟩, ⟨8383, target2⟩, ⟨8384, target3⟩, ⟨8387, target4⟩, ⟨8389, target5⟩, ⟨8391, target6⟩, ⟨8394, target7⟩, ⟨8396, target8⟩, ⟨8397, target9⟩, ⟨8398, target10⟩, ⟨8412, target11⟩, ⟨8416, target12⟩, ⟨8426, target13⟩, ⟨8472, target14⟩, ⟨8473, target15⟩, ⟨8481, target16⟩, ⟨8503, target17⟩, ⟨8507, target18⟩, ⟨8565, target19⟩, ⟨8566, target20⟩, ⟨8574, target21⟩, ⟨8590, target22⟩, ⟨8680, target23⟩, ⟨8703, target24⟩, ⟨8704, target25⟩, ⟨8713, target26⟩, ⟨8760, target27⟩, ⟨8803, target28⟩, ⟨8874, target29⟩, ⟨8982, target30⟩, ⟨8989, target31⟩, ⟨8990, target32⟩, ⟨8991, target33⟩, ⟨8992, target34⟩, ⟨8993, target35⟩, ⟨8994, target36⟩, ⟨8995, target37⟩, ⟨8996, target38⟩, ⟨8997, target39⟩, ⟨8998, target40⟩, ⟨8999, target41⟩, ⟨9000, target42⟩, ⟨9001, target43⟩, ⟨9002, target44⟩, ⟨9003, target45⟩, ⟨9006, target46⟩, ⟨9008, target47⟩, ⟨9009, target48⟩, ⟨9010, target49⟩, ⟨9014, target50⟩, ⟨9016, target51⟩, ⟨9017, target52⟩, ⟨9018, target53⟩, ⟨9022, target54⟩, ⟨9023, target55⟩, ⟨9027, target56⟩, ⟨9031, target57⟩, ⟨9034, target58⟩, ⟨9039, target59⟩, ⟨9040, target60⟩, ⟨9041, target61⟩, ⟨9044, target62⟩, ⟨9047, target63⟩, ⟨9049, target64⟩, ⟨9051, target65⟩, ⟨9053, target66⟩, ⟨9068, target67⟩, ⟨9069, target68⟩, ⟨9078, target69⟩]
  indexMask := 564379384721492847079700439098871748729664010891180042108743129918016529032762895567654148306711361805394142100419841775808613721087457392692559940791676703720145114419312418512881741493112485180405965543263277526578023523774556970280573172484758558993279252900113969432663318890665191669322208102591659928249323139679835956450733978211015205885262912099426063925815611445767612053364138500262923072927554213704460627197538708235530756212820029952367351702375640267377746224740799996007677219646983238543427136470927211684973105361716795562928055717664215995279438918346705552518674293650936409995202454583629582140111911091386791515175961105930444688941067245255263085712792793378239810075103434074783063203801926719966277779503952371460528740540349154324347025788996490318105312330607725708981452593469964232697338592204777742336893123163542554353883832019252036203444690580793892434952688541486597479142456316491914158830370646371065645560344029003911524946706159405463288438845577588548149014078428864599363779933028405329995674410971575240964073544983324483457414394769252598596053580586393529282277233326407405219385475074204030494399693399573802330572516043915079054292525728896182835132015901873495171165905931006533825169372336357931136250509723686082038430672326880807106726437876169287486099032616466855497244864138824017766145266533062365412232694351827417990440539666667449616048034508895028711202009115209315441084348637444367636402336129997363084043439959678148435571112265393402596437884838103408338282934309888494207929638594004437651808082624268166449772688377222754648995574807169953395715656174432547744795381222003377249390164767807117623170017473749276238518597013821418241726928572756223523364352636348811359733189176090567487246959968395019947879841582176242870755590263213771904605487111253389856987477066285711526289755799592576934798696480743457359426438821050153162265920285006847437927541196979812282749550231175847406134701757269125552803800541942272927369335180224082154036385734166558578800085395919088477961038355392617174067327670374672395249510859141378940316183713555063614975663420687680176216837955101227883118919797060105969926974718537077120206006122834897001940564668198360388918331736118894347030645349462997117270392258491710901973401097713824802085284703887643646757941459242002325229084694249165775766814936894465551916480028061869642790412569699455402998376364935324531240744309254350230540037978990303783658698136495179053608837943259571473223475145986036593652630179548440524658405944083510676493422821750239492667016044283726870428532719446251059408813780060027996566984357151078498806648029171465237068311877473974211169057888921940854931532404109567643687428659770281545577036513280
  count := 70

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

def period10Entries : List Weights.Entry := [target70, target71, target72, target73, target74, target75, target76, target77, target78, target79, target80, target81, target82, target83, target84, target85, target86, target87, target88, target89, target90, target91, target92, target93, target94, target95, target96, target97, target98, target99, target100, target101, target102, target103, target104, target105, target106, target107]

def period10Chunk : RowCoverage.Chunk where
  rows := [⟨306, target70⟩, ⟨313, target71⟩, ⟨415, target72⟩, ⟨420, target73⟩, ⟨765, target74⟩, ⟨792, target75⟩, ⟨864, target76⟩, ⟨1149, target77⟩, ⟨1175, target78⟩, ⟨1209, target79⟩, ⟨1234, target80⟩, ⟨1341, target81⟩, ⟨1343, target82⟩, ⟨1351, target83⟩, ⟨1355, target84⟩, ⟨1362, target85⟩, ⟨1407, target86⟩, ⟨1447, target87⟩, ⟨1452, target88⟩, ⟨4076, target89⟩, ⟨4077, target90⟩, ⟨4078, target91⟩, ⟨8180, target92⟩, ⟨8182, target93⟩, ⟨8188, target94⟩, ⟨8209, target95⟩, ⟨8245, target96⟩, ⟨8247, target97⟩, ⟨8260, target98⟩, ⟨8266, target99⟩, ⟨8294, target100⟩, ⟨8297, target101⟩, ⟨8316, target102⟩, ⟨8389, target103⟩, ⟨8391, target104⟩, ⟨9027, target105⟩, ⟨9031, target106⟩, ⟨9034, target107⟩]
  indexMask := 36235884024101773150161277911875729084560144767773831727146765185433045976449447622958894182434724834720634279842858291936808652954915425154235415545526530051264551829247964526145139056026148354042273343997941531345011947537217251968124241286601194118774000368350447898791779509925054507019066460818825239259546298113385105412745216715046164887473879487184933666488301717291920657563110653798064328275089777638060554076225703152358959911857199720211648469702897711577271004102831703964520379895563976662183223035092542851975521765114935689464347964241165130031945308213858080634075534106040727617860837519201768082185028495356811336823941007375230275704486650849010982933526737823532749811824986957594419649885254659771949253320524731363554548632085710690844984790534521604947626005419216186017960212481431637369416008625465768146842505528159141810230718729081119646919674895504137457971582005435932532281399271589811371401017916663634584584928334740132607067710995630867240663634568016089002991096217191289082947575115401704980466612825186114914882202331947738459520769011480650285809256813955228902457174391828280116948496311147713054646312363952643354350359826308473190618343963772070992584514671255422596390388187675073029273642343323665894284818275702895407391609309670590228414527409256508449143938473267761828871440346918928960574316425608915142271809711008625292635594292630588661418196174438615146276195141282674512532102273699716783355179020237048039380925380274685279964538310040090879358912686594806472623730484317439587867207982678393823439945793962073376182002169075306454073533807575144462738212100491685152122872495752806521851324174677852947336111590693250459938722892249165616453418427677007335315851243765018411638585532260814242192744297024389917787776122943506863448766215611414520798729888129468658272086374358713143514884216285994588750994898134833584569122839507406297190455967516852801276931722794593273777882558067923902613275383616866338761774427196618461536482397219843832956444141842747620813817545864599503093063973220269761193742082156065705903702741221868231734270209564981518171857887349447913365179504819490610557587647547778915473165587334051436795227963283535076358252097916184867180857955796522986502122693174200178908425970743890786742911453578130553889742576260135908637862517845771438827334734653607155205759220334327407333457316154811192845547531269274834090153194793618771052397971515129758057879918052260476293796314730642049809401310888854237467685809528932485991384521791122018419121643630539000200814849413889983755614466380077257033750805646620094911023709208438074658682004038261659045389904962115853323989874265132110395063911096310403186060305428351352166126831129329664
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

end FranklSmallCyclic.TransportBatches.G053.B002.Data
