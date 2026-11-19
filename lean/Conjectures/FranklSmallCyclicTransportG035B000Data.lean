module

public import Conjectures.FranklSmallCyclicRowCoverage
public import Conjectures.FranklSmallCyclicCanonicalWords
public import Conjectures.FranklSmallCyclicOrbit8Block009Data

/-! 128 literal targets sharing one source proof block.
Original words and row indices are retained; weights may be transported.
-/
@[expose] public section

namespace FranklSmallCyclic.TransportBatches.G035.B000.Data

-- Period 8, original row 153, representative 4551.
def source0 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B009.Data.entryAt ⟨83, by decide +kernel⟩

def target0 : Weights.Entry :=
  { word := [0, 1, 4, 2, 0, 8, 9], weights := [1, 0, 0, 1] }

-- Period 8, original row 181, representative 4554.
def source1 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B009.Data.entryAt ⟨86, by decide +kernel⟩

def target1 : Weights.Entry :=
  { word := [0, 1, 4, 10, 0, 8, 9], weights := [1, 0, 0, 1] }

-- Period 8, original row 242, representative 4552.
def source2 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B009.Data.entryAt ⟨84, by decide +kernel⟩

def target2 : Weights.Entry :=
  { word := [0, 1, 12, 2, 0, 8, 9], weights := [1, 0, 0, 1] }

-- Period 8, original row 274, representative 4553.
def source3 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B009.Data.entryAt ⟨85, by decide +kernel⟩

def target3 : Weights.Entry :=
  { word := [0, 1, 12, 10, 0, 8, 9], weights := [1, 0, 0, 1] }

-- Period 8, original row 325, representative 4551.
def source4 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B009.Data.entryAt ⟨83, by decide +kernel⟩

def target4 : Weights.Entry :=
  { word := [0, 2, 2, 2, 0, 8, 9], weights := [0, 1, 0, 1] }

def points4 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6), (7, 7)]

-- Period 8, original row 336, representative 4594.
def source5 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B009.Data.entryAt ⟨126, by decide +kernel⟩

def target5 : Weights.Entry :=
  { word := [0, 2, 2, 2, 8, 0, 9], weights := [1, 1, 0, 0] }

-- Period 8, original row 353, representative 4547.
def source6 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B009.Data.entryAt ⟨79, by decide +kernel⟩

def target6 : Weights.Entry :=
  { word := [0, 2, 2, 2, 8, 8, 9], weights := [1, 0, 0, 1] }

-- Period 8, original row 373, representative 4554.
def source7 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B009.Data.entryAt ⟨86, by decide +kernel⟩

def target7 : Weights.Entry :=
  { word := [0, 2, 2, 10, 0, 8, 9], weights := [0, 1, 0, 1] }

def points7 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6), (7, 7)]

-- Period 8, original row 387, representative 4595.
def source8 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B009.Data.entryAt ⟨127, by decide +kernel⟩

def target8 : Weights.Entry :=
  { word := [0, 2, 2, 10, 8, 0, 9], weights := [1, 1, 0, 0] }

-- Period 8, original row 401, representative 4550.
def source9 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B009.Data.entryAt ⟨82, by decide +kernel⟩

def target9 : Weights.Entry :=
  { word := [0, 2, 2, 10, 8, 8, 9], weights := [0, 1, 1, 0] }

-- Period 8, original row 430, representative 4552.
def source10 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B009.Data.entryAt ⟨84, by decide +kernel⟩

def target10 : Weights.Entry :=
  { word := [0, 2, 10, 2, 0, 8, 9], weights := [0, 1, 0, 1] }

def points10 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6), (7, 7)]

-- Period 8, original row 451, representative 4548.
def source11 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B009.Data.entryAt ⟨80, by decide +kernel⟩

def target11 : Weights.Entry :=
  { word := [0, 2, 10, 2, 8, 8, 9], weights := [1, 0, 0, 1] }

-- Period 8, original row 475, representative 4553.
def source12 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B009.Data.entryAt ⟨85, by decide +kernel⟩

def target12 : Weights.Entry :=
  { word := [0, 2, 10, 10, 0, 8, 9], weights := [0, 1, 0, 1] }

def points12 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6), (7, 7)]

-- Period 8, original row 496, representative 4549.
def source13 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B009.Data.entryAt ⟨81, by decide +kernel⟩

def target13 : Weights.Entry :=
  { word := [0, 2, 10, 10, 8, 8, 9], weights := [0, 1, 1, 0] }

-- Period 8, original row 749, representative 4583.
def source14 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B009.Data.entryAt ⟨115, by decide +kernel⟩

def target14 : Weights.Entry :=
  { word := [0, 6, 2, 8, 8, 0, 9], weights := [0, 1, 1, 0] }

-- Period 8, original row 759, representative 4542.
def source15 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B009.Data.entryAt ⟨74, by decide +kernel⟩

def target15 : Weights.Entry :=
  { word := [0, 6, 2, 8, 8, 8, 9], weights := [0, 1, 1, 0] }

-- Period 8, original row 786, representative 4541.
def source16 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B009.Data.entryAt ⟨73, by decide +kernel⟩

def target16 : Weights.Entry :=
  { word := [0, 6, 10, 8, 8, 8, 9], weights := [0, 1, 1, 0] }

-- Period 8, original row 1154, representative 4590.
def source17 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B009.Data.entryAt ⟨122, by decide +kernel⟩

def target17 : Weights.Entry :=
  { word := [0, 9, 0, 4, 2, 0, 9], weights := [1, 0, 1, 0] }

-- Period 8, original row 1180, representative 4591.
def source18 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B009.Data.entryAt ⟨123, by decide +kernel⟩

def target18 : Weights.Entry :=
  { word := [0, 9, 0, 4, 10, 0, 9], weights := [1, 0, 1, 0] }

-- Period 8, original row 1214, representative 4593.
def source19 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B009.Data.entryAt ⟨125, by decide +kernel⟩

def target19 : Weights.Entry :=
  { word := [0, 9, 0, 12, 2, 0, 9], weights := [1, 0, 1, 0] }

-- Period 8, original row 1239, representative 4592.
def source20 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B009.Data.entryAt ⟨124, by decide +kernel⟩

def target20 : Weights.Entry :=
  { word := [0, 9, 0, 12, 10, 0, 9], weights := [1, 0, 1, 0] }

-- Period 8, original row 1379, representative 4588.
def source21 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B009.Data.entryAt ⟨120, by decide +kernel⟩

def target21 : Weights.Entry :=
  { word := [0, 10, 2, 2, 8, 0, 9], weights := [1, 1, 0, 0] }

-- Period 8, original row 1396, representative 4543.
def source22 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B009.Data.entryAt ⟨75, by decide +kernel⟩

def target22 : Weights.Entry :=
  { word := [0, 10, 2, 2, 8, 8, 9], weights := [1, 0, 0, 1] }

-- Period 8, original row 1413, representative 4589.
def source23 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B009.Data.entryAt ⟨121, by decide +kernel⟩

def target23 : Weights.Entry :=
  { word := [0, 10, 2, 10, 8, 0, 9], weights := [1, 1, 0, 0] }

-- Period 8, original row 1427, representative 4546.
def source24 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B009.Data.entryAt ⟨78, by decide +kernel⟩

def target24 : Weights.Entry :=
  { word := [0, 10, 2, 10, 8, 8, 9], weights := [0, 1, 1, 0] }

-- Period 8, original row 1471, representative 4544.
def source25 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B009.Data.entryAt ⟨76, by decide +kernel⟩

def target25 : Weights.Entry :=
  { word := [0, 10, 10, 2, 8, 8, 9], weights := [1, 0, 0, 1] }

-- Period 8, original row 1495, representative 4545.
def source26 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B009.Data.entryAt ⟨77, by decide +kernel⟩

def target26 : Weights.Entry :=
  { word := [0, 10, 10, 10, 8, 8, 9], weights := [0, 1, 1, 0] }

-- Period 8, original row 3425, representative 4579.
def source27 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B009.Data.entryAt ⟨111, by decide +kernel⟩

def target27 : Weights.Entry :=
  { word := [4, 0, 4, 2, 0, 8, 10], weights := [1, 0, 0, 1] }

-- Period 8, original row 3453, representative 4582.
def source28 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B009.Data.entryAt ⟨114, by decide +kernel⟩

def target28 : Weights.Entry :=
  { word := [4, 0, 4, 10, 0, 8, 10], weights := [1, 0, 0, 1] }

-- Period 8, original row 3514, representative 4580.
def source29 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B009.Data.entryAt ⟨112, by decide +kernel⟩

def target29 : Weights.Entry :=
  { word := [4, 0, 12, 2, 0, 8, 10], weights := [1, 0, 0, 1] }

-- Period 8, original row 3546, representative 4581.
def source30 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B009.Data.entryAt ⟨113, by decide +kernel⟩

def target30 : Weights.Entry :=
  { word := [4, 0, 12, 10, 0, 8, 10], weights := [1, 0, 0, 1] }

-- Period 8, original row 3678, representative 4570.
def source31 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B009.Data.entryAt ⟨102, by decide +kernel⟩

def target31 : Weights.Entry :=
  { word := [4, 4, 4, 8, 8, 2, 10], weights := [0, 1, 1, 0] }

-- Period 8, original row 3680, representative 4562.
def source32 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B009.Data.entryAt ⟨94, by decide +kernel⟩

def target32 : Weights.Entry :=
  { word := [4, 4, 4, 8, 8, 10, 10], weights := [0, 1, 1, 0] }

-- Period 8, original row 3694, representative 4568.
def source33 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B009.Data.entryAt ⟨100, by decide +kernel⟩

def target33 : Weights.Entry :=
  { word := [4, 4, 8, 8, 2, 2, 10], weights := [0, 1, 1, 0] }

-- Period 8, original row 3696, representative 4560.
def source34 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B009.Data.entryAt ⟨92, by decide +kernel⟩

def target34 : Weights.Entry :=
  { word := [4, 4, 8, 8, 2, 10, 10], weights := [0, 1, 1, 0] }

-- Period 8, original row 3703, representative 4567.
def source35 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B009.Data.entryAt ⟨99, by decide +kernel⟩

def target35 : Weights.Entry :=
  { word := [4, 4, 8, 8, 10, 2, 10], weights := [0, 1, 1, 0] }

-- Period 8, original row 3705, representative 4559.
def source36 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B009.Data.entryAt ⟨91, by decide +kernel⟩

def target36 : Weights.Entry :=
  { word := [4, 4, 8, 8, 10, 10, 10], weights := [0, 1, 1, 0] }

-- Period 8, original row 3708, representative 4569.
def source37 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B009.Data.entryAt ⟨101, by decide +kernel⟩

def target37 : Weights.Entry :=
  { word := [4, 4, 12, 8, 8, 2, 10], weights := [0, 1, 1, 0] }

-- Period 8, original row 3710, representative 4561.
def source38 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B009.Data.entryAt ⟨93, by decide +kernel⟩

def target38 : Weights.Entry :=
  { word := [4, 4, 12, 8, 8, 10, 10], weights := [0, 1, 1, 0] }

-- Period 8, original row 3728, representative 4584.
def source39 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B009.Data.entryAt ⟨116, by decide +kernel⟩

def target39 : Weights.Entry :=
  { word := [4, 8, 0, 4, 2, 0, 10], weights := [1, 0, 1, 0] }

-- Period 8, original row 3733, representative 4571.
def source40 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B009.Data.entryAt ⟨103, by decide +kernel⟩

def target40 : Weights.Entry :=
  { word := [4, 8, 0, 4, 2, 8, 10], weights := [1, 0, 1, 0] }

-- Period 8, original row 3754, representative 4585.
def source41 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B009.Data.entryAt ⟨117, by decide +kernel⟩

def target41 : Weights.Entry :=
  { word := [4, 8, 0, 4, 10, 0, 10], weights := [1, 0, 1, 0] }

-- Period 8, original row 3759, representative 4572.
def source42 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B009.Data.entryAt ⟨104, by decide +kernel⟩

def target42 : Weights.Entry :=
  { word := [4, 8, 0, 4, 10, 8, 10], weights := [1, 0, 1, 0] }

-- Period 8, original row 3772, representative 4587.
def source43 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B009.Data.entryAt ⟨119, by decide +kernel⟩

def target43 : Weights.Entry :=
  { word := [4, 8, 0, 12, 2, 0, 10], weights := [1, 0, 1, 0] }

-- Period 8, original row 3777, representative 4574.
def source44 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B009.Data.entryAt ⟨106, by decide +kernel⟩

def target44 : Weights.Entry :=
  { word := [4, 8, 0, 12, 2, 8, 10], weights := [1, 0, 1, 0] }

-- Period 8, original row 3797, representative 4586.
def source45 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B009.Data.entryAt ⟨118, by decide +kernel⟩

def target45 : Weights.Entry :=
  { word := [4, 8, 0, 12, 10, 0, 10], weights := [1, 0, 1, 0] }

-- Period 8, original row 3802, representative 4573.
def source46 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B009.Data.entryAt ⟨105, by decide +kernel⟩

def target46 : Weights.Entry :=
  { word := [4, 8, 0, 12, 10, 8, 10], weights := [1, 0, 1, 0] }

-- Period 8, original row 3816, representative 4575.
def source47 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B009.Data.entryAt ⟨107, by decide +kernel⟩

def target47 : Weights.Entry :=
  { word := [4, 8, 4, 2, 0, 8, 10], weights := [1, 0, 0, 1] }

-- Period 8, original row 3851, representative 4578.
def source48 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B009.Data.entryAt ⟨110, by decide +kernel⟩

def target48 : Weights.Entry :=
  { word := [4, 8, 4, 10, 0, 8, 10], weights := [1, 0, 0, 1] }

-- Period 8, original row 3924, representative 4576.
def source49 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B009.Data.entryAt ⟨108, by decide +kernel⟩

def target49 : Weights.Entry :=
  { word := [4, 8, 12, 2, 0, 8, 10], weights := [1, 0, 0, 1] }

-- Period 8, original row 3959, representative 4577.
def source50 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B009.Data.entryAt ⟨109, by decide +kernel⟩

def target50 : Weights.Entry :=
  { word := [4, 8, 12, 10, 0, 8, 10], weights := [1, 0, 0, 1] }

-- Period 8, original row 4043, representative 4566.
def source51 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B009.Data.entryAt ⟨98, by decide +kernel⟩

def target51 : Weights.Entry :=
  { word := [4, 12, 4, 8, 8, 2, 10], weights := [0, 1, 1, 0] }

-- Period 8, original row 4045, representative 4558.
def source52 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B009.Data.entryAt ⟨90, by decide +kernel⟩

def target52 : Weights.Entry :=
  { word := [4, 12, 4, 8, 8, 10, 10], weights := [0, 1, 1, 0] }

-- Period 8, original row 4059, representative 4564.
def source53 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B009.Data.entryAt ⟨96, by decide +kernel⟩

def target53 : Weights.Entry :=
  { word := [4, 12, 8, 8, 2, 2, 10], weights := [0, 1, 1, 0] }

-- Period 8, original row 4061, representative 4556.
def source54 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B009.Data.entryAt ⟨88, by decide +kernel⟩

def target54 : Weights.Entry :=
  { word := [4, 12, 8, 8, 2, 10, 10], weights := [0, 1, 1, 0] }

-- Period 8, original row 4068, representative 4563.
def source55 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B009.Data.entryAt ⟨95, by decide +kernel⟩

def target55 : Weights.Entry :=
  { word := [4, 12, 8, 8, 10, 2, 10], weights := [0, 1, 1, 0] }

-- Period 8, original row 4070, representative 4555.
def source56 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B009.Data.entryAt ⟨87, by decide +kernel⟩

def target56 : Weights.Entry :=
  { word := [4, 12, 8, 8, 10, 10, 10], weights := [0, 1, 1, 0] }

-- Period 8, original row 4073, representative 4565.
def source57 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B009.Data.entryAt ⟨97, by decide +kernel⟩

def target57 : Weights.Entry :=
  { word := [4, 12, 12, 8, 8, 2, 10], weights := [0, 1, 1, 0] }

-- Period 8, original row 4075, representative 4557.
def source58 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B009.Data.entryAt ⟨89, by decide +kernel⟩

def target58 : Weights.Entry :=
  { word := [4, 12, 12, 8, 8, 10, 10], weights := [0, 1, 1, 0] }

-- Period 8, original row 4129, representative 4483.
def source59 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B009.Data.entryAt ⟨16, by decide +kernel⟩

def target59 : Weights.Entry :=
  { word := [8, 0, 1, 4, 2, 0, 12], weights := [1, 0, 0, 1] }

-- Period 8, original row 4151, representative 4484.
def source60 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B009.Data.entryAt ⟨17, by decide +kernel⟩

def target60 : Weights.Entry :=
  { word := [8, 0, 1, 4, 10, 0, 12], weights := [1, 0, 0, 1] }

-- Period 8, original row 4165, representative 4486.
def source61 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B009.Data.entryAt ⟨19, by decide +kernel⟩

def target61 : Weights.Entry :=
  { word := [8, 0, 1, 12, 2, 0, 12], weights := [1, 0, 1, 0] }

-- Period 8, original row 4187, representative 4485.
def source62 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B009.Data.entryAt ⟨18, by decide +kernel⟩

def target62 : Weights.Entry :=
  { word := [8, 0, 1, 12, 10, 0, 12], weights := [1, 0, 1, 0] }

-- Period 8, original row 4201, representative 4483.
def source63 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B009.Data.entryAt ⟨16, by decide +kernel⟩

def target63 : Weights.Entry :=
  { word := [8, 0, 2, 2, 2, 0, 12], weights := [1, 0, 0, 1] }

def points63 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 5), (5, 4), (6, 6), (7, 7)]

-- Period 8, original row 4216, representative 4484.
def source64 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B009.Data.entryAt ⟨17, by decide +kernel⟩

def target64 : Weights.Entry :=
  { word := [8, 0, 2, 2, 10, 0, 12], weights := [1, 0, 0, 1] }

def points64 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 5), (5, 4), (6, 6), (7, 7)]

-- Period 8, original row 4231, representative 4486.
def source65 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B009.Data.entryAt ⟨19, by decide +kernel⟩

def target65 : Weights.Entry :=
  { word := [8, 0, 2, 10, 2, 0, 12], weights := [1, 1, 0, 0] }

def points65 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 5), (5, 4), (6, 6), (7, 7)]

-- Period 8, original row 4245, representative 4485.
def source66 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B009.Data.entryAt ⟨18, by decide +kernel⟩

def target66 : Weights.Entry :=
  { word := [8, 0, 2, 10, 10, 0, 12], weights := [1, 1, 0, 0] }

def points66 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 5), (5, 4), (6, 6), (7, 7)]

-- Period 8, original row 4509, representative 4538.
def source67 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B009.Data.entryAt ⟨70, by decide +kernel⟩

def target67 : Weights.Entry :=
  { word := [8, 1, 0, 12, 0, 4, 8], weights := [0, 0, 1, 0] }

-- Period 8, original row 4513, representative 4521.
def source68 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B009.Data.entryAt ⟨53, by decide +kernel⟩

def target68 : Weights.Entry :=
  { word := [8, 1, 0, 12, 0, 12, 8], weights := [0, 0, 1, 0] }

-- Period 8, original row 4520, representative 4590.
def source69 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B009.Data.entryAt ⟨122, by decide +kernel⟩

def target69 : Weights.Entry :=
  { word := [8, 1, 4, 2, 0, 8, 1], weights := [0, 1, 0, 1] }

def points69 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 4524, representative 4491.
def source70 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B009.Data.entryAt ⟨24, by decide +kernel⟩

def target70 : Weights.Entry :=
  { word := [8, 1, 4, 2, 0, 8, 9], weights := [1, 0, 0, 1] }

-- Period 8, original row 4547, representative 4540.
def source71 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B009.Data.entryAt ⟨72, by decide +kernel⟩

def target71 : Weights.Entry :=
  { word := [8, 1, 4, 10, 0, 4, 8], weights := [1, 0, 2, 1] }

-- Period 8, original row 4548, representative 4593.
def source72 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B009.Data.entryAt ⟨125, by decide +kernel⟩

def target72 : Weights.Entry :=
  { word := [8, 1, 4, 10, 0, 8, 1], weights := [0, 1, 0, 1] }

def points72 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 4552, representative 4494.
def source73 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B009.Data.entryAt ⟨27, by decide +kernel⟩

def target73 : Weights.Entry :=
  { word := [8, 1, 4, 10, 0, 8, 9], weights := [1, 0, 0, 1] }

-- Period 8, original row 4559, representative 4523.
def source74 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B009.Data.entryAt ⟨55, by decide +kernel⟩

def target74 : Weights.Entry :=
  { word := [8, 1, 4, 10, 0, 12, 8], weights := [1, 0, 1, 1] }

-- Period 8, original row 4583, representative 4594.
def source75 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B009.Data.entryAt ⟨126, by decide +kernel⟩

def target75 : Weights.Entry :=
  { word := [8, 1, 8, 4, 4, 4, 0], weights := [0, 0, 1, 1] }

def points75 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 4584, representative 4536.
def source76 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B009.Data.entryAt ⟨68, by decide +kernel⟩

def target76 : Weights.Entry :=
  { word := [8, 1, 8, 4, 4, 4, 8], weights := [1, 0, 0, 1] }

-- Period 8, original row 4585, representative 4588.
def source77 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B009.Data.entryAt ⟨120, by decide +kernel⟩

def target77 : Weights.Entry :=
  { word := [8, 1, 8, 4, 4, 12, 0], weights := [0, 0, 1, 1] }

def points77 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 4586, representative 4519.
def source78 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B009.Data.entryAt ⟨51, by decide +kernel⟩

def target78 : Weights.Entry :=
  { word := [8, 1, 8, 4, 4, 12, 8], weights := [1, 0, 0, 1] }

-- Period 8, original row 4587, representative 4583.
def source79 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B009.Data.entryAt ⟨115, by decide +kernel⟩

def target79 : Weights.Entry :=
  { word := [8, 1, 8, 8, 4, 6, 0], weights := [0, 1, 1, 0] }

def points79 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 4600, representative 4595.
def source80 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B009.Data.entryAt ⟨127, by decide +kernel⟩

def target80 : Weights.Entry :=
  { word := [8, 1, 8, 12, 4, 4, 0], weights := [0, 0, 1, 1] }

def points80 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 4601, representative 4537.
def source81 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B009.Data.entryAt ⟨69, by decide +kernel⟩

def target81 : Weights.Entry :=
  { word := [8, 1, 8, 12, 4, 4, 8], weights := [1, 0, 0, 1] }

-- Period 8, original row 4602, representative 4589.
def source82 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B009.Data.entryAt ⟨121, by decide +kernel⟩

def target82 : Weights.Entry :=
  { word := [8, 1, 8, 12, 4, 12, 0], weights := [0, 0, 1, 1] }

def points82 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 4603, representative 4520.
def source83 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B009.Data.entryAt ⟨52, by decide +kernel⟩

def target83 : Weights.Entry :=
  { word := [8, 1, 8, 12, 4, 12, 8], weights := [1, 0, 0, 1] }

-- Period 8, original row 4609, representative 4591.
def source84 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B009.Data.entryAt ⟨123, by decide +kernel⟩

def target84 : Weights.Entry :=
  { word := [8, 1, 12, 2, 0, 8, 1], weights := [0, 1, 0, 1] }

def points84 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 4613, representative 4492.
def source85 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B009.Data.entryAt ⟨25, by decide +kernel⟩

def target85 : Weights.Entry :=
  { word := [8, 1, 12, 2, 0, 8, 9], weights := [1, 0, 0, 1] }

-- Period 8, original row 4638, representative 4539.
def source86 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B009.Data.entryAt ⟨71, by decide +kernel⟩

def target86 : Weights.Entry :=
  { word := [8, 1, 12, 10, 0, 4, 8], weights := [1, 0, 1, 1] }

-- Period 8, original row 4641, representative 4592.
def source87 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B009.Data.entryAt ⟨124, by decide +kernel⟩

def target87 : Weights.Entry :=
  { word := [8, 1, 12, 10, 0, 8, 1], weights := [0, 1, 0, 1] }

def points87 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 4645, representative 4493.
def source88 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B009.Data.entryAt ⟨26, by decide +kernel⟩

def target88 : Weights.Entry :=
  { word := [8, 1, 12, 10, 0, 8, 9], weights := [1, 0, 0, 1] }

-- Period 8, original row 4652, representative 4522.
def source89 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B009.Data.entryAt ⟨54, by decide +kernel⟩

def target89 : Weights.Entry :=
  { word := [8, 1, 12, 10, 0, 12, 8], weights := [1, 0, 1, 1] }

-- Period 8, original row 4683, representative 4524.
def source90 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B009.Data.entryAt ⟨56, by decide +kernel⟩

def target90 : Weights.Entry :=
  { word := [8, 2, 0, 2, 0, 8, 9], weights := [1, 2, 0, 1] }

-- Period 8, original row 4726, representative 4538.
def source91 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B009.Data.entryAt ⟨70, by decide +kernel⟩

def target91 : Weights.Entry :=
  { word := [8, 2, 0, 10, 0, 0, 9], weights := [0, 1, 0, 0] }

def points91 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 4733, representative 4535.
def source92 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B009.Data.entryAt ⟨67, by decide +kernel⟩

def target92 : Weights.Entry :=
  { word := [8, 2, 0, 10, 0, 8, 9], weights := [1, 0, 0, 1] }

-- Period 8, original row 4746, representative 4540.
def source93 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B009.Data.entryAt ⟨72, by decide +kernel⟩

def target93 : Weights.Entry :=
  { word := [8, 2, 0, 12, 2, 0, 9], weights := [1, 2, 0, 1] }

def points93 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 4753, representative 4539.
def source94 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B009.Data.entryAt ⟨71, by decide +kernel⟩

def target94 : Weights.Entry :=
  { word := [8, 2, 0, 12, 10, 0, 9], weights := [1, 1, 0, 1] }

def points94 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 4766, representative 4529.
def source95 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B009.Data.entryAt ⟨61, by decide +kernel⟩

def target95 : Weights.Entry :=
  { word := [8, 2, 2, 2, 0, 8, 9], weights := [1, 0, 0, 1] }

-- Period 8, original row 4777, representative 4536.
def source96 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B009.Data.entryAt ⟨68, by decide +kernel⟩

def target96 : Weights.Entry :=
  { word := [8, 2, 2, 2, 8, 0, 9], weights := [1, 0, 0, 1] }

def points96 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 4789, representative 4525.
def source97 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B009.Data.entryAt ⟨57, by decide +kernel⟩

def target97 : Weights.Entry :=
  { word := [8, 2, 2, 2, 8, 8, 9], weights := [1, 0, 0, 1] }

-- Period 8, original row 4805, representative 4532.
def source98 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B009.Data.entryAt ⟨64, by decide +kernel⟩

def target98 : Weights.Entry :=
  { word := [8, 2, 2, 10, 0, 8, 9], weights := [1, 0, 0, 1] }

-- Period 8, original row 4817, representative 4537.
def source99 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B009.Data.entryAt ⟨69, by decide +kernel⟩

def target99 : Weights.Entry :=
  { word := [8, 2, 2, 10, 8, 0, 9], weights := [1, 0, 0, 1] }

def points99 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 4834, representative 4528.
def source100 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B009.Data.entryAt ⟨60, by decide +kernel⟩

def target100 : Weights.Entry :=
  { word := [8, 2, 2, 10, 8, 8, 9], weights := [1, 0, 0, 1] }

-- Period 8, original row 4856, representative 4533.
def source101 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B009.Data.entryAt ⟨65, by decide +kernel⟩

def target101 : Weights.Entry :=
  { word := [8, 2, 8, 2, 0, 8, 9], weights := [1, 0, 0, 1] }

-- Period 8, original row 4897, representative 4534.
def source102 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B009.Data.entryAt ⟨66, by decide +kernel⟩

def target102 : Weights.Entry :=
  { word := [8, 2, 8, 10, 0, 8, 9], weights := [1, 0, 0, 1] }

-- Period 8, original row 4934, representative 4530.
def source103 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B009.Data.entryAt ⟨62, by decide +kernel⟩

def target103 : Weights.Entry :=
  { word := [8, 2, 10, 2, 0, 8, 9], weights := [1, 0, 0, 1] }

-- Period 8, original row 4950, representative 4526.
def source104 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B009.Data.entryAt ⟨58, by decide +kernel⟩

def target104 : Weights.Entry :=
  { word := [8, 2, 10, 2, 8, 8, 9], weights := [1, 0, 0, 1] }

-- Period 8, original row 4967, representative 4531.
def source105 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B009.Data.entryAt ⟨63, by decide +kernel⟩

def target105 : Weights.Entry :=
  { word := [8, 2, 10, 10, 0, 8, 9], weights := [1, 0, 0, 1] }

-- Period 8, original row 4989, representative 4527.
def source106 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B009.Data.entryAt ⟨59, by decide +kernel⟩

def target106 : Weights.Entry :=
  { word := [8, 2, 10, 10, 8, 8, 9], weights := [1, 0, 0, 1] }

-- Period 8, original row 5044, representative 4468.
def source107 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B009.Data.entryAt ⟨1, by decide +kernel⟩

def target107 : Weights.Entry :=
  { word := [8, 4, 0, 12, 2, 0, 12], weights := [1, 0, 1, 0] }

-- Period 8, original row 5102, representative 4469.
def source108 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B009.Data.entryAt ⟨2, by decide +kernel⟩

def target108 : Weights.Entry :=
  { word := [8, 4, 4, 4, 0, 0, 12], weights := [1, 0, 0, 1] }

-- Period 8, original row 5116, representative 4470.
def source109 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B009.Data.entryAt ⟨3, by decide +kernel⟩

def target109 : Weights.Entry :=
  { word := [8, 4, 4, 4, 8, 0, 12], weights := [1, 0, 0, 1] }

-- Period 8, original row 5130, representative 4474.
def source110 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B009.Data.entryAt ⟨7, by decide +kernel⟩

def target110 : Weights.Entry :=
  { word := [8, 4, 4, 12, 0, 0, 12], weights := [1, 0, 1, 0] }

-- Period 8, original row 5144, representative 4473.
def source111 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B009.Data.entryAt ⟨6, by decide +kernel⟩

def target111 : Weights.Entry :=
  { word := [8, 4, 4, 12, 8, 0, 12], weights := [1, 0, 1, 0] }

-- Period 8, original row 5205, representative 4467.
def source112 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B009.Data.entryAt ⟨0, by decide +kernel⟩

def target112 : Weights.Entry :=
  { word := [8, 4, 8, 12, 2, 0, 12], weights := [1, 0, 1, 0] }

-- Period 8, original row 5266, representative 4471.
def source113 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B009.Data.entryAt ⟨4, by decide +kernel⟩

def target113 : Weights.Entry :=
  { word := [8, 4, 12, 4, 8, 0, 12], weights := [1, 0, 0, 1] }

-- Period 8, original row 5287, representative 4472.
def source114 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B009.Data.entryAt ⟨5, by decide +kernel⟩

def target114 : Weights.Entry :=
  { word := [8, 4, 12, 12, 8, 0, 12], weights := [1, 0, 1, 0] }

-- Period 8, original row 5347, representative 4487.
def source115 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B009.Data.entryAt ⟨20, by decide +kernel⟩

def target115 : Weights.Entry :=
  { word := [8, 8, 0, 4, 2, 0, 12], weights := [1, 0, 0, 1] }

-- Period 8, original row 5373, representative 4488.
def source116 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B009.Data.entryAt ⟨21, by decide +kernel⟩

def target116 : Weights.Entry :=
  { word := [8, 8, 0, 4, 10, 0, 12], weights := [1, 0, 0, 1] }

-- Period 8, original row 5411, representative 4490.
def source117 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B009.Data.entryAt ⟨23, by decide +kernel⟩

def target117 : Weights.Entry :=
  { word := [8, 8, 0, 12, 2, 0, 12], weights := [1, 0, 1, 0] }

-- Period 8, original row 5436, representative 4489.
def source118 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B009.Data.entryAt ⟨22, by decide +kernel⟩

def target118 : Weights.Entry :=
  { word := [8, 8, 0, 12, 10, 0, 12], weights := [1, 0, 1, 0] }

-- Period 8, original row 5450, representative 4475.
def source119 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B009.Data.entryAt ⟨8, by decide +kernel⟩

def target119 : Weights.Entry :=
  { word := [8, 8, 1, 4, 2, 0, 12], weights := [1, 0, 0, 1] }

-- Period 8, original row 5472, representative 4476.
def source120 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B009.Data.entryAt ⟨9, by decide +kernel⟩

def target120 : Weights.Entry :=
  { word := [8, 8, 1, 4, 10, 0, 12], weights := [1, 0, 0, 1] }

-- Period 8, original row 5486, representative 4478.
def source121 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B009.Data.entryAt ⟨11, by decide +kernel⟩

def target121 : Weights.Entry :=
  { word := [8, 8, 1, 12, 2, 0, 12], weights := [1, 0, 1, 0] }

-- Period 8, original row 5508, representative 4477.
def source122 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B009.Data.entryAt ⟨10, by decide +kernel⟩

def target122 : Weights.Entry :=
  { word := [8, 8, 1, 12, 10, 0, 12], weights := [1, 0, 1, 0] }

-- Period 8, original row 5522, representative 4479.
def source123 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B009.Data.entryAt ⟨12, by decide +kernel⟩

def target123 : Weights.Entry :=
  { word := [8, 8, 2, 2, 2, 0, 12], weights := [1, 0, 0, 1] }

-- Period 8, original row 5537, representative 4480.
def source124 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B009.Data.entryAt ⟨13, by decide +kernel⟩

def target124 : Weights.Entry :=
  { word := [8, 8, 2, 2, 10, 0, 12], weights := [1, 0, 0, 1] }

-- Period 8, original row 5552, representative 4482.
def source125 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B009.Data.entryAt ⟨15, by decide +kernel⟩

def target125 : Weights.Entry :=
  { word := [8, 8, 2, 10, 2, 0, 12], weights := [1, 1, 0, 0] }

-- Period 8, original row 5566, representative 4481.
def source126 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B009.Data.entryAt ⟨14, by decide +kernel⟩

def target126 : Weights.Entry :=
  { word := [8, 8, 2, 10, 10, 0, 12], weights := [1, 1, 0, 0] }

-- Period 8, original row 5868, representative 4524.
def source127 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B009.Data.entryAt ⟨56, by decide +kernel⟩

def target127 : Weights.Entry :=
  { word := [8, 9, 0, 4, 0, 4, 8], weights := [1, 0, 2, 1] }

def points127 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

def period8Entries : List Weights.Entry := [target0, target1, target2, target3, target4, target5, target6, target7, target8, target9, target10, target11, target12, target13, target14, target15, target16, target17, target18, target19, target20, target21, target22, target23, target24, target25, target26, target27, target28, target29, target30, target31, target32, target33, target34, target35, target36, target37, target38, target39, target40, target41, target42, target43, target44, target45, target46, target47, target48, target49, target50, target51, target52, target53, target54, target55, target56, target57, target58, target59, target60, target61, target62, target63, target64, target65, target66, target67, target68, target69, target70, target71, target72, target73, target74, target75, target76, target77, target78, target79, target80, target81, target82, target83, target84, target85, target86, target87, target88, target89, target90, target91, target92, target93, target94, target95, target96, target97, target98, target99, target100, target101, target102, target103, target104, target105, target106, target107, target108, target109, target110, target111, target112, target113, target114, target115, target116, target117, target118, target119, target120, target121, target122, target123, target124, target125, target126, target127]

def period8Chunk : RowCoverage.Chunk where
  rows := [⟨153, target0⟩, ⟨181, target1⟩, ⟨242, target2⟩, ⟨274, target3⟩, ⟨325, target4⟩, ⟨336, target5⟩, ⟨353, target6⟩, ⟨373, target7⟩, ⟨387, target8⟩, ⟨401, target9⟩, ⟨430, target10⟩, ⟨451, target11⟩, ⟨475, target12⟩, ⟨496, target13⟩, ⟨749, target14⟩, ⟨759, target15⟩, ⟨786, target16⟩, ⟨1154, target17⟩, ⟨1180, target18⟩, ⟨1214, target19⟩, ⟨1239, target20⟩, ⟨1379, target21⟩, ⟨1396, target22⟩, ⟨1413, target23⟩, ⟨1427, target24⟩, ⟨1471, target25⟩, ⟨1495, target26⟩, ⟨3425, target27⟩, ⟨3453, target28⟩, ⟨3514, target29⟩, ⟨3546, target30⟩, ⟨3678, target31⟩, ⟨3680, target32⟩, ⟨3694, target33⟩, ⟨3696, target34⟩, ⟨3703, target35⟩, ⟨3705, target36⟩, ⟨3708, target37⟩, ⟨3710, target38⟩, ⟨3728, target39⟩, ⟨3733, target40⟩, ⟨3754, target41⟩, ⟨3759, target42⟩, ⟨3772, target43⟩, ⟨3777, target44⟩, ⟨3797, target45⟩, ⟨3802, target46⟩, ⟨3816, target47⟩, ⟨3851, target48⟩, ⟨3924, target49⟩, ⟨3959, target50⟩, ⟨4043, target51⟩, ⟨4045, target52⟩, ⟨4059, target53⟩, ⟨4061, target54⟩, ⟨4068, target55⟩, ⟨4070, target56⟩, ⟨4073, target57⟩, ⟨4075, target58⟩, ⟨4129, target59⟩, ⟨4151, target60⟩, ⟨4165, target61⟩, ⟨4187, target62⟩, ⟨4201, target63⟩, ⟨4216, target64⟩, ⟨4231, target65⟩, ⟨4245, target66⟩, ⟨4509, target67⟩, ⟨4513, target68⟩, ⟨4520, target69⟩, ⟨4524, target70⟩, ⟨4547, target71⟩, ⟨4548, target72⟩, ⟨4552, target73⟩, ⟨4559, target74⟩, ⟨4583, target75⟩, ⟨4584, target76⟩, ⟨4585, target77⟩, ⟨4586, target78⟩, ⟨4587, target79⟩, ⟨4600, target80⟩, ⟨4601, target81⟩, ⟨4602, target82⟩, ⟨4603, target83⟩, ⟨4609, target84⟩, ⟨4613, target85⟩, ⟨4638, target86⟩, ⟨4641, target87⟩, ⟨4645, target88⟩, ⟨4652, target89⟩, ⟨4683, target90⟩, ⟨4726, target91⟩, ⟨4733, target92⟩, ⟨4746, target93⟩, ⟨4753, target94⟩, ⟨4766, target95⟩, ⟨4777, target96⟩, ⟨4789, target97⟩, ⟨4805, target98⟩, ⟨4817, target99⟩, ⟨4834, target100⟩, ⟨4856, target101⟩, ⟨4897, target102⟩, ⟨4934, target103⟩, ⟨4950, target104⟩, ⟨4967, target105⟩, ⟨4989, target106⟩, ⟨5044, target107⟩, ⟨5102, target108⟩, ⟨5116, target109⟩, ⟨5130, target110⟩, ⟨5144, target111⟩, ⟨5205, target112⟩, ⟨5266, target113⟩, ⟨5287, target114⟩, ⟨5347, target115⟩, ⟨5373, target116⟩, ⟨5411, target117⟩, ⟨5436, target118⟩, ⟨5450, target119⟩, ⟨5472, target120⟩, ⟨5486, target121⟩, ⟨5508, target122⟩, ⟨5522, target123⟩, ⟨5537, target124⟩, ⟨5552, target125⟩, ⟨5566, target126⟩, ⟨5868, target127⟩]
  indexMask := 277980643692866970829218359744061315366440250959389734575317442785161869276954676455268100665064021063882843412385537079418773873731617087989887361076132311959649915898087994014119196643677338378407869955625658262953660768640455643312606748287419323883103697658617582538795083308092403421161929367337481931169437875562350287244618903886035145214985019712081897942197201147743664207790275717008580028646154089637183013668138746867110240889606441941492869602941527114769825538553857639727120241276836715547669171481372725001421390648242383532584335804259085425933406633535903795926571898610238781858535375378260326420181681540314254305286704927952431610043524024090745901223530102011695455598345235727410716042455805311993665661217979506342906404130472659739666683785741152156738172855662341274824795391519032090287593899874677922667731567246967214252729801393731962101887036892916716521029035019273079337092549522668364610367160960353812638407502202133714727978532354489480185053211252098837730576778095785232518706251482260008129039791128203726483686957759450930482568597805917543858344082261296473274471203630636103889729748654293133714985159584396257557892343397867992534514642045898196608929373528484665819853644985972654483871782579354376858510731244093923242674404180559688076935672636425933463796745924431933704480444345699926635956721483036096278994521042212203030583058085217094158639279264546230729902839779796292774131954113067244426083027956923302549188710017379143927948537648308635947980393757122597123696542526538508052024733809775179119416045823776824336087633194894349315958716158236463206449354149064111517507572828833869961245480078741668017283492096024103245610857939083499977646717409212768167148128747698547205875615452947623289864946031773351936
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

end FranklSmallCyclic.TransportBatches.G035.B000.Data
