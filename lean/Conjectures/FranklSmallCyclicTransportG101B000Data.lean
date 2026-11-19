module

public import Conjectures.FranklSmallCyclicRowCoverage
public import Conjectures.FranklSmallCyclicCanonicalWords
public import Conjectures.FranklSmallCyclicOrbit10Block023Data

/-! 128 literal targets sharing one source proof block.
Original words and row indices are retained; weights may be transported.
-/
@[expose] public section

namespace FranklSmallCyclic.TransportBatches.G101.B000.Data

-- Period 10, original row 4114, representative 10920.
def source0 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B023.Data.entryAt ⟨0, by decide +kernel⟩

def target0 : Weights.Entry :=
  { word := [8, 0, 0, 10, 2, 10, 8], weights := [1, 0, 0, 1] }

-- Period 10, original row 4132, representative 10976.
def source1 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B023.Data.entryAt ⟨56, by decide +kernel⟩

def target1 : Weights.Entry :=
  { word := [8, 0, 1, 4, 2, 8, 8], weights := [1, 0, 1, 0] }

-- Period 10, original row 4154, representative 10981.
def source2 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B023.Data.entryAt ⟨61, by decide +kernel⟩

def target2 : Weights.Entry :=
  { word := [8, 0, 1, 4, 10, 8, 8], weights := [1, 0, 1, 0] }

-- Period 10, original row 4168, representative 10983.
def source3 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B023.Data.entryAt ⟨63, by decide +kernel⟩

def target3 : Weights.Entry :=
  { word := [8, 0, 1, 12, 2, 8, 8], weights := [1, 0, 1, 0] }

-- Period 10, original row 4190, representative 10982.
def source4 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B023.Data.entryAt ⟨62, by decide +kernel⟩

def target4 : Weights.Entry :=
  { word := [8, 0, 1, 12, 10, 8, 8], weights := [1, 0, 1, 0] }

-- Period 10, original row 4206, representative 10954.
def source5 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B023.Data.entryAt ⟨34, by decide +kernel⟩

def target5 : Weights.Entry :=
  { word := [8, 0, 2, 2, 2, 8, 8], weights := [1, 0, 0, 1] }

-- Period 10, original row 4221, representative 10959.
def source6 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B023.Data.entryAt ⟨39, by decide +kernel⟩

def target6 : Weights.Entry :=
  { word := [8, 0, 2, 2, 10, 8, 8], weights := [1, 0, 0, 1] }

-- Period 10, original row 4235, representative 10961.
def source7 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B023.Data.entryAt ⟨41, by decide +kernel⟩

def target7 : Weights.Entry :=
  { word := [8, 0, 2, 10, 2, 8, 8], weights := [1, 0, 0, 1] }

-- Period 10, original row 4249, representative 10960.
def source8 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B023.Data.entryAt ⟨40, by decide +kernel⟩

def target8 : Weights.Entry :=
  { word := [8, 0, 2, 10, 10, 8, 8], weights := [1, 0, 0, 1] }

-- Period 10, original row 4266, representative 10921.
def source9 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B023.Data.entryAt ⟨1, by decide +kernel⟩

def target9 : Weights.Entry :=
  { word := [8, 0, 4, 2, 0, 9, 8], weights := [1, 0, 0, 1] }

-- Period 10, original row 4268, representative 10921.
def source10 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B023.Data.entryAt ⟨1, by decide +kernel⟩

def target10 : Weights.Entry :=
  { word := [8, 0, 4, 2, 0, 10, 8], weights := [1, 0, 0, 1] }

def points10 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 8), (8, 7), (9, 9)]

-- Period 10, original row 4274, representative 10922.
def source11 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B023.Data.entryAt ⟨2, by decide +kernel⟩

def target11 : Weights.Entry :=
  { word := [8, 0, 4, 2, 8, 10, 8], weights := [1, 0, 0, 1] }

-- Period 10, original row 4278, representative 10964.
def source12 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B023.Data.entryAt ⟨44, by decide +kernel⟩

def target12 : Weights.Entry :=
  { word := [8, 0, 4, 4, 4, 8, 8], weights := [0, 0, 1, 0] }

-- Period 10, original row 4284, representative 10963.
def source13 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B023.Data.entryAt ⟨43, by decide +kernel⟩

def target13 : Weights.Entry :=
  { word := [8, 0, 4, 8, 4, 2, 8], weights := [0, 1, 1, 0] }

-- Period 10, original row 4297, representative 10928.
def source14 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B023.Data.entryAt ⟨8, by decide +kernel⟩

def target14 : Weights.Entry :=
  { word := [8, 0, 4, 10, 0, 9, 8], weights := [1, 0, 0, 1] }

-- Period 10, original row 4298, representative 10928.
def source15 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B023.Data.entryAt ⟨8, by decide +kernel⟩

def target15 : Weights.Entry :=
  { word := [8, 0, 4, 10, 0, 10, 8], weights := [1, 0, 0, 1] }

def points15 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 8), (8, 7), (9, 9)]

-- Period 10, original row 4309, representative 10925.
def source16 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B023.Data.entryAt ⟨5, by decide +kernel⟩

def target16 : Weights.Entry :=
  { word := [8, 0, 4, 10, 8, 10, 8], weights := [0, 1, 1, 0] }

-- Period 10, original row 4314, representative 10967.
def source17 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B023.Data.entryAt ⟨47, by decide +kernel⟩

def target17 : Weights.Entry :=
  { word := [8, 0, 4, 12, 4, 8, 8], weights := [0, 0, 1, 0] }

-- Period 10, original row 4319, representative 10950.
def source18 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B023.Data.entryAt ⟨30, by decide +kernel⟩

def target18 : Weights.Entry :=
  { word := [8, 0, 6, 2, 0, 8, 8], weights := [1, 0, 0, 1] }

-- Period 10, original row 4327, representative 10951.
def source19 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B023.Data.entryAt ⟨31, by decide +kernel⟩

def target19 : Weights.Entry :=
  { word := [8, 0, 6, 2, 8, 8, 8], weights := [1, 0, 0, 1] }

-- Period 10, original row 4334, representative 10953.
def source20 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B023.Data.entryAt ⟨33, by decide +kernel⟩

def target20 : Weights.Entry :=
  { word := [8, 0, 6, 10, 0, 8, 8], weights := [1, 0, 0, 1] }

-- Period 10, original row 4341, representative 10952.
def source21 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B023.Data.entryAt ⟨32, by decide +kernel⟩

def target21 : Weights.Entry :=
  { word := [8, 0, 6, 10, 8, 8, 8], weights := [0, 1, 1, 0] }

-- Period 10, original row 4400, representative 10955.
def source22 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B023.Data.entryAt ⟨35, by decide +kernel⟩

def target22 : Weights.Entry :=
  { word := [8, 0, 10, 2, 2, 8, 8], weights := [1, 0, 0, 1] }

-- Period 10, original row 4408, representative 10956.
def source23 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B023.Data.entryAt ⟨36, by decide +kernel⟩

def target23 : Weights.Entry :=
  { word := [8, 0, 10, 2, 10, 8, 8], weights := [1, 0, 0, 1] }

-- Period 10, original row 4415, representative 10958.
def source24 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B023.Data.entryAt ⟨38, by decide +kernel⟩

def target24 : Weights.Entry :=
  { word := [8, 0, 10, 10, 2, 8, 8], weights := [0, 1, 1, 0] }

-- Period 10, original row 4422, representative 10957.
def source25 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B023.Data.entryAt ⟨37, by decide +kernel⟩

def target25 : Weights.Entry :=
  { word := [8, 0, 10, 10, 10, 8, 8], weights := [0, 1, 1, 0] }

-- Period 10, original row 4439, representative 10926.
def source26 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B023.Data.entryAt ⟨6, by decide +kernel⟩

def target26 : Weights.Entry :=
  { word := [8, 0, 12, 2, 0, 9, 8], weights := [1, 0, 0, 1] }

-- Period 10, original row 4441, representative 10926.
def source27 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B023.Data.entryAt ⟨6, by decide +kernel⟩

def target27 : Weights.Entry :=
  { word := [8, 0, 12, 2, 0, 10, 8], weights := [1, 0, 0, 1] }

def points27 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 8), (8, 7), (9, 9)]

-- Period 10, original row 4447, representative 10923.
def source28 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B023.Data.entryAt ⟨3, by decide +kernel⟩

def target28 : Weights.Entry :=
  { word := [8, 0, 12, 2, 8, 10, 8], weights := [1, 0, 0, 1] }

-- Period 10, original row 4451, representative 10965.
def source29 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B023.Data.entryAt ⟨45, by decide +kernel⟩

def target29 : Weights.Entry :=
  { word := [8, 0, 12, 4, 4, 8, 8], weights := [0, 0, 1, 0] }

-- Period 10, original row 4456, representative 10962.
def source30 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B023.Data.entryAt ⟨42, by decide +kernel⟩

def target30 : Weights.Entry :=
  { word := [8, 0, 12, 8, 4, 2, 8], weights := [0, 1, 1, 0] }

-- Period 10, original row 4473, representative 10927.
def source31 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B023.Data.entryAt ⟨7, by decide +kernel⟩

def target31 : Weights.Entry :=
  { word := [8, 0, 12, 10, 0, 9, 8], weights := [1, 0, 0, 1] }

-- Period 10, original row 4474, representative 10927.
def source32 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B023.Data.entryAt ⟨7, by decide +kernel⟩

def target32 : Weights.Entry :=
  { word := [8, 0, 12, 10, 0, 10, 8], weights := [1, 0, 0, 1] }

def points32 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 8), (8, 7), (9, 9)]

-- Period 10, original row 4485, representative 10924.
def source33 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B023.Data.entryAt ⟨4, by decide +kernel⟩

def target33 : Weights.Entry :=
  { word := [8, 0, 12, 10, 8, 10, 8], weights := [0, 1, 1, 0] }

-- Period 10, original row 4490, representative 10966.
def source34 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B023.Data.entryAt ⟨46, by decide +kernel⟩

def target34 : Weights.Entry :=
  { word := [8, 0, 12, 12, 4, 8, 8], weights := [0, 0, 1, 0] }

-- Period 10, original row 5011, representative 10976.
def source35 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B023.Data.entryAt ⟨56, by decide +kernel⟩

def target35 : Weights.Entry :=
  { word := [8, 4, 0, 4, 2, 8, 8], weights := [1, 0, 1, 0] }

def points35 : List (ℕ × ℕ) := [(0, 0), (1, 2), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8), (9, 9)]

-- Period 10, original row 5033, representative 10981.
def source36 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B023.Data.entryAt ⟨61, by decide +kernel⟩

def target36 : Weights.Entry :=
  { word := [8, 4, 0, 4, 10, 8, 8], weights := [1, 0, 1, 0] }

def points36 : List (ℕ × ℕ) := [(0, 0), (1, 2), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8), (9, 9)]

-- Period 10, original row 5047, representative 10983.
def source37 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B023.Data.entryAt ⟨63, by decide +kernel⟩

def target37 : Weights.Entry :=
  { word := [8, 4, 0, 12, 2, 8, 8], weights := [1, 0, 1, 0] }

def points37 : List (ℕ × ℕ) := [(0, 0), (1, 2), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8), (9, 9)]

-- Period 10, original row 5069, representative 10982.
def source38 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B023.Data.entryAt ⟨62, by decide +kernel⟩

def target38 : Weights.Entry :=
  { word := [8, 4, 0, 12, 10, 8, 8], weights := [1, 0, 1, 0] }

def points38 : List (ℕ × ℕ) := [(0, 0), (1, 2), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8), (9, 9)]

-- Period 10, original row 5075, representative 10936.
def source39 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B023.Data.entryAt ⟨16, by decide +kernel⟩

def target39 : Weights.Entry :=
  { word := [8, 4, 2, 0, 1, 8, 8], weights := [0, 1, 2, 1] }

-- Period 10, original row 5078, representative 10937.
def source40 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B023.Data.entryAt ⟨17, by decide +kernel⟩

def target40 : Weights.Entry :=
  { word := [8, 4, 2, 0, 9, 8, 8], weights := [0, 1, 2, 1] }

-- Period 10, original row 5082, representative 10963.
def source41 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B023.Data.entryAt ⟨43, by decide +kernel⟩

def target41 : Weights.Entry :=
  { word := [8, 4, 2, 8, 2, 0, 8], weights := [0, 1, 1, 0] }

def points41 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 4), (5, 5), (6, 3), (7, 1), (8, 2), (9, 0)]

-- Period 10, original row 5086, representative 10933.
def source42 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B023.Data.entryAt ⟨13, by decide +kernel⟩

def target42 : Weights.Entry :=
  { word := [8, 4, 2, 8, 2, 8, 8], weights := [0, 1, 1, 0] }

-- Period 10, original row 5090, representative 10962.
def source43 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B023.Data.entryAt ⟨42, by decide +kernel⟩

def target43 : Weights.Entry :=
  { word := [8, 4, 2, 8, 10, 0, 8], weights := [0, 1, 1, 0] }

def points43 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 4), (5, 5), (6, 3), (7, 1), (8, 2), (9, 0)]

-- Period 10, original row 5094, representative 10932.
def source44 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B023.Data.entryAt ⟨12, by decide +kernel⟩

def target44 : Weights.Entry :=
  { word := [8, 4, 2, 8, 10, 8, 8], weights := [0, 1, 1, 0] }

-- Period 10, original row 5106, representative 10968.
def source45 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B023.Data.entryAt ⟨48, by decide +kernel⟩

def target45 : Weights.Entry :=
  { word := [8, 4, 4, 4, 0, 8, 8], weights := [1, 0, 0, 1] }

-- Period 10, original row 5120, representative 10973.
def source46 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B023.Data.entryAt ⟨53, by decide +kernel⟩

def target46 : Weights.Entry :=
  { word := [8, 4, 4, 4, 8, 8, 8], weights := [1, 0, 1, 0] }

-- Period 10, original row 5134, representative 10975.
def source47 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B023.Data.entryAt ⟨55, by decide +kernel⟩

def target47 : Weights.Entry :=
  { word := [8, 4, 4, 12, 0, 8, 8], weights := [1, 0, 1, 0] }

-- Period 10, original row 5148, representative 10974.
def source48 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B023.Data.entryAt ⟨54, by decide +kernel⟩

def target48 : Weights.Entry :=
  { word := [8, 4, 4, 12, 8, 8, 8], weights := [1, 0, 1, 0] }

-- Period 10, original row 5154, representative 10929.
def source49 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B023.Data.entryAt ⟨9, by decide +kernel⟩

def target49 : Weights.Entry :=
  { word := [8, 4, 6, 8, 8, 8, 8], weights := [0, 1, 1, 0] }

-- Period 10, original row 5166, representative 10977.
def source50 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B023.Data.entryAt ⟨57, by decide +kernel⟩

def target50 : Weights.Entry :=
  { word := [8, 4, 8, 4, 2, 8, 8], weights := [1, 0, 1, 0] }

-- Period 10, original row 5192, representative 10978.
def source51 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B023.Data.entryAt ⟨58, by decide +kernel⟩

def target51 : Weights.Entry :=
  { word := [8, 4, 8, 4, 10, 8, 8], weights := [1, 0, 1, 0] }

-- Period 10, original row 5208, representative 10980.
def source52 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B023.Data.entryAt ⟨60, by decide +kernel⟩

def target52 : Weights.Entry :=
  { word := [8, 4, 8, 12, 2, 8, 8], weights := [1, 0, 1, 0] }

-- Period 10, original row 5234, representative 10979.
def source53 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B023.Data.entryAt ⟨59, by decide +kernel⟩

def target53 : Weights.Entry :=
  { word := [8, 4, 8, 12, 10, 8, 8], weights := [1, 0, 1, 0] }

-- Period 10, original row 5242, representative 10934.
def source54 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B023.Data.entryAt ⟨14, by decide +kernel⟩

def target54 : Weights.Entry :=
  { word := [8, 4, 10, 0, 1, 8, 8], weights := [0, 1, 2, 1] }

-- Period 10, original row 5245, representative 10935.
def source55 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B023.Data.entryAt ⟨15, by decide +kernel⟩

def target55 : Weights.Entry :=
  { word := [8, 4, 10, 0, 9, 8, 8], weights := [0, 1, 2, 1] }

-- Period 10, original row 5248, representative 10931.
def source56 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B023.Data.entryAt ⟨11, by decide +kernel⟩

def target56 : Weights.Entry :=
  { word := [8, 4, 10, 8, 2, 8, 8], weights := [0, 1, 1, 0] }

-- Period 10, original row 5251, representative 10930.
def source57 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B023.Data.entryAt ⟨10, by decide +kernel⟩

def target57 : Weights.Entry :=
  { word := [8, 4, 10, 8, 10, 8, 8], weights := [0, 1, 1, 0] }

-- Period 10, original row 5256, representative 10969.
def source58 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B023.Data.entryAt ⟨49, by decide +kernel⟩

def target58 : Weights.Entry :=
  { word := [8, 4, 12, 4, 0, 8, 8], weights := [1, 0, 0, 1] }

-- Period 10, original row 5270, representative 10970.
def source59 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B023.Data.entryAt ⟨50, by decide +kernel⟩

def target59 : Weights.Entry :=
  { word := [8, 4, 12, 4, 8, 8, 8], weights := [1, 0, 1, 0] }

-- Period 10, original row 5277, representative 10972.
def source60 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B023.Data.entryAt ⟨52, by decide +kernel⟩

def target60 : Weights.Entry :=
  { word := [8, 4, 12, 12, 0, 8, 8], weights := [1, 0, 1, 0] }

-- Period 10, original row 5291, representative 10971.
def source61 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B023.Data.entryAt ⟨51, by decide +kernel⟩

def target61 : Weights.Entry :=
  { word := [8, 4, 12, 12, 8, 8, 8], weights := [1, 0, 1, 0] }

-- Period 10, original row 5318, representative 10936.
def source62 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B023.Data.entryAt ⟨16, by decide +kernel⟩

def target62 : Weights.Entry :=
  { word := [8, 8, 0, 1, 4, 2, 8], weights := [1, 2, 1, 0] }

def points62 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2), (9, 0)]

-- Period 10, original row 5324, representative 10934.
def source63 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B023.Data.entryAt ⟨14, by decide +kernel⟩

def target63 : Weights.Entry :=
  { word := [8, 8, 0, 1, 12, 2, 8], weights := [1, 2, 1, 0] }

def points63 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2), (9, 0)]

-- Period 10, original row 5330, representative 10968.
def source64 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B023.Data.entryAt ⟨48, by decide +kernel⟩

def target64 : Weights.Entry :=
  { word := [8, 8, 0, 2, 2, 2, 8], weights := [1, 0, 0, 1] }

def points64 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2), (9, 0)]

-- Period 10, original row 5334, representative 10969.
def source65 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B023.Data.entryAt ⟨49, by decide +kernel⟩

def target65 : Weights.Entry :=
  { word := [8, 8, 0, 2, 10, 2, 8], weights := [1, 0, 0, 1] }

def points65 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2), (9, 0)]

-- Period 10, original row 5356, representative 10950.
def source66 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B023.Data.entryAt ⟨30, by decide +kernel⟩

def target66 : Weights.Entry :=
  { word := [8, 8, 0, 4, 6, 0, 8], weights := [1, 0, 0, 1] }

def points66 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2), (9, 0)]

-- Period 10, original row 5358, representative 10938.
def source67 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B023.Data.entryAt ⟨18, by decide +kernel⟩

def target67 : Weights.Entry :=
  { word := [8, 8, 0, 4, 6, 8, 8], weights := [1, 0, 0, 1] }

-- Period 10, original row 5393, representative 10975.
def source68 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B023.Data.entryAt ⟨55, by decide +kernel⟩

def target68 : Weights.Entry :=
  { word := [8, 8, 0, 10, 2, 2, 8], weights := [0, 1, 0, 1] }

def points68 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2), (9, 0)]

-- Period 10, original row 5395, representative 10972.
def source69 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B023.Data.entryAt ⟨52, by decide +kernel⟩

def target69 : Weights.Entry :=
  { word := [8, 8, 0, 10, 10, 2, 8], weights := [0, 1, 0, 1] }

def points69 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2), (9, 0)]

-- Period 10, original row 5419, representative 10953.
def source70 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B023.Data.entryAt ⟨33, by decide +kernel⟩

def target70 : Weights.Entry :=
  { word := [8, 8, 0, 12, 6, 0, 8], weights := [1, 0, 0, 1] }

def points70 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2), (9, 0)]

-- Period 10, original row 5421, representative 10941.
def source71 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B023.Data.entryAt ⟨21, by decide +kernel⟩

def target71 : Weights.Entry :=
  { word := [8, 8, 0, 12, 6, 8, 8], weights := [1, 0, 0, 1] }

-- Period 10, original row 5447, representative 10921.
def source72 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B023.Data.entryAt ⟨1, by decide +kernel⟩

def target72 : Weights.Entry :=
  { word := [8, 8, 1, 4, 2, 0, 8], weights := [1, 0, 0, 1] }

def points72 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 5469, representative 10926.
def source73 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B023.Data.entryAt ⟨6, by decide +kernel⟩

def target73 : Weights.Entry :=
  { word := [8, 8, 1, 4, 10, 0, 8], weights := [1, 0, 0, 1] }

def points73 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 5483, representative 10928.
def source74 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B023.Data.entryAt ⟨8, by decide +kernel⟩

def target74 : Weights.Entry :=
  { word := [8, 8, 1, 12, 2, 0, 8], weights := [1, 0, 0, 1] }

def points74 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 5505, representative 10927.
def source75 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B023.Data.entryAt ⟨7, by decide +kernel⟩

def target75 : Weights.Entry :=
  { word := [8, 8, 1, 12, 10, 0, 8], weights := [1, 0, 0, 1] }

def points75 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 5519, representative 10964.
def source76 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B023.Data.entryAt ⟨44, by decide +kernel⟩

def target76 : Weights.Entry :=
  { word := [8, 8, 2, 2, 2, 0, 8], weights := [0, 1, 0, 0] }

def points76 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 5527, representative 10942.
def source77 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B023.Data.entryAt ⟨22, by decide +kernel⟩

def target77 : Weights.Entry :=
  { word := [8, 8, 2, 2, 2, 8, 8], weights := [1, 0, 0, 1] }

-- Period 10, original row 5534, representative 10965.
def source78 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B023.Data.entryAt ⟨45, by decide +kernel⟩

def target78 : Weights.Entry :=
  { word := [8, 8, 2, 2, 10, 0, 8], weights := [0, 1, 0, 0] }

def points78 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 5542, representative 10947.
def source79 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B023.Data.entryAt ⟨27, by decide +kernel⟩

def target79 : Weights.Entry :=
  { word := [8, 8, 2, 2, 10, 8, 8], weights := [1, 0, 0, 1] }

-- Period 10, original row 5549, representative 10967.
def source80 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B023.Data.entryAt ⟨47, by decide +kernel⟩

def target80 : Weights.Entry :=
  { word := [8, 8, 2, 10, 2, 0, 8], weights := [0, 1, 0, 0] }

def points80 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 5556, representative 10949.
def source81 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B023.Data.entryAt ⟨29, by decide +kernel⟩

def target81 : Weights.Entry :=
  { word := [8, 8, 2, 10, 2, 8, 8], weights := [0, 1, 1, 0] }

-- Period 10, original row 5563, representative 10966.
def source82 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B023.Data.entryAt ⟨46, by decide +kernel⟩

def target82 : Weights.Entry :=
  { word := [8, 8, 2, 10, 10, 0, 8], weights := [0, 1, 0, 0] }

def points82 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 5570, representative 10948.
def source83 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B023.Data.entryAt ⟨28, by decide +kernel⟩

def target83 : Weights.Entry :=
  { word := [8, 8, 2, 10, 10, 8, 8], weights := [0, 1, 1, 0] }

-- Period 10, original row 5575, representative 10976.
def source84 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B023.Data.entryAt ⟨56, by decide +kernel⟩

def target84 : Weights.Entry :=
  { word := [8, 8, 4, 2, 0, 1, 8], weights := [0, 1, 0, 1] }

def points84 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 5577, representative 10976.
def source85 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B023.Data.entryAt ⟨56, by decide +kernel⟩

def target85 : Weights.Entry :=
  { word := [8, 8, 4, 2, 0, 2, 8], weights := [0, 1, 0, 1] }

def points85 : List (ℕ × ℕ) := [(0, 7), (1, 9), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 5591, representative 10977.
def source86 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B023.Data.entryAt ⟨57, by decide +kernel⟩

def target86 : Weights.Entry :=
  { word := [8, 8, 4, 2, 8, 2, 8], weights := [0, 1, 0, 1] }

def points86 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 5597, representative 10954.
def source87 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B023.Data.entryAt ⟨34, by decide +kernel⟩

def target87 : Weights.Entry :=
  { word := [8, 8, 4, 4, 4, 0, 8], weights := [1, 0, 0, 1] }

def points87 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 5599, representative 10942.
def source88 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B023.Data.entryAt ⟨22, by decide +kernel⟩

def target88 : Weights.Entry :=
  { word := [8, 8, 4, 4, 4, 8, 8], weights := [1, 0, 0, 1] }

def points88 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 5601, representative 10955.
def source89 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B023.Data.entryAt ⟨35, by decide +kernel⟩

def target89 : Weights.Entry :=
  { word := [8, 8, 4, 4, 12, 0, 8], weights := [1, 0, 0, 1] }

def points89 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 5603, representative 10943.
def source90 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B023.Data.entryAt ⟨23, by decide +kernel⟩

def target90 : Weights.Entry :=
  { word := [8, 8, 4, 4, 12, 8, 8], weights := [1, 0, 0, 1] }

-- Period 10, original row 5609, representative 10933.
def source91 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B023.Data.entryAt ⟨13, by decide +kernel⟩

def target91 : Weights.Entry :=
  { word := [8, 8, 4, 8, 4, 2, 8], weights := [0, 1, 1, 0] }

def points91 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 5613, representative 10931.
def source92 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B023.Data.entryAt ⟨11, by decide +kernel⟩

def target92 : Weights.Entry :=
  { word := [8, 8, 4, 8, 12, 2, 8], weights := [0, 1, 1, 0] }

def points92 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 5616, representative 10983.
def source93 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B023.Data.entryAt ⟨63, by decide +kernel⟩

def target93 : Weights.Entry :=
  { word := [8, 8, 4, 10, 0, 1, 8], weights := [0, 1, 0, 1] }

def points93 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 5617, representative 10983.
def source94 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B023.Data.entryAt ⟨63, by decide +kernel⟩

def target94 : Weights.Entry :=
  { word := [8, 8, 4, 10, 0, 2, 8], weights := [0, 1, 0, 1] }

def points94 : List (ℕ × ℕ) := [(0, 7), (1, 9), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 5627, representative 10980.
def source95 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B023.Data.entryAt ⟨60, by decide +kernel⟩

def target95 : Weights.Entry :=
  { word := [8, 8, 4, 10, 8, 2, 8], weights := [0, 1, 0, 1] }

def points95 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 5635, representative 10961.
def source96 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B023.Data.entryAt ⟨41, by decide +kernel⟩

def target96 : Weights.Entry :=
  { word := [8, 8, 4, 12, 4, 0, 8], weights := [1, 0, 0, 1] }

def points96 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 5637, representative 10949.
def source97 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B023.Data.entryAt ⟨29, by decide +kernel⟩

def target97 : Weights.Entry :=
  { word := [8, 8, 4, 12, 4, 8, 8], weights := [0, 1, 1, 0] }

def points97 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 5638, representative 10958.
def source98 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B023.Data.entryAt ⟨38, by decide +kernel⟩

def target98 : Weights.Entry :=
  { word := [8, 8, 4, 12, 12, 0, 8], weights := [0, 1, 1, 0] }

def points98 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 5640, representative 10946.
def source99 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B023.Data.entryAt ⟨26, by decide +kernel⟩

def target99 : Weights.Entry :=
  { word := [8, 8, 4, 12, 12, 8, 8], weights := [0, 1, 1, 0] }

-- Period 10, original row 5645, representative 10938.
def source100 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B023.Data.entryAt ⟨18, by decide +kernel⟩

def target100 : Weights.Entry :=
  { word := [8, 8, 6, 2, 0, 8, 8], weights := [1, 0, 0, 1] }

def points100 : List (ℕ × ℕ) := [(0, 9), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 5653, representative 10939.
def source101 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B023.Data.entryAt ⟨19, by decide +kernel⟩

def target101 : Weights.Entry :=
  { word := [8, 8, 6, 2, 8, 8, 8], weights := [1, 0, 0, 1] }

-- Period 10, original row 5660, representative 10941.
def source102 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B023.Data.entryAt ⟨21, by decide +kernel⟩

def target102 : Weights.Entry :=
  { word := [8, 8, 6, 10, 0, 8, 8], weights := [1, 0, 0, 1] }

def points102 : List (ℕ × ℕ) := [(0, 9), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 5667, representative 10940.
def source103 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B023.Data.entryAt ⟨20, by decide +kernel⟩

def target103 : Weights.Entry :=
  { word := [8, 8, 6, 10, 8, 8, 8], weights := [0, 1, 1, 0] }

-- Period 10, original row 5672, representative 10937.
def source104 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B023.Data.entryAt ⟨17, by decide +kernel⟩

def target104 : Weights.Entry :=
  { word := [8, 8, 8, 1, 4, 2, 8], weights := [1, 2, 1, 0] }

def points104 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 5678, representative 10935.
def source105 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B023.Data.entryAt ⟨15, by decide +kernel⟩

def target105 : Weights.Entry :=
  { word := [8, 8, 8, 1, 12, 2, 8], weights := [1, 2, 1, 0] }

def points105 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 5684, representative 10973.
def source106 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B023.Data.entryAt ⟨53, by decide +kernel⟩

def target106 : Weights.Entry :=
  { word := [8, 8, 8, 2, 2, 2, 8], weights := [0, 1, 0, 1] }

def points106 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 5688, representative 10970.
def source107 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B023.Data.entryAt ⟨50, by decide +kernel⟩

def target107 : Weights.Entry :=
  { word := [8, 8, 8, 2, 10, 2, 8], weights := [0, 1, 0, 1] }

def points107 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 5696, representative 10951.
def source108 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B023.Data.entryAt ⟨31, by decide +kernel⟩

def target108 : Weights.Entry :=
  { word := [8, 8, 8, 4, 6, 0, 8], weights := [1, 0, 0, 1] }

def points108 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 5698, representative 10939.
def source109 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B023.Data.entryAt ⟨19, by decide +kernel⟩

def target109 : Weights.Entry :=
  { word := [8, 8, 8, 4, 6, 8, 8], weights := [1, 0, 0, 1] }

def points109 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 5709, representative 10929.
def source110 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B023.Data.entryAt ⟨9, by decide +kernel⟩

def target110 : Weights.Entry :=
  { word := [8, 8, 8, 8, 6, 2, 8], weights := [0, 1, 1, 0] }

def points110 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 5721, representative 10974.
def source111 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B023.Data.entryAt ⟨54, by decide +kernel⟩

def target111 : Weights.Entry :=
  { word := [8, 8, 8, 10, 2, 2, 8], weights := [0, 1, 0, 1] }

def points111 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 5723, representative 10971.
def source112 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B023.Data.entryAt ⟨51, by decide +kernel⟩

def target112 : Weights.Entry :=
  { word := [8, 8, 8, 10, 10, 2, 8], weights := [0, 1, 0, 1] }

def points112 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 5729, representative 10952.
def source113 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B023.Data.entryAt ⟨32, by decide +kernel⟩

def target113 : Weights.Entry :=
  { word := [8, 8, 8, 12, 6, 0, 8], weights := [0, 1, 1, 0] }

def points113 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 5731, representative 10940.
def source114 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B023.Data.entryAt ⟨20, by decide +kernel⟩

def target114 : Weights.Entry :=
  { word := [8, 8, 8, 12, 6, 8, 8], weights := [0, 1, 1, 0] }

def points114 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 5756, representative 10943.
def source115 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B023.Data.entryAt ⟨23, by decide +kernel⟩

def target115 : Weights.Entry :=
  { word := [8, 8, 10, 2, 2, 8, 8], weights := [1, 0, 0, 1] }

def points115 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 5764, representative 10944.
def source116 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B023.Data.entryAt ⟨24, by decide +kernel⟩

def target116 : Weights.Entry :=
  { word := [8, 8, 10, 2, 10, 8, 8], weights := [1, 0, 0, 1] }

-- Period 10, original row 5771, representative 10946.
def source117 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B023.Data.entryAt ⟨26, by decide +kernel⟩

def target117 : Weights.Entry :=
  { word := [8, 8, 10, 10, 2, 8, 8], weights := [0, 1, 1, 0] }

def points117 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 5778, representative 10945.
def source118 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B023.Data.entryAt ⟨25, by decide +kernel⟩

def target118 : Weights.Entry :=
  { word := [8, 8, 10, 10, 10, 8, 8], weights := [0, 1, 1, 0] }

-- Period 10, original row 5783, representative 10981.
def source119 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B023.Data.entryAt ⟨61, by decide +kernel⟩

def target119 : Weights.Entry :=
  { word := [8, 8, 12, 2, 0, 1, 8], weights := [0, 1, 0, 1] }

def points119 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 5785, representative 10981.
def source120 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B023.Data.entryAt ⟨61, by decide +kernel⟩

def target120 : Weights.Entry :=
  { word := [8, 8, 12, 2, 0, 2, 8], weights := [0, 1, 0, 1] }

def points120 : List (ℕ × ℕ) := [(0, 7), (1, 9), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 5799, representative 10978.
def source121 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B023.Data.entryAt ⟨58, by decide +kernel⟩

def target121 : Weights.Entry :=
  { word := [8, 8, 12, 2, 8, 2, 8], weights := [0, 1, 0, 1] }

def points121 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 5805, representative 10959.
def source122 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B023.Data.entryAt ⟨39, by decide +kernel⟩

def target122 : Weights.Entry :=
  { word := [8, 8, 12, 4, 4, 0, 8], weights := [1, 0, 0, 1] }

def points122 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 5807, representative 10947.
def source123 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B023.Data.entryAt ⟨27, by decide +kernel⟩

def target123 : Weights.Entry :=
  { word := [8, 8, 12, 4, 4, 8, 8], weights := [1, 0, 0, 1] }

def points123 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 5809, representative 10956.
def source124 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B023.Data.entryAt ⟨36, by decide +kernel⟩

def target124 : Weights.Entry :=
  { word := [8, 8, 12, 4, 12, 0, 8], weights := [1, 0, 0, 1] }

def points124 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 5811, representative 10944.
def source125 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B023.Data.entryAt ⟨24, by decide +kernel⟩

def target125 : Weights.Entry :=
  { word := [8, 8, 12, 4, 12, 8, 8], weights := [1, 0, 0, 1] }

def points125 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 5816, representative 10932.
def source126 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B023.Data.entryAt ⟨12, by decide +kernel⟩

def target126 : Weights.Entry :=
  { word := [8, 8, 12, 8, 4, 2, 8], weights := [0, 1, 1, 0] }

def points126 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 5820, representative 10930.
def source127 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B023.Data.entryAt ⟨10, by decide +kernel⟩

def target127 : Weights.Entry :=
  { word := [8, 8, 12, 8, 12, 2, 8], weights := [0, 1, 1, 0] }

def points127 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

def period10Entries : List Weights.Entry := [target0, target1, target2, target3, target4, target5, target6, target7, target8, target9, target10, target11, target12, target13, target14, target15, target16, target17, target18, target19, target20, target21, target22, target23, target24, target25, target26, target27, target28, target29, target30, target31, target32, target33, target34, target35, target36, target37, target38, target39, target40, target41, target42, target43, target44, target45, target46, target47, target48, target49, target50, target51, target52, target53, target54, target55, target56, target57, target58, target59, target60, target61, target62, target63, target64, target65, target66, target67, target68, target69, target70, target71, target72, target73, target74, target75, target76, target77, target78, target79, target80, target81, target82, target83, target84, target85, target86, target87, target88, target89, target90, target91, target92, target93, target94, target95, target96, target97, target98, target99, target100, target101, target102, target103, target104, target105, target106, target107, target108, target109, target110, target111, target112, target113, target114, target115, target116, target117, target118, target119, target120, target121, target122, target123, target124, target125, target126, target127]

def period10Chunk : RowCoverage.Chunk where
  rows := [⟨4114, target0⟩, ⟨4132, target1⟩, ⟨4154, target2⟩, ⟨4168, target3⟩, ⟨4190, target4⟩, ⟨4206, target5⟩, ⟨4221, target6⟩, ⟨4235, target7⟩, ⟨4249, target8⟩, ⟨4266, target9⟩, ⟨4268, target10⟩, ⟨4274, target11⟩, ⟨4278, target12⟩, ⟨4284, target13⟩, ⟨4297, target14⟩, ⟨4298, target15⟩, ⟨4309, target16⟩, ⟨4314, target17⟩, ⟨4319, target18⟩, ⟨4327, target19⟩, ⟨4334, target20⟩, ⟨4341, target21⟩, ⟨4400, target22⟩, ⟨4408, target23⟩, ⟨4415, target24⟩, ⟨4422, target25⟩, ⟨4439, target26⟩, ⟨4441, target27⟩, ⟨4447, target28⟩, ⟨4451, target29⟩, ⟨4456, target30⟩, ⟨4473, target31⟩, ⟨4474, target32⟩, ⟨4485, target33⟩, ⟨4490, target34⟩, ⟨5011, target35⟩, ⟨5033, target36⟩, ⟨5047, target37⟩, ⟨5069, target38⟩, ⟨5075, target39⟩, ⟨5078, target40⟩, ⟨5082, target41⟩, ⟨5086, target42⟩, ⟨5090, target43⟩, ⟨5094, target44⟩, ⟨5106, target45⟩, ⟨5120, target46⟩, ⟨5134, target47⟩, ⟨5148, target48⟩, ⟨5154, target49⟩, ⟨5166, target50⟩, ⟨5192, target51⟩, ⟨5208, target52⟩, ⟨5234, target53⟩, ⟨5242, target54⟩, ⟨5245, target55⟩, ⟨5248, target56⟩, ⟨5251, target57⟩, ⟨5256, target58⟩, ⟨5270, target59⟩, ⟨5277, target60⟩, ⟨5291, target61⟩, ⟨5318, target62⟩, ⟨5324, target63⟩, ⟨5330, target64⟩, ⟨5334, target65⟩, ⟨5356, target66⟩, ⟨5358, target67⟩, ⟨5393, target68⟩, ⟨5395, target69⟩, ⟨5419, target70⟩, ⟨5421, target71⟩, ⟨5447, target72⟩, ⟨5469, target73⟩, ⟨5483, target74⟩, ⟨5505, target75⟩, ⟨5519, target76⟩, ⟨5527, target77⟩, ⟨5534, target78⟩, ⟨5542, target79⟩, ⟨5549, target80⟩, ⟨5556, target81⟩, ⟨5563, target82⟩, ⟨5570, target83⟩, ⟨5575, target84⟩, ⟨5577, target85⟩, ⟨5591, target86⟩, ⟨5597, target87⟩, ⟨5599, target88⟩, ⟨5601, target89⟩, ⟨5603, target90⟩, ⟨5609, target91⟩, ⟨5613, target92⟩, ⟨5616, target93⟩, ⟨5617, target94⟩, ⟨5627, target95⟩, ⟨5635, target96⟩, ⟨5637, target97⟩, ⟨5638, target98⟩, ⟨5640, target99⟩, ⟨5645, target100⟩, ⟨5653, target101⟩, ⟨5660, target102⟩, ⟨5667, target103⟩, ⟨5672, target104⟩, ⟨5678, target105⟩, ⟨5684, target106⟩, ⟨5688, target107⟩, ⟨5696, target108⟩, ⟨5698, target109⟩, ⟨5709, target110⟩, ⟨5721, target111⟩, ⟨5723, target112⟩, ⟨5729, target113⟩, ⟨5731, target114⟩, ⟨5756, target115⟩, ⟨5764, target116⟩, ⟨5771, target117⟩, ⟨5778, target118⟩, ⟨5783, target119⟩, ⟨5785, target120⟩, ⟨5799, target121⟩, ⟨5805, target122⟩, ⟨5807, target123⟩, ⟨5809, target124⟩, ⟨5811, target125⟩, ⟨5816, target126⟩, ⟨5820, target127⟩]
  indexMask := 1051871999799993678423526433858719276115875842084110350810859217769559503626338207759375173182953222941250180915434430107792378945552831749212643573808270718472176351280244458300110029053596893713963697887559073979669691099123163302736156655262535522735183445516569337340859334990494217658292004558383155979258656440503641444864353542358943512853592432823877317896949739657302726033025584613297701188885887233734413324938080578357395677609644212767022669082016712205244445774321320650378978039089167335241217711763973425904134269467394052771678861811297832403757219190812131979460052728984267842702526800103538074919164766039867850719720379862285767947722946961142680444652867763840969456808832864097444651414103235541497114251711363233919714669952435900648381028673425246208490162837287174238927790940930795130924790081364206187311041727784788637380197928844531861697890126993167612280011505273595329884918841847565271230323088703640185288941729883625868797207673440747575170882968752207827574765479076275224247155571101613926979292086547825825175951666867442290177459855347621670132644853322335127099799558991910500177794599671995772277586335908949745578512392894424922727005451766101002908577716468320977050332027722639929078404645536274851671441370413309139969733973195634440468874626522398163897009714506583046246780032256399614139488507357335425093298184926085082836967065723272729599089380316799470390429873894177960847754864635500037355062983209510768784792269285404754583637942591630921460066283128176257104444310362846942337181711915333047847580815545258769957056834680627521172508923587633282643834896758684064015158074236684911674769830574873274398758184880816882473440031801477931501778491114711159045426769175996241272549116170578411126784
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

end FranklSmallCyclic.TransportBatches.G101.B000.Data
