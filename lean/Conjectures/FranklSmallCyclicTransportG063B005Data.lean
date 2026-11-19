module

public import Conjectures.FranklSmallCyclicRowCoverage
public import Conjectures.FranklSmallCyclicCanonicalWords
public import Conjectures.FranklSmallCyclicOrbit9Block010Data

/-! 128 literal targets sharing one source proof block.
Original words and row indices are retained; weights may be transported.
-/
@[expose] public section

namespace FranklSmallCyclic.TransportBatches.G063.B005.Data

-- Period 10, original row 1868, representative 8054.
def source0 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨23, by decide +kernel⟩

def target0 : Weights.Entry :=
  { word := [1, 4, 2, 0, 9, 8, 12], weights := [0, 1, 0, 1] }

def points0 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 10, original row 1872, representative 8073.
def source1 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨42, by decide +kernel⟩

def target1 : Weights.Entry :=
  { word := [1, 4, 2, 8, 2, 0, 9], weights := [0, 1, 1, 0] }

def points1 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 10, original row 1873, representative 8073.
def source2 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨42, by decide +kernel⟩

def target2 : Weights.Entry :=
  { word := [1, 4, 2, 8, 2, 0, 10], weights := [0, 1, 1, 0] }

def points2 : List (ℕ × ℕ) := [(0, 8), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 9)]

-- Period 10, original row 1886, representative 8065.
def source3 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨34, by decide +kernel⟩

def target3 : Weights.Entry :=
  { word := [1, 4, 2, 8, 10, 0, 9], weights := [0, 1, 1, 0] }

def points3 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 10, original row 1887, representative 8065.
def source4 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨34, by decide +kernel⟩

def target4 : Weights.Entry :=
  { word := [1, 4, 2, 8, 10, 0, 10], weights := [0, 1, 1, 0] }

def points4 : List (ℕ × ℕ) := [(0, 8), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 9)]

-- Period 10, original row 1895, representative 8101.
def source5 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨70, by decide +kernel⟩

def target5 : Weights.Entry :=
  { word := [1, 4, 4, 4, 0, 0, 9], weights := [1, 0, 0, 1] }

def points5 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 10, original row 1896, representative 8101.
def source6 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨70, by decide +kernel⟩

def target6 : Weights.Entry :=
  { word := [1, 4, 4, 4, 0, 0, 10], weights := [1, 0, 0, 1] }

def points6 : List (ℕ × ℕ) := [(0, 8), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6), (7, 7), (8, 9)]

-- Period 10, original row 1897, representative 8101.
def source7 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨70, by decide +kernel⟩

def target7 : Weights.Entry :=
  { word := [1, 4, 4, 4, 0, 0, 12], weights := [1, 0, 0, 1] }

def points7 : List (ℕ × ℕ) := [(0, 7), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6), (7, 8), (8, 9)]

-- Period 10, original row 1903, representative 8058.
def source8 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨27, by decide +kernel⟩

def target8 : Weights.Entry :=
  { word := [1, 4, 4, 4, 0, 8, 10], weights := [1, 0, 0, 1] }

def points8 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 10, original row 1904, representative 8058.
def source9 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨27, by decide +kernel⟩

def target9 : Weights.Entry :=
  { word := [1, 4, 4, 4, 0, 8, 12], weights := [1, 0, 0, 1] }

def points9 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6), (7, 8), (8, 7)]

-- Period 10, original row 1909, representative 8097.
def source10 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨66, by decide +kernel⟩

def target10 : Weights.Entry :=
  { word := [1, 4, 4, 4, 8, 0, 9], weights := [1, 0, 1, 0] }

def points10 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 10, original row 1910, representative 8097.
def source11 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨66, by decide +kernel⟩

def target11 : Weights.Entry :=
  { word := [1, 4, 4, 4, 8, 0, 10], weights := [1, 0, 1, 0] }

def points11 : List (ℕ × ℕ) := [(0, 8), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 9)]

-- Period 10, original row 1911, representative 8099.
def source12 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨68, by decide +kernel⟩

def target12 : Weights.Entry :=
  { word := [1, 4, 4, 4, 8, 0, 12], weights := [1, 0, 0, 1] }

def points12 : List (ℕ × ℕ) := [(0, 8), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 9)]

-- Period 10, original row 1917, representative 8038.
def source13 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨7, by decide +kernel⟩

def target13 : Weights.Entry :=
  { word := [1, 4, 4, 4, 8, 8, 10], weights := [1, 0, 1, 0] }

def points13 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 10, original row 1918, representative 8044.
def source14 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨13, by decide +kernel⟩

def target14 : Weights.Entry :=
  { word := [1, 4, 4, 4, 8, 8, 12], weights := [1, 0, 0, 1] }

def points14 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 10, original row 1923, representative 8076.
def source15 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨45, by decide +kernel⟩

def target15 : Weights.Entry :=
  { word := [1, 4, 8, 4, 2, 0, 9], weights := [0, 0, 1, 0] }

def points15 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 10, original row 1924, representative 8076.
def source16 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨45, by decide +kernel⟩

def target16 : Weights.Entry :=
  { word := [1, 4, 8, 4, 2, 0, 10], weights := [0, 0, 1, 0] }

def points16 : List (ℕ × ℕ) := [(0, 8), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 9)]

-- Period 10, original row 1925, representative 8088.
def source17 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨57, by decide +kernel⟩

def target17 : Weights.Entry :=
  { word := [1, 4, 8, 4, 2, 0, 12], weights := [1, 0, 0, 1] }

def points17 : List (ℕ × ℕ) := [(0, 8), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 9)]

-- Period 10, original row 1930, representative 8032.
def source18 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨1, by decide +kernel⟩

def target18 : Weights.Entry :=
  { word := [1, 4, 8, 4, 2, 8, 12], weights := [1, 0, 0, 1] }

def points18 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 10, original row 1949, representative 8068.
def source19 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨37, by decide +kernel⟩

def target19 : Weights.Entry :=
  { word := [1, 4, 8, 4, 10, 0, 9], weights := [0, 0, 1, 0] }

def points19 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 10, original row 1950, representative 8068.
def source20 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨37, by decide +kernel⟩

def target20 : Weights.Entry :=
  { word := [1, 4, 8, 4, 10, 0, 10], weights := [0, 0, 1, 0] }

def points20 : List (ℕ × ℕ) := [(0, 8), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 9)]

-- Period 10, original row 1951, representative 8082.
def source21 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨51, by decide +kernel⟩

def target21 : Weights.Entry :=
  { word := [1, 4, 8, 4, 10, 0, 12], weights := [1, 0, 0, 1] }

def points21 : List (ℕ × ℕ) := [(0, 8), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 9)]

-- Period 10, original row 1980, representative 8061.
def source22 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨30, by decide +kernel⟩

def target22 : Weights.Entry :=
  { word := [1, 4, 10, 0, 1, 8, 10], weights := [0, 1, 0, 1] }

def points22 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 10, original row 1981, representative 8061.
def source23 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨30, by decide +kernel⟩

def target23 : Weights.Entry :=
  { word := [1, 4, 10, 0, 1, 8, 12], weights := [0, 1, 0, 1] }

def points23 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 8), (8, 7)]

-- Period 10, original row 1987, representative 8053.
def source24 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨22, by decide +kernel⟩

def target24 : Weights.Entry :=
  { word := [1, 4, 10, 0, 9, 8, 10], weights := [0, 1, 0, 1] }

def points24 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 10, original row 1988, representative 8057.
def source25 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨26, by decide +kernel⟩

def target25 : Weights.Entry :=
  { word := [1, 4, 10, 0, 9, 8, 12], weights := [0, 1, 0, 1] }

def points25 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 10, original row 2006, representative 8061.
def source26 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨30, by decide +kernel⟩

def target26 : Weights.Entry :=
  { word := [1, 4, 12, 4, 0, 8, 10], weights := [1, 0, 0, 1] }

def points26 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 10, original row 2007, representative 8061.
def source27 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨30, by decide +kernel⟩

def target27 : Weights.Entry :=
  { word := [1, 4, 12, 4, 0, 8, 12], weights := [1, 0, 0, 1] }

def points27 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6), (7, 8), (8, 7)]

-- Period 10, original row 2012, representative 8098.
def source28 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨67, by decide +kernel⟩

def target28 : Weights.Entry :=
  { word := [1, 4, 12, 4, 8, 0, 9], weights := [1, 0, 1, 0] }

def points28 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 10, original row 2013, representative 8098.
def source29 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨67, by decide +kernel⟩

def target29 : Weights.Entry :=
  { word := [1, 4, 12, 4, 8, 0, 10], weights := [1, 0, 1, 0] }

def points29 : List (ℕ × ℕ) := [(0, 8), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 9)]

-- Period 10, original row 2014, representative 8100.
def source30 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨69, by decide +kernel⟩

def target30 : Weights.Entry :=
  { word := [1, 4, 12, 4, 8, 0, 12], weights := [1, 0, 0, 1] }

def points30 : List (ℕ × ℕ) := [(0, 8), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 9)]

-- Period 10, original row 2020, representative 8041.
def source31 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨10, by decide +kernel⟩

def target31 : Weights.Entry :=
  { word := [1, 4, 12, 4, 8, 8, 10], weights := [1, 0, 1, 0] }

def points31 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 10, original row 2021, representative 8047.
def source32 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨16, by decide +kernel⟩

def target32 : Weights.Entry :=
  { word := [1, 4, 12, 4, 8, 8, 12], weights := [1, 0, 0, 1] }

def points32 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 10, original row 2026, representative 8071.
def source33 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨40, by decide +kernel⟩

def target33 : Weights.Entry :=
  { word := [1, 8, 1, 4, 2, 0, 9], weights := [0, 0, 1, 0] }

def points33 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 10, original row 2027, representative 8071.
def source34 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨40, by decide +kernel⟩

def target34 : Weights.Entry :=
  { word := [1, 8, 1, 4, 2, 0, 10], weights := [0, 0, 1, 0] }

def points34 : List (ℕ × ℕ) := [(0, 8), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 9)]

-- Period 10, original row 2028, representative 8084.
def source35 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨53, by decide +kernel⟩

def target35 : Weights.Entry :=
  { word := [1, 8, 1, 4, 2, 0, 12], weights := [1, 0, 0, 1] }

def points35 : List (ℕ × ℕ) := [(0, 8), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 9)]

-- Period 10, original row 2048, representative 8063.
def source36 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨32, by decide +kernel⟩

def target36 : Weights.Entry :=
  { word := [1, 8, 1, 4, 10, 0, 9], weights := [0, 0, 1, 0] }

def points36 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 10, original row 2049, representative 8063.
def source37 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨32, by decide +kernel⟩

def target37 : Weights.Entry :=
  { word := [1, 8, 1, 4, 10, 0, 10], weights := [0, 0, 1, 0] }

def points37 : List (ℕ × ℕ) := [(0, 8), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 9)]

-- Period 10, original row 2050, representative 8078.
def source38 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨47, by decide +kernel⟩

def target38 : Weights.Entry :=
  { word := [1, 8, 1, 4, 10, 0, 12], weights := [1, 0, 0, 1] }

def points38 : List (ℕ × ℕ) := [(0, 8), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 9)]

-- Period 10, original row 2072, representative 8074.
def source39 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨43, by decide +kernel⟩

def target39 : Weights.Entry :=
  { word := [1, 8, 2, 2, 2, 0, 9], weights := [0, 1, 0, 0] }

def points39 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 10, original row 2073, representative 8074.
def source40 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨43, by decide +kernel⟩

def target40 : Weights.Entry :=
  { word := [1, 8, 2, 2, 2, 0, 10], weights := [0, 1, 0, 0] }

def points40 : List (ℕ × ℕ) := [(0, 8), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 9)]

-- Period 10, original row 2074, representative 8086.
def source41 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨55, by decide +kernel⟩

def target41 : Weights.Entry :=
  { word := [1, 8, 2, 2, 2, 0, 12], weights := [1, 0, 0, 1] }

def points41 : List (ℕ × ℕ) := [(0, 8), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 9)]

-- Period 10, original row 2087, representative 8066.
def source42 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨35, by decide +kernel⟩

def target42 : Weights.Entry :=
  { word := [1, 8, 2, 2, 10, 0, 9], weights := [0, 1, 0, 0] }

def points42 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 10, original row 2088, representative 8066.
def source43 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨35, by decide +kernel⟩

def target43 : Weights.Entry :=
  { word := [1, 8, 2, 2, 10, 0, 10], weights := [0, 1, 0, 0] }

def points43 : List (ℕ × ℕ) := [(0, 8), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 9)]

-- Period 10, original row 2089, representative 8080.
def source44 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨49, by decide +kernel⟩

def target44 : Weights.Entry :=
  { word := [1, 8, 2, 2, 10, 0, 12], weights := [1, 0, 0, 1] }

def points44 : List (ℕ × ℕ) := [(0, 8), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 9)]

-- Period 10, original row 2102, representative 8075.
def source45 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨44, by decide +kernel⟩

def target45 : Weights.Entry :=
  { word := [1, 8, 2, 10, 2, 0, 9], weights := [0, 1, 0, 0] }

def points45 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 10, original row 2103, representative 8075.
def source46 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨44, by decide +kernel⟩

def target46 : Weights.Entry :=
  { word := [1, 8, 2, 10, 2, 0, 10], weights := [0, 1, 0, 0] }

def points46 : List (ℕ × ℕ) := [(0, 8), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 9)]

-- Period 10, original row 2104, representative 8087.
def source47 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨56, by decide +kernel⟩

def target47 : Weights.Entry :=
  { word := [1, 8, 2, 10, 2, 0, 12], weights := [1, 1, 0, 0] }

def points47 : List (ℕ × ℕ) := [(0, 8), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 9)]

-- Period 10, original row 2116, representative 8067.
def source48 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨36, by decide +kernel⟩

def target48 : Weights.Entry :=
  { word := [1, 8, 2, 10, 10, 0, 9], weights := [0, 1, 0, 0] }

def points48 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 10, original row 2117, representative 8067.
def source49 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨36, by decide +kernel⟩

def target49 : Weights.Entry :=
  { word := [1, 8, 2, 10, 10, 0, 10], weights := [0, 1, 0, 0] }

def points49 : List (ℕ × ℕ) := [(0, 8), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 9)]

-- Period 10, original row 2118, representative 8081.
def source50 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨50, by decide +kernel⟩

def target50 : Weights.Entry :=
  { word := [1, 8, 2, 10, 10, 0, 12], weights := [1, 1, 0, 0] }

def points50 : List (ℕ × ℕ) := [(0, 8), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 9)]

-- Period 10, original row 2204, representative 8094.
def source51 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨63, by decide +kernel⟩

def target51 : Weights.Entry :=
  { word := [1, 12, 2, 0, 1, 0, 9], weights := [0, 1, 0, 1] }

def points51 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 10, original row 2205, representative 8094.
def source52 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨63, by decide +kernel⟩

def target52 : Weights.Entry :=
  { word := [1, 12, 2, 0, 1, 0, 10], weights := [0, 1, 0, 1] }

def points52 : List (ℕ × ℕ) := [(0, 8), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 9)]

-- Period 10, original row 2206, representative 8094.
def source53 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨63, by decide +kernel⟩

def target53 : Weights.Entry :=
  { word := [1, 12, 2, 0, 1, 0, 12], weights := [0, 1, 0, 1] }

def points53 : List (ℕ × ℕ) := [(0, 7), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 8), (8, 9)]

-- Period 10, original row 2212, representative 8059.
def source54 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨28, by decide +kernel⟩

def target54 : Weights.Entry :=
  { word := [1, 12, 2, 0, 1, 8, 10], weights := [0, 1, 0, 1] }

def points54 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 10, original row 2213, representative 8059.
def source55 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨28, by decide +kernel⟩

def target55 : Weights.Entry :=
  { word := [1, 12, 2, 0, 1, 8, 12], weights := [0, 1, 0, 1] }

def points55 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 8), (8, 7)]

-- Period 10, original row 2218, representative 8095.
def source56 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨64, by decide +kernel⟩

def target56 : Weights.Entry :=
  { word := [1, 12, 2, 0, 9, 0, 9], weights := [0, 1, 0, 1] }

def points56 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 10, original row 2219, representative 8095.
def source57 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨64, by decide +kernel⟩

def target57 : Weights.Entry :=
  { word := [1, 12, 2, 0, 9, 0, 10], weights := [0, 1, 0, 1] }

def points57 : List (ℕ × ℕ) := [(0, 8), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 9)]

-- Period 10, original row 2220, representative 8096.
def source58 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨65, by decide +kernel⟩

def target58 : Weights.Entry :=
  { word := [1, 12, 2, 0, 9, 0, 12], weights := [0, 1, 0, 1] }

def points58 : List (ℕ × ℕ) := [(0, 8), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 9)]

-- Period 10, original row 2226, representative 8051.
def source59 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨20, by decide +kernel⟩

def target59 : Weights.Entry :=
  { word := [1, 12, 2, 0, 9, 8, 10], weights := [0, 1, 0, 1] }

def points59 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 10, original row 2227, representative 8055.
def source60 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨24, by decide +kernel⟩

def target60 : Weights.Entry :=
  { word := [1, 12, 2, 0, 9, 8, 12], weights := [0, 1, 0, 1] }

def points60 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 10, original row 2231, representative 8070.
def source61 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨39, by decide +kernel⟩

def target61 : Weights.Entry :=
  { word := [1, 12, 2, 8, 2, 0, 9], weights := [0, 1, 1, 0] }

def points61 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 10, original row 2232, representative 8070.
def source62 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨39, by decide +kernel⟩

def target62 : Weights.Entry :=
  { word := [1, 12, 2, 8, 2, 0, 10], weights := [0, 1, 1, 0] }

def points62 : List (ℕ × ℕ) := [(0, 8), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 9)]

-- Period 10, original row 2245, representative 8062.
def source63 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨31, by decide +kernel⟩

def target63 : Weights.Entry :=
  { word := [1, 12, 2, 8, 10, 0, 9], weights := [0, 1, 1, 0] }

def points63 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 10, original row 2246, representative 8062.
def source64 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨31, by decide +kernel⟩

def target64 : Weights.Entry :=
  { word := [1, 12, 2, 8, 10, 0, 10], weights := [0, 1, 1, 0] }

def points64 : List (ℕ × ℕ) := [(0, 8), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 9)]

-- Period 10, original row 2254, representative 8094.
def source65 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨63, by decide +kernel⟩

def target65 : Weights.Entry :=
  { word := [1, 12, 4, 4, 0, 0, 9], weights := [1, 0, 0, 1] }

def points65 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 10, original row 2255, representative 8094.
def source66 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨63, by decide +kernel⟩

def target66 : Weights.Entry :=
  { word := [1, 12, 4, 4, 0, 0, 10], weights := [1, 0, 0, 1] }

def points66 : List (ℕ × ℕ) := [(0, 8), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6), (7, 7), (8, 9)]

-- Period 10, original row 2256, representative 8094.
def source67 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨63, by decide +kernel⟩

def target67 : Weights.Entry :=
  { word := [1, 12, 4, 4, 0, 0, 12], weights := [1, 0, 0, 1] }

def points67 : List (ℕ × ℕ) := [(0, 7), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6), (7, 8), (8, 9)]

-- Period 10, original row 2262, representative 8059.
def source68 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨28, by decide +kernel⟩

def target68 : Weights.Entry :=
  { word := [1, 12, 4, 4, 0, 8, 10], weights := [1, 0, 0, 1] }

def points68 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 10, original row 2263, representative 8059.
def source69 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨28, by decide +kernel⟩

def target69 : Weights.Entry :=
  { word := [1, 12, 4, 4, 0, 8, 12], weights := [1, 0, 0, 1] }

def points69 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6), (7, 8), (8, 7)]

-- Period 10, original row 2268, representative 8090.
def source70 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨59, by decide +kernel⟩

def target70 : Weights.Entry :=
  { word := [1, 12, 4, 4, 8, 0, 9], weights := [1, 0, 1, 0] }

def points70 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 10, original row 2269, representative 8090.
def source71 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨59, by decide +kernel⟩

def target71 : Weights.Entry :=
  { word := [1, 12, 4, 4, 8, 0, 10], weights := [1, 0, 1, 0] }

def points71 : List (ℕ × ℕ) := [(0, 8), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 9)]

-- Period 10, original row 2270, representative 8092.
def source72 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨61, by decide +kernel⟩

def target72 : Weights.Entry :=
  { word := [1, 12, 4, 4, 8, 0, 12], weights := [1, 0, 0, 1] }

def points72 : List (ℕ × ℕ) := [(0, 8), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 9)]

-- Period 10, original row 2276, representative 8039.
def source73 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨8, by decide +kernel⟩

def target73 : Weights.Entry :=
  { word := [1, 12, 4, 4, 8, 8, 10], weights := [1, 0, 1, 0] }

def points73 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 10, original row 2277, representative 8045.
def source74 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨14, by decide +kernel⟩

def target74 : Weights.Entry :=
  { word := [1, 12, 4, 4, 8, 8, 12], weights := [1, 0, 0, 1] }

def points74 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 10, original row 2282, representative 8072.
def source75 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨41, by decide +kernel⟩

def target75 : Weights.Entry :=
  { word := [1, 12, 8, 4, 2, 0, 9], weights := [0, 0, 1, 0] }

def points75 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 10, original row 2283, representative 8072.
def source76 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨41, by decide +kernel⟩

def target76 : Weights.Entry :=
  { word := [1, 12, 8, 4, 2, 0, 10], weights := [0, 0, 1, 0] }

def points76 : List (ℕ × ℕ) := [(0, 8), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 9)]

-- Period 10, original row 2284, representative 8085.
def source77 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨54, by decide +kernel⟩

def target77 : Weights.Entry :=
  { word := [1, 12, 8, 4, 2, 0, 12], weights := [1, 0, 0, 1] }

def points77 : List (ℕ × ℕ) := [(0, 8), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 9)]

-- Period 10, original row 2289, representative 8031.
def source78 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨0, by decide +kernel⟩

def target78 : Weights.Entry :=
  { word := [1, 12, 8, 4, 2, 8, 12], weights := [1, 0, 0, 1] }

def points78 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 10, original row 2308, representative 8064.
def source79 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨33, by decide +kernel⟩

def target79 : Weights.Entry :=
  { word := [1, 12, 8, 4, 10, 0, 9], weights := [0, 0, 1, 0] }

def points79 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 10, original row 2309, representative 8064.
def source80 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨33, by decide +kernel⟩

def target80 : Weights.Entry :=
  { word := [1, 12, 8, 4, 10, 0, 10], weights := [0, 0, 1, 0] }

def points80 : List (ℕ × ℕ) := [(0, 8), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 9)]

-- Period 10, original row 2310, representative 8079.
def source81 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨48, by decide +kernel⟩

def target81 : Weights.Entry :=
  { word := [1, 12, 8, 4, 10, 0, 12], weights := [1, 0, 0, 1] }

def points81 : List (ℕ × ℕ) := [(0, 8), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 9)]

-- Period 10, original row 2339, representative 8060.
def source82 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨29, by decide +kernel⟩

def target82 : Weights.Entry :=
  { word := [1, 12, 10, 0, 1, 8, 10], weights := [0, 1, 0, 1] }

def points82 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 10, original row 2340, representative 8060.
def source83 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨29, by decide +kernel⟩

def target83 : Weights.Entry :=
  { word := [1, 12, 10, 0, 1, 8, 12], weights := [0, 1, 0, 1] }

def points83 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 8), (8, 7)]

-- Period 10, original row 2346, representative 8052.
def source84 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨21, by decide +kernel⟩

def target84 : Weights.Entry :=
  { word := [1, 12, 10, 0, 9, 8, 10], weights := [0, 1, 0, 1] }

def points84 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 10, original row 2347, representative 8056.
def source85 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨25, by decide +kernel⟩

def target85 : Weights.Entry :=
  { word := [1, 12, 10, 0, 9, 8, 12], weights := [0, 1, 0, 1] }

def points85 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 10, original row 2365, representative 8060.
def source86 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨29, by decide +kernel⟩

def target86 : Weights.Entry :=
  { word := [1, 12, 12, 4, 0, 8, 10], weights := [1, 0, 0, 1] }

def points86 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 10, original row 2366, representative 8060.
def source87 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨29, by decide +kernel⟩

def target87 : Weights.Entry :=
  { word := [1, 12, 12, 4, 0, 8, 12], weights := [1, 0, 0, 1] }

def points87 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6), (7, 8), (8, 7)]

-- Period 10, original row 2371, representative 8091.
def source88 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨60, by decide +kernel⟩

def target88 : Weights.Entry :=
  { word := [1, 12, 12, 4, 8, 0, 9], weights := [1, 0, 1, 0] }

def points88 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 10, original row 2372, representative 8091.
def source89 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨60, by decide +kernel⟩

def target89 : Weights.Entry :=
  { word := [1, 12, 12, 4, 8, 0, 10], weights := [1, 0, 1, 0] }

def points89 : List (ℕ × ℕ) := [(0, 8), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 9)]

-- Period 10, original row 2373, representative 8093.
def source90 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨62, by decide +kernel⟩

def target90 : Weights.Entry :=
  { word := [1, 12, 12, 4, 8, 0, 12], weights := [1, 0, 0, 1] }

def points90 : List (ℕ × ℕ) := [(0, 8), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 9)]

-- Period 10, original row 2379, representative 8040.
def source91 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨9, by decide +kernel⟩

def target91 : Weights.Entry :=
  { word := [1, 12, 12, 4, 8, 8, 10], weights := [1, 0, 1, 0] }

def points91 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 10, original row 2380, representative 8046.
def source92 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨15, by decide +kernel⟩

def target92 : Weights.Entry :=
  { word := [1, 12, 12, 4, 8, 8, 12], weights := [1, 0, 0, 1] }

def points92 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 10, original row 2402, representative 8152.
def source93 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨121, by decide +kernel⟩

def target93 : Weights.Entry :=
  { word := [2, 0, 0, 12, 0, 12, 4], weights := [1, 0, 1, 0] }

def points93 : List (ℕ × ℕ) := [(0, 9), (1, 0), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 10, original row 3166, representative 8150.
def source94 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨119, by decide +kernel⟩

def target94 : Weights.Entry :=
  { word := [2, 10, 0, 1, 0, 12, 0], weights := [2, 1, 1, 0] }

def points94 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 5), (4, 6), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 10, original row 3168, representative 8150.
def source95 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨119, by decide +kernel⟩

def target95 : Weights.Entry :=
  { word := [2, 10, 0, 2, 0, 8, 1], weights := [2, 1, 0, 1] }

def points95 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 10, original row 3171, representative 8152.
def source96 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨121, by decide +kernel⟩

def target96 : Weights.Entry :=
  { word := [2, 10, 0, 9, 0, 4, 0], weights := [0, 1, 1, 0] }

def points96 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 5), (4, 6), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 10, original row 3174, representative 8151.
def source97 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨120, by decide +kernel⟩

def target97 : Weights.Entry :=
  { word := [2, 10, 0, 9, 0, 12, 0], weights := [0, 1, 1, 0] }

def points97 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 5), (4, 6), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 10, original row 3187, representative 8152.
def source98 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨121, by decide +kernel⟩

def target98 : Weights.Entry :=
  { word := [2, 10, 0, 10, 0, 0, 1], weights := [0, 1, 0, 1] }

def points98 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 10, original row 3188, representative 8152.
def source99 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨121, by decide +kernel⟩

def target99 : Weights.Entry :=
  { word := [2, 10, 0, 10, 0, 0, 2], weights := [0, 1, 0, 1] }

def points99 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 9), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 10, original row 3189, representative 8152.
def source100 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨121, by decide +kernel⟩

def target100 : Weights.Entry :=
  { word := [2, 10, 0, 10, 0, 0, 4], weights := [0, 1, 0, 1] }

def points100 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 9), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 10, original row 3195, representative 8151.
def source101 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨120, by decide +kernel⟩

def target101 : Weights.Entry :=
  { word := [2, 10, 0, 10, 0, 8, 1], weights := [0, 1, 0, 1] }

def points101 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 10, original row 3231, representative 8140.
def source102 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨109, by decide +kernel⟩

def target102 : Weights.Entry :=
  { word := [2, 10, 2, 8, 8, 4, 0], weights := [1, 0, 1, 0] }

def points102 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 10, original row 3233, representative 8139.
def source103 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨108, by decide +kernel⟩

def target103 : Weights.Entry :=
  { word := [2, 10, 2, 8, 8, 12, 0], weights := [1, 0, 1, 0] }

def points103 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 10, original row 3248, representative 8143.
def source104 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨112, by decide +kernel⟩

def target104 : Weights.Entry :=
  { word := [2, 10, 8, 1, 0, 12, 0], weights := [2, 1, 1, 0] }

def points104 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 10, original row 3254, representative 8148.
def source105 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨117, by decide +kernel⟩

def target105 : Weights.Entry :=
  { word := [2, 10, 8, 2, 0, 8, 1], weights := [1, 0, 0, 1] }

def points105 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 10, original row 3282, representative 8145.
def source106 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨114, by decide +kernel⟩

def target106 : Weights.Entry :=
  { word := [2, 10, 8, 9, 0, 4, 0], weights := [0, 1, 1, 0] }

def points106 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 10, original row 3285, representative 8144.
def source107 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨113, by decide +kernel⟩

def target107 : Weights.Entry :=
  { word := [2, 10, 8, 9, 0, 12, 0], weights := [0, 1, 1, 0] }

def points107 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 10, original row 3304, representative 8149.
def source108 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨118, by decide +kernel⟩

def target108 : Weights.Entry :=
  { word := [2, 10, 8, 10, 0, 8, 1], weights := [0, 1, 0, 1] }

def points108 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 10, original row 3377, representative 8138.
def source109 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨107, by decide +kernel⟩

def target109 : Weights.Entry :=
  { word := [2, 10, 10, 8, 8, 4, 0], weights := [1, 0, 1, 0] }

def points109 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 10, original row 3379, representative 8137.
def source110 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨106, by decide +kernel⟩

def target110 : Weights.Entry :=
  { word := [2, 10, 10, 8, 8, 12, 0], weights := [1, 0, 1, 0] }

def points110 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 10, original row 3412, representative 8152.
def source111 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨121, by decide +kernel⟩

def target111 : Weights.Entry :=
  { word := [4, 0, 0, 12, 0, 12, 4], weights := [1, 0, 1, 0] }

def points111 : List (ℕ × ℕ) := [(0, 9), (1, 0), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 10, original row 4022, representative 8158.
def source112 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨127, by decide +kernel⟩

def target112 : Weights.Entry :=
  { word := [4, 10, 8, 8, 12, 6, 0], weights := [0, 1, 1, 0] }

def points112 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 10, original row 4491, representative 8101.
def source113 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨70, by decide +kernel⟩

def target113 : Weights.Entry :=
  { word := [8, 1, 0, 1, 4, 2, 0], weights := [1, 1, 0, 0] }

def points113 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 4), (5, 5), (6, 3), (7, 1), (8, 2)]

-- Period 10, original row 4492, representative 8094.
def source114 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨63, by decide +kernel⟩

def target114 : Weights.Entry :=
  { word := [8, 1, 0, 1, 4, 10, 0], weights := [1, 0, 1, 0] }

def points114 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2)]

-- Period 10, original row 4493, representative 8101.
def source115 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨70, by decide +kernel⟩

def target115 : Weights.Entry :=
  { word := [8, 1, 0, 2, 2, 2, 0], weights := [1, 1, 0, 0] }

def points115 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 5), (4, 4), (5, 6), (6, 3), (7, 1), (8, 2)]

-- Period 10, original row 4495, representative 8094.
def source116 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨63, by decide +kernel⟩

def target116 : Weights.Entry :=
  { word := [8, 1, 0, 2, 2, 10, 0], weights := [1, 0, 0, 1] }

def points116 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 5), (4, 6), (5, 4), (6, 3), (7, 1), (8, 2)]

-- Period 10, original row 4519, representative 8077.
def source117 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨46, by decide +kernel⟩

def target117 : Weights.Entry :=
  { word := [8, 1, 4, 2, 0, 8, 0], weights := [0, 1, 0, 0] }

def points117 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 10, original row 4527, representative 8071.
def source118 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨40, by decide +kernel⟩

def target118 : Weights.Entry :=
  { word := [8, 1, 4, 2, 0, 9, 0], weights := [0, 1, 0, 0] }

def points118 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 10, original row 4529, representative 8071.
def source119 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨40, by decide +kernel⟩

def target119 : Weights.Entry :=
  { word := [8, 1, 4, 2, 0, 10, 0], weights := [0, 1, 0, 0] }

def points119 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 10, original row 4531, representative 8076.
def source120 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨45, by decide +kernel⟩

def target120 : Weights.Entry :=
  { word := [8, 1, 4, 2, 8, 2, 0], weights := [0, 1, 0, 0] }

def points120 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 10, original row 4535, representative 8072.
def source121 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨41, by decide +kernel⟩

def target121 : Weights.Entry :=
  { word := [8, 1, 4, 2, 8, 10, 0], weights := [0, 1, 0, 0] }

def points121 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 10, original row 4539, representative 8074.
def source122 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨43, by decide +kernel⟩

def target122 : Weights.Entry :=
  { word := [8, 1, 4, 4, 4, 8, 0], weights := [0, 0, 1, 0] }

def points122 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 10, original row 4541, representative 8073.
def source123 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨42, by decide +kernel⟩

def target123 : Weights.Entry :=
  { word := [8, 1, 4, 8, 4, 2, 0], weights := [0, 1, 1, 0] }

def points123 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 4), (5, 5), (6, 3), (7, 2), (8, 1)]

-- Period 10, original row 4543, representative 8070.
def source124 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨39, by decide +kernel⟩

def target124 : Weights.Entry :=
  { word := [8, 1, 4, 8, 4, 10, 0], weights := [0, 1, 1, 0] }

def points124 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 10, original row 4571, representative 8075.
def source125 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨44, by decide +kernel⟩

def target125 : Weights.Entry :=
  { word := [8, 1, 4, 12, 4, 8, 0], weights := [0, 0, 1, 0] }

def points125 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 10, original row 4573, representative 8102.
def source126 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨71, by decide +kernel⟩

def target126 : Weights.Entry :=
  { word := [8, 1, 8, 1, 4, 2, 0], weights := [1, 1, 0, 0] }

def points126 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 4), (5, 5), (6, 3), (7, 2), (8, 1)]

-- Period 10, original row 4574, representative 8095.
def source127 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨64, by decide +kernel⟩

def target127 : Weights.Entry :=
  { word := [8, 1, 8, 1, 4, 10, 0], weights := [1, 0, 1, 0] }

def points127 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

def period10Entries : List Weights.Entry := [target0, target1, target2, target3, target4, target5, target6, target7, target8, target9, target10, target11, target12, target13, target14, target15, target16, target17, target18, target19, target20, target21, target22, target23, target24, target25, target26, target27, target28, target29, target30, target31, target32, target33, target34, target35, target36, target37, target38, target39, target40, target41, target42, target43, target44, target45, target46, target47, target48, target49, target50, target51, target52, target53, target54, target55, target56, target57, target58, target59, target60, target61, target62, target63, target64, target65, target66, target67, target68, target69, target70, target71, target72, target73, target74, target75, target76, target77, target78, target79, target80, target81, target82, target83, target84, target85, target86, target87, target88, target89, target90, target91, target92, target93, target94, target95, target96, target97, target98, target99, target100, target101, target102, target103, target104, target105, target106, target107, target108, target109, target110, target111, target112, target113, target114, target115, target116, target117, target118, target119, target120, target121, target122, target123, target124, target125, target126, target127]

def period10Chunk : RowCoverage.Chunk where
  rows := [⟨1868, target0⟩, ⟨1872, target1⟩, ⟨1873, target2⟩, ⟨1886, target3⟩, ⟨1887, target4⟩, ⟨1895, target5⟩, ⟨1896, target6⟩, ⟨1897, target7⟩, ⟨1903, target8⟩, ⟨1904, target9⟩, ⟨1909, target10⟩, ⟨1910, target11⟩, ⟨1911, target12⟩, ⟨1917, target13⟩, ⟨1918, target14⟩, ⟨1923, target15⟩, ⟨1924, target16⟩, ⟨1925, target17⟩, ⟨1930, target18⟩, ⟨1949, target19⟩, ⟨1950, target20⟩, ⟨1951, target21⟩, ⟨1980, target22⟩, ⟨1981, target23⟩, ⟨1987, target24⟩, ⟨1988, target25⟩, ⟨2006, target26⟩, ⟨2007, target27⟩, ⟨2012, target28⟩, ⟨2013, target29⟩, ⟨2014, target30⟩, ⟨2020, target31⟩, ⟨2021, target32⟩, ⟨2026, target33⟩, ⟨2027, target34⟩, ⟨2028, target35⟩, ⟨2048, target36⟩, ⟨2049, target37⟩, ⟨2050, target38⟩, ⟨2072, target39⟩, ⟨2073, target40⟩, ⟨2074, target41⟩, ⟨2087, target42⟩, ⟨2088, target43⟩, ⟨2089, target44⟩, ⟨2102, target45⟩, ⟨2103, target46⟩, ⟨2104, target47⟩, ⟨2116, target48⟩, ⟨2117, target49⟩, ⟨2118, target50⟩, ⟨2204, target51⟩, ⟨2205, target52⟩, ⟨2206, target53⟩, ⟨2212, target54⟩, ⟨2213, target55⟩, ⟨2218, target56⟩, ⟨2219, target57⟩, ⟨2220, target58⟩, ⟨2226, target59⟩, ⟨2227, target60⟩, ⟨2231, target61⟩, ⟨2232, target62⟩, ⟨2245, target63⟩, ⟨2246, target64⟩, ⟨2254, target65⟩, ⟨2255, target66⟩, ⟨2256, target67⟩, ⟨2262, target68⟩, ⟨2263, target69⟩, ⟨2268, target70⟩, ⟨2269, target71⟩, ⟨2270, target72⟩, ⟨2276, target73⟩, ⟨2277, target74⟩, ⟨2282, target75⟩, ⟨2283, target76⟩, ⟨2284, target77⟩, ⟨2289, target78⟩, ⟨2308, target79⟩, ⟨2309, target80⟩, ⟨2310, target81⟩, ⟨2339, target82⟩, ⟨2340, target83⟩, ⟨2346, target84⟩, ⟨2347, target85⟩, ⟨2365, target86⟩, ⟨2366, target87⟩, ⟨2371, target88⟩, ⟨2372, target89⟩, ⟨2373, target90⟩, ⟨2379, target91⟩, ⟨2380, target92⟩, ⟨2402, target93⟩, ⟨3166, target94⟩, ⟨3168, target95⟩, ⟨3171, target96⟩, ⟨3174, target97⟩, ⟨3187, target98⟩, ⟨3188, target99⟩, ⟨3189, target100⟩, ⟨3195, target101⟩, ⟨3231, target102⟩, ⟨3233, target103⟩, ⟨3248, target104⟩, ⟨3254, target105⟩, ⟨3282, target106⟩, ⟨3285, target107⟩, ⟨3304, target108⟩, ⟨3377, target109⟩, ⟨3379, target110⟩, ⟨3412, target111⟩, ⟨4022, target112⟩, ⟨4491, target113⟩, ⟨4492, target114⟩, ⟨4493, target115⟩, ⟨4495, target116⟩, ⟨4519, target117⟩, ⟨4527, target118⟩, ⟨4529, target119⟩, ⟨4531, target120⟩, ⟨4535, target121⟩, ⟨4539, target122⟩, ⟨4541, target123⟩, ⟨4543, target124⟩, ⟨4571, target125⟩, ⟨4573, target126⟩, ⟨4574, target127⟩]
  indexMask := 1324504787835060272757137207005736152938668524533195653297114030193942728371350052341371631570683414606481726250073970435918763871611292577048676857529712938018703898093693906857449402706474870719776843379103008156013452672330953073485889252776652500845483004892907989845932955380411735241738722091036651803612710393066365671055585560440645550752190391490140590307033919268385660568776448697002519750938407623104757331582913306805800440495340017534639365337023906703375976322169704968155367756219817747245163326384726989561178310147333495055280192859527307253594992036162817058480785079046995950232536951862187487232884550144739274472558031286719609741805479545021859379302303963502306376677975510791410863771963740003681629489354519786178796593039176345220869042884368516752306966881712861322459195272216068276111467764973202577447123057779744091278173692240868842761318411435744310213662817039918823774745226026978726253253118631362852853006095856264090273633942290605482417703810182127595350365803804948193900020693813251060577185924686465075846907055407053494453088191992216708732880348831309473325577547168385727360430671292243051007156943201546140625280481130684557882551224026560093588105053344597158135133574430503941650399031562341926730288107498402515352800196527038026672434089881104343825694132888180534235110636612356612949909450890596879046818110233131615936053248
  count := 128

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

end FranklSmallCyclic.TransportBatches.G063.B005.Data
