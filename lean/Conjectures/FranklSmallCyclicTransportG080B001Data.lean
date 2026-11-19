module

public import Conjectures.FranklSmallCyclicRowCoverage
public import Conjectures.FranklSmallCyclicCanonicalWords
public import Conjectures.FranklSmallCyclicOrbit10Block002Data

/-! 65 literal targets sharing one source proof block.
Original words and row indices are retained; weights may be transported.
-/
@[expose] public section

namespace FranklSmallCyclic.TransportBatches.G080.B001.Data

-- Period 10, original row 8051, representative 9612.
def source0 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B002.Data.entryAt ⟨36, by decide +kernel⟩

def target0 : Weights.Entry :=
  { word := [10, 8, 8, 12, 0, 4, 12], weights := [1, 0, 0, 1] }

def points0 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8079, representative 9601.
def source1 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B002.Data.entryAt ⟨25, by decide +kernel⟩

def target1 : Weights.Entry :=
  { word := [10, 8, 8, 12, 8, 4, 10], weights := [1, 0, 1, 0] }

-- Period 10, original row 8080, representative 9607.
def source2 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B002.Data.entryAt ⟨31, by decide +kernel⟩

def target2 : Weights.Entry :=
  { word := [10, 8, 8, 12, 8, 4, 12], weights := [1, 0, 0, 1] }

def points2 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8115, representative 9636.
def source3 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B002.Data.entryAt ⟨60, by decide +kernel⟩

def target3 : Weights.Entry :=
  { word := [10, 8, 9, 8, 9, 4, 12], weights := [1, 0, 1, 1] }

def points3 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8167, representative 9631.
def source4 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B002.Data.entryAt ⟨55, by decide +kernel⟩

def target4 : Weights.Entry :=
  { word := [10, 8, 12, 10, 8, 4, 12], weights := [2, 1, 1, 2] }

def points4 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8183, representative 9580.
def source5 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B002.Data.entryAt ⟨4, by decide +kernel⟩

def target5 : Weights.Entry :=
  { word := [10, 10, 0, 2, 0, 8, 8], weights := [2, 1, 0, 1] }

def points5 : List (ℕ × ℕ) := [(0, 9), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8204, representative 9582.
def source6 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B002.Data.entryAt ⟨6, by decide +kernel⟩

def target6 : Weights.Entry :=
  { word := [10, 10, 0, 10, 0, 0, 8], weights := [0, 1, 0, 1] }

def points6 : List (ℕ × ℕ) := [(0, 7), (1, 8), (2, 9), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8211, representative 9581.
def source7 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B002.Data.entryAt ⟨5, by decide +kernel⟩

def target7 : Weights.Entry :=
  { word := [10, 10, 0, 10, 0, 8, 8], weights := [0, 1, 0, 1] }

def points7 : List (ℕ × ℕ) := [(0, 9), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8221, representative 9596.
def source8 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B002.Data.entryAt ⟨20, by decide +kernel⟩

def target8 : Weights.Entry :=
  { word := [10, 10, 0, 12, 2, 0, 8], weights := [1, 1, 0, 1] }

def points8 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2), (9, 0)]

-- Period 10, original row 8229, representative 9595.
def source9 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B002.Data.entryAt ⟨19, by decide +kernel⟩

def target9 : Weights.Entry :=
  { word := [10, 10, 0, 12, 10, 0, 8], weights := [1, 1, 0, 1] }

def points9 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2), (9, 0)]

-- Period 10, original row 8237, representative 9590.
def source10 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B002.Data.entryAt ⟨14, by decide +kernel⟩

def target10 : Weights.Entry :=
  { word := [10, 10, 2, 8, 1, 0, 8], weights := [1, 1, 0, 1] }

def points10 : List (ℕ × ℕ) := [(0, 7), (1, 8), (2, 9), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8242, representative 9588.
def source11 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B002.Data.entryAt ⟨12, by decide +kernel⟩

def target11 : Weights.Entry :=
  { word := [10, 10, 2, 8, 1, 8, 8], weights := [1, 1, 1, 1] }

def points11 : List (ℕ × ℕ) := [(0, 9), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8251, representative 9589.
def source12 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B002.Data.entryAt ⟨13, by decide +kernel⟩

def target12 : Weights.Entry :=
  { word := [10, 10, 2, 8, 9, 0, 8], weights := [1, 1, 0, 1] }

def points12 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8256, representative 9587.
def source13 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B002.Data.entryAt ⟨11, by decide +kernel⟩

def target13 : Weights.Entry :=
  { word := [10, 10, 2, 8, 9, 8, 8], weights := [1, 1, 1, 1] }

def points13 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8269, representative 9578.
def source14 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B002.Data.entryAt ⟨2, by decide +kernel⟩

def target14 : Weights.Entry :=
  { word := [10, 10, 8, 2, 0, 8, 8], weights := [1, 0, 0, 1] }

def points14 : List (ℕ × ℕ) := [(0, 9), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8311, representative 9577.
def source15 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B002.Data.entryAt ⟨1, by decide +kernel⟩

def target15 : Weights.Entry :=
  { word := [10, 10, 8, 10, 0, 1, 8], weights := [0, 1, 0, 1] }

def points15 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8313, representative 9577.
def source16 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B002.Data.entryAt ⟨1, by decide +kernel⟩

def target16 : Weights.Entry :=
  { word := [10, 10, 8, 10, 0, 2, 8], weights := [0, 1, 0, 1] }

def points16 : List (ℕ × ℕ) := [(0, 7), (1, 9), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8319, representative 9579.
def source17 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B002.Data.entryAt ⟨3, by decide +kernel⟩

def target17 : Weights.Entry :=
  { word := [10, 10, 8, 10, 0, 8, 8], weights := [0, 1, 0, 1] }

def points17 : List (ℕ × ℕ) := [(0, 9), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8331, representative 9576.
def source18 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B002.Data.entryAt ⟨0, by decide +kernel⟩

def target18 : Weights.Entry :=
  { word := [10, 10, 8, 10, 8, 2, 8], weights := [0, 1, 0, 1] }

def points18 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8343, representative 9594.
def source19 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B002.Data.entryAt ⟨18, by decide +kernel⟩

def target19 : Weights.Entry :=
  { word := [10, 10, 8, 12, 2, 0, 8], weights := [1, 1, 0, 1] }

def points19 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8349, representative 9592.
def source20 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B002.Data.entryAt ⟨16, by decide +kernel⟩

def target20 : Weights.Entry :=
  { word := [10, 10, 8, 12, 2, 8, 8], weights := [1, 1, 1, 1] }

def points20 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8365, representative 9593.
def source21 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B002.Data.entryAt ⟨17, by decide +kernel⟩

def target21 : Weights.Entry :=
  { word := [10, 10, 8, 12, 10, 0, 8], weights := [1, 1, 0, 1] }

def points21 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8371, representative 9591.
def source22 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B002.Data.entryAt ⟨15, by decide +kernel⟩

def target22 : Weights.Entry :=
  { word := [10, 10, 8, 12, 10, 8, 8], weights := [1, 1, 1, 1] }

def points22 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8381, representative 9586.
def source23 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B002.Data.entryAt ⟨10, by decide +kernel⟩

def target23 : Weights.Entry :=
  { word := [10, 10, 10, 8, 1, 0, 8], weights := [1, 1, 0, 1] }

def points23 : List (ℕ × ℕ) := [(0, 7), (1, 8), (2, 9), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8386, representative 9584.
def source24 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B002.Data.entryAt ⟨8, by decide +kernel⟩

def target24 : Weights.Entry :=
  { word := [10, 10, 10, 8, 1, 8, 8], weights := [1, 1, 1, 1] }

def points24 : List (ℕ × ℕ) := [(0, 9), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8395, representative 9585.
def source25 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B002.Data.entryAt ⟨9, by decide +kernel⟩

def target25 : Weights.Entry :=
  { word := [10, 10, 10, 8, 9, 0, 8], weights := [1, 1, 0, 1] }

def points25 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8400, representative 9583.
def source26 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B002.Data.entryAt ⟨7, by decide +kernel⟩

def target26 : Weights.Entry :=
  { word := [10, 10, 10, 8, 9, 8, 8], weights := [1, 1, 1, 1] }

def points26 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8410, representative 9625.
def source27 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B002.Data.entryAt ⟨49, by decide +kernel⟩

def target27 : Weights.Entry :=
  { word := [12, 0, 0, 9, 4, 4, 12], weights := [1, 0, 1, 1] }

def points27 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8), (9, 9)]

-- Period 10, original row 8414, representative 9620.
def source28 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B002.Data.entryAt ⟨44, by decide +kernel⟩

def target28 : Weights.Entry :=
  { word := [12, 0, 0, 9, 12, 4, 12], weights := [1, 0, 1, 1] }

def points28 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8), (9, 9)]

-- Period 10, original row 8422, representative 9615.
def source29 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B002.Data.entryAt ⟨39, by decide +kernel⟩

def target29 : Weights.Entry :=
  { word := [12, 0, 0, 12, 0, 4, 10], weights := [1, 0, 1, 0] }

def points29 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8), (9, 9)]

-- Period 10, original row 8423, representative 9615.
def source30 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B002.Data.entryAt ⟨39, by decide +kernel⟩

def target30 : Weights.Entry :=
  { word := [12, 0, 0, 12, 0, 4, 12], weights := [1, 0, 1, 0] }

def points30 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 8), (8, 7), (9, 9)]

-- Period 10, original row 8476, representative 9629.
def source31 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B002.Data.entryAt ⟨53, by decide +kernel⟩

def target31 : Weights.Entry :=
  { word := [12, 0, 4, 10, 8, 4, 12], weights := [1, 0, 1, 1] }

def points31 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8), (9, 9)]

-- Period 10, original row 8501, representative 9623.
def source32 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B002.Data.entryAt ⟨47, by decide +kernel⟩

def target32 : Weights.Entry :=
  { word := [12, 0, 8, 9, 4, 4, 12], weights := [1, 0, 1, 1] }

def points32 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8), (9, 9)]

-- Period 10, original row 8505, representative 9618.
def source33 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B002.Data.entryAt ⟨42, by decide +kernel⟩

def target33 : Weights.Entry :=
  { word := [12, 0, 8, 9, 12, 4, 12], weights := [1, 0, 1, 1] }

def points33 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8), (9, 9)]

-- Period 10, original row 8551, representative 9630.
def source34 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B002.Data.entryAt ⟨54, by decide +kernel⟩

def target34 : Weights.Entry :=
  { word := [12, 0, 12, 10, 0, 4, 10], weights := [1, 0, 1, 1] }

def points34 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8), (9, 9)]

-- Period 10, original row 8552, representative 9630.
def source35 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B002.Data.entryAt ⟨54, by decide +kernel⟩

def target35 : Weights.Entry :=
  { word := [12, 0, 12, 10, 0, 4, 12], weights := [1, 0, 1, 1] }

def points35 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 8), (8, 7), (9, 9)]

-- Period 10, original row 8569, representative 9628.
def source36 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B002.Data.entryAt ⟨52, by decide +kernel⟩

def target36 : Weights.Entry :=
  { word := [12, 0, 12, 10, 8, 4, 12], weights := [1, 0, 1, 1] }

def points36 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8), (9, 9)]

-- Period 10, original row 8600, representative 9615.
def source37 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B002.Data.entryAt ⟨39, by decide +kernel⟩

def target37 : Weights.Entry :=
  { word := [12, 2, 0, 10, 0, 0, 9], weights := [0, 1, 0, 1] }

def points37 : List (ℕ × ℕ) := [(0, 9), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8601, representative 9615.
def source38 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B002.Data.entryAt ⟨39, by decide +kernel⟩

def target38 : Weights.Entry :=
  { word := [12, 2, 0, 10, 0, 0, 10], weights := [0, 1, 0, 1] }

def points38 : List (ℕ × ℕ) := [(0, 8), (1, 7), (2, 9), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8602, representative 9615.
def source39 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B002.Data.entryAt ⟨39, by decide +kernel⟩

def target39 : Weights.Entry :=
  { word := [12, 2, 0, 10, 0, 0, 12], weights := [0, 1, 0, 1] }

def points39 : List (ℕ × ℕ) := [(0, 7), (1, 8), (2, 9), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8607, representative 9611.
def source40 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B002.Data.entryAt ⟨35, by decide +kernel⟩

def target40 : Weights.Entry :=
  { word := [12, 2, 0, 10, 0, 8, 9], weights := [0, 1, 0, 1] }

def points40 : List (ℕ × ℕ) := [(0, 9), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8608, representative 9613.
def source41 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B002.Data.entryAt ⟨37, by decide +kernel⟩

def target41 : Weights.Entry :=
  { word := [12, 2, 0, 10, 0, 8, 12], weights := [1, 0, 0, 1] }

def points41 : List (ℕ × ℕ) := [(0, 0), (1, 2), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8), (9, 9)]

-- Period 10, original row 8610, representative 9614.
def source42 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B002.Data.entryAt ⟨38, by decide +kernel⟩

def target42 : Weights.Entry :=
  { word := [12, 2, 0, 10, 8, 0, 12], weights := [0, 1, 0, 1] }

def points42 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8612, representative 9612.
def source43 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B002.Data.entryAt ⟨36, by decide +kernel⟩

def target43 : Weights.Entry :=
  { word := [12, 2, 0, 10, 8, 8, 12], weights := [1, 0, 0, 1] }

def points43 : List (ℕ × ℕ) := [(0, 0), (1, 2), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8), (9, 9)]

-- Period 10, original row 8617, representative 9630.
def source44 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B002.Data.entryAt ⟨54, by decide +kernel⟩

def target44 : Weights.Entry :=
  { word := [12, 2, 0, 12, 10, 0, 9], weights := [1, 1, 0, 1] }

def points44 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8618, representative 9630.
def source45 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B002.Data.entryAt ⟨54, by decide +kernel⟩

def target45 : Weights.Entry :=
  { word := [12, 2, 0, 12, 10, 0, 10], weights := [1, 1, 0, 1] }

def points45 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8619, representative 9634.
def source46 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B002.Data.entryAt ⟨58, by decide +kernel⟩

def target46 : Weights.Entry :=
  { word := [12, 2, 0, 12, 10, 0, 12], weights := [1, 1, 0, 1] }

def points46 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8630, representative 9597.
def source47 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B002.Data.entryAt ⟨21, by decide +kernel⟩

def target47 : Weights.Entry :=
  { word := [12, 2, 8, 2, 0, 8, 9], weights := [0, 1, 0, 1] }

def points47 : List (ℕ × ℕ) := [(0, 9), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8631, representative 9599.
def source48 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B002.Data.entryAt ⟨23, by decide +kernel⟩

def target48 : Weights.Entry :=
  { word := [12, 2, 8, 2, 0, 8, 10], weights := [0, 1, 0, 1] }

def points48 : List (ℕ × ℕ) := [(0, 9), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8632, representative 9599.
def source49 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B002.Data.entryAt ⟨23, by decide +kernel⟩

def target49 : Weights.Entry :=
  { word := [12, 2, 8, 2, 0, 8, 12], weights := [0, 1, 0, 1] }

def points49 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8640, representative 9600.
def source50 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B002.Data.entryAt ⟨24, by decide +kernel⟩

def target50 : Weights.Entry :=
  { word := [12, 2, 8, 2, 8, 8, 12], weights := [0, 1, 0, 1] }

def points50 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8663, representative 9598.
def source51 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B002.Data.entryAt ⟨22, by decide +kernel⟩

def target51 : Weights.Entry :=
  { word := [12, 2, 8, 10, 0, 8, 9], weights := [0, 1, 0, 1] }

def points51 : List (ℕ × ℕ) := [(0, 9), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8664, representative 9602.
def source52 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B002.Data.entryAt ⟨26, by decide +kernel⟩

def target52 : Weights.Entry :=
  { word := [12, 2, 8, 10, 0, 8, 10], weights := [0, 1, 0, 1] }

def points52 : List (ℕ × ℕ) := [(0, 9), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8665, representative 9602.
def source53 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B002.Data.entryAt ⟨26, by decide +kernel⟩

def target53 : Weights.Entry :=
  { word := [12, 2, 8, 10, 0, 8, 12], weights := [0, 1, 0, 1] }

def points53 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8676, representative 9601.
def source54 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B002.Data.entryAt ⟨25, by decide +kernel⟩

def target54 : Weights.Entry :=
  { word := [12, 2, 8, 10, 8, 8, 12], weights := [0, 1, 0, 1] }

def points54 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8711, representative 9637.
def source55 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B002.Data.entryAt ⟨61, by decide +kernel⟩

def target55 : Weights.Entry :=
  { word := [12, 4, 8, 8, 9, 4, 12], weights := [1, 0, 1, 1] }

def points55 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8756, representative 9599.
def source56 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B002.Data.entryAt ⟨23, by decide +kernel⟩

def target56 : Weights.Entry :=
  { word := [12, 8, 0, 4, 8, 4, 10], weights := [1, 0, 1, 0] }

def points56 : List (ℕ × ℕ) := [(0, 0), (1, 2), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8), (9, 9)]

-- Period 10, original row 8757, representative 9605.
def source57 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B002.Data.entryAt ⟨29, by decide +kernel⟩

def target57 : Weights.Entry :=
  { word := [12, 8, 0, 4, 8, 4, 12], weights := [1, 0, 0, 1] }

def points57 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8799, representative 9602.
def source58 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B002.Data.entryAt ⟨26, by decide +kernel⟩

def target58 : Weights.Entry :=
  { word := [12, 8, 0, 12, 8, 4, 10], weights := [1, 0, 1, 0] }

def points58 : List (ℕ × ℕ) := [(0, 0), (1, 2), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8), (9, 9)]

-- Period 10, original row 8800, representative 9608.
def source59 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B002.Data.entryAt ⟨32, by decide +kernel⟩

def target59 : Weights.Entry :=
  { word := [12, 8, 0, 12, 8, 4, 12], weights := [1, 0, 0, 1] }

def points59 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8869, representative 9627.
def source60 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B002.Data.entryAt ⟨51, by decide +kernel⟩

def target60 : Weights.Entry :=
  { word := [12, 8, 4, 10, 8, 4, 12], weights := [1, 1, 1, 1] }

def points60 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8977, representative 9626.
def source61 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B002.Data.entryAt ⟨50, by decide +kernel⟩

def target61 : Weights.Entry :=
  { word := [12, 8, 12, 10, 8, 4, 12], weights := [1, 1, 1, 1] }

def points61 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 9007, representative 9596.
def source62 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B002.Data.entryAt ⟨20, by decide +kernel⟩

def target62 : Weights.Entry :=
  { word := [12, 10, 0, 12, 2, 0, 8], weights := [1, 1, 0, 1] }

def points62 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 9015, representative 9595.
def source63 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B002.Data.entryAt ⟨19, by decide +kernel⟩

def target63 : Weights.Entry :=
  { word := [12, 10, 0, 12, 10, 0, 8], weights := [1, 1, 0, 1] }

def points63 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 9076, representative 9635.
def source64 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B002.Data.entryAt ⟨59, by decide +kernel⟩

def target64 : Weights.Entry :=
  { word := [12, 12, 8, 8, 9, 4, 12], weights := [1, 0, 1, 1] }

def points64 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

def period10Entries : List Weights.Entry := [target0, target1, target2, target3, target4, target5, target6, target7, target8, target9, target10, target11, target12, target13, target14, target15, target16, target17, target18, target19, target20, target21, target22, target23, target24, target25, target26, target27, target28, target29, target30, target31, target32, target33, target34, target35, target36, target37, target38, target39, target40, target41, target42, target43, target44, target45, target46, target47, target48, target49, target50, target51, target52, target53, target54, target55, target56, target57, target58, target59, target60, target61, target62, target63, target64]

def period10Chunk : RowCoverage.Chunk where
  rows := [⟨8051, target0⟩, ⟨8079, target1⟩, ⟨8080, target2⟩, ⟨8115, target3⟩, ⟨8167, target4⟩, ⟨8183, target5⟩, ⟨8204, target6⟩, ⟨8211, target7⟩, ⟨8221, target8⟩, ⟨8229, target9⟩, ⟨8237, target10⟩, ⟨8242, target11⟩, ⟨8251, target12⟩, ⟨8256, target13⟩, ⟨8269, target14⟩, ⟨8311, target15⟩, ⟨8313, target16⟩, ⟨8319, target17⟩, ⟨8331, target18⟩, ⟨8343, target19⟩, ⟨8349, target20⟩, ⟨8365, target21⟩, ⟨8371, target22⟩, ⟨8381, target23⟩, ⟨8386, target24⟩, ⟨8395, target25⟩, ⟨8400, target26⟩, ⟨8410, target27⟩, ⟨8414, target28⟩, ⟨8422, target29⟩, ⟨8423, target30⟩, ⟨8476, target31⟩, ⟨8501, target32⟩, ⟨8505, target33⟩, ⟨8551, target34⟩, ⟨8552, target35⟩, ⟨8569, target36⟩, ⟨8600, target37⟩, ⟨8601, target38⟩, ⟨8602, target39⟩, ⟨8607, target40⟩, ⟨8608, target41⟩, ⟨8610, target42⟩, ⟨8612, target43⟩, ⟨8617, target44⟩, ⟨8618, target45⟩, ⟨8619, target46⟩, ⟨8630, target47⟩, ⟨8631, target48⟩, ⟨8632, target49⟩, ⟨8640, target50⟩, ⟨8663, target51⟩, ⟨8664, target52⟩, ⟨8665, target53⟩, ⟨8676, target54⟩, ⟨8711, target55⟩, ⟨8756, target56⟩, ⟨8757, target57⟩, ⟨8799, target58⟩, ⟨8800, target59⟩, ⟨8869, target60⟩, ⟨8977, target61⟩, ⟨9007, target62⟩, ⟨9015, target63⟩, ⟨9076, target64⟩]
  indexMask := 140682684300332116144438125499179968649708753309015499362416395326601742157806970203524594184009907017252661690692459063259282532036737798883254859608333947999120706851676517676348462976075896047475412101808693421672389374725868636485828153352613688249217958834477171248946077405743037727750484445864081649315208749706888285487801925726815633822917353011683608182944007393023235336593792170039051367551544059814856587202644422536012351743090344148608829281022403027093789111045103633187361750201842472991650574278064955732230916285116183073361057375437402759373387689125061362821387463389137053407332470009872154930593554948036000149253351789402873290907359995425666201625730967605530584639467819090120364014986465557643395859513989515287218665959054140265004775370575483554108392039939450583430207276186618647942589189658839996840330453910796389733389010839909627436148543951555045713356994903986023137750275634582858623145855308232096633747958190151673531679278803749253469316158987469889466056299880419272824795398151039734647855049885222621573765297222638634574258855373859466663239185140339457208284170688764532864537111659545247685936286192366443452792715302056431849438069428661772393762842937998471600114315362075394112579469877158025508292252387934465785987265566895710215050216583160712970075935368181778451780896009617990298498308942145216528679296566784120083945539924817320613086961791288099771121552662482391076850919631063964186246013742647378610284683511427305789039881635038236572343781147509324912602432747181543953976361353047521777721388435382191578551990359982260592992470872915798514187820417060159941203314146271377868615650180157224726283578032637575181323803909780296363199300986611810841771158552269803473426553317827774453777343734102999615949557828676630505391461206642761284968126824156869366384239328773219620413472252866253656746571137695021327321206835493577321597418860846774958488955277486186527069260999070826819691698839722262206854717774374378048845521490381926124725953095572647561490424081792134981676461173804420941198097319895563456966669398233923027133245568182761849652870540015361097492670030716105546652267920182301444828924286074080807152812958071418676071894893553446096791301642400542268832589273369948183578163974243855231056339543181064283674194067739728701166404401085613517947760674728159749551929702404265481610992293809019317749759977426666057667643930154354067624002224149986575544348150618809638166781819489619645334440755015131184809840567982057032292776613179064882906637623195900774791006493109818780988444007914376303082296597257470285233777026151505451727316726072263874227725232312969291530884819572239270599665713934882827230504435510529620710575068496492045023324405760
  count := 65

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

end FranklSmallCyclic.TransportBatches.G080.B001.Data
