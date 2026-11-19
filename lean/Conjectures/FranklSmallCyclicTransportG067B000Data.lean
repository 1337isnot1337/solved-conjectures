module

public import Conjectures.FranklSmallCyclicRowCoverage
public import Conjectures.FranklSmallCyclicCanonicalWords
public import Conjectures.FranklSmallCyclicOrbit9Block014Data

/-! 128 literal targets sharing one source proof block.
Original words and row indices are retained; weights may be transported.
-/
@[expose] public section

namespace FranklSmallCyclic.TransportBatches.G067.B000.Data

-- Period 9, original row 188, representative 8558.
def source0 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B014.Data.entryAt ⟨15, by decide +kernel⟩

def target0 : Weights.Entry :=
  { word := [0, 1, 4, 10, 0, 12, 8], weights := [1, 0, 1, 1] }

-- Period 9, original row 281, representative 8557.
def source1 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B014.Data.entryAt ⟨14, by decide +kernel⟩

def target1 : Weights.Entry :=
  { word := [0, 1, 12, 10, 0, 12, 8], weights := [1, 0, 1, 1] }

-- Period 9, original row 363, representative 8547.
def source2 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B014.Data.entryAt ⟨4, by decide +kernel⟩

def target2 : Weights.Entry :=
  { word := [0, 2, 2, 2, 8, 12, 8], weights := [0, 1, 0, 1] }

-- Period 9, original row 380, representative 8558.
def source3 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B014.Data.entryAt ⟨15, by decide +kernel⟩

def target3 : Weights.Entry :=
  { word := [0, 2, 2, 10, 0, 12, 8], weights := [0, 1, 1, 1] }

def points3 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 408, representative 8548.
def source4 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B014.Data.entryAt ⟨5, by decide +kernel⟩

def target4 : Weights.Entry :=
  { word := [0, 2, 2, 10, 8, 12, 8], weights := [0, 1, 1, 0] }

-- Period 9, original row 461, representative 8545.
def source5 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B014.Data.entryAt ⟨2, by decide +kernel⟩

def target5 : Weights.Entry :=
  { word := [0, 2, 10, 2, 8, 12, 8], weights := [0, 1, 0, 1] }

-- Period 9, original row 482, representative 8557.
def source6 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B014.Data.entryAt ⟨14, by decide +kernel⟩

def target6 : Weights.Entry :=
  { word := [0, 2, 10, 10, 0, 12, 8], weights := [0, 1, 1, 1] }

def points6 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 503, representative 8546.
def source7 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B014.Data.entryAt ⟨3, by decide +kernel⟩

def target7 : Weights.Entry :=
  { word := [0, 2, 10, 10, 8, 12, 8], weights := [0, 1, 1, 0] }

-- Period 9, original row 592, representative 8599.
def source8 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B014.Data.entryAt ⟨56, by decide +kernel⟩

def target8 : Weights.Entry :=
  { word := [0, 4, 2, 8, 8, 12, 8], weights := [0, 1, 1, 0] }

-- Period 9, original row 650, representative 8612.
def source9 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B014.Data.entryAt ⟨69, by decide +kernel⟩

def target9 : Weights.Entry :=
  { word := [0, 4, 8, 4, 4, 12, 8], weights := [1, 0, 0, 1] }

-- Period 9, original row 658, representative 8620.
def source10 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B014.Data.entryAt ⟨77, by decide +kernel⟩

def target10 : Weights.Entry :=
  { word := [0, 4, 8, 4, 8, 12, 8], weights := [0, 0, 1, 0] }

-- Period 9, original row 676, representative 8604.
def source11 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B014.Data.entryAt ⟨61, by decide +kernel⟩

def target11 : Weights.Entry :=
  { word := [0, 4, 8, 4, 12, 12, 8], weights := [1, 0, 0, 1] }

-- Period 9, original row 678, representative 8613.
def source12 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B014.Data.entryAt ⟨70, by decide +kernel⟩

def target12 : Weights.Entry :=
  { word := [0, 4, 8, 12, 4, 12, 8], weights := [0, 1, 1, 0] }

-- Period 9, original row 686, representative 8621.
def source13 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B014.Data.entryAt ⟨78, by decide +kernel⟩

def target13 : Weights.Entry :=
  { word := [0, 4, 8, 12, 8, 12, 8], weights := [0, 0, 1, 0] }

-- Period 9, original row 690, representative 8605.
def source14 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B014.Data.entryAt ⟨62, by decide +kernel⟩

def target14 : Weights.Entry :=
  { word := [0, 4, 8, 12, 12, 12, 8], weights := [0, 1, 1, 0] }

-- Period 9, original row 712, representative 8598.
def source15 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B014.Data.entryAt ⟨55, by decide +kernel⟩

def target15 : Weights.Entry :=
  { word := [0, 4, 10, 8, 8, 12, 8], weights := [0, 1, 1, 0] }

-- Period 9, original row 744, representative 8551.
def source16 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B014.Data.entryAt ⟨8, by decide +kernel⟩

def target16 : Weights.Entry :=
  { word := [0, 6, 0, 12, 8, 12, 8], weights := [0, 1, 1, 0] }

-- Period 9, original row 767, representative 8549.
def source17 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B014.Data.entryAt ⟨6, by decide +kernel⟩

def target17 : Weights.Entry :=
  { word := [0, 6, 8, 4, 8, 12, 8], weights := [0, 0, 1, 0] }

-- Period 9, original row 775, representative 8550.
def source18 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B014.Data.entryAt ⟨7, by decide +kernel⟩

def target18 : Weights.Entry :=
  { word := [0, 6, 8, 12, 8, 12, 8], weights := [0, 0, 1, 0] }

-- Period 9, original row 799, representative 8624.
def source19 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B014.Data.entryAt ⟨81, by decide +kernel⟩

def target19 : Weights.Entry :=
  { word := [0, 8, 0, 0, 1, 12, 8], weights := [0, 0, 1, 0] }

-- Period 9, original row 811, representative 8624.
def source20 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B014.Data.entryAt ⟨81, by decide +kernel⟩

def target20 : Weights.Entry :=
  { word := [0, 8, 0, 4, 0, 12, 8], weights := [0, 0, 1, 0] }

def points20 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 837, representative 8622.
def source21 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B014.Data.entryAt ⟨79, by decide +kernel⟩

def target21 : Weights.Entry :=
  { word := [0, 8, 0, 4, 8, 12, 8], weights := [0, 0, 1, 0] }

-- Period 9, original row 859, representative 8625.
def source22 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B014.Data.entryAt ⟨82, by decide +kernel⟩

def target22 : Weights.Entry :=
  { word := [0, 8, 0, 8, 1, 12, 8], weights := [0, 0, 1, 0] }

-- Period 9, original row 880, representative 8625.
def source23 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B014.Data.entryAt ⟨82, by decide +kernel⟩

def target23 : Weights.Entry :=
  { word := [0, 8, 0, 12, 0, 12, 8], weights := [0, 0, 1, 0] }

def points23 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 889, representative 8623.
def source24 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B014.Data.entryAt ⟨80, by decide +kernel⟩

def target24 : Weights.Entry :=
  { word := [0, 8, 0, 12, 8, 12, 8], weights := [0, 0, 1, 0] }

-- Period 9, original row 912, representative 8616.
def source25 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B014.Data.entryAt ⟨73, by decide +kernel⟩

def target25 : Weights.Entry :=
  { word := [0, 8, 1, 4, 8, 12, 8], weights := [0, 0, 1, 0] }

-- Period 9, original row 935, representative 8619.
def source26 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B014.Data.entryAt ⟨76, by decide +kernel⟩

def target26 : Weights.Entry :=
  { word := [0, 8, 1, 12, 8, 12, 8], weights := [0, 0, 1, 0] }

-- Period 9, original row 1045, representative 8614.
def source27 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B014.Data.entryAt ⟨71, by decide +kernel⟩

def target27 : Weights.Entry :=
  { word := [0, 8, 8, 4, 4, 12, 8], weights := [1, 0, 0, 1] }

-- Period 9, original row 1053, representative 8606.
def source28 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B014.Data.entryAt ⟨63, by decide +kernel⟩

def target28 : Weights.Entry :=
  { word := [0, 8, 8, 4, 12, 12, 8], weights := [0, 0, 1, 0] }

-- Period 9, original row 1065, representative 8615.
def source29 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B014.Data.entryAt ⟨72, by decide +kernel⟩

def target29 : Weights.Entry :=
  { word := [0, 8, 8, 12, 4, 12, 8], weights := [0, 1, 1, 0] }

-- Period 9, original row 1067, representative 8607.
def source30 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B014.Data.entryAt ⟨64, by decide +kernel⟩

def target30 : Weights.Entry :=
  { word := [0, 8, 8, 12, 12, 12, 8], weights := [0, 0, 1, 0] }

-- Period 9, original row 1071, representative 8608.
def source31 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B014.Data.entryAt ⟨65, by decide +kernel⟩

def target31 : Weights.Entry :=
  { word := [0, 8, 9, 4, 4, 12, 8], weights := [1, 0, 0, 1] }

-- Period 9, original row 1075, representative 8600.
def source32 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B014.Data.entryAt ⟨57, by decide +kernel⟩

def target32 : Weights.Entry :=
  { word := [0, 8, 9, 4, 12, 12, 8], weights := [0, 0, 1, 0] }

-- Period 9, original row 1077, representative 8609.
def source33 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B014.Data.entryAt ⟨66, by decide +kernel⟩

def target33 : Weights.Entry :=
  { word := [0, 8, 9, 12, 4, 12, 8], weights := [0, 1, 1, 0] }

-- Period 9, original row 1079, representative 8601.
def source34 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B014.Data.entryAt ⟨58, by decide +kernel⟩

def target34 : Weights.Entry :=
  { word := [0, 8, 9, 12, 12, 12, 8], weights := [0, 0, 1, 0] }

-- Period 9, original row 1163, representative 8670.
def source35 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B014.Data.entryAt ⟨127, by decide +kernel⟩

def target35 : Weights.Entry :=
  { word := [0, 9, 0, 4, 4, 4, 8], weights := [1, 0, 0, 1] }

-- Period 9, original row 1189, representative 8666.
def source36 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B014.Data.entryAt ⟨123, by decide +kernel⟩

def target36 : Weights.Entry :=
  { word := [0, 9, 0, 4, 12, 4, 8], weights := [1, 0, 0, 1] }

-- Period 9, original row 1248, representative 8669.
def source37 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B014.Data.entryAt ⟨126, by decide +kernel⟩

def target37 : Weights.Entry :=
  { word := [0, 9, 0, 12, 12, 4, 8], weights := [1, 0, 0, 1] }

-- Period 9, original row 1292, representative 8667.
def source38 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B014.Data.entryAt ⟨124, by decide +kernel⟩

def target38 : Weights.Entry :=
  { word := [0, 9, 8, 4, 12, 4, 8], weights := [1, 0, 0, 1] }

-- Period 9, original row 1321, representative 8668.
def source39 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B014.Data.entryAt ⟨125, by decide +kernel⟩

def target39 : Weights.Entry :=
  { word := [0, 9, 8, 12, 12, 4, 8], weights := [1, 0, 0, 1] }

-- Period 9, original row 1365, representative 8664.
def source40 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B014.Data.entryAt ⟨121, by decide +kernel⟩

def target40 : Weights.Entry :=
  { word := [0, 10, 0, 12, 4, 4, 8], weights := [0, 1, 1, 0] }

-- Period 9, original row 1372, representative 8552.
def source41 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B014.Data.entryAt ⟨9, by decide +kernel⟩

def target41 : Weights.Entry :=
  { word := [0, 10, 0, 12, 8, 12, 8], weights := [0, 1, 1, 0] }

-- Period 9, original row 1374, representative 8661.
def source42 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B014.Data.entryAt ⟨118, by decide +kernel⟩

def target42 : Weights.Entry :=
  { word := [0, 10, 0, 12, 12, 4, 8], weights := [0, 1, 1, 0] }

-- Period 9, original row 1406, representative 8543.
def source43 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B014.Data.entryAt ⟨0, by decide +kernel⟩

def target43 : Weights.Entry :=
  { word := [0, 10, 2, 2, 8, 12, 8], weights := [0, 1, 0, 1] }

-- Period 9, original row 1434, representative 8544.
def source44 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B014.Data.entryAt ⟨1, by decide +kernel⟩

def target44 : Weights.Entry :=
  { word := [0, 10, 2, 10, 8, 12, 8], weights := [0, 1, 1, 0] }

-- Period 9, original row 1440, representative 8659.
def source45 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B014.Data.entryAt ⟨116, by decide +kernel⟩

def target45 : Weights.Entry :=
  { word := [0, 10, 8, 4, 12, 4, 8], weights := [1, 0, 2, 1] }

-- Period 9, original row 1453, representative 8663.
def source46 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B014.Data.entryAt ⟨120, by decide +kernel⟩

def target46 : Weights.Entry :=
  { word := [0, 10, 8, 12, 4, 4, 8], weights := [0, 1, 1, 0] }

-- Period 9, original row 1455, representative 8660.
def source47 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B014.Data.entryAt ⟨117, by decide +kernel⟩

def target47 : Weights.Entry :=
  { word := [0, 10, 8, 12, 12, 4, 8], weights := [0, 1, 1, 0] }

-- Period 9, original row 1525, representative 8616.
def source48 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B014.Data.entryAt ⟨73, by decide +kernel⟩

def target48 : Weights.Entry :=
  { word := [0, 12, 0, 4, 8, 12, 8], weights := [0, 0, 1, 0] }

def points48 : List (ℕ × ℕ) := [(0, 0), (1, 2), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 1548, representative 8619.
def source49 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B014.Data.entryAt ⟨76, by decide +kernel⟩

def target49 : Weights.Entry :=
  { word := [0, 12, 0, 12, 8, 12, 8], weights := [0, 0, 1, 0] }

def points49 : List (ℕ × ℕ) := [(0, 0), (1, 2), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 1591, representative 8597.
def source50 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B014.Data.entryAt ⟨54, by decide +kernel⟩

def target50 : Weights.Entry :=
  { word := [0, 12, 2, 8, 8, 12, 8], weights := [0, 1, 1, 0] }

-- Period 9, original row 1649, representative 8610.
def source51 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B014.Data.entryAt ⟨67, by decide +kernel⟩

def target51 : Weights.Entry :=
  { word := [0, 12, 8, 4, 4, 12, 8], weights := [1, 0, 0, 1] }

-- Period 9, original row 1657, representative 8617.
def source52 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B014.Data.entryAt ⟨74, by decide +kernel⟩

def target52 : Weights.Entry :=
  { word := [0, 12, 8, 4, 8, 12, 8], weights := [0, 0, 1, 0] }

-- Period 9, original row 1675, representative 8602.
def source53 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B014.Data.entryAt ⟨59, by decide +kernel⟩

def target53 : Weights.Entry :=
  { word := [0, 12, 8, 4, 12, 12, 8], weights := [1, 0, 0, 1] }

-- Period 9, original row 1677, representative 8611.
def source54 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B014.Data.entryAt ⟨68, by decide +kernel⟩

def target54 : Weights.Entry :=
  { word := [0, 12, 8, 12, 4, 12, 8], weights := [0, 1, 1, 0] }

-- Period 9, original row 1685, representative 8618.
def source55 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B014.Data.entryAt ⟨75, by decide +kernel⟩

def target55 : Weights.Entry :=
  { word := [0, 12, 8, 12, 8, 12, 8], weights := [0, 0, 1, 0] }

-- Period 9, original row 1689, representative 8603.
def source56 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B014.Data.entryAt ⟨60, by decide +kernel⟩

def target56 : Weights.Entry :=
  { word := [0, 12, 8, 12, 12, 12, 8], weights := [0, 1, 1, 0] }

-- Period 9, original row 1711, representative 8596.
def source57 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B014.Data.entryAt ⟨53, by decide +kernel⟩

def target57 : Weights.Entry :=
  { word := [0, 12, 10, 8, 8, 12, 8], weights := [0, 1, 1, 0] }

-- Period 9, original row 1881, representative 8599.
def source58 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B014.Data.entryAt ⟨56, by decide +kernel⟩

def target58 : Weights.Entry :=
  { word := [1, 4, 2, 8, 8, 12, 8], weights := [0, 1, 1, 0] }

def points58 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 1934, representative 8612.
def source59 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B014.Data.entryAt ⟨69, by decide +kernel⟩

def target59 : Weights.Entry :=
  { word := [1, 4, 8, 4, 4, 12, 8], weights := [1, 0, 0, 1] }

def points59 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 1942, representative 8620.
def source60 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B014.Data.entryAt ⟨77, by decide +kernel⟩

def target60 : Weights.Entry :=
  { word := [1, 4, 8, 4, 8, 12, 8], weights := [0, 0, 1, 0] }

def points60 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 1960, representative 8604.
def source61 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B014.Data.entryAt ⟨61, by decide +kernel⟩

def target61 : Weights.Entry :=
  { word := [1, 4, 8, 4, 12, 12, 8], weights := [1, 0, 0, 1] }

def points61 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 1962, representative 8613.
def source62 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B014.Data.entryAt ⟨70, by decide +kernel⟩

def target62 : Weights.Entry :=
  { word := [1, 4, 8, 12, 4, 12, 8], weights := [0, 1, 1, 0] }

def points62 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 1970, representative 8621.
def source63 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B014.Data.entryAt ⟨78, by decide +kernel⟩

def target63 : Weights.Entry :=
  { word := [1, 4, 8, 12, 8, 12, 8], weights := [0, 0, 1, 0] }

def points63 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 1974, representative 8605.
def source64 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B014.Data.entryAt ⟨62, by decide +kernel⟩

def target64 : Weights.Entry :=
  { word := [1, 4, 8, 12, 12, 12, 8], weights := [0, 1, 1, 0] }

def points64 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 1996, representative 8598.
def source65 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B014.Data.entryAt ⟨55, by decide +kernel⟩

def target65 : Weights.Entry :=
  { word := [1, 4, 10, 8, 8, 12, 8], weights := [0, 1, 1, 0] }

def points65 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 2042, representative 8616.
def source66 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B014.Data.entryAt ⟨73, by decide +kernel⟩

def target66 : Weights.Entry :=
  { word := [1, 8, 1, 4, 8, 12, 8], weights := [0, 0, 1, 0] }

def points66 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 2065, representative 8619.
def source67 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B014.Data.entryAt ⟨76, by decide +kernel⟩

def target67 : Weights.Entry :=
  { word := [1, 8, 1, 12, 8, 12, 8], weights := [0, 0, 1, 0] }

def points67 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 2137, representative 8614.
def source68 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B014.Data.entryAt ⟨71, by decide +kernel⟩

def target68 : Weights.Entry :=
  { word := [1, 8, 8, 4, 4, 12, 8], weights := [1, 0, 0, 1] }

def points68 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 2145, representative 8606.
def source69 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B014.Data.entryAt ⟨63, by decide +kernel⟩

def target69 : Weights.Entry :=
  { word := [1, 8, 8, 4, 12, 12, 8], weights := [0, 0, 1, 0] }

def points69 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 2147, representative 8615.
def source70 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B014.Data.entryAt ⟨72, by decide +kernel⟩

def target70 : Weights.Entry :=
  { word := [1, 8, 8, 12, 4, 12, 8], weights := [0, 1, 1, 0] }

def points70 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 2149, representative 8607.
def source71 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B014.Data.entryAt ⟨64, by decide +kernel⟩

def target71 : Weights.Entry :=
  { word := [1, 8, 8, 12, 12, 12, 8], weights := [0, 0, 1, 0] }

def points71 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 2153, representative 8608.
def source72 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B014.Data.entryAt ⟨65, by decide +kernel⟩

def target72 : Weights.Entry :=
  { word := [1, 8, 9, 4, 4, 12, 8], weights := [1, 0, 0, 1] }

def points72 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 2157, representative 8600.
def source73 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B014.Data.entryAt ⟨57, by decide +kernel⟩

def target73 : Weights.Entry :=
  { word := [1, 8, 9, 4, 12, 12, 8], weights := [0, 0, 1, 0] }

def points73 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 2159, representative 8609.
def source74 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B014.Data.entryAt ⟨66, by decide +kernel⟩

def target74 : Weights.Entry :=
  { word := [1, 8, 9, 12, 4, 12, 8], weights := [0, 1, 1, 0] }

def points74 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 2161, representative 8601.
def source75 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B014.Data.entryAt ⟨58, by decide +kernel⟩

def target75 : Weights.Entry :=
  { word := [1, 8, 9, 12, 12, 12, 8], weights := [0, 0, 1, 0] }

def points75 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 2240, representative 8597.
def source76 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B014.Data.entryAt ⟨54, by decide +kernel⟩

def target76 : Weights.Entry :=
  { word := [1, 12, 2, 8, 8, 12, 8], weights := [0, 1, 1, 0] }

def points76 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 2293, representative 8610.
def source77 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B014.Data.entryAt ⟨67, by decide +kernel⟩

def target77 : Weights.Entry :=
  { word := [1, 12, 8, 4, 4, 12, 8], weights := [1, 0, 0, 1] }

def points77 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 2301, representative 8617.
def source78 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B014.Data.entryAt ⟨74, by decide +kernel⟩

def target78 : Weights.Entry :=
  { word := [1, 12, 8, 4, 8, 12, 8], weights := [0, 0, 1, 0] }

def points78 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 2319, representative 8602.
def source79 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B014.Data.entryAt ⟨59, by decide +kernel⟩

def target79 : Weights.Entry :=
  { word := [1, 12, 8, 4, 12, 12, 8], weights := [1, 0, 0, 1] }

def points79 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 2321, representative 8611.
def source80 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B014.Data.entryAt ⟨68, by decide +kernel⟩

def target80 : Weights.Entry :=
  { word := [1, 12, 8, 12, 4, 12, 8], weights := [0, 1, 1, 0] }

def points80 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 2329, representative 8618.
def source81 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B014.Data.entryAt ⟨75, by decide +kernel⟩

def target81 : Weights.Entry :=
  { word := [1, 12, 8, 12, 8, 12, 8], weights := [0, 0, 1, 0] }

def points81 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 2333, representative 8603.
def source82 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B014.Data.entryAt ⟨60, by decide +kernel⟩

def target82 : Weights.Entry :=
  { word := [1, 12, 8, 12, 12, 12, 8], weights := [0, 1, 1, 0] }

def points82 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 2355, representative 8596.
def source83 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B014.Data.entryAt ⟨53, by decide +kernel⟩

def target83 : Weights.Entry :=
  { word := [1, 12, 10, 8, 8, 12, 8], weights := [0, 1, 1, 0] }

def points83 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 2469, representative 8638.
def source84 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B014.Data.entryAt ⟨95, by decide +kernel⟩

def target84 : Weights.Entry :=
  { word := [2, 0, 8, 4, 4, 4, 8], weights := [1, 0, 0, 1] }

-- Period 9, original row 2490, representative 8646.
def source85 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B014.Data.entryAt ⟨103, by decide +kernel⟩

def target85 : Weights.Entry :=
  { word := [2, 0, 8, 12, 0, 4, 8], weights := [0, 0, 1, 0] }

-- Period 9, original row 2499, representative 8639.
def source86 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B014.Data.entryAt ⟨96, by decide +kernel⟩

def target86 : Weights.Entry :=
  { word := [2, 0, 8, 12, 4, 4, 8], weights := [1, 0, 0, 1] }

-- Period 9, original row 2506, representative 8654.
def source87 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B014.Data.entryAt ⟨111, by decide +kernel⟩

def target87 : Weights.Entry :=
  { word := [2, 0, 9, 0, 1, 4, 8], weights := [0, 0, 1, 0] }

-- Period 9, original row 2510, representative 8655.
def source88 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B014.Data.entryAt ⟨112, by decide +kernel⟩

def target88 : Weights.Entry :=
  { word := [2, 0, 9, 8, 1, 4, 8], weights := [0, 0, 1, 0] }

-- Period 9, original row 2552, representative 8647.
def source89 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B014.Data.entryAt ⟨104, by decide +kernel⟩

def target89 : Weights.Entry :=
  { word := [2, 0, 12, 10, 0, 4, 8], weights := [1, 0, 1, 1] }

-- Period 9, original row 2818, representative 8632.
def source90 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B014.Data.entryAt ⟨89, by decide +kernel⟩

def target90 : Weights.Entry :=
  { word := [2, 8, 0, 4, 4, 4, 8], weights := [1, 0, 0, 1] }

-- Period 9, original row 2825, representative 8640.
def source91 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B014.Data.entryAt ⟨97, by decide +kernel⟩

def target91 : Weights.Entry :=
  { word := [2, 8, 0, 4, 8, 4, 8], weights := [1, 0, 1, 0] }

-- Period 9, original row 2844, representative 8626.
def source92 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B014.Data.entryAt ⟨83, by decide +kernel⟩

def target92 : Weights.Entry :=
  { word := [2, 8, 0, 4, 12, 4, 8], weights := [1, 0, 0, 1] }

-- Period 9, original row 2851, representative 8645.
def source93 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B014.Data.entryAt ⟨102, by decide +kernel⟩

def target93 : Weights.Entry :=
  { word := [2, 8, 0, 12, 0, 4, 8], weights := [1, 0, 1, 0] }

-- Period 9, original row 2870, representative 8637.
def source94 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B014.Data.entryAt ⟨94, by decide +kernel⟩

def target94 : Weights.Entry :=
  { word := [2, 8, 0, 12, 4, 4, 8], weights := [1, 0, 0, 1] }

-- Period 9, original row 2876, representative 8643.
def source95 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B014.Data.entryAt ⟨100, by decide +kernel⟩

def target95 : Weights.Entry :=
  { word := [2, 8, 0, 12, 8, 4, 8], weights := [1, 0, 1, 0] }

-- Period 9, original row 2895, representative 8631.
def source96 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B014.Data.entryAt ⟨88, by decide +kernel⟩

def target96 : Weights.Entry :=
  { word := [2, 8, 0, 12, 12, 4, 8], weights := [1, 0, 0, 1] }

-- Period 9, original row 2955, representative 8656.
def source97 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B014.Data.entryAt ⟨113, by decide +kernel⟩

def target97 : Weights.Entry :=
  { word := [2, 8, 8, 0, 1, 4, 8], weights := [0, 0, 1, 0] }

-- Period 9, original row 2982, representative 8635.
def source98 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B014.Data.entryAt ⟨92, by decide +kernel⟩

def target98 : Weights.Entry :=
  { word := [2, 8, 8, 4, 4, 4, 8], weights := [1, 0, 0, 1] }

-- Period 9, original row 2991, representative 8641.
def source99 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B014.Data.entryAt ⟨98, by decide +kernel⟩

def target99 : Weights.Entry :=
  { word := [2, 8, 8, 4, 8, 4, 8], weights := [1, 0, 1, 0] }

-- Period 9, original row 3012, representative 8629.
def source100 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B014.Data.entryAt ⟨86, by decide +kernel⟩

def target100 : Weights.Entry :=
  { word := [2, 8, 8, 4, 12, 4, 8], weights := [1, 0, 0, 1] }

-- Period 9, original row 3017, representative 8657.
def source101 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B014.Data.entryAt ⟨114, by decide +kernel⟩

def target101 : Weights.Entry :=
  { word := [2, 8, 8, 8, 1, 4, 8], weights := [0, 0, 1, 0] }

-- Period 9, original row 3035, representative 8644.
def source102 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B014.Data.entryAt ⟨101, by decide +kernel⟩

def target102 : Weights.Entry :=
  { word := [2, 8, 8, 12, 0, 4, 8], weights := [0, 0, 1, 0] }

-- Period 9, original row 3056, representative 8636.
def source103 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B014.Data.entryAt ⟨93, by decide +kernel⟩

def target103 : Weights.Entry :=
  { word := [2, 8, 8, 12, 4, 4, 8], weights := [1, 0, 0, 1] }

-- Period 9, original row 3064, representative 8642.
def source104 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B014.Data.entryAt ⟨99, by decide +kernel⟩

def target104 : Weights.Entry :=
  { word := [2, 8, 8, 12, 8, 4, 8], weights := [0, 0, 1, 0] }

-- Period 9, original row 3085, representative 8630.
def source105 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B014.Data.entryAt ⟨87, by decide +kernel⟩

def target105 : Weights.Entry :=
  { word := [2, 8, 8, 12, 12, 4, 8], weights := [1, 0, 0, 1] }

-- Period 9, original row 3088, representative 8650.
def source106 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B014.Data.entryAt ⟨107, by decide +kernel⟩

def target106 : Weights.Entry :=
  { word := [2, 8, 9, 0, 1, 4, 8], weights := [0, 0, 1, 0] }

-- Period 9, original row 3092, representative 8651.
def source107 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B014.Data.entryAt ⟨108, by decide +kernel⟩

def target107 : Weights.Entry :=
  { word := [2, 8, 9, 8, 1, 4, 8], weights := [0, 0, 1, 0] }

-- Period 9, original row 3681, representative 8652.
def source108 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B014.Data.entryAt ⟨109, by decide +kernel⟩

def target108 : Weights.Entry :=
  { word := [4, 4, 8, 0, 1, 4, 8], weights := [0, 0, 1, 0] }

-- Period 9, original row 3685, representative 8653.
def source109 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B014.Data.entryAt ⟨110, by decide +kernel⟩

def target109 : Weights.Entry :=
  { word := [4, 4, 8, 8, 1, 4, 8], weights := [0, 0, 1, 0] }

-- Period 9, original row 3736, representative 8632.
def source110 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B014.Data.entryAt ⟨89, by decide +kernel⟩

def target110 : Weights.Entry :=
  { word := [4, 8, 0, 4, 4, 4, 8], weights := [1, 0, 0, 1] }

def points110 : List (ℕ × ℕ) := [(0, 0), (1, 2), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 3743, representative 8640.
def source111 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B014.Data.entryAt ⟨97, by decide +kernel⟩

def target111 : Weights.Entry :=
  { word := [4, 8, 0, 4, 8, 4, 8], weights := [1, 0, 1, 0] }

def points111 : List (ℕ × ℕ) := [(0, 0), (1, 2), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 3762, representative 8626.
def source112 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B014.Data.entryAt ⟨83, by decide +kernel⟩

def target112 : Weights.Entry :=
  { word := [4, 8, 0, 4, 12, 4, 8], weights := [1, 0, 0, 1] }

def points112 : List (ℕ × ℕ) := [(0, 0), (1, 2), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 3780, representative 8637.
def source113 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B014.Data.entryAt ⟨94, by decide +kernel⟩

def target113 : Weights.Entry :=
  { word := [4, 8, 0, 12, 4, 4, 8], weights := [1, 0, 0, 1] }

def points113 : List (ℕ × ℕ) := [(0, 0), (1, 2), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 3786, representative 8643.
def source114 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B014.Data.entryAt ⟨100, by decide +kernel⟩

def target114 : Weights.Entry :=
  { word := [4, 8, 0, 12, 8, 4, 8], weights := [1, 0, 1, 0] }

def points114 : List (ℕ × ℕ) := [(0, 0), (1, 2), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 3805, representative 8631.
def source115 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B014.Data.entryAt ⟨88, by decide +kernel⟩

def target115 : Weights.Entry :=
  { word := [4, 8, 0, 12, 12, 4, 8], weights := [1, 0, 0, 1] }

def points115 : List (ℕ × ℕ) := [(0, 0), (1, 2), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 3882, representative 8633.
def source116 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B014.Data.entryAt ⟨90, by decide +kernel⟩

def target116 : Weights.Entry :=
  { word := [4, 8, 8, 4, 4, 4, 8], weights := [1, 0, 0, 1] }

-- Period 9, original row 3890, representative 8627.
def source117 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B014.Data.entryAt ⟨84, by decide +kernel⟩

def target117 : Weights.Entry :=
  { word := [4, 8, 8, 4, 12, 4, 8], weights := [1, 0, 0, 1] }

-- Period 9, original row 3904, representative 8634.
def source118 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B014.Data.entryAt ⟨91, by decide +kernel⟩

def target118 : Weights.Entry :=
  { word := [4, 8, 8, 12, 4, 4, 8], weights := [1, 0, 0, 1] }

-- Period 9, original row 3911, representative 8628.
def source119 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B014.Data.entryAt ⟨85, by decide +kernel⟩

def target119 : Weights.Entry :=
  { word := [4, 8, 8, 12, 12, 4, 8], weights := [1, 0, 0, 1] }

-- Period 9, original row 4046, representative 8648.
def source120 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B014.Data.entryAt ⟨105, by decide +kernel⟩

def target120 : Weights.Entry :=
  { word := [4, 12, 8, 0, 1, 4, 8], weights := [0, 0, 1, 0] }

-- Period 9, original row 4050, representative 8649.
def source121 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B014.Data.entryAt ⟨106, by decide +kernel⟩

def target121 : Weights.Entry :=
  { word := [4, 12, 8, 8, 1, 4, 8], weights := [0, 0, 1, 0] }

-- Period 9, original row 4121, representative 8593.
def source122 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B014.Data.entryAt ⟨50, by decide +kernel⟩

def target122 : Weights.Entry :=
  { word := [8, 0, 0, 12, 0, 12, 8], weights := [0, 0, 1, 0] }

-- Period 9, original row 4143, representative 8581.
def source123 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B014.Data.entryAt ⟨38, by decide +kernel⟩

def target123 : Weights.Entry :=
  { word := [8, 0, 1, 4, 8, 12, 8], weights := [1, 0, 1, 0] }

-- Period 9, original row 4179, representative 8588.
def source124 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B014.Data.entryAt ⟨45, by decide +kernel⟩

def target124 : Weights.Entry :=
  { word := [8, 0, 1, 12, 8, 12, 8], weights := [1, 0, 1, 0] }

-- Period 9, original row 4301, representative 8595.
def source125 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B014.Data.entryAt ⟨52, by decide +kernel⟩

def target125 : Weights.Entry :=
  { word := [8, 0, 4, 10, 0, 12, 8], weights := [1, 0, 1, 1] }

-- Period 9, original row 4358, representative 8579.
def source126 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B014.Data.entryAt ⟨36, by decide +kernel⟩

def target126 : Weights.Entry :=
  { word := [8, 0, 8, 4, 4, 12, 8], weights := [1, 0, 0, 1] }

-- Period 9, original row 4379, representative 8580.
def source127 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B014.Data.entryAt ⟨37, by decide +kernel⟩

def target127 : Weights.Entry :=
  { word := [8, 0, 8, 12, 4, 12, 8], weights := [1, 0, 0, 1] }

def period9Entries : List Weights.Entry := [target0, target1, target2, target3, target4, target5, target6, target7, target8, target9, target10, target11, target12, target13, target14, target15, target16, target17, target18, target19, target20, target21, target22, target23, target24, target25, target26, target27, target28, target29, target30, target31, target32, target33, target34, target35, target36, target37, target38, target39, target40, target41, target42, target43, target44, target45, target46, target47, target48, target49, target50, target51, target52, target53, target54, target55, target56, target57, target58, target59, target60, target61, target62, target63, target64, target65, target66, target67, target68, target69, target70, target71, target72, target73, target74, target75, target76, target77, target78, target79, target80, target81, target82, target83, target84, target85, target86, target87, target88, target89, target90, target91, target92, target93, target94, target95, target96, target97, target98, target99, target100, target101, target102, target103, target104, target105, target106, target107, target108, target109, target110, target111, target112, target113, target114, target115, target116, target117, target118, target119, target120, target121, target122, target123, target124, target125, target126, target127]

def period9Chunk : RowCoverage.Chunk where
  rows := [⟨188, target0⟩, ⟨281, target1⟩, ⟨363, target2⟩, ⟨380, target3⟩, ⟨408, target4⟩, ⟨461, target5⟩, ⟨482, target6⟩, ⟨503, target7⟩, ⟨592, target8⟩, ⟨650, target9⟩, ⟨658, target10⟩, ⟨676, target11⟩, ⟨678, target12⟩, ⟨686, target13⟩, ⟨690, target14⟩, ⟨712, target15⟩, ⟨744, target16⟩, ⟨767, target17⟩, ⟨775, target18⟩, ⟨799, target19⟩, ⟨811, target20⟩, ⟨837, target21⟩, ⟨859, target22⟩, ⟨880, target23⟩, ⟨889, target24⟩, ⟨912, target25⟩, ⟨935, target26⟩, ⟨1045, target27⟩, ⟨1053, target28⟩, ⟨1065, target29⟩, ⟨1067, target30⟩, ⟨1071, target31⟩, ⟨1075, target32⟩, ⟨1077, target33⟩, ⟨1079, target34⟩, ⟨1163, target35⟩, ⟨1189, target36⟩, ⟨1248, target37⟩, ⟨1292, target38⟩, ⟨1321, target39⟩, ⟨1365, target40⟩, ⟨1372, target41⟩, ⟨1374, target42⟩, ⟨1406, target43⟩, ⟨1434, target44⟩, ⟨1440, target45⟩, ⟨1453, target46⟩, ⟨1455, target47⟩, ⟨1525, target48⟩, ⟨1548, target49⟩, ⟨1591, target50⟩, ⟨1649, target51⟩, ⟨1657, target52⟩, ⟨1675, target53⟩, ⟨1677, target54⟩, ⟨1685, target55⟩, ⟨1689, target56⟩, ⟨1711, target57⟩, ⟨1881, target58⟩, ⟨1934, target59⟩, ⟨1942, target60⟩, ⟨1960, target61⟩, ⟨1962, target62⟩, ⟨1970, target63⟩, ⟨1974, target64⟩, ⟨1996, target65⟩, ⟨2042, target66⟩, ⟨2065, target67⟩, ⟨2137, target68⟩, ⟨2145, target69⟩, ⟨2147, target70⟩, ⟨2149, target71⟩, ⟨2153, target72⟩, ⟨2157, target73⟩, ⟨2159, target74⟩, ⟨2161, target75⟩, ⟨2240, target76⟩, ⟨2293, target77⟩, ⟨2301, target78⟩, ⟨2319, target79⟩, ⟨2321, target80⟩, ⟨2329, target81⟩, ⟨2333, target82⟩, ⟨2355, target83⟩, ⟨2469, target84⟩, ⟨2490, target85⟩, ⟨2499, target86⟩, ⟨2506, target87⟩, ⟨2510, target88⟩, ⟨2552, target89⟩, ⟨2818, target90⟩, ⟨2825, target91⟩, ⟨2844, target92⟩, ⟨2851, target93⟩, ⟨2870, target94⟩, ⟨2876, target95⟩, ⟨2895, target96⟩, ⟨2955, target97⟩, ⟨2982, target98⟩, ⟨2991, target99⟩, ⟨3012, target100⟩, ⟨3017, target101⟩, ⟨3035, target102⟩, ⟨3056, target103⟩, ⟨3064, target104⟩, ⟨3085, target105⟩, ⟨3088, target106⟩, ⟨3092, target107⟩, ⟨3681, target108⟩, ⟨3685, target109⟩, ⟨3736, target110⟩, ⟨3743, target111⟩, ⟨3762, target112⟩, ⟨3780, target113⟩, ⟨3786, target114⟩, ⟨3805, target115⟩, ⟨3882, target116⟩, ⟨3890, target117⟩, ⟨3904, target118⟩, ⟨3911, target119⟩, ⟨4046, target120⟩, ⟨4050, target121⟩, ⟨4121, target122⟩, ⟨4143, target123⟩, ⟨4179, target124⟩, ⟨4301, target125⟩, ⟨4358, target126⟩, ⟨4379, target127⟩]
  indexMask := 16231222070108173973621417369562502695470058237419479069974772182332107257966820396517158330892774081931460210211470423191230725565653517209507418106228671489683137412314385617948624652015576314890925061494455847402059717425739630926047309312633905167150058417655215063959082800200921371198454514347248427578260005338168684683725154249363700390717310011531012691920816952023527719391140577820918920344607526260767742524923938149497523309710222818470699257108114879426511772250982928870262093644146985864095892175207455837474005458912791702211300770066831308362577513286542904175250055210842648602791367491254217064032902267855821278378415061084984621430003281232898722460284005574898627057686186536504413693206240487685781375509317475971827580812354588091728775125449260352654075918818363864830424292350658220746874103897133253415361886283331975719594678795567823099307553842861463067791782945651833494663706843575672214587202560671254407206479356811245013963172644935800778434886227396908944418256514299010626741528833845075741384798354488899465708492451366812181794136677586474610260762057679865267856937477003305979745643083480200450566577684375485004380728315398856811497262639436263491999674040186474542826161359342922597851036901799615362553524017077461353549097428921864998171051530854367839457282171308234244096
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

end FranklSmallCyclic.TransportBatches.G067.B000.Data
