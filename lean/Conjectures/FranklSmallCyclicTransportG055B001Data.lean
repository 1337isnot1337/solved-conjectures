module

public import Conjectures.FranklSmallCyclicRowCoverage
public import Conjectures.FranklSmallCyclicCanonicalWords
public import Conjectures.FranklSmallCyclicOrbit9Block002Data

/-! 128 literal targets sharing one source proof block.
Original words and row indices are retained; weights may be transported.
-/
@[expose] public section

namespace FranklSmallCyclic.TransportBatches.G055.B001.Data

-- Period 9, original row 5953, representative 7050.
def source0 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨46, by decide +kernel⟩

def target0 : Weights.Entry :=
  { word := [8, 9, 0, 12, 8, 4, 12], weights := [1, 0, 1, 0] }

-- Period 9, original row 6024, representative 7057.
def source1 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨53, by decide +kernel⟩

def target1 : Weights.Entry :=
  { word := [8, 9, 8, 9, 4, 4, 12], weights := [1, 1, 1, 1] }

-- Period 9, original row 6028, representative 7053.
def source2 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨49, by decide +kernel⟩

def target2 : Weights.Entry :=
  { word := [8, 9, 8, 9, 12, 4, 12], weights := [1, 1, 1, 1] }

-- Period 9, original row 6085, representative 7076.
def source3 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨72, by decide +kernel⟩

def target3 : Weights.Entry :=
  { word := [8, 10, 0, 8, 1, 4, 10], weights := [0, 2, 1, 1] }

-- Period 9, original row 6086, representative 7076.
def source4 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨72, by decide +kernel⟩

def target4 : Weights.Entry :=
  { word := [8, 10, 0, 8, 1, 4, 12], weights := [0, 2, 1, 1] }

def points4 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 8), (8, 7)]

-- Period 9, original row 6091, representative 7072.
def source5 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨68, by decide +kernel⟩

def target5 : Weights.Entry :=
  { word := [8, 10, 0, 8, 9, 4, 12], weights := [0, 2, 1, 1] }

-- Period 9, original row 6105, representative 7109.
def source6 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨105, by decide +kernel⟩

def target6 : Weights.Entry :=
  { word := [8, 10, 0, 9, 8, 4, 12], weights := [0, 3, 1, 0] }

-- Period 9, original row 6132, representative 7108.
def source7 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨104, by decide +kernel⟩

def target7 : Weights.Entry :=
  { word := [8, 10, 0, 10, 8, 4, 12], weights := [0, 2, 0, 1] }

-- Period 9, original row 6190, representative 7085.
def source8 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨81, by decide +kernel⟩

def target8 : Weights.Entry :=
  { word := [8, 10, 2, 10, 8, 4, 10], weights := [1, 1, 1, 1] }

-- Period 9, original row 6191, representative 7103.
def source9 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨99, by decide +kernel⟩

def target9 : Weights.Entry :=
  { word := [8, 10, 2, 10, 8, 4, 12], weights := [1, 1, 1, 1] }

-- Period 9, original row 6271, representative 7107.
def source10 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨103, by decide +kernel⟩

def target10 : Weights.Entry :=
  { word := [8, 10, 8, 10, 8, 4, 12], weights := [0, 2, 0, 1] }

-- Period 9, original row 6312, representative 7084.
def source11 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨80, by decide +kernel⟩

def target11 : Weights.Entry :=
  { word := [8, 10, 10, 10, 8, 4, 10], weights := [1, 1, 1, 1] }

-- Period 9, original row 6313, representative 7102.
def source12 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨98, by decide +kernel⟩

def target12 : Weights.Entry :=
  { word := [8, 10, 10, 10, 8, 4, 12], weights := [1, 1, 1, 1] }

-- Period 9, original row 7527, representative 7013.
def source13 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨9, by decide +kernel⟩

def target13 : Weights.Entry :=
  { word := [10, 0, 9, 8, 1, 4, 10], weights := [1, 0, 1, 1] }

-- Period 9, original row 7528, representative 7013.
def source14 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨9, by decide +kernel⟩

def target14 : Weights.Entry :=
  { word := [10, 0, 9, 8, 1, 4, 12], weights := [1, 0, 1, 1] }

def points14 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 8), (8, 7)]

-- Period 9, original row 7535, representative 7008.
def source15 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨4, by decide +kernel⟩

def target15 : Weights.Entry :=
  { word := [10, 0, 9, 8, 9, 4, 12], weights := [1, 0, 1, 1] }

-- Period 9, original row 7569, representative 7004.
def source16 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨0, by decide +kernel⟩

def target16 : Weights.Entry :=
  { word := [10, 0, 12, 10, 0, 4, 10], weights := [1, 0, 1, 1] }

-- Period 9, original row 7570, representative 7004.
def source17 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨0, by decide +kernel⟩

def target17 : Weights.Entry :=
  { word := [10, 0, 12, 10, 0, 4, 12], weights := [1, 0, 1, 1] }

def points17 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 8), (8, 7)]

-- Period 9, original row 7598, representative 7083.
def source18 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨79, by decide +kernel⟩

def target18 : Weights.Entry :=
  { word := [10, 2, 0, 9, 0, 4, 0], weights := [0, 1, 1, 0] }

def points18 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 5), (4, 6), (5, 4), (6, 3), (7, 1), (8, 2)]

-- Period 9, original row 7599, representative 7077.
def source19 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨73, by decide +kernel⟩

def target19 : Weights.Entry :=
  { word := [10, 2, 0, 9, 0, 4, 8], weights := [1, 1, 2, 0] }

def points19 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2)]

-- Period 9, original row 7601, representative 7082.
def source20 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨78, by decide +kernel⟩

def target20 : Weights.Entry :=
  { word := [10, 2, 0, 9, 0, 12, 0], weights := [0, 1, 1, 0] }

def points20 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 5), (4, 6), (5, 4), (6, 3), (7, 1), (8, 2)]

-- Period 9, original row 7602, representative 7076.
def source21 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨72, by decide +kernel⟩

def target21 : Weights.Entry :=
  { word := [10, 2, 0, 9, 0, 12, 8], weights := [1, 1, 2, 0] }

def points21 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2)]

-- Period 9, original row 7603, representative 7045.
def source22 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨41, by decide +kernel⟩

def target22 : Weights.Entry :=
  { word := [10, 2, 0, 9, 8, 1, 4], weights := [1, 1, 0, 1] }

def points22 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2)]

-- Period 9, original row 7604, representative 7013.
def source23 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨9, by decide +kernel⟩

def target23 : Weights.Entry :=
  { word := [10, 2, 0, 9, 8, 1, 12], weights := [1, 1, 0, 1] }

def points23 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2)]

-- Period 9, original row 7605, representative 7044.
def source24 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨40, by decide +kernel⟩

def target24 : Weights.Entry :=
  { word := [10, 2, 0, 9, 8, 2, 2], weights := [1, 1, 0, 1] }

def points24 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2)]

-- Period 9, original row 7606, representative 7012.
def source25 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨8, by decide +kernel⟩

def target25 : Weights.Entry :=
  { word := [10, 2, 0, 9, 8, 2, 10], weights := [1, 1, 0, 1] }

-- Period 9, original row 7607, representative 7046.
def source26 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨42, by decide +kernel⟩

def target26 : Weights.Entry :=
  { word := [10, 2, 0, 9, 8, 8, 4], weights := [1, 1, 0, 1] }

def points26 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2)]

-- Period 9, original row 7609, representative 7014.
def source27 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨10, by decide +kernel⟩

def target27 : Weights.Entry :=
  { word := [10, 2, 0, 9, 8, 8, 12], weights := [1, 1, 0, 1] }

-- Period 9, original row 7610, representative 7043.
def source28 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨39, by decide +kernel⟩

def target28 : Weights.Entry :=
  { word := [10, 2, 0, 9, 8, 9, 4], weights := [1, 1, 0, 1] }

def points28 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2)]

-- Period 9, original row 7611, representative 7011.
def source29 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨7, by decide +kernel⟩

def target29 : Weights.Entry :=
  { word := [10, 2, 0, 9, 8, 9, 12], weights := [1, 1, 0, 1] }

-- Period 9, original row 7612, representative 7042.
def source30 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨38, by decide +kernel⟩

def target30 : Weights.Entry :=
  { word := [10, 2, 0, 9, 8, 10, 2], weights := [1, 1, 0, 1] }

def points30 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2)]

-- Period 9, original row 7613, representative 7010.
def source31 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨6, by decide +kernel⟩

def target31 : Weights.Entry :=
  { word := [10, 2, 0, 9, 8, 10, 10], weights := [1, 1, 0, 1] }

-- Period 9, original row 7614, representative 7083.
def source32 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨79, by decide +kernel⟩

def target32 : Weights.Entry :=
  { word := [10, 2, 0, 10, 0, 0, 1], weights := [0, 1, 0, 1] }

def points32 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2)]

-- Period 9, original row 7618, representative 7052.
def source33 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨48, by decide +kernel⟩

def target33 : Weights.Entry :=
  { word := [10, 2, 0, 10, 0, 0, 9], weights := [0, 1, 0, 1] }

def points33 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2)]

-- Period 9, original row 7622, representative 7082.
def source34 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨78, by decide +kernel⟩

def target34 : Weights.Entry :=
  { word := [10, 2, 0, 10, 0, 8, 1], weights := [0, 1, 0, 1] }

def points34 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2)]

-- Period 9, original row 7623, representative 7027.
def source35 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨23, by decide +kernel⟩

def target35 : Weights.Entry :=
  { word := [10, 2, 0, 10, 0, 8, 4], weights := [0, 1, 0, 1] }

def points35 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2)]

-- Period 9, original row 7625, representative 7051.
def source36 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨47, by decide +kernel⟩

def target36 : Weights.Entry :=
  { word := [10, 2, 0, 10, 0, 8, 9], weights := [0, 1, 0, 1] }

def points36 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2)]

-- Period 9, original row 7627, representative 7028.
def source37 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨24, by decide +kernel⟩

def target37 : Weights.Entry :=
  { word := [10, 2, 0, 10, 8, 0, 4], weights := [0, 1, 0, 1] }

def points37 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2)]

-- Period 9, original row 7629, representative 7026.
def source38 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨22, by decide +kernel⟩

def target38 : Weights.Entry :=
  { word := [10, 2, 0, 10, 8, 8, 4], weights := [0, 1, 0, 1] }

def points38 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2)]

-- Period 9, original row 7633, representative 7036.
def source39 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨32, by decide +kernel⟩

def target39 : Weights.Entry :=
  { word := [10, 2, 0, 12, 10, 0, 4], weights := [1, 1, 0, 1] }

def points39 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2)]

-- Period 9, original row 7635, representative 7063.
def source40 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨59, by decide +kernel⟩

def target40 : Weights.Entry :=
  { word := [10, 2, 0, 12, 10, 0, 9], weights := [1, 1, 0, 1] }

def points40 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2)]

-- Period 9, original row 7637, representative 7004.
def source41 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨0, by decide +kernel⟩

def target41 : Weights.Entry :=
  { word := [10, 2, 0, 12, 10, 0, 12], weights := [1, 1, 0, 1] }

def points41 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2)]

-- Period 9, original row 7639, representative 7071.
def source42 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨67, by decide +kernel⟩

def target42 : Weights.Entry :=
  { word := [10, 2, 2, 8, 0, 4, 0], weights := [1, 0, 1, 0] }

def points42 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 7641, representative 7069.
def source43 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨65, by decide +kernel⟩

def target43 : Weights.Entry :=
  { word := [10, 2, 2, 8, 0, 12, 0], weights := [1, 0, 1, 0] }

def points43 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 7646, representative 7060.
def source44 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨56, by decide +kernel⟩

def target44 : Weights.Entry :=
  { word := [10, 2, 2, 8, 1, 0, 9], weights := [1, 1, 0, 1] }

def points44 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 7649, representative 7131.
def source45 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨127, by decide +kernel⟩

def target45 : Weights.Entry :=
  { word := [10, 2, 2, 8, 1, 8, 1], weights := [1, 1, 1, 1] }

def points45 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 7651, representative 7058.
def source46 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨54, by decide +kernel⟩

def target46 : Weights.Entry :=
  { word := [10, 2, 2, 8, 1, 8, 9], weights := [1, 1, 1, 1] }

def points46 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 7653, representative 7070.
def source47 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨66, by decide +kernel⟩

def target47 : Weights.Entry :=
  { word := [10, 2, 2, 8, 8, 4, 0], weights := [1, 0, 1, 0] }

def points47 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 7655, representative 7068.
def source48 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨64, by decide +kernel⟩

def target48 : Weights.Entry :=
  { word := [10, 2, 2, 8, 8, 12, 0], weights := [1, 0, 1, 0] }

def points48 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 7658, representative 7030.
def source49 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨26, by decide +kernel⟩

def target49 : Weights.Entry :=
  { word := [10, 2, 2, 8, 9, 0, 4], weights := [1, 1, 0, 1] }

def points49 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 7660, representative 7059.
def source50 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨55, by decide +kernel⟩

def target50 : Weights.Entry :=
  { word := [10, 2, 2, 8, 9, 0, 9], weights := [1, 1, 0, 1] }

def points50 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 7663, representative 7130.
def source51 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨126, by decide +kernel⟩

def target51 : Weights.Entry :=
  { word := [10, 2, 2, 8, 9, 8, 1], weights := [1, 1, 1, 1] }

def points51 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 7665, representative 7057.
def source52 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨53, by decide +kernel⟩

def target52 : Weights.Entry :=
  { word := [10, 2, 2, 8, 9, 8, 9], weights := [1, 1, 1, 1] }

def points52 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 7673, representative 7080.
def source53 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨76, by decide +kernel⟩

def target53 : Weights.Entry :=
  { word := [10, 2, 8, 2, 0, 8, 1], weights := [1, 0, 0, 1] }

def points53 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 7674, representative 7020.
def source54 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨16, by decide +kernel⟩

def target54 : Weights.Entry :=
  { word := [10, 2, 8, 2, 0, 8, 2], weights := [1, 0, 0, 1] }

def points54 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 7675, representative 7020.
def source55 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨16, by decide +kernel⟩

def target55 : Weights.Entry :=
  { word := [10, 2, 8, 2, 0, 8, 4], weights := [1, 0, 0, 1] }

def points55 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 7677, representative 7049.
def source56 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨45, by decide +kernel⟩

def target56 : Weights.Entry :=
  { word := [10, 2, 8, 2, 0, 8, 9], weights := [1, 0, 0, 1] }

def points56 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 7684, representative 7024.
def source57 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨20, by decide +kernel⟩

def target57 : Weights.Entry :=
  { word := [10, 2, 8, 2, 8, 0, 4], weights := [1, 0, 0, 1] }

def points57 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 7688, representative 7021.
def source58 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨17, by decide +kernel⟩

def target58 : Weights.Entry :=
  { word := [10, 2, 8, 2, 8, 8, 4], weights := [1, 0, 0, 1] }

def points58 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 7692, representative 7117.
def source59 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨113, by decide +kernel⟩

def target59 : Weights.Entry :=
  { word := [10, 2, 8, 4, 4, 4, 0], weights := [1, 0, 1, 0] }

def points59 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 7693, representative 7113.
def source60 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨109, by decide +kernel⟩

def target60 : Weights.Entry :=
  { word := [10, 2, 8, 4, 4, 12, 0], weights := [1, 0, 1, 0] }

def points60 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 7694, representative 7118.
def source61 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨114, by decide +kernel⟩

def target61 : Weights.Entry :=
  { word := [10, 2, 8, 4, 12, 4, 0], weights := [1, 0, 1, 0] }

def points61 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 7695, representative 7114.
def source62 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨110, by decide +kernel⟩

def target62 : Weights.Entry :=
  { word := [10, 2, 8, 4, 12, 12, 0], weights := [1, 0, 1, 0] }

def points62 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 7696, representative 7125.
def source63 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨121, by decide +kernel⟩

def target63 : Weights.Entry :=
  { word := [10, 2, 8, 8, 0, 4, 0], weights := [1, 0, 1, 0] }

def points63 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 7698, representative 7124.
def source64 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨120, by decide +kernel⟩

def target64 : Weights.Entry :=
  { word := [10, 2, 8, 8, 0, 12, 0], weights := [1, 0, 1, 0] }

def points64 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 7699, representative 7112.
def source65 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨108, by decide +kernel⟩

def target65 : Weights.Entry :=
  { word := [10, 2, 8, 8, 1, 4, 8], weights := [0, 1, 3, 0] }

def points65 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 7700, representative 7109.
def source66 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨105, by decide +kernel⟩

def target66 : Weights.Entry :=
  { word := [10, 2, 8, 8, 1, 12, 8], weights := [0, 1, 3, 0] }

def points66 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 7701, representative 7075.
def source67 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨71, by decide +kernel⟩

def target67 : Weights.Entry :=
  { word := [10, 2, 8, 9, 0, 4, 0], weights := [0, 1, 1, 0] }

def points67 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 7702, representative 7073.
def source68 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨69, by decide +kernel⟩

def target68 : Weights.Entry :=
  { word := [10, 2, 8, 9, 0, 4, 8], weights := [1, 1, 2, 0] }

def points68 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 7704, representative 7074.
def source69 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨70, by decide +kernel⟩

def target69 : Weights.Entry :=
  { word := [10, 2, 8, 9, 0, 12, 0], weights := [0, 1, 1, 0] }

def points69 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 7705, representative 7072.
def source70 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨68, by decide +kernel⟩

def target70 : Weights.Entry :=
  { word := [10, 2, 8, 9, 0, 12, 8], weights := [1, 1, 2, 0] }

def points70 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 7706, representative 7040.
def source71 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨36, by decide +kernel⟩

def target71 : Weights.Entry :=
  { word := [10, 2, 8, 9, 8, 1, 4], weights := [1, 1, 0, 1] }

def points71 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 7707, representative 7008.
def source72 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨4, by decide +kernel⟩

def target72 : Weights.Entry :=
  { word := [10, 2, 8, 9, 8, 1, 12], weights := [1, 1, 0, 1] }

def points72 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 7708, representative 7039.
def source73 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨35, by decide +kernel⟩

def target73 : Weights.Entry :=
  { word := [10, 2, 8, 9, 8, 2, 2], weights := [1, 1, 0, 1] }

def points73 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 7709, representative 7007.
def source74 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨3, by decide +kernel⟩

def target74 : Weights.Entry :=
  { word := [10, 2, 8, 9, 8, 2, 10], weights := [1, 1, 0, 1] }

-- Period 9, original row 7710, representative 7041.
def source75 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨37, by decide +kernel⟩

def target75 : Weights.Entry :=
  { word := [10, 2, 8, 9, 8, 8, 4], weights := [1, 1, 0, 1] }

def points75 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 7712, representative 7009.
def source76 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨5, by decide +kernel⟩

def target76 : Weights.Entry :=
  { word := [10, 2, 8, 9, 8, 8, 12], weights := [1, 1, 0, 1] }

-- Period 9, original row 7713, representative 7038.
def source77 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨34, by decide +kernel⟩

def target77 : Weights.Entry :=
  { word := [10, 2, 8, 9, 8, 9, 4], weights := [1, 1, 0, 1] }

def points77 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 7714, representative 7006.
def source78 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨2, by decide +kernel⟩

def target78 : Weights.Entry :=
  { word := [10, 2, 8, 9, 8, 9, 12], weights := [1, 1, 0, 1] }

-- Period 9, original row 7715, representative 7037.
def source79 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨33, by decide +kernel⟩

def target79 : Weights.Entry :=
  { word := [10, 2, 8, 9, 8, 10, 2], weights := [1, 1, 0, 1] }

def points79 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 7716, representative 7005.
def source80 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨1, by decide +kernel⟩

def target80 : Weights.Entry :=
  { word := [10, 2, 8, 9, 8, 10, 10], weights := [1, 1, 0, 1] }

-- Period 9, original row 7721, representative 7122.
def source81 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨118, by decide +kernel⟩

def target81 : Weights.Entry :=
  { word := [10, 2, 8, 10, 0, 6, 0], weights := [1, 0, 1, 0] }

def points81 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 7723, representative 7081.
def source82 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨77, by decide +kernel⟩

def target82 : Weights.Entry :=
  { word := [10, 2, 8, 10, 0, 8, 1], weights := [0, 1, 0, 1] }

def points82 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 7724, representative 7023.
def source83 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨19, by decide +kernel⟩

def target83 : Weights.Entry :=
  { word := [10, 2, 8, 10, 0, 8, 2], weights := [0, 1, 0, 1] }

def points83 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 7725, representative 7023.
def source84 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨19, by decide +kernel⟩

def target84 : Weights.Entry :=
  { word := [10, 2, 8, 10, 0, 8, 4], weights := [0, 1, 0, 1] }

def points84 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 7727, representative 7050.
def source85 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨46, by decide +kernel⟩

def target85 : Weights.Entry :=
  { word := [10, 2, 8, 10, 0, 8, 9], weights := [0, 1, 0, 1] }

def points85 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 7734, representative 7123.
def source86 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨119, by decide +kernel⟩

def target86 : Weights.Entry :=
  { word := [10, 2, 8, 10, 0, 12, 0], weights := [1, 0, 1, 0] }

def points86 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 7735, representative 7025.
def source87 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨21, by decide +kernel⟩

def target87 : Weights.Entry :=
  { word := [10, 2, 8, 10, 8, 0, 4], weights := [0, 1, 0, 1] }

def points87 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 7739, representative 7121.
def source88 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨117, by decide +kernel⟩

def target88 : Weights.Entry :=
  { word := [10, 2, 8, 10, 8, 6, 0], weights := [1, 0, 1, 0] }

def points88 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 7740, representative 7106.
def source89 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨102, by decide +kernel⟩

def target89 : Weights.Entry :=
  { word := [10, 2, 8, 10, 8, 6, 8], weights := [1, 1, 1, 1] }

def points89 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 7741, representative 7022.
def source90 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨18, by decide +kernel⟩

def target90 : Weights.Entry :=
  { word := [10, 2, 8, 10, 8, 8, 4], weights := [0, 1, 0, 1] }

def points90 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 7745, representative 7111.
def source91 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨107, by decide +kernel⟩

def target91 : Weights.Entry :=
  { word := [10, 2, 8, 12, 0, 4, 8], weights := [1, 0, 2, 0] }

def points91 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 7746, representative 7108.
def source92 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨104, by decide +kernel⟩

def target92 : Weights.Entry :=
  { word := [10, 2, 8, 12, 0, 12, 8], weights := [1, 0, 2, 0] }

def points92 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 7749, representative 7035.
def source93 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨31, by decide +kernel⟩

def target93 : Weights.Entry :=
  { word := [10, 2, 8, 12, 2, 0, 4], weights := [1, 1, 0, 1] }

def points93 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 7751, representative 7062.
def source94 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨58, by decide +kernel⟩

def target94 : Weights.Entry :=
  { word := [10, 2, 8, 12, 2, 0, 9], weights := [1, 1, 0, 1] }

def points94 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 7754, representative 7032.
def source95 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨28, by decide +kernel⟩

def target95 : Weights.Entry :=
  { word := [10, 2, 8, 12, 2, 8, 2], weights := [1, 1, 1, 1] }

def points95 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 7757, representative 7120.
def source96 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨116, by decide +kernel⟩

def target96 : Weights.Entry :=
  { word := [10, 2, 8, 12, 4, 4, 0], weights := [1, 0, 1, 0] }

def points96 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 7758, representative 7105.
def source97 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨101, by decide +kernel⟩

def target97 : Weights.Entry :=
  { word := [10, 2, 8, 12, 4, 4, 8], weights := [1, 1, 1, 1] }

def points97 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 7759, representative 7116.
def source98 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨112, by decide +kernel⟩

def target98 : Weights.Entry :=
  { word := [10, 2, 8, 12, 4, 12, 0], weights := [1, 0, 1, 0] }

def points98 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 7760, representative 7103.
def source99 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨99, by decide +kernel⟩

def target99 : Weights.Entry :=
  { word := [10, 2, 8, 12, 4, 12, 8], weights := [1, 1, 1, 1] }

def points99 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 7761, representative 7110.
def source100 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨106, by decide +kernel⟩

def target100 : Weights.Entry :=
  { word := [10, 2, 8, 12, 8, 4, 8], weights := [1, 0, 2, 0] }

def points100 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 7762, representative 7107.
def source101 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨103, by decide +kernel⟩

def target101 : Weights.Entry :=
  { word := [10, 2, 8, 12, 8, 12, 8], weights := [1, 0, 2, 0] }

def points101 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 7765, representative 7034.
def source102 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨30, by decide +kernel⟩

def target102 : Weights.Entry :=
  { word := [10, 2, 8, 12, 10, 0, 4], weights := [1, 1, 0, 1] }

def points102 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 7767, representative 7061.
def source103 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨57, by decide +kernel⟩

def target103 : Weights.Entry :=
  { word := [10, 2, 8, 12, 10, 0, 9], weights := [1, 1, 0, 1] }

def points103 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 7770, representative 7031.
def source104 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨27, by decide +kernel⟩

def target104 : Weights.Entry :=
  { word := [10, 2, 8, 12, 10, 8, 2], weights := [1, 1, 1, 1] }

def points104 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 7771, representative 7033.
def source105 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨29, by decide +kernel⟩

def target105 : Weights.Entry :=
  { word := [10, 2, 8, 12, 10, 8, 4], weights := [2, 1, 1, 2] }

def points105 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 7775, representative 7119.
def source106 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨115, by decide +kernel⟩

def target106 : Weights.Entry :=
  { word := [10, 2, 8, 12, 12, 4, 0], weights := [1, 0, 1, 0] }

def points106 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 7776, representative 7104.
def source107 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨100, by decide +kernel⟩

def target107 : Weights.Entry :=
  { word := [10, 2, 8, 12, 12, 4, 8], weights := [1, 1, 1, 1] }

def points107 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 7777, representative 7115.
def source108 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨111, by decide +kernel⟩

def target108 : Weights.Entry :=
  { word := [10, 2, 8, 12, 12, 12, 0], weights := [1, 0, 1, 0] }

def points108 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 7778, representative 7102.
def source109 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨98, by decide +kernel⟩

def target109 : Weights.Entry :=
  { word := [10, 2, 8, 12, 12, 12, 8], weights := [1, 1, 1, 1] }

def points109 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 7779, representative 7067.
def source110 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨63, by decide +kernel⟩

def target110 : Weights.Entry :=
  { word := [10, 2, 10, 8, 0, 4, 0], weights := [1, 0, 1, 0] }

def points110 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 7781, representative 7065.
def source111 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨61, by decide +kernel⟩

def target111 : Weights.Entry :=
  { word := [10, 2, 10, 8, 0, 12, 0], weights := [1, 0, 1, 0] }

def points111 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 7782, representative 7129.
def source112 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨125, by decide +kernel⟩

def target112 : Weights.Entry :=
  { word := [10, 2, 10, 8, 1, 0, 1], weights := [1, 1, 0, 1] }

def points112 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 7786, representative 7056.
def source113 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨52, by decide +kernel⟩

def target113 : Weights.Entry :=
  { word := [10, 2, 10, 8, 1, 0, 9], weights := [1, 1, 0, 1] }

def points113 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 7789, representative 7127.
def source114 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨123, by decide +kernel⟩

def target114 : Weights.Entry :=
  { word := [10, 2, 10, 8, 1, 8, 1], weights := [1, 1, 1, 1] }

def points114 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 7791, representative 7054.
def source115 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨50, by decide +kernel⟩

def target115 : Weights.Entry :=
  { word := [10, 2, 10, 8, 1, 8, 9], weights := [1, 1, 1, 1] }

def points115 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 7793, representative 7066.
def source116 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨62, by decide +kernel⟩

def target116 : Weights.Entry :=
  { word := [10, 2, 10, 8, 8, 4, 0], weights := [1, 0, 1, 0] }

def points116 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 7795, representative 7064.
def source117 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨60, by decide +kernel⟩

def target117 : Weights.Entry :=
  { word := [10, 2, 10, 8, 8, 12, 0], weights := [1, 0, 1, 0] }

def points117 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 7796, representative 7128.
def source118 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨124, by decide +kernel⟩

def target118 : Weights.Entry :=
  { word := [10, 2, 10, 8, 9, 0, 1], weights := [1, 1, 0, 1] }

def points118 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 7798, representative 7029.
def source119 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨25, by decide +kernel⟩

def target119 : Weights.Entry :=
  { word := [10, 2, 10, 8, 9, 0, 4], weights := [1, 1, 0, 1] }

def points119 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 7800, representative 7055.
def source120 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨51, by decide +kernel⟩

def target120 : Weights.Entry :=
  { word := [10, 2, 10, 8, 9, 0, 9], weights := [1, 1, 0, 1] }

def points120 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 7803, representative 7126.
def source121 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨122, by decide +kernel⟩

def target121 : Weights.Entry :=
  { word := [10, 2, 10, 8, 9, 8, 1], weights := [1, 1, 1, 1] }

def points121 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 7805, representative 7053.
def source122 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨49, by decide +kernel⟩

def target122 : Weights.Entry :=
  { word := [10, 2, 10, 8, 9, 8, 9], weights := [1, 1, 1, 1] }

def points122 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 8032, representative 7014.
def source123 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨10, by decide +kernel⟩

def target123 : Weights.Entry :=
  { word := [10, 8, 8, 8, 1, 4, 10], weights := [1, 0, 1, 1] }

def points123 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 8033, representative 7014.
def source124 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨10, by decide +kernel⟩

def target124 : Weights.Entry :=
  { word := [10, 8, 8, 8, 1, 4, 12], weights := [1, 0, 1, 1] }

def points124 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 8040, representative 7009.
def source125 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨5, by decide +kernel⟩

def target125 : Weights.Entry :=
  { word := [10, 8, 8, 8, 9, 4, 12], weights := [1, 0, 1, 1] }

def points125 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 8107, representative 7011.
def source126 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨7, by decide +kernel⟩

def target126 : Weights.Entry :=
  { word := [10, 8, 9, 8, 1, 4, 10], weights := [1, 0, 1, 1] }

def points126 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 8108, representative 7011.
def source127 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨7, by decide +kernel⟩

def target127 : Weights.Entry :=
  { word := [10, 8, 9, 8, 1, 4, 12], weights := [1, 0, 1, 1] }

def points127 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

def period9Entries : List Weights.Entry := [target0, target1, target2, target3, target4, target5, target6, target7, target8, target9, target10, target11, target12, target13, target14, target15, target16, target17, target18, target19, target20, target21, target22, target23, target24, target25, target26, target27, target28, target29, target30, target31, target32, target33, target34, target35, target36, target37, target38, target39, target40, target41, target42, target43, target44, target45, target46, target47, target48, target49, target50, target51, target52, target53, target54, target55, target56, target57, target58, target59, target60, target61, target62, target63, target64, target65, target66, target67, target68, target69, target70, target71, target72, target73, target74, target75, target76, target77, target78, target79, target80, target81, target82, target83, target84, target85, target86, target87, target88, target89, target90, target91, target92, target93, target94, target95, target96, target97, target98, target99, target100, target101, target102, target103, target104, target105, target106, target107, target108, target109, target110, target111, target112, target113, target114, target115, target116, target117, target118, target119, target120, target121, target122, target123, target124, target125, target126, target127]

def period9Chunk : RowCoverage.Chunk where
  rows := [⟨5953, target0⟩, ⟨6024, target1⟩, ⟨6028, target2⟩, ⟨6085, target3⟩, ⟨6086, target4⟩, ⟨6091, target5⟩, ⟨6105, target6⟩, ⟨6132, target7⟩, ⟨6190, target8⟩, ⟨6191, target9⟩, ⟨6271, target10⟩, ⟨6312, target11⟩, ⟨6313, target12⟩, ⟨7527, target13⟩, ⟨7528, target14⟩, ⟨7535, target15⟩, ⟨7569, target16⟩, ⟨7570, target17⟩, ⟨7598, target18⟩, ⟨7599, target19⟩, ⟨7601, target20⟩, ⟨7602, target21⟩, ⟨7603, target22⟩, ⟨7604, target23⟩, ⟨7605, target24⟩, ⟨7606, target25⟩, ⟨7607, target26⟩, ⟨7609, target27⟩, ⟨7610, target28⟩, ⟨7611, target29⟩, ⟨7612, target30⟩, ⟨7613, target31⟩, ⟨7614, target32⟩, ⟨7618, target33⟩, ⟨7622, target34⟩, ⟨7623, target35⟩, ⟨7625, target36⟩, ⟨7627, target37⟩, ⟨7629, target38⟩, ⟨7633, target39⟩, ⟨7635, target40⟩, ⟨7637, target41⟩, ⟨7639, target42⟩, ⟨7641, target43⟩, ⟨7646, target44⟩, ⟨7649, target45⟩, ⟨7651, target46⟩, ⟨7653, target47⟩, ⟨7655, target48⟩, ⟨7658, target49⟩, ⟨7660, target50⟩, ⟨7663, target51⟩, ⟨7665, target52⟩, ⟨7673, target53⟩, ⟨7674, target54⟩, ⟨7675, target55⟩, ⟨7677, target56⟩, ⟨7684, target57⟩, ⟨7688, target58⟩, ⟨7692, target59⟩, ⟨7693, target60⟩, ⟨7694, target61⟩, ⟨7695, target62⟩, ⟨7696, target63⟩, ⟨7698, target64⟩, ⟨7699, target65⟩, ⟨7700, target66⟩, ⟨7701, target67⟩, ⟨7702, target68⟩, ⟨7704, target69⟩, ⟨7705, target70⟩, ⟨7706, target71⟩, ⟨7707, target72⟩, ⟨7708, target73⟩, ⟨7709, target74⟩, ⟨7710, target75⟩, ⟨7712, target76⟩, ⟨7713, target77⟩, ⟨7714, target78⟩, ⟨7715, target79⟩, ⟨7716, target80⟩, ⟨7721, target81⟩, ⟨7723, target82⟩, ⟨7724, target83⟩, ⟨7725, target84⟩, ⟨7727, target85⟩, ⟨7734, target86⟩, ⟨7735, target87⟩, ⟨7739, target88⟩, ⟨7740, target89⟩, ⟨7741, target90⟩, ⟨7745, target91⟩, ⟨7746, target92⟩, ⟨7749, target93⟩, ⟨7751, target94⟩, ⟨7754, target95⟩, ⟨7757, target96⟩, ⟨7758, target97⟩, ⟨7759, target98⟩, ⟨7760, target99⟩, ⟨7761, target100⟩, ⟨7762, target101⟩, ⟨7765, target102⟩, ⟨7767, target103⟩, ⟨7770, target104⟩, ⟨7771, target105⟩, ⟨7775, target106⟩, ⟨7776, target107⟩, ⟨7777, target108⟩, ⟨7778, target109⟩, ⟨7779, target110⟩, ⟨7781, target111⟩, ⟨7782, target112⟩, ⟨7786, target113⟩, ⟨7789, target114⟩, ⟨7791, target115⟩, ⟨7793, target116⟩, ⟨7795, target117⟩, ⟨7796, target118⟩, ⟨7798, target119⟩, ⟨7800, target120⟩, ⟨7803, target121⟩, ⟨7805, target122⟩, ⟨8032, target123⟩, ⟨8033, target124⟩, ⟨8040, target125⟩, ⟨8107, target126⟩, ⟨8108, target127⟩]
  indexMask := 84585535402757003712162329970084704505135959435408751382191079152755609619866010689024067610494681560141404948952519959997068604435795785387009555149964599925973550826932999207078105673012391554708284699666151360831287232569632641045913677941182190832882277107902202816920778609633745552148721105648253712655088923223709177401575538846344021809979960433589848856969758722357828159527703186882853811823007035233098388769644630828827124283211810429054231400443837326926313719430025493435995902404377317904685507407766497327776901345934418075605787397241899776373841125334890730608156533302372567000124501852827930614352382578962105994364377338476357969753444015717282381284982351149406129259325364179062964465292171752968114090968816899933895953243375728090844095818934848841390240144325042986380154138603589560800633542538707133211185852867362237665414289336916349373476767900366880233488551071403772881169188538675631394300654124971319890240247381306158155164202975166164156007076714331025718315561270397526958962876600176714236295102304703576432831821371048636222437592977032152520264201150397449815946099451783206678102134244297120465871628146995177298572206738303824254146419775260516157393979709804631926623762008078298214549082161615281076934227384806996409646599524498540951455715324310415444206999064773325066792279213820049481780627613022084604793998377142005137597070414469826285507472804502365712528195443660990800076994538232413123146296998779733405296895866907544627697698751666693962343982320780662377524721520065789268337372570792225127816524682332637687685606311895692912720286354148616635691292629675326487225640262432245003286988263932146994294401379683628714600240245451930260492848068116923595139717088951617209678709710813481544461100410449915545993123450287274355813922240860371511152104623814446862833869367405212921063389173446034542589769372505071106319033038970856774366332134483202273470148164968595267246067856012803447283103722314021009792997453070469209454371662701844044744537440810880932033070858755687786957790706062172955143136815772716939749140402269988147753934028805837094816279059472613281866588713768754077565815503410151226552383022853529379745261493844141772934206696077544535881453887210374663448523345992440420012945815354040115618648952284944704147116396124953642929493221946328117420231775358595551300439049563919142579808278901791573954365051497368274320699111926312091125389286719596102112247808
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

end FranklSmallCyclic.TransportBatches.G055.B001.Data
