module

public import Conjectures.FranklSmallCyclicRowCoverage
public import Conjectures.FranklSmallCyclicCanonicalWords
public import Conjectures.FranklSmallCyclicOrbit9Block007Data

/-! 128 literal targets sharing one source proof block.
Original words and row indices are retained; weights may be transported.
-/
@[expose] public section

namespace FranklSmallCyclic.TransportBatches.G060.B001.Data

-- Period 9, original row 5774, representative 7688.
def source0 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B007.Data.entryAt ⟨41, by decide +kernel⟩

def target0 : Weights.Entry :=
  { word := [8, 8, 10, 10, 2, 8, 12], weights := [1, 0, 0, 1] }

-- Period 9, original row 5780, representative 7677.
def source1 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B007.Data.entryAt ⟨30, by decide +kernel⟩

def target1 : Weights.Entry :=
  { word := [8, 8, 10, 10, 10, 8, 10], weights := [0, 1, 1, 0] }

-- Period 9, original row 5781, representative 7685.
def source2 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B007.Data.entryAt ⟨38, by decide +kernel⟩

def target2 : Weights.Entry :=
  { word := [8, 8, 10, 10, 10, 8, 12], weights := [1, 0, 0, 1] }

-- Period 9, original row 6342, representative 7718.
def source3 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B007.Data.entryAt ⟨71, by decide +kernel⟩

def target3 : Weights.Entry :=
  { word := [8, 12, 0, 4, 2, 8, 10], weights := [1, 0, 1, 0] }

def points3 : List (ℕ × ℕ) := [(0, 0), (1, 2), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 6343, representative 7726.
def source4 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B007.Data.entryAt ⟨79, by decide +kernel⟩

def target4 : Weights.Entry :=
  { word := [8, 12, 0, 4, 2, 8, 12], weights := [1, 0, 0, 1] }

def points4 : List (ℕ × ℕ) := [(0, 0), (1, 2), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 6364, representative 7719.
def source5 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B007.Data.entryAt ⟨72, by decide +kernel⟩

def target5 : Weights.Entry :=
  { word := [8, 12, 0, 4, 10, 8, 10], weights := [1, 0, 1, 0] }

def points5 : List (ℕ × ℕ) := [(0, 0), (1, 2), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 6365, representative 7727.
def source6 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B007.Data.entryAt ⟨80, by decide +kernel⟩

def target6 : Weights.Entry :=
  { word := [8, 12, 0, 4, 10, 8, 12], weights := [1, 0, 0, 1] }

def points6 : List (ℕ × ℕ) := [(0, 0), (1, 2), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 6378, representative 7725.
def source7 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B007.Data.entryAt ⟨78, by decide +kernel⟩

def target7 : Weights.Entry :=
  { word := [8, 12, 0, 12, 2, 8, 10], weights := [1, 0, 1, 0] }

def points7 : List (ℕ × ℕ) := [(0, 0), (1, 2), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 6379, representative 7733.
def source8 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B007.Data.entryAt ⟨86, by decide +kernel⟩

def target8 : Weights.Entry :=
  { word := [8, 12, 0, 12, 2, 8, 12], weights := [1, 0, 1, 0] }

def points8 : List (ℕ × ℕ) := [(0, 0), (1, 2), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 6400, representative 7722.
def source9 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B007.Data.entryAt ⟨75, by decide +kernel⟩

def target9 : Weights.Entry :=
  { word := [8, 12, 0, 12, 10, 8, 10], weights := [1, 0, 1, 0] }

def points9 : List (ℕ × ℕ) := [(0, 0), (1, 2), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 6401, representative 7730.
def source10 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B007.Data.entryAt ⟨83, by decide +kernel⟩

def target10 : Weights.Entry :=
  { word := [8, 12, 0, 12, 10, 8, 12], weights := [1, 0, 1, 0] }

def points10 : List (ℕ × ℕ) := [(0, 0), (1, 2), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 6417, representative 7667.
def source11 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B007.Data.entryAt ⟨20, by decide +kernel⟩

def target11 : Weights.Entry :=
  { word := [8, 12, 2, 8, 2, 8, 10], weights := [0, 1, 1, 0] }

-- Period 9, original row 6425, representative 7665.
def source12 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B007.Data.entryAt ⟨18, by decide +kernel⟩

def target12 : Weights.Entry :=
  { word := [8, 12, 2, 8, 10, 8, 10], weights := [0, 1, 1, 0] }

-- Period 9, original row 6438, representative 7734.
def source13 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B007.Data.entryAt ⟨87, by decide +kernel⟩

def target13 : Weights.Entry :=
  { word := [8, 12, 4, 4, 0, 8, 10], weights := [1, 0, 0, 1] }

-- Period 9, original row 6439, representative 7734.
def source14 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B007.Data.entryAt ⟨87, by decide +kernel⟩

def target14 : Weights.Entry :=
  { word := [8, 12, 4, 4, 0, 8, 12], weights := [1, 0, 0, 1] }

def points14 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 8), (8, 7)]

-- Period 9, original row 6452, representative 7735.
def source15 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B007.Data.entryAt ⟨88, by decide +kernel⟩

def target15 : Weights.Entry :=
  { word := [8, 12, 4, 4, 8, 8, 10], weights := [1, 0, 1, 0] }

-- Period 9, original row 6453, representative 7739.
def source16 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B007.Data.entryAt ⟨92, by decide +kernel⟩

def target16 : Weights.Entry :=
  { word := [8, 12, 4, 4, 8, 8, 12], weights := [1, 0, 0, 1] }

-- Period 9, original row 6466, representative 7745.
def source17 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B007.Data.entryAt ⟨98, by decide +kernel⟩

def target17 : Weights.Entry :=
  { word := [8, 12, 4, 12, 0, 8, 10], weights := [1, 0, 1, 0] }

-- Period 9, original row 6467, representative 7745.
def source18 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B007.Data.entryAt ⟨98, by decide +kernel⟩

def target18 : Weights.Entry :=
  { word := [8, 12, 4, 12, 0, 8, 12], weights := [1, 0, 1, 0] }

def points18 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 8), (8, 7)]

-- Period 9, original row 6480, representative 7738.
def source19 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B007.Data.entryAt ⟨91, by decide +kernel⟩

def target19 : Weights.Entry :=
  { word := [8, 12, 4, 12, 8, 8, 10], weights := [1, 0, 1, 0] }

-- Period 9, original row 6481, representative 7742.
def source20 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B007.Data.entryAt ⟨95, by decide +kernel⟩

def target20 : Weights.Entry :=
  { word := [8, 12, 4, 12, 8, 8, 12], weights := [1, 0, 1, 0] }

-- Period 9, original row 6486, representative 7668.
def source21 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B007.Data.entryAt ⟨21, by decide +kernel⟩

def target21 : Weights.Entry :=
  { word := [8, 12, 6, 8, 8, 8, 10], weights := [0, 1, 1, 0] }

-- Period 9, original row 6497, representative 7723.
def source22 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B007.Data.entryAt ⟨76, by decide +kernel⟩

def target22 : Weights.Entry :=
  { word := [8, 12, 8, 4, 2, 8, 10], weights := [1, 0, 1, 0] }

-- Period 9, original row 6498, representative 7731.
def source23 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B007.Data.entryAt ⟨84, by decide +kernel⟩

def target23 : Weights.Entry :=
  { word := [8, 12, 8, 4, 2, 8, 12], weights := [1, 0, 0, 1] }

-- Period 9, original row 6523, representative 7720.
def source24 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B007.Data.entryAt ⟨73, by decide +kernel⟩

def target24 : Weights.Entry :=
  { word := [8, 12, 8, 4, 10, 8, 10], weights := [1, 0, 1, 0] }

-- Period 9, original row 6524, representative 7728.
def source25 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B007.Data.entryAt ⟨81, by decide +kernel⟩

def target25 : Weights.Entry :=
  { word := [8, 12, 8, 4, 10, 8, 12], weights := [1, 0, 0, 1] }

-- Period 9, original row 6539, representative 7724.
def source26 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B007.Data.entryAt ⟨77, by decide +kernel⟩

def target26 : Weights.Entry :=
  { word := [8, 12, 8, 12, 2, 8, 10], weights := [1, 0, 1, 0] }

-- Period 9, original row 6540, representative 7732.
def source27 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B007.Data.entryAt ⟨85, by decide +kernel⟩

def target27 : Weights.Entry :=
  { word := [8, 12, 8, 12, 2, 8, 12], weights := [1, 0, 1, 0] }

-- Period 9, original row 6565, representative 7721.
def source28 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B007.Data.entryAt ⟨74, by decide +kernel⟩

def target28 : Weights.Entry :=
  { word := [8, 12, 8, 12, 10, 8, 10], weights := [1, 0, 1, 0] }

-- Period 9, original row 6566, representative 7729.
def source29 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B007.Data.entryAt ⟨82, by decide +kernel⟩

def target29 : Weights.Entry :=
  { word := [8, 12, 8, 12, 10, 8, 12], weights := [1, 0, 1, 0] }

-- Period 9, original row 6579, representative 7666.
def source30 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B007.Data.entryAt ⟨19, by decide +kernel⟩

def target30 : Weights.Entry :=
  { word := [8, 12, 10, 8, 2, 8, 10], weights := [0, 1, 1, 0] }

-- Period 9, original row 6582, representative 7664.
def source31 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B007.Data.entryAt ⟨17, by decide +kernel⟩

def target31 : Weights.Entry :=
  { word := [8, 12, 10, 8, 10, 8, 10], weights := [0, 1, 1, 0] }

-- Period 9, original row 6588, representative 7743.
def source32 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B007.Data.entryAt ⟨96, by decide +kernel⟩

def target32 : Weights.Entry :=
  { word := [8, 12, 12, 4, 0, 8, 10], weights := [1, 0, 0, 1] }

-- Period 9, original row 6589, representative 7743.
def source33 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B007.Data.entryAt ⟨96, by decide +kernel⟩

def target33 : Weights.Entry :=
  { word := [8, 12, 12, 4, 0, 8, 12], weights := [1, 0, 0, 1] }

def points33 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 8), (8, 7)]

-- Period 9, original row 6602, representative 7736.
def source34 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B007.Data.entryAt ⟨89, by decide +kernel⟩

def target34 : Weights.Entry :=
  { word := [8, 12, 12, 4, 8, 8, 10], weights := [1, 0, 1, 0] }

-- Period 9, original row 6603, representative 7740.
def source35 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B007.Data.entryAt ⟨93, by decide +kernel⟩

def target35 : Weights.Entry :=
  { word := [8, 12, 12, 4, 8, 8, 12], weights := [1, 0, 0, 1] }

-- Period 9, original row 6609, representative 7744.
def source36 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B007.Data.entryAt ⟨97, by decide +kernel⟩

def target36 : Weights.Entry :=
  { word := [8, 12, 12, 12, 0, 8, 10], weights := [1, 0, 1, 0] }

-- Period 9, original row 6610, representative 7744.
def source37 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B007.Data.entryAt ⟨97, by decide +kernel⟩

def target37 : Weights.Entry :=
  { word := [8, 12, 12, 12, 0, 8, 12], weights := [1, 0, 1, 0] }

def points37 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 8), (8, 7)]

-- Period 9, original row 6623, representative 7737.
def source38 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B007.Data.entryAt ⟨90, by decide +kernel⟩

def target38 : Weights.Entry :=
  { word := [8, 12, 12, 12, 8, 8, 10], weights := [1, 0, 1, 0] }

-- Period 9, original row 6624, representative 7741.
def source39 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B007.Data.entryAt ⟨94, by decide +kernel⟩

def target39 : Weights.Entry :=
  { word := [8, 12, 12, 12, 8, 8, 12], weights := [1, 0, 1, 0] }

-- Period 9, original row 6635, representative 7746.
def source40 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B007.Data.entryAt ⟨99, by decide +kernel⟩

def target40 : Weights.Entry :=
  { word := [9, 0, 1, 4, 2, 8, 10], weights := [1, 0, 1, 0] }

def points40 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 6636, representative 7754.
def source41 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B007.Data.entryAt ⟨107, by decide +kernel⟩

def target41 : Weights.Entry :=
  { word := [9, 0, 1, 4, 2, 8, 12], weights := [1, 0, 0, 1] }

def points41 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 6657, representative 7747.
def source42 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B007.Data.entryAt ⟨100, by decide +kernel⟩

def target42 : Weights.Entry :=
  { word := [9, 0, 1, 4, 10, 8, 10], weights := [1, 0, 1, 0] }

def points42 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 6658, representative 7755.
def source43 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B007.Data.entryAt ⟨108, by decide +kernel⟩

def target43 : Weights.Entry :=
  { word := [9, 0, 1, 4, 10, 8, 12], weights := [1, 0, 0, 1] }

def points43 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 6671, representative 7753.
def source44 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B007.Data.entryAt ⟨106, by decide +kernel⟩

def target44 : Weights.Entry :=
  { word := [9, 0, 1, 12, 2, 8, 10], weights := [1, 0, 1, 0] }

def points44 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 6672, representative 7761.
def source45 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B007.Data.entryAt ⟨114, by decide +kernel⟩

def target45 : Weights.Entry :=
  { word := [9, 0, 1, 12, 2, 8, 12], weights := [1, 0, 1, 0] }

def points45 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 6693, representative 7750.
def source46 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B007.Data.entryAt ⟨103, by decide +kernel⟩

def target46 : Weights.Entry :=
  { word := [9, 0, 1, 12, 10, 8, 10], weights := [1, 0, 1, 0] }

def points46 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 6694, representative 7758.
def source47 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B007.Data.entryAt ⟨111, by decide +kernel⟩

def target47 : Weights.Entry :=
  { word := [9, 0, 1, 12, 10, 8, 12], weights := [1, 0, 1, 0] }

def points47 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 6710, representative 7696.
def source48 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B007.Data.entryAt ⟨49, by decide +kernel⟩

def target48 : Weights.Entry :=
  { word := [9, 0, 2, 2, 2, 8, 10], weights := [1, 0, 0, 1] }

def points48 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 6711, representative 7704.
def source49 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B007.Data.entryAt ⟨57, by decide +kernel⟩

def target49 : Weights.Entry :=
  { word := [9, 0, 2, 2, 2, 8, 12], weights := [1, 0, 0, 1] }

def points49 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 6725, representative 7697.
def source50 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B007.Data.entryAt ⟨50, by decide +kernel⟩

def target50 : Weights.Entry :=
  { word := [9, 0, 2, 2, 10, 8, 10], weights := [1, 0, 0, 1] }

def points50 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 6726, representative 7705.
def source51 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B007.Data.entryAt ⟨58, by decide +kernel⟩

def target51 : Weights.Entry :=
  { word := [9, 0, 2, 2, 10, 8, 12], weights := [1, 0, 0, 1] }

def points51 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 6739, representative 7703.
def source52 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B007.Data.entryAt ⟨56, by decide +kernel⟩

def target52 : Weights.Entry :=
  { word := [9, 0, 2, 10, 2, 8, 10], weights := [1, 0, 0, 1] }

def points52 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 6740, representative 7711.
def source53 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B007.Data.entryAt ⟨64, by decide +kernel⟩

def target53 : Weights.Entry :=
  { word := [9, 0, 2, 10, 2, 8, 12], weights := [1, 0, 0, 1] }

def points53 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 6753, representative 7700.
def source54 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B007.Data.entryAt ⟨53, by decide +kernel⟩

def target54 : Weights.Entry :=
  { word := [9, 0, 2, 10, 10, 8, 10], weights := [1, 0, 0, 1] }

def points54 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 6754, representative 7708.
def source55 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B007.Data.entryAt ⟨61, by decide +kernel⟩

def target55 : Weights.Entry :=
  { word := [9, 0, 2, 10, 10, 8, 12], weights := [1, 0, 0, 1] }

def points55 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 6874, representative 7701.
def source56 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B007.Data.entryAt ⟨54, by decide +kernel⟩

def target56 : Weights.Entry :=
  { word := [9, 0, 10, 2, 2, 8, 10], weights := [1, 0, 0, 1] }

def points56 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 6875, representative 7709.
def source57 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B007.Data.entryAt ⟨62, by decide +kernel⟩

def target57 : Weights.Entry :=
  { word := [9, 0, 10, 2, 2, 8, 12], weights := [1, 0, 0, 1] }

def points57 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 6882, representative 7698.
def source58 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B007.Data.entryAt ⟨51, by decide +kernel⟩

def target58 : Weights.Entry :=
  { word := [9, 0, 10, 2, 10, 8, 10], weights := [1, 0, 0, 1] }

def points58 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 6883, representative 7706.
def source59 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B007.Data.entryAt ⟨59, by decide +kernel⟩

def target59 : Weights.Entry :=
  { word := [9, 0, 10, 2, 10, 8, 12], weights := [1, 0, 0, 1] }

def points59 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 6889, representative 7702.
def source60 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B007.Data.entryAt ⟨55, by decide +kernel⟩

def target60 : Weights.Entry :=
  { word := [9, 0, 10, 10, 2, 8, 10], weights := [0, 1, 1, 0] }

def points60 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 6890, representative 7710.
def source61 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B007.Data.entryAt ⟨63, by decide +kernel⟩

def target61 : Weights.Entry :=
  { word := [9, 0, 10, 10, 2, 8, 12], weights := [1, 0, 0, 1] }

def points61 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 6896, representative 7699.
def source62 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B007.Data.entryAt ⟨52, by decide +kernel⟩

def target62 : Weights.Entry :=
  { word := [9, 0, 10, 10, 10, 8, 10], weights := [0, 1, 1, 0] }

def points62 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 6897, representative 7707.
def source63 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B007.Data.entryAt ⟨60, by decide +kernel⟩

def target63 : Weights.Entry :=
  { word := [9, 0, 10, 10, 10, 8, 12], weights := [1, 0, 0, 1] }

def points63 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 6975, representative 7762.
def source64 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B007.Data.entryAt ⟨115, by decide +kernel⟩

def target64 : Weights.Entry :=
  { word := [9, 4, 4, 4, 0, 8, 10], weights := [1, 0, 0, 1] }

def points64 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 6976, representative 7762.
def source65 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B007.Data.entryAt ⟨115, by decide +kernel⟩

def target65 : Weights.Entry :=
  { word := [9, 4, 4, 4, 0, 8, 12], weights := [1, 0, 0, 1] }

def points65 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 8), (8, 7)]

-- Period 9, original row 6989, representative 7763.
def source66 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B007.Data.entryAt ⟨116, by decide +kernel⟩

def target66 : Weights.Entry :=
  { word := [9, 4, 4, 4, 8, 8, 10], weights := [1, 0, 1, 0] }

def points66 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 6990, representative 7767.
def source67 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B007.Data.entryAt ⟨120, by decide +kernel⟩

def target67 : Weights.Entry :=
  { word := [9, 4, 4, 4, 8, 8, 12], weights := [1, 0, 0, 1] }

def points67 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 7003, representative 7773.
def source68 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B007.Data.entryAt ⟨126, by decide +kernel⟩

def target68 : Weights.Entry :=
  { word := [9, 4, 4, 12, 0, 8, 10], weights := [1, 0, 1, 0] }

def points68 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 7004, representative 7773.
def source69 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B007.Data.entryAt ⟨126, by decide +kernel⟩

def target69 : Weights.Entry :=
  { word := [9, 4, 4, 12, 0, 8, 12], weights := [1, 0, 1, 0] }

def points69 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 8), (8, 7)]

-- Period 9, original row 7017, representative 7766.
def source70 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B007.Data.entryAt ⟨119, by decide +kernel⟩

def target70 : Weights.Entry :=
  { word := [9, 4, 4, 12, 8, 8, 10], weights := [1, 0, 1, 0] }

def points70 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 7018, representative 7770.
def source71 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B007.Data.entryAt ⟨123, by decide +kernel⟩

def target71 : Weights.Entry :=
  { word := [9, 4, 4, 12, 8, 8, 12], weights := [1, 0, 1, 0] }

def points71 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 7024, representative 7771.
def source72 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B007.Data.entryAt ⟨124, by decide +kernel⟩

def target72 : Weights.Entry :=
  { word := [9, 4, 12, 4, 0, 8, 10], weights := [1, 0, 0, 1] }

def points72 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 7025, representative 7771.
def source73 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B007.Data.entryAt ⟨124, by decide +kernel⟩

def target73 : Weights.Entry :=
  { word := [9, 4, 12, 4, 0, 8, 12], weights := [1, 0, 0, 1] }

def points73 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 8), (8, 7)]

-- Period 9, original row 7038, representative 7764.
def source74 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B007.Data.entryAt ⟨117, by decide +kernel⟩

def target74 : Weights.Entry :=
  { word := [9, 4, 12, 4, 8, 8, 10], weights := [1, 0, 1, 0] }

def points74 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 7039, representative 7768.
def source75 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B007.Data.entryAt ⟨121, by decide +kernel⟩

def target75 : Weights.Entry :=
  { word := [9, 4, 12, 4, 8, 8, 12], weights := [1, 0, 0, 1] }

def points75 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 7045, representative 7772.
def source76 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B007.Data.entryAt ⟨125, by decide +kernel⟩

def target76 : Weights.Entry :=
  { word := [9, 4, 12, 12, 0, 8, 10], weights := [1, 0, 1, 0] }

def points76 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 7046, representative 7772.
def source77 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B007.Data.entryAt ⟨125, by decide +kernel⟩

def target77 : Weights.Entry :=
  { word := [9, 4, 12, 12, 0, 8, 12], weights := [1, 0, 1, 0] }

def points77 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 8), (8, 7)]

-- Period 9, original row 7059, representative 7765.
def source78 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B007.Data.entryAt ⟨118, by decide +kernel⟩

def target78 : Weights.Entry :=
  { word := [9, 4, 12, 12, 8, 8, 10], weights := [1, 0, 1, 0] }

def points78 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 7060, representative 7769.
def source79 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B007.Data.entryAt ⟨122, by decide +kernel⟩

def target79 : Weights.Entry :=
  { word := [9, 4, 12, 12, 8, 8, 12], weights := [1, 0, 1, 0] }

def points79 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 7071, representative 7718.
def source80 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B007.Data.entryAt ⟨71, by decide +kernel⟩

def target80 : Weights.Entry :=
  { word := [9, 8, 1, 4, 2, 8, 10], weights := [1, 0, 1, 0] }

def points80 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 7072, representative 7726.
def source81 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B007.Data.entryAt ⟨79, by decide +kernel⟩

def target81 : Weights.Entry :=
  { word := [9, 8, 1, 4, 2, 8, 12], weights := [1, 0, 0, 1] }

def points81 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 7093, representative 7719.
def source82 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B007.Data.entryAt ⟨72, by decide +kernel⟩

def target82 : Weights.Entry :=
  { word := [9, 8, 1, 4, 10, 8, 10], weights := [1, 0, 1, 0] }

def points82 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 7094, representative 7727.
def source83 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B007.Data.entryAt ⟨80, by decide +kernel⟩

def target83 : Weights.Entry :=
  { word := [9, 8, 1, 4, 10, 8, 12], weights := [1, 0, 0, 1] }

def points83 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 7107, representative 7725.
def source84 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B007.Data.entryAt ⟨78, by decide +kernel⟩

def target84 : Weights.Entry :=
  { word := [9, 8, 1, 12, 2, 8, 10], weights := [1, 0, 1, 0] }

def points84 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 7108, representative 7733.
def source85 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B007.Data.entryAt ⟨86, by decide +kernel⟩

def target85 : Weights.Entry :=
  { word := [9, 8, 1, 12, 2, 8, 12], weights := [1, 0, 1, 0] }

def points85 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 7129, representative 7722.
def source86 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B007.Data.entryAt ⟨75, by decide +kernel⟩

def target86 : Weights.Entry :=
  { word := [9, 8, 1, 12, 10, 8, 10], weights := [1, 0, 1, 0] }

def points86 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 7130, representative 7730.
def source87 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B007.Data.entryAt ⟨83, by decide +kernel⟩

def target87 : Weights.Entry :=
  { word := [9, 8, 1, 12, 10, 8, 12], weights := [1, 0, 1, 0] }

def points87 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 7146, representative 7674.
def source88 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B007.Data.entryAt ⟨27, by decide +kernel⟩

def target88 : Weights.Entry :=
  { word := [9, 8, 2, 2, 2, 8, 10], weights := [1, 0, 0, 1] }

def points88 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 7147, representative 7682.
def source89 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B007.Data.entryAt ⟨35, by decide +kernel⟩

def target89 : Weights.Entry :=
  { word := [9, 8, 2, 2, 2, 8, 12], weights := [1, 0, 0, 1] }

def points89 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 7161, representative 7675.
def source90 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B007.Data.entryAt ⟨28, by decide +kernel⟩

def target90 : Weights.Entry :=
  { word := [9, 8, 2, 2, 10, 8, 10], weights := [1, 0, 0, 1] }

def points90 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 7162, representative 7683.
def source91 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B007.Data.entryAt ⟨36, by decide +kernel⟩

def target91 : Weights.Entry :=
  { word := [9, 8, 2, 2, 10, 8, 12], weights := [1, 0, 0, 1] }

def points91 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 7175, representative 7681.
def source92 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B007.Data.entryAt ⟨34, by decide +kernel⟩

def target92 : Weights.Entry :=
  { word := [9, 8, 2, 10, 2, 8, 10], weights := [0, 1, 1, 0] }

def points92 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 7176, representative 7689.
def source93 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B007.Data.entryAt ⟨42, by decide +kernel⟩

def target93 : Weights.Entry :=
  { word := [9, 8, 2, 10, 2, 8, 12], weights := [1, 0, 0, 1] }

def points93 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 7189, representative 7678.
def source94 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B007.Data.entryAt ⟨31, by decide +kernel⟩

def target94 : Weights.Entry :=
  { word := [9, 8, 2, 10, 10, 8, 10], weights := [0, 1, 1, 0] }

def points94 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 7190, representative 7686.
def source95 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B007.Data.entryAt ⟨39, by decide +kernel⟩

def target95 : Weights.Entry :=
  { word := [9, 8, 2, 10, 10, 8, 12], weights := [1, 0, 0, 1] }

def points95 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 7258, representative 7679.
def source96 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B007.Data.entryAt ⟨32, by decide +kernel⟩

def target96 : Weights.Entry :=
  { word := [9, 8, 10, 2, 2, 8, 10], weights := [1, 0, 0, 1] }

def points96 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 7259, representative 7687.
def source97 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B007.Data.entryAt ⟨40, by decide +kernel⟩

def target97 : Weights.Entry :=
  { word := [9, 8, 10, 2, 2, 8, 12], weights := [1, 0, 0, 1] }

def points97 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 7266, representative 7676.
def source98 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B007.Data.entryAt ⟨29, by decide +kernel⟩

def target98 : Weights.Entry :=
  { word := [9, 8, 10, 2, 10, 8, 10], weights := [1, 0, 0, 1] }

def points98 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 7267, representative 7684.
def source99 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B007.Data.entryAt ⟨37, by decide +kernel⟩

def target99 : Weights.Entry :=
  { word := [9, 8, 10, 2, 10, 8, 12], weights := [1, 0, 0, 1] }

def points99 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 7273, representative 7680.
def source100 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B007.Data.entryAt ⟨33, by decide +kernel⟩

def target100 : Weights.Entry :=
  { word := [9, 8, 10, 10, 2, 8, 10], weights := [0, 1, 1, 0] }

def points100 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 7274, representative 7688.
def source101 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B007.Data.entryAt ⟨41, by decide +kernel⟩

def target101 : Weights.Entry :=
  { word := [9, 8, 10, 10, 2, 8, 12], weights := [1, 0, 0, 1] }

def points101 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 7280, representative 7677.
def source102 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B007.Data.entryAt ⟨30, by decide +kernel⟩

def target102 : Weights.Entry :=
  { word := [9, 8, 10, 10, 10, 8, 10], weights := [0, 1, 1, 0] }

def points102 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 7281, representative 7685.
def source103 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B007.Data.entryAt ⟨38, by decide +kernel⟩

def target103 : Weights.Entry :=
  { word := [9, 8, 10, 10, 10, 8, 12], weights := [1, 0, 0, 1] }

def points103 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 7311, representative 7734.
def source104 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B007.Data.entryAt ⟨87, by decide +kernel⟩

def target104 : Weights.Entry :=
  { word := [9, 12, 4, 4, 0, 8, 10], weights := [1, 0, 0, 1] }

def points104 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 7312, representative 7734.
def source105 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B007.Data.entryAt ⟨87, by decide +kernel⟩

def target105 : Weights.Entry :=
  { word := [9, 12, 4, 4, 0, 8, 12], weights := [1, 0, 0, 1] }

def points105 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 8), (8, 7)]

-- Period 9, original row 7325, representative 7735.
def source106 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B007.Data.entryAt ⟨88, by decide +kernel⟩

def target106 : Weights.Entry :=
  { word := [9, 12, 4, 4, 8, 8, 10], weights := [1, 0, 1, 0] }

def points106 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 7326, representative 7739.
def source107 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B007.Data.entryAt ⟨92, by decide +kernel⟩

def target107 : Weights.Entry :=
  { word := [9, 12, 4, 4, 8, 8, 12], weights := [1, 0, 0, 1] }

def points107 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 7339, representative 7745.
def source108 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B007.Data.entryAt ⟨98, by decide +kernel⟩

def target108 : Weights.Entry :=
  { word := [9, 12, 4, 12, 0, 8, 10], weights := [1, 0, 1, 0] }

def points108 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 7340, representative 7745.
def source109 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B007.Data.entryAt ⟨98, by decide +kernel⟩

def target109 : Weights.Entry :=
  { word := [9, 12, 4, 12, 0, 8, 12], weights := [1, 0, 1, 0] }

def points109 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 8), (8, 7)]

-- Period 9, original row 7353, representative 7738.
def source110 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B007.Data.entryAt ⟨91, by decide +kernel⟩

def target110 : Weights.Entry :=
  { word := [9, 12, 4, 12, 8, 8, 10], weights := [1, 0, 1, 0] }

def points110 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 7354, representative 7742.
def source111 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B007.Data.entryAt ⟨95, by decide +kernel⟩

def target111 : Weights.Entry :=
  { word := [9, 12, 4, 12, 8, 8, 12], weights := [1, 0, 1, 0] }

def points111 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 7360, representative 7743.
def source112 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B007.Data.entryAt ⟨96, by decide +kernel⟩

def target112 : Weights.Entry :=
  { word := [9, 12, 12, 4, 0, 8, 10], weights := [1, 0, 0, 1] }

def points112 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 7361, representative 7743.
def source113 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B007.Data.entryAt ⟨96, by decide +kernel⟩

def target113 : Weights.Entry :=
  { word := [9, 12, 12, 4, 0, 8, 12], weights := [1, 0, 0, 1] }

def points113 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 8), (8, 7)]

-- Period 9, original row 7374, representative 7736.
def source114 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B007.Data.entryAt ⟨89, by decide +kernel⟩

def target114 : Weights.Entry :=
  { word := [9, 12, 12, 4, 8, 8, 10], weights := [1, 0, 1, 0] }

def points114 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 7375, representative 7740.
def source115 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B007.Data.entryAt ⟨93, by decide +kernel⟩

def target115 : Weights.Entry :=
  { word := [9, 12, 12, 4, 8, 8, 12], weights := [1, 0, 0, 1] }

def points115 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 7381, representative 7744.
def source116 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B007.Data.entryAt ⟨97, by decide +kernel⟩

def target116 : Weights.Entry :=
  { word := [9, 12, 12, 12, 0, 8, 10], weights := [1, 0, 1, 0] }

def points116 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 7382, representative 7744.
def source117 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B007.Data.entryAt ⟨97, by decide +kernel⟩

def target117 : Weights.Entry :=
  { word := [9, 12, 12, 12, 0, 8, 12], weights := [1, 0, 1, 0] }

def points117 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 8), (8, 7)]

-- Period 9, original row 7395, representative 7737.
def source118 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B007.Data.entryAt ⟨90, by decide +kernel⟩

def target118 : Weights.Entry :=
  { word := [9, 12, 12, 12, 8, 8, 10], weights := [1, 0, 1, 0] }

def points118 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 7396, representative 7741.
def source119 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B007.Data.entryAt ⟨94, by decide +kernel⟩

def target119 : Weights.Entry :=
  { word := [9, 12, 12, 12, 8, 8, 12], weights := [1, 0, 1, 0] }

def points119 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 7426, representative 7652.
def source120 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B007.Data.entryAt ⟨5, by decide +kernel⟩

def target120 : Weights.Entry :=
  { word := [10, 0, 4, 2, 0, 8, 1], weights := [1, 0, 0, 1] }

def points120 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 7449, representative 7655.
def source121 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B007.Data.entryAt ⟨8, by decide +kernel⟩

def target121 : Weights.Entry :=
  { word := [10, 0, 4, 10, 0, 8, 1], weights := [0, 1, 0, 1] }

def points121 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 7484, representative 7658.
def source122 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B007.Data.entryAt ⟨11, by decide +kernel⟩

def target122 : Weights.Entry :=
  { word := [10, 0, 8, 4, 4, 4, 0], weights := [1, 0, 0, 1] }

def points122 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 7514, representative 7659.
def source123 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B007.Data.entryAt ⟨12, by decide +kernel⟩

def target123 : Weights.Entry :=
  { word := [10, 0, 8, 12, 4, 4, 0], weights := [0, 0, 1, 1] }

def points123 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 7516, representative 7647.
def source124 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B007.Data.entryAt ⟨0, by decide +kernel⟩

def target124 : Weights.Entry :=
  { word := [10, 0, 8, 12, 4, 12, 0], weights := [0, 0, 1, 1] }

def points124 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 7543, representative 7653.
def source125 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B007.Data.entryAt ⟨6, by decide +kernel⟩

def target125 : Weights.Entry :=
  { word := [10, 0, 12, 2, 0, 8, 1], weights := [1, 0, 0, 1] }

def points125 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 7571, representative 7654.
def source126 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B007.Data.entryAt ⟨7, by decide +kernel⟩

def target126 : Weights.Entry :=
  { word := [10, 0, 12, 10, 0, 8, 1], weights := [0, 1, 0, 1] }

def points126 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 7812, representative 7762.
def source127 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B007.Data.entryAt ⟨115, by decide +kernel⟩

def target127 : Weights.Entry :=
  { word := [10, 8, 0, 2, 2, 2, 8], weights := [1, 0, 0, 1] }

def points127 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2)]

def period9Entries : List Weights.Entry := [target0, target1, target2, target3, target4, target5, target6, target7, target8, target9, target10, target11, target12, target13, target14, target15, target16, target17, target18, target19, target20, target21, target22, target23, target24, target25, target26, target27, target28, target29, target30, target31, target32, target33, target34, target35, target36, target37, target38, target39, target40, target41, target42, target43, target44, target45, target46, target47, target48, target49, target50, target51, target52, target53, target54, target55, target56, target57, target58, target59, target60, target61, target62, target63, target64, target65, target66, target67, target68, target69, target70, target71, target72, target73, target74, target75, target76, target77, target78, target79, target80, target81, target82, target83, target84, target85, target86, target87, target88, target89, target90, target91, target92, target93, target94, target95, target96, target97, target98, target99, target100, target101, target102, target103, target104, target105, target106, target107, target108, target109, target110, target111, target112, target113, target114, target115, target116, target117, target118, target119, target120, target121, target122, target123, target124, target125, target126, target127]

def period9Chunk : RowCoverage.Chunk where
  rows := [⟨5774, target0⟩, ⟨5780, target1⟩, ⟨5781, target2⟩, ⟨6342, target3⟩, ⟨6343, target4⟩, ⟨6364, target5⟩, ⟨6365, target6⟩, ⟨6378, target7⟩, ⟨6379, target8⟩, ⟨6400, target9⟩, ⟨6401, target10⟩, ⟨6417, target11⟩, ⟨6425, target12⟩, ⟨6438, target13⟩, ⟨6439, target14⟩, ⟨6452, target15⟩, ⟨6453, target16⟩, ⟨6466, target17⟩, ⟨6467, target18⟩, ⟨6480, target19⟩, ⟨6481, target20⟩, ⟨6486, target21⟩, ⟨6497, target22⟩, ⟨6498, target23⟩, ⟨6523, target24⟩, ⟨6524, target25⟩, ⟨6539, target26⟩, ⟨6540, target27⟩, ⟨6565, target28⟩, ⟨6566, target29⟩, ⟨6579, target30⟩, ⟨6582, target31⟩, ⟨6588, target32⟩, ⟨6589, target33⟩, ⟨6602, target34⟩, ⟨6603, target35⟩, ⟨6609, target36⟩, ⟨6610, target37⟩, ⟨6623, target38⟩, ⟨6624, target39⟩, ⟨6635, target40⟩, ⟨6636, target41⟩, ⟨6657, target42⟩, ⟨6658, target43⟩, ⟨6671, target44⟩, ⟨6672, target45⟩, ⟨6693, target46⟩, ⟨6694, target47⟩, ⟨6710, target48⟩, ⟨6711, target49⟩, ⟨6725, target50⟩, ⟨6726, target51⟩, ⟨6739, target52⟩, ⟨6740, target53⟩, ⟨6753, target54⟩, ⟨6754, target55⟩, ⟨6874, target56⟩, ⟨6875, target57⟩, ⟨6882, target58⟩, ⟨6883, target59⟩, ⟨6889, target60⟩, ⟨6890, target61⟩, ⟨6896, target62⟩, ⟨6897, target63⟩, ⟨6975, target64⟩, ⟨6976, target65⟩, ⟨6989, target66⟩, ⟨6990, target67⟩, ⟨7003, target68⟩, ⟨7004, target69⟩, ⟨7017, target70⟩, ⟨7018, target71⟩, ⟨7024, target72⟩, ⟨7025, target73⟩, ⟨7038, target74⟩, ⟨7039, target75⟩, ⟨7045, target76⟩, ⟨7046, target77⟩, ⟨7059, target78⟩, ⟨7060, target79⟩, ⟨7071, target80⟩, ⟨7072, target81⟩, ⟨7093, target82⟩, ⟨7094, target83⟩, ⟨7107, target84⟩, ⟨7108, target85⟩, ⟨7129, target86⟩, ⟨7130, target87⟩, ⟨7146, target88⟩, ⟨7147, target89⟩, ⟨7161, target90⟩, ⟨7162, target91⟩, ⟨7175, target92⟩, ⟨7176, target93⟩, ⟨7189, target94⟩, ⟨7190, target95⟩, ⟨7258, target96⟩, ⟨7259, target97⟩, ⟨7266, target98⟩, ⟨7267, target99⟩, ⟨7273, target100⟩, ⟨7274, target101⟩, ⟨7280, target102⟩, ⟨7281, target103⟩, ⟨7311, target104⟩, ⟨7312, target105⟩, ⟨7325, target106⟩, ⟨7326, target107⟩, ⟨7339, target108⟩, ⟨7340, target109⟩, ⟨7353, target110⟩, ⟨7354, target111⟩, ⟨7360, target112⟩, ⟨7361, target113⟩, ⟨7374, target114⟩, ⟨7375, target115⟩, ⟨7381, target116⟩, ⟨7382, target117⟩, ⟨7395, target118⟩, ⟨7396, target119⟩, ⟨7426, target120⟩, ⟨7449, target121⟩, ⟨7484, target122⟩, ⟨7514, target123⟩, ⟨7516, target124⟩, ⟨7543, target125⟩, ⟨7571, target126⟩, ⟨7812, target127⟩]
  indexMask := 442920852378009503789473230850661146027541000168517047689517913952463159197029348765766012824465093118500390710279112370794478094558971324257934226022790317471661879206856598530495638663390795162168659653138513567416676824809538197934536811398694502462878932923416538650970287394692896622942721025803658405934586115106420351820858045520926035653329105170399810358567625473678245704585445488735418071430923974533478801324228420841379178265858801674152980602855309390546188886816667377683972881189156833258753164565730203589036598594928564403312465193447380084119834261280425059271997972102046527022953952559954542736024554866438342584453179079134947973642781532255440619804341866879984352311315483623431450540228458396827323759192972521911995252488655308939919358033843776236791172523035985375303989539433511973674048872305525966989991449977206531325565749512311481332492835636581205673520450776201513844380832474568486675886327284067923374575992563318091380867776687004170710587555367967579668254037802315236148150115283135764020324157462022345336725854682718726083227074720266981451417142599347761311386153301547727929999777410639247908277779523399900602314674749173267742955906130478121734207563760768943549552397284282306837622989040050889232357829938700719698789325768379786218877017957813415373281159192389777219614790565821488888302528812713872012459256737018354461184808414972763307642768680843730916331983772247538479511397647593025604555006255601651040282930059487246144081776312428896853772582610921483807500832092822432467621836954120238204925513812111989863946578466424626564395104745955252821814252158558628465890829254492734822917813919191144358589848705693337386540861384391023134703467633132676510446431391597632013743254948324353847745644969827393461620507648163287614389537089196934851874580077788324524767256569880335807250049648610401376108768612545626491006370189446797588395487523651233726713658561903645207185761752775507044528522480192143026309465817262964990169334931722615235817911910407398813161414880384567657891187463468444900234655249014450089524349230630626585050332761437432725322164729862089724788224640430690372546450506859880270358132617652497640397227798911902817712316204688821500505962583432368611785024613809789741263018749059941656848675662881792585577217037393408269152332198301458428815333079083142444312690688
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

end FranklSmallCyclic.TransportBatches.G060.B001.Data
