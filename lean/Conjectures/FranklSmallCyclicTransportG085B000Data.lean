module

public import Conjectures.FranklSmallCyclicRowCoverage
public import Conjectures.FranklSmallCyclicCanonicalWords
public import Conjectures.FranklSmallCyclicOrbit10Block007Data

/-! 128 literal targets sharing one source proof block.
Original words and row indices are retained; weights may be transported.
-/
@[expose] public section

namespace FranklSmallCyclic.TransportBatches.G085.B000.Data

-- Period 10, original row 4513, representative 9915.
def source0 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B007.Data.entryAt ⟨19, by decide +kernel⟩

def target0 : Weights.Entry :=
  { word := [8, 1, 0, 12, 0, 12, 8], weights := [0, 0, 1, 0] }

-- Period 10, original row 4559, representative 9927.
def source1 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B007.Data.entryAt ⟨31, by decide +kernel⟩

def target1 : Weights.Entry :=
  { word := [8, 1, 4, 10, 0, 12, 8], weights := [1, 0, 1, 1] }

-- Period 10, original row 4586, representative 9910.
def source2 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B007.Data.entryAt ⟨14, by decide +kernel⟩

def target2 : Weights.Entry :=
  { word := [8, 1, 8, 4, 4, 12, 8], weights := [1, 0, 0, 1] }

-- Period 10, original row 4603, representative 9911.
def source3 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B007.Data.entryAt ⟨15, by decide +kernel⟩

def target3 : Weights.Entry :=
  { word := [8, 1, 8, 12, 4, 12, 8], weights := [1, 0, 0, 1] }

-- Period 10, original row 4652, representative 9926.
def source4 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B007.Data.entryAt ⟨30, by decide +kernel⟩

def target4 : Weights.Entry :=
  { word := [8, 1, 12, 10, 0, 12, 8], weights := [1, 0, 1, 1] }

-- Period 10, original row 4683, representative 9930.
def source5 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B007.Data.entryAt ⟨34, by decide +kernel⟩

def target5 : Weights.Entry :=
  { word := [8, 2, 0, 2, 0, 8, 9], weights := [1, 2, 0, 1] }

-- Period 10, original row 4733, representative 9941.
def source6 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B007.Data.entryAt ⟨45, by decide +kernel⟩

def target6 : Weights.Entry :=
  { word := [8, 2, 0, 10, 0, 8, 9], weights := [1, 0, 0, 1] }

-- Period 10, original row 4734, representative 9959.
def source7 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B007.Data.entryAt ⟨63, by decide +kernel⟩

def target7 : Weights.Entry :=
  { word := [8, 2, 0, 10, 0, 8, 12], weights := [1, 0, 0, 1] }

-- Period 10, original row 4740, representative 9952.
def source8 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B007.Data.entryAt ⟨56, by decide +kernel⟩

def target8 : Weights.Entry :=
  { word := [8, 2, 0, 10, 8, 8, 12], weights := [0, 1, 0, 0] }

-- Period 10, original row 4766, representative 9935.
def source9 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B007.Data.entryAt ⟨39, by decide +kernel⟩

def target9 : Weights.Entry :=
  { word := [8, 2, 2, 2, 0, 8, 9], weights := [1, 0, 0, 1] }

-- Period 10, original row 4767, representative 9953.
def source10 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B007.Data.entryAt ⟨57, by decide +kernel⟩

def target10 : Weights.Entry :=
  { word := [8, 2, 2, 2, 0, 8, 10], weights := [1, 0, 0, 1] }

-- Period 10, original row 4768, representative 9953.
def source11 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B007.Data.entryAt ⟨57, by decide +kernel⟩

def target11 : Weights.Entry :=
  { word := [8, 2, 2, 2, 0, 8, 12], weights := [1, 0, 0, 1] }

def points11 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 8), (8, 7), (9, 9)]

-- Period 10, original row 4789, representative 9931.
def source12 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B007.Data.entryAt ⟨35, by decide +kernel⟩

def target12 : Weights.Entry :=
  { word := [8, 2, 2, 2, 8, 8, 9], weights := [1, 0, 0, 1] }

-- Period 10, original row 4790, representative 9942.
def source13 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B007.Data.entryAt ⟨46, by decide +kernel⟩

def target13 : Weights.Entry :=
  { word := [8, 2, 2, 2, 8, 8, 10], weights := [1, 0, 0, 1] }

-- Period 10, original row 4791, representative 9946.
def source14 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B007.Data.entryAt ⟨50, by decide +kernel⟩

def target14 : Weights.Entry :=
  { word := [8, 2, 2, 2, 8, 8, 12], weights := [1, 0, 0, 1] }

-- Period 10, original row 4805, representative 9938.
def source15 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B007.Data.entryAt ⟨42, by decide +kernel⟩

def target15 : Weights.Entry :=
  { word := [8, 2, 2, 10, 0, 8, 9], weights := [1, 0, 0, 1] }

-- Period 10, original row 4806, representative 9956.
def source16 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B007.Data.entryAt ⟨60, by decide +kernel⟩

def target16 : Weights.Entry :=
  { word := [8, 2, 2, 10, 0, 8, 10], weights := [1, 0, 0, 1] }

-- Period 10, original row 4807, representative 9956.
def source17 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B007.Data.entryAt ⟨60, by decide +kernel⟩

def target17 : Weights.Entry :=
  { word := [8, 2, 2, 10, 0, 8, 12], weights := [1, 0, 0, 1] }

def points17 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 8), (8, 7), (9, 9)]

-- Period 10, original row 4834, representative 9934.
def source18 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B007.Data.entryAt ⟨38, by decide +kernel⟩

def target18 : Weights.Entry :=
  { word := [8, 2, 2, 10, 8, 8, 9], weights := [1, 0, 0, 1] }

-- Period 10, original row 4835, representative 9945.
def source19 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B007.Data.entryAt ⟨49, by decide +kernel⟩

def target19 : Weights.Entry :=
  { word := [8, 2, 2, 10, 8, 8, 10], weights := [1, 0, 0, 1] }

-- Period 10, original row 4836, representative 9949.
def source20 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B007.Data.entryAt ⟨53, by decide +kernel⟩

def target20 : Weights.Entry :=
  { word := [8, 2, 2, 10, 8, 8, 12], weights := [1, 0, 0, 1] }

-- Period 10, original row 4856, representative 9939.
def source21 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B007.Data.entryAt ⟨43, by decide +kernel⟩

def target21 : Weights.Entry :=
  { word := [8, 2, 8, 2, 0, 8, 9], weights := [1, 0, 0, 1] }

-- Period 10, original row 4857, representative 9957.
def source22 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B007.Data.entryAt ⟨61, by decide +kernel⟩

def target22 : Weights.Entry :=
  { word := [8, 2, 8, 2, 0, 8, 10], weights := [1, 0, 0, 1] }

-- Period 10, original row 4858, representative 9957.
def source23 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B007.Data.entryAt ⟨61, by decide +kernel⟩

def target23 : Weights.Entry :=
  { word := [8, 2, 8, 2, 0, 8, 12], weights := [1, 0, 0, 1] }

def points23 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 8), (8, 7), (9, 9)]

-- Period 10, original row 4868, representative 9950.
def source24 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B007.Data.entryAt ⟨54, by decide +kernel⟩

def target24 : Weights.Entry :=
  { word := [8, 2, 8, 2, 8, 8, 12], weights := [1, 0, 0, 1] }

-- Period 10, original row 4897, representative 9940.
def source25 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B007.Data.entryAt ⟨44, by decide +kernel⟩

def target25 : Weights.Entry :=
  { word := [8, 2, 8, 10, 0, 8, 9], weights := [1, 0, 0, 1] }

-- Period 10, original row 4898, representative 9958.
def source26 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B007.Data.entryAt ⟨62, by decide +kernel⟩

def target26 : Weights.Entry :=
  { word := [8, 2, 8, 10, 0, 8, 10], weights := [1, 0, 0, 1] }

-- Period 10, original row 4899, representative 9958.
def source27 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B007.Data.entryAt ⟨62, by decide +kernel⟩

def target27 : Weights.Entry :=
  { word := [8, 2, 8, 10, 0, 8, 12], weights := [1, 0, 0, 1] }

def points27 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 8), (8, 7), (9, 9)]

-- Period 10, original row 4912, representative 9951.
def source28 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B007.Data.entryAt ⟨55, by decide +kernel⟩

def target28 : Weights.Entry :=
  { word := [8, 2, 8, 10, 8, 8, 12], weights := [0, 1, 0, 0] }

-- Period 10, original row 4934, representative 9936.
def source29 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B007.Data.entryAt ⟨40, by decide +kernel⟩

def target29 : Weights.Entry :=
  { word := [8, 2, 10, 2, 0, 8, 9], weights := [1, 0, 0, 1] }

-- Period 10, original row 4935, representative 9954.
def source30 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B007.Data.entryAt ⟨58, by decide +kernel⟩

def target30 : Weights.Entry :=
  { word := [8, 2, 10, 2, 0, 8, 10], weights := [1, 0, 0, 1] }

-- Period 10, original row 4936, representative 9954.
def source31 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B007.Data.entryAt ⟨58, by decide +kernel⟩

def target31 : Weights.Entry :=
  { word := [8, 2, 10, 2, 0, 8, 12], weights := [1, 0, 0, 1] }

def points31 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 8), (8, 7), (9, 9)]

-- Period 10, original row 4950, representative 9932.
def source32 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B007.Data.entryAt ⟨36, by decide +kernel⟩

def target32 : Weights.Entry :=
  { word := [8, 2, 10, 2, 8, 8, 9], weights := [1, 0, 0, 1] }

-- Period 10, original row 4951, representative 9943.
def source33 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B007.Data.entryAt ⟨47, by decide +kernel⟩

def target33 : Weights.Entry :=
  { word := [8, 2, 10, 2, 8, 8, 10], weights := [1, 0, 0, 1] }

-- Period 10, original row 4952, representative 9947.
def source34 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B007.Data.entryAt ⟨51, by decide +kernel⟩

def target34 : Weights.Entry :=
  { word := [8, 2, 10, 2, 8, 8, 12], weights := [1, 0, 0, 1] }

-- Period 10, original row 4967, representative 9937.
def source35 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B007.Data.entryAt ⟨41, by decide +kernel⟩

def target35 : Weights.Entry :=
  { word := [8, 2, 10, 10, 0, 8, 9], weights := [1, 0, 0, 1] }

-- Period 10, original row 4968, representative 9955.
def source36 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B007.Data.entryAt ⟨59, by decide +kernel⟩

def target36 : Weights.Entry :=
  { word := [8, 2, 10, 10, 0, 8, 10], weights := [1, 0, 0, 1] }

-- Period 10, original row 4969, representative 9955.
def source37 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B007.Data.entryAt ⟨59, by decide +kernel⟩

def target37 : Weights.Entry :=
  { word := [8, 2, 10, 10, 0, 8, 12], weights := [1, 0, 0, 1] }

def points37 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 8), (8, 7), (9, 9)]

-- Period 10, original row 4989, representative 9933.
def source38 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B007.Data.entryAt ⟨37, by decide +kernel⟩

def target38 : Weights.Entry :=
  { word := [8, 2, 10, 10, 8, 8, 9], weights := [1, 0, 0, 1] }

-- Period 10, original row 4990, representative 9944.
def source39 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B007.Data.entryAt ⟨48, by decide +kernel⟩

def target39 : Weights.Entry :=
  { word := [8, 2, 10, 10, 8, 8, 10], weights := [1, 0, 0, 1] }

-- Period 10, original row 4991, representative 9948.
def source40 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B007.Data.entryAt ⟨52, by decide +kernel⟩

def target40 : Weights.Entry :=
  { word := [8, 2, 10, 10, 8, 8, 12], weights := [1, 0, 0, 1] }

-- Period 10, original row 5868, representative 9930.
def source41 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B007.Data.entryAt ⟨34, by decide +kernel⟩

def target41 : Weights.Entry :=
  { word := [8, 9, 0, 4, 0, 4, 8], weights := [1, 0, 2, 1] }

def points41 : List (ℕ × ℕ) := [(0, 9), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2), (9, 0)]

-- Period 10, original row 5885, representative 9935.
def source42 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B007.Data.entryAt ⟨39, by decide +kernel⟩

def target42 : Weights.Entry :=
  { word := [8, 9, 0, 4, 4, 4, 8], weights := [1, 0, 0, 1] }

def points42 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2), (9, 0)]

-- Period 10, original row 5892, representative 9939.
def source43 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B007.Data.entryAt ⟨43, by decide +kernel⟩

def target43 : Weights.Entry :=
  { word := [8, 9, 0, 4, 8, 4, 8], weights := [1, 0, 0, 1] }

def points43 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2), (9, 0)]

-- Period 10, original row 5911, representative 9936.
def source44 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B007.Data.entryAt ⟨40, by decide +kernel⟩

def target44 : Weights.Entry :=
  { word := [8, 9, 0, 4, 12, 4, 8], weights := [1, 0, 0, 1] }

def points44 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2), (9, 0)]

-- Period 10, original row 5926, representative 9941.
def source45 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B007.Data.entryAt ⟨45, by decide +kernel⟩

def target45 : Weights.Entry :=
  { word := [8, 9, 0, 12, 0, 4, 8], weights := [1, 0, 0, 1] }

def points45 : List (ℕ × ℕ) := [(0, 9), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2), (9, 0)]

-- Period 10, original row 5945, representative 9938.
def source46 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B007.Data.entryAt ⟨42, by decide +kernel⟩

def target46 : Weights.Entry :=
  { word := [8, 9, 0, 12, 4, 4, 8], weights := [1, 0, 0, 1] }

def points46 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2), (9, 0)]

-- Period 10, original row 5951, representative 9940.
def source47 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B007.Data.entryAt ⟨44, by decide +kernel⟩

def target47 : Weights.Entry :=
  { word := [8, 9, 0, 12, 8, 4, 8], weights := [1, 0, 0, 1] }

def points47 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2), (9, 0)]

-- Period 10, original row 5970, representative 9937.
def source48 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B007.Data.entryAt ⟨41, by decide +kernel⟩

def target48 : Weights.Entry :=
  { word := [8, 9, 0, 12, 12, 4, 8], weights := [1, 0, 0, 1] }

def points48 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2), (9, 0)]

-- Period 10, original row 6006, representative 9931.
def source49 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B007.Data.entryAt ⟨35, by decide +kernel⟩

def target49 : Weights.Entry :=
  { word := [8, 9, 8, 4, 4, 4, 8], weights := [1, 0, 0, 1] }

def points49 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 6014, representative 9932.
def source50 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B007.Data.entryAt ⟨36, by decide +kernel⟩

def target50 : Weights.Entry :=
  { word := [8, 9, 8, 4, 12, 4, 8], weights := [1, 0, 0, 1] }

def points50 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 6036, representative 9934.
def source51 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B007.Data.entryAt ⟨38, by decide +kernel⟩

def target51 : Weights.Entry :=
  { word := [8, 9, 8, 12, 4, 4, 8], weights := [1, 0, 0, 1] }

def points51 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 6043, representative 9933.
def source52 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B007.Data.entryAt ⟨37, by decide +kernel⟩

def target52 : Weights.Entry :=
  { word := [8, 9, 8, 12, 12, 4, 8], weights := [1, 0, 0, 1] }

def points52 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 6063, representative 9922.
def source53 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B007.Data.entryAt ⟨26, by decide +kernel⟩

def target53 : Weights.Entry :=
  { word := [8, 10, 0, 1, 8, 1, 12], weights := [0, 1, 0, 0] }

-- Period 10, original row 6065, representative 9920.
def source54 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B007.Data.entryAt ⟨24, by decide +kernel⟩

def target54 : Weights.Entry :=
  { word := [8, 10, 0, 1, 8, 2, 10], weights := [0, 1, 0, 0] }

-- Period 10, original row 6068, representative 9924.
def source55 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B007.Data.entryAt ⟨28, by decide +kernel⟩

def target55 : Weights.Entry :=
  { word := [8, 10, 0, 1, 8, 8, 12], weights := [0, 1, 0, 0] }

-- Period 10, original row 6070, representative 9918.
def source56 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B007.Data.entryAt ⟨22, by decide +kernel⟩

def target56 : Weights.Entry :=
  { word := [8, 10, 0, 1, 8, 9, 12], weights := [0, 1, 0, 0] }

-- Period 10, original row 6072, representative 9916.
def source57 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B007.Data.entryAt ⟨20, by decide +kernel⟩

def target57 : Weights.Entry :=
  { word := [8, 10, 0, 1, 8, 10, 10], weights := [0, 1, 0, 0] }

-- Period 10, original row 6100, representative 9923.
def source58 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B007.Data.entryAt ⟨27, by decide +kernel⟩

def target58 : Weights.Entry :=
  { word := [8, 10, 0, 9, 8, 1, 12], weights := [0, 1, 0, 0] }

-- Period 10, original row 6102, representative 9921.
def source59 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B007.Data.entryAt ⟨25, by decide +kernel⟩

def target59 : Weights.Entry :=
  { word := [8, 10, 0, 9, 8, 2, 10], weights := [0, 1, 0, 0] }

-- Period 10, original row 6108, representative 9925.
def source60 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B007.Data.entryAt ⟨29, by decide +kernel⟩

def target60 : Weights.Entry :=
  { word := [8, 10, 0, 9, 8, 8, 12], weights := [0, 1, 0, 0] }

-- Period 10, original row 6110, representative 9919.
def source61 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B007.Data.entryAt ⟨23, by decide +kernel⟩

def target61 : Weights.Entry :=
  { word := [8, 10, 0, 9, 8, 9, 12], weights := [0, 1, 0, 0] }

-- Period 10, original row 6112, representative 9917.
def source62 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B007.Data.entryAt ⟨21, by decide +kernel⟩

def target62 : Weights.Entry :=
  { word := [8, 10, 0, 9, 8, 10, 10], weights := [0, 1, 0, 0] }

-- Period 10, original row 6120, representative 9915.
def source63 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B007.Data.entryAt ⟨19, by decide +kernel⟩

def target63 : Weights.Entry :=
  { word := [8, 10, 0, 10, 0, 0, 9], weights := [0, 1, 0, 0] }

def points63 : List (ℕ × ℕ) := [(0, 9), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2), (9, 0)]

-- Period 10, original row 6121, representative 9915.
def source64 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B007.Data.entryAt ⟨19, by decide +kernel⟩

def target64 : Weights.Entry :=
  { word := [8, 10, 0, 10, 0, 0, 10], weights := [0, 1, 0, 0] }

def points64 : List (ℕ × ℕ) := [(0, 8), (1, 7), (2, 9), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2), (9, 0)]

-- Period 10, original row 6122, representative 9915.
def source65 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B007.Data.entryAt ⟨19, by decide +kernel⟩

def target65 : Weights.Entry :=
  { word := [8, 10, 0, 10, 0, 0, 12], weights := [0, 1, 0, 0] }

def points65 : List (ℕ × ℕ) := [(0, 7), (1, 8), (2, 9), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2), (9, 0)]

-- Period 10, original row 6128, representative 9909.
def source66 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B007.Data.entryAt ⟨13, by decide +kernel⟩

def target66 : Weights.Entry :=
  { word := [8, 10, 0, 10, 0, 8, 12], weights := [1, 0, 0, 1] }

-- Period 10, original row 6130, representative 9914.
def source67 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B007.Data.entryAt ⟨18, by decide +kernel⟩

def target67 : Weights.Entry :=
  { word := [8, 10, 0, 10, 8, 0, 12], weights := [0, 1, 0, 0] }

-- Period 10, original row 6134, representative 9906.
def source68 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B007.Data.entryAt ⟨10, by decide +kernel⟩

def target68 : Weights.Entry :=
  { word := [8, 10, 0, 10, 8, 8, 12], weights := [0, 1, 0, 0] }

-- Period 10, original row 6141, representative 9927.
def source69 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B007.Data.entryAt ⟨31, by decide +kernel⟩

def target69 : Weights.Entry :=
  { word := [8, 10, 0, 12, 2, 0, 9], weights := [1, 1, 0, 1] }

def points69 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2), (9, 0)]

-- Period 10, original row 6142, representative 9927.
def source70 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B007.Data.entryAt ⟨31, by decide +kernel⟩

def target70 : Weights.Entry :=
  { word := [8, 10, 0, 12, 2, 0, 10], weights := [1, 1, 0, 1] }

def points70 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2), (9, 0)]

-- Period 10, original row 6143, representative 9929.
def source71 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B007.Data.entryAt ⟨33, by decide +kernel⟩

def target71 : Weights.Entry :=
  { word := [8, 10, 0, 12, 2, 0, 12], weights := [1, 1, 0, 1] }

-- Period 10, original row 6149, representative 9926.
def source72 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B007.Data.entryAt ⟨30, by decide +kernel⟩

def target72 : Weights.Entry :=
  { word := [8, 10, 0, 12, 10, 0, 9], weights := [1, 1, 0, 1] }

def points72 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2), (9, 0)]

-- Period 10, original row 6150, representative 9926.
def source73 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B007.Data.entryAt ⟨30, by decide +kernel⟩

def target73 : Weights.Entry :=
  { word := [8, 10, 0, 12, 10, 0, 10], weights := [1, 1, 0, 1] }

def points73 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2), (9, 0)]

-- Period 10, original row 6151, representative 9928.
def source74 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B007.Data.entryAt ⟨32, by decide +kernel⟩

def target74 : Weights.Entry :=
  { word := [8, 10, 0, 12, 10, 0, 12], weights := [1, 1, 0, 1] }

-- Period 10, original row 6157, representative 9910.
def source75 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B007.Data.entryAt ⟨14, by decide +kernel⟩

def target75 : Weights.Entry :=
  { word := [8, 10, 2, 2, 8, 0, 9], weights := [1, 0, 0, 1] }

def points75 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 6158, representative 9910.
def source76 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B007.Data.entryAt ⟨14, by decide +kernel⟩

def target76 : Weights.Entry :=
  { word := [8, 10, 2, 2, 8, 0, 10], weights := [1, 0, 0, 1] }

def points76 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 6159, representative 9912.
def source77 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B007.Data.entryAt ⟨16, by decide +kernel⟩

def target77 : Weights.Entry :=
  { word := [8, 10, 2, 2, 8, 0, 12], weights := [1, 0, 0, 1] }

-- Period 10, original row 6170, representative 9896.
def source78 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B007.Data.entryAt ⟨0, by decide +kernel⟩

def target78 : Weights.Entry :=
  { word := [8, 10, 2, 2, 8, 8, 10], weights := [1, 0, 0, 1] }

-- Period 10, original row 6171, representative 9900.
def source79 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B007.Data.entryAt ⟨4, by decide +kernel⟩

def target79 : Weights.Entry :=
  { word := [8, 10, 2, 2, 8, 8, 12], weights := [1, 0, 0, 1] }

-- Period 10, original row 6180, representative 9911.
def source80 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B007.Data.entryAt ⟨15, by decide +kernel⟩

def target80 : Weights.Entry :=
  { word := [8, 10, 2, 10, 8, 0, 9], weights := [1, 0, 0, 1] }

def points80 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 6181, representative 9911.
def source81 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B007.Data.entryAt ⟨15, by decide +kernel⟩

def target81 : Weights.Entry :=
  { word := [8, 10, 2, 10, 8, 0, 10], weights := [1, 0, 0, 1] }

def points81 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 6182, representative 9913.
def source82 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B007.Data.entryAt ⟨17, by decide +kernel⟩

def target82 : Weights.Entry :=
  { word := [8, 10, 2, 10, 8, 0, 12], weights := [1, 1, 0, 0] }

-- Period 10, original row 6198, representative 9899.
def source83 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B007.Data.entryAt ⟨3, by decide +kernel⟩

def target83 : Weights.Entry :=
  { word := [8, 10, 2, 10, 8, 8, 10], weights := [1, 0, 0, 1] }

-- Period 10, original row 6199, representative 9903.
def source84 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B007.Data.entryAt ⟨7, by decide +kernel⟩

def target84 : Weights.Entry :=
  { word := [8, 10, 2, 10, 8, 8, 12], weights := [1, 0, 0, 1] }

-- Period 10, original row 6220, representative 9907.
def source85 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B007.Data.entryAt ⟨11, by decide +kernel⟩

def target85 : Weights.Entry :=
  { word := [8, 10, 8, 2, 0, 8, 10], weights := [1, 0, 0, 1] }

-- Period 10, original row 6221, representative 9907.
def source86 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B007.Data.entryAt ⟨11, by decide +kernel⟩

def target86 : Weights.Entry :=
  { word := [8, 10, 8, 2, 0, 8, 12], weights := [1, 0, 0, 1] }

def points86 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 8), (8, 7), (9, 9)]

-- Period 10, original row 6231, representative 9904.
def source87 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B007.Data.entryAt ⟨8, by decide +kernel⟩

def target87 : Weights.Entry :=
  { word := [8, 10, 8, 2, 8, 8, 12], weights := [1, 0, 0, 1] }

-- Period 10, original row 6261, representative 9908.
def source88 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B007.Data.entryAt ⟨12, by decide +kernel⟩

def target88 : Weights.Entry :=
  { word := [8, 10, 8, 10, 0, 8, 10], weights := [1, 0, 0, 1] }

-- Period 10, original row 6262, representative 9908.
def source89 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B007.Data.entryAt ⟨12, by decide +kernel⟩

def target89 : Weights.Entry :=
  { word := [8, 10, 8, 10, 0, 8, 12], weights := [1, 0, 0, 1] }

def points89 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 8), (8, 7), (9, 9)]

-- Period 10, original row 6275, representative 9905.
def source90 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B007.Data.entryAt ⟨9, by decide +kernel⟩

def target90 : Weights.Entry :=
  { word := [8, 10, 8, 10, 8, 8, 12], weights := [0, 1, 0, 0] }

-- Period 10, original row 6298, representative 9897.
def source91 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B007.Data.entryAt ⟨1, by decide +kernel⟩

def target91 : Weights.Entry :=
  { word := [8, 10, 10, 2, 8, 8, 10], weights := [1, 0, 0, 1] }

-- Period 10, original row 6299, representative 9901.
def source92 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B007.Data.entryAt ⟨5, by decide +kernel⟩

def target92 : Weights.Entry :=
  { word := [8, 10, 10, 2, 8, 8, 12], weights := [1, 0, 0, 1] }

-- Period 10, original row 6320, representative 9898.
def source93 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B007.Data.entryAt ⟨2, by decide +kernel⟩

def target93 : Weights.Entry :=
  { word := [8, 10, 10, 10, 8, 8, 10], weights := [1, 0, 0, 1] }

-- Period 10, original row 6321, representative 9902.
def source94 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B007.Data.entryAt ⟨6, by decide +kernel⟩

def target94 : Weights.Entry :=
  { word := [8, 10, 10, 10, 8, 8, 12], weights := [1, 0, 0, 1] }

-- Period 10, original row 7419, representative 9915.
def source95 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B007.Data.entryAt ⟨19, by decide +kernel⟩

def target95 : Weights.Entry :=
  { word := [10, 0, 0, 12, 0, 12, 8], weights := [0, 0, 1, 0] }

def points95 : List (ℕ × ℕ) := [(0, 2), (1, 0), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8), (9, 9)]

-- Period 10, original row 7460, representative 9929.
def source96 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B007.Data.entryAt ⟨33, by decide +kernel⟩

def target96 : Weights.Entry :=
  { word := [10, 0, 4, 10, 0, 12, 8], weights := [1, 0, 1, 1] }

def points96 : List (ℕ × ℕ) := [(0, 9), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 0), (9, 1)]

-- Period 10, original row 7487, representative 9912.
def source97 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B007.Data.entryAt ⟨16, by decide +kernel⟩

def target97 : Weights.Entry :=
  { word := [10, 0, 8, 4, 4, 12, 8], weights := [1, 0, 0, 1] }

def points97 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 0), (9, 1)]

-- Period 10, original row 7511, representative 9914.
def source98 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B007.Data.entryAt ⟨18, by decide +kernel⟩

def target98 : Weights.Entry :=
  { word := [10, 0, 8, 12, 0, 12, 8], weights := [0, 0, 1, 0] }

def points98 : List (ℕ × ℕ) := [(0, 9), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 0), (9, 1)]

-- Period 10, original row 7517, representative 9913.
def source99 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B007.Data.entryAt ⟨17, by decide +kernel⟩

def target99 : Weights.Entry :=
  { word := [10, 0, 8, 12, 4, 12, 8], weights := [0, 0, 1, 1] }

def points99 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 0), (9, 1)]

-- Period 10, original row 7523, representative 9922.
def source100 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B007.Data.entryAt ⟨26, by decide +kernel⟩

def target100 : Weights.Entry :=
  { word := [10, 0, 9, 0, 1, 12, 8], weights := [0, 0, 1, 0] }

def points100 : List (ℕ × ℕ) := [(0, 9), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 0), (9, 1)]

-- Period 10, original row 7531, representative 9923.
def source101 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B007.Data.entryAt ⟨27, by decide +kernel⟩

def target101 : Weights.Entry :=
  { word := [10, 0, 9, 8, 1, 12, 8], weights := [0, 0, 1, 0] }

def points101 : List (ℕ × ℕ) := [(0, 9), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 0), (9, 1)]

-- Period 10, original row 7582, representative 9928.
def source102 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B007.Data.entryAt ⟨32, by decide +kernel⟩

def target102 : Weights.Entry :=
  { word := [10, 0, 12, 10, 0, 12, 8], weights := [1, 0, 1, 1] }

def points102 : List (ℕ × ℕ) := [(0, 9), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 0), (9, 1)]

-- Period 10, original row 7832, representative 9953.
def source103 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B007.Data.entryAt ⟨57, by decide +kernel⟩

def target103 : Weights.Entry :=
  { word := [10, 8, 0, 4, 4, 4, 8], weights := [1, 0, 0, 1] }

def points103 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2), (9, 0)]

-- Period 10, original row 7839, representative 9957.
def source104 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B007.Data.entryAt ⟨61, by decide +kernel⟩

def target104 : Weights.Entry :=
  { word := [10, 8, 0, 4, 8, 4, 8], weights := [1, 0, 0, 1] }

def points104 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2), (9, 0)]

-- Period 10, original row 7843, representative 9907.
def source105 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B007.Data.entryAt ⟨11, by decide +kernel⟩

def target105 : Weights.Entry :=
  { word := [10, 8, 0, 4, 8, 12, 8], weights := [1, 0, 0, 1] }

def points105 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2), (9, 0)]

-- Period 10, original row 7858, representative 9954.
def source106 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B007.Data.entryAt ⟨58, by decide +kernel⟩

def target106 : Weights.Entry :=
  { word := [10, 8, 0, 4, 12, 4, 8], weights := [1, 0, 0, 1] }

def points106 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2), (9, 0)]

-- Period 10, original row 7865, representative 9959.
def source107 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B007.Data.entryAt ⟨63, by decide +kernel⟩

def target107 : Weights.Entry :=
  { word := [10, 8, 0, 12, 0, 4, 8], weights := [1, 0, 0, 1] }

def points107 : List (ℕ × ℕ) := [(0, 9), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 7869, representative 9909.
def source108 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B007.Data.entryAt ⟨13, by decide +kernel⟩

def target108 : Weights.Entry :=
  { word := [10, 8, 0, 12, 0, 12, 8], weights := [1, 0, 0, 1] }

def points108 : List (ℕ × ℕ) := [(0, 9), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 7884, representative 9956.
def source109 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B007.Data.entryAt ⟨60, by decide +kernel⟩

def target109 : Weights.Entry :=
  { word := [10, 8, 0, 12, 4, 4, 8], weights := [1, 0, 0, 1] }

def points109 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2), (9, 0)]

-- Period 10, original row 7890, representative 9958.
def source110 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B007.Data.entryAt ⟨62, by decide +kernel⟩

def target110 : Weights.Entry :=
  { word := [10, 8, 0, 12, 8, 4, 8], weights := [1, 0, 0, 1] }

def points110 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2), (9, 0)]

-- Period 10, original row 7894, representative 9908.
def source111 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B007.Data.entryAt ⟨12, by decide +kernel⟩

def target111 : Weights.Entry :=
  { word := [10, 8, 0, 12, 8, 12, 8], weights := [1, 0, 0, 1] }

def points111 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2), (9, 0)]

-- Period 10, original row 7909, representative 9955.
def source112 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B007.Data.entryAt ⟨59, by decide +kernel⟩

def target112 : Weights.Entry :=
  { word := [10, 8, 0, 12, 12, 4, 8], weights := [1, 0, 0, 1] }

def points112 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2), (9, 0)]

-- Period 10, original row 7970, representative 9924.
def source113 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B007.Data.entryAt ⟨28, by decide +kernel⟩

def target113 : Weights.Entry :=
  { word := [10, 8, 8, 0, 1, 12, 8], weights := [0, 0, 1, 0] }

def points113 : List (ℕ × ℕ) := [(0, 9), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 7996, representative 9946.
def source114 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B007.Data.entryAt ⟨50, by decide +kernel⟩

def target114 : Weights.Entry :=
  { word := [10, 8, 8, 4, 4, 4, 8], weights := [1, 0, 0, 1] }

def points114 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 7998, representative 9900.
def source115 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B007.Data.entryAt ⟨4, by decide +kernel⟩

def target115 : Weights.Entry :=
  { word := [10, 8, 8, 4, 4, 12, 8], weights := [1, 0, 0, 1] }

def points115 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8005, representative 9950.
def source116 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B007.Data.entryAt ⟨54, by decide +kernel⟩

def target116 : Weights.Entry :=
  { word := [10, 8, 8, 4, 8, 4, 8], weights := [1, 0, 0, 1] }

def points116 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8010, representative 9904.
def source117 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B007.Data.entryAt ⟨8, by decide +kernel⟩

def target117 : Weights.Entry :=
  { word := [10, 8, 8, 4, 8, 12, 8], weights := [1, 0, 0, 1] }

def points117 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8026, representative 9947.
def source118 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B007.Data.entryAt ⟨51, by decide +kernel⟩

def target118 : Weights.Entry :=
  { word := [10, 8, 8, 4, 12, 4, 8], weights := [1, 0, 0, 1] }

def points118 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8028, representative 9901.
def source119 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B007.Data.entryAt ⟨5, by decide +kernel⟩

def target119 : Weights.Entry :=
  { word := [10, 8, 8, 4, 12, 12, 8], weights := [1, 0, 0, 1] }

def points119 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8036, representative 9925.
def source120 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B007.Data.entryAt ⟨29, by decide +kernel⟩

def target120 : Weights.Entry :=
  { word := [10, 8, 8, 8, 1, 12, 8], weights := [0, 0, 1, 0] }

def points120 : List (ℕ × ℕ) := [(0, 9), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8049, representative 9952.
def source121 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B007.Data.entryAt ⟨56, by decide +kernel⟩

def target121 : Weights.Entry :=
  { word := [10, 8, 8, 12, 0, 4, 8], weights := [0, 0, 1, 0] }

def points121 : List (ℕ × ℕ) := [(0, 9), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8054, representative 9906.
def source122 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B007.Data.entryAt ⟨10, by decide +kernel⟩

def target122 : Weights.Entry :=
  { word := [10, 8, 8, 12, 0, 12, 8], weights := [0, 0, 1, 0] }

def points122 : List (ℕ × ℕ) := [(0, 9), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8070, representative 9949.
def source123 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B007.Data.entryAt ⟨53, by decide +kernel⟩

def target123 : Weights.Entry :=
  { word := [10, 8, 8, 12, 4, 4, 8], weights := [1, 0, 0, 1] }

def points123 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8072, representative 9903.
def source124 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B007.Data.entryAt ⟨7, by decide +kernel⟩

def target124 : Weights.Entry :=
  { word := [10, 8, 8, 12, 4, 12, 8], weights := [1, 0, 0, 1] }

def points124 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8078, representative 9951.
def source125 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B007.Data.entryAt ⟨55, by decide +kernel⟩

def target125 : Weights.Entry :=
  { word := [10, 8, 8, 12, 8, 4, 8], weights := [0, 0, 1, 0] }

def points125 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8083, representative 9905.
def source126 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B007.Data.entryAt ⟨9, by decide +kernel⟩

def target126 : Weights.Entry :=
  { word := [10, 8, 8, 12, 8, 12, 8], weights := [0, 0, 1, 0] }

def points126 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8099, representative 9948.
def source127 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B007.Data.entryAt ⟨52, by decide +kernel⟩

def target127 : Weights.Entry :=
  { word := [10, 8, 8, 12, 12, 4, 8], weights := [1, 0, 0, 1] }

def points127 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

def period10Entries : List Weights.Entry := [target0, target1, target2, target3, target4, target5, target6, target7, target8, target9, target10, target11, target12, target13, target14, target15, target16, target17, target18, target19, target20, target21, target22, target23, target24, target25, target26, target27, target28, target29, target30, target31, target32, target33, target34, target35, target36, target37, target38, target39, target40, target41, target42, target43, target44, target45, target46, target47, target48, target49, target50, target51, target52, target53, target54, target55, target56, target57, target58, target59, target60, target61, target62, target63, target64, target65, target66, target67, target68, target69, target70, target71, target72, target73, target74, target75, target76, target77, target78, target79, target80, target81, target82, target83, target84, target85, target86, target87, target88, target89, target90, target91, target92, target93, target94, target95, target96, target97, target98, target99, target100, target101, target102, target103, target104, target105, target106, target107, target108, target109, target110, target111, target112, target113, target114, target115, target116, target117, target118, target119, target120, target121, target122, target123, target124, target125, target126, target127]

def period10Chunk : RowCoverage.Chunk where
  rows := [⟨4513, target0⟩, ⟨4559, target1⟩, ⟨4586, target2⟩, ⟨4603, target3⟩, ⟨4652, target4⟩, ⟨4683, target5⟩, ⟨4733, target6⟩, ⟨4734, target7⟩, ⟨4740, target8⟩, ⟨4766, target9⟩, ⟨4767, target10⟩, ⟨4768, target11⟩, ⟨4789, target12⟩, ⟨4790, target13⟩, ⟨4791, target14⟩, ⟨4805, target15⟩, ⟨4806, target16⟩, ⟨4807, target17⟩, ⟨4834, target18⟩, ⟨4835, target19⟩, ⟨4836, target20⟩, ⟨4856, target21⟩, ⟨4857, target22⟩, ⟨4858, target23⟩, ⟨4868, target24⟩, ⟨4897, target25⟩, ⟨4898, target26⟩, ⟨4899, target27⟩, ⟨4912, target28⟩, ⟨4934, target29⟩, ⟨4935, target30⟩, ⟨4936, target31⟩, ⟨4950, target32⟩, ⟨4951, target33⟩, ⟨4952, target34⟩, ⟨4967, target35⟩, ⟨4968, target36⟩, ⟨4969, target37⟩, ⟨4989, target38⟩, ⟨4990, target39⟩, ⟨4991, target40⟩, ⟨5868, target41⟩, ⟨5885, target42⟩, ⟨5892, target43⟩, ⟨5911, target44⟩, ⟨5926, target45⟩, ⟨5945, target46⟩, ⟨5951, target47⟩, ⟨5970, target48⟩, ⟨6006, target49⟩, ⟨6014, target50⟩, ⟨6036, target51⟩, ⟨6043, target52⟩, ⟨6063, target53⟩, ⟨6065, target54⟩, ⟨6068, target55⟩, ⟨6070, target56⟩, ⟨6072, target57⟩, ⟨6100, target58⟩, ⟨6102, target59⟩, ⟨6108, target60⟩, ⟨6110, target61⟩, ⟨6112, target62⟩, ⟨6120, target63⟩, ⟨6121, target64⟩, ⟨6122, target65⟩, ⟨6128, target66⟩, ⟨6130, target67⟩, ⟨6134, target68⟩, ⟨6141, target69⟩, ⟨6142, target70⟩, ⟨6143, target71⟩, ⟨6149, target72⟩, ⟨6150, target73⟩, ⟨6151, target74⟩, ⟨6157, target75⟩, ⟨6158, target76⟩, ⟨6159, target77⟩, ⟨6170, target78⟩, ⟨6171, target79⟩, ⟨6180, target80⟩, ⟨6181, target81⟩, ⟨6182, target82⟩, ⟨6198, target83⟩, ⟨6199, target84⟩, ⟨6220, target85⟩, ⟨6221, target86⟩, ⟨6231, target87⟩, ⟨6261, target88⟩, ⟨6262, target89⟩, ⟨6275, target90⟩, ⟨6298, target91⟩, ⟨6299, target92⟩, ⟨6320, target93⟩, ⟨6321, target94⟩, ⟨7419, target95⟩, ⟨7460, target96⟩, ⟨7487, target97⟩, ⟨7511, target98⟩, ⟨7517, target99⟩, ⟨7523, target100⟩, ⟨7531, target101⟩, ⟨7582, target102⟩, ⟨7832, target103⟩, ⟨7839, target104⟩, ⟨7843, target105⟩, ⟨7858, target106⟩, ⟨7865, target107⟩, ⟨7869, target108⟩, ⟨7884, target109⟩, ⟨7890, target110⟩, ⟨7894, target111⟩, ⟨7909, target112⟩, ⟨7970, target113⟩, ⟨7996, target114⟩, ⟨7998, target115⟩, ⟨8005, target116⟩, ⟨8010, target117⟩, ⟨8026, target118⟩, ⟨8028, target119⟩, ⟨8036, target120⟩, ⟨8049, target121⟩, ⟨8054, target122⟩, ⟨8070, target123⟩, ⟨8072, target124⟩, ⟨8078, target125⟩, ⟨8083, target126⟩, ⟨8099, target127⟩]
  indexMask := 110139149995953704185621172878728062743654461855085137892344892977720958443658901028463059703369757531094921388245592095791615704775854089779200847542361277967174526312699267239309492724387483656266197645806125087140179232886447036889005814961898344008156690559460176755701739159146043776049011148087337556357748956093982290459773890469468694138632859581685241717005475941143690915674568837398089179418597930301467971394726367852514139002520989318061155200132857201648519706380532111675362180487551304739220163843452027168605955518947962251657049951741978517660649441597957459314455792839186657123844040876971037817840031673945819634204567616484035362613394274482116972162276938435579257027489845925565348729593729234403638508537602815089282959303547973311884180413849624373802371960901610109601242300212992978045896234975752142711216756885287853700416618451776536646481918996925020135920107519678219532711653321531729941728774854649366978694846328533687980595144577408410965043092306449593817622660939883188111864242504229526235572751671160770233409462058742302555467603472871335845875059425646611394497315764810228404238469912766702145923689960064114632015871640894216899335006839022774980309159398786420048541378129247847020335429299515885049548164834155432662671124125702514653031272316383299181715920585592431439353637461671279846096197469118806443555140190250490139567742922010621257187709814573615605491698964843253463058039477688910667117253452249476554596590852710331955868826132833862331108767828653082529433975184507759524843129101831450462122020600042721987531157652489287488923334938991970646195117695069188743772010043125546313845132017842395510391607922942654843169235295805155122345187242620402959992487560455296841552963213999017445452420003279726166721892857680284204886352423055709951006974589892074544530072024804698315927281020132052712757192371498725062920190815388752321714698263180826795456332681753938704189998429092957399934692723629695404014573211975793982954255402980212468392232232690259431617017792918001234282481012034596581198155606710423857825015121699706820371070572303746066115588980520285210643746616527115568633880351472877560246146864504935809947540526365854558930128933659825018291857357029540785598150841412746184572667192205859248022382794489199636729694636001313121727037504314412535259776231364973897007469170278570180930075583913843591918511200090652574514180785635246193282986641376408359665664
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

end FranklSmallCyclic.TransportBatches.G085.B000.Data
