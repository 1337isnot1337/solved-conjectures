module

public import Conjectures.FranklSmallCyclicRowCoverage
public import Conjectures.FranklSmallCyclicCanonicalWords
public import Conjectures.FranklSmallCyclicOrbit8Block004Data

/-! 128 literal targets sharing one source proof block.
Original words and row indices are retained; weights may be transported.
-/
@[expose] public section

namespace FranklSmallCyclic.TransportBatches.G030.B001.Data

-- Period 8, original row 6085, representative 3901.
def source0 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B004.Data.entryAt ⟨76, by decide +kernel⟩

def target0 : Weights.Entry :=
  { word := [8, 10, 0, 8, 1, 4, 10], weights := [0, 2, 1, 1] }

-- Period 8, original row 6086, representative 3899.
def source1 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B004.Data.entryAt ⟨74, by decide +kernel⟩

def target1 : Weights.Entry :=
  { word := [8, 10, 0, 8, 1, 4, 12], weights := [0, 2, 1, 1] }

-- Period 8, original row 6091, representative 3895.
def source2 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B004.Data.entryAt ⟨70, by decide +kernel⟩

def target2 : Weights.Entry :=
  { word := [8, 10, 0, 8, 9, 4, 12], weights := [0, 2, 1, 1] }

-- Period 8, original row 6105, representative 3934.
def source3 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B004.Data.entryAt ⟨109, by decide +kernel⟩

def target3 : Weights.Entry :=
  { word := [8, 10, 0, 9, 8, 4, 12], weights := [0, 3, 1, 0] }

-- Period 8, original row 6132, representative 3933.
def source4 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B004.Data.entryAt ⟨108, by decide +kernel⟩

def target4 : Weights.Entry :=
  { word := [8, 10, 0, 10, 8, 4, 12], weights := [0, 2, 0, 1] }

-- Period 8, original row 6190, representative 3910.
def source5 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B004.Data.entryAt ⟨85, by decide +kernel⟩

def target5 : Weights.Entry :=
  { word := [8, 10, 2, 10, 8, 4, 10], weights := [1, 1, 1, 1] }

-- Period 8, original row 6191, representative 3928.
def source6 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B004.Data.entryAt ⟨103, by decide +kernel⟩

def target6 : Weights.Entry :=
  { word := [8, 10, 2, 10, 8, 4, 12], weights := [1, 1, 1, 1] }

-- Period 8, original row 6271, representative 3932.
def source7 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B004.Data.entryAt ⟨107, by decide +kernel⟩

def target7 : Weights.Entry :=
  { word := [8, 10, 8, 10, 8, 4, 12], weights := [0, 2, 0, 1] }

-- Period 8, original row 6312, representative 3909.
def source8 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B004.Data.entryAt ⟨84, by decide +kernel⟩

def target8 : Weights.Entry :=
  { word := [8, 10, 10, 10, 8, 4, 10], weights := [1, 1, 1, 1] }

-- Period 8, original row 6313, representative 3927.
def source9 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B004.Data.entryAt ⟨102, by decide +kernel⟩

def target9 : Weights.Entry :=
  { word := [8, 10, 10, 10, 8, 4, 12], weights := [1, 1, 1, 1] }

-- Period 8, original row 7598, representative 3908.
def source10 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B004.Data.entryAt ⟨83, by decide +kernel⟩

def target10 : Weights.Entry :=
  { word := [10, 2, 0, 9, 0, 4, 0], weights := [0, 1, 1, 0] }

def points10 : List (ℕ × ℕ) := [(0, 2), (1, 0), (2, 7), (3, 5), (4, 6), (5, 4), (6, 3), (7, 1)]

-- Period 8, original row 7599, representative 3900.
def source11 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B004.Data.entryAt ⟨75, by decide +kernel⟩

def target11 : Weights.Entry :=
  { word := [10, 2, 0, 9, 0, 4, 8], weights := [1, 1, 2, 0] }

def points11 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 7601, representative 3907.
def source12 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B004.Data.entryAt ⟨82, by decide +kernel⟩

def target12 : Weights.Entry :=
  { word := [10, 2, 0, 9, 0, 12, 0], weights := [0, 1, 1, 0] }

def points12 : List (ℕ × ℕ) := [(0, 2), (1, 0), (2, 7), (3, 5), (4, 6), (5, 4), (6, 3), (7, 1)]

-- Period 8, original row 7602, representative 3899.
def source13 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B004.Data.entryAt ⟨74, by decide +kernel⟩

def target13 : Weights.Entry :=
  { word := [10, 2, 0, 9, 0, 12, 8], weights := [1, 1, 2, 0] }

def points13 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 7605, representative 3881.
def source14 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B004.Data.entryAt ⟨56, by decide +kernel⟩

def target14 : Weights.Entry :=
  { word := [10, 2, 0, 9, 8, 2, 2], weights := [0, 1, 1, 1] }

def points14 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 7), (3, 4), (4, 6), (5, 5), (6, 3), (7, 0)]

-- Period 8, original row 7612, representative 3878.
def source15 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B004.Data.entryAt ⟨53, by decide +kernel⟩

def target15 : Weights.Entry :=
  { word := [10, 2, 0, 9, 8, 10, 2], weights := [1, 1, 0, 1] }

def points15 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 7614, representative 3908.
def source16 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B004.Data.entryAt ⟨83, by decide +kernel⟩

def target16 : Weights.Entry :=
  { word := [10, 2, 0, 10, 0, 0, 1], weights := [0, 1, 0, 1] }

def points16 : List (ℕ × ℕ) := [(0, 2), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1)]

-- Period 8, original row 7615, representative 3857.
def source17 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B004.Data.entryAt ⟨32, by decide +kernel⟩

def target17 : Weights.Entry :=
  { word := [10, 2, 0, 10, 0, 0, 2], weights := [0, 1, 0, 1] }

def points17 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 7), (3, 4), (4, 6), (5, 5), (6, 3), (7, 0)]

-- Period 8, original row 7622, representative 3907.
def source18 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B004.Data.entryAt ⟨82, by decide +kernel⟩

def target18 : Weights.Entry :=
  { word := [10, 2, 0, 10, 0, 8, 1], weights := [0, 1, 0, 1] }

def points18 : List (ℕ × ℕ) := [(0, 2), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1)]

-- Period 8, original row 7632, representative 3874.
def source19 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B004.Data.entryAt ⟨49, by decide +kernel⟩

def target19 : Weights.Entry :=
  { word := [10, 2, 0, 12, 10, 0, 2], weights := [1, 1, 0, 1] }

def points19 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 7), (3, 4), (4, 6), (5, 5), (6, 3), (7, 0)]

-- Period 8, original row 7639, representative 3894.
def source20 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B004.Data.entryAt ⟨69, by decide +kernel⟩

def target20 : Weights.Entry :=
  { word := [10, 2, 2, 8, 0, 4, 0], weights := [1, 0, 1, 0] }

def points20 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 7641, representative 3892.
def source21 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B004.Data.entryAt ⟨67, by decide +kernel⟩

def target21 : Weights.Entry :=
  { word := [10, 2, 2, 8, 0, 12, 0], weights := [1, 0, 1, 0] }

def points21 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 7643, representative 3865.
def source22 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B004.Data.entryAt ⟨40, by decide +kernel⟩

def target22 : Weights.Entry :=
  { word := [10, 2, 2, 8, 1, 0, 2], weights := [1, 1, 0, 1] }

def points22 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 7653, representative 3893.
def source23 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B004.Data.entryAt ⟨68, by decide +kernel⟩

def target23 : Weights.Entry :=
  { word := [10, 2, 2, 8, 8, 4, 0], weights := [1, 0, 1, 0] }

def points23 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 7655, representative 3891.
def source24 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B004.Data.entryAt ⟨66, by decide +kernel⟩

def target24 : Weights.Entry :=
  { word := [10, 2, 2, 8, 8, 12, 0], weights := [1, 0, 1, 0] }

def points24 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 7657, representative 3864.
def source25 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B004.Data.entryAt ⟨39, by decide +kernel⟩

def target25 : Weights.Entry :=
  { word := [10, 2, 2, 8, 9, 0, 2], weights := [1, 1, 0, 1] }

def points25 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 7673, representative 3905.
def source26 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B004.Data.entryAt ⟨80, by decide +kernel⟩

def target26 : Weights.Entry :=
  { word := [10, 2, 8, 2, 0, 8, 1], weights := [1, 0, 0, 1] }

def points26 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 7674, representative 3855.
def source27 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B004.Data.entryAt ⟨30, by decide +kernel⟩

def target27 : Weights.Entry :=
  { word := [10, 2, 8, 2, 0, 8, 2], weights := [1, 0, 0, 1] }

def points27 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 7692, representative 3942.
def source28 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B004.Data.entryAt ⟨117, by decide +kernel⟩

def target28 : Weights.Entry :=
  { word := [10, 2, 8, 4, 4, 4, 0], weights := [1, 0, 1, 0] }

def points28 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 7693, representative 3938.
def source29 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B004.Data.entryAt ⟨113, by decide +kernel⟩

def target29 : Weights.Entry :=
  { word := [10, 2, 8, 4, 4, 12, 0], weights := [1, 0, 1, 0] }

def points29 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 7694, representative 3943.
def source30 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B004.Data.entryAt ⟨118, by decide +kernel⟩

def target30 : Weights.Entry :=
  { word := [10, 2, 8, 4, 12, 4, 0], weights := [1, 0, 1, 0] }

def points30 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 7695, representative 3939.
def source31 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B004.Data.entryAt ⟨114, by decide +kernel⟩

def target31 : Weights.Entry :=
  { word := [10, 2, 8, 4, 12, 12, 0], weights := [1, 0, 1, 0] }

def points31 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 7696, representative 3950.
def source32 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B004.Data.entryAt ⟨125, by decide +kernel⟩

def target32 : Weights.Entry :=
  { word := [10, 2, 8, 8, 0, 4, 0], weights := [1, 0, 1, 0] }

def points32 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 7698, representative 3949.
def source33 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B004.Data.entryAt ⟨124, by decide +kernel⟩

def target33 : Weights.Entry :=
  { word := [10, 2, 8, 8, 0, 12, 0], weights := [1, 0, 1, 0] }

def points33 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 7699, representative 3937.
def source34 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B004.Data.entryAt ⟨112, by decide +kernel⟩

def target34 : Weights.Entry :=
  { word := [10, 2, 8, 8, 1, 4, 8], weights := [0, 1, 3, 0] }

def points34 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 7700, representative 3934.
def source35 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B004.Data.entryAt ⟨109, by decide +kernel⟩

def target35 : Weights.Entry :=
  { word := [10, 2, 8, 8, 1, 12, 8], weights := [0, 1, 3, 0] }

def points35 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 7701, representative 3898.
def source36 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B004.Data.entryAt ⟨73, by decide +kernel⟩

def target36 : Weights.Entry :=
  { word := [10, 2, 8, 9, 0, 4, 0], weights := [0, 1, 1, 0] }

def points36 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 7702, representative 3896.
def source37 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B004.Data.entryAt ⟨71, by decide +kernel⟩

def target37 : Weights.Entry :=
  { word := [10, 2, 8, 9, 0, 4, 8], weights := [1, 1, 2, 0] }

def points37 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 7704, representative 3897.
def source38 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B004.Data.entryAt ⟨72, by decide +kernel⟩

def target38 : Weights.Entry :=
  { word := [10, 2, 8, 9, 0, 12, 0], weights := [0, 1, 1, 0] }

def points38 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 7705, representative 3895.
def source39 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B004.Data.entryAt ⟨70, by decide +kernel⟩

def target39 : Weights.Entry :=
  { word := [10, 2, 8, 9, 0, 12, 8], weights := [1, 1, 2, 0] }

def points39 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 7708, representative 3877.
def source40 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B004.Data.entryAt ⟨52, by decide +kernel⟩

def target40 : Weights.Entry :=
  { word := [10, 2, 8, 9, 8, 2, 2], weights := [1, 1, 0, 1] }

def points40 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 7715, representative 3876.
def source41 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B004.Data.entryAt ⟨51, by decide +kernel⟩

def target41 : Weights.Entry :=
  { word := [10, 2, 8, 9, 8, 10, 2], weights := [1, 1, 0, 1] }

def points41 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 7721, representative 3947.
def source42 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B004.Data.entryAt ⟨122, by decide +kernel⟩

def target42 : Weights.Entry :=
  { word := [10, 2, 8, 10, 0, 6, 0], weights := [1, 0, 1, 0] }

def points42 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 7723, representative 3906.
def source43 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B004.Data.entryAt ⟨81, by decide +kernel⟩

def target43 : Weights.Entry :=
  { word := [10, 2, 8, 10, 0, 8, 1], weights := [0, 1, 0, 1] }

def points43 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 7724, representative 3856.
def source44 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B004.Data.entryAt ⟨31, by decide +kernel⟩

def target44 : Weights.Entry :=
  { word := [10, 2, 8, 10, 0, 8, 2], weights := [0, 1, 0, 1] }

def points44 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 7734, representative 3948.
def source45 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B004.Data.entryAt ⟨123, by decide +kernel⟩

def target45 : Weights.Entry :=
  { word := [10, 2, 8, 10, 0, 12, 0], weights := [1, 0, 1, 0] }

def points45 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 7739, representative 3946.
def source46 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B004.Data.entryAt ⟨121, by decide +kernel⟩

def target46 : Weights.Entry :=
  { word := [10, 2, 8, 10, 8, 6, 0], weights := [1, 0, 1, 0] }

def points46 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 7740, representative 3931.
def source47 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B004.Data.entryAt ⟨106, by decide +kernel⟩

def target47 : Weights.Entry :=
  { word := [10, 2, 8, 10, 8, 6, 8], weights := [1, 1, 1, 1] }

def points47 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 7745, representative 3936.
def source48 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B004.Data.entryAt ⟨111, by decide +kernel⟩

def target48 : Weights.Entry :=
  { word := [10, 2, 8, 12, 0, 4, 8], weights := [1, 0, 2, 0] }

def points48 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 7746, representative 3933.
def source49 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B004.Data.entryAt ⟨108, by decide +kernel⟩

def target49 : Weights.Entry :=
  { word := [10, 2, 8, 12, 0, 12, 8], weights := [1, 0, 2, 0] }

def points49 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 7748, representative 3871.
def source50 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B004.Data.entryAt ⟨46, by decide +kernel⟩

def target50 : Weights.Entry :=
  { word := [10, 2, 8, 12, 2, 0, 2], weights := [1, 1, 0, 1] }

def points50 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 7754, representative 3869.
def source51 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B004.Data.entryAt ⟨44, by decide +kernel⟩

def target51 : Weights.Entry :=
  { word := [10, 2, 8, 12, 2, 8, 2], weights := [1, 1, 1, 1] }

def points51 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 7757, representative 3945.
def source52 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B004.Data.entryAt ⟨120, by decide +kernel⟩

def target52 : Weights.Entry :=
  { word := [10, 2, 8, 12, 4, 4, 0], weights := [1, 0, 1, 0] }

def points52 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 7758, representative 3930.
def source53 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B004.Data.entryAt ⟨105, by decide +kernel⟩

def target53 : Weights.Entry :=
  { word := [10, 2, 8, 12, 4, 4, 8], weights := [1, 1, 1, 1] }

def points53 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 7759, representative 3941.
def source54 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B004.Data.entryAt ⟨116, by decide +kernel⟩

def target54 : Weights.Entry :=
  { word := [10, 2, 8, 12, 4, 12, 0], weights := [1, 0, 1, 0] }

def points54 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 7760, representative 3928.
def source55 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B004.Data.entryAt ⟨103, by decide +kernel⟩

def target55 : Weights.Entry :=
  { word := [10, 2, 8, 12, 4, 12, 8], weights := [1, 1, 1, 1] }

def points55 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 7761, representative 3935.
def source56 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B004.Data.entryAt ⟨110, by decide +kernel⟩

def target56 : Weights.Entry :=
  { word := [10, 2, 8, 12, 8, 4, 8], weights := [1, 0, 2, 0] }

def points56 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 7762, representative 3932.
def source57 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B004.Data.entryAt ⟨107, by decide +kernel⟩

def target57 : Weights.Entry :=
  { word := [10, 2, 8, 12, 8, 12, 8], weights := [1, 0, 2, 0] }

def points57 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 7764, representative 3870.
def source58 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B004.Data.entryAt ⟨45, by decide +kernel⟩

def target58 : Weights.Entry :=
  { word := [10, 2, 8, 12, 10, 0, 2], weights := [1, 1, 0, 1] }

def points58 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 7770, representative 3868.
def source59 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B004.Data.entryAt ⟨43, by decide +kernel⟩

def target59 : Weights.Entry :=
  { word := [10, 2, 8, 12, 10, 8, 2], weights := [1, 1, 1, 1] }

def points59 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 7775, representative 3944.
def source60 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B004.Data.entryAt ⟨119, by decide +kernel⟩

def target60 : Weights.Entry :=
  { word := [10, 2, 8, 12, 12, 4, 0], weights := [1, 0, 1, 0] }

def points60 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 7776, representative 3929.
def source61 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B004.Data.entryAt ⟨104, by decide +kernel⟩

def target61 : Weights.Entry :=
  { word := [10, 2, 8, 12, 12, 4, 8], weights := [1, 1, 1, 1] }

def points61 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 7777, representative 3940.
def source62 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B004.Data.entryAt ⟨115, by decide +kernel⟩

def target62 : Weights.Entry :=
  { word := [10, 2, 8, 12, 12, 12, 0], weights := [1, 0, 1, 0] }

def points62 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 7778, representative 3927.
def source63 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B004.Data.entryAt ⟨102, by decide +kernel⟩

def target63 : Weights.Entry :=
  { word := [10, 2, 8, 12, 12, 12, 8], weights := [1, 1, 1, 1] }

def points63 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 7779, representative 3890.
def source64 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B004.Data.entryAt ⟨65, by decide +kernel⟩

def target64 : Weights.Entry :=
  { word := [10, 2, 10, 8, 0, 4, 0], weights := [1, 0, 1, 0] }

def points64 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 7781, representative 3888.
def source65 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B004.Data.entryAt ⟨63, by decide +kernel⟩

def target65 : Weights.Entry :=
  { word := [10, 2, 10, 8, 0, 12, 0], weights := [1, 0, 1, 0] }

def points65 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 7783, representative 3861.
def source66 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B004.Data.entryAt ⟨36, by decide +kernel⟩

def target66 : Weights.Entry :=
  { word := [10, 2, 10, 8, 1, 0, 2], weights := [1, 1, 0, 1] }

def points66 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 7789, representative 3952.
def source67 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B004.Data.entryAt ⟨127, by decide +kernel⟩

def target67 : Weights.Entry :=
  { word := [10, 2, 10, 8, 1, 8, 1], weights := [1, 1, 1, 1] }

def points67 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 7793, representative 3889.
def source68 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B004.Data.entryAt ⟨64, by decide +kernel⟩

def target68 : Weights.Entry :=
  { word := [10, 2, 10, 8, 8, 4, 0], weights := [1, 0, 1, 0] }

def points68 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 7795, representative 3887.
def source69 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B004.Data.entryAt ⟨62, by decide +kernel⟩

def target69 : Weights.Entry :=
  { word := [10, 2, 10, 8, 8, 12, 0], weights := [1, 0, 1, 0] }

def points69 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 7797, representative 3860.
def source70 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B004.Data.entryAt ⟨35, by decide +kernel⟩

def target70 : Weights.Entry :=
  { word := [10, 2, 10, 8, 9, 0, 2], weights := [1, 1, 0, 1] }

def points70 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 7803, representative 3951.
def source71 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B004.Data.entryAt ⟨126, by decide +kernel⟩

def target71 : Weights.Entry :=
  { word := [10, 2, 10, 8, 9, 8, 1], weights := [1, 1, 1, 1] }

def points71 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 8409, representative 3875.
def source72 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B004.Data.entryAt ⟨50, by decide +kernel⟩

def target72 : Weights.Entry :=
  { word := [12, 0, 0, 9, 4, 4, 4], weights := [1, 0, 1, 1] }

def points72 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 8411, representative 3848.
def source73 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B004.Data.entryAt ⟨23, by decide +kernel⟩

def target73 : Weights.Entry :=
  { word := [12, 0, 0, 9, 4, 12, 4], weights := [1, 0, 1, 1] }

def points73 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 8413, representative 3874.
def source74 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B004.Data.entryAt ⟨49, by decide +kernel⟩

def target74 : Weights.Entry :=
  { word := [12, 0, 0, 9, 12, 4, 4], weights := [1, 0, 1, 1] }

def points74 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 8415, representative 3847.
def source75 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B004.Data.entryAt ⟨22, by decide +kernel⟩

def target75 : Weights.Entry :=
  { word := [12, 0, 0, 9, 12, 12, 4], weights := [1, 0, 1, 1] }

def points75 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 8420, representative 3857.
def source76 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B004.Data.entryAt ⟨32, by decide +kernel⟩

def target76 : Weights.Entry :=
  { word := [12, 0, 0, 12, 0, 4, 4], weights := [0, 0, 1, 1] }

def points76 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 8424, representative 3838.
def source77 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B004.Data.entryAt ⟨13, by decide +kernel⟩

def target77 : Weights.Entry :=
  { word := [12, 0, 0, 12, 0, 12, 4], weights := [0, 0, 1, 1] }

def points77 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 8470, representative 3852.
def source78 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B004.Data.entryAt ⟨27, by decide +kernel⟩

def target78 : Weights.Entry :=
  { word := [12, 0, 4, 10, 0, 12, 4], weights := [0, 1, 1, 1] }

def points78 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 8475, representative 3881.
def source79 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B004.Data.entryAt ⟨56, by decide +kernel⟩

def target79 : Weights.Entry :=
  { word := [12, 0, 4, 10, 8, 4, 4], weights := [0, 1, 1, 1] }

def points79 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 8480, representative 3851.
def source80 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B004.Data.entryAt ⟨26, by decide +kernel⟩

def target80 : Weights.Entry :=
  { word := [12, 0, 4, 10, 8, 12, 4], weights := [0, 1, 1, 1] }

def points80 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 8500, representative 3873.
def source81 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B004.Data.entryAt ⟨48, by decide +kernel⟩

def target81 : Weights.Entry :=
  { word := [12, 0, 8, 9, 4, 4, 4], weights := [1, 0, 1, 1] }

def points81 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 8502, representative 3846.
def source82 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B004.Data.entryAt ⟨21, by decide +kernel⟩

def target82 : Weights.Entry :=
  { word := [12, 0, 8, 9, 4, 12, 4], weights := [1, 0, 1, 1] }

def points82 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 8504, representative 3872.
def source83 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B004.Data.entryAt ⟨47, by decide +kernel⟩

def target83 : Weights.Entry :=
  { word := [12, 0, 8, 9, 12, 4, 4], weights := [1, 0, 1, 1] }

def points83 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 8506, representative 3845.
def source84 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B004.Data.entryAt ⟨20, by decide +kernel⟩

def target84 : Weights.Entry :=
  { word := [12, 0, 8, 9, 12, 12, 4], weights := [1, 0, 1, 1] }

def points84 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 8549, representative 3880.
def source85 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B004.Data.entryAt ⟨55, by decide +kernel⟩

def target85 : Weights.Entry :=
  { word := [12, 0, 12, 10, 0, 4, 4], weights := [1, 0, 1, 1] }

def points85 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 8563, representative 3850.
def source86 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B004.Data.entryAt ⟨25, by decide +kernel⟩

def target86 : Weights.Entry :=
  { word := [12, 0, 12, 10, 0, 12, 4], weights := [0, 1, 1, 1] }

def points86 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 8568, representative 3879.
def source87 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B004.Data.entryAt ⟨54, by decide +kernel⟩

def target87 : Weights.Entry :=
  { word := [12, 0, 12, 10, 8, 4, 4], weights := [0, 1, 1, 1] }

def points87 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 8573, representative 3849.
def source88 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B004.Data.entryAt ⟨24, by decide +kernel⟩

def target88 : Weights.Entry :=
  { word := [12, 0, 12, 10, 8, 12, 4], weights := [0, 1, 1, 1] }

def points88 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 8580, representative 3908.
def source89 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B004.Data.entryAt ⟨83, by decide +kernel⟩

def target89 : Weights.Entry :=
  { word := [12, 2, 0, 9, 0, 4, 0], weights := [0, 1, 1, 0] }

def points89 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 5), (4, 6), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 8581, representative 3902.
def source90 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B004.Data.entryAt ⟨77, by decide +kernel⟩

def target90 : Weights.Entry :=
  { word := [12, 2, 0, 9, 0, 4, 8], weights := [1, 1, 2, 0] }

def points90 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 8583, representative 3907.
def source91 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B004.Data.entryAt ⟨82, by decide +kernel⟩

def target91 : Weights.Entry :=
  { word := [12, 2, 0, 9, 0, 12, 0], weights := [0, 1, 1, 0] }

def points91 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 5), (4, 6), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 8584, representative 3901.
def source92 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B004.Data.entryAt ⟨76, by decide +kernel⟩

def target92 : Weights.Entry :=
  { word := [12, 2, 0, 9, 0, 12, 8], weights := [1, 1, 2, 0] }

def points92 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 8585, representative 3834.
def source93 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B004.Data.entryAt ⟨9, by decide +kernel⟩

def target93 : Weights.Entry :=
  { word := [12, 2, 0, 9, 8, 1, 4], weights := [1, 1, 0, 1] }

def points93 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 8589, representative 3835.
def source94 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B004.Data.entryAt ⟨10, by decide +kernel⟩

def target94 : Weights.Entry :=
  { word := [12, 2, 0, 9, 8, 8, 4], weights := [1, 1, 0, 1] }

def points94 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 8592, representative 3833.
def source95 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B004.Data.entryAt ⟨8, by decide +kernel⟩

def target95 : Weights.Entry :=
  { word := [12, 2, 0, 9, 8, 9, 4], weights := [1, 1, 0, 1] }

def points95 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 8596, representative 3908.
def source96 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B004.Data.entryAt ⟨83, by decide +kernel⟩

def target96 : Weights.Entry :=
  { word := [12, 2, 0, 10, 0, 0, 1], weights := [0, 1, 0, 1] }

def points96 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 8600, representative 3885.
def source97 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B004.Data.entryAt ⟨60, by decide +kernel⟩

def target97 : Weights.Entry :=
  { word := [12, 2, 0, 10, 0, 0, 9], weights := [0, 1, 0, 1] }

def points97 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 8604, representative 3907.
def source98 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B004.Data.entryAt ⟨82, by decide +kernel⟩

def target98 : Weights.Entry :=
  { word := [12, 2, 0, 10, 0, 8, 1], weights := [0, 1, 0, 1] }

def points98 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 8605, representative 3831.
def source99 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B004.Data.entryAt ⟨6, by decide +kernel⟩

def target99 : Weights.Entry :=
  { word := [12, 2, 0, 10, 0, 8, 4], weights := [0, 1, 0, 1] }

def points99 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 8607, representative 3884.
def source100 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B004.Data.entryAt ⟨59, by decide +kernel⟩

def target100 : Weights.Entry :=
  { word := [12, 2, 0, 10, 0, 8, 9], weights := [0, 1, 0, 1] }

def points100 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 8609, representative 3832.
def source101 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B004.Data.entryAt ⟨7, by decide +kernel⟩

def target101 : Weights.Entry :=
  { word := [12, 2, 0, 10, 8, 0, 4], weights := [0, 1, 0, 1] }

def points101 : List (ℕ × ℕ) := [(0, 1), (1, 2), (2, 7), (3, 4), (4, 5), (5, 6), (6, 3), (7, 0)]

-- Period 8, original row 8611, representative 3830.
def source102 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B004.Data.entryAt ⟨5, by decide +kernel⟩

def target102 : Weights.Entry :=
  { word := [12, 2, 0, 10, 8, 8, 4], weights := [0, 1, 0, 1] }

def points102 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 8615, representative 3834.
def source103 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B004.Data.entryAt ⟨9, by decide +kernel⟩

def target103 : Weights.Entry :=
  { word := [12, 2, 0, 12, 10, 0, 4], weights := [1, 1, 0, 1] }

def points103 : List (ℕ × ℕ) := [(0, 1), (1, 2), (2, 7), (3, 4), (4, 5), (5, 6), (6, 3), (7, 0)]

-- Period 8, original row 8617, representative 3886.
def source104 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B004.Data.entryAt ⟨61, by decide +kernel⟩

def target104 : Weights.Entry :=
  { word := [12, 2, 0, 12, 10, 0, 9], weights := [1, 1, 0, 1] }

def points104 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 8626, representative 3903.
def source105 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B004.Data.entryAt ⟨78, by decide +kernel⟩

def target105 : Weights.Entry :=
  { word := [12, 2, 8, 2, 0, 8, 1], weights := [0, 1, 0, 1] }

def points105 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 8628, representative 3826.
def source106 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B004.Data.entryAt ⟨1, by decide +kernel⟩

def target106 : Weights.Entry :=
  { word := [12, 2, 8, 2, 0, 8, 4], weights := [0, 1, 0, 1] }

def points106 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 8630, representative 3882.
def source107 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B004.Data.entryAt ⟨57, by decide +kernel⟩

def target107 : Weights.Entry :=
  { word := [12, 2, 8, 2, 0, 8, 9], weights := [0, 1, 0, 1] }

def points107 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 8639, representative 3827.
def source108 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B004.Data.entryAt ⟨2, by decide +kernel⟩

def target108 : Weights.Entry :=
  { word := [12, 2, 8, 2, 8, 8, 4], weights := [0, 1, 0, 1] }

def points108 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 8643, representative 3920.
def source109 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B004.Data.entryAt ⟨95, by decide +kernel⟩

def target109 : Weights.Entry :=
  { word := [12, 2, 8, 4, 4, 4, 0], weights := [1, 0, 1, 0] }

def points109 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 8644, representative 3916.
def source110 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B004.Data.entryAt ⟨91, by decide +kernel⟩

def target110 : Weights.Entry :=
  { word := [12, 2, 8, 4, 4, 12, 0], weights := [1, 0, 1, 0] }

def points110 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 8645, representative 3921.
def source111 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B004.Data.entryAt ⟨96, by decide +kernel⟩

def target111 : Weights.Entry :=
  { word := [12, 2, 8, 4, 12, 4, 0], weights := [1, 0, 1, 0] }

def points111 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 8646, representative 3917.
def source112 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B004.Data.entryAt ⟨92, by decide +kernel⟩

def target112 : Weights.Entry :=
  { word := [12, 2, 8, 4, 12, 12, 0], weights := [1, 0, 1, 0] }

def points112 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 8648, representative 3915.
def source113 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B004.Data.entryAt ⟨90, by decide +kernel⟩

def target113 : Weights.Entry :=
  { word := [12, 2, 8, 8, 4, 6, 0], weights := [0, 1, 1, 0] }

def points113 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 8651, representative 3914.
def source114 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B004.Data.entryAt ⟨89, by decide +kernel⟩

def target114 : Weights.Entry :=
  { word := [12, 2, 8, 8, 12, 6, 0], weights := [0, 1, 1, 0] }

def points114 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 8657, representative 3925.
def source115 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B004.Data.entryAt ⟨100, by decide +kernel⟩

def target115 : Weights.Entry :=
  { word := [12, 2, 8, 10, 0, 6, 0], weights := [0, 1, 1, 0] }

def points115 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 8659, representative 3904.
def source116 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B004.Data.entryAt ⟨79, by decide +kernel⟩

def target116 : Weights.Entry :=
  { word := [12, 2, 8, 10, 0, 8, 1], weights := [0, 1, 0, 1] }

def points116 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 8661, representative 3829.
def source117 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B004.Data.entryAt ⟨4, by decide +kernel⟩

def target117 : Weights.Entry :=
  { word := [12, 2, 8, 10, 0, 8, 4], weights := [0, 1, 0, 1] }

def points117 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 8663, representative 3883.
def source118 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B004.Data.entryAt ⟨58, by decide +kernel⟩

def target118 : Weights.Entry :=
  { word := [12, 2, 8, 10, 0, 8, 9], weights := [0, 1, 0, 1] }

def points118 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 8670, representative 3926.
def source119 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B004.Data.entryAt ⟨101, by decide +kernel⟩

def target119 : Weights.Entry :=
  { word := [12, 2, 8, 10, 0, 12, 0], weights := [0, 1, 1, 0] }

def points119 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 8673, representative 3924.
def source120 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B004.Data.entryAt ⟨99, by decide +kernel⟩

def target120 : Weights.Entry :=
  { word := [12, 2, 8, 10, 8, 6, 0], weights := [0, 1, 1, 0] }

def points120 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 8674, representative 3913.
def source121 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B004.Data.entryAt ⟨88, by decide +kernel⟩

def target121 : Weights.Entry :=
  { word := [12, 2, 8, 10, 8, 6, 8], weights := [1, 1, 1, 1] }

def points121 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 8675, representative 3828.
def source122 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B004.Data.entryAt ⟨3, by decide +kernel⟩

def target122 : Weights.Entry :=
  { word := [12, 2, 8, 10, 8, 8, 4], weights := [0, 1, 0, 1] }

def points122 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 8679, representative 3825.
def source123 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B004.Data.entryAt ⟨0, by decide +kernel⟩

def target123 : Weights.Entry :=
  { word := [12, 2, 8, 10, 8, 12, 4], weights := [1, 2, 1, 2] }

def points123 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 8681, representative 3923.
def source124 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B004.Data.entryAt ⟨98, by decide +kernel⟩

def target124 : Weights.Entry :=
  { word := [12, 2, 8, 12, 4, 4, 0], weights := [0, 1, 1, 0] }

def points124 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 8682, representative 3912.
def source125 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B004.Data.entryAt ⟨87, by decide +kernel⟩

def target125 : Weights.Entry :=
  { word := [12, 2, 8, 12, 4, 4, 8], weights := [1, 1, 1, 1] }

def points125 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 8683, representative 3919.
def source126 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B004.Data.entryAt ⟨94, by decide +kernel⟩

def target126 : Weights.Entry :=
  { word := [12, 2, 8, 12, 4, 12, 0], weights := [0, 1, 1, 0] }

def points126 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 8684, representative 3910.
def source127 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B004.Data.entryAt ⟨85, by decide +kernel⟩

def target127 : Weights.Entry :=
  { word := [12, 2, 8, 12, 4, 12, 8], weights := [1, 1, 1, 1] }

def points127 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

def period8Entries : List Weights.Entry := [target0, target1, target2, target3, target4, target5, target6, target7, target8, target9, target10, target11, target12, target13, target14, target15, target16, target17, target18, target19, target20, target21, target22, target23, target24, target25, target26, target27, target28, target29, target30, target31, target32, target33, target34, target35, target36, target37, target38, target39, target40, target41, target42, target43, target44, target45, target46, target47, target48, target49, target50, target51, target52, target53, target54, target55, target56, target57, target58, target59, target60, target61, target62, target63, target64, target65, target66, target67, target68, target69, target70, target71, target72, target73, target74, target75, target76, target77, target78, target79, target80, target81, target82, target83, target84, target85, target86, target87, target88, target89, target90, target91, target92, target93, target94, target95, target96, target97, target98, target99, target100, target101, target102, target103, target104, target105, target106, target107, target108, target109, target110, target111, target112, target113, target114, target115, target116, target117, target118, target119, target120, target121, target122, target123, target124, target125, target126, target127]

def period8Chunk : RowCoverage.Chunk where
  rows := [⟨6085, target0⟩, ⟨6086, target1⟩, ⟨6091, target2⟩, ⟨6105, target3⟩, ⟨6132, target4⟩, ⟨6190, target5⟩, ⟨6191, target6⟩, ⟨6271, target7⟩, ⟨6312, target8⟩, ⟨6313, target9⟩, ⟨7598, target10⟩, ⟨7599, target11⟩, ⟨7601, target12⟩, ⟨7602, target13⟩, ⟨7605, target14⟩, ⟨7612, target15⟩, ⟨7614, target16⟩, ⟨7615, target17⟩, ⟨7622, target18⟩, ⟨7632, target19⟩, ⟨7639, target20⟩, ⟨7641, target21⟩, ⟨7643, target22⟩, ⟨7653, target23⟩, ⟨7655, target24⟩, ⟨7657, target25⟩, ⟨7673, target26⟩, ⟨7674, target27⟩, ⟨7692, target28⟩, ⟨7693, target29⟩, ⟨7694, target30⟩, ⟨7695, target31⟩, ⟨7696, target32⟩, ⟨7698, target33⟩, ⟨7699, target34⟩, ⟨7700, target35⟩, ⟨7701, target36⟩, ⟨7702, target37⟩, ⟨7704, target38⟩, ⟨7705, target39⟩, ⟨7708, target40⟩, ⟨7715, target41⟩, ⟨7721, target42⟩, ⟨7723, target43⟩, ⟨7724, target44⟩, ⟨7734, target45⟩, ⟨7739, target46⟩, ⟨7740, target47⟩, ⟨7745, target48⟩, ⟨7746, target49⟩, ⟨7748, target50⟩, ⟨7754, target51⟩, ⟨7757, target52⟩, ⟨7758, target53⟩, ⟨7759, target54⟩, ⟨7760, target55⟩, ⟨7761, target56⟩, ⟨7762, target57⟩, ⟨7764, target58⟩, ⟨7770, target59⟩, ⟨7775, target60⟩, ⟨7776, target61⟩, ⟨7777, target62⟩, ⟨7778, target63⟩, ⟨7779, target64⟩, ⟨7781, target65⟩, ⟨7783, target66⟩, ⟨7789, target67⟩, ⟨7793, target68⟩, ⟨7795, target69⟩, ⟨7797, target70⟩, ⟨7803, target71⟩, ⟨8409, target72⟩, ⟨8411, target73⟩, ⟨8413, target74⟩, ⟨8415, target75⟩, ⟨8420, target76⟩, ⟨8424, target77⟩, ⟨8470, target78⟩, ⟨8475, target79⟩, ⟨8480, target80⟩, ⟨8500, target81⟩, ⟨8502, target82⟩, ⟨8504, target83⟩, ⟨8506, target84⟩, ⟨8549, target85⟩, ⟨8563, target86⟩, ⟨8568, target87⟩, ⟨8573, target88⟩, ⟨8580, target89⟩, ⟨8581, target90⟩, ⟨8583, target91⟩, ⟨8584, target92⟩, ⟨8585, target93⟩, ⟨8589, target94⟩, ⟨8592, target95⟩, ⟨8596, target96⟩, ⟨8600, target97⟩, ⟨8604, target98⟩, ⟨8605, target99⟩, ⟨8607, target100⟩, ⟨8609, target101⟩, ⟨8611, target102⟩, ⟨8615, target103⟩, ⟨8617, target104⟩, ⟨8626, target105⟩, ⟨8628, target106⟩, ⟨8630, target107⟩, ⟨8639, target108⟩, ⟨8643, target109⟩, ⟨8644, target110⟩, ⟨8645, target111⟩, ⟨8646, target112⟩, ⟨8648, target113⟩, ⟨8651, target114⟩, ⟨8657, target115⟩, ⟨8659, target116⟩, ⟨8661, target117⟩, ⟨8663, target118⟩, ⟨8670, target119⟩, ⟨8673, target120⟩, ⟨8674, target121⟩, ⟨8675, target122⟩, ⟨8679, target123⟩, ⟨8681, target124⟩, ⟨8682, target125⟩, ⟨8683, target126⟩, ⟨8684, target127⟩]
  indexMask := 26635094012789553596038859950859098312601652414441178945210804827426634723884154989632566973756673219355888215145446508054974026113281435476139181636120026894500613952497338547848984849075025824266625804418674410896205552293926137201041225314335083924849936861706744043276359529254261479207644072273363076746620209884395749903797449832842046788476679350470952137792415182535827339149447010102357901445373186636553449307782070743990813938147057373688340874467088499569244402311879732979228463593314677621969968351166552025656160890976301570265375150662836105747967599902223613498303118562889670961744898620510919708931516497220287821674840642732567701600927174127189190678062227180953027543426863689562870085493598222092371014277904628913983868836628534181484017200233082013107405752510640271617990878520169393080076298348735922326435770204016033449302659604960924879667461390482193961793068348175584028852090661361909514535828628152496429843654874683564591716509399613969640336033616059122952222400908996515044206563113769986682295466501747393663084299671281985974793571094131092536772251233652747622967351711189918897503811353488014160776181482568233603229155612906604490798161778389985653046624048817142128248096432758352288012606936615937206688578073988880468914100334646787452849196442423421387236558324760429731673916646908564039141165290794078785136205106519971603627160055790713971744982946403754165043175822245784079812190229670350448576756677352853073755675572824262738031520648342804115967321156792300306534129211571088250810942722656274278133730508918697304963117117298219210598975772277926065050111569463410957586049400996894397634646125606710984302330301365807659191157193897683586384619418861039018066717601929232591103123317287657620462369987836856192073209320711975803110767753856792519233841906301831641859158611181758390601021114739865243689879085700342638115311432328057904185092685386318142756321940037910669867332799776192717672943847663788679507869434802982389888091068410316311443739575825453873543043698610850159430801651490605425051303832225241653605811569897356303359967184914531155255058188573091744411995834872426159838971515351556939519620010477223654155234851885082790938115051564653656865064689895310553848419694872394451678184822946746309212066326819559802581671410886477122482216149812128084273982044058620457241570371533634885381754204818708354349138392764737789636155627420505312367510594163910957542844316127174524944192111907424900099603380388179224633903704174598158855294865266948175483156779420497489607819405978203367935253098259484487262811450465906141972357053160276099072
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

end FranklSmallCyclic.TransportBatches.G030.B001.Data
