module

public import Conjectures.FranklSmallCyclicRowCoverage
public import Conjectures.FranklSmallCyclicCanonicalWords
public import Conjectures.FranklSmallCyclicOrbit10Block024Data

/-! 128 literal targets sharing one source proof block.
Original words and row indices are retained; weights may be transported.
-/
@[expose] public section

namespace FranklSmallCyclic.TransportBatches.G102.B000.Data

-- Period 10, original row 4100, representative 10984.
def source0 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B024.Data.entryAt ⟨0, by decide +kernel⟩

def target0 : Weights.Entry :=
  { word := [8, 0, 0, 2, 2, 2, 8], weights := [1, 0, 0, 1] }

-- Period 10, original row 4103, representative 11017.
def source1 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B024.Data.entryAt ⟨33, by decide +kernel⟩

def target1 : Weights.Entry :=
  { word := [8, 0, 0, 6, 2, 0, 8], weights := [1, 1, 0, 0] }

-- Period 10, original row 4104, representative 11006.
def source2 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B024.Data.entryAt ⟨22, by decide +kernel⟩

def target2 : Weights.Entry :=
  { word := [8, 0, 0, 6, 2, 8, 8], weights := [1, 0, 1, 0] }

-- Period 10, original row 4113, representative 10989.
def source3 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B024.Data.entryAt ⟨5, by decide +kernel⟩

def target3 : Weights.Entry :=
  { word := [8, 0, 0, 10, 2, 2, 8], weights := [1, 0, 0, 1] }

-- Period 10, original row 4126, representative 10990.
def source4 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B024.Data.entryAt ⟨6, by decide +kernel⟩

def target4 : Weights.Entry :=
  { word := [8, 0, 1, 4, 2, 0, 8], weights := [1, 0, 1, 0] }

-- Period 10, original row 4148, representative 10995.
def source5 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B024.Data.entryAt ⟨11, by decide +kernel⟩

def target5 : Weights.Entry :=
  { word := [8, 0, 1, 4, 10, 0, 8], weights := [1, 0, 1, 0] }

-- Period 10, original row 4162, representative 10997.
def source6 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B024.Data.entryAt ⟨13, by decide +kernel⟩

def target6 : Weights.Entry :=
  { word := [8, 0, 1, 12, 2, 0, 8], weights := [1, 0, 1, 0] }

-- Period 10, original row 4184, representative 10996.
def source7 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B024.Data.entryAt ⟨12, by decide +kernel⟩

def target7 : Weights.Entry :=
  { word := [8, 0, 1, 12, 10, 0, 8], weights := [1, 0, 1, 0] }

-- Period 10, original row 4198, representative 10990.
def source8 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B024.Data.entryAt ⟨6, by decide +kernel⟩

def target8 : Weights.Entry :=
  { word := [8, 0, 2, 2, 2, 0, 8], weights := [1, 1, 0, 0] }

def points8 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 5), (5, 4), (6, 6), (7, 7), (8, 8), (9, 9)]

-- Period 10, original row 4213, representative 10995.
def source9 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B024.Data.entryAt ⟨11, by decide +kernel⟩

def target9 : Weights.Entry :=
  { word := [8, 0, 2, 2, 10, 0, 8], weights := [1, 1, 0, 0] }

def points9 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 5), (5, 4), (6, 6), (7, 7), (8, 8), (9, 9)]

-- Period 10, original row 4228, representative 10997.
def source10 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B024.Data.entryAt ⟨13, by decide +kernel⟩

def target10 : Weights.Entry :=
  { word := [8, 0, 2, 10, 2, 0, 8], weights := [1, 1, 0, 0] }

def points10 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 5), (5, 4), (6, 6), (7, 7), (8, 8), (9, 9)]

-- Period 10, original row 4242, representative 10996.
def source11 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B024.Data.entryAt ⟨12, by decide +kernel⟩

def target11 : Weights.Entry :=
  { word := [8, 0, 2, 10, 10, 0, 8], weights := [1, 1, 0, 0] }

def points11 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 5), (5, 4), (6, 6), (7, 7), (8, 8), (9, 9)]

-- Period 10, original row 4254, representative 10990.
def source12 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B024.Data.entryAt ⟨6, by decide +kernel⟩

def target12 : Weights.Entry :=
  { word := [8, 0, 4, 2, 0, 1, 8], weights := [0, 1, 0, 1] }

def points12 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 0), (9, 1)]

-- Period 10, original row 4256, representative 10990.
def source13 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B024.Data.entryAt ⟨6, by decide +kernel⟩

def target13 : Weights.Entry :=
  { word := [8, 0, 4, 2, 0, 2, 8], weights := [0, 1, 0, 1] }

def points13 : List (ℕ × ℕ) := [(0, 7), (1, 9), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 0), (9, 1)]

-- Period 10, original row 4261, representative 11013.
def source14 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B024.Data.entryAt ⟨29, by decide +kernel⟩

def target14 : Weights.Entry :=
  { word := [8, 0, 4, 2, 0, 8, 8], weights := [1, 0, 0, 1] }

-- Period 10, original row 4270, representative 10991.
def source15 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B024.Data.entryAt ⟨7, by decide +kernel⟩

def target15 : Weights.Entry :=
  { word := [8, 0, 4, 2, 8, 2, 8], weights := [1, 0, 0, 1] }

-- Period 10, original row 4276, representative 10990.
def source16 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B024.Data.entryAt ⟨6, by decide +kernel⟩

def target16 : Weights.Entry :=
  { word := [8, 0, 4, 4, 4, 0, 8], weights := [0, 0, 1, 1] }

def points16 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 4), (5, 5), (6, 3), (7, 2), (8, 0), (9, 1)]

-- Period 10, original row 4279, representative 11017.
def source17 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B024.Data.entryAt ⟨33, by decide +kernel⟩

def target17 : Weights.Entry :=
  { word := [8, 0, 4, 6, 0, 0, 8], weights := [0, 1, 0, 1] }

def points17 : List (ℕ × ℕ) := [(0, 7), (1, 8), (2, 9), (3, 6), (4, 4), (5, 5), (6, 3), (7, 2), (8, 0), (9, 1)]

-- Period 10, original row 4280, representative 11009.
def source18 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B024.Data.entryAt ⟨25, by decide +kernel⟩

def target18 : Weights.Entry :=
  { word := [8, 0, 4, 6, 0, 8, 8], weights := [0, 0, 1, 0] }

-- Period 10, original row 4281, representative 11019.
def source19 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B024.Data.entryAt ⟨35, by decide +kernel⟩

def target19 : Weights.Entry :=
  { word := [8, 0, 4, 6, 8, 0, 8], weights := [0, 1, 0, 0] }

-- Period 10, original row 4282, representative 11010.
def source20 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B024.Data.entryAt ⟨26, by decide +kernel⟩

def target20 : Weights.Entry :=
  { word := [8, 0, 4, 6, 8, 8, 8], weights := [0, 0, 1, 0] }

-- Period 10, original row 4287, representative 10997.
def source21 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B024.Data.entryAt ⟨13, by decide +kernel⟩

def target21 : Weights.Entry :=
  { word := [8, 0, 4, 10, 0, 1, 8], weights := [0, 1, 0, 1] }

def points21 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 0), (9, 1)]

-- Period 10, original row 4288, representative 10997.
def source22 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B024.Data.entryAt ⟨13, by decide +kernel⟩

def target22 : Weights.Entry :=
  { word := [8, 0, 4, 10, 0, 2, 8], weights := [0, 1, 0, 1] }

def points22 : List (ℕ × ℕ) := [(0, 7), (1, 9), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 0), (9, 1)]

-- Period 10, original row 4293, representative 11016.
def source23 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B024.Data.entryAt ⟨32, by decide +kernel⟩

def target23 : Weights.Entry :=
  { word := [8, 0, 4, 10, 0, 8, 8], weights := [1, 0, 0, 1] }

-- Period 10, original row 4304, representative 10994.
def source24 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B024.Data.entryAt ⟨10, by decide +kernel⟩

def target24 : Weights.Entry :=
  { word := [8, 0, 4, 10, 8, 2, 8], weights := [0, 1, 1, 0] }

-- Period 10, original row 4312, representative 10997.
def source25 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B024.Data.entryAt ⟨13, by decide +kernel⟩

def target25 : Weights.Entry :=
  { word := [8, 0, 4, 12, 4, 0, 8], weights := [0, 0, 1, 1] }

def points25 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 4), (5, 5), (6, 3), (7, 2), (8, 0), (9, 1)]

-- Period 10, original row 4348, representative 10987.
def source26 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B024.Data.entryAt ⟨3, by decide +kernel⟩

def target26 : Weights.Entry :=
  { word := [8, 0, 8, 2, 2, 2, 8], weights := [1, 0, 0, 1] }

-- Period 10, original row 4352, representative 10985.
def source27 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B024.Data.entryAt ⟨1, by decide +kernel⟩

def target27 : Weights.Entry :=
  { word := [8, 0, 8, 2, 10, 2, 8], weights := [1, 0, 0, 1] }

-- Period 10, original row 4359, representative 11019.
def source28 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B024.Data.entryAt ⟨35, by decide +kernel⟩

def target28 : Weights.Entry :=
  { word := [8, 0, 8, 6, 2, 0, 8], weights := [0, 1, 0, 0] }

def points28 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 4), (5, 5), (6, 3), (7, 2), (8, 0), (9, 1)]

-- Period 10, original row 4360, representative 11008.
def source29 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B024.Data.entryAt ⟨24, by decide +kernel⟩

def target29 : Weights.Entry :=
  { word := [8, 0, 8, 6, 2, 8, 8], weights := [0, 0, 1, 0] }

-- Period 10, original row 4361, representative 11018.
def source30 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B024.Data.entryAt ⟨34, by decide +kernel⟩

def target30 : Weights.Entry :=
  { word := [8, 0, 8, 6, 10, 0, 8], weights := [0, 1, 0, 0] }

-- Period 10, original row 4362, representative 11007.
def source31 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B024.Data.entryAt ⟨23, by decide +kernel⟩

def target31 : Weights.Entry :=
  { word := [8, 0, 8, 6, 10, 8, 8], weights := [0, 0, 1, 0] }

-- Period 10, original row 4372, representative 10988.
def source32 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B024.Data.entryAt ⟨4, by decide +kernel⟩

def target32 : Weights.Entry :=
  { word := [8, 0, 8, 10, 2, 2, 8], weights := [0, 1, 1, 0] }

-- Period 10, original row 4374, representative 10986.
def source33 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B024.Data.entryAt ⟨2, by decide +kernel⟩

def target33 : Weights.Entry :=
  { word := [8, 0, 8, 10, 10, 2, 8], weights := [0, 1, 1, 0] }

-- Period 10, original row 4427, representative 10995.
def source34 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B024.Data.entryAt ⟨11, by decide +kernel⟩

def target34 : Weights.Entry :=
  { word := [8, 0, 12, 2, 0, 1, 8], weights := [0, 1, 0, 1] }

def points34 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 0), (9, 1)]

-- Period 10, original row 4429, representative 10995.
def source35 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B024.Data.entryAt ⟨11, by decide +kernel⟩

def target35 : Weights.Entry :=
  { word := [8, 0, 12, 2, 0, 2, 8], weights := [0, 1, 0, 1] }

def points35 : List (ℕ × ℕ) := [(0, 7), (1, 9), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 0), (9, 1)]

-- Period 10, original row 4434, representative 11014.
def source36 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B024.Data.entryAt ⟨30, by decide +kernel⟩

def target36 : Weights.Entry :=
  { word := [8, 0, 12, 2, 0, 8, 8], weights := [1, 0, 0, 1] }

-- Period 10, original row 4443, representative 10992.
def source37 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B024.Data.entryAt ⟨8, by decide +kernel⟩

def target37 : Weights.Entry :=
  { word := [8, 0, 12, 2, 8, 2, 8], weights := [1, 0, 0, 1] }

-- Period 10, original row 4449, representative 10995.
def source38 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B024.Data.entryAt ⟨11, by decide +kernel⟩

def target38 : Weights.Entry :=
  { word := [8, 0, 12, 4, 4, 0, 8], weights := [0, 0, 1, 1] }

def points38 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 4), (5, 5), (6, 3), (7, 2), (8, 0), (9, 1)]

-- Period 10, original row 4452, representative 11012.
def source39 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B024.Data.entryAt ⟨28, by decide +kernel⟩

def target39 : Weights.Entry :=
  { word := [8, 0, 12, 6, 0, 8, 8], weights := [0, 0, 1, 0] }

-- Period 10, original row 4453, representative 11018.
def source40 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B024.Data.entryAt ⟨34, by decide +kernel⟩

def target40 : Weights.Entry :=
  { word := [8, 0, 12, 6, 8, 0, 8], weights := [0, 1, 0, 0] }

def points40 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 4), (5, 5), (6, 3), (7, 2), (8, 0), (9, 1)]

-- Period 10, original row 4454, representative 11011.
def source41 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B024.Data.entryAt ⟨27, by decide +kernel⟩

def target41 : Weights.Entry :=
  { word := [8, 0, 12, 6, 8, 8, 8], weights := [0, 0, 1, 0] }

-- Period 10, original row 4459, representative 10996.
def source42 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B024.Data.entryAt ⟨12, by decide +kernel⟩

def target42 : Weights.Entry :=
  { word := [8, 0, 12, 10, 0, 1, 8], weights := [0, 1, 0, 1] }

def points42 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 0), (9, 1)]

-- Period 10, original row 4460, representative 10996.
def source43 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B024.Data.entryAt ⟨12, by decide +kernel⟩

def target43 : Weights.Entry :=
  { word := [8, 0, 12, 10, 0, 2, 8], weights := [0, 1, 0, 1] }

def points43 : List (ℕ × ℕ) := [(0, 7), (1, 9), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 0), (9, 1)]

-- Period 10, original row 4469, representative 11015.
def source44 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B024.Data.entryAt ⟨31, by decide +kernel⟩

def target44 : Weights.Entry :=
  { word := [8, 0, 12, 10, 0, 8, 8], weights := [1, 0, 0, 1] }

-- Period 10, original row 4480, representative 10993.
def source45 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B024.Data.entryAt ⟨9, by decide +kernel⟩

def target45 : Weights.Entry :=
  { word := [8, 0, 12, 10, 8, 2, 8], weights := [0, 1, 1, 0] }

-- Period 10, original row 4488, representative 10996.
def source46 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B024.Data.entryAt ⟨12, by decide +kernel⟩

def target46 : Weights.Entry :=
  { word := [8, 0, 12, 12, 4, 0, 8], weights := [0, 0, 1, 1] }

def points46 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 4), (5, 5), (6, 3), (7, 2), (8, 0), (9, 1)]

-- Period 10, original row 5005, representative 10990.
def source47 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B024.Data.entryAt ⟨6, by decide +kernel⟩

def target47 : Weights.Entry :=
  { word := [8, 4, 0, 4, 2, 0, 8], weights := [1, 0, 1, 0] }

def points47 : List (ℕ × ℕ) := [(0, 0), (1, 2), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8), (9, 9)]

-- Period 10, original row 5027, representative 10995.
def source48 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B024.Data.entryAt ⟨11, by decide +kernel⟩

def target48 : Weights.Entry :=
  { word := [8, 4, 0, 4, 10, 0, 8], weights := [1, 0, 1, 0] }

def points48 : List (ℕ × ℕ) := [(0, 0), (1, 2), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8), (9, 9)]

-- Period 10, original row 5041, representative 10997.
def source49 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B024.Data.entryAt ⟨13, by decide +kernel⟩

def target49 : Weights.Entry :=
  { word := [8, 4, 0, 12, 2, 0, 8], weights := [1, 0, 1, 0] }

def points49 : List (ℕ × ℕ) := [(0, 0), (1, 2), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8), (9, 9)]

-- Period 10, original row 5063, representative 10996.
def source50 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B024.Data.entryAt ⟨12, by decide +kernel⟩

def target50 : Weights.Entry :=
  { word := [8, 4, 0, 12, 10, 0, 8], weights := [1, 0, 1, 0] }

def points50 : List (ℕ × ℕ) := [(0, 0), (1, 2), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8), (9, 9)]

-- Period 10, original row 5099, representative 10984.
def source51 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B024.Data.entryAt ⟨0, by decide +kernel⟩

def target51 : Weights.Entry :=
  { word := [8, 4, 4, 4, 0, 0, 8], weights := [1, 0, 0, 1] }

def points51 : List (ℕ × ℕ) := [(0, 7), (1, 8), (2, 9), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 5113, representative 10987.
def source52 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B024.Data.entryAt ⟨3, by decide +kernel⟩

def target52 : Weights.Entry :=
  { word := [8, 4, 4, 4, 8, 0, 8], weights := [1, 0, 0, 1] }

def points52 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 5127, representative 10989.
def source53 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B024.Data.entryAt ⟨5, by decide +kernel⟩

def target53 : Weights.Entry :=
  { word := [8, 4, 4, 12, 0, 0, 8], weights := [1, 0, 0, 1] }

def points53 : List (ℕ × ℕ) := [(0, 7), (1, 8), (2, 9), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 5141, representative 10988.
def source54 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B024.Data.entryAt ⟨4, by decide +kernel⟩

def target54 : Weights.Entry :=
  { word := [8, 4, 4, 12, 8, 0, 8], weights := [0, 1, 1, 0] }

def points54 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 5160, representative 10991.
def source55 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B024.Data.entryAt ⟨7, by decide +kernel⟩

def target55 : Weights.Entry :=
  { word := [8, 4, 8, 4, 2, 0, 8], weights := [1, 0, 0, 1] }

def points55 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 5186, representative 10992.
def source56 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B024.Data.entryAt ⟨8, by decide +kernel⟩

def target56 : Weights.Entry :=
  { word := [8, 4, 8, 4, 10, 0, 8], weights := [1, 0, 0, 1] }

def points56 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 5202, representative 10994.
def source57 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B024.Data.entryAt ⟨10, by decide +kernel⟩

def target57 : Weights.Entry :=
  { word := [8, 4, 8, 12, 2, 0, 8], weights := [0, 1, 1, 0] }

def points57 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 5228, representative 10993.
def source58 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B024.Data.entryAt ⟨9, by decide +kernel⟩

def target58 : Weights.Entry :=
  { word := [8, 4, 8, 12, 10, 0, 8], weights := [0, 1, 1, 0] }

def points58 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 5263, representative 10985.
def source59 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B024.Data.entryAt ⟨1, by decide +kernel⟩

def target59 : Weights.Entry :=
  { word := [8, 4, 12, 4, 8, 0, 8], weights := [1, 0, 0, 1] }

def points59 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 5284, representative 10986.
def source60 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B024.Data.entryAt ⟨2, by decide +kernel⟩

def target60 : Weights.Entry :=
  { word := [8, 4, 12, 12, 8, 0, 8], weights := [0, 1, 1, 0] }

def points60 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 5344, representative 11013.
def source61 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B024.Data.entryAt ⟨29, by decide +kernel⟩

def target61 : Weights.Entry :=
  { word := [8, 8, 0, 4, 2, 0, 8], weights := [1, 0, 0, 1] }

def points61 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2), (9, 0)]

-- Period 10, original row 5350, representative 11002.
def source62 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B024.Data.entryAt ⟨18, by decide +kernel⟩

def target62 : Weights.Entry :=
  { word := [8, 8, 0, 4, 2, 8, 8], weights := [1, 0, 1, 0] }

-- Period 10, original row 5370, representative 11014.
def source63 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B024.Data.entryAt ⟨30, by decide +kernel⟩

def target63 : Weights.Entry :=
  { word := [8, 8, 0, 4, 10, 0, 8], weights := [1, 0, 0, 1] }

def points63 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2), (9, 0)]

-- Period 10, original row 5376, representative 11003.
def source64 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B024.Data.entryAt ⟨19, by decide +kernel⟩

def target64 : Weights.Entry :=
  { word := [8, 8, 0, 4, 10, 8, 8], weights := [1, 0, 1, 0] }

-- Period 10, original row 5381, representative 11009.
def source65 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B024.Data.entryAt ⟨25, by decide +kernel⟩

def target65 : Weights.Entry :=
  { word := [8, 8, 0, 6, 2, 0, 8], weights := [0, 1, 0, 0] }

def points65 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2), (9, 0)]

-- Period 10, original row 5382, representative 10998.
def source66 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B024.Data.entryAt ⟨14, by decide +kernel⟩

def target66 : Weights.Entry :=
  { word := [8, 8, 0, 6, 2, 8, 8], weights := [1, 0, 1, 0] }

-- Period 10, original row 5383, representative 11012.
def source67 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B024.Data.entryAt ⟨28, by decide +kernel⟩

def target67 : Weights.Entry :=
  { word := [8, 8, 0, 6, 10, 0, 8], weights := [0, 1, 0, 0] }

def points67 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2), (9, 0)]

-- Period 10, original row 5384, representative 10999.
def source68 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B024.Data.entryAt ⟨15, by decide +kernel⟩

def target68 : Weights.Entry :=
  { word := [8, 8, 0, 6, 10, 8, 8], weights := [1, 0, 1, 0] }

-- Period 10, original row 5408, representative 11016.
def source69 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B024.Data.entryAt ⟨32, by decide +kernel⟩

def target69 : Weights.Entry :=
  { word := [8, 8, 0, 12, 2, 0, 8], weights := [1, 0, 0, 1] }

def points69 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2), (9, 0)]

-- Period 10, original row 5414, representative 11005.
def source70 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B024.Data.entryAt ⟨21, by decide +kernel⟩

def target70 : Weights.Entry :=
  { word := [8, 8, 0, 12, 2, 8, 8], weights := [1, 0, 1, 0] }

-- Period 10, original row 5433, representative 11015.
def source71 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B024.Data.entryAt ⟨31, by decide +kernel⟩

def target71 : Weights.Entry :=
  { word := [8, 8, 0, 12, 10, 0, 8], weights := [1, 0, 0, 1] }

def points71 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2), (9, 0)]

-- Period 10, original row 5439, representative 11004.
def source72 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B024.Data.entryAt ⟨20, by decide +kernel⟩

def target72 : Weights.Entry :=
  { word := [8, 8, 0, 12, 10, 8, 8], weights := [1, 0, 1, 0] }

-- Period 10, original row 5582, representative 11002.
def source73 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B024.Data.entryAt ⟨18, by decide +kernel⟩

def target73 : Weights.Entry :=
  { word := [8, 8, 4, 2, 0, 8, 8], weights := [0, 1, 0, 1] }

def points73 : List (ℕ × ℕ) := [(0, 9), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 5604, representative 11006.
def source74 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B024.Data.entryAt ⟨22, by decide +kernel⟩

def target74 : Weights.Entry :=
  { word := [8, 8, 4, 6, 0, 0, 8], weights := [0, 1, 0, 1] }

def points74 : List (ℕ × ℕ) := [(0, 7), (1, 8), (2, 9), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 5605, representative 10998.
def source75 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B024.Data.entryAt ⟨14, by decide +kernel⟩

def target75 : Weights.Entry :=
  { word := [8, 8, 4, 6, 0, 8, 8], weights := [0, 1, 0, 1] }

def points75 : List (ℕ × ℕ) := [(0, 9), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 5606, representative 11008.
def source76 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B024.Data.entryAt ⟨24, by decide +kernel⟩

def target76 : Weights.Entry :=
  { word := [8, 8, 4, 6, 8, 0, 8], weights := [0, 1, 0, 0] }

def points76 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 5607, representative 11001.
def source77 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B024.Data.entryAt ⟨17, by decide +kernel⟩

def target77 : Weights.Entry :=
  { word := [8, 8, 4, 6, 8, 8, 8], weights := [1, 0, 1, 0] }

-- Period 10, original row 5621, representative 11005.
def source78 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B024.Data.entryAt ⟨21, by decide +kernel⟩

def target78 : Weights.Entry :=
  { word := [8, 8, 4, 10, 0, 8, 8], weights := [0, 1, 0, 1] }

def points78 : List (ℕ × ℕ) := [(0, 9), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 5703, representative 11010.
def source79 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B024.Data.entryAt ⟨26, by decide +kernel⟩

def target79 : Weights.Entry :=
  { word := [8, 8, 8, 6, 2, 0, 8], weights := [0, 1, 0, 0] }

def points79 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 5704, representative 11001.
def source80 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B024.Data.entryAt ⟨17, by decide +kernel⟩

def target80 : Weights.Entry :=
  { word := [8, 8, 8, 6, 2, 8, 8], weights := [0, 1, 0, 1] }

def points80 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 5705, representative 11011.
def source81 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B024.Data.entryAt ⟨27, by decide +kernel⟩

def target81 : Weights.Entry :=
  { word := [8, 8, 8, 6, 10, 0, 8], weights := [0, 1, 0, 0] }

def points81 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 5706, representative 11000.
def source82 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B024.Data.entryAt ⟨16, by decide +kernel⟩

def target82 : Weights.Entry :=
  { word := [8, 8, 8, 6, 10, 8, 8], weights := [1, 0, 1, 0] }

-- Period 10, original row 5790, representative 11003.
def source83 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B024.Data.entryAt ⟨19, by decide +kernel⟩

def target83 : Weights.Entry :=
  { word := [8, 8, 12, 2, 0, 8, 8], weights := [0, 1, 0, 1] }

def points83 : List (ℕ × ℕ) := [(0, 9), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 5812, representative 10999.
def source84 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B024.Data.entryAt ⟨15, by decide +kernel⟩

def target84 : Weights.Entry :=
  { word := [8, 8, 12, 6, 0, 8, 8], weights := [0, 1, 0, 1] }

def points84 : List (ℕ × ℕ) := [(0, 9), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 5813, representative 11007.
def source85 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B024.Data.entryAt ⟨23, by decide +kernel⟩

def target85 : Weights.Entry :=
  { word := [8, 8, 12, 6, 8, 0, 8], weights := [0, 1, 0, 0] }

def points85 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 5814, representative 11000.
def source86 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B024.Data.entryAt ⟨16, by decide +kernel⟩

def target86 : Weights.Entry :=
  { word := [8, 8, 12, 6, 8, 8, 8], weights := [0, 1, 0, 1] }

def points86 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 5828, representative 11004.
def source87 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B024.Data.entryAt ⟨20, by decide +kernel⟩

def target87 : Weights.Entry :=
  { word := [8, 8, 12, 10, 0, 8, 8], weights := [0, 1, 0, 1] }

def points87 : List (ℕ × ℕ) := [(0, 9), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 6628, representative 10990.
def source88 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B024.Data.entryAt ⟨6, by decide +kernel⟩

def target88 : Weights.Entry :=
  { word := [9, 0, 1, 4, 2, 0, 8], weights := [1, 0, 1, 0] }

def points88 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8), (9, 9)]

-- Period 10, original row 6650, representative 10995.
def source89 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B024.Data.entryAt ⟨11, by decide +kernel⟩

def target89 : Weights.Entry :=
  { word := [9, 0, 1, 4, 10, 0, 8], weights := [1, 0, 1, 0] }

def points89 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8), (9, 9)]

-- Period 10, original row 6664, representative 10997.
def source90 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B024.Data.entryAt ⟨13, by decide +kernel⟩

def target90 : Weights.Entry :=
  { word := [9, 0, 1, 12, 2, 0, 8], weights := [1, 0, 1, 0] }

def points90 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8), (9, 9)]

-- Period 10, original row 6686, representative 10996.
def source91 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B024.Data.entryAt ⟨12, by decide +kernel⟩

def target91 : Weights.Entry :=
  { word := [9, 0, 1, 12, 10, 0, 8], weights := [1, 0, 1, 0] }

def points91 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8), (9, 9)]

-- Period 10, original row 6700, representative 10990.
def source92 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B024.Data.entryAt ⟨6, by decide +kernel⟩

def target92 : Weights.Entry :=
  { word := [9, 0, 2, 2, 2, 0, 8], weights := [1, 1, 0, 0] }

def points92 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 5), (5, 4), (6, 6), (7, 7), (8, 8), (9, 9)]

-- Period 10, original row 6715, representative 10995.
def source93 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B024.Data.entryAt ⟨11, by decide +kernel⟩

def target93 : Weights.Entry :=
  { word := [9, 0, 2, 2, 10, 0, 8], weights := [1, 1, 0, 0] }

def points93 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 5), (5, 4), (6, 6), (7, 7), (8, 8), (9, 9)]

-- Period 10, original row 6730, representative 10997.
def source94 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B024.Data.entryAt ⟨13, by decide +kernel⟩

def target94 : Weights.Entry :=
  { word := [9, 0, 2, 10, 2, 0, 8], weights := [1, 1, 0, 0] }

def points94 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 5), (5, 4), (6, 6), (7, 7), (8, 8), (9, 9)]

-- Period 10, original row 6744, representative 10996.
def source95 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B024.Data.entryAt ⟨12, by decide +kernel⟩

def target95 : Weights.Entry :=
  { word := [9, 0, 2, 10, 10, 0, 8], weights := [1, 1, 0, 0] }

def points95 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 5), (5, 4), (6, 6), (7, 7), (8, 8), (9, 9)]

-- Period 10, original row 6756, representative 10990.
def source96 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B024.Data.entryAt ⟨6, by decide +kernel⟩

def target96 : Weights.Entry :=
  { word := [9, 0, 4, 2, 0, 1, 8], weights := [0, 1, 0, 1] }

def points96 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 0), (9, 1)]

-- Period 10, original row 6758, representative 10990.
def source97 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B024.Data.entryAt ⟨6, by decide +kernel⟩

def target97 : Weights.Entry :=
  { word := [9, 0, 4, 2, 0, 2, 8], weights := [0, 1, 0, 1] }

def points97 : List (ℕ × ℕ) := [(0, 7), (1, 9), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 0), (9, 1)]

-- Period 10, original row 6763, representative 11013.
def source98 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B024.Data.entryAt ⟨29, by decide +kernel⟩

def target98 : Weights.Entry :=
  { word := [9, 0, 4, 2, 0, 8, 8], weights := [1, 0, 0, 1] }

def points98 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8), (9, 9)]

-- Period 10, original row 6772, representative 10991.
def source99 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B024.Data.entryAt ⟨7, by decide +kernel⟩

def target99 : Weights.Entry :=
  { word := [9, 0, 4, 2, 8, 2, 8], weights := [1, 0, 0, 1] }

def points99 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8), (9, 9)]

-- Period 10, original row 6778, representative 10990.
def source100 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B024.Data.entryAt ⟨6, by decide +kernel⟩

def target100 : Weights.Entry :=
  { word := [9, 0, 4, 4, 4, 0, 8], weights := [0, 0, 1, 1] }

def points100 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 4), (5, 5), (6, 3), (7, 2), (8, 0), (9, 1)]

-- Period 10, original row 6781, representative 11017.
def source101 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B024.Data.entryAt ⟨33, by decide +kernel⟩

def target101 : Weights.Entry :=
  { word := [9, 0, 4, 6, 0, 0, 8], weights := [0, 1, 0, 1] }

def points101 : List (ℕ × ℕ) := [(0, 7), (1, 8), (2, 9), (3, 6), (4, 4), (5, 5), (6, 3), (7, 2), (8, 0), (9, 1)]

-- Period 10, original row 6782, representative 11009.
def source102 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B024.Data.entryAt ⟨25, by decide +kernel⟩

def target102 : Weights.Entry :=
  { word := [9, 0, 4, 6, 0, 8, 8], weights := [0, 0, 1, 0] }

def points102 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8), (9, 9)]

-- Period 10, original row 6783, representative 11019.
def source103 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B024.Data.entryAt ⟨35, by decide +kernel⟩

def target103 : Weights.Entry :=
  { word := [9, 0, 4, 6, 8, 0, 8], weights := [0, 1, 0, 0] }

def points103 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8), (9, 9)]

-- Period 10, original row 6784, representative 11010.
def source104 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B024.Data.entryAt ⟨26, by decide +kernel⟩

def target104 : Weights.Entry :=
  { word := [9, 0, 4, 6, 8, 8, 8], weights := [0, 0, 1, 0] }

def points104 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8), (9, 9)]

-- Period 10, original row 6789, representative 10997.
def source105 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B024.Data.entryAt ⟨13, by decide +kernel⟩

def target105 : Weights.Entry :=
  { word := [9, 0, 4, 10, 0, 1, 8], weights := [0, 1, 0, 1] }

def points105 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 0), (9, 1)]

-- Period 10, original row 6790, representative 10997.
def source106 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B024.Data.entryAt ⟨13, by decide +kernel⟩

def target106 : Weights.Entry :=
  { word := [9, 0, 4, 10, 0, 2, 8], weights := [0, 1, 0, 1] }

def points106 : List (ℕ × ℕ) := [(0, 7), (1, 9), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 0), (9, 1)]

-- Period 10, original row 6795, representative 11016.
def source107 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B024.Data.entryAt ⟨32, by decide +kernel⟩

def target107 : Weights.Entry :=
  { word := [9, 0, 4, 10, 0, 8, 8], weights := [1, 0, 0, 1] }

def points107 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8), (9, 9)]

-- Period 10, original row 6806, representative 10994.
def source108 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B024.Data.entryAt ⟨10, by decide +kernel⟩

def target108 : Weights.Entry :=
  { word := [9, 0, 4, 10, 8, 2, 8], weights := [0, 1, 1, 0] }

def points108 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8), (9, 9)]

-- Period 10, original row 6814, representative 10997.
def source109 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B024.Data.entryAt ⟨13, by decide +kernel⟩

def target109 : Weights.Entry :=
  { word := [9, 0, 4, 12, 4, 0, 8], weights := [0, 0, 1, 1] }

def points109 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 4), (5, 5), (6, 3), (7, 2), (8, 0), (9, 1)]

-- Period 10, original row 6820, representative 10987.
def source110 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B024.Data.entryAt ⟨3, by decide +kernel⟩

def target110 : Weights.Entry :=
  { word := [9, 0, 8, 2, 2, 2, 8], weights := [1, 0, 0, 1] }

def points110 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8), (9, 9)]

-- Period 10, original row 6824, representative 10985.
def source111 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B024.Data.entryAt ⟨1, by decide +kernel⟩

def target111 : Weights.Entry :=
  { word := [9, 0, 8, 2, 10, 2, 8], weights := [1, 0, 0, 1] }

def points111 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8), (9, 9)]

-- Period 10, original row 6831, representative 11019.
def source112 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B024.Data.entryAt ⟨35, by decide +kernel⟩

def target112 : Weights.Entry :=
  { word := [9, 0, 8, 6, 2, 0, 8], weights := [0, 1, 0, 0] }

def points112 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 4), (5, 5), (6, 3), (7, 2), (8, 0), (9, 1)]

-- Period 10, original row 6832, representative 11008.
def source113 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B024.Data.entryAt ⟨24, by decide +kernel⟩

def target113 : Weights.Entry :=
  { word := [9, 0, 8, 6, 2, 8, 8], weights := [0, 0, 1, 0] }

def points113 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8), (9, 9)]

-- Period 10, original row 6833, representative 11018.
def source114 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B024.Data.entryAt ⟨34, by decide +kernel⟩

def target114 : Weights.Entry :=
  { word := [9, 0, 8, 6, 10, 0, 8], weights := [0, 1, 0, 0] }

def points114 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8), (9, 9)]

-- Period 10, original row 6834, representative 11007.
def source115 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B024.Data.entryAt ⟨23, by decide +kernel⟩

def target115 : Weights.Entry :=
  { word := [9, 0, 8, 6, 10, 8, 8], weights := [0, 0, 1, 0] }

def points115 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8), (9, 9)]

-- Period 10, original row 6844, representative 10988.
def source116 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B024.Data.entryAt ⟨4, by decide +kernel⟩

def target116 : Weights.Entry :=
  { word := [9, 0, 8, 10, 2, 2, 8], weights := [0, 1, 1, 0] }

def points116 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8), (9, 9)]

-- Period 10, original row 6846, representative 10986.
def source117 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B024.Data.entryAt ⟨2, by decide +kernel⟩

def target117 : Weights.Entry :=
  { word := [9, 0, 8, 10, 10, 2, 8], weights := [0, 1, 1, 0] }

def points117 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8), (9, 9)]

-- Period 10, original row 6899, representative 10995.
def source118 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B024.Data.entryAt ⟨11, by decide +kernel⟩

def target118 : Weights.Entry :=
  { word := [9, 0, 12, 2, 0, 1, 8], weights := [0, 1, 0, 1] }

def points118 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 0), (9, 1)]

-- Period 10, original row 6901, representative 10995.
def source119 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B024.Data.entryAt ⟨11, by decide +kernel⟩

def target119 : Weights.Entry :=
  { word := [9, 0, 12, 2, 0, 2, 8], weights := [0, 1, 0, 1] }

def points119 : List (ℕ × ℕ) := [(0, 7), (1, 9), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 0), (9, 1)]

-- Period 10, original row 6906, representative 11014.
def source120 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B024.Data.entryAt ⟨30, by decide +kernel⟩

def target120 : Weights.Entry :=
  { word := [9, 0, 12, 2, 0, 8, 8], weights := [1, 0, 0, 1] }

def points120 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8), (9, 9)]

-- Period 10, original row 6915, representative 10992.
def source121 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B024.Data.entryAt ⟨8, by decide +kernel⟩

def target121 : Weights.Entry :=
  { word := [9, 0, 12, 2, 8, 2, 8], weights := [1, 0, 0, 1] }

def points121 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8), (9, 9)]

-- Period 10, original row 6921, representative 10995.
def source122 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B024.Data.entryAt ⟨11, by decide +kernel⟩

def target122 : Weights.Entry :=
  { word := [9, 0, 12, 4, 4, 0, 8], weights := [0, 0, 1, 1] }

def points122 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 4), (5, 5), (6, 3), (7, 2), (8, 0), (9, 1)]

-- Period 10, original row 6924, representative 11012.
def source123 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B024.Data.entryAt ⟨28, by decide +kernel⟩

def target123 : Weights.Entry :=
  { word := [9, 0, 12, 6, 0, 8, 8], weights := [0, 0, 1, 0] }

def points123 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8), (9, 9)]

-- Period 10, original row 6925, representative 11018.
def source124 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B024.Data.entryAt ⟨34, by decide +kernel⟩

def target124 : Weights.Entry :=
  { word := [9, 0, 12, 6, 8, 0, 8], weights := [0, 1, 0, 0] }

def points124 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 4), (5, 5), (6, 3), (7, 2), (8, 0), (9, 1)]

-- Period 10, original row 6926, representative 11011.
def source125 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B024.Data.entryAt ⟨27, by decide +kernel⟩

def target125 : Weights.Entry :=
  { word := [9, 0, 12, 6, 8, 8, 8], weights := [0, 0, 1, 0] }

def points125 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8), (9, 9)]

-- Period 10, original row 6931, representative 10996.
def source126 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B024.Data.entryAt ⟨12, by decide +kernel⟩

def target126 : Weights.Entry :=
  { word := [9, 0, 12, 10, 0, 1, 8], weights := [0, 1, 0, 1] }

def points126 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 0), (9, 1)]

-- Period 10, original row 6932, representative 10996.
def source127 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B024.Data.entryAt ⟨12, by decide +kernel⟩

def target127 : Weights.Entry :=
  { word := [9, 0, 12, 10, 0, 2, 8], weights := [0, 1, 0, 1] }

def points127 : List (ℕ × ℕ) := [(0, 7), (1, 9), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 0), (9, 1)]

def period10Entries : List Weights.Entry := [target0, target1, target2, target3, target4, target5, target6, target7, target8, target9, target10, target11, target12, target13, target14, target15, target16, target17, target18, target19, target20, target21, target22, target23, target24, target25, target26, target27, target28, target29, target30, target31, target32, target33, target34, target35, target36, target37, target38, target39, target40, target41, target42, target43, target44, target45, target46, target47, target48, target49, target50, target51, target52, target53, target54, target55, target56, target57, target58, target59, target60, target61, target62, target63, target64, target65, target66, target67, target68, target69, target70, target71, target72, target73, target74, target75, target76, target77, target78, target79, target80, target81, target82, target83, target84, target85, target86, target87, target88, target89, target90, target91, target92, target93, target94, target95, target96, target97, target98, target99, target100, target101, target102, target103, target104, target105, target106, target107, target108, target109, target110, target111, target112, target113, target114, target115, target116, target117, target118, target119, target120, target121, target122, target123, target124, target125, target126, target127]

def period10Chunk : RowCoverage.Chunk where
  rows := [⟨4100, target0⟩, ⟨4103, target1⟩, ⟨4104, target2⟩, ⟨4113, target3⟩, ⟨4126, target4⟩, ⟨4148, target5⟩, ⟨4162, target6⟩, ⟨4184, target7⟩, ⟨4198, target8⟩, ⟨4213, target9⟩, ⟨4228, target10⟩, ⟨4242, target11⟩, ⟨4254, target12⟩, ⟨4256, target13⟩, ⟨4261, target14⟩, ⟨4270, target15⟩, ⟨4276, target16⟩, ⟨4279, target17⟩, ⟨4280, target18⟩, ⟨4281, target19⟩, ⟨4282, target20⟩, ⟨4287, target21⟩, ⟨4288, target22⟩, ⟨4293, target23⟩, ⟨4304, target24⟩, ⟨4312, target25⟩, ⟨4348, target26⟩, ⟨4352, target27⟩, ⟨4359, target28⟩, ⟨4360, target29⟩, ⟨4361, target30⟩, ⟨4362, target31⟩, ⟨4372, target32⟩, ⟨4374, target33⟩, ⟨4427, target34⟩, ⟨4429, target35⟩, ⟨4434, target36⟩, ⟨4443, target37⟩, ⟨4449, target38⟩, ⟨4452, target39⟩, ⟨4453, target40⟩, ⟨4454, target41⟩, ⟨4459, target42⟩, ⟨4460, target43⟩, ⟨4469, target44⟩, ⟨4480, target45⟩, ⟨4488, target46⟩, ⟨5005, target47⟩, ⟨5027, target48⟩, ⟨5041, target49⟩, ⟨5063, target50⟩, ⟨5099, target51⟩, ⟨5113, target52⟩, ⟨5127, target53⟩, ⟨5141, target54⟩, ⟨5160, target55⟩, ⟨5186, target56⟩, ⟨5202, target57⟩, ⟨5228, target58⟩, ⟨5263, target59⟩, ⟨5284, target60⟩, ⟨5344, target61⟩, ⟨5350, target62⟩, ⟨5370, target63⟩, ⟨5376, target64⟩, ⟨5381, target65⟩, ⟨5382, target66⟩, ⟨5383, target67⟩, ⟨5384, target68⟩, ⟨5408, target69⟩, ⟨5414, target70⟩, ⟨5433, target71⟩, ⟨5439, target72⟩, ⟨5582, target73⟩, ⟨5604, target74⟩, ⟨5605, target75⟩, ⟨5606, target76⟩, ⟨5607, target77⟩, ⟨5621, target78⟩, ⟨5703, target79⟩, ⟨5704, target80⟩, ⟨5705, target81⟩, ⟨5706, target82⟩, ⟨5790, target83⟩, ⟨5812, target84⟩, ⟨5813, target85⟩, ⟨5814, target86⟩, ⟨5828, target87⟩, ⟨6628, target88⟩, ⟨6650, target89⟩, ⟨6664, target90⟩, ⟨6686, target91⟩, ⟨6700, target92⟩, ⟨6715, target93⟩, ⟨6730, target94⟩, ⟨6744, target95⟩, ⟨6756, target96⟩, ⟨6758, target97⟩, ⟨6763, target98⟩, ⟨6772, target99⟩, ⟨6778, target100⟩, ⟨6781, target101⟩, ⟨6782, target102⟩, ⟨6783, target103⟩, ⟨6784, target104⟩, ⟨6789, target105⟩, ⟨6790, target106⟩, ⟨6795, target107⟩, ⟨6806, target108⟩, ⟨6814, target109⟩, ⟨6820, target110⟩, ⟨6824, target111⟩, ⟨6831, target112⟩, ⟨6832, target113⟩, ⟨6833, target114⟩, ⟨6834, target115⟩, ⟨6844, target116⟩, ⟨6846, target117⟩, ⟨6899, target118⟩, ⟨6901, target119⟩, ⟨6906, target120⟩, ⟨6915, target121⟩, ⟨6921, target122⟩, ⟨6924, target123⟩, ⟨6925, target124⟩, ⟨6926, target125⟩, ⟨6931, target126⟩, ⟨6932, target127⟩]
  indexMask := 83947492171518905879078313500277615973072706197209632264602059553957229530473481995402400546739485191145367714106330191920499196995206461949965452244730036609325517779890044249206581110032754678940685263997408599324500258542997892052503477417498636092437729402277739832864212359843141206452931339715638071230991188686054466464445083584296557893973938926117885028105582374566649842292574891699542778243873154482656321880975152446467160013396176117843358938124994635425800838158881636117555642186846458319362352598984622210717946351330679048625631285250966348181903220047735548621803951118970971150161242886870671286180309557440484657419964633995525271787233975598979264626696586564339259597102901554474600652090639809820884074461566892322084535704751444598162771903062290154668605291151870705582050285668458179299495371052373121634692238027133096811552160112838297818881434295271371553072745240966723129407855679446320341580876765027980190165787278425206282900371110729688712395118199802249761186489043978725934271252656903571459794021167787490808563597105423797189068222636038970672881924137097750192632103727665871888532896297770702684550084712842610376784837155068639948229772881802659975481034819026588469685934709012345021604062044434824135408480236763049071508451333390061141042467941031883784656077267918052973076614746931758902841841636507992254763253856829673634649500582918151537560736870092483769997390037689139972826416541430750552621805993199476053461261935278709283020859462782498113262643349306510686371539418130885614499225723166047482498460612747775317368661698351710302361864315373610523532009899552986841274227606398921997165371490541811522251993468343458290264341636147517943063605255216085030691359214838370107482674197776646633441142816554889118238696903154720771920197485422081636813784366845075617126011761252878274574958707800259318842819137323921177833764817915930550463797767285460828385922372191592345809814950643452195693902302160315775531108267516974394588764501998265171781513774345937730027015022562249416888571127307156480693144348690863558904455251361792
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

end FranklSmallCyclic.TransportBatches.G102.B000.Data
