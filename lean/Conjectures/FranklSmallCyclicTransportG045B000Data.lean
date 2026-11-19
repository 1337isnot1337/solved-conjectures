module

public import Conjectures.FranklSmallCyclicRowCoverage
public import Conjectures.FranklSmallCyclicCanonicalWords
public import Conjectures.FranklSmallCyclicOrbit8Block019Data

/-! 128 literal targets sharing one source proof block.
Original words and row indices are retained; weights may be transported.
-/
@[expose] public section

namespace FranklSmallCyclic.TransportBatches.G045.B000.Data

-- Period 8, original row 138, representative 5752.
def source0 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B019.Data.entryAt ⟨3, by decide +kernel⟩

def target0 : Weights.Entry :=
  { word := [0, 1, 0, 12, 0, 4, 8], weights := [0, 0, 1, 0] }

-- Period 8, original row 267, representative 5770.
def source1 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B019.Data.entryAt ⟨21, by decide +kernel⟩

def target1 : Weights.Entry :=
  { word := [0, 1, 12, 10, 0, 4, 8], weights := [1, 0, 1, 1] }

-- Period 8, original row 297, representative 5752.
def source2 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B019.Data.entryAt ⟨3, by decide +kernel⟩

def target2 : Weights.Entry :=
  { word := [0, 2, 0, 8, 1, 4, 8], weights := [0, 0, 1, 0] }

def points2 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6), (7, 7)]

-- Period 8, original row 345, representative 5763.
def source3 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B019.Data.entryAt ⟨14, by decide +kernel⟩

def target3 : Weights.Entry :=
  { word := [0, 2, 2, 2, 8, 4, 8], weights := [0, 1, 0, 1] }

-- Period 8, original row 394, representative 5764.
def source4 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B019.Data.entryAt ⟨15, by decide +kernel⟩

def target4 : Weights.Entry :=
  { word := [0, 2, 2, 10, 8, 4, 8], weights := [0, 1, 1, 0] }

-- Period 8, original row 443, representative 5761.
def source5 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B019.Data.entryAt ⟨12, by decide +kernel⟩

def target5 : Weights.Entry :=
  { word := [0, 2, 10, 2, 8, 4, 8], weights := [0, 1, 0, 1] }

-- Period 8, original row 468, representative 5770.
def source6 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B019.Data.entryAt ⟨21, by decide +kernel⟩

def target6 : Weights.Entry :=
  { word := [0, 2, 10, 10, 0, 4, 8], weights := [0, 1, 1, 1] }

def points6 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6), (7, 7)]

-- Period 8, original row 489, representative 5762.
def source7 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B019.Data.entryAt ⟨13, by decide +kernel⟩

def target7 : Weights.Entry :=
  { word := [0, 2, 10, 10, 8, 4, 8], weights := [0, 1, 1, 0] }

-- Period 8, original row 589, representative 5840.
def source8 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B019.Data.entryAt ⟨90, by decide +kernel⟩

def target8 : Weights.Entry :=
  { word := [0, 4, 2, 8, 8, 4, 8], weights := [0, 1, 1, 0] }

-- Period 8, original row 709, representative 5839.
def source9 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B019.Data.entryAt ⟨89, by decide +kernel⟩

def target9 : Weights.Entry :=
  { word := [0, 4, 10, 8, 8, 4, 8], weights := [0, 1, 1, 0] }

-- Period 8, original row 740, representative 5767.
def source10 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B019.Data.entryAt ⟨18, by decide +kernel⟩

def target10 : Weights.Entry :=
  { word := [0, 6, 0, 12, 8, 4, 8], weights := [0, 1, 1, 0] }

-- Period 8, original row 754, representative 5756.
def source11 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B019.Data.entryAt ⟨7, by decide +kernel⟩

def target11 : Weights.Entry :=
  { word := [0, 6, 2, 8, 8, 4, 8], weights := [0, 1, 1, 0] }

-- Period 8, original row 766, representative 5765.
def source12 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B019.Data.entryAt ⟨16, by decide +kernel⟩

def target12 : Weights.Entry :=
  { word := [0, 6, 8, 4, 8, 4, 8], weights := [0, 0, 1, 0] }

-- Period 8, original row 770, representative 5766.
def source13 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B019.Data.entryAt ⟨17, by decide +kernel⟩

def target13 : Weights.Entry :=
  { word := [0, 6, 8, 12, 8, 4, 8], weights := [0, 0, 1, 0] }

-- Period 8, original row 781, representative 5755.
def source14 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B019.Data.entryAt ⟨6, by decide +kernel⟩

def target14 : Weights.Entry :=
  { word := [0, 6, 10, 8, 8, 4, 8], weights := [0, 1, 1, 0] }

-- Period 8, original row 1146, representative 5750.
def source15 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B019.Data.entryAt ⟨1, by decide +kernel⟩

def target15 : Weights.Entry :=
  { word := [0, 9, 0, 4, 0, 4, 8], weights := [1, 0, 3, 0] }

-- Period 8, original row 1204, representative 5751.
def source16 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B019.Data.entryAt ⟨2, by decide +kernel⟩

def target16 : Weights.Entry :=
  { word := [0, 9, 0, 12, 0, 4, 8], weights := [1, 0, 1, 0] }

-- Period 8, original row 1229, representative 5749.
def source17 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B019.Data.entryAt ⟨0, by decide +kernel⟩

def target17 : Weights.Entry :=
  { word := [0, 9, 0, 12, 8, 4, 8], weights := [1, 0, 1, 0] }

-- Period 8, original row 1338, representative 5750.
def source18 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B019.Data.entryAt ⟨1, by decide +kernel⟩

def target18 : Weights.Entry :=
  { word := [0, 10, 0, 0, 1, 4, 8], weights := [0, 1, 3, 0] }

def points18 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6), (7, 7)]

-- Period 8, original row 1346, representative 5751.
def source19 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B019.Data.entryAt ⟨2, by decide +kernel⟩

def target19 : Weights.Entry :=
  { word := [0, 10, 0, 8, 1, 4, 8], weights := [0, 1, 1, 0] }

def points19 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6), (7, 7)]

-- Period 8, original row 1368, representative 5768.
def source20 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B019.Data.entryAt ⟨19, by decide +kernel⟩

def target20 : Weights.Entry :=
  { word := [0, 10, 0, 12, 8, 4, 8], weights := [0, 1, 1, 0] }

-- Period 8, original row 1388, representative 5759.
def source21 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B019.Data.entryAt ⟨10, by decide +kernel⟩

def target21 : Weights.Entry :=
  { word := [0, 10, 2, 2, 8, 4, 8], weights := [0, 1, 0, 1] }

-- Period 8, original row 1420, representative 5760.
def source22 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B019.Data.entryAt ⟨11, by decide +kernel⟩

def target22 : Weights.Entry :=
  { word := [0, 10, 2, 10, 8, 4, 8], weights := [0, 1, 1, 0] }

-- Period 8, original row 1463, representative 5757.
def source23 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B019.Data.entryAt ⟨8, by decide +kernel⟩

def target23 : Weights.Entry :=
  { word := [0, 10, 10, 2, 8, 4, 8], weights := [0, 1, 0, 1] }

-- Period 8, original row 1488, representative 5758.
def source24 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B019.Data.entryAt ⟨9, by decide +kernel⟩

def target24 : Weights.Entry :=
  { word := [0, 10, 10, 10, 8, 4, 8], weights := [0, 1, 1, 0] }

-- Period 8, original row 1588, representative 5838.
def source25 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B019.Data.entryAt ⟨88, by decide +kernel⟩

def target25 : Weights.Entry :=
  { word := [0, 12, 2, 8, 8, 4, 8], weights := [0, 1, 1, 0] }

-- Period 8, original row 1708, representative 5837.
def source26 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B019.Data.entryAt ⟨87, by decide +kernel⟩

def target26 : Weights.Entry :=
  { word := [0, 12, 10, 8, 8, 4, 8], weights := [0, 1, 1, 0] }

-- Period 8, original row 1878, representative 5840.
def source27 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B019.Data.entryAt ⟨90, by decide +kernel⟩

def target27 : Weights.Entry :=
  { word := [1, 4, 2, 8, 8, 4, 8], weights := [0, 1, 1, 0] }

def points27 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 8, original row 1993, representative 5839.
def source28 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B019.Data.entryAt ⟨89, by decide +kernel⟩

def target28 : Weights.Entry :=
  { word := [1, 4, 10, 8, 8, 4, 8], weights := [0, 1, 1, 0] }

def points28 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 8, original row 2237, representative 5838.
def source29 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B019.Data.entryAt ⟨88, by decide +kernel⟩

def target29 : Weights.Entry :=
  { word := [1, 12, 2, 8, 8, 4, 8], weights := [0, 1, 1, 0] }

def points29 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 8, original row 2352, representative 5837.
def source30 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B019.Data.entryAt ⟨87, by decide +kernel⟩

def target30 : Weights.Entry :=
  { word := [1, 12, 10, 8, 8, 4, 8], weights := [0, 1, 1, 0] }

def points30 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 8, original row 2800, representative 5865.
def source31 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B019.Data.entryAt ⟨115, by decide +kernel⟩

def target31 : Weights.Entry :=
  { word := [2, 8, 0, 2, 2, 10, 8], weights := [1, 0, 0, 1] }

-- Period 8, original row 2804, representative 5870.
def source32 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B019.Data.entryAt ⟨120, by decide +kernel⟩

def target32 : Weights.Entry :=
  { word := [2, 8, 0, 2, 10, 10, 8], weights := [1, 0, 0, 1] }

-- Period 8, original row 2820, representative 5853.
def source33 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B019.Data.entryAt ⟨103, by decide +kernel⟩

def target33 : Weights.Entry :=
  { word := [2, 8, 0, 4, 6, 0, 8], weights := [1, 0, 0, 1] }

-- Period 8, original row 2822, representative 5841.
def source34 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B019.Data.entryAt ⟨91, by decide +kernel⟩

def target34 : Weights.Entry :=
  { word := [2, 8, 0, 4, 6, 8, 8], weights := [1, 0, 0, 1] }

-- Period 8, original row 2846, representative 5872.
def source35 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B019.Data.entryAt ⟨122, by decide +kernel⟩

def target35 : Weights.Entry :=
  { word := [2, 8, 0, 10, 2, 10, 8], weights := [1, 0, 0, 1] }

-- Period 8, original row 2848, representative 5871.
def source36 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B019.Data.entryAt ⟨121, by decide +kernel⟩

def target36 : Weights.Entry :=
  { word := [2, 8, 0, 10, 10, 10, 8], weights := [1, 0, 0, 1] }

-- Period 8, original row 2871, representative 5856.
def source37 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B019.Data.entryAt ⟨106, by decide +kernel⟩

def target37 : Weights.Entry :=
  { word := [2, 8, 0, 12, 6, 0, 8], weights := [1, 0, 0, 1] }

-- Period 8, original row 2873, representative 5844.
def source38 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B019.Data.entryAt ⟨94, by decide +kernel⟩

def target38 : Weights.Entry :=
  { word := [2, 8, 0, 12, 6, 8, 8], weights := [1, 0, 0, 1] }

-- Period 8, original row 2897, representative 5835.
def source39 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B019.Data.entryAt ⟨85, by decide +kernel⟩

def target39 : Weights.Entry :=
  { word := [2, 8, 2, 0, 1, 8, 8], weights := [0, 0, 1, 0] }

-- Period 8, original row 2900, representative 5836.
def source40 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B019.Data.entryAt ⟨86, by decide +kernel⟩

def target40 : Weights.Entry :=
  { word := [2, 8, 2, 0, 9, 8, 8], weights := [0, 0, 1, 0] }

-- Period 8, original row 2917, representative 5873.
def source41 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B019.Data.entryAt ⟨123, by decide +kernel⟩

def target41 : Weights.Entry :=
  { word := [2, 8, 4, 2, 0, 10, 8], weights := [1, 0, 0, 1] }

-- Period 8, original row 2925, representative 5857.
def source42 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B019.Data.entryAt ⟨107, by decide +kernel⟩

def target42 : Weights.Entry :=
  { word := [2, 8, 4, 4, 4, 0, 8], weights := [1, 0, 0, 1] }

-- Period 8, original row 2927, representative 5845.
def source43 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B019.Data.entryAt ⟨95, by decide +kernel⟩

def target43 : Weights.Entry :=
  { word := [2, 8, 4, 4, 4, 8, 8], weights := [1, 0, 0, 1] }

-- Period 8, original row 2929, representative 5862.
def source44 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B019.Data.entryAt ⟨112, by decide +kernel⟩

def target44 : Weights.Entry :=
  { word := [2, 8, 4, 4, 12, 0, 8], weights := [1, 0, 0, 1] }

-- Period 8, original row 2931, representative 5850.
def source45 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B019.Data.entryAt ⟨100, by decide +kernel⟩

def target45 : Weights.Entry :=
  { word := [2, 8, 4, 4, 12, 8, 8], weights := [1, 0, 0, 1] }

-- Period 8, original row 2949, representative 5864.
def source46 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B019.Data.entryAt ⟨114, by decide +kernel⟩

def target46 : Weights.Entry :=
  { word := [2, 8, 4, 12, 4, 0, 8], weights := [1, 0, 0, 1] }

-- Period 8, original row 2951, representative 5852.
def source47 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B019.Data.entryAt ⟨102, by decide +kernel⟩

def target47 : Weights.Entry :=
  { word := [2, 8, 4, 12, 4, 8, 8], weights := [1, 0, 0, 1] }

-- Period 8, original row 2952, representative 5863.
def source48 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B019.Data.entryAt ⟨113, by decide +kernel⟩

def target48 : Weights.Entry :=
  { word := [2, 8, 4, 12, 12, 0, 8], weights := [1, 0, 0, 1] }

-- Period 8, original row 2954, representative 5851.
def source49 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B019.Data.entryAt ⟨101, by decide +kernel⟩

def target49 : Weights.Entry :=
  { word := [2, 8, 4, 12, 12, 8, 8], weights := [1, 0, 0, 1] }

-- Period 8, original row 2964, representative 5866.
def source50 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B019.Data.entryAt ⟨116, by decide +kernel⟩

def target50 : Weights.Entry :=
  { word := [2, 8, 8, 2, 2, 10, 8], weights := [1, 0, 0, 1] }

-- Period 8, original row 2968, representative 5867.
def source51 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B019.Data.entryAt ⟨117, by decide +kernel⟩

def target51 : Weights.Entry :=
  { word := [2, 8, 8, 2, 10, 10, 8], weights := [1, 0, 0, 1] }

-- Period 8, original row 2986, representative 5854.
def source52 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B019.Data.entryAt ⟨104, by decide +kernel⟩

def target52 : Weights.Entry :=
  { word := [2, 8, 8, 4, 6, 0, 8], weights := [1, 0, 0, 1] }

-- Period 8, original row 2988, representative 5842.
def source53 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B019.Data.entryAt ⟨92, by decide +kernel⟩

def target53 : Weights.Entry :=
  { word := [2, 8, 8, 4, 6, 8, 8], weights := [1, 0, 0, 1] }

-- Period 8, original row 3030, representative 5869.
def source54 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B019.Data.entryAt ⟨119, by decide +kernel⟩

def target54 : Weights.Entry :=
  { word := [2, 8, 8, 10, 2, 10, 8], weights := [1, 0, 0, 1] }

-- Period 8, original row 3032, representative 5868.
def source55 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B019.Data.entryAt ⟨118, by decide +kernel⟩

def target55 : Weights.Entry :=
  { word := [2, 8, 8, 10, 10, 10, 8], weights := [1, 0, 0, 1] }

-- Period 8, original row 3059, representative 5855.
def source56 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B019.Data.entryAt ⟨105, by decide +kernel⟩

def target56 : Weights.Entry :=
  { word := [2, 8, 8, 12, 6, 0, 8], weights := [1, 0, 0, 1] }

-- Period 8, original row 3061, representative 5843.
def source57 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B019.Data.entryAt ⟨93, by decide +kernel⟩

def target57 : Weights.Entry :=
  { word := [2, 8, 8, 12, 6, 8, 8], weights := [1, 0, 0, 1] }

-- Period 8, original row 3105, representative 5833.
def source58 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B019.Data.entryAt ⟨83, by decide +kernel⟩

def target58 : Weights.Entry :=
  { word := [2, 8, 10, 0, 1, 8, 8], weights := [0, 0, 1, 0] }

-- Period 8, original row 3108, representative 5834.
def source59 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B019.Data.entryAt ⟨84, by decide +kernel⟩

def target59 : Weights.Entry :=
  { word := [2, 8, 10, 0, 9, 8, 8], weights := [0, 0, 1, 0] }

-- Period 8, original row 3125, representative 5874.
def source60 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B019.Data.entryAt ⟨124, by decide +kernel⟩

def target60 : Weights.Entry :=
  { word := [2, 8, 12, 2, 0, 10, 8], weights := [1, 0, 0, 1] }

-- Period 8, original row 3131, representative 5875.
def source61 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B019.Data.entryAt ⟨125, by decide +kernel⟩

def target61 : Weights.Entry :=
  { word := [2, 8, 12, 2, 8, 10, 8], weights := [1, 0, 0, 1] }

-- Period 8, original row 3133, representative 5858.
def source62 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B019.Data.entryAt ⟨108, by decide +kernel⟩

def target62 : Weights.Entry :=
  { word := [2, 8, 12, 4, 4, 0, 8], weights := [1, 0, 0, 1] }

-- Period 8, original row 3135, representative 5846.
def source63 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B019.Data.entryAt ⟨96, by decide +kernel⟩

def target63 : Weights.Entry :=
  { word := [2, 8, 12, 4, 4, 8, 8], weights := [1, 0, 0, 1] }

-- Period 8, original row 3137, representative 5859.
def source64 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B019.Data.entryAt ⟨109, by decide +kernel⟩

def target64 : Weights.Entry :=
  { word := [2, 8, 12, 4, 12, 0, 8], weights := [1, 0, 0, 1] }

-- Period 8, original row 3139, representative 5847.
def source65 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B019.Data.entryAt ⟨97, by decide +kernel⟩

def target65 : Weights.Entry :=
  { word := [2, 8, 12, 4, 12, 8, 8], weights := [1, 0, 0, 1] }

-- Period 8, original row 3150, representative 5877.
def source66 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B019.Data.entryAt ⟨127, by decide +kernel⟩

def target66 : Weights.Entry :=
  { word := [2, 8, 12, 10, 0, 10, 8], weights := [1, 0, 0, 1] }

-- Period 8, original row 3156, representative 5876.
def source67 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B019.Data.entryAt ⟨126, by decide +kernel⟩

def target67 : Weights.Entry :=
  { word := [2, 8, 12, 10, 8, 10, 8], weights := [1, 0, 0, 1] }

-- Period 8, original row 3159, representative 5861.
def source68 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B019.Data.entryAt ⟨111, by decide +kernel⟩

def target68 : Weights.Entry :=
  { word := [2, 8, 12, 12, 4, 0, 8], weights := [1, 0, 0, 1] }

-- Period 8, original row 3161, representative 5849.
def source69 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B019.Data.entryAt ⟨99, by decide +kernel⟩

def target69 : Weights.Entry :=
  { word := [2, 8, 12, 12, 4, 8, 8], weights := [1, 0, 0, 1] }

-- Period 8, original row 3162, representative 5860.
def source70 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B019.Data.entryAt ⟨110, by decide +kernel⟩

def target70 : Weights.Entry :=
  { word := [2, 8, 12, 12, 12, 0, 8], weights := [1, 0, 0, 1] }

-- Period 8, original row 3164, representative 5848.
def source71 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B019.Data.entryAt ⟨98, by decide +kernel⟩

def target71 : Weights.Entry :=
  { word := [2, 8, 12, 12, 12, 8, 8], weights := [1, 0, 0, 1] }

-- Period 8, original row 4117, representative 5830.
def source72 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B019.Data.entryAt ⟨80, by decide +kernel⟩

def target72 : Weights.Entry :=
  { word := [8, 0, 0, 12, 0, 4, 8], weights := [0, 0, 1, 0] }

-- Period 8, original row 4136, representative 5800.
def source73 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B019.Data.entryAt ⟨50, by decide +kernel⟩

def target73 : Weights.Entry :=
  { word := [8, 0, 1, 4, 4, 4, 8], weights := [1, 0, 0, 1] }

-- Period 8, original row 4139, representative 5822.
def source74 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B019.Data.entryAt ⟨72, by decide +kernel⟩

def target74 : Weights.Entry :=
  { word := [8, 0, 1, 4, 8, 4, 8], weights := [1, 0, 1, 0] }

-- Period 8, original row 4158, representative 5780.
def source75 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B019.Data.entryAt ⟨30, by decide +kernel⟩

def target75 : Weights.Entry :=
  { word := [8, 0, 1, 4, 12, 4, 8], weights := [1, 0, 0, 1] }

-- Period 8, original row 4172, representative 5807.
def source76 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B019.Data.entryAt ⟨57, by decide +kernel⟩

def target76 : Weights.Entry :=
  { word := [8, 0, 1, 12, 4, 4, 8], weights := [1, 0, 0, 1] }

-- Period 8, original row 4175, representative 5825.
def source77 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B019.Data.entryAt ⟨75, by decide +kernel⟩

def target77 : Weights.Entry :=
  { word := [8, 0, 1, 12, 8, 4, 8], weights := [1, 0, 1, 0] }

-- Period 8, original row 4194, representative 5787.
def source78 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B019.Data.entryAt ⟨37, by decide +kernel⟩

def target78 : Weights.Entry :=
  { word := [8, 0, 1, 12, 12, 4, 8], weights := [1, 0, 0, 1] }

-- Period 8, original row 4205, representative 5857.
def source79 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B019.Data.entryAt ⟨107, by decide +kernel⟩

def target79 : Weights.Entry :=
  { word := [8, 0, 2, 2, 2, 8, 4], weights := [1, 0, 0, 1] }

def points79 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 4220, representative 5858.
def source80 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B019.Data.entryAt ⟨108, by decide +kernel⟩

def target80 : Weights.Entry :=
  { word := [8, 0, 2, 2, 10, 8, 4], weights := [1, 0, 0, 1] }

def points80 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 4234, representative 5864.
def source81 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B019.Data.entryAt ⟨114, by decide +kernel⟩

def target81 : Weights.Entry :=
  { word := [8, 0, 2, 10, 2, 8, 4], weights := [1, 0, 0, 1] }

def points81 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 4248, representative 5861.
def source82 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B019.Data.entryAt ⟨111, by decide +kernel⟩

def target82 : Weights.Entry :=
  { word := [8, 0, 2, 10, 10, 8, 4], weights := [1, 0, 0, 1] }

def points82 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 4289, representative 5832.
def source83 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B019.Data.entryAt ⟨82, by decide +kernel⟩

def target83 : Weights.Entry :=
  { word := [8, 0, 4, 10, 0, 4, 8], weights := [1, 0, 2, 1] }

-- Period 8, original row 4318, representative 5853.
def source84 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B019.Data.entryAt ⟨103, by decide +kernel⟩

def target84 : Weights.Entry :=
  { word := [8, 0, 6, 2, 0, 8, 4], weights := [1, 0, 0, 1] }

def points84 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 4326, representative 5854.
def source85 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B019.Data.entryAt ⟨104, by decide +kernel⟩

def target85 : Weights.Entry :=
  { word := [8, 0, 6, 2, 8, 8, 4], weights := [1, 0, 0, 1] }

def points85 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 4333, representative 5856.
def source86 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B019.Data.entryAt ⟨106, by decide +kernel⟩

def target86 : Weights.Entry :=
  { word := [8, 0, 6, 10, 0, 8, 4], weights := [1, 0, 0, 1] }

def points86 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 4340, representative 5855.
def source87 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B019.Data.entryAt ⟨105, by decide +kernel⟩

def target87 : Weights.Entry :=
  { word := [8, 0, 6, 10, 8, 8, 4], weights := [1, 0, 0, 1] }

def points87 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 4356, representative 5812.
def source88 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B019.Data.entryAt ⟨62, by decide +kernel⟩

def target88 : Weights.Entry :=
  { word := [8, 0, 8, 4, 4, 4, 8], weights := [1, 0, 0, 1] }

-- Period 8, original row 4377, representative 5813.
def source89 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B019.Data.entryAt ⟨63, by decide +kernel⟩

def target89 : Weights.Entry :=
  { word := [8, 0, 8, 12, 4, 4, 8], weights := [1, 0, 0, 1] }

-- Period 8, original row 4381, representative 5805.
def source90 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B019.Data.entryAt ⟨55, by decide +kernel⟩

def target90 : Weights.Entry :=
  { word := [8, 0, 9, 4, 4, 4, 8], weights := [1, 0, 0, 1] }

-- Period 8, original row 4385, representative 5785.
def source91 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B019.Data.entryAt ⟨35, by decide +kernel⟩

def target91 : Weights.Entry :=
  { word := [8, 0, 9, 4, 12, 4, 8], weights := [1, 0, 0, 1] }

-- Period 8, original row 4389, representative 5806.
def source92 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B019.Data.entryAt ⟨56, by decide +kernel⟩

def target92 : Weights.Entry :=
  { word := [8, 0, 9, 12, 4, 4, 8], weights := [1, 0, 0, 1] }

-- Period 8, original row 4393, representative 5786.
def source93 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B019.Data.entryAt ⟨36, by decide +kernel⟩

def target93 : Weights.Entry :=
  { word := [8, 0, 9, 12, 12, 4, 8], weights := [1, 0, 0, 1] }

-- Period 8, original row 4399, representative 5862.
def source94 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B019.Data.entryAt ⟨112, by decide +kernel⟩

def target94 : Weights.Entry :=
  { word := [8, 0, 10, 2, 2, 8, 4], weights := [1, 0, 0, 1] }

def points94 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 4407, representative 5859.
def source95 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B019.Data.entryAt ⟨109, by decide +kernel⟩

def target95 : Weights.Entry :=
  { word := [8, 0, 10, 2, 10, 8, 4], weights := [1, 0, 0, 1] }

def points95 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 4414, representative 5863.
def source96 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B019.Data.entryAt ⟨113, by decide +kernel⟩

def target96 : Weights.Entry :=
  { word := [8, 0, 10, 10, 2, 8, 4], weights := [1, 0, 0, 1] }

def points96 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 4421, representative 5860.
def source97 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B019.Data.entryAt ⟨110, by decide +kernel⟩

def target97 : Weights.Entry :=
  { word := [8, 0, 10, 10, 10, 8, 4], weights := [1, 0, 0, 1] }

def points97 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 4463, representative 5831.
def source98 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B019.Data.entryAt ⟨81, by decide +kernel⟩

def target98 : Weights.Entry :=
  { word := [8, 0, 12, 10, 0, 4, 8], weights := [1, 0, 1, 1] }

-- Period 8, original row 4667, representative 5750.
def source99 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B019.Data.entryAt ⟨1, by decide +kernel⟩

def target99 : Weights.Entry :=
  { word := [8, 2, 0, 1, 0, 12, 0], weights := [0, 3, 1, 0] }

def points99 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 5), (4, 6), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 4681, representative 5750.
def source100 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B019.Data.entryAt ⟨1, by decide +kernel⟩

def target100 : Weights.Entry :=
  { word := [8, 2, 0, 2, 0, 8, 1], weights := [0, 3, 0, 1] }

def points100 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 4682, representative 5828.
def source101 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B019.Data.entryAt ⟨78, by decide +kernel⟩

def target101 : Weights.Entry :=
  { word := [8, 2, 0, 2, 0, 8, 8], weights := [1, 2, 0, 1] }

-- Period 8, original row 4684, representative 5769.
def source102 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B019.Data.entryAt ⟨20, by decide +kernel⟩

def target102 : Weights.Entry :=
  { word := [8, 2, 0, 6, 0, 4, 8], weights := [1, 1, 1, 1] }

-- Period 8, original row 4686, representative 5754.
def source103 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B019.Data.entryAt ⟨5, by decide +kernel⟩

def target103 : Weights.Entry :=
  { word := [8, 2, 0, 6, 8, 4, 8], weights := [1, 1, 1, 1] }

-- Period 8, original row 4700, representative 5752.
def source104 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B019.Data.entryAt ⟨3, by decide +kernel⟩

def target104 : Weights.Entry :=
  { word := [8, 2, 0, 9, 0, 4, 0], weights := [0, 1, 0, 0] }

def points104 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 5), (4, 6), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 4703, representative 5751.
def source105 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B019.Data.entryAt ⟨2, by decide +kernel⟩

def target105 : Weights.Entry :=
  { word := [8, 2, 0, 9, 0, 12, 0], weights := [0, 1, 1, 0] }

def points105 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 5), (4, 6), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 4722, representative 5752.
def source106 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B019.Data.entryAt ⟨3, by decide +kernel⟩

def target106 : Weights.Entry :=
  { word := [8, 2, 0, 10, 0, 0, 1], weights := [0, 1, 0, 0] }

def points106 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 4725, representative 5830.
def source107 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B019.Data.entryAt ⟨80, by decide +kernel⟩

def target107 : Weights.Entry :=
  { word := [8, 2, 0, 10, 0, 0, 8], weights := [0, 1, 0, 0] }

def points107 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 4730, representative 5751.
def source108 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B019.Data.entryAt ⟨2, by decide +kernel⟩

def target108 : Weights.Entry :=
  { word := [8, 2, 0, 10, 0, 8, 1], weights := [0, 1, 0, 1] }

def points108 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 4732, representative 5829.
def source109 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B019.Data.entryAt ⟨79, by decide +kernel⟩

def target109 : Weights.Entry :=
  { word := [8, 2, 0, 10, 0, 8, 8], weights := [1, 0, 0, 1] }

-- Period 8, original row 4745, representative 5832.
def source110 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B019.Data.entryAt ⟨82, by decide +kernel⟩

def target110 : Weights.Entry :=
  { word := [8, 2, 0, 12, 2, 0, 8], weights := [1, 2, 0, 1] }

def points110 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 4749, representative 5770.
def source111 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B019.Data.entryAt ⟨21, by decide +kernel⟩

def target111 : Weights.Entry :=
  { word := [8, 2, 0, 12, 10, 0, 1], weights := [1, 1, 0, 1] }

def points111 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 4752, representative 5831.
def source112 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B019.Data.entryAt ⟨81, by decide +kernel⟩

def target112 : Weights.Entry :=
  { word := [8, 2, 0, 12, 10, 0, 8], weights := [1, 1, 0, 1] }

def points112 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 4756, representative 5770.
def source113 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B019.Data.entryAt ⟨21, by decide +kernel⟩

def target113 : Weights.Entry :=
  { word := [8, 2, 0, 12, 12, 4, 0], weights := [1, 1, 1, 0] }

def points113 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 5), (4, 6), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 4758, representative 5800.
def source114 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B019.Data.entryAt ⟨50, by decide +kernel⟩

def target114 : Weights.Entry :=
  { word := [8, 2, 2, 2, 0, 1, 8], weights := [1, 0, 0, 1] }

def points114 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 4760, representative 5792.
def source115 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B019.Data.entryAt ⟨42, by decide +kernel⟩

def target115 : Weights.Entry :=
  { word := [8, 2, 2, 2, 0, 2, 8], weights := [1, 0, 0, 1] }

-- Period 8, original row 4765, representative 5808.
def source116 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B019.Data.entryAt ⟨58, by decide +kernel⟩

def target116 : Weights.Entry :=
  { word := [8, 2, 2, 2, 0, 8, 8], weights := [1, 0, 0, 1] }

-- Period 8, original row 4770, representative 5801.
def source117 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B019.Data.entryAt ⟨51, by decide +kernel⟩

def target117 : Weights.Entry :=
  { word := [8, 2, 2, 2, 0, 9, 8], weights := [1, 0, 0, 1] }

-- Period 8, original row 4772, representative 5793.
def source118 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B019.Data.entryAt ⟨43, by decide +kernel⟩

def target118 : Weights.Entry :=
  { word := [8, 2, 2, 2, 0, 10, 8], weights := [1, 0, 0, 1] }

-- Period 8, original row 4776, representative 5812.
def source119 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B019.Data.entryAt ⟨62, by decide +kernel⟩

def target119 : Weights.Entry :=
  { word := [8, 2, 2, 2, 8, 0, 8], weights := [1, 0, 0, 1] }

def points119 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 4781, representative 5805.
def source120 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B019.Data.entryAt ⟨55, by decide +kernel⟩

def target120 : Weights.Entry :=
  { word := [8, 2, 2, 2, 8, 1, 8], weights := [1, 0, 0, 1] }

def points120 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 4783, representative 5797.
def source121 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B019.Data.entryAt ⟨47, by decide +kernel⟩

def target121 : Weights.Entry :=
  { word := [8, 2, 2, 2, 8, 2, 8], weights := [1, 0, 0, 1] }

-- Period 8, original row 4788, representative 5809.
def source122 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B019.Data.entryAt ⟨59, by decide +kernel⟩

def target122 : Weights.Entry :=
  { word := [8, 2, 2, 2, 8, 8, 8], weights := [1, 0, 0, 1] }

-- Period 8, original row 4793, representative 5802.
def source123 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B019.Data.entryAt ⟨52, by decide +kernel⟩

def target123 : Weights.Entry :=
  { word := [8, 2, 2, 2, 8, 9, 8], weights := [1, 0, 0, 1] }

-- Period 8, original row 4795, representative 5794.
def source124 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B019.Data.entryAt ⟨44, by decide +kernel⟩

def target124 : Weights.Entry :=
  { word := [8, 2, 2, 2, 8, 10, 8], weights := [1, 0, 0, 1] }

-- Period 8, original row 4797, representative 5807.
def source125 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B019.Data.entryAt ⟨57, by decide +kernel⟩

def target125 : Weights.Entry :=
  { word := [8, 2, 2, 10, 0, 1, 8], weights := [1, 0, 0, 1] }

def points125 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 4799, representative 5799.
def source126 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B019.Data.entryAt ⟨49, by decide +kernel⟩

def target126 : Weights.Entry :=
  { word := [8, 2, 2, 10, 0, 2, 8], weights := [1, 0, 0, 1] }

-- Period 8, original row 4804, representative 5811.
def source127 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B019.Data.entryAt ⟨61, by decide +kernel⟩

def target127 : Weights.Entry :=
  { word := [8, 2, 2, 10, 0, 8, 8], weights := [1, 0, 0, 1] }

def period8Entries : List Weights.Entry := [target0, target1, target2, target3, target4, target5, target6, target7, target8, target9, target10, target11, target12, target13, target14, target15, target16, target17, target18, target19, target20, target21, target22, target23, target24, target25, target26, target27, target28, target29, target30, target31, target32, target33, target34, target35, target36, target37, target38, target39, target40, target41, target42, target43, target44, target45, target46, target47, target48, target49, target50, target51, target52, target53, target54, target55, target56, target57, target58, target59, target60, target61, target62, target63, target64, target65, target66, target67, target68, target69, target70, target71, target72, target73, target74, target75, target76, target77, target78, target79, target80, target81, target82, target83, target84, target85, target86, target87, target88, target89, target90, target91, target92, target93, target94, target95, target96, target97, target98, target99, target100, target101, target102, target103, target104, target105, target106, target107, target108, target109, target110, target111, target112, target113, target114, target115, target116, target117, target118, target119, target120, target121, target122, target123, target124, target125, target126, target127]

def period8Chunk : RowCoverage.Chunk where
  rows := [⟨138, target0⟩, ⟨267, target1⟩, ⟨297, target2⟩, ⟨345, target3⟩, ⟨394, target4⟩, ⟨443, target5⟩, ⟨468, target6⟩, ⟨489, target7⟩, ⟨589, target8⟩, ⟨709, target9⟩, ⟨740, target10⟩, ⟨754, target11⟩, ⟨766, target12⟩, ⟨770, target13⟩, ⟨781, target14⟩, ⟨1146, target15⟩, ⟨1204, target16⟩, ⟨1229, target17⟩, ⟨1338, target18⟩, ⟨1346, target19⟩, ⟨1368, target20⟩, ⟨1388, target21⟩, ⟨1420, target22⟩, ⟨1463, target23⟩, ⟨1488, target24⟩, ⟨1588, target25⟩, ⟨1708, target26⟩, ⟨1878, target27⟩, ⟨1993, target28⟩, ⟨2237, target29⟩, ⟨2352, target30⟩, ⟨2800, target31⟩, ⟨2804, target32⟩, ⟨2820, target33⟩, ⟨2822, target34⟩, ⟨2846, target35⟩, ⟨2848, target36⟩, ⟨2871, target37⟩, ⟨2873, target38⟩, ⟨2897, target39⟩, ⟨2900, target40⟩, ⟨2917, target41⟩, ⟨2925, target42⟩, ⟨2927, target43⟩, ⟨2929, target44⟩, ⟨2931, target45⟩, ⟨2949, target46⟩, ⟨2951, target47⟩, ⟨2952, target48⟩, ⟨2954, target49⟩, ⟨2964, target50⟩, ⟨2968, target51⟩, ⟨2986, target52⟩, ⟨2988, target53⟩, ⟨3030, target54⟩, ⟨3032, target55⟩, ⟨3059, target56⟩, ⟨3061, target57⟩, ⟨3105, target58⟩, ⟨3108, target59⟩, ⟨3125, target60⟩, ⟨3131, target61⟩, ⟨3133, target62⟩, ⟨3135, target63⟩, ⟨3137, target64⟩, ⟨3139, target65⟩, ⟨3150, target66⟩, ⟨3156, target67⟩, ⟨3159, target68⟩, ⟨3161, target69⟩, ⟨3162, target70⟩, ⟨3164, target71⟩, ⟨4117, target72⟩, ⟨4136, target73⟩, ⟨4139, target74⟩, ⟨4158, target75⟩, ⟨4172, target76⟩, ⟨4175, target77⟩, ⟨4194, target78⟩, ⟨4205, target79⟩, ⟨4220, target80⟩, ⟨4234, target81⟩, ⟨4248, target82⟩, ⟨4289, target83⟩, ⟨4318, target84⟩, ⟨4326, target85⟩, ⟨4333, target86⟩, ⟨4340, target87⟩, ⟨4356, target88⟩, ⟨4377, target89⟩, ⟨4381, target90⟩, ⟨4385, target91⟩, ⟨4389, target92⟩, ⟨4393, target93⟩, ⟨4399, target94⟩, ⟨4407, target95⟩, ⟨4414, target96⟩, ⟨4421, target97⟩, ⟨4463, target98⟩, ⟨4667, target99⟩, ⟨4681, target100⟩, ⟨4682, target101⟩, ⟨4684, target102⟩, ⟨4686, target103⟩, ⟨4700, target104⟩, ⟨4703, target105⟩, ⟨4722, target106⟩, ⟨4725, target107⟩, ⟨4730, target108⟩, ⟨4732, target109⟩, ⟨4745, target110⟩, ⟨4749, target111⟩, ⟨4752, target112⟩, ⟨4756, target113⟩, ⟨4758, target114⟩, ⟨4760, target115⟩, ⟨4765, target116⟩, ⟨4770, target117⟩, ⟨4772, target118⟩, ⟨4776, target119⟩, ⟨4781, target120⟩, ⟨4783, target121⟩, ⟨4788, target122⟩, ⟨4793, target123⟩, ⟨4795, target124⟩, ⟨4797, target125⟩, ⟨4799, target126⟩, ⟨4804, target127⟩]
  indexMask := 1464760722330397190562846260485162994798716177012584143620195067596183934661566585261107249594666617479591912730642494046391126124637753027073450414517616698488087167067746382157642374624335241839533662191090898952674173076574751284164956443531462795604441282453870918151789531406133849926418705355067726736999786000757099690751502946903864058498716283924608568384136544610529309589941895640872542923637373021094658259115107290734271927953916765312426404446292787504262804979855605016651329814276128124375419101278714745804258806098871604768553916875015556350108149702804118517355993561583059097856401443967333169364361330281196325344644294604427430692227112012542474036498656444169103061062361115269808272429417852663518193006022260663537190910142417787106210541482881423689795282268247298666956695992846607149987004984106388337217120511917972093456230864367692222625793626192649986751957023040657945895538824443190376571473037191451975017269355706661988738347318645245984606934305271662535825955958172735062176869134786209608107369545817063110065556419532199715805955236942769549496036195127390813296883881473420564924033699997296190377668410763635367056176354227183224589324995037668850232247085443556833126756029326638106381926435324229691965943370422948612837686657766901400747219190428572101331206432084962698770770262681544435908561271119834047638745766223315961274191827074424622665732436097109765949511804402276392294641012321896282193920
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

end FranklSmallCyclic.TransportBatches.G045.B000.Data
