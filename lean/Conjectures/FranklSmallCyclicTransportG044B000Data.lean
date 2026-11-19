module

public import Conjectures.FranklSmallCyclicRowCoverage
public import Conjectures.FranklSmallCyclicCanonicalWords
public import Conjectures.FranklSmallCyclicOrbit8Block018Data

/-! 128 literal targets sharing one source proof block.
Original words and row indices are retained; weights may be transported.
-/
@[expose] public section

namespace FranklSmallCyclic.TransportBatches.G044.B000.Data

-- Period 8, original row 20, representative 5722.
def source0 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B018.Data.entryAt ⟨101, by decide +kernel⟩

def target0 : Weights.Entry :=
  { word := [0, 0, 1, 4, 8, 12, 8], weights := [0, 0, 1, 0] }

-- Period 8, original row 43, representative 5725.
def source1 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B018.Data.entryAt ⟨104, by decide +kernel⟩

def target1 : Weights.Entry :=
  { word := [0, 0, 1, 12, 8, 12, 8], weights := [0, 0, 1, 0] }

-- Period 8, original row 95, representative 5712.
def source2 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B018.Data.entryAt ⟨91, by decide +kernel⟩

def target2 : Weights.Entry :=
  { word := [0, 0, 9, 4, 4, 12, 8], weights := [1, 0, 0, 1] }

-- Period 8, original row 99, representative 5702.
def source3 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B018.Data.entryAt ⟨81, by decide +kernel⟩

def target3 : Weights.Entry :=
  { word := [0, 0, 9, 4, 12, 12, 8], weights := [0, 0, 1, 0] }

-- Period 8, original row 101, representative 5713.
def source4 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B018.Data.entryAt ⟨92, by decide +kernel⟩

def target4 : Weights.Entry :=
  { word := [0, 0, 9, 12, 4, 12, 8], weights := [0, 1, 1, 0] }

-- Period 8, original row 103, representative 5703.
def source5 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B018.Data.entryAt ⟨82, by decide +kernel⟩

def target5 : Weights.Entry :=
  { word := [0, 0, 9, 12, 12, 12, 8], weights := [0, 0, 1, 0] }

-- Period 8, original row 142, representative 5624.
def source6 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B018.Data.entryAt ⟨3, by decide +kernel⟩

def target6 : Weights.Entry :=
  { word := [0, 1, 0, 12, 0, 12, 8], weights := [0, 0, 1, 0] }

-- Period 8, original row 188, representative 5650.
def source7 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B018.Data.entryAt ⟨29, by decide +kernel⟩

def target7 : Weights.Entry :=
  { word := [0, 1, 4, 10, 0, 12, 8], weights := [1, 0, 1, 1] }

-- Period 8, original row 213, representative 5746.
def source8 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B018.Data.entryAt ⟨125, by decide +kernel⟩

def target8 : Weights.Entry :=
  { word := [0, 1, 8, 4, 4, 4, 8], weights := [1, 0, 0, 1] }

-- Period 8, original row 230, representative 5747.
def source9 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B018.Data.entryAt ⟨126, by decide +kernel⟩

def target9 : Weights.Entry :=
  { word := [0, 1, 8, 12, 4, 4, 8], weights := [1, 0, 0, 1] }

-- Period 8, original row 281, representative 5649.
def source10 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B018.Data.entryAt ⟨28, by decide +kernel⟩

def target10 : Weights.Entry :=
  { word := [0, 1, 12, 10, 0, 12, 8], weights := [1, 0, 1, 1] }

-- Period 8, original row 301, representative 5624.
def source11 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B018.Data.entryAt ⟨3, by decide +kernel⟩

def target11 : Weights.Entry :=
  { word := [0, 2, 0, 8, 1, 12, 8], weights := [0, 0, 1, 0] }

def points11 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6), (7, 7)]

-- Period 8, original row 363, representative 5639.
def source12 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B018.Data.entryAt ⟨18, by decide +kernel⟩

def target12 : Weights.Entry :=
  { word := [0, 2, 2, 2, 8, 12, 8], weights := [0, 1, 0, 1] }

-- Period 8, original row 380, representative 5650.
def source13 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B018.Data.entryAt ⟨29, by decide +kernel⟩

def target13 : Weights.Entry :=
  { word := [0, 2, 2, 10, 0, 12, 8], weights := [0, 1, 1, 1] }

def points13 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6), (7, 7)]

-- Period 8, original row 408, representative 5640.
def source14 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B018.Data.entryAt ⟨19, by decide +kernel⟩

def target14 : Weights.Entry :=
  { word := [0, 2, 2, 10, 8, 12, 8], weights := [0, 1, 1, 0] }

-- Period 8, original row 461, representative 5637.
def source15 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B018.Data.entryAt ⟨16, by decide +kernel⟩

def target15 : Weights.Entry :=
  { word := [0, 2, 10, 2, 8, 12, 8], weights := [0, 1, 0, 1] }

-- Period 8, original row 482, representative 5649.
def source16 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B018.Data.entryAt ⟨28, by decide +kernel⟩

def target16 : Weights.Entry :=
  { word := [0, 2, 10, 10, 0, 12, 8], weights := [0, 1, 1, 1] }

def points16 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6), (7, 7)]

-- Period 8, original row 503, representative 5638.
def source17 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B018.Data.entryAt ⟨17, by decide +kernel⟩

def target17 : Weights.Entry :=
  { word := [0, 2, 10, 10, 8, 12, 8], weights := [0, 1, 1, 0] }

-- Period 8, original row 592, representative 5695.
def source18 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B018.Data.entryAt ⟨74, by decide +kernel⟩

def target18 : Weights.Entry :=
  { word := [0, 4, 2, 8, 8, 12, 8], weights := [0, 1, 1, 0] }

-- Period 8, original row 650, representative 5708.
def source19 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B018.Data.entryAt ⟨87, by decide +kernel⟩

def target19 : Weights.Entry :=
  { word := [0, 4, 8, 4, 4, 12, 8], weights := [1, 0, 0, 1] }

-- Period 8, original row 658, representative 5720.
def source20 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B018.Data.entryAt ⟨99, by decide +kernel⟩

def target20 : Weights.Entry :=
  { word := [0, 4, 8, 4, 8, 12, 8], weights := [0, 0, 1, 0] }

-- Period 8, original row 676, representative 5698.
def source21 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B018.Data.entryAt ⟨77, by decide +kernel⟩

def target21 : Weights.Entry :=
  { word := [0, 4, 8, 4, 12, 12, 8], weights := [1, 0, 0, 1] }

-- Period 8, original row 678, representative 5709.
def source22 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B018.Data.entryAt ⟨88, by decide +kernel⟩

def target22 : Weights.Entry :=
  { word := [0, 4, 8, 12, 4, 12, 8], weights := [0, 1, 1, 0] }

-- Period 8, original row 686, representative 5721.
def source23 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B018.Data.entryAt ⟨100, by decide +kernel⟩

def target23 : Weights.Entry :=
  { word := [0, 4, 8, 12, 8, 12, 8], weights := [0, 0, 1, 0] }

-- Period 8, original row 690, representative 5699.
def source24 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B018.Data.entryAt ⟨78, by decide +kernel⟩

def target24 : Weights.Entry :=
  { word := [0, 4, 8, 12, 12, 12, 8], weights := [0, 1, 1, 0] }

-- Period 8, original row 712, representative 5694.
def source25 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B018.Data.entryAt ⟨73, by decide +kernel⟩

def target25 : Weights.Entry :=
  { word := [0, 4, 10, 8, 8, 12, 8], weights := [0, 1, 1, 0] }

-- Period 8, original row 744, representative 5643.
def source26 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B018.Data.entryAt ⟨22, by decide +kernel⟩

def target26 : Weights.Entry :=
  { word := [0, 6, 0, 12, 8, 12, 8], weights := [0, 1, 1, 0] }

-- Period 8, original row 764, representative 5632.
def source27 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B018.Data.entryAt ⟨11, by decide +kernel⟩

def target27 : Weights.Entry :=
  { word := [0, 6, 2, 8, 8, 12, 8], weights := [0, 1, 1, 0] }

-- Period 8, original row 767, representative 5641.
def source28 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B018.Data.entryAt ⟨20, by decide +kernel⟩

def target28 : Weights.Entry :=
  { word := [0, 6, 8, 4, 8, 12, 8], weights := [0, 0, 1, 0] }

-- Period 8, original row 775, representative 5642.
def source29 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B018.Data.entryAt ⟨21, by decide +kernel⟩

def target29 : Weights.Entry :=
  { word := [0, 6, 8, 12, 8, 12, 8], weights := [0, 0, 1, 0] }

-- Period 8, original row 791, representative 5631.
def source30 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B018.Data.entryAt ⟨10, by decide +kernel⟩

def target30 : Weights.Entry :=
  { word := [0, 6, 10, 8, 8, 12, 8], weights := [0, 1, 1, 0] }

-- Period 8, original row 799, representative 5728.
def source31 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B018.Data.entryAt ⟨107, by decide +kernel⟩

def target31 : Weights.Entry :=
  { word := [0, 8, 0, 0, 1, 12, 8], weights := [0, 0, 1, 0] }

-- Period 8, original row 811, representative 5728.
def source32 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B018.Data.entryAt ⟨107, by decide +kernel⟩

def target32 : Weights.Entry :=
  { word := [0, 8, 0, 4, 0, 12, 8], weights := [0, 0, 1, 0] }

def points32 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6), (7, 7)]

-- Period 8, original row 837, representative 5726.
def source33 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B018.Data.entryAt ⟨105, by decide +kernel⟩

def target33 : Weights.Entry :=
  { word := [0, 8, 0, 4, 8, 12, 8], weights := [0, 0, 1, 0] }

-- Period 8, original row 859, representative 5729.
def source34 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B018.Data.entryAt ⟨108, by decide +kernel⟩

def target34 : Weights.Entry :=
  { word := [0, 8, 0, 8, 1, 12, 8], weights := [0, 0, 1, 0] }

-- Period 8, original row 880, representative 5729.
def source35 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B018.Data.entryAt ⟨108, by decide +kernel⟩

def target35 : Weights.Entry :=
  { word := [0, 8, 0, 12, 0, 12, 8], weights := [0, 0, 1, 0] }

def points35 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6), (7, 7)]

-- Period 8, original row 889, representative 5727.
def source36 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B018.Data.entryAt ⟨106, by decide +kernel⟩

def target36 : Weights.Entry :=
  { word := [0, 8, 0, 12, 8, 12, 8], weights := [0, 0, 1, 0] }

-- Period 8, original row 912, representative 5723.
def source37 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B018.Data.entryAt ⟨102, by decide +kernel⟩

def target37 : Weights.Entry :=
  { word := [0, 8, 1, 4, 8, 12, 8], weights := [0, 0, 1, 0] }

-- Period 8, original row 935, representative 5724.
def source38 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B018.Data.entryAt ⟨103, by decide +kernel⟩

def target38 : Weights.Entry :=
  { word := [0, 8, 1, 12, 8, 12, 8], weights := [0, 0, 1, 0] }

-- Period 8, original row 1045, representative 5714.
def source39 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B018.Data.entryAt ⟨93, by decide +kernel⟩

def target39 : Weights.Entry :=
  { word := [0, 8, 8, 4, 4, 12, 8], weights := [1, 0, 0, 1] }

-- Period 8, original row 1053, representative 5704.
def source40 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B018.Data.entryAt ⟨83, by decide +kernel⟩

def target40 : Weights.Entry :=
  { word := [0, 8, 8, 4, 12, 12, 8], weights := [0, 0, 1, 0] }

-- Period 8, original row 1065, representative 5715.
def source41 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B018.Data.entryAt ⟨94, by decide +kernel⟩

def target41 : Weights.Entry :=
  { word := [0, 8, 8, 12, 4, 12, 8], weights := [0, 1, 1, 0] }

-- Period 8, original row 1067, representative 5705.
def source42 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B018.Data.entryAt ⟨84, by decide +kernel⟩

def target42 : Weights.Entry :=
  { word := [0, 8, 8, 12, 12, 12, 8], weights := [0, 0, 1, 0] }

-- Period 8, original row 1071, representative 5710.
def source43 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B018.Data.entryAt ⟨89, by decide +kernel⟩

def target43 : Weights.Entry :=
  { word := [0, 8, 9, 4, 4, 12, 8], weights := [1, 0, 0, 1] }

-- Period 8, original row 1075, representative 5700.
def source44 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B018.Data.entryAt ⟨79, by decide +kernel⟩

def target44 : Weights.Entry :=
  { word := [0, 8, 9, 4, 12, 12, 8], weights := [0, 0, 1, 0] }

-- Period 8, original row 1077, representative 5711.
def source45 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B018.Data.entryAt ⟨90, by decide +kernel⟩

def target45 : Weights.Entry :=
  { word := [0, 8, 9, 12, 4, 12, 8], weights := [0, 1, 1, 0] }

-- Period 8, original row 1079, representative 5701.
def source46 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B018.Data.entryAt ⟨80, by decide +kernel⟩

def target46 : Weights.Entry :=
  { word := [0, 8, 9, 12, 12, 12, 8], weights := [0, 0, 1, 0] }

-- Period 8, original row 1148, representative 5622.
def source47 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B018.Data.entryAt ⟨1, by decide +kernel⟩

def target47 : Weights.Entry :=
  { word := [0, 9, 0, 4, 0, 12, 8], weights := [1, 0, 3, 0] }

-- Period 8, original row 1163, representative 5742.
def source48 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B018.Data.entryAt ⟨121, by decide +kernel⟩

def target48 : Weights.Entry :=
  { word := [0, 9, 0, 4, 4, 4, 8], weights := [1, 0, 0, 1] }

-- Period 8, original row 1170, representative 5748.
def source49 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B018.Data.entryAt ⟨127, by decide +kernel⟩

def target49 : Weights.Entry :=
  { word := [0, 9, 0, 4, 8, 4, 8], weights := [1, 0, 1, 0] }

-- Period 8, original row 1189, representative 5738.
def source50 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B018.Data.entryAt ⟨117, by decide +kernel⟩

def target50 : Weights.Entry :=
  { word := [0, 9, 0, 4, 12, 4, 8], weights := [1, 0, 0, 1] }

-- Period 8, original row 1208, representative 5623.
def source51 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B018.Data.entryAt ⟨2, by decide +kernel⟩

def target51 : Weights.Entry :=
  { word := [0, 9, 0, 12, 0, 12, 8], weights := [1, 0, 1, 0] }

-- Period 8, original row 1223, representative 5745.
def source52 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B018.Data.entryAt ⟨124, by decide +kernel⟩

def target52 : Weights.Entry :=
  { word := [0, 9, 0, 12, 4, 4, 8], weights := [1, 0, 0, 1] }

-- Period 8, original row 1233, representative 5621.
def source53 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B018.Data.entryAt ⟨0, by decide +kernel⟩

def target53 : Weights.Entry :=
  { word := [0, 9, 0, 12, 8, 12, 8], weights := [1, 0, 1, 0] }

-- Period 8, original row 1248, representative 5741.
def source54 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B018.Data.entryAt ⟨120, by decide +kernel⟩

def target54 : Weights.Entry :=
  { word := [0, 9, 0, 12, 12, 4, 8], weights := [1, 0, 0, 1] }

-- Period 8, original row 1284, representative 5743.
def source55 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B018.Data.entryAt ⟨122, by decide +kernel⟩

def target55 : Weights.Entry :=
  { word := [0, 9, 8, 4, 4, 4, 8], weights := [1, 0, 0, 1] }

-- Period 8, original row 1292, representative 5739.
def source56 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B018.Data.entryAt ⟨118, by decide +kernel⟩

def target56 : Weights.Entry :=
  { word := [0, 9, 8, 4, 12, 4, 8], weights := [1, 0, 0, 1] }

-- Period 8, original row 1314, representative 5744.
def source57 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B018.Data.entryAt ⟨123, by decide +kernel⟩

def target57 : Weights.Entry :=
  { word := [0, 9, 8, 12, 4, 4, 8], weights := [1, 0, 0, 1] }

-- Period 8, original row 1321, representative 5740.
def source58 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B018.Data.entryAt ⟨119, by decide +kernel⟩

def target58 : Weights.Entry :=
  { word := [0, 9, 8, 12, 12, 4, 8], weights := [1, 0, 0, 1] }

-- Period 8, original row 1340, representative 5622.
def source59 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B018.Data.entryAt ⟨1, by decide +kernel⟩

def target59 : Weights.Entry :=
  { word := [0, 10, 0, 0, 1, 12, 8], weights := [0, 1, 3, 0] }

def points59 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6), (7, 7)]

-- Period 8, original row 1350, representative 5623.
def source60 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B018.Data.entryAt ⟨2, by decide +kernel⟩

def target60 : Weights.Entry :=
  { word := [0, 10, 0, 8, 1, 12, 8], weights := [0, 1, 1, 0] }

def points60 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6), (7, 7)]

-- Period 8, original row 1365, representative 5736.
def source61 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B018.Data.entryAt ⟨115, by decide +kernel⟩

def target61 : Weights.Entry :=
  { word := [0, 10, 0, 12, 4, 4, 8], weights := [0, 1, 1, 0] }

-- Period 8, original row 1372, representative 5644.
def source62 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B018.Data.entryAt ⟨23, by decide +kernel⟩

def target62 : Weights.Entry :=
  { word := [0, 10, 0, 12, 8, 12, 8], weights := [0, 1, 1, 0] }

-- Period 8, original row 1374, representative 5733.
def source63 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B018.Data.entryAt ⟨112, by decide +kernel⟩

def target63 : Weights.Entry :=
  { word := [0, 10, 0, 12, 12, 4, 8], weights := [0, 1, 1, 0] }

-- Period 8, original row 1406, representative 5635.
def source64 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B018.Data.entryAt ⟨14, by decide +kernel⟩

def target64 : Weights.Entry :=
  { word := [0, 10, 2, 2, 8, 12, 8], weights := [0, 1, 0, 1] }

-- Period 8, original row 1434, representative 5636.
def source65 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B018.Data.entryAt ⟨15, by decide +kernel⟩

def target65 : Weights.Entry :=
  { word := [0, 10, 2, 10, 8, 12, 8], weights := [0, 1, 1, 0] }

-- Period 8, original row 1440, representative 5731.
def source66 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B018.Data.entryAt ⟨110, by decide +kernel⟩

def target66 : Weights.Entry :=
  { word := [0, 10, 8, 4, 12, 4, 8], weights := [1, 0, 2, 1] }

-- Period 8, original row 1453, representative 5735.
def source67 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B018.Data.entryAt ⟨114, by decide +kernel⟩

def target67 : Weights.Entry :=
  { word := [0, 10, 8, 12, 4, 4, 8], weights := [0, 1, 1, 0] }

-- Period 8, original row 1455, representative 5732.
def source68 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B018.Data.entryAt ⟨111, by decide +kernel⟩

def target68 : Weights.Entry :=
  { word := [0, 10, 8, 12, 12, 4, 8], weights := [0, 1, 1, 0] }

-- Period 8, original row 1481, representative 5633.
def source69 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B018.Data.entryAt ⟨12, by decide +kernel⟩

def target69 : Weights.Entry :=
  { word := [0, 10, 10, 2, 8, 12, 8], weights := [0, 1, 0, 1] }

-- Period 8, original row 1502, representative 5634.
def source70 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B018.Data.entryAt ⟨13, by decide +kernel⟩

def target70 : Weights.Entry :=
  { word := [0, 10, 10, 10, 8, 12, 8], weights := [0, 1, 1, 0] }

-- Period 8, original row 1525, representative 5716.
def source71 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B018.Data.entryAt ⟨95, by decide +kernel⟩

def target71 : Weights.Entry :=
  { word := [0, 12, 0, 4, 8, 12, 8], weights := [0, 0, 1, 0] }

-- Period 8, original row 1548, representative 5719.
def source72 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B018.Data.entryAt ⟨98, by decide +kernel⟩

def target72 : Weights.Entry :=
  { word := [0, 12, 0, 12, 8, 12, 8], weights := [0, 0, 1, 0] }

-- Period 8, original row 1591, representative 5693.
def source73 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B018.Data.entryAt ⟨72, by decide +kernel⟩

def target73 : Weights.Entry :=
  { word := [0, 12, 2, 8, 8, 12, 8], weights := [0, 1, 1, 0] }

-- Period 8, original row 1649, representative 5706.
def source74 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B018.Data.entryAt ⟨85, by decide +kernel⟩

def target74 : Weights.Entry :=
  { word := [0, 12, 8, 4, 4, 12, 8], weights := [1, 0, 0, 1] }

-- Period 8, original row 1657, representative 5717.
def source75 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B018.Data.entryAt ⟨96, by decide +kernel⟩

def target75 : Weights.Entry :=
  { word := [0, 12, 8, 4, 8, 12, 8], weights := [0, 0, 1, 0] }

-- Period 8, original row 1675, representative 5696.
def source76 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B018.Data.entryAt ⟨75, by decide +kernel⟩

def target76 : Weights.Entry :=
  { word := [0, 12, 8, 4, 12, 12, 8], weights := [1, 0, 0, 1] }

-- Period 8, original row 1677, representative 5707.
def source77 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B018.Data.entryAt ⟨86, by decide +kernel⟩

def target77 : Weights.Entry :=
  { word := [0, 12, 8, 12, 4, 12, 8], weights := [0, 1, 1, 0] }

-- Period 8, original row 1685, representative 5718.
def source78 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B018.Data.entryAt ⟨97, by decide +kernel⟩

def target78 : Weights.Entry :=
  { word := [0, 12, 8, 12, 8, 12, 8], weights := [0, 0, 1, 0] }

-- Period 8, original row 1689, representative 5697.
def source79 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B018.Data.entryAt ⟨76, by decide +kernel⟩

def target79 : Weights.Entry :=
  { word := [0, 12, 8, 12, 12, 12, 8], weights := [0, 1, 1, 0] }

-- Period 8, original row 1711, representative 5692.
def source80 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B018.Data.entryAt ⟨71, by decide +kernel⟩

def target80 : Weights.Entry :=
  { word := [0, 12, 10, 8, 8, 12, 8], weights := [0, 1, 1, 0] }

-- Period 8, original row 1757, representative 5722.
def source81 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B018.Data.entryAt ⟨101, by decide +kernel⟩

def target81 : Weights.Entry :=
  { word := [1, 0, 1, 4, 8, 12, 8], weights := [0, 0, 1, 0] }

def points81 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 8, original row 1780, representative 5725.
def source82 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B018.Data.entryAt ⟨104, by decide +kernel⟩

def target82 : Weights.Entry :=
  { word := [1, 0, 1, 12, 8, 12, 8], weights := [0, 0, 1, 0] }

def points82 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 8, original row 1816, representative 5712.
def source83 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B018.Data.entryAt ⟨91, by decide +kernel⟩

def target83 : Weights.Entry :=
  { word := [1, 0, 9, 4, 4, 12, 8], weights := [1, 0, 0, 1] }

def points83 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 8, original row 1820, representative 5702.
def source84 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B018.Data.entryAt ⟨81, by decide +kernel⟩

def target84 : Weights.Entry :=
  { word := [1, 0, 9, 4, 12, 12, 8], weights := [0, 0, 1, 0] }

def points84 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 8, original row 1822, representative 5713.
def source85 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B018.Data.entryAt ⟨92, by decide +kernel⟩

def target85 : Weights.Entry :=
  { word := [1, 0, 9, 12, 4, 12, 8], weights := [0, 1, 1, 0] }

def points85 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 8, original row 1824, representative 5703.
def source86 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B018.Data.entryAt ⟨82, by decide +kernel⟩

def target86 : Weights.Entry :=
  { word := [1, 0, 9, 12, 12, 12, 8], weights := [0, 0, 1, 0] }

def points86 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 8, original row 1881, representative 5695.
def source87 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B018.Data.entryAt ⟨74, by decide +kernel⟩

def target87 : Weights.Entry :=
  { word := [1, 4, 2, 8, 8, 12, 8], weights := [0, 1, 1, 0] }

def points87 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 8, original row 1934, representative 5708.
def source88 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B018.Data.entryAt ⟨87, by decide +kernel⟩

def target88 : Weights.Entry :=
  { word := [1, 4, 8, 4, 4, 12, 8], weights := [1, 0, 0, 1] }

def points88 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 8, original row 1942, representative 5720.
def source89 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B018.Data.entryAt ⟨99, by decide +kernel⟩

def target89 : Weights.Entry :=
  { word := [1, 4, 8, 4, 8, 12, 8], weights := [0, 0, 1, 0] }

def points89 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 8, original row 1960, representative 5698.
def source90 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B018.Data.entryAt ⟨77, by decide +kernel⟩

def target90 : Weights.Entry :=
  { word := [1, 4, 8, 4, 12, 12, 8], weights := [1, 0, 0, 1] }

def points90 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 8, original row 1962, representative 5709.
def source91 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B018.Data.entryAt ⟨88, by decide +kernel⟩

def target91 : Weights.Entry :=
  { word := [1, 4, 8, 12, 4, 12, 8], weights := [0, 1, 1, 0] }

def points91 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 8, original row 1970, representative 5721.
def source92 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B018.Data.entryAt ⟨100, by decide +kernel⟩

def target92 : Weights.Entry :=
  { word := [1, 4, 8, 12, 8, 12, 8], weights := [0, 0, 1, 0] }

def points92 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 8, original row 1974, representative 5699.
def source93 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B018.Data.entryAt ⟨78, by decide +kernel⟩

def target93 : Weights.Entry :=
  { word := [1, 4, 8, 12, 12, 12, 8], weights := [0, 1, 1, 0] }

def points93 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 8, original row 1996, representative 5694.
def source94 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B018.Data.entryAt ⟨73, by decide +kernel⟩

def target94 : Weights.Entry :=
  { word := [1, 4, 10, 8, 8, 12, 8], weights := [0, 1, 1, 0] }

def points94 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 8, original row 2042, representative 5723.
def source95 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B018.Data.entryAt ⟨102, by decide +kernel⟩

def target95 : Weights.Entry :=
  { word := [1, 8, 1, 4, 8, 12, 8], weights := [0, 0, 1, 0] }

def points95 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 8, original row 2065, representative 5724.
def source96 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B018.Data.entryAt ⟨103, by decide +kernel⟩

def target96 : Weights.Entry :=
  { word := [1, 8, 1, 12, 8, 12, 8], weights := [0, 0, 1, 0] }

def points96 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 8, original row 2137, representative 5714.
def source97 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B018.Data.entryAt ⟨93, by decide +kernel⟩

def target97 : Weights.Entry :=
  { word := [1, 8, 8, 4, 4, 12, 8], weights := [1, 0, 0, 1] }

def points97 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 8, original row 2145, representative 5704.
def source98 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B018.Data.entryAt ⟨83, by decide +kernel⟩

def target98 : Weights.Entry :=
  { word := [1, 8, 8, 4, 12, 12, 8], weights := [0, 0, 1, 0] }

def points98 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 8, original row 2147, representative 5715.
def source99 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B018.Data.entryAt ⟨94, by decide +kernel⟩

def target99 : Weights.Entry :=
  { word := [1, 8, 8, 12, 4, 12, 8], weights := [0, 1, 1, 0] }

def points99 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 8, original row 2149, representative 5705.
def source100 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B018.Data.entryAt ⟨84, by decide +kernel⟩

def target100 : Weights.Entry :=
  { word := [1, 8, 8, 12, 12, 12, 8], weights := [0, 0, 1, 0] }

def points100 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 8, original row 2153, representative 5710.
def source101 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B018.Data.entryAt ⟨89, by decide +kernel⟩

def target101 : Weights.Entry :=
  { word := [1, 8, 9, 4, 4, 12, 8], weights := [1, 0, 0, 1] }

def points101 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 8, original row 2157, representative 5700.
def source102 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B018.Data.entryAt ⟨79, by decide +kernel⟩

def target102 : Weights.Entry :=
  { word := [1, 8, 9, 4, 12, 12, 8], weights := [0, 0, 1, 0] }

def points102 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 8, original row 2159, representative 5711.
def source103 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B018.Data.entryAt ⟨90, by decide +kernel⟩

def target103 : Weights.Entry :=
  { word := [1, 8, 9, 12, 4, 12, 8], weights := [0, 1, 1, 0] }

def points103 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 8, original row 2161, representative 5701.
def source104 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B018.Data.entryAt ⟨80, by decide +kernel⟩

def target104 : Weights.Entry :=
  { word := [1, 8, 9, 12, 12, 12, 8], weights := [0, 0, 1, 0] }

def points104 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 8, original row 2240, representative 5693.
def source105 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B018.Data.entryAt ⟨72, by decide +kernel⟩

def target105 : Weights.Entry :=
  { word := [1, 12, 2, 8, 8, 12, 8], weights := [0, 1, 1, 0] }

def points105 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 8, original row 2293, representative 5706.
def source106 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B018.Data.entryAt ⟨85, by decide +kernel⟩

def target106 : Weights.Entry :=
  { word := [1, 12, 8, 4, 4, 12, 8], weights := [1, 0, 0, 1] }

def points106 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 8, original row 2301, representative 5717.
def source107 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B018.Data.entryAt ⟨96, by decide +kernel⟩

def target107 : Weights.Entry :=
  { word := [1, 12, 8, 4, 8, 12, 8], weights := [0, 0, 1, 0] }

def points107 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 8, original row 2319, representative 5696.
def source108 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B018.Data.entryAt ⟨75, by decide +kernel⟩

def target108 : Weights.Entry :=
  { word := [1, 12, 8, 4, 12, 12, 8], weights := [1, 0, 0, 1] }

def points108 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 8, original row 2321, representative 5707.
def source109 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B018.Data.entryAt ⟨86, by decide +kernel⟩

def target109 : Weights.Entry :=
  { word := [1, 12, 8, 12, 4, 12, 8], weights := [0, 1, 1, 0] }

def points109 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 8, original row 2329, representative 5718.
def source110 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B018.Data.entryAt ⟨97, by decide +kernel⟩

def target110 : Weights.Entry :=
  { word := [1, 12, 8, 12, 8, 12, 8], weights := [0, 0, 1, 0] }

def points110 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 8, original row 2333, representative 5697.
def source111 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B018.Data.entryAt ⟨76, by decide +kernel⟩

def target111 : Weights.Entry :=
  { word := [1, 12, 8, 12, 12, 12, 8], weights := [0, 1, 1, 0] }

def points111 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 8, original row 2355, representative 5692.
def source112 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B018.Data.entryAt ⟨71, by decide +kernel⟩

def target112 : Weights.Entry :=
  { word := [1, 12, 10, 8, 8, 12, 8], weights := [0, 1, 1, 0] }

def points112 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7)]

-- Period 8, original row 4121, representative 5689.
def source113 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B018.Data.entryAt ⟨68, by decide +kernel⟩

def target113 : Weights.Entry :=
  { word := [8, 0, 0, 12, 0, 12, 8], weights := [0, 0, 1, 0] }

-- Period 8, original row 4143, representative 5681.
def source114 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B018.Data.entryAt ⟨60, by decide +kernel⟩

def target114 : Weights.Entry :=
  { word := [8, 0, 1, 4, 8, 12, 8], weights := [1, 0, 1, 0] }

-- Period 8, original row 4179, representative 5684.
def source115 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B018.Data.entryAt ⟨63, by decide +kernel⟩

def target115 : Weights.Entry :=
  { word := [8, 0, 1, 12, 8, 12, 8], weights := [1, 0, 1, 0] }

-- Period 8, original row 4301, representative 5691.
def source116 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B018.Data.entryAt ⟨70, by decide +kernel⟩

def target116 : Weights.Entry :=
  { word := [8, 0, 4, 10, 0, 12, 8], weights := [1, 0, 1, 1] }

-- Period 8, original row 4358, representative 5671.
def source117 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B018.Data.entryAt ⟨50, by decide +kernel⟩

def target117 : Weights.Entry :=
  { word := [8, 0, 8, 4, 4, 12, 8], weights := [1, 0, 0, 1] }

-- Period 8, original row 4379, representative 5672.
def source118 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B018.Data.entryAt ⟨51, by decide +kernel⟩

def target118 : Weights.Entry :=
  { word := [8, 0, 8, 12, 4, 12, 8], weights := [1, 0, 0, 1] }

-- Period 8, original row 4383, representative 5667.
def source119 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B018.Data.entryAt ⟨46, by decide +kernel⟩

def target119 : Weights.Entry :=
  { word := [8, 0, 9, 4, 4, 12, 8], weights := [1, 0, 0, 1] }

-- Period 8, original row 4387, representative 5657.
def source120 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B018.Data.entryAt ⟨36, by decide +kernel⟩

def target120 : Weights.Entry :=
  { word := [8, 0, 9, 4, 12, 12, 8], weights := [1, 0, 0, 1] }

-- Period 8, original row 4391, representative 5668.
def source121 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B018.Data.entryAt ⟨47, by decide +kernel⟩

def target121 : Weights.Entry :=
  { word := [8, 0, 9, 12, 4, 12, 8], weights := [1, 0, 0, 1] }

-- Period 8, original row 4395, representative 5658.
def source122 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B018.Data.entryAt ⟨37, by decide +kernel⟩

def target122 : Weights.Entry :=
  { word := [8, 0, 9, 12, 12, 12, 8], weights := [1, 0, 0, 1] }

-- Period 8, original row 4477, representative 5690.
def source123 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B018.Data.entryAt ⟨69, by decide +kernel⟩

def target123 : Weights.Entry :=
  { word := [8, 0, 12, 10, 0, 12, 8], weights := [1, 0, 1, 1] }

-- Period 8, original row 4685, representative 5647.
def source124 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B018.Data.entryAt ⟨26, by decide +kernel⟩

def target124 : Weights.Entry :=
  { word := [8, 2, 0, 6, 0, 12, 8], weights := [1, 1, 1, 1] }

-- Period 8, original row 4687, representative 5630.
def source125 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B018.Data.entryAt ⟨9, by decide +kernel⟩

def target125 : Weights.Entry :=
  { word := [8, 2, 0, 6, 8, 12, 8], weights := [1, 1, 1, 1] }

-- Period 8, original row 4690, representative 5737.
def source126 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B018.Data.entryAt ⟨116, by decide +kernel⟩

def target126 : Weights.Entry :=
  { word := [8, 2, 0, 8, 1, 4, 8], weights := [0, 1, 1, 0] }

-- Period 8, original row 4701, representative 5737.
def source127 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B018.Data.entryAt ⟨116, by decide +kernel⟩

def target127 : Weights.Entry :=
  { word := [8, 2, 0, 9, 0, 4, 8], weights := [0, 1, 1, 0] }

def points127 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

def period8Entries : List Weights.Entry := [target0, target1, target2, target3, target4, target5, target6, target7, target8, target9, target10, target11, target12, target13, target14, target15, target16, target17, target18, target19, target20, target21, target22, target23, target24, target25, target26, target27, target28, target29, target30, target31, target32, target33, target34, target35, target36, target37, target38, target39, target40, target41, target42, target43, target44, target45, target46, target47, target48, target49, target50, target51, target52, target53, target54, target55, target56, target57, target58, target59, target60, target61, target62, target63, target64, target65, target66, target67, target68, target69, target70, target71, target72, target73, target74, target75, target76, target77, target78, target79, target80, target81, target82, target83, target84, target85, target86, target87, target88, target89, target90, target91, target92, target93, target94, target95, target96, target97, target98, target99, target100, target101, target102, target103, target104, target105, target106, target107, target108, target109, target110, target111, target112, target113, target114, target115, target116, target117, target118, target119, target120, target121, target122, target123, target124, target125, target126, target127]

def period8Chunk : RowCoverage.Chunk where
  rows := [⟨20, target0⟩, ⟨43, target1⟩, ⟨95, target2⟩, ⟨99, target3⟩, ⟨101, target4⟩, ⟨103, target5⟩, ⟨142, target6⟩, ⟨188, target7⟩, ⟨213, target8⟩, ⟨230, target9⟩, ⟨281, target10⟩, ⟨301, target11⟩, ⟨363, target12⟩, ⟨380, target13⟩, ⟨408, target14⟩, ⟨461, target15⟩, ⟨482, target16⟩, ⟨503, target17⟩, ⟨592, target18⟩, ⟨650, target19⟩, ⟨658, target20⟩, ⟨676, target21⟩, ⟨678, target22⟩, ⟨686, target23⟩, ⟨690, target24⟩, ⟨712, target25⟩, ⟨744, target26⟩, ⟨764, target27⟩, ⟨767, target28⟩, ⟨775, target29⟩, ⟨791, target30⟩, ⟨799, target31⟩, ⟨811, target32⟩, ⟨837, target33⟩, ⟨859, target34⟩, ⟨880, target35⟩, ⟨889, target36⟩, ⟨912, target37⟩, ⟨935, target38⟩, ⟨1045, target39⟩, ⟨1053, target40⟩, ⟨1065, target41⟩, ⟨1067, target42⟩, ⟨1071, target43⟩, ⟨1075, target44⟩, ⟨1077, target45⟩, ⟨1079, target46⟩, ⟨1148, target47⟩, ⟨1163, target48⟩, ⟨1170, target49⟩, ⟨1189, target50⟩, ⟨1208, target51⟩, ⟨1223, target52⟩, ⟨1233, target53⟩, ⟨1248, target54⟩, ⟨1284, target55⟩, ⟨1292, target56⟩, ⟨1314, target57⟩, ⟨1321, target58⟩, ⟨1340, target59⟩, ⟨1350, target60⟩, ⟨1365, target61⟩, ⟨1372, target62⟩, ⟨1374, target63⟩, ⟨1406, target64⟩, ⟨1434, target65⟩, ⟨1440, target66⟩, ⟨1453, target67⟩, ⟨1455, target68⟩, ⟨1481, target69⟩, ⟨1502, target70⟩, ⟨1525, target71⟩, ⟨1548, target72⟩, ⟨1591, target73⟩, ⟨1649, target74⟩, ⟨1657, target75⟩, ⟨1675, target76⟩, ⟨1677, target77⟩, ⟨1685, target78⟩, ⟨1689, target79⟩, ⟨1711, target80⟩, ⟨1757, target81⟩, ⟨1780, target82⟩, ⟨1816, target83⟩, ⟨1820, target84⟩, ⟨1822, target85⟩, ⟨1824, target86⟩, ⟨1881, target87⟩, ⟨1934, target88⟩, ⟨1942, target89⟩, ⟨1960, target90⟩, ⟨1962, target91⟩, ⟨1970, target92⟩, ⟨1974, target93⟩, ⟨1996, target94⟩, ⟨2042, target95⟩, ⟨2065, target96⟩, ⟨2137, target97⟩, ⟨2145, target98⟩, ⟨2147, target99⟩, ⟨2149, target100⟩, ⟨2153, target101⟩, ⟨2157, target102⟩, ⟨2159, target103⟩, ⟨2161, target104⟩, ⟨2240, target105⟩, ⟨2293, target106⟩, ⟨2301, target107⟩, ⟨2319, target108⟩, ⟨2321, target109⟩, ⟨2329, target110⟩, ⟨2333, target111⟩, ⟨2355, target112⟩, ⟨4121, target113⟩, ⟨4143, target114⟩, ⟨4179, target115⟩, ⟨4301, target116⟩, ⟨4358, target117⟩, ⟨4379, target118⟩, ⟨4383, target119⟩, ⟨4387, target120⟩, ⟨4391, target121⟩, ⟨4395, target122⟩, ⟨4477, target123⟩, ⟨4685, target124⟩, ⟨4687, target125⟩, ⟨4690, target126⟩, ⟨4701, target127⟩]
  indexMask := 138756948076395414430476447833489651953652271953871813318799944684920331595019177910604251822468950387056711443780108480516837239829492344761202534157675315871115672002963262643867813259275032711661374169582273036677280153582547854585466270594742081166270711607501792544706809551500494451670211261905293457708348472847674410379545405417932509914685439932664875694649541840939244250916042837209248094626198574790893855099758734890766285385974765769002585875196034125297833485942836726000141898226237158771492970814006363161130457292830643513734497045311037979225825787601186224263915820993321401533364241178294841664711692125660040616951412741298825683845548650564010177487402902403236297270655936618034327524506538547651368693554159367012839048416157297781777705239549946385647827568813230800091043720485536055369086475974295373268530353869053096094884967112378611090664279725498829681521568007767980379497828402907078423417671465383807814808911358981915729514573997883846012666378519958994001454250962624819575577817347253624870779326165702653388904659519511823392617407608636788747915630525658470523386222065008283941651940317831913033917890561488400823172505533569776848880325018418146487593805511528452190972520729261691263195428159263953458315758698468886697674401496782756070294112687720798879453101990521691343286942906732486905275468114653613609311758779172458812310316610302398671229606170440578695416512512
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

end FranklSmallCyclic.TransportBatches.G044.B000.Data
