module

public import Conjectures.FranklSmallCyclicRowCoverage
public import Conjectures.FranklSmallCyclicCanonicalWords
public import Conjectures.FranklSmallCyclicOrbit8Block014Data

/-! 128 literal targets sharing one source proof block.
Original words and row indices are retained; weights may be transported.
-/
@[expose] public section

namespace FranklSmallCyclic.TransportBatches.G040.B001.Data

-- Period 8, original row 3283, representative 5121.
def source0 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B014.Data.entryAt ⟨13, by decide +kernel⟩

def target0 : Weights.Entry :=
  { word := [2, 10, 8, 9, 0, 4, 8], weights := [1, 1, 2, 0] }

-- Period 8, original row 3284, representative 5234.
def source1 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B014.Data.entryAt ⟨126, by decide +kernel⟩

def target1 : Weights.Entry :=
  { word := [2, 10, 8, 9, 0, 8, 0], weights := [0, 1, 1, 0] }

def points1 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 3285, representative 5123.
def source2 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B014.Data.entryAt ⟨15, by decide +kernel⟩

def target2 : Weights.Entry :=
  { word := [2, 10, 8, 9, 0, 12, 0], weights := [0, 1, 1, 0] }

def points2 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 3286, representative 5120.
def source3 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B014.Data.entryAt ⟨12, by decide +kernel⟩

def target3 : Weights.Entry :=
  { word := [2, 10, 8, 9, 0, 12, 8], weights := [1, 1, 2, 0] }

-- Period 8, original row 3289, representative 5109.
def source4 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B014.Data.entryAt ⟨1, by decide +kernel⟩

def target4 : Weights.Entry :=
  { word := [2, 10, 8, 9, 8, 2, 2], weights := [1, 1, 0, 1] }

-- Period 8, original row 3296, representative 5108.
def source5 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B014.Data.entryAt ⟨0, by decide +kernel⟩

def target5 : Weights.Entry :=
  { word := [2, 10, 8, 9, 8, 10, 2], weights := [1, 1, 0, 1] }

-- Period 8, original row 3299, representative 5197.
def source6 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B014.Data.entryAt ⟨89, by decide +kernel⟩

def target6 : Weights.Entry :=
  { word := [2, 10, 8, 10, 0, 1, 8], weights := [1, 0, 0, 1] }

-- Period 8, original row 3301, representative 5193.
def source7 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B014.Data.entryAt ⟨85, by decide +kernel⟩

def target7 : Weights.Entry :=
  { word := [2, 10, 8, 10, 0, 2, 8], weights := [1, 0, 0, 1] }

-- Period 8, original row 3302, representative 5170.
def source8 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B014.Data.entryAt ⟨62, by decide +kernel⟩

def target8 : Weights.Entry :=
  { word := [2, 10, 8, 10, 0, 6, 0], weights := [1, 0, 1, 0] }

def points8 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 3304, representative 5128.
def source9 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B014.Data.entryAt ⟨20, by decide +kernel⟩

def target9 : Weights.Entry :=
  { word := [2, 10, 8, 10, 0, 8, 1], weights := [0, 1, 0, 1] }

def points9 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 3307, representative 5199.
def source10 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B014.Data.entryAt ⟨91, by decide +kernel⟩

def target10 : Weights.Entry :=
  { word := [2, 10, 8, 10, 0, 8, 8], weights := [1, 0, 0, 1] }

-- Period 8, original row 3312, representative 5196.
def source11 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B014.Data.entryAt ⟨88, by decide +kernel⟩

def target11 : Weights.Entry :=
  { word := [2, 10, 8, 10, 0, 9, 8], weights := [1, 0, 0, 1] }

-- Period 8, original row 3314, representative 5190.
def source12 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B014.Data.entryAt ⟨82, by decide +kernel⟩

def target12 : Weights.Entry :=
  { word := [2, 10, 8, 10, 0, 10, 8], weights := [1, 0, 0, 1] }

-- Period 8, original row 3315, representative 5171.
def source13 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B014.Data.entryAt ⟨63, by decide +kernel⟩

def target13 : Weights.Entry :=
  { word := [2, 10, 8, 10, 0, 12, 0], weights := [1, 0, 1, 0] }

def points13 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 3319, representative 5192.
def source14 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B014.Data.entryAt ⟨84, by decide +kernel⟩

def target14 : Weights.Entry :=
  { word := [2, 10, 8, 10, 8, 2, 8], weights := [1, 0, 0, 1] }

-- Period 8, original row 3320, representative 5169.
def source15 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B014.Data.entryAt ⟨61, by decide +kernel⟩

def target15 : Weights.Entry :=
  { word := [2, 10, 8, 10, 8, 6, 0], weights := [1, 0, 1, 0] }

def points15 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 3321, representative 5152.
def source16 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B014.Data.entryAt ⟨44, by decide +kernel⟩

def target16 : Weights.Entry :=
  { word := [2, 10, 8, 10, 8, 6, 8], weights := [1, 1, 1, 1] }

-- Period 8, original row 3325, representative 5189.
def source17 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B014.Data.entryAt ⟨81, by decide +kernel⟩

def target17 : Weights.Entry :=
  { word := [2, 10, 8, 10, 8, 10, 8], weights := [1, 0, 0, 1] }

-- Period 8, original row 3326, representative 5160.
def source18 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B014.Data.entryAt ⟨52, by decide +kernel⟩

def target18 : Weights.Entry :=
  { word := [2, 10, 8, 12, 0, 4, 8], weights := [1, 0, 3, 0] }

-- Period 8, original row 3327, representative 5156.
def source19 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B014.Data.entryAt ⟨48, by decide +kernel⟩

def target19 : Weights.Entry :=
  { word := [2, 10, 8, 12, 0, 12, 8], weights := [1, 0, 3, 0] }

-- Period 8, original row 3328, representative 5175.
def source20 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B014.Data.entryAt ⟨67, by decide +kernel⟩

def target20 : Weights.Entry :=
  { word := [2, 10, 8, 12, 2, 0, 1], weights := [1, 1, 0, 1] }

def points20 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 3331, representative 5206.
def source21 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B014.Data.entryAt ⟨98, by decide +kernel⟩

def target21 : Weights.Entry :=
  { word := [2, 10, 8, 12, 2, 0, 8], weights := [1, 1, 1, 0] }

-- Period 8, original row 3337, representative 5204.
def source22 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B014.Data.entryAt ⟨96, by decide +kernel⟩

def target22 : Weights.Entry :=
  { word := [2, 10, 8, 12, 2, 8, 8], weights := [1, 1, 1, 1] }

-- Period 8, original row 3340, representative 5168.
def source23 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B014.Data.entryAt ⟨60, by decide +kernel⟩

def target23 : Weights.Entry :=
  { word := [2, 10, 8, 12, 4, 4, 0], weights := [1, 0, 1, 0] }

def points23 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 3341, representative 5151.
def source24 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B014.Data.entryAt ⟨43, by decide +kernel⟩

def target24 : Weights.Entry :=
  { word := [2, 10, 8, 12, 4, 4, 8], weights := [1, 1, 1, 1] }

-- Period 8, original row 3342, representative 5164.
def source25 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B014.Data.entryAt ⟨56, by decide +kernel⟩

def target25 : Weights.Entry :=
  { word := [2, 10, 8, 12, 4, 12, 0], weights := [1, 0, 1, 0] }

def points25 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 3343, representative 5149.
def source26 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B014.Data.entryAt ⟨41, by decide +kernel⟩

def target26 : Weights.Entry :=
  { word := [2, 10, 8, 12, 4, 12, 8], weights := [1, 1, 1, 1] }

-- Period 8, original row 3345, representative 5159.
def source27 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B014.Data.entryAt ⟨51, by decide +kernel⟩

def target27 : Weights.Entry :=
  { word := [2, 10, 8, 12, 8, 4, 8], weights := [1, 0, 3, 0] }

-- Period 8, original row 3348, representative 5155.
def source28 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B014.Data.entryAt ⟨47, by decide +kernel⟩

def target28 : Weights.Entry :=
  { word := [2, 10, 8, 12, 8, 12, 8], weights := [1, 0, 3, 0] }

-- Period 8, original row 3350, representative 5174.
def source29 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B014.Data.entryAt ⟨66, by decide +kernel⟩

def target29 : Weights.Entry :=
  { word := [2, 10, 8, 12, 10, 0, 1], weights := [1, 1, 0, 1] }

def points29 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 3353, representative 5205.
def source30 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B014.Data.entryAt ⟨97, by decide +kernel⟩

def target30 : Weights.Entry :=
  { word := [2, 10, 8, 12, 10, 0, 8], weights := [1, 1, 1, 0] }

-- Period 8, original row 3359, representative 5203.
def source31 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B014.Data.entryAt ⟨95, by decide +kernel⟩

def target31 : Weights.Entry :=
  { word := [2, 10, 8, 12, 10, 8, 8], weights := [1, 1, 1, 1] }

-- Period 8, original row 3362, representative 5166.
def source32 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B014.Data.entryAt ⟨58, by decide +kernel⟩

def target32 : Weights.Entry :=
  { word := [2, 10, 8, 12, 12, 4, 0], weights := [1, 0, 1, 0] }

def points32 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 3363, representative 5150.
def source33 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B014.Data.entryAt ⟨42, by decide +kernel⟩

def target33 : Weights.Entry :=
  { word := [2, 10, 8, 12, 12, 4, 8], weights := [1, 1, 1, 1] }

-- Period 8, original row 3364, representative 5162.
def source34 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B014.Data.entryAt ⟨54, by decide +kernel⟩

def target34 : Weights.Entry :=
  { word := [2, 10, 8, 12, 12, 12, 0], weights := [1, 0, 1, 0] }

def points34 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 3365, representative 5148.
def source35 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B014.Data.entryAt ⟨40, by decide +kernel⟩

def target35 : Weights.Entry :=
  { word := [2, 10, 8, 12, 12, 12, 8], weights := [1, 1, 1, 1] }

-- Period 8, original row 3366, representative 5181.
def source36 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B014.Data.entryAt ⟨73, by decide +kernel⟩

def target36 : Weights.Entry :=
  { word := [2, 10, 10, 8, 1, 0, 1], weights := [1, 1, 0, 1] }

def points36 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 3369, representative 5212.
def source37 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B014.Data.entryAt ⟨104, by decide +kernel⟩

def target37 : Weights.Entry :=
  { word := [2, 10, 10, 8, 1, 0, 8], weights := [1, 1, 0, 1] }

-- Period 8, original row 3373, representative 5179.
def source38 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B014.Data.entryAt ⟨71, by decide +kernel⟩

def target38 : Weights.Entry :=
  { word := [2, 10, 10, 8, 1, 8, 1], weights := [1, 1, 1, 1] }

def points38 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 3374, representative 5210.
def source39 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B014.Data.entryAt ⟨102, by decide +kernel⟩

def target39 : Weights.Entry :=
  { word := [2, 10, 10, 8, 1, 8, 8], weights := [1, 1, 1, 1] }

-- Period 8, original row 3376, representative 5224.
def source40 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B014.Data.entryAt ⟨116, by decide +kernel⟩

def target40 : Weights.Entry :=
  { word := [2, 10, 10, 8, 2, 8, 0], weights := [1, 0, 1, 0] }

def points40 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 3377, representative 5117.
def source41 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B014.Data.entryAt ⟨9, by decide +kernel⟩

def target41 : Weights.Entry :=
  { word := [2, 10, 10, 8, 8, 4, 0], weights := [1, 0, 1, 0] }

def points41 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 3378, representative 5231.
def source42 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B014.Data.entryAt ⟨123, by decide +kernel⟩

def target42 : Weights.Entry :=
  { word := [2, 10, 10, 8, 8, 8, 0], weights := [1, 0, 1, 0] }

def points42 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 3379, representative 5116.
def source43 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B014.Data.entryAt ⟨8, by decide +kernel⟩

def target43 : Weights.Entry :=
  { word := [2, 10, 10, 8, 8, 12, 0], weights := [1, 0, 1, 0] }

def points43 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 3380, representative 5180.
def source44 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B014.Data.entryAt ⟨72, by decide +kernel⟩

def target44 : Weights.Entry :=
  { word := [2, 10, 10, 8, 9, 0, 1], weights := [1, 1, 0, 1] }

def points44 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 3383, representative 5211.
def source45 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B014.Data.entryAt ⟨103, by decide +kernel⟩

def target45 : Weights.Entry :=
  { word := [2, 10, 10, 8, 9, 0, 8], weights := [1, 1, 0, 1] }

-- Period 8, original row 3387, representative 5178.
def source46 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B014.Data.entryAt ⟨70, by decide +kernel⟩

def target46 : Weights.Entry :=
  { word := [2, 10, 10, 8, 9, 8, 1], weights := [1, 1, 1, 1] }

def points46 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 3388, representative 5209.
def source47 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B014.Data.entryAt ⟨101, by decide +kernel⟩

def target47 : Weights.Entry :=
  { word := [2, 10, 10, 8, 9, 8, 8], weights := [1, 1, 1, 1] }

-- Period 8, original row 3390, representative 5223.
def source48 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B014.Data.entryAt ⟨115, by decide +kernel⟩

def target48 : Weights.Entry :=
  { word := [2, 10, 10, 8, 10, 8, 0], weights := [1, 0, 1, 0] }

def points48 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 3457, representative 5113.
def source49 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B014.Data.entryAt ⟨5, by decide +kernel⟩

def target49 : Weights.Entry :=
  { word := [4, 0, 4, 10, 0, 12, 2], weights := [1, 0, 1, 1] }

-- Period 8, original row 3550, representative 5112.
def source50 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B014.Data.entryAt ⟨4, by decide +kernel⟩

def target50 : Weights.Entry :=
  { word := [4, 0, 12, 10, 0, 12, 2], weights := [1, 0, 1, 1] }

-- Period 8, original row 3688, representative 5115.
def source51 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B014.Data.entryAt ⟨7, by decide +kernel⟩

def target51 : Weights.Entry :=
  { word := [4, 4, 8, 8, 1, 12, 2], weights := [1, 0, 1, 1] }

-- Period 8, original row 3689, representative 5111.
def source52 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B014.Data.entryAt ⟨3, by decide +kernel⟩

def target52 : Weights.Entry :=
  { word := [4, 4, 8, 8, 1, 12, 4], weights := [1, 0, 1, 1] }

def points52 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 3700, representative 5109.
def source53 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B014.Data.entryAt ⟨1, by decide +kernel⟩

def target53 : Weights.Entry :=
  { word := [4, 4, 8, 8, 9, 12, 4], weights := [1, 0, 1, 1] }

def points53 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 3979, representative 5115.
def source54 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B014.Data.entryAt ⟨7, by decide +kernel⟩

def target54 : Weights.Entry :=
  { word := [4, 10, 0, 9, 8, 2, 2], weights := [1, 1, 0, 1] }

def points54 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 3986, representative 5114.
def source55 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B014.Data.entryAt ⟨6, by decide +kernel⟩

def target55 : Weights.Entry :=
  { word := [4, 10, 0, 9, 8, 10, 2], weights := [1, 1, 0, 1] }

-- Period 8, original row 3992, representative 5177.
def source56 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B014.Data.entryAt ⟨69, by decide +kernel⟩

def target56 : Weights.Entry :=
  { word := [4, 10, 0, 12, 2, 0, 1], weights := [1, 1, 0, 1] }

def points56 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 3993, representative 5113.
def source57 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B014.Data.entryAt ⟨5, by decide +kernel⟩

def target57 : Weights.Entry :=
  { word := [4, 10, 0, 12, 2, 0, 2], weights := [1, 1, 0, 1] }

def points57 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 3995, representative 5222.
def source58 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B014.Data.entryAt ⟨114, by decide +kernel⟩

def target58 : Weights.Entry :=
  { word := [4, 10, 0, 12, 2, 0, 8], weights := [1, 1, 1, 0] }

-- Period 8, original row 3999, representative 5177.
def source59 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B014.Data.entryAt ⟨69, by decide +kernel⟩

def target59 : Weights.Entry :=
  { word := [4, 10, 0, 12, 4, 4, 0], weights := [1, 1, 1, 0] }

def points59 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 5), (4, 6), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 4000, representative 5176.
def source60 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B014.Data.entryAt ⟨68, by decide +kernel⟩

def target60 : Weights.Entry :=
  { word := [4, 10, 0, 12, 10, 0, 1], weights := [1, 1, 0, 1] }

def points60 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 4001, representative 5112.
def source61 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B014.Data.entryAt ⟨4, by decide +kernel⟩

def target61 : Weights.Entry :=
  { word := [4, 10, 0, 12, 10, 0, 2], weights := [1, 1, 0, 1] }

def points61 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 4003, representative 5221.
def source62 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B014.Data.entryAt ⟨113, by decide +kernel⟩

def target62 : Weights.Entry :=
  { word := [4, 10, 0, 12, 10, 0, 8], weights := [1, 1, 1, 0] }

-- Period 8, original row 4007, representative 5176.
def source63 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B014.Data.entryAt ⟨68, by decide +kernel⟩

def target63 : Weights.Entry :=
  { word := [4, 10, 0, 12, 12, 4, 0], weights := [1, 1, 1, 0] }

def points63 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 5), (4, 6), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 4009, representative 5219.
def source64 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B014.Data.entryAt ⟨111, by decide +kernel⟩

def target64 : Weights.Entry :=
  { word := [4, 10, 8, 2, 8, 2, 8], weights := [1, 0, 0, 1] }

-- Period 8, original row 4012, representative 5235.
def source65 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B014.Data.entryAt ⟨127, by decide +kernel⟩

def target65 : Weights.Entry :=
  { word := [4, 10, 8, 2, 8, 10, 0], weights := [0, 1, 0, 1] }

def points65 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 4013, representative 5217.
def source66 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B014.Data.entryAt ⟨109, by decide +kernel⟩

def target66 : Weights.Entry :=
  { word := [4, 10, 8, 2, 8, 10, 8], weights := [1, 0, 0, 1] }

-- Period 8, original row 4014, representative 5145.
def source67 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B014.Data.entryAt ⟨37, by decide +kernel⟩

def target67 : Weights.Entry :=
  { word := [4, 10, 8, 4, 4, 4, 0], weights := [1, 0, 1, 0] }

def points67 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 4015, representative 5141.
def source68 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B014.Data.entryAt ⟨33, by decide +kernel⟩

def target68 : Weights.Entry :=
  { word := [4, 10, 8, 4, 4, 12, 0], weights := [1, 0, 1, 0] }

def points68 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 4016, representative 5143.
def source69 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B014.Data.entryAt ⟨35, by decide +kernel⟩

def target69 : Weights.Entry :=
  { word := [4, 10, 8, 4, 12, 4, 0], weights := [1, 0, 1, 0] }

def points69 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 4017, representative 5139.
def source70 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B014.Data.entryAt ⟨31, by decide +kernel⟩

def target70 : Weights.Entry :=
  { word := [4, 10, 8, 4, 12, 12, 0], weights := [1, 0, 1, 0] }

def points70 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 4018, representative 5230.
def source71 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B014.Data.entryAt ⟨122, by decide +kernel⟩

def target71 : Weights.Entry :=
  { word := [4, 10, 8, 8, 4, 2, 0], weights := [0, 1, 1, 0] }

def points71 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 4019, representative 5138.
def source72 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B014.Data.entryAt ⟨30, by decide +kernel⟩

def target72 : Weights.Entry :=
  { word := [4, 10, 8, 8, 4, 6, 0], weights := [0, 1, 1, 0] }

def points72 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 4020, representative 5228.
def source73 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B014.Data.entryAt ⟨120, by decide +kernel⟩

def target73 : Weights.Entry :=
  { word := [4, 10, 8, 8, 4, 10, 0], weights := [0, 1, 1, 0] }

def points73 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 4021, representative 5229.
def source74 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B014.Data.entryAt ⟨121, by decide +kernel⟩

def target74 : Weights.Entry :=
  { word := [4, 10, 8, 8, 12, 2, 0], weights := [0, 1, 1, 0] }

def points74 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 4022, representative 5137.
def source75 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B014.Data.entryAt ⟨29, by decide +kernel⟩

def target75 : Weights.Entry :=
  { word := [4, 10, 8, 8, 12, 6, 0], weights := [0, 1, 1, 0] }

def points75 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 4023, representative 5227.
def source76 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B014.Data.entryAt ⟨119, by decide +kernel⟩

def target76 : Weights.Entry :=
  { word := [4, 10, 8, 8, 12, 10, 0], weights := [0, 1, 1, 0] }

def points76 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 4025, representative 5220.
def source77 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B014.Data.entryAt ⟨112, by decide +kernel⟩

def target77 : Weights.Entry :=
  { word := [4, 10, 8, 10, 8, 2, 8], weights := [1, 0, 0, 1] }

-- Period 8, original row 4026, representative 5147.
def source78 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B014.Data.entryAt ⟨39, by decide +kernel⟩

def target78 : Weights.Entry :=
  { word := [4, 10, 8, 10, 8, 6, 0], weights := [0, 1, 1, 0] }

def points78 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 4027, representative 5136.
def source79 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B014.Data.entryAt ⟨28, by decide +kernel⟩

def target79 : Weights.Entry :=
  { word := [4, 10, 8, 10, 8, 6, 8], weights := [1, 1, 1, 1] }

-- Period 8, original row 4031, representative 5218.
def source80 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B014.Data.entryAt ⟨110, by decide +kernel⟩

def target80 : Weights.Entry :=
  { word := [4, 10, 8, 10, 8, 10, 8], weights := [1, 0, 0, 1] }

-- Period 8, original row 4034, representative 5146.
def source81 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B014.Data.entryAt ⟨38, by decide +kernel⟩

def target81 : Weights.Entry :=
  { word := [4, 10, 8, 12, 4, 4, 0], weights := [0, 1, 1, 0] }

def points81 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 4035, representative 5135.
def source82 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B014.Data.entryAt ⟨27, by decide +kernel⟩

def target82 : Weights.Entry :=
  { word := [4, 10, 8, 12, 4, 4, 8], weights := [1, 1, 1, 1] }

-- Period 8, original row 4036, representative 5142.
def source83 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B014.Data.entryAt ⟨34, by decide +kernel⟩

def target83 : Weights.Entry :=
  { word := [4, 10, 8, 12, 4, 12, 0], weights := [0, 1, 1, 0] }

def points83 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 4037, representative 5133.
def source84 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B014.Data.entryAt ⟨25, by decide +kernel⟩

def target84 : Weights.Entry :=
  { word := [4, 10, 8, 12, 4, 12, 8], weights := [1, 1, 1, 1] }

-- Period 8, original row 4038, representative 5144.
def source85 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B014.Data.entryAt ⟨36, by decide +kernel⟩

def target85 : Weights.Entry :=
  { word := [4, 10, 8, 12, 12, 4, 0], weights := [0, 1, 1, 0] }

def points85 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 4039, representative 5134.
def source86 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B014.Data.entryAt ⟨26, by decide +kernel⟩

def target86 : Weights.Entry :=
  { word := [4, 10, 8, 12, 12, 4, 8], weights := [1, 1, 1, 1] }

-- Period 8, original row 4040, representative 5140.
def source87 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B014.Data.entryAt ⟨32, by decide +kernel⟩

def target87 : Weights.Entry :=
  { word := [4, 10, 8, 12, 12, 12, 0], weights := [0, 1, 1, 0] }

def points87 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 4041, representative 5132.
def source88 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B014.Data.entryAt ⟨24, by decide +kernel⟩

def target88 : Weights.Entry :=
  { word := [4, 10, 8, 12, 12, 12, 8], weights := [1, 1, 1, 1] }

-- Period 8, original row 4053, representative 5114.
def source89 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B014.Data.entryAt ⟨6, by decide +kernel⟩

def target89 : Weights.Entry :=
  { word := [4, 12, 8, 8, 1, 12, 2], weights := [1, 0, 1, 1] }

def points89 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 4054, representative 5110.
def source90 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B014.Data.entryAt ⟨2, by decide +kernel⟩

def target90 : Weights.Entry :=
  { word := [4, 12, 8, 8, 1, 12, 4], weights := [1, 0, 1, 1] }

def points90 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 4065, representative 5108.
def source91 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B014.Data.entryAt ⟨0, by decide +kernel⟩

def target91 : Weights.Entry :=
  { word := [4, 12, 8, 8, 9, 12, 4], weights := [1, 0, 1, 1] }

def points91 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 4107, representative 5216.
def source92 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B014.Data.entryAt ⟨108, by decide +kernel⟩

def target92 : Weights.Entry :=
  { word := [8, 0, 0, 9, 4, 12, 4], weights := [1, 0, 1, 1] }

def points92 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 4111, representative 5212.
def source93 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B014.Data.entryAt ⟨104, by decide +kernel⟩

def target93 : Weights.Entry :=
  { word := [8, 0, 0, 9, 12, 12, 4], weights := [1, 0, 1, 1] }

def points93 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 4120, representative 5202.
def source94 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B014.Data.entryAt ⟨94, by decide +kernel⟩

def target94 : Weights.Entry :=
  { word := [8, 0, 0, 12, 0, 12, 4], weights := [0, 0, 1, 1] }

def points94 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 4142, representative 5194.
def source95 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B014.Data.entryAt ⟨86, by decide +kernel⟩

def target95 : Weights.Entry :=
  { word := [8, 0, 1, 4, 8, 12, 4], weights := [1, 0, 0, 1] }

def points95 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 4178, representative 5197.
def source96 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B014.Data.entryAt ⟨89, by decide +kernel⟩

def target96 : Weights.Entry :=
  { word := [8, 0, 1, 12, 8, 12, 4], weights := [1, 0, 0, 1] }

def points96 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 4299, representative 5222.
def source97 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B014.Data.entryAt ⟨114, by decide +kernel⟩

def target97 : Weights.Entry :=
  { word := [8, 0, 4, 10, 0, 12, 2], weights := [0, 1, 1, 1] }

def points97 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 4300, representative 5208.
def source98 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B014.Data.entryAt ⟨100, by decide +kernel⟩

def target98 : Weights.Entry :=
  { word := [8, 0, 4, 10, 0, 12, 4], weights := [0, 1, 1, 1] }

def points98 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 4310, representative 5206.
def source99 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B014.Data.entryAt ⟨98, by decide +kernel⟩

def target99 : Weights.Entry :=
  { word := [8, 0, 4, 10, 8, 12, 4], weights := [0, 1, 1, 1] }

def points99 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 4366, representative 5215.
def source100 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B014.Data.entryAt ⟨107, by decide +kernel⟩

def target100 : Weights.Entry :=
  { word := [8, 0, 8, 9, 4, 12, 4], weights := [1, 0, 1, 1] }

def points100 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 4370, representative 5211.
def source101 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B014.Data.entryAt ⟨103, by decide +kernel⟩

def target101 : Weights.Entry :=
  { word := [8, 0, 8, 9, 12, 12, 4], weights := [1, 0, 1, 1] }

def points101 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 4475, representative 5221.
def source102 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B014.Data.entryAt ⟨113, by decide +kernel⟩

def target102 : Weights.Entry :=
  { word := [8, 0, 12, 10, 0, 12, 2], weights := [0, 1, 1, 1] }

def points102 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 4476, representative 5207.
def source103 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B014.Data.entryAt ⟨99, by decide +kernel⟩

def target103 : Weights.Entry :=
  { word := [8, 0, 12, 10, 0, 12, 4], weights := [0, 1, 1, 1] }

def points103 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 4486, representative 5205.
def source104 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B014.Data.entryAt ⟨97, by decide +kernel⟩

def target104 : Weights.Entry :=
  { word := [8, 0, 12, 10, 8, 12, 4], weights := [0, 1, 1, 1] }

def points104 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 4679, representative 5157.
def source105 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B014.Data.entryAt ⟨49, by decide +kernel⟩

def target105 : Weights.Entry :=
  { word := [8, 2, 0, 1, 8, 12, 4], weights := [0, 3, 1, 0] }

def points105 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 4693, representative 5126.
def source106 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B014.Data.entryAt ⟨18, by decide +kernel⟩

def target106 : Weights.Entry :=
  { word := [8, 2, 0, 8, 1, 12, 4], weights := [0, 2, 1, 1] }

def points106 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 4698, representative 5121.
def source107 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B014.Data.entryAt ⟨13, by decide +kernel⟩

def target107 : Weights.Entry :=
  { word := [8, 2, 0, 8, 9, 12, 4], weights := [0, 2, 1, 1] }

def points107 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 4719, representative 5158.
def source108 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B014.Data.entryAt ⟨50, by decide +kernel⟩

def target108 : Weights.Entry :=
  { word := [8, 2, 0, 9, 8, 12, 4], weights := [0, 3, 1, 0] }

def points108 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 4741, representative 5160.
def source109 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B014.Data.entryAt ⟨52, by decide +kernel⟩

def target109 : Weights.Entry :=
  { word := [8, 2, 0, 10, 8, 12, 4], weights := [0, 3, 0, 1] }

def points109 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 4842, representative 5135.
def source110 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B014.Data.entryAt ⟨27, by decide +kernel⟩

def target110 : Weights.Entry :=
  { word := [8, 2, 2, 10, 8, 12, 2], weights := [1, 1, 1, 1] }

def points110 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 4843, representative 5151.
def source111 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B014.Data.entryAt ⟨43, by decide +kernel⟩

def target111 : Weights.Entry :=
  { word := [8, 2, 2, 10, 8, 12, 4], weights := [1, 1, 1, 1] }

def points111 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 4915, representative 5159.
def source112 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B014.Data.entryAt ⟨51, by decide +kernel⟩

def target112 : Weights.Entry :=
  { word := [8, 2, 8, 10, 8, 12, 4], weights := [0, 3, 0, 1] }

def points112 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 4997, representative 5134.
def source113 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B014.Data.entryAt ⟨26, by decide +kernel⟩

def target113 : Weights.Entry :=
  { word := [8, 2, 10, 10, 8, 12, 2], weights := [1, 1, 1, 1] }

def points113 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 4998, representative 5150.
def source114 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B014.Data.entryAt ⟨42, by decide +kernel⟩

def target114 : Weights.Entry :=
  { word := [8, 2, 10, 10, 8, 12, 4], weights := [1, 1, 1, 1] }

def points114 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 5021, representative 5186.
def source115 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B014.Data.entryAt ⟨78, by decide +kernel⟩

def target115 : Weights.Entry :=
  { word := [8, 4, 0, 4, 8, 12, 4], weights := [1, 0, 0, 1] }

def points115 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 5057, representative 5193.
def source116 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B014.Data.entryAt ⟨85, by decide +kernel⟩

def target116 : Weights.Entry :=
  { word := [8, 4, 0, 12, 8, 12, 4], weights := [1, 0, 0, 1] }

def points116 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 5178, representative 5219.
def source117 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B014.Data.entryAt ⟨111, by decide +kernel⟩

def target117 : Weights.Entry :=
  { word := [8, 4, 8, 4, 8, 12, 2], weights := [1, 0, 0, 1] }

def points117 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 5179, representative 5191.
def source118 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B014.Data.entryAt ⟨83, by decide +kernel⟩

def target118 : Weights.Entry :=
  { word := [8, 4, 8, 4, 8, 12, 4], weights := [1, 0, 0, 1] }

def points118 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 5220, representative 5220.
def source119 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B014.Data.entryAt ⟨112, by decide +kernel⟩

def target119 : Weights.Entry :=
  { word := [8, 4, 8, 12, 8, 12, 2], weights := [1, 0, 0, 1] }

def points119 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 5221, representative 5192.
def source120 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B014.Data.entryAt ⟨84, by decide +kernel⟩

def target120 : Weights.Entry :=
  { word := [8, 4, 8, 12, 8, 12, 4], weights := [1, 0, 0, 1] }

def points120 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 5307, representative 5136.
def source121 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B014.Data.entryAt ⟨28, by decide +kernel⟩

def target121 : Weights.Entry :=
  { word := [8, 6, 8, 12, 8, 12, 2], weights := [1, 1, 1, 1] }

def points121 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 5308, representative 5152.
def source122 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B014.Data.entryAt ⟨44, by decide +kernel⟩

def target122 : Weights.Entry :=
  { word := [8, 6, 8, 12, 8, 12, 4], weights := [1, 1, 1, 1] }

def points122 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 5338, representative 5200.
def source123 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B014.Data.entryAt ⟨92, by decide +kernel⟩

def target123 : Weights.Entry :=
  { word := [8, 8, 0, 4, 0, 12, 4], weights := [1, 0, 1, 2] }

def points123 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 5364, representative 5198.
def source124 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B014.Data.entryAt ⟨90, by decide +kernel⟩

def target124 : Weights.Entry :=
  { word := [8, 8, 0, 4, 8, 12, 4], weights := [1, 0, 0, 1] }

def points124 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 5387, representative 5214.
def source125 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B014.Data.entryAt ⟨106, by decide +kernel⟩

def target125 : Weights.Entry :=
  { word := [8, 8, 0, 9, 4, 12, 4], weights := [1, 1, 1, 1] }

def points125 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 5391, representative 5210.
def source126 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B014.Data.entryAt ⟨102, by decide +kernel⟩

def target126 : Weights.Entry :=
  { word := [8, 8, 0, 9, 12, 12, 4], weights := [1, 1, 1, 1] }

def points126 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 5402, representative 5201.
def source127 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B014.Data.entryAt ⟨93, by decide +kernel⟩

def target127 : Weights.Entry :=
  { word := [8, 8, 0, 12, 0, 12, 4], weights := [1, 0, 0, 1] }

def points127 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

def period8Entries : List Weights.Entry := [target0, target1, target2, target3, target4, target5, target6, target7, target8, target9, target10, target11, target12, target13, target14, target15, target16, target17, target18, target19, target20, target21, target22, target23, target24, target25, target26, target27, target28, target29, target30, target31, target32, target33, target34, target35, target36, target37, target38, target39, target40, target41, target42, target43, target44, target45, target46, target47, target48, target49, target50, target51, target52, target53, target54, target55, target56, target57, target58, target59, target60, target61, target62, target63, target64, target65, target66, target67, target68, target69, target70, target71, target72, target73, target74, target75, target76, target77, target78, target79, target80, target81, target82, target83, target84, target85, target86, target87, target88, target89, target90, target91, target92, target93, target94, target95, target96, target97, target98, target99, target100, target101, target102, target103, target104, target105, target106, target107, target108, target109, target110, target111, target112, target113, target114, target115, target116, target117, target118, target119, target120, target121, target122, target123, target124, target125, target126, target127]

def period8Chunk : RowCoverage.Chunk where
  rows := [⟨3283, target0⟩, ⟨3284, target1⟩, ⟨3285, target2⟩, ⟨3286, target3⟩, ⟨3289, target4⟩, ⟨3296, target5⟩, ⟨3299, target6⟩, ⟨3301, target7⟩, ⟨3302, target8⟩, ⟨3304, target9⟩, ⟨3307, target10⟩, ⟨3312, target11⟩, ⟨3314, target12⟩, ⟨3315, target13⟩, ⟨3319, target14⟩, ⟨3320, target15⟩, ⟨3321, target16⟩, ⟨3325, target17⟩, ⟨3326, target18⟩, ⟨3327, target19⟩, ⟨3328, target20⟩, ⟨3331, target21⟩, ⟨3337, target22⟩, ⟨3340, target23⟩, ⟨3341, target24⟩, ⟨3342, target25⟩, ⟨3343, target26⟩, ⟨3345, target27⟩, ⟨3348, target28⟩, ⟨3350, target29⟩, ⟨3353, target30⟩, ⟨3359, target31⟩, ⟨3362, target32⟩, ⟨3363, target33⟩, ⟨3364, target34⟩, ⟨3365, target35⟩, ⟨3366, target36⟩, ⟨3369, target37⟩, ⟨3373, target38⟩, ⟨3374, target39⟩, ⟨3376, target40⟩, ⟨3377, target41⟩, ⟨3378, target42⟩, ⟨3379, target43⟩, ⟨3380, target44⟩, ⟨3383, target45⟩, ⟨3387, target46⟩, ⟨3388, target47⟩, ⟨3390, target48⟩, ⟨3457, target49⟩, ⟨3550, target50⟩, ⟨3688, target51⟩, ⟨3689, target52⟩, ⟨3700, target53⟩, ⟨3979, target54⟩, ⟨3986, target55⟩, ⟨3992, target56⟩, ⟨3993, target57⟩, ⟨3995, target58⟩, ⟨3999, target59⟩, ⟨4000, target60⟩, ⟨4001, target61⟩, ⟨4003, target62⟩, ⟨4007, target63⟩, ⟨4009, target64⟩, ⟨4012, target65⟩, ⟨4013, target66⟩, ⟨4014, target67⟩, ⟨4015, target68⟩, ⟨4016, target69⟩, ⟨4017, target70⟩, ⟨4018, target71⟩, ⟨4019, target72⟩, ⟨4020, target73⟩, ⟨4021, target74⟩, ⟨4022, target75⟩, ⟨4023, target76⟩, ⟨4025, target77⟩, ⟨4026, target78⟩, ⟨4027, target79⟩, ⟨4031, target80⟩, ⟨4034, target81⟩, ⟨4035, target82⟩, ⟨4036, target83⟩, ⟨4037, target84⟩, ⟨4038, target85⟩, ⟨4039, target86⟩, ⟨4040, target87⟩, ⟨4041, target88⟩, ⟨4053, target89⟩, ⟨4054, target90⟩, ⟨4065, target91⟩, ⟨4107, target92⟩, ⟨4111, target93⟩, ⟨4120, target94⟩, ⟨4142, target95⟩, ⟨4178, target96⟩, ⟨4299, target97⟩, ⟨4300, target98⟩, ⟨4310, target99⟩, ⟨4366, target100⟩, ⟨4370, target101⟩, ⟨4475, target102⟩, ⟨4476, target103⟩, ⟨4486, target104⟩, ⟨4679, target105⟩, ⟨4693, target106⟩, ⟨4698, target107⟩, ⟨4719, target108⟩, ⟨4741, target109⟩, ⟨4842, target110⟩, ⟨4843, target111⟩, ⟨4915, target112⟩, ⟨4997, target113⟩, ⟨4998, target114⟩, ⟨5021, target115⟩, ⟨5057, target116⟩, ⟨5178, target117⟩, ⟨5179, target118⟩, ⟨5220, target119⟩, ⟨5221, target120⟩, ⟨5307, target121⟩, ⟨5308, target122⟩, ⟨5338, target123⟩, ⟨5364, target124⟩, ⟨5387, target125⟩, ⟨5391, target126⟩, ⟨5402, target127⟩]
  indexMask := 1459694023495466598508676181782190314869992712341209594933939674544859499212895151663032871191063885614437082813263869918598708565437072792761960716594228822718160712115256060887613527072016143749925483070639557170831715805524564922318182369734819543656979701134527855218191947479566445920319812717951826876473169308838619735119692974752095463330749139652157781214886547181087552294957040220963529402548689841877479619573031334114896483079917749469254349434438440594470222237589209971594839974074459386416708146515251198332794238197387870899738237871146352725168436132914440658964925832659686452656771913723539010045079490495016939456975398559273367773795540966513238126231365758649117623625489757803425316110275888812495914488975893640967244672126876654991920266710009655784963844116177120311718615690379253769008043705569381915679135614612248527314920011644595447535227106483567965921219137848283028619507024325982273633270296162872381375109205306705730880801810715367773904865281289188202583495476152909953091185580962828599811162856039375427506006154772876220530659581209594252791983082227549496001202045829063756309442352743288218844828618747322714795414897309465338043610333046893987512655039673404011484243675006063347990291663809792410549374934675425858160305516741420557640299132104586728538872269263003892617036639785666748130445948423657705092393252707722364529621130259878972474430065311190600650093300534958506015396656436115204568304731526758828166733551632347844247364240898755691978125833108631454699854616940014225024165932064453751455134249894719673080021656716085144402047764646249657692817318366665548759040
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

end FranklSmallCyclic.TransportBatches.G040.B001.Data
