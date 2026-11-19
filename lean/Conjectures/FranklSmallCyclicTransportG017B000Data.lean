module

public import Conjectures.FranklSmallCyclicRowCoverage
public import Conjectures.FranklSmallCyclicCanonicalWords
public import Conjectures.FranklSmallCyclicOrbit7Block017Data

/-! 128 literal targets sharing one source proof block.
Original words and row indices are retained; weights may be transported.
-/
@[expose] public section

namespace FranklSmallCyclic.TransportBatches.G017.B000.Data

-- Period 7, original row 14, representative 2254.
def source0 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B017.Data.entryAt ⟨64, by decide +kernel⟩

def target0 : Weights.Entry :=
  { word := [0, 0, 1, 4, 8, 4, 2], weights := [1, 0, 1, 0] }

-- Period 7, original row 15, representative 2272.
def source1 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B017.Data.entryAt ⟨82, by decide +kernel⟩

def target1 : Weights.Entry :=
  { word := [0, 0, 1, 4, 8, 4, 4], weights := [1, 0, 0, 1] }

-- Period 7, original row 37, representative 2261.
def source2 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B017.Data.entryAt ⟨71, by decide +kernel⟩

def target2 : Weights.Entry :=
  { word := [0, 0, 1, 12, 8, 4, 2], weights := [1, 0, 1, 0] }

-- Period 7, original row 38, representative 2275.
def source3 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B017.Data.entryAt ⟨85, by decide +kernel⟩

def target3 : Weights.Entry :=
  { word := [0, 0, 1, 12, 8, 4, 4], weights := [1, 0, 1, 0] }

-- Period 7, original row 149, representative 2196.
def source4 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B017.Data.entryAt ⟨6, by decide +kernel⟩

def target4 : Weights.Entry :=
  { word := [0, 1, 4, 2, 0, 8, 1], weights := [1, 0, 0, 1] }

-- Period 7, original row 150, representative 2244.
def source5 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B017.Data.entryAt ⟨54, by decide +kernel⟩

def target5 : Weights.Entry :=
  { word := [0, 1, 4, 2, 0, 8, 2], weights := [1, 0, 0, 1] }

-- Period 7, original row 177, representative 2199.
def source6 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B017.Data.entryAt ⟨9, by decide +kernel⟩

def target6 : Weights.Entry :=
  { word := [0, 1, 4, 10, 0, 8, 1], weights := [1, 0, 0, 1] }

-- Period 7, original row 178, representative 2251.
def source7 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B017.Data.entryAt ⟨61, by decide +kernel⟩

def target7 : Weights.Entry :=
  { word := [0, 1, 4, 10, 0, 8, 2], weights := [1, 0, 0, 1] }

-- Period 7, original row 212, representative 2272.
def source8 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B017.Data.entryAt ⟨82, by decide +kernel⟩

def target8 : Weights.Entry :=
  { word := [0, 1, 8, 4, 4, 4, 0], weights := [0, 0, 1, 1] }

def points8 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 4), (5, 3), (6, 5)]

-- Period 7, original row 229, representative 2275.
def source9 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B017.Data.entryAt ⟨85, by decide +kernel⟩

def target9 : Weights.Entry :=
  { word := [0, 1, 8, 12, 4, 4, 0], weights := [1, 0, 0, 1] }

def points9 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 4), (5, 3), (6, 5)]

-- Period 7, original row 238, representative 2197.
def source10 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B017.Data.entryAt ⟨7, by decide +kernel⟩

def target10 : Weights.Entry :=
  { word := [0, 1, 12, 2, 0, 8, 1], weights := [1, 0, 0, 1] }

-- Period 7, original row 239, representative 2249.
def source11 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B017.Data.entryAt ⟨59, by decide +kernel⟩

def target11 : Weights.Entry :=
  { word := [0, 1, 12, 2, 0, 8, 2], weights := [1, 0, 0, 1] }

-- Period 7, original row 270, representative 2198.
def source12 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B017.Data.entryAt ⟨8, by decide +kernel⟩

def target12 : Weights.Entry :=
  { word := [0, 1, 12, 10, 0, 8, 1], weights := [1, 0, 0, 1] }

-- Period 7, original row 271, representative 2250.
def source13 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B017.Data.entryAt ⟨60, by decide +kernel⟩

def target13 : Weights.Entry :=
  { word := [0, 1, 12, 10, 0, 8, 2], weights := [1, 0, 0, 1] }

-- Period 7, original row 321, representative 2196.
def source14 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B017.Data.entryAt ⟨6, by decide +kernel⟩

def target14 : Weights.Entry :=
  { word := [0, 2, 2, 2, 0, 8, 1], weights := [0, 1, 0, 1] }

def points14 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6)]

-- Period 7, original row 322, representative 2244.
def source15 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B017.Data.entryAt ⟨54, by decide +kernel⟩

def target15 : Weights.Entry :=
  { word := [0, 2, 2, 2, 0, 8, 2], weights := [0, 1, 0, 1] }

def points15 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6)]

-- Period 7, original row 332, representative 2272.
def source16 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B017.Data.entryAt ⟨82, by decide +kernel⟩

def target16 : Weights.Entry :=
  { word := [0, 2, 2, 2, 8, 0, 1], weights := [1, 1, 0, 0] }

def points16 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 5), (5, 6), (6, 4)]

-- Period 7, original row 333, representative 2264.
def source17 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B017.Data.entryAt ⟨74, by decide +kernel⟩

def target17 : Weights.Entry :=
  { word := [0, 2, 2, 2, 8, 0, 2], weights := [1, 1, 0, 0] }

-- Period 7, original row 350, representative 2240.
def source18 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B017.Data.entryAt ⟨50, by decide +kernel⟩

def target18 : Weights.Entry :=
  { word := [0, 2, 2, 2, 8, 8, 2], weights := [1, 0, 0, 1] }

-- Period 7, original row 369, representative 2199.
def source19 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B017.Data.entryAt ⟨9, by decide +kernel⟩

def target19 : Weights.Entry :=
  { word := [0, 2, 2, 10, 0, 8, 1], weights := [0, 1, 0, 1] }

def points19 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6)]

-- Period 7, original row 370, representative 2251.
def source20 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B017.Data.entryAt ⟨61, by decide +kernel⟩

def target20 : Weights.Entry :=
  { word := [0, 2, 2, 10, 0, 8, 2], weights := [0, 1, 0, 1] }

def points20 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6)]

-- Period 7, original row 383, representative 2275.
def source21 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B017.Data.entryAt ⟨85, by decide +kernel⟩

def target21 : Weights.Entry :=
  { word := [0, 2, 2, 10, 8, 0, 1], weights := [1, 0, 0, 1] }

def points21 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 5), (5, 6), (6, 4)]

-- Period 7, original row 384, representative 2271.
def source22 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B017.Data.entryAt ⟨81, by decide +kernel⟩

def target22 : Weights.Entry :=
  { word := [0, 2, 2, 10, 8, 0, 2], weights := [1, 1, 0, 0] }

-- Period 7, original row 397, representative 2191.
def source23 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B017.Data.entryAt ⟨1, by decide +kernel⟩

def target23 : Weights.Entry :=
  { word := [0, 2, 2, 10, 8, 8, 1], weights := [0, 1, 1, 0] }

-- Period 7, original row 398, representative 2243.
def source24 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B017.Data.entryAt ⟨53, by decide +kernel⟩

def target24 : Weights.Entry :=
  { word := [0, 2, 2, 10, 8, 8, 2], weights := [0, 1, 1, 0] }

-- Period 7, original row 426, representative 2197.
def source25 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B017.Data.entryAt ⟨7, by decide +kernel⟩

def target25 : Weights.Entry :=
  { word := [0, 2, 10, 2, 0, 8, 1], weights := [0, 1, 0, 1] }

def points25 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6)]

-- Period 7, original row 427, representative 2249.
def source26 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B017.Data.entryAt ⟨59, by decide +kernel⟩

def target26 : Weights.Entry :=
  { word := [0, 2, 10, 2, 0, 8, 2], weights := [0, 1, 0, 1] }

def points26 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6)]

-- Period 7, original row 448, representative 2241.
def source27 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B017.Data.entryAt ⟨51, by decide +kernel⟩

def target27 : Weights.Entry :=
  { word := [0, 2, 10, 2, 8, 8, 2], weights := [1, 0, 0, 1] }

-- Period 7, original row 471, representative 2198.
def source28 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B017.Data.entryAt ⟨8, by decide +kernel⟩

def target28 : Weights.Entry :=
  { word := [0, 2, 10, 10, 0, 8, 1], weights := [0, 1, 0, 1] }

def points28 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6)]

-- Period 7, original row 472, representative 2250.
def source29 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B017.Data.entryAt ⟨60, by decide +kernel⟩

def target29 : Weights.Entry :=
  { word := [0, 2, 10, 10, 0, 8, 2], weights := [0, 1, 0, 1] }

def points29 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6)]

-- Period 7, original row 492, representative 2190.
def source30 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B017.Data.entryAt ⟨0, by decide +kernel⟩

def target30 : Weights.Entry :=
  { word := [0, 2, 10, 10, 8, 8, 1], weights := [0, 1, 1, 0] }

-- Period 7, original row 493, representative 2242.
def source31 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B017.Data.entryAt ⟨52, by decide +kernel⟩

def target31 : Weights.Entry :=
  { word := [0, 2, 10, 10, 8, 8, 2], weights := [0, 1, 1, 0] }

-- Period 7, original row 520, representative 2254.
def source32 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B017.Data.entryAt ⟨64, by decide +kernel⟩

def target32 : Weights.Entry :=
  { word := [0, 4, 0, 4, 8, 4, 2], weights := [1, 0, 0, 1] }

def points32 : List (ℕ × ℕ) := [(0, 0), (1, 2), (2, 1), (3, 3), (4, 4), (5, 6), (6, 5)]

-- Period 7, original row 521, representative 2264.
def source33 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B017.Data.entryAt ⟨74, by decide +kernel⟩

def target33 : Weights.Entry :=
  { word := [0, 4, 0, 4, 8, 4, 4], weights := [1, 0, 0, 1] }

def points33 : List (ℕ × ℕ) := [(0, 0), (1, 2), (2, 1), (3, 3), (4, 6), (5, 4), (6, 5)]

-- Period 7, original row 543, representative 2261.
def source34 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B017.Data.entryAt ⟨71, by decide +kernel⟩

def target34 : Weights.Entry :=
  { word := [0, 4, 0, 12, 8, 4, 2], weights := [1, 0, 0, 1] }

def points34 : List (ℕ × ℕ) := [(0, 0), (1, 2), (2, 1), (3, 3), (4, 4), (5, 6), (6, 5)]

-- Period 7, original row 544, representative 2271.
def source35 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B017.Data.entryAt ⟨81, by decide +kernel⟩

def target35 : Weights.Entry :=
  { word := [0, 4, 0, 12, 8, 4, 4], weights := [1, 0, 0, 1] }

def points35 : List (ℕ × ℕ) := [(0, 0), (1, 2), (2, 1), (3, 3), (4, 6), (5, 4), (6, 5)]

-- Period 7, original row 588, representative 2209.
def source36 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B017.Data.entryAt ⟨19, by decide +kernel⟩

def target36 : Weights.Entry :=
  { word := [0, 4, 2, 8, 8, 4, 2], weights := [0, 1, 1, 0] }

-- Period 7, original row 651, representative 2259.
def source37 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B017.Data.entryAt ⟨69, by decide +kernel⟩

def target37 : Weights.Entry :=
  { word := [0, 4, 8, 4, 8, 4, 2], weights := [1, 0, 1, 0] }

-- Period 7, original row 652, representative 2269.
def source38 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B017.Data.entryAt ⟨79, by decide +kernel⟩

def target38 : Weights.Entry :=
  { word := [0, 4, 8, 4, 8, 4, 4], weights := [1, 0, 0, 1] }

-- Period 7, original row 679, representative 2260.
def source39 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B017.Data.entryAt ⟨70, by decide +kernel⟩

def target39 : Weights.Entry :=
  { word := [0, 4, 8, 12, 8, 4, 2], weights := [1, 0, 1, 0] }

-- Period 7, original row 680, representative 2270.
def source40 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B017.Data.entryAt ⟨80, by decide +kernel⟩

def target40 : Weights.Entry :=
  { word := [0, 4, 8, 12, 8, 4, 4], weights := [1, 0, 1, 0] }

-- Period 7, original row 708, representative 2208.
def source41 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B017.Data.entryAt ⟨18, by decide +kernel⟩

def target41 : Weights.Entry :=
  { word := [0, 4, 10, 8, 8, 4, 2], weights := [0, 1, 1, 0] }

-- Period 7, original row 793, representative 2280.
def source42 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B017.Data.entryAt ⟨90, by decide +kernel⟩

def target42 : Weights.Entry :=
  { word := [0, 8, 0, 0, 1, 4, 2], weights := [0, 0, 1, 1] }

-- Period 7, original row 794, representative 2278.
def source43 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B017.Data.entryAt ⟨88, by decide +kernel⟩

def target43 : Weights.Entry :=
  { word := [0, 8, 0, 0, 1, 4, 4], weights := [0, 0, 1, 1] }

-- Period 7, original row 801, representative 2252.
def source44 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B017.Data.entryAt ⟨62, by decide +kernel⟩

def target44 : Weights.Entry :=
  { word := [0, 8, 0, 0, 9, 4, 4], weights := [0, 0, 1, 1] }

-- Period 7, original row 805, representative 2280.
def source45 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B017.Data.entryAt ⟨90, by decide +kernel⟩

def target45 : Weights.Entry :=
  { word := [0, 8, 0, 4, 0, 4, 2], weights := [0, 0, 1, 1] }

def points45 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6)]

-- Period 7, original row 806, representative 2278.
def source46 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B017.Data.entryAt ⟨88, by decide +kernel⟩

def target46 : Weights.Entry :=
  { word := [0, 8, 0, 4, 0, 4, 4], weights := [0, 0, 1, 1] }

def points46 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6)]

-- Period 7, original row 831, representative 2262.
def source47 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B017.Data.entryAt ⟨72, by decide +kernel⟩

def target47 : Weights.Entry :=
  { word := [0, 8, 0, 4, 8, 4, 2], weights := [1, 0, 1, 0] }

-- Period 7, original row 832, representative 2276.
def source48 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B017.Data.entryAt ⟨86, by decide +kernel⟩

def target48 : Weights.Entry :=
  { word := [0, 8, 0, 4, 8, 4, 4], weights := [1, 0, 0, 1] }

-- Period 7, original row 853, representative 2281.
def source49 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B017.Data.entryAt ⟨91, by decide +kernel⟩

def target49 : Weights.Entry :=
  { word := [0, 8, 0, 8, 1, 4, 2], weights := [0, 1, 1, 0] }

-- Period 7, original row 854, representative 2279.
def source50 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B017.Data.entryAt ⟨89, by decide +kernel⟩

def target50 : Weights.Entry :=
  { word := [0, 8, 0, 8, 1, 4, 4], weights := [0, 1, 1, 0] }

-- Period 7, original row 861, representative 2211.
def source51 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B017.Data.entryAt ⟨21, by decide +kernel⟩

def target51 : Weights.Entry :=
  { word := [0, 8, 0, 8, 4, 4, 4], weights := [0, 1, 0, 1] }

-- Period 7, original row 863, representative 2282.
def source52 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B017.Data.entryAt ⟨92, by decide +kernel⟩

def target52 : Weights.Entry :=
  { word := [0, 8, 0, 8, 8, 4, 4], weights := [0, 1, 0, 1] }

-- Period 7, original row 868, representative 2253.
def source53 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B017.Data.entryAt ⟨63, by decide +kernel⟩

def target53 : Weights.Entry :=
  { word := [0, 8, 0, 8, 9, 4, 4], weights := [0, 1, 1, 0] }

-- Period 7, original row 872, representative 2205.
def source54 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B017.Data.entryAt ⟨15, by decide +kernel⟩

def target54 : Weights.Entry :=
  { word := [0, 8, 0, 8, 12, 4, 4], weights := [0, 1, 0, 1] }

-- Period 7, original row 874, representative 2281.
def source55 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B017.Data.entryAt ⟨91, by decide +kernel⟩

def target55 : Weights.Entry :=
  { word := [0, 8, 0, 12, 0, 4, 2], weights := [1, 0, 1, 0] }

def points55 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6)]

-- Period 7, original row 875, representative 2279.
def source56 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B017.Data.entryAt ⟨89, by decide +kernel⟩

def target56 : Weights.Entry :=
  { word := [0, 8, 0, 12, 0, 4, 4], weights := [1, 0, 1, 0] }

def points56 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6)]

-- Period 7, original row 883, representative 2263.
def source57 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B017.Data.entryAt ⟨73, by decide +kernel⟩

def target57 : Weights.Entry :=
  { word := [0, 8, 0, 12, 8, 4, 2], weights := [1, 0, 1, 0] }

-- Period 7, original row 884, representative 2277.
def source58 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B017.Data.entryAt ⟨87, by decide +kernel⟩

def target58 : Weights.Entry :=
  { word := [0, 8, 0, 12, 8, 4, 4], weights := [1, 0, 1, 0] }

-- Period 7, original row 906, representative 2255.
def source59 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B017.Data.entryAt ⟨65, by decide +kernel⟩

def target59 : Weights.Entry :=
  { word := [0, 8, 1, 4, 8, 4, 2], weights := [1, 0, 1, 0] }

-- Period 7, original row 907, representative 2273.
def source60 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B017.Data.entryAt ⟨83, by decide +kernel⟩

def target60 : Weights.Entry :=
  { word := [0, 8, 1, 4, 8, 4, 4], weights := [1, 0, 0, 1] }

-- Period 7, original row 929, representative 2258.
def source61 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B017.Data.entryAt ⟨68, by decide +kernel⟩

def target61 : Weights.Entry :=
  { word := [0, 8, 1, 12, 8, 4, 2], weights := [1, 0, 1, 0] }

-- Period 7, original row 930, representative 2274.
def source62 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B017.Data.entryAt ⟨84, by decide +kernel⟩

def target62 : Weights.Entry :=
  { word := [0, 8, 1, 12, 8, 4, 4], weights := [1, 0, 1, 0] }

-- Period 7, original row 1004, representative 2203.
def source63 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B017.Data.entryAt ⟨13, by decide +kernel⟩

def target63 : Weights.Entry :=
  { word := [0, 8, 4, 8, 4, 4, 4], weights := [0, 1, 0, 1] }

-- Period 7, original row 1008, representative 2201.
def source64 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B017.Data.entryAt ⟨11, by decide +kernel⟩

def target64 : Weights.Entry :=
  { word := [0, 8, 4, 8, 12, 4, 4], weights := [0, 1, 0, 1] }

-- Period 7, original row 1054, representative 2210.
def source65 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B017.Data.entryAt ⟨20, by decide +kernel⟩

def target65 : Weights.Entry :=
  { word := [0, 8, 8, 8, 4, 4, 4], weights := [0, 1, 0, 1] }

-- Period 7, original row 1056, representative 2284.
def source66 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B017.Data.entryAt ⟨94, by decide +kernel⟩

def target66 : Weights.Entry :=
  { word := [0, 8, 8, 8, 4, 6, 8], weights := [0, 1, 1, 0] }

-- Period 7, original row 1059, representative 2204.
def source67 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B017.Data.entryAt ⟨14, by decide +kernel⟩

def target67 : Weights.Entry :=
  { word := [0, 8, 8, 8, 12, 4, 4], weights := [0, 1, 0, 1] }

-- Period 7, original row 1061, representative 2283.
def source68 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B017.Data.entryAt ⟨93, by decide +kernel⟩

def target68 : Weights.Entry :=
  { word := [0, 8, 8, 8, 12, 6, 8], weights := [0, 1, 1, 0] }

-- Period 7, original row 1118, representative 2202.
def source69 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B017.Data.entryAt ⟨12, by decide +kernel⟩

def target69 : Weights.Entry :=
  { word := [0, 8, 12, 8, 4, 4, 4], weights := [0, 1, 0, 1] }

-- Period 7, original row 1122, representative 2200.
def source70 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B017.Data.entryAt ⟨10, by decide +kernel⟩

def target70 : Weights.Entry :=
  { word := [0, 8, 12, 8, 12, 4, 4], weights := [0, 1, 0, 1] }

-- Period 7, original row 1150, representative 2196.
def source71 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B017.Data.entryAt ⟨6, by decide +kernel⟩

def target71 : Weights.Entry :=
  { word := [0, 9, 0, 4, 2, 0, 1], weights := [1, 0, 0, 1] }

def points71 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 1151, representative 2196.
def source72 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B017.Data.entryAt ⟨6, by decide +kernel⟩

def target72 : Weights.Entry :=
  { word := [0, 9, 0, 4, 2, 0, 2], weights := [1, 0, 0, 1] }

def points72 : List (ℕ × ℕ) := [(0, 1), (1, 2), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 1157, representative 2192.
def source73 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B017.Data.entryAt ⟨2, by decide +kernel⟩

def target73 : Weights.Entry :=
  { word := [0, 9, 0, 4, 2, 8, 2], weights := [1, 0, 1, 0] }

-- Period 7, original row 1162, representative 2196.
def source74 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B017.Data.entryAt ⟨6, by decide +kernel⟩

def target74 : Weights.Entry :=
  { word := [0, 9, 0, 4, 4, 4, 0], weights := [1, 0, 1, 0] }

def points74 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 5), (4, 6), (5, 4), (6, 3)]

-- Period 7, original row 1176, representative 2197.
def source75 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B017.Data.entryAt ⟨7, by decide +kernel⟩

def target75 : Weights.Entry :=
  { word := [0, 9, 0, 4, 10, 0, 1], weights := [1, 0, 0, 1] }

def points75 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 1177, representative 2197.
def source76 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B017.Data.entryAt ⟨7, by decide +kernel⟩

def target76 : Weights.Entry :=
  { word := [0, 9, 0, 4, 10, 0, 2], weights := [1, 0, 0, 1] }

def points76 : List (ℕ × ℕ) := [(0, 1), (1, 2), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 1183, representative 2193.
def source77 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B017.Data.entryAt ⟨3, by decide +kernel⟩

def target77 : Weights.Entry :=
  { word := [0, 9, 0, 4, 10, 8, 2], weights := [1, 0, 1, 0] }

-- Period 7, original row 1188, representative 2197.
def source78 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B017.Data.entryAt ⟨7, by decide +kernel⟩

def target78 : Weights.Entry :=
  { word := [0, 9, 0, 4, 12, 4, 0], weights := [1, 0, 1, 0] }

def points78 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 5), (4, 6), (5, 4), (6, 3)]

-- Period 7, original row 1210, representative 2199.
def source79 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B017.Data.entryAt ⟨9, by decide +kernel⟩

def target79 : Weights.Entry :=
  { word := [0, 9, 0, 12, 2, 0, 1], weights := [1, 0, 0, 1] }

def points79 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 1211, representative 2199.
def source80 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B017.Data.entryAt ⟨9, by decide +kernel⟩

def target80 : Weights.Entry :=
  { word := [0, 9, 0, 12, 2, 0, 2], weights := [1, 0, 0, 1] }

def points80 : List (ℕ × ℕ) := [(0, 1), (1, 2), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 1217, representative 2195.
def source81 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B017.Data.entryAt ⟨5, by decide +kernel⟩

def target81 : Weights.Entry :=
  { word := [0, 9, 0, 12, 2, 8, 2], weights := [1, 0, 1, 0] }

-- Period 7, original row 1222, representative 2199.
def source82 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B017.Data.entryAt ⟨9, by decide +kernel⟩

def target82 : Weights.Entry :=
  { word := [0, 9, 0, 12, 4, 4, 0], weights := [1, 0, 1, 0] }

def points82 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 5), (4, 6), (5, 4), (6, 3)]

-- Period 7, original row 1235, representative 2198.
def source83 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B017.Data.entryAt ⟨8, by decide +kernel⟩

def target83 : Weights.Entry :=
  { word := [0, 9, 0, 12, 10, 0, 1], weights := [1, 0, 0, 1] }

def points83 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 1236, representative 2198.
def source84 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B017.Data.entryAt ⟨8, by decide +kernel⟩

def target84 : Weights.Entry :=
  { word := [0, 9, 0, 12, 10, 0, 2], weights := [1, 0, 0, 1] }

def points84 : List (ℕ × ℕ) := [(0, 1), (1, 2), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 1242, representative 2194.
def source85 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B017.Data.entryAt ⟨4, by decide +kernel⟩

def target85 : Weights.Entry :=
  { word := [0, 9, 0, 12, 10, 8, 2], weights := [1, 0, 1, 0] }

-- Period 7, original row 1247, representative 2198.
def source86 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B017.Data.entryAt ⟨8, by decide +kernel⟩

def target86 : Weights.Entry :=
  { word := [0, 9, 0, 12, 12, 4, 0], weights := [1, 0, 1, 0] }

def points86 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 5), (4, 6), (5, 4), (6, 3)]

-- Period 7, original row 1313, representative 2191.
def source87 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B017.Data.entryAt ⟨1, by decide +kernel⟩

def target87 : Weights.Entry :=
  { word := [0, 9, 8, 12, 4, 4, 0], weights := [0, 1, 1, 0] }

def points87 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 1320, representative 2190.
def source88 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B017.Data.entryAt ⟨0, by decide +kernel⟩

def target88 : Weights.Entry :=
  { word := [0, 9, 8, 12, 12, 4, 0], weights := [0, 1, 1, 0] }

def points88 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 1519, representative 2255.
def source89 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B017.Data.entryAt ⟨65, by decide +kernel⟩

def target89 : Weights.Entry :=
  { word := [0, 12, 0, 4, 8, 4, 2], weights := [1, 0, 0, 1] }

def points89 : List (ℕ × ℕ) := [(0, 0), (1, 2), (2, 1), (3, 3), (4, 4), (5, 6), (6, 5)]

-- Period 7, original row 1520, representative 2265.
def source90 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B017.Data.entryAt ⟨75, by decide +kernel⟩

def target90 : Weights.Entry :=
  { word := [0, 12, 0, 4, 8, 4, 4], weights := [1, 0, 0, 1] }

-- Period 7, original row 1542, representative 2258.
def source91 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B017.Data.entryAt ⟨68, by decide +kernel⟩

def target91 : Weights.Entry :=
  { word := [0, 12, 0, 12, 8, 4, 2], weights := [1, 0, 0, 1] }

def points91 : List (ℕ × ℕ) := [(0, 0), (1, 2), (2, 1), (3, 3), (4, 4), (5, 6), (6, 5)]

-- Period 7, original row 1543, representative 2268.
def source92 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B017.Data.entryAt ⟨78, by decide +kernel⟩

def target92 : Weights.Entry :=
  { word := [0, 12, 0, 12, 8, 4, 4], weights := [1, 0, 1, 0] }

-- Period 7, original row 1587, representative 2207.
def source93 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B017.Data.entryAt ⟨17, by decide +kernel⟩

def target93 : Weights.Entry :=
  { word := [0, 12, 2, 8, 8, 4, 2], weights := [0, 1, 1, 0] }

-- Period 7, original row 1650, representative 2256.
def source94 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B017.Data.entryAt ⟨66, by decide +kernel⟩

def target94 : Weights.Entry :=
  { word := [0, 12, 8, 4, 8, 4, 2], weights := [1, 0, 1, 0] }

-- Period 7, original row 1651, representative 2266.
def source95 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B017.Data.entryAt ⟨76, by decide +kernel⟩

def target95 : Weights.Entry :=
  { word := [0, 12, 8, 4, 8, 4, 4], weights := [1, 0, 0, 1] }

-- Period 7, original row 1678, representative 2257.
def source96 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B017.Data.entryAt ⟨67, by decide +kernel⟩

def target96 : Weights.Entry :=
  { word := [0, 12, 8, 12, 8, 4, 2], weights := [1, 0, 1, 0] }

-- Period 7, original row 1679, representative 2267.
def source97 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B017.Data.entryAt ⟨77, by decide +kernel⟩

def target97 : Weights.Entry :=
  { word := [0, 12, 8, 12, 8, 4, 4], weights := [1, 0, 1, 0] }

-- Period 7, original row 1707, representative 2206.
def source98 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B017.Data.entryAt ⟨16, by decide +kernel⟩

def target98 : Weights.Entry :=
  { word := [0, 12, 10, 8, 8, 4, 2], weights := [0, 1, 1, 0] }

-- Period 7, original row 1751, representative 2254.
def source99 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B017.Data.entryAt ⟨64, by decide +kernel⟩

def target99 : Weights.Entry :=
  { word := [1, 0, 1, 4, 8, 4, 2], weights := [1, 0, 1, 0] }

def points99 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 1752, representative 2272.
def source100 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B017.Data.entryAt ⟨82, by decide +kernel⟩

def target100 : Weights.Entry :=
  { word := [1, 0, 1, 4, 8, 4, 4], weights := [1, 0, 0, 1] }

def points100 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 1774, representative 2261.
def source101 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B017.Data.entryAt ⟨71, by decide +kernel⟩

def target101 : Weights.Entry :=
  { word := [1, 0, 1, 12, 8, 4, 2], weights := [1, 0, 1, 0] }

def points101 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 1775, representative 2275.
def source102 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B017.Data.entryAt ⟨85, by decide +kernel⟩

def target102 : Weights.Entry :=
  { word := [1, 0, 1, 12, 8, 4, 4], weights := [1, 0, 1, 0] }

def points102 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 1877, representative 2209.
def source103 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B017.Data.entryAt ⟨19, by decide +kernel⟩

def target103 : Weights.Entry :=
  { word := [1, 4, 2, 8, 8, 4, 2], weights := [0, 1, 1, 0] }

def points103 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 1935, representative 2259.
def source104 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B017.Data.entryAt ⟨69, by decide +kernel⟩

def target104 : Weights.Entry :=
  { word := [1, 4, 8, 4, 8, 4, 2], weights := [1, 0, 1, 0] }

def points104 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 1936, representative 2269.
def source105 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B017.Data.entryAt ⟨79, by decide +kernel⟩

def target105 : Weights.Entry :=
  { word := [1, 4, 8, 4, 8, 4, 4], weights := [1, 0, 0, 1] }

def points105 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 1963, representative 2260.
def source106 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B017.Data.entryAt ⟨70, by decide +kernel⟩

def target106 : Weights.Entry :=
  { word := [1, 4, 8, 12, 8, 4, 2], weights := [1, 0, 1, 0] }

def points106 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 1964, representative 2270.
def source107 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B017.Data.entryAt ⟨80, by decide +kernel⟩

def target107 : Weights.Entry :=
  { word := [1, 4, 8, 12, 8, 4, 4], weights := [1, 0, 1, 0] }

def points107 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 1992, representative 2208.
def source108 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B017.Data.entryAt ⟨18, by decide +kernel⟩

def target108 : Weights.Entry :=
  { word := [1, 4, 10, 8, 8, 4, 2], weights := [0, 1, 1, 0] }

def points108 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 2036, representative 2255.
def source109 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B017.Data.entryAt ⟨65, by decide +kernel⟩

def target109 : Weights.Entry :=
  { word := [1, 8, 1, 4, 8, 4, 2], weights := [1, 0, 1, 0] }

def points109 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 2037, representative 2273.
def source110 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B017.Data.entryAt ⟨83, by decide +kernel⟩

def target110 : Weights.Entry :=
  { word := [1, 8, 1, 4, 8, 4, 4], weights := [1, 0, 0, 1] }

def points110 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 2059, representative 2258.
def source111 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B017.Data.entryAt ⟨68, by decide +kernel⟩

def target111 : Weights.Entry :=
  { word := [1, 8, 1, 12, 8, 4, 2], weights := [1, 0, 1, 0] }

def points111 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 2060, representative 2274.
def source112 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B017.Data.entryAt ⟨84, by decide +kernel⟩

def target112 : Weights.Entry :=
  { word := [1, 8, 1, 12, 8, 4, 4], weights := [1, 0, 1, 0] }

def points112 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 2236, representative 2207.
def source113 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B017.Data.entryAt ⟨17, by decide +kernel⟩

def target113 : Weights.Entry :=
  { word := [1, 12, 2, 8, 8, 4, 2], weights := [0, 1, 1, 0] }

def points113 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 2294, representative 2256.
def source114 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B017.Data.entryAt ⟨66, by decide +kernel⟩

def target114 : Weights.Entry :=
  { word := [1, 12, 8, 4, 8, 4, 2], weights := [1, 0, 1, 0] }

def points114 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 2295, representative 2266.
def source115 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B017.Data.entryAt ⟨76, by decide +kernel⟩

def target115 : Weights.Entry :=
  { word := [1, 12, 8, 4, 8, 4, 4], weights := [1, 0, 0, 1] }

def points115 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 2322, representative 2257.
def source116 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B017.Data.entryAt ⟨67, by decide +kernel⟩

def target116 : Weights.Entry :=
  { word := [1, 12, 8, 12, 8, 4, 2], weights := [1, 0, 1, 0] }

def points116 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 2323, representative 2267.
def source117 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B017.Data.entryAt ⟨77, by decide +kernel⟩

def target117 : Weights.Entry :=
  { word := [1, 12, 8, 12, 8, 4, 4], weights := [1, 0, 1, 0] }

def points117 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 2351, representative 2206.
def source118 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B017.Data.entryAt ⟨16, by decide +kernel⟩

def target118 : Weights.Entry :=
  { word := [1, 12, 10, 8, 8, 4, 2], weights := [0, 1, 1, 0] }

def points118 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 2411, representative 2232.
def source119 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B017.Data.entryAt ⟨42, by decide +kernel⟩

def target119 : Weights.Entry :=
  { word := [2, 0, 4, 2, 0, 8, 2], weights := [1, 0, 0, 1] }

-- Period 7, original row 2412, representative 2232.
def source120 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B017.Data.entryAt ⟨42, by decide +kernel⟩

def target120 : Weights.Entry :=
  { word := [2, 0, 4, 2, 0, 8, 4], weights := [1, 0, 0, 1] }

def points120 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 2423, representative 2233.
def source121 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B017.Data.entryAt ⟨43, by decide +kernel⟩

def target121 : Weights.Entry :=
  { word := [2, 0, 4, 2, 8, 8, 4], weights := [1, 0, 0, 1] }

-- Period 7, original row 2434, representative 2239.
def source122 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B017.Data.entryAt ⟨49, by decide +kernel⟩

def target122 : Weights.Entry :=
  { word := [2, 0, 4, 10, 0, 8, 2], weights := [1, 0, 0, 1] }

-- Period 7, original row 2435, representative 2239.
def source123 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B017.Data.entryAt ⟨49, by decide +kernel⟩

def target123 : Weights.Entry :=
  { word := [2, 0, 4, 10, 0, 8, 4], weights := [1, 0, 0, 1] }

def points123 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 2450, representative 2236.
def source124 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B017.Data.entryAt ⟨46, by decide +kernel⟩

def target124 : Weights.Entry :=
  { word := [2, 0, 4, 10, 8, 8, 4], weights := [1, 0, 0, 1] }

-- Period 7, original row 2528, representative 2237.
def source125 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B017.Data.entryAt ⟨47, by decide +kernel⟩

def target125 : Weights.Entry :=
  { word := [2, 0, 12, 2, 0, 8, 2], weights := [1, 0, 0, 1] }

-- Period 7, original row 2529, representative 2237.
def source126 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B017.Data.entryAt ⟨47, by decide +kernel⟩

def target126 : Weights.Entry :=
  { word := [2, 0, 12, 2, 0, 8, 4], weights := [1, 0, 0, 1] }

def points126 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 2540, representative 2234.
def source127 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B017.Data.entryAt ⟨44, by decide +kernel⟩

def target127 : Weights.Entry :=
  { word := [2, 0, 12, 2, 8, 8, 4], weights := [1, 0, 0, 1] }

def period7Entries : List Weights.Entry := [target0, target1, target2, target3, target4, target5, target6, target7, target8, target9, target10, target11, target12, target13, target14, target15, target16, target17, target18, target19, target20, target21, target22, target23, target24, target25, target26, target27, target28, target29, target30, target31, target32, target33, target34, target35, target36, target37, target38, target39, target40, target41, target42, target43, target44, target45, target46, target47, target48, target49, target50, target51, target52, target53, target54, target55, target56, target57, target58, target59, target60, target61, target62, target63, target64, target65, target66, target67, target68, target69, target70, target71, target72, target73, target74, target75, target76, target77, target78, target79, target80, target81, target82, target83, target84, target85, target86, target87, target88, target89, target90, target91, target92, target93, target94, target95, target96, target97, target98, target99, target100, target101, target102, target103, target104, target105, target106, target107, target108, target109, target110, target111, target112, target113, target114, target115, target116, target117, target118, target119, target120, target121, target122, target123, target124, target125, target126, target127]

def period7Chunk : RowCoverage.Chunk where
  rows := [⟨14, target0⟩, ⟨15, target1⟩, ⟨37, target2⟩, ⟨38, target3⟩, ⟨149, target4⟩, ⟨150, target5⟩, ⟨177, target6⟩, ⟨178, target7⟩, ⟨212, target8⟩, ⟨229, target9⟩, ⟨238, target10⟩, ⟨239, target11⟩, ⟨270, target12⟩, ⟨271, target13⟩, ⟨321, target14⟩, ⟨322, target15⟩, ⟨332, target16⟩, ⟨333, target17⟩, ⟨350, target18⟩, ⟨369, target19⟩, ⟨370, target20⟩, ⟨383, target21⟩, ⟨384, target22⟩, ⟨397, target23⟩, ⟨398, target24⟩, ⟨426, target25⟩, ⟨427, target26⟩, ⟨448, target27⟩, ⟨471, target28⟩, ⟨472, target29⟩, ⟨492, target30⟩, ⟨493, target31⟩, ⟨520, target32⟩, ⟨521, target33⟩, ⟨543, target34⟩, ⟨544, target35⟩, ⟨588, target36⟩, ⟨651, target37⟩, ⟨652, target38⟩, ⟨679, target39⟩, ⟨680, target40⟩, ⟨708, target41⟩, ⟨793, target42⟩, ⟨794, target43⟩, ⟨801, target44⟩, ⟨805, target45⟩, ⟨806, target46⟩, ⟨831, target47⟩, ⟨832, target48⟩, ⟨853, target49⟩, ⟨854, target50⟩, ⟨861, target51⟩, ⟨863, target52⟩, ⟨868, target53⟩, ⟨872, target54⟩, ⟨874, target55⟩, ⟨875, target56⟩, ⟨883, target57⟩, ⟨884, target58⟩, ⟨906, target59⟩, ⟨907, target60⟩, ⟨929, target61⟩, ⟨930, target62⟩, ⟨1004, target63⟩, ⟨1008, target64⟩, ⟨1054, target65⟩, ⟨1056, target66⟩, ⟨1059, target67⟩, ⟨1061, target68⟩, ⟨1118, target69⟩, ⟨1122, target70⟩, ⟨1150, target71⟩, ⟨1151, target72⟩, ⟨1157, target73⟩, ⟨1162, target74⟩, ⟨1176, target75⟩, ⟨1177, target76⟩, ⟨1183, target77⟩, ⟨1188, target78⟩, ⟨1210, target79⟩, ⟨1211, target80⟩, ⟨1217, target81⟩, ⟨1222, target82⟩, ⟨1235, target83⟩, ⟨1236, target84⟩, ⟨1242, target85⟩, ⟨1247, target86⟩, ⟨1313, target87⟩, ⟨1320, target88⟩, ⟨1519, target89⟩, ⟨1520, target90⟩, ⟨1542, target91⟩, ⟨1543, target92⟩, ⟨1587, target93⟩, ⟨1650, target94⟩, ⟨1651, target95⟩, ⟨1678, target96⟩, ⟨1679, target97⟩, ⟨1707, target98⟩, ⟨1751, target99⟩, ⟨1752, target100⟩, ⟨1774, target101⟩, ⟨1775, target102⟩, ⟨1877, target103⟩, ⟨1935, target104⟩, ⟨1936, target105⟩, ⟨1963, target106⟩, ⟨1964, target107⟩, ⟨1992, target108⟩, ⟨2036, target109⟩, ⟨2037, target110⟩, ⟨2059, target111⟩, ⟨2060, target112⟩, ⟨2236, target113⟩, ⟨2294, target114⟩, ⟨2295, target115⟩, ⟨2322, target116⟩, ⟨2323, target117⟩, ⟨2351, target118⟩, ⟨2411, target119⟩, ⟨2412, target120⟩, ⟨2423, target121⟩, ⟨2434, target122⟩, ⟨2435, target123⟩, ⟨2450, target124⟩, ⟨2528, target125⟩, ⟨2529, target126⟩, ⟨2540, target127⟩]
  indexMask := 413529938533186183393878217318741560729498982716997712553658396668276069797330703252144513753374309420889911703004048238492937786349972230745911241745647381152505590080871564735828475863838631241689680652672300746499518581893596214255316216057622448899590286703082238975378378126567067031601197045341958542908202232227693877210205637114408755819036397254723780916345965750208180883295836162020644024269515417914138612399441419699220734159680166611001967311300161965433175891587231811029802914139765162040046160422442855252919435585893012006121485550520683222280151112866056671269896302576999733292192442833338244158967879032395198203675218713793978940190723441988726642944029058287376468026231388092107262803770186070375421389384931109650662429839441560853291253760
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

end FranklSmallCyclic.TransportBatches.G017.B000.Data
