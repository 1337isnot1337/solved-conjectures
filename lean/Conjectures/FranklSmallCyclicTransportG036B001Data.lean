module

public import Conjectures.FranklSmallCyclicRowCoverage
public import Conjectures.FranklSmallCyclicCanonicalWords
public import Conjectures.FranklSmallCyclicOrbit8Block010Data

/-! 128 literal targets sharing one source proof block.
Original words and row indices are retained; weights may be transported.
-/
@[expose] public section

namespace FranklSmallCyclic.TransportBatches.G036.B001.Data

-- Period 8, original row 5992, representative 4604.
def source0 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B010.Data.entryAt ⟨8, by decide +kernel⟩

def target0 : Weights.Entry :=
  { word := [8, 9, 8, 1, 12, 2, 8], weights := [1, 2, 1, 0] }

def points0 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 5996, representative 4599.
def source1 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B010.Data.entryAt ⟨3, by decide +kernel⟩

def target1 : Weights.Entry :=
  { word := [8, 9, 8, 1, 12, 10, 8], weights := [1, 2, 1, 0] }

-- Period 8, original row 5998, representative 4639.
def source2 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B010.Data.entryAt ⟨43, by decide +kernel⟩

def target2 : Weights.Entry :=
  { word := [8, 9, 8, 2, 2, 2, 8], weights := [0, 1, 0, 1] }

def points2 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 6000, representative 4631.
def source3 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B010.Data.entryAt ⟨35, by decide +kernel⟩

def target3 : Weights.Entry :=
  { word := [8, 9, 8, 2, 2, 10, 8], weights := [1, 0, 0, 1] }

-- Period 8, original row 6002, representative 4640.
def source4 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B010.Data.entryAt ⟨44, by decide +kernel⟩

def target4 : Weights.Entry :=
  { word := [8, 9, 8, 2, 10, 2, 8], weights := [0, 1, 0, 1] }

def points4 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 6004, representative 4632.
def source5 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B010.Data.entryAt ⟨36, by decide +kernel⟩

def target5 : Weights.Entry :=
  { word := [8, 9, 8, 2, 10, 10, 8], weights := [1, 0, 0, 1] }

-- Period 8, original row 6010, representative 4627.
def source6 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B010.Data.entryAt ⟨31, by decide +kernel⟩

def target6 : Weights.Entry :=
  { word := [8, 9, 8, 4, 6, 0, 8], weights := [1, 0, 0, 1] }

def points6 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 6012, representative 4615.
def source7 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B010.Data.entryAt ⟨19, by decide +kernel⟩

def target7 : Weights.Entry :=
  { word := [8, 9, 8, 4, 6, 8, 8], weights := [1, 0, 0, 1] }

def points7 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 6019, representative 4601.
def source8 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B010.Data.entryAt ⟨5, by decide +kernel⟩

def target8 : Weights.Entry :=
  { word := [8, 9, 8, 8, 6, 2, 8], weights := [0, 1, 1, 0] }

def points8 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 6021, representative 4596.
def source9 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B010.Data.entryAt ⟨0, by decide +kernel⟩

def target9 : Weights.Entry :=
  { word := [8, 9, 8, 8, 6, 10, 8], weights := [0, 1, 1, 0] }

-- Period 8, original row 6031, representative 4642.
def source10 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B010.Data.entryAt ⟨46, by decide +kernel⟩

def target10 : Weights.Entry :=
  { word := [8, 9, 8, 10, 2, 2, 8], weights := [0, 1, 0, 1] }

def points10 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 6032, representative 4634.
def source11 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B010.Data.entryAt ⟨38, by decide +kernel⟩

def target11 : Weights.Entry :=
  { word := [8, 9, 8, 10, 2, 10, 8], weights := [0, 1, 1, 0] }

-- Period 8, original row 6033, representative 4641.
def source12 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B010.Data.entryAt ⟨45, by decide +kernel⟩

def target12 : Weights.Entry :=
  { word := [8, 9, 8, 10, 10, 2, 8], weights := [0, 1, 0, 1] }

def points12 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 6034, representative 4633.
def source13 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B010.Data.entryAt ⟨37, by decide +kernel⟩

def target13 : Weights.Entry :=
  { word := [8, 9, 8, 10, 10, 10, 8], weights := [0, 1, 1, 0] }

-- Period 8, original row 6039, representative 4628.
def source14 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B010.Data.entryAt ⟨32, by decide +kernel⟩

def target14 : Weights.Entry :=
  { word := [8, 9, 8, 12, 6, 0, 8], weights := [0, 1, 1, 0] }

def points14 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 6041, representative 4616.
def source15 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B010.Data.entryAt ⟨20, by decide +kernel⟩

def target15 : Weights.Entry :=
  { word := [8, 9, 8, 12, 6, 8, 8], weights := [0, 1, 1, 0] }

def points15 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 6047, representative 4619.
def source16 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B010.Data.entryAt ⟨23, by decide +kernel⟩

def target16 : Weights.Entry :=
  { word := [8, 9, 12, 4, 4, 0, 8], weights := [1, 0, 0, 1] }

def points16 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 6049, representative 4607.
def source17 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B010.Data.entryAt ⟨11, by decide +kernel⟩

def target17 : Weights.Entry :=
  { word := [8, 9, 12, 4, 4, 8, 8], weights := [1, 0, 0, 1] }

def points17 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 6051, representative 4620.
def source18 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B010.Data.entryAt ⟨24, by decide +kernel⟩

def target18 : Weights.Entry :=
  { word := [8, 9, 12, 4, 12, 0, 8], weights := [1, 0, 0, 1] }

def points18 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 6053, representative 4608.
def source19 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B010.Data.entryAt ⟨12, by decide +kernel⟩

def target19 : Weights.Entry :=
  { word := [8, 9, 12, 4, 12, 8, 8], weights := [1, 0, 0, 1] }

def points19 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 6054, representative 4622.
def source20 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B010.Data.entryAt ⟨26, by decide +kernel⟩

def target20 : Weights.Entry :=
  { word := [8, 9, 12, 12, 4, 0, 8], weights := [1, 0, 0, 1] }

def points20 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 6056, representative 4610.
def source21 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B010.Data.entryAt ⟨14, by decide +kernel⟩

def target21 : Weights.Entry :=
  { word := [8, 9, 12, 12, 4, 8, 8], weights := [0, 1, 1, 0] }

def points21 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 6057, representative 4621.
def source22 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B010.Data.entryAt ⟨25, by decide +kernel⟩

def target22 : Weights.Entry :=
  { word := [8, 9, 12, 12, 12, 0, 8], weights := [0, 1, 1, 0] }

def points22 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 6059, representative 4609.
def source23 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B010.Data.entryAt ⟨13, by decide +kernel⟩

def target23 : Weights.Entry :=
  { word := [8, 9, 12, 12, 12, 8, 8], weights := [0, 1, 1, 0] }

def points23 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 6342, representative 4688.
def source24 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B010.Data.entryAt ⟨92, by decide +kernel⟩

def target24 : Weights.Entry :=
  { word := [8, 12, 0, 4, 2, 8, 10], weights := [1, 0, 1, 0] }

-- Period 8, original row 6364, representative 4689.
def source25 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B010.Data.entryAt ⟨93, by decide +kernel⟩

def target25 : Weights.Entry :=
  { word := [8, 12, 0, 4, 10, 8, 10], weights := [1, 0, 1, 0] }

-- Period 8, original row 6378, representative 4695.
def source26 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B010.Data.entryAt ⟨99, by decide +kernel⟩

def target26 : Weights.Entry :=
  { word := [8, 12, 0, 12, 2, 8, 10], weights := [1, 0, 1, 0] }

-- Period 8, original row 6400, representative 4692.
def source27 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B010.Data.entryAt ⟨96, by decide +kernel⟩

def target27 : Weights.Entry :=
  { word := [8, 12, 0, 12, 10, 8, 10], weights := [1, 0, 1, 0] }

-- Period 8, original row 6406, representative 4597.
def source28 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B010.Data.entryAt ⟨1, by decide +kernel⟩

def target28 : Weights.Entry :=
  { word := [8, 12, 2, 0, 1, 8, 9], weights := [0, 1, 2, 1] }

def points28 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 6409, representative 4598.
def source29 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B010.Data.entryAt ⟨2, by decide +kernel⟩

def target29 : Weights.Entry :=
  { word := [8, 12, 2, 0, 9, 8, 9], weights := [0, 1, 2, 1] }

def points29 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 6417, representative 4657.
def source30 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B010.Data.entryAt ⟨61, by decide +kernel⟩

def target30 : Weights.Entry :=
  { word := [8, 12, 2, 8, 2, 8, 10], weights := [0, 1, 1, 0] }

-- Period 8, original row 6425, representative 4655.
def source31 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B010.Data.entryAt ⟨59, by decide +kernel⟩

def target31 : Weights.Entry :=
  { word := [8, 12, 2, 8, 10, 8, 10], weights := [0, 1, 1, 0] }

-- Period 8, original row 6437, representative 4630.
def source32 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B010.Data.entryAt ⟨34, by decide +kernel⟩

def target32 : Weights.Entry :=
  { word := [8, 12, 4, 4, 0, 8, 9], weights := [1, 0, 0, 1] }

def points32 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 6438, representative 4696.
def source33 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B010.Data.entryAt ⟨100, by decide +kernel⟩

def target33 : Weights.Entry :=
  { word := [8, 12, 4, 4, 0, 8, 10], weights := [1, 0, 0, 1] }

-- Period 8, original row 6451, representative 4631.
def source34 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B010.Data.entryAt ⟨35, by decide +kernel⟩

def target34 : Weights.Entry :=
  { word := [8, 12, 4, 4, 8, 8, 9], weights := [1, 0, 0, 1] }

def points34 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 6452, representative 4697.
def source35 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B010.Data.entryAt ⟨101, by decide +kernel⟩

def target35 : Weights.Entry :=
  { word := [8, 12, 4, 4, 8, 8, 10], weights := [1, 0, 1, 0] }

-- Period 8, original row 6465, representative 4637.
def source36 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B010.Data.entryAt ⟨41, by decide +kernel⟩

def target36 : Weights.Entry :=
  { word := [8, 12, 4, 12, 0, 8, 9], weights := [1, 0, 0, 1] }

def points36 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 6466, representative 4703.
def source37 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B010.Data.entryAt ⟨107, by decide +kernel⟩

def target37 : Weights.Entry :=
  { word := [8, 12, 4, 12, 0, 8, 10], weights := [1, 0, 1, 0] }

-- Period 8, original row 6479, representative 4634.
def source38 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B010.Data.entryAt ⟨38, by decide +kernel⟩

def target38 : Weights.Entry :=
  { word := [8, 12, 4, 12, 8, 8, 9], weights := [0, 1, 1, 0] }

def points38 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 6480, representative 4700.
def source39 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B010.Data.entryAt ⟨104, by decide +kernel⟩

def target39 : Weights.Entry :=
  { word := [8, 12, 4, 12, 8, 8, 10], weights := [1, 0, 1, 0] }

-- Period 8, original row 6485, representative 4596.
def source40 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B010.Data.entryAt ⟨0, by decide +kernel⟩

def target40 : Weights.Entry :=
  { word := [8, 12, 6, 8, 8, 8, 9], weights := [0, 1, 1, 0] }

def points40 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 6486, representative 4658.
def source41 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B010.Data.entryAt ⟨62, by decide +kernel⟩

def target41 : Weights.Entry :=
  { word := [8, 12, 6, 8, 8, 8, 10], weights := [0, 1, 1, 0] }

-- Period 8, original row 6497, representative 4693.
def source42 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B010.Data.entryAt ⟨97, by decide +kernel⟩

def target42 : Weights.Entry :=
  { word := [8, 12, 8, 4, 2, 8, 10], weights := [1, 0, 1, 0] }

-- Period 8, original row 6523, representative 4690.
def source43 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B010.Data.entryAt ⟨94, by decide +kernel⟩

def target43 : Weights.Entry :=
  { word := [8, 12, 8, 4, 10, 8, 10], weights := [1, 0, 1, 0] }

-- Period 8, original row 6539, representative 4694.
def source44 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B010.Data.entryAt ⟨98, by decide +kernel⟩

def target44 : Weights.Entry :=
  { word := [8, 12, 8, 12, 2, 8, 10], weights := [1, 0, 1, 0] }

-- Period 8, original row 6565, representative 4691.
def source45 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B010.Data.entryAt ⟨95, by decide +kernel⟩

def target45 : Weights.Entry :=
  { word := [8, 12, 8, 12, 10, 8, 10], weights := [1, 0, 1, 0] }

-- Period 8, original row 6573, representative 4600.
def source46 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B010.Data.entryAt ⟨4, by decide +kernel⟩

def target46 : Weights.Entry :=
  { word := [8, 12, 10, 0, 1, 8, 9], weights := [0, 1, 2, 1] }

def points46 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 6576, representative 4599.
def source47 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B010.Data.entryAt ⟨3, by decide +kernel⟩

def target47 : Weights.Entry :=
  { word := [8, 12, 10, 0, 9, 8, 9], weights := [0, 1, 2, 1] }

def points47 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 6579, representative 4656.
def source48 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B010.Data.entryAt ⟨60, by decide +kernel⟩

def target48 : Weights.Entry :=
  { word := [8, 12, 10, 8, 2, 8, 10], weights := [0, 1, 1, 0] }

-- Period 8, original row 6582, representative 4654.
def source49 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B010.Data.entryAt ⟨58, by decide +kernel⟩

def target49 : Weights.Entry :=
  { word := [8, 12, 10, 8, 10, 8, 10], weights := [0, 1, 1, 0] }

-- Period 8, original row 6587, representative 4635.
def source50 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B010.Data.entryAt ⟨39, by decide +kernel⟩

def target50 : Weights.Entry :=
  { word := [8, 12, 12, 4, 0, 8, 9], weights := [1, 0, 0, 1] }

def points50 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 6588, representative 4701.
def source51 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B010.Data.entryAt ⟨105, by decide +kernel⟩

def target51 : Weights.Entry :=
  { word := [8, 12, 12, 4, 0, 8, 10], weights := [1, 0, 0, 1] }

-- Period 8, original row 6601, representative 4632.
def source52 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B010.Data.entryAt ⟨36, by decide +kernel⟩

def target52 : Weights.Entry :=
  { word := [8, 12, 12, 4, 8, 8, 9], weights := [1, 0, 0, 1] }

def points52 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 6602, representative 4698.
def source53 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B010.Data.entryAt ⟨102, by decide +kernel⟩

def target53 : Weights.Entry :=
  { word := [8, 12, 12, 4, 8, 8, 10], weights := [1, 0, 1, 0] }

-- Period 8, original row 6608, representative 4636.
def source54 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B010.Data.entryAt ⟨40, by decide +kernel⟩

def target54 : Weights.Entry :=
  { word := [8, 12, 12, 12, 0, 8, 9], weights := [1, 0, 0, 1] }

def points54 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 6609, representative 4702.
def source55 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B010.Data.entryAt ⟨106, by decide +kernel⟩

def target55 : Weights.Entry :=
  { word := [8, 12, 12, 12, 0, 8, 10], weights := [1, 0, 1, 0] }

-- Period 8, original row 6622, representative 4633.
def source56 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B010.Data.entryAt ⟨37, by decide +kernel⟩

def target56 : Weights.Entry :=
  { word := [8, 12, 12, 12, 8, 8, 9], weights := [0, 1, 1, 0] }

def points56 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 6623, representative 4699.
def source57 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B010.Data.entryAt ⟨103, by decide +kernel⟩

def target57 : Weights.Entry :=
  { word := [8, 12, 12, 12, 8, 8, 10], weights := [1, 0, 1, 0] }

-- Period 8, original row 6709, representative 4618.
def source58 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B010.Data.entryAt ⟨22, by decide +kernel⟩

def target58 : Weights.Entry :=
  { word := [9, 0, 2, 2, 2, 8, 9], weights := [1, 0, 0, 1] }

def points58 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 8, original row 6710, representative 4676.
def source59 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B010.Data.entryAt ⟨80, by decide +kernel⟩

def target59 : Weights.Entry :=
  { word := [9, 0, 2, 2, 2, 8, 10], weights := [1, 0, 0, 1] }

def points59 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 8, original row 6724, representative 4619.
def source60 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B010.Data.entryAt ⟨23, by decide +kernel⟩

def target60 : Weights.Entry :=
  { word := [9, 0, 2, 2, 10, 8, 9], weights := [1, 0, 0, 1] }

def points60 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 8, original row 6725, representative 4677.
def source61 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B010.Data.entryAt ⟨81, by decide +kernel⟩

def target61 : Weights.Entry :=
  { word := [9, 0, 2, 2, 10, 8, 10], weights := [1, 0, 0, 1] }

def points61 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 8, original row 6738, representative 4625.
def source62 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B010.Data.entryAt ⟨29, by decide +kernel⟩

def target62 : Weights.Entry :=
  { word := [9, 0, 2, 10, 2, 8, 9], weights := [1, 0, 0, 1] }

def points62 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 8, original row 6739, representative 4683.
def source63 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B010.Data.entryAt ⟨87, by decide +kernel⟩

def target63 : Weights.Entry :=
  { word := [9, 0, 2, 10, 2, 8, 10], weights := [1, 0, 0, 1] }

def points63 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 8, original row 6752, representative 4622.
def source64 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B010.Data.entryAt ⟨26, by decide +kernel⟩

def target64 : Weights.Entry :=
  { word := [9, 0, 2, 10, 10, 8, 9], weights := [1, 0, 0, 1] }

def points64 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 8, original row 6753, representative 4680.
def source65 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B010.Data.entryAt ⟨84, by decide +kernel⟩

def target65 : Weights.Entry :=
  { word := [9, 0, 2, 10, 10, 8, 10], weights := [1, 0, 0, 1] }

def points65 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 8, original row 6764, representative 4650.
def source66 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B010.Data.entryAt ⟨54, by decide +kernel⟩

def target66 : Weights.Entry :=
  { word := [9, 0, 4, 2, 0, 8, 9], weights := [1, 0, 0, 1] }

def points66 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 8, original row 6796, representative 4653.
def source67 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B010.Data.entryAt ⟨57, by decide +kernel⟩

def target67 : Weights.Entry :=
  { word := [9, 0, 4, 10, 0, 8, 9], weights := [1, 0, 0, 1] }

def points67 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 8, original row 6873, representative 4623.
def source68 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B010.Data.entryAt ⟨27, by decide +kernel⟩

def target68 : Weights.Entry :=
  { word := [9, 0, 10, 2, 2, 8, 9], weights := [1, 0, 0, 1] }

def points68 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 8, original row 6874, representative 4681.
def source69 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B010.Data.entryAt ⟨85, by decide +kernel⟩

def target69 : Weights.Entry :=
  { word := [9, 0, 10, 2, 2, 8, 10], weights := [1, 0, 0, 1] }

def points69 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 8, original row 6881, representative 4620.
def source70 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B010.Data.entryAt ⟨24, by decide +kernel⟩

def target70 : Weights.Entry :=
  { word := [9, 0, 10, 2, 10, 8, 9], weights := [1, 0, 0, 1] }

def points70 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 8, original row 6882, representative 4678.
def source71 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B010.Data.entryAt ⟨82, by decide +kernel⟩

def target71 : Weights.Entry :=
  { word := [9, 0, 10, 2, 10, 8, 10], weights := [1, 0, 0, 1] }

def points71 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 8, original row 6888, representative 4624.
def source72 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B010.Data.entryAt ⟨28, by decide +kernel⟩

def target72 : Weights.Entry :=
  { word := [9, 0, 10, 10, 2, 8, 9], weights := [0, 1, 1, 0] }

def points72 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 8, original row 6889, representative 4682.
def source73 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B010.Data.entryAt ⟨86, by decide +kernel⟩

def target73 : Weights.Entry :=
  { word := [9, 0, 10, 10, 2, 8, 10], weights := [0, 1, 1, 0] }

def points73 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 8, original row 6895, representative 4621.
def source74 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B010.Data.entryAt ⟨25, by decide +kernel⟩

def target74 : Weights.Entry :=
  { word := [9, 0, 10, 10, 10, 8, 9], weights := [0, 1, 1, 0] }

def points74 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 8, original row 6896, representative 4679.
def source75 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B010.Data.entryAt ⟨83, by decide +kernel⟩

def target75 : Weights.Entry :=
  { word := [9, 0, 10, 10, 10, 8, 10], weights := [0, 1, 1, 0] }

def points75 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 8, original row 6907, representative 4651.
def source76 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B010.Data.entryAt ⟨55, by decide +kernel⟩

def target76 : Weights.Entry :=
  { word := [9, 0, 12, 2, 0, 8, 9], weights := [1, 0, 0, 1] }

def points76 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 8, original row 6942, representative 4652.
def source77 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B010.Data.entryAt ⟨56, by decide +kernel⟩

def target77 : Weights.Entry :=
  { word := [9, 0, 12, 10, 0, 8, 9], weights := [1, 0, 0, 1] }

def points77 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 8, original row 6974, representative 4638.
def source78 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B010.Data.entryAt ⟨42, by decide +kernel⟩

def target78 : Weights.Entry :=
  { word := [9, 4, 4, 4, 0, 8, 9], weights := [1, 0, 0, 1] }

def points78 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 8, original row 6975, representative 4712.
def source79 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B010.Data.entryAt ⟨116, by decide +kernel⟩

def target79 : Weights.Entry :=
  { word := [9, 4, 4, 4, 0, 8, 10], weights := [1, 0, 0, 1] }

def points79 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 8, original row 6988, representative 4639.
def source80 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B010.Data.entryAt ⟨43, by decide +kernel⟩

def target80 : Weights.Entry :=
  { word := [9, 4, 4, 4, 8, 8, 9], weights := [1, 0, 1, 0] }

def points80 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 8, original row 6989, representative 4713.
def source81 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B010.Data.entryAt ⟨117, by decide +kernel⟩

def target81 : Weights.Entry :=
  { word := [9, 4, 4, 4, 8, 8, 10], weights := [1, 0, 1, 0] }

def points81 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 8, original row 7002, representative 4645.
def source82 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B010.Data.entryAt ⟨49, by decide +kernel⟩

def target82 : Weights.Entry :=
  { word := [9, 4, 4, 12, 0, 8, 9], weights := [1, 0, 1, 0] }

def points82 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 8, original row 7003, representative 4719.
def source83 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B010.Data.entryAt ⟨123, by decide +kernel⟩

def target83 : Weights.Entry :=
  { word := [9, 4, 4, 12, 0, 8, 10], weights := [1, 0, 1, 0] }

def points83 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 8, original row 7016, representative 4642.
def source84 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B010.Data.entryAt ⟨46, by decide +kernel⟩

def target84 : Weights.Entry :=
  { word := [9, 4, 4, 12, 8, 8, 9], weights := [1, 0, 1, 0] }

def points84 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 8, original row 7017, representative 4716.
def source85 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B010.Data.entryAt ⟨120, by decide +kernel⟩

def target85 : Weights.Entry :=
  { word := [9, 4, 4, 12, 8, 8, 10], weights := [1, 0, 1, 0] }

def points85 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 8, original row 7023, representative 4643.
def source86 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B010.Data.entryAt ⟨47, by decide +kernel⟩

def target86 : Weights.Entry :=
  { word := [9, 4, 12, 4, 0, 8, 9], weights := [1, 0, 0, 1] }

def points86 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 8, original row 7024, representative 4717.
def source87 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B010.Data.entryAt ⟨121, by decide +kernel⟩

def target87 : Weights.Entry :=
  { word := [9, 4, 12, 4, 0, 8, 10], weights := [1, 0, 0, 1] }

def points87 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 8, original row 7037, representative 4640.
def source88 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B010.Data.entryAt ⟨44, by decide +kernel⟩

def target88 : Weights.Entry :=
  { word := [9, 4, 12, 4, 8, 8, 9], weights := [1, 0, 1, 0] }

def points88 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 8, original row 7038, representative 4714.
def source89 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B010.Data.entryAt ⟨118, by decide +kernel⟩

def target89 : Weights.Entry :=
  { word := [9, 4, 12, 4, 8, 8, 10], weights := [1, 0, 1, 0] }

def points89 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 8, original row 7044, representative 4644.
def source90 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B010.Data.entryAt ⟨48, by decide +kernel⟩

def target90 : Weights.Entry :=
  { word := [9, 4, 12, 12, 0, 8, 9], weights := [1, 0, 1, 0] }

def points90 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 8, original row 7045, representative 4718.
def source91 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B010.Data.entryAt ⟨122, by decide +kernel⟩

def target91 : Weights.Entry :=
  { word := [9, 4, 12, 12, 0, 8, 10], weights := [1, 0, 1, 0] }

def points91 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 8, original row 7058, representative 4641.
def source92 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B010.Data.entryAt ⟨45, by decide +kernel⟩

def target92 : Weights.Entry :=
  { word := [9, 4, 12, 12, 8, 8, 9], weights := [1, 0, 1, 0] }

def points92 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 8, original row 7059, representative 4715.
def source93 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B010.Data.entryAt ⟨119, by decide +kernel⟩

def target93 : Weights.Entry :=
  { word := [9, 4, 12, 12, 8, 8, 10], weights := [1, 0, 1, 0] }

def points93 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 8, original row 7071, representative 4720.
def source94 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B010.Data.entryAt ⟨124, by decide +kernel⟩

def target94 : Weights.Entry :=
  { word := [9, 8, 1, 4, 2, 8, 10], weights := [1, 0, 1, 0] }

def points94 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 8, original row 7093, representative 4721.
def source95 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B010.Data.entryAt ⟨125, by decide +kernel⟩

def target95 : Weights.Entry :=
  { word := [9, 8, 1, 4, 10, 8, 10], weights := [1, 0, 1, 0] }

def points95 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 8, original row 7107, representative 4723.
def source96 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B010.Data.entryAt ⟨127, by decide +kernel⟩

def target96 : Weights.Entry :=
  { word := [9, 8, 1, 12, 2, 8, 10], weights := [1, 0, 1, 0] }

def points96 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 8, original row 7129, representative 4722.
def source97 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B010.Data.entryAt ⟨126, by decide +kernel⟩

def target97 : Weights.Entry :=
  { word := [9, 8, 1, 12, 10, 8, 10], weights := [1, 0, 1, 0] }

def points97 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 8, original row 7145, representative 4606.
def source98 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B010.Data.entryAt ⟨10, by decide +kernel⟩

def target98 : Weights.Entry :=
  { word := [9, 8, 2, 2, 2, 8, 9], weights := [1, 0, 0, 1] }

def points98 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 8, original row 7146, representative 4664.
def source99 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B010.Data.entryAt ⟨68, by decide +kernel⟩

def target99 : Weights.Entry :=
  { word := [9, 8, 2, 2, 2, 8, 10], weights := [1, 0, 0, 1] }

def points99 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 8, original row 7160, representative 4607.
def source100 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B010.Data.entryAt ⟨11, by decide +kernel⟩

def target100 : Weights.Entry :=
  { word := [9, 8, 2, 2, 10, 8, 9], weights := [1, 0, 0, 1] }

def points100 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 8, original row 7161, representative 4665.
def source101 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B010.Data.entryAt ⟨69, by decide +kernel⟩

def target101 : Weights.Entry :=
  { word := [9, 8, 2, 2, 10, 8, 10], weights := [1, 0, 0, 1] }

def points101 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 8, original row 7174, representative 4613.
def source102 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B010.Data.entryAt ⟨17, by decide +kernel⟩

def target102 : Weights.Entry :=
  { word := [9, 8, 2, 10, 2, 8, 9], weights := [0, 1, 1, 0] }

def points102 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 8, original row 7175, representative 4671.
def source103 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B010.Data.entryAt ⟨75, by decide +kernel⟩

def target103 : Weights.Entry :=
  { word := [9, 8, 2, 10, 2, 8, 10], weights := [0, 1, 1, 0] }

def points103 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 8, original row 7188, representative 4610.
def source104 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B010.Data.entryAt ⟨14, by decide +kernel⟩

def target104 : Weights.Entry :=
  { word := [9, 8, 2, 10, 10, 8, 9], weights := [0, 1, 1, 0] }

def points104 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 8, original row 7189, representative 4668.
def source105 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B010.Data.entryAt ⟨72, by decide +kernel⟩

def target105 : Weights.Entry :=
  { word := [9, 8, 2, 10, 10, 8, 10], weights := [0, 1, 1, 0] }

def points105 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 8, original row 7257, representative 4611.
def source106 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B010.Data.entryAt ⟨15, by decide +kernel⟩

def target106 : Weights.Entry :=
  { word := [9, 8, 10, 2, 2, 8, 9], weights := [1, 0, 0, 1] }

def points106 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 8, original row 7258, representative 4669.
def source107 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B010.Data.entryAt ⟨73, by decide +kernel⟩

def target107 : Weights.Entry :=
  { word := [9, 8, 10, 2, 2, 8, 10], weights := [1, 0, 0, 1] }

def points107 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 8, original row 7265, representative 4608.
def source108 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B010.Data.entryAt ⟨12, by decide +kernel⟩

def target108 : Weights.Entry :=
  { word := [9, 8, 10, 2, 10, 8, 9], weights := [1, 0, 0, 1] }

def points108 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 8, original row 7266, representative 4666.
def source109 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B010.Data.entryAt ⟨70, by decide +kernel⟩

def target109 : Weights.Entry :=
  { word := [9, 8, 10, 2, 10, 8, 10], weights := [1, 0, 0, 1] }

def points109 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 8, original row 7272, representative 4612.
def source110 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B010.Data.entryAt ⟨16, by decide +kernel⟩

def target110 : Weights.Entry :=
  { word := [9, 8, 10, 10, 2, 8, 9], weights := [0, 1, 1, 0] }

def points110 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 8, original row 7273, representative 4670.
def source111 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B010.Data.entryAt ⟨74, by decide +kernel⟩

def target111 : Weights.Entry :=
  { word := [9, 8, 10, 10, 2, 8, 10], weights := [0, 1, 1, 0] }

def points111 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 8, original row 7279, representative 4609.
def source112 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B010.Data.entryAt ⟨13, by decide +kernel⟩

def target112 : Weights.Entry :=
  { word := [9, 8, 10, 10, 10, 8, 9], weights := [0, 1, 1, 0] }

def points112 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 8, original row 7280, representative 4667.
def source113 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B010.Data.entryAt ⟨71, by decide +kernel⟩

def target113 : Weights.Entry :=
  { word := [9, 8, 10, 10, 10, 8, 10], weights := [0, 1, 1, 0] }

def points113 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 8, original row 7310, representative 4630.
def source114 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B010.Data.entryAt ⟨34, by decide +kernel⟩

def target114 : Weights.Entry :=
  { word := [9, 12, 4, 4, 0, 8, 9], weights := [1, 0, 0, 1] }

def points114 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 7311, representative 4696.
def source115 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B010.Data.entryAt ⟨100, by decide +kernel⟩

def target115 : Weights.Entry :=
  { word := [9, 12, 4, 4, 0, 8, 10], weights := [1, 0, 0, 1] }

def points115 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 8, original row 7324, representative 4631.
def source116 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B010.Data.entryAt ⟨35, by decide +kernel⟩

def target116 : Weights.Entry :=
  { word := [9, 12, 4, 4, 8, 8, 9], weights := [1, 0, 0, 1] }

def points116 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 7325, representative 4697.
def source117 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B010.Data.entryAt ⟨101, by decide +kernel⟩

def target117 : Weights.Entry :=
  { word := [9, 12, 4, 4, 8, 8, 10], weights := [1, 0, 1, 0] }

def points117 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 8, original row 7338, representative 4637.
def source118 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B010.Data.entryAt ⟨41, by decide +kernel⟩

def target118 : Weights.Entry :=
  { word := [9, 12, 4, 12, 0, 8, 9], weights := [1, 0, 0, 1] }

def points118 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 7339, representative 4703.
def source119 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B010.Data.entryAt ⟨107, by decide +kernel⟩

def target119 : Weights.Entry :=
  { word := [9, 12, 4, 12, 0, 8, 10], weights := [1, 0, 1, 0] }

def points119 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 8, original row 7352, representative 4634.
def source120 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B010.Data.entryAt ⟨38, by decide +kernel⟩

def target120 : Weights.Entry :=
  { word := [9, 12, 4, 12, 8, 8, 9], weights := [0, 1, 1, 0] }

def points120 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 7353, representative 4700.
def source121 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B010.Data.entryAt ⟨104, by decide +kernel⟩

def target121 : Weights.Entry :=
  { word := [9, 12, 4, 12, 8, 8, 10], weights := [1, 0, 1, 0] }

def points121 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 8, original row 7359, representative 4635.
def source122 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B010.Data.entryAt ⟨39, by decide +kernel⟩

def target122 : Weights.Entry :=
  { word := [9, 12, 12, 4, 0, 8, 9], weights := [1, 0, 0, 1] }

def points122 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 7360, representative 4701.
def source123 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B010.Data.entryAt ⟨105, by decide +kernel⟩

def target123 : Weights.Entry :=
  { word := [9, 12, 12, 4, 0, 8, 10], weights := [1, 0, 0, 1] }

def points123 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 8, original row 7373, representative 4632.
def source124 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B010.Data.entryAt ⟨36, by decide +kernel⟩

def target124 : Weights.Entry :=
  { word := [9, 12, 12, 4, 8, 8, 9], weights := [1, 0, 0, 1] }

def points124 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 7374, representative 4698.
def source125 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B010.Data.entryAt ⟨102, by decide +kernel⟩

def target125 : Weights.Entry :=
  { word := [9, 12, 12, 4, 8, 8, 10], weights := [1, 0, 1, 0] }

def points125 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 8, original row 7380, representative 4636.
def source126 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B010.Data.entryAt ⟨40, by decide +kernel⟩

def target126 : Weights.Entry :=
  { word := [9, 12, 12, 12, 0, 8, 9], weights := [1, 0, 0, 1] }

def points126 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 7381, representative 4702.
def source127 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B010.Data.entryAt ⟨106, by decide +kernel⟩

def target127 : Weights.Entry :=
  { word := [9, 12, 12, 12, 0, 8, 10], weights := [1, 0, 1, 0] }

def points127 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

def period8Entries : List Weights.Entry := [target0, target1, target2, target3, target4, target5, target6, target7, target8, target9, target10, target11, target12, target13, target14, target15, target16, target17, target18, target19, target20, target21, target22, target23, target24, target25, target26, target27, target28, target29, target30, target31, target32, target33, target34, target35, target36, target37, target38, target39, target40, target41, target42, target43, target44, target45, target46, target47, target48, target49, target50, target51, target52, target53, target54, target55, target56, target57, target58, target59, target60, target61, target62, target63, target64, target65, target66, target67, target68, target69, target70, target71, target72, target73, target74, target75, target76, target77, target78, target79, target80, target81, target82, target83, target84, target85, target86, target87, target88, target89, target90, target91, target92, target93, target94, target95, target96, target97, target98, target99, target100, target101, target102, target103, target104, target105, target106, target107, target108, target109, target110, target111, target112, target113, target114, target115, target116, target117, target118, target119, target120, target121, target122, target123, target124, target125, target126, target127]

def period8Chunk : RowCoverage.Chunk where
  rows := [⟨5992, target0⟩, ⟨5996, target1⟩, ⟨5998, target2⟩, ⟨6000, target3⟩, ⟨6002, target4⟩, ⟨6004, target5⟩, ⟨6010, target6⟩, ⟨6012, target7⟩, ⟨6019, target8⟩, ⟨6021, target9⟩, ⟨6031, target10⟩, ⟨6032, target11⟩, ⟨6033, target12⟩, ⟨6034, target13⟩, ⟨6039, target14⟩, ⟨6041, target15⟩, ⟨6047, target16⟩, ⟨6049, target17⟩, ⟨6051, target18⟩, ⟨6053, target19⟩, ⟨6054, target20⟩, ⟨6056, target21⟩, ⟨6057, target22⟩, ⟨6059, target23⟩, ⟨6342, target24⟩, ⟨6364, target25⟩, ⟨6378, target26⟩, ⟨6400, target27⟩, ⟨6406, target28⟩, ⟨6409, target29⟩, ⟨6417, target30⟩, ⟨6425, target31⟩, ⟨6437, target32⟩, ⟨6438, target33⟩, ⟨6451, target34⟩, ⟨6452, target35⟩, ⟨6465, target36⟩, ⟨6466, target37⟩, ⟨6479, target38⟩, ⟨6480, target39⟩, ⟨6485, target40⟩, ⟨6486, target41⟩, ⟨6497, target42⟩, ⟨6523, target43⟩, ⟨6539, target44⟩, ⟨6565, target45⟩, ⟨6573, target46⟩, ⟨6576, target47⟩, ⟨6579, target48⟩, ⟨6582, target49⟩, ⟨6587, target50⟩, ⟨6588, target51⟩, ⟨6601, target52⟩, ⟨6602, target53⟩, ⟨6608, target54⟩, ⟨6609, target55⟩, ⟨6622, target56⟩, ⟨6623, target57⟩, ⟨6709, target58⟩, ⟨6710, target59⟩, ⟨6724, target60⟩, ⟨6725, target61⟩, ⟨6738, target62⟩, ⟨6739, target63⟩, ⟨6752, target64⟩, ⟨6753, target65⟩, ⟨6764, target66⟩, ⟨6796, target67⟩, ⟨6873, target68⟩, ⟨6874, target69⟩, ⟨6881, target70⟩, ⟨6882, target71⟩, ⟨6888, target72⟩, ⟨6889, target73⟩, ⟨6895, target74⟩, ⟨6896, target75⟩, ⟨6907, target76⟩, ⟨6942, target77⟩, ⟨6974, target78⟩, ⟨6975, target79⟩, ⟨6988, target80⟩, ⟨6989, target81⟩, ⟨7002, target82⟩, ⟨7003, target83⟩, ⟨7016, target84⟩, ⟨7017, target85⟩, ⟨7023, target86⟩, ⟨7024, target87⟩, ⟨7037, target88⟩, ⟨7038, target89⟩, ⟨7044, target90⟩, ⟨7045, target91⟩, ⟨7058, target92⟩, ⟨7059, target93⟩, ⟨7071, target94⟩, ⟨7093, target95⟩, ⟨7107, target96⟩, ⟨7129, target97⟩, ⟨7145, target98⟩, ⟨7146, target99⟩, ⟨7160, target100⟩, ⟨7161, target101⟩, ⟨7174, target102⟩, ⟨7175, target103⟩, ⟨7188, target104⟩, ⟨7189, target105⟩, ⟨7257, target106⟩, ⟨7258, target107⟩, ⟨7265, target108⟩, ⟨7266, target109⟩, ⟨7272, target110⟩, ⟨7273, target111⟩, ⟨7279, target112⟩, ⟨7280, target113⟩, ⟨7310, target114⟩, ⟨7311, target115⟩, ⟨7324, target116⟩, ⟨7325, target117⟩, ⟨7338, target118⟩, ⟨7339, target119⟩, ⟨7352, target120⟩, ⟨7353, target121⟩, ⟨7359, target122⟩, ⟨7360, target123⟩, ⟨7373, target124⟩, ⟨7374, target125⟩, ⟨7380, target126⟩, ⟨7381, target127⟩]
  indexMask := 120745013010822866120041465562656604039741031342589848973231489472416336729451114955825258431971161627764119036320746570717352927907667551944781135417089539568902545956326824549892982135673818881783828409661790061812732875305584098735321665085599532431769898643315794908881202363715479725611890619518320069418738801292809339753460671497373653680697586243823338694656921001383650121097220467451557675323313227448485040242806936852927900078635110316286293997023546389589896266206876856476046101444084856379801098836783046252706004575924887174791008257453411675406282173345331391838515885538221383123622041723757135923671056244428640827318300886726523802172702088975490594300550880690436998444737272219132855953757228348300357031084727481443139618172369142494671306127051454480556391070676797793042126947736877604374809230115844670798838240582838792090489606074758991750754853585120614158591420513867643309101053205622087857063896683645929050755325064506970757196457721308816475113795378599752178413892947358220731095732279240009048340994556775414531112305599339674667660770691355872565964767609898316584991228577626872755486885039235103025736260959798642219212107003962458726805838648847973385986427256437098684811556731031471409826792355863931023822565200578257888269631745761090735599169439806323059827010254545193275389116724895908193545305577899610422903218629996792858454958431409623461642755812668635186239458403073986294875780257999682679465061954746656190025089251754829933326607902604381957898382490131909401628199192934243877876491691314656531871252427236374298627278852390423526003807128226754152567274444530128533609500203967565560528963522134643019158554275292195315934063703581119864803877230733280812670119440584897752335698858505708424440212968879039649387316173418172235597859520750819402008838539384541906727858121121901993309485118567394908598932809598111038936401758869491165277213393237230591360915228198094695399380689716690887366779479058775132623202839524556002128900068402282780881358183462782754475248804759556573304963379161079317496432066645328915662084858347437035811111646676437095774832539978362129243450349028221224707148553853836748471443583249760186172816710270708696725535303723469322059776
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

end FranklSmallCyclic.TransportBatches.G036.B001.Data
