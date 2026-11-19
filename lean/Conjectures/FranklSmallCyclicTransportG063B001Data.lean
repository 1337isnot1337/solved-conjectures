module

public import Conjectures.FranklSmallCyclicRowCoverage
public import Conjectures.FranklSmallCyclicCanonicalWords
public import Conjectures.FranklSmallCyclicOrbit9Block010Data

/-! 128 literal targets sharing one source proof block.
Original words and row indices are retained; weights may be transported.
-/
@[expose] public section

namespace FranklSmallCyclic.TransportBatches.G063.B001.Data

-- Period 9, original row 1665, representative 8064.
def source0 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨33, by decide +kernel⟩

def target0 : Weights.Entry :=
  { word := [0, 12, 8, 4, 10, 0, 10], weights := [0, 0, 1, 0] }

def points0 : List (ℕ × ℕ) := [(0, 8), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 0)]

-- Period 9, original row 1666, representative 8079.
def source1 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨48, by decide +kernel⟩

def target1 : Weights.Entry :=
  { word := [0, 12, 8, 4, 10, 0, 12], weights := [1, 0, 0, 1] }

-- Period 9, original row 1695, representative 8060.
def source2 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨29, by decide +kernel⟩

def target2 : Weights.Entry :=
  { word := [0, 12, 10, 0, 1, 8, 10], weights := [0, 1, 0, 1] }

-- Period 9, original row 1696, representative 8060.
def source3 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨29, by decide +kernel⟩

def target3 : Weights.Entry :=
  { word := [0, 12, 10, 0, 1, 8, 12], weights := [0, 1, 0, 1] }

def points3 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 8), (8, 7)]

-- Period 9, original row 1702, representative 8052.
def source4 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨21, by decide +kernel⟩

def target4 : Weights.Entry :=
  { word := [0, 12, 10, 0, 9, 8, 10], weights := [0, 1, 0, 1] }

-- Period 9, original row 1703, representative 8056.
def source5 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨25, by decide +kernel⟩

def target5 : Weights.Entry :=
  { word := [0, 12, 10, 0, 9, 8, 12], weights := [0, 1, 0, 1] }

-- Period 9, original row 1721, representative 8060.
def source6 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨29, by decide +kernel⟩

def target6 : Weights.Entry :=
  { word := [0, 12, 12, 4, 0, 8, 10], weights := [1, 0, 0, 1] }

def points6 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 1722, representative 8060.
def source7 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨29, by decide +kernel⟩

def target7 : Weights.Entry :=
  { word := [0, 12, 12, 4, 0, 8, 12], weights := [1, 0, 0, 1] }

def points7 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6), (7, 8), (8, 7)]

-- Period 9, original row 1727, representative 8091.
def source8 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨60, by decide +kernel⟩

def target8 : Weights.Entry :=
  { word := [0, 12, 12, 4, 8, 0, 9], weights := [1, 0, 1, 0] }

-- Period 9, original row 1728, representative 8091.
def source9 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨60, by decide +kernel⟩

def target9 : Weights.Entry :=
  { word := [0, 12, 12, 4, 8, 0, 10], weights := [1, 0, 1, 0] }

def points9 : List (ℕ × ℕ) := [(0, 8), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 0)]

-- Period 9, original row 1729, representative 8093.
def source10 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨62, by decide +kernel⟩

def target10 : Weights.Entry :=
  { word := [0, 12, 12, 4, 8, 0, 12], weights := [1, 0, 0, 1] }

-- Period 9, original row 1735, representative 8040.
def source11 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨9, by decide +kernel⟩

def target11 : Weights.Entry :=
  { word := [0, 12, 12, 4, 8, 8, 10], weights := [1, 0, 1, 0] }

-- Period 9, original row 1736, representative 8046.
def source12 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨15, by decide +kernel⟩

def target12 : Weights.Entry :=
  { word := [0, 12, 12, 4, 8, 8, 12], weights := [1, 0, 0, 1] }

-- Period 9, original row 1845, representative 8101.
def source13 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨70, by decide +kernel⟩

def target13 : Weights.Entry :=
  { word := [1, 4, 2, 0, 1, 0, 9], weights := [0, 1, 0, 1] }

def points13 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 1846, representative 8101.
def source14 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨70, by decide +kernel⟩

def target14 : Weights.Entry :=
  { word := [1, 4, 2, 0, 1, 0, 10], weights := [0, 1, 0, 1] }

def points14 : List (ℕ × ℕ) := [(0, 8), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 0), (8, 7)]

-- Period 9, original row 1847, representative 8101.
def source15 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨70, by decide +kernel⟩

def target15 : Weights.Entry :=
  { word := [1, 4, 2, 0, 1, 0, 12], weights := [0, 1, 0, 1] }

def points15 : List (ℕ × ℕ) := [(0, 7), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 0), (8, 8)]

-- Period 9, original row 1853, representative 8058.
def source16 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨27, by decide +kernel⟩

def target16 : Weights.Entry :=
  { word := [1, 4, 2, 0, 1, 8, 10], weights := [0, 1, 0, 1] }

def points16 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 1854, representative 8058.
def source17 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨27, by decide +kernel⟩

def target17 : Weights.Entry :=
  { word := [1, 4, 2, 0, 1, 8, 12], weights := [0, 1, 0, 1] }

def points17 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 8), (8, 7)]

-- Period 9, original row 1859, representative 8102.
def source18 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨71, by decide +kernel⟩

def target18 : Weights.Entry :=
  { word := [1, 4, 2, 0, 9, 0, 9], weights := [0, 1, 0, 1] }

def points18 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 1860, representative 8102.
def source19 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨71, by decide +kernel⟩

def target19 : Weights.Entry :=
  { word := [1, 4, 2, 0, 9, 0, 10], weights := [0, 1, 0, 1] }

def points19 : List (ℕ × ℕ) := [(0, 8), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 0)]

-- Period 9, original row 1861, representative 8103.
def source20 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨72, by decide +kernel⟩

def target20 : Weights.Entry :=
  { word := [1, 4, 2, 0, 9, 0, 12], weights := [0, 1, 0, 1] }

def points20 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 1867, representative 8050.
def source21 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨19, by decide +kernel⟩

def target21 : Weights.Entry :=
  { word := [1, 4, 2, 0, 9, 8, 10], weights := [0, 1, 0, 1] }

def points21 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 1868, representative 8054.
def source22 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨23, by decide +kernel⟩

def target22 : Weights.Entry :=
  { word := [1, 4, 2, 0, 9, 8, 12], weights := [0, 1, 0, 1] }

def points22 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 1872, representative 8073.
def source23 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨42, by decide +kernel⟩

def target23 : Weights.Entry :=
  { word := [1, 4, 2, 8, 2, 0, 9], weights := [0, 1, 1, 0] }

def points23 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 1873, representative 8073.
def source24 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨42, by decide +kernel⟩

def target24 : Weights.Entry :=
  { word := [1, 4, 2, 8, 2, 0, 10], weights := [0, 1, 1, 0] }

def points24 : List (ℕ × ℕ) := [(0, 8), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 0)]

-- Period 9, original row 1886, representative 8065.
def source25 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨34, by decide +kernel⟩

def target25 : Weights.Entry :=
  { word := [1, 4, 2, 8, 10, 0, 9], weights := [0, 1, 1, 0] }

def points25 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 1887, representative 8065.
def source26 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨34, by decide +kernel⟩

def target26 : Weights.Entry :=
  { word := [1, 4, 2, 8, 10, 0, 10], weights := [0, 1, 1, 0] }

def points26 : List (ℕ × ℕ) := [(0, 8), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 0)]

-- Period 9, original row 1895, representative 8101.
def source27 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨70, by decide +kernel⟩

def target27 : Weights.Entry :=
  { word := [1, 4, 4, 4, 0, 0, 9], weights := [1, 0, 0, 1] }

def points27 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 1896, representative 8101.
def source28 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨70, by decide +kernel⟩

def target28 : Weights.Entry :=
  { word := [1, 4, 4, 4, 0, 0, 10], weights := [1, 0, 0, 1] }

def points28 : List (ℕ × ℕ) := [(0, 8), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6), (7, 0), (8, 7)]

-- Period 9, original row 1897, representative 8101.
def source29 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨70, by decide +kernel⟩

def target29 : Weights.Entry :=
  { word := [1, 4, 4, 4, 0, 0, 12], weights := [1, 0, 0, 1] }

def points29 : List (ℕ × ℕ) := [(0, 7), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6), (7, 0), (8, 8)]

-- Period 9, original row 1903, representative 8058.
def source30 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨27, by decide +kernel⟩

def target30 : Weights.Entry :=
  { word := [1, 4, 4, 4, 0, 8, 10], weights := [1, 0, 0, 1] }

def points30 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 1904, representative 8058.
def source31 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨27, by decide +kernel⟩

def target31 : Weights.Entry :=
  { word := [1, 4, 4, 4, 0, 8, 12], weights := [1, 0, 0, 1] }

def points31 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6), (7, 8), (8, 7)]

-- Period 9, original row 1909, representative 8097.
def source32 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨66, by decide +kernel⟩

def target32 : Weights.Entry :=
  { word := [1, 4, 4, 4, 8, 0, 9], weights := [1, 0, 1, 0] }

def points32 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 1910, representative 8097.
def source33 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨66, by decide +kernel⟩

def target33 : Weights.Entry :=
  { word := [1, 4, 4, 4, 8, 0, 10], weights := [1, 0, 1, 0] }

def points33 : List (ℕ × ℕ) := [(0, 8), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 0)]

-- Period 9, original row 1911, representative 8099.
def source34 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨68, by decide +kernel⟩

def target34 : Weights.Entry :=
  { word := [1, 4, 4, 4, 8, 0, 12], weights := [1, 0, 0, 1] }

def points34 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 1917, representative 8038.
def source35 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨7, by decide +kernel⟩

def target35 : Weights.Entry :=
  { word := [1, 4, 4, 4, 8, 8, 10], weights := [1, 0, 1, 0] }

def points35 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 1918, representative 8044.
def source36 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨13, by decide +kernel⟩

def target36 : Weights.Entry :=
  { word := [1, 4, 4, 4, 8, 8, 12], weights := [1, 0, 0, 1] }

def points36 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 1923, representative 8076.
def source37 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨45, by decide +kernel⟩

def target37 : Weights.Entry :=
  { word := [1, 4, 8, 4, 2, 0, 9], weights := [0, 0, 1, 0] }

def points37 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 1924, representative 8076.
def source38 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨45, by decide +kernel⟩

def target38 : Weights.Entry :=
  { word := [1, 4, 8, 4, 2, 0, 10], weights := [0, 0, 1, 0] }

def points38 : List (ℕ × ℕ) := [(0, 8), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 0)]

-- Period 9, original row 1925, representative 8088.
def source39 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨57, by decide +kernel⟩

def target39 : Weights.Entry :=
  { word := [1, 4, 8, 4, 2, 0, 12], weights := [1, 0, 0, 1] }

def points39 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 1930, representative 8032.
def source40 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨1, by decide +kernel⟩

def target40 : Weights.Entry :=
  { word := [1, 4, 8, 4, 2, 8, 12], weights := [1, 0, 0, 1] }

def points40 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 1949, representative 8068.
def source41 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨37, by decide +kernel⟩

def target41 : Weights.Entry :=
  { word := [1, 4, 8, 4, 10, 0, 9], weights := [0, 0, 1, 0] }

def points41 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 1950, representative 8068.
def source42 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨37, by decide +kernel⟩

def target42 : Weights.Entry :=
  { word := [1, 4, 8, 4, 10, 0, 10], weights := [0, 0, 1, 0] }

def points42 : List (ℕ × ℕ) := [(0, 8), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 0)]

-- Period 9, original row 1951, representative 8082.
def source43 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨51, by decide +kernel⟩

def target43 : Weights.Entry :=
  { word := [1, 4, 8, 4, 10, 0, 12], weights := [1, 0, 0, 1] }

def points43 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 1980, representative 8061.
def source44 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨30, by decide +kernel⟩

def target44 : Weights.Entry :=
  { word := [1, 4, 10, 0, 1, 8, 10], weights := [0, 1, 0, 1] }

def points44 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 1981, representative 8061.
def source45 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨30, by decide +kernel⟩

def target45 : Weights.Entry :=
  { word := [1, 4, 10, 0, 1, 8, 12], weights := [0, 1, 0, 1] }

def points45 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 8), (8, 7)]

-- Period 9, original row 1987, representative 8053.
def source46 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨22, by decide +kernel⟩

def target46 : Weights.Entry :=
  { word := [1, 4, 10, 0, 9, 8, 10], weights := [0, 1, 0, 1] }

def points46 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 1988, representative 8057.
def source47 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨26, by decide +kernel⟩

def target47 : Weights.Entry :=
  { word := [1, 4, 10, 0, 9, 8, 12], weights := [0, 1, 0, 1] }

def points47 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 2006, representative 8061.
def source48 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨30, by decide +kernel⟩

def target48 : Weights.Entry :=
  { word := [1, 4, 12, 4, 0, 8, 10], weights := [1, 0, 0, 1] }

def points48 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 2007, representative 8061.
def source49 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨30, by decide +kernel⟩

def target49 : Weights.Entry :=
  { word := [1, 4, 12, 4, 0, 8, 12], weights := [1, 0, 0, 1] }

def points49 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6), (7, 8), (8, 7)]

-- Period 9, original row 2012, representative 8098.
def source50 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨67, by decide +kernel⟩

def target50 : Weights.Entry :=
  { word := [1, 4, 12, 4, 8, 0, 9], weights := [1, 0, 1, 0] }

def points50 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 2013, representative 8098.
def source51 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨67, by decide +kernel⟩

def target51 : Weights.Entry :=
  { word := [1, 4, 12, 4, 8, 0, 10], weights := [1, 0, 1, 0] }

def points51 : List (ℕ × ℕ) := [(0, 8), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 0)]

-- Period 9, original row 2014, representative 8100.
def source52 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨69, by decide +kernel⟩

def target52 : Weights.Entry :=
  { word := [1, 4, 12, 4, 8, 0, 12], weights := [1, 0, 0, 1] }

def points52 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 2020, representative 8041.
def source53 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨10, by decide +kernel⟩

def target53 : Weights.Entry :=
  { word := [1, 4, 12, 4, 8, 8, 10], weights := [1, 0, 1, 0] }

def points53 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 2021, representative 8047.
def source54 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨16, by decide +kernel⟩

def target54 : Weights.Entry :=
  { word := [1, 4, 12, 4, 8, 8, 12], weights := [1, 0, 0, 1] }

def points54 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 2026, representative 8071.
def source55 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨40, by decide +kernel⟩

def target55 : Weights.Entry :=
  { word := [1, 8, 1, 4, 2, 0, 9], weights := [0, 0, 1, 0] }

def points55 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 2027, representative 8071.
def source56 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨40, by decide +kernel⟩

def target56 : Weights.Entry :=
  { word := [1, 8, 1, 4, 2, 0, 10], weights := [0, 0, 1, 0] }

def points56 : List (ℕ × ℕ) := [(0, 8), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 0)]

-- Period 9, original row 2028, representative 8084.
def source57 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨53, by decide +kernel⟩

def target57 : Weights.Entry :=
  { word := [1, 8, 1, 4, 2, 0, 12], weights := [1, 0, 0, 1] }

def points57 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 2048, representative 8063.
def source58 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨32, by decide +kernel⟩

def target58 : Weights.Entry :=
  { word := [1, 8, 1, 4, 10, 0, 9], weights := [0, 0, 1, 0] }

def points58 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 2049, representative 8063.
def source59 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨32, by decide +kernel⟩

def target59 : Weights.Entry :=
  { word := [1, 8, 1, 4, 10, 0, 10], weights := [0, 0, 1, 0] }

def points59 : List (ℕ × ℕ) := [(0, 8), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 0)]

-- Period 9, original row 2050, representative 8078.
def source60 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨47, by decide +kernel⟩

def target60 : Weights.Entry :=
  { word := [1, 8, 1, 4, 10, 0, 12], weights := [1, 0, 0, 1] }

def points60 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 2072, representative 8074.
def source61 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨43, by decide +kernel⟩

def target61 : Weights.Entry :=
  { word := [1, 8, 2, 2, 2, 0, 9], weights := [0, 1, 0, 0] }

def points61 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 2073, representative 8074.
def source62 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨43, by decide +kernel⟩

def target62 : Weights.Entry :=
  { word := [1, 8, 2, 2, 2, 0, 10], weights := [0, 1, 0, 0] }

def points62 : List (ℕ × ℕ) := [(0, 8), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 0)]

-- Period 9, original row 2074, representative 8086.
def source63 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨55, by decide +kernel⟩

def target63 : Weights.Entry :=
  { word := [1, 8, 2, 2, 2, 0, 12], weights := [1, 0, 0, 1] }

def points63 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 2087, representative 8066.
def source64 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨35, by decide +kernel⟩

def target64 : Weights.Entry :=
  { word := [1, 8, 2, 2, 10, 0, 9], weights := [0, 1, 0, 0] }

def points64 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 2088, representative 8066.
def source65 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨35, by decide +kernel⟩

def target65 : Weights.Entry :=
  { word := [1, 8, 2, 2, 10, 0, 10], weights := [0, 1, 0, 0] }

def points65 : List (ℕ × ℕ) := [(0, 8), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 0)]

-- Period 9, original row 2089, representative 8080.
def source66 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨49, by decide +kernel⟩

def target66 : Weights.Entry :=
  { word := [1, 8, 2, 2, 10, 0, 12], weights := [1, 0, 0, 1] }

def points66 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 2102, representative 8075.
def source67 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨44, by decide +kernel⟩

def target67 : Weights.Entry :=
  { word := [1, 8, 2, 10, 2, 0, 9], weights := [0, 1, 0, 0] }

def points67 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 2103, representative 8075.
def source68 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨44, by decide +kernel⟩

def target68 : Weights.Entry :=
  { word := [1, 8, 2, 10, 2, 0, 10], weights := [0, 1, 0, 0] }

def points68 : List (ℕ × ℕ) := [(0, 8), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 0)]

-- Period 9, original row 2104, representative 8087.
def source69 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨56, by decide +kernel⟩

def target69 : Weights.Entry :=
  { word := [1, 8, 2, 10, 2, 0, 12], weights := [1, 1, 0, 0] }

def points69 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 2116, representative 8067.
def source70 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨36, by decide +kernel⟩

def target70 : Weights.Entry :=
  { word := [1, 8, 2, 10, 10, 0, 9], weights := [0, 1, 0, 0] }

def points70 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 2117, representative 8067.
def source71 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨36, by decide +kernel⟩

def target71 : Weights.Entry :=
  { word := [1, 8, 2, 10, 10, 0, 10], weights := [0, 1, 0, 0] }

def points71 : List (ℕ × ℕ) := [(0, 8), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 0)]

-- Period 9, original row 2118, representative 8081.
def source72 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨50, by decide +kernel⟩

def target72 : Weights.Entry :=
  { word := [1, 8, 2, 10, 10, 0, 12], weights := [1, 1, 0, 0] }

def points72 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 2204, representative 8094.
def source73 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨63, by decide +kernel⟩

def target73 : Weights.Entry :=
  { word := [1, 12, 2, 0, 1, 0, 9], weights := [0, 1, 0, 1] }

def points73 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 2205, representative 8094.
def source74 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨63, by decide +kernel⟩

def target74 : Weights.Entry :=
  { word := [1, 12, 2, 0, 1, 0, 10], weights := [0, 1, 0, 1] }

def points74 : List (ℕ × ℕ) := [(0, 8), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 0), (8, 7)]

-- Period 9, original row 2206, representative 8094.
def source75 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨63, by decide +kernel⟩

def target75 : Weights.Entry :=
  { word := [1, 12, 2, 0, 1, 0, 12], weights := [0, 1, 0, 1] }

def points75 : List (ℕ × ℕ) := [(0, 7), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 0), (8, 8)]

-- Period 9, original row 2212, representative 8059.
def source76 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨28, by decide +kernel⟩

def target76 : Weights.Entry :=
  { word := [1, 12, 2, 0, 1, 8, 10], weights := [0, 1, 0, 1] }

def points76 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 2213, representative 8059.
def source77 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨28, by decide +kernel⟩

def target77 : Weights.Entry :=
  { word := [1, 12, 2, 0, 1, 8, 12], weights := [0, 1, 0, 1] }

def points77 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 8), (8, 7)]

-- Period 9, original row 2218, representative 8095.
def source78 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨64, by decide +kernel⟩

def target78 : Weights.Entry :=
  { word := [1, 12, 2, 0, 9, 0, 9], weights := [0, 1, 0, 1] }

def points78 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 2219, representative 8095.
def source79 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨64, by decide +kernel⟩

def target79 : Weights.Entry :=
  { word := [1, 12, 2, 0, 9, 0, 10], weights := [0, 1, 0, 1] }

def points79 : List (ℕ × ℕ) := [(0, 8), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 0)]

-- Period 9, original row 2220, representative 8096.
def source80 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨65, by decide +kernel⟩

def target80 : Weights.Entry :=
  { word := [1, 12, 2, 0, 9, 0, 12], weights := [0, 1, 0, 1] }

def points80 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 2226, representative 8051.
def source81 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨20, by decide +kernel⟩

def target81 : Weights.Entry :=
  { word := [1, 12, 2, 0, 9, 8, 10], weights := [0, 1, 0, 1] }

def points81 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 2227, representative 8055.
def source82 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨24, by decide +kernel⟩

def target82 : Weights.Entry :=
  { word := [1, 12, 2, 0, 9, 8, 12], weights := [0, 1, 0, 1] }

def points82 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 2231, representative 8070.
def source83 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨39, by decide +kernel⟩

def target83 : Weights.Entry :=
  { word := [1, 12, 2, 8, 2, 0, 9], weights := [0, 1, 1, 0] }

def points83 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 2232, representative 8070.
def source84 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨39, by decide +kernel⟩

def target84 : Weights.Entry :=
  { word := [1, 12, 2, 8, 2, 0, 10], weights := [0, 1, 1, 0] }

def points84 : List (ℕ × ℕ) := [(0, 8), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 0)]

-- Period 9, original row 2245, representative 8062.
def source85 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨31, by decide +kernel⟩

def target85 : Weights.Entry :=
  { word := [1, 12, 2, 8, 10, 0, 9], weights := [0, 1, 1, 0] }

def points85 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 2246, representative 8062.
def source86 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨31, by decide +kernel⟩

def target86 : Weights.Entry :=
  { word := [1, 12, 2, 8, 10, 0, 10], weights := [0, 1, 1, 0] }

def points86 : List (ℕ × ℕ) := [(0, 8), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 0)]

-- Period 9, original row 2254, representative 8094.
def source87 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨63, by decide +kernel⟩

def target87 : Weights.Entry :=
  { word := [1, 12, 4, 4, 0, 0, 9], weights := [1, 0, 0, 1] }

def points87 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 2255, representative 8094.
def source88 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨63, by decide +kernel⟩

def target88 : Weights.Entry :=
  { word := [1, 12, 4, 4, 0, 0, 10], weights := [1, 0, 0, 1] }

def points88 : List (ℕ × ℕ) := [(0, 8), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6), (7, 0), (8, 7)]

-- Period 9, original row 2256, representative 8094.
def source89 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨63, by decide +kernel⟩

def target89 : Weights.Entry :=
  { word := [1, 12, 4, 4, 0, 0, 12], weights := [1, 0, 0, 1] }

def points89 : List (ℕ × ℕ) := [(0, 7), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6), (7, 0), (8, 8)]

-- Period 9, original row 2262, representative 8059.
def source90 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨28, by decide +kernel⟩

def target90 : Weights.Entry :=
  { word := [1, 12, 4, 4, 0, 8, 10], weights := [1, 0, 0, 1] }

def points90 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 2263, representative 8059.
def source91 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨28, by decide +kernel⟩

def target91 : Weights.Entry :=
  { word := [1, 12, 4, 4, 0, 8, 12], weights := [1, 0, 0, 1] }

def points91 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6), (7, 8), (8, 7)]

-- Period 9, original row 2268, representative 8090.
def source92 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨59, by decide +kernel⟩

def target92 : Weights.Entry :=
  { word := [1, 12, 4, 4, 8, 0, 9], weights := [1, 0, 1, 0] }

def points92 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 2269, representative 8090.
def source93 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨59, by decide +kernel⟩

def target93 : Weights.Entry :=
  { word := [1, 12, 4, 4, 8, 0, 10], weights := [1, 0, 1, 0] }

def points93 : List (ℕ × ℕ) := [(0, 8), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 0)]

-- Period 9, original row 2270, representative 8092.
def source94 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨61, by decide +kernel⟩

def target94 : Weights.Entry :=
  { word := [1, 12, 4, 4, 8, 0, 12], weights := [1, 0, 0, 1] }

def points94 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 2276, representative 8039.
def source95 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨8, by decide +kernel⟩

def target95 : Weights.Entry :=
  { word := [1, 12, 4, 4, 8, 8, 10], weights := [1, 0, 1, 0] }

def points95 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 2277, representative 8045.
def source96 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨14, by decide +kernel⟩

def target96 : Weights.Entry :=
  { word := [1, 12, 4, 4, 8, 8, 12], weights := [1, 0, 0, 1] }

def points96 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 2282, representative 8072.
def source97 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨41, by decide +kernel⟩

def target97 : Weights.Entry :=
  { word := [1, 12, 8, 4, 2, 0, 9], weights := [0, 0, 1, 0] }

def points97 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 2283, representative 8072.
def source98 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨41, by decide +kernel⟩

def target98 : Weights.Entry :=
  { word := [1, 12, 8, 4, 2, 0, 10], weights := [0, 0, 1, 0] }

def points98 : List (ℕ × ℕ) := [(0, 8), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 0)]

-- Period 9, original row 2284, representative 8085.
def source99 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨54, by decide +kernel⟩

def target99 : Weights.Entry :=
  { word := [1, 12, 8, 4, 2, 0, 12], weights := [1, 0, 0, 1] }

def points99 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 2289, representative 8031.
def source100 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨0, by decide +kernel⟩

def target100 : Weights.Entry :=
  { word := [1, 12, 8, 4, 2, 8, 12], weights := [1, 0, 0, 1] }

def points100 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 2308, representative 8064.
def source101 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨33, by decide +kernel⟩

def target101 : Weights.Entry :=
  { word := [1, 12, 8, 4, 10, 0, 9], weights := [0, 0, 1, 0] }

def points101 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 2309, representative 8064.
def source102 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨33, by decide +kernel⟩

def target102 : Weights.Entry :=
  { word := [1, 12, 8, 4, 10, 0, 10], weights := [0, 0, 1, 0] }

def points102 : List (ℕ × ℕ) := [(0, 8), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 0)]

-- Period 9, original row 2310, representative 8079.
def source103 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨48, by decide +kernel⟩

def target103 : Weights.Entry :=
  { word := [1, 12, 8, 4, 10, 0, 12], weights := [1, 0, 0, 1] }

def points103 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 2339, representative 8060.
def source104 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨29, by decide +kernel⟩

def target104 : Weights.Entry :=
  { word := [1, 12, 10, 0, 1, 8, 10], weights := [0, 1, 0, 1] }

def points104 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 2340, representative 8060.
def source105 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨29, by decide +kernel⟩

def target105 : Weights.Entry :=
  { word := [1, 12, 10, 0, 1, 8, 12], weights := [0, 1, 0, 1] }

def points105 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 8), (8, 7)]

-- Period 9, original row 2346, representative 8052.
def source106 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨21, by decide +kernel⟩

def target106 : Weights.Entry :=
  { word := [1, 12, 10, 0, 9, 8, 10], weights := [0, 1, 0, 1] }

def points106 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 2347, representative 8056.
def source107 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨25, by decide +kernel⟩

def target107 : Weights.Entry :=
  { word := [1, 12, 10, 0, 9, 8, 12], weights := [0, 1, 0, 1] }

def points107 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 2365, representative 8060.
def source108 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨29, by decide +kernel⟩

def target108 : Weights.Entry :=
  { word := [1, 12, 12, 4, 0, 8, 10], weights := [1, 0, 0, 1] }

def points108 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 2366, representative 8060.
def source109 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨29, by decide +kernel⟩

def target109 : Weights.Entry :=
  { word := [1, 12, 12, 4, 0, 8, 12], weights := [1, 0, 0, 1] }

def points109 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6), (7, 8), (8, 7)]

-- Period 9, original row 2371, representative 8091.
def source110 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨60, by decide +kernel⟩

def target110 : Weights.Entry :=
  { word := [1, 12, 12, 4, 8, 0, 9], weights := [1, 0, 1, 0] }

def points110 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 2372, representative 8091.
def source111 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨60, by decide +kernel⟩

def target111 : Weights.Entry :=
  { word := [1, 12, 12, 4, 8, 0, 10], weights := [1, 0, 1, 0] }

def points111 : List (ℕ × ℕ) := [(0, 8), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 0)]

-- Period 9, original row 2373, representative 8093.
def source112 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨62, by decide +kernel⟩

def target112 : Weights.Entry :=
  { word := [1, 12, 12, 4, 8, 0, 12], weights := [1, 0, 0, 1] }

def points112 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 2379, representative 8040.
def source113 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨9, by decide +kernel⟩

def target113 : Weights.Entry :=
  { word := [1, 12, 12, 4, 8, 8, 10], weights := [1, 0, 1, 0] }

def points113 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 2380, representative 8046.
def source114 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨15, by decide +kernel⟩

def target114 : Weights.Entry :=
  { word := [1, 12, 12, 4, 8, 8, 12], weights := [1, 0, 0, 1] }

def points114 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 2442, representative 8124.
def source115 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨93, by decide +kernel⟩

def target115 : Weights.Entry :=
  { word := [2, 0, 4, 10, 0, 12, 2], weights := [1, 0, 1, 1] }

-- Period 9, original row 2443, representative 8124.
def source116 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨93, by decide +kernel⟩

def target116 : Weights.Entry :=
  { word := [2, 0, 4, 10, 0, 12, 4], weights := [1, 0, 1, 1] }

def points116 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 8), (8, 7)]

-- Period 9, original row 2453, representative 8122.
def source117 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨91, by decide +kernel⟩

def target117 : Weights.Entry :=
  { word := [2, 0, 4, 10, 8, 12, 4], weights := [1, 0, 1, 1] }

-- Period 9, original row 2474, representative 8111.
def source118 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨80, by decide +kernel⟩

def target118 : Weights.Entry :=
  { word := [2, 0, 8, 4, 8, 12, 4], weights := [1, 0, 0, 1] }

-- Period 9, original row 2478, representative 8126.
def source119 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨95, by decide +kernel⟩

def target119 : Weights.Entry :=
  { word := [2, 0, 8, 9, 4, 12, 4], weights := [1, 0, 1, 1] }

-- Period 9, original row 2482, representative 8125.
def source120 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨94, by decide +kernel⟩

def target120 : Weights.Entry :=
  { word := [2, 0, 8, 9, 12, 12, 4], weights := [1, 0, 1, 1] }

-- Period 9, original row 2493, representative 8115.
def source121 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨84, by decide +kernel⟩

def target121 : Weights.Entry :=
  { word := [2, 0, 8, 12, 0, 12, 2], weights := [1, 0, 1, 0] }

-- Period 9, original row 2494, representative 8115.
def source122 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨84, by decide +kernel⟩

def target122 : Weights.Entry :=
  { word := [2, 0, 8, 12, 0, 12, 4], weights := [1, 0, 1, 0] }

def points122 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 8), (8, 7)]

-- Period 9, original row 2504, representative 8112.
def source123 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨81, by decide +kernel⟩

def target123 : Weights.Entry :=
  { word := [2, 0, 8, 12, 8, 12, 4], weights := [1, 0, 1, 0] }

-- Period 9, original row 2513, representative 8135.
def source124 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨104, by decide +kernel⟩

def target124 : Weights.Entry :=
  { word := [2, 0, 9, 8, 1, 12, 2], weights := [1, 0, 1, 1] }

-- Period 9, original row 2514, representative 8135.
def source125 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨104, by decide +kernel⟩

def target125 : Weights.Entry :=
  { word := [2, 0, 9, 8, 1, 12, 4], weights := [1, 0, 1, 1] }

def points125 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 8), (8, 7)]

-- Period 9, original row 2520, representative 8130.
def source126 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨99, by decide +kernel⟩

def target126 : Weights.Entry :=
  { word := [2, 0, 9, 8, 9, 12, 4], weights := [1, 0, 1, 1] }

-- Period 9, original row 2564, representative 8123.
def source127 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B010.Data.entryAt ⟨92, by decide +kernel⟩

def target127 : Weights.Entry :=
  { word := [2, 0, 12, 10, 0, 12, 2], weights := [1, 0, 1, 1] }

def period9Entries : List Weights.Entry := [target0, target1, target2, target3, target4, target5, target6, target7, target8, target9, target10, target11, target12, target13, target14, target15, target16, target17, target18, target19, target20, target21, target22, target23, target24, target25, target26, target27, target28, target29, target30, target31, target32, target33, target34, target35, target36, target37, target38, target39, target40, target41, target42, target43, target44, target45, target46, target47, target48, target49, target50, target51, target52, target53, target54, target55, target56, target57, target58, target59, target60, target61, target62, target63, target64, target65, target66, target67, target68, target69, target70, target71, target72, target73, target74, target75, target76, target77, target78, target79, target80, target81, target82, target83, target84, target85, target86, target87, target88, target89, target90, target91, target92, target93, target94, target95, target96, target97, target98, target99, target100, target101, target102, target103, target104, target105, target106, target107, target108, target109, target110, target111, target112, target113, target114, target115, target116, target117, target118, target119, target120, target121, target122, target123, target124, target125, target126, target127]

def period9Chunk : RowCoverage.Chunk where
  rows := [⟨1665, target0⟩, ⟨1666, target1⟩, ⟨1695, target2⟩, ⟨1696, target3⟩, ⟨1702, target4⟩, ⟨1703, target5⟩, ⟨1721, target6⟩, ⟨1722, target7⟩, ⟨1727, target8⟩, ⟨1728, target9⟩, ⟨1729, target10⟩, ⟨1735, target11⟩, ⟨1736, target12⟩, ⟨1845, target13⟩, ⟨1846, target14⟩, ⟨1847, target15⟩, ⟨1853, target16⟩, ⟨1854, target17⟩, ⟨1859, target18⟩, ⟨1860, target19⟩, ⟨1861, target20⟩, ⟨1867, target21⟩, ⟨1868, target22⟩, ⟨1872, target23⟩, ⟨1873, target24⟩, ⟨1886, target25⟩, ⟨1887, target26⟩, ⟨1895, target27⟩, ⟨1896, target28⟩, ⟨1897, target29⟩, ⟨1903, target30⟩, ⟨1904, target31⟩, ⟨1909, target32⟩, ⟨1910, target33⟩, ⟨1911, target34⟩, ⟨1917, target35⟩, ⟨1918, target36⟩, ⟨1923, target37⟩, ⟨1924, target38⟩, ⟨1925, target39⟩, ⟨1930, target40⟩, ⟨1949, target41⟩, ⟨1950, target42⟩, ⟨1951, target43⟩, ⟨1980, target44⟩, ⟨1981, target45⟩, ⟨1987, target46⟩, ⟨1988, target47⟩, ⟨2006, target48⟩, ⟨2007, target49⟩, ⟨2012, target50⟩, ⟨2013, target51⟩, ⟨2014, target52⟩, ⟨2020, target53⟩, ⟨2021, target54⟩, ⟨2026, target55⟩, ⟨2027, target56⟩, ⟨2028, target57⟩, ⟨2048, target58⟩, ⟨2049, target59⟩, ⟨2050, target60⟩, ⟨2072, target61⟩, ⟨2073, target62⟩, ⟨2074, target63⟩, ⟨2087, target64⟩, ⟨2088, target65⟩, ⟨2089, target66⟩, ⟨2102, target67⟩, ⟨2103, target68⟩, ⟨2104, target69⟩, ⟨2116, target70⟩, ⟨2117, target71⟩, ⟨2118, target72⟩, ⟨2204, target73⟩, ⟨2205, target74⟩, ⟨2206, target75⟩, ⟨2212, target76⟩, ⟨2213, target77⟩, ⟨2218, target78⟩, ⟨2219, target79⟩, ⟨2220, target80⟩, ⟨2226, target81⟩, ⟨2227, target82⟩, ⟨2231, target83⟩, ⟨2232, target84⟩, ⟨2245, target85⟩, ⟨2246, target86⟩, ⟨2254, target87⟩, ⟨2255, target88⟩, ⟨2256, target89⟩, ⟨2262, target90⟩, ⟨2263, target91⟩, ⟨2268, target92⟩, ⟨2269, target93⟩, ⟨2270, target94⟩, ⟨2276, target95⟩, ⟨2277, target96⟩, ⟨2282, target97⟩, ⟨2283, target98⟩, ⟨2284, target99⟩, ⟨2289, target100⟩, ⟨2308, target101⟩, ⟨2309, target102⟩, ⟨2310, target103⟩, ⟨2339, target104⟩, ⟨2340, target105⟩, ⟨2346, target106⟩, ⟨2347, target107⟩, ⟨2365, target108⟩, ⟨2366, target109⟩, ⟨2371, target110⟩, ⟨2372, target111⟩, ⟨2373, target112⟩, ⟨2379, target113⟩, ⟨2380, target114⟩, ⟨2442, target115⟩, ⟨2443, target116⟩, ⟨2453, target117⟩, ⟨2474, target118⟩, ⟨2478, target119⟩, ⟨2482, target120⟩, ⟨2493, target121⟩, ⟨2494, target122⟩, ⟨2504, target123⟩, ⟨2513, target124⟩, ⟨2514, target125⟩, ⟨2520, target126⟩, ⟨2564, target127⟩]
  indexMask := 6932803364399231795436856508194758225837944403478075596023534808961198099143164524853492888682386995134137596608113690188273221044715333344622827846821200588965915206235397712132996446018922346048346581411750775007855195937284935053283991130433620806029234705711853367780351826298625605775194865473456572792008569651253234706515550507068013372841236857833356570924635450679073145468695369777969382432299933041904600515986111047144664955354593541689608659848528264140126661257774010181529579133885006723955020834187312422018064065030754936573157980414967889656314496016986611539336876562678939778730620293918937413137188537796619130019964711466458876844971544734148077298987182034811344889915698510166553964924838258395513321572552081211868136959867222819237764635268481024
  count := 128

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

end FranklSmallCyclic.TransportBatches.G063.B001.Data
