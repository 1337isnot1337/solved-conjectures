module

public import Conjectures.FranklSmallCyclicRowCoverage
public import Conjectures.FranklSmallCyclicCanonicalWords
public import Conjectures.FranklSmallCyclicOrbit10Block022Data

/-! 128 literal targets sharing one source proof block.
Original words and row indices are retained; weights may be transported.
-/
@[expose] public section

namespace FranklSmallCyclic.TransportBatches.G100.B000.Data

-- Period 10, original row 2406, representative 10876.
def source0 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B022.Data.entryAt ⟨20, by decide +kernel⟩

def target0 : Weights.Entry :=
  { word := [2, 0, 4, 2, 0, 1, 8], weights := [1, 0, 0, 1] }

-- Period 10, original row 2408, representative 10876.
def source1 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B022.Data.entryAt ⟨20, by decide +kernel⟩

def target1 : Weights.Entry :=
  { word := [2, 0, 4, 2, 0, 2, 8], weights := [1, 0, 0, 1] }

def points1 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 8), (8, 7), (9, 9)]

-- Period 10, original row 2413, representative 10884.
def source2 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B022.Data.entryAt ⟨28, by decide +kernel⟩

def target2 : Weights.Entry :=
  { word := [2, 0, 4, 2, 0, 8, 8], weights := [1, 0, 0, 1] }

-- Period 10, original row 2418, representative 10860.
def source3 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B022.Data.entryAt ⟨4, by decide +kernel⟩

def target3 : Weights.Entry :=
  { word := [2, 0, 4, 2, 0, 9, 8], weights := [1, 0, 0, 1] }

-- Period 10, original row 2420, representative 10860.
def source4 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B022.Data.entryAt ⟨4, by decide +kernel⟩

def target4 : Weights.Entry :=
  { word := [2, 0, 4, 2, 0, 10, 8], weights := [1, 0, 0, 1] }

def points4 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 8), (8, 7), (9, 9)]

-- Period 10, original row 2422, representative 10881.
def source5 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B022.Data.entryAt ⟨25, by decide +kernel⟩

def target5 : Weights.Entry :=
  { word := [2, 0, 4, 2, 8, 2, 8], weights := [1, 0, 0, 1] }

-- Period 10, original row 2426, representative 10865.
def source6 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B022.Data.entryAt ⟨9, by decide +kernel⟩

def target6 : Weights.Entry :=
  { word := [2, 0, 4, 2, 8, 10, 8], weights := [1, 0, 0, 1] }

-- Period 10, original row 2428, representative 10876.
def source7 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B022.Data.entryAt ⟨20, by decide +kernel⟩

def target7 : Weights.Entry :=
  { word := [2, 0, 4, 4, 4, 0, 8], weights := [1, 0, 0, 1] }

def points7 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 5), (5, 4), (6, 6), (7, 7), (8, 8), (9, 9)]

-- Period 10, original row 2430, representative 10868.
def source8 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B022.Data.entryAt ⟨12, by decide +kernel⟩

def target8 : Weights.Entry :=
  { word := [2, 0, 4, 4, 4, 8, 8], weights := [1, 0, 0, 1] }

-- Period 10, original row 2431, representative 10883.
def source9 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B022.Data.entryAt ⟨27, by decide +kernel⟩

def target9 : Weights.Entry :=
  { word := [2, 0, 4, 10, 0, 1, 8], weights := [1, 0, 0, 1] }

-- Period 10, original row 2432, representative 10883.
def source10 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B022.Data.entryAt ⟨27, by decide +kernel⟩

def target10 : Weights.Entry :=
  { word := [2, 0, 4, 10, 0, 2, 8], weights := [1, 0, 0, 1] }

def points10 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 8), (8, 7), (9, 9)]

-- Period 10, original row 2436, representative 10887.
def source11 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B022.Data.entryAt ⟨31, by decide +kernel⟩

def target11 : Weights.Entry :=
  { word := [2, 0, 4, 10, 0, 8, 8], weights := [1, 0, 0, 1] }

-- Period 10, original row 2440, representative 10867.
def source12 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B022.Data.entryAt ⟨11, by decide +kernel⟩

def target12 : Weights.Entry :=
  { word := [2, 0, 4, 10, 0, 9, 8], weights := [1, 0, 0, 1] }

-- Period 10, original row 2441, representative 10867.
def source13 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B022.Data.entryAt ⟨11, by decide +kernel⟩

def target13 : Weights.Entry :=
  { word := [2, 0, 4, 10, 0, 10, 8], weights := [1, 0, 0, 1] }

def points13 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 8), (8, 7), (9, 9)]

-- Period 10, original row 2447, representative 10882.
def source14 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B022.Data.entryAt ⟨26, by decide +kernel⟩

def target14 : Weights.Entry :=
  { word := [2, 0, 4, 10, 8, 2, 8], weights := [1, 0, 0, 1] }

-- Period 10, original row 2452, representative 10866.
def source15 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B022.Data.entryAt ⟨10, by decide +kernel⟩

def target15 : Weights.Entry :=
  { word := [2, 0, 4, 10, 8, 10, 8], weights := [1, 0, 0, 1] }

-- Period 10, original row 2455, representative 10883.
def source16 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B022.Data.entryAt ⟨27, by decide +kernel⟩

def target16 : Weights.Entry :=
  { word := [2, 0, 4, 12, 4, 0, 8], weights := [1, 0, 0, 1] }

def points16 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 5), (5, 4), (6, 6), (7, 7), (8, 8), (9, 9)]

-- Period 10, original row 2457, representative 10871.
def source17 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B022.Data.entryAt ⟨15, by decide +kernel⟩

def target17 : Weights.Entry :=
  { word := [2, 0, 4, 12, 4, 8, 8], weights := [1, 0, 0, 1] }

-- Period 10, original row 2461, representative 10872.
def source18 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B022.Data.entryAt ⟨16, by decide +kernel⟩

def target18 : Weights.Entry :=
  { word := [2, 0, 8, 2, 2, 2, 8], weights := [1, 0, 0, 1] }

-- Period 10, original row 2463, representative 10856.
def source19 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B022.Data.entryAt ⟨0, by decide +kernel⟩

def target19 : Weights.Entry :=
  { word := [2, 0, 8, 2, 2, 10, 8], weights := [1, 0, 0, 1] }

-- Period 10, original row 2465, representative 10873.
def source20 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B022.Data.entryAt ⟨17, by decide +kernel⟩

def target20 : Weights.Entry :=
  { word := [2, 0, 8, 2, 10, 2, 8], weights := [1, 0, 0, 1] }

-- Period 10, original row 2467, representative 10857.
def source21 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B022.Data.entryAt ⟨1, by decide +kernel⟩

def target21 : Weights.Entry :=
  { word := [2, 0, 8, 2, 10, 10, 8], weights := [1, 0, 0, 1] }

-- Period 10, original row 2484, representative 10875.
def source22 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B022.Data.entryAt ⟨19, by decide +kernel⟩

def target22 : Weights.Entry :=
  { word := [2, 0, 8, 10, 2, 2, 8], weights := [1, 0, 0, 1] }

-- Period 10, original row 2485, representative 10859.
def source23 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B022.Data.entryAt ⟨3, by decide +kernel⟩

def target23 : Weights.Entry :=
  { word := [2, 0, 8, 10, 2, 10, 8], weights := [1, 0, 0, 1] }

-- Period 10, original row 2486, representative 10874.
def source24 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B022.Data.entryAt ⟨18, by decide +kernel⟩

def target24 : Weights.Entry :=
  { word := [2, 0, 8, 10, 10, 2, 8], weights := [1, 0, 0, 1] }

-- Period 10, original row 2487, representative 10858.
def source25 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B022.Data.entryAt ⟨2, by decide +kernel⟩

def target25 : Weights.Entry :=
  { word := [2, 0, 8, 10, 10, 10, 8], weights := [1, 0, 0, 1] }

-- Period 10, original row 2523, representative 10877.
def source26 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B022.Data.entryAt ⟨21, by decide +kernel⟩

def target26 : Weights.Entry :=
  { word := [2, 0, 12, 2, 0, 1, 8], weights := [1, 0, 0, 1] }

-- Period 10, original row 2525, representative 10877.
def source27 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B022.Data.entryAt ⟨21, by decide +kernel⟩

def target27 : Weights.Entry :=
  { word := [2, 0, 12, 2, 0, 2, 8], weights := [1, 0, 0, 1] }

def points27 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 8), (8, 7), (9, 9)]

-- Period 10, original row 2530, representative 10885.
def source28 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B022.Data.entryAt ⟨29, by decide +kernel⟩

def target28 : Weights.Entry :=
  { word := [2, 0, 12, 2, 0, 8, 8], weights := [1, 0, 0, 1] }

-- Period 10, original row 2535, representative 10861.
def source29 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B022.Data.entryAt ⟨5, by decide +kernel⟩

def target29 : Weights.Entry :=
  { word := [2, 0, 12, 2, 0, 9, 8], weights := [1, 0, 0, 1] }

-- Period 10, original row 2537, representative 10861.
def source30 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B022.Data.entryAt ⟨5, by decide +kernel⟩

def target30 : Weights.Entry :=
  { word := [2, 0, 12, 2, 0, 10, 8], weights := [1, 0, 0, 1] }

def points30 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 8), (8, 7), (9, 9)]

-- Period 10, original row 2539, representative 10878.
def source31 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B022.Data.entryAt ⟨22, by decide +kernel⟩

def target31 : Weights.Entry :=
  { word := [2, 0, 12, 2, 8, 2, 8], weights := [1, 0, 0, 1] }

-- Period 10, original row 2543, representative 10862.
def source32 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B022.Data.entryAt ⟨6, by decide +kernel⟩

def target32 : Weights.Entry :=
  { word := [2, 0, 12, 2, 8, 10, 8], weights := [1, 0, 0, 1] }

-- Period 10, original row 2545, representative 10877.
def source33 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B022.Data.entryAt ⟨21, by decide +kernel⟩

def target33 : Weights.Entry :=
  { word := [2, 0, 12, 4, 4, 0, 8], weights := [1, 0, 0, 1] }

def points33 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 5), (5, 4), (6, 6), (7, 7), (8, 8), (9, 9)]

-- Period 10, original row 2547, representative 10869.
def source34 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B022.Data.entryAt ⟨13, by decide +kernel⟩

def target34 : Weights.Entry :=
  { word := [2, 0, 12, 4, 4, 8, 8], weights := [1, 0, 0, 1] }

-- Period 10, original row 2548, representative 10880.
def source35 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B022.Data.entryAt ⟨24, by decide +kernel⟩

def target35 : Weights.Entry :=
  { word := [2, 0, 12, 10, 0, 1, 8], weights := [1, 0, 0, 1] }

-- Period 10, original row 2549, representative 10880.
def source36 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B022.Data.entryAt ⟨24, by decide +kernel⟩

def target36 : Weights.Entry :=
  { word := [2, 0, 12, 10, 0, 2, 8], weights := [1, 0, 0, 1] }

def points36 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 8), (8, 7), (9, 9)]

-- Period 10, original row 2558, representative 10886.
def source37 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B022.Data.entryAt ⟨30, by decide +kernel⟩

def target37 : Weights.Entry :=
  { word := [2, 0, 12, 10, 0, 8, 8], weights := [1, 0, 0, 1] }

-- Period 10, original row 2562, representative 10864.
def source38 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B022.Data.entryAt ⟨8, by decide +kernel⟩

def target38 : Weights.Entry :=
  { word := [2, 0, 12, 10, 0, 9, 8], weights := [1, 0, 0, 1] }

-- Period 10, original row 2563, representative 10864.
def source39 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B022.Data.entryAt ⟨8, by decide +kernel⟩

def target39 : Weights.Entry :=
  { word := [2, 0, 12, 10, 0, 10, 8], weights := [1, 0, 0, 1] }

def points39 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 8), (8, 7), (9, 9)]

-- Period 10, original row 2569, representative 10879.
def source40 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B022.Data.entryAt ⟨23, by decide +kernel⟩

def target40 : Weights.Entry :=
  { word := [2, 0, 12, 10, 8, 2, 8], weights := [1, 0, 0, 1] }

-- Period 10, original row 2574, representative 10863.
def source41 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B022.Data.entryAt ⟨7, by decide +kernel⟩

def target41 : Weights.Entry :=
  { word := [2, 0, 12, 10, 8, 10, 8], weights := [1, 0, 0, 1] }

-- Period 10, original row 2577, representative 10880.
def source42 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B022.Data.entryAt ⟨24, by decide +kernel⟩

def target42 : Weights.Entry :=
  { word := [2, 0, 12, 12, 4, 0, 8], weights := [1, 0, 0, 1] }

def points42 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 5), (5, 4), (6, 6), (7, 7), (8, 8), (9, 9)]

-- Period 10, original row 2579, representative 10870.
def source43 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B022.Data.entryAt ⟨14, by decide +kernel⟩

def target43 : Weights.Entry :=
  { word := [2, 0, 12, 12, 4, 8, 8], weights := [1, 0, 0, 1] }

-- Period 10, original row 4102, representative 10915.
def source44 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B022.Data.entryAt ⟨59, by decide +kernel⟩

def target44 : Weights.Entry :=
  { word := [8, 0, 0, 2, 2, 10, 8], weights := [1, 0, 0, 1] }

-- Period 10, original row 4125, representative 10876.
def source45 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B022.Data.entryAt ⟨20, by decide +kernel⟩

def target45 : Weights.Entry :=
  { word := [8, 0, 1, 4, 2, 0, 4], weights := [1, 0, 0, 1] }

def points45 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 0), (9, 1)]

-- Period 10, original row 4147, representative 10877.
def source46 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B022.Data.entryAt ⟨21, by decide +kernel⟩

def target46 : Weights.Entry :=
  { word := [8, 0, 1, 4, 10, 0, 4], weights := [1, 0, 0, 1] }

def points46 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 0), (9, 1)]

-- Period 10, original row 4161, representative 10883.
def source47 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B022.Data.entryAt ⟨27, by decide +kernel⟩

def target47 : Weights.Entry :=
  { word := [8, 0, 1, 12, 2, 0, 4], weights := [1, 0, 0, 1] }

def points47 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 0), (9, 1)]

-- Period 10, original row 4183, representative 10880.
def source48 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B022.Data.entryAt ⟨24, by decide +kernel⟩

def target48 : Weights.Entry :=
  { word := [8, 0, 1, 12, 10, 0, 4], weights := [1, 0, 0, 1] }

def points48 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 0), (9, 1)]

-- Period 10, original row 4197, representative 10876.
def source49 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B022.Data.entryAt ⟨20, by decide +kernel⟩

def target49 : Weights.Entry :=
  { word := [8, 0, 2, 2, 2, 0, 4], weights := [1, 0, 0, 1] }

def points49 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 4), (5, 5), (6, 3), (7, 2), (8, 0), (9, 1)]

-- Period 10, original row 4212, representative 10877.
def source50 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B022.Data.entryAt ⟨21, by decide +kernel⟩

def target50 : Weights.Entry :=
  { word := [8, 0, 2, 2, 10, 0, 4], weights := [1, 0, 0, 1] }

def points50 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 4), (5, 5), (6, 3), (7, 2), (8, 0), (9, 1)]

-- Period 10, original row 4227, representative 10883.
def source51 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B022.Data.entryAt ⟨27, by decide +kernel⟩

def target51 : Weights.Entry :=
  { word := [8, 0, 2, 10, 2, 0, 4], weights := [1, 0, 0, 1] }

def points51 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 4), (5, 5), (6, 3), (7, 2), (8, 0), (9, 1)]

-- Period 10, original row 4241, representative 10880.
def source52 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B022.Data.entryAt ⟨24, by decide +kernel⟩

def target52 : Weights.Entry :=
  { word := [8, 0, 2, 10, 10, 0, 4], weights := [1, 0, 0, 1] }

def points52 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 4), (5, 5), (6, 3), (7, 2), (8, 0), (9, 1)]

-- Period 10, original row 4286, representative 10898.
def source53 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B022.Data.entryAt ⟨42, by decide +kernel⟩

def target53 : Weights.Entry :=
  { word := [8, 0, 4, 8, 4, 10, 8], weights := [0, 1, 1, 0] }

-- Period 10, original row 4350, representative 10918.
def source54 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B022.Data.entryAt ⟨62, by decide +kernel⟩

def target54 : Weights.Entry :=
  { word := [8, 0, 8, 2, 2, 10, 8], weights := [1, 0, 0, 1] }

-- Period 10, original row 4354, representative 10916.
def source55 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B022.Data.entryAt ⟨60, by decide +kernel⟩

def target55 : Weights.Entry :=
  { word := [8, 0, 8, 2, 10, 10, 8], weights := [1, 0, 0, 1] }

-- Period 10, original row 4373, representative 10919.
def source56 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B022.Data.entryAt ⟨63, by decide +kernel⟩

def target56 : Weights.Entry :=
  { word := [8, 0, 8, 10, 2, 10, 8], weights := [0, 1, 1, 0] }

-- Period 10, original row 4375, representative 10917.
def source57 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B022.Data.entryAt ⟨61, by decide +kernel⟩

def target57 : Weights.Entry :=
  { word := [8, 0, 8, 10, 10, 10, 8], weights := [0, 1, 1, 0] }

-- Period 10, original row 4458, representative 10897.
def source58 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B022.Data.entryAt ⟨41, by decide +kernel⟩

def target58 : Weights.Entry :=
  { word := [8, 0, 12, 8, 4, 10, 8], weights := [0, 1, 1, 0] }

-- Period 10, original row 5004, representative 10876.
def source59 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B022.Data.entryAt ⟨20, by decide +kernel⟩

def target59 : Weights.Entry :=
  { word := [8, 4, 0, 4, 2, 0, 4], weights := [1, 0, 0, 1] }

def points59 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 0), (9, 2)]

-- Period 10, original row 5026, representative 10877.
def source60 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B022.Data.entryAt ⟨21, by decide +kernel⟩

def target60 : Weights.Entry :=
  { word := [8, 4, 0, 4, 10, 0, 4], weights := [1, 0, 0, 1] }

def points60 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 0), (9, 2)]

-- Period 10, original row 5040, representative 10883.
def source61 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B022.Data.entryAt ⟨27, by decide +kernel⟩

def target61 : Weights.Entry :=
  { word := [8, 4, 0, 12, 2, 0, 4], weights := [1, 0, 0, 1] }

def points61 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 0), (9, 2)]

-- Period 10, original row 5062, representative 10880.
def source62 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B022.Data.entryAt ⟨24, by decide +kernel⟩

def target62 : Weights.Entry :=
  { word := [8, 4, 0, 12, 10, 0, 4], weights := [1, 0, 0, 1] }

def points62 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 0), (9, 2)]

-- Period 10, original row 5112, representative 10872.
def source63 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B022.Data.entryAt ⟨16, by decide +kernel⟩

def target63 : Weights.Entry :=
  { word := [8, 4, 4, 4, 8, 0, 4], weights := [1, 0, 0, 1] }

def points63 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 5140, representative 10875.
def source64 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B022.Data.entryAt ⟨19, by decide +kernel⟩

def target64 : Weights.Entry :=
  { word := [8, 4, 4, 12, 8, 0, 4], weights := [1, 0, 0, 1] }

def points64 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 5159, representative 10881.
def source65 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B022.Data.entryAt ⟨25, by decide +kernel⟩

def target65 : Weights.Entry :=
  { word := [8, 4, 8, 4, 2, 0, 4], weights := [1, 0, 0, 1] }

def points65 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 5185, representative 10878.
def source66 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B022.Data.entryAt ⟨22, by decide +kernel⟩

def target66 : Weights.Entry :=
  { word := [8, 4, 8, 4, 10, 0, 4], weights := [1, 0, 0, 1] }

def points66 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 5201, representative 10882.
def source67 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B022.Data.entryAt ⟨26, by decide +kernel⟩

def target67 : Weights.Entry :=
  { word := [8, 4, 8, 12, 2, 0, 4], weights := [1, 0, 0, 1] }

def points67 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 5227, representative 10879.
def source68 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B022.Data.entryAt ⟨23, by decide +kernel⟩

def target68 : Weights.Entry :=
  { word := [8, 4, 8, 12, 10, 0, 4], weights := [1, 0, 0, 1] }

def points68 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 5262, representative 10873.
def source69 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B022.Data.entryAt ⟨17, by decide +kernel⟩

def target69 : Weights.Entry :=
  { word := [8, 4, 12, 4, 8, 0, 4], weights := [1, 0, 0, 1] }

def points69 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 5283, representative 10874.
def source70 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B022.Data.entryAt ⟨18, by decide +kernel⟩

def target70 : Weights.Entry :=
  { word := [8, 4, 12, 12, 8, 0, 4], weights := [1, 0, 0, 1] }

def points70 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 5322, representative 10895.
def source71 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B022.Data.entryAt ⟨39, by decide +kernel⟩

def target71 : Weights.Entry :=
  { word := [8, 8, 0, 1, 4, 10, 8], weights := [1, 2, 1, 0] }

-- Period 10, original row 5328, representative 10893.
def source72 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B022.Data.entryAt ⟨37, by decide +kernel⟩

def target72 : Weights.Entry :=
  { word := [8, 8, 0, 1, 12, 10, 8], weights := [1, 2, 1, 0] }

-- Period 10, original row 5332, representative 10899.
def source73 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B022.Data.entryAt ⟨43, by decide +kernel⟩

def target73 : Weights.Entry :=
  { word := [8, 8, 0, 2, 2, 10, 8], weights := [1, 0, 0, 1] }

-- Period 10, original row 5336, representative 10900.
def source74 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B022.Data.entryAt ⟨44, by decide +kernel⟩

def target74 : Weights.Entry :=
  { word := [8, 8, 0, 2, 10, 10, 8], weights := [1, 0, 0, 1] }

-- Period 10, original row 5343, representative 10884.
def source75 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B022.Data.entryAt ⟨28, by decide +kernel⟩

def target75 : Weights.Entry :=
  { word := [8, 8, 0, 4, 2, 0, 4], weights := [1, 0, 0, 1] }

def points75 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2), (9, 0)]

-- Period 10, original row 5369, representative 10885.
def source76 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B022.Data.entryAt ⟨29, by decide +kernel⟩

def target76 : Weights.Entry :=
  { word := [8, 8, 0, 4, 10, 0, 4], weights := [1, 0, 0, 1] }

def points76 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2), (9, 0)]

-- Period 10, original row 5394, representative 10906.
def source77 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B022.Data.entryAt ⟨50, by decide +kernel⟩

def target77 : Weights.Entry :=
  { word := [8, 8, 0, 10, 2, 10, 8], weights := [1, 0, 0, 1] }

-- Period 10, original row 5396, representative 10903.
def source78 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B022.Data.entryAt ⟨47, by decide +kernel⟩

def target78 : Weights.Entry :=
  { word := [8, 8, 0, 10, 10, 10, 8], weights := [1, 0, 0, 1] }

-- Period 10, original row 5407, representative 10887.
def source79 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B022.Data.entryAt ⟨31, by decide +kernel⟩

def target79 : Weights.Entry :=
  { word := [8, 8, 0, 12, 2, 0, 4], weights := [1, 0, 0, 1] }

def points79 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2), (9, 0)]

-- Period 10, original row 5432, representative 10886.
def source80 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B022.Data.entryAt ⟨30, by decide +kernel⟩

def target80 : Weights.Entry :=
  { word := [8, 8, 0, 12, 10, 0, 4], weights := [1, 0, 0, 1] }

def points80 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2), (9, 0)]

-- Period 10, original row 5446, representative 10860.
def source81 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B022.Data.entryAt ⟨4, by decide +kernel⟩

def target81 : Weights.Entry :=
  { word := [8, 8, 1, 4, 2, 0, 4], weights := [1, 0, 0, 1] }

def points81 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 5453, representative 10907.
def source82 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B022.Data.entryAt ⟨51, by decide +kernel⟩

def target82 : Weights.Entry :=
  { word := [8, 8, 1, 4, 2, 8, 8], weights := [1, 0, 1, 0] }

-- Period 10, original row 5468, representative 10861.
def source83 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B022.Data.entryAt ⟨5, by decide +kernel⟩

def target83 : Weights.Entry :=
  { word := [8, 8, 1, 4, 10, 0, 4], weights := [1, 0, 0, 1] }

def points83 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 5475, representative 10912.
def source84 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B022.Data.entryAt ⟨56, by decide +kernel⟩

def target84 : Weights.Entry :=
  { word := [8, 8, 1, 4, 10, 8, 8], weights := [1, 0, 1, 0] }

-- Period 10, original row 5482, representative 10867.
def source85 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B022.Data.entryAt ⟨11, by decide +kernel⟩

def target85 : Weights.Entry :=
  { word := [8, 8, 1, 12, 2, 0, 4], weights := [1, 0, 0, 1] }

def points85 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 5489, representative 10914.
def source86 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B022.Data.entryAt ⟨58, by decide +kernel⟩

def target86 : Weights.Entry :=
  { word := [8, 8, 1, 12, 2, 8, 8], weights := [1, 0, 1, 0] }

-- Period 10, original row 5504, representative 10864.
def source87 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B022.Data.entryAt ⟨8, by decide +kernel⟩

def target87 : Weights.Entry :=
  { word := [8, 8, 1, 12, 10, 0, 4], weights := [1, 0, 0, 1] }

def points87 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 5511, representative 10913.
def source88 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B022.Data.entryAt ⟨57, by decide +kernel⟩

def target88 : Weights.Entry :=
  { word := [8, 8, 1, 12, 10, 8, 8], weights := [1, 0, 1, 0] }

-- Period 10, original row 5518, representative 10868.
def source89 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B022.Data.entryAt ⟨12, by decide +kernel⟩

def target89 : Weights.Entry :=
  { word := [8, 8, 2, 2, 2, 0, 4], weights := [1, 0, 0, 1] }

def points89 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 5533, representative 10869.
def source90 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B022.Data.entryAt ⟨13, by decide +kernel⟩

def target90 : Weights.Entry :=
  { word := [8, 8, 2, 2, 10, 0, 4], weights := [1, 0, 0, 1] }

def points90 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 5548, representative 10871.
def source91 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B022.Data.entryAt ⟨15, by decide +kernel⟩

def target91 : Weights.Entry :=
  { word := [8, 8, 2, 10, 2, 0, 4], weights := [1, 0, 0, 1] }

def points91 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 5562, representative 10870.
def source92 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B022.Data.entryAt ⟨14, by decide +kernel⟩

def target92 : Weights.Entry :=
  { word := [8, 8, 2, 10, 10, 0, 4], weights := [1, 0, 0, 1] }

def points92 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 5587, representative 10907.
def source93 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B022.Data.entryAt ⟨51, by decide +kernel⟩

def target93 : Weights.Entry :=
  { word := [8, 8, 4, 2, 0, 9, 8], weights := [0, 1, 0, 1] }

def points93 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 5589, representative 10907.
def source94 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B022.Data.entryAt ⟨51, by decide +kernel⟩

def target94 : Weights.Entry :=
  { word := [8, 8, 4, 2, 0, 10, 8], weights := [0, 1, 0, 1] }

def points94 : List (ℕ × ℕ) := [(0, 9), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 5595, representative 10908.
def source95 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B022.Data.entryAt ⟨52, by decide +kernel⟩

def target95 : Weights.Entry :=
  { word := [8, 8, 4, 2, 8, 10, 8], weights := [1, 0, 0, 1] }

-- Period 10, original row 5611, representative 10892.
def source96 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B022.Data.entryAt ⟨36, by decide +kernel⟩

def target96 : Weights.Entry :=
  { word := [8, 8, 4, 8, 4, 10, 8], weights := [0, 1, 1, 0] }

-- Period 10, original row 5615, representative 10890.
def source97 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B022.Data.entryAt ⟨34, by decide +kernel⟩

def target97 : Weights.Entry :=
  { word := [8, 8, 4, 8, 12, 10, 8], weights := [0, 1, 1, 0] }

-- Period 10, original row 5625, representative 10914.
def source98 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B022.Data.entryAt ⟨58, by decide +kernel⟩

def target98 : Weights.Entry :=
  { word := [8, 8, 4, 10, 0, 9, 8], weights := [0, 1, 0, 1] }

def points98 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 5626, representative 10914.
def source99 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B022.Data.entryAt ⟨58, by decide +kernel⟩

def target99 : Weights.Entry :=
  { word := [8, 8, 4, 10, 0, 10, 8], weights := [0, 1, 0, 1] }

def points99 : List (ℕ × ℕ) := [(0, 9), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 5632, representative 10911.
def source100 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B022.Data.entryAt ⟨55, by decide +kernel⟩

def target100 : Weights.Entry :=
  { word := [8, 8, 4, 10, 8, 10, 8], weights := [0, 1, 1, 0] }

-- Period 10, original row 5676, representative 10896.
def source101 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B022.Data.entryAt ⟨40, by decide +kernel⟩

def target101 : Weights.Entry :=
  { word := [8, 8, 8, 1, 4, 10, 8], weights := [1, 2, 1, 0] }

-- Period 10, original row 5682, representative 10894.
def source102 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B022.Data.entryAt ⟨38, by decide +kernel⟩

def target102 : Weights.Entry :=
  { word := [8, 8, 8, 1, 12, 10, 8], weights := [1, 2, 1, 0] }

-- Period 10, original row 5686, representative 10904.
def source103 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B022.Data.entryAt ⟨48, by decide +kernel⟩

def target103 : Weights.Entry :=
  { word := [8, 8, 8, 2, 2, 10, 8], weights := [1, 0, 0, 1] }

-- Period 10, original row 5690, representative 10901.
def source104 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B022.Data.entryAt ⟨45, by decide +kernel⟩

def target104 : Weights.Entry :=
  { word := [8, 8, 8, 2, 10, 10, 8], weights := [1, 0, 0, 1] }

-- Period 10, original row 5711, representative 10888.
def source105 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B022.Data.entryAt ⟨32, by decide +kernel⟩

def target105 : Weights.Entry :=
  { word := [8, 8, 8, 8, 6, 10, 8], weights := [0, 1, 1, 0] }

-- Period 10, original row 5722, representative 10905.
def source106 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B022.Data.entryAt ⟨49, by decide +kernel⟩

def target106 : Weights.Entry :=
  { word := [8, 8, 8, 10, 2, 10, 8], weights := [0, 1, 1, 0] }

-- Period 10, original row 5724, representative 10902.
def source107 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B022.Data.entryAt ⟨46, by decide +kernel⟩

def target107 : Weights.Entry :=
  { word := [8, 8, 8, 10, 10, 10, 8], weights := [0, 1, 1, 0] }

-- Period 10, original row 5795, representative 10912.
def source108 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B022.Data.entryAt ⟨56, by decide +kernel⟩

def target108 : Weights.Entry :=
  { word := [8, 8, 12, 2, 0, 9, 8], weights := [0, 1, 0, 1] }

def points108 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 5797, representative 10912.
def source109 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B022.Data.entryAt ⟨56, by decide +kernel⟩

def target109 : Weights.Entry :=
  { word := [8, 8, 12, 2, 0, 10, 8], weights := [0, 1, 0, 1] }

def points109 : List (ℕ × ℕ) := [(0, 9), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 5803, representative 10909.
def source110 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B022.Data.entryAt ⟨53, by decide +kernel⟩

def target110 : Weights.Entry :=
  { word := [8, 8, 12, 2, 8, 10, 8], weights := [1, 0, 0, 1] }

-- Period 10, original row 5818, representative 10891.
def source111 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B022.Data.entryAt ⟨35, by decide +kernel⟩

def target111 : Weights.Entry :=
  { word := [8, 8, 12, 8, 4, 10, 8], weights := [0, 1, 1, 0] }

-- Period 10, original row 5822, representative 10889.
def source112 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B022.Data.entryAt ⟨33, by decide +kernel⟩

def target112 : Weights.Entry :=
  { word := [8, 8, 12, 8, 12, 10, 8], weights := [0, 1, 1, 0] }

-- Period 10, original row 5832, representative 10913.
def source113 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B022.Data.entryAt ⟨57, by decide +kernel⟩

def target113 : Weights.Entry :=
  { word := [8, 8, 12, 10, 0, 9, 8], weights := [0, 1, 0, 1] }

def points113 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 5833, representative 10913.
def source114 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B022.Data.entryAt ⟨57, by decide +kernel⟩

def target114 : Weights.Entry :=
  { word := [8, 8, 12, 10, 0, 10, 8], weights := [0, 1, 0, 1] }

def points114 : List (ℕ × ℕ) := [(0, 9), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 5839, representative 10910.
def source115 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B022.Data.entryAt ⟨54, by decide +kernel⟩

def target115 : Weights.Entry :=
  { word := [8, 8, 12, 10, 8, 10, 8], weights := [0, 1, 1, 0] }

-- Period 10, original row 6334, representative 10860.
def source116 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B022.Data.entryAt ⟨4, by decide +kernel⟩

def target116 : Weights.Entry :=
  { word := [8, 12, 0, 4, 2, 0, 4], weights := [1, 0, 0, 1] }

def points116 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2), (9, 0)]

-- Period 10, original row 6341, representative 10907.
def source117 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B022.Data.entryAt ⟨51, by decide +kernel⟩

def target117 : Weights.Entry :=
  { word := [8, 12, 0, 4, 2, 8, 8], weights := [1, 0, 1, 0] }

def points117 : List (ℕ × ℕ) := [(0, 0), (1, 2), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8), (9, 9)]

-- Period 10, original row 6356, representative 10861.
def source118 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B022.Data.entryAt ⟨5, by decide +kernel⟩

def target118 : Weights.Entry :=
  { word := [8, 12, 0, 4, 10, 0, 4], weights := [1, 0, 0, 1] }

def points118 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2), (9, 0)]

-- Period 10, original row 6363, representative 10912.
def source119 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B022.Data.entryAt ⟨56, by decide +kernel⟩

def target119 : Weights.Entry :=
  { word := [8, 12, 0, 4, 10, 8, 8], weights := [1, 0, 1, 0] }

def points119 : List (ℕ × ℕ) := [(0, 0), (1, 2), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8), (9, 9)]

-- Period 10, original row 6370, representative 10867.
def source120 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B022.Data.entryAt ⟨11, by decide +kernel⟩

def target120 : Weights.Entry :=
  { word := [8, 12, 0, 12, 2, 0, 4], weights := [1, 0, 0, 1] }

def points120 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2), (9, 0)]

-- Period 10, original row 6377, representative 10914.
def source121 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B022.Data.entryAt ⟨58, by decide +kernel⟩

def target121 : Weights.Entry :=
  { word := [8, 12, 0, 12, 2, 8, 8], weights := [1, 0, 1, 0] }

def points121 : List (ℕ × ℕ) := [(0, 0), (1, 2), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8), (9, 9)]

-- Period 10, original row 6392, representative 10864.
def source122 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B022.Data.entryAt ⟨8, by decide +kernel⟩

def target122 : Weights.Entry :=
  { word := [8, 12, 0, 12, 10, 0, 4], weights := [1, 0, 0, 1] }

def points122 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2), (9, 0)]

-- Period 10, original row 6399, representative 10913.
def source123 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B022.Data.entryAt ⟨57, by decide +kernel⟩

def target123 : Weights.Entry :=
  { word := [8, 12, 0, 12, 10, 8, 8], weights := [1, 0, 1, 0] }

def points123 : List (ℕ × ℕ) := [(0, 0), (1, 2), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8), (9, 9)]

-- Period 10, original row 6405, representative 10895.
def source124 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B022.Data.entryAt ⟨39, by decide +kernel⟩

def target124 : Weights.Entry :=
  { word := [8, 12, 2, 0, 1, 8, 8], weights := [0, 1, 2, 1] }

def points124 : List (ℕ × ℕ) := [(0, 9), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 6408, representative 10896.
def source125 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B022.Data.entryAt ⟨40, by decide +kernel⟩

def target125 : Weights.Entry :=
  { word := [8, 12, 2, 0, 9, 8, 8], weights := [0, 1, 2, 1] }

def points125 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 6412, representative 10898.
def source126 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B022.Data.entryAt ⟨42, by decide +kernel⟩

def target126 : Weights.Entry :=
  { word := [8, 12, 2, 8, 2, 0, 8], weights := [0, 1, 1, 0] }

def points126 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 6416, representative 10892.
def source127 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B022.Data.entryAt ⟨36, by decide +kernel⟩

def target127 : Weights.Entry :=
  { word := [8, 12, 2, 8, 2, 8, 8], weights := [0, 1, 1, 0] }

def points127 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

def period10Entries : List Weights.Entry := [target0, target1, target2, target3, target4, target5, target6, target7, target8, target9, target10, target11, target12, target13, target14, target15, target16, target17, target18, target19, target20, target21, target22, target23, target24, target25, target26, target27, target28, target29, target30, target31, target32, target33, target34, target35, target36, target37, target38, target39, target40, target41, target42, target43, target44, target45, target46, target47, target48, target49, target50, target51, target52, target53, target54, target55, target56, target57, target58, target59, target60, target61, target62, target63, target64, target65, target66, target67, target68, target69, target70, target71, target72, target73, target74, target75, target76, target77, target78, target79, target80, target81, target82, target83, target84, target85, target86, target87, target88, target89, target90, target91, target92, target93, target94, target95, target96, target97, target98, target99, target100, target101, target102, target103, target104, target105, target106, target107, target108, target109, target110, target111, target112, target113, target114, target115, target116, target117, target118, target119, target120, target121, target122, target123, target124, target125, target126, target127]

def period10Chunk : RowCoverage.Chunk where
  rows := [⟨2406, target0⟩, ⟨2408, target1⟩, ⟨2413, target2⟩, ⟨2418, target3⟩, ⟨2420, target4⟩, ⟨2422, target5⟩, ⟨2426, target6⟩, ⟨2428, target7⟩, ⟨2430, target8⟩, ⟨2431, target9⟩, ⟨2432, target10⟩, ⟨2436, target11⟩, ⟨2440, target12⟩, ⟨2441, target13⟩, ⟨2447, target14⟩, ⟨2452, target15⟩, ⟨2455, target16⟩, ⟨2457, target17⟩, ⟨2461, target18⟩, ⟨2463, target19⟩, ⟨2465, target20⟩, ⟨2467, target21⟩, ⟨2484, target22⟩, ⟨2485, target23⟩, ⟨2486, target24⟩, ⟨2487, target25⟩, ⟨2523, target26⟩, ⟨2525, target27⟩, ⟨2530, target28⟩, ⟨2535, target29⟩, ⟨2537, target30⟩, ⟨2539, target31⟩, ⟨2543, target32⟩, ⟨2545, target33⟩, ⟨2547, target34⟩, ⟨2548, target35⟩, ⟨2549, target36⟩, ⟨2558, target37⟩, ⟨2562, target38⟩, ⟨2563, target39⟩, ⟨2569, target40⟩, ⟨2574, target41⟩, ⟨2577, target42⟩, ⟨2579, target43⟩, ⟨4102, target44⟩, ⟨4125, target45⟩, ⟨4147, target46⟩, ⟨4161, target47⟩, ⟨4183, target48⟩, ⟨4197, target49⟩, ⟨4212, target50⟩, ⟨4227, target51⟩, ⟨4241, target52⟩, ⟨4286, target53⟩, ⟨4350, target54⟩, ⟨4354, target55⟩, ⟨4373, target56⟩, ⟨4375, target57⟩, ⟨4458, target58⟩, ⟨5004, target59⟩, ⟨5026, target60⟩, ⟨5040, target61⟩, ⟨5062, target62⟩, ⟨5112, target63⟩, ⟨5140, target64⟩, ⟨5159, target65⟩, ⟨5185, target66⟩, ⟨5201, target67⟩, ⟨5227, target68⟩, ⟨5262, target69⟩, ⟨5283, target70⟩, ⟨5322, target71⟩, ⟨5328, target72⟩, ⟨5332, target73⟩, ⟨5336, target74⟩, ⟨5343, target75⟩, ⟨5369, target76⟩, ⟨5394, target77⟩, ⟨5396, target78⟩, ⟨5407, target79⟩, ⟨5432, target80⟩, ⟨5446, target81⟩, ⟨5453, target82⟩, ⟨5468, target83⟩, ⟨5475, target84⟩, ⟨5482, target85⟩, ⟨5489, target86⟩, ⟨5504, target87⟩, ⟨5511, target88⟩, ⟨5518, target89⟩, ⟨5533, target90⟩, ⟨5548, target91⟩, ⟨5562, target92⟩, ⟨5587, target93⟩, ⟨5589, target94⟩, ⟨5595, target95⟩, ⟨5611, target96⟩, ⟨5615, target97⟩, ⟨5625, target98⟩, ⟨5626, target99⟩, ⟨5632, target100⟩, ⟨5676, target101⟩, ⟨5682, target102⟩, ⟨5686, target103⟩, ⟨5690, target104⟩, ⟨5711, target105⟩, ⟨5722, target106⟩, ⟨5724, target107⟩, ⟨5795, target108⟩, ⟨5797, target109⟩, ⟨5803, target110⟩, ⟨5818, target111⟩, ⟨5822, target112⟩, ⟨5832, target113⟩, ⟨5833, target114⟩, ⟨5839, target115⟩, ⟨6334, target116⟩, ⟨6341, target117⟩, ⟨6356, target118⟩, ⟨6363, target119⟩, ⟨6370, target120⟩, ⟨6377, target121⟩, ⟨6392, target122⟩, ⟨6399, target123⟩, ⟨6405, target124⟩, ⟨6408, target125⟩, ⟨6412, target126⟩, ⟨6416, target127⟩]
  indexMask := 273260462473225110217620202241320820359760056078604478130036766364831096832254608514630309045445777371749915140784581209197306395991846989763097145077456708768727216249739206695372754563805986809323725050488164561347616857179349985004614950871883319388545021050763853938503713814766308044151089999113745303031730951579677232952508735807860024662857534552778316286774667206198205223204071320414883215321140962331935591094122823225396126901799139931084762783630813327911322141851470411077787920073545522234722152562022191481696497853779002910050374389369260971103362640717950319584701430654528311960546208574400184912345966436264083672419983841035481443408180606107267603741318860305750112594591569129490036907500655926012315709772541313787150957310561761288429379764834131185787106979611865777808314876159371362611551731287738616620399456480837569337859476800491700933585374960422221992418441970635717213474396040236698527526871470635099392940391788535722285134528822315844205424996038787753948467937330798565242361230005196122320414925411540858491544782308460584961513601820841039564457301516522909406144435994337078546460364234118196327844707316922290855813406061880603616305316285557695466776749396812213862136150226570261879850510256982505344625106843287403082512461793749669238385545791987713491443142117996703890165988201300612478779357080527198316821542905376460629351812486487588615801994637230481722389168708312310117952554354616436301179734503790344875275707149666475701352459296004377068344974801391900928451636657268513830542101102813635731138006769467961017551832795903459147299992152996682952434067399280733633285748283909715656922570712258137287062401225973067132348393277695748377817599416346902948472276391836965554496874880166007050000224519534620850378333794211954745494854750270024922547984373161704991984500846265312853968444579849102531664154098785454927432814311855828487053575093998227289422392884041634283520
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

end FranklSmallCyclic.TransportBatches.G100.B000.Data
