module

public import Conjectures.FranklSmallCyclicRowCoverage
public import Conjectures.FranklSmallCyclicCanonicalWords
public import Conjectures.FranklSmallCyclicOrbit7Block023Data

/-! 128 literal targets sharing one source proof block.
Original words and row indices are retained; weights may be transported.
-/
@[expose] public section

namespace FranklSmallCyclic.TransportBatches.G023.B000.Data

-- Period 7, original row 8, representative 2992.
def source0 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨34, by decide +kernel⟩

def target0 : Weights.Entry :=
  { word := [0, 0, 1, 4, 2, 8, 4], weights := [1, 0, 0, 1] }

-- Period 7, original row 24, representative 3053.
def source1 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨93, by decide +kernel⟩

def target1 : Weights.Entry :=
  { word := [0, 0, 1, 4, 10, 0, 4], weights := [1, 0, 0, 1] }

-- Period 7, original row 30, representative 2985.
def source2 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨27, by decide +kernel⟩

def target2 : Weights.Entry :=
  { word := [0, 0, 1, 4, 10, 8, 4], weights := [1, 0, 0, 1] }

-- Period 7, original row 56, representative 2963.
def source3 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨5, by decide +kernel⟩

def target3 : Weights.Entry :=
  { word := [0, 0, 2, 2, 2, 8, 4], weights := [1, 0, 0, 1] }

-- Period 7, original row 63, representative 3053.
def source4 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨93, by decide +kernel⟩

def target4 : Weights.Entry :=
  { word := [0, 0, 2, 2, 10, 0, 4], weights := [1, 0, 0, 1] }

def points4 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 5), (5, 4), (6, 6)]

-- Period 7, original row 92, representative 3053.
def source5 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨93, by decide +kernel⟩

def target5 : Weights.Entry :=
  { word := [0, 0, 9, 4, 4, 4, 0], weights := [0, 0, 1, 1] }

def points5 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 4), (5, 3), (6, 5)]

-- Period 7, original row 96, representative 3023.
def source6 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨64, by decide +kernel⟩

def target6 : Weights.Entry :=
  { word := [0, 0, 9, 4, 12, 4, 0], weights := [0, 0, 1, 0] }

-- Period 7, original row 107, representative 2964.
def source7 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨6, by decide +kernel⟩

def target7 : Weights.Entry :=
  { word := [0, 0, 10, 2, 2, 8, 4], weights := [1, 0, 0, 1] }

-- Period 7, original row 115, representative 2958.
def source8 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨0, by decide +kernel⟩

def target8 : Weights.Entry :=
  { word := [0, 0, 10, 2, 10, 8, 4], weights := [1, 0, 0, 1] }

-- Period 7, original row 148, representative 3061.
def source9 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨100, by decide +kernel⟩

def target9 : Weights.Entry :=
  { word := [0, 1, 4, 2, 0, 8, 0], weights := [0, 1, 0, 0] }

-- Period 7, original row 156, representative 3049.
def source10 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨89, by decide +kernel⟩

def target10 : Weights.Entry :=
  { word := [0, 1, 4, 2, 0, 9, 0], weights := [0, 1, 0, 0] }

-- Period 7, original row 158, representative 3008.
def source11 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨50, by decide +kernel⟩

def target11 : Weights.Entry :=
  { word := [0, 1, 4, 2, 0, 10, 0], weights := [0, 1, 0, 0] }

-- Period 7, original row 160, representative 3041.
def source12 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨81, by decide +kernel⟩

def target12 : Weights.Entry :=
  { word := [0, 1, 4, 2, 8, 2, 0], weights := [0, 1, 0, 0] }

-- Period 7, original row 164, representative 3009.
def source13 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨51, by decide +kernel⟩

def target13 : Weights.Entry :=
  { word := [0, 1, 4, 2, 8, 10, 0], weights := [0, 1, 0, 0] }

-- Period 7, original row 168, representative 3055.
def source14 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨95, by decide +kernel⟩

def target14 : Weights.Entry :=
  { word := [0, 1, 4, 4, 4, 8, 0], weights := [0, 0, 1, 0] }

-- Period 7, original row 170, representative 3037.
def source15 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨77, by decide +kernel⟩

def target15 : Weights.Entry :=
  { word := [0, 1, 4, 8, 4, 2, 0], weights := [0, 1, 1, 0] }

-- Period 7, original row 172, representative 3007.
def source16 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨49, by decide +kernel⟩

def target16 : Weights.Entry :=
  { word := [0, 1, 4, 8, 4, 10, 0], weights := [0, 1, 1, 0] }

-- Period 7, original row 200, representative 3056.
def source17 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨96, by decide +kernel⟩

def target17 : Weights.Entry :=
  { word := [0, 1, 4, 12, 4, 8, 0], weights := [0, 0, 1, 0] }

-- Period 7, original row 202, representative 3058.
def source18 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨97, by decide +kernel⟩

def target18 : Weights.Entry :=
  { word := [0, 1, 8, 1, 4, 2, 0], weights := [1, 1, 0, 0] }

-- Period 7, original row 203, representative 3013.
def source19 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨54, by decide +kernel⟩

def target19 : Weights.Entry :=
  { word := [0, 1, 8, 1, 4, 10, 0], weights := [1, 1, 0, 0] }

-- Period 7, original row 204, representative 3051.
def source20 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨91, by decide +kernel⟩

def target20 : Weights.Entry :=
  { word := [0, 1, 8, 2, 2, 2, 0], weights := [1, 1, 0, 0] }

-- Period 7, original row 206, representative 3010.
def source21 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨52, by decide +kernel⟩

def target21 : Weights.Entry :=
  { word := [0, 1, 8, 2, 2, 10, 0], weights := [1, 1, 0, 0] }

-- Period 7, original row 208, representative 3052.
def source22 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨92, by decide +kernel⟩

def target22 : Weights.Entry :=
  { word := [0, 1, 8, 2, 10, 2, 0], weights := [1, 1, 0, 0] }

-- Period 7, original row 210, representative 3011.
def source23 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨53, by decide +kernel⟩

def target23 : Weights.Entry :=
  { word := [0, 1, 8, 2, 10, 10, 0], weights := [1, 1, 0, 0] }

-- Period 7, original row 237, representative 3029.
def source24 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨69, by decide +kernel⟩

def target24 : Weights.Entry :=
  { word := [0, 1, 12, 2, 0, 8, 0], weights := [0, 1, 0, 0] }

-- Period 7, original row 245, representative 3021.
def source25 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨62, by decide +kernel⟩

def target25 : Weights.Entry :=
  { word := [0, 1, 12, 2, 0, 9, 0], weights := [0, 1, 0, 0] }

-- Period 7, original row 247, representative 3005.
def source26 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨47, by decide +kernel⟩

def target26 : Weights.Entry :=
  { word := [0, 1, 12, 2, 0, 10, 0], weights := [0, 1, 0, 0] }

-- Period 7, original row 249, representative 3019.
def source27 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨60, by decide +kernel⟩

def target27 : Weights.Entry :=
  { word := [0, 1, 12, 2, 8, 2, 0], weights := [0, 1, 0, 0] }

-- Period 7, original row 253, representative 3006.
def source28 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨48, by decide +kernel⟩

def target28 : Weights.Entry :=
  { word := [0, 1, 12, 2, 8, 10, 0], weights := [0, 1, 0, 0] }

-- Period 7, original row 257, representative 3024.
def source29 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨65, by decide +kernel⟩

def target29 : Weights.Entry :=
  { word := [0, 1, 12, 4, 4, 8, 0], weights := [0, 0, 1, 0] }

-- Period 7, original row 259, representative 3016.
def source30 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨57, by decide +kernel⟩

def target30 : Weights.Entry :=
  { word := [0, 1, 12, 8, 4, 2, 0], weights := [0, 1, 1, 0] }

-- Period 7, original row 261, representative 3004.
def source31 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨46, by decide +kernel⟩

def target31 : Weights.Entry :=
  { word := [0, 1, 12, 8, 4, 10, 0], weights := [0, 1, 1, 0] }

-- Period 7, original row 293, representative 3025.
def source32 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨66, by decide +kernel⟩

def target32 : Weights.Entry :=
  { word := [0, 1, 12, 12, 4, 8, 0], weights := [0, 0, 1, 0] }

-- Period 7, original row 320, representative 3061.
def source33 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨100, by decide +kernel⟩

def target33 : Weights.Entry :=
  { word := [0, 2, 2, 2, 0, 8, 0], weights := [1, 0, 0, 0] }

def points33 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6)]

-- Period 7, original row 328, representative 3049.
def source34 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨89, by decide +kernel⟩

def target34 : Weights.Entry :=
  { word := [0, 2, 2, 2, 0, 9, 0], weights := [1, 0, 0, 0] }

def points34 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6)]

-- Period 7, original row 330, representative 3008.
def source35 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨50, by decide +kernel⟩

def target35 : Weights.Entry :=
  { word := [0, 2, 2, 2, 0, 10, 0], weights := [1, 0, 0, 0] }

def points35 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6)]

-- Period 7, original row 339, representative 3053.
def source36 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨93, by decide +kernel⟩

def target36 : Weights.Entry :=
  { word := [0, 2, 2, 2, 8, 1, 0], weights := [1, 1, 0, 0] }

def points36 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 5), (5, 6), (6, 4)]

-- Period 7, original row 341, representative 3034.
def source37 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨74, by decide +kernel⟩

def target37 : Weights.Entry :=
  { word := [0, 2, 2, 2, 8, 2, 0], weights := [1, 1, 0, 0] }

-- Period 7, original row 348, representative 3060.
def source38 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨99, by decide +kernel⟩

def target38 : Weights.Entry :=
  { word := [0, 2, 2, 2, 8, 8, 0], weights := [1, 1, 0, 0] }

-- Period 7, original row 356, representative 3048.
def source39 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨88, by decide +kernel⟩

def target39 : Weights.Entry :=
  { word := [0, 2, 2, 2, 8, 9, 0], weights := [1, 1, 0, 0] }

-- Period 7, original row 358, representative 3003.
def source40 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨45, by decide +kernel⟩

def target40 : Weights.Entry :=
  { word := [0, 2, 2, 2, 8, 10, 0], weights := [1, 1, 0, 0] }

-- Period 7, original row 425, representative 3029.
def source41 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨69, by decide +kernel⟩

def target41 : Weights.Entry :=
  { word := [0, 2, 10, 2, 0, 8, 0], weights := [1, 0, 0, 0] }

def points41 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6)]

-- Period 7, original row 433, representative 3021.
def source42 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨62, by decide +kernel⟩

def target42 : Weights.Entry :=
  { word := [0, 2, 10, 2, 0, 9, 0], weights := [1, 0, 0, 0] }

def points42 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6)]

-- Period 7, original row 435, representative 3005.
def source43 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨47, by decide +kernel⟩

def target43 : Weights.Entry :=
  { word := [0, 2, 10, 2, 0, 10, 0], weights := [1, 0, 0, 0] }

def points43 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6)]

-- Period 7, original row 437, representative 3023.
def source44 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨64, by decide +kernel⟩

def target44 : Weights.Entry :=
  { word := [0, 2, 10, 2, 8, 1, 0], weights := [0, 1, 0, 0] }

def points44 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 439, representative 3014.
def source45 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨55, by decide +kernel⟩

def target45 : Weights.Entry :=
  { word := [0, 2, 10, 2, 8, 2, 0], weights := [1, 1, 0, 0] }

-- Period 7, original row 446, representative 3028.
def source46 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨68, by decide +kernel⟩

def target46 : Weights.Entry :=
  { word := [0, 2, 10, 2, 8, 8, 0], weights := [0, 1, 0, 0] }

-- Period 7, original row 454, representative 3020.
def source47 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨61, by decide +kernel⟩

def target47 : Weights.Entry :=
  { word := [0, 2, 10, 2, 8, 9, 0], weights := [0, 1, 0, 0] }

-- Period 7, original row 456, representative 3002.
def source48 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨44, by decide +kernel⟩

def target48 : Weights.Entry :=
  { word := [0, 2, 10, 2, 8, 10, 0], weights := [1, 1, 0, 0] }

-- Period 7, original row 514, representative 2988.
def source49 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨30, by decide +kernel⟩

def target49 : Weights.Entry :=
  { word := [0, 4, 0, 4, 2, 8, 4], weights := [1, 0, 0, 1] }

-- Period 7, original row 530, representative 3053.
def source50 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨93, by decide +kernel⟩

def target50 : Weights.Entry :=
  { word := [0, 4, 0, 4, 10, 0, 4], weights := [1, 0, 0, 1] }

def points50 : List (ℕ × ℕ) := [(0, 0), (1, 2), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 536, representative 2981.
def source51 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨23, by decide +kernel⟩

def target51 : Weights.Entry :=
  { word := [0, 4, 0, 4, 10, 8, 4], weights := [1, 0, 0, 1] }

-- Period 7, original row 560, representative 2977.
def source52 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨19, by decide +kernel⟩

def target52 : Weights.Entry :=
  { word := [0, 4, 2, 0, 1, 8, 2], weights := [0, 1, 0, 1] }

-- Period 7, original row 561, representative 2973.
def source53 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨15, by decide +kernel⟩

def target53 : Weights.Entry :=
  { word := [0, 4, 2, 0, 1, 8, 4], weights := [0, 1, 0, 1] }

-- Period 7, original row 566, representative 3058.
def source54 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨97, by decide +kernel⟩

def target54 : Weights.Entry :=
  { word := [0, 4, 2, 0, 9, 0, 1], weights := [0, 0, 1, 1] }

def points54 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 567, representative 3058.
def source55 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨97, by decide +kernel⟩

def target55 : Weights.Entry :=
  { word := [0, 4, 2, 0, 9, 0, 2], weights := [0, 1, 0, 1] }

def points55 : List (ℕ × ℕ) := [(0, 1), (1, 2), (2, 0), (3, 6), (4, 4), (5, 5), (6, 3)]

-- Period 7, original row 568, representative 3040.
def source56 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨80, by decide +kernel⟩

def target56 : Weights.Entry :=
  { word := [0, 4, 2, 0, 9, 0, 4], weights := [0, 1, 0, 1] }

-- Period 7, original row 574, representative 2965.
def source57 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨7, by decide +kernel⟩

def target57 : Weights.Entry :=
  { word := [0, 4, 2, 0, 9, 8, 2], weights := [0, 1, 0, 1] }

-- Period 7, original row 575, representative 2969.
def source58 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨11, by decide +kernel⟩

def target58 : Weights.Entry :=
  { word := [0, 4, 2, 0, 9, 8, 4], weights := [0, 1, 0, 1] }

-- Period 7, original row 580, representative 3037.
def source59 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨77, by decide +kernel⟩

def target59 : Weights.Entry :=
  { word := [0, 4, 2, 8, 2, 0, 1], weights := [1, 1, 0, 0] }

def points59 : List (ℕ × ℕ) := [(0, 2), (1, 0), (2, 1), (3, 6), (4, 3), (5, 4), (6, 5)]

-- Period 7, original row 581, representative 3037.
def source60 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨77, by decide +kernel⟩

def target60 : Weights.Entry :=
  { word := [0, 4, 2, 8, 2, 0, 2], weights := [1, 0, 1, 0] }

def points60 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 2), (3, 6), (4, 3), (5, 5), (6, 4)]

-- Period 7, original row 594, representative 3016.
def source61 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨57, by decide +kernel⟩

def target61 : Weights.Entry :=
  { word := [0, 4, 2, 8, 10, 0, 1], weights := [0, 1, 1, 0] }

def points61 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 595, representative 3016.
def source62 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨57, by decide +kernel⟩

def target62 : Weights.Entry :=
  { word := [0, 4, 2, 8, 10, 0, 2], weights := [0, 1, 1, 0] }

def points62 : List (ℕ × ℕ) := [(0, 1), (1, 2), (2, 0), (3, 6), (4, 4), (5, 5), (6, 3)]

-- Period 7, original row 610, representative 2977.
def source63 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨19, by decide +kernel⟩

def target63 : Weights.Entry :=
  { word := [0, 4, 4, 4, 0, 8, 2], weights := [1, 0, 0, 1] }

def points63 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6)]

-- Period 7, original row 611, representative 2973.
def source64 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨15, by decide +kernel⟩

def target64 : Weights.Entry :=
  { word := [0, 4, 4, 4, 0, 8, 4], weights := [1, 0, 0, 1] }

def points64 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6)]

-- Period 7, original row 616, representative 3051.
def source65 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨91, by decide +kernel⟩

def target65 : Weights.Entry :=
  { word := [0, 4, 4, 4, 8, 0, 1], weights := [0, 0, 1, 1] }

def points65 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 617, representative 3032.
def source66 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨72, by decide +kernel⟩

def target66 : Weights.Entry :=
  { word := [0, 4, 4, 4, 8, 0, 2], weights := [1, 0, 1, 0] }

-- Period 7, original row 618, representative 3034.
def source67 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨74, by decide +kernel⟩

def target67 : Weights.Entry :=
  { word := [0, 4, 4, 4, 8, 0, 4], weights := [1, 0, 0, 1] }

def points67 : List (ℕ × ℕ) := [(0, 0), (1, 2), (2, 1), (3, 3), (4, 6), (5, 4), (6, 5)]

-- Period 7, original row 635, representative 3041.
def source68 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨81, by decide +kernel⟩

def target68 : Weights.Entry :=
  { word := [0, 4, 8, 4, 2, 0, 1], weights := [1, 0, 0, 0] }

def points68 : List (ℕ × ℕ) := [(0, 2), (1, 0), (2, 1), (3, 6), (4, 3), (5, 4), (6, 5)]

-- Period 7, original row 636, representative 3059.
def source69 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨98, by decide +kernel⟩

def target69 : Weights.Entry :=
  { word := [0, 4, 8, 4, 2, 0, 2], weights := [0, 0, 1, 0] }

-- Period 7, original row 637, representative 3059.
def source70 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨98, by decide +kernel⟩

def target70 : Weights.Entry :=
  { word := [0, 4, 8, 4, 2, 0, 4], weights := [1, 0, 0, 0] }

def points70 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 2), (3, 5), (4, 4), (5, 3), (6, 6)]

-- Period 7, original row 643, representative 2991.
def source71 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨33, by decide +kernel⟩

def target71 : Weights.Entry :=
  { word := [0, 4, 8, 4, 2, 8, 4], weights := [1, 0, 0, 1] }

-- Period 7, original row 647, representative 3034.
def source72 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨74, by decide +kernel⟩

def target72 : Weights.Entry :=
  { word := [0, 4, 8, 4, 4, 4, 0], weights := [0, 0, 1, 1] }

def points72 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 661, representative 3019.
def source73 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨60, by decide +kernel⟩

def target73 : Weights.Entry :=
  { word := [0, 4, 8, 4, 10, 0, 1], weights := [0, 0, 1, 0] }

def points73 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 662, representative 3027.
def source74 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨67, by decide +kernel⟩

def target74 : Weights.Entry :=
  { word := [0, 4, 8, 4, 10, 0, 2], weights := [0, 0, 1, 0] }

-- Period 7, original row 663, representative 3054.
def source75 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨94, by decide +kernel⟩

def target75 : Weights.Entry :=
  { word := [0, 4, 8, 4, 10, 0, 4], weights := [1, 0, 0, 1] }

-- Period 7, original row 669, representative 2984.
def source76 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨26, by decide +kernel⟩

def target76 : Weights.Entry :=
  { word := [0, 4, 8, 4, 10, 8, 4], weights := [1, 0, 0, 1] }

-- Period 7, original row 673, representative 3014.
def source77 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨55, by decide +kernel⟩

def target77 : Weights.Entry :=
  { word := [0, 4, 8, 4, 12, 4, 0], weights := [0, 0, 1, 1] }

def points77 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 692, representative 2980.
def source78 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨22, by decide +kernel⟩

def target78 : Weights.Entry :=
  { word := [0, 4, 10, 0, 1, 8, 2], weights := [0, 1, 0, 1] }

-- Period 7, original row 693, representative 2976.
def source79 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨18, by decide +kernel⟩

def target79 : Weights.Entry :=
  { word := [0, 4, 10, 0, 1, 8, 4], weights := [0, 1, 0, 1] }

-- Period 7, original row 699, representative 2968.
def source80 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨10, by decide +kernel⟩

def target80 : Weights.Entry :=
  { word := [0, 4, 10, 0, 9, 8, 2], weights := [0, 1, 0, 1] }

-- Period 7, original row 700, representative 2972.
def source81 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨14, by decide +kernel⟩

def target81 : Weights.Entry :=
  { word := [0, 4, 10, 0, 9, 8, 4], weights := [0, 1, 0, 1] }

-- Period 7, original row 718, representative 2980.
def source82 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨22, by decide +kernel⟩

def target82 : Weights.Entry :=
  { word := [0, 4, 12, 4, 0, 8, 2], weights := [1, 0, 0, 1] }

def points82 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6)]

-- Period 7, original row 719, representative 2976.
def source83 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨18, by decide +kernel⟩

def target83 : Weights.Entry :=
  { word := [0, 4, 12, 4, 0, 8, 4], weights := [1, 0, 0, 1] }

def points83 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6)]

-- Period 7, original row 724, representative 3052.
def source84 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨92, by decide +kernel⟩

def target84 : Weights.Entry :=
  { word := [0, 4, 12, 4, 8, 0, 1], weights := [0, 0, 1, 1] }

def points84 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 725, representative 3033.
def source85 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨73, by decide +kernel⟩

def target85 : Weights.Entry :=
  { word := [0, 4, 12, 4, 8, 0, 2], weights := [1, 0, 1, 0] }

-- Period 7, original row 726, representative 3035.
def source86 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨75, by decide +kernel⟩

def target86 : Weights.Entry :=
  { word := [0, 4, 12, 4, 8, 0, 4], weights := [1, 0, 0, 1] }

-- Period 7, original row 813, representative 3061.
def source87 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨100, by decide +kernel⟩

def target87 : Weights.Entry :=
  { word := [0, 8, 0, 4, 2, 0, 1], weights := [0, 0, 1, 0] }

def points87 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 814, representative 3061.
def source88 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨100, by decide +kernel⟩

def target88 : Weights.Entry :=
  { word := [0, 8, 0, 4, 2, 0, 2], weights := [0, 0, 1, 0] }

def points88 : List (ℕ × ℕ) := [(0, 1), (1, 2), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 815, representative 3063.
def source89 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨102, by decide +kernel⟩

def target89 : Weights.Entry :=
  { word := [0, 8, 0, 4, 2, 0, 4], weights := [1, 0, 0, 1] }

-- Period 7, original row 821, representative 2994.
def source90 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨36, by decide +kernel⟩

def target90 : Weights.Entry :=
  { word := [0, 8, 0, 4, 2, 8, 4], weights := [1, 0, 0, 1] }

-- Period 7, original row 825, representative 3061.
def source91 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨100, by decide +kernel⟩

def target91 : Weights.Entry :=
  { word := [0, 8, 0, 4, 4, 4, 0], weights := [0, 0, 0, 1] }

def points91 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 5), (4, 6), (5, 4), (6, 3)]

-- Period 7, original row 839, representative 3029.
def source92 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨69, by decide +kernel⟩

def target92 : Weights.Entry :=
  { word := [0, 8, 0, 4, 10, 0, 1], weights := [0, 0, 1, 0] }

def points92 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 840, representative 3029.
def source93 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨69, by decide +kernel⟩

def target93 : Weights.Entry :=
  { word := [0, 8, 0, 4, 10, 0, 2], weights := [0, 0, 1, 0] }

def points93 : List (ℕ × ℕ) := [(0, 1), (1, 2), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 841, representative 3062.
def source94 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨101, by decide +kernel⟩

def target94 : Weights.Entry :=
  { word := [0, 8, 0, 4, 10, 0, 4], weights := [1, 0, 0, 1] }

-- Period 7, original row 847, representative 2987.
def source95 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨29, by decide +kernel⟩

def target95 : Weights.Entry :=
  { word := [0, 8, 0, 4, 10, 8, 4], weights := [1, 0, 0, 1] }

-- Period 7, original row 851, representative 3029.
def source96 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨69, by decide +kernel⟩

def target96 : Weights.Entry :=
  { word := [0, 8, 0, 4, 12, 4, 0], weights := [0, 0, 0, 1] }

def points96 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 5), (4, 6), (5, 4), (6, 3)]

-- Period 7, original row 892, representative 3049.
def source97 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨89, by decide +kernel⟩

def target97 : Weights.Entry :=
  { word := [0, 8, 1, 4, 2, 0, 1], weights := [0, 0, 1, 0] }

def points97 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 893, representative 3008.
def source98 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨50, by decide +kernel⟩

def target98 : Weights.Entry :=
  { word := [0, 8, 1, 4, 2, 0, 2], weights := [0, 0, 1, 0] }

def points98 : List (ℕ × ℕ) := [(0, 1), (1, 2), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 894, representative 3000.
def source99 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨42, by decide +kernel⟩

def target99 : Weights.Entry :=
  { word := [0, 8, 1, 4, 2, 0, 4], weights := [1, 0, 0, 1] }

-- Period 7, original row 900, representative 2993.
def source100 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨35, by decide +kernel⟩

def target100 : Weights.Entry :=
  { word := [0, 8, 1, 4, 2, 8, 4], weights := [1, 0, 0, 1] }

-- Period 7, original row 904, representative 3049.
def source101 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨89, by decide +kernel⟩

def target101 : Weights.Entry :=
  { word := [0, 8, 1, 4, 4, 4, 0], weights := [0, 0, 0, 1] }

def points101 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 5), (4, 6), (5, 4), (6, 3)]

-- Period 7, original row 914, representative 3021.
def source102 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨62, by decide +kernel⟩

def target102 : Weights.Entry :=
  { word := [0, 8, 1, 4, 10, 0, 1], weights := [0, 0, 1, 0] }

def points102 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 915, representative 3005.
def source103 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨47, by decide +kernel⟩

def target103 : Weights.Entry :=
  { word := [0, 8, 1, 4, 10, 0, 2], weights := [0, 0, 1, 0] }

def points103 : List (ℕ × ℕ) := [(0, 1), (1, 2), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 916, representative 2998.
def source104 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨40, by decide +kernel⟩

def target104 : Weights.Entry :=
  { word := [0, 8, 1, 4, 10, 0, 4], weights := [1, 0, 0, 1] }

-- Period 7, original row 922, representative 2986.
def source105 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨28, by decide +kernel⟩

def target105 : Weights.Entry :=
  { word := [0, 8, 1, 4, 10, 8, 4], weights := [1, 0, 0, 1] }

-- Period 7, original row 926, representative 3021.
def source106 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨62, by decide +kernel⟩

def target106 : Weights.Entry :=
  { word := [0, 8, 1, 4, 12, 4, 0], weights := [0, 0, 0, 1] }

def points106 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 5), (4, 6), (5, 4), (6, 3)]

-- Period 7, original row 938, representative 3055.
def source107 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨95, by decide +kernel⟩

def target107 : Weights.Entry :=
  { word := [0, 8, 2, 2, 2, 0, 1], weights := [0, 1, 0, 0] }

def points107 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 939, representative 3038.
def source108 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨78, by decide +kernel⟩

def target108 : Weights.Entry :=
  { word := [0, 8, 2, 2, 2, 0, 2], weights := [0, 1, 0, 0] }

-- Period 7, original row 940, representative 3042.
def source109 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨82, by decide +kernel⟩

def target109 : Weights.Entry :=
  { word := [0, 8, 2, 2, 2, 0, 4], weights := [1, 0, 0, 1] }

-- Period 7, original row 948, representative 2959.
def source110 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨1, by decide +kernel⟩

def target110 : Weights.Entry :=
  { word := [0, 8, 2, 2, 2, 8, 4], weights := [1, 0, 0, 1] }

-- Period 7, original row 953, representative 3024.
def source111 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨65, by decide +kernel⟩

def target111 : Weights.Entry :=
  { word := [0, 8, 2, 2, 10, 0, 1], weights := [0, 1, 0, 0] }

def points111 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 954, representative 3017.
def source112 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨58, by decide +kernel⟩

def target112 : Weights.Entry :=
  { word := [0, 8, 2, 2, 10, 0, 2], weights := [0, 1, 0, 0] }

-- Period 7, original row 955, representative 3043.
def source113 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨83, by decide +kernel⟩

def target113 : Weights.Entry :=
  { word := [0, 8, 2, 2, 10, 0, 4], weights := [1, 0, 0, 1] }

-- Period 7, original row 968, representative 3056.
def source114 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨96, by decide +kernel⟩

def target114 : Weights.Entry :=
  { word := [0, 8, 2, 10, 2, 0, 1], weights := [0, 1, 0, 0] }

def points114 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 969, representative 3039.
def source115 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨79, by decide +kernel⟩

def target115 : Weights.Entry :=
  { word := [0, 8, 2, 10, 2, 0, 2], weights := [0, 1, 0, 0] }

-- Period 7, original row 970, representative 3045.
def source116 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨85, by decide +kernel⟩

def target116 : Weights.Entry :=
  { word := [0, 8, 2, 10, 2, 0, 4], weights := [1, 1, 0, 0] }

-- Period 7, original row 977, representative 2962.
def source117 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨4, by decide +kernel⟩

def target117 : Weights.Entry :=
  { word := [0, 8, 2, 10, 2, 8, 4], weights := [1, 0, 0, 1] }

-- Period 7, original row 982, representative 3025.
def source118 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨66, by decide +kernel⟩

def target118 : Weights.Entry :=
  { word := [0, 8, 2, 10, 10, 0, 1], weights := [0, 1, 0, 0] }

def points118 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 983, representative 3018.
def source119 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨59, by decide +kernel⟩

def target119 : Weights.Entry :=
  { word := [0, 8, 2, 10, 10, 0, 2], weights := [0, 1, 0, 0] }

-- Period 7, original row 984, representative 3044.
def source120 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨84, by decide +kernel⟩

def target120 : Weights.Entry :=
  { word := [0, 8, 2, 10, 10, 0, 4], weights := [1, 1, 0, 0] }

-- Period 7, original row 1042, representative 3060.
def source121 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨99, by decide +kernel⟩

def target121 : Weights.Entry :=
  { word := [0, 8, 8, 4, 4, 4, 0], weights := [0, 0, 1, 1] }

def points121 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 1050, representative 3028.
def source122 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨68, by decide +kernel⟩

def target122 : Weights.Entry :=
  { word := [0, 8, 8, 4, 12, 4, 0], weights := [0, 0, 1, 0] }

def points122 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 1068, representative 3048.
def source123 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨88, by decide +kernel⟩

def target123 : Weights.Entry :=
  { word := [0, 8, 9, 4, 4, 4, 0], weights := [0, 0, 1, 1] }

def points123 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 1072, representative 3020.
def source124 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨61, by decide +kernel⟩

def target124 : Weights.Entry :=
  { word := [0, 8, 9, 4, 12, 4, 0], weights := [0, 0, 1, 0] }

def points124 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 1083, representative 2960.
def source125 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨2, by decide +kernel⟩

def target125 : Weights.Entry :=
  { word := [0, 8, 10, 2, 2, 8, 4], weights := [1, 0, 0, 1] }

-- Period 7, original row 1098, representative 2961.
def source126 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨3, by decide +kernel⟩

def target126 : Weights.Entry :=
  { word := [0, 8, 10, 10, 2, 8, 4], weights := [1, 0, 0, 1] }

-- Period 7, original row 1505, representative 3008.
def source127 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨50, by decide +kernel⟩

def target127 : Weights.Entry :=
  { word := [0, 12, 0, 4, 2, 0, 1], weights := [0, 0, 1, 0] }

def points127 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

def period7Entries : List Weights.Entry := [target0, target1, target2, target3, target4, target5, target6, target7, target8, target9, target10, target11, target12, target13, target14, target15, target16, target17, target18, target19, target20, target21, target22, target23, target24, target25, target26, target27, target28, target29, target30, target31, target32, target33, target34, target35, target36, target37, target38, target39, target40, target41, target42, target43, target44, target45, target46, target47, target48, target49, target50, target51, target52, target53, target54, target55, target56, target57, target58, target59, target60, target61, target62, target63, target64, target65, target66, target67, target68, target69, target70, target71, target72, target73, target74, target75, target76, target77, target78, target79, target80, target81, target82, target83, target84, target85, target86, target87, target88, target89, target90, target91, target92, target93, target94, target95, target96, target97, target98, target99, target100, target101, target102, target103, target104, target105, target106, target107, target108, target109, target110, target111, target112, target113, target114, target115, target116, target117, target118, target119, target120, target121, target122, target123, target124, target125, target126, target127]

def period7Chunk : RowCoverage.Chunk where
  rows := [⟨8, target0⟩, ⟨24, target1⟩, ⟨30, target2⟩, ⟨56, target3⟩, ⟨63, target4⟩, ⟨92, target5⟩, ⟨96, target6⟩, ⟨107, target7⟩, ⟨115, target8⟩, ⟨148, target9⟩, ⟨156, target10⟩, ⟨158, target11⟩, ⟨160, target12⟩, ⟨164, target13⟩, ⟨168, target14⟩, ⟨170, target15⟩, ⟨172, target16⟩, ⟨200, target17⟩, ⟨202, target18⟩, ⟨203, target19⟩, ⟨204, target20⟩, ⟨206, target21⟩, ⟨208, target22⟩, ⟨210, target23⟩, ⟨237, target24⟩, ⟨245, target25⟩, ⟨247, target26⟩, ⟨249, target27⟩, ⟨253, target28⟩, ⟨257, target29⟩, ⟨259, target30⟩, ⟨261, target31⟩, ⟨293, target32⟩, ⟨320, target33⟩, ⟨328, target34⟩, ⟨330, target35⟩, ⟨339, target36⟩, ⟨341, target37⟩, ⟨348, target38⟩, ⟨356, target39⟩, ⟨358, target40⟩, ⟨425, target41⟩, ⟨433, target42⟩, ⟨435, target43⟩, ⟨437, target44⟩, ⟨439, target45⟩, ⟨446, target46⟩, ⟨454, target47⟩, ⟨456, target48⟩, ⟨514, target49⟩, ⟨530, target50⟩, ⟨536, target51⟩, ⟨560, target52⟩, ⟨561, target53⟩, ⟨566, target54⟩, ⟨567, target55⟩, ⟨568, target56⟩, ⟨574, target57⟩, ⟨575, target58⟩, ⟨580, target59⟩, ⟨581, target60⟩, ⟨594, target61⟩, ⟨595, target62⟩, ⟨610, target63⟩, ⟨611, target64⟩, ⟨616, target65⟩, ⟨617, target66⟩, ⟨618, target67⟩, ⟨635, target68⟩, ⟨636, target69⟩, ⟨637, target70⟩, ⟨643, target71⟩, ⟨647, target72⟩, ⟨661, target73⟩, ⟨662, target74⟩, ⟨663, target75⟩, ⟨669, target76⟩, ⟨673, target77⟩, ⟨692, target78⟩, ⟨693, target79⟩, ⟨699, target80⟩, ⟨700, target81⟩, ⟨718, target82⟩, ⟨719, target83⟩, ⟨724, target84⟩, ⟨725, target85⟩, ⟨726, target86⟩, ⟨813, target87⟩, ⟨814, target88⟩, ⟨815, target89⟩, ⟨821, target90⟩, ⟨825, target91⟩, ⟨839, target92⟩, ⟨840, target93⟩, ⟨841, target94⟩, ⟨847, target95⟩, ⟨851, target96⟩, ⟨892, target97⟩, ⟨893, target98⟩, ⟨894, target99⟩, ⟨900, target100⟩, ⟨904, target101⟩, ⟨914, target102⟩, ⟨915, target103⟩, ⟨916, target104⟩, ⟨922, target105⟩, ⟨926, target106⟩, ⟨938, target107⟩, ⟨939, target108⟩, ⟨940, target109⟩, ⟨948, target110⟩, ⟨953, target111⟩, ⟨954, target112⟩, ⟨955, target113⟩, ⟨968, target114⟩, ⟨969, target115⟩, ⟨970, target116⟩, ⟨977, target117⟩, ⟨982, target118⟩, ⟨983, target119⟩, ⟨984, target120⟩, ⟨1042, target121⟩, ⟨1050, target122⟩, ⟨1068, target123⟩, ⟨1072, target124⟩, ⟨1083, target125⟩, ⟨1098, target126⟩, ⟨1505, target127⟩]
  indexMask := 1122389187533889239924082814728987455792768508170586522370425536793310843218026310517026588370719016372900813017454000556780821416133378980745697460459964082740107614225845235829756224309922663022600830891521787102523910942816223560297046000164787889667905568131028538498750647856394437565560859290562837634395068219239899535537716470838091814272246337187695277607775049650468277410072163889691313451947340643784442565098672868661591570776360836480893184
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

end FranklSmallCyclic.TransportBatches.G023.B000.Data
