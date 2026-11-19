module

public import Conjectures.FranklSmallCyclicRowCoverage
public import Conjectures.FranklSmallCyclicCanonicalWords
public import Conjectures.FranklSmallCyclicOrbit10Block000Data

/-! 128 literal targets sharing one source proof block.
Original words and row indices are retained; weights may be transported.
-/
@[expose] public section

namespace FranklSmallCyclic.TransportBatches.G078.B000.Data

-- Period 10, original row 2592, representative 9459.
def source0 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B000.Data.entryAt ⟨11, by decide +kernel⟩

def target0 : Weights.Entry :=
  { word := [2, 2, 0, 9, 8, 8, 6], weights := [1, 1, 0, 1] }

-- Period 10, original row 2697, representative 9458.
def source1 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B000.Data.entryAt ⟨10, by decide +kernel⟩

def target1 : Weights.Entry :=
  { word := [2, 2, 8, 9, 8, 8, 6], weights := [1, 1, 0, 1] }

-- Period 10, original row 3181, representative 9457.
def source2 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B000.Data.entryAt ⟨9, by decide +kernel⟩

def target2 : Weights.Entry :=
  { word := [2, 10, 0, 9, 8, 8, 6], weights := [1, 1, 0, 1] }

-- Period 10, original row 3292, representative 9456.
def source3 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B000.Data.entryAt ⟨8, by decide +kernel⟩

def target3 : Weights.Entry :=
  { word := [2, 10, 8, 9, 8, 8, 6], weights := [1, 1, 0, 1] }

-- Period 10, original row 3578, representative 9459.
def source4 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B000.Data.entryAt ⟨11, by decide +kernel⟩

def target4 : Weights.Entry :=
  { word := [4, 2, 0, 9, 8, 8, 6], weights := [1, 1, 0, 1] }

def points4 : List (ℕ × ℕ) := [(0, 0), (1, 2), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8), (9, 9)]

-- Period 10, original row 3982, representative 9457.
def source5 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B000.Data.entryAt ⟨9, by decide +kernel⟩

def target5 : Weights.Entry :=
  { word := [4, 10, 0, 9, 8, 8, 6], weights := [1, 1, 0, 1] }

def points5 : List (ℕ × ℕ) := [(0, 0), (1, 2), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8), (9, 9)]

-- Period 10, original row 4079, representative 9451.
def source6 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B000.Data.entryAt ⟨3, by decide +kernel⟩

def target6 : Weights.Entry :=
  { word := [6, 2, 8, 8, 1, 4, 8], weights := [0, 1, 3, 0] }

-- Period 10, original row 4080, representative 9450.
def source7 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B000.Data.entryAt ⟨2, by decide +kernel⟩

def target7 : Weights.Entry :=
  { word := [6, 2, 8, 8, 1, 12, 8], weights := [0, 1, 3, 0] }

-- Period 10, original row 4081, representative 9459.
def source8 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B000.Data.entryAt ⟨11, by decide +kernel⟩

def target8 : Weights.Entry :=
  { word := [6, 8, 8, 8, 1, 4, 2], weights := [1, 0, 1, 1] }

def points8 : List (ℕ × ℕ) := [(0, 9), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 4082, representative 9459.
def source9 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B000.Data.entryAt ⟨11, by decide +kernel⟩

def target9 : Weights.Entry :=
  { word := [6, 8, 8, 8, 1, 4, 4], weights := [1, 0, 1, 1] }

def points9 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 4083, representative 9461.
def source10 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B000.Data.entryAt ⟨13, by decide +kernel⟩

def target10 : Weights.Entry :=
  { word := [6, 8, 8, 8, 1, 4, 8], weights := [0, 0, 1, 0] }

-- Period 10, original row 4084, representative 9455.
def source11 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B000.Data.entryAt ⟨7, by decide +kernel⟩

def target11 : Weights.Entry :=
  { word := [6, 8, 8, 8, 1, 4, 10], weights := [1, 0, 1, 1] }

-- Period 10, original row 4085, representative 9455.
def source12 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B000.Data.entryAt ⟨7, by decide +kernel⟩

def target12 : Weights.Entry :=
  { word := [6, 8, 8, 8, 1, 4, 12], weights := [1, 0, 1, 1] }

def points12 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 8), (8, 7), (9, 9)]

-- Period 10, original row 4086, representative 9457.
def source13 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B000.Data.entryAt ⟨9, by decide +kernel⟩

def target13 : Weights.Entry :=
  { word := [6, 8, 8, 8, 1, 12, 2], weights := [1, 0, 1, 1] }

def points13 : List (ℕ × ℕ) := [(0, 9), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 4087, representative 9457.
def source14 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B000.Data.entryAt ⟨9, by decide +kernel⟩

def target14 : Weights.Entry :=
  { word := [6, 8, 8, 8, 1, 12, 4], weights := [1, 0, 1, 1] }

def points14 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 4088, representative 9460.
def source15 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B000.Data.entryAt ⟨12, by decide +kernel⟩

def target15 : Weights.Entry :=
  { word := [6, 8, 8, 8, 1, 12, 8], weights := [0, 0, 1, 0] }

-- Period 10, original row 4089, representative 9453.
def source16 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B000.Data.entryAt ⟨5, by decide +kernel⟩

def target16 : Weights.Entry :=
  { word := [6, 8, 8, 8, 1, 12, 10], weights := [1, 0, 1, 1] }

-- Period 10, original row 4090, representative 9453.
def source17 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B000.Data.entryAt ⟨5, by decide +kernel⟩

def target17 : Weights.Entry :=
  { word := [6, 8, 8, 8, 1, 12, 12], weights := [1, 0, 1, 1] }

def points17 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 8), (8, 7), (9, 9)]

-- Period 10, original row 4091, representative 9458.
def source18 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B000.Data.entryAt ⟨10, by decide +kernel⟩

def target18 : Weights.Entry :=
  { word := [6, 8, 8, 8, 9, 4, 4], weights := [1, 0, 1, 1] }

def points18 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 4092, representative 9454.
def source19 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B000.Data.entryAt ⟨6, by decide +kernel⟩

def target19 : Weights.Entry :=
  { word := [6, 8, 8, 8, 9, 4, 12], weights := [1, 0, 1, 1] }

-- Period 10, original row 4093, representative 9456.
def source20 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B000.Data.entryAt ⟨8, by decide +kernel⟩

def target20 : Weights.Entry :=
  { word := [6, 8, 8, 8, 9, 12, 4], weights := [1, 0, 1, 1] }

def points20 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 4094, representative 9452.
def source21 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B000.Data.entryAt ⟨4, by decide +kernel⟩

def target21 : Weights.Entry :=
  { word := [6, 8, 8, 8, 9, 12, 12], weights := [1, 0, 1, 1] }

-- Period 10, original row 4095, representative 9449.
def source22 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B000.Data.entryAt ⟨1, by decide +kernel⟩

def target22 : Weights.Entry :=
  { word := [6, 10, 8, 8, 1, 4, 8], weights := [0, 1, 3, 0] }

-- Period 10, original row 4096, representative 9448.
def source23 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B000.Data.entryAt ⟨0, by decide +kernel⟩

def target23 : Weights.Entry :=
  { word := [6, 10, 8, 8, 1, 12, 8], weights := [0, 1, 3, 0] }

-- Period 10, original row 4500, representative 9489.
def source24 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B000.Data.entryAt ⟨41, by decide +kernel⟩

def target24 : Weights.Entry :=
  { word := [8, 1, 0, 9, 4, 12, 12], weights := [1, 0, 1, 1] }

-- Period 10, original row 4504, representative 9484.
def source25 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B000.Data.entryAt ⟨36, by decide +kernel⟩

def target25 : Weights.Entry :=
  { word := [8, 1, 0, 9, 12, 12, 12], weights := [1, 0, 1, 1] }

-- Period 10, original row 4514, representative 9478.
def source26 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B000.Data.entryAt ⟨30, by decide +kernel⟩

def target26 : Weights.Entry :=
  { word := [8, 1, 0, 12, 0, 12, 12], weights := [1, 0, 1, 0] }

-- Period 10, original row 4560, representative 9495.
def source27 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B000.Data.entryAt ⟨47, by decide +kernel⟩

def target27 : Weights.Entry :=
  { word := [8, 1, 4, 10, 0, 12, 10], weights := [1, 0, 1, 1] }

-- Period 10, original row 4561, representative 9495.
def source28 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B000.Data.entryAt ⟨47, by decide +kernel⟩

def target28 : Weights.Entry :=
  { word := [8, 1, 4, 10, 0, 12, 12], weights := [1, 0, 1, 1] }

def points28 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 8), (8, 7), (9, 9)]

-- Period 10, original row 4569, representative 9493.
def source29 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B000.Data.entryAt ⟨45, by decide +kernel⟩

def target29 : Weights.Entry :=
  { word := [8, 1, 4, 10, 8, 12, 12], weights := [1, 0, 1, 1] }

-- Period 10, original row 4591, representative 9487.
def source30 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B000.Data.entryAt ⟨39, by decide +kernel⟩

def target30 : Weights.Entry :=
  { word := [8, 1, 8, 9, 4, 12, 12], weights := [1, 0, 1, 1] }

-- Period 10, original row 4595, representative 9482.
def source31 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B000.Data.entryAt ⟨34, by decide +kernel⟩

def target31 : Weights.Entry :=
  { word := [8, 1, 8, 9, 12, 12, 12], weights := [1, 0, 1, 1] }

-- Period 10, original row 4653, representative 9494.
def source32 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B000.Data.entryAt ⟨46, by decide +kernel⟩

def target32 : Weights.Entry :=
  { word := [8, 1, 12, 10, 0, 12, 10], weights := [1, 0, 1, 1] }

-- Period 10, original row 4654, representative 9494.
def source33 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B000.Data.entryAt ⟨46, by decide +kernel⟩

def target33 : Weights.Entry :=
  { word := [8, 1, 12, 10, 0, 12, 12], weights := [1, 0, 1, 1] }

def points33 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 8), (8, 7), (9, 9)]

-- Period 10, original row 4662, representative 9492.
def source34 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B000.Data.entryAt ⟨44, by decide +kernel⟩

def target34 : Weights.Entry :=
  { word := [8, 1, 12, 10, 8, 12, 12], weights := [1, 0, 1, 1] }

-- Period 10, original row 4710, representative 9451.
def source35 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B000.Data.entryAt ⟨3, by decide +kernel⟩

def target35 : Weights.Entry :=
  { word := [8, 2, 0, 9, 8, 4, 6], weights := [0, 3, 1, 0] }

def points35 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2), (9, 0)]

-- Period 10, original row 4713, representative 9461.
def source36 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B000.Data.entryAt ⟨13, by decide +kernel⟩

def target36 : Weights.Entry :=
  { word := [8, 2, 0, 9, 8, 8, 6], weights := [0, 1, 0, 0] }

def points36 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2), (9, 0)]

-- Period 10, original row 4720, representative 9449.
def source37 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B000.Data.entryAt ⟨1, by decide +kernel⟩

def target37 : Weights.Entry :=
  { word := [8, 2, 0, 9, 8, 12, 6], weights := [0, 3, 1, 0] }

def points37 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2), (9, 0)]

-- Period 10, original row 5871, representative 9473.
def source38 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B000.Data.entryAt ⟨25, by decide +kernel⟩

def target38 : Weights.Entry :=
  { word := [8, 9, 0, 4, 0, 12, 12], weights := [1, 0, 1, 2] }

-- Period 10, original row 5897, representative 9465.
def source39 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B000.Data.entryAt ⟨17, by decide +kernel⟩

def target39 : Weights.Entry :=
  { word := [8, 9, 0, 4, 8, 12, 12], weights := [1, 0, 0, 1] }

-- Period 10, original row 5915, representative 9486.
def source40 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B000.Data.entryAt ⟨38, by decide +kernel⟩

def target40 : Weights.Entry :=
  { word := [8, 9, 0, 9, 4, 12, 12], weights := [1, 1, 1, 1] }

-- Period 10, original row 5919, representative 9481.
def source41 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B000.Data.entryAt ⟨33, by decide +kernel⟩

def target41 : Weights.Entry :=
  { word := [8, 9, 0, 9, 12, 12, 12], weights := [1, 1, 1, 1] }

-- Period 10, original row 5931, representative 9474.
def source42 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B000.Data.entryAt ⟨26, by decide +kernel⟩

def target42 : Weights.Entry :=
  { word := [8, 9, 0, 12, 0, 12, 12], weights := [1, 0, 1, 0] }

-- Period 10, original row 5956, representative 9466.
def source43 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B000.Data.entryAt ⟨18, by decide +kernel⟩

def target43 : Weights.Entry :=
  { word := [8, 9, 0, 12, 8, 12, 12], weights := [1, 0, 1, 0] }

-- Period 10, original row 6026, representative 9485.
def source44 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B000.Data.entryAt ⟨37, by decide +kernel⟩

def target44 : Weights.Entry :=
  { word := [8, 9, 8, 9, 4, 12, 12], weights := [1, 1, 1, 1] }

-- Period 10, original row 6030, representative 9480.
def source45 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B000.Data.entryAt ⟨32, by decide +kernel⟩

def target45 : Weights.Entry :=
  { word := [8, 9, 8, 9, 12, 12, 12], weights := [1, 1, 1, 1] }

-- Period 10, original row 6104, representative 9450.
def source46 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B000.Data.entryAt ⟨2, by decide +kernel⟩

def target46 : Weights.Entry :=
  { word := [8, 10, 0, 9, 8, 4, 6], weights := [0, 3, 1, 0] }

def points46 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2), (9, 0)]

-- Period 10, original row 6107, representative 9460.
def source47 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B000.Data.entryAt ⟨12, by decide +kernel⟩

def target47 : Weights.Entry :=
  { word := [8, 10, 0, 9, 8, 8, 6], weights := [0, 1, 0, 0] }

def points47 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2), (9, 0)]

-- Period 10, original row 6114, representative 9448.
def source48 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B000.Data.entryAt ⟨0, by decide +kernel⟩

def target48 : Weights.Entry :=
  { word := [8, 10, 0, 9, 8, 12, 6], weights := [0, 3, 1, 0] }

def points48 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2), (9, 0)]

-- Period 10, original row 7406, representative 9489.
def source49 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B000.Data.entryAt ⟨41, by decide +kernel⟩

def target49 : Weights.Entry :=
  { word := [10, 0, 0, 9, 4, 12, 12], weights := [1, 0, 1, 1] }

def points49 : List (ℕ × ℕ) := [(0, 2), (1, 0), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8), (9, 9)]

-- Period 10, original row 7410, representative 9484.
def source50 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B000.Data.entryAt ⟨36, by decide +kernel⟩

def target50 : Weights.Entry :=
  { word := [10, 0, 0, 9, 12, 12, 12], weights := [1, 0, 1, 1] }

def points50 : List (ℕ × ℕ) := [(0, 2), (1, 0), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8), (9, 9)]

-- Period 10, original row 7420, representative 9478.
def source51 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B000.Data.entryAt ⟨30, by decide +kernel⟩

def target51 : Weights.Entry :=
  { word := [10, 0, 0, 12, 0, 12, 12], weights := [1, 0, 1, 0] }

def points51 : List (ℕ × ℕ) := [(0, 2), (1, 0), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8), (9, 9)]

-- Period 10, original row 7461, representative 9501.
def source52 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B000.Data.entryAt ⟨53, by decide +kernel⟩

def target52 : Weights.Entry :=
  { word := [10, 0, 4, 10, 0, 12, 10], weights := [1, 0, 1, 1] }

-- Period 10, original row 7462, representative 9501.
def source53 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B000.Data.entryAt ⟨53, by decide +kernel⟩

def target53 : Weights.Entry :=
  { word := [10, 0, 4, 10, 0, 12, 12], weights := [1, 0, 1, 1] }

def points53 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 8), (8, 7), (9, 9)]

-- Period 10, original row 7470, representative 9499.
def source54 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B000.Data.entryAt ⟨51, by decide +kernel⟩

def target54 : Weights.Entry :=
  { word := [10, 0, 4, 10, 8, 12, 12], weights := [1, 0, 1, 1] }

-- Period 10, original row 7491, representative 9471.
def source55 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B000.Data.entryAt ⟨23, by decide +kernel⟩

def target55 : Weights.Entry :=
  { word := [10, 0, 8, 4, 8, 12, 12], weights := [1, 0, 0, 1] }

-- Period 10, original row 7495, representative 9488.
def source56 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B000.Data.entryAt ⟨40, by decide +kernel⟩

def target56 : Weights.Entry :=
  { word := [10, 0, 8, 9, 4, 12, 12], weights := [1, 0, 1, 1] }

-- Period 10, original row 7499, representative 9483.
def source57 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B000.Data.entryAt ⟨35, by decide +kernel⟩

def target57 : Weights.Entry :=
  { word := [10, 0, 8, 9, 12, 12, 12], weights := [1, 0, 1, 1] }

-- Period 10, original row 7512, representative 9477.
def source58 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B000.Data.entryAt ⟨29, by decide +kernel⟩

def target58 : Weights.Entry :=
  { word := [10, 0, 8, 12, 0, 12, 10], weights := [1, 0, 1, 0] }

-- Period 10, original row 7513, representative 9477.
def source59 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B000.Data.entryAt ⟨29, by decide +kernel⟩

def target59 : Weights.Entry :=
  { word := [10, 0, 8, 12, 0, 12, 12], weights := [1, 0, 1, 0] }

def points59 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 8), (8, 7), (9, 9)]

-- Period 10, original row 7521, representative 9472.
def source60 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B000.Data.entryAt ⟨24, by decide +kernel⟩

def target60 : Weights.Entry :=
  { word := [10, 0, 8, 12, 8, 12, 12], weights := [1, 0, 1, 0] }

-- Period 10, original row 7532, representative 9510.
def source61 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B000.Data.entryAt ⟨62, by decide +kernel⟩

def target61 : Weights.Entry :=
  { word := [10, 0, 9, 8, 1, 12, 10], weights := [1, 0, 1, 1] }

-- Period 10, original row 7533, representative 9510.
def source62 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B000.Data.entryAt ⟨62, by decide +kernel⟩

def target62 : Weights.Entry :=
  { word := [10, 0, 9, 8, 1, 12, 12], weights := [1, 0, 1, 1] }

def points62 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 8), (8, 7), (9, 9)]

-- Period 10, original row 7537, representative 9505.
def source63 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B000.Data.entryAt ⟨57, by decide +kernel⟩

def target63 : Weights.Entry :=
  { word := [10, 0, 9, 8, 9, 12, 12], weights := [1, 0, 1, 1] }

-- Period 10, original row 7583, representative 9500.
def source64 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B000.Data.entryAt ⟨52, by decide +kernel⟩

def target64 : Weights.Entry :=
  { word := [10, 0, 12, 10, 0, 12, 10], weights := [1, 0, 1, 1] }

-- Period 10, original row 7584, representative 9500.
def source65 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B000.Data.entryAt ⟨52, by decide +kernel⟩

def target65 : Weights.Entry :=
  { word := [10, 0, 12, 10, 0, 12, 12], weights := [1, 0, 1, 1] }

def points65 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 8), (8, 7), (9, 9)]

-- Period 10, original row 7592, representative 9498.
def source66 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B000.Data.entryAt ⟨50, by decide +kernel⟩

def target66 : Weights.Entry :=
  { word := [10, 0, 12, 10, 8, 12, 12], weights := [1, 0, 1, 1] }

-- Period 10, original row 7608, representative 9455.
def source67 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B000.Data.entryAt ⟨7, by decide +kernel⟩

def target67 : Weights.Entry :=
  { word := [10, 2, 0, 9, 8, 8, 6], weights := [1, 1, 0, 1] }

def points67 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2), (9, 0)]

-- Period 10, original row 7711, representative 9454.
def source68 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B000.Data.entryAt ⟨6, by decide +kernel⟩

def target68 : Weights.Entry :=
  { word := [10, 2, 8, 9, 8, 8, 6], weights := [1, 1, 0, 1] }

def points68 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 7844, representative 9467.
def source69 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B000.Data.entryAt ⟨19, by decide +kernel⟩

def target69 : Weights.Entry :=
  { word := [10, 8, 0, 4, 8, 12, 12], weights := [1, 0, 0, 1] }

-- Period 10, original row 7870, representative 9476.
def source70 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B000.Data.entryAt ⟨28, by decide +kernel⟩

def target70 : Weights.Entry :=
  { word := [10, 8, 0, 12, 0, 12, 12], weights := [1, 0, 1, 0] }

-- Period 10, original row 7895, representative 9470.
def source71 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B000.Data.entryAt ⟨22, by decide +kernel⟩

def target71 : Weights.Entry :=
  { word := [10, 8, 0, 12, 8, 12, 12], weights := [1, 0, 1, 0] }

-- Period 10, original row 7962, representative 9497.
def source72 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B000.Data.entryAt ⟨49, by decide +kernel⟩

def target72 : Weights.Entry :=
  { word := [10, 8, 4, 10, 8, 12, 12], weights := [2, 2, 1, 3] }

-- Period 10, original row 8011, representative 9463.
def source73 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B000.Data.entryAt ⟨15, by decide +kernel⟩

def target73 : Weights.Entry :=
  { word := [10, 8, 8, 4, 8, 12, 10], weights := [1, 0, 1, 0] }

-- Period 10, original row 8012, representative 9468.
def source74 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B000.Data.entryAt ⟨20, by decide +kernel⟩

def target74 : Weights.Entry :=
  { word := [10, 8, 8, 4, 8, 12, 12], weights := [1, 0, 0, 1] }

-- Period 10, original row 8037, representative 9511.
def source75 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B000.Data.entryAt ⟨63, by decide +kernel⟩

def target75 : Weights.Entry :=
  { word := [10, 8, 8, 8, 1, 12, 10], weights := [1, 0, 1, 1] }

-- Period 10, original row 8038, representative 9511.
def source76 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B000.Data.entryAt ⟨63, by decide +kernel⟩

def target76 : Weights.Entry :=
  { word := [10, 8, 8, 8, 1, 12, 12], weights := [1, 0, 1, 1] }

def points76 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 8), (8, 7), (9, 9)]

-- Period 10, original row 8042, representative 9506.
def source77 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B000.Data.entryAt ⟨58, by decide +kernel⟩

def target77 : Weights.Entry :=
  { word := [10, 8, 8, 8, 9, 12, 12], weights := [1, 0, 1, 1] }

-- Period 10, original row 8055, representative 9475.
def source78 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B000.Data.entryAt ⟨27, by decide +kernel⟩

def target78 : Weights.Entry :=
  { word := [10, 8, 8, 12, 0, 12, 10], weights := [1, 0, 1, 0] }

-- Period 10, original row 8056, representative 9475.
def source79 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B000.Data.entryAt ⟨27, by decide +kernel⟩

def target79 : Weights.Entry :=
  { word := [10, 8, 8, 12, 0, 12, 12], weights := [1, 0, 1, 0] }

def points79 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 8), (8, 7), (9, 9)]

-- Period 10, original row 8084, representative 9464.
def source80 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B000.Data.entryAt ⟨16, by decide +kernel⟩

def target80 : Weights.Entry :=
  { word := [10, 8, 8, 12, 8, 12, 10], weights := [1, 0, 1, 0] }

-- Period 10, original row 8085, representative 9469.
def source81 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B000.Data.entryAt ⟨21, by decide +kernel⟩

def target81 : Weights.Entry :=
  { word := [10, 8, 8, 12, 8, 12, 12], weights := [1, 0, 1, 0] }

-- Period 10, original row 8112, representative 9508.
def source82 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B000.Data.entryAt ⟨60, by decide +kernel⟩

def target82 : Weights.Entry :=
  { word := [10, 8, 9, 8, 1, 12, 10], weights := [1, 0, 1, 1] }

-- Period 10, original row 8113, representative 9508.
def source83 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B000.Data.entryAt ⟨60, by decide +kernel⟩

def target83 : Weights.Entry :=
  { word := [10, 8, 9, 8, 1, 12, 12], weights := [1, 0, 1, 1] }

def points83 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 8), (8, 7), (9, 9)]

-- Period 10, original row 8117, representative 9503.
def source84 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B000.Data.entryAt ⟨55, by decide +kernel⟩

def target84 : Weights.Entry :=
  { word := [10, 8, 9, 8, 9, 12, 12], weights := [1, 0, 1, 1] }

-- Period 10, original row 8172, representative 9496.
def source85 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B000.Data.entryAt ⟨48, by decide +kernel⟩

def target85 : Weights.Entry :=
  { word := [10, 8, 12, 10, 8, 12, 12], weights := [2, 1, 1, 2] }

-- Period 10, original row 8184, representative 9473.
def source86 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B000.Data.entryAt ⟨25, by decide +kernel⟩

def target86 : Weights.Entry :=
  { word := [10, 10, 0, 2, 0, 8, 9], weights := [2, 1, 0, 1] }

def points86 : List (ℕ × ℕ) := [(0, 9), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8191, representative 9510.
def source87 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B000.Data.entryAt ⟨62, by decide +kernel⟩

def target87 : Weights.Entry :=
  { word := [10, 10, 0, 9, 8, 1, 12], weights := [1, 1, 0, 1] }

def points87 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2), (9, 0)]

-- Period 10, original row 8193, representative 9509.
def source88 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B000.Data.entryAt ⟨61, by decide +kernel⟩

def target88 : Weights.Entry :=
  { word := [10, 10, 0, 9, 8, 2, 10], weights := [1, 1, 0, 1] }

-- Period 10, original row 8195, representative 9453.
def source89 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B000.Data.entryAt ⟨5, by decide +kernel⟩

def target89 : Weights.Entry :=
  { word := [10, 10, 0, 9, 8, 8, 6], weights := [1, 1, 0, 1] }

def points89 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2), (9, 0)]

-- Period 10, original row 8196, representative 9511.
def source90 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B000.Data.entryAt ⟨63, by decide +kernel⟩

def target90 : Weights.Entry :=
  { word := [10, 10, 0, 9, 8, 8, 12], weights := [1, 1, 0, 1] }

def points90 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2), (9, 0)]

-- Period 10, original row 8198, representative 9508.
def source91 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B000.Data.entryAt ⟨60, by decide +kernel⟩

def target91 : Weights.Entry :=
  { word := [10, 10, 0, 9, 8, 9, 12], weights := [1, 1, 0, 1] }

def points91 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2), (9, 0)]

-- Period 10, original row 8200, representative 9507.
def source92 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B000.Data.entryAt ⟨59, by decide +kernel⟩

def target92 : Weights.Entry :=
  { word := [10, 10, 0, 9, 8, 10, 10], weights := [1, 1, 0, 1] }

-- Period 10, original row 8205, representative 9478.
def source93 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B000.Data.entryAt ⟨30, by decide +kernel⟩

def target93 : Weights.Entry :=
  { word := [10, 10, 0, 10, 0, 0, 9], weights := [0, 1, 0, 1] }

def points93 : List (ℕ × ℕ) := [(0, 9), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8206, representative 9478.
def source94 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B000.Data.entryAt ⟨30, by decide +kernel⟩

def target94 : Weights.Entry :=
  { word := [10, 10, 0, 10, 0, 0, 10], weights := [0, 1, 0, 1] }

def points94 : List (ℕ × ℕ) := [(0, 8), (1, 7), (2, 9), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8207, representative 9478.
def source95 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B000.Data.entryAt ⟨30, by decide +kernel⟩

def target95 : Weights.Entry :=
  { word := [10, 10, 0, 10, 0, 0, 12], weights := [0, 1, 0, 1] }

def points95 : List (ℕ × ℕ) := [(0, 7), (1, 8), (2, 9), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8212, representative 9474.
def source96 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B000.Data.entryAt ⟨26, by decide +kernel⟩

def target96 : Weights.Entry :=
  { word := [10, 10, 0, 10, 0, 8, 9], weights := [0, 1, 0, 1] }

def points96 : List (ℕ × ℕ) := [(0, 9), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8213, representative 9476.
def source97 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B000.Data.entryAt ⟨28, by decide +kernel⟩

def target97 : Weights.Entry :=
  { word := [10, 10, 0, 10, 0, 8, 12], weights := [0, 1, 0, 1] }

def points97 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8215, representative 9477.
def source98 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B000.Data.entryAt ⟨29, by decide +kernel⟩

def target98 : Weights.Entry :=
  { word := [10, 10, 0, 10, 8, 0, 12], weights := [0, 1, 0, 1] }

def points98 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2), (9, 0)]

-- Period 10, original row 8217, representative 9475.
def source99 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B000.Data.entryAt ⟨27, by decide +kernel⟩

def target99 : Weights.Entry :=
  { word := [10, 10, 0, 10, 8, 8, 12], weights := [0, 1, 0, 1] }

def points99 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2), (9, 0)]

-- Period 10, original row 8222, representative 9495.
def source100 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B000.Data.entryAt ⟨47, by decide +kernel⟩

def target100 : Weights.Entry :=
  { word := [10, 10, 0, 12, 2, 0, 9], weights := [1, 1, 0, 1] }

def points100 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2), (9, 0)]

-- Period 10, original row 8223, representative 9495.
def source101 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B000.Data.entryAt ⟨47, by decide +kernel⟩

def target101 : Weights.Entry :=
  { word := [10, 10, 0, 12, 2, 0, 10], weights := [1, 1, 0, 1] }

def points101 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2), (9, 0)]

-- Period 10, original row 8224, representative 9501.
def source102 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B000.Data.entryAt ⟨53, by decide +kernel⟩

def target102 : Weights.Entry :=
  { word := [10, 10, 0, 12, 2, 0, 12], weights := [1, 1, 0, 1] }

def points102 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2), (9, 0)]

-- Period 10, original row 8230, representative 9494.
def source103 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B000.Data.entryAt ⟨46, by decide +kernel⟩

def target103 : Weights.Entry :=
  { word := [10, 10, 0, 12, 10, 0, 9], weights := [1, 1, 0, 1] }

def points103 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2), (9, 0)]

-- Period 10, original row 8231, representative 9494.
def source104 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B000.Data.entryAt ⟨46, by decide +kernel⟩

def target104 : Weights.Entry :=
  { word := [10, 10, 0, 12, 10, 0, 10], weights := [1, 1, 0, 1] }

def points104 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2), (9, 0)]

-- Period 10, original row 8232, representative 9500.
def source105 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B000.Data.entryAt ⟨52, by decide +kernel⟩

def target105 : Weights.Entry :=
  { word := [10, 10, 0, 12, 10, 0, 12], weights := [1, 1, 0, 1] }

def points105 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2), (9, 0)]

-- Period 10, original row 8238, representative 9489.
def source106 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B000.Data.entryAt ⟨41, by decide +kernel⟩

def target106 : Weights.Entry :=
  { word := [10, 10, 2, 8, 1, 0, 9], weights := [1, 1, 0, 1] }

def points106 : List (ℕ × ℕ) := [(0, 9), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8239, representative 9489.
def source107 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B000.Data.entryAt ⟨41, by decide +kernel⟩

def target107 : Weights.Entry :=
  { word := [10, 10, 2, 8, 1, 0, 10], weights := [1, 1, 0, 1] }

def points107 : List (ℕ × ℕ) := [(0, 8), (1, 7), (2, 9), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8240, representative 9489.
def source108 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B000.Data.entryAt ⟨41, by decide +kernel⟩

def target108 : Weights.Entry :=
  { word := [10, 10, 2, 8, 1, 0, 12], weights := [1, 1, 0, 1] }

def points108 : List (ℕ × ℕ) := [(0, 7), (1, 8), (2, 9), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8243, representative 9486.
def source109 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B000.Data.entryAt ⟨38, by decide +kernel⟩

def target109 : Weights.Entry :=
  { word := [10, 10, 2, 8, 1, 8, 9], weights := [1, 1, 1, 1] }

def points109 : List (ℕ × ℕ) := [(0, 9), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8252, representative 9487.
def source110 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B000.Data.entryAt ⟨39, by decide +kernel⟩

def target110 : Weights.Entry :=
  { word := [10, 10, 2, 8, 9, 0, 9], weights := [1, 1, 0, 1] }

def points110 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8253, representative 9487.
def source111 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B000.Data.entryAt ⟨39, by decide +kernel⟩

def target111 : Weights.Entry :=
  { word := [10, 10, 2, 8, 9, 0, 10], weights := [1, 1, 0, 1] }

def points111 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8254, representative 9488.
def source112 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B000.Data.entryAt ⟨40, by decide +kernel⟩

def target112 : Weights.Entry :=
  { word := [10, 10, 2, 8, 9, 0, 12], weights := [1, 1, 0, 1] }

def points112 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8257, representative 9485.
def source113 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B000.Data.entryAt ⟨37, by decide +kernel⟩

def target113 : Weights.Entry :=
  { word := [10, 10, 2, 8, 9, 8, 9], weights := [1, 1, 1, 1] }

def points113 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8270, representative 9465.
def source114 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B000.Data.entryAt ⟨17, by decide +kernel⟩

def target114 : Weights.Entry :=
  { word := [10, 10, 8, 2, 0, 8, 9], weights := [1, 0, 0, 1] }

def points114 : List (ℕ × ℕ) := [(0, 9), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8271, representative 9467.
def source115 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B000.Data.entryAt ⟨19, by decide +kernel⟩

def target115 : Weights.Entry :=
  { word := [10, 10, 8, 2, 0, 8, 10], weights := [1, 0, 0, 1] }

def points115 : List (ℕ × ℕ) := [(0, 9), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8272, representative 9467.
def source116 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B000.Data.entryAt ⟨19, by decide +kernel⟩

def target116 : Weights.Entry :=
  { word := [10, 10, 8, 2, 0, 8, 12], weights := [1, 0, 0, 1] }

def points116 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8278, representative 9471.
def source117 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B000.Data.entryAt ⟨23, by decide +kernel⟩

def target117 : Weights.Entry :=
  { word := [10, 10, 8, 2, 8, 0, 12], weights := [1, 0, 0, 1] }

def points117 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8282, representative 9468.
def source118 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B000.Data.entryAt ⟨20, by decide +kernel⟩

def target118 : Weights.Entry :=
  { word := [10, 10, 8, 2, 8, 8, 12], weights := [1, 0, 0, 1] }

def points118 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8300, representative 9505.
def source119 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B000.Data.entryAt ⟨57, by decide +kernel⟩

def target119 : Weights.Entry :=
  { word := [10, 10, 8, 9, 8, 1, 12], weights := [1, 1, 0, 1] }

def points119 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8302, representative 9504.
def source120 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B000.Data.entryAt ⟨56, by decide +kernel⟩

def target120 : Weights.Entry :=
  { word := [10, 10, 8, 9, 8, 2, 10], weights := [1, 1, 0, 1] }

-- Period 10, original row 8304, representative 9452.
def source121 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B000.Data.entryAt ⟨4, by decide +kernel⟩

def target121 : Weights.Entry :=
  { word := [10, 10, 8, 9, 8, 8, 6], weights := [1, 1, 0, 1] }

def points121 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8305, representative 9506.
def source122 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B000.Data.entryAt ⟨58, by decide +kernel⟩

def target122 : Weights.Entry :=
  { word := [10, 10, 8, 9, 8, 8, 12], weights := [1, 1, 0, 1] }

def points122 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8307, representative 9503.
def source123 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B000.Data.entryAt ⟨55, by decide +kernel⟩

def target123 : Weights.Entry :=
  { word := [10, 10, 8, 9, 8, 9, 12], weights := [1, 1, 0, 1] }

def points123 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8309, representative 9502.
def source124 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B000.Data.entryAt ⟨54, by decide +kernel⟩

def target124 : Weights.Entry :=
  { word := [10, 10, 8, 9, 8, 10, 10], weights := [1, 1, 0, 1] }

-- Period 10, original row 8320, representative 9466.
def source125 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B000.Data.entryAt ⟨18, by decide +kernel⟩

def target125 : Weights.Entry :=
  { word := [10, 10, 8, 10, 0, 8, 9], weights := [0, 1, 0, 1] }

def points125 : List (ℕ × ℕ) := [(0, 9), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8321, representative 9470.
def source126 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B000.Data.entryAt ⟨22, by decide +kernel⟩

def target126 : Weights.Entry :=
  { word := [10, 10, 8, 10, 0, 8, 10], weights := [0, 1, 0, 1] }

def points126 : List (ℕ × ℕ) := [(0, 9), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8322, representative 9470.
def source127 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B000.Data.entryAt ⟨22, by decide +kernel⟩

def target127 : Weights.Entry :=
  { word := [10, 10, 8, 10, 0, 8, 12], weights := [0, 1, 0, 1] }

def points127 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

def period10Entries : List Weights.Entry := [target0, target1, target2, target3, target4, target5, target6, target7, target8, target9, target10, target11, target12, target13, target14, target15, target16, target17, target18, target19, target20, target21, target22, target23, target24, target25, target26, target27, target28, target29, target30, target31, target32, target33, target34, target35, target36, target37, target38, target39, target40, target41, target42, target43, target44, target45, target46, target47, target48, target49, target50, target51, target52, target53, target54, target55, target56, target57, target58, target59, target60, target61, target62, target63, target64, target65, target66, target67, target68, target69, target70, target71, target72, target73, target74, target75, target76, target77, target78, target79, target80, target81, target82, target83, target84, target85, target86, target87, target88, target89, target90, target91, target92, target93, target94, target95, target96, target97, target98, target99, target100, target101, target102, target103, target104, target105, target106, target107, target108, target109, target110, target111, target112, target113, target114, target115, target116, target117, target118, target119, target120, target121, target122, target123, target124, target125, target126, target127]

def period10Chunk : RowCoverage.Chunk where
  rows := [⟨2592, target0⟩, ⟨2697, target1⟩, ⟨3181, target2⟩, ⟨3292, target3⟩, ⟨3578, target4⟩, ⟨3982, target5⟩, ⟨4079, target6⟩, ⟨4080, target7⟩, ⟨4081, target8⟩, ⟨4082, target9⟩, ⟨4083, target10⟩, ⟨4084, target11⟩, ⟨4085, target12⟩, ⟨4086, target13⟩, ⟨4087, target14⟩, ⟨4088, target15⟩, ⟨4089, target16⟩, ⟨4090, target17⟩, ⟨4091, target18⟩, ⟨4092, target19⟩, ⟨4093, target20⟩, ⟨4094, target21⟩, ⟨4095, target22⟩, ⟨4096, target23⟩, ⟨4500, target24⟩, ⟨4504, target25⟩, ⟨4514, target26⟩, ⟨4560, target27⟩, ⟨4561, target28⟩, ⟨4569, target29⟩, ⟨4591, target30⟩, ⟨4595, target31⟩, ⟨4653, target32⟩, ⟨4654, target33⟩, ⟨4662, target34⟩, ⟨4710, target35⟩, ⟨4713, target36⟩, ⟨4720, target37⟩, ⟨5871, target38⟩, ⟨5897, target39⟩, ⟨5915, target40⟩, ⟨5919, target41⟩, ⟨5931, target42⟩, ⟨5956, target43⟩, ⟨6026, target44⟩, ⟨6030, target45⟩, ⟨6104, target46⟩, ⟨6107, target47⟩, ⟨6114, target48⟩, ⟨7406, target49⟩, ⟨7410, target50⟩, ⟨7420, target51⟩, ⟨7461, target52⟩, ⟨7462, target53⟩, ⟨7470, target54⟩, ⟨7491, target55⟩, ⟨7495, target56⟩, ⟨7499, target57⟩, ⟨7512, target58⟩, ⟨7513, target59⟩, ⟨7521, target60⟩, ⟨7532, target61⟩, ⟨7533, target62⟩, ⟨7537, target63⟩, ⟨7583, target64⟩, ⟨7584, target65⟩, ⟨7592, target66⟩, ⟨7608, target67⟩, ⟨7711, target68⟩, ⟨7844, target69⟩, ⟨7870, target70⟩, ⟨7895, target71⟩, ⟨7962, target72⟩, ⟨8011, target73⟩, ⟨8012, target74⟩, ⟨8037, target75⟩, ⟨8038, target76⟩, ⟨8042, target77⟩, ⟨8055, target78⟩, ⟨8056, target79⟩, ⟨8084, target80⟩, ⟨8085, target81⟩, ⟨8112, target82⟩, ⟨8113, target83⟩, ⟨8117, target84⟩, ⟨8172, target85⟩, ⟨8184, target86⟩, ⟨8191, target87⟩, ⟨8193, target88⟩, ⟨8195, target89⟩, ⟨8196, target90⟩, ⟨8198, target91⟩, ⟨8200, target92⟩, ⟨8205, target93⟩, ⟨8206, target94⟩, ⟨8207, target95⟩, ⟨8212, target96⟩, ⟨8213, target97⟩, ⟨8215, target98⟩, ⟨8217, target99⟩, ⟨8222, target100⟩, ⟨8223, target101⟩, ⟨8224, target102⟩, ⟨8230, target103⟩, ⟨8231, target104⟩, ⟨8232, target105⟩, ⟨8238, target106⟩, ⟨8239, target107⟩, ⟨8240, target108⟩, ⟨8243, target109⟩, ⟨8252, target110⟩, ⟨8253, target111⟩, ⟨8254, target112⟩, ⟨8257, target113⟩, ⟨8270, target114⟩, ⟨8271, target115⟩, ⟨8272, target116⟩, ⟨8278, target117⟩, ⟨8282, target118⟩, ⟨8300, target119⟩, ⟨8302, target120⟩, ⟨8304, target121⟩, ⟨8305, target122⟩, ⟨8307, target123⟩, ⟨8309, target124⟩, ⟨8320, target125⟩, ⟨8321, target126⟩, ⟨8322, target127⟩]
  indexMask := 2598381800952778610377701200242025971804294304844776155465127393018178544781254754076843238148534211476682512982212737152068152563908234736779825136081172766084180861860741761858076601035642997249365337724851641583249692408346512921382583392083408841628190905845044063123539475470121187632820166920187748008417706495613747734876441608216554995425283617106573626258606772735179105575404623989749893663349378132148320872031290377769693683744276153985795442363098276174095614116992547762021668442448105883277905438130957606958768379058874333110208996064704021459048130258833160557938098457307531249528586798956599691273036907111928137252150344909724416924787174783117517753134809658933377836679055948671137776063537788247830278229292111301414579135629467901244004837806142505964846898100223877770410155757569708386045991206184173284219016554660133570933267797674642911547262176526840175508899972351401442522335182087066666566925616174985146820153928768298488269507278222118955059081430153050911706151628878637439210184399408329347753373893912517154927968262758905403275837313759388790065883974586513468632239161159826987849009807148004611693354205895663420171898637967852852501332523687793141176036010601389555637431343974829518285336854177707282007093796089687867544004023018829296179171449590704129048879362966590540019095595369895692721056072060669608714364790087541670477265523260680694228922148986648154169492167554883933299342039895071841351940625415915255978433700241677067642791380051525026194871577256674004170323220557780824808950531435134211781640958808917253092685524672948321925704037837049053934435327600713393842266200696978842543808329569578570542648913870448575044440888470562730492903156962232380636489940746226311358360459447316161555496039873158750234957944390557952669811192602502472411201513927645914322911707402729677024969358340583282175084174718575869371447796638445900802573844304552037948629723570175692226100933394608399936731903738294552684507564846499319057571552879680573485711023036813443818281456441863589424321024041566684288512853480540917519869855501882356342197914742390769051885848682179055894059769270725444093946574272339868744498854605873484280678363010790172370993949763086351342457406216018197699555219188051892412222710732822374095011563594314982545523131668619974536984323965315870278420997465278045714695991446515624900791505319478136365373681120806566629599466037193261937413093646542094435774914018766354856464458203449879607573495970302217411414331139123314688
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

end FranklSmallCyclic.TransportBatches.G078.B000.Data
