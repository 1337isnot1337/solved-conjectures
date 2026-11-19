module

public import Conjectures.FranklSmallCyclicRowCoverage
public import Conjectures.FranklSmallCyclicCanonicalWords
public import Conjectures.FranklSmallCyclicOrbit8Block012Data

/-! 128 literal targets sharing one source proof block.
Original words and row indices are retained; weights may be transported.
-/
@[expose] public section

namespace FranklSmallCyclic.TransportBatches.G038.B000.Data

-- Period 8, original row 10, representative 4893.
def source0 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B012.Data.entryAt ⟨41, by decide +kernel⟩

def target0 : Weights.Entry :=
  { word := [0, 0, 1, 4, 2, 8, 10], weights := [0, 0, 1, 0] }

-- Period 8, original row 11, representative 4917.
def source1 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B012.Data.entryAt ⟨65, by decide +kernel⟩

def target1 : Weights.Entry :=
  { word := [0, 0, 1, 4, 2, 8, 12], weights := [1, 0, 0, 1] }

-- Period 8, original row 32, representative 4877.
def source2 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B012.Data.entryAt ⟨25, by decide +kernel⟩

def target2 : Weights.Entry :=
  { word := [0, 0, 1, 4, 10, 8, 10], weights := [0, 0, 1, 0] }

-- Period 8, original row 33, representative 4905.
def source3 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B012.Data.entryAt ⟨53, by decide +kernel⟩

def target3 : Weights.Entry :=
  { word := [0, 0, 1, 4, 10, 8, 12], weights := [1, 0, 0, 1] }

-- Period 8, original row 59, representative 4888.
def source4 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B012.Data.entryAt ⟨36, by decide +kernel⟩

def target4 : Weights.Entry :=
  { word := [0, 0, 2, 2, 2, 8, 10], weights := [0, 1, 0, 0] }

-- Period 8, original row 60, representative 4912.
def source5 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B012.Data.entryAt ⟨60, by decide +kernel⟩

def target5 : Weights.Entry :=
  { word := [0, 0, 2, 2, 2, 8, 12], weights := [1, 0, 0, 1] }

-- Period 8, original row 74, representative 4872.
def source6 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B012.Data.entryAt ⟨20, by decide +kernel⟩

def target6 : Weights.Entry :=
  { word := [0, 0, 2, 2, 10, 8, 10], weights := [0, 1, 0, 0] }

-- Period 8, original row 75, representative 4900.
def source7 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B012.Data.entryAt ⟨48, by decide +kernel⟩

def target7 : Weights.Entry :=
  { word := [0, 0, 2, 2, 10, 8, 12], weights := [1, 0, 0, 1] }

-- Period 8, original row 81, representative 4855.
def source8 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B012.Data.entryAt ⟨3, by decide +kernel⟩

def target8 : Weights.Entry :=
  { word := [0, 0, 6, 2, 0, 8, 9], weights := [1, 0, 0, 1] }

-- Period 8, original row 82, representative 4938.
def source9 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B012.Data.entryAt ⟨86, by decide +kernel⟩

def target9 : Weights.Entry :=
  { word := [0, 0, 6, 2, 0, 8, 10], weights := [1, 0, 0, 1] }

-- Period 8, original row 83, representative 4938.
def source10 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B012.Data.entryAt ⟨86, by decide +kernel⟩

def target10 : Weights.Entry :=
  { word := [0, 0, 6, 2, 0, 8, 12], weights := [1, 0, 0, 1] }

def points10 : List (ℕ × ℕ) := [(0, 7), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 0)]

-- Period 8, original row 90, representative 4924.
def source11 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B012.Data.entryAt ⟨72, by decide +kernel⟩

def target11 : Weights.Entry :=
  { word := [0, 0, 6, 2, 8, 8, 10], weights := [0, 1, 0, 0] }

-- Period 8, original row 91, representative 4931.
def source12 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B012.Data.entryAt ⟨79, by decide +kernel⟩

def target12 : Weights.Entry :=
  { word := [0, 0, 6, 2, 8, 8, 12], weights := [1, 0, 0, 1] }

-- Period 8, original row 110, representative 4889.
def source13 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B012.Data.entryAt ⟨37, by decide +kernel⟩

def target13 : Weights.Entry :=
  { word := [0, 0, 10, 2, 2, 8, 10], weights := [0, 1, 0, 0] }

-- Period 8, original row 111, representative 4913.
def source14 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B012.Data.entryAt ⟨61, by decide +kernel⟩

def target14 : Weights.Entry :=
  { word := [0, 0, 10, 2, 2, 8, 12], weights := [1, 0, 0, 1] }

-- Period 8, original row 118, representative 4873.
def source15 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B012.Data.entryAt ⟨21, by decide +kernel⟩

def target15 : Weights.Entry :=
  { word := [0, 0, 10, 2, 10, 8, 10], weights := [0, 1, 0, 0] }

-- Period 8, original row 119, representative 4901.
def source16 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B012.Data.entryAt ⟨49, by decide +kernel⟩

def target16 : Weights.Entry :=
  { word := [0, 0, 10, 2, 10, 8, 12], weights := [1, 0, 0, 1] }

-- Period 8, original row 563, representative 4860.
def source17 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B012.Data.entryAt ⟨8, by decide +kernel⟩

def target17 : Weights.Entry :=
  { word := [0, 4, 2, 0, 1, 8, 9], weights := [0, 1, 0, 1] }

-- Period 8, original row 564, representative 4947.
def source18 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B012.Data.entryAt ⟨95, by decide +kernel⟩

def target18 : Weights.Entry :=
  { word := [0, 4, 2, 0, 1, 8, 10], weights := [0, 1, 0, 1] }

-- Period 8, original row 565, representative 4947.
def source19 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B012.Data.entryAt ⟨95, by decide +kernel⟩

def target19 : Weights.Entry :=
  { word := [0, 4, 2, 0, 1, 8, 12], weights := [0, 1, 0, 1] }

def points19 : List (ℕ × ℕ) := [(0, 7), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 0)]

-- Period 8, original row 577, representative 4856.
def source20 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B012.Data.entryAt ⟨4, by decide +kernel⟩

def target20 : Weights.Entry :=
  { word := [0, 4, 2, 0, 9, 8, 9], weights := [0, 1, 0, 1] }

-- Period 8, original row 578, representative 4939.
def source21 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B012.Data.entryAt ⟨87, by decide +kernel⟩

def target21 : Weights.Entry :=
  { word := [0, 4, 2, 0, 9, 8, 10], weights := [0, 1, 0, 1] }

-- Period 8, original row 579, representative 4943.
def source22 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B012.Data.entryAt ⟨91, by decide +kernel⟩

def target22 : Weights.Entry :=
  { word := [0, 4, 2, 0, 9, 8, 12], weights := [0, 1, 0, 1] }

-- Period 8, original row 587, representative 4883.
def source23 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B012.Data.entryAt ⟨31, by decide +kernel⟩

def target23 : Weights.Entry :=
  { word := [0, 4, 2, 8, 2, 8, 10], weights := [0, 1, 1, 0] }

-- Period 8, original row 597, representative 4973.
def source24 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B012.Data.entryAt ⟨121, by decide +kernel⟩

def target24 : Weights.Entry :=
  { word := [0, 4, 2, 8, 10, 0, 9], weights := [0, 1, 1, 0] }

-- Period 8, original row 598, representative 4968.
def source25 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B012.Data.entryAt ⟨116, by decide +kernel⟩

def target25 : Weights.Entry :=
  { word := [0, 4, 2, 8, 10, 0, 10], weights := [0, 1, 1, 0] }

-- Period 8, original row 601, representative 4867.
def source26 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B012.Data.entryAt ⟨15, by decide +kernel⟩

def target26 : Weights.Entry :=
  { word := [0, 4, 2, 8, 10, 8, 10], weights := [0, 1, 1, 0] }

-- Period 8, original row 613, representative 4860.
def source27 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B012.Data.entryAt ⟨8, by decide +kernel⟩

def target27 : Weights.Entry :=
  { word := [0, 4, 4, 4, 0, 8, 9], weights := [1, 0, 0, 1] }

def points27 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6), (7, 7)]

-- Period 8, original row 614, representative 4947.
def source28 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B012.Data.entryAt ⟨95, by decide +kernel⟩

def target28 : Weights.Entry :=
  { word := [0, 4, 4, 4, 0, 8, 10], weights := [1, 0, 0, 1] }

def points28 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6), (7, 7)]

-- Period 8, original row 615, representative 4947.
def source29 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B012.Data.entryAt ⟨95, by decide +kernel⟩

def target29 : Weights.Entry :=
  { word := [0, 4, 4, 4, 0, 8, 12], weights := [1, 0, 0, 1] }

def points29 : List (ℕ × ℕ) := [(0, 7), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6), (7, 0)]

-- Period 8, original row 628, representative 4925.
def source30 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B012.Data.entryAt ⟨73, by decide +kernel⟩

def target30 : Weights.Entry :=
  { word := [0, 4, 4, 4, 8, 8, 10], weights := [1, 0, 1, 0] }

-- Period 8, original row 629, representative 4932.
def source31 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B012.Data.entryAt ⟨80, by decide +kernel⟩

def target31 : Weights.Entry :=
  { word := [0, 4, 4, 4, 8, 8, 12], weights := [1, 0, 0, 1] }

-- Period 8, original row 634, representative 4921.
def source32 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B012.Data.entryAt ⟨69, by decide +kernel⟩

def target32 : Weights.Entry :=
  { word := [0, 4, 6, 8, 8, 8, 10], weights := [0, 1, 1, 0] }

-- Period 8, original row 645, representative 4892.
def source33 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B012.Data.entryAt ⟨40, by decide +kernel⟩

def target33 : Weights.Entry :=
  { word := [0, 4, 8, 4, 2, 8, 10], weights := [0, 0, 1, 0] }

-- Period 8, original row 646, representative 4916.
def source34 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B012.Data.entryAt ⟨64, by decide +kernel⟩

def target34 : Weights.Entry :=
  { word := [0, 4, 8, 4, 2, 8, 12], weights := [1, 0, 0, 1] }

-- Period 8, original row 665, representative 4974.
def source35 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B012.Data.entryAt ⟨122, by decide +kernel⟩

def target35 : Weights.Entry :=
  { word := [0, 4, 8, 4, 10, 0, 9], weights := [0, 0, 1, 0] }

-- Period 8, original row 666, representative 4969.
def source36 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B012.Data.entryAt ⟨117, by decide +kernel⟩

def target36 : Weights.Entry :=
  { word := [0, 4, 8, 4, 10, 0, 10], weights := [0, 0, 1, 0] }

-- Period 8, original row 671, representative 4876.
def source37 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B012.Data.entryAt ⟨24, by decide +kernel⟩

def target37 : Weights.Entry :=
  { word := [0, 4, 8, 4, 10, 8, 10], weights := [0, 0, 1, 0] }

-- Period 8, original row 672, representative 4904.
def source38 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B012.Data.entryAt ⟨52, by decide +kernel⟩

def target38 : Weights.Entry :=
  { word := [0, 4, 8, 4, 10, 8, 12], weights := [1, 0, 0, 1] }

-- Period 8, original row 695, representative 4863.
def source39 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B012.Data.entryAt ⟨11, by decide +kernel⟩

def target39 : Weights.Entry :=
  { word := [0, 4, 10, 0, 1, 8, 9], weights := [0, 1, 0, 1] }

-- Period 8, original row 696, representative 4950.
def source40 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B012.Data.entryAt ⟨98, by decide +kernel⟩

def target40 : Weights.Entry :=
  { word := [0, 4, 10, 0, 1, 8, 10], weights := [0, 1, 0, 1] }

-- Period 8, original row 697, representative 4950.
def source41 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B012.Data.entryAt ⟨98, by decide +kernel⟩

def target41 : Weights.Entry :=
  { word := [0, 4, 10, 0, 1, 8, 12], weights := [0, 1, 0, 1] }

def points41 : List (ℕ × ℕ) := [(0, 7), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 0)]

-- Period 8, original row 702, representative 4859.
def source42 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B012.Data.entryAt ⟨7, by decide +kernel⟩

def target42 : Weights.Entry :=
  { word := [0, 4, 10, 0, 9, 8, 9], weights := [0, 1, 0, 1] }

-- Period 8, original row 703, representative 4942.
def source43 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B012.Data.entryAt ⟨90, by decide +kernel⟩

def target43 : Weights.Entry :=
  { word := [0, 4, 10, 0, 9, 8, 10], weights := [0, 1, 0, 1] }

-- Period 8, original row 704, representative 4946.
def source44 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B012.Data.entryAt ⟨94, by decide +kernel⟩

def target44 : Weights.Entry :=
  { word := [0, 4, 10, 0, 9, 8, 12], weights := [0, 1, 0, 1] }

-- Period 8, original row 707, representative 4882.
def source45 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B012.Data.entryAt ⟨30, by decide +kernel⟩

def target45 : Weights.Entry :=
  { word := [0, 4, 10, 8, 2, 8, 10], weights := [0, 1, 1, 0] }

-- Period 8, original row 716, representative 4866.
def source46 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B012.Data.entryAt ⟨14, by decide +kernel⟩

def target46 : Weights.Entry :=
  { word := [0, 4, 10, 8, 10, 8, 10], weights := [0, 1, 1, 0] }

-- Period 8, original row 721, representative 4863.
def source47 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B012.Data.entryAt ⟨11, by decide +kernel⟩

def target47 : Weights.Entry :=
  { word := [0, 4, 12, 4, 0, 8, 9], weights := [1, 0, 0, 1] }

def points47 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6), (7, 7)]

-- Period 8, original row 722, representative 4950.
def source48 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B012.Data.entryAt ⟨98, by decide +kernel⟩

def target48 : Weights.Entry :=
  { word := [0, 4, 12, 4, 0, 8, 10], weights := [1, 0, 0, 1] }

def points48 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6), (7, 7)]

-- Period 8, original row 723, representative 4950.
def source49 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B012.Data.entryAt ⟨98, by decide +kernel⟩

def target49 : Weights.Entry :=
  { word := [0, 4, 12, 4, 0, 8, 12], weights := [1, 0, 0, 1] }

def points49 : List (ℕ × ℕ) := [(0, 7), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6), (7, 0)]

-- Period 8, original row 735, representative 4852.
def source50 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B012.Data.entryAt ⟨0, by decide +kernel⟩

def target50 : Weights.Entry :=
  { word := [0, 4, 12, 4, 8, 8, 9], weights := [1, 0, 1, 0] }

-- Period 8, original row 736, representative 4928.
def source51 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B012.Data.entryAt ⟨76, by decide +kernel⟩

def target51 : Weights.Entry :=
  { word := [0, 4, 12, 4, 8, 8, 10], weights := [1, 0, 1, 0] }

-- Period 8, original row 737, representative 4935.
def source52 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B012.Data.entryAt ⟨83, by decide +kernel⟩

def target52 : Weights.Entry :=
  { word := [0, 4, 12, 4, 8, 8, 12], weights := [1, 0, 0, 1] }

-- Period 8, original row 823, representative 4895.
def source53 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B012.Data.entryAt ⟨43, by decide +kernel⟩

def target53 : Weights.Entry :=
  { word := [0, 8, 0, 4, 2, 8, 10], weights := [0, 0, 1, 0] }

-- Period 8, original row 824, representative 4919.
def source54 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B012.Data.entryAt ⟨67, by decide +kernel⟩

def target54 : Weights.Entry :=
  { word := [0, 8, 0, 4, 2, 8, 12], weights := [1, 0, 0, 1] }

-- Period 8, original row 849, representative 4879.
def source55 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B012.Data.entryAt ⟨27, by decide +kernel⟩

def target55 : Weights.Entry :=
  { word := [0, 8, 0, 4, 10, 8, 10], weights := [0, 0, 1, 0] }

-- Period 8, original row 850, representative 4907.
def source56 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B012.Data.entryAt ⟨55, by decide +kernel⟩

def target56 : Weights.Entry :=
  { word := [0, 8, 0, 4, 10, 8, 12], weights := [1, 0, 0, 1] }

-- Period 8, original row 902, representative 4894.
def source57 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B012.Data.entryAt ⟨42, by decide +kernel⟩

def target57 : Weights.Entry :=
  { word := [0, 8, 1, 4, 2, 8, 10], weights := [0, 0, 1, 0] }

-- Period 8, original row 903, representative 4918.
def source58 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B012.Data.entryAt ⟨66, by decide +kernel⟩

def target58 : Weights.Entry :=
  { word := [0, 8, 1, 4, 2, 8, 12], weights := [1, 0, 0, 1] }

-- Period 8, original row 918, representative 4976.
def source59 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B012.Data.entryAt ⟨124, by decide +kernel⟩

def target59 : Weights.Entry :=
  { word := [0, 8, 1, 4, 10, 0, 9], weights := [0, 0, 1, 0] }

-- Period 8, original row 919, representative 4975.
def source60 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B012.Data.entryAt ⟨123, by decide +kernel⟩

def target60 : Weights.Entry :=
  { word := [0, 8, 1, 4, 10, 0, 10], weights := [0, 0, 1, 0] }

-- Period 8, original row 924, representative 4878.
def source61 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B012.Data.entryAt ⟨26, by decide +kernel⟩

def target61 : Weights.Entry :=
  { word := [0, 8, 1, 4, 10, 8, 10], weights := [0, 0, 1, 0] }

-- Period 8, original row 925, representative 4906.
def source62 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B012.Data.entryAt ⟨54, by decide +kernel⟩

def target62 : Weights.Entry :=
  { word := [0, 8, 1, 4, 10, 8, 12], weights := [1, 0, 0, 1] }

-- Period 8, original row 951, representative 4884.
def source63 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B012.Data.entryAt ⟨32, by decide +kernel⟩

def target63 : Weights.Entry :=
  { word := [0, 8, 2, 2, 2, 8, 10], weights := [0, 1, 0, 0] }

-- Period 8, original row 952, representative 4908.
def source64 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B012.Data.entryAt ⟨56, by decide +kernel⟩

def target64 : Weights.Entry :=
  { word := [0, 8, 2, 2, 2, 8, 12], weights := [1, 0, 0, 1] }

-- Period 8, original row 957, representative 4979.
def source65 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B012.Data.entryAt ⟨127, by decide +kernel⟩

def target65 : Weights.Entry :=
  { word := [0, 8, 2, 2, 10, 0, 9], weights := [0, 1, 0, 0] }

-- Period 8, original row 958, representative 4977.
def source66 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B012.Data.entryAt ⟨125, by decide +kernel⟩

def target66 : Weights.Entry :=
  { word := [0, 8, 2, 2, 10, 0, 10], weights := [0, 1, 0, 0] }

-- Period 8, original row 966, representative 4868.
def source67 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B012.Data.entryAt ⟨16, by decide +kernel⟩

def target67 : Weights.Entry :=
  { word := [0, 8, 2, 2, 10, 8, 10], weights := [0, 1, 0, 0] }

-- Period 8, original row 967, representative 4896.
def source68 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B012.Data.entryAt ⟨44, by decide +kernel⟩

def target68 : Weights.Entry :=
  { word := [0, 8, 2, 2, 10, 8, 12], weights := [1, 0, 0, 1] }

-- Period 8, original row 980, representative 4887.
def source69 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B012.Data.entryAt ⟨35, by decide +kernel⟩

def target69 : Weights.Entry :=
  { word := [0, 8, 2, 10, 2, 8, 10], weights := [0, 1, 0, 0] }

-- Period 8, original row 981, representative 4911.
def source70 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B012.Data.entryAt ⟨59, by decide +kernel⟩

def target70 : Weights.Entry :=
  { word := [0, 8, 2, 10, 2, 8, 12], weights := [1, 0, 0, 1] }

-- Period 8, original row 987, representative 4978.
def source71 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B012.Data.entryAt ⟨126, by decide +kernel⟩

def target71 : Weights.Entry :=
  { word := [0, 8, 2, 10, 10, 0, 10], weights := [0, 1, 0, 0] }

-- Period 8, original row 994, representative 4871.
def source72 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B012.Data.entryAt ⟨19, by decide +kernel⟩

def target72 : Weights.Entry :=
  { word := [0, 8, 2, 10, 10, 8, 10], weights := [0, 1, 0, 0] }

-- Period 8, original row 995, representative 4899.
def source73 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B012.Data.entryAt ⟨47, by decide +kernel⟩

def target73 : Weights.Entry :=
  { word := [0, 8, 2, 10, 10, 8, 12], weights := [1, 0, 0, 1] }

-- Period 8, original row 1017, representative 4853.
def source74 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B012.Data.entryAt ⟨1, by decide +kernel⟩

def target74 : Weights.Entry :=
  { word := [0, 8, 6, 2, 0, 8, 9], weights := [1, 0, 0, 1] }

-- Period 8, original row 1018, representative 4936.
def source75 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B012.Data.entryAt ⟨84, by decide +kernel⟩

def target75 : Weights.Entry :=
  { word := [0, 8, 6, 2, 0, 8, 10], weights := [1, 0, 0, 1] }

-- Period 8, original row 1019, representative 4936.
def source76 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B012.Data.entryAt ⟨84, by decide +kernel⟩

def target76 : Weights.Entry :=
  { word := [0, 8, 6, 2, 0, 8, 12], weights := [1, 0, 0, 1] }

def points76 : List (ℕ × ℕ) := [(0, 7), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 0)]

-- Period 8, original row 1026, representative 4922.
def source77 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B012.Data.entryAt ⟨70, by decide +kernel⟩

def target77 : Weights.Entry :=
  { word := [0, 8, 6, 2, 8, 8, 10], weights := [0, 1, 0, 0] }

-- Period 8, original row 1027, representative 4929.
def source78 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B012.Data.entryAt ⟨77, by decide +kernel⟩

def target78 : Weights.Entry :=
  { word := [0, 8, 6, 2, 8, 8, 12], weights := [1, 0, 0, 1] }

-- Period 8, original row 1032, representative 4854.
def source79 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B012.Data.entryAt ⟨2, by decide +kernel⟩

def target79 : Weights.Entry :=
  { word := [0, 8, 6, 10, 0, 8, 9], weights := [1, 0, 0, 1] }

-- Period 8, original row 1033, representative 4937.
def source80 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B012.Data.entryAt ⟨85, by decide +kernel⟩

def target80 : Weights.Entry :=
  { word := [0, 8, 6, 10, 0, 8, 10], weights := [1, 0, 0, 1] }

-- Period 8, original row 1034, representative 4937.
def source81 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B012.Data.entryAt ⟨85, by decide +kernel⟩

def target81 : Weights.Entry :=
  { word := [0, 8, 6, 10, 0, 8, 12], weights := [1, 0, 0, 1] }

def points81 : List (ℕ × ℕ) := [(0, 7), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 0)]

-- Period 8, original row 1040, representative 4923.
def source82 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B012.Data.entryAt ⟨71, by decide +kernel⟩

def target82 : Weights.Entry :=
  { word := [0, 8, 6, 10, 8, 8, 10], weights := [0, 1, 0, 0] }

-- Period 8, original row 1041, representative 4930.
def source83 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B012.Data.entryAt ⟨78, by decide +kernel⟩

def target83 : Weights.Entry :=
  { word := [0, 8, 6, 10, 8, 8, 12], weights := [0, 1, 0, 0] }

-- Period 8, original row 1086, representative 4885.
def source84 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B012.Data.entryAt ⟨33, by decide +kernel⟩

def target84 : Weights.Entry :=
  { word := [0, 8, 10, 2, 2, 8, 10], weights := [0, 1, 0, 0] }

-- Period 8, original row 1087, representative 4909.
def source85 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B012.Data.entryAt ⟨57, by decide +kernel⟩

def target85 : Weights.Entry :=
  { word := [0, 8, 10, 2, 2, 8, 12], weights := [1, 0, 0, 1] }

-- Period 8, original row 1094, representative 4869.
def source86 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B012.Data.entryAt ⟨17, by decide +kernel⟩

def target86 : Weights.Entry :=
  { word := [0, 8, 10, 2, 10, 8, 10], weights := [0, 1, 0, 0] }

-- Period 8, original row 1095, representative 4897.
def source87 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B012.Data.entryAt ⟨45, by decide +kernel⟩

def target87 : Weights.Entry :=
  { word := [0, 8, 10, 2, 10, 8, 12], weights := [1, 0, 0, 1] }

-- Period 8, original row 1101, representative 4886.
def source88 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B012.Data.entryAt ⟨34, by decide +kernel⟩

def target88 : Weights.Entry :=
  { word := [0, 8, 10, 10, 2, 8, 10], weights := [0, 1, 0, 0] }

-- Period 8, original row 1102, representative 4910.
def source89 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B012.Data.entryAt ⟨58, by decide +kernel⟩

def target89 : Weights.Entry :=
  { word := [0, 8, 10, 10, 2, 8, 12], weights := [1, 0, 0, 1] }

-- Period 8, original row 1108, representative 4870.
def source90 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B012.Data.entryAt ⟨18, by decide +kernel⟩

def target90 : Weights.Entry :=
  { word := [0, 8, 10, 10, 10, 8, 10], weights := [0, 1, 0, 0] }

-- Period 8, original row 1109, representative 4898.
def source91 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B012.Data.entryAt ⟨46, by decide +kernel⟩

def target91 : Weights.Entry :=
  { word := [0, 8, 10, 10, 10, 8, 12], weights := [1, 0, 0, 1] }

-- Period 8, original row 1510, representative 4955.
def source92 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B012.Data.entryAt ⟨103, by decide +kernel⟩

def target92 : Weights.Entry :=
  { word := [0, 12, 0, 4, 2, 0, 10], weights := [0, 0, 1, 0] }

-- Period 8, original row 1511, representative 4959.
def source93 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B012.Data.entryAt ⟨107, by decide +kernel⟩

def target93 : Weights.Entry :=
  { word := [0, 12, 0, 4, 2, 0, 12], weights := [1, 0, 0, 1] }

-- Period 8, original row 1515, representative 4890.
def source94 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B012.Data.entryAt ⟨38, by decide +kernel⟩

def target94 : Weights.Entry :=
  { word := [0, 12, 0, 4, 2, 8, 10], weights := [0, 0, 1, 0] }

-- Period 8, original row 1516, representative 4914.
def source95 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B012.Data.entryAt ⟨62, by decide +kernel⟩

def target95 : Weights.Entry :=
  { word := [0, 12, 0, 4, 2, 8, 12], weights := [1, 0, 0, 1] }

-- Period 8, original row 1531, representative 4971.
def source96 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B012.Data.entryAt ⟨119, by decide +kernel⟩

def target96 : Weights.Entry :=
  { word := [0, 12, 0, 4, 10, 0, 9], weights := [0, 0, 1, 0] }

-- Period 8, original row 1532, representative 4952.
def source97 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B012.Data.entryAt ⟨100, by decide +kernel⟩

def target97 : Weights.Entry :=
  { word := [0, 12, 0, 4, 10, 0, 10], weights := [0, 0, 1, 0] }

-- Period 8, original row 1533, representative 4957.
def source98 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B012.Data.entryAt ⟨105, by decide +kernel⟩

def target98 : Weights.Entry :=
  { word := [0, 12, 0, 4, 10, 0, 12], weights := [1, 0, 0, 1] }

-- Period 8, original row 1537, representative 4874.
def source99 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B012.Data.entryAt ⟨22, by decide +kernel⟩

def target99 : Weights.Entry :=
  { word := [0, 12, 0, 4, 10, 8, 10], weights := [0, 0, 1, 0] }

-- Period 8, original row 1538, representative 4902.
def source100 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B012.Data.entryAt ⟨50, by decide +kernel⟩

def target100 : Weights.Entry :=
  { word := [0, 12, 0, 4, 10, 8, 12], weights := [1, 0, 0, 1] }

-- Period 8, original row 1556, representative 4965.
def source101 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B012.Data.entryAt ⟨113, by decide +kernel⟩

def target101 : Weights.Entry :=
  { word := [0, 12, 2, 0, 1, 0, 10], weights := [0, 1, 0, 1] }

-- Period 8, original row 1557, representative 4965.
def source102 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B012.Data.entryAt ⟨113, by decide +kernel⟩

def target102 : Weights.Entry :=
  { word := [0, 12, 2, 0, 1, 0, 12], weights := [0, 1, 0, 1] }

def points102 : List (ℕ × ℕ) := [(0, 7), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 0)]

-- Period 8, original row 1562, representative 4861.
def source103 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B012.Data.entryAt ⟨9, by decide +kernel⟩

def target103 : Weights.Entry :=
  { word := [0, 12, 2, 0, 1, 8, 9], weights := [0, 1, 0, 1] }

-- Period 8, original row 1563, representative 4948.
def source104 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B012.Data.entryAt ⟨96, by decide +kernel⟩

def target104 : Weights.Entry :=
  { word := [0, 12, 2, 0, 1, 8, 10], weights := [0, 1, 0, 1] }

-- Period 8, original row 1564, representative 4948.
def source105 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B012.Data.entryAt ⟨96, by decide +kernel⟩

def target105 : Weights.Entry :=
  { word := [0, 12, 2, 0, 1, 8, 12], weights := [0, 1, 0, 1] }

def points105 : List (ℕ × ℕ) := [(0, 7), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 0)]

-- Period 8, original row 1570, representative 4966.
def source106 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B012.Data.entryAt ⟨114, by decide +kernel⟩

def target106 : Weights.Entry :=
  { word := [0, 12, 2, 0, 9, 0, 10], weights := [0, 1, 0, 1] }

-- Period 8, original row 1571, representative 4967.
def source107 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B012.Data.entryAt ⟨115, by decide +kernel⟩

def target107 : Weights.Entry :=
  { word := [0, 12, 2, 0, 9, 0, 12], weights := [0, 1, 0, 1] }

-- Period 8, original row 1576, representative 4857.
def source108 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B012.Data.entryAt ⟨5, by decide +kernel⟩

def target108 : Weights.Entry :=
  { word := [0, 12, 2, 0, 9, 8, 9], weights := [0, 1, 0, 1] }

-- Period 8, original row 1577, representative 4940.
def source109 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B012.Data.entryAt ⟨88, by decide +kernel⟩

def target109 : Weights.Entry :=
  { word := [0, 12, 2, 0, 9, 8, 10], weights := [0, 1, 0, 1] }

-- Period 8, original row 1578, representative 4944.
def source110 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B012.Data.entryAt ⟨92, by decide +kernel⟩

def target110 : Weights.Entry :=
  { word := [0, 12, 2, 0, 9, 8, 12], weights := [0, 1, 0, 1] }

-- Period 8, original row 1583, representative 4954.
def source111 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B012.Data.entryAt ⟨102, by decide +kernel⟩

def target111 : Weights.Entry :=
  { word := [0, 12, 2, 8, 2, 0, 10], weights := [0, 1, 1, 0] }

-- Period 8, original row 1586, representative 4881.
def source112 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B012.Data.entryAt ⟨29, by decide +kernel⟩

def target112 : Weights.Entry :=
  { word := [0, 12, 2, 8, 2, 8, 10], weights := [0, 1, 1, 0] }

-- Period 8, original row 1596, representative 4970.
def source113 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B012.Data.entryAt ⟨118, by decide +kernel⟩

def target113 : Weights.Entry :=
  { word := [0, 12, 2, 8, 10, 0, 9], weights := [0, 1, 1, 0] }

-- Period 8, original row 1597, representative 4951.
def source114 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B012.Data.entryAt ⟨99, by decide +kernel⟩

def target114 : Weights.Entry :=
  { word := [0, 12, 2, 8, 10, 0, 10], weights := [0, 1, 1, 0] }

-- Period 8, original row 1600, representative 4865.
def source115 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B012.Data.entryAt ⟨13, by decide +kernel⟩

def target115 : Weights.Entry :=
  { word := [0, 12, 2, 8, 10, 8, 10], weights := [0, 1, 1, 0] }

-- Period 8, original row 1606, representative 4965.
def source116 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B012.Data.entryAt ⟨113, by decide +kernel⟩

def target116 : Weights.Entry :=
  { word := [0, 12, 4, 4, 0, 0, 10], weights := [1, 0, 0, 1] }

def points116 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6), (7, 7)]

-- Period 8, original row 1607, representative 4965.
def source117 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B012.Data.entryAt ⟨113, by decide +kernel⟩

def target117 : Weights.Entry :=
  { word := [0, 12, 4, 4, 0, 0, 12], weights := [1, 0, 0, 1] }

def points117 : List (ℕ × ℕ) := [(0, 7), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6), (7, 0)]

-- Period 8, original row 1612, representative 4861.
def source118 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B012.Data.entryAt ⟨9, by decide +kernel⟩

def target118 : Weights.Entry :=
  { word := [0, 12, 4, 4, 0, 8, 9], weights := [1, 0, 0, 1] }

def points118 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6), (7, 7)]

-- Period 8, original row 1613, representative 4948.
def source119 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B012.Data.entryAt ⟨96, by decide +kernel⟩

def target119 : Weights.Entry :=
  { word := [0, 12, 4, 4, 0, 8, 10], weights := [1, 0, 0, 1] }

def points119 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6), (7, 7)]

-- Period 8, original row 1614, representative 4948.
def source120 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B012.Data.entryAt ⟨96, by decide +kernel⟩

def target120 : Weights.Entry :=
  { word := [0, 12, 4, 4, 0, 8, 12], weights := [1, 0, 0, 1] }

def points120 : List (ℕ × ℕ) := [(0, 7), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6), (7, 0)]

-- Period 8, original row 1620, representative 4961.
def source121 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B012.Data.entryAt ⟨109, by decide +kernel⟩

def target121 : Weights.Entry :=
  { word := [0, 12, 4, 4, 8, 0, 10], weights := [1, 0, 1, 0] }

-- Period 8, original row 1621, representative 4963.
def source122 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B012.Data.entryAt ⟨111, by decide +kernel⟩

def target122 : Weights.Entry :=
  { word := [0, 12, 4, 4, 8, 0, 12], weights := [1, 0, 0, 1] }

-- Period 8, original row 1627, representative 4926.
def source123 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B012.Data.entryAt ⟨74, by decide +kernel⟩

def target123 : Weights.Entry :=
  { word := [0, 12, 4, 4, 8, 8, 10], weights := [1, 0, 1, 0] }

-- Period 8, original row 1628, representative 4933.
def source124 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B012.Data.entryAt ⟨81, by decide +kernel⟩

def target124 : Weights.Entry :=
  { word := [0, 12, 4, 4, 8, 8, 12], weights := [1, 0, 0, 1] }

-- Period 8, original row 1633, representative 4920.
def source125 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B012.Data.entryAt ⟨68, by decide +kernel⟩

def target125 : Weights.Entry :=
  { word := [0, 12, 6, 8, 8, 8, 10], weights := [0, 1, 1, 0] }

-- Period 8, original row 1639, representative 4956.
def source126 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B012.Data.entryAt ⟨104, by decide +kernel⟩

def target126 : Weights.Entry :=
  { word := [0, 12, 8, 4, 2, 0, 10], weights := [0, 0, 1, 0] }

-- Period 8, original row 1640, representative 4960.
def source127 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B012.Data.entryAt ⟨108, by decide +kernel⟩

def target127 : Weights.Entry :=
  { word := [0, 12, 8, 4, 2, 0, 12], weights := [1, 0, 0, 1] }

def period8Entries : List Weights.Entry := [target0, target1, target2, target3, target4, target5, target6, target7, target8, target9, target10, target11, target12, target13, target14, target15, target16, target17, target18, target19, target20, target21, target22, target23, target24, target25, target26, target27, target28, target29, target30, target31, target32, target33, target34, target35, target36, target37, target38, target39, target40, target41, target42, target43, target44, target45, target46, target47, target48, target49, target50, target51, target52, target53, target54, target55, target56, target57, target58, target59, target60, target61, target62, target63, target64, target65, target66, target67, target68, target69, target70, target71, target72, target73, target74, target75, target76, target77, target78, target79, target80, target81, target82, target83, target84, target85, target86, target87, target88, target89, target90, target91, target92, target93, target94, target95, target96, target97, target98, target99, target100, target101, target102, target103, target104, target105, target106, target107, target108, target109, target110, target111, target112, target113, target114, target115, target116, target117, target118, target119, target120, target121, target122, target123, target124, target125, target126, target127]

def period8Chunk : RowCoverage.Chunk where
  rows := [⟨10, target0⟩, ⟨11, target1⟩, ⟨32, target2⟩, ⟨33, target3⟩, ⟨59, target4⟩, ⟨60, target5⟩, ⟨74, target6⟩, ⟨75, target7⟩, ⟨81, target8⟩, ⟨82, target9⟩, ⟨83, target10⟩, ⟨90, target11⟩, ⟨91, target12⟩, ⟨110, target13⟩, ⟨111, target14⟩, ⟨118, target15⟩, ⟨119, target16⟩, ⟨563, target17⟩, ⟨564, target18⟩, ⟨565, target19⟩, ⟨577, target20⟩, ⟨578, target21⟩, ⟨579, target22⟩, ⟨587, target23⟩, ⟨597, target24⟩, ⟨598, target25⟩, ⟨601, target26⟩, ⟨613, target27⟩, ⟨614, target28⟩, ⟨615, target29⟩, ⟨628, target30⟩, ⟨629, target31⟩, ⟨634, target32⟩, ⟨645, target33⟩, ⟨646, target34⟩, ⟨665, target35⟩, ⟨666, target36⟩, ⟨671, target37⟩, ⟨672, target38⟩, ⟨695, target39⟩, ⟨696, target40⟩, ⟨697, target41⟩, ⟨702, target42⟩, ⟨703, target43⟩, ⟨704, target44⟩, ⟨707, target45⟩, ⟨716, target46⟩, ⟨721, target47⟩, ⟨722, target48⟩, ⟨723, target49⟩, ⟨735, target50⟩, ⟨736, target51⟩, ⟨737, target52⟩, ⟨823, target53⟩, ⟨824, target54⟩, ⟨849, target55⟩, ⟨850, target56⟩, ⟨902, target57⟩, ⟨903, target58⟩, ⟨918, target59⟩, ⟨919, target60⟩, ⟨924, target61⟩, ⟨925, target62⟩, ⟨951, target63⟩, ⟨952, target64⟩, ⟨957, target65⟩, ⟨958, target66⟩, ⟨966, target67⟩, ⟨967, target68⟩, ⟨980, target69⟩, ⟨981, target70⟩, ⟨987, target71⟩, ⟨994, target72⟩, ⟨995, target73⟩, ⟨1017, target74⟩, ⟨1018, target75⟩, ⟨1019, target76⟩, ⟨1026, target77⟩, ⟨1027, target78⟩, ⟨1032, target79⟩, ⟨1033, target80⟩, ⟨1034, target81⟩, ⟨1040, target82⟩, ⟨1041, target83⟩, ⟨1086, target84⟩, ⟨1087, target85⟩, ⟨1094, target86⟩, ⟨1095, target87⟩, ⟨1101, target88⟩, ⟨1102, target89⟩, ⟨1108, target90⟩, ⟨1109, target91⟩, ⟨1510, target92⟩, ⟨1511, target93⟩, ⟨1515, target94⟩, ⟨1516, target95⟩, ⟨1531, target96⟩, ⟨1532, target97⟩, ⟨1533, target98⟩, ⟨1537, target99⟩, ⟨1538, target100⟩, ⟨1556, target101⟩, ⟨1557, target102⟩, ⟨1562, target103⟩, ⟨1563, target104⟩, ⟨1564, target105⟩, ⟨1570, target106⟩, ⟨1571, target107⟩, ⟨1576, target108⟩, ⟨1577, target109⟩, ⟨1578, target110⟩, ⟨1583, target111⟩, ⟨1586, target112⟩, ⟨1596, target113⟩, ⟨1597, target114⟩, ⟨1600, target115⟩, ⟨1606, target116⟩, ⟨1607, target117⟩, ⟨1612, target118⟩, ⟨1613, target119⟩, ⟨1614, target120⟩, ⟨1620, target121⟩, ⟨1621, target122⟩, ⟨1627, target123⟩, ⟨1628, target124⟩, ⟨1633, target125⟩, ⟨1639, target126⟩, ⟨1640, target127⟩]
  indexMask := 73730389206363962559409989472368800046165942242531877531707843094775491980435470882756323415037033570523901321071645375953593982437076544055617361638082942187708723376773758560077005594879267349590452205159804683281695752487856972147534897065642201252602438667072039134163480265705861556961205669263237298579723661095608730806721525407093667426459892658210831193647362954667395334550867983377751622013948327998093378771981809531690843418225523675541170012590763560690026758619859988888359537664
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

end FranklSmallCyclic.TransportBatches.G038.B000.Data
