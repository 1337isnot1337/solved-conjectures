module

public import Conjectures.FranklSmallCyclicMaskTransport
public import Conjectures.FranklSmallCyclicOrbit7Block000Data
public import Conjectures.FranklSmallCyclicOrbit7Block001Data
public import Conjectures.FranklSmallCyclicOrbit7Block002Data
public import Conjectures.FranklSmallCyclicOrbit7Block003Data

/-! Bounded explicit transport candidates: 128 literal row/period cases.
Target weights are transported witnesses and may differ from original weights.
This sample is not the complete 9,088-row table for any period.
Orbit packet SHA256: 0994809d949f2eb51a6fa9a4899e60b87476a7fe0479bd428f4280ccd801bd6c
-/
@[expose] public section

namespace FranklSmallCyclic.OrbitTransportPilot.Data

-- Target period 7, row 4594; representative 265.
def source0 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B001.Data.entryAt ⟨126, by decide +kernel⟩

def target0 : Weights.Entry :=
  { word := [8, 1, 8, 9, 12, 12, 4], weights := [1, 0, 1, 1] }

def points0 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Target period 7, row 5918; representative 261.
def source1 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B001.Data.entryAt ⟨122, by decide +kernel⟩

def target1 : Weights.Entry :=
  { word := [8, 9, 0, 9, 12, 12, 4], weights := [1, 1, 1, 1] }

def points1 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Target period 7, row 6025; representative 260.
def source2 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B001.Data.entryAt ⟨121, by decide +kernel⟩

def target2 : Weights.Entry :=
  { word := [8, 9, 8, 9, 4, 12, 4], weights := [1, 1, 1, 1] }

def points2 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Target period 7, row 6029; representative 259.
def source3 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B001.Data.entryAt ⟨120, by decide +kernel⟩

def target3 : Weights.Entry :=
  { word := [8, 9, 8, 9, 12, 12, 4], weights := [1, 1, 1, 1] }

def points3 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Target period 7, row 7498; representative 250.
def source4 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B001.Data.entryAt ⟨111, by decide +kernel⟩

def target4 : Weights.Entry :=
  { word := [10, 0, 8, 9, 12, 12, 4], weights := [1, 0, 1, 1] }

def points4 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Target period 7, row 7533; representative 124.
def source5 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B000.Data.entryAt ⟨118, by decide +kernel⟩

def target5 : Weights.Entry :=
  { word := [10, 0, 9, 8, 1, 12, 12], weights := [1, 0, 1, 1] }

def points5 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Target period 7, row 7536; representative 239.
def source6 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B001.Data.entryAt ⟨100, by decide +kernel⟩

def target6 : Weights.Entry :=
  { word := [10, 0, 9, 8, 9, 12, 4], weights := [1, 0, 1, 1] }

def points6 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Target period 7, row 7584; representative 131.
def source7 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B000.Data.entryAt ⟨123, by decide +kernel⟩

def target7 : Weights.Entry :=
  { word := [10, 0, 12, 10, 0, 12, 12], weights := [1, 0, 1, 1] }

def points7 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Target period 7, row 7591; representative 246.
def source8 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B001.Data.entryAt ⟨107, by decide +kernel⟩

def target8 : Weights.Entry :=
  { word := [10, 0, 12, 10, 8, 12, 4], weights := [1, 0, 1, 1] }

def points8 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Target period 7, row 7778; representative 304.
def source9 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B002.Data.entryAt ⟨37, by decide +kernel⟩

def target9 : Weights.Entry :=
  { word := [10, 2, 8, 12, 12, 12, 8], weights := [1, 1, 1, 1] }

def points9 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Target period 7, row 7803; representative 335.
def source10 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B002.Data.entryAt ⟨68, by decide +kernel⟩

def target10 : Weights.Entry :=
  { word := [10, 2, 10, 8, 9, 8, 1], weights := [1, 1, 1, 1] }

def points10 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Target period 7, row 7805; representative 49.
def source11 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B000.Data.entryAt ⟨46, by decide +kernel⟩

def target11 : Weights.Entry :=
  { word := [10, 2, 10, 8, 9, 8, 9], weights := [1, 1, 1, 1] }

def points11 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Target period 7, row 7961; representative 242.
def source12 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B001.Data.entryAt ⟨103, by decide +kernel⟩

def target12 : Weights.Entry :=
  { word := [10, 8, 4, 10, 8, 12, 4], weights := [2, 2, 1, 3] }

def points12 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Target period 7, row 8028; representative 368.
def source13 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B002.Data.entryAt ⟨101, by decide +kernel⟩

def target13 : Weights.Entry :=
  { word := [10, 8, 8, 4, 12, 12, 8], weights := [1, 0, 0, 1] }

def points13 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Target period 7, row 8041; representative 243.
def source14 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B001.Data.entryAt ⟨104, by decide +kernel⟩

def target14 : Weights.Entry :=
  { word := [10, 8, 8, 8, 9, 12, 4], weights := [1, 0, 1, 1] }

def points14 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Target period 7, row 8072; representative 370.
def source15 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B002.Data.entryAt ⟨103, by decide +kernel⟩

def target15 : Weights.Entry :=
  { word := [10, 8, 8, 12, 4, 12, 8], weights := [1, 0, 0, 1] }

def points15 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Target period 7, row 8081; representative 230.
def source16 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B001.Data.entryAt ⟨91, by decide +kernel⟩

def target16 : Weights.Entry :=
  { word := [10, 8, 8, 12, 8, 12, 2], weights := [1, 0, 0, 1] }

def points16 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Target period 7, row 8082; representative 224.
def source17 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B001.Data.entryAt ⟨85, by decide +kernel⟩

def target17 : Weights.Entry :=
  { word := [10, 8, 8, 12, 8, 12, 4], weights := [1, 0, 0, 1] }

def points17 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Target period 7, row 8083; representative 372.
def source18 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B002.Data.entryAt ⟨105, by decide +kernel⟩

def target18 : Weights.Entry :=
  { word := [10, 8, 8, 12, 8, 12, 8], weights := [0, 0, 1, 0] }

def points18 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Target period 7, row 8090; representative 89.
def source19 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B000.Data.entryAt ⟨85, by decide +kernel⟩

def target19 : Weights.Entry :=
  { word := [10, 8, 8, 12, 10, 0, 9], weights := [1, 0, 0, 1] }

def points19 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Target period 7, row 8099; representative 391.
def source20 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B002.Data.entryAt ⟨124, by decide +kernel⟩

def target20 : Weights.Entry :=
  { word := [10, 8, 8, 12, 12, 4, 8], weights := [1, 0, 0, 1] }

def points20 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Target period 7, row 8100; representative 456.
def source21 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B003.Data.entryAt ⟨61, by decide +kernel⟩

def target21 : Weights.Entry :=
  { word := [10, 8, 8, 12, 12, 12, 0], weights := [1, 0, 0, 1] }

def points21 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Target period 7, row 8101; representative 369.
def source22 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B002.Data.entryAt ⟨102, by decide +kernel⟩

def target22 : Weights.Entry :=
  { word := [10, 8, 8, 12, 12, 12, 8], weights := [1, 0, 0, 1] }

def points22 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Target period 7, row 8109; representative 238.
def source23 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B001.Data.entryAt ⟨99, by decide +kernel⟩

def target23 : Weights.Entry :=
  { word := [10, 8, 9, 8, 1, 12, 2], weights := [1, 0, 1, 1] }

def points23 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Target period 7, row 8110; representative 237.
def source24 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B001.Data.entryAt ⟨98, by decide +kernel⟩

def target24 : Weights.Entry :=
  { word := [10, 8, 9, 8, 1, 12, 4], weights := [1, 0, 1, 1] }

def points24 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Target period 7, row 8111; representative 382.
def source25 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B002.Data.entryAt ⟨115, by decide +kernel⟩

def target25 : Weights.Entry :=
  { word := [10, 8, 9, 8, 1, 12, 8], weights := [0, 0, 1, 0] }

def points25 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Target period 7, row 8114; representative 331.
def source26 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B002.Data.entryAt ⟨64, by decide +kernel⟩

def target26 : Weights.Entry :=
  { word := [10, 8, 9, 8, 9, 4, 4], weights := [1, 0, 1, 1] }

def points26 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Target period 7, row 8115; representative 155.
def source27 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B001.Data.entryAt ⟨19, by decide +kernel⟩

def target27 : Weights.Entry :=
  { word := [10, 8, 9, 8, 9, 4, 12], weights := [1, 0, 1, 1] }

def points27 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Target period 7, row 8116; representative 236.
def source28 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B001.Data.entryAt ⟨97, by decide +kernel⟩

def target28 : Weights.Entry :=
  { word := [10, 8, 9, 8, 9, 12, 4], weights := [1, 0, 1, 1] }

def points28 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Target period 7, row 8160; representative 68.
def source29 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B000.Data.entryAt ⟨65, by decide +kernel⟩

def target29 : Weights.Entry :=
  { word := [10, 8, 12, 10, 0, 8, 9], weights := [0, 1, 0, 1] }

def points29 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Target period 7, row 8166; representative 346.
def source30 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B002.Data.entryAt ⟨79, by decide +kernel⟩

def target30 : Weights.Entry :=
  { word := [10, 8, 12, 10, 8, 4, 4], weights := [2, 1, 1, 2] }

def points30 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Target period 7, row 8167; representative 160.
def source31 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B001.Data.entryAt ⟨24, by decide +kernel⟩

def target31 : Weights.Entry :=
  { word := [10, 8, 12, 10, 8, 4, 12], weights := [2, 1, 1, 2] }

def points31 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Target period 7, row 8171; representative 241.
def source32 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B001.Data.entryAt ⟨102, by decide +kernel⟩

def target32 : Weights.Entry :=
  { word := [10, 8, 12, 10, 8, 12, 4], weights := [2, 1, 1, 2] }

def points32 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Target period 7, row 8191; representative 124.
def source33 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B000.Data.entryAt ⟨118, by decide +kernel⟩

def target33 : Weights.Entry :=
  { word := [10, 10, 0, 9, 8, 1, 12], weights := [1, 1, 0, 1] }

def points33 : List (ℕ × ℕ) := [(0, 1), (1, 2), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Target period 7, row 8196; representative 128.
def source34 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B000.Data.entryAt ⟨120, by decide +kernel⟩

def target34 : Weights.Entry :=
  { word := [10, 10, 0, 9, 8, 8, 12], weights := [1, 1, 0, 1] }

def points34 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Target period 7, row 8198; representative 121.
def source35 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B000.Data.entryAt ⟨115, by decide +kernel⟩

def target35 : Weights.Entry :=
  { word := [10, 10, 0, 9, 8, 9, 12], weights := [1, 1, 0, 1] }

def points35 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Target period 7, row 8217; representative 109.
def source36 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B000.Data.entryAt ⟨104, by decide +kernel⟩

def target36 : Weights.Entry :=
  { word := [10, 10, 0, 10, 8, 8, 12], weights := [0, 1, 0, 1] }

def points36 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Target period 7, row 8231; representative 505.
def source37 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B003.Data.entryAt ⟨109, by decide +kernel⟩

def target37 : Weights.Entry :=
  { word := [10, 10, 0, 12, 10, 0, 10], weights := [1, 1, 0, 1] }

def points37 : List (ℕ × ℕ) := [(0, 1), (1, 2), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Target period 7, row 8232; representative 131.
def source38 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B000.Data.entryAt ⟨123, by decide +kernel⟩

def target38 : Weights.Entry :=
  { word := [10, 10, 0, 12, 10, 0, 12], weights := [1, 1, 0, 1] }

def points38 : List (ℕ × ℕ) := [(0, 1), (1, 2), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Target period 7, row 8254; representative 135.
def source39 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B000.Data.entryAt ⟨127, by decide +kernel⟩

def target39 : Weights.Entry :=
  { word := [10, 10, 2, 8, 9, 0, 12], weights := [1, 1, 0, 1] }

def points39 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Target period 7, row 8255; representative 211.
def source40 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B001.Data.entryAt ⟨73, by decide +kernel⟩

def target40 : Weights.Entry :=
  { word := [10, 10, 2, 8, 9, 8, 1], weights := [1, 1, 1, 1] }

def points40 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Target period 7, row 8257; representative 31.
def source41 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B000.Data.entryAt ⟨28, by decide +kernel⟩

def target41 : Weights.Entry :=
  { word := [10, 10, 2, 8, 9, 8, 9], weights := [1, 1, 1, 1] }

def points41 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Target period 7, row 8282; representative 107.
def source42 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B000.Data.entryAt ⟨102, by decide +kernel⟩

def target42 : Weights.Entry :=
  { word := [10, 10, 8, 2, 8, 8, 12], weights := [1, 0, 0, 1] }

def points42 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Target period 7, row 8300; representative 123.
def source43 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B000.Data.entryAt ⟨117, by decide +kernel⟩

def target43 : Weights.Entry :=
  { word := [10, 10, 8, 9, 8, 1, 12], weights := [1, 1, 0, 1] }

def points43 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Target period 7, row 8304; representative 7.
def source44 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B000.Data.entryAt ⟨5, by decide +kernel⟩

def target44 : Weights.Entry :=
  { word := [10, 10, 8, 9, 8, 8, 6], weights := [1, 1, 0, 1] }

def points44 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Target period 7, row 8305; representative 127.
def source45 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B000.Data.entryAt ⟨119, by decide +kernel⟩

def target45 : Weights.Entry :=
  { word := [10, 10, 8, 9, 8, 8, 12], weights := [1, 1, 0, 1] }

def points45 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Target period 7, row 8322; representative 111.
def source46 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B000.Data.entryAt ⟨106, by decide +kernel⟩

def target46 : Weights.Entry :=
  { word := [10, 10, 8, 10, 0, 8, 12], weights := [0, 1, 0, 1] }

def points46 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Target period 7, row 8329; representative 117.
def source47 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B000.Data.entryAt ⟨112, by decide +kernel⟩

def target47 : Weights.Entry :=
  { word := [10, 10, 8, 10, 8, 0, 12], weights := [0, 1, 0, 1] }

def points47 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Target period 7, row 8333; representative 185.
def source48 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B001.Data.entryAt ⟨48, by decide +kernel⟩

def target48 : Weights.Entry :=
  { word := [10, 10, 8, 10, 8, 6, 8], weights := [1, 1, 1, 1] }

def points48 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Target period 7, row 8335; representative 108.
def source49 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B000.Data.entryAt ⟨103, by decide +kernel⟩

def target49 : Weights.Entry :=
  { word := [10, 10, 8, 10, 8, 8, 12], weights := [0, 1, 0, 1] }

def points49 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Target period 7, row 8346; representative 132.
def source50 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B000.Data.entryAt ⟨124, by decide +kernel⟩

def target50 : Weights.Entry :=
  { word := [10, 10, 8, 12, 2, 0, 12], weights := [1, 1, 0, 1] }

def points50 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Target period 7, row 8354; representative 201.
def source51 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B001.Data.entryAt ⟨63, by decide +kernel⟩

def target51 : Weights.Entry :=
  { word := [10, 10, 8, 12, 4, 12, 0], weights := [1, 0, 1, 0] }

def points51 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Target period 7, row 8355; representative 187.
def source52 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B001.Data.entryAt ⟨50, by decide +kernel⟩

def target52 : Weights.Entry :=
  { word := [10, 10, 8, 12, 4, 12, 8], weights := [1, 1, 1, 1] }

def points52 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Target period 7, row 8359; representative 183.
def source53 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B001.Data.entryAt ⟨46, by decide +kernel⟩

def target53 : Weights.Entry :=
  { word := [10, 10, 8, 12, 8, 12, 2], weights := [2, 1, 2, 1] }

def points53 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Target period 7, row 8362; representative 219.
def source54 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B001.Data.entryAt ⟨80, by decide +kernel⟩

def target54 : Weights.Entry :=
  { word := [10, 10, 8, 12, 10, 0, 1], weights := [1, 1, 0, 1] }

def points54 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Target period 7, row 8366; representative 39.
def source55 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B000.Data.entryAt ⟨36, by decide +kernel⟩

def target55 : Weights.Entry :=
  { word := [10, 10, 8, 12, 10, 0, 9], weights := [1, 1, 0, 1] }

def points55 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Target period 7, row 8368; representative 130.
def source56 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B000.Data.entryAt ⟨122, by decide +kernel⟩

def target56 : Weights.Entry :=
  { word := [10, 10, 8, 12, 10, 0, 12], weights := [1, 1, 0, 1] }

def points56 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Target period 7, row 8374; representative 206.
def source57 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B001.Data.entryAt ⟨68, by decide +kernel⟩

def target57 : Weights.Entry :=
  { word := [10, 10, 8, 12, 12, 4, 0], weights := [1, 0, 1, 0] }

def points57 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Target period 7, row 8375; representative 191.
def source58 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B001.Data.entryAt ⟨53, by decide +kernel⟩

def target58 : Weights.Entry :=
  { word := [10, 10, 8, 12, 12, 4, 8], weights := [1, 1, 1, 1] }

def points58 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Target period 7, row 8376; representative 200.
def source59 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B001.Data.entryAt ⟨62, by decide +kernel⟩

def target59 : Weights.Entry :=
  { word := [10, 10, 8, 12, 12, 12, 0], weights := [1, 0, 1, 0] }

def points59 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Target period 7, row 8377; representative 186.
def source60 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B001.Data.entryAt ⟨49, by decide +kernel⟩

def target60 : Weights.Entry :=
  { word := [10, 10, 8, 12, 12, 12, 8], weights := [1, 1, 1, 1] }

def points60 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Target period 7, row 8385; representative 210.
def source61 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B001.Data.entryAt ⟨72, by decide +kernel⟩

def target61 : Weights.Entry :=
  { word := [10, 10, 10, 8, 1, 8, 1], weights := [1, 1, 1, 1] }

def points61 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Target period 7, row 8387; representative 30.
def source62 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B000.Data.entryAt ⟨27, by decide +kernel⟩

def target62 : Weights.Entry :=
  { word := [10, 10, 10, 8, 1, 8, 9], weights := [1, 1, 1, 1] }

def points62 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Target period 7, row 8391; representative 94.
def source63 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B000.Data.entryAt ⟨90, by decide +kernel⟩

def target63 : Weights.Entry :=
  { word := [10, 10, 10, 8, 8, 12, 0], weights := [1, 0, 1, 0] }

def points63 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Target period 7, row 8396; representative 33.
def source64 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B000.Data.entryAt ⟨30, by decide +kernel⟩

def target64 : Weights.Entry :=
  { word := [10, 10, 10, 8, 9, 0, 9], weights := [1, 1, 0, 1] }

def points64 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Target period 7, row 8398; representative 134.
def source65 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B000.Data.entryAt ⟨126, by decide +kernel⟩

def target65 : Weights.Entry :=
  { word := [10, 10, 10, 8, 9, 0, 12], weights := [1, 1, 0, 1] }

def points65 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Target period 7, row 8399; representative 209.
def source66 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B001.Data.entryAt ⟨71, by decide +kernel⟩

def target66 : Weights.Entry :=
  { word := [10, 10, 10, 8, 9, 8, 1], weights := [1, 1, 1, 1] }

def points66 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Target period 7, row 8416; representative 494.
def source67 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B003.Data.entryAt ⟨98, by decide +kernel⟩

def target67 : Weights.Entry :=
  { word := [12, 0, 0, 9, 12, 12, 12], weights := [1, 0, 1, 1] }

def points67 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Target period 7, row 8481; representative 504.
def source68 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B003.Data.entryAt ⟨108, by decide +kernel⟩

def target68 : Weights.Entry :=
  { word := [12, 0, 4, 10, 8, 12, 12], weights := [0, 1, 1, 1] }

def points68 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Target period 7, row 8503; representative 495.
def source69 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B003.Data.entryAt ⟨99, by decide +kernel⟩

def target69 : Weights.Entry :=
  { word := [12, 0, 8, 9, 4, 12, 12], weights := [1, 0, 1, 1] }

def points69 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Target period 7, row 8505; representative 517.
def source70 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B003.Data.entryAt ⟨121, by decide +kernel⟩

def target70 : Weights.Entry :=
  { word := [12, 0, 8, 9, 12, 4, 12], weights := [1, 0, 1, 1] }

def points70 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Target period 7, row 8507; representative 493.
def source71 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B003.Data.entryAt ⟨97, by decide +kernel⟩

def target71 : Weights.Entry :=
  { word := [12, 0, 8, 9, 12, 12, 12], weights := [1, 0, 1, 1] }

def points71 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Target period 7, row 8566; representative 505.
def source72 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B003.Data.entryAt ⟨109, by decide +kernel⟩

def target72 : Weights.Entry :=
  { word := [12, 0, 12, 10, 0, 12, 12], weights := [1, 0, 1, 1] }

def points72 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Target period 7, row 8569; representative 523.
def source73 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B003.Data.entryAt ⟨127, by decide +kernel⟩

def target73 : Weights.Entry :=
  { word := [12, 0, 12, 10, 8, 4, 12], weights := [0, 1, 1, 1] }

def points73 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Target period 7, row 8574; representative 503.
def source74 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B003.Data.entryAt ⟨107, by decide +kernel⟩

def target74 : Weights.Entry :=
  { word := [12, 0, 12, 10, 8, 12, 12], weights := [0, 1, 1, 1] }

def points74 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Target period 7, row 8680; representative 138.
def source75 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B001.Data.entryAt ⟨2, by decide +kernel⟩

def target75 : Weights.Entry :=
  { word := [12, 2, 8, 10, 8, 12, 12], weights := [1, 2, 1, 2] }

def points75 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Target period 7, row 8704; representative 500.
def source76 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B003.Data.entryAt ⟨104, by decide +kernel⟩

def target76 : Weights.Entry :=
  { word := [12, 4, 8, 8, 1, 12, 12], weights := [1, 0, 1, 1] }

def points76 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Target period 7, row 8711; representative 515.
def source77 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B003.Data.entryAt ⟨119, by decide +kernel⟩

def target77 : Weights.Entry :=
  { word := [12, 4, 8, 8, 9, 4, 12], weights := [1, 0, 1, 1] }

def points77 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Target period 7, row 8713; representative 499.
def source78 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B003.Data.entryAt ⟨103, by decide +kernel⟩

def target78 : Weights.Entry :=
  { word := [12, 4, 8, 8, 9, 12, 12], weights := [1, 0, 1, 1] }

def points78 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Target period 7, row 8720; representative 80.
def source79 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B000.Data.entryAt ⟨76, by decide +kernel⟩

def target79 : Weights.Entry :=
  { word := [12, 4, 12, 8, 8, 2, 10], weights := [0, 1, 1, 0] }

def points79 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Target period 7, row 8803; representative 491.
def source80 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B003.Data.entryAt ⟨95, by decide +kernel⟩

def target80 : Weights.Entry :=
  { word := [12, 8, 0, 12, 8, 12, 12], weights := [1, 0, 0, 1] }

def points80 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Target period 7, row 8869; representative 522.
def source81 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B003.Data.entryAt ⟨126, by decide +kernel⟩

def target81 : Weights.Entry :=
  { word := [12, 8, 4, 10, 8, 4, 12], weights := [1, 1, 1, 1] }

def points81 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Target period 7, row 8874; representative 502.
def source82 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B003.Data.entryAt ⟨106, by decide +kernel⟩

def target82 : Weights.Entry :=
  { word := [12, 8, 4, 10, 8, 12, 12], weights := [1, 1, 1, 1] }

def points82 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Target period 7, row 8971; representative 84.
def source83 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B000.Data.entryAt ⟨80, by decide +kernel⟩

def target83 : Weights.Entry :=
  { word := [12, 8, 12, 10, 0, 8, 10], weights := [0, 1, 0, 1] }

def points83 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Target period 7, row 8977; representative 521.
def source84 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B003.Data.entryAt ⟨125, by decide +kernel⟩

def target84 : Weights.Entry :=
  { word := [12, 8, 12, 10, 8, 4, 12], weights := [1, 1, 1, 1] }

def points84 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Target period 7, row 8982; representative 501.
def source85 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B003.Data.entryAt ⟨105, by decide +kernel⟩

def target85 : Weights.Entry :=
  { word := [12, 8, 12, 10, 8, 12, 12], weights := [1, 1, 1, 1] }

def points85 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Target period 7, row 8990; representative 124.
def source86 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B000.Data.entryAt ⟨118, by decide +kernel⟩

def target86 : Weights.Entry :=
  { word := [12, 10, 0, 9, 8, 1, 12], weights := [1, 1, 0, 1] }

def points86 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Target period 7, row 8995; representative 129.
def source87 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B000.Data.entryAt ⟨121, by decide +kernel⟩

def target87 : Weights.Entry :=
  { word := [12, 10, 0, 9, 8, 8, 12], weights := [1, 1, 0, 1] }

def points87 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Target period 7, row 8997; representative 122.
def source88 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B000.Data.entryAt ⟨116, by decide +kernel⟩

def target88 : Weights.Entry :=
  { word := [12, 10, 0, 9, 8, 9, 12], weights := [1, 1, 0, 1] }

def points88 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Target period 7, row 8998; representative 217.
def source89 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B001.Data.entryAt ⟨78, by decide +kernel⟩

def target89 : Weights.Entry :=
  { word := [12, 10, 0, 9, 8, 10, 2], weights := [1, 1, 0, 1] }

def points89 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Target period 7, row 9003; representative 115.
def source90 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B000.Data.entryAt ⟨110, by decide +kernel⟩

def target90 : Weights.Entry :=
  { word := [12, 10, 0, 10, 8, 8, 12], weights := [0, 1, 0, 1] }

def points90 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Target period 7, row 9016; representative 505.
def source91 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B003.Data.entryAt ⟨109, by decide +kernel⟩

def target91 : Weights.Entry :=
  { word := [12, 10, 0, 12, 10, 0, 9], weights := [1, 1, 0, 1] }

def points91 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Target period 7, row 9018; representative 131.
def source92 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B000.Data.entryAt ⟨123, by decide +kernel⟩

def target92 : Weights.Entry :=
  { word := [12, 10, 0, 12, 10, 0, 12], weights := [1, 1, 0, 1] }

def points92 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Target period 7, row 9023; representative 113.
def source93 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B000.Data.entryAt ⟨108, by decide +kernel⟩

def target93 : Weights.Entry :=
  { word := [12, 10, 8, 2, 8, 8, 12], weights := [0, 1, 0, 1] }

def points93 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Target period 7, row 9041; representative 114.
def source94 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B000.Data.entryAt ⟨109, by decide +kernel⟩

def target94 : Weights.Entry :=
  { word := [12, 10, 8, 10, 8, 8, 12], weights := [0, 1, 0, 1] }

def points94 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Target period 7, row 9055; representative 77.
def source95 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B000.Data.entryAt ⟨73, by decide +kernel⟩

def target95 : Weights.Entry :=
  { word := [12, 12, 4, 8, 8, 2, 10], weights := [0, 1, 1, 0] }

def points95 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Target period 7, row 9064; representative 514.
def source96 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B003.Data.entryAt ⟨118, by decide +kernel⟩

def target96 : Weights.Entry :=
  { word := [12, 12, 8, 8, 1, 4, 12], weights := [1, 0, 1, 1] }

def points96 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Target period 7, row 9065; representative 263.
def source97 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B001.Data.entryAt ⟨124, by decide +kernel⟩

def target97 : Weights.Entry :=
  { word := [12, 12, 8, 8, 1, 12, 2], weights := [1, 0, 1, 1] }

def points97 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Target period 7, row 9068; representative 37.
def source98 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B000.Data.entryAt ⟨34, by decide +kernel⟩

def target98 : Weights.Entry :=
  { word := [12, 12, 8, 8, 1, 12, 10], weights := [1, 0, 1, 1] }

def points98 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Target period 7, row 9069; representative 498.
def source99 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B003.Data.entryAt ⟨102, by decide +kernel⟩

def target99 : Weights.Entry :=
  { word := [12, 12, 8, 8, 1, 12, 12], weights := [1, 0, 1, 1] }

def points99 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Target period 7, row 9071; representative 79.
def source100 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B000.Data.entryAt ⟨75, by decide +kernel⟩

def target100 : Weights.Entry :=
  { word := [12, 12, 8, 8, 2, 2, 10], weights := [0, 1, 1, 0] }

def points100 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Target period 7, row 9073; representative 75.
def source101 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B000.Data.entryAt ⟨71, by decide +kernel⟩

def target101 : Weights.Entry :=
  { word := [12, 12, 8, 8, 2, 10, 10], weights := [0, 1, 1, 0] }

def points101 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Target period 7, row 9076; representative 513.
def source102 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B003.Data.entryAt ⟨117, by decide +kernel⟩

def target102 : Weights.Entry :=
  { word := [12, 12, 8, 8, 9, 4, 12], weights := [1, 0, 1, 1] }

def points102 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Target period 7, row 9078; representative 497.
def source103 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B003.Data.entryAt ⟨101, by decide +kernel⟩

def target103 : Weights.Entry :=
  { word := [12, 12, 8, 8, 9, 12, 12], weights := [1, 0, 1, 1] }

def points103 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Target period 7, row 9080; representative 78.
def source104 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B000.Data.entryAt ⟨74, by decide +kernel⟩

def target104 : Weights.Entry :=
  { word := [12, 12, 8, 8, 10, 2, 10], weights := [0, 1, 1, 0] }

def points104 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Target period 7, row 9081; representative 428.
def source105 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B003.Data.entryAt ⟨33, by decide +kernel⟩

def target105 : Weights.Entry :=
  { word := [12, 12, 8, 8, 10, 10, 2], weights := [0, 1, 1, 0] }

def points105 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Target period 7, row 9085; representative 76.
def source106 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B000.Data.entryAt ⟨72, by decide +kernel⟩

def target106 : Weights.Entry :=
  { word := [12, 12, 12, 8, 8, 2, 10], weights := [0, 1, 1, 0] }

def points106 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Target period 7, row 9086; representative 426.
def source107 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B003.Data.entryAt ⟨31, by decide +kernel⟩

def target107 : Weights.Entry :=
  { word := [12, 12, 12, 8, 8, 10, 2], weights := [0, 1, 1, 0] }

def points107 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Target period 8, row 507; representative 2.
def source108 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B000.Data.entryAt ⟨0, by decide +kernel⟩

def target108 : Weights.Entry :=
  { word := [0, 4, 0, 4, 2, 0, 2], weights := [0, 0, 1, 0] }

def points108 : List (ℕ × ℕ) := [(0, 7), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Target period 8, row 2388; representative 345.
def source109 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B002.Data.entryAt ⟨78, by decide +kernel⟩

def target109 : Weights.Entry :=
  { word := [2, 0, 0, 9, 4, 4, 12], weights := [1, 0, 1, 1] }

def points109 : List (ℕ × ℕ) := [(0, 7), (1, 0), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Target period 8, row 2390; representative 216.
def source110 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B001.Data.entryAt ⟨77, by decide +kernel⟩

def target110 : Weights.Entry :=
  { word := [2, 0, 0, 9, 4, 12, 12], weights := [1, 0, 1, 1] }

def points110 : List (ℕ × ℕ) := [(0, 7), (1, 0), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Target period 8, row 2392; representative 343.
def source111 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B002.Data.entryAt ⟨76, by decide +kernel⟩

def target111 : Weights.Entry :=
  { word := [2, 0, 0, 9, 12, 4, 12], weights := [1, 0, 1, 1] }

def points111 : List (ℕ × ℕ) := [(0, 7), (1, 0), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Target period 8, row 2394; representative 214.
def source112 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B001.Data.entryAt ⟨75, by decide +kernel⟩

def target112 : Weights.Entry :=
  { word := [2, 0, 0, 9, 12, 12, 12], weights := [1, 0, 1, 1] }

def points112 : List (ℕ × ℕ) := [(0, 7), (1, 0), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Target period 8, row 2401; representative 302.
def source113 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B002.Data.entryAt ⟨35, by decide +kernel⟩

def target113 : Weights.Entry :=
  { word := [2, 0, 0, 12, 0, 4, 12], weights := [1, 0, 1, 0] }

def points113 : List (ℕ × ℕ) := [(0, 7), (1, 0), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Target period 8, row 3417; representative 2.
def source114 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B000.Data.entryAt ⟨0, by decide +kernel⟩

def target114 : Weights.Entry :=
  { word := [4, 0, 4, 2, 0, 2, 0], weights := [0, 0, 0, 1] }

def points114 : List (ℕ × ℕ) := [(0, 0), (2, 2), (3, 4), (4, 5), (5, 6), (6, 3)]

-- Target period 8, row 7616; representative 302.
def source115 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B002.Data.entryAt ⟨35, by decide +kernel⟩

def target115 : Weights.Entry :=
  { word := [10, 2, 0, 10, 0, 0, 4], weights := [0, 1, 0, 1] }

def points115 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Target period 8, row 7644; representative 345.
def source116 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B002.Data.entryAt ⟨78, by decide +kernel⟩

def target116 : Weights.Entry :=
  { word := [10, 2, 2, 8, 1, 0, 4], weights := [1, 1, 0, 1] }

def points116 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Target period 8, row 7784; representative 343.
def source117 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B002.Data.entryAt ⟨76, by decide +kernel⟩

def target117 : Weights.Entry :=
  { word := [10, 2, 10, 8, 1, 0, 4], weights := [1, 1, 0, 1] }

def points117 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Target period 8, row 8236; representative 216.
def source118 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B001.Data.entryAt ⟨77, by decide +kernel⟩

def target118 : Weights.Entry :=
  { word := [10, 10, 2, 8, 1, 0, 4], weights := [1, 1, 0, 1] }

def points118 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Target period 8, row 8380; representative 214.
def source119 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B001.Data.entryAt ⟨75, by decide +kernel⟩

def target119 : Weights.Entry :=
  { word := [10, 10, 10, 8, 1, 0, 4], weights := [1, 1, 0, 1] }

def points119 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Target period 9, row 8117; representative 6790.
def source120 : Weights.Entry :=
  { word := [10, 10, 8, 9, 8, 9, 12], weights := [1, 1, 0, 1] }

def target120 : Weights.Entry :=
  { word := [10, 8, 9, 8, 9, 12, 12], weights := [1, 0, 1, 1] }

def points120 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Target period 9, row 8351; representative 6784.
def source121 : Weights.Entry :=
  { word := [10, 8, 4, 10, 8, 12, 12], weights := [2, 2, 1, 3] }

def target121 : Weights.Entry :=
  { word := [10, 10, 8, 12, 2, 8, 12], weights := [3, 1, 2, 2] }

def points121 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Target period 9, row 8360; representative 6887.
def source122 : Weights.Entry :=
  { word := [8, 10, 8, 10, 8, 12, 12], weights := [0, 3, 0, 1] }

def target122 : Weights.Entry :=
  { word := [10, 10, 8, 12, 8, 12, 8], weights := [1, 0, 3, 0] }

def points122 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Target period 9, row 8373; representative 6783.
def source123 : Weights.Entry :=
  { word := [10, 8, 12, 10, 8, 12, 12], weights := [2, 1, 1, 2] }

def target123 : Weights.Entry :=
  { word := [10, 10, 8, 12, 10, 8, 12], weights := [2, 1, 1, 2] }

def points123 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Target period 9, row 8392; representative 6908.
def source124 : Weights.Entry :=
  { word := [0, 1, 8, 9, 12, 12, 12], weights := [1, 0, 1, 1] }

def target124 : Weights.Entry :=
  { word := [10, 10, 10, 8, 9, 0, 1], weights := [1, 1, 0, 1] }

def points124 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Target period 9, row 8401; representative 6838.
def source125 : Weights.Entry :=
  { word := [8, 9, 8, 9, 12, 12, 12], weights := [1, 1, 1, 1] }

def target125 : Weights.Entry :=
  { word := [10, 10, 10, 8, 9, 8, 9], weights := [1, 1, 1, 1] }

def points125 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Target period 9, row 9045; representative 6757.
def source126 : Weights.Entry :=
  { word := [10, 10, 8, 12, 8, 12, 10], weights := [2, 1, 2, 1] }

def target126 : Weights.Entry :=
  { word := [12, 10, 8, 10, 8, 12, 12], weights := [1, 2, 1, 2] }

def points126 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Target period 9, row 9082; representative 7205.
def source127 : Weights.Entry :=
  { word := [12, 12, 12, 8, 8, 10, 10], weights := [0, 1, 1, 0] }

def target127 : Weights.Entry :=
  { word := [12, 12, 8, 8, 10, 10, 10], weights := [0, 1, 1, 0] }

def points127 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

def period7Rows : List ℕ := [4594, 5918, 6025, 6029, 7498, 7533, 7536, 7584, 7591, 7778, 7803, 7805, 7961, 8028, 8041, 8072, 8081, 8082, 8083, 8090, 8099, 8100, 8101, 8109, 8110, 8111, 8114, 8115, 8116, 8160, 8166, 8167, 8171, 8191, 8196, 8198, 8217, 8231, 8232, 8254, 8255, 8257, 8282, 8300, 8304, 8305, 8322, 8329, 8333, 8335, 8346, 8354, 8355, 8359, 8362, 8366, 8368, 8374, 8375, 8376, 8377, 8385, 8387, 8391, 8396, 8398, 8399, 8416, 8481, 8503, 8505, 8507, 8566, 8569, 8574, 8680, 8704, 8711, 8713, 8720, 8803, 8869, 8874, 8971, 8977, 8982, 8990, 8995, 8997, 8998, 9003, 9016, 9018, 9023, 9041, 9055, 9064, 9065, 9068, 9069, 9071, 9073, 9076, 9078, 9080, 9081, 9085, 9086]

def period7Entries : List Weights.Entry := [target0, target1, target2, target3, target4, target5, target6, target7, target8, target9, target10, target11, target12, target13, target14, target15, target16, target17, target18, target19, target20, target21, target22, target23, target24, target25, target26, target27, target28, target29, target30, target31, target32, target33, target34, target35, target36, target37, target38, target39, target40, target41, target42, target43, target44, target45, target46, target47, target48, target49, target50, target51, target52, target53, target54, target55, target56, target57, target58, target59, target60, target61, target62, target63, target64, target65, target66, target67, target68, target69, target70, target71, target72, target73, target74, target75, target76, target77, target78, target79, target80, target81, target82, target83, target84, target85, target86, target87, target88, target89, target90, target91, target92, target93, target94, target95, target96, target97, target98, target99, target100, target101, target102, target103, target104, target105, target106, target107]

theorem period7Entries_length : period7Entries.length = 108 := by decide +kernel

theorem period7Rows_nodup : period7Rows.Nodup := by decide +kernel

theorem period7Rows_length : period7Rows.length = period7Entries.length := by decide +kernel

def period8Rows : List ℕ := [507, 2388, 2390, 2392, 2394, 2401, 3417, 7616, 7644, 7784, 8236, 8380]

def period8Entries : List Weights.Entry := [target108, target109, target110, target111, target112, target113, target114, target115, target116, target117, target118, target119]

theorem period8Entries_length : period8Entries.length = 12 := by decide +kernel

theorem period8Rows_nodup : period8Rows.Nodup := by decide +kernel

theorem period8Rows_length : period8Rows.length = period8Entries.length := by decide +kernel

def period9Rows : List ℕ := [8117, 8351, 8360, 8373, 8392, 8401, 9045, 9082]

def period9Entries : List Weights.Entry := [target120, target121, target122, target123, target124, target125, target126, target127]

theorem period9Entries_length : period9Entries.length = 8 := by decide +kernel

theorem period9Rows_nodup : period9Rows.Nodup := by decide +kernel

theorem period9Rows_length : period9Rows.length = period9Entries.length := by decide +kernel

theorem total_entries_length :
    period7Entries.length + period8Entries.length + period9Entries.length = 128 := by
  decide +kernel

end FranklSmallCyclic.OrbitTransportPilot.Data
