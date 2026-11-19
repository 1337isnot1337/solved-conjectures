module

public import Conjectures.FranklSmallCyclicRowCoverage
public import Conjectures.FranklSmallCyclicCanonicalWords
public import Conjectures.FranklSmallCyclicOrbit7Block000Data

/-! 128 literal targets sharing one source proof block.
Original words and row indices are retained; weights may be transported.
-/
@[expose] public section

namespace FranklSmallCyclic.TransportBatches.G000.B001.Data

-- Period 7, original row 7533, representative 124.
def source0 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B000.Data.entryAt ⟨118, by decide +kernel⟩

def target0 : Weights.Entry :=
  { word := [10, 0, 9, 8, 1, 12, 12], weights := [1, 0, 1, 1] }

def points0 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 7537, representative 123.
def source1 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B000.Data.entryAt ⟨117, by decide +kernel⟩

def target1 : Weights.Entry :=
  { word := [10, 0, 9, 8, 9, 12, 12], weights := [1, 0, 1, 1] }

-- Period 7, original row 7547, representative 71.
def source2 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B000.Data.entryAt ⟨68, by decide +kernel⟩

def target2 : Weights.Entry :=
  { word := [10, 0, 12, 2, 0, 8, 9], weights := [1, 0, 0, 1] }

def points2 : List (ℕ × ℕ) := [(0, 2), (1, 0), (2, 1), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 7575, representative 72.
def source3 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B000.Data.entryAt ⟨69, by decide +kernel⟩

def target3 : Weights.Entry :=
  { word := [10, 0, 12, 10, 0, 8, 9], weights := [0, 1, 0, 1] }

def points3 : List (ℕ × ℕ) := [(0, 2), (1, 0), (2, 1), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 7583, representative 131.
def source4 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B000.Data.entryAt ⟨123, by decide +kernel⟩

def target4 : Weights.Entry :=
  { word := [10, 0, 12, 10, 0, 12, 10], weights := [1, 0, 1, 1] }

-- Period 7, original row 7584, representative 131.
def source5 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B000.Data.entryAt ⟨123, by decide +kernel⟩

def target5 : Weights.Entry :=
  { word := [10, 0, 12, 10, 0, 12, 12], weights := [1, 0, 1, 1] }

def points5 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 7592, representative 130.
def source6 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B000.Data.entryAt ⟨122, by decide +kernel⟩

def target6 : Weights.Entry :=
  { word := [10, 0, 12, 10, 8, 12, 12], weights := [1, 0, 1, 1] }

-- Period 7, original row 7608, representative 10.
def source7 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B000.Data.entryAt ⟨8, by decide +kernel⟩

def target7 : Weights.Entry :=
  { word := [10, 2, 0, 9, 8, 8, 6], weights := [1, 1, 0, 1] }

def points7 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 7618, representative 48.
def source8 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B000.Data.entryAt ⟨45, by decide +kernel⟩

def target8 : Weights.Entry :=
  { word := [10, 2, 0, 10, 0, 0, 9], weights := [1, 1, 0, 0] }

def points8 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 3), (4, 5), (5, 4), (6, 6)]

-- Period 7, original row 7625, representative 45.
def source9 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B000.Data.entryAt ⟨42, by decide +kernel⟩

def target9 : Weights.Entry :=
  { word := [10, 2, 0, 10, 0, 8, 9], weights := [0, 1, 0, 1] }

def points9 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 7635, representative 60.
def source10 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B000.Data.entryAt ⟨57, by decide +kernel⟩

def target10 : Weights.Entry :=
  { word := [10, 2, 0, 12, 10, 0, 9], weights := [1, 1, 0, 1] }

def points10 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 7639, representative 105.
def source11 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B000.Data.entryAt ⟨101, by decide +kernel⟩

def target11 : Weights.Entry :=
  { word := [10, 2, 2, 8, 0, 4, 0], weights := [1, 0, 1, 0] }

def points11 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 7641, representative 103.
def source12 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B000.Data.entryAt ⟨99, by decide +kernel⟩

def target12 : Weights.Entry :=
  { word := [10, 2, 2, 8, 0, 12, 0], weights := [1, 0, 1, 0] }

def points12 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 7646, representative 58.
def source13 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B000.Data.entryAt ⟨55, by decide +kernel⟩

def target13 : Weights.Entry :=
  { word := [10, 2, 2, 8, 1, 0, 9], weights := [1, 1, 0, 1] }

def points13 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 7651, representative 52.
def source14 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B000.Data.entryAt ⟨49, by decide +kernel⟩

def target14 : Weights.Entry :=
  { word := [10, 2, 2, 8, 1, 8, 9], weights := [1, 1, 1, 1] }

def points14 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 7653, representative 104.
def source15 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B000.Data.entryAt ⟨100, by decide +kernel⟩

def target15 : Weights.Entry :=
  { word := [10, 2, 2, 8, 8, 4, 0], weights := [1, 0, 1, 0] }

def points15 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 7655, representative 102.
def source16 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B000.Data.entryAt ⟨98, by decide +kernel⟩

def target16 : Weights.Entry :=
  { word := [10, 2, 2, 8, 8, 12, 0], weights := [1, 0, 1, 0] }

def points16 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 7660, representative 57.
def source17 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B000.Data.entryAt ⟨54, by decide +kernel⟩

def target17 : Weights.Entry :=
  { word := [10, 2, 2, 8, 9, 0, 9], weights := [1, 1, 0, 1] }

def points17 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 7665, representative 50.
def source18 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B000.Data.entryAt ⟨47, by decide +kernel⟩

def target18 : Weights.Entry :=
  { word := [10, 2, 2, 8, 9, 8, 9], weights := [1, 1, 1, 1] }

def points18 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 7677, representative 43.
def source19 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B000.Data.entryAt ⟨40, by decide +kernel⟩

def target19 : Weights.Entry :=
  { word := [10, 2, 8, 2, 0, 8, 9], weights := [1, 0, 0, 1] }

def points19 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 7711, representative 9.
def source20 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B000.Data.entryAt ⟨7, by decide +kernel⟩

def target20 : Weights.Entry :=
  { word := [10, 2, 8, 9, 8, 8, 6], weights := [1, 1, 0, 1] }

def points20 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 7727, representative 44.
def source21 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B000.Data.entryAt ⟨41, by decide +kernel⟩

def target21 : Weights.Entry :=
  { word := [10, 2, 8, 10, 0, 8, 9], weights := [0, 1, 0, 1] }

def points21 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 7751, representative 61.
def source22 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B000.Data.entryAt ⟨58, by decide +kernel⟩

def target22 : Weights.Entry :=
  { word := [10, 2, 8, 12, 2, 0, 9], weights := [1, 1, 0, 1] }

def points22 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 7767, representative 59.
def source23 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B000.Data.entryAt ⟨56, by decide +kernel⟩

def target23 : Weights.Entry :=
  { word := [10, 2, 8, 12, 10, 0, 9], weights := [1, 1, 0, 1] }

def points23 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 7779, representative 101.
def source24 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B000.Data.entryAt ⟨97, by decide +kernel⟩

def target24 : Weights.Entry :=
  { word := [10, 2, 10, 8, 0, 4, 0], weights := [1, 0, 1, 0] }

def points24 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 7781, representative 99.
def source25 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B000.Data.entryAt ⟨95, by decide +kernel⟩

def target25 : Weights.Entry :=
  { word := [10, 2, 10, 8, 0, 12, 0], weights := [1, 0, 1, 0] }

def points25 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 7786, representative 56.
def source26 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B000.Data.entryAt ⟨53, by decide +kernel⟩

def target26 : Weights.Entry :=
  { word := [10, 2, 10, 8, 1, 0, 9], weights := [1, 1, 0, 1] }

def points26 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 7791, representative 51.
def source27 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B000.Data.entryAt ⟨48, by decide +kernel⟩

def target27 : Weights.Entry :=
  { word := [10, 2, 10, 8, 1, 8, 9], weights := [1, 1, 1, 1] }

def points27 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 7793, representative 100.
def source28 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B000.Data.entryAt ⟨96, by decide +kernel⟩

def target28 : Weights.Entry :=
  { word := [10, 2, 10, 8, 8, 4, 0], weights := [1, 0, 1, 0] }

def points28 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 7795, representative 98.
def source29 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B000.Data.entryAt ⟨94, by decide +kernel⟩

def target29 : Weights.Entry :=
  { word := [10, 2, 10, 8, 8, 12, 0], weights := [1, 0, 1, 0] }

def points29 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 7800, representative 55.
def source30 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B000.Data.entryAt ⟨52, by decide +kernel⟩

def target30 : Weights.Entry :=
  { word := [10, 2, 10, 8, 9, 0, 9], weights := [1, 1, 0, 1] }

def points30 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 7805, representative 49.
def source31 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B000.Data.entryAt ⟨46, by decide +kernel⟩

def target31 : Weights.Entry :=
  { word := [10, 2, 10, 8, 9, 8, 9], weights := [1, 1, 1, 1] }

def points31 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 7823, representative 86.
def source32 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B000.Data.entryAt ⟨82, by decide +kernel⟩

def target32 : Weights.Entry :=
  { word := [10, 8, 0, 4, 2, 0, 9], weights := [1, 0, 0, 1] }

def points32 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 7844, representative 110.
def source33 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B000.Data.entryAt ⟨105, by decide +kernel⟩

def target33 : Weights.Entry :=
  { word := [10, 8, 0, 4, 8, 12, 12], weights := [1, 0, 0, 1] }

-- Period 7, original row 7849, representative 91.
def source34 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B000.Data.entryAt ⟨87, by decide +kernel⟩

def target34 : Weights.Entry :=
  { word := [10, 8, 0, 4, 10, 0, 9], weights := [1, 0, 0, 1] }

def points34 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 7870, representative 112.
def source35 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B000.Data.entryAt ⟨107, by decide +kernel⟩

def target35 : Weights.Entry :=
  { word := [10, 8, 0, 12, 0, 12, 12], weights := [1, 0, 1, 0] }

-- Period 7, original row 7875, representative 93.
def source36 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B000.Data.entryAt ⟨89, by decide +kernel⟩

def target36 : Weights.Entry :=
  { word := [10, 8, 0, 12, 2, 0, 9], weights := [1, 0, 0, 1] }

def points36 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 7895, representative 111.
def source37 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B000.Data.entryAt ⟨106, by decide +kernel⟩

def target37 : Weights.Entry :=
  { word := [10, 8, 0, 12, 8, 12, 12], weights := [1, 0, 1, 0] }

-- Period 7, original row 7900, representative 92.
def source38 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B000.Data.entryAt ⟨88, by decide +kernel⟩

def target38 : Weights.Entry :=
  { word := [10, 8, 0, 12, 10, 0, 9], weights := [1, 0, 0, 1] }

def points38 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 7912, representative 62.
def source39 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B000.Data.entryAt ⟨59, by decide +kernel⟩

def target39 : Weights.Entry :=
  { word := [10, 8, 2, 0, 1, 8, 9], weights := [0, 0, 1, 0] }

def points39 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 7915, representative 63.
def source40 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B000.Data.entryAt ⟨60, by decide +kernel⟩

def target40 : Weights.Entry :=
  { word := [10, 8, 2, 0, 9, 8, 9], weights := [0, 0, 1, 0] }

def points40 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 7925, representative 66.
def source41 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B000.Data.entryAt ⟨63, by decide +kernel⟩

def target41 : Weights.Entry :=
  { word := [10, 8, 4, 2, 0, 8, 9], weights := [1, 0, 0, 1] }

def points41 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 7952, representative 69.
def source42 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B000.Data.entryAt ⟨66, by decide +kernel⟩

def target42 : Weights.Entry :=
  { word := [10, 8, 4, 10, 0, 8, 9], weights := [0, 1, 0, 1] }

def points42 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 7987, representative 87.
def source43 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B000.Data.entryAt ⟨83, by decide +kernel⟩

def target43 : Weights.Entry :=
  { word := [10, 8, 8, 4, 2, 0, 9], weights := [1, 0, 0, 1] }

def points43 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8011, representative 113.
def source44 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B000.Data.entryAt ⟨108, by decide +kernel⟩

def target44 : Weights.Entry :=
  { word := [10, 8, 8, 4, 8, 12, 10], weights := [1, 0, 1, 0] }

-- Period 7, original row 8012, representative 107.
def source45 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B000.Data.entryAt ⟨102, by decide +kernel⟩

def target45 : Weights.Entry :=
  { word := [10, 8, 8, 4, 8, 12, 12], weights := [1, 0, 0, 1] }

-- Period 7, original row 8017, representative 88.
def source46 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B000.Data.entryAt ⟨84, by decide +kernel⟩

def target46 : Weights.Entry :=
  { word := [10, 8, 8, 4, 10, 0, 9], weights := [1, 0, 0, 1] }

def points46 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8037, representative 129.
def source47 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B000.Data.entryAt ⟨121, by decide +kernel⟩

def target47 : Weights.Entry :=
  { word := [10, 8, 8, 8, 1, 12, 10], weights := [1, 0, 1, 1] }

-- Period 7, original row 8038, representative 128.
def source48 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B000.Data.entryAt ⟨120, by decide +kernel⟩

def target48 : Weights.Entry :=
  { word := [10, 8, 8, 8, 1, 12, 12], weights := [1, 0, 1, 1] }

-- Period 7, original row 8042, representative 127.
def source49 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B000.Data.entryAt ⟨119, by decide +kernel⟩

def target49 : Weights.Entry :=
  { word := [10, 8, 8, 8, 9, 12, 12], weights := [1, 0, 1, 1] }

-- Period 7, original row 8055, representative 115.
def source50 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B000.Data.entryAt ⟨110, by decide +kernel⟩

def target50 : Weights.Entry :=
  { word := [10, 8, 8, 12, 0, 12, 10], weights := [1, 0, 1, 0] }

-- Period 7, original row 8056, representative 109.
def source51 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B000.Data.entryAt ⟨104, by decide +kernel⟩

def target51 : Weights.Entry :=
  { word := [10, 8, 8, 12, 0, 12, 12], weights := [1, 0, 1, 0] }

-- Period 7, original row 8061, representative 90.
def source52 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B000.Data.entryAt ⟨86, by decide +kernel⟩

def target52 : Weights.Entry :=
  { word := [10, 8, 8, 12, 2, 0, 9], weights := [1, 0, 0, 1] }

def points52 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8084, representative 114.
def source53 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B000.Data.entryAt ⟨109, by decide +kernel⟩

def target53 : Weights.Entry :=
  { word := [10, 8, 8, 12, 8, 12, 10], weights := [1, 0, 1, 0] }

-- Period 7, original row 8085, representative 108.
def source54 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B000.Data.entryAt ⟨103, by decide +kernel⟩

def target54 : Weights.Entry :=
  { word := [10, 8, 8, 12, 8, 12, 12], weights := [1, 0, 1, 0] }

-- Period 7, original row 8090, representative 89.
def source55 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B000.Data.entryAt ⟨85, by decide +kernel⟩

def target55 : Weights.Entry :=
  { word := [10, 8, 8, 12, 10, 0, 9], weights := [1, 0, 0, 1] }

def points55 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8112, representative 122.
def source56 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B000.Data.entryAt ⟨116, by decide +kernel⟩

def target56 : Weights.Entry :=
  { word := [10, 8, 9, 8, 1, 12, 10], weights := [1, 0, 1, 1] }

-- Period 7, original row 8113, representative 121.
def source57 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B000.Data.entryAt ⟨115, by decide +kernel⟩

def target57 : Weights.Entry :=
  { word := [10, 8, 9, 8, 1, 12, 12], weights := [1, 0, 1, 1] }

-- Period 7, original row 8120, representative 65.
def source58 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B000.Data.entryAt ⟨62, by decide +kernel⟩

def target58 : Weights.Entry :=
  { word := [10, 8, 10, 0, 1, 8, 9], weights := [0, 0, 1, 0] }

def points58 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8123, representative 64.
def source59 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B000.Data.entryAt ⟨61, by decide +kernel⟩

def target59 : Weights.Entry :=
  { word := [10, 8, 10, 0, 9, 8, 9], weights := [0, 0, 1, 0] }

def points59 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8133, representative 67.
def source60 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B000.Data.entryAt ⟨64, by decide +kernel⟩

def target60 : Weights.Entry :=
  { word := [10, 8, 12, 2, 0, 8, 9], weights := [1, 0, 0, 1] }

def points60 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8160, representative 68.
def source61 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B000.Data.entryAt ⟨65, by decide +kernel⟩

def target61 : Weights.Entry :=
  { word := [10, 8, 12, 10, 0, 8, 9], weights := [0, 1, 0, 1] }

def points61 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8184, representative 24.
def source62 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B000.Data.entryAt ⟨22, by decide +kernel⟩

def target62 : Weights.Entry :=
  { word := [10, 10, 0, 2, 0, 8, 9], weights := [2, 1, 0, 1] }

def points62 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8191, representative 124.
def source63 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B000.Data.entryAt ⟨118, by decide +kernel⟩

def target63 : Weights.Entry :=
  { word := [10, 10, 0, 9, 8, 1, 12], weights := [1, 1, 0, 1] }

def points63 : List (ℕ × ℕ) := [(0, 1), (1, 2), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8195, representative 8.
def source64 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B000.Data.entryAt ⟨6, by decide +kernel⟩

def target64 : Weights.Entry :=
  { word := [10, 10, 0, 9, 8, 8, 6], weights := [1, 1, 0, 1] }

def points64 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8196, representative 128.
def source65 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B000.Data.entryAt ⟨120, by decide +kernel⟩

def target65 : Weights.Entry :=
  { word := [10, 10, 0, 9, 8, 8, 12], weights := [1, 1, 0, 1] }

def points65 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8198, representative 121.
def source66 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B000.Data.entryAt ⟨115, by decide +kernel⟩

def target66 : Weights.Entry :=
  { word := [10, 10, 0, 9, 8, 9, 12], weights := [1, 1, 0, 1] }

def points66 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8205, representative 28.
def source67 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B000.Data.entryAt ⟨26, by decide +kernel⟩

def target67 : Weights.Entry :=
  { word := [10, 10, 0, 10, 0, 0, 9], weights := [0, 1, 0, 1] }

def points67 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8207, representative 119.
def source68 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B000.Data.entryAt ⟨114, by decide +kernel⟩

def target68 : Weights.Entry :=
  { word := [10, 10, 0, 10, 0, 0, 12], weights := [0, 1, 0, 1] }

def points68 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8212, representative 27.
def source69 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B000.Data.entryAt ⟨25, by decide +kernel⟩

def target69 : Weights.Entry :=
  { word := [10, 10, 0, 10, 0, 8, 9], weights := [0, 1, 0, 1] }

def points69 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8213, representative 112.
def source70 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B000.Data.entryAt ⟨107, by decide +kernel⟩

def target70 : Weights.Entry :=
  { word := [10, 10, 0, 10, 0, 8, 12], weights := [0, 1, 0, 1] }

def points70 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8215, representative 118.
def source71 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B000.Data.entryAt ⟨113, by decide +kernel⟩

def target71 : Weights.Entry :=
  { word := [10, 10, 0, 10, 8, 0, 12], weights := [0, 1, 0, 1] }

def points71 : List (ℕ × ℕ) := [(0, 1), (1, 2), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8217, representative 109.
def source72 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B000.Data.entryAt ⟨104, by decide +kernel⟩

def target72 : Weights.Entry :=
  { word := [10, 10, 0, 10, 8, 8, 12], weights := [0, 1, 0, 1] }

def points72 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8222, representative 42.
def source73 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B000.Data.entryAt ⟨39, by decide +kernel⟩

def target73 : Weights.Entry :=
  { word := [10, 10, 0, 12, 2, 0, 9], weights := [1, 1, 0, 1] }

def points73 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8224, representative 133.
def source74 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B000.Data.entryAt ⟨125, by decide +kernel⟩

def target74 : Weights.Entry :=
  { word := [10, 10, 0, 12, 2, 0, 12], weights := [1, 1, 0, 1] }

def points74 : List (ℕ × ℕ) := [(0, 1), (1, 2), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8230, representative 41.
def source75 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B000.Data.entryAt ⟨38, by decide +kernel⟩

def target75 : Weights.Entry :=
  { word := [10, 10, 0, 12, 10, 0, 9], weights := [1, 1, 0, 1] }

def points75 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8232, representative 131.
def source76 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B000.Data.entryAt ⟨123, by decide +kernel⟩

def target76 : Weights.Entry :=
  { word := [10, 10, 0, 12, 10, 0, 12], weights := [1, 1, 0, 1] }

def points76 : List (ℕ × ℕ) := [(0, 1), (1, 2), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8238, representative 36.
def source77 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B000.Data.entryAt ⟨33, by decide +kernel⟩

def target77 : Weights.Entry :=
  { word := [10, 10, 2, 8, 1, 0, 9], weights := [1, 1, 0, 1] }

def points77 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8243, representative 32.
def source78 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B000.Data.entryAt ⟨29, by decide +kernel⟩

def target78 : Weights.Entry :=
  { word := [10, 10, 2, 8, 1, 8, 9], weights := [1, 1, 1, 1] }

def points78 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8245, representative 97.
def source79 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B000.Data.entryAt ⟨93, by decide +kernel⟩

def target79 : Weights.Entry :=
  { word := [10, 10, 2, 8, 8, 4, 0], weights := [1, 0, 1, 0] }

def points79 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8247, representative 96.
def source80 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B000.Data.entryAt ⟨92, by decide +kernel⟩

def target80 : Weights.Entry :=
  { word := [10, 10, 2, 8, 8, 12, 0], weights := [1, 0, 1, 0] }

def points80 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8252, representative 35.
def source81 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B000.Data.entryAt ⟨32, by decide +kernel⟩

def target81 : Weights.Entry :=
  { word := [10, 10, 2, 8, 9, 0, 9], weights := [1, 1, 0, 1] }

def points81 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8254, representative 135.
def source82 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B000.Data.entryAt ⟨127, by decide +kernel⟩

def target82 : Weights.Entry :=
  { word := [10, 10, 2, 8, 9, 0, 12], weights := [1, 1, 0, 1] }

def points82 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8257, representative 31.
def source83 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B000.Data.entryAt ⟨28, by decide +kernel⟩

def target83 : Weights.Entry :=
  { word := [10, 10, 2, 8, 9, 8, 9], weights := [1, 1, 1, 1] }

def points83 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8270, representative 25.
def source84 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B000.Data.entryAt ⟨23, by decide +kernel⟩

def target84 : Weights.Entry :=
  { word := [10, 10, 8, 2, 0, 8, 9], weights := [1, 0, 0, 1] }

def points84 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8272, representative 110.
def source85 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B000.Data.entryAt ⟨105, by decide +kernel⟩

def target85 : Weights.Entry :=
  { word := [10, 10, 8, 2, 0, 8, 12], weights := [1, 0, 0, 1] }

def points85 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8278, representative 116.
def source86 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B000.Data.entryAt ⟨111, by decide +kernel⟩

def target86 : Weights.Entry :=
  { word := [10, 10, 8, 2, 8, 0, 12], weights := [1, 0, 0, 1] }

def points86 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8282, representative 107.
def source87 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B000.Data.entryAt ⟨102, by decide +kernel⟩

def target87 : Weights.Entry :=
  { word := [10, 10, 8, 2, 8, 8, 12], weights := [1, 0, 0, 1] }

def points87 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8300, representative 123.
def source88 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B000.Data.entryAt ⟨117, by decide +kernel⟩

def target88 : Weights.Entry :=
  { word := [10, 10, 8, 9, 8, 1, 12], weights := [1, 1, 0, 1] }

def points88 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8304, representative 7.
def source89 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B000.Data.entryAt ⟨5, by decide +kernel⟩

def target89 : Weights.Entry :=
  { word := [10, 10, 8, 9, 8, 8, 6], weights := [1, 1, 0, 1] }

def points89 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8305, representative 127.
def source90 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B000.Data.entryAt ⟨119, by decide +kernel⟩

def target90 : Weights.Entry :=
  { word := [10, 10, 8, 9, 8, 8, 12], weights := [1, 1, 0, 1] }

def points90 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8320, representative 26.
def source91 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B000.Data.entryAt ⟨24, by decide +kernel⟩

def target91 : Weights.Entry :=
  { word := [10, 10, 8, 10, 0, 8, 9], weights := [0, 1, 0, 1] }

def points91 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8322, representative 111.
def source92 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B000.Data.entryAt ⟨106, by decide +kernel⟩

def target92 : Weights.Entry :=
  { word := [10, 10, 8, 10, 0, 8, 12], weights := [0, 1, 0, 1] }

def points92 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8329, representative 117.
def source93 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B000.Data.entryAt ⟨112, by decide +kernel⟩

def target93 : Weights.Entry :=
  { word := [10, 10, 8, 10, 8, 0, 12], weights := [0, 1, 0, 1] }

def points93 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8335, representative 108.
def source94 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B000.Data.entryAt ⟨103, by decide +kernel⟩

def target94 : Weights.Entry :=
  { word := [10, 10, 8, 10, 8, 8, 12], weights := [0, 1, 0, 1] }

def points94 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8344, representative 40.
def source95 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B000.Data.entryAt ⟨37, by decide +kernel⟩

def target95 : Weights.Entry :=
  { word := [10, 10, 8, 12, 2, 0, 9], weights := [1, 1, 0, 1] }

def points95 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8346, representative 132.
def source96 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B000.Data.entryAt ⟨124, by decide +kernel⟩

def target96 : Weights.Entry :=
  { word := [10, 10, 8, 12, 2, 0, 12], weights := [1, 1, 0, 1] }

def points96 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8366, representative 39.
def source97 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B000.Data.entryAt ⟨36, by decide +kernel⟩

def target97 : Weights.Entry :=
  { word := [10, 10, 8, 12, 10, 0, 9], weights := [1, 1, 0, 1] }

def points97 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8368, representative 130.
def source98 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B000.Data.entryAt ⟨122, by decide +kernel⟩

def target98 : Weights.Entry :=
  { word := [10, 10, 8, 12, 10, 0, 12], weights := [1, 1, 0, 1] }

def points98 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8382, representative 34.
def source99 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B000.Data.entryAt ⟨31, by decide +kernel⟩

def target99 : Weights.Entry :=
  { word := [10, 10, 10, 8, 1, 0, 9], weights := [1, 1, 0, 1] }

def points99 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8387, representative 30.
def source100 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B000.Data.entryAt ⟨27, by decide +kernel⟩

def target100 : Weights.Entry :=
  { word := [10, 10, 10, 8, 1, 8, 9], weights := [1, 1, 1, 1] }

def points100 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8389, representative 95.
def source101 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B000.Data.entryAt ⟨91, by decide +kernel⟩

def target101 : Weights.Entry :=
  { word := [10, 10, 10, 8, 8, 4, 0], weights := [1, 0, 1, 0] }

def points101 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8391, representative 94.
def source102 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B000.Data.entryAt ⟨90, by decide +kernel⟩

def target102 : Weights.Entry :=
  { word := [10, 10, 10, 8, 8, 12, 0], weights := [1, 0, 1, 0] }

def points102 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8396, representative 33.
def source103 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B000.Data.entryAt ⟨30, by decide +kernel⟩

def target103 : Weights.Entry :=
  { word := [10, 10, 10, 8, 9, 0, 9], weights := [1, 1, 0, 1] }

def points103 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8398, representative 134.
def source104 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B000.Data.entryAt ⟨126, by decide +kernel⟩

def target104 : Weights.Entry :=
  { word := [10, 10, 10, 8, 9, 0, 12], weights := [1, 1, 0, 1] }

def points104 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8422, representative 48.
def source105 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B000.Data.entryAt ⟨45, by decide +kernel⟩

def target105 : Weights.Entry :=
  { word := [12, 0, 0, 12, 0, 4, 10], weights := [1, 0, 1, 0] }

def points105 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 8437, representative 86.
def source106 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B000.Data.entryAt ⟨82, by decide +kernel⟩

def target106 : Weights.Entry :=
  { word := [12, 0, 4, 2, 0, 8, 10], weights := [1, 0, 0, 1] }

def points106 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 8465, representative 93.
def source107 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B000.Data.entryAt ⟨89, by decide +kernel⟩

def target107 : Weights.Entry :=
  { word := [12, 0, 4, 10, 0, 8, 10], weights := [1, 0, 0, 1] }

def points107 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 8472, representative 42.
def source108 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B000.Data.entryAt ⟨39, by decide +kernel⟩

def target108 : Weights.Entry :=
  { word := [12, 0, 4, 10, 0, 12, 10], weights := [1, 0, 1, 1] }

def points108 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 8526, representative 91.
def source109 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B000.Data.entryAt ⟨87, by decide +kernel⟩

def target109 : Weights.Entry :=
  { word := [12, 0, 12, 2, 0, 8, 10], weights := [1, 0, 0, 1] }

def points109 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 8551, representative 60.
def source110 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B000.Data.entryAt ⟨57, by decide +kernel⟩

def target110 : Weights.Entry :=
  { word := [12, 0, 12, 10, 0, 4, 10], weights := [1, 0, 1, 1] }

def points110 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 8558, representative 92.
def source111 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B000.Data.entryAt ⟨88, by decide +kernel⟩

def target111 : Weights.Entry :=
  { word := [12, 0, 12, 10, 0, 8, 10], weights := [1, 0, 0, 1] }

def points111 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 8565, representative 41.
def source112 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B000.Data.entryAt ⟨38, by decide +kernel⟩

def target112 : Weights.Entry :=
  { word := [12, 0, 12, 10, 0, 12, 10], weights := [1, 0, 1, 1] }

def points112 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 8588, representative 54.
def source113 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B000.Data.entryAt ⟨51, by decide +kernel⟩

def target113 : Weights.Entry :=
  { word := [12, 2, 0, 9, 8, 2, 10], weights := [1, 1, 0, 1] }

-- Period 7, original row 8590, representative 4.
def source114 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B000.Data.entryAt ⟨2, by decide +kernel⟩

def target114 : Weights.Entry :=
  { word := [12, 2, 0, 9, 8, 8, 6], weights := [1, 1, 0, 1] }

def points114 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8595, representative 53.
def source115 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B000.Data.entryAt ⟨50, by decide +kernel⟩

def target115 : Weights.Entry :=
  { word := [12, 2, 0, 9, 8, 10, 10], weights := [1, 1, 0, 1] }

-- Period 7, original row 8601, representative 48.
def source116 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B000.Data.entryAt ⟨45, by decide +kernel⟩

def target116 : Weights.Entry :=
  { word := [12, 2, 0, 10, 0, 0, 10], weights := [1, 1, 0, 0] }

def points116 : List (ℕ × ℕ) := [(0, 1), (1, 2), (2, 0), (3, 3), (4, 5), (5, 4), (6, 6)]

-- Period 7, original row 8618, representative 60.
def source117 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B000.Data.entryAt ⟨57, by decide +kernel⟩

def target117 : Weights.Entry :=
  { word := [12, 2, 0, 12, 10, 0, 10], weights := [1, 1, 0, 1] }

def points117 : List (ℕ × ℕ) := [(0, 1), (1, 2), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8631, representative 46.
def source118 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B000.Data.entryAt ⟨43, by decide +kernel⟩

def target118 : Weights.Entry :=
  { word := [12, 2, 8, 2, 0, 8, 10], weights := [1, 0, 0, 1] }

-- Period 7, original row 8664, representative 47.
def source119 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B000.Data.entryAt ⟨44, by decide +kernel⟩

def target119 : Weights.Entry :=
  { word := [12, 2, 8, 10, 0, 8, 10], weights := [1, 0, 0, 1] }

-- Period 7, original row 8690, representative 81.
def source120 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B000.Data.entryAt ⟨77, by decide +kernel⟩

def target120 : Weights.Entry :=
  { word := [12, 4, 4, 8, 8, 2, 10], weights := [0, 1, 1, 0] }

-- Period 7, original row 8692, representative 79.
def source121 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B000.Data.entryAt ⟨75, by decide +kernel⟩

def target121 : Weights.Entry :=
  { word := [12, 4, 4, 8, 8, 10, 10], weights := [0, 1, 1, 0] }

-- Period 7, original row 8698, representative 54.
def source122 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B000.Data.entryAt ⟨51, by decide +kernel⟩

def target122 : Weights.Entry :=
  { word := [12, 4, 8, 8, 1, 4, 10], weights := [1, 0, 1, 1] }

def points122 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8703, representative 38.
def source123 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B000.Data.entryAt ⟨35, by decide +kernel⟩

def target123 : Weights.Entry :=
  { word := [12, 4, 8, 8, 1, 12, 10], weights := [1, 0, 1, 1] }

-- Period 7, original row 8706, representative 81.
def source124 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B000.Data.entryAt ⟨77, by decide +kernel⟩

def target124 : Weights.Entry :=
  { word := [12, 4, 8, 8, 2, 2, 10], weights := [0, 1, 1, 0] }

def points124 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8708, representative 77.
def source125 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B000.Data.entryAt ⟨73, by decide +kernel⟩

def target125 : Weights.Entry :=
  { word := [12, 4, 8, 8, 2, 10, 10], weights := [0, 1, 1, 0] }

-- Period 7, original row 8715, representative 80.
def source126 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B000.Data.entryAt ⟨76, by decide +kernel⟩

def target126 : Weights.Entry :=
  { word := [12, 4, 8, 8, 10, 2, 10], weights := [0, 1, 1, 0] }

-- Period 7, original row 8717, representative 76.
def source127 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B000.Data.entryAt ⟨72, by decide +kernel⟩

def target127 : Weights.Entry :=
  { word := [12, 4, 8, 8, 10, 10, 10], weights := [0, 1, 1, 0] }

def period7Entries : List Weights.Entry := [target0, target1, target2, target3, target4, target5, target6, target7, target8, target9, target10, target11, target12, target13, target14, target15, target16, target17, target18, target19, target20, target21, target22, target23, target24, target25, target26, target27, target28, target29, target30, target31, target32, target33, target34, target35, target36, target37, target38, target39, target40, target41, target42, target43, target44, target45, target46, target47, target48, target49, target50, target51, target52, target53, target54, target55, target56, target57, target58, target59, target60, target61, target62, target63, target64, target65, target66, target67, target68, target69, target70, target71, target72, target73, target74, target75, target76, target77, target78, target79, target80, target81, target82, target83, target84, target85, target86, target87, target88, target89, target90, target91, target92, target93, target94, target95, target96, target97, target98, target99, target100, target101, target102, target103, target104, target105, target106, target107, target108, target109, target110, target111, target112, target113, target114, target115, target116, target117, target118, target119, target120, target121, target122, target123, target124, target125, target126, target127]

def period7Chunk : RowCoverage.Chunk where
  rows := [⟨7533, target0⟩, ⟨7537, target1⟩, ⟨7547, target2⟩, ⟨7575, target3⟩, ⟨7583, target4⟩, ⟨7584, target5⟩, ⟨7592, target6⟩, ⟨7608, target7⟩, ⟨7618, target8⟩, ⟨7625, target9⟩, ⟨7635, target10⟩, ⟨7639, target11⟩, ⟨7641, target12⟩, ⟨7646, target13⟩, ⟨7651, target14⟩, ⟨7653, target15⟩, ⟨7655, target16⟩, ⟨7660, target17⟩, ⟨7665, target18⟩, ⟨7677, target19⟩, ⟨7711, target20⟩, ⟨7727, target21⟩, ⟨7751, target22⟩, ⟨7767, target23⟩, ⟨7779, target24⟩, ⟨7781, target25⟩, ⟨7786, target26⟩, ⟨7791, target27⟩, ⟨7793, target28⟩, ⟨7795, target29⟩, ⟨7800, target30⟩, ⟨7805, target31⟩, ⟨7823, target32⟩, ⟨7844, target33⟩, ⟨7849, target34⟩, ⟨7870, target35⟩, ⟨7875, target36⟩, ⟨7895, target37⟩, ⟨7900, target38⟩, ⟨7912, target39⟩, ⟨7915, target40⟩, ⟨7925, target41⟩, ⟨7952, target42⟩, ⟨7987, target43⟩, ⟨8011, target44⟩, ⟨8012, target45⟩, ⟨8017, target46⟩, ⟨8037, target47⟩, ⟨8038, target48⟩, ⟨8042, target49⟩, ⟨8055, target50⟩, ⟨8056, target51⟩, ⟨8061, target52⟩, ⟨8084, target53⟩, ⟨8085, target54⟩, ⟨8090, target55⟩, ⟨8112, target56⟩, ⟨8113, target57⟩, ⟨8120, target58⟩, ⟨8123, target59⟩, ⟨8133, target60⟩, ⟨8160, target61⟩, ⟨8184, target62⟩, ⟨8191, target63⟩, ⟨8195, target64⟩, ⟨8196, target65⟩, ⟨8198, target66⟩, ⟨8205, target67⟩, ⟨8207, target68⟩, ⟨8212, target69⟩, ⟨8213, target70⟩, ⟨8215, target71⟩, ⟨8217, target72⟩, ⟨8222, target73⟩, ⟨8224, target74⟩, ⟨8230, target75⟩, ⟨8232, target76⟩, ⟨8238, target77⟩, ⟨8243, target78⟩, ⟨8245, target79⟩, ⟨8247, target80⟩, ⟨8252, target81⟩, ⟨8254, target82⟩, ⟨8257, target83⟩, ⟨8270, target84⟩, ⟨8272, target85⟩, ⟨8278, target86⟩, ⟨8282, target87⟩, ⟨8300, target88⟩, ⟨8304, target89⟩, ⟨8305, target90⟩, ⟨8320, target91⟩, ⟨8322, target92⟩, ⟨8329, target93⟩, ⟨8335, target94⟩, ⟨8344, target95⟩, ⟨8346, target96⟩, ⟨8366, target97⟩, ⟨8368, target98⟩, ⟨8382, target99⟩, ⟨8387, target100⟩, ⟨8389, target101⟩, ⟨8391, target102⟩, ⟨8396, target103⟩, ⟨8398, target104⟩, ⟨8422, target105⟩, ⟨8437, target106⟩, ⟨8465, target107⟩, ⟨8472, target108⟩, ⟨8526, target109⟩, ⟨8551, target110⟩, ⟨8558, target111⟩, ⟨8565, target112⟩, ⟨8588, target113⟩, ⟨8590, target114⟩, ⟨8595, target115⟩, ⟨8601, target116⟩, ⟨8618, target117⟩, ⟨8631, target118⟩, ⟨8664, target119⟩, ⟨8690, target120⟩, ⟨8692, target121⟩, ⟨8698, target122⟩, ⟨8703, target123⟩, ⟨8706, target124⟩, ⟨8708, target125⟩, ⟨8715, target126⟩, ⟨8717, target127⟩]
  indexMask := 150055341056154420317969105565639508872254804840819711691983873990907142351436283675417526943662671612455132209201148395681698110450498367624443356179681168973204804345160540164673275602449245007142530632568930557789077356257439757428085248983636041674230652513691279123709731622070962867406693300136049338402475547251108195587598957260878937818903390647586399783422214016564457529513976865901888877572353590274020158288762795792047530944121765188714214505417048232917645810037003766510786860456998953899489872524721801783355660648789570484023909932020726536856292223822118043629571191406952442466566417340263113446928618104257964636681596459589493163174722890485761458880874583198894062343398039451278326725682288250396364449146469312024037942954484568541966337812453307632411757234759460487524968231161702423242781943993661500113891983978114760487182845974171285155132419121155314259117613123206979018696373705708329515143768487531353782039283773161104309948453287448475876970721374777861842104055251760580348295297821029828736885754422602380339706204545754728883013962971798265477155853503616296417123468741186399219653579565172039709652125745581621892273806918879653693968822314091835786179597605574799331130901846836188773700034345611645326738021129056132569585735013895118201058865645677916497600787719923076200855081712479776119659602675107866833783599896232211727006482452929898086730416124376120163223627334164281172307717997368715801484945349727268624677589323214903270995322935998102530338009674401432403902826447004464650152715582504383585193492992295257523826417561169481441999028431136823639105882055212177191401987229315517980060285950317383296170633600865861807192027104883876495748121362853289414760019642604535589468868296104181791018103336719748517264472213915176460992528238308533510945170759531139920126817390438692809864588358512054078810670776558583385179160128196243799965668319821458452670376573982568649563108477180081546288143046127769187879121872282722209003403403122343104189129090102356660062441675339185481808952398533814864365928231075610672819309796980114983584958156187303963236696078043075486901984883082481555556397983502342850964197705336393055311023020696351897944615660583144944222828063870748559727826504279782875283614734632402294873645736944414147269446176659343693099364124477332352397041350713240628838439455924545514855938770214824143418708629654948606465692934907833408997581859431200885447604144310261652323171550335940187101436078179049647194077714629793691787888762000550063502099071330291871480421794554914350830036541721643315053661596561955262038399845517423652323826073600
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

end FranklSmallCyclic.TransportBatches.G000.B001.Data
