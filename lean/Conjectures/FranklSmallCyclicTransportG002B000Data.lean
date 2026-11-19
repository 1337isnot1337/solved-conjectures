module

public import Conjectures.FranklSmallCyclicRowCoverage
public import Conjectures.FranklSmallCyclicCanonicalWords
public import Conjectures.FranklSmallCyclicOrbit7Block002Data

/-! 128 literal targets sharing one source proof block.
Original words and row indices are retained; weights may be transported.
-/
@[expose] public section

namespace FranklSmallCyclic.TransportBatches.G002.B000.Data

-- Period 7, original row 127, representative 345.
def source0 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B002.Data.entryAt ⟨78, by decide +kernel⟩

def target0 : Weights.Entry :=
  { word := [0, 1, 0, 9, 4, 4, 12], weights := [1, 0, 1, 1] }

-- Period 7, original row 131, representative 343.
def source1 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B002.Data.entryAt ⟨76, by decide +kernel⟩

def target1 : Weights.Entry :=
  { word := [0, 1, 0, 9, 12, 4, 12], weights := [1, 0, 1, 1] }

-- Period 7, original row 140, representative 302.
def source2 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B002.Data.entryAt ⟨35, by decide +kernel⟩

def target2 : Weights.Entry :=
  { word := [0, 1, 0, 12, 0, 4, 12], weights := [1, 0, 1, 0] }

-- Period 7, original row 193, representative 363.
def source3 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B002.Data.entryAt ⟨96, by decide +kernel⟩

def target3 : Weights.Entry :=
  { word := [0, 1, 4, 10, 8, 4, 12], weights := [1, 0, 1, 1] }

-- Period 7, original row 218, representative 344.
def source4 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B002.Data.entryAt ⟨77, by decide +kernel⟩

def target4 : Weights.Entry :=
  { word := [0, 1, 8, 9, 4, 4, 12], weights := [1, 0, 1, 1] }

-- Period 7, original row 222, representative 342.
def source5 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B002.Data.entryAt ⟨75, by decide +kernel⟩

def target5 : Weights.Entry :=
  { word := [0, 1, 8, 9, 12, 4, 12], weights := [1, 0, 1, 1] }

-- Period 7, original row 269, representative 364.
def source6 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B002.Data.entryAt ⟨97, by decide +kernel⟩

def target6 : Weights.Entry :=
  { word := [0, 1, 12, 10, 0, 4, 12], weights := [1, 0, 1, 1] }

-- Period 7, original row 286, representative 362.
def source7 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B002.Data.entryAt ⟨95, by decide +kernel⟩

def target7 : Weights.Entry :=
  { word := [0, 1, 12, 10, 8, 4, 12], weights := [1, 0, 1, 1] }

-- Period 7, original row 299, representative 302.
def source8 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B002.Data.entryAt ⟨35, by decide +kernel⟩

def target8 : Weights.Entry :=
  { word := [0, 2, 0, 8, 1, 4, 12], weights := [0, 1, 1, 0] }

def points8 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6)]

-- Period 7, original row 307, representative 326.
def source9 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B002.Data.entryAt ⟨59, by decide +kernel⟩

def target9 : Weights.Entry :=
  { word := [0, 2, 0, 8, 8, 4, 12], weights := [0, 1, 0, 1] }

-- Period 7, original row 311, representative 276.
def source10 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B002.Data.entryAt ⟨9, by decide +kernel⟩

def target10 : Weights.Entry :=
  { word := [0, 2, 0, 8, 9, 4, 12], weights := [0, 1, 1, 0] }

-- Period 7, original row 347, representative 322.
def source11 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B002.Data.entryAt ⟨55, by decide +kernel⟩

def target11 : Weights.Entry :=
  { word := [0, 2, 2, 2, 8, 4, 12], weights := [0, 1, 0, 1] }

-- Period 7, original row 396, representative 325.
def source12 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B002.Data.entryAt ⟨58, by decide +kernel⟩

def target12 : Weights.Entry :=
  { word := [0, 2, 2, 10, 8, 4, 12], weights := [0, 1, 0, 1] }

-- Period 7, original row 445, representative 323.
def source13 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B002.Data.entryAt ⟨56, by decide +kernel⟩

def target13 : Weights.Entry :=
  { word := [0, 2, 10, 2, 8, 4, 12], weights := [0, 1, 0, 1] }

-- Period 7, original row 470, representative 364.
def source14 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B002.Data.entryAt ⟨97, by decide +kernel⟩

def target14 : Weights.Entry :=
  { word := [0, 2, 10, 10, 0, 4, 12], weights := [0, 1, 1, 1] }

def points14 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6)]

-- Period 7, original row 491, representative 324.
def source15 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B002.Data.entryAt ⟨57, by decide +kernel⟩

def target15 : Weights.Entry :=
  { word := [0, 2, 10, 10, 8, 4, 12], weights := [0, 1, 0, 1] }

-- Period 7, original row 742, representative 315.
def source16 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B002.Data.entryAt ⟨48, by decide +kernel⟩

def target16 : Weights.Entry :=
  { word := [0, 6, 0, 12, 8, 4, 12], weights := [0, 1, 0, 1] }

-- Period 7, original row 772, representative 314.
def source17 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B002.Data.entryAt ⟨47, by decide +kernel⟩

def target17 : Weights.Entry :=
  { word := [0, 6, 8, 12, 8, 4, 12], weights := [0, 1, 0, 1] }

-- Period 7, original row 1172, representative 294.
def source18 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B002.Data.entryAt ⟨27, by decide +kernel⟩

def target18 : Weights.Entry :=
  { word := [0, 9, 0, 4, 8, 4, 12], weights := [1, 0, 0, 1] }

-- Period 7, original row 1191, representative 338.
def source19 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B002.Data.entryAt ⟨71, by decide +kernel⟩

def target19 : Weights.Entry :=
  { word := [0, 9, 0, 9, 4, 4, 12], weights := [1, 1, 1, 1] }

-- Period 7, original row 1195, representative 336.
def source20 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B002.Data.entryAt ⟨69, by decide +kernel⟩

def target20 : Weights.Entry :=
  { word := [0, 9, 0, 9, 12, 4, 12], weights := [1, 1, 1, 1] }

-- Period 7, original row 1206, representative 296.
def source21 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B002.Data.entryAt ⟨29, by decide +kernel⟩

def target21 : Weights.Entry :=
  { word := [0, 9, 0, 12, 0, 4, 12], weights := [1, 0, 1, 0] }

-- Period 7, original row 1231, representative 295.
def source22 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B002.Data.entryAt ⟨28, by decide +kernel⟩

def target22 : Weights.Entry :=
  { word := [0, 9, 0, 12, 8, 4, 12], weights := [1, 0, 1, 0] }

-- Period 7, original row 1302, representative 337.
def source23 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B002.Data.entryAt ⟨70, by decide +kernel⟩

def target23 : Weights.Entry :=
  { word := [0, 9, 8, 9, 4, 4, 12], weights := [1, 1, 1, 1] }

-- Period 7, original row 1306, representative 335.
def source24 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B002.Data.entryAt ⟨68, by decide +kernel⟩

def target24 : Weights.Entry :=
  { word := [0, 9, 8, 9, 12, 4, 12], weights := [1, 1, 1, 1] }

-- Period 7, original row 1348, representative 296.
def source25 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B002.Data.entryAt ⟨29, by decide +kernel⟩

def target25 : Weights.Entry :=
  { word := [0, 10, 0, 8, 1, 4, 12], weights := [0, 1, 1, 0] }

def points25 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6)]

-- Period 7, original row 1356, representative 321.
def source26 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B002.Data.entryAt ⟨54, by decide +kernel⟩

def target26 : Weights.Entry :=
  { word := [0, 10, 0, 8, 8, 4, 12], weights := [0, 1, 0, 1] }

-- Period 7, original row 1360, representative 275.
def source27 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B002.Data.entryAt ⟨8, by decide +kernel⟩

def target27 : Weights.Entry :=
  { word := [0, 10, 0, 8, 9, 4, 12], weights := [0, 1, 1, 0] }

-- Period 7, original row 1370, representative 320.
def source28 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B002.Data.entryAt ⟨53, by decide +kernel⟩

def target28 : Weights.Entry :=
  { word := [0, 10, 0, 12, 8, 4, 12], weights := [0, 1, 0, 1] }

-- Period 7, original row 1390, representative 316.
def source29 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B002.Data.entryAt ⟨49, by decide +kernel⟩

def target29 : Weights.Entry :=
  { word := [0, 10, 2, 2, 8, 4, 12], weights := [0, 1, 0, 1] }

-- Period 7, original row 1422, representative 319.
def source30 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B002.Data.entryAt ⟨52, by decide +kernel⟩

def target30 : Weights.Entry :=
  { word := [0, 10, 2, 10, 8, 4, 12], weights := [0, 1, 0, 1] }

-- Period 7, original row 1465, representative 317.
def source31 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B002.Data.entryAt ⟨50, by decide +kernel⟩

def target31 : Weights.Entry :=
  { word := [0, 10, 10, 2, 8, 4, 12], weights := [0, 1, 0, 1] }

-- Period 7, original row 1490, representative 318.
def source32 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B002.Data.entryAt ⟨51, by decide +kernel⟩

def target32 : Weights.Entry :=
  { word := [0, 10, 10, 10, 8, 4, 12], weights := [0, 1, 0, 1] }

-- Period 7, original row 2588, representative 340.
def source33 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B002.Data.entryAt ⟨73, by decide +kernel⟩

def target33 : Weights.Entry :=
  { word := [2, 2, 0, 9, 8, 1, 12], weights := [1, 1, 0, 1] }

-- Period 7, original row 2593, representative 348.
def source34 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B002.Data.entryAt ⟨81, by decide +kernel⟩

def target34 : Weights.Entry :=
  { word := [2, 2, 0, 9, 8, 8, 12], weights := [1, 1, 0, 1] }

-- Period 7, original row 2595, representative 332.
def source35 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B002.Data.entryAt ⟨65, by decide +kernel⟩

def target35 : Weights.Entry :=
  { word := [2, 2, 0, 9, 8, 9, 12], weights := [1, 1, 0, 1] }

-- Period 7, original row 2602, representative 302.
def source36 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B002.Data.entryAt ⟨35, by decide +kernel⟩

def target36 : Weights.Entry :=
  { word := [2, 2, 0, 10, 0, 0, 9], weights := [1, 1, 0, 0] }

def points36 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 3), (4, 5), (5, 4), (6, 6)]

-- Period 7, original row 2604, representative 302.
def source37 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B002.Data.entryAt ⟨35, by decide +kernel⟩

def target37 : Weights.Entry :=
  { word := [2, 2, 0, 10, 0, 0, 12], weights := [1, 1, 0, 0] }

def points37 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 4), (4, 5), (5, 3), (6, 6)]

-- Period 7, original row 2609, representative 281.
def source38 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B002.Data.entryAt ⟨14, by decide +kernel⟩

def target38 : Weights.Entry :=
  { word := [2, 2, 0, 10, 0, 8, 9], weights := [1, 0, 0, 1] }

-- Period 7, original row 2610, representative 287.
def source39 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B002.Data.entryAt ⟨20, by decide +kernel⟩

def target39 : Weights.Entry :=
  { word := [2, 2, 0, 10, 0, 8, 12], weights := [1, 0, 0, 1] }

-- Period 7, original row 2612, representative 301.
def source40 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B002.Data.entryAt ⟨34, by decide +kernel⟩

def target40 : Weights.Entry :=
  { word := [2, 2, 0, 10, 8, 0, 12], weights := [1, 1, 0, 0] }

-- Period 7, original row 2614, representative 284.
def source41 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B002.Data.entryAt ⟨17, by decide +kernel⟩

def target41 : Weights.Entry :=
  { word := [2, 2, 0, 10, 8, 8, 12], weights := [1, 0, 0, 1] }

-- Period 7, original row 2619, representative 361.
def source42 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B002.Data.entryAt ⟨94, by decide +kernel⟩

def target42 : Weights.Entry :=
  { word := [2, 2, 0, 12, 10, 0, 9], weights := [1, 1, 0, 1] }

-- Period 7, original row 2621, representative 352.
def source43 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B002.Data.entryAt ⟨85, by decide +kernel⟩

def target43 : Weights.Entry :=
  { word := [2, 2, 0, 12, 10, 0, 12], weights := [1, 1, 0, 1] }

-- Period 7, original row 2630, representative 357.
def source44 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B002.Data.entryAt ⟨90, by decide +kernel⟩

def target44 : Weights.Entry :=
  { word := [2, 2, 2, 8, 1, 0, 9], weights := [1, 1, 0, 1] }

-- Period 7, original row 2632, representative 366.
def source45 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B002.Data.entryAt ⟨99, by decide +kernel⟩

def target45 : Weights.Entry :=
  { word := [2, 2, 2, 8, 1, 0, 12], weights := [1, 1, 0, 1] }

-- Period 7, original row 2635, representative 330.
def source46 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B002.Data.entryAt ⟨63, by decide +kernel⟩

def target46 : Weights.Entry :=
  { word := [2, 2, 2, 8, 1, 8, 9], weights := [1, 1, 1, 1] }

-- Period 7, original row 2644, representative 354.
def source47 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B002.Data.entryAt ⟨87, by decide +kernel⟩

def target47 : Weights.Entry :=
  { word := [2, 2, 2, 8, 9, 0, 9], weights := [1, 1, 0, 1] }

-- Period 7, original row 2646, representative 359.
def source48 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B002.Data.entryAt ⟨92, by decide +kernel⟩

def target48 : Weights.Entry :=
  { word := [2, 2, 2, 8, 9, 0, 12], weights := [1, 1, 0, 1] }

-- Period 7, original row 2649, representative 328.
def source49 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B002.Data.entryAt ⟨61, by decide +kernel⟩

def target49 : Weights.Entry :=
  { word := [2, 2, 2, 8, 9, 8, 9], weights := [1, 1, 1, 1] }

-- Period 7, original row 2663, representative 279.
def source50 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B002.Data.entryAt ⟨12, by decide +kernel⟩

def target50 : Weights.Entry :=
  { word := [2, 2, 8, 2, 0, 8, 9], weights := [1, 0, 0, 1] }

-- Period 7, original row 2665, representative 285.
def source51 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B002.Data.entryAt ⟨18, by decide +kernel⟩

def target51 : Weights.Entry :=
  { word := [2, 2, 8, 2, 0, 8, 12], weights := [1, 0, 0, 1] }

-- Period 7, original row 2671, representative 299.
def source52 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B002.Data.entryAt ⟨32, by decide +kernel⟩

def target52 : Weights.Entry :=
  { word := [2, 2, 8, 2, 8, 0, 12], weights := [1, 0, 0, 1] }

-- Period 7, original row 2675, representative 282.
def source53 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B002.Data.entryAt ⟨15, by decide +kernel⟩

def target53 : Weights.Entry :=
  { word := [2, 2, 8, 2, 8, 8, 12], weights := [1, 0, 0, 1] }

-- Period 7, original row 2693, representative 339.
def source54 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B002.Data.entryAt ⟨72, by decide +kernel⟩

def target54 : Weights.Entry :=
  { word := [2, 2, 8, 9, 8, 1, 12], weights := [1, 1, 0, 1] }

-- Period 7, original row 2698, representative 347.
def source55 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B002.Data.entryAt ⟨80, by decide +kernel⟩

def target55 : Weights.Entry :=
  { word := [2, 2, 8, 9, 8, 8, 12], weights := [1, 1, 0, 1] }

-- Period 7, original row 2700, representative 331.
def source56 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B002.Data.entryAt ⟨64, by decide +kernel⟩

def target56 : Weights.Entry :=
  { word := [2, 2, 8, 9, 8, 9, 12], weights := [1, 1, 0, 1] }

-- Period 7, original row 2713, representative 280.
def source57 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B002.Data.entryAt ⟨13, by decide +kernel⟩

def target57 : Weights.Entry :=
  { word := [2, 2, 8, 10, 0, 8, 9], weights := [1, 0, 0, 1] }

-- Period 7, original row 2715, representative 286.
def source58 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B002.Data.entryAt ⟨19, by decide +kernel⟩

def target58 : Weights.Entry :=
  { word := [2, 2, 8, 10, 0, 8, 12], weights := [1, 0, 0, 1] }

-- Period 7, original row 2722, representative 300.
def source59 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B002.Data.entryAt ⟨33, by decide +kernel⟩

def target59 : Weights.Entry :=
  { word := [2, 2, 8, 10, 8, 0, 12], weights := [1, 1, 0, 0] }

-- Period 7, original row 2728, representative 283.
def source60 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B002.Data.entryAt ⟨16, by decide +kernel⟩

def target60 : Weights.Entry :=
  { word := [2, 2, 8, 10, 8, 8, 12], weights := [1, 0, 0, 1] }

-- Period 7, original row 2737, representative 365.
def source61 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B002.Data.entryAt ⟨98, by decide +kernel⟩

def target61 : Weights.Entry :=
  { word := [2, 2, 8, 12, 2, 0, 9], weights := [1, 1, 1, 0] }

-- Period 7, original row 2739, representative 355.
def source62 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B002.Data.entryAt ⟨88, by decide +kernel⟩

def target62 : Weights.Entry :=
  { word := [2, 2, 8, 12, 2, 0, 12], weights := [1, 1, 0, 1] }

-- Period 7, original row 2753, representative 360.
def source63 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B002.Data.entryAt ⟨93, by decide +kernel⟩

def target63 : Weights.Entry :=
  { word := [2, 2, 8, 12, 10, 0, 9], weights := [1, 1, 1, 0] }

-- Period 7, original row 2755, representative 351.
def source64 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B002.Data.entryAt ⟨84, by decide +kernel⟩

def target64 : Weights.Entry :=
  { word := [2, 2, 8, 12, 10, 0, 12], weights := [1, 1, 0, 1] }

-- Period 7, original row 2760, representative 346.
def source65 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B002.Data.entryAt ⟨79, by decide +kernel⟩

def target65 : Weights.Entry :=
  { word := [2, 2, 8, 12, 10, 8, 12], weights := [2, 1, 1, 2] }

-- Period 7, original row 2772, representative 356.
def source66 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B002.Data.entryAt ⟨89, by decide +kernel⟩

def target66 : Weights.Entry :=
  { word := [2, 2, 10, 8, 1, 0, 9], weights := [1, 1, 0, 1] }

-- Period 7, original row 2774, representative 364.
def source67 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B002.Data.entryAt ⟨97, by decide +kernel⟩

def target67 : Weights.Entry :=
  { word := [2, 2, 10, 8, 1, 0, 12], weights := [1, 1, 0, 1] }

def points67 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 4), (4, 5), (5, 3), (6, 6)]

-- Period 7, original row 2777, representative 329.
def source68 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B002.Data.entryAt ⟨62, by decide +kernel⟩

def target68 : Weights.Entry :=
  { word := [2, 2, 10, 8, 1, 8, 9], weights := [1, 1, 1, 1] }

-- Period 7, original row 2786, representative 353.
def source69 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B002.Data.entryAt ⟨86, by decide +kernel⟩

def target69 : Weights.Entry :=
  { word := [2, 2, 10, 8, 9, 0, 9], weights := [1, 1, 0, 1] }

-- Period 7, original row 2788, representative 358.
def source70 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B002.Data.entryAt ⟨91, by decide +kernel⟩

def target70 : Weights.Entry :=
  { word := [2, 2, 10, 8, 9, 0, 12], weights := [1, 1, 0, 1] }

-- Period 7, original row 2791, representative 327.
def source71 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B002.Data.entryAt ⟨60, by decide +kernel⟩

def target71 : Weights.Entry :=
  { word := [2, 2, 10, 8, 9, 8, 9], weights := [1, 1, 1, 1] }

-- Period 7, original row 3208, representative 272.
def source72 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B002.Data.entryAt ⟨5, by decide +kernel⟩

def target72 : Weights.Entry :=
  { word := [2, 10, 0, 12, 2, 0, 9], weights := [1, 1, 1, 0] }

-- Period 7, original row 3216, representative 270.
def source73 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B002.Data.entryAt ⟨3, by decide +kernel⟩

def target73 : Weights.Entry :=
  { word := [2, 10, 0, 12, 10, 0, 9], weights := [1, 1, 1, 0] }

-- Period 7, original row 3224, representative 268.
def source74 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B002.Data.entryAt ⟨1, by decide +kernel⟩

def target74 : Weights.Entry :=
  { word := [2, 10, 2, 8, 1, 0, 9], weights := [1, 1, 0, 1] }

-- Period 7, original row 3332, representative 271.
def source75 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B002.Data.entryAt ⟨4, by decide +kernel⟩

def target75 : Weights.Entry :=
  { word := [2, 10, 8, 12, 2, 0, 9], weights := [1, 1, 1, 0] }

-- Period 7, original row 3354, representative 269.
def source76 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B002.Data.entryAt ⟨2, by decide +kernel⟩

def target76 : Weights.Entry :=
  { word := [2, 10, 8, 12, 10, 0, 9], weights := [1, 1, 1, 0] }

-- Period 7, original row 3370, representative 267.
def source77 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B002.Data.entryAt ⟨0, by decide +kernel⟩

def target77 : Weights.Entry :=
  { word := [2, 10, 10, 8, 1, 0, 9], weights := [1, 1, 0, 1] }

-- Period 7, original row 3410, representative 302.
def source78 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B002.Data.entryAt ⟨35, by decide +kernel⟩

def target78 : Weights.Entry :=
  { word := [4, 0, 0, 12, 0, 4, 10], weights := [1, 0, 1, 0] }

def points78 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 3539, representative 364.
def source79 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B002.Data.entryAt ⟨97, by decide +kernel⟩

def target79 : Weights.Entry :=
  { word := [4, 0, 12, 10, 0, 4, 10], weights := [1, 0, 1, 1] }

def points79 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 3574, representative 340.
def source80 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B002.Data.entryAt ⟨73, by decide +kernel⟩

def target80 : Weights.Entry :=
  { word := [4, 2, 0, 9, 8, 1, 12], weights := [1, 1, 0, 1] }

def points80 : List (ℕ × ℕ) := [(0, 0), (1, 2), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 3576, representative 341.
def source81 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B002.Data.entryAt ⟨74, by decide +kernel⟩

def target81 : Weights.Entry :=
  { word := [4, 2, 0, 9, 8, 2, 10], weights := [1, 1, 0, 1] }

-- Period 7, original row 3579, representative 349.
def source82 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B002.Data.entryAt ⟨82, by decide +kernel⟩

def target82 : Weights.Entry :=
  { word := [4, 2, 0, 9, 8, 8, 12], weights := [1, 1, 0, 1] }

-- Period 7, original row 3581, representative 333.
def source83 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B002.Data.entryAt ⟨66, by decide +kernel⟩

def target83 : Weights.Entry :=
  { word := [4, 2, 0, 9, 8, 9, 12], weights := [1, 1, 0, 1] }

-- Period 7, original row 3583, representative 334.
def source84 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B002.Data.entryAt ⟨67, by decide +kernel⟩

def target84 : Weights.Entry :=
  { word := [4, 2, 0, 9, 8, 10, 10], weights := [1, 1, 0, 1] }

-- Period 7, original row 3589, representative 302.
def source85 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B002.Data.entryAt ⟨35, by decide +kernel⟩

def target85 : Weights.Entry :=
  { word := [4, 2, 0, 10, 0, 0, 10], weights := [1, 1, 0, 0] }

def points85 : List (ℕ × ℕ) := [(0, 1), (1, 2), (2, 0), (3, 3), (4, 5), (5, 4), (6, 6)]

-- Period 7, original row 3590, representative 302.
def source86 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B002.Data.entryAt ⟨35, by decide +kernel⟩

def target86 : Weights.Entry :=
  { word := [4, 2, 0, 10, 0, 0, 12], weights := [1, 1, 0, 0] }

def points86 : List (ℕ × ℕ) := [(0, 0), (1, 2), (2, 1), (3, 4), (4, 5), (5, 3), (6, 6)]

-- Period 7, original row 3596, representative 293.
def source87 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B002.Data.entryAt ⟨26, by decide +kernel⟩

def target87 : Weights.Entry :=
  { word := [4, 2, 0, 10, 0, 8, 12], weights := [1, 0, 0, 1] }

-- Period 7, original row 3598, representative 301.
def source88 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B002.Data.entryAt ⟨34, by decide +kernel⟩

def target88 : Weights.Entry :=
  { word := [4, 2, 0, 10, 8, 0, 12], weights := [1, 1, 0, 0] }

def points88 : List (ℕ × ℕ) := [(0, 0), (1, 2), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 3600, representative 290.
def source89 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B002.Data.entryAt ⟨23, by decide +kernel⟩

def target89 : Weights.Entry :=
  { word := [4, 2, 0, 10, 8, 8, 12], weights := [1, 0, 0, 1] }

-- Period 7, original row 3606, representative 361.
def source90 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B002.Data.entryAt ⟨94, by decide +kernel⟩

def target90 : Weights.Entry :=
  { word := [4, 2, 0, 12, 10, 0, 10], weights := [1, 1, 0, 1] }

def points90 : List (ℕ × ℕ) := [(0, 0), (1, 2), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 3607, representative 352.
def source91 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B002.Data.entryAt ⟨85, by decide +kernel⟩

def target91 : Weights.Entry :=
  { word := [4, 2, 0, 12, 10, 0, 12], weights := [1, 1, 0, 1] }

def points91 : List (ℕ × ℕ) := [(0, 0), (1, 2), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 3619, representative 291.
def source92 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B002.Data.entryAt ⟨24, by decide +kernel⟩

def target92 : Weights.Entry :=
  { word := [4, 2, 8, 2, 0, 8, 10], weights := [1, 0, 0, 1] }

-- Period 7, original row 3620, representative 291.
def source93 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B002.Data.entryAt ⟨24, by decide +kernel⟩

def target93 : Weights.Entry :=
  { word := [4, 2, 8, 2, 0, 8, 12], weights := [0, 1, 0, 1] }

def points93 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6)]

-- Period 7, original row 3628, representative 288.
def source94 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B002.Data.entryAt ⟨21, by decide +kernel⟩

def target94 : Weights.Entry :=
  { word := [4, 2, 8, 2, 8, 8, 12], weights := [1, 0, 0, 1] }

-- Period 7, original row 3652, representative 292.
def source95 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B002.Data.entryAt ⟨25, by decide +kernel⟩

def target95 : Weights.Entry :=
  { word := [4, 2, 8, 10, 0, 8, 10], weights := [1, 0, 0, 1] }

-- Period 7, original row 3653, representative 292.
def source96 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B002.Data.entryAt ⟨25, by decide +kernel⟩

def target96 : Weights.Entry :=
  { word := [4, 2, 8, 10, 0, 8, 12], weights := [0, 1, 0, 1] }

def points96 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6)]

-- Period 7, original row 3664, representative 289.
def source97 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B002.Data.entryAt ⟨22, by decide +kernel⟩

def target97 : Weights.Entry :=
  { word := [4, 2, 8, 10, 8, 8, 12], weights := [1, 0, 0, 1] }

-- Period 7, original row 3686, representative 355.
def source98 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B002.Data.entryAt ⟨88, by decide +kernel⟩

def target98 : Weights.Entry :=
  { word := [4, 4, 8, 8, 1, 4, 10], weights := [1, 0, 1, 1] }

def points98 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 2), (3, 5), (4, 3), (5, 4), (6, 6)]

-- Period 7, original row 3744, representative 297.
def source99 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B002.Data.entryAt ⟨30, by decide +kernel⟩

def target99 : Weights.Entry :=
  { word := [4, 8, 0, 4, 8, 4, 10], weights := [1, 0, 1, 0] }

-- Period 7, original row 3787, representative 298.
def source100 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B002.Data.entryAt ⟨31, by decide +kernel⟩

def target100 : Weights.Entry :=
  { word := [4, 8, 0, 12, 8, 4, 10], weights := [1, 0, 1, 0] }

-- Period 7, original row 3997, representative 272.
def source101 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B002.Data.entryAt ⟨5, by decide +kernel⟩

def target101 : Weights.Entry :=
  { word := [4, 10, 0, 12, 2, 0, 10], weights := [1, 1, 1, 0] }

def points101 : List (ℕ × ℕ) := [(0, 0), (1, 2), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 4005, representative 270.
def source102 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B002.Data.entryAt ⟨3, by decide +kernel⟩

def target102 : Weights.Entry :=
  { word := [4, 10, 0, 12, 10, 0, 10], weights := [1, 1, 1, 0] }

def points102 : List (ℕ × ℕ) := [(0, 0), (1, 2), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 4051, representative 350.
def source103 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B002.Data.entryAt ⟨83, by decide +kernel⟩

def target103 : Weights.Entry :=
  { word := [4, 12, 8, 8, 1, 4, 10], weights := [1, 0, 1, 1] }

-- Period 7, original row 4497, representative 357.
def source104 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B002.Data.entryAt ⟨90, by decide +kernel⟩

def target104 : Weights.Entry :=
  { word := [8, 1, 0, 9, 4, 4, 4], weights := [1, 0, 1, 1] }

def points104 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 4499, representative 268.
def source105 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B002.Data.entryAt ⟨1, by decide +kernel⟩

def target105 : Weights.Entry :=
  { word := [8, 1, 0, 9, 4, 12, 4], weights := [1, 0, 1, 1] }

def points105 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 4501, representative 356.
def source106 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B002.Data.entryAt ⟨89, by decide +kernel⟩

def target106 : Weights.Entry :=
  { word := [8, 1, 0, 9, 12, 4, 4], weights := [1, 0, 1, 1] }

def points106 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 4503, representative 267.
def source107 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B002.Data.entryAt ⟨0, by decide +kernel⟩

def target107 : Weights.Entry :=
  { word := [8, 1, 0, 9, 12, 12, 4], weights := [1, 0, 1, 1] }

def points107 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 4508, representative 302.
def source108 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B002.Data.entryAt ⟨35, by decide +kernel⟩

def target108 : Weights.Entry :=
  { word := [8, 1, 0, 12, 0, 4, 4], weights := [0, 0, 1, 1] }

def points108 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 6), (4, 4), (5, 5), (6, 3)]

-- Period 7, original row 4558, representative 272.
def source109 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B002.Data.entryAt ⟨5, by decide +kernel⟩

def target109 : Weights.Entry :=
  { word := [8, 1, 4, 10, 0, 12, 4], weights := [0, 1, 1, 1] }

def points109 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 4563, representative 365.
def source110 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B002.Data.entryAt ⟨98, by decide +kernel⟩

def target110 : Weights.Entry :=
  { word := [8, 1, 4, 10, 8, 4, 4], weights := [0, 1, 1, 1] }

def points110 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 4568, representative 271.
def source111 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B002.Data.entryAt ⟨4, by decide +kernel⟩

def target111 : Weights.Entry :=
  { word := [8, 1, 4, 10, 8, 12, 4], weights := [0, 1, 1, 1] }

def points111 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 4588, representative 354.
def source112 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B002.Data.entryAt ⟨87, by decide +kernel⟩

def target112 : Weights.Entry :=
  { word := [8, 1, 8, 9, 4, 4, 4], weights := [1, 0, 1, 1] }

def points112 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 4592, representative 353.
def source113 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B002.Data.entryAt ⟨86, by decide +kernel⟩

def target113 : Weights.Entry :=
  { word := [8, 1, 8, 9, 12, 4, 4], weights := [1, 0, 1, 1] }

def points113 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 4637, representative 361.
def source114 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B002.Data.entryAt ⟨94, by decide +kernel⟩

def target114 : Weights.Entry :=
  { word := [8, 1, 12, 10, 0, 4, 4], weights := [1, 0, 1, 1] }

def points114 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 4651, representative 270.
def source115 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B002.Data.entryAt ⟨3, by decide +kernel⟩

def target115 : Weights.Entry :=
  { word := [8, 1, 12, 10, 0, 12, 4], weights := [0, 1, 1, 1] }

def points115 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 4656, representative 360.
def source116 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B002.Data.entryAt ⟨93, by decide +kernel⟩

def target116 : Weights.Entry :=
  { word := [8, 1, 12, 10, 8, 4, 4], weights := [0, 1, 1, 1] }

def points116 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 4661, representative 269.
def source117 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B002.Data.entryAt ⟨2, by decide +kernel⟩

def target117 : Weights.Entry :=
  { word := [8, 1, 12, 10, 8, 12, 4], weights := [0, 1, 1, 1] }

def points117 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 4692, representative 278.
def source118 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B002.Data.entryAt ⟨11, by decide +kernel⟩

def target118 : Weights.Entry :=
  { word := [8, 2, 0, 8, 1, 4, 12], weights := [0, 2, 1, 1] }

-- Period 7, original row 4697, representative 274.
def source119 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B002.Data.entryAt ⟨7, by decide +kernel⟩

def target119 : Weights.Entry :=
  { word := [8, 2, 0, 8, 9, 4, 12], weights := [0, 2, 1, 1] }

-- Period 7, original row 4711, representative 313.
def source120 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B002.Data.entryAt ⟨46, by decide +kernel⟩

def target120 : Weights.Entry :=
  { word := [8, 2, 0, 9, 8, 4, 12], weights := [0, 3, 1, 0] }

-- Period 7, original row 4738, representative 312.
def source121 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B002.Data.entryAt ⟨45, by decide +kernel⟩

def target121 : Weights.Entry :=
  { word := [8, 2, 0, 10, 8, 4, 12], weights := [0, 2, 0, 1] }

-- Period 7, original row 4791, representative 389.
def source122 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B002.Data.entryAt ⟨122, by decide +kernel⟩

def target122 : Weights.Entry :=
  { word := [8, 2, 2, 2, 8, 8, 12], weights := [1, 0, 0, 1] }

-- Period 7, original row 4828, representative 310.
def source123 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B002.Data.entryAt ⟨43, by decide +kernel⟩

def target123 : Weights.Entry :=
  { word := [8, 2, 2, 10, 8, 4, 12], weights := [1, 1, 1, 1] }

-- Period 7, original row 4836, representative 392.
def source124 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B002.Data.entryAt ⟨125, by decide +kernel⟩

def target124 : Weights.Entry :=
  { word := [8, 2, 2, 10, 8, 8, 12], weights := [1, 0, 0, 1] }

-- Period 7, original row 4868, representative 393.
def source125 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B002.Data.entryAt ⟨126, by decide +kernel⟩

def target125 : Weights.Entry :=
  { word := [8, 2, 8, 2, 8, 8, 12], weights := [1, 0, 0, 1] }

-- Period 7, original row 4908, representative 311.
def source126 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B002.Data.entryAt ⟨44, by decide +kernel⟩

def target126 : Weights.Entry :=
  { word := [8, 2, 8, 10, 8, 4, 12], weights := [0, 2, 0, 1] }

-- Period 7, original row 4912, representative 394.
def source127 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B002.Data.entryAt ⟨127, by decide +kernel⟩

def target127 : Weights.Entry :=
  { word := [8, 2, 8, 10, 8, 8, 12], weights := [0, 1, 0, 0] }

def period7Entries : List Weights.Entry := [target0, target1, target2, target3, target4, target5, target6, target7, target8, target9, target10, target11, target12, target13, target14, target15, target16, target17, target18, target19, target20, target21, target22, target23, target24, target25, target26, target27, target28, target29, target30, target31, target32, target33, target34, target35, target36, target37, target38, target39, target40, target41, target42, target43, target44, target45, target46, target47, target48, target49, target50, target51, target52, target53, target54, target55, target56, target57, target58, target59, target60, target61, target62, target63, target64, target65, target66, target67, target68, target69, target70, target71, target72, target73, target74, target75, target76, target77, target78, target79, target80, target81, target82, target83, target84, target85, target86, target87, target88, target89, target90, target91, target92, target93, target94, target95, target96, target97, target98, target99, target100, target101, target102, target103, target104, target105, target106, target107, target108, target109, target110, target111, target112, target113, target114, target115, target116, target117, target118, target119, target120, target121, target122, target123, target124, target125, target126, target127]

def period7Chunk : RowCoverage.Chunk where
  rows := [⟨127, target0⟩, ⟨131, target1⟩, ⟨140, target2⟩, ⟨193, target3⟩, ⟨218, target4⟩, ⟨222, target5⟩, ⟨269, target6⟩, ⟨286, target7⟩, ⟨299, target8⟩, ⟨307, target9⟩, ⟨311, target10⟩, ⟨347, target11⟩, ⟨396, target12⟩, ⟨445, target13⟩, ⟨470, target14⟩, ⟨491, target15⟩, ⟨742, target16⟩, ⟨772, target17⟩, ⟨1172, target18⟩, ⟨1191, target19⟩, ⟨1195, target20⟩, ⟨1206, target21⟩, ⟨1231, target22⟩, ⟨1302, target23⟩, ⟨1306, target24⟩, ⟨1348, target25⟩, ⟨1356, target26⟩, ⟨1360, target27⟩, ⟨1370, target28⟩, ⟨1390, target29⟩, ⟨1422, target30⟩, ⟨1465, target31⟩, ⟨1490, target32⟩, ⟨2588, target33⟩, ⟨2593, target34⟩, ⟨2595, target35⟩, ⟨2602, target36⟩, ⟨2604, target37⟩, ⟨2609, target38⟩, ⟨2610, target39⟩, ⟨2612, target40⟩, ⟨2614, target41⟩, ⟨2619, target42⟩, ⟨2621, target43⟩, ⟨2630, target44⟩, ⟨2632, target45⟩, ⟨2635, target46⟩, ⟨2644, target47⟩, ⟨2646, target48⟩, ⟨2649, target49⟩, ⟨2663, target50⟩, ⟨2665, target51⟩, ⟨2671, target52⟩, ⟨2675, target53⟩, ⟨2693, target54⟩, ⟨2698, target55⟩, ⟨2700, target56⟩, ⟨2713, target57⟩, ⟨2715, target58⟩, ⟨2722, target59⟩, ⟨2728, target60⟩, ⟨2737, target61⟩, ⟨2739, target62⟩, ⟨2753, target63⟩, ⟨2755, target64⟩, ⟨2760, target65⟩, ⟨2772, target66⟩, ⟨2774, target67⟩, ⟨2777, target68⟩, ⟨2786, target69⟩, ⟨2788, target70⟩, ⟨2791, target71⟩, ⟨3208, target72⟩, ⟨3216, target73⟩, ⟨3224, target74⟩, ⟨3332, target75⟩, ⟨3354, target76⟩, ⟨3370, target77⟩, ⟨3410, target78⟩, ⟨3539, target79⟩, ⟨3574, target80⟩, ⟨3576, target81⟩, ⟨3579, target82⟩, ⟨3581, target83⟩, ⟨3583, target84⟩, ⟨3589, target85⟩, ⟨3590, target86⟩, ⟨3596, target87⟩, ⟨3598, target88⟩, ⟨3600, target89⟩, ⟨3606, target90⟩, ⟨3607, target91⟩, ⟨3619, target92⟩, ⟨3620, target93⟩, ⟨3628, target94⟩, ⟨3652, target95⟩, ⟨3653, target96⟩, ⟨3664, target97⟩, ⟨3686, target98⟩, ⟨3744, target99⟩, ⟨3787, target100⟩, ⟨3997, target101⟩, ⟨4005, target102⟩, ⟨4051, target103⟩, ⟨4497, target104⟩, ⟨4499, target105⟩, ⟨4501, target106⟩, ⟨4503, target107⟩, ⟨4508, target108⟩, ⟨4558, target109⟩, ⟨4563, target110⟩, ⟨4568, target111⟩, ⟨4588, target112⟩, ⟨4592, target113⟩, ⟨4637, target114⟩, ⟨4651, target115⟩, ⟨4656, target116⟩, ⟨4661, target117⟩, ⟨4692, target118⟩, ⟨4697, target119⟩, ⟨4711, target120⟩, ⟨4738, target121⟩, ⟨4791, target122⟩, ⟨4828, target123⟩, ⟨4836, target124⟩, ⟨4868, target125⟩, ⟨4908, target126⟩, ⟨4912, target127⟩]
  indexMask := 484917257386569076970227270336963607296195944111255965595776960366057564577012222204710427603155632779745374122885666157254640528699276602484465238503475050671214871213953837803444058524354974336614356939161725384775087443496117924681799844912539114710825577406101826721552994026871978344291317155955395425040309731708401444321867715319131205846587676697367755092557595247001062609350996297622886109236906935585660598735169960397282989340572317603093368622396723190170223604987871746801600477163922663435245894339593719546105677313354069986045356882515368960275416569168961427420172214086361056364269124137194934578990128153002979232772113516216533201331261909539089152941946473098318772403338574795457272184036776137865399846522362354283876968347974254190546394790088460497612781827335798935741235883920770746090121668185946774113788675931046801903390107590298900464243241907900784717176522504780676318182901339651968611320456530843294533777817837953448213177744674358172931588783921356668274389548251879683240495042039642058701355417666074241100906206106907057231771249795428836923875202265241613341229920578580118405840033615879801061588709232882228407965052219592523694896965866789094900161104410720790572269098564459354837908981101695848053260356858829915364224503743514688175375966238801006643586157668916394561777366731680220421211617304800116684603460221840660373227383518751297287387899000231104233760144989158257573559507100183482069000160719149335521192927301159878656
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

end FranklSmallCyclic.TransportBatches.G002.B000.Data
