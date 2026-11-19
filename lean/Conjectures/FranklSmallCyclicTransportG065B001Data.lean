module

public import Conjectures.FranklSmallCyclicRowCoverage
public import Conjectures.FranklSmallCyclicCanonicalWords
public import Conjectures.FranklSmallCyclicOrbit9Block012Data

/-! 128 literal targets sharing one source proof block.
Original words and row indices are retained; weights may be transported.
-/
@[expose] public section

namespace FranklSmallCyclic.TransportBatches.G065.B001.Data

-- Period 9, original row 2690, representative 8305.
def source0 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B012.Data.entryAt ⟨18, by decide +kernel⟩

def target0 : Weights.Entry :=
  { word := [2, 2, 8, 9, 0, 12, 0], weights := [0, 1, 1, 0] }

def points0 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 2691, representative 8303.
def source1 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B012.Data.entryAt ⟨16, by decide +kernel⟩

def target1 : Weights.Entry :=
  { word := [2, 2, 8, 9, 0, 12, 8], weights := [1, 1, 2, 0] }

-- Period 9, original row 2692, representative 8290.
def source2 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B012.Data.entryAt ⟨3, by decide +kernel⟩

def target2 : Weights.Entry :=
  { word := [2, 2, 8, 9, 8, 1, 4], weights := [1, 1, 0, 1] }

def points2 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 2694, representative 8289.
def source3 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B012.Data.entryAt ⟨2, by decide +kernel⟩

def target3 : Weights.Entry :=
  { word := [2, 2, 8, 9, 8, 2, 2], weights := [1, 1, 0, 1] }

-- Period 9, original row 2696, representative 8293.
def source4 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B012.Data.entryAt ⟨6, by decide +kernel⟩

def target4 : Weights.Entry :=
  { word := [2, 2, 8, 9, 8, 8, 4], weights := [1, 1, 0, 1] }

-- Period 9, original row 2704, representative 8387.
def source5 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B012.Data.entryAt ⟨100, by decide +kernel⟩

def target5 : Weights.Entry :=
  { word := [2, 2, 8, 10, 0, 1, 8], weights := [1, 0, 0, 1] }

-- Period 9, original row 2706, representative 8387.
def source6 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B012.Data.entryAt ⟨100, by decide +kernel⟩

def target6 : Weights.Entry :=
  { word := [2, 2, 8, 10, 0, 2, 8], weights := [1, 0, 0, 1] }

def points6 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 8), (8, 7)]

-- Period 9, original row 2707, representative 8355.
def source7 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B012.Data.entryAt ⟨68, by decide +kernel⟩

def target7 : Weights.Entry :=
  { word := [2, 2, 8, 10, 0, 6, 0], weights := [1, 0, 1, 0] }

def points7 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 2709, representative 8312.
def source8 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B012.Data.entryAt ⟨25, by decide +kernel⟩

def target8 : Weights.Entry :=
  { word := [2, 2, 8, 10, 0, 8, 1], weights := [0, 1, 0, 1] }

def points8 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 2712, representative 8389.
def source9 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B012.Data.entryAt ⟨102, by decide +kernel⟩

def target9 : Weights.Entry :=
  { word := [2, 2, 8, 10, 0, 8, 8], weights := [1, 0, 0, 1] }

-- Period 9, original row 2717, representative 8384.
def source10 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B012.Data.entryAt ⟨97, by decide +kernel⟩

def target10 : Weights.Entry :=
  { word := [2, 2, 8, 10, 0, 9, 8], weights := [1, 0, 0, 1] }

-- Period 9, original row 2719, representative 8384.
def source11 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B012.Data.entryAt ⟨97, by decide +kernel⟩

def target11 : Weights.Entry :=
  { word := [2, 2, 8, 10, 0, 10, 8], weights := [1, 0, 0, 1] }

def points11 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 8), (8, 7)]

-- Period 9, original row 2720, representative 8356.
def source12 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B012.Data.entryAt ⟨69, by decide +kernel⟩

def target12 : Weights.Entry :=
  { word := [2, 2, 8, 10, 0, 12, 0], weights := [1, 0, 1, 0] }

def points12 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 2724, representative 8386.
def source13 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B012.Data.entryAt ⟨99, by decide +kernel⟩

def target13 : Weights.Entry :=
  { word := [2, 2, 8, 10, 8, 2, 8], weights := [1, 0, 0, 1] }

-- Period 9, original row 2725, representative 8354.
def source14 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B012.Data.entryAt ⟨67, by decide +kernel⟩

def target14 : Weights.Entry :=
  { word := [2, 2, 8, 10, 8, 6, 0], weights := [1, 0, 1, 0] }

def points14 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 2726, representative 8337.
def source15 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B012.Data.entryAt ⟨50, by decide +kernel⟩

def target15 : Weights.Entry :=
  { word := [2, 2, 8, 10, 8, 6, 8], weights := [1, 1, 1, 1] }

-- Period 9, original row 2730, representative 8383.
def source16 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B012.Data.entryAt ⟨96, by decide +kernel⟩

def target16 : Weights.Entry :=
  { word := [2, 2, 8, 10, 8, 10, 8], weights := [1, 0, 0, 1] }

-- Period 9, original row 2731, representative 8345.
def source17 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B012.Data.entryAt ⟨58, by decide +kernel⟩

def target17 : Weights.Entry :=
  { word := [2, 2, 8, 12, 0, 4, 8], weights := [1, 0, 2, 0] }

-- Period 9, original row 2732, representative 8341.
def source18 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B012.Data.entryAt ⟨54, by decide +kernel⟩

def target18 : Weights.Entry :=
  { word := [2, 2, 8, 12, 0, 12, 8], weights := [1, 0, 2, 0] }

-- Period 9, original row 2733, representative 8368.
def source19 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B012.Data.entryAt ⟨81, by decide +kernel⟩

def target19 : Weights.Entry :=
  { word := [2, 2, 8, 12, 2, 0, 1], weights := [1, 1, 0, 1] }

def points19 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 2735, representative 8288.
def source20 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B012.Data.entryAt ⟨1, by decide +kernel⟩

def target20 : Weights.Entry :=
  { word := [2, 2, 8, 12, 2, 0, 4], weights := [1, 1, 0, 1] }

def points20 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 2736, representative 8403.
def source21 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B012.Data.entryAt ⟨116, by decide +kernel⟩

def target21 : Weights.Entry :=
  { word := [2, 2, 8, 12, 2, 0, 8], weights := [1, 1, 1, 0] }

-- Period 9, original row 2741, representative 8401.
def source22 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B012.Data.entryAt ⟨114, by decide +kernel⟩

def target22 : Weights.Entry :=
  { word := [2, 2, 8, 12, 2, 8, 8], weights := [1, 1, 1, 1] }

-- Period 9, original row 2743, representative 8353.
def source23 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B012.Data.entryAt ⟨66, by decide +kernel⟩

def target23 : Weights.Entry :=
  { word := [2, 2, 8, 12, 4, 4, 0], weights := [1, 0, 1, 0] }

def points23 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 2744, representative 8336.
def source24 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B012.Data.entryAt ⟨49, by decide +kernel⟩

def target24 : Weights.Entry :=
  { word := [2, 2, 8, 12, 4, 4, 8], weights := [1, 1, 1, 1] }

-- Period 9, original row 2745, representative 8349.
def source25 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B012.Data.entryAt ⟨62, by decide +kernel⟩

def target25 : Weights.Entry :=
  { word := [2, 2, 8, 12, 4, 12, 0], weights := [1, 0, 1, 0] }

def points25 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 2746, representative 8334.
def source26 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B012.Data.entryAt ⟨47, by decide +kernel⟩

def target26 : Weights.Entry :=
  { word := [2, 2, 8, 12, 4, 12, 8], weights := [1, 1, 1, 1] }

-- Period 9, original row 2747, representative 8344.
def source27 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B012.Data.entryAt ⟨57, by decide +kernel⟩

def target27 : Weights.Entry :=
  { word := [2, 2, 8, 12, 8, 4, 8], weights := [1, 0, 2, 0] }

-- Period 9, original row 2748, representative 8340.
def source28 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B012.Data.entryAt ⟨53, by decide +kernel⟩

def target28 : Weights.Entry :=
  { word := [2, 2, 8, 12, 8, 12, 8], weights := [1, 0, 2, 0] }

-- Period 9, original row 2749, representative 8367.
def source29 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B012.Data.entryAt ⟨80, by decide +kernel⟩

def target29 : Weights.Entry :=
  { word := [2, 2, 8, 12, 10, 0, 1], weights := [1, 1, 0, 1] }

def points29 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 2751, representative 8287.
def source30 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B012.Data.entryAt ⟨0, by decide +kernel⟩

def target30 : Weights.Entry :=
  { word := [2, 2, 8, 12, 10, 0, 4], weights := [1, 1, 0, 1] }

def points30 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 2752, representative 8402.
def source31 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B012.Data.entryAt ⟨115, by decide +kernel⟩

def target31 : Weights.Entry :=
  { word := [2, 2, 8, 12, 10, 0, 8], weights := [1, 1, 1, 0] }

-- Period 9, original row 2758, representative 8400.
def source32 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B012.Data.entryAt ⟨113, by decide +kernel⟩

def target32 : Weights.Entry :=
  { word := [2, 2, 8, 12, 10, 8, 8], weights := [1, 1, 1, 1] }

-- Period 9, original row 2761, representative 8351.
def source33 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B012.Data.entryAt ⟨64, by decide +kernel⟩

def target33 : Weights.Entry :=
  { word := [2, 2, 8, 12, 12, 4, 0], weights := [1, 0, 1, 0] }

def points33 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 2762, representative 8335.
def source34 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B012.Data.entryAt ⟨48, by decide +kernel⟩

def target34 : Weights.Entry :=
  { word := [2, 2, 8, 12, 12, 4, 8], weights := [1, 1, 1, 1] }

-- Period 9, original row 2763, representative 8347.
def source35 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B012.Data.entryAt ⟨60, by decide +kernel⟩

def target35 : Weights.Entry :=
  { word := [2, 2, 8, 12, 12, 12, 0], weights := [1, 0, 1, 0] }

def points35 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 2764, representative 8333.
def source36 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B012.Data.entryAt ⟨46, by decide +kernel⟩

def target36 : Weights.Entry :=
  { word := [2, 2, 8, 12, 12, 12, 8], weights := [1, 1, 1, 1] }

-- Period 9, original row 2765, representative 8298.
def source37 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B012.Data.entryAt ⟨11, by decide +kernel⟩

def target37 : Weights.Entry :=
  { word := [2, 2, 10, 8, 0, 4, 0], weights := [1, 0, 1, 0] }

def points37 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 2766, representative 8410.
def source38 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B012.Data.entryAt ⟨123, by decide +kernel⟩

def target38 : Weights.Entry :=
  { word := [2, 2, 10, 8, 0, 8, 0], weights := [1, 0, 1, 0] }

def points38 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 2767, representative 8296.
def source39 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B012.Data.entryAt ⟨9, by decide +kernel⟩

def target39 : Weights.Entry :=
  { word := [2, 2, 10, 8, 0, 12, 0], weights := [1, 0, 1, 0] }

def points39 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 2768, representative 8362.
def source40 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B012.Data.entryAt ⟨75, by decide +kernel⟩

def target40 : Weights.Entry :=
  { word := [2, 2, 10, 8, 1, 0, 1], weights := [1, 1, 0, 1] }

def points40 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 2771, representative 8395.
def source41 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B012.Data.entryAt ⟨108, by decide +kernel⟩

def target41 : Weights.Entry :=
  { word := [2, 2, 10, 8, 1, 0, 8], weights := [1, 1, 0, 1] }

-- Period 9, original row 2775, representative 8360.
def source42 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B012.Data.entryAt ⟨73, by decide +kernel⟩

def target42 : Weights.Entry :=
  { word := [2, 2, 10, 8, 1, 8, 1], weights := [1, 1, 1, 1] }

def points42 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 2776, representative 8393.
def source43 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B012.Data.entryAt ⟨106, by decide +kernel⟩

def target43 : Weights.Entry :=
  { word := [2, 2, 10, 8, 1, 8, 8], weights := [1, 1, 1, 1] }

-- Period 9, original row 2778, representative 8406.
def source44 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B012.Data.entryAt ⟨119, by decide +kernel⟩

def target44 : Weights.Entry :=
  { word := [2, 2, 10, 8, 2, 8, 0], weights := [1, 0, 1, 0] }

def points44 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 2779, representative 8297.
def source45 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B012.Data.entryAt ⟨10, by decide +kernel⟩

def target45 : Weights.Entry :=
  { word := [2, 2, 10, 8, 8, 4, 0], weights := [1, 0, 1, 0] }

def points45 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 2780, representative 8409.
def source46 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B012.Data.entryAt ⟨122, by decide +kernel⟩

def target46 : Weights.Entry :=
  { word := [2, 2, 10, 8, 8, 8, 0], weights := [1, 0, 1, 0] }

def points46 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 2781, representative 8295.
def source47 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B012.Data.entryAt ⟨8, by decide +kernel⟩

def target47 : Weights.Entry :=
  { word := [2, 2, 10, 8, 8, 12, 0], weights := [1, 0, 1, 0] }

def points47 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 2782, representative 8361.
def source48 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B012.Data.entryAt ⟨74, by decide +kernel⟩

def target48 : Weights.Entry :=
  { word := [2, 2, 10, 8, 9, 0, 1], weights := [1, 1, 0, 1] }

def points48 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 2785, representative 8394.
def source49 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B012.Data.entryAt ⟨107, by decide +kernel⟩

def target49 : Weights.Entry :=
  { word := [2, 2, 10, 8, 9, 0, 8], weights := [1, 1, 0, 1] }

-- Period 9, original row 2789, representative 8359.
def source50 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B012.Data.entryAt ⟨72, by decide +kernel⟩

def target50 : Weights.Entry :=
  { word := [2, 2, 10, 8, 9, 8, 1], weights := [1, 1, 1, 1] }

def points50 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 2790, representative 8392.
def source51 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B012.Data.entryAt ⟨105, by decide +kernel⟩

def target51 : Weights.Entry :=
  { word := [2, 2, 10, 8, 9, 8, 8], weights := [1, 1, 1, 1] }

-- Period 9, original row 2792, representative 8405.
def source52 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B012.Data.entryAt ⟨118, by decide +kernel⟩

def target52 : Weights.Entry :=
  { word := [2, 2, 10, 8, 10, 8, 0], weights := [1, 0, 1, 0] }

def points52 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 3015, representative 8294.
def source53 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B012.Data.entryAt ⟨7, by decide +kernel⟩

def target53 : Weights.Entry :=
  { word := [2, 8, 8, 8, 1, 4, 2], weights := [1, 0, 1, 1] }

def points53 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 3016, representative 8294.
def source54 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B012.Data.entryAt ⟨7, by decide +kernel⟩

def target54 : Weights.Entry :=
  { word := [2, 8, 8, 8, 1, 4, 4], weights := [1, 0, 1, 1] }

def points54 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 3025, representative 8293.
def source55 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B012.Data.entryAt ⟨6, by decide +kernel⟩

def target55 : Weights.Entry :=
  { word := [2, 8, 8, 8, 9, 4, 4], weights := [1, 0, 1, 1] }

def points55 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 3568, representative 8314.
def source56 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B012.Data.entryAt ⟨27, by decide +kernel⟩

def target56 : Weights.Entry :=
  { word := [4, 2, 0, 9, 0, 4, 0], weights := [1, 0, 1, 0] }

def points56 : List (ℕ × ℕ) := [(0, 1), (1, 7), (2, 8), (3, 5), (4, 6), (5, 3), (6, 4), (7, 2), (8, 0)]

-- Period 9, original row 3569, representative 8308.
def source57 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B012.Data.entryAt ⟨21, by decide +kernel⟩

def target57 : Weights.Entry :=
  { word := [4, 2, 0, 9, 0, 4, 8], weights := [1, 1, 2, 0] }

def points57 : List (ℕ × ℕ) := [(0, 0), (1, 2), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 3571, representative 8313.
def source58 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B012.Data.entryAt ⟨26, by decide +kernel⟩

def target58 : Weights.Entry :=
  { word := [4, 2, 0, 9, 0, 12, 0], weights := [1, 0, 1, 0] }

def points58 : List (ℕ × ℕ) := [(0, 1), (1, 7), (2, 8), (3, 5), (4, 6), (5, 3), (6, 4), (7, 2), (8, 0)]

-- Period 9, original row 3572, representative 8307.
def source59 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B012.Data.entryAt ⟨20, by decide +kernel⟩

def target59 : Weights.Entry :=
  { word := [4, 2, 0, 9, 0, 12, 8], weights := [1, 1, 2, 0] }

def points59 : List (ℕ × ℕ) := [(0, 0), (1, 2), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 3573, representative 8292.
def source60 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B012.Data.entryAt ⟨5, by decide +kernel⟩

def target60 : Weights.Entry :=
  { word := [4, 2, 0, 9, 8, 1, 4], weights := [1, 1, 0, 1] }

def points60 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 3575, representative 8291.
def source61 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B012.Data.entryAt ⟨4, by decide +kernel⟩

def target61 : Weights.Entry :=
  { word := [4, 2, 0, 9, 8, 2, 2], weights := [1, 1, 0, 1] }

def points61 : List (ℕ × ℕ) := [(0, 0), (1, 2), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 3577, representative 8294.
def source62 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B012.Data.entryAt ⟨7, by decide +kernel⟩

def target62 : Weights.Entry :=
  { word := [4, 2, 0, 9, 8, 8, 4], weights := [1, 1, 0, 1] }

def points62 : List (ℕ × ℕ) := [(0, 0), (1, 2), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 3584, representative 8314.
def source63 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B012.Data.entryAt ⟨27, by decide +kernel⟩

def target63 : Weights.Entry :=
  { word := [4, 2, 0, 10, 0, 0, 1], weights := [1, 0, 0, 1] }

def points63 : List (ℕ × ℕ) := [(0, 1), (1, 7), (2, 8), (3, 6), (4, 5), (5, 3), (6, 4), (7, 2), (8, 0)]

-- Period 9, original row 3587, representative 8391.
def source64 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B012.Data.entryAt ⟨104, by decide +kernel⟩

def target64 : Weights.Entry :=
  { word := [4, 2, 0, 10, 0, 0, 8], weights := [1, 1, 0, 0] }

def points64 : List (ℕ × ℕ) := [(0, 0), (1, 2), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 3592, representative 8313.
def source65 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B012.Data.entryAt ⟨26, by decide +kernel⟩

def target65 : Weights.Entry :=
  { word := [4, 2, 0, 10, 0, 8, 1], weights := [1, 0, 0, 1] }

def points65 : List (ℕ × ℕ) := [(0, 1), (1, 7), (2, 8), (3, 6), (4, 5), (5, 3), (6, 4), (7, 2), (8, 0)]

-- Period 9, original row 3594, representative 8390.
def source66 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B012.Data.entryAt ⟨103, by decide +kernel⟩

def target66 : Weights.Entry :=
  { word := [4, 2, 0, 10, 0, 8, 8], weights := [1, 0, 0, 1] }

def points66 : List (ℕ × ℕ) := [(0, 0), (1, 2), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 3601, representative 8369.
def source67 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B012.Data.entryAt ⟨82, by decide +kernel⟩

def target67 : Weights.Entry :=
  { word := [4, 2, 0, 12, 10, 0, 1], weights := [1, 1, 0, 1] }

def points67 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 3603, representative 8292.
def source68 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B012.Data.entryAt ⟨5, by decide +kernel⟩

def target68 : Weights.Entry :=
  { word := [4, 2, 0, 12, 10, 0, 4], weights := [1, 1, 0, 1] }

def points68 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 7), (3, 4), (4, 5), (5, 6), (6, 3), (7, 0), (8, 8)]

-- Period 9, original row 3604, representative 8404.
def source69 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B012.Data.entryAt ⟨117, by decide +kernel⟩

def target69 : Weights.Entry :=
  { word := [4, 2, 0, 12, 10, 0, 8], weights := [1, 1, 0, 1] }

def points69 : List (ℕ × ℕ) := [(0, 0), (1, 2), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 3608, representative 8369.
def source70 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B012.Data.entryAt ⟨82, by decide +kernel⟩

def target70 : Weights.Entry :=
  { word := [4, 2, 0, 12, 12, 4, 0], weights := [1, 1, 1, 0] }

def points70 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 5), (4, 6), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 3610, representative 8370.
def source71 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B012.Data.entryAt ⟨83, by decide +kernel⟩

def target71 : Weights.Entry :=
  { word := [4, 2, 8, 2, 0, 1, 8], weights := [1, 0, 0, 1] }

-- Period 9, original row 3612, representative 8370.
def source72 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B012.Data.entryAt ⟨83, by decide +kernel⟩

def target72 : Weights.Entry :=
  { word := [4, 2, 8, 2, 0, 2, 8], weights := [1, 0, 0, 1] }

def points72 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 8), (8, 7)]

-- Period 9, original row 3614, representative 8309.
def source73 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B012.Data.entryAt ⟨22, by decide +kernel⟩

def target73 : Weights.Entry :=
  { word := [4, 2, 8, 2, 0, 8, 1], weights := [1, 0, 0, 1] }

def points73 : List (ℕ × ℕ) := [(0, 1), (1, 7), (2, 8), (3, 6), (4, 5), (5, 3), (6, 4), (7, 2), (8, 0)]

-- Period 9, original row 3617, representative 8378.
def source74 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B012.Data.entryAt ⟨91, by decide +kernel⟩

def target74 : Weights.Entry :=
  { word := [4, 2, 8, 2, 0, 8, 8], weights := [1, 0, 0, 1] }

-- Period 9, original row 3622, representative 8371.
def source75 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B012.Data.entryAt ⟨84, by decide +kernel⟩

def target75 : Weights.Entry :=
  { word := [4, 2, 8, 2, 0, 9, 8], weights := [1, 0, 0, 1] }

-- Period 9, original row 3624, representative 8371.
def source76 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B012.Data.entryAt ⟨84, by decide +kernel⟩

def target76 : Weights.Entry :=
  { word := [4, 2, 8, 2, 0, 10, 8], weights := [1, 0, 0, 1] }

def points76 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 8), (8, 7)]

-- Period 9, original row 3626, representative 8375.
def source77 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B012.Data.entryAt ⟨88, by decide +kernel⟩

def target77 : Weights.Entry :=
  { word := [4, 2, 8, 2, 8, 2, 8], weights := [1, 0, 0, 1] }

-- Period 9, original row 3630, representative 8372.
def source78 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B012.Data.entryAt ⟨85, by decide +kernel⟩

def target78 : Weights.Entry :=
  { word := [4, 2, 8, 2, 8, 10, 8], weights := [1, 0, 0, 1] }

-- Period 9, original row 3631, representative 8328.
def source79 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B012.Data.entryAt ⟨41, by decide +kernel⟩

def target79 : Weights.Entry :=
  { word := [4, 2, 8, 4, 4, 4, 0], weights := [1, 0, 1, 0] }

def points79 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 3632, representative 8324.
def source80 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B012.Data.entryAt ⟨37, by decide +kernel⟩

def target80 : Weights.Entry :=
  { word := [4, 2, 8, 4, 4, 12, 0], weights := [1, 0, 1, 0] }

def points80 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 3633, representative 8326.
def source81 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B012.Data.entryAt ⟨39, by decide +kernel⟩

def target81 : Weights.Entry :=
  { word := [4, 2, 8, 4, 12, 4, 0], weights := [1, 0, 1, 0] }

def points81 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 3634, representative 8322.
def source82 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B012.Data.entryAt ⟨35, by decide +kernel⟩

def target82 : Weights.Entry :=
  { word := [4, 2, 8, 4, 12, 12, 0], weights := [1, 0, 1, 0] }

def points82 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 3636, representative 8321.
def source83 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B012.Data.entryAt ⟨34, by decide +kernel⟩

def target83 : Weights.Entry :=
  { word := [4, 2, 8, 8, 4, 6, 0], weights := [0, 1, 1, 0] }

def points83 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 3639, representative 8320.
def source84 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B012.Data.entryAt ⟨33, by decide +kernel⟩

def target84 : Weights.Entry :=
  { word := [4, 2, 8, 8, 12, 6, 0], weights := [0, 1, 1, 0] }

def points84 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 3642, representative 8377.
def source85 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B012.Data.entryAt ⟨90, by decide +kernel⟩

def target85 : Weights.Entry :=
  { word := [4, 2, 8, 10, 0, 1, 8], weights := [1, 0, 0, 1] }

-- Period 9, original row 3644, representative 8377.
def source86 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B012.Data.entryAt ⟨90, by decide +kernel⟩

def target86 : Weights.Entry :=
  { word := [4, 2, 8, 10, 0, 2, 8], weights := [1, 0, 0, 1] }

def points86 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 8), (8, 7)]

-- Period 9, original row 3645, representative 8331.
def source87 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B012.Data.entryAt ⟨44, by decide +kernel⟩

def target87 : Weights.Entry :=
  { word := [4, 2, 8, 10, 0, 6, 0], weights := [1, 0, 1, 0] }

def points87 : List (ℕ × ℕ) := [(0, 1), (1, 8), (2, 7), (3, 6), (4, 5), (5, 3), (6, 4), (7, 2), (8, 0)]

-- Period 9, original row 3647, representative 8310.
def source88 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B012.Data.entryAt ⟨23, by decide +kernel⟩

def target88 : Weights.Entry :=
  { word := [4, 2, 8, 10, 0, 8, 1], weights := [1, 0, 0, 1] }

def points88 : List (ℕ × ℕ) := [(0, 1), (1, 7), (2, 8), (3, 6), (4, 5), (5, 3), (6, 4), (7, 2), (8, 0)]

-- Period 9, original row 3650, representative 8379.
def source89 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B012.Data.entryAt ⟨92, by decide +kernel⟩

def target89 : Weights.Entry :=
  { word := [4, 2, 8, 10, 0, 8, 8], weights := [1, 0, 0, 1] }

-- Period 9, original row 3655, representative 8374.
def source90 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B012.Data.entryAt ⟨87, by decide +kernel⟩

def target90 : Weights.Entry :=
  { word := [4, 2, 8, 10, 0, 9, 8], weights := [1, 0, 0, 1] }

-- Period 9, original row 3657, representative 8374.
def source91 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B012.Data.entryAt ⟨87, by decide +kernel⟩

def target91 : Weights.Entry :=
  { word := [4, 2, 8, 10, 0, 10, 8], weights := [1, 0, 0, 1] }

def points91 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 8), (8, 7)]

-- Period 9, original row 3658, representative 8332.
def source92 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B012.Data.entryAt ⟨45, by decide +kernel⟩

def target92 : Weights.Entry :=
  { word := [4, 2, 8, 10, 0, 12, 0], weights := [1, 0, 1, 0] }

def points92 : List (ℕ × ℕ) := [(0, 1), (1, 7), (2, 8), (3, 6), (4, 5), (5, 3), (6, 4), (7, 2), (8, 0)]

-- Period 9, original row 3660, representative 8376.
def source93 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B012.Data.entryAt ⟨89, by decide +kernel⟩

def target93 : Weights.Entry :=
  { word := [4, 2, 8, 10, 8, 2, 8], weights := [1, 0, 0, 1] }

-- Period 9, original row 3661, representative 8330.
def source94 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B012.Data.entryAt ⟨43, by decide +kernel⟩

def target94 : Weights.Entry :=
  { word := [4, 2, 8, 10, 8, 6, 0], weights := [0, 1, 1, 0] }

def points94 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 3662, representative 8319.
def source95 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B012.Data.entryAt ⟨32, by decide +kernel⟩

def target95 : Weights.Entry :=
  { word := [4, 2, 8, 10, 8, 6, 8], weights := [1, 1, 1, 1] }

-- Period 9, original row 3666, representative 8373.
def source96 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B012.Data.entryAt ⟨86, by decide +kernel⟩

def target96 : Weights.Entry :=
  { word := [4, 2, 8, 10, 8, 10, 8], weights := [1, 0, 0, 1] }

-- Period 9, original row 3669, representative 8329.
def source97 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B012.Data.entryAt ⟨42, by decide +kernel⟩

def target97 : Weights.Entry :=
  { word := [4, 2, 8, 12, 4, 4, 0], weights := [0, 1, 1, 0] }

def points97 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 3670, representative 8318.
def source98 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B012.Data.entryAt ⟨31, by decide +kernel⟩

def target98 : Weights.Entry :=
  { word := [4, 2, 8, 12, 4, 4, 8], weights := [1, 1, 1, 1] }

-- Period 9, original row 3671, representative 8325.
def source99 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B012.Data.entryAt ⟨38, by decide +kernel⟩

def target99 : Weights.Entry :=
  { word := [4, 2, 8, 12, 4, 12, 0], weights := [0, 1, 1, 0] }

def points99 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 3672, representative 8316.
def source100 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B012.Data.entryAt ⟨29, by decide +kernel⟩

def target100 : Weights.Entry :=
  { word := [4, 2, 8, 12, 4, 12, 8], weights := [1, 1, 1, 1] }

-- Period 9, original row 3673, representative 8327.
def source101 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B012.Data.entryAt ⟨40, by decide +kernel⟩

def target101 : Weights.Entry :=
  { word := [4, 2, 8, 12, 12, 4, 0], weights := [0, 1, 1, 0] }

def points101 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 3674, representative 8317.
def source102 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B012.Data.entryAt ⟨30, by decide +kernel⟩

def target102 : Weights.Entry :=
  { word := [4, 2, 8, 12, 12, 4, 8], weights := [1, 1, 1, 1] }

-- Period 9, original row 3675, representative 8323.
def source103 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B012.Data.entryAt ⟨36, by decide +kernel⟩

def target103 : Weights.Entry :=
  { word := [4, 2, 8, 12, 12, 12, 0], weights := [0, 1, 1, 0] }

def points103 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 3676, representative 8315.
def source104 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B012.Data.entryAt ⟨28, by decide +kernel⟩

def target104 : Weights.Entry :=
  { word := [4, 2, 8, 12, 12, 12, 8], weights := [1, 1, 1, 1] }

-- Period 9, original row 3683, representative 8291.
def source105 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B012.Data.entryAt ⟨4, by decide +kernel⟩

def target105 : Weights.Entry :=
  { word := [4, 4, 8, 8, 1, 4, 2], weights := [1, 0, 1, 1] }

def points105 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 3684, representative 8291.
def source106 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B012.Data.entryAt ⟨4, by decide +kernel⟩

def target106 : Weights.Entry :=
  { word := [4, 4, 8, 8, 1, 4, 4], weights := [1, 0, 1, 1] }

def points106 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 3698, representative 8289.
def source107 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B012.Data.entryAt ⟨2, by decide +kernel⟩

def target107 : Weights.Entry :=
  { word := [4, 4, 8, 8, 9, 4, 4], weights := [1, 0, 1, 1] }

def points107 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 4044, representative 8414.
def source108 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B012.Data.entryAt ⟨127, by decide +kernel⟩

def target108 : Weights.Entry :=
  { word := [4, 12, 4, 8, 8, 10, 2], weights := [0, 1, 1, 0] }

-- Period 9, original row 4060, representative 8414.
def source109 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B012.Data.entryAt ⟨127, by decide +kernel⟩

def target109 : Weights.Entry :=
  { word := [4, 12, 8, 8, 2, 10, 2], weights := [0, 1, 1, 0] }

def points109 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 4069, representative 8413.
def source110 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B012.Data.entryAt ⟨126, by decide +kernel⟩

def target110 : Weights.Entry :=
  { word := [4, 12, 8, 8, 10, 10, 2], weights := [0, 1, 1, 0] }

-- Period 9, original row 4074, representative 8413.
def source111 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B012.Data.entryAt ⟨126, by decide +kernel⟩

def target111 : Weights.Entry :=
  { word := [4, 12, 12, 8, 8, 10, 2], weights := [0, 1, 1, 0] }

def points111 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 4105, representative 8399.
def source112 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B012.Data.entryAt ⟨112, by decide +kernel⟩

def target112 : Weights.Entry :=
  { word := [8, 0, 0, 9, 4, 4, 4], weights := [1, 0, 1, 1] }

def points112 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2)]

-- Period 9, original row 4109, representative 8395.
def source113 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B012.Data.entryAt ⟨108, by decide +kernel⟩

def target113 : Weights.Entry :=
  { word := [8, 0, 0, 9, 12, 4, 4], weights := [1, 0, 1, 1] }

def points113 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2)]

-- Period 9, original row 4115, representative 8391.
def source114 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B012.Data.entryAt ⟨104, by decide +kernel⟩

def target114 : Weights.Entry :=
  { word := [8, 0, 0, 12, 0, 4, 2], weights := [0, 0, 1, 1] }

def points114 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2)]

-- Period 9, original row 4116, representative 8391.
def source115 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B012.Data.entryAt ⟨104, by decide +kernel⟩

def target115 : Weights.Entry :=
  { word := [8, 0, 0, 12, 0, 4, 4], weights := [0, 0, 1, 1] }

def points115 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2)]

-- Period 9, original row 4137, representative 8370.
def source116 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B012.Data.entryAt ⟨83, by decide +kernel⟩

def target116 : Weights.Entry :=
  { word := [8, 0, 1, 4, 8, 4, 2], weights := [1, 0, 0, 1] }

def points116 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 4138, representative 8380.
def source117 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B012.Data.entryAt ⟨93, by decide +kernel⟩

def target117 : Weights.Entry :=
  { word := [8, 0, 1, 4, 8, 4, 4], weights := [1, 0, 0, 1] }

def points117 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 4173, representative 8377.
def source118 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B012.Data.entryAt ⟨90, by decide +kernel⟩

def target118 : Weights.Entry :=
  { word := [8, 0, 1, 12, 8, 4, 2], weights := [1, 0, 0, 1] }

def points118 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 4174, representative 8387.
def source119 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B012.Data.entryAt ⟨100, by decide +kernel⟩

def target119 : Weights.Entry :=
  { word := [8, 0, 1, 12, 8, 4, 4], weights := [1, 0, 0, 1] }

def points119 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 4305, representative 8403.
def source120 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B012.Data.entryAt ⟨116, by decide +kernel⟩

def target120 : Weights.Entry :=
  { word := [8, 0, 4, 10, 8, 4, 4], weights := [0, 1, 1, 1] }

def points120 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 4364, representative 8398.
def source121 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B012.Data.entryAt ⟨111, by decide +kernel⟩

def target121 : Weights.Entry :=
  { word := [8, 0, 8, 9, 4, 4, 4], weights := [1, 0, 1, 1] }

def points121 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 4368, representative 8394.
def source122 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B012.Data.entryAt ⟨107, by decide +kernel⟩

def target122 : Weights.Entry :=
  { word := [8, 0, 8, 9, 12, 4, 4], weights := [1, 0, 1, 1] }

def points122 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 4461, representative 8404.
def source123 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B012.Data.entryAt ⟨117, by decide +kernel⟩

def target123 : Weights.Entry :=
  { word := [8, 0, 12, 10, 0, 4, 2], weights := [1, 0, 1, 1] }

def points123 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 4462, representative 8404.
def source124 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B012.Data.entryAt ⟨117, by decide +kernel⟩

def target124 : Weights.Entry :=
  { word := [8, 0, 12, 10, 0, 4, 4], weights := [1, 0, 1, 1] }

def points124 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 4481, representative 8402.
def source125 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B012.Data.entryAt ⟨115, by decide +kernel⟩

def target125 : Weights.Entry :=
  { word := [8, 0, 12, 10, 8, 4, 4], weights := [0, 1, 1, 1] }

def points125 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 4672, representative 8342.
def source126 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B012.Data.entryAt ⟨55, by decide +kernel⟩

def target126 : Weights.Entry :=
  { word := [8, 2, 0, 1, 8, 4, 4], weights := [0, 3, 1, 0] }

def points126 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2)]

-- Period 9, original row 4688, representative 8308.
def source127 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B012.Data.entryAt ⟨21, by decide +kernel⟩

def target127 : Weights.Entry :=
  { word := [8, 2, 0, 8, 1, 4, 2], weights := [0, 2, 1, 1] }

def points127 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2)]

def period9Entries : List Weights.Entry := [target0, target1, target2, target3, target4, target5, target6, target7, target8, target9, target10, target11, target12, target13, target14, target15, target16, target17, target18, target19, target20, target21, target22, target23, target24, target25, target26, target27, target28, target29, target30, target31, target32, target33, target34, target35, target36, target37, target38, target39, target40, target41, target42, target43, target44, target45, target46, target47, target48, target49, target50, target51, target52, target53, target54, target55, target56, target57, target58, target59, target60, target61, target62, target63, target64, target65, target66, target67, target68, target69, target70, target71, target72, target73, target74, target75, target76, target77, target78, target79, target80, target81, target82, target83, target84, target85, target86, target87, target88, target89, target90, target91, target92, target93, target94, target95, target96, target97, target98, target99, target100, target101, target102, target103, target104, target105, target106, target107, target108, target109, target110, target111, target112, target113, target114, target115, target116, target117, target118, target119, target120, target121, target122, target123, target124, target125, target126, target127]

def period9Chunk : RowCoverage.Chunk where
  rows := [⟨2690, target0⟩, ⟨2691, target1⟩, ⟨2692, target2⟩, ⟨2694, target3⟩, ⟨2696, target4⟩, ⟨2704, target5⟩, ⟨2706, target6⟩, ⟨2707, target7⟩, ⟨2709, target8⟩, ⟨2712, target9⟩, ⟨2717, target10⟩, ⟨2719, target11⟩, ⟨2720, target12⟩, ⟨2724, target13⟩, ⟨2725, target14⟩, ⟨2726, target15⟩, ⟨2730, target16⟩, ⟨2731, target17⟩, ⟨2732, target18⟩, ⟨2733, target19⟩, ⟨2735, target20⟩, ⟨2736, target21⟩, ⟨2741, target22⟩, ⟨2743, target23⟩, ⟨2744, target24⟩, ⟨2745, target25⟩, ⟨2746, target26⟩, ⟨2747, target27⟩, ⟨2748, target28⟩, ⟨2749, target29⟩, ⟨2751, target30⟩, ⟨2752, target31⟩, ⟨2758, target32⟩, ⟨2761, target33⟩, ⟨2762, target34⟩, ⟨2763, target35⟩, ⟨2764, target36⟩, ⟨2765, target37⟩, ⟨2766, target38⟩, ⟨2767, target39⟩, ⟨2768, target40⟩, ⟨2771, target41⟩, ⟨2775, target42⟩, ⟨2776, target43⟩, ⟨2778, target44⟩, ⟨2779, target45⟩, ⟨2780, target46⟩, ⟨2781, target47⟩, ⟨2782, target48⟩, ⟨2785, target49⟩, ⟨2789, target50⟩, ⟨2790, target51⟩, ⟨2792, target52⟩, ⟨3015, target53⟩, ⟨3016, target54⟩, ⟨3025, target55⟩, ⟨3568, target56⟩, ⟨3569, target57⟩, ⟨3571, target58⟩, ⟨3572, target59⟩, ⟨3573, target60⟩, ⟨3575, target61⟩, ⟨3577, target62⟩, ⟨3584, target63⟩, ⟨3587, target64⟩, ⟨3592, target65⟩, ⟨3594, target66⟩, ⟨3601, target67⟩, ⟨3603, target68⟩, ⟨3604, target69⟩, ⟨3608, target70⟩, ⟨3610, target71⟩, ⟨3612, target72⟩, ⟨3614, target73⟩, ⟨3617, target74⟩, ⟨3622, target75⟩, ⟨3624, target76⟩, ⟨3626, target77⟩, ⟨3630, target78⟩, ⟨3631, target79⟩, ⟨3632, target80⟩, ⟨3633, target81⟩, ⟨3634, target82⟩, ⟨3636, target83⟩, ⟨3639, target84⟩, ⟨3642, target85⟩, ⟨3644, target86⟩, ⟨3645, target87⟩, ⟨3647, target88⟩, ⟨3650, target89⟩, ⟨3655, target90⟩, ⟨3657, target91⟩, ⟨3658, target92⟩, ⟨3660, target93⟩, ⟨3661, target94⟩, ⟨3662, target95⟩, ⟨3666, target96⟩, ⟨3669, target97⟩, ⟨3670, target98⟩, ⟨3671, target99⟩, ⟨3672, target100⟩, ⟨3673, target101⟩, ⟨3674, target102⟩, ⟨3675, target103⟩, ⟨3676, target104⟩, ⟨3683, target105⟩, ⟨3684, target106⟩, ⟨3698, target107⟩, ⟨4044, target108⟩, ⟨4060, target109⟩, ⟨4069, target110⟩, ⟨4074, target111⟩, ⟨4105, target112⟩, ⟨4109, target113⟩, ⟨4115, target114⟩, ⟨4116, target115⟩, ⟨4137, target116⟩, ⟨4138, target117⟩, ⟨4173, target118⟩, ⟨4174, target119⟩, ⟨4305, target120⟩, ⟨4364, target121⟩, ⟨4368, target122⟩, ⟨4461, target123⟩, ⟨4462, target124⟩, ⟨4481, target125⟩, ⟨4672, target126⟩, ⟨4688, target127⟩]
  indexMask := 16928804884863839496529435559413602239626030137393870200665461858501226283343698015581595787713331434807595376854245781023503210969723535458744708307491975861364917298741879879812347359988210349274241911510948929053482418775565561253846812418756281411964559353876541588097980606655863773687213764195060663183064156822092014797492758736235206894629744354489614196009331385362585067296137114066694478749739356386677003365313674124993620205553152834179329321591266355971044484309408553973325774342719483311539305341830478340728342338481883114138385090792871542377709171891034679843385585442691799712151071057795209823244313549099717480222567592624028155070998413336621687979742655626455515146563314025234191026611304655777056648927510099160488892563572475215520652140440385595618055132517849536455259000347503893854794365164842304282487440795569155054219512022735807931536132149258319606473045562998291849092154890820970746467104693938506524856810971437563268238258564072604258768238735883435289555280000890708195049470583151861912110613957999440860129930186662670153608712155199119879142319598043975513533282370005910755715599014509270505073644948426914635942222576638391799392416361317505152223297839563624478761587348779521361236325755792702105803006672763697216741969336554428756572730299096831649237272225162634108353709576200523478928445550140781111358971551962050630277583396793945797355422858355516773498880
  count := 128

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem period9Chunk_entries :
    period9Chunk.rows.map RowCoverage.TaggedRow.entry = period9Entries := rfl

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem period9_index_check :
    RowCoverage.indexCheck CanonicalWords.count period9Chunk = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem period9_words_check :
    RowCoverage.wordsCheck CanonicalWords.wordAt period9Chunk = true := by
  decide +kernel

end FranklSmallCyclic.TransportBatches.G065.B001.Data
