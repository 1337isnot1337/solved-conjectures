module

public import Conjectures.FranklSmallCyclicRowCoverage
public import Conjectures.FranklSmallCyclicCanonicalWords
public import Conjectures.FranklSmallCyclicOrbit8Block007Data

/-! 128 literal targets sharing one source proof block.
Original words and row indices are retained; weights may be transported.
-/
@[expose] public section

namespace FranklSmallCyclic.TransportBatches.G033.B000.Data

-- Period 8, original row 154, representative 4326.
def source0 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B007.Data.entryAt ⟨116, by decide +kernel⟩

def target0 : Weights.Entry :=
  { word := [0, 1, 4, 2, 0, 8, 10], weights := [1, 0, 0, 1] }

-- Period 8, original row 155, representative 4326.
def source1 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B007.Data.entryAt ⟨116, by decide +kernel⟩

def target1 : Weights.Entry :=
  { word := [0, 1, 4, 2, 0, 8, 12], weights := [1, 0, 0, 1] }

def points1 : List (ℕ × ℕ) := [(0, 7), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 0)]

-- Period 8, original row 163, representative 4327.
def source2 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B007.Data.entryAt ⟨117, by decide +kernel⟩

def target2 : Weights.Entry :=
  { word := [0, 1, 4, 2, 8, 8, 12], weights := [1, 0, 0, 1] }

-- Period 8, original row 182, representative 4333.
def source3 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B007.Data.entryAt ⟨122, by decide +kernel⟩

def target3 : Weights.Entry :=
  { word := [0, 1, 4, 10, 0, 8, 10], weights := [1, 0, 0, 1] }

-- Period 8, original row 183, representative 4333.
def source4 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B007.Data.entryAt ⟨122, by decide +kernel⟩

def target4 : Weights.Entry :=
  { word := [0, 1, 4, 10, 0, 8, 12], weights := [1, 0, 0, 1] }

def points4 : List (ℕ × ℕ) := [(0, 7), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 0)]

-- Period 8, original row 195, representative 4330.
def source5 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B007.Data.entryAt ⟨119, by decide +kernel⟩

def target5 : Weights.Entry :=
  { word := [0, 1, 4, 10, 8, 8, 12], weights := [1, 0, 0, 1] }

-- Period 8, original row 243, representative 4331.
def source6 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B007.Data.entryAt ⟨120, by decide +kernel⟩

def target6 : Weights.Entry :=
  { word := [0, 1, 12, 2, 0, 8, 10], weights := [1, 0, 0, 1] }

-- Period 8, original row 244, representative 4331.
def source7 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B007.Data.entryAt ⟨120, by decide +kernel⟩

def target7 : Weights.Entry :=
  { word := [0, 1, 12, 2, 0, 8, 12], weights := [1, 0, 0, 1] }

def points7 : List (ℕ × ℕ) := [(0, 7), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 0)]

-- Period 8, original row 252, representative 4328.
def source8 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B007.Data.entryAt ⟨118, by decide +kernel⟩

def target8 : Weights.Entry :=
  { word := [0, 1, 12, 2, 8, 8, 12], weights := [1, 0, 0, 1] }

-- Period 8, original row 275, representative 4332.
def source9 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B007.Data.entryAt ⟨121, by decide +kernel⟩

def target9 : Weights.Entry :=
  { word := [0, 1, 12, 10, 0, 8, 10], weights := [1, 0, 0, 1] }

-- Period 8, original row 276, representative 4332.
def source10 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B007.Data.entryAt ⟨121, by decide +kernel⟩

def target10 : Weights.Entry :=
  { word := [0, 1, 12, 10, 0, 8, 12], weights := [1, 0, 0, 1] }

def points10 : List (ℕ × ℕ) := [(0, 7), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 0)]

-- Period 8, original row 326, representative 4326.
def source11 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B007.Data.entryAt ⟨116, by decide +kernel⟩

def target11 : Weights.Entry :=
  { word := [0, 2, 2, 2, 0, 8, 10], weights := [0, 1, 0, 1] }

def points11 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6), (7, 7)]

-- Period 8, original row 327, representative 4326.
def source12 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B007.Data.entryAt ⟨116, by decide +kernel⟩

def target12 : Weights.Entry :=
  { word := [0, 2, 2, 2, 0, 8, 12], weights := [0, 1, 0, 1] }

def points12 : List (ℕ × ℕ) := [(0, 7), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6), (7, 0)]

-- Period 8, original row 354, representative 4314.
def source13 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B007.Data.entryAt ⟨104, by decide +kernel⟩

def target13 : Weights.Entry :=
  { word := [0, 2, 2, 2, 8, 8, 10], weights := [1, 0, 0, 1] }

-- Period 8, original row 355, representative 4322.
def source14 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B007.Data.entryAt ⟨112, by decide +kernel⟩

def target14 : Weights.Entry :=
  { word := [0, 2, 2, 2, 8, 8, 12], weights := [1, 0, 0, 1] }

-- Period 8, original row 374, representative 4333.
def source15 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B007.Data.entryAt ⟨122, by decide +kernel⟩

def target15 : Weights.Entry :=
  { word := [0, 2, 2, 10, 0, 8, 10], weights := [0, 1, 0, 1] }

def points15 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6), (7, 7)]

-- Period 8, original row 375, representative 4333.
def source16 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B007.Data.entryAt ⟨122, by decide +kernel⟩

def target16 : Weights.Entry :=
  { word := [0, 2, 2, 10, 0, 8, 12], weights := [0, 1, 0, 1] }

def points16 : List (ℕ × ℕ) := [(0, 7), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6), (7, 0)]

-- Period 8, original row 402, representative 4317.
def source17 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B007.Data.entryAt ⟨107, by decide +kernel⟩

def target17 : Weights.Entry :=
  { word := [0, 2, 2, 10, 8, 8, 10], weights := [0, 1, 1, 0] }

-- Period 8, original row 403, representative 4325.
def source18 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B007.Data.entryAt ⟨115, by decide +kernel⟩

def target18 : Weights.Entry :=
  { word := [0, 2, 2, 10, 8, 8, 12], weights := [1, 0, 0, 1] }

-- Period 8, original row 431, representative 4331.
def source19 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B007.Data.entryAt ⟨120, by decide +kernel⟩

def target19 : Weights.Entry :=
  { word := [0, 2, 10, 2, 0, 8, 10], weights := [0, 1, 0, 1] }

def points19 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6), (7, 7)]

-- Period 8, original row 432, representative 4331.
def source20 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B007.Data.entryAt ⟨120, by decide +kernel⟩

def target20 : Weights.Entry :=
  { word := [0, 2, 10, 2, 0, 8, 12], weights := [0, 1, 0, 1] }

def points20 : List (ℕ × ℕ) := [(0, 7), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6), (7, 0)]

-- Period 8, original row 452, representative 4315.
def source21 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B007.Data.entryAt ⟨105, by decide +kernel⟩

def target21 : Weights.Entry :=
  { word := [0, 2, 10, 2, 8, 8, 10], weights := [1, 0, 0, 1] }

-- Period 8, original row 453, representative 4323.
def source22 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B007.Data.entryAt ⟨113, by decide +kernel⟩

def target22 : Weights.Entry :=
  { word := [0, 2, 10, 2, 8, 8, 12], weights := [1, 0, 0, 1] }

-- Period 8, original row 476, representative 4332.
def source23 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B007.Data.entryAt ⟨121, by decide +kernel⟩

def target23 : Weights.Entry :=
  { word := [0, 2, 10, 10, 0, 8, 10], weights := [0, 1, 0, 1] }

def points23 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6), (7, 7)]

-- Period 8, original row 477, representative 4332.
def source24 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B007.Data.entryAt ⟨121, by decide +kernel⟩

def target24 : Weights.Entry :=
  { word := [0, 2, 10, 10, 0, 8, 12], weights := [0, 1, 0, 1] }

def points24 : List (ℕ × ℕ) := [(0, 7), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6), (7, 0)]

-- Period 8, original row 497, representative 4316.
def source25 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B007.Data.entryAt ⟨106, by decide +kernel⟩

def target25 : Weights.Entry :=
  { word := [0, 2, 10, 10, 8, 8, 10], weights := [0, 1, 1, 0] }

-- Period 8, original row 498, representative 4324.
def source26 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B007.Data.entryAt ⟨114, by decide +kernel⟩

def target26 : Weights.Entry :=
  { word := [0, 2, 10, 10, 8, 8, 12], weights := [1, 0, 0, 1] }

-- Period 8, original row 750, representative 4334.
def source27 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B007.Data.entryAt ⟨123, by decide +kernel⟩

def target27 : Weights.Entry :=
  { word := [0, 6, 2, 8, 8, 0, 10], weights := [0, 1, 1, 0] }

-- Period 8, original row 752, representative 4279.
def source28 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B007.Data.entryAt ⟨69, by decide +kernel⟩

def target28 : Weights.Entry :=
  { word := [0, 6, 2, 8, 8, 2, 10], weights := [0, 1, 1, 0] }

-- Period 8, original row 760, representative 4309.
def source29 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B007.Data.entryAt ⟨99, by decide +kernel⟩

def target29 : Weights.Entry :=
  { word := [0, 6, 2, 8, 8, 8, 10], weights := [0, 1, 1, 0] }

-- Period 8, original row 762, representative 4273.
def source30 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B007.Data.entryAt ⟨63, by decide +kernel⟩

def target30 : Weights.Entry :=
  { word := [0, 6, 2, 8, 8, 10, 10], weights := [0, 1, 1, 0] }

-- Period 8, original row 779, representative 4278.
def source31 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B007.Data.entryAt ⟨68, by decide +kernel⟩

def target31 : Weights.Entry :=
  { word := [0, 6, 10, 8, 8, 2, 10], weights := [0, 1, 1, 0] }

-- Period 8, original row 787, representative 4308.
def source32 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B007.Data.entryAt ⟨98, by decide +kernel⟩

def target32 : Weights.Entry :=
  { word := [0, 6, 10, 8, 8, 8, 10], weights := [0, 1, 1, 0] }

-- Period 8, original row 789, representative 4272.
def source33 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B007.Data.entryAt ⟨62, by decide +kernel⟩

def target33 : Weights.Entry :=
  { word := [0, 6, 10, 8, 8, 10, 10], weights := [0, 1, 1, 0] }

-- Period 8, original row 1129, representative 4276.
def source34 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B007.Data.entryAt ⟨66, by decide +kernel⟩

def target34 : Weights.Entry :=
  { word := [0, 9, 0, 1, 4, 8, 12], weights := [0, 1, 0, 0] }

-- Period 8, original row 1135, representative 4274.
def source35 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B007.Data.entryAt ⟨64, by decide +kernel⟩

def target35 : Weights.Entry :=
  { word := [0, 9, 0, 1, 12, 8, 12], weights := [0, 1, 0, 0] }

-- Period 8, original row 1160, representative 4300.
def source36 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B007.Data.entryAt ⟨90, by decide +kernel⟩

def target36 : Weights.Entry :=
  { word := [0, 9, 0, 4, 2, 8, 10], weights := [1, 0, 1, 0] }

-- Period 8, original row 1161, representative 4304.
def source37 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B007.Data.entryAt ⟨94, by decide +kernel⟩

def target37 : Weights.Entry :=
  { word := [0, 9, 0, 4, 2, 8, 12], weights := [1, 0, 0, 1] }

-- Period 8, original row 1186, representative 4301.
def source38 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B007.Data.entryAt ⟨91, by decide +kernel⟩

def target38 : Weights.Entry :=
  { word := [0, 9, 0, 4, 10, 8, 10], weights := [1, 0, 1, 0] }

-- Period 8, original row 1187, representative 4305.
def source39 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B007.Data.entryAt ⟨95, by decide +kernel⟩

def target39 : Weights.Entry :=
  { word := [0, 9, 0, 4, 10, 8, 12], weights := [1, 0, 0, 1] }

-- Period 8, original row 1220, representative 4303.
def source40 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B007.Data.entryAt ⟨93, by decide +kernel⟩

def target40 : Weights.Entry :=
  { word := [0, 9, 0, 12, 2, 8, 10], weights := [1, 0, 1, 0] }

-- Period 8, original row 1221, representative 4307.
def source41 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B007.Data.entryAt ⟨97, by decide +kernel⟩

def target41 : Weights.Entry :=
  { word := [0, 9, 0, 12, 2, 8, 12], weights := [1, 0, 1, 0] }

-- Period 8, original row 1245, representative 4302.
def source42 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B007.Data.entryAt ⟨92, by decide +kernel⟩

def target42 : Weights.Entry :=
  { word := [0, 9, 0, 12, 10, 8, 10], weights := [1, 0, 1, 0] }

-- Period 8, original row 1246, representative 4306.
def source43 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B007.Data.entryAt ⟨96, by decide +kernel⟩

def target43 : Weights.Entry :=
  { word := [0, 9, 0, 12, 10, 8, 12], weights := [1, 0, 1, 0] }

-- Period 8, original row 1266, representative 4277.
def source44 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B007.Data.entryAt ⟨67, by decide +kernel⟩

def target44 : Weights.Entry :=
  { word := [0, 9, 8, 1, 4, 8, 12], weights := [0, 1, 0, 0] }

-- Period 8, original row 1272, representative 4275.
def source45 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B007.Data.entryAt ⟨65, by decide +kernel⟩

def target45 : Weights.Entry :=
  { word := [0, 9, 8, 1, 12, 8, 12], weights := [0, 1, 0, 0] }

-- Period 8, original row 1380, representative 4335.
def source46 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B007.Data.entryAt ⟨124, by decide +kernel⟩

def target46 : Weights.Entry :=
  { word := [0, 10, 2, 2, 8, 0, 10], weights := [1, 1, 0, 0] }

-- Period 8, original row 1381, representative 4337.
def source47 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B007.Data.entryAt ⟨126, by decide +kernel⟩

def target47 : Weights.Entry :=
  { word := [0, 10, 2, 2, 8, 0, 12], weights := [1, 0, 0, 1] }

-- Period 8, original row 1397, representative 4310.
def source48 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B007.Data.entryAt ⟨100, by decide +kernel⟩

def target48 : Weights.Entry :=
  { word := [0, 10, 2, 2, 8, 8, 10], weights := [1, 0, 0, 1] }

-- Period 8, original row 1398, representative 4318.
def source49 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B007.Data.entryAt ⟨108, by decide +kernel⟩

def target49 : Weights.Entry :=
  { word := [0, 10, 2, 2, 8, 8, 12], weights := [1, 0, 0, 1] }

-- Period 8, original row 1414, representative 4336.
def source50 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B007.Data.entryAt ⟨125, by decide +kernel⟩

def target50 : Weights.Entry :=
  { word := [0, 10, 2, 10, 8, 0, 10], weights := [1, 1, 0, 0] }

-- Period 8, original row 1415, representative 4338.
def source51 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B007.Data.entryAt ⟨127, by decide +kernel⟩

def target51 : Weights.Entry :=
  { word := [0, 10, 2, 10, 8, 0, 12], weights := [1, 1, 0, 0] }

-- Period 8, original row 1428, representative 4313.
def source52 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B007.Data.entryAt ⟨103, by decide +kernel⟩

def target52 : Weights.Entry :=
  { word := [0, 10, 2, 10, 8, 8, 10], weights := [0, 1, 1, 0] }

-- Period 8, original row 1429, representative 4321.
def source53 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B007.Data.entryAt ⟨111, by decide +kernel⟩

def target53 : Weights.Entry :=
  { word := [0, 10, 2, 10, 8, 8, 12], weights := [1, 0, 0, 1] }

-- Period 8, original row 1472, representative 4311.
def source54 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B007.Data.entryAt ⟨101, by decide +kernel⟩

def target54 : Weights.Entry :=
  { word := [0, 10, 10, 2, 8, 8, 10], weights := [1, 0, 0, 1] }

-- Period 8, original row 1473, representative 4319.
def source55 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B007.Data.entryAt ⟨109, by decide +kernel⟩

def target55 : Weights.Entry :=
  { word := [0, 10, 10, 2, 8, 8, 12], weights := [1, 0, 0, 1] }

-- Period 8, original row 1496, representative 4312.
def source56 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B007.Data.entryAt ⟨102, by decide +kernel⟩

def target56 : Weights.Entry :=
  { word := [0, 10, 10, 10, 8, 8, 10], weights := [0, 1, 1, 0] }

-- Period 8, original row 1497, representative 4320.
def source57 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B007.Data.entryAt ⟨110, by decide +kernel⟩

def target57 : Weights.Entry :=
  { word := [0, 10, 10, 10, 8, 8, 12], weights := [1, 0, 0, 1] }

-- Period 8, original row 3424, representative 4268.
def source58 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B007.Data.entryAt ⟨58, by decide +kernel⟩

def target58 : Weights.Entry :=
  { word := [4, 0, 4, 2, 0, 8, 9], weights := [1, 0, 0, 1] }

-- Period 8, original row 3426, representative 4292.
def source59 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B007.Data.entryAt ⟨82, by decide +kernel⟩

def target59 : Weights.Entry :=
  { word := [4, 0, 4, 2, 0, 8, 12], weights := [1, 0, 0, 1] }

-- Period 8, original row 3434, representative 4293.
def source60 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B007.Data.entryAt ⟨83, by decide +kernel⟩

def target60 : Weights.Entry :=
  { word := [4, 0, 4, 2, 8, 8, 12], weights := [1, 0, 0, 1] }

-- Period 8, original row 3452, representative 4271.
def source61 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B007.Data.entryAt ⟨61, by decide +kernel⟩

def target61 : Weights.Entry :=
  { word := [4, 0, 4, 10, 0, 8, 9], weights := [1, 0, 0, 1] }

-- Period 8, original row 3454, representative 4299.
def source62 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B007.Data.entryAt ⟨89, by decide +kernel⟩

def target62 : Weights.Entry :=
  { word := [4, 0, 4, 10, 0, 8, 12], weights := [1, 0, 0, 1] }

-- Period 8, original row 3466, representative 4296.
def source63 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B007.Data.entryAt ⟨86, by decide +kernel⟩

def target63 : Weights.Entry :=
  { word := [4, 0, 4, 10, 8, 8, 12], weights := [1, 0, 0, 1] }

-- Period 8, original row 3513, representative 4269.
def source64 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B007.Data.entryAt ⟨59, by decide +kernel⟩

def target64 : Weights.Entry :=
  { word := [4, 0, 12, 2, 0, 8, 9], weights := [1, 0, 0, 1] }

-- Period 8, original row 3515, representative 4297.
def source65 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B007.Data.entryAt ⟨87, by decide +kernel⟩

def target65 : Weights.Entry :=
  { word := [4, 0, 12, 2, 0, 8, 12], weights := [1, 0, 0, 1] }

-- Period 8, original row 3523, representative 4294.
def source66 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B007.Data.entryAt ⟨84, by decide +kernel⟩

def target66 : Weights.Entry :=
  { word := [4, 0, 12, 2, 8, 8, 12], weights := [1, 0, 0, 1] }

-- Period 8, original row 3545, representative 4270.
def source67 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B007.Data.entryAt ⟨60, by decide +kernel⟩

def target67 : Weights.Entry :=
  { word := [4, 0, 12, 10, 0, 8, 9], weights := [1, 0, 0, 1] }

-- Period 8, original row 3547, representative 4298.
def source68 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B007.Data.entryAt ⟨88, by decide +kernel⟩

def target68 : Weights.Entry :=
  { word := [4, 0, 12, 10, 0, 8, 12], weights := [1, 0, 0, 1] }

-- Period 8, original row 3559, representative 4295.
def source69 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B007.Data.entryAt ⟨85, by decide +kernel⟩

def target69 : Weights.Entry :=
  { word := [4, 0, 12, 10, 8, 8, 12], weights := [1, 0, 0, 1] }

-- Period 8, original row 3576, representative 4227.
def source70 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B007.Data.entryAt ⟨17, by decide +kernel⟩

def target70 : Weights.Entry :=
  { word := [4, 2, 0, 9, 8, 2, 10], weights := [1, 1, 0, 1] }

-- Period 8, original row 3583, representative 4226.
def source71 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B007.Data.entryAt ⟨16, by decide +kernel⟩

def target71 : Weights.Entry :=
  { word := [4, 2, 0, 9, 8, 10, 10], weights := [1, 1, 0, 1] }

-- Period 8, original row 3588, representative 4225.
def source72 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B007.Data.entryAt ⟨15, by decide +kernel⟩

def target72 : Weights.Entry :=
  { word := [4, 2, 0, 10, 0, 0, 9], weights := [1, 1, 0, 0] }

-- Period 8, original row 3589, representative 4225.
def source73 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B007.Data.entryAt ⟨15, by decide +kernel⟩

def target73 : Weights.Entry :=
  { word := [4, 2, 0, 10, 0, 0, 10], weights := [1, 1, 0, 0] }

def points73 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6), (7, 7)]

-- Period 8, original row 3595, representative 4222.
def source74 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B007.Data.entryAt ⟨12, by decide +kernel⟩

def target74 : Weights.Entry :=
  { word := [4, 2, 0, 10, 0, 8, 9], weights := [1, 0, 0, 1] }

-- Period 8, original row 3605, representative 4229.
def source75 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B007.Data.entryAt ⟨19, by decide +kernel⟩

def target75 : Weights.Entry :=
  { word := [4, 2, 0, 12, 10, 0, 9], weights := [1, 1, 0, 1] }

-- Period 8, original row 3606, representative 4228.
def source76 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B007.Data.entryAt ⟨18, by decide +kernel⟩

def target76 : Weights.Entry :=
  { word := [4, 2, 0, 12, 10, 0, 10], weights := [1, 1, 0, 1] }

-- Period 8, original row 3618, representative 4220.
def source77 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B007.Data.entryAt ⟨10, by decide +kernel⟩

def target77 : Weights.Entry :=
  { word := [4, 2, 8, 2, 0, 8, 9], weights := [1, 0, 0, 1] }

-- Period 8, original row 3619, representative 4223.
def source78 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B007.Data.entryAt ⟨13, by decide +kernel⟩

def target78 : Weights.Entry :=
  { word := [4, 2, 8, 2, 0, 8, 10], weights := [1, 0, 0, 1] }

-- Period 8, original row 3651, representative 4221.
def source79 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B007.Data.entryAt ⟨11, by decide +kernel⟩

def target79 : Weights.Entry :=
  { word := [4, 2, 8, 10, 0, 8, 9], weights := [1, 0, 0, 1] }

-- Period 8, original row 3652, representative 4224.
def source80 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B007.Data.entryAt ⟨14, by decide +kernel⟩

def target80 : Weights.Entry :=
  { word := [4, 2, 8, 10, 0, 8, 10], weights := [1, 0, 0, 1] }

-- Period 8, original row 3734, representative 4280.
def source81 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B007.Data.entryAt ⟨70, by decide +kernel⟩

def target81 : Weights.Entry :=
  { word := [4, 8, 0, 4, 2, 8, 12], weights := [1, 0, 0, 1] }

-- Period 8, original row 3760, representative 4281.
def source82 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B007.Data.entryAt ⟨71, by decide +kernel⟩

def target82 : Weights.Entry :=
  { word := [4, 8, 0, 4, 10, 8, 12], weights := [1, 0, 0, 1] }

-- Period 8, original row 3778, representative 4283.
def source83 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B007.Data.entryAt ⟨73, by decide +kernel⟩

def target83 : Weights.Entry :=
  { word := [4, 8, 0, 12, 2, 8, 12], weights := [1, 0, 1, 0] }

-- Period 8, original row 3803, representative 4282.
def source84 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B007.Data.entryAt ⟨72, by decide +kernel⟩

def target84 : Weights.Entry :=
  { word := [4, 8, 0, 12, 10, 8, 12], weights := [1, 0, 1, 0] }

-- Period 8, original row 3815, representative 4264.
def source85 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B007.Data.entryAt ⟨54, by decide +kernel⟩

def target85 : Weights.Entry :=
  { word := [4, 8, 4, 2, 0, 8, 9], weights := [1, 0, 0, 1] }

-- Period 8, original row 3817, representative 4284.
def source86 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B007.Data.entryAt ⟨74, by decide +kernel⟩

def target86 : Weights.Entry :=
  { word := [4, 8, 4, 2, 0, 8, 12], weights := [1, 0, 0, 1] }

-- Period 8, original row 3825, representative 4285.
def source87 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B007.Data.entryAt ⟨75, by decide +kernel⟩

def target87 : Weights.Entry :=
  { word := [4, 8, 4, 2, 8, 8, 12], weights := [1, 0, 0, 1] }

-- Period 8, original row 3850, representative 4267.
def source88 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B007.Data.entryAt ⟨57, by decide +kernel⟩

def target88 : Weights.Entry :=
  { word := [4, 8, 4, 10, 0, 8, 9], weights := [1, 0, 0, 1] }

-- Period 8, original row 3852, representative 4291.
def source89 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B007.Data.entryAt ⟨81, by decide +kernel⟩

def target89 : Weights.Entry :=
  { word := [4, 8, 4, 10, 0, 8, 12], weights := [1, 0, 0, 1] }

-- Period 8, original row 3859, representative 4288.
def source90 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B007.Data.entryAt ⟨78, by decide +kernel⟩

def target90 : Weights.Entry :=
  { word := [4, 8, 4, 10, 8, 8, 12], weights := [1, 0, 0, 1] }

-- Period 8, original row 3923, representative 4265.
def source91 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B007.Data.entryAt ⟨55, by decide +kernel⟩

def target91 : Weights.Entry :=
  { word := [4, 8, 12, 2, 0, 8, 9], weights := [1, 0, 0, 1] }

-- Period 8, original row 3925, representative 4289.
def source92 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B007.Data.entryAt ⟨79, by decide +kernel⟩

def target92 : Weights.Entry :=
  { word := [4, 8, 12, 2, 0, 8, 12], weights := [1, 0, 0, 1] }

-- Period 8, original row 3933, representative 4286.
def source93 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B007.Data.entryAt ⟨76, by decide +kernel⟩

def target93 : Weights.Entry :=
  { word := [4, 8, 12, 2, 8, 8, 12], weights := [1, 0, 0, 1] }

-- Period 8, original row 3958, representative 4266.
def source94 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B007.Data.entryAt ⟨56, by decide +kernel⟩

def target94 : Weights.Entry :=
  { word := [4, 8, 12, 10, 0, 8, 9], weights := [1, 0, 0, 1] }

-- Period 8, original row 3960, representative 4290.
def source95 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B007.Data.entryAt ⟨80, by decide +kernel⟩

def target95 : Weights.Entry :=
  { word := [4, 8, 12, 10, 0, 8, 12], weights := [1, 0, 0, 1] }

-- Period 8, original row 3967, representative 4287.
def source96 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B007.Data.entryAt ⟨77, by decide +kernel⟩

def target96 : Weights.Entry :=
  { word := [4, 8, 12, 10, 8, 8, 12], weights := [1, 0, 0, 1] }

-- Period 8, original row 3980, representative 4215.
def source97 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B007.Data.entryAt ⟨5, by decide +kernel⟩

def target97 : Weights.Entry :=
  { word := [4, 10, 0, 9, 8, 2, 10], weights := [1, 1, 0, 1] }

-- Period 8, original row 3987, representative 4214.
def source98 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B007.Data.entryAt ⟨4, by decide +kernel⟩

def target98 : Weights.Entry :=
  { word := [4, 10, 0, 9, 8, 10, 10], weights := [1, 1, 0, 1] }

-- Period 8, original row 3996, representative 4219.
def source99 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B007.Data.entryAt ⟨9, by decide +kernel⟩

def target99 : Weights.Entry :=
  { word := [4, 10, 0, 12, 2, 0, 9], weights := [1, 1, 1, 0] }

-- Period 8, original row 3997, representative 4217.
def source100 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B007.Data.entryAt ⟨7, by decide +kernel⟩

def target100 : Weights.Entry :=
  { word := [4, 10, 0, 12, 2, 0, 10], weights := [1, 1, 1, 0] }

-- Period 8, original row 4004, representative 4218.
def source101 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B007.Data.entryAt ⟨8, by decide +kernel⟩

def target101 : Weights.Entry :=
  { word := [4, 10, 0, 12, 10, 0, 9], weights := [1, 1, 1, 0] }

-- Period 8, original row 4005, representative 4216.
def source102 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B007.Data.entryAt ⟨6, by decide +kernel⟩

def target102 : Weights.Entry :=
  { word := [4, 10, 0, 12, 10, 0, 10], weights := [1, 1, 1, 0] }

-- Period 8, original row 4507, representative 4225.
def source103 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B007.Data.entryAt ⟨15, by decide +kernel⟩

def target103 : Weights.Entry :=
  { word := [8, 1, 0, 12, 0, 4, 2], weights := [0, 0, 1, 1] }

def points103 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 4557, representative 4219.
def source104 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B007.Data.entryAt ⟨9, by decide +kernel⟩

def target104 : Weights.Entry :=
  { word := [8, 1, 4, 10, 0, 12, 2], weights := [0, 1, 1, 1] }

def points104 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 4636, representative 4229.
def source105 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B007.Data.entryAt ⟨19, by decide +kernel⟩

def target105 : Weights.Entry :=
  { word := [8, 1, 12, 10, 0, 4, 2], weights := [1, 0, 1, 1] }

def points105 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 4650, representative 4218.
def source106 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B007.Data.entryAt ⟨8, by decide +kernel⟩

def target106 : Weights.Entry :=
  { word := [8, 1, 12, 10, 0, 12, 2], weights := [0, 1, 1, 1] }

def points106 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 4671, representative 4260.
def source107 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B007.Data.entryAt ⟨50, by decide +kernel⟩

def target107 : Weights.Entry :=
  { word := [8, 2, 0, 1, 8, 2, 10], weights := [0, 1, 0, 0] }

-- Period 8, original row 4674, representative 4211.
def source108 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B007.Data.entryAt ⟨1, by decide +kernel⟩

def target108 : Weights.Entry :=
  { word := [8, 2, 0, 1, 8, 8, 12], weights := [0, 1, 0, 0] }

-- Period 8, original row 4678, representative 4258.
def source109 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B007.Data.entryAt ⟨48, by decide +kernel⟩

def target109 : Weights.Entry :=
  { word := [8, 2, 0, 1, 8, 10, 10], weights := [0, 1, 0, 0] }

-- Period 8, original row 4706, representative 4210.
def source110 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B007.Data.entryAt ⟨0, by decide +kernel⟩

def target110 : Weights.Entry :=
  { word := [8, 2, 0, 9, 8, 1, 12], weights := [0, 1, 0, 0] }

-- Period 8, original row 4708, representative 4261.
def source111 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B007.Data.entryAt ⟨51, by decide +kernel⟩

def target111 : Weights.Entry :=
  { word := [8, 2, 0, 9, 8, 2, 10], weights := [0, 1, 0, 0] }

-- Period 8, original row 4714, representative 4212.
def source112 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B007.Data.entryAt ⟨2, by decide +kernel⟩

def target112 : Weights.Entry :=
  { word := [8, 2, 0, 9, 8, 8, 12], weights := [0, 1, 0, 0] }

-- Period 8, original row 4718, representative 4259.
def source113 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B007.Data.entryAt ⟨49, by decide +kernel⟩

def target113 : Weights.Entry :=
  { word := [8, 2, 0, 9, 8, 10, 10], weights := [0, 1, 0, 0] }

-- Period 8, original row 4727, representative 4257.
def source114 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B007.Data.entryAt ⟨47, by decide +kernel⟩

def target114 : Weights.Entry :=
  { word := [8, 2, 0, 10, 0, 0, 10], weights := [0, 1, 0, 0] }

-- Period 8, original row 4747, representative 4263.
def source115 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B007.Data.entryAt ⟨53, by decide +kernel⟩

def target115 : Weights.Entry :=
  { word := [8, 2, 0, 12, 2, 0, 10], weights := [1, 2, 1, 0] }

-- Period 8, original row 4754, representative 4262.
def source116 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B007.Data.entryAt ⟨52, by decide +kernel⟩

def target116 : Weights.Entry :=
  { word := [8, 2, 0, 12, 10, 0, 10], weights := [1, 1, 0, 1] }

-- Period 8, original row 4755, representative 4213.
def source117 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B007.Data.entryAt ⟨3, by decide +kernel⟩

def target117 : Weights.Entry :=
  { word := [8, 2, 0, 12, 10, 0, 12], weights := [1, 1, 0, 1] }

-- Period 8, original row 4767, representative 4249.
def source118 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B007.Data.entryAt ⟨39, by decide +kernel⟩

def target118 : Weights.Entry :=
  { word := [8, 2, 2, 2, 0, 8, 10], weights := [1, 0, 0, 1] }

-- Period 8, original row 4778, representative 4255.
def source119 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B007.Data.entryAt ⟨45, by decide +kernel⟩

def target119 : Weights.Entry :=
  { word := [8, 2, 2, 2, 8, 0, 10], weights := [1, 1, 0, 0] }

-- Period 8, original row 4790, representative 4245.
def source120 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B007.Data.entryAt ⟨35, by decide +kernel⟩

def target120 : Weights.Entry :=
  { word := [8, 2, 2, 2, 8, 8, 10], weights := [1, 0, 0, 1] }

-- Period 8, original row 4806, representative 4252.
def source121 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B007.Data.entryAt ⟨42, by decide +kernel⟩

def target121 : Weights.Entry :=
  { word := [8, 2, 2, 10, 0, 8, 10], weights := [1, 0, 0, 1] }

-- Period 8, original row 4818, representative 4256.
def source122 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B007.Data.entryAt ⟨46, by decide +kernel⟩

def target122 : Weights.Entry :=
  { word := [8, 2, 2, 10, 8, 0, 10], weights := [1, 1, 0, 0] }

-- Period 8, original row 4835, representative 4248.
def source123 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B007.Data.entryAt ⟨38, by decide +kernel⟩

def target123 : Weights.Entry :=
  { word := [8, 2, 2, 10, 8, 8, 10], weights := [1, 0, 0, 1] }

-- Period 8, original row 4857, representative 4253.
def source124 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B007.Data.entryAt ⟨43, by decide +kernel⟩

def target124 : Weights.Entry :=
  { word := [8, 2, 8, 2, 0, 8, 10], weights := [1, 0, 0, 1] }

-- Period 8, original row 4898, representative 4254.
def source125 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B007.Data.entryAt ⟨44, by decide +kernel⟩

def target125 : Weights.Entry :=
  { word := [8, 2, 8, 10, 0, 8, 10], weights := [1, 0, 0, 1] }

-- Period 8, original row 4935, representative 4250.
def source126 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B007.Data.entryAt ⟨40, by decide +kernel⟩

def target126 : Weights.Entry :=
  { word := [8, 2, 10, 2, 0, 8, 10], weights := [1, 0, 0, 1] }

-- Period 8, original row 4951, representative 4246.
def source127 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B007.Data.entryAt ⟨36, by decide +kernel⟩

def target127 : Weights.Entry :=
  { word := [8, 2, 10, 2, 8, 8, 10], weights := [1, 0, 0, 1] }

def period8Entries : List Weights.Entry := [target0, target1, target2, target3, target4, target5, target6, target7, target8, target9, target10, target11, target12, target13, target14, target15, target16, target17, target18, target19, target20, target21, target22, target23, target24, target25, target26, target27, target28, target29, target30, target31, target32, target33, target34, target35, target36, target37, target38, target39, target40, target41, target42, target43, target44, target45, target46, target47, target48, target49, target50, target51, target52, target53, target54, target55, target56, target57, target58, target59, target60, target61, target62, target63, target64, target65, target66, target67, target68, target69, target70, target71, target72, target73, target74, target75, target76, target77, target78, target79, target80, target81, target82, target83, target84, target85, target86, target87, target88, target89, target90, target91, target92, target93, target94, target95, target96, target97, target98, target99, target100, target101, target102, target103, target104, target105, target106, target107, target108, target109, target110, target111, target112, target113, target114, target115, target116, target117, target118, target119, target120, target121, target122, target123, target124, target125, target126, target127]

def period8Chunk : RowCoverage.Chunk where
  rows := [⟨154, target0⟩, ⟨155, target1⟩, ⟨163, target2⟩, ⟨182, target3⟩, ⟨183, target4⟩, ⟨195, target5⟩, ⟨243, target6⟩, ⟨244, target7⟩, ⟨252, target8⟩, ⟨275, target9⟩, ⟨276, target10⟩, ⟨326, target11⟩, ⟨327, target12⟩, ⟨354, target13⟩, ⟨355, target14⟩, ⟨374, target15⟩, ⟨375, target16⟩, ⟨402, target17⟩, ⟨403, target18⟩, ⟨431, target19⟩, ⟨432, target20⟩, ⟨452, target21⟩, ⟨453, target22⟩, ⟨476, target23⟩, ⟨477, target24⟩, ⟨497, target25⟩, ⟨498, target26⟩, ⟨750, target27⟩, ⟨752, target28⟩, ⟨760, target29⟩, ⟨762, target30⟩, ⟨779, target31⟩, ⟨787, target32⟩, ⟨789, target33⟩, ⟨1129, target34⟩, ⟨1135, target35⟩, ⟨1160, target36⟩, ⟨1161, target37⟩, ⟨1186, target38⟩, ⟨1187, target39⟩, ⟨1220, target40⟩, ⟨1221, target41⟩, ⟨1245, target42⟩, ⟨1246, target43⟩, ⟨1266, target44⟩, ⟨1272, target45⟩, ⟨1380, target46⟩, ⟨1381, target47⟩, ⟨1397, target48⟩, ⟨1398, target49⟩, ⟨1414, target50⟩, ⟨1415, target51⟩, ⟨1428, target52⟩, ⟨1429, target53⟩, ⟨1472, target54⟩, ⟨1473, target55⟩, ⟨1496, target56⟩, ⟨1497, target57⟩, ⟨3424, target58⟩, ⟨3426, target59⟩, ⟨3434, target60⟩, ⟨3452, target61⟩, ⟨3454, target62⟩, ⟨3466, target63⟩, ⟨3513, target64⟩, ⟨3515, target65⟩, ⟨3523, target66⟩, ⟨3545, target67⟩, ⟨3547, target68⟩, ⟨3559, target69⟩, ⟨3576, target70⟩, ⟨3583, target71⟩, ⟨3588, target72⟩, ⟨3589, target73⟩, ⟨3595, target74⟩, ⟨3605, target75⟩, ⟨3606, target76⟩, ⟨3618, target77⟩, ⟨3619, target78⟩, ⟨3651, target79⟩, ⟨3652, target80⟩, ⟨3734, target81⟩, ⟨3760, target82⟩, ⟨3778, target83⟩, ⟨3803, target84⟩, ⟨3815, target85⟩, ⟨3817, target86⟩, ⟨3825, target87⟩, ⟨3850, target88⟩, ⟨3852, target89⟩, ⟨3859, target90⟩, ⟨3923, target91⟩, ⟨3925, target92⟩, ⟨3933, target93⟩, ⟨3958, target94⟩, ⟨3960, target95⟩, ⟨3967, target96⟩, ⟨3980, target97⟩, ⟨3987, target98⟩, ⟨3996, target99⟩, ⟨3997, target100⟩, ⟨4004, target101⟩, ⟨4005, target102⟩, ⟨4507, target103⟩, ⟨4557, target104⟩, ⟨4636, target105⟩, ⟨4650, target106⟩, ⟨4671, target107⟩, ⟨4674, target108⟩, ⟨4678, target109⟩, ⟨4706, target110⟩, ⟨4708, target111⟩, ⟨4714, target112⟩, ⟨4718, target113⟩, ⟨4727, target114⟩, ⟨4747, target115⟩, ⟨4754, target116⟩, ⟨4755, target117⟩, ⟨4767, target118⟩, ⟨4778, target119⟩, ⟨4790, target120⟩, ⟨4806, target121⟩, ⟨4818, target122⟩, ⟨4835, target123⟩, ⟨4857, target124⟩, ⟨4898, target125⟩, ⟨4935, target126⟩, ⟨4951, target127⟩]
  indexMask := 250908375796386334954586348619546041002212929609892328592909162875948258638107096377504749214499517108617488797748393810513385449714013408577455369364143503279592894356580337138721800105405007389707142619821960653165442172691105893246184610866639176858519375673902648539409470690134764453177169480520612927893156634265898641564402787954976926885666938277011853783589757925919978569821666862007755990484609600267507592355254927719125826305049687670117875926960358299170493078614962643455456639848623215147372445814893214316148651586809050780928371042699078921891969916820436551438322470490553604647658637821519108710991489044767365805682081660212493317555703887909850270239689928839839835130216124986141699002587318530564722043776453451739376265592332761585036047452120389309025021708711326687799608536684172093606098893230430686859676815740650868576549492139942482297878871778430035454792538806532562615369877370372361813618987775297632063099266279270958619995505692810595515465451000645508090205641620774028799599544828660611030766138599643289563377036466238598910841251870141168817794746290897913352087338500262903503059645184192226283096889232244815722618724429591365367657205283537097154610726278933820306009375296489227261897746100568882826918033810705501861548175038053607440560413308737895857592753056211699336721279329906840756653611175427589454563482761071934952111016911900090853037718053144063771781843150303652860726083196562036928690608972975677069096060134715790037153537327104
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

end FranklSmallCyclic.TransportBatches.G033.B000.Data
