module

public import Conjectures.FranklSmallCyclicRowCoverage
public import Conjectures.FranklSmallCyclicCanonicalWords
public import Conjectures.FranklSmallCyclicOrbit9Block002Data

/-! 128 literal targets sharing one source proof block.
Original words and row indices are retained; weights may be transported.
-/
@[expose] public section

namespace FranklSmallCyclic.TransportBatches.G055.B000.Data

-- Period 9, original row 131, representative 7129.
def source0 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨125, by decide +kernel⟩

def target0 : Weights.Entry :=
  { word := [0, 1, 0, 9, 12, 4, 12], weights := [1, 0, 1, 1] }

-- Period 9, original row 139, representative 7083.
def source1 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨79, by decide +kernel⟩

def target1 : Weights.Entry :=
  { word := [0, 1, 0, 12, 0, 4, 10], weights := [1, 0, 1, 0] }

-- Period 9, original row 140, representative 7083.
def source2 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨79, by decide +kernel⟩

def target2 : Weights.Entry :=
  { word := [0, 1, 0, 12, 0, 4, 12], weights := [1, 0, 1, 0] }

def points2 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 8), (8, 7)]

-- Period 9, original row 222, representative 7128.
def source3 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨124, by decide +kernel⟩

def target3 : Weights.Entry :=
  { word := [0, 1, 8, 9, 12, 4, 12], weights := [1, 0, 1, 1] }

-- Period 9, original row 298, representative 7083.
def source4 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨79, by decide +kernel⟩

def target4 : Weights.Entry :=
  { word := [0, 2, 0, 8, 1, 4, 10], weights := [0, 1, 1, 0] }

def points4 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 299, representative 7083.
def source5 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨79, by decide +kernel⟩

def target5 : Weights.Entry :=
  { word := [0, 2, 0, 8, 1, 4, 12], weights := [0, 1, 1, 0] }

def points5 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6), (7, 8), (8, 7)]

-- Period 9, original row 304, representative 7071.
def source6 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨67, by decide +kernel⟩

def target6 : Weights.Entry :=
  { word := [0, 2, 0, 8, 4, 4, 12], weights := [0, 1, 0, 1] }

-- Period 9, original row 307, representative 7125.
def source7 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨121, by decide +kernel⟩

def target7 : Weights.Entry :=
  { word := [0, 2, 0, 8, 8, 4, 12], weights := [0, 1, 0, 1] }

-- Period 9, original row 311, representative 7075.
def source8 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨71, by decide +kernel⟩

def target8 : Weights.Entry :=
  { word := [0, 2, 0, 8, 9, 4, 12], weights := [0, 1, 1, 0] }

-- Period 9, original row 315, representative 7067.
def source9 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨63, by decide +kernel⟩

def target9 : Weights.Entry :=
  { word := [0, 2, 0, 8, 12, 4, 12], weights := [0, 1, 0, 1] }

-- Period 9, original row 346, representative 7095.
def source10 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨91, by decide +kernel⟩

def target10 : Weights.Entry :=
  { word := [0, 2, 2, 2, 8, 4, 10], weights := [0, 1, 0, 1] }

-- Period 9, original row 347, representative 7117.
def source11 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨113, by decide +kernel⟩

def target11 : Weights.Entry :=
  { word := [0, 2, 2, 2, 8, 4, 12], weights := [0, 1, 0, 1] }

-- Period 9, original row 395, representative 7098.
def source12 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨94, by decide +kernel⟩

def target12 : Weights.Entry :=
  { word := [0, 2, 2, 10, 8, 4, 10], weights := [0, 1, 1, 0] }

-- Period 9, original row 396, representative 7120.
def source13 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨116, by decide +kernel⟩

def target13 : Weights.Entry :=
  { word := [0, 2, 2, 10, 8, 4, 12], weights := [0, 1, 0, 1] }

-- Period 9, original row 412, representative 7070.
def source14 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨66, by decide +kernel⟩

def target14 : Weights.Entry :=
  { word := [0, 2, 8, 8, 4, 4, 12], weights := [0, 1, 0, 1] }

-- Period 9, original row 417, representative 7066.
def source15 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨62, by decide +kernel⟩

def target15 : Weights.Entry :=
  { word := [0, 2, 8, 8, 12, 4, 12], weights := [0, 1, 0, 1] }

-- Period 9, original row 444, representative 7096.
def source16 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨92, by decide +kernel⟩

def target16 : Weights.Entry :=
  { word := [0, 2, 10, 2, 8, 4, 10], weights := [0, 1, 0, 1] }

-- Period 9, original row 445, representative 7118.
def source17 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨114, by decide +kernel⟩

def target17 : Weights.Entry :=
  { word := [0, 2, 10, 2, 8, 4, 12], weights := [0, 1, 0, 1] }

-- Period 9, original row 490, representative 7097.
def source18 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨93, by decide +kernel⟩

def target18 : Weights.Entry :=
  { word := [0, 2, 10, 10, 8, 4, 10], weights := [0, 1, 1, 0] }

-- Period 9, original row 491, representative 7119.
def source19 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨115, by decide +kernel⟩

def target19 : Weights.Entry :=
  { word := [0, 2, 10, 10, 8, 4, 12], weights := [0, 1, 0, 1] }

-- Period 9, original row 741, representative 7100.
def source20 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨96, by decide +kernel⟩

def target20 : Weights.Entry :=
  { word := [0, 6, 0, 12, 8, 4, 10], weights := [0, 1, 1, 0] }

-- Period 9, original row 742, representative 7122.
def source21 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨118, by decide +kernel⟩

def target21 : Weights.Entry :=
  { word := [0, 6, 0, 12, 8, 4, 12], weights := [0, 1, 0, 1] }

-- Period 9, original row 755, representative 7090.
def source22 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨86, by decide +kernel⟩

def target22 : Weights.Entry :=
  { word := [0, 6, 2, 8, 8, 4, 10], weights := [0, 1, 1, 0] }

-- Period 9, original row 771, representative 7099.
def source23 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨95, by decide +kernel⟩

def target23 : Weights.Entry :=
  { word := [0, 6, 8, 12, 8, 4, 10], weights := [0, 1, 1, 0] }

-- Period 9, original row 772, representative 7121.
def source24 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨117, by decide +kernel⟩

def target24 : Weights.Entry :=
  { word := [0, 6, 8, 12, 8, 4, 12], weights := [0, 1, 0, 1] }

-- Period 9, original row 782, representative 7089.
def source25 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨85, by decide +kernel⟩

def target25 : Weights.Entry :=
  { word := [0, 6, 10, 8, 8, 4, 10], weights := [0, 1, 1, 0] }

-- Period 9, original row 1171, representative 7078.
def source26 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨74, by decide +kernel⟩

def target26 : Weights.Entry :=
  { word := [0, 9, 0, 4, 8, 4, 10], weights := [1, 0, 1, 0] }

-- Period 9, original row 1172, representative 7080.
def source27 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨76, by decide +kernel⟩

def target27 : Weights.Entry :=
  { word := [0, 9, 0, 4, 8, 4, 12], weights := [1, 0, 0, 1] }

-- Period 9, original row 1191, representative 7131.
def source28 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨127, by decide +kernel⟩

def target28 : Weights.Entry :=
  { word := [0, 9, 0, 9, 4, 4, 12], weights := [1, 1, 1, 1] }

-- Period 9, original row 1195, representative 7127.
def source29 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨123, by decide +kernel⟩

def target29 : Weights.Entry :=
  { word := [0, 9, 0, 9, 12, 4, 12], weights := [1, 1, 1, 1] }

-- Period 9, original row 1205, representative 7082.
def source30 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨78, by decide +kernel⟩

def target30 : Weights.Entry :=
  { word := [0, 9, 0, 12, 0, 4, 10], weights := [1, 0, 1, 0] }

-- Period 9, original row 1206, representative 7082.
def source31 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨78, by decide +kernel⟩

def target31 : Weights.Entry :=
  { word := [0, 9, 0, 12, 0, 4, 12], weights := [1, 0, 1, 0] }

def points31 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 8), (8, 7)]

-- Period 9, original row 1230, representative 7079.
def source32 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨75, by decide +kernel⟩

def target32 : Weights.Entry :=
  { word := [0, 9, 0, 12, 8, 4, 10], weights := [1, 0, 1, 0] }

-- Period 9, original row 1231, representative 7081.
def source33 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨77, by decide +kernel⟩

def target33 : Weights.Entry :=
  { word := [0, 9, 0, 12, 8, 4, 12], weights := [1, 0, 1, 0] }

-- Period 9, original row 1302, representative 7130.
def source34 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨126, by decide +kernel⟩

def target34 : Weights.Entry :=
  { word := [0, 9, 8, 9, 4, 4, 12], weights := [1, 1, 1, 1] }

-- Period 9, original row 1306, representative 7126.
def source35 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨122, by decide +kernel⟩

def target35 : Weights.Entry :=
  { word := [0, 9, 8, 9, 12, 4, 12], weights := [1, 1, 1, 1] }

-- Period 9, original row 1347, representative 7082.
def source36 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨78, by decide +kernel⟩

def target36 : Weights.Entry :=
  { word := [0, 10, 0, 8, 1, 4, 10], weights := [0, 1, 1, 0] }

def points36 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 1348, representative 7082.
def source37 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨78, by decide +kernel⟩

def target37 : Weights.Entry :=
  { word := [0, 10, 0, 8, 1, 4, 12], weights := [0, 1, 1, 0] }

def points37 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6), (7, 8), (8, 7)]

-- Period 9, original row 1353, representative 7069.
def source38 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨65, by decide +kernel⟩

def target38 : Weights.Entry :=
  { word := [0, 10, 0, 8, 4, 4, 12], weights := [0, 1, 0, 1] }

-- Period 9, original row 1356, representative 7124.
def source39 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨120, by decide +kernel⟩

def target39 : Weights.Entry :=
  { word := [0, 10, 0, 8, 8, 4, 12], weights := [0, 1, 0, 1] }

-- Period 9, original row 1360, representative 7074.
def source40 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨70, by decide +kernel⟩

def target40 : Weights.Entry :=
  { word := [0, 10, 0, 8, 9, 4, 12], weights := [0, 1, 1, 0] }

-- Period 9, original row 1364, representative 7065.
def source41 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨61, by decide +kernel⟩

def target41 : Weights.Entry :=
  { word := [0, 10, 0, 8, 12, 4, 12], weights := [0, 1, 0, 1] }

-- Period 9, original row 1369, representative 7101.
def source42 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨97, by decide +kernel⟩

def target42 : Weights.Entry :=
  { word := [0, 10, 0, 12, 8, 4, 10], weights := [0, 1, 1, 0] }

-- Period 9, original row 1370, representative 7123.
def source43 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨119, by decide +kernel⟩

def target43 : Weights.Entry :=
  { word := [0, 10, 0, 12, 8, 4, 12], weights := [0, 1, 0, 1] }

-- Period 9, original row 1389, representative 7091.
def source44 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨87, by decide +kernel⟩

def target44 : Weights.Entry :=
  { word := [0, 10, 2, 2, 8, 4, 10], weights := [0, 1, 0, 1] }

-- Period 9, original row 1390, representative 7113.
def source45 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨109, by decide +kernel⟩

def target45 : Weights.Entry :=
  { word := [0, 10, 2, 2, 8, 4, 12], weights := [0, 1, 0, 1] }

-- Period 9, original row 1421, representative 7094.
def source46 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨90, by decide +kernel⟩

def target46 : Weights.Entry :=
  { word := [0, 10, 2, 10, 8, 4, 10], weights := [0, 1, 1, 0] }

-- Period 9, original row 1422, representative 7116.
def source47 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨112, by decide +kernel⟩

def target47 : Weights.Entry :=
  { word := [0, 10, 2, 10, 8, 4, 12], weights := [0, 1, 0, 1] }

-- Period 9, original row 1444, representative 7068.
def source48 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨64, by decide +kernel⟩

def target48 : Weights.Entry :=
  { word := [0, 10, 8, 8, 4, 4, 12], weights := [0, 1, 0, 1] }

-- Period 9, original row 1449, representative 7064.
def source49 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨60, by decide +kernel⟩

def target49 : Weights.Entry :=
  { word := [0, 10, 8, 8, 12, 4, 12], weights := [0, 1, 0, 1] }

-- Period 9, original row 1464, representative 7092.
def source50 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨88, by decide +kernel⟩

def target50 : Weights.Entry :=
  { word := [0, 10, 10, 2, 8, 4, 10], weights := [0, 1, 0, 1] }

-- Period 9, original row 1465, representative 7114.
def source51 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨110, by decide +kernel⟩

def target51 : Weights.Entry :=
  { word := [0, 10, 10, 2, 8, 4, 12], weights := [0, 1, 0, 1] }

-- Period 9, original row 1489, representative 7093.
def source52 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨89, by decide +kernel⟩

def target52 : Weights.Entry :=
  { word := [0, 10, 10, 10, 8, 4, 10], weights := [0, 1, 1, 0] }

-- Period 9, original row 1490, representative 7115.
def source53 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨111, by decide +kernel⟩

def target53 : Weights.Entry :=
  { word := [0, 10, 10, 10, 8, 4, 12], weights := [0, 1, 0, 1] }

-- Period 9, original row 2449, representative 7035.
def source54 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨31, by decide +kernel⟩

def target54 : Weights.Entry :=
  { word := [2, 0, 4, 10, 8, 4, 12], weights := [1, 0, 1, 1] }

-- Period 9, original row 2473, representative 7024.
def source55 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨20, by decide +kernel⟩

def target55 : Weights.Entry :=
  { word := [2, 0, 8, 4, 8, 4, 12], weights := [1, 0, 0, 1] }

-- Period 9, original row 2477, representative 7030.
def source56 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨26, by decide +kernel⟩

def target56 : Weights.Entry :=
  { word := [2, 0, 8, 9, 4, 4, 12], weights := [1, 0, 1, 1] }

-- Period 9, original row 2481, representative 7029.
def source57 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨25, by decide +kernel⟩

def target57 : Weights.Entry :=
  { word := [2, 0, 8, 9, 12, 4, 12], weights := [1, 0, 1, 1] }

-- Period 9, original row 2491, representative 7028.
def source58 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨24, by decide +kernel⟩

def target58 : Weights.Entry :=
  { word := [2, 0, 8, 12, 0, 4, 10], weights := [1, 0, 1, 0] }

-- Period 9, original row 2492, representative 7028.
def source59 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨24, by decide +kernel⟩

def target59 : Weights.Entry :=
  { word := [2, 0, 8, 12, 0, 4, 12], weights := [1, 0, 1, 0] }

def points59 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 8), (8, 7)]

-- Period 9, original row 2503, representative 7025.
def source60 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨21, by decide +kernel⟩

def target60 : Weights.Entry :=
  { word := [2, 0, 8, 12, 8, 4, 12], weights := [1, 0, 1, 0] }

-- Period 9, original row 2511, representative 7045.
def source61 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨41, by decide +kernel⟩

def target61 : Weights.Entry :=
  { word := [2, 0, 9, 8, 1, 4, 10], weights := [1, 0, 1, 1] }

-- Period 9, original row 2512, representative 7045.
def source62 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨41, by decide +kernel⟩

def target62 : Weights.Entry :=
  { word := [2, 0, 9, 8, 1, 4, 12], weights := [1, 0, 1, 1] }

def points62 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 8), (8, 7)]

-- Period 9, original row 2519, representative 7040.
def source63 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨36, by decide +kernel⟩

def target63 : Weights.Entry :=
  { word := [2, 0, 9, 8, 9, 4, 12], weights := [1, 0, 1, 1] }

-- Period 9, original row 2553, representative 7036.
def source64 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨32, by decide +kernel⟩

def target64 : Weights.Entry :=
  { word := [2, 0, 12, 10, 0, 4, 10], weights := [1, 0, 1, 1] }

-- Period 9, original row 2554, representative 7036.
def source65 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨32, by decide +kernel⟩

def target65 : Weights.Entry :=
  { word := [2, 0, 12, 10, 0, 4, 12], weights := [1, 0, 1, 1] }

def points65 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 8), (8, 7)]

-- Period 9, original row 2571, representative 7034.
def source66 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨30, by decide +kernel⟩

def target66 : Weights.Entry :=
  { word := [2, 0, 12, 10, 8, 4, 12], weights := [1, 0, 1, 1] }

-- Period 9, original row 2826, representative 7016.
def source67 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨12, by decide +kernel⟩

def target67 : Weights.Entry :=
  { word := [2, 8, 0, 4, 8, 4, 10], weights := [1, 0, 1, 0] }

-- Period 9, original row 2827, representative 7020.
def source68 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨16, by decide +kernel⟩

def target68 : Weights.Entry :=
  { word := [2, 8, 0, 4, 8, 4, 12], weights := [1, 0, 0, 1] }

-- Period 9, original row 2852, representative 7027.
def source69 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨23, by decide +kernel⟩

def target69 : Weights.Entry :=
  { word := [2, 8, 0, 12, 0, 4, 10], weights := [1, 0, 1, 0] }

-- Period 9, original row 2853, representative 7027.
def source70 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨23, by decide +kernel⟩

def target70 : Weights.Entry :=
  { word := [2, 8, 0, 12, 0, 4, 12], weights := [1, 0, 1, 0] }

def points70 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 8), (8, 7)]

-- Period 9, original row 2877, representative 7019.
def source71 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨15, by decide +kernel⟩

def target71 : Weights.Entry :=
  { word := [2, 8, 0, 12, 8, 4, 10], weights := [1, 0, 1, 0] }

-- Period 9, original row 2878, representative 7023.
def source72 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨19, by decide +kernel⟩

def target72 : Weights.Entry :=
  { word := [2, 8, 0, 12, 8, 4, 12], weights := [1, 0, 1, 0] }

-- Period 9, original row 2992, representative 7017.
def source73 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨13, by decide +kernel⟩

def target73 : Weights.Entry :=
  { word := [2, 8, 8, 4, 8, 4, 10], weights := [1, 0, 1, 0] }

-- Period 9, original row 2993, representative 7021.
def source74 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨17, by decide +kernel⟩

def target74 : Weights.Entry :=
  { word := [2, 8, 8, 4, 8, 4, 12], weights := [1, 0, 0, 1] }

-- Period 9, original row 3018, representative 7046.
def source75 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨42, by decide +kernel⟩

def target75 : Weights.Entry :=
  { word := [2, 8, 8, 8, 1, 4, 10], weights := [1, 0, 1, 1] }

-- Period 9, original row 3019, representative 7046.
def source76 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨42, by decide +kernel⟩

def target76 : Weights.Entry :=
  { word := [2, 8, 8, 8, 1, 4, 12], weights := [1, 0, 1, 1] }

def points76 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 8), (8, 7)]

-- Period 9, original row 3026, representative 7041.
def source77 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨37, by decide +kernel⟩

def target77 : Weights.Entry :=
  { word := [2, 8, 8, 8, 9, 4, 12], weights := [1, 0, 1, 1] }

-- Period 9, original row 3036, representative 7026.
def source78 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨22, by decide +kernel⟩

def target78 : Weights.Entry :=
  { word := [2, 8, 8, 12, 0, 4, 10], weights := [1, 0, 1, 0] }

-- Period 9, original row 3037, representative 7026.
def source79 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨22, by decide +kernel⟩

def target79 : Weights.Entry :=
  { word := [2, 8, 8, 12, 0, 4, 12], weights := [1, 0, 1, 0] }

def points79 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 8), (8, 7)]

-- Period 9, original row 3065, representative 7018.
def source80 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨14, by decide +kernel⟩

def target80 : Weights.Entry :=
  { word := [2, 8, 8, 12, 8, 4, 10], weights := [1, 0, 1, 0] }

-- Period 9, original row 3066, representative 7022.
def source81 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨18, by decide +kernel⟩

def target81 : Weights.Entry :=
  { word := [2, 8, 8, 12, 8, 4, 12], weights := [1, 0, 1, 0] }

-- Period 9, original row 3093, representative 7043.
def source82 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨39, by decide +kernel⟩

def target82 : Weights.Entry :=
  { word := [2, 8, 9, 8, 1, 4, 10], weights := [1, 0, 1, 1] }

-- Period 9, original row 3094, representative 7043.
def source83 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨39, by decide +kernel⟩

def target83 : Weights.Entry :=
  { word := [2, 8, 9, 8, 1, 4, 12], weights := [1, 0, 1, 1] }

def points83 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 8), (8, 7)]

-- Period 9, original row 3101, representative 7038.
def source84 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨34, by decide +kernel⟩

def target84 : Weights.Entry :=
  { word := [2, 8, 9, 8, 9, 4, 12], weights := [1, 0, 1, 1] }

-- Period 9, original row 3153, representative 7033.
def source85 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨29, by decide +kernel⟩

def target85 : Weights.Entry :=
  { word := [2, 8, 12, 10, 8, 4, 12], weights := [2, 1, 1, 2] }

-- Period 9, original row 3346, representative 7015.
def source86 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨11, by decide +kernel⟩

def target86 : Weights.Entry :=
  { word := [2, 10, 8, 12, 8, 4, 10], weights := [2, 1, 2, 1] }

-- Period 9, original row 3686, representative 7044.
def source87 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨40, by decide +kernel⟩

def target87 : Weights.Entry :=
  { word := [4, 4, 8, 8, 1, 4, 10], weights := [1, 0, 1, 1] }

-- Period 9, original row 3687, representative 7044.
def source88 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨40, by decide +kernel⟩

def target88 : Weights.Entry :=
  { word := [4, 4, 8, 8, 1, 4, 12], weights := [1, 0, 1, 1] }

def points88 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 8), (8, 7)]

-- Period 9, original row 3699, representative 7039.
def source89 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨35, by decide +kernel⟩

def target89 : Weights.Entry :=
  { word := [4, 4, 8, 8, 9, 4, 12], weights := [1, 0, 1, 1] }

-- Period 9, original row 3744, representative 7016.
def source90 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨12, by decide +kernel⟩

def target90 : Weights.Entry :=
  { word := [4, 8, 0, 4, 8, 4, 10], weights := [1, 0, 1, 0] }

def points90 : List (ℕ × ℕ) := [(0, 0), (1, 2), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 3745, representative 7020.
def source91 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨16, by decide +kernel⟩

def target91 : Weights.Entry :=
  { word := [4, 8, 0, 4, 8, 4, 12], weights := [1, 0, 0, 1] }

def points91 : List (ℕ × ℕ) := [(0, 0), (1, 2), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 3787, representative 7019.
def source92 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨15, by decide +kernel⟩

def target92 : Weights.Entry :=
  { word := [4, 8, 0, 12, 8, 4, 10], weights := [1, 0, 1, 0] }

def points92 : List (ℕ × ℕ) := [(0, 0), (1, 2), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 3788, representative 7023.
def source93 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨19, by decide +kernel⟩

def target93 : Weights.Entry :=
  { word := [4, 8, 0, 12, 8, 4, 12], weights := [1, 0, 1, 0] }

def points93 : List (ℕ × ℕ) := [(0, 0), (1, 2), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 3857, representative 7032.
def source94 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨28, by decide +kernel⟩

def target94 : Weights.Entry :=
  { word := [4, 8, 4, 10, 8, 4, 12], weights := [1, 1, 1, 1] }

-- Period 9, original row 3965, representative 7031.
def source95 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨27, by decide +kernel⟩

def target95 : Weights.Entry :=
  { word := [4, 8, 12, 10, 8, 4, 12], weights := [1, 1, 1, 1] }

-- Period 9, original row 4051, representative 7042.
def source96 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨38, by decide +kernel⟩

def target96 : Weights.Entry :=
  { word := [4, 12, 8, 8, 1, 4, 10], weights := [1, 0, 1, 1] }

-- Period 9, original row 4052, representative 7042.
def source97 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨38, by decide +kernel⟩

def target97 : Weights.Entry :=
  { word := [4, 12, 8, 8, 1, 4, 12], weights := [1, 0, 1, 1] }

def points97 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 8), (8, 7)]

-- Period 9, original row 4064, representative 7037.
def source98 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨33, by decide +kernel⟩

def target98 : Weights.Entry :=
  { word := [4, 12, 8, 8, 9, 4, 12], weights := [1, 0, 1, 1] }

-- Period 9, original row 4498, representative 7060.
def source99 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨56, by decide +kernel⟩

def target99 : Weights.Entry :=
  { word := [8, 1, 0, 9, 4, 4, 12], weights := [1, 0, 1, 1] }

-- Period 9, original row 4502, representative 7056.
def source100 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨52, by decide +kernel⟩

def target100 : Weights.Entry :=
  { word := [8, 1, 0, 9, 12, 4, 12], weights := [1, 0, 1, 1] }

-- Period 9, original row 4510, representative 7052.
def source101 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨48, by decide +kernel⟩

def target101 : Weights.Entry :=
  { word := [8, 1, 0, 12, 0, 4, 10], weights := [1, 0, 1, 0] }

-- Period 9, original row 4511, representative 7052.
def source102 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨48, by decide +kernel⟩

def target102 : Weights.Entry :=
  { word := [8, 1, 0, 12, 0, 4, 12], weights := [1, 0, 1, 0] }

def points102 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 8), (8, 7)]

-- Period 9, original row 4564, representative 7062.
def source103 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨58, by decide +kernel⟩

def target103 : Weights.Entry :=
  { word := [8, 1, 4, 10, 8, 4, 12], weights := [1, 0, 1, 1] }

-- Period 9, original row 4589, representative 7059.
def source104 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨55, by decide +kernel⟩

def target104 : Weights.Entry :=
  { word := [8, 1, 8, 9, 4, 4, 12], weights := [1, 0, 1, 1] }

-- Period 9, original row 4593, representative 7055.
def source105 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨51, by decide +kernel⟩

def target105 : Weights.Entry :=
  { word := [8, 1, 8, 9, 12, 4, 12], weights := [1, 0, 1, 1] }

-- Period 9, original row 4639, representative 7063.
def source106 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨59, by decide +kernel⟩

def target106 : Weights.Entry :=
  { word := [8, 1, 12, 10, 0, 4, 10], weights := [1, 0, 1, 1] }

-- Period 9, original row 4640, representative 7063.
def source107 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨59, by decide +kernel⟩

def target107 : Weights.Entry :=
  { word := [8, 1, 12, 10, 0, 4, 12], weights := [1, 0, 1, 1] }

def points107 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 8), (8, 7)]

-- Period 9, original row 4657, representative 7061.
def source108 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨57, by decide +kernel⟩

def target108 : Weights.Entry :=
  { word := [8, 1, 12, 10, 8, 4, 12], weights := [1, 0, 1, 1] }

-- Period 9, original row 4691, representative 7077.
def source109 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨73, by decide +kernel⟩

def target109 : Weights.Entry :=
  { word := [8, 2, 0, 8, 1, 4, 10], weights := [0, 2, 1, 1] }

-- Period 9, original row 4692, representative 7077.
def source110 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨73, by decide +kernel⟩

def target110 : Weights.Entry :=
  { word := [8, 2, 0, 8, 1, 4, 12], weights := [0, 2, 1, 1] }

def points110 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 8), (8, 7)]

-- Period 9, original row 4697, representative 7073.
def source111 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨69, by decide +kernel⟩

def target111 : Weights.Entry :=
  { word := [8, 2, 0, 8, 9, 4, 12], weights := [0, 2, 1, 1] }

-- Period 9, original row 4711, representative 7112.
def source112 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨108, by decide +kernel⟩

def target112 : Weights.Entry :=
  { word := [8, 2, 0, 9, 8, 4, 12], weights := [0, 3, 1, 0] }

-- Period 9, original row 4738, representative 7111.
def source113 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨107, by decide +kernel⟩

def target113 : Weights.Entry :=
  { word := [8, 2, 0, 10, 8, 4, 12], weights := [0, 2, 0, 1] }

-- Period 9, original row 4827, representative 7087.
def source114 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨83, by decide +kernel⟩

def target114 : Weights.Entry :=
  { word := [8, 2, 2, 10, 8, 4, 10], weights := [1, 1, 1, 1] }

-- Period 9, original row 4828, representative 7105.
def source115 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨101, by decide +kernel⟩

def target115 : Weights.Entry :=
  { word := [8, 2, 2, 10, 8, 4, 12], weights := [1, 1, 1, 1] }

-- Period 9, original row 4908, representative 7110.
def source116 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨106, by decide +kernel⟩

def target116 : Weights.Entry :=
  { word := [8, 2, 8, 10, 8, 4, 12], weights := [0, 2, 0, 1] }

-- Period 9, original row 4982, representative 7086.
def source117 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨82, by decide +kernel⟩

def target117 : Weights.Entry :=
  { word := [8, 2, 10, 10, 8, 4, 10], weights := [1, 1, 1, 1] }

-- Period 9, original row 4983, representative 7104.
def source118 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨100, by decide +kernel⟩

def target118 : Weights.Entry :=
  { word := [8, 2, 10, 10, 8, 4, 12], weights := [1, 1, 1, 1] }

-- Period 9, original row 5305, representative 7088.
def source119 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨84, by decide +kernel⟩

def target119 : Weights.Entry :=
  { word := [8, 6, 8, 12, 8, 4, 10], weights := [1, 1, 1, 1] }

-- Period 9, original row 5306, representative 7106.
def source120 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨102, by decide +kernel⟩

def target120 : Weights.Entry :=
  { word := [8, 6, 8, 12, 8, 4, 12], weights := [1, 1, 1, 1] }

-- Period 9, original row 5893, representative 7047.
def source121 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨43, by decide +kernel⟩

def target121 : Weights.Entry :=
  { word := [8, 9, 0, 4, 8, 4, 10], weights := [1, 0, 1, 0] }

-- Period 9, original row 5894, representative 7049.
def source122 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨45, by decide +kernel⟩

def target122 : Weights.Entry :=
  { word := [8, 9, 0, 4, 8, 4, 12], weights := [1, 0, 0, 1] }

-- Period 9, original row 5913, representative 7058.
def source123 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨54, by decide +kernel⟩

def target123 : Weights.Entry :=
  { word := [8, 9, 0, 9, 4, 4, 12], weights := [1, 1, 1, 1] }

-- Period 9, original row 5917, representative 7054.
def source124 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨50, by decide +kernel⟩

def target124 : Weights.Entry :=
  { word := [8, 9, 0, 9, 12, 4, 12], weights := [1, 1, 1, 1] }

-- Period 9, original row 5927, representative 7051.
def source125 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨47, by decide +kernel⟩

def target125 : Weights.Entry :=
  { word := [8, 9, 0, 12, 0, 4, 10], weights := [1, 0, 1, 0] }

-- Period 9, original row 5928, representative 7051.
def source126 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨47, by decide +kernel⟩

def target126 : Weights.Entry :=
  { word := [8, 9, 0, 12, 0, 4, 12], weights := [1, 0, 1, 0] }

def points126 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 8), (8, 7)]

-- Period 9, original row 5952, representative 7048.
def source127 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B002.Data.entryAt ⟨44, by decide +kernel⟩

def target127 : Weights.Entry :=
  { word := [8, 9, 0, 12, 8, 4, 10], weights := [1, 0, 1, 0] }

def period9Entries : List Weights.Entry := [target0, target1, target2, target3, target4, target5, target6, target7, target8, target9, target10, target11, target12, target13, target14, target15, target16, target17, target18, target19, target20, target21, target22, target23, target24, target25, target26, target27, target28, target29, target30, target31, target32, target33, target34, target35, target36, target37, target38, target39, target40, target41, target42, target43, target44, target45, target46, target47, target48, target49, target50, target51, target52, target53, target54, target55, target56, target57, target58, target59, target60, target61, target62, target63, target64, target65, target66, target67, target68, target69, target70, target71, target72, target73, target74, target75, target76, target77, target78, target79, target80, target81, target82, target83, target84, target85, target86, target87, target88, target89, target90, target91, target92, target93, target94, target95, target96, target97, target98, target99, target100, target101, target102, target103, target104, target105, target106, target107, target108, target109, target110, target111, target112, target113, target114, target115, target116, target117, target118, target119, target120, target121, target122, target123, target124, target125, target126, target127]

def period9Chunk : RowCoverage.Chunk where
  rows := [⟨131, target0⟩, ⟨139, target1⟩, ⟨140, target2⟩, ⟨222, target3⟩, ⟨298, target4⟩, ⟨299, target5⟩, ⟨304, target6⟩, ⟨307, target7⟩, ⟨311, target8⟩, ⟨315, target9⟩, ⟨346, target10⟩, ⟨347, target11⟩, ⟨395, target12⟩, ⟨396, target13⟩, ⟨412, target14⟩, ⟨417, target15⟩, ⟨444, target16⟩, ⟨445, target17⟩, ⟨490, target18⟩, ⟨491, target19⟩, ⟨741, target20⟩, ⟨742, target21⟩, ⟨755, target22⟩, ⟨771, target23⟩, ⟨772, target24⟩, ⟨782, target25⟩, ⟨1171, target26⟩, ⟨1172, target27⟩, ⟨1191, target28⟩, ⟨1195, target29⟩, ⟨1205, target30⟩, ⟨1206, target31⟩, ⟨1230, target32⟩, ⟨1231, target33⟩, ⟨1302, target34⟩, ⟨1306, target35⟩, ⟨1347, target36⟩, ⟨1348, target37⟩, ⟨1353, target38⟩, ⟨1356, target39⟩, ⟨1360, target40⟩, ⟨1364, target41⟩, ⟨1369, target42⟩, ⟨1370, target43⟩, ⟨1389, target44⟩, ⟨1390, target45⟩, ⟨1421, target46⟩, ⟨1422, target47⟩, ⟨1444, target48⟩, ⟨1449, target49⟩, ⟨1464, target50⟩, ⟨1465, target51⟩, ⟨1489, target52⟩, ⟨1490, target53⟩, ⟨2449, target54⟩, ⟨2473, target55⟩, ⟨2477, target56⟩, ⟨2481, target57⟩, ⟨2491, target58⟩, ⟨2492, target59⟩, ⟨2503, target60⟩, ⟨2511, target61⟩, ⟨2512, target62⟩, ⟨2519, target63⟩, ⟨2553, target64⟩, ⟨2554, target65⟩, ⟨2571, target66⟩, ⟨2826, target67⟩, ⟨2827, target68⟩, ⟨2852, target69⟩, ⟨2853, target70⟩, ⟨2877, target71⟩, ⟨2878, target72⟩, ⟨2992, target73⟩, ⟨2993, target74⟩, ⟨3018, target75⟩, ⟨3019, target76⟩, ⟨3026, target77⟩, ⟨3036, target78⟩, ⟨3037, target79⟩, ⟨3065, target80⟩, ⟨3066, target81⟩, ⟨3093, target82⟩, ⟨3094, target83⟩, ⟨3101, target84⟩, ⟨3153, target85⟩, ⟨3346, target86⟩, ⟨3686, target87⟩, ⟨3687, target88⟩, ⟨3699, target89⟩, ⟨3744, target90⟩, ⟨3745, target91⟩, ⟨3787, target92⟩, ⟨3788, target93⟩, ⟨3857, target94⟩, ⟨3965, target95⟩, ⟨4051, target96⟩, ⟨4052, target97⟩, ⟨4064, target98⟩, ⟨4498, target99⟩, ⟨4502, target100⟩, ⟨4510, target101⟩, ⟨4511, target102⟩, ⟨4564, target103⟩, ⟨4589, target104⟩, ⟨4593, target105⟩, ⟨4639, target106⟩, ⟨4640, target107⟩, ⟨4657, target108⟩, ⟨4691, target109⟩, ⟨4692, target110⟩, ⟨4697, target111⟩, ⟨4711, target112⟩, ⟨4738, target113⟩, ⟨4827, target114⟩, ⟨4828, target115⟩, ⟨4908, target116⟩, ⟨4982, target117⟩, ⟨4983, target118⟩, ⟨5305, target119⟩, ⟨5306, target120⟩, ⟨5893, target121⟩, ⟨5894, target122⟩, ⟨5913, target123⟩, ⟨5917, target124⟩, ⟨5927, target125⟩, ⟨5928, target126⟩, ⟨5952, target127⟩]
  indexMask := 5376928121115485172302584061722305754014395347741790475233798557056989332054186735266392693135529312190809530195802392415089841374046865219118163350700688253758553614114668645728507661379900052652212639599510439435390514992769620021368830328436106625649448336509612079048859868550525219461452517085885284850153772186103336283370532111003498115848349475909613155631096519491597407365050963489409638952691734418734345879060086177926779892312149002207127798140946735299190253594054362187104543526350378143881818938885260471258109922301814047826847513156401422849922018165286985957029189745965677936948302056336930616114884449510156311812467477050392014700803263837635073965784125153989316300303918408253814286559411473477326639345415276294107080859928806434295600833598399618103117889797066580410500036396532502285894562649713908317134838399394164938230635961012488850645786073894493788999490817741668813704284725826639883964797421477509137989801330037597558333898979310838426680970748177266823422884049916488688652863875917808939768779017778028246310888800440707371749797286864792673609780076171268709478598840201380736637917858508895646815160349006827515384667445653816489150996961398859042452963253446851253076254449782023425609678233693207257097096767689721515931851040258627618259816454196709054164790798265983684717479201151032345179490488318679643654291667115290388659683541173174771544307892236345775304018074000914677484741995055713073394852352185522623976826786077592536617180745310947904326562631264944189719441943087863280854840732711425896897326296965428737974937743849642504110711676433337661211819167484542152171546048018781075225860233727189186586492918117961533229631563066066053499450828877956911477454171739118515233073587691823537871125817197200117512181354786123670079143936
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

end FranklSmallCyclic.TransportBatches.G055.B000.Data
