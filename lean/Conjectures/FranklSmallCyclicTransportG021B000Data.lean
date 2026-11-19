module

public import Conjectures.FranklSmallCyclicRowCoverage
public import Conjectures.FranklSmallCyclicCanonicalWords
public import Conjectures.FranklSmallCyclicOrbit7Block021Data

/-! 128 literal targets sharing one source proof block.
Original words and row indices are retained; weights may be transported.
-/
@[expose] public section

namespace FranklSmallCyclic.TransportBatches.G021.B000.Data

-- Period 7, original row 13, representative 2768.
def source0 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B021.Data.entryAt ⟨66, by decide +kernel⟩

def target0 : Weights.Entry :=
  { word := [0, 0, 1, 4, 4, 4, 8], weights := [0, 0, 0, 1] }

-- Period 7, original row 35, representative 2724.
def source1 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B021.Data.entryAt ⟨22, by decide +kernel⟩

def target1 : Weights.Entry :=
  { word := [0, 0, 1, 4, 12, 4, 8], weights := [0, 0, 0, 1] }

-- Period 7, original row 36, representative 2783.
def source2 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B021.Data.entryAt ⟨81, by decide +kernel⟩

def target2 : Weights.Entry :=
  { word := [0, 0, 1, 12, 4, 4, 8], weights := [0, 1, 1, 0] }

-- Period 7, original row 45, representative 2731.
def source3 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B021.Data.entryAt ⟨29, by decide +kernel⟩

def target3 : Weights.Entry :=
  { word := [0, 0, 1, 12, 12, 4, 8], weights := [0, 1, 1, 0] }

-- Period 7, original row 93, representative 2777.
def source4 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B021.Data.entryAt ⟨75, by decide +kernel⟩

def target4 : Weights.Entry :=
  { word := [0, 0, 9, 4, 4, 4, 8], weights := [1, 0, 0, 1] }

-- Period 7, original row 97, representative 2729.
def source5 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B021.Data.entryAt ⟨27, by decide +kernel⟩

def target5 : Weights.Entry :=
  { word := [0, 0, 9, 4, 12, 4, 8], weights := [0, 0, 1, 0] }

-- Period 7, original row 100, representative 2780.
def source6 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B021.Data.entryAt ⟨78, by decide +kernel⟩

def target6 : Weights.Entry :=
  { word := [0, 0, 9, 12, 4, 4, 8], weights := [0, 1, 1, 0] }

-- Period 7, original row 102, representative 2730.
def source7 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B021.Data.entryAt ⟨28, by decide +kernel⟩

def target7 : Weights.Entry :=
  { word := [0, 0, 9, 12, 12, 4, 8], weights := [0, 0, 1, 0] }

-- Period 7, original row 123, representative 2768.
def source8 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B021.Data.entryAt ⟨66, by decide +kernel⟩

def target8 : Weights.Entry :=
  { word := [0, 1, 0, 2, 2, 2, 8], weights := [0, 0, 0, 1] }

def points8 : List (ℕ × ℕ) := [(0, 1), (1, 2), (2, 0), (3, 4), (4, 5), (5, 3), (6, 6)]

-- Period 7, original row 125, representative 2710.
def source9 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B021.Data.entryAt ⟨8, by decide +kernel⟩

def target9 : Weights.Entry :=
  { word := [0, 1, 0, 2, 2, 10, 8], weights := [1, 0, 0, 1] }

-- Period 7, original row 134, representative 2783.
def source10 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B021.Data.entryAt ⟨81, by decide +kernel⟩

def target10 : Weights.Entry :=
  { word := [0, 1, 0, 10, 2, 2, 8], weights := [1, 0, 1, 0] }

def points10 : List (ℕ × ℕ) := [(0, 1), (1, 2), (2, 0), (3, 4), (4, 5), (5, 3), (6, 6)]

-- Period 7, original row 135, representative 2715.
def source11 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B021.Data.entryAt ⟨13, by decide +kernel⟩

def target11 : Weights.Entry :=
  { word := [0, 1, 0, 10, 2, 10, 8], weights := [1, 0, 0, 1] }

-- Period 7, original row 145, representative 2818.
def source12 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B021.Data.entryAt ⟨116, by decide +kernel⟩

def target12 : Weights.Entry :=
  { word := [0, 1, 4, 2, 0, 1, 8], weights := [1, 0, 0, 1] }

-- Period 7, original row 147, representative 2752.
def source13 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B021.Data.entryAt ⟨50, by decide +kernel⟩

def target13 : Weights.Entry :=
  { word := [0, 1, 4, 2, 0, 2, 8], weights := [1, 0, 0, 1] }

-- Period 7, original row 157, representative 2802.
def source14 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B021.Data.entryAt ⟨100, by decide +kernel⟩

def target14 : Weights.Entry :=
  { word := [0, 1, 4, 2, 0, 9, 8], weights := [1, 0, 0, 1] }

-- Period 7, original row 159, representative 2702.
def source15 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B021.Data.entryAt ⟨0, by decide +kernel⟩

def target15 : Weights.Entry :=
  { word := [0, 1, 4, 2, 0, 10, 8], weights := [1, 0, 0, 1] }

-- Period 7, original row 161, representative 2765.
def source16 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B021.Data.entryAt ⟨63, by decide +kernel⟩

def target16 : Weights.Entry :=
  { word := [0, 1, 4, 2, 8, 2, 8], weights := [1, 0, 0, 1] }

-- Period 7, original row 165, representative 2707.
def source17 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B021.Data.entryAt ⟨5, by decide +kernel⟩

def target17 : Weights.Entry :=
  { word := [0, 1, 4, 2, 8, 10, 8], weights := [1, 0, 0, 1] }

-- Period 7, original row 167, representative 2818.
def source18 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B021.Data.entryAt ⟨116, by decide +kernel⟩

def target18 : Weights.Entry :=
  { word := [0, 1, 4, 4, 4, 0, 8], weights := [1, 0, 0, 1] }

def points18 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 5), (5, 4), (6, 6)]

-- Period 7, original row 169, representative 2814.
def source19 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B021.Data.entryAt ⟨112, by decide +kernel⟩

def target19 : Weights.Entry :=
  { word := [0, 1, 4, 4, 4, 8, 8], weights := [0, 0, 1, 0] }

-- Period 7, original row 171, representative 2747.
def source20 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B021.Data.entryAt ⟨45, by decide +kernel⟩

def target20 : Weights.Entry :=
  { word := [0, 1, 4, 8, 4, 2, 8], weights := [0, 1, 1, 0] }

-- Period 7, original row 174, representative 2829.
def source21 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B021.Data.entryAt ⟨127, by decide +kernel⟩

def target21 : Weights.Entry :=
  { word := [0, 1, 4, 10, 0, 1, 8], weights := [1, 0, 0, 1] }

-- Period 7, original row 175, representative 2767.
def source22 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B021.Data.entryAt ⟨65, by decide +kernel⟩

def target22 : Weights.Entry :=
  { word := [0, 1, 4, 10, 0, 2, 8], weights := [1, 0, 0, 1] }

-- Period 7, original row 184, representative 2809.
def source23 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B021.Data.entryAt ⟨107, by decide +kernel⟩

def target23 : Weights.Entry :=
  { word := [0, 1, 4, 10, 0, 9, 8], weights := [1, 0, 0, 1] }

-- Period 7, original row 185, representative 2709.
def source24 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B021.Data.entryAt ⟨7, by decide +kernel⟩

def target24 : Weights.Entry :=
  { word := [0, 1, 4, 10, 0, 10, 8], weights := [1, 0, 0, 1] }

-- Period 7, original row 191, representative 2766.
def source25 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B021.Data.entryAt ⟨64, by decide +kernel⟩

def target25 : Weights.Entry :=
  { word := [0, 1, 4, 10, 8, 2, 8], weights := [0, 1, 1, 0] }

-- Period 7, original row 196, representative 2708.
def source26 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B021.Data.entryAt ⟨6, by decide +kernel⟩

def target26 : Weights.Entry :=
  { word := [0, 1, 4, 10, 8, 10, 8], weights := [0, 1, 1, 0] }

-- Period 7, original row 199, representative 2829.
def source27 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B021.Data.entryAt ⟨127, by decide +kernel⟩

def target27 : Weights.Entry :=
  { word := [0, 1, 4, 12, 4, 0, 8], weights := [1, 0, 0, 1] }

def points27 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 5), (5, 4), (6, 6)]

-- Period 7, original row 201, representative 2817.
def source28 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B021.Data.entryAt ⟨115, by decide +kernel⟩

def target28 : Weights.Entry :=
  { word := [0, 1, 4, 12, 4, 8, 8], weights := [0, 0, 1, 0] }

-- Period 7, original row 205, representative 2773.
def source29 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B021.Data.entryAt ⟨71, by decide +kernel⟩

def target29 : Weights.Entry :=
  { word := [0, 1, 8, 2, 2, 2, 8], weights := [1, 0, 0, 1] }

-- Period 7, original row 207, representative 2711.
def source30 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B021.Data.entryAt ⟨9, by decide +kernel⟩

def target30 : Weights.Entry :=
  { word := [0, 1, 8, 2, 2, 10, 8], weights := [1, 0, 0, 1] }

-- Period 7, original row 209, representative 2774.
def source31 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B021.Data.entryAt ⟨72, by decide +kernel⟩

def target31 : Weights.Entry :=
  { word := [0, 1, 8, 2, 10, 2, 8], weights := [1, 0, 0, 1] }

-- Period 7, original row 211, representative 2712.
def source32 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B021.Data.entryAt ⟨10, by decide +kernel⟩

def target32 : Weights.Entry :=
  { word := [0, 1, 8, 2, 10, 10, 8], weights := [1, 0, 0, 1] }

-- Period 7, original row 225, representative 2776.
def source33 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B021.Data.entryAt ⟨74, by decide +kernel⟩

def target33 : Weights.Entry :=
  { word := [0, 1, 8, 10, 2, 2, 8], weights := [0, 1, 1, 0] }

-- Period 7, original row 226, representative 2714.
def source34 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B021.Data.entryAt ⟨12, by decide +kernel⟩

def target34 : Weights.Entry :=
  { word := [0, 1, 8, 10, 2, 10, 8], weights := [0, 1, 1, 0] }

-- Period 7, original row 227, representative 2775.
def source35 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B021.Data.entryAt ⟨73, by decide +kernel⟩

def target35 : Weights.Entry :=
  { word := [0, 1, 8, 10, 10, 2, 8], weights := [0, 1, 1, 0] }

-- Period 7, original row 228, representative 2713.
def source36 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B021.Data.entryAt ⟨11, by decide +kernel⟩

def target36 : Weights.Entry :=
  { word := [0, 1, 8, 10, 10, 10, 8], weights := [0, 1, 1, 0] }

-- Period 7, original row 234, representative 2819.
def source37 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B021.Data.entryAt ⟨117, by decide +kernel⟩

def target37 : Weights.Entry :=
  { word := [0, 1, 12, 2, 0, 1, 8], weights := [1, 0, 0, 1] }

-- Period 7, original row 236, representative 2757.
def source38 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B021.Data.entryAt ⟨55, by decide +kernel⟩

def target38 : Weights.Entry :=
  { word := [0, 1, 12, 2, 0, 2, 8], weights := [1, 0, 0, 1] }

-- Period 7, original row 246, representative 2803.
def source39 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B021.Data.entryAt ⟨101, by decide +kernel⟩

def target39 : Weights.Entry :=
  { word := [0, 1, 12, 2, 0, 9, 8], weights := [1, 0, 0, 1] }

-- Period 7, original row 248, representative 2703.
def source40 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B021.Data.entryAt ⟨1, by decide +kernel⟩

def target40 : Weights.Entry :=
  { word := [0, 1, 12, 2, 0, 10, 8], weights := [1, 0, 0, 1] }

-- Period 7, original row 250, representative 2758.
def source41 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B021.Data.entryAt ⟨56, by decide +kernel⟩

def target41 : Weights.Entry :=
  { word := [0, 1, 12, 2, 8, 2, 8], weights := [1, 0, 0, 1] }

-- Period 7, original row 254, representative 2704.
def source42 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B021.Data.entryAt ⟨2, by decide +kernel⟩

def target42 : Weights.Entry :=
  { word := [0, 1, 12, 2, 8, 10, 8], weights := [1, 0, 0, 1] }

-- Period 7, original row 256, representative 2819.
def source43 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B021.Data.entryAt ⟨117, by decide +kernel⟩

def target43 : Weights.Entry :=
  { word := [0, 1, 12, 4, 4, 0, 8], weights := [1, 0, 0, 1] }

def points43 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 5), (5, 4), (6, 6)]

-- Period 7, original row 258, representative 2815.
def source44 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B021.Data.entryAt ⟨113, by decide +kernel⟩

def target44 : Weights.Entry :=
  { word := [0, 1, 12, 4, 4, 8, 8], weights := [0, 0, 1, 0] }

-- Period 7, original row 260, representative 2746.
def source45 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B021.Data.entryAt ⟨44, by decide +kernel⟩

def target45 : Weights.Entry :=
  { word := [0, 1, 12, 8, 4, 2, 8], weights := [0, 1, 1, 0] }

-- Period 7, original row 263, representative 2822.
def source46 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B021.Data.entryAt ⟨120, by decide +kernel⟩

def target46 : Weights.Entry :=
  { word := [0, 1, 12, 10, 0, 1, 8], weights := [1, 0, 0, 1] }

-- Period 7, original row 264, representative 2760.
def source47 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B021.Data.entryAt ⟨58, by decide +kernel⟩

def target47 : Weights.Entry :=
  { word := [0, 1, 12, 10, 0, 2, 8], weights := [1, 0, 0, 1] }

-- Period 7, original row 277, representative 2806.
def source48 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B021.Data.entryAt ⟨104, by decide +kernel⟩

def target48 : Weights.Entry :=
  { word := [0, 1, 12, 10, 0, 9, 8], weights := [1, 0, 0, 1] }

-- Period 7, original row 278, representative 2706.
def source49 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B021.Data.entryAt ⟨4, by decide +kernel⟩

def target49 : Weights.Entry :=
  { word := [0, 1, 12, 10, 0, 10, 8], weights := [1, 0, 0, 1] }

-- Period 7, original row 284, representative 2759.
def source50 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B021.Data.entryAt ⟨57, by decide +kernel⟩

def target50 : Weights.Entry :=
  { word := [0, 1, 12, 10, 8, 2, 8], weights := [0, 1, 1, 0] }

-- Period 7, original row 289, representative 2705.
def source51 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B021.Data.entryAt ⟨3, by decide +kernel⟩

def target51 : Weights.Entry :=
  { word := [0, 1, 12, 10, 8, 10, 8], weights := [0, 1, 1, 0] }

-- Period 7, original row 292, representative 2822.
def source52 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B021.Data.entryAt ⟨120, by decide +kernel⟩

def target52 : Weights.Entry :=
  { word := [0, 1, 12, 12, 4, 0, 8], weights := [1, 0, 0, 1] }

def points52 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 5), (5, 4), (6, 6)]

-- Period 7, original row 294, representative 2816.
def source53 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B021.Data.entryAt ⟨114, by decide +kernel⟩

def target53 : Weights.Entry :=
  { word := [0, 1, 12, 12, 4, 8, 8], weights := [0, 0, 1, 0] }

-- Period 7, original row 317, representative 2818.
def source54 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B021.Data.entryAt ⟨116, by decide +kernel⟩

def target54 : Weights.Entry :=
  { word := [0, 2, 2, 2, 0, 1, 8], weights := [0, 1, 0, 1] }

def points54 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6)]

-- Period 7, original row 319, representative 2752.
def source55 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B021.Data.entryAt ⟨50, by decide +kernel⟩

def target55 : Weights.Entry :=
  { word := [0, 2, 2, 2, 0, 2, 8], weights := [0, 1, 0, 1] }

def points55 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6)]

-- Period 7, original row 329, representative 2802.
def source56 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B021.Data.entryAt ⟨100, by decide +kernel⟩

def target56 : Weights.Entry :=
  { word := [0, 2, 2, 2, 0, 9, 8], weights := [0, 1, 0, 1] }

def points56 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6)]

-- Period 7, original row 331, representative 2702.
def source57 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B021.Data.entryAt ⟨0, by decide +kernel⟩

def target57 : Weights.Entry :=
  { word := [0, 2, 2, 2, 0, 10, 8], weights := [0, 1, 0, 1] }

def points57 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6)]

-- Period 7, original row 340, representative 2810.
def source58 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B021.Data.entryAt ⟨108, by decide +kernel⟩

def target58 : Weights.Entry :=
  { word := [0, 2, 2, 2, 8, 1, 8], weights := [1, 0, 0, 1] }

-- Period 7, original row 342, representative 2736.
def source59 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B021.Data.entryAt ⟨34, by decide +kernel⟩

def target59 : Weights.Entry :=
  { word := [0, 2, 2, 2, 8, 2, 8], weights := [1, 0, 0, 1] }

-- Period 7, original row 357, representative 2792.
def source60 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B021.Data.entryAt ⟨90, by decide +kernel⟩

def target60 : Weights.Entry :=
  { word := [0, 2, 2, 2, 8, 9, 8], weights := [1, 0, 0, 1] }

-- Period 7, original row 366, representative 2829.
def source61 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B021.Data.entryAt ⟨127, by decide +kernel⟩

def target61 : Weights.Entry :=
  { word := [0, 2, 2, 10, 0, 1, 8], weights := [0, 1, 0, 1] }

def points61 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6)]

-- Period 7, original row 367, representative 2767.
def source62 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B021.Data.entryAt ⟨65, by decide +kernel⟩

def target62 : Weights.Entry :=
  { word := [0, 2, 2, 10, 0, 2, 8], weights := [0, 1, 0, 1] }

def points62 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6)]

-- Period 7, original row 376, representative 2809.
def source63 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B021.Data.entryAt ⟨107, by decide +kernel⟩

def target63 : Weights.Entry :=
  { word := [0, 2, 2, 10, 0, 9, 8], weights := [0, 1, 0, 1] }

def points63 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6)]

-- Period 7, original row 377, representative 2709.
def source64 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B021.Data.entryAt ⟨7, by decide +kernel⟩

def target64 : Weights.Entry :=
  { word := [0, 2, 2, 10, 0, 10, 8], weights := [0, 1, 0, 1] }

def points64 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6)]

-- Period 7, original row 390, representative 2813.
def source65 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B021.Data.entryAt ⟨111, by decide +kernel⟩

def target65 : Weights.Entry :=
  { word := [0, 2, 2, 10, 8, 1, 8], weights := [0, 1, 1, 0] }

-- Period 7, original row 391, representative 2739.
def source66 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B021.Data.entryAt ⟨37, by decide +kernel⟩

def target66 : Weights.Entry :=
  { word := [0, 2, 2, 10, 8, 2, 8], weights := [0, 1, 1, 0] }

-- Period 7, original row 404, representative 2795.
def source67 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B021.Data.entryAt ⟨93, by decide +kernel⟩

def target67 : Weights.Entry :=
  { word := [0, 2, 2, 10, 8, 9, 8], weights := [0, 1, 1, 0] }

-- Period 7, original row 422, representative 2819.
def source68 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B021.Data.entryAt ⟨117, by decide +kernel⟩

def target68 : Weights.Entry :=
  { word := [0, 2, 10, 2, 0, 1, 8], weights := [0, 1, 0, 1] }

def points68 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6)]

-- Period 7, original row 424, representative 2757.
def source69 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B021.Data.entryAt ⟨55, by decide +kernel⟩

def target69 : Weights.Entry :=
  { word := [0, 2, 10, 2, 0, 2, 8], weights := [0, 1, 0, 1] }

def points69 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6)]

-- Period 7, original row 434, representative 2803.
def source70 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B021.Data.entryAt ⟨101, by decide +kernel⟩

def target70 : Weights.Entry :=
  { word := [0, 2, 10, 2, 0, 9, 8], weights := [0, 1, 0, 1] }

def points70 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6)]

-- Period 7, original row 436, representative 2703.
def source71 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B021.Data.entryAt ⟨1, by decide +kernel⟩

def target71 : Weights.Entry :=
  { word := [0, 2, 10, 2, 0, 10, 8], weights := [0, 1, 0, 1] }

def points71 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6)]

-- Period 7, original row 438, representative 2811.
def source72 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B021.Data.entryAt ⟨109, by decide +kernel⟩

def target72 : Weights.Entry :=
  { word := [0, 2, 10, 2, 8, 1, 8], weights := [1, 0, 0, 1] }

-- Period 7, original row 440, representative 2737.
def source73 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B021.Data.entryAt ⟨35, by decide +kernel⟩

def target73 : Weights.Entry :=
  { word := [0, 2, 10, 2, 8, 2, 8], weights := [1, 0, 0, 1] }

-- Period 7, original row 455, representative 2793.
def source74 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B021.Data.entryAt ⟨91, by decide +kernel⟩

def target74 : Weights.Entry :=
  { word := [0, 2, 10, 2, 8, 9, 8], weights := [1, 0, 0, 1] }

-- Period 7, original row 464, representative 2822.
def source75 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B021.Data.entryAt ⟨120, by decide +kernel⟩

def target75 : Weights.Entry :=
  { word := [0, 2, 10, 10, 0, 1, 8], weights := [0, 1, 0, 1] }

def points75 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6)]

-- Period 7, original row 465, representative 2760.
def source76 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B021.Data.entryAt ⟨58, by decide +kernel⟩

def target76 : Weights.Entry :=
  { word := [0, 2, 10, 10, 0, 2, 8], weights := [0, 1, 0, 1] }

def points76 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6)]

-- Period 7, original row 478, representative 2806.
def source77 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B021.Data.entryAt ⟨104, by decide +kernel⟩

def target77 : Weights.Entry :=
  { word := [0, 2, 10, 10, 0, 9, 8], weights := [0, 1, 0, 1] }

def points77 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6)]

-- Period 7, original row 479, representative 2706.
def source78 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B021.Data.entryAt ⟨4, by decide +kernel⟩

def target78 : Weights.Entry :=
  { word := [0, 2, 10, 10, 0, 10, 8], weights := [0, 1, 0, 1] }

def points78 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6)]

-- Period 7, original row 485, representative 2812.
def source79 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B021.Data.entryAt ⟨110, by decide +kernel⟩

def target79 : Weights.Entry :=
  { word := [0, 2, 10, 10, 8, 1, 8], weights := [0, 1, 1, 0] }

-- Period 7, original row 486, representative 2738.
def source80 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B021.Data.entryAt ⟨36, by decide +kernel⟩

def target80 : Weights.Entry :=
  { word := [0, 2, 10, 10, 8, 2, 8], weights := [0, 1, 1, 0] }

-- Period 7, original row 499, representative 2794.
def source81 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B021.Data.entryAt ⟨92, by decide +kernel⟩

def target81 : Weights.Entry :=
  { word := [0, 2, 10, 10, 8, 9, 8], weights := [0, 1, 1, 0] }

-- Period 7, original row 519, representative 2752.
def source82 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B021.Data.entryAt ⟨50, by decide +kernel⟩

def target82 : Weights.Entry :=
  { word := [0, 4, 0, 4, 4, 4, 8], weights := [0, 0, 1, 1] }

def points82 : List (ℕ × ℕ) := [(0, 2), (1, 0), (2, 1), (3, 5), (4, 3), (5, 4), (6, 6)]

-- Period 7, original row 541, representative 2716.
def source83 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B021.Data.entryAt ⟨14, by decide +kernel⟩

def target83 : Weights.Entry :=
  { word := [0, 4, 0, 4, 12, 4, 8], weights := [0, 0, 0, 1] }

-- Period 7, original row 542, representative 2767.
def source84 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B021.Data.entryAt ⟨65, by decide +kernel⟩

def target84 : Weights.Entry :=
  { word := [0, 4, 0, 12, 4, 4, 8], weights := [0, 0, 1, 1] }

def points84 : List (ℕ × ℕ) := [(0, 2), (1, 0), (2, 1), (3, 5), (4, 3), (5, 4), (6, 6)]

-- Period 7, original row 551, representative 2723.
def source85 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B021.Data.entryAt ⟨21, by decide +kernel⟩

def target85 : Weights.Entry :=
  { word := [0, 4, 0, 12, 12, 4, 8], weights := [0, 1, 1, 0] }

-- Period 7, original row 648, representative 2761.
def source86 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B021.Data.entryAt ⟨59, by decide +kernel⟩

def target86 : Weights.Entry :=
  { word := [0, 4, 8, 4, 4, 4, 8], weights := [1, 0, 0, 1] }

-- Period 7, original row 674, representative 2721.
def source87 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B021.Data.entryAt ⟨19, by decide +kernel⟩

def target87 : Weights.Entry :=
  { word := [0, 4, 8, 4, 12, 4, 8], weights := [1, 0, 0, 1] }

-- Period 7, original row 677, representative 2764.
def source88 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B021.Data.entryAt ⟨62, by decide +kernel⟩

def target88 : Weights.Entry :=
  { word := [0, 4, 8, 12, 4, 4, 8], weights := [0, 1, 1, 0] }

-- Period 7, original row 689, representative 2722.
def source89 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B021.Data.entryAt ⟨20, by decide +kernel⟩

def target89 : Weights.Entry :=
  { word := [0, 4, 8, 12, 12, 4, 8], weights := [0, 1, 1, 0] }

-- Period 7, original row 826, representative 2784.
def source90 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B021.Data.entryAt ⟨82, by decide +kernel⟩

def target90 : Weights.Entry :=
  { word := [0, 8, 0, 4, 4, 4, 8], weights := [0, 0, 0, 1] }

-- Period 7, original row 852, representative 2732.
def source91 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B021.Data.entryAt ⟨30, by decide +kernel⟩

def target91 : Weights.Entry :=
  { word := [0, 8, 0, 4, 12, 4, 8], weights := [0, 0, 0, 1] }

-- Period 7, original row 882, representative 2787.
def source92 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B021.Data.entryAt ⟨85, by decide +kernel⟩

def target92 : Weights.Entry :=
  { word := [0, 8, 0, 12, 4, 4, 8], weights := [0, 1, 1, 0] }

-- Period 7, original row 891, representative 2735.
def source93 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B021.Data.entryAt ⟨33, by decide +kernel⟩

def target93 : Weights.Entry :=
  { word := [0, 8, 0, 12, 12, 4, 8], weights := [0, 1, 1, 0] }

-- Period 7, original row 905, representative 2769.
def source94 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B021.Data.entryAt ⟨67, by decide +kernel⟩

def target94 : Weights.Entry :=
  { word := [0, 8, 1, 4, 4, 4, 8], weights := [0, 0, 0, 1] }

-- Period 7, original row 927, representative 2725.
def source95 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B021.Data.entryAt ⟨23, by decide +kernel⟩

def target95 : Weights.Entry :=
  { word := [0, 8, 1, 4, 12, 4, 8], weights := [0, 0, 0, 1] }

-- Period 7, original row 928, representative 2772.
def source96 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B021.Data.entryAt ⟨70, by decide +kernel⟩

def target96 : Weights.Entry :=
  { word := [0, 8, 1, 12, 4, 4, 8], weights := [0, 1, 1, 0] }

-- Period 7, original row 937, representative 2728.
def source97 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B021.Data.entryAt ⟨26, by decide +kernel⟩

def target97 : Weights.Entry :=
  { word := [0, 8, 1, 12, 12, 4, 8], weights := [0, 1, 1, 0] }

-- Period 7, original row 1043, representative 2785.
def source98 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B021.Data.entryAt ⟨83, by decide +kernel⟩

def target98 : Weights.Entry :=
  { word := [0, 8, 8, 4, 4, 4, 8], weights := [1, 0, 0, 1] }

-- Period 7, original row 1051, representative 2733.
def source99 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B021.Data.entryAt ⟨31, by decide +kernel⟩

def target99 : Weights.Entry :=
  { word := [0, 8, 8, 4, 12, 4, 8], weights := [0, 0, 1, 0] }

-- Period 7, original row 1064, representative 2786.
def source100 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B021.Data.entryAt ⟨84, by decide +kernel⟩

def target100 : Weights.Entry :=
  { word := [0, 8, 8, 12, 4, 4, 8], weights := [0, 1, 1, 0] }

-- Period 7, original row 1066, representative 2734.
def source101 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B021.Data.entryAt ⟨32, by decide +kernel⟩

def target101 : Weights.Entry :=
  { word := [0, 8, 8, 12, 12, 4, 8], weights := [0, 0, 1, 0] }

-- Period 7, original row 1069, representative 2770.
def source102 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B021.Data.entryAt ⟨68, by decide +kernel⟩

def target102 : Weights.Entry :=
  { word := [0, 8, 9, 4, 4, 4, 8], weights := [1, 0, 0, 1] }

-- Period 7, original row 1073, representative 2726.
def source103 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B021.Data.entryAt ⟨24, by decide +kernel⟩

def target103 : Weights.Entry :=
  { word := [0, 8, 9, 4, 12, 4, 8], weights := [0, 0, 1, 0] }

-- Period 7, original row 1076, representative 2771.
def source104 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B021.Data.entryAt ⟨69, by decide +kernel⟩

def target104 : Weights.Entry :=
  { word := [0, 8, 9, 12, 4, 4, 8], weights := [0, 1, 1, 0] }

-- Period 7, original row 1078, representative 2727.
def source105 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B021.Data.entryAt ⟨25, by decide +kernel⟩

def target105 : Weights.Entry :=
  { word := [0, 8, 9, 12, 12, 4, 8], weights := [0, 0, 1, 0] }

-- Period 7, original row 1518, representative 2753.
def source106 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B021.Data.entryAt ⟨51, by decide +kernel⟩

def target106 : Weights.Entry :=
  { word := [0, 12, 0, 4, 4, 4, 8], weights := [0, 0, 0, 1] }

-- Period 7, original row 1540, representative 2717.
def source107 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B021.Data.entryAt ⟨15, by decide +kernel⟩

def target107 : Weights.Entry :=
  { word := [0, 12, 0, 4, 12, 4, 8], weights := [0, 0, 0, 1] }

-- Period 7, original row 1541, representative 2756.
def source108 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B021.Data.entryAt ⟨54, by decide +kernel⟩

def target108 : Weights.Entry :=
  { word := [0, 12, 0, 12, 4, 4, 8], weights := [0, 1, 1, 0] }

-- Period 7, original row 1550, representative 2720.
def source109 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B021.Data.entryAt ⟨18, by decide +kernel⟩

def target109 : Weights.Entry :=
  { word := [0, 12, 0, 12, 12, 4, 8], weights := [0, 1, 1, 0] }

-- Period 7, original row 1647, representative 2754.
def source110 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B021.Data.entryAt ⟨52, by decide +kernel⟩

def target110 : Weights.Entry :=
  { word := [0, 12, 8, 4, 4, 4, 8], weights := [1, 0, 0, 1] }

-- Period 7, original row 1673, representative 2718.
def source111 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B021.Data.entryAt ⟨16, by decide +kernel⟩

def target111 : Weights.Entry :=
  { word := [0, 12, 8, 4, 12, 4, 8], weights := [1, 0, 0, 1] }

-- Period 7, original row 1676, representative 2755.
def source112 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B021.Data.entryAt ⟨53, by decide +kernel⟩

def target112 : Weights.Entry :=
  { word := [0, 12, 8, 12, 4, 4, 8], weights := [0, 1, 1, 0] }

-- Period 7, original row 1688, representative 2719.
def source113 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B021.Data.entryAt ⟨17, by decide +kernel⟩

def target113 : Weights.Entry :=
  { word := [0, 12, 8, 12, 12, 4, 8], weights := [0, 1, 1, 0] }

-- Period 7, original row 1750, representative 2768.
def source114 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B021.Data.entryAt ⟨66, by decide +kernel⟩

def target114 : Weights.Entry :=
  { word := [1, 0, 1, 4, 4, 4, 8], weights := [0, 0, 0, 1] }

def points114 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 1772, representative 2724.
def source115 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B021.Data.entryAt ⟨22, by decide +kernel⟩

def target115 : Weights.Entry :=
  { word := [1, 0, 1, 4, 12, 4, 8], weights := [0, 0, 0, 1] }

def points115 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 1773, representative 2783.
def source116 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B021.Data.entryAt ⟨81, by decide +kernel⟩

def target116 : Weights.Entry :=
  { word := [1, 0, 1, 12, 4, 4, 8], weights := [0, 1, 1, 0] }

def points116 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 1782, representative 2731.
def source117 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B021.Data.entryAt ⟨29, by decide +kernel⟩

def target117 : Weights.Entry :=
  { word := [1, 0, 1, 12, 12, 4, 8], weights := [0, 1, 1, 0] }

def points117 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 1814, representative 2777.
def source118 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B021.Data.entryAt ⟨75, by decide +kernel⟩

def target118 : Weights.Entry :=
  { word := [1, 0, 9, 4, 4, 4, 8], weights := [1, 0, 0, 1] }

def points118 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 1818, representative 2729.
def source119 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B021.Data.entryAt ⟨27, by decide +kernel⟩

def target119 : Weights.Entry :=
  { word := [1, 0, 9, 4, 12, 4, 8], weights := [0, 0, 1, 0] }

def points119 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 1821, representative 2780.
def source120 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B021.Data.entryAt ⟨78, by decide +kernel⟩

def target120 : Weights.Entry :=
  { word := [1, 0, 9, 12, 4, 4, 8], weights := [0, 1, 1, 0] }

def points120 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 1823, representative 2730.
def source121 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B021.Data.entryAt ⟨28, by decide +kernel⟩

def target121 : Weights.Entry :=
  { word := [1, 0, 9, 12, 12, 4, 8], weights := [0, 0, 1, 0] }

def points121 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 1932, representative 2761.
def source122 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B021.Data.entryAt ⟨59, by decide +kernel⟩

def target122 : Weights.Entry :=
  { word := [1, 4, 8, 4, 4, 4, 8], weights := [1, 0, 0, 1] }

def points122 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 1958, representative 2721.
def source123 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B021.Data.entryAt ⟨19, by decide +kernel⟩

def target123 : Weights.Entry :=
  { word := [1, 4, 8, 4, 12, 4, 8], weights := [1, 0, 0, 1] }

def points123 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 1961, representative 2764.
def source124 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B021.Data.entryAt ⟨62, by decide +kernel⟩

def target124 : Weights.Entry :=
  { word := [1, 4, 8, 12, 4, 4, 8], weights := [0, 1, 1, 0] }

def points124 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 1973, representative 2722.
def source125 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B021.Data.entryAt ⟨20, by decide +kernel⟩

def target125 : Weights.Entry :=
  { word := [1, 4, 8, 12, 12, 4, 8], weights := [0, 1, 1, 0] }

def points125 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 2035, representative 2769.
def source126 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B021.Data.entryAt ⟨67, by decide +kernel⟩

def target126 : Weights.Entry :=
  { word := [1, 8, 1, 4, 4, 4, 8], weights := [0, 0, 0, 1] }

def points126 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 2057, representative 2725.
def source127 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B021.Data.entryAt ⟨23, by decide +kernel⟩

def target127 : Weights.Entry :=
  { word := [1, 8, 1, 4, 12, 4, 8], weights := [0, 0, 0, 1] }

def points127 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

def period7Entries : List Weights.Entry := [target0, target1, target2, target3, target4, target5, target6, target7, target8, target9, target10, target11, target12, target13, target14, target15, target16, target17, target18, target19, target20, target21, target22, target23, target24, target25, target26, target27, target28, target29, target30, target31, target32, target33, target34, target35, target36, target37, target38, target39, target40, target41, target42, target43, target44, target45, target46, target47, target48, target49, target50, target51, target52, target53, target54, target55, target56, target57, target58, target59, target60, target61, target62, target63, target64, target65, target66, target67, target68, target69, target70, target71, target72, target73, target74, target75, target76, target77, target78, target79, target80, target81, target82, target83, target84, target85, target86, target87, target88, target89, target90, target91, target92, target93, target94, target95, target96, target97, target98, target99, target100, target101, target102, target103, target104, target105, target106, target107, target108, target109, target110, target111, target112, target113, target114, target115, target116, target117, target118, target119, target120, target121, target122, target123, target124, target125, target126, target127]

def period7Chunk : RowCoverage.Chunk where
  rows := [⟨13, target0⟩, ⟨35, target1⟩, ⟨36, target2⟩, ⟨45, target3⟩, ⟨93, target4⟩, ⟨97, target5⟩, ⟨100, target6⟩, ⟨102, target7⟩, ⟨123, target8⟩, ⟨125, target9⟩, ⟨134, target10⟩, ⟨135, target11⟩, ⟨145, target12⟩, ⟨147, target13⟩, ⟨157, target14⟩, ⟨159, target15⟩, ⟨161, target16⟩, ⟨165, target17⟩, ⟨167, target18⟩, ⟨169, target19⟩, ⟨171, target20⟩, ⟨174, target21⟩, ⟨175, target22⟩, ⟨184, target23⟩, ⟨185, target24⟩, ⟨191, target25⟩, ⟨196, target26⟩, ⟨199, target27⟩, ⟨201, target28⟩, ⟨205, target29⟩, ⟨207, target30⟩, ⟨209, target31⟩, ⟨211, target32⟩, ⟨225, target33⟩, ⟨226, target34⟩, ⟨227, target35⟩, ⟨228, target36⟩, ⟨234, target37⟩, ⟨236, target38⟩, ⟨246, target39⟩, ⟨248, target40⟩, ⟨250, target41⟩, ⟨254, target42⟩, ⟨256, target43⟩, ⟨258, target44⟩, ⟨260, target45⟩, ⟨263, target46⟩, ⟨264, target47⟩, ⟨277, target48⟩, ⟨278, target49⟩, ⟨284, target50⟩, ⟨289, target51⟩, ⟨292, target52⟩, ⟨294, target53⟩, ⟨317, target54⟩, ⟨319, target55⟩, ⟨329, target56⟩, ⟨331, target57⟩, ⟨340, target58⟩, ⟨342, target59⟩, ⟨357, target60⟩, ⟨366, target61⟩, ⟨367, target62⟩, ⟨376, target63⟩, ⟨377, target64⟩, ⟨390, target65⟩, ⟨391, target66⟩, ⟨404, target67⟩, ⟨422, target68⟩, ⟨424, target69⟩, ⟨434, target70⟩, ⟨436, target71⟩, ⟨438, target72⟩, ⟨440, target73⟩, ⟨455, target74⟩, ⟨464, target75⟩, ⟨465, target76⟩, ⟨478, target77⟩, ⟨479, target78⟩, ⟨485, target79⟩, ⟨486, target80⟩, ⟨499, target81⟩, ⟨519, target82⟩, ⟨541, target83⟩, ⟨542, target84⟩, ⟨551, target85⟩, ⟨648, target86⟩, ⟨674, target87⟩, ⟨677, target88⟩, ⟨689, target89⟩, ⟨826, target90⟩, ⟨852, target91⟩, ⟨882, target92⟩, ⟨891, target93⟩, ⟨905, target94⟩, ⟨927, target95⟩, ⟨928, target96⟩, ⟨937, target97⟩, ⟨1043, target98⟩, ⟨1051, target99⟩, ⟨1064, target100⟩, ⟨1066, target101⟩, ⟨1069, target102⟩, ⟨1073, target103⟩, ⟨1076, target104⟩, ⟨1078, target105⟩, ⟨1518, target106⟩, ⟨1540, target107⟩, ⟨1541, target108⟩, ⟨1550, target109⟩, ⟨1647, target110⟩, ⟨1673, target111⟩, ⟨1676, target112⟩, ⟨1688, target113⟩, ⟨1750, target114⟩, ⟨1772, target115⟩, ⟨1773, target116⟩, ⟨1782, target117⟩, ⟨1814, target118⟩, ⟨1818, target119⟩, ⟨1821, target120⟩, ⟨1823, target121⟩, ⟨1932, target122⟩, ⟨1958, target123⟩, ⟨1961, target124⟩, ⟨1973, target125⟩, ⟨2035, target126⟩, ⟨2057, target127⟩]
  indexMask := 16546311053458265927297963608304463509811466602415712714370017615492548413052659062403590833998319966302909405451703837304773610618714540673813609397412553891716035049749461321474149185575736836375156218353186528206453599111189279479633618435894188632498283721873820477322156948793618837003368251363901249074427068489204132762512798335804998549969396247015049753265067111944772140520488177615785523851975488465780728123881659789101865957408199781664814310213172002641941033790070108496273039723670020799743677578574390036304541861421188745617861464928126618289075889454580434344888197034962762208569297876374097089273856
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

end FranklSmallCyclic.TransportBatches.G021.B000.Data
