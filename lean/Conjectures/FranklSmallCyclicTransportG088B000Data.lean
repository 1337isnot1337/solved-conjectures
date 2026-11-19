module

public import Conjectures.FranklSmallCyclicRowCoverage
public import Conjectures.FranklSmallCyclicCanonicalWords
public import Conjectures.FranklSmallCyclicOrbit10Block010Data

/-! 128 literal targets sharing one source proof block.
Original words and row indices are retained; weights may be transported.
-/
@[expose] public section

namespace FranklSmallCyclic.TransportBatches.G088.B000.Data

-- Period 10, original row 4207, representative 10089.
def source0 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B010.Data.entryAt ⟨1, by decide +kernel⟩

def target0 : Weights.Entry :=
  { word := [8, 0, 2, 2, 2, 8, 9], weights := [1, 0, 0, 1] }

-- Period 10, original row 4222, representative 10090.
def source1 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B010.Data.entryAt ⟨2, by decide +kernel⟩

def target1 : Weights.Entry :=
  { word := [8, 0, 2, 2, 10, 8, 9], weights := [1, 0, 0, 1] }

-- Period 10, original row 4236, representative 10096.
def source2 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B010.Data.entryAt ⟨8, by decide +kernel⟩

def target2 : Weights.Entry :=
  { word := [8, 0, 2, 10, 2, 8, 9], weights := [1, 0, 0, 1] }

-- Period 10, original row 4250, representative 10093.
def source3 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B010.Data.entryAt ⟨5, by decide +kernel⟩

def target3 : Weights.Entry :=
  { word := [8, 0, 2, 10, 10, 8, 9], weights := [1, 0, 0, 1] }

-- Period 10, original row 4262, representative 10121.
def source4 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B010.Data.entryAt ⟨33, by decide +kernel⟩

def target4 : Weights.Entry :=
  { word := [8, 0, 4, 2, 0, 8, 9], weights := [1, 0, 0, 1] }

-- Period 10, original row 4294, representative 10124.
def source5 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B010.Data.entryAt ⟨36, by decide +kernel⟩

def target5 : Weights.Entry :=
  { word := [8, 0, 4, 10, 0, 8, 9], weights := [1, 0, 0, 1] }

-- Period 10, original row 4320, representative 10097.
def source6 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B010.Data.entryAt ⟨9, by decide +kernel⟩

def target6 : Weights.Entry :=
  { word := [8, 0, 6, 2, 0, 8, 9], weights := [1, 0, 0, 1] }

-- Period 10, original row 4328, representative 10098.
def source7 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B010.Data.entryAt ⟨10, by decide +kernel⟩

def target7 : Weights.Entry :=
  { word := [8, 0, 6, 2, 8, 8, 9], weights := [1, 0, 0, 1] }

-- Period 10, original row 4335, representative 10100.
def source8 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B010.Data.entryAt ⟨12, by decide +kernel⟩

def target8 : Weights.Entry :=
  { word := [8, 0, 6, 10, 0, 8, 9], weights := [1, 0, 0, 1] }

-- Period 10, original row 4342, representative 10099.
def source9 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B010.Data.entryAt ⟨11, by decide +kernel⟩

def target9 : Weights.Entry :=
  { word := [8, 0, 6, 10, 8, 8, 9], weights := [0, 1, 1, 0] }

-- Period 10, original row 4401, representative 10094.
def source10 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B010.Data.entryAt ⟨6, by decide +kernel⟩

def target10 : Weights.Entry :=
  { word := [8, 0, 10, 2, 2, 8, 9], weights := [1, 0, 0, 1] }

-- Period 10, original row 4409, representative 10091.
def source11 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B010.Data.entryAt ⟨3, by decide +kernel⟩

def target11 : Weights.Entry :=
  { word := [8, 0, 10, 2, 10, 8, 9], weights := [1, 0, 0, 1] }

-- Period 10, original row 4416, representative 10095.
def source12 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B010.Data.entryAt ⟨7, by decide +kernel⟩

def target12 : Weights.Entry :=
  { word := [8, 0, 10, 10, 2, 8, 9], weights := [0, 1, 1, 0] }

-- Period 10, original row 4423, representative 10092.
def source13 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B010.Data.entryAt ⟨4, by decide +kernel⟩

def target13 : Weights.Entry :=
  { word := [8, 0, 10, 10, 10, 8, 9], weights := [0, 1, 1, 0] }

-- Period 10, original row 4435, representative 10122.
def source14 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B010.Data.entryAt ⟨34, by decide +kernel⟩

def target14 : Weights.Entry :=
  { word := [8, 0, 12, 2, 0, 8, 9], weights := [1, 0, 0, 1] }

-- Period 10, original row 4470, representative 10123.
def source15 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B010.Data.entryAt ⟨35, by decide +kernel⟩

def target15 : Weights.Entry :=
  { word := [8, 0, 12, 10, 0, 8, 9], weights := [1, 0, 0, 1] }

-- Period 10, original row 5087, representative 10137.
def source16 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B010.Data.entryAt ⟨49, by decide +kernel⟩

def target16 : Weights.Entry :=
  { word := [8, 4, 2, 8, 2, 8, 10], weights := [0, 1, 1, 0] }

-- Period 10, original row 5095, representative 10135.
def source17 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B010.Data.entryAt ⟨47, by decide +kernel⟩

def target17 : Weights.Entry :=
  { word := [8, 4, 2, 8, 10, 8, 10], weights := [0, 1, 1, 0] }

-- Period 10, original row 5107, representative 10109.
def source18 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B010.Data.entryAt ⟨21, by decide +kernel⟩

def target18 : Weights.Entry :=
  { word := [8, 4, 4, 4, 0, 8, 9], weights := [1, 0, 0, 1] }

-- Period 10, original row 5121, representative 10110.
def source19 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B010.Data.entryAt ⟨22, by decide +kernel⟩

def target19 : Weights.Entry :=
  { word := [8, 4, 4, 4, 8, 8, 9], weights := [1, 0, 1, 0] }

-- Period 10, original row 5135, representative 10116.
def source20 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B010.Data.entryAt ⟨28, by decide +kernel⟩

def target20 : Weights.Entry :=
  { word := [8, 4, 4, 12, 0, 8, 9], weights := [1, 0, 1, 0] }

-- Period 10, original row 5149, representative 10113.
def source21 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B010.Data.entryAt ⟨25, by decide +kernel⟩

def target21 : Weights.Entry :=
  { word := [8, 4, 4, 12, 8, 8, 9], weights := [1, 0, 1, 0] }

-- Period 10, original row 5156, representative 10138.
def source22 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B010.Data.entryAt ⟨50, by decide +kernel⟩

def target22 : Weights.Entry :=
  { word := [8, 4, 6, 8, 8, 8, 10], weights := [0, 1, 1, 0] }

-- Period 10, original row 5249, representative 10136.
def source23 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B010.Data.entryAt ⟨48, by decide +kernel⟩

def target23 : Weights.Entry :=
  { word := [8, 4, 10, 8, 2, 8, 10], weights := [0, 1, 1, 0] }

-- Period 10, original row 5252, representative 10134.
def source24 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B010.Data.entryAt ⟨46, by decide +kernel⟩

def target24 : Weights.Entry :=
  { word := [8, 4, 10, 8, 10, 8, 10], weights := [0, 1, 1, 0] }

-- Period 10, original row 5257, representative 10114.
def source25 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B010.Data.entryAt ⟨26, by decide +kernel⟩

def target25 : Weights.Entry :=
  { word := [8, 4, 12, 4, 0, 8, 9], weights := [1, 0, 0, 1] }

-- Period 10, original row 5271, representative 10111.
def source26 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B010.Data.entryAt ⟨23, by decide +kernel⟩

def target26 : Weights.Entry :=
  { word := [8, 4, 12, 4, 8, 8, 9], weights := [1, 0, 1, 0] }

-- Period 10, original row 5278, representative 10115.
def source27 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B010.Data.entryAt ⟨27, by decide +kernel⟩

def target27 : Weights.Entry :=
  { word := [8, 4, 12, 12, 0, 8, 9], weights := [1, 0, 1, 0] }

-- Period 10, original row 5292, representative 10112.
def source28 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B010.Data.entryAt ⟨24, by decide +kernel⟩

def target28 : Weights.Entry :=
  { word := [8, 4, 12, 12, 8, 8, 9], weights := [1, 0, 1, 0] }

-- Period 10, original row 5320, representative 10127.
def source29 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B010.Data.entryAt ⟨39, by decide +kernel⟩

def target29 : Weights.Entry :=
  { word := [8, 8, 0, 1, 4, 8, 12], weights := [0, 1, 0, 0] }

-- Period 10, original row 5326, representative 10125.
def source30 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B010.Data.entryAt ⟨37, by decide +kernel⟩

def target30 : Weights.Entry :=
  { word := [8, 8, 0, 1, 12, 8, 12], weights := [0, 1, 0, 0] }

-- Period 10, original row 5529, representative 10139.
def source31 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B010.Data.entryAt ⟨51, by decide +kernel⟩

def target31 : Weights.Entry :=
  { word := [8, 8, 2, 2, 2, 8, 10], weights := [1, 0, 0, 1] }

-- Period 10, original row 5530, representative 10147.
def source32 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B010.Data.entryAt ⟨59, by decide +kernel⟩

def target32 : Weights.Entry :=
  { word := [8, 8, 2, 2, 2, 8, 12], weights := [1, 0, 0, 1] }

-- Period 10, original row 5544, representative 10140.
def source33 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B010.Data.entryAt ⟨52, by decide +kernel⟩

def target33 : Weights.Entry :=
  { word := [8, 8, 2, 2, 10, 8, 10], weights := [1, 0, 0, 1] }

-- Period 10, original row 5545, representative 10148.
def source34 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B010.Data.entryAt ⟨60, by decide +kernel⟩

def target34 : Weights.Entry :=
  { word := [8, 8, 2, 2, 10, 8, 12], weights := [1, 0, 0, 1] }

-- Period 10, original row 5558, representative 10146.
def source35 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B010.Data.entryAt ⟨58, by decide +kernel⟩

def target35 : Weights.Entry :=
  { word := [8, 8, 2, 10, 2, 8, 10], weights := [0, 1, 1, 0] }

-- Period 10, original row 5572, representative 10143.
def source36 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B010.Data.entryAt ⟨55, by decide +kernel⟩

def target36 : Weights.Entry :=
  { word := [8, 8, 2, 10, 10, 8, 10], weights := [0, 1, 1, 0] }

-- Period 10, original row 5573, representative 10151.
def source37 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B010.Data.entryAt ⟨63, by decide +kernel⟩

def target37 : Weights.Entry :=
  { word := [8, 8, 2, 10, 10, 8, 12], weights := [1, 0, 0, 1] }

-- Period 10, original row 5583, representative 10117.
def source38 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B010.Data.entryAt ⟨29, by decide +kernel⟩

def target38 : Weights.Entry :=
  { word := [8, 8, 4, 2, 0, 8, 9], weights := [1, 0, 0, 1] }

-- Period 10, original row 5622, representative 10120.
def source39 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B010.Data.entryAt ⟨32, by decide +kernel⟩

def target39 : Weights.Entry :=
  { word := [8, 8, 4, 10, 0, 8, 9], weights := [1, 0, 0, 1] }

-- Period 10, original row 5661, representative 10088.
def source40 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B010.Data.entryAt ⟨0, by decide +kernel⟩

def target40 : Weights.Entry :=
  { word := [8, 8, 6, 10, 0, 8, 9], weights := [1, 0, 0, 1] }

-- Period 10, original row 5674, representative 10128.
def source41 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B010.Data.entryAt ⟨40, by decide +kernel⟩

def target41 : Weights.Entry :=
  { word := [8, 8, 8, 1, 4, 8, 12], weights := [0, 1, 0, 0] }

-- Period 10, original row 5680, representative 10126.
def source42 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B010.Data.entryAt ⟨38, by decide +kernel⟩

def target42 : Weights.Entry :=
  { word := [8, 8, 8, 1, 12, 8, 12], weights := [0, 1, 0, 0] }

-- Period 10, original row 5758, representative 10144.
def source43 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B010.Data.entryAt ⟨56, by decide +kernel⟩

def target43 : Weights.Entry :=
  { word := [8, 8, 10, 2, 2, 8, 10], weights := [1, 0, 0, 1] }

-- Period 10, original row 5766, representative 10141.
def source44 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B010.Data.entryAt ⟨53, by decide +kernel⟩

def target44 : Weights.Entry :=
  { word := [8, 8, 10, 2, 10, 8, 10], weights := [1, 0, 0, 1] }

-- Period 10, original row 5767, representative 10149.
def source45 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B010.Data.entryAt ⟨61, by decide +kernel⟩

def target45 : Weights.Entry :=
  { word := [8, 8, 10, 2, 10, 8, 12], weights := [1, 0, 0, 1] }

-- Period 10, original row 5773, representative 10145.
def source46 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B010.Data.entryAt ⟨57, by decide +kernel⟩

def target46 : Weights.Entry :=
  { word := [8, 8, 10, 10, 2, 8, 10], weights := [0, 1, 1, 0] }

-- Period 10, original row 5780, representative 10142.
def source47 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B010.Data.entryAt ⟨54, by decide +kernel⟩

def target47 : Weights.Entry :=
  { word := [8, 8, 10, 10, 10, 8, 10], weights := [0, 1, 1, 0] }

-- Period 10, original row 5781, representative 10150.
def source48 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B010.Data.entryAt ⟨62, by decide +kernel⟩

def target48 : Weights.Entry :=
  { word := [8, 8, 10, 10, 10, 8, 12], weights := [1, 0, 0, 1] }

-- Period 10, original row 5791, representative 10118.
def source49 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B010.Data.entryAt ⟨30, by decide +kernel⟩

def target49 : Weights.Entry :=
  { word := [8, 8, 12, 2, 0, 8, 9], weights := [1, 0, 0, 1] }

-- Period 10, original row 5829, representative 10119.
def source50 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B010.Data.entryAt ⟨31, by decide +kernel⟩

def target50 : Weights.Entry :=
  { word := [8, 8, 12, 10, 0, 8, 9], weights := [1, 0, 0, 1] }

-- Period 10, original row 5861, representative 10109.
def source51 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B010.Data.entryAt ⟨21, by decide +kernel⟩

def target51 : Weights.Entry :=
  { word := [8, 9, 0, 2, 2, 2, 8], weights := [1, 0, 0, 1] }

def points51 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2), (9, 0)]

-- Period 10, original row 5863, representative 10101.
def source52 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B010.Data.entryAt ⟨13, by decide +kernel⟩

def target52 : Weights.Entry :=
  { word := [8, 9, 0, 2, 2, 10, 8], weights := [1, 0, 0, 1] }

-- Period 10, original row 5865, representative 10114.
def source53 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B010.Data.entryAt ⟨26, by decide +kernel⟩

def target53 : Weights.Entry :=
  { word := [8, 9, 0, 2, 10, 2, 8], weights := [1, 0, 0, 1] }

def points53 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2), (9, 0)]

-- Period 10, original row 5867, representative 10106.
def source54 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B010.Data.entryAt ⟨18, by decide +kernel⟩

def target54 : Weights.Entry :=
  { word := [8, 9, 0, 2, 10, 10, 8], weights := [1, 0, 0, 1] }

-- Period 10, original row 5875, representative 10121.
def source55 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B010.Data.entryAt ⟨33, by decide +kernel⟩

def target55 : Weights.Entry :=
  { word := [8, 9, 0, 4, 2, 0, 8], weights := [1, 0, 0, 1] }

def points55 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2), (9, 0)]

-- Period 10, original row 5881, representative 10117.
def source56 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B010.Data.entryAt ⟨29, by decide +kernel⟩

def target56 : Weights.Entry :=
  { word := [8, 9, 0, 4, 2, 8, 8], weights := [1, 0, 0, 1] }

def points56 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2), (9, 0)]

-- Period 10, original row 5887, representative 10097.
def source57 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B010.Data.entryAt ⟨9, by decide +kernel⟩

def target57 : Weights.Entry :=
  { word := [8, 9, 0, 4, 6, 0, 8], weights := [1, 0, 0, 1] }

def points57 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2), (9, 0)]

-- Period 10, original row 5901, representative 10122.
def source58 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B010.Data.entryAt ⟨34, by decide +kernel⟩

def target58 : Weights.Entry :=
  { word := [8, 9, 0, 4, 10, 0, 8], weights := [1, 0, 0, 1] }

def points58 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2), (9, 0)]

-- Period 10, original row 5907, representative 10118.
def source59 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B010.Data.entryAt ⟨30, by decide +kernel⟩

def target59 : Weights.Entry :=
  { word := [8, 9, 0, 4, 10, 8, 8], weights := [1, 0, 0, 1] }

def points59 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2), (9, 0)]

-- Period 10, original row 5920, representative 10116.
def source60 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B010.Data.entryAt ⟨28, by decide +kernel⟩

def target60 : Weights.Entry :=
  { word := [8, 9, 0, 10, 2, 2, 8], weights := [0, 1, 0, 1] }

def points60 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2), (9, 0)]

-- Period 10, original row 5921, representative 10108.
def source61 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B010.Data.entryAt ⟨20, by decide +kernel⟩

def target61 : Weights.Entry :=
  { word := [8, 9, 0, 10, 2, 10, 8], weights := [1, 0, 0, 1] }

-- Period 10, original row 5922, representative 10115.
def source62 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B010.Data.entryAt ⟨27, by decide +kernel⟩

def target62 : Weights.Entry :=
  { word := [8, 9, 0, 10, 10, 2, 8], weights := [0, 1, 0, 1] }

def points62 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2), (9, 0)]

-- Period 10, original row 5923, representative 10107.
def source63 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B010.Data.entryAt ⟨19, by decide +kernel⟩

def target63 : Weights.Entry :=
  { word := [8, 9, 0, 10, 10, 10, 8], weights := [1, 0, 0, 1] }

-- Period 10, original row 5935, representative 10124.
def source64 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B010.Data.entryAt ⟨36, by decide +kernel⟩

def target64 : Weights.Entry :=
  { word := [8, 9, 0, 12, 2, 0, 8], weights := [1, 0, 0, 1] }

def points64 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2), (9, 0)]

-- Period 10, original row 5941, representative 10120.
def source65 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B010.Data.entryAt ⟨32, by decide +kernel⟩

def target65 : Weights.Entry :=
  { word := [8, 9, 0, 12, 2, 8, 8], weights := [1, 0, 0, 1] }

def points65 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2), (9, 0)]

-- Period 10, original row 5946, representative 10100.
def source66 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B010.Data.entryAt ⟨12, by decide +kernel⟩

def target66 : Weights.Entry :=
  { word := [8, 9, 0, 12, 6, 0, 8], weights := [1, 0, 0, 1] }

def points66 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2), (9, 0)]

-- Period 10, original row 5948, representative 10088.
def source67 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B010.Data.entryAt ⟨0, by decide +kernel⟩

def target67 : Weights.Entry :=
  { word := [8, 9, 0, 12, 6, 8, 8], weights := [1, 0, 0, 1] }

def points67 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2), (9, 0)]

-- Period 10, original row 5960, representative 10123.
def source68 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B010.Data.entryAt ⟨35, by decide +kernel⟩

def target68 : Weights.Entry :=
  { word := [8, 9, 0, 12, 10, 0, 8], weights := [1, 0, 0, 1] }

def points68 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2), (9, 0)]

-- Period 10, original row 5966, representative 10119.
def source69 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B010.Data.entryAt ⟨31, by decide +kernel⟩

def target69 : Weights.Entry :=
  { word := [8, 9, 0, 12, 10, 8, 8], weights := [1, 0, 0, 1] }

def points69 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2), (9, 0)]

-- Period 10, original row 5972, representative 10089.
def source70 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B010.Data.entryAt ⟨1, by decide +kernel⟩

def target70 : Weights.Entry :=
  { word := [8, 9, 4, 4, 4, 0, 8], weights := [1, 0, 0, 1] }

def points70 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 5976, representative 10094.
def source71 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B010.Data.entryAt ⟨6, by decide +kernel⟩

def target71 : Weights.Entry :=
  { word := [8, 9, 4, 4, 12, 0, 8], weights := [1, 0, 0, 1] }

def points71 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 5979, representative 10096.
def source72 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B010.Data.entryAt ⟨8, by decide +kernel⟩

def target72 : Weights.Entry :=
  { word := [8, 9, 4, 12, 4, 0, 8], weights := [1, 0, 0, 1] }

def points72 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 5982, representative 10095.
def source73 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B010.Data.entryAt ⟨7, by decide +kernel⟩

def target73 : Weights.Entry :=
  { word := [8, 9, 4, 12, 12, 0, 8], weights := [0, 1, 1, 0] }

def points73 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 5998, representative 10110.
def source74 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B010.Data.entryAt ⟨22, by decide +kernel⟩

def target74 : Weights.Entry :=
  { word := [8, 9, 8, 2, 2, 2, 8], weights := [0, 1, 0, 1] }

def points74 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 6000, representative 10102.
def source75 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B010.Data.entryAt ⟨14, by decide +kernel⟩

def target75 : Weights.Entry :=
  { word := [8, 9, 8, 2, 2, 10, 8], weights := [1, 0, 0, 1] }

-- Period 10, original row 6002, representative 10111.
def source76 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B010.Data.entryAt ⟨23, by decide +kernel⟩

def target76 : Weights.Entry :=
  { word := [8, 9, 8, 2, 10, 2, 8], weights := [0, 1, 0, 1] }

def points76 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 6004, representative 10103.
def source77 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B010.Data.entryAt ⟨15, by decide +kernel⟩

def target77 : Weights.Entry :=
  { word := [8, 9, 8, 2, 10, 10, 8], weights := [1, 0, 0, 1] }

-- Period 10, original row 6010, representative 10098.
def source78 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B010.Data.entryAt ⟨10, by decide +kernel⟩

def target78 : Weights.Entry :=
  { word := [8, 9, 8, 4, 6, 0, 8], weights := [1, 0, 0, 1] }

def points78 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 6031, representative 10113.
def source79 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B010.Data.entryAt ⟨25, by decide +kernel⟩

def target79 : Weights.Entry :=
  { word := [8, 9, 8, 10, 2, 2, 8], weights := [0, 1, 0, 1] }

def points79 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 6032, representative 10105.
def source80 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B010.Data.entryAt ⟨17, by decide +kernel⟩

def target80 : Weights.Entry :=
  { word := [8, 9, 8, 10, 2, 10, 8], weights := [0, 1, 1, 0] }

-- Period 10, original row 6033, representative 10112.
def source81 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B010.Data.entryAt ⟨24, by decide +kernel⟩

def target81 : Weights.Entry :=
  { word := [8, 9, 8, 10, 10, 2, 8], weights := [0, 1, 0, 1] }

def points81 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 6034, representative 10104.
def source82 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B010.Data.entryAt ⟨16, by decide +kernel⟩

def target82 : Weights.Entry :=
  { word := [8, 9, 8, 10, 10, 10, 8], weights := [0, 1, 1, 0] }

-- Period 10, original row 6039, representative 10099.
def source83 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B010.Data.entryAt ⟨11, by decide +kernel⟩

def target83 : Weights.Entry :=
  { word := [8, 9, 8, 12, 6, 0, 8], weights := [0, 1, 1, 0] }

def points83 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 6047, representative 10090.
def source84 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B010.Data.entryAt ⟨2, by decide +kernel⟩

def target84 : Weights.Entry :=
  { word := [8, 9, 12, 4, 4, 0, 8], weights := [1, 0, 0, 1] }

def points84 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 6051, representative 10091.
def source85 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B010.Data.entryAt ⟨3, by decide +kernel⟩

def target85 : Weights.Entry :=
  { word := [8, 9, 12, 4, 12, 0, 8], weights := [1, 0, 0, 1] }

def points85 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 6054, representative 10093.
def source86 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B010.Data.entryAt ⟨5, by decide +kernel⟩

def target86 : Weights.Entry :=
  { word := [8, 9, 12, 12, 4, 0, 8], weights := [1, 0, 0, 1] }

def points86 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 6057, representative 10092.
def source87 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B010.Data.entryAt ⟨4, by decide +kernel⟩

def target87 : Weights.Entry :=
  { word := [8, 9, 12, 12, 12, 0, 8], weights := [0, 1, 1, 0] }

def points87 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 6417, representative 10132.
def source88 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B010.Data.entryAt ⟨44, by decide +kernel⟩

def target88 : Weights.Entry :=
  { word := [8, 12, 2, 8, 2, 8, 10], weights := [0, 1, 1, 0] }

-- Period 10, original row 6425, representative 10130.
def source89 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B010.Data.entryAt ⟨42, by decide +kernel⟩

def target89 : Weights.Entry :=
  { word := [8, 12, 2, 8, 10, 8, 10], weights := [0, 1, 1, 0] }

-- Period 10, original row 6437, representative 10101.
def source90 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B010.Data.entryAt ⟨13, by decide +kernel⟩

def target90 : Weights.Entry :=
  { word := [8, 12, 4, 4, 0, 8, 9], weights := [1, 0, 0, 1] }

def points90 : List (ℕ × ℕ) := [(0, 9), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 6451, representative 10102.
def source91 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B010.Data.entryAt ⟨14, by decide +kernel⟩

def target91 : Weights.Entry :=
  { word := [8, 12, 4, 4, 8, 8, 9], weights := [1, 0, 0, 1] }

def points91 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 6465, representative 10108.
def source92 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B010.Data.entryAt ⟨20, by decide +kernel⟩

def target92 : Weights.Entry :=
  { word := [8, 12, 4, 12, 0, 8, 9], weights := [1, 0, 0, 1] }

def points92 : List (ℕ × ℕ) := [(0, 9), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 6479, representative 10105.
def source93 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B010.Data.entryAt ⟨17, by decide +kernel⟩

def target93 : Weights.Entry :=
  { word := [8, 12, 4, 12, 8, 8, 9], weights := [0, 1, 1, 0] }

def points93 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 6486, representative 10133.
def source94 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B010.Data.entryAt ⟨45, by decide +kernel⟩

def target94 : Weights.Entry :=
  { word := [8, 12, 6, 8, 8, 8, 10], weights := [0, 1, 1, 0] }

-- Period 10, original row 6579, representative 10131.
def source95 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B010.Data.entryAt ⟨43, by decide +kernel⟩

def target95 : Weights.Entry :=
  { word := [8, 12, 10, 8, 2, 8, 10], weights := [0, 1, 1, 0] }

-- Period 10, original row 6582, representative 10129.
def source96 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B010.Data.entryAt ⟨41, by decide +kernel⟩

def target96 : Weights.Entry :=
  { word := [8, 12, 10, 8, 10, 8, 10], weights := [0, 1, 1, 0] }

-- Period 10, original row 6587, representative 10106.
def source97 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B010.Data.entryAt ⟨18, by decide +kernel⟩

def target97 : Weights.Entry :=
  { word := [8, 12, 12, 4, 0, 8, 9], weights := [1, 0, 0, 1] }

def points97 : List (ℕ × ℕ) := [(0, 9), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 6601, representative 10103.
def source98 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B010.Data.entryAt ⟨15, by decide +kernel⟩

def target98 : Weights.Entry :=
  { word := [8, 12, 12, 4, 8, 8, 9], weights := [1, 0, 0, 1] }

def points98 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 6608, representative 10107.
def source99 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B010.Data.entryAt ⟨19, by decide +kernel⟩

def target99 : Weights.Entry :=
  { word := [8, 12, 12, 12, 0, 8, 9], weights := [1, 0, 0, 1] }

def points99 : List (ℕ × ℕ) := [(0, 9), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 6622, representative 10104.
def source100 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B010.Data.entryAt ⟨16, by decide +kernel⟩

def target100 : Weights.Entry :=
  { word := [8, 12, 12, 12, 8, 8, 9], weights := [0, 1, 1, 0] }

def points100 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 6709, representative 10089.
def source101 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B010.Data.entryAt ⟨1, by decide +kernel⟩

def target101 : Weights.Entry :=
  { word := [9, 0, 2, 2, 2, 8, 9], weights := [1, 0, 0, 1] }

def points101 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8), (9, 9)]

-- Period 10, original row 6724, representative 10090.
def source102 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B010.Data.entryAt ⟨2, by decide +kernel⟩

def target102 : Weights.Entry :=
  { word := [9, 0, 2, 2, 10, 8, 9], weights := [1, 0, 0, 1] }

def points102 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8), (9, 9)]

-- Period 10, original row 6738, representative 10096.
def source103 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B010.Data.entryAt ⟨8, by decide +kernel⟩

def target103 : Weights.Entry :=
  { word := [9, 0, 2, 10, 2, 8, 9], weights := [1, 0, 0, 1] }

def points103 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8), (9, 9)]

-- Period 10, original row 6752, representative 10093.
def source104 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B010.Data.entryAt ⟨5, by decide +kernel⟩

def target104 : Weights.Entry :=
  { word := [9, 0, 2, 10, 10, 8, 9], weights := [1, 0, 0, 1] }

def points104 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8), (9, 9)]

-- Period 10, original row 6764, representative 10121.
def source105 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B010.Data.entryAt ⟨33, by decide +kernel⟩

def target105 : Weights.Entry :=
  { word := [9, 0, 4, 2, 0, 8, 9], weights := [1, 0, 0, 1] }

def points105 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8), (9, 9)]

-- Period 10, original row 6796, representative 10124.
def source106 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B010.Data.entryAt ⟨36, by decide +kernel⟩

def target106 : Weights.Entry :=
  { word := [9, 0, 4, 10, 0, 8, 9], weights := [1, 0, 0, 1] }

def points106 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8), (9, 9)]

-- Period 10, original row 6873, representative 10094.
def source107 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B010.Data.entryAt ⟨6, by decide +kernel⟩

def target107 : Weights.Entry :=
  { word := [9, 0, 10, 2, 2, 8, 9], weights := [1, 0, 0, 1] }

def points107 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8), (9, 9)]

-- Period 10, original row 6881, representative 10091.
def source108 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B010.Data.entryAt ⟨3, by decide +kernel⟩

def target108 : Weights.Entry :=
  { word := [9, 0, 10, 2, 10, 8, 9], weights := [1, 0, 0, 1] }

def points108 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8), (9, 9)]

-- Period 10, original row 6888, representative 10095.
def source109 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B010.Data.entryAt ⟨7, by decide +kernel⟩

def target109 : Weights.Entry :=
  { word := [9, 0, 10, 10, 2, 8, 9], weights := [0, 1, 1, 0] }

def points109 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8), (9, 9)]

-- Period 10, original row 6895, representative 10092.
def source110 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B010.Data.entryAt ⟨4, by decide +kernel⟩

def target110 : Weights.Entry :=
  { word := [9, 0, 10, 10, 10, 8, 9], weights := [0, 1, 1, 0] }

def points110 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8), (9, 9)]

-- Period 10, original row 6907, representative 10122.
def source111 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B010.Data.entryAt ⟨34, by decide +kernel⟩

def target111 : Weights.Entry :=
  { word := [9, 0, 12, 2, 0, 8, 9], weights := [1, 0, 0, 1] }

def points111 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8), (9, 9)]

-- Period 10, original row 6942, representative 10123.
def source112 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B010.Data.entryAt ⟨35, by decide +kernel⟩

def target112 : Weights.Entry :=
  { word := [9, 0, 12, 10, 0, 8, 9], weights := [1, 0, 0, 1] }

def points112 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8), (9, 9)]

-- Period 10, original row 6974, representative 10109.
def source113 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B010.Data.entryAt ⟨21, by decide +kernel⟩

def target113 : Weights.Entry :=
  { word := [9, 4, 4, 4, 0, 8, 9], weights := [1, 0, 0, 1] }

def points113 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8), (9, 9)]

-- Period 10, original row 6988, representative 10110.
def source114 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B010.Data.entryAt ⟨22, by decide +kernel⟩

def target114 : Weights.Entry :=
  { word := [9, 4, 4, 4, 8, 8, 9], weights := [1, 0, 1, 0] }

def points114 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8), (9, 9)]

-- Period 10, original row 7002, representative 10116.
def source115 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B010.Data.entryAt ⟨28, by decide +kernel⟩

def target115 : Weights.Entry :=
  { word := [9, 4, 4, 12, 0, 8, 9], weights := [1, 0, 1, 0] }

def points115 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8), (9, 9)]

-- Period 10, original row 7016, representative 10113.
def source116 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B010.Data.entryAt ⟨25, by decide +kernel⟩

def target116 : Weights.Entry :=
  { word := [9, 4, 4, 12, 8, 8, 9], weights := [1, 0, 1, 0] }

def points116 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8), (9, 9)]

-- Period 10, original row 7023, representative 10114.
def source117 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B010.Data.entryAt ⟨26, by decide +kernel⟩

def target117 : Weights.Entry :=
  { word := [9, 4, 12, 4, 0, 8, 9], weights := [1, 0, 0, 1] }

def points117 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8), (9, 9)]

-- Period 10, original row 7037, representative 10111.
def source118 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B010.Data.entryAt ⟨23, by decide +kernel⟩

def target118 : Weights.Entry :=
  { word := [9, 4, 12, 4, 8, 8, 9], weights := [1, 0, 1, 0] }

def points118 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8), (9, 9)]

-- Period 10, original row 7044, representative 10115.
def source119 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B010.Data.entryAt ⟨27, by decide +kernel⟩

def target119 : Weights.Entry :=
  { word := [9, 4, 12, 12, 0, 8, 9], weights := [1, 0, 1, 0] }

def points119 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8), (9, 9)]

-- Period 10, original row 7058, representative 10112.
def source120 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B010.Data.entryAt ⟨24, by decide +kernel⟩

def target120 : Weights.Entry :=
  { word := [9, 4, 12, 12, 8, 8, 9], weights := [1, 0, 1, 0] }

def points120 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8), (9, 9)]

-- Period 10, original row 7146, representative 10139.
def source121 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B010.Data.entryAt ⟨51, by decide +kernel⟩

def target121 : Weights.Entry :=
  { word := [9, 8, 2, 2, 2, 8, 10], weights := [1, 0, 0, 1] }

def points121 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8), (9, 9)]

-- Period 10, original row 7147, representative 10147.
def source122 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B010.Data.entryAt ⟨59, by decide +kernel⟩

def target122 : Weights.Entry :=
  { word := [9, 8, 2, 2, 2, 8, 12], weights := [1, 0, 0, 1] }

def points122 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8), (9, 9)]

-- Period 10, original row 7161, representative 10140.
def source123 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B010.Data.entryAt ⟨52, by decide +kernel⟩

def target123 : Weights.Entry :=
  { word := [9, 8, 2, 2, 10, 8, 10], weights := [1, 0, 0, 1] }

def points123 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8), (9, 9)]

-- Period 10, original row 7162, representative 10148.
def source124 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B010.Data.entryAt ⟨60, by decide +kernel⟩

def target124 : Weights.Entry :=
  { word := [9, 8, 2, 2, 10, 8, 12], weights := [1, 0, 0, 1] }

def points124 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8), (9, 9)]

-- Period 10, original row 7175, representative 10146.
def source125 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B010.Data.entryAt ⟨58, by decide +kernel⟩

def target125 : Weights.Entry :=
  { word := [9, 8, 2, 10, 2, 8, 10], weights := [0, 1, 1, 0] }

def points125 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8), (9, 9)]

-- Period 10, original row 7189, representative 10143.
def source126 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B010.Data.entryAt ⟨55, by decide +kernel⟩

def target126 : Weights.Entry :=
  { word := [9, 8, 2, 10, 10, 8, 10], weights := [0, 1, 1, 0] }

def points126 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8), (9, 9)]

-- Period 10, original row 7190, representative 10151.
def source127 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B010.Data.entryAt ⟨63, by decide +kernel⟩

def target127 : Weights.Entry :=
  { word := [9, 8, 2, 10, 10, 8, 12], weights := [1, 0, 0, 1] }

def points127 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8), (9, 9)]

def period10Entries : List Weights.Entry := [target0, target1, target2, target3, target4, target5, target6, target7, target8, target9, target10, target11, target12, target13, target14, target15, target16, target17, target18, target19, target20, target21, target22, target23, target24, target25, target26, target27, target28, target29, target30, target31, target32, target33, target34, target35, target36, target37, target38, target39, target40, target41, target42, target43, target44, target45, target46, target47, target48, target49, target50, target51, target52, target53, target54, target55, target56, target57, target58, target59, target60, target61, target62, target63, target64, target65, target66, target67, target68, target69, target70, target71, target72, target73, target74, target75, target76, target77, target78, target79, target80, target81, target82, target83, target84, target85, target86, target87, target88, target89, target90, target91, target92, target93, target94, target95, target96, target97, target98, target99, target100, target101, target102, target103, target104, target105, target106, target107, target108, target109, target110, target111, target112, target113, target114, target115, target116, target117, target118, target119, target120, target121, target122, target123, target124, target125, target126, target127]

def period10Chunk : RowCoverage.Chunk where
  rows := [⟨4207, target0⟩, ⟨4222, target1⟩, ⟨4236, target2⟩, ⟨4250, target3⟩, ⟨4262, target4⟩, ⟨4294, target5⟩, ⟨4320, target6⟩, ⟨4328, target7⟩, ⟨4335, target8⟩, ⟨4342, target9⟩, ⟨4401, target10⟩, ⟨4409, target11⟩, ⟨4416, target12⟩, ⟨4423, target13⟩, ⟨4435, target14⟩, ⟨4470, target15⟩, ⟨5087, target16⟩, ⟨5095, target17⟩, ⟨5107, target18⟩, ⟨5121, target19⟩, ⟨5135, target20⟩, ⟨5149, target21⟩, ⟨5156, target22⟩, ⟨5249, target23⟩, ⟨5252, target24⟩, ⟨5257, target25⟩, ⟨5271, target26⟩, ⟨5278, target27⟩, ⟨5292, target28⟩, ⟨5320, target29⟩, ⟨5326, target30⟩, ⟨5529, target31⟩, ⟨5530, target32⟩, ⟨5544, target33⟩, ⟨5545, target34⟩, ⟨5558, target35⟩, ⟨5572, target36⟩, ⟨5573, target37⟩, ⟨5583, target38⟩, ⟨5622, target39⟩, ⟨5661, target40⟩, ⟨5674, target41⟩, ⟨5680, target42⟩, ⟨5758, target43⟩, ⟨5766, target44⟩, ⟨5767, target45⟩, ⟨5773, target46⟩, ⟨5780, target47⟩, ⟨5781, target48⟩, ⟨5791, target49⟩, ⟨5829, target50⟩, ⟨5861, target51⟩, ⟨5863, target52⟩, ⟨5865, target53⟩, ⟨5867, target54⟩, ⟨5875, target55⟩, ⟨5881, target56⟩, ⟨5887, target57⟩, ⟨5901, target58⟩, ⟨5907, target59⟩, ⟨5920, target60⟩, ⟨5921, target61⟩, ⟨5922, target62⟩, ⟨5923, target63⟩, ⟨5935, target64⟩, ⟨5941, target65⟩, ⟨5946, target66⟩, ⟨5948, target67⟩, ⟨5960, target68⟩, ⟨5966, target69⟩, ⟨5972, target70⟩, ⟨5976, target71⟩, ⟨5979, target72⟩, ⟨5982, target73⟩, ⟨5998, target74⟩, ⟨6000, target75⟩, ⟨6002, target76⟩, ⟨6004, target77⟩, ⟨6010, target78⟩, ⟨6031, target79⟩, ⟨6032, target80⟩, ⟨6033, target81⟩, ⟨6034, target82⟩, ⟨6039, target83⟩, ⟨6047, target84⟩, ⟨6051, target85⟩, ⟨6054, target86⟩, ⟨6057, target87⟩, ⟨6417, target88⟩, ⟨6425, target89⟩, ⟨6437, target90⟩, ⟨6451, target91⟩, ⟨6465, target92⟩, ⟨6479, target93⟩, ⟨6486, target94⟩, ⟨6579, target95⟩, ⟨6582, target96⟩, ⟨6587, target97⟩, ⟨6601, target98⟩, ⟨6608, target99⟩, ⟨6622, target100⟩, ⟨6709, target101⟩, ⟨6724, target102⟩, ⟨6738, target103⟩, ⟨6752, target104⟩, ⟨6764, target105⟩, ⟨6796, target106⟩, ⟨6873, target107⟩, ⟨6881, target108⟩, ⟨6888, target109⟩, ⟨6895, target110⟩, ⟨6907, target111⟩, ⟨6942, target112⟩, ⟨6974, target113⟩, ⟨6988, target114⟩, ⟨7002, target115⟩, ⟨7016, target116⟩, ⟨7023, target117⟩, ⟨7037, target118⟩, ⟨7044, target119⟩, ⟨7058, target120⟩, ⟨7146, target121⟩, ⟨7147, target122⟩, ⟨7161, target123⟩, ⟨7162, target124⟩, ⟨7175, target125⟩, ⟨7189, target126⟩, ⟨7190, target127⟩]
  indexMask := 38174109977806271767567551519681015069502569799112565792368126437085034732423166065767631914424295941169416430941250352456426069394264673357814737157935756531345748324453749525006797130242252609431344774268544920554232942534528798040878919127806004414259848326017880793260836563568049174486827428738002713290509461359720418399953850046240980757857120701584627343351581120550049905006879623183944901131575415713938665806248181162502036953467231411962519167580141988029946832844368299060273247589241764964303072142642419936365824903107701417655888141291345437719775805290762576647863878711477605630083251592244900239240980829769029434174472072805440688975975765651294567060721189047052721529470152670954634406549200666951400977428914780265665171903342794402003565971878062425628897826632175496437052305181289047282351072795148690697576478085772892743445196414257040195301025950382868019693863296264571246214628448531315423949094305725608521273624747774341847186483771316758635998579381329322840149400298343595560441472017261771637810538857582090575664603700784820696793904994857400629199280117834105511531300952655974693453568663278529861218538170646397292519174895151786228110547588611129720318059578204529278975833674569030780954710738282080120807098246056198705903898545252444320547510622505705834420797131499168399513618123445484177366582480249824240890109917846084603147664580195401594378688626267467241598463936763520196004747616164604408184269036902920330855111623043629282911254111964618519152753235731028807866819989812779186497015303508656394529908414172737989323551678593645542442641705108619718239033026168586607323862770695094060969960756786815617076197987038432570956677504054238565454836624588654940422081259492516347277995742474911603919982919455366340435979617811007088984210481822265940475539579888865832160534266922401960481968673934111500722781363888115446624611393035759716233192244219233706239994038085976377449063325333365702906315553566500644724597402344022885357304278010557394121682354438289506741295539882613940430516234697990417248562802060574830407248688595372648766879230486788265477496767598159010587739066178989356109978995280700243968
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

end FranklSmallCyclic.TransportBatches.G088.B000.Data
