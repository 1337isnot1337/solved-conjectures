module

public import Conjectures.FranklSmallCyclicRowCoverage
public import Conjectures.FranklSmallCyclicCanonicalWords
public import Conjectures.FranklSmallCyclicOrbit9Block019Data

/-! 128 literal targets sharing one source proof block.
Original words and row indices are retained; weights may be transported.
-/
@[expose] public section

namespace FranklSmallCyclic.TransportBatches.G072.B000.Data

-- Period 9, original row 560, representative 9216.
def source0 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B019.Data.entryAt ⟨33, by decide +kernel⟩

def target0 : Weights.Entry :=
  { word := [0, 4, 2, 0, 1, 8, 2], weights := [0, 1, 0, 1] }

-- Period 9, original row 561, representative 9216.
def source1 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B019.Data.entryAt ⟨33, by decide +kernel⟩

def target1 : Weights.Entry :=
  { word := [0, 4, 2, 0, 1, 8, 4], weights := [0, 1, 0, 1] }

def points1 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 8), (8, 7)]

-- Period 9, original row 568, representative 9235.
def source2 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B019.Data.entryAt ⟨52, by decide +kernel⟩

def target2 : Weights.Entry :=
  { word := [0, 4, 2, 0, 9, 0, 4], weights := [0, 1, 0, 1] }

-- Period 9, original row 574, representative 9208.
def source3 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B019.Data.entryAt ⟨25, by decide +kernel⟩

def target3 : Weights.Entry :=
  { word := [0, 4, 2, 0, 9, 8, 2], weights := [0, 1, 0, 1] }

-- Period 9, original row 575, representative 9212.
def source4 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B019.Data.entryAt ⟨29, by decide +kernel⟩

def target4 : Weights.Entry :=
  { word := [0, 4, 2, 0, 9, 8, 4], weights := [0, 1, 0, 1] }

-- Period 9, original row 610, representative 9216.
def source5 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B019.Data.entryAt ⟨33, by decide +kernel⟩

def target5 : Weights.Entry :=
  { word := [0, 4, 4, 4, 0, 8, 2], weights := [1, 0, 0, 1] }

def points5 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 611, representative 9216.
def source6 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B019.Data.entryAt ⟨33, by decide +kernel⟩

def target6 : Weights.Entry :=
  { word := [0, 4, 4, 4, 0, 8, 4], weights := [1, 0, 0, 1] }

def points6 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6), (7, 8), (8, 7)]

-- Period 9, original row 618, representative 9231.
def source7 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B019.Data.entryAt ⟨48, by decide +kernel⟩

def target7 : Weights.Entry :=
  { word := [0, 4, 4, 4, 8, 0, 4], weights := [1, 0, 0, 1] }

-- Period 9, original row 624, representative 9196.
def source8 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B019.Data.entryAt ⟨13, by decide +kernel⟩

def target8 : Weights.Entry :=
  { word := [0, 4, 4, 4, 8, 8, 2], weights := [1, 0, 1, 0] }

-- Period 9, original row 625, representative 9202.
def source9 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B019.Data.entryAt ⟨19, by decide +kernel⟩

def target9 : Weights.Entry :=
  { word := [0, 4, 4, 4, 8, 8, 4], weights := [1, 0, 0, 1] }

-- Period 9, original row 631, representative 9193.
def source10 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B019.Data.entryAt ⟨10, by decide +kernel⟩

def target10 : Weights.Entry :=
  { word := [0, 4, 6, 8, 8, 8, 2], weights := [0, 1, 1, 0] }

-- Period 9, original row 637, representative 9236.
def source11 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B019.Data.entryAt ⟨53, by decide +kernel⟩

def target11 : Weights.Entry :=
  { word := [0, 4, 8, 4, 2, 0, 4], weights := [1, 0, 0, 1] }

-- Period 9, original row 643, representative 9190.
def source12 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B019.Data.entryAt ⟨7, by decide +kernel⟩

def target12 : Weights.Entry :=
  { word := [0, 4, 8, 4, 2, 8, 4], weights := [1, 0, 0, 1] }

-- Period 9, original row 663, representative 9229.
def source13 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B019.Data.entryAt ⟨46, by decide +kernel⟩

def target13 : Weights.Entry :=
  { word := [0, 4, 8, 4, 10, 0, 4], weights := [1, 0, 0, 1] }

-- Period 9, original row 692, representative 9219.
def source14 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B019.Data.entryAt ⟨36, by decide +kernel⟩

def target14 : Weights.Entry :=
  { word := [0, 4, 10, 0, 1, 8, 2], weights := [0, 1, 0, 1] }

-- Period 9, original row 693, representative 9219.
def source15 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B019.Data.entryAt ⟨36, by decide +kernel⟩

def target15 : Weights.Entry :=
  { word := [0, 4, 10, 0, 1, 8, 4], weights := [0, 1, 0, 1] }

def points15 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 8), (8, 7)]

-- Period 9, original row 699, representative 9211.
def source16 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B019.Data.entryAt ⟨28, by decide +kernel⟩

def target16 : Weights.Entry :=
  { word := [0, 4, 10, 0, 9, 8, 2], weights := [0, 1, 0, 1] }

-- Period 9, original row 700, representative 9215.
def source17 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B019.Data.entryAt ⟨32, by decide +kernel⟩

def target17 : Weights.Entry :=
  { word := [0, 4, 10, 0, 9, 8, 4], weights := [0, 1, 0, 1] }

-- Period 9, original row 718, representative 9219.
def source18 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B019.Data.entryAt ⟨36, by decide +kernel⟩

def target18 : Weights.Entry :=
  { word := [0, 4, 12, 4, 0, 8, 2], weights := [1, 0, 0, 1] }

def points18 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 719, representative 9219.
def source19 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B019.Data.entryAt ⟨36, by decide +kernel⟩

def target19 : Weights.Entry :=
  { word := [0, 4, 12, 4, 0, 8, 4], weights := [1, 0, 0, 1] }

def points19 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6), (7, 8), (8, 7)]

-- Period 9, original row 726, representative 9232.
def source20 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B019.Data.entryAt ⟨49, by decide +kernel⟩

def target20 : Weights.Entry :=
  { word := [0, 4, 12, 4, 8, 0, 4], weights := [1, 0, 0, 1] }

-- Period 9, original row 732, representative 9199.
def source21 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B019.Data.entryAt ⟨16, by decide +kernel⟩

def target21 : Weights.Entry :=
  { word := [0, 4, 12, 4, 8, 8, 2], weights := [1, 0, 1, 0] }

-- Period 9, original row 733, representative 9205.
def source22 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B019.Data.entryAt ⟨22, by decide +kernel⟩

def target22 : Weights.Entry :=
  { word := [0, 4, 12, 4, 8, 8, 4], weights := [1, 0, 0, 1] }

-- Period 9, original row 815, representative 9237.
def source23 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B019.Data.entryAt ⟨54, by decide +kernel⟩

def target23 : Weights.Entry :=
  { word := [0, 8, 0, 4, 2, 0, 4], weights := [1, 0, 0, 1] }

-- Period 9, original row 821, representative 9191.
def source24 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B019.Data.entryAt ⟨8, by decide +kernel⟩

def target24 : Weights.Entry :=
  { word := [0, 8, 0, 4, 2, 8, 4], weights := [1, 0, 0, 1] }

-- Period 9, original row 841, representative 9230.
def source25 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B019.Data.entryAt ⟨47, by decide +kernel⟩

def target25 : Weights.Entry :=
  { word := [0, 8, 0, 4, 10, 0, 4], weights := [1, 0, 0, 1] }

-- Period 9, original row 847, representative 9183.
def source26 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B019.Data.entryAt ⟨0, by decide +kernel⟩

def target26 : Weights.Entry :=
  { word := [0, 8, 0, 4, 10, 8, 4], weights := [1, 0, 0, 1] }

-- Period 9, original row 894, representative 9225.
def source27 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B019.Data.entryAt ⟨42, by decide +kernel⟩

def target27 : Weights.Entry :=
  { word := [0, 8, 1, 4, 2, 0, 4], weights := [1, 0, 0, 1] }

-- Period 9, original row 900, representative 9188.
def source28 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B019.Data.entryAt ⟨5, by decide +kernel⟩

def target28 : Weights.Entry :=
  { word := [0, 8, 1, 4, 2, 8, 4], weights := [1, 0, 0, 1] }

-- Period 9, original row 916, representative 9223.
def source29 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B019.Data.entryAt ⟨40, by decide +kernel⟩

def target29 : Weights.Entry :=
  { word := [0, 8, 1, 4, 10, 0, 4], weights := [1, 0, 0, 1] }

-- Period 9, original row 940, representative 9233.
def source30 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B019.Data.entryAt ⟨50, by decide +kernel⟩

def target30 : Weights.Entry :=
  { word := [0, 8, 2, 2, 2, 0, 4], weights := [1, 0, 0, 1] }

-- Period 9, original row 948, representative 9184.
def source31 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B019.Data.entryAt ⟨1, by decide +kernel⟩

def target31 : Weights.Entry :=
  { word := [0, 8, 2, 2, 2, 8, 4], weights := [1, 0, 0, 1] }

-- Period 9, original row 955, representative 9227.
def source32 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B019.Data.entryAt ⟨44, by decide +kernel⟩

def target32 : Weights.Entry :=
  { word := [0, 8, 2, 2, 10, 0, 4], weights := [1, 0, 0, 1] }

-- Period 9, original row 970, representative 9234.
def source33 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B019.Data.entryAt ⟨51, by decide +kernel⟩

def target33 : Weights.Entry :=
  { word := [0, 8, 2, 10, 2, 0, 4], weights := [1, 1, 0, 0] }

-- Period 9, original row 977, representative 9187.
def source34 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B019.Data.entryAt ⟨4, by decide +kernel⟩

def target34 : Weights.Entry :=
  { word := [0, 8, 2, 10, 2, 8, 4], weights := [1, 0, 0, 1] }

-- Period 9, original row 984, representative 9228.
def source35 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B019.Data.entryAt ⟨45, by decide +kernel⟩

def target35 : Weights.Entry :=
  { word := [0, 8, 2, 10, 10, 0, 4], weights := [1, 1, 0, 0] }

-- Period 9, original row 1014, representative 9206.
def source36 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B019.Data.entryAt ⟨23, by decide +kernel⟩

def target36 : Weights.Entry :=
  { word := [0, 8, 6, 2, 0, 8, 2], weights := [1, 0, 0, 1] }

-- Period 9, original row 1015, representative 9206.
def source37 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B019.Data.entryAt ⟨23, by decide +kernel⟩

def target37 : Weights.Entry :=
  { word := [0, 8, 6, 2, 0, 8, 4], weights := [1, 0, 0, 1] }

def points37 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 8), (8, 7)]

-- Period 9, original row 1022, representative 9194.
def source38 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B019.Data.entryAt ⟨11, by decide +kernel⟩

def target38 : Weights.Entry :=
  { word := [0, 8, 6, 2, 8, 8, 2], weights := [0, 1, 0, 0] }

-- Period 9, original row 1023, representative 9200.
def source39 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B019.Data.entryAt ⟨17, by decide +kernel⟩

def target39 : Weights.Entry :=
  { word := [0, 8, 6, 2, 8, 8, 4], weights := [1, 0, 0, 1] }

-- Period 9, original row 1029, representative 9207.
def source40 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B019.Data.entryAt ⟨24, by decide +kernel⟩

def target40 : Weights.Entry :=
  { word := [0, 8, 6, 10, 0, 8, 2], weights := [1, 0, 0, 1] }

-- Period 9, original row 1030, representative 9207.
def source41 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B019.Data.entryAt ⟨24, by decide +kernel⟩

def target41 : Weights.Entry :=
  { word := [0, 8, 6, 10, 0, 8, 4], weights := [1, 0, 0, 1] }

def points41 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 8), (8, 7)]

-- Period 9, original row 1036, representative 9195.
def source42 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B019.Data.entryAt ⟨12, by decide +kernel⟩

def target42 : Weights.Entry :=
  { word := [0, 8, 6, 10, 8, 8, 2], weights := [0, 1, 0, 0] }

-- Period 9, original row 1037, representative 9201.
def source43 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B019.Data.entryAt ⟨18, by decide +kernel⟩

def target43 : Weights.Entry :=
  { word := [0, 8, 6, 10, 8, 8, 4], weights := [0, 1, 0, 0] }

-- Period 9, original row 1083, representative 9185.
def source44 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B019.Data.entryAt ⟨2, by decide +kernel⟩

def target44 : Weights.Entry :=
  { word := [0, 8, 10, 2, 2, 8, 4], weights := [1, 0, 0, 1] }

-- Period 9, original row 1098, representative 9186.
def source45 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B019.Data.entryAt ⟨3, by decide +kernel⟩

def target45 : Weights.Entry :=
  { word := [0, 8, 10, 10, 2, 8, 4], weights := [1, 0, 0, 1] }

-- Period 9, original row 1507, representative 9225.
def source46 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B019.Data.entryAt ⟨42, by decide +kernel⟩

def target46 : Weights.Entry :=
  { word := [0, 12, 0, 4, 2, 0, 4], weights := [1, 0, 0, 1] }

def points46 : List (ℕ × ℕ) := [(0, 0), (1, 2), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 1513, representative 9188.
def source47 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B019.Data.entryAt ⟨5, by decide +kernel⟩

def target47 : Weights.Entry :=
  { word := [0, 12, 0, 4, 2, 8, 4], weights := [1, 0, 0, 1] }

def points47 : List (ℕ × ℕ) := [(0, 0), (1, 2), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 1529, representative 9223.
def source48 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B019.Data.entryAt ⟨40, by decide +kernel⟩

def target48 : Weights.Entry :=
  { word := [0, 12, 0, 4, 10, 0, 4], weights := [1, 0, 0, 1] }

def points48 : List (ℕ × ℕ) := [(0, 0), (1, 2), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 1559, representative 9217.
def source49 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B019.Data.entryAt ⟨34, by decide +kernel⟩

def target49 : Weights.Entry :=
  { word := [0, 12, 2, 0, 1, 8, 2], weights := [0, 1, 0, 1] }

-- Period 9, original row 1560, representative 9217.
def source50 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B019.Data.entryAt ⟨34, by decide +kernel⟩

def target50 : Weights.Entry :=
  { word := [0, 12, 2, 0, 1, 8, 4], weights := [0, 1, 0, 1] }

def points50 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 8), (8, 7)]

-- Period 9, original row 1567, representative 9222.
def source51 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B019.Data.entryAt ⟨39, by decide +kernel⟩

def target51 : Weights.Entry :=
  { word := [0, 12, 2, 0, 9, 0, 4], weights := [0, 1, 0, 1] }

-- Period 9, original row 1573, representative 9209.
def source52 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B019.Data.entryAt ⟨26, by decide +kernel⟩

def target52 : Weights.Entry :=
  { word := [0, 12, 2, 0, 9, 8, 2], weights := [0, 1, 0, 1] }

-- Period 9, original row 1574, representative 9213.
def source53 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B019.Data.entryAt ⟨30, by decide +kernel⟩

def target53 : Weights.Entry :=
  { word := [0, 12, 2, 0, 9, 8, 4], weights := [0, 1, 0, 1] }

-- Period 9, original row 1609, representative 9217.
def source54 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B019.Data.entryAt ⟨34, by decide +kernel⟩

def target54 : Weights.Entry :=
  { word := [0, 12, 4, 4, 0, 8, 2], weights := [1, 0, 0, 1] }

def points54 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 1610, representative 9217.
def source55 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B019.Data.entryAt ⟨34, by decide +kernel⟩

def target55 : Weights.Entry :=
  { word := [0, 12, 4, 4, 0, 8, 4], weights := [1, 0, 0, 1] }

def points55 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6), (7, 8), (8, 7)]

-- Period 9, original row 1617, representative 9220.
def source56 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B019.Data.entryAt ⟨37, by decide +kernel⟩

def target56 : Weights.Entry :=
  { word := [0, 12, 4, 4, 8, 0, 4], weights := [1, 0, 0, 1] }

-- Period 9, original row 1623, representative 9197.
def source57 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B019.Data.entryAt ⟨14, by decide +kernel⟩

def target57 : Weights.Entry :=
  { word := [0, 12, 4, 4, 8, 8, 2], weights := [1, 0, 1, 0] }

-- Period 9, original row 1624, representative 9203.
def source58 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B019.Data.entryAt ⟨20, by decide +kernel⟩

def target58 : Weights.Entry :=
  { word := [0, 12, 4, 4, 8, 8, 4], weights := [1, 0, 0, 1] }

-- Period 9, original row 1630, representative 9192.
def source59 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B019.Data.entryAt ⟨9, by decide +kernel⟩

def target59 : Weights.Entry :=
  { word := [0, 12, 6, 8, 8, 8, 2], weights := [0, 1, 1, 0] }

-- Period 9, original row 1636, representative 9226.
def source60 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B019.Data.entryAt ⟨43, by decide +kernel⟩

def target60 : Weights.Entry :=
  { word := [0, 12, 8, 4, 2, 0, 4], weights := [1, 0, 0, 1] }

-- Period 9, original row 1642, representative 9189.
def source61 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B019.Data.entryAt ⟨6, by decide +kernel⟩

def target61 : Weights.Entry :=
  { word := [0, 12, 8, 4, 2, 8, 4], weights := [1, 0, 0, 1] }

-- Period 9, original row 1662, representative 9224.
def source62 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B019.Data.entryAt ⟨41, by decide +kernel⟩

def target62 : Weights.Entry :=
  { word := [0, 12, 8, 4, 10, 0, 4], weights := [1, 0, 0, 1] }

-- Period 9, original row 1691, representative 9218.
def source63 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B019.Data.entryAt ⟨35, by decide +kernel⟩

def target63 : Weights.Entry :=
  { word := [0, 12, 10, 0, 1, 8, 2], weights := [0, 1, 0, 1] }

-- Period 9, original row 1692, representative 9218.
def source64 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B019.Data.entryAt ⟨35, by decide +kernel⟩

def target64 : Weights.Entry :=
  { word := [0, 12, 10, 0, 1, 8, 4], weights := [0, 1, 0, 1] }

def points64 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 8), (8, 7)]

-- Period 9, original row 1698, representative 9210.
def source65 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B019.Data.entryAt ⟨27, by decide +kernel⟩

def target65 : Weights.Entry :=
  { word := [0, 12, 10, 0, 9, 8, 2], weights := [0, 1, 0, 1] }

-- Period 9, original row 1699, representative 9214.
def source66 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B019.Data.entryAt ⟨31, by decide +kernel⟩

def target66 : Weights.Entry :=
  { word := [0, 12, 10, 0, 9, 8, 4], weights := [0, 1, 0, 1] }

-- Period 9, original row 1717, representative 9218.
def source67 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B019.Data.entryAt ⟨35, by decide +kernel⟩

def target67 : Weights.Entry :=
  { word := [0, 12, 12, 4, 0, 8, 2], weights := [1, 0, 0, 1] }

def points67 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 1718, representative 9218.
def source68 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B019.Data.entryAt ⟨35, by decide +kernel⟩

def target68 : Weights.Entry :=
  { word := [0, 12, 12, 4, 0, 8, 4], weights := [1, 0, 0, 1] }

def points68 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6), (7, 8), (8, 7)]

-- Period 9, original row 1725, representative 9221.
def source69 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B019.Data.entryAt ⟨38, by decide +kernel⟩

def target69 : Weights.Entry :=
  { word := [0, 12, 12, 4, 8, 0, 4], weights := [1, 0, 0, 1] }

-- Period 9, original row 1731, representative 9198.
def source70 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B019.Data.entryAt ⟨15, by decide +kernel⟩

def target70 : Weights.Entry :=
  { word := [0, 12, 12, 4, 8, 8, 2], weights := [1, 0, 1, 0] }

-- Period 9, original row 1732, representative 9204.
def source71 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B019.Data.entryAt ⟨21, by decide +kernel⟩

def target71 : Weights.Entry :=
  { word := [0, 12, 12, 4, 8, 8, 4], weights := [1, 0, 0, 1] }

-- Period 9, original row 1849, representative 9216.
def source72 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B019.Data.entryAt ⟨33, by decide +kernel⟩

def target72 : Weights.Entry :=
  { word := [1, 4, 2, 0, 1, 8, 2], weights := [0, 1, 0, 1] }

def points72 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 1850, representative 9216.
def source73 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B019.Data.entryAt ⟨33, by decide +kernel⟩

def target73 : Weights.Entry :=
  { word := [1, 4, 2, 0, 1, 8, 4], weights := [0, 1, 0, 1] }

def points73 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 8), (8, 7)]

-- Period 9, original row 1857, representative 9235.
def source74 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B019.Data.entryAt ⟨52, by decide +kernel⟩

def target74 : Weights.Entry :=
  { word := [1, 4, 2, 0, 9, 0, 4], weights := [0, 1, 0, 1] }

def points74 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 1863, representative 9208.
def source75 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B019.Data.entryAt ⟨25, by decide +kernel⟩

def target75 : Weights.Entry :=
  { word := [1, 4, 2, 0, 9, 8, 2], weights := [0, 1, 0, 1] }

def points75 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 1864, representative 9212.
def source76 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B019.Data.entryAt ⟨29, by decide +kernel⟩

def target76 : Weights.Entry :=
  { word := [1, 4, 2, 0, 9, 8, 4], weights := [0, 1, 0, 1] }

def points76 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 1899, representative 9216.
def source77 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B019.Data.entryAt ⟨33, by decide +kernel⟩

def target77 : Weights.Entry :=
  { word := [1, 4, 4, 4, 0, 8, 2], weights := [1, 0, 0, 1] }

def points77 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 1900, representative 9216.
def source78 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B019.Data.entryAt ⟨33, by decide +kernel⟩

def target78 : Weights.Entry :=
  { word := [1, 4, 4, 4, 0, 8, 4], weights := [1, 0, 0, 1] }

def points78 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6), (7, 8), (8, 7)]

-- Period 9, original row 1907, representative 9231.
def source79 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B019.Data.entryAt ⟨48, by decide +kernel⟩

def target79 : Weights.Entry :=
  { word := [1, 4, 4, 4, 8, 0, 4], weights := [1, 0, 0, 1] }

def points79 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 1913, representative 9196.
def source80 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B019.Data.entryAt ⟨13, by decide +kernel⟩

def target80 : Weights.Entry :=
  { word := [1, 4, 4, 4, 8, 8, 2], weights := [1, 0, 1, 0] }

def points80 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 1914, representative 9202.
def source81 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B019.Data.entryAt ⟨19, by decide +kernel⟩

def target81 : Weights.Entry :=
  { word := [1, 4, 4, 4, 8, 8, 4], weights := [1, 0, 0, 1] }

def points81 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 1921, representative 9236.
def source82 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B019.Data.entryAt ⟨53, by decide +kernel⟩

def target82 : Weights.Entry :=
  { word := [1, 4, 8, 4, 2, 0, 4], weights := [1, 0, 0, 1] }

def points82 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 1927, representative 9190.
def source83 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B019.Data.entryAt ⟨7, by decide +kernel⟩

def target83 : Weights.Entry :=
  { word := [1, 4, 8, 4, 2, 8, 4], weights := [1, 0, 0, 1] }

def points83 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 1947, representative 9229.
def source84 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B019.Data.entryAt ⟨46, by decide +kernel⟩

def target84 : Weights.Entry :=
  { word := [1, 4, 8, 4, 10, 0, 4], weights := [1, 0, 0, 1] }

def points84 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 1976, representative 9219.
def source85 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B019.Data.entryAt ⟨36, by decide +kernel⟩

def target85 : Weights.Entry :=
  { word := [1, 4, 10, 0, 1, 8, 2], weights := [0, 1, 0, 1] }

def points85 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 1977, representative 9219.
def source86 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B019.Data.entryAt ⟨36, by decide +kernel⟩

def target86 : Weights.Entry :=
  { word := [1, 4, 10, 0, 1, 8, 4], weights := [0, 1, 0, 1] }

def points86 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 8), (8, 7)]

-- Period 9, original row 1983, representative 9211.
def source87 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B019.Data.entryAt ⟨28, by decide +kernel⟩

def target87 : Weights.Entry :=
  { word := [1, 4, 10, 0, 9, 8, 2], weights := [0, 1, 0, 1] }

def points87 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 1984, representative 9215.
def source88 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B019.Data.entryAt ⟨32, by decide +kernel⟩

def target88 : Weights.Entry :=
  { word := [1, 4, 10, 0, 9, 8, 4], weights := [0, 1, 0, 1] }

def points88 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 2002, representative 9219.
def source89 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B019.Data.entryAt ⟨36, by decide +kernel⟩

def target89 : Weights.Entry :=
  { word := [1, 4, 12, 4, 0, 8, 2], weights := [1, 0, 0, 1] }

def points89 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 2003, representative 9219.
def source90 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B019.Data.entryAt ⟨36, by decide +kernel⟩

def target90 : Weights.Entry :=
  { word := [1, 4, 12, 4, 0, 8, 4], weights := [1, 0, 0, 1] }

def points90 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6), (7, 8), (8, 7)]

-- Period 9, original row 2010, representative 9232.
def source91 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B019.Data.entryAt ⟨49, by decide +kernel⟩

def target91 : Weights.Entry :=
  { word := [1, 4, 12, 4, 8, 0, 4], weights := [1, 0, 0, 1] }

def points91 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 2016, representative 9199.
def source92 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B019.Data.entryAt ⟨16, by decide +kernel⟩

def target92 : Weights.Entry :=
  { word := [1, 4, 12, 4, 8, 8, 2], weights := [1, 0, 1, 0] }

def points92 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 2017, representative 9205.
def source93 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B019.Data.entryAt ⟨22, by decide +kernel⟩

def target93 : Weights.Entry :=
  { word := [1, 4, 12, 4, 8, 8, 4], weights := [1, 0, 0, 1] }

def points93 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 2024, representative 9225.
def source94 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B019.Data.entryAt ⟨42, by decide +kernel⟩

def target94 : Weights.Entry :=
  { word := [1, 8, 1, 4, 2, 0, 4], weights := [1, 0, 0, 1] }

def points94 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 2030, representative 9188.
def source95 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B019.Data.entryAt ⟨5, by decide +kernel⟩

def target95 : Weights.Entry :=
  { word := [1, 8, 1, 4, 2, 8, 4], weights := [1, 0, 0, 1] }

def points95 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 2046, representative 9223.
def source96 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B019.Data.entryAt ⟨40, by decide +kernel⟩

def target96 : Weights.Entry :=
  { word := [1, 8, 1, 4, 10, 0, 4], weights := [1, 0, 0, 1] }

def points96 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 2070, representative 9233.
def source97 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B019.Data.entryAt ⟨50, by decide +kernel⟩

def target97 : Weights.Entry :=
  { word := [1, 8, 2, 2, 2, 0, 4], weights := [1, 0, 0, 1] }

def points97 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 2078, representative 9184.
def source98 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B019.Data.entryAt ⟨1, by decide +kernel⟩

def target98 : Weights.Entry :=
  { word := [1, 8, 2, 2, 2, 8, 4], weights := [1, 0, 0, 1] }

def points98 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 2085, representative 9227.
def source99 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B019.Data.entryAt ⟨44, by decide +kernel⟩

def target99 : Weights.Entry :=
  { word := [1, 8, 2, 2, 10, 0, 4], weights := [1, 0, 0, 1] }

def points99 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 2100, representative 9234.
def source100 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B019.Data.entryAt ⟨51, by decide +kernel⟩

def target100 : Weights.Entry :=
  { word := [1, 8, 2, 10, 2, 0, 4], weights := [1, 1, 0, 0] }

def points100 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 2107, representative 9187.
def source101 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B019.Data.entryAt ⟨4, by decide +kernel⟩

def target101 : Weights.Entry :=
  { word := [1, 8, 2, 10, 2, 8, 4], weights := [1, 0, 0, 1] }

def points101 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 2114, representative 9228.
def source102 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B019.Data.entryAt ⟨45, by decide +kernel⟩

def target102 : Weights.Entry :=
  { word := [1, 8, 2, 10, 10, 0, 4], weights := [1, 1, 0, 0] }

def points102 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 2165, representative 9185.
def source103 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B019.Data.entryAt ⟨2, by decide +kernel⟩

def target103 : Weights.Entry :=
  { word := [1, 8, 10, 2, 2, 8, 4], weights := [1, 0, 0, 1] }

def points103 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 2180, representative 9186.
def source104 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B019.Data.entryAt ⟨3, by decide +kernel⟩

def target104 : Weights.Entry :=
  { word := [1, 8, 10, 10, 2, 8, 4], weights := [1, 0, 0, 1] }

def points104 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 2208, representative 9217.
def source105 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B019.Data.entryAt ⟨34, by decide +kernel⟩

def target105 : Weights.Entry :=
  { word := [1, 12, 2, 0, 1, 8, 2], weights := [0, 1, 0, 1] }

def points105 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 2209, representative 9217.
def source106 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B019.Data.entryAt ⟨34, by decide +kernel⟩

def target106 : Weights.Entry :=
  { word := [1, 12, 2, 0, 1, 8, 4], weights := [0, 1, 0, 1] }

def points106 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 8), (8, 7)]

-- Period 9, original row 2216, representative 9222.
def source107 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B019.Data.entryAt ⟨39, by decide +kernel⟩

def target107 : Weights.Entry :=
  { word := [1, 12, 2, 0, 9, 0, 4], weights := [0, 1, 0, 1] }

def points107 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 2222, representative 9209.
def source108 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B019.Data.entryAt ⟨26, by decide +kernel⟩

def target108 : Weights.Entry :=
  { word := [1, 12, 2, 0, 9, 8, 2], weights := [0, 1, 0, 1] }

def points108 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 2223, representative 9213.
def source109 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B019.Data.entryAt ⟨30, by decide +kernel⟩

def target109 : Weights.Entry :=
  { word := [1, 12, 2, 0, 9, 8, 4], weights := [0, 1, 0, 1] }

def points109 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 2258, representative 9217.
def source110 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B019.Data.entryAt ⟨34, by decide +kernel⟩

def target110 : Weights.Entry :=
  { word := [1, 12, 4, 4, 0, 8, 2], weights := [1, 0, 0, 1] }

def points110 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 2259, representative 9217.
def source111 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B019.Data.entryAt ⟨34, by decide +kernel⟩

def target111 : Weights.Entry :=
  { word := [1, 12, 4, 4, 0, 8, 4], weights := [1, 0, 0, 1] }

def points111 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6), (7, 8), (8, 7)]

-- Period 9, original row 2266, representative 9220.
def source112 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B019.Data.entryAt ⟨37, by decide +kernel⟩

def target112 : Weights.Entry :=
  { word := [1, 12, 4, 4, 8, 0, 4], weights := [1, 0, 0, 1] }

def points112 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 2272, representative 9197.
def source113 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B019.Data.entryAt ⟨14, by decide +kernel⟩

def target113 : Weights.Entry :=
  { word := [1, 12, 4, 4, 8, 8, 2], weights := [1, 0, 1, 0] }

def points113 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 2273, representative 9203.
def source114 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B019.Data.entryAt ⟨20, by decide +kernel⟩

def target114 : Weights.Entry :=
  { word := [1, 12, 4, 4, 8, 8, 4], weights := [1, 0, 0, 1] }

def points114 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 2280, representative 9226.
def source115 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B019.Data.entryAt ⟨43, by decide +kernel⟩

def target115 : Weights.Entry :=
  { word := [1, 12, 8, 4, 2, 0, 4], weights := [1, 0, 0, 1] }

def points115 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 2286, representative 9189.
def source116 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B019.Data.entryAt ⟨6, by decide +kernel⟩

def target116 : Weights.Entry :=
  { word := [1, 12, 8, 4, 2, 8, 4], weights := [1, 0, 0, 1] }

def points116 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 2306, representative 9224.
def source117 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B019.Data.entryAt ⟨41, by decide +kernel⟩

def target117 : Weights.Entry :=
  { word := [1, 12, 8, 4, 10, 0, 4], weights := [1, 0, 0, 1] }

def points117 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 2335, representative 9218.
def source118 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B019.Data.entryAt ⟨35, by decide +kernel⟩

def target118 : Weights.Entry :=
  { word := [1, 12, 10, 0, 1, 8, 2], weights := [0, 1, 0, 1] }

def points118 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 2336, representative 9218.
def source119 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B019.Data.entryAt ⟨35, by decide +kernel⟩

def target119 : Weights.Entry :=
  { word := [1, 12, 10, 0, 1, 8, 4], weights := [0, 1, 0, 1] }

def points119 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 8), (8, 7)]

-- Period 9, original row 2342, representative 9210.
def source120 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B019.Data.entryAt ⟨27, by decide +kernel⟩

def target120 : Weights.Entry :=
  { word := [1, 12, 10, 0, 9, 8, 2], weights := [0, 1, 0, 1] }

def points120 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 2343, representative 9214.
def source121 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B019.Data.entryAt ⟨31, by decide +kernel⟩

def target121 : Weights.Entry :=
  { word := [1, 12, 10, 0, 9, 8, 4], weights := [0, 1, 0, 1] }

def points121 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 2361, representative 9218.
def source122 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B019.Data.entryAt ⟨35, by decide +kernel⟩

def target122 : Weights.Entry :=
  { word := [1, 12, 12, 4, 0, 8, 2], weights := [1, 0, 0, 1] }

def points122 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 2362, representative 9218.
def source123 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B019.Data.entryAt ⟨35, by decide +kernel⟩

def target123 : Weights.Entry :=
  { word := [1, 12, 12, 4, 0, 8, 4], weights := [1, 0, 0, 1] }

def points123 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6), (7, 8), (8, 7)]

-- Period 9, original row 2369, representative 9221.
def source124 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B019.Data.entryAt ⟨38, by decide +kernel⟩

def target124 : Weights.Entry :=
  { word := [1, 12, 12, 4, 8, 0, 4], weights := [1, 0, 0, 1] }

def points124 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 2375, representative 9198.
def source125 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B019.Data.entryAt ⟨15, by decide +kernel⟩

def target125 : Weights.Entry :=
  { word := [1, 12, 12, 4, 8, 8, 2], weights := [1, 0, 1, 0] }

def points125 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 2376, representative 9204.
def source126 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B019.Data.entryAt ⟨21, by decide +kernel⟩

def target126 : Weights.Entry :=
  { word := [1, 12, 12, 4, 8, 8, 4], weights := [1, 0, 0, 1] }

def points126 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 2409, representative 9237.
def source127 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B019.Data.entryAt ⟨54, by decide +kernel⟩

def target127 : Weights.Entry :=
  { word := [2, 0, 4, 2, 0, 8, 0], weights := [1, 0, 0, 1] }

def points127 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

def period9Entries : List Weights.Entry := [target0, target1, target2, target3, target4, target5, target6, target7, target8, target9, target10, target11, target12, target13, target14, target15, target16, target17, target18, target19, target20, target21, target22, target23, target24, target25, target26, target27, target28, target29, target30, target31, target32, target33, target34, target35, target36, target37, target38, target39, target40, target41, target42, target43, target44, target45, target46, target47, target48, target49, target50, target51, target52, target53, target54, target55, target56, target57, target58, target59, target60, target61, target62, target63, target64, target65, target66, target67, target68, target69, target70, target71, target72, target73, target74, target75, target76, target77, target78, target79, target80, target81, target82, target83, target84, target85, target86, target87, target88, target89, target90, target91, target92, target93, target94, target95, target96, target97, target98, target99, target100, target101, target102, target103, target104, target105, target106, target107, target108, target109, target110, target111, target112, target113, target114, target115, target116, target117, target118, target119, target120, target121, target122, target123, target124, target125, target126, target127]

def period9Chunk : RowCoverage.Chunk where
  rows := [⟨560, target0⟩, ⟨561, target1⟩, ⟨568, target2⟩, ⟨574, target3⟩, ⟨575, target4⟩, ⟨610, target5⟩, ⟨611, target6⟩, ⟨618, target7⟩, ⟨624, target8⟩, ⟨625, target9⟩, ⟨631, target10⟩, ⟨637, target11⟩, ⟨643, target12⟩, ⟨663, target13⟩, ⟨692, target14⟩, ⟨693, target15⟩, ⟨699, target16⟩, ⟨700, target17⟩, ⟨718, target18⟩, ⟨719, target19⟩, ⟨726, target20⟩, ⟨732, target21⟩, ⟨733, target22⟩, ⟨815, target23⟩, ⟨821, target24⟩, ⟨841, target25⟩, ⟨847, target26⟩, ⟨894, target27⟩, ⟨900, target28⟩, ⟨916, target29⟩, ⟨940, target30⟩, ⟨948, target31⟩, ⟨955, target32⟩, ⟨970, target33⟩, ⟨977, target34⟩, ⟨984, target35⟩, ⟨1014, target36⟩, ⟨1015, target37⟩, ⟨1022, target38⟩, ⟨1023, target39⟩, ⟨1029, target40⟩, ⟨1030, target41⟩, ⟨1036, target42⟩, ⟨1037, target43⟩, ⟨1083, target44⟩, ⟨1098, target45⟩, ⟨1507, target46⟩, ⟨1513, target47⟩, ⟨1529, target48⟩, ⟨1559, target49⟩, ⟨1560, target50⟩, ⟨1567, target51⟩, ⟨1573, target52⟩, ⟨1574, target53⟩, ⟨1609, target54⟩, ⟨1610, target55⟩, ⟨1617, target56⟩, ⟨1623, target57⟩, ⟨1624, target58⟩, ⟨1630, target59⟩, ⟨1636, target60⟩, ⟨1642, target61⟩, ⟨1662, target62⟩, ⟨1691, target63⟩, ⟨1692, target64⟩, ⟨1698, target65⟩, ⟨1699, target66⟩, ⟨1717, target67⟩, ⟨1718, target68⟩, ⟨1725, target69⟩, ⟨1731, target70⟩, ⟨1732, target71⟩, ⟨1849, target72⟩, ⟨1850, target73⟩, ⟨1857, target74⟩, ⟨1863, target75⟩, ⟨1864, target76⟩, ⟨1899, target77⟩, ⟨1900, target78⟩, ⟨1907, target79⟩, ⟨1913, target80⟩, ⟨1914, target81⟩, ⟨1921, target82⟩, ⟨1927, target83⟩, ⟨1947, target84⟩, ⟨1976, target85⟩, ⟨1977, target86⟩, ⟨1983, target87⟩, ⟨1984, target88⟩, ⟨2002, target89⟩, ⟨2003, target90⟩, ⟨2010, target91⟩, ⟨2016, target92⟩, ⟨2017, target93⟩, ⟨2024, target94⟩, ⟨2030, target95⟩, ⟨2046, target96⟩, ⟨2070, target97⟩, ⟨2078, target98⟩, ⟨2085, target99⟩, ⟨2100, target100⟩, ⟨2107, target101⟩, ⟨2114, target102⟩, ⟨2165, target103⟩, ⟨2180, target104⟩, ⟨2208, target105⟩, ⟨2209, target106⟩, ⟨2216, target107⟩, ⟨2222, target108⟩, ⟨2223, target109⟩, ⟨2258, target110⟩, ⟨2259, target111⟩, ⟨2266, target112⟩, ⟨2272, target113⟩, ⟨2273, target114⟩, ⟨2280, target115⟩, ⟨2286, target116⟩, ⟨2306, target117⟩, ⟨2335, target118⟩, ⟨2336, target119⟩, ⟨2342, target120⟩, ⟨2343, target121⟩, ⟨2361, target122⟩, ⟨2362, target123⟩, ⟨2369, target124⟩, ⟨2375, target125⟩, ⟨2376, target126⟩, ⟨2409, target127⟩]
  indexMask := 151795729839115503052389302149363714633462074023065449487982696320778628783047917257325299700854877890106331741445862727035235784566653573862413011383703730858976051122016565070738753233210893751489951643826466737463942441783618640002912067298381528117485230397950770182033163238336171907744872161341596605081845084652280771839607214962302142474833029265492580544711079971806122398611013572063946326147572298818698421311548906374777174046565780279350108947666948760617466445044592120588196348914219453781421439878914897498771124727231331955291273309632420235073256943400068082448086886948397114860296188744748043294154593030078675022855495156583273611458792942160049180960848551470336940823891012401797487917819125855835652096
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

end FranklSmallCyclic.TransportBatches.G072.B000.Data
