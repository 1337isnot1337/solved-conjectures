module

public import Conjectures.FranklSmallCyclicRowCoverage
public import Conjectures.FranklSmallCyclicCanonicalWords
public import Conjectures.FranklSmallCyclicOrbit9Block006Data

/-! 128 literal targets sharing one source proof block.
Original words and row indices are retained; weights may be transported.
-/
@[expose] public section

namespace FranklSmallCyclic.TransportBatches.G059.B001.Data

-- Period 9, original row 4819, representative 7541.
def source0 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B006.Data.entryAt ⟨23, by decide +kernel⟩

def target0 : Weights.Entry :=
  { word := [8, 2, 2, 10, 8, 0, 12], weights := [1, 1, 0, 0] }

-- Period 9, original row 4834, representative 7574.
def source1 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B006.Data.entryAt ⟨56, by decide +kernel⟩

def target1 : Weights.Entry :=
  { word := [8, 2, 2, 10, 8, 8, 9], weights := [1, 0, 0, 1] }

-- Period 9, original row 4835, representative 7523.
def source2 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B006.Data.entryAt ⟨5, by decide +kernel⟩

def target2 : Weights.Entry :=
  { word := [8, 2, 2, 10, 8, 8, 10], weights := [1, 0, 0, 1] }

-- Period 9, original row 4836, representative 7527.
def source3 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B006.Data.entryAt ⟨9, by decide +kernel⟩

def target3 : Weights.Entry :=
  { word := [8, 2, 2, 10, 8, 8, 12], weights := [1, 0, 0, 1] }

-- Period 9, original row 4856, representative 7579.
def source4 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B006.Data.entryAt ⟨61, by decide +kernel⟩

def target4 : Weights.Entry :=
  { word := [8, 2, 8, 2, 0, 8, 9], weights := [1, 0, 0, 1] }

-- Period 9, original row 4857, representative 7535.
def source5 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B006.Data.entryAt ⟨17, by decide +kernel⟩

def target5 : Weights.Entry :=
  { word := [8, 2, 8, 2, 0, 8, 10], weights := [1, 0, 0, 1] }

-- Period 9, original row 4858, representative 7535.
def source6 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B006.Data.entryAt ⟨17, by decide +kernel⟩

def target6 : Weights.Entry :=
  { word := [8, 2, 8, 2, 0, 8, 12], weights := [1, 0, 0, 1] }

def points6 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 8), (8, 7)]

-- Period 9, original row 4868, representative 7528.
def source7 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B006.Data.entryAt ⟨10, by decide +kernel⟩

def target7 : Weights.Entry :=
  { word := [8, 2, 8, 2, 8, 8, 12], weights := [1, 0, 0, 1] }

-- Period 9, original row 4897, representative 7580.
def source8 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B006.Data.entryAt ⟨62, by decide +kernel⟩

def target8 : Weights.Entry :=
  { word := [8, 2, 8, 10, 0, 8, 9], weights := [1, 0, 0, 1] }

-- Period 9, original row 4898, representative 7536.
def source9 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B006.Data.entryAt ⟨18, by decide +kernel⟩

def target9 : Weights.Entry :=
  { word := [8, 2, 8, 10, 0, 8, 10], weights := [1, 0, 0, 1] }

-- Period 9, original row 4899, representative 7536.
def source10 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B006.Data.entryAt ⟨18, by decide +kernel⟩

def target10 : Weights.Entry :=
  { word := [8, 2, 8, 10, 0, 8, 12], weights := [1, 0, 0, 1] }

def points10 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 8), (8, 7)]

-- Period 9, original row 4912, representative 7529.
def source11 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B006.Data.entryAt ⟨11, by decide +kernel⟩

def target11 : Weights.Entry :=
  { word := [8, 2, 8, 10, 8, 8, 12], weights := [0, 1, 0, 0] }

-- Period 9, original row 4934, representative 7576.
def source12 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B006.Data.entryAt ⟨58, by decide +kernel⟩

def target12 : Weights.Entry :=
  { word := [8, 2, 10, 2, 0, 8, 9], weights := [1, 0, 0, 1] }

-- Period 9, original row 4935, representative 7532.
def source13 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B006.Data.entryAt ⟨14, by decide +kernel⟩

def target13 : Weights.Entry :=
  { word := [8, 2, 10, 2, 0, 8, 10], weights := [1, 0, 0, 1] }

-- Period 9, original row 4936, representative 7532.
def source14 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B006.Data.entryAt ⟨14, by decide +kernel⟩

def target14 : Weights.Entry :=
  { word := [8, 2, 10, 2, 0, 8, 12], weights := [1, 0, 0, 1] }

def points14 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 8), (8, 7)]

-- Period 9, original row 4950, representative 7572.
def source15 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B006.Data.entryAt ⟨54, by decide +kernel⟩

def target15 : Weights.Entry :=
  { word := [8, 2, 10, 2, 8, 8, 9], weights := [1, 0, 0, 1] }

-- Period 9, original row 4951, representative 7521.
def source16 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B006.Data.entryAt ⟨3, by decide +kernel⟩

def target16 : Weights.Entry :=
  { word := [8, 2, 10, 2, 8, 8, 10], weights := [1, 0, 0, 1] }

-- Period 9, original row 4952, representative 7525.
def source17 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B006.Data.entryAt ⟨7, by decide +kernel⟩

def target17 : Weights.Entry :=
  { word := [8, 2, 10, 2, 8, 8, 12], weights := [1, 0, 0, 1] }

-- Period 9, original row 4967, representative 7577.
def source18 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B006.Data.entryAt ⟨59, by decide +kernel⟩

def target18 : Weights.Entry :=
  { word := [8, 2, 10, 10, 0, 8, 9], weights := [1, 0, 0, 1] }

-- Period 9, original row 4968, representative 7533.
def source19 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B006.Data.entryAt ⟨15, by decide +kernel⟩

def target19 : Weights.Entry :=
  { word := [8, 2, 10, 10, 0, 8, 10], weights := [1, 0, 0, 1] }

-- Period 9, original row 4969, representative 7533.
def source20 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B006.Data.entryAt ⟨15, by decide +kernel⟩

def target20 : Weights.Entry :=
  { word := [8, 2, 10, 10, 0, 8, 12], weights := [1, 0, 0, 1] }

def points20 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 8), (8, 7)]

-- Period 9, original row 4989, representative 7573.
def source21 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B006.Data.entryAt ⟨55, by decide +kernel⟩

def target21 : Weights.Entry :=
  { word := [8, 2, 10, 10, 8, 8, 9], weights := [1, 0, 0, 1] }

-- Period 9, original row 4990, representative 7522.
def source22 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B006.Data.entryAt ⟨4, by decide +kernel⟩

def target22 : Weights.Entry :=
  { word := [8, 2, 10, 10, 8, 8, 10], weights := [1, 0, 0, 1] }

-- Period 9, original row 4991, representative 7526.
def source23 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B006.Data.entryAt ⟨8, by decide +kernel⟩

def target23 : Weights.Entry :=
  { word := [8, 2, 10, 10, 8, 8, 12], weights := [1, 0, 0, 1] }

-- Period 9, original row 5868, representative 7570.
def source24 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B006.Data.entryAt ⟨52, by decide +kernel⟩

def target24 : Weights.Entry :=
  { word := [8, 9, 0, 4, 0, 4, 8], weights := [1, 0, 2, 1] }

def points24 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2)]

-- Period 9, original row 5870, representative 7557.
def source25 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B006.Data.entryAt ⟨39, by decide +kernel⟩

def target25 : Weights.Entry :=
  { word := [8, 9, 0, 4, 0, 12, 8], weights := [1, 0, 3, 0] }

-- Period 9, original row 5872, representative 7597.
def source26 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B006.Data.entryAt ⟨79, by decide +kernel⟩

def target26 : Weights.Entry :=
  { word := [8, 9, 0, 4, 2, 0, 1], weights := [1, 0, 0, 1] }

def points26 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2)]

-- Period 9, original row 5884, representative 7597.
def source27 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B006.Data.entryAt ⟨79, by decide +kernel⟩

def target27 : Weights.Entry :=
  { word := [8, 9, 0, 4, 4, 4, 0], weights := [1, 0, 1, 0] }

def points27 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 5), (4, 6), (5, 4), (6, 3), (7, 1), (8, 2)]

-- Period 9, original row 5885, representative 7575.
def source28 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B006.Data.entryAt ⟨57, by decide +kernel⟩

def target28 : Weights.Entry :=
  { word := [8, 9, 0, 4, 4, 4, 8], weights := [1, 0, 0, 1] }

def points28 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2)]

-- Period 9, original row 5892, representative 7579.
def source29 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B006.Data.entryAt ⟨61, by decide +kernel⟩

def target29 : Weights.Entry :=
  { word := [8, 9, 0, 4, 8, 4, 8], weights := [1, 0, 0, 1] }

def points29 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2)]

-- Period 9, original row 5896, representative 7562.
def source30 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B006.Data.entryAt ⟨44, by decide +kernel⟩

def target30 : Weights.Entry :=
  { word := [8, 9, 0, 4, 8, 12, 8], weights := [1, 0, 1, 0] }

-- Period 9, original row 5898, representative 7598.
def source31 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B006.Data.entryAt ⟨80, by decide +kernel⟩

def target31 : Weights.Entry :=
  { word := [8, 9, 0, 4, 10, 0, 1], weights := [1, 0, 0, 1] }

def points31 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2)]

-- Period 9, original row 5910, representative 7598.
def source32 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B006.Data.entryAt ⟨80, by decide +kernel⟩

def target32 : Weights.Entry :=
  { word := [8, 9, 0, 4, 12, 4, 0], weights := [1, 0, 1, 0] }

def points32 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 5), (4, 6), (5, 4), (6, 3), (7, 1), (8, 2)]

-- Period 9, original row 5911, representative 7576.
def source33 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B006.Data.entryAt ⟨58, by decide +kernel⟩

def target33 : Weights.Entry :=
  { word := [8, 9, 0, 4, 12, 4, 8], weights := [1, 0, 0, 1] }

def points33 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2)]

-- Period 9, original row 5926, representative 7581.
def source34 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B006.Data.entryAt ⟨63, by decide +kernel⟩

def target34 : Weights.Entry :=
  { word := [8, 9, 0, 12, 0, 4, 8], weights := [1, 0, 0, 1] }

def points34 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2)]

-- Period 9, original row 5930, representative 7564.
def source35 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B006.Data.entryAt ⟨46, by decide +kernel⟩

def target35 : Weights.Entry :=
  { word := [8, 9, 0, 12, 0, 12, 8], weights := [1, 0, 1, 0] }

-- Period 9, original row 5932, representative 7600.
def source36 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B006.Data.entryAt ⟨82, by decide +kernel⟩

def target36 : Weights.Entry :=
  { word := [8, 9, 0, 12, 2, 0, 1], weights := [1, 0, 0, 1] }

def points36 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2)]

-- Period 9, original row 5944, representative 7600.
def source37 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B006.Data.entryAt ⟨82, by decide +kernel⟩

def target37 : Weights.Entry :=
  { word := [8, 9, 0, 12, 4, 4, 0], weights := [1, 0, 1, 0] }

def points37 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 5), (4, 6), (5, 4), (6, 3), (7, 1), (8, 2)]

-- Period 9, original row 5945, representative 7578.
def source38 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B006.Data.entryAt ⟨60, by decide +kernel⟩

def target38 : Weights.Entry :=
  { word := [8, 9, 0, 12, 4, 4, 8], weights := [1, 0, 0, 1] }

def points38 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2)]

-- Period 9, original row 5951, representative 7580.
def source39 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B006.Data.entryAt ⟨62, by decide +kernel⟩

def target39 : Weights.Entry :=
  { word := [8, 9, 0, 12, 8, 4, 8], weights := [1, 0, 0, 1] }

def points39 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2)]

-- Period 9, original row 5955, representative 7563.
def source40 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B006.Data.entryAt ⟨45, by decide +kernel⟩

def target40 : Weights.Entry :=
  { word := [8, 9, 0, 12, 8, 12, 8], weights := [1, 0, 1, 0] }

-- Period 9, original row 5957, representative 7599.
def source41 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B006.Data.entryAt ⟨81, by decide +kernel⟩

def target41 : Weights.Entry :=
  { word := [8, 9, 0, 12, 10, 0, 1], weights := [1, 0, 0, 1] }

def points41 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2)]

-- Period 9, original row 5969, representative 7599.
def source42 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B006.Data.entryAt ⟨81, by decide +kernel⟩

def target42 : Weights.Entry :=
  { word := [8, 9, 0, 12, 12, 4, 0], weights := [1, 0, 1, 0] }

def points42 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 5), (4, 6), (5, 4), (6, 3), (7, 1), (8, 2)]

-- Period 9, original row 5970, representative 7577.
def source43 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B006.Data.entryAt ⟨59, by decide +kernel⟩

def target43 : Weights.Entry :=
  { word := [8, 9, 0, 12, 12, 4, 8], weights := [1, 0, 0, 1] }

def points43 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2)]

-- Period 9, original row 6005, representative 7593.
def source44 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B006.Data.entryAt ⟨75, by decide +kernel⟩

def target44 : Weights.Entry :=
  { word := [8, 9, 8, 4, 4, 4, 0], weights := [1, 0, 0, 1] }

def points44 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 6006, representative 7571.
def source45 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B006.Data.entryAt ⟨53, by decide +kernel⟩

def target45 : Weights.Entry :=
  { word := [8, 9, 8, 4, 4, 4, 8], weights := [1, 0, 0, 1] }

def points45 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 6007, representative 7589.
def source46 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B006.Data.entryAt ⟨71, by decide +kernel⟩

def target46 : Weights.Entry :=
  { word := [8, 9, 8, 4, 4, 12, 0], weights := [1, 0, 0, 1] }

def points46 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 6008, representative 7558.
def source47 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B006.Data.entryAt ⟨40, by decide +kernel⟩

def target47 : Weights.Entry :=
  { word := [8, 9, 8, 4, 4, 12, 8], weights := [1, 0, 0, 1] }

-- Period 9, original row 6013, representative 7594.
def source48 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B006.Data.entryAt ⟨76, by decide +kernel⟩

def target48 : Weights.Entry :=
  { word := [8, 9, 8, 4, 12, 4, 0], weights := [1, 0, 0, 1] }

def points48 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 6014, representative 7572.
def source49 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B006.Data.entryAt ⟨54, by decide +kernel⟩

def target49 : Weights.Entry :=
  { word := [8, 9, 8, 4, 12, 4, 8], weights := [1, 0, 0, 1] }

def points49 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 6015, representative 7590.
def source50 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B006.Data.entryAt ⟨72, by decide +kernel⟩

def target50 : Weights.Entry :=
  { word := [8, 9, 8, 4, 12, 12, 0], weights := [1, 0, 0, 1] }

def points50 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 6016, representative 7559.
def source51 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B006.Data.entryAt ⟨41, by decide +kernel⟩

def target51 : Weights.Entry :=
  { word := [8, 9, 8, 4, 12, 12, 8], weights := [1, 0, 0, 1] }

-- Period 9, original row 6017, representative 7588.
def source52 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B006.Data.entryAt ⟨70, by decide +kernel⟩

def target52 : Weights.Entry :=
  { word := [8, 9, 8, 8, 4, 6, 0], weights := [0, 1, 1, 0] }

def points52 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 6022, representative 7587.
def source53 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B006.Data.entryAt ⟨69, by decide +kernel⟩

def target53 : Weights.Entry :=
  { word := [8, 9, 8, 8, 12, 6, 0], weights := [0, 1, 1, 0] }

def points53 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 6035, representative 7596.
def source54 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B006.Data.entryAt ⟨78, by decide +kernel⟩

def target54 : Weights.Entry :=
  { word := [8, 9, 8, 12, 4, 4, 0], weights := [0, 1, 1, 0] }

def points54 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 6036, representative 7574.
def source55 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B006.Data.entryAt ⟨56, by decide +kernel⟩

def target55 : Weights.Entry :=
  { word := [8, 9, 8, 12, 4, 4, 8], weights := [1, 0, 0, 1] }

def points55 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 6037, representative 7592.
def source56 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B006.Data.entryAt ⟨74, by decide +kernel⟩

def target56 : Weights.Entry :=
  { word := [8, 9, 8, 12, 4, 12, 0], weights := [0, 1, 1, 0] }

def points56 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 6038, representative 7561.
def source57 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B006.Data.entryAt ⟨43, by decide +kernel⟩

def target57 : Weights.Entry :=
  { word := [8, 9, 8, 12, 4, 12, 8], weights := [1, 0, 0, 1] }

-- Period 9, original row 6042, representative 7595.
def source58 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B006.Data.entryAt ⟨77, by decide +kernel⟩

def target58 : Weights.Entry :=
  { word := [8, 9, 8, 12, 12, 4, 0], weights := [0, 1, 1, 0] }

def points58 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 6043, representative 7573.
def source59 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B006.Data.entryAt ⟨55, by decide +kernel⟩

def target59 : Weights.Entry :=
  { word := [8, 9, 8, 12, 12, 4, 8], weights := [1, 0, 0, 1] }

def points59 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 6044, representative 7591.
def source60 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B006.Data.entryAt ⟨73, by decide +kernel⟩

def target60 : Weights.Entry :=
  { word := [8, 9, 8, 12, 12, 12, 0], weights := [0, 1, 1, 0] }

def points60 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 6045, representative 7560.
def source61 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B006.Data.entryAt ⟨42, by decide +kernel⟩

def target61 : Weights.Entry :=
  { word := [8, 9, 8, 12, 12, 12, 8], weights := [1, 0, 0, 1] }

-- Period 9, original row 6077, representative 7557.
def source62 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B006.Data.entryAt ⟨39, by decide +kernel⟩

def target62 : Weights.Entry :=
  { word := [8, 10, 0, 2, 0, 8, 9], weights := [0, 3, 0, 1] }

def points62 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2)]

-- Period 9, original row 6120, representative 7567.
def source63 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B006.Data.entryAt ⟨49, by decide +kernel⟩

def target63 : Weights.Entry :=
  { word := [8, 10, 0, 10, 0, 0, 9], weights := [0, 1, 0, 0] }

def points63 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2)]

-- Period 9, original row 6127, representative 7564.
def source64 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B006.Data.entryAt ⟨46, by decide +kernel⟩

def target64 : Weights.Entry :=
  { word := [8, 10, 0, 10, 0, 8, 9], weights := [0, 1, 0, 1] }

def points64 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2)]

-- Period 9, original row 6141, representative 7569.
def source65 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B006.Data.entryAt ⟨51, by decide +kernel⟩

def target65 : Weights.Entry :=
  { word := [8, 10, 0, 12, 2, 0, 9], weights := [1, 1, 0, 1] }

def points65 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2)]

-- Period 9, original row 6143, representative 7519.
def source66 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B006.Data.entryAt ⟨1, by decide +kernel⟩

def target66 : Weights.Entry :=
  { word := [8, 10, 0, 12, 2, 0, 12], weights := [1, 1, 0, 1] }

-- Period 9, original row 6149, representative 7568.
def source67 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B006.Data.entryAt ⟨50, by decide +kernel⟩

def target67 : Weights.Entry :=
  { word := [8, 10, 0, 12, 10, 0, 9], weights := [1, 1, 0, 1] }

def points67 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2)]

-- Period 9, original row 6151, representative 7518.
def source68 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B006.Data.entryAt ⟨0, by decide +kernel⟩

def target68 : Weights.Entry :=
  { word := [8, 10, 0, 12, 10, 0, 12], weights := [1, 1, 0, 1] }

-- Period 9, original row 6157, representative 7565.
def source69 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B006.Data.entryAt ⟨47, by decide +kernel⟩

def target69 : Weights.Entry :=
  { word := [8, 10, 2, 2, 8, 0, 9], weights := [1, 0, 0, 1] }

def points69 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 6169, representative 7558.
def source70 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B006.Data.entryAt ⟨40, by decide +kernel⟩

def target70 : Weights.Entry :=
  { word := [8, 10, 2, 2, 8, 8, 9], weights := [1, 0, 0, 1] }

def points70 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 6180, representative 7566.
def source71 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B006.Data.entryAt ⟨48, by decide +kernel⟩

def target71 : Weights.Entry :=
  { word := [8, 10, 2, 10, 8, 0, 9], weights := [1, 0, 0, 1] }

def points71 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 6197, representative 7561.
def source72 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B006.Data.entryAt ⟨43, by decide +kernel⟩

def target72 : Weights.Entry :=
  { word := [8, 10, 2, 10, 8, 8, 9], weights := [1, 0, 0, 1] }

def points72 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 6219, representative 7562.
def source73 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B006.Data.entryAt ⟨44, by decide +kernel⟩

def target73 : Weights.Entry :=
  { word := [8, 10, 8, 2, 0, 8, 9], weights := [0, 1, 0, 1] }

def points73 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 6260, representative 7563.
def source74 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B006.Data.entryAt ⟨45, by decide +kernel⟩

def target74 : Weights.Entry :=
  { word := [8, 10, 8, 10, 0, 8, 9], weights := [0, 1, 0, 1] }

def points74 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 6297, representative 7559.
def source75 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B006.Data.entryAt ⟨41, by decide +kernel⟩

def target75 : Weights.Entry :=
  { word := [8, 10, 10, 2, 8, 8, 9], weights := [1, 0, 0, 1] }

def points75 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 6319, representative 7560.
def source76 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B006.Data.entryAt ⟨42, by decide +kernel⟩

def target76 : Weights.Entry :=
  { word := [8, 10, 10, 10, 8, 8, 9], weights := [1, 0, 0, 1] }

def points76 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 7415, representative 7543.
def source77 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B006.Data.entryAt ⟨25, by decide +kernel⟩

def target77 : Weights.Entry :=
  { word := [10, 0, 0, 12, 0, 4, 8], weights := [0, 0, 1, 0] }

def points77 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2)]

-- Period 9, original row 7460, representative 7519.
def source78 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B006.Data.entryAt ⟨1, by decide +kernel⟩

def target78 : Weights.Entry :=
  { word := [10, 0, 4, 10, 0, 12, 8], weights := [1, 0, 1, 1] }

def points78 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 7485, representative 7540.
def source79 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B006.Data.entryAt ⟨22, by decide +kernel⟩

def target79 : Weights.Entry :=
  { word := [10, 0, 8, 4, 4, 4, 8], weights := [1, 0, 0, 1] }

def points79 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 7486, representative 7646.
def source80 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B006.Data.entryAt ⟨127, by decide +kernel⟩

def target80 : Weights.Entry :=
  { word := [10, 0, 8, 4, 4, 12, 0], weights := [1, 0, 0, 1] }

def points80 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 7506, representative 7542.
def source81 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B006.Data.entryAt ⟨24, by decide +kernel⟩

def target81 : Weights.Entry :=
  { word := [10, 0, 8, 12, 0, 4, 8], weights := [0, 0, 1, 0] }

def points81 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 7515, representative 7541.
def source82 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B006.Data.entryAt ⟨23, by decide +kernel⟩

def target82 : Weights.Entry :=
  { word := [10, 0, 8, 12, 4, 4, 8], weights := [0, 0, 1, 1] }

def points82 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 7522, representative 7550.
def source83 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B006.Data.entryAt ⟨32, by decide +kernel⟩

def target83 : Weights.Entry :=
  { word := [10, 0, 9, 0, 1, 4, 8], weights := [0, 0, 1, 0] }

def points83 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 7526, representative 7551.
def source84 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B006.Data.entryAt ⟨33, by decide +kernel⟩

def target84 : Weights.Entry :=
  { word := [10, 0, 9, 8, 1, 4, 8], weights := [0, 0, 1, 0] }

def points84 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 7568, representative 7556.
def source85 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B006.Data.entryAt ⟨38, by decide +kernel⟩

def target85 : Weights.Entry :=
  { word := [10, 0, 12, 10, 0, 4, 8], weights := [1, 0, 1, 1] }

def points85 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 7582, representative 7518.
def source86 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B006.Data.entryAt ⟨0, by decide +kernel⟩

def target86 : Weights.Entry :=
  { word := [10, 0, 12, 10, 0, 12, 8], weights := [1, 0, 1, 1] }

def points86 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 7819, representative 7635.
def source87 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B006.Data.entryAt ⟨117, by decide +kernel⟩

def target87 : Weights.Entry :=
  { word := [10, 8, 0, 4, 2, 0, 1], weights := [1, 0, 0, 1] }

def points87 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2)]

-- Period 9, original row 7831, representative 7635.
def source88 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B006.Data.entryAt ⟨117, by decide +kernel⟩

def target88 : Weights.Entry :=
  { word := [10, 8, 0, 4, 4, 4, 0], weights := [1, 0, 1, 0] }

def points88 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 5), (4, 6), (5, 4), (6, 3), (7, 1), (8, 2)]

-- Period 9, original row 7832, representative 7531.
def source89 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B006.Data.entryAt ⟨13, by decide +kernel⟩

def target89 : Weights.Entry :=
  { word := [10, 8, 0, 4, 4, 4, 8], weights := [1, 0, 0, 1] }

def points89 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2)]

-- Period 9, original row 7839, representative 7535.
def source90 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B006.Data.entryAt ⟨17, by decide +kernel⟩

def target90 : Weights.Entry :=
  { word := [10, 8, 0, 4, 8, 4, 8], weights := [1, 0, 0, 1] }

def points90 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2)]

-- Period 9, original row 7845, representative 7640.
def source91 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B006.Data.entryAt ⟨121, by decide +kernel⟩

def target91 : Weights.Entry :=
  { word := [10, 8, 0, 4, 10, 0, 1], weights := [1, 0, 0, 1] }

def points91 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2)]

-- Period 9, original row 7857, representative 7640.
def source92 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B006.Data.entryAt ⟨121, by decide +kernel⟩

def target92 : Weights.Entry :=
  { word := [10, 8, 0, 4, 12, 4, 0], weights := [1, 0, 1, 0] }

def points92 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 5), (4, 6), (5, 4), (6, 3), (7, 1), (8, 2)]

-- Period 9, original row 7858, representative 7532.
def source93 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B006.Data.entryAt ⟨14, by decide +kernel⟩

def target93 : Weights.Entry :=
  { word := [10, 8, 0, 4, 12, 4, 8], weights := [1, 0, 0, 1] }

def points93 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2)]

-- Period 9, original row 7865, representative 7537.
def source94 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B006.Data.entryAt ⟨19, by decide +kernel⟩

def target94 : Weights.Entry :=
  { word := [10, 8, 0, 12, 0, 4, 8], weights := [1, 0, 0, 1] }

def points94 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 7871, representative 7642.
def source95 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B006.Data.entryAt ⟨123, by decide +kernel⟩

def target95 : Weights.Entry :=
  { word := [10, 8, 0, 12, 2, 0, 1], weights := [1, 0, 0, 1] }

def points95 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2)]

-- Period 9, original row 7883, representative 7642.
def source96 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B006.Data.entryAt ⟨123, by decide +kernel⟩

def target96 : Weights.Entry :=
  { word := [10, 8, 0, 12, 4, 4, 0], weights := [1, 0, 1, 0] }

def points96 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 5), (4, 6), (5, 4), (6, 3), (7, 1), (8, 2)]

-- Period 9, original row 7884, representative 7534.
def source97 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B006.Data.entryAt ⟨16, by decide +kernel⟩

def target97 : Weights.Entry :=
  { word := [10, 8, 0, 12, 4, 4, 8], weights := [1, 0, 0, 1] }

def points97 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2)]

-- Period 9, original row 7890, representative 7536.
def source98 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B006.Data.entryAt ⟨18, by decide +kernel⟩

def target98 : Weights.Entry :=
  { word := [10, 8, 0, 12, 8, 4, 8], weights := [1, 0, 0, 1] }

def points98 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2)]

-- Period 9, original row 7896, representative 7641.
def source99 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B006.Data.entryAt ⟨122, by decide +kernel⟩

def target99 : Weights.Entry :=
  { word := [10, 8, 0, 12, 10, 0, 1], weights := [1, 0, 0, 1] }

def points99 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2)]

-- Period 9, original row 7908, representative 7641.
def source100 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B006.Data.entryAt ⟨122, by decide +kernel⟩

def target100 : Weights.Entry :=
  { word := [10, 8, 0, 12, 12, 4, 0], weights := [1, 0, 1, 0] }

def points100 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 5), (4, 6), (5, 4), (6, 3), (7, 1), (8, 2)]

-- Period 9, original row 7909, representative 7533.
def source101 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B006.Data.entryAt ⟨15, by decide +kernel⟩

def target101 : Weights.Entry :=
  { word := [10, 8, 0, 12, 12, 4, 8], weights := [1, 0, 0, 1] }

def points101 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2)]

-- Period 9, original row 7910, representative 7605.
def source102 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B006.Data.entryAt ⟨87, by decide +kernel⟩

def target102 : Weights.Entry :=
  { word := [10, 8, 2, 0, 1, 8, 1], weights := [0, 0, 1, 0] }

def points102 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 7913, representative 7606.
def source103 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B006.Data.entryAt ⟨88, by decide +kernel⟩

def target103 : Weights.Entry :=
  { word := [10, 8, 2, 0, 9, 8, 1], weights := [0, 0, 1, 0] }

def points103 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 7921, representative 7613.
def source104 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B006.Data.entryAt ⟨95, by decide +kernel⟩

def target104 : Weights.Entry :=
  { word := [10, 8, 4, 2, 0, 8, 1], weights := [1, 0, 0, 1] }

def points104 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 7948, representative 7616.
def source105 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B006.Data.entryAt ⟨98, by decide +kernel⟩

def target105 : Weights.Entry :=
  { word := [10, 8, 4, 10, 0, 8, 1], weights := [0, 1, 0, 1] }

def points105 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 7969, representative 7552.
def source106 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B006.Data.entryAt ⟨34, by decide +kernel⟩

def target106 : Weights.Entry :=
  { word := [10, 8, 8, 0, 1, 4, 8], weights := [0, 0, 1, 0] }

def points106 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 7983, representative 7636.
def source107 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B006.Data.entryAt ⟨118, by decide +kernel⟩

def target107 : Weights.Entry :=
  { word := [10, 8, 8, 4, 2, 0, 1], weights := [1, 0, 0, 1] }

def points107 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 7995, representative 7631.
def source108 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B006.Data.entryAt ⟨113, by decide +kernel⟩

def target108 : Weights.Entry :=
  { word := [10, 8, 8, 4, 4, 4, 0], weights := [1, 0, 0, 1] }

def points108 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 7996, representative 7524.
def source109 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B006.Data.entryAt ⟨6, by decide +kernel⟩

def target109 : Weights.Entry :=
  { word := [10, 8, 8, 4, 4, 4, 8], weights := [1, 0, 0, 1] }

def points109 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 7997, representative 7627.
def source110 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B006.Data.entryAt ⟨109, by decide +kernel⟩

def target110 : Weights.Entry :=
  { word := [10, 8, 8, 4, 4, 12, 0], weights := [1, 0, 0, 1] }

def points110 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 8005, representative 7528.
def source111 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B006.Data.entryAt ⟨10, by decide +kernel⟩

def target111 : Weights.Entry :=
  { word := [10, 8, 8, 4, 8, 4, 8], weights := [1, 0, 0, 1] }

def points111 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 8013, representative 7637.
def source112 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B006.Data.entryAt ⟨119, by decide +kernel⟩

def target112 : Weights.Entry :=
  { word := [10, 8, 8, 4, 10, 0, 1], weights := [1, 0, 0, 1] }

def points112 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 8025, representative 7632.
def source113 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B006.Data.entryAt ⟨114, by decide +kernel⟩

def target113 : Weights.Entry :=
  { word := [10, 8, 8, 4, 12, 4, 0], weights := [1, 0, 0, 1] }

def points113 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 8026, representative 7525.
def source114 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B006.Data.entryAt ⟨7, by decide +kernel⟩

def target114 : Weights.Entry :=
  { word := [10, 8, 8, 4, 12, 4, 8], weights := [1, 0, 0, 1] }

def points114 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 8027, representative 7628.
def source115 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B006.Data.entryAt ⟨110, by decide +kernel⟩

def target115 : Weights.Entry :=
  { word := [10, 8, 8, 4, 12, 12, 0], weights := [1, 0, 0, 1] }

def points115 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 8031, representative 7553.
def source116 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B006.Data.entryAt ⟨35, by decide +kernel⟩

def target116 : Weights.Entry :=
  { word := [10, 8, 8, 8, 1, 4, 8], weights := [0, 0, 1, 0] }

def points116 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 8049, representative 7530.
def source117 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B006.Data.entryAt ⟨12, by decide +kernel⟩

def target117 : Weights.Entry :=
  { word := [10, 8, 8, 12, 0, 4, 8], weights := [0, 0, 1, 0] }

def points117 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 8057, representative 7639.
def source118 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B006.Data.entryAt ⟨120, by decide +kernel⟩

def target118 : Weights.Entry :=
  { word := [10, 8, 8, 12, 2, 0, 1], weights := [1, 0, 0, 1] }

def points118 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 8069, representative 7634.
def source119 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B006.Data.entryAt ⟨116, by decide +kernel⟩

def target119 : Weights.Entry :=
  { word := [10, 8, 8, 12, 4, 4, 0], weights := [1, 0, 0, 1] }

def points119 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 8070, representative 7527.
def source120 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B006.Data.entryAt ⟨9, by decide +kernel⟩

def target120 : Weights.Entry :=
  { word := [10, 8, 8, 12, 4, 4, 8], weights := [1, 0, 0, 1] }

def points120 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 8071, representative 7630.
def source121 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B006.Data.entryAt ⟨112, by decide +kernel⟩

def target121 : Weights.Entry :=
  { word := [10, 8, 8, 12, 4, 12, 0], weights := [1, 0, 0, 1] }

def points121 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 8078, representative 7529.
def source122 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B006.Data.entryAt ⟨11, by decide +kernel⟩

def target122 : Weights.Entry :=
  { word := [10, 8, 8, 12, 8, 4, 8], weights := [0, 0, 1, 0] }

def points122 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 8098, representative 7633.
def source123 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B006.Data.entryAt ⟨115, by decide +kernel⟩

def target123 : Weights.Entry :=
  { word := [10, 8, 8, 12, 12, 4, 0], weights := [1, 0, 0, 1] }

def points123 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 8099, representative 7526.
def source124 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B006.Data.entryAt ⟨8, by decide +kernel⟩

def target124 : Weights.Entry :=
  { word := [10, 8, 8, 12, 12, 4, 8], weights := [1, 0, 0, 1] }

def points124 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 8100, representative 7629.
def source125 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B006.Data.entryAt ⟨111, by decide +kernel⟩

def target125 : Weights.Entry :=
  { word := [10, 8, 8, 12, 12, 12, 0], weights := [1, 0, 0, 1] }

def points125 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 8102, representative 7546.
def source126 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B006.Data.entryAt ⟨28, by decide +kernel⟩

def target126 : Weights.Entry :=
  { word := [10, 8, 9, 0, 1, 4, 8], weights := [0, 0, 1, 0] }

def points126 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 8106, representative 7547.
def source127 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B006.Data.entryAt ⟨29, by decide +kernel⟩

def target127 : Weights.Entry :=
  { word := [10, 8, 9, 8, 1, 4, 8], weights := [0, 0, 1, 0] }

def points127 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

def period9Entries : List Weights.Entry := [target0, target1, target2, target3, target4, target5, target6, target7, target8, target9, target10, target11, target12, target13, target14, target15, target16, target17, target18, target19, target20, target21, target22, target23, target24, target25, target26, target27, target28, target29, target30, target31, target32, target33, target34, target35, target36, target37, target38, target39, target40, target41, target42, target43, target44, target45, target46, target47, target48, target49, target50, target51, target52, target53, target54, target55, target56, target57, target58, target59, target60, target61, target62, target63, target64, target65, target66, target67, target68, target69, target70, target71, target72, target73, target74, target75, target76, target77, target78, target79, target80, target81, target82, target83, target84, target85, target86, target87, target88, target89, target90, target91, target92, target93, target94, target95, target96, target97, target98, target99, target100, target101, target102, target103, target104, target105, target106, target107, target108, target109, target110, target111, target112, target113, target114, target115, target116, target117, target118, target119, target120, target121, target122, target123, target124, target125, target126, target127]

def period9Chunk : RowCoverage.Chunk where
  rows := [⟨4819, target0⟩, ⟨4834, target1⟩, ⟨4835, target2⟩, ⟨4836, target3⟩, ⟨4856, target4⟩, ⟨4857, target5⟩, ⟨4858, target6⟩, ⟨4868, target7⟩, ⟨4897, target8⟩, ⟨4898, target9⟩, ⟨4899, target10⟩, ⟨4912, target11⟩, ⟨4934, target12⟩, ⟨4935, target13⟩, ⟨4936, target14⟩, ⟨4950, target15⟩, ⟨4951, target16⟩, ⟨4952, target17⟩, ⟨4967, target18⟩, ⟨4968, target19⟩, ⟨4969, target20⟩, ⟨4989, target21⟩, ⟨4990, target22⟩, ⟨4991, target23⟩, ⟨5868, target24⟩, ⟨5870, target25⟩, ⟨5872, target26⟩, ⟨5884, target27⟩, ⟨5885, target28⟩, ⟨5892, target29⟩, ⟨5896, target30⟩, ⟨5898, target31⟩, ⟨5910, target32⟩, ⟨5911, target33⟩, ⟨5926, target34⟩, ⟨5930, target35⟩, ⟨5932, target36⟩, ⟨5944, target37⟩, ⟨5945, target38⟩, ⟨5951, target39⟩, ⟨5955, target40⟩, ⟨5957, target41⟩, ⟨5969, target42⟩, ⟨5970, target43⟩, ⟨6005, target44⟩, ⟨6006, target45⟩, ⟨6007, target46⟩, ⟨6008, target47⟩, ⟨6013, target48⟩, ⟨6014, target49⟩, ⟨6015, target50⟩, ⟨6016, target51⟩, ⟨6017, target52⟩, ⟨6022, target53⟩, ⟨6035, target54⟩, ⟨6036, target55⟩, ⟨6037, target56⟩, ⟨6038, target57⟩, ⟨6042, target58⟩, ⟨6043, target59⟩, ⟨6044, target60⟩, ⟨6045, target61⟩, ⟨6077, target62⟩, ⟨6120, target63⟩, ⟨6127, target64⟩, ⟨6141, target65⟩, ⟨6143, target66⟩, ⟨6149, target67⟩, ⟨6151, target68⟩, ⟨6157, target69⟩, ⟨6169, target70⟩, ⟨6180, target71⟩, ⟨6197, target72⟩, ⟨6219, target73⟩, ⟨6260, target74⟩, ⟨6297, target75⟩, ⟨6319, target76⟩, ⟨7415, target77⟩, ⟨7460, target78⟩, ⟨7485, target79⟩, ⟨7486, target80⟩, ⟨7506, target81⟩, ⟨7515, target82⟩, ⟨7522, target83⟩, ⟨7526, target84⟩, ⟨7568, target85⟩, ⟨7582, target86⟩, ⟨7819, target87⟩, ⟨7831, target88⟩, ⟨7832, target89⟩, ⟨7839, target90⟩, ⟨7845, target91⟩, ⟨7857, target92⟩, ⟨7858, target93⟩, ⟨7865, target94⟩, ⟨7871, target95⟩, ⟨7883, target96⟩, ⟨7884, target97⟩, ⟨7890, target98⟩, ⟨7896, target99⟩, ⟨7908, target100⟩, ⟨7909, target101⟩, ⟨7910, target102⟩, ⟨7913, target103⟩, ⟨7921, target104⟩, ⟨7948, target105⟩, ⟨7969, target106⟩, ⟨7983, target107⟩, ⟨7995, target108⟩, ⟨7996, target109⟩, ⟨7997, target110⟩, ⟨8005, target111⟩, ⟨8013, target112⟩, ⟨8025, target113⟩, ⟨8026, target114⟩, ⟨8027, target115⟩, ⟨8031, target116⟩, ⟨8049, target117⟩, ⟨8057, target118⟩, ⟨8069, target119⟩, ⟨8070, target120⟩, ⟨8071, target121⟩, ⟨8078, target122⟩, ⟨8098, target123⟩, ⟨8099, target124⟩, ⟨8100, target125⟩, ⟨8102, target126⟩, ⟨8106, target127⟩]
  indexMask := 15364169569752060653980809209940285349396522897079640371348063448322396462374531405496869077786272269066183909067057287869145173460315377481006629221799295494307622879524405223283954089870794182794415614282036420553972296917565548854602327609043709758408371844771390362550533371924548994828101336040311599154132531393529019018416615058385043268581762286273308115868947827246904490360340151778184936003505034833532237645077480322556408338957563798120329588109415869626737588495056416032693317197660307681323722257456326228592570375145582261239968524935925250706294998261607634997627853693352409765412352016297871110146635912024084467541445672437152283400540119907164722688787509592874839582834945941827737342454993470020689133425551725607759668091715030411023175454380560429499225775641414760748580198439282956105722866976435487805906446623802382339434969175631568586117709782371902031167590859368281653192839567208063721061351746511201242229769195184292433787791695941974492347240452529823701928666754435444105232939996027494814325948188484338019522193451440714056252672271092536245045218031450595896042022749377540858572262215229054396833268502918658078476380895896076029177365539262099840148371882945131823290422142522056630670418441049342783625386013388921659896710713066100399170926414384997060644744779008756281576353624511775056906185739938388174614797656686790047811675029541669096928991117741680922928932201904329660838576704304422011834917395168632247466102645863587620636524255126185168936359181429953210786969618762152195541055484250716423893544468652066366038429448292480784251515694536342343659790586030603202444464211346979381264010397728538225695237645520604556235170863593784374797189476182201722772391234688724083529663296591712317756503980600634630018991675992428849737920341861705176960625942733658465303571066293969985844453756982854272305506008093857863775829732363629368307089395075942313425811508839941572924271160345949295074282949523046963811187256524949965683551339287070512759837470974610642009788427546346172939057199806480830146771830373561028782645444934984809205620701413126075862229359007910997343434882926303362225766390273304007772918540111671102138655911251358522716802960716603901714869967332163969117713269626441776906014594624409060665137028025133171032530717665567260821793679124290682518466326116485127623610757758112276559268968398520135943727608110058583035948903652214904668435620138481086281809920
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

end FranklSmallCyclic.TransportBatches.G059.B001.Data
