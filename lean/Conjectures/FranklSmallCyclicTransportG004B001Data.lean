module

public import Conjectures.FranklSmallCyclicRowCoverage
public import Conjectures.FranklSmallCyclicCanonicalWords
public import Conjectures.FranklSmallCyclicOrbit7Block004Data

/-! 128 literal targets sharing one source proof block.
Original words and row indices are retained; weights may be transported.
-/
@[expose] public section

namespace FranklSmallCyclic.TransportBatches.G004.B001.Data

-- Period 7, original row 7752, representative 525.
def source0 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B004.Data.entryAt ⟨1, by decide +kernel⟩

def target0 : Weights.Entry :=
  { word := [10, 2, 8, 12, 2, 0, 10], weights := [1, 1, 1, 0] }

-- Period 7, original row 7824, representative 562.
def source1 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B004.Data.entryAt ⟨38, by decide +kernel⟩

def target1 : Weights.Entry :=
  { word := [10, 8, 0, 4, 2, 0, 10], weights := [1, 0, 0, 1] }

def points1 : List (ℕ × ℕ) := [(0, 1), (1, 2), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 7825, representative 554.
def source2 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B004.Data.entryAt ⟨30, by decide +kernel⟩

def target2 : Weights.Entry :=
  { word := [10, 8, 0, 4, 2, 0, 12], weights := [1, 0, 0, 1] }

def points2 : List (ℕ × ℕ) := [(0, 1), (1, 2), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 7829, representative 542.
def source3 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B004.Data.entryAt ⟨18, by decide +kernel⟩

def target3 : Weights.Entry :=
  { word := [10, 8, 0, 4, 2, 8, 10], weights := [1, 0, 1, 0] }

-- Period 7, original row 7830, representative 534.
def source4 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B004.Data.entryAt ⟨10, by decide +kernel⟩

def target4 : Weights.Entry :=
  { word := [10, 8, 0, 4, 2, 8, 12], weights := [1, 0, 0, 1] }

-- Period 7, original row 7850, representative 567.
def source5 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B004.Data.entryAt ⟨43, by decide +kernel⟩

def target5 : Weights.Entry :=
  { word := [10, 8, 0, 4, 10, 0, 10], weights := [1, 0, 0, 1] }

def points5 : List (ℕ × ℕ) := [(0, 1), (1, 2), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 7851, representative 559.
def source6 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B004.Data.entryAt ⟨35, by decide +kernel⟩

def target6 : Weights.Entry :=
  { word := [10, 8, 0, 4, 10, 0, 12], weights := [1, 0, 0, 1] }

def points6 : List (ℕ × ℕ) := [(0, 1), (1, 2), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 7855, representative 543.
def source7 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B004.Data.entryAt ⟨19, by decide +kernel⟩

def target7 : Weights.Entry :=
  { word := [10, 8, 0, 4, 10, 8, 10], weights := [1, 0, 1, 0] }

-- Period 7, original row 7856, representative 535.
def source8 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B004.Data.entryAt ⟨11, by decide +kernel⟩

def target8 : Weights.Entry :=
  { word := [10, 8, 0, 4, 10, 8, 12], weights := [1, 0, 0, 1] }

-- Period 7, original row 7876, representative 569.
def source9 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B004.Data.entryAt ⟨45, by decide +kernel⟩

def target9 : Weights.Entry :=
  { word := [10, 8, 0, 12, 2, 0, 10], weights := [1, 0, 0, 1] }

def points9 : List (ℕ × ℕ) := [(0, 1), (1, 2), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 7877, representative 561.
def source10 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B004.Data.entryAt ⟨37, by decide +kernel⟩

def target10 : Weights.Entry :=
  { word := [10, 8, 0, 12, 2, 0, 12], weights := [1, 0, 0, 1] }

def points10 : List (ℕ × ℕ) := [(0, 1), (1, 2), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 7881, representative 549.
def source11 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B004.Data.entryAt ⟨25, by decide +kernel⟩

def target11 : Weights.Entry :=
  { word := [10, 8, 0, 12, 2, 8, 10], weights := [1, 0, 1, 0] }

-- Period 7, original row 7882, representative 541.
def source12 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B004.Data.entryAt ⟨17, by decide +kernel⟩

def target12 : Weights.Entry :=
  { word := [10, 8, 0, 12, 2, 8, 12], weights := [1, 0, 1, 0] }

-- Period 7, original row 7901, representative 568.
def source13 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B004.Data.entryAt ⟨44, by decide +kernel⟩

def target13 : Weights.Entry :=
  { word := [10, 8, 0, 12, 10, 0, 10], weights := [1, 0, 0, 1] }

def points13 : List (ℕ × ℕ) := [(0, 1), (1, 2), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 7902, representative 560.
def source14 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B004.Data.entryAt ⟨36, by decide +kernel⟩

def target14 : Weights.Entry :=
  { word := [10, 8, 0, 12, 10, 0, 12], weights := [1, 0, 0, 1] }

def points14 : List (ℕ × ℕ) := [(0, 1), (1, 2), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 7906, representative 546.
def source15 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B004.Data.entryAt ⟨22, by decide +kernel⟩

def target15 : Weights.Entry :=
  { word := [10, 8, 0, 12, 10, 8, 10], weights := [1, 0, 1, 0] }

-- Period 7, original row 7907, representative 538.
def source16 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B004.Data.entryAt ⟨14, by decide +kernel⟩

def target16 : Weights.Entry :=
  { word := [10, 8, 0, 12, 10, 8, 12], weights := [1, 0, 1, 0] }

-- Period 7, original row 7926, representative 550.
def source17 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B004.Data.entryAt ⟨26, by decide +kernel⟩

def target17 : Weights.Entry :=
  { word := [10, 8, 4, 2, 0, 8, 10], weights := [1, 0, 0, 1] }

-- Period 7, original row 7927, representative 534.
def source18 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B004.Data.entryAt ⟨10, by decide +kernel⟩

def target18 : Weights.Entry :=
  { word := [10, 8, 4, 2, 0, 8, 12], weights := [1, 0, 0, 1] }

def points18 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 7935, representative 539.
def source19 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B004.Data.entryAt ⟨15, by decide +kernel⟩

def target19 : Weights.Entry :=
  { word := [10, 8, 4, 2, 8, 8, 12], weights := [1, 0, 0, 1] }

-- Period 7, original row 7953, representative 553.
def source20 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B004.Data.entryAt ⟨29, by decide +kernel⟩

def target20 : Weights.Entry :=
  { word := [10, 8, 4, 10, 0, 8, 10], weights := [1, 0, 0, 1] }

-- Period 7, original row 7954, representative 541.
def source21 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B004.Data.entryAt ⟨17, by decide +kernel⟩

def target21 : Weights.Entry :=
  { word := [10, 8, 4, 10, 0, 8, 12], weights := [0, 1, 0, 1] }

def points21 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 7959, representative 540.
def source22 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B004.Data.entryAt ⟨16, by decide +kernel⟩

def target22 : Weights.Entry :=
  { word := [10, 8, 4, 10, 8, 8, 12], weights := [1, 0, 0, 1] }

-- Period 7, original row 7988, representative 563.
def source23 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B004.Data.entryAt ⟨39, by decide +kernel⟩

def target23 : Weights.Entry :=
  { word := [10, 8, 8, 4, 2, 0, 10], weights := [1, 0, 1, 0] }

-- Period 7, original row 7989, representative 555.
def source24 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B004.Data.entryAt ⟨31, by decide +kernel⟩

def target24 : Weights.Entry :=
  { word := [10, 8, 8, 4, 2, 0, 12], weights := [1, 0, 0, 1] }

def points24 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 7993, representative 547.
def source25 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B004.Data.entryAt ⟨23, by decide +kernel⟩

def target25 : Weights.Entry :=
  { word := [10, 8, 8, 4, 2, 8, 10], weights := [1, 0, 1, 0] }

-- Period 7, original row 7994, representative 539.
def source26 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B004.Data.entryAt ⟨15, by decide +kernel⟩

def target26 : Weights.Entry :=
  { word := [10, 8, 8, 4, 2, 8, 12], weights := [1, 0, 0, 1] }

def points26 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8018, representative 564.
def source27 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B004.Data.entryAt ⟨40, by decide +kernel⟩

def target27 : Weights.Entry :=
  { word := [10, 8, 8, 4, 10, 0, 10], weights := [1, 0, 1, 0] }

-- Period 7, original row 8019, representative 556.
def source28 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B004.Data.entryAt ⟨32, by decide +kernel⟩

def target28 : Weights.Entry :=
  { word := [10, 8, 8, 4, 10, 0, 12], weights := [1, 0, 0, 1] }

def points28 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8023, representative 544.
def source29 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B004.Data.entryAt ⟨20, by decide +kernel⟩

def target29 : Weights.Entry :=
  { word := [10, 8, 8, 4, 10, 8, 10], weights := [1, 0, 1, 0] }

-- Period 7, original row 8024, representative 536.
def source30 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B004.Data.entryAt ⟨12, by decide +kernel⟩

def target30 : Weights.Entry :=
  { word := [10, 8, 8, 4, 10, 8, 12], weights := [1, 0, 0, 1] }

-- Period 7, original row 8062, representative 566.
def source31 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B004.Data.entryAt ⟨42, by decide +kernel⟩

def target31 : Weights.Entry :=
  { word := [10, 8, 8, 12, 2, 0, 10], weights := [1, 0, 1, 0] }

-- Period 7, original row 8063, representative 558.
def source32 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B004.Data.entryAt ⟨34, by decide +kernel⟩

def target32 : Weights.Entry :=
  { word := [10, 8, 8, 12, 2, 0, 12], weights := [1, 0, 0, 1] }

def points32 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8067, representative 548.
def source33 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B004.Data.entryAt ⟨24, by decide +kernel⟩

def target33 : Weights.Entry :=
  { word := [10, 8, 8, 12, 2, 8, 10], weights := [1, 0, 1, 0] }

-- Period 7, original row 8068, representative 540.
def source34 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B004.Data.entryAt ⟨16, by decide +kernel⟩

def target34 : Weights.Entry :=
  { word := [10, 8, 8, 12, 2, 8, 12], weights := [1, 0, 0, 1] }

def points34 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8091, representative 565.
def source35 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B004.Data.entryAt ⟨41, by decide +kernel⟩

def target35 : Weights.Entry :=
  { word := [10, 8, 8, 12, 10, 0, 10], weights := [1, 0, 1, 0] }

-- Period 7, original row 8092, representative 557.
def source36 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B004.Data.entryAt ⟨33, by decide +kernel⟩

def target36 : Weights.Entry :=
  { word := [10, 8, 8, 12, 10, 0, 12], weights := [1, 0, 0, 1] }

def points36 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8096, representative 545.
def source37 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B004.Data.entryAt ⟨21, by decide +kernel⟩

def target37 : Weights.Entry :=
  { word := [10, 8, 8, 12, 10, 8, 10], weights := [1, 0, 1, 0] }

-- Period 7, original row 8097, representative 537.
def source38 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B004.Data.entryAt ⟨13, by decide +kernel⟩

def target38 : Weights.Entry :=
  { word := [10, 8, 8, 12, 10, 8, 12], weights := [1, 0, 1, 0] }

-- Period 7, original row 8134, representative 551.
def source39 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B004.Data.entryAt ⟨27, by decide +kernel⟩

def target39 : Weights.Entry :=
  { word := [10, 8, 12, 2, 0, 8, 10], weights := [1, 0, 0, 1] }

-- Period 7, original row 8135, representative 535.
def source40 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B004.Data.entryAt ⟨11, by decide +kernel⟩

def target40 : Weights.Entry :=
  { word := [10, 8, 12, 2, 0, 8, 12], weights := [1, 0, 0, 1] }

def points40 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8143, representative 536.
def source41 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B004.Data.entryAt ⟨12, by decide +kernel⟩

def target41 : Weights.Entry :=
  { word := [10, 8, 12, 2, 8, 8, 12], weights := [1, 0, 0, 1] }

def points41 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8161, representative 552.
def source42 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B004.Data.entryAt ⟨28, by decide +kernel⟩

def target42 : Weights.Entry :=
  { word := [10, 8, 12, 10, 0, 8, 10], weights := [1, 0, 0, 1] }

-- Period 7, original row 8162, representative 538.
def source43 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B004.Data.entryAt ⟨14, by decide +kernel⟩

def target43 : Weights.Entry :=
  { word := [10, 8, 12, 10, 0, 8, 12], weights := [0, 1, 0, 1] }

def points43 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8169, representative 537.
def source44 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B004.Data.entryAt ⟨13, by decide +kernel⟩

def target44 : Weights.Entry :=
  { word := [10, 8, 12, 10, 8, 8, 12], weights := [0, 1, 0, 1] }

def points44 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8190, representative 599.
def source45 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B004.Data.entryAt ⟨75, by decide +kernel⟩

def target45 : Weights.Entry :=
  { word := [10, 10, 0, 9, 8, 1, 4], weights := [1, 1, 0, 1] }

def points45 : List (ℕ × ℕ) := [(0, 1), (1, 2), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8192, representative 634.
def source46 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B004.Data.entryAt ⟨110, by decide +kernel⟩

def target46 : Weights.Entry :=
  { word := [10, 10, 0, 9, 8, 2, 2], weights := [1, 1, 0, 1] }

def points46 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8194, representative 600.
def source47 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B004.Data.entryAt ⟨76, by decide +kernel⟩

def target47 : Weights.Entry :=
  { word := [10, 10, 0, 9, 8, 8, 4], weights := [1, 1, 0, 1] }

def points47 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8197, representative 597.
def source48 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B004.Data.entryAt ⟨73, by decide +kernel⟩

def target48 : Weights.Entry :=
  { word := [10, 10, 0, 9, 8, 9, 4], weights := [1, 1, 0, 1] }

def points48 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8199, representative 633.
def source49 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B004.Data.entryAt ⟨109, by decide +kernel⟩

def target49 : Weights.Entry :=
  { word := [10, 10, 0, 9, 8, 10, 2], weights := [1, 1, 0, 1] }

def points49 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8202, representative 604.
def source50 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B004.Data.entryAt ⟨80, by decide +kernel⟩

def target50 : Weights.Entry :=
  { word := [10, 10, 0, 10, 0, 0, 2], weights := [0, 1, 0, 1] }

def points50 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8203, representative 583.
def source51 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B004.Data.entryAt ⟨59, by decide +kernel⟩

def target51 : Weights.Entry :=
  { word := [10, 10, 0, 10, 0, 0, 4], weights := [0, 1, 0, 1] }

def points51 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8210, representative 580.
def source52 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B004.Data.entryAt ⟨56, by decide +kernel⟩

def target52 : Weights.Entry :=
  { word := [10, 10, 0, 10, 0, 8, 4], weights := [0, 1, 0, 1] }

def points52 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8214, representative 582.
def source53 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B004.Data.entryAt ⟨58, by decide +kernel⟩

def target53 : Weights.Entry :=
  { word := [10, 10, 0, 10, 8, 0, 4], weights := [0, 1, 0, 1] }

def points53 : List (ℕ × ℕ) := [(0, 1), (1, 2), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8216, representative 579.
def source54 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B004.Data.entryAt ⟨55, by decide +kernel⟩

def target54 : Weights.Entry :=
  { word := [10, 10, 0, 10, 8, 8, 4], weights := [0, 1, 0, 1] }

def points54 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8219, representative 630.
def source55 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B004.Data.entryAt ⟨106, by decide +kernel⟩

def target55 : Weights.Entry :=
  { word := [10, 10, 0, 12, 2, 0, 2], weights := [1, 1, 0, 1] }

def points55 : List (ℕ × ℕ) := [(0, 1), (1, 2), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8220, representative 593.
def source56 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B004.Data.entryAt ⟨69, by decide +kernel⟩

def target56 : Weights.Entry :=
  { word := [10, 10, 0, 12, 2, 0, 4], weights := [1, 1, 0, 1] }

def points56 : List (ℕ × ℕ) := [(0, 1), (1, 2), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8227, representative 629.
def source57 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B004.Data.entryAt ⟨105, by decide +kernel⟩

def target57 : Weights.Entry :=
  { word := [10, 10, 0, 12, 10, 0, 2], weights := [1, 1, 0, 1] }

def points57 : List (ℕ × ℕ) := [(0, 1), (1, 2), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8228, representative 592.
def source58 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B004.Data.entryAt ⟨68, by decide +kernel⟩

def target58 : Weights.Entry :=
  { word := [10, 10, 0, 12, 10, 0, 4], weights := [1, 1, 0, 1] }

def points58 : List (ℕ × ℕ) := [(0, 1), (1, 2), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8235, representative 624.
def source59 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B004.Data.entryAt ⟨100, by decide +kernel⟩

def target59 : Weights.Entry :=
  { word := [10, 10, 2, 8, 1, 0, 2], weights := [1, 1, 0, 1] }

def points59 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8236, representative 587.
def source60 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B004.Data.entryAt ⟨63, by decide +kernel⟩

def target60 : Weights.Entry :=
  { word := [10, 10, 2, 8, 1, 0, 4], weights := [1, 1, 0, 1] }

def points60 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8249, representative 623.
def source61 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B004.Data.entryAt ⟨99, by decide +kernel⟩

def target61 : Weights.Entry :=
  { word := [10, 10, 2, 8, 9, 0, 2], weights := [1, 1, 0, 1] }

def points61 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8250, representative 586.
def source62 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B004.Data.entryAt ⟨62, by decide +kernel⟩

def target62 : Weights.Entry :=
  { word := [10, 10, 2, 8, 9, 0, 4], weights := [1, 1, 0, 1] }

def points62 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8262, representative 647.
def source63 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B004.Data.entryAt ⟨123, by decide +kernel⟩

def target63 : Weights.Entry :=
  { word := [10, 10, 8, 2, 0, 1, 8], weights := [1, 0, 0, 1] }

def points63 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8264, representative 639.
def source64 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B004.Data.entryAt ⟨115, by decide +kernel⟩

def target64 : Weights.Entry :=
  { word := [10, 10, 8, 2, 0, 2, 8], weights := [1, 0, 0, 1] }

def points64 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8267, representative 602.
def source65 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B004.Data.entryAt ⟨78, by decide +kernel⟩

def target65 : Weights.Entry :=
  { word := [10, 10, 8, 2, 0, 8, 2], weights := [1, 0, 0, 1] }

def points65 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8268, representative 573.
def source66 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B004.Data.entryAt ⟨49, by decide +kernel⟩

def target66 : Weights.Entry :=
  { word := [10, 10, 8, 2, 0, 8, 4], weights := [1, 0, 0, 1] }

def points66 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8269, representative 651.
def source67 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B004.Data.entryAt ⟨127, by decide +kernel⟩

def target67 : Weights.Entry :=
  { word := [10, 10, 8, 2, 0, 8, 8], weights := [1, 0, 0, 1] }

def points67 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8274, representative 648.
def source68 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B004.Data.entryAt ⟨124, by decide +kernel⟩

def target68 : Weights.Entry :=
  { word := [10, 10, 8, 2, 0, 9, 8], weights := [1, 0, 0, 1] }

def points68 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8276, representative 640.
def source69 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B004.Data.entryAt ⟨116, by decide +kernel⟩

def target69 : Weights.Entry :=
  { word := [10, 10, 8, 2, 0, 10, 8], weights := [1, 0, 0, 1] }

def points69 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8277, representative 577.
def source70 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B004.Data.entryAt ⟨53, by decide +kernel⟩

def target70 : Weights.Entry :=
  { word := [10, 10, 8, 2, 8, 0, 4], weights := [1, 0, 0, 1] }

def points70 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8280, representative 644.
def source71 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B004.Data.entryAt ⟨120, by decide +kernel⟩

def target71 : Weights.Entry :=
  { word := [10, 10, 8, 2, 8, 2, 8], weights := [1, 0, 0, 1] }

def points71 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8281, representative 574.
def source72 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B004.Data.entryAt ⟨50, by decide +kernel⟩

def target72 : Weights.Entry :=
  { word := [10, 10, 8, 2, 8, 8, 4], weights := [1, 0, 0, 1] }

def points72 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8284, representative 641.
def source73 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B004.Data.entryAt ⟨117, by decide +kernel⟩

def target73 : Weights.Entry :=
  { word := [10, 10, 8, 2, 8, 10, 8], weights := [1, 0, 0, 1] }

def points73 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8299, representative 595.
def source74 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B004.Data.entryAt ⟨71, by decide +kernel⟩

def target74 : Weights.Entry :=
  { word := [10, 10, 8, 9, 8, 1, 4], weights := [1, 1, 0, 1] }

def points74 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8301, representative 632.
def source75 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B004.Data.entryAt ⟨108, by decide +kernel⟩

def target75 : Weights.Entry :=
  { word := [10, 10, 8, 9, 8, 2, 2], weights := [1, 1, 0, 1] }

def points75 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8303, representative 596.
def source76 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B004.Data.entryAt ⟨72, by decide +kernel⟩

def target76 : Weights.Entry :=
  { word := [10, 10, 8, 9, 8, 8, 4], weights := [1, 1, 0, 1] }

def points76 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8306, representative 594.
def source77 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B004.Data.entryAt ⟨70, by decide +kernel⟩

def target77 : Weights.Entry :=
  { word := [10, 10, 8, 9, 8, 9, 4], weights := [1, 1, 0, 1] }

def points77 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8308, representative 631.
def source78 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B004.Data.entryAt ⟨107, by decide +kernel⟩

def target78 : Weights.Entry :=
  { word := [10, 10, 8, 9, 8, 10, 2], weights := [1, 1, 0, 1] }

def points78 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8311, representative 650.
def source79 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B004.Data.entryAt ⟨126, by decide +kernel⟩

def target79 : Weights.Entry :=
  { word := [10, 10, 8, 10, 0, 1, 8], weights := [0, 1, 0, 1] }

def points79 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8313, representative 646.
def source80 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B004.Data.entryAt ⟨122, by decide +kernel⟩

def target80 : Weights.Entry :=
  { word := [10, 10, 8, 10, 0, 2, 8], weights := [0, 1, 0, 1] }

def points80 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8317, representative 603.
def source81 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B004.Data.entryAt ⟨79, by decide +kernel⟩

def target81 : Weights.Entry :=
  { word := [10, 10, 8, 10, 0, 8, 2], weights := [0, 1, 0, 1] }

def points81 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8318, representative 576.
def source82 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B004.Data.entryAt ⟨52, by decide +kernel⟩

def target82 : Weights.Entry :=
  { word := [10, 10, 8, 10, 0, 8, 4], weights := [0, 1, 0, 1] }

def points82 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8324, representative 649.
def source83 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B004.Data.entryAt ⟨125, by decide +kernel⟩

def target83 : Weights.Entry :=
  { word := [10, 10, 8, 10, 0, 9, 8], weights := [0, 1, 0, 1] }

def points83 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8326, representative 643.
def source84 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B004.Data.entryAt ⟨119, by decide +kernel⟩

def target84 : Weights.Entry :=
  { word := [10, 10, 8, 10, 0, 10, 8], weights := [0, 1, 0, 1] }

def points84 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8328, representative 578.
def source85 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B004.Data.entryAt ⟨54, by decide +kernel⟩

def target85 : Weights.Entry :=
  { word := [10, 10, 8, 10, 8, 0, 4], weights := [0, 1, 0, 1] }

def points85 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8331, representative 645.
def source86 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B004.Data.entryAt ⟨121, by decide +kernel⟩

def target86 : Weights.Entry :=
  { word := [10, 10, 8, 10, 8, 2, 8], weights := [0, 1, 0, 1] }

def points86 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8334, representative 575.
def source87 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B004.Data.entryAt ⟨51, by decide +kernel⟩

def target87 : Weights.Entry :=
  { word := [10, 10, 8, 10, 8, 8, 4], weights := [0, 1, 0, 1] }

def points87 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8337, representative 642.
def source88 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B004.Data.entryAt ⟨118, by decide +kernel⟩

def target88 : Weights.Entry :=
  { word := [10, 10, 8, 10, 8, 10, 8], weights := [0, 1, 0, 1] }

def points88 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8341, representative 628.
def source89 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B004.Data.entryAt ⟨104, by decide +kernel⟩

def target89 : Weights.Entry :=
  { word := [10, 10, 8, 12, 2, 0, 2], weights := [1, 1, 0, 1] }

def points89 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8342, representative 591.
def source90 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B004.Data.entryAt ⟨67, by decide +kernel⟩

def target90 : Weights.Entry :=
  { word := [10, 10, 8, 12, 2, 0, 4], weights := [1, 1, 0, 1] }

def points90 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8347, representative 626.
def source91 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B004.Data.entryAt ⟨102, by decide +kernel⟩

def target91 : Weights.Entry :=
  { word := [10, 10, 8, 12, 2, 8, 2], weights := [1, 1, 1, 1] }

def points91 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8348, representative 589.
def source92 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B004.Data.entryAt ⟨65, by decide +kernel⟩

def target92 : Weights.Entry :=
  { word := [10, 10, 8, 12, 2, 8, 4], weights := [3, 1, 2, 2] }

def points92 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8363, representative 627.
def source93 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B004.Data.entryAt ⟨103, by decide +kernel⟩

def target93 : Weights.Entry :=
  { word := [10, 10, 8, 12, 10, 0, 2], weights := [1, 1, 0, 1] }

def points93 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8364, representative 590.
def source94 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B004.Data.entryAt ⟨66, by decide +kernel⟩

def target94 : Weights.Entry :=
  { word := [10, 10, 8, 12, 10, 0, 4], weights := [1, 1, 0, 1] }

def points94 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8369, representative 625.
def source95 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B004.Data.entryAt ⟨101, by decide +kernel⟩

def target95 : Weights.Entry :=
  { word := [10, 10, 8, 12, 10, 8, 2], weights := [1, 1, 1, 1] }

def points95 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8370, representative 588.
def source96 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B004.Data.entryAt ⟨64, by decide +kernel⟩

def target96 : Weights.Entry :=
  { word := [10, 10, 8, 12, 10, 8, 4], weights := [2, 1, 1, 2] }

def points96 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8379, representative 622.
def source97 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B004.Data.entryAt ⟨98, by decide +kernel⟩

def target97 : Weights.Entry :=
  { word := [10, 10, 10, 8, 1, 0, 2], weights := [1, 1, 0, 1] }

def points97 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8380, representative 585.
def source98 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B004.Data.entryAt ⟨61, by decide +kernel⟩

def target98 : Weights.Entry :=
  { word := [10, 10, 10, 8, 1, 0, 4], weights := [1, 1, 0, 1] }

def points98 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8393, representative 621.
def source99 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B004.Data.entryAt ⟨97, by decide +kernel⟩

def target99 : Weights.Entry :=
  { word := [10, 10, 10, 8, 9, 0, 2], weights := [1, 1, 0, 1] }

def points99 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8394, representative 584.
def source100 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B004.Data.entryAt ⟨60, by decide +kernel⟩

def target100 : Weights.Entry :=
  { word := [10, 10, 10, 8, 9, 0, 4], weights := [1, 1, 0, 1] }

def points100 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8436, representative 530.
def source101 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B004.Data.entryAt ⟨6, by decide +kernel⟩

def target101 : Weights.Entry :=
  { word := [12, 0, 4, 2, 0, 8, 9], weights := [1, 0, 0, 1] }

def points101 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 8438, representative 562.
def source102 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B004.Data.entryAt ⟨38, by decide +kernel⟩

def target102 : Weights.Entry :=
  { word := [12, 0, 4, 2, 0, 8, 12], weights := [1, 0, 0, 1] }

def points102 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 8446, representative 563.
def source103 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B004.Data.entryAt ⟨39, by decide +kernel⟩

def target103 : Weights.Entry :=
  { word := [12, 0, 4, 2, 8, 8, 12], weights := [0, 1, 0, 1] }

def points103 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8464, representative 533.
def source104 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B004.Data.entryAt ⟨9, by decide +kernel⟩

def target104 : Weights.Entry :=
  { word := [12, 0, 4, 10, 0, 8, 9], weights := [1, 0, 0, 1] }

def points104 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 8466, representative 569.
def source105 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B004.Data.entryAt ⟨45, by decide +kernel⟩

def target105 : Weights.Entry :=
  { word := [12, 0, 4, 10, 0, 8, 12], weights := [1, 0, 0, 1] }

def points105 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 8476, representative 525.
def source106 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B004.Data.entryAt ⟨1, by decide +kernel⟩

def target106 : Weights.Entry :=
  { word := [12, 0, 4, 10, 8, 4, 12], weights := [0, 1, 1, 1] }

def points106 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8478, representative 566.
def source107 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B004.Data.entryAt ⟨42, by decide +kernel⟩

def target107 : Weights.Entry :=
  { word := [12, 0, 4, 10, 8, 8, 12], weights := [0, 1, 0, 1] }

def points107 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8525, representative 531.
def source108 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B004.Data.entryAt ⟨7, by decide +kernel⟩

def target108 : Weights.Entry :=
  { word := [12, 0, 12, 2, 0, 8, 9], weights := [1, 0, 0, 1] }

def points108 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 8527, representative 567.
def source109 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B004.Data.entryAt ⟨43, by decide +kernel⟩

def target109 : Weights.Entry :=
  { word := [12, 0, 12, 2, 0, 8, 12], weights := [1, 0, 0, 1] }

def points109 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 8535, representative 564.
def source110 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B004.Data.entryAt ⟨40, by decide +kernel⟩

def target110 : Weights.Entry :=
  { word := [12, 0, 12, 2, 8, 8, 12], weights := [0, 1, 0, 1] }

def points110 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8552, representative 524.
def source111 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B004.Data.entryAt ⟨0, by decide +kernel⟩

def target111 : Weights.Entry :=
  { word := [12, 0, 12, 10, 0, 4, 12], weights := [1, 0, 1, 1] }

def points111 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 8557, representative 532.
def source112 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B004.Data.entryAt ⟨8, by decide +kernel⟩

def target112 : Weights.Entry :=
  { word := [12, 0, 12, 10, 0, 8, 9], weights := [1, 0, 0, 1] }

def points112 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 8559, representative 568.
def source113 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B004.Data.entryAt ⟨44, by decide +kernel⟩

def target113 : Weights.Entry :=
  { word := [12, 0, 12, 10, 0, 8, 12], weights := [1, 0, 0, 1] }

def points113 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 8571, representative 565.
def source114 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B004.Data.entryAt ⟨41, by decide +kernel⟩

def target114 : Weights.Entry :=
  { word := [12, 0, 12, 10, 8, 8, 12], weights := [0, 1, 0, 1] }

def points114 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8617, representative 524.
def source115 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B004.Data.entryAt ⟨0, by decide +kernel⟩

def target115 : Weights.Entry :=
  { word := [12, 2, 0, 12, 10, 0, 9], weights := [1, 1, 0, 1] }

def points115 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8739, representative 562.
def source116 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B004.Data.entryAt ⟨38, by decide +kernel⟩

def target116 : Weights.Entry :=
  { word := [12, 8, 0, 4, 2, 0, 9], weights := [1, 0, 0, 1] }

def points116 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8741, representative 554.
def source117 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B004.Data.entryAt ⟨30, by decide +kernel⟩

def target117 : Weights.Entry :=
  { word := [12, 8, 0, 4, 2, 0, 12], weights := [1, 0, 0, 1] }

def points117 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8746, representative 550.
def source118 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B004.Data.entryAt ⟨26, by decide +kernel⟩

def target118 : Weights.Entry :=
  { word := [12, 8, 0, 4, 2, 8, 12], weights := [1, 0, 0, 1] }

def points118 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8765, representative 567.
def source119 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B004.Data.entryAt ⟨43, by decide +kernel⟩

def target119 : Weights.Entry :=
  { word := [12, 8, 0, 4, 10, 0, 9], weights := [1, 0, 0, 1] }

def points119 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8767, representative 559.
def source120 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B004.Data.entryAt ⟨35, by decide +kernel⟩

def target120 : Weights.Entry :=
  { word := [12, 8, 0, 4, 10, 0, 12], weights := [1, 0, 0, 1] }

def points120 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8772, representative 551.
def source121 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B004.Data.entryAt ⟨27, by decide +kernel⟩

def target121 : Weights.Entry :=
  { word := [12, 8, 0, 4, 10, 8, 12], weights := [1, 0, 0, 1] }

def points121 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8783, representative 569.
def source122 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B004.Data.entryAt ⟨45, by decide +kernel⟩

def target122 : Weights.Entry :=
  { word := [12, 8, 0, 12, 2, 0, 9], weights := [1, 0, 0, 1] }

def points122 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8785, representative 561.
def source123 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B004.Data.entryAt ⟨37, by decide +kernel⟩

def target123 : Weights.Entry :=
  { word := [12, 8, 0, 12, 2, 0, 12], weights := [1, 0, 0, 1] }

def points123 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8790, representative 553.
def source124 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B004.Data.entryAt ⟨29, by decide +kernel⟩

def target124 : Weights.Entry :=
  { word := [12, 8, 0, 12, 2, 8, 12], weights := [1, 0, 0, 1] }

def points124 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8808, representative 568.
def source125 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B004.Data.entryAt ⟨44, by decide +kernel⟩

def target125 : Weights.Entry :=
  { word := [12, 8, 0, 12, 10, 0, 9], weights := [1, 0, 0, 1] }

def points125 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8810, representative 560.
def source126 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B004.Data.entryAt ⟨36, by decide +kernel⟩

def target126 : Weights.Entry :=
  { word := [12, 8, 0, 12, 10, 0, 12], weights := [1, 0, 0, 1] }

def points126 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8815, representative 552.
def source127 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B004.Data.entryAt ⟨28, by decide +kernel⟩

def target127 : Weights.Entry :=
  { word := [12, 8, 0, 12, 10, 8, 12], weights := [1, 0, 0, 1] }

def points127 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

def period7Entries : List Weights.Entry := [target0, target1, target2, target3, target4, target5, target6, target7, target8, target9, target10, target11, target12, target13, target14, target15, target16, target17, target18, target19, target20, target21, target22, target23, target24, target25, target26, target27, target28, target29, target30, target31, target32, target33, target34, target35, target36, target37, target38, target39, target40, target41, target42, target43, target44, target45, target46, target47, target48, target49, target50, target51, target52, target53, target54, target55, target56, target57, target58, target59, target60, target61, target62, target63, target64, target65, target66, target67, target68, target69, target70, target71, target72, target73, target74, target75, target76, target77, target78, target79, target80, target81, target82, target83, target84, target85, target86, target87, target88, target89, target90, target91, target92, target93, target94, target95, target96, target97, target98, target99, target100, target101, target102, target103, target104, target105, target106, target107, target108, target109, target110, target111, target112, target113, target114, target115, target116, target117, target118, target119, target120, target121, target122, target123, target124, target125, target126, target127]

def period7Chunk : RowCoverage.Chunk where
  rows := [⟨7752, target0⟩, ⟨7824, target1⟩, ⟨7825, target2⟩, ⟨7829, target3⟩, ⟨7830, target4⟩, ⟨7850, target5⟩, ⟨7851, target6⟩, ⟨7855, target7⟩, ⟨7856, target8⟩, ⟨7876, target9⟩, ⟨7877, target10⟩, ⟨7881, target11⟩, ⟨7882, target12⟩, ⟨7901, target13⟩, ⟨7902, target14⟩, ⟨7906, target15⟩, ⟨7907, target16⟩, ⟨7926, target17⟩, ⟨7927, target18⟩, ⟨7935, target19⟩, ⟨7953, target20⟩, ⟨7954, target21⟩, ⟨7959, target22⟩, ⟨7988, target23⟩, ⟨7989, target24⟩, ⟨7993, target25⟩, ⟨7994, target26⟩, ⟨8018, target27⟩, ⟨8019, target28⟩, ⟨8023, target29⟩, ⟨8024, target30⟩, ⟨8062, target31⟩, ⟨8063, target32⟩, ⟨8067, target33⟩, ⟨8068, target34⟩, ⟨8091, target35⟩, ⟨8092, target36⟩, ⟨8096, target37⟩, ⟨8097, target38⟩, ⟨8134, target39⟩, ⟨8135, target40⟩, ⟨8143, target41⟩, ⟨8161, target42⟩, ⟨8162, target43⟩, ⟨8169, target44⟩, ⟨8190, target45⟩, ⟨8192, target46⟩, ⟨8194, target47⟩, ⟨8197, target48⟩, ⟨8199, target49⟩, ⟨8202, target50⟩, ⟨8203, target51⟩, ⟨8210, target52⟩, ⟨8214, target53⟩, ⟨8216, target54⟩, ⟨8219, target55⟩, ⟨8220, target56⟩, ⟨8227, target57⟩, ⟨8228, target58⟩, ⟨8235, target59⟩, ⟨8236, target60⟩, ⟨8249, target61⟩, ⟨8250, target62⟩, ⟨8262, target63⟩, ⟨8264, target64⟩, ⟨8267, target65⟩, ⟨8268, target66⟩, ⟨8269, target67⟩, ⟨8274, target68⟩, ⟨8276, target69⟩, ⟨8277, target70⟩, ⟨8280, target71⟩, ⟨8281, target72⟩, ⟨8284, target73⟩, ⟨8299, target74⟩, ⟨8301, target75⟩, ⟨8303, target76⟩, ⟨8306, target77⟩, ⟨8308, target78⟩, ⟨8311, target79⟩, ⟨8313, target80⟩, ⟨8317, target81⟩, ⟨8318, target82⟩, ⟨8324, target83⟩, ⟨8326, target84⟩, ⟨8328, target85⟩, ⟨8331, target86⟩, ⟨8334, target87⟩, ⟨8337, target88⟩, ⟨8341, target89⟩, ⟨8342, target90⟩, ⟨8347, target91⟩, ⟨8348, target92⟩, ⟨8363, target93⟩, ⟨8364, target94⟩, ⟨8369, target95⟩, ⟨8370, target96⟩, ⟨8379, target97⟩, ⟨8380, target98⟩, ⟨8393, target99⟩, ⟨8394, target100⟩, ⟨8436, target101⟩, ⟨8438, target102⟩, ⟨8446, target103⟩, ⟨8464, target104⟩, ⟨8466, target105⟩, ⟨8476, target106⟩, ⟨8478, target107⟩, ⟨8525, target108⟩, ⟨8527, target109⟩, ⟨8535, target110⟩, ⟨8552, target111⟩, ⟨8557, target112⟩, ⟨8559, target113⟩, ⟨8571, target114⟩, ⟨8617, target115⟩, ⟨8739, target116⟩, ⟨8741, target117⟩, ⟨8746, target118⟩, ⟨8765, target119⟩, ⟨8767, target120⟩, ⟨8772, target121⟩, ⟨8783, target122⟩, ⟨8785, target123⟩, ⟨8790, target124⟩, ⟨8808, target125⟩, ⟨8810, target126⟩, ⟨8815, target127⟩]
  indexMask := 39450586330827874954598692609603594159869570227715150268091926498453793237016274628283712058513941915875745659167028617874347376006610298938844415902451358045996806113145600992322611539025166254160608676396136201130467645285303191835657983898164600001441975233148789751834337309268050600553267261784478631783933519685598844447125894412855197088551750622933832545232615532336596763415697798684855669085382223899951423869657298621287807956957078062633506678642513569233746418226768201824231676262657303470747001090217711988241814575160036416555542960731792901033459559457265862218591246448791027342825763876041742645312836591180074150562158377981552577149914552257119923457263843430228706732743600495514708165565361177321578296276963866675031841272747592646952111502333190760121018423135001321833071387876774468622931290894226721022298116439447563636215284846046581924237455042788939873629632091886451269951208182805592236374568191750140664191328533157773303933556757159343078072336559285352935409697099977895470342323019978733008056157732014733910717658309009211417946190990964388434555215883856042585595807189209148760749325609074694089290592354518670452446322460531107144451249018806862918919107753215034012775937221359226631797318647743683247370309197985445222359766604021922160521169433888860578125882866544170631559704597792542921646750177853559346718261308700338217543985882382637705005537074033297599660958200936372073540931309983704557571528237718615149823777303427102490438625684591411098925520507530089577502902670739942852532681659124991015228704001002510926520848894897343441270828221019218378080886854386561707539783131953462120082906452019312941116159148832726909235622674063122311199458174700009063554293350973513742535547701051601589099606934976254447784903171225742865585185336973810562827575193418691022654896551605983576548087250159151311946412842495475122822733552622671121992443626161831993838861892786330115475367320698225164159529072959267842024026931560476837711354445804366821834947375995814109008560938563553076685982569488649037441990005018128355796943786577895761962676448510294485840314390118909813251556165821167432829446915277710469109554617934614929189880773517027331106848267599314640809577324572001752251698834969350891546021420096007721974174227904205327380398686937358117519136768479277918766614018490390998262309360096169530213447615457487534959554820775205175754927723127693478477554410250873096231293527757388832766507708306666885649720650817891151601075443137437886630403003595855909432200141796316791861340882565767529065730970194321540917190397386063504443066885428232908146847311792106988998659994256516906483712
  count := 128

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem period7Chunk_entries :
    period7Chunk.rows.map RowCoverage.TaggedRow.entry = period7Entries := rfl

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem period7_index_check :
    RowCoverage.indexCheck CanonicalWords.count period7Chunk = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem period7_words_check :
    RowCoverage.wordsCheck CanonicalWords.wordAt period7Chunk = true := by
  decide +kernel

end FranklSmallCyclic.TransportBatches.G004.B001.Data
