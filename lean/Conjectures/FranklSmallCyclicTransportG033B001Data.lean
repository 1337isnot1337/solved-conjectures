module

public import Conjectures.FranklSmallCyclicRowCoverage
public import Conjectures.FranklSmallCyclicCanonicalWords
public import Conjectures.FranklSmallCyclicOrbit8Block007Data

/-! 128 literal targets sharing one source proof block.
Original words and row indices are retained; weights may be transported.
-/
@[expose] public section

namespace FranklSmallCyclic.TransportBatches.G033.B001.Data

-- Period 8, original row 4968, representative 4251.
def source0 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B007.Data.entryAt ⟨41, by decide +kernel⟩

def target0 : Weights.Entry :=
  { word := [8, 2, 10, 10, 0, 8, 10], weights := [1, 0, 0, 1] }

-- Period 8, original row 4990, representative 4247.
def source1 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B007.Data.entryAt ⟨37, by decide +kernel⟩

def target1 : Weights.Entry :=
  { word := [8, 2, 10, 10, 8, 8, 10], weights := [1, 0, 0, 1] }

-- Period 8, original row 5873, representative 4268.
def source2 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B007.Data.entryAt ⟨58, by decide +kernel⟩

def target2 : Weights.Entry :=
  { word := [8, 9, 0, 4, 2, 0, 2], weights := [1, 0, 0, 1] }

def points2 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 5879, representative 4264.
def source3 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B007.Data.entryAt ⟨54, by decide +kernel⟩

def target3 : Weights.Entry :=
  { word := [8, 9, 0, 4, 2, 8, 2], weights := [1, 0, 0, 1] }

def points3 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 5890, representative 4220.
def source4 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B007.Data.entryAt ⟨10, by decide +kernel⟩

def target4 : Weights.Entry :=
  { word := [8, 9, 0, 4, 8, 4, 2], weights := [1, 0, 0, 1] }

def points4 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 5899, representative 4269.
def source5 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B007.Data.entryAt ⟨59, by decide +kernel⟩

def target5 : Weights.Entry :=
  { word := [8, 9, 0, 4, 10, 0, 2], weights := [1, 0, 0, 1] }

def points5 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 5905, representative 4265.
def source6 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B007.Data.entryAt ⟨55, by decide +kernel⟩

def target6 : Weights.Entry :=
  { word := [8, 9, 0, 4, 10, 8, 2], weights := [1, 0, 0, 1] }

def points6 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 5924, representative 4222.
def source7 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B007.Data.entryAt ⟨12, by decide +kernel⟩

def target7 : Weights.Entry :=
  { word := [8, 9, 0, 12, 0, 4, 2], weights := [1, 0, 0, 1] }

def points7 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 5933, representative 4271.
def source8 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B007.Data.entryAt ⟨61, by decide +kernel⟩

def target8 : Weights.Entry :=
  { word := [8, 9, 0, 12, 2, 0, 2], weights := [1, 0, 0, 1] }

def points8 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 5939, representative 4267.
def source9 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B007.Data.entryAt ⟨57, by decide +kernel⟩

def target9 : Weights.Entry :=
  { word := [8, 9, 0, 12, 2, 8, 2], weights := [1, 0, 0, 1] }

def points9 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 5949, representative 4221.
def source10 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B007.Data.entryAt ⟨11, by decide +kernel⟩

def target10 : Weights.Entry :=
  { word := [8, 9, 0, 12, 8, 4, 2], weights := [1, 0, 0, 1] }

def points10 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 5958, representative 4270.
def source11 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B007.Data.entryAt ⟨60, by decide +kernel⟩

def target11 : Weights.Entry :=
  { word := [8, 9, 0, 12, 10, 0, 2], weights := [1, 0, 0, 1] }

def points11 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 5964, representative 4266.
def source12 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B007.Data.entryAt ⟨56, by decide +kernel⟩

def target12 : Weights.Entry :=
  { word := [8, 9, 0, 12, 10, 8, 2], weights := [1, 0, 0, 1] }

def points12 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 6065, representative 4241.
def source13 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B007.Data.entryAt ⟨31, by decide +kernel⟩

def target13 : Weights.Entry :=
  { word := [8, 10, 0, 1, 8, 2, 10], weights := [0, 1, 0, 0] }

-- Period 8, original row 6072, representative 4239.
def source14 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B007.Data.entryAt ⟨29, by decide +kernel⟩

def target14 : Weights.Entry :=
  { word := [8, 10, 0, 1, 8, 10, 10], weights := [0, 1, 0, 0] }

-- Period 8, original row 6102, representative 4242.
def source15 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B007.Data.entryAt ⟨32, by decide +kernel⟩

def target15 : Weights.Entry :=
  { word := [8, 10, 0, 9, 8, 2, 10], weights := [0, 1, 0, 0] }

-- Period 8, original row 6112, representative 4240.
def source16 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B007.Data.entryAt ⟨30, by decide +kernel⟩

def target16 : Weights.Entry :=
  { word := [8, 10, 0, 9, 8, 10, 10], weights := [0, 1, 0, 0] }

-- Period 8, original row 6121, representative 4238.
def source17 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B007.Data.entryAt ⟨28, by decide +kernel⟩

def target17 : Weights.Entry :=
  { word := [8, 10, 0, 10, 0, 0, 10], weights := [0, 1, 0, 0] }

-- Period 8, original row 6142, representative 4244.
def source18 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B007.Data.entryAt ⟨34, by decide +kernel⟩

def target18 : Weights.Entry :=
  { word := [8, 10, 0, 12, 2, 0, 10], weights := [1, 1, 1, 0] }

-- Period 8, original row 6150, representative 4243.
def source19 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B007.Data.entryAt ⟨33, by decide +kernel⟩

def target19 : Weights.Entry :=
  { word := [8, 10, 0, 12, 10, 0, 10], weights := [1, 1, 1, 0] }

-- Period 8, original row 6158, representative 4236.
def source20 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B007.Data.entryAt ⟨26, by decide +kernel⟩

def target20 : Weights.Entry :=
  { word := [8, 10, 2, 2, 8, 0, 10], weights := [1, 1, 0, 0] }

-- Period 8, original row 6170, representative 4230.
def source21 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B007.Data.entryAt ⟨20, by decide +kernel⟩

def target21 : Weights.Entry :=
  { word := [8, 10, 2, 2, 8, 8, 10], weights := [1, 0, 0, 1] }

-- Period 8, original row 6181, representative 4237.
def source22 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B007.Data.entryAt ⟨27, by decide +kernel⟩

def target22 : Weights.Entry :=
  { word := [8, 10, 2, 10, 8, 0, 10], weights := [1, 1, 0, 0] }

-- Period 8, original row 6198, representative 4233.
def source23 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B007.Data.entryAt ⟨23, by decide +kernel⟩

def target23 : Weights.Entry :=
  { word := [8, 10, 2, 10, 8, 8, 10], weights := [1, 0, 0, 1] }

-- Period 8, original row 6220, representative 4234.
def source24 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B007.Data.entryAt ⟨24, by decide +kernel⟩

def target24 : Weights.Entry :=
  { word := [8, 10, 8, 2, 0, 8, 10], weights := [1, 0, 0, 1] }

-- Period 8, original row 6261, representative 4235.
def source25 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B007.Data.entryAt ⟨25, by decide +kernel⟩

def target25 : Weights.Entry :=
  { word := [8, 10, 8, 10, 0, 8, 10], weights := [1, 0, 0, 1] }

-- Period 8, original row 6298, representative 4231.
def source26 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B007.Data.entryAt ⟨21, by decide +kernel⟩

def target26 : Weights.Entry :=
  { word := [8, 10, 10, 2, 8, 8, 10], weights := [1, 0, 0, 1] }

-- Period 8, original row 6320, representative 4232.
def source27 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B007.Data.entryAt ⟨22, by decide +kernel⟩

def target27 : Weights.Entry :=
  { word := [8, 10, 10, 10, 8, 8, 10], weights := [1, 0, 0, 1] }

-- Period 8, original row 7486, representative 4337.
def source28 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B007.Data.entryAt ⟨126, by decide +kernel⟩

def target28 : Weights.Entry :=
  { word := [10, 0, 8, 4, 4, 12, 0], weights := [1, 0, 0, 1] }

def points28 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 7516, representative 4338.
def source29 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B007.Data.entryAt ⟨127, by decide +kernel⟩

def target29 : Weights.Entry :=
  { word := [10, 0, 8, 12, 4, 12, 0], weights := [0, 0, 1, 1] }

def points29 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 7526, representative 4210.
def source30 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B007.Data.entryAt ⟨0, by decide +kernel⟩

def target30 : Weights.Entry :=
  { word := [10, 0, 9, 8, 1, 4, 8], weights := [0, 0, 1, 0] }

def points30 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 7568, representative 4213.
def source31 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B007.Data.entryAt ⟨3, by decide +kernel⟩

def target31 : Weights.Entry :=
  { word := [10, 0, 12, 10, 0, 4, 8], weights := [1, 0, 1, 1] }

def points31 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 7819, representative 4326.
def source32 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B007.Data.entryAt ⟨116, by decide +kernel⟩

def target32 : Weights.Entry :=
  { word := [10, 8, 0, 4, 2, 0, 1], weights := [1, 0, 0, 1] }

def points32 : List (ℕ × ℕ) := [(0, 2), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1)]

-- Period 8, original row 7820, representative 4292.
def source33 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B007.Data.entryAt ⟨82, by decide +kernel⟩

def target33 : Weights.Entry :=
  { word := [10, 8, 0, 4, 2, 0, 2], weights := [1, 0, 0, 1] }

def points33 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 7826, representative 4284.
def source34 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B007.Data.entryAt ⟨74, by decide +kernel⟩

def target34 : Weights.Entry :=
  { word := [10, 8, 0, 4, 2, 8, 2], weights := [1, 0, 0, 1] }

def points34 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 7831, representative 4326.
def source35 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B007.Data.entryAt ⟨116, by decide +kernel⟩

def target35 : Weights.Entry :=
  { word := [10, 8, 0, 4, 4, 4, 0], weights := [1, 0, 1, 0] }

def points35 : List (ℕ × ℕ) := [(0, 2), (1, 0), (2, 7), (3, 5), (4, 6), (5, 4), (6, 3), (7, 1)]

-- Period 8, original row 7845, representative 4331.
def source36 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B007.Data.entryAt ⟨120, by decide +kernel⟩

def target36 : Weights.Entry :=
  { word := [10, 8, 0, 4, 10, 0, 1], weights := [1, 0, 0, 1] }

def points36 : List (ℕ × ℕ) := [(0, 2), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1)]

-- Period 8, original row 7846, representative 4297.
def source37 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B007.Data.entryAt ⟨87, by decide +kernel⟩

def target37 : Weights.Entry :=
  { word := [10, 8, 0, 4, 10, 0, 2], weights := [1, 0, 0, 1] }

def points37 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 7852, representative 4289.
def source38 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B007.Data.entryAt ⟨79, by decide +kernel⟩

def target38 : Weights.Entry :=
  { word := [10, 8, 0, 4, 10, 8, 2], weights := [1, 0, 0, 1] }

def points38 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 7857, representative 4331.
def source39 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B007.Data.entryAt ⟨120, by decide +kernel⟩

def target39 : Weights.Entry :=
  { word := [10, 8, 0, 4, 12, 4, 0], weights := [1, 0, 1, 0] }

def points39 : List (ℕ × ℕ) := [(0, 2), (1, 0), (2, 7), (3, 5), (4, 6), (5, 4), (6, 3), (7, 1)]

-- Period 8, original row 7871, representative 4333.
def source40 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B007.Data.entryAt ⟨122, by decide +kernel⟩

def target40 : Weights.Entry :=
  { word := [10, 8, 0, 12, 2, 0, 1], weights := [1, 0, 0, 1] }

def points40 : List (ℕ × ℕ) := [(0, 2), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1)]

-- Period 8, original row 7872, representative 4299.
def source41 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B007.Data.entryAt ⟨89, by decide +kernel⟩

def target41 : Weights.Entry :=
  { word := [10, 8, 0, 12, 2, 0, 2], weights := [1, 0, 0, 1] }

def points41 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 7878, representative 4291.
def source42 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B007.Data.entryAt ⟨81, by decide +kernel⟩

def target42 : Weights.Entry :=
  { word := [10, 8, 0, 12, 2, 8, 2], weights := [1, 0, 0, 1] }

def points42 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 7883, representative 4333.
def source43 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B007.Data.entryAt ⟨122, by decide +kernel⟩

def target43 : Weights.Entry :=
  { word := [10, 8, 0, 12, 4, 4, 0], weights := [1, 0, 1, 0] }

def points43 : List (ℕ × ℕ) := [(0, 2), (1, 0), (2, 7), (3, 5), (4, 6), (5, 4), (6, 3), (7, 1)]

-- Period 8, original row 7896, representative 4332.
def source44 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B007.Data.entryAt ⟨121, by decide +kernel⟩

def target44 : Weights.Entry :=
  { word := [10, 8, 0, 12, 10, 0, 1], weights := [1, 0, 0, 1] }

def points44 : List (ℕ × ℕ) := [(0, 2), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1)]

-- Period 8, original row 7897, representative 4298.
def source45 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B007.Data.entryAt ⟨88, by decide +kernel⟩

def target45 : Weights.Entry :=
  { word := [10, 8, 0, 12, 10, 0, 2], weights := [1, 0, 0, 1] }

def points45 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 7903, representative 4290.
def source46 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B007.Data.entryAt ⟨80, by decide +kernel⟩

def target46 : Weights.Entry :=
  { word := [10, 8, 0, 12, 10, 8, 2], weights := [1, 0, 0, 1] }

def points46 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 7908, representative 4332.
def source47 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B007.Data.entryAt ⟨121, by decide +kernel⟩

def target47 : Weights.Entry :=
  { word := [10, 8, 0, 12, 12, 4, 0], weights := [1, 0, 1, 0] }

def points47 : List (ℕ × ℕ) := [(0, 2), (1, 0), (2, 7), (3, 5), (4, 6), (5, 4), (6, 3), (7, 1)]

-- Period 8, original row 7910, representative 4276.
def source48 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B007.Data.entryAt ⟨66, by decide +kernel⟩

def target48 : Weights.Entry :=
  { word := [10, 8, 2, 0, 1, 8, 1], weights := [0, 0, 1, 0] }

def points48 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 7913, representative 4277.
def source49 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B007.Data.entryAt ⟨67, by decide +kernel⟩

def target49 : Weights.Entry :=
  { word := [10, 8, 2, 0, 9, 8, 1], weights := [0, 0, 1, 0] }

def points49 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 7921, representative 4304.
def source50 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B007.Data.entryAt ⟨94, by decide +kernel⟩

def target50 : Weights.Entry :=
  { word := [10, 8, 4, 2, 0, 8, 1], weights := [1, 0, 0, 1] }

def points50 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 7922, representative 4280.
def source51 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B007.Data.entryAt ⟨70, by decide +kernel⟩

def target51 : Weights.Entry :=
  { word := [10, 8, 4, 2, 0, 8, 2], weights := [1, 0, 0, 1] }

def points51 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 7948, representative 4307.
def source52 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B007.Data.entryAt ⟨97, by decide +kernel⟩

def target52 : Weights.Entry :=
  { word := [10, 8, 4, 10, 0, 8, 1], weights := [0, 1, 0, 1] }

def points52 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 7949, representative 4283.
def source53 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B007.Data.entryAt ⟨73, by decide +kernel⟩

def target53 : Weights.Entry :=
  { word := [10, 8, 4, 10, 0, 8, 2], weights := [0, 1, 0, 1] }

def points53 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 7969, representative 4211.
def source54 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B007.Data.entryAt ⟨1, by decide +kernel⟩

def target54 : Weights.Entry :=
  { word := [10, 8, 8, 0, 1, 4, 8], weights := [0, 0, 1, 0] }

def points54 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 7983, representative 4327.
def source55 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B007.Data.entryAt ⟨117, by decide +kernel⟩

def target55 : Weights.Entry :=
  { word := [10, 8, 8, 4, 2, 0, 1], weights := [1, 0, 0, 1] }

def points55 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 7984, representative 4293.
def source56 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B007.Data.entryAt ⟨83, by decide +kernel⟩

def target56 : Weights.Entry :=
  { word := [10, 8, 8, 4, 2, 0, 2], weights := [1, 0, 0, 1] }

def points56 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 7990, representative 4285.
def source57 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B007.Data.entryAt ⟨75, by decide +kernel⟩

def target57 : Weights.Entry :=
  { word := [10, 8, 8, 4, 2, 8, 2], weights := [1, 0, 0, 1] }

def points57 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 7995, representative 4322.
def source58 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B007.Data.entryAt ⟨112, by decide +kernel⟩

def target58 : Weights.Entry :=
  { word := [10, 8, 8, 4, 4, 4, 0], weights := [1, 0, 0, 1] }

def points58 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 7997, representative 4318.
def source59 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B007.Data.entryAt ⟨108, by decide +kernel⟩

def target59 : Weights.Entry :=
  { word := [10, 8, 8, 4, 4, 12, 0], weights := [1, 0, 0, 1] }

def points59 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 8013, representative 4328.
def source60 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B007.Data.entryAt ⟨118, by decide +kernel⟩

def target60 : Weights.Entry :=
  { word := [10, 8, 8, 4, 10, 0, 1], weights := [1, 0, 0, 1] }

def points60 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 8014, representative 4294.
def source61 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B007.Data.entryAt ⟨84, by decide +kernel⟩

def target61 : Weights.Entry :=
  { word := [10, 8, 8, 4, 10, 0, 2], weights := [1, 0, 0, 1] }

def points61 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 8020, representative 4286.
def source62 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B007.Data.entryAt ⟨76, by decide +kernel⟩

def target62 : Weights.Entry :=
  { word := [10, 8, 8, 4, 10, 8, 2], weights := [1, 0, 0, 1] }

def points62 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 8025, representative 4323.
def source63 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B007.Data.entryAt ⟨113, by decide +kernel⟩

def target63 : Weights.Entry :=
  { word := [10, 8, 8, 4, 12, 4, 0], weights := [1, 0, 0, 1] }

def points63 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 8027, representative 4319.
def source64 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B007.Data.entryAt ⟨109, by decide +kernel⟩

def target64 : Weights.Entry :=
  { word := [10, 8, 8, 4, 12, 12, 0], weights := [1, 0, 0, 1] }

def points64 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 8031, representative 4212.
def source65 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B007.Data.entryAt ⟨2, by decide +kernel⟩

def target65 : Weights.Entry :=
  { word := [10, 8, 8, 8, 1, 4, 8], weights := [0, 0, 1, 0] }

def points65 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 8057, representative 4330.
def source66 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B007.Data.entryAt ⟨119, by decide +kernel⟩

def target66 : Weights.Entry :=
  { word := [10, 8, 8, 12, 2, 0, 1], weights := [1, 0, 0, 1] }

def points66 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 8058, representative 4296.
def source67 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B007.Data.entryAt ⟨86, by decide +kernel⟩

def target67 : Weights.Entry :=
  { word := [10, 8, 8, 12, 2, 0, 2], weights := [1, 0, 0, 1] }

def points67 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 8064, representative 4288.
def source68 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B007.Data.entryAt ⟨78, by decide +kernel⟩

def target68 : Weights.Entry :=
  { word := [10, 8, 8, 12, 2, 8, 2], weights := [1, 0, 0, 1] }

def points68 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 8069, representative 4325.
def source69 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B007.Data.entryAt ⟨115, by decide +kernel⟩

def target69 : Weights.Entry :=
  { word := [10, 8, 8, 12, 4, 4, 0], weights := [1, 0, 0, 1] }

def points69 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 8071, representative 4321.
def source70 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B007.Data.entryAt ⟨111, by decide +kernel⟩

def target70 : Weights.Entry :=
  { word := [10, 8, 8, 12, 4, 12, 0], weights := [1, 0, 0, 1] }

def points70 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 8087, representative 4295.
def source71 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B007.Data.entryAt ⟨85, by decide +kernel⟩

def target71 : Weights.Entry :=
  { word := [10, 8, 8, 12, 10, 0, 2], weights := [1, 0, 0, 1] }

def points71 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 8093, representative 4287.
def source72 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B007.Data.entryAt ⟨77, by decide +kernel⟩

def target72 : Weights.Entry :=
  { word := [10, 8, 8, 12, 10, 8, 2], weights := [1, 0, 0, 1] }

def points72 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 8098, representative 4324.
def source73 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B007.Data.entryAt ⟨114, by decide +kernel⟩

def target73 : Weights.Entry :=
  { word := [10, 8, 8, 12, 12, 4, 0], weights := [1, 0, 0, 1] }

def points73 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 8100, representative 4320.
def source74 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B007.Data.entryAt ⟨110, by decide +kernel⟩

def target74 : Weights.Entry :=
  { word := [10, 8, 8, 12, 12, 12, 0], weights := [1, 0, 0, 1] }

def points74 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 8118, representative 4274.
def source75 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B007.Data.entryAt ⟨64, by decide +kernel⟩

def target75 : Weights.Entry :=
  { word := [10, 8, 10, 0, 1, 8, 1], weights := [0, 0, 1, 0] }

def points75 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 8121, representative 4275.
def source76 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B007.Data.entryAt ⟨65, by decide +kernel⟩

def target76 : Weights.Entry :=
  { word := [10, 8, 10, 0, 9, 8, 1], weights := [0, 0, 1, 0] }

def points76 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 8129, representative 4305.
def source77 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B007.Data.entryAt ⟨95, by decide +kernel⟩

def target77 : Weights.Entry :=
  { word := [10, 8, 12, 2, 0, 8, 1], weights := [1, 0, 0, 1] }

def points77 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 8130, representative 4281.
def source78 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B007.Data.entryAt ⟨71, by decide +kernel⟩

def target78 : Weights.Entry :=
  { word := [10, 8, 12, 2, 0, 8, 2], weights := [1, 0, 0, 1] }

def points78 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 8156, representative 4306.
def source79 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B007.Data.entryAt ⟨96, by decide +kernel⟩

def target79 : Weights.Entry :=
  { word := [10, 8, 12, 10, 0, 8, 1], weights := [0, 1, 0, 1] }

def points79 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 8157, representative 4282.
def source80 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B007.Data.entryAt ⟨72, by decide +kernel⟩

def target80 : Weights.Entry :=
  { word := [10, 8, 12, 10, 0, 8, 2], weights := [0, 1, 0, 1] }

def points80 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 8419, representative 4225.
def source81 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B007.Data.entryAt ⟨15, by decide +kernel⟩

def target81 : Weights.Entry :=
  { word := [12, 0, 0, 12, 0, 4, 2], weights := [0, 0, 1, 1] }

def points81 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 7), (3, 5), (4, 6), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 8421, representative 4257.
def source82 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B007.Data.entryAt ⟨47, by decide +kernel⟩

def target82 : Weights.Entry :=
  { word := [12, 0, 0, 12, 0, 4, 8], weights := [0, 0, 1, 0] }

def points82 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 8425, representative 4238.
def source83 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B007.Data.entryAt ⟨28, by decide +kernel⟩

def target83 : Weights.Entry :=
  { word := [12, 0, 0, 12, 0, 12, 8], weights := [0, 0, 1, 0] }

def points83 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 8459, representative 4263.
def source84 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B007.Data.entryAt ⟨53, by decide +kernel⟩

def target84 : Weights.Entry :=
  { word := [12, 0, 4, 10, 0, 4, 8], weights := [0, 1, 2, 1] }

def points84 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 8469, representative 4217.
def source85 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B007.Data.entryAt ⟨7, by decide +kernel⟩

def target85 : Weights.Entry :=
  { word := [12, 0, 4, 10, 0, 12, 2], weights := [0, 1, 1, 1] }

def points85 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 8471, representative 4244.
def source86 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B007.Data.entryAt ⟨34, by decide +kernel⟩

def target86 : Weights.Entry :=
  { word := [12, 0, 4, 10, 0, 12, 8], weights := [0, 1, 1, 1] }

def points86 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 8496, representative 4255.
def source87 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B007.Data.entryAt ⟨45, by decide +kernel⟩

def target87 : Weights.Entry :=
  { word := [12, 0, 8, 4, 4, 4, 8], weights := [0, 0, 1, 1] }

def points87 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 8497, representative 4335.
def source88 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B007.Data.entryAt ⟨124, by decide +kernel⟩

def target88 : Weights.Entry :=
  { word := [12, 0, 8, 4, 4, 12, 0], weights := [0, 0, 1, 1] }

def points88 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 8498, representative 4236.
def source89 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B007.Data.entryAt ⟨26, by decide +kernel⟩

def target89 : Weights.Entry :=
  { word := [12, 0, 8, 4, 4, 12, 8], weights := [0, 0, 1, 1] }

def points89 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 8499, representative 4334.
def source90 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B007.Data.entryAt ⟨123, by decide +kernel⟩

def target90 : Weights.Entry :=
  { word := [12, 0, 8, 8, 4, 6, 0], weights := [0, 1, 1, 0] }

def points90 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 8513, representative 4256.
def source91 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B007.Data.entryAt ⟨46, by decide +kernel⟩

def target91 : Weights.Entry :=
  { word := [12, 0, 8, 12, 4, 4, 8], weights := [0, 0, 1, 1] }

def points91 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 8514, representative 4336.
def source92 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B007.Data.entryAt ⟨125, by decide +kernel⟩

def target92 : Weights.Entry :=
  { word := [12, 0, 8, 12, 4, 12, 0], weights := [0, 0, 1, 1] }

def points92 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 8515, representative 4237.
def source93 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B007.Data.entryAt ⟨27, by decide +kernel⟩

def target93 : Weights.Entry :=
  { word := [12, 0, 8, 12, 4, 12, 8], weights := [0, 0, 1, 1] }

def points93 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 8548, representative 4228.
def source94 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B007.Data.entryAt ⟨18, by decide +kernel⟩

def target94 : Weights.Entry :=
  { word := [12, 0, 12, 10, 0, 4, 2], weights := [1, 0, 1, 1] }

def points94 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 8550, representative 4262.
def source95 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B007.Data.entryAt ⟨52, by decide +kernel⟩

def target95 : Weights.Entry :=
  { word := [12, 0, 12, 10, 0, 4, 8], weights := [1, 0, 1, 1] }

def points95 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 8562, representative 4216.
def source96 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B007.Data.entryAt ⟨6, by decide +kernel⟩

def target96 : Weights.Entry :=
  { word := [12, 0, 12, 10, 0, 12, 2], weights := [0, 1, 1, 1] }

def points96 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 8564, representative 4243.
def source97 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B007.Data.entryAt ⟨33, by decide +kernel⟩

def target97 : Weights.Entry :=
  { word := [12, 0, 12, 10, 0, 12, 8], weights := [0, 1, 1, 1] }

def points97 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 8693, representative 4260.
def source98 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B007.Data.entryAt ⟨50, by decide +kernel⟩

def target98 : Weights.Entry :=
  { word := [12, 4, 8, 0, 1, 4, 8], weights := [0, 0, 1, 0] }

def points98 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 8694, representative 4241.
def source99 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B007.Data.entryAt ⟨31, by decide +kernel⟩

def target99 : Weights.Entry :=
  { word := [12, 4, 8, 0, 1, 12, 8], weights := [0, 0, 1, 0] }

def points99 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 8695, representative 4227.
def source100 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B007.Data.entryAt ⟨17, by decide +kernel⟩

def target100 : Weights.Entry :=
  { word := [12, 4, 8, 8, 1, 4, 2], weights := [1, 0, 1, 1] }

def points100 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 8697, representative 4261.
def source101 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B007.Data.entryAt ⟨51, by decide +kernel⟩

def target101 : Weights.Entry :=
  { word := [12, 4, 8, 8, 1, 4, 8], weights := [0, 0, 1, 0] }

def points101 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 8700, representative 4215.
def source102 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B007.Data.entryAt ⟨5, by decide +kernel⟩

def target102 : Weights.Entry :=
  { word := [12, 4, 8, 8, 1, 12, 2], weights := [1, 0, 1, 1] }

def points102 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 8702, representative 4242.
def source103 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B007.Data.entryAt ⟨32, by decide +kernel⟩

def target103 : Weights.Entry :=
  { word := [12, 4, 8, 8, 1, 12, 8], weights := [0, 0, 1, 0] }

def points103 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 8709, representative 4279.
def source104 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B007.Data.entryAt ⟨69, by decide +kernel⟩

def target104 : Weights.Entry :=
  { word := [12, 4, 8, 8, 4, 6, 0], weights := [0, 1, 1, 0] }

def points104 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 8718, representative 4278.
def source105 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B007.Data.entryAt ⟨68, by decide +kernel⟩

def target105 : Weights.Entry :=
  { word := [12, 4, 8, 8, 12, 6, 0], weights := [0, 1, 1, 0] }

def points105 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 8735, representative 4326.
def source106 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B007.Data.entryAt ⟨116, by decide +kernel⟩

def target106 : Weights.Entry :=
  { word := [12, 8, 0, 4, 2, 0, 1], weights := [1, 0, 0, 1] }

def points106 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 8747, representative 4326.
def source107 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B007.Data.entryAt ⟨116, by decide +kernel⟩

def target107 : Weights.Entry :=
  { word := [12, 8, 0, 4, 4, 4, 0], weights := [1, 0, 1, 0] }

def points107 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 5), (4, 6), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 8748, representative 4249.
def source108 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B007.Data.entryAt ⟨39, by decide +kernel⟩

def target108 : Weights.Entry :=
  { word := [12, 8, 0, 4, 4, 4, 8], weights := [1, 0, 0, 1] }

def points108 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 8753, representative 4223.
def source109 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B007.Data.entryAt ⟨13, by decide +kernel⟩

def target109 : Weights.Entry :=
  { word := [12, 8, 0, 4, 8, 4, 2], weights := [1, 0, 0, 1] }

def points109 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 8755, representative 4253.
def source110 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B007.Data.entryAt ⟨43, by decide +kernel⟩

def target110 : Weights.Entry :=
  { word := [12, 8, 0, 4, 8, 4, 8], weights := [1, 0, 0, 1] }

def points110 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 8759, representative 4234.
def source111 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B007.Data.entryAt ⟨24, by decide +kernel⟩

def target111 : Weights.Entry :=
  { word := [12, 8, 0, 4, 8, 12, 8], weights := [1, 0, 0, 1] }

def points111 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 8761, representative 4331.
def source112 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B007.Data.entryAt ⟨120, by decide +kernel⟩

def target112 : Weights.Entry :=
  { word := [12, 8, 0, 4, 10, 0, 1], weights := [1, 0, 0, 1] }

def points112 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 8773, representative 4331.
def source113 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B007.Data.entryAt ⟨120, by decide +kernel⟩

def target113 : Weights.Entry :=
  { word := [12, 8, 0, 4, 12, 4, 0], weights := [1, 0, 1, 0] }

def points113 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 5), (4, 6), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 8774, representative 4250.
def source114 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B007.Data.entryAt ⟨40, by decide +kernel⟩

def target114 : Weights.Entry :=
  { word := [12, 8, 0, 4, 12, 4, 8], weights := [1, 0, 0, 1] }

def points114 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 8779, representative 4333.
def source115 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B007.Data.entryAt ⟨122, by decide +kernel⟩

def target115 : Weights.Entry :=
  { word := [12, 8, 0, 12, 2, 0, 1], weights := [1, 0, 0, 1] }

def points115 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 8791, representative 4333.
def source116 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B007.Data.entryAt ⟨122, by decide +kernel⟩

def target116 : Weights.Entry :=
  { word := [12, 8, 0, 12, 4, 4, 0], weights := [1, 0, 1, 0] }

def points116 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 5), (4, 6), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 8792, representative 4252.
def source117 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B007.Data.entryAt ⟨42, by decide +kernel⟩

def target117 : Weights.Entry :=
  { word := [12, 8, 0, 12, 4, 4, 8], weights := [1, 0, 0, 1] }

def points117 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 8796, representative 4224.
def source118 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B007.Data.entryAt ⟨14, by decide +kernel⟩

def target118 : Weights.Entry :=
  { word := [12, 8, 0, 12, 8, 4, 2], weights := [1, 0, 0, 1] }

def points118 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 8798, representative 4254.
def source119 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B007.Data.entryAt ⟨44, by decide +kernel⟩

def target119 : Weights.Entry :=
  { word := [12, 8, 0, 12, 8, 4, 8], weights := [1, 0, 0, 1] }

def points119 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 8802, representative 4235.
def source120 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B007.Data.entryAt ⟨25, by decide +kernel⟩

def target120 : Weights.Entry :=
  { word := [12, 8, 0, 12, 8, 12, 8], weights := [1, 0, 0, 1] }

def points120 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 8804, representative 4332.
def source121 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B007.Data.entryAt ⟨121, by decide +kernel⟩

def target121 : Weights.Entry :=
  { word := [12, 8, 0, 12, 10, 0, 1], weights := [1, 0, 0, 1] }

def points121 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 8816, representative 4332.
def source122 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B007.Data.entryAt ⟨121, by decide +kernel⟩

def target122 : Weights.Entry :=
  { word := [12, 8, 0, 12, 12, 4, 0], weights := [1, 0, 1, 0] }

def points122 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 5), (4, 6), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 8817, representative 4251.
def source123 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B007.Data.entryAt ⟨41, by decide +kernel⟩

def target123 : Weights.Entry :=
  { word := [12, 8, 0, 12, 12, 4, 8], weights := [1, 0, 0, 1] }

def points123 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 8823, representative 4300.
def source124 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B007.Data.entryAt ⟨90, by decide +kernel⟩

def target124 : Weights.Entry :=
  { word := [12, 8, 4, 2, 0, 8, 1], weights := [0, 1, 0, 1] }

def points124 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 8858, representative 4303.
def source125 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B007.Data.entryAt ⟨93, by decide +kernel⟩

def target125 : Weights.Entry :=
  { word := [12, 8, 4, 10, 0, 8, 1], weights := [0, 1, 0, 1] }

def points125 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 8893, representative 4314.
def source126 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B007.Data.entryAt ⟨104, by decide +kernel⟩

def target126 : Weights.Entry :=
  { word := [12, 8, 8, 4, 4, 4, 0], weights := [1, 0, 0, 1] }

def points126 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 8894, representative 4245.
def source127 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B007.Data.entryAt ⟨35, by decide +kernel⟩

def target127 : Weights.Entry :=
  { word := [12, 8, 8, 4, 4, 4, 8], weights := [1, 0, 0, 1] }

def points127 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

def period8Entries : List Weights.Entry := [target0, target1, target2, target3, target4, target5, target6, target7, target8, target9, target10, target11, target12, target13, target14, target15, target16, target17, target18, target19, target20, target21, target22, target23, target24, target25, target26, target27, target28, target29, target30, target31, target32, target33, target34, target35, target36, target37, target38, target39, target40, target41, target42, target43, target44, target45, target46, target47, target48, target49, target50, target51, target52, target53, target54, target55, target56, target57, target58, target59, target60, target61, target62, target63, target64, target65, target66, target67, target68, target69, target70, target71, target72, target73, target74, target75, target76, target77, target78, target79, target80, target81, target82, target83, target84, target85, target86, target87, target88, target89, target90, target91, target92, target93, target94, target95, target96, target97, target98, target99, target100, target101, target102, target103, target104, target105, target106, target107, target108, target109, target110, target111, target112, target113, target114, target115, target116, target117, target118, target119, target120, target121, target122, target123, target124, target125, target126, target127]

def period8Chunk : RowCoverage.Chunk where
  rows := [⟨4968, target0⟩, ⟨4990, target1⟩, ⟨5873, target2⟩, ⟨5879, target3⟩, ⟨5890, target4⟩, ⟨5899, target5⟩, ⟨5905, target6⟩, ⟨5924, target7⟩, ⟨5933, target8⟩, ⟨5939, target9⟩, ⟨5949, target10⟩, ⟨5958, target11⟩, ⟨5964, target12⟩, ⟨6065, target13⟩, ⟨6072, target14⟩, ⟨6102, target15⟩, ⟨6112, target16⟩, ⟨6121, target17⟩, ⟨6142, target18⟩, ⟨6150, target19⟩, ⟨6158, target20⟩, ⟨6170, target21⟩, ⟨6181, target22⟩, ⟨6198, target23⟩, ⟨6220, target24⟩, ⟨6261, target25⟩, ⟨6298, target26⟩, ⟨6320, target27⟩, ⟨7486, target28⟩, ⟨7516, target29⟩, ⟨7526, target30⟩, ⟨7568, target31⟩, ⟨7819, target32⟩, ⟨7820, target33⟩, ⟨7826, target34⟩, ⟨7831, target35⟩, ⟨7845, target36⟩, ⟨7846, target37⟩, ⟨7852, target38⟩, ⟨7857, target39⟩, ⟨7871, target40⟩, ⟨7872, target41⟩, ⟨7878, target42⟩, ⟨7883, target43⟩, ⟨7896, target44⟩, ⟨7897, target45⟩, ⟨7903, target46⟩, ⟨7908, target47⟩, ⟨7910, target48⟩, ⟨7913, target49⟩, ⟨7921, target50⟩, ⟨7922, target51⟩, ⟨7948, target52⟩, ⟨7949, target53⟩, ⟨7969, target54⟩, ⟨7983, target55⟩, ⟨7984, target56⟩, ⟨7990, target57⟩, ⟨7995, target58⟩, ⟨7997, target59⟩, ⟨8013, target60⟩, ⟨8014, target61⟩, ⟨8020, target62⟩, ⟨8025, target63⟩, ⟨8027, target64⟩, ⟨8031, target65⟩, ⟨8057, target66⟩, ⟨8058, target67⟩, ⟨8064, target68⟩, ⟨8069, target69⟩, ⟨8071, target70⟩, ⟨8087, target71⟩, ⟨8093, target72⟩, ⟨8098, target73⟩, ⟨8100, target74⟩, ⟨8118, target75⟩, ⟨8121, target76⟩, ⟨8129, target77⟩, ⟨8130, target78⟩, ⟨8156, target79⟩, ⟨8157, target80⟩, ⟨8419, target81⟩, ⟨8421, target82⟩, ⟨8425, target83⟩, ⟨8459, target84⟩, ⟨8469, target85⟩, ⟨8471, target86⟩, ⟨8496, target87⟩, ⟨8497, target88⟩, ⟨8498, target89⟩, ⟨8499, target90⟩, ⟨8513, target91⟩, ⟨8514, target92⟩, ⟨8515, target93⟩, ⟨8548, target94⟩, ⟨8550, target95⟩, ⟨8562, target96⟩, ⟨8564, target97⟩, ⟨8693, target98⟩, ⟨8694, target99⟩, ⟨8695, target100⟩, ⟨8697, target101⟩, ⟨8700, target102⟩, ⟨8702, target103⟩, ⟨8709, target104⟩, ⟨8718, target105⟩, ⟨8735, target106⟩, ⟨8747, target107⟩, ⟨8748, target108⟩, ⟨8753, target109⟩, ⟨8755, target110⟩, ⟨8759, target111⟩, ⟨8761, target112⟩, ⟨8773, target113⟩, ⟨8774, target114⟩, ⟨8779, target115⟩, ⟨8791, target116⟩, ⟨8792, target117⟩, ⟨8796, target118⟩, ⟨8798, target119⟩, ⟨8802, target120⟩, ⟨8804, target121⟩, ⟨8816, target122⟩, ⟨8817, target123⟩, ⟨8823, target124⟩, ⟨8858, target125⟩, ⟨8893, target126⟩, ⟨8894, target127⟩]
  indexMask := 34424900566645829393061535452662501579810741364726835434533741719033431582560296404923702453951250065336834685234891880812945206196804048908564583973818492806814327499643325154909076905683717288038381592766491035156543442146179314441965805841850848695961069466542975554942430119495138545352548843338167362460182879890624050437558178166418717483037623603990825479633809129562509991979089237788873211211798768630426714233823449358589640422134652820797919241206718424003915849047485619361778828551437043359999417122561488883543741358250964442067836251844645928494838371094110454267328488681268365740826389582126143342439616212669603702064535421453353923986760744403413848126458255286547013283195131344876119945373294051301284098181182411008899599437806182568570180908332711807511652209713932701844489405307461355965764077999223646032925344455754423612280560021369939714831524774157852518815167444377137350071569428706394997872980343593803176487289593580124693998818037203564380126273091109204703618602303142436980885790646571295679222610498742374047754081045047853903243858628288277239496588735307746418826763276647972247390427199335388282523660045568893302315478704707855812567213847094567630569856059800470560459074769514468845055077925882834237829722414529060308140768156591837100982140522990630384507056513748648433872559587043861288789116734351734632225757881550285908335342358201880496447240546033325307351205108497106841252742230964465452703354613919828052062223634908410597656993738392373747752091865790676814223875478990477234826194796918345240632523686344280659327184287033668691121401960517381790548310630231325036265498558287234736596204731763790862410652477011574503957850609932813879934438020380427763024188283084191165809031555589968080077685507001511783769060224792223994784594730783385392289895757688384386473395650136822363259196262851908092403845052653816481488234208497298688201710812683492426546568204607300163122644277426524712763884682497262969949227694323047475421680109655926909752579922392679482634735867942758048561356453107510890929527851976783628614943841631012478165582293231417466765818206147151756310635224536327387529812513297999996280326892999063161376690891204794309315676445854949478841044479347408388196878814522920412775960061185101178757387138803345776647794325117991275055539541100167216171875606963710871871702868607194237122523487116887598024622643018574149972811030223146127424763089589382669276648089576234214472298257081597990274015524521690131020145469077594347205993422559596790743811688528126216486729708623180116009811114237891101952823115170038967124862369484350149331699072038156801553699133258367574616424827597000056633655558144
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

end FranklSmallCyclic.TransportBatches.G033.B001.Data
