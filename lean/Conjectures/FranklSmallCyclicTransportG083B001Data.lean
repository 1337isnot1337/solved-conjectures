module

public import Conjectures.FranklSmallCyclicRowCoverage
public import Conjectures.FranklSmallCyclicCanonicalWords
public import Conjectures.FranklSmallCyclicOrbit10Block005Data

/-! 88 literal targets sharing one source proof block.
Original words and row indices are retained; weights may be transported.
-/
@[expose] public section

namespace FranklSmallCyclic.TransportBatches.G083.B001.Data

-- Period 10, original row 7907, representative 9772.
def source0 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B005.Data.entryAt ⟨4, by decide +kernel⟩

def target0 : Weights.Entry :=
  { word := [10, 8, 0, 12, 10, 8, 12], weights := [1, 0, 1, 0] }

-- Period 10, original row 7926, representative 9768.
def source1 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B005.Data.entryAt ⟨0, by decide +kernel⟩

def target1 : Weights.Entry :=
  { word := [10, 8, 4, 2, 0, 8, 10], weights := [1, 0, 0, 1] }

def points1 : List (ℕ × ℕ) := [(0, 9), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 7927, representative 9768.
def source2 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B005.Data.entryAt ⟨0, by decide +kernel⟩

def target2 : Weights.Entry :=
  { word := [10, 8, 4, 2, 0, 8, 12], weights := [1, 0, 0, 1] }

def points2 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 7935, representative 9773.
def source3 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B005.Data.entryAt ⟨5, by decide +kernel⟩

def target3 : Weights.Entry :=
  { word := [10, 8, 4, 2, 8, 8, 12], weights := [1, 0, 0, 1] }

-- Period 10, original row 7953, representative 9775.
def source4 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B005.Data.entryAt ⟨7, by decide +kernel⟩

def target4 : Weights.Entry :=
  { word := [10, 8, 4, 10, 0, 8, 10], weights := [0, 1, 0, 1] }

def points4 : List (ℕ × ℕ) := [(0, 9), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 7954, representative 9775.
def source5 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B005.Data.entryAt ⟨7, by decide +kernel⟩

def target5 : Weights.Entry :=
  { word := [10, 8, 4, 10, 0, 8, 12], weights := [0, 1, 0, 1] }

def points5 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 7959, representative 9774.
def source6 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B005.Data.entryAt ⟨6, by decide +kernel⟩

def target6 : Weights.Entry :=
  { word := [10, 8, 4, 10, 8, 8, 12], weights := [1, 0, 0, 1] }

-- Period 10, original row 7961, representative 9823.
def source7 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B005.Data.entryAt ⟨55, by decide +kernel⟩

def target7 : Weights.Entry :=
  { word := [10, 8, 4, 10, 8, 12, 4], weights := [2, 2, 1, 3] }

def points7 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 7987, representative 9777.
def source8 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B005.Data.entryAt ⟨9, by decide +kernel⟩

def target8 : Weights.Entry :=
  { word := [10, 8, 8, 4, 2, 0, 9], weights := [1, 0, 0, 1] }

def points8 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 7988, representative 9777.
def source9 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B005.Data.entryAt ⟨9, by decide +kernel⟩

def target9 : Weights.Entry :=
  { word := [10, 8, 8, 4, 2, 0, 10], weights := [1, 0, 0, 1] }

def points9 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 7989, representative 9785.
def source10 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B005.Data.entryAt ⟨17, by decide +kernel⟩

def target10 : Weights.Entry :=
  { word := [10, 8, 8, 4, 2, 0, 12], weights := [1, 0, 0, 1] }

def points10 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 7994, representative 9773.
def source11 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B005.Data.entryAt ⟨5, by decide +kernel⟩

def target11 : Weights.Entry :=
  { word := [10, 8, 8, 4, 2, 8, 12], weights := [1, 0, 0, 1] }

def points11 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8008, representative 9796.
def source12 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B005.Data.entryAt ⟨28, by decide +kernel⟩

def target12 : Weights.Entry :=
  { word := [10, 8, 8, 4, 8, 12, 2], weights := [1, 0, 0, 1] }

def points12 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8009, representative 9798.
def source13 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B005.Data.entryAt ⟨30, by decide +kernel⟩

def target13 : Weights.Entry :=
  { word := [10, 8, 8, 4, 8, 12, 4], weights := [1, 0, 0, 1] }

def points13 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8017, representative 9778.
def source14 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B005.Data.entryAt ⟨10, by decide +kernel⟩

def target14 : Weights.Entry :=
  { word := [10, 8, 8, 4, 10, 0, 9], weights := [1, 0, 0, 1] }

def points14 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8018, representative 9778.
def source15 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B005.Data.entryAt ⟨10, by decide +kernel⟩

def target15 : Weights.Entry :=
  { word := [10, 8, 8, 4, 10, 0, 10], weights := [1, 0, 0, 1] }

def points15 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8019, representative 9786.
def source16 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B005.Data.entryAt ⟨18, by decide +kernel⟩

def target16 : Weights.Entry :=
  { word := [10, 8, 8, 4, 10, 0, 12], weights := [1, 0, 0, 1] }

def points16 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8024, representative 9770.
def source17 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B005.Data.entryAt ⟨2, by decide +kernel⟩

def target17 : Weights.Entry :=
  { word := [10, 8, 8, 4, 10, 8, 12], weights := [1, 0, 0, 1] }

-- Period 10, original row 8034, representative 9825.
def source18 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B005.Data.entryAt ⟨57, by decide +kernel⟩

def target18 : Weights.Entry :=
  { word := [10, 8, 8, 8, 1, 12, 2], weights := [1, 0, 1, 1] }

def points18 : List (ℕ × ℕ) := [(0, 9), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8035, representative 9825.
def source19 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B005.Data.entryAt ⟨57, by decide +kernel⟩

def target19 : Weights.Entry :=
  { word := [10, 8, 8, 8, 1, 12, 4], weights := [1, 0, 1, 1] }

def points19 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8041, representative 9824.
def source20 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B005.Data.entryAt ⟨56, by decide +kernel⟩

def target20 : Weights.Entry :=
  { word := [10, 8, 8, 8, 9, 12, 4], weights := [1, 0, 1, 1] }

def points20 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8052, representative 9800.
def source21 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B005.Data.entryAt ⟨32, by decide +kernel⟩

def target21 : Weights.Entry :=
  { word := [10, 8, 8, 12, 0, 12, 2], weights := [1, 0, 0, 1] }

def points21 : List (ℕ × ℕ) := [(0, 9), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8053, representative 9800.
def source22 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B005.Data.entryAt ⟨32, by decide +kernel⟩

def target22 : Weights.Entry :=
  { word := [10, 8, 8, 12, 0, 12, 4], weights := [1, 0, 0, 1] }

def points22 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8061, representative 9780.
def source23 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B005.Data.entryAt ⟨12, by decide +kernel⟩

def target23 : Weights.Entry :=
  { word := [10, 8, 8, 12, 2, 0, 9], weights := [1, 0, 0, 1] }

def points23 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8062, representative 9780.
def source24 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B005.Data.entryAt ⟨12, by decide +kernel⟩

def target24 : Weights.Entry :=
  { word := [10, 8, 8, 12, 2, 0, 10], weights := [1, 0, 0, 1] }

def points24 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8063, representative 9788.
def source25 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B005.Data.entryAt ⟨20, by decide +kernel⟩

def target25 : Weights.Entry :=
  { word := [10, 8, 8, 12, 2, 0, 12], weights := [1, 0, 0, 1] }

def points25 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8068, representative 9774.
def source26 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B005.Data.entryAt ⟨6, by decide +kernel⟩

def target26 : Weights.Entry :=
  { word := [10, 8, 8, 12, 2, 8, 12], weights := [1, 0, 0, 1] }

def points26 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8081, representative 9797.
def source27 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B005.Data.entryAt ⟨29, by decide +kernel⟩

def target27 : Weights.Entry :=
  { word := [10, 8, 8, 12, 8, 12, 2], weights := [1, 0, 0, 1] }

def points27 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8082, representative 9799.
def source28 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B005.Data.entryAt ⟨31, by decide +kernel⟩

def target28 : Weights.Entry :=
  { word := [10, 8, 8, 12, 8, 12, 4], weights := [1, 0, 0, 1] }

def points28 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8090, representative 9779.
def source29 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B005.Data.entryAt ⟨11, by decide +kernel⟩

def target29 : Weights.Entry :=
  { word := [10, 8, 8, 12, 10, 0, 9], weights := [1, 0, 0, 1] }

def points29 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8091, representative 9779.
def source30 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B005.Data.entryAt ⟨11, by decide +kernel⟩

def target30 : Weights.Entry :=
  { word := [10, 8, 8, 12, 10, 0, 10], weights := [1, 0, 0, 1] }

def points30 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8092, representative 9787.
def source31 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B005.Data.entryAt ⟨19, by decide +kernel⟩

def target31 : Weights.Entry :=
  { word := [10, 8, 8, 12, 10, 0, 12], weights := [1, 0, 0, 1] }

def points31 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8097, representative 9771.
def source32 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B005.Data.entryAt ⟨3, by decide +kernel⟩

def target32 : Weights.Entry :=
  { word := [10, 8, 8, 12, 10, 8, 12], weights := [1, 0, 1, 0] }

-- Period 10, original row 8109, representative 9815.
def source33 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B005.Data.entryAt ⟨47, by decide +kernel⟩

def target33 : Weights.Entry :=
  { word := [10, 8, 9, 8, 1, 12, 2], weights := [1, 0, 1, 1] }

def points33 : List (ℕ × ℕ) := [(0, 9), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8110, representative 9815.
def source34 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B005.Data.entryAt ⟨47, by decide +kernel⟩

def target34 : Weights.Entry :=
  { word := [10, 8, 9, 8, 1, 12, 4], weights := [1, 0, 1, 1] }

def points34 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8116, representative 9814.
def source35 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B005.Data.entryAt ⟨46, by decide +kernel⟩

def target35 : Weights.Entry :=
  { word := [10, 8, 9, 8, 9, 12, 4], weights := [1, 0, 1, 1] }

def points35 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8134, representative 9769.
def source36 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B005.Data.entryAt ⟨1, by decide +kernel⟩

def target36 : Weights.Entry :=
  { word := [10, 8, 12, 2, 0, 8, 10], weights := [1, 0, 0, 1] }

def points36 : List (ℕ × ℕ) := [(0, 9), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8135, representative 9769.
def source37 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B005.Data.entryAt ⟨1, by decide +kernel⟩

def target37 : Weights.Entry :=
  { word := [10, 8, 12, 2, 0, 8, 12], weights := [1, 0, 0, 1] }

def points37 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8143, representative 9770.
def source38 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B005.Data.entryAt ⟨2, by decide +kernel⟩

def target38 : Weights.Entry :=
  { word := [10, 8, 12, 2, 8, 8, 12], weights := [1, 0, 0, 1] }

def points38 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8161, representative 9772.
def source39 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B005.Data.entryAt ⟨4, by decide +kernel⟩

def target39 : Weights.Entry :=
  { word := [10, 8, 12, 10, 0, 8, 10], weights := [0, 1, 0, 1] }

def points39 : List (ℕ × ℕ) := [(0, 9), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8162, representative 9772.
def source40 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B005.Data.entryAt ⟨4, by decide +kernel⟩

def target40 : Weights.Entry :=
  { word := [10, 8, 12, 10, 0, 8, 12], weights := [0, 1, 0, 1] }

def points40 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8169, representative 9771.
def source41 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B005.Data.entryAt ⟨3, by decide +kernel⟩

def target41 : Weights.Entry :=
  { word := [10, 8, 12, 10, 8, 8, 12], weights := [0, 1, 0, 1] }

def points41 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8171, representative 9822.
def source42 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B005.Data.entryAt ⟨54, by decide +kernel⟩

def target42 : Weights.Entry :=
  { word := [10, 8, 12, 10, 8, 12, 4], weights := [2, 1, 1, 2] }

def points42 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8424, representative 9807.
def source43 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B005.Data.entryAt ⟨39, by decide +kernel⟩

def target43 : Weights.Entry :=
  { word := [12, 0, 0, 12, 0, 12, 4], weights := [0, 0, 1, 1] }

def points43 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 0), (8, 2), (9, 1)]

-- Period 10, original row 8437, representative 9776.
def source44 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B005.Data.entryAt ⟨8, by decide +kernel⟩

def target44 : Weights.Entry :=
  { word := [12, 0, 4, 2, 0, 8, 10], weights := [1, 0, 0, 1] }

def points44 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8), (9, 9)]

-- Period 10, original row 8438, representative 9776.
def source45 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B005.Data.entryAt ⟨8, by decide +kernel⟩

def target45 : Weights.Entry :=
  { word := [12, 0, 4, 2, 0, 8, 12], weights := [1, 0, 0, 1] }

def points45 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 8), (8, 7), (9, 9)]

-- Period 10, original row 8446, representative 9777.
def source46 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B005.Data.entryAt ⟨9, by decide +kernel⟩

def target46 : Weights.Entry :=
  { word := [12, 0, 4, 2, 8, 8, 12], weights := [1, 0, 0, 1] }

def points46 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8), (9, 9)]

-- Period 10, original row 8465, representative 9783.
def source47 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B005.Data.entryAt ⟨15, by decide +kernel⟩

def target47 : Weights.Entry :=
  { word := [12, 0, 4, 10, 0, 8, 10], weights := [1, 0, 0, 1] }

def points47 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8), (9, 9)]

-- Period 10, original row 8466, representative 9783.
def source48 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B005.Data.entryAt ⟨15, by decide +kernel⟩

def target48 : Weights.Entry :=
  { word := [12, 0, 4, 10, 0, 8, 12], weights := [1, 0, 0, 1] }

def points48 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 8), (8, 7), (9, 9)]

-- Period 10, original row 8469, representative 9829.
def source49 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B005.Data.entryAt ⟨61, by decide +kernel⟩

def target49 : Weights.Entry :=
  { word := [12, 0, 4, 10, 0, 12, 2], weights := [0, 1, 1, 1] }

def points49 : List (ℕ × ℕ) := [(0, 9), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 0), (9, 1)]

-- Period 10, original row 8470, representative 9829.
def source50 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B005.Data.entryAt ⟨61, by decide +kernel⟩

def target50 : Weights.Entry :=
  { word := [12, 0, 4, 10, 0, 12, 4], weights := [0, 1, 1, 1] }

def points50 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 0), (9, 1)]

-- Period 10, original row 8478, representative 9780.
def source51 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B005.Data.entryAt ⟨12, by decide +kernel⟩

def target51 : Weights.Entry :=
  { word := [12, 0, 4, 10, 8, 8, 12], weights := [1, 0, 0, 1] }

def points51 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8), (9, 9)]

-- Period 10, original row 8480, representative 9828.
def source52 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B005.Data.entryAt ⟨60, by decide +kernel⟩

def target52 : Weights.Entry :=
  { word := [12, 0, 4, 10, 8, 12, 4], weights := [0, 1, 1, 1] }

def points52 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 0), (9, 1)]

-- Period 10, original row 8526, representative 9781.
def source53 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B005.Data.entryAt ⟨13, by decide +kernel⟩

def target53 : Weights.Entry :=
  { word := [12, 0, 12, 2, 0, 8, 10], weights := [1, 0, 0, 1] }

def points53 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8), (9, 9)]

-- Period 10, original row 8527, representative 9781.
def source54 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B005.Data.entryAt ⟨13, by decide +kernel⟩

def target54 : Weights.Entry :=
  { word := [12, 0, 12, 2, 0, 8, 12], weights := [1, 0, 0, 1] }

def points54 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 8), (8, 7), (9, 9)]

-- Period 10, original row 8535, representative 9778.
def source55 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B005.Data.entryAt ⟨10, by decide +kernel⟩

def target55 : Weights.Entry :=
  { word := [12, 0, 12, 2, 8, 8, 12], weights := [1, 0, 0, 1] }

def points55 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8), (9, 9)]

-- Period 10, original row 8558, representative 9782.
def source56 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B005.Data.entryAt ⟨14, by decide +kernel⟩

def target56 : Weights.Entry :=
  { word := [12, 0, 12, 10, 0, 8, 10], weights := [1, 0, 0, 1] }

def points56 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8), (9, 9)]

-- Period 10, original row 8559, representative 9782.
def source57 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B005.Data.entryAt ⟨14, by decide +kernel⟩

def target57 : Weights.Entry :=
  { word := [12, 0, 12, 10, 0, 8, 12], weights := [1, 0, 0, 1] }

def points57 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 8), (8, 7), (9, 9)]

-- Period 10, original row 8562, representative 9827.
def source58 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B005.Data.entryAt ⟨59, by decide +kernel⟩

def target58 : Weights.Entry :=
  { word := [12, 0, 12, 10, 0, 12, 2], weights := [0, 1, 1, 1] }

def points58 : List (ℕ × ℕ) := [(0, 9), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 0), (9, 1)]

-- Period 10, original row 8563, representative 9827.
def source59 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B005.Data.entryAt ⟨59, by decide +kernel⟩

def target59 : Weights.Entry :=
  { word := [12, 0, 12, 10, 0, 12, 4], weights := [0, 1, 1, 1] }

def points59 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 0), (9, 1)]

-- Period 10, original row 8571, representative 9779.
def source60 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B005.Data.entryAt ⟨11, by decide +kernel⟩

def target60 : Weights.Entry :=
  { word := [12, 0, 12, 10, 8, 8, 12], weights := [1, 0, 0, 1] }

def points60 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8), (9, 9)]

-- Period 10, original row 8573, representative 9826.
def source61 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B005.Data.entryAt ⟨58, by decide +kernel⟩

def target61 : Weights.Entry :=
  { word := [12, 0, 12, 10, 8, 12, 4], weights := [0, 1, 1, 1] }

def points61 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 0), (9, 1)]

-- Period 10, original row 8700, representative 9817.
def source62 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B005.Data.entryAt ⟨49, by decide +kernel⟩

def target62 : Weights.Entry :=
  { word := [12, 4, 8, 8, 1, 12, 2], weights := [1, 0, 1, 1] }

def points62 : List (ℕ × ℕ) := [(0, 9), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8701, representative 9817.
def source63 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B005.Data.entryAt ⟨49, by decide +kernel⟩

def target63 : Weights.Entry :=
  { word := [12, 4, 8, 8, 1, 12, 4], weights := [1, 0, 1, 1] }

def points63 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8712, representative 9816.
def source64 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B005.Data.entryAt ⟨48, by decide +kernel⟩

def target64 : Weights.Entry :=
  { word := [12, 4, 8, 8, 9, 12, 4], weights := [1, 0, 1, 1] }

def points64 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8739, representative 9776.
def source65 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B005.Data.entryAt ⟨8, by decide +kernel⟩

def target65 : Weights.Entry :=
  { word := [12, 8, 0, 4, 2, 0, 9], weights := [1, 0, 0, 1] }

def points65 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8740, representative 9776.
def source66 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B005.Data.entryAt ⟨8, by decide +kernel⟩

def target66 : Weights.Entry :=
  { word := [12, 8, 0, 4, 2, 0, 10], weights := [1, 0, 0, 1] }

def points66 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8741, representative 9784.
def source67 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B005.Data.entryAt ⟨16, by decide +kernel⟩

def target67 : Weights.Entry :=
  { word := [12, 8, 0, 4, 2, 0, 12], weights := [1, 0, 0, 1] }

def points67 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8746, representative 9768.
def source68 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B005.Data.entryAt ⟨0, by decide +kernel⟩

def target68 : Weights.Entry :=
  { word := [12, 8, 0, 4, 2, 8, 12], weights := [1, 0, 0, 1] }

def points68 : List (ℕ × ℕ) := [(0, 0), (1, 2), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8), (9, 9)]

-- Period 10, original row 8758, representative 9801.
def source69 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B005.Data.entryAt ⟨33, by decide +kernel⟩

def target69 : Weights.Entry :=
  { word := [12, 8, 0, 4, 8, 12, 4], weights := [1, 0, 0, 1] }

def points69 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8765, representative 9781.
def source70 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B005.Data.entryAt ⟨13, by decide +kernel⟩

def target70 : Weights.Entry :=
  { word := [12, 8, 0, 4, 10, 0, 9], weights := [1, 0, 0, 1] }

def points70 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8766, representative 9781.
def source71 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B005.Data.entryAt ⟨13, by decide +kernel⟩

def target71 : Weights.Entry :=
  { word := [12, 8, 0, 4, 10, 0, 10], weights := [1, 0, 0, 1] }

def points71 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8767, representative 9789.
def source72 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B005.Data.entryAt ⟨21, by decide +kernel⟩

def target72 : Weights.Entry :=
  { word := [12, 8, 0, 4, 10, 0, 12], weights := [1, 0, 0, 1] }

def points72 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8772, representative 9769.
def source73 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B005.Data.entryAt ⟨1, by decide +kernel⟩

def target73 : Weights.Entry :=
  { word := [12, 8, 0, 4, 10, 8, 12], weights := [1, 0, 0, 1] }

def points73 : List (ℕ × ℕ) := [(0, 0), (1, 2), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8), (9, 9)]

-- Period 10, original row 8783, representative 9783.
def source74 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B005.Data.entryAt ⟨15, by decide +kernel⟩

def target74 : Weights.Entry :=
  { word := [12, 8, 0, 12, 2, 0, 9], weights := [1, 0, 0, 1] }

def points74 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8784, representative 9783.
def source75 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B005.Data.entryAt ⟨15, by decide +kernel⟩

def target75 : Weights.Entry :=
  { word := [12, 8, 0, 12, 2, 0, 10], weights := [1, 0, 0, 1] }

def points75 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8785, representative 9791.
def source76 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B005.Data.entryAt ⟨23, by decide +kernel⟩

def target76 : Weights.Entry :=
  { word := [12, 8, 0, 12, 2, 0, 12], weights := [1, 0, 0, 1] }

def points76 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8790, representative 9775.
def source77 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B005.Data.entryAt ⟨7, by decide +kernel⟩

def target77 : Weights.Entry :=
  { word := [12, 8, 0, 12, 2, 8, 12], weights := [1, 0, 1, 0] }

def points77 : List (ℕ × ℕ) := [(0, 0), (1, 2), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8), (9, 9)]

-- Period 10, original row 8801, representative 9802.
def source78 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B005.Data.entryAt ⟨34, by decide +kernel⟩

def target78 : Weights.Entry :=
  { word := [12, 8, 0, 12, 8, 12, 4], weights := [1, 0, 0, 1] }

def points78 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8808, representative 9782.
def source79 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B005.Data.entryAt ⟨14, by decide +kernel⟩

def target79 : Weights.Entry :=
  { word := [12, 8, 0, 12, 10, 0, 9], weights := [1, 0, 0, 1] }

def points79 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8809, representative 9782.
def source80 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B005.Data.entryAt ⟨14, by decide +kernel⟩

def target80 : Weights.Entry :=
  { word := [12, 8, 0, 12, 10, 0, 10], weights := [1, 0, 0, 1] }

def points80 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8810, representative 9790.
def source81 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B005.Data.entryAt ⟨22, by decide +kernel⟩

def target81 : Weights.Entry :=
  { word := [12, 8, 0, 12, 10, 0, 12], weights := [1, 0, 0, 1] }

def points81 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8815, representative 9772.
def source82 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B005.Data.entryAt ⟨4, by decide +kernel⟩

def target82 : Weights.Entry :=
  { word := [12, 8, 0, 12, 10, 8, 12], weights := [1, 0, 1, 0] }

def points82 : List (ℕ × ℕ) := [(0, 0), (1, 2), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8), (9, 9)]

-- Period 10, original row 8873, representative 9821.
def source83 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B005.Data.entryAt ⟨53, by decide +kernel⟩

def target83 : Weights.Entry :=
  { word := [12, 8, 4, 10, 8, 12, 4], weights := [1, 1, 1, 1] }

def points83 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8981, representative 9820.
def source84 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B005.Data.entryAt ⟨52, by decide +kernel⟩

def target84 : Weights.Entry :=
  { word := [12, 8, 12, 10, 8, 12, 4], weights := [1, 1, 1, 1] }

def points84 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 9065, representative 9813.
def source85 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B005.Data.entryAt ⟨45, by decide +kernel⟩

def target85 : Weights.Entry :=
  { word := [12, 12, 8, 8, 1, 12, 2], weights := [1, 0, 1, 1] }

def points85 : List (ℕ × ℕ) := [(0, 9), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 9066, representative 9813.
def source86 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B005.Data.entryAt ⟨45, by decide +kernel⟩

def target86 : Weights.Entry :=
  { word := [12, 12, 8, 8, 1, 12, 4], weights := [1, 0, 1, 1] }

def points86 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 9077, representative 9812.
def source87 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B005.Data.entryAt ⟨44, by decide +kernel⟩

def target87 : Weights.Entry :=
  { word := [12, 12, 8, 8, 9, 12, 4], weights := [1, 0, 1, 1] }

def points87 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

def period10Entries : List Weights.Entry := [target0, target1, target2, target3, target4, target5, target6, target7, target8, target9, target10, target11, target12, target13, target14, target15, target16, target17, target18, target19, target20, target21, target22, target23, target24, target25, target26, target27, target28, target29, target30, target31, target32, target33, target34, target35, target36, target37, target38, target39, target40, target41, target42, target43, target44, target45, target46, target47, target48, target49, target50, target51, target52, target53, target54, target55, target56, target57, target58, target59, target60, target61, target62, target63, target64, target65, target66, target67, target68, target69, target70, target71, target72, target73, target74, target75, target76, target77, target78, target79, target80, target81, target82, target83, target84, target85, target86, target87]

def period10Chunk : RowCoverage.Chunk where
  rows := [⟨7907, target0⟩, ⟨7926, target1⟩, ⟨7927, target2⟩, ⟨7935, target3⟩, ⟨7953, target4⟩, ⟨7954, target5⟩, ⟨7959, target6⟩, ⟨7961, target7⟩, ⟨7987, target8⟩, ⟨7988, target9⟩, ⟨7989, target10⟩, ⟨7994, target11⟩, ⟨8008, target12⟩, ⟨8009, target13⟩, ⟨8017, target14⟩, ⟨8018, target15⟩, ⟨8019, target16⟩, ⟨8024, target17⟩, ⟨8034, target18⟩, ⟨8035, target19⟩, ⟨8041, target20⟩, ⟨8052, target21⟩, ⟨8053, target22⟩, ⟨8061, target23⟩, ⟨8062, target24⟩, ⟨8063, target25⟩, ⟨8068, target26⟩, ⟨8081, target27⟩, ⟨8082, target28⟩, ⟨8090, target29⟩, ⟨8091, target30⟩, ⟨8092, target31⟩, ⟨8097, target32⟩, ⟨8109, target33⟩, ⟨8110, target34⟩, ⟨8116, target35⟩, ⟨8134, target36⟩, ⟨8135, target37⟩, ⟨8143, target38⟩, ⟨8161, target39⟩, ⟨8162, target40⟩, ⟨8169, target41⟩, ⟨8171, target42⟩, ⟨8424, target43⟩, ⟨8437, target44⟩, ⟨8438, target45⟩, ⟨8446, target46⟩, ⟨8465, target47⟩, ⟨8466, target48⟩, ⟨8469, target49⟩, ⟨8470, target50⟩, ⟨8478, target51⟩, ⟨8480, target52⟩, ⟨8526, target53⟩, ⟨8527, target54⟩, ⟨8535, target55⟩, ⟨8558, target56⟩, ⟨8559, target57⟩, ⟨8562, target58⟩, ⟨8563, target59⟩, ⟨8571, target60⟩, ⟨8573, target61⟩, ⟨8700, target62⟩, ⟨8701, target63⟩, ⟨8712, target64⟩, ⟨8739, target65⟩, ⟨8740, target66⟩, ⟨8741, target67⟩, ⟨8746, target68⟩, ⟨8758, target69⟩, ⟨8765, target70⟩, ⟨8766, target71⟩, ⟨8767, target72⟩, ⟨8772, target73⟩, ⟨8783, target74⟩, ⟨8784, target75⟩, ⟨8785, target76⟩, ⟨8790, target77⟩, ⟨8801, target78⟩, ⟨8808, target79⟩, ⟨8809, target80⟩, ⟨8810, target81⟩, ⟨8815, target82⟩, ⟨8873, target83⟩, ⟨8981, target84⟩, ⟨9065, target85⟩, ⟨9066, target86⟩, ⟨9077, target87⟩]
  indexMask := 281571446751494796789545554990914188140847728708697149739763770922635997341674964702237923702799049869345487402736430229450462189243794425705099837365157305063974401358328764156475039070871751897816144648468165677528860883495698816529136002420173849853782304127584284248198803799788796206694205089808761662398285588931630220318521691253808450560393775005694627614742361777907405598136420084660487375322474508209094495927575649792177592457860738953363718060916176125624528404639675165409598815314653346167629669211417537703316169593789285226148957580081698501649867030254684694940002197783522838027934165752131720615749501597555883572898804485091292154703686218273931140381286841469597352407131491928059751208057195943045158668204306359273093297010434977189223143160927891438799212391468380215195233995024230385316090601946546424422398335815725298571648271624932913570786389608727501092758965088408650314939593735463679281273486456387883588638115757439598006853593080920930587140113617445171598669532741501285109827136257774461117710611415760992449945515742243997199573807395680227242547595457443644706973446936713803840620727769280258823421429354017398279646042399797859292636840930988612845899950651238543027170500810468437783533734974916264628934859524243826257564246170381863588343834335186344061576353380648979636787944843626560587333190819711615168066384145603401871946914334740818495874398557014397277742206470631010988023590112994791541504662384172201483486068717252365021168586316456342314027037732773148071289327902818388171691129678570977028820967377707367845816168413471020741828303954046036261644262619770596930808835417048187615614227650651645306674683807457804877140838479798879488516962670737684282233038699204875692446461087654452034184364995543773686570121985877048570719908556234827144253715226768994639242462300002602753982857680208786691521111216932566435266148170954249826859884646477020326817903891618209669074012810306575127923819023705691190621524282863417385266331605885665418811046497956575862331987753947875340209599784782476113343405975588766222623745839303609023982830288206970432802193050754915789363639079418013024622636622491573840473364723665452456961398642495515886088146784703557397785632783136811021342373129736225359654311050037016055821110876731128331699812045797480872761082885240047331200536485044754248110828121033472871782628362697046710832256786632352423887047393196650497536447080488248037649744419363273622724980076581053674314446477448362117322958359169685522114482602982894681732450436143482712808314734392284795028859374841688688355702153640137473085852184801956998217304859308374176778618167936464287019045284198383382023487784703570200452907857557326436686933545490847453673204744192
  count := 88

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

end FranklSmallCyclic.TransportBatches.G083.B001.Data
