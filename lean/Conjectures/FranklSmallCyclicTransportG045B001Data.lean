module

public import Conjectures.FranklSmallCyclicRowCoverage
public import Conjectures.FranklSmallCyclicCanonicalWords
public import Conjectures.FranklSmallCyclicOrbit8Block019Data

/-! 128 literal targets sharing one source proof block.
Original words and row indices are retained; weights may be transported.
-/
@[expose] public section

namespace FranklSmallCyclic.TransportBatches.G045.B001.Data

-- Period 8, original row 4809, representative 5804.
def source0 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B019.Data.entryAt ⟨54, by decide +kernel⟩

def target0 : Weights.Entry :=
  { word := [8, 2, 2, 10, 0, 9, 8], weights := [1, 0, 0, 1] }

-- Period 8, original row 4811, representative 5796.
def source1 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B019.Data.entryAt ⟨46, by decide +kernel⟩

def target1 : Weights.Entry :=
  { word := [8, 2, 2, 10, 0, 10, 8], weights := [1, 0, 0, 1] }

-- Period 8, original row 4816, representative 5813.
def source2 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B019.Data.entryAt ⟨63, by decide +kernel⟩

def target2 : Weights.Entry :=
  { word := [8, 2, 2, 10, 8, 0, 8], weights := [1, 0, 0, 1] }

def points2 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 4821, representative 5806.
def source3 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B019.Data.entryAt ⟨56, by decide +kernel⟩

def target3 : Weights.Entry :=
  { word := [8, 2, 2, 10, 8, 1, 8], weights := [1, 0, 0, 1] }

def points3 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 4823, representative 5798.
def source4 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B019.Data.entryAt ⟨48, by decide +kernel⟩

def target4 : Weights.Entry :=
  { word := [8, 2, 2, 10, 8, 2, 8], weights := [1, 0, 0, 1] }

-- Period 8, original row 4833, representative 5810.
def source5 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B019.Data.entryAt ⟨60, by decide +kernel⟩

def target5 : Weights.Entry :=
  { word := [8, 2, 2, 10, 8, 8, 8], weights := [1, 0, 0, 1] }

-- Period 8, original row 4838, representative 5803.
def source6 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B019.Data.entryAt ⟨53, by decide +kernel⟩

def target6 : Weights.Entry :=
  { word := [8, 2, 2, 10, 8, 9, 8], weights := [1, 0, 0, 1] }

-- Period 8, original row 4840, representative 5795.
def source7 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B019.Data.entryAt ⟨45, by decide +kernel⟩

def target7 : Weights.Entry :=
  { word := [8, 2, 2, 10, 8, 10, 8], weights := [1, 0, 0, 1] }

-- Period 8, original row 4848, representative 5822.
def source8 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B019.Data.entryAt ⟨72, by decide +kernel⟩

def target8 : Weights.Entry :=
  { word := [8, 2, 8, 2, 0, 1, 8], weights := [0, 1, 0, 1] }

def points8 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 4850, representative 5814.
def source9 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B019.Data.entryAt ⟨64, by decide +kernel⟩

def target9 : Weights.Entry :=
  { word := [8, 2, 8, 2, 0, 2, 8], weights := [1, 0, 0, 1] }

-- Period 8, original row 4855, representative 5826.
def source10 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B019.Data.entryAt ⟨76, by decide +kernel⟩

def target10 : Weights.Entry :=
  { word := [8, 2, 8, 2, 0, 8, 8], weights := [1, 0, 0, 1] }

-- Period 8, original row 4860, representative 5823.
def source11 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B019.Data.entryAt ⟨73, by decide +kernel⟩

def target11 : Weights.Entry :=
  { word := [8, 2, 8, 2, 0, 9, 8], weights := [1, 0, 0, 1] }

-- Period 8, original row 4862, representative 5815.
def source12 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B019.Data.entryAt ⟨65, by decide +kernel⟩

def target12 : Weights.Entry :=
  { word := [8, 2, 8, 2, 0, 10, 8], weights := [1, 0, 0, 1] }

-- Period 8, original row 4864, representative 5819.
def source13 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B019.Data.entryAt ⟨69, by decide +kernel⟩

def target13 : Weights.Entry :=
  { word := [8, 2, 8, 2, 8, 2, 8], weights := [0, 1, 0, 0] }

-- Period 8, original row 4865, representative 5765.
def source14 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B019.Data.entryAt ⟨16, by decide +kernel⟩

def target14 : Weights.Entry :=
  { word := [8, 2, 8, 2, 8, 6, 0], weights := [0, 1, 0, 0] }

def points14 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 4870, representative 5816.
def source15 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B019.Data.entryAt ⟨66, by decide +kernel⟩

def target15 : Weights.Entry :=
  { word := [8, 2, 8, 2, 8, 10, 8], weights := [0, 1, 0, 0] }

-- Period 8, original row 4871, representative 5763.
def source16 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B019.Data.entryAt ⟨14, by decide +kernel⟩

def target16 : Weights.Entry :=
  { word := [8, 2, 8, 4, 4, 4, 0], weights := [1, 0, 1, 0] }

def points16 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 4872, representative 5759.
def source17 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B019.Data.entryAt ⟨10, by decide +kernel⟩

def target17 : Weights.Entry :=
  { word := [8, 2, 8, 4, 4, 12, 0], weights := [1, 0, 1, 0] }

def points17 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 4873, representative 5761.
def source18 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B019.Data.entryAt ⟨12, by decide +kernel⟩

def target18 : Weights.Entry :=
  { word := [8, 2, 8, 4, 12, 4, 0], weights := [1, 0, 1, 0] }

def points18 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 4874, representative 5757.
def source19 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B019.Data.entryAt ⟨8, by decide +kernel⟩

def target19 : Weights.Entry :=
  { word := [8, 2, 8, 4, 12, 12, 0], weights := [1, 0, 1, 0] }

def points19 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 4875, representative 5754.
def source20 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B019.Data.entryAt ⟨5, by decide +kernel⟩

def target20 : Weights.Entry :=
  { word := [8, 2, 8, 6, 0, 4, 8], weights := [1, 1, 1, 1] }

def points20 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 4877, representative 5753.
def source21 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B019.Data.entryAt ⟨4, by decide +kernel⟩

def target21 : Weights.Entry :=
  { word := [8, 2, 8, 6, 8, 4, 8], weights := [0, 1, 1, 0] }

-- Period 8, original row 4879, representative 5840.
def source22 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B019.Data.entryAt ⟨90, by decide +kernel⟩

def target22 : Weights.Entry :=
  { word := [8, 2, 8, 8, 4, 2, 0], weights := [0, 1, 1, 0] }

def points22 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 4880, representative 5756.
def source23 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B019.Data.entryAt ⟨7, by decide +kernel⟩

def target23 : Weights.Entry :=
  { word := [8, 2, 8, 8, 4, 6, 0], weights := [0, 1, 1, 0] }

def points23 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 4882, representative 5838.
def source24 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B019.Data.entryAt ⟨88, by decide +kernel⟩

def target24 : Weights.Entry :=
  { word := [8, 2, 8, 8, 4, 10, 0], weights := [0, 1, 1, 0] }

def points24 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 4883, representative 5839.
def source25 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B019.Data.entryAt ⟨89, by decide +kernel⟩

def target25 : Weights.Entry :=
  { word := [8, 2, 8, 8, 12, 2, 0], weights := [0, 1, 1, 0] }

def points25 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 4884, representative 5755.
def source26 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B019.Data.entryAt ⟨6, by decide +kernel⟩

def target26 : Weights.Entry :=
  { word := [8, 2, 8, 8, 12, 6, 0], weights := [0, 1, 1, 0] }

def points26 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 4886, representative 5837.
def source27 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B019.Data.entryAt ⟨87, by decide +kernel⟩

def target27 : Weights.Entry :=
  { word := [8, 2, 8, 8, 12, 10, 0], weights := [0, 1, 1, 0] }

def points27 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 4888, representative 5825.
def source28 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B019.Data.entryAt ⟨75, by decide +kernel⟩

def target28 : Weights.Entry :=
  { word := [8, 2, 8, 10, 0, 1, 8], weights := [0, 1, 0, 1] }

def points28 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 4890, representative 5821.
def source29 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B019.Data.entryAt ⟨71, by decide +kernel⟩

def target29 : Weights.Entry :=
  { word := [8, 2, 8, 10, 0, 2, 8], weights := [1, 0, 0, 1] }

-- Period 8, original row 4891, representative 5767.
def source30 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B019.Data.entryAt ⟨18, by decide +kernel⟩

def target30 : Weights.Entry :=
  { word := [8, 2, 8, 10, 0, 6, 0], weights := [0, 1, 1, 0] }

def points30 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 4893, representative 5749.
def source31 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B019.Data.entryAt ⟨0, by decide +kernel⟩

def target31 : Weights.Entry :=
  { word := [8, 2, 8, 10, 0, 8, 1], weights := [0, 1, 0, 1] }

def points31 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 4896, representative 5827.
def source32 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B019.Data.entryAt ⟨77, by decide +kernel⟩

def target32 : Weights.Entry :=
  { word := [8, 2, 8, 10, 0, 8, 8], weights := [1, 0, 0, 1] }

-- Period 8, original row 4901, representative 5824.
def source33 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B019.Data.entryAt ⟨74, by decide +kernel⟩

def target33 : Weights.Entry :=
  { word := [8, 2, 8, 10, 0, 9, 8], weights := [1, 0, 0, 1] }

-- Period 8, original row 4903, representative 5818.
def source34 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B019.Data.entryAt ⟨68, by decide +kernel⟩

def target34 : Weights.Entry :=
  { word := [8, 2, 8, 10, 0, 10, 8], weights := [1, 0, 0, 1] }

-- Period 8, original row 4904, representative 5768.
def source35 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B019.Data.entryAt ⟨19, by decide +kernel⟩

def target35 : Weights.Entry :=
  { word := [8, 2, 8, 10, 0, 12, 0], weights := [0, 1, 1, 0] }

def points35 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 4906, representative 5820.
def source36 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B019.Data.entryAt ⟨70, by decide +kernel⟩

def target36 : Weights.Entry :=
  { word := [8, 2, 8, 10, 8, 2, 8], weights := [0, 1, 0, 0] }

-- Period 8, original row 4909, representative 5766.
def source37 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B019.Data.entryAt ⟨17, by decide +kernel⟩

def target37 : Weights.Entry :=
  { word := [8, 2, 8, 10, 8, 6, 0], weights := [0, 1, 0, 0] }

def points37 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 4914, representative 5817.
def source38 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B019.Data.entryAt ⟨67, by decide +kernel⟩

def target38 : Weights.Entry :=
  { word := [8, 2, 8, 10, 8, 10, 8], weights := [0, 1, 0, 0] }

-- Period 8, original row 4917, representative 5764.
def source39 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B019.Data.entryAt ⟨15, by decide +kernel⟩

def target39 : Weights.Entry :=
  { word := [8, 2, 8, 12, 4, 4, 0], weights := [0, 1, 1, 0] }

def points39 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 4919, representative 5760.
def source40 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B019.Data.entryAt ⟨11, by decide +kernel⟩

def target40 : Weights.Entry :=
  { word := [8, 2, 8, 12, 4, 12, 0], weights := [0, 1, 1, 0] }

def points40 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 4921, representative 5762.
def source41 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B019.Data.entryAt ⟨13, by decide +kernel⟩

def target41 : Weights.Entry :=
  { word := [8, 2, 8, 12, 12, 4, 0], weights := [0, 1, 1, 0] }

def points41 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 4923, representative 5758.
def source42 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B019.Data.entryAt ⟨9, by decide +kernel⟩

def target42 : Weights.Entry :=
  { word := [8, 2, 8, 12, 12, 12, 0], weights := [0, 1, 1, 0] }

def points42 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 4926, representative 5780.
def source43 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B019.Data.entryAt ⟨30, by decide +kernel⟩

def target43 : Weights.Entry :=
  { word := [8, 2, 10, 2, 0, 1, 8], weights := [1, 0, 0, 1] }

def points43 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 4928, representative 5772.
def source44 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B019.Data.entryAt ⟨22, by decide +kernel⟩

def target44 : Weights.Entry :=
  { word := [8, 2, 10, 2, 0, 2, 8], weights := [1, 0, 0, 1] }

-- Period 8, original row 4933, representative 5788.
def source45 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B019.Data.entryAt ⟨38, by decide +kernel⟩

def target45 : Weights.Entry :=
  { word := [8, 2, 10, 2, 0, 8, 8], weights := [1, 0, 0, 1] }

-- Period 8, original row 4938, representative 5781.
def source46 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B019.Data.entryAt ⟨31, by decide +kernel⟩

def target46 : Weights.Entry :=
  { word := [8, 2, 10, 2, 0, 9, 8], weights := [1, 0, 0, 1] }

-- Period 8, original row 4940, representative 5773.
def source47 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B019.Data.entryAt ⟨23, by decide +kernel⟩

def target47 : Weights.Entry :=
  { word := [8, 2, 10, 2, 0, 10, 8], weights := [1, 0, 0, 1] }

-- Period 8, original row 4942, representative 5785.
def source48 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B019.Data.entryAt ⟨35, by decide +kernel⟩

def target48 : Weights.Entry :=
  { word := [8, 2, 10, 2, 8, 1, 8], weights := [1, 0, 0, 1] }

def points48 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 4944, representative 5777.
def source49 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B019.Data.entryAt ⟨27, by decide +kernel⟩

def target49 : Weights.Entry :=
  { word := [8, 2, 10, 2, 8, 2, 8], weights := [1, 0, 0, 1] }

-- Period 8, original row 4949, representative 5789.
def source50 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B019.Data.entryAt ⟨39, by decide +kernel⟩

def target50 : Weights.Entry :=
  { word := [8, 2, 10, 2, 8, 8, 8], weights := [1, 0, 0, 1] }

-- Period 8, original row 4954, representative 5782.
def source51 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B019.Data.entryAt ⟨32, by decide +kernel⟩

def target51 : Weights.Entry :=
  { word := [8, 2, 10, 2, 8, 9, 8], weights := [1, 0, 0, 1] }

-- Period 8, original row 4956, representative 5774.
def source52 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B019.Data.entryAt ⟨24, by decide +kernel⟩

def target52 : Weights.Entry :=
  { word := [8, 2, 10, 2, 8, 10, 8], weights := [1, 0, 0, 1] }

-- Period 8, original row 4959, representative 5787.
def source53 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B019.Data.entryAt ⟨37, by decide +kernel⟩

def target53 : Weights.Entry :=
  { word := [8, 2, 10, 10, 0, 1, 8], weights := [1, 0, 0, 1] }

def points53 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 4961, representative 5779.
def source54 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B019.Data.entryAt ⟨29, by decide +kernel⟩

def target54 : Weights.Entry :=
  { word := [8, 2, 10, 10, 0, 2, 8], weights := [1, 0, 0, 1] }

-- Period 8, original row 4966, representative 5791.
def source55 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B019.Data.entryAt ⟨41, by decide +kernel⟩

def target55 : Weights.Entry :=
  { word := [8, 2, 10, 10, 0, 8, 8], weights := [1, 0, 0, 1] }

-- Period 8, original row 4971, representative 5784.
def source56 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B019.Data.entryAt ⟨34, by decide +kernel⟩

def target56 : Weights.Entry :=
  { word := [8, 2, 10, 10, 0, 9, 8], weights := [1, 0, 0, 1] }

-- Period 8, original row 4973, representative 5776.
def source57 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B019.Data.entryAt ⟨26, by decide +kernel⟩

def target57 : Weights.Entry :=
  { word := [8, 2, 10, 10, 0, 10, 8], weights := [1, 0, 0, 1] }

-- Period 8, original row 4976, representative 5786.
def source58 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B019.Data.entryAt ⟨36, by decide +kernel⟩

def target58 : Weights.Entry :=
  { word := [8, 2, 10, 10, 8, 1, 8], weights := [1, 0, 0, 1] }

def points58 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 4978, representative 5778.
def source59 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B019.Data.entryAt ⟨28, by decide +kernel⟩

def target59 : Weights.Entry :=
  { word := [8, 2, 10, 10, 8, 2, 8], weights := [1, 0, 0, 1] }

-- Period 8, original row 4988, representative 5790.
def source60 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B019.Data.entryAt ⟨40, by decide +kernel⟩

def target60 : Weights.Entry :=
  { word := [8, 2, 10, 10, 8, 8, 8], weights := [1, 0, 0, 1] }

-- Period 8, original row 4993, representative 5783.
def source61 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B019.Data.entryAt ⟨33, by decide +kernel⟩

def target61 : Weights.Entry :=
  { word := [8, 2, 10, 10, 8, 9, 8], weights := [1, 0, 0, 1] }

-- Period 8, original row 4995, representative 5775.
def source62 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B019.Data.entryAt ⟨25, by decide +kernel⟩

def target62 : Weights.Entry :=
  { word := [8, 2, 10, 10, 8, 10, 8], weights := [1, 0, 0, 1] }

-- Period 8, original row 5015, representative 5792.
def source63 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B019.Data.entryAt ⟨42, by decide +kernel⟩

def target63 : Weights.Entry :=
  { word := [8, 4, 0, 4, 4, 4, 8], weights := [1, 0, 0, 1] }

def points63 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 5018, representative 5814.
def source64 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B019.Data.entryAt ⟨64, by decide +kernel⟩

def target64 : Weights.Entry :=
  { word := [8, 4, 0, 4, 8, 4, 8], weights := [1, 0, 0, 1] }

def points64 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 5037, representative 5772.
def source65 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B019.Data.entryAt ⟨22, by decide +kernel⟩

def target65 : Weights.Entry :=
  { word := [8, 4, 0, 4, 12, 4, 8], weights := [1, 0, 0, 1] }

def points65 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 5051, representative 5799.
def source66 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B019.Data.entryAt ⟨49, by decide +kernel⟩

def target66 : Weights.Entry :=
  { word := [8, 4, 0, 12, 4, 4, 8], weights := [1, 0, 0, 1] }

def points66 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 5054, representative 5821.
def source67 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B019.Data.entryAt ⟨71, by decide +kernel⟩

def target67 : Weights.Entry :=
  { word := [8, 4, 0, 12, 8, 4, 8], weights := [1, 0, 0, 1] }

def points67 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 5073, representative 5779.
def source68 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B019.Data.entryAt ⟨29, by decide +kernel⟩

def target68 : Weights.Entry :=
  { word := [8, 4, 0, 12, 12, 4, 8], weights := [1, 0, 0, 1] }

def points68 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 5170, representative 5797.
def source69 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B019.Data.entryAt ⟨47, by decide +kernel⟩

def target69 : Weights.Entry :=
  { word := [8, 4, 8, 4, 4, 4, 8], weights := [1, 0, 0, 1] }

def points69 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 5175, representative 5819.
def source70 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B019.Data.entryAt ⟨69, by decide +kernel⟩

def target70 : Weights.Entry :=
  { word := [8, 4, 8, 4, 8, 4, 8], weights := [0, 0, 1, 0] }

def points70 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 5196, representative 5777.
def source71 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B019.Data.entryAt ⟨27, by decide +kernel⟩

def target71 : Weights.Entry :=
  { word := [8, 4, 8, 4, 12, 4, 8], weights := [1, 0, 0, 1] }

def points71 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 5212, representative 5798.
def source72 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B019.Data.entryAt ⟨48, by decide +kernel⟩

def target72 : Weights.Entry :=
  { word := [8, 4, 8, 12, 4, 4, 8], weights := [1, 0, 0, 1] }

def points72 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 5217, representative 5820.
def source73 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B019.Data.entryAt ⟨70, by decide +kernel⟩

def target73 : Weights.Entry :=
  { word := [8, 4, 8, 12, 8, 4, 8], weights := [0, 0, 1, 0] }

def points73 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 5238, representative 5778.
def source74 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B019.Data.entryAt ⟨28, by decide +kernel⟩

def target74 : Weights.Entry :=
  { word := [8, 4, 8, 12, 12, 4, 8], weights := [1, 0, 0, 1] }

def points74 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 5319, representative 5835.
def source75 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B019.Data.entryAt ⟨85, by decide +kernel⟩

def target75 : Weights.Entry :=
  { word := [8, 8, 0, 1, 4, 8, 4], weights := [0, 1, 0, 0] }

def points75 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 5325, representative 5833.
def source76 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B019.Data.entryAt ⟨83, by decide +kernel⟩

def target76 : Weights.Entry :=
  { word := [8, 8, 0, 1, 12, 8, 4], weights := [0, 1, 0, 0] }

def points76 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 5337, representative 5828.
def source77 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B019.Data.entryAt ⟨78, by decide +kernel⟩

def target77 : Weights.Entry :=
  { word := [8, 8, 0, 4, 0, 4, 8], weights := [1, 0, 2, 1] }

def points77 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 5354, representative 5808.
def source78 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B019.Data.entryAt ⟨58, by decide +kernel⟩

def target78 : Weights.Entry :=
  { word := [8, 8, 0, 4, 4, 4, 8], weights := [1, 0, 0, 1] }

def points78 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 5361, representative 5826.
def source79 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B019.Data.entryAt ⟨76, by decide +kernel⟩

def target79 : Weights.Entry :=
  { word := [8, 8, 0, 4, 8, 4, 8], weights := [1, 0, 0, 1] }

def points79 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 5380, representative 5788.
def source80 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B019.Data.entryAt ⟨38, by decide +kernel⟩

def target80 : Weights.Entry :=
  { word := [8, 8, 0, 4, 12, 4, 8], weights := [1, 0, 0, 1] }

def points80 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 5399, representative 5829.
def source81 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B019.Data.entryAt ⟨79, by decide +kernel⟩

def target81 : Weights.Entry :=
  { word := [8, 8, 0, 12, 0, 4, 8], weights := [1, 0, 0, 1] }

def points81 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 5418, representative 5811.
def source82 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B019.Data.entryAt ⟨61, by decide +kernel⟩

def target82 : Weights.Entry :=
  { word := [8, 8, 0, 12, 4, 4, 8], weights := [1, 0, 0, 1] }

def points82 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 5424, representative 5827.
def source83 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B019.Data.entryAt ⟨77, by decide +kernel⟩

def target83 : Weights.Entry :=
  { word := [8, 8, 0, 12, 8, 4, 8], weights := [1, 0, 0, 1] }

def points83 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 5443, representative 5791.
def source84 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B019.Data.entryAt ⟨41, by decide +kernel⟩

def target84 : Weights.Entry :=
  { word := [8, 8, 0, 12, 12, 4, 8], weights := [1, 0, 0, 1] }

def points84 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 5457, representative 5801.
def source85 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B019.Data.entryAt ⟨51, by decide +kernel⟩

def target85 : Weights.Entry :=
  { word := [8, 8, 1, 4, 4, 4, 8], weights := [1, 0, 0, 1] }

def points85 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 5460, representative 5823.
def source86 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B019.Data.entryAt ⟨73, by decide +kernel⟩

def target86 : Weights.Entry :=
  { word := [8, 8, 1, 4, 8, 4, 8], weights := [1, 0, 0, 1] }

def points86 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 5479, representative 5781.
def source87 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B019.Data.entryAt ⟨31, by decide +kernel⟩

def target87 : Weights.Entry :=
  { word := [8, 8, 1, 4, 12, 4, 8], weights := [1, 0, 0, 1] }

def points87 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 5493, representative 5804.
def source88 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B019.Data.entryAt ⟨54, by decide +kernel⟩

def target88 : Weights.Entry :=
  { word := [8, 8, 1, 12, 4, 4, 8], weights := [1, 0, 0, 1] }

def points88 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 5496, representative 5824.
def source89 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B019.Data.entryAt ⟨74, by decide +kernel⟩

def target89 : Weights.Entry :=
  { word := [8, 8, 1, 12, 8, 4, 8], weights := [1, 0, 0, 1] }

def points89 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 5515, representative 5784.
def source90 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B019.Data.entryAt ⟨34, by decide +kernel⟩

def target90 : Weights.Entry :=
  { word := [8, 8, 1, 12, 12, 4, 8], weights := [1, 0, 0, 1] }

def points90 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 5526, representative 5845.
def source91 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B019.Data.entryAt ⟨95, by decide +kernel⟩

def target91 : Weights.Entry :=
  { word := [8, 8, 2, 2, 2, 8, 4], weights := [1, 0, 0, 1] }

def points91 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 5541, representative 5846.
def source92 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B019.Data.entryAt ⟨96, by decide +kernel⟩

def target92 : Weights.Entry :=
  { word := [8, 8, 2, 2, 10, 8, 4], weights := [1, 0, 0, 1] }

def points92 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 5555, representative 5852.
def source93 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B019.Data.entryAt ⟨102, by decide +kernel⟩

def target93 : Weights.Entry :=
  { word := [8, 8, 2, 10, 2, 8, 4], weights := [1, 0, 0, 1] }

def points93 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 5569, representative 5849.
def source94 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B019.Data.entryAt ⟨99, by decide +kernel⟩

def target94 : Weights.Entry :=
  { word := [8, 8, 2, 10, 10, 8, 4], weights := [1, 0, 0, 1] }

def points94 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 5644, representative 5841.
def source95 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B019.Data.entryAt ⟨91, by decide +kernel⟩

def target95 : Weights.Entry :=
  { word := [8, 8, 6, 2, 0, 8, 4], weights := [1, 0, 0, 1] }

def points95 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 5652, representative 5842.
def source96 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B019.Data.entryAt ⟨92, by decide +kernel⟩

def target96 : Weights.Entry :=
  { word := [8, 8, 6, 2, 8, 8, 4], weights := [1, 0, 0, 1] }

def points96 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 5659, representative 5844.
def source97 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B019.Data.entryAt ⟨94, by decide +kernel⟩

def target97 : Weights.Entry :=
  { word := [8, 8, 6, 10, 0, 8, 4], weights := [1, 0, 0, 1] }

def points97 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 5666, representative 5843.
def source98 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B019.Data.entryAt ⟨93, by decide +kernel⟩

def target98 : Weights.Entry :=
  { word := [8, 8, 6, 10, 8, 8, 4], weights := [1, 0, 0, 1] }

def points98 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 5673, representative 5836.
def source99 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B019.Data.entryAt ⟨86, by decide +kernel⟩

def target99 : Weights.Entry :=
  { word := [8, 8, 8, 1, 4, 8, 4], weights := [0, 1, 0, 0] }

def points99 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 5679, representative 5834.
def source100 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B019.Data.entryAt ⟨84, by decide +kernel⟩

def target100 : Weights.Entry :=
  { word := [8, 8, 8, 1, 12, 8, 4], weights := [0, 1, 0, 0] }

def points100 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 5692, representative 5809.
def source101 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B019.Data.entryAt ⟨59, by decide +kernel⟩

def target101 : Weights.Entry :=
  { word := [8, 8, 8, 4, 4, 4, 8], weights := [1, 0, 0, 1] }

def points101 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 5700, representative 5789.
def source102 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B019.Data.entryAt ⟨39, by decide +kernel⟩

def target102 : Weights.Entry :=
  { word := [8, 8, 8, 4, 12, 4, 8], weights := [1, 0, 0, 1] }

def points102 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 5726, representative 5810.
def source103 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B019.Data.entryAt ⟨60, by decide +kernel⟩

def target103 : Weights.Entry :=
  { word := [8, 8, 8, 12, 4, 4, 8], weights := [1, 0, 0, 1] }

def points103 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 5733, representative 5790.
def source104 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B019.Data.entryAt ⟨40, by decide +kernel⟩

def target104 : Weights.Entry :=
  { word := [8, 8, 8, 12, 12, 4, 8], weights := [1, 0, 0, 1] }

def points104 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 5737, representative 5802.
def source105 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B019.Data.entryAt ⟨52, by decide +kernel⟩

def target105 : Weights.Entry :=
  { word := [8, 8, 9, 4, 4, 4, 8], weights := [1, 0, 0, 1] }

def points105 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 5741, representative 5782.
def source106 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B019.Data.entryAt ⟨32, by decide +kernel⟩

def target106 : Weights.Entry :=
  { word := [8, 8, 9, 4, 12, 4, 8], weights := [1, 0, 0, 1] }

def points106 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 5745, representative 5803.
def source107 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B019.Data.entryAt ⟨53, by decide +kernel⟩

def target107 : Weights.Entry :=
  { word := [8, 8, 9, 12, 4, 4, 8], weights := [1, 0, 0, 1] }

def points107 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 5749, representative 5783.
def source108 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B019.Data.entryAt ⟨33, by decide +kernel⟩

def target108 : Weights.Entry :=
  { word := [8, 8, 9, 12, 12, 4, 8], weights := [1, 0, 0, 1] }

def points108 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 5755, representative 5850.
def source109 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B019.Data.entryAt ⟨100, by decide +kernel⟩

def target109 : Weights.Entry :=
  { word := [8, 8, 10, 2, 2, 8, 4], weights := [1, 0, 0, 1] }

def points109 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 5763, representative 5847.
def source110 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B019.Data.entryAt ⟨97, by decide +kernel⟩

def target110 : Weights.Entry :=
  { word := [8, 8, 10, 2, 10, 8, 4], weights := [1, 0, 0, 1] }

def points110 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 5770, representative 5851.
def source111 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B019.Data.entryAt ⟨101, by decide +kernel⟩

def target111 : Weights.Entry :=
  { word := [8, 8, 10, 10, 2, 8, 4], weights := [1, 0, 0, 1] }

def points111 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 5777, representative 5848.
def source112 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B019.Data.entryAt ⟨98, by decide +kernel⟩

def target112 : Weights.Entry :=
  { word := [8, 8, 10, 10, 10, 8, 4], weights := [1, 0, 0, 1] }

def points112 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 6340, representative 5873.
def source113 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B019.Data.entryAt ⟨123, by decide +kernel⟩

def target113 : Weights.Entry :=
  { word := [8, 12, 0, 4, 2, 8, 4], weights := [1, 0, 0, 1] }

def points113 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 6345, representative 5793.
def source114 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B019.Data.entryAt ⟨43, by decide +kernel⟩

def target114 : Weights.Entry :=
  { word := [8, 12, 0, 4, 4, 4, 8], weights := [1, 0, 0, 1] }

def points114 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 6348, representative 5815.
def source115 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B019.Data.entryAt ⟨65, by decide +kernel⟩

def target115 : Weights.Entry :=
  { word := [8, 12, 0, 4, 8, 4, 8], weights := [1, 0, 0, 1] }

def points115 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 6362, representative 5874.
def source116 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B019.Data.entryAt ⟨124, by decide +kernel⟩

def target116 : Weights.Entry :=
  { word := [8, 12, 0, 4, 10, 8, 4], weights := [1, 0, 0, 1] }

def points116 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 6367, representative 5773.
def source117 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B019.Data.entryAt ⟨23, by decide +kernel⟩

def target117 : Weights.Entry :=
  { word := [8, 12, 0, 4, 12, 4, 8], weights := [1, 0, 0, 1] }

def points117 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 6381, representative 5796.
def source118 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B019.Data.entryAt ⟨46, by decide +kernel⟩

def target118 : Weights.Entry :=
  { word := [8, 12, 0, 12, 4, 4, 8], weights := [1, 0, 0, 1] }

def points118 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 6384, representative 5818.
def source119 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B019.Data.entryAt ⟨68, by decide +kernel⟩

def target119 : Weights.Entry :=
  { word := [8, 12, 0, 12, 8, 4, 8], weights := [1, 0, 0, 1] }

def points119 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 6398, representative 5877.
def source120 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B019.Data.entryAt ⟨127, by decide +kernel⟩

def target120 : Weights.Entry :=
  { word := [8, 12, 0, 12, 10, 8, 4], weights := [1, 0, 0, 1] }

def points120 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 6403, representative 5776.
def source121 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B019.Data.entryAt ⟨26, by decide +kernel⟩

def target121 : Weights.Entry :=
  { word := [8, 12, 0, 12, 12, 4, 8], weights := [1, 0, 0, 1] }

def points121 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 6435, representative 5865.
def source122 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B019.Data.entryAt ⟨115, by decide +kernel⟩

def target122 : Weights.Entry :=
  { word := [8, 12, 4, 4, 0, 8, 4], weights := [1, 0, 0, 1] }

def points122 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 6449, representative 5866.
def source123 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B019.Data.entryAt ⟨116, by decide +kernel⟩

def target123 : Weights.Entry :=
  { word := [8, 12, 4, 4, 8, 8, 4], weights := [1, 0, 0, 1] }

def points123 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 6463, representative 5872.
def source124 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B019.Data.entryAt ⟨122, by decide +kernel⟩

def target124 : Weights.Entry :=
  { word := [8, 12, 4, 12, 0, 8, 4], weights := [1, 0, 0, 1] }

def points124 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 6477, representative 5869.
def source125 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B019.Data.entryAt ⟨119, by decide +kernel⟩

def target125 : Weights.Entry :=
  { word := [8, 12, 4, 12, 8, 8, 4], weights := [1, 0, 0, 1] }

def points125 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 6500, representative 5794.
def source126 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B019.Data.entryAt ⟨44, by decide +kernel⟩

def target126 : Weights.Entry :=
  { word := [8, 12, 8, 4, 4, 4, 8], weights := [1, 0, 0, 1] }

def points126 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 6505, representative 5816.
def source127 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B019.Data.entryAt ⟨66, by decide +kernel⟩

def target127 : Weights.Entry :=
  { word := [8, 12, 8, 4, 8, 4, 8], weights := [0, 0, 1, 0] }

def points127 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

def period8Entries : List Weights.Entry := [target0, target1, target2, target3, target4, target5, target6, target7, target8, target9, target10, target11, target12, target13, target14, target15, target16, target17, target18, target19, target20, target21, target22, target23, target24, target25, target26, target27, target28, target29, target30, target31, target32, target33, target34, target35, target36, target37, target38, target39, target40, target41, target42, target43, target44, target45, target46, target47, target48, target49, target50, target51, target52, target53, target54, target55, target56, target57, target58, target59, target60, target61, target62, target63, target64, target65, target66, target67, target68, target69, target70, target71, target72, target73, target74, target75, target76, target77, target78, target79, target80, target81, target82, target83, target84, target85, target86, target87, target88, target89, target90, target91, target92, target93, target94, target95, target96, target97, target98, target99, target100, target101, target102, target103, target104, target105, target106, target107, target108, target109, target110, target111, target112, target113, target114, target115, target116, target117, target118, target119, target120, target121, target122, target123, target124, target125, target126, target127]

def period8Chunk : RowCoverage.Chunk where
  rows := [⟨4809, target0⟩, ⟨4811, target1⟩, ⟨4816, target2⟩, ⟨4821, target3⟩, ⟨4823, target4⟩, ⟨4833, target5⟩, ⟨4838, target6⟩, ⟨4840, target7⟩, ⟨4848, target8⟩, ⟨4850, target9⟩, ⟨4855, target10⟩, ⟨4860, target11⟩, ⟨4862, target12⟩, ⟨4864, target13⟩, ⟨4865, target14⟩, ⟨4870, target15⟩, ⟨4871, target16⟩, ⟨4872, target17⟩, ⟨4873, target18⟩, ⟨4874, target19⟩, ⟨4875, target20⟩, ⟨4877, target21⟩, ⟨4879, target22⟩, ⟨4880, target23⟩, ⟨4882, target24⟩, ⟨4883, target25⟩, ⟨4884, target26⟩, ⟨4886, target27⟩, ⟨4888, target28⟩, ⟨4890, target29⟩, ⟨4891, target30⟩, ⟨4893, target31⟩, ⟨4896, target32⟩, ⟨4901, target33⟩, ⟨4903, target34⟩, ⟨4904, target35⟩, ⟨4906, target36⟩, ⟨4909, target37⟩, ⟨4914, target38⟩, ⟨4917, target39⟩, ⟨4919, target40⟩, ⟨4921, target41⟩, ⟨4923, target42⟩, ⟨4926, target43⟩, ⟨4928, target44⟩, ⟨4933, target45⟩, ⟨4938, target46⟩, ⟨4940, target47⟩, ⟨4942, target48⟩, ⟨4944, target49⟩, ⟨4949, target50⟩, ⟨4954, target51⟩, ⟨4956, target52⟩, ⟨4959, target53⟩, ⟨4961, target54⟩, ⟨4966, target55⟩, ⟨4971, target56⟩, ⟨4973, target57⟩, ⟨4976, target58⟩, ⟨4978, target59⟩, ⟨4988, target60⟩, ⟨4993, target61⟩, ⟨4995, target62⟩, ⟨5015, target63⟩, ⟨5018, target64⟩, ⟨5037, target65⟩, ⟨5051, target66⟩, ⟨5054, target67⟩, ⟨5073, target68⟩, ⟨5170, target69⟩, ⟨5175, target70⟩, ⟨5196, target71⟩, ⟨5212, target72⟩, ⟨5217, target73⟩, ⟨5238, target74⟩, ⟨5319, target75⟩, ⟨5325, target76⟩, ⟨5337, target77⟩, ⟨5354, target78⟩, ⟨5361, target79⟩, ⟨5380, target80⟩, ⟨5399, target81⟩, ⟨5418, target82⟩, ⟨5424, target83⟩, ⟨5443, target84⟩, ⟨5457, target85⟩, ⟨5460, target86⟩, ⟨5479, target87⟩, ⟨5493, target88⟩, ⟨5496, target89⟩, ⟨5515, target90⟩, ⟨5526, target91⟩, ⟨5541, target92⟩, ⟨5555, target93⟩, ⟨5569, target94⟩, ⟨5644, target95⟩, ⟨5652, target96⟩, ⟨5659, target97⟩, ⟨5666, target98⟩, ⟨5673, target99⟩, ⟨5679, target100⟩, ⟨5692, target101⟩, ⟨5700, target102⟩, ⟨5726, target103⟩, ⟨5733, target104⟩, ⟨5737, target105⟩, ⟨5741, target106⟩, ⟨5745, target107⟩, ⟨5749, target108⟩, ⟨5755, target109⟩, ⟨5763, target110⟩, ⟨5770, target111⟩, ⟨5777, target112⟩, ⟨6340, target113⟩, ⟨6345, target114⟩, ⟨6348, target115⟩, ⟨6362, target116⟩, ⟨6367, target117⟩, ⟨6381, target118⟩, ⟨6384, target119⟩, ⟨6398, target120⟩, ⟨6403, target121⟩, ⟨6435, target122⟩, ⟨6449, target123⟩, ⟨6463, target124⟩, ⟨6477, target125⟩, ⟨6500, target126⟩, ⟨6505, target127⟩]
  indexMask := 163487953442199588579515290559887814851761857880970238418300121655257889451239358603325599455846564590676783591735018712529637241466908104569625045318924707717390986156423466922485868892113124368866872536355542570603099996919960541232135391665561445207720967589956262091548120737665225977353768252088338213795549270435229681463004789172360680614635201003428465816588942499855873698603703832951022288530740856257114501431335917565767290811250264250117481223743972424176555015193423451413346907989197815224007563184939663566513825624488053930109914618265270850363174710319850314375404175332810585946799859848619814685935242522415838926131543055976807048882960059629174358057832990769091013894137493191161675709614366221264033759555456567270738480804068437518537586821568404718665336040793159067243488883334491498084113675985287609086736862596845907498018357299973867827403490626734409074360139483185752913008581041702240229276999413538710745630292594935233239109277169723172956116238796527297062741112156832854571216382526181506746110417252707435158831932323081556403856328016441368704710078590908820590320053779443879437141112255833473250944685226872553894491262251248967394220505200422350579090836535960937487187912707097611103030065525641876749884920943150597426486223510243941435480520793224260770272428959531451309839973325459658298349095003412122733034165704308789132532396571486550287713131796659248939184378975626816081943950777916047587286310041261088018435758541154866772584589805267684465135663935530310344497059036009469348482040940578260207085080867534872648444678699688884646925489150295734962969042841593017826816553977640334203452238506225675566825466653427259386537211338458860735141048200366721350892291459788741502170612398945749440669958150099018799450133059577123029038326615205550642658532942746148830747850332114804455640697933304696816279148192457605176722305418209195674011930679817761324348112447340098968739418861089930902500857085952
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

end FranklSmallCyclic.TransportBatches.G045.B001.Data
