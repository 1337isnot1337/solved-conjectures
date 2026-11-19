module

public import Conjectures.FranklSmallCyclicRowCoverage
public import Conjectures.FranklSmallCyclicCanonicalWords
public import Conjectures.FranklSmallCyclicOrbit10Block002Data

/-! 128 literal targets sharing one source proof block.
Original words and row indices are retained; weights may be transported.
-/
@[expose] public section

namespace FranklSmallCyclic.TransportBatches.G080.B000.Data

-- Period 10, original row 4108, representative 9590.
def source0 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B002.Data.entryAt ⟨14, by decide +kernel⟩

def target0 : Weights.Entry :=
  { word := [8, 0, 0, 9, 4, 12, 12], weights := [1, 0, 1, 1] }

-- Period 10, original row 4112, representative 9586.
def source1 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B002.Data.entryAt ⟨10, by decide +kernel⟩

def target1 : Weights.Entry :=
  { word := [8, 0, 0, 9, 12, 12, 12], weights := [1, 0, 1, 1] }

-- Period 10, original row 4122, representative 9582.
def source2 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B002.Data.entryAt ⟨6, by decide +kernel⟩

def target2 : Weights.Entry :=
  { word := [8, 0, 0, 12, 0, 12, 12], weights := [1, 0, 1, 0] }

-- Period 10, original row 4180, representative 9577.
def source3 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B002.Data.entryAt ⟨1, by decide +kernel⟩

def target3 : Weights.Entry :=
  { word := [8, 0, 1, 12, 8, 12, 12], weights := [1, 0, 1, 0] }

-- Period 10, original row 4302, representative 9596.
def source4 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B002.Data.entryAt ⟨20, by decide +kernel⟩

def target4 : Weights.Entry :=
  { word := [8, 0, 4, 10, 0, 12, 10], weights := [1, 0, 1, 1] }

-- Period 10, original row 4303, representative 9596.
def source5 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B002.Data.entryAt ⟨20, by decide +kernel⟩

def target5 : Weights.Entry :=
  { word := [8, 0, 4, 10, 0, 12, 12], weights := [1, 0, 1, 1] }

def points5 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 8), (8, 7), (9, 9)]

-- Period 10, original row 4311, representative 9594.
def source6 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B002.Data.entryAt ⟨18, by decide +kernel⟩

def target6 : Weights.Entry :=
  { word := [8, 0, 4, 10, 8, 12, 12], weights := [1, 0, 1, 1] }

-- Period 10, original row 4367, representative 9589.
def source7 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B002.Data.entryAt ⟨13, by decide +kernel⟩

def target7 : Weights.Entry :=
  { word := [8, 0, 8, 9, 4, 12, 12], weights := [1, 0, 1, 1] }

-- Period 10, original row 4371, representative 9585.
def source8 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B002.Data.entryAt ⟨9, by decide +kernel⟩

def target8 : Weights.Entry :=
  { word := [8, 0, 8, 9, 12, 12, 12], weights := [1, 0, 1, 1] }

-- Period 10, original row 4478, representative 9595.
def source9 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B002.Data.entryAt ⟨19, by decide +kernel⟩

def target9 : Weights.Entry :=
  { word := [8, 0, 12, 10, 0, 12, 10], weights := [1, 0, 1, 1] }

-- Period 10, original row 4479, representative 9595.
def source10 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B002.Data.entryAt ⟨19, by decide +kernel⟩

def target10 : Weights.Entry :=
  { word := [8, 0, 12, 10, 0, 12, 12], weights := [1, 0, 1, 1] }

def points10 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 8), (8, 7), (9, 9)]

-- Period 10, original row 4487, representative 9593.
def source11 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B002.Data.entryAt ⟨17, by decide +kernel⟩

def target11 : Weights.Entry :=
  { word := [8, 0, 12, 10, 8, 12, 12], weights := [1, 0, 1, 1] }

-- Period 10, original row 4498, representative 9625.
def source12 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B002.Data.entryAt ⟨49, by decide +kernel⟩

def target12 : Weights.Entry :=
  { word := [8, 1, 0, 9, 4, 4, 12], weights := [1, 0, 1, 1] }

-- Period 10, original row 4502, representative 9620.
def source13 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B002.Data.entryAt ⟨44, by decide +kernel⟩

def target13 : Weights.Entry :=
  { word := [8, 1, 0, 9, 12, 4, 12], weights := [1, 0, 1, 1] }

-- Period 10, original row 4510, representative 9615.
def source14 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B002.Data.entryAt ⟨39, by decide +kernel⟩

def target14 : Weights.Entry :=
  { word := [8, 1, 0, 12, 0, 4, 10], weights := [1, 0, 1, 0] }

-- Period 10, original row 4511, representative 9615.
def source15 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B002.Data.entryAt ⟨39, by decide +kernel⟩

def target15 : Weights.Entry :=
  { word := [8, 1, 0, 12, 0, 4, 12], weights := [1, 0, 1, 0] }

def points15 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 8), (8, 7), (9, 9)]

-- Period 10, original row 4564, representative 9629.
def source16 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B002.Data.entryAt ⟨53, by decide +kernel⟩

def target16 : Weights.Entry :=
  { word := [8, 1, 4, 10, 8, 4, 12], weights := [1, 0, 1, 1] }

-- Period 10, original row 4589, representative 9623.
def source17 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B002.Data.entryAt ⟨47, by decide +kernel⟩

def target17 : Weights.Entry :=
  { word := [8, 1, 8, 9, 4, 4, 12], weights := [1, 0, 1, 1] }

-- Period 10, original row 4593, representative 9618.
def source18 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B002.Data.entryAt ⟨42, by decide +kernel⟩

def target18 : Weights.Entry :=
  { word := [8, 1, 8, 9, 12, 4, 12], weights := [1, 0, 1, 1] }

-- Period 10, original row 4639, representative 9630.
def source19 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B002.Data.entryAt ⟨54, by decide +kernel⟩

def target19 : Weights.Entry :=
  { word := [8, 1, 12, 10, 0, 4, 10], weights := [1, 0, 1, 1] }

-- Period 10, original row 4640, representative 9630.
def source20 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B002.Data.entryAt ⟨54, by decide +kernel⟩

def target20 : Weights.Entry :=
  { word := [8, 1, 12, 10, 0, 4, 12], weights := [1, 0, 1, 1] }

def points20 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 8), (8, 7), (9, 9)]

-- Period 10, original row 4657, representative 9628.
def source21 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B002.Data.entryAt ⟨52, by decide +kernel⟩

def target21 : Weights.Entry :=
  { word := [8, 1, 12, 10, 8, 4, 12], weights := [1, 0, 1, 1] }

-- Period 10, original row 5059, representative 9577.
def source22 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B002.Data.entryAt ⟨1, by decide +kernel⟩

def target22 : Weights.Entry :=
  { word := [8, 4, 0, 12, 8, 12, 12], weights := [1, 0, 1, 0] }

def points22 : List (ℕ × ℕ) := [(0, 0), (1, 2), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8), (9, 9)]

-- Period 10, original row 5224, representative 9576.
def source23 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B002.Data.entryAt ⟨0, by decide +kernel⟩

def target23 : Weights.Entry :=
  { word := [8, 4, 8, 12, 8, 12, 12], weights := [1, 0, 1, 0] }

-- Period 10, original row 5340, representative 9580.
def source24 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B002.Data.entryAt ⟨4, by decide +kernel⟩

def target24 : Weights.Entry :=
  { word := [8, 8, 0, 4, 0, 12, 12], weights := [1, 0, 1, 2] }

-- Period 10, original row 5366, representative 9578.
def source25 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B002.Data.entryAt ⟨2, by decide +kernel⟩

def target25 : Weights.Entry :=
  { word := [8, 8, 0, 4, 8, 12, 12], weights := [1, 0, 0, 1] }

-- Period 10, original row 5388, representative 9588.
def source26 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B002.Data.entryAt ⟨12, by decide +kernel⟩

def target26 : Weights.Entry :=
  { word := [8, 8, 0, 9, 4, 12, 12], weights := [1, 1, 1, 1] }

-- Period 10, original row 5392, representative 9584.
def source27 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B002.Data.entryAt ⟨8, by decide +kernel⟩

def target27 : Weights.Entry :=
  { word := [8, 8, 0, 9, 12, 12, 12], weights := [1, 1, 1, 1] }

-- Period 10, original row 5404, representative 9581.
def source28 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B002.Data.entryAt ⟨5, by decide +kernel⟩

def target28 : Weights.Entry :=
  { word := [8, 8, 0, 12, 0, 12, 12], weights := [1, 0, 1, 0] }

-- Period 10, original row 5429, representative 9579.
def source29 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B002.Data.entryAt ⟨3, by decide +kernel⟩

def target29 : Weights.Entry :=
  { word := [8, 8, 0, 12, 8, 12, 12], weights := [1, 0, 1, 0] }

-- Period 10, original row 5634, representative 9592.
def source30 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B002.Data.entryAt ⟨16, by decide +kernel⟩

def target30 : Weights.Entry :=
  { word := [8, 8, 4, 10, 8, 12, 12], weights := [1, 1, 1, 1] }

-- Period 10, original row 5716, representative 9587.
def source31 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B002.Data.entryAt ⟨11, by decide +kernel⟩

def target31 : Weights.Entry :=
  { word := [8, 8, 8, 9, 4, 12, 12], weights := [1, 1, 1, 1] }

-- Period 10, original row 5720, representative 9583.
def source32 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B002.Data.entryAt ⟨7, by decide +kernel⟩

def target32 : Weights.Entry :=
  { word := [8, 8, 8, 9, 12, 12, 12], weights := [1, 1, 1, 1] }

-- Period 10, original row 5841, representative 9591.
def source33 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B002.Data.entryAt ⟨15, by decide +kernel⟩

def target33 : Weights.Entry :=
  { word := [8, 8, 12, 10, 8, 12, 12], weights := [1, 1, 1, 1] }

-- Period 10, original row 5893, representative 9597.
def source34 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B002.Data.entryAt ⟨21, by decide +kernel⟩

def target34 : Weights.Entry :=
  { word := [8, 9, 0, 4, 8, 4, 10], weights := [1, 0, 1, 0] }

-- Period 10, original row 5894, representative 9603.
def source35 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B002.Data.entryAt ⟨27, by decide +kernel⟩

def target35 : Weights.Entry :=
  { word := [8, 9, 0, 4, 8, 4, 12], weights := [1, 0, 0, 1] }

-- Period 10, original row 5913, representative 9622.
def source36 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B002.Data.entryAt ⟨46, by decide +kernel⟩

def target36 : Weights.Entry :=
  { word := [8, 9, 0, 9, 4, 4, 12], weights := [1, 1, 1, 1] }

-- Period 10, original row 5917, representative 9617.
def source37 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B002.Data.entryAt ⟨41, by decide +kernel⟩

def target37 : Weights.Entry :=
  { word := [8, 9, 0, 9, 12, 4, 12], weights := [1, 1, 1, 1] }

-- Period 10, original row 5927, representative 9611.
def source38 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B002.Data.entryAt ⟨35, by decide +kernel⟩

def target38 : Weights.Entry :=
  { word := [8, 9, 0, 12, 0, 4, 10], weights := [1, 0, 1, 0] }

-- Period 10, original row 5928, representative 9611.
def source39 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B002.Data.entryAt ⟨35, by decide +kernel⟩

def target39 : Weights.Entry :=
  { word := [8, 9, 0, 12, 0, 4, 12], weights := [1, 0, 1, 0] }

def points39 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 8), (8, 7), (9, 9)]

-- Period 10, original row 5952, representative 9598.
def source40 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B002.Data.entryAt ⟨22, by decide +kernel⟩

def target40 : Weights.Entry :=
  { word := [8, 9, 0, 12, 8, 4, 10], weights := [1, 0, 1, 0] }

-- Period 10, original row 5953, representative 9604.
def source41 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B002.Data.entryAt ⟨28, by decide +kernel⟩

def target41 : Weights.Entry :=
  { word := [8, 9, 0, 12, 8, 4, 12], weights := [1, 0, 1, 0] }

-- Period 10, original row 6024, representative 9621.
def source42 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B002.Data.entryAt ⟨45, by decide +kernel⟩

def target42 : Weights.Entry :=
  { word := [8, 9, 8, 9, 4, 4, 12], weights := [1, 1, 1, 1] }

-- Period 10, original row 6028, representative 9616.
def source43 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B002.Data.entryAt ⟨40, by decide +kernel⟩

def target43 : Weights.Entry :=
  { word := [8, 9, 8, 9, 12, 4, 12], weights := [1, 1, 1, 1] }

-- Period 10, original row 6682, representative 9577.
def source44 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B002.Data.entryAt ⟨1, by decide +kernel⟩

def target44 : Weights.Entry :=
  { word := [9, 0, 1, 12, 8, 12, 12], weights := [1, 0, 1, 0] }

def points44 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8), (9, 9)]

-- Period 10, original row 6804, representative 9596.
def source45 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B002.Data.entryAt ⟨20, by decide +kernel⟩

def target45 : Weights.Entry :=
  { word := [9, 0, 4, 10, 0, 12, 10], weights := [1, 0, 1, 1] }

def points45 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8), (9, 9)]

-- Period 10, original row 6805, representative 9596.
def source46 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B002.Data.entryAt ⟨20, by decide +kernel⟩

def target46 : Weights.Entry :=
  { word := [9, 0, 4, 10, 0, 12, 12], weights := [1, 0, 1, 1] }

def points46 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 8), (8, 7), (9, 9)]

-- Period 10, original row 6813, representative 9594.
def source47 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B002.Data.entryAt ⟨18, by decide +kernel⟩

def target47 : Weights.Entry :=
  { word := [9, 0, 4, 10, 8, 12, 12], weights := [1, 0, 1, 1] }

def points47 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8), (9, 9)]

-- Period 10, original row 6839, representative 9589.
def source48 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B002.Data.entryAt ⟨13, by decide +kernel⟩

def target48 : Weights.Entry :=
  { word := [9, 0, 8, 9, 4, 12, 12], weights := [1, 0, 1, 1] }

def points48 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8), (9, 9)]

-- Period 10, original row 6843, representative 9585.
def source49 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B002.Data.entryAt ⟨9, by decide +kernel⟩

def target49 : Weights.Entry :=
  { word := [9, 0, 8, 9, 12, 12, 12], weights := [1, 0, 1, 1] }

def points49 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8), (9, 9)]

-- Period 10, original row 6950, representative 9595.
def source50 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B002.Data.entryAt ⟨19, by decide +kernel⟩

def target50 : Weights.Entry :=
  { word := [9, 0, 12, 10, 0, 12, 10], weights := [1, 0, 1, 1] }

def points50 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8), (9, 9)]

-- Period 10, original row 6951, representative 9595.
def source51 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B002.Data.entryAt ⟨19, by decide +kernel⟩

def target51 : Weights.Entry :=
  { word := [9, 0, 12, 10, 0, 12, 12], weights := [1, 0, 1, 1] }

def points51 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 8), (8, 7), (9, 9)]

-- Period 10, original row 6959, representative 9593.
def source52 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B002.Data.entryAt ⟨17, by decide +kernel⟩

def target52 : Weights.Entry :=
  { word := [9, 0, 12, 10, 8, 12, 12], weights := [1, 0, 1, 1] }

def points52 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8), (9, 9)]

-- Period 10, original row 7404, representative 9625.
def source53 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B002.Data.entryAt ⟨49, by decide +kernel⟩

def target53 : Weights.Entry :=
  { word := [10, 0, 0, 9, 4, 4, 12], weights := [1, 0, 1, 1] }

def points53 : List (ℕ × ℕ) := [(0, 2), (1, 0), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8), (9, 9)]

-- Period 10, original row 7408, representative 9620.
def source54 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B002.Data.entryAt ⟨44, by decide +kernel⟩

def target54 : Weights.Entry :=
  { word := [10, 0, 0, 9, 12, 4, 12], weights := [1, 0, 1, 1] }

def points54 : List (ℕ × ℕ) := [(0, 2), (1, 0), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8), (9, 9)]

-- Period 10, original row 7416, representative 9615.
def source55 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B002.Data.entryAt ⟨39, by decide +kernel⟩

def target55 : Weights.Entry :=
  { word := [10, 0, 0, 12, 0, 4, 10], weights := [1, 0, 1, 0] }

def points55 : List (ℕ × ℕ) := [(0, 2), (1, 0), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8), (9, 9)]

-- Period 10, original row 7417, representative 9615.
def source56 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B002.Data.entryAt ⟨39, by decide +kernel⟩

def target56 : Weights.Entry :=
  { word := [10, 0, 0, 12, 0, 4, 12], weights := [1, 0, 1, 0] }

def points56 : List (ℕ × ℕ) := [(0, 2), (1, 0), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6), (7, 8), (8, 7), (9, 9)]

-- Period 10, original row 7465, representative 9633.
def source57 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B002.Data.entryAt ⟨57, by decide +kernel⟩

def target57 : Weights.Entry :=
  { word := [10, 0, 4, 10, 8, 4, 12], weights := [1, 0, 1, 1] }

-- Period 10, original row 7489, representative 9609.
def source58 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B002.Data.entryAt ⟨33, by decide +kernel⟩

def target58 : Weights.Entry :=
  { word := [10, 0, 8, 4, 8, 4, 12], weights := [1, 0, 0, 1] }

-- Period 10, original row 7493, representative 9624.
def source59 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B002.Data.entryAt ⟨48, by decide +kernel⟩

def target59 : Weights.Entry :=
  { word := [10, 0, 8, 9, 4, 4, 12], weights := [1, 0, 1, 1] }

-- Period 10, original row 7497, representative 9619.
def source60 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B002.Data.entryAt ⟨43, by decide +kernel⟩

def target60 : Weights.Entry :=
  { word := [10, 0, 8, 9, 12, 4, 12], weights := [1, 0, 1, 1] }

-- Period 10, original row 7507, representative 9614.
def source61 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B002.Data.entryAt ⟨38, by decide +kernel⟩

def target61 : Weights.Entry :=
  { word := [10, 0, 8, 12, 0, 4, 10], weights := [1, 0, 1, 0] }

-- Period 10, original row 7508, representative 9614.
def source62 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B002.Data.entryAt ⟨38, by decide +kernel⟩

def target62 : Weights.Entry :=
  { word := [10, 0, 8, 12, 0, 4, 12], weights := [1, 0, 1, 0] }

def points62 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 8), (8, 7), (9, 9)]

-- Period 10, original row 7519, representative 9610.
def source63 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B002.Data.entryAt ⟨34, by decide +kernel⟩

def target63 : Weights.Entry :=
  { word := [10, 0, 8, 12, 8, 4, 12], weights := [1, 0, 1, 0] }

-- Period 10, original row 7535, representative 9638.
def source64 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B002.Data.entryAt ⟨62, by decide +kernel⟩

def target64 : Weights.Entry :=
  { word := [10, 0, 9, 8, 9, 4, 12], weights := [1, 0, 1, 1] }

-- Period 10, original row 7569, representative 9634.
def source65 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B002.Data.entryAt ⟨58, by decide +kernel⟩

def target65 : Weights.Entry :=
  { word := [10, 0, 12, 10, 0, 4, 10], weights := [1, 0, 1, 1] }

-- Period 10, original row 7570, representative 9634.
def source66 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B002.Data.entryAt ⟨58, by decide +kernel⟩

def target66 : Weights.Entry :=
  { word := [10, 0, 12, 10, 0, 4, 12], weights := [1, 0, 1, 1] }

def points66 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 8), (8, 7), (9, 9)]

-- Period 10, original row 7587, representative 9632.
def source67 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B002.Data.entryAt ⟨56, by decide +kernel⟩

def target67 : Weights.Entry :=
  { word := [10, 0, 12, 10, 8, 4, 12], weights := [1, 0, 1, 1] }

-- Period 10, original row 7618, representative 9615.
def source68 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B002.Data.entryAt ⟨39, by decide +kernel⟩

def target68 : Weights.Entry :=
  { word := [10, 2, 0, 10, 0, 0, 9], weights := [0, 1, 0, 1] }

def points68 : List (ℕ × ℕ) := [(0, 9), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2), (9, 0)]

-- Period 10, original row 7619, representative 9615.
def source69 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B002.Data.entryAt ⟨39, by decide +kernel⟩

def target69 : Weights.Entry :=
  { word := [10, 2, 0, 10, 0, 0, 10], weights := [0, 1, 0, 1] }

def points69 : List (ℕ × ℕ) := [(0, 8), (1, 7), (2, 9), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2), (9, 0)]

-- Period 10, original row 7620, representative 9615.
def source70 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B002.Data.entryAt ⟨39, by decide +kernel⟩

def target70 : Weights.Entry :=
  { word := [10, 2, 0, 10, 0, 0, 12], weights := [0, 1, 0, 1] }

def points70 : List (ℕ × ℕ) := [(0, 7), (1, 8), (2, 9), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2), (9, 0)]

-- Period 10, original row 7625, representative 9611.
def source71 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B002.Data.entryAt ⟨35, by decide +kernel⟩

def target71 : Weights.Entry :=
  { word := [10, 2, 0, 10, 0, 8, 9], weights := [0, 1, 0, 1] }

def points71 : List (ℕ × ℕ) := [(0, 9), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2), (9, 0)]

-- Period 10, original row 7626, representative 9613.
def source72 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B002.Data.entryAt ⟨37, by decide +kernel⟩

def target72 : Weights.Entry :=
  { word := [10, 2, 0, 10, 0, 8, 12], weights := [1, 0, 0, 1] }

-- Period 10, original row 7628, representative 9614.
def source73 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B002.Data.entryAt ⟨38, by decide +kernel⟩

def target73 : Weights.Entry :=
  { word := [10, 2, 0, 10, 8, 0, 12], weights := [0, 1, 0, 1] }

def points73 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2), (9, 0)]

-- Period 10, original row 7630, representative 9612.
def source74 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B002.Data.entryAt ⟨36, by decide +kernel⟩

def target74 : Weights.Entry :=
  { word := [10, 2, 0, 10, 8, 8, 12], weights := [1, 0, 0, 1] }

-- Period 10, original row 7635, representative 9630.
def source75 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B002.Data.entryAt ⟨54, by decide +kernel⟩

def target75 : Weights.Entry :=
  { word := [10, 2, 0, 12, 10, 0, 9], weights := [1, 1, 0, 1] }

def points75 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2), (9, 0)]

-- Period 10, original row 7636, representative 9630.
def source76 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B002.Data.entryAt ⟨54, by decide +kernel⟩

def target76 : Weights.Entry :=
  { word := [10, 2, 0, 12, 10, 0, 10], weights := [1, 1, 0, 1] }

def points76 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2), (9, 0)]

-- Period 10, original row 7637, representative 9634.
def source77 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B002.Data.entryAt ⟨58, by decide +kernel⟩

def target77 : Weights.Entry :=
  { word := [10, 2, 0, 12, 10, 0, 12], weights := [1, 1, 0, 1] }

def points77 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2), (9, 0)]

-- Period 10, original row 7646, representative 9625.
def source78 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B002.Data.entryAt ⟨49, by decide +kernel⟩

def target78 : Weights.Entry :=
  { word := [10, 2, 2, 8, 1, 0, 9], weights := [1, 1, 0, 1] }

def points78 : List (ℕ × ℕ) := [(0, 9), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 7647, representative 9625.
def source79 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B002.Data.entryAt ⟨49, by decide +kernel⟩

def target79 : Weights.Entry :=
  { word := [10, 2, 2, 8, 1, 0, 10], weights := [1, 1, 0, 1] }

def points79 : List (ℕ × ℕ) := [(0, 8), (1, 7), (2, 9), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 7648, representative 9625.
def source80 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B002.Data.entryAt ⟨49, by decide +kernel⟩

def target80 : Weights.Entry :=
  { word := [10, 2, 2, 8, 1, 0, 12], weights := [1, 1, 0, 1] }

def points80 : List (ℕ × ℕ) := [(0, 7), (1, 8), (2, 9), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 7651, representative 9622.
def source81 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B002.Data.entryAt ⟨46, by decide +kernel⟩

def target81 : Weights.Entry :=
  { word := [10, 2, 2, 8, 1, 8, 9], weights := [1, 1, 1, 1] }

def points81 : List (ℕ × ℕ) := [(0, 9), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 7660, representative 9623.
def source82 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B002.Data.entryAt ⟨47, by decide +kernel⟩

def target82 : Weights.Entry :=
  { word := [10, 2, 2, 8, 9, 0, 9], weights := [1, 1, 0, 1] }

def points82 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 7661, representative 9623.
def source83 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B002.Data.entryAt ⟨47, by decide +kernel⟩

def target83 : Weights.Entry :=
  { word := [10, 2, 2, 8, 9, 0, 10], weights := [1, 1, 0, 1] }

def points83 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 7662, representative 9624.
def source84 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B002.Data.entryAt ⟨48, by decide +kernel⟩

def target84 : Weights.Entry :=
  { word := [10, 2, 2, 8, 9, 0, 12], weights := [1, 1, 0, 1] }

def points84 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 7665, representative 9621.
def source85 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B002.Data.entryAt ⟨45, by decide +kernel⟩

def target85 : Weights.Entry :=
  { word := [10, 2, 2, 8, 9, 8, 9], weights := [1, 1, 1, 1] }

def points85 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 7677, representative 9603.
def source86 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B002.Data.entryAt ⟨27, by decide +kernel⟩

def target86 : Weights.Entry :=
  { word := [10, 2, 8, 2, 0, 8, 9], weights := [1, 0, 0, 1] }

def points86 : List (ℕ × ℕ) := [(0, 9), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 7678, representative 9605.
def source87 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B002.Data.entryAt ⟨29, by decide +kernel⟩

def target87 : Weights.Entry :=
  { word := [10, 2, 8, 2, 0, 8, 10], weights := [1, 0, 0, 1] }

-- Period 10, original row 7679, representative 9605.
def source88 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B002.Data.entryAt ⟨29, by decide +kernel⟩

def target88 : Weights.Entry :=
  { word := [10, 2, 8, 2, 0, 8, 12], weights := [1, 0, 0, 1] }

def points88 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 8), (8, 7), (9, 9)]

-- Period 10, original row 7685, representative 9609.
def source89 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B002.Data.entryAt ⟨33, by decide +kernel⟩

def target89 : Weights.Entry :=
  { word := [10, 2, 8, 2, 8, 0, 12], weights := [1, 0, 0, 1] }

def points89 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 7689, representative 9606.
def source90 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B002.Data.entryAt ⟨30, by decide +kernel⟩

def target90 : Weights.Entry :=
  { word := [10, 2, 8, 2, 8, 8, 12], weights := [1, 0, 0, 1] }

-- Period 10, original row 7707, representative 9638.
def source91 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B002.Data.entryAt ⟨62, by decide +kernel⟩

def target91 : Weights.Entry :=
  { word := [10, 2, 8, 9, 8, 1, 12], weights := [1, 1, 0, 1] }

def points91 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 7709, representative 9637.
def source92 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B002.Data.entryAt ⟨61, by decide +kernel⟩

def target92 : Weights.Entry :=
  { word := [10, 2, 8, 9, 8, 2, 10], weights := [1, 1, 0, 1] }

-- Period 10, original row 7712, representative 9639.
def source93 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B002.Data.entryAt ⟨63, by decide +kernel⟩

def target93 : Weights.Entry :=
  { word := [10, 2, 8, 9, 8, 8, 12], weights := [1, 1, 0, 1] }

-- Period 10, original row 7714, representative 9636.
def source94 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B002.Data.entryAt ⟨60, by decide +kernel⟩

def target94 : Weights.Entry :=
  { word := [10, 2, 8, 9, 8, 9, 12], weights := [1, 1, 0, 1] }

-- Period 10, original row 7716, representative 9635.
def source95 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B002.Data.entryAt ⟨59, by decide +kernel⟩

def target95 : Weights.Entry :=
  { word := [10, 2, 8, 9, 8, 10, 10], weights := [1, 1, 0, 1] }

-- Period 10, original row 7727, representative 9604.
def source96 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B002.Data.entryAt ⟨28, by decide +kernel⟩

def target96 : Weights.Entry :=
  { word := [10, 2, 8, 10, 0, 8, 9], weights := [0, 1, 0, 1] }

def points96 : List (ℕ × ℕ) := [(0, 9), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 7728, representative 9608.
def source97 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B002.Data.entryAt ⟨32, by decide +kernel⟩

def target97 : Weights.Entry :=
  { word := [10, 2, 8, 10, 0, 8, 10], weights := [1, 0, 0, 1] }

-- Period 10, original row 7729, representative 9608.
def source98 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B002.Data.entryAt ⟨32, by decide +kernel⟩

def target98 : Weights.Entry :=
  { word := [10, 2, 8, 10, 0, 8, 12], weights := [1, 0, 0, 1] }

def points98 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 8), (8, 7), (9, 9)]

-- Period 10, original row 7736, representative 9610.
def source99 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B002.Data.entryAt ⟨34, by decide +kernel⟩

def target99 : Weights.Entry :=
  { word := [10, 2, 8, 10, 8, 0, 12], weights := [0, 1, 0, 1] }

def points99 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 7742, representative 9607.
def source100 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B002.Data.entryAt ⟨31, by decide +kernel⟩

def target100 : Weights.Entry :=
  { word := [10, 2, 8, 10, 8, 8, 12], weights := [1, 0, 0, 1] }

-- Period 10, original row 7751, representative 9629.
def source101 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B002.Data.entryAt ⟨53, by decide +kernel⟩

def target101 : Weights.Entry :=
  { word := [10, 2, 8, 12, 2, 0, 9], weights := [1, 1, 0, 1] }

def points101 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 7752, representative 9629.
def source102 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B002.Data.entryAt ⟨53, by decide +kernel⟩

def target102 : Weights.Entry :=
  { word := [10, 2, 8, 12, 2, 0, 10], weights := [1, 1, 0, 1] }

def points102 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 7753, representative 9633.
def source103 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B002.Data.entryAt ⟨57, by decide +kernel⟩

def target103 : Weights.Entry :=
  { word := [10, 2, 8, 12, 2, 0, 12], weights := [1, 1, 0, 1] }

def points103 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 7756, representative 9627.
def source104 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B002.Data.entryAt ⟨51, by decide +kernel⟩

def target104 : Weights.Entry :=
  { word := [10, 2, 8, 12, 2, 8, 10], weights := [1, 1, 1, 1] }

-- Period 10, original row 7767, representative 9628.
def source105 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B002.Data.entryAt ⟨52, by decide +kernel⟩

def target105 : Weights.Entry :=
  { word := [10, 2, 8, 12, 10, 0, 9], weights := [1, 1, 0, 1] }

def points105 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 7768, representative 9628.
def source106 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B002.Data.entryAt ⟨52, by decide +kernel⟩

def target106 : Weights.Entry :=
  { word := [10, 2, 8, 12, 10, 0, 10], weights := [1, 1, 0, 1] }

def points106 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 7769, representative 9632.
def source107 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B002.Data.entryAt ⟨56, by decide +kernel⟩

def target107 : Weights.Entry :=
  { word := [10, 2, 8, 12, 10, 0, 12], weights := [1, 1, 0, 1] }

def points107 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 7773, representative 9626.
def source108 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B002.Data.entryAt ⟨50, by decide +kernel⟩

def target108 : Weights.Entry :=
  { word := [10, 2, 8, 12, 10, 8, 10], weights := [1, 1, 1, 1] }

-- Period 10, original row 7774, representative 9631.
def source109 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B002.Data.entryAt ⟨55, by decide +kernel⟩

def target109 : Weights.Entry :=
  { word := [10, 2, 8, 12, 10, 8, 12], weights := [2, 1, 1, 2] }

-- Period 10, original row 7786, representative 9620.
def source110 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B002.Data.entryAt ⟨44, by decide +kernel⟩

def target110 : Weights.Entry :=
  { word := [10, 2, 10, 8, 1, 0, 9], weights := [1, 1, 0, 1] }

def points110 : List (ℕ × ℕ) := [(0, 9), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 7787, representative 9620.
def source111 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B002.Data.entryAt ⟨44, by decide +kernel⟩

def target111 : Weights.Entry :=
  { word := [10, 2, 10, 8, 1, 0, 10], weights := [1, 1, 0, 1] }

def points111 : List (ℕ × ℕ) := [(0, 8), (1, 7), (2, 9), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 7788, representative 9620.
def source112 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B002.Data.entryAt ⟨44, by decide +kernel⟩

def target112 : Weights.Entry :=
  { word := [10, 2, 10, 8, 1, 0, 12], weights := [1, 1, 0, 1] }

def points112 : List (ℕ × ℕ) := [(0, 7), (1, 8), (2, 9), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 7791, representative 9617.
def source113 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B002.Data.entryAt ⟨41, by decide +kernel⟩

def target113 : Weights.Entry :=
  { word := [10, 2, 10, 8, 1, 8, 9], weights := [1, 1, 1, 1] }

def points113 : List (ℕ × ℕ) := [(0, 9), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 7800, representative 9618.
def source114 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B002.Data.entryAt ⟨42, by decide +kernel⟩

def target114 : Weights.Entry :=
  { word := [10, 2, 10, 8, 9, 0, 9], weights := [1, 1, 0, 1] }

def points114 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 7801, representative 9618.
def source115 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B002.Data.entryAt ⟨42, by decide +kernel⟩

def target115 : Weights.Entry :=
  { word := [10, 2, 10, 8, 9, 0, 10], weights := [1, 1, 0, 1] }

def points115 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 7802, representative 9619.
def source116 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B002.Data.entryAt ⟨43, by decide +kernel⟩

def target116 : Weights.Entry :=
  { word := [10, 2, 10, 8, 9, 0, 12], weights := [1, 1, 0, 1] }

def points116 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 7805, representative 9616.
def source117 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B002.Data.entryAt ⟨40, by decide +kernel⟩

def target117 : Weights.Entry :=
  { word := [10, 2, 10, 8, 9, 8, 9], weights := [1, 1, 1, 1] }

def points117 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 7840, representative 9599.
def source118 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B002.Data.entryAt ⟨23, by decide +kernel⟩

def target118 : Weights.Entry :=
  { word := [10, 8, 0, 4, 8, 4, 10], weights := [1, 0, 1, 0] }

-- Period 10, original row 7841, representative 9605.
def source119 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B002.Data.entryAt ⟨29, by decide +kernel⟩

def target119 : Weights.Entry :=
  { word := [10, 8, 0, 4, 8, 4, 12], weights := [1, 0, 0, 1] }

def points119 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2), (9, 0)]

-- Period 10, original row 7866, representative 9613.
def source120 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B002.Data.entryAt ⟨37, by decide +kernel⟩

def target120 : Weights.Entry :=
  { word := [10, 8, 0, 12, 0, 4, 10], weights := [1, 0, 0, 1] }

def points120 : List (ℕ × ℕ) := [(0, 9), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 7867, representative 9613.
def source121 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B002.Data.entryAt ⟨37, by decide +kernel⟩

def target121 : Weights.Entry :=
  { word := [10, 8, 0, 12, 0, 4, 12], weights := [1, 0, 0, 1] }

def points121 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 7891, representative 9602.
def source122 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B002.Data.entryAt ⟨26, by decide +kernel⟩

def target122 : Weights.Entry :=
  { word := [10, 8, 0, 12, 8, 4, 10], weights := [1, 0, 1, 0] }

-- Period 10, original row 7892, representative 9608.
def source123 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B002.Data.entryAt ⟨32, by decide +kernel⟩

def target123 : Weights.Entry :=
  { word := [10, 8, 0, 12, 8, 4, 12], weights := [1, 0, 0, 1] }

def points123 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2), (9, 0)]

-- Period 10, original row 8006, representative 9600.
def source124 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B002.Data.entryAt ⟨24, by decide +kernel⟩

def target124 : Weights.Entry :=
  { word := [10, 8, 8, 4, 8, 4, 10], weights := [1, 0, 1, 0] }

-- Period 10, original row 8007, representative 9606.
def source125 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B002.Data.entryAt ⟨30, by decide +kernel⟩

def target125 : Weights.Entry :=
  { word := [10, 8, 8, 4, 8, 4, 12], weights := [1, 0, 0, 1] }

def points125 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8040, representative 9639.
def source126 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B002.Data.entryAt ⟨63, by decide +kernel⟩

def target126 : Weights.Entry :=
  { word := [10, 8, 8, 8, 9, 4, 12], weights := [1, 0, 1, 1] }

def points126 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8050, representative 9612.
def source127 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B002.Data.entryAt ⟨36, by decide +kernel⟩

def target127 : Weights.Entry :=
  { word := [10, 8, 8, 12, 0, 4, 10], weights := [1, 0, 0, 1] }

def points127 : List (ℕ × ℕ) := [(0, 9), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

def period10Entries : List Weights.Entry := [target0, target1, target2, target3, target4, target5, target6, target7, target8, target9, target10, target11, target12, target13, target14, target15, target16, target17, target18, target19, target20, target21, target22, target23, target24, target25, target26, target27, target28, target29, target30, target31, target32, target33, target34, target35, target36, target37, target38, target39, target40, target41, target42, target43, target44, target45, target46, target47, target48, target49, target50, target51, target52, target53, target54, target55, target56, target57, target58, target59, target60, target61, target62, target63, target64, target65, target66, target67, target68, target69, target70, target71, target72, target73, target74, target75, target76, target77, target78, target79, target80, target81, target82, target83, target84, target85, target86, target87, target88, target89, target90, target91, target92, target93, target94, target95, target96, target97, target98, target99, target100, target101, target102, target103, target104, target105, target106, target107, target108, target109, target110, target111, target112, target113, target114, target115, target116, target117, target118, target119, target120, target121, target122, target123, target124, target125, target126, target127]

def period10Chunk : RowCoverage.Chunk where
  rows := [⟨4108, target0⟩, ⟨4112, target1⟩, ⟨4122, target2⟩, ⟨4180, target3⟩, ⟨4302, target4⟩, ⟨4303, target5⟩, ⟨4311, target6⟩, ⟨4367, target7⟩, ⟨4371, target8⟩, ⟨4478, target9⟩, ⟨4479, target10⟩, ⟨4487, target11⟩, ⟨4498, target12⟩, ⟨4502, target13⟩, ⟨4510, target14⟩, ⟨4511, target15⟩, ⟨4564, target16⟩, ⟨4589, target17⟩, ⟨4593, target18⟩, ⟨4639, target19⟩, ⟨4640, target20⟩, ⟨4657, target21⟩, ⟨5059, target22⟩, ⟨5224, target23⟩, ⟨5340, target24⟩, ⟨5366, target25⟩, ⟨5388, target26⟩, ⟨5392, target27⟩, ⟨5404, target28⟩, ⟨5429, target29⟩, ⟨5634, target30⟩, ⟨5716, target31⟩, ⟨5720, target32⟩, ⟨5841, target33⟩, ⟨5893, target34⟩, ⟨5894, target35⟩, ⟨5913, target36⟩, ⟨5917, target37⟩, ⟨5927, target38⟩, ⟨5928, target39⟩, ⟨5952, target40⟩, ⟨5953, target41⟩, ⟨6024, target42⟩, ⟨6028, target43⟩, ⟨6682, target44⟩, ⟨6804, target45⟩, ⟨6805, target46⟩, ⟨6813, target47⟩, ⟨6839, target48⟩, ⟨6843, target49⟩, ⟨6950, target50⟩, ⟨6951, target51⟩, ⟨6959, target52⟩, ⟨7404, target53⟩, ⟨7408, target54⟩, ⟨7416, target55⟩, ⟨7417, target56⟩, ⟨7465, target57⟩, ⟨7489, target58⟩, ⟨7493, target59⟩, ⟨7497, target60⟩, ⟨7507, target61⟩, ⟨7508, target62⟩, ⟨7519, target63⟩, ⟨7535, target64⟩, ⟨7569, target65⟩, ⟨7570, target66⟩, ⟨7587, target67⟩, ⟨7618, target68⟩, ⟨7619, target69⟩, ⟨7620, target70⟩, ⟨7625, target71⟩, ⟨7626, target72⟩, ⟨7628, target73⟩, ⟨7630, target74⟩, ⟨7635, target75⟩, ⟨7636, target76⟩, ⟨7637, target77⟩, ⟨7646, target78⟩, ⟨7647, target79⟩, ⟨7648, target80⟩, ⟨7651, target81⟩, ⟨7660, target82⟩, ⟨7661, target83⟩, ⟨7662, target84⟩, ⟨7665, target85⟩, ⟨7677, target86⟩, ⟨7678, target87⟩, ⟨7679, target88⟩, ⟨7685, target89⟩, ⟨7689, target90⟩, ⟨7707, target91⟩, ⟨7709, target92⟩, ⟨7712, target93⟩, ⟨7714, target94⟩, ⟨7716, target95⟩, ⟨7727, target96⟩, ⟨7728, target97⟩, ⟨7729, target98⟩, ⟨7736, target99⟩, ⟨7742, target100⟩, ⟨7751, target101⟩, ⟨7752, target102⟩, ⟨7753, target103⟩, ⟨7756, target104⟩, ⟨7767, target105⟩, ⟨7768, target106⟩, ⟨7769, target107⟩, ⟨7773, target108⟩, ⟨7774, target109⟩, ⟨7786, target110⟩, ⟨7787, target111⟩, ⟨7788, target112⟩, ⟨7791, target113⟩, ⟨7800, target114⟩, ⟨7801, target115⟩, ⟨7802, target116⟩, ⟨7805, target117⟩, ⟨7840, target118⟩, ⟨7841, target119⟩, ⟨7866, target120⟩, ⟨7867, target121⟩, ⟨7891, target122⟩, ⟨7892, target123⟩, ⟨8006, target124⟩, ⟨8007, target125⟩, ⟨8040, target126⟩, ⟨8050, target127⟩]
  indexMask := 195834409949265983884457655195529348331507999497012186624515954161570606668831351279972233798537336337018345929799384484993890820255919233600665963019735008176620534288269873610390360731457197850838781128310958327614285856418765257364762510888551203125833882073968334771705118887114904824246801627866557291827129008876371428058894383063170235406756266411952270360814022509149299101950827924953134158675619476077164166786125872612713045046487952061792017429332005366229595090981578019776885613676684707421413350084896491940748088518293476946890514756927916114596390272521943860903920812444163486601959591003909441133517301977953276307093230802181729130662450174800091045728996452900956944767002535264610535479713845410468028383683348377446713707953505872183145368442877640808992627614970526663979211973256569101314912330846406970958693010215666671204434214306686857124084784970550657282174832559645840681870117507102986364883264476530399537658958636643231272366558141810196912680914004078100562526216856638985154689312482207580506786622251243507437495921043388368129671787901559753962064011193415611934162019852966601302643353790488687418568138938634957449547642693175822153563213199680004335494283970883842505891204442285253483749960380968201402714936573845633548596694849185092674590813286868719904250309858779811870082464846139032707875522972212023762171463478766967867816890116243847016236933220286555976518600425030609292539364235592373110404793407928074429253173373269378800753080237839899819349808376143382266806321322121723885059266818267706934776851523675568170155540821697309389690900848321668537236629849766054641354335500839404349126814222208035011088383965289037800385054924025506292209787919230271711421874944964489413211864064167752702664665023399846557697788723699280468001040762675049633733115167296042033761652211935288113549801427789386097250106093620612617438941947646772739403912822117306924786305691324175335172913105008500236835432950748818452075347388438989442025068452369191226386055129863764797108474869408185984300232259597078833096208287772281740347807829807797920484020497440440341033741558291616615757211306076358479605047762366065133471146141293182475653699253905783644016463675130639482447353740358106214717129677322688601711637601046799181228838495746732736755993945806687409947327671542136644497223056219723838090346610291918793086517084029604390231673488634491938135144560885739276648579072
  count := 128

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

end FranklSmallCyclic.TransportBatches.G080.B000.Data
