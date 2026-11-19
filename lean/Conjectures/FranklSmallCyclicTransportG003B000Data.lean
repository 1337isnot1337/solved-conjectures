module

public import Conjectures.FranklSmallCyclicRowCoverage
public import Conjectures.FranklSmallCyclicCanonicalWords
public import Conjectures.FranklSmallCyclicOrbit7Block003Data

/-! 128 literal targets sharing one source proof block.
Original words and row indices are retained; weights may be transported.
-/
@[expose] public section

namespace FranklSmallCyclic.TransportBatches.G003.B000.Data

-- Period 7, original row 155, representative 466.
def source0 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B003.Data.entryAt ⟨71, by decide +kernel⟩

def target0 : Weights.Entry :=
  { word := [0, 1, 4, 2, 0, 8, 12], weights := [1, 0, 0, 1] }

-- Period 7, original row 163, representative 467.
def source1 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B003.Data.entryAt ⟨72, by decide +kernel⟩

def target1 : Weights.Entry :=
  { word := [0, 1, 4, 2, 8, 8, 12], weights := [1, 0, 0, 1] }

-- Period 7, original row 183, representative 473.
def source2 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B003.Data.entryAt ⟨77, by decide +kernel⟩

def target2 : Weights.Entry :=
  { word := [0, 1, 4, 10, 0, 8, 12], weights := [1, 0, 0, 1] }

-- Period 7, original row 195, representative 470.
def source3 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B003.Data.entryAt ⟨74, by decide +kernel⟩

def target3 : Weights.Entry :=
  { word := [0, 1, 4, 10, 8, 8, 12], weights := [1, 0, 0, 1] }

-- Period 7, original row 244, representative 471.
def source4 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B003.Data.entryAt ⟨75, by decide +kernel⟩

def target4 : Weights.Entry :=
  { word := [0, 1, 12, 2, 0, 8, 12], weights := [1, 0, 0, 1] }

-- Period 7, original row 252, representative 468.
def source5 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B003.Data.entryAt ⟨73, by decide +kernel⟩

def target5 : Weights.Entry :=
  { word := [0, 1, 12, 2, 8, 8, 12], weights := [1, 0, 0, 1] }

-- Period 7, original row 276, representative 472.
def source6 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B003.Data.entryAt ⟨76, by decide +kernel⟩

def target6 : Weights.Entry :=
  { word := [0, 1, 12, 10, 0, 8, 12], weights := [1, 0, 0, 1] }

-- Period 7, original row 327, representative 466.
def source7 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B003.Data.entryAt ⟨71, by decide +kernel⟩

def target7 : Weights.Entry :=
  { word := [0, 2, 2, 2, 0, 8, 12], weights := [0, 1, 0, 1] }

def points7 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6)]

-- Period 7, original row 338, representative 488.
def source8 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B003.Data.entryAt ⟨92, by decide +kernel⟩

def target8 : Weights.Entry :=
  { word := [0, 2, 2, 2, 8, 0, 12], weights := [1, 0, 0, 1] }

-- Period 7, original row 355, representative 458.
def source9 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B003.Data.entryAt ⟨63, by decide +kernel⟩

def target9 : Weights.Entry :=
  { word := [0, 2, 2, 2, 8, 8, 12], weights := [1, 0, 0, 1] }

-- Period 7, original row 375, representative 473.
def source10 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B003.Data.entryAt ⟨77, by decide +kernel⟩

def target10 : Weights.Entry :=
  { word := [0, 2, 2, 10, 0, 8, 12], weights := [0, 1, 0, 1] }

def points10 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6)]

-- Period 7, original row 389, representative 489.
def source11 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B003.Data.entryAt ⟨93, by decide +kernel⟩

def target11 : Weights.Entry :=
  { word := [0, 2, 2, 10, 8, 0, 12], weights := [1, 1, 0, 0] }

-- Period 7, original row 403, representative 461.
def source12 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B003.Data.entryAt ⟨66, by decide +kernel⟩

def target12 : Weights.Entry :=
  { word := [0, 2, 2, 10, 8, 8, 12], weights := [1, 0, 0, 1] }

-- Period 7, original row 432, representative 471.
def source13 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B003.Data.entryAt ⟨75, by decide +kernel⟩

def target13 : Weights.Entry :=
  { word := [0, 2, 10, 2, 0, 8, 12], weights := [0, 1, 0, 1] }

def points13 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6)]

-- Period 7, original row 453, representative 459.
def source14 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B003.Data.entryAt ⟨64, by decide +kernel⟩

def target14 : Weights.Entry :=
  { word := [0, 2, 10, 2, 8, 8, 12], weights := [1, 0, 0, 1] }

-- Period 7, original row 477, representative 472.
def source15 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B003.Data.entryAt ⟨76, by decide +kernel⟩

def target15 : Weights.Entry :=
  { word := [0, 2, 10, 10, 0, 8, 12], weights := [0, 1, 0, 1] }

def points15 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6)]

-- Period 7, original row 498, representative 460.
def source16 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B003.Data.entryAt ⟨65, by decide +kernel⟩

def target16 : Weights.Entry :=
  { word := [0, 2, 10, 10, 8, 8, 12], weights := [1, 0, 0, 1] }

-- Period 7, original row 1129, representative 436.
def source17 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B003.Data.entryAt ⟨41, by decide +kernel⟩

def target17 : Weights.Entry :=
  { word := [0, 9, 0, 1, 4, 8, 12], weights := [0, 1, 0, 0] }

-- Period 7, original row 1135, representative 434.
def source18 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B003.Data.entryAt ⟨39, by decide +kernel⟩

def target18 : Weights.Entry :=
  { word := [0, 9, 0, 1, 12, 8, 12], weights := [0, 1, 0, 0] }

-- Period 7, original row 1156, representative 476.
def source19 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B003.Data.entryAt ⟨80, by decide +kernel⟩

def target19 : Weights.Entry :=
  { word := [0, 9, 0, 4, 2, 0, 12], weights := [1, 0, 0, 1] }

-- Period 7, original row 1161, representative 446.
def source20 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B003.Data.entryAt ⟨51, by decide +kernel⟩

def target20 : Weights.Entry :=
  { word := [0, 9, 0, 4, 2, 8, 12], weights := [1, 0, 0, 1] }

-- Period 7, original row 1182, representative 477.
def source21 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B003.Data.entryAt ⟨81, by decide +kernel⟩

def target21 : Weights.Entry :=
  { word := [0, 9, 0, 4, 10, 0, 12], weights := [1, 0, 0, 1] }

-- Period 7, original row 1187, representative 447.
def source22 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B003.Data.entryAt ⟨52, by decide +kernel⟩

def target22 : Weights.Entry :=
  { word := [0, 9, 0, 4, 10, 8, 12], weights := [1, 0, 0, 1] }

-- Period 7, original row 1216, representative 479.
def source23 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B003.Data.entryAt ⟨83, by decide +kernel⟩

def target23 : Weights.Entry :=
  { word := [0, 9, 0, 12, 2, 0, 12], weights := [1, 0, 1, 0] }

-- Period 7, original row 1221, representative 449.
def source24 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B003.Data.entryAt ⟨54, by decide +kernel⟩

def target24 : Weights.Entry :=
  { word := [0, 9, 0, 12, 2, 8, 12], weights := [1, 0, 1, 0] }

-- Period 7, original row 1241, representative 478.
def source25 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B003.Data.entryAt ⟨82, by decide +kernel⟩

def target25 : Weights.Entry :=
  { word := [0, 9, 0, 12, 10, 0, 12], weights := [1, 0, 1, 0] }

-- Period 7, original row 1246, representative 448.
def source26 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B003.Data.entryAt ⟨53, by decide +kernel⟩

def target26 : Weights.Entry :=
  { word := [0, 9, 0, 12, 10, 8, 12], weights := [1, 0, 1, 0] }

-- Period 7, original row 1266, representative 437.
def source27 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B003.Data.entryAt ⟨42, by decide +kernel⟩

def target27 : Weights.Entry :=
  { word := [0, 9, 8, 1, 4, 8, 12], weights := [0, 1, 0, 0] }

-- Period 7, original row 1272, representative 435.
def source28 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B003.Data.entryAt ⟨40, by decide +kernel⟩

def target28 : Weights.Entry :=
  { word := [0, 9, 8, 1, 12, 8, 12], weights := [0, 1, 0, 0] }

-- Period 7, original row 1381, representative 474.
def source29 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B003.Data.entryAt ⟨78, by decide +kernel⟩

def target29 : Weights.Entry :=
  { word := [0, 10, 2, 2, 8, 0, 12], weights := [1, 0, 0, 1] }

-- Period 7, original row 1398, representative 454.
def source30 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B003.Data.entryAt ⟨59, by decide +kernel⟩

def target30 : Weights.Entry :=
  { word := [0, 10, 2, 2, 8, 8, 12], weights := [1, 0, 0, 1] }

-- Period 7, original row 1415, representative 475.
def source31 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B003.Data.entryAt ⟨79, by decide +kernel⟩

def target31 : Weights.Entry :=
  { word := [0, 10, 2, 10, 8, 0, 12], weights := [1, 1, 0, 0] }

-- Period 7, original row 1429, representative 457.
def source32 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B003.Data.entryAt ⟨62, by decide +kernel⟩

def target32 : Weights.Entry :=
  { word := [0, 10, 2, 10, 8, 8, 12], weights := [1, 0, 0, 1] }

-- Period 7, original row 1473, representative 455.
def source33 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B003.Data.entryAt ⟨60, by decide +kernel⟩

def target33 : Weights.Entry :=
  { word := [0, 10, 10, 2, 8, 8, 12], weights := [1, 0, 0, 1] }

-- Period 7, original row 1497, representative 456.
def source34 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B003.Data.entryAt ⟨61, by decide +kernel⟩

def target34 : Weights.Entry :=
  { word := [0, 10, 10, 10, 8, 8, 12], weights := [1, 0, 0, 1] }

-- Period 7, original row 2414, representative 422.
def source35 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B003.Data.entryAt ⟨27, by decide +kernel⟩

def target35 : Weights.Entry :=
  { word := [2, 0, 4, 2, 0, 8, 9], weights := [1, 0, 0, 1] }

-- Period 7, original row 2437, representative 425.
def source36 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B003.Data.entryAt ⟨30, by decide +kernel⟩

def target36 : Weights.Entry :=
  { word := [2, 0, 4, 10, 0, 8, 9], weights := [1, 0, 0, 1] }

-- Period 7, original row 2531, representative 423.
def source37 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B003.Data.entryAt ⟨28, by decide +kernel⟩

def target37 : Weights.Entry :=
  { word := [2, 0, 12, 2, 0, 8, 9], weights := [1, 0, 0, 1] }

-- Period 7, original row 2559, representative 424.
def source38 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B003.Data.entryAt ⟨29, by decide +kernel⟩

def target38 : Weights.Entry :=
  { word := [2, 0, 12, 10, 0, 8, 9], weights := [1, 0, 0, 1] }

-- Period 7, original row 2809, representative 480.
def source39 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B003.Data.entryAt ⟨84, by decide +kernel⟩

def target39 : Weights.Entry :=
  { word := [2, 8, 0, 4, 2, 0, 9], weights := [1, 0, 1, 0] }

-- Period 7, original row 2835, representative 481.
def source40 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B003.Data.entryAt ⟨85, by decide +kernel⟩

def target40 : Weights.Entry :=
  { word := [2, 8, 0, 4, 10, 0, 9], weights := [1, 0, 1, 0] }

-- Period 7, original row 2861, representative 487.
def source41 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B003.Data.entryAt ⟨91, by decide +kernel⟩

def target41 : Weights.Entry :=
  { word := [2, 8, 0, 12, 2, 0, 9], weights := [1, 0, 1, 0] }

-- Period 7, original row 2886, representative 484.
def source42 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B003.Data.entryAt ⟨88, by decide +kernel⟩

def target42 : Weights.Entry :=
  { word := [2, 8, 0, 12, 10, 0, 9], weights := [1, 0, 1, 0] }

-- Period 7, original row 2898, representative 414.
def source43 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B003.Data.entryAt ⟨19, by decide +kernel⟩

def target43 : Weights.Entry :=
  { word := [2, 8, 2, 0, 1, 8, 9], weights := [0, 0, 1, 0] }

-- Period 7, original row 2901, representative 415.
def source44 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B003.Data.entryAt ⟨20, by decide +kernel⟩

def target44 : Weights.Entry :=
  { word := [2, 8, 2, 0, 9, 8, 9], weights := [0, 0, 1, 0] }

-- Period 7, original row 2911, representative 418.
def source45 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B003.Data.entryAt ⟨23, by decide +kernel⟩

def target45 : Weights.Entry :=
  { word := [2, 8, 4, 2, 0, 8, 9], weights := [1, 0, 0, 1] }

-- Period 7, original row 2938, representative 421.
def source46 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B003.Data.entryAt ⟨26, by decide +kernel⟩

def target46 : Weights.Entry :=
  { word := [2, 8, 4, 10, 0, 8, 9], weights := [1, 0, 0, 1] }

-- Period 7, original row 2973, representative 485.
def source47 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B003.Data.entryAt ⟨89, by decide +kernel⟩

def target47 : Weights.Entry :=
  { word := [2, 8, 8, 4, 2, 0, 9], weights := [1, 0, 1, 0] }

-- Period 7, original row 3003, representative 482.
def source48 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B003.Data.entryAt ⟨86, by decide +kernel⟩

def target48 : Weights.Entry :=
  { word := [2, 8, 8, 4, 10, 0, 9], weights := [1, 0, 1, 0] }

-- Period 7, original row 3047, representative 486.
def source49 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B003.Data.entryAt ⟨90, by decide +kernel⟩

def target49 : Weights.Entry :=
  { word := [2, 8, 8, 12, 2, 0, 9], weights := [1, 0, 1, 0] }

-- Period 7, original row 3076, representative 483.
def source50 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B003.Data.entryAt ⟨87, by decide +kernel⟩

def target50 : Weights.Entry :=
  { word := [2, 8, 8, 12, 10, 0, 9], weights := [1, 0, 1, 0] }

-- Period 7, original row 3106, representative 417.
def source51 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B003.Data.entryAt ⟨22, by decide +kernel⟩

def target51 : Weights.Entry :=
  { word := [2, 8, 10, 0, 1, 8, 9], weights := [0, 0, 1, 0] }

-- Period 7, original row 3109, representative 416.
def source52 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B003.Data.entryAt ⟨21, by decide +kernel⟩

def target52 : Weights.Entry :=
  { word := [2, 8, 10, 0, 9, 8, 9], weights := [0, 0, 1, 0] }

-- Period 7, original row 3119, representative 419.
def source53 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B003.Data.entryAt ⟨24, by decide +kernel⟩

def target53 : Weights.Entry :=
  { word := [2, 8, 12, 2, 0, 8, 9], weights := [1, 0, 0, 1] }

-- Period 7, original row 3146, representative 420.
def source54 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B003.Data.entryAt ⟨25, by decide +kernel⟩

def target54 : Weights.Entry :=
  { word := [2, 8, 12, 10, 0, 8, 9], weights := [1, 0, 0, 1] }

-- Period 7, original row 3425, representative 466.
def source55 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B003.Data.entryAt ⟨71, by decide +kernel⟩

def target55 : Weights.Entry :=
  { word := [4, 0, 4, 2, 0, 8, 10], weights := [1, 0, 0, 1] }

def points55 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 3453, representative 473.
def source56 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B003.Data.entryAt ⟨77, by decide +kernel⟩

def target56 : Weights.Entry :=
  { word := [4, 0, 4, 10, 0, 8, 10], weights := [1, 0, 0, 1] }

def points56 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 3514, representative 471.
def source57 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B003.Data.entryAt ⟨75, by decide +kernel⟩

def target57 : Weights.Entry :=
  { word := [4, 0, 12, 2, 0, 8, 10], weights := [1, 0, 0, 1] }

def points57 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 3546, representative 472.
def source58 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B003.Data.entryAt ⟨76, by decide +kernel⟩

def target58 : Weights.Entry :=
  { word := [4, 0, 12, 10, 0, 8, 10], weights := [1, 0, 0, 1] }

def points58 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 3678, representative 444.
def source59 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B003.Data.entryAt ⟨49, by decide +kernel⟩

def target59 : Weights.Entry :=
  { word := [4, 4, 4, 8, 8, 2, 10], weights := [0, 1, 1, 0] }

-- Period 7, original row 3680, representative 433.
def source60 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B003.Data.entryAt ⟨38, by decide +kernel⟩

def target60 : Weights.Entry :=
  { word := [4, 4, 4, 8, 8, 10, 10], weights := [0, 1, 1, 0] }

-- Period 7, original row 3694, representative 445.
def source61 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B003.Data.entryAt ⟨50, by decide +kernel⟩

def target61 : Weights.Entry :=
  { word := [4, 4, 8, 8, 2, 2, 10], weights := [0, 1, 1, 0] }

-- Period 7, original row 3696, representative 431.
def source62 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B003.Data.entryAt ⟨36, by decide +kernel⟩

def target62 : Weights.Entry :=
  { word := [4, 4, 8, 8, 2, 10, 10], weights := [0, 1, 1, 0] }

-- Period 7, original row 3703, representative 442.
def source63 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B003.Data.entryAt ⟨47, by decide +kernel⟩

def target63 : Weights.Entry :=
  { word := [4, 4, 8, 8, 10, 2, 10], weights := [0, 1, 1, 0] }

-- Period 7, original row 3705, representative 430.
def source64 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B003.Data.entryAt ⟨35, by decide +kernel⟩

def target64 : Weights.Entry :=
  { word := [4, 4, 8, 8, 10, 10, 10], weights := [0, 1, 1, 0] }

-- Period 7, original row 3708, representative 443.
def source65 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B003.Data.entryAt ⟨48, by decide +kernel⟩

def target65 : Weights.Entry :=
  { word := [4, 4, 12, 8, 8, 2, 10], weights := [0, 1, 1, 0] }

-- Period 7, original row 3710, representative 432.
def source66 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B003.Data.entryAt ⟨37, by decide +kernel⟩

def target66 : Weights.Entry :=
  { word := [4, 4, 12, 8, 8, 10, 10], weights := [0, 1, 1, 0] }

-- Period 7, original row 3728, representative 480.
def source67 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B003.Data.entryAt ⟨84, by decide +kernel⟩

def target67 : Weights.Entry :=
  { word := [4, 8, 0, 4, 2, 0, 10], weights := [1, 0, 1, 0] }

def points67 : List (ℕ × ℕ) := [(0, 0), (1, 2), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 3733, representative 450.
def source68 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B003.Data.entryAt ⟨55, by decide +kernel⟩

def target68 : Weights.Entry :=
  { word := [4, 8, 0, 4, 2, 8, 10], weights := [1, 0, 1, 0] }

-- Period 7, original row 3754, representative 481.
def source69 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B003.Data.entryAt ⟨85, by decide +kernel⟩

def target69 : Weights.Entry :=
  { word := [4, 8, 0, 4, 10, 0, 10], weights := [1, 0, 1, 0] }

def points69 : List (ℕ × ℕ) := [(0, 0), (1, 2), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 3759, representative 451.
def source70 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B003.Data.entryAt ⟨56, by decide +kernel⟩

def target70 : Weights.Entry :=
  { word := [4, 8, 0, 4, 10, 8, 10], weights := [1, 0, 1, 0] }

-- Period 7, original row 3772, representative 487.
def source71 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B003.Data.entryAt ⟨91, by decide +kernel⟩

def target71 : Weights.Entry :=
  { word := [4, 8, 0, 12, 2, 0, 10], weights := [1, 0, 1, 0] }

def points71 : List (ℕ × ℕ) := [(0, 0), (1, 2), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 3777, representative 453.
def source72 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B003.Data.entryAt ⟨58, by decide +kernel⟩

def target72 : Weights.Entry :=
  { word := [4, 8, 0, 12, 2, 8, 10], weights := [1, 0, 1, 0] }

-- Period 7, original row 3797, representative 484.
def source73 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B003.Data.entryAt ⟨88, by decide +kernel⟩

def target73 : Weights.Entry :=
  { word := [4, 8, 0, 12, 10, 0, 10], weights := [1, 0, 1, 0] }

def points73 : List (ℕ × ℕ) := [(0, 0), (1, 2), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 3802, representative 452.
def source74 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B003.Data.entryAt ⟨57, by decide +kernel⟩

def target74 : Weights.Entry :=
  { word := [4, 8, 0, 12, 10, 8, 10], weights := [1, 0, 1, 0] }

-- Period 7, original row 3816, representative 462.
def source75 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B003.Data.entryAt ⟨67, by decide +kernel⟩

def target75 : Weights.Entry :=
  { word := [4, 8, 4, 2, 0, 8, 10], weights := [1, 0, 0, 1] }

-- Period 7, original row 3851, representative 465.
def source76 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B003.Data.entryAt ⟨70, by decide +kernel⟩

def target76 : Weights.Entry :=
  { word := [4, 8, 4, 10, 0, 8, 10], weights := [1, 0, 0, 1] }

-- Period 7, original row 3924, representative 463.
def source77 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B003.Data.entryAt ⟨68, by decide +kernel⟩

def target77 : Weights.Entry :=
  { word := [4, 8, 12, 2, 0, 8, 10], weights := [1, 0, 0, 1] }

-- Period 7, original row 3959, representative 464.
def source78 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B003.Data.entryAt ⟨69, by decide +kernel⟩

def target78 : Weights.Entry :=
  { word := [4, 8, 12, 10, 0, 8, 10], weights := [1, 0, 0, 1] }

-- Period 7, original row 4043, representative 439.
def source79 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B003.Data.entryAt ⟨44, by decide +kernel⟩

def target79 : Weights.Entry :=
  { word := [4, 12, 4, 8, 8, 2, 10], weights := [0, 1, 1, 0] }

-- Period 7, original row 4045, representative 429.
def source80 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B003.Data.entryAt ⟨34, by decide +kernel⟩

def target80 : Weights.Entry :=
  { word := [4, 12, 4, 8, 8, 10, 10], weights := [0, 1, 1, 0] }

-- Period 7, original row 4059, representative 441.
def source81 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B003.Data.entryAt ⟨46, by decide +kernel⟩

def target81 : Weights.Entry :=
  { word := [4, 12, 8, 8, 2, 2, 10], weights := [0, 1, 1, 0] }

-- Period 7, original row 4061, representative 427.
def source82 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B003.Data.entryAt ⟨32, by decide +kernel⟩

def target82 : Weights.Entry :=
  { word := [4, 12, 8, 8, 2, 10, 10], weights := [0, 1, 1, 0] }

-- Period 7, original row 4068, representative 440.
def source83 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B003.Data.entryAt ⟨45, by decide +kernel⟩

def target83 : Weights.Entry :=
  { word := [4, 12, 8, 8, 10, 2, 10], weights := [0, 1, 1, 0] }

-- Period 7, original row 4070, representative 426.
def source84 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B003.Data.entryAt ⟨31, by decide +kernel⟩

def target84 : Weights.Entry :=
  { word := [4, 12, 8, 8, 10, 10, 10], weights := [0, 1, 1, 0] }

-- Period 7, original row 4073, representative 438.
def source85 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B003.Data.entryAt ⟨43, by decide +kernel⟩

def target85 : Weights.Entry :=
  { word := [4, 12, 12, 8, 8, 2, 10], weights := [0, 1, 1, 0] }

-- Period 7, original row 4075, representative 428.
def source86 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B003.Data.entryAt ⟨33, by decide +kernel⟩

def target86 : Weights.Entry :=
  { word := [4, 12, 12, 8, 8, 10, 10], weights := [0, 1, 1, 0] }

-- Period 7, original row 4510, representative 512.
def source87 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B003.Data.entryAt ⟨116, by decide +kernel⟩

def target87 : Weights.Entry :=
  { word := [8, 1, 0, 12, 0, 4, 10], weights := [1, 0, 1, 0] }

-- Period 7, original row 4522, representative 480.
def source88 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B003.Data.entryAt ⟨84, by decide +kernel⟩

def target88 : Weights.Entry :=
  { word := [8, 1, 4, 2, 0, 8, 4], weights := [0, 1, 0, 1] }

def points88 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 4533, representative 485.
def source89 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B003.Data.entryAt ⟨89, by decide +kernel⟩

def target89 : Weights.Entry :=
  { word := [8, 1, 4, 2, 8, 8, 4], weights := [0, 1, 0, 1] }

def points89 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 4550, representative 487.
def source90 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B003.Data.entryAt ⟨91, by decide +kernel⟩

def target90 : Weights.Entry :=
  { word := [8, 1, 4, 10, 0, 8, 4], weights := [0, 1, 0, 1] }

def points90 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 4560, representative 506.
def source91 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B003.Data.entryAt ⟨110, by decide +kernel⟩

def target91 : Weights.Entry :=
  { word := [8, 1, 4, 10, 0, 12, 10], weights := [1, 0, 1, 1] }

-- Period 7, original row 4565, representative 486.
def source92 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B003.Data.entryAt ⟨90, by decide +kernel⟩

def target92 : Weights.Entry :=
  { word := [8, 1, 4, 10, 8, 8, 4], weights := [0, 1, 0, 1] }

def points92 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 4611, representative 481.
def source93 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B003.Data.entryAt ⟨85, by decide +kernel⟩

def target93 : Weights.Entry :=
  { word := [8, 1, 12, 2, 0, 8, 4], weights := [0, 1, 0, 1] }

def points93 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 4622, representative 482.
def source94 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B003.Data.entryAt ⟨86, by decide +kernel⟩

def target94 : Weights.Entry :=
  { word := [8, 1, 12, 2, 8, 8, 4], weights := [0, 1, 0, 1] }

def points94 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 4643, representative 484.
def source95 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B003.Data.entryAt ⟨88, by decide +kernel⟩

def target95 : Weights.Entry :=
  { word := [8, 1, 12, 10, 0, 8, 4], weights := [0, 1, 0, 1] }

def points95 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 4653, representative 505.
def source96 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B003.Data.entryAt ⟨109, by decide +kernel⟩

def target96 : Weights.Entry :=
  { word := [8, 1, 12, 10, 0, 12, 10], weights := [1, 0, 1, 1] }

-- Period 7, original row 4658, representative 483.
def source97 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B003.Data.entryAt ⟨87, by decide +kernel⟩

def target97 : Weights.Entry :=
  { word := [8, 1, 12, 10, 8, 8, 4], weights := [0, 1, 0, 1] }

def points97 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 4669, representative 409.
def source98 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B003.Data.entryAt ⟨14, by decide +kernel⟩

def target98 : Weights.Entry :=
  { word := [8, 2, 0, 1, 8, 1, 12], weights := [0, 1, 0, 0] }

-- Period 7, original row 4674, representative 411.
def source99 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B003.Data.entryAt ⟨16, by decide +kernel⟩

def target99 : Weights.Entry :=
  { word := [8, 2, 0, 1, 8, 8, 12], weights := [0, 1, 0, 0] }

-- Period 7, original row 4676, representative 407.
def source100 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B003.Data.entryAt ⟨12, by decide +kernel⟩

def target100 : Weights.Entry :=
  { word := [8, 2, 0, 1, 8, 9, 12], weights := [0, 1, 0, 0] }

-- Period 7, original row 4706, representative 410.
def source101 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B003.Data.entryAt ⟨15, by decide +kernel⟩

def target101 : Weights.Entry :=
  { word := [8, 2, 0, 9, 8, 1, 12], weights := [0, 1, 0, 0] }

-- Period 7, original row 4714, representative 412.
def source102 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B003.Data.entryAt ⟨17, by decide +kernel⟩

def target102 : Weights.Entry :=
  { word := [8, 2, 0, 9, 8, 8, 12], weights := [0, 1, 0, 0] }

-- Period 7, original row 4716, representative 408.
def source103 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B003.Data.entryAt ⟨13, by decide +kernel⟩

def target103 : Weights.Entry :=
  { word := [8, 2, 0, 9, 8, 9, 12], weights := [0, 1, 0, 0] }

-- Period 7, original row 4728, representative 406.
def source104 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B003.Data.entryAt ⟨11, by decide +kernel⟩

def target104 : Weights.Entry :=
  { word := [8, 2, 0, 10, 0, 0, 12], weights := [0, 1, 0, 0] }

-- Period 7, original row 4734, representative 402.
def source105 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B003.Data.entryAt ⟨7, by decide +kernel⟩

def target105 : Weights.Entry :=
  { word := [8, 2, 0, 10, 0, 8, 12], weights := [1, 0, 0, 1] }

-- Period 7, original row 4736, representative 405.
def source106 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B003.Data.entryAt ⟨10, by decide +kernel⟩

def target106 : Weights.Entry :=
  { word := [8, 2, 0, 10, 8, 0, 12], weights := [0, 1, 0, 0] }

-- Period 7, original row 4740, representative 395.
def source107 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B003.Data.entryAt ⟨0, by decide +kernel⟩

def target107 : Weights.Entry :=
  { word := [8, 2, 0, 10, 8, 8, 12], weights := [0, 1, 0, 0] }

-- Period 7, original row 4755, representative 413.
def source108 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B003.Data.entryAt ⟨18, by decide +kernel⟩

def target108 : Weights.Entry :=
  { word := [8, 2, 0, 12, 10, 0, 12], weights := [1, 1, 0, 1] }

-- Period 7, original row 4768, representative 396.
def source109 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B003.Data.entryAt ⟨1, by decide +kernel⟩

def target109 : Weights.Entry :=
  { word := [8, 2, 2, 2, 0, 8, 12], weights := [1, 0, 0, 1] }

-- Period 7, original row 4779, representative 403.
def source110 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B003.Data.entryAt ⟨8, by decide +kernel⟩

def target110 : Weights.Entry :=
  { word := [8, 2, 2, 2, 8, 0, 12], weights := [1, 0, 0, 1] }

-- Period 7, original row 4807, representative 399.
def source111 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B003.Data.entryAt ⟨4, by decide +kernel⟩

def target111 : Weights.Entry :=
  { word := [8, 2, 2, 10, 0, 8, 12], weights := [1, 0, 0, 1] }

-- Period 7, original row 4819, representative 404.
def source112 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B003.Data.entryAt ⟨9, by decide +kernel⟩

def target112 : Weights.Entry :=
  { word := [8, 2, 2, 10, 8, 0, 12], weights := [1, 1, 0, 0] }

-- Period 7, original row 4858, representative 400.
def source113 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B003.Data.entryAt ⟨5, by decide +kernel⟩

def target113 : Weights.Entry :=
  { word := [8, 2, 8, 2, 0, 8, 12], weights := [1, 0, 0, 1] }

-- Period 7, original row 4899, representative 401.
def source114 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B003.Data.entryAt ⟨6, by decide +kernel⟩

def target114 : Weights.Entry :=
  { word := [8, 2, 8, 10, 0, 8, 12], weights := [1, 0, 0, 1] }

-- Period 7, original row 4936, representative 397.
def source115 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B003.Data.entryAt ⟨2, by decide +kernel⟩

def target115 : Weights.Entry :=
  { word := [8, 2, 10, 2, 0, 8, 12], weights := [1, 0, 0, 1] }

-- Period 7, original row 4969, representative 398.
def source116 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B003.Data.entryAt ⟨3, by decide +kernel⟩

def target116 : Weights.Entry :=
  { word := [8, 2, 10, 10, 0, 8, 12], weights := [1, 0, 0, 1] }

-- Period 7, original row 5850, representative 414.
def source117 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B003.Data.entryAt ⟨19, by decide +kernel⟩

def target117 : Weights.Entry :=
  { word := [8, 9, 0, 1, 4, 8, 4], weights := [0, 1, 0, 0] }

def points117 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 5856, representative 417.
def source118 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B003.Data.entryAt ⟨22, by decide +kernel⟩

def target118 : Weights.Entry :=
  { word := [8, 9, 0, 1, 12, 8, 4], weights := [0, 1, 0, 0] }

def points118 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 5874, representative 422.
def source119 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B003.Data.entryAt ⟨27, by decide +kernel⟩

def target119 : Weights.Entry :=
  { word := [8, 9, 0, 4, 2, 0, 4], weights := [1, 0, 0, 1] }

def points119 : List (ℕ × ℕ) := [(0, 1), (1, 2), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 5880, representative 418.
def source120 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B003.Data.entryAt ⟨23, by decide +kernel⟩

def target120 : Weights.Entry :=
  { word := [8, 9, 0, 4, 2, 8, 4], weights := [1, 0, 0, 1] }

def points120 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 5893, representative 507.
def source121 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B003.Data.entryAt ⟨111, by decide +kernel⟩

def target121 : Weights.Entry :=
  { word := [8, 9, 0, 4, 8, 4, 10], weights := [1, 0, 1, 0] }

-- Period 7, original row 5900, representative 423.
def source122 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B003.Data.entryAt ⟨28, by decide +kernel⟩

def target122 : Weights.Entry :=
  { word := [8, 9, 0, 4, 10, 0, 4], weights := [1, 0, 0, 1] }

def points122 : List (ℕ × ℕ) := [(0, 1), (1, 2), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 5906, representative 419.
def source123 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B003.Data.entryAt ⟨24, by decide +kernel⟩

def target123 : Weights.Entry :=
  { word := [8, 9, 0, 4, 10, 8, 4], weights := [1, 0, 0, 1] }

def points123 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 5927, representative 509.
def source124 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B003.Data.entryAt ⟨113, by decide +kernel⟩

def target124 : Weights.Entry :=
  { word := [8, 9, 0, 12, 0, 4, 10], weights := [1, 0, 1, 0] }

-- Period 7, original row 5934, representative 425.
def source125 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B003.Data.entryAt ⟨30, by decide +kernel⟩

def target125 : Weights.Entry :=
  { word := [8, 9, 0, 12, 2, 0, 4], weights := [1, 0, 0, 1] }

def points125 : List (ℕ × ℕ) := [(0, 1), (1, 2), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 5940, representative 421.
def source126 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B003.Data.entryAt ⟨26, by decide +kernel⟩

def target126 : Weights.Entry :=
  { word := [8, 9, 0, 12, 2, 8, 4], weights := [1, 0, 0, 1] }

def points126 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 5952, representative 508.
def source127 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B003.Data.entryAt ⟨112, by decide +kernel⟩

def target127 : Weights.Entry :=
  { word := [8, 9, 0, 12, 8, 4, 10], weights := [1, 0, 1, 0] }

def period7Entries : List Weights.Entry := [target0, target1, target2, target3, target4, target5, target6, target7, target8, target9, target10, target11, target12, target13, target14, target15, target16, target17, target18, target19, target20, target21, target22, target23, target24, target25, target26, target27, target28, target29, target30, target31, target32, target33, target34, target35, target36, target37, target38, target39, target40, target41, target42, target43, target44, target45, target46, target47, target48, target49, target50, target51, target52, target53, target54, target55, target56, target57, target58, target59, target60, target61, target62, target63, target64, target65, target66, target67, target68, target69, target70, target71, target72, target73, target74, target75, target76, target77, target78, target79, target80, target81, target82, target83, target84, target85, target86, target87, target88, target89, target90, target91, target92, target93, target94, target95, target96, target97, target98, target99, target100, target101, target102, target103, target104, target105, target106, target107, target108, target109, target110, target111, target112, target113, target114, target115, target116, target117, target118, target119, target120, target121, target122, target123, target124, target125, target126, target127]

def period7Chunk : RowCoverage.Chunk where
  rows := [⟨155, target0⟩, ⟨163, target1⟩, ⟨183, target2⟩, ⟨195, target3⟩, ⟨244, target4⟩, ⟨252, target5⟩, ⟨276, target6⟩, ⟨327, target7⟩, ⟨338, target8⟩, ⟨355, target9⟩, ⟨375, target10⟩, ⟨389, target11⟩, ⟨403, target12⟩, ⟨432, target13⟩, ⟨453, target14⟩, ⟨477, target15⟩, ⟨498, target16⟩, ⟨1129, target17⟩, ⟨1135, target18⟩, ⟨1156, target19⟩, ⟨1161, target20⟩, ⟨1182, target21⟩, ⟨1187, target22⟩, ⟨1216, target23⟩, ⟨1221, target24⟩, ⟨1241, target25⟩, ⟨1246, target26⟩, ⟨1266, target27⟩, ⟨1272, target28⟩, ⟨1381, target29⟩, ⟨1398, target30⟩, ⟨1415, target31⟩, ⟨1429, target32⟩, ⟨1473, target33⟩, ⟨1497, target34⟩, ⟨2414, target35⟩, ⟨2437, target36⟩, ⟨2531, target37⟩, ⟨2559, target38⟩, ⟨2809, target39⟩, ⟨2835, target40⟩, ⟨2861, target41⟩, ⟨2886, target42⟩, ⟨2898, target43⟩, ⟨2901, target44⟩, ⟨2911, target45⟩, ⟨2938, target46⟩, ⟨2973, target47⟩, ⟨3003, target48⟩, ⟨3047, target49⟩, ⟨3076, target50⟩, ⟨3106, target51⟩, ⟨3109, target52⟩, ⟨3119, target53⟩, ⟨3146, target54⟩, ⟨3425, target55⟩, ⟨3453, target56⟩, ⟨3514, target57⟩, ⟨3546, target58⟩, ⟨3678, target59⟩, ⟨3680, target60⟩, ⟨3694, target61⟩, ⟨3696, target62⟩, ⟨3703, target63⟩, ⟨3705, target64⟩, ⟨3708, target65⟩, ⟨3710, target66⟩, ⟨3728, target67⟩, ⟨3733, target68⟩, ⟨3754, target69⟩, ⟨3759, target70⟩, ⟨3772, target71⟩, ⟨3777, target72⟩, ⟨3797, target73⟩, ⟨3802, target74⟩, ⟨3816, target75⟩, ⟨3851, target76⟩, ⟨3924, target77⟩, ⟨3959, target78⟩, ⟨4043, target79⟩, ⟨4045, target80⟩, ⟨4059, target81⟩, ⟨4061, target82⟩, ⟨4068, target83⟩, ⟨4070, target84⟩, ⟨4073, target85⟩, ⟨4075, target86⟩, ⟨4510, target87⟩, ⟨4522, target88⟩, ⟨4533, target89⟩, ⟨4550, target90⟩, ⟨4560, target91⟩, ⟨4565, target92⟩, ⟨4611, target93⟩, ⟨4622, target94⟩, ⟨4643, target95⟩, ⟨4653, target96⟩, ⟨4658, target97⟩, ⟨4669, target98⟩, ⟨4674, target99⟩, ⟨4676, target100⟩, ⟨4706, target101⟩, ⟨4714, target102⟩, ⟨4716, target103⟩, ⟨4728, target104⟩, ⟨4734, target105⟩, ⟨4736, target106⟩, ⟨4740, target107⟩, ⟨4755, target108⟩, ⟨4768, target109⟩, ⟨4779, target110⟩, ⟨4807, target111⟩, ⟨4819, target112⟩, ⟨4858, target113⟩, ⟨4899, target114⟩, ⟨4936, target115⟩, ⟨4969, target116⟩, ⟨5850, target117⟩, ⟨5856, target118⟩, ⟨5874, target119⟩, ⟨5880, target120⟩, ⟨5893, target121⟩, ⟨5900, target122⟩, ⟨5906, target123⟩, ⟨5927, target124⟩, ⟨5934, target125⟩, ⟨5940, target126⟩, ⟨5952, target127⟩]
  indexMask := 5378261038285259329186716618574134954801245918327878220276831455321524650808103073588690582156131035444008189042951339814990398025215161597351954795798609426675122803386158958628799879464950201104109205308086692379103175601557527922661496261516706233175089046556176136122384418275431542464522209929596042851287232643675439796191754103288972568160521627445430711286500081769253801480752995105412447202154499918763552863539893291419626053036447363739292454424635229533624695751389984162717332552989094350848143618675851546204072922303908959379558600779322223194436192951794624490650806341378322877410610288175349129313241749011864816844046974080982789081318814696825266165431189049085444525224139283120678004717820474016114083570320267253294236734942114985567684391817733172742108109976576303788843651986746546788273881790396157319423381542692634303340344996511850478853841602847674799199307402176459182133640888063956017588684610534445390133684995256292856352667315053067246518629746526832584375490123482942141689776666847444736754177580980322948560517595509779427963033290761488209850994631595121825266838365759525687038944684227821307032900596480283958576350465032459350823976688071545836239571312046960176438002255079765833090323519733037362702815714459581961689636105261494240081192381204582332045534999320633377230143161214746044172088183593557718864603036491405247116729677173241352213764512610155607192640566407419613347069595973407152372603811557017974512632826335817434935296025155202892234016620946667828290331250476816544830602418514571211621887536559120015726518722948199892410668848407820437803156702592876530950601693221981912832007726222077691704764443333940889142733685273414219386032854608033043691755929483801244315727508627912318343202099054276440610701125728324968794554368
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

end FranklSmallCyclic.TransportBatches.G003.B000.Data
