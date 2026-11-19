module

public import Conjectures.FranklSmallCyclicRowCoverage
public import Conjectures.FranklSmallCyclicCanonicalWords
public import Conjectures.FranklSmallCyclicOrbit7Block020Data

/-! 128 literal targets sharing one source proof block.
Original words and row indices are retained; weights may be transported.
-/
@[expose] public section

namespace FranklSmallCyclic.TransportBatches.G020.B000.Data

-- Period 7, original row 173, representative 2701.
def source0 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B020.Data.entryAt ⟨127, by decide +kernel⟩

def target0 : Weights.Entry :=
  { word := [0, 1, 4, 8, 4, 10, 8], weights := [0, 1, 1, 0] }

-- Period 7, original row 262, representative 2700.
def source1 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B020.Data.entryAt ⟨126, by decide +kernel⟩

def target1 : Weights.Entry :=
  { word := [0, 1, 12, 8, 4, 10, 8], weights := [0, 1, 1, 0] }

-- Period 7, original row 359, representative 2696.
def source2 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B020.Data.entryAt ⟨122, by decide +kernel⟩

def target2 : Weights.Entry :=
  { word := [0, 2, 2, 2, 8, 10, 8], weights := [1, 0, 0, 1] }

-- Period 7, original row 405, representative 2699.
def source3 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B020.Data.entryAt ⟨125, by decide +kernel⟩

def target3 : Weights.Entry :=
  { word := [0, 2, 2, 10, 8, 10, 8], weights := [0, 1, 1, 0] }

-- Period 7, original row 457, representative 2697.
def source4 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B020.Data.entryAt ⟨123, by decide +kernel⟩

def target4 : Weights.Entry :=
  { word := [0, 2, 10, 2, 8, 10, 8], weights := [1, 0, 0, 1] }

-- Period 7, original row 500, representative 2698.
def source5 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B020.Data.entryAt ⟨124, by decide +kernel⟩

def target5 : Weights.Entry :=
  { word := [0, 2, 10, 10, 8, 10, 8], weights := [0, 1, 1, 0] }

-- Period 7, original row 2386, representative 2682.
def source6 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B020.Data.entryAt ⟨108, by decide +kernel⟩

def target6 : Weights.Entry :=
  { word := [2, 0, 0, 2, 2, 10, 8], weights := [1, 0, 0, 1] }

-- Period 7, original row 2396, representative 2687.
def source7 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B020.Data.entryAt ⟨113, by decide +kernel⟩

def target7 : Weights.Entry :=
  { word := [2, 0, 0, 10, 2, 10, 8], weights := [1, 0, 0, 1] }

-- Period 7, original row 2418, representative 2688.
def source8 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B020.Data.entryAt ⟨114, by decide +kernel⟩

def target8 : Weights.Entry :=
  { word := [2, 0, 4, 2, 0, 9, 8], weights := [1, 0, 0, 1] }

-- Period 7, original row 2420, representative 2688.
def source9 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B020.Data.entryAt ⟨114, by decide +kernel⟩

def target9 : Weights.Entry :=
  { word := [2, 0, 4, 2, 0, 10, 8], weights := [1, 0, 0, 1] }

def points9 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 2426, representative 2693.
def source10 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B020.Data.entryAt ⟨119, by decide +kernel⟩

def target10 : Weights.Entry :=
  { word := [2, 0, 4, 2, 8, 10, 8], weights := [1, 0, 0, 1] }

-- Period 7, original row 2440, representative 2695.
def source11 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B020.Data.entryAt ⟨121, by decide +kernel⟩

def target11 : Weights.Entry :=
  { word := [2, 0, 4, 10, 0, 9, 8], weights := [1, 0, 0, 1] }

-- Period 7, original row 2441, representative 2695.
def source12 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B020.Data.entryAt ⟨121, by decide +kernel⟩

def target12 : Weights.Entry :=
  { word := [2, 0, 4, 10, 0, 10, 8], weights := [1, 0, 0, 1] }

def points12 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 2452, representative 2694.
def source13 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B020.Data.entryAt ⟨120, by decide +kernel⟩

def target13 : Weights.Entry :=
  { word := [2, 0, 4, 10, 8, 10, 8], weights := [1, 0, 0, 1] }

-- Period 7, original row 2463, representative 2683.
def source14 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B020.Data.entryAt ⟨109, by decide +kernel⟩

def target14 : Weights.Entry :=
  { word := [2, 0, 8, 2, 2, 10, 8], weights := [1, 0, 0, 1] }

-- Period 7, original row 2467, representative 2684.
def source15 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B020.Data.entryAt ⟨110, by decide +kernel⟩

def target15 : Weights.Entry :=
  { word := [2, 0, 8, 2, 10, 10, 8], weights := [1, 0, 0, 1] }

-- Period 7, original row 2485, representative 2686.
def source16 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B020.Data.entryAt ⟨112, by decide +kernel⟩

def target16 : Weights.Entry :=
  { word := [2, 0, 8, 10, 2, 10, 8], weights := [1, 0, 0, 1] }

-- Period 7, original row 2487, representative 2685.
def source17 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B020.Data.entryAt ⟨111, by decide +kernel⟩

def target17 : Weights.Entry :=
  { word := [2, 0, 8, 10, 10, 10, 8], weights := [1, 0, 0, 1] }

-- Period 7, original row 2535, representative 2689.
def source18 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B020.Data.entryAt ⟨115, by decide +kernel⟩

def target18 : Weights.Entry :=
  { word := [2, 0, 12, 2, 0, 9, 8], weights := [1, 0, 0, 1] }

-- Period 7, original row 2537, representative 2689.
def source19 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B020.Data.entryAt ⟨115, by decide +kernel⟩

def target19 : Weights.Entry :=
  { word := [2, 0, 12, 2, 0, 10, 8], weights := [1, 0, 0, 1] }

def points19 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 2543, representative 2690.
def source20 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B020.Data.entryAt ⟨116, by decide +kernel⟩

def target20 : Weights.Entry :=
  { word := [2, 0, 12, 2, 8, 10, 8], weights := [1, 0, 0, 1] }

-- Period 7, original row 2562, representative 2692.
def source21 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B020.Data.entryAt ⟨118, by decide +kernel⟩

def target21 : Weights.Entry :=
  { word := [2, 0, 12, 10, 0, 9, 8], weights := [1, 0, 0, 1] }

-- Period 7, original row 2563, representative 2692.
def source22 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B020.Data.entryAt ⟨118, by decide +kernel⟩

def target22 : Weights.Entry :=
  { word := [2, 0, 12, 10, 0, 10, 8], weights := [1, 0, 0, 1] }

def points22 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 2574, representative 2691.
def source23 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B020.Data.entryAt ⟨117, by decide +kernel⟩

def target23 : Weights.Entry :=
  { word := [2, 0, 12, 10, 8, 10, 8], weights := [1, 0, 0, 1] }

-- Period 7, original row 2798, representative 2590.
def source24 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B020.Data.entryAt ⟨16, by decide +kernel⟩

def target24 : Weights.Entry :=
  { word := [2, 8, 0, 2, 2, 2, 8], weights := [1, 0, 0, 1] }

-- Period 7, original row 2800, representative 2574.
def source25 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B020.Data.entryAt ⟨0, by decide +kernel⟩

def target25 : Weights.Entry :=
  { word := [2, 8, 0, 2, 2, 10, 8], weights := [1, 0, 0, 1] }

-- Period 7, original row 2802, representative 2595.
def source26 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B020.Data.entryAt ⟨21, by decide +kernel⟩

def target26 : Weights.Entry :=
  { word := [2, 8, 0, 2, 10, 2, 8], weights := [1, 0, 0, 1] }

-- Period 7, original row 2804, representative 2579.
def source27 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B020.Data.entryAt ⟨5, by decide +kernel⟩

def target27 : Weights.Entry :=
  { word := [2, 8, 0, 2, 10, 10, 8], weights := [1, 0, 0, 1] }

-- Period 7, original row 2808, representative 2674.
def source28 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B020.Data.entryAt ⟨100, by decide +kernel⟩

def target28 : Weights.Entry :=
  { word := [2, 8, 0, 4, 2, 0, 8], weights := [1, 0, 1, 0] }

-- Period 7, original row 2814, representative 2662.
def source29 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B020.Data.entryAt ⟨88, by decide +kernel⟩

def target29 : Weights.Entry :=
  { word := [2, 8, 0, 4, 2, 8, 8], weights := [1, 0, 1, 0] }

-- Period 7, original row 2834, representative 2679.
def source30 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B020.Data.entryAt ⟨105, by decide +kernel⟩

def target30 : Weights.Entry :=
  { word := [2, 8, 0, 4, 10, 0, 8], weights := [1, 0, 1, 0] }

-- Period 7, original row 2840, representative 2667.
def source31 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B020.Data.entryAt ⟨93, by decide +kernel⟩

def target31 : Weights.Entry :=
  { word := [2, 8, 0, 4, 10, 8, 8], weights := [1, 0, 1, 0] }

-- Period 7, original row 2845, representative 2597.
def source32 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B020.Data.entryAt ⟨23, by decide +kernel⟩

def target32 : Weights.Entry :=
  { word := [2, 8, 0, 10, 2, 2, 8], weights := [1, 0, 0, 1] }

-- Period 7, original row 2846, representative 2581.
def source33 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B020.Data.entryAt ⟨7, by decide +kernel⟩

def target33 : Weights.Entry :=
  { word := [2, 8, 0, 10, 2, 10, 8], weights := [1, 0, 0, 1] }

-- Period 7, original row 2847, representative 2596.
def source34 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B020.Data.entryAt ⟨22, by decide +kernel⟩

def target34 : Weights.Entry :=
  { word := [2, 8, 0, 10, 10, 2, 8], weights := [1, 0, 0, 1] }

-- Period 7, original row 2848, representative 2580.
def source35 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B020.Data.entryAt ⟨6, by decide +kernel⟩

def target35 : Weights.Entry :=
  { word := [2, 8, 0, 10, 10, 10, 8], weights := [1, 0, 0, 1] }

-- Period 7, original row 2860, representative 2681.
def source36 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B020.Data.entryAt ⟨107, by decide +kernel⟩

def target36 : Weights.Entry :=
  { word := [2, 8, 0, 12, 2, 0, 8], weights := [1, 0, 1, 0] }

-- Period 7, original row 2866, representative 2669.
def source37 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B020.Data.entryAt ⟨95, by decide +kernel⟩

def target37 : Weights.Entry :=
  { word := [2, 8, 0, 12, 2, 8, 8], weights := [1, 0, 1, 0] }

-- Period 7, original row 2885, representative 2680.
def source38 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B020.Data.entryAt ⟨106, by decide +kernel⟩

def target38 : Weights.Entry :=
  { word := [2, 8, 0, 12, 10, 0, 8], weights := [1, 0, 1, 0] }

-- Period 7, original row 2891, representative 2668.
def source39 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B020.Data.entryAt ⟨94, by decide +kernel⟩

def target39 : Weights.Entry :=
  { word := [2, 8, 0, 12, 10, 8, 8], weights := [1, 0, 1, 0] }

-- Period 7, original row 2903, representative 2618.
def source40 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B020.Data.entryAt ⟨44, by decide +kernel⟩

def target40 : Weights.Entry :=
  { word := [2, 8, 4, 2, 0, 1, 8], weights := [1, 0, 0, 1] }

-- Period 7, original row 2905, representative 2598.
def source41 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B020.Data.entryAt ⟨24, by decide +kernel⟩

def target41 : Weights.Entry :=
  { word := [2, 8, 4, 2, 0, 2, 8], weights := [1, 0, 0, 1] }

-- Period 7, original row 2910, representative 2622.
def source42 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B020.Data.entryAt ⟨48, by decide +kernel⟩

def target42 : Weights.Entry :=
  { word := [2, 8, 4, 2, 0, 8, 8], weights := [1, 0, 0, 1] }

-- Period 7, original row 2915, representative 2606.
def source43 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B020.Data.entryAt ⟨32, by decide +kernel⟩

def target43 : Weights.Entry :=
  { word := [2, 8, 4, 2, 0, 9, 8], weights := [1, 0, 0, 1] }

-- Period 7, original row 2917, representative 2582.
def source44 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B020.Data.entryAt ⟨8, by decide +kernel⟩

def target44 : Weights.Entry :=
  { word := [2, 8, 4, 2, 0, 10, 8], weights := [1, 0, 0, 1] }

-- Period 7, original row 2919, representative 2603.
def source45 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B020.Data.entryAt ⟨29, by decide +kernel⟩

def target45 : Weights.Entry :=
  { word := [2, 8, 4, 2, 8, 2, 8], weights := [1, 0, 0, 1] }

-- Period 7, original row 2923, representative 2587.
def source46 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B020.Data.entryAt ⟨13, by decide +kernel⟩

def target46 : Weights.Entry :=
  { word := [2, 8, 4, 2, 8, 10, 8], weights := [1, 0, 0, 1] }

-- Period 7, original row 2932, representative 2621.
def source47 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B020.Data.entryAt ⟨47, by decide +kernel⟩

def target47 : Weights.Entry :=
  { word := [2, 8, 4, 10, 0, 1, 8], weights := [1, 0, 0, 1] }

-- Period 7, original row 2933, representative 2605.
def source48 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B020.Data.entryAt ⟨31, by decide +kernel⟩

def target48 : Weights.Entry :=
  { word := [2, 8, 4, 10, 0, 2, 8], weights := [1, 0, 0, 1] }

-- Period 7, original row 2937, representative 2625.
def source49 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B020.Data.entryAt ⟨51, by decide +kernel⟩

def target49 : Weights.Entry :=
  { word := [2, 8, 4, 10, 0, 8, 8], weights := [1, 0, 0, 1] }

-- Period 7, original row 2941, representative 2609.
def source50 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B020.Data.entryAt ⟨35, by decide +kernel⟩

def target50 : Weights.Entry :=
  { word := [2, 8, 4, 10, 0, 9, 8], weights := [1, 0, 0, 1] }

-- Period 7, original row 2942, representative 2589.
def source51 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B020.Data.entryAt ⟨15, by decide +kernel⟩

def target51 : Weights.Entry :=
  { word := [2, 8, 4, 10, 0, 10, 8], weights := [1, 0, 0, 1] }

-- Period 7, original row 2943, representative 2604.
def source52 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B020.Data.entryAt ⟨30, by decide +kernel⟩

def target52 : Weights.Entry :=
  { word := [2, 8, 4, 10, 8, 2, 8], weights := [1, 0, 0, 1] }

-- Period 7, original row 2946, representative 2588.
def source53 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B020.Data.entryAt ⟨14, by decide +kernel⟩

def target53 : Weights.Entry :=
  { word := [2, 8, 4, 10, 8, 10, 8], weights := [1, 0, 0, 1] }

-- Period 7, original row 2962, representative 2591.
def source54 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B020.Data.entryAt ⟨17, by decide +kernel⟩

def target54 : Weights.Entry :=
  { word := [2, 8, 8, 2, 2, 2, 8], weights := [1, 0, 0, 1] }

-- Period 7, original row 2964, representative 2575.
def source55 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B020.Data.entryAt ⟨1, by decide +kernel⟩

def target55 : Weights.Entry :=
  { word := [2, 8, 8, 2, 2, 10, 8], weights := [1, 0, 0, 1] }

-- Period 7, original row 2966, representative 2592.
def source56 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B020.Data.entryAt ⟨18, by decide +kernel⟩

def target56 : Weights.Entry :=
  { word := [2, 8, 8, 2, 10, 2, 8], weights := [1, 0, 0, 1] }

-- Period 7, original row 2968, representative 2576.
def source57 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B020.Data.entryAt ⟨2, by decide +kernel⟩

def target57 : Weights.Entry :=
  { word := [2, 8, 8, 2, 10, 10, 8], weights := [1, 0, 0, 1] }

-- Period 7, original row 2972, representative 2675.
def source58 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B020.Data.entryAt ⟨101, by decide +kernel⟩

def target58 : Weights.Entry :=
  { word := [2, 8, 8, 4, 2, 0, 8], weights := [1, 0, 1, 0] }

-- Period 7, original row 2978, representative 2663.
def source59 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B020.Data.entryAt ⟨89, by decide +kernel⟩

def target59 : Weights.Entry :=
  { word := [2, 8, 8, 4, 2, 8, 8], weights := [1, 0, 1, 0] }

-- Period 7, original row 3002, representative 2676.
def source60 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B020.Data.entryAt ⟨102, by decide +kernel⟩

def target60 : Weights.Entry :=
  { word := [2, 8, 8, 4, 10, 0, 8], weights := [1, 0, 1, 0] }

-- Period 7, original row 3008, representative 2664.
def source61 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B020.Data.entryAt ⟨90, by decide +kernel⟩

def target61 : Weights.Entry :=
  { word := [2, 8, 8, 4, 10, 8, 8], weights := [1, 0, 1, 0] }

-- Period 7, original row 3029, representative 2594.
def source62 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B020.Data.entryAt ⟨20, by decide +kernel⟩

def target62 : Weights.Entry :=
  { word := [2, 8, 8, 10, 2, 2, 8], weights := [1, 0, 0, 1] }

-- Period 7, original row 3030, representative 2578.
def source63 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B020.Data.entryAt ⟨4, by decide +kernel⟩

def target63 : Weights.Entry :=
  { word := [2, 8, 8, 10, 2, 10, 8], weights := [1, 0, 0, 1] }

-- Period 7, original row 3031, representative 2593.
def source64 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B020.Data.entryAt ⟨19, by decide +kernel⟩

def target64 : Weights.Entry :=
  { word := [2, 8, 8, 10, 10, 2, 8], weights := [1, 0, 0, 1] }

-- Period 7, original row 3032, representative 2577.
def source65 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B020.Data.entryAt ⟨3, by decide +kernel⟩

def target65 : Weights.Entry :=
  { word := [2, 8, 8, 10, 10, 10, 8], weights := [1, 0, 0, 1] }

-- Period 7, original row 3046, representative 2678.
def source66 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B020.Data.entryAt ⟨104, by decide +kernel⟩

def target66 : Weights.Entry :=
  { word := [2, 8, 8, 12, 2, 0, 8], weights := [1, 0, 1, 0] }

-- Period 7, original row 3052, representative 2666.
def source67 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B020.Data.entryAt ⟨92, by decide +kernel⟩

def target67 : Weights.Entry :=
  { word := [2, 8, 8, 12, 2, 8, 8], weights := [1, 0, 1, 0] }

-- Period 7, original row 3075, representative 2677.
def source68 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B020.Data.entryAt ⟨103, by decide +kernel⟩

def target68 : Weights.Entry :=
  { word := [2, 8, 8, 12, 10, 0, 8], weights := [1, 0, 1, 0] }

-- Period 7, original row 3081, representative 2665.
def source69 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B020.Data.entryAt ⟨91, by decide +kernel⟩

def target69 : Weights.Entry :=
  { word := [2, 8, 8, 12, 10, 8, 8], weights := [1, 0, 1, 0] }

-- Period 7, original row 3111, representative 2619.
def source70 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B020.Data.entryAt ⟨45, by decide +kernel⟩

def target70 : Weights.Entry :=
  { word := [2, 8, 12, 2, 0, 1, 8], weights := [1, 0, 0, 1] }

-- Period 7, original row 3113, representative 2599.
def source71 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B020.Data.entryAt ⟨25, by decide +kernel⟩

def target71 : Weights.Entry :=
  { word := [2, 8, 12, 2, 0, 2, 8], weights := [1, 0, 0, 1] }

-- Period 7, original row 3118, representative 2623.
def source72 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B020.Data.entryAt ⟨49, by decide +kernel⟩

def target72 : Weights.Entry :=
  { word := [2, 8, 12, 2, 0, 8, 8], weights := [1, 0, 0, 1] }

-- Period 7, original row 3123, representative 2607.
def source73 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B020.Data.entryAt ⟨33, by decide +kernel⟩

def target73 : Weights.Entry :=
  { word := [2, 8, 12, 2, 0, 9, 8], weights := [1, 0, 0, 1] }

-- Period 7, original row 3125, representative 2583.
def source74 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B020.Data.entryAt ⟨9, by decide +kernel⟩

def target74 : Weights.Entry :=
  { word := [2, 8, 12, 2, 0, 10, 8], weights := [1, 0, 0, 1] }

-- Period 7, original row 3127, representative 2600.
def source75 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B020.Data.entryAt ⟨26, by decide +kernel⟩

def target75 : Weights.Entry :=
  { word := [2, 8, 12, 2, 8, 2, 8], weights := [1, 0, 0, 1] }

-- Period 7, original row 3131, representative 2584.
def source76 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B020.Data.entryAt ⟨10, by decide +kernel⟩

def target76 : Weights.Entry :=
  { word := [2, 8, 12, 2, 8, 10, 8], weights := [1, 0, 0, 1] }

-- Period 7, original row 3140, representative 2620.
def source77 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B020.Data.entryAt ⟨46, by decide +kernel⟩

def target77 : Weights.Entry :=
  { word := [2, 8, 12, 10, 0, 1, 8], weights := [1, 0, 0, 1] }

-- Period 7, original row 3141, representative 2602.
def source78 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B020.Data.entryAt ⟨28, by decide +kernel⟩

def target78 : Weights.Entry :=
  { word := [2, 8, 12, 10, 0, 2, 8], weights := [1, 0, 0, 1] }

-- Period 7, original row 3145, representative 2624.
def source79 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B020.Data.entryAt ⟨50, by decide +kernel⟩

def target79 : Weights.Entry :=
  { word := [2, 8, 12, 10, 0, 8, 8], weights := [1, 0, 0, 1] }

-- Period 7, original row 3149, representative 2608.
def source80 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B020.Data.entryAt ⟨34, by decide +kernel⟩

def target80 : Weights.Entry :=
  { word := [2, 8, 12, 10, 0, 9, 8], weights := [1, 0, 0, 1] }

-- Period 7, original row 3150, representative 2586.
def source81 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B020.Data.entryAt ⟨12, by decide +kernel⟩

def target81 : Weights.Entry :=
  { word := [2, 8, 12, 10, 0, 10, 8], weights := [1, 0, 0, 1] }

-- Period 7, original row 3151, representative 2601.
def source82 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B020.Data.entryAt ⟨27, by decide +kernel⟩

def target82 : Weights.Entry :=
  { word := [2, 8, 12, 10, 8, 2, 8], weights := [1, 0, 0, 1] }

-- Period 7, original row 3156, representative 2585.
def source83 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B020.Data.entryAt ⟨11, by decide +kernel⟩

def target83 : Weights.Entry :=
  { word := [2, 8, 12, 10, 8, 10, 8], weights := [1, 0, 0, 1] }

-- Period 7, original row 3716, representative 2650.
def source84 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B020.Data.entryAt ⟨76, by decide +kernel⟩

def target84 : Weights.Entry :=
  { word := [4, 8, 0, 2, 2, 2, 8], weights := [1, 0, 0, 1] }

-- Period 7, original row 3718, representative 2634.
def source85 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B020.Data.entryAt ⟨60, by decide +kernel⟩

def target85 : Weights.Entry :=
  { word := [4, 8, 0, 2, 2, 10, 8], weights := [1, 0, 0, 1] }

-- Period 7, original row 3720, representative 2655.
def source86 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B020.Data.entryAt ⟨81, by decide +kernel⟩

def target86 : Weights.Entry :=
  { word := [4, 8, 0, 2, 10, 2, 8], weights := [1, 0, 0, 1] }

-- Period 7, original row 3722, representative 2639.
def source87 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B020.Data.entryAt ⟨65, by decide +kernel⟩

def target87 : Weights.Entry :=
  { word := [4, 8, 0, 2, 10, 10, 8], weights := [1, 0, 0, 1] }

-- Period 7, original row 3726, representative 2674.
def source88 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B020.Data.entryAt ⟨100, by decide +kernel⟩

def target88 : Weights.Entry :=
  { word := [4, 8, 0, 4, 2, 0, 8], weights := [1, 0, 1, 0] }

def points88 : List (ℕ × ℕ) := [(0, 0), (1, 2), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 3732, representative 2670.
def source89 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B020.Data.entryAt ⟨96, by decide +kernel⟩

def target89 : Weights.Entry :=
  { word := [4, 8, 0, 4, 2, 8, 8], weights := [1, 0, 1, 0] }

-- Period 7, original row 3752, representative 2679.
def source90 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B020.Data.entryAt ⟨105, by decide +kernel⟩

def target90 : Weights.Entry :=
  { word := [4, 8, 0, 4, 10, 0, 8], weights := [1, 0, 1, 0] }

def points90 : List (ℕ × ℕ) := [(0, 0), (1, 2), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 3758, representative 2671.
def source91 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B020.Data.entryAt ⟨97, by decide +kernel⟩

def target91 : Weights.Entry :=
  { word := [4, 8, 0, 4, 10, 8, 8], weights := [1, 0, 1, 0] }

-- Period 7, original row 3763, representative 2657.
def source92 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B020.Data.entryAt ⟨83, by decide +kernel⟩

def target92 : Weights.Entry :=
  { word := [4, 8, 0, 10, 2, 2, 8], weights := [1, 0, 0, 1] }

-- Period 7, original row 3764, representative 2641.
def source93 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B020.Data.entryAt ⟨67, by decide +kernel⟩

def target93 : Weights.Entry :=
  { word := [4, 8, 0, 10, 2, 10, 8], weights := [1, 0, 0, 1] }

-- Period 7, original row 3765, representative 2656.
def source94 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B020.Data.entryAt ⟨82, by decide +kernel⟩

def target94 : Weights.Entry :=
  { word := [4, 8, 0, 10, 10, 2, 8], weights := [1, 0, 0, 1] }

-- Period 7, original row 3766, representative 2640.
def source95 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B020.Data.entryAt ⟨66, by decide +kernel⟩

def target95 : Weights.Entry :=
  { word := [4, 8, 0, 10, 10, 10, 8], weights := [1, 0, 0, 1] }

-- Period 7, original row 3770, representative 2681.
def source96 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B020.Data.entryAt ⟨107, by decide +kernel⟩

def target96 : Weights.Entry :=
  { word := [4, 8, 0, 12, 2, 0, 8], weights := [1, 0, 1, 0] }

def points96 : List (ℕ × ℕ) := [(0, 0), (1, 2), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 3776, representative 2673.
def source97 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B020.Data.entryAt ⟨99, by decide +kernel⟩

def target97 : Weights.Entry :=
  { word := [4, 8, 0, 12, 2, 8, 8], weights := [1, 0, 1, 0] }

-- Period 7, original row 3795, representative 2680.
def source98 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B020.Data.entryAt ⟨106, by decide +kernel⟩

def target98 : Weights.Entry :=
  { word := [4, 8, 0, 12, 10, 0, 8], weights := [1, 0, 1, 0] }

def points98 : List (ℕ × ℕ) := [(0, 0), (1, 2), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 3801, representative 2672.
def source99 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B020.Data.entryAt ⟨98, by decide +kernel⟩

def target99 : Weights.Entry :=
  { word := [4, 8, 0, 12, 10, 8, 8], weights := [1, 0, 1, 0] }

-- Period 7, original row 3807, representative 2614.
def source100 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B020.Data.entryAt ⟨40, by decide +kernel⟩

def target100 : Weights.Entry :=
  { word := [4, 8, 4, 2, 0, 1, 8], weights := [1, 0, 0, 1] }

-- Period 7, original row 3809, representative 2642.
def source101 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B020.Data.entryAt ⟨68, by decide +kernel⟩

def target101 : Weights.Entry :=
  { word := [4, 8, 4, 2, 0, 2, 8], weights := [1, 0, 0, 1] }

-- Period 7, original row 3814, representative 2658.
def source102 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B020.Data.entryAt ⟨84, by decide +kernel⟩

def target102 : Weights.Entry :=
  { word := [4, 8, 4, 2, 0, 8, 8], weights := [1, 0, 0, 1] }

-- Period 7, original row 3819, representative 2610.
def source103 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B020.Data.entryAt ⟨36, by decide +kernel⟩

def target103 : Weights.Entry :=
  { word := [4, 8, 4, 2, 0, 9, 8], weights := [1, 0, 0, 1] }

-- Period 7, original row 3821, representative 2626.
def source104 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B020.Data.entryAt ⟨52, by decide +kernel⟩

def target104 : Weights.Entry :=
  { word := [4, 8, 4, 2, 0, 10, 8], weights := [1, 0, 0, 1] }

-- Period 7, original row 3823, representative 2647.
def source105 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B020.Data.entryAt ⟨73, by decide +kernel⟩

def target105 : Weights.Entry :=
  { word := [4, 8, 4, 2, 8, 2, 8], weights := [1, 0, 0, 1] }

-- Period 7, original row 3827, representative 2631.
def source106 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B020.Data.entryAt ⟨57, by decide +kernel⟩

def target106 : Weights.Entry :=
  { word := [4, 8, 4, 2, 8, 10, 8], weights := [1, 0, 0, 1] }

-- Period 7, original row 3844, representative 2617.
def source107 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B020.Data.entryAt ⟨43, by decide +kernel⟩

def target107 : Weights.Entry :=
  { word := [4, 8, 4, 10, 0, 1, 8], weights := [1, 0, 0, 1] }

-- Period 7, original row 3845, representative 2649.
def source108 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B020.Data.entryAt ⟨75, by decide +kernel⟩

def target108 : Weights.Entry :=
  { word := [4, 8, 4, 10, 0, 2, 8], weights := [1, 0, 0, 1] }

-- Period 7, original row 3849, representative 2661.
def source109 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B020.Data.entryAt ⟨87, by decide +kernel⟩

def target109 : Weights.Entry :=
  { word := [4, 8, 4, 10, 0, 8, 8], weights := [1, 0, 0, 1] }

-- Period 7, original row 3853, representative 2613.
def source110 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B020.Data.entryAt ⟨39, by decide +kernel⟩

def target110 : Weights.Entry :=
  { word := [4, 8, 4, 10, 0, 9, 8], weights := [1, 0, 0, 1] }

-- Period 7, original row 3854, representative 2633.
def source111 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B020.Data.entryAt ⟨59, by decide +kernel⟩

def target111 : Weights.Entry :=
  { word := [4, 8, 4, 10, 0, 10, 8], weights := [1, 0, 0, 1] }

-- Period 7, original row 3855, representative 2648.
def source112 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B020.Data.entryAt ⟨74, by decide +kernel⟩

def target112 : Weights.Entry :=
  { word := [4, 8, 4, 10, 8, 2, 8], weights := [0, 1, 1, 0] }

-- Period 7, original row 3860, representative 2632.
def source113 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B020.Data.entryAt ⟨58, by decide +kernel⟩

def target113 : Weights.Entry :=
  { word := [4, 8, 4, 10, 8, 10, 8], weights := [0, 1, 1, 0] }

-- Period 7, original row 3874, representative 2651.
def source114 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B020.Data.entryAt ⟨77, by decide +kernel⟩

def target114 : Weights.Entry :=
  { word := [4, 8, 8, 2, 2, 2, 8], weights := [1, 0, 0, 1] }

-- Period 7, original row 3876, representative 2635.
def source115 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B020.Data.entryAt ⟨61, by decide +kernel⟩

def target115 : Weights.Entry :=
  { word := [4, 8, 8, 2, 2, 10, 8], weights := [1, 0, 0, 1] }

-- Period 7, original row 3878, representative 2652.
def source116 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B020.Data.entryAt ⟨78, by decide +kernel⟩

def target116 : Weights.Entry :=
  { word := [4, 8, 8, 2, 10, 2, 8], weights := [1, 0, 0, 1] }

-- Period 7, original row 3880, representative 2636.
def source117 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B020.Data.entryAt ⟨62, by decide +kernel⟩

def target117 : Weights.Entry :=
  { word := [4, 8, 8, 2, 10, 10, 8], weights := [1, 0, 0, 1] }

-- Period 7, original row 3899, representative 2654.
def source118 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B020.Data.entryAt ⟨80, by decide +kernel⟩

def target118 : Weights.Entry :=
  { word := [4, 8, 8, 10, 2, 2, 8], weights := [0, 1, 1, 0] }

-- Period 7, original row 3900, representative 2638.
def source119 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B020.Data.entryAt ⟨64, by decide +kernel⟩

def target119 : Weights.Entry :=
  { word := [4, 8, 8, 10, 2, 10, 8], weights := [0, 1, 1, 0] }

-- Period 7, original row 3901, representative 2653.
def source120 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B020.Data.entryAt ⟨79, by decide +kernel⟩

def target120 : Weights.Entry :=
  { word := [4, 8, 8, 10, 10, 2, 8], weights := [0, 1, 1, 0] }

-- Period 7, original row 3902, representative 2637.
def source121 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B020.Data.entryAt ⟨63, by decide +kernel⟩

def target121 : Weights.Entry :=
  { word := [4, 8, 8, 10, 10, 10, 8], weights := [0, 1, 1, 0] }

-- Period 7, original row 3915, representative 2615.
def source122 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B020.Data.entryAt ⟨41, by decide +kernel⟩

def target122 : Weights.Entry :=
  { word := [4, 8, 12, 2, 0, 1, 8], weights := [1, 0, 0, 1] }

-- Period 7, original row 3917, representative 2643.
def source123 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B020.Data.entryAt ⟨69, by decide +kernel⟩

def target123 : Weights.Entry :=
  { word := [4, 8, 12, 2, 0, 2, 8], weights := [1, 0, 0, 1] }

-- Period 7, original row 3922, representative 2659.
def source124 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B020.Data.entryAt ⟨85, by decide +kernel⟩

def target124 : Weights.Entry :=
  { word := [4, 8, 12, 2, 0, 8, 8], weights := [1, 0, 0, 1] }

-- Period 7, original row 3927, representative 2611.
def source125 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B020.Data.entryAt ⟨37, by decide +kernel⟩

def target125 : Weights.Entry :=
  { word := [4, 8, 12, 2, 0, 9, 8], weights := [1, 0, 0, 1] }

-- Period 7, original row 3929, representative 2627.
def source126 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B020.Data.entryAt ⟨53, by decide +kernel⟩

def target126 : Weights.Entry :=
  { word := [4, 8, 12, 2, 0, 10, 8], weights := [1, 0, 0, 1] }

-- Period 7, original row 3931, representative 2644.
def source127 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B020.Data.entryAt ⟨70, by decide +kernel⟩

def target127 : Weights.Entry :=
  { word := [4, 8, 12, 2, 8, 2, 8], weights := [1, 0, 0, 1] }

def period7Entries : List Weights.Entry := [target0, target1, target2, target3, target4, target5, target6, target7, target8, target9, target10, target11, target12, target13, target14, target15, target16, target17, target18, target19, target20, target21, target22, target23, target24, target25, target26, target27, target28, target29, target30, target31, target32, target33, target34, target35, target36, target37, target38, target39, target40, target41, target42, target43, target44, target45, target46, target47, target48, target49, target50, target51, target52, target53, target54, target55, target56, target57, target58, target59, target60, target61, target62, target63, target64, target65, target66, target67, target68, target69, target70, target71, target72, target73, target74, target75, target76, target77, target78, target79, target80, target81, target82, target83, target84, target85, target86, target87, target88, target89, target90, target91, target92, target93, target94, target95, target96, target97, target98, target99, target100, target101, target102, target103, target104, target105, target106, target107, target108, target109, target110, target111, target112, target113, target114, target115, target116, target117, target118, target119, target120, target121, target122, target123, target124, target125, target126, target127]

def period7Chunk : RowCoverage.Chunk where
  rows := [⟨173, target0⟩, ⟨262, target1⟩, ⟨359, target2⟩, ⟨405, target3⟩, ⟨457, target4⟩, ⟨500, target5⟩, ⟨2386, target6⟩, ⟨2396, target7⟩, ⟨2418, target8⟩, ⟨2420, target9⟩, ⟨2426, target10⟩, ⟨2440, target11⟩, ⟨2441, target12⟩, ⟨2452, target13⟩, ⟨2463, target14⟩, ⟨2467, target15⟩, ⟨2485, target16⟩, ⟨2487, target17⟩, ⟨2535, target18⟩, ⟨2537, target19⟩, ⟨2543, target20⟩, ⟨2562, target21⟩, ⟨2563, target22⟩, ⟨2574, target23⟩, ⟨2798, target24⟩, ⟨2800, target25⟩, ⟨2802, target26⟩, ⟨2804, target27⟩, ⟨2808, target28⟩, ⟨2814, target29⟩, ⟨2834, target30⟩, ⟨2840, target31⟩, ⟨2845, target32⟩, ⟨2846, target33⟩, ⟨2847, target34⟩, ⟨2848, target35⟩, ⟨2860, target36⟩, ⟨2866, target37⟩, ⟨2885, target38⟩, ⟨2891, target39⟩, ⟨2903, target40⟩, ⟨2905, target41⟩, ⟨2910, target42⟩, ⟨2915, target43⟩, ⟨2917, target44⟩, ⟨2919, target45⟩, ⟨2923, target46⟩, ⟨2932, target47⟩, ⟨2933, target48⟩, ⟨2937, target49⟩, ⟨2941, target50⟩, ⟨2942, target51⟩, ⟨2943, target52⟩, ⟨2946, target53⟩, ⟨2962, target54⟩, ⟨2964, target55⟩, ⟨2966, target56⟩, ⟨2968, target57⟩, ⟨2972, target58⟩, ⟨2978, target59⟩, ⟨3002, target60⟩, ⟨3008, target61⟩, ⟨3029, target62⟩, ⟨3030, target63⟩, ⟨3031, target64⟩, ⟨3032, target65⟩, ⟨3046, target66⟩, ⟨3052, target67⟩, ⟨3075, target68⟩, ⟨3081, target69⟩, ⟨3111, target70⟩, ⟨3113, target71⟩, ⟨3118, target72⟩, ⟨3123, target73⟩, ⟨3125, target74⟩, ⟨3127, target75⟩, ⟨3131, target76⟩, ⟨3140, target77⟩, ⟨3141, target78⟩, ⟨3145, target79⟩, ⟨3149, target80⟩, ⟨3150, target81⟩, ⟨3151, target82⟩, ⟨3156, target83⟩, ⟨3716, target84⟩, ⟨3718, target85⟩, ⟨3720, target86⟩, ⟨3722, target87⟩, ⟨3726, target88⟩, ⟨3732, target89⟩, ⟨3752, target90⟩, ⟨3758, target91⟩, ⟨3763, target92⟩, ⟨3764, target93⟩, ⟨3765, target94⟩, ⟨3766, target95⟩, ⟨3770, target96⟩, ⟨3776, target97⟩, ⟨3795, target98⟩, ⟨3801, target99⟩, ⟨3807, target100⟩, ⟨3809, target101⟩, ⟨3814, target102⟩, ⟨3819, target103⟩, ⟨3821, target104⟩, ⟨3823, target105⟩, ⟨3827, target106⟩, ⟨3844, target107⟩, ⟨3845, target108⟩, ⟨3849, target109⟩, ⟨3853, target110⟩, ⟨3854, target111⟩, ⟨3855, target112⟩, ⟨3860, target113⟩, ⟨3874, target114⟩, ⟨3876, target115⟩, ⟨3878, target116⟩, ⟨3880, target117⟩, ⟨3899, target118⟩, ⟨3900, target119⟩, ⟨3901, target120⟩, ⟨3902, target121⟩, ⟨3915, target122⟩, ⟨3917, target123⟩, ⟨3922, target124⟩, ⟨3927, target125⟩, ⟨3929, target126⟩, ⟨3931, target127⟩]
  indexMask := 29355079863092745803208439882377448541445912830054562394008856865346064398137555192805012429967662805357406781714213010793185579860638538112101436293696587635424428901176662314713499630339424692930817754483899665030770327309332530991171389366328973991985091776138412163594081896143823484055602002430127498732086805061136740475618776828199650381654860894152716173446795325741475651439200440924056405404812763289243701262114503044820650032532577144126609472125206908778873600518872841900415095546327052583629870378273614646832014105779899288034774605382283201250975262677850180979800102112455413813414139123649503199442426805650237617019258523337537320031963500691326476877635717044583922231169486024221934714054247568864961465320943818503073849949035824575464378970548177624828220094354590408859165452548672846039363477673255437267988962706276773906103529842202518915851915323800787007151477245870206323433151195024315832611863482510149368698899259115007533750772251506954672164267973648824845574424617601612592385729986913156605275312112396677537715031823500596471352514479170911312820227482831127607382298087559222028884454602381732530037955142510213980772490783115808230824531197952
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

end FranklSmallCyclic.TransportBatches.G020.B000.Data
