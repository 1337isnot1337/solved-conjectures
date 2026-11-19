module

public import Conjectures.FranklSmallCyclicRowCoverage
public import Conjectures.FranklSmallCyclicCanonicalWords
public import Conjectures.FranklSmallCyclicOrbit8Block023Data

/-! 128 literal targets sharing one source proof block.
Original words and row indices are retained; weights may be transported.
-/
@[expose] public section

namespace FranklSmallCyclic.TransportBatches.G049.B000.Data

-- Period 8, original row 7, representative 6386.
def source0 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B023.Data.entryAt ⟨124, by decide +kernel⟩

def target0 : Weights.Entry :=
  { word := [0, 0, 1, 4, 2, 8, 2], weights := [0, 0, 1, 0] }

-- Period 8, original row 29, representative 6370.
def source1 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B023.Data.entryAt ⟨108, by decide +kernel⟩

def target1 : Weights.Entry :=
  { word := [0, 0, 1, 4, 10, 8, 2], weights := [0, 0, 1, 0] }

-- Period 8, original row 55, representative 6381.
def source2 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B023.Data.entryAt ⟨119, by decide +kernel⟩

def target2 : Weights.Entry :=
  { word := [0, 0, 2, 2, 2, 8, 2], weights := [0, 1, 0, 0] }

-- Period 8, original row 70, representative 6365.
def source3 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B023.Data.entryAt ⟨103, by decide +kernel⟩

def target3 : Weights.Entry :=
  { word := [0, 0, 2, 2, 10, 8, 2], weights := [0, 1, 0, 0] }

-- Period 8, original row 106, representative 6382.
def source4 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B023.Data.entryAt ⟨120, by decide +kernel⟩

def target4 : Weights.Entry :=
  { word := [0, 0, 10, 2, 2, 8, 2], weights := [0, 1, 0, 0] }

-- Period 8, original row 114, representative 6366.
def source5 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B023.Data.entryAt ⟨104, by decide +kernel⟩

def target5 : Weights.Entry :=
  { word := [0, 0, 10, 2, 10, 8, 2], weights := [0, 1, 0, 0] }

-- Period 8, original row 123, representative 6303.
def source6 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B023.Data.entryAt ⟨41, by decide +kernel⟩

def target6 : Weights.Entry :=
  { word := [0, 1, 0, 2, 2, 2, 8], weights := [1, 0, 0, 1] }

-- Period 8, original row 125, representative 6271.
def source7 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B023.Data.entryAt ⟨9, by decide +kernel⟩

def target7 : Weights.Entry :=
  { word := [0, 1, 0, 2, 2, 10, 8], weights := [1, 0, 0, 1] }

-- Period 8, original row 134, representative 6308.
def source8 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B023.Data.entryAt ⟨46, by decide +kernel⟩

def target8 : Weights.Entry :=
  { word := [0, 1, 0, 10, 2, 2, 8], weights := [1, 0, 0, 1] }

-- Period 8, original row 135, representative 6276.
def source9 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B023.Data.entryAt ⟨14, by decide +kernel⟩

def target9 : Weights.Entry :=
  { word := [0, 1, 0, 10, 2, 10, 8], weights := [1, 0, 0, 1] }

-- Period 8, original row 145, representative 6295.
def source10 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B023.Data.entryAt ⟨33, by decide +kernel⟩

def target10 : Weights.Entry :=
  { word := [0, 1, 4, 2, 0, 1, 8], weights := [1, 0, 0, 1] }

-- Period 8, original row 147, representative 6295.
def source11 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B023.Data.entryAt ⟨33, by decide +kernel⟩

def target11 : Weights.Entry :=
  { word := [0, 1, 4, 2, 0, 2, 8], weights := [1, 0, 0, 1] }

def points11 : List (ℕ × ℕ) := [(0, 7), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 0)]

-- Period 8, original row 152, representative 6317.
def source12 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B023.Data.entryAt ⟨55, by decide +kernel⟩

def target12 : Weights.Entry :=
  { word := [0, 1, 4, 2, 0, 8, 8], weights := [1, 0, 0, 1] }

-- Period 8, original row 157, representative 6263.
def source13 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B023.Data.entryAt ⟨1, by decide +kernel⟩

def target13 : Weights.Entry :=
  { word := [0, 1, 4, 2, 0, 9, 8], weights := [1, 0, 0, 1] }

-- Period 8, original row 159, representative 6263.
def source14 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B023.Data.entryAt ⟨1, by decide +kernel⟩

def target14 : Weights.Entry :=
  { word := [0, 1, 4, 2, 0, 10, 8], weights := [1, 0, 0, 1] }

def points14 : List (ℕ × ℕ) := [(0, 7), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 0)]

-- Period 8, original row 161, representative 6300.
def source15 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B023.Data.entryAt ⟨38, by decide +kernel⟩

def target15 : Weights.Entry :=
  { word := [0, 1, 4, 2, 8, 2, 8], weights := [1, 0, 0, 1] }

-- Period 8, original row 165, representative 6268.
def source16 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B023.Data.entryAt ⟨6, by decide +kernel⟩

def target16 : Weights.Entry :=
  { word := [0, 1, 4, 2, 8, 10, 8], weights := [1, 0, 0, 1] }

-- Period 8, original row 167, representative 6295.
def source17 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B023.Data.entryAt ⟨33, by decide +kernel⟩

def target17 : Weights.Entry :=
  { word := [0, 1, 4, 4, 4, 0, 8], weights := [1, 0, 0, 1] }

def points17 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 5), (5, 4), (6, 6), (7, 7)]

-- Period 8, original row 169, representative 6291.
def source18 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B023.Data.entryAt ⟨29, by decide +kernel⟩

def target18 : Weights.Entry :=
  { word := [0, 1, 4, 4, 4, 8, 8], weights := [0, 0, 1, 0] }

-- Period 8, original row 171, representative 6290.
def source19 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B023.Data.entryAt ⟨28, by decide +kernel⟩

def target19 : Weights.Entry :=
  { word := [0, 1, 4, 8, 4, 2, 8], weights := [0, 1, 1, 0] }

-- Period 8, original row 173, representative 6262.
def source20 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B023.Data.entryAt ⟨0, by decide +kernel⟩

def target20 : Weights.Entry :=
  { word := [0, 1, 4, 8, 4, 10, 8], weights := [0, 1, 1, 0] }

-- Period 8, original row 174, representative 6302.
def source21 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B023.Data.entryAt ⟨40, by decide +kernel⟩

def target21 : Weights.Entry :=
  { word := [0, 1, 4, 10, 0, 1, 8], weights := [1, 0, 0, 1] }

-- Period 8, original row 175, representative 6302.
def source22 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B023.Data.entryAt ⟨40, by decide +kernel⟩

def target22 : Weights.Entry :=
  { word := [0, 1, 4, 10, 0, 2, 8], weights := [1, 0, 0, 1] }

def points22 : List (ℕ × ℕ) := [(0, 7), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 0)]

-- Period 8, original row 180, representative 6320.
def source23 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B023.Data.entryAt ⟨58, by decide +kernel⟩

def target23 : Weights.Entry :=
  { word := [0, 1, 4, 10, 0, 8, 8], weights := [1, 0, 0, 1] }

-- Period 8, original row 184, representative 6270.
def source24 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B023.Data.entryAt ⟨8, by decide +kernel⟩

def target24 : Weights.Entry :=
  { word := [0, 1, 4, 10, 0, 9, 8], weights := [1, 0, 0, 1] }

-- Period 8, original row 185, representative 6270.
def source25 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B023.Data.entryAt ⟨8, by decide +kernel⟩

def target25 : Weights.Entry :=
  { word := [0, 1, 4, 10, 0, 10, 8], weights := [1, 0, 0, 1] }

def points25 : List (ℕ × ℕ) := [(0, 7), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 0)]

-- Period 8, original row 191, representative 6301.
def source26 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B023.Data.entryAt ⟨39, by decide +kernel⟩

def target26 : Weights.Entry :=
  { word := [0, 1, 4, 10, 8, 2, 8], weights := [0, 1, 1, 0] }

-- Period 8, original row 196, representative 6269.
def source27 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B023.Data.entryAt ⟨7, by decide +kernel⟩

def target27 : Weights.Entry :=
  { word := [0, 1, 4, 10, 8, 10, 8], weights := [0, 1, 1, 0] }

-- Period 8, original row 199, representative 6302.
def source28 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B023.Data.entryAt ⟨40, by decide +kernel⟩

def target28 : Weights.Entry :=
  { word := [0, 1, 4, 12, 4, 0, 8], weights := [1, 0, 0, 1] }

def points28 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 5), (5, 4), (6, 6), (7, 7)]

-- Period 8, original row 201, representative 6294.
def source29 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B023.Data.entryAt ⟨32, by decide +kernel⟩

def target29 : Weights.Entry :=
  { word := [0, 1, 4, 12, 4, 8, 8], weights := [0, 0, 1, 0] }

-- Period 8, original row 205, representative 6304.
def source30 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B023.Data.entryAt ⟨42, by decide +kernel⟩

def target30 : Weights.Entry :=
  { word := [0, 1, 8, 2, 2, 2, 8], weights := [1, 0, 0, 1] }

-- Period 8, original row 207, representative 6272.
def source31 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B023.Data.entryAt ⟨10, by decide +kernel⟩

def target31 : Weights.Entry :=
  { word := [0, 1, 8, 2, 2, 10, 8], weights := [1, 0, 0, 1] }

-- Period 8, original row 209, representative 6305.
def source32 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B023.Data.entryAt ⟨43, by decide +kernel⟩

def target32 : Weights.Entry :=
  { word := [0, 1, 8, 2, 10, 2, 8], weights := [1, 0, 0, 1] }

-- Period 8, original row 211, representative 6273.
def source33 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B023.Data.entryAt ⟨11, by decide +kernel⟩

def target33 : Weights.Entry :=
  { word := [0, 1, 8, 2, 10, 10, 8], weights := [1, 0, 0, 1] }

-- Period 8, original row 225, representative 6307.
def source34 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B023.Data.entryAt ⟨45, by decide +kernel⟩

def target34 : Weights.Entry :=
  { word := [0, 1, 8, 10, 2, 2, 8], weights := [0, 1, 1, 0] }

-- Period 8, original row 226, representative 6275.
def source35 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B023.Data.entryAt ⟨13, by decide +kernel⟩

def target35 : Weights.Entry :=
  { word := [0, 1, 8, 10, 2, 10, 8], weights := [0, 1, 1, 0] }

-- Period 8, original row 227, representative 6306.
def source36 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B023.Data.entryAt ⟨44, by decide +kernel⟩

def target36 : Weights.Entry :=
  { word := [0, 1, 8, 10, 10, 2, 8], weights := [0, 1, 1, 0] }

-- Period 8, original row 228, representative 6274.
def source37 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B023.Data.entryAt ⟨12, by decide +kernel⟩

def target37 : Weights.Entry :=
  { word := [0, 1, 8, 10, 10, 10, 8], weights := [0, 1, 1, 0] }

-- Period 8, original row 234, representative 6296.
def source38 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B023.Data.entryAt ⟨34, by decide +kernel⟩

def target38 : Weights.Entry :=
  { word := [0, 1, 12, 2, 0, 1, 8], weights := [1, 0, 0, 1] }

-- Period 8, original row 236, representative 6296.
def source39 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B023.Data.entryAt ⟨34, by decide +kernel⟩

def target39 : Weights.Entry :=
  { word := [0, 1, 12, 2, 0, 2, 8], weights := [1, 0, 0, 1] }

def points39 : List (ℕ × ℕ) := [(0, 7), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 0)]

-- Period 8, original row 241, representative 6318.
def source40 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B023.Data.entryAt ⟨56, by decide +kernel⟩

def target40 : Weights.Entry :=
  { word := [0, 1, 12, 2, 0, 8, 8], weights := [1, 0, 0, 1] }

-- Period 8, original row 246, representative 6264.
def source41 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B023.Data.entryAt ⟨2, by decide +kernel⟩

def target41 : Weights.Entry :=
  { word := [0, 1, 12, 2, 0, 9, 8], weights := [1, 0, 0, 1] }

-- Period 8, original row 248, representative 6264.
def source42 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B023.Data.entryAt ⟨2, by decide +kernel⟩

def target42 : Weights.Entry :=
  { word := [0, 1, 12, 2, 0, 10, 8], weights := [1, 0, 0, 1] }

def points42 : List (ℕ × ℕ) := [(0, 7), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 0)]

-- Period 8, original row 250, representative 6297.
def source43 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B023.Data.entryAt ⟨35, by decide +kernel⟩

def target43 : Weights.Entry :=
  { word := [0, 1, 12, 2, 8, 2, 8], weights := [1, 0, 0, 1] }

-- Period 8, original row 254, representative 6265.
def source44 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B023.Data.entryAt ⟨3, by decide +kernel⟩

def target44 : Weights.Entry :=
  { word := [0, 1, 12, 2, 8, 10, 8], weights := [1, 0, 0, 1] }

-- Period 8, original row 256, representative 6296.
def source45 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B023.Data.entryAt ⟨34, by decide +kernel⟩

def target45 : Weights.Entry :=
  { word := [0, 1, 12, 4, 4, 0, 8], weights := [1, 0, 0, 1] }

def points45 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 5), (5, 4), (6, 6), (7, 7)]

-- Period 8, original row 258, representative 6292.
def source46 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B023.Data.entryAt ⟨30, by decide +kernel⟩

def target46 : Weights.Entry :=
  { word := [0, 1, 12, 4, 4, 8, 8], weights := [0, 0, 1, 0] }

-- Period 8, original row 260, representative 6289.
def source47 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B023.Data.entryAt ⟨27, by decide +kernel⟩

def target47 : Weights.Entry :=
  { word := [0, 1, 12, 8, 4, 2, 8], weights := [0, 1, 1, 0] }

-- Period 8, original row 263, representative 6299.
def source48 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B023.Data.entryAt ⟨37, by decide +kernel⟩

def target48 : Weights.Entry :=
  { word := [0, 1, 12, 10, 0, 1, 8], weights := [1, 0, 0, 1] }

-- Period 8, original row 264, representative 6299.
def source49 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B023.Data.entryAt ⟨37, by decide +kernel⟩

def target49 : Weights.Entry :=
  { word := [0, 1, 12, 10, 0, 2, 8], weights := [1, 0, 0, 1] }

def points49 : List (ℕ × ℕ) := [(0, 7), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 0)]

-- Period 8, original row 273, representative 6319.
def source50 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B023.Data.entryAt ⟨57, by decide +kernel⟩

def target50 : Weights.Entry :=
  { word := [0, 1, 12, 10, 0, 8, 8], weights := [1, 0, 0, 1] }

-- Period 8, original row 277, representative 6267.
def source51 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B023.Data.entryAt ⟨5, by decide +kernel⟩

def target51 : Weights.Entry :=
  { word := [0, 1, 12, 10, 0, 9, 8], weights := [1, 0, 0, 1] }

-- Period 8, original row 278, representative 6267.
def source52 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B023.Data.entryAt ⟨5, by decide +kernel⟩

def target52 : Weights.Entry :=
  { word := [0, 1, 12, 10, 0, 10, 8], weights := [1, 0, 0, 1] }

def points52 : List (ℕ × ℕ) := [(0, 7), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 0)]

-- Period 8, original row 284, representative 6298.
def source53 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B023.Data.entryAt ⟨36, by decide +kernel⟩

def target53 : Weights.Entry :=
  { word := [0, 1, 12, 10, 8, 2, 8], weights := [0, 1, 1, 0] }

-- Period 8, original row 289, representative 6266.
def source54 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B023.Data.entryAt ⟨4, by decide +kernel⟩

def target54 : Weights.Entry :=
  { word := [0, 1, 12, 10, 8, 10, 8], weights := [0, 1, 1, 0] }

-- Period 8, original row 292, representative 6299.
def source55 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B023.Data.entryAt ⟨37, by decide +kernel⟩

def target55 : Weights.Entry :=
  { word := [0, 1, 12, 12, 4, 0, 8], weights := [1, 0, 0, 1] }

def points55 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 5), (5, 4), (6, 6), (7, 7)]

-- Period 8, original row 294, representative 6293.
def source56 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B023.Data.entryAt ⟨31, by decide +kernel⟩

def target56 : Weights.Entry :=
  { word := [0, 1, 12, 12, 4, 8, 8], weights := [0, 0, 1, 0] }

-- Period 8, original row 317, representative 6295.
def source57 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B023.Data.entryAt ⟨33, by decide +kernel⟩

def target57 : Weights.Entry :=
  { word := [0, 2, 2, 2, 0, 1, 8], weights := [0, 1, 0, 1] }

def points57 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6), (7, 7)]

-- Period 8, original row 319, representative 6295.
def source58 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B023.Data.entryAt ⟨33, by decide +kernel⟩

def target58 : Weights.Entry :=
  { word := [0, 2, 2, 2, 0, 2, 8], weights := [0, 1, 0, 1] }

def points58 : List (ℕ × ℕ) := [(0, 7), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6), (7, 0)]

-- Period 8, original row 324, representative 6317.
def source59 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B023.Data.entryAt ⟨55, by decide +kernel⟩

def target59 : Weights.Entry :=
  { word := [0, 2, 2, 2, 0, 8, 8], weights := [0, 1, 0, 1] }

def points59 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6), (7, 7)]

-- Period 8, original row 329, representative 6263.
def source60 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B023.Data.entryAt ⟨1, by decide +kernel⟩

def target60 : Weights.Entry :=
  { word := [0, 2, 2, 2, 0, 9, 8], weights := [0, 1, 0, 1] }

def points60 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6), (7, 7)]

-- Period 8, original row 331, representative 6263.
def source61 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B023.Data.entryAt ⟨1, by decide +kernel⟩

def target61 : Weights.Entry :=
  { word := [0, 2, 2, 2, 0, 10, 8], weights := [0, 1, 0, 1] }

def points61 : List (ℕ × ℕ) := [(0, 7), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6), (7, 0)]

-- Period 8, original row 335, representative 6321.
def source62 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B023.Data.entryAt ⟨59, by decide +kernel⟩

def target62 : Weights.Entry :=
  { word := [0, 2, 2, 2, 8, 0, 8], weights := [1, 1, 0, 0] }

-- Period 8, original row 340, representative 6277.
def source63 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B023.Data.entryAt ⟨15, by decide +kernel⟩

def target63 : Weights.Entry :=
  { word := [0, 2, 2, 2, 8, 1, 8], weights := [1, 0, 0, 1] }

-- Period 8, original row 342, representative 6281.
def source64 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B023.Data.entryAt ⟨19, by decide +kernel⟩

def target64 : Weights.Entry :=
  { word := [0, 2, 2, 2, 8, 2, 8], weights := [1, 0, 0, 1] }

-- Period 8, original row 352, representative 6313.
def source65 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B023.Data.entryAt ⟨51, by decide +kernel⟩

def target65 : Weights.Entry :=
  { word := [0, 2, 2, 2, 8, 8, 8], weights := [1, 0, 0, 1] }

-- Period 8, original row 366, representative 6302.
def source66 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B023.Data.entryAt ⟨40, by decide +kernel⟩

def target66 : Weights.Entry :=
  { word := [0, 2, 2, 10, 0, 1, 8], weights := [0, 1, 0, 1] }

def points66 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6), (7, 7)]

-- Period 8, original row 367, representative 6302.
def source67 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B023.Data.entryAt ⟨40, by decide +kernel⟩

def target67 : Weights.Entry :=
  { word := [0, 2, 2, 10, 0, 2, 8], weights := [0, 1, 0, 1] }

def points67 : List (ℕ × ℕ) := [(0, 7), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6), (7, 0)]

-- Period 8, original row 372, representative 6320.
def source68 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B023.Data.entryAt ⟨58, by decide +kernel⟩

def target68 : Weights.Entry :=
  { word := [0, 2, 2, 10, 0, 8, 8], weights := [0, 1, 0, 1] }

def points68 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6), (7, 7)]

-- Period 8, original row 376, representative 6270.
def source69 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B023.Data.entryAt ⟨8, by decide +kernel⟩

def target69 : Weights.Entry :=
  { word := [0, 2, 2, 10, 0, 9, 8], weights := [0, 1, 0, 1] }

def points69 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6), (7, 7)]

-- Period 8, original row 377, representative 6270.
def source70 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B023.Data.entryAt ⟨8, by decide +kernel⟩

def target70 : Weights.Entry :=
  { word := [0, 2, 2, 10, 0, 10, 8], weights := [0, 1, 0, 1] }

def points70 : List (ℕ × ℕ) := [(0, 7), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6), (7, 0)]

-- Period 8, original row 386, representative 6322.
def source71 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B023.Data.entryAt ⟨60, by decide +kernel⟩

def target71 : Weights.Entry :=
  { word := [0, 2, 2, 10, 8, 0, 8], weights := [1, 1, 0, 0] }

-- Period 8, original row 390, representative 6280.
def source72 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B023.Data.entryAt ⟨18, by decide +kernel⟩

def target72 : Weights.Entry :=
  { word := [0, 2, 2, 10, 8, 1, 8], weights := [0, 1, 1, 0] }

-- Period 8, original row 391, representative 6284.
def source73 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B023.Data.entryAt ⟨22, by decide +kernel⟩

def target73 : Weights.Entry :=
  { word := [0, 2, 2, 10, 8, 2, 8], weights := [0, 1, 1, 0] }

-- Period 8, original row 400, representative 6316.
def source74 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B023.Data.entryAt ⟨54, by decide +kernel⟩

def target74 : Weights.Entry :=
  { word := [0, 2, 2, 10, 8, 8, 8], weights := [0, 1, 1, 0] }

-- Period 8, original row 422, representative 6296.
def source75 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B023.Data.entryAt ⟨34, by decide +kernel⟩

def target75 : Weights.Entry :=
  { word := [0, 2, 10, 2, 0, 1, 8], weights := [0, 1, 0, 1] }

def points75 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6), (7, 7)]

-- Period 8, original row 424, representative 6296.
def source76 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B023.Data.entryAt ⟨34, by decide +kernel⟩

def target76 : Weights.Entry :=
  { word := [0, 2, 10, 2, 0, 2, 8], weights := [0, 1, 0, 1] }

def points76 : List (ℕ × ℕ) := [(0, 7), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6), (7, 0)]

-- Period 8, original row 429, representative 6318.
def source77 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B023.Data.entryAt ⟨56, by decide +kernel⟩

def target77 : Weights.Entry :=
  { word := [0, 2, 10, 2, 0, 8, 8], weights := [0, 1, 0, 1] }

def points77 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6), (7, 7)]

-- Period 8, original row 434, representative 6264.
def source78 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B023.Data.entryAt ⟨2, by decide +kernel⟩

def target78 : Weights.Entry :=
  { word := [0, 2, 10, 2, 0, 9, 8], weights := [0, 1, 0, 1] }

def points78 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6), (7, 7)]

-- Period 8, original row 436, representative 6264.
def source79 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B023.Data.entryAt ⟨2, by decide +kernel⟩

def target79 : Weights.Entry :=
  { word := [0, 2, 10, 2, 0, 10, 8], weights := [0, 1, 0, 1] }

def points79 : List (ℕ × ℕ) := [(0, 7), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6), (7, 0)]

-- Period 8, original row 438, representative 6278.
def source80 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B023.Data.entryAt ⟨16, by decide +kernel⟩

def target80 : Weights.Entry :=
  { word := [0, 2, 10, 2, 8, 1, 8], weights := [1, 0, 0, 1] }

-- Period 8, original row 440, representative 6282.
def source81 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B023.Data.entryAt ⟨20, by decide +kernel⟩

def target81 : Weights.Entry :=
  { word := [0, 2, 10, 2, 8, 2, 8], weights := [1, 0, 0, 1] }

-- Period 8, original row 450, representative 6314.
def source82 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B023.Data.entryAt ⟨52, by decide +kernel⟩

def target82 : Weights.Entry :=
  { word := [0, 2, 10, 2, 8, 8, 8], weights := [1, 0, 0, 1] }

-- Period 8, original row 464, representative 6299.
def source83 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B023.Data.entryAt ⟨37, by decide +kernel⟩

def target83 : Weights.Entry :=
  { word := [0, 2, 10, 10, 0, 1, 8], weights := [0, 1, 0, 1] }

def points83 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6), (7, 7)]

-- Period 8, original row 465, representative 6299.
def source84 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B023.Data.entryAt ⟨37, by decide +kernel⟩

def target84 : Weights.Entry :=
  { word := [0, 2, 10, 10, 0, 2, 8], weights := [0, 1, 0, 1] }

def points84 : List (ℕ × ℕ) := [(0, 7), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6), (7, 0)]

-- Period 8, original row 474, representative 6319.
def source85 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B023.Data.entryAt ⟨57, by decide +kernel⟩

def target85 : Weights.Entry :=
  { word := [0, 2, 10, 10, 0, 8, 8], weights := [0, 1, 0, 1] }

def points85 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6), (7, 7)]

-- Period 8, original row 478, representative 6267.
def source86 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B023.Data.entryAt ⟨5, by decide +kernel⟩

def target86 : Weights.Entry :=
  { word := [0, 2, 10, 10, 0, 9, 8], weights := [0, 1, 0, 1] }

def points86 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6), (7, 7)]

-- Period 8, original row 479, representative 6267.
def source87 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B023.Data.entryAt ⟨5, by decide +kernel⟩

def target87 : Weights.Entry :=
  { word := [0, 2, 10, 10, 0, 10, 8], weights := [0, 1, 0, 1] }

def points87 : List (ℕ × ℕ) := [(0, 7), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6), (7, 0)]

-- Period 8, original row 485, representative 6279.
def source88 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B023.Data.entryAt ⟨17, by decide +kernel⟩

def target88 : Weights.Entry :=
  { word := [0, 2, 10, 10, 8, 1, 8], weights := [0, 1, 1, 0] }

-- Period 8, original row 486, representative 6283.
def source89 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B023.Data.entryAt ⟨21, by decide +kernel⟩

def target89 : Weights.Entry :=
  { word := [0, 2, 10, 10, 8, 2, 8], weights := [0, 1, 1, 0] }

-- Period 8, original row 495, representative 6315.
def source90 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B023.Data.entryAt ⟨53, by decide +kernel⟩

def target90 : Weights.Entry :=
  { word := [0, 2, 10, 10, 8, 8, 8], weights := [0, 1, 1, 0] }

-- Period 8, original row 559, representative 6353.
def source91 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B023.Data.entryAt ⟨91, by decide +kernel⟩

def target91 : Weights.Entry :=
  { word := [0, 4, 2, 0, 1, 8, 1], weights := [0, 1, 0, 1] }

-- Period 8, original row 573, representative 6349.
def source92 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B023.Data.entryAt ⟨87, by decide +kernel⟩

def target92 : Weights.Entry :=
  { word := [0, 4, 2, 0, 9, 8, 1], weights := [0, 1, 0, 1] }

-- Period 8, original row 585, representative 6376.
def source93 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B023.Data.entryAt ⟨114, by decide +kernel⟩

def target93 : Weights.Entry :=
  { word := [0, 4, 2, 8, 2, 8, 2], weights := [0, 1, 1, 0] }

-- Period 8, original row 599, representative 6360.
def source94 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B023.Data.entryAt ⟨98, by decide +kernel⟩

def target94 : Weights.Entry :=
  { word := [0, 4, 2, 8, 10, 8, 2], weights := [0, 1, 1, 0] }

-- Period 8, original row 609, representative 6353.
def source95 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B023.Data.entryAt ⟨91, by decide +kernel⟩

def target95 : Weights.Entry :=
  { word := [0, 4, 4, 4, 0, 8, 1], weights := [1, 0, 0, 1] }

def points95 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6), (7, 7)]

-- Period 8, original row 623, representative 6343.
def source96 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B023.Data.entryAt ⟨81, by decide +kernel⟩

def target96 : Weights.Entry :=
  { word := [0, 4, 4, 4, 8, 8, 1], weights := [1, 0, 1, 0] }

-- Period 8, original row 630, representative 6340.
def source97 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B023.Data.entryAt ⟨78, by decide +kernel⟩

def target97 : Weights.Entry :=
  { word := [0, 4, 6, 8, 8, 8, 1], weights := [0, 1, 1, 0] }

-- Period 8, original row 642, representative 6385.
def source98 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B023.Data.entryAt ⟨123, by decide +kernel⟩

def target98 : Weights.Entry :=
  { word := [0, 4, 8, 4, 2, 8, 2], weights := [0, 0, 1, 0] }

-- Period 8, original row 649, representative 6337.
def source99 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B023.Data.entryAt ⟨75, by decide +kernel⟩

def target99 : Weights.Entry :=
  { word := [0, 4, 8, 4, 4, 12, 0], weights := [1, 0, 1, 0] }

-- Period 8, original row 668, representative 6369.
def source100 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B023.Data.entryAt ⟨107, by decide +kernel⟩

def target100 : Weights.Entry :=
  { word := [0, 4, 8, 4, 10, 8, 2], weights := [0, 0, 1, 0] }

-- Period 8, original row 675, representative 6329.
def source101 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B023.Data.entryAt ⟨67, by decide +kernel⟩

def target101 : Weights.Entry :=
  { word := [0, 4, 8, 4, 12, 12, 0], weights := [1, 0, 1, 0] }

-- Period 8, original row 691, representative 6356.
def source102 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B023.Data.entryAt ⟨94, by decide +kernel⟩

def target102 : Weights.Entry :=
  { word := [0, 4, 10, 0, 1, 8, 1], weights := [0, 1, 0, 1] }

-- Period 8, original row 698, representative 6352.
def source103 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B023.Data.entryAt ⟨90, by decide +kernel⟩

def target103 : Weights.Entry :=
  { word := [0, 4, 10, 0, 9, 8, 1], weights := [0, 1, 0, 1] }

-- Period 8, original row 705, representative 6375.
def source104 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B023.Data.entryAt ⟨113, by decide +kernel⟩

def target104 : Weights.Entry :=
  { word := [0, 4, 10, 8, 2, 8, 2], weights := [0, 1, 1, 0] }

-- Period 8, original row 714, representative 6359.
def source105 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B023.Data.entryAt ⟨97, by decide +kernel⟩

def target105 : Weights.Entry :=
  { word := [0, 4, 10, 8, 10, 8, 2], weights := [0, 1, 1, 0] }

-- Period 8, original row 717, representative 6356.
def source106 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B023.Data.entryAt ⟨94, by decide +kernel⟩

def target106 : Weights.Entry :=
  { word := [0, 4, 12, 4, 0, 8, 1], weights := [1, 0, 0, 1] }

def points106 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6), (7, 7)]

-- Period 8, original row 731, representative 6346.
def source107 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B023.Data.entryAt ⟨84, by decide +kernel⟩

def target107 : Weights.Entry :=
  { word := [0, 4, 12, 4, 8, 8, 1], weights := [1, 0, 1, 0] }

-- Period 8, original row 820, representative 6388.
def source108 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B023.Data.entryAt ⟨126, by decide +kernel⟩

def target108 : Weights.Entry :=
  { word := [0, 8, 0, 4, 2, 8, 2], weights := [0, 0, 1, 0] }

-- Period 8, original row 846, representative 6372.
def source109 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B023.Data.entryAt ⟨110, by decide +kernel⟩

def target109 : Weights.Entry :=
  { word := [0, 8, 0, 4, 10, 8, 2], weights := [0, 0, 1, 0] }

-- Period 8, original row 899, representative 6387.
def source110 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B023.Data.entryAt ⟨125, by decide +kernel⟩

def target110 : Weights.Entry :=
  { word := [0, 8, 1, 4, 2, 8, 2], weights := [0, 0, 1, 0] }

-- Period 8, original row 921, representative 6371.
def source111 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B023.Data.entryAt ⟨109, by decide +kernel⟩

def target111 : Weights.Entry :=
  { word := [0, 8, 1, 4, 10, 8, 2], weights := [0, 0, 1, 0] }

-- Period 8, original row 946, representative 6331.
def source112 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B023.Data.entryAt ⟨69, by decide +kernel⟩

def target112 : Weights.Entry :=
  { word := [0, 8, 2, 2, 2, 8, 1], weights := [0, 1, 0, 0] }

-- Period 8, original row 947, representative 6377.
def source113 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B023.Data.entryAt ⟨115, by decide +kernel⟩

def target113 : Weights.Entry :=
  { word := [0, 8, 2, 2, 2, 8, 2], weights := [0, 1, 0, 0] }

-- Period 8, original row 961, representative 6323.
def source114 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B023.Data.entryAt ⟨61, by decide +kernel⟩

def target114 : Weights.Entry :=
  { word := [0, 8, 2, 2, 10, 8, 1], weights := [0, 1, 0, 0] }

-- Period 8, original row 962, representative 6361.
def source115 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B023.Data.entryAt ⟨99, by decide +kernel⟩

def target115 : Weights.Entry :=
  { word := [0, 8, 2, 2, 10, 8, 2], weights := [0, 1, 0, 0] }

-- Period 8, original row 963, representative 6389.
def source116 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B023.Data.entryAt ⟨127, by decide +kernel⟩

def target116 : Weights.Entry :=
  { word := [0, 8, 2, 2, 10, 8, 4], weights := [1, 0, 0, 1] }

-- Period 8, original row 975, representative 6334.
def source117 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B023.Data.entryAt ⟨72, by decide +kernel⟩

def target117 : Weights.Entry :=
  { word := [0, 8, 2, 10, 2, 8, 1], weights := [0, 1, 0, 0] }

-- Period 8, original row 976, representative 6380.
def source118 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B023.Data.entryAt ⟨118, by decide +kernel⟩

def target118 : Weights.Entry :=
  { word := [0, 8, 2, 10, 2, 8, 2], weights := [0, 1, 0, 0] }

-- Period 8, original row 989, representative 6326.
def source119 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B023.Data.entryAt ⟨64, by decide +kernel⟩

def target119 : Weights.Entry :=
  { word := [0, 8, 2, 10, 10, 8, 1], weights := [0, 1, 0, 0] }

-- Period 8, original row 990, representative 6364.
def source120 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B023.Data.entryAt ⟨102, by decide +kernel⟩

def target120 : Weights.Entry :=
  { word := [0, 8, 2, 10, 10, 8, 2], weights := [0, 1, 0, 0] }

-- Period 8, original row 1013, representative 6347.
def source121 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B023.Data.entryAt ⟨85, by decide +kernel⟩

def target121 : Weights.Entry :=
  { word := [0, 8, 6, 2, 0, 8, 1], weights := [1, 0, 0, 1] }

-- Period 8, original row 1021, representative 6341.
def source122 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B023.Data.entryAt ⟨79, by decide +kernel⟩

def target122 : Weights.Entry :=
  { word := [0, 8, 6, 2, 8, 8, 1], weights := [0, 1, 0, 0] }

-- Period 8, original row 1028, representative 6348.
def source123 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B023.Data.entryAt ⟨86, by decide +kernel⟩

def target123 : Weights.Entry :=
  { word := [0, 8, 6, 10, 0, 8, 1], weights := [1, 0, 0, 1] }

-- Period 8, original row 1035, representative 6342.
def source124 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B023.Data.entryAt ⟨80, by decide +kernel⟩

def target124 : Weights.Entry :=
  { word := [0, 8, 6, 10, 8, 8, 1], weights := [0, 1, 0, 0] }

-- Period 8, original row 1044, representative 6338.
def source125 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B023.Data.entryAt ⟨76, by decide +kernel⟩

def target125 : Weights.Entry :=
  { word := [0, 8, 8, 4, 4, 12, 0], weights := [1, 0, 1, 0] }

-- Period 8, original row 1052, representative 6330.
def source126 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B023.Data.entryAt ⟨68, by decide +kernel⟩

def target126 : Weights.Entry :=
  { word := [0, 8, 8, 4, 12, 12, 0], weights := [0, 0, 1, 0] }

-- Period 8, original row 1070, representative 6335.
def source127 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B023.Data.entryAt ⟨73, by decide +kernel⟩

def target127 : Weights.Entry :=
  { word := [0, 8, 9, 4, 4, 12, 0], weights := [1, 0, 1, 0] }

def period8Entries : List Weights.Entry := [target0, target1, target2, target3, target4, target5, target6, target7, target8, target9, target10, target11, target12, target13, target14, target15, target16, target17, target18, target19, target20, target21, target22, target23, target24, target25, target26, target27, target28, target29, target30, target31, target32, target33, target34, target35, target36, target37, target38, target39, target40, target41, target42, target43, target44, target45, target46, target47, target48, target49, target50, target51, target52, target53, target54, target55, target56, target57, target58, target59, target60, target61, target62, target63, target64, target65, target66, target67, target68, target69, target70, target71, target72, target73, target74, target75, target76, target77, target78, target79, target80, target81, target82, target83, target84, target85, target86, target87, target88, target89, target90, target91, target92, target93, target94, target95, target96, target97, target98, target99, target100, target101, target102, target103, target104, target105, target106, target107, target108, target109, target110, target111, target112, target113, target114, target115, target116, target117, target118, target119, target120, target121, target122, target123, target124, target125, target126, target127]

def period8Chunk : RowCoverage.Chunk where
  rows := [⟨7, target0⟩, ⟨29, target1⟩, ⟨55, target2⟩, ⟨70, target3⟩, ⟨106, target4⟩, ⟨114, target5⟩, ⟨123, target6⟩, ⟨125, target7⟩, ⟨134, target8⟩, ⟨135, target9⟩, ⟨145, target10⟩, ⟨147, target11⟩, ⟨152, target12⟩, ⟨157, target13⟩, ⟨159, target14⟩, ⟨161, target15⟩, ⟨165, target16⟩, ⟨167, target17⟩, ⟨169, target18⟩, ⟨171, target19⟩, ⟨173, target20⟩, ⟨174, target21⟩, ⟨175, target22⟩, ⟨180, target23⟩, ⟨184, target24⟩, ⟨185, target25⟩, ⟨191, target26⟩, ⟨196, target27⟩, ⟨199, target28⟩, ⟨201, target29⟩, ⟨205, target30⟩, ⟨207, target31⟩, ⟨209, target32⟩, ⟨211, target33⟩, ⟨225, target34⟩, ⟨226, target35⟩, ⟨227, target36⟩, ⟨228, target37⟩, ⟨234, target38⟩, ⟨236, target39⟩, ⟨241, target40⟩, ⟨246, target41⟩, ⟨248, target42⟩, ⟨250, target43⟩, ⟨254, target44⟩, ⟨256, target45⟩, ⟨258, target46⟩, ⟨260, target47⟩, ⟨263, target48⟩, ⟨264, target49⟩, ⟨273, target50⟩, ⟨277, target51⟩, ⟨278, target52⟩, ⟨284, target53⟩, ⟨289, target54⟩, ⟨292, target55⟩, ⟨294, target56⟩, ⟨317, target57⟩, ⟨319, target58⟩, ⟨324, target59⟩, ⟨329, target60⟩, ⟨331, target61⟩, ⟨335, target62⟩, ⟨340, target63⟩, ⟨342, target64⟩, ⟨352, target65⟩, ⟨366, target66⟩, ⟨367, target67⟩, ⟨372, target68⟩, ⟨376, target69⟩, ⟨377, target70⟩, ⟨386, target71⟩, ⟨390, target72⟩, ⟨391, target73⟩, ⟨400, target74⟩, ⟨422, target75⟩, ⟨424, target76⟩, ⟨429, target77⟩, ⟨434, target78⟩, ⟨436, target79⟩, ⟨438, target80⟩, ⟨440, target81⟩, ⟨450, target82⟩, ⟨464, target83⟩, ⟨465, target84⟩, ⟨474, target85⟩, ⟨478, target86⟩, ⟨479, target87⟩, ⟨485, target88⟩, ⟨486, target89⟩, ⟨495, target90⟩, ⟨559, target91⟩, ⟨573, target92⟩, ⟨585, target93⟩, ⟨599, target94⟩, ⟨609, target95⟩, ⟨623, target96⟩, ⟨630, target97⟩, ⟨642, target98⟩, ⟨649, target99⟩, ⟨668, target100⟩, ⟨675, target101⟩, ⟨691, target102⟩, ⟨698, target103⟩, ⟨705, target104⟩, ⟨714, target105⟩, ⟨717, target106⟩, ⟨731, target107⟩, ⟨820, target108⟩, ⟨846, target109⟩, ⟨899, target110⟩, ⟨921, target111⟩, ⟨946, target112⟩, ⟨947, target113⟩, ⟨961, target114⟩, ⟨962, target115⟩, ⟨963, target116⟩, ⟨975, target117⟩, ⟨976, target118⟩, ⟨989, target119⟩, ⟨990, target120⟩, ⟨1013, target121⟩, ⟨1021, target122⟩, ⟨1028, target123⟩, ⟨1035, target124⟩, ⟨1044, target125⟩, ⟨1052, target126⟩, ⟨1070, target127⟩]
  indexMask := 12650189277037408210674295013133265930795621129847753509008476987663148088613844848177854566464597457969022358798537011959528977879740941655308389930594088890075950753253258209964011245207595075345201041632326256168459955124335522619251098047858278469482953539351202543440698430172881672720635626946618550030617696821837952
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

end FranklSmallCyclic.TransportBatches.G049.B000.Data
