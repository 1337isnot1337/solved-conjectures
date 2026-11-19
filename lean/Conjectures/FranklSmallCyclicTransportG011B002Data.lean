module

public import Conjectures.FranklSmallCyclicRowCoverage
public import Conjectures.FranklSmallCyclicCanonicalWords
public import Conjectures.FranklSmallCyclicOrbit7Block011Data

/-! 128 literal targets sharing one source proof block.
Original words and row indices are retained; weights may be transported.
-/
@[expose] public section

namespace FranklSmallCyclic.TransportBatches.G011.B002.Data

-- Period 7, original row 4529, representative 1548.
def source0 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨127, by decide +kernel⟩

def target0 : Weights.Entry :=
  { word := [8, 1, 4, 2, 0, 10, 0], weights := [0, 1, 0, 0] }

def points0 : List (ℕ × ℕ) := [(0, 2), (1, 0), (2, 1), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 4543, representative 1547.
def source1 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨126, by decide +kernel⟩

def target1 : Weights.Entry :=
  { word := [8, 1, 4, 8, 4, 10, 0], weights := [0, 1, 1, 0] }

def points1 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 4618, representative 1545.
def source2 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨124, by decide +kernel⟩

def target2 : Weights.Entry :=
  { word := [8, 1, 12, 2, 0, 10, 0], weights := [0, 1, 0, 0] }

def points2 : List (ℕ × ℕ) := [(0, 2), (1, 0), (2, 1), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 4624, representative 1546.
def source3 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨125, by decide +kernel⟩

def target3 : Weights.Entry :=
  { word := [8, 1, 12, 2, 8, 10, 0], weights := [0, 1, 0, 0] }

def points3 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 4632, representative 1544.
def source4 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨123, by decide +kernel⟩

def target4 : Weights.Entry :=
  { word := [8, 1, 12, 8, 4, 10, 0], weights := [0, 1, 1, 0] }

def points4 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 5848, representative 1435.
def source5 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨14, by decide +kernel⟩

def target5 : Weights.Entry :=
  { word := [8, 9, 0, 1, 4, 2, 0], weights := [1, 0, 1, 0] }

def points5 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 5852, representative 1436.
def source6 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨15, by decide +kernel⟩

def target6 : Weights.Entry :=
  { word := [8, 9, 0, 1, 4, 10, 0], weights := [1, 0, 1, 0] }

def points6 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 5854, representative 1438.
def source7 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨17, by decide +kernel⟩

def target7 : Weights.Entry :=
  { word := [8, 9, 0, 1, 12, 2, 0], weights := [1, 0, 1, 0] }

def points7 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 5858, representative 1437.
def source8 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨16, by decide +kernel⟩

def target8 : Weights.Entry :=
  { word := [8, 9, 0, 1, 12, 10, 0], weights := [1, 0, 1, 0] }

def points8 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 5860, representative 1435.
def source9 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨14, by decide +kernel⟩

def target9 : Weights.Entry :=
  { word := [8, 9, 0, 2, 2, 2, 0], weights := [1, 0, 0, 1] }

def points9 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 5), (4, 6), (5, 4), (6, 3)]

-- Period 7, original row 5862, representative 1436.
def source10 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨15, by decide +kernel⟩

def target10 : Weights.Entry :=
  { word := [8, 9, 0, 2, 2, 10, 0], weights := [1, 0, 0, 1] }

def points10 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 5), (4, 6), (5, 4), (6, 3)]

-- Period 7, original row 5864, representative 1438.
def source11 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨17, by decide +kernel⟩

def target11 : Weights.Entry :=
  { word := [8, 9, 0, 2, 10, 2, 0], weights := [1, 0, 0, 1] }

def points11 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 5), (4, 6), (5, 4), (6, 3)]

-- Period 7, original row 5866, representative 1437.
def source12 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨16, by decide +kernel⟩

def target12 : Weights.Entry :=
  { word := [8, 9, 0, 2, 10, 10, 0], weights := [1, 0, 0, 1] }

def points12 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 5), (4, 6), (5, 4), (6, 3)]

-- Period 7, original row 5886, representative 1430.
def source13 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨9, by decide +kernel⟩

def target13 : Weights.Entry :=
  { word := [8, 9, 0, 4, 6, 0, 0], weights := [1, 0, 1, 0] }

def points13 : List (ℕ × ℕ) := [(0, 1), (1, 2), (2, 0), (3, 5), (4, 6), (5, 4), (6, 3)]

-- Period 7, original row 5888, representative 1428.
def source14 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨7, by decide +kernel⟩

def target14 : Weights.Entry :=
  { word := [8, 9, 0, 4, 6, 8, 0], weights := [1, 0, 1, 0] }

def points14 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 5), (4, 6), (5, 4), (6, 3)]

-- Period 7, original row 5947, representative 1429.
def source15 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨8, by decide +kernel⟩

def target15 : Weights.Entry :=
  { word := [8, 9, 0, 12, 6, 8, 0], weights := [1, 0, 1, 0] }

def points15 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 5), (4, 6), (5, 4), (6, 3)]

-- Period 7, original row 5985, representative 1431.
def source16 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨10, by decide +kernel⟩

def target16 : Weights.Entry :=
  { word := [8, 9, 8, 1, 4, 2, 0], weights := [1, 0, 1, 0] }

def points16 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 5989, representative 1432.
def source17 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨11, by decide +kernel⟩

def target17 : Weights.Entry :=
  { word := [8, 9, 8, 1, 4, 10, 0], weights := [1, 0, 1, 0] }

def points17 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 5991, representative 1434.
def source18 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨13, by decide +kernel⟩

def target18 : Weights.Entry :=
  { word := [8, 9, 8, 1, 12, 2, 0], weights := [1, 0, 1, 0] }

def points18 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 5995, representative 1433.
def source19 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨12, by decide +kernel⟩

def target19 : Weights.Entry :=
  { word := [8, 9, 8, 1, 12, 10, 0], weights := [1, 0, 1, 0] }

def points19 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 5997, representative 1424.
def source20 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨3, by decide +kernel⟩

def target20 : Weights.Entry :=
  { word := [8, 9, 8, 2, 2, 2, 0], weights := [0, 1, 0, 1] }

def points20 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 5999, representative 1425.
def source21 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨4, by decide +kernel⟩

def target21 : Weights.Entry :=
  { word := [8, 9, 8, 2, 2, 10, 0], weights := [0, 1, 0, 1] }

def points21 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 6001, representative 1427.
def source22 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨6, by decide +kernel⟩

def target22 : Weights.Entry :=
  { word := [8, 9, 8, 2, 10, 2, 0], weights := [0, 1, 0, 1] }

def points22 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 6003, representative 1426.
def source23 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨5, by decide +kernel⟩

def target23 : Weights.Entry :=
  { word := [8, 9, 8, 2, 10, 10, 0], weights := [0, 1, 0, 1] }

def points23 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 6009, representative 1423.
def source24 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨2, by decide +kernel⟩

def target24 : Weights.Entry :=
  { word := [8, 9, 8, 4, 6, 0, 0], weights := [0, 0, 1, 0] }

def points24 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 6011, representative 1421.
def source25 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨0, by decide +kernel⟩

def target25 : Weights.Entry :=
  { word := [8, 9, 8, 4, 6, 8, 0], weights := [0, 0, 1, 0] }

def points25 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 6040, representative 1422.
def source26 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨1, by decide +kernel⟩

def target26 : Weights.Entry :=
  { word := [8, 9, 8, 12, 6, 8, 0], weights := [0, 0, 1, 0] }

def points26 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 7398, representative 1538.
def source27 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨117, by decide +kernel⟩

def target27 : Weights.Entry :=
  { word := [10, 0, 0, 1, 4, 10, 0], weights := [1, 0, 1, 0] }

def points27 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 7401, representative 1538.
def source28 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨117, by decide +kernel⟩

def target28 : Weights.Entry :=
  { word := [10, 0, 0, 2, 2, 10, 0], weights := [1, 0, 0, 1] }

def points28 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 5), (4, 6), (5, 4), (6, 3)]

-- Period 7, original row 7433, representative 1542.
def source29 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨121, by decide +kernel⟩

def target29 : Weights.Entry :=
  { word := [10, 0, 4, 2, 0, 9, 0], weights := [1, 0, 0, 1] }

def points29 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 7435, representative 1542.
def source30 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨121, by decide +kernel⟩

def target30 : Weights.Entry :=
  { word := [10, 0, 4, 2, 0, 10, 0], weights := [1, 0, 0, 1] }

def points30 : List (ℕ × ℕ) := [(0, 2), (1, 0), (2, 1), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 7441, representative 1543.
def source31 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨122, by decide +kernel⟩

def target31 : Weights.Entry :=
  { word := [10, 0, 4, 2, 8, 10, 0], weights := [1, 0, 0, 1] }

def points31 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 7475, representative 1539.
def source32 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨118, by decide +kernel⟩

def target32 : Weights.Entry :=
  { word := [10, 0, 8, 1, 4, 10, 0], weights := [1, 0, 1, 0] }

def points32 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 7478, representative 1536.
def source33 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨115, by decide +kernel⟩

def target33 : Weights.Entry :=
  { word := [10, 0, 8, 2, 2, 10, 0], weights := [1, 0, 0, 1] }

def points33 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 7482, representative 1537.
def source34 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨116, by decide +kernel⟩

def target34 : Weights.Entry :=
  { word := [10, 0, 8, 2, 10, 10, 0], weights := [1, 0, 0, 1] }

def points34 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 7550, representative 1540.
def source35 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨119, by decide +kernel⟩

def target35 : Weights.Entry :=
  { word := [10, 0, 12, 2, 0, 9, 0], weights := [1, 0, 0, 1] }

def points35 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 7552, representative 1540.
def source36 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨119, by decide +kernel⟩

def target36 : Weights.Entry :=
  { word := [10, 0, 12, 2, 0, 10, 0], weights := [1, 0, 0, 1] }

def points36 : List (ℕ × ℕ) := [(0, 2), (1, 0), (2, 1), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 7558, representative 1541.
def source37 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨120, by decide +kernel⟩

def target37 : Weights.Entry :=
  { word := [10, 0, 12, 2, 8, 10, 0], weights := [1, 0, 0, 1] }

def points37 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 7807, representative 1514.
def source38 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨93, by decide +kernel⟩

def target38 : Weights.Entry :=
  { word := [10, 8, 0, 1, 4, 2, 0], weights := [1, 0, 1, 0] }

def points38 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 7808, representative 1515.
def source39 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨94, by decide +kernel⟩

def target39 : Weights.Entry :=
  { word := [10, 8, 0, 1, 4, 10, 0], weights := [1, 0, 1, 0] }

def points39 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 7809, representative 1517.
def source40 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨96, by decide +kernel⟩

def target40 : Weights.Entry :=
  { word := [10, 8, 0, 1, 12, 2, 0], weights := [1, 0, 1, 0] }

def points40 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 7810, representative 1516.
def source41 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨95, by decide +kernel⟩

def target41 : Weights.Entry :=
  { word := [10, 8, 0, 1, 12, 10, 0], weights := [1, 0, 1, 0] }

def points41 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 7811, representative 1514.
def source42 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨93, by decide +kernel⟩

def target42 : Weights.Entry :=
  { word := [10, 8, 0, 2, 2, 2, 0], weights := [1, 0, 0, 1] }

def points42 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 5), (4, 6), (5, 4), (6, 3)]

-- Period 7, original row 7813, representative 1515.
def source43 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨94, by decide +kernel⟩

def target43 : Weights.Entry :=
  { word := [10, 8, 0, 2, 2, 10, 0], weights := [1, 0, 0, 1] }

def points43 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 5), (4, 6), (5, 4), (6, 3)]

-- Period 7, original row 7815, representative 1517.
def source44 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨96, by decide +kernel⟩

def target44 : Weights.Entry :=
  { word := [10, 8, 0, 2, 10, 2, 0], weights := [1, 0, 0, 1] }

def points44 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 5), (4, 6), (5, 4), (6, 3)]

-- Period 7, original row 7817, representative 1516.
def source45 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨95, by decide +kernel⟩

def target45 : Weights.Entry :=
  { word := [10, 8, 0, 2, 10, 10, 0], weights := [1, 0, 0, 1] }

def points45 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 5), (4, 6), (5, 4), (6, 3)]

-- Period 7, original row 7833, representative 1493.
def source46 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨72, by decide +kernel⟩

def target46 : Weights.Entry :=
  { word := [10, 8, 0, 4, 6, 0, 0], weights := [1, 0, 1, 0] }

def points46 : List (ℕ × ℕ) := [(0, 1), (1, 2), (2, 0), (3, 5), (4, 6), (5, 4), (6, 3)]

-- Period 7, original row 7835, representative 1489.
def source47 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨68, by decide +kernel⟩

def target47 : Weights.Entry :=
  { word := [10, 8, 0, 4, 6, 8, 0], weights := [1, 0, 1, 0] }

def points47 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 5), (4, 6), (5, 4), (6, 3)]

-- Period 7, original row 7886, representative 1490.
def source48 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨69, by decide +kernel⟩

def target48 : Weights.Entry :=
  { word := [10, 8, 0, 12, 6, 8, 0], weights := [1, 0, 1, 0] }

def points48 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 5), (4, 6), (5, 4), (6, 3)]

-- Period 7, original row 7916, representative 1533.
def source49 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨112, by decide +kernel⟩

def target49 : Weights.Entry :=
  { word := [10, 8, 4, 2, 0, 1, 0], weights := [1, 0, 0, 1] }

def points49 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 7918, representative 1529.
def source50 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨108, by decide +kernel⟩

def target50 : Weights.Entry :=
  { word := [10, 8, 4, 2, 0, 2, 0], weights := [1, 0, 0, 1] }

def points50 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 7920, representative 1535.
def source51 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨114, by decide +kernel⟩

def target51 : Weights.Entry :=
  { word := [10, 8, 4, 2, 0, 8, 0], weights := [1, 0, 0, 1] }

def points51 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 7928, representative 1534.
def source52 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨113, by decide +kernel⟩

def target52 : Weights.Entry :=
  { word := [10, 8, 4, 2, 0, 9, 0], weights := [1, 0, 0, 1] }

def points52 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 7930, representative 1530.
def source53 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨109, by decide +kernel⟩

def target53 : Weights.Entry :=
  { word := [10, 8, 4, 2, 0, 10, 0], weights := [1, 0, 0, 1] }

def points53 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 7932, representative 1532.
def source54 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨111, by decide +kernel⟩

def target54 : Weights.Entry :=
  { word := [10, 8, 4, 2, 8, 2, 0], weights := [1, 0, 0, 1] }

def points54 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 7936, representative 1531.
def source55 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨110, by decide +kernel⟩

def target55 : Weights.Entry :=
  { word := [10, 8, 4, 2, 8, 10, 0], weights := [1, 0, 0, 1] }

def points55 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 7938, representative 1504.
def source56 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨83, by decide +kernel⟩

def target56 : Weights.Entry :=
  { word := [10, 8, 4, 4, 4, 0, 0], weights := [1, 0, 0, 1] }

def points56 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 7940, representative 1500.
def source57 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨79, by decide +kernel⟩

def target57 : Weights.Entry :=
  { word := [10, 8, 4, 4, 4, 8, 0], weights := [1, 0, 0, 1] }

def points57 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 7942, representative 1505.
def source58 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨84, by decide +kernel⟩

def target58 : Weights.Entry :=
  { word := [10, 8, 4, 4, 12, 0, 0], weights := [1, 0, 0, 1] }

def points58 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 7944, representative 1501.
def source59 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨80, by decide +kernel⟩

def target59 : Weights.Entry :=
  { word := [10, 8, 4, 4, 12, 8, 0], weights := [1, 0, 0, 1] }

def points59 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 7964, representative 1503.
def source60 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨82, by decide +kernel⟩

def target60 : Weights.Entry :=
  { word := [10, 8, 4, 12, 4, 8, 0], weights := [1, 0, 0, 1] }

def points60 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 7967, representative 1502.
def source61 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨81, by decide +kernel⟩

def target61 : Weights.Entry :=
  { word := [10, 8, 4, 12, 12, 8, 0], weights := [1, 0, 0, 1] }

def points61 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 7971, representative 1510.
def source62 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨89, by decide +kernel⟩

def target62 : Weights.Entry :=
  { word := [10, 8, 8, 1, 4, 2, 0], weights := [1, 0, 1, 0] }

def points62 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 7972, representative 1511.
def source63 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨90, by decide +kernel⟩

def target63 : Weights.Entry :=
  { word := [10, 8, 8, 1, 4, 10, 0], weights := [1, 0, 1, 0] }

def points63 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 7973, representative 1513.
def source64 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨92, by decide +kernel⟩

def target64 : Weights.Entry :=
  { word := [10, 8, 8, 1, 12, 2, 0], weights := [1, 0, 1, 0] }

def points64 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 7974, representative 1512.
def source65 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨91, by decide +kernel⟩

def target65 : Weights.Entry :=
  { word := [10, 8, 8, 1, 12, 10, 0], weights := [1, 0, 1, 0] }

def points65 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 7975, representative 1485.
def source66 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨64, by decide +kernel⟩

def target66 : Weights.Entry :=
  { word := [10, 8, 8, 2, 2, 2, 0], weights := [1, 0, 0, 1] }

def points66 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 7977, representative 1486.
def source67 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨65, by decide +kernel⟩

def target67 : Weights.Entry :=
  { word := [10, 8, 8, 2, 2, 10, 0], weights := [1, 0, 0, 1] }

def points67 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 7979, representative 1488.
def source68 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨67, by decide +kernel⟩

def target68 : Weights.Entry :=
  { word := [10, 8, 8, 2, 10, 2, 0], weights := [1, 0, 0, 1] }

def points68 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 7981, representative 1487.
def source69 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨66, by decide +kernel⟩

def target69 : Weights.Entry :=
  { word := [10, 8, 8, 2, 10, 10, 0], weights := [1, 0, 0, 1] }

def points69 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 7999, representative 1484.
def source70 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨63, by decide +kernel⟩

def target70 : Weights.Entry :=
  { word := [10, 8, 8, 4, 6, 0, 0], weights := [1, 0, 0, 1] }

def points70 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8001, representative 1482.
def source71 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨61, by decide +kernel⟩

def target71 : Weights.Entry :=
  { word := [10, 8, 8, 4, 6, 8, 0], weights := [1, 0, 0, 1] }

def points71 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8074, representative 1483.
def source72 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨62, by decide +kernel⟩

def target72 : Weights.Entry :=
  { word := [10, 8, 8, 12, 6, 8, 0], weights := [0, 0, 1, 0] }

def points72 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8124, representative 1526.
def source73 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨105, by decide +kernel⟩

def target73 : Weights.Entry :=
  { word := [10, 8, 12, 2, 0, 1, 0], weights := [1, 0, 0, 1] }

def points73 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8126, representative 1522.
def source74 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨101, by decide +kernel⟩

def target74 : Weights.Entry :=
  { word := [10, 8, 12, 2, 0, 2, 0], weights := [1, 0, 0, 1] }

def points74 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8128, representative 1528.
def source75 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨107, by decide +kernel⟩

def target75 : Weights.Entry :=
  { word := [10, 8, 12, 2, 0, 8, 0], weights := [1, 0, 0, 1] }

def points75 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8136, representative 1527.
def source76 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨106, by decide +kernel⟩

def target76 : Weights.Entry :=
  { word := [10, 8, 12, 2, 0, 9, 0], weights := [1, 0, 0, 1] }

def points76 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8138, representative 1523.
def source77 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨102, by decide +kernel⟩

def target77 : Weights.Entry :=
  { word := [10, 8, 12, 2, 0, 10, 0], weights := [1, 0, 0, 1] }

def points77 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8140, representative 1525.
def source78 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨104, by decide +kernel⟩

def target78 : Weights.Entry :=
  { word := [10, 8, 12, 2, 8, 2, 0], weights := [1, 0, 0, 1] }

def points78 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8144, representative 1524.
def source79 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨103, by decide +kernel⟩

def target79 : Weights.Entry :=
  { word := [10, 8, 12, 2, 8, 10, 0], weights := [1, 0, 0, 1] }

def points79 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8146, representative 1498.
def source80 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨77, by decide +kernel⟩

def target80 : Weights.Entry :=
  { word := [10, 8, 12, 4, 4, 0, 0], weights := [1, 0, 0, 1] }

def points80 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8148, representative 1494.
def source81 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨73, by decide +kernel⟩

def target81 : Weights.Entry :=
  { word := [10, 8, 12, 4, 4, 8, 0], weights := [1, 0, 0, 1] }

def points81 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8150, representative 1499.
def source82 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨78, by decide +kernel⟩

def target82 : Weights.Entry :=
  { word := [10, 8, 12, 4, 12, 0, 0], weights := [1, 0, 0, 1] }

def points82 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8152, representative 1495.
def source83 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨74, by decide +kernel⟩

def target83 : Weights.Entry :=
  { word := [10, 8, 12, 4, 12, 8, 0], weights := [1, 0, 0, 1] }

def points83 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8174, representative 1497.
def source84 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨76, by decide +kernel⟩

def target84 : Weights.Entry :=
  { word := [10, 8, 12, 12, 4, 8, 0], weights := [1, 0, 0, 1] }

def points84 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8177, representative 1496.
def source85 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨75, by decide +kernel⟩

def target85 : Weights.Entry :=
  { word := [10, 8, 12, 12, 12, 8, 0], weights := [1, 0, 0, 1] }

def points85 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8439, representative 1548.
def source86 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨127, by decide +kernel⟩

def target86 : Weights.Entry :=
  { word := [12, 0, 4, 2, 0, 9, 0], weights := [0, 1, 0, 0] }

def points86 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8528, representative 1545.
def source87 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨124, by decide +kernel⟩

def target87 : Weights.Entry :=
  { word := [12, 0, 12, 2, 0, 9, 0], weights := [0, 1, 0, 0] }

def points87 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8723, representative 1518.
def source88 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨97, by decide +kernel⟩

def target88 : Weights.Entry :=
  { word := [12, 8, 0, 1, 4, 2, 0], weights := [1, 0, 1, 0] }

def points88 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8724, representative 1519.
def source89 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨98, by decide +kernel⟩

def target89 : Weights.Entry :=
  { word := [12, 8, 0, 1, 4, 10, 0], weights := [1, 0, 1, 0] }

def points89 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8725, representative 1521.
def source90 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨100, by decide +kernel⟩

def target90 : Weights.Entry :=
  { word := [12, 8, 0, 1, 12, 2, 0], weights := [1, 0, 1, 0] }

def points90 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8726, representative 1520.
def source91 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨99, by decide +kernel⟩

def target91 : Weights.Entry :=
  { word := [12, 8, 0, 1, 12, 10, 0], weights := [1, 0, 1, 0] }

def points91 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8727, representative 1518.
def source92 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨97, by decide +kernel⟩

def target92 : Weights.Entry :=
  { word := [12, 8, 0, 2, 2, 2, 0], weights := [1, 0, 0, 1] }

def points92 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 5), (4, 6), (5, 4), (6, 3)]

-- Period 7, original row 8729, representative 1519.
def source93 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨98, by decide +kernel⟩

def target93 : Weights.Entry :=
  { word := [12, 8, 0, 2, 2, 10, 0], weights := [1, 0, 0, 1] }

def points93 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 5), (4, 6), (5, 4), (6, 3)]

-- Period 7, original row 8731, representative 1521.
def source94 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨100, by decide +kernel⟩

def target94 : Weights.Entry :=
  { word := [12, 8, 0, 2, 10, 2, 0], weights := [1, 0, 0, 1] }

def points94 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 5), (4, 6), (5, 4), (6, 3)]

-- Period 7, original row 8733, representative 1520.
def source95 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨99, by decide +kernel⟩

def target95 : Weights.Entry :=
  { word := [12, 8, 0, 2, 10, 10, 0], weights := [1, 0, 0, 1] }

def points95 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 5), (4, 6), (5, 4), (6, 3)]

-- Period 7, original row 8749, representative 1493.
def source96 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨72, by decide +kernel⟩

def target96 : Weights.Entry :=
  { word := [12, 8, 0, 4, 6, 0, 0], weights := [1, 0, 1, 0] }

def points96 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 5), (4, 6), (5, 4), (6, 3)]

-- Period 7, original row 8751, representative 1491.
def source97 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨70, by decide +kernel⟩

def target97 : Weights.Entry :=
  { word := [12, 8, 0, 4, 6, 8, 0], weights := [1, 0, 1, 0] }

def points97 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 5), (4, 6), (5, 4), (6, 3)]

-- Period 7, original row 8794, representative 1492.
def source98 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨71, by decide +kernel⟩

def target98 : Weights.Entry :=
  { word := [12, 8, 0, 12, 6, 8, 0], weights := [1, 0, 1, 0] }

def points98 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 5), (4, 6), (5, 4), (6, 3)]

-- Period 7, original row 8818, representative 1466.
def source99 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨45, by decide +kernel⟩

def target99 : Weights.Entry :=
  { word := [12, 8, 4, 2, 0, 1, 0], weights := [0, 1, 0, 0] }

def points99 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8820, representative 1468.
def source100 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨47, by decide +kernel⟩

def target100 : Weights.Entry :=
  { word := [12, 8, 4, 2, 0, 2, 0], weights := [0, 1, 0, 0] }

def points100 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8822, representative 1472.
def source101 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨51, by decide +kernel⟩

def target101 : Weights.Entry :=
  { word := [12, 8, 4, 2, 0, 8, 0], weights := [0, 1, 0, 0] }

def points101 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8830, representative 1467.
def source102 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨46, by decide +kernel⟩

def target102 : Weights.Entry :=
  { word := [12, 8, 4, 2, 0, 9, 0], weights := [0, 1, 0, 0] }

def points102 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8832, representative 1469.
def source103 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨48, by decide +kernel⟩

def target103 : Weights.Entry :=
  { word := [12, 8, 4, 2, 0, 10, 0], weights := [0, 1, 0, 0] }

def points103 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8834, representative 1471.
def source104 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨50, by decide +kernel⟩

def target104 : Weights.Entry :=
  { word := [12, 8, 4, 2, 8, 2, 0], weights := [0, 1, 0, 0] }

def points104 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8838, representative 1470.
def source105 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨49, by decide +kernel⟩

def target105 : Weights.Entry :=
  { word := [12, 8, 4, 2, 8, 10, 0], weights := [0, 1, 0, 0] }

def points105 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8840, representative 1464.
def source106 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨43, by decide +kernel⟩

def target106 : Weights.Entry :=
  { word := [12, 8, 4, 4, 4, 0, 0], weights := [0, 0, 1, 0] }

def points106 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8842, representative 1460.
def source107 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨39, by decide +kernel⟩

def target107 : Weights.Entry :=
  { word := [12, 8, 4, 4, 4, 8, 0], weights := [0, 0, 1, 0] }

def points107 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8844, representative 1465.
def source108 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨44, by decide +kernel⟩

def target108 : Weights.Entry :=
  { word := [12, 8, 4, 4, 12, 0, 0], weights := [0, 0, 1, 0] }

def points108 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8846, representative 1461.
def source109 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨40, by decide +kernel⟩

def target109 : Weights.Entry :=
  { word := [12, 8, 4, 4, 12, 8, 0], weights := [0, 0, 1, 0] }

def points109 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8848, representative 1459.
def source110 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨38, by decide +kernel⟩

def target110 : Weights.Entry :=
  { word := [12, 8, 4, 8, 4, 2, 0], weights := [0, 1, 1, 0] }

def points110 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8850, representative 1457.
def source111 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨36, by decide +kernel⟩

def target111 : Weights.Entry :=
  { word := [12, 8, 4, 8, 4, 10, 0], weights := [0, 1, 1, 0] }

def points111 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8852, representative 1458.
def source112 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨37, by decide +kernel⟩

def target112 : Weights.Entry :=
  { word := [12, 8, 4, 8, 12, 2, 0], weights := [0, 1, 1, 0] }

def points112 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8854, representative 1456.
def source113 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨35, by decide +kernel⟩

def target113 : Weights.Entry :=
  { word := [12, 8, 4, 8, 12, 10, 0], weights := [0, 1, 1, 0] }

def points113 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8876, representative 1463.
def source114 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨42, by decide +kernel⟩

def target114 : Weights.Entry :=
  { word := [12, 8, 4, 12, 4, 8, 0], weights := [0, 0, 1, 0] }

def points114 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8879, representative 1462.
def source115 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨41, by decide +kernel⟩

def target115 : Weights.Entry :=
  { word := [12, 8, 4, 12, 12, 8, 0], weights := [0, 0, 1, 0] }

def points115 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8881, representative 1506.
def source116 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨85, by decide +kernel⟩

def target116 : Weights.Entry :=
  { word := [12, 8, 8, 1, 4, 2, 0], weights := [1, 0, 1, 0] }

def points116 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8882, representative 1507.
def source117 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨86, by decide +kernel⟩

def target117 : Weights.Entry :=
  { word := [12, 8, 8, 1, 4, 10, 0], weights := [1, 0, 1, 0] }

def points117 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8883, representative 1509.
def source118 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨88, by decide +kernel⟩

def target118 : Weights.Entry :=
  { word := [12, 8, 8, 1, 12, 2, 0], weights := [1, 0, 1, 0] }

def points118 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8884, representative 1508.
def source119 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨87, by decide +kernel⟩

def target119 : Weights.Entry :=
  { word := [12, 8, 8, 1, 12, 10, 0], weights := [1, 0, 1, 0] }

def points119 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8885, representative 1478.
def source120 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨57, by decide +kernel⟩

def target120 : Weights.Entry :=
  { word := [12, 8, 8, 2, 2, 2, 0], weights := [0, 1, 0, 1] }

def points120 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8887, representative 1479.
def source121 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨58, by decide +kernel⟩

def target121 : Weights.Entry :=
  { word := [12, 8, 8, 2, 2, 10, 0], weights := [0, 1, 0, 1] }

def points121 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8889, representative 1481.
def source122 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨60, by decide +kernel⟩

def target122 : Weights.Entry :=
  { word := [12, 8, 8, 2, 10, 2, 0], weights := [0, 1, 0, 1] }

def points122 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8891, representative 1480.
def source123 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨59, by decide +kernel⟩

def target123 : Weights.Entry :=
  { word := [12, 8, 8, 2, 10, 10, 0], weights := [0, 1, 0, 1] }

def points123 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8897, representative 1477.
def source124 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨56, by decide +kernel⟩

def target124 : Weights.Entry :=
  { word := [12, 8, 8, 4, 6, 0, 0], weights := [0, 0, 1, 0] }

def points124 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8899, representative 1475.
def source125 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨54, by decide +kernel⟩

def target125 : Weights.Entry :=
  { word := [12, 8, 8, 4, 6, 8, 0], weights := [0, 0, 1, 0] }

def points125 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8906, representative 1474.
def source126 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨53, by decide +kernel⟩

def target126 : Weights.Entry :=
  { word := [12, 8, 8, 8, 6, 2, 0], weights := [0, 1, 1, 0] }

def points126 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8908, representative 1473.
def source127 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B011.Data.entryAt ⟨52, by decide +kernel⟩

def target127 : Weights.Entry :=
  { word := [12, 8, 8, 8, 6, 10, 0], weights := [0, 1, 1, 0] }

def points127 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

def period7Entries : List Weights.Entry := [target0, target1, target2, target3, target4, target5, target6, target7, target8, target9, target10, target11, target12, target13, target14, target15, target16, target17, target18, target19, target20, target21, target22, target23, target24, target25, target26, target27, target28, target29, target30, target31, target32, target33, target34, target35, target36, target37, target38, target39, target40, target41, target42, target43, target44, target45, target46, target47, target48, target49, target50, target51, target52, target53, target54, target55, target56, target57, target58, target59, target60, target61, target62, target63, target64, target65, target66, target67, target68, target69, target70, target71, target72, target73, target74, target75, target76, target77, target78, target79, target80, target81, target82, target83, target84, target85, target86, target87, target88, target89, target90, target91, target92, target93, target94, target95, target96, target97, target98, target99, target100, target101, target102, target103, target104, target105, target106, target107, target108, target109, target110, target111, target112, target113, target114, target115, target116, target117, target118, target119, target120, target121, target122, target123, target124, target125, target126, target127]

def period7Chunk : RowCoverage.Chunk where
  rows := [⟨4529, target0⟩, ⟨4543, target1⟩, ⟨4618, target2⟩, ⟨4624, target3⟩, ⟨4632, target4⟩, ⟨5848, target5⟩, ⟨5852, target6⟩, ⟨5854, target7⟩, ⟨5858, target8⟩, ⟨5860, target9⟩, ⟨5862, target10⟩, ⟨5864, target11⟩, ⟨5866, target12⟩, ⟨5886, target13⟩, ⟨5888, target14⟩, ⟨5947, target15⟩, ⟨5985, target16⟩, ⟨5989, target17⟩, ⟨5991, target18⟩, ⟨5995, target19⟩, ⟨5997, target20⟩, ⟨5999, target21⟩, ⟨6001, target22⟩, ⟨6003, target23⟩, ⟨6009, target24⟩, ⟨6011, target25⟩, ⟨6040, target26⟩, ⟨7398, target27⟩, ⟨7401, target28⟩, ⟨7433, target29⟩, ⟨7435, target30⟩, ⟨7441, target31⟩, ⟨7475, target32⟩, ⟨7478, target33⟩, ⟨7482, target34⟩, ⟨7550, target35⟩, ⟨7552, target36⟩, ⟨7558, target37⟩, ⟨7807, target38⟩, ⟨7808, target39⟩, ⟨7809, target40⟩, ⟨7810, target41⟩, ⟨7811, target42⟩, ⟨7813, target43⟩, ⟨7815, target44⟩, ⟨7817, target45⟩, ⟨7833, target46⟩, ⟨7835, target47⟩, ⟨7886, target48⟩, ⟨7916, target49⟩, ⟨7918, target50⟩, ⟨7920, target51⟩, ⟨7928, target52⟩, ⟨7930, target53⟩, ⟨7932, target54⟩, ⟨7936, target55⟩, ⟨7938, target56⟩, ⟨7940, target57⟩, ⟨7942, target58⟩, ⟨7944, target59⟩, ⟨7964, target60⟩, ⟨7967, target61⟩, ⟨7971, target62⟩, ⟨7972, target63⟩, ⟨7973, target64⟩, ⟨7974, target65⟩, ⟨7975, target66⟩, ⟨7977, target67⟩, ⟨7979, target68⟩, ⟨7981, target69⟩, ⟨7999, target70⟩, ⟨8001, target71⟩, ⟨8074, target72⟩, ⟨8124, target73⟩, ⟨8126, target74⟩, ⟨8128, target75⟩, ⟨8136, target76⟩, ⟨8138, target77⟩, ⟨8140, target78⟩, ⟨8144, target79⟩, ⟨8146, target80⟩, ⟨8148, target81⟩, ⟨8150, target82⟩, ⟨8152, target83⟩, ⟨8174, target84⟩, ⟨8177, target85⟩, ⟨8439, target86⟩, ⟨8528, target87⟩, ⟨8723, target88⟩, ⟨8724, target89⟩, ⟨8725, target90⟩, ⟨8726, target91⟩, ⟨8727, target92⟩, ⟨8729, target93⟩, ⟨8731, target94⟩, ⟨8733, target95⟩, ⟨8749, target96⟩, ⟨8751, target97⟩, ⟨8794, target98⟩, ⟨8818, target99⟩, ⟨8820, target100⟩, ⟨8822, target101⟩, ⟨8830, target102⟩, ⟨8832, target103⟩, ⟨8834, target104⟩, ⟨8838, target105⟩, ⟨8840, target106⟩, ⟨8842, target107⟩, ⟨8844, target108⟩, ⟨8846, target109⟩, ⟨8848, target110⟩, ⟨8850, target111⟩, ⟨8852, target112⟩, ⟨8854, target113⟩, ⟨8876, target114⟩, ⟨8879, target115⟩, ⟨8881, target116⟩, ⟨8882, target117⟩, ⟨8883, target118⟩, ⟨8884, target119⟩, ⟨8885, target120⟩, ⟨8887, target121⟩, ⟨8889, target122⟩, ⟨8891, target123⟩, ⟨8897, target124⟩, ⟨8899, target125⟩, ⟨8906, target126⟩, ⟨8908, target127⟩]
  indexMask := 470936492605242188907592327863766303319899254593877058793316757915210074995898957599991461928091182554612727593512177987663740598345930994054736041611680716201009339272413041255866768105705794816924780780728209137596424562076952114266986061518514131559516475738923596979641998415735112715338962802210473445579469240498897876320087094049807059966967449383207686893861777005853179902805653293131097358390428280588573828133958856996605875184993275037826926422822259689639190370018736402186472020473696588289324455333433173261989675417193687981500175974597479506911906716346018374069472723098266842153980614093753481335515540719325072497749211396639613779309586361387187503661916499047566914908870119525180993833214367318559076227043915983928540000170543658480965897372278803736065368878623092906585603991290170596636004146939843708567705803233893078827902286544381912488393646195348166928569718909604219981803540330216053317596709230992812434945739166006614238747082962835424223197563429150767523432173503729794326928867835557462598517653320235637738390630069453516199606468400204537207889678143379925099254638789211900167534841183474096258214292282580616167241759703237723145509173606467688649320170290642362454236256493337556434718964363049757557734585790191332291996866899542090403958491738658716795404361417323837825632470861853072196154581898142004442049544550910597462845511360485745059888446840556196326227869421381027527336345335590596376853815564321958646756251775521193266871739912754155707928881873988614312801101407599387493614669245482709873677711072571946231126171649881220290176875427463132127024863424009638074362778143594977628714514897378135907301293914834938211986160066391835311511385540118099865047754020679617105913162382024087166423325552545172111030341519748549771011440914102770332689539083893122055786353989957050581991367005624914476221515240196474967420633976722022988261155297806671850955662035009015921146376670321503300177897550925463523492175667196345477402226991258177700175123448990071937344674292840480457711469974783157353604595834560551170136370322974081046234927927951471913707425905585036851746341509768997113460890346402845023343330756489527748412599482492028155624177384106601192954862075858992056492351150818736934341949127605220542882348973853549278726896949796745435707924551181551064757814028193359703617155067316580221957230785677315300603347819041272454069769066124629934725447588781615420264057130384011501553644882403764208983828800641657866208916182298862702941248370402603978543646736798652655556447086545818831021751108127236004960686586488374310320267074501389217716670837048832968611382179271656030478705127499228253187431733395456
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

end FranklSmallCyclic.TransportBatches.G011.B002.Data
