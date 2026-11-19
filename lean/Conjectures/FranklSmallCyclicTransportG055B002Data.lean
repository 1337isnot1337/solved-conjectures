module

public import Conjectures.FranklSmallCyclicRowCoverage
public import Conjectures.FranklSmallCyclicCanonicalWords
public import Conjectures.FranklSmallCyclicOrbit9Block002Data

/-! 128 literal targets sharing one source proof block.
Original words and row indices are retained; weights may be transported.
-/
@[expose] public section

namespace FranklSmallCyclic.TransportBatches.G055.B002.Data

-- Period 9, original row 8115, representative 7006.
def source0 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨2, by decide +kernel⟩

def target0 : Weights.Entry :=
  { word := [10, 8, 9, 8, 9, 4, 12], weights := [1, 0, 1, 1] }

def points0 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 8580, representative 7083.
def source1 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨79, by decide +kernel⟩

def target1 : Weights.Entry :=
  { word := [12, 2, 0, 9, 0, 4, 0], weights := [0, 1, 1, 0] }

def points1 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 5), (4, 6), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 8581, representative 7077.
def source2 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨73, by decide +kernel⟩

def target2 : Weights.Entry :=
  { word := [12, 2, 0, 9, 0, 4, 8], weights := [1, 1, 2, 0] }

def points2 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 8583, representative 7082.
def source3 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨78, by decide +kernel⟩

def target3 : Weights.Entry :=
  { word := [12, 2, 0, 9, 0, 12, 0], weights := [0, 1, 1, 0] }

def points3 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 5), (4, 6), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 8584, representative 7076.
def source4 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨72, by decide +kernel⟩

def target4 : Weights.Entry :=
  { word := [12, 2, 0, 9, 0, 12, 8], weights := [1, 1, 2, 0] }

def points4 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 8585, representative 7045.
def source5 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨41, by decide +kernel⟩

def target5 : Weights.Entry :=
  { word := [12, 2, 0, 9, 8, 1, 4], weights := [1, 1, 0, 1] }

def points5 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 8586, representative 7013.
def source6 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨9, by decide +kernel⟩

def target6 : Weights.Entry :=
  { word := [12, 2, 0, 9, 8, 1, 12], weights := [1, 1, 0, 1] }

def points6 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 8587, representative 7044.
def source7 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨40, by decide +kernel⟩

def target7 : Weights.Entry :=
  { word := [12, 2, 0, 9, 8, 2, 2], weights := [1, 1, 0, 1] }

def points7 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 8588, representative 7012.
def source8 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨8, by decide +kernel⟩

def target8 : Weights.Entry :=
  { word := [12, 2, 0, 9, 8, 2, 10], weights := [1, 1, 0, 1] }

def points8 : List (ℕ × ℕ) := [(0, 0), (1, 2), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 8589, representative 7046.
def source9 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨42, by decide +kernel⟩

def target9 : Weights.Entry :=
  { word := [12, 2, 0, 9, 8, 8, 4], weights := [1, 1, 0, 1] }

def points9 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 8591, representative 7014.
def source10 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨10, by decide +kernel⟩

def target10 : Weights.Entry :=
  { word := [12, 2, 0, 9, 8, 8, 12], weights := [1, 1, 0, 1] }

def points10 : List (ℕ × ℕ) := [(0, 0), (1, 2), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 8592, representative 7043.
def source11 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨39, by decide +kernel⟩

def target11 : Weights.Entry :=
  { word := [12, 2, 0, 9, 8, 9, 4], weights := [1, 1, 0, 1] }

def points11 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 8593, representative 7011.
def source12 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨7, by decide +kernel⟩

def target12 : Weights.Entry :=
  { word := [12, 2, 0, 9, 8, 9, 12], weights := [1, 1, 0, 1] }

def points12 : List (ℕ × ℕ) := [(0, 0), (1, 2), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 8594, representative 7042.
def source13 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨38, by decide +kernel⟩

def target13 : Weights.Entry :=
  { word := [12, 2, 0, 9, 8, 10, 2], weights := [1, 1, 0, 1] }

def points13 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 8595, representative 7010.
def source14 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨6, by decide +kernel⟩

def target14 : Weights.Entry :=
  { word := [12, 2, 0, 9, 8, 10, 10], weights := [1, 1, 0, 1] }

def points14 : List (ℕ × ℕ) := [(0, 0), (1, 2), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 8596, representative 7083.
def source15 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨79, by decide +kernel⟩

def target15 : Weights.Entry :=
  { word := [12, 2, 0, 10, 0, 0, 1], weights := [0, 1, 0, 1] }

def points15 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 8600, representative 7052.
def source16 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨48, by decide +kernel⟩

def target16 : Weights.Entry :=
  { word := [12, 2, 0, 10, 0, 0, 9], weights := [0, 1, 0, 1] }

def points16 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 8604, representative 7082.
def source17 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨78, by decide +kernel⟩

def target17 : Weights.Entry :=
  { word := [12, 2, 0, 10, 0, 8, 1], weights := [0, 1, 0, 1] }

def points17 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 8605, representative 7027.
def source18 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨23, by decide +kernel⟩

def target18 : Weights.Entry :=
  { word := [12, 2, 0, 10, 0, 8, 4], weights := [0, 1, 0, 1] }

def points18 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 8607, representative 7051.
def source19 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨47, by decide +kernel⟩

def target19 : Weights.Entry :=
  { word := [12, 2, 0, 10, 0, 8, 9], weights := [0, 1, 0, 1] }

def points19 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 8609, representative 7028.
def source20 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨24, by decide +kernel⟩

def target20 : Weights.Entry :=
  { word := [12, 2, 0, 10, 8, 0, 4], weights := [0, 1, 0, 1] }

def points20 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 8611, representative 7026.
def source21 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨22, by decide +kernel⟩

def target21 : Weights.Entry :=
  { word := [12, 2, 0, 10, 8, 8, 4], weights := [0, 1, 0, 1] }

def points21 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 8615, representative 7036.
def source22 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨32, by decide +kernel⟩

def target22 : Weights.Entry :=
  { word := [12, 2, 0, 12, 10, 0, 4], weights := [1, 1, 0, 1] }

def points22 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 8617, representative 7063.
def source23 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨59, by decide +kernel⟩

def target23 : Weights.Entry :=
  { word := [12, 2, 0, 12, 10, 0, 9], weights := [1, 1, 0, 1] }

def points23 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 8619, representative 7004.
def source24 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨0, by decide +kernel⟩

def target24 : Weights.Entry :=
  { word := [12, 2, 0, 12, 10, 0, 12], weights := [1, 1, 0, 1] }

def points24 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 8626, representative 7078.
def source25 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨74, by decide +kernel⟩

def target25 : Weights.Entry :=
  { word := [12, 2, 8, 2, 0, 8, 1], weights := [0, 1, 0, 1] }

def points25 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 8627, representative 7016.
def source26 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨12, by decide +kernel⟩

def target26 : Weights.Entry :=
  { word := [12, 2, 8, 2, 0, 8, 2], weights := [0, 1, 0, 1] }

def points26 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 8628, representative 7016.
def source27 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨12, by decide +kernel⟩

def target27 : Weights.Entry :=
  { word := [12, 2, 8, 2, 0, 8, 4], weights := [0, 1, 0, 1] }

def points27 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 8630, representative 7047.
def source28 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨43, by decide +kernel⟩

def target28 : Weights.Entry :=
  { word := [12, 2, 8, 2, 0, 8, 9], weights := [0, 1, 0, 1] }

def points28 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 8639, representative 7017.
def source29 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨13, by decide +kernel⟩

def target29 : Weights.Entry :=
  { word := [12, 2, 8, 2, 8, 8, 4], weights := [0, 1, 0, 1] }

def points29 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 8643, representative 7095.
def source30 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨91, by decide +kernel⟩

def target30 : Weights.Entry :=
  { word := [12, 2, 8, 4, 4, 4, 0], weights := [1, 0, 1, 0] }

def points30 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 8644, representative 7091.
def source31 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨87, by decide +kernel⟩

def target31 : Weights.Entry :=
  { word := [12, 2, 8, 4, 4, 12, 0], weights := [1, 0, 1, 0] }

def points31 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 8645, representative 7096.
def source32 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨92, by decide +kernel⟩

def target32 : Weights.Entry :=
  { word := [12, 2, 8, 4, 12, 4, 0], weights := [1, 0, 1, 0] }

def points32 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 8646, representative 7092.
def source33 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨88, by decide +kernel⟩

def target33 : Weights.Entry :=
  { word := [12, 2, 8, 4, 12, 12, 0], weights := [1, 0, 1, 0] }

def points33 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 8648, representative 7090.
def source34 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨86, by decide +kernel⟩

def target34 : Weights.Entry :=
  { word := [12, 2, 8, 8, 4, 6, 0], weights := [0, 1, 1, 0] }

def points34 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 8651, representative 7089.
def source35 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨85, by decide +kernel⟩

def target35 : Weights.Entry :=
  { word := [12, 2, 8, 8, 12, 6, 0], weights := [0, 1, 1, 0] }

def points35 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 8657, representative 7100.
def source36 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨96, by decide +kernel⟩

def target36 : Weights.Entry :=
  { word := [12, 2, 8, 10, 0, 6, 0], weights := [0, 1, 1, 0] }

def points36 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 8659, representative 7079.
def source37 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨75, by decide +kernel⟩

def target37 : Weights.Entry :=
  { word := [12, 2, 8, 10, 0, 8, 1], weights := [0, 1, 0, 1] }

def points37 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 8660, representative 7019.
def source38 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨15, by decide +kernel⟩

def target38 : Weights.Entry :=
  { word := [12, 2, 8, 10, 0, 8, 2], weights := [0, 1, 0, 1] }

def points38 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 8661, representative 7019.
def source39 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨15, by decide +kernel⟩

def target39 : Weights.Entry :=
  { word := [12, 2, 8, 10, 0, 8, 4], weights := [0, 1, 0, 1] }

def points39 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 8663, representative 7048.
def source40 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨44, by decide +kernel⟩

def target40 : Weights.Entry :=
  { word := [12, 2, 8, 10, 0, 8, 9], weights := [0, 1, 0, 1] }

def points40 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 8670, representative 7101.
def source41 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨97, by decide +kernel⟩

def target41 : Weights.Entry :=
  { word := [12, 2, 8, 10, 0, 12, 0], weights := [0, 1, 1, 0] }

def points41 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 8673, representative 7099.
def source42 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨95, by decide +kernel⟩

def target42 : Weights.Entry :=
  { word := [12, 2, 8, 10, 8, 6, 0], weights := [0, 1, 1, 0] }

def points42 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 8674, representative 7088.
def source43 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨84, by decide +kernel⟩

def target43 : Weights.Entry :=
  { word := [12, 2, 8, 10, 8, 6, 8], weights := [1, 1, 1, 1] }

def points43 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 8675, representative 7018.
def source44 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨14, by decide +kernel⟩

def target44 : Weights.Entry :=
  { word := [12, 2, 8, 10, 8, 8, 4], weights := [0, 1, 0, 1] }

def points44 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 8679, representative 7015.
def source45 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨11, by decide +kernel⟩

def target45 : Weights.Entry :=
  { word := [12, 2, 8, 10, 8, 12, 4], weights := [1, 2, 1, 2] }

def points45 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 8681, representative 7098.
def source46 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨94, by decide +kernel⟩

def target46 : Weights.Entry :=
  { word := [12, 2, 8, 12, 4, 4, 0], weights := [0, 1, 1, 0] }

def points46 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 8682, representative 7087.
def source47 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨83, by decide +kernel⟩

def target47 : Weights.Entry :=
  { word := [12, 2, 8, 12, 4, 4, 8], weights := [1, 1, 1, 1] }

def points47 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 8683, representative 7094.
def source48 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨90, by decide +kernel⟩

def target48 : Weights.Entry :=
  { word := [12, 2, 8, 12, 4, 12, 0], weights := [0, 1, 1, 0] }

def points48 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 8684, representative 7085.
def source49 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨81, by decide +kernel⟩

def target49 : Weights.Entry :=
  { word := [12, 2, 8, 12, 4, 12, 8], weights := [1, 1, 1, 1] }

def points49 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 8685, representative 7097.
def source50 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨93, by decide +kernel⟩

def target50 : Weights.Entry :=
  { word := [12, 2, 8, 12, 12, 4, 0], weights := [0, 1, 1, 0] }

def points50 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 8686, representative 7086.
def source51 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨82, by decide +kernel⟩

def target51 : Weights.Entry :=
  { word := [12, 2, 8, 12, 12, 4, 8], weights := [1, 1, 1, 1] }

def points51 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 8687, representative 7093.
def source52 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨89, by decide +kernel⟩

def target52 : Weights.Entry :=
  { word := [12, 2, 8, 12, 12, 12, 0], weights := [0, 1, 1, 0] }

def points52 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 8688, representative 7084.
def source53 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨80, by decide +kernel⟩

def target53 : Weights.Entry :=
  { word := [12, 2, 8, 12, 12, 12, 8], weights := [1, 1, 1, 1] }

def points53 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 8698, representative 7012.
def source54 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨8, by decide +kernel⟩

def target54 : Weights.Entry :=
  { word := [12, 4, 8, 8, 1, 4, 10], weights := [1, 0, 1, 1] }

def points54 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 8699, representative 7012.
def source55 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨8, by decide +kernel⟩

def target55 : Weights.Entry :=
  { word := [12, 4, 8, 8, 1, 4, 12], weights := [1, 0, 1, 1] }

def points55 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 8711, representative 7007.
def source56 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨3, by decide +kernel⟩

def target56 : Weights.Entry :=
  { word := [12, 4, 8, 8, 9, 4, 12], weights := [1, 0, 1, 1] }

def points56 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 9063, representative 7010.
def source57 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨6, by decide +kernel⟩

def target57 : Weights.Entry :=
  { word := [12, 12, 8, 8, 1, 4, 10], weights := [1, 0, 1, 1] }

def points57 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 9064, representative 7010.
def source58 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨6, by decide +kernel⟩

def target58 : Weights.Entry :=
  { word := [12, 12, 8, 8, 1, 4, 12], weights := [1, 0, 1, 1] }

def points58 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 9076, representative 7005.
def source59 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨1, by decide +kernel⟩

def target59 : Weights.Entry :=
  { word := [12, 12, 8, 8, 9, 4, 12], weights := [1, 0, 1, 1] }

def points59 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 10, original row 131, representative 7129.
def source60 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨125, by decide +kernel⟩

def target60 : Weights.Entry :=
  { word := [0, 1, 0, 9, 12, 4, 12], weights := [1, 0, 1, 1] }

def points60 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 10, original row 139, representative 7083.
def source61 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨79, by decide +kernel⟩

def target61 : Weights.Entry :=
  { word := [0, 1, 0, 12, 0, 4, 10], weights := [1, 0, 1, 0] }

def points61 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 10, original row 140, representative 7083.
def source62 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨79, by decide +kernel⟩

def target62 : Weights.Entry :=
  { word := [0, 1, 0, 12, 0, 4, 12], weights := [1, 0, 1, 0] }

def points62 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 8), (8, 7)]

-- Period 10, original row 222, representative 7128.
def source63 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨124, by decide +kernel⟩

def target63 : Weights.Entry :=
  { word := [0, 1, 8, 9, 12, 4, 12], weights := [1, 0, 1, 1] }

def points63 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 10, original row 298, representative 7083.
def source64 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨79, by decide +kernel⟩

def target64 : Weights.Entry :=
  { word := [0, 2, 0, 8, 1, 4, 10], weights := [0, 1, 1, 0] }

def points64 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 10, original row 299, representative 7083.
def source65 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨79, by decide +kernel⟩

def target65 : Weights.Entry :=
  { word := [0, 2, 0, 8, 1, 4, 12], weights := [0, 1, 1, 0] }

def points65 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6), (7, 8), (8, 7)]

-- Period 10, original row 304, representative 7071.
def source66 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨67, by decide +kernel⟩

def target66 : Weights.Entry :=
  { word := [0, 2, 0, 8, 4, 4, 12], weights := [0, 1, 0, 1] }

def points66 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 10, original row 307, representative 7125.
def source67 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨121, by decide +kernel⟩

def target67 : Weights.Entry :=
  { word := [0, 2, 0, 8, 8, 4, 12], weights := [0, 1, 0, 1] }

def points67 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 10, original row 311, representative 7075.
def source68 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨71, by decide +kernel⟩

def target68 : Weights.Entry :=
  { word := [0, 2, 0, 8, 9, 4, 12], weights := [0, 1, 1, 0] }

def points68 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 10, original row 315, representative 7067.
def source69 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨63, by decide +kernel⟩

def target69 : Weights.Entry :=
  { word := [0, 2, 0, 8, 12, 4, 12], weights := [0, 1, 0, 1] }

def points69 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 10, original row 346, representative 7095.
def source70 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨91, by decide +kernel⟩

def target70 : Weights.Entry :=
  { word := [0, 2, 2, 2, 8, 4, 10], weights := [0, 1, 0, 1] }

def points70 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 10, original row 347, representative 7117.
def source71 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨113, by decide +kernel⟩

def target71 : Weights.Entry :=
  { word := [0, 2, 2, 2, 8, 4, 12], weights := [0, 1, 0, 1] }

def points71 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 10, original row 395, representative 7098.
def source72 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨94, by decide +kernel⟩

def target72 : Weights.Entry :=
  { word := [0, 2, 2, 10, 8, 4, 10], weights := [0, 1, 1, 0] }

def points72 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 10, original row 396, representative 7120.
def source73 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨116, by decide +kernel⟩

def target73 : Weights.Entry :=
  { word := [0, 2, 2, 10, 8, 4, 12], weights := [0, 1, 0, 1] }

def points73 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 10, original row 412, representative 7070.
def source74 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨66, by decide +kernel⟩

def target74 : Weights.Entry :=
  { word := [0, 2, 8, 8, 4, 4, 12], weights := [0, 1, 0, 1] }

def points74 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 10, original row 417, representative 7066.
def source75 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨62, by decide +kernel⟩

def target75 : Weights.Entry :=
  { word := [0, 2, 8, 8, 12, 4, 12], weights := [0, 1, 0, 1] }

def points75 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 10, original row 444, representative 7096.
def source76 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨92, by decide +kernel⟩

def target76 : Weights.Entry :=
  { word := [0, 2, 10, 2, 8, 4, 10], weights := [0, 1, 0, 1] }

def points76 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 10, original row 445, representative 7118.
def source77 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨114, by decide +kernel⟩

def target77 : Weights.Entry :=
  { word := [0, 2, 10, 2, 8, 4, 12], weights := [0, 1, 0, 1] }

def points77 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 10, original row 490, representative 7097.
def source78 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨93, by decide +kernel⟩

def target78 : Weights.Entry :=
  { word := [0, 2, 10, 10, 8, 4, 10], weights := [0, 1, 1, 0] }

def points78 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 10, original row 491, representative 7119.
def source79 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨115, by decide +kernel⟩

def target79 : Weights.Entry :=
  { word := [0, 2, 10, 10, 8, 4, 12], weights := [0, 1, 0, 1] }

def points79 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 10, original row 741, representative 7100.
def source80 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨96, by decide +kernel⟩

def target80 : Weights.Entry :=
  { word := [0, 6, 0, 12, 8, 4, 10], weights := [0, 1, 1, 0] }

def points80 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 10, original row 742, representative 7122.
def source81 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨118, by decide +kernel⟩

def target81 : Weights.Entry :=
  { word := [0, 6, 0, 12, 8, 4, 12], weights := [0, 1, 0, 1] }

def points81 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 10, original row 755, representative 7090.
def source82 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨86, by decide +kernel⟩

def target82 : Weights.Entry :=
  { word := [0, 6, 2, 8, 8, 4, 10], weights := [0, 1, 1, 0] }

def points82 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 10, original row 771, representative 7099.
def source83 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨95, by decide +kernel⟩

def target83 : Weights.Entry :=
  { word := [0, 6, 8, 12, 8, 4, 10], weights := [0, 1, 1, 0] }

def points83 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 10, original row 772, representative 7121.
def source84 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨117, by decide +kernel⟩

def target84 : Weights.Entry :=
  { word := [0, 6, 8, 12, 8, 4, 12], weights := [0, 1, 0, 1] }

def points84 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 10, original row 782, representative 7089.
def source85 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨85, by decide +kernel⟩

def target85 : Weights.Entry :=
  { word := [0, 6, 10, 8, 8, 4, 10], weights := [0, 1, 1, 0] }

def points85 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 10, original row 1171, representative 7078.
def source86 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨74, by decide +kernel⟩

def target86 : Weights.Entry :=
  { word := [0, 9, 0, 4, 8, 4, 10], weights := [1, 0, 1, 0] }

def points86 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 10, original row 1172, representative 7080.
def source87 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨76, by decide +kernel⟩

def target87 : Weights.Entry :=
  { word := [0, 9, 0, 4, 8, 4, 12], weights := [1, 0, 0, 1] }

def points87 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 10, original row 1191, representative 7131.
def source88 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨127, by decide +kernel⟩

def target88 : Weights.Entry :=
  { word := [0, 9, 0, 9, 4, 4, 12], weights := [1, 1, 1, 1] }

def points88 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 10, original row 1195, representative 7127.
def source89 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨123, by decide +kernel⟩

def target89 : Weights.Entry :=
  { word := [0, 9, 0, 9, 12, 4, 12], weights := [1, 1, 1, 1] }

def points89 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 10, original row 1205, representative 7082.
def source90 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨78, by decide +kernel⟩

def target90 : Weights.Entry :=
  { word := [0, 9, 0, 12, 0, 4, 10], weights := [1, 0, 1, 0] }

def points90 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 10, original row 1206, representative 7082.
def source91 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨78, by decide +kernel⟩

def target91 : Weights.Entry :=
  { word := [0, 9, 0, 12, 0, 4, 12], weights := [1, 0, 1, 0] }

def points91 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 8), (8, 7)]

-- Period 10, original row 1230, representative 7079.
def source92 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨75, by decide +kernel⟩

def target92 : Weights.Entry :=
  { word := [0, 9, 0, 12, 8, 4, 10], weights := [1, 0, 1, 0] }

def points92 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 10, original row 1231, representative 7081.
def source93 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨77, by decide +kernel⟩

def target93 : Weights.Entry :=
  { word := [0, 9, 0, 12, 8, 4, 12], weights := [1, 0, 1, 0] }

def points93 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 10, original row 1302, representative 7130.
def source94 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨126, by decide +kernel⟩

def target94 : Weights.Entry :=
  { word := [0, 9, 8, 9, 4, 4, 12], weights := [1, 1, 1, 1] }

def points94 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 10, original row 1306, representative 7126.
def source95 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨122, by decide +kernel⟩

def target95 : Weights.Entry :=
  { word := [0, 9, 8, 9, 12, 4, 12], weights := [1, 1, 1, 1] }

def points95 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 10, original row 1347, representative 7082.
def source96 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨78, by decide +kernel⟩

def target96 : Weights.Entry :=
  { word := [0, 10, 0, 8, 1, 4, 10], weights := [0, 1, 1, 0] }

def points96 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 10, original row 1348, representative 7082.
def source97 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨78, by decide +kernel⟩

def target97 : Weights.Entry :=
  { word := [0, 10, 0, 8, 1, 4, 12], weights := [0, 1, 1, 0] }

def points97 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6), (7, 8), (8, 7)]

-- Period 10, original row 1353, representative 7069.
def source98 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨65, by decide +kernel⟩

def target98 : Weights.Entry :=
  { word := [0, 10, 0, 8, 4, 4, 12], weights := [0, 1, 0, 1] }

def points98 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 10, original row 1356, representative 7124.
def source99 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨120, by decide +kernel⟩

def target99 : Weights.Entry :=
  { word := [0, 10, 0, 8, 8, 4, 12], weights := [0, 1, 0, 1] }

def points99 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 10, original row 1360, representative 7074.
def source100 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨70, by decide +kernel⟩

def target100 : Weights.Entry :=
  { word := [0, 10, 0, 8, 9, 4, 12], weights := [0, 1, 1, 0] }

def points100 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 10, original row 1364, representative 7065.
def source101 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨61, by decide +kernel⟩

def target101 : Weights.Entry :=
  { word := [0, 10, 0, 8, 12, 4, 12], weights := [0, 1, 0, 1] }

def points101 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 10, original row 1369, representative 7101.
def source102 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨97, by decide +kernel⟩

def target102 : Weights.Entry :=
  { word := [0, 10, 0, 12, 8, 4, 10], weights := [0, 1, 1, 0] }

def points102 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 10, original row 1370, representative 7123.
def source103 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨119, by decide +kernel⟩

def target103 : Weights.Entry :=
  { word := [0, 10, 0, 12, 8, 4, 12], weights := [0, 1, 0, 1] }

def points103 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 10, original row 1389, representative 7091.
def source104 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨87, by decide +kernel⟩

def target104 : Weights.Entry :=
  { word := [0, 10, 2, 2, 8, 4, 10], weights := [0, 1, 0, 1] }

def points104 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 10, original row 1390, representative 7113.
def source105 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨109, by decide +kernel⟩

def target105 : Weights.Entry :=
  { word := [0, 10, 2, 2, 8, 4, 12], weights := [0, 1, 0, 1] }

def points105 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 10, original row 1421, representative 7094.
def source106 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨90, by decide +kernel⟩

def target106 : Weights.Entry :=
  { word := [0, 10, 2, 10, 8, 4, 10], weights := [0, 1, 1, 0] }

def points106 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 10, original row 1422, representative 7116.
def source107 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨112, by decide +kernel⟩

def target107 : Weights.Entry :=
  { word := [0, 10, 2, 10, 8, 4, 12], weights := [0, 1, 0, 1] }

def points107 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 10, original row 1444, representative 7068.
def source108 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨64, by decide +kernel⟩

def target108 : Weights.Entry :=
  { word := [0, 10, 8, 8, 4, 4, 12], weights := [0, 1, 0, 1] }

def points108 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 10, original row 1449, representative 7064.
def source109 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨60, by decide +kernel⟩

def target109 : Weights.Entry :=
  { word := [0, 10, 8, 8, 12, 4, 12], weights := [0, 1, 0, 1] }

def points109 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 10, original row 1464, representative 7092.
def source110 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨88, by decide +kernel⟩

def target110 : Weights.Entry :=
  { word := [0, 10, 10, 2, 8, 4, 10], weights := [0, 1, 0, 1] }

def points110 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 10, original row 1465, representative 7114.
def source111 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨110, by decide +kernel⟩

def target111 : Weights.Entry :=
  { word := [0, 10, 10, 2, 8, 4, 12], weights := [0, 1, 0, 1] }

def points111 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 10, original row 1489, representative 7093.
def source112 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨89, by decide +kernel⟩

def target112 : Weights.Entry :=
  { word := [0, 10, 10, 10, 8, 4, 10], weights := [0, 1, 1, 0] }

def points112 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 10, original row 1490, representative 7115.
def source113 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨111, by decide +kernel⟩

def target113 : Weights.Entry :=
  { word := [0, 10, 10, 10, 8, 4, 12], weights := [0, 1, 0, 1] }

def points113 : List (ℕ × ℕ) := [(0, 9), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 10, original row 2392, representative 7129.
def source114 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨125, by decide +kernel⟩

def target114 : Weights.Entry :=
  { word := [2, 0, 0, 9, 12, 4, 12], weights := [1, 0, 1, 1] }

def points114 : List (ℕ × ℕ) := [(0, 9), (1, 0), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 10, original row 2400, representative 7083.
def source115 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨79, by decide +kernel⟩

def target115 : Weights.Entry :=
  { word := [2, 0, 0, 12, 0, 4, 10], weights := [1, 0, 1, 0] }

def points115 : List (ℕ × ℕ) := [(0, 9), (1, 0), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 10, original row 2401, representative 7083.
def source116 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨79, by decide +kernel⟩

def target116 : Weights.Entry :=
  { word := [2, 0, 0, 12, 0, 4, 12], weights := [1, 0, 1, 0] }

def points116 : List (ℕ × ℕ) := [(0, 9), (1, 0), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6), (7, 8), (8, 7)]

-- Period 10, original row 3402, representative 7129.
def source117 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨125, by decide +kernel⟩

def target117 : Weights.Entry :=
  { word := [4, 0, 0, 9, 12, 4, 12], weights := [1, 0, 1, 1] }

def points117 : List (ℕ × ℕ) := [(0, 9), (1, 0), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 10, original row 3410, representative 7083.
def source118 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨79, by decide +kernel⟩

def target118 : Weights.Entry :=
  { word := [4, 0, 0, 12, 0, 4, 10], weights := [1, 0, 1, 0] }

def points118 : List (ℕ × ℕ) := [(0, 9), (1, 0), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 10, original row 3411, representative 7083.
def source119 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨79, by decide +kernel⟩

def target119 : Weights.Entry :=
  { word := [4, 0, 0, 12, 0, 4, 12], weights := [1, 0, 1, 0] }

def points119 : List (ℕ × ℕ) := [(0, 9), (1, 0), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 8), (8, 7)]

-- Period 10, original row 3493, representative 7128.
def source120 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨124, by decide +kernel⟩

def target120 : Weights.Entry :=
  { word := [4, 0, 8, 9, 12, 4, 12], weights := [1, 0, 1, 1] }

def points120 : List (ℕ × ℕ) := [(0, 9), (1, 0), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 10, original row 7598, representative 7083.
def source121 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨79, by decide +kernel⟩

def target121 : Weights.Entry :=
  { word := [10, 2, 0, 9, 0, 4, 0], weights := [0, 1, 1, 0] }

def points121 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 5), (4, 6), (5, 4), (6, 3), (7, 1), (8, 2)]

-- Period 10, original row 7601, representative 7082.
def source122 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨78, by decide +kernel⟩

def target122 : Weights.Entry :=
  { word := [10, 2, 0, 9, 0, 12, 0], weights := [0, 1, 1, 0] }

def points122 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 5), (4, 6), (5, 4), (6, 3), (7, 1), (8, 2)]

-- Period 10, original row 7614, representative 7083.
def source123 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨79, by decide +kernel⟩

def target123 : Weights.Entry :=
  { word := [10, 2, 0, 10, 0, 0, 1], weights := [0, 1, 0, 1] }

def points123 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2)]

-- Period 10, original row 7615, representative 7083.
def source124 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨79, by decide +kernel⟩

def target124 : Weights.Entry :=
  { word := [10, 2, 0, 10, 0, 0, 2], weights := [0, 1, 0, 1] }

def points124 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 9), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2)]

-- Period 10, original row 7616, representative 7083.
def source125 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨79, by decide +kernel⟩

def target125 : Weights.Entry :=
  { word := [10, 2, 0, 10, 0, 0, 4], weights := [0, 1, 0, 1] }

def points125 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 9), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2)]

-- Period 10, original row 7622, representative 7082.
def source126 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨78, by decide +kernel⟩

def target126 : Weights.Entry :=
  { word := [10, 2, 0, 10, 0, 8, 1], weights := [0, 1, 0, 1] }

def points126 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2)]

-- Period 10, original row 7639, representative 7071.
def source127 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨67, by decide +kernel⟩

def target127 : Weights.Entry :=
  { word := [10, 2, 2, 8, 0, 4, 0], weights := [1, 0, 1, 0] }

def points127 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

def period9Entries : List Weights.Entry := [target0, target1, target2, target3, target4, target5, target6, target7, target8, target9, target10, target11, target12, target13, target14, target15, target16, target17, target18, target19, target20, target21, target22, target23, target24, target25, target26, target27, target28, target29, target30, target31, target32, target33, target34, target35, target36, target37, target38, target39, target40, target41, target42, target43, target44, target45, target46, target47, target48, target49, target50, target51, target52, target53, target54, target55, target56, target57, target58, target59]

def period9Chunk : RowCoverage.Chunk where
  rows := [⟨8115, target0⟩, ⟨8580, target1⟩, ⟨8581, target2⟩, ⟨8583, target3⟩, ⟨8584, target4⟩, ⟨8585, target5⟩, ⟨8586, target6⟩, ⟨8587, target7⟩, ⟨8588, target8⟩, ⟨8589, target9⟩, ⟨8591, target10⟩, ⟨8592, target11⟩, ⟨8593, target12⟩, ⟨8594, target13⟩, ⟨8595, target14⟩, ⟨8596, target15⟩, ⟨8600, target16⟩, ⟨8604, target17⟩, ⟨8605, target18⟩, ⟨8607, target19⟩, ⟨8609, target20⟩, ⟨8611, target21⟩, ⟨8615, target22⟩, ⟨8617, target23⟩, ⟨8619, target24⟩, ⟨8626, target25⟩, ⟨8627, target26⟩, ⟨8628, target27⟩, ⟨8630, target28⟩, ⟨8639, target29⟩, ⟨8643, target30⟩, ⟨8644, target31⟩, ⟨8645, target32⟩, ⟨8646, target33⟩, ⟨8648, target34⟩, ⟨8651, target35⟩, ⟨8657, target36⟩, ⟨8659, target37⟩, ⟨8660, target38⟩, ⟨8661, target39⟩, ⟨8663, target40⟩, ⟨8670, target41⟩, ⟨8673, target42⟩, ⟨8674, target43⟩, ⟨8675, target44⟩, ⟨8679, target45⟩, ⟨8681, target46⟩, ⟨8682, target47⟩, ⟨8683, target48⟩, ⟨8684, target49⟩, ⟨8685, target50⟩, ⟨8686, target51⟩, ⟨8687, target52⟩, ⟨8688, target53⟩, ⟨8698, target54⟩, ⟨8699, target55⟩, ⟨8711, target56⟩, ⟨9063, target57⟩, ⟨9064, target58⟩, ⟨9076, target59⟩]
  indexMask := 140734203838039757238980594237706673614282083469663197763332128278335734577113212560758336555464977403470393544982311895024237492428207763614750918994367187167268565720992727600858796635789221959290674113112539100361595006618013817928889137333900825887160066364358291850627497886353588668357026830427668479887777826448441044515976623758248021847294982904315685186834223326179886711887898141179855184831621332614083688338941273535609338600196509378722008535289466612424744046887939922625876380626650111344180589797056088069269027872599648342573814395860737884332178575788857753982874915837878280506988709546229214319589262713745167462372101158275948207954167740567952981955275114349352198828332178875036355287572103705687991374829963558880974065966033562327173007973171089422430672909632118707400948932441564258112243210627968087470257663403972714381659930634595677753796110576151347391411038031279423363626093569558691851152685670938117705057305085967539530972297244229853903502005465320993671348721070840857668676720371629149593514649613832561429147340725348248071221597695084048510116107765673710222169407928110874649075162512040951956436542279664030500865455966773695127225300790344071772435589622664177179282911187691022260192480166282956986625526693630214853946610800909142628839605063748624169154239538183786705555906124511224389846845877480489744872802374196265923927126717925210008850464863860958825956806974293381789476755344696058816319870014281331110902940947564163818634676985860180630277235774566671397707824779630685731640929411721098751188956389760752945703108559365499221767331670628254812950930801075462235653254479253557932525655483620189602582993805760837428736582421233411103350106075108882606899748858643444294777118567595731386333554320093567334079508506368699115855062830615866743086420656481382459497829503736170381805850107725768830112190435367892172527527017397973246604234181944626118252989650483634000875601168347661091024729632923593586141739629793037947736620468722859065832056989955334240158963307010692568613803881289714807838404784159525092476743726051045106375400604470049558973801703435650940846669742818482007166133505647972070835241045430252333090261240046682131731766791541506632685776228395946159348117971676311896720798907803318810924503321984446670804046711989183464741048419878202623139568478908214746274715077548306151947587607939444747303186150043406002384360989849675960208354727975258550591532965321051331070484107397971737357707374373710778411492114726958481385824660453560213894726524577942090280128840695114342272780875524621186028454860636589877666670256684265675081029299505281220273496031927524938832880920601859109260355441880530299445803759663495079366369809887270761412650074112
  count := 60

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

def period10Entries : List Weights.Entry := [target60, target61, target62, target63, target64, target65, target66, target67, target68, target69, target70, target71, target72, target73, target74, target75, target76, target77, target78, target79, target80, target81, target82, target83, target84, target85, target86, target87, target88, target89, target90, target91, target92, target93, target94, target95, target96, target97, target98, target99, target100, target101, target102, target103, target104, target105, target106, target107, target108, target109, target110, target111, target112, target113, target114, target115, target116, target117, target118, target119, target120, target121, target122, target123, target124, target125, target126, target127]

def period10Chunk : RowCoverage.Chunk where
  rows := [⟨131, target60⟩, ⟨139, target61⟩, ⟨140, target62⟩, ⟨222, target63⟩, ⟨298, target64⟩, ⟨299, target65⟩, ⟨304, target66⟩, ⟨307, target67⟩, ⟨311, target68⟩, ⟨315, target69⟩, ⟨346, target70⟩, ⟨347, target71⟩, ⟨395, target72⟩, ⟨396, target73⟩, ⟨412, target74⟩, ⟨417, target75⟩, ⟨444, target76⟩, ⟨445, target77⟩, ⟨490, target78⟩, ⟨491, target79⟩, ⟨741, target80⟩, ⟨742, target81⟩, ⟨755, target82⟩, ⟨771, target83⟩, ⟨772, target84⟩, ⟨782, target85⟩, ⟨1171, target86⟩, ⟨1172, target87⟩, ⟨1191, target88⟩, ⟨1195, target89⟩, ⟨1205, target90⟩, ⟨1206, target91⟩, ⟨1230, target92⟩, ⟨1231, target93⟩, ⟨1302, target94⟩, ⟨1306, target95⟩, ⟨1347, target96⟩, ⟨1348, target97⟩, ⟨1353, target98⟩, ⟨1356, target99⟩, ⟨1360, target100⟩, ⟨1364, target101⟩, ⟨1369, target102⟩, ⟨1370, target103⟩, ⟨1389, target104⟩, ⟨1390, target105⟩, ⟨1421, target106⟩, ⟨1422, target107⟩, ⟨1444, target108⟩, ⟨1449, target109⟩, ⟨1464, target110⟩, ⟨1465, target111⟩, ⟨1489, target112⟩, ⟨1490, target113⟩, ⟨2392, target114⟩, ⟨2400, target115⟩, ⟨2401, target116⟩, ⟨3402, target117⟩, ⟨3410, target118⟩, ⟨3411, target119⟩, ⟨3493, target120⟩, ⟨7598, target121⟩, ⟨7601, target122⟩, ⟨7614, target123⟩, ⟨7615, target124⟩, ⟨7616, target125⟩, ⟨7622, target126⟩, ⟨7639, target127⟩]
  indexMask := 36994765700748169949645458744724393490633402350918327547636968227336553340160412860125454232712452155186981209497677202328922443216079981903519814840312238524744881094821774135075503780083579148099178492314073008210050926530841838552998244995531136929776807919607868993193130884631667446510870030977118488603728981090230403301518093239395236212519013740290341667477716621319642513514774358198222060425067156887605748146791992967653179376184623129171906843271496973820641199507258481885662514695366147991949726994718060594247547334654671365534446064162545586928141719085665163396190593306972835294906444765360782479938107710828489200532274359078684385093456225813030770666347020042133201420836538563944989083184899930014121989299541296025892428523463282782611765097835747865493314419376024651052649523718355872487807160469375245138027085064628557429500186558404183223417771423833434254879751364119228738163989335468423015228138480650652920694565891378421520713297197285310710937362961055646636423661613642100135568663784970190771614097754373367575575483462427102829472280867856674036913819893407048674280059044325575338470888657802970080029037698860093924686809983464633692992175428021437119008673445998761464188726587406210396553589218732752488619597888612039106933749771519503818845787964006668216529745583282820255546562037005064600263508165469472960992231057567278201215043880960242161851737477174451963714065002671219471825686283941582206702812753136869291396280685169401450492912477601390593227352346260893423065622067991365623964305705102650136249311594994809188021249576797075812328097579143017034296220287527972408337666035926220804383773118056794450963056900365583379016340179400290452173711729406923292924144133880021777820756039966132183555133501434899380289855958325050369155880762755173529800496990549198282084145297925082412147867377581202674402609507295887086048779020046540899529718771177427302935385589650597096590832727692653248660568398160645911655353217225715266316200226609392451552709218245169946935420930574566656499878070839905614958509825310090230656591784503987031494295139863762465556089048178190881378938038806569528663999921011883767026231573868816741372412307661207313260644261403120559767700358959025863300369506296167329602652899165803462233827062390836740852727939072
  count := 68

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem period10Chunk_entries :
    period10Chunk.rows.map RowCoverage.TaggedRow.entry = period10Entries := rfl

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem period10_index_check :
    RowCoverage.indexCheck CanonicalWords.count period10Chunk = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem period10_words_check :
    RowCoverage.wordsCheck CanonicalWords.wordAt period10Chunk = true := by
  decide +kernel

end FranklSmallCyclic.TransportBatches.G055.B002.Data
