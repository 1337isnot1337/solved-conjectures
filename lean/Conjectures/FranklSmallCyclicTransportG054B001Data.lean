module

public import Conjectures.FranklSmallCyclicRowCoverage
public import Conjectures.FranklSmallCyclicCanonicalWords
public import Conjectures.FranklSmallCyclicOrbit9Block001Data

/-! 128 literal targets sharing one source proof block.
Original words and row indices are retained; weights may be transported.
-/
@[expose] public section

namespace FranklSmallCyclic.TransportBatches.G054.B001.Data

-- Period 9, original row 6553, representative 6919.
def source0 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨43, by decide +kernel⟩

def target0 : Weights.Entry :=
  { word := [8, 12, 8, 12, 8, 12, 10], weights := [1, 0, 1, 0] }

-- Period 9, original row 6554, representative 6925.
def source1 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨49, by decide +kernel⟩

def target1 : Weights.Entry :=
  { word := [8, 12, 8, 12, 8, 12, 12], weights := [1, 0, 1, 0] }

-- Period 9, original row 6646, representative 6922.
def source2 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨46, by decide +kernel⟩

def target2 : Weights.Entry :=
  { word := [9, 0, 1, 4, 8, 12, 12], weights := [1, 0, 0, 1] }

def points2 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 6682, representative 6929.
def source3 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨53, by decide +kernel⟩

def target3 : Weights.Entry :=
  { word := [9, 0, 1, 12, 8, 12, 12], weights := [1, 0, 1, 0] }

def points3 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 6804, representative 6948.
def source4 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨72, by decide +kernel⟩

def target4 : Weights.Entry :=
  { word := [9, 0, 4, 10, 0, 12, 10], weights := [1, 0, 1, 1] }

def points4 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 6805, representative 6948.
def source5 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨72, by decide +kernel⟩

def target5 : Weights.Entry :=
  { word := [9, 0, 4, 10, 0, 12, 12], weights := [1, 0, 1, 1] }

def points5 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 8), (8, 7)]

-- Period 9, original row 6813, representative 6946.
def source6 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨70, by decide +kernel⟩

def target6 : Weights.Entry :=
  { word := [9, 0, 4, 10, 8, 12, 12], weights := [1, 0, 1, 1] }

def points6 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 6839, representative 6941.
def source7 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨65, by decide +kernel⟩

def target7 : Weights.Entry :=
  { word := [9, 0, 8, 9, 4, 12, 12], weights := [1, 0, 1, 1] }

def points7 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 6843, representative 6937.
def source8 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨61, by decide +kernel⟩

def target8 : Weights.Entry :=
  { word := [9, 0, 8, 9, 12, 12, 12], weights := [1, 0, 1, 1] }

def points8 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 6950, representative 6947.
def source9 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨71, by decide +kernel⟩

def target9 : Weights.Entry :=
  { word := [9, 0, 12, 10, 0, 12, 10], weights := [1, 0, 1, 1] }

def points9 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 6951, representative 6947.
def source10 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨71, by decide +kernel⟩

def target10 : Weights.Entry :=
  { word := [9, 0, 12, 10, 0, 12, 12], weights := [1, 0, 1, 1] }

def points10 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 8), (8, 7)]

-- Period 9, original row 6959, representative 6945.
def source11 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨69, by decide +kernel⟩

def target11 : Weights.Entry :=
  { word := [9, 0, 12, 10, 8, 12, 12], weights := [1, 0, 1, 1] }

def points11 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 7082, representative 6923.
def source12 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨47, by decide +kernel⟩

def target12 : Weights.Entry :=
  { word := [9, 8, 1, 4, 8, 12, 12], weights := [1, 0, 0, 1] }

def points12 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 7118, representative 6926.
def source13 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨50, by decide +kernel⟩

def target13 : Weights.Entry :=
  { word := [9, 8, 1, 12, 8, 12, 12], weights := [1, 0, 1, 0] }

def points13 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 7404, representative 6995.
def source14 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨119, by decide +kernel⟩

def target14 : Weights.Entry :=
  { word := [10, 0, 0, 9, 4, 4, 12], weights := [1, 0, 1, 1] }

-- Period 9, original row 7408, representative 6992.
def source15 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨116, by decide +kernel⟩

def target15 : Weights.Entry :=
  { word := [10, 0, 0, 9, 12, 4, 12], weights := [1, 0, 1, 1] }

-- Period 9, original row 7416, representative 6989.
def source16 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨113, by decide +kernel⟩

def target16 : Weights.Entry :=
  { word := [10, 0, 0, 12, 0, 4, 10], weights := [1, 0, 1, 0] }

-- Period 9, original row 7417, representative 6989.
def source17 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨113, by decide +kernel⟩

def target17 : Weights.Entry :=
  { word := [10, 0, 0, 12, 0, 4, 12], weights := [1, 0, 1, 0] }

def points17 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 8), (8, 7)]

-- Period 9, original row 7465, representative 7003.
def source18 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨127, by decide +kernel⟩

def target18 : Weights.Entry :=
  { word := [10, 0, 4, 10, 8, 4, 12], weights := [1, 0, 1, 1] }

-- Period 9, original row 7489, representative 6984.
def source19 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨108, by decide +kernel⟩

def target19 : Weights.Entry :=
  { word := [10, 0, 8, 4, 8, 4, 12], weights := [1, 0, 0, 1] }

-- Period 9, original row 7493, representative 6994.
def source20 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨118, by decide +kernel⟩

def target20 : Weights.Entry :=
  { word := [10, 0, 8, 9, 4, 4, 12], weights := [1, 0, 1, 1] }

-- Period 9, original row 7497, representative 6991.
def source21 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨115, by decide +kernel⟩

def target21 : Weights.Entry :=
  { word := [10, 0, 8, 9, 12, 4, 12], weights := [1, 0, 1, 1] }

-- Period 9, original row 7507, representative 6988.
def source22 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨112, by decide +kernel⟩

def target22 : Weights.Entry :=
  { word := [10, 0, 8, 12, 0, 4, 10], weights := [1, 0, 1, 0] }

-- Period 9, original row 7508, representative 6988.
def source23 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨112, by decide +kernel⟩

def target23 : Weights.Entry :=
  { word := [10, 0, 8, 12, 0, 4, 12], weights := [1, 0, 1, 0] }

def points23 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 8), (8, 7)]

-- Period 9, original row 7519, representative 6985.
def source24 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨109, by decide +kernel⟩

def target24 : Weights.Entry :=
  { word := [10, 0, 8, 12, 8, 4, 12], weights := [1, 0, 1, 0] }

-- Period 9, original row 7587, representative 7002.
def source25 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨126, by decide +kernel⟩

def target25 : Weights.Entry :=
  { word := [10, 0, 12, 10, 8, 4, 12], weights := [1, 0, 1, 1] }

-- Period 9, original row 7619, representative 6989.
def source26 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨113, by decide +kernel⟩

def target26 : Weights.Entry :=
  { word := [10, 2, 0, 10, 0, 0, 10], weights := [0, 1, 0, 1] }

def points26 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2)]

-- Period 9, original row 7620, representative 6989.
def source27 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨113, by decide +kernel⟩

def target27 : Weights.Entry :=
  { word := [10, 2, 0, 10, 0, 0, 12], weights := [0, 1, 0, 1] }

def points27 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2)]

-- Period 9, original row 7626, representative 6987.
def source28 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨111, by decide +kernel⟩

def target28 : Weights.Entry :=
  { word := [10, 2, 0, 10, 0, 8, 12], weights := [1, 0, 0, 1] }

-- Period 9, original row 7628, representative 6988.
def source29 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨112, by decide +kernel⟩

def target29 : Weights.Entry :=
  { word := [10, 2, 0, 10, 8, 0, 12], weights := [0, 1, 0, 1] }

def points29 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2)]

-- Period 9, original row 7630, representative 6986.
def source30 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨110, by decide +kernel⟩

def target30 : Weights.Entry :=
  { word := [10, 2, 0, 10, 8, 8, 12], weights := [1, 0, 0, 1] }

-- Period 9, original row 7636, representative 7000.
def source31 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨124, by decide +kernel⟩

def target31 : Weights.Entry :=
  { word := [10, 2, 0, 12, 10, 0, 10], weights := [1, 1, 0, 1] }

-- Period 9, original row 7647, representative 6995.
def source32 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨119, by decide +kernel⟩

def target32 : Weights.Entry :=
  { word := [10, 2, 2, 8, 1, 0, 10], weights := [1, 1, 0, 1] }

def points32 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 7648, representative 6995.
def source33 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨119, by decide +kernel⟩

def target33 : Weights.Entry :=
  { word := [10, 2, 2, 8, 1, 0, 12], weights := [1, 1, 0, 1] }

def points33 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 7661, representative 6993.
def source34 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨117, by decide +kernel⟩

def target34 : Weights.Entry :=
  { word := [10, 2, 2, 8, 9, 0, 10], weights := [1, 1, 0, 1] }

-- Period 9, original row 7662, representative 6994.
def source35 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨118, by decide +kernel⟩

def target35 : Weights.Entry :=
  { word := [10, 2, 2, 8, 9, 0, 12], weights := [1, 1, 0, 1] }

def points35 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 7678, representative 6980.
def source36 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨104, by decide +kernel⟩

def target36 : Weights.Entry :=
  { word := [10, 2, 8, 2, 0, 8, 10], weights := [1, 0, 0, 1] }

-- Period 9, original row 7679, representative 6980.
def source37 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨104, by decide +kernel⟩

def target37 : Weights.Entry :=
  { word := [10, 2, 8, 2, 0, 8, 12], weights := [1, 0, 0, 1] }

def points37 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 8), (8, 7)]

-- Period 9, original row 7685, representative 6984.
def source38 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨108, by decide +kernel⟩

def target38 : Weights.Entry :=
  { word := [10, 2, 8, 2, 8, 0, 12], weights := [1, 0, 0, 1] }

def points38 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 7689, representative 6981.
def source39 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨105, by decide +kernel⟩

def target39 : Weights.Entry :=
  { word := [10, 2, 8, 2, 8, 8, 12], weights := [1, 0, 0, 1] }

-- Period 9, original row 7728, representative 6983.
def source40 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨107, by decide +kernel⟩

def target40 : Weights.Entry :=
  { word := [10, 2, 8, 10, 0, 8, 10], weights := [1, 0, 0, 1] }

-- Period 9, original row 7729, representative 6983.
def source41 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨107, by decide +kernel⟩

def target41 : Weights.Entry :=
  { word := [10, 2, 8, 10, 0, 8, 12], weights := [1, 0, 0, 1] }

def points41 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 8), (8, 7)]

-- Period 9, original row 7736, representative 6985.
def source42 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨109, by decide +kernel⟩

def target42 : Weights.Entry :=
  { word := [10, 2, 8, 10, 8, 0, 12], weights := [0, 1, 0, 1] }

def points42 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 7742, representative 6982.
def source43 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨106, by decide +kernel⟩

def target43 : Weights.Entry :=
  { word := [10, 2, 8, 10, 8, 8, 12], weights := [1, 0, 0, 1] }

-- Period 9, original row 7752, representative 6999.
def source44 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨123, by decide +kernel⟩

def target44 : Weights.Entry :=
  { word := [10, 2, 8, 12, 2, 0, 10], weights := [1, 1, 1, 0] }

-- Period 9, original row 7753, representative 7003.
def source45 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨127, by decide +kernel⟩

def target45 : Weights.Entry :=
  { word := [10, 2, 8, 12, 2, 0, 12], weights := [1, 1, 0, 1] }

def points45 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 7756, representative 6997.
def source46 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨121, by decide +kernel⟩

def target46 : Weights.Entry :=
  { word := [10, 2, 8, 12, 2, 8, 10], weights := [1, 1, 1, 1] }

-- Period 9, original row 7768, representative 6998.
def source47 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨122, by decide +kernel⟩

def target47 : Weights.Entry :=
  { word := [10, 2, 8, 12, 10, 0, 10], weights := [1, 1, 1, 0] }

-- Period 9, original row 7769, representative 7002.
def source48 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨126, by decide +kernel⟩

def target48 : Weights.Entry :=
  { word := [10, 2, 8, 12, 10, 0, 12], weights := [1, 1, 0, 1] }

def points48 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 7773, representative 6996.
def source49 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨120, by decide +kernel⟩

def target49 : Weights.Entry :=
  { word := [10, 2, 8, 12, 10, 8, 10], weights := [1, 1, 1, 1] }

-- Period 9, original row 7774, representative 7001.
def source50 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨125, by decide +kernel⟩

def target50 : Weights.Entry :=
  { word := [10, 2, 8, 12, 10, 8, 12], weights := [2, 1, 1, 2] }

-- Period 9, original row 7787, representative 6992.
def source51 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨116, by decide +kernel⟩

def target51 : Weights.Entry :=
  { word := [10, 2, 10, 8, 1, 0, 10], weights := [1, 1, 0, 1] }

def points51 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 7788, representative 6992.
def source52 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨116, by decide +kernel⟩

def target52 : Weights.Entry :=
  { word := [10, 2, 10, 8, 1, 0, 12], weights := [1, 1, 0, 1] }

def points52 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 7801, representative 6990.
def source53 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨114, by decide +kernel⟩

def target53 : Weights.Entry :=
  { word := [10, 2, 10, 8, 9, 0, 10], weights := [1, 1, 0, 1] }

-- Period 9, original row 7802, representative 6991.
def source54 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨115, by decide +kernel⟩

def target54 : Weights.Entry :=
  { word := [10, 2, 10, 8, 9, 0, 12], weights := [1, 1, 0, 1] }

def points54 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 7840, representative 6976.
def source55 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨100, by decide +kernel⟩

def target55 : Weights.Entry :=
  { word := [10, 8, 0, 4, 8, 4, 10], weights := [1, 0, 1, 0] }

-- Period 9, original row 7841, representative 6980.
def source56 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨104, by decide +kernel⟩

def target56 : Weights.Entry :=
  { word := [10, 8, 0, 4, 8, 4, 12], weights := [1, 0, 0, 1] }

def points56 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2)]

-- Period 9, original row 7866, representative 6987.
def source57 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨111, by decide +kernel⟩

def target57 : Weights.Entry :=
  { word := [10, 8, 0, 12, 0, 4, 10], weights := [1, 0, 0, 1] }

def points57 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 7867, representative 6987.
def source58 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨111, by decide +kernel⟩

def target58 : Weights.Entry :=
  { word := [10, 8, 0, 12, 0, 4, 12], weights := [1, 0, 0, 1] }

def points58 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 7891, representative 6979.
def source59 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨103, by decide +kernel⟩

def target59 : Weights.Entry :=
  { word := [10, 8, 0, 12, 8, 4, 10], weights := [1, 0, 1, 0] }

-- Period 9, original row 7892, representative 6983.
def source60 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨107, by decide +kernel⟩

def target60 : Weights.Entry :=
  { word := [10, 8, 0, 12, 8, 4, 12], weights := [1, 0, 0, 1] }

def points60 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2)]

-- Period 9, original row 8006, representative 6977.
def source61 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨101, by decide +kernel⟩

def target61 : Weights.Entry :=
  { word := [10, 8, 8, 4, 8, 4, 10], weights := [1, 0, 1, 0] }

-- Period 9, original row 8007, representative 6981.
def source62 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨105, by decide +kernel⟩

def target62 : Weights.Entry :=
  { word := [10, 8, 8, 4, 8, 4, 12], weights := [1, 0, 0, 1] }

def points62 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 8050, representative 6986.
def source63 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨110, by decide +kernel⟩

def target63 : Weights.Entry :=
  { word := [10, 8, 8, 12, 0, 4, 10], weights := [1, 0, 0, 1] }

def points63 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 8051, representative 6986.
def source64 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨110, by decide +kernel⟩

def target64 : Weights.Entry :=
  { word := [10, 8, 8, 12, 0, 4, 12], weights := [1, 0, 0, 1] }

def points64 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 8079, representative 6978.
def source65 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨102, by decide +kernel⟩

def target65 : Weights.Entry :=
  { word := [10, 8, 8, 12, 8, 4, 10], weights := [1, 0, 1, 0] }

-- Period 9, original row 8080, representative 6982.
def source66 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨106, by decide +kernel⟩

def target66 : Weights.Entry :=
  { word := [10, 8, 8, 12, 8, 4, 12], weights := [1, 0, 0, 1] }

def points66 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 8167, representative 7001.
def source67 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨125, by decide +kernel⟩

def target67 : Weights.Entry :=
  { word := [10, 8, 12, 10, 8, 4, 12], weights := [2, 1, 1, 2] }

def points67 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 8179, representative 6973.
def source68 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨97, by decide +kernel⟩

def target68 : Weights.Entry :=
  { word := [10, 10, 0, 1, 0, 8, 0], weights := [1, 1, 0, 0] }

def points68 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 8181, representative 6973.
def source69 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨97, by decide +kernel⟩

def target69 : Weights.Entry :=
  { word := [10, 10, 0, 2, 0, 8, 0], weights := [1, 1, 0, 0] }

def points69 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 5), (4, 6), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 8183, representative 6932.
def source70 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨56, by decide +kernel⟩

def target70 : Weights.Entry :=
  { word := [10, 10, 0, 2, 0, 8, 8], weights := [2, 1, 0, 1] }

def points70 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 8187, representative 6974.
def source71 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨98, by decide +kernel⟩

def target71 : Weights.Entry :=
  { word := [10, 10, 0, 9, 0, 8, 0], weights := [0, 1, 1, 0] }

def points71 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 8204, representative 6934.
def source72 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨58, by decide +kernel⟩

def target72 : Weights.Entry :=
  { word := [10, 10, 0, 10, 0, 0, 8], weights := [0, 1, 0, 1] }

def points72 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 8208, representative 6974.
def source73 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨98, by decide +kernel⟩

def target73 : Weights.Entry :=
  { word := [10, 10, 0, 10, 0, 8, 0], weights := [0, 1, 0, 1] }

def points73 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 5), (4, 6), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 8211, representative 6933.
def source74 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨57, by decide +kernel⟩

def target74 : Weights.Entry :=
  { word := [10, 10, 0, 10, 0, 8, 8], weights := [0, 1, 0, 1] }

def points74 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 8218, representative 6917.
def source75 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨41, by decide +kernel⟩

def target75 : Weights.Entry :=
  { word := [10, 10, 0, 12, 2, 0, 1], weights := [1, 1, 0, 1] }

def points75 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2)]

-- Period 9, original row 8221, representative 6948.
def source76 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨72, by decide +kernel⟩

def target76 : Weights.Entry :=
  { word := [10, 10, 0, 12, 2, 0, 8], weights := [1, 1, 0, 1] }

def points76 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2)]

-- Period 9, original row 8225, representative 6917.
def source77 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨41, by decide +kernel⟩

def target77 : Weights.Entry :=
  { word := [10, 10, 0, 12, 4, 4, 0], weights := [1, 1, 1, 0] }

def points77 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 5), (4, 6), (5, 4), (6, 3), (7, 1), (8, 2)]

-- Period 9, original row 8226, representative 6916.
def source78 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨40, by decide +kernel⟩

def target78 : Weights.Entry :=
  { word := [10, 10, 0, 12, 10, 0, 1], weights := [1, 1, 0, 1] }

def points78 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2)]

-- Period 9, original row 8229, representative 6947.
def source79 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨71, by decide +kernel⟩

def target79 : Weights.Entry :=
  { word := [10, 10, 0, 12, 10, 0, 8], weights := [1, 1, 0, 1] }

def points79 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2)]

-- Period 9, original row 8233, representative 6916.
def source80 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨40, by decide +kernel⟩

def target80 : Weights.Entry :=
  { word := [10, 10, 0, 12, 12, 4, 0], weights := [1, 1, 1, 0] }

def points80 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 5), (4, 6), (5, 4), (6, 3), (7, 1), (8, 2)]

-- Period 9, original row 8234, representative 6913.
def source81 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨37, by decide +kernel⟩

def target81 : Weights.Entry :=
  { word := [10, 10, 2, 8, 1, 0, 1], weights := [1, 1, 0, 1] }

def points81 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 8237, representative 6942.
def source82 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨66, by decide +kernel⟩

def target82 : Weights.Entry :=
  { word := [10, 10, 2, 8, 1, 0, 8], weights := [1, 1, 0, 1] }

def points82 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 8241, representative 6911.
def source83 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨35, by decide +kernel⟩

def target83 : Weights.Entry :=
  { word := [10, 10, 2, 8, 1, 8, 1], weights := [1, 1, 1, 1] }

def points83 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 8242, representative 6940.
def source84 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨64, by decide +kernel⟩

def target84 : Weights.Entry :=
  { word := [10, 10, 2, 8, 1, 8, 8], weights := [1, 1, 1, 1] }

def points84 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 8244, representative 6952.
def source85 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨76, by decide +kernel⟩

def target85 : Weights.Entry :=
  { word := [10, 10, 2, 8, 2, 8, 0], weights := [1, 0, 1, 0] }

def points85 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 8246, representative 6954.
def source86 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨78, by decide +kernel⟩

def target86 : Weights.Entry :=
  { word := [10, 10, 2, 8, 8, 8, 0], weights := [1, 0, 1, 0] }

def points86 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 8248, representative 6912.
def source87 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨36, by decide +kernel⟩

def target87 : Weights.Entry :=
  { word := [10, 10, 2, 8, 9, 0, 1], weights := [1, 1, 0, 1] }

def points87 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 8251, representative 6941.
def source88 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨65, by decide +kernel⟩

def target88 : Weights.Entry :=
  { word := [10, 10, 2, 8, 9, 0, 8], weights := [1, 1, 0, 1] }

def points88 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 8255, representative 6910.
def source89 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨34, by decide +kernel⟩

def target89 : Weights.Entry :=
  { word := [10, 10, 2, 8, 9, 8, 1], weights := [1, 1, 1, 1] }

def points89 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 8256, representative 6939.
def source90 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨63, by decide +kernel⟩

def target90 : Weights.Entry :=
  { word := [10, 10, 2, 8, 9, 8, 8], weights := [1, 1, 1, 1] }

def points90 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 8258, representative 6951.
def source91 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨75, by decide +kernel⟩

def target91 : Weights.Entry :=
  { word := [10, 10, 2, 8, 10, 8, 0], weights := [1, 0, 1, 0] }

def points91 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 8259, representative 6959.
def source92 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨83, by decide +kernel⟩

def target92 : Weights.Entry :=
  { word := [10, 10, 8, 1, 0, 8, 0], weights := [1, 1, 0, 0] }

def points92 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 8262, representative 6922.
def source93 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨46, by decide +kernel⟩

def target93 : Weights.Entry :=
  { word := [10, 10, 8, 2, 0, 1, 8], weights := [1, 0, 0, 1] }

def points93 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 8264, representative 6922.
def source94 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨46, by decide +kernel⟩

def target94 : Weights.Entry :=
  { word := [10, 10, 8, 2, 0, 2, 8], weights := [1, 0, 0, 1] }

def points94 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 8265, representative 6971.
def source95 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨95, by decide +kernel⟩

def target95 : Weights.Entry :=
  { word := [10, 10, 8, 2, 0, 8, 0], weights := [1, 0, 0, 1] }

def points95 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 8269, representative 6930.
def source96 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨54, by decide +kernel⟩

def target96 : Weights.Entry :=
  { word := [10, 10, 8, 2, 0, 8, 8], weights := [1, 0, 0, 1] }

def points96 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 8273, representative 6965.
def source97 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨89, by decide +kernel⟩

def target97 : Weights.Entry :=
  { word := [10, 10, 8, 2, 0, 9, 0], weights := [1, 0, 0, 1] }

def points97 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 8274, representative 6923.
def source98 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨47, by decide +kernel⟩

def target98 : Weights.Entry :=
  { word := [10, 10, 8, 2, 0, 9, 8], weights := [1, 0, 0, 1] }

def points98 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 8275, representative 6965.
def source99 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨89, by decide +kernel⟩

def target99 : Weights.Entry :=
  { word := [10, 10, 8, 2, 0, 10, 0], weights := [1, 0, 0, 1] }

def points99 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 8276, representative 6923.
def source100 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨47, by decide +kernel⟩

def target100 : Weights.Entry :=
  { word := [10, 10, 8, 2, 0, 10, 8], weights := [1, 0, 0, 1] }

def points100 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 8279, representative 6969.
def source101 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨93, by decide +kernel⟩

def target101 : Weights.Entry :=
  { word := [10, 10, 8, 2, 8, 2, 0], weights := [1, 0, 0, 1] }

def points101 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 8280, representative 6927.
def source102 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨51, by decide +kernel⟩

def target102 : Weights.Entry :=
  { word := [10, 10, 8, 2, 8, 2, 8], weights := [1, 0, 0, 1] }

def points102 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 8283, representative 6966.
def source103 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨90, by decide +kernel⟩

def target103 : Weights.Entry :=
  { word := [10, 10, 8, 2, 8, 10, 0], weights := [1, 0, 0, 1] }

def points103 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 8284, representative 6924.
def source104 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨48, by decide +kernel⟩

def target104 : Weights.Entry :=
  { word := [10, 10, 8, 2, 8, 10, 8], weights := [1, 0, 0, 1] }

def points104 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 8285, representative 6897.
def source105 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨22, by decide +kernel⟩

def target105 : Weights.Entry :=
  { word := [10, 10, 8, 4, 4, 4, 0], weights := [1, 0, 1, 0] }

def points105 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 8286, representative 6893.
def source106 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨18, by decide +kernel⟩

def target106 : Weights.Entry :=
  { word := [10, 10, 8, 4, 4, 12, 0], weights := [1, 0, 1, 0] }

def points106 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 8287, representative 6898.
def source107 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨23, by decide +kernel⟩

def target107 : Weights.Entry :=
  { word := [10, 10, 8, 4, 12, 4, 0], weights := [1, 0, 1, 0] }

def points107 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 8288, representative 6894.
def source108 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨19, by decide +kernel⟩

def target108 : Weights.Entry :=
  { word := [10, 10, 8, 4, 12, 12, 0], weights := [1, 0, 1, 0] }

def points108 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 8289, representative 6905.
def source109 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨30, by decide +kernel⟩

def target109 : Weights.Entry :=
  { word := [10, 10, 8, 8, 0, 4, 0], weights := [1, 0, 1, 0] }

def points109 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 8290, representative 6975.
def source110 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨99, by decide +kernel⟩

def target110 : Weights.Entry :=
  { word := [10, 10, 8, 8, 0, 8, 0], weights := [1, 0, 1, 0] }

def points110 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 8291, representative 6904.
def source111 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨29, by decide +kernel⟩

def target111 : Weights.Entry :=
  { word := [10, 10, 8, 8, 0, 12, 0], weights := [1, 0, 1, 0] }

def points111 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 8292, representative 6892.
def source112 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨17, by decide +kernel⟩

def target112 : Weights.Entry :=
  { word := [10, 10, 8, 8, 1, 4, 8], weights := [0, 1, 3, 0] }

def points112 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 8293, representative 6889.
def source113 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨14, by decide +kernel⟩

def target113 : Weights.Entry :=
  { word := [10, 10, 8, 8, 1, 12, 8], weights := [0, 1, 3, 0] }

def points113 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 8296, representative 6960.
def source114 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨84, by decide +kernel⟩

def target114 : Weights.Entry :=
  { word := [10, 10, 8, 9, 0, 8, 0], weights := [0, 1, 1, 0] }

def points114 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 8311, representative 6929.
def source115 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨53, by decide +kernel⟩

def target115 : Weights.Entry :=
  { word := [10, 10, 8, 10, 0, 1, 8], weights := [0, 1, 0, 1] }

def points115 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 8313, representative 6929.
def source116 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨53, by decide +kernel⟩

def target116 : Weights.Entry :=
  { word := [10, 10, 8, 10, 0, 2, 8], weights := [0, 1, 0, 1] }

def points116 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 8314, representative 6902.
def source117 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨27, by decide +kernel⟩

def target117 : Weights.Entry :=
  { word := [10, 10, 8, 10, 0, 6, 0], weights := [1, 0, 1, 0] }

def points117 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 8315, representative 6972.
def source118 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨96, by decide +kernel⟩

def target118 : Weights.Entry :=
  { word := [10, 10, 8, 10, 0, 8, 0], weights := [0, 1, 0, 1] }

def points118 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 8319, representative 6931.
def source119 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨55, by decide +kernel⟩

def target119 : Weights.Entry :=
  { word := [10, 10, 8, 10, 0, 8, 8], weights := [0, 1, 0, 1] }

def points119 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 8323, representative 6968.
def source120 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨92, by decide +kernel⟩

def target120 : Weights.Entry :=
  { word := [10, 10, 8, 10, 0, 9, 0], weights := [0, 1, 0, 1] }

def points120 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 8324, representative 6926.
def source121 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨50, by decide +kernel⟩

def target121 : Weights.Entry :=
  { word := [10, 10, 8, 10, 0, 9, 8], weights := [0, 1, 0, 1] }

def points121 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 8325, representative 6968.
def source122 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨92, by decide +kernel⟩

def target122 : Weights.Entry :=
  { word := [10, 10, 8, 10, 0, 10, 0], weights := [0, 1, 0, 1] }

def points122 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 8326, representative 6926.
def source123 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨50, by decide +kernel⟩

def target123 : Weights.Entry :=
  { word := [10, 10, 8, 10, 0, 10, 8], weights := [0, 1, 0, 1] }

def points123 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 8327, representative 6903.
def source124 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨28, by decide +kernel⟩

def target124 : Weights.Entry :=
  { word := [10, 10, 8, 10, 0, 12, 0], weights := [1, 0, 1, 0] }

def points124 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 8330, representative 6970.
def source125 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨94, by decide +kernel⟩

def target125 : Weights.Entry :=
  { word := [10, 10, 8, 10, 8, 2, 0], weights := [0, 1, 0, 1] }

def points125 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 8331, representative 6928.
def source126 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨52, by decide +kernel⟩

def target126 : Weights.Entry :=
  { word := [10, 10, 8, 10, 8, 2, 8], weights := [0, 1, 0, 1] }

def points126 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 8332, representative 6901.
def source127 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B001.Data.entryAt ⟨26, by decide +kernel⟩

def target127 : Weights.Entry :=
  { word := [10, 10, 8, 10, 8, 6, 0], weights := [1, 0, 1, 0] }

def points127 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

def period9Entries : List Weights.Entry := [target0, target1, target2, target3, target4, target5, target6, target7, target8, target9, target10, target11, target12, target13, target14, target15, target16, target17, target18, target19, target20, target21, target22, target23, target24, target25, target26, target27, target28, target29, target30, target31, target32, target33, target34, target35, target36, target37, target38, target39, target40, target41, target42, target43, target44, target45, target46, target47, target48, target49, target50, target51, target52, target53, target54, target55, target56, target57, target58, target59, target60, target61, target62, target63, target64, target65, target66, target67, target68, target69, target70, target71, target72, target73, target74, target75, target76, target77, target78, target79, target80, target81, target82, target83, target84, target85, target86, target87, target88, target89, target90, target91, target92, target93, target94, target95, target96, target97, target98, target99, target100, target101, target102, target103, target104, target105, target106, target107, target108, target109, target110, target111, target112, target113, target114, target115, target116, target117, target118, target119, target120, target121, target122, target123, target124, target125, target126, target127]

def period9Chunk : RowCoverage.Chunk where
  rows := [⟨6553, target0⟩, ⟨6554, target1⟩, ⟨6646, target2⟩, ⟨6682, target3⟩, ⟨6804, target4⟩, ⟨6805, target5⟩, ⟨6813, target6⟩, ⟨6839, target7⟩, ⟨6843, target8⟩, ⟨6950, target9⟩, ⟨6951, target10⟩, ⟨6959, target11⟩, ⟨7082, target12⟩, ⟨7118, target13⟩, ⟨7404, target14⟩, ⟨7408, target15⟩, ⟨7416, target16⟩, ⟨7417, target17⟩, ⟨7465, target18⟩, ⟨7489, target19⟩, ⟨7493, target20⟩, ⟨7497, target21⟩, ⟨7507, target22⟩, ⟨7508, target23⟩, ⟨7519, target24⟩, ⟨7587, target25⟩, ⟨7619, target26⟩, ⟨7620, target27⟩, ⟨7626, target28⟩, ⟨7628, target29⟩, ⟨7630, target30⟩, ⟨7636, target31⟩, ⟨7647, target32⟩, ⟨7648, target33⟩, ⟨7661, target34⟩, ⟨7662, target35⟩, ⟨7678, target36⟩, ⟨7679, target37⟩, ⟨7685, target38⟩, ⟨7689, target39⟩, ⟨7728, target40⟩, ⟨7729, target41⟩, ⟨7736, target42⟩, ⟨7742, target43⟩, ⟨7752, target44⟩, ⟨7753, target45⟩, ⟨7756, target46⟩, ⟨7768, target47⟩, ⟨7769, target48⟩, ⟨7773, target49⟩, ⟨7774, target50⟩, ⟨7787, target51⟩, ⟨7788, target52⟩, ⟨7801, target53⟩, ⟨7802, target54⟩, ⟨7840, target55⟩, ⟨7841, target56⟩, ⟨7866, target57⟩, ⟨7867, target58⟩, ⟨7891, target59⟩, ⟨7892, target60⟩, ⟨8006, target61⟩, ⟨8007, target62⟩, ⟨8050, target63⟩, ⟨8051, target64⟩, ⟨8079, target65⟩, ⟨8080, target66⟩, ⟨8167, target67⟩, ⟨8179, target68⟩, ⟨8181, target69⟩, ⟨8183, target70⟩, ⟨8187, target71⟩, ⟨8204, target72⟩, ⟨8208, target73⟩, ⟨8211, target74⟩, ⟨8218, target75⟩, ⟨8221, target76⟩, ⟨8225, target77⟩, ⟨8226, target78⟩, ⟨8229, target79⟩, ⟨8233, target80⟩, ⟨8234, target81⟩, ⟨8237, target82⟩, ⟨8241, target83⟩, ⟨8242, target84⟩, ⟨8244, target85⟩, ⟨8246, target86⟩, ⟨8248, target87⟩, ⟨8251, target88⟩, ⟨8255, target89⟩, ⟨8256, target90⟩, ⟨8258, target91⟩, ⟨8259, target92⟩, ⟨8262, target93⟩, ⟨8264, target94⟩, ⟨8265, target95⟩, ⟨8269, target96⟩, ⟨8273, target97⟩, ⟨8274, target98⟩, ⟨8275, target99⟩, ⟨8276, target100⟩, ⟨8279, target101⟩, ⟨8280, target102⟩, ⟨8283, target103⟩, ⟨8284, target104⟩, ⟨8285, target105⟩, ⟨8286, target106⟩, ⟨8287, target107⟩, ⟨8288, target108⟩, ⟨8289, target109⟩, ⟨8290, target110⟩, ⟨8291, target111⟩, ⟨8292, target112⟩, ⟨8293, target113⟩, ⟨8296, target114⟩, ⟨8311, target115⟩, ⟨8313, target116⟩, ⟨8314, target117⟩, ⟨8315, target118⟩, ⟨8319, target119⟩, ⟨8323, target120⟩, ⟨8324, target121⟩, ⟨8325, target122⟩, ⟨8326, target123⟩, ⟨8327, target124⟩, ⟨8330, target125⟩, ⟨8331, target126⟩, ⟨8332, target127⟩]
  indexMask := 2752746645834547855788514143565503032302238640939123532955279860470433491076433611429817541631693414971253781756183566667605867823402618243178398424028892226854256725538387986128155190146707330751464150944390790078442482174470995144417725355649341744377751649819238503218860845713191203372221647445870236553832323778338425090456435924934016264505934876789594248275042753599871082713659930306477329861627545130785928104837354972419324876791045062423637807183906983513050982378460057316028715380519648079428657643570881381001248684703884499416453290819686934713798548914362593013896755082864225052196881531283116042121520897380792268732377954154852169750645155091994197455558553919090902465224169868591502497356003963471208205739534563288263783139527967003166577486890826388663876698256113904703240373384346807767591682319938728280947955648140649782707444867593235809975718100360792754740361185935588709237363730302218044053278214845950828518754432200473079577370932447218746161638593293444021204049304439483928773690848716240299634344202208673679836008090089222351642079836746946595752249236268148370374460660570175340855074393231992309359833233058385496003872066305630960696501444924320843048335993400131543212703152725790731854529236663415137619948894723237848347595028995757097499071669311345028071604754132573798412678226339782069389561726444485915692692467687762702978753150549338634925964810840037279203084528229206870959335307241116426589791000121523259771876730744814818141046189791615877879673652782862619683677901694431463674301128526612153679971060081758629039713440437779628325125681626494833130526001636693783317069268080820594846018172738995318152307074897090074122889886003332066431913271091400618108579498902746331269201537704966044769749444784663699923872654831538448285882463896298141293866232290041919635077213897385804484351882007300070005861041305574918732582327246846369205831680566543113745753631641297146275874541262659672941166398777400191000696684596794365420842544277729294435601362367432675072075840629454710841864743367287718193848715266778945277278192840601244989714142180129400590419909746792242327323134519839474338380898236921576563019540238782732921753492495769597437384245091233712948476821433854510738758122425534152843051491823168480165658079380808817812501649850156728675566216960119954037532935388408034376195180793873784828633325347023506391819222982193428194495414101211175164898739014883743518918254435335643017380067184783236806272354748301426938969255011552866598912
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

end FranklSmallCyclic.TransportBatches.G054.B001.Data
