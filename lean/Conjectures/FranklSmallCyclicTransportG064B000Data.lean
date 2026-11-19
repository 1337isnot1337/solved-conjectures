module

public import Conjectures.FranklSmallCyclicRowCoverage
public import Conjectures.FranklSmallCyclicCanonicalWords
public import Conjectures.FranklSmallCyclicOrbit9Block011Data

/-! 128 literal targets sharing one source proof block.
Original words and row indices are retained; weights may be transported.
-/
@[expose] public section

namespace FranklSmallCyclic.TransportBatches.G064.B000.Data

-- Period 9, original row 128, representative 8206.
def source0 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B011.Data.entryAt ⟨47, by decide +kernel⟩

def target0 : Weights.Entry :=
  { word := [0, 1, 0, 9, 4, 12, 4], weights := [1, 0, 1, 1] }

-- Period 9, original row 132, representative 8202.
def source1 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B011.Data.entryAt ⟨43, by decide +kernel⟩

def target1 : Weights.Entry :=
  { word := [0, 1, 0, 9, 12, 12, 4], weights := [1, 0, 1, 1] }

-- Period 9, original row 186, representative 8198.
def source2 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B011.Data.entryAt ⟨39, by decide +kernel⟩

def target2 : Weights.Entry :=
  { word := [0, 1, 4, 10, 0, 12, 2], weights := [1, 0, 1, 1] }

-- Period 9, original row 187, representative 8198.
def source3 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B011.Data.entryAt ⟨39, by decide +kernel⟩

def target3 : Weights.Entry :=
  { word := [0, 1, 4, 10, 0, 12, 4], weights := [1, 0, 1, 1] }

def points3 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 8), (8, 7)]

-- Period 9, original row 197, representative 8196.
def source4 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B011.Data.entryAt ⟨37, by decide +kernel⟩

def target4 : Weights.Entry :=
  { word := [0, 1, 4, 10, 8, 12, 4], weights := [1, 0, 1, 1] }

-- Period 9, original row 219, representative 8205.
def source5 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B011.Data.entryAt ⟨46, by decide +kernel⟩

def target5 : Weights.Entry :=
  { word := [0, 1, 8, 9, 4, 12, 4], weights := [1, 0, 1, 1] }

-- Period 9, original row 223, representative 8201.
def source6 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B011.Data.entryAt ⟨42, by decide +kernel⟩

def target6 : Weights.Entry :=
  { word := [0, 1, 8, 9, 12, 12, 4], weights := [1, 0, 1, 1] }

-- Period 9, original row 279, representative 8197.
def source7 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B011.Data.entryAt ⟨38, by decide +kernel⟩

def target7 : Weights.Entry :=
  { word := [0, 1, 12, 10, 0, 12, 2], weights := [1, 0, 1, 1] }

-- Period 9, original row 280, representative 8197.
def source8 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B011.Data.entryAt ⟨38, by decide +kernel⟩

def target8 : Weights.Entry :=
  { word := [0, 1, 12, 10, 0, 12, 4], weights := [1, 0, 1, 1] }

def points8 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 8), (8, 7)]

-- Period 9, original row 290, representative 8195.
def source9 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B011.Data.entryAt ⟨36, by decide +kernel⟩

def target9 : Weights.Entry :=
  { word := [0, 1, 12, 10, 8, 12, 4], weights := [1, 0, 1, 1] }

-- Period 9, original row 308, representative 8194.
def source10 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B011.Data.entryAt ⟨35, by decide +kernel⟩

def target10 : Weights.Entry :=
  { word := [0, 2, 0, 8, 8, 12, 4], weights := [0, 1, 0, 1] }

-- Period 9, original row 361, representative 8166.
def source11 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B011.Data.entryAt ⟨7, by decide +kernel⟩

def target11 : Weights.Entry :=
  { word := [0, 2, 2, 2, 8, 12, 2], weights := [0, 1, 0, 1] }

-- Period 9, original row 362, representative 8188.
def source12 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B011.Data.entryAt ⟨29, by decide +kernel⟩

def target12 : Weights.Entry :=
  { word := [0, 2, 2, 2, 8, 12, 4], weights := [0, 1, 0, 1] }

-- Period 9, original row 378, representative 8198.
def source13 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B011.Data.entryAt ⟨39, by decide +kernel⟩

def target13 : Weights.Entry :=
  { word := [0, 2, 2, 10, 0, 12, 2], weights := [0, 1, 1, 1] }

def points13 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 379, representative 8198.
def source14 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B011.Data.entryAt ⟨39, by decide +kernel⟩

def target14 : Weights.Entry :=
  { word := [0, 2, 2, 10, 0, 12, 4], weights := [0, 1, 1, 1] }

def points14 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6), (7, 8), (8, 7)]

-- Period 9, original row 406, representative 8167.
def source15 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B011.Data.entryAt ⟨8, by decide +kernel⟩

def target15 : Weights.Entry :=
  { word := [0, 2, 2, 10, 8, 12, 2], weights := [0, 1, 1, 0] }

-- Period 9, original row 407, representative 8189.
def source16 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B011.Data.entryAt ⟨30, by decide +kernel⟩

def target16 : Weights.Entry :=
  { word := [0, 2, 2, 10, 8, 12, 4], weights := [0, 1, 0, 1] }

-- Period 9, original row 459, representative 8164.
def source17 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B011.Data.entryAt ⟨5, by decide +kernel⟩

def target17 : Weights.Entry :=
  { word := [0, 2, 10, 2, 8, 12, 2], weights := [0, 1, 0, 1] }

-- Period 9, original row 460, representative 8186.
def source18 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B011.Data.entryAt ⟨27, by decide +kernel⟩

def target18 : Weights.Entry :=
  { word := [0, 2, 10, 2, 8, 12, 4], weights := [0, 1, 0, 1] }

-- Period 9, original row 480, representative 8197.
def source19 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B011.Data.entryAt ⟨38, by decide +kernel⟩

def target19 : Weights.Entry :=
  { word := [0, 2, 10, 10, 0, 12, 2], weights := [0, 1, 1, 1] }

def points19 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 481, representative 8197.
def source20 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B011.Data.entryAt ⟨38, by decide +kernel⟩

def target20 : Weights.Entry :=
  { word := [0, 2, 10, 10, 0, 12, 4], weights := [0, 1, 1, 1] }

def points20 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6), (7, 8), (8, 7)]

-- Period 9, original row 501, representative 8165.
def source21 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B011.Data.entryAt ⟨6, by decide +kernel⟩

def target21 : Weights.Entry :=
  { word := [0, 2, 10, 10, 8, 12, 2], weights := [0, 1, 1, 0] }

-- Period 9, original row 502, representative 8187.
def source22 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B011.Data.entryAt ⟨28, by decide +kernel⟩

def target22 : Weights.Entry :=
  { word := [0, 2, 10, 10, 8, 12, 4], weights := [0, 1, 0, 1] }

-- Period 9, original row 591, representative 8245.
def source23 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B011.Data.entryAt ⟨86, by decide +kernel⟩

def target23 : Weights.Entry :=
  { word := [0, 4, 2, 8, 8, 12, 2], weights := [0, 1, 1, 0] }

-- Period 9, original row 656, representative 8252.
def source24 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B011.Data.entryAt ⟨93, by decide +kernel⟩

def target24 : Weights.Entry :=
  { word := [0, 4, 8, 4, 8, 12, 2], weights := [1, 0, 1, 0] }

-- Period 9, original row 657, representative 8258.
def source25 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B011.Data.entryAt ⟨99, by decide +kernel⟩

def target25 : Weights.Entry :=
  { word := [0, 4, 8, 4, 8, 12, 4], weights := [1, 0, 0, 1] }

-- Period 9, original row 684, representative 8253.
def source26 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B011.Data.entryAt ⟨94, by decide +kernel⟩

def target26 : Weights.Entry :=
  { word := [0, 4, 8, 12, 8, 12, 2], weights := [1, 0, 1, 0] }

-- Period 9, original row 685, representative 8259.
def source27 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B011.Data.entryAt ⟨100, by decide +kernel⟩

def target27 : Weights.Entry :=
  { word := [0, 4, 8, 12, 8, 12, 4], weights := [1, 0, 1, 0] }

-- Period 9, original row 711, representative 8244.
def source28 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B011.Data.entryAt ⟨85, by decide +kernel⟩

def target28 : Weights.Entry :=
  { word := [0, 4, 10, 8, 8, 12, 2], weights := [0, 1, 1, 0] }

-- Period 9, original row 743, representative 8191.
def source29 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B011.Data.entryAt ⟨32, by decide +kernel⟩

def target29 : Weights.Entry :=
  { word := [0, 6, 0, 12, 8, 12, 4], weights := [0, 1, 0, 1] }

-- Period 9, original row 763, representative 8159.
def source30 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B011.Data.entryAt ⟨0, by decide +kernel⟩

def target30 : Weights.Entry :=
  { word := [0, 6, 2, 8, 8, 12, 2], weights := [0, 1, 1, 0] }

-- Period 9, original row 773, representative 8168.
def source31 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B011.Data.entryAt ⟨9, by decide +kernel⟩

def target31 : Weights.Entry :=
  { word := [0, 6, 8, 12, 8, 12, 2], weights := [0, 1, 1, 0] }

-- Period 9, original row 774, representative 8190.
def source32 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B011.Data.entryAt ⟨31, by decide +kernel⟩

def target32 : Weights.Entry :=
  { word := [0, 6, 8, 12, 8, 12, 4], weights := [0, 1, 0, 1] }

-- Period 9, original row 798, representative 8262.
def source33 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B011.Data.entryAt ⟨103, by decide +kernel⟩

def target33 : Weights.Entry :=
  { word := [0, 8, 0, 0, 1, 12, 4], weights := [0, 0, 1, 1] }

-- Period 9, original row 803, representative 8248.
def source34 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B011.Data.entryAt ⟨89, by decide +kernel⟩

def target34 : Weights.Entry :=
  { word := [0, 8, 0, 0, 9, 12, 4], weights := [0, 0, 1, 1] }

-- Period 9, original row 810, representative 8262.
def source35 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B011.Data.entryAt ⟨103, by decide +kernel⟩

def target35 : Weights.Entry :=
  { word := [0, 8, 0, 4, 0, 12, 4], weights := [0, 0, 1, 1] }

def points35 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 836, representative 8260.
def source36 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B011.Data.entryAt ⟨101, by decide +kernel⟩

def target36 : Weights.Entry :=
  { word := [0, 8, 0, 4, 8, 12, 4], weights := [1, 0, 0, 1] }

-- Period 9, original row 858, representative 8263.
def source37 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B011.Data.entryAt ⟨104, by decide +kernel⟩

def target37 : Weights.Entry :=
  { word := [0, 8, 0, 8, 1, 12, 4], weights := [0, 1, 1, 0] }

-- Period 9, original row 866, representative 8264.
def source38 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B011.Data.entryAt ⟨105, by decide +kernel⟩

def target38 : Weights.Entry :=
  { word := [0, 8, 0, 8, 8, 12, 4], weights := [0, 1, 0, 1] }

-- Period 9, original row 870, representative 8249.
def source39 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B011.Data.entryAt ⟨90, by decide +kernel⟩

def target39 : Weights.Entry :=
  { word := [0, 8, 0, 8, 9, 12, 4], weights := [0, 1, 1, 0] }

-- Period 9, original row 879, representative 8263.
def source40 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B011.Data.entryAt ⟨104, by decide +kernel⟩

def target40 : Weights.Entry :=
  { word := [0, 8, 0, 12, 0, 12, 4], weights := [1, 0, 1, 0] }

def points40 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 888, representative 8261.
def source41 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B011.Data.entryAt ⟨102, by decide +kernel⟩

def target41 : Weights.Entry :=
  { word := [0, 8, 0, 12, 8, 12, 4], weights := [1, 0, 1, 0] }

-- Period 9, original row 911, representative 8254.
def source42 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B011.Data.entryAt ⟨95, by decide +kernel⟩

def target42 : Weights.Entry :=
  { word := [0, 8, 1, 4, 8, 12, 4], weights := [1, 0, 0, 1] }

-- Period 9, original row 934, representative 8257.
def source43 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B011.Data.entryAt ⟨98, by decide +kernel⟩

def target43 : Weights.Entry :=
  { word := [0, 8, 1, 12, 8, 12, 4], weights := [1, 0, 1, 0] }

-- Period 9, original row 1006, representative 8241.
def source44 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B011.Data.entryAt ⟨82, by decide +kernel⟩

def target44 : Weights.Entry :=
  { word := [0, 8, 4, 8, 4, 12, 4], weights := [0, 1, 0, 1] }

-- Period 9, original row 1010, representative 8239.
def source45 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B011.Data.entryAt ⟨80, by decide +kernel⟩

def target45 : Weights.Entry :=
  { word := [0, 8, 4, 8, 12, 12, 4], weights := [0, 1, 0, 1] }

-- Period 9, original row 1057, representative 8247.
def source46 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B011.Data.entryAt ⟨88, by decide +kernel⟩

def target46 : Weights.Entry :=
  { word := [0, 8, 8, 8, 4, 12, 4], weights := [0, 1, 0, 1] }

-- Period 9, original row 1062, representative 8246.
def source47 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B011.Data.entryAt ⟨87, by decide +kernel⟩

def target47 : Weights.Entry :=
  { word := [0, 8, 8, 8, 12, 12, 4], weights := [0, 1, 0, 1] }

-- Period 9, original row 1120, representative 8240.
def source48 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B011.Data.entryAt ⟨81, by decide +kernel⟩

def target48 : Weights.Entry :=
  { word := [0, 8, 12, 8, 4, 12, 4], weights := [0, 1, 0, 1] }

-- Period 9, original row 1124, representative 8238.
def source49 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B011.Data.entryAt ⟨79, by decide +kernel⟩

def target49 : Weights.Entry :=
  { word := [0, 8, 12, 8, 12, 12, 4], weights := [0, 1, 0, 1] }

-- Period 9, original row 1192, representative 8204.
def source50 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B011.Data.entryAt ⟨45, by decide +kernel⟩

def target50 : Weights.Entry :=
  { word := [0, 9, 0, 9, 4, 12, 4], weights := [1, 1, 1, 1] }

-- Period 9, original row 1196, representative 8200.
def source51 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B011.Data.entryAt ⟨41, by decide +kernel⟩

def target51 : Weights.Entry :=
  { word := [0, 9, 0, 9, 12, 12, 4], weights := [1, 1, 1, 1] }

-- Period 9, original row 1303, representative 8203.
def source52 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B011.Data.entryAt ⟨44, by decide +kernel⟩

def target52 : Weights.Entry :=
  { word := [0, 9, 8, 9, 4, 12, 4], weights := [1, 1, 1, 1] }

-- Period 9, original row 1307, representative 8199.
def source53 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B011.Data.entryAt ⟨40, by decide +kernel⟩

def target53 : Weights.Entry :=
  { word := [0, 9, 8, 9, 12, 12, 4], weights := [1, 1, 1, 1] }

-- Period 9, original row 1357, representative 8193.
def source54 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B011.Data.entryAt ⟨34, by decide +kernel⟩

def target54 : Weights.Entry :=
  { word := [0, 10, 0, 8, 8, 12, 4], weights := [0, 1, 0, 1] }

-- Period 9, original row 1371, representative 8192.
def source55 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B011.Data.entryAt ⟨33, by decide +kernel⟩

def target55 : Weights.Entry :=
  { word := [0, 10, 0, 12, 8, 12, 4], weights := [0, 1, 0, 1] }

-- Period 9, original row 1404, representative 8162.
def source56 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B011.Data.entryAt ⟨3, by decide +kernel⟩

def target56 : Weights.Entry :=
  { word := [0, 10, 2, 2, 8, 12, 2], weights := [0, 1, 0, 1] }

-- Period 9, original row 1405, representative 8184.
def source57 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B011.Data.entryAt ⟨25, by decide +kernel⟩

def target57 : Weights.Entry :=
  { word := [0, 10, 2, 2, 8, 12, 4], weights := [0, 1, 0, 1] }

-- Period 9, original row 1432, representative 8163.
def source58 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B011.Data.entryAt ⟨4, by decide +kernel⟩

def target58 : Weights.Entry :=
  { word := [0, 10, 2, 10, 8, 12, 2], weights := [0, 1, 1, 0] }

-- Period 9, original row 1433, representative 8185.
def source59 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B011.Data.entryAt ⟨26, by decide +kernel⟩

def target59 : Weights.Entry :=
  { word := [0, 10, 2, 10, 8, 12, 4], weights := [0, 1, 0, 1] }

-- Period 9, original row 1479, representative 8160.
def source60 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B011.Data.entryAt ⟨1, by decide +kernel⟩

def target60 : Weights.Entry :=
  { word := [0, 10, 10, 2, 8, 12, 2], weights := [0, 1, 0, 1] }

-- Period 9, original row 1480, representative 8182.
def source61 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B011.Data.entryAt ⟨23, by decide +kernel⟩

def target61 : Weights.Entry :=
  { word := [0, 10, 10, 2, 8, 12, 4], weights := [0, 1, 0, 1] }

-- Period 9, original row 1500, representative 8161.
def source62 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B011.Data.entryAt ⟨2, by decide +kernel⟩

def target62 : Weights.Entry :=
  { word := [0, 10, 10, 10, 8, 12, 2], weights := [0, 1, 1, 0] }

-- Period 9, original row 1501, representative 8183.
def source63 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B011.Data.entryAt ⟨24, by decide +kernel⟩

def target63 : Weights.Entry :=
  { word := [0, 10, 10, 10, 8, 12, 4], weights := [0, 1, 0, 1] }

-- Period 9, original row 1524, representative 8254.
def source64 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B011.Data.entryAt ⟨95, by decide +kernel⟩

def target64 : Weights.Entry :=
  { word := [0, 12, 0, 4, 8, 12, 4], weights := [1, 0, 0, 1] }

def points64 : List (ℕ × ℕ) := [(0, 0), (1, 2), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 1547, representative 8257.
def source65 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B011.Data.entryAt ⟨98, by decide +kernel⟩

def target65 : Weights.Entry :=
  { word := [0, 12, 0, 12, 8, 12, 4], weights := [1, 0, 1, 0] }

def points65 : List (ℕ × ℕ) := [(0, 0), (1, 2), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 1590, representative 8243.
def source66 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B011.Data.entryAt ⟨84, by decide +kernel⟩

def target66 : Weights.Entry :=
  { word := [0, 12, 2, 8, 8, 12, 2], weights := [0, 1, 1, 0] }

-- Period 9, original row 1655, representative 8250.
def source67 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B011.Data.entryAt ⟨91, by decide +kernel⟩

def target67 : Weights.Entry :=
  { word := [0, 12, 8, 4, 8, 12, 2], weights := [1, 0, 1, 0] }

-- Period 9, original row 1656, representative 8255.
def source68 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B011.Data.entryAt ⟨96, by decide +kernel⟩

def target68 : Weights.Entry :=
  { word := [0, 12, 8, 4, 8, 12, 4], weights := [1, 0, 0, 1] }

-- Period 9, original row 1683, representative 8251.
def source69 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B011.Data.entryAt ⟨92, by decide +kernel⟩

def target69 : Weights.Entry :=
  { word := [0, 12, 8, 12, 8, 12, 2], weights := [1, 0, 1, 0] }

-- Period 9, original row 1684, representative 8256.
def source70 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B011.Data.entryAt ⟨97, by decide +kernel⟩

def target70 : Weights.Entry :=
  { word := [0, 12, 8, 12, 8, 12, 4], weights := [1, 0, 1, 0] }

-- Period 9, original row 1710, representative 8242.
def source71 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B011.Data.entryAt ⟨83, by decide +kernel⟩

def target71 : Weights.Entry :=
  { word := [0, 12, 10, 8, 8, 12, 2], weights := [0, 1, 1, 0] }

-- Period 9, original row 1880, representative 8245.
def source72 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B011.Data.entryAt ⟨86, by decide +kernel⟩

def target72 : Weights.Entry :=
  { word := [1, 4, 2, 8, 8, 12, 2], weights := [0, 1, 1, 0] }

def points72 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 1940, representative 8252.
def source73 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B011.Data.entryAt ⟨93, by decide +kernel⟩

def target73 : Weights.Entry :=
  { word := [1, 4, 8, 4, 8, 12, 2], weights := [1, 0, 1, 0] }

def points73 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 1941, representative 8258.
def source74 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B011.Data.entryAt ⟨99, by decide +kernel⟩

def target74 : Weights.Entry :=
  { word := [1, 4, 8, 4, 8, 12, 4], weights := [1, 0, 0, 1] }

def points74 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 1968, representative 8253.
def source75 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B011.Data.entryAt ⟨94, by decide +kernel⟩

def target75 : Weights.Entry :=
  { word := [1, 4, 8, 12, 8, 12, 2], weights := [1, 0, 1, 0] }

def points75 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 1969, representative 8259.
def source76 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B011.Data.entryAt ⟨100, by decide +kernel⟩

def target76 : Weights.Entry :=
  { word := [1, 4, 8, 12, 8, 12, 4], weights := [1, 0, 1, 0] }

def points76 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 1995, representative 8244.
def source77 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B011.Data.entryAt ⟨85, by decide +kernel⟩

def target77 : Weights.Entry :=
  { word := [1, 4, 10, 8, 8, 12, 2], weights := [0, 1, 1, 0] }

def points77 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 2041, representative 8254.
def source78 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B011.Data.entryAt ⟨95, by decide +kernel⟩

def target78 : Weights.Entry :=
  { word := [1, 8, 1, 4, 8, 12, 4], weights := [1, 0, 0, 1] }

def points78 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 2064, representative 8257.
def source79 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B011.Data.entryAt ⟨98, by decide +kernel⟩

def target79 : Weights.Entry :=
  { word := [1, 8, 1, 12, 8, 12, 4], weights := [1, 0, 1, 0] }

def points79 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 2239, representative 8243.
def source80 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B011.Data.entryAt ⟨84, by decide +kernel⟩

def target80 : Weights.Entry :=
  { word := [1, 12, 2, 8, 8, 12, 2], weights := [0, 1, 1, 0] }

def points80 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 2299, representative 8250.
def source81 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B011.Data.entryAt ⟨91, by decide +kernel⟩

def target81 : Weights.Entry :=
  { word := [1, 12, 8, 4, 8, 12, 2], weights := [1, 0, 1, 0] }

def points81 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 2300, representative 8255.
def source82 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B011.Data.entryAt ⟨96, by decide +kernel⟩

def target82 : Weights.Entry :=
  { word := [1, 12, 8, 4, 8, 12, 4], weights := [1, 0, 0, 1] }

def points82 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 2327, representative 8251.
def source83 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B011.Data.entryAt ⟨92, by decide +kernel⟩

def target83 : Weights.Entry :=
  { word := [1, 12, 8, 12, 8, 12, 2], weights := [1, 0, 1, 0] }

def points83 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 2328, representative 8256.
def source84 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B011.Data.entryAt ⟨97, by decide +kernel⟩

def target84 : Weights.Entry :=
  { word := [1, 12, 8, 12, 8, 12, 4], weights := [1, 0, 1, 0] }

def points84 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 2354, representative 8242.
def source85 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B011.Data.entryAt ⟨83, by decide +kernel⟩

def target85 : Weights.Entry :=
  { word := [1, 12, 10, 8, 8, 12, 2], weights := [0, 1, 1, 0] }

def points85 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 2472, representative 8275.
def source86 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B011.Data.entryAt ⟨116, by decide +kernel⟩

def target86 : Weights.Entry :=
  { word := [2, 0, 8, 4, 8, 4, 4], weights := [1, 0, 0, 1] }

-- Period 9, original row 2476, representative 8279.
def source87 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B011.Data.entryAt ⟨120, by decide +kernel⟩

def target87 : Weights.Entry :=
  { word := [2, 0, 8, 9, 4, 4, 4], weights := [1, 0, 1, 1] }

-- Period 9, original row 2480, representative 8278.
def source88 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B011.Data.entryAt ⟨119, by decide +kernel⟩

def target88 : Weights.Entry :=
  { word := [2, 0, 8, 9, 12, 4, 4], weights := [1, 0, 1, 1] }

-- Period 9, original row 2488, representative 8277.
def source89 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B011.Data.entryAt ⟨118, by decide +kernel⟩

def target89 : Weights.Entry :=
  { word := [2, 0, 8, 12, 0, 4, 2], weights := [1, 0, 1, 0] }

-- Period 9, original row 2489, representative 8277.
def source90 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B011.Data.entryAt ⟨118, by decide +kernel⟩

def target90 : Weights.Entry :=
  { word := [2, 0, 8, 12, 0, 4, 4], weights := [1, 0, 1, 0] }

def points90 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 8), (8, 7)]

-- Period 9, original row 2502, representative 8276.
def source91 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B011.Data.entryAt ⟨117, by decide +kernel⟩

def target91 : Weights.Entry :=
  { word := [2, 0, 8, 12, 8, 4, 4], weights := [1, 0, 1, 0] }

-- Period 9, original row 2594, representative 8285.
def source92 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B011.Data.entryAt ⟨126, by decide +kernel⟩

def target92 : Weights.Entry :=
  { word := [2, 2, 0, 9, 8, 9, 4], weights := [1, 1, 0, 1] }

-- Period 9, original row 2596, representative 8284.
def source93 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B011.Data.entryAt ⟨125, by decide +kernel⟩

def target93 : Weights.Entry :=
  { word := [2, 2, 0, 9, 8, 10, 2], weights := [1, 1, 0, 1] }

-- Period 9, original row 2607, representative 8274.
def source94 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B011.Data.entryAt ⟨115, by decide +kernel⟩

def target94 : Weights.Entry :=
  { word := [2, 2, 0, 10, 0, 8, 4], weights := [1, 0, 0, 1] }

-- Period 9, original row 2611, representative 8277.
def source95 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B011.Data.entryAt ⟨118, by decide +kernel⟩

def target95 : Weights.Entry :=
  { word := [2, 2, 0, 10, 8, 0, 4], weights := [0, 1, 0, 1] }

def points95 : List (ℕ × ℕ) := [(0, 1), (1, 2), (2, 7), (3, 4), (4, 5), (5, 6), (6, 3), (7, 0), (8, 8)]

-- Period 9, original row 2613, representative 8273.
def source96 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B011.Data.entryAt ⟨114, by decide +kernel⟩

def target96 : Weights.Entry :=
  { word := [2, 2, 0, 10, 8, 8, 4], weights := [1, 0, 0, 1] }

-- Period 9, original row 2642, representative 8279.
def source97 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B011.Data.entryAt ⟨120, by decide +kernel⟩

def target97 : Weights.Entry :=
  { word := [2, 2, 2, 8, 9, 0, 4], weights := [1, 1, 0, 1] }

def points97 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 2660, representative 8269.
def source98 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B011.Data.entryAt ⟨110, by decide +kernel⟩

def target98 : Weights.Entry :=
  { word := [2, 2, 8, 2, 0, 8, 2], weights := [1, 0, 0, 1] }

-- Period 9, original row 2661, representative 8269.
def source99 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B011.Data.entryAt ⟨110, by decide +kernel⟩

def target99 : Weights.Entry :=
  { word := [2, 2, 8, 2, 0, 8, 4], weights := [1, 0, 0, 1] }

def points99 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 8), (8, 7)]

-- Period 9, original row 2670, representative 8275.
def source100 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B011.Data.entryAt ⟨116, by decide +kernel⟩

def target100 : Weights.Entry :=
  { word := [2, 2, 8, 2, 8, 0, 4], weights := [1, 0, 0, 1] }

def points100 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 2674, representative 8270.
def source101 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B011.Data.entryAt ⟨111, by decide +kernel⟩

def target101 : Weights.Entry :=
  { word := [2, 2, 8, 2, 8, 8, 4], weights := [1, 0, 0, 1] }

-- Period 9, original row 2699, representative 8283.
def source102 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B011.Data.entryAt ⟨124, by decide +kernel⟩

def target102 : Weights.Entry :=
  { word := [2, 2, 8, 9, 8, 9, 4], weights := [1, 1, 0, 1] }

-- Period 9, original row 2701, representative 8282.
def source103 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B011.Data.entryAt ⟨123, by decide +kernel⟩

def target103 : Weights.Entry :=
  { word := [2, 2, 8, 9, 8, 10, 2], weights := [1, 1, 0, 1] }

-- Period 9, original row 2710, representative 8272.
def source104 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B011.Data.entryAt ⟨113, by decide +kernel⟩

def target104 : Weights.Entry :=
  { word := [2, 2, 8, 10, 0, 8, 2], weights := [1, 0, 0, 1] }

-- Period 9, original row 2711, representative 8272.
def source105 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B011.Data.entryAt ⟨113, by decide +kernel⟩

def target105 : Weights.Entry :=
  { word := [2, 2, 8, 10, 0, 8, 4], weights := [1, 0, 0, 1] }

def points105 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 8), (8, 7)]

-- Period 9, original row 2721, representative 8276.
def source106 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B011.Data.entryAt ⟨117, by decide +kernel⟩

def target106 : Weights.Entry :=
  { word := [2, 2, 8, 10, 8, 0, 4], weights := [0, 1, 0, 1] }

def points106 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 2727, representative 8271.
def source107 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B011.Data.entryAt ⟨112, by decide +kernel⟩

def target107 : Weights.Entry :=
  { word := [2, 2, 8, 10, 8, 8, 4], weights := [1, 0, 0, 1] }

-- Period 9, original row 2740, representative 8281.
def source108 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B011.Data.entryAt ⟨122, by decide +kernel⟩

def target108 : Weights.Entry :=
  { word := [2, 2, 8, 12, 2, 8, 2], weights := [1, 1, 1, 1] }

-- Period 9, original row 2756, representative 8280.
def source109 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B011.Data.entryAt ⟨121, by decide +kernel⟩

def target109 : Weights.Entry :=
  { word := [2, 2, 8, 12, 10, 8, 2], weights := [1, 1, 1, 1] }

-- Period 9, original row 2757, representative 8286.
def source110 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B011.Data.entryAt ⟨127, by decide +kernel⟩

def target110 : Weights.Entry :=
  { word := [2, 2, 8, 12, 10, 8, 4], weights := [2, 1, 1, 2] }

-- Period 9, original row 2784, representative 8278.
def source111 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B011.Data.entryAt ⟨119, by decide +kernel⟩

def target111 : Weights.Entry :=
  { word := [2, 2, 10, 8, 9, 0, 4], weights := [1, 1, 0, 1] }

def points111 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 2823, representative 8265.
def source112 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B011.Data.entryAt ⟨106, by decide +kernel⟩

def target112 : Weights.Entry :=
  { word := [2, 8, 0, 4, 8, 4, 2], weights := [1, 0, 1, 0] }

-- Period 9, original row 2824, representative 8269.
def source113 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B011.Data.entryAt ⟨110, by decide +kernel⟩

def target113 : Weights.Entry :=
  { word := [2, 8, 0, 4, 8, 4, 4], weights := [1, 0, 0, 1] }

def points113 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2)]

-- Period 9, original row 2849, representative 8274.
def source114 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B011.Data.entryAt ⟨115, by decide +kernel⟩

def target114 : Weights.Entry :=
  { word := [2, 8, 0, 12, 0, 4, 2], weights := [1, 0, 0, 1] }

def points114 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 2850, representative 8274.
def source115 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B011.Data.entryAt ⟨115, by decide +kernel⟩

def target115 : Weights.Entry :=
  { word := [2, 8, 0, 12, 0, 4, 4], weights := [1, 0, 0, 1] }

def points115 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 2874, representative 8268.
def source116 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B011.Data.entryAt ⟨109, by decide +kernel⟩

def target116 : Weights.Entry :=
  { word := [2, 8, 0, 12, 8, 4, 2], weights := [1, 0, 1, 0] }

-- Period 9, original row 2875, representative 8272.
def source117 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B011.Data.entryAt ⟨113, by decide +kernel⟩

def target117 : Weights.Entry :=
  { word := [2, 8, 0, 12, 8, 4, 4], weights := [1, 0, 0, 1] }

def points117 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2)]

-- Period 9, original row 2989, representative 8266.
def source118 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B011.Data.entryAt ⟨107, by decide +kernel⟩

def target118 : Weights.Entry :=
  { word := [2, 8, 8, 4, 8, 4, 2], weights := [1, 0, 1, 0] }

-- Period 9, original row 2990, representative 8270.
def source119 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B011.Data.entryAt ⟨111, by decide +kernel⟩

def target119 : Weights.Entry :=
  { word := [2, 8, 8, 4, 8, 4, 4], weights := [1, 0, 0, 1] }

def points119 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 3033, representative 8273.
def source120 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B011.Data.entryAt ⟨114, by decide +kernel⟩

def target120 : Weights.Entry :=
  { word := [2, 8, 8, 12, 0, 4, 2], weights := [1, 0, 0, 1] }

def points120 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 3034, representative 8273.
def source121 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B011.Data.entryAt ⟨114, by decide +kernel⟩

def target121 : Weights.Entry :=
  { word := [2, 8, 8, 12, 0, 4, 4], weights := [1, 0, 0, 1] }

def points121 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 3062, representative 8267.
def source122 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B011.Data.entryAt ⟨108, by decide +kernel⟩

def target122 : Weights.Entry :=
  { word := [2, 8, 8, 12, 8, 4, 2], weights := [1, 0, 1, 0] }

-- Period 9, original row 3063, representative 8271.
def source123 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B011.Data.entryAt ⟨112, by decide +kernel⟩

def target123 : Weights.Entry :=
  { word := [2, 8, 8, 12, 8, 4, 4], weights := [1, 0, 0, 1] }

def points123 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 3090, representative 8285.
def source124 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B011.Data.entryAt ⟨126, by decide +kernel⟩

def target124 : Weights.Entry :=
  { word := [2, 8, 9, 8, 1, 4, 2], weights := [1, 0, 1, 1] }

def points124 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 3091, representative 8285.
def source125 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B011.Data.entryAt ⟨126, by decide +kernel⟩

def target125 : Weights.Entry :=
  { word := [2, 8, 9, 8, 1, 4, 4], weights := [1, 0, 1, 1] }

def points125 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 3100, representative 8283.
def source126 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B011.Data.entryAt ⟨124, by decide +kernel⟩

def target126 : Weights.Entry :=
  { word := [2, 8, 9, 8, 9, 4, 4], weights := [1, 0, 1, 1] }

def points126 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 3152, representative 8286.
def source127 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B011.Data.entryAt ⟨127, by decide +kernel⟩

def target127 : Weights.Entry :=
  { word := [2, 8, 12, 10, 8, 4, 4], weights := [2, 1, 1, 2] }

def points127 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

def period9Entries : List Weights.Entry := [target0, target1, target2, target3, target4, target5, target6, target7, target8, target9, target10, target11, target12, target13, target14, target15, target16, target17, target18, target19, target20, target21, target22, target23, target24, target25, target26, target27, target28, target29, target30, target31, target32, target33, target34, target35, target36, target37, target38, target39, target40, target41, target42, target43, target44, target45, target46, target47, target48, target49, target50, target51, target52, target53, target54, target55, target56, target57, target58, target59, target60, target61, target62, target63, target64, target65, target66, target67, target68, target69, target70, target71, target72, target73, target74, target75, target76, target77, target78, target79, target80, target81, target82, target83, target84, target85, target86, target87, target88, target89, target90, target91, target92, target93, target94, target95, target96, target97, target98, target99, target100, target101, target102, target103, target104, target105, target106, target107, target108, target109, target110, target111, target112, target113, target114, target115, target116, target117, target118, target119, target120, target121, target122, target123, target124, target125, target126, target127]

def period9Chunk : RowCoverage.Chunk where
  rows := [⟨128, target0⟩, ⟨132, target1⟩, ⟨186, target2⟩, ⟨187, target3⟩, ⟨197, target4⟩, ⟨219, target5⟩, ⟨223, target6⟩, ⟨279, target7⟩, ⟨280, target8⟩, ⟨290, target9⟩, ⟨308, target10⟩, ⟨361, target11⟩, ⟨362, target12⟩, ⟨378, target13⟩, ⟨379, target14⟩, ⟨406, target15⟩, ⟨407, target16⟩, ⟨459, target17⟩, ⟨460, target18⟩, ⟨480, target19⟩, ⟨481, target20⟩, ⟨501, target21⟩, ⟨502, target22⟩, ⟨591, target23⟩, ⟨656, target24⟩, ⟨657, target25⟩, ⟨684, target26⟩, ⟨685, target27⟩, ⟨711, target28⟩, ⟨743, target29⟩, ⟨763, target30⟩, ⟨773, target31⟩, ⟨774, target32⟩, ⟨798, target33⟩, ⟨803, target34⟩, ⟨810, target35⟩, ⟨836, target36⟩, ⟨858, target37⟩, ⟨866, target38⟩, ⟨870, target39⟩, ⟨879, target40⟩, ⟨888, target41⟩, ⟨911, target42⟩, ⟨934, target43⟩, ⟨1006, target44⟩, ⟨1010, target45⟩, ⟨1057, target46⟩, ⟨1062, target47⟩, ⟨1120, target48⟩, ⟨1124, target49⟩, ⟨1192, target50⟩, ⟨1196, target51⟩, ⟨1303, target52⟩, ⟨1307, target53⟩, ⟨1357, target54⟩, ⟨1371, target55⟩, ⟨1404, target56⟩, ⟨1405, target57⟩, ⟨1432, target58⟩, ⟨1433, target59⟩, ⟨1479, target60⟩, ⟨1480, target61⟩, ⟨1500, target62⟩, ⟨1501, target63⟩, ⟨1524, target64⟩, ⟨1547, target65⟩, ⟨1590, target66⟩, ⟨1655, target67⟩, ⟨1656, target68⟩, ⟨1683, target69⟩, ⟨1684, target70⟩, ⟨1710, target71⟩, ⟨1880, target72⟩, ⟨1940, target73⟩, ⟨1941, target74⟩, ⟨1968, target75⟩, ⟨1969, target76⟩, ⟨1995, target77⟩, ⟨2041, target78⟩, ⟨2064, target79⟩, ⟨2239, target80⟩, ⟨2299, target81⟩, ⟨2300, target82⟩, ⟨2327, target83⟩, ⟨2328, target84⟩, ⟨2354, target85⟩, ⟨2472, target86⟩, ⟨2476, target87⟩, ⟨2480, target88⟩, ⟨2488, target89⟩, ⟨2489, target90⟩, ⟨2502, target91⟩, ⟨2594, target92⟩, ⟨2596, target93⟩, ⟨2607, target94⟩, ⟨2611, target95⟩, ⟨2613, target96⟩, ⟨2642, target97⟩, ⟨2660, target98⟩, ⟨2661, target99⟩, ⟨2670, target100⟩, ⟨2674, target101⟩, ⟨2699, target102⟩, ⟨2701, target103⟩, ⟨2710, target104⟩, ⟨2711, target105⟩, ⟨2721, target106⟩, ⟨2727, target107⟩, ⟨2740, target108⟩, ⟨2756, target109⟩, ⟨2757, target110⟩, ⟨2784, target111⟩, ⟨2823, target112⟩, ⟨2824, target113⟩, ⟨2849, target114⟩, ⟨2850, target115⟩, ⟨2874, target116⟩, ⟨2875, target117⟩, ⟨2989, target118⟩, ⟨2990, target119⟩, ⟨3033, target120⟩, ⟨3034, target121⟩, ⟨3062, target122⟩, ⟨3063, target123⟩, ⟨3090, target124⟩, ⟨3091, target125⟩, ⟨3100, target126⟩, ⟨3152, target127⟩]
  indexMask := 7023382689590691661513461680623857232744141156942166586004493793220602221876859596265508649966501136795871287521392600491694980332353663167318743901681678169499955994966689079725932114299645494686296599961111739927023923216778883600717789821929207694754876554228283165764599046720808524627291966386659744474890352023621196653274561908053597478922307195555255203252520912867213245994316529571913403495336204813530359416977867729537090018669591395261513909344090777719599618115067386337529511985926614865786822343031228316847408424674162617009168334298860818665495431450210288676213719881731897531610975567726299049807551959917570123314883118368725148094770664828292375736373248352710282630009705939319409493967294768180164369810023808533706921781864024526051059035223414438342633516053012921790426054006786362278167562826476530311075359732185597725792531605192705339613167225865275220666327741842679329494671257037489223434329023696686677090367438848
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

end FranklSmallCyclic.TransportBatches.G064.B000.Data
