module

public import Conjectures.FranklSmallCyclicRowCoverage
public import Conjectures.FranklSmallCyclicCanonicalWords
public import Conjectures.FranklSmallCyclicOrbit10Block003Data

/-! 49 literal targets sharing one source proof block.
Original words and row indices are retained; weights may be transported.
-/
@[expose] public section

namespace FranklSmallCyclic.TransportBatches.G081.B001.Data

-- Period 10, original row 7776, representative 9670.
def source0 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B003.Data.entryAt ⟨30, by decide +kernel⟩

def target0 : Weights.Entry :=
  { word := [10, 2, 8, 12, 12, 4, 8], weights := [1, 1, 1, 1] }

def points0 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 7778, representative 9668.
def source1 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B003.Data.entryAt ⟨28, by decide +kernel⟩

def target1 : Weights.Entry :=
  { word := [10, 2, 8, 12, 12, 12, 8], weights := [1, 1, 1, 1] }

def points1 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 7798, representative 9679.
def source2 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B003.Data.entryAt ⟨39, by decide +kernel⟩

def target2 : Weights.Entry :=
  { word := [10, 2, 10, 8, 9, 0, 4], weights := [1, 1, 0, 1] }

def points2 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8032, representative 9644.
def source3 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B003.Data.entryAt ⟨4, by decide +kernel⟩

def target3 : Weights.Entry :=
  { word := [10, 8, 8, 8, 1, 4, 10], weights := [1, 0, 1, 1] }

def points3 : List (ℕ × ℕ) := [(0, 9), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8033, representative 9644.
def source4 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B003.Data.entryAt ⟨4, by decide +kernel⟩

def target4 : Weights.Entry :=
  { word := [10, 8, 8, 8, 1, 4, 12], weights := [1, 0, 1, 1] }

def points4 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8107, representative 9641.
def source5 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B003.Data.entryAt ⟨1, by decide +kernel⟩

def target5 : Weights.Entry :=
  { word := [10, 8, 9, 8, 1, 4, 10], weights := [1, 0, 1, 1] }

def points5 : List (ℕ × ℕ) := [(0, 9), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8108, representative 9641.
def source6 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B003.Data.entryAt ⟨1, by decide +kernel⟩

def target6 : Weights.Entry :=
  { word := [10, 8, 9, 8, 1, 4, 12], weights := [1, 0, 1, 1] }

def points6 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8581, representative 9649.
def source7 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B003.Data.entryAt ⟨9, by decide +kernel⟩

def target7 : Weights.Entry :=
  { word := [12, 2, 0, 9, 0, 4, 8], weights := [1, 1, 2, 0] }

def points7 : List (ℕ × ℕ) := [(0, 9), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8584, representative 9648.
def source8 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B003.Data.entryAt ⟨8, by decide +kernel⟩

def target8 : Weights.Entry :=
  { word := [12, 2, 0, 9, 0, 12, 8], weights := [1, 1, 2, 0] }

def points8 : List (ℕ × ℕ) := [(0, 9), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8585, representative 9695.
def source9 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B003.Data.entryAt ⟨55, by decide +kernel⟩

def target9 : Weights.Entry :=
  { word := [12, 2, 0, 9, 8, 1, 4], weights := [1, 1, 0, 1] }

def points9 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8586, representative 9643.
def source10 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B003.Data.entryAt ⟨3, by decide +kernel⟩

def target10 : Weights.Entry :=
  { word := [12, 2, 0, 9, 8, 1, 12], weights := [1, 1, 0, 1] }

def points10 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8587, representative 9694.
def source11 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B003.Data.entryAt ⟨54, by decide +kernel⟩

def target11 : Weights.Entry :=
  { word := [12, 2, 0, 9, 8, 2, 2], weights := [1, 1, 0, 1] }

def points11 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8588, representative 9642.
def source12 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B003.Data.entryAt ⟨2, by decide +kernel⟩

def target12 : Weights.Entry :=
  { word := [12, 2, 0, 9, 8, 2, 10], weights := [1, 1, 0, 1] }

def points12 : List (ℕ × ℕ) := [(0, 0), (1, 2), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8), (9, 9)]

-- Period 10, original row 8589, representative 9696.
def source13 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B003.Data.entryAt ⟨56, by decide +kernel⟩

def target13 : Weights.Entry :=
  { word := [12, 2, 0, 9, 8, 8, 4], weights := [1, 1, 0, 1] }

def points13 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8591, representative 9644.
def source14 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B003.Data.entryAt ⟨4, by decide +kernel⟩

def target14 : Weights.Entry :=
  { word := [12, 2, 0, 9, 8, 8, 12], weights := [1, 1, 0, 1] }

def points14 : List (ℕ × ℕ) := [(0, 0), (1, 2), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8), (9, 9)]

-- Period 10, original row 8592, representative 9693.
def source15 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B003.Data.entryAt ⟨53, by decide +kernel⟩

def target15 : Weights.Entry :=
  { word := [12, 2, 0, 9, 8, 9, 4], weights := [1, 1, 0, 1] }

def points15 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8593, representative 9641.
def source16 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B003.Data.entryAt ⟨1, by decide +kernel⟩

def target16 : Weights.Entry :=
  { word := [12, 2, 0, 9, 8, 9, 12], weights := [1, 1, 0, 1] }

def points16 : List (ℕ × ℕ) := [(0, 0), (1, 2), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8), (9, 9)]

-- Period 10, original row 8594, representative 9692.
def source17 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B003.Data.entryAt ⟨52, by decide +kernel⟩

def target17 : Weights.Entry :=
  { word := [12, 2, 0, 9, 8, 10, 2], weights := [1, 1, 0, 1] }

def points17 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8595, representative 9640.
def source18 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B003.Data.entryAt ⟨0, by decide +kernel⟩

def target18 : Weights.Entry :=
  { word := [12, 2, 0, 9, 8, 10, 10], weights := [1, 1, 0, 1] }

def points18 : List (ℕ × ℕ) := [(0, 0), (1, 2), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8), (9, 9)]

-- Period 10, original row 8605, representative 9661.
def source19 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B003.Data.entryAt ⟨21, by decide +kernel⟩

def target19 : Weights.Entry :=
  { word := [12, 2, 0, 10, 0, 8, 4], weights := [0, 1, 0, 1] }

def points19 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8609, representative 9662.
def source20 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B003.Data.entryAt ⟨22, by decide +kernel⟩

def target20 : Weights.Entry :=
  { word := [12, 2, 0, 10, 8, 0, 4], weights := [0, 1, 0, 1] }

def points20 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8611, representative 9660.
def source21 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B003.Data.entryAt ⟨20, by decide +kernel⟩

def target21 : Weights.Entry :=
  { word := [12, 2, 0, 10, 8, 8, 4], weights := [0, 1, 0, 1] }

def points21 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8615, representative 9686.
def source22 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B003.Data.entryAt ⟨46, by decide +kernel⟩

def target22 : Weights.Entry :=
  { word := [12, 2, 0, 12, 10, 0, 4], weights := [1, 1, 0, 1] }

def points22 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8622, representative 9697.
def source23 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B003.Data.entryAt ⟨57, by decide +kernel⟩

def target23 : Weights.Entry :=
  { word := [12, 2, 8, 2, 0, 1, 8], weights := [0, 1, 0, 1] }

def points23 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8624, representative 9697.
def source24 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B003.Data.entryAt ⟨57, by decide +kernel⟩

def target24 : Weights.Entry :=
  { word := [12, 2, 8, 2, 0, 2, 8], weights := [0, 1, 0, 1] }

def points24 : List (ℕ × ℕ) := [(0, 7), (1, 9), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8627, representative 9650.
def source25 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B003.Data.entryAt ⟨10, by decide +kernel⟩

def target25 : Weights.Entry :=
  { word := [12, 2, 8, 2, 0, 8, 2], weights := [0, 1, 0, 1] }

def points25 : List (ℕ × ℕ) := [(0, 9), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8628, representative 9650.
def source26 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B003.Data.entryAt ⟨10, by decide +kernel⟩

def target26 : Weights.Entry :=
  { word := [12, 2, 8, 2, 0, 8, 4], weights := [0, 1, 0, 1] }

def points26 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8634, representative 9698.
def source27 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B003.Data.entryAt ⟨58, by decide +kernel⟩

def target27 : Weights.Entry :=
  { word := [12, 2, 8, 2, 0, 9, 8], weights := [0, 1, 0, 1] }

def points27 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8636, representative 9698.
def source28 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B003.Data.entryAt ⟨58, by decide +kernel⟩

def target28 : Weights.Entry :=
  { word := [12, 2, 8, 2, 0, 10, 8], weights := [0, 1, 0, 1] }

def points28 : List (ℕ × ℕ) := [(0, 9), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8638, representative 9702.
def source29 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B003.Data.entryAt ⟨62, by decide +kernel⟩

def target29 : Weights.Entry :=
  { word := [12, 2, 8, 2, 8, 2, 8], weights := [0, 1, 0, 1] }

def points29 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8639, representative 9651.
def source30 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B003.Data.entryAt ⟨11, by decide +kernel⟩

def target30 : Weights.Entry :=
  { word := [12, 2, 8, 2, 8, 8, 4], weights := [0, 1, 0, 1] }

def points30 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8642, representative 9699.
def source31 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B003.Data.entryAt ⟨59, by decide +kernel⟩

def target31 : Weights.Entry :=
  { word := [12, 2, 8, 2, 8, 10, 8], weights := [0, 1, 0, 1] }

def points31 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8660, representative 9653.
def source32 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B003.Data.entryAt ⟨13, by decide +kernel⟩

def target32 : Weights.Entry :=
  { word := [12, 2, 8, 10, 0, 8, 2], weights := [0, 1, 0, 1] }

def points32 : List (ℕ × ℕ) := [(0, 9), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8661, representative 9653.
def source33 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B003.Data.entryAt ⟨13, by decide +kernel⟩

def target33 : Weights.Entry :=
  { word := [12, 2, 8, 10, 0, 8, 4], weights := [0, 1, 0, 1] }

def points33 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8667, representative 9701.
def source34 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B003.Data.entryAt ⟨61, by decide +kernel⟩

def target34 : Weights.Entry :=
  { word := [12, 2, 8, 10, 0, 9, 8], weights := [0, 1, 0, 1] }

def points34 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8669, representative 9701.
def source35 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B003.Data.entryAt ⟨61, by decide +kernel⟩

def target35 : Weights.Entry :=
  { word := [12, 2, 8, 10, 0, 10, 8], weights := [0, 1, 0, 1] }

def points35 : List (ℕ × ℕ) := [(0, 9), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8672, representative 9703.
def source36 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B003.Data.entryAt ⟨63, by decide +kernel⟩

def target36 : Weights.Entry :=
  { word := [12, 2, 8, 10, 8, 2, 8], weights := [0, 1, 0, 1] }

def points36 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8674, representative 9667.
def source37 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B003.Data.entryAt ⟨27, by decide +kernel⟩

def target37 : Weights.Entry :=
  { word := [12, 2, 8, 10, 8, 6, 8], weights := [1, 1, 1, 1] }

def points37 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8675, representative 9652.
def source38 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B003.Data.entryAt ⟨12, by decide +kernel⟩

def target38 : Weights.Entry :=
  { word := [12, 2, 8, 10, 8, 8, 4], weights := [0, 1, 0, 1] }

def points38 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8678, representative 9700.
def source39 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B003.Data.entryAt ⟨60, by decide +kernel⟩

def target39 : Weights.Entry :=
  { word := [12, 2, 8, 10, 8, 10, 8], weights := [0, 1, 0, 1] }

def points39 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8679, representative 9647.
def source40 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B003.Data.entryAt ⟨7, by decide +kernel⟩

def target40 : Weights.Entry :=
  { word := [12, 2, 8, 10, 8, 12, 4], weights := [1, 2, 1, 2] }

def points40 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8682, representative 9666.
def source41 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B003.Data.entryAt ⟨26, by decide +kernel⟩

def target41 : Weights.Entry :=
  { word := [12, 2, 8, 12, 4, 4, 8], weights := [1, 1, 1, 1] }

def points41 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8684, representative 9664.
def source42 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B003.Data.entryAt ⟨24, by decide +kernel⟩

def target42 : Weights.Entry :=
  { word := [12, 2, 8, 12, 4, 12, 8], weights := [1, 1, 1, 1] }

def points42 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8686, representative 9665.
def source43 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B003.Data.entryAt ⟨25, by decide +kernel⟩

def target43 : Weights.Entry :=
  { word := [12, 2, 8, 12, 12, 4, 8], weights := [1, 1, 1, 1] }

def points43 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8688, representative 9663.
def source44 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B003.Data.entryAt ⟨23, by decide +kernel⟩

def target44 : Weights.Entry :=
  { word := [12, 2, 8, 12, 12, 12, 8], weights := [1, 1, 1, 1] }

def points44 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8698, representative 9642.
def source45 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B003.Data.entryAt ⟨2, by decide +kernel⟩

def target45 : Weights.Entry :=
  { word := [12, 4, 8, 8, 1, 4, 10], weights := [1, 0, 1, 1] }

def points45 : List (ℕ × ℕ) := [(0, 9), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8699, representative 9642.
def source46 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B003.Data.entryAt ⟨2, by decide +kernel⟩

def target46 : Weights.Entry :=
  { word := [12, 4, 8, 8, 1, 4, 12], weights := [1, 0, 1, 1] }

def points46 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 9063, representative 9640.
def source47 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B003.Data.entryAt ⟨0, by decide +kernel⟩

def target47 : Weights.Entry :=
  { word := [12, 12, 8, 8, 1, 4, 10], weights := [1, 0, 1, 1] }

def points47 : List (ℕ × ℕ) := [(0, 9), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 9064, representative 9640.
def source48 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B003.Data.entryAt ⟨0, by decide +kernel⟩

def target48 : Weights.Entry :=
  { word := [12, 12, 8, 8, 1, 4, 12], weights := [1, 0, 1, 1] }

def points48 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

def period10Entries : List Weights.Entry := [target0, target1, target2, target3, target4, target5, target6, target7, target8, target9, target10, target11, target12, target13, target14, target15, target16, target17, target18, target19, target20, target21, target22, target23, target24, target25, target26, target27, target28, target29, target30, target31, target32, target33, target34, target35, target36, target37, target38, target39, target40, target41, target42, target43, target44, target45, target46, target47, target48]

def period10Chunk : RowCoverage.Chunk where
  rows := [⟨7776, target0⟩, ⟨7778, target1⟩, ⟨7798, target2⟩, ⟨8032, target3⟩, ⟨8033, target4⟩, ⟨8107, target5⟩, ⟨8108, target6⟩, ⟨8581, target7⟩, ⟨8584, target8⟩, ⟨8585, target9⟩, ⟨8586, target10⟩, ⟨8587, target11⟩, ⟨8588, target12⟩, ⟨8589, target13⟩, ⟨8591, target14⟩, ⟨8592, target15⟩, ⟨8593, target16⟩, ⟨8594, target17⟩, ⟨8595, target18⟩, ⟨8605, target19⟩, ⟨8609, target20⟩, ⟨8611, target21⟩, ⟨8615, target22⟩, ⟨8622, target23⟩, ⟨8624, target24⟩, ⟨8627, target25⟩, ⟨8628, target26⟩, ⟨8634, target27⟩, ⟨8636, target28⟩, ⟨8638, target29⟩, ⟨8639, target30⟩, ⟨8642, target31⟩, ⟨8660, target32⟩, ⟨8661, target33⟩, ⟨8667, target34⟩, ⟨8669, target35⟩, ⟨8672, target36⟩, ⟨8674, target37⟩, ⟨8675, target38⟩, ⟨8678, target39⟩, ⟨8679, target40⟩, ⟨8682, target41⟩, ⟨8684, target42⟩, ⟨8686, target43⟩, ⟨8688, target44⟩, ⟨8698, target45⟩, ⟨8699, target46⟩, ⟨9063, target47⟩, ⟨9064, target48⟩]
  indexMask := 51519537707641155792183255974755341164471781624037778314825672341062501980639370064951190929395354754168539430744279300331928542275105532329788828967698390746844391693547739764763344836229413641324733145473553421339696216996207499886485914043866172664655348342229290347814727518798718417710247192912206162622630470672506291571348087315225153002826459304216570226071933528499462449242043881569906454114926080104209725543642429197699041050296785530416625713958410487699773000217668655155918461432750093404273313414055294742012548358103727953476678350595438066638696096840619411305249295688284635693835689254334422264604560284191100274161551398926003846753727634150605611183501582340487995096454213283478360630056652014096301242528520183836392008031766829037661653364423964365268160286614471264343596796917487100863388191464180505449233749041331283021587522917282393091164432040774348471326340280367787402585454758300074923785537012059845753613315461570254374321224210533563688642116685578319779189248848792905336263548807794359625810813428574130055752901193277979656091067035306724646119992200823373062195117236928636677109185879582087912370330246915820865716688639758213262712520607498614802708337797450836492042591641161197564179089701145379896847253147344337010570556408201325903248104632720672067523225199658120463779081632708110486203615530831742531375621079429484260690806312615784867441697765389141937362109867676646842738474280849867386474944677030332329563636056975802478062833178190711626272094498423147535401854760608600595922372998548641202103378281267795444166077730690713103642534917132265199792435174311095140240916577226800242160785028521565483929242672046972763488610934694127590026231086988084641225750248599870990117604697749282773674301047137132236703178691211443628043432317151618800064654857126618203045619175360302357972573521393960947621629440703613790864611527426587240192339564160921169285838717073673765929929973045795171361730156594600404438464605820045921168032244242601336838104164186016100281147503255609371738314637284707886547862445002451909482518958283345775230507483228848600051353728811453503455547655527739734156073120088747356821867013520111024548463334814562369201308297828776831793116241380508844583228518795504141388690695846006369770678946549226287952844249915785655206990468003725716512411719420172280465580258140865933608716946447295884612434153854183694610896757178109210719023631132614886101639514481193764726280574819426562695581414925444206164603142148807495619215921082804398676467985022734756993940521450491048898397723192316357646538098003182970129207399854610087633401152460406659806953185709844347208481446294974387269915381357198268597318559485301739311853813144516883705233408
  count := 49

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

end FranklSmallCyclic.TransportBatches.G081.B001.Data
