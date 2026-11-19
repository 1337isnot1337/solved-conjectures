module

public import Conjectures.FranklSmallCyclicRowCoverage
public import Conjectures.FranklSmallCyclicCanonicalWords
public import Conjectures.FranklSmallCyclicOrbit7Block022Data

/-! 128 literal targets sharing one source proof block.
Original words and row indices are retained; weights may be transported.
-/
@[expose] public section

namespace FranklSmallCyclic.TransportBatches.G022.B000.Data

-- Period 7, original row 7, representative 2925.
def source0 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B022.Data.entryAt ⟨95, by decide +kernel⟩

def target0 : Weights.Entry :=
  { word := [0, 0, 1, 4, 2, 8, 2], weights := [0, 0, 1, 0] }

-- Period 7, original row 16, representative 2846.
def source1 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B022.Data.entryAt ⟨16, by decide +kernel⟩

def target1 : Weights.Entry :=
  { word := [0, 0, 1, 4, 8, 4, 8], weights := [0, 0, 1, 0] }

-- Period 7, original row 29, representative 2908.
def source2 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B022.Data.entryAt ⟨78, by decide +kernel⟩

def target2 : Weights.Entry :=
  { word := [0, 0, 1, 4, 10, 8, 2], weights := [0, 0, 1, 0] }

-- Period 7, original row 39, representative 2849.
def source3 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B022.Data.entryAt ⟨19, by decide +kernel⟩

def target3 : Weights.Entry :=
  { word := [0, 0, 1, 12, 8, 4, 8], weights := [0, 0, 1, 0] }

-- Period 7, original row 54, representative 2871.
def source4 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B022.Data.entryAt ⟨41, by decide +kernel⟩

def target4 : Weights.Entry :=
  { word := [0, 0, 2, 2, 2, 8, 1], weights := [0, 1, 0, 0] }

-- Period 7, original row 55, representative 2923.
def source5 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B022.Data.entryAt ⟨93, by decide +kernel⟩

def target5 : Weights.Entry :=
  { word := [0, 0, 2, 2, 2, 8, 2], weights := [0, 1, 0, 0] }

-- Period 7, original row 69, representative 2860.
def source6 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B022.Data.entryAt ⟨30, by decide +kernel⟩

def target6 : Weights.Entry :=
  { word := [0, 0, 2, 2, 10, 8, 1], weights := [0, 1, 0, 0] }

-- Period 7, original row 70, representative 2906.
def source7 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B022.Data.entryAt ⟨76, by decide +kernel⟩

def target7 : Weights.Entry :=
  { word := [0, 0, 2, 2, 10, 8, 2], weights := [0, 1, 0, 0] }

-- Period 7, original row 71, representative 2957.
def source8 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B022.Data.entryAt ⟨127, by decide +kernel⟩

def target8 : Weights.Entry :=
  { word := [0, 0, 2, 2, 10, 8, 4], weights := [1, 0, 0, 1] }

-- Period 7, original row 77, representative 2889.
def source9 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B022.Data.entryAt ⟨59, by decide +kernel⟩

def target9 : Weights.Entry :=
  { word := [0, 0, 6, 2, 0, 8, 1], weights := [1, 0, 0, 1] }

-- Period 7, original row 78, representative 2952.
def source10 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B022.Data.entryAt ⟨122, by decide +kernel⟩

def target10 : Weights.Entry :=
  { word := [0, 0, 6, 2, 0, 8, 2], weights := [1, 0, 0, 1] }

-- Period 7, original row 79, representative 2952.
def source11 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B022.Data.entryAt ⟨122, by decide +kernel⟩

def target11 : Weights.Entry :=
  { word := [0, 0, 6, 2, 0, 8, 4], weights := [1, 0, 0, 1] }

def points11 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 85, representative 2882.
def source12 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B022.Data.entryAt ⟨52, by decide +kernel⟩

def target12 : Weights.Entry :=
  { word := [0, 0, 6, 2, 8, 8, 1], weights := [0, 1, 0, 0] }

-- Period 7, original row 86, representative 2936.
def source13 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B022.Data.entryAt ⟨106, by decide +kernel⟩

def target13 : Weights.Entry :=
  { word := [0, 0, 6, 2, 8, 8, 2], weights := [0, 1, 0, 0] }

-- Period 7, original row 87, representative 2943.
def source14 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B022.Data.entryAt ⟨113, by decide +kernel⟩

def target14 : Weights.Entry :=
  { word := [0, 0, 6, 2, 8, 8, 4], weights := [1, 0, 0, 1] }

-- Period 7, original row 94, representative 2876.
def source15 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B022.Data.entryAt ⟨46, by decide +kernel⟩

def target15 : Weights.Entry :=
  { word := [0, 0, 9, 4, 4, 12, 0], weights := [1, 0, 1, 0] }

-- Period 7, original row 98, representative 2865.
def source16 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B022.Data.entryAt ⟨35, by decide +kernel⟩

def target16 : Weights.Entry :=
  { word := [0, 0, 9, 4, 12, 12, 0], weights := [0, 0, 1, 0] }

-- Period 7, original row 105, representative 2872.
def source17 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B022.Data.entryAt ⟨42, by decide +kernel⟩

def target17 : Weights.Entry :=
  { word := [0, 0, 10, 2, 2, 8, 1], weights := [0, 1, 0, 0] }

-- Period 7, original row 106, representative 2924.
def source18 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B022.Data.entryAt ⟨94, by decide +kernel⟩

def target18 : Weights.Entry :=
  { word := [0, 0, 10, 2, 2, 8, 2], weights := [0, 1, 0, 0] }

-- Period 7, original row 113, representative 2861.
def source19 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B022.Data.entryAt ⟨31, by decide +kernel⟩

def target19 : Weights.Entry :=
  { word := [0, 0, 10, 2, 10, 8, 1], weights := [0, 1, 0, 0] }

-- Period 7, original row 114, representative 2907.
def source20 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B022.Data.entryAt ⟨77, by decide +kernel⟩

def target20 : Weights.Entry :=
  { word := [0, 0, 10, 2, 10, 8, 2], weights := [0, 1, 0, 0] }

-- Period 7, original row 152, representative 2834.
def source21 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B022.Data.entryAt ⟨4, by decide +kernel⟩

def target21 : Weights.Entry :=
  { word := [0, 1, 4, 2, 0, 8, 8], weights := [1, 0, 0, 1] }

-- Period 7, original row 180, representative 2837.
def source22 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B022.Data.entryAt ⟨7, by decide +kernel⟩

def target22 : Weights.Entry :=
  { word := [0, 1, 4, 10, 0, 8, 8], weights := [1, 0, 0, 1] }

-- Period 7, original row 241, representative 2835.
def source23 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B022.Data.entryAt ⟨5, by decide +kernel⟩

def target23 : Weights.Entry :=
  { word := [0, 1, 12, 2, 0, 8, 8], weights := [1, 0, 0, 1] }

-- Period 7, original row 273, representative 2836.
def source24 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B022.Data.entryAt ⟨6, by decide +kernel⟩

def target24 : Weights.Entry :=
  { word := [0, 1, 12, 10, 0, 8, 8], weights := [1, 0, 0, 1] }

-- Period 7, original row 324, representative 2834.
def source25 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B022.Data.entryAt ⟨4, by decide +kernel⟩

def target25 : Weights.Entry :=
  { word := [0, 2, 2, 2, 0, 8, 8], weights := [0, 1, 0, 1] }

def points25 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6)]

-- Period 7, original row 335, representative 2852.
def source26 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B022.Data.entryAt ⟨22, by decide +kernel⟩

def target26 : Weights.Entry :=
  { word := [0, 2, 2, 2, 8, 0, 8], weights := [1, 1, 0, 0] }

-- Period 7, original row 352, representative 2830.
def source27 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B022.Data.entryAt ⟨0, by decide +kernel⟩

def target27 : Weights.Entry :=
  { word := [0, 2, 2, 2, 8, 8, 8], weights := [1, 0, 0, 1] }

-- Period 7, original row 372, representative 2837.
def source28 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B022.Data.entryAt ⟨7, by decide +kernel⟩

def target28 : Weights.Entry :=
  { word := [0, 2, 2, 10, 0, 8, 8], weights := [0, 1, 0, 1] }

def points28 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6)]

-- Period 7, original row 386, representative 2853.
def source29 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B022.Data.entryAt ⟨23, by decide +kernel⟩

def target29 : Weights.Entry :=
  { word := [0, 2, 2, 10, 8, 0, 8], weights := [1, 1, 0, 0] }

-- Period 7, original row 400, representative 2833.
def source30 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B022.Data.entryAt ⟨3, by decide +kernel⟩

def target30 : Weights.Entry :=
  { word := [0, 2, 2, 10, 8, 8, 8], weights := [0, 1, 1, 0] }

-- Period 7, original row 429, representative 2835.
def source31 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B022.Data.entryAt ⟨5, by decide +kernel⟩

def target31 : Weights.Entry :=
  { word := [0, 2, 10, 2, 0, 8, 8], weights := [0, 1, 0, 1] }

def points31 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6)]

-- Period 7, original row 450, representative 2831.
def source32 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B022.Data.entryAt ⟨1, by decide +kernel⟩

def target32 : Weights.Entry :=
  { word := [0, 2, 10, 2, 8, 8, 8], weights := [1, 0, 0, 1] }

-- Period 7, original row 474, representative 2836.
def source33 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B022.Data.entryAt ⟨6, by decide +kernel⟩

def target33 : Weights.Entry :=
  { word := [0, 2, 10, 10, 0, 8, 8], weights := [0, 1, 0, 1] }

def points33 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6)]

-- Period 7, original row 495, representative 2832.
def source34 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B022.Data.entryAt ⟨2, by decide +kernel⟩

def target34 : Weights.Entry :=
  { word := [0, 2, 10, 10, 8, 8, 8], weights := [0, 1, 1, 0] }

-- Period 7, original row 513, representative 2927.
def source35 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B022.Data.entryAt ⟨97, by decide +kernel⟩

def target35 : Weights.Entry :=
  { word := [0, 4, 0, 4, 2, 8, 2], weights := [0, 0, 1, 0] }

-- Period 7, original row 522, representative 2838.
def source36 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B022.Data.entryAt ⟨8, by decide +kernel⟩

def target36 : Weights.Entry :=
  { word := [0, 4, 0, 4, 8, 4, 8], weights := [0, 0, 1, 0] }

-- Period 7, original row 535, representative 2910.
def source37 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B022.Data.entryAt ⟨80, by decide +kernel⟩

def target37 : Weights.Entry :=
  { word := [0, 4, 0, 4, 10, 8, 2], weights := [0, 0, 1, 0] }

-- Period 7, original row 545, representative 2845.
def source38 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B022.Data.entryAt ⟨15, by decide +kernel⟩

def target38 : Weights.Entry :=
  { word := [0, 4, 0, 12, 8, 4, 8], weights := [0, 0, 1, 0] }

-- Period 7, original row 559, representative 2894.
def source39 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B022.Data.entryAt ⟨64, by decide +kernel⟩

def target39 : Weights.Entry :=
  { word := [0, 4, 2, 0, 1, 8, 1], weights := [0, 1, 0, 1] }

-- Period 7, original row 573, representative 2890.
def source40 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B022.Data.entryAt ⟨60, by decide +kernel⟩

def target40 : Weights.Entry :=
  { word := [0, 4, 2, 0, 9, 8, 1], weights := [0, 1, 0, 1] }

-- Period 7, original row 585, representative 2918.
def source41 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B022.Data.entryAt ⟨88, by decide +kernel⟩

def target41 : Weights.Entry :=
  { word := [0, 4, 2, 8, 2, 8, 2], weights := [0, 1, 1, 0] }

-- Period 7, original row 599, representative 2901.
def source42 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B022.Data.entryAt ⟨71, by decide +kernel⟩

def target42 : Weights.Entry :=
  { word := [0, 4, 2, 8, 10, 8, 2], weights := [0, 1, 1, 0] }

-- Period 7, original row 609, representative 2894.
def source43 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B022.Data.entryAt ⟨64, by decide +kernel⟩

def target43 : Weights.Entry :=
  { word := [0, 4, 4, 4, 0, 8, 1], weights := [1, 0, 0, 1] }

def points43 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6)]

-- Period 7, original row 623, representative 2883.
def source44 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B022.Data.entryAt ⟨53, by decide +kernel⟩

def target44 : Weights.Entry :=
  { word := [0, 4, 4, 4, 8, 8, 1], weights := [1, 0, 1, 0] }

-- Period 7, original row 624, representative 2937.
def source45 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B022.Data.entryAt ⟨107, by decide +kernel⟩

def target45 : Weights.Entry :=
  { word := [0, 4, 4, 4, 8, 8, 2], weights := [1, 0, 1, 0] }

-- Period 7, original row 625, representative 2944.
def source46 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B022.Data.entryAt ⟨114, by decide +kernel⟩

def target46 : Weights.Entry :=
  { word := [0, 4, 4, 4, 8, 8, 4], weights := [1, 0, 0, 1] }

-- Period 7, original row 630, representative 2879.
def source47 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B022.Data.entryAt ⟨49, by decide +kernel⟩

def target47 : Weights.Entry :=
  { word := [0, 4, 6, 8, 8, 8, 1], weights := [0, 1, 1, 0] }

-- Period 7, original row 631, representative 2933.
def source48 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B022.Data.entryAt ⟨103, by decide +kernel⟩

def target48 : Weights.Entry :=
  { word := [0, 4, 6, 8, 8, 8, 2], weights := [0, 1, 1, 0] }

-- Period 7, original row 642, representative 2930.
def source49 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B022.Data.entryAt ⟨100, by decide +kernel⟩

def target49 : Weights.Entry :=
  { word := [0, 4, 8, 4, 2, 8, 2], weights := [0, 0, 1, 0] }

-- Period 7, original row 649, representative 2874.
def source50 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B022.Data.entryAt ⟨44, by decide +kernel⟩

def target50 : Weights.Entry :=
  { word := [0, 4, 8, 4, 4, 12, 0], weights := [1, 0, 1, 0] }

-- Period 7, original row 653, representative 2843.
def source51 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B022.Data.entryAt ⟨13, by decide +kernel⟩

def target51 : Weights.Entry :=
  { word := [0, 4, 8, 4, 8, 4, 8], weights := [0, 0, 1, 0] }

-- Period 7, original row 668, representative 2913.
def source52 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B022.Data.entryAt ⟨83, by decide +kernel⟩

def target52 : Weights.Entry :=
  { word := [0, 4, 8, 4, 10, 8, 2], weights := [0, 0, 1, 0] }

-- Period 7, original row 675, representative 2863.
def source53 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B022.Data.entryAt ⟨33, by decide +kernel⟩

def target53 : Weights.Entry :=
  { word := [0, 4, 8, 4, 12, 12, 0], weights := [1, 0, 1, 0] }

-- Period 7, original row 681, representative 2844.
def source54 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B022.Data.entryAt ⟨14, by decide +kernel⟩

def target54 : Weights.Entry :=
  { word := [0, 4, 8, 12, 8, 4, 8], weights := [0, 0, 1, 0] }

-- Period 7, original row 691, representative 2897.
def source55 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B022.Data.entryAt ⟨67, by decide +kernel⟩

def target55 : Weights.Entry :=
  { word := [0, 4, 10, 0, 1, 8, 1], weights := [0, 1, 0, 1] }

-- Period 7, original row 698, representative 2893.
def source56 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B022.Data.entryAt ⟨63, by decide +kernel⟩

def target56 : Weights.Entry :=
  { word := [0, 4, 10, 0, 9, 8, 1], weights := [0, 1, 0, 1] }

-- Period 7, original row 705, representative 2917.
def source57 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B022.Data.entryAt ⟨87, by decide +kernel⟩

def target57 : Weights.Entry :=
  { word := [0, 4, 10, 8, 2, 8, 2], weights := [0, 1, 1, 0] }

-- Period 7, original row 714, representative 2900.
def source58 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B022.Data.entryAt ⟨70, by decide +kernel⟩

def target58 : Weights.Entry :=
  { word := [0, 4, 10, 8, 10, 8, 2], weights := [0, 1, 1, 0] }

-- Period 7, original row 717, representative 2897.
def source59 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B022.Data.entryAt ⟨67, by decide +kernel⟩

def target59 : Weights.Entry :=
  { word := [0, 4, 12, 4, 0, 8, 1], weights := [1, 0, 0, 1] }

def points59 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6)]

-- Period 7, original row 731, representative 2886.
def source60 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B022.Data.entryAt ⟨56, by decide +kernel⟩

def target60 : Weights.Entry :=
  { word := [0, 4, 12, 4, 8, 8, 1], weights := [1, 0, 1, 0] }

-- Period 7, original row 732, representative 2940.
def source61 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B022.Data.entryAt ⟨110, by decide +kernel⟩

def target61 : Weights.Entry :=
  { word := [0, 4, 12, 4, 8, 8, 2], weights := [1, 0, 1, 0] }

-- Period 7, original row 733, representative 2947.
def source62 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B022.Data.entryAt ⟨117, by decide +kernel⟩

def target62 : Weights.Entry :=
  { word := [0, 4, 12, 4, 8, 8, 4], weights := [1, 0, 0, 1] }

-- Period 7, original row 795, representative 2854.
def source63 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B022.Data.entryAt ⟨24, by decide +kernel⟩

def target63 : Weights.Entry :=
  { word := [0, 8, 0, 0, 1, 4, 8], weights := [0, 0, 1, 0] }

-- Period 7, original row 807, representative 2854.
def source64 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B022.Data.entryAt ⟨24, by decide +kernel⟩

def target64 : Weights.Entry :=
  { word := [0, 8, 0, 4, 0, 4, 8], weights := [0, 0, 1, 0] }

def points64 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6)]

-- Period 7, original row 820, representative 2931.
def source65 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B022.Data.entryAt ⟨101, by decide +kernel⟩

def target65 : Weights.Entry :=
  { word := [0, 8, 0, 4, 2, 8, 2], weights := [0, 0, 1, 0] }

-- Period 7, original row 833, representative 2850.
def source66 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B022.Data.entryAt ⟨20, by decide +kernel⟩

def target66 : Weights.Entry :=
  { word := [0, 8, 0, 4, 8, 4, 8], weights := [0, 0, 1, 0] }

-- Period 7, original row 846, representative 2914.
def source67 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B022.Data.entryAt ⟨84, by decide +kernel⟩

def target67 : Weights.Entry :=
  { word := [0, 8, 0, 4, 10, 8, 2], weights := [0, 0, 1, 0] }

-- Period 7, original row 855, representative 2855.
def source68 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B022.Data.entryAt ⟨25, by decide +kernel⟩

def target68 : Weights.Entry :=
  { word := [0, 8, 0, 8, 1, 4, 8], weights := [0, 0, 1, 0] }

-- Period 7, original row 876, representative 2855.
def source69 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B022.Data.entryAt ⟨25, by decide +kernel⟩

def target69 : Weights.Entry :=
  { word := [0, 8, 0, 12, 0, 4, 8], weights := [0, 0, 1, 0] }

def points69 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6)]

-- Period 7, original row 885, representative 2851.
def source70 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B022.Data.entryAt ⟨21, by decide +kernel⟩

def target70 : Weights.Entry :=
  { word := [0, 8, 0, 12, 8, 4, 8], weights := [0, 0, 1, 0] }

-- Period 7, original row 899, representative 2926.
def source71 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B022.Data.entryAt ⟨96, by decide +kernel⟩

def target71 : Weights.Entry :=
  { word := [0, 8, 1, 4, 2, 8, 2], weights := [0, 0, 1, 0] }

-- Period 7, original row 908, representative 2847.
def source72 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B022.Data.entryAt ⟨17, by decide +kernel⟩

def target72 : Weights.Entry :=
  { word := [0, 8, 1, 4, 8, 4, 8], weights := [0, 0, 1, 0] }

-- Period 7, original row 921, representative 2909.
def source73 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B022.Data.entryAt ⟨79, by decide +kernel⟩

def target73 : Weights.Entry :=
  { word := [0, 8, 1, 4, 10, 8, 2], weights := [0, 0, 1, 0] }

-- Period 7, original row 931, representative 2848.
def source74 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B022.Data.entryAt ⟨18, by decide +kernel⟩

def target74 : Weights.Entry :=
  { word := [0, 8, 1, 12, 8, 4, 8], weights := [0, 0, 1, 0] }

-- Period 7, original row 946, representative 2867.
def source75 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B022.Data.entryAt ⟨37, by decide +kernel⟩

def target75 : Weights.Entry :=
  { word := [0, 8, 2, 2, 2, 8, 1], weights := [0, 1, 0, 0] }

-- Period 7, original row 947, representative 2919.
def source76 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B022.Data.entryAt ⟨89, by decide +kernel⟩

def target76 : Weights.Entry :=
  { word := [0, 8, 2, 2, 2, 8, 2], weights := [0, 1, 0, 0] }

-- Period 7, original row 961, representative 2856.
def source77 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B022.Data.entryAt ⟨26, by decide +kernel⟩

def target77 : Weights.Entry :=
  { word := [0, 8, 2, 2, 10, 8, 1], weights := [0, 1, 0, 0] }

-- Period 7, original row 962, representative 2902.
def source78 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B022.Data.entryAt ⟨72, by decide +kernel⟩

def target78 : Weights.Entry :=
  { word := [0, 8, 2, 2, 10, 8, 2], weights := [0, 1, 0, 0] }

-- Period 7, original row 963, representative 2953.
def source79 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B022.Data.entryAt ⟨123, by decide +kernel⟩

def target79 : Weights.Entry :=
  { word := [0, 8, 2, 2, 10, 8, 4], weights := [1, 0, 0, 1] }

-- Period 7, original row 975, representative 2870.
def source80 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B022.Data.entryAt ⟨40, by decide +kernel⟩

def target80 : Weights.Entry :=
  { word := [0, 8, 2, 10, 2, 8, 1], weights := [0, 1, 0, 0] }

-- Period 7, original row 976, representative 2922.
def source81 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B022.Data.entryAt ⟨92, by decide +kernel⟩

def target81 : Weights.Entry :=
  { word := [0, 8, 2, 10, 2, 8, 2], weights := [0, 1, 0, 0] }

-- Period 7, original row 989, representative 2859.
def source82 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B022.Data.entryAt ⟨29, by decide +kernel⟩

def target82 : Weights.Entry :=
  { word := [0, 8, 2, 10, 10, 8, 1], weights := [0, 1, 0, 0] }

-- Period 7, original row 990, representative 2905.
def source83 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B022.Data.entryAt ⟨75, by decide +kernel⟩

def target83 : Weights.Entry :=
  { word := [0, 8, 2, 10, 10, 8, 2], weights := [0, 1, 0, 0] }

-- Period 7, original row 991, representative 2956.
def source84 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B022.Data.entryAt ⟨126, by decide +kernel⟩

def target84 : Weights.Entry :=
  { word := [0, 8, 2, 10, 10, 8, 4], weights := [1, 0, 0, 1] }

-- Period 7, original row 1013, representative 2887.
def source85 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B022.Data.entryAt ⟨57, by decide +kernel⟩

def target85 : Weights.Entry :=
  { word := [0, 8, 6, 2, 0, 8, 1], weights := [1, 0, 0, 1] }

-- Period 7, original row 1014, representative 2950.
def source86 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B022.Data.entryAt ⟨120, by decide +kernel⟩

def target86 : Weights.Entry :=
  { word := [0, 8, 6, 2, 0, 8, 2], weights := [1, 0, 0, 1] }

-- Period 7, original row 1015, representative 2948.
def source87 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B022.Data.entryAt ⟨118, by decide +kernel⟩

def target87 : Weights.Entry :=
  { word := [0, 8, 6, 2, 0, 8, 4], weights := [1, 0, 0, 1] }

-- Period 7, original row 1021, representative 2880.
def source88 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B022.Data.entryAt ⟨50, by decide +kernel⟩

def target88 : Weights.Entry :=
  { word := [0, 8, 6, 2, 8, 8, 1], weights := [0, 1, 0, 0] }

-- Period 7, original row 1022, representative 2934.
def source89 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B022.Data.entryAt ⟨104, by decide +kernel⟩

def target89 : Weights.Entry :=
  { word := [0, 8, 6, 2, 8, 8, 2], weights := [0, 1, 0, 0] }

-- Period 7, original row 1023, representative 2941.
def source90 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B022.Data.entryAt ⟨111, by decide +kernel⟩

def target90 : Weights.Entry :=
  { word := [0, 8, 6, 2, 8, 8, 4], weights := [1, 0, 0, 1] }

-- Period 7, original row 1028, representative 2888.
def source91 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B022.Data.entryAt ⟨58, by decide +kernel⟩

def target91 : Weights.Entry :=
  { word := [0, 8, 6, 10, 0, 8, 1], weights := [1, 0, 0, 1] }

-- Period 7, original row 1029, representative 2951.
def source92 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B022.Data.entryAt ⟨121, by decide +kernel⟩

def target92 : Weights.Entry :=
  { word := [0, 8, 6, 10, 0, 8, 2], weights := [1, 0, 0, 1] }

-- Period 7, original row 1030, representative 2949.
def source93 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B022.Data.entryAt ⟨119, by decide +kernel⟩

def target93 : Weights.Entry :=
  { word := [0, 8, 6, 10, 0, 8, 4], weights := [1, 0, 0, 1] }

-- Period 7, original row 1035, representative 2881.
def source94 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B022.Data.entryAt ⟨51, by decide +kernel⟩

def target94 : Weights.Entry :=
  { word := [0, 8, 6, 10, 8, 8, 1], weights := [0, 1, 0, 0] }

-- Period 7, original row 1036, representative 2935.
def source95 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B022.Data.entryAt ⟨105, by decide +kernel⟩

def target95 : Weights.Entry :=
  { word := [0, 8, 6, 10, 8, 8, 2], weights := [0, 1, 0, 0] }

-- Period 7, original row 1037, representative 2942.
def source96 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B022.Data.entryAt ⟨112, by decide +kernel⟩

def target96 : Weights.Entry :=
  { word := [0, 8, 6, 10, 8, 8, 4], weights := [0, 1, 0, 0] }

-- Period 7, original row 1044, representative 2877.
def source97 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B022.Data.entryAt ⟨47, by decide +kernel⟩

def target97 : Weights.Entry :=
  { word := [0, 8, 8, 4, 4, 12, 0], weights := [1, 0, 1, 0] }

-- Period 7, original row 1052, representative 2866.
def source98 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B022.Data.entryAt ⟨36, by decide +kernel⟩

def target98 : Weights.Entry :=
  { word := [0, 8, 8, 4, 12, 12, 0], weights := [0, 0, 1, 0] }

-- Period 7, original row 1070, representative 2875.
def source99 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B022.Data.entryAt ⟨45, by decide +kernel⟩

def target99 : Weights.Entry :=
  { word := [0, 8, 9, 4, 4, 12, 0], weights := [1, 0, 1, 0] }

-- Period 7, original row 1074, representative 2864.
def source100 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B022.Data.entryAt ⟨34, by decide +kernel⟩

def target100 : Weights.Entry :=
  { word := [0, 8, 9, 4, 12, 12, 0], weights := [0, 0, 1, 0] }

-- Period 7, original row 1081, representative 2868.
def source101 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B022.Data.entryAt ⟨38, by decide +kernel⟩

def target101 : Weights.Entry :=
  { word := [0, 8, 10, 2, 2, 8, 1], weights := [0, 1, 0, 0] }

-- Period 7, original row 1082, representative 2920.
def source102 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B022.Data.entryAt ⟨90, by decide +kernel⟩

def target102 : Weights.Entry :=
  { word := [0, 8, 10, 2, 2, 8, 2], weights := [0, 1, 0, 0] }

-- Period 7, original row 1089, representative 2857.
def source103 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B022.Data.entryAt ⟨27, by decide +kernel⟩

def target103 : Weights.Entry :=
  { word := [0, 8, 10, 2, 10, 8, 1], weights := [0, 1, 0, 0] }

-- Period 7, original row 1090, representative 2903.
def source104 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B022.Data.entryAt ⟨73, by decide +kernel⟩

def target104 : Weights.Entry :=
  { word := [0, 8, 10, 2, 10, 8, 2], weights := [0, 1, 0, 0] }

-- Period 7, original row 1091, representative 2954.
def source105 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B022.Data.entryAt ⟨124, by decide +kernel⟩

def target105 : Weights.Entry :=
  { word := [0, 8, 10, 2, 10, 8, 4], weights := [1, 0, 0, 1] }

-- Period 7, original row 1096, representative 2869.
def source106 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B022.Data.entryAt ⟨39, by decide +kernel⟩

def target106 : Weights.Entry :=
  { word := [0, 8, 10, 10, 2, 8, 1], weights := [0, 1, 0, 0] }

-- Period 7, original row 1097, representative 2921.
def source107 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B022.Data.entryAt ⟨91, by decide +kernel⟩

def target107 : Weights.Entry :=
  { word := [0, 8, 10, 10, 2, 8, 2], weights := [0, 1, 0, 0] }

-- Period 7, original row 1103, representative 2858.
def source108 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B022.Data.entryAt ⟨28, by decide +kernel⟩

def target108 : Weights.Entry :=
  { word := [0, 8, 10, 10, 10, 8, 1], weights := [0, 1, 0, 0] }

-- Period 7, original row 1104, representative 2904.
def source109 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B022.Data.entryAt ⟨74, by decide +kernel⟩

def target109 : Weights.Entry :=
  { word := [0, 8, 10, 10, 10, 8, 2], weights := [0, 1, 0, 0] }

-- Period 7, original row 1105, representative 2955.
def source110 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B022.Data.entryAt ⟨125, by decide +kernel⟩

def target110 : Weights.Entry :=
  { word := [0, 8, 10, 10, 10, 8, 4], weights := [1, 0, 0, 1] }

-- Period 7, original row 1126, representative 2894.
def source111 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B022.Data.entryAt ⟨64, by decide +kernel⟩

def target111 : Weights.Entry :=
  { word := [0, 9, 0, 1, 4, 2, 0], weights := [1, 0, 1, 0] }

def points111 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 1130, representative 2895.
def source112 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B022.Data.entryAt ⟨65, by decide +kernel⟩

def target112 : Weights.Entry :=
  { word := [0, 9, 0, 1, 4, 10, 0], weights := [1, 1, 0, 0] }

-- Period 7, original row 1132, representative 2897.
def source113 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B022.Data.entryAt ⟨67, by decide +kernel⟩

def target113 : Weights.Entry :=
  { word := [0, 9, 0, 1, 12, 2, 0], weights := [1, 0, 1, 0] }

def points113 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 1136, representative 2896.
def source114 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B022.Data.entryAt ⟨66, by decide +kernel⟩

def target114 : Weights.Entry :=
  { word := [0, 9, 0, 1, 12, 10, 0], weights := [1, 1, 0, 0] }

-- Period 7, original row 1138, representative 2894.
def source115 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B022.Data.entryAt ⟨64, by decide +kernel⟩

def target115 : Weights.Entry :=
  { word := [0, 9, 0, 2, 2, 2, 0], weights := [1, 0, 0, 1] }

def points115 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 5), (4, 6), (5, 4), (6, 3)]

-- Period 7, original row 1140, representative 2895.
def source116 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B022.Data.entryAt ⟨65, by decide +kernel⟩

def target116 : Weights.Entry :=
  { word := [0, 9, 0, 2, 2, 10, 0], weights := [1, 1, 0, 0] }

def points116 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 6), (6, 5)]

-- Period 7, original row 1142, representative 2897.
def source117 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B022.Data.entryAt ⟨67, by decide +kernel⟩

def target117 : Weights.Entry :=
  { word := [0, 9, 0, 2, 10, 2, 0], weights := [1, 0, 0, 1] }

def points117 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 5), (4, 6), (5, 4), (6, 3)]

-- Period 7, original row 1144, representative 2896.
def source118 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B022.Data.entryAt ⟨66, by decide +kernel⟩

def target118 : Weights.Entry :=
  { word := [0, 9, 0, 2, 10, 10, 0], weights := [1, 1, 0, 0] }

def points118 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 6), (6, 5)]

-- Period 7, original row 1164, representative 2889.
def source119 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B022.Data.entryAt ⟨59, by decide +kernel⟩

def target119 : Weights.Entry :=
  { word := [0, 9, 0, 4, 6, 0, 0], weights := [1, 0, 1, 0] }

def points119 : List (ℕ × ℕ) := [(0, 1), (1, 2), (2, 0), (3, 5), (4, 6), (5, 4), (6, 3)]

-- Period 7, original row 1166, representative 2887.
def source120 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B022.Data.entryAt ⟨57, by decide +kernel⟩

def target120 : Weights.Entry :=
  { word := [0, 9, 0, 4, 6, 8, 0], weights := [1, 0, 1, 0] }

def points120 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 5), (4, 6), (5, 4), (6, 3)]

-- Period 7, original row 1225, representative 2888.
def source121 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B022.Data.entryAt ⟨58, by decide +kernel⟩

def target121 : Weights.Entry :=
  { word := [0, 9, 0, 12, 6, 8, 0], weights := [1, 0, 1, 0] }

def points121 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 5), (4, 6), (5, 4), (6, 3)]

-- Period 7, original row 1249, representative 2871.
def source122 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B022.Data.entryAt ⟨41, by decide +kernel⟩

def target122 : Weights.Entry :=
  { word := [0, 9, 4, 4, 4, 0, 0], weights := [0, 0, 1, 0] }

def points122 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 1251, representative 2867.
def source123 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B022.Data.entryAt ⟨37, by decide +kernel⟩

def target123 : Weights.Entry :=
  { word := [0, 9, 4, 4, 4, 8, 0], weights := [0, 0, 1, 0] }

def points123 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 1253, representative 2872.
def source124 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B022.Data.entryAt ⟨42, by decide +kernel⟩

def target124 : Weights.Entry :=
  { word := [0, 9, 4, 4, 12, 0, 0], weights := [0, 0, 1, 0] }

def points124 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 1255, representative 2868.
def source125 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B022.Data.entryAt ⟨38, by decide +kernel⟩

def target125 : Weights.Entry :=
  { word := [0, 9, 4, 4, 12, 8, 0], weights := [0, 0, 1, 0] }

def points125 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 1258, representative 2870.
def source126 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B022.Data.entryAt ⟨40, by decide +kernel⟩

def target126 : Weights.Entry :=
  { word := [0, 9, 4, 12, 4, 8, 0], weights := [0, 0, 1, 0] }

def points126 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 1261, representative 2869.
def source127 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B022.Data.entryAt ⟨39, by decide +kernel⟩

def target127 : Weights.Entry :=
  { word := [0, 9, 4, 12, 12, 8, 0], weights := [0, 0, 1, 0] }

def points127 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

def period7Entries : List Weights.Entry := [target0, target1, target2, target3, target4, target5, target6, target7, target8, target9, target10, target11, target12, target13, target14, target15, target16, target17, target18, target19, target20, target21, target22, target23, target24, target25, target26, target27, target28, target29, target30, target31, target32, target33, target34, target35, target36, target37, target38, target39, target40, target41, target42, target43, target44, target45, target46, target47, target48, target49, target50, target51, target52, target53, target54, target55, target56, target57, target58, target59, target60, target61, target62, target63, target64, target65, target66, target67, target68, target69, target70, target71, target72, target73, target74, target75, target76, target77, target78, target79, target80, target81, target82, target83, target84, target85, target86, target87, target88, target89, target90, target91, target92, target93, target94, target95, target96, target97, target98, target99, target100, target101, target102, target103, target104, target105, target106, target107, target108, target109, target110, target111, target112, target113, target114, target115, target116, target117, target118, target119, target120, target121, target122, target123, target124, target125, target126, target127]

def period7Chunk : RowCoverage.Chunk where
  rows := [⟨7, target0⟩, ⟨16, target1⟩, ⟨29, target2⟩, ⟨39, target3⟩, ⟨54, target4⟩, ⟨55, target5⟩, ⟨69, target6⟩, ⟨70, target7⟩, ⟨71, target8⟩, ⟨77, target9⟩, ⟨78, target10⟩, ⟨79, target11⟩, ⟨85, target12⟩, ⟨86, target13⟩, ⟨87, target14⟩, ⟨94, target15⟩, ⟨98, target16⟩, ⟨105, target17⟩, ⟨106, target18⟩, ⟨113, target19⟩, ⟨114, target20⟩, ⟨152, target21⟩, ⟨180, target22⟩, ⟨241, target23⟩, ⟨273, target24⟩, ⟨324, target25⟩, ⟨335, target26⟩, ⟨352, target27⟩, ⟨372, target28⟩, ⟨386, target29⟩, ⟨400, target30⟩, ⟨429, target31⟩, ⟨450, target32⟩, ⟨474, target33⟩, ⟨495, target34⟩, ⟨513, target35⟩, ⟨522, target36⟩, ⟨535, target37⟩, ⟨545, target38⟩, ⟨559, target39⟩, ⟨573, target40⟩, ⟨585, target41⟩, ⟨599, target42⟩, ⟨609, target43⟩, ⟨623, target44⟩, ⟨624, target45⟩, ⟨625, target46⟩, ⟨630, target47⟩, ⟨631, target48⟩, ⟨642, target49⟩, ⟨649, target50⟩, ⟨653, target51⟩, ⟨668, target52⟩, ⟨675, target53⟩, ⟨681, target54⟩, ⟨691, target55⟩, ⟨698, target56⟩, ⟨705, target57⟩, ⟨714, target58⟩, ⟨717, target59⟩, ⟨731, target60⟩, ⟨732, target61⟩, ⟨733, target62⟩, ⟨795, target63⟩, ⟨807, target64⟩, ⟨820, target65⟩, ⟨833, target66⟩, ⟨846, target67⟩, ⟨855, target68⟩, ⟨876, target69⟩, ⟨885, target70⟩, ⟨899, target71⟩, ⟨908, target72⟩, ⟨921, target73⟩, ⟨931, target74⟩, ⟨946, target75⟩, ⟨947, target76⟩, ⟨961, target77⟩, ⟨962, target78⟩, ⟨963, target79⟩, ⟨975, target80⟩, ⟨976, target81⟩, ⟨989, target82⟩, ⟨990, target83⟩, ⟨991, target84⟩, ⟨1013, target85⟩, ⟨1014, target86⟩, ⟨1015, target87⟩, ⟨1021, target88⟩, ⟨1022, target89⟩, ⟨1023, target90⟩, ⟨1028, target91⟩, ⟨1029, target92⟩, ⟨1030, target93⟩, ⟨1035, target94⟩, ⟨1036, target95⟩, ⟨1037, target96⟩, ⟨1044, target97⟩, ⟨1052, target98⟩, ⟨1070, target99⟩, ⟨1074, target100⟩, ⟨1081, target101⟩, ⟨1082, target102⟩, ⟨1089, target103⟩, ⟨1090, target104⟩, ⟨1091, target105⟩, ⟨1096, target106⟩, ⟨1097, target107⟩, ⟨1103, target108⟩, ⟨1104, target109⟩, ⟨1105, target110⟩, ⟨1126, target111⟩, ⟨1130, target112⟩, ⟨1132, target113⟩, ⟨1136, target114⟩, ⟨1138, target115⟩, ⟨1140, target116⟩, ⟨1142, target117⟩, ⟨1144, target118⟩, ⟨1164, target119⟩, ⟨1166, target120⟩, ⟨1225, target121⟩, ⟨1249, target122⟩, ⟨1251, target123⟩, ⟨1253, target124⟩, ⟨1255, target125⟩, ⟨1258, target126⟩, ⟨1261, target127⟩]
  indexMask := 45489916382525475689009275393369959980070244484144397195311498023231768047078972075894937866274823278658169404457697794240650662878674363124943121674279628363447129139949559618430998403693544881164758234534565415888872612635674424792397661003729612123014964075418926155388028028090853511495109842237821239917264077543596600807895562470113061155641066461866305084157979651955818624
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

end FranklSmallCyclic.TransportBatches.G022.B000.Data
