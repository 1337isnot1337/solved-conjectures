module

public import Conjectures.FranklSmallCyclicRowCoverage
public import Conjectures.FranklSmallCyclicCanonicalWords
public import Conjectures.FranklSmallCyclicOrbit8Block016Data

/-! 128 literal targets sharing one source proof block.
Original words and row indices are retained; weights may be transported.
-/
@[expose] public section

namespace FranklSmallCyclic.TransportBatches.G042.B001.Data

-- Period 8, original row 3582, representative 5398.
def source0 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B016.Data.entryAt ⟨34, by decide +kernel⟩

def target0 : Weights.Entry :=
  { word := [4, 2, 0, 9, 8, 10, 2], weights := [1, 1, 0, 1] }

-- Period 8, original row 3587, representative 5474.
def source1 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B016.Data.entryAt ⟨109, by decide +kernel⟩

def target1 : Weights.Entry :=
  { word := [4, 2, 0, 10, 0, 0, 8], weights := [1, 1, 0, 0] }

-- Period 8, original row 3594, representative 5473.
def source2 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B016.Data.entryAt ⟨108, by decide +kernel⟩

def target2 : Weights.Entry :=
  { word := [4, 2, 0, 10, 0, 8, 8], weights := [1, 0, 0, 1] }

-- Period 8, original row 3601, representative 5401.
def source3 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B016.Data.entryAt ⟨37, by decide +kernel⟩

def target3 : Weights.Entry :=
  { word := [4, 2, 0, 12, 10, 0, 1], weights := [1, 1, 0, 1] }

def points3 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 3602, representative 5393.
def source4 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B016.Data.entryAt ⟨29, by decide +kernel⟩

def target4 : Weights.Entry :=
  { word := [4, 2, 0, 12, 10, 0, 2], weights := [1, 1, 0, 1] }

def points4 : List (ℕ × ℕ) := [(0, 1), (1, 2), (2, 0), (3, 3), (4, 5), (5, 6), (6, 4), (7, 7)]

-- Period 8, original row 3604, representative 5475.
def source5 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B016.Data.entryAt ⟨110, by decide +kernel⟩

def target5 : Weights.Entry :=
  { word := [4, 2, 0, 12, 10, 0, 8], weights := [1, 1, 0, 1] }

-- Period 8, original row 3608, representative 5401.
def source6 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B016.Data.entryAt ⟨37, by decide +kernel⟩

def target6 : Weights.Entry :=
  { word := [4, 2, 0, 12, 12, 4, 0], weights := [1, 1, 1, 0] }

def points6 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 5), (4, 6), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 3610, representative 5467.
def source7 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B016.Data.entryAt ⟨102, by decide +kernel⟩

def target7 : Weights.Entry :=
  { word := [4, 2, 8, 2, 0, 1, 8], weights := [1, 0, 0, 1] }

-- Period 8, original row 3612, representative 5459.
def source8 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B016.Data.entryAt ⟨94, by decide +kernel⟩

def target8 : Weights.Entry :=
  { word := [4, 2, 8, 2, 0, 2, 8], weights := [1, 0, 0, 1] }

-- Period 8, original row 3617, representative 5471.
def source9 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B016.Data.entryAt ⟨106, by decide +kernel⟩

def target9 : Weights.Entry :=
  { word := [4, 2, 8, 2, 0, 8, 8], weights := [1, 0, 0, 1] }

-- Period 8, original row 3622, representative 5468.
def source10 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B016.Data.entryAt ⟨103, by decide +kernel⟩

def target10 : Weights.Entry :=
  { word := [4, 2, 8, 2, 0, 9, 8], weights := [1, 0, 0, 1] }

-- Period 8, original row 3624, representative 5460.
def source11 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B016.Data.entryAt ⟨95, by decide +kernel⟩

def target11 : Weights.Entry :=
  { word := [4, 2, 8, 2, 0, 10, 8], weights := [1, 0, 0, 1] }

-- Period 8, original row 3626, representative 5464.
def source12 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B016.Data.entryAt ⟨99, by decide +kernel⟩

def target12 : Weights.Entry :=
  { word := [4, 2, 8, 2, 8, 2, 8], weights := [1, 0, 0, 1] }

-- Period 8, original row 3630, representative 5461.
def source13 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B016.Data.entryAt ⟨96, by decide +kernel⟩

def target13 : Weights.Entry :=
  { word := [4, 2, 8, 2, 8, 10, 8], weights := [1, 0, 0, 1] }

-- Period 8, original row 3631, representative 5370.
def source14 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B016.Data.entryAt ⟨6, by decide +kernel⟩

def target14 : Weights.Entry :=
  { word := [4, 2, 8, 4, 4, 4, 0], weights := [1, 0, 1, 0] }

def points14 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 3632, representative 5366.
def source15 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B016.Data.entryAt ⟨2, by decide +kernel⟩

def target15 : Weights.Entry :=
  { word := [4, 2, 8, 4, 4, 12, 0], weights := [1, 0, 1, 0] }

def points15 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 3633, representative 5371.
def source16 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B016.Data.entryAt ⟨7, by decide +kernel⟩

def target16 : Weights.Entry :=
  { word := [4, 2, 8, 4, 12, 4, 0], weights := [1, 0, 1, 0] }

def points16 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 3634, representative 5367.
def source17 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B016.Data.entryAt ⟨3, by decide +kernel⟩

def target17 : Weights.Entry :=
  { word := [4, 2, 8, 4, 12, 12, 0], weights := [1, 0, 1, 0] }

def points17 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 3636, representative 5365.
def source18 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B016.Data.entryAt ⟨1, by decide +kernel⟩

def target18 : Weights.Entry :=
  { word := [4, 2, 8, 8, 4, 6, 0], weights := [0, 1, 1, 0] }

def points18 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 3639, representative 5364.
def source19 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B016.Data.entryAt ⟨0, by decide +kernel⟩

def target19 : Weights.Entry :=
  { word := [4, 2, 8, 8, 12, 6, 0], weights := [0, 1, 1, 0] }

def points19 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 3642, representative 5470.
def source20 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B016.Data.entryAt ⟨105, by decide +kernel⟩

def target20 : Weights.Entry :=
  { word := [4, 2, 8, 10, 0, 1, 8], weights := [1, 0, 0, 1] }

-- Period 8, original row 3644, representative 5466.
def source21 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B016.Data.entryAt ⟨101, by decide +kernel⟩

def target21 : Weights.Entry :=
  { word := [4, 2, 8, 10, 0, 2, 8], weights := [1, 0, 0, 1] }

-- Period 8, original row 3645, representative 5375.
def source22 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B016.Data.entryAt ⟨11, by decide +kernel⟩

def target22 : Weights.Entry :=
  { word := [4, 2, 8, 10, 0, 6, 0], weights := [0, 1, 1, 0] }

def points22 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 3650, representative 5472.
def source23 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B016.Data.entryAt ⟨107, by decide +kernel⟩

def target23 : Weights.Entry :=
  { word := [4, 2, 8, 10, 0, 8, 8], weights := [1, 0, 0, 1] }

-- Period 8, original row 3655, representative 5469.
def source24 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B016.Data.entryAt ⟨104, by decide +kernel⟩

def target24 : Weights.Entry :=
  { word := [4, 2, 8, 10, 0, 9, 8], weights := [1, 0, 0, 1] }

-- Period 8, original row 3657, representative 5463.
def source25 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B016.Data.entryAt ⟨98, by decide +kernel⟩

def target25 : Weights.Entry :=
  { word := [4, 2, 8, 10, 0, 10, 8], weights := [1, 0, 0, 1] }

-- Period 8, original row 3658, representative 5376.
def source26 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B016.Data.entryAt ⟨12, by decide +kernel⟩

def target26 : Weights.Entry :=
  { word := [4, 2, 8, 10, 0, 12, 0], weights := [0, 1, 1, 0] }

def points26 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 3660, representative 5465.
def source27 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B016.Data.entryAt ⟨100, by decide +kernel⟩

def target27 : Weights.Entry :=
  { word := [4, 2, 8, 10, 8, 2, 8], weights := [1, 0, 0, 1] }

-- Period 8, original row 3661, representative 5374.
def source28 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B016.Data.entryAt ⟨10, by decide +kernel⟩

def target28 : Weights.Entry :=
  { word := [4, 2, 8, 10, 8, 6, 0], weights := [0, 1, 1, 0] }

def points28 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 3666, representative 5462.
def source29 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B016.Data.entryAt ⟨97, by decide +kernel⟩

def target29 : Weights.Entry :=
  { word := [4, 2, 8, 10, 8, 10, 8], weights := [1, 0, 0, 1] }

-- Period 8, original row 3669, representative 5373.
def source30 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B016.Data.entryAt ⟨9, by decide +kernel⟩

def target30 : Weights.Entry :=
  { word := [4, 2, 8, 12, 4, 4, 0], weights := [0, 1, 1, 0] }

def points30 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 3671, representative 5369.
def source31 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B016.Data.entryAt ⟨5, by decide +kernel⟩

def target31 : Weights.Entry :=
  { word := [4, 2, 8, 12, 4, 12, 0], weights := [0, 1, 1, 0] }

def points31 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 3673, representative 5372.
def source32 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B016.Data.entryAt ⟨8, by decide +kernel⟩

def target32 : Weights.Entry :=
  { word := [4, 2, 8, 12, 12, 4, 0], weights := [0, 1, 1, 0] }

def points32 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 3675, representative 5368.
def source33 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B016.Data.entryAt ⟨4, by decide +kernel⟩

def target33 : Weights.Entry :=
  { word := [4, 2, 8, 12, 12, 12, 0], weights := [0, 1, 1, 0] }

def points33 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 3681, representative 5455.
def source34 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B016.Data.entryAt ⟨90, by decide +kernel⟩

def target34 : Weights.Entry :=
  { word := [4, 4, 8, 0, 1, 4, 8], weights := [0, 0, 1, 0] }

-- Period 8, original row 3682, representative 5415.
def source35 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B016.Data.entryAt ⟨51, by decide +kernel⟩

def target35 : Weights.Entry :=
  { word := [4, 4, 8, 0, 1, 12, 8], weights := [0, 0, 1, 0] }

-- Period 8, original row 3683, representative 5400.
def source36 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B016.Data.entryAt ⟨36, by decide +kernel⟩

def target36 : Weights.Entry :=
  { word := [4, 4, 8, 8, 1, 4, 2], weights := [1, 0, 1, 1] }

def points36 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 1), (3, 6), (4, 4), (5, 3), (6, 5), (7, 2)]

-- Period 8, original row 3685, representative 5457.
def source37 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B016.Data.entryAt ⟨92, by decide +kernel⟩

def target37 : Weights.Entry :=
  { word := [4, 4, 8, 8, 1, 4, 8], weights := [1, 1, 1, 0] }

def points37 : List (ℕ × ℕ) := [(0, 7), (1, 0), (2, 2), (3, 5), (4, 3), (5, 4), (6, 6), (7, 1)]

-- Period 8, original row 3690, representative 5416.
def source38 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B016.Data.entryAt ⟨52, by decide +kernel⟩

def target38 : Weights.Entry :=
  { word := [4, 4, 8, 8, 1, 12, 8], weights := [0, 0, 1, 0] }

-- Period 8, original row 3697, representative 5479.
def source39 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B016.Data.entryAt ⟨114, by decide +kernel⟩

def target39 : Weights.Entry :=
  { word := [4, 4, 8, 8, 4, 6, 0], weights := [0, 1, 1, 0] }

def points39 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 3706, representative 5478.
def source40 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B016.Data.entryAt ⟨113, by decide +kernel⟩

def target40 : Weights.Entry :=
  { word := [4, 4, 8, 8, 12, 6, 0], weights := [0, 1, 1, 0] }

def points40 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 3736, representative 5421.
def source41 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B016.Data.entryAt ⟨57, by decide +kernel⟩

def target41 : Weights.Entry :=
  { word := [4, 8, 0, 4, 4, 4, 8], weights := [1, 0, 0, 1] }

-- Period 8, original row 3743, representative 5425.
def source42 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B016.Data.entryAt ⟨61, by decide +kernel⟩

def target42 : Weights.Entry :=
  { word := [4, 8, 0, 4, 8, 4, 8], weights := [1, 0, 1, 0] }

-- Period 8, original row 3747, representative 5406.
def source43 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B016.Data.entryAt ⟨42, by decide +kernel⟩

def target43 : Weights.Entry :=
  { word := [4, 8, 0, 4, 8, 12, 8], weights := [1, 0, 1, 0] }

-- Period 8, original row 3762, representative 5422.
def source44 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B016.Data.entryAt ⟨58, by decide +kernel⟩

def target44 : Weights.Entry :=
  { word := [4, 8, 0, 4, 12, 4, 8], weights := [1, 0, 0, 1] }

-- Period 8, original row 3780, representative 5424.
def source45 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B016.Data.entryAt ⟨60, by decide +kernel⟩

def target45 : Weights.Entry :=
  { word := [4, 8, 0, 12, 4, 4, 8], weights := [1, 0, 0, 1] }

-- Period 8, original row 3786, representative 5426.
def source46 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B016.Data.entryAt ⟨62, by decide +kernel⟩

def target46 : Weights.Entry :=
  { word := [4, 8, 0, 12, 8, 4, 8], weights := [1, 0, 1, 0] }

-- Period 8, original row 3790, representative 5407.
def source47 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B016.Data.entryAt ⟨43, by decide +kernel⟩

def target47 : Weights.Entry :=
  { word := [4, 8, 0, 12, 8, 12, 8], weights := [1, 0, 1, 0] }

-- Period 8, original row 3805, representative 5423.
def source48 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B016.Data.entryAt ⟨59, by decide +kernel⟩

def target48 : Weights.Entry :=
  { word := [4, 8, 0, 12, 12, 4, 8], weights := [1, 0, 0, 1] }

-- Period 8, original row 3882, representative 5417.
def source49 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B016.Data.entryAt ⟨53, by decide +kernel⟩

def target49 : Weights.Entry :=
  { word := [4, 8, 8, 4, 4, 4, 8], weights := [1, 0, 0, 1] }

-- Period 8, original row 3883, representative 5486.
def source50 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B016.Data.entryAt ⟨121, by decide +kernel⟩

def target50 : Weights.Entry :=
  { word := [4, 8, 8, 4, 4, 12, 0], weights := [1, 0, 0, 1] }

def points50 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 3884, representative 5402.
def source51 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B016.Data.entryAt ⟨38, by decide +kernel⟩

def target51 : Weights.Entry :=
  { word := [4, 8, 8, 4, 4, 12, 8], weights := [1, 0, 0, 1] }

-- Period 8, original row 3890, representative 5418.
def source52 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B016.Data.entryAt ⟨54, by decide +kernel⟩

def target52 : Weights.Entry :=
  { word := [4, 8, 8, 4, 12, 4, 8], weights := [1, 0, 0, 1] }

-- Period 8, original row 3891, representative 5487.
def source53 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B016.Data.entryAt ⟨122, by decide +kernel⟩

def target53 : Weights.Entry :=
  { word := [4, 8, 8, 4, 12, 12, 0], weights := [1, 0, 0, 1] }

def points53 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 3892, representative 5403.
def source54 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B016.Data.entryAt ⟨39, by decide +kernel⟩

def target54 : Weights.Entry :=
  { word := [4, 8, 8, 4, 12, 12, 8], weights := [1, 0, 0, 1] }

-- Period 8, original row 3893, representative 5481.
def source55 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B016.Data.entryAt ⟨116, by decide +kernel⟩

def target55 : Weights.Entry :=
  { word := [4, 8, 8, 8, 4, 6, 0], weights := [0, 1, 1, 0] }

def points55 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 3898, representative 5480.
def source56 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B016.Data.entryAt ⟨115, by decide +kernel⟩

def target56 : Weights.Entry :=
  { word := [4, 8, 8, 8, 12, 6, 0], weights := [0, 1, 1, 0] }

def points56 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 3904, representative 5420.
def source57 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B016.Data.entryAt ⟨56, by decide +kernel⟩

def target57 : Weights.Entry :=
  { word := [4, 8, 8, 12, 4, 4, 8], weights := [1, 0, 0, 1] }

-- Period 8, original row 3905, representative 5489.
def source58 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B016.Data.entryAt ⟨124, by decide +kernel⟩

def target58 : Weights.Entry :=
  { word := [4, 8, 8, 12, 4, 12, 0], weights := [0, 1, 1, 0] }

def points58 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 3906, representative 5405.
def source59 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B016.Data.entryAt ⟨41, by decide +kernel⟩

def target59 : Weights.Entry :=
  { word := [4, 8, 8, 12, 4, 12, 8], weights := [1, 0, 0, 1] }

-- Period 8, original row 3911, representative 5419.
def source60 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B016.Data.entryAt ⟨55, by decide +kernel⟩

def target60 : Weights.Entry :=
  { word := [4, 8, 8, 12, 12, 4, 8], weights := [1, 0, 0, 1] }

-- Period 8, original row 3912, representative 5488.
def source61 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B016.Data.entryAt ⟨123, by decide +kernel⟩

def target61 : Weights.Entry :=
  { word := [4, 8, 8, 12, 12, 12, 0], weights := [0, 1, 1, 0] }

def points61 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 3913, representative 5404.
def source62 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B016.Data.entryAt ⟨40, by decide +kernel⟩

def target62 : Weights.Entry :=
  { word := [4, 8, 8, 12, 12, 12, 8], weights := [1, 0, 0, 1] }

-- Period 8, original row 4046, representative 5451.
def source63 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B016.Data.entryAt ⟨86, by decide +kernel⟩

def target63 : Weights.Entry :=
  { word := [4, 12, 8, 0, 1, 4, 8], weights := [0, 0, 1, 0] }

-- Period 8, original row 4047, representative 5413.
def source64 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B016.Data.entryAt ⟨49, by decide +kernel⟩

def target64 : Weights.Entry :=
  { word := [4, 12, 8, 0, 1, 12, 8], weights := [0, 0, 1, 0] }

-- Period 8, original row 4048, representative 5398.
def source65 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B016.Data.entryAt ⟨34, by decide +kernel⟩

def target65 : Weights.Entry :=
  { word := [4, 12, 8, 8, 1, 4, 2], weights := [1, 0, 1, 1] }

def points65 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 4050, representative 5452.
def source66 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B016.Data.entryAt ⟨87, by decide +kernel⟩

def target66 : Weights.Entry :=
  { word := [4, 12, 8, 8, 1, 4, 8], weights := [0, 0, 1, 0] }

-- Period 8, original row 4055, representative 5414.
def source67 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B016.Data.entryAt ⟨50, by decide +kernel⟩

def target67 : Weights.Entry :=
  { word := [4, 12, 8, 8, 1, 12, 8], weights := [0, 0, 1, 0] }

-- Period 8, original row 4062, representative 5477.
def source68 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B016.Data.entryAt ⟨112, by decide +kernel⟩

def target68 : Weights.Entry :=
  { word := [4, 12, 8, 8, 4, 6, 0], weights := [0, 1, 1, 0] }

def points68 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 4071, representative 5476.
def source69 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B016.Data.entryAt ⟨111, by decide +kernel⟩

def target69 : Weights.Entry :=
  { word := [4, 12, 8, 8, 12, 6, 0], weights := [0, 1, 1, 0] }

def points69 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 4109, representative 5446.
def source70 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B016.Data.entryAt ⟨82, by decide +kernel⟩

def target70 : Weights.Entry :=
  { word := [8, 0, 0, 9, 12, 4, 4], weights := [1, 0, 1, 1] }

def points70 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 4115, representative 5474.
def source71 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B016.Data.entryAt ⟨109, by decide +kernel⟩

def target71 : Weights.Entry :=
  { word := [8, 0, 0, 12, 0, 4, 2], weights := [0, 0, 1, 1] }

def points71 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 7), (3, 5), (4, 6), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 4116, representative 5442.
def source72 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B016.Data.entryAt ⟨78, by decide +kernel⟩

def target72 : Weights.Entry :=
  { word := [8, 0, 0, 12, 0, 4, 4], weights := [0, 0, 1, 1] }

def points72 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 4137, representative 5467.
def source73 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B016.Data.entryAt ⟨102, by decide +kernel⟩

def target73 : Weights.Entry :=
  { word := [8, 0, 1, 4, 8, 4, 2], weights := [1, 0, 1, 0] }

def points73 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 7), (3, 5), (4, 6), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 4138, representative 5435.
def source74 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B016.Data.entryAt ⟨71, by decide +kernel⟩

def target74 : Weights.Entry :=
  { word := [8, 0, 1, 4, 8, 4, 4], weights := [1, 0, 0, 1] }

def points74 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 4173, representative 5470.
def source75 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B016.Data.entryAt ⟨105, by decide +kernel⟩

def target75 : Weights.Entry :=
  { word := [8, 0, 1, 12, 8, 4, 2], weights := [1, 0, 1, 0] }

def points75 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 7), (3, 5), (4, 6), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 4174, representative 5438.
def source76 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B016.Data.entryAt ⟨74, by decide +kernel⟩

def target76 : Weights.Entry :=
  { word := [8, 0, 1, 12, 8, 4, 4], weights := [1, 0, 0, 1] }

def points76 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 4305, representative 5457.
def source77 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B016.Data.entryAt ⟨92, by decide +kernel⟩

def target77 : Weights.Entry :=
  { word := [8, 0, 4, 10, 8, 4, 4], weights := [0, 1, 1, 1] }

def points77 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 4364, representative 5449.
def source78 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B016.Data.entryAt ⟨85, by decide +kernel⟩

def target78 : Weights.Entry :=
  { word := [8, 0, 8, 9, 4, 4, 4], weights := [1, 0, 1, 1] }

def points78 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 4368, representative 5445.
def source79 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B016.Data.entryAt ⟨81, by decide +kernel⟩

def target79 : Weights.Entry :=
  { word := [8, 0, 8, 9, 12, 4, 4], weights := [1, 0, 1, 1] }

def points79 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 4461, representative 5475.
def source80 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B016.Data.entryAt ⟨110, by decide +kernel⟩

def target80 : Weights.Entry :=
  { word := [8, 0, 12, 10, 0, 4, 2], weights := [1, 0, 1, 1] }

def points80 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 4462, representative 5458.
def source81 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B016.Data.entryAt ⟨93, by decide +kernel⟩

def target81 : Weights.Entry :=
  { word := [8, 0, 12, 10, 0, 4, 4], weights := [1, 0, 1, 1] }

def points81 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 4481, representative 5456.
def source82 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B016.Data.entryAt ⟨91, by decide +kernel⟩

def target82 : Weights.Entry :=
  { word := [8, 0, 12, 10, 8, 4, 4], weights := [0, 1, 1, 1] }

def points82 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 4670, representative 5455.
def source83 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B016.Data.entryAt ⟨90, by decide +kernel⟩

def target83 : Weights.Entry :=
  { word := [8, 2, 0, 1, 8, 2, 2], weights := [0, 1, 0, 0] }

def points83 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 4677, representative 5451.
def source84 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B016.Data.entryAt ⟨86, by decide +kernel⟩

def target84 : Weights.Entry :=
  { word := [8, 2, 0, 1, 8, 10, 2], weights := [0, 1, 0, 0] }

def points84 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 4707, representative 5457.
def source85 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B016.Data.entryAt ⟨92, by decide +kernel⟩

def target85 : Weights.Entry :=
  { word := [8, 2, 0, 9, 8, 2, 2], weights := [0, 1, 1, 1] }

def points85 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 7), (3, 4), (4, 6), (5, 5), (6, 3), (7, 0)]

-- Period 8, original row 4717, representative 5452.
def source86 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B016.Data.entryAt ⟨87, by decide +kernel⟩

def target86 : Weights.Entry :=
  { word := [8, 2, 0, 9, 8, 10, 2], weights := [0, 1, 0, 0] }

def points86 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 4723, representative 5442.
def source87 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B016.Data.entryAt ⟨78, by decide +kernel⟩

def target87 : Weights.Entry :=
  { word := [8, 2, 0, 10, 0, 0, 2], weights := [0, 1, 0, 1] }

def points87 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 7), (3, 4), (4, 6), (5, 5), (6, 3), (7, 0)]

-- Period 8, original row 4750, representative 5446.
def source88 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B016.Data.entryAt ⟨82, by decide +kernel⟩

def target88 : Weights.Entry :=
  { word := [8, 2, 0, 12, 10, 0, 2], weights := [1, 1, 0, 1] }

def points88 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 7), (3, 4), (4, 6), (5, 5), (6, 3), (7, 0)]

-- Period 8, original row 4763, representative 5421.
def source89 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B016.Data.entryAt ⟨57, by decide +kernel⟩

def target89 : Weights.Entry :=
  { word := [8, 2, 2, 2, 0, 8, 2], weights := [1, 0, 0, 1] }

def points89 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 4774, representative 5427.
def source90 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B016.Data.entryAt ⟨63, by decide +kernel⟩

def target90 : Weights.Entry :=
  { word := [8, 2, 2, 2, 8, 0, 2], weights := [1, 1, 0, 0] }

def points90 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 7), (3, 4), (4, 6), (5, 5), (6, 3), (7, 0)]

-- Period 8, original row 4786, representative 5417.
def source91 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B016.Data.entryAt ⟨53, by decide +kernel⟩

def target91 : Weights.Entry :=
  { word := [8, 2, 2, 2, 8, 8, 2], weights := [1, 0, 0, 1] }

def points91 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 4802, representative 5424.
def source92 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B016.Data.entryAt ⟨60, by decide +kernel⟩

def target92 : Weights.Entry :=
  { word := [8, 2, 2, 10, 0, 8, 2], weights := [1, 0, 0, 1] }

def points92 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 4814, representative 5434.
def source93 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B016.Data.entryAt ⟨70, by decide +kernel⟩

def target93 : Weights.Entry :=
  { word := [8, 2, 2, 10, 8, 0, 2], weights := [1, 1, 0, 0] }

def points93 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 7), (3, 4), (4, 6), (5, 5), (6, 3), (7, 0)]

-- Period 8, original row 4831, representative 5420.
def source94 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B016.Data.entryAt ⟨56, by decide +kernel⟩

def target94 : Weights.Entry :=
  { word := [8, 2, 2, 10, 8, 8, 2], weights := [1, 0, 0, 1] }

def points94 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 4853, representative 5425.
def source95 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B016.Data.entryAt ⟨61, by decide +kernel⟩

def target95 : Weights.Entry :=
  { word := [8, 2, 8, 2, 0, 8, 2], weights := [0, 1, 0, 1] }

def points95 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 4894, representative 5426.
def source96 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B016.Data.entryAt ⟨62, by decide +kernel⟩

def target96 : Weights.Entry :=
  { word := [8, 2, 8, 10, 0, 8, 2], weights := [0, 1, 0, 1] }

def points96 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 4931, representative 5422.
def source97 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B016.Data.entryAt ⟨58, by decide +kernel⟩

def target97 : Weights.Entry :=
  { word := [8, 2, 10, 2, 0, 8, 2], weights := [1, 0, 0, 1] }

def points97 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 4947, representative 5418.
def source98 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B016.Data.entryAt ⟨54, by decide +kernel⟩

def target98 : Weights.Entry :=
  { word := [8, 2, 10, 2, 8, 8, 2], weights := [1, 0, 0, 1] }

def points98 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 4964, representative 5423.
def source99 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B016.Data.entryAt ⟨59, by decide +kernel⟩

def target99 : Weights.Entry :=
  { word := [8, 2, 10, 10, 0, 8, 2], weights := [1, 0, 0, 1] }

def points99 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 4986, representative 5419.
def source100 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B016.Data.entryAt ⟨55, by decide +kernel⟩

def target100 : Weights.Entry :=
  { word := [8, 2, 10, 10, 8, 8, 2], weights := [1, 0, 0, 1] }

def points100 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 5016, representative 5459.
def source101 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B016.Data.entryAt ⟨94, by decide +kernel⟩

def target101 : Weights.Entry :=
  { word := [8, 4, 0, 4, 8, 4, 2], weights := [1, 0, 0, 1] }

def points101 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 5017, representative 5427.
def source102 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B016.Data.entryAt ⟨63, by decide +kernel⟩

def target102 : Weights.Entry :=
  { word := [8, 4, 0, 4, 8, 4, 4], weights := [1, 0, 0, 1] }

def points102 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 5052, representative 5466.
def source103 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B016.Data.entryAt ⟨101, by decide +kernel⟩

def target103 : Weights.Entry :=
  { word := [8, 4, 0, 12, 8, 4, 2], weights := [1, 0, 0, 1] }

def points103 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 5053, representative 5434.
def source104 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B016.Data.entryAt ⟨70, by decide +kernel⟩

def target104 : Weights.Entry :=
  { word := [8, 4, 0, 12, 8, 4, 4], weights := [1, 0, 0, 1] }

def points104 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 5173, representative 5464.
def source105 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B016.Data.entryAt ⟨99, by decide +kernel⟩

def target105 : Weights.Entry :=
  { word := [8, 4, 8, 4, 8, 4, 2], weights := [1, 0, 0, 1] }

def points105 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 5174, representative 5432.
def source106 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B016.Data.entryAt ⟨68, by decide +kernel⟩

def target106 : Weights.Entry :=
  { word := [8, 4, 8, 4, 8, 4, 4], weights := [1, 0, 0, 1] }

def points106 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 5215, representative 5465.
def source107 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B016.Data.entryAt ⟨100, by decide +kernel⟩

def target107 : Weights.Entry :=
  { word := [8, 4, 8, 12, 8, 4, 2], weights := [1, 0, 0, 1] }

def points107 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 5216, representative 5433.
def source108 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B016.Data.entryAt ⟨69, by decide +kernel⟩

def target108 : Weights.Entry :=
  { word := [8, 4, 8, 12, 8, 4, 4], weights := [1, 0, 0, 1] }

def points108 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 5359, representative 5471.
def source109 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B016.Data.entryAt ⟨106, by decide +kernel⟩

def target109 : Weights.Entry :=
  { word := [8, 8, 0, 4, 8, 4, 2], weights := [1, 0, 0, 1] }

def points109 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 5360, representative 5439.
def source110 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B016.Data.entryAt ⟨75, by decide +kernel⟩

def target110 : Weights.Entry :=
  { word := [8, 8, 0, 4, 8, 4, 4], weights := [1, 0, 0, 1] }

def points110 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 5385, representative 5448.
def source111 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B016.Data.entryAt ⟨84, by decide +kernel⟩

def target111 : Weights.Entry :=
  { word := [8, 8, 0, 9, 4, 4, 4], weights := [1, 1, 1, 1] }

def points111 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 5389, representative 5444.
def source112 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B016.Data.entryAt ⟨80, by decide +kernel⟩

def target112 : Weights.Entry :=
  { word := [8, 8, 0, 9, 12, 4, 4], weights := [1, 1, 1, 1] }

def points112 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 5397, representative 5473.
def source113 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B016.Data.entryAt ⟨108, by decide +kernel⟩

def target113 : Weights.Entry :=
  { word := [8, 8, 0, 12, 0, 4, 2], weights := [1, 0, 0, 1] }

def points113 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 5398, representative 5441.
def source114 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B016.Data.entryAt ⟨77, by decide +kernel⟩

def target114 : Weights.Entry :=
  { word := [8, 8, 0, 12, 0, 4, 4], weights := [1, 0, 0, 1] }

def points114 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 5422, representative 5472.
def source115 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B016.Data.entryAt ⟨107, by decide +kernel⟩

def target115 : Weights.Entry :=
  { word := [8, 8, 0, 12, 8, 4, 2], weights := [1, 0, 0, 1] }

def points115 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 5423, representative 5440.
def source116 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B016.Data.entryAt ⟨76, by decide +kernel⟩

def target116 : Weights.Entry :=
  { word := [8, 8, 0, 12, 8, 4, 4], weights := [1, 0, 0, 1] }

def points116 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 5458, representative 5468.
def source117 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B016.Data.entryAt ⟨103, by decide +kernel⟩

def target117 : Weights.Entry :=
  { word := [8, 8, 1, 4, 8, 4, 2], weights := [1, 0, 0, 1] }

def points117 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 5459, representative 5436.
def source118 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B016.Data.entryAt ⟨72, by decide +kernel⟩

def target118 : Weights.Entry :=
  { word := [8, 8, 1, 4, 8, 4, 4], weights := [1, 0, 0, 1] }

def points118 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 5494, representative 5469.
def source119 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B016.Data.entryAt ⟨104, by decide +kernel⟩

def target119 : Weights.Entry :=
  { word := [8, 8, 1, 12, 8, 4, 2], weights := [1, 0, 0, 1] }

def points119 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 5495, representative 5437.
def source120 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B016.Data.entryAt ⟨73, by decide +kernel⟩

def target120 : Weights.Entry :=
  { word := [8, 8, 1, 12, 8, 4, 4], weights := [1, 0, 0, 1] }

def points120 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 5628, representative 5454.
def source121 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B016.Data.entryAt ⟨89, by decide +kernel⟩

def target121 : Weights.Entry :=
  { word := [8, 8, 4, 10, 8, 4, 4], weights := [1, 1, 1, 1] }

def points121 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 5713, representative 5447.
def source122 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B016.Data.entryAt ⟨83, by decide +kernel⟩

def target122 : Weights.Entry :=
  { word := [8, 8, 8, 9, 4, 4, 4], weights := [1, 1, 1, 1] }

def points122 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 5717, representative 5443.
def source123 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B016.Data.entryAt ⟨79, by decide +kernel⟩

def target123 : Weights.Entry :=
  { word := [8, 8, 8, 9, 12, 4, 4], weights := [1, 1, 1, 1] }

def points123 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 5835, representative 5453.
def source124 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B016.Data.entryAt ⟨88, by decide +kernel⟩

def target124 : Weights.Entry :=
  { word := [8, 8, 12, 10, 8, 4, 4], weights := [1, 1, 1, 1] }

def points124 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 6064, representative 5415.
def source125 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B016.Data.entryAt ⟨51, by decide +kernel⟩

def target125 : Weights.Entry :=
  { word := [8, 10, 0, 1, 8, 2, 2], weights := [0, 1, 0, 0] }

def points125 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 6071, representative 5413.
def source126 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B016.Data.entryAt ⟨49, by decide +kernel⟩

def target126 : Weights.Entry :=
  { word := [8, 10, 0, 1, 8, 10, 2], weights := [0, 1, 0, 0] }

def points126 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 6101, representative 5416.
def source127 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B016.Data.entryAt ⟨52, by decide +kernel⟩

def target127 : Weights.Entry :=
  { word := [8, 10, 0, 9, 8, 2, 2], weights := [0, 1, 0, 0] }

def points127 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

def period8Entries : List Weights.Entry := [target0, target1, target2, target3, target4, target5, target6, target7, target8, target9, target10, target11, target12, target13, target14, target15, target16, target17, target18, target19, target20, target21, target22, target23, target24, target25, target26, target27, target28, target29, target30, target31, target32, target33, target34, target35, target36, target37, target38, target39, target40, target41, target42, target43, target44, target45, target46, target47, target48, target49, target50, target51, target52, target53, target54, target55, target56, target57, target58, target59, target60, target61, target62, target63, target64, target65, target66, target67, target68, target69, target70, target71, target72, target73, target74, target75, target76, target77, target78, target79, target80, target81, target82, target83, target84, target85, target86, target87, target88, target89, target90, target91, target92, target93, target94, target95, target96, target97, target98, target99, target100, target101, target102, target103, target104, target105, target106, target107, target108, target109, target110, target111, target112, target113, target114, target115, target116, target117, target118, target119, target120, target121, target122, target123, target124, target125, target126, target127]

def period8Chunk : RowCoverage.Chunk where
  rows := [⟨3582, target0⟩, ⟨3587, target1⟩, ⟨3594, target2⟩, ⟨3601, target3⟩, ⟨3602, target4⟩, ⟨3604, target5⟩, ⟨3608, target6⟩, ⟨3610, target7⟩, ⟨3612, target8⟩, ⟨3617, target9⟩, ⟨3622, target10⟩, ⟨3624, target11⟩, ⟨3626, target12⟩, ⟨3630, target13⟩, ⟨3631, target14⟩, ⟨3632, target15⟩, ⟨3633, target16⟩, ⟨3634, target17⟩, ⟨3636, target18⟩, ⟨3639, target19⟩, ⟨3642, target20⟩, ⟨3644, target21⟩, ⟨3645, target22⟩, ⟨3650, target23⟩, ⟨3655, target24⟩, ⟨3657, target25⟩, ⟨3658, target26⟩, ⟨3660, target27⟩, ⟨3661, target28⟩, ⟨3666, target29⟩, ⟨3669, target30⟩, ⟨3671, target31⟩, ⟨3673, target32⟩, ⟨3675, target33⟩, ⟨3681, target34⟩, ⟨3682, target35⟩, ⟨3683, target36⟩, ⟨3685, target37⟩, ⟨3690, target38⟩, ⟨3697, target39⟩, ⟨3706, target40⟩, ⟨3736, target41⟩, ⟨3743, target42⟩, ⟨3747, target43⟩, ⟨3762, target44⟩, ⟨3780, target45⟩, ⟨3786, target46⟩, ⟨3790, target47⟩, ⟨3805, target48⟩, ⟨3882, target49⟩, ⟨3883, target50⟩, ⟨3884, target51⟩, ⟨3890, target52⟩, ⟨3891, target53⟩, ⟨3892, target54⟩, ⟨3893, target55⟩, ⟨3898, target56⟩, ⟨3904, target57⟩, ⟨3905, target58⟩, ⟨3906, target59⟩, ⟨3911, target60⟩, ⟨3912, target61⟩, ⟨3913, target62⟩, ⟨4046, target63⟩, ⟨4047, target64⟩, ⟨4048, target65⟩, ⟨4050, target66⟩, ⟨4055, target67⟩, ⟨4062, target68⟩, ⟨4071, target69⟩, ⟨4109, target70⟩, ⟨4115, target71⟩, ⟨4116, target72⟩, ⟨4137, target73⟩, ⟨4138, target74⟩, ⟨4173, target75⟩, ⟨4174, target76⟩, ⟨4305, target77⟩, ⟨4364, target78⟩, ⟨4368, target79⟩, ⟨4461, target80⟩, ⟨4462, target81⟩, ⟨4481, target82⟩, ⟨4670, target83⟩, ⟨4677, target84⟩, ⟨4707, target85⟩, ⟨4717, target86⟩, ⟨4723, target87⟩, ⟨4750, target88⟩, ⟨4763, target89⟩, ⟨4774, target90⟩, ⟨4786, target91⟩, ⟨4802, target92⟩, ⟨4814, target93⟩, ⟨4831, target94⟩, ⟨4853, target95⟩, ⟨4894, target96⟩, ⟨4931, target97⟩, ⟨4947, target98⟩, ⟨4964, target99⟩, ⟨4986, target100⟩, ⟨5016, target101⟩, ⟨5017, target102⟩, ⟨5052, target103⟩, ⟨5053, target104⟩, ⟨5173, target105⟩, ⟨5174, target106⟩, ⟨5215, target107⟩, ⟨5216, target108⟩, ⟨5359, target109⟩, ⟨5360, target110⟩, ⟨5385, target111⟩, ⟨5389, target112⟩, ⟨5397, target113⟩, ⟨5398, target114⟩, ⟨5422, target115⟩, ⟨5423, target116⟩, ⟨5458, target117⟩, ⟨5459, target118⟩, ⟨5494, target119⟩, ⟨5495, target120⟩, ⟨5628, target121⟩, ⟨5713, target122⟩, ⟨5717, target123⟩, ⟨5835, target124⟩, ⟨6064, target125⟩, ⟨6071, target126⟩, ⟨6101, target127⟩]
  indexMask := 3837103787772967965228282784673808616046560444725120382466123453221118834864846808769552408100547496328450284426853525969757643258176023527490038255424441036487542997191783200865744958418281931230687771213500808630628737705359802696358682588949942048727548853064412291034799201479246324207839376807920400061966643883246925957148896461818877271516912169158970020174352231466622042468585395332544677672304152920486326630588715626354799268980369742037860859683833120613644846319029935700217702898772833004018899179470291144254494750297870667466312966087058149692313670368522926602370694395388580357338251139265054816688859876308917795880161824335118115947731206846602262660691905634060524574275946892435024043361667293489710879055351906134868224932682144360147132088338664775258047980315986494102937796116439852998556416327075248087471374999438292268661010409569038392846584836373938786136277965778480199633422163175626950000180164091805095145858052478008091328976294064160830000462132009568398184668405715980366845408291968036264869828703690961955446539947154721030849464369364881623522458928488358260681881198201389933587389683925543675813374877150782171572835734149666602535179866522534062080530517871507907604699748739846525606266500290863285959735048798190616504055974703083907137919995900989789826709280678389853779101869628507186635235766629938068494730907379870586918897195400257695364349273251950426340349459827553204881703906892988977017275847296792849898462074157095204549860999265827929044361646365258496515567036654795432022321751238917098327099378916954586402456517608914067833700190644409710424810546530865090286379765638654385627963355650639546733661759248169494117266341282649616891346896226432366227636345006750267912607354908379192421881776849628698588248421420924304917680740925071821561133360615780791360239669851717632
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

end FranklSmallCyclic.TransportBatches.G042.B001.Data
