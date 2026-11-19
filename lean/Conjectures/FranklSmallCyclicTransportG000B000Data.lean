module

public import Conjectures.FranklSmallCyclicRowCoverage
public import Conjectures.FranklSmallCyclicCanonicalWords
public import Conjectures.FranklSmallCyclicOrbit7Block000Data

/-! 128 literal targets sharing one source proof block.
Original words and row indices are retained; weights may be transported.
-/
@[expose] public section

namespace FranklSmallCyclic.TransportBatches.G000.B000.Data

-- Period 7, original row 1, representative 2.
def source0 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B000.Data.entryAt ⟨0, by decide +kernel⟩

def target0 : Weights.Entry :=
  { word := [0, 0, 1, 4, 2, 0, 2], weights := [0, 0, 1, 0] }

-- Period 7, original row 47, representative 2.
def source1 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B000.Data.entryAt ⟨0, by decide +kernel⟩

def target1 : Weights.Entry :=
  { word := [0, 0, 2, 2, 2, 0, 2], weights := [0, 1, 0, 0] }

def points1 : List (ℕ × ℕ) := [(0, 0), (2, 2), (3, 3), (4, 5), (5, 4), (6, 6)]

-- Period 7, original row 146, representative 2.
def source2 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B000.Data.entryAt ⟨0, by decide +kernel⟩

def target2 : Weights.Entry :=
  { word := [0, 1, 4, 2, 0, 2, 0], weights := [0, 0, 0, 1] }

def points2 : List (ℕ × ℕ) := [(0, 1), (2, 2), (3, 4), (4, 5), (5, 6), (6, 3)]

-- Period 7, original row 304, representative 105.
def source3 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B000.Data.entryAt ⟨101, by decide +kernel⟩

def target3 : Weights.Entry :=
  { word := [0, 2, 0, 8, 4, 4, 12], weights := [0, 1, 0, 1] }

-- Period 7, original row 306, representative 18.
def source4 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B000.Data.entryAt ⟨16, by decide +kernel⟩

def target4 : Weights.Entry :=
  { word := [0, 2, 0, 8, 8, 4, 6], weights := [0, 1, 0, 1] }

-- Period 7, original row 315, representative 101.
def source5 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B000.Data.entryAt ⟨97, by decide +kernel⟩

def target5 : Weights.Entry :=
  { word := [0, 2, 0, 8, 12, 4, 12], weights := [0, 1, 0, 1] }

-- Period 7, original row 318, representative 2.
def source6 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B000.Data.entryAt ⟨0, by decide +kernel⟩

def target6 : Weights.Entry :=
  { word := [0, 2, 2, 2, 0, 2, 0], weights := [0, 0, 0, 1] }

def points6 : List (ℕ × ℕ) := [(0, 1), (2, 2), (3, 3), (4, 5), (5, 6), (6, 4)]

-- Period 7, original row 412, representative 104.
def source7 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B000.Data.entryAt ⟨100, by decide +kernel⟩

def target7 : Weights.Entry :=
  { word := [0, 2, 8, 8, 4, 4, 12], weights := [0, 1, 0, 1] }

-- Period 7, original row 415, representative 97.
def source8 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B000.Data.entryAt ⟨93, by decide +kernel⟩

def target8 : Weights.Entry :=
  { word := [0, 2, 8, 8, 4, 12, 12], weights := [0, 1, 0, 1] }

-- Period 7, original row 417, representative 100.
def source9 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B000.Data.entryAt ⟨96, by decide +kernel⟩

def target9 : Weights.Entry :=
  { word := [0, 2, 8, 8, 12, 4, 12], weights := [0, 1, 0, 1] }

-- Period 7, original row 420, representative 95.
def source10 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B000.Data.entryAt ⟨91, by decide +kernel⟩

def target10 : Weights.Entry :=
  { word := [0, 2, 8, 8, 12, 12, 12], weights := [0, 1, 0, 1] }

-- Period 7, original row 506, representative 2.
def source11 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B000.Data.entryAt ⟨0, by decide +kernel⟩

def target11 : Weights.Entry :=
  { word := [0, 4, 0, 4, 2, 0, 1], weights := [0, 0, 1, 0] }

def points11 : List (ℕ × ℕ) := [(0, 0), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 518, representative 2.
def source12 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B000.Data.entryAt ⟨0, by decide +kernel⟩

def target12 : Weights.Entry :=
  { word := [0, 4, 0, 4, 4, 4, 0], weights := [0, 0, 0, 1] }

def points12 : List (ℕ × ℕ) := [(0, 0), (2, 1), (3, 3), (4, 4), (5, 6), (6, 5)]

-- Period 7, original row 554, representative 2.
def source13 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B000.Data.entryAt ⟨0, by decide +kernel⟩

def target13 : Weights.Entry :=
  { word := [0, 4, 2, 0, 1, 0, 4], weights := [0, 0, 1, 0] }

def points13 : List (ℕ × ℕ) := [(0, 2), (2, 1), (3, 4), (4, 3), (5, 5), (6, 6)]

-- Period 7, original row 604, representative 2.
def source14 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B000.Data.entryAt ⟨0, by decide +kernel⟩

def target14 : Weights.Entry :=
  { word := [0, 4, 4, 4, 0, 0, 4], weights := [0, 0, 1, 0] }

def points14 : List (ℕ × ℕ) := [(0, 2), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 864, representative 23.
def source15 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B000.Data.entryAt ⟨21, by decide +kernel⟩

def target15 : Weights.Entry :=
  { word := [0, 8, 0, 8, 8, 4, 6], weights := [0, 1, 0, 1] }

-- Period 7, original row 1353, representative 103.
def source16 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B000.Data.entryAt ⟨99, by decide +kernel⟩

def target16 : Weights.Entry :=
  { word := [0, 10, 0, 8, 4, 4, 12], weights := [0, 1, 0, 1] }

-- Period 7, original row 1355, representative 17.
def source17 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B000.Data.entryAt ⟨15, by decide +kernel⟩

def target17 : Weights.Entry :=
  { word := [0, 10, 0, 8, 8, 4, 6], weights := [0, 1, 0, 1] }

-- Period 7, original row 1364, representative 99.
def source18 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B000.Data.entryAt ⟨95, by decide +kernel⟩

def target18 : Weights.Entry :=
  { word := [0, 10, 0, 8, 12, 4, 12], weights := [0, 1, 0, 1] }

-- Period 7, original row 1444, representative 102.
def source19 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B000.Data.entryAt ⟨98, by decide +kernel⟩

def target19 : Weights.Entry :=
  { word := [0, 10, 8, 8, 4, 4, 12], weights := [0, 1, 0, 1] }

-- Period 7, original row 1447, representative 96.
def source20 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B000.Data.entryAt ⟨92, by decide +kernel⟩

def target20 : Weights.Entry :=
  { word := [0, 10, 8, 8, 4, 12, 12], weights := [0, 1, 0, 1] }

-- Period 7, original row 1449, representative 98.
def source21 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B000.Data.entryAt ⟨94, by decide +kernel⟩

def target21 : Weights.Entry :=
  { word := [0, 10, 8, 8, 12, 4, 12], weights := [0, 1, 0, 1] }

-- Period 7, original row 1452, representative 94.
def source22 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B000.Data.entryAt ⟨90, by decide +kernel⟩

def target22 : Weights.Entry :=
  { word := [0, 10, 8, 8, 12, 12, 12], weights := [0, 1, 0, 1] }

-- Period 7, original row 1738, representative 2.
def source23 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B000.Data.entryAt ⟨0, by decide +kernel⟩

def target23 : Weights.Entry :=
  { word := [1, 0, 1, 4, 2, 0, 2], weights := [0, 0, 1, 0] }

def points23 : List (ℕ × ℕ) := [(0, 0), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 1784, representative 2.
def source24 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B000.Data.entryAt ⟨0, by decide +kernel⟩

def target24 : Weights.Entry :=
  { word := [1, 0, 2, 2, 2, 0, 2], weights := [0, 1, 0, 0] }

def points24 : List (ℕ × ℕ) := [(0, 0), (2, 2), (3, 3), (4, 5), (5, 4), (6, 6)]

-- Period 7, original row 1843, representative 2.
def source25 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B000.Data.entryAt ⟨0, by decide +kernel⟩

def target25 : Weights.Entry :=
  { word := [1, 4, 2, 0, 1, 0, 4], weights := [0, 0, 1, 0] }

def points25 : List (ℕ × ℕ) := [(0, 2), (2, 1), (3, 4), (4, 3), (5, 5), (6, 6)]

-- Period 7, original row 1893, representative 2.
def source26 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B000.Data.entryAt ⟨0, by decide +kernel⟩

def target26 : Weights.Entry :=
  { word := [1, 4, 4, 4, 0, 0, 4], weights := [0, 0, 1, 0] }

def points26 : List (ℕ × ℕ) := [(0, 2), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 2381, representative 2.
def source27 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B000.Data.entryAt ⟨0, by decide +kernel⟩

def target27 : Weights.Entry :=
  { word := [2, 0, 0, 1, 4, 2, 0], weights := [0, 0, 1, 0] }

def points27 : List (ℕ × ℕ) := [(0, 1), (2, 0), (3, 4), (4, 6), (5, 5), (6, 3)]

-- Period 7, original row 2383, representative 2.
def source28 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B000.Data.entryAt ⟨0, by decide +kernel⟩

def target28 : Weights.Entry :=
  { word := [2, 0, 0, 2, 2, 2, 0], weights := [0, 0, 0, 1] }

def points28 : List (ℕ × ℕ) := [(0, 1), (2, 0), (3, 4), (4, 5), (5, 6), (6, 3)]

-- Period 7, original row 2592, representative 20.
def source29 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B000.Data.entryAt ⟨18, by decide +kernel⟩

def target29 : Weights.Entry :=
  { word := [2, 2, 0, 9, 8, 8, 6], weights := [1, 1, 0, 1] }

-- Period 7, original row 2697, representative 19.
def source30 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B000.Data.entryAt ⟨17, by decide +kernel⟩

def target30 : Weights.Entry :=
  { word := [2, 2, 8, 9, 8, 8, 6], weights := [1, 1, 0, 1] }

-- Period 7, original row 3181, representative 14.
def source31 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B000.Data.entryAt ⟨12, by decide +kernel⟩

def target31 : Weights.Entry :=
  { word := [2, 10, 0, 9, 8, 8, 6], weights := [1, 1, 0, 1] }

-- Period 7, original row 3292, representative 13.
def source32 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B000.Data.entryAt ⟨11, by decide +kernel⟩

def target32 : Weights.Entry :=
  { word := [2, 10, 8, 9, 8, 8, 6], weights := [1, 1, 0, 1] }

-- Period 7, original row 3415, representative 2.
def source33 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B000.Data.entryAt ⟨0, by decide +kernel⟩

def target33 : Weights.Entry :=
  { word := [4, 0, 4, 2, 0, 1, 0], weights := [0, 0, 0, 1] }

def points33 : List (ℕ × ℕ) := [(0, 0), (2, 2), (3, 4), (4, 5), (5, 6), (6, 3)]

-- Period 7, original row 3437, representative 2.
def source34 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B000.Data.entryAt ⟨0, by decide +kernel⟩

def target34 : Weights.Entry :=
  { word := [4, 0, 4, 4, 4, 0, 0], weights := [0, 0, 0, 1] }

def points34 : List (ℕ × ℕ) := [(0, 0), (2, 2), (3, 5), (4, 4), (5, 6), (6, 3)]

-- Period 7, original row 3578, representative 6.
def source35 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B000.Data.entryAt ⟨4, by decide +kernel⟩

def target35 : Weights.Entry :=
  { word := [4, 2, 0, 9, 8, 8, 6], weights := [1, 1, 0, 1] }

-- Period 7, original row 3982, representative 5.
def source36 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B000.Data.entryAt ⟨3, by decide +kernel⟩

def target36 : Weights.Entry :=
  { word := [4, 10, 0, 9, 8, 8, 6], weights := [1, 1, 0, 1] }

-- Period 7, original row 4076, representative 18.
def source37 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B000.Data.entryAt ⟨16, by decide +kernel⟩

def target37 : Weights.Entry :=
  { word := [6, 2, 8, 8, 0, 4, 0], weights := [1, 0, 1, 0] }

def points37 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 4077, representative 23.
def source38 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B000.Data.entryAt ⟨21, by decide +kernel⟩

def target38 : Weights.Entry :=
  { word := [6, 2, 8, 8, 0, 8, 0], weights := [1, 0, 1, 0] }

def points38 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 4078, representative 17.
def source39 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B000.Data.entryAt ⟨15, by decide +kernel⟩

def target39 : Weights.Entry :=
  { word := [6, 2, 8, 8, 0, 12, 0], weights := [1, 0, 1, 0] }

def points39 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 4079, representative 16.
def source40 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B000.Data.entryAt ⟨14, by decide +kernel⟩

def target40 : Weights.Entry :=
  { word := [6, 2, 8, 8, 1, 4, 8], weights := [0, 1, 3, 0] }

-- Period 7, original row 4080, representative 15.
def source41 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B000.Data.entryAt ⟨13, by decide +kernel⟩

def target41 : Weights.Entry :=
  { word := [6, 2, 8, 8, 1, 12, 8], weights := [0, 1, 3, 0] }

-- Period 7, original row 4081, representative 6.
def source42 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B000.Data.entryAt ⟨4, by decide +kernel⟩

def target42 : Weights.Entry :=
  { word := [6, 8, 8, 8, 1, 4, 2], weights := [1, 0, 1, 1] }

def points42 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 4082, representative 20.
def source43 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B000.Data.entryAt ⟨18, by decide +kernel⟩

def target43 : Weights.Entry :=
  { word := [6, 8, 8, 8, 1, 4, 4], weights := [1, 0, 1, 1] }

def points43 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 4083, representative 22.
def source44 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B000.Data.entryAt ⟨20, by decide +kernel⟩

def target44 : Weights.Entry :=
  { word := [6, 8, 8, 8, 1, 4, 8], weights := [0, 0, 1, 0] }

-- Period 7, original row 4084, representative 4.
def source45 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B000.Data.entryAt ⟨2, by decide +kernel⟩

def target45 : Weights.Entry :=
  { word := [6, 8, 8, 8, 1, 4, 10], weights := [1, 0, 1, 1] }

-- Period 7, original row 4085, representative 10.
def source46 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B000.Data.entryAt ⟨8, by decide +kernel⟩

def target46 : Weights.Entry :=
  { word := [6, 8, 8, 8, 1, 4, 12], weights := [1, 0, 1, 1] }

-- Period 7, original row 4086, representative 5.
def source47 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B000.Data.entryAt ⟨3, by decide +kernel⟩

def target47 : Weights.Entry :=
  { word := [6, 8, 8, 8, 1, 12, 2], weights := [1, 0, 1, 1] }

def points47 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 4087, representative 14.
def source48 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B000.Data.entryAt ⟨12, by decide +kernel⟩

def target48 : Weights.Entry :=
  { word := [6, 8, 8, 8, 1, 12, 4], weights := [1, 0, 1, 1] }

def points48 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 4088, representative 21.
def source49 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B000.Data.entryAt ⟨19, by decide +kernel⟩

def target49 : Weights.Entry :=
  { word := [6, 8, 8, 8, 1, 12, 8], weights := [0, 0, 1, 0] }

-- Period 7, original row 4089, representative 3.
def source50 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B000.Data.entryAt ⟨1, by decide +kernel⟩

def target50 : Weights.Entry :=
  { word := [6, 8, 8, 8, 1, 12, 10], weights := [1, 0, 1, 1] }

-- Period 7, original row 4090, representative 8.
def source51 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B000.Data.entryAt ⟨6, by decide +kernel⟩

def target51 : Weights.Entry :=
  { word := [6, 8, 8, 8, 1, 12, 12], weights := [1, 0, 1, 1] }

-- Period 7, original row 4091, representative 19.
def source52 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B000.Data.entryAt ⟨17, by decide +kernel⟩

def target52 : Weights.Entry :=
  { word := [6, 8, 8, 8, 9, 4, 4], weights := [1, 0, 1, 1] }

def points52 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 4092, representative 9.
def source53 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B000.Data.entryAt ⟨7, by decide +kernel⟩

def target53 : Weights.Entry :=
  { word := [6, 8, 8, 8, 9, 4, 12], weights := [1, 0, 1, 1] }

-- Period 7, original row 4093, representative 13.
def source54 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B000.Data.entryAt ⟨11, by decide +kernel⟩

def target54 : Weights.Entry :=
  { word := [6, 8, 8, 8, 9, 12, 4], weights := [1, 0, 1, 1] }

def points54 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 4094, representative 7.
def source55 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B000.Data.entryAt ⟨5, by decide +kernel⟩

def target55 : Weights.Entry :=
  { word := [6, 8, 8, 8, 9, 12, 12], weights := [1, 0, 1, 1] }

-- Period 7, original row 4095, representative 12.
def source56 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B000.Data.entryAt ⟨10, by decide +kernel⟩

def target56 : Weights.Entry :=
  { word := [6, 10, 8, 8, 1, 4, 8], weights := [0, 1, 3, 0] }

-- Period 7, original row 4096, representative 11.
def source57 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B000.Data.entryAt ⟨9, by decide +kernel⟩

def target57 : Weights.Entry :=
  { word := [6, 10, 8, 8, 1, 12, 8], weights := [0, 1, 3, 0] }

-- Period 7, original row 4498, representative 58.
def source58 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B000.Data.entryAt ⟨55, by decide +kernel⟩

def target58 : Weights.Entry :=
  { word := [8, 1, 0, 9, 4, 4, 12], weights := [1, 0, 1, 1] }

-- Period 7, original row 4500, representative 36.
def source59 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B000.Data.entryAt ⟨33, by decide +kernel⟩

def target59 : Weights.Entry :=
  { word := [8, 1, 0, 9, 4, 12, 12], weights := [1, 0, 1, 1] }

-- Period 7, original row 4502, representative 56.
def source60 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B000.Data.entryAt ⟨53, by decide +kernel⟩

def target60 : Weights.Entry :=
  { word := [8, 1, 0, 9, 12, 4, 12], weights := [1, 0, 1, 1] }

-- Period 7, original row 4504, representative 34.
def source61 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B000.Data.entryAt ⟨31, by decide +kernel⟩

def target61 : Weights.Entry :=
  { word := [8, 1, 0, 9, 12, 12, 12], weights := [1, 0, 1, 1] }

-- Period 7, original row 4511, representative 48.
def source62 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B000.Data.entryAt ⟨45, by decide +kernel⟩

def target62 : Weights.Entry :=
  { word := [8, 1, 0, 12, 0, 4, 12], weights := [1, 0, 1, 0] }

-- Period 7, original row 4514, representative 28.
def source63 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B000.Data.entryAt ⟨26, by decide +kernel⟩

def target63 : Weights.Entry :=
  { word := [8, 1, 0, 12, 0, 12, 12], weights := [1, 0, 1, 0] }

-- Period 7, original row 4526, representative 86.
def source64 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B000.Data.entryAt ⟨82, by decide +kernel⟩

def target64 : Weights.Entry :=
  { word := [8, 1, 4, 2, 0, 8, 12], weights := [1, 0, 0, 1] }

-- Period 7, original row 4534, representative 87.
def source65 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B000.Data.entryAt ⟨83, by decide +kernel⟩

def target65 : Weights.Entry :=
  { word := [8, 1, 4, 2, 8, 8, 12], weights := [1, 0, 0, 1] }

-- Period 7, original row 4554, representative 93.
def source66 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B000.Data.entryAt ⟨89, by decide +kernel⟩

def target66 : Weights.Entry :=
  { word := [8, 1, 4, 10, 0, 8, 12], weights := [1, 0, 0, 1] }

-- Period 7, original row 4561, representative 42.
def source67 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B000.Data.entryAt ⟨39, by decide +kernel⟩

def target67 : Weights.Entry :=
  { word := [8, 1, 4, 10, 0, 12, 12], weights := [1, 0, 1, 1] }

-- Period 7, original row 4564, representative 61.
def source68 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B000.Data.entryAt ⟨58, by decide +kernel⟩

def target68 : Weights.Entry :=
  { word := [8, 1, 4, 10, 8, 4, 12], weights := [1, 0, 1, 1] }

-- Period 7, original row 4566, representative 90.
def source69 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B000.Data.entryAt ⟨86, by decide +kernel⟩

def target69 : Weights.Entry :=
  { word := [8, 1, 4, 10, 8, 8, 12], weights := [1, 0, 0, 1] }

-- Period 7, original row 4569, representative 40.
def source70 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B000.Data.entryAt ⟨37, by decide +kernel⟩

def target70 : Weights.Entry :=
  { word := [8, 1, 4, 10, 8, 12, 12], weights := [1, 0, 1, 1] }

-- Period 7, original row 4589, representative 57.
def source71 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B000.Data.entryAt ⟨54, by decide +kernel⟩

def target71 : Weights.Entry :=
  { word := [8, 1, 8, 9, 4, 4, 12], weights := [1, 0, 1, 1] }

-- Period 7, original row 4591, representative 35.
def source72 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B000.Data.entryAt ⟨32, by decide +kernel⟩

def target72 : Weights.Entry :=
  { word := [8, 1, 8, 9, 4, 12, 12], weights := [1, 0, 1, 1] }

-- Period 7, original row 4593, representative 55.
def source73 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B000.Data.entryAt ⟨52, by decide +kernel⟩

def target73 : Weights.Entry :=
  { word := [8, 1, 8, 9, 12, 4, 12], weights := [1, 0, 1, 1] }

-- Period 7, original row 4595, representative 33.
def source74 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B000.Data.entryAt ⟨30, by decide +kernel⟩

def target74 : Weights.Entry :=
  { word := [8, 1, 8, 9, 12, 12, 12], weights := [1, 0, 1, 1] }

-- Period 7, original row 4615, representative 91.
def source75 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B000.Data.entryAt ⟨87, by decide +kernel⟩

def target75 : Weights.Entry :=
  { word := [8, 1, 12, 2, 0, 8, 12], weights := [1, 0, 0, 1] }

-- Period 7, original row 4623, representative 88.
def source76 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B000.Data.entryAt ⟨84, by decide +kernel⟩

def target76 : Weights.Entry :=
  { word := [8, 1, 12, 2, 8, 8, 12], weights := [1, 0, 0, 1] }

-- Period 7, original row 4640, representative 60.
def source77 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B000.Data.entryAt ⟨57, by decide +kernel⟩

def target77 : Weights.Entry :=
  { word := [8, 1, 12, 10, 0, 4, 12], weights := [1, 0, 1, 1] }

-- Period 7, original row 4647, representative 92.
def source78 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B000.Data.entryAt ⟨88, by decide +kernel⟩

def target78 : Weights.Entry :=
  { word := [8, 1, 12, 10, 0, 8, 12], weights := [1, 0, 0, 1] }

-- Period 7, original row 4654, representative 41.
def source79 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B000.Data.entryAt ⟨38, by decide +kernel⟩

def target79 : Weights.Entry :=
  { word := [8, 1, 12, 10, 0, 12, 12], weights := [1, 0, 1, 1] }

-- Period 7, original row 4657, representative 59.
def source80 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B000.Data.entryAt ⟨56, by decide +kernel⟩

def target80 : Weights.Entry :=
  { word := [8, 1, 12, 10, 8, 4, 12], weights := [1, 0, 1, 1] }

-- Period 7, original row 4659, representative 89.
def source81 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B000.Data.entryAt ⟨85, by decide +kernel⟩

def target81 : Weights.Entry :=
  { word := [8, 1, 12, 10, 8, 8, 12], weights := [1, 0, 0, 1] }

-- Period 7, original row 4662, representative 39.
def source82 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B000.Data.entryAt ⟨36, by decide +kernel⟩

def target82 : Weights.Entry :=
  { word := [8, 1, 12, 10, 8, 12, 12], weights := [1, 0, 1, 1] }

-- Period 7, original row 4710, representative 16.
def source83 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B000.Data.entryAt ⟨14, by decide +kernel⟩

def target83 : Weights.Entry :=
  { word := [8, 2, 0, 9, 8, 4, 6], weights := [0, 3, 1, 0] }

def points83 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 4713, representative 22.
def source84 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B000.Data.entryAt ⟨20, by decide +kernel⟩

def target84 : Weights.Entry :=
  { word := [8, 2, 0, 9, 8, 8, 6], weights := [0, 1, 0, 0] }

def points84 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 4720, representative 12.
def source85 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B000.Data.entryAt ⟨10, by decide +kernel⟩

def target85 : Weights.Entry :=
  { word := [8, 2, 0, 9, 8, 12, 6], weights := [0, 3, 1, 0] }

def points85 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 5851, representative 62.
def source86 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B000.Data.entryAt ⟨59, by decide +kernel⟩

def target86 : Weights.Entry :=
  { word := [8, 9, 0, 1, 4, 8, 12], weights := [0, 1, 0, 0] }

-- Period 7, original row 5857, representative 65.
def source87 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B000.Data.entryAt ⟨62, by decide +kernel⟩

def target87 : Weights.Entry :=
  { word := [8, 9, 0, 1, 12, 8, 12], weights := [0, 1, 0, 0] }

-- Period 7, original row 5871, representative 24.
def source88 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B000.Data.entryAt ⟨22, by decide +kernel⟩

def target88 : Weights.Entry :=
  { word := [8, 9, 0, 4, 0, 12, 12], weights := [1, 0, 1, 2] }

-- Period 7, original row 5878, representative 70.
def source89 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B000.Data.entryAt ⟨67, by decide +kernel⟩

def target89 : Weights.Entry :=
  { word := [8, 9, 0, 4, 2, 0, 12], weights := [1, 0, 0, 1] }

-- Period 7, original row 5883, representative 66.
def source90 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B000.Data.entryAt ⟨63, by decide +kernel⟩

def target90 : Weights.Entry :=
  { word := [8, 9, 0, 4, 2, 8, 12], weights := [1, 0, 0, 1] }

-- Period 7, original row 5894, representative 43.
def source91 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B000.Data.entryAt ⟨40, by decide +kernel⟩

def target91 : Weights.Entry :=
  { word := [8, 9, 0, 4, 8, 4, 12], weights := [1, 0, 0, 1] }

-- Period 7, original row 5897, representative 25.
def source92 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B000.Data.entryAt ⟨23, by decide +kernel⟩

def target92 : Weights.Entry :=
  { word := [8, 9, 0, 4, 8, 12, 12], weights := [1, 0, 0, 1] }

-- Period 7, original row 5904, representative 71.
def source93 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B000.Data.entryAt ⟨68, by decide +kernel⟩

def target93 : Weights.Entry :=
  { word := [8, 9, 0, 4, 10, 0, 12], weights := [1, 0, 0, 1] }

-- Period 7, original row 5909, representative 67.
def source94 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B000.Data.entryAt ⟨64, by decide +kernel⟩

def target94 : Weights.Entry :=
  { word := [8, 9, 0, 4, 10, 8, 12], weights := [1, 0, 0, 1] }

-- Period 7, original row 5913, representative 52.
def source95 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B000.Data.entryAt ⟨49, by decide +kernel⟩

def target95 : Weights.Entry :=
  { word := [8, 9, 0, 9, 4, 4, 12], weights := [1, 1, 1, 1] }

-- Period 7, original row 5915, representative 32.
def source96 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B000.Data.entryAt ⟨29, by decide +kernel⟩

def target96 : Weights.Entry :=
  { word := [8, 9, 0, 9, 4, 12, 12], weights := [1, 1, 1, 1] }

-- Period 7, original row 5917, representative 51.
def source97 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B000.Data.entryAt ⟨48, by decide +kernel⟩

def target97 : Weights.Entry :=
  { word := [8, 9, 0, 9, 12, 4, 12], weights := [1, 1, 1, 1] }

-- Period 7, original row 5919, representative 30.
def source98 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B000.Data.entryAt ⟨27, by decide +kernel⟩

def target98 : Weights.Entry :=
  { word := [8, 9, 0, 9, 12, 12, 12], weights := [1, 1, 1, 1] }

-- Period 7, original row 5928, representative 45.
def source99 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B000.Data.entryAt ⟨42, by decide +kernel⟩

def target99 : Weights.Entry :=
  { word := [8, 9, 0, 12, 0, 4, 12], weights := [1, 0, 1, 0] }

-- Period 7, original row 5931, representative 27.
def source100 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B000.Data.entryAt ⟨25, by decide +kernel⟩

def target100 : Weights.Entry :=
  { word := [8, 9, 0, 12, 0, 12, 12], weights := [1, 0, 1, 0] }

-- Period 7, original row 5938, representative 73.
def source101 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B000.Data.entryAt ⟨70, by decide +kernel⟩

def target101 : Weights.Entry :=
  { word := [8, 9, 0, 12, 2, 0, 12], weights := [1, 0, 1, 0] }

-- Period 7, original row 5943, representative 69.
def source102 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B000.Data.entryAt ⟨66, by decide +kernel⟩

def target102 : Weights.Entry :=
  { word := [8, 9, 0, 12, 2, 8, 12], weights := [1, 0, 1, 0] }

-- Period 7, original row 5953, representative 44.
def source103 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B000.Data.entryAt ⟨41, by decide +kernel⟩

def target103 : Weights.Entry :=
  { word := [8, 9, 0, 12, 8, 4, 12], weights := [1, 0, 1, 0] }

-- Period 7, original row 5956, representative 26.
def source104 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B000.Data.entryAt ⟨24, by decide +kernel⟩

def target104 : Weights.Entry :=
  { word := [8, 9, 0, 12, 8, 12, 12], weights := [1, 0, 1, 0] }

-- Period 7, original row 5963, representative 72.
def source105 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B000.Data.entryAt ⟨69, by decide +kernel⟩

def target105 : Weights.Entry :=
  { word := [8, 9, 0, 12, 10, 0, 12], weights := [1, 0, 1, 0] }

-- Period 7, original row 5968, representative 68.
def source106 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B000.Data.entryAt ⟨65, by decide +kernel⟩

def target106 : Weights.Entry :=
  { word := [8, 9, 0, 12, 10, 8, 12], weights := [1, 0, 1, 0] }

-- Period 7, original row 5988, representative 63.
def source107 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B000.Data.entryAt ⟨60, by decide +kernel⟩

def target107 : Weights.Entry :=
  { word := [8, 9, 8, 1, 4, 8, 12], weights := [0, 1, 0, 0] }

-- Period 7, original row 5994, representative 64.
def source108 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B000.Data.entryAt ⟨61, by decide +kernel⟩

def target108 : Weights.Entry :=
  { word := [8, 9, 8, 1, 12, 8, 12], weights := [0, 1, 0, 0] }

-- Period 7, original row 6024, representative 50.
def source109 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B000.Data.entryAt ⟨47, by decide +kernel⟩

def target109 : Weights.Entry :=
  { word := [8, 9, 8, 9, 4, 4, 12], weights := [1, 1, 1, 1] }

-- Period 7, original row 6026, representative 31.
def source110 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B000.Data.entryAt ⟨28, by decide +kernel⟩

def target110 : Weights.Entry :=
  { word := [8, 9, 8, 9, 4, 12, 12], weights := [1, 1, 1, 1] }

-- Period 7, original row 6028, representative 49.
def source111 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B000.Data.entryAt ⟨46, by decide +kernel⟩

def target111 : Weights.Entry :=
  { word := [8, 9, 8, 9, 12, 4, 12], weights := [1, 1, 1, 1] }

-- Period 7, original row 6104, representative 15.
def source112 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B000.Data.entryAt ⟨13, by decide +kernel⟩

def target112 : Weights.Entry :=
  { word := [8, 10, 0, 9, 8, 4, 6], weights := [0, 3, 1, 0] }

def points112 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 6107, representative 21.
def source113 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B000.Data.entryAt ⟨19, by decide +kernel⟩

def target113 : Weights.Entry :=
  { word := [8, 10, 0, 9, 8, 8, 6], weights := [0, 1, 0, 0] }

def points113 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 6114, representative 11.
def source114 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B000.Data.entryAt ⟨9, by decide +kernel⟩

def target114 : Weights.Entry :=
  { word := [8, 10, 0, 9, 8, 12, 6], weights := [0, 3, 1, 0] }

def points114 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 7420, representative 119.
def source115 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B000.Data.entryAt ⟨114, by decide +kernel⟩

def target115 : Weights.Entry :=
  { word := [10, 0, 0, 12, 0, 12, 12], weights := [1, 0, 1, 0] }

-- Period 7, original row 7430, representative 70.
def source116 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B000.Data.entryAt ⟨67, by decide +kernel⟩

def target116 : Weights.Entry :=
  { word := [10, 0, 4, 2, 0, 8, 9], weights := [1, 0, 0, 1] }

def points116 : List (ℕ × ℕ) := [(0, 2), (1, 0), (2, 1), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 7453, representative 73.
def source117 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B000.Data.entryAt ⟨70, by decide +kernel⟩

def target117 : Weights.Entry :=
  { word := [10, 0, 4, 10, 0, 8, 9], weights := [0, 1, 0, 1] }

def points117 : List (ℕ × ℕ) := [(0, 2), (1, 0), (2, 1), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 7461, representative 133.
def source118 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B000.Data.entryAt ⟨125, by decide +kernel⟩

def target118 : Weights.Entry :=
  { word := [10, 0, 4, 10, 0, 12, 10], weights := [1, 0, 1, 1] }

-- Period 7, original row 7462, representative 133.
def source119 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B000.Data.entryAt ⟨125, by decide +kernel⟩

def target119 : Weights.Entry :=
  { word := [10, 0, 4, 10, 0, 12, 12], weights := [1, 0, 1, 1] }

def points119 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 7470, representative 132.
def source120 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B000.Data.entryAt ⟨124, by decide +kernel⟩

def target120 : Weights.Entry :=
  { word := [10, 0, 4, 10, 8, 12, 12], weights := [1, 0, 1, 1] }

-- Period 7, original row 7491, representative 116.
def source121 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B000.Data.entryAt ⟨111, by decide +kernel⟩

def target121 : Weights.Entry :=
  { word := [10, 0, 8, 4, 8, 12, 12], weights := [1, 0, 0, 1] }

-- Period 7, original row 7495, representative 135.
def source122 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B000.Data.entryAt ⟨127, by decide +kernel⟩

def target122 : Weights.Entry :=
  { word := [10, 0, 8, 9, 4, 12, 12], weights := [1, 0, 1, 1] }

-- Period 7, original row 7499, representative 134.
def source123 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B000.Data.entryAt ⟨126, by decide +kernel⟩

def target123 : Weights.Entry :=
  { word := [10, 0, 8, 9, 12, 12, 12], weights := [1, 0, 1, 1] }

-- Period 7, original row 7512, representative 118.
def source124 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B000.Data.entryAt ⟨113, by decide +kernel⟩

def target124 : Weights.Entry :=
  { word := [10, 0, 8, 12, 0, 12, 10], weights := [1, 0, 1, 0] }

-- Period 7, original row 7513, representative 118.
def source125 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B000.Data.entryAt ⟨113, by decide +kernel⟩

def target125 : Weights.Entry :=
  { word := [10, 0, 8, 12, 0, 12, 12], weights := [1, 0, 1, 0] }

def points125 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 7521, representative 117.
def source126 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B000.Data.entryAt ⟨112, by decide +kernel⟩

def target126 : Weights.Entry :=
  { word := [10, 0, 8, 12, 8, 12, 12], weights := [1, 0, 1, 0] }

-- Period 7, original row 7532, representative 124.
def source127 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B000.Data.entryAt ⟨118, by decide +kernel⟩

def target127 : Weights.Entry :=
  { word := [10, 0, 9, 8, 1, 12, 10], weights := [1, 0, 1, 1] }

def period7Entries : List Weights.Entry := [target0, target1, target2, target3, target4, target5, target6, target7, target8, target9, target10, target11, target12, target13, target14, target15, target16, target17, target18, target19, target20, target21, target22, target23, target24, target25, target26, target27, target28, target29, target30, target31, target32, target33, target34, target35, target36, target37, target38, target39, target40, target41, target42, target43, target44, target45, target46, target47, target48, target49, target50, target51, target52, target53, target54, target55, target56, target57, target58, target59, target60, target61, target62, target63, target64, target65, target66, target67, target68, target69, target70, target71, target72, target73, target74, target75, target76, target77, target78, target79, target80, target81, target82, target83, target84, target85, target86, target87, target88, target89, target90, target91, target92, target93, target94, target95, target96, target97, target98, target99, target100, target101, target102, target103, target104, target105, target106, target107, target108, target109, target110, target111, target112, target113, target114, target115, target116, target117, target118, target119, target120, target121, target122, target123, target124, target125, target126, target127]

def period7Chunk : RowCoverage.Chunk where
  rows := [⟨1, target0⟩, ⟨47, target1⟩, ⟨146, target2⟩, ⟨304, target3⟩, ⟨306, target4⟩, ⟨315, target5⟩, ⟨318, target6⟩, ⟨412, target7⟩, ⟨415, target8⟩, ⟨417, target9⟩, ⟨420, target10⟩, ⟨506, target11⟩, ⟨518, target12⟩, ⟨554, target13⟩, ⟨604, target14⟩, ⟨864, target15⟩, ⟨1353, target16⟩, ⟨1355, target17⟩, ⟨1364, target18⟩, ⟨1444, target19⟩, ⟨1447, target20⟩, ⟨1449, target21⟩, ⟨1452, target22⟩, ⟨1738, target23⟩, ⟨1784, target24⟩, ⟨1843, target25⟩, ⟨1893, target26⟩, ⟨2381, target27⟩, ⟨2383, target28⟩, ⟨2592, target29⟩, ⟨2697, target30⟩, ⟨3181, target31⟩, ⟨3292, target32⟩, ⟨3415, target33⟩, ⟨3437, target34⟩, ⟨3578, target35⟩, ⟨3982, target36⟩, ⟨4076, target37⟩, ⟨4077, target38⟩, ⟨4078, target39⟩, ⟨4079, target40⟩, ⟨4080, target41⟩, ⟨4081, target42⟩, ⟨4082, target43⟩, ⟨4083, target44⟩, ⟨4084, target45⟩, ⟨4085, target46⟩, ⟨4086, target47⟩, ⟨4087, target48⟩, ⟨4088, target49⟩, ⟨4089, target50⟩, ⟨4090, target51⟩, ⟨4091, target52⟩, ⟨4092, target53⟩, ⟨4093, target54⟩, ⟨4094, target55⟩, ⟨4095, target56⟩, ⟨4096, target57⟩, ⟨4498, target58⟩, ⟨4500, target59⟩, ⟨4502, target60⟩, ⟨4504, target61⟩, ⟨4511, target62⟩, ⟨4514, target63⟩, ⟨4526, target64⟩, ⟨4534, target65⟩, ⟨4554, target66⟩, ⟨4561, target67⟩, ⟨4564, target68⟩, ⟨4566, target69⟩, ⟨4569, target70⟩, ⟨4589, target71⟩, ⟨4591, target72⟩, ⟨4593, target73⟩, ⟨4595, target74⟩, ⟨4615, target75⟩, ⟨4623, target76⟩, ⟨4640, target77⟩, ⟨4647, target78⟩, ⟨4654, target79⟩, ⟨4657, target80⟩, ⟨4659, target81⟩, ⟨4662, target82⟩, ⟨4710, target83⟩, ⟨4713, target84⟩, ⟨4720, target85⟩, ⟨5851, target86⟩, ⟨5857, target87⟩, ⟨5871, target88⟩, ⟨5878, target89⟩, ⟨5883, target90⟩, ⟨5894, target91⟩, ⟨5897, target92⟩, ⟨5904, target93⟩, ⟨5909, target94⟩, ⟨5913, target95⟩, ⟨5915, target96⟩, ⟨5917, target97⟩, ⟨5919, target98⟩, ⟨5928, target99⟩, ⟨5931, target100⟩, ⟨5938, target101⟩, ⟨5943, target102⟩, ⟨5953, target103⟩, ⟨5956, target104⟩, ⟨5963, target105⟩, ⟨5968, target106⟩, ⟨5988, target107⟩, ⟨5994, target108⟩, ⟨6024, target109⟩, ⟨6026, target110⟩, ⟨6028, target111⟩, ⟨6104, target112⟩, ⟨6107, target113⟩, ⟨6114, target114⟩, ⟨7420, target115⟩, ⟨7430, target116⟩, ⟨7453, target117⟩, ⟨7461, target118⟩, ⟨7462, target119⟩, ⟨7470, target120⟩, ⟨7491, target121⟩, ⟨7495, target122⟩, ⟨7499, target123⟩, ⟨7512, target124⟩, ⟨7513, target125⟩, ⟨7521, target126⟩, ⟨7532, target127⟩]
  indexMask := 228108038050407662245167588674708907157479995317477400548788603457359579584878333019262319898091451944328982617198002638263312169116513221384315819993303599017363078691692241116594322007081843812753808778262148821722037855433486940536682692346369516013665237776274234470587215497657778162720222217709803341712103687398237669819525563200042907117166436501915241668564194807231567135760737430127043405371685103101102693060444729656510063470620154463650750273343696624215887245721673533802675927105781306313086222571553618613804439804928903159124146489369061147542526053748682749612792161164271618824275966512529344426329209748741672645620573574512052413453748372989564538203689247875093942866145785966904517103158445573384731740413700578776351336893898973506187037759558591869280610665353839839005381360391955090966013854748361523220478700829523286888220813295432849961110783641740144042645818118736180783984636443701554855241866409251564097732815102402324241767444638439386218213897958065229529831909127942133762769126777172863540923730901517314776510591878742436289227799854818237454224890310468638693251139774394341836041277331561867629507711616077217816890055884344410623948892612197338421450774745695026363013997236878627445334149553186327689977449636467004680342810665078434800041864647272666384602342965929525121217067163886678575959424487481939927068187644904813714186669588181229191661462938494168064154261047437165397077325143210214775548380959258886187663772138382854710746261120751850038775900135268366721356623999725988044771596450657214172564471268436322156254800593076958430110679966695821446990144638651785068821376017162466691320097703191109580994393696947013740320793698238906983877180092320059702432019924013710198269189494993189896849242455648649785515876795432998053968603941907760062334408690758770115322749405991887401499608683243585088617231361030521520544383675488050789492699189093580927453105715254257251985853251112965684457432365768720237592027987998506318299757019029885094576647781291593826572731637875743103290256269027389067011223842535164774835482782485435163446814972835226605014951127284458393729041696576477793400286803570684248441715769891988813827385005956941009665716188787690929382132287057925397060762969668716307827783404355586
  count := 128

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem period7Chunk_entries :
    period7Chunk.rows.map RowCoverage.TaggedRow.entry = period7Entries := rfl

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem period7_index_check :
    RowCoverage.indexCheck CanonicalWords.count period7Chunk = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem period7_words_check :
    RowCoverage.wordsCheck CanonicalWords.wordAt period7Chunk = true := by
  decide +kernel

end FranklSmallCyclic.TransportBatches.G000.B000.Data
