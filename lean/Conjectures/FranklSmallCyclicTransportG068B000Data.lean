module

public import Conjectures.FranklSmallCyclicRowCoverage
public import Conjectures.FranklSmallCyclicCanonicalWords
public import Conjectures.FranklSmallCyclicOrbit9Block015Data

/-! 128 literal targets sharing one source proof block.
Original words and row indices are retained; weights may be transported.
-/
@[expose] public section

namespace FranklSmallCyclic.TransportBatches.G068.B000.Data

-- Period 9, original row 138, representative 8680.
def source0 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B015.Data.entryAt ⟨9, by decide +kernel⟩

def target0 : Weights.Entry :=
  { word := [0, 1, 0, 12, 0, 4, 8], weights := [0, 0, 1, 0] }

-- Period 9, original row 176, representative 8699.
def source1 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B015.Data.entryAt ⟨28, by decide +kernel⟩

def target1 : Weights.Entry :=
  { word := [0, 1, 4, 10, 0, 4, 8], weights := [1, 0, 2, 1] }

-- Period 9, original row 213, representative 8674.
def source2 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B015.Data.entryAt ⟨3, by decide +kernel⟩

def target2 : Weights.Entry :=
  { word := [0, 1, 8, 4, 4, 4, 8], weights := [1, 0, 0, 1] }

-- Period 9, original row 230, representative 8675.
def source3 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B015.Data.entryAt ⟨4, by decide +kernel⟩

def target3 : Weights.Entry :=
  { word := [0, 1, 8, 12, 4, 4, 8], weights := [1, 0, 0, 1] }

-- Period 9, original row 267, representative 8698.
def source4 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B015.Data.entryAt ⟨27, by decide +kernel⟩

def target4 : Weights.Entry :=
  { word := [0, 1, 12, 10, 0, 4, 8], weights := [1, 0, 1, 1] }

-- Period 9, original row 297, representative 8680.
def source5 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B015.Data.entryAt ⟨9, by decide +kernel⟩

def target5 : Weights.Entry :=
  { word := [0, 2, 0, 8, 1, 4, 8], weights := [0, 0, 1, 0] }

def points5 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 345, representative 8691.
def source6 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B015.Data.entryAt ⟨20, by decide +kernel⟩

def target6 : Weights.Entry :=
  { word := [0, 2, 2, 2, 8, 4, 8], weights := [0, 1, 0, 1] }

-- Period 9, original row 368, representative 8699.
def source7 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B015.Data.entryAt ⟨28, by decide +kernel⟩

def target7 : Weights.Entry :=
  { word := [0, 2, 2, 10, 0, 4, 8], weights := [0, 1, 2, 1] }

def points7 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 394, representative 8692.
def source8 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B015.Data.entryAt ⟨21, by decide +kernel⟩

def target8 : Weights.Entry :=
  { word := [0, 2, 2, 10, 8, 4, 8], weights := [0, 1, 1, 0] }

-- Period 9, original row 443, representative 8689.
def source9 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B015.Data.entryAt ⟨18, by decide +kernel⟩

def target9 : Weights.Entry :=
  { word := [0, 2, 10, 2, 8, 4, 8], weights := [0, 1, 0, 1] }

-- Period 9, original row 468, representative 8698.
def source10 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B015.Data.entryAt ⟨27, by decide +kernel⟩

def target10 : Weights.Entry :=
  { word := [0, 2, 10, 10, 0, 4, 8], weights := [0, 1, 1, 1] }

def points10 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 489, representative 8690.
def source11 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B015.Data.entryAt ⟨19, by decide +kernel⟩

def target11 : Weights.Entry :=
  { word := [0, 2, 10, 10, 8, 4, 8], weights := [0, 1, 1, 0] }

-- Period 9, original row 589, representative 8752.
def source12 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B015.Data.entryAt ⟨81, by decide +kernel⟩

def target12 : Weights.Entry :=
  { word := [0, 4, 2, 8, 8, 4, 8], weights := [0, 1, 1, 0] }

-- Period 9, original row 648, representative 8771.
def source13 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B015.Data.entryAt ⟨100, by decide +kernel⟩

def target13 : Weights.Entry :=
  { word := [0, 4, 8, 4, 4, 4, 8], weights := [1, 0, 0, 1] }

-- Period 9, original row 653, representative 8781.
def source14 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B015.Data.entryAt ⟨110, by decide +kernel⟩

def target14 : Weights.Entry :=
  { word := [0, 4, 8, 4, 8, 4, 8], weights := [0, 0, 1, 0] }

-- Period 9, original row 674, representative 8759.
def source15 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B015.Data.entryAt ⟨88, by decide +kernel⟩

def target15 : Weights.Entry :=
  { word := [0, 4, 8, 4, 12, 4, 8], weights := [1, 0, 0, 1] }

-- Period 9, original row 677, representative 8772.
def source16 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B015.Data.entryAt ⟨101, by decide +kernel⟩

def target16 : Weights.Entry :=
  { word := [0, 4, 8, 12, 4, 4, 8], weights := [0, 1, 1, 0] }

-- Period 9, original row 681, representative 8782.
def source17 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B015.Data.entryAt ⟨111, by decide +kernel⟩

def target17 : Weights.Entry :=
  { word := [0, 4, 8, 12, 8, 4, 8], weights := [0, 0, 1, 0] }

-- Period 9, original row 689, representative 8760.
def source18 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B015.Data.entryAt ⟨89, by decide +kernel⟩

def target18 : Weights.Entry :=
  { word := [0, 4, 8, 12, 12, 4, 8], weights := [0, 1, 1, 0] }

-- Period 9, original row 709, representative 8751.
def source19 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B015.Data.entryAt ⟨80, by decide +kernel⟩

def target19 : Weights.Entry :=
  { word := [0, 4, 10, 8, 8, 4, 8], weights := [0, 1, 1, 0] }

-- Period 9, original row 740, representative 8695.
def source20 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B015.Data.entryAt ⟨24, by decide +kernel⟩

def target20 : Weights.Entry :=
  { word := [0, 6, 0, 12, 8, 4, 8], weights := [0, 1, 1, 0] }

-- Period 9, original row 751, representative 8790.
def source21 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B015.Data.entryAt ⟨119, by decide +kernel⟩

def target21 : Weights.Entry :=
  { word := [0, 6, 2, 8, 8, 2, 2], weights := [0, 1, 1, 0] }

-- Period 9, original row 754, representative 8684.
def source22 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B015.Data.entryAt ⟨13, by decide +kernel⟩

def target22 : Weights.Entry :=
  { word := [0, 6, 2, 8, 8, 4, 8], weights := [0, 1, 1, 0] }

-- Period 9, original row 757, representative 8792.
def source23 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B015.Data.entryAt ⟨121, by decide +kernel⟩

def target23 : Weights.Entry :=
  { word := [0, 6, 2, 8, 8, 8, 2], weights := [0, 1, 1, 0] }

-- Period 9, original row 761, representative 8788.
def source24 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B015.Data.entryAt ⟨117, by decide +kernel⟩

def target24 : Weights.Entry :=
  { word := [0, 6, 2, 8, 8, 10, 2], weights := [0, 1, 1, 0] }

-- Period 9, original row 766, representative 8693.
def source25 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B015.Data.entryAt ⟨22, by decide +kernel⟩

def target25 : Weights.Entry :=
  { word := [0, 6, 8, 4, 8, 4, 8], weights := [0, 0, 1, 0] }

-- Period 9, original row 770, representative 8694.
def source26 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B015.Data.entryAt ⟨23, by decide +kernel⟩

def target26 : Weights.Entry :=
  { word := [0, 6, 8, 12, 8, 4, 8], weights := [0, 0, 1, 0] }

-- Period 9, original row 778, representative 8789.
def source27 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B015.Data.entryAt ⟨118, by decide +kernel⟩

def target27 : Weights.Entry :=
  { word := [0, 6, 10, 8, 8, 2, 2], weights := [0, 1, 1, 0] }

-- Period 9, original row 781, representative 8683.
def source28 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B015.Data.entryAt ⟨12, by decide +kernel⟩

def target28 : Weights.Entry :=
  { word := [0, 6, 10, 8, 8, 4, 8], weights := [0, 1, 1, 0] }

-- Period 9, original row 784, representative 8791.
def source29 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B015.Data.entryAt ⟨120, by decide +kernel⟩

def target29 : Weights.Entry :=
  { word := [0, 6, 10, 8, 8, 8, 2], weights := [0, 1, 1, 0] }

-- Period 9, original row 788, representative 8787.
def source30 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B015.Data.entryAt ⟨116, by decide +kernel⟩

def target30 : Weights.Entry :=
  { word := [0, 6, 10, 8, 8, 10, 2], weights := [0, 1, 1, 0] }

-- Period 9, original row 795, representative 8785.
def source31 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B015.Data.entryAt ⟨114, by decide +kernel⟩

def target31 : Weights.Entry :=
  { word := [0, 8, 0, 0, 1, 4, 8], weights := [0, 0, 1, 0] }

-- Period 9, original row 807, representative 8785.
def source32 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B015.Data.entryAt ⟨114, by decide +kernel⟩

def target32 : Weights.Entry :=
  { word := [0, 8, 0, 4, 0, 4, 8], weights := [0, 0, 1, 0] }

def points32 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 826, representative 8773.
def source33 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B015.Data.entryAt ⟨102, by decide +kernel⟩

def target33 : Weights.Entry :=
  { word := [0, 8, 0, 4, 4, 4, 8], weights := [0, 0, 0, 1] }

-- Period 9, original row 833, representative 8783.
def source34 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B015.Data.entryAt ⟨112, by decide +kernel⟩

def target34 : Weights.Entry :=
  { word := [0, 8, 0, 4, 8, 4, 8], weights := [0, 0, 1, 0] }

-- Period 9, original row 852, representative 8761.
def source35 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B015.Data.entryAt ⟨90, by decide +kernel⟩

def target35 : Weights.Entry :=
  { word := [0, 8, 0, 4, 12, 4, 8], weights := [0, 0, 0, 1] }

-- Period 9, original row 855, representative 8786.
def source36 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B015.Data.entryAt ⟨115, by decide +kernel⟩

def target36 : Weights.Entry :=
  { word := [0, 8, 0, 8, 1, 4, 8], weights := [0, 0, 1, 0] }

-- Period 9, original row 876, representative 8786.
def source37 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B015.Data.entryAt ⟨115, by decide +kernel⟩

def target37 : Weights.Entry :=
  { word := [0, 8, 0, 12, 0, 4, 8], weights := [0, 0, 1, 0] }

def points37 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 882, representative 8776.
def source38 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B015.Data.entryAt ⟨105, by decide +kernel⟩

def target38 : Weights.Entry :=
  { word := [0, 8, 0, 12, 4, 4, 8], weights := [0, 1, 1, 0] }

-- Period 9, original row 885, representative 8784.
def source39 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B015.Data.entryAt ⟨113, by decide +kernel⟩

def target39 : Weights.Entry :=
  { word := [0, 8, 0, 12, 8, 4, 8], weights := [0, 0, 1, 0] }

-- Period 9, original row 891, representative 8764.
def source40 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B015.Data.entryAt ⟨93, by decide +kernel⟩

def target40 : Weights.Entry :=
  { word := [0, 8, 0, 12, 12, 4, 8], weights := [0, 1, 1, 0] }

-- Period 9, original row 905, representative 8765.
def source41 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B015.Data.entryAt ⟨94, by decide +kernel⟩

def target41 : Weights.Entry :=
  { word := [0, 8, 1, 4, 4, 4, 8], weights := [0, 0, 0, 1] }

-- Period 9, original row 908, representative 8777.
def source42 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B015.Data.entryAt ⟨106, by decide +kernel⟩

def target42 : Weights.Entry :=
  { word := [0, 8, 1, 4, 8, 4, 8], weights := [0, 0, 1, 0] }

-- Period 9, original row 927, representative 8753.
def source43 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B015.Data.entryAt ⟨82, by decide +kernel⟩

def target43 : Weights.Entry :=
  { word := [0, 8, 1, 4, 12, 4, 8], weights := [0, 0, 0, 1] }

-- Period 9, original row 928, representative 8770.
def source44 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B015.Data.entryAt ⟨99, by decide +kernel⟩

def target44 : Weights.Entry :=
  { word := [0, 8, 1, 12, 4, 4, 8], weights := [0, 1, 1, 0] }

-- Period 9, original row 931, representative 8780.
def source45 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B015.Data.entryAt ⟨109, by decide +kernel⟩

def target45 : Weights.Entry :=
  { word := [0, 8, 1, 12, 8, 4, 8], weights := [0, 0, 1, 0] }

-- Period 9, original row 937, representative 8758.
def source46 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B015.Data.entryAt ⟨87, by decide +kernel⟩

def target46 : Weights.Entry :=
  { word := [0, 8, 1, 12, 12, 4, 8], weights := [0, 1, 1, 0] }

-- Period 9, original row 1043, representative 8774.
def source47 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B015.Data.entryAt ⟨103, by decide +kernel⟩

def target47 : Weights.Entry :=
  { word := [0, 8, 8, 4, 4, 4, 8], weights := [1, 0, 0, 1] }

-- Period 9, original row 1051, representative 8762.
def source48 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B015.Data.entryAt ⟨91, by decide +kernel⟩

def target48 : Weights.Entry :=
  { word := [0, 8, 8, 4, 12, 4, 8], weights := [0, 0, 1, 0] }

-- Period 9, original row 1064, representative 8775.
def source49 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B015.Data.entryAt ⟨104, by decide +kernel⟩

def target49 : Weights.Entry :=
  { word := [0, 8, 8, 12, 4, 4, 8], weights := [0, 1, 1, 0] }

-- Period 9, original row 1066, representative 8763.
def source50 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B015.Data.entryAt ⟨92, by decide +kernel⟩

def target50 : Weights.Entry :=
  { word := [0, 8, 8, 12, 12, 4, 8], weights := [0, 0, 1, 0] }

-- Period 9, original row 1069, representative 8766.
def source51 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B015.Data.entryAt ⟨95, by decide +kernel⟩

def target51 : Weights.Entry :=
  { word := [0, 8, 9, 4, 4, 4, 8], weights := [1, 0, 0, 1] }

-- Period 9, original row 1073, representative 8754.
def source52 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B015.Data.entryAt ⟨83, by decide +kernel⟩

def target52 : Weights.Entry :=
  { word := [0, 8, 9, 4, 12, 4, 8], weights := [0, 0, 1, 0] }

-- Period 9, original row 1076, representative 8767.
def source53 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B015.Data.entryAt ⟨96, by decide +kernel⟩

def target53 : Weights.Entry :=
  { word := [0, 8, 9, 12, 4, 4, 8], weights := [0, 1, 1, 0] }

-- Period 9, original row 1078, representative 8755.
def source54 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B015.Data.entryAt ⟨84, by decide +kernel⟩

def target54 : Weights.Entry :=
  { word := [0, 8, 9, 12, 12, 4, 8], weights := [0, 0, 1, 0] }

-- Period 9, original row 1128, representative 8793.
def source55 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B015.Data.entryAt ⟨122, by decide +kernel⟩

def target55 : Weights.Entry :=
  { word := [0, 9, 0, 1, 4, 8, 4], weights := [0, 1, 0, 0] }

-- Period 9, original row 1134, representative 8796.
def source56 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B015.Data.entryAt ⟨125, by decide +kernel⟩

def target56 : Weights.Entry :=
  { word := [0, 9, 0, 1, 12, 8, 4], weights := [0, 1, 0, 0] }

-- Period 9, original row 1146, representative 8678.
def source57 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B015.Data.entryAt ⟨7, by decide +kernel⟩

def target57 : Weights.Entry :=
  { word := [0, 9, 0, 4, 0, 4, 8], weights := [1, 0, 3, 0] }

-- Period 9, original row 1170, representative 8676.
def source58 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B015.Data.entryAt ⟨5, by decide +kernel⟩

def target58 : Weights.Entry :=
  { word := [0, 9, 0, 4, 8, 4, 8], weights := [1, 0, 1, 0] }

-- Period 9, original row 1204, representative 8679.
def source59 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B015.Data.entryAt ⟨8, by decide +kernel⟩

def target59 : Weights.Entry :=
  { word := [0, 9, 0, 12, 0, 4, 8], weights := [1, 0, 1, 0] }

-- Period 9, original row 1223, representative 8673.
def source60 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B015.Data.entryAt ⟨2, by decide +kernel⟩

def target60 : Weights.Entry :=
  { word := [0, 9, 0, 12, 4, 4, 8], weights := [1, 0, 0, 1] }

-- Period 9, original row 1229, representative 8677.
def source61 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B015.Data.entryAt ⟨6, by decide +kernel⟩

def target61 : Weights.Entry :=
  { word := [0, 9, 0, 12, 8, 4, 8], weights := [1, 0, 1, 0] }

-- Period 9, original row 1265, representative 8794.
def source62 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B015.Data.entryAt ⟨123, by decide +kernel⟩

def target62 : Weights.Entry :=
  { word := [0, 9, 8, 1, 4, 8, 4], weights := [0, 1, 0, 0] }

-- Period 9, original row 1271, representative 8795.
def source63 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B015.Data.entryAt ⟨124, by decide +kernel⟩

def target63 : Weights.Entry :=
  { word := [0, 9, 8, 1, 12, 8, 4], weights := [0, 1, 0, 0] }

-- Period 9, original row 1284, representative 8671.
def source64 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B015.Data.entryAt ⟨0, by decide +kernel⟩

def target64 : Weights.Entry :=
  { word := [0, 9, 8, 4, 4, 4, 8], weights := [1, 0, 0, 1] }

-- Period 9, original row 1314, representative 8672.
def source65 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B015.Data.entryAt ⟨1, by decide +kernel⟩

def target65 : Weights.Entry :=
  { word := [0, 9, 8, 12, 4, 4, 8], weights := [1, 0, 0, 1] }

-- Period 9, original row 1338, representative 8678.
def source66 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B015.Data.entryAt ⟨7, by decide +kernel⟩

def target66 : Weights.Entry :=
  { word := [0, 10, 0, 0, 1, 4, 8], weights := [0, 1, 3, 0] }

def points66 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 1346, representative 8679.
def source67 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B015.Data.entryAt ⟨8, by decide +kernel⟩

def target67 : Weights.Entry :=
  { word := [0, 10, 0, 8, 1, 4, 8], weights := [0, 1, 1, 0] }

def points67 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 1368, representative 8696.
def source68 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B015.Data.entryAt ⟨25, by decide +kernel⟩

def target68 : Weights.Entry :=
  { word := [0, 10, 0, 12, 8, 4, 8], weights := [0, 1, 1, 0] }

-- Period 9, original row 1388, representative 8687.
def source69 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B015.Data.entryAt ⟨16, by decide +kernel⟩

def target69 : Weights.Entry :=
  { word := [0, 10, 2, 2, 8, 4, 8], weights := [0, 1, 0, 1] }

-- Period 9, original row 1393, representative 8797.
def source70 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B015.Data.entryAt ⟨126, by decide +kernel⟩

def target70 : Weights.Entry :=
  { word := [0, 10, 2, 2, 8, 8, 2], weights := [1, 0, 0, 1] }

-- Period 9, original row 1420, representative 8688.
def source71 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B015.Data.entryAt ⟨17, by decide +kernel⟩

def target71 : Weights.Entry :=
  { word := [0, 10, 2, 10, 8, 4, 8], weights := [0, 1, 1, 0] }

-- Period 9, original row 1463, representative 8685.
def source72 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B015.Data.entryAt ⟨14, by decide +kernel⟩

def target72 : Weights.Entry :=
  { word := [0, 10, 10, 2, 8, 4, 8], weights := [0, 1, 0, 1] }

-- Period 9, original row 1468, representative 8798.
def source73 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B015.Data.entryAt ⟨127, by decide +kernel⟩

def target73 : Weights.Entry :=
  { word := [0, 10, 10, 2, 8, 8, 2], weights := [1, 0, 0, 1] }

-- Period 9, original row 1488, representative 8686.
def source74 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B015.Data.entryAt ⟨15, by decide +kernel⟩

def target74 : Weights.Entry :=
  { word := [0, 10, 10, 10, 8, 4, 8], weights := [0, 1, 1, 0] }

-- Period 9, original row 1518, representative 8765.
def source75 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B015.Data.entryAt ⟨94, by decide +kernel⟩

def target75 : Weights.Entry :=
  { word := [0, 12, 0, 4, 4, 4, 8], weights := [0, 0, 0, 1] }

def points75 : List (ℕ × ℕ) := [(0, 0), (1, 2), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 1521, representative 8777.
def source76 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B015.Data.entryAt ⟨106, by decide +kernel⟩

def target76 : Weights.Entry :=
  { word := [0, 12, 0, 4, 8, 4, 8], weights := [0, 0, 1, 0] }

def points76 : List (ℕ × ℕ) := [(0, 0), (1, 2), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 1540, representative 8753.
def source77 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B015.Data.entryAt ⟨82, by decide +kernel⟩

def target77 : Weights.Entry :=
  { word := [0, 12, 0, 4, 12, 4, 8], weights := [0, 0, 0, 1] }

def points77 : List (ℕ × ℕ) := [(0, 0), (1, 2), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 1541, representative 8770.
def source78 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B015.Data.entryAt ⟨99, by decide +kernel⟩

def target78 : Weights.Entry :=
  { word := [0, 12, 0, 12, 4, 4, 8], weights := [0, 1, 1, 0] }

def points78 : List (ℕ × ℕ) := [(0, 0), (1, 2), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 1544, representative 8780.
def source79 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B015.Data.entryAt ⟨109, by decide +kernel⟩

def target79 : Weights.Entry :=
  { word := [0, 12, 0, 12, 8, 4, 8], weights := [0, 0, 1, 0] }

def points79 : List (ℕ × ℕ) := [(0, 0), (1, 2), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 1550, representative 8758.
def source80 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B015.Data.entryAt ⟨87, by decide +kernel⟩

def target80 : Weights.Entry :=
  { word := [0, 12, 0, 12, 12, 4, 8], weights := [0, 1, 1, 0] }

def points80 : List (ℕ × ℕ) := [(0, 0), (1, 2), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 1588, representative 8750.
def source81 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B015.Data.entryAt ⟨79, by decide +kernel⟩

def target81 : Weights.Entry :=
  { word := [0, 12, 2, 8, 8, 4, 8], weights := [0, 1, 1, 0] }

-- Period 9, original row 1647, representative 8768.
def source82 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B015.Data.entryAt ⟨97, by decide +kernel⟩

def target82 : Weights.Entry :=
  { word := [0, 12, 8, 4, 4, 4, 8], weights := [1, 0, 0, 1] }

-- Period 9, original row 1652, representative 8778.
def source83 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B015.Data.entryAt ⟨107, by decide +kernel⟩

def target83 : Weights.Entry :=
  { word := [0, 12, 8, 4, 8, 4, 8], weights := [0, 0, 1, 0] }

-- Period 9, original row 1673, representative 8756.
def source84 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B015.Data.entryAt ⟨85, by decide +kernel⟩

def target84 : Weights.Entry :=
  { word := [0, 12, 8, 4, 12, 4, 8], weights := [1, 0, 0, 1] }

-- Period 9, original row 1676, representative 8769.
def source85 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B015.Data.entryAt ⟨98, by decide +kernel⟩

def target85 : Weights.Entry :=
  { word := [0, 12, 8, 12, 4, 4, 8], weights := [0, 1, 1, 0] }

-- Period 9, original row 1680, representative 8779.
def source86 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B015.Data.entryAt ⟨108, by decide +kernel⟩

def target86 : Weights.Entry :=
  { word := [0, 12, 8, 12, 8, 4, 8], weights := [0, 0, 1, 0] }

-- Period 9, original row 1688, representative 8757.
def source87 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B015.Data.entryAt ⟨86, by decide +kernel⟩

def target87 : Weights.Entry :=
  { word := [0, 12, 8, 12, 12, 4, 8], weights := [0, 1, 1, 0] }

-- Period 9, original row 1708, representative 8749.
def source88 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B015.Data.entryAt ⟨78, by decide +kernel⟩

def target88 : Weights.Entry :=
  { word := [0, 12, 10, 8, 8, 4, 8], weights := [0, 1, 1, 0] }

-- Period 9, original row 1878, representative 8752.
def source89 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B015.Data.entryAt ⟨81, by decide +kernel⟩

def target89 : Weights.Entry :=
  { word := [1, 4, 2, 8, 8, 4, 8], weights := [0, 1, 1, 0] }

def points89 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 1932, representative 8771.
def source90 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B015.Data.entryAt ⟨100, by decide +kernel⟩

def target90 : Weights.Entry :=
  { word := [1, 4, 8, 4, 4, 4, 8], weights := [1, 0, 0, 1] }

def points90 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 1937, representative 8781.
def source91 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B015.Data.entryAt ⟨110, by decide +kernel⟩

def target91 : Weights.Entry :=
  { word := [1, 4, 8, 4, 8, 4, 8], weights := [0, 0, 1, 0] }

def points91 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 1958, representative 8759.
def source92 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B015.Data.entryAt ⟨88, by decide +kernel⟩

def target92 : Weights.Entry :=
  { word := [1, 4, 8, 4, 12, 4, 8], weights := [1, 0, 0, 1] }

def points92 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 1961, representative 8772.
def source93 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B015.Data.entryAt ⟨101, by decide +kernel⟩

def target93 : Weights.Entry :=
  { word := [1, 4, 8, 12, 4, 4, 8], weights := [0, 1, 1, 0] }

def points93 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 1965, representative 8782.
def source94 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B015.Data.entryAt ⟨111, by decide +kernel⟩

def target94 : Weights.Entry :=
  { word := [1, 4, 8, 12, 8, 4, 8], weights := [0, 0, 1, 0] }

def points94 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 1973, representative 8760.
def source95 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B015.Data.entryAt ⟨89, by decide +kernel⟩

def target95 : Weights.Entry :=
  { word := [1, 4, 8, 12, 12, 4, 8], weights := [0, 1, 1, 0] }

def points95 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 1993, representative 8751.
def source96 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B015.Data.entryAt ⟨80, by decide +kernel⟩

def target96 : Weights.Entry :=
  { word := [1, 4, 10, 8, 8, 4, 8], weights := [0, 1, 1, 0] }

def points96 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 2035, representative 8765.
def source97 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B015.Data.entryAt ⟨94, by decide +kernel⟩

def target97 : Weights.Entry :=
  { word := [1, 8, 1, 4, 4, 4, 8], weights := [0, 0, 0, 1] }

def points97 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 2038, representative 8777.
def source98 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B015.Data.entryAt ⟨106, by decide +kernel⟩

def target98 : Weights.Entry :=
  { word := [1, 8, 1, 4, 8, 4, 8], weights := [0, 0, 1, 0] }

def points98 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 2057, representative 8753.
def source99 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B015.Data.entryAt ⟨82, by decide +kernel⟩

def target99 : Weights.Entry :=
  { word := [1, 8, 1, 4, 12, 4, 8], weights := [0, 0, 0, 1] }

def points99 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 2058, representative 8770.
def source100 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B015.Data.entryAt ⟨99, by decide +kernel⟩

def target100 : Weights.Entry :=
  { word := [1, 8, 1, 12, 4, 4, 8], weights := [0, 1, 1, 0] }

def points100 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 2061, representative 8780.
def source101 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B015.Data.entryAt ⟨109, by decide +kernel⟩

def target101 : Weights.Entry :=
  { word := [1, 8, 1, 12, 8, 4, 8], weights := [0, 0, 1, 0] }

def points101 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 2067, representative 8758.
def source102 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B015.Data.entryAt ⟨87, by decide +kernel⟩

def target102 : Weights.Entry :=
  { word := [1, 8, 1, 12, 12, 4, 8], weights := [0, 1, 1, 0] }

def points102 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 2135, representative 8774.
def source103 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B015.Data.entryAt ⟨103, by decide +kernel⟩

def target103 : Weights.Entry :=
  { word := [1, 8, 8, 4, 4, 4, 8], weights := [1, 0, 0, 1] }

def points103 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 2143, representative 8762.
def source104 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B015.Data.entryAt ⟨91, by decide +kernel⟩

def target104 : Weights.Entry :=
  { word := [1, 8, 8, 4, 12, 4, 8], weights := [0, 0, 1, 0] }

def points104 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 2146, representative 8775.
def source105 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B015.Data.entryAt ⟨104, by decide +kernel⟩

def target105 : Weights.Entry :=
  { word := [1, 8, 8, 12, 4, 4, 8], weights := [0, 1, 1, 0] }

def points105 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 2148, representative 8763.
def source106 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B015.Data.entryAt ⟨92, by decide +kernel⟩

def target106 : Weights.Entry :=
  { word := [1, 8, 8, 12, 12, 4, 8], weights := [0, 0, 1, 0] }

def points106 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 2151, representative 8766.
def source107 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B015.Data.entryAt ⟨95, by decide +kernel⟩

def target107 : Weights.Entry :=
  { word := [1, 8, 9, 4, 4, 4, 8], weights := [1, 0, 0, 1] }

def points107 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 2155, representative 8754.
def source108 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B015.Data.entryAt ⟨83, by decide +kernel⟩

def target108 : Weights.Entry :=
  { word := [1, 8, 9, 4, 12, 4, 8], weights := [0, 0, 1, 0] }

def points108 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 2158, representative 8767.
def source109 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B015.Data.entryAt ⟨96, by decide +kernel⟩

def target109 : Weights.Entry :=
  { word := [1, 8, 9, 12, 4, 4, 8], weights := [0, 1, 1, 0] }

def points109 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 2160, representative 8755.
def source110 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B015.Data.entryAt ⟨84, by decide +kernel⟩

def target110 : Weights.Entry :=
  { word := [1, 8, 9, 12, 12, 4, 8], weights := [0, 0, 1, 0] }

def points110 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 2237, representative 8750.
def source111 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B015.Data.entryAt ⟨79, by decide +kernel⟩

def target111 : Weights.Entry :=
  { word := [1, 12, 2, 8, 8, 4, 8], weights := [0, 1, 1, 0] }

def points111 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 2291, representative 8768.
def source112 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B015.Data.entryAt ⟨97, by decide +kernel⟩

def target112 : Weights.Entry :=
  { word := [1, 12, 8, 4, 4, 4, 8], weights := [1, 0, 0, 1] }

def points112 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 2296, representative 8778.
def source113 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B015.Data.entryAt ⟨107, by decide +kernel⟩

def target113 : Weights.Entry :=
  { word := [1, 12, 8, 4, 8, 4, 8], weights := [0, 0, 1, 0] }

def points113 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 2317, representative 8756.
def source114 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B015.Data.entryAt ⟨85, by decide +kernel⟩

def target114 : Weights.Entry :=
  { word := [1, 12, 8, 4, 12, 4, 8], weights := [1, 0, 0, 1] }

def points114 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 2320, representative 8769.
def source115 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B015.Data.entryAt ⟨98, by decide +kernel⟩

def target115 : Weights.Entry :=
  { word := [1, 12, 8, 12, 4, 4, 8], weights := [0, 1, 1, 0] }

def points115 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 2324, representative 8779.
def source116 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B015.Data.entryAt ⟨108, by decide +kernel⟩

def target116 : Weights.Entry :=
  { word := [1, 12, 8, 12, 8, 4, 8], weights := [0, 0, 1, 0] }

def points116 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 2332, representative 8757.
def source117 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B015.Data.entryAt ⟨86, by decide +kernel⟩

def target117 : Weights.Entry :=
  { word := [1, 12, 8, 12, 12, 4, 8], weights := [0, 1, 1, 0] }

def points117 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 2352, representative 8749.
def source118 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B015.Data.entryAt ⟨78, by decide +kernel⟩

def target118 : Weights.Entry :=
  { word := [1, 12, 10, 8, 8, 4, 8], weights := [0, 1, 1, 0] }

def points118 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 2896, representative 8793.
def source119 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B015.Data.entryAt ⟨122, by decide +kernel⟩

def target119 : Weights.Entry :=
  { word := [2, 8, 2, 0, 1, 8, 1], weights := [0, 0, 1, 0] }

def points119 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 2899, representative 8794.
def source120 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B015.Data.entryAt ⟨123, by decide +kernel⟩

def target120 : Weights.Entry :=
  { word := [2, 8, 2, 0, 9, 8, 1], weights := [0, 0, 1, 0] }

def points120 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 3104, representative 8796.
def source121 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B015.Data.entryAt ⟨125, by decide +kernel⟩

def target121 : Weights.Entry :=
  { word := [2, 8, 10, 0, 1, 8, 1], weights := [0, 0, 1, 0] }

def points121 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 3107, representative 8795.
def source122 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B015.Data.entryAt ⟨124, by decide +kernel⟩

def target122 : Weights.Entry :=
  { word := [2, 8, 10, 0, 9, 8, 1], weights := [0, 0, 1, 0] }

def points122 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 3697, representative 8790.
def source123 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B015.Data.entryAt ⟨119, by decide +kernel⟩

def target123 : Weights.Entry :=
  { word := [4, 4, 8, 8, 4, 6, 0], weights := [0, 1, 1, 0] }

def points123 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 3706, representative 8789.
def source124 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B015.Data.entryAt ⟨118, by decide +kernel⟩

def target124 : Weights.Entry :=
  { word := [4, 4, 8, 8, 12, 6, 0], weights := [0, 1, 1, 0] }

def points124 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 3883, representative 8797.
def source125 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B015.Data.entryAt ⟨126, by decide +kernel⟩

def target125 : Weights.Entry :=
  { word := [4, 8, 8, 4, 4, 12, 0], weights := [1, 0, 0, 1] }

def points125 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 3891, representative 8798.
def source126 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B015.Data.entryAt ⟨127, by decide +kernel⟩

def target126 : Weights.Entry :=
  { word := [4, 8, 8, 4, 12, 12, 0], weights := [1, 0, 0, 1] }

def points126 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 3893, representative 8792.
def source127 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B015.Data.entryAt ⟨121, by decide +kernel⟩

def target127 : Weights.Entry :=
  { word := [4, 8, 8, 8, 4, 6, 0], weights := [0, 1, 1, 0] }

def points127 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

def period9Entries : List Weights.Entry := [target0, target1, target2, target3, target4, target5, target6, target7, target8, target9, target10, target11, target12, target13, target14, target15, target16, target17, target18, target19, target20, target21, target22, target23, target24, target25, target26, target27, target28, target29, target30, target31, target32, target33, target34, target35, target36, target37, target38, target39, target40, target41, target42, target43, target44, target45, target46, target47, target48, target49, target50, target51, target52, target53, target54, target55, target56, target57, target58, target59, target60, target61, target62, target63, target64, target65, target66, target67, target68, target69, target70, target71, target72, target73, target74, target75, target76, target77, target78, target79, target80, target81, target82, target83, target84, target85, target86, target87, target88, target89, target90, target91, target92, target93, target94, target95, target96, target97, target98, target99, target100, target101, target102, target103, target104, target105, target106, target107, target108, target109, target110, target111, target112, target113, target114, target115, target116, target117, target118, target119, target120, target121, target122, target123, target124, target125, target126, target127]

def period9Chunk : RowCoverage.Chunk where
  rows := [⟨138, target0⟩, ⟨176, target1⟩, ⟨213, target2⟩, ⟨230, target3⟩, ⟨267, target4⟩, ⟨297, target5⟩, ⟨345, target6⟩, ⟨368, target7⟩, ⟨394, target8⟩, ⟨443, target9⟩, ⟨468, target10⟩, ⟨489, target11⟩, ⟨589, target12⟩, ⟨648, target13⟩, ⟨653, target14⟩, ⟨674, target15⟩, ⟨677, target16⟩, ⟨681, target17⟩, ⟨689, target18⟩, ⟨709, target19⟩, ⟨740, target20⟩, ⟨751, target21⟩, ⟨754, target22⟩, ⟨757, target23⟩, ⟨761, target24⟩, ⟨766, target25⟩, ⟨770, target26⟩, ⟨778, target27⟩, ⟨781, target28⟩, ⟨784, target29⟩, ⟨788, target30⟩, ⟨795, target31⟩, ⟨807, target32⟩, ⟨826, target33⟩, ⟨833, target34⟩, ⟨852, target35⟩, ⟨855, target36⟩, ⟨876, target37⟩, ⟨882, target38⟩, ⟨885, target39⟩, ⟨891, target40⟩, ⟨905, target41⟩, ⟨908, target42⟩, ⟨927, target43⟩, ⟨928, target44⟩, ⟨931, target45⟩, ⟨937, target46⟩, ⟨1043, target47⟩, ⟨1051, target48⟩, ⟨1064, target49⟩, ⟨1066, target50⟩, ⟨1069, target51⟩, ⟨1073, target52⟩, ⟨1076, target53⟩, ⟨1078, target54⟩, ⟨1128, target55⟩, ⟨1134, target56⟩, ⟨1146, target57⟩, ⟨1170, target58⟩, ⟨1204, target59⟩, ⟨1223, target60⟩, ⟨1229, target61⟩, ⟨1265, target62⟩, ⟨1271, target63⟩, ⟨1284, target64⟩, ⟨1314, target65⟩, ⟨1338, target66⟩, ⟨1346, target67⟩, ⟨1368, target68⟩, ⟨1388, target69⟩, ⟨1393, target70⟩, ⟨1420, target71⟩, ⟨1463, target72⟩, ⟨1468, target73⟩, ⟨1488, target74⟩, ⟨1518, target75⟩, ⟨1521, target76⟩, ⟨1540, target77⟩, ⟨1541, target78⟩, ⟨1544, target79⟩, ⟨1550, target80⟩, ⟨1588, target81⟩, ⟨1647, target82⟩, ⟨1652, target83⟩, ⟨1673, target84⟩, ⟨1676, target85⟩, ⟨1680, target86⟩, ⟨1688, target87⟩, ⟨1708, target88⟩, ⟨1878, target89⟩, ⟨1932, target90⟩, ⟨1937, target91⟩, ⟨1958, target92⟩, ⟨1961, target93⟩, ⟨1965, target94⟩, ⟨1973, target95⟩, ⟨1993, target96⟩, ⟨2035, target97⟩, ⟨2038, target98⟩, ⟨2057, target99⟩, ⟨2058, target100⟩, ⟨2061, target101⟩, ⟨2067, target102⟩, ⟨2135, target103⟩, ⟨2143, target104⟩, ⟨2146, target105⟩, ⟨2148, target106⟩, ⟨2151, target107⟩, ⟨2155, target108⟩, ⟨2158, target109⟩, ⟨2160, target110⟩, ⟨2237, target111⟩, ⟨2291, target112⟩, ⟨2296, target113⟩, ⟨2317, target114⟩, ⟨2320, target115⟩, ⟨2324, target116⟩, ⟨2332, target117⟩, ⟨2352, target118⟩, ⟨2896, target119⟩, ⟨2899, target120⟩, ⟨3104, target121⟩, ⟨3107, target122⟩, ⟨3697, target123⟩, ⟨3706, target124⟩, ⟨3883, target125⟩, ⟨3891, target126⟩, ⟨3893, target127⟩]
  indexMask := 101630085977110331061477613044876276227618380827863766789580550393618081433586026132952705556967606429872470497489434412050649096826538941374402116917984448426876965899606531498683656362703722316168513770266583679279439613244361664658461748050726379296045469609653760341551606236723585465110337605077843773617046240113171268092228218839338417314171033936231908654875556298084329377867663396772133949467616744198333905037748653323844473944912793839040056715771291552576536782669346517099988141390648494882172573316540400432796627170593887947204809840878401097713275374610713850277744901426538071235612311725672316463472121036674018493979913588790602031057074765523377874942272047976191905376648146245166774685609684398370686020657387062616419098622004342526044831680017522566447067429706461990538892091401219885901074850511733899151831982056186823957848466403199386993148522251379768313428643739860839545318788713029987749364463425194796040151228517833583547980783625523977634869828484805451013134964435673056350436393961920995594369902416312083511375904473591868100090047368737290981334171397951868856530249354743920555810896239980628278496638475405974549233191466892787712
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

end FranklSmallCyclic.TransportBatches.G068.B000.Data
