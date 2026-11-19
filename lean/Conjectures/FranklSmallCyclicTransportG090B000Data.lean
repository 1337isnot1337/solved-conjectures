module

public import Conjectures.FranklSmallCyclicRowCoverage
public import Conjectures.FranklSmallCyclicCanonicalWords
public import Conjectures.FranklSmallCyclicOrbit10Block012Data

/-! 128 literal targets sharing one source proof block.
Original words and row indices are retained; weights may be transported.
-/
@[expose] public section

namespace FranklSmallCyclic.TransportBatches.G090.B000.Data

-- Period 10, original row 4134, representative 10219.
def source0 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B012.Data.entryAt ⟨3, by decide +kernel⟩

def target0 : Weights.Entry :=
  { word := [8, 0, 1, 4, 2, 8, 12], weights := [1, 0, 0, 1] }

-- Period 10, original row 4156, representative 10220.
def source1 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B012.Data.entryAt ⟨4, by decide +kernel⟩

def target1 : Weights.Entry :=
  { word := [8, 0, 1, 4, 10, 8, 12], weights := [1, 0, 0, 1] }

-- Period 10, original row 4169, representative 10218.
def source2 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B012.Data.entryAt ⟨2, by decide +kernel⟩

def target2 : Weights.Entry :=
  { word := [8, 0, 1, 12, 2, 8, 10], weights := [1, 0, 1, 0] }

-- Period 10, original row 4170, representative 10226.
def source3 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B012.Data.entryAt ⟨10, by decide +kernel⟩

def target3 : Weights.Entry :=
  { word := [8, 0, 1, 12, 2, 8, 12], weights := [1, 0, 1, 0] }

-- Period 10, original row 4192, representative 10223.
def source4 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B012.Data.entryAt ⟨7, by decide +kernel⟩

def target4 : Weights.Entry :=
  { word := [8, 0, 1, 12, 10, 8, 12], weights := [1, 0, 1, 0] }

-- Period 10, original row 4263, representative 10255.
def source5 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B012.Data.entryAt ⟨39, by decide +kernel⟩

def target5 : Weights.Entry :=
  { word := [8, 0, 4, 2, 0, 8, 10], weights := [1, 0, 0, 1] }

-- Period 10, original row 4264, representative 10255.
def source6 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B012.Data.entryAt ⟨39, by decide +kernel⟩

def target6 : Weights.Entry :=
  { word := [8, 0, 4, 2, 0, 8, 12], weights := [1, 0, 0, 1] }

def points6 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 8), (8, 7), (9, 9)]

-- Period 10, original row 4272, representative 10256.
def source7 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B012.Data.entryAt ⟨40, by decide +kernel⟩

def target7 : Weights.Entry :=
  { word := [8, 0, 4, 2, 8, 8, 12], weights := [1, 0, 0, 1] }

-- Period 10, original row 4295, representative 10262.
def source8 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B012.Data.entryAt ⟨46, by decide +kernel⟩

def target8 : Weights.Entry :=
  { word := [8, 0, 4, 10, 0, 8, 10], weights := [1, 0, 0, 1] }

-- Period 10, original row 4296, representative 10262.
def source9 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B012.Data.entryAt ⟨46, by decide +kernel⟩

def target9 : Weights.Entry :=
  { word := [8, 0, 4, 10, 0, 8, 12], weights := [1, 0, 0, 1] }

def points9 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 8), (8, 7), (9, 9)]

-- Period 10, original row 4308, representative 10259.
def source10 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B012.Data.entryAt ⟨43, by decide +kernel⟩

def target10 : Weights.Entry :=
  { word := [8, 0, 4, 10, 8, 8, 12], weights := [1, 0, 0, 1] }

-- Period 10, original row 4436, representative 10260.
def source11 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B012.Data.entryAt ⟨44, by decide +kernel⟩

def target11 : Weights.Entry :=
  { word := [8, 0, 12, 2, 0, 8, 10], weights := [1, 0, 0, 1] }

-- Period 10, original row 4437, representative 10260.
def source12 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B012.Data.entryAt ⟨44, by decide +kernel⟩

def target12 : Weights.Entry :=
  { word := [8, 0, 12, 2, 0, 8, 12], weights := [1, 0, 0, 1] }

def points12 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 8), (8, 7), (9, 9)]

-- Period 10, original row 4445, representative 10257.
def source13 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B012.Data.entryAt ⟨41, by decide +kernel⟩

def target13 : Weights.Entry :=
  { word := [8, 0, 12, 2, 8, 8, 12], weights := [1, 0, 0, 1] }

-- Period 10, original row 4471, representative 10261.
def source14 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B012.Data.entryAt ⟨45, by decide +kernel⟩

def target14 : Weights.Entry :=
  { word := [8, 0, 12, 10, 0, 8, 10], weights := [1, 0, 0, 1] }

-- Period 10, original row 4472, representative 10261.
def source15 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B012.Data.entryAt ⟨45, by decide +kernel⟩

def target15 : Weights.Entry :=
  { word := [8, 0, 12, 10, 0, 8, 12], weights := [1, 0, 0, 1] }

def points15 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 8), (8, 7), (9, 9)]

-- Period 10, original row 4484, representative 10258.
def source16 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B012.Data.entryAt ⟨42, by decide +kernel⟩

def target16 : Weights.Entry :=
  { word := [8, 0, 12, 10, 8, 8, 12], weights := [1, 0, 0, 1] }

-- Period 10, original row 4528, representative 10265.
def source17 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B012.Data.entryAt ⟨49, by decide +kernel⟩

def target17 : Weights.Entry :=
  { word := [8, 1, 4, 2, 0, 9, 8], weights := [1, 0, 0, 1] }

-- Period 10, original row 4530, representative 10265.
def source18 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B012.Data.entryAt ⟨49, by decide +kernel⟩

def target18 : Weights.Entry :=
  { word := [8, 1, 4, 2, 0, 10, 8], weights := [1, 0, 0, 1] }

def points18 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 8), (8, 7), (9, 9)]

-- Period 10, original row 4536, representative 10270.
def source19 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B012.Data.entryAt ⟨54, by decide +kernel⟩

def target19 : Weights.Entry :=
  { word := [8, 1, 4, 2, 8, 10, 8], weights := [1, 0, 0, 1] }

-- Period 10, original row 4544, representative 10264.
def source20 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B012.Data.entryAt ⟨48, by decide +kernel⟩

def target20 : Weights.Entry :=
  { word := [8, 1, 4, 8, 4, 10, 8], weights := [0, 1, 1, 0] }

-- Period 10, original row 4555, representative 10272.
def source21 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B012.Data.entryAt ⟨56, by decide +kernel⟩

def target21 : Weights.Entry :=
  { word := [8, 1, 4, 10, 0, 9, 8], weights := [1, 0, 0, 1] }

-- Period 10, original row 4556, representative 10272.
def source22 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B012.Data.entryAt ⟨56, by decide +kernel⟩

def target22 : Weights.Entry :=
  { word := [8, 1, 4, 10, 0, 10, 8], weights := [1, 0, 0, 1] }

def points22 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 8), (8, 7), (9, 9)]

-- Period 10, original row 4567, representative 10271.
def source23 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B012.Data.entryAt ⟨55, by decide +kernel⟩

def target23 : Weights.Entry :=
  { word := [8, 1, 4, 10, 8, 10, 8], weights := [0, 1, 1, 0] }

-- Period 10, original row 4617, representative 10266.
def source24 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B012.Data.entryAt ⟨50, by decide +kernel⟩

def target24 : Weights.Entry :=
  { word := [8, 1, 12, 2, 0, 9, 8], weights := [1, 0, 0, 1] }

-- Period 10, original row 4619, representative 10266.
def source25 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B012.Data.entryAt ⟨50, by decide +kernel⟩

def target25 : Weights.Entry :=
  { word := [8, 1, 12, 2, 0, 10, 8], weights := [1, 0, 0, 1] }

def points25 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 8), (8, 7), (9, 9)]

-- Period 10, original row 4625, representative 10267.
def source26 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B012.Data.entryAt ⟨51, by decide +kernel⟩

def target26 : Weights.Entry :=
  { word := [8, 1, 12, 2, 8, 10, 8], weights := [1, 0, 0, 1] }

-- Period 10, original row 4633, representative 10263.
def source27 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B012.Data.entryAt ⟨47, by decide +kernel⟩

def target27 : Weights.Entry :=
  { word := [8, 1, 12, 8, 4, 10, 8], weights := [0, 1, 1, 0] }

-- Period 10, original row 4648, representative 10269.
def source28 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B012.Data.entryAt ⟨53, by decide +kernel⟩

def target28 : Weights.Entry :=
  { word := [8, 1, 12, 10, 0, 9, 8], weights := [1, 0, 0, 1] }

-- Period 10, original row 4649, representative 10269.
def source29 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B012.Data.entryAt ⟨53, by decide +kernel⟩

def target29 : Weights.Entry :=
  { word := [8, 1, 12, 10, 0, 10, 8], weights := [1, 0, 0, 1] }

def points29 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 8), (8, 7), (9, 9)]

-- Period 10, original row 4660, representative 10268.
def source30 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B012.Data.entryAt ⟨52, by decide +kernel⟩

def target30 : Weights.Entry :=
  { word := [8, 1, 12, 10, 8, 10, 8], weights := [0, 1, 1, 0] }

-- Period 10, original row 5013, representative 10219.
def source31 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B012.Data.entryAt ⟨3, by decide +kernel⟩

def target31 : Weights.Entry :=
  { word := [8, 4, 0, 4, 2, 8, 12], weights := [1, 0, 0, 1] }

def points31 : List (ℕ × ℕ) := [(0, 0), (1, 2), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8), (9, 9)]

-- Period 10, original row 5035, representative 10220.
def source32 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B012.Data.entryAt ⟨4, by decide +kernel⟩

def target32 : Weights.Entry :=
  { word := [8, 4, 0, 4, 10, 8, 12], weights := [1, 0, 0, 1] }

def points32 : List (ℕ × ℕ) := [(0, 0), (1, 2), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8), (9, 9)]

-- Period 10, original row 5048, representative 10218.
def source33 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B012.Data.entryAt ⟨2, by decide +kernel⟩

def target33 : Weights.Entry :=
  { word := [8, 4, 0, 12, 2, 8, 10], weights := [1, 0, 1, 0] }

def points33 : List (ℕ × ℕ) := [(0, 0), (1, 2), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8), (9, 9)]

-- Period 10, original row 5049, representative 10226.
def source34 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B012.Data.entryAt ⟨10, by decide +kernel⟩

def target34 : Weights.Entry :=
  { word := [8, 4, 0, 12, 2, 8, 12], weights := [1, 0, 1, 0] }

def points34 : List (ℕ × ℕ) := [(0, 0), (1, 2), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8), (9, 9)]

-- Period 10, original row 5071, representative 10223.
def source35 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B012.Data.entryAt ⟨7, by decide +kernel⟩

def target35 : Weights.Entry :=
  { word := [8, 4, 0, 12, 10, 8, 12], weights := [1, 0, 1, 0] }

def points35 : List (ℕ × ℕ) := [(0, 0), (1, 2), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8), (9, 9)]

-- Period 10, original row 5108, representative 10227.
def source36 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B012.Data.entryAt ⟨11, by decide +kernel⟩

def target36 : Weights.Entry :=
  { word := [8, 4, 4, 4, 0, 8, 10], weights := [1, 0, 0, 1] }

-- Period 10, original row 5109, representative 10227.
def source37 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B012.Data.entryAt ⟨11, by decide +kernel⟩

def target37 : Weights.Entry :=
  { word := [8, 4, 4, 4, 0, 8, 12], weights := [1, 0, 0, 1] }

def points37 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 8), (8, 7), (9, 9)]

-- Period 10, original row 5122, representative 10228.
def source38 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B012.Data.entryAt ⟨12, by decide +kernel⟩

def target38 : Weights.Entry :=
  { word := [8, 4, 4, 4, 8, 8, 10], weights := [1, 0, 1, 0] }

-- Period 10, original row 5123, representative 10232.
def source39 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B012.Data.entryAt ⟨16, by decide +kernel⟩

def target39 : Weights.Entry :=
  { word := [8, 4, 4, 4, 8, 8, 12], weights := [1, 0, 0, 1] }

-- Period 10, original row 5136, representative 10238.
def source40 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B012.Data.entryAt ⟨22, by decide +kernel⟩

def target40 : Weights.Entry :=
  { word := [8, 4, 4, 12, 0, 8, 10], weights := [1, 0, 1, 0] }

-- Period 10, original row 5137, representative 10238.
def source41 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B012.Data.entryAt ⟨22, by decide +kernel⟩

def target41 : Weights.Entry :=
  { word := [8, 4, 4, 12, 0, 8, 12], weights := [1, 0, 1, 0] }

def points41 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 8), (8, 7), (9, 9)]

-- Period 10, original row 5150, representative 10231.
def source42 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B012.Data.entryAt ⟨15, by decide +kernel⟩

def target42 : Weights.Entry :=
  { word := [8, 4, 4, 12, 8, 8, 10], weights := [1, 0, 1, 0] }

-- Period 10, original row 5151, representative 10235.
def source43 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B012.Data.entryAt ⟨19, by decide +kernel⟩

def target43 : Weights.Entry :=
  { word := [8, 4, 4, 12, 8, 8, 12], weights := [1, 0, 1, 0] }

-- Period 10, original row 5167, representative 10216.
def source44 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B012.Data.entryAt ⟨0, by decide +kernel⟩

def target44 : Weights.Entry :=
  { word := [8, 4, 8, 4, 2, 8, 10], weights := [1, 0, 1, 0] }

-- Period 10, original row 5168, representative 10224.
def source45 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B012.Data.entryAt ⟨8, by decide +kernel⟩

def target45 : Weights.Entry :=
  { word := [8, 4, 8, 4, 2, 8, 12], weights := [1, 0, 0, 1] }

-- Period 10, original row 5194, representative 10221.
def source46 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B012.Data.entryAt ⟨5, by decide +kernel⟩

def target46 : Weights.Entry :=
  { word := [8, 4, 8, 4, 10, 8, 12], weights := [1, 0, 0, 1] }

-- Period 10, original row 5209, representative 10217.
def source47 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B012.Data.entryAt ⟨1, by decide +kernel⟩

def target47 : Weights.Entry :=
  { word := [8, 4, 8, 12, 2, 8, 10], weights := [1, 0, 1, 0] }

-- Period 10, original row 5210, representative 10225.
def source48 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B012.Data.entryAt ⟨9, by decide +kernel⟩

def target48 : Weights.Entry :=
  { word := [8, 4, 8, 12, 2, 8, 12], weights := [1, 0, 1, 0] }

-- Period 10, original row 5236, representative 10222.
def source49 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B012.Data.entryAt ⟨6, by decide +kernel⟩

def target49 : Weights.Entry :=
  { word := [8, 4, 8, 12, 10, 8, 12], weights := [1, 0, 1, 0] }

-- Period 10, original row 5258, representative 10236.
def source50 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B012.Data.entryAt ⟨20, by decide +kernel⟩

def target50 : Weights.Entry :=
  { word := [8, 4, 12, 4, 0, 8, 10], weights := [1, 0, 0, 1] }

-- Period 10, original row 5259, representative 10236.
def source51 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B012.Data.entryAt ⟨20, by decide +kernel⟩

def target51 : Weights.Entry :=
  { word := [8, 4, 12, 4, 0, 8, 12], weights := [1, 0, 0, 1] }

def points51 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 8), (8, 7), (9, 9)]

-- Period 10, original row 5272, representative 10229.
def source52 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B012.Data.entryAt ⟨13, by decide +kernel⟩

def target52 : Weights.Entry :=
  { word := [8, 4, 12, 4, 8, 8, 10], weights := [1, 0, 1, 0] }

-- Period 10, original row 5273, representative 10233.
def source53 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B012.Data.entryAt ⟨17, by decide +kernel⟩

def target53 : Weights.Entry :=
  { word := [8, 4, 12, 4, 8, 8, 12], weights := [1, 0, 0, 1] }

-- Period 10, original row 5279, representative 10237.
def source54 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B012.Data.entryAt ⟨21, by decide +kernel⟩

def target54 : Weights.Entry :=
  { word := [8, 4, 12, 12, 0, 8, 10], weights := [1, 0, 1, 0] }

-- Period 10, original row 5280, representative 10237.
def source55 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B012.Data.entryAt ⟨21, by decide +kernel⟩

def target55 : Weights.Entry :=
  { word := [8, 4, 12, 12, 0, 8, 12], weights := [1, 0, 1, 0] }

def points55 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 8), (8, 7), (9, 9)]

-- Period 10, original row 5293, representative 10230.
def source56 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B012.Data.entryAt ⟨14, by decide +kernel⟩

def target56 : Weights.Entry :=
  { word := [8, 4, 12, 12, 8, 8, 10], weights := [1, 0, 1, 0] }

-- Period 10, original row 5294, representative 10234.
def source57 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B012.Data.entryAt ⟨18, by decide +kernel⟩

def target57 : Weights.Entry :=
  { word := [8, 4, 12, 12, 8, 8, 12], weights := [1, 0, 1, 0] }

-- Period 10, original row 5351, representative 10239.
def source58 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B012.Data.entryAt ⟨23, by decide +kernel⟩

def target58 : Weights.Entry :=
  { word := [8, 8, 0, 4, 2, 8, 10], weights := [1, 0, 1, 0] }

-- Period 10, original row 5352, representative 10243.
def source59 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B012.Data.entryAt ⟨27, by decide +kernel⟩

def target59 : Weights.Entry :=
  { word := [8, 8, 0, 4, 2, 8, 12], weights := [1, 0, 0, 1] }

-- Period 10, original row 5377, representative 10240.
def source60 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B012.Data.entryAt ⟨24, by decide +kernel⟩

def target60 : Weights.Entry :=
  { word := [8, 8, 0, 4, 10, 8, 10], weights := [1, 0, 1, 0] }

-- Period 10, original row 5378, representative 10244.
def source61 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B012.Data.entryAt ⟨28, by decide +kernel⟩

def target61 : Weights.Entry :=
  { word := [8, 8, 0, 4, 10, 8, 12], weights := [1, 0, 0, 1] }

-- Period 10, original row 5415, representative 10242.
def source62 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B012.Data.entryAt ⟨26, by decide +kernel⟩

def target62 : Weights.Entry :=
  { word := [8, 8, 0, 12, 2, 8, 10], weights := [1, 0, 1, 0] }

-- Period 10, original row 5416, representative 10246.
def source63 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B012.Data.entryAt ⟨30, by decide +kernel⟩

def target63 : Weights.Entry :=
  { word := [8, 8, 0, 12, 2, 8, 12], weights := [1, 0, 1, 0] }

-- Period 10, original row 5440, representative 10241.
def source64 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B012.Data.entryAt ⟨25, by decide +kernel⟩

def target64 : Weights.Entry :=
  { word := [8, 8, 0, 12, 10, 8, 10], weights := [1, 0, 1, 0] }

-- Period 10, original row 5441, representative 10245.
def source65 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B012.Data.entryAt ⟨29, by decide +kernel⟩

def target65 : Weights.Entry :=
  { word := [8, 8, 0, 12, 10, 8, 12], weights := [1, 0, 1, 0] }

-- Period 10, original row 5448, representative 10265.
def source66 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B012.Data.entryAt ⟨49, by decide +kernel⟩

def target66 : Weights.Entry :=
  { word := [8, 8, 1, 4, 2, 0, 9], weights := [1, 0, 0, 1] }

def points66 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 5449, representative 10265.
def source67 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B012.Data.entryAt ⟨49, by decide +kernel⟩

def target67 : Weights.Entry :=
  { word := [8, 8, 1, 4, 2, 0, 10], weights := [1, 0, 0, 1] }

def points67 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 5450, representative 10273.
def source68 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B012.Data.entryAt ⟨57, by decide +kernel⟩

def target68 : Weights.Entry :=
  { word := [8, 8, 1, 4, 2, 0, 12], weights := [1, 0, 0, 1] }

-- Period 10, original row 5470, representative 10266.
def source69 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B012.Data.entryAt ⟨50, by decide +kernel⟩

def target69 : Weights.Entry :=
  { word := [8, 8, 1, 4, 10, 0, 9], weights := [1, 0, 0, 1] }

def points69 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 5471, representative 10266.
def source70 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B012.Data.entryAt ⟨50, by decide +kernel⟩

def target70 : Weights.Entry :=
  { word := [8, 8, 1, 4, 10, 0, 10], weights := [1, 0, 0, 1] }

def points70 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 5472, representative 10274.
def source71 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B012.Data.entryAt ⟨58, by decide +kernel⟩

def target71 : Weights.Entry :=
  { word := [8, 8, 1, 4, 10, 0, 12], weights := [1, 0, 0, 1] }

-- Period 10, original row 5484, representative 10272.
def source72 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B012.Data.entryAt ⟨56, by decide +kernel⟩

def target72 : Weights.Entry :=
  { word := [8, 8, 1, 12, 2, 0, 9], weights := [1, 0, 0, 1] }

def points72 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 5485, representative 10272.
def source73 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B012.Data.entryAt ⟨56, by decide +kernel⟩

def target73 : Weights.Entry :=
  { word := [8, 8, 1, 12, 2, 0, 10], weights := [1, 0, 0, 1] }

def points73 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 5506, representative 10269.
def source74 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B012.Data.entryAt ⟨53, by decide +kernel⟩

def target74 : Weights.Entry :=
  { word := [8, 8, 1, 12, 10, 0, 9], weights := [1, 0, 0, 1] }

def points74 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 5507, representative 10269.
def source75 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B012.Data.entryAt ⟨53, by decide +kernel⟩

def target75 : Weights.Entry :=
  { word := [8, 8, 1, 12, 10, 0, 10], weights := [1, 0, 0, 1] }

def points75 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 5508, representative 10277.
def source76 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B012.Data.entryAt ⟨61, by decide +kernel⟩

def target76 : Weights.Entry :=
  { word := [8, 8, 1, 12, 10, 0, 12], weights := [1, 0, 1, 0] }

-- Period 10, original row 5584, representative 10247.
def source77 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B012.Data.entryAt ⟨31, by decide +kernel⟩

def target77 : Weights.Entry :=
  { word := [8, 8, 4, 2, 0, 8, 10], weights := [1, 0, 0, 1] }

-- Period 10, original row 5585, representative 10247.
def source78 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B012.Data.entryAt ⟨31, by decide +kernel⟩

def target78 : Weights.Entry :=
  { word := [8, 8, 4, 2, 0, 8, 12], weights := [1, 0, 0, 1] }

def points78 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 8), (8, 7), (9, 9)]

-- Period 10, original row 5593, representative 10248.
def source79 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B012.Data.entryAt ⟨32, by decide +kernel⟩

def target79 : Weights.Entry :=
  { word := [8, 8, 4, 2, 8, 8, 12], weights := [1, 0, 0, 1] }

-- Period 10, original row 5623, representative 10254.
def source80 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B012.Data.entryAt ⟨38, by decide +kernel⟩

def target80 : Weights.Entry :=
  { word := [8, 8, 4, 10, 0, 8, 10], weights := [1, 0, 0, 1] }

-- Period 10, original row 5624, representative 10254.
def source81 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B012.Data.entryAt ⟨38, by decide +kernel⟩

def target81 : Weights.Entry :=
  { word := [8, 8, 4, 10, 0, 8, 12], weights := [1, 0, 0, 1] }

def points81 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 8), (8, 7), (9, 9)]

-- Period 10, original row 5631, representative 10251.
def source82 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B012.Data.entryAt ⟨35, by decide +kernel⟩

def target82 : Weights.Entry :=
  { word := [8, 8, 4, 10, 8, 8, 12], weights := [1, 0, 0, 1] }

-- Period 10, original row 5792, representative 10252.
def source83 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B012.Data.entryAt ⟨36, by decide +kernel⟩

def target83 : Weights.Entry :=
  { word := [8, 8, 12, 2, 0, 8, 10], weights := [1, 0, 0, 1] }

-- Period 10, original row 5793, representative 10252.
def source84 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B012.Data.entryAt ⟨36, by decide +kernel⟩

def target84 : Weights.Entry :=
  { word := [8, 8, 12, 2, 0, 8, 12], weights := [1, 0, 0, 1] }

def points84 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 8), (8, 7), (9, 9)]

-- Period 10, original row 5801, representative 10249.
def source85 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B012.Data.entryAt ⟨33, by decide +kernel⟩

def target85 : Weights.Entry :=
  { word := [8, 8, 12, 2, 8, 8, 12], weights := [1, 0, 0, 1] }

-- Period 10, original row 5830, representative 10253.
def source86 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B012.Data.entryAt ⟨37, by decide +kernel⟩

def target86 : Weights.Entry :=
  { word := [8, 8, 12, 10, 0, 8, 10], weights := [1, 0, 0, 1] }

-- Period 10, original row 5831, representative 10253.
def source87 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B012.Data.entryAt ⟨37, by decide +kernel⟩

def target87 : Weights.Entry :=
  { word := [8, 8, 12, 10, 0, 8, 12], weights := [1, 0, 0, 1] }

def points87 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 8), (8, 7), (9, 9)]

-- Period 10, original row 5838, representative 10250.
def source88 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B012.Data.entryAt ⟨34, by decide +kernel⟩

def target88 : Weights.Entry :=
  { word := [8, 8, 12, 10, 8, 8, 12], weights := [1, 0, 0, 1] }

-- Period 10, original row 6336, representative 10265.
def source89 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B012.Data.entryAt ⟨49, by decide +kernel⟩

def target89 : Weights.Entry :=
  { word := [8, 12, 0, 4, 2, 0, 9], weights := [1, 0, 0, 1] }

def points89 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2), (9, 0)]

-- Period 10, original row 6337, representative 10265.
def source90 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B012.Data.entryAt ⟨49, by decide +kernel⟩

def target90 : Weights.Entry :=
  { word := [8, 12, 0, 4, 2, 0, 10], weights := [1, 0, 0, 1] }

def points90 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2), (9, 0)]

-- Period 10, original row 6338, representative 10273.
def source91 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B012.Data.entryAt ⟨57, by decide +kernel⟩

def target91 : Weights.Entry :=
  { word := [8, 12, 0, 4, 2, 0, 12], weights := [1, 0, 0, 1] }

def points91 : List (ℕ × ℕ) := [(0, 0), (1, 2), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8), (9, 9)]

-- Period 10, original row 6358, representative 10266.
def source92 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B012.Data.entryAt ⟨50, by decide +kernel⟩

def target92 : Weights.Entry :=
  { word := [8, 12, 0, 4, 10, 0, 9], weights := [1, 0, 0, 1] }

def points92 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2), (9, 0)]

-- Period 10, original row 6359, representative 10266.
def source93 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B012.Data.entryAt ⟨50, by decide +kernel⟩

def target93 : Weights.Entry :=
  { word := [8, 12, 0, 4, 10, 0, 10], weights := [1, 0, 0, 1] }

def points93 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2), (9, 0)]

-- Period 10, original row 6360, representative 10274.
def source94 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B012.Data.entryAt ⟨58, by decide +kernel⟩

def target94 : Weights.Entry :=
  { word := [8, 12, 0, 4, 10, 0, 12], weights := [1, 0, 0, 1] }

def points94 : List (ℕ × ℕ) := [(0, 0), (1, 2), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8), (9, 9)]

-- Period 10, original row 6372, representative 10272.
def source95 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B012.Data.entryAt ⟨56, by decide +kernel⟩

def target95 : Weights.Entry :=
  { word := [8, 12, 0, 12, 2, 0, 9], weights := [1, 0, 0, 1] }

def points95 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2), (9, 0)]

-- Period 10, original row 6373, representative 10272.
def source96 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B012.Data.entryAt ⟨56, by decide +kernel⟩

def target96 : Weights.Entry :=
  { word := [8, 12, 0, 12, 2, 0, 10], weights := [1, 0, 0, 1] }

def points96 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2), (9, 0)]

-- Period 10, original row 6394, representative 10269.
def source97 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B012.Data.entryAt ⟨53, by decide +kernel⟩

def target97 : Weights.Entry :=
  { word := [8, 12, 0, 12, 10, 0, 9], weights := [1, 0, 0, 1] }

def points97 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2), (9, 0)]

-- Period 10, original row 6395, representative 10269.
def source98 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B012.Data.entryAt ⟨53, by decide +kernel⟩

def target98 : Weights.Entry :=
  { word := [8, 12, 0, 12, 10, 0, 10], weights := [1, 0, 0, 1] }

def points98 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2), (9, 0)]

-- Period 10, original row 6396, representative 10277.
def source99 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B012.Data.entryAt ⟨61, by decide +kernel⟩

def target99 : Weights.Entry :=
  { word := [8, 12, 0, 12, 10, 0, 12], weights := [1, 0, 1, 0] }

def points99 : List (ℕ × ℕ) := [(0, 0), (1, 2), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8), (9, 9)]

-- Period 10, original row 6413, representative 10264.
def source100 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B012.Data.entryAt ⟨48, by decide +kernel⟩

def target100 : Weights.Entry :=
  { word := [8, 12, 2, 8, 2, 0, 9], weights := [0, 1, 1, 0] }

def points100 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 6414, representative 10264.
def source101 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B012.Data.entryAt ⟨48, by decide +kernel⟩

def target101 : Weights.Entry :=
  { word := [8, 12, 2, 8, 2, 0, 10], weights := [0, 1, 1, 0] }

def points101 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 6421, representative 10263.
def source102 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B012.Data.entryAt ⟨47, by decide +kernel⟩

def target102 : Weights.Entry :=
  { word := [8, 12, 2, 8, 10, 0, 9], weights := [0, 1, 1, 0] }

def points102 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 6422, representative 10263.
def source103 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B012.Data.entryAt ⟨47, by decide +kernel⟩

def target103 : Weights.Entry :=
  { word := [8, 12, 2, 8, 10, 0, 10], weights := [0, 1, 1, 0] }

def points103 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 6491, representative 10270.
def source104 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B012.Data.entryAt ⟨54, by decide +kernel⟩

def target104 : Weights.Entry :=
  { word := [8, 12, 8, 4, 2, 0, 9], weights := [1, 0, 0, 1] }

def points104 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 6492, representative 10270.
def source105 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B012.Data.entryAt ⟨54, by decide +kernel⟩

def target105 : Weights.Entry :=
  { word := [8, 12, 8, 4, 2, 0, 10], weights := [1, 0, 0, 1] }

def points105 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 6493, representative 10278.
def source106 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B012.Data.entryAt ⟨62, by decide +kernel⟩

def target106 : Weights.Entry :=
  { word := [8, 12, 8, 4, 2, 0, 12], weights := [1, 0, 0, 1] }

-- Period 10, original row 6517, representative 10267.
def source107 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B012.Data.entryAt ⟨51, by decide +kernel⟩

def target107 : Weights.Entry :=
  { word := [8, 12, 8, 4, 10, 0, 9], weights := [1, 0, 0, 1] }

def points107 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 6518, representative 10267.
def source108 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B012.Data.entryAt ⟨51, by decide +kernel⟩

def target108 : Weights.Entry :=
  { word := [8, 12, 8, 4, 10, 0, 10], weights := [1, 0, 0, 1] }

def points108 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 6519, representative 10275.
def source109 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B012.Data.entryAt ⟨59, by decide +kernel⟩

def target109 : Weights.Entry :=
  { word := [8, 12, 8, 4, 10, 0, 12], weights := [1, 0, 0, 1] }

-- Period 10, original row 6533, representative 10271.
def source110 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B012.Data.entryAt ⟨55, by decide +kernel⟩

def target110 : Weights.Entry :=
  { word := [8, 12, 8, 12, 2, 0, 9], weights := [0, 1, 1, 0] }

def points110 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 6534, representative 10271.
def source111 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B012.Data.entryAt ⟨55, by decide +kernel⟩

def target111 : Weights.Entry :=
  { word := [8, 12, 8, 12, 2, 0, 10], weights := [0, 1, 1, 0] }

def points111 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 6535, representative 10279.
def source112 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B012.Data.entryAt ⟨63, by decide +kernel⟩

def target112 : Weights.Entry :=
  { word := [8, 12, 8, 12, 2, 0, 12], weights := [1, 0, 1, 0] }

-- Period 10, original row 6559, representative 10268.
def source113 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B012.Data.entryAt ⟨52, by decide +kernel⟩

def target113 : Weights.Entry :=
  { word := [8, 12, 8, 12, 10, 0, 9], weights := [0, 1, 1, 0] }

def points113 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 6560, representative 10268.
def source114 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B012.Data.entryAt ⟨52, by decide +kernel⟩

def target114 : Weights.Entry :=
  { word := [8, 12, 8, 12, 10, 0, 10], weights := [0, 1, 1, 0] }

def points114 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 6561, representative 10276.
def source115 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B012.Data.entryAt ⟨60, by decide +kernel⟩

def target115 : Weights.Entry :=
  { word := [8, 12, 8, 12, 10, 0, 12], weights := [1, 0, 1, 0] }

-- Period 10, original row 6636, representative 10219.
def source116 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B012.Data.entryAt ⟨3, by decide +kernel⟩

def target116 : Weights.Entry :=
  { word := [9, 0, 1, 4, 2, 8, 12], weights := [1, 0, 0, 1] }

def points116 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8), (9, 9)]

-- Period 10, original row 6658, representative 10220.
def source117 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B012.Data.entryAt ⟨4, by decide +kernel⟩

def target117 : Weights.Entry :=
  { word := [9, 0, 1, 4, 10, 8, 12], weights := [1, 0, 0, 1] }

def points117 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8), (9, 9)]

-- Period 10, original row 6671, representative 10218.
def source118 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B012.Data.entryAt ⟨2, by decide +kernel⟩

def target118 : Weights.Entry :=
  { word := [9, 0, 1, 12, 2, 8, 10], weights := [1, 0, 1, 0] }

def points118 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8), (9, 9)]

-- Period 10, original row 6672, representative 10226.
def source119 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B012.Data.entryAt ⟨10, by decide +kernel⟩

def target119 : Weights.Entry :=
  { word := [9, 0, 1, 12, 2, 8, 12], weights := [1, 0, 1, 0] }

def points119 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8), (9, 9)]

-- Period 10, original row 6694, representative 10223.
def source120 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B012.Data.entryAt ⟨7, by decide +kernel⟩

def target120 : Weights.Entry :=
  { word := [9, 0, 1, 12, 10, 8, 12], weights := [1, 0, 1, 0] }

def points120 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8), (9, 9)]

-- Period 10, original row 6765, representative 10255.
def source121 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B012.Data.entryAt ⟨39, by decide +kernel⟩

def target121 : Weights.Entry :=
  { word := [9, 0, 4, 2, 0, 8, 10], weights := [1, 0, 0, 1] }

def points121 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8), (9, 9)]

-- Period 10, original row 6766, representative 10255.
def source122 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B012.Data.entryAt ⟨39, by decide +kernel⟩

def target122 : Weights.Entry :=
  { word := [9, 0, 4, 2, 0, 8, 12], weights := [1, 0, 0, 1] }

def points122 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 8), (8, 7), (9, 9)]

-- Period 10, original row 6774, representative 10256.
def source123 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B012.Data.entryAt ⟨40, by decide +kernel⟩

def target123 : Weights.Entry :=
  { word := [9, 0, 4, 2, 8, 8, 12], weights := [1, 0, 0, 1] }

def points123 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8), (9, 9)]

-- Period 10, original row 6797, representative 10262.
def source124 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B012.Data.entryAt ⟨46, by decide +kernel⟩

def target124 : Weights.Entry :=
  { word := [9, 0, 4, 10, 0, 8, 10], weights := [1, 0, 0, 1] }

def points124 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8), (9, 9)]

-- Period 10, original row 6798, representative 10262.
def source125 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B012.Data.entryAt ⟨46, by decide +kernel⟩

def target125 : Weights.Entry :=
  { word := [9, 0, 4, 10, 0, 8, 12], weights := [1, 0, 0, 1] }

def points125 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 8), (8, 7), (9, 9)]

-- Period 10, original row 6810, representative 10259.
def source126 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B012.Data.entryAt ⟨43, by decide +kernel⟩

def target126 : Weights.Entry :=
  { word := [9, 0, 4, 10, 8, 8, 12], weights := [1, 0, 0, 1] }

def points126 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8), (9, 9)]

-- Period 10, original row 6908, representative 10260.
def source127 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B012.Data.entryAt ⟨44, by decide +kernel⟩

def target127 : Weights.Entry :=
  { word := [9, 0, 12, 2, 0, 8, 10], weights := [1, 0, 0, 1] }

def points127 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8), (9, 9)]

def period10Entries : List Weights.Entry := [target0, target1, target2, target3, target4, target5, target6, target7, target8, target9, target10, target11, target12, target13, target14, target15, target16, target17, target18, target19, target20, target21, target22, target23, target24, target25, target26, target27, target28, target29, target30, target31, target32, target33, target34, target35, target36, target37, target38, target39, target40, target41, target42, target43, target44, target45, target46, target47, target48, target49, target50, target51, target52, target53, target54, target55, target56, target57, target58, target59, target60, target61, target62, target63, target64, target65, target66, target67, target68, target69, target70, target71, target72, target73, target74, target75, target76, target77, target78, target79, target80, target81, target82, target83, target84, target85, target86, target87, target88, target89, target90, target91, target92, target93, target94, target95, target96, target97, target98, target99, target100, target101, target102, target103, target104, target105, target106, target107, target108, target109, target110, target111, target112, target113, target114, target115, target116, target117, target118, target119, target120, target121, target122, target123, target124, target125, target126, target127]

def period10Chunk : RowCoverage.Chunk where
  rows := [⟨4134, target0⟩, ⟨4156, target1⟩, ⟨4169, target2⟩, ⟨4170, target3⟩, ⟨4192, target4⟩, ⟨4263, target5⟩, ⟨4264, target6⟩, ⟨4272, target7⟩, ⟨4295, target8⟩, ⟨4296, target9⟩, ⟨4308, target10⟩, ⟨4436, target11⟩, ⟨4437, target12⟩, ⟨4445, target13⟩, ⟨4471, target14⟩, ⟨4472, target15⟩, ⟨4484, target16⟩, ⟨4528, target17⟩, ⟨4530, target18⟩, ⟨4536, target19⟩, ⟨4544, target20⟩, ⟨4555, target21⟩, ⟨4556, target22⟩, ⟨4567, target23⟩, ⟨4617, target24⟩, ⟨4619, target25⟩, ⟨4625, target26⟩, ⟨4633, target27⟩, ⟨4648, target28⟩, ⟨4649, target29⟩, ⟨4660, target30⟩, ⟨5013, target31⟩, ⟨5035, target32⟩, ⟨5048, target33⟩, ⟨5049, target34⟩, ⟨5071, target35⟩, ⟨5108, target36⟩, ⟨5109, target37⟩, ⟨5122, target38⟩, ⟨5123, target39⟩, ⟨5136, target40⟩, ⟨5137, target41⟩, ⟨5150, target42⟩, ⟨5151, target43⟩, ⟨5167, target44⟩, ⟨5168, target45⟩, ⟨5194, target46⟩, ⟨5209, target47⟩, ⟨5210, target48⟩, ⟨5236, target49⟩, ⟨5258, target50⟩, ⟨5259, target51⟩, ⟨5272, target52⟩, ⟨5273, target53⟩, ⟨5279, target54⟩, ⟨5280, target55⟩, ⟨5293, target56⟩, ⟨5294, target57⟩, ⟨5351, target58⟩, ⟨5352, target59⟩, ⟨5377, target60⟩, ⟨5378, target61⟩, ⟨5415, target62⟩, ⟨5416, target63⟩, ⟨5440, target64⟩, ⟨5441, target65⟩, ⟨5448, target66⟩, ⟨5449, target67⟩, ⟨5450, target68⟩, ⟨5470, target69⟩, ⟨5471, target70⟩, ⟨5472, target71⟩, ⟨5484, target72⟩, ⟨5485, target73⟩, ⟨5506, target74⟩, ⟨5507, target75⟩, ⟨5508, target76⟩, ⟨5584, target77⟩, ⟨5585, target78⟩, ⟨5593, target79⟩, ⟨5623, target80⟩, ⟨5624, target81⟩, ⟨5631, target82⟩, ⟨5792, target83⟩, ⟨5793, target84⟩, ⟨5801, target85⟩, ⟨5830, target86⟩, ⟨5831, target87⟩, ⟨5838, target88⟩, ⟨6336, target89⟩, ⟨6337, target90⟩, ⟨6338, target91⟩, ⟨6358, target92⟩, ⟨6359, target93⟩, ⟨6360, target94⟩, ⟨6372, target95⟩, ⟨6373, target96⟩, ⟨6394, target97⟩, ⟨6395, target98⟩, ⟨6396, target99⟩, ⟨6413, target100⟩, ⟨6414, target101⟩, ⟨6421, target102⟩, ⟨6422, target103⟩, ⟨6491, target104⟩, ⟨6492, target105⟩, ⟨6493, target106⟩, ⟨6517, target107⟩, ⟨6518, target108⟩, ⟨6519, target109⟩, ⟨6533, target110⟩, ⟨6534, target111⟩, ⟨6535, target112⟩, ⟨6559, target113⟩, ⟨6560, target114⟩, ⟨6561, target115⟩, ⟨6636, target116⟩, ⟨6658, target117⟩, ⟨6671, target118⟩, ⟨6672, target119⟩, ⟨6694, target120⟩, ⟨6765, target121⟩, ⟨6766, target122⟩, ⟨6774, target123⟩, ⟨6797, target124⟩, ⟨6798, target125⟩, ⟨6810, target126⟩, ⟨6908, target127⟩]
  indexMask := 3274990516904096493287868135278121288171715446319235795684868623839859187060007447524503915690939373271035578076997465485198728835022527361542006730979642879335522468098179243370540062541476594632756181869544873934841492167941577856518972561618263706103161445707309825072613407465235769791821960793295240330084176748861547046690885956496639836242225921048144425631153020382469936625014494238273511471042144243159688544211215445835215042070280100972352933112399729781178579580964606483719787954321691452004327263313493893417755596736961549958031725705559626762387347634572095335408347788327203861063067382224970540773216711131130007873735211347571852905417801550908967940441651372501059258083610864194827232379024652894269189610407801541434338105135177806106198525653590458268710566307765167125052808027901398225474108604476734795466408578173887983212677023871499152049982194542421500663597422441937054406888421461911261148261615771308880799989147469095570835461070443858898543383936457114202472443282875320892757138031929564447175773867921033329118443164987920475811134075318772047086658697915993453657580662650170164976561738277248359114042476979940013866369899712753656320463895193154864482900735823984981836427155159271169769245364705041940151254379067885003140925377948347443082935209905026715005053324283351136623170489886674269802532196349848878382387750573762705407290768311626254644418827214403550322860907295486147655400264109260477985924316284432197314549180488695627957422029252678031956880008842459703499055016108198890120401362671580552601205239163420529570060723162161967209495210258012150928819959791854332114258878764601067231223406054104890958015867583610715049862080193474267362867877805775701527190702179121117601171924751838055450738458556713149513096682805965240482851060045022150349823454875911755897526593571521316666236170332833804814103570501497739544101329129286134870561159978780632982054013674023998562023952304578929314976492327858441671274213592598335137482711862691265188737045445006234432195709423201945002148865314754990561684042502279229108912128
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

end FranklSmallCyclic.TransportBatches.G090.B000.Data
