module

public import Conjectures.FranklSmallCyclicRowCoverage
public import Conjectures.FranklSmallCyclicCanonicalWords
public import Conjectures.FranklSmallCyclicOrbit7Block004Data

/-! 128 literal targets sharing one source proof block.
Original words and row indices are retained; weights may be transported.
-/
@[expose] public section

namespace FranklSmallCyclic.TransportBatches.G004.B000.Data

-- Period 7, original row 189, representative 630.
def source0 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B004.Data.entryAt ⟨106, by decide +kernel⟩

def target0 : Weights.Entry :=
  { word := [0, 1, 4, 10, 0, 12, 10], weights := [1, 0, 1, 1] }

-- Period 7, original row 282, representative 629.
def source1 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B004.Data.entryAt ⟨105, by decide +kernel⟩

def target1 : Weights.Entry :=
  { word := [0, 1, 12, 10, 0, 12, 10], weights := [1, 0, 1, 1] }

-- Period 7, original row 364, representative 616.
def source2 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B004.Data.entryAt ⟨92, by decide +kernel⟩

def target2 : Weights.Entry :=
  { word := [0, 2, 2, 2, 8, 12, 10], weights := [0, 1, 0, 1] }

-- Period 7, original row 381, representative 630.
def source3 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B004.Data.entryAt ⟨106, by decide +kernel⟩

def target3 : Weights.Entry :=
  { word := [0, 2, 2, 10, 0, 12, 10], weights := [0, 1, 1, 1] }

def points3 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6)]

-- Period 7, original row 409, representative 619.
def source4 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B004.Data.entryAt ⟨95, by decide +kernel⟩

def target4 : Weights.Entry :=
  { word := [0, 2, 2, 10, 8, 12, 10], weights := [0, 1, 1, 0] }

-- Period 7, original row 462, representative 617.
def source5 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B004.Data.entryAt ⟨93, by decide +kernel⟩

def target5 : Weights.Entry :=
  { word := [0, 2, 10, 2, 8, 12, 10], weights := [0, 1, 0, 1] }

-- Period 7, original row 483, representative 629.
def source6 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B004.Data.entryAt ⟨105, by decide +kernel⟩

def target6 : Weights.Entry :=
  { word := [0, 2, 10, 10, 0, 12, 10], weights := [0, 1, 1, 1] }

def points6 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6)]

-- Period 7, original row 504, representative 618.
def source7 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B004.Data.entryAt ⟨94, by decide +kernel⟩

def target7 : Weights.Entry :=
  { word := [0, 2, 10, 10, 8, 12, 10], weights := [0, 1, 1, 0] }

-- Period 7, original row 765, representative 611.
def source8 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B004.Data.entryAt ⟨87, by decide +kernel⟩

def target8 : Weights.Entry :=
  { word := [0, 6, 2, 8, 8, 12, 10], weights := [0, 1, 1, 0] }

-- Period 7, original row 776, representative 620.
def source9 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B004.Data.entryAt ⟨96, by decide +kernel⟩

def target9 : Weights.Entry :=
  { word := [0, 6, 8, 12, 8, 12, 10], weights := [0, 1, 1, 0] }

-- Period 7, original row 792, representative 610.
def source10 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B004.Data.entryAt ⟨86, by decide +kernel⟩

def target10 : Weights.Entry :=
  { word := [0, 6, 10, 8, 8, 12, 10], weights := [0, 1, 1, 0] }

-- Period 7, original row 1407, representative 612.
def source11 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B004.Data.entryAt ⟨88, by decide +kernel⟩

def target11 : Weights.Entry :=
  { word := [0, 10, 2, 2, 8, 12, 10], weights := [0, 1, 0, 1] }

-- Period 7, original row 1435, representative 615.
def source12 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B004.Data.entryAt ⟨91, by decide +kernel⟩

def target12 : Weights.Entry :=
  { word := [0, 10, 2, 10, 8, 12, 10], weights := [0, 1, 1, 0] }

-- Period 7, original row 1482, representative 613.
def source13 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B004.Data.entryAt ⟨89, by decide +kernel⟩

def target13 : Weights.Entry :=
  { word := [0, 10, 10, 2, 8, 12, 10], weights := [0, 1, 0, 1] }

-- Period 7, original row 1503, representative 614.
def source14 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B004.Data.entryAt ⟨90, by decide +kernel⟩

def target14 : Weights.Entry :=
  { word := [0, 10, 10, 10, 8, 12, 10], weights := [0, 1, 1, 0] }

-- Period 7, original row 2390, representative 587.
def source15 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B004.Data.entryAt ⟨63, by decide +kernel⟩

def target15 : Weights.Entry :=
  { word := [2, 0, 0, 9, 4, 12, 12], weights := [1, 0, 1, 1] }

-- Period 7, original row 2394, representative 585.
def source16 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B004.Data.entryAt ⟨61, by decide +kernel⟩

def target16 : Weights.Entry :=
  { word := [2, 0, 0, 9, 12, 12, 12], weights := [1, 0, 1, 1] }

-- Period 7, original row 2404, representative 583.
def source17 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B004.Data.entryAt ⟨59, by decide +kernel⟩

def target17 : Weights.Entry :=
  { word := [2, 0, 0, 12, 0, 12, 12], weights := [1, 0, 1, 0] }

-- Period 7, original row 2445, representative 593.
def source18 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B004.Data.entryAt ⟨69, by decide +kernel⟩

def target18 : Weights.Entry :=
  { word := [2, 0, 4, 10, 0, 12, 10], weights := [1, 0, 1, 1] }

-- Period 7, original row 2446, representative 593.
def source19 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B004.Data.entryAt ⟨69, by decide +kernel⟩

def target19 : Weights.Entry :=
  { word := [2, 0, 4, 10, 0, 12, 12], weights := [1, 0, 1, 1] }

def points19 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 2454, representative 591.
def source20 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B004.Data.entryAt ⟨67, by decide +kernel⟩

def target20 : Weights.Entry :=
  { word := [2, 0, 4, 10, 8, 12, 12], weights := [1, 0, 1, 1] }

-- Period 7, original row 2475, representative 577.
def source21 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B004.Data.entryAt ⟨53, by decide +kernel⟩

def target21 : Weights.Entry :=
  { word := [2, 0, 8, 4, 8, 12, 12], weights := [1, 0, 0, 1] }

-- Period 7, original row 2479, representative 586.
def source22 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B004.Data.entryAt ⟨62, by decide +kernel⟩

def target22 : Weights.Entry :=
  { word := [2, 0, 8, 9, 4, 12, 12], weights := [1, 0, 1, 1] }

-- Period 7, original row 2483, representative 584.
def source23 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B004.Data.entryAt ⟨60, by decide +kernel⟩

def target23 : Weights.Entry :=
  { word := [2, 0, 8, 9, 12, 12, 12], weights := [1, 0, 1, 1] }

-- Period 7, original row 2496, representative 582.
def source24 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B004.Data.entryAt ⟨58, by decide +kernel⟩

def target24 : Weights.Entry :=
  { word := [2, 0, 8, 12, 0, 12, 10], weights := [1, 0, 1, 0] }

-- Period 7, original row 2497, representative 582.
def source25 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B004.Data.entryAt ⟨58, by decide +kernel⟩

def target25 : Weights.Entry :=
  { word := [2, 0, 8, 12, 0, 12, 12], weights := [1, 0, 1, 0] }

def points25 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 2505, representative 578.
def source26 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B004.Data.entryAt ⟨54, by decide +kernel⟩

def target26 : Weights.Entry :=
  { word := [2, 0, 8, 12, 8, 12, 12], weights := [1, 0, 1, 0] }

-- Period 7, original row 2516, representative 599.
def source27 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B004.Data.entryAt ⟨75, by decide +kernel⟩

def target27 : Weights.Entry :=
  { word := [2, 0, 9, 8, 1, 12, 10], weights := [1, 0, 1, 1] }

-- Period 7, original row 2517, representative 599.
def source28 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B004.Data.entryAt ⟨75, by decide +kernel⟩

def target28 : Weights.Entry :=
  { word := [2, 0, 9, 8, 1, 12, 12], weights := [1, 0, 1, 1] }

def points28 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 2521, representative 595.
def source29 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B004.Data.entryAt ⟨71, by decide +kernel⟩

def target29 : Weights.Entry :=
  { word := [2, 0, 9, 8, 9, 12, 12], weights := [1, 0, 1, 1] }

-- Period 7, original row 2567, representative 592.
def source30 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B004.Data.entryAt ⟨68, by decide +kernel⟩

def target30 : Weights.Entry :=
  { word := [2, 0, 12, 10, 0, 12, 10], weights := [1, 0, 1, 1] }

-- Period 7, original row 2568, representative 592.
def source31 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B004.Data.entryAt ⟨68, by decide +kernel⟩

def target31 : Weights.Entry :=
  { word := [2, 0, 12, 10, 0, 12, 12], weights := [1, 0, 1, 1] }

def points31 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 2576, representative 590.
def source32 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B004.Data.entryAt ⟨66, by decide +kernel⟩

def target32 : Weights.Entry :=
  { word := [2, 0, 12, 10, 8, 12, 12], weights := [1, 0, 1, 1] }

-- Period 7, original row 2830, representative 573.
def source33 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B004.Data.entryAt ⟨49, by decide +kernel⟩

def target33 : Weights.Entry :=
  { word := [2, 8, 0, 4, 8, 12, 12], weights := [1, 0, 0, 1] }

-- Period 7, original row 2856, representative 580.
def source34 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B004.Data.entryAt ⟨56, by decide +kernel⟩

def target34 : Weights.Entry :=
  { word := [2, 8, 0, 12, 0, 12, 12], weights := [1, 0, 1, 0] }

-- Period 7, original row 2881, representative 576.
def source35 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B004.Data.entryAt ⟨52, by decide +kernel⟩

def target35 : Weights.Entry :=
  { word := [2, 8, 0, 12, 8, 12, 12], weights := [1, 0, 1, 0] }

-- Period 7, original row 2948, representative 589.
def source36 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B004.Data.entryAt ⟨65, by decide +kernel⟩

def target36 : Weights.Entry :=
  { word := [2, 8, 4, 10, 8, 12, 12], weights := [2, 2, 1, 3] }

-- Period 7, original row 2997, representative 571.
def source37 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B004.Data.entryAt ⟨47, by decide +kernel⟩

def target37 : Weights.Entry :=
  { word := [2, 8, 8, 4, 8, 12, 10], weights := [1, 0, 1, 0] }

-- Period 7, original row 2998, representative 574.
def source38 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B004.Data.entryAt ⟨50, by decide +kernel⟩

def target38 : Weights.Entry :=
  { word := [2, 8, 8, 4, 8, 12, 12], weights := [1, 0, 0, 1] }

-- Period 7, original row 3023, representative 601.
def source39 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B004.Data.entryAt ⟨77, by decide +kernel⟩

def target39 : Weights.Entry :=
  { word := [2, 8, 8, 8, 1, 12, 10], weights := [1, 0, 1, 1] }

-- Period 7, original row 3024, representative 600.
def source40 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B004.Data.entryAt ⟨76, by decide +kernel⟩

def target40 : Weights.Entry :=
  { word := [2, 8, 8, 8, 1, 12, 12], weights := [1, 0, 1, 1] }

-- Period 7, original row 3028, representative 596.
def source41 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B004.Data.entryAt ⟨72, by decide +kernel⟩

def target41 : Weights.Entry :=
  { word := [2, 8, 8, 8, 9, 12, 12], weights := [1, 0, 1, 1] }

-- Period 7, original row 3041, representative 581.
def source42 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B004.Data.entryAt ⟨57, by decide +kernel⟩

def target42 : Weights.Entry :=
  { word := [2, 8, 8, 12, 0, 12, 10], weights := [1, 0, 1, 0] }

-- Period 7, original row 3042, representative 579.
def source43 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B004.Data.entryAt ⟨55, by decide +kernel⟩

def target43 : Weights.Entry :=
  { word := [2, 8, 8, 12, 0, 12, 12], weights := [1, 0, 1, 0] }

-- Period 7, original row 3070, representative 572.
def source44 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B004.Data.entryAt ⟨48, by decide +kernel⟩

def target44 : Weights.Entry :=
  { word := [2, 8, 8, 12, 8, 12, 10], weights := [1, 0, 1, 0] }

-- Period 7, original row 3071, representative 575.
def source45 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B004.Data.entryAt ⟨51, by decide +kernel⟩

def target45 : Weights.Entry :=
  { word := [2, 8, 8, 12, 8, 12, 12], weights := [1, 0, 1, 0] }

-- Period 7, original row 3098, representative 598.
def source46 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B004.Data.entryAt ⟨74, by decide +kernel⟩

def target46 : Weights.Entry :=
  { word := [2, 8, 9, 8, 1, 12, 10], weights := [1, 0, 1, 1] }

-- Period 7, original row 3099, representative 597.
def source47 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B004.Data.entryAt ⟨73, by decide +kernel⟩

def target47 : Weights.Entry :=
  { word := [2, 8, 9, 8, 1, 12, 12], weights := [1, 0, 1, 1] }

-- Period 7, original row 3103, representative 594.
def source48 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B004.Data.entryAt ⟨70, by decide +kernel⟩

def target48 : Weights.Entry :=
  { word := [2, 8, 9, 8, 9, 12, 12], weights := [1, 0, 1, 1] }

-- Period 7, original row 3158, representative 588.
def source49 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B004.Data.entryAt ⟨64, by decide +kernel⟩

def target49 : Weights.Entry :=
  { word := [2, 8, 12, 10, 8, 12, 12], weights := [2, 1, 1, 2] }

-- Period 7, original row 3349, representative 570.
def source50 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B004.Data.entryAt ⟨46, by decide +kernel⟩

def target50 : Weights.Entry :=
  { word := [2, 10, 8, 12, 8, 12, 10], weights := [2, 1, 2, 1] }

-- Period 7, original row 3400, representative 624.
def source51 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B004.Data.entryAt ⟨100, by decide +kernel⟩

def target51 : Weights.Entry :=
  { word := [4, 0, 0, 9, 4, 12, 12], weights := [1, 0, 1, 1] }

-- Period 7, original row 3404, representative 622.
def source52 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B004.Data.entryAt ⟨98, by decide +kernel⟩

def target52 : Weights.Entry :=
  { word := [4, 0, 0, 9, 12, 12, 12], weights := [1, 0, 1, 1] }

-- Period 7, original row 3414, representative 604.
def source53 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B004.Data.entryAt ⟨80, by decide +kernel⟩

def target53 : Weights.Entry :=
  { word := [4, 0, 0, 12, 0, 12, 12], weights := [1, 0, 1, 0] }

-- Period 7, original row 3461, representative 630.
def source54 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B004.Data.entryAt ⟨106, by decide +kernel⟩

def target54 : Weights.Entry :=
  { word := [4, 0, 4, 10, 0, 12, 12], weights := [1, 0, 1, 1] }

def points54 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 3469, representative 628.
def source55 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B004.Data.entryAt ⟨104, by decide +kernel⟩

def target55 : Weights.Entry :=
  { word := [4, 0, 4, 10, 8, 12, 12], weights := [1, 0, 1, 1] }

-- Period 7, original row 3491, representative 623.
def source56 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B004.Data.entryAt ⟨99, by decide +kernel⟩

def target56 : Weights.Entry :=
  { word := [4, 0, 8, 9, 4, 12, 12], weights := [1, 0, 1, 1] }

-- Period 7, original row 3495, representative 621.
def source57 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B004.Data.entryAt ⟨97, by decide +kernel⟩

def target57 : Weights.Entry :=
  { word := [4, 0, 8, 9, 12, 12, 12], weights := [1, 0, 1, 1] }

-- Period 7, original row 3554, representative 629.
def source58 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B004.Data.entryAt ⟨105, by decide +kernel⟩

def target58 : Weights.Entry :=
  { word := [4, 0, 12, 10, 0, 12, 12], weights := [1, 0, 1, 1] }

def points58 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 3562, representative 627.
def source59 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B004.Data.entryAt ⟨103, by decide +kernel⟩

def target59 : Weights.Entry :=
  { word := [4, 0, 12, 10, 8, 12, 12], weights := [1, 0, 1, 1] }

-- Period 7, original row 3692, representative 634.
def source60 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B004.Data.entryAt ⟨110, by decide +kernel⟩

def target60 : Weights.Entry :=
  { word := [4, 4, 8, 8, 1, 12, 12], weights := [1, 0, 1, 1] }

-- Period 7, original row 3701, representative 632.
def source61 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B004.Data.entryAt ⟨108, by decide +kernel⟩

def target61 : Weights.Entry :=
  { word := [4, 4, 8, 8, 9, 12, 12], weights := [1, 0, 1, 1] }

-- Period 7, original row 3748, representative 602.
def source62 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B004.Data.entryAt ⟨78, by decide +kernel⟩

def target62 : Weights.Entry :=
  { word := [4, 8, 0, 4, 8, 12, 12], weights := [1, 0, 0, 1] }

-- Period 7, original row 3791, representative 603.
def source63 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B004.Data.entryAt ⟨79, by decide +kernel⟩

def target63 : Weights.Entry :=
  { word := [4, 8, 0, 12, 8, 12, 12], weights := [1, 0, 1, 0] }

-- Period 7, original row 3862, representative 626.
def source64 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B004.Data.entryAt ⟨102, by decide +kernel⟩

def target64 : Weights.Entry :=
  { word := [4, 8, 4, 10, 8, 12, 12], weights := [1, 1, 1, 1] }

-- Period 7, original row 3970, representative 625.
def source65 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B004.Data.entryAt ⟨101, by decide +kernel⟩

def target65 : Weights.Entry :=
  { word := [4, 8, 12, 10, 8, 12, 12], weights := [1, 1, 1, 1] }

-- Period 7, original row 4057, representative 633.
def source66 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B004.Data.entryAt ⟨109, by decide +kernel⟩

def target66 : Weights.Entry :=
  { word := [4, 12, 8, 8, 1, 12, 12], weights := [1, 0, 1, 1] }

-- Period 7, original row 4066, representative 631.
def source67 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B004.Data.entryAt ⟨107, by decide +kernel⟩

def target67 : Weights.Entry :=
  { word := [4, 12, 8, 8, 9, 12, 12], weights := [1, 0, 1, 1] }

-- Period 7, original row 4144, representative 647.
def source68 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B004.Data.entryAt ⟨123, by decide +kernel⟩

def target68 : Weights.Entry :=
  { word := [8, 0, 1, 4, 8, 12, 12], weights := [1, 0, 0, 1] }

-- Period 7, original row 4180, representative 650.
def source69 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B004.Data.entryAt ⟨126, by decide +kernel⟩

def target69 : Weights.Entry :=
  { word := [8, 0, 1, 12, 8, 12, 12], weights := [1, 0, 1, 0] }

-- Period 7, original row 4524, representative 530.
def source70 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B004.Data.entryAt ⟨6, by decide +kernel⟩

def target70 : Weights.Entry :=
  { word := [8, 1, 4, 2, 0, 8, 9], weights := [1, 0, 0, 1] }

-- Period 7, original row 4525, representative 562.
def source71 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B004.Data.entryAt ⟨38, by decide +kernel⟩

def target71 : Weights.Entry :=
  { word := [8, 1, 4, 2, 0, 8, 10], weights := [1, 0, 0, 1] }

-- Period 7, original row 4552, representative 533.
def source72 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B004.Data.entryAt ⟨9, by decide +kernel⟩

def target72 : Weights.Entry :=
  { word := [8, 1, 4, 10, 0, 8, 9], weights := [1, 0, 0, 1] }

-- Period 7, original row 4553, representative 569.
def source73 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B004.Data.entryAt ⟨45, by decide +kernel⟩

def target73 : Weights.Entry :=
  { word := [8, 1, 4, 10, 0, 8, 10], weights := [1, 0, 0, 1] }

-- Period 7, original row 4613, representative 531.
def source74 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B004.Data.entryAt ⟨7, by decide +kernel⟩

def target74 : Weights.Entry :=
  { word := [8, 1, 12, 2, 0, 8, 9], weights := [1, 0, 0, 1] }

-- Period 7, original row 4614, representative 567.
def source75 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B004.Data.entryAt ⟨43, by decide +kernel⟩

def target75 : Weights.Entry :=
  { word := [8, 1, 12, 2, 0, 8, 10], weights := [1, 0, 0, 1] }

-- Period 7, original row 4639, representative 524.
def source76 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B004.Data.entryAt ⟨0, by decide +kernel⟩

def target76 : Weights.Entry :=
  { word := [8, 1, 12, 10, 0, 4, 10], weights := [1, 0, 1, 1] }

-- Period 7, original row 4645, representative 532.
def source77 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B004.Data.entryAt ⟨8, by decide +kernel⟩

def target77 : Weights.Entry :=
  { word := [8, 1, 12, 10, 0, 8, 9], weights := [1, 0, 0, 1] }

-- Period 7, original row 4646, representative 568.
def source78 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B004.Data.entryAt ⟨44, by decide +kernel⟩

def target78 : Weights.Entry :=
  { word := [8, 1, 12, 10, 0, 8, 10], weights := [1, 0, 0, 1] }

-- Period 7, original row 4845, representative 608.
def source79 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B004.Data.entryAt ⟨84, by decide +kernel⟩

def target79 : Weights.Entry :=
  { word := [8, 2, 2, 10, 8, 12, 10], weights := [1, 1, 1, 1] }

-- Period 7, original row 5000, representative 607.
def source80 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B004.Data.entryAt ⟨83, by decide +kernel⟩

def target80 : Weights.Entry :=
  { word := [8, 2, 10, 10, 8, 12, 10], weights := [1, 1, 1, 1] }

-- Period 7, original row 5023, representative 639.
def source81 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B004.Data.entryAt ⟨115, by decide +kernel⟩

def target81 : Weights.Entry :=
  { word := [8, 4, 0, 4, 8, 12, 12], weights := [1, 0, 0, 1] }

-- Period 7, original row 5059, representative 646.
def source82 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B004.Data.entryAt ⟨122, by decide +kernel⟩

def target82 : Weights.Entry :=
  { word := [8, 4, 0, 12, 8, 12, 12], weights := [1, 0, 1, 0] }

-- Period 7, original row 5181, representative 637.
def source83 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B004.Data.entryAt ⟨113, by decide +kernel⟩

def target83 : Weights.Entry :=
  { word := [8, 4, 8, 4, 8, 12, 10], weights := [1, 0, 1, 0] }

-- Period 7, original row 5182, representative 644.
def source84 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B004.Data.entryAt ⟨120, by decide +kernel⟩

def target84 : Weights.Entry :=
  { word := [8, 4, 8, 4, 8, 12, 12], weights := [1, 0, 0, 1] }

-- Period 7, original row 5223, representative 638.
def source85 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B004.Data.entryAt ⟨114, by decide +kernel⟩

def target85 : Weights.Entry :=
  { word := [8, 4, 8, 12, 8, 12, 10], weights := [1, 0, 1, 0] }

-- Period 7, original row 5224, representative 645.
def source86 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B004.Data.entryAt ⟨121, by decide +kernel⟩

def target86 : Weights.Entry :=
  { word := [8, 4, 8, 12, 8, 12, 12], weights := [1, 0, 1, 0] }

-- Period 7, original row 5310, representative 609.
def source87 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B004.Data.entryAt ⟨85, by decide +kernel⟩

def target87 : Weights.Entry :=
  { word := [8, 6, 8, 12, 8, 12, 10], weights := [1, 1, 1, 1] }

-- Period 7, original row 5366, representative 651.
def source88 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B004.Data.entryAt ⟨127, by decide +kernel⟩

def target88 : Weights.Entry :=
  { word := [8, 8, 0, 4, 8, 12, 12], weights := [1, 0, 0, 1] }

-- Period 7, original row 5465, representative 648.
def source89 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B004.Data.entryAt ⟨124, by decide +kernel⟩

def target89 : Weights.Entry :=
  { word := [8, 8, 1, 4, 8, 12, 12], weights := [1, 0, 0, 1] }

-- Period 7, original row 5501, representative 649.
def source90 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B004.Data.entryAt ⟨125, by decide +kernel⟩

def target90 : Weights.Entry :=
  { word := [8, 8, 1, 12, 8, 12, 12], weights := [1, 0, 1, 0] }

-- Period 7, original row 5876, representative 530.
def source91 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B004.Data.entryAt ⟨6, by decide +kernel⟩

def target91 : Weights.Entry :=
  { word := [8, 9, 0, 4, 2, 0, 9], weights := [1, 0, 0, 1] }

def points91 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 5877, representative 530.
def source92 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B004.Data.entryAt ⟨6, by decide +kernel⟩

def target92 : Weights.Entry :=
  { word := [8, 9, 0, 4, 2, 0, 10], weights := [1, 0, 0, 1] }

def points92 : List (ℕ × ℕ) := [(0, 1), (1, 2), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 5882, representative 526.
def source93 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B004.Data.entryAt ⟨2, by decide +kernel⟩

def target93 : Weights.Entry :=
  { word := [8, 9, 0, 4, 2, 8, 10], weights := [1, 0, 1, 0] }

-- Period 7, original row 5902, representative 531.
def source94 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B004.Data.entryAt ⟨7, by decide +kernel⟩

def target94 : Weights.Entry :=
  { word := [8, 9, 0, 4, 10, 0, 9], weights := [1, 0, 0, 1] }

def points94 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 5903, representative 531.
def source95 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B004.Data.entryAt ⟨7, by decide +kernel⟩

def target95 : Weights.Entry :=
  { word := [8, 9, 0, 4, 10, 0, 10], weights := [1, 0, 0, 1] }

def points95 : List (ℕ × ℕ) := [(0, 1), (1, 2), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 5908, representative 527.
def source96 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B004.Data.entryAt ⟨3, by decide +kernel⟩

def target96 : Weights.Entry :=
  { word := [8, 9, 0, 4, 10, 8, 10], weights := [1, 0, 1, 0] }

-- Period 7, original row 5936, representative 533.
def source97 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B004.Data.entryAt ⟨9, by decide +kernel⟩

def target97 : Weights.Entry :=
  { word := [8, 9, 0, 12, 2, 0, 9], weights := [1, 0, 0, 1] }

def points97 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 5937, representative 533.
def source98 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B004.Data.entryAt ⟨9, by decide +kernel⟩

def target98 : Weights.Entry :=
  { word := [8, 9, 0, 12, 2, 0, 10], weights := [1, 0, 0, 1] }

def points98 : List (ℕ × ℕ) := [(0, 1), (1, 2), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 5942, representative 529.
def source99 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B004.Data.entryAt ⟨5, by decide +kernel⟩

def target99 : Weights.Entry :=
  { word := [8, 9, 0, 12, 2, 8, 10], weights := [1, 0, 1, 0] }

-- Period 7, original row 5961, representative 532.
def source100 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B004.Data.entryAt ⟨8, by decide +kernel⟩

def target100 : Weights.Entry :=
  { word := [8, 9, 0, 12, 10, 0, 9], weights := [1, 0, 0, 1] }

def points100 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 5962, representative 532.
def source101 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B004.Data.entryAt ⟨8, by decide +kernel⟩

def target101 : Weights.Entry :=
  { word := [8, 9, 0, 12, 10, 0, 10], weights := [1, 0, 0, 1] }

def points101 : List (ℕ × ℕ) := [(0, 1), (1, 2), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 5967, representative 528.
def source102 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B004.Data.entryAt ⟨4, by decide +kernel⟩

def target102 : Weights.Entry :=
  { word := [8, 9, 0, 12, 10, 8, 10], weights := [1, 0, 1, 0] }

-- Period 7, original row 6208, representative 606.
def source103 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B004.Data.entryAt ⟨82, by decide +kernel⟩

def target103 : Weights.Entry :=
  { word := [8, 10, 2, 10, 8, 12, 10], weights := [1, 1, 1, 1] }

-- Period 7, original row 6330, representative 605.
def source104 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B004.Data.entryAt ⟨81, by decide +kernel⟩

def target104 : Weights.Entry :=
  { word := [8, 10, 10, 10, 8, 12, 10], weights := [1, 1, 1, 1] }

-- Period 7, original row 6353, representative 640.
def source105 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B004.Data.entryAt ⟨116, by decide +kernel⟩

def target105 : Weights.Entry :=
  { word := [8, 12, 0, 4, 8, 12, 12], weights := [1, 0, 0, 1] }

-- Period 7, original row 6389, representative 643.
def source106 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B004.Data.entryAt ⟨119, by decide +kernel⟩

def target106 : Weights.Entry :=
  { word := [8, 12, 0, 12, 8, 12, 12], weights := [1, 0, 1, 0] }

-- Period 7, original row 6511, representative 635.
def source107 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B004.Data.entryAt ⟨111, by decide +kernel⟩

def target107 : Weights.Entry :=
  { word := [8, 12, 8, 4, 8, 12, 10], weights := [1, 0, 1, 0] }

-- Period 7, original row 6512, representative 641.
def source108 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B004.Data.entryAt ⟨117, by decide +kernel⟩

def target108 : Weights.Entry :=
  { word := [8, 12, 8, 4, 8, 12, 12], weights := [1, 0, 0, 1] }

-- Period 7, original row 6553, representative 636.
def source109 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B004.Data.entryAt ⟨112, by decide +kernel⟩

def target109 : Weights.Entry :=
  { word := [8, 12, 8, 12, 8, 12, 10], weights := [1, 0, 1, 0] }

-- Period 7, original row 6554, representative 642.
def source110 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B004.Data.entryAt ⟨118, by decide +kernel⟩

def target110 : Weights.Entry :=
  { word := [8, 12, 8, 12, 8, 12, 12], weights := [1, 0, 1, 0] }

-- Period 7, original row 6646, representative 647.
def source111 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B004.Data.entryAt ⟨123, by decide +kernel⟩

def target111 : Weights.Entry :=
  { word := [9, 0, 1, 4, 8, 12, 12], weights := [1, 0, 0, 1] }

def points111 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 6682, representative 650.
def source112 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B004.Data.entryAt ⟨126, by decide +kernel⟩

def target112 : Weights.Entry :=
  { word := [9, 0, 1, 12, 8, 12, 12], weights := [1, 0, 1, 0] }

def points112 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 7082, representative 648.
def source113 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B004.Data.entryAt ⟨124, by decide +kernel⟩

def target113 : Weights.Entry :=
  { word := [9, 8, 1, 4, 8, 12, 12], weights := [1, 0, 0, 1] }

def points113 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 7118, representative 649.
def source114 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B004.Data.entryAt ⟨125, by decide +kernel⟩

def target114 : Weights.Entry :=
  { word := [9, 8, 1, 12, 8, 12, 12], weights := [1, 0, 1, 0] }

def points114 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 7431, representative 554.
def source115 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B004.Data.entryAt ⟨30, by decide +kernel⟩

def target115 : Weights.Entry :=
  { word := [10, 0, 4, 2, 0, 8, 10], weights := [1, 0, 0, 1] }

-- Period 7, original row 7432, representative 554.
def source116 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B004.Data.entryAt ⟨30, by decide +kernel⟩

def target116 : Weights.Entry :=
  { word := [10, 0, 4, 2, 0, 8, 12], weights := [1, 0, 0, 1] }

def points116 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 7440, representative 555.
def source117 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B004.Data.entryAt ⟨31, by decide +kernel⟩

def target117 : Weights.Entry :=
  { word := [10, 0, 4, 2, 8, 8, 12], weights := [1, 0, 0, 1] }

-- Period 7, original row 7454, representative 561.
def source118 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B004.Data.entryAt ⟨37, by decide +kernel⟩

def target118 : Weights.Entry :=
  { word := [10, 0, 4, 10, 0, 8, 10], weights := [1, 0, 0, 1] }

-- Period 7, original row 7455, representative 561.
def source119 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B004.Data.entryAt ⟨37, by decide +kernel⟩

def target119 : Weights.Entry :=
  { word := [10, 0, 4, 10, 0, 8, 12], weights := [1, 0, 0, 1] }

def points119 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 7467, representative 558.
def source120 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B004.Data.entryAt ⟨34, by decide +kernel⟩

def target120 : Weights.Entry :=
  { word := [10, 0, 4, 10, 8, 8, 12], weights := [1, 0, 0, 1] }

-- Period 7, original row 7548, representative 559.
def source121 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B004.Data.entryAt ⟨35, by decide +kernel⟩

def target121 : Weights.Entry :=
  { word := [10, 0, 12, 2, 0, 8, 10], weights := [1, 0, 0, 1] }

-- Period 7, original row 7549, representative 559.
def source122 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B004.Data.entryAt ⟨35, by decide +kernel⟩

def target122 : Weights.Entry :=
  { word := [10, 0, 12, 2, 0, 8, 12], weights := [1, 0, 0, 1] }

def points122 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 7557, representative 556.
def source123 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B004.Data.entryAt ⟨32, by decide +kernel⟩

def target123 : Weights.Entry :=
  { word := [10, 0, 12, 2, 8, 8, 12], weights := [1, 0, 0, 1] }

-- Period 7, original row 7576, representative 560.
def source124 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B004.Data.entryAt ⟨36, by decide +kernel⟩

def target124 : Weights.Entry :=
  { word := [10, 0, 12, 10, 0, 8, 10], weights := [1, 0, 0, 1] }

-- Period 7, original row 7577, representative 560.
def source125 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B004.Data.entryAt ⟨36, by decide +kernel⟩

def target125 : Weights.Entry :=
  { word := [10, 0, 12, 10, 0, 8, 12], weights := [1, 0, 0, 1] }

def points125 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 7589, representative 557.
def source126 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B004.Data.entryAt ⟨33, by decide +kernel⟩

def target126 : Weights.Entry :=
  { word := [10, 0, 12, 10, 8, 8, 12], weights := [1, 0, 0, 1] }

-- Period 7, original row 7636, representative 524.
def source127 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B004.Data.entryAt ⟨0, by decide +kernel⟩

def target127 : Weights.Entry :=
  { word := [10, 2, 0, 12, 10, 0, 10], weights := [1, 1, 0, 1] }

def points127 : List (ℕ × ℕ) := [(0, 1), (1, 2), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

def period7Entries : List Weights.Entry := [target0, target1, target2, target3, target4, target5, target6, target7, target8, target9, target10, target11, target12, target13, target14, target15, target16, target17, target18, target19, target20, target21, target22, target23, target24, target25, target26, target27, target28, target29, target30, target31, target32, target33, target34, target35, target36, target37, target38, target39, target40, target41, target42, target43, target44, target45, target46, target47, target48, target49, target50, target51, target52, target53, target54, target55, target56, target57, target58, target59, target60, target61, target62, target63, target64, target65, target66, target67, target68, target69, target70, target71, target72, target73, target74, target75, target76, target77, target78, target79, target80, target81, target82, target83, target84, target85, target86, target87, target88, target89, target90, target91, target92, target93, target94, target95, target96, target97, target98, target99, target100, target101, target102, target103, target104, target105, target106, target107, target108, target109, target110, target111, target112, target113, target114, target115, target116, target117, target118, target119, target120, target121, target122, target123, target124, target125, target126, target127]

def period7Chunk : RowCoverage.Chunk where
  rows := [⟨189, target0⟩, ⟨282, target1⟩, ⟨364, target2⟩, ⟨381, target3⟩, ⟨409, target4⟩, ⟨462, target5⟩, ⟨483, target6⟩, ⟨504, target7⟩, ⟨765, target8⟩, ⟨776, target9⟩, ⟨792, target10⟩, ⟨1407, target11⟩, ⟨1435, target12⟩, ⟨1482, target13⟩, ⟨1503, target14⟩, ⟨2390, target15⟩, ⟨2394, target16⟩, ⟨2404, target17⟩, ⟨2445, target18⟩, ⟨2446, target19⟩, ⟨2454, target20⟩, ⟨2475, target21⟩, ⟨2479, target22⟩, ⟨2483, target23⟩, ⟨2496, target24⟩, ⟨2497, target25⟩, ⟨2505, target26⟩, ⟨2516, target27⟩, ⟨2517, target28⟩, ⟨2521, target29⟩, ⟨2567, target30⟩, ⟨2568, target31⟩, ⟨2576, target32⟩, ⟨2830, target33⟩, ⟨2856, target34⟩, ⟨2881, target35⟩, ⟨2948, target36⟩, ⟨2997, target37⟩, ⟨2998, target38⟩, ⟨3023, target39⟩, ⟨3024, target40⟩, ⟨3028, target41⟩, ⟨3041, target42⟩, ⟨3042, target43⟩, ⟨3070, target44⟩, ⟨3071, target45⟩, ⟨3098, target46⟩, ⟨3099, target47⟩, ⟨3103, target48⟩, ⟨3158, target49⟩, ⟨3349, target50⟩, ⟨3400, target51⟩, ⟨3404, target52⟩, ⟨3414, target53⟩, ⟨3461, target54⟩, ⟨3469, target55⟩, ⟨3491, target56⟩, ⟨3495, target57⟩, ⟨3554, target58⟩, ⟨3562, target59⟩, ⟨3692, target60⟩, ⟨3701, target61⟩, ⟨3748, target62⟩, ⟨3791, target63⟩, ⟨3862, target64⟩, ⟨3970, target65⟩, ⟨4057, target66⟩, ⟨4066, target67⟩, ⟨4144, target68⟩, ⟨4180, target69⟩, ⟨4524, target70⟩, ⟨4525, target71⟩, ⟨4552, target72⟩, ⟨4553, target73⟩, ⟨4613, target74⟩, ⟨4614, target75⟩, ⟨4639, target76⟩, ⟨4645, target77⟩, ⟨4646, target78⟩, ⟨4845, target79⟩, ⟨5000, target80⟩, ⟨5023, target81⟩, ⟨5059, target82⟩, ⟨5181, target83⟩, ⟨5182, target84⟩, ⟨5223, target85⟩, ⟨5224, target86⟩, ⟨5310, target87⟩, ⟨5366, target88⟩, ⟨5465, target89⟩, ⟨5501, target90⟩, ⟨5876, target91⟩, ⟨5877, target92⟩, ⟨5882, target93⟩, ⟨5902, target94⟩, ⟨5903, target95⟩, ⟨5908, target96⟩, ⟨5936, target97⟩, ⟨5937, target98⟩, ⟨5942, target99⟩, ⟨5961, target100⟩, ⟨5962, target101⟩, ⟨5967, target102⟩, ⟨6208, target103⟩, ⟨6330, target104⟩, ⟨6353, target105⟩, ⟨6389, target106⟩, ⟨6511, target107⟩, ⟨6512, target108⟩, ⟨6553, target109⟩, ⟨6554, target110⟩, ⟨6646, target111⟩, ⟨6682, target112⟩, ⟨7082, target113⟩, ⟨7118, target114⟩, ⟨7431, target115⟩, ⟨7432, target116⟩, ⟨7440, target117⟩, ⟨7454, target118⟩, ⟨7455, target119⟩, ⟨7467, target120⟩, ⟨7548, target121⟩, ⟨7549, target122⟩, ⟨7557, target123⟩, ⟨7576, target124⟩, ⟨7577, target125⟩, ⟨7589, target126⟩, ⟨7636, target127⟩]
  indexMask := 4624309467187137385146693286240052299859546403033893087896245026754367751967519848538241167588491672127040625350477333202848673471402423549163014623505611915817489434434383191859827544592941112037167927406644941406336973523314558468262989512155599330470564688365287252980711204683304688543735976222315958648037205766099443542193396831470239970185546934731077130682914363591162667778425476437856054182982153476111627643263541219688991263634867408739307799883807595151114727368810540402462202037997429175835093930004490901089103357268569375277231439020544498654310302101885492727319062687179163038054570807980946535421067156002707190052205651036619241917269706792301119913290751345847626085591878145734235136173422192533672766168594249471603177150892043928768261568702639888985922801157560328417095364663886834239858528579436137554003527253095014019064264143706592170772086166845097627972986173291342814569040951645685546370390023921634083368418808424863191556450949538988078145538882358846653532659022701584718070901552952068905352598565123059189789688368660353007974332335200202697218623334099213495416566344094478174187512633721204019106640673368686811125636285631941229551525986546908331668049173425107574913110902266644383717880822484564124589646636072412541682159346630075975560098400338888236971905307143262566357653165422088726535184915926708359197461439186902551042455007618363000192065690077482988750957736573077282726490212538214806278821124215002485981990370074987200785417644862128772001347652422206443391580713498326612683501808113311243475204622214657794612468792223146446721759646737009515831482951375231103725861725385128280689651806910067477760765101057970280251293211954774590731590801822641946766342517389789086612211106105532975065937096133945021232359932887861876112430614842927025753136609713657174094723919672246592354359759111742136842009093147443650347741836183488541216248787002850317070073555261465972096059699549684993248834401087116079109573415698475263907468060250643795226989128592577495020232640249737013993521535779337521903126060222846272344255055776030485739153931953445532051597507285816487914467223892968443956265663002379931578301607518224963723871193532668941786047834885006344267007856541995649580313761664951726681717781802794080807423621522701137894512263168
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

end FranklSmallCyclic.TransportBatches.G004.B000.Data
