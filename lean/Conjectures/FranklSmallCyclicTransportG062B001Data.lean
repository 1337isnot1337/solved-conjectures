module

public import Conjectures.FranklSmallCyclicRowCoverage
public import Conjectures.FranklSmallCyclicCanonicalWords
public import Conjectures.FranklSmallCyclicOrbit9Block009Data

/-! 128 literal targets sharing one source proof block.
Original words and row indices are retained; weights may be transported.
-/
@[expose] public section

namespace FranklSmallCyclic.TransportBatches.G062.B001.Data

-- Period 9, original row 2378, representative 7982.
def source0 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨79, by decide +kernel⟩

def target0 : Weights.Entry :=
  { word := [1, 12, 12, 4, 8, 8, 9], weights := [1, 0, 1, 0] }

def points0 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 4127, representative 7950.
def source1 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨47, by decide +kernel⟩

def target1 : Weights.Entry :=
  { word := [8, 0, 1, 4, 2, 0, 9], weights := [1, 0, 1, 0] }

-- Period 9, original row 4149, representative 7951.
def source2 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨48, by decide +kernel⟩

def target2 : Weights.Entry :=
  { word := [8, 0, 1, 4, 10, 0, 9], weights := [1, 0, 1, 0] }

-- Period 9, original row 4163, representative 7957.
def source3 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨54, by decide +kernel⟩

def target3 : Weights.Entry :=
  { word := [8, 0, 1, 12, 2, 0, 9], weights := [1, 0, 1, 0] }

-- Period 9, original row 4185, representative 7954.
def source4 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨51, by decide +kernel⟩

def target4 : Weights.Entry :=
  { word := [8, 0, 1, 12, 10, 0, 9], weights := [1, 0, 1, 0] }

-- Period 9, original row 4199, representative 7950.
def source5 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨47, by decide +kernel⟩

def target5 : Weights.Entry :=
  { word := [8, 0, 2, 2, 2, 0, 9], weights := [1, 1, 0, 0] }

def points5 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 5), (5, 4), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 4214, representative 7951.
def source6 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨48, by decide +kernel⟩

def target6 : Weights.Entry :=
  { word := [8, 0, 2, 2, 10, 0, 9], weights := [1, 1, 0, 0] }

def points6 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 5), (5, 4), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 4229, representative 7957.
def source7 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨54, by decide +kernel⟩

def target7 : Weights.Entry :=
  { word := [8, 0, 2, 10, 2, 0, 9], weights := [1, 1, 0, 0] }

def points7 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 5), (5, 4), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 4243, representative 7954.
def source8 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨51, by decide +kernel⟩

def target8 : Weights.Entry :=
  { word := [8, 0, 2, 10, 10, 0, 9], weights := [1, 1, 0, 0] }

def points8 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 5), (5, 4), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 4262, representative 7924.
def source9 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨21, by decide +kernel⟩

def target9 : Weights.Entry :=
  { word := [8, 0, 4, 2, 0, 8, 9], weights := [1, 0, 0, 1] }

-- Period 9, original row 4294, representative 7927.
def source10 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨24, by decide +kernel⟩

def target10 : Weights.Entry :=
  { word := [8, 0, 4, 10, 0, 8, 9], weights := [1, 0, 0, 1] }

-- Period 9, original row 4335, representative 7903.
def source11 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨0, by decide +kernel⟩

def target11 : Weights.Entry :=
  { word := [8, 0, 6, 10, 0, 8, 9], weights := [1, 0, 0, 1] }

-- Period 9, original row 4435, representative 7925.
def source12 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨22, by decide +kernel⟩

def target12 : Weights.Entry :=
  { word := [8, 0, 12, 2, 0, 8, 9], weights := [1, 0, 0, 1] }

-- Period 9, original row 4470, representative 7926.
def source13 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨23, by decide +kernel⟩

def target13 : Weights.Entry :=
  { word := [8, 0, 12, 10, 0, 8, 9], weights := [1, 0, 0, 1] }

-- Period 9, original row 4494, representative 7958.
def source14 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨55, by decide +kernel⟩

def target14 : Weights.Entry :=
  { word := [8, 1, 0, 2, 2, 2, 8], weights := [1, 0, 0, 1] }

-- Period 9, original row 4496, representative 7938.
def source15 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨35, by decide +kernel⟩

def target15 : Weights.Entry :=
  { word := [8, 1, 0, 2, 2, 10, 8], weights := [1, 0, 0, 1] }

-- Period 9, original row 4505, representative 7963.
def source16 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨60, by decide +kernel⟩

def target16 : Weights.Entry :=
  { word := [8, 1, 0, 10, 2, 2, 8], weights := [1, 0, 0, 1] }

-- Period 9, original row 4506, representative 7943.
def source17 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨40, by decide +kernel⟩

def target17 : Weights.Entry :=
  { word := [8, 1, 0, 10, 2, 10, 8], weights := [1, 0, 0, 1] }

-- Period 9, original row 4516, representative 7950.
def source18 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨47, by decide +kernel⟩

def target18 : Weights.Entry :=
  { word := [8, 1, 4, 2, 0, 1, 8], weights := [0, 1, 0, 1] }

def points18 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 4518, representative 7950.
def source19 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨47, by decide +kernel⟩

def target19 : Weights.Entry :=
  { word := [8, 1, 4, 2, 0, 2, 8], weights := [0, 1, 0, 1] }

def points19 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 4523, representative 7964.
def source20 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨61, by decide +kernel⟩

def target20 : Weights.Entry :=
  { word := [8, 1, 4, 2, 0, 8, 8], weights := [1, 0, 0, 1] }

-- Period 9, original row 4528, representative 7930.
def source21 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨27, by decide +kernel⟩

def target21 : Weights.Entry :=
  { word := [8, 1, 4, 2, 0, 9, 8], weights := [1, 0, 0, 1] }

-- Period 9, original row 4530, representative 7930.
def source22 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨27, by decide +kernel⟩

def target22 : Weights.Entry :=
  { word := [8, 1, 4, 2, 0, 10, 8], weights := [1, 0, 0, 1] }

def points22 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 8), (8, 7)]

-- Period 9, original row 4532, representative 7955.
def source23 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨52, by decide +kernel⟩

def target23 : Weights.Entry :=
  { word := [8, 1, 4, 2, 8, 2, 8], weights := [1, 0, 0, 1] }

-- Period 9, original row 4536, representative 7935.
def source24 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨32, by decide +kernel⟩

def target24 : Weights.Entry :=
  { word := [8, 1, 4, 2, 8, 10, 8], weights := [1, 0, 0, 1] }

-- Period 9, original row 4538, representative 7950.
def source25 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨47, by decide +kernel⟩

def target25 : Weights.Entry :=
  { word := [8, 1, 4, 4, 4, 0, 8], weights := [0, 0, 1, 1] }

def points25 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 4), (5, 5), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 4540, representative 7946.
def source26 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨43, by decide +kernel⟩

def target26 : Weights.Entry :=
  { word := [8, 1, 4, 4, 4, 8, 8], weights := [0, 0, 1, 0] }

-- Period 9, original row 4542, representative 7945.
def source27 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨42, by decide +kernel⟩

def target27 : Weights.Entry :=
  { word := [8, 1, 4, 8, 4, 2, 8], weights := [0, 1, 1, 0] }

-- Period 9, original row 4544, representative 7929.
def source28 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨26, by decide +kernel⟩

def target28 : Weights.Entry :=
  { word := [8, 1, 4, 8, 4, 10, 8], weights := [0, 1, 1, 0] }

-- Period 9, original row 4545, representative 7957.
def source29 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨54, by decide +kernel⟩

def target29 : Weights.Entry :=
  { word := [8, 1, 4, 10, 0, 1, 8], weights := [0, 1, 0, 1] }

def points29 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 4546, representative 7957.
def source30 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨54, by decide +kernel⟩

def target30 : Weights.Entry :=
  { word := [8, 1, 4, 10, 0, 2, 8], weights := [0, 1, 0, 1] }

def points30 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 4551, representative 7967.
def source31 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨64, by decide +kernel⟩

def target31 : Weights.Entry :=
  { word := [8, 1, 4, 10, 0, 8, 8], weights := [1, 0, 0, 1] }

-- Period 9, original row 4555, representative 7937.
def source32 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨34, by decide +kernel⟩

def target32 : Weights.Entry :=
  { word := [8, 1, 4, 10, 0, 9, 8], weights := [1, 0, 0, 1] }

-- Period 9, original row 4556, representative 7937.
def source33 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨34, by decide +kernel⟩

def target33 : Weights.Entry :=
  { word := [8, 1, 4, 10, 0, 10, 8], weights := [1, 0, 0, 1] }

def points33 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 8), (8, 7)]

-- Period 9, original row 4562, representative 7956.
def source34 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨53, by decide +kernel⟩

def target34 : Weights.Entry :=
  { word := [8, 1, 4, 10, 8, 2, 8], weights := [0, 1, 1, 0] }

-- Period 9, original row 4567, representative 7936.
def source35 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨33, by decide +kernel⟩

def target35 : Weights.Entry :=
  { word := [8, 1, 4, 10, 8, 10, 8], weights := [0, 1, 1, 0] }

-- Period 9, original row 4570, representative 7957.
def source36 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨54, by decide +kernel⟩

def target36 : Weights.Entry :=
  { word := [8, 1, 4, 12, 4, 0, 8], weights := [0, 0, 1, 1] }

def points36 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 4), (5, 5), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 4572, representative 7949.
def source37 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨46, by decide +kernel⟩

def target37 : Weights.Entry :=
  { word := [8, 1, 4, 12, 4, 8, 8], weights := [0, 0, 1, 0] }

-- Period 9, original row 4576, representative 7959.
def source38 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨56, by decide +kernel⟩

def target38 : Weights.Entry :=
  { word := [8, 1, 8, 2, 2, 2, 8], weights := [1, 0, 0, 1] }

-- Period 9, original row 4578, representative 7939.
def source39 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨36, by decide +kernel⟩

def target39 : Weights.Entry :=
  { word := [8, 1, 8, 2, 2, 10, 8], weights := [1, 0, 0, 1] }

-- Period 9, original row 4580, representative 7960.
def source40 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨57, by decide +kernel⟩

def target40 : Weights.Entry :=
  { word := [8, 1, 8, 2, 10, 2, 8], weights := [1, 0, 0, 1] }

-- Period 9, original row 4582, representative 7940.
def source41 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨37, by decide +kernel⟩

def target41 : Weights.Entry :=
  { word := [8, 1, 8, 2, 10, 10, 8], weights := [1, 0, 0, 1] }

-- Period 9, original row 4596, representative 7962.
def source42 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨59, by decide +kernel⟩

def target42 : Weights.Entry :=
  { word := [8, 1, 8, 10, 2, 2, 8], weights := [0, 1, 1, 0] }

-- Period 9, original row 4597, representative 7942.
def source43 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨39, by decide +kernel⟩

def target43 : Weights.Entry :=
  { word := [8, 1, 8, 10, 2, 10, 8], weights := [0, 1, 1, 0] }

-- Period 9, original row 4598, representative 7961.
def source44 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨58, by decide +kernel⟩

def target44 : Weights.Entry :=
  { word := [8, 1, 8, 10, 10, 2, 8], weights := [0, 1, 1, 0] }

-- Period 9, original row 4599, representative 7941.
def source45 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨38, by decide +kernel⟩

def target45 : Weights.Entry :=
  { word := [8, 1, 8, 10, 10, 10, 8], weights := [0, 1, 1, 0] }

-- Period 9, original row 4605, representative 7951.
def source46 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨48, by decide +kernel⟩

def target46 : Weights.Entry :=
  { word := [8, 1, 12, 2, 0, 1, 8], weights := [0, 1, 0, 1] }

def points46 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 4607, representative 7951.
def source47 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨48, by decide +kernel⟩

def target47 : Weights.Entry :=
  { word := [8, 1, 12, 2, 0, 2, 8], weights := [0, 1, 0, 1] }

def points47 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 4612, representative 7965.
def source48 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨62, by decide +kernel⟩

def target48 : Weights.Entry :=
  { word := [8, 1, 12, 2, 0, 8, 8], weights := [1, 0, 0, 1] }

-- Period 9, original row 4617, representative 7931.
def source49 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨28, by decide +kernel⟩

def target49 : Weights.Entry :=
  { word := [8, 1, 12, 2, 0, 9, 8], weights := [1, 0, 0, 1] }

-- Period 9, original row 4619, representative 7931.
def source50 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨28, by decide +kernel⟩

def target50 : Weights.Entry :=
  { word := [8, 1, 12, 2, 0, 10, 8], weights := [1, 0, 0, 1] }

def points50 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 8), (8, 7)]

-- Period 9, original row 4621, representative 7952.
def source51 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨49, by decide +kernel⟩

def target51 : Weights.Entry :=
  { word := [8, 1, 12, 2, 8, 2, 8], weights := [1, 0, 0, 1] }

-- Period 9, original row 4625, representative 7932.
def source52 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨29, by decide +kernel⟩

def target52 : Weights.Entry :=
  { word := [8, 1, 12, 2, 8, 10, 8], weights := [1, 0, 0, 1] }

-- Period 9, original row 4627, representative 7951.
def source53 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨48, by decide +kernel⟩

def target53 : Weights.Entry :=
  { word := [8, 1, 12, 4, 4, 0, 8], weights := [0, 0, 1, 1] }

def points53 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 4), (5, 5), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 4629, representative 7947.
def source54 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨44, by decide +kernel⟩

def target54 : Weights.Entry :=
  { word := [8, 1, 12, 4, 4, 8, 8], weights := [0, 0, 1, 0] }

-- Period 9, original row 4631, representative 7944.
def source55 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨41, by decide +kernel⟩

def target55 : Weights.Entry :=
  { word := [8, 1, 12, 8, 4, 2, 8], weights := [0, 1, 1, 0] }

-- Period 9, original row 4633, representative 7928.
def source56 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨25, by decide +kernel⟩

def target56 : Weights.Entry :=
  { word := [8, 1, 12, 8, 4, 10, 8], weights := [0, 1, 1, 0] }

-- Period 9, original row 4634, representative 7954.
def source57 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨51, by decide +kernel⟩

def target57 : Weights.Entry :=
  { word := [8, 1, 12, 10, 0, 1, 8], weights := [0, 1, 0, 1] }

def points57 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 4635, representative 7954.
def source58 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨51, by decide +kernel⟩

def target58 : Weights.Entry :=
  { word := [8, 1, 12, 10, 0, 2, 8], weights := [0, 1, 0, 1] }

def points58 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 4644, representative 7966.
def source59 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨63, by decide +kernel⟩

def target59 : Weights.Entry :=
  { word := [8, 1, 12, 10, 0, 8, 8], weights := [1, 0, 0, 1] }

-- Period 9, original row 4648, representative 7934.
def source60 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨31, by decide +kernel⟩

def target60 : Weights.Entry :=
  { word := [8, 1, 12, 10, 0, 9, 8], weights := [1, 0, 0, 1] }

-- Period 9, original row 4649, representative 7934.
def source61 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨31, by decide +kernel⟩

def target61 : Weights.Entry :=
  { word := [8, 1, 12, 10, 0, 10, 8], weights := [1, 0, 0, 1] }

def points61 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 8), (8, 7)]

-- Period 9, original row 4655, representative 7953.
def source62 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨50, by decide +kernel⟩

def target62 : Weights.Entry :=
  { word := [8, 1, 12, 10, 8, 2, 8], weights := [0, 1, 1, 0] }

-- Period 9, original row 4660, representative 7933.
def source63 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨30, by decide +kernel⟩

def target63 : Weights.Entry :=
  { word := [8, 1, 12, 10, 8, 10, 8], weights := [0, 1, 1, 0] }

-- Period 9, original row 4663, representative 7954.
def source64 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨51, by decide +kernel⟩

def target64 : Weights.Entry :=
  { word := [8, 1, 12, 12, 4, 0, 8], weights := [0, 0, 1, 1] }

def points64 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 4), (5, 5), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 4665, representative 7948.
def source65 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨45, by decide +kernel⟩

def target65 : Weights.Entry :=
  { word := [8, 1, 12, 12, 4, 8, 8], weights := [0, 0, 1, 0] }

-- Period 9, original row 5006, representative 7950.
def source66 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨47, by decide +kernel⟩

def target66 : Weights.Entry :=
  { word := [8, 4, 0, 4, 2, 0, 9], weights := [1, 0, 1, 0] }

def points66 : List (ℕ × ℕ) := [(0, 0), (1, 2), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 5028, representative 7951.
def source67 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨48, by decide +kernel⟩

def target67 : Weights.Entry :=
  { word := [8, 4, 0, 4, 10, 0, 9], weights := [1, 0, 1, 0] }

def points67 : List (ℕ × ℕ) := [(0, 0), (1, 2), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 5042, representative 7957.
def source68 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨54, by decide +kernel⟩

def target68 : Weights.Entry :=
  { word := [8, 4, 0, 12, 2, 0, 9], weights := [1, 0, 1, 0] }

def points68 : List (ℕ × ℕ) := [(0, 0), (1, 2), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 5064, representative 7954.
def source69 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨51, by decide +kernel⟩

def target69 : Weights.Entry :=
  { word := [8, 4, 0, 12, 10, 0, 9], weights := [1, 0, 1, 0] }

def points69 : List (ℕ × ℕ) := [(0, 0), (1, 2), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 5083, representative 7945.
def source70 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨42, by decide +kernel⟩

def target70 : Weights.Entry :=
  { word := [8, 4, 2, 8, 2, 0, 9], weights := [0, 1, 1, 0] }

def points70 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 4), (5, 5), (6, 3), (7, 1), (8, 2)]

-- Period 9, original row 5091, representative 7944.
def source71 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨41, by decide +kernel⟩

def target71 : Weights.Entry :=
  { word := [8, 4, 2, 8, 10, 0, 9], weights := [0, 1, 1, 0] }

def points71 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 4), (5, 5), (6, 3), (7, 1), (8, 2)]

-- Period 9, original row 5100, representative 7958.
def source72 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨55, by decide +kernel⟩

def target72 : Weights.Entry :=
  { word := [8, 4, 4, 4, 0, 0, 9], weights := [1, 0, 0, 1] }

def points72 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 5107, representative 7912.
def source73 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨9, by decide +kernel⟩

def target73 : Weights.Entry :=
  { word := [8, 4, 4, 4, 0, 8, 9], weights := [1, 0, 0, 1] }

-- Period 9, original row 5114, representative 7959.
def source74 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨56, by decide +kernel⟩

def target74 : Weights.Entry :=
  { word := [8, 4, 4, 4, 8, 0, 9], weights := [1, 0, 0, 1] }

def points74 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 5121, representative 7913.
def source75 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨10, by decide +kernel⟩

def target75 : Weights.Entry :=
  { word := [8, 4, 4, 4, 8, 8, 9], weights := [1, 0, 1, 0] }

-- Period 9, original row 5128, representative 7963.
def source76 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨60, by decide +kernel⟩

def target76 : Weights.Entry :=
  { word := [8, 4, 4, 12, 0, 0, 9], weights := [1, 0, 0, 1] }

def points76 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 5135, representative 7919.
def source77 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨16, by decide +kernel⟩

def target77 : Weights.Entry :=
  { word := [8, 4, 4, 12, 0, 8, 9], weights := [1, 0, 1, 0] }

-- Period 9, original row 5142, representative 7962.
def source78 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨59, by decide +kernel⟩

def target78 : Weights.Entry :=
  { word := [8, 4, 4, 12, 8, 0, 9], weights := [0, 1, 1, 0] }

def points78 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 5149, representative 7916.
def source79 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨13, by decide +kernel⟩

def target79 : Weights.Entry :=
  { word := [8, 4, 4, 12, 8, 8, 9], weights := [1, 0, 1, 0] }

-- Period 9, original row 5161, representative 7955.
def source80 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨52, by decide +kernel⟩

def target80 : Weights.Entry :=
  { word := [8, 4, 8, 4, 2, 0, 9], weights := [1, 0, 0, 1] }

def points80 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 5187, representative 7952.
def source81 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨49, by decide +kernel⟩

def target81 : Weights.Entry :=
  { word := [8, 4, 8, 4, 10, 0, 9], weights := [1, 0, 0, 1] }

def points81 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 5203, representative 7956.
def source82 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨53, by decide +kernel⟩

def target82 : Weights.Entry :=
  { word := [8, 4, 8, 12, 2, 0, 9], weights := [0, 1, 1, 0] }

def points82 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 5229, representative 7953.
def source83 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨50, by decide +kernel⟩

def target83 : Weights.Entry :=
  { word := [8, 4, 8, 12, 10, 0, 9], weights := [0, 1, 1, 0] }

def points83 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 5257, representative 7917.
def source84 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨14, by decide +kernel⟩

def target84 : Weights.Entry :=
  { word := [8, 4, 12, 4, 0, 8, 9], weights := [1, 0, 0, 1] }

-- Period 9, original row 5264, representative 7960.
def source85 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨57, by decide +kernel⟩

def target85 : Weights.Entry :=
  { word := [8, 4, 12, 4, 8, 0, 9], weights := [1, 0, 0, 1] }

def points85 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 5271, representative 7914.
def source86 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨11, by decide +kernel⟩

def target86 : Weights.Entry :=
  { word := [8, 4, 12, 4, 8, 8, 9], weights := [1, 0, 1, 0] }

-- Period 9, original row 5278, representative 7918.
def source87 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨15, by decide +kernel⟩

def target87 : Weights.Entry :=
  { word := [8, 4, 12, 12, 0, 8, 9], weights := [1, 0, 1, 0] }

-- Period 9, original row 5285, representative 7961.
def source88 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨58, by decide +kernel⟩

def target88 : Weights.Entry :=
  { word := [8, 4, 12, 12, 8, 0, 9], weights := [0, 1, 1, 0] }

def points88 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 5292, representative 7915.
def source89 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨12, by decide +kernel⟩

def target89 : Weights.Entry :=
  { word := [8, 4, 12, 12, 8, 8, 9], weights := [1, 0, 1, 0] }

-- Period 9, original row 5345, representative 7964.
def source90 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨61, by decide +kernel⟩

def target90 : Weights.Entry :=
  { word := [8, 8, 0, 4, 2, 0, 9], weights := [1, 0, 0, 1] }

def points90 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2)]

-- Period 9, original row 5371, representative 7965.
def source91 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨62, by decide +kernel⟩

def target91 : Weights.Entry :=
  { word := [8, 8, 0, 4, 10, 0, 9], weights := [1, 0, 0, 1] }

def points91 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2)]

-- Period 9, original row 5409, representative 7967.
def source92 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨64, by decide +kernel⟩

def target92 : Weights.Entry :=
  { word := [8, 8, 0, 12, 2, 0, 9], weights := [1, 0, 0, 1] }

def points92 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2)]

-- Period 9, original row 5434, representative 7966.
def source93 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨63, by decide +kernel⟩

def target93 : Weights.Entry :=
  { word := [8, 8, 0, 12, 10, 0, 9], weights := [1, 0, 0, 1] }

def points93 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2)]

-- Period 9, original row 5448, representative 7930.
def source94 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨27, by decide +kernel⟩

def target94 : Weights.Entry :=
  { word := [8, 8, 1, 4, 2, 0, 9], weights := [1, 0, 0, 1] }

def points94 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 5470, representative 7931.
def source95 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨28, by decide +kernel⟩

def target95 : Weights.Entry :=
  { word := [8, 8, 1, 4, 10, 0, 9], weights := [1, 0, 0, 1] }

def points95 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 5484, representative 7937.
def source96 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨34, by decide +kernel⟩

def target96 : Weights.Entry :=
  { word := [8, 8, 1, 12, 2, 0, 9], weights := [1, 0, 0, 1] }

def points96 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 5506, representative 7934.
def source97 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨31, by decide +kernel⟩

def target97 : Weights.Entry :=
  { word := [8, 8, 1, 12, 10, 0, 9], weights := [1, 0, 0, 1] }

def points97 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 5520, representative 7946.
def source98 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨43, by decide +kernel⟩

def target98 : Weights.Entry :=
  { word := [8, 8, 2, 2, 2, 0, 9], weights := [0, 1, 0, 0] }

def points98 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 5535, representative 7947.
def source99 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨44, by decide +kernel⟩

def target99 : Weights.Entry :=
  { word := [8, 8, 2, 2, 10, 0, 9], weights := [0, 1, 0, 0] }

def points99 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 5550, representative 7949.
def source100 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨46, by decide +kernel⟩

def target100 : Weights.Entry :=
  { word := [8, 8, 2, 10, 2, 0, 9], weights := [0, 1, 0, 0] }

def points100 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 5564, representative 7948.
def source101 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨45, by decide +kernel⟩

def target101 : Weights.Entry :=
  { word := [8, 8, 2, 10, 10, 0, 9], weights := [0, 1, 0, 0] }

def points101 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 5583, representative 7920.
def source102 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨17, by decide +kernel⟩

def target102 : Weights.Entry :=
  { word := [8, 8, 4, 2, 0, 8, 9], weights := [1, 0, 0, 1] }

-- Period 9, original row 5622, representative 7923.
def source103 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨20, by decide +kernel⟩

def target103 : Weights.Entry :=
  { word := [8, 8, 4, 10, 0, 8, 9], weights := [1, 0, 0, 1] }

-- Period 9, original row 5791, representative 7921.
def source104 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨18, by decide +kernel⟩

def target104 : Weights.Entry :=
  { word := [8, 8, 12, 2, 0, 8, 9], weights := [1, 0, 0, 1] }

-- Period 9, original row 5829, representative 7922.
def source105 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨19, by decide +kernel⟩

def target105 : Weights.Entry :=
  { word := [8, 8, 12, 10, 0, 8, 9], weights := [1, 0, 0, 1] }

-- Period 9, original row 5848, representative 7990.
def source106 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨87, by decide +kernel⟩

def target106 : Weights.Entry :=
  { word := [8, 9, 0, 1, 4, 2, 0], weights := [1, 0, 1, 0] }

def points106 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2)]

-- Period 9, original row 5852, representative 7991.
def source107 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨88, by decide +kernel⟩

def target107 : Weights.Entry :=
  { word := [8, 9, 0, 1, 4, 10, 0], weights := [1, 0, 1, 0] }

def points107 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2)]

-- Period 9, original row 5854, representative 7993.
def source108 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨90, by decide +kernel⟩

def target108 : Weights.Entry :=
  { word := [8, 9, 0, 1, 12, 2, 0], weights := [1, 0, 1, 0] }

def points108 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2)]

-- Period 9, original row 5858, representative 7992.
def source109 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨89, by decide +kernel⟩

def target109 : Weights.Entry :=
  { word := [8, 9, 0, 1, 12, 10, 0], weights := [1, 0, 1, 0] }

def points109 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2)]

-- Period 9, original row 5860, representative 7990.
def source110 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨87, by decide +kernel⟩

def target110 : Weights.Entry :=
  { word := [8, 9, 0, 2, 2, 2, 0], weights := [1, 0, 0, 1] }

def points110 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 5), (4, 6), (5, 4), (6, 3), (7, 1), (8, 2)]

-- Period 9, original row 5861, representative 7912.
def source111 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨9, by decide +kernel⟩

def target111 : Weights.Entry :=
  { word := [8, 9, 0, 2, 2, 2, 8], weights := [1, 0, 0, 1] }

def points111 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2)]

-- Period 9, original row 5862, representative 7991.
def source112 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨88, by decide +kernel⟩

def target112 : Weights.Entry :=
  { word := [8, 9, 0, 2, 2, 10, 0], weights := [1, 0, 0, 1] }

def points112 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 5), (4, 6), (5, 4), (6, 3), (7, 1), (8, 2)]

-- Period 9, original row 5863, representative 7904.
def source113 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨1, by decide +kernel⟩

def target113 : Weights.Entry :=
  { word := [8, 9, 0, 2, 2, 10, 8], weights := [1, 0, 0, 1] }

-- Period 9, original row 5864, representative 7993.
def source114 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨90, by decide +kernel⟩

def target114 : Weights.Entry :=
  { word := [8, 9, 0, 2, 10, 2, 0], weights := [1, 0, 0, 1] }

def points114 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 5), (4, 6), (5, 4), (6, 3), (7, 1), (8, 2)]

-- Period 9, original row 5865, representative 7917.
def source115 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨14, by decide +kernel⟩

def target115 : Weights.Entry :=
  { word := [8, 9, 0, 2, 10, 2, 8], weights := [1, 0, 0, 1] }

def points115 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2)]

-- Period 9, original row 5866, representative 7992.
def source116 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨89, by decide +kernel⟩

def target116 : Weights.Entry :=
  { word := [8, 9, 0, 2, 10, 10, 0], weights := [1, 0, 0, 1] }

def points116 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 5), (4, 6), (5, 4), (6, 3), (7, 1), (8, 2)]

-- Period 9, original row 5867, representative 7909.
def source117 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨6, by decide +kernel⟩

def target117 : Weights.Entry :=
  { word := [8, 9, 0, 2, 10, 10, 8], weights := [1, 0, 0, 1] }

-- Period 9, original row 5875, representative 7924.
def source118 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨21, by decide +kernel⟩

def target118 : Weights.Entry :=
  { word := [8, 9, 0, 4, 2, 0, 8], weights := [1, 0, 0, 1] }

def points118 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2)]

-- Period 9, original row 5881, representative 7920.
def source119 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨17, by decide +kernel⟩

def target119 : Weights.Entry :=
  { word := [8, 9, 0, 4, 2, 8, 8], weights := [1, 0, 0, 1] }

def points119 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2)]

-- Period 9, original row 5888, representative 7984.
def source120 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨81, by decide +kernel⟩

def target120 : Weights.Entry :=
  { word := [8, 9, 0, 4, 6, 8, 0], weights := [1, 0, 1, 0] }

def points120 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 5), (4, 6), (5, 4), (6, 3), (7, 1), (8, 2)]

-- Period 9, original row 5901, representative 7925.
def source121 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨22, by decide +kernel⟩

def target121 : Weights.Entry :=
  { word := [8, 9, 0, 4, 10, 0, 8], weights := [1, 0, 0, 1] }

def points121 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2)]

-- Period 9, original row 5907, representative 7921.
def source122 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨18, by decide +kernel⟩

def target122 : Weights.Entry :=
  { word := [8, 9, 0, 4, 10, 8, 8], weights := [1, 0, 0, 1] }

def points122 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2)]

-- Period 9, original row 5920, representative 7919.
def source123 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨16, by decide +kernel⟩

def target123 : Weights.Entry :=
  { word := [8, 9, 0, 10, 2, 2, 8], weights := [0, 1, 0, 1] }

def points123 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2)]

-- Period 9, original row 5921, representative 7911.
def source124 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨8, by decide +kernel⟩

def target124 : Weights.Entry :=
  { word := [8, 9, 0, 10, 2, 10, 8], weights := [1, 0, 0, 1] }

-- Period 9, original row 5922, representative 7918.
def source125 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨15, by decide +kernel⟩

def target125 : Weights.Entry :=
  { word := [8, 9, 0, 10, 10, 2, 8], weights := [0, 1, 0, 1] }

def points125 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2)]

-- Period 9, original row 5923, representative 7910.
def source126 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨7, by decide +kernel⟩

def target126 : Weights.Entry :=
  { word := [8, 9, 0, 10, 10, 10, 8], weights := [1, 0, 0, 1] }

-- Period 9, original row 5935, representative 7927.
def source127 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B009.Data.entryAt ⟨24, by decide +kernel⟩

def target127 : Weights.Entry :=
  { word := [8, 9, 0, 12, 2, 0, 8], weights := [1, 0, 0, 1] }

def points127 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2)]

def period9Entries : List Weights.Entry := [target0, target1, target2, target3, target4, target5, target6, target7, target8, target9, target10, target11, target12, target13, target14, target15, target16, target17, target18, target19, target20, target21, target22, target23, target24, target25, target26, target27, target28, target29, target30, target31, target32, target33, target34, target35, target36, target37, target38, target39, target40, target41, target42, target43, target44, target45, target46, target47, target48, target49, target50, target51, target52, target53, target54, target55, target56, target57, target58, target59, target60, target61, target62, target63, target64, target65, target66, target67, target68, target69, target70, target71, target72, target73, target74, target75, target76, target77, target78, target79, target80, target81, target82, target83, target84, target85, target86, target87, target88, target89, target90, target91, target92, target93, target94, target95, target96, target97, target98, target99, target100, target101, target102, target103, target104, target105, target106, target107, target108, target109, target110, target111, target112, target113, target114, target115, target116, target117, target118, target119, target120, target121, target122, target123, target124, target125, target126, target127]

def period9Chunk : RowCoverage.Chunk where
  rows := [⟨2378, target0⟩, ⟨4127, target1⟩, ⟨4149, target2⟩, ⟨4163, target3⟩, ⟨4185, target4⟩, ⟨4199, target5⟩, ⟨4214, target6⟩, ⟨4229, target7⟩, ⟨4243, target8⟩, ⟨4262, target9⟩, ⟨4294, target10⟩, ⟨4335, target11⟩, ⟨4435, target12⟩, ⟨4470, target13⟩, ⟨4494, target14⟩, ⟨4496, target15⟩, ⟨4505, target16⟩, ⟨4506, target17⟩, ⟨4516, target18⟩, ⟨4518, target19⟩, ⟨4523, target20⟩, ⟨4528, target21⟩, ⟨4530, target22⟩, ⟨4532, target23⟩, ⟨4536, target24⟩, ⟨4538, target25⟩, ⟨4540, target26⟩, ⟨4542, target27⟩, ⟨4544, target28⟩, ⟨4545, target29⟩, ⟨4546, target30⟩, ⟨4551, target31⟩, ⟨4555, target32⟩, ⟨4556, target33⟩, ⟨4562, target34⟩, ⟨4567, target35⟩, ⟨4570, target36⟩, ⟨4572, target37⟩, ⟨4576, target38⟩, ⟨4578, target39⟩, ⟨4580, target40⟩, ⟨4582, target41⟩, ⟨4596, target42⟩, ⟨4597, target43⟩, ⟨4598, target44⟩, ⟨4599, target45⟩, ⟨4605, target46⟩, ⟨4607, target47⟩, ⟨4612, target48⟩, ⟨4617, target49⟩, ⟨4619, target50⟩, ⟨4621, target51⟩, ⟨4625, target52⟩, ⟨4627, target53⟩, ⟨4629, target54⟩, ⟨4631, target55⟩, ⟨4633, target56⟩, ⟨4634, target57⟩, ⟨4635, target58⟩, ⟨4644, target59⟩, ⟨4648, target60⟩, ⟨4649, target61⟩, ⟨4655, target62⟩, ⟨4660, target63⟩, ⟨4663, target64⟩, ⟨4665, target65⟩, ⟨5006, target66⟩, ⟨5028, target67⟩, ⟨5042, target68⟩, ⟨5064, target69⟩, ⟨5083, target70⟩, ⟨5091, target71⟩, ⟨5100, target72⟩, ⟨5107, target73⟩, ⟨5114, target74⟩, ⟨5121, target75⟩, ⟨5128, target76⟩, ⟨5135, target77⟩, ⟨5142, target78⟩, ⟨5149, target79⟩, ⟨5161, target80⟩, ⟨5187, target81⟩, ⟨5203, target82⟩, ⟨5229, target83⟩, ⟨5257, target84⟩, ⟨5264, target85⟩, ⟨5271, target86⟩, ⟨5278, target87⟩, ⟨5285, target88⟩, ⟨5292, target89⟩, ⟨5345, target90⟩, ⟨5371, target91⟩, ⟨5409, target92⟩, ⟨5434, target93⟩, ⟨5448, target94⟩, ⟨5470, target95⟩, ⟨5484, target96⟩, ⟨5506, target97⟩, ⟨5520, target98⟩, ⟨5535, target99⟩, ⟨5550, target100⟩, ⟨5564, target101⟩, ⟨5583, target102⟩, ⟨5622, target103⟩, ⟨5791, target104⟩, ⟨5829, target105⟩, ⟨5848, target106⟩, ⟨5852, target107⟩, ⟨5854, target108⟩, ⟨5858, target109⟩, ⟨5860, target110⟩, ⟨5861, target111⟩, ⟨5862, target112⟩, ⟨5863, target113⟩, ⟨5864, target114⟩, ⟨5865, target115⟩, ⟨5866, target116⟩, ⟨5867, target117⟩, ⟨5875, target118⟩, ⟨5881, target119⟩, ⟨5888, target120⟩, ⟨5901, target121⟩, ⟨5907, target122⟩, ⟨5920, target123⟩, ⟨5921, target124⟩, ⟨5922, target125⟩, ⟨5923, target126⟩, ⟨5935, target127⟩]
  indexMask := 41041481191238757388950608120814156329272507427427486360104339217962744998759217792484649165847841450565707893110059834899189979289132441794379203316944220167374816136512327313111207478552975589448209132186911964848577403640606729394699303645211076262022072162493664412904584150558487192696962149215243488479728191282855696776901013415047009895872848839147373692289084149936374654335377021844210006079750653281122176297966403377531365643785697993821630097023593285017779279012350842544255913193054708350639786167155482285967478304840034219888446544365300015493162995057340400969482271053346843737167696887695457513043218175626770829437076349574332477152535744509204412253482169587476852316000707201236817158450630241173592321510467902548021659084297699488402473233397183398519509753921656498032213783913560505674945492946232451744477407330439053022947998975830767907489755504407783985031178462019559394487226820064014189304811504316377149914466085951377972497721742581013833175219667345871379286308821366458466397825108174024553289658101618401491738283518441179613492806415700988212685821775587053214895749893030510947927885088252047361568749500701607003719049504407699743908228073262826771216875398998831872204620141663881712977484930408892494407998664784991637099145722195823777743865371925102090186822254758835005422025692737834129491603294773911350865662869787265733554233934576541032082251064536989783674918939614779667655076144058025466787954328192283853710537717984123083196754959797304439529779671909586997549332080749812694695750365590017860163217439574414437159164576748713555613735751204903441082129850296501667995330258162813653665263506999561279795953146649998039420488863921387349195208939502122138028935822578145567945387005144709121411563951773135736150345461338021560320
  count := 128

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem period9Chunk_entries :
    period9Chunk.rows.map RowCoverage.TaggedRow.entry = period9Entries := rfl

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem period9_index_check :
    RowCoverage.indexCheck CanonicalWords.count period9Chunk = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem period9_words_check :
    RowCoverage.wordsCheck CanonicalWords.wordAt period9Chunk = true := by
  decide +kernel

end FranklSmallCyclic.TransportBatches.G062.B001.Data
