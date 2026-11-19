module

public import Conjectures.FranklSmallCyclicRowCoverage
public import Conjectures.FranklSmallCyclicCanonicalWords
public import Conjectures.FranklSmallCyclicOrbit9Block020Data

/-! 128 literal targets sharing one source proof block.
Original words and row indices are retained; weights may be transported.
-/
@[expose] public section

namespace FranklSmallCyclic.TransportBatches.G073.B002.Data

-- Period 9, original row 5329, representative 9420.
def source0 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B020.Data.entryAt ⟨109, by decide +kernel⟩

def target0 : Weights.Entry :=
  { word := [8, 8, 0, 2, 2, 2, 0], weights := [1, 0, 0, 1] }

def points0 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 5), (4, 6), (5, 4), (6, 3), (7, 1), (8, 2)]

-- Period 9, original row 5330, representative 9318.
def source1 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B020.Data.entryAt ⟨7, by decide +kernel⟩

def target1 : Weights.Entry :=
  { word := [8, 8, 0, 2, 2, 2, 8], weights := [1, 0, 0, 1] }

def points1 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2)]

-- Period 9, original row 5331, representative 9421.
def source2 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B020.Data.entryAt ⟨110, by decide +kernel⟩

def target2 : Weights.Entry :=
  { word := [8, 8, 0, 2, 2, 10, 0], weights := [1, 0, 0, 1] }

def points2 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 5), (4, 6), (5, 4), (6, 3), (7, 1), (8, 2)]

-- Period 9, original row 5333, representative 9423.
def source3 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B020.Data.entryAt ⟨112, by decide +kernel⟩

def target3 : Weights.Entry :=
  { word := [8, 8, 0, 2, 10, 2, 0], weights := [1, 0, 0, 1] }

def points3 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 5), (4, 6), (5, 4), (6, 3), (7, 1), (8, 2)]

-- Period 9, original row 5334, representative 9319.
def source4 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B020.Data.entryAt ⟨8, by decide +kernel⟩

def target4 : Weights.Entry :=
  { word := [8, 8, 0, 2, 10, 2, 8], weights := [1, 0, 0, 1] }

def points4 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2)]

-- Period 9, original row 5335, representative 9422.
def source5 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B020.Data.entryAt ⟨111, by decide +kernel⟩

def target5 : Weights.Entry :=
  { word := [8, 8, 0, 2, 10, 10, 0], weights := [1, 0, 0, 1] }

def points5 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 5), (4, 6), (5, 4), (6, 3), (7, 1), (8, 2)]

-- Period 9, original row 5344, representative 9363.
def source6 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B020.Data.entryAt ⟨52, by decide +kernel⟩

def target6 : Weights.Entry :=
  { word := [8, 8, 0, 4, 2, 0, 8], weights := [1, 0, 0, 1] }

def points6 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2)]

-- Period 9, original row 5350, representative 9352.
def source7 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B020.Data.entryAt ⟨41, by decide +kernel⟩

def target7 : Weights.Entry :=
  { word := [8, 8, 0, 4, 2, 8, 8], weights := [1, 0, 1, 0] }

-- Period 9, original row 5357, representative 9414.
def source8 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B020.Data.entryAt ⟨103, by decide +kernel⟩

def target8 : Weights.Entry :=
  { word := [8, 8, 0, 4, 6, 8, 0], weights := [1, 0, 1, 0] }

def points8 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 5), (4, 6), (5, 4), (6, 3), (7, 1), (8, 2)]

-- Period 9, original row 5370, representative 9364.
def source9 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B020.Data.entryAt ⟨53, by decide +kernel⟩

def target9 : Weights.Entry :=
  { word := [8, 8, 0, 4, 10, 0, 8], weights := [1, 0, 0, 1] }

def points9 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2)]

-- Period 9, original row 5376, representative 9353.
def source10 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B020.Data.entryAt ⟨42, by decide +kernel⟩

def target10 : Weights.Entry :=
  { word := [8, 8, 0, 4, 10, 8, 8], weights := [1, 0, 1, 0] }

-- Period 9, original row 5381, representative 9359.
def source11 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B020.Data.entryAt ⟨48, by decide +kernel⟩

def target11 : Weights.Entry :=
  { word := [8, 8, 0, 6, 2, 0, 8], weights := [0, 1, 0, 0] }

def points11 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2)]

-- Period 9, original row 5382, representative 9348.
def source12 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B020.Data.entryAt ⟨37, by decide +kernel⟩

def target12 : Weights.Entry :=
  { word := [8, 8, 0, 6, 2, 8, 8], weights := [1, 0, 1, 0] }

-- Period 9, original row 5383, representative 9362.
def source13 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B020.Data.entryAt ⟨51, by decide +kernel⟩

def target13 : Weights.Entry :=
  { word := [8, 8, 0, 6, 10, 0, 8], weights := [0, 1, 0, 0] }

def points13 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2)]

-- Period 9, original row 5384, representative 9349.
def source14 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B020.Data.entryAt ⟨38, by decide +kernel⟩

def target14 : Weights.Entry :=
  { word := [8, 8, 0, 6, 10, 8, 8], weights := [1, 0, 1, 0] }

-- Period 9, original row 5393, representative 9325.
def source15 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B020.Data.entryAt ⟨14, by decide +kernel⟩

def target15 : Weights.Entry :=
  { word := [8, 8, 0, 10, 2, 2, 8], weights := [0, 1, 0, 1] }

def points15 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2)]

-- Period 9, original row 5395, representative 9322.
def source16 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B020.Data.entryAt ⟨11, by decide +kernel⟩

def target16 : Weights.Entry :=
  { word := [8, 8, 0, 10, 10, 2, 8], weights := [0, 1, 0, 1] }

def points16 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2)]

-- Period 9, original row 5408, representative 9366.
def source17 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B020.Data.entryAt ⟨55, by decide +kernel⟩

def target17 : Weights.Entry :=
  { word := [8, 8, 0, 12, 2, 0, 8], weights := [1, 0, 0, 1] }

def points17 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2)]

-- Period 9, original row 5414, representative 9355.
def source18 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B020.Data.entryAt ⟨44, by decide +kernel⟩

def target18 : Weights.Entry :=
  { word := [8, 8, 0, 12, 2, 8, 8], weights := [1, 0, 1, 0] }

-- Period 9, original row 5420, representative 9415.
def source19 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B020.Data.entryAt ⟨104, by decide +kernel⟩

def target19 : Weights.Entry :=
  { word := [8, 8, 0, 12, 6, 8, 0], weights := [1, 0, 1, 0] }

def points19 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 5), (4, 6), (5, 4), (6, 3), (7, 1), (8, 2)]

-- Period 9, original row 5433, representative 9365.
def source20 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B020.Data.entryAt ⟨54, by decide +kernel⟩

def target20 : Weights.Entry :=
  { word := [8, 8, 0, 12, 10, 0, 8], weights := [1, 0, 0, 1] }

def points20 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2)]

-- Period 9, original row 5439, representative 9354.
def source21 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B020.Data.entryAt ⟨43, by decide +kernel⟩

def target21 : Weights.Entry :=
  { word := [8, 8, 0, 12, 10, 8, 8], weights := [1, 0, 1, 0] }

-- Period 9, original row 5519, representative 9314.
def source22 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B020.Data.entryAt ⟨3, by decide +kernel⟩

def target22 : Weights.Entry :=
  { word := [8, 8, 2, 2, 2, 0, 8], weights := [0, 1, 0, 0] }

def points22 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 5523, representative 9374.
def source23 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B020.Data.entryAt ⟨63, by decide +kernel⟩

def target23 : Weights.Entry :=
  { word := [8, 8, 2, 2, 2, 8, 0], weights := [0, 1, 0, 0] }

def points23 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 5534, representative 9315.
def source24 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B020.Data.entryAt ⟨4, by decide +kernel⟩

def target24 : Weights.Entry :=
  { word := [8, 8, 2, 2, 10, 0, 8], weights := [0, 1, 0, 0] }

def points24 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 5538, representative 9375.
def source25 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B020.Data.entryAt ⟨64, by decide +kernel⟩

def target25 : Weights.Entry :=
  { word := [8, 8, 2, 2, 10, 8, 0], weights := [0, 1, 0, 0] }

def points25 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 5549, representative 9317.
def source26 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B020.Data.entryAt ⟨6, by decide +kernel⟩

def target26 : Weights.Entry :=
  { word := [8, 8, 2, 10, 2, 0, 8], weights := [0, 1, 0, 0] }

def points26 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 5563, representative 9316.
def source27 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B020.Data.entryAt ⟨5, by decide +kernel⟩

def target27 : Weights.Entry :=
  { word := [8, 8, 2, 10, 10, 0, 8], weights := [0, 1, 0, 0] }

def points27 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 5575, representative 9326.
def source28 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B020.Data.entryAt ⟨15, by decide +kernel⟩

def target28 : Weights.Entry :=
  { word := [8, 8, 4, 2, 0, 1, 8], weights := [0, 1, 0, 1] }

def points28 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 5577, representative 9326.
def source29 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B020.Data.entryAt ⟨15, by decide +kernel⟩

def target29 : Weights.Entry :=
  { word := [8, 8, 4, 2, 0, 2, 8], weights := [0, 1, 0, 1] }

def points29 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 5578, representative 9405.
def source30 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B020.Data.entryAt ⟨94, by decide +kernel⟩

def target30 : Weights.Entry :=
  { word := [8, 8, 4, 2, 0, 8, 0], weights := [0, 1, 0, 0] }

def points30 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 5582, representative 9352.
def source31 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B020.Data.entryAt ⟨41, by decide +kernel⟩

def target31 : Weights.Entry :=
  { word := [8, 8, 4, 2, 0, 8, 8], weights := [0, 1, 0, 1] }

def points31 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 5586, representative 9402.
def source32 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B020.Data.entryAt ⟨91, by decide +kernel⟩

def target32 : Weights.Entry :=
  { word := [8, 8, 4, 2, 0, 9, 0], weights := [0, 1, 0, 0] }

def points32 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 5588, representative 9402.
def source33 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B020.Data.entryAt ⟨91, by decide +kernel⟩

def target33 : Weights.Entry :=
  { word := [8, 8, 4, 2, 0, 10, 0], weights := [0, 1, 0, 0] }

def points33 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 5590, representative 9404.
def source34 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B020.Data.entryAt ⟨93, by decide +kernel⟩

def target34 : Weights.Entry :=
  { word := [8, 8, 4, 2, 8, 2, 0], weights := [0, 1, 0, 0] }

def points34 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 5591, representative 9327.
def source35 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B020.Data.entryAt ⟨16, by decide +kernel⟩

def target35 : Weights.Entry :=
  { word := [8, 8, 4, 2, 8, 2, 8], weights := [0, 1, 0, 1] }

def points35 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 5594, representative 9403.
def source36 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B020.Data.entryAt ⟨92, by decide +kernel⟩

def target36 : Weights.Entry :=
  { word := [8, 8, 4, 2, 8, 10, 0], weights := [0, 1, 0, 0] }

def points36 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 5598, representative 9398.
def source37 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B020.Data.entryAt ⟨87, by decide +kernel⟩

def target37 : Weights.Entry :=
  { word := [8, 8, 4, 4, 4, 8, 0], weights := [0, 0, 1, 0] }

def points37 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 5602, representative 9399.
def source38 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B020.Data.entryAt ⟨88, by decide +kernel⟩

def target38 : Weights.Entry :=
  { word := [8, 8, 4, 4, 12, 8, 0], weights := [0, 0, 1, 0] }

def points38 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 5604, representative 9356.
def source39 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B020.Data.entryAt ⟨45, by decide +kernel⟩

def target39 : Weights.Entry :=
  { word := [8, 8, 4, 6, 0, 0, 8], weights := [0, 1, 0, 1] }

def points39 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 5605, representative 9348.
def source40 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B020.Data.entryAt ⟨37, by decide +kernel⟩

def target40 : Weights.Entry :=
  { word := [8, 8, 4, 6, 0, 8, 8], weights := [0, 1, 0, 1] }

def points40 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 5606, representative 9358.
def source41 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B020.Data.entryAt ⟨47, by decide +kernel⟩

def target41 : Weights.Entry :=
  { word := [8, 8, 4, 6, 8, 0, 8], weights := [0, 1, 0, 0] }

def points41 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 5607, representative 9351.
def source42 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B020.Data.entryAt ⟨40, by decide +kernel⟩

def target42 : Weights.Entry :=
  { word := [8, 8, 4, 6, 8, 8, 8], weights := [1, 0, 1, 0] }

-- Period 9, original row 5608, representative 9397.
def source43 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B020.Data.entryAt ⟨86, by decide +kernel⟩

def target43 : Weights.Entry :=
  { word := [8, 8, 4, 8, 4, 2, 0], weights := [0, 1, 1, 0] }

def points43 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 5610, representative 9395.
def source44 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B020.Data.entryAt ⟨84, by decide +kernel⟩

def target44 : Weights.Entry :=
  { word := [8, 8, 4, 8, 4, 10, 0], weights := [0, 1, 1, 0] }

def points44 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 5612, representative 9396.
def source45 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B020.Data.entryAt ⟨85, by decide +kernel⟩

def target45 : Weights.Entry :=
  { word := [8, 8, 4, 8, 12, 2, 0], weights := [0, 1, 1, 0] }

def points45 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 5614, representative 9394.
def source46 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B020.Data.entryAt ⟨83, by decide +kernel⟩

def target46 : Weights.Entry :=
  { word := [8, 8, 4, 8, 12, 10, 0], weights := [0, 1, 1, 0] }

def points46 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 5616, representative 9333.
def source47 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B020.Data.entryAt ⟨22, by decide +kernel⟩

def target47 : Weights.Entry :=
  { word := [8, 8, 4, 10, 0, 1, 8], weights := [0, 1, 0, 1] }

def points47 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 5617, representative 9333.
def source48 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B020.Data.entryAt ⟨22, by decide +kernel⟩

def target48 : Weights.Entry :=
  { word := [8, 8, 4, 10, 0, 2, 8], weights := [0, 1, 0, 1] }

def points48 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 5621, representative 9355.
def source49 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B020.Data.entryAt ⟨44, by decide +kernel⟩

def target49 : Weights.Entry :=
  { word := [8, 8, 4, 10, 0, 8, 8], weights := [0, 1, 0, 1] }

def points49 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 5627, representative 9330.
def source50 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B020.Data.entryAt ⟨19, by decide +kernel⟩

def target50 : Weights.Entry :=
  { word := [8, 8, 4, 10, 8, 2, 8], weights := [0, 1, 0, 1] }

def points50 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 5635, representative 9311.
def source51 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B020.Data.entryAt ⟨0, by decide +kernel⟩

def target51 : Weights.Entry :=
  { word := [8, 8, 4, 12, 4, 0, 8], weights := [1, 0, 0, 1] }

def points51 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 5636, representative 9401.
def source52 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B020.Data.entryAt ⟨90, by decide +kernel⟩

def target52 : Weights.Entry :=
  { word := [8, 8, 4, 12, 4, 8, 0], weights := [0, 0, 1, 0] }

def points52 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 5639, representative 9400.
def source53 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B020.Data.entryAt ⟨89, by decide +kernel⟩

def target53 : Weights.Entry :=
  { word := [8, 8, 4, 12, 12, 8, 0], weights := [0, 0, 1, 0] }

def points53 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 5641, representative 9370.
def source54 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B020.Data.entryAt ⟨59, by decide +kernel⟩

def target54 : Weights.Entry :=
  { word := [8, 8, 6, 2, 0, 8, 0], weights := [0, 1, 0, 0] }

def points54 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 5649, representative 9371.
def source55 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B020.Data.entryAt ⟨60, by decide +kernel⟩

def target55 : Weights.Entry :=
  { word := [8, 8, 6, 2, 8, 8, 0], weights := [0, 1, 0, 0] }

def points55 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 5671, representative 9416.
def source56 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B020.Data.entryAt ⟨105, by decide +kernel⟩

def target56 : Weights.Entry :=
  { word := [8, 8, 8, 1, 4, 2, 0], weights := [1, 0, 1, 0] }

def points56 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 5675, representative 9417.
def source57 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B020.Data.entryAt ⟨106, by decide +kernel⟩

def target57 : Weights.Entry :=
  { word := [8, 8, 8, 1, 4, 10, 0], weights := [1, 0, 1, 0] }

def points57 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 5677, representative 9419.
def source58 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B020.Data.entryAt ⟨108, by decide +kernel⟩

def target58 : Weights.Entry :=
  { word := [8, 8, 8, 1, 12, 2, 0], weights := [1, 0, 1, 0] }

def points58 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 5681, representative 9418.
def source59 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B020.Data.entryAt ⟨107, by decide +kernel⟩

def target59 : Weights.Entry :=
  { word := [8, 8, 8, 1, 12, 10, 0], weights := [1, 0, 1, 0] }

def points59 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 5683, representative 9410.
def source60 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B020.Data.entryAt ⟨99, by decide +kernel⟩

def target60 : Weights.Entry :=
  { word := [8, 8, 8, 2, 2, 2, 0], weights := [0, 1, 0, 1] }

def points60 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 5684, representative 9323.
def source61 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B020.Data.entryAt ⟨12, by decide +kernel⟩

def target61 : Weights.Entry :=
  { word := [8, 8, 8, 2, 2, 2, 8], weights := [0, 1, 0, 1] }

def points61 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 5685, representative 9411.
def source62 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B020.Data.entryAt ⟨100, by decide +kernel⟩

def target62 : Weights.Entry :=
  { word := [8, 8, 8, 2, 2, 10, 0], weights := [0, 1, 0, 1] }

def points62 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 5687, representative 9413.
def source63 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B020.Data.entryAt ⟨102, by decide +kernel⟩

def target63 : Weights.Entry :=
  { word := [8, 8, 8, 2, 10, 2, 0], weights := [0, 1, 0, 1] }

def points63 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 5688, representative 9320.
def source64 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B020.Data.entryAt ⟨9, by decide +kernel⟩

def target64 : Weights.Entry :=
  { word := [8, 8, 8, 2, 10, 2, 8], weights := [0, 1, 0, 1] }

def points64 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 5689, representative 9412.
def source65 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B020.Data.entryAt ⟨101, by decide +kernel⟩

def target65 : Weights.Entry :=
  { word := [8, 8, 8, 2, 10, 10, 0], weights := [0, 1, 0, 1] }

def points65 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 5697, representative 9408.
def source66 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B020.Data.entryAt ⟨97, by decide +kernel⟩

def target66 : Weights.Entry :=
  { word := [8, 8, 8, 4, 6, 8, 0], weights := [0, 0, 1, 0] }

def points66 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 5703, representative 9360.
def source67 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B020.Data.entryAt ⟨49, by decide +kernel⟩

def target67 : Weights.Entry :=
  { word := [8, 8, 8, 6, 2, 0, 8], weights := [0, 1, 0, 0] }

def points67 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 5704, representative 9351.
def source68 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B020.Data.entryAt ⟨40, by decide +kernel⟩

def target68 : Weights.Entry :=
  { word := [8, 8, 8, 6, 2, 8, 8], weights := [0, 1, 0, 1] }

def points68 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 5705, representative 9361.
def source69 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B020.Data.entryAt ⟨50, by decide +kernel⟩

def target69 : Weights.Entry :=
  { word := [8, 8, 8, 6, 10, 0, 8], weights := [0, 1, 0, 0] }

def points69 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 5706, representative 9350.
def source70 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B020.Data.entryAt ⟨39, by decide +kernel⟩

def target70 : Weights.Entry :=
  { word := [8, 8, 8, 6, 10, 8, 8], weights := [1, 0, 1, 0] }

-- Period 9, original row 5708, representative 9407.
def source71 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B020.Data.entryAt ⟨96, by decide +kernel⟩

def target71 : Weights.Entry :=
  { word := [8, 8, 8, 8, 6, 2, 0], weights := [0, 1, 1, 0] }

def points71 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 5710, representative 9406.
def source72 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B020.Data.entryAt ⟨95, by decide +kernel⟩

def target72 : Weights.Entry :=
  { word := [8, 8, 8, 8, 6, 10, 0], weights := [0, 1, 1, 0] }

def points72 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 5721, representative 9324.
def source73 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B020.Data.entryAt ⟨13, by decide +kernel⟩

def target73 : Weights.Entry :=
  { word := [8, 8, 8, 10, 2, 2, 8], weights := [0, 1, 0, 1] }

def points73 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 5723, representative 9321.
def source74 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B020.Data.entryAt ⟨10, by decide +kernel⟩

def target74 : Weights.Entry :=
  { word := [8, 8, 8, 10, 10, 2, 8], weights := [0, 1, 0, 1] }

def points74 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 5730, representative 9409.
def source75 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B020.Data.entryAt ⟨98, by decide +kernel⟩

def target75 : Weights.Entry :=
  { word := [8, 8, 8, 12, 6, 8, 0], weights := [0, 0, 1, 0] }

def points75 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 5752, representative 9372.
def source76 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B020.Data.entryAt ⟨61, by decide +kernel⟩

def target76 : Weights.Entry :=
  { word := [8, 8, 10, 2, 2, 8, 0], weights := [0, 1, 0, 0] }

def points76 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 5760, representative 9373.
def source77 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B020.Data.entryAt ⟨62, by decide +kernel⟩

def target77 : Weights.Entry :=
  { word := [8, 8, 10, 2, 10, 8, 0], weights := [0, 1, 0, 0] }

def points77 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 5783, representative 9331.
def source78 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B020.Data.entryAt ⟨20, by decide +kernel⟩

def target78 : Weights.Entry :=
  { word := [8, 8, 12, 2, 0, 1, 8], weights := [0, 1, 0, 1] }

def points78 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 5785, representative 9331.
def source79 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B020.Data.entryAt ⟨20, by decide +kernel⟩

def target79 : Weights.Entry :=
  { word := [8, 8, 12, 2, 0, 2, 8], weights := [0, 1, 0, 1] }

def points79 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 5786, representative 9393.
def source80 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B020.Data.entryAt ⟨82, by decide +kernel⟩

def target80 : Weights.Entry :=
  { word := [8, 8, 12, 2, 0, 8, 0], weights := [0, 1, 0, 0] }

def points80 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 5790, representative 9353.
def source81 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B020.Data.entryAt ⟨42, by decide +kernel⟩

def target81 : Weights.Entry :=
  { word := [8, 8, 12, 2, 0, 8, 8], weights := [0, 1, 0, 1] }

def points81 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 5794, representative 9390.
def source82 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B020.Data.entryAt ⟨79, by decide +kernel⟩

def target82 : Weights.Entry :=
  { word := [8, 8, 12, 2, 0, 9, 0], weights := [0, 1, 0, 0] }

def points82 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 5796, representative 9390.
def source83 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B020.Data.entryAt ⟨79, by decide +kernel⟩

def target83 : Weights.Entry :=
  { word := [8, 8, 12, 2, 0, 10, 0], weights := [0, 1, 0, 0] }

def points83 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 5798, representative 9392.
def source84 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B020.Data.entryAt ⟨81, by decide +kernel⟩

def target84 : Weights.Entry :=
  { word := [8, 8, 12, 2, 8, 2, 0], weights := [0, 1, 0, 0] }

def points84 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 5799, representative 9328.
def source85 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B020.Data.entryAt ⟨17, by decide +kernel⟩

def target85 : Weights.Entry :=
  { word := [8, 8, 12, 2, 8, 2, 8], weights := [0, 1, 0, 1] }

def points85 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 5802, representative 9391.
def source86 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B020.Data.entryAt ⟨80, by decide +kernel⟩

def target86 : Weights.Entry :=
  { word := [8, 8, 12, 2, 8, 10, 0], weights := [0, 1, 0, 0] }

def points86 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 5806, representative 9386.
def source87 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B020.Data.entryAt ⟨75, by decide +kernel⟩

def target87 : Weights.Entry :=
  { word := [8, 8, 12, 4, 4, 8, 0], weights := [0, 0, 1, 0] }

def points87 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 5810, representative 9387.
def source88 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B020.Data.entryAt ⟨76, by decide +kernel⟩

def target88 : Weights.Entry :=
  { word := [8, 8, 12, 4, 12, 8, 0], weights := [0, 0, 1, 0] }

def points88 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 5812, representative 9349.
def source89 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B020.Data.entryAt ⟨38, by decide +kernel⟩

def target89 : Weights.Entry :=
  { word := [8, 8, 12, 6, 0, 8, 8], weights := [0, 1, 0, 1] }

def points89 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 5813, representative 9357.
def source90 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B020.Data.entryAt ⟨46, by decide +kernel⟩

def target90 : Weights.Entry :=
  { word := [8, 8, 12, 6, 8, 0, 8], weights := [0, 1, 0, 0] }

def points90 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 5814, representative 9350.
def source91 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B020.Data.entryAt ⟨39, by decide +kernel⟩

def target91 : Weights.Entry :=
  { word := [8, 8, 12, 6, 8, 8, 8], weights := [0, 1, 0, 1] }

def points91 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 5815, representative 9385.
def source92 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B020.Data.entryAt ⟨74, by decide +kernel⟩

def target92 : Weights.Entry :=
  { word := [8, 8, 12, 8, 4, 2, 0], weights := [0, 1, 1, 0] }

def points92 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 5817, representative 9383.
def source93 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B020.Data.entryAt ⟨72, by decide +kernel⟩

def target93 : Weights.Entry :=
  { word := [8, 8, 12, 8, 4, 10, 0], weights := [0, 1, 1, 0] }

def points93 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 5819, representative 9384.
def source94 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B020.Data.entryAt ⟨73, by decide +kernel⟩

def target94 : Weights.Entry :=
  { word := [8, 8, 12, 8, 12, 2, 0], weights := [0, 1, 1, 0] }

def points94 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 5821, representative 9382.
def source95 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B020.Data.entryAt ⟨71, by decide +kernel⟩

def target95 : Weights.Entry :=
  { word := [8, 8, 12, 8, 12, 10, 0], weights := [0, 1, 1, 0] }

def points95 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 5823, representative 9332.
def source96 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B020.Data.entryAt ⟨21, by decide +kernel⟩

def target96 : Weights.Entry :=
  { word := [8, 8, 12, 10, 0, 1, 8], weights := [0, 1, 0, 1] }

def points96 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 5824, representative 9332.
def source97 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B020.Data.entryAt ⟨21, by decide +kernel⟩

def target97 : Weights.Entry :=
  { word := [8, 8, 12, 10, 0, 2, 8], weights := [0, 1, 0, 1] }

def points97 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 5828, representative 9354.
def source98 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B020.Data.entryAt ⟨43, by decide +kernel⟩

def target98 : Weights.Entry :=
  { word := [8, 8, 12, 10, 0, 8, 8], weights := [0, 1, 0, 1] }

def points98 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 5834, representative 9329.
def source99 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B020.Data.entryAt ⟨18, by decide +kernel⟩

def target99 : Weights.Entry :=
  { word := [8, 8, 12, 10, 8, 2, 8], weights := [0, 1, 0, 1] }

def points99 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 5843, representative 9389.
def source100 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B020.Data.entryAt ⟨78, by decide +kernel⟩

def target100 : Weights.Entry :=
  { word := [8, 8, 12, 12, 4, 8, 0], weights := [0, 0, 1, 0] }

def points100 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 5846, representative 9388.
def source101 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B020.Data.entryAt ⟨77, by decide +kernel⟩

def target101 : Weights.Entry :=
  { word := [8, 8, 12, 12, 12, 8, 0], weights := [0, 0, 1, 0] }

def points101 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 6628, representative 9340.
def source102 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B020.Data.entryAt ⟨29, by decide +kernel⟩

def target102 : Weights.Entry :=
  { word := [9, 0, 1, 4, 2, 0, 8], weights := [1, 0, 1, 0] }

def points102 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 6634, representative 9326.
def source103 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B020.Data.entryAt ⟨15, by decide +kernel⟩

def target103 : Weights.Entry :=
  { word := [9, 0, 1, 4, 2, 8, 8], weights := [1, 0, 1, 0] }

def points103 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 6650, representative 9345.
def source104 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B020.Data.entryAt ⟨34, by decide +kernel⟩

def target104 : Weights.Entry :=
  { word := [9, 0, 1, 4, 10, 0, 8], weights := [1, 0, 1, 0] }

def points104 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 6656, representative 9331.
def source105 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B020.Data.entryAt ⟨20, by decide +kernel⟩

def target105 : Weights.Entry :=
  { word := [9, 0, 1, 4, 10, 8, 8], weights := [1, 0, 1, 0] }

def points105 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 6664, representative 9347.
def source106 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B020.Data.entryAt ⟨36, by decide +kernel⟩

def target106 : Weights.Entry :=
  { word := [9, 0, 1, 12, 2, 0, 8], weights := [1, 0, 1, 0] }

def points106 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 6670, representative 9333.
def source107 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B020.Data.entryAt ⟨22, by decide +kernel⟩

def target107 : Weights.Entry :=
  { word := [9, 0, 1, 12, 2, 8, 8], weights := [1, 0, 1, 0] }

def points107 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 6686, representative 9346.
def source108 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B020.Data.entryAt ⟨35, by decide +kernel⟩

def target108 : Weights.Entry :=
  { word := [9, 0, 1, 12, 10, 0, 8], weights := [1, 0, 1, 0] }

def points108 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 6692, representative 9332.
def source109 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B020.Data.entryAt ⟨21, by decide +kernel⟩

def target109 : Weights.Entry :=
  { word := [9, 0, 1, 12, 10, 8, 8], weights := [1, 0, 1, 0] }

def points109 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 6700, representative 9340.
def source110 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B020.Data.entryAt ⟨29, by decide +kernel⟩

def target110 : Weights.Entry :=
  { word := [9, 0, 2, 2, 2, 0, 8], weights := [1, 1, 0, 0] }

def points110 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 5), (5, 4), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 6704, representative 9380.
def source111 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B020.Data.entryAt ⟨69, by decide +kernel⟩

def target111 : Weights.Entry :=
  { word := [9, 0, 2, 2, 2, 8, 0], weights := [1, 0, 0, 1] }

def points111 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 6715, representative 9345.
def source112 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B020.Data.entryAt ⟨34, by decide +kernel⟩

def target112 : Weights.Entry :=
  { word := [9, 0, 2, 2, 10, 0, 8], weights := [1, 1, 0, 0] }

def points112 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 5), (5, 4), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 6719, representative 9381.
def source113 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B020.Data.entryAt ⟨70, by decide +kernel⟩

def target113 : Weights.Entry :=
  { word := [9, 0, 2, 2, 10, 8, 0], weights := [1, 0, 0, 1] }

def points113 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 6730, representative 9347.
def source114 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B020.Data.entryAt ⟨36, by decide +kernel⟩

def target114 : Weights.Entry :=
  { word := [9, 0, 2, 10, 2, 0, 8], weights := [1, 1, 0, 0] }

def points114 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 5), (5, 4), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 6737, representative 9311.
def source115 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B020.Data.entryAt ⟨0, by decide +kernel⟩

def target115 : Weights.Entry :=
  { word := [9, 0, 2, 10, 2, 8, 8], weights := [1, 0, 0, 1] }

def points115 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 6744, representative 9346.
def source116 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B020.Data.entryAt ⟨35, by decide +kernel⟩

def target116 : Weights.Entry :=
  { word := [9, 0, 2, 10, 10, 0, 8], weights := [1, 1, 0, 0] }

def points116 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 5), (5, 4), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 6756, representative 9340.
def source117 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B020.Data.entryAt ⟨29, by decide +kernel⟩

def target117 : Weights.Entry :=
  { word := [9, 0, 4, 2, 0, 1, 8], weights := [0, 1, 0, 1] }

def points117 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 6758, representative 9340.
def source118 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B020.Data.entryAt ⟨29, by decide +kernel⟩

def target118 : Weights.Entry :=
  { word := [9, 0, 4, 2, 0, 2, 8], weights := [0, 1, 0, 1] }

def points118 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 6763, representative 9363.
def source119 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B020.Data.entryAt ⟨52, by decide +kernel⟩

def target119 : Weights.Entry :=
  { word := [9, 0, 4, 2, 0, 8, 8], weights := [1, 0, 0, 1] }

def points119 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 6767, representative 9433.
def source120 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B020.Data.entryAt ⟨122, by decide +kernel⟩

def target120 : Weights.Entry :=
  { word := [9, 0, 4, 2, 0, 9, 0], weights := [0, 1, 0, 0] }

def points120 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 6769, representative 9433.
def source121 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B020.Data.entryAt ⟨122, by decide +kernel⟩

def target121 : Weights.Entry :=
  { word := [9, 0, 4, 2, 0, 10, 0], weights := [0, 1, 0, 0] }

def points121 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 6771, representative 9438.
def source122 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B020.Data.entryAt ⟨127, by decide +kernel⟩

def target122 : Weights.Entry :=
  { word := [9, 0, 4, 2, 8, 2, 0], weights := [0, 1, 0, 0] }

def points122 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 6772, representative 9341.
def source123 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B020.Data.entryAt ⟨30, by decide +kernel⟩

def target123 : Weights.Entry :=
  { word := [9, 0, 4, 2, 8, 2, 8], weights := [1, 0, 0, 1] }

def points123 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 6775, representative 9434.
def source124 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B020.Data.entryAt ⟨123, by decide +kernel⟩

def target124 : Weights.Entry :=
  { word := [9, 0, 4, 2, 8, 10, 0], weights := [0, 1, 0, 0] }

def points124 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 6778, representative 9340.
def source125 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B020.Data.entryAt ⟨29, by decide +kernel⟩

def target125 : Weights.Entry :=
  { word := [9, 0, 4, 4, 4, 0, 8], weights := [0, 0, 1, 1] }

def points125 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 4), (5, 5), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 6779, representative 9436.
def source126 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B020.Data.entryAt ⟨125, by decide +kernel⟩

def target126 : Weights.Entry :=
  { word := [9, 0, 4, 4, 4, 8, 0], weights := [0, 0, 1, 0] }

def points126 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 6780, representative 9314.
def source127 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B020.Data.entryAt ⟨3, by decide +kernel⟩

def target127 : Weights.Entry :=
  { word := [9, 0, 4, 4, 4, 8, 8], weights := [0, 0, 1, 0] }

def points127 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

def period9Entries : List Weights.Entry := [target0, target1, target2, target3, target4, target5, target6, target7, target8, target9, target10, target11, target12, target13, target14, target15, target16, target17, target18, target19, target20, target21, target22, target23, target24, target25, target26, target27, target28, target29, target30, target31, target32, target33, target34, target35, target36, target37, target38, target39, target40, target41, target42, target43, target44, target45, target46, target47, target48, target49, target50, target51, target52, target53, target54, target55, target56, target57, target58, target59, target60, target61, target62, target63, target64, target65, target66, target67, target68, target69, target70, target71, target72, target73, target74, target75, target76, target77, target78, target79, target80, target81, target82, target83, target84, target85, target86, target87, target88, target89, target90, target91, target92, target93, target94, target95, target96, target97, target98, target99, target100, target101, target102, target103, target104, target105, target106, target107, target108, target109, target110, target111, target112, target113, target114, target115, target116, target117, target118, target119, target120, target121, target122, target123, target124, target125, target126, target127]

def period9Chunk : RowCoverage.Chunk where
  rows := [⟨5329, target0⟩, ⟨5330, target1⟩, ⟨5331, target2⟩, ⟨5333, target3⟩, ⟨5334, target4⟩, ⟨5335, target5⟩, ⟨5344, target6⟩, ⟨5350, target7⟩, ⟨5357, target8⟩, ⟨5370, target9⟩, ⟨5376, target10⟩, ⟨5381, target11⟩, ⟨5382, target12⟩, ⟨5383, target13⟩, ⟨5384, target14⟩, ⟨5393, target15⟩, ⟨5395, target16⟩, ⟨5408, target17⟩, ⟨5414, target18⟩, ⟨5420, target19⟩, ⟨5433, target20⟩, ⟨5439, target21⟩, ⟨5519, target22⟩, ⟨5523, target23⟩, ⟨5534, target24⟩, ⟨5538, target25⟩, ⟨5549, target26⟩, ⟨5563, target27⟩, ⟨5575, target28⟩, ⟨5577, target29⟩, ⟨5578, target30⟩, ⟨5582, target31⟩, ⟨5586, target32⟩, ⟨5588, target33⟩, ⟨5590, target34⟩, ⟨5591, target35⟩, ⟨5594, target36⟩, ⟨5598, target37⟩, ⟨5602, target38⟩, ⟨5604, target39⟩, ⟨5605, target40⟩, ⟨5606, target41⟩, ⟨5607, target42⟩, ⟨5608, target43⟩, ⟨5610, target44⟩, ⟨5612, target45⟩, ⟨5614, target46⟩, ⟨5616, target47⟩, ⟨5617, target48⟩, ⟨5621, target49⟩, ⟨5627, target50⟩, ⟨5635, target51⟩, ⟨5636, target52⟩, ⟨5639, target53⟩, ⟨5641, target54⟩, ⟨5649, target55⟩, ⟨5671, target56⟩, ⟨5675, target57⟩, ⟨5677, target58⟩, ⟨5681, target59⟩, ⟨5683, target60⟩, ⟨5684, target61⟩, ⟨5685, target62⟩, ⟨5687, target63⟩, ⟨5688, target64⟩, ⟨5689, target65⟩, ⟨5697, target66⟩, ⟨5703, target67⟩, ⟨5704, target68⟩, ⟨5705, target69⟩, ⟨5706, target70⟩, ⟨5708, target71⟩, ⟨5710, target72⟩, ⟨5721, target73⟩, ⟨5723, target74⟩, ⟨5730, target75⟩, ⟨5752, target76⟩, ⟨5760, target77⟩, ⟨5783, target78⟩, ⟨5785, target79⟩, ⟨5786, target80⟩, ⟨5790, target81⟩, ⟨5794, target82⟩, ⟨5796, target83⟩, ⟨5798, target84⟩, ⟨5799, target85⟩, ⟨5802, target86⟩, ⟨5806, target87⟩, ⟨5810, target88⟩, ⟨5812, target89⟩, ⟨5813, target90⟩, ⟨5814, target91⟩, ⟨5815, target92⟩, ⟨5817, target93⟩, ⟨5819, target94⟩, ⟨5821, target95⟩, ⟨5823, target96⟩, ⟨5824, target97⟩, ⟨5828, target98⟩, ⟨5834, target99⟩, ⟨5843, target100⟩, ⟨5846, target101⟩, ⟨6628, target102⟩, ⟨6634, target103⟩, ⟨6650, target104⟩, ⟨6656, target105⟩, ⟨6664, target106⟩, ⟨6670, target107⟩, ⟨6686, target108⟩, ⟨6692, target109⟩, ⟨6700, target110⟩, ⟨6704, target111⟩, ⟨6715, target112⟩, ⟨6719, target113⟩, ⟨6730, target114⟩, ⟨6737, target115⟩, ⟨6744, target116⟩, ⟨6756, target117⟩, ⟨6758, target118⟩, ⟨6763, target119⟩, ⟨6767, target120⟩, ⟨6769, target121⟩, ⟨6771, target122⟩, ⟨6772, target123⟩, ⟨6775, target124⟩, ⟨6778, target125⟩, ⟨6779, target126⟩, ⟨6780, target127⟩]
  indexMask := 17205684698322566865004170731127176138144124298383355353274431123984158506681968343362863776898398160323365003664444725312501814852481962897897885921659380544183082132791860502068851006935011209284205218985317863971700815765132839799725039699034889363731230820484690509437101251068021260081612232723724800380339014155466132996877240277614033282452799412049744538387375547996013520596444873641562961037632391373161702965079390218944455360950075185394802483513028831938825822748866105928437025668153985343818897340617324375642507308620072145948105877528588254238711165723431385377637451732579696287337352003774502359617445426390319663687211861662671702027007531485621482455928191070899818416682969061780466191546791220362416436040734695049430669823013483130131419770960366081877645660374164506247710579552061424035555212496644867517863928806395470182210694639356895216888080790869120762095489020238330373836408886923138232217916951611532005973840310070309851102197292211989752547317823760454182273532817573054922530422610383670192782301643847702379514682854756878446359693050249658194871207038565241191285516331339375365595917716404125320301319967686837108752916147608762945525113774291453913539715614037994035512378613562154093311281862543317671605062386860184066194082564413108443301842863461321344439622763973574388084830206384179284650902048009311020592562562673924225788216631617518710618114239304113850292396506529348682812842456620975684032989231238661254685927107207960126039115940430803778114679021765066512230097502402257681006431988428856975434157865548169597794187475646530966507171871810427254778704610257350480020370286371332357713497926838032446994701310086660455905630147556784598158281512051248650662138527488355252294399603756988557912797670321664633474517036333603070283604314266185274434205183874181515749136142535970253196771258662349966495701509120253427581164424668604626021922374391364529045741089049486289699540074772562261749114792891484454244881606868654122972262507064357394369074216341427084923961720031716126490624
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

end FranklSmallCyclic.TransportBatches.G073.B002.Data
