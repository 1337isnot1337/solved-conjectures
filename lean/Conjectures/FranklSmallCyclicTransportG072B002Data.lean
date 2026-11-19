module

public import Conjectures.FranklSmallCyclicRowCoverage
public import Conjectures.FranklSmallCyclicCanonicalWords
public import Conjectures.FranklSmallCyclicOrbit9Block019Data

/-! 128 literal targets sharing one source proof block.
Original words and row indices are retained; weights may be transported.
-/
@[expose] public section

namespace FranklSmallCyclic.TransportBatches.G072.B002.Data

-- Period 9, original row 5489, representative 9264.
def source0 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B019.Data.entryAt ⟨81, by decide +kernel⟩

def target0 : Weights.Entry :=
  { word := [8, 8, 1, 12, 2, 8, 8], weights := [1, 0, 1, 0] }

-- Period 9, original row 5505, representative 9277.
def source1 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B019.Data.entryAt ⟨94, by decide +kernel⟩

def target1 : Weights.Entry :=
  { word := [8, 8, 1, 12, 10, 0, 8], weights := [1, 0, 0, 1] }

def points1 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 5511, representative 9263.
def source2 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B019.Data.entryAt ⟨80, by decide +kernel⟩

def target2 : Weights.Entry :=
  { word := [8, 8, 1, 12, 10, 8, 8], weights := [1, 0, 1, 0] }

-- Period 9, original row 5527, representative 9292.
def source3 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B019.Data.entryAt ⟨109, by decide +kernel⟩

def target3 : Weights.Entry :=
  { word := [8, 8, 2, 2, 2, 8, 8], weights := [1, 0, 0, 1] }

-- Period 9, original row 5542, representative 9297.
def source4 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B019.Data.entryAt ⟨114, by decide +kernel⟩

def target4 : Weights.Entry :=
  { word := [8, 8, 2, 2, 10, 8, 8], weights := [1, 0, 0, 1] }

-- Period 9, original row 5556, representative 9299.
def source5 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B019.Data.entryAt ⟨116, by decide +kernel⟩

def target5 : Weights.Entry :=
  { word := [8, 8, 2, 10, 2, 8, 8], weights := [0, 1, 1, 0] }

-- Period 9, original row 5570, representative 9298.
def source6 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B019.Data.entryAt ⟨115, by decide +kernel⟩

def target6 : Weights.Entry :=
  { word := [8, 8, 2, 10, 10, 8, 8], weights := [0, 1, 1, 0] }

-- Period 9, original row 5587, representative 9257.
def source7 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B019.Data.entryAt ⟨74, by decide +kernel⟩

def target7 : Weights.Entry :=
  { word := [8, 8, 4, 2, 0, 9, 8], weights := [0, 1, 0, 1] }

def points7 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 5589, representative 9257.
def source8 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B019.Data.entryAt ⟨74, by decide +kernel⟩

def target8 : Weights.Entry :=
  { word := [8, 8, 4, 2, 0, 10, 8], weights := [0, 1, 0, 1] }

def points8 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 5595, representative 9258.
def source9 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B019.Data.entryAt ⟨75, by decide +kernel⟩

def target9 : Weights.Entry :=
  { word := [8, 8, 4, 2, 8, 10, 8], weights := [1, 0, 0, 1] }

-- Period 9, original row 5597, representative 9304.
def source10 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B019.Data.entryAt ⟨121, by decide +kernel⟩

def target10 : Weights.Entry :=
  { word := [8, 8, 4, 4, 4, 0, 8], weights := [1, 0, 0, 1] }

def points10 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 5599, representative 9292.
def source11 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B019.Data.entryAt ⟨109, by decide +kernel⟩

def target11 : Weights.Entry :=
  { word := [8, 8, 4, 4, 4, 8, 8], weights := [1, 0, 0, 1] }

def points11 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 5601, representative 9305.
def source12 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B019.Data.entryAt ⟨122, by decide +kernel⟩

def target12 : Weights.Entry :=
  { word := [8, 8, 4, 4, 12, 0, 8], weights := [1, 0, 0, 1] }

def points12 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 5603, representative 9293.
def source13 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B019.Data.entryAt ⟨110, by decide +kernel⟩

def target13 : Weights.Entry :=
  { word := [8, 8, 4, 4, 12, 8, 8], weights := [1, 0, 0, 1] }

-- Period 9, original row 5609, representative 9283.
def source14 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B019.Data.entryAt ⟨100, by decide +kernel⟩

def target14 : Weights.Entry :=
  { word := [8, 8, 4, 8, 4, 2, 8], weights := [0, 1, 1, 0] }

def points14 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 5611, representative 9242.
def source15 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B019.Data.entryAt ⟨59, by decide +kernel⟩

def target15 : Weights.Entry :=
  { word := [8, 8, 4, 8, 4, 10, 8], weights := [0, 1, 1, 0] }

-- Period 9, original row 5613, representative 9281.
def source16 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B019.Data.entryAt ⟨98, by decide +kernel⟩

def target16 : Weights.Entry :=
  { word := [8, 8, 4, 8, 12, 2, 8], weights := [0, 1, 1, 0] }

def points16 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 5615, representative 9240.
def source17 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B019.Data.entryAt ⟨57, by decide +kernel⟩

def target17 : Weights.Entry :=
  { word := [8, 8, 4, 8, 12, 10, 8], weights := [0, 1, 1, 0] }

-- Period 9, original row 5625, representative 9264.
def source18 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B019.Data.entryAt ⟨81, by decide +kernel⟩

def target18 : Weights.Entry :=
  { word := [8, 8, 4, 10, 0, 9, 8], weights := [0, 1, 0, 1] }

def points18 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 5626, representative 9264.
def source19 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B019.Data.entryAt ⟨81, by decide +kernel⟩

def target19 : Weights.Entry :=
  { word := [8, 8, 4, 10, 0, 10, 8], weights := [0, 1, 0, 1] }

def points19 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 5632, representative 9261.
def source20 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B019.Data.entryAt ⟨78, by decide +kernel⟩

def target20 : Weights.Entry :=
  { word := [8, 8, 4, 10, 8, 10, 8], weights := [0, 1, 1, 0] }

-- Period 9, original row 5637, representative 9299.
def source21 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B019.Data.entryAt ⟨116, by decide +kernel⟩

def target21 : Weights.Entry :=
  { word := [8, 8, 4, 12, 4, 8, 8], weights := [0, 1, 1, 0] }

def points21 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 5638, representative 9308.
def source22 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B019.Data.entryAt ⟨125, by decide +kernel⟩

def target22 : Weights.Entry :=
  { word := [8, 8, 4, 12, 12, 0, 8], weights := [0, 1, 1, 0] }

def points22 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 5640, representative 9296.
def source23 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B019.Data.entryAt ⟨113, by decide +kernel⟩

def target23 : Weights.Entry :=
  { word := [8, 8, 4, 12, 12, 8, 8], weights := [0, 1, 1, 0] }

-- Period 9, original row 5645, representative 9288.
def source24 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B019.Data.entryAt ⟨105, by decide +kernel⟩

def target24 : Weights.Entry :=
  { word := [8, 8, 6, 2, 0, 8, 8], weights := [1, 0, 0, 1] }

def points24 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 5653, representative 9289.
def source25 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B019.Data.entryAt ⟨106, by decide +kernel⟩

def target25 : Weights.Entry :=
  { word := [8, 8, 6, 2, 8, 8, 8], weights := [1, 0, 0, 1] }

-- Period 9, original row 5660, representative 9291.
def source26 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B019.Data.entryAt ⟨108, by decide +kernel⟩

def target26 : Weights.Entry :=
  { word := [8, 8, 6, 10, 0, 8, 8], weights := [1, 0, 0, 1] }

def points26 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 5667, representative 9290.
def source27 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B019.Data.entryAt ⟨107, by decide +kernel⟩

def target27 : Weights.Entry :=
  { word := [8, 8, 6, 10, 8, 8, 8], weights := [0, 1, 1, 0] }

-- Period 9, original row 5672, representative 9287.
def source28 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B019.Data.entryAt ⟨104, by decide +kernel⟩

def target28 : Weights.Entry :=
  { word := [8, 8, 8, 1, 4, 2, 8], weights := [1, 2, 1, 0] }

def points28 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 5676, representative 9246.
def source29 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B019.Data.entryAt ⟨63, by decide +kernel⟩

def target29 : Weights.Entry :=
  { word := [8, 8, 8, 1, 4, 10, 8], weights := [1, 2, 1, 0] }

-- Period 9, original row 5678, representative 9285.
def source30 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B019.Data.entryAt ⟨102, by decide +kernel⟩

def target30 : Weights.Entry :=
  { word := [8, 8, 8, 1, 12, 2, 8], weights := [1, 2, 1, 0] }

def points30 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 5682, representative 9244.
def source31 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B019.Data.entryAt ⟨61, by decide +kernel⟩

def target31 : Weights.Entry :=
  { word := [8, 8, 8, 1, 12, 10, 8], weights := [1, 2, 1, 0] }

-- Period 9, original row 5686, representative 9254.
def source32 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B019.Data.entryAt ⟨71, by decide +kernel⟩

def target32 : Weights.Entry :=
  { word := [8, 8, 8, 2, 2, 10, 8], weights := [1, 0, 0, 1] }

-- Period 9, original row 5690, representative 9251.
def source33 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B019.Data.entryAt ⟨68, by decide +kernel⟩

def target33 : Weights.Entry :=
  { word := [8, 8, 8, 2, 10, 10, 8], weights := [1, 0, 0, 1] }

-- Period 9, original row 5696, representative 9301.
def source34 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B019.Data.entryAt ⟨118, by decide +kernel⟩

def target34 : Weights.Entry :=
  { word := [8, 8, 8, 4, 6, 0, 8], weights := [1, 0, 0, 1] }

def points34 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 5698, representative 9289.
def source35 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B019.Data.entryAt ⟨106, by decide +kernel⟩

def target35 : Weights.Entry :=
  { word := [8, 8, 8, 4, 6, 8, 8], weights := [1, 0, 0, 1] }

def points35 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 5709, representative 9279.
def source36 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B019.Data.entryAt ⟨96, by decide +kernel⟩

def target36 : Weights.Entry :=
  { word := [8, 8, 8, 8, 6, 2, 8], weights := [0, 1, 1, 0] }

def points36 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 5711, representative 9238.
def source37 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B019.Data.entryAt ⟨55, by decide +kernel⟩

def target37 : Weights.Entry :=
  { word := [8, 8, 8, 8, 6, 10, 8], weights := [0, 1, 1, 0] }

-- Period 9, original row 5722, representative 9255.
def source38 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B019.Data.entryAt ⟨72, by decide +kernel⟩

def target38 : Weights.Entry :=
  { word := [8, 8, 8, 10, 2, 10, 8], weights := [0, 1, 1, 0] }

-- Period 9, original row 5724, representative 9252.
def source39 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B019.Data.entryAt ⟨69, by decide +kernel⟩

def target39 : Weights.Entry :=
  { word := [8, 8, 8, 10, 10, 10, 8], weights := [0, 1, 1, 0] }

-- Period 9, original row 5729, representative 9302.
def source40 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B019.Data.entryAt ⟨119, by decide +kernel⟩

def target40 : Weights.Entry :=
  { word := [8, 8, 8, 12, 6, 0, 8], weights := [0, 1, 1, 0] }

def points40 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 5731, representative 9290.
def source41 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B019.Data.entryAt ⟨107, by decide +kernel⟩

def target41 : Weights.Entry :=
  { word := [8, 8, 8, 12, 6, 8, 8], weights := [0, 1, 1, 0] }

def points41 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 5756, representative 9293.
def source42 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B019.Data.entryAt ⟨110, by decide +kernel⟩

def target42 : Weights.Entry :=
  { word := [8, 8, 10, 2, 2, 8, 8], weights := [1, 0, 0, 1] }

def points42 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 5764, representative 9294.
def source43 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B019.Data.entryAt ⟨111, by decide +kernel⟩

def target43 : Weights.Entry :=
  { word := [8, 8, 10, 2, 10, 8, 8], weights := [1, 0, 0, 1] }

-- Period 9, original row 5771, representative 9296.
def source44 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B019.Data.entryAt ⟨113, by decide +kernel⟩

def target44 : Weights.Entry :=
  { word := [8, 8, 10, 10, 2, 8, 8], weights := [0, 1, 1, 0] }

def points44 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 5778, representative 9295.
def source45 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B019.Data.entryAt ⟨112, by decide +kernel⟩

def target45 : Weights.Entry :=
  { word := [8, 8, 10, 10, 10, 8, 8], weights := [0, 1, 1, 0] }

-- Period 9, original row 5795, representative 9262.
def source46 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B019.Data.entryAt ⟨79, by decide +kernel⟩

def target46 : Weights.Entry :=
  { word := [8, 8, 12, 2, 0, 9, 8], weights := [0, 1, 0, 1] }

def points46 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 5797, representative 9262.
def source47 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B019.Data.entryAt ⟨79, by decide +kernel⟩

def target47 : Weights.Entry :=
  { word := [8, 8, 12, 2, 0, 10, 8], weights := [0, 1, 0, 1] }

def points47 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 5803, representative 9259.
def source48 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B019.Data.entryAt ⟨76, by decide +kernel⟩

def target48 : Weights.Entry :=
  { word := [8, 8, 12, 2, 8, 10, 8], weights := [1, 0, 0, 1] }

-- Period 9, original row 5805, representative 9309.
def source49 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B019.Data.entryAt ⟨126, by decide +kernel⟩

def target49 : Weights.Entry :=
  { word := [8, 8, 12, 4, 4, 0, 8], weights := [1, 0, 0, 1] }

def points49 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 5807, representative 9297.
def source50 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B019.Data.entryAt ⟨114, by decide +kernel⟩

def target50 : Weights.Entry :=
  { word := [8, 8, 12, 4, 4, 8, 8], weights := [1, 0, 0, 1] }

def points50 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 5809, representative 9306.
def source51 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B019.Data.entryAt ⟨123, by decide +kernel⟩

def target51 : Weights.Entry :=
  { word := [8, 8, 12, 4, 12, 0, 8], weights := [1, 0, 0, 1] }

def points51 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 5811, representative 9294.
def source52 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B019.Data.entryAt ⟨111, by decide +kernel⟩

def target52 : Weights.Entry :=
  { word := [8, 8, 12, 4, 12, 8, 8], weights := [1, 0, 0, 1] }

def points52 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 5816, representative 9282.
def source53 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B019.Data.entryAt ⟨99, by decide +kernel⟩

def target53 : Weights.Entry :=
  { word := [8, 8, 12, 8, 4, 2, 8], weights := [0, 1, 1, 0] }

def points53 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 5818, representative 9241.
def source54 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B019.Data.entryAt ⟨58, by decide +kernel⟩

def target54 : Weights.Entry :=
  { word := [8, 8, 12, 8, 4, 10, 8], weights := [0, 1, 1, 0] }

-- Period 9, original row 5820, representative 9280.
def source55 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B019.Data.entryAt ⟨97, by decide +kernel⟩

def target55 : Weights.Entry :=
  { word := [8, 8, 12, 8, 12, 2, 8], weights := [0, 1, 1, 0] }

def points55 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 5822, representative 9239.
def source56 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B019.Data.entryAt ⟨56, by decide +kernel⟩

def target56 : Weights.Entry :=
  { word := [8, 8, 12, 8, 12, 10, 8], weights := [0, 1, 1, 0] }

-- Period 9, original row 5832, representative 9263.
def source57 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B019.Data.entryAt ⟨80, by decide +kernel⟩

def target57 : Weights.Entry :=
  { word := [8, 8, 12, 10, 0, 9, 8], weights := [0, 1, 0, 1] }

def points57 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 5833, representative 9263.
def source58 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B019.Data.entryAt ⟨80, by decide +kernel⟩

def target58 : Weights.Entry :=
  { word := [8, 8, 12, 10, 0, 10, 8], weights := [0, 1, 0, 1] }

def points58 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 5839, representative 9260.
def source59 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B019.Data.entryAt ⟨77, by decide +kernel⟩

def target59 : Weights.Entry :=
  { word := [8, 8, 12, 10, 8, 10, 8], weights := [0, 1, 1, 0] }

-- Period 9, original row 5842, representative 9310.
def source60 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B019.Data.entryAt ⟨127, by decide +kernel⟩

def target60 : Weights.Entry :=
  { word := [8, 8, 12, 12, 4, 0, 8], weights := [1, 0, 0, 1] }

def points60 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 5844, representative 9298.
def source61 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B019.Data.entryAt ⟨115, by decide +kernel⟩

def target61 : Weights.Entry :=
  { word := [8, 8, 12, 12, 4, 8, 8], weights := [0, 1, 1, 0] }

def points61 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 5845, representative 9307.
def source62 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B019.Data.entryAt ⟨124, by decide +kernel⟩

def target62 : Weights.Entry :=
  { word := [8, 8, 12, 12, 12, 0, 8], weights := [0, 1, 1, 0] }

def points62 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 5847, representative 9295.
def source63 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B019.Data.entryAt ⟨112, by decide +kernel⟩

def target63 : Weights.Entry :=
  { word := [8, 8, 12, 12, 12, 8, 8], weights := [0, 1, 1, 0] }

def points63 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 6335, representative 9271.
def source64 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B019.Data.entryAt ⟨88, by decide +kernel⟩

def target64 : Weights.Entry :=
  { word := [8, 12, 0, 4, 2, 0, 8], weights := [1, 0, 0, 1] }

def points64 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2)]

-- Period 9, original row 6341, representative 9257.
def source65 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B019.Data.entryAt ⟨74, by decide +kernel⟩

def target65 : Weights.Entry :=
  { word := [8, 12, 0, 4, 2, 8, 8], weights := [1, 0, 1, 0] }

def points65 : List (ℕ × ℕ) := [(0, 0), (1, 2), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 6357, representative 9276.
def source66 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B019.Data.entryAt ⟨93, by decide +kernel⟩

def target66 : Weights.Entry :=
  { word := [8, 12, 0, 4, 10, 0, 8], weights := [1, 0, 0, 1] }

def points66 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2)]

-- Period 9, original row 6363, representative 9262.
def source67 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B019.Data.entryAt ⟨79, by decide +kernel⟩

def target67 : Weights.Entry :=
  { word := [8, 12, 0, 4, 10, 8, 8], weights := [1, 0, 1, 0] }

def points67 : List (ℕ × ℕ) := [(0, 0), (1, 2), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 6371, representative 9278.
def source68 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B019.Data.entryAt ⟨95, by decide +kernel⟩

def target68 : Weights.Entry :=
  { word := [8, 12, 0, 12, 2, 0, 8], weights := [1, 0, 0, 1] }

def points68 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2)]

-- Period 9, original row 6377, representative 9264.
def source69 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B019.Data.entryAt ⟨81, by decide +kernel⟩

def target69 : Weights.Entry :=
  { word := [8, 12, 0, 12, 2, 8, 8], weights := [1, 0, 1, 0] }

def points69 : List (ℕ × ℕ) := [(0, 0), (1, 2), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 6393, representative 9277.
def source70 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B019.Data.entryAt ⟨94, by decide +kernel⟩

def target70 : Weights.Entry :=
  { word := [8, 12, 0, 12, 10, 0, 8], weights := [1, 0, 0, 1] }

def points70 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2)]

-- Period 9, original row 6399, representative 9263.
def source71 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B019.Data.entryAt ⟨80, by decide +kernel⟩

def target71 : Weights.Entry :=
  { word := [8, 12, 0, 12, 10, 8, 8], weights := [1, 0, 1, 0] }

def points71 : List (ℕ × ℕ) := [(0, 0), (1, 2), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 6405, representative 9245.
def source72 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B019.Data.entryAt ⟨62, by decide +kernel⟩

def target72 : Weights.Entry :=
  { word := [8, 12, 2, 0, 1, 8, 8], weights := [0, 1, 2, 1] }

def points72 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 6408, representative 9246.
def source73 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B019.Data.entryAt ⟨63, by decide +kernel⟩

def target73 : Weights.Entry :=
  { word := [8, 12, 2, 0, 9, 8, 8], weights := [0, 1, 2, 1] }

def points73 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 6412, representative 9248.
def source74 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B019.Data.entryAt ⟨65, by decide +kernel⟩

def target74 : Weights.Entry :=
  { word := [8, 12, 2, 8, 2, 0, 8], weights := [0, 1, 1, 0] }

def points74 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 6416, representative 9242.
def source75 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B019.Data.entryAt ⟨59, by decide +kernel⟩

def target75 : Weights.Entry :=
  { word := [8, 12, 2, 8, 2, 8, 8], weights := [0, 1, 1, 0] }

def points75 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 6420, representative 9247.
def source76 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B019.Data.entryAt ⟨64, by decide +kernel⟩

def target76 : Weights.Entry :=
  { word := [8, 12, 2, 8, 10, 0, 8], weights := [0, 1, 1, 0] }

def points76 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 6424, representative 9241.
def source77 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B019.Data.entryAt ⟨58, by decide +kernel⟩

def target77 : Weights.Entry :=
  { word := [8, 12, 2, 8, 10, 8, 8], weights := [0, 1, 1, 0] }

def points77 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 6429, representative 9265.
def source78 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B019.Data.entryAt ⟨82, by decide +kernel⟩

def target78 : Weights.Entry :=
  { word := [8, 12, 4, 4, 0, 0, 8], weights := [1, 0, 0, 1] }

def points78 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 6436, representative 9249.
def source79 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B019.Data.entryAt ⟨66, by decide +kernel⟩

def target79 : Weights.Entry :=
  { word := [8, 12, 4, 4, 0, 8, 8], weights := [1, 0, 0, 1] }

def points79 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 6443, representative 9268.
def source80 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B019.Data.entryAt ⟨85, by decide +kernel⟩

def target80 : Weights.Entry :=
  { word := [8, 12, 4, 4, 8, 0, 8], weights := [1, 0, 0, 1] }

def points80 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 6450, representative 9254.
def source81 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B019.Data.entryAt ⟨71, by decide +kernel⟩

def target81 : Weights.Entry :=
  { word := [8, 12, 4, 4, 8, 8, 8], weights := [1, 0, 0, 1] }

def points81 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 6457, representative 9270.
def source82 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B019.Data.entryAt ⟨87, by decide +kernel⟩

def target82 : Weights.Entry :=
  { word := [8, 12, 4, 12, 0, 0, 8], weights := [1, 0, 0, 1] }

def points82 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 6464, representative 9256.
def source83 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B019.Data.entryAt ⟨73, by decide +kernel⟩

def target83 : Weights.Entry :=
  { word := [8, 12, 4, 12, 0, 8, 8], weights := [1, 0, 0, 1] }

def points83 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 6471, representative 9269.
def source84 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B019.Data.entryAt ⟨86, by decide +kernel⟩

def target84 : Weights.Entry :=
  { word := [8, 12, 4, 12, 8, 0, 8], weights := [0, 1, 1, 0] }

def points84 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 6478, representative 9255.
def source85 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B019.Data.entryAt ⟨72, by decide +kernel⟩

def target85 : Weights.Entry :=
  { word := [8, 12, 4, 12, 8, 8, 8], weights := [0, 1, 1, 0] }

def points85 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 6484, representative 9238.
def source86 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B019.Data.entryAt ⟨55, by decide +kernel⟩

def target86 : Weights.Entry :=
  { word := [8, 12, 6, 8, 8, 8, 8], weights := [0, 1, 1, 0] }

def points86 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 6490, representative 9272.
def source87 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B019.Data.entryAt ⟨89, by decide +kernel⟩

def target87 : Weights.Entry :=
  { word := [8, 12, 8, 4, 2, 0, 8], weights := [1, 0, 0, 1] }

def points87 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 6496, representative 9258.
def source88 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B019.Data.entryAt ⟨75, by decide +kernel⟩

def target88 : Weights.Entry :=
  { word := [8, 12, 8, 4, 2, 8, 8], weights := [1, 0, 0, 1] }

def points88 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 6516, representative 9273.
def source89 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B019.Data.entryAt ⟨90, by decide +kernel⟩

def target89 : Weights.Entry :=
  { word := [8, 12, 8, 4, 10, 0, 8], weights := [1, 0, 0, 1] }

def points89 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 6522, representative 9259.
def source90 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B019.Data.entryAt ⟨76, by decide +kernel⟩

def target90 : Weights.Entry :=
  { word := [8, 12, 8, 4, 10, 8, 8], weights := [1, 0, 0, 1] }

def points90 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 6532, representative 9275.
def source91 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B019.Data.entryAt ⟨92, by decide +kernel⟩

def target91 : Weights.Entry :=
  { word := [8, 12, 8, 12, 2, 0, 8], weights := [0, 1, 1, 0] }

def points91 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 6538, representative 9261.
def source92 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B019.Data.entryAt ⟨78, by decide +kernel⟩

def target92 : Weights.Entry :=
  { word := [8, 12, 8, 12, 2, 8, 8], weights := [0, 1, 1, 0] }

def points92 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 6558, representative 9274.
def source93 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B019.Data.entryAt ⟨91, by decide +kernel⟩

def target93 : Weights.Entry :=
  { word := [8, 12, 8, 12, 10, 0, 8], weights := [0, 1, 1, 0] }

def points93 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 6564, representative 9260.
def source94 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B019.Data.entryAt ⟨77, by decide +kernel⟩

def target94 : Weights.Entry :=
  { word := [8, 12, 8, 12, 10, 8, 8], weights := [0, 1, 1, 0] }

def points94 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 6572, representative 9243.
def source95 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B019.Data.entryAt ⟨60, by decide +kernel⟩

def target95 : Weights.Entry :=
  { word := [8, 12, 10, 0, 1, 8, 8], weights := [0, 1, 2, 1] }

def points95 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 6575, representative 9244.
def source96 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B019.Data.entryAt ⟨61, by decide +kernel⟩

def target96 : Weights.Entry :=
  { word := [8, 12, 10, 0, 9, 8, 8], weights := [0, 1, 2, 1] }

def points96 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 6578, representative 9240.
def source97 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B019.Data.entryAt ⟨57, by decide +kernel⟩

def target97 : Weights.Entry :=
  { word := [8, 12, 10, 8, 2, 8, 8], weights := [0, 1, 1, 0] }

def points97 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 6581, representative 9239.
def source98 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B019.Data.entryAt ⟨56, by decide +kernel⟩

def target98 : Weights.Entry :=
  { word := [8, 12, 10, 8, 10, 8, 8], weights := [0, 1, 1, 0] }

def points98 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 6586, representative 9250.
def source99 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B019.Data.entryAt ⟨67, by decide +kernel⟩

def target99 : Weights.Entry :=
  { word := [8, 12, 12, 4, 0, 8, 8], weights := [1, 0, 0, 1] }

def points99 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 6593, representative 9266.
def source100 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B019.Data.entryAt ⟨83, by decide +kernel⟩

def target100 : Weights.Entry :=
  { word := [8, 12, 12, 4, 8, 0, 8], weights := [1, 0, 0, 1] }

def points100 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 6600, representative 9251.
def source101 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B019.Data.entryAt ⟨68, by decide +kernel⟩

def target101 : Weights.Entry :=
  { word := [8, 12, 12, 4, 8, 8, 8], weights := [1, 0, 0, 1] }

def points101 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 6607, representative 9253.
def source102 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B019.Data.entryAt ⟨70, by decide +kernel⟩

def target102 : Weights.Entry :=
  { word := [8, 12, 12, 12, 0, 8, 8], weights := [1, 0, 0, 1] }

def points102 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 6614, representative 9267.
def source103 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B019.Data.entryAt ⟨84, by decide +kernel⟩

def target103 : Weights.Entry :=
  { word := [8, 12, 12, 12, 8, 0, 8], weights := [0, 1, 1, 0] }

def points103 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 6621, representative 9252.
def source104 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B019.Data.entryAt ⟨69, by decide +kernel⟩

def target104 : Weights.Entry :=
  { word := [8, 12, 12, 12, 8, 8, 8], weights := [0, 1, 1, 0] }

def points104 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 6708, representative 9304.
def source105 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B019.Data.entryAt ⟨121, by decide +kernel⟩

def target105 : Weights.Entry :=
  { word := [9, 0, 2, 2, 2, 8, 8], weights := [1, 0, 0, 1] }

def points105 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 6723, representative 9309.
def source106 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B019.Data.entryAt ⟨126, by decide +kernel⟩

def target106 : Weights.Entry :=
  { word := [9, 0, 2, 2, 10, 8, 8], weights := [1, 0, 0, 1] }

def points106 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 6751, representative 9310.
def source107 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B019.Data.entryAt ⟨127, by decide +kernel⟩

def target107 : Weights.Entry :=
  { word := [9, 0, 2, 10, 10, 8, 8], weights := [1, 0, 0, 1] }

def points107 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 6768, representative 9271.
def source108 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B019.Data.entryAt ⟨88, by decide +kernel⟩

def target108 : Weights.Entry :=
  { word := [9, 0, 4, 2, 0, 9, 8], weights := [1, 0, 0, 1] }

def points108 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 6770, representative 9271.
def source109 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B019.Data.entryAt ⟨88, by decide +kernel⟩

def target109 : Weights.Entry :=
  { word := [9, 0, 4, 2, 0, 10, 8], weights := [1, 0, 0, 1] }

def points109 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 8), (8, 7)]

-- Period 9, original row 6776, representative 9272.
def source110 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B019.Data.entryAt ⟨89, by decide +kernel⟩

def target110 : Weights.Entry :=
  { word := [9, 0, 4, 2, 8, 10, 8], weights := [1, 0, 0, 1] }

def points110 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 6788, representative 9248.
def source111 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B019.Data.entryAt ⟨65, by decide +kernel⟩

def target111 : Weights.Entry :=
  { word := [9, 0, 4, 8, 4, 10, 8], weights := [0, 1, 1, 0] }

def points111 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 6799, representative 9278.
def source112 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B019.Data.entryAt ⟨95, by decide +kernel⟩

def target112 : Weights.Entry :=
  { word := [9, 0, 4, 10, 0, 9, 8], weights := [1, 0, 0, 1] }

def points112 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 6800, representative 9278.
def source113 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B019.Data.entryAt ⟨95, by decide +kernel⟩

def target113 : Weights.Entry :=
  { word := [9, 0, 4, 10, 0, 10, 8], weights := [1, 0, 0, 1] }

def points113 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 8), (8, 7)]

-- Period 9, original row 6811, representative 9275.
def source114 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B019.Data.entryAt ⟨92, by decide +kernel⟩

def target114 : Weights.Entry :=
  { word := [9, 0, 4, 10, 8, 10, 8], weights := [0, 1, 1, 0] }

def points114 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 6822, representative 9268.
def source115 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B019.Data.entryAt ⟨85, by decide +kernel⟩

def target115 : Weights.Entry :=
  { word := [9, 0, 8, 2, 2, 10, 8], weights := [1, 0, 0, 1] }

def points115 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 6826, representative 9266.
def source116 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B019.Data.entryAt ⟨83, by decide +kernel⟩

def target116 : Weights.Entry :=
  { word := [9, 0, 8, 2, 10, 10, 8], weights := [1, 0, 0, 1] }

def points116 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 6845, representative 9269.
def source117 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B019.Data.entryAt ⟨86, by decide +kernel⟩

def target117 : Weights.Entry :=
  { word := [9, 0, 8, 10, 2, 10, 8], weights := [0, 1, 1, 0] }

def points117 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 6847, representative 9267.
def source118 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B019.Data.entryAt ⟨84, by decide +kernel⟩

def target118 : Weights.Entry :=
  { word := [9, 0, 8, 10, 10, 10, 8], weights := [0, 1, 1, 0] }

def points118 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 6872, representative 9305.
def source119 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B019.Data.entryAt ⟨122, by decide +kernel⟩

def target119 : Weights.Entry :=
  { word := [9, 0, 10, 2, 2, 8, 8], weights := [1, 0, 0, 1] }

def points119 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 6880, representative 9306.
def source120 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B019.Data.entryAt ⟨123, by decide +kernel⟩

def target120 : Weights.Entry :=
  { word := [9, 0, 10, 2, 10, 8, 8], weights := [1, 0, 0, 1] }

def points120 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 6887, representative 9308.
def source121 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B019.Data.entryAt ⟨125, by decide +kernel⟩

def target121 : Weights.Entry :=
  { word := [9, 0, 10, 10, 2, 8, 8], weights := [0, 1, 1, 0] }

def points121 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 6894, representative 9307.
def source122 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B019.Data.entryAt ⟨124, by decide +kernel⟩

def target122 : Weights.Entry :=
  { word := [9, 0, 10, 10, 10, 8, 8], weights := [0, 1, 1, 0] }

def points122 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 6911, representative 9276.
def source123 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B019.Data.entryAt ⟨93, by decide +kernel⟩

def target123 : Weights.Entry :=
  { word := [9, 0, 12, 2, 0, 9, 8], weights := [1, 0, 0, 1] }

def points123 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 6913, representative 9276.
def source124 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B019.Data.entryAt ⟨93, by decide +kernel⟩

def target124 : Weights.Entry :=
  { word := [9, 0, 12, 2, 0, 10, 8], weights := [1, 0, 0, 1] }

def points124 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 8), (8, 7)]

-- Period 9, original row 6919, representative 9273.
def source125 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B019.Data.entryAt ⟨90, by decide +kernel⟩

def target125 : Weights.Entry :=
  { word := [9, 0, 12, 2, 8, 10, 8], weights := [1, 0, 0, 1] }

def points125 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 6930, representative 9247.
def source126 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B019.Data.entryAt ⟨64, by decide +kernel⟩

def target126 : Weights.Entry :=
  { word := [9, 0, 12, 8, 4, 10, 8], weights := [0, 1, 1, 0] }

def points126 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 6945, representative 9277.
def source127 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B019.Data.entryAt ⟨94, by decide +kernel⟩

def target127 : Weights.Entry :=
  { word := [9, 0, 12, 10, 0, 9, 8], weights := [1, 0, 0, 1] }

def points127 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

def period9Entries : List Weights.Entry := [target0, target1, target2, target3, target4, target5, target6, target7, target8, target9, target10, target11, target12, target13, target14, target15, target16, target17, target18, target19, target20, target21, target22, target23, target24, target25, target26, target27, target28, target29, target30, target31, target32, target33, target34, target35, target36, target37, target38, target39, target40, target41, target42, target43, target44, target45, target46, target47, target48, target49, target50, target51, target52, target53, target54, target55, target56, target57, target58, target59, target60, target61, target62, target63, target64, target65, target66, target67, target68, target69, target70, target71, target72, target73, target74, target75, target76, target77, target78, target79, target80, target81, target82, target83, target84, target85, target86, target87, target88, target89, target90, target91, target92, target93, target94, target95, target96, target97, target98, target99, target100, target101, target102, target103, target104, target105, target106, target107, target108, target109, target110, target111, target112, target113, target114, target115, target116, target117, target118, target119, target120, target121, target122, target123, target124, target125, target126, target127]

def period9Chunk : RowCoverage.Chunk where
  rows := [⟨5489, target0⟩, ⟨5505, target1⟩, ⟨5511, target2⟩, ⟨5527, target3⟩, ⟨5542, target4⟩, ⟨5556, target5⟩, ⟨5570, target6⟩, ⟨5587, target7⟩, ⟨5589, target8⟩, ⟨5595, target9⟩, ⟨5597, target10⟩, ⟨5599, target11⟩, ⟨5601, target12⟩, ⟨5603, target13⟩, ⟨5609, target14⟩, ⟨5611, target15⟩, ⟨5613, target16⟩, ⟨5615, target17⟩, ⟨5625, target18⟩, ⟨5626, target19⟩, ⟨5632, target20⟩, ⟨5637, target21⟩, ⟨5638, target22⟩, ⟨5640, target23⟩, ⟨5645, target24⟩, ⟨5653, target25⟩, ⟨5660, target26⟩, ⟨5667, target27⟩, ⟨5672, target28⟩, ⟨5676, target29⟩, ⟨5678, target30⟩, ⟨5682, target31⟩, ⟨5686, target32⟩, ⟨5690, target33⟩, ⟨5696, target34⟩, ⟨5698, target35⟩, ⟨5709, target36⟩, ⟨5711, target37⟩, ⟨5722, target38⟩, ⟨5724, target39⟩, ⟨5729, target40⟩, ⟨5731, target41⟩, ⟨5756, target42⟩, ⟨5764, target43⟩, ⟨5771, target44⟩, ⟨5778, target45⟩, ⟨5795, target46⟩, ⟨5797, target47⟩, ⟨5803, target48⟩, ⟨5805, target49⟩, ⟨5807, target50⟩, ⟨5809, target51⟩, ⟨5811, target52⟩, ⟨5816, target53⟩, ⟨5818, target54⟩, ⟨5820, target55⟩, ⟨5822, target56⟩, ⟨5832, target57⟩, ⟨5833, target58⟩, ⟨5839, target59⟩, ⟨5842, target60⟩, ⟨5844, target61⟩, ⟨5845, target62⟩, ⟨5847, target63⟩, ⟨6335, target64⟩, ⟨6341, target65⟩, ⟨6357, target66⟩, ⟨6363, target67⟩, ⟨6371, target68⟩, ⟨6377, target69⟩, ⟨6393, target70⟩, ⟨6399, target71⟩, ⟨6405, target72⟩, ⟨6408, target73⟩, ⟨6412, target74⟩, ⟨6416, target75⟩, ⟨6420, target76⟩, ⟨6424, target77⟩, ⟨6429, target78⟩, ⟨6436, target79⟩, ⟨6443, target80⟩, ⟨6450, target81⟩, ⟨6457, target82⟩, ⟨6464, target83⟩, ⟨6471, target84⟩, ⟨6478, target85⟩, ⟨6484, target86⟩, ⟨6490, target87⟩, ⟨6496, target88⟩, ⟨6516, target89⟩, ⟨6522, target90⟩, ⟨6532, target91⟩, ⟨6538, target92⟩, ⟨6558, target93⟩, ⟨6564, target94⟩, ⟨6572, target95⟩, ⟨6575, target96⟩, ⟨6578, target97⟩, ⟨6581, target98⟩, ⟨6586, target99⟩, ⟨6593, target100⟩, ⟨6600, target101⟩, ⟨6607, target102⟩, ⟨6614, target103⟩, ⟨6621, target104⟩, ⟨6708, target105⟩, ⟨6723, target106⟩, ⟨6751, target107⟩, ⟨6768, target108⟩, ⟨6770, target109⟩, ⟨6776, target110⟩, ⟨6788, target111⟩, ⟨6799, target112⟩, ⟨6800, target113⟩, ⟨6811, target114⟩, ⟨6822, target115⟩, ⟨6826, target116⟩, ⟨6845, target117⟩, ⟨6847, target118⟩, ⟨6872, target119⟩, ⟨6880, target120⟩, ⟨6887, target121⟩, ⟨6894, target122⟩, ⟨6911, target123⟩, ⟨6913, target124⟩, ⟨6919, target125⟩, ⟨6930, target126⟩, ⟨6945, target127⟩]
  indexMask := 450125012418028761105924365727537367574186619145967452916748209116900352872457738235282455178961838076449467868113864540246638394081493857173970503563075236977132588106643978805887633404383034138976461501692914043202607657097848072712503905674781415077850194018499567764056739927216486428737204917551260796720519043970631062484776127450531416307504815395635424682231809428602983881502547401532959103370954243138983198350610009260325954798454418298578653455436147548614442881406300280755391415314690970966612176657025791686724906643853836698459200026608073949345326568998349465591599753404518728028595806812548619756602357969197235303858873682793536100321398557338804116335693186964333954926655487357180613973650486360646681853900671435780101536376198439005888739054896660310049797772886407336744973192767538324051825203680518018290533761387704754361166137491629667116043505566589536083318027791686100063597828939574030092846319080181655026828033691288533909337729537201130203118760208143289629947828111891284673823879366314542198267156510729465996891589612848957241375495728285161300862187362081043811876519246287470902834386084629834633557972361283291167417666003822932673384072298039092524048079176810765032221614838196305217057652339130847017868740351688054017022593052014860122774909838941788750017343929693848067924007594377256236369095053445102230571905461285597347962019072608147763438872757541371471038053284027082436862122952519049358522881635402565525173000396930663048235486200182524457153585551010116789612325478656255366792629964594360376691833998597096485968293079670635601993526612238734363399652273640104091992165020854805391852197222816894153711181844501324672605609647395285000111742849766197950976133152619591398275909672211912463536436365878498065410153129155740741741559284408684807703405399781574127550640858516067883965877654600419113536129466013225117841055029581239846737651531826942558539744984981850876416012965166186424695280779662413325597153871048074417332265610776707670128132202374881580857397991141569691297342233448383663703011123232132820620551653525815296
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

end FranklSmallCyclic.TransportBatches.G072.B002.Data
