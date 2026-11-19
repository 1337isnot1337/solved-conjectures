module

public import Conjectures.FranklSmallCyclicRowCoverage
public import Conjectures.FranklSmallCyclicCanonicalWords
public import Conjectures.FranklSmallCyclicOrbit10Block012Data

/-! 120 literal targets sharing one source proof block.
Original words and row indices are retained; weights may be transported.
-/
@[expose] public section

namespace FranklSmallCyclic.TransportBatches.G090.B001.Data

-- Period 10, original row 6909, representative 10260.
def source0 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B012.Data.entryAt ⟨44, by decide +kernel⟩

def target0 : Weights.Entry :=
  { word := [9, 0, 12, 2, 0, 8, 12], weights := [1, 0, 0, 1] }

def points0 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 8), (8, 7), (9, 9)]

-- Period 10, original row 6917, representative 10257.
def source1 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B012.Data.entryAt ⟨41, by decide +kernel⟩

def target1 : Weights.Entry :=
  { word := [9, 0, 12, 2, 8, 8, 12], weights := [1, 0, 0, 1] }

def points1 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8), (9, 9)]

-- Period 10, original row 6943, representative 10261.
def source2 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B012.Data.entryAt ⟨45, by decide +kernel⟩

def target2 : Weights.Entry :=
  { word := [9, 0, 12, 10, 0, 8, 10], weights := [1, 0, 0, 1] }

def points2 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8), (9, 9)]

-- Period 10, original row 6944, representative 10261.
def source3 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B012.Data.entryAt ⟨45, by decide +kernel⟩

def target3 : Weights.Entry :=
  { word := [9, 0, 12, 10, 0, 8, 12], weights := [1, 0, 0, 1] }

def points3 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 8), (8, 7), (9, 9)]

-- Period 10, original row 6956, representative 10258.
def source4 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B012.Data.entryAt ⟨42, by decide +kernel⟩

def target4 : Weights.Entry :=
  { word := [9, 0, 12, 10, 8, 8, 12], weights := [1, 0, 0, 1] }

def points4 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8), (9, 9)]

-- Period 10, original row 6975, representative 10227.
def source5 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B012.Data.entryAt ⟨11, by decide +kernel⟩

def target5 : Weights.Entry :=
  { word := [9, 4, 4, 4, 0, 8, 10], weights := [1, 0, 0, 1] }

def points5 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8), (9, 9)]

-- Period 10, original row 6976, representative 10227.
def source6 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B012.Data.entryAt ⟨11, by decide +kernel⟩

def target6 : Weights.Entry :=
  { word := [9, 4, 4, 4, 0, 8, 12], weights := [1, 0, 0, 1] }

def points6 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 8), (8, 7), (9, 9)]

-- Period 10, original row 6989, representative 10228.
def source7 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B012.Data.entryAt ⟨12, by decide +kernel⟩

def target7 : Weights.Entry :=
  { word := [9, 4, 4, 4, 8, 8, 10], weights := [1, 0, 1, 0] }

def points7 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8), (9, 9)]

-- Period 10, original row 6990, representative 10232.
def source8 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B012.Data.entryAt ⟨16, by decide +kernel⟩

def target8 : Weights.Entry :=
  { word := [9, 4, 4, 4, 8, 8, 12], weights := [1, 0, 0, 1] }

def points8 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8), (9, 9)]

-- Period 10, original row 7003, representative 10238.
def source9 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B012.Data.entryAt ⟨22, by decide +kernel⟩

def target9 : Weights.Entry :=
  { word := [9, 4, 4, 12, 0, 8, 10], weights := [1, 0, 1, 0] }

def points9 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8), (9, 9)]

-- Period 10, original row 7004, representative 10238.
def source10 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B012.Data.entryAt ⟨22, by decide +kernel⟩

def target10 : Weights.Entry :=
  { word := [9, 4, 4, 12, 0, 8, 12], weights := [1, 0, 1, 0] }

def points10 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 8), (8, 7), (9, 9)]

-- Period 10, original row 7017, representative 10231.
def source11 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B012.Data.entryAt ⟨15, by decide +kernel⟩

def target11 : Weights.Entry :=
  { word := [9, 4, 4, 12, 8, 8, 10], weights := [1, 0, 1, 0] }

def points11 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8), (9, 9)]

-- Period 10, original row 7018, representative 10235.
def source12 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B012.Data.entryAt ⟨19, by decide +kernel⟩

def target12 : Weights.Entry :=
  { word := [9, 4, 4, 12, 8, 8, 12], weights := [1, 0, 1, 0] }

def points12 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8), (9, 9)]

-- Period 10, original row 7024, representative 10236.
def source13 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B012.Data.entryAt ⟨20, by decide +kernel⟩

def target13 : Weights.Entry :=
  { word := [9, 4, 12, 4, 0, 8, 10], weights := [1, 0, 0, 1] }

def points13 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8), (9, 9)]

-- Period 10, original row 7025, representative 10236.
def source14 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B012.Data.entryAt ⟨20, by decide +kernel⟩

def target14 : Weights.Entry :=
  { word := [9, 4, 12, 4, 0, 8, 12], weights := [1, 0, 0, 1] }

def points14 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 8), (8, 7), (9, 9)]

-- Period 10, original row 7038, representative 10229.
def source15 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B012.Data.entryAt ⟨13, by decide +kernel⟩

def target15 : Weights.Entry :=
  { word := [9, 4, 12, 4, 8, 8, 10], weights := [1, 0, 1, 0] }

def points15 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8), (9, 9)]

-- Period 10, original row 7039, representative 10233.
def source16 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B012.Data.entryAt ⟨17, by decide +kernel⟩

def target16 : Weights.Entry :=
  { word := [9, 4, 12, 4, 8, 8, 12], weights := [1, 0, 0, 1] }

def points16 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8), (9, 9)]

-- Period 10, original row 7045, representative 10237.
def source17 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B012.Data.entryAt ⟨21, by decide +kernel⟩

def target17 : Weights.Entry :=
  { word := [9, 4, 12, 12, 0, 8, 10], weights := [1, 0, 1, 0] }

def points17 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8), (9, 9)]

-- Period 10, original row 7046, representative 10237.
def source18 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B012.Data.entryAt ⟨21, by decide +kernel⟩

def target18 : Weights.Entry :=
  { word := [9, 4, 12, 12, 0, 8, 12], weights := [1, 0, 1, 0] }

def points18 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 8), (8, 7), (9, 9)]

-- Period 10, original row 7059, representative 10230.
def source19 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B012.Data.entryAt ⟨14, by decide +kernel⟩

def target19 : Weights.Entry :=
  { word := [9, 4, 12, 12, 8, 8, 10], weights := [1, 0, 1, 0] }

def points19 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8), (9, 9)]

-- Period 10, original row 7060, representative 10234.
def source20 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B012.Data.entryAt ⟨18, by decide +kernel⟩

def target20 : Weights.Entry :=
  { word := [9, 4, 12, 12, 8, 8, 12], weights := [1, 0, 1, 0] }

def points20 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8), (9, 9)]

-- Period 10, original row 7065, representative 10265.
def source21 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B012.Data.entryAt ⟨49, by decide +kernel⟩

def target21 : Weights.Entry :=
  { word := [9, 8, 1, 4, 2, 0, 9], weights := [1, 0, 0, 1] }

def points21 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 7066, representative 10265.
def source22 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B012.Data.entryAt ⟨49, by decide +kernel⟩

def target22 : Weights.Entry :=
  { word := [9, 8, 1, 4, 2, 0, 10], weights := [1, 0, 0, 1] }

def points22 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 7067, representative 10273.
def source23 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B012.Data.entryAt ⟨57, by decide +kernel⟩

def target23 : Weights.Entry :=
  { word := [9, 8, 1, 4, 2, 0, 12], weights := [1, 0, 0, 1] }

def points23 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8), (9, 9)]

-- Period 10, original row 7087, representative 10266.
def source24 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B012.Data.entryAt ⟨50, by decide +kernel⟩

def target24 : Weights.Entry :=
  { word := [9, 8, 1, 4, 10, 0, 9], weights := [1, 0, 0, 1] }

def points24 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 7088, representative 10266.
def source25 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B012.Data.entryAt ⟨50, by decide +kernel⟩

def target25 : Weights.Entry :=
  { word := [9, 8, 1, 4, 10, 0, 10], weights := [1, 0, 0, 1] }

def points25 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 7089, representative 10274.
def source26 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B012.Data.entryAt ⟨58, by decide +kernel⟩

def target26 : Weights.Entry :=
  { word := [9, 8, 1, 4, 10, 0, 12], weights := [1, 0, 0, 1] }

def points26 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8), (9, 9)]

-- Period 10, original row 7101, representative 10272.
def source27 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B012.Data.entryAt ⟨56, by decide +kernel⟩

def target27 : Weights.Entry :=
  { word := [9, 8, 1, 12, 2, 0, 9], weights := [1, 0, 0, 1] }

def points27 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 7102, representative 10272.
def source28 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B012.Data.entryAt ⟨56, by decide +kernel⟩

def target28 : Weights.Entry :=
  { word := [9, 8, 1, 12, 2, 0, 10], weights := [1, 0, 0, 1] }

def points28 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 7123, representative 10269.
def source29 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B012.Data.entryAt ⟨53, by decide +kernel⟩

def target29 : Weights.Entry :=
  { word := [9, 8, 1, 12, 10, 0, 9], weights := [1, 0, 0, 1] }

def points29 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 7124, representative 10269.
def source30 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B012.Data.entryAt ⟨53, by decide +kernel⟩

def target30 : Weights.Entry :=
  { word := [9, 8, 1, 12, 10, 0, 10], weights := [1, 0, 0, 1] }

def points30 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 7125, representative 10277.
def source31 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B012.Data.entryAt ⟨61, by decide +kernel⟩

def target31 : Weights.Entry :=
  { word := [9, 8, 1, 12, 10, 0, 12], weights := [1, 0, 1, 0] }

def points31 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8), (9, 9)]

-- Period 10, original row 7434, representative 10273.
def source32 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B012.Data.entryAt ⟨57, by decide +kernel⟩

def target32 : Weights.Entry :=
  { word := [10, 0, 4, 2, 0, 9, 8], weights := [1, 0, 0, 1] }

def points32 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 0), (9, 1)]

-- Period 10, original row 7436, representative 10273.
def source33 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B012.Data.entryAt ⟨57, by decide +kernel⟩

def target33 : Weights.Entry :=
  { word := [10, 0, 4, 2, 0, 10, 8], weights := [1, 0, 0, 1] }

def points33 : List (ℕ × ℕ) := [(0, 9), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 0), (9, 1)]

-- Period 10, original row 7442, representative 10278.
def source34 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B012.Data.entryAt ⟨62, by decide +kernel⟩

def target34 : Weights.Entry :=
  { word := [10, 0, 4, 2, 8, 10, 8], weights := [1, 0, 0, 1] }

def points34 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 0), (9, 1)]

-- Period 10, original row 7468, representative 10279.
def source35 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B012.Data.entryAt ⟨63, by decide +kernel⟩

def target35 : Weights.Entry :=
  { word := [10, 0, 4, 10, 8, 10, 8], weights := [0, 1, 0, 1] }

def points35 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 0), (9, 1)]

-- Period 10, original row 7551, representative 10274.
def source36 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B012.Data.entryAt ⟨58, by decide +kernel⟩

def target36 : Weights.Entry :=
  { word := [10, 0, 12, 2, 0, 9, 8], weights := [1, 0, 0, 1] }

def points36 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 0), (9, 1)]

-- Period 10, original row 7553, representative 10274.
def source37 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B012.Data.entryAt ⟨58, by decide +kernel⟩

def target37 : Weights.Entry :=
  { word := [10, 0, 12, 2, 0, 10, 8], weights := [1, 0, 0, 1] }

def points37 : List (ℕ × ℕ) := [(0, 9), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 0), (9, 1)]

-- Period 10, original row 7559, representative 10275.
def source38 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B012.Data.entryAt ⟨59, by decide +kernel⟩

def target38 : Weights.Entry :=
  { word := [10, 0, 12, 2, 8, 10, 8], weights := [1, 0, 0, 1] }

def points38 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 0), (9, 1)]

-- Period 10, original row 7578, representative 10277.
def source39 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B012.Data.entryAt ⟨61, by decide +kernel⟩

def target39 : Weights.Entry :=
  { word := [10, 0, 12, 10, 0, 9, 8], weights := [0, 1, 0, 1] }

def points39 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 0), (9, 1)]

-- Period 10, original row 7579, representative 10277.
def source40 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B012.Data.entryAt ⟨61, by decide +kernel⟩

def target40 : Weights.Entry :=
  { word := [10, 0, 12, 10, 0, 10, 8], weights := [0, 1, 0, 1] }

def points40 : List (ℕ × ℕ) := [(0, 9), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 0), (9, 1)]

-- Period 10, original row 7590, representative 10276.
def source41 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B012.Data.entryAt ⟨60, by decide +kernel⟩

def target41 : Weights.Entry :=
  { word := [10, 0, 12, 10, 8, 10, 8], weights := [0, 1, 0, 1] }

def points41 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 0), (9, 1)]

-- Period 10, original row 7812, representative 10227.
def source42 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B012.Data.entryAt ⟨11, by decide +kernel⟩

def target42 : Weights.Entry :=
  { word := [10, 8, 0, 2, 2, 2, 8], weights := [1, 0, 0, 1] }

def points42 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2), (9, 0)]

-- Period 10, original row 7816, representative 10236.
def source43 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B012.Data.entryAt ⟨20, by decide +kernel⟩

def target43 : Weights.Entry :=
  { word := [10, 8, 0, 2, 10, 2, 8], weights := [1, 0, 0, 1] }

def points43 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2), (9, 0)]

-- Period 10, original row 7822, representative 10255.
def source44 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B012.Data.entryAt ⟨39, by decide +kernel⟩

def target44 : Weights.Entry :=
  { word := [10, 8, 0, 4, 2, 0, 8], weights := [1, 0, 0, 1] }

def points44 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2), (9, 0)]

-- Period 10, original row 7828, representative 10247.
def source45 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B012.Data.entryAt ⟨31, by decide +kernel⟩

def target45 : Weights.Entry :=
  { word := [10, 8, 0, 4, 2, 8, 8], weights := [1, 0, 0, 1] }

def points45 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2), (9, 0)]

-- Period 10, original row 7848, representative 10260.
def source46 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B012.Data.entryAt ⟨44, by decide +kernel⟩

def target46 : Weights.Entry :=
  { word := [10, 8, 0, 4, 10, 0, 8], weights := [1, 0, 0, 1] }

def points46 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2), (9, 0)]

-- Period 10, original row 7854, representative 10252.
def source47 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B012.Data.entryAt ⟨36, by decide +kernel⟩

def target47 : Weights.Entry :=
  { word := [10, 8, 0, 4, 10, 8, 8], weights := [1, 0, 0, 1] }

def points47 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2), (9, 0)]

-- Period 10, original row 7859, representative 10238.
def source48 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B012.Data.entryAt ⟨22, by decide +kernel⟩

def target48 : Weights.Entry :=
  { word := [10, 8, 0, 10, 2, 2, 8], weights := [0, 1, 0, 1] }

def points48 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2), (9, 0)]

-- Period 10, original row 7861, representative 10237.
def source49 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B012.Data.entryAt ⟨21, by decide +kernel⟩

def target49 : Weights.Entry :=
  { word := [10, 8, 0, 10, 10, 2, 8], weights := [0, 1, 0, 1] }

def points49 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2), (9, 0)]

-- Period 10, original row 7874, representative 10262.
def source50 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B012.Data.entryAt ⟨46, by decide +kernel⟩

def target50 : Weights.Entry :=
  { word := [10, 8, 0, 12, 2, 0, 8], weights := [1, 0, 0, 1] }

def points50 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2), (9, 0)]

-- Period 10, original row 7880, representative 10254.
def source51 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B012.Data.entryAt ⟨38, by decide +kernel⟩

def target51 : Weights.Entry :=
  { word := [10, 8, 0, 12, 2, 8, 8], weights := [1, 0, 0, 1] }

def points51 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2), (9, 0)]

-- Period 10, original row 7899, representative 10261.
def source52 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B012.Data.entryAt ⟨45, by decide +kernel⟩

def target52 : Weights.Entry :=
  { word := [10, 8, 0, 12, 10, 0, 8], weights := [1, 0, 0, 1] }

def points52 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2), (9, 0)]

-- Period 10, original row 7905, representative 10253.
def source53 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B012.Data.entryAt ⟨37, by decide +kernel⟩

def target53 : Weights.Entry :=
  { word := [10, 8, 0, 12, 10, 8, 8], weights := [1, 0, 0, 1] }

def points53 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2), (9, 0)]

-- Period 10, original row 7917, representative 10219.
def source54 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B012.Data.entryAt ⟨3, by decide +kernel⟩

def target54 : Weights.Entry :=
  { word := [10, 8, 4, 2, 0, 1, 8], weights := [1, 0, 0, 1] }

def points54 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 7919, representative 10219.
def source55 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B012.Data.entryAt ⟨3, by decide +kernel⟩

def target55 : Weights.Entry :=
  { word := [10, 8, 4, 2, 0, 2, 8], weights := [1, 0, 0, 1] }

def points55 : List (ℕ × ℕ) := [(0, 7), (1, 9), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 7924, representative 10243.
def source56 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B012.Data.entryAt ⟨27, by decide +kernel⟩

def target56 : Weights.Entry :=
  { word := [10, 8, 4, 2, 0, 8, 8], weights := [1, 0, 0, 1] }

def points56 : List (ℕ × ℕ) := [(0, 9), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 7933, representative 10224.
def source57 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B012.Data.entryAt ⟨8, by decide +kernel⟩

def target57 : Weights.Entry :=
  { word := [10, 8, 4, 2, 8, 2, 8], weights := [1, 0, 0, 1] }

def points57 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 7946, representative 10226.
def source58 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B012.Data.entryAt ⟨10, by decide +kernel⟩

def target58 : Weights.Entry :=
  { word := [10, 8, 4, 10, 0, 1, 8], weights := [0, 1, 0, 1] }

def points58 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 7947, representative 10226.
def source59 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B012.Data.entryAt ⟨10, by decide +kernel⟩

def target59 : Weights.Entry :=
  { word := [10, 8, 4, 10, 0, 2, 8], weights := [0, 1, 0, 1] }

def points59 : List (ℕ × ℕ) := [(0, 7), (1, 9), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 7951, representative 10246.
def source60 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B012.Data.entryAt ⟨30, by decide +kernel⟩

def target60 : Weights.Entry :=
  { word := [10, 8, 4, 10, 0, 8, 8], weights := [0, 1, 0, 1] }

def points60 : List (ℕ × ℕ) := [(0, 9), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 7957, representative 10225.
def source61 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B012.Data.entryAt ⟨9, by decide +kernel⟩

def target61 : Weights.Entry :=
  { word := [10, 8, 4, 10, 8, 2, 8], weights := [0, 1, 0, 1] }

def points61 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 7976, representative 10232.
def source62 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B012.Data.entryAt ⟨16, by decide +kernel⟩

def target62 : Weights.Entry :=
  { word := [10, 8, 8, 2, 2, 2, 8], weights := [1, 0, 0, 1] }

def points62 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 7980, representative 10233.
def source63 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B012.Data.entryAt ⟨17, by decide +kernel⟩

def target63 : Weights.Entry :=
  { word := [10, 8, 8, 2, 10, 2, 8], weights := [1, 0, 0, 1] }

def points63 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 7986, representative 10256.
def source64 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B012.Data.entryAt ⟨40, by decide +kernel⟩

def target64 : Weights.Entry :=
  { word := [10, 8, 8, 4, 2, 0, 8], weights := [1, 0, 0, 1] }

def points64 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 7992, representative 10248.
def source65 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B012.Data.entryAt ⟨32, by decide +kernel⟩

def target65 : Weights.Entry :=
  { word := [10, 8, 8, 4, 2, 8, 8], weights := [1, 0, 0, 1] }

def points65 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8016, representative 10257.
def source66 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B012.Data.entryAt ⟨41, by decide +kernel⟩

def target66 : Weights.Entry :=
  { word := [10, 8, 8, 4, 10, 0, 8], weights := [1, 0, 0, 1] }

def points66 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8022, representative 10249.
def source67 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B012.Data.entryAt ⟨33, by decide +kernel⟩

def target67 : Weights.Entry :=
  { word := [10, 8, 8, 4, 10, 8, 8], weights := [1, 0, 0, 1] }

def points67 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8043, representative 10235.
def source68 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B012.Data.entryAt ⟨19, by decide +kernel⟩

def target68 : Weights.Entry :=
  { word := [10, 8, 8, 10, 2, 2, 8], weights := [0, 1, 0, 1] }

def points68 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8045, representative 10234.
def source69 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B012.Data.entryAt ⟨18, by decide +kernel⟩

def target69 : Weights.Entry :=
  { word := [10, 8, 8, 10, 10, 2, 8], weights := [0, 1, 0, 1] }

def points69 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8060, representative 10259.
def source70 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B012.Data.entryAt ⟨43, by decide +kernel⟩

def target70 : Weights.Entry :=
  { word := [10, 8, 8, 12, 2, 0, 8], weights := [1, 0, 0, 1] }

def points70 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8066, representative 10251.
def source71 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B012.Data.entryAt ⟨35, by decide +kernel⟩

def target71 : Weights.Entry :=
  { word := [10, 8, 8, 12, 2, 8, 8], weights := [1, 0, 0, 1] }

def points71 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8089, representative 10258.
def source72 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B012.Data.entryAt ⟨42, by decide +kernel⟩

def target72 : Weights.Entry :=
  { word := [10, 8, 8, 12, 10, 0, 8], weights := [1, 0, 0, 1] }

def points72 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8095, representative 10250.
def source73 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B012.Data.entryAt ⟨34, by decide +kernel⟩

def target73 : Weights.Entry :=
  { word := [10, 8, 8, 12, 10, 8, 8], weights := [1, 0, 0, 1] }

def points73 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8125, representative 10220.
def source74 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B012.Data.entryAt ⟨4, by decide +kernel⟩

def target74 : Weights.Entry :=
  { word := [10, 8, 12, 2, 0, 1, 8], weights := [1, 0, 0, 1] }

def points74 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8127, representative 10220.
def source75 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B012.Data.entryAt ⟨4, by decide +kernel⟩

def target75 : Weights.Entry :=
  { word := [10, 8, 12, 2, 0, 2, 8], weights := [1, 0, 0, 1] }

def points75 : List (ℕ × ℕ) := [(0, 7), (1, 9), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8132, representative 10244.
def source76 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B012.Data.entryAt ⟨28, by decide +kernel⟩

def target76 : Weights.Entry :=
  { word := [10, 8, 12, 2, 0, 8, 8], weights := [1, 0, 0, 1] }

def points76 : List (ℕ × ℕ) := [(0, 9), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8141, representative 10221.
def source77 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B012.Data.entryAt ⟨5, by decide +kernel⟩

def target77 : Weights.Entry :=
  { word := [10, 8, 12, 2, 8, 2, 8], weights := [1, 0, 0, 1] }

def points77 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8154, representative 10223.
def source78 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B012.Data.entryAt ⟨7, by decide +kernel⟩

def target78 : Weights.Entry :=
  { word := [10, 8, 12, 10, 0, 1, 8], weights := [0, 1, 0, 1] }

def points78 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8155, representative 10223.
def source79 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B012.Data.entryAt ⟨7, by decide +kernel⟩

def target79 : Weights.Entry :=
  { word := [10, 8, 12, 10, 0, 2, 8], weights := [0, 1, 0, 1] }

def points79 : List (ℕ × ℕ) := [(0, 7), (1, 9), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8159, representative 10245.
def source80 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B012.Data.entryAt ⟨29, by decide +kernel⟩

def target80 : Weights.Entry :=
  { word := [10, 8, 12, 10, 0, 8, 8], weights := [0, 1, 0, 1] }

def points80 : List (ℕ × ℕ) := [(0, 9), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8165, representative 10222.
def source81 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B012.Data.entryAt ⟨6, by decide +kernel⟩

def target81 : Weights.Entry :=
  { word := [10, 8, 12, 10, 8, 2, 8], weights := [0, 1, 0, 1] }

def points81 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8440, representative 10265.
def source82 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B012.Data.entryAt ⟨49, by decide +kernel⟩

def target82 : Weights.Entry :=
  { word := [12, 0, 4, 2, 0, 9, 8], weights := [1, 0, 0, 1] }

def points82 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8), (9, 9)]

-- Period 10, original row 8442, representative 10265.
def source83 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B012.Data.entryAt ⟨49, by decide +kernel⟩

def target83 : Weights.Entry :=
  { word := [12, 0, 4, 2, 0, 10, 8], weights := [1, 0, 0, 1] }

def points83 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 8), (8, 7), (9, 9)]

-- Period 10, original row 8448, representative 10270.
def source84 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B012.Data.entryAt ⟨54, by decide +kernel⟩

def target84 : Weights.Entry :=
  { word := [12, 0, 4, 2, 8, 10, 8], weights := [1, 0, 0, 1] }

def points84 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8), (9, 9)]

-- Period 10, original row 8456, representative 10264.
def source85 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B012.Data.entryAt ⟨48, by decide +kernel⟩

def target85 : Weights.Entry :=
  { word := [12, 0, 4, 8, 4, 10, 8], weights := [0, 1, 1, 0] }

def points85 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8), (9, 9)]

-- Period 10, original row 8467, representative 10272.
def source86 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B012.Data.entryAt ⟨56, by decide +kernel⟩

def target86 : Weights.Entry :=
  { word := [12, 0, 4, 10, 0, 9, 8], weights := [1, 0, 0, 1] }

def points86 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8), (9, 9)]

-- Period 10, original row 8468, representative 10272.
def source87 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B012.Data.entryAt ⟨56, by decide +kernel⟩

def target87 : Weights.Entry :=
  { word := [12, 0, 4, 10, 0, 10, 8], weights := [1, 0, 0, 1] }

def points87 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 8), (8, 7), (9, 9)]

-- Period 10, original row 8479, representative 10271.
def source88 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B012.Data.entryAt ⟨55, by decide +kernel⟩

def target88 : Weights.Entry :=
  { word := [12, 0, 4, 10, 8, 10, 8], weights := [0, 1, 1, 0] }

def points88 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8), (9, 9)]

-- Period 10, original row 8529, representative 10266.
def source89 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B012.Data.entryAt ⟨50, by decide +kernel⟩

def target89 : Weights.Entry :=
  { word := [12, 0, 12, 2, 0, 9, 8], weights := [1, 0, 0, 1] }

def points89 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8), (9, 9)]

-- Period 10, original row 8531, representative 10266.
def source90 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B012.Data.entryAt ⟨50, by decide +kernel⟩

def target90 : Weights.Entry :=
  { word := [12, 0, 12, 2, 0, 10, 8], weights := [1, 0, 0, 1] }

def points90 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 8), (8, 7), (9, 9)]

-- Period 10, original row 8537, representative 10267.
def source91 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B012.Data.entryAt ⟨51, by decide +kernel⟩

def target91 : Weights.Entry :=
  { word := [12, 0, 12, 2, 8, 10, 8], weights := [1, 0, 0, 1] }

def points91 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8), (9, 9)]

-- Period 10, original row 8545, representative 10263.
def source92 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B012.Data.entryAt ⟨47, by decide +kernel⟩

def target92 : Weights.Entry :=
  { word := [12, 0, 12, 8, 4, 10, 8], weights := [0, 1, 1, 0] }

def points92 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8), (9, 9)]

-- Period 10, original row 8560, representative 10269.
def source93 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B012.Data.entryAt ⟨53, by decide +kernel⟩

def target93 : Weights.Entry :=
  { word := [12, 0, 12, 10, 0, 9, 8], weights := [1, 0, 0, 1] }

def points93 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8), (9, 9)]

-- Period 10, original row 8561, representative 10269.
def source94 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B012.Data.entryAt ⟨53, by decide +kernel⟩

def target94 : Weights.Entry :=
  { word := [12, 0, 12, 10, 0, 10, 8], weights := [1, 0, 0, 1] }

def points94 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 8), (8, 7), (9, 9)]

-- Period 10, original row 8572, representative 10268.
def source95 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B012.Data.entryAt ⟨52, by decide +kernel⟩

def target95 : Weights.Entry :=
  { word := [12, 0, 12, 10, 8, 10, 8], weights := [0, 1, 1, 0] }

def points95 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8), (9, 9)]

-- Period 10, original row 8728, representative 10227.
def source96 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B012.Data.entryAt ⟨11, by decide +kernel⟩

def target96 : Weights.Entry :=
  { word := [12, 8, 0, 2, 2, 2, 8], weights := [1, 0, 0, 1] }

def points96 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8732, representative 10236.
def source97 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B012.Data.entryAt ⟨20, by decide +kernel⟩

def target97 : Weights.Entry :=
  { word := [12, 8, 0, 2, 10, 2, 8], weights := [1, 0, 0, 1] }

def points97 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8738, representative 10255.
def source98 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B012.Data.entryAt ⟨39, by decide +kernel⟩

def target98 : Weights.Entry :=
  { word := [12, 8, 0, 4, 2, 0, 8], weights := [1, 0, 0, 1] }

def points98 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8744, representative 10247.
def source99 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B012.Data.entryAt ⟨31, by decide +kernel⟩

def target99 : Weights.Entry :=
  { word := [12, 8, 0, 4, 2, 8, 8], weights := [1, 0, 0, 1] }

def points99 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8764, representative 10260.
def source100 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B012.Data.entryAt ⟨44, by decide +kernel⟩

def target100 : Weights.Entry :=
  { word := [12, 8, 0, 4, 10, 0, 8], weights := [1, 0, 0, 1] }

def points100 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8770, representative 10252.
def source101 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B012.Data.entryAt ⟨36, by decide +kernel⟩

def target101 : Weights.Entry :=
  { word := [12, 8, 0, 4, 10, 8, 8], weights := [1, 0, 0, 1] }

def points101 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8775, representative 10238.
def source102 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B012.Data.entryAt ⟨22, by decide +kernel⟩

def target102 : Weights.Entry :=
  { word := [12, 8, 0, 10, 2, 2, 8], weights := [0, 1, 0, 1] }

def points102 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8777, representative 10237.
def source103 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B012.Data.entryAt ⟨21, by decide +kernel⟩

def target103 : Weights.Entry :=
  { word := [12, 8, 0, 10, 10, 2, 8], weights := [0, 1, 0, 1] }

def points103 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8782, representative 10262.
def source104 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B012.Data.entryAt ⟨46, by decide +kernel⟩

def target104 : Weights.Entry :=
  { word := [12, 8, 0, 12, 2, 0, 8], weights := [1, 0, 0, 1] }

def points104 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8788, representative 10254.
def source105 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B012.Data.entryAt ⟨38, by decide +kernel⟩

def target105 : Weights.Entry :=
  { word := [12, 8, 0, 12, 2, 8, 8], weights := [1, 0, 0, 1] }

def points105 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8807, representative 10261.
def source106 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B012.Data.entryAt ⟨45, by decide +kernel⟩

def target106 : Weights.Entry :=
  { word := [12, 8, 0, 12, 10, 0, 8], weights := [1, 0, 0, 1] }

def points106 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8813, representative 10253.
def source107 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B012.Data.entryAt ⟨37, by decide +kernel⟩

def target107 : Weights.Entry :=
  { word := [12, 8, 0, 12, 10, 8, 8], weights := [1, 0, 0, 1] }

def points107 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8826, representative 10239.
def source108 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B012.Data.entryAt ⟨23, by decide +kernel⟩

def target108 : Weights.Entry :=
  { word := [12, 8, 4, 2, 0, 8, 8], weights := [0, 1, 0, 1] }

def points108 : List (ℕ × ℕ) := [(0, 9), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8835, representative 10216.
def source109 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B012.Data.entryAt ⟨0, by decide +kernel⟩

def target109 : Weights.Entry :=
  { word := [12, 8, 4, 2, 8, 2, 8], weights := [0, 1, 0, 1] }

def points109 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8856, representative 10218.
def source110 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B012.Data.entryAt ⟨2, by decide +kernel⟩

def target110 : Weights.Entry :=
  { word := [12, 8, 4, 10, 0, 1, 8], weights := [0, 1, 0, 1] }

def points110 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8857, representative 10218.
def source111 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B012.Data.entryAt ⟨2, by decide +kernel⟩

def target111 : Weights.Entry :=
  { word := [12, 8, 4, 10, 0, 2, 8], weights := [0, 1, 0, 1] }

def points111 : List (ℕ × ℕ) := [(0, 7), (1, 9), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8861, representative 10242.
def source112 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B012.Data.entryAt ⟨26, by decide +kernel⟩

def target112 : Weights.Entry :=
  { word := [12, 8, 4, 10, 0, 8, 8], weights := [0, 1, 0, 1] }

def points112 : List (ℕ × ℕ) := [(0, 9), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8867, representative 10217.
def source113 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B012.Data.entryAt ⟨1, by decide +kernel⟩

def target113 : Weights.Entry :=
  { word := [12, 8, 4, 10, 8, 2, 8], weights := [0, 1, 0, 1] }

def points113 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8886, representative 10228.
def source114 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B012.Data.entryAt ⟨12, by decide +kernel⟩

def target114 : Weights.Entry :=
  { word := [12, 8, 8, 2, 2, 2, 8], weights := [0, 1, 0, 1] }

def points114 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8890, representative 10229.
def source115 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B012.Data.entryAt ⟨13, by decide +kernel⟩

def target115 : Weights.Entry :=
  { word := [12, 8, 8, 2, 10, 2, 8], weights := [0, 1, 0, 1] }

def points115 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8911, representative 10231.
def source116 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B012.Data.entryAt ⟨15, by decide +kernel⟩

def target116 : Weights.Entry :=
  { word := [12, 8, 8, 10, 2, 2, 8], weights := [0, 1, 0, 1] }

def points116 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8913, representative 10230.
def source117 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B012.Data.entryAt ⟨14, by decide +kernel⟩

def target117 : Weights.Entry :=
  { word := [12, 8, 8, 10, 10, 2, 8], weights := [0, 1, 0, 1] }

def points117 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8934, representative 10240.
def source118 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B012.Data.entryAt ⟨24, by decide +kernel⟩

def target118 : Weights.Entry :=
  { word := [12, 8, 12, 2, 0, 8, 8], weights := [0, 1, 0, 1] }

def points118 : List (ℕ × ℕ) := [(0, 9), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8969, representative 10241.
def source119 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B012.Data.entryAt ⟨25, by decide +kernel⟩

def target119 : Weights.Entry :=
  { word := [12, 8, 12, 10, 0, 8, 8], weights := [0, 1, 0, 1] }

def points119 : List (ℕ × ℕ) := [(0, 9), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

def period10Entries : List Weights.Entry := [target0, target1, target2, target3, target4, target5, target6, target7, target8, target9, target10, target11, target12, target13, target14, target15, target16, target17, target18, target19, target20, target21, target22, target23, target24, target25, target26, target27, target28, target29, target30, target31, target32, target33, target34, target35, target36, target37, target38, target39, target40, target41, target42, target43, target44, target45, target46, target47, target48, target49, target50, target51, target52, target53, target54, target55, target56, target57, target58, target59, target60, target61, target62, target63, target64, target65, target66, target67, target68, target69, target70, target71, target72, target73, target74, target75, target76, target77, target78, target79, target80, target81, target82, target83, target84, target85, target86, target87, target88, target89, target90, target91, target92, target93, target94, target95, target96, target97, target98, target99, target100, target101, target102, target103, target104, target105, target106, target107, target108, target109, target110, target111, target112, target113, target114, target115, target116, target117, target118, target119]

def period10Chunk : RowCoverage.Chunk where
  rows := [⟨6909, target0⟩, ⟨6917, target1⟩, ⟨6943, target2⟩, ⟨6944, target3⟩, ⟨6956, target4⟩, ⟨6975, target5⟩, ⟨6976, target6⟩, ⟨6989, target7⟩, ⟨6990, target8⟩, ⟨7003, target9⟩, ⟨7004, target10⟩, ⟨7017, target11⟩, ⟨7018, target12⟩, ⟨7024, target13⟩, ⟨7025, target14⟩, ⟨7038, target15⟩, ⟨7039, target16⟩, ⟨7045, target17⟩, ⟨7046, target18⟩, ⟨7059, target19⟩, ⟨7060, target20⟩, ⟨7065, target21⟩, ⟨7066, target22⟩, ⟨7067, target23⟩, ⟨7087, target24⟩, ⟨7088, target25⟩, ⟨7089, target26⟩, ⟨7101, target27⟩, ⟨7102, target28⟩, ⟨7123, target29⟩, ⟨7124, target30⟩, ⟨7125, target31⟩, ⟨7434, target32⟩, ⟨7436, target33⟩, ⟨7442, target34⟩, ⟨7468, target35⟩, ⟨7551, target36⟩, ⟨7553, target37⟩, ⟨7559, target38⟩, ⟨7578, target39⟩, ⟨7579, target40⟩, ⟨7590, target41⟩, ⟨7812, target42⟩, ⟨7816, target43⟩, ⟨7822, target44⟩, ⟨7828, target45⟩, ⟨7848, target46⟩, ⟨7854, target47⟩, ⟨7859, target48⟩, ⟨7861, target49⟩, ⟨7874, target50⟩, ⟨7880, target51⟩, ⟨7899, target52⟩, ⟨7905, target53⟩, ⟨7917, target54⟩, ⟨7919, target55⟩, ⟨7924, target56⟩, ⟨7933, target57⟩, ⟨7946, target58⟩, ⟨7947, target59⟩, ⟨7951, target60⟩, ⟨7957, target61⟩, ⟨7976, target62⟩, ⟨7980, target63⟩, ⟨7986, target64⟩, ⟨7992, target65⟩, ⟨8016, target66⟩, ⟨8022, target67⟩, ⟨8043, target68⟩, ⟨8045, target69⟩, ⟨8060, target70⟩, ⟨8066, target71⟩, ⟨8089, target72⟩, ⟨8095, target73⟩, ⟨8125, target74⟩, ⟨8127, target75⟩, ⟨8132, target76⟩, ⟨8141, target77⟩, ⟨8154, target78⟩, ⟨8155, target79⟩, ⟨8159, target80⟩, ⟨8165, target81⟩, ⟨8440, target82⟩, ⟨8442, target83⟩, ⟨8448, target84⟩, ⟨8456, target85⟩, ⟨8467, target86⟩, ⟨8468, target87⟩, ⟨8479, target88⟩, ⟨8529, target89⟩, ⟨8531, target90⟩, ⟨8537, target91⟩, ⟨8545, target92⟩, ⟨8560, target93⟩, ⟨8561, target94⟩, ⟨8572, target95⟩, ⟨8728, target96⟩, ⟨8732, target97⟩, ⟨8738, target98⟩, ⟨8744, target99⟩, ⟨8764, target100⟩, ⟨8770, target101⟩, ⟨8775, target102⟩, ⟨8777, target103⟩, ⟨8782, target104⟩, ⟨8788, target105⟩, ⟨8807, target106⟩, ⟨8813, target107⟩, ⟨8826, target108⟩, ⟨8835, target109⟩, ⟨8856, target110⟩, ⟨8857, target111⟩, ⟨8861, target112⟩, ⟨8867, target113⟩, ⟨8886, target114⟩, ⟨8890, target115⟩, ⟨8911, target116⟩, ⟨8913, target117⟩, ⟨8934, target118⟩, ⟨8969, target119⟩]
  indexMask := 867023981947747944491434675782055961551689017155393742757078593879240469509541735115301487137196224063115668686721474361395084887019103826966794245756620534223807959856034853993427494878475809199512292374644935088578774749744266741928026874316093553116166444835867965422658345610357968330977979318199042197348742210802905163971749787315539310501488476536602112836726762403984264981432833875747405808325313498605865245454886937212226680760075907149712666451397851582077906803891480833671371728699779724830776449843714178004536189932495061932416123371473699136672325880241171101523690082136120827566655804314166599176713143747553673670670638169358268546448812261133748582137844817548151217771171371588441471010522424493764483969387446399971232547376316810798780012485556500097472598188311486248469444725978075571867295107527101732221168404182551763776177878266747065149954411483424548633551157624945485591309864632266333909936513154532047489007302821618190732704176829632389488244101771828698153410085333119203299832694395670587365925071680356087868883084416728839585049760583281053528660071999709827990337138571730395601375729874409823268142457954484754715867005119548110311791100699886913708667151513205389257243314799492200376334232888564712518035890503932802424101951294347676826410705453464564117288213197825261021044384890211866269963638839684143364471964493981959868439615110705943949011327765115512525258645228422026460625727151447950295256486215182018495574138611750902450241573135153506942593664273137906279372076449995197368749721630717212537733310332194859349895558968479774360679534816783358808091088870598037836273800719746985359640757804620141250571830817722546718553875758052996739092844555268572181792857218027167916924370274353478555002915450988832719019595349075986162019848250057731404474930322570817338008165097962252463927563232388679248207617996549314881098917471177599203455401151107629437972222442523859817584645578649307124538690633474405624325653262154262364711388060257999656236786041364909344218237987451772217885266994883082369391671979774195149760115285669768336554740584080163045178459134462575409936042329256623169444134627512095181527926110798266132200375534697589880555347111597742302734776638674854316229847628809146883347254163782466948080360781453843350456974738483607410307706705784216269201958547751263348276631539693867858912524327872115953227076360402563021196403568319403245814484060955977274092919191333039431848388076120657765471026819160255988907900365535123908570494480137114523498080963823634975542504114183499488916194794466398886188892967472137833503623264057556047200462056143957667309196777332772872873179530790064496494920189134713899296432211361792
  count := 120

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

end FranklSmallCyclic.TransportBatches.G090.B001.Data
