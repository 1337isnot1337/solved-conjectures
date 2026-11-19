module

public import Conjectures.FranklSmallCyclicRowCoverage
public import Conjectures.FranklSmallCyclicCanonicalWords
public import Conjectures.FranklSmallCyclicOrbit8Block025Data

/-! 128 literal targets sharing one source proof block.
Original words and row indices are retained; weights may be transported.
-/
@[expose] public section

namespace FranklSmallCyclic.TransportBatches.G051.B000.Data

-- Period 8, original row 830, representative 6643.
def source0 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B025.Data.entryAt ⟨124, by decide +kernel⟩

def target0 : Weights.Entry :=
  { word := [0, 8, 0, 4, 6, 8, 8], weights := [0, 0, 1, 0] }

-- Period 8, original row 1003, representative 6645.
def source1 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B025.Data.entryAt ⟨126, by decide +kernel⟩

def target1 : Weights.Entry :=
  { word := [0, 8, 4, 4, 12, 8, 8], weights := [0, 0, 1, 0] }

-- Period 8, original row 1049, representative 6644.
def source2 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B025.Data.entryAt ⟨125, by decide +kernel⟩

def target2 : Weights.Entry :=
  { word := [0, 8, 8, 4, 6, 8, 8], weights := [0, 0, 1, 0] }

-- Period 8, original row 1117, representative 6646.
def source3 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B025.Data.entryAt ⟨127, by decide +kernel⟩

def target3 : Weights.Entry :=
  { word := [0, 8, 12, 4, 12, 8, 8], weights := [0, 0, 1, 0] }

-- Period 8, original row 2133, representative 6645.
def source4 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B025.Data.entryAt ⟨126, by decide +kernel⟩

def target4 : Weights.Entry :=
  { word := [1, 8, 4, 4, 12, 8, 8], weights := [0, 0, 1, 0] }

def points4 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 8, original row 2141, representative 6644.
def source5 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B025.Data.entryAt ⟨125, by decide +kernel⟩

def target5 : Weights.Entry :=
  { word := [1, 8, 8, 4, 6, 8, 8], weights := [0, 0, 1, 0] }

def points5 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 8, original row 2199, representative 6646.
def source6 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B025.Data.entryAt ⟨127, by decide +kernel⟩

def target6 : Weights.Entry :=
  { word := [1, 8, 12, 4, 12, 8, 8], weights := [0, 0, 1, 0] }

def points6 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 8, original row 4100, representative 6563.
def source7 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B025.Data.entryAt ⟨44, by decide +kernel⟩

def target7 : Weights.Entry :=
  { word := [8, 0, 0, 2, 2, 2, 8], weights := [1, 0, 0, 1] }

-- Period 8, original row 4102, representative 6522.
def source8 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B025.Data.entryAt ⟨3, by decide +kernel⟩

def target8 : Weights.Entry :=
  { word := [8, 0, 0, 2, 2, 10, 8], weights := [1, 0, 0, 1] }

-- Period 8, original row 4103, representative 6640.
def source9 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B025.Data.entryAt ⟨121, by decide +kernel⟩

def target9 : Weights.Entry :=
  { word := [8, 0, 0, 6, 2, 0, 8], weights := [1, 1, 0, 0] }

-- Period 8, original row 4104, representative 6629.
def source10 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B025.Data.entryAt ⟨110, by decide +kernel⟩

def target10 : Weights.Entry :=
  { word := [8, 0, 0, 6, 2, 8, 8], weights := [1, 0, 1, 0] }

-- Period 8, original row 4113, representative 6568.
def source11 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B025.Data.entryAt ⟨49, by decide +kernel⟩

def target11 : Weights.Entry :=
  { word := [8, 0, 0, 10, 2, 2, 8], weights := [1, 0, 0, 1] }

-- Period 8, original row 4114, representative 6527.
def source12 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B025.Data.entryAt ⟨8, by decide +kernel⟩

def target12 : Weights.Entry :=
  { word := [8, 0, 0, 10, 2, 10, 8], weights := [1, 0, 0, 1] }

-- Period 8, original row 4126, representative 6617.
def source13 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B025.Data.entryAt ⟨98, by decide +kernel⟩

def target13 : Weights.Entry :=
  { word := [8, 0, 1, 4, 2, 0, 8], weights := [1, 0, 1, 0] }

-- Period 8, original row 4132, representative 6613.
def source14 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B025.Data.entryAt ⟨94, by decide +kernel⟩

def target14 : Weights.Entry :=
  { word := [8, 0, 1, 4, 2, 8, 8], weights := [1, 0, 1, 0] }

-- Period 8, original row 4148, representative 6618.
def source15 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B025.Data.entryAt ⟨99, by decide +kernel⟩

def target15 : Weights.Entry :=
  { word := [8, 0, 1, 4, 10, 0, 8], weights := [1, 0, 1, 0] }

-- Period 8, original row 4154, representative 6614.
def source16 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B025.Data.entryAt ⟨95, by decide +kernel⟩

def target16 : Weights.Entry :=
  { word := [8, 0, 1, 4, 10, 8, 8], weights := [1, 0, 1, 0] }

-- Period 8, original row 4162, representative 6620.
def source17 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B025.Data.entryAt ⟨101, by decide +kernel⟩

def target17 : Weights.Entry :=
  { word := [8, 0, 1, 12, 2, 0, 8], weights := [1, 0, 1, 0] }

-- Period 8, original row 4168, representative 6616.
def source18 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B025.Data.entryAt ⟨97, by decide +kernel⟩

def target18 : Weights.Entry :=
  { word := [8, 0, 1, 12, 2, 8, 8], weights := [1, 0, 1, 0] }

-- Period 8, original row 4184, representative 6619.
def source19 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B025.Data.entryAt ⟨100, by decide +kernel⟩

def target19 : Weights.Entry :=
  { word := [8, 0, 1, 12, 10, 0, 8], weights := [1, 0, 1, 0] }

-- Period 8, original row 4190, representative 6615.
def source20 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B025.Data.entryAt ⟨96, by decide +kernel⟩

def target20 : Weights.Entry :=
  { word := [8, 0, 1, 12, 10, 8, 8], weights := [1, 0, 1, 0] }

-- Period 8, original row 4198, representative 6617.
def source21 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B025.Data.entryAt ⟨98, by decide +kernel⟩

def target21 : Weights.Entry :=
  { word := [8, 0, 2, 2, 2, 0, 8], weights := [1, 1, 0, 0] }

def points21 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 5), (5, 4), (6, 6), (7, 7)]

-- Period 8, original row 4206, representative 6601.
def source22 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B025.Data.entryAt ⟨82, by decide +kernel⟩

def target22 : Weights.Entry :=
  { word := [8, 0, 2, 2, 2, 8, 8], weights := [1, 0, 0, 1] }

-- Period 8, original row 4213, representative 6618.
def source23 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B025.Data.entryAt ⟨99, by decide +kernel⟩

def target23 : Weights.Entry :=
  { word := [8, 0, 2, 2, 10, 0, 8], weights := [1, 1, 0, 0] }

def points23 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 5), (5, 4), (6, 6), (7, 7)]

-- Period 8, original row 4221, representative 6606.
def source24 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B025.Data.entryAt ⟨87, by decide +kernel⟩

def target24 : Weights.Entry :=
  { word := [8, 0, 2, 2, 10, 8, 8], weights := [1, 0, 0, 1] }

-- Period 8, original row 4228, representative 6620.
def source25 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B025.Data.entryAt ⟨101, by decide +kernel⟩

def target25 : Weights.Entry :=
  { word := [8, 0, 2, 10, 2, 0, 8], weights := [1, 1, 0, 0] }

def points25 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 5), (5, 4), (6, 6), (7, 7)]

-- Period 8, original row 4235, representative 6608.
def source26 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B025.Data.entryAt ⟨89, by decide +kernel⟩

def target26 : Weights.Entry :=
  { word := [8, 0, 2, 10, 2, 8, 8], weights := [1, 0, 0, 1] }

-- Period 8, original row 4242, representative 6619.
def source27 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B025.Data.entryAt ⟨100, by decide +kernel⟩

def target27 : Weights.Entry :=
  { word := [8, 0, 2, 10, 10, 0, 8], weights := [1, 1, 0, 0] }

def points27 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 5), (5, 4), (6, 6), (7, 7)]

-- Period 8, original row 4249, representative 6607.
def source28 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B025.Data.entryAt ⟨88, by decide +kernel⟩

def target28 : Weights.Entry :=
  { word := [8, 0, 2, 10, 10, 8, 8], weights := [1, 0, 0, 1] }

-- Period 8, original row 4254, representative 6617.
def source29 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B025.Data.entryAt ⟨98, by decide +kernel⟩

def target29 : Weights.Entry :=
  { word := [8, 0, 4, 2, 0, 1, 8], weights := [0, 1, 0, 1] }

def points29 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 4256, representative 6569.
def source30 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B025.Data.entryAt ⟨50, by decide +kernel⟩

def target30 : Weights.Entry :=
  { word := [8, 0, 4, 2, 0, 2, 8], weights := [1, 0, 0, 1] }

-- Period 8, original row 4261, representative 6636.
def source31 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B025.Data.entryAt ⟨117, by decide +kernel⟩

def target31 : Weights.Entry :=
  { word := [8, 0, 4, 2, 0, 8, 8], weights := [1, 0, 0, 1] }

-- Period 8, original row 4266, representative 6581.
def source32 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B025.Data.entryAt ⟨62, by decide +kernel⟩

def target32 : Weights.Entry :=
  { word := [8, 0, 4, 2, 0, 9, 8], weights := [1, 0, 0, 1] }

-- Period 8, original row 4268, representative 6528.
def source33 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B025.Data.entryAt ⟨9, by decide +kernel⟩

def target33 : Weights.Entry :=
  { word := [8, 0, 4, 2, 0, 10, 8], weights := [1, 0, 0, 1] }

-- Period 8, original row 4270, representative 6570.
def source34 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B025.Data.entryAt ⟨51, by decide +kernel⟩

def target34 : Weights.Entry :=
  { word := [8, 0, 4, 2, 8, 2, 8], weights := [1, 0, 0, 1] }

-- Period 8, original row 4274, representative 6529.
def source35 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B025.Data.entryAt ⟨10, by decide +kernel⟩

def target35 : Weights.Entry :=
  { word := [8, 0, 4, 2, 8, 10, 8], weights := [1, 0, 0, 1] }

-- Period 8, original row 4276, representative 6617.
def source36 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B025.Data.entryAt ⟨98, by decide +kernel⟩

def target36 : Weights.Entry :=
  { word := [8, 0, 4, 4, 4, 0, 8], weights := [0, 0, 1, 1] }

def points36 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 7), (3, 6), (4, 4), (5, 5), (6, 3), (7, 2)]

-- Period 8, original row 4278, representative 6609.
def source37 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B025.Data.entryAt ⟨90, by decide +kernel⟩

def target37 : Weights.Entry :=
  { word := [8, 0, 4, 4, 4, 8, 8], weights := [0, 0, 1, 0] }

-- Period 8, original row 4279, representative 6640.
def source38 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B025.Data.entryAt ⟨121, by decide +kernel⟩

def target38 : Weights.Entry :=
  { word := [8, 0, 4, 6, 0, 0, 8], weights := [0, 1, 0, 1] }

def points38 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 7), (3, 6), (4, 4), (5, 5), (6, 3), (7, 2)]

-- Period 8, original row 4280, representative 6632.
def source39 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B025.Data.entryAt ⟨113, by decide +kernel⟩

def target39 : Weights.Entry :=
  { word := [8, 0, 4, 6, 0, 8, 8], weights := [0, 0, 1, 0] }

-- Period 8, original row 4281, representative 6642.
def source40 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B025.Data.entryAt ⟨123, by decide +kernel⟩

def target40 : Weights.Entry :=
  { word := [8, 0, 4, 6, 8, 0, 8], weights := [0, 1, 0, 0] }

-- Period 8, original row 4282, representative 6633.
def source41 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B025.Data.entryAt ⟨114, by decide +kernel⟩

def target41 : Weights.Entry :=
  { word := [8, 0, 4, 6, 8, 8, 8], weights := [0, 0, 1, 0] }

-- Period 8, original row 4284, representative 6546.
def source42 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B025.Data.entryAt ⟨27, by decide +kernel⟩

def target42 : Weights.Entry :=
  { word := [8, 0, 4, 8, 4, 2, 8], weights := [0, 1, 1, 0] }

-- Period 8, original row 4287, representative 6620.
def source43 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B025.Data.entryAt ⟨101, by decide +kernel⟩

def target43 : Weights.Entry :=
  { word := [8, 0, 4, 10, 0, 1, 8], weights := [0, 1, 0, 1] }

def points43 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 4288, representative 6576.
def source44 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B025.Data.entryAt ⟨57, by decide +kernel⟩

def target44 : Weights.Entry :=
  { word := [8, 0, 4, 10, 0, 2, 8], weights := [1, 0, 0, 1] }

-- Period 8, original row 4293, representative 6639.
def source45 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B025.Data.entryAt ⟨120, by decide +kernel⟩

def target45 : Weights.Entry :=
  { word := [8, 0, 4, 10, 0, 8, 8], weights := [1, 0, 0, 1] }

-- Period 8, original row 4297, representative 6584.
def source46 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B025.Data.entryAt ⟨65, by decide +kernel⟩

def target46 : Weights.Entry :=
  { word := [8, 0, 4, 10, 0, 9, 8], weights := [1, 0, 0, 1] }

-- Period 8, original row 4298, representative 6535.
def source47 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B025.Data.entryAt ⟨16, by decide +kernel⟩

def target47 : Weights.Entry :=
  { word := [8, 0, 4, 10, 0, 10, 8], weights := [1, 0, 0, 1] }

-- Period 8, original row 4304, representative 6573.
def source48 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B025.Data.entryAt ⟨54, by decide +kernel⟩

def target48 : Weights.Entry :=
  { word := [8, 0, 4, 10, 8, 2, 8], weights := [0, 1, 1, 0] }

-- Period 8, original row 4309, representative 6532.
def source49 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B025.Data.entryAt ⟨13, by decide +kernel⟩

def target49 : Weights.Entry :=
  { word := [8, 0, 4, 10, 8, 10, 8], weights := [0, 1, 1, 0] }

-- Period 8, original row 4312, representative 6620.
def source50 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B025.Data.entryAt ⟨101, by decide +kernel⟩

def target50 : Weights.Entry :=
  { word := [8, 0, 4, 12, 4, 0, 8], weights := [0, 0, 1, 1] }

def points50 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 7), (3, 6), (4, 4), (5, 5), (6, 3), (7, 2)]

-- Period 8, original row 4314, representative 6612.
def source51 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B025.Data.entryAt ⟨93, by decide +kernel⟩

def target51 : Weights.Entry :=
  { word := [8, 0, 4, 12, 4, 8, 8], weights := [0, 0, 1, 0] }

-- Period 8, original row 4319, representative 6597.
def source52 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B025.Data.entryAt ⟨78, by decide +kernel⟩

def target52 : Weights.Entry :=
  { word := [8, 0, 6, 2, 0, 8, 8], weights := [1, 0, 0, 1] }

-- Period 8, original row 4327, representative 6598.
def source53 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B025.Data.entryAt ⟨79, by decide +kernel⟩

def target53 : Weights.Entry :=
  { word := [8, 0, 6, 2, 8, 8, 8], weights := [1, 0, 0, 1] }

-- Period 8, original row 4334, representative 6600.
def source54 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B025.Data.entryAt ⟨81, by decide +kernel⟩

def target54 : Weights.Entry :=
  { word := [8, 0, 6, 10, 0, 8, 8], weights := [1, 0, 0, 1] }

-- Period 8, original row 4341, representative 6599.
def source55 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B025.Data.entryAt ⟨80, by decide +kernel⟩

def target55 : Weights.Entry :=
  { word := [8, 0, 6, 10, 8, 8, 8], weights := [0, 1, 1, 0] }

-- Period 8, original row 4348, representative 6566.
def source56 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B025.Data.entryAt ⟨47, by decide +kernel⟩

def target56 : Weights.Entry :=
  { word := [8, 0, 8, 2, 2, 2, 8], weights := [1, 0, 0, 1] }

-- Period 8, original row 4350, representative 6525.
def source57 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B025.Data.entryAt ⟨6, by decide +kernel⟩

def target57 : Weights.Entry :=
  { word := [8, 0, 8, 2, 2, 10, 8], weights := [1, 0, 0, 1] }

-- Period 8, original row 4352, representative 6564.
def source58 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B025.Data.entryAt ⟨45, by decide +kernel⟩

def target58 : Weights.Entry :=
  { word := [8, 0, 8, 2, 10, 2, 8], weights := [1, 0, 0, 1] }

-- Period 8, original row 4354, representative 6523.
def source59 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B025.Data.entryAt ⟨4, by decide +kernel⟩

def target59 : Weights.Entry :=
  { word := [8, 0, 8, 2, 10, 10, 8], weights := [1, 0, 0, 1] }

-- Period 8, original row 4359, representative 6642.
def source60 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B025.Data.entryAt ⟨123, by decide +kernel⟩

def target60 : Weights.Entry :=
  { word := [8, 0, 8, 6, 2, 0, 8], weights := [0, 1, 0, 0] }

def points60 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 7), (3, 6), (4, 4), (5, 5), (6, 3), (7, 2)]

-- Period 8, original row 4360, representative 6631.
def source61 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B025.Data.entryAt ⟨112, by decide +kernel⟩

def target61 : Weights.Entry :=
  { word := [8, 0, 8, 6, 2, 8, 8], weights := [0, 0, 1, 0] }

-- Period 8, original row 4361, representative 6641.
def source62 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B025.Data.entryAt ⟨122, by decide +kernel⟩

def target62 : Weights.Entry :=
  { word := [8, 0, 8, 6, 10, 0, 8], weights := [0, 1, 0, 0] }

-- Period 8, original row 4362, representative 6630.
def source63 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B025.Data.entryAt ⟨111, by decide +kernel⟩

def target63 : Weights.Entry :=
  { word := [8, 0, 8, 6, 10, 8, 8], weights := [0, 0, 1, 0] }

-- Period 8, original row 4372, representative 6567.
def source64 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B025.Data.entryAt ⟨48, by decide +kernel⟩

def target64 : Weights.Entry :=
  { word := [8, 0, 8, 10, 2, 2, 8], weights := [0, 1, 1, 0] }

-- Period 8, original row 4373, representative 6526.
def source65 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B025.Data.entryAt ⟨7, by decide +kernel⟩

def target65 : Weights.Entry :=
  { word := [8, 0, 8, 10, 2, 10, 8], weights := [0, 1, 1, 0] }

-- Period 8, original row 4374, representative 6565.
def source66 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B025.Data.entryAt ⟨46, by decide +kernel⟩

def target66 : Weights.Entry :=
  { word := [8, 0, 8, 10, 10, 2, 8], weights := [0, 1, 1, 0] }

-- Period 8, original row 4375, representative 6524.
def source67 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B025.Data.entryAt ⟨5, by decide +kernel⟩

def target67 : Weights.Entry :=
  { word := [8, 0, 8, 10, 10, 10, 8], weights := [0, 1, 1, 0] }

-- Period 8, original row 4400, representative 6602.
def source68 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B025.Data.entryAt ⟨83, by decide +kernel⟩

def target68 : Weights.Entry :=
  { word := [8, 0, 10, 2, 2, 8, 8], weights := [1, 0, 0, 1] }

-- Period 8, original row 4408, representative 6603.
def source69 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B025.Data.entryAt ⟨84, by decide +kernel⟩

def target69 : Weights.Entry :=
  { word := [8, 0, 10, 2, 10, 8, 8], weights := [1, 0, 0, 1] }

-- Period 8, original row 4415, representative 6605.
def source70 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B025.Data.entryAt ⟨86, by decide +kernel⟩

def target70 : Weights.Entry :=
  { word := [8, 0, 10, 10, 2, 8, 8], weights := [0, 1, 1, 0] }

-- Period 8, original row 4422, representative 6604.
def source71 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B025.Data.entryAt ⟨85, by decide +kernel⟩

def target71 : Weights.Entry :=
  { word := [8, 0, 10, 10, 10, 8, 8], weights := [0, 1, 1, 0] }

-- Period 8, original row 4427, representative 6618.
def source72 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B025.Data.entryAt ⟨99, by decide +kernel⟩

def target72 : Weights.Entry :=
  { word := [8, 0, 12, 2, 0, 1, 8], weights := [0, 1, 0, 1] }

def points72 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 4429, representative 6574.
def source73 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B025.Data.entryAt ⟨55, by decide +kernel⟩

def target73 : Weights.Entry :=
  { word := [8, 0, 12, 2, 0, 2, 8], weights := [1, 0, 0, 1] }

-- Period 8, original row 4434, representative 6637.
def source74 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B025.Data.entryAt ⟨118, by decide +kernel⟩

def target74 : Weights.Entry :=
  { word := [8, 0, 12, 2, 0, 8, 8], weights := [1, 0, 0, 1] }

-- Period 8, original row 4439, representative 6582.
def source75 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B025.Data.entryAt ⟨63, by decide +kernel⟩

def target75 : Weights.Entry :=
  { word := [8, 0, 12, 2, 0, 9, 8], weights := [1, 0, 0, 1] }

-- Period 8, original row 4441, representative 6533.
def source76 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B025.Data.entryAt ⟨14, by decide +kernel⟩

def target76 : Weights.Entry :=
  { word := [8, 0, 12, 2, 0, 10, 8], weights := [1, 0, 0, 1] }

-- Period 8, original row 4443, representative 6571.
def source77 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B025.Data.entryAt ⟨52, by decide +kernel⟩

def target77 : Weights.Entry :=
  { word := [8, 0, 12, 2, 8, 2, 8], weights := [1, 0, 0, 1] }

-- Period 8, original row 4447, representative 6530.
def source78 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B025.Data.entryAt ⟨11, by decide +kernel⟩

def target78 : Weights.Entry :=
  { word := [8, 0, 12, 2, 8, 10, 8], weights := [1, 0, 0, 1] }

-- Period 8, original row 4449, representative 6618.
def source79 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B025.Data.entryAt ⟨99, by decide +kernel⟩

def target79 : Weights.Entry :=
  { word := [8, 0, 12, 4, 4, 0, 8], weights := [0, 0, 1, 1] }

def points79 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 7), (3, 6), (4, 4), (5, 5), (6, 3), (7, 2)]

-- Period 8, original row 4451, representative 6610.
def source80 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B025.Data.entryAt ⟨91, by decide +kernel⟩

def target80 : Weights.Entry :=
  { word := [8, 0, 12, 4, 4, 8, 8], weights := [0, 0, 1, 0] }

-- Period 8, original row 4452, representative 6635.
def source81 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B025.Data.entryAt ⟨116, by decide +kernel⟩

def target81 : Weights.Entry :=
  { word := [8, 0, 12, 6, 0, 8, 8], weights := [0, 0, 1, 0] }

-- Period 8, original row 4453, representative 6641.
def source82 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B025.Data.entryAt ⟨122, by decide +kernel⟩

def target82 : Weights.Entry :=
  { word := [8, 0, 12, 6, 8, 0, 8], weights := [0, 1, 0, 0] }

def points82 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 7), (3, 6), (4, 4), (5, 5), (6, 3), (7, 2)]

-- Period 8, original row 4454, representative 6634.
def source83 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B025.Data.entryAt ⟨115, by decide +kernel⟩

def target83 : Weights.Entry :=
  { word := [8, 0, 12, 6, 8, 8, 8], weights := [0, 0, 1, 0] }

-- Period 8, original row 4456, representative 6545.
def source84 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B025.Data.entryAt ⟨26, by decide +kernel⟩

def target84 : Weights.Entry :=
  { word := [8, 0, 12, 8, 4, 2, 8], weights := [0, 1, 1, 0] }

-- Period 8, original row 4459, representative 6619.
def source85 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B025.Data.entryAt ⟨100, by decide +kernel⟩

def target85 : Weights.Entry :=
  { word := [8, 0, 12, 10, 0, 1, 8], weights := [0, 1, 0, 1] }

def points85 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 4460, representative 6575.
def source86 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B025.Data.entryAt ⟨56, by decide +kernel⟩

def target86 : Weights.Entry :=
  { word := [8, 0, 12, 10, 0, 2, 8], weights := [1, 0, 0, 1] }

-- Period 8, original row 4469, representative 6638.
def source87 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B025.Data.entryAt ⟨119, by decide +kernel⟩

def target87 : Weights.Entry :=
  { word := [8, 0, 12, 10, 0, 8, 8], weights := [1, 0, 0, 1] }

-- Period 8, original row 4473, representative 6583.
def source88 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B025.Data.entryAt ⟨64, by decide +kernel⟩

def target88 : Weights.Entry :=
  { word := [8, 0, 12, 10, 0, 9, 8], weights := [1, 0, 0, 1] }

-- Period 8, original row 4474, representative 6534.
def source89 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B025.Data.entryAt ⟨15, by decide +kernel⟩

def target89 : Weights.Entry :=
  { word := [8, 0, 12, 10, 0, 10, 8], weights := [1, 0, 0, 1] }

-- Period 8, original row 4480, representative 6572.
def source90 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B025.Data.entryAt ⟨53, by decide +kernel⟩

def target90 : Weights.Entry :=
  { word := [8, 0, 12, 10, 8, 2, 8], weights := [0, 1, 1, 0] }

-- Period 8, original row 4485, representative 6531.
def source91 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B025.Data.entryAt ⟨12, by decide +kernel⟩

def target91 : Weights.Entry :=
  { word := [8, 0, 12, 10, 8, 10, 8], weights := [0, 1, 1, 0] }

-- Period 8, original row 4488, representative 6619.
def source92 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B025.Data.entryAt ⟨100, by decide +kernel⟩

def target92 : Weights.Entry :=
  { word := [8, 0, 12, 12, 4, 0, 8], weights := [0, 0, 1, 1] }

def points92 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 7), (3, 6), (4, 4), (5, 5), (6, 3), (7, 2)]

-- Period 8, original row 4490, representative 6611.
def source93 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B025.Data.entryAt ⟨92, by decide +kernel⟩

def target93 : Weights.Entry :=
  { word := [8, 0, 12, 12, 4, 8, 8], weights := [0, 0, 1, 0] }

-- Period 8, original row 5005, representative 6569.
def source94 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B025.Data.entryAt ⟨50, by decide +kernel⟩

def target94 : Weights.Entry :=
  { word := [8, 4, 0, 4, 2, 0, 8], weights := [1, 0, 0, 1] }

def points94 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 5011, representative 6555.
def source95 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B025.Data.entryAt ⟨36, by decide +kernel⟩

def target95 : Weights.Entry :=
  { word := [8, 4, 0, 4, 2, 8, 8], weights := [1, 0, 1, 0] }

-- Period 8, original row 5027, representative 6574.
def source96 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B025.Data.entryAt ⟨55, by decide +kernel⟩

def target96 : Weights.Entry :=
  { word := [8, 4, 0, 4, 10, 0, 8], weights := [1, 0, 0, 1] }

def points96 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 5033, representative 6560.
def source97 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B025.Data.entryAt ⟨41, by decide +kernel⟩

def target97 : Weights.Entry :=
  { word := [8, 4, 0, 4, 10, 8, 8], weights := [1, 0, 1, 0] }

-- Period 8, original row 5041, representative 6576.
def source98 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B025.Data.entryAt ⟨57, by decide +kernel⟩

def target98 : Weights.Entry :=
  { word := [8, 4, 0, 12, 2, 0, 8], weights := [1, 0, 0, 1] }

def points98 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 5047, representative 6562.
def source99 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B025.Data.entryAt ⟨43, by decide +kernel⟩

def target99 : Weights.Entry :=
  { word := [8, 4, 0, 12, 2, 8, 8], weights := [1, 0, 1, 0] }

-- Period 8, original row 5063, representative 6575.
def source100 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B025.Data.entryAt ⟨56, by decide +kernel⟩

def target100 : Weights.Entry :=
  { word := [8, 4, 0, 12, 10, 0, 8], weights := [1, 0, 0, 1] }

def points100 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 5069, representative 6561.
def source101 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B025.Data.entryAt ⟨42, by decide +kernel⟩

def target101 : Weights.Entry :=
  { word := [8, 4, 0, 12, 10, 8, 8], weights := [1, 0, 1, 0] }

-- Period 8, original row 5075, representative 6543.
def source102 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B025.Data.entryAt ⟨24, by decide +kernel⟩

def target102 : Weights.Entry :=
  { word := [8, 4, 2, 0, 1, 8, 8], weights := [0, 1, 2, 1] }

-- Period 8, original row 5078, representative 6544.
def source103 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B025.Data.entryAt ⟨25, by decide +kernel⟩

def target103 : Weights.Entry :=
  { word := [8, 4, 2, 0, 9, 8, 8], weights := [0, 1, 2, 1] }

-- Period 8, original row 5082, representative 6546.
def source104 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B025.Data.entryAt ⟨27, by decide +kernel⟩

def target104 : Weights.Entry :=
  { word := [8, 4, 2, 8, 2, 0, 8], weights := [0, 1, 1, 0] }

def points104 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 5086, representative 6540.
def source105 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B025.Data.entryAt ⟨21, by decide +kernel⟩

def target105 : Weights.Entry :=
  { word := [8, 4, 2, 8, 2, 8, 8], weights := [0, 1, 1, 0] }

-- Period 8, original row 5090, representative 6545.
def source106 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B025.Data.entryAt ⟨26, by decide +kernel⟩

def target106 : Weights.Entry :=
  { word := [8, 4, 2, 8, 10, 0, 8], weights := [0, 1, 1, 0] }

def points106 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 5094, representative 6539.
def source107 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B025.Data.entryAt ⟨20, by decide +kernel⟩

def target107 : Weights.Entry :=
  { word := [8, 4, 2, 8, 10, 8, 8], weights := [0, 1, 1, 0] }

-- Period 8, original row 5099, representative 6563.
def source108 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B025.Data.entryAt ⟨44, by decide +kernel⟩

def target108 : Weights.Entry :=
  { word := [8, 4, 4, 4, 0, 0, 8], weights := [1, 0, 0, 1] }

def points108 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 5106, representative 6547.
def source109 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B025.Data.entryAt ⟨28, by decide +kernel⟩

def target109 : Weights.Entry :=
  { word := [8, 4, 4, 4, 0, 8, 8], weights := [1, 0, 0, 1] }

-- Period 8, original row 5113, representative 6566.
def source110 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B025.Data.entryAt ⟨47, by decide +kernel⟩

def target110 : Weights.Entry :=
  { word := [8, 4, 4, 4, 8, 0, 8], weights := [1, 0, 0, 1] }

def points110 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 5120, representative 6552.
def source111 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B025.Data.entryAt ⟨33, by decide +kernel⟩

def target111 : Weights.Entry :=
  { word := [8, 4, 4, 4, 8, 8, 8], weights := [1, 0, 1, 0] }

-- Period 8, original row 5127, representative 6568.
def source112 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B025.Data.entryAt ⟨49, by decide +kernel⟩

def target112 : Weights.Entry :=
  { word := [8, 4, 4, 12, 0, 0, 8], weights := [1, 0, 0, 1] }

def points112 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 5134, representative 6554.
def source113 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B025.Data.entryAt ⟨35, by decide +kernel⟩

def target113 : Weights.Entry :=
  { word := [8, 4, 4, 12, 0, 8, 8], weights := [1, 0, 1, 0] }

-- Period 8, original row 5141, representative 6567.
def source114 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B025.Data.entryAt ⟨48, by decide +kernel⟩

def target114 : Weights.Entry :=
  { word := [8, 4, 4, 12, 8, 0, 8], weights := [0, 1, 1, 0] }

def points114 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 5148, representative 6553.
def source115 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B025.Data.entryAt ⟨34, by decide +kernel⟩

def target115 : Weights.Entry :=
  { word := [8, 4, 4, 12, 8, 8, 8], weights := [1, 0, 1, 0] }

-- Period 8, original row 5154, representative 6536.
def source116 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B025.Data.entryAt ⟨17, by decide +kernel⟩

def target116 : Weights.Entry :=
  { word := [8, 4, 6, 8, 8, 8, 8], weights := [0, 1, 1, 0] }

-- Period 8, original row 5160, representative 6570.
def source117 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B025.Data.entryAt ⟨51, by decide +kernel⟩

def target117 : Weights.Entry :=
  { word := [8, 4, 8, 4, 2, 0, 8], weights := [1, 0, 0, 1] }

def points117 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 5166, representative 6556.
def source118 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B025.Data.entryAt ⟨37, by decide +kernel⟩

def target118 : Weights.Entry :=
  { word := [8, 4, 8, 4, 2, 8, 8], weights := [1, 0, 1, 0] }

-- Period 8, original row 5186, representative 6571.
def source119 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B025.Data.entryAt ⟨52, by decide +kernel⟩

def target119 : Weights.Entry :=
  { word := [8, 4, 8, 4, 10, 0, 8], weights := [1, 0, 0, 1] }

def points119 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 5192, representative 6557.
def source120 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B025.Data.entryAt ⟨38, by decide +kernel⟩

def target120 : Weights.Entry :=
  { word := [8, 4, 8, 4, 10, 8, 8], weights := [1, 0, 1, 0] }

-- Period 8, original row 5202, representative 6573.
def source121 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B025.Data.entryAt ⟨54, by decide +kernel⟩

def target121 : Weights.Entry :=
  { word := [8, 4, 8, 12, 2, 0, 8], weights := [0, 1, 1, 0] }

def points121 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 5208, representative 6559.
def source122 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B025.Data.entryAt ⟨40, by decide +kernel⟩

def target122 : Weights.Entry :=
  { word := [8, 4, 8, 12, 2, 8, 8], weights := [1, 0, 1, 0] }

-- Period 8, original row 5228, representative 6572.
def source123 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B025.Data.entryAt ⟨53, by decide +kernel⟩

def target123 : Weights.Entry :=
  { word := [8, 4, 8, 12, 10, 0, 8], weights := [0, 1, 1, 0] }

def points123 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 5234, representative 6558.
def source124 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B025.Data.entryAt ⟨39, by decide +kernel⟩

def target124 : Weights.Entry :=
  { word := [8, 4, 8, 12, 10, 8, 8], weights := [1, 0, 1, 0] }

-- Period 8, original row 5242, representative 6541.
def source125 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B025.Data.entryAt ⟨22, by decide +kernel⟩

def target125 : Weights.Entry :=
  { word := [8, 4, 10, 0, 1, 8, 8], weights := [0, 1, 2, 1] }

-- Period 8, original row 5245, representative 6542.
def source126 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B025.Data.entryAt ⟨23, by decide +kernel⟩

def target126 : Weights.Entry :=
  { word := [8, 4, 10, 0, 9, 8, 8], weights := [0, 1, 2, 1] }

-- Period 8, original row 5248, representative 6538.
def source127 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B025.Data.entryAt ⟨19, by decide +kernel⟩

def target127 : Weights.Entry :=
  { word := [8, 4, 10, 8, 2, 8, 8], weights := [0, 1, 1, 0] }

def period8Entries : List Weights.Entry := [target0, target1, target2, target3, target4, target5, target6, target7, target8, target9, target10, target11, target12, target13, target14, target15, target16, target17, target18, target19, target20, target21, target22, target23, target24, target25, target26, target27, target28, target29, target30, target31, target32, target33, target34, target35, target36, target37, target38, target39, target40, target41, target42, target43, target44, target45, target46, target47, target48, target49, target50, target51, target52, target53, target54, target55, target56, target57, target58, target59, target60, target61, target62, target63, target64, target65, target66, target67, target68, target69, target70, target71, target72, target73, target74, target75, target76, target77, target78, target79, target80, target81, target82, target83, target84, target85, target86, target87, target88, target89, target90, target91, target92, target93, target94, target95, target96, target97, target98, target99, target100, target101, target102, target103, target104, target105, target106, target107, target108, target109, target110, target111, target112, target113, target114, target115, target116, target117, target118, target119, target120, target121, target122, target123, target124, target125, target126, target127]

def period8Chunk : RowCoverage.Chunk where
  rows := [⟨830, target0⟩, ⟨1003, target1⟩, ⟨1049, target2⟩, ⟨1117, target3⟩, ⟨2133, target4⟩, ⟨2141, target5⟩, ⟨2199, target6⟩, ⟨4100, target7⟩, ⟨4102, target8⟩, ⟨4103, target9⟩, ⟨4104, target10⟩, ⟨4113, target11⟩, ⟨4114, target12⟩, ⟨4126, target13⟩, ⟨4132, target14⟩, ⟨4148, target15⟩, ⟨4154, target16⟩, ⟨4162, target17⟩, ⟨4168, target18⟩, ⟨4184, target19⟩, ⟨4190, target20⟩, ⟨4198, target21⟩, ⟨4206, target22⟩, ⟨4213, target23⟩, ⟨4221, target24⟩, ⟨4228, target25⟩, ⟨4235, target26⟩, ⟨4242, target27⟩, ⟨4249, target28⟩, ⟨4254, target29⟩, ⟨4256, target30⟩, ⟨4261, target31⟩, ⟨4266, target32⟩, ⟨4268, target33⟩, ⟨4270, target34⟩, ⟨4274, target35⟩, ⟨4276, target36⟩, ⟨4278, target37⟩, ⟨4279, target38⟩, ⟨4280, target39⟩, ⟨4281, target40⟩, ⟨4282, target41⟩, ⟨4284, target42⟩, ⟨4287, target43⟩, ⟨4288, target44⟩, ⟨4293, target45⟩, ⟨4297, target46⟩, ⟨4298, target47⟩, ⟨4304, target48⟩, ⟨4309, target49⟩, ⟨4312, target50⟩, ⟨4314, target51⟩, ⟨4319, target52⟩, ⟨4327, target53⟩, ⟨4334, target54⟩, ⟨4341, target55⟩, ⟨4348, target56⟩, ⟨4350, target57⟩, ⟨4352, target58⟩, ⟨4354, target59⟩, ⟨4359, target60⟩, ⟨4360, target61⟩, ⟨4361, target62⟩, ⟨4362, target63⟩, ⟨4372, target64⟩, ⟨4373, target65⟩, ⟨4374, target66⟩, ⟨4375, target67⟩, ⟨4400, target68⟩, ⟨4408, target69⟩, ⟨4415, target70⟩, ⟨4422, target71⟩, ⟨4427, target72⟩, ⟨4429, target73⟩, ⟨4434, target74⟩, ⟨4439, target75⟩, ⟨4441, target76⟩, ⟨4443, target77⟩, ⟨4447, target78⟩, ⟨4449, target79⟩, ⟨4451, target80⟩, ⟨4452, target81⟩, ⟨4453, target82⟩, ⟨4454, target83⟩, ⟨4456, target84⟩, ⟨4459, target85⟩, ⟨4460, target86⟩, ⟨4469, target87⟩, ⟨4473, target88⟩, ⟨4474, target89⟩, ⟨4480, target90⟩, ⟨4485, target91⟩, ⟨4488, target92⟩, ⟨4490, target93⟩, ⟨5005, target94⟩, ⟨5011, target95⟩, ⟨5027, target96⟩, ⟨5033, target97⟩, ⟨5041, target98⟩, ⟨5047, target99⟩, ⟨5063, target100⟩, ⟨5069, target101⟩, ⟨5075, target102⟩, ⟨5078, target103⟩, ⟨5082, target104⟩, ⟨5086, target105⟩, ⟨5090, target106⟩, ⟨5094, target107⟩, ⟨5099, target108⟩, ⟨5106, target109⟩, ⟨5113, target110⟩, ⟨5120, target111⟩, ⟨5127, target112⟩, ⟨5134, target113⟩, ⟨5141, target114⟩, ⟨5148, target115⟩, ⟨5154, target116⟩, ⟨5160, target117⟩, ⟨5166, target118⟩, ⟨5186, target119⟩, ⟨5192, target120⟩, ⟨5202, target121⟩, ⟨5208, target122⟩, ⟨5228, target123⟩, ⟨5234, target124⟩, ⟨5242, target125⟩, ⟨5245, target126⟩, ⟨5248, target127⟩]
  indexMask := 72875866634875992902473489100870676036482885916992568831323559529465299585232326760586586633001499319437635141671571177267725602810712028568237817494428677951548262197833226332660646961206343878928135737267413113757187025204002011390259455894767510794086591391904510399630527098674050342483631990951190313839353895853717506933187037812019082438108864235395547060798077350628043309220215383817339633102218981257073207691821728007456692328854750602612109286650672550340783064429485459156609671431933938728205125834260080610800813954115242908871291650715446213085681741700596176196045577154384136617392333139084357176455896837087782713520324841280029474100687340295524511197539313941449187869534010989726071687788763693759999187824387894140977361208733280401253612200203986214145483857963112808342905099724088132412806528470564930104421421776344175882732696403073507010449496759592352880571350052356145817302063202888607255090933489652360946250319571857519876651300827199451905318615369519666970135423141302257720879048244385867505029741757264260685324923452202709925632681951048169726750857869243210769560159793041617297996621314605801616574015596493432336397469805482623399493949387212381210878165863813250528004831627694419292979649556897605348988999322136179070494278788841835128864462530088038067547601940242649189920946623106932220614692765736200020807461741493821281580210499474681196168005563462217702275364828762494570831966426454999901416189789761972183680689289025216265811382300886507969929048235821264748581814651873943286987767773574897399444846404485208676244677197824
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

end FranklSmallCyclic.TransportBatches.G051.B000.Data
