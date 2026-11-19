module

public import Conjectures.FranklSmallCyclicRowCoverage
public import Conjectures.FranklSmallCyclicCanonicalWords
public import Conjectures.FranklSmallCyclicOrbit7Block024Data

/-! 128 literal targets sharing one source proof block.
Original words and row indices are retained; weights may be transported.
-/
@[expose] public section

namespace FranklSmallCyclic.TransportBatches.G024.B001.Data

-- Period 7, original row 5069, representative 3154.
def source0 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B024.Data.entryAt ⟨65, by decide +kernel⟩

def target0 : Weights.Entry :=
  { word := [8, 4, 0, 12, 10, 8, 8], weights := [1, 0, 1, 0] }

-- Period 7, original row 5075, representative 3116.
def source1 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B024.Data.entryAt ⟨27, by decide +kernel⟩

def target1 : Weights.Entry :=
  { word := [8, 4, 2, 0, 1, 8, 8], weights := [0, 1, 2, 1] }

-- Period 7, original row 5078, representative 3117.
def source2 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B024.Data.entryAt ⟨28, by decide +kernel⟩

def target2 : Weights.Entry :=
  { word := [8, 4, 2, 0, 9, 8, 8], weights := [0, 1, 2, 1] }

-- Period 7, original row 5082, representative 3143.
def source3 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B024.Data.entryAt ⟨54, by decide +kernel⟩

def target3 : Weights.Entry :=
  { word := [8, 4, 2, 8, 2, 0, 8], weights := [0, 1, 1, 0] }

def points3 : List (ℕ × ℕ) := [(0, 1), (1, 2), (2, 0), (3, 6), (4, 4), (5, 5), (6, 3)]

-- Period 7, original row 5086, representative 3113.
def source4 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B024.Data.entryAt ⟨24, by decide +kernel⟩

def target4 : Weights.Entry :=
  { word := [8, 4, 2, 8, 2, 8, 8], weights := [0, 1, 1, 0] }

-- Period 7, original row 5090, representative 3142.
def source5 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B024.Data.entryAt ⟨53, by decide +kernel⟩

def target5 : Weights.Entry :=
  { word := [8, 4, 2, 8, 10, 0, 8], weights := [0, 1, 1, 0] }

def points5 : List (ℕ × ℕ) := [(0, 1), (1, 2), (2, 0), (3, 6), (4, 4), (5, 5), (6, 3)]

-- Period 7, original row 5094, representative 3112.
def source6 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B024.Data.entryAt ⟨23, by decide +kernel⟩

def target6 : Weights.Entry :=
  { word := [8, 4, 2, 8, 10, 8, 8], weights := [0, 1, 1, 0] }

-- Period 7, original row 5099, representative 3168.
def source7 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B024.Data.entryAt ⟨79, by decide +kernel⟩

def target7 : Weights.Entry :=
  { word := [8, 4, 4, 4, 0, 0, 8], weights := [1, 0, 0, 1] }

def points7 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 5106, representative 3156.
def source8 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B024.Data.entryAt ⟨67, by decide +kernel⟩

def target8 : Weights.Entry :=
  { word := [8, 4, 4, 4, 0, 8, 8], weights := [1, 0, 0, 1] }

-- Period 7, original row 5113, representative 3177.
def source9 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B024.Data.entryAt ⟨88, by decide +kernel⟩

def target9 : Weights.Entry :=
  { word := [8, 4, 4, 4, 8, 0, 8], weights := [1, 0, 0, 1] }

def points9 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 5120, representative 3161.
def source10 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B024.Data.entryAt ⟨72, by decide +kernel⟩

def target10 : Weights.Entry :=
  { word := [8, 4, 4, 4, 8, 8, 8], weights := [1, 0, 1, 0] }

-- Period 7, original row 5127, representative 3179.
def source11 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B024.Data.entryAt ⟨90, by decide +kernel⟩

def target11 : Weights.Entry :=
  { word := [8, 4, 4, 12, 0, 0, 8], weights := [1, 0, 0, 1] }

def points11 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 5134, representative 3163.
def source12 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B024.Data.entryAt ⟨74, by decide +kernel⟩

def target12 : Weights.Entry :=
  { word := [8, 4, 4, 12, 0, 8, 8], weights := [1, 0, 1, 0] }

-- Period 7, original row 5141, representative 3178.
def source13 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B024.Data.entryAt ⟨89, by decide +kernel⟩

def target13 : Weights.Entry :=
  { word := [8, 4, 4, 12, 8, 0, 8], weights := [0, 1, 1, 0] }

def points13 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 5148, representative 3162.
def source14 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B024.Data.entryAt ⟨73, by decide +kernel⟩

def target14 : Weights.Entry :=
  { word := [8, 4, 4, 12, 8, 8, 8], weights := [1, 0, 1, 0] }

-- Period 7, original row 5154, representative 3109.
def source15 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B024.Data.entryAt ⟨20, by decide +kernel⟩

def target15 : Weights.Entry :=
  { word := [8, 4, 6, 8, 8, 8, 8], weights := [0, 1, 1, 0] }

-- Period 7, original row 5160, representative 3171.
def source16 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B024.Data.entryAt ⟨82, by decide +kernel⟩

def target16 : Weights.Entry :=
  { word := [8, 4, 8, 4, 2, 0, 8], weights := [1, 0, 0, 1] }

def points16 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 5166, representative 3149.
def source17 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B024.Data.entryAt ⟨60, by decide +kernel⟩

def target17 : Weights.Entry :=
  { word := [8, 4, 8, 4, 2, 8, 8], weights := [1, 0, 1, 0] }

-- Period 7, original row 5186, representative 3172.
def source18 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B024.Data.entryAt ⟨83, by decide +kernel⟩

def target18 : Weights.Entry :=
  { word := [8, 4, 8, 4, 10, 0, 8], weights := [1, 0, 0, 1] }

def points18 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 5192, representative 3150.
def source19 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B024.Data.entryAt ⟨61, by decide +kernel⟩

def target19 : Weights.Entry :=
  { word := [8, 4, 8, 4, 10, 8, 8], weights := [1, 0, 1, 0] }

-- Period 7, original row 5202, representative 3174.
def source20 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B024.Data.entryAt ⟨85, by decide +kernel⟩

def target20 : Weights.Entry :=
  { word := [8, 4, 8, 12, 2, 0, 8], weights := [0, 1, 1, 0] }

def points20 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 5208, representative 3152.
def source21 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B024.Data.entryAt ⟨63, by decide +kernel⟩

def target21 : Weights.Entry :=
  { word := [8, 4, 8, 12, 2, 8, 8], weights := [1, 0, 1, 0] }

-- Period 7, original row 5228, representative 3173.
def source22 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B024.Data.entryAt ⟨84, by decide +kernel⟩

def target22 : Weights.Entry :=
  { word := [8, 4, 8, 12, 10, 0, 8], weights := [0, 1, 1, 0] }

def points22 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 5234, representative 3151.
def source23 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B024.Data.entryAt ⟨62, by decide +kernel⟩

def target23 : Weights.Entry :=
  { word := [8, 4, 8, 12, 10, 8, 8], weights := [1, 0, 1, 0] }

-- Period 7, original row 5242, representative 3114.
def source24 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B024.Data.entryAt ⟨25, by decide +kernel⟩

def target24 : Weights.Entry :=
  { word := [8, 4, 10, 0, 1, 8, 8], weights := [0, 1, 2, 1] }

-- Period 7, original row 5245, representative 3115.
def source25 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B024.Data.entryAt ⟨26, by decide +kernel⟩

def target25 : Weights.Entry :=
  { word := [8, 4, 10, 0, 9, 8, 8], weights := [0, 1, 2, 1] }

-- Period 7, original row 5248, representative 3111.
def source26 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B024.Data.entryAt ⟨22, by decide +kernel⟩

def target26 : Weights.Entry :=
  { word := [8, 4, 10, 8, 2, 8, 8], weights := [0, 1, 1, 0] }

-- Period 7, original row 5251, representative 3110.
def source27 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B024.Data.entryAt ⟨21, by decide +kernel⟩

def target27 : Weights.Entry :=
  { word := [8, 4, 10, 8, 10, 8, 8], weights := [0, 1, 1, 0] }

-- Period 7, original row 5256, representative 3157.
def source28 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B024.Data.entryAt ⟨68, by decide +kernel⟩

def target28 : Weights.Entry :=
  { word := [8, 4, 12, 4, 0, 8, 8], weights := [1, 0, 0, 1] }

-- Period 7, original row 5263, representative 3169.
def source29 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B024.Data.entryAt ⟨80, by decide +kernel⟩

def target29 : Weights.Entry :=
  { word := [8, 4, 12, 4, 8, 0, 8], weights := [1, 0, 0, 1] }

def points29 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 5270, representative 3158.
def source30 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B024.Data.entryAt ⟨69, by decide +kernel⟩

def target30 : Weights.Entry :=
  { word := [8, 4, 12, 4, 8, 8, 8], weights := [1, 0, 1, 0] }

-- Period 7, original row 5277, representative 3160.
def source31 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B024.Data.entryAt ⟨71, by decide +kernel⟩

def target31 : Weights.Entry :=
  { word := [8, 4, 12, 12, 0, 8, 8], weights := [1, 0, 1, 0] }

-- Period 7, original row 5284, representative 3170.
def source32 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B024.Data.entryAt ⟨81, by decide +kernel⟩

def target32 : Weights.Entry :=
  { word := [8, 4, 12, 12, 8, 0, 8], weights := [0, 1, 1, 0] }

def points32 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 5291, representative 3159.
def source33 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B024.Data.entryAt ⟨70, by decide +kernel⟩

def target33 : Weights.Entry :=
  { word := [8, 4, 12, 12, 8, 8, 8], weights := [1, 0, 1, 0] }

-- Period 7, original row 5318, representative 3116.
def source34 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B024.Data.entryAt ⟨27, by decide +kernel⟩

def target34 : Weights.Entry :=
  { word := [8, 8, 0, 1, 4, 2, 8], weights := [1, 2, 1, 0] }

def points34 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 5324, representative 3114.
def source35 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B024.Data.entryAt ⟨25, by decide +kernel⟩

def target35 : Weights.Entry :=
  { word := [8, 8, 0, 1, 12, 2, 8], weights := [1, 2, 1, 0] }

def points35 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 5330, representative 3156.
def source36 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B024.Data.entryAt ⟨67, by decide +kernel⟩

def target36 : Weights.Entry :=
  { word := [8, 8, 0, 2, 2, 2, 8], weights := [1, 0, 0, 1] }

def points36 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 5334, representative 3157.
def source37 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B024.Data.entryAt ⟨68, by decide +kernel⟩

def target37 : Weights.Entry :=
  { word := [8, 8, 0, 2, 10, 2, 8], weights := [1, 0, 0, 1] }

def points37 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 5344, representative 3195.
def source38 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B024.Data.entryAt ⟨106, by decide +kernel⟩

def target38 : Weights.Entry :=
  { word := [8, 8, 0, 4, 2, 0, 8], weights := [1, 0, 0, 1] }

def points38 : List (ℕ × ℕ) := [(0, 1), (1, 2), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 5350, representative 3184.
def source39 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B024.Data.entryAt ⟨95, by decide +kernel⟩

def target39 : Weights.Entry :=
  { word := [8, 8, 0, 4, 2, 8, 8], weights := [1, 0, 1, 0] }

-- Period 7, original row 5356, representative 3130.
def source40 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B024.Data.entryAt ⟨41, by decide +kernel⟩

def target40 : Weights.Entry :=
  { word := [8, 8, 0, 4, 6, 0, 8], weights := [1, 0, 0, 1] }

def points40 : List (ℕ × ℕ) := [(0, 1), (1, 2), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 5358, representative 3118.
def source41 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B024.Data.entryAt ⟨29, by decide +kernel⟩

def target41 : Weights.Entry :=
  { word := [8, 8, 0, 4, 6, 8, 8], weights := [1, 0, 0, 1] }

-- Period 7, original row 5370, representative 3196.
def source42 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B024.Data.entryAt ⟨107, by decide +kernel⟩

def target42 : Weights.Entry :=
  { word := [8, 8, 0, 4, 10, 0, 8], weights := [1, 0, 0, 1] }

def points42 : List (ℕ × ℕ) := [(0, 1), (1, 2), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 5376, representative 3185.
def source43 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B024.Data.entryAt ⟨96, by decide +kernel⟩

def target43 : Weights.Entry :=
  { word := [8, 8, 0, 4, 10, 8, 8], weights := [1, 0, 1, 0] }

-- Period 7, original row 5381, representative 3191.
def source44 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B024.Data.entryAt ⟨102, by decide +kernel⟩

def target44 : Weights.Entry :=
  { word := [8, 8, 0, 6, 2, 0, 8], weights := [0, 1, 0, 0] }

def points44 : List (ℕ × ℕ) := [(0, 1), (1, 2), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 5382, representative 3180.
def source45 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B024.Data.entryAt ⟨91, by decide +kernel⟩

def target45 : Weights.Entry :=
  { word := [8, 8, 0, 6, 2, 8, 8], weights := [1, 0, 1, 0] }

-- Period 7, original row 5383, representative 3194.
def source46 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B024.Data.entryAt ⟨105, by decide +kernel⟩

def target46 : Weights.Entry :=
  { word := [8, 8, 0, 6, 10, 0, 8], weights := [0, 1, 0, 0] }

def points46 : List (ℕ × ℕ) := [(0, 1), (1, 2), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 5384, representative 3181.
def source47 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B024.Data.entryAt ⟨92, by decide +kernel⟩

def target47 : Weights.Entry :=
  { word := [8, 8, 0, 6, 10, 8, 8], weights := [1, 0, 1, 0] }

-- Period 7, original row 5393, representative 3163.
def source48 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B024.Data.entryAt ⟨74, by decide +kernel⟩

def target48 : Weights.Entry :=
  { word := [8, 8, 0, 10, 2, 2, 8], weights := [0, 1, 0, 1] }

def points48 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 5395, representative 3160.
def source49 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B024.Data.entryAt ⟨71, by decide +kernel⟩

def target49 : Weights.Entry :=
  { word := [8, 8, 0, 10, 10, 2, 8], weights := [0, 1, 0, 1] }

def points49 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 5408, representative 3198.
def source50 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B024.Data.entryAt ⟨109, by decide +kernel⟩

def target50 : Weights.Entry :=
  { word := [8, 8, 0, 12, 2, 0, 8], weights := [1, 0, 0, 1] }

def points50 : List (ℕ × ℕ) := [(0, 1), (1, 2), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 5414, representative 3187.
def source51 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B024.Data.entryAt ⟨98, by decide +kernel⟩

def target51 : Weights.Entry :=
  { word := [8, 8, 0, 12, 2, 8, 8], weights := [1, 0, 1, 0] }

-- Period 7, original row 5419, representative 3133.
def source52 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B024.Data.entryAt ⟨44, by decide +kernel⟩

def target52 : Weights.Entry :=
  { word := [8, 8, 0, 12, 6, 0, 8], weights := [1, 0, 0, 1] }

def points52 : List (ℕ × ℕ) := [(0, 1), (1, 2), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 5421, representative 3121.
def source53 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B024.Data.entryAt ⟨32, by decide +kernel⟩

def target53 : Weights.Entry :=
  { word := [8, 8, 0, 12, 6, 8, 8], weights := [1, 0, 0, 1] }

-- Period 7, original row 5433, representative 3197.
def source54 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B024.Data.entryAt ⟨108, by decide +kernel⟩

def target54 : Weights.Entry :=
  { word := [8, 8, 0, 12, 10, 0, 8], weights := [1, 0, 0, 1] }

def points54 : List (ℕ × ℕ) := [(0, 1), (1, 2), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 5439, representative 3186.
def source55 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B024.Data.entryAt ⟨97, by decide +kernel⟩

def target55 : Weights.Entry :=
  { word := [8, 8, 0, 12, 10, 8, 8], weights := [1, 0, 1, 0] }

-- Period 7, original row 5447, representative 3101.
def source56 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B024.Data.entryAt ⟨12, by decide +kernel⟩

def target56 : Weights.Entry :=
  { word := [8, 8, 1, 4, 2, 0, 8], weights := [1, 0, 0, 1] }

def points56 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 5453, representative 3091.
def source57 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B024.Data.entryAt ⟨2, by decide +kernel⟩

def target57 : Weights.Entry :=
  { word := [8, 8, 1, 4, 2, 8, 8], weights := [1, 0, 1, 0] }

-- Period 7, original row 5469, representative 3106.
def source58 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B024.Data.entryAt ⟨17, by decide +kernel⟩

def target58 : Weights.Entry :=
  { word := [8, 8, 1, 4, 10, 0, 8], weights := [1, 0, 0, 1] }

def points58 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 5475, representative 3092.
def source59 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B024.Data.entryAt ⟨3, by decide +kernel⟩

def target59 : Weights.Entry :=
  { word := [8, 8, 1, 4, 10, 8, 8], weights := [1, 0, 1, 0] }

-- Period 7, original row 5483, representative 3108.
def source60 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B024.Data.entryAt ⟨19, by decide +kernel⟩

def target60 : Weights.Entry :=
  { word := [8, 8, 1, 12, 2, 0, 8], weights := [1, 0, 0, 1] }

def points60 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 5489, representative 3094.
def source61 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B024.Data.entryAt ⟨5, by decide +kernel⟩

def target61 : Weights.Entry :=
  { word := [8, 8, 1, 12, 2, 8, 8], weights := [1, 0, 1, 0] }

-- Period 7, original row 5505, representative 3107.
def source62 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B024.Data.entryAt ⟨18, by decide +kernel⟩

def target62 : Weights.Entry :=
  { word := [8, 8, 1, 12, 10, 0, 8], weights := [1, 0, 0, 1] }

def points62 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 5511, representative 3093.
def source63 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B024.Data.entryAt ⟨4, by decide +kernel⟩

def target63 : Weights.Entry :=
  { word := [8, 8, 1, 12, 10, 8, 8], weights := [1, 0, 1, 0] }

-- Period 7, original row 5519, representative 3144.
def source64 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B024.Data.entryAt ⟨55, by decide +kernel⟩

def target64 : Weights.Entry :=
  { word := [8, 8, 2, 2, 2, 0, 8], weights := [0, 1, 0, 0] }

def points64 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 5523, representative 3206.
def source65 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B024.Data.entryAt ⟨117, by decide +kernel⟩

def target65 : Weights.Entry :=
  { word := [8, 8, 2, 2, 2, 8, 0], weights := [0, 1, 0, 0] }

def points65 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 5527, representative 3122.
def source66 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B024.Data.entryAt ⟨33, by decide +kernel⟩

def target66 : Weights.Entry :=
  { word := [8, 8, 2, 2, 2, 8, 8], weights := [1, 0, 0, 1] }

-- Period 7, original row 5534, representative 3145.
def source67 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B024.Data.entryAt ⟨56, by decide +kernel⟩

def target67 : Weights.Entry :=
  { word := [8, 8, 2, 2, 10, 0, 8], weights := [0, 1, 0, 0] }

def points67 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 5538, representative 3207.
def source68 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B024.Data.entryAt ⟨118, by decide +kernel⟩

def target68 : Weights.Entry :=
  { word := [8, 8, 2, 2, 10, 8, 0], weights := [0, 1, 0, 0] }

def points68 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 5542, representative 3127.
def source69 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B024.Data.entryAt ⟨38, by decide +kernel⟩

def target69 : Weights.Entry :=
  { word := [8, 8, 2, 2, 10, 8, 8], weights := [1, 0, 0, 1] }

-- Period 7, original row 5549, representative 3147.
def source70 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B024.Data.entryAt ⟨58, by decide +kernel⟩

def target70 : Weights.Entry :=
  { word := [8, 8, 2, 10, 2, 0, 8], weights := [0, 1, 0, 0] }

def points70 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 5556, representative 3129.
def source71 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B024.Data.entryAt ⟨40, by decide +kernel⟩

def target71 : Weights.Entry :=
  { word := [8, 8, 2, 10, 2, 8, 8], weights := [0, 1, 1, 0] }

-- Period 7, original row 5563, representative 3146.
def source72 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B024.Data.entryAt ⟨57, by decide +kernel⟩

def target72 : Weights.Entry :=
  { word := [8, 8, 2, 10, 10, 0, 8], weights := [0, 1, 0, 0] }

def points72 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 5570, representative 3128.
def source73 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B024.Data.entryAt ⟨39, by decide +kernel⟩

def target73 : Weights.Entry :=
  { word := [8, 8, 2, 10, 10, 8, 8], weights := [0, 1, 1, 0] }

-- Period 7, original row 5575, representative 3164.
def source74 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B024.Data.entryAt ⟨75, by decide +kernel⟩

def target74 : Weights.Entry :=
  { word := [8, 8, 4, 2, 0, 1, 8], weights := [0, 1, 0, 1] }

def points74 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 5577, representative 3148.
def source75 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B024.Data.entryAt ⟨59, by decide +kernel⟩

def target75 : Weights.Entry :=
  { word := [8, 8, 4, 2, 0, 2, 8], weights := [0, 1, 0, 1] }

def points75 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 5582, representative 3184.
def source76 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B024.Data.entryAt ⟨95, by decide +kernel⟩

def target76 : Weights.Entry :=
  { word := [8, 8, 4, 2, 0, 8, 8], weights := [0, 1, 0, 1] }

def points76 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 5587, representative 3091.
def source77 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B024.Data.entryAt ⟨2, by decide +kernel⟩

def target77 : Weights.Entry :=
  { word := [8, 8, 4, 2, 0, 9, 8], weights := [0, 1, 0, 1] }

def points77 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 5591, representative 3149.
def source78 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B024.Data.entryAt ⟨60, by decide +kernel⟩

def target78 : Weights.Entry :=
  { word := [8, 8, 4, 2, 8, 2, 8], weights := [0, 1, 0, 1] }

def points78 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 5597, representative 3134.
def source79 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B024.Data.entryAt ⟨45, by decide +kernel⟩

def target79 : Weights.Entry :=
  { word := [8, 8, 4, 4, 4, 0, 8], weights := [1, 0, 0, 1] }

def points79 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 5599, representative 3122.
def source80 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B024.Data.entryAt ⟨33, by decide +kernel⟩

def target80 : Weights.Entry :=
  { word := [8, 8, 4, 4, 4, 8, 8], weights := [1, 0, 0, 1] }

def points80 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 5601, representative 3135.
def source81 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B024.Data.entryAt ⟨46, by decide +kernel⟩

def target81 : Weights.Entry :=
  { word := [8, 8, 4, 4, 12, 0, 8], weights := [1, 0, 0, 1] }

def points81 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 5603, representative 3123.
def source82 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B024.Data.entryAt ⟨34, by decide +kernel⟩

def target82 : Weights.Entry :=
  { word := [8, 8, 4, 4, 12, 8, 8], weights := [1, 0, 0, 1] }

-- Period 7, original row 5604, representative 3188.
def source83 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B024.Data.entryAt ⟨99, by decide +kernel⟩

def target83 : Weights.Entry :=
  { word := [8, 8, 4, 6, 0, 0, 8], weights := [0, 1, 0, 1] }

def points83 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 5605, representative 3180.
def source84 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B024.Data.entryAt ⟨91, by decide +kernel⟩

def target84 : Weights.Entry :=
  { word := [8, 8, 4, 6, 0, 8, 8], weights := [0, 1, 0, 1] }

def points84 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 5606, representative 3190.
def source85 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B024.Data.entryAt ⟨101, by decide +kernel⟩

def target85 : Weights.Entry :=
  { word := [8, 8, 4, 6, 8, 0, 8], weights := [0, 1, 0, 0] }

def points85 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 5607, representative 3183.
def source86 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B024.Data.entryAt ⟨94, by decide +kernel⟩

def target86 : Weights.Entry :=
  { word := [8, 8, 4, 6, 8, 8, 8], weights := [1, 0, 1, 0] }

-- Period 7, original row 5609, representative 3113.
def source87 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B024.Data.entryAt ⟨24, by decide +kernel⟩

def target87 : Weights.Entry :=
  { word := [8, 8, 4, 8, 4, 2, 8], weights := [0, 1, 1, 0] }

def points87 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 5613, representative 3111.
def source88 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B024.Data.entryAt ⟨22, by decide +kernel⟩

def target88 : Weights.Entry :=
  { word := [8, 8, 4, 8, 12, 2, 8], weights := [0, 1, 1, 0] }

def points88 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 5616, representative 3167.
def source89 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B024.Data.entryAt ⟨78, by decide +kernel⟩

def target89 : Weights.Entry :=
  { word := [8, 8, 4, 10, 0, 1, 8], weights := [0, 1, 0, 1] }

def points89 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 5617, representative 3155.
def source90 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B024.Data.entryAt ⟨66, by decide +kernel⟩

def target90 : Weights.Entry :=
  { word := [8, 8, 4, 10, 0, 2, 8], weights := [0, 1, 0, 1] }

def points90 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 5621, representative 3187.
def source91 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B024.Data.entryAt ⟨98, by decide +kernel⟩

def target91 : Weights.Entry :=
  { word := [8, 8, 4, 10, 0, 8, 8], weights := [0, 1, 0, 1] }

def points91 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 5625, representative 3094.
def source92 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B024.Data.entryAt ⟨5, by decide +kernel⟩

def target92 : Weights.Entry :=
  { word := [8, 8, 4, 10, 0, 9, 8], weights := [0, 1, 0, 1] }

def points92 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 5626, representative 3090.
def source93 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B024.Data.entryAt ⟨1, by decide +kernel⟩

def target93 : Weights.Entry :=
  { word := [8, 8, 4, 10, 0, 10, 8], weights := [1, 0, 0, 1] }

-- Period 7, original row 5627, representative 3152.
def source94 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B024.Data.entryAt ⟨63, by decide +kernel⟩

def target94 : Weights.Entry :=
  { word := [8, 8, 4, 10, 8, 2, 8], weights := [0, 1, 0, 1] }

def points94 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 5635, representative 3141.
def source95 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B024.Data.entryAt ⟨52, by decide +kernel⟩

def target95 : Weights.Entry :=
  { word := [8, 8, 4, 12, 4, 0, 8], weights := [1, 0, 0, 1] }

def points95 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 5637, representative 3129.
def source96 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B024.Data.entryAt ⟨40, by decide +kernel⟩

def target96 : Weights.Entry :=
  { word := [8, 8, 4, 12, 4, 8, 8], weights := [0, 1, 1, 0] }

def points96 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 5638, representative 3138.
def source97 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B024.Data.entryAt ⟨49, by decide +kernel⟩

def target97 : Weights.Entry :=
  { word := [8, 8, 4, 12, 12, 0, 8], weights := [0, 1, 1, 0] }

def points97 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 5640, representative 3126.
def source98 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B024.Data.entryAt ⟨37, by decide +kernel⟩

def target98 : Weights.Entry :=
  { word := [8, 8, 4, 12, 12, 8, 8], weights := [0, 1, 1, 0] }

-- Period 7, original row 5641, representative 3202.
def source99 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B024.Data.entryAt ⟨113, by decide +kernel⟩

def target99 : Weights.Entry :=
  { word := [8, 8, 6, 2, 0, 8, 0], weights := [0, 1, 0, 0] }

def points99 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 5645, representative 3118.
def source100 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B024.Data.entryAt ⟨29, by decide +kernel⟩

def target100 : Weights.Entry :=
  { word := [8, 8, 6, 2, 0, 8, 8], weights := [1, 0, 0, 1] }

def points100 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 5649, representative 3203.
def source101 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B024.Data.entryAt ⟨114, by decide +kernel⟩

def target101 : Weights.Entry :=
  { word := [8, 8, 6, 2, 8, 8, 0], weights := [0, 1, 0, 0] }

def points101 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 5653, representative 3119.
def source102 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B024.Data.entryAt ⟨30, by decide +kernel⟩

def target102 : Weights.Entry :=
  { word := [8, 8, 6, 2, 8, 8, 8], weights := [1, 0, 0, 1] }

-- Period 7, original row 5660, representative 3121.
def source103 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B024.Data.entryAt ⟨32, by decide +kernel⟩

def target103 : Weights.Entry :=
  { word := [8, 8, 6, 10, 0, 8, 8], weights := [1, 0, 0, 1] }

def points103 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 5667, representative 3120.
def source104 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B024.Data.entryAt ⟨31, by decide +kernel⟩

def target104 : Weights.Entry :=
  { word := [8, 8, 6, 10, 8, 8, 8], weights := [0, 1, 1, 0] }

-- Period 7, original row 5672, representative 3117.
def source105 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B024.Data.entryAt ⟨28, by decide +kernel⟩

def target105 : Weights.Entry :=
  { word := [8, 8, 8, 1, 4, 2, 8], weights := [1, 2, 1, 0] }

def points105 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 5678, representative 3115.
def source106 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B024.Data.entryAt ⟨26, by decide +kernel⟩

def target106 : Weights.Entry :=
  { word := [8, 8, 8, 1, 12, 2, 8], weights := [1, 2, 1, 0] }

def points106 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 5684, representative 3161.
def source107 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B024.Data.entryAt ⟨72, by decide +kernel⟩

def target107 : Weights.Entry :=
  { word := [8, 8, 8, 2, 2, 2, 8], weights := [0, 1, 0, 1] }

def points107 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 5688, representative 3158.
def source108 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B024.Data.entryAt ⟨69, by decide +kernel⟩

def target108 : Weights.Entry :=
  { word := [8, 8, 8, 2, 10, 2, 8], weights := [0, 1, 0, 1] }

def points108 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 5696, representative 3131.
def source109 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B024.Data.entryAt ⟨42, by decide +kernel⟩

def target109 : Weights.Entry :=
  { word := [8, 8, 8, 4, 6, 0, 8], weights := [1, 0, 0, 1] }

def points109 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 5698, representative 3119.
def source110 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B024.Data.entryAt ⟨30, by decide +kernel⟩

def target110 : Weights.Entry :=
  { word := [8, 8, 8, 4, 6, 8, 8], weights := [1, 0, 0, 1] }

def points110 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 5703, representative 3192.
def source111 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B024.Data.entryAt ⟨103, by decide +kernel⟩

def target111 : Weights.Entry :=
  { word := [8, 8, 8, 6, 2, 0, 8], weights := [0, 1, 0, 0] }

def points111 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 5704, representative 3183.
def source112 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B024.Data.entryAt ⟨94, by decide +kernel⟩

def target112 : Weights.Entry :=
  { word := [8, 8, 8, 6, 2, 8, 8], weights := [0, 1, 0, 1] }

def points112 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 5705, representative 3193.
def source113 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B024.Data.entryAt ⟨104, by decide +kernel⟩

def target113 : Weights.Entry :=
  { word := [8, 8, 8, 6, 10, 0, 8], weights := [0, 1, 0, 0] }

def points113 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 5706, representative 3182.
def source114 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B024.Data.entryAt ⟨93, by decide +kernel⟩

def target114 : Weights.Entry :=
  { word := [8, 8, 8, 6, 10, 8, 8], weights := [1, 0, 1, 0] }

-- Period 7, original row 5709, representative 3109.
def source115 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B024.Data.entryAt ⟨20, by decide +kernel⟩

def target115 : Weights.Entry :=
  { word := [8, 8, 8, 8, 6, 2, 8], weights := [0, 1, 1, 0] }

def points115 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 5721, representative 3162.
def source116 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B024.Data.entryAt ⟨73, by decide +kernel⟩

def target116 : Weights.Entry :=
  { word := [8, 8, 8, 10, 2, 2, 8], weights := [0, 1, 0, 1] }

def points116 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 5723, representative 3159.
def source117 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B024.Data.entryAt ⟨70, by decide +kernel⟩

def target117 : Weights.Entry :=
  { word := [8, 8, 8, 10, 10, 2, 8], weights := [0, 1, 0, 1] }

def points117 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 5729, representative 3132.
def source118 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B024.Data.entryAt ⟨43, by decide +kernel⟩

def target118 : Weights.Entry :=
  { word := [8, 8, 8, 12, 6, 0, 8], weights := [0, 1, 1, 0] }

def points118 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 5731, representative 3120.
def source119 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B024.Data.entryAt ⟨31, by decide +kernel⟩

def target119 : Weights.Entry :=
  { word := [8, 8, 8, 12, 6, 8, 8], weights := [0, 1, 1, 0] }

def points119 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 5752, representative 3204.
def source120 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B024.Data.entryAt ⟨115, by decide +kernel⟩

def target120 : Weights.Entry :=
  { word := [8, 8, 10, 2, 2, 8, 0], weights := [0, 1, 0, 0] }

def points120 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 5756, representative 3123.
def source121 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B024.Data.entryAt ⟨34, by decide +kernel⟩

def target121 : Weights.Entry :=
  { word := [8, 8, 10, 2, 2, 8, 8], weights := [1, 0, 0, 1] }

def points121 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 5760, representative 3205.
def source122 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B024.Data.entryAt ⟨116, by decide +kernel⟩

def target122 : Weights.Entry :=
  { word := [8, 8, 10, 2, 10, 8, 0], weights := [0, 1, 0, 0] }

def points122 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 5764, representative 3124.
def source123 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B024.Data.entryAt ⟨35, by decide +kernel⟩

def target123 : Weights.Entry :=
  { word := [8, 8, 10, 2, 10, 8, 8], weights := [1, 0, 0, 1] }

-- Period 7, original row 5771, representative 3126.
def source124 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B024.Data.entryAt ⟨37, by decide +kernel⟩

def target124 : Weights.Entry :=
  { word := [8, 8, 10, 10, 2, 8, 8], weights := [0, 1, 1, 0] }

def points124 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 5778, representative 3125.
def source125 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B024.Data.entryAt ⟨36, by decide +kernel⟩

def target125 : Weights.Entry :=
  { word := [8, 8, 10, 10, 10, 8, 8], weights := [0, 1, 1, 0] }

-- Period 7, original row 5783, representative 3165.
def source126 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B024.Data.entryAt ⟨76, by decide +kernel⟩

def target126 : Weights.Entry :=
  { word := [8, 8, 12, 2, 0, 1, 8], weights := [0, 1, 0, 1] }

def points126 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 5785, representative 3153.
def source127 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B024.Data.entryAt ⟨64, by decide +kernel⟩

def target127 : Weights.Entry :=
  { word := [8, 8, 12, 2, 0, 2, 8], weights := [0, 1, 0, 1] }

def points127 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

def period7Entries : List Weights.Entry := [target0, target1, target2, target3, target4, target5, target6, target7, target8, target9, target10, target11, target12, target13, target14, target15, target16, target17, target18, target19, target20, target21, target22, target23, target24, target25, target26, target27, target28, target29, target30, target31, target32, target33, target34, target35, target36, target37, target38, target39, target40, target41, target42, target43, target44, target45, target46, target47, target48, target49, target50, target51, target52, target53, target54, target55, target56, target57, target58, target59, target60, target61, target62, target63, target64, target65, target66, target67, target68, target69, target70, target71, target72, target73, target74, target75, target76, target77, target78, target79, target80, target81, target82, target83, target84, target85, target86, target87, target88, target89, target90, target91, target92, target93, target94, target95, target96, target97, target98, target99, target100, target101, target102, target103, target104, target105, target106, target107, target108, target109, target110, target111, target112, target113, target114, target115, target116, target117, target118, target119, target120, target121, target122, target123, target124, target125, target126, target127]

def period7Chunk : RowCoverage.Chunk where
  rows := [⟨5069, target0⟩, ⟨5075, target1⟩, ⟨5078, target2⟩, ⟨5082, target3⟩, ⟨5086, target4⟩, ⟨5090, target5⟩, ⟨5094, target6⟩, ⟨5099, target7⟩, ⟨5106, target8⟩, ⟨5113, target9⟩, ⟨5120, target10⟩, ⟨5127, target11⟩, ⟨5134, target12⟩, ⟨5141, target13⟩, ⟨5148, target14⟩, ⟨5154, target15⟩, ⟨5160, target16⟩, ⟨5166, target17⟩, ⟨5186, target18⟩, ⟨5192, target19⟩, ⟨5202, target20⟩, ⟨5208, target21⟩, ⟨5228, target22⟩, ⟨5234, target23⟩, ⟨5242, target24⟩, ⟨5245, target25⟩, ⟨5248, target26⟩, ⟨5251, target27⟩, ⟨5256, target28⟩, ⟨5263, target29⟩, ⟨5270, target30⟩, ⟨5277, target31⟩, ⟨5284, target32⟩, ⟨5291, target33⟩, ⟨5318, target34⟩, ⟨5324, target35⟩, ⟨5330, target36⟩, ⟨5334, target37⟩, ⟨5344, target38⟩, ⟨5350, target39⟩, ⟨5356, target40⟩, ⟨5358, target41⟩, ⟨5370, target42⟩, ⟨5376, target43⟩, ⟨5381, target44⟩, ⟨5382, target45⟩, ⟨5383, target46⟩, ⟨5384, target47⟩, ⟨5393, target48⟩, ⟨5395, target49⟩, ⟨5408, target50⟩, ⟨5414, target51⟩, ⟨5419, target52⟩, ⟨5421, target53⟩, ⟨5433, target54⟩, ⟨5439, target55⟩, ⟨5447, target56⟩, ⟨5453, target57⟩, ⟨5469, target58⟩, ⟨5475, target59⟩, ⟨5483, target60⟩, ⟨5489, target61⟩, ⟨5505, target62⟩, ⟨5511, target63⟩, ⟨5519, target64⟩, ⟨5523, target65⟩, ⟨5527, target66⟩, ⟨5534, target67⟩, ⟨5538, target68⟩, ⟨5542, target69⟩, ⟨5549, target70⟩, ⟨5556, target71⟩, ⟨5563, target72⟩, ⟨5570, target73⟩, ⟨5575, target74⟩, ⟨5577, target75⟩, ⟨5582, target76⟩, ⟨5587, target77⟩, ⟨5591, target78⟩, ⟨5597, target79⟩, ⟨5599, target80⟩, ⟨5601, target81⟩, ⟨5603, target82⟩, ⟨5604, target83⟩, ⟨5605, target84⟩, ⟨5606, target85⟩, ⟨5607, target86⟩, ⟨5609, target87⟩, ⟨5613, target88⟩, ⟨5616, target89⟩, ⟨5617, target90⟩, ⟨5621, target91⟩, ⟨5625, target92⟩, ⟨5626, target93⟩, ⟨5627, target94⟩, ⟨5635, target95⟩, ⟨5637, target96⟩, ⟨5638, target97⟩, ⟨5640, target98⟩, ⟨5641, target99⟩, ⟨5645, target100⟩, ⟨5649, target101⟩, ⟨5653, target102⟩, ⟨5660, target103⟩, ⟨5667, target104⟩, ⟨5672, target105⟩, ⟨5678, target106⟩, ⟨5684, target107⟩, ⟨5688, target108⟩, ⟨5696, target109⟩, ⟨5698, target110⟩, ⟨5703, target111⟩, ⟨5704, target112⟩, ⟨5705, target113⟩, ⟨5706, target114⟩, ⟨5709, target115⟩, ⟨5721, target116⟩, ⟨5723, target117⟩, ⟨5729, target118⟩, ⟨5731, target119⟩, ⟨5752, target120⟩, ⟨5756, target121⟩, ⟨5760, target122⟩, ⟨5764, target123⟩, ⟨5771, target124⟩, ⟨5778, target125⟩, ⟨5783, target126⟩, ⟨5785, target127⟩]
  indexMask := 36154476012900548191191581652659202718090391396857438807758605915968201565324654444444387190515189451036876722585012144855081906765422359993847642519110185723897162863299517342815060953843459190434317279113154777610289469524736595940168032108989273803185149935136721853687601117159009644589314426435534392918055348162876511499704761858015082538745252566358350190988047616806072267217920487724532827788797307976693548432609551538990872828101393619705884675728344785899127947020701087855602358641751947893681074229192133360640798840017687651433639166448276145810322539591703098838980234210686351336291422089285596115784824772758065084626186469054139591827156363405677584873662975968197043083239925837526798109122617421910276308262498958093763792630153148773303880556179954228341029608234208592236354103865644950477508272933299875010574504828130190202575911822993737150363658266978051555944034718886662011202818823411262670654823845856889855495266073139098835718380498683197729205936114068165568986731452680960814591833341258000497592802012762086144438399337412688390802747924458096878081893738530531927450883970071799432854422076618280789172016670691873955810909600382451784036061121435551237096115932422719283371604144691789209261021283428608251700142490603939225135501476333856655334934899412873254329331188355582938588074882655543636001059094651984534943606283570453761596094548700173467528370730681099890933741340941449667073602684466027572271070526534605405331309046494864156391907278487294424120704749284591078771814084952737470316947099261360553264622570626941073407238179309161470759055586399092305913852370156386663481393828472703234775266252172950463863298851186724622435495660551517330498382535164874285837381663902601829871068905472
  count := 128

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem period7Chunk_entries :
    period7Chunk.rows.map RowCoverage.TaggedRow.entry = period7Entries := rfl

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem period7_index_check :
    RowCoverage.indexCheck CanonicalWords.count period7Chunk = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem period7_words_check :
    RowCoverage.wordsCheck CanonicalWords.wordAt period7Chunk = true := by
  decide +kernel

end FranklSmallCyclic.TransportBatches.G024.B001.Data
