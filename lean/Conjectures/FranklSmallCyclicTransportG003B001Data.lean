module

public import Conjectures.FranklSmallCyclicRowCoverage
public import Conjectures.FranklSmallCyclicCanonicalWords
public import Conjectures.FranklSmallCyclicOrbit7Block003Data

/-! 128 literal targets sharing one source proof block.
Original words and row indices are retained; weights may be transported.
-/
@[expose] public section

namespace FranklSmallCyclic.TransportBatches.G003.B001.Data

-- Period 7, original row 5959, representative 424.
def source0 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B003.Data.entryAt ⟨29, by decide +kernel⟩

def target0 : Weights.Entry :=
  { word := [8, 9, 0, 12, 10, 0, 4], weights := [1, 0, 0, 1] }

def points0 : List (ℕ × ℕ) := [(0, 1), (1, 2), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 5965, representative 420.
def source1 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B003.Data.entryAt ⟨25, by decide +kernel⟩

def target1 : Weights.Entry :=
  { word := [8, 9, 0, 12, 10, 8, 4], weights := [1, 0, 0, 1] }

def points1 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 5987, representative 415.
def source2 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B003.Data.entryAt ⟨20, by decide +kernel⟩

def target2 : Weights.Entry :=
  { word := [8, 9, 8, 1, 4, 8, 4], weights := [0, 1, 0, 0] }

def points2 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 5993, representative 416.
def source3 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B003.Data.entryAt ⟨21, by decide +kernel⟩

def target3 : Weights.Entry :=
  { word := [8, 9, 8, 1, 12, 8, 4], weights := [0, 1, 0, 0] }

def points3 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 7415, representative 406.
def source4 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B003.Data.entryAt ⟨11, by decide +kernel⟩

def target4 : Weights.Entry :=
  { word := [10, 0, 0, 12, 0, 4, 8], weights := [0, 0, 1, 0] }

def points4 : List (ℕ × ℕ) := [(0, 2), (1, 0), (2, 1), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 7426, representative 476.
def source5 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B003.Data.entryAt ⟨80, by decide +kernel⟩

def target5 : Weights.Entry :=
  { word := [10, 0, 4, 2, 0, 8, 1], weights := [1, 0, 0, 1] }

def points5 : List (ℕ × ℕ) := [(0, 2), (1, 0), (2, 1), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 7449, representative 479.
def source6 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B003.Data.entryAt ⟨83, by decide +kernel⟩

def target6 : Weights.Entry :=
  { word := [10, 0, 4, 10, 0, 8, 1], weights := [0, 1, 0, 1] }

def points6 : List (ℕ × ℕ) := [(0, 2), (1, 0), (2, 1), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 7484, representative 488.
def source7 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B003.Data.entryAt ⟨92, by decide +kernel⟩

def target7 : Weights.Entry :=
  { word := [10, 0, 8, 4, 4, 4, 0], weights := [1, 0, 0, 1] }

def points7 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 7485, representative 403.
def source8 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B003.Data.entryAt ⟨8, by decide +kernel⟩

def target8 : Weights.Entry :=
  { word := [10, 0, 8, 4, 4, 4, 8], weights := [1, 0, 0, 1] }

def points8 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 7486, representative 474.
def source9 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B003.Data.entryAt ⟨78, by decide +kernel⟩

def target9 : Weights.Entry :=
  { word := [10, 0, 8, 4, 4, 12, 0], weights := [1, 0, 0, 1] }

def points9 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 7506, representative 405.
def source10 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B003.Data.entryAt ⟨10, by decide +kernel⟩

def target10 : Weights.Entry :=
  { word := [10, 0, 8, 12, 0, 4, 8], weights := [0, 0, 1, 0] }

def points10 : List (ℕ × ℕ) := [(0, 2), (1, 0), (2, 1), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 7514, representative 489.
def source11 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B003.Data.entryAt ⟨93, by decide +kernel⟩

def target11 : Weights.Entry :=
  { word := [10, 0, 8, 12, 4, 4, 0], weights := [0, 0, 1, 1] }

def points11 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 7515, representative 404.
def source12 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B003.Data.entryAt ⟨9, by decide +kernel⟩

def target12 : Weights.Entry :=
  { word := [10, 0, 8, 12, 4, 4, 8], weights := [0, 0, 1, 1] }

def points12 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 7516, representative 475.
def source13 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B003.Data.entryAt ⟨79, by decide +kernel⟩

def target13 : Weights.Entry :=
  { word := [10, 0, 8, 12, 4, 12, 0], weights := [0, 0, 1, 1] }

def points13 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 7522, representative 409.
def source14 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B003.Data.entryAt ⟨14, by decide +kernel⟩

def target14 : Weights.Entry :=
  { word := [10, 0, 9, 0, 1, 4, 8], weights := [0, 0, 1, 0] }

def points14 : List (ℕ × ℕ) := [(0, 2), (1, 0), (2, 1), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 7526, representative 410.
def source15 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B003.Data.entryAt ⟨15, by decide +kernel⟩

def target15 : Weights.Entry :=
  { word := [10, 0, 9, 8, 1, 4, 8], weights := [0, 0, 1, 0] }

def points15 : List (ℕ × ℕ) := [(0, 2), (1, 0), (2, 1), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 7543, representative 477.
def source16 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B003.Data.entryAt ⟨81, by decide +kernel⟩

def target16 : Weights.Entry :=
  { word := [10, 0, 12, 2, 0, 8, 1], weights := [1, 0, 0, 1] }

def points16 : List (ℕ × ℕ) := [(0, 2), (1, 0), (2, 1), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 7568, representative 413.
def source17 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B003.Data.entryAt ⟨18, by decide +kernel⟩

def target17 : Weights.Entry :=
  { word := [10, 0, 12, 10, 0, 4, 8], weights := [1, 0, 1, 1] }

def points17 : List (ℕ × ℕ) := [(0, 2), (1, 0), (2, 1), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 7571, representative 478.
def source18 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B003.Data.entryAt ⟨82, by decide +kernel⟩

def target18 : Weights.Entry :=
  { word := [10, 0, 12, 10, 0, 8, 1], weights := [0, 1, 0, 1] }

def points18 : List (ℕ × ℕ) := [(0, 2), (1, 0), (2, 1), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 7606, representative 516.
def source19 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B003.Data.entryAt ⟨120, by decide +kernel⟩

def target19 : Weights.Entry :=
  { word := [10, 2, 0, 9, 8, 2, 10], weights := [1, 1, 0, 1] }

-- Period 7, original row 7613, representative 514.
def source20 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B003.Data.entryAt ⟨118, by decide +kernel⟩

def target20 : Weights.Entry :=
  { word := [10, 2, 0, 9, 8, 10, 10], weights := [1, 1, 0, 1] }

-- Period 7, original row 7619, representative 512.
def source21 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B003.Data.entryAt ⟨116, by decide +kernel⟩

def target21 : Weights.Entry :=
  { word := [10, 2, 0, 10, 0, 0, 10], weights := [1, 1, 0, 0] }

def points21 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 3), (4, 5), (5, 4), (6, 6)]

-- Period 7, original row 7647, representative 520.
def source22 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B003.Data.entryAt ⟨124, by decide +kernel⟩

def target22 : Weights.Entry :=
  { word := [10, 2, 2, 8, 1, 0, 10], weights := [1, 1, 0, 1] }

-- Period 7, original row 7661, representative 519.
def source23 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B003.Data.entryAt ⟨123, by decide +kernel⟩

def target23 : Weights.Entry :=
  { word := [10, 2, 2, 8, 9, 0, 10], weights := [1, 1, 0, 1] }

-- Period 7, original row 7678, representative 510.
def source24 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B003.Data.entryAt ⟨114, by decide +kernel⟩

def target24 : Weights.Entry :=
  { word := [10, 2, 8, 2, 0, 8, 10], weights := [1, 0, 0, 1] }

-- Period 7, original row 7709, representative 515.
def source25 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B003.Data.entryAt ⟨119, by decide +kernel⟩

def target25 : Weights.Entry :=
  { word := [10, 2, 8, 9, 8, 2, 10], weights := [1, 1, 0, 1] }

-- Period 7, original row 7716, representative 513.
def source26 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B003.Data.entryAt ⟨117, by decide +kernel⟩

def target26 : Weights.Entry :=
  { word := [10, 2, 8, 9, 8, 10, 10], weights := [1, 1, 0, 1] }

-- Period 7, original row 7728, representative 511.
def source27 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B003.Data.entryAt ⟨115, by decide +kernel⟩

def target27 : Weights.Entry :=
  { word := [10, 2, 8, 10, 0, 8, 10], weights := [1, 0, 0, 1] }

-- Period 7, original row 7756, representative 522.
def source28 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B003.Data.entryAt ⟨126, by decide +kernel⟩

def target28 : Weights.Entry :=
  { word := [10, 2, 8, 12, 2, 8, 10], weights := [1, 1, 1, 1] }

-- Period 7, original row 7768, representative 523.
def source29 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B003.Data.entryAt ⟨127, by decide +kernel⟩

def target29 : Weights.Entry :=
  { word := [10, 2, 8, 12, 10, 0, 10], weights := [1, 1, 1, 0] }

-- Period 7, original row 7773, representative 521.
def source30 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B003.Data.entryAt ⟨125, by decide +kernel⟩

def target30 : Weights.Entry :=
  { word := [10, 2, 8, 12, 10, 8, 10], weights := [1, 1, 1, 1] }

-- Period 7, original row 7787, representative 518.
def source31 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B003.Data.entryAt ⟨122, by decide +kernel⟩

def target31 : Weights.Entry :=
  { word := [10, 2, 10, 8, 1, 0, 10], weights := [1, 1, 0, 1] }

-- Period 7, original row 7801, representative 517.
def source32 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B003.Data.entryAt ⟨121, by decide +kernel⟩

def target32 : Weights.Entry :=
  { word := [10, 2, 10, 8, 9, 0, 10], weights := [1, 1, 0, 1] }

-- Period 7, original row 7819, representative 466.
def source33 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B003.Data.entryAt ⟨71, by decide +kernel⟩

def target33 : Weights.Entry :=
  { word := [10, 8, 0, 4, 2, 0, 1], weights := [1, 0, 0, 1] }

def points33 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 7831, representative 466.
def source34 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B003.Data.entryAt ⟨71, by decide +kernel⟩

def target34 : Weights.Entry :=
  { word := [10, 8, 0, 4, 4, 4, 0], weights := [1, 0, 1, 0] }

def points34 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 5), (4, 6), (5, 4), (6, 3)]

-- Period 7, original row 7832, representative 396.
def source35 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B003.Data.entryAt ⟨1, by decide +kernel⟩

def target35 : Weights.Entry :=
  { word := [10, 8, 0, 4, 4, 4, 8], weights := [1, 0, 0, 1] }

def points35 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 7839, representative 400.
def source36 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B003.Data.entryAt ⟨5, by decide +kernel⟩

def target36 : Weights.Entry :=
  { word := [10, 8, 0, 4, 8, 4, 8], weights := [1, 0, 0, 1] }

def points36 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 7845, representative 471.
def source37 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B003.Data.entryAt ⟨75, by decide +kernel⟩

def target37 : Weights.Entry :=
  { word := [10, 8, 0, 4, 10, 0, 1], weights := [1, 0, 0, 1] }

def points37 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 7857, representative 471.
def source38 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B003.Data.entryAt ⟨75, by decide +kernel⟩

def target38 : Weights.Entry :=
  { word := [10, 8, 0, 4, 12, 4, 0], weights := [1, 0, 1, 0] }

def points38 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 5), (4, 6), (5, 4), (6, 3)]

-- Period 7, original row 7858, representative 397.
def source39 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B003.Data.entryAt ⟨2, by decide +kernel⟩

def target39 : Weights.Entry :=
  { word := [10, 8, 0, 4, 12, 4, 8], weights := [1, 0, 0, 1] }

def points39 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 7865, representative 402.
def source40 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B003.Data.entryAt ⟨7, by decide +kernel⟩

def target40 : Weights.Entry :=
  { word := [10, 8, 0, 12, 0, 4, 8], weights := [1, 0, 0, 1] }

def points40 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 7871, representative 473.
def source41 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B003.Data.entryAt ⟨77, by decide +kernel⟩

def target41 : Weights.Entry :=
  { word := [10, 8, 0, 12, 2, 0, 1], weights := [1, 0, 0, 1] }

def points41 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 7883, representative 473.
def source42 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B003.Data.entryAt ⟨77, by decide +kernel⟩

def target42 : Weights.Entry :=
  { word := [10, 8, 0, 12, 4, 4, 0], weights := [1, 0, 1, 0] }

def points42 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 5), (4, 6), (5, 4), (6, 3)]

-- Period 7, original row 7884, representative 399.
def source43 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B003.Data.entryAt ⟨4, by decide +kernel⟩

def target43 : Weights.Entry :=
  { word := [10, 8, 0, 12, 4, 4, 8], weights := [1, 0, 0, 1] }

def points43 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 7890, representative 401.
def source44 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B003.Data.entryAt ⟨6, by decide +kernel⟩

def target44 : Weights.Entry :=
  { word := [10, 8, 0, 12, 8, 4, 8], weights := [1, 0, 0, 1] }

def points44 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 7896, representative 472.
def source45 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B003.Data.entryAt ⟨76, by decide +kernel⟩

def target45 : Weights.Entry :=
  { word := [10, 8, 0, 12, 10, 0, 1], weights := [1, 0, 0, 1] }

def points45 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 7908, representative 472.
def source46 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B003.Data.entryAt ⟨76, by decide +kernel⟩

def target46 : Weights.Entry :=
  { word := [10, 8, 0, 12, 12, 4, 0], weights := [1, 0, 1, 0] }

def points46 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 5), (4, 6), (5, 4), (6, 3)]

-- Period 7, original row 7909, representative 398.
def source47 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B003.Data.entryAt ⟨3, by decide +kernel⟩

def target47 : Weights.Entry :=
  { word := [10, 8, 0, 12, 12, 4, 8], weights := [1, 0, 0, 1] }

def points47 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 7910, representative 436.
def source48 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B003.Data.entryAt ⟨41, by decide +kernel⟩

def target48 : Weights.Entry :=
  { word := [10, 8, 2, 0, 1, 8, 1], weights := [0, 0, 1, 0] }

def points48 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 7913, representative 437.
def source49 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B003.Data.entryAt ⟨42, by decide +kernel⟩

def target49 : Weights.Entry :=
  { word := [10, 8, 2, 0, 9, 8, 1], weights := [0, 0, 1, 0] }

def points49 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 7921, representative 446.
def source50 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B003.Data.entryAt ⟨51, by decide +kernel⟩

def target50 : Weights.Entry :=
  { word := [10, 8, 4, 2, 0, 8, 1], weights := [1, 0, 0, 1] }

def points50 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 7948, representative 449.
def source51 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B003.Data.entryAt ⟨54, by decide +kernel⟩

def target51 : Weights.Entry :=
  { word := [10, 8, 4, 10, 0, 8, 1], weights := [0, 1, 0, 1] }

def points51 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 7969, representative 411.
def source52 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B003.Data.entryAt ⟨16, by decide +kernel⟩

def target52 : Weights.Entry :=
  { word := [10, 8, 8, 0, 1, 4, 8], weights := [0, 0, 1, 0] }

def points52 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 7983, representative 467.
def source53 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B003.Data.entryAt ⟨72, by decide +kernel⟩

def target53 : Weights.Entry :=
  { word := [10, 8, 8, 4, 2, 0, 1], weights := [1, 0, 0, 1] }

def points53 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 7995, representative 458.
def source54 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B003.Data.entryAt ⟨63, by decide +kernel⟩

def target54 : Weights.Entry :=
  { word := [10, 8, 8, 4, 4, 4, 0], weights := [1, 0, 0, 1] }

def points54 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 7997, representative 454.
def source55 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B003.Data.entryAt ⟨59, by decide +kernel⟩

def target55 : Weights.Entry :=
  { word := [10, 8, 8, 4, 4, 12, 0], weights := [1, 0, 0, 1] }

def points55 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8013, representative 468.
def source56 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B003.Data.entryAt ⟨73, by decide +kernel⟩

def target56 : Weights.Entry :=
  { word := [10, 8, 8, 4, 10, 0, 1], weights := [1, 0, 0, 1] }

def points56 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8025, representative 459.
def source57 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B003.Data.entryAt ⟨64, by decide +kernel⟩

def target57 : Weights.Entry :=
  { word := [10, 8, 8, 4, 12, 4, 0], weights := [1, 0, 0, 1] }

def points57 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8027, representative 455.
def source58 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B003.Data.entryAt ⟨60, by decide +kernel⟩

def target58 : Weights.Entry :=
  { word := [10, 8, 8, 4, 12, 12, 0], weights := [1, 0, 0, 1] }

def points58 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8031, representative 412.
def source59 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B003.Data.entryAt ⟨17, by decide +kernel⟩

def target59 : Weights.Entry :=
  { word := [10, 8, 8, 8, 1, 4, 8], weights := [0, 0, 1, 0] }

def points59 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8049, representative 395.
def source60 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B003.Data.entryAt ⟨0, by decide +kernel⟩

def target60 : Weights.Entry :=
  { word := [10, 8, 8, 12, 0, 4, 8], weights := [0, 0, 1, 0] }

def points60 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8057, representative 470.
def source61 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B003.Data.entryAt ⟨74, by decide +kernel⟩

def target61 : Weights.Entry :=
  { word := [10, 8, 8, 12, 2, 0, 1], weights := [1, 0, 0, 1] }

def points61 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8069, representative 461.
def source62 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B003.Data.entryAt ⟨66, by decide +kernel⟩

def target62 : Weights.Entry :=
  { word := [10, 8, 8, 12, 4, 4, 0], weights := [1, 0, 0, 1] }

def points62 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8071, representative 457.
def source63 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B003.Data.entryAt ⟨62, by decide +kernel⟩

def target63 : Weights.Entry :=
  { word := [10, 8, 8, 12, 4, 12, 0], weights := [1, 0, 0, 1] }

def points63 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8098, representative 460.
def source64 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B003.Data.entryAt ⟨65, by decide +kernel⟩

def target64 : Weights.Entry :=
  { word := [10, 8, 8, 12, 12, 4, 0], weights := [1, 0, 0, 1] }

def points64 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8100, representative 456.
def source65 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B003.Data.entryAt ⟨61, by decide +kernel⟩

def target65 : Weights.Entry :=
  { word := [10, 8, 8, 12, 12, 12, 0], weights := [1, 0, 0, 1] }

def points65 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8102, representative 407.
def source66 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B003.Data.entryAt ⟨12, by decide +kernel⟩

def target66 : Weights.Entry :=
  { word := [10, 8, 9, 0, 1, 4, 8], weights := [0, 0, 1, 0] }

def points66 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8106, representative 408.
def source67 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B003.Data.entryAt ⟨13, by decide +kernel⟩

def target67 : Weights.Entry :=
  { word := [10, 8, 9, 8, 1, 4, 8], weights := [0, 0, 1, 0] }

def points67 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8118, representative 434.
def source68 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B003.Data.entryAt ⟨39, by decide +kernel⟩

def target68 : Weights.Entry :=
  { word := [10, 8, 10, 0, 1, 8, 1], weights := [0, 0, 1, 0] }

def points68 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8121, representative 435.
def source69 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B003.Data.entryAt ⟨40, by decide +kernel⟩

def target69 : Weights.Entry :=
  { word := [10, 8, 10, 0, 9, 8, 1], weights := [0, 0, 1, 0] }

def points69 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8129, representative 447.
def source70 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B003.Data.entryAt ⟨52, by decide +kernel⟩

def target70 : Weights.Entry :=
  { word := [10, 8, 12, 2, 0, 8, 1], weights := [1, 0, 0, 1] }

def points70 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8156, representative 448.
def source71 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B003.Data.entryAt ⟨53, by decide +kernel⟩

def target71 : Weights.Entry :=
  { word := [10, 8, 12, 10, 0, 8, 1], weights := [0, 1, 0, 1] }

def points71 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8193, representative 500.
def source72 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B003.Data.entryAt ⟨104, by decide +kernel⟩

def target72 : Weights.Entry :=
  { word := [10, 10, 0, 9, 8, 2, 10], weights := [1, 1, 0, 1] }

-- Period 7, original row 8200, representative 498.
def source73 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B003.Data.entryAt ⟨102, by decide +kernel⟩

def target73 : Weights.Entry :=
  { word := [10, 10, 0, 9, 8, 10, 10], weights := [1, 1, 0, 1] }

-- Period 7, original row 8206, representative 492.
def source74 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B003.Data.entryAt ⟨96, by decide +kernel⟩

def target74 : Weights.Entry :=
  { word := [10, 10, 0, 10, 0, 0, 10], weights := [1, 1, 0, 0] }

-- Period 7, original row 8223, representative 506.
def source75 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B003.Data.entryAt ⟨110, by decide +kernel⟩

def target75 : Weights.Entry :=
  { word := [10, 10, 0, 12, 2, 0, 10], weights := [1, 1, 0, 1] }

def points75 : List (ℕ × ℕ) := [(0, 1), (1, 2), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8231, representative 505.
def source76 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B003.Data.entryAt ⟨109, by decide +kernel⟩

def target76 : Weights.Entry :=
  { word := [10, 10, 0, 12, 10, 0, 10], weights := [1, 1, 0, 1] }

def points76 : List (ℕ × ℕ) := [(0, 1), (1, 2), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8239, representative 496.
def source77 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B003.Data.entryAt ⟨100, by decide +kernel⟩

def target77 : Weights.Entry :=
  { word := [10, 10, 2, 8, 1, 0, 10], weights := [1, 1, 0, 1] }

-- Period 7, original row 8253, representative 495.
def source78 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B003.Data.entryAt ⟨99, by decide +kernel⟩

def target78 : Weights.Entry :=
  { word := [10, 10, 2, 8, 9, 0, 10], weights := [1, 1, 0, 1] }

-- Period 7, original row 8271, representative 490.
def source79 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B003.Data.entryAt ⟨94, by decide +kernel⟩

def target79 : Weights.Entry :=
  { word := [10, 10, 8, 2, 0, 8, 10], weights := [1, 0, 0, 1] }

-- Period 7, original row 8302, representative 499.
def source80 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B003.Data.entryAt ⟨103, by decide +kernel⟩

def target80 : Weights.Entry :=
  { word := [10, 10, 8, 9, 8, 2, 10], weights := [1, 1, 0, 1] }

-- Period 7, original row 8309, representative 497.
def source81 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B003.Data.entryAt ⟨101, by decide +kernel⟩

def target81 : Weights.Entry :=
  { word := [10, 10, 8, 9, 8, 10, 10], weights := [1, 1, 0, 1] }

-- Period 7, original row 8321, representative 491.
def source82 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B003.Data.entryAt ⟨95, by decide +kernel⟩

def target82 : Weights.Entry :=
  { word := [10, 10, 8, 10, 0, 8, 10], weights := [1, 0, 0, 1] }

-- Period 7, original row 8345, representative 504.
def source83 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B003.Data.entryAt ⟨108, by decide +kernel⟩

def target83 : Weights.Entry :=
  { word := [10, 10, 8, 12, 2, 0, 10], weights := [1, 1, 1, 0] }

-- Period 7, original row 8350, representative 502.
def source84 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B003.Data.entryAt ⟨106, by decide +kernel⟩

def target84 : Weights.Entry :=
  { word := [10, 10, 8, 12, 2, 8, 10], weights := [1, 1, 1, 1] }

-- Period 7, original row 8367, representative 503.
def source85 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B003.Data.entryAt ⟨107, by decide +kernel⟩

def target85 : Weights.Entry :=
  { word := [10, 10, 8, 12, 10, 0, 10], weights := [1, 1, 1, 0] }

-- Period 7, original row 8372, representative 501.
def source86 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B003.Data.entryAt ⟨105, by decide +kernel⟩

def target86 : Weights.Entry :=
  { word := [10, 10, 8, 12, 10, 8, 10], weights := [1, 1, 1, 1] }

-- Period 7, original row 8383, representative 494.
def source87 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B003.Data.entryAt ⟨98, by decide +kernel⟩

def target87 : Weights.Entry :=
  { word := [10, 10, 10, 8, 1, 0, 10], weights := [1, 1, 0, 1] }

-- Period 7, original row 8397, representative 493.
def source88 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B003.Data.entryAt ⟨97, by decide +kernel⟩

def target88 : Weights.Entry :=
  { word := [10, 10, 10, 8, 9, 0, 10], weights := [1, 1, 0, 1] }

-- Period 7, original row 8410, representative 520.
def source89 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B003.Data.entryAt ⟨124, by decide +kernel⟩

def target89 : Weights.Entry :=
  { word := [12, 0, 0, 9, 4, 4, 12], weights := [1, 0, 1, 1] }

def points89 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8412, representative 496.
def source90 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B003.Data.entryAt ⟨100, by decide +kernel⟩

def target90 : Weights.Entry :=
  { word := [12, 0, 0, 9, 4, 12, 12], weights := [1, 0, 1, 1] }

def points90 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8414, representative 518.
def source91 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B003.Data.entryAt ⟨122, by decide +kernel⟩

def target91 : Weights.Entry :=
  { word := [12, 0, 0, 9, 12, 4, 12], weights := [1, 0, 1, 1] }

def points91 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8416, representative 494.
def source92 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B003.Data.entryAt ⟨98, by decide +kernel⟩

def target92 : Weights.Entry :=
  { word := [12, 0, 0, 9, 12, 12, 12], weights := [1, 0, 1, 1] }

def points92 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8423, representative 512.
def source93 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B003.Data.entryAt ⟨116, by decide +kernel⟩

def target93 : Weights.Entry :=
  { word := [12, 0, 0, 12, 0, 4, 12], weights := [1, 0, 1, 0] }

def points93 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 8426, representative 492.
def source94 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B003.Data.entryAt ⟨96, by decide +kernel⟩

def target94 : Weights.Entry :=
  { word := [12, 0, 0, 12, 0, 12, 12], weights := [0, 0, 1, 1] }

def points94 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8433, representative 480.
def source95 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B003.Data.entryAt ⟨84, by decide +kernel⟩

def target95 : Weights.Entry :=
  { word := [12, 0, 4, 2, 0, 8, 2], weights := [0, 1, 0, 1] }

def points95 : List (ℕ × ℕ) := [(0, 2), (1, 0), (2, 1), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8461, representative 487.
def source96 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B003.Data.entryAt ⟨91, by decide +kernel⟩

def target96 : Weights.Entry :=
  { word := [12, 0, 4, 10, 0, 8, 2], weights := [0, 1, 0, 1] }

def points96 : List (ℕ × ℕ) := [(0, 2), (1, 0), (2, 1), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8473, representative 506.
def source97 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B003.Data.entryAt ⟨110, by decide +kernel⟩

def target97 : Weights.Entry :=
  { word := [12, 0, 4, 10, 0, 12, 12], weights := [1, 0, 1, 1] }

def points97 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 8481, representative 504.
def source98 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B003.Data.entryAt ⟨108, by decide +kernel⟩

def target98 : Weights.Entry :=
  { word := [12, 0, 4, 10, 8, 12, 12], weights := [0, 1, 1, 1] }

def points98 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8501, representative 519.
def source99 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B003.Data.entryAt ⟨123, by decide +kernel⟩

def target99 : Weights.Entry :=
  { word := [12, 0, 8, 9, 4, 4, 12], weights := [1, 0, 1, 1] }

def points99 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8503, representative 495.
def source100 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B003.Data.entryAt ⟨99, by decide +kernel⟩

def target100 : Weights.Entry :=
  { word := [12, 0, 8, 9, 4, 12, 12], weights := [1, 0, 1, 1] }

def points100 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8505, representative 517.
def source101 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B003.Data.entryAt ⟨121, by decide +kernel⟩

def target101 : Weights.Entry :=
  { word := [12, 0, 8, 9, 12, 4, 12], weights := [1, 0, 1, 1] }

def points101 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8507, representative 493.
def source102 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B003.Data.entryAt ⟨97, by decide +kernel⟩

def target102 : Weights.Entry :=
  { word := [12, 0, 8, 9, 12, 12, 12], weights := [1, 0, 1, 1] }

def points102 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8522, representative 481.
def source103 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B003.Data.entryAt ⟨85, by decide +kernel⟩

def target103 : Weights.Entry :=
  { word := [12, 0, 12, 2, 0, 8, 2], weights := [0, 1, 0, 1] }

def points103 : List (ℕ × ℕ) := [(0, 2), (1, 0), (2, 1), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8554, representative 484.
def source104 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B003.Data.entryAt ⟨88, by decide +kernel⟩

def target104 : Weights.Entry :=
  { word := [12, 0, 12, 10, 0, 8, 2], weights := [0, 1, 0, 1] }

def points104 : List (ℕ × ℕ) := [(0, 2), (1, 0), (2, 1), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8566, representative 505.
def source105 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B003.Data.entryAt ⟨109, by decide +kernel⟩

def target105 : Weights.Entry :=
  { word := [12, 0, 12, 10, 0, 12, 12], weights := [1, 0, 1, 1] }

def points105 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 8569, representative 523.
def source106 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B003.Data.entryAt ⟨127, by decide +kernel⟩

def target106 : Weights.Entry :=
  { word := [12, 0, 12, 10, 8, 4, 12], weights := [0, 1, 1, 1] }

def points106 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8574, representative 503.
def source107 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B003.Data.entryAt ⟨107, by decide +kernel⟩

def target107 : Weights.Entry :=
  { word := [12, 0, 12, 10, 8, 12, 12], weights := [0, 1, 1, 1] }

def points107 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8600, representative 512.
def source108 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B003.Data.entryAt ⟨116, by decide +kernel⟩

def target108 : Weights.Entry :=
  { word := [12, 2, 0, 10, 0, 0, 9], weights := [1, 1, 0, 0] }

def points108 : List (ℕ × ℕ) := [(0, 1), (1, 2), (2, 0), (3, 3), (4, 5), (5, 4), (6, 6)]

-- Period 7, original row 8607, representative 509.
def source109 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B003.Data.entryAt ⟨113, by decide +kernel⟩

def target109 : Weights.Entry :=
  { word := [12, 2, 0, 10, 0, 8, 9], weights := [0, 1, 0, 1] }

def points109 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8630, representative 507.
def source110 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B003.Data.entryAt ⟨111, by decide +kernel⟩

def target110 : Weights.Entry :=
  { word := [12, 2, 8, 2, 0, 8, 9], weights := [0, 1, 0, 1] }

def points110 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8663, representative 508.
def source111 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B003.Data.entryAt ⟨112, by decide +kernel⟩

def target111 : Weights.Entry :=
  { word := [12, 2, 8, 10, 0, 8, 9], weights := [0, 1, 0, 1] }

def points111 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8689, representative 445.
def source112 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B003.Data.entryAt ⟨50, by decide +kernel⟩

def target112 : Weights.Entry :=
  { word := [12, 4, 4, 8, 8, 2, 2], weights := [0, 1, 1, 0] }

def points112 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8691, representative 441.
def source113 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B003.Data.entryAt ⟨46, by decide +kernel⟩

def target113 : Weights.Entry :=
  { word := [12, 4, 4, 8, 8, 10, 2], weights := [0, 1, 1, 0] }

def points113 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8699, representative 516.
def source114 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B003.Data.entryAt ⟨120, by decide +kernel⟩

def target114 : Weights.Entry :=
  { word := [12, 4, 8, 8, 1, 4, 12], weights := [1, 0, 1, 1] }

def points114 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8704, representative 500.
def source115 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B003.Data.entryAt ⟨104, by decide +kernel⟩

def target115 : Weights.Entry :=
  { word := [12, 4, 8, 8, 1, 12, 12], weights := [1, 0, 1, 1] }

def points115 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8705, representative 444.
def source116 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B003.Data.entryAt ⟨49, by decide +kernel⟩

def target116 : Weights.Entry :=
  { word := [12, 4, 8, 8, 2, 2, 2], weights := [0, 1, 1, 0] }

def points116 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8707, representative 439.
def source117 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B003.Data.entryAt ⟨44, by decide +kernel⟩

def target117 : Weights.Entry :=
  { word := [12, 4, 8, 8, 2, 10, 2], weights := [0, 1, 1, 0] }

def points117 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8711, representative 515.
def source118 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B003.Data.entryAt ⟨119, by decide +kernel⟩

def target118 : Weights.Entry :=
  { word := [12, 4, 8, 8, 9, 4, 12], weights := [1, 0, 1, 1] }

def points118 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8713, representative 499.
def source119 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B003.Data.entryAt ⟨103, by decide +kernel⟩

def target119 : Weights.Entry :=
  { word := [12, 4, 8, 8, 9, 12, 12], weights := [1, 0, 1, 1] }

def points119 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8714, representative 443.
def source120 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B003.Data.entryAt ⟨48, by decide +kernel⟩

def target120 : Weights.Entry :=
  { word := [12, 4, 8, 8, 10, 2, 2], weights := [0, 1, 1, 0] }

def points120 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8716, representative 438.
def source121 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B003.Data.entryAt ⟨43, by decide +kernel⟩

def target121 : Weights.Entry :=
  { word := [12, 4, 8, 8, 10, 10, 2], weights := [0, 1, 1, 0] }

def points121 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8719, representative 442.
def source122 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B003.Data.entryAt ⟨47, by decide +kernel⟩

def target122 : Weights.Entry :=
  { word := [12, 4, 12, 8, 8, 2, 2], weights := [0, 1, 1, 0] }

def points122 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8721, representative 440.
def source123 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B003.Data.entryAt ⟨45, by decide +kernel⟩

def target123 : Weights.Entry :=
  { word := [12, 4, 12, 8, 8, 10, 2], weights := [0, 1, 1, 0] }

def points123 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8736, representative 466.
def source124 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B003.Data.entryAt ⟨71, by decide +kernel⟩

def target124 : Weights.Entry :=
  { word := [12, 8, 0, 4, 2, 0, 2], weights := [1, 0, 0, 1] }

def points124 : List (ℕ × ℕ) := [(0, 1), (1, 2), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8742, representative 462.
def source125 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B003.Data.entryAt ⟨67, by decide +kernel⟩

def target125 : Weights.Entry :=
  { word := [12, 8, 0, 4, 2, 8, 2], weights := [1, 0, 0, 1] }

def points125 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8757, representative 510.
def source126 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B003.Data.entryAt ⟨114, by decide +kernel⟩

def target126 : Weights.Entry :=
  { word := [12, 8, 0, 4, 8, 4, 12], weights := [1, 0, 0, 1] }

def points126 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8760, representative 490.
def source127 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B003.Data.entryAt ⟨94, by decide +kernel⟩

def target127 : Weights.Entry :=
  { word := [12, 8, 0, 4, 8, 12, 12], weights := [1, 0, 0, 1] }

def points127 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

def period7Entries : List Weights.Entry := [target0, target1, target2, target3, target4, target5, target6, target7, target8, target9, target10, target11, target12, target13, target14, target15, target16, target17, target18, target19, target20, target21, target22, target23, target24, target25, target26, target27, target28, target29, target30, target31, target32, target33, target34, target35, target36, target37, target38, target39, target40, target41, target42, target43, target44, target45, target46, target47, target48, target49, target50, target51, target52, target53, target54, target55, target56, target57, target58, target59, target60, target61, target62, target63, target64, target65, target66, target67, target68, target69, target70, target71, target72, target73, target74, target75, target76, target77, target78, target79, target80, target81, target82, target83, target84, target85, target86, target87, target88, target89, target90, target91, target92, target93, target94, target95, target96, target97, target98, target99, target100, target101, target102, target103, target104, target105, target106, target107, target108, target109, target110, target111, target112, target113, target114, target115, target116, target117, target118, target119, target120, target121, target122, target123, target124, target125, target126, target127]

def period7Chunk : RowCoverage.Chunk where
  rows := [⟨5959, target0⟩, ⟨5965, target1⟩, ⟨5987, target2⟩, ⟨5993, target3⟩, ⟨7415, target4⟩, ⟨7426, target5⟩, ⟨7449, target6⟩, ⟨7484, target7⟩, ⟨7485, target8⟩, ⟨7486, target9⟩, ⟨7506, target10⟩, ⟨7514, target11⟩, ⟨7515, target12⟩, ⟨7516, target13⟩, ⟨7522, target14⟩, ⟨7526, target15⟩, ⟨7543, target16⟩, ⟨7568, target17⟩, ⟨7571, target18⟩, ⟨7606, target19⟩, ⟨7613, target20⟩, ⟨7619, target21⟩, ⟨7647, target22⟩, ⟨7661, target23⟩, ⟨7678, target24⟩, ⟨7709, target25⟩, ⟨7716, target26⟩, ⟨7728, target27⟩, ⟨7756, target28⟩, ⟨7768, target29⟩, ⟨7773, target30⟩, ⟨7787, target31⟩, ⟨7801, target32⟩, ⟨7819, target33⟩, ⟨7831, target34⟩, ⟨7832, target35⟩, ⟨7839, target36⟩, ⟨7845, target37⟩, ⟨7857, target38⟩, ⟨7858, target39⟩, ⟨7865, target40⟩, ⟨7871, target41⟩, ⟨7883, target42⟩, ⟨7884, target43⟩, ⟨7890, target44⟩, ⟨7896, target45⟩, ⟨7908, target46⟩, ⟨7909, target47⟩, ⟨7910, target48⟩, ⟨7913, target49⟩, ⟨7921, target50⟩, ⟨7948, target51⟩, ⟨7969, target52⟩, ⟨7983, target53⟩, ⟨7995, target54⟩, ⟨7997, target55⟩, ⟨8013, target56⟩, ⟨8025, target57⟩, ⟨8027, target58⟩, ⟨8031, target59⟩, ⟨8049, target60⟩, ⟨8057, target61⟩, ⟨8069, target62⟩, ⟨8071, target63⟩, ⟨8098, target64⟩, ⟨8100, target65⟩, ⟨8102, target66⟩, ⟨8106, target67⟩, ⟨8118, target68⟩, ⟨8121, target69⟩, ⟨8129, target70⟩, ⟨8156, target71⟩, ⟨8193, target72⟩, ⟨8200, target73⟩, ⟨8206, target74⟩, ⟨8223, target75⟩, ⟨8231, target76⟩, ⟨8239, target77⟩, ⟨8253, target78⟩, ⟨8271, target79⟩, ⟨8302, target80⟩, ⟨8309, target81⟩, ⟨8321, target82⟩, ⟨8345, target83⟩, ⟨8350, target84⟩, ⟨8367, target85⟩, ⟨8372, target86⟩, ⟨8383, target87⟩, ⟨8397, target88⟩, ⟨8410, target89⟩, ⟨8412, target90⟩, ⟨8414, target91⟩, ⟨8416, target92⟩, ⟨8423, target93⟩, ⟨8426, target94⟩, ⟨8433, target95⟩, ⟨8461, target96⟩, ⟨8473, target97⟩, ⟨8481, target98⟩, ⟨8501, target99⟩, ⟨8503, target100⟩, ⟨8505, target101⟩, ⟨8507, target102⟩, ⟨8522, target103⟩, ⟨8554, target104⟩, ⟨8566, target105⟩, ⟨8569, target106⟩, ⟨8574, target107⟩, ⟨8600, target108⟩, ⟨8607, target109⟩, ⟨8630, target110⟩, ⟨8663, target111⟩, ⟨8689, target112⟩, ⟨8691, target113⟩, ⟨8699, target114⟩, ⟨8704, target115⟩, ⟨8705, target116⟩, ⟨8707, target117⟩, ⟨8711, target118⟩, ⟨8713, target119⟩, ⟨8714, target120⟩, ⟨8716, target121⟩, ⟨8719, target122⟩, ⟨8721, target123⟩, ⟨8736, target124⟩, ⟨8742, target125⟩, ⟨8757, target126⟩, ⟨8760, target127⟩]
  indexMask := 1185539516664052128376307917762526453543975966532110936023912222290826799363612922980110334262897410092409033284862644151707065753221944665848817395235891590641388955404655546685622230824042262811787437763727198181341038320150219005143527650547570344604601575254570966336838646885861633335816031336069788857754870794504547831029116966058611437231898417952031120960837140336530704705324480531870298251901314652437972563546434083279464427732580982459240614844161243608070083517131370392258623141114151554740804407547033174128152140681058883886678463424236759390721811324779540165152586425396305288019040923438511038838217710025166084627872430850217470032847598319205163500289477642977351109462985253298586926724995569095564366391949263522835649334446228068604980444792496757046431262031170552641395320723584213642774851486294088958774142721890227470907116739788368790970654027891670147297413817328663668379670685496691201780228870661586347671358511997517158919892167994626038317095642312410634219399432916942335536709036872047999747453678504519384419273530454203633358620214150509502786778124661200771700773578323754026690072153695952416204075165655680606787180624460206560851670154041652398096037576855507378419930580423753555414944606925589143635633428580825435200881803144484104887928902635301991853229782297969225368184393878578526985128753326422727926477344583545543016086847413392671176183859624473162926118161822235490638235253668267241319627597506212496527967568634405258313945408729879023076164675024953499549040625000709163567142812814350502565613563513074327918856675250937704529395062035499000531621482839996691561662470340636420236028287361206468106421481700242793721723307691286729561991700808387072082203008372257362958547737610531949139987998260886698367781607684401810805929580791820054320652735974319497331252061854813431811342198472274090650760158990564078994733025645880443239180053008948674646616197103056917831789873876832935384687543277915978163371537737399581535195002057890499398943957976007646384224403364748957271180357093653210558769858007084791001115473507449450779677926950080981467396606652971425501954055409507651909056943996125251875828297895228560399100147740376140100726480371820403028703857740232590969110155647718636015696003349539842131536058964928504175615695519224149598330748953606194804154829453098689943628363908835275330376800757943675470338757243995931031255216683051561541649771090230600088066291230011146220648185992023791084207867093165530642804095258908430780663289959963973615935170882868950153066470089572951741864800090610618445685340138359636662284911994548111314250706791961990040387584
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

end FranklSmallCyclic.TransportBatches.G003.B001.Data
