module

public import Conjectures.FranklSmallCyclicRowCoverage
public import Conjectures.FranklSmallCyclicCanonicalWords
public import Conjectures.FranklSmallCyclicOrbit10Block001Data

/-! 128 literal targets sharing one source proof block.
Original words and row indices are retained; weights may be transported.
-/
@[expose] public section

namespace FranklSmallCyclic.TransportBatches.G079.B000.Data

-- Period 10, original row 2445, representative 9555.
def source0 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B001.Data.entryAt ⟨43, by decide +kernel⟩

def target0 : Weights.Entry :=
  { word := [2, 0, 4, 10, 0, 12, 10], weights := [1, 0, 1, 1] }

-- Period 10, original row 2446, representative 9555.
def source1 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B001.Data.entryAt ⟨43, by decide +kernel⟩

def target1 : Weights.Entry :=
  { word := [2, 0, 4, 10, 0, 12, 12], weights := [1, 0, 1, 1] }

def points1 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 8), (8, 7), (9, 9)]

-- Period 10, original row 2454, representative 9553.
def source2 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B001.Data.entryAt ⟨41, by decide +kernel⟩

def target2 : Weights.Entry :=
  { word := [2, 0, 4, 10, 8, 12, 12], weights := [1, 0, 1, 1] }

-- Period 10, original row 2475, representative 9523.
def source3 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B001.Data.entryAt ⟨11, by decide +kernel⟩

def target3 : Weights.Entry :=
  { word := [2, 0, 8, 4, 8, 12, 12], weights := [1, 0, 0, 1] }

-- Period 10, original row 2479, representative 9547.
def source4 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B001.Data.entryAt ⟨35, by decide +kernel⟩

def target4 : Weights.Entry :=
  { word := [2, 0, 8, 9, 4, 12, 12], weights := [1, 0, 1, 1] }

-- Period 10, original row 2483, representative 9546.
def source5 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B001.Data.entryAt ⟨34, by decide +kernel⟩

def target5 : Weights.Entry :=
  { word := [2, 0, 8, 9, 12, 12, 12], weights := [1, 0, 1, 1] }

-- Period 10, original row 2496, representative 9527.
def source6 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B001.Data.entryAt ⟨15, by decide +kernel⟩

def target6 : Weights.Entry :=
  { word := [2, 0, 8, 12, 0, 12, 10], weights := [1, 0, 1, 0] }

-- Period 10, original row 2497, representative 9527.
def source7 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B001.Data.entryAt ⟨15, by decide +kernel⟩

def target7 : Weights.Entry :=
  { word := [2, 0, 8, 12, 0, 12, 12], weights := [1, 0, 1, 0] }

def points7 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 8), (8, 7), (9, 9)]

-- Period 10, original row 2505, representative 9524.
def source8 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B001.Data.entryAt ⟨12, by decide +kernel⟩

def target8 : Weights.Entry :=
  { word := [2, 0, 8, 12, 8, 12, 12], weights := [1, 0, 1, 0] }

-- Period 10, original row 2516, representative 9564.
def source9 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B001.Data.entryAt ⟨52, by decide +kernel⟩

def target9 : Weights.Entry :=
  { word := [2, 0, 9, 8, 1, 12, 10], weights := [1, 0, 1, 1] }

-- Period 10, original row 2517, representative 9564.
def source10 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B001.Data.entryAt ⟨52, by decide +kernel⟩

def target10 : Weights.Entry :=
  { word := [2, 0, 9, 8, 1, 12, 12], weights := [1, 0, 1, 1] }

def points10 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 8), (8, 7), (9, 9)]

-- Period 10, original row 2521, representative 9559.
def source11 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B001.Data.entryAt ⟨47, by decide +kernel⟩

def target11 : Weights.Entry :=
  { word := [2, 0, 9, 8, 9, 12, 12], weights := [1, 0, 1, 1] }

-- Period 10, original row 2567, representative 9554.
def source12 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B001.Data.entryAt ⟨42, by decide +kernel⟩

def target12 : Weights.Entry :=
  { word := [2, 0, 12, 10, 0, 12, 10], weights := [1, 0, 1, 1] }

-- Period 10, original row 2568, representative 9554.
def source13 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B001.Data.entryAt ⟨42, by decide +kernel⟩

def target13 : Weights.Entry :=
  { word := [2, 0, 12, 10, 0, 12, 12], weights := [1, 0, 1, 1] }

def points13 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 8), (8, 7), (9, 9)]

-- Period 10, original row 2576, representative 9552.
def source14 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B001.Data.entryAt ⟨40, by decide +kernel⟩

def target14 : Weights.Entry :=
  { word := [2, 0, 12, 10, 8, 12, 12], weights := [1, 0, 1, 1] }

-- Period 10, original row 2830, representative 9519.
def source15 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B001.Data.entryAt ⟨7, by decide +kernel⟩

def target15 : Weights.Entry :=
  { word := [2, 8, 0, 4, 8, 12, 12], weights := [1, 0, 0, 1] }

-- Period 10, original row 2856, representative 9526.
def source16 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B001.Data.entryAt ⟨14, by decide +kernel⟩

def target16 : Weights.Entry :=
  { word := [2, 8, 0, 12, 0, 12, 12], weights := [1, 0, 1, 0] }

-- Period 10, original row 2881, representative 9522.
def source17 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B001.Data.entryAt ⟨10, by decide +kernel⟩

def target17 : Weights.Entry :=
  { word := [2, 8, 0, 12, 8, 12, 12], weights := [1, 0, 1, 0] }

-- Period 10, original row 2948, representative 9551.
def source18 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B001.Data.entryAt ⟨39, by decide +kernel⟩

def target18 : Weights.Entry :=
  { word := [2, 8, 4, 10, 8, 12, 12], weights := [2, 2, 1, 3] }

-- Period 10, original row 2997, representative 9517.
def source19 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B001.Data.entryAt ⟨5, by decide +kernel⟩

def target19 : Weights.Entry :=
  { word := [2, 8, 8, 4, 8, 12, 10], weights := [1, 0, 1, 0] }

-- Period 10, original row 2998, representative 9520.
def source20 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B001.Data.entryAt ⟨8, by decide +kernel⟩

def target20 : Weights.Entry :=
  { word := [2, 8, 8, 4, 8, 12, 12], weights := [1, 0, 0, 1] }

-- Period 10, original row 3023, representative 9565.
def source21 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B001.Data.entryAt ⟨53, by decide +kernel⟩

def target21 : Weights.Entry :=
  { word := [2, 8, 8, 8, 1, 12, 10], weights := [1, 0, 1, 1] }

-- Period 10, original row 3024, representative 9565.
def source22 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B001.Data.entryAt ⟨53, by decide +kernel⟩

def target22 : Weights.Entry :=
  { word := [2, 8, 8, 8, 1, 12, 12], weights := [1, 0, 1, 1] }

def points22 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 8), (8, 7), (9, 9)]

-- Period 10, original row 3028, representative 9560.
def source23 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B001.Data.entryAt ⟨48, by decide +kernel⟩

def target23 : Weights.Entry :=
  { word := [2, 8, 8, 8, 9, 12, 12], weights := [1, 0, 1, 1] }

-- Period 10, original row 3041, representative 9525.
def source24 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B001.Data.entryAt ⟨13, by decide +kernel⟩

def target24 : Weights.Entry :=
  { word := [2, 8, 8, 12, 0, 12, 10], weights := [1, 0, 1, 0] }

-- Period 10, original row 3042, representative 9525.
def source25 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B001.Data.entryAt ⟨13, by decide +kernel⟩

def target25 : Weights.Entry :=
  { word := [2, 8, 8, 12, 0, 12, 12], weights := [1, 0, 1, 0] }

def points25 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 8), (8, 7), (9, 9)]

-- Period 10, original row 3070, representative 9518.
def source26 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B001.Data.entryAt ⟨6, by decide +kernel⟩

def target26 : Weights.Entry :=
  { word := [2, 8, 8, 12, 8, 12, 10], weights := [1, 0, 1, 0] }

-- Period 10, original row 3071, representative 9521.
def source27 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B001.Data.entryAt ⟨9, by decide +kernel⟩

def target27 : Weights.Entry :=
  { word := [2, 8, 8, 12, 8, 12, 12], weights := [1, 0, 1, 0] }

-- Period 10, original row 3098, representative 9562.
def source28 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B001.Data.entryAt ⟨50, by decide +kernel⟩

def target28 : Weights.Entry :=
  { word := [2, 8, 9, 8, 1, 12, 10], weights := [1, 0, 1, 1] }

-- Period 10, original row 3099, representative 9562.
def source29 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B001.Data.entryAt ⟨50, by decide +kernel⟩

def target29 : Weights.Entry :=
  { word := [2, 8, 9, 8, 1, 12, 12], weights := [1, 0, 1, 1] }

def points29 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 8), (8, 7), (9, 9)]

-- Period 10, original row 3103, representative 9557.
def source30 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B001.Data.entryAt ⟨45, by decide +kernel⟩

def target30 : Weights.Entry :=
  { word := [2, 8, 9, 8, 9, 12, 12], weights := [1, 0, 1, 1] }

-- Period 10, original row 3158, representative 9550.
def source31 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B001.Data.entryAt ⟨38, by decide +kernel⟩

def target31 : Weights.Entry :=
  { word := [2, 8, 12, 10, 8, 12, 12], weights := [2, 1, 1, 2] }

-- Period 10, original row 3349, representative 9514.
def source32 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B001.Data.entryAt ⟨2, by decide +kernel⟩

def target32 : Weights.Entry :=
  { word := [2, 10, 8, 12, 8, 12, 10], weights := [2, 1, 2, 1] }

-- Period 10, original row 3668, representative 9534.
def source33 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B001.Data.entryAt ⟨22, by decide +kernel⟩

def target33 : Weights.Entry :=
  { word := [4, 2, 8, 10, 8, 12, 12], weights := [1, 2, 1, 2] }

-- Period 10, original row 3691, representative 9563.
def source34 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B001.Data.entryAt ⟨51, by decide +kernel⟩

def target34 : Weights.Entry :=
  { word := [4, 4, 8, 8, 1, 12, 10], weights := [1, 0, 1, 1] }

-- Period 10, original row 3692, representative 9563.
def source35 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B001.Data.entryAt ⟨51, by decide +kernel⟩

def target35 : Weights.Entry :=
  { word := [4, 4, 8, 8, 1, 12, 12], weights := [1, 0, 1, 1] }

def points35 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 8), (8, 7), (9, 9)]

-- Period 10, original row 3701, representative 9558.
def source36 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B001.Data.entryAt ⟨46, by decide +kernel⟩

def target36 : Weights.Entry :=
  { word := [4, 4, 8, 8, 9, 12, 12], weights := [1, 0, 1, 1] }

-- Period 10, original row 3748, representative 9519.
def source37 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B001.Data.entryAt ⟨7, by decide +kernel⟩

def target37 : Weights.Entry :=
  { word := [4, 8, 0, 4, 8, 12, 12], weights := [1, 0, 0, 1] }

def points37 : List (ℕ × ℕ) := [(0, 0), (1, 2), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8), (9, 9)]

-- Period 10, original row 3791, representative 9522.
def source38 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B001.Data.entryAt ⟨10, by decide +kernel⟩

def target38 : Weights.Entry :=
  { word := [4, 8, 0, 12, 8, 12, 12], weights := [1, 0, 1, 0] }

def points38 : List (ℕ × ℕ) := [(0, 0), (1, 2), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8), (9, 9)]

-- Period 10, original row 3862, representative 9549.
def source39 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B001.Data.entryAt ⟨37, by decide +kernel⟩

def target39 : Weights.Entry :=
  { word := [4, 8, 4, 10, 8, 12, 12], weights := [1, 1, 1, 1] }

-- Period 10, original row 3970, representative 9548.
def source40 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B001.Data.entryAt ⟨36, by decide +kernel⟩

def target40 : Weights.Entry :=
  { word := [4, 8, 12, 10, 8, 12, 12], weights := [1, 1, 1, 1] }

-- Period 10, original row 4033, representative 9533.
def source41 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B001.Data.entryAt ⟨21, by decide +kernel⟩

def target41 : Weights.Entry :=
  { word := [4, 10, 8, 10, 8, 12, 12], weights := [1, 2, 1, 2] }

-- Period 10, original row 4056, representative 9561.
def source42 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B001.Data.entryAt ⟨49, by decide +kernel⟩

def target42 : Weights.Entry :=
  { word := [4, 12, 8, 8, 1, 12, 10], weights := [1, 0, 1, 1] }

-- Period 10, original row 4057, representative 9561.
def source43 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B001.Data.entryAt ⟨49, by decide +kernel⟩

def target43 : Weights.Entry :=
  { word := [4, 12, 8, 8, 1, 12, 12], weights := [1, 0, 1, 1] }

def points43 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 8), (8, 7), (9, 9)]

-- Period 10, original row 4066, representative 9556.
def source44 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B001.Data.entryAt ⟨44, by decide +kernel⟩

def target44 : Weights.Entry :=
  { word := [4, 12, 8, 8, 9, 12, 12], weights := [1, 0, 1, 1] }

-- Period 10, original row 4144, representative 9570.
def source45 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B001.Data.entryAt ⟨58, by decide +kernel⟩

def target45 : Weights.Entry :=
  { word := [8, 0, 1, 4, 8, 12, 12], weights := [1, 0, 0, 1] }

-- Period 10, original row 4695, representative 9516.
def source46 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B001.Data.entryAt ⟨4, by decide +kernel⟩

def target46 : Weights.Entry :=
  { word := [8, 2, 0, 8, 1, 12, 12], weights := [0, 2, 1, 1] }

-- Period 10, original row 4699, representative 9513.
def source47 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B001.Data.entryAt ⟨1, by decide +kernel⟩

def target47 : Weights.Entry :=
  { word := [8, 2, 0, 8, 9, 12, 12], weights := [0, 2, 1, 1] }

-- Period 10, original row 4721, representative 9545.
def source48 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B001.Data.entryAt ⟨33, by decide +kernel⟩

def target48 : Weights.Entry :=
  { word := [8, 2, 0, 9, 8, 12, 12], weights := [0, 3, 1, 0] }

-- Period 10, original row 4742, representative 9544.
def source49 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B001.Data.entryAt ⟨32, by decide +kernel⟩

def target49 : Weights.Entry :=
  { word := [8, 2, 0, 10, 8, 12, 12], weights := [0, 3, 0, 1] }

-- Period 10, original row 4845, representative 9531.
def source50 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B001.Data.entryAt ⟨19, by decide +kernel⟩

def target50 : Weights.Entry :=
  { word := [8, 2, 2, 10, 8, 12, 10], weights := [1, 1, 1, 1] }

-- Period 10, original row 4846, representative 9538.
def source51 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B001.Data.entryAt ⟨26, by decide +kernel⟩

def target51 : Weights.Entry :=
  { word := [8, 2, 2, 10, 8, 12, 12], weights := [1, 1, 1, 1] }

-- Period 10, original row 4916, representative 9543.
def source52 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B001.Data.entryAt ⟨31, by decide +kernel⟩

def target52 : Weights.Entry :=
  { word := [8, 2, 8, 10, 8, 12, 12], weights := [0, 3, 0, 1] }

-- Period 10, original row 5000, representative 9530.
def source53 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B001.Data.entryAt ⟨18, by decide +kernel⟩

def target53 : Weights.Entry :=
  { word := [8, 2, 10, 10, 8, 12, 10], weights := [1, 1, 1, 1] }

-- Period 10, original row 5001, representative 9537.
def source54 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B001.Data.entryAt ⟨25, by decide +kernel⟩

def target54 : Weights.Entry :=
  { word := [8, 2, 10, 10, 8, 12, 12], weights := [1, 1, 1, 1] }

-- Period 10, original row 5023, representative 9570.
def source55 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B001.Data.entryAt ⟨58, by decide +kernel⟩

def target55 : Weights.Entry :=
  { word := [8, 4, 0, 4, 8, 12, 12], weights := [1, 0, 0, 1] }

def points55 : List (ℕ × ℕ) := [(0, 0), (1, 2), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8), (9, 9)]

-- Period 10, original row 5181, representative 9568.
def source56 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B001.Data.entryAt ⟨56, by decide +kernel⟩

def target56 : Weights.Entry :=
  { word := [8, 4, 8, 4, 8, 12, 10], weights := [1, 0, 1, 0] }

-- Period 10, original row 5182, representative 9575.
def source57 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B001.Data.entryAt ⟨63, by decide +kernel⟩

def target57 : Weights.Entry :=
  { word := [8, 4, 8, 4, 8, 12, 12], weights := [1, 0, 0, 1] }

-- Period 10, original row 5223, representative 9569.
def source58 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B001.Data.entryAt ⟨57, by decide +kernel⟩

def target58 : Weights.Entry :=
  { word := [8, 4, 8, 12, 8, 12, 10], weights := [1, 0, 1, 0] }

-- Period 10, original row 5310, representative 9532.
def source59 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B001.Data.entryAt ⟨20, by decide +kernel⟩

def target59 : Weights.Entry :=
  { word := [8, 6, 8, 12, 8, 12, 10], weights := [1, 1, 1, 1] }

-- Period 10, original row 5311, representative 9539.
def source60 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B001.Data.entryAt ⟨27, by decide +kernel⟩

def target60 : Weights.Entry :=
  { word := [8, 6, 8, 12, 8, 12, 12], weights := [1, 1, 1, 1] }

-- Period 10, original row 5465, representative 9571.
def source61 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B001.Data.entryAt ⟨59, by decide +kernel⟩

def target61 : Weights.Entry :=
  { word := [8, 8, 1, 4, 8, 12, 12], weights := [1, 0, 0, 1] }

-- Period 10, original row 5501, representative 9574.
def source62 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B001.Data.entryAt ⟨62, by decide +kernel⟩

def target62 : Weights.Entry :=
  { word := [8, 8, 1, 12, 8, 12, 12], weights := [1, 0, 1, 0] }

-- Period 10, original row 6089, representative 9515.
def source63 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B001.Data.entryAt ⟨3, by decide +kernel⟩

def target63 : Weights.Entry :=
  { word := [8, 10, 0, 8, 1, 12, 12], weights := [0, 2, 1, 1] }

-- Period 10, original row 6093, representative 9512.
def source64 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B001.Data.entryAt ⟨0, by decide +kernel⟩

def target64 : Weights.Entry :=
  { word := [8, 10, 0, 8, 9, 12, 12], weights := [0, 2, 1, 1] }

-- Period 10, original row 6115, representative 9542.
def source65 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B001.Data.entryAt ⟨30, by decide +kernel⟩

def target65 : Weights.Entry :=
  { word := [8, 10, 0, 9, 8, 12, 12], weights := [0, 3, 1, 0] }

-- Period 10, original row 6136, representative 9541.
def source66 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B001.Data.entryAt ⟨29, by decide +kernel⟩

def target66 : Weights.Entry :=
  { word := [8, 10, 0, 10, 8, 12, 12], weights := [0, 3, 0, 1] }

-- Period 10, original row 6208, representative 9529.
def source67 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B001.Data.entryAt ⟨17, by decide +kernel⟩

def target67 : Weights.Entry :=
  { word := [8, 10, 2, 10, 8, 12, 10], weights := [1, 1, 1, 1] }

-- Period 10, original row 6209, representative 9536.
def source68 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B001.Data.entryAt ⟨24, by decide +kernel⟩

def target68 : Weights.Entry :=
  { word := [8, 10, 2, 10, 8, 12, 12], weights := [1, 1, 1, 1] }

-- Period 10, original row 6279, representative 9540.
def source69 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B001.Data.entryAt ⟨28, by decide +kernel⟩

def target69 : Weights.Entry :=
  { word := [8, 10, 8, 10, 8, 12, 12], weights := [0, 3, 0, 1] }

-- Period 10, original row 6330, representative 9528.
def source70 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B001.Data.entryAt ⟨16, by decide +kernel⟩

def target70 : Weights.Entry :=
  { word := [8, 10, 10, 10, 8, 12, 10], weights := [1, 1, 1, 1] }

-- Period 10, original row 6331, representative 9535.
def source71 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B001.Data.entryAt ⟨23, by decide +kernel⟩

def target71 : Weights.Entry :=
  { word := [8, 10, 10, 10, 8, 12, 12], weights := [1, 1, 1, 1] }

-- Period 10, original row 6353, representative 9571.
def source72 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B001.Data.entryAt ⟨59, by decide +kernel⟩

def target72 : Weights.Entry :=
  { word := [8, 12, 0, 4, 8, 12, 12], weights := [1, 0, 0, 1] }

def points72 : List (ℕ × ℕ) := [(0, 0), (1, 2), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8), (9, 9)]

-- Period 10, original row 6389, representative 9574.
def source73 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B001.Data.entryAt ⟨62, by decide +kernel⟩

def target73 : Weights.Entry :=
  { word := [8, 12, 0, 12, 8, 12, 12], weights := [1, 0, 1, 0] }

def points73 : List (ℕ × ℕ) := [(0, 0), (1, 2), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8), (9, 9)]

-- Period 10, original row 6511, representative 9566.
def source74 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B001.Data.entryAt ⟨54, by decide +kernel⟩

def target74 : Weights.Entry :=
  { word := [8, 12, 8, 4, 8, 12, 10], weights := [1, 0, 1, 0] }

-- Period 10, original row 6512, representative 9572.
def source75 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B001.Data.entryAt ⟨60, by decide +kernel⟩

def target75 : Weights.Entry :=
  { word := [8, 12, 8, 4, 8, 12, 12], weights := [1, 0, 0, 1] }

-- Period 10, original row 6553, representative 9567.
def source76 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B001.Data.entryAt ⟨55, by decide +kernel⟩

def target76 : Weights.Entry :=
  { word := [8, 12, 8, 12, 8, 12, 10], weights := [1, 0, 1, 0] }

-- Period 10, original row 6554, representative 9573.
def source77 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B001.Data.entryAt ⟨61, by decide +kernel⟩

def target77 : Weights.Entry :=
  { word := [8, 12, 8, 12, 8, 12, 12], weights := [1, 0, 1, 0] }

-- Period 10, original row 6646, representative 9570.
def source78 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B001.Data.entryAt ⟨58, by decide +kernel⟩

def target78 : Weights.Entry :=
  { word := [9, 0, 1, 4, 8, 12, 12], weights := [1, 0, 0, 1] }

def points78 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8), (9, 9)]

-- Period 10, original row 7082, representative 9571.
def source79 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B001.Data.entryAt ⟨59, by decide +kernel⟩

def target79 : Weights.Entry :=
  { word := [9, 8, 1, 4, 8, 12, 12], weights := [1, 0, 0, 1] }

def points79 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8), (9, 9)]

-- Period 10, original row 7118, representative 9574.
def source80 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B001.Data.entryAt ⟨62, by decide +kernel⟩

def target80 : Weights.Entry :=
  { word := [9, 8, 1, 12, 8, 12, 12], weights := [1, 0, 1, 0] }

def points80 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8), (9, 9)]

-- Period 10, original row 8186, representative 9516.
def source81 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B001.Data.entryAt ⟨4, by decide +kernel⟩

def target81 : Weights.Entry :=
  { word := [10, 10, 0, 9, 0, 4, 8], weights := [1, 1, 2, 0] }

def points81 : List (ℕ × ℕ) := [(0, 9), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8189, representative 9515.
def source82 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B001.Data.entryAt ⟨3, by decide +kernel⟩

def target82 : Weights.Entry :=
  { word := [10, 10, 0, 9, 0, 12, 8], weights := [1, 1, 2, 0] }

def points82 : List (ℕ × ℕ) := [(0, 9), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8190, representative 9564.
def source83 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B001.Data.entryAt ⟨52, by decide +kernel⟩

def target83 : Weights.Entry :=
  { word := [10, 10, 0, 9, 8, 1, 4], weights := [1, 1, 0, 1] }

def points83 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2), (9, 0)]

-- Period 10, original row 8192, representative 9563.
def source84 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B001.Data.entryAt ⟨51, by decide +kernel⟩

def target84 : Weights.Entry :=
  { word := [10, 10, 0, 9, 8, 2, 2], weights := [1, 1, 0, 1] }

def points84 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2), (9, 0)]

-- Period 10, original row 8194, representative 9565.
def source85 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B001.Data.entryAt ⟨53, by decide +kernel⟩

def target85 : Weights.Entry :=
  { word := [10, 10, 0, 9, 8, 8, 4], weights := [1, 1, 0, 1] }

def points85 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2), (9, 0)]

-- Period 10, original row 8197, representative 9562.
def source86 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B001.Data.entryAt ⟨50, by decide +kernel⟩

def target86 : Weights.Entry :=
  { word := [10, 10, 0, 9, 8, 9, 4], weights := [1, 1, 0, 1] }

def points86 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2), (9, 0)]

-- Period 10, original row 8199, representative 9561.
def source87 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B001.Data.entryAt ⟨49, by decide +kernel⟩

def target87 : Weights.Entry :=
  { word := [10, 10, 0, 9, 8, 10, 2], weights := [1, 1, 0, 1] }

def points87 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2), (9, 0)]

-- Period 10, original row 8210, representative 9526.
def source88 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B001.Data.entryAt ⟨14, by decide +kernel⟩

def target88 : Weights.Entry :=
  { word := [10, 10, 0, 10, 0, 8, 4], weights := [0, 1, 0, 1] }

def points88 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8214, representative 9527.
def source89 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B001.Data.entryAt ⟨15, by decide +kernel⟩

def target89 : Weights.Entry :=
  { word := [10, 10, 0, 10, 8, 0, 4], weights := [0, 1, 0, 1] }

def points89 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2), (9, 0)]

-- Period 10, original row 8216, representative 9525.
def source90 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B001.Data.entryAt ⟨13, by decide +kernel⟩

def target90 : Weights.Entry :=
  { word := [10, 10, 0, 10, 8, 8, 4], weights := [0, 1, 0, 1] }

def points90 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2), (9, 0)]

-- Period 10, original row 8220, representative 9555.
def source91 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B001.Data.entryAt ⟨43, by decide +kernel⟩

def target91 : Weights.Entry :=
  { word := [10, 10, 0, 12, 2, 0, 4], weights := [1, 1, 0, 1] }

def points91 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2), (9, 0)]

-- Period 10, original row 8228, representative 9554.
def source92 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B001.Data.entryAt ⟨42, by decide +kernel⟩

def target92 : Weights.Entry :=
  { word := [10, 10, 0, 12, 10, 0, 4], weights := [1, 1, 0, 1] }

def points92 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2), (9, 0)]

-- Period 10, original row 8250, representative 9547.
def source93 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B001.Data.entryAt ⟨35, by decide +kernel⟩

def target93 : Weights.Entry :=
  { word := [10, 10, 2, 8, 9, 0, 4], weights := [1, 1, 0, 1] }

def points93 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8262, representative 9570.
def source94 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B001.Data.entryAt ⟨58, by decide +kernel⟩

def target94 : Weights.Entry :=
  { word := [10, 10, 8, 2, 0, 1, 8], weights := [1, 0, 0, 1] }

def points94 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8264, representative 9570.
def source95 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B001.Data.entryAt ⟨58, by decide +kernel⟩

def target95 : Weights.Entry :=
  { word := [10, 10, 8, 2, 0, 2, 8], weights := [1, 0, 0, 1] }

def points95 : List (ℕ × ℕ) := [(0, 7), (1, 9), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8267, representative 9519.
def source96 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B001.Data.entryAt ⟨7, by decide +kernel⟩

def target96 : Weights.Entry :=
  { word := [10, 10, 8, 2, 0, 8, 2], weights := [1, 0, 0, 1] }

def points96 : List (ℕ × ℕ) := [(0, 9), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8268, representative 9519.
def source97 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B001.Data.entryAt ⟨7, by decide +kernel⟩

def target97 : Weights.Entry :=
  { word := [10, 10, 8, 2, 0, 8, 4], weights := [1, 0, 0, 1] }

def points97 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8274, representative 9571.
def source98 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B001.Data.entryAt ⟨59, by decide +kernel⟩

def target98 : Weights.Entry :=
  { word := [10, 10, 8, 2, 0, 9, 8], weights := [1, 0, 0, 1] }

def points98 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8276, representative 9571.
def source99 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B001.Data.entryAt ⟨59, by decide +kernel⟩

def target99 : Weights.Entry :=
  { word := [10, 10, 8, 2, 0, 10, 8], weights := [1, 0, 0, 1] }

def points99 : List (ℕ × ℕ) := [(0, 9), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8277, representative 9523.
def source100 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B001.Data.entryAt ⟨11, by decide +kernel⟩

def target100 : Weights.Entry :=
  { word := [10, 10, 8, 2, 8, 0, 4], weights := [1, 0, 0, 1] }

def points100 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8280, representative 9575.
def source101 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B001.Data.entryAt ⟨63, by decide +kernel⟩

def target101 : Weights.Entry :=
  { word := [10, 10, 8, 2, 8, 2, 8], weights := [1, 0, 0, 1] }

def points101 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8281, representative 9520.
def source102 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B001.Data.entryAt ⟨8, by decide +kernel⟩

def target102 : Weights.Entry :=
  { word := [10, 10, 8, 2, 8, 8, 4], weights := [1, 0, 0, 1] }

def points102 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8284, representative 9572.
def source103 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B001.Data.entryAt ⟨60, by decide +kernel⟩

def target103 : Weights.Entry :=
  { word := [10, 10, 8, 2, 8, 10, 8], weights := [1, 0, 0, 1] }

def points103 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8292, representative 9545.
def source104 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B001.Data.entryAt ⟨33, by decide +kernel⟩

def target104 : Weights.Entry :=
  { word := [10, 10, 8, 8, 1, 4, 8], weights := [0, 1, 3, 0] }

def points104 : List (ℕ × ℕ) := [(0, 9), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8293, representative 9542.
def source105 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B001.Data.entryAt ⟨30, by decide +kernel⟩

def target105 : Weights.Entry :=
  { word := [10, 10, 8, 8, 1, 12, 8], weights := [0, 1, 3, 0] }

def points105 : List (ℕ × ℕ) := [(0, 9), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8295, representative 9513.
def source106 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B001.Data.entryAt ⟨1, by decide +kernel⟩

def target106 : Weights.Entry :=
  { word := [10, 10, 8, 9, 0, 4, 8], weights := [1, 1, 2, 0] }

def points106 : List (ℕ × ℕ) := [(0, 9), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8298, representative 9512.
def source107 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B001.Data.entryAt ⟨0, by decide +kernel⟩

def target107 : Weights.Entry :=
  { word := [10, 10, 8, 9, 0, 12, 8], weights := [1, 1, 2, 0] }

def points107 : List (ℕ × ℕ) := [(0, 9), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8299, representative 9559.
def source108 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B001.Data.entryAt ⟨47, by decide +kernel⟩

def target108 : Weights.Entry :=
  { word := [10, 10, 8, 9, 8, 1, 4], weights := [1, 1, 0, 1] }

def points108 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8301, representative 9558.
def source109 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B001.Data.entryAt ⟨46, by decide +kernel⟩

def target109 : Weights.Entry :=
  { word := [10, 10, 8, 9, 8, 2, 2], weights := [1, 1, 0, 1] }

def points109 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8303, representative 9560.
def source110 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B001.Data.entryAt ⟨48, by decide +kernel⟩

def target110 : Weights.Entry :=
  { word := [10, 10, 8, 9, 8, 8, 4], weights := [1, 1, 0, 1] }

def points110 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8306, representative 9557.
def source111 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B001.Data.entryAt ⟨45, by decide +kernel⟩

def target111 : Weights.Entry :=
  { word := [10, 10, 8, 9, 8, 9, 4], weights := [1, 1, 0, 1] }

def points111 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8308, representative 9556.
def source112 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B001.Data.entryAt ⟨44, by decide +kernel⟩

def target112 : Weights.Entry :=
  { word := [10, 10, 8, 9, 8, 10, 2], weights := [1, 1, 0, 1] }

def points112 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8317, representative 9522.
def source113 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B001.Data.entryAt ⟨10, by decide +kernel⟩

def target113 : Weights.Entry :=
  { word := [10, 10, 8, 10, 0, 8, 2], weights := [0, 1, 0, 1] }

def points113 : List (ℕ × ℕ) := [(0, 9), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8318, representative 9522.
def source114 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B001.Data.entryAt ⟨10, by decide +kernel⟩

def target114 : Weights.Entry :=
  { word := [10, 10, 8, 10, 0, 8, 4], weights := [0, 1, 0, 1] }

def points114 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8324, representative 9574.
def source115 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B001.Data.entryAt ⟨62, by decide +kernel⟩

def target115 : Weights.Entry :=
  { word := [10, 10, 8, 10, 0, 9, 8], weights := [0, 1, 0, 1] }

def points115 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8326, representative 9574.
def source116 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B001.Data.entryAt ⟨62, by decide +kernel⟩

def target116 : Weights.Entry :=
  { word := [10, 10, 8, 10, 0, 10, 8], weights := [0, 1, 0, 1] }

def points116 : List (ℕ × ℕ) := [(0, 9), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8328, representative 9524.
def source117 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B001.Data.entryAt ⟨12, by decide +kernel⟩

def target117 : Weights.Entry :=
  { word := [10, 10, 8, 10, 8, 0, 4], weights := [0, 1, 0, 1] }

def points117 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8333, representative 9539.
def source118 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B001.Data.entryAt ⟨27, by decide +kernel⟩

def target118 : Weights.Entry :=
  { word := [10, 10, 8, 10, 8, 6, 8], weights := [1, 1, 1, 1] }

def points118 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8334, representative 9521.
def source119 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B001.Data.entryAt ⟨9, by decide +kernel⟩

def target119 : Weights.Entry :=
  { word := [10, 10, 8, 10, 8, 8, 4], weights := [0, 1, 0, 1] }

def points119 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8337, representative 9573.
def source120 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B001.Data.entryAt ⟨61, by decide +kernel⟩

def target120 : Weights.Entry :=
  { word := [10, 10, 8, 10, 8, 10, 8], weights := [0, 1, 0, 1] }

def points120 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8338, representative 9544.
def source121 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B001.Data.entryAt ⟨32, by decide +kernel⟩

def target121 : Weights.Entry :=
  { word := [10, 10, 8, 12, 0, 4, 8], weights := [1, 0, 3, 0] }

def points121 : List (ℕ × ℕ) := [(0, 9), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8339, representative 9541.
def source122 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B001.Data.entryAt ⟨29, by decide +kernel⟩

def target122 : Weights.Entry :=
  { word := [10, 10, 8, 12, 0, 12, 8], weights := [1, 0, 3, 0] }

def points122 : List (ℕ × ℕ) := [(0, 9), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8342, representative 9553.
def source123 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B001.Data.entryAt ⟨41, by decide +kernel⟩

def target123 : Weights.Entry :=
  { word := [10, 10, 8, 12, 2, 0, 4], weights := [1, 1, 0, 1] }

def points123 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8347, representative 9549.
def source124 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B001.Data.entryAt ⟨37, by decide +kernel⟩

def target124 : Weights.Entry :=
  { word := [10, 10, 8, 12, 2, 8, 2], weights := [1, 1, 1, 1] }

def points124 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8348, representative 9551.
def source125 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B001.Data.entryAt ⟨39, by decide +kernel⟩

def target125 : Weights.Entry :=
  { word := [10, 10, 8, 12, 2, 8, 4], weights := [3, 1, 2, 2] }

def points125 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8353, representative 9538.
def source126 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B001.Data.entryAt ⟨26, by decide +kernel⟩

def target126 : Weights.Entry :=
  { word := [10, 10, 8, 12, 4, 4, 8], weights := [1, 1, 1, 1] }

def points126 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8355, representative 9536.
def source127 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B001.Data.entryAt ⟨24, by decide +kernel⟩

def target127 : Weights.Entry :=
  { word := [10, 10, 8, 12, 4, 12, 8], weights := [1, 1, 1, 1] }

def points127 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

def period10Entries : List Weights.Entry := [target0, target1, target2, target3, target4, target5, target6, target7, target8, target9, target10, target11, target12, target13, target14, target15, target16, target17, target18, target19, target20, target21, target22, target23, target24, target25, target26, target27, target28, target29, target30, target31, target32, target33, target34, target35, target36, target37, target38, target39, target40, target41, target42, target43, target44, target45, target46, target47, target48, target49, target50, target51, target52, target53, target54, target55, target56, target57, target58, target59, target60, target61, target62, target63, target64, target65, target66, target67, target68, target69, target70, target71, target72, target73, target74, target75, target76, target77, target78, target79, target80, target81, target82, target83, target84, target85, target86, target87, target88, target89, target90, target91, target92, target93, target94, target95, target96, target97, target98, target99, target100, target101, target102, target103, target104, target105, target106, target107, target108, target109, target110, target111, target112, target113, target114, target115, target116, target117, target118, target119, target120, target121, target122, target123, target124, target125, target126, target127]

def period10Chunk : RowCoverage.Chunk where
  rows := [⟨2445, target0⟩, ⟨2446, target1⟩, ⟨2454, target2⟩, ⟨2475, target3⟩, ⟨2479, target4⟩, ⟨2483, target5⟩, ⟨2496, target6⟩, ⟨2497, target7⟩, ⟨2505, target8⟩, ⟨2516, target9⟩, ⟨2517, target10⟩, ⟨2521, target11⟩, ⟨2567, target12⟩, ⟨2568, target13⟩, ⟨2576, target14⟩, ⟨2830, target15⟩, ⟨2856, target16⟩, ⟨2881, target17⟩, ⟨2948, target18⟩, ⟨2997, target19⟩, ⟨2998, target20⟩, ⟨3023, target21⟩, ⟨3024, target22⟩, ⟨3028, target23⟩, ⟨3041, target24⟩, ⟨3042, target25⟩, ⟨3070, target26⟩, ⟨3071, target27⟩, ⟨3098, target28⟩, ⟨3099, target29⟩, ⟨3103, target30⟩, ⟨3158, target31⟩, ⟨3349, target32⟩, ⟨3668, target33⟩, ⟨3691, target34⟩, ⟨3692, target35⟩, ⟨3701, target36⟩, ⟨3748, target37⟩, ⟨3791, target38⟩, ⟨3862, target39⟩, ⟨3970, target40⟩, ⟨4033, target41⟩, ⟨4056, target42⟩, ⟨4057, target43⟩, ⟨4066, target44⟩, ⟨4144, target45⟩, ⟨4695, target46⟩, ⟨4699, target47⟩, ⟨4721, target48⟩, ⟨4742, target49⟩, ⟨4845, target50⟩, ⟨4846, target51⟩, ⟨4916, target52⟩, ⟨5000, target53⟩, ⟨5001, target54⟩, ⟨5023, target55⟩, ⟨5181, target56⟩, ⟨5182, target57⟩, ⟨5223, target58⟩, ⟨5310, target59⟩, ⟨5311, target60⟩, ⟨5465, target61⟩, ⟨5501, target62⟩, ⟨6089, target63⟩, ⟨6093, target64⟩, ⟨6115, target65⟩, ⟨6136, target66⟩, ⟨6208, target67⟩, ⟨6209, target68⟩, ⟨6279, target69⟩, ⟨6330, target70⟩, ⟨6331, target71⟩, ⟨6353, target72⟩, ⟨6389, target73⟩, ⟨6511, target74⟩, ⟨6512, target75⟩, ⟨6553, target76⟩, ⟨6554, target77⟩, ⟨6646, target78⟩, ⟨7082, target79⟩, ⟨7118, target80⟩, ⟨8186, target81⟩, ⟨8189, target82⟩, ⟨8190, target83⟩, ⟨8192, target84⟩, ⟨8194, target85⟩, ⟨8197, target86⟩, ⟨8199, target87⟩, ⟨8210, target88⟩, ⟨8214, target89⟩, ⟨8216, target90⟩, ⟨8220, target91⟩, ⟨8228, target92⟩, ⟨8250, target93⟩, ⟨8262, target94⟩, ⟨8264, target95⟩, ⟨8267, target96⟩, ⟨8268, target97⟩, ⟨8274, target98⟩, ⟨8276, target99⟩, ⟨8277, target100⟩, ⟨8280, target101⟩, ⟨8281, target102⟩, ⟨8284, target103⟩, ⟨8292, target104⟩, ⟨8293, target105⟩, ⟨8295, target106⟩, ⟨8298, target107⟩, ⟨8299, target108⟩, ⟨8301, target109⟩, ⟨8303, target110⟩, ⟨8306, target111⟩, ⟨8308, target112⟩, ⟨8317, target113⟩, ⟨8318, target114⟩, ⟨8324, target115⟩, ⟨8326, target116⟩, ⟨8328, target117⟩, ⟨8333, target118⟩, ⟨8334, target119⟩, ⟨8337, target120⟩, ⟨8338, target121⟩, ⟨8339, target122⟩, ⟨8342, target123⟩, ⟨8347, target124⟩, ⟨8348, target125⟩, ⟨8353, target126⟩, ⟨8355, target127⟩]
  indexMask := 16092658123426439977235040235882864267467616193478246742065531890377620533116034799193045164978289567692904315691903920894611271190696339778388253976527360614397927576628746319150701676463544433131695740670251195149175108342309142560220292017162395683291537085599541817966164339342334515990943362420676827700247926022517976466890923656032791800282587696835978404168229089540328476911707556353065594717058363966562966231789461679883336432167296488226277625294318461154192775249644824447690976011188136085043244772129480884015571082980594208237237107252948946936923728243359114762907746468055973939235719958320832333487290901717373215190311324819855800475694278882094298879264232286984551572798560393607378527399112118318238304074045881796302971629314669171499580106716702329036646049399661077952207100752619407355154467366618667020242988995516016709080769349916753789392444934857011132305309455610031082330346155534342299543261364467636245872040209964276796183264800717252108932463257910840021267486807648978027198621817452611295262386586797147857496698914106247127603443192142700371837972765333031972514924255359540620469916878674787494500147706686655552766955081028816726552353825828409046286412679633722448876203416098372029739339734534452714869456971725065144101034309175347155974952299124954679584452213595441083648520127709728616888008145174483420498450879877973689214857437972904911622710804729721700491101690904005493226028360955803311112391864517582894524278902487106809966288485620011409300457373999103004906687852014562656711796176458753929340232509693322850280177024198362115258801735683405640575796315951834336860835998855707597917805930270973071260816278474999414857743504932469547529421019201413330287642933065968667799511506838273961837997098444949144448556044291564486297520348295673035127458076204031025173743252159702949952205106475737445262888366256211996851878676888081088553100432700481064881115144582131323569402893459361408126858726800877409050321069841799880135046303538776913914086560892717290567085182283541821538712734860256316761975151515207696584278739341604648471428522915873094767276649141864256458308336900221736172942568775581578850862893838958134676859065750499140674930822804340576802731298851993209504408811572974864309924722592682424738269256497840350625601767349113365376250790379621959558937134287019753221913682429279696125419420727966466182997801839777944605312941052375660507259326417717975181432637814409401986003214809178543018490740735626683156819921739312694310853410816
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

end FranklSmallCyclic.TransportBatches.G079.B000.Data
