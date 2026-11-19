module

public import Conjectures.FranklSmallCyclicRowCoverage
public import Conjectures.FranklSmallCyclicCanonicalWords
public import Conjectures.FranklSmallCyclicOrbit8Block013Data

/-! 128 literal targets sharing one source proof block.
Original words and row indices are retained; weights may be transported.
-/
@[expose] public section

namespace FranklSmallCyclic.TransportBatches.G039.B000.Data

-- Period 8, original row 4, representative 5002.
def source0 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B013.Data.entryAt ⟨22, by decide +kernel⟩

def target0 : Weights.Entry :=
  { word := [0, 0, 1, 4, 2, 0, 9], weights := [0, 0, 1, 0] }

-- Period 8, original row 5, representative 5002.
def source1 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B013.Data.entryAt ⟨22, by decide +kernel⟩

def target1 : Weights.Entry :=
  { word := [0, 0, 1, 4, 2, 0, 10], weights := [0, 0, 1, 0] }

def points1 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 8, original row 6, representative 5021.
def source2 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B013.Data.entryAt ⟨41, by decide +kernel⟩

def target2 : Weights.Entry :=
  { word := [0, 0, 1, 4, 2, 0, 12], weights := [1, 0, 0, 1] }

-- Period 8, original row 26, representative 4981.
def source3 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B013.Data.entryAt ⟨1, by decide +kernel⟩

def target3 : Weights.Entry :=
  { word := [0, 0, 1, 4, 10, 0, 9], weights := [0, 0, 1, 0] }

-- Period 8, original row 27, representative 4981.
def source4 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B013.Data.entryAt ⟨1, by decide +kernel⟩

def target4 : Weights.Entry :=
  { word := [0, 0, 1, 4, 10, 0, 10], weights := [0, 0, 1, 0] }

def points4 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 8, original row 28, representative 5014.
def source5 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B013.Data.entryAt ⟨34, by decide +kernel⟩

def target5 : Weights.Entry :=
  { word := [0, 0, 1, 4, 10, 0, 12], weights := [1, 0, 0, 1] }

-- Period 8, original row 50, representative 5002.
def source6 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B013.Data.entryAt ⟨22, by decide +kernel⟩

def target6 : Weights.Entry :=
  { word := [0, 0, 2, 2, 2, 0, 9], weights := [0, 1, 0, 0] }

def points6 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 5), (5, 4), (6, 6), (7, 7)]

-- Period 8, original row 51, representative 5002.
def source7 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B013.Data.entryAt ⟨22, by decide +kernel⟩

def target7 : Weights.Entry :=
  { word := [0, 0, 2, 2, 2, 0, 10], weights := [0, 1, 0, 0] }

def points7 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 2), (3, 3), (4, 5), (5, 4), (6, 6), (7, 7)]

-- Period 8, original row 52, representative 5021.
def source8 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B013.Data.entryAt ⟨41, by decide +kernel⟩

def target8 : Weights.Entry :=
  { word := [0, 0, 2, 2, 2, 0, 12], weights := [1, 0, 0, 1] }

def points8 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 5), (5, 4), (6, 6), (7, 7)]

-- Period 8, original row 65, representative 4981.
def source9 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B013.Data.entryAt ⟨1, by decide +kernel⟩

def target9 : Weights.Entry :=
  { word := [0, 0, 2, 2, 10, 0, 9], weights := [0, 1, 0, 0] }

def points9 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 5), (5, 4), (6, 6), (7, 7)]

-- Period 8, original row 66, representative 4981.
def source10 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B013.Data.entryAt ⟨1, by decide +kernel⟩

def target10 : Weights.Entry :=
  { word := [0, 0, 2, 2, 10, 0, 10], weights := [0, 1, 0, 0] }

def points10 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 2), (3, 3), (4, 5), (5, 4), (6, 6), (7, 7)]

-- Period 8, original row 67, representative 5014.
def source11 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B013.Data.entryAt ⟨34, by decide +kernel⟩

def target11 : Weights.Entry :=
  { word := [0, 0, 2, 2, 10, 0, 12], weights := [1, 0, 0, 1] }

def points11 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 5), (5, 4), (6, 6), (7, 7)]

-- Period 8, original row 556, representative 5021.
def source12 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B013.Data.entryAt ⟨41, by decide +kernel⟩

def target12 : Weights.Entry :=
  { word := [0, 4, 2, 0, 1, 0, 9], weights := [0, 0, 1, 1] }

def points12 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 2), (3, 5), (4, 3), (5, 4), (6, 6), (7, 1)]

-- Period 8, original row 557, representative 5002.
def source13 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B013.Data.entryAt ⟨22, by decide +kernel⟩

def target13 : Weights.Entry :=
  { word := [0, 4, 2, 0, 1, 0, 10], weights := [0, 1, 0, 0] }

def points13 : List (ℕ × ℕ) := [(0, 7), (1, 0), (2, 2), (3, 5), (4, 3), (5, 4), (6, 6), (7, 1)]

-- Period 8, original row 558, representative 5002.
def source14 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B013.Data.entryAt ⟨22, by decide +kernel⟩

def target14 : Weights.Entry :=
  { word := [0, 4, 2, 0, 1, 0, 12], weights := [0, 1, 0, 0] }

def points14 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 2), (3, 5), (4, 3), (5, 4), (6, 6), (7, 1)]

-- Period 8, original row 570, representative 5022.
def source15 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B013.Data.entryAt ⟨42, by decide +kernel⟩

def target15 : Weights.Entry :=
  { word := [0, 4, 2, 0, 9, 0, 9], weights := [0, 1, 0, 1] }

-- Period 8, original row 571, representative 5003.
def source16 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B013.Data.entryAt ⟨23, by decide +kernel⟩

def target16 : Weights.Entry :=
  { word := [0, 4, 2, 0, 9, 0, 10], weights := [0, 1, 0, 1] }

-- Period 8, original row 572, representative 5004.
def source17 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B013.Data.entryAt ⟨24, by decide +kernel⟩

def target17 : Weights.Entry :=
  { word := [0, 4, 2, 0, 9, 0, 12], weights := [0, 1, 0, 1] }

-- Period 8, original row 583, representative 4990.
def source18 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B013.Data.entryAt ⟨10, by decide +kernel⟩

def target18 : Weights.Entry :=
  { word := [0, 4, 2, 8, 2, 0, 9], weights := [0, 1, 1, 0] }

-- Period 8, original row 584, representative 4984.
def source19 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B013.Data.entryAt ⟨4, by decide +kernel⟩

def target19 : Weights.Entry :=
  { word := [0, 4, 2, 8, 2, 0, 10], weights := [0, 1, 1, 0] }

-- Period 8, original row 606, representative 5021.
def source20 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B013.Data.entryAt ⟨41, by decide +kernel⟩

def target20 : Weights.Entry :=
  { word := [0, 4, 4, 4, 0, 0, 9], weights := [0, 0, 1, 1] }

def points20 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 2), (3, 5), (4, 4), (5, 3), (6, 6), (7, 1)]

-- Period 8, original row 607, representative 5002.
def source21 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B013.Data.entryAt ⟨22, by decide +kernel⟩

def target21 : Weights.Entry :=
  { word := [0, 4, 4, 4, 0, 0, 10], weights := [1, 0, 0, 0] }

def points21 : List (ℕ × ℕ) := [(0, 7), (1, 0), (2, 2), (3, 5), (4, 4), (5, 3), (6, 6), (7, 1)]

-- Period 8, original row 608, representative 5002.
def source22 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B013.Data.entryAt ⟨22, by decide +kernel⟩

def target22 : Weights.Entry :=
  { word := [0, 4, 4, 4, 0, 0, 12], weights := [1, 0, 0, 0] }

def points22 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 2), (3, 5), (4, 4), (5, 3), (6, 6), (7, 1)]

-- Period 8, original row 620, representative 5017.
def source23 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B013.Data.entryAt ⟨37, by decide +kernel⟩

def target23 : Weights.Entry :=
  { word := [0, 4, 4, 4, 8, 0, 9], weights := [1, 0, 1, 0] }

-- Period 8, original row 621, representative 4994.
def source24 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B013.Data.entryAt ⟨14, by decide +kernel⟩

def target24 : Weights.Entry :=
  { word := [0, 4, 4, 4, 8, 0, 10], weights := [1, 0, 1, 0] }

-- Period 8, original row 622, representative 4996.
def source25 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B013.Data.entryAt ⟨16, by decide +kernel⟩

def target25 : Weights.Entry :=
  { word := [0, 4, 4, 4, 8, 0, 12], weights := [1, 0, 0, 1] }

-- Period 8, original row 639, representative 4991.
def source26 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B013.Data.entryAt ⟨11, by decide +kernel⟩

def target26 : Weights.Entry :=
  { word := [0, 4, 8, 4, 2, 0, 9], weights := [0, 0, 1, 0] }

-- Period 8, original row 640, representative 4985.
def source27 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B013.Data.entryAt ⟨5, by decide +kernel⟩

def target27 : Weights.Entry :=
  { word := [0, 4, 8, 4, 2, 0, 10], weights := [0, 0, 1, 0] }

-- Period 8, original row 641, representative 4991.
def source28 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B013.Data.entryAt ⟨11, by decide +kernel⟩

def target28 : Weights.Entry :=
  { word := [0, 4, 8, 4, 2, 0, 12], weights := [1, 0, 0, 0] }

def points28 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 2), (3, 5), (4, 4), (5, 3), (6, 6), (7, 1)]

-- Period 8, original row 667, representative 4989.
def source29 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B013.Data.entryAt ⟨9, by decide +kernel⟩

def target29 : Weights.Entry :=
  { word := [0, 4, 8, 4, 10, 0, 12], weights := [1, 0, 0, 1] }

-- Period 8, original row 728, representative 5018.
def source30 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B013.Data.entryAt ⟨38, by decide +kernel⟩

def target30 : Weights.Entry :=
  { word := [0, 4, 12, 4, 8, 0, 9], weights := [1, 0, 1, 0] }

-- Period 8, original row 729, representative 4995.
def source31 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B013.Data.entryAt ⟨15, by decide +kernel⟩

def target31 : Weights.Entry :=
  { word := [0, 4, 12, 4, 8, 0, 10], weights := [1, 0, 1, 0] }

-- Period 8, original row 730, representative 4997.
def source32 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B013.Data.entryAt ⟨17, by decide +kernel⟩

def target32 : Weights.Entry :=
  { word := [0, 4, 12, 4, 8, 0, 12], weights := [1, 0, 0, 1] }

-- Period 8, original row 817, representative 5006.
def source33 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B013.Data.entryAt ⟨26, by decide +kernel⟩

def target33 : Weights.Entry :=
  { word := [0, 8, 0, 4, 2, 0, 9], weights := [0, 0, 1, 0] }

-- Period 8, original row 818, representative 5005.
def source34 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B013.Data.entryAt ⟨25, by decide +kernel⟩

def target34 : Weights.Entry :=
  { word := [0, 8, 0, 4, 2, 0, 10], weights := [0, 0, 1, 0] }

-- Period 8, original row 819, representative 5023.
def source35 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B013.Data.entryAt ⟨43, by decide +kernel⟩

def target35 : Weights.Entry :=
  { word := [0, 8, 0, 4, 2, 0, 12], weights := [1, 0, 0, 1] }

-- Period 8, original row 843, representative 4983.
def source36 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B013.Data.entryAt ⟨3, by decide +kernel⟩

def target36 : Weights.Entry :=
  { word := [0, 8, 0, 4, 10, 0, 9], weights := [0, 0, 1, 0] }

-- Period 8, original row 844, representative 4982.
def source37 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B013.Data.entryAt ⟨2, by decide +kernel⟩

def target37 : Weights.Entry :=
  { word := [0, 8, 0, 4, 10, 0, 10], weights := [0, 0, 1, 0] }

-- Period 8, original row 845, representative 5015.
def source38 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B013.Data.entryAt ⟨35, by decide +kernel⟩

def target38 : Weights.Entry :=
  { word := [0, 8, 0, 4, 10, 0, 12], weights := [1, 0, 0, 1] }

-- Period 8, original row 896, representative 4993.
def source39 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B013.Data.entryAt ⟨13, by decide +kernel⟩

def target39 : Weights.Entry :=
  { word := [0, 8, 1, 4, 2, 0, 9], weights := [0, 0, 1, 0] }

-- Period 8, original row 897, representative 4992.
def source40 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B013.Data.entryAt ⟨12, by decide +kernel⟩

def target40 : Weights.Entry :=
  { word := [0, 8, 1, 4, 2, 0, 10], weights := [0, 0, 1, 0] }

-- Period 8, original row 898, representative 5016.
def source41 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B013.Data.entryAt ⟨36, by decide +kernel⟩

def target41 : Weights.Entry :=
  { word := [0, 8, 1, 4, 2, 0, 12], weights := [1, 0, 0, 1] }

-- Period 8, original row 920, representative 5011.
def source42 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B013.Data.entryAt ⟨31, by decide +kernel⟩

def target42 : Weights.Entry :=
  { word := [0, 8, 1, 4, 10, 0, 12], weights := [1, 0, 0, 1] }

-- Period 8, original row 942, representative 5000.
def source43 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B013.Data.entryAt ⟨20, by decide +kernel⟩

def target43 : Weights.Entry :=
  { word := [0, 8, 2, 2, 2, 0, 9], weights := [0, 1, 0, 0] }

-- Period 8, original row 943, representative 4998.
def source44 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B013.Data.entryAt ⟨18, by decide +kernel⟩

def target44 : Weights.Entry :=
  { word := [0, 8, 2, 2, 2, 0, 10], weights := [0, 1, 0, 0] }

-- Period 8, original row 944, representative 5019.
def source45 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B013.Data.entryAt ⟨39, by decide +kernel⟩

def target45 : Weights.Entry :=
  { word := [0, 8, 2, 2, 2, 0, 12], weights := [1, 0, 0, 1] }

-- Period 8, original row 959, representative 5012.
def source46 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B013.Data.entryAt ⟨32, by decide +kernel⟩

def target46 : Weights.Entry :=
  { word := [0, 8, 2, 2, 10, 0, 12], weights := [1, 0, 0, 1] }

-- Period 8, original row 972, representative 5001.
def source47 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B013.Data.entryAt ⟨21, by decide +kernel⟩

def target47 : Weights.Entry :=
  { word := [0, 8, 2, 10, 2, 0, 9], weights := [0, 1, 0, 0] }

-- Period 8, original row 973, representative 4999.
def source48 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B013.Data.entryAt ⟨19, by decide +kernel⟩

def target48 : Weights.Entry :=
  { word := [0, 8, 2, 10, 2, 0, 10], weights := [0, 1, 0, 0] }

-- Period 8, original row 974, representative 5020.
def source49 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B013.Data.entryAt ⟨40, by decide +kernel⟩

def target49 : Weights.Entry :=
  { word := [0, 8, 2, 10, 2, 0, 12], weights := [1, 1, 0, 0] }

-- Period 8, original row 986, representative 4980.
def source50 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B013.Data.entryAt ⟨0, by decide +kernel⟩

def target50 : Weights.Entry :=
  { word := [0, 8, 2, 10, 10, 0, 9], weights := [0, 1, 0, 0] }

-- Period 8, original row 988, representative 5013.
def source51 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B013.Data.entryAt ⟨33, by decide +kernel⟩

def target51 : Weights.Entry :=
  { word := [0, 8, 2, 10, 10, 0, 12], weights := [1, 1, 0, 0] }

-- Period 8, original row 1509, representative 4987.
def source52 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B013.Data.entryAt ⟨7, by decide +kernel⟩

def target52 : Weights.Entry :=
  { word := [0, 12, 0, 4, 2, 0, 9], weights := [0, 0, 1, 0] }

-- Period 8, original row 1555, representative 5009.
def source53 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B013.Data.entryAt ⟨29, by decide +kernel⟩

def target53 : Weights.Entry :=
  { word := [0, 12, 2, 0, 1, 0, 9], weights := [0, 1, 0, 1] }

-- Period 8, original row 1569, representative 5010.
def source54 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B013.Data.entryAt ⟨30, by decide +kernel⟩

def target54 : Weights.Entry :=
  { word := [0, 12, 2, 0, 9, 0, 9], weights := [0, 1, 0, 1] }

-- Period 8, original row 1582, representative 4986.
def source55 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B013.Data.entryAt ⟨6, by decide +kernel⟩

def target55 : Weights.Entry :=
  { word := [0, 12, 2, 8, 2, 0, 9], weights := [0, 1, 1, 0] }

-- Period 8, original row 1605, representative 5009.
def source56 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B013.Data.entryAt ⟨29, by decide +kernel⟩

def target56 : Weights.Entry :=
  { word := [0, 12, 4, 4, 0, 0, 9], weights := [1, 0, 0, 1] }

def points56 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6), (7, 7)]

-- Period 8, original row 1619, representative 5007.
def source57 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B013.Data.entryAt ⟨27, by decide +kernel⟩

def target57 : Weights.Entry :=
  { word := [0, 12, 4, 4, 8, 0, 9], weights := [1, 0, 1, 0] }

-- Period 8, original row 1638, representative 4988.
def source58 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B013.Data.entryAt ⟨8, by decide +kernel⟩

def target58 : Weights.Entry :=
  { word := [0, 12, 8, 4, 2, 0, 9], weights := [0, 0, 1, 0] }

-- Period 8, original row 1727, representative 5008.
def source59 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B013.Data.entryAt ⟨28, by decide +kernel⟩

def target59 : Weights.Entry :=
  { word := [0, 12, 12, 4, 8, 0, 9], weights := [1, 0, 1, 0] }

-- Period 8, original row 1741, representative 5002.
def source60 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B013.Data.entryAt ⟨22, by decide +kernel⟩

def target60 : Weights.Entry :=
  { word := [1, 0, 1, 4, 2, 0, 9], weights := [0, 0, 1, 0] }

def points60 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 8, original row 1742, representative 5002.
def source61 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B013.Data.entryAt ⟨22, by decide +kernel⟩

def target61 : Weights.Entry :=
  { word := [1, 0, 1, 4, 2, 0, 10], weights := [0, 0, 1, 0] }

def points61 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 8, original row 1743, representative 5021.
def source62 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B013.Data.entryAt ⟨41, by decide +kernel⟩

def target62 : Weights.Entry :=
  { word := [1, 0, 1, 4, 2, 0, 12], weights := [1, 0, 0, 1] }

def points62 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 8, original row 1763, representative 4981.
def source63 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B013.Data.entryAt ⟨1, by decide +kernel⟩

def target63 : Weights.Entry :=
  { word := [1, 0, 1, 4, 10, 0, 9], weights := [0, 0, 1, 0] }

def points63 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 8, original row 1764, representative 4981.
def source64 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B013.Data.entryAt ⟨1, by decide +kernel⟩

def target64 : Weights.Entry :=
  { word := [1, 0, 1, 4, 10, 0, 10], weights := [0, 0, 1, 0] }

def points64 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 8, original row 1765, representative 5014.
def source65 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B013.Data.entryAt ⟨34, by decide +kernel⟩

def target65 : Weights.Entry :=
  { word := [1, 0, 1, 4, 10, 0, 12], weights := [1, 0, 0, 1] }

def points65 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 8, original row 1787, representative 5002.
def source66 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B013.Data.entryAt ⟨22, by decide +kernel⟩

def target66 : Weights.Entry :=
  { word := [1, 0, 2, 2, 2, 0, 9], weights := [0, 1, 0, 0] }

def points66 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 5), (5, 4), (6, 6), (7, 7)]

-- Period 8, original row 1788, representative 5002.
def source67 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B013.Data.entryAt ⟨22, by decide +kernel⟩

def target67 : Weights.Entry :=
  { word := [1, 0, 2, 2, 2, 0, 10], weights := [0, 1, 0, 0] }

def points67 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 2), (3, 3), (4, 5), (5, 4), (6, 6), (7, 7)]

-- Period 8, original row 1789, representative 5021.
def source68 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B013.Data.entryAt ⟨41, by decide +kernel⟩

def target68 : Weights.Entry :=
  { word := [1, 0, 2, 2, 2, 0, 12], weights := [1, 0, 0, 1] }

def points68 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 5), (5, 4), (6, 6), (7, 7)]

-- Period 8, original row 1802, representative 4981.
def source69 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B013.Data.entryAt ⟨1, by decide +kernel⟩

def target69 : Weights.Entry :=
  { word := [1, 0, 2, 2, 10, 0, 9], weights := [0, 1, 0, 0] }

def points69 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 5), (5, 4), (6, 6), (7, 7)]

-- Period 8, original row 1803, representative 4981.
def source70 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B013.Data.entryAt ⟨1, by decide +kernel⟩

def target70 : Weights.Entry :=
  { word := [1, 0, 2, 2, 10, 0, 10], weights := [0, 1, 0, 0] }

def points70 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 2), (3, 3), (4, 5), (5, 4), (6, 6), (7, 7)]

-- Period 8, original row 1804, representative 5014.
def source71 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B013.Data.entryAt ⟨34, by decide +kernel⟩

def target71 : Weights.Entry :=
  { word := [1, 0, 2, 2, 10, 0, 12], weights := [1, 0, 0, 1] }

def points71 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 5), (5, 4), (6, 6), (7, 7)]

-- Period 8, original row 1845, representative 5021.
def source72 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B013.Data.entryAt ⟨41, by decide +kernel⟩

def target72 : Weights.Entry :=
  { word := [1, 4, 2, 0, 1, 0, 9], weights := [0, 0, 1, 1] }

def points72 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 2), (3, 5), (4, 3), (5, 4), (6, 6), (7, 1)]

-- Period 8, original row 1846, representative 5002.
def source73 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B013.Data.entryAt ⟨22, by decide +kernel⟩

def target73 : Weights.Entry :=
  { word := [1, 4, 2, 0, 1, 0, 10], weights := [0, 1, 0, 0] }

def points73 : List (ℕ × ℕ) := [(0, 7), (1, 0), (2, 2), (3, 5), (4, 3), (5, 4), (6, 6), (7, 1)]

-- Period 8, original row 1847, representative 5002.
def source74 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B013.Data.entryAt ⟨22, by decide +kernel⟩

def target74 : Weights.Entry :=
  { word := [1, 4, 2, 0, 1, 0, 12], weights := [0, 1, 0, 0] }

def points74 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 2), (3, 5), (4, 3), (5, 4), (6, 6), (7, 1)]

-- Period 8, original row 1859, representative 5022.
def source75 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B013.Data.entryAt ⟨42, by decide +kernel⟩

def target75 : Weights.Entry :=
  { word := [1, 4, 2, 0, 9, 0, 9], weights := [0, 1, 0, 1] }

def points75 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 8, original row 1860, representative 5003.
def source76 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B013.Data.entryAt ⟨23, by decide +kernel⟩

def target76 : Weights.Entry :=
  { word := [1, 4, 2, 0, 9, 0, 10], weights := [0, 1, 0, 1] }

def points76 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 8, original row 1861, representative 5004.
def source77 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B013.Data.entryAt ⟨24, by decide +kernel⟩

def target77 : Weights.Entry :=
  { word := [1, 4, 2, 0, 9, 0, 12], weights := [0, 1, 0, 1] }

def points77 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 8, original row 1872, representative 4990.
def source78 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B013.Data.entryAt ⟨10, by decide +kernel⟩

def target78 : Weights.Entry :=
  { word := [1, 4, 2, 8, 2, 0, 9], weights := [0, 1, 1, 0] }

def points78 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 8, original row 1873, representative 4984.
def source79 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B013.Data.entryAt ⟨4, by decide +kernel⟩

def target79 : Weights.Entry :=
  { word := [1, 4, 2, 8, 2, 0, 10], weights := [0, 1, 1, 0] }

def points79 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 8, original row 1895, representative 5021.
def source80 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B013.Data.entryAt ⟨41, by decide +kernel⟩

def target80 : Weights.Entry :=
  { word := [1, 4, 4, 4, 0, 0, 9], weights := [0, 0, 1, 1] }

def points80 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 2), (3, 5), (4, 4), (5, 3), (6, 6), (7, 1)]

-- Period 8, original row 1896, representative 5002.
def source81 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B013.Data.entryAt ⟨22, by decide +kernel⟩

def target81 : Weights.Entry :=
  { word := [1, 4, 4, 4, 0, 0, 10], weights := [1, 0, 0, 0] }

def points81 : List (ℕ × ℕ) := [(0, 7), (1, 0), (2, 2), (3, 5), (4, 4), (5, 3), (6, 6), (7, 1)]

-- Period 8, original row 1897, representative 5002.
def source82 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B013.Data.entryAt ⟨22, by decide +kernel⟩

def target82 : Weights.Entry :=
  { word := [1, 4, 4, 4, 0, 0, 12], weights := [1, 0, 0, 0] }

def points82 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 2), (3, 5), (4, 4), (5, 3), (6, 6), (7, 1)]

-- Period 8, original row 1909, representative 5017.
def source83 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B013.Data.entryAt ⟨37, by decide +kernel⟩

def target83 : Weights.Entry :=
  { word := [1, 4, 4, 4, 8, 0, 9], weights := [1, 0, 1, 0] }

def points83 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 8, original row 1910, representative 4994.
def source84 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B013.Data.entryAt ⟨14, by decide +kernel⟩

def target84 : Weights.Entry :=
  { word := [1, 4, 4, 4, 8, 0, 10], weights := [1, 0, 1, 0] }

def points84 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 8, original row 1911, representative 4996.
def source85 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B013.Data.entryAt ⟨16, by decide +kernel⟩

def target85 : Weights.Entry :=
  { word := [1, 4, 4, 4, 8, 0, 12], weights := [1, 0, 0, 1] }

def points85 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 8, original row 1923, representative 4991.
def source86 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B013.Data.entryAt ⟨11, by decide +kernel⟩

def target86 : Weights.Entry :=
  { word := [1, 4, 8, 4, 2, 0, 9], weights := [0, 0, 1, 0] }

def points86 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 8, original row 1924, representative 4985.
def source87 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B013.Data.entryAt ⟨5, by decide +kernel⟩

def target87 : Weights.Entry :=
  { word := [1, 4, 8, 4, 2, 0, 10], weights := [0, 0, 1, 0] }

def points87 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 8, original row 1925, representative 4991.
def source88 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B013.Data.entryAt ⟨11, by decide +kernel⟩

def target88 : Weights.Entry :=
  { word := [1, 4, 8, 4, 2, 0, 12], weights := [1, 0, 0, 0] }

def points88 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 2), (3, 5), (4, 4), (5, 3), (6, 6), (7, 1)]

-- Period 8, original row 1951, representative 4989.
def source89 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B013.Data.entryAt ⟨9, by decide +kernel⟩

def target89 : Weights.Entry :=
  { word := [1, 4, 8, 4, 10, 0, 12], weights := [1, 0, 0, 1] }

def points89 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 8, original row 2012, representative 5018.
def source90 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B013.Data.entryAt ⟨38, by decide +kernel⟩

def target90 : Weights.Entry :=
  { word := [1, 4, 12, 4, 8, 0, 9], weights := [1, 0, 1, 0] }

def points90 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 8, original row 2013, representative 4995.
def source91 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B013.Data.entryAt ⟨15, by decide +kernel⟩

def target91 : Weights.Entry :=
  { word := [1, 4, 12, 4, 8, 0, 10], weights := [1, 0, 1, 0] }

def points91 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 8, original row 2014, representative 4997.
def source92 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B013.Data.entryAt ⟨17, by decide +kernel⟩

def target92 : Weights.Entry :=
  { word := [1, 4, 12, 4, 8, 0, 12], weights := [1, 0, 0, 1] }

def points92 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 8, original row 2026, representative 4993.
def source93 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B013.Data.entryAt ⟨13, by decide +kernel⟩

def target93 : Weights.Entry :=
  { word := [1, 8, 1, 4, 2, 0, 9], weights := [0, 0, 1, 0] }

def points93 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 8, original row 2027, representative 4992.
def source94 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B013.Data.entryAt ⟨12, by decide +kernel⟩

def target94 : Weights.Entry :=
  { word := [1, 8, 1, 4, 2, 0, 10], weights := [0, 0, 1, 0] }

def points94 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 8, original row 2028, representative 5016.
def source95 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B013.Data.entryAt ⟨36, by decide +kernel⟩

def target95 : Weights.Entry :=
  { word := [1, 8, 1, 4, 2, 0, 12], weights := [1, 0, 0, 1] }

def points95 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 8, original row 2050, representative 5011.
def source96 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B013.Data.entryAt ⟨31, by decide +kernel⟩

def target96 : Weights.Entry :=
  { word := [1, 8, 1, 4, 10, 0, 12], weights := [1, 0, 0, 1] }

def points96 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 8, original row 2072, representative 5000.
def source97 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B013.Data.entryAt ⟨20, by decide +kernel⟩

def target97 : Weights.Entry :=
  { word := [1, 8, 2, 2, 2, 0, 9], weights := [0, 1, 0, 0] }

def points97 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 8, original row 2073, representative 4998.
def source98 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B013.Data.entryAt ⟨18, by decide +kernel⟩

def target98 : Weights.Entry :=
  { word := [1, 8, 2, 2, 2, 0, 10], weights := [0, 1, 0, 0] }

def points98 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 8, original row 2074, representative 5019.
def source99 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B013.Data.entryAt ⟨39, by decide +kernel⟩

def target99 : Weights.Entry :=
  { word := [1, 8, 2, 2, 2, 0, 12], weights := [1, 0, 0, 1] }

def points99 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 8, original row 2089, representative 5012.
def source100 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B013.Data.entryAt ⟨32, by decide +kernel⟩

def target100 : Weights.Entry :=
  { word := [1, 8, 2, 2, 10, 0, 12], weights := [1, 0, 0, 1] }

def points100 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 8, original row 2102, representative 5001.
def source101 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B013.Data.entryAt ⟨21, by decide +kernel⟩

def target101 : Weights.Entry :=
  { word := [1, 8, 2, 10, 2, 0, 9], weights := [0, 1, 0, 0] }

def points101 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 8, original row 2103, representative 4999.
def source102 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B013.Data.entryAt ⟨19, by decide +kernel⟩

def target102 : Weights.Entry :=
  { word := [1, 8, 2, 10, 2, 0, 10], weights := [0, 1, 0, 0] }

def points102 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 8, original row 2104, representative 5020.
def source103 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B013.Data.entryAt ⟨40, by decide +kernel⟩

def target103 : Weights.Entry :=
  { word := [1, 8, 2, 10, 2, 0, 12], weights := [1, 1, 0, 0] }

def points103 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 8, original row 2116, representative 4980.
def source104 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B013.Data.entryAt ⟨0, by decide +kernel⟩

def target104 : Weights.Entry :=
  { word := [1, 8, 2, 10, 10, 0, 9], weights := [0, 1, 0, 0] }

def points104 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 8, original row 2118, representative 5013.
def source105 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B013.Data.entryAt ⟨33, by decide +kernel⟩

def target105 : Weights.Entry :=
  { word := [1, 8, 2, 10, 10, 0, 12], weights := [1, 1, 0, 0] }

def points105 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 8, original row 2204, representative 5009.
def source106 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B013.Data.entryAt ⟨29, by decide +kernel⟩

def target106 : Weights.Entry :=
  { word := [1, 12, 2, 0, 1, 0, 9], weights := [0, 1, 0, 1] }

def points106 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 8, original row 2218, representative 5010.
def source107 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B013.Data.entryAt ⟨30, by decide +kernel⟩

def target107 : Weights.Entry :=
  { word := [1, 12, 2, 0, 9, 0, 9], weights := [0, 1, 0, 1] }

def points107 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 8, original row 2231, representative 4986.
def source108 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B013.Data.entryAt ⟨6, by decide +kernel⟩

def target108 : Weights.Entry :=
  { word := [1, 12, 2, 8, 2, 0, 9], weights := [0, 1, 1, 0] }

def points108 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 8, original row 2254, representative 5009.
def source109 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B013.Data.entryAt ⟨29, by decide +kernel⟩

def target109 : Weights.Entry :=
  { word := [1, 12, 4, 4, 0, 0, 9], weights := [1, 0, 0, 1] }

def points109 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6), (7, 7)]

-- Period 8, original row 2268, representative 5007.
def source110 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B013.Data.entryAt ⟨27, by decide +kernel⟩

def target110 : Weights.Entry :=
  { word := [1, 12, 4, 4, 8, 0, 9], weights := [1, 0, 1, 0] }

def points110 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 8, original row 2282, representative 4988.
def source111 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B013.Data.entryAt ⟨8, by decide +kernel⟩

def target111 : Weights.Entry :=
  { word := [1, 12, 8, 4, 2, 0, 9], weights := [0, 0, 1, 0] }

def points111 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 8, original row 2371, representative 5008.
def source112 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B013.Data.entryAt ⟨28, by decide +kernel⟩

def target112 : Weights.Entry :=
  { word := [1, 12, 12, 4, 8, 0, 9], weights := [1, 0, 1, 0] }

def points112 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 8, original row 2412, representative 5076.
def source113 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B013.Data.entryAt ⟨96, by decide +kernel⟩

def target113 : Weights.Entry :=
  { word := [2, 0, 4, 2, 0, 8, 4], weights := [1, 0, 0, 1] }

-- Period 8, original row 2423, representative 5077.
def source114 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B013.Data.entryAt ⟨97, by decide +kernel⟩

def target114 : Weights.Entry :=
  { word := [2, 0, 4, 2, 8, 8, 4], weights := [1, 0, 0, 1] }

-- Period 8, original row 2435, representative 5083.
def source115 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B013.Data.entryAt ⟨103, by decide +kernel⟩

def target115 : Weights.Entry :=
  { word := [2, 0, 4, 10, 0, 8, 4], weights := [1, 0, 0, 1] }

-- Period 8, original row 2442, representative 5090.
def source116 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B013.Data.entryAt ⟨110, by decide +kernel⟩

def target116 : Weights.Entry :=
  { word := [2, 0, 4, 10, 0, 12, 2], weights := [1, 0, 1, 1] }

-- Period 8, original row 2443, representative 5046.
def source117 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B013.Data.entryAt ⟨66, by decide +kernel⟩

def target117 : Weights.Entry :=
  { word := [2, 0, 4, 10, 0, 12, 4], weights := [1, 0, 1, 1] }

-- Period 8, original row 2448, representative 5066.
def source118 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B013.Data.entryAt ⟨86, by decide +kernel⟩

def target118 : Weights.Entry :=
  { word := [2, 0, 4, 10, 8, 4, 4], weights := [1, 0, 1, 1] }

-- Period 8, original row 2450, representative 5080.
def source119 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B013.Data.entryAt ⟨100, by decide +kernel⟩

def target119 : Weights.Entry :=
  { word := [2, 0, 4, 10, 8, 8, 4], weights := [1, 0, 0, 1] }

-- Period 8, original row 2453, representative 5044.
def source120 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B013.Data.entryAt ⟨64, by decide +kernel⟩

def target120 : Weights.Entry :=
  { word := [2, 0, 4, 10, 8, 12, 4], weights := [1, 0, 1, 1] }

-- Period 8, original row 2472, representative 5053.
def source121 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B013.Data.entryAt ⟨73, by decide +kernel⟩

def target121 : Weights.Entry :=
  { word := [2, 0, 8, 4, 8, 4, 4], weights := [1, 0, 0, 1] }

-- Period 8, original row 2474, representative 5030.
def source122 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B013.Data.entryAt ⟨50, by decide +kernel⟩

def target122 : Weights.Entry :=
  { word := [2, 0, 8, 4, 8, 12, 4], weights := [1, 0, 0, 1] }

-- Period 8, original row 2476, representative 5057.
def source123 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B013.Data.entryAt ⟨77, by decide +kernel⟩

def target123 : Weights.Entry :=
  { word := [2, 0, 8, 9, 4, 4, 4], weights := [1, 0, 1, 1] }

-- Period 8, original row 2478, representative 5034.
def source124 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B013.Data.entryAt ⟨54, by decide +kernel⟩

def target124 : Weights.Entry :=
  { word := [2, 0, 8, 9, 4, 12, 4], weights := [1, 0, 1, 1] }

-- Period 8, original row 2480, representative 5056.
def source125 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B013.Data.entryAt ⟨76, by decide +kernel⟩

def target125 : Weights.Entry :=
  { word := [2, 0, 8, 9, 12, 4, 4], weights := [1, 0, 1, 1] }

-- Period 8, original row 2482, representative 5033.
def source126 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B013.Data.entryAt ⟨53, by decide +kernel⟩

def target126 : Weights.Entry :=
  { word := [2, 0, 8, 9, 12, 12, 4], weights := [1, 0, 1, 1] }

-- Period 8, original row 2489, representative 5055.
def source127 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B013.Data.entryAt ⟨75, by decide +kernel⟩

def target127 : Weights.Entry :=
  { word := [2, 0, 8, 12, 0, 4, 4], weights := [1, 0, 1, 0] }

def period8Entries : List Weights.Entry := [target0, target1, target2, target3, target4, target5, target6, target7, target8, target9, target10, target11, target12, target13, target14, target15, target16, target17, target18, target19, target20, target21, target22, target23, target24, target25, target26, target27, target28, target29, target30, target31, target32, target33, target34, target35, target36, target37, target38, target39, target40, target41, target42, target43, target44, target45, target46, target47, target48, target49, target50, target51, target52, target53, target54, target55, target56, target57, target58, target59, target60, target61, target62, target63, target64, target65, target66, target67, target68, target69, target70, target71, target72, target73, target74, target75, target76, target77, target78, target79, target80, target81, target82, target83, target84, target85, target86, target87, target88, target89, target90, target91, target92, target93, target94, target95, target96, target97, target98, target99, target100, target101, target102, target103, target104, target105, target106, target107, target108, target109, target110, target111, target112, target113, target114, target115, target116, target117, target118, target119, target120, target121, target122, target123, target124, target125, target126, target127]

def period8Chunk : RowCoverage.Chunk where
  rows := [⟨4, target0⟩, ⟨5, target1⟩, ⟨6, target2⟩, ⟨26, target3⟩, ⟨27, target4⟩, ⟨28, target5⟩, ⟨50, target6⟩, ⟨51, target7⟩, ⟨52, target8⟩, ⟨65, target9⟩, ⟨66, target10⟩, ⟨67, target11⟩, ⟨556, target12⟩, ⟨557, target13⟩, ⟨558, target14⟩, ⟨570, target15⟩, ⟨571, target16⟩, ⟨572, target17⟩, ⟨583, target18⟩, ⟨584, target19⟩, ⟨606, target20⟩, ⟨607, target21⟩, ⟨608, target22⟩, ⟨620, target23⟩, ⟨621, target24⟩, ⟨622, target25⟩, ⟨639, target26⟩, ⟨640, target27⟩, ⟨641, target28⟩, ⟨667, target29⟩, ⟨728, target30⟩, ⟨729, target31⟩, ⟨730, target32⟩, ⟨817, target33⟩, ⟨818, target34⟩, ⟨819, target35⟩, ⟨843, target36⟩, ⟨844, target37⟩, ⟨845, target38⟩, ⟨896, target39⟩, ⟨897, target40⟩, ⟨898, target41⟩, ⟨920, target42⟩, ⟨942, target43⟩, ⟨943, target44⟩, ⟨944, target45⟩, ⟨959, target46⟩, ⟨972, target47⟩, ⟨973, target48⟩, ⟨974, target49⟩, ⟨986, target50⟩, ⟨988, target51⟩, ⟨1509, target52⟩, ⟨1555, target53⟩, ⟨1569, target54⟩, ⟨1582, target55⟩, ⟨1605, target56⟩, ⟨1619, target57⟩, ⟨1638, target58⟩, ⟨1727, target59⟩, ⟨1741, target60⟩, ⟨1742, target61⟩, ⟨1743, target62⟩, ⟨1763, target63⟩, ⟨1764, target64⟩, ⟨1765, target65⟩, ⟨1787, target66⟩, ⟨1788, target67⟩, ⟨1789, target68⟩, ⟨1802, target69⟩, ⟨1803, target70⟩, ⟨1804, target71⟩, ⟨1845, target72⟩, ⟨1846, target73⟩, ⟨1847, target74⟩, ⟨1859, target75⟩, ⟨1860, target76⟩, ⟨1861, target77⟩, ⟨1872, target78⟩, ⟨1873, target79⟩, ⟨1895, target80⟩, ⟨1896, target81⟩, ⟨1897, target82⟩, ⟨1909, target83⟩, ⟨1910, target84⟩, ⟨1911, target85⟩, ⟨1923, target86⟩, ⟨1924, target87⟩, ⟨1925, target88⟩, ⟨1951, target89⟩, ⟨2012, target90⟩, ⟨2013, target91⟩, ⟨2014, target92⟩, ⟨2026, target93⟩, ⟨2027, target94⟩, ⟨2028, target95⟩, ⟨2050, target96⟩, ⟨2072, target97⟩, ⟨2073, target98⟩, ⟨2074, target99⟩, ⟨2089, target100⟩, ⟨2102, target101⟩, ⟨2103, target102⟩, ⟨2104, target103⟩, ⟨2116, target104⟩, ⟨2118, target105⟩, ⟨2204, target106⟩, ⟨2218, target107⟩, ⟨2231, target108⟩, ⟨2254, target109⟩, ⟨2268, target110⟩, ⟨2282, target111⟩, ⟨2371, target112⟩, ⟨2412, target113⟩, ⟨2423, target114⟩, ⟨2435, target115⟩, ⟨2442, target116⟩, ⟨2443, target117⟩, ⟨2448, target118⟩, ⟨2450, target119⟩, ⟨2453, target120⟩, ⟨2472, target121⟩, ⟨2474, target122⟩, ⟨2476, target123⟩, ⟨2478, target124⟩, ⟨2480, target125⟩, ⟨2482, target126⟩, ⟨2489, target127⟩]
  indexMask := 185420870569025726410150007170761023957780246020735046993303993634184088111971440342074406043032841976864020496802725330373726249971901150593059409438506543741026934646494089834887190639290350188336929079057478781974398075741585416830897904404662717532125529950225867094922106994152312343205895569526696400823790354519782951017757129907547815879100856119749227114857263615829965761131414893253218493403692046001098031207262342052280661723840508319591916866336844395008615484834060342741679786598412835007740499778551038856084104371260880790901798722023147561001887451145037336925541271502987233584413791974786282849759979195385419650145669260118564504783260060626889915085124251208618036124902104800953167335591630613082641684761921529291920495345776
  count := 128

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem period8Chunk_entries :
    period8Chunk.rows.map RowCoverage.TaggedRow.entry = period8Entries := rfl

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem period8_index_check :
    RowCoverage.indexCheck CanonicalWords.count period8Chunk = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem period8_words_check :
    RowCoverage.wordsCheck CanonicalWords.wordAt period8Chunk = true := by
  decide +kernel

end FranklSmallCyclic.TransportBatches.G039.B000.Data
