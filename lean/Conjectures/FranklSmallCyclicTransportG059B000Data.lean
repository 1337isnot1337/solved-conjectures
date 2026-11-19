module

public import Conjectures.FranklSmallCyclicRowCoverage
public import Conjectures.FranklSmallCyclicCanonicalWords
public import Conjectures.FranklSmallCyclicOrbit9Block006Data

/-! 128 literal targets sharing one source proof block.
Original words and row indices are retained; weights may be transported.
-/
@[expose] public section

namespace FranklSmallCyclic.TransportBatches.G059.B000.Data

-- Period 9, original row 153, representative 7597.
def source0 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B006.Data.entryAt ⟨79, by decide +kernel⟩

def target0 : Weights.Entry :=
  { word := [0, 1, 4, 2, 0, 8, 9], weights := [1, 0, 0, 1] }

-- Period 9, original row 154, representative 7635.
def source1 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B006.Data.entryAt ⟨117, by decide +kernel⟩

def target1 : Weights.Entry :=
  { word := [0, 1, 4, 2, 0, 8, 10], weights := [1, 0, 0, 1] }

-- Period 9, original row 155, representative 7635.
def source2 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B006.Data.entryAt ⟨117, by decide +kernel⟩

def target2 : Weights.Entry :=
  { word := [0, 1, 4, 2, 0, 8, 12], weights := [1, 0, 0, 1] }

def points2 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 8), (8, 7)]

-- Period 9, original row 163, representative 7636.
def source3 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B006.Data.entryAt ⟨118, by decide +kernel⟩

def target3 : Weights.Entry :=
  { word := [0, 1, 4, 2, 8, 8, 12], weights := [1, 0, 0, 1] }

-- Period 9, original row 181, representative 7600.
def source4 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B006.Data.entryAt ⟨82, by decide +kernel⟩

def target4 : Weights.Entry :=
  { word := [0, 1, 4, 10, 0, 8, 9], weights := [1, 0, 0, 1] }

-- Period 9, original row 182, representative 7642.
def source5 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B006.Data.entryAt ⟨123, by decide +kernel⟩

def target5 : Weights.Entry :=
  { word := [0, 1, 4, 10, 0, 8, 10], weights := [1, 0, 0, 1] }

-- Period 9, original row 183, representative 7642.
def source6 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B006.Data.entryAt ⟨123, by decide +kernel⟩

def target6 : Weights.Entry :=
  { word := [0, 1, 4, 10, 0, 8, 12], weights := [1, 0, 0, 1] }

def points6 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 8), (8, 7)]

-- Period 9, original row 195, representative 7639.
def source7 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B006.Data.entryAt ⟨120, by decide +kernel⟩

def target7 : Weights.Entry :=
  { word := [0, 1, 4, 10, 8, 8, 12], weights := [1, 0, 0, 1] }

-- Period 9, original row 242, representative 7598.
def source8 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B006.Data.entryAt ⟨80, by decide +kernel⟩

def target8 : Weights.Entry :=
  { word := [0, 1, 12, 2, 0, 8, 9], weights := [1, 0, 0, 1] }

-- Period 9, original row 243, representative 7640.
def source9 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B006.Data.entryAt ⟨121, by decide +kernel⟩

def target9 : Weights.Entry :=
  { word := [0, 1, 12, 2, 0, 8, 10], weights := [1, 0, 0, 1] }

-- Period 9, original row 244, representative 7640.
def source10 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B006.Data.entryAt ⟨121, by decide +kernel⟩

def target10 : Weights.Entry :=
  { word := [0, 1, 12, 2, 0, 8, 12], weights := [1, 0, 0, 1] }

def points10 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 8), (8, 7)]

-- Period 9, original row 252, representative 7637.
def source11 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B006.Data.entryAt ⟨119, by decide +kernel⟩

def target11 : Weights.Entry :=
  { word := [0, 1, 12, 2, 8, 8, 12], weights := [1, 0, 0, 1] }

-- Period 9, original row 274, representative 7599.
def source12 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B006.Data.entryAt ⟨81, by decide +kernel⟩

def target12 : Weights.Entry :=
  { word := [0, 1, 12, 10, 0, 8, 9], weights := [1, 0, 0, 1] }

-- Period 9, original row 275, representative 7641.
def source13 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B006.Data.entryAt ⟨122, by decide +kernel⟩

def target13 : Weights.Entry :=
  { word := [0, 1, 12, 10, 0, 8, 10], weights := [1, 0, 0, 1] }

-- Period 9, original row 276, representative 7641.
def source14 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B006.Data.entryAt ⟨122, by decide +kernel⟩

def target14 : Weights.Entry :=
  { word := [0, 1, 12, 10, 0, 8, 12], weights := [1, 0, 0, 1] }

def points14 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 8), (8, 7)]

-- Period 9, original row 325, representative 7597.
def source15 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B006.Data.entryAt ⟨79, by decide +kernel⟩

def target15 : Weights.Entry :=
  { word := [0, 2, 2, 2, 0, 8, 9], weights := [0, 1, 0, 1] }

def points15 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 326, representative 7635.
def source16 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B006.Data.entryAt ⟨117, by decide +kernel⟩

def target16 : Weights.Entry :=
  { word := [0, 2, 2, 2, 0, 8, 10], weights := [0, 1, 0, 1] }

def points16 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 327, representative 7635.
def source17 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B006.Data.entryAt ⟨117, by decide +kernel⟩

def target17 : Weights.Entry :=
  { word := [0, 2, 2, 2, 0, 8, 12], weights := [0, 1, 0, 1] }

def points17 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6), (7, 8), (8, 7)]

-- Period 9, original row 353, representative 7593.
def source18 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B006.Data.entryAt ⟨75, by decide +kernel⟩

def target18 : Weights.Entry :=
  { word := [0, 2, 2, 2, 8, 8, 9], weights := [1, 0, 0, 1] }

-- Period 9, original row 354, representative 7623.
def source19 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B006.Data.entryAt ⟨105, by decide +kernel⟩

def target19 : Weights.Entry :=
  { word := [0, 2, 2, 2, 8, 8, 10], weights := [1, 0, 0, 1] }

-- Period 9, original row 355, representative 7631.
def source20 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B006.Data.entryAt ⟨113, by decide +kernel⟩

def target20 : Weights.Entry :=
  { word := [0, 2, 2, 2, 8, 8, 12], weights := [1, 0, 0, 1] }

-- Period 9, original row 373, representative 7600.
def source21 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B006.Data.entryAt ⟨82, by decide +kernel⟩

def target21 : Weights.Entry :=
  { word := [0, 2, 2, 10, 0, 8, 9], weights := [0, 1, 0, 1] }

def points21 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 374, representative 7642.
def source22 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B006.Data.entryAt ⟨123, by decide +kernel⟩

def target22 : Weights.Entry :=
  { word := [0, 2, 2, 10, 0, 8, 10], weights := [0, 1, 0, 1] }

def points22 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 375, representative 7642.
def source23 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B006.Data.entryAt ⟨123, by decide +kernel⟩

def target23 : Weights.Entry :=
  { word := [0, 2, 2, 10, 0, 8, 12], weights := [0, 1, 0, 1] }

def points23 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6), (7, 8), (8, 7)]

-- Period 9, original row 401, representative 7596.
def source24 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B006.Data.entryAt ⟨78, by decide +kernel⟩

def target24 : Weights.Entry :=
  { word := [0, 2, 2, 10, 8, 8, 9], weights := [0, 1, 1, 0] }

-- Period 9, original row 402, representative 7626.
def source25 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B006.Data.entryAt ⟨108, by decide +kernel⟩

def target25 : Weights.Entry :=
  { word := [0, 2, 2, 10, 8, 8, 10], weights := [0, 1, 1, 0] }

-- Period 9, original row 403, representative 7634.
def source26 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B006.Data.entryAt ⟨116, by decide +kernel⟩

def target26 : Weights.Entry :=
  { word := [0, 2, 2, 10, 8, 8, 12], weights := [1, 0, 0, 1] }

-- Period 9, original row 430, representative 7598.
def source27 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B006.Data.entryAt ⟨80, by decide +kernel⟩

def target27 : Weights.Entry :=
  { word := [0, 2, 10, 2, 0, 8, 9], weights := [0, 1, 0, 1] }

def points27 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 431, representative 7640.
def source28 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B006.Data.entryAt ⟨121, by decide +kernel⟩

def target28 : Weights.Entry :=
  { word := [0, 2, 10, 2, 0, 8, 10], weights := [0, 1, 0, 1] }

def points28 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 432, representative 7640.
def source29 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B006.Data.entryAt ⟨121, by decide +kernel⟩

def target29 : Weights.Entry :=
  { word := [0, 2, 10, 2, 0, 8, 12], weights := [0, 1, 0, 1] }

def points29 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6), (7, 8), (8, 7)]

-- Period 9, original row 451, representative 7594.
def source30 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B006.Data.entryAt ⟨76, by decide +kernel⟩

def target30 : Weights.Entry :=
  { word := [0, 2, 10, 2, 8, 8, 9], weights := [1, 0, 0, 1] }

-- Period 9, original row 452, representative 7624.
def source31 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B006.Data.entryAt ⟨106, by decide +kernel⟩

def target31 : Weights.Entry :=
  { word := [0, 2, 10, 2, 8, 8, 10], weights := [1, 0, 0, 1] }

-- Period 9, original row 453, representative 7632.
def source32 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B006.Data.entryAt ⟨114, by decide +kernel⟩

def target32 : Weights.Entry :=
  { word := [0, 2, 10, 2, 8, 8, 12], weights := [1, 0, 0, 1] }

-- Period 9, original row 475, representative 7599.
def source33 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B006.Data.entryAt ⟨81, by decide +kernel⟩

def target33 : Weights.Entry :=
  { word := [0, 2, 10, 10, 0, 8, 9], weights := [0, 1, 0, 1] }

def points33 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 476, representative 7641.
def source34 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B006.Data.entryAt ⟨122, by decide +kernel⟩

def target34 : Weights.Entry :=
  { word := [0, 2, 10, 10, 0, 8, 10], weights := [0, 1, 0, 1] }

def points34 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 477, representative 7641.
def source35 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B006.Data.entryAt ⟨122, by decide +kernel⟩

def target35 : Weights.Entry :=
  { word := [0, 2, 10, 10, 0, 8, 12], weights := [0, 1, 0, 1] }

def points35 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6), (7, 8), (8, 7)]

-- Period 9, original row 496, representative 7595.
def source36 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B006.Data.entryAt ⟨77, by decide +kernel⟩

def target36 : Weights.Entry :=
  { word := [0, 2, 10, 10, 8, 8, 9], weights := [0, 1, 1, 0] }

-- Period 9, original row 497, representative 7625.
def source37 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B006.Data.entryAt ⟨107, by decide +kernel⟩

def target37 : Weights.Entry :=
  { word := [0, 2, 10, 10, 8, 8, 10], weights := [0, 1, 1, 0] }

-- Period 9, original row 498, representative 7633.
def source38 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B006.Data.entryAt ⟨115, by decide +kernel⟩

def target38 : Weights.Entry :=
  { word := [0, 2, 10, 10, 8, 8, 12], weights := [1, 0, 0, 1] }

-- Period 9, original row 749, representative 7643.
def source39 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B006.Data.entryAt ⟨124, by decide +kernel⟩

def target39 : Weights.Entry :=
  { word := [0, 6, 2, 8, 8, 0, 9], weights := [0, 1, 1, 0] }

-- Period 9, original row 750, representative 7643.
def source40 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B006.Data.entryAt ⟨124, by decide +kernel⟩

def target40 : Weights.Entry :=
  { word := [0, 6, 2, 8, 8, 0, 10], weights := [0, 1, 1, 0] }

def points40 : List (ℕ × ℕ) := [(0, 8), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 0)]

-- Period 9, original row 752, representative 7608.
def source41 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B006.Data.entryAt ⟨90, by decide +kernel⟩

def target41 : Weights.Entry :=
  { word := [0, 6, 2, 8, 8, 2, 10], weights := [0, 1, 1, 0] }

-- Period 9, original row 759, representative 7588.
def source42 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B006.Data.entryAt ⟨70, by decide +kernel⟩

def target42 : Weights.Entry :=
  { word := [0, 6, 2, 8, 8, 8, 9], weights := [0, 1, 1, 0] }

-- Period 9, original row 760, representative 7618.
def source43 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B006.Data.entryAt ⟨100, by decide +kernel⟩

def target43 : Weights.Entry :=
  { word := [0, 6, 2, 8, 8, 8, 10], weights := [0, 1, 1, 0] }

-- Period 9, original row 762, representative 7602.
def source44 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B006.Data.entryAt ⟨84, by decide +kernel⟩

def target44 : Weights.Entry :=
  { word := [0, 6, 2, 8, 8, 10, 10], weights := [0, 1, 1, 0] }

-- Period 9, original row 779, representative 7607.
def source45 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B006.Data.entryAt ⟨89, by decide +kernel⟩

def target45 : Weights.Entry :=
  { word := [0, 6, 10, 8, 8, 2, 10], weights := [0, 1, 1, 0] }

-- Period 9, original row 786, representative 7587.
def source46 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B006.Data.entryAt ⟨69, by decide +kernel⟩

def target46 : Weights.Entry :=
  { word := [0, 6, 10, 8, 8, 8, 9], weights := [0, 1, 1, 0] }

-- Period 9, original row 787, representative 7617.
def source47 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B006.Data.entryAt ⟨99, by decide +kernel⟩

def target47 : Weights.Entry :=
  { word := [0, 6, 10, 8, 8, 8, 10], weights := [0, 1, 1, 0] }

-- Period 9, original row 789, representative 7601.
def source48 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B006.Data.entryAt ⟨83, by decide +kernel⟩

def target48 : Weights.Entry :=
  { word := [0, 6, 10, 8, 8, 10, 10], weights := [0, 1, 1, 0] }

-- Period 9, original row 1129, representative 7605.
def source49 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B006.Data.entryAt ⟨87, by decide +kernel⟩

def target49 : Weights.Entry :=
  { word := [0, 9, 0, 1, 4, 8, 12], weights := [0, 1, 0, 0] }

-- Period 9, original row 1135, representative 7603.
def source50 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B006.Data.entryAt ⟨85, by decide +kernel⟩

def target50 : Weights.Entry :=
  { word := [0, 9, 0, 1, 12, 8, 12], weights := [0, 1, 0, 0] }

-- Period 9, original row 1160, representative 7609.
def source51 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B006.Data.entryAt ⟨91, by decide +kernel⟩

def target51 : Weights.Entry :=
  { word := [0, 9, 0, 4, 2, 8, 10], weights := [1, 0, 1, 0] }

-- Period 9, original row 1161, representative 7613.
def source52 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B006.Data.entryAt ⟨95, by decide +kernel⟩

def target52 : Weights.Entry :=
  { word := [0, 9, 0, 4, 2, 8, 12], weights := [1, 0, 0, 1] }

-- Period 9, original row 1186, representative 7610.
def source53 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B006.Data.entryAt ⟨92, by decide +kernel⟩

def target53 : Weights.Entry :=
  { word := [0, 9, 0, 4, 10, 8, 10], weights := [1, 0, 1, 0] }

-- Period 9, original row 1187, representative 7614.
def source54 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B006.Data.entryAt ⟨96, by decide +kernel⟩

def target54 : Weights.Entry :=
  { word := [0, 9, 0, 4, 10, 8, 12], weights := [1, 0, 0, 1] }

-- Period 9, original row 1220, representative 7612.
def source55 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B006.Data.entryAt ⟨94, by decide +kernel⟩

def target55 : Weights.Entry :=
  { word := [0, 9, 0, 12, 2, 8, 10], weights := [1, 0, 1, 0] }

-- Period 9, original row 1221, representative 7616.
def source56 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B006.Data.entryAt ⟨98, by decide +kernel⟩

def target56 : Weights.Entry :=
  { word := [0, 9, 0, 12, 2, 8, 12], weights := [1, 0, 1, 0] }

-- Period 9, original row 1245, representative 7611.
def source57 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B006.Data.entryAt ⟨93, by decide +kernel⟩

def target57 : Weights.Entry :=
  { word := [0, 9, 0, 12, 10, 8, 10], weights := [1, 0, 1, 0] }

-- Period 9, original row 1246, representative 7615.
def source58 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B006.Data.entryAt ⟨97, by decide +kernel⟩

def target58 : Weights.Entry :=
  { word := [0, 9, 0, 12, 10, 8, 12], weights := [1, 0, 1, 0] }

-- Period 9, original row 1266, representative 7606.
def source59 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B006.Data.entryAt ⟨88, by decide +kernel⟩

def target59 : Weights.Entry :=
  { word := [0, 9, 8, 1, 4, 8, 12], weights := [0, 1, 0, 0] }

-- Period 9, original row 1272, representative 7604.
def source60 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B006.Data.entryAt ⟨86, by decide +kernel⟩

def target60 : Weights.Entry :=
  { word := [0, 9, 8, 1, 12, 8, 12], weights := [0, 1, 0, 0] }

-- Period 9, original row 1379, representative 7644.
def source61 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B006.Data.entryAt ⟨125, by decide +kernel⟩

def target61 : Weights.Entry :=
  { word := [0, 10, 2, 2, 8, 0, 9], weights := [1, 1, 0, 0] }

-- Period 9, original row 1380, representative 7644.
def source62 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B006.Data.entryAt ⟨125, by decide +kernel⟩

def target62 : Weights.Entry :=
  { word := [0, 10, 2, 2, 8, 0, 10], weights := [1, 1, 0, 0] }

def points62 : List (ℕ × ℕ) := [(0, 8), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 0)]

-- Period 9, original row 1381, representative 7646.
def source63 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B006.Data.entryAt ⟨127, by decide +kernel⟩

def target63 : Weights.Entry :=
  { word := [0, 10, 2, 2, 8, 0, 12], weights := [1, 0, 0, 1] }

-- Period 9, original row 1396, representative 7589.
def source64 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B006.Data.entryAt ⟨71, by decide +kernel⟩

def target64 : Weights.Entry :=
  { word := [0, 10, 2, 2, 8, 8, 9], weights := [1, 0, 0, 1] }

-- Period 9, original row 1397, representative 7619.
def source65 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B006.Data.entryAt ⟨101, by decide +kernel⟩

def target65 : Weights.Entry :=
  { word := [0, 10, 2, 2, 8, 8, 10], weights := [1, 0, 0, 1] }

-- Period 9, original row 1398, representative 7627.
def source66 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B006.Data.entryAt ⟨109, by decide +kernel⟩

def target66 : Weights.Entry :=
  { word := [0, 10, 2, 2, 8, 8, 12], weights := [1, 0, 0, 1] }

-- Period 9, original row 1413, representative 7645.
def source67 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B006.Data.entryAt ⟨126, by decide +kernel⟩

def target67 : Weights.Entry :=
  { word := [0, 10, 2, 10, 8, 0, 9], weights := [1, 1, 0, 0] }

-- Period 9, original row 1414, representative 7645.
def source68 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B006.Data.entryAt ⟨126, by decide +kernel⟩

def target68 : Weights.Entry :=
  { word := [0, 10, 2, 10, 8, 0, 10], weights := [1, 1, 0, 0] }

def points68 : List (ℕ × ℕ) := [(0, 8), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 0)]

-- Period 9, original row 1427, representative 7592.
def source69 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B006.Data.entryAt ⟨74, by decide +kernel⟩

def target69 : Weights.Entry :=
  { word := [0, 10, 2, 10, 8, 8, 9], weights := [0, 1, 1, 0] }

-- Period 9, original row 1428, representative 7622.
def source70 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B006.Data.entryAt ⟨104, by decide +kernel⟩

def target70 : Weights.Entry :=
  { word := [0, 10, 2, 10, 8, 8, 10], weights := [0, 1, 1, 0] }

-- Period 9, original row 1429, representative 7630.
def source71 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B006.Data.entryAt ⟨112, by decide +kernel⟩

def target71 : Weights.Entry :=
  { word := [0, 10, 2, 10, 8, 8, 12], weights := [1, 0, 0, 1] }

-- Period 9, original row 1471, representative 7590.
def source72 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B006.Data.entryAt ⟨72, by decide +kernel⟩

def target72 : Weights.Entry :=
  { word := [0, 10, 10, 2, 8, 8, 9], weights := [1, 0, 0, 1] }

-- Period 9, original row 1472, representative 7620.
def source73 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B006.Data.entryAt ⟨102, by decide +kernel⟩

def target73 : Weights.Entry :=
  { word := [0, 10, 10, 2, 8, 8, 10], weights := [1, 0, 0, 1] }

-- Period 9, original row 1473, representative 7628.
def source74 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B006.Data.entryAt ⟨110, by decide +kernel⟩

def target74 : Weights.Entry :=
  { word := [0, 10, 10, 2, 8, 8, 12], weights := [1, 0, 0, 1] }

-- Period 9, original row 1495, representative 7591.
def source75 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B006.Data.entryAt ⟨73, by decide +kernel⟩

def target75 : Weights.Entry :=
  { word := [0, 10, 10, 10, 8, 8, 9], weights := [0, 1, 1, 0] }

-- Period 9, original row 1496, representative 7621.
def source76 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B006.Data.entryAt ⟨103, by decide +kernel⟩

def target76 : Weights.Entry :=
  { word := [0, 10, 10, 10, 8, 8, 10], weights := [0, 1, 1, 0] }

-- Period 9, original row 1497, representative 7629.
def source77 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B006.Data.entryAt ⟨111, by decide +kernel⟩

def target77 : Weights.Entry :=
  { word := [0, 10, 10, 10, 8, 8, 12], weights := [1, 0, 0, 1] }

-- Period 9, original row 4509, representative 7584.
def source78 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B006.Data.entryAt ⟨66, by decide +kernel⟩

def target78 : Weights.Entry :=
  { word := [8, 1, 0, 12, 0, 4, 8], weights := [0, 0, 1, 0] }

-- Period 9, original row 4513, representative 7567.
def source79 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B006.Data.entryAt ⟨49, by decide +kernel⟩

def target79 : Weights.Entry :=
  { word := [8, 1, 0, 12, 0, 12, 8], weights := [0, 0, 1, 0] }

-- Period 9, original row 4547, representative 7586.
def source80 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B006.Data.entryAt ⟨68, by decide +kernel⟩

def target80 : Weights.Entry :=
  { word := [8, 1, 4, 10, 0, 4, 8], weights := [1, 0, 2, 1] }

-- Period 9, original row 4559, representative 7569.
def source81 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B006.Data.entryAt ⟨51, by decide +kernel⟩

def target81 : Weights.Entry :=
  { word := [8, 1, 4, 10, 0, 12, 8], weights := [1, 0, 1, 1] }

-- Period 9, original row 4584, representative 7582.
def source82 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B006.Data.entryAt ⟨64, by decide +kernel⟩

def target82 : Weights.Entry :=
  { word := [8, 1, 8, 4, 4, 4, 8], weights := [1, 0, 0, 1] }

-- Period 9, original row 4585, representative 7644.
def source83 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B006.Data.entryAt ⟨125, by decide +kernel⟩

def target83 : Weights.Entry :=
  { word := [8, 1, 8, 4, 4, 12, 0], weights := [0, 0, 1, 1] }

def points83 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 4586, representative 7565.
def source84 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B006.Data.entryAt ⟨47, by decide +kernel⟩

def target84 : Weights.Entry :=
  { word := [8, 1, 8, 4, 4, 12, 8], weights := [1, 0, 0, 1] }

-- Period 9, original row 4587, representative 7643.
def source85 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B006.Data.entryAt ⟨124, by decide +kernel⟩

def target85 : Weights.Entry :=
  { word := [8, 1, 8, 8, 4, 6, 0], weights := [0, 1, 1, 0] }

def points85 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 4601, representative 7583.
def source86 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B006.Data.entryAt ⟨65, by decide +kernel⟩

def target86 : Weights.Entry :=
  { word := [8, 1, 8, 12, 4, 4, 8], weights := [1, 0, 0, 1] }

-- Period 9, original row 4602, representative 7645.
def source87 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B006.Data.entryAt ⟨126, by decide +kernel⟩

def target87 : Weights.Entry :=
  { word := [8, 1, 8, 12, 4, 12, 0], weights := [0, 0, 1, 1] }

def points87 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 4603, representative 7566.
def source88 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B006.Data.entryAt ⟨48, by decide +kernel⟩

def target88 : Weights.Entry :=
  { word := [8, 1, 8, 12, 4, 12, 8], weights := [1, 0, 0, 1] }

-- Period 9, original row 4638, representative 7585.
def source89 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B006.Data.entryAt ⟨67, by decide +kernel⟩

def target89 : Weights.Entry :=
  { word := [8, 1, 12, 10, 0, 4, 8], weights := [1, 0, 1, 1] }

-- Period 9, original row 4652, representative 7568.
def source90 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B006.Data.entryAt ⟨50, by decide +kernel⟩

def target90 : Weights.Entry :=
  { word := [8, 1, 12, 10, 0, 12, 8], weights := [1, 0, 1, 1] }

-- Period 9, original row 4669, representative 7550.
def source91 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B006.Data.entryAt ⟨32, by decide +kernel⟩

def target91 : Weights.Entry :=
  { word := [8, 2, 0, 1, 8, 1, 12], weights := [0, 1, 0, 0] }

-- Period 9, original row 4671, representative 7548.
def source92 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B006.Data.entryAt ⟨30, by decide +kernel⟩

def target92 : Weights.Entry :=
  { word := [8, 2, 0, 1, 8, 2, 10], weights := [0, 1, 0, 0] }

-- Period 9, original row 4674, representative 7552.
def source93 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B006.Data.entryAt ⟨34, by decide +kernel⟩

def target93 : Weights.Entry :=
  { word := [8, 2, 0, 1, 8, 8, 12], weights := [0, 1, 0, 0] }

-- Period 9, original row 4676, representative 7546.
def source94 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B006.Data.entryAt ⟨28, by decide +kernel⟩

def target94 : Weights.Entry :=
  { word := [8, 2, 0, 1, 8, 9, 12], weights := [0, 1, 0, 0] }

-- Period 9, original row 4678, representative 7544.
def source95 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B006.Data.entryAt ⟨26, by decide +kernel⟩

def target95 : Weights.Entry :=
  { word := [8, 2, 0, 1, 8, 10, 10], weights := [0, 1, 0, 0] }

-- Period 9, original row 4683, representative 7570.
def source96 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B006.Data.entryAt ⟨52, by decide +kernel⟩

def target96 : Weights.Entry :=
  { word := [8, 2, 0, 2, 0, 8, 9], weights := [1, 2, 0, 1] }

-- Period 9, original row 4706, representative 7551.
def source97 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B006.Data.entryAt ⟨33, by decide +kernel⟩

def target97 : Weights.Entry :=
  { word := [8, 2, 0, 9, 8, 1, 12], weights := [0, 1, 0, 0] }

-- Period 9, original row 4708, representative 7549.
def source98 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B006.Data.entryAt ⟨31, by decide +kernel⟩

def target98 : Weights.Entry :=
  { word := [8, 2, 0, 9, 8, 2, 10], weights := [0, 1, 0, 0] }

-- Period 9, original row 4714, representative 7553.
def source99 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B006.Data.entryAt ⟨35, by decide +kernel⟩

def target99 : Weights.Entry :=
  { word := [8, 2, 0, 9, 8, 8, 12], weights := [0, 1, 0, 0] }

-- Period 9, original row 4716, representative 7547.
def source100 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B006.Data.entryAt ⟨29, by decide +kernel⟩

def target100 : Weights.Entry :=
  { word := [8, 2, 0, 9, 8, 9, 12], weights := [0, 1, 0, 0] }

-- Period 9, original row 4718, representative 7545.
def source101 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B006.Data.entryAt ⟨27, by decide +kernel⟩

def target101 : Weights.Entry :=
  { word := [8, 2, 0, 9, 8, 10, 10], weights := [0, 1, 0, 0] }

-- Period 9, original row 4726, representative 7584.
def source102 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B006.Data.entryAt ⟨66, by decide +kernel⟩

def target102 : Weights.Entry :=
  { word := [8, 2, 0, 10, 0, 0, 9], weights := [0, 1, 0, 0] }

def points102 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2)]

-- Period 9, original row 4727, representative 7543.
def source103 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B006.Data.entryAt ⟨25, by decide +kernel⟩

def target103 : Weights.Entry :=
  { word := [8, 2, 0, 10, 0, 0, 10], weights := [0, 1, 0, 0] }

-- Period 9, original row 4728, representative 7543.
def source104 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B006.Data.entryAt ⟨25, by decide +kernel⟩

def target104 : Weights.Entry :=
  { word := [8, 2, 0, 10, 0, 0, 12], weights := [0, 1, 0, 0] }

def points104 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 8), (8, 7)]

-- Period 9, original row 4733, representative 7581.
def source105 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B006.Data.entryAt ⟨63, by decide +kernel⟩

def target105 : Weights.Entry :=
  { word := [8, 2, 0, 10, 0, 8, 9], weights := [1, 0, 0, 1] }

-- Period 9, original row 4734, representative 7537.
def source106 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B006.Data.entryAt ⟨19, by decide +kernel⟩

def target106 : Weights.Entry :=
  { word := [8, 2, 0, 10, 0, 8, 12], weights := [1, 0, 0, 1] }

-- Period 9, original row 4736, representative 7542.
def source107 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B006.Data.entryAt ⟨24, by decide +kernel⟩

def target107 : Weights.Entry :=
  { word := [8, 2, 0, 10, 8, 0, 12], weights := [0, 1, 0, 0] }

-- Period 9, original row 4740, representative 7530.
def source108 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B006.Data.entryAt ⟨12, by decide +kernel⟩

def target108 : Weights.Entry :=
  { word := [8, 2, 0, 10, 8, 8, 12], weights := [0, 1, 0, 0] }

-- Period 9, original row 4746, representative 7586.
def source109 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B006.Data.entryAt ⟨68, by decide +kernel⟩

def target109 : Weights.Entry :=
  { word := [8, 2, 0, 12, 2, 0, 9], weights := [1, 2, 0, 1] }

def points109 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2)]

-- Period 9, original row 4747, representative 7555.
def source110 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B006.Data.entryAt ⟨37, by decide +kernel⟩

def target110 : Weights.Entry :=
  { word := [8, 2, 0, 12, 2, 0, 10], weights := [1, 2, 1, 0] }

-- Period 9, original row 4753, representative 7585.
def source111 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B006.Data.entryAt ⟨67, by decide +kernel⟩

def target111 : Weights.Entry :=
  { word := [8, 2, 0, 12, 10, 0, 9], weights := [1, 1, 0, 1] }

def points111 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2)]

-- Period 9, original row 4754, representative 7554.
def source112 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B006.Data.entryAt ⟨36, by decide +kernel⟩

def target112 : Weights.Entry :=
  { word := [8, 2, 0, 12, 10, 0, 10], weights := [1, 1, 0, 1] }

-- Period 9, original row 4755, representative 7556.
def source113 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B006.Data.entryAt ⟨38, by decide +kernel⟩

def target113 : Weights.Entry :=
  { word := [8, 2, 0, 12, 10, 0, 12], weights := [1, 1, 0, 1] }

-- Period 9, original row 4766, representative 7575.
def source114 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B006.Data.entryAt ⟨57, by decide +kernel⟩

def target114 : Weights.Entry :=
  { word := [8, 2, 2, 2, 0, 8, 9], weights := [1, 0, 0, 1] }

-- Period 9, original row 4767, representative 7531.
def source115 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B006.Data.entryAt ⟨13, by decide +kernel⟩

def target115 : Weights.Entry :=
  { word := [8, 2, 2, 2, 0, 8, 10], weights := [1, 0, 0, 1] }

-- Period 9, original row 4768, representative 7531.
def source116 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B006.Data.entryAt ⟨13, by decide +kernel⟩

def target116 : Weights.Entry :=
  { word := [8, 2, 2, 2, 0, 8, 12], weights := [1, 0, 0, 1] }

def points116 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 8), (8, 7)]

-- Period 9, original row 4777, representative 7582.
def source117 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B006.Data.entryAt ⟨64, by decide +kernel⟩

def target117 : Weights.Entry :=
  { word := [8, 2, 2, 2, 8, 0, 9], weights := [1, 0, 0, 1] }

def points117 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 4778, representative 7538.
def source118 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B006.Data.entryAt ⟨20, by decide +kernel⟩

def target118 : Weights.Entry :=
  { word := [8, 2, 2, 2, 8, 0, 10], weights := [1, 1, 0, 0] }

-- Period 9, original row 4779, representative 7540.
def source119 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B006.Data.entryAt ⟨22, by decide +kernel⟩

def target119 : Weights.Entry :=
  { word := [8, 2, 2, 2, 8, 0, 12], weights := [1, 0, 0, 1] }

-- Period 9, original row 4789, representative 7571.
def source120 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B006.Data.entryAt ⟨53, by decide +kernel⟩

def target120 : Weights.Entry :=
  { word := [8, 2, 2, 2, 8, 8, 9], weights := [1, 0, 0, 1] }

-- Period 9, original row 4790, representative 7520.
def source121 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B006.Data.entryAt ⟨2, by decide +kernel⟩

def target121 : Weights.Entry :=
  { word := [8, 2, 2, 2, 8, 8, 10], weights := [1, 0, 0, 1] }

-- Period 9, original row 4791, representative 7524.
def source122 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B006.Data.entryAt ⟨6, by decide +kernel⟩

def target122 : Weights.Entry :=
  { word := [8, 2, 2, 2, 8, 8, 12], weights := [1, 0, 0, 1] }

-- Period 9, original row 4805, representative 7578.
def source123 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B006.Data.entryAt ⟨60, by decide +kernel⟩

def target123 : Weights.Entry :=
  { word := [8, 2, 2, 10, 0, 8, 9], weights := [1, 0, 0, 1] }

-- Period 9, original row 4806, representative 7534.
def source124 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B006.Data.entryAt ⟨16, by decide +kernel⟩

def target124 : Weights.Entry :=
  { word := [8, 2, 2, 10, 0, 8, 10], weights := [1, 0, 0, 1] }

-- Period 9, original row 4807, representative 7534.
def source125 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B006.Data.entryAt ⟨16, by decide +kernel⟩

def target125 : Weights.Entry :=
  { word := [8, 2, 2, 10, 0, 8, 12], weights := [1, 0, 0, 1] }

def points125 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 8), (8, 7)]

-- Period 9, original row 4817, representative 7583.
def source126 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B006.Data.entryAt ⟨65, by decide +kernel⟩

def target126 : Weights.Entry :=
  { word := [8, 2, 2, 10, 8, 0, 9], weights := [1, 0, 0, 1] }

def points126 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 4818, representative 7539.
def source127 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B006.Data.entryAt ⟨21, by decide +kernel⟩

def target127 : Weights.Entry :=
  { word := [8, 2, 2, 10, 8, 0, 10], weights := [1, 1, 0, 0] }

def period9Entries : List Weights.Entry := [target0, target1, target2, target3, target4, target5, target6, target7, target8, target9, target10, target11, target12, target13, target14, target15, target16, target17, target18, target19, target20, target21, target22, target23, target24, target25, target26, target27, target28, target29, target30, target31, target32, target33, target34, target35, target36, target37, target38, target39, target40, target41, target42, target43, target44, target45, target46, target47, target48, target49, target50, target51, target52, target53, target54, target55, target56, target57, target58, target59, target60, target61, target62, target63, target64, target65, target66, target67, target68, target69, target70, target71, target72, target73, target74, target75, target76, target77, target78, target79, target80, target81, target82, target83, target84, target85, target86, target87, target88, target89, target90, target91, target92, target93, target94, target95, target96, target97, target98, target99, target100, target101, target102, target103, target104, target105, target106, target107, target108, target109, target110, target111, target112, target113, target114, target115, target116, target117, target118, target119, target120, target121, target122, target123, target124, target125, target126, target127]

def period9Chunk : RowCoverage.Chunk where
  rows := [⟨153, target0⟩, ⟨154, target1⟩, ⟨155, target2⟩, ⟨163, target3⟩, ⟨181, target4⟩, ⟨182, target5⟩, ⟨183, target6⟩, ⟨195, target7⟩, ⟨242, target8⟩, ⟨243, target9⟩, ⟨244, target10⟩, ⟨252, target11⟩, ⟨274, target12⟩, ⟨275, target13⟩, ⟨276, target14⟩, ⟨325, target15⟩, ⟨326, target16⟩, ⟨327, target17⟩, ⟨353, target18⟩, ⟨354, target19⟩, ⟨355, target20⟩, ⟨373, target21⟩, ⟨374, target22⟩, ⟨375, target23⟩, ⟨401, target24⟩, ⟨402, target25⟩, ⟨403, target26⟩, ⟨430, target27⟩, ⟨431, target28⟩, ⟨432, target29⟩, ⟨451, target30⟩, ⟨452, target31⟩, ⟨453, target32⟩, ⟨475, target33⟩, ⟨476, target34⟩, ⟨477, target35⟩, ⟨496, target36⟩, ⟨497, target37⟩, ⟨498, target38⟩, ⟨749, target39⟩, ⟨750, target40⟩, ⟨752, target41⟩, ⟨759, target42⟩, ⟨760, target43⟩, ⟨762, target44⟩, ⟨779, target45⟩, ⟨786, target46⟩, ⟨787, target47⟩, ⟨789, target48⟩, ⟨1129, target49⟩, ⟨1135, target50⟩, ⟨1160, target51⟩, ⟨1161, target52⟩, ⟨1186, target53⟩, ⟨1187, target54⟩, ⟨1220, target55⟩, ⟨1221, target56⟩, ⟨1245, target57⟩, ⟨1246, target58⟩, ⟨1266, target59⟩, ⟨1272, target60⟩, ⟨1379, target61⟩, ⟨1380, target62⟩, ⟨1381, target63⟩, ⟨1396, target64⟩, ⟨1397, target65⟩, ⟨1398, target66⟩, ⟨1413, target67⟩, ⟨1414, target68⟩, ⟨1427, target69⟩, ⟨1428, target70⟩, ⟨1429, target71⟩, ⟨1471, target72⟩, ⟨1472, target73⟩, ⟨1473, target74⟩, ⟨1495, target75⟩, ⟨1496, target76⟩, ⟨1497, target77⟩, ⟨4509, target78⟩, ⟨4513, target79⟩, ⟨4547, target80⟩, ⟨4559, target81⟩, ⟨4584, target82⟩, ⟨4585, target83⟩, ⟨4586, target84⟩, ⟨4587, target85⟩, ⟨4601, target86⟩, ⟨4602, target87⟩, ⟨4603, target88⟩, ⟨4638, target89⟩, ⟨4652, target90⟩, ⟨4669, target91⟩, ⟨4671, target92⟩, ⟨4674, target93⟩, ⟨4676, target94⟩, ⟨4678, target95⟩, ⟨4683, target96⟩, ⟨4706, target97⟩, ⟨4708, target98⟩, ⟨4714, target99⟩, ⟨4716, target100⟩, ⟨4718, target101⟩, ⟨4726, target102⟩, ⟨4727, target103⟩, ⟨4728, target104⟩, ⟨4733, target105⟩, ⟨4734, target106⟩, ⟨4736, target107⟩, ⟨4740, target108⟩, ⟨4746, target109⟩, ⟨4747, target110⟩, ⟨4753, target111⟩, ⟨4754, target112⟩, ⟨4755, target113⟩, ⟨4766, target114⟩, ⟨4767, target115⟩, ⟨4768, target116⟩, ⟨4777, target117⟩, ⟨4778, target118⟩, ⟨4779, target119⟩, ⟨4789, target120⟩, ⟨4790, target121⟩, ⟨4791, target122⟩, ⟨4805, target123⟩, ⟨4806, target124⟩, ⟨4807, target125⟩, ⟨4817, target126⟩, ⟨4818, target127⟩]
  indexMask := 34582604845238053405448510598726801087323484977166684136885024405294981663025030697771588907166021487691413635953195438583632465316106212727709373853205675742713363320750656524442593162761245707524716565193222962009970910930612547313566818954511293407288316788702284972616560915919629926498928136528599232842753269819388747715544504165676132234175406861779637832569748409674724777573945716299400609449697437811245429393987635451702189628259961460465574957391232742707298155844362517472948847297548340047971158610905906099633205599868090447077523342673925558562118748722882015593308944024337319502345695613747042005648251167844483011050424551981142614278117546692810074896012785064744497257792994817431284368204125238721793515776586025880060661328973725446858301735961283604447442595428005554774381053152355481286314798799815217549394839827605447059031883250465550159138013983690145435516966355504229211201558776074602333525402509941077409703131523966802170643179135466601043441819944841455125031082697382931730067723246723869132860422229594117983407509492051214512562452722138872969603855009560489539288935249553971402715511719347139746029880121029875649182005620195487386520130468743231039005662305346033980123300244647918039749452298412097439127366449665125484518471058914562197448589762688021007323688204069926955044456936789238304397574722328684262490751905202376007647379924582647689954370125910986733595507820775698439645197740411170666064117760
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

end FranklSmallCyclic.TransportBatches.G059.B000.Data
