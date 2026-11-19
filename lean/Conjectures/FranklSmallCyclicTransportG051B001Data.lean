module

public import Conjectures.FranklSmallCyclicRowCoverage
public import Conjectures.FranklSmallCyclicCanonicalWords
public import Conjectures.FranklSmallCyclicOrbit8Block025Data

/-! 128 literal targets sharing one source proof block.
Original words and row indices are retained; weights may be transported.
-/
@[expose] public section

namespace FranklSmallCyclic.TransportBatches.G051.B001.Data

-- Period 8, original row 5251, representative 6537.
def source0 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B025.Data.entryAt ⟨18, by decide +kernel⟩

def target0 : Weights.Entry :=
  { word := [8, 4, 10, 8, 10, 8, 8], weights := [0, 1, 1, 0] }

-- Period 8, original row 5256, representative 6548.
def source1 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B025.Data.entryAt ⟨29, by decide +kernel⟩

def target1 : Weights.Entry :=
  { word := [8, 4, 12, 4, 0, 8, 8], weights := [1, 0, 0, 1] }

-- Period 8, original row 5263, representative 6564.
def source2 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B025.Data.entryAt ⟨45, by decide +kernel⟩

def target2 : Weights.Entry :=
  { word := [8, 4, 12, 4, 8, 0, 8], weights := [1, 0, 0, 1] }

def points2 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 5270, representative 6549.
def source3 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B025.Data.entryAt ⟨30, by decide +kernel⟩

def target3 : Weights.Entry :=
  { word := [8, 4, 12, 4, 8, 8, 8], weights := [1, 0, 1, 0] }

-- Period 8, original row 5277, representative 6551.
def source4 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B025.Data.entryAt ⟨32, by decide +kernel⟩

def target4 : Weights.Entry :=
  { word := [8, 4, 12, 12, 0, 8, 8], weights := [1, 0, 1, 0] }

-- Period 8, original row 5284, representative 6565.
def source5 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B025.Data.entryAt ⟨46, by decide +kernel⟩

def target5 : Weights.Entry :=
  { word := [8, 4, 12, 12, 8, 0, 8], weights := [0, 1, 1, 0] }

def points5 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 5291, representative 6550.
def source6 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B025.Data.entryAt ⟨31, by decide +kernel⟩

def target6 : Weights.Entry :=
  { word := [8, 4, 12, 12, 8, 8, 8], weights := [1, 0, 1, 0] }

-- Period 8, original row 5318, representative 6543.
def source7 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B025.Data.entryAt ⟨24, by decide +kernel⟩

def target7 : Weights.Entry :=
  { word := [8, 8, 0, 1, 4, 2, 8], weights := [1, 2, 1, 0] }

def points7 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 5324, representative 6541.
def source8 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B025.Data.entryAt ⟨22, by decide +kernel⟩

def target8 : Weights.Entry :=
  { word := [8, 8, 0, 1, 12, 2, 8], weights := [1, 2, 1, 0] }

def points8 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 5330, representative 6547.
def source9 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B025.Data.entryAt ⟨28, by decide +kernel⟩

def target9 : Weights.Entry :=
  { word := [8, 8, 0, 2, 2, 2, 8], weights := [1, 0, 0, 1] }

def points9 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 5334, representative 6548.
def source10 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B025.Data.entryAt ⟨29, by decide +kernel⟩

def target10 : Weights.Entry :=
  { word := [8, 8, 0, 2, 10, 2, 8], weights := [1, 0, 0, 1] }

def points10 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 5344, representative 6636.
def source11 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B025.Data.entryAt ⟨117, by decide +kernel⟩

def target11 : Weights.Entry :=
  { word := [8, 8, 0, 4, 2, 0, 8], weights := [1, 0, 0, 1] }

def points11 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 5350, representative 6625.
def source12 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B025.Data.entryAt ⟨106, by decide +kernel⟩

def target12 : Weights.Entry :=
  { word := [8, 8, 0, 4, 2, 8, 8], weights := [1, 0, 1, 0] }

-- Period 8, original row 5356, representative 6597.
def source13 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B025.Data.entryAt ⟨78, by decide +kernel⟩

def target13 : Weights.Entry :=
  { word := [8, 8, 0, 4, 6, 0, 8], weights := [1, 0, 0, 1] }

def points13 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 5358, representative 6585.
def source14 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B025.Data.entryAt ⟨66, by decide +kernel⟩

def target14 : Weights.Entry :=
  { word := [8, 8, 0, 4, 6, 8, 8], weights := [1, 0, 0, 1] }

-- Period 8, original row 5370, representative 6637.
def source15 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B025.Data.entryAt ⟨118, by decide +kernel⟩

def target15 : Weights.Entry :=
  { word := [8, 8, 0, 4, 10, 0, 8], weights := [1, 0, 0, 1] }

def points15 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 5376, representative 6626.
def source16 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B025.Data.entryAt ⟨107, by decide +kernel⟩

def target16 : Weights.Entry :=
  { word := [8, 8, 0, 4, 10, 8, 8], weights := [1, 0, 1, 0] }

-- Period 8, original row 5381, representative 6632.
def source17 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B025.Data.entryAt ⟨113, by decide +kernel⟩

def target17 : Weights.Entry :=
  { word := [8, 8, 0, 6, 2, 0, 8], weights := [0, 1, 0, 0] }

def points17 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 5382, representative 6621.
def source18 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B025.Data.entryAt ⟨102, by decide +kernel⟩

def target18 : Weights.Entry :=
  { word := [8, 8, 0, 6, 2, 8, 8], weights := [1, 0, 1, 0] }

-- Period 8, original row 5383, representative 6635.
def source19 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B025.Data.entryAt ⟨116, by decide +kernel⟩

def target19 : Weights.Entry :=
  { word := [8, 8, 0, 6, 10, 0, 8], weights := [0, 1, 0, 0] }

def points19 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 5384, representative 6622.
def source20 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B025.Data.entryAt ⟨103, by decide +kernel⟩

def target20 : Weights.Entry :=
  { word := [8, 8, 0, 6, 10, 8, 8], weights := [1, 0, 1, 0] }

-- Period 8, original row 5393, representative 6554.
def source21 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B025.Data.entryAt ⟨35, by decide +kernel⟩

def target21 : Weights.Entry :=
  { word := [8, 8, 0, 10, 2, 2, 8], weights := [0, 1, 0, 1] }

def points21 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 5395, representative 6551.
def source22 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B025.Data.entryAt ⟨32, by decide +kernel⟩

def target22 : Weights.Entry :=
  { word := [8, 8, 0, 10, 10, 2, 8], weights := [0, 1, 0, 1] }

def points22 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 5408, representative 6639.
def source23 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B025.Data.entryAt ⟨120, by decide +kernel⟩

def target23 : Weights.Entry :=
  { word := [8, 8, 0, 12, 2, 0, 8], weights := [1, 0, 0, 1] }

def points23 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 5414, representative 6628.
def source24 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B025.Data.entryAt ⟨109, by decide +kernel⟩

def target24 : Weights.Entry :=
  { word := [8, 8, 0, 12, 2, 8, 8], weights := [1, 0, 1, 0] }

-- Period 8, original row 5419, representative 6600.
def source25 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B025.Data.entryAt ⟨81, by decide +kernel⟩

def target25 : Weights.Entry :=
  { word := [8, 8, 0, 12, 6, 0, 8], weights := [1, 0, 0, 1] }

def points25 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 5421, representative 6588.
def source26 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B025.Data.entryAt ⟨69, by decide +kernel⟩

def target26 : Weights.Entry :=
  { word := [8, 8, 0, 12, 6, 8, 8], weights := [1, 0, 0, 1] }

-- Period 8, original row 5433, representative 6638.
def source27 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B025.Data.entryAt ⟨119, by decide +kernel⟩

def target27 : Weights.Entry :=
  { word := [8, 8, 0, 12, 10, 0, 8], weights := [1, 0, 0, 1] }

def points27 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 5439, representative 6627.
def source28 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B025.Data.entryAt ⟨108, by decide +kernel⟩

def target28 : Weights.Entry :=
  { word := [8, 8, 0, 12, 10, 8, 8], weights := [1, 0, 1, 0] }

-- Period 8, original row 5447, representative 6581.
def source29 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B025.Data.entryAt ⟨62, by decide +kernel⟩

def target29 : Weights.Entry :=
  { word := [8, 8, 1, 4, 2, 0, 8], weights := [1, 0, 0, 1] }

def points29 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 5453, representative 6577.
def source30 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B025.Data.entryAt ⟨58, by decide +kernel⟩

def target30 : Weights.Entry :=
  { word := [8, 8, 1, 4, 2, 8, 8], weights := [1, 0, 1, 0] }

-- Period 8, original row 5469, representative 6582.
def source31 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B025.Data.entryAt ⟨63, by decide +kernel⟩

def target31 : Weights.Entry :=
  { word := [8, 8, 1, 4, 10, 0, 8], weights := [1, 0, 0, 1] }

def points31 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 5475, representative 6578.
def source32 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B025.Data.entryAt ⟨59, by decide +kernel⟩

def target32 : Weights.Entry :=
  { word := [8, 8, 1, 4, 10, 8, 8], weights := [1, 0, 1, 0] }

-- Period 8, original row 5483, representative 6584.
def source33 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B025.Data.entryAt ⟨65, by decide +kernel⟩

def target33 : Weights.Entry :=
  { word := [8, 8, 1, 12, 2, 0, 8], weights := [1, 0, 0, 1] }

def points33 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 5489, representative 6580.
def source34 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B025.Data.entryAt ⟨61, by decide +kernel⟩

def target34 : Weights.Entry :=
  { word := [8, 8, 1, 12, 2, 8, 8], weights := [1, 0, 1, 0] }

-- Period 8, original row 5505, representative 6583.
def source35 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B025.Data.entryAt ⟨64, by decide +kernel⟩

def target35 : Weights.Entry :=
  { word := [8, 8, 1, 12, 10, 0, 8], weights := [1, 0, 0, 1] }

def points35 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 5511, representative 6579.
def source36 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B025.Data.entryAt ⟨60, by decide +kernel⟩

def target36 : Weights.Entry :=
  { word := [8, 8, 1, 12, 10, 8, 8], weights := [1, 0, 1, 0] }

-- Period 8, original row 5519, representative 6609.
def source37 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B025.Data.entryAt ⟨90, by decide +kernel⟩

def target37 : Weights.Entry :=
  { word := [8, 8, 2, 2, 2, 0, 8], weights := [0, 1, 0, 0] }

def points37 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 5527, representative 6589.
def source38 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B025.Data.entryAt ⟨70, by decide +kernel⟩

def target38 : Weights.Entry :=
  { word := [8, 8, 2, 2, 2, 8, 8], weights := [1, 0, 0, 1] }

-- Period 8, original row 5534, representative 6610.
def source39 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B025.Data.entryAt ⟨91, by decide +kernel⟩

def target39 : Weights.Entry :=
  { word := [8, 8, 2, 2, 10, 0, 8], weights := [0, 1, 0, 0] }

def points39 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 5542, representative 6594.
def source40 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B025.Data.entryAt ⟨75, by decide +kernel⟩

def target40 : Weights.Entry :=
  { word := [8, 8, 2, 2, 10, 8, 8], weights := [1, 0, 0, 1] }

-- Period 8, original row 5549, representative 6612.
def source41 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B025.Data.entryAt ⟨93, by decide +kernel⟩

def target41 : Weights.Entry :=
  { word := [8, 8, 2, 10, 2, 0, 8], weights := [0, 1, 0, 0] }

def points41 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 5556, representative 6596.
def source42 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B025.Data.entryAt ⟨77, by decide +kernel⟩

def target42 : Weights.Entry :=
  { word := [8, 8, 2, 10, 2, 8, 8], weights := [0, 1, 1, 0] }

-- Period 8, original row 5563, representative 6611.
def source43 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B025.Data.entryAt ⟨92, by decide +kernel⟩

def target43 : Weights.Entry :=
  { word := [8, 8, 2, 10, 10, 0, 8], weights := [0, 1, 0, 0] }

def points43 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 5570, representative 6595.
def source44 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B025.Data.entryAt ⟨76, by decide +kernel⟩

def target44 : Weights.Entry :=
  { word := [8, 8, 2, 10, 10, 8, 8], weights := [0, 1, 1, 0] }

-- Period 8, original row 5575, representative 6613.
def source45 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B025.Data.entryAt ⟨94, by decide +kernel⟩

def target45 : Weights.Entry :=
  { word := [8, 8, 4, 2, 0, 1, 8], weights := [0, 1, 0, 1] }

def points45 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 5577, representative 6555.
def source46 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B025.Data.entryAt ⟨36, by decide +kernel⟩

def target46 : Weights.Entry :=
  { word := [8, 8, 4, 2, 0, 2, 8], weights := [0, 1, 0, 1] }

def points46 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 5582, representative 6625.
def source47 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B025.Data.entryAt ⟨106, by decide +kernel⟩

def target47 : Weights.Entry :=
  { word := [8, 8, 4, 2, 0, 8, 8], weights := [0, 1, 0, 1] }

def points47 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 5587, representative 6577.
def source48 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B025.Data.entryAt ⟨58, by decide +kernel⟩

def target48 : Weights.Entry :=
  { word := [8, 8, 4, 2, 0, 9, 8], weights := [0, 1, 0, 1] }

def points48 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 5591, representative 6556.
def source49 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B025.Data.entryAt ⟨37, by decide +kernel⟩

def target49 : Weights.Entry :=
  { word := [8, 8, 4, 2, 8, 2, 8], weights := [0, 1, 0, 1] }

def points49 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 5597, representative 6601.
def source50 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B025.Data.entryAt ⟨82, by decide +kernel⟩

def target50 : Weights.Entry :=
  { word := [8, 8, 4, 4, 4, 0, 8], weights := [1, 0, 0, 1] }

def points50 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 5599, representative 6589.
def source51 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B025.Data.entryAt ⟨70, by decide +kernel⟩

def target51 : Weights.Entry :=
  { word := [8, 8, 4, 4, 4, 8, 8], weights := [1, 0, 0, 1] }

def points51 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 5601, representative 6602.
def source52 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B025.Data.entryAt ⟨83, by decide +kernel⟩

def target52 : Weights.Entry :=
  { word := [8, 8, 4, 4, 12, 0, 8], weights := [1, 0, 0, 1] }

def points52 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 5603, representative 6590.
def source53 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B025.Data.entryAt ⟨71, by decide +kernel⟩

def target53 : Weights.Entry :=
  { word := [8, 8, 4, 4, 12, 8, 8], weights := [1, 0, 0, 1] }

-- Period 8, original row 5604, representative 6629.
def source54 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B025.Data.entryAt ⟨110, by decide +kernel⟩

def target54 : Weights.Entry :=
  { word := [8, 8, 4, 6, 0, 0, 8], weights := [0, 1, 0, 1] }

def points54 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 5605, representative 6621.
def source55 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B025.Data.entryAt ⟨102, by decide +kernel⟩

def target55 : Weights.Entry :=
  { word := [8, 8, 4, 6, 0, 8, 8], weights := [0, 1, 0, 1] }

def points55 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 5606, representative 6631.
def source56 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B025.Data.entryAt ⟨112, by decide +kernel⟩

def target56 : Weights.Entry :=
  { word := [8, 8, 4, 6, 8, 0, 8], weights := [0, 1, 0, 0] }

def points56 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 5607, representative 6624.
def source57 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B025.Data.entryAt ⟨105, by decide +kernel⟩

def target57 : Weights.Entry :=
  { word := [8, 8, 4, 6, 8, 8, 8], weights := [1, 0, 1, 0] }

-- Period 8, original row 5609, representative 6540.
def source58 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B025.Data.entryAt ⟨21, by decide +kernel⟩

def target58 : Weights.Entry :=
  { word := [8, 8, 4, 8, 4, 2, 8], weights := [0, 1, 1, 0] }

def points58 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 5613, representative 6538.
def source59 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B025.Data.entryAt ⟨19, by decide +kernel⟩

def target59 : Weights.Entry :=
  { word := [8, 8, 4, 8, 12, 2, 8], weights := [0, 1, 1, 0] }

def points59 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 5616, representative 6616.
def source60 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B025.Data.entryAt ⟨97, by decide +kernel⟩

def target60 : Weights.Entry :=
  { word := [8, 8, 4, 10, 0, 1, 8], weights := [0, 1, 0, 1] }

def points60 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 5617, representative 6562.
def source61 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B025.Data.entryAt ⟨43, by decide +kernel⟩

def target61 : Weights.Entry :=
  { word := [8, 8, 4, 10, 0, 2, 8], weights := [0, 1, 0, 1] }

def points61 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 5621, representative 6628.
def source62 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B025.Data.entryAt ⟨109, by decide +kernel⟩

def target62 : Weights.Entry :=
  { word := [8, 8, 4, 10, 0, 8, 8], weights := [0, 1, 0, 1] }

def points62 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 5625, representative 6580.
def source63 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B025.Data.entryAt ⟨61, by decide +kernel⟩

def target63 : Weights.Entry :=
  { word := [8, 8, 4, 10, 0, 9, 8], weights := [0, 1, 0, 1] }

def points63 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 5626, representative 6521.
def source64 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B025.Data.entryAt ⟨2, by decide +kernel⟩

def target64 : Weights.Entry :=
  { word := [8, 8, 4, 10, 0, 10, 8], weights := [1, 0, 0, 1] }

-- Period 8, original row 5627, representative 6559.
def source65 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B025.Data.entryAt ⟨40, by decide +kernel⟩

def target65 : Weights.Entry :=
  { word := [8, 8, 4, 10, 8, 2, 8], weights := [0, 1, 0, 1] }

def points65 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 5635, representative 6608.
def source66 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B025.Data.entryAt ⟨89, by decide +kernel⟩

def target66 : Weights.Entry :=
  { word := [8, 8, 4, 12, 4, 0, 8], weights := [1, 0, 0, 1] }

def points66 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 5637, representative 6596.
def source67 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B025.Data.entryAt ⟨77, by decide +kernel⟩

def target67 : Weights.Entry :=
  { word := [8, 8, 4, 12, 4, 8, 8], weights := [0, 1, 1, 0] }

def points67 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 5638, representative 6605.
def source68 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B025.Data.entryAt ⟨86, by decide +kernel⟩

def target68 : Weights.Entry :=
  { word := [8, 8, 4, 12, 12, 0, 8], weights := [0, 1, 1, 0] }

def points68 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 5640, representative 6593.
def source69 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B025.Data.entryAt ⟨74, by decide +kernel⟩

def target69 : Weights.Entry :=
  { word := [8, 8, 4, 12, 12, 8, 8], weights := [0, 1, 1, 0] }

-- Period 8, original row 5641, representative 6643.
def source70 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B025.Data.entryAt ⟨124, by decide +kernel⟩

def target70 : Weights.Entry :=
  { word := [8, 8, 6, 2, 0, 8, 0], weights := [0, 1, 0, 0] }

def points70 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 5645, representative 6585.
def source71 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B025.Data.entryAt ⟨66, by decide +kernel⟩

def target71 : Weights.Entry :=
  { word := [8, 8, 6, 2, 0, 8, 8], weights := [1, 0, 0, 1] }

def points71 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 5649, representative 6644.
def source72 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B025.Data.entryAt ⟨125, by decide +kernel⟩

def target72 : Weights.Entry :=
  { word := [8, 8, 6, 2, 8, 8, 0], weights := [0, 1, 0, 0] }

def points72 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 5653, representative 6586.
def source73 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B025.Data.entryAt ⟨67, by decide +kernel⟩

def target73 : Weights.Entry :=
  { word := [8, 8, 6, 2, 8, 8, 8], weights := [1, 0, 0, 1] }

-- Period 8, original row 5660, representative 6588.
def source74 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B025.Data.entryAt ⟨69, by decide +kernel⟩

def target74 : Weights.Entry :=
  { word := [8, 8, 6, 10, 0, 8, 8], weights := [1, 0, 0, 1] }

def points74 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 5667, representative 6587.
def source75 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B025.Data.entryAt ⟨68, by decide +kernel⟩

def target75 : Weights.Entry :=
  { word := [8, 8, 6, 10, 8, 8, 8], weights := [0, 1, 1, 0] }

-- Period 8, original row 5672, representative 6544.
def source76 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B025.Data.entryAt ⟨25, by decide +kernel⟩

def target76 : Weights.Entry :=
  { word := [8, 8, 8, 1, 4, 2, 8], weights := [1, 2, 1, 0] }

def points76 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 5678, representative 6542.
def source77 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B025.Data.entryAt ⟨23, by decide +kernel⟩

def target77 : Weights.Entry :=
  { word := [8, 8, 8, 1, 12, 2, 8], weights := [1, 2, 1, 0] }

def points77 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 5684, representative 6552.
def source78 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B025.Data.entryAt ⟨33, by decide +kernel⟩

def target78 : Weights.Entry :=
  { word := [8, 8, 8, 2, 2, 2, 8], weights := [0, 1, 0, 1] }

def points78 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 5688, representative 6549.
def source79 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B025.Data.entryAt ⟨30, by decide +kernel⟩

def target79 : Weights.Entry :=
  { word := [8, 8, 8, 2, 10, 2, 8], weights := [0, 1, 0, 1] }

def points79 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 5696, representative 6598.
def source80 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B025.Data.entryAt ⟨79, by decide +kernel⟩

def target80 : Weights.Entry :=
  { word := [8, 8, 8, 4, 6, 0, 8], weights := [1, 0, 0, 1] }

def points80 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 5698, representative 6586.
def source81 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B025.Data.entryAt ⟨67, by decide +kernel⟩

def target81 : Weights.Entry :=
  { word := [8, 8, 8, 4, 6, 8, 8], weights := [1, 0, 0, 1] }

def points81 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 5703, representative 6633.
def source82 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B025.Data.entryAt ⟨114, by decide +kernel⟩

def target82 : Weights.Entry :=
  { word := [8, 8, 8, 6, 2, 0, 8], weights := [0, 1, 0, 0] }

def points82 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 5704, representative 6624.
def source83 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B025.Data.entryAt ⟨105, by decide +kernel⟩

def target83 : Weights.Entry :=
  { word := [8, 8, 8, 6, 2, 8, 8], weights := [0, 1, 0, 1] }

def points83 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 5705, representative 6634.
def source84 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B025.Data.entryAt ⟨115, by decide +kernel⟩

def target84 : Weights.Entry :=
  { word := [8, 8, 8, 6, 10, 0, 8], weights := [0, 1, 0, 0] }

def points84 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 5706, representative 6623.
def source85 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B025.Data.entryAt ⟨104, by decide +kernel⟩

def target85 : Weights.Entry :=
  { word := [8, 8, 8, 6, 10, 8, 8], weights := [1, 0, 1, 0] }

-- Period 8, original row 5709, representative 6536.
def source86 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B025.Data.entryAt ⟨17, by decide +kernel⟩

def target86 : Weights.Entry :=
  { word := [8, 8, 8, 8, 6, 2, 8], weights := [0, 1, 1, 0] }

def points86 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 5721, representative 6553.
def source87 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B025.Data.entryAt ⟨34, by decide +kernel⟩

def target87 : Weights.Entry :=
  { word := [8, 8, 8, 10, 2, 2, 8], weights := [0, 1, 0, 1] }

def points87 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 5723, representative 6550.
def source88 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B025.Data.entryAt ⟨31, by decide +kernel⟩

def target88 : Weights.Entry :=
  { word := [8, 8, 8, 10, 10, 2, 8], weights := [0, 1, 0, 1] }

def points88 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 5729, representative 6599.
def source89 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B025.Data.entryAt ⟨80, by decide +kernel⟩

def target89 : Weights.Entry :=
  { word := [8, 8, 8, 12, 6, 0, 8], weights := [0, 1, 1, 0] }

def points89 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 5731, representative 6587.
def source90 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B025.Data.entryAt ⟨68, by decide +kernel⟩

def target90 : Weights.Entry :=
  { word := [8, 8, 8, 12, 6, 8, 8], weights := [0, 1, 1, 0] }

def points90 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 5752, representative 6645.
def source91 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B025.Data.entryAt ⟨126, by decide +kernel⟩

def target91 : Weights.Entry :=
  { word := [8, 8, 10, 2, 2, 8, 0], weights := [0, 1, 0, 0] }

def points91 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 5756, representative 6590.
def source92 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B025.Data.entryAt ⟨71, by decide +kernel⟩

def target92 : Weights.Entry :=
  { word := [8, 8, 10, 2, 2, 8, 8], weights := [1, 0, 0, 1] }

def points92 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 5760, representative 6646.
def source93 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B025.Data.entryAt ⟨127, by decide +kernel⟩

def target93 : Weights.Entry :=
  { word := [8, 8, 10, 2, 10, 8, 0], weights := [0, 1, 0, 0] }

def points93 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 5764, representative 6591.
def source94 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B025.Data.entryAt ⟨72, by decide +kernel⟩

def target94 : Weights.Entry :=
  { word := [8, 8, 10, 2, 10, 8, 8], weights := [1, 0, 0, 1] }

-- Period 8, original row 5771, representative 6593.
def source95 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B025.Data.entryAt ⟨74, by decide +kernel⟩

def target95 : Weights.Entry :=
  { word := [8, 8, 10, 10, 2, 8, 8], weights := [0, 1, 1, 0] }

def points95 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 5778, representative 6592.
def source96 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B025.Data.entryAt ⟨73, by decide +kernel⟩

def target96 : Weights.Entry :=
  { word := [8, 8, 10, 10, 10, 8, 8], weights := [0, 1, 1, 0] }

-- Period 8, original row 5783, representative 6614.
def source97 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B025.Data.entryAt ⟨95, by decide +kernel⟩

def target97 : Weights.Entry :=
  { word := [8, 8, 12, 2, 0, 1, 8], weights := [0, 1, 0, 1] }

def points97 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 5785, representative 6560.
def source98 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B025.Data.entryAt ⟨41, by decide +kernel⟩

def target98 : Weights.Entry :=
  { word := [8, 8, 12, 2, 0, 2, 8], weights := [0, 1, 0, 1] }

def points98 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 5790, representative 6626.
def source99 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B025.Data.entryAt ⟨107, by decide +kernel⟩

def target99 : Weights.Entry :=
  { word := [8, 8, 12, 2, 0, 8, 8], weights := [0, 1, 0, 1] }

def points99 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 5795, representative 6578.
def source100 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B025.Data.entryAt ⟨59, by decide +kernel⟩

def target100 : Weights.Entry :=
  { word := [8, 8, 12, 2, 0, 9, 8], weights := [0, 1, 0, 1] }

def points100 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 5797, representative 6519.
def source101 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B025.Data.entryAt ⟨0, by decide +kernel⟩

def target101 : Weights.Entry :=
  { word := [8, 8, 12, 2, 0, 10, 8], weights := [1, 0, 0, 1] }

-- Period 8, original row 5799, representative 6557.
def source102 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B025.Data.entryAt ⟨38, by decide +kernel⟩

def target102 : Weights.Entry :=
  { word := [8, 8, 12, 2, 8, 2, 8], weights := [0, 1, 0, 1] }

def points102 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 5805, representative 6606.
def source103 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B025.Data.entryAt ⟨87, by decide +kernel⟩

def target103 : Weights.Entry :=
  { word := [8, 8, 12, 4, 4, 0, 8], weights := [1, 0, 0, 1] }

def points103 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 5807, representative 6594.
def source104 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B025.Data.entryAt ⟨75, by decide +kernel⟩

def target104 : Weights.Entry :=
  { word := [8, 8, 12, 4, 4, 8, 8], weights := [1, 0, 0, 1] }

def points104 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 5809, representative 6603.
def source105 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B025.Data.entryAt ⟨84, by decide +kernel⟩

def target105 : Weights.Entry :=
  { word := [8, 8, 12, 4, 12, 0, 8], weights := [1, 0, 0, 1] }

def points105 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 5811, representative 6591.
def source106 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B025.Data.entryAt ⟨72, by decide +kernel⟩

def target106 : Weights.Entry :=
  { word := [8, 8, 12, 4, 12, 8, 8], weights := [1, 0, 0, 1] }

def points106 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 5812, representative 6622.
def source107 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B025.Data.entryAt ⟨103, by decide +kernel⟩

def target107 : Weights.Entry :=
  { word := [8, 8, 12, 6, 0, 8, 8], weights := [0, 1, 0, 1] }

def points107 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 5813, representative 6630.
def source108 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B025.Data.entryAt ⟨111, by decide +kernel⟩

def target108 : Weights.Entry :=
  { word := [8, 8, 12, 6, 8, 0, 8], weights := [0, 1, 0, 0] }

def points108 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 5814, representative 6623.
def source109 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B025.Data.entryAt ⟨104, by decide +kernel⟩

def target109 : Weights.Entry :=
  { word := [8, 8, 12, 6, 8, 8, 8], weights := [0, 1, 0, 1] }

def points109 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 5816, representative 6539.
def source110 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B025.Data.entryAt ⟨20, by decide +kernel⟩

def target110 : Weights.Entry :=
  { word := [8, 8, 12, 8, 4, 2, 8], weights := [0, 1, 1, 0] }

def points110 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 5820, representative 6537.
def source111 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B025.Data.entryAt ⟨18, by decide +kernel⟩

def target111 : Weights.Entry :=
  { word := [8, 8, 12, 8, 12, 2, 8], weights := [0, 1, 1, 0] }

def points111 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 5823, representative 6615.
def source112 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B025.Data.entryAt ⟨96, by decide +kernel⟩

def target112 : Weights.Entry :=
  { word := [8, 8, 12, 10, 0, 1, 8], weights := [0, 1, 0, 1] }

def points112 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 5824, representative 6561.
def source113 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B025.Data.entryAt ⟨42, by decide +kernel⟩

def target113 : Weights.Entry :=
  { word := [8, 8, 12, 10, 0, 2, 8], weights := [0, 1, 0, 1] }

def points113 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 5828, representative 6627.
def source114 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B025.Data.entryAt ⟨108, by decide +kernel⟩

def target114 : Weights.Entry :=
  { word := [8, 8, 12, 10, 0, 8, 8], weights := [0, 1, 0, 1] }

def points114 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 5832, representative 6579.
def source115 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B025.Data.entryAt ⟨60, by decide +kernel⟩

def target115 : Weights.Entry :=
  { word := [8, 8, 12, 10, 0, 9, 8], weights := [0, 1, 0, 1] }

def points115 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 5833, representative 6520.
def source116 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B025.Data.entryAt ⟨1, by decide +kernel⟩

def target116 : Weights.Entry :=
  { word := [8, 8, 12, 10, 0, 10, 8], weights := [1, 0, 0, 1] }

-- Period 8, original row 5834, representative 6558.
def source117 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B025.Data.entryAt ⟨39, by decide +kernel⟩

def target117 : Weights.Entry :=
  { word := [8, 8, 12, 10, 8, 2, 8], weights := [0, 1, 0, 1] }

def points117 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 5842, representative 6607.
def source118 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B025.Data.entryAt ⟨88, by decide +kernel⟩

def target118 : Weights.Entry :=
  { word := [8, 8, 12, 12, 4, 0, 8], weights := [1, 0, 0, 1] }

def points118 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 5844, representative 6595.
def source119 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B025.Data.entryAt ⟨76, by decide +kernel⟩

def target119 : Weights.Entry :=
  { word := [8, 8, 12, 12, 4, 8, 8], weights := [0, 1, 1, 0] }

def points119 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 5845, representative 6604.
def source120 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B025.Data.entryAt ⟨85, by decide +kernel⟩

def target120 : Weights.Entry :=
  { word := [8, 8, 12, 12, 12, 0, 8], weights := [0, 1, 1, 0] }

def points120 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 5847, representative 6592.
def source121 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B025.Data.entryAt ⟨73, by decide +kernel⟩

def target121 : Weights.Entry :=
  { word := [8, 8, 12, 12, 12, 8, 8], weights := [0, 1, 1, 0] }

def points121 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 6335, representative 6528.
def source122 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B025.Data.entryAt ⟨9, by decide +kernel⟩

def target122 : Weights.Entry :=
  { word := [8, 12, 0, 4, 2, 0, 8], weights := [1, 0, 0, 1] }

def points122 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 6357, representative 6533.
def source123 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B025.Data.entryAt ⟨14, by decide +kernel⟩

def target123 : Weights.Entry :=
  { word := [8, 12, 0, 4, 10, 0, 8], weights := [1, 0, 0, 1] }

def points123 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 6363, representative 6519.
def source124 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B025.Data.entryAt ⟨0, by decide +kernel⟩

def target124 : Weights.Entry :=
  { word := [8, 12, 0, 4, 10, 8, 8], weights := [1, 0, 0, 1] }

def points124 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 6371, representative 6535.
def source125 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B025.Data.entryAt ⟨16, by decide +kernel⟩

def target125 : Weights.Entry :=
  { word := [8, 12, 0, 12, 2, 0, 8], weights := [1, 0, 0, 1] }

def points125 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 6377, representative 6521.
def source126 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B025.Data.entryAt ⟨2, by decide +kernel⟩

def target126 : Weights.Entry :=
  { word := [8, 12, 0, 12, 2, 8, 8], weights := [1, 0, 0, 1] }

def points126 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 6393, representative 6534.
def source127 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B025.Data.entryAt ⟨15, by decide +kernel⟩

def target127 : Weights.Entry :=
  { word := [8, 12, 0, 12, 10, 0, 8], weights := [1, 0, 0, 1] }

def points127 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

def period8Entries : List Weights.Entry := [target0, target1, target2, target3, target4, target5, target6, target7, target8, target9, target10, target11, target12, target13, target14, target15, target16, target17, target18, target19, target20, target21, target22, target23, target24, target25, target26, target27, target28, target29, target30, target31, target32, target33, target34, target35, target36, target37, target38, target39, target40, target41, target42, target43, target44, target45, target46, target47, target48, target49, target50, target51, target52, target53, target54, target55, target56, target57, target58, target59, target60, target61, target62, target63, target64, target65, target66, target67, target68, target69, target70, target71, target72, target73, target74, target75, target76, target77, target78, target79, target80, target81, target82, target83, target84, target85, target86, target87, target88, target89, target90, target91, target92, target93, target94, target95, target96, target97, target98, target99, target100, target101, target102, target103, target104, target105, target106, target107, target108, target109, target110, target111, target112, target113, target114, target115, target116, target117, target118, target119, target120, target121, target122, target123, target124, target125, target126, target127]

def period8Chunk : RowCoverage.Chunk where
  rows := [⟨5251, target0⟩, ⟨5256, target1⟩, ⟨5263, target2⟩, ⟨5270, target3⟩, ⟨5277, target4⟩, ⟨5284, target5⟩, ⟨5291, target6⟩, ⟨5318, target7⟩, ⟨5324, target8⟩, ⟨5330, target9⟩, ⟨5334, target10⟩, ⟨5344, target11⟩, ⟨5350, target12⟩, ⟨5356, target13⟩, ⟨5358, target14⟩, ⟨5370, target15⟩, ⟨5376, target16⟩, ⟨5381, target17⟩, ⟨5382, target18⟩, ⟨5383, target19⟩, ⟨5384, target20⟩, ⟨5393, target21⟩, ⟨5395, target22⟩, ⟨5408, target23⟩, ⟨5414, target24⟩, ⟨5419, target25⟩, ⟨5421, target26⟩, ⟨5433, target27⟩, ⟨5439, target28⟩, ⟨5447, target29⟩, ⟨5453, target30⟩, ⟨5469, target31⟩, ⟨5475, target32⟩, ⟨5483, target33⟩, ⟨5489, target34⟩, ⟨5505, target35⟩, ⟨5511, target36⟩, ⟨5519, target37⟩, ⟨5527, target38⟩, ⟨5534, target39⟩, ⟨5542, target40⟩, ⟨5549, target41⟩, ⟨5556, target42⟩, ⟨5563, target43⟩, ⟨5570, target44⟩, ⟨5575, target45⟩, ⟨5577, target46⟩, ⟨5582, target47⟩, ⟨5587, target48⟩, ⟨5591, target49⟩, ⟨5597, target50⟩, ⟨5599, target51⟩, ⟨5601, target52⟩, ⟨5603, target53⟩, ⟨5604, target54⟩, ⟨5605, target55⟩, ⟨5606, target56⟩, ⟨5607, target57⟩, ⟨5609, target58⟩, ⟨5613, target59⟩, ⟨5616, target60⟩, ⟨5617, target61⟩, ⟨5621, target62⟩, ⟨5625, target63⟩, ⟨5626, target64⟩, ⟨5627, target65⟩, ⟨5635, target66⟩, ⟨5637, target67⟩, ⟨5638, target68⟩, ⟨5640, target69⟩, ⟨5641, target70⟩, ⟨5645, target71⟩, ⟨5649, target72⟩, ⟨5653, target73⟩, ⟨5660, target74⟩, ⟨5667, target75⟩, ⟨5672, target76⟩, ⟨5678, target77⟩, ⟨5684, target78⟩, ⟨5688, target79⟩, ⟨5696, target80⟩, ⟨5698, target81⟩, ⟨5703, target82⟩, ⟨5704, target83⟩, ⟨5705, target84⟩, ⟨5706, target85⟩, ⟨5709, target86⟩, ⟨5721, target87⟩, ⟨5723, target88⟩, ⟨5729, target89⟩, ⟨5731, target90⟩, ⟨5752, target91⟩, ⟨5756, target92⟩, ⟨5760, target93⟩, ⟨5764, target94⟩, ⟨5771, target95⟩, ⟨5778, target96⟩, ⟨5783, target97⟩, ⟨5785, target98⟩, ⟨5790, target99⟩, ⟨5795, target100⟩, ⟨5797, target101⟩, ⟨5799, target102⟩, ⟨5805, target103⟩, ⟨5807, target104⟩, ⟨5809, target105⟩, ⟨5811, target106⟩, ⟨5812, target107⟩, ⟨5813, target108⟩, ⟨5814, target109⟩, ⟨5816, target110⟩, ⟨5820, target111⟩, ⟨5823, target112⟩, ⟨5824, target113⟩, ⟨5828, target114⟩, ⟨5832, target115⟩, ⟨5833, target116⟩, ⟨5834, target117⟩, ⟨5842, target118⟩, ⟨5844, target119⟩, ⟨5845, target120⟩, ⟨5847, target121⟩, ⟨6335, target122⟩, ⟨6357, target123⟩, ⟨6363, target124⟩, ⟨6371, target125⟩, ⟨6377, target126⟩, ⟨6393, target127⟩]
  indexMask := 30532967155428895255590371869080038981996884387608603288005777094389562157246696889835078378499388653235935371508795659232355835518228017563432912040511172214261626906002879746567566200055088098046456549923290215242754445650902873007136068419101509851106886464099352280474826601002451672064520253633178458726558668697217450051823201067488114357860161999122349923421725236627491207531118239551954845466974130288694198568726695596295169443389275930765430298169378763176432234996114313096743182333781806325015405981426870936445688183957408764529817251324340261193455109079484854009343663164863542221316697375105734003075908798132172904330285380420115648280797628327308404697501234007539238012210551284126791030533899193636696472262660462242223971384380893681718742331909654864946625825598154722453488023083371066727681679129112090202136232517350489133235129920474022078137727928779802953439432722794382479396641924992464412819800029399279153064396837328701442068339607918945121509298144508166489059607303676895013389748027101000171417911108254928976077642999132381025321275161957719567859930162726822403759952022440490276462085987354467697146004695854895218770809182852437361888650147132713554904687233511821431777532020893473297722266155162875654353125110341271852749269282243431526923208732468595251966690156246985550376302882581218279594275017096327732561989179453170086909806369827477169154742372818656115711743315182283988807411179557311352386881145467063145814663216138596730313374801635523501080831432280909044574773410462728179898518444286943550311731196408891999650706442873025386020930137399766025354240930710464425635680630868538614672144459398745461335602972154790507477511123957815187530713809783432329723270861463054288511747508487566840088255094593788454596243668086626294521506092491432393321887164738917761683828932402602974789700594601738945590087561901223107503302713976500902098536150000409218838062644068352
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

end FranklSmallCyclic.TransportBatches.G051.B001.Data
