module

public import Conjectures.FranklSmallCyclicRowCoverage
public import Conjectures.FranklSmallCyclicCanonicalWords
public import Conjectures.FranklSmallCyclicOrbit9Block008Data

/-! 128 literal targets sharing one source proof block.
Original words and row indices are retained; weights may be transported.
-/
@[expose] public section

namespace FranklSmallCyclic.TransportBatches.G061.B000.Data

-- Period 9, original row 4128, representative 7836.
def source0 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B008.Data.entryAt ⟨61, by decide +kernel⟩

def target0 : Weights.Entry :=
  { word := [8, 0, 1, 4, 2, 0, 10], weights := [1, 0, 1, 0] }

-- Period 9, original row 4129, representative 7844.
def source1 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B008.Data.entryAt ⟨69, by decide +kernel⟩

def target1 : Weights.Entry :=
  { word := [8, 0, 1, 4, 2, 0, 12], weights := [1, 0, 0, 1] }

-- Period 9, original row 4150, representative 7837.
def source2 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B008.Data.entryAt ⟨62, by decide +kernel⟩

def target2 : Weights.Entry :=
  { word := [8, 0, 1, 4, 10, 0, 10], weights := [1, 0, 1, 0] }

-- Period 9, original row 4151, representative 7845.
def source3 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B008.Data.entryAt ⟨70, by decide +kernel⟩

def target3 : Weights.Entry :=
  { word := [8, 0, 1, 4, 10, 0, 12], weights := [1, 0, 0, 1] }

-- Period 9, original row 4164, representative 7843.
def source4 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B008.Data.entryAt ⟨68, by decide +kernel⟩

def target4 : Weights.Entry :=
  { word := [8, 0, 1, 12, 2, 0, 10], weights := [1, 0, 1, 0] }

-- Period 9, original row 4165, representative 7851.
def source5 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B008.Data.entryAt ⟨76, by decide +kernel⟩

def target5 : Weights.Entry :=
  { word := [8, 0, 1, 12, 2, 0, 12], weights := [1, 0, 1, 0] }

-- Period 9, original row 4186, representative 7840.
def source6 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B008.Data.entryAt ⟨65, by decide +kernel⟩

def target6 : Weights.Entry :=
  { word := [8, 0, 1, 12, 10, 0, 10], weights := [1, 0, 1, 0] }

-- Period 9, original row 4187, representative 7848.
def source7 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B008.Data.entryAt ⟨73, by decide +kernel⟩

def target7 : Weights.Entry :=
  { word := [8, 0, 1, 12, 10, 0, 12], weights := [1, 0, 1, 0] }

-- Period 9, original row 4200, representative 7836.
def source8 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B008.Data.entryAt ⟨61, by decide +kernel⟩

def target8 : Weights.Entry :=
  { word := [8, 0, 2, 2, 2, 0, 10], weights := [1, 1, 0, 0] }

def points8 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 5), (5, 4), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 4201, representative 7844.
def source9 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B008.Data.entryAt ⟨69, by decide +kernel⟩

def target9 : Weights.Entry :=
  { word := [8, 0, 2, 2, 2, 0, 12], weights := [1, 0, 0, 1] }

def points9 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 5), (5, 4), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 4207, representative 7892.
def source10 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B008.Data.entryAt ⟨117, by decide +kernel⟩

def target10 : Weights.Entry :=
  { word := [8, 0, 2, 2, 2, 8, 9], weights := [1, 0, 0, 1] }

-- Period 9, original row 4215, representative 7837.
def source11 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B008.Data.entryAt ⟨62, by decide +kernel⟩

def target11 : Weights.Entry :=
  { word := [8, 0, 2, 2, 10, 0, 10], weights := [1, 1, 0, 0] }

def points11 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 5), (5, 4), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 4216, representative 7845.
def source12 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B008.Data.entryAt ⟨70, by decide +kernel⟩

def target12 : Weights.Entry :=
  { word := [8, 0, 2, 2, 10, 0, 12], weights := [1, 0, 0, 1] }

def points12 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 5), (5, 4), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 4222, representative 7893.
def source13 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B008.Data.entryAt ⟨118, by decide +kernel⟩

def target13 : Weights.Entry :=
  { word := [8, 0, 2, 2, 10, 8, 9], weights := [1, 0, 0, 1] }

-- Period 9, original row 4230, representative 7843.
def source14 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B008.Data.entryAt ⟨68, by decide +kernel⟩

def target14 : Weights.Entry :=
  { word := [8, 0, 2, 10, 2, 0, 10], weights := [1, 1, 0, 0] }

def points14 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 5), (5, 4), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 4231, representative 7851.
def source15 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B008.Data.entryAt ⟨76, by decide +kernel⟩

def target15 : Weights.Entry :=
  { word := [8, 0, 2, 10, 2, 0, 12], weights := [1, 1, 0, 0] }

def points15 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 5), (5, 4), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 4236, representative 7899.
def source16 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B008.Data.entryAt ⟨124, by decide +kernel⟩

def target16 : Weights.Entry :=
  { word := [8, 0, 2, 10, 2, 8, 9], weights := [1, 0, 0, 1] }

-- Period 9, original row 4244, representative 7840.
def source17 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B008.Data.entryAt ⟨65, by decide +kernel⟩

def target17 : Weights.Entry :=
  { word := [8, 0, 2, 10, 10, 0, 10], weights := [1, 1, 0, 0] }

def points17 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 5), (5, 4), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 4245, representative 7848.
def source18 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B008.Data.entryAt ⟨73, by decide +kernel⟩

def target18 : Weights.Entry :=
  { word := [8, 0, 2, 10, 10, 0, 12], weights := [1, 1, 0, 0] }

def points18 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 5), (5, 4), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 4250, representative 7896.
def source19 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B008.Data.entryAt ⟨121, by decide +kernel⟩

def target19 : Weights.Entry :=
  { word := [8, 0, 2, 10, 10, 8, 9], weights := [1, 0, 0, 1] }

-- Period 9, original row 4263, representative 7790.
def source20 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B008.Data.entryAt ⟨15, by decide +kernel⟩

def target20 : Weights.Entry :=
  { word := [8, 0, 4, 2, 0, 8, 10], weights := [1, 0, 0, 1] }

-- Period 9, original row 4264, representative 7790.
def source21 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B008.Data.entryAt ⟨15, by decide +kernel⟩

def target21 : Weights.Entry :=
  { word := [8, 0, 4, 2, 0, 8, 12], weights := [1, 0, 0, 1] }

def points21 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 8), (8, 7)]

-- Period 9, original row 4272, representative 7791.
def source22 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B008.Data.entryAt ⟨16, by decide +kernel⟩

def target22 : Weights.Entry :=
  { word := [8, 0, 4, 2, 8, 8, 12], weights := [1, 0, 0, 1] }

-- Period 9, original row 4295, representative 7797.
def source23 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B008.Data.entryAt ⟨22, by decide +kernel⟩

def target23 : Weights.Entry :=
  { word := [8, 0, 4, 10, 0, 8, 10], weights := [1, 0, 0, 1] }

-- Period 9, original row 4296, representative 7797.
def source24 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B008.Data.entryAt ⟨22, by decide +kernel⟩

def target24 : Weights.Entry :=
  { word := [8, 0, 4, 10, 0, 8, 12], weights := [1, 0, 0, 1] }

def points24 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 8), (8, 7)]

-- Period 9, original row 4308, representative 7794.
def source25 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B008.Data.entryAt ⟨19, by decide +kernel⟩

def target25 : Weights.Entry :=
  { word := [8, 0, 4, 10, 8, 8, 12], weights := [1, 0, 0, 1] }

-- Period 9, original row 4320, representative 7900.
def source26 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B008.Data.entryAt ⟨125, by decide +kernel⟩

def target26 : Weights.Entry :=
  { word := [8, 0, 6, 2, 0, 8, 9], weights := [1, 0, 0, 1] }

-- Period 9, original row 4328, representative 7901.
def source27 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B008.Data.entryAt ⟨126, by decide +kernel⟩

def target27 : Weights.Entry :=
  { word := [8, 0, 6, 2, 8, 8, 9], weights := [1, 0, 0, 1] }

-- Period 9, original row 4342, representative 7902.
def source28 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B008.Data.entryAt ⟨127, by decide +kernel⟩

def target28 : Weights.Entry :=
  { word := [8, 0, 6, 10, 8, 8, 9], weights := [0, 1, 1, 0] }

-- Period 9, original row 4401, representative 7897.
def source29 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B008.Data.entryAt ⟨122, by decide +kernel⟩

def target29 : Weights.Entry :=
  { word := [8, 0, 10, 2, 2, 8, 9], weights := [1, 0, 0, 1] }

-- Period 9, original row 4409, representative 7894.
def source30 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B008.Data.entryAt ⟨119, by decide +kernel⟩

def target30 : Weights.Entry :=
  { word := [8, 0, 10, 2, 10, 8, 9], weights := [1, 0, 0, 1] }

-- Period 9, original row 4416, representative 7898.
def source31 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B008.Data.entryAt ⟨123, by decide +kernel⟩

def target31 : Weights.Entry :=
  { word := [8, 0, 10, 10, 2, 8, 9], weights := [0, 1, 1, 0] }

-- Period 9, original row 4423, representative 7895.
def source32 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B008.Data.entryAt ⟨120, by decide +kernel⟩

def target32 : Weights.Entry :=
  { word := [8, 0, 10, 10, 10, 8, 9], weights := [0, 1, 1, 0] }

-- Period 9, original row 4436, representative 7795.
def source33 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B008.Data.entryAt ⟨20, by decide +kernel⟩

def target33 : Weights.Entry :=
  { word := [8, 0, 12, 2, 0, 8, 10], weights := [1, 0, 0, 1] }

-- Period 9, original row 4437, representative 7795.
def source34 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B008.Data.entryAt ⟨20, by decide +kernel⟩

def target34 : Weights.Entry :=
  { word := [8, 0, 12, 2, 0, 8, 12], weights := [1, 0, 0, 1] }

def points34 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 8), (8, 7)]

-- Period 9, original row 4445, representative 7792.
def source35 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B008.Data.entryAt ⟨17, by decide +kernel⟩

def target35 : Weights.Entry :=
  { word := [8, 0, 12, 2, 8, 8, 12], weights := [1, 0, 0, 1] }

-- Period 9, original row 4471, representative 7796.
def source36 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B008.Data.entryAt ⟨21, by decide +kernel⟩

def target36 : Weights.Entry :=
  { word := [8, 0, 12, 10, 0, 8, 10], weights := [1, 0, 0, 1] }

-- Period 9, original row 4472, representative 7796.
def source37 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B008.Data.entryAt ⟨21, by decide +kernel⟩

def target37 : Weights.Entry :=
  { word := [8, 0, 12, 10, 0, 8, 12], weights := [1, 0, 0, 1] }

def points37 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 8), (8, 7)]

-- Period 9, original row 4484, representative 7793.
def source38 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B008.Data.entryAt ⟨18, by decide +kernel⟩

def target38 : Weights.Entry :=
  { word := [8, 0, 12, 10, 8, 8, 12], weights := [1, 0, 0, 1] }

-- Period 9, original row 5007, representative 7836.
def source39 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B008.Data.entryAt ⟨61, by decide +kernel⟩

def target39 : Weights.Entry :=
  { word := [8, 4, 0, 4, 2, 0, 10], weights := [1, 0, 1, 0] }

def points39 : List (ℕ × ℕ) := [(0, 0), (1, 2), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 5008, representative 7844.
def source40 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B008.Data.entryAt ⟨69, by decide +kernel⟩

def target40 : Weights.Entry :=
  { word := [8, 4, 0, 4, 2, 0, 12], weights := [1, 0, 0, 1] }

def points40 : List (ℕ × ℕ) := [(0, 0), (1, 2), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 5029, representative 7837.
def source41 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B008.Data.entryAt ⟨62, by decide +kernel⟩

def target41 : Weights.Entry :=
  { word := [8, 4, 0, 4, 10, 0, 10], weights := [1, 0, 1, 0] }

def points41 : List (ℕ × ℕ) := [(0, 0), (1, 2), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 5030, representative 7845.
def source42 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B008.Data.entryAt ⟨70, by decide +kernel⟩

def target42 : Weights.Entry :=
  { word := [8, 4, 0, 4, 10, 0, 12], weights := [1, 0, 0, 1] }

def points42 : List (ℕ × ℕ) := [(0, 0), (1, 2), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 5043, representative 7843.
def source43 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B008.Data.entryAt ⟨68, by decide +kernel⟩

def target43 : Weights.Entry :=
  { word := [8, 4, 0, 12, 2, 0, 10], weights := [1, 0, 1, 0] }

def points43 : List (ℕ × ℕ) := [(0, 0), (1, 2), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 5044, representative 7851.
def source44 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B008.Data.entryAt ⟨76, by decide +kernel⟩

def target44 : Weights.Entry :=
  { word := [8, 4, 0, 12, 2, 0, 12], weights := [1, 0, 1, 0] }

def points44 : List (ℕ × ℕ) := [(0, 0), (1, 2), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 5065, representative 7840.
def source45 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B008.Data.entryAt ⟨65, by decide +kernel⟩

def target45 : Weights.Entry :=
  { word := [8, 4, 0, 12, 10, 0, 10], weights := [1, 0, 1, 0] }

def points45 : List (ℕ × ℕ) := [(0, 0), (1, 2), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 5066, representative 7848.
def source46 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B008.Data.entryAt ⟨73, by decide +kernel⟩

def target46 : Weights.Entry :=
  { word := [8, 4, 0, 12, 10, 0, 12], weights := [1, 0, 1, 0] }

def points46 : List (ℕ × ℕ) := [(0, 0), (1, 2), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 5076, representative 7876.
def source47 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B008.Data.entryAt ⟨101, by decide +kernel⟩

def target47 : Weights.Entry :=
  { word := [8, 4, 2, 0, 1, 8, 9], weights := [0, 1, 2, 1] }

-- Period 9, original row 5079, representative 7877.
def source48 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B008.Data.entryAt ⟨102, by decide +kernel⟩

def target48 : Weights.Entry :=
  { word := [8, 4, 2, 0, 9, 8, 9], weights := [0, 1, 2, 1] }

-- Period 9, original row 5084, representative 7827.
def source49 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B008.Data.entryAt ⟨52, by decide +kernel⟩

def target49 : Weights.Entry :=
  { word := [8, 4, 2, 8, 2, 0, 10], weights := [0, 1, 1, 0] }

-- Period 9, original row 5092, representative 7826.
def source50 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B008.Data.entryAt ⟨51, by decide +kernel⟩

def target50 : Weights.Entry :=
  { word := [8, 4, 2, 8, 10, 0, 10], weights := [0, 1, 1, 0] }

-- Period 9, original row 5101, representative 7852.
def source51 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B008.Data.entryAt ⟨77, by decide +kernel⟩

def target51 : Weights.Entry :=
  { word := [8, 4, 4, 4, 0, 0, 10], weights := [1, 0, 0, 1] }

-- Period 9, original row 5102, representative 7852.
def source52 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B008.Data.entryAt ⟨77, by decide +kernel⟩

def target52 : Weights.Entry :=
  { word := [8, 4, 4, 4, 0, 0, 12], weights := [1, 0, 0, 1] }

def points52 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 8), (8, 7)]

-- Period 9, original row 5115, representative 7853.
def source53 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B008.Data.entryAt ⟨78, by decide +kernel⟩

def target53 : Weights.Entry :=
  { word := [8, 4, 4, 4, 8, 0, 10], weights := [1, 0, 1, 0] }

-- Period 9, original row 5116, representative 7857.
def source54 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B008.Data.entryAt ⟨82, by decide +kernel⟩

def target54 : Weights.Entry :=
  { word := [8, 4, 4, 4, 8, 0, 12], weights := [1, 0, 0, 1] }

-- Period 9, original row 5129, representative 7861.
def source55 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B008.Data.entryAt ⟨86, by decide +kernel⟩

def target55 : Weights.Entry :=
  { word := [8, 4, 4, 12, 0, 0, 10], weights := [1, 0, 1, 0] }

-- Period 9, original row 5130, representative 7861.
def source56 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B008.Data.entryAt ⟨86, by decide +kernel⟩

def target56 : Weights.Entry :=
  { word := [8, 4, 4, 12, 0, 0, 12], weights := [1, 0, 1, 0] }

def points56 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 8), (8, 7)]

-- Period 9, original row 5143, representative 7856.
def source57 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B008.Data.entryAt ⟨81, by decide +kernel⟩

def target57 : Weights.Entry :=
  { word := [8, 4, 4, 12, 8, 0, 10], weights := [1, 0, 1, 0] }

-- Period 9, original row 5144, representative 7860.
def source58 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B008.Data.entryAt ⟨85, by decide +kernel⟩

def target58 : Weights.Entry :=
  { word := [8, 4, 4, 12, 8, 0, 12], weights := [1, 0, 1, 0] }

-- Period 9, original row 5155, representative 7875.
def source59 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B008.Data.entryAt ⟨100, by decide +kernel⟩

def target59 : Weights.Entry :=
  { word := [8, 4, 6, 8, 8, 8, 9], weights := [0, 1, 1, 0] }

-- Period 9, original row 5162, representative 7841.
def source60 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B008.Data.entryAt ⟨66, by decide +kernel⟩

def target60 : Weights.Entry :=
  { word := [8, 4, 8, 4, 2, 0, 10], weights := [1, 0, 1, 0] }

-- Period 9, original row 5163, representative 7849.
def source61 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B008.Data.entryAt ⟨74, by decide +kernel⟩

def target61 : Weights.Entry :=
  { word := [8, 4, 8, 4, 2, 0, 12], weights := [1, 0, 0, 1] }

-- Period 9, original row 5188, representative 7838.
def source62 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B008.Data.entryAt ⟨63, by decide +kernel⟩

def target62 : Weights.Entry :=
  { word := [8, 4, 8, 4, 10, 0, 10], weights := [1, 0, 1, 0] }

-- Period 9, original row 5189, representative 7846.
def source63 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B008.Data.entryAt ⟨71, by decide +kernel⟩

def target63 : Weights.Entry :=
  { word := [8, 4, 8, 4, 10, 0, 12], weights := [1, 0, 0, 1] }

-- Period 9, original row 5204, representative 7842.
def source64 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B008.Data.entryAt ⟨67, by decide +kernel⟩

def target64 : Weights.Entry :=
  { word := [8, 4, 8, 12, 2, 0, 10], weights := [1, 0, 1, 0] }

-- Period 9, original row 5205, representative 7850.
def source65 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B008.Data.entryAt ⟨75, by decide +kernel⟩

def target65 : Weights.Entry :=
  { word := [8, 4, 8, 12, 2, 0, 12], weights := [1, 0, 1, 0] }

-- Period 9, original row 5230, representative 7839.
def source66 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B008.Data.entryAt ⟨64, by decide +kernel⟩

def target66 : Weights.Entry :=
  { word := [8, 4, 8, 12, 10, 0, 10], weights := [1, 0, 1, 0] }

-- Period 9, original row 5231, representative 7847.
def source67 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B008.Data.entryAt ⟨72, by decide +kernel⟩

def target67 : Weights.Entry :=
  { word := [8, 4, 8, 12, 10, 0, 12], weights := [1, 0, 1, 0] }

-- Period 9, original row 5243, representative 7879.
def source68 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B008.Data.entryAt ⟨104, by decide +kernel⟩

def target68 : Weights.Entry :=
  { word := [8, 4, 10, 0, 1, 8, 9], weights := [0, 1, 2, 1] }

-- Period 9, original row 5246, representative 7878.
def source69 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B008.Data.entryAt ⟨103, by decide +kernel⟩

def target69 : Weights.Entry :=
  { word := [8, 4, 10, 0, 9, 8, 9], weights := [0, 1, 2, 1] }

-- Period 9, original row 5265, representative 7854.
def source70 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B008.Data.entryAt ⟨79, by decide +kernel⟩

def target70 : Weights.Entry :=
  { word := [8, 4, 12, 4, 8, 0, 10], weights := [1, 0, 1, 0] }

-- Period 9, original row 5266, representative 7858.
def source71 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B008.Data.entryAt ⟨83, by decide +kernel⟩

def target71 : Weights.Entry :=
  { word := [8, 4, 12, 4, 8, 0, 12], weights := [1, 0, 0, 1] }

-- Period 9, original row 5286, representative 7855.
def source72 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B008.Data.entryAt ⟨80, by decide +kernel⟩

def target72 : Weights.Entry :=
  { word := [8, 4, 12, 12, 8, 0, 10], weights := [1, 0, 1, 0] }

-- Period 9, original row 5287, representative 7859.
def source73 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B008.Data.entryAt ⟨84, by decide +kernel⟩

def target73 : Weights.Entry :=
  { word := [8, 4, 12, 12, 8, 0, 12], weights := [1, 0, 1, 0] }

-- Period 9, original row 5346, representative 7862.
def source74 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B008.Data.entryAt ⟨87, by decide +kernel⟩

def target74 : Weights.Entry :=
  { word := [8, 8, 0, 4, 2, 0, 10], weights := [1, 0, 1, 0] }

-- Period 9, original row 5347, representative 7866.
def source75 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B008.Data.entryAt ⟨91, by decide +kernel⟩

def target75 : Weights.Entry :=
  { word := [8, 8, 0, 4, 2, 0, 12], weights := [1, 0, 0, 1] }

-- Period 9, original row 5352, representative 7778.
def source76 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B008.Data.entryAt ⟨3, by decide +kernel⟩

def target76 : Weights.Entry :=
  { word := [8, 8, 0, 4, 2, 8, 12], weights := [1, 0, 0, 1] }

-- Period 9, original row 5372, representative 7863.
def source77 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B008.Data.entryAt ⟨88, by decide +kernel⟩

def target77 : Weights.Entry :=
  { word := [8, 8, 0, 4, 10, 0, 10], weights := [1, 0, 1, 0] }

-- Period 9, original row 5373, representative 7867.
def source78 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B008.Data.entryAt ⟨92, by decide +kernel⟩

def target78 : Weights.Entry :=
  { word := [8, 8, 0, 4, 10, 0, 12], weights := [1, 0, 0, 1] }

-- Period 9, original row 5377, representative 7775.
def source79 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B008.Data.entryAt ⟨0, by decide +kernel⟩

def target79 : Weights.Entry :=
  { word := [8, 8, 0, 4, 10, 8, 10], weights := [1, 0, 1, 0] }

-- Period 9, original row 5378, representative 7779.
def source80 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B008.Data.entryAt ⟨4, by decide +kernel⟩

def target80 : Weights.Entry :=
  { word := [8, 8, 0, 4, 10, 8, 12], weights := [1, 0, 0, 1] }

-- Period 9, original row 5410, representative 7865.
def source81 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B008.Data.entryAt ⟨90, by decide +kernel⟩

def target81 : Weights.Entry :=
  { word := [8, 8, 0, 12, 2, 0, 10], weights := [1, 0, 1, 0] }

-- Period 9, original row 5411, representative 7869.
def source82 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B008.Data.entryAt ⟨94, by decide +kernel⟩

def target82 : Weights.Entry :=
  { word := [8, 8, 0, 12, 2, 0, 12], weights := [1, 0, 1, 0] }

-- Period 9, original row 5415, representative 7777.
def source83 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B008.Data.entryAt ⟨2, by decide +kernel⟩

def target83 : Weights.Entry :=
  { word := [8, 8, 0, 12, 2, 8, 10], weights := [1, 0, 1, 0] }

-- Period 9, original row 5416, representative 7781.
def source84 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B008.Data.entryAt ⟨6, by decide +kernel⟩

def target84 : Weights.Entry :=
  { word := [8, 8, 0, 12, 2, 8, 12], weights := [1, 0, 1, 0] }

-- Period 9, original row 5435, representative 7864.
def source85 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B008.Data.entryAt ⟨89, by decide +kernel⟩

def target85 : Weights.Entry :=
  { word := [8, 8, 0, 12, 10, 0, 10], weights := [1, 0, 1, 0] }

-- Period 9, original row 5436, representative 7868.
def source86 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B008.Data.entryAt ⟨93, by decide +kernel⟩

def target86 : Weights.Entry :=
  { word := [8, 8, 0, 12, 10, 0, 12], weights := [1, 0, 1, 0] }

-- Period 9, original row 5440, representative 7776.
def source87 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B008.Data.entryAt ⟨1, by decide +kernel⟩

def target87 : Weights.Entry :=
  { word := [8, 8, 0, 12, 10, 8, 10], weights := [1, 0, 1, 0] }

-- Period 9, original row 5441, representative 7780.
def source88 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B008.Data.entryAt ⟨5, by decide +kernel⟩

def target88 : Weights.Entry :=
  { word := [8, 8, 0, 12, 10, 8, 12], weights := [1, 0, 1, 0] }

-- Period 9, original row 5449, representative 7800.
def source89 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B008.Data.entryAt ⟨25, by decide +kernel⟩

def target89 : Weights.Entry :=
  { word := [8, 8, 1, 4, 2, 0, 10], weights := [1, 0, 1, 0] }

-- Period 9, original row 5450, representative 7808.
def source90 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B008.Data.entryAt ⟨33, by decide +kernel⟩

def target90 : Weights.Entry :=
  { word := [8, 8, 1, 4, 2, 0, 12], weights := [1, 0, 0, 1] }

-- Period 9, original row 5471, representative 7801.
def source91 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B008.Data.entryAt ⟨26, by decide +kernel⟩

def target91 : Weights.Entry :=
  { word := [8, 8, 1, 4, 10, 0, 10], weights := [1, 0, 1, 0] }

-- Period 9, original row 5472, representative 7809.
def source92 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B008.Data.entryAt ⟨34, by decide +kernel⟩

def target92 : Weights.Entry :=
  { word := [8, 8, 1, 4, 10, 0, 12], weights := [1, 0, 0, 1] }

-- Period 9, original row 5485, representative 7807.
def source93 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B008.Data.entryAt ⟨32, by decide +kernel⟩

def target93 : Weights.Entry :=
  { word := [8, 8, 1, 12, 2, 0, 10], weights := [1, 0, 1, 0] }

-- Period 9, original row 5486, representative 7815.
def source94 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B008.Data.entryAt ⟨40, by decide +kernel⟩

def target94 : Weights.Entry :=
  { word := [8, 8, 1, 12, 2, 0, 12], weights := [1, 0, 1, 0] }

-- Period 9, original row 5507, representative 7804.
def source95 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B008.Data.entryAt ⟨29, by decide +kernel⟩

def target95 : Weights.Entry :=
  { word := [8, 8, 1, 12, 10, 0, 10], weights := [1, 0, 1, 0] }

-- Period 9, original row 5508, representative 7812.
def source96 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B008.Data.entryAt ⟨37, by decide +kernel⟩

def target96 : Weights.Entry :=
  { word := [8, 8, 1, 12, 10, 0, 12], weights := [1, 0, 1, 0] }

-- Period 9, original row 5521, representative 7828.
def source97 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B008.Data.entryAt ⟨53, by decide +kernel⟩

def target97 : Weights.Entry :=
  { word := [8, 8, 2, 2, 2, 0, 10], weights := [0, 1, 0, 0] }

-- Period 9, original row 5522, representative 7832.
def source98 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B008.Data.entryAt ⟨57, by decide +kernel⟩

def target98 : Weights.Entry :=
  { word := [8, 8, 2, 2, 2, 0, 12], weights := [1, 0, 0, 1] }

-- Period 9, original row 5528, representative 7880.
def source99 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B008.Data.entryAt ⟨105, by decide +kernel⟩

def target99 : Weights.Entry :=
  { word := [8, 8, 2, 2, 2, 8, 9], weights := [1, 0, 0, 1] }

-- Period 9, original row 5536, representative 7829.
def source100 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B008.Data.entryAt ⟨54, by decide +kernel⟩

def target100 : Weights.Entry :=
  { word := [8, 8, 2, 2, 10, 0, 10], weights := [0, 1, 0, 0] }

-- Period 9, original row 5537, representative 7833.
def source101 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B008.Data.entryAt ⟨58, by decide +kernel⟩

def target101 : Weights.Entry :=
  { word := [8, 8, 2, 2, 10, 0, 12], weights := [1, 0, 0, 1] }

-- Period 9, original row 5543, representative 7881.
def source102 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B008.Data.entryAt ⟨106, by decide +kernel⟩

def target102 : Weights.Entry :=
  { word := [8, 8, 2, 2, 10, 8, 9], weights := [1, 0, 0, 1] }

-- Period 9, original row 5551, representative 7831.
def source103 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B008.Data.entryAt ⟨56, by decide +kernel⟩

def target103 : Weights.Entry :=
  { word := [8, 8, 2, 10, 2, 0, 10], weights := [0, 1, 0, 0] }

-- Period 9, original row 5552, representative 7835.
def source104 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B008.Data.entryAt ⟨60, by decide +kernel⟩

def target104 : Weights.Entry :=
  { word := [8, 8, 2, 10, 2, 0, 12], weights := [1, 1, 0, 0] }

-- Period 9, original row 5557, representative 7887.
def source105 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B008.Data.entryAt ⟨112, by decide +kernel⟩

def target105 : Weights.Entry :=
  { word := [8, 8, 2, 10, 2, 8, 9], weights := [0, 1, 1, 0] }

-- Period 9, original row 5565, representative 7830.
def source106 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B008.Data.entryAt ⟨55, by decide +kernel⟩

def target106 : Weights.Entry :=
  { word := [8, 8, 2, 10, 10, 0, 10], weights := [0, 1, 0, 0] }

-- Period 9, original row 5566, representative 7834.
def source107 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B008.Data.entryAt ⟨59, by decide +kernel⟩

def target107 : Weights.Entry :=
  { word := [8, 8, 2, 10, 10, 0, 12], weights := [1, 1, 0, 0] }

-- Period 9, original row 5571, representative 7884.
def source108 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B008.Data.entryAt ⟨109, by decide +kernel⟩

def target108 : Weights.Entry :=
  { word := [8, 8, 2, 10, 10, 8, 9], weights := [0, 1, 1, 0] }

-- Period 9, original row 5584, representative 7782.
def source109 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B008.Data.entryAt ⟨7, by decide +kernel⟩

def target109 : Weights.Entry :=
  { word := [8, 8, 4, 2, 0, 8, 10], weights := [1, 0, 0, 1] }

-- Period 9, original row 5585, representative 7782.
def source110 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B008.Data.entryAt ⟨7, by decide +kernel⟩

def target110 : Weights.Entry :=
  { word := [8, 8, 4, 2, 0, 8, 12], weights := [1, 0, 0, 1] }

def points110 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 8), (8, 7)]

-- Period 9, original row 5593, representative 7783.
def source111 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B008.Data.entryAt ⟨8, by decide +kernel⟩

def target111 : Weights.Entry :=
  { word := [8, 8, 4, 2, 8, 8, 12], weights := [1, 0, 0, 1] }

-- Period 9, original row 5623, representative 7789.
def source112 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B008.Data.entryAt ⟨14, by decide +kernel⟩

def target112 : Weights.Entry :=
  { word := [8, 8, 4, 10, 0, 8, 10], weights := [1, 0, 0, 1] }

-- Period 9, original row 5624, representative 7789.
def source113 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B008.Data.entryAt ⟨14, by decide +kernel⟩

def target113 : Weights.Entry :=
  { word := [8, 8, 4, 10, 0, 8, 12], weights := [1, 0, 0, 1] }

def points113 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 8), (8, 7)]

-- Period 9, original row 5631, representative 7786.
def source114 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B008.Data.entryAt ⟨11, by decide +kernel⟩

def target114 : Weights.Entry :=
  { word := [8, 8, 4, 10, 8, 8, 12], weights := [1, 0, 0, 1] }

-- Period 9, original row 5646, representative 7888.
def source115 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B008.Data.entryAt ⟨113, by decide +kernel⟩

def target115 : Weights.Entry :=
  { word := [8, 8, 6, 2, 0, 8, 9], weights := [1, 0, 0, 1] }

-- Period 9, original row 5654, representative 7889.
def source116 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B008.Data.entryAt ⟨114, by decide +kernel⟩

def target116 : Weights.Entry :=
  { word := [8, 8, 6, 2, 8, 8, 9], weights := [1, 0, 0, 1] }

-- Period 9, original row 5661, representative 7891.
def source117 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B008.Data.entryAt ⟨116, by decide +kernel⟩

def target117 : Weights.Entry :=
  { word := [8, 8, 6, 10, 0, 8, 9], weights := [1, 0, 0, 1] }

-- Period 9, original row 5668, representative 7890.
def source118 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B008.Data.entryAt ⟨115, by decide +kernel⟩

def target118 : Weights.Entry :=
  { word := [8, 8, 6, 10, 8, 8, 9], weights := [0, 1, 1, 0] }

-- Period 9, original row 5757, representative 7885.
def source119 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B008.Data.entryAt ⟨110, by decide +kernel⟩

def target119 : Weights.Entry :=
  { word := [8, 8, 10, 2, 2, 8, 9], weights := [1, 0, 0, 1] }

-- Period 9, original row 5765, representative 7882.
def source120 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B008.Data.entryAt ⟨107, by decide +kernel⟩

def target120 : Weights.Entry :=
  { word := [8, 8, 10, 2, 10, 8, 9], weights := [1, 0, 0, 1] }

-- Period 9, original row 5772, representative 7886.
def source121 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B008.Data.entryAt ⟨111, by decide +kernel⟩

def target121 : Weights.Entry :=
  { word := [8, 8, 10, 10, 2, 8, 9], weights := [0, 1, 1, 0] }

-- Period 9, original row 5779, representative 7883.
def source122 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B008.Data.entryAt ⟨108, by decide +kernel⟩

def target122 : Weights.Entry :=
  { word := [8, 8, 10, 10, 10, 8, 9], weights := [0, 1, 1, 0] }

-- Period 9, original row 5792, representative 7787.
def source123 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B008.Data.entryAt ⟨12, by decide +kernel⟩

def target123 : Weights.Entry :=
  { word := [8, 8, 12, 2, 0, 8, 10], weights := [1, 0, 0, 1] }

-- Period 9, original row 5793, representative 7787.
def source124 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B008.Data.entryAt ⟨12, by decide +kernel⟩

def target124 : Weights.Entry :=
  { word := [8, 8, 12, 2, 0, 8, 12], weights := [1, 0, 0, 1] }

def points124 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 8), (8, 7)]

-- Period 9, original row 5801, representative 7784.
def source125 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B008.Data.entryAt ⟨9, by decide +kernel⟩

def target125 : Weights.Entry :=
  { word := [8, 8, 12, 2, 8, 8, 12], weights := [1, 0, 0, 1] }

-- Period 9, original row 5830, representative 7788.
def source126 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B008.Data.entryAt ⟨13, by decide +kernel⟩

def target126 : Weights.Entry :=
  { word := [8, 8, 12, 10, 0, 8, 10], weights := [1, 0, 0, 1] }

-- Period 9, original row 5831, representative 7788.
def source127 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B008.Data.entryAt ⟨13, by decide +kernel⟩

def target127 : Weights.Entry :=
  { word := [8, 8, 12, 10, 0, 8, 12], weights := [1, 0, 0, 1] }

def points127 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 8), (8, 7)]

def period9Entries : List Weights.Entry := [target0, target1, target2, target3, target4, target5, target6, target7, target8, target9, target10, target11, target12, target13, target14, target15, target16, target17, target18, target19, target20, target21, target22, target23, target24, target25, target26, target27, target28, target29, target30, target31, target32, target33, target34, target35, target36, target37, target38, target39, target40, target41, target42, target43, target44, target45, target46, target47, target48, target49, target50, target51, target52, target53, target54, target55, target56, target57, target58, target59, target60, target61, target62, target63, target64, target65, target66, target67, target68, target69, target70, target71, target72, target73, target74, target75, target76, target77, target78, target79, target80, target81, target82, target83, target84, target85, target86, target87, target88, target89, target90, target91, target92, target93, target94, target95, target96, target97, target98, target99, target100, target101, target102, target103, target104, target105, target106, target107, target108, target109, target110, target111, target112, target113, target114, target115, target116, target117, target118, target119, target120, target121, target122, target123, target124, target125, target126, target127]

def period9Chunk : RowCoverage.Chunk where
  rows := [⟨4128, target0⟩, ⟨4129, target1⟩, ⟨4150, target2⟩, ⟨4151, target3⟩, ⟨4164, target4⟩, ⟨4165, target5⟩, ⟨4186, target6⟩, ⟨4187, target7⟩, ⟨4200, target8⟩, ⟨4201, target9⟩, ⟨4207, target10⟩, ⟨4215, target11⟩, ⟨4216, target12⟩, ⟨4222, target13⟩, ⟨4230, target14⟩, ⟨4231, target15⟩, ⟨4236, target16⟩, ⟨4244, target17⟩, ⟨4245, target18⟩, ⟨4250, target19⟩, ⟨4263, target20⟩, ⟨4264, target21⟩, ⟨4272, target22⟩, ⟨4295, target23⟩, ⟨4296, target24⟩, ⟨4308, target25⟩, ⟨4320, target26⟩, ⟨4328, target27⟩, ⟨4342, target28⟩, ⟨4401, target29⟩, ⟨4409, target30⟩, ⟨4416, target31⟩, ⟨4423, target32⟩, ⟨4436, target33⟩, ⟨4437, target34⟩, ⟨4445, target35⟩, ⟨4471, target36⟩, ⟨4472, target37⟩, ⟨4484, target38⟩, ⟨5007, target39⟩, ⟨5008, target40⟩, ⟨5029, target41⟩, ⟨5030, target42⟩, ⟨5043, target43⟩, ⟨5044, target44⟩, ⟨5065, target45⟩, ⟨5066, target46⟩, ⟨5076, target47⟩, ⟨5079, target48⟩, ⟨5084, target49⟩, ⟨5092, target50⟩, ⟨5101, target51⟩, ⟨5102, target52⟩, ⟨5115, target53⟩, ⟨5116, target54⟩, ⟨5129, target55⟩, ⟨5130, target56⟩, ⟨5143, target57⟩, ⟨5144, target58⟩, ⟨5155, target59⟩, ⟨5162, target60⟩, ⟨5163, target61⟩, ⟨5188, target62⟩, ⟨5189, target63⟩, ⟨5204, target64⟩, ⟨5205, target65⟩, ⟨5230, target66⟩, ⟨5231, target67⟩, ⟨5243, target68⟩, ⟨5246, target69⟩, ⟨5265, target70⟩, ⟨5266, target71⟩, ⟨5286, target72⟩, ⟨5287, target73⟩, ⟨5346, target74⟩, ⟨5347, target75⟩, ⟨5352, target76⟩, ⟨5372, target77⟩, ⟨5373, target78⟩, ⟨5377, target79⟩, ⟨5378, target80⟩, ⟨5410, target81⟩, ⟨5411, target82⟩, ⟨5415, target83⟩, ⟨5416, target84⟩, ⟨5435, target85⟩, ⟨5436, target86⟩, ⟨5440, target87⟩, ⟨5441, target88⟩, ⟨5449, target89⟩, ⟨5450, target90⟩, ⟨5471, target91⟩, ⟨5472, target92⟩, ⟨5485, target93⟩, ⟨5486, target94⟩, ⟨5507, target95⟩, ⟨5508, target96⟩, ⟨5521, target97⟩, ⟨5522, target98⟩, ⟨5528, target99⟩, ⟨5536, target100⟩, ⟨5537, target101⟩, ⟨5543, target102⟩, ⟨5551, target103⟩, ⟨5552, target104⟩, ⟨5557, target105⟩, ⟨5565, target106⟩, ⟨5566, target107⟩, ⟨5571, target108⟩, ⟨5584, target109⟩, ⟨5585, target110⟩, ⟨5593, target111⟩, ⟨5623, target112⟩, ⟨5624, target113⟩, ⟨5631, target114⟩, ⟨5646, target115⟩, ⟨5654, target116⟩, ⟨5661, target117⟩, ⟨5668, target118⟩, ⟨5757, target119⟩, ⟨5765, target120⟩, ⟨5772, target121⟩, ⟨5779, target122⟩, ⟨5792, target123⟩, ⟨5793, target124⟩, ⟨5801, target125⟩, ⟨5830, target126⟩, ⟨5831, target127⟩]
  indexMask := 3033863073503795740304083598088570094083135307487730028660094579300792483436801563864332506907536811071521582307027248931029686173906569152038375243514129309210485584747779369904245439165363674644179384364381716946620928561054899821941671108384387347477687934441912240324766057304604618023693668858389753011828253200417349027268962099376074530189717108080978305419772548843055913060740616177384897821948617269906253644883740306752474925611965702619428417162539319703379489430595659622607940651415783410445227558406983846395670704310180288769443548689980404246640283188357321057826959679519146260600107672123260682428897361035978292902093535166658236267868744303174263194030003329515199542790935910605638807034262804980752046200165082475588222547768584745094615028707224762200014998911538412998132476466592997824219443932852042408793956244136159838233068598037397589586247353877381171923818961578710493575993834622849218066256066803127527151461999870248570313825920945782813791189739868876139255726369723665284196018338290930814561024583540269230227392810322566278089907793420271950511343766100542494784363554266178211720936013541805562194061194019133764524514401302937706570915710678374055307465061508767426428868060880828056286277071205363699960330162459890141606795380113692627343516888985994272027739699212008898600431287445177843478083266654949004571361273005561612500893562223626896150193943320837638680978238525213013960607658234227206821958961904219710122120838016845968036595884963160362989568283176122590668594258983555577087646303809786205126849375750186312697251916592887467182132435182206037635221999635306802243464025245473562251098205377290776783027409759258693733672405006086779778273421123203967802624868835934872305761786186543274643161088
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

end FranklSmallCyclic.TransportBatches.G061.B000.Data
