module

public import Conjectures.FranklSmallCyclicRowCoverage
public import Conjectures.FranklSmallCyclicCanonicalWords
public import Conjectures.FranklSmallCyclicOrbit10Block016Data

/-! 128 literal targets sharing one source proof block.
Original words and row indices are retained; weights may be transported.
-/
@[expose] public section

namespace FranklSmallCyclic.TransportBatches.G094.B000.Data

-- Period 10, original row 2471, representative 10531.
def source0 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B016.Data.entryAt ⟨59, by decide +kernel⟩

def target0 : Weights.Entry :=
  { word := [2, 0, 8, 4, 4, 12, 8], weights := [1, 0, 0, 1] }

-- Period 10, original row 2501, representative 10532.
def source1 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B016.Data.entryAt ⟨60, by decide +kernel⟩

def target1 : Weights.Entry :=
  { word := [2, 0, 8, 12, 4, 12, 8], weights := [1, 0, 0, 1] }

-- Period 10, original row 2508, representative 10472.
def source2 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B016.Data.entryAt ⟨0, by decide +kernel⟩

def target2 : Weights.Entry :=
  { word := [2, 0, 9, 8, 1, 4, 2], weights := [1, 0, 1, 1] }

-- Period 10, original row 2509, representative 10472.
def source3 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B016.Data.entryAt ⟨0, by decide +kernel⟩

def target3 : Weights.Entry :=
  { word := [2, 0, 9, 8, 1, 4, 4], weights := [1, 0, 1, 1] }

def points3 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 8), (8, 7), (9, 9)]

-- Period 10, original row 2587, representative 10472.
def source4 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B016.Data.entryAt ⟨0, by decide +kernel⟩

def target4 : Weights.Entry :=
  { word := [2, 2, 0, 9, 8, 1, 4], weights := [1, 1, 0, 1] }

def points4 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2), (9, 0)]

-- Period 10, original row 2591, representative 10473.
def source5 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B016.Data.entryAt ⟨1, by decide +kernel⟩

def target5 : Weights.Entry :=
  { word := [2, 2, 0, 9, 8, 8, 4], weights := [1, 1, 0, 1] }

-- Period 10, original row 2601, representative 10495.
def source6 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B016.Data.entryAt ⟨23, by decide +kernel⟩

def target6 : Weights.Entry :=
  { word := [2, 2, 0, 10, 0, 0, 8], weights := [1, 1, 0, 0] }

-- Period 10, original row 2608, representative 10494.
def source7 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B016.Data.entryAt ⟨22, by decide +kernel⟩

def target7 : Weights.Entry :=
  { word := [2, 2, 0, 10, 0, 8, 8], weights := [1, 0, 0, 1] }

-- Period 10, original row 2618, representative 10508.
def source8 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B016.Data.entryAt ⟨36, by decide +kernel⟩

def target8 : Weights.Entry :=
  { word := [2, 2, 0, 12, 10, 0, 8], weights := [1, 1, 0, 1] }

-- Period 10, original row 2629, representative 10503.
def source9 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B016.Data.entryAt ⟨31, by decide +kernel⟩

def target9 : Weights.Entry :=
  { word := [2, 2, 2, 8, 1, 0, 8], weights := [1, 1, 0, 1] }

-- Period 10, original row 2634, representative 10501.
def source10 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B016.Data.entryAt ⟨29, by decide +kernel⟩

def target10 : Weights.Entry :=
  { word := [2, 2, 2, 8, 1, 8, 8], weights := [1, 1, 1, 1] }

-- Period 10, original row 2643, representative 10502.
def source11 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B016.Data.entryAt ⟨30, by decide +kernel⟩

def target11 : Weights.Entry :=
  { word := [2, 2, 2, 8, 9, 0, 8], weights := [1, 1, 0, 1] }

-- Period 10, original row 2648, representative 10500.
def source12 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B016.Data.entryAt ⟨28, by decide +kernel⟩

def target12 : Weights.Entry :=
  { word := [2, 2, 2, 8, 9, 8, 8], weights := [1, 1, 1, 1] }

-- Period 10, original row 2655, representative 10484.
def source13 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B016.Data.entryAt ⟨12, by decide +kernel⟩

def target13 : Weights.Entry :=
  { word := [2, 2, 8, 2, 0, 1, 8], weights := [1, 0, 0, 1] }

-- Period 10, original row 2657, representative 10484.
def source14 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B016.Data.entryAt ⟨12, by decide +kernel⟩

def target14 : Weights.Entry :=
  { word := [2, 2, 8, 2, 0, 2, 8], weights := [1, 0, 0, 1] }

def points14 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 8), (8, 7), (9, 9)]

-- Period 10, original row 2662, representative 10492.
def source15 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B016.Data.entryAt ⟨20, by decide +kernel⟩

def target15 : Weights.Entry :=
  { word := [2, 2, 8, 2, 0, 8, 8], weights := [1, 0, 0, 1] }

-- Period 10, original row 2667, representative 10485.
def source16 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B016.Data.entryAt ⟨13, by decide +kernel⟩

def target16 : Weights.Entry :=
  { word := [2, 2, 8, 2, 0, 9, 8], weights := [1, 0, 0, 1] }

-- Period 10, original row 2669, representative 10485.
def source17 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B016.Data.entryAt ⟨13, by decide +kernel⟩

def target17 : Weights.Entry :=
  { word := [2, 2, 8, 2, 0, 10, 8], weights := [1, 0, 0, 1] }

def points17 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 8), (8, 7), (9, 9)]

-- Period 10, original row 2673, representative 10489.
def source18 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B016.Data.entryAt ⟨17, by decide +kernel⟩

def target18 : Weights.Entry :=
  { word := [2, 2, 8, 2, 8, 2, 8], weights := [1, 0, 0, 1] }

-- Period 10, original row 2677, representative 10486.
def source19 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B016.Data.entryAt ⟨14, by decide +kernel⟩

def target19 : Weights.Entry :=
  { word := [2, 2, 8, 2, 8, 10, 8], weights := [1, 0, 0, 1] }

-- Period 10, original row 2704, representative 10491.
def source20 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B016.Data.entryAt ⟨19, by decide +kernel⟩

def target20 : Weights.Entry :=
  { word := [2, 2, 8, 10, 0, 1, 8], weights := [1, 0, 0, 1] }

-- Period 10, original row 2706, representative 10491.
def source21 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B016.Data.entryAt ⟨19, by decide +kernel⟩

def target21 : Weights.Entry :=
  { word := [2, 2, 8, 10, 0, 2, 8], weights := [1, 0, 0, 1] }

def points21 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 8), (8, 7), (9, 9)]

-- Period 10, original row 2712, representative 10493.
def source22 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B016.Data.entryAt ⟨21, by decide +kernel⟩

def target22 : Weights.Entry :=
  { word := [2, 2, 8, 10, 0, 8, 8], weights := [1, 0, 0, 1] }

-- Period 10, original row 2717, representative 10488.
def source23 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B016.Data.entryAt ⟨16, by decide +kernel⟩

def target23 : Weights.Entry :=
  { word := [2, 2, 8, 10, 0, 9, 8], weights := [1, 0, 0, 1] }

-- Period 10, original row 2719, representative 10488.
def source24 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B016.Data.entryAt ⟨16, by decide +kernel⟩

def target24 : Weights.Entry :=
  { word := [2, 2, 8, 10, 0, 10, 8], weights := [1, 0, 0, 1] }

def points24 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 8), (8, 7), (9, 9)]

-- Period 10, original row 2724, representative 10490.
def source25 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B016.Data.entryAt ⟨18, by decide +kernel⟩

def target25 : Weights.Entry :=
  { word := [2, 2, 8, 10, 8, 2, 8], weights := [1, 0, 0, 1] }

-- Period 10, original row 2730, representative 10487.
def source26 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B016.Data.entryAt ⟨15, by decide +kernel⟩

def target26 : Weights.Entry :=
  { word := [2, 2, 8, 10, 8, 10, 8], weights := [1, 0, 0, 1] }

-- Period 10, original row 2736, representative 10507.
def source27 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B016.Data.entryAt ⟨35, by decide +kernel⟩

def target27 : Weights.Entry :=
  { word := [2, 2, 8, 12, 2, 0, 8], weights := [1, 1, 1, 0] }

-- Period 10, original row 2741, representative 10505.
def source28 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B016.Data.entryAt ⟨33, by decide +kernel⟩

def target28 : Weights.Entry :=
  { word := [2, 2, 8, 12, 2, 8, 8], weights := [1, 1, 1, 1] }

-- Period 10, original row 2752, representative 10506.
def source29 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B016.Data.entryAt ⟨34, by decide +kernel⟩

def target29 : Weights.Entry :=
  { word := [2, 2, 8, 12, 10, 0, 8], weights := [1, 1, 1, 0] }

-- Period 10, original row 2758, representative 10504.
def source30 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B016.Data.entryAt ⟨32, by decide +kernel⟩

def target30 : Weights.Entry :=
  { word := [2, 2, 8, 12, 10, 8, 8], weights := [1, 1, 1, 1] }

-- Period 10, original row 2771, representative 10499.
def source31 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B016.Data.entryAt ⟨27, by decide +kernel⟩

def target31 : Weights.Entry :=
  { word := [2, 2, 10, 8, 1, 0, 8], weights := [1, 1, 0, 1] }

-- Period 10, original row 2776, representative 10497.
def source32 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B016.Data.entryAt ⟨25, by decide +kernel⟩

def target32 : Weights.Entry :=
  { word := [2, 2, 10, 8, 1, 8, 8], weights := [1, 1, 1, 1] }

-- Period 10, original row 2785, representative 10498.
def source33 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B016.Data.entryAt ⟨26, by decide +kernel⟩

def target33 : Weights.Entry :=
  { word := [2, 2, 10, 8, 9, 0, 8], weights := [1, 1, 0, 1] }

-- Period 10, original row 2790, representative 10496.
def source34 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B016.Data.entryAt ⟨24, by decide +kernel⟩

def target34 : Weights.Entry :=
  { word := [2, 2, 10, 8, 9, 8, 8], weights := [1, 1, 1, 1] }

-- Period 10, original row 2829, representative 10533.
def source35 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B016.Data.entryAt ⟨61, by decide +kernel⟩

def target35 : Weights.Entry :=
  { word := [2, 8, 0, 4, 8, 12, 8], weights := [1, 0, 1, 0] }

-- Period 10, original row 2984, representative 10529.
def source36 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B016.Data.entryAt ⟨57, by decide +kernel⟩

def target36 : Weights.Entry :=
  { word := [2, 8, 8, 4, 4, 12, 8], weights := [1, 0, 0, 1] }

-- Period 10, original row 2996, representative 10534.
def source37 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B016.Data.entryAt ⟨62, by decide +kernel⟩

def target37 : Weights.Entry :=
  { word := [2, 8, 8, 4, 8, 12, 8], weights := [1, 0, 1, 0] }

-- Period 10, original row 3014, representative 10525.
def source38 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B016.Data.entryAt ⟨53, by decide +kernel⟩

def target38 : Weights.Entry :=
  { word := [2, 8, 8, 4, 12, 12, 8], weights := [1, 0, 0, 1] }

-- Period 10, original row 3015, representative 10473.
def source39 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B016.Data.entryAt ⟨1, by decide +kernel⟩

def target39 : Weights.Entry :=
  { word := [2, 8, 8, 8, 1, 4, 2], weights := [1, 0, 1, 1] }

def points39 : List (ℕ × ℕ) := [(0, 9), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 3016, representative 10473.
def source40 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B016.Data.entryAt ⟨1, by decide +kernel⟩

def target40 : Weights.Entry :=
  { word := [2, 8, 8, 8, 1, 4, 4], weights := [1, 0, 1, 1] }

def points40 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 3058, representative 10530.
def source41 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B016.Data.entryAt ⟨58, by decide +kernel⟩

def target41 : Weights.Entry :=
  { word := [2, 8, 8, 12, 4, 12, 8], weights := [1, 0, 0, 1] }

-- Period 10, original row 3069, representative 10535.
def source42 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B016.Data.entryAt ⟨63, by decide +kernel⟩

def target42 : Weights.Entry :=
  { word := [2, 8, 8, 12, 8, 12, 8], weights := [0, 0, 1, 0] }

-- Period 10, original row 3087, representative 10526.
def source43 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B016.Data.entryAt ⟨54, by decide +kernel⟩

def target43 : Weights.Entry :=
  { word := [2, 8, 8, 12, 12, 12, 8], weights := [1, 0, 0, 1] }

-- Period 10, original row 3573, representative 10472.
def source44 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B016.Data.entryAt ⟨0, by decide +kernel⟩

def target44 : Weights.Entry :=
  { word := [4, 2, 0, 9, 8, 1, 4], weights := [1, 1, 0, 1] }

def points44 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 3577, representative 10473.
def source45 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B016.Data.entryAt ⟨1, by decide +kernel⟩

def target45 : Weights.Entry :=
  { word := [4, 2, 0, 9, 8, 8, 4], weights := [1, 1, 0, 1] }

def points45 : List (ℕ × ℕ) := [(0, 0), (1, 2), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8), (9, 9)]

-- Period 10, original row 3587, representative 10495.
def source46 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B016.Data.entryAt ⟨23, by decide +kernel⟩

def target46 : Weights.Entry :=
  { word := [4, 2, 0, 10, 0, 0, 8], weights := [1, 1, 0, 0] }

def points46 : List (ℕ × ℕ) := [(0, 0), (1, 2), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8), (9, 9)]

-- Period 10, original row 3594, representative 10494.
def source47 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B016.Data.entryAt ⟨22, by decide +kernel⟩

def target47 : Weights.Entry :=
  { word := [4, 2, 0, 10, 0, 8, 8], weights := [1, 0, 0, 1] }

def points47 : List (ℕ × ℕ) := [(0, 0), (1, 2), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8), (9, 9)]

-- Period 10, original row 3604, representative 10508.
def source48 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B016.Data.entryAt ⟨36, by decide +kernel⟩

def target48 : Weights.Entry :=
  { word := [4, 2, 0, 12, 10, 0, 8], weights := [1, 1, 0, 1] }

def points48 : List (ℕ × ℕ) := [(0, 0), (1, 2), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8), (9, 9)]

-- Period 10, original row 3610, representative 10474.
def source49 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B016.Data.entryAt ⟨2, by decide +kernel⟩

def target49 : Weights.Entry :=
  { word := [4, 2, 8, 2, 0, 1, 8], weights := [1, 0, 0, 1] }

-- Period 10, original row 3612, representative 10474.
def source50 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B016.Data.entryAt ⟨2, by decide +kernel⟩

def target50 : Weights.Entry :=
  { word := [4, 2, 8, 2, 0, 2, 8], weights := [1, 0, 0, 1] }

def points50 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 8), (8, 7), (9, 9)]

-- Period 10, original row 3617, representative 10482.
def source51 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B016.Data.entryAt ⟨10, by decide +kernel⟩

def target51 : Weights.Entry :=
  { word := [4, 2, 8, 2, 0, 8, 8], weights := [1, 0, 0, 1] }

-- Period 10, original row 3622, representative 10475.
def source52 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B016.Data.entryAt ⟨3, by decide +kernel⟩

def target52 : Weights.Entry :=
  { word := [4, 2, 8, 2, 0, 9, 8], weights := [1, 0, 0, 1] }

-- Period 10, original row 3624, representative 10475.
def source53 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B016.Data.entryAt ⟨3, by decide +kernel⟩

def target53 : Weights.Entry :=
  { word := [4, 2, 8, 2, 0, 10, 8], weights := [1, 0, 0, 1] }

def points53 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 8), (8, 7), (9, 9)]

-- Period 10, original row 3626, representative 10479.
def source54 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B016.Data.entryAt ⟨7, by decide +kernel⟩

def target54 : Weights.Entry :=
  { word := [4, 2, 8, 2, 8, 2, 8], weights := [1, 0, 0, 1] }

-- Period 10, original row 3630, representative 10476.
def source55 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B016.Data.entryAt ⟨4, by decide +kernel⟩

def target55 : Weights.Entry :=
  { word := [4, 2, 8, 2, 8, 10, 8], weights := [1, 0, 0, 1] }

-- Period 10, original row 3642, representative 10481.
def source56 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B016.Data.entryAt ⟨9, by decide +kernel⟩

def target56 : Weights.Entry :=
  { word := [4, 2, 8, 10, 0, 1, 8], weights := [1, 0, 0, 1] }

-- Period 10, original row 3644, representative 10481.
def source57 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B016.Data.entryAt ⟨9, by decide +kernel⟩

def target57 : Weights.Entry :=
  { word := [4, 2, 8, 10, 0, 2, 8], weights := [1, 0, 0, 1] }

def points57 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 8), (8, 7), (9, 9)]

-- Period 10, original row 3650, representative 10483.
def source58 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B016.Data.entryAt ⟨11, by decide +kernel⟩

def target58 : Weights.Entry :=
  { word := [4, 2, 8, 10, 0, 8, 8], weights := [1, 0, 0, 1] }

-- Period 10, original row 3655, representative 10478.
def source59 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B016.Data.entryAt ⟨6, by decide +kernel⟩

def target59 : Weights.Entry :=
  { word := [4, 2, 8, 10, 0, 9, 8], weights := [1, 0, 0, 1] }

-- Period 10, original row 3657, representative 10478.
def source60 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B016.Data.entryAt ⟨6, by decide +kernel⟩

def target60 : Weights.Entry :=
  { word := [4, 2, 8, 10, 0, 10, 8], weights := [1, 0, 0, 1] }

def points60 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 8), (8, 7), (9, 9)]

-- Period 10, original row 3660, representative 10480.
def source61 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B016.Data.entryAt ⟨8, by decide +kernel⟩

def target61 : Weights.Entry :=
  { word := [4, 2, 8, 10, 8, 2, 8], weights := [1, 0, 0, 1] }

-- Period 10, original row 3666, representative 10477.
def source62 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B016.Data.entryAt ⟨5, by decide +kernel⟩

def target62 : Weights.Entry :=
  { word := [4, 2, 8, 10, 8, 10, 8], weights := [1, 0, 0, 1] }

-- Period 10, original row 3747, representative 10533.
def source63 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B016.Data.entryAt ⟨61, by decide +kernel⟩

def target63 : Weights.Entry :=
  { word := [4, 8, 0, 4, 8, 12, 8], weights := [1, 0, 1, 0] }

def points63 : List (ℕ × ℕ) := [(0, 0), (1, 2), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8), (9, 9)]

-- Period 10, original row 3884, representative 10527.
def source64 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B016.Data.entryAt ⟨55, by decide +kernel⟩

def target64 : Weights.Entry :=
  { word := [4, 8, 8, 4, 4, 12, 8], weights := [1, 0, 0, 1] }

-- Period 10, original row 3892, representative 10523.
def source65 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B016.Data.entryAt ⟨51, by decide +kernel⟩

def target65 : Weights.Entry :=
  { word := [4, 8, 8, 4, 12, 12, 8], weights := [1, 0, 0, 1] }

-- Period 10, original row 3906, representative 10528.
def source66 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B016.Data.entryAt ⟨56, by decide +kernel⟩

def target66 : Weights.Entry :=
  { word := [4, 8, 8, 12, 4, 12, 8], weights := [1, 0, 0, 1] }

-- Period 10, original row 3913, representative 10524.
def source67 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B016.Data.entryAt ⟨52, by decide +kernel⟩

def target67 : Weights.Entry :=
  { word := [4, 8, 8, 12, 12, 12, 8], weights := [1, 0, 0, 1] }

-- Period 10, original row 4105, representative 10503.
def source68 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B016.Data.entryAt ⟨31, by decide +kernel⟩

def target68 : Weights.Entry :=
  { word := [8, 0, 0, 9, 4, 4, 4], weights := [1, 0, 1, 1] }

def points68 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 0), (8, 1), (9, 2)]

-- Period 10, original row 4109, representative 10499.
def source69 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B016.Data.entryAt ⟨27, by decide +kernel⟩

def target69 : Weights.Entry :=
  { word := [8, 0, 0, 9, 12, 4, 4], weights := [1, 0, 1, 1] }

def points69 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 0), (8, 1), (9, 2)]

-- Period 10, original row 4115, representative 10495.
def source70 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B016.Data.entryAt ⟨23, by decide +kernel⟩

def target70 : Weights.Entry :=
  { word := [8, 0, 0, 12, 0, 4, 2], weights := [0, 0, 1, 1] }

def points70 : List (ℕ × ℕ) := [(0, 8), (1, 7), (2, 9), (3, 5), (4, 6), (5, 4), (6, 3), (7, 0), (8, 1), (9, 2)]

-- Period 10, original row 4116, representative 10495.
def source71 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B016.Data.entryAt ⟨23, by decide +kernel⟩

def target71 : Weights.Entry :=
  { word := [8, 0, 0, 12, 0, 4, 4], weights := [0, 0, 1, 1] }

def points71 : List (ℕ × ℕ) := [(0, 7), (1, 8), (2, 9), (3, 5), (4, 6), (5, 4), (6, 3), (7, 0), (8, 1), (9, 2)]

-- Period 10, original row 4137, representative 10474.
def source72 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B016.Data.entryAt ⟨2, by decide +kernel⟩

def target72 : Weights.Entry :=
  { word := [8, 0, 1, 4, 8, 4, 2], weights := [1, 0, 1, 0] }

def points72 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 5), (4, 6), (5, 4), (6, 3), (7, 2), (8, 0), (9, 1)]

-- Period 10, original row 4138, representative 10484.
def source73 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B016.Data.entryAt ⟨12, by decide +kernel⟩

def target73 : Weights.Entry :=
  { word := [8, 0, 1, 4, 8, 4, 4], weights := [1, 0, 0, 1] }

def points73 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 0), (9, 1)]

-- Period 10, original row 4173, representative 10481.
def source74 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B016.Data.entryAt ⟨9, by decide +kernel⟩

def target74 : Weights.Entry :=
  { word := [8, 0, 1, 12, 8, 4, 2], weights := [1, 0, 1, 0] }

def points74 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 5), (4, 6), (5, 4), (6, 3), (7, 2), (8, 0), (9, 1)]

-- Period 10, original row 4174, representative 10491.
def source75 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B016.Data.entryAt ⟨19, by decide +kernel⟩

def target75 : Weights.Entry :=
  { word := [8, 0, 1, 12, 8, 4, 4], weights := [1, 0, 0, 1] }

def points75 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 0), (9, 1)]

-- Period 10, original row 4305, representative 10507.
def source76 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B016.Data.entryAt ⟨35, by decide +kernel⟩

def target76 : Weights.Entry :=
  { word := [8, 0, 4, 10, 8, 4, 4], weights := [0, 1, 1, 1] }

def points76 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 0), (9, 1)]

-- Period 10, original row 4364, representative 10502.
def source77 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B016.Data.entryAt ⟨30, by decide +kernel⟩

def target77 : Weights.Entry :=
  { word := [8, 0, 8, 9, 4, 4, 4], weights := [1, 0, 1, 1] }

def points77 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 0), (9, 1)]

-- Period 10, original row 4368, representative 10498.
def source78 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B016.Data.entryAt ⟨26, by decide +kernel⟩

def target78 : Weights.Entry :=
  { word := [8, 0, 8, 9, 12, 4, 4], weights := [1, 0, 1, 1] }

def points78 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 0), (9, 1)]

-- Period 10, original row 4461, representative 10508.
def source79 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B016.Data.entryAt ⟨36, by decide +kernel⟩

def target79 : Weights.Entry :=
  { word := [8, 0, 12, 10, 0, 4, 2], weights := [1, 0, 1, 1] }

def points79 : List (ℕ × ℕ) := [(0, 9), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 0), (9, 1)]

-- Period 10, original row 4462, representative 10508.
def source80 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B016.Data.entryAt ⟨36, by decide +kernel⟩

def target80 : Weights.Entry :=
  { word := [8, 0, 12, 10, 0, 4, 4], weights := [1, 0, 1, 1] }

def points80 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 0), (9, 1)]

-- Period 10, original row 4481, representative 10506.
def source81 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B016.Data.entryAt ⟨34, by decide +kernel⟩

def target81 : Weights.Entry :=
  { word := [8, 0, 12, 10, 8, 4, 4], weights := [0, 1, 1, 1] }

def points81 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 0), (9, 1)]

-- Period 10, original row 4694, representative 10522.
def source82 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B016.Data.entryAt ⟨50, by decide +kernel⟩

def target82 : Weights.Entry :=
  { word := [8, 2, 0, 8, 1, 12, 8], weights := [0, 1, 1, 0] }

-- Period 10, original row 4866, representative 10515.
def source83 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B016.Data.entryAt ⟨43, by decide +kernel⟩

def target83 : Weights.Entry :=
  { word := [8, 2, 8, 2, 8, 6, 8], weights := [0, 3, 0, 1] }

-- Period 10, original row 4881, representative 10512.
def source84 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B016.Data.entryAt ⟨40, by decide +kernel⟩

def target84 : Weights.Entry :=
  { word := [8, 2, 8, 8, 4, 6, 8], weights := [0, 1, 1, 0] }

-- Period 10, original row 4885, representative 10510.
def source85 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B016.Data.entryAt ⟨38, by decide +kernel⟩

def target85 : Weights.Entry :=
  { word := [8, 2, 8, 8, 12, 6, 8], weights := [0, 1, 1, 0] }

-- Period 10, original row 4910, representative 10516.
def source86 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B016.Data.entryAt ⟨44, by decide +kernel⟩

def target86 : Weights.Entry :=
  { word := [8, 2, 8, 10, 8, 6, 8], weights := [0, 1, 1, 0] }

-- Period 10, original row 4920, representative 10520.
def source87 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B016.Data.entryAt ⟨48, by decide +kernel⟩

def target87 : Weights.Entry :=
  { word := [8, 2, 8, 12, 4, 12, 8], weights := [0, 1, 1, 0] }

-- Period 10, original row 4924, representative 10518.
def source88 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B016.Data.entryAt ⟨46, by decide +kernel⟩

def target88 : Weights.Entry :=
  { word := [8, 2, 8, 12, 12, 12, 8], weights := [0, 1, 1, 0] }

-- Period 10, original row 5016, representative 10474.
def source89 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B016.Data.entryAt ⟨2, by decide +kernel⟩

def target89 : Weights.Entry :=
  { word := [8, 4, 0, 4, 8, 4, 2], weights := [1, 0, 1, 0] }

def points89 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 5), (4, 6), (5, 4), (6, 3), (7, 1), (8, 0), (9, 2)]

-- Period 10, original row 5017, representative 10484.
def source90 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B016.Data.entryAt ⟨12, by decide +kernel⟩

def target90 : Weights.Entry :=
  { word := [8, 4, 0, 4, 8, 4, 4], weights := [1, 0, 0, 1] }

def points90 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 0), (9, 2)]

-- Period 10, original row 5052, representative 10481.
def source91 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B016.Data.entryAt ⟨9, by decide +kernel⟩

def target91 : Weights.Entry :=
  { word := [8, 4, 0, 12, 8, 4, 2], weights := [1, 0, 1, 0] }

def points91 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 5), (4, 6), (5, 4), (6, 3), (7, 1), (8, 0), (9, 2)]

-- Period 10, original row 5053, representative 10491.
def source92 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B016.Data.entryAt ⟨19, by decide +kernel⟩

def target92 : Weights.Entry :=
  { word := [8, 4, 0, 12, 8, 4, 4], weights := [1, 0, 0, 1] }

def points92 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 0), (9, 2)]

-- Period 10, original row 5173, representative 10479.
def source93 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B016.Data.entryAt ⟨7, by decide +kernel⟩

def target93 : Weights.Entry :=
  { word := [8, 4, 8, 4, 8, 4, 2], weights := [1, 0, 0, 1] }

def points93 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 5174, representative 10489.
def source94 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B016.Data.entryAt ⟨17, by decide +kernel⟩

def target94 : Weights.Entry :=
  { word := [8, 4, 8, 4, 8, 4, 4], weights := [1, 0, 0, 1] }

def points94 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 5215, representative 10480.
def source95 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B016.Data.entryAt ⟨8, by decide +kernel⟩

def target95 : Weights.Entry :=
  { word := [8, 4, 8, 12, 8, 4, 2], weights := [1, 0, 0, 1] }

def points95 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 5216, representative 10490.
def source96 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B016.Data.entryAt ⟨18, by decide +kernel⟩

def target96 : Weights.Entry :=
  { word := [8, 4, 8, 12, 8, 4, 4], weights := [1, 0, 0, 1] }

def points96 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 5296, representative 10512.
def source97 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B016.Data.entryAt ⟨40, by decide +kernel⟩

def target97 : Weights.Entry :=
  { word := [8, 6, 2, 8, 8, 4, 8], weights := [0, 1, 1, 0] }

def points97 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 5299, representative 10511.
def source98 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B016.Data.entryAt ⟨39, by decide +kernel⟩

def target98 : Weights.Entry :=
  { word := [8, 6, 2, 8, 8, 12, 8], weights := [0, 1, 1, 0] }

-- Period 10, original row 5300, representative 10515.
def source99 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B016.Data.entryAt ⟨43, by decide +kernel⟩

def target99 : Weights.Entry :=
  { word := [8, 6, 8, 4, 8, 4, 8], weights := [1, 0, 3, 0] }

def points99 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 5301, representative 10513.
def source100 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B016.Data.entryAt ⟨41, by decide +kernel⟩

def target100 : Weights.Entry :=
  { word := [8, 6, 8, 4, 8, 12, 8], weights := [1, 0, 3, 0] }

-- Period 10, original row 5304, representative 10516.
def source101 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B016.Data.entryAt ⟨44, by decide +kernel⟩

def target101 : Weights.Entry :=
  { word := [8, 6, 8, 12, 8, 4, 8], weights := [0, 1, 1, 0] }

def points101 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 5309, representative 10514.
def source102 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B016.Data.entryAt ⟨42, by decide +kernel⟩

def target102 : Weights.Entry :=
  { word := [8, 6, 8, 12, 8, 12, 8], weights := [0, 1, 1, 0] }

-- Period 10, original row 5313, representative 10510.
def source103 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B016.Data.entryAt ⟨38, by decide +kernel⟩

def target103 : Weights.Entry :=
  { word := [8, 6, 10, 8, 8, 4, 8], weights := [0, 1, 1, 0] }

def points103 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 5316, representative 10509.
def source104 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B016.Data.entryAt ⟨37, by decide +kernel⟩

def target104 : Weights.Entry :=
  { word := [8, 6, 10, 8, 8, 12, 8], weights := [0, 1, 1, 0] }

-- Period 10, original row 5359, representative 10482.
def source105 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B016.Data.entryAt ⟨10, by decide +kernel⟩

def target105 : Weights.Entry :=
  { word := [8, 8, 0, 4, 8, 4, 2], weights := [1, 0, 1, 0] }

def points105 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 5), (4, 6), (5, 4), (6, 3), (7, 1), (8, 2), (9, 0)]

-- Period 10, original row 5360, representative 10492.
def source106 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B016.Data.entryAt ⟨20, by decide +kernel⟩

def target106 : Weights.Entry :=
  { word := [8, 8, 0, 4, 8, 4, 4], weights := [1, 0, 0, 1] }

def points106 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2), (9, 0)]

-- Period 10, original row 5385, representative 10501.
def source107 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B016.Data.entryAt ⟨29, by decide +kernel⟩

def target107 : Weights.Entry :=
  { word := [8, 8, 0, 9, 4, 4, 4], weights := [1, 1, 1, 1] }

def points107 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2), (9, 0)]

-- Period 10, original row 5389, representative 10497.
def source108 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B016.Data.entryAt ⟨25, by decide +kernel⟩

def target108 : Weights.Entry :=
  { word := [8, 8, 0, 9, 12, 4, 4], weights := [1, 1, 1, 1] }

def points108 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2), (9, 0)]

-- Period 10, original row 5397, representative 10494.
def source109 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B016.Data.entryAt ⟨22, by decide +kernel⟩

def target109 : Weights.Entry :=
  { word := [8, 8, 0, 12, 0, 4, 2], weights := [1, 0, 1, 0] }

def points109 : List (ℕ × ℕ) := [(0, 8), (1, 7), (2, 9), (3, 5), (4, 6), (5, 4), (6, 3), (7, 1), (8, 2), (9, 0)]

-- Period 10, original row 5398, representative 10494.
def source110 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B016.Data.entryAt ⟨22, by decide +kernel⟩

def target110 : Weights.Entry :=
  { word := [8, 8, 0, 12, 0, 4, 4], weights := [1, 0, 1, 0] }

def points110 : List (ℕ × ℕ) := [(0, 7), (1, 8), (2, 9), (3, 5), (4, 6), (5, 4), (6, 3), (7, 1), (8, 2), (9, 0)]

-- Period 10, original row 5422, representative 10483.
def source111 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B016.Data.entryAt ⟨11, by decide +kernel⟩

def target111 : Weights.Entry :=
  { word := [8, 8, 0, 12, 8, 4, 2], weights := [1, 0, 1, 0] }

def points111 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 5), (4, 6), (5, 4), (6, 3), (7, 1), (8, 2), (9, 0)]

-- Period 10, original row 5423, representative 10493.
def source112 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B016.Data.entryAt ⟨21, by decide +kernel⟩

def target112 : Weights.Entry :=
  { word := [8, 8, 0, 12, 8, 4, 4], weights := [1, 0, 0, 1] }

def points112 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2), (9, 0)]

-- Period 10, original row 5458, representative 10475.
def source113 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B016.Data.entryAt ⟨3, by decide +kernel⟩

def target113 : Weights.Entry :=
  { word := [8, 8, 1, 4, 8, 4, 2], weights := [1, 0, 1, 0] }

def points113 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 5), (4, 6), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 5459, representative 10485.
def source114 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B016.Data.entryAt ⟨13, by decide +kernel⟩

def target114 : Weights.Entry :=
  { word := [8, 8, 1, 4, 8, 4, 4], weights := [1, 0, 0, 1] }

def points114 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 5494, representative 10478.
def source115 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B016.Data.entryAt ⟨6, by decide +kernel⟩

def target115 : Weights.Entry :=
  { word := [8, 8, 1, 12, 8, 4, 2], weights := [1, 0, 1, 0] }

def points115 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 5), (4, 6), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 5495, representative 10488.
def source116 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B016.Data.entryAt ⟨16, by decide +kernel⟩

def target116 : Weights.Entry :=
  { word := [8, 8, 1, 12, 8, 4, 4], weights := [1, 0, 0, 1] }

def points116 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 5628, representative 10505.
def source117 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B016.Data.entryAt ⟨33, by decide +kernel⟩

def target117 : Weights.Entry :=
  { word := [8, 8, 4, 10, 8, 4, 4], weights := [1, 1, 1, 1] }

def points117 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 5713, representative 10500.
def source118 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B016.Data.entryAt ⟨28, by decide +kernel⟩

def target118 : Weights.Entry :=
  { word := [8, 8, 8, 9, 4, 4, 4], weights := [1, 1, 1, 1] }

def points118 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 5717, representative 10496.
def source119 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B016.Data.entryAt ⟨24, by decide +kernel⟩

def target119 : Weights.Entry :=
  { word := [8, 8, 8, 9, 12, 4, 4], weights := [1, 1, 1, 1] }

def points119 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 5835, representative 10504.
def source120 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B016.Data.entryAt ⟨32, by decide +kernel⟩

def target120 : Weights.Entry :=
  { word := [8, 8, 12, 10, 8, 4, 4], weights := [1, 1, 1, 1] }

def points120 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 6088, representative 10521.
def source121 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B016.Data.entryAt ⟨49, by decide +kernel⟩

def target121 : Weights.Entry :=
  { word := [8, 10, 0, 8, 1, 12, 8], weights := [0, 1, 1, 0] }

-- Period 10, original row 6095, representative 10522.
def source122 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B016.Data.entryAt ⟨50, by decide +kernel⟩

def target122 : Weights.Entry :=
  { word := [8, 10, 0, 9, 0, 4, 8], weights := [0, 1, 1, 0] }

def points122 : List (ℕ × ℕ) := [(0, 9), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2), (9, 0)]

-- Period 10, original row 6098, representative 10521.
def source123 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B016.Data.entryAt ⟨49, by decide +kernel⟩

def target123 : Weights.Entry :=
  { word := [8, 10, 0, 9, 0, 12, 8], weights := [0, 1, 1, 0] }

def points123 : List (ℕ × ℕ) := [(0, 9), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2), (9, 0)]

-- Period 10, original row 6155, representative 10531.
def source124 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B016.Data.entryAt ⟨59, by decide +kernel⟩

def target124 : Weights.Entry :=
  { word := [8, 10, 2, 2, 8, 0, 4], weights := [1, 0, 0, 1] }

def points124 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 6166, representative 10527.
def source125 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B016.Data.entryAt ⟨55, by decide +kernel⟩

def target125 : Weights.Entry :=
  { word := [8, 10, 2, 2, 8, 8, 2], weights := [1, 0, 0, 1] }

def points125 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 6167, representative 10529.
def source126 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B016.Data.entryAt ⟨57, by decide +kernel⟩

def target126 : Weights.Entry :=
  { word := [8, 10, 2, 2, 8, 8, 4], weights := [1, 0, 0, 1] }

def points126 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 6178, representative 10532.
def source127 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B016.Data.entryAt ⟨60, by decide +kernel⟩

def target127 : Weights.Entry :=
  { word := [8, 10, 2, 10, 8, 0, 4], weights := [1, 0, 0, 1] }

def points127 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

def period10Entries : List Weights.Entry := [target0, target1, target2, target3, target4, target5, target6, target7, target8, target9, target10, target11, target12, target13, target14, target15, target16, target17, target18, target19, target20, target21, target22, target23, target24, target25, target26, target27, target28, target29, target30, target31, target32, target33, target34, target35, target36, target37, target38, target39, target40, target41, target42, target43, target44, target45, target46, target47, target48, target49, target50, target51, target52, target53, target54, target55, target56, target57, target58, target59, target60, target61, target62, target63, target64, target65, target66, target67, target68, target69, target70, target71, target72, target73, target74, target75, target76, target77, target78, target79, target80, target81, target82, target83, target84, target85, target86, target87, target88, target89, target90, target91, target92, target93, target94, target95, target96, target97, target98, target99, target100, target101, target102, target103, target104, target105, target106, target107, target108, target109, target110, target111, target112, target113, target114, target115, target116, target117, target118, target119, target120, target121, target122, target123, target124, target125, target126, target127]

def period10Chunk : RowCoverage.Chunk where
  rows := [⟨2471, target0⟩, ⟨2501, target1⟩, ⟨2508, target2⟩, ⟨2509, target3⟩, ⟨2587, target4⟩, ⟨2591, target5⟩, ⟨2601, target6⟩, ⟨2608, target7⟩, ⟨2618, target8⟩, ⟨2629, target9⟩, ⟨2634, target10⟩, ⟨2643, target11⟩, ⟨2648, target12⟩, ⟨2655, target13⟩, ⟨2657, target14⟩, ⟨2662, target15⟩, ⟨2667, target16⟩, ⟨2669, target17⟩, ⟨2673, target18⟩, ⟨2677, target19⟩, ⟨2704, target20⟩, ⟨2706, target21⟩, ⟨2712, target22⟩, ⟨2717, target23⟩, ⟨2719, target24⟩, ⟨2724, target25⟩, ⟨2730, target26⟩, ⟨2736, target27⟩, ⟨2741, target28⟩, ⟨2752, target29⟩, ⟨2758, target30⟩, ⟨2771, target31⟩, ⟨2776, target32⟩, ⟨2785, target33⟩, ⟨2790, target34⟩, ⟨2829, target35⟩, ⟨2984, target36⟩, ⟨2996, target37⟩, ⟨3014, target38⟩, ⟨3015, target39⟩, ⟨3016, target40⟩, ⟨3058, target41⟩, ⟨3069, target42⟩, ⟨3087, target43⟩, ⟨3573, target44⟩, ⟨3577, target45⟩, ⟨3587, target46⟩, ⟨3594, target47⟩, ⟨3604, target48⟩, ⟨3610, target49⟩, ⟨3612, target50⟩, ⟨3617, target51⟩, ⟨3622, target52⟩, ⟨3624, target53⟩, ⟨3626, target54⟩, ⟨3630, target55⟩, ⟨3642, target56⟩, ⟨3644, target57⟩, ⟨3650, target58⟩, ⟨3655, target59⟩, ⟨3657, target60⟩, ⟨3660, target61⟩, ⟨3666, target62⟩, ⟨3747, target63⟩, ⟨3884, target64⟩, ⟨3892, target65⟩, ⟨3906, target66⟩, ⟨3913, target67⟩, ⟨4105, target68⟩, ⟨4109, target69⟩, ⟨4115, target70⟩, ⟨4116, target71⟩, ⟨4137, target72⟩, ⟨4138, target73⟩, ⟨4173, target74⟩, ⟨4174, target75⟩, ⟨4305, target76⟩, ⟨4364, target77⟩, ⟨4368, target78⟩, ⟨4461, target79⟩, ⟨4462, target80⟩, ⟨4481, target81⟩, ⟨4694, target82⟩, ⟨4866, target83⟩, ⟨4881, target84⟩, ⟨4885, target85⟩, ⟨4910, target86⟩, ⟨4920, target87⟩, ⟨4924, target88⟩, ⟨5016, target89⟩, ⟨5017, target90⟩, ⟨5052, target91⟩, ⟨5053, target92⟩, ⟨5173, target93⟩, ⟨5174, target94⟩, ⟨5215, target95⟩, ⟨5216, target96⟩, ⟨5296, target97⟩, ⟨5299, target98⟩, ⟨5300, target99⟩, ⟨5301, target100⟩, ⟨5304, target101⟩, ⟨5309, target102⟩, ⟨5313, target103⟩, ⟨5316, target104⟩, ⟨5359, target105⟩, ⟨5360, target106⟩, ⟨5385, target107⟩, ⟨5389, target108⟩, ⟨5397, target109⟩, ⟨5398, target110⟩, ⟨5422, target111⟩, ⟨5423, target112⟩, ⟨5458, target113⟩, ⟨5459, target114⟩, ⟨5494, target115⟩, ⟨5495, target116⟩, ⟨5628, target117⟩, ⟨5713, target118⟩, ⟨5717, target119⟩, ⟨5835, target120⟩, ⟨6088, target121⟩, ⟨6095, target122⟩, ⟨6098, target123⟩, ⟨6155, target124⟩, ⟨6166, target125⟩, ⟨6167, target126⟩, ⟨6178, target127⟩]
  indexMask := 580271491205297819284924212170975050519384428767210443647529750993806459108093671585253930835120827000666991729999626748151947798020234646148073823281126476316212554720257110265943276069499078948958196977679653019878957798371768180684821515059676944320725151217293039661846374580379024286364403048354681338434814441873413483823570116313742122010786440306400987716994965101073276075776081948972222610965819597042943190868305461265130770847461506310758976442281103121869209345961716047677152136159375432747153324028678771087438332440410249519707333343646872648172898906628046723277711849211397377349764662325362488929505220370650635988076631248490238474281842149547566384358349870412962456102541390527835256231527767375448253333945295744772387056870843948854855192528565444019377547256348460516033520442922886294308100529684486243302611517096386960280495595208643988757380610056843354589365547033389966685215790157893906659635969705035244879413900179866224371518570187952517022199205355627324779891268070079903729571849431507533136129467144891419862420107175430110754038948411135236724924570116292706106727328732637547324127627618861835506550394967674508549658705826212625162594988152145094259363891170618700289326394375436280336097598194318307045078007302900056288248483574849770259985933772168161858990449916562852206516379510624462880658846277114198310879435179421242572137535722349192612003318782254927483721457504450238914561200309499349627645194331546614110582989731236944039424827177989321728366452046070677528410377812804347797993509073834879507233715387541777515774456627383709872171906414640399389498917111508104164236229700816895664146655577205752091348979653383033506361835544116813053070449416266244248214037310495760114729010066064078534396325275032667386438257256486273878685360110529829359120925593141708895281480880630459500959511704510408949760
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

end FranklSmallCyclic.TransportBatches.G094.B000.Data
