module

public import Conjectures.FranklSmallCyclicRowCoverage
public import Conjectures.FranklSmallCyclicCanonicalWords
public import Conjectures.FranklSmallCyclicOrbit8Block024Data

/-! 128 literal targets sharing one source proof block.
Original words and row indices are retained; weights may be transported.
-/
@[expose] public section

namespace FranklSmallCyclic.TransportBatches.G050.B000.Data

-- Period 8, original row 2, representative 6492.
def source0 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨101, by decide +kernel⟩

def target0 : Weights.Entry :=
  { word := [0, 0, 1, 4, 2, 0, 4], weights := [1, 0, 0, 1] }

-- Period 8, original row 8, representative 6410.
def source1 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨20, by decide +kernel⟩

def target1 : Weights.Entry :=
  { word := [0, 0, 1, 4, 2, 8, 4], weights := [1, 0, 0, 1] }

-- Period 8, original row 24, representative 6488.
def source2 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨97, by decide +kernel⟩

def target2 : Weights.Entry :=
  { word := [0, 0, 1, 4, 10, 0, 4], weights := [1, 0, 0, 1] }

-- Period 8, original row 30, representative 6398.
def source3 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨8, by decide +kernel⟩

def target3 : Weights.Entry :=
  { word := [0, 0, 1, 4, 10, 8, 4], weights := [1, 0, 0, 1] }

-- Period 8, original row 48, representative 6492.
def source4 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨101, by decide +kernel⟩

def target4 : Weights.Entry :=
  { word := [0, 0, 2, 2, 2, 0, 4], weights := [1, 0, 0, 1] }

def points4 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 5), (5, 4), (6, 6), (7, 7)]

-- Period 8, original row 56, representative 6405.
def source5 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨15, by decide +kernel⟩

def target5 : Weights.Entry :=
  { word := [0, 0, 2, 2, 2, 8, 4], weights := [1, 0, 0, 1] }

-- Period 8, original row 63, representative 6488.
def source6 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨97, by decide +kernel⟩

def target6 : Weights.Entry :=
  { word := [0, 0, 2, 2, 10, 0, 4], weights := [1, 0, 0, 1] }

def points6 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 5), (5, 4), (6, 6), (7, 7)]

-- Period 8, original row 71, representative 6393.
def source7 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨3, by decide +kernel⟩

def target7 : Weights.Entry :=
  { word := [0, 0, 2, 2, 10, 8, 4], weights := [1, 0, 0, 1] }

-- Period 8, original row 78, representative 6431.
def source8 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨41, by decide +kernel⟩

def target8 : Weights.Entry :=
  { word := [0, 0, 6, 2, 0, 8, 2], weights := [1, 0, 0, 1] }

-- Period 8, original row 79, representative 6431.
def source9 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨41, by decide +kernel⟩

def target9 : Weights.Entry :=
  { word := [0, 0, 6, 2, 0, 8, 4], weights := [1, 0, 0, 1] }

def points9 : List (ℕ × ℕ) := [(0, 7), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 0)]

-- Period 8, original row 86, representative 6417.
def source10 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨27, by decide +kernel⟩

def target10 : Weights.Entry :=
  { word := [0, 0, 6, 2, 8, 8, 2], weights := [0, 1, 0, 0] }

-- Period 8, original row 87, representative 6424.
def source11 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨34, by decide +kernel⟩

def target11 : Weights.Entry :=
  { word := [0, 0, 6, 2, 8, 8, 4], weights := [1, 0, 0, 1] }

-- Period 8, original row 107, representative 6406.
def source12 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨16, by decide +kernel⟩

def target12 : Weights.Entry :=
  { word := [0, 0, 10, 2, 2, 8, 4], weights := [1, 0, 0, 1] }

-- Period 8, original row 115, representative 6394.
def source13 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨4, by decide +kernel⟩

def target13 : Weights.Entry :=
  { word := [0, 0, 10, 2, 10, 8, 4], weights := [1, 0, 0, 1] }

-- Period 8, original row 120, representative 6492.
def source14 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨101, by decide +kernel⟩

def target14 : Weights.Entry :=
  { word := [0, 1, 0, 1, 4, 2, 0], weights := [1, 1, 0, 0] }

def points14 : List (ℕ × ℕ) := [(0, 1), (1, 2), (2, 7), (3, 4), (4, 6), (5, 5), (6, 3), (7, 0)]

-- Period 8, original row 122, representative 6492.
def source15 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨101, by decide +kernel⟩

def target15 : Weights.Entry :=
  { word := [0, 1, 0, 2, 2, 2, 0], weights := [1, 1, 0, 0] }

def points15 : List (ℕ × ℕ) := [(0, 1), (1, 2), (2, 7), (3, 4), (4, 5), (5, 6), (6, 3), (7, 0)]

-- Period 8, original row 148, representative 6477.
def source16 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨87, by decide +kernel⟩

def target16 : Weights.Entry :=
  { word := [0, 1, 4, 2, 0, 8, 0], weights := [0, 1, 0, 0] }

-- Period 8, original row 156, representative 6466.
def source17 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨76, by decide +kernel⟩

def target17 : Weights.Entry :=
  { word := [0, 1, 4, 2, 0, 9, 0], weights := [0, 1, 0, 0] }

-- Period 8, original row 158, representative 6466.
def source18 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨76, by decide +kernel⟩

def target18 : Weights.Entry :=
  { word := [0, 1, 4, 2, 0, 10, 0], weights := [0, 1, 0, 0] }

def points18 : List (ℕ × ℕ) := [(0, 7), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 0)]

-- Period 8, original row 160, representative 6475.
def source19 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨85, by decide +kernel⟩

def target19 : Weights.Entry :=
  { word := [0, 1, 4, 2, 8, 2, 0], weights := [0, 1, 0, 0] }

-- Period 8, original row 164, representative 6467.
def source20 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨77, by decide +kernel⟩

def target20 : Weights.Entry :=
  { word := [0, 1, 4, 2, 8, 10, 0], weights := [0, 1, 0, 0] }

-- Period 8, original row 168, representative 6472.
def source21 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨82, by decide +kernel⟩

def target21 : Weights.Entry :=
  { word := [0, 1, 4, 4, 4, 8, 0], weights := [0, 0, 1, 0] }

-- Period 8, original row 170, representative 6471.
def source22 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨81, by decide +kernel⟩

def target22 : Weights.Entry :=
  { word := [0, 1, 4, 8, 4, 2, 0], weights := [0, 1, 1, 0] }

-- Period 8, original row 172, representative 6465.
def source23 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨75, by decide +kernel⟩

def target23 : Weights.Entry :=
  { word := [0, 1, 4, 8, 4, 10, 0], weights := [0, 1, 1, 0] }

-- Period 8, original row 200, representative 6473.
def source24 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨83, by decide +kernel⟩

def target24 : Weights.Entry :=
  { word := [0, 1, 4, 12, 4, 8, 0], weights := [0, 0, 1, 0] }

-- Period 8, original row 202, representative 6493.
def source25 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨102, by decide +kernel⟩

def target25 : Weights.Entry :=
  { word := [0, 1, 8, 1, 4, 2, 0], weights := [1, 1, 0, 0] }

-- Period 8, original row 203, representative 6483.
def source26 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨92, by decide +kernel⟩

def target26 : Weights.Entry :=
  { word := [0, 1, 8, 1, 4, 10, 0], weights := [1, 1, 0, 0] }

-- Period 8, original row 204, representative 6484.
def source27 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨93, by decide +kernel⟩

def target27 : Weights.Entry :=
  { word := [0, 1, 8, 2, 2, 2, 0], weights := [1, 1, 0, 0] }

-- Period 8, original row 206, representative 6480.
def source28 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨90, by decide +kernel⟩

def target28 : Weights.Entry :=
  { word := [0, 1, 8, 2, 2, 10, 0], weights := [1, 1, 0, 0] }

-- Period 8, original row 208, representative 6485.
def source29 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨94, by decide +kernel⟩

def target29 : Weights.Entry :=
  { word := [0, 1, 8, 2, 10, 2, 0], weights := [1, 1, 0, 0] }

-- Period 8, original row 210, representative 6481.
def source30 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨91, by decide +kernel⟩

def target30 : Weights.Entry :=
  { word := [0, 1, 8, 2, 10, 10, 0], weights := [1, 1, 0, 0] }

-- Period 8, original row 237, representative 6462.
def source31 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨72, by decide +kernel⟩

def target31 : Weights.Entry :=
  { word := [0, 1, 12, 2, 0, 8, 0], weights := [0, 1, 0, 0] }

-- Period 8, original row 245, representative 6454.
def source32 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨64, by decide +kernel⟩

def target32 : Weights.Entry :=
  { word := [0, 1, 12, 2, 0, 9, 0], weights := [0, 1, 0, 0] }

-- Period 8, original row 247, representative 6454.
def source33 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨64, by decide +kernel⟩

def target33 : Weights.Entry :=
  { word := [0, 1, 12, 2, 0, 10, 0], weights := [0, 1, 0, 0] }

def points33 : List (ℕ × ℕ) := [(0, 7), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 0)]

-- Period 8, original row 249, representative 6460.
def source34 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨70, by decide +kernel⟩

def target34 : Weights.Entry :=
  { word := [0, 1, 12, 2, 8, 2, 0], weights := [0, 1, 0, 0] }

-- Period 8, original row 253, representative 6455.
def source35 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨65, by decide +kernel⟩

def target35 : Weights.Entry :=
  { word := [0, 1, 12, 2, 8, 10, 0], weights := [0, 1, 0, 0] }

-- Period 8, original row 257, representative 6458.
def source36 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨68, by decide +kernel⟩

def target36 : Weights.Entry :=
  { word := [0, 1, 12, 4, 4, 8, 0], weights := [0, 0, 1, 0] }

-- Period 8, original row 259, representative 6457.
def source37 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨67, by decide +kernel⟩

def target37 : Weights.Entry :=
  { word := [0, 1, 12, 8, 4, 2, 0], weights := [0, 1, 1, 0] }

-- Period 8, original row 261, representative 6453.
def source38 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨63, by decide +kernel⟩

def target38 : Weights.Entry :=
  { word := [0, 1, 12, 8, 4, 10, 0], weights := [0, 1, 1, 0] }

-- Period 8, original row 293, representative 6459.
def source39 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨69, by decide +kernel⟩

def target39 : Weights.Entry :=
  { word := [0, 1, 12, 12, 4, 8, 0], weights := [0, 0, 1, 0] }

-- Period 8, original row 320, representative 6477.
def source40 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨87, by decide +kernel⟩

def target40 : Weights.Entry :=
  { word := [0, 2, 2, 2, 0, 8, 0], weights := [1, 0, 0, 0] }

def points40 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6), (7, 7)]

-- Period 8, original row 328, representative 6466.
def source41 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨76, by decide +kernel⟩

def target41 : Weights.Entry :=
  { word := [0, 2, 2, 2, 0, 9, 0], weights := [1, 0, 0, 0] }

def points41 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6), (7, 7)]

-- Period 8, original row 330, representative 6466.
def source42 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨76, by decide +kernel⟩

def target42 : Weights.Entry :=
  { word := [0, 2, 2, 2, 0, 10, 0], weights := [1, 0, 0, 0] }

def points42 : List (ℕ × ℕ) := [(0, 7), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6), (7, 0)]

-- Period 8, original row 341, representative 6469.
def source43 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨79, by decide +kernel⟩

def target43 : Weights.Entry :=
  { word := [0, 2, 2, 2, 8, 2, 0], weights := [1, 1, 0, 0] }

-- Period 8, original row 348, representative 6476.
def source44 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨86, by decide +kernel⟩

def target44 : Weights.Entry :=
  { word := [0, 2, 2, 2, 8, 8, 0], weights := [1, 1, 0, 0] }

-- Period 8, original row 356, representative 6463.
def source45 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨73, by decide +kernel⟩

def target45 : Weights.Entry :=
  { word := [0, 2, 2, 2, 8, 9, 0], weights := [1, 1, 0, 0] }

-- Period 8, original row 358, representative 6464.
def source46 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨74, by decide +kernel⟩

def target46 : Weights.Entry :=
  { word := [0, 2, 2, 2, 8, 10, 0], weights := [1, 1, 0, 0] }

-- Period 8, original row 425, representative 6462.
def source47 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨72, by decide +kernel⟩

def target47 : Weights.Entry :=
  { word := [0, 2, 10, 2, 0, 8, 0], weights := [1, 0, 0, 0] }

def points47 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6), (7, 7)]

-- Period 8, original row 433, representative 6454.
def source48 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨64, by decide +kernel⟩

def target48 : Weights.Entry :=
  { word := [0, 2, 10, 2, 0, 9, 0], weights := [1, 0, 0, 0] }

def points48 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6), (7, 7)]

-- Period 8, original row 435, representative 6454.
def source49 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨64, by decide +kernel⟩

def target49 : Weights.Entry :=
  { word := [0, 2, 10, 2, 0, 10, 0], weights := [1, 0, 0, 0] }

def points49 : List (ℕ × ℕ) := [(0, 7), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6), (7, 0)]

-- Period 8, original row 439, representative 6456.
def source50 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨66, by decide +kernel⟩

def target50 : Weights.Entry :=
  { word := [0, 2, 10, 2, 8, 2, 0], weights := [1, 1, 0, 0] }

-- Period 8, original row 446, representative 6461.
def source51 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨71, by decide +kernel⟩

def target51 : Weights.Entry :=
  { word := [0, 2, 10, 2, 8, 8, 0], weights := [0, 1, 0, 0] }

-- Period 8, original row 454, representative 6451.
def source52 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨61, by decide +kernel⟩

def target52 : Weights.Entry :=
  { word := [0, 2, 10, 2, 8, 9, 0], weights := [0, 1, 0, 0] }

-- Period 8, original row 456, representative 6452.
def source53 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨62, by decide +kernel⟩

def target53 : Weights.Entry :=
  { word := [0, 2, 10, 2, 8, 10, 0], weights := [1, 1, 0, 0] }

-- Period 8, original row 552, representative 6492.
def source54 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨101, by decide +kernel⟩

def target54 : Weights.Entry :=
  { word := [0, 4, 2, 0, 1, 0, 1], weights := [0, 1, 0, 1] }

def points54 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 1), (3, 4), (4, 3), (5, 5), (6, 6), (7, 2)]

-- Period 8, original row 560, representative 6440.
def source55 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨50, by decide +kernel⟩

def target55 : Weights.Entry :=
  { word := [0, 4, 2, 0, 1, 8, 2], weights := [0, 1, 0, 1] }

-- Period 8, original row 561, representative 6440.
def source56 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨50, by decide +kernel⟩

def target56 : Weights.Entry :=
  { word := [0, 4, 2, 0, 1, 8, 4], weights := [0, 1, 0, 1] }

def points56 : List (ℕ × ℕ) := [(0, 7), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 0)]

-- Period 8, original row 566, representative 6493.
def source57 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨102, by decide +kernel⟩

def target57 : Weights.Entry :=
  { word := [0, 4, 2, 0, 9, 0, 1], weights := [0, 1, 0, 1] }

def points57 : List (ℕ × ℕ) := [(0, 2), (1, 0), (2, 7), (3, 6), (4, 4), (5, 5), (6, 3), (7, 1)]

-- Period 8, original row 568, representative 6474.
def source58 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨84, by decide +kernel⟩

def target58 : Weights.Entry :=
  { word := [0, 4, 2, 0, 9, 0, 4], weights := [0, 1, 0, 1] }

-- Period 8, original row 574, representative 6432.
def source59 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨42, by decide +kernel⟩

def target59 : Weights.Entry :=
  { word := [0, 4, 2, 0, 9, 8, 2], weights := [0, 1, 0, 1] }

-- Period 8, original row 575, representative 6436.
def source60 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨46, by decide +kernel⟩

def target60 : Weights.Entry :=
  { word := [0, 4, 2, 0, 9, 8, 4], weights := [0, 1, 0, 1] }

-- Period 8, original row 580, representative 6471.
def source61 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨81, by decide +kernel⟩

def target61 : Weights.Entry :=
  { word := [0, 4, 2, 8, 2, 0, 1], weights := [0, 1, 1, 0] }

def points61 : List (ℕ × ℕ) := [(0, 2), (1, 0), (2, 7), (3, 6), (4, 4), (5, 5), (6, 3), (7, 1)]

-- Period 8, original row 594, representative 6457.
def source62 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨67, by decide +kernel⟩

def target62 : Weights.Entry :=
  { word := [0, 4, 2, 8, 10, 0, 1], weights := [0, 1, 1, 0] }

def points62 : List (ℕ × ℕ) := [(0, 2), (1, 0), (2, 7), (3, 6), (4, 4), (5, 5), (6, 3), (7, 1)]

-- Period 8, original row 602, representative 6492.
def source63 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨101, by decide +kernel⟩

def target63 : Weights.Entry :=
  { word := [0, 4, 4, 4, 0, 0, 1], weights := [1, 0, 0, 1] }

def points63 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6), (7, 2)]

-- Period 8, original row 610, representative 6440.
def source64 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨50, by decide +kernel⟩

def target64 : Weights.Entry :=
  { word := [0, 4, 4, 4, 0, 8, 2], weights := [1, 0, 0, 1] }

def points64 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6), (7, 7)]

-- Period 8, original row 611, representative 6440.
def source65 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨50, by decide +kernel⟩

def target65 : Weights.Entry :=
  { word := [0, 4, 4, 4, 0, 8, 4], weights := [1, 0, 0, 1] }

def points65 : List (ℕ × ℕ) := [(0, 7), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6), (7, 0)]

-- Period 8, original row 616, representative 6484.
def source66 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨93, by decide +kernel⟩

def target66 : Weights.Entry :=
  { word := [0, 4, 4, 4, 8, 0, 1], weights := [0, 0, 1, 1] }

def points66 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 618, representative 6469.
def source67 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨79, by decide +kernel⟩

def target67 : Weights.Entry :=
  { word := [0, 4, 4, 4, 8, 0, 4], weights := [1, 0, 0, 1] }

def points67 : List (ℕ × ℕ) := [(0, 2), (1, 0), (2, 1), (3, 3), (4, 6), (5, 4), (6, 5), (7, 7)]

-- Period 8, original row 624, representative 6418.
def source68 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨28, by decide +kernel⟩

def target68 : Weights.Entry :=
  { word := [0, 4, 4, 4, 8, 8, 2], weights := [1, 0, 1, 0] }

-- Period 8, original row 625, representative 6425.
def source69 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨35, by decide +kernel⟩

def target69 : Weights.Entry :=
  { word := [0, 4, 4, 4, 8, 8, 4], weights := [1, 0, 0, 1] }

-- Period 8, original row 631, representative 6414.
def source70 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨24, by decide +kernel⟩

def target70 : Weights.Entry :=
  { word := [0, 4, 6, 8, 8, 8, 2], weights := [0, 1, 1, 0] }

-- Period 8, original row 635, representative 6475.
def source71 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨85, by decide +kernel⟩

def target71 : Weights.Entry :=
  { word := [0, 4, 8, 4, 2, 0, 1], weights := [0, 0, 1, 0] }

def points71 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 637, representative 6475.
def source72 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨85, by decide +kernel⟩

def target72 : Weights.Entry :=
  { word := [0, 4, 8, 4, 2, 0, 4], weights := [1, 0, 0, 0] }

def points72 : List (ℕ × ℕ) := [(0, 7), (1, 0), (2, 1), (3, 6), (4, 3), (5, 4), (6, 5), (7, 2)]

-- Period 8, original row 643, representative 6409.
def source73 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨19, by decide +kernel⟩

def target73 : Weights.Entry :=
  { word := [0, 4, 8, 4, 2, 8, 4], weights := [1, 0, 0, 1] }

-- Period 8, original row 647, representative 6469.
def source74 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨79, by decide +kernel⟩

def target74 : Weights.Entry :=
  { word := [0, 4, 8, 4, 4, 4, 0], weights := [0, 0, 1, 1] }

def points74 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 661, representative 6460.
def source75 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨70, by decide +kernel⟩

def target75 : Weights.Entry :=
  { word := [0, 4, 8, 4, 10, 0, 1], weights := [0, 0, 1, 0] }

def points75 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 663, representative 6468.
def source76 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨78, by decide +kernel⟩

def target76 : Weights.Entry :=
  { word := [0, 4, 8, 4, 10, 0, 4], weights := [1, 0, 0, 1] }

-- Period 8, original row 669, representative 6397.
def source77 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨7, by decide +kernel⟩

def target77 : Weights.Entry :=
  { word := [0, 4, 8, 4, 10, 8, 4], weights := [1, 0, 0, 1] }

-- Period 8, original row 673, representative 6456.
def source78 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨66, by decide +kernel⟩

def target78 : Weights.Entry :=
  { word := [0, 4, 8, 4, 12, 4, 0], weights := [0, 0, 1, 1] }

def points78 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 692, representative 6443.
def source79 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨53, by decide +kernel⟩

def target79 : Weights.Entry :=
  { word := [0, 4, 10, 0, 1, 8, 2], weights := [0, 1, 0, 1] }

-- Period 8, original row 693, representative 6443.
def source80 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨53, by decide +kernel⟩

def target80 : Weights.Entry :=
  { word := [0, 4, 10, 0, 1, 8, 4], weights := [0, 1, 0, 1] }

def points80 : List (ℕ × ℕ) := [(0, 7), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 0)]

-- Period 8, original row 699, representative 6435.
def source81 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨45, by decide +kernel⟩

def target81 : Weights.Entry :=
  { word := [0, 4, 10, 0, 9, 8, 2], weights := [0, 1, 0, 1] }

-- Period 8, original row 700, representative 6439.
def source82 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨49, by decide +kernel⟩

def target82 : Weights.Entry :=
  { word := [0, 4, 10, 0, 9, 8, 4], weights := [0, 1, 0, 1] }

-- Period 8, original row 718, representative 6443.
def source83 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨53, by decide +kernel⟩

def target83 : Weights.Entry :=
  { word := [0, 4, 12, 4, 0, 8, 2], weights := [1, 0, 0, 1] }

def points83 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6), (7, 7)]

-- Period 8, original row 719, representative 6443.
def source84 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨53, by decide +kernel⟩

def target84 : Weights.Entry :=
  { word := [0, 4, 12, 4, 0, 8, 4], weights := [1, 0, 0, 1] }

def points84 : List (ℕ × ℕ) := [(0, 7), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6), (7, 0)]

-- Period 8, original row 724, representative 6485.
def source85 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨94, by decide +kernel⟩

def target85 : Weights.Entry :=
  { word := [0, 4, 12, 4, 8, 0, 1], weights := [0, 0, 1, 1] }

def points85 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 726, representative 6470.
def source86 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨80, by decide +kernel⟩

def target86 : Weights.Entry :=
  { word := [0, 4, 12, 4, 8, 0, 4], weights := [1, 0, 0, 1] }

-- Period 8, original row 732, representative 6421.
def source87 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨31, by decide +kernel⟩

def target87 : Weights.Entry :=
  { word := [0, 4, 12, 4, 8, 8, 2], weights := [1, 0, 1, 0] }

-- Period 8, original row 733, representative 6428.
def source88 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨38, by decide +kernel⟩

def target88 : Weights.Entry :=
  { word := [0, 4, 12, 4, 8, 8, 4], weights := [1, 0, 0, 1] }

-- Period 8, original row 813, representative 6477.
def source89 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨87, by decide +kernel⟩

def target89 : Weights.Entry :=
  { word := [0, 8, 0, 4, 2, 0, 1], weights := [0, 0, 1, 0] }

def points89 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 815, representative 6494.
def source90 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨103, by decide +kernel⟩

def target90 : Weights.Entry :=
  { word := [0, 8, 0, 4, 2, 0, 4], weights := [1, 0, 0, 1] }

-- Period 8, original row 821, representative 6412.
def source91 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨22, by decide +kernel⟩

def target91 : Weights.Entry :=
  { word := [0, 8, 0, 4, 2, 8, 4], weights := [1, 0, 0, 1] }

-- Period 8, original row 825, representative 6477.
def source92 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨87, by decide +kernel⟩

def target92 : Weights.Entry :=
  { word := [0, 8, 0, 4, 4, 4, 0], weights := [0, 0, 0, 1] }

def points92 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 5), (4, 6), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 839, representative 6462.
def source93 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨72, by decide +kernel⟩

def target93 : Weights.Entry :=
  { word := [0, 8, 0, 4, 10, 0, 1], weights := [0, 0, 1, 0] }

def points93 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 841, representative 6489.
def source94 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨98, by decide +kernel⟩

def target94 : Weights.Entry :=
  { word := [0, 8, 0, 4, 10, 0, 4], weights := [1, 0, 0, 1] }

-- Period 8, original row 847, representative 6400.
def source95 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨10, by decide +kernel⟩

def target95 : Weights.Entry :=
  { word := [0, 8, 0, 4, 10, 8, 4], weights := [1, 0, 0, 1] }

-- Period 8, original row 851, representative 6462.
def source96 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨72, by decide +kernel⟩

def target96 : Weights.Entry :=
  { word := [0, 8, 0, 4, 12, 4, 0], weights := [0, 0, 0, 1] }

def points96 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 5), (4, 6), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 892, representative 6466.
def source97 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨76, by decide +kernel⟩

def target97 : Weights.Entry :=
  { word := [0, 8, 1, 4, 2, 0, 1], weights := [0, 0, 1, 0] }

def points97 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 894, representative 6479.
def source98 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨89, by decide +kernel⟩

def target98 : Weights.Entry :=
  { word := [0, 8, 1, 4, 2, 0, 4], weights := [1, 0, 0, 1] }

-- Period 8, original row 900, representative 6411.
def source99 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨21, by decide +kernel⟩

def target99 : Weights.Entry :=
  { word := [0, 8, 1, 4, 2, 8, 4], weights := [1, 0, 0, 1] }

-- Period 8, original row 904, representative 6466.
def source100 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨76, by decide +kernel⟩

def target100 : Weights.Entry :=
  { word := [0, 8, 1, 4, 4, 4, 0], weights := [0, 0, 0, 1] }

def points100 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 5), (4, 6), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 914, representative 6454.
def source101 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨64, by decide +kernel⟩

def target101 : Weights.Entry :=
  { word := [0, 8, 1, 4, 10, 0, 1], weights := [0, 0, 1, 0] }

def points101 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 916, representative 6478.
def source102 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨88, by decide +kernel⟩

def target102 : Weights.Entry :=
  { word := [0, 8, 1, 4, 10, 0, 4], weights := [1, 0, 0, 1] }

-- Period 8, original row 922, representative 6399.
def source103 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨9, by decide +kernel⟩

def target103 : Weights.Entry :=
  { word := [0, 8, 1, 4, 10, 8, 4], weights := [1, 0, 0, 1] }

-- Period 8, original row 926, representative 6454.
def source104 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨64, by decide +kernel⟩

def target104 : Weights.Entry :=
  { word := [0, 8, 1, 4, 12, 4, 0], weights := [0, 0, 0, 1] }

def points104 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 5), (4, 6), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 938, representative 6472.
def source105 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨82, by decide +kernel⟩

def target105 : Weights.Entry :=
  { word := [0, 8, 2, 2, 2, 0, 1], weights := [0, 1, 0, 0] }

def points105 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 940, representative 6490.
def source106 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨99, by decide +kernel⟩

def target106 : Weights.Entry :=
  { word := [0, 8, 2, 2, 2, 0, 4], weights := [1, 0, 0, 1] }

-- Period 8, original row 948, representative 6401.
def source107 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨11, by decide +kernel⟩

def target107 : Weights.Entry :=
  { word := [0, 8, 2, 2, 2, 8, 4], weights := [1, 0, 0, 1] }

-- Period 8, original row 953, representative 6458.
def source108 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨68, by decide +kernel⟩

def target108 : Weights.Entry :=
  { word := [0, 8, 2, 2, 10, 0, 1], weights := [0, 1, 0, 0] }

def points108 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 955, representative 6486.
def source109 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨95, by decide +kernel⟩

def target109 : Weights.Entry :=
  { word := [0, 8, 2, 2, 10, 0, 4], weights := [1, 0, 0, 1] }

-- Period 8, original row 968, representative 6473.
def source110 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨83, by decide +kernel⟩

def target110 : Weights.Entry :=
  { word := [0, 8, 2, 10, 2, 0, 1], weights := [0, 1, 0, 0] }

def points110 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 970, representative 6491.
def source111 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨100, by decide +kernel⟩

def target111 : Weights.Entry :=
  { word := [0, 8, 2, 10, 2, 0, 4], weights := [1, 1, 0, 0] }

-- Period 8, original row 977, representative 6404.
def source112 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨14, by decide +kernel⟩

def target112 : Weights.Entry :=
  { word := [0, 8, 2, 10, 2, 8, 4], weights := [1, 0, 0, 1] }

-- Period 8, original row 982, representative 6459.
def source113 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨69, by decide +kernel⟩

def target113 : Weights.Entry :=
  { word := [0, 8, 2, 10, 10, 0, 1], weights := [0, 1, 0, 0] }

def points113 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 984, representative 6487.
def source114 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨96, by decide +kernel⟩

def target114 : Weights.Entry :=
  { word := [0, 8, 2, 10, 10, 0, 4], weights := [1, 1, 0, 0] }

-- Period 8, original row 991, representative 6392.
def source115 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨2, by decide +kernel⟩

def target115 : Weights.Entry :=
  { word := [0, 8, 2, 10, 10, 8, 4], weights := [1, 0, 0, 1] }

-- Period 8, original row 1014, representative 6429.
def source116 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨39, by decide +kernel⟩

def target116 : Weights.Entry :=
  { word := [0, 8, 6, 2, 0, 8, 2], weights := [1, 0, 0, 1] }

-- Period 8, original row 1015, representative 6429.
def source117 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨39, by decide +kernel⟩

def target117 : Weights.Entry :=
  { word := [0, 8, 6, 2, 0, 8, 4], weights := [1, 0, 0, 1] }

def points117 : List (ℕ × ℕ) := [(0, 7), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 0)]

-- Period 8, original row 1022, representative 6415.
def source118 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨25, by decide +kernel⟩

def target118 : Weights.Entry :=
  { word := [0, 8, 6, 2, 8, 8, 2], weights := [0, 1, 0, 0] }

-- Period 8, original row 1023, representative 6422.
def source119 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨32, by decide +kernel⟩

def target119 : Weights.Entry :=
  { word := [0, 8, 6, 2, 8, 8, 4], weights := [1, 0, 0, 1] }

-- Period 8, original row 1029, representative 6430.
def source120 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨40, by decide +kernel⟩

def target120 : Weights.Entry :=
  { word := [0, 8, 6, 10, 0, 8, 2], weights := [1, 0, 0, 1] }

-- Period 8, original row 1030, representative 6430.
def source121 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨40, by decide +kernel⟩

def target121 : Weights.Entry :=
  { word := [0, 8, 6, 10, 0, 8, 4], weights := [1, 0, 0, 1] }

def points121 : List (ℕ × ℕ) := [(0, 7), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 0)]

-- Period 8, original row 1036, representative 6416.
def source122 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨26, by decide +kernel⟩

def target122 : Weights.Entry :=
  { word := [0, 8, 6, 10, 8, 8, 2], weights := [0, 1, 0, 0] }

-- Period 8, original row 1037, representative 6423.
def source123 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨33, by decide +kernel⟩

def target123 : Weights.Entry :=
  { word := [0, 8, 6, 10, 8, 8, 4], weights := [0, 1, 0, 0] }

-- Period 8, original row 1042, representative 6476.
def source124 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨86, by decide +kernel⟩

def target124 : Weights.Entry :=
  { word := [0, 8, 8, 4, 4, 4, 0], weights := [0, 0, 1, 1] }

def points124 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 1050, representative 6461.
def source125 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨71, by decide +kernel⟩

def target125 : Weights.Entry :=
  { word := [0, 8, 8, 4, 12, 4, 0], weights := [0, 0, 1, 0] }

def points125 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 1068, representative 6463.
def source126 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨73, by decide +kernel⟩

def target126 : Weights.Entry :=
  { word := [0, 8, 9, 4, 4, 4, 0], weights := [0, 0, 1, 1] }

def points126 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

-- Period 8, original row 1072, representative 6451.
def source127 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P8.B024.Data.entryAt ⟨61, by decide +kernel⟩

def target127 : Weights.Entry :=
  { word := [0, 8, 9, 4, 12, 4, 0], weights := [0, 0, 1, 0] }

def points127 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2)]

def period8Entries : List Weights.Entry := [target0, target1, target2, target3, target4, target5, target6, target7, target8, target9, target10, target11, target12, target13, target14, target15, target16, target17, target18, target19, target20, target21, target22, target23, target24, target25, target26, target27, target28, target29, target30, target31, target32, target33, target34, target35, target36, target37, target38, target39, target40, target41, target42, target43, target44, target45, target46, target47, target48, target49, target50, target51, target52, target53, target54, target55, target56, target57, target58, target59, target60, target61, target62, target63, target64, target65, target66, target67, target68, target69, target70, target71, target72, target73, target74, target75, target76, target77, target78, target79, target80, target81, target82, target83, target84, target85, target86, target87, target88, target89, target90, target91, target92, target93, target94, target95, target96, target97, target98, target99, target100, target101, target102, target103, target104, target105, target106, target107, target108, target109, target110, target111, target112, target113, target114, target115, target116, target117, target118, target119, target120, target121, target122, target123, target124, target125, target126, target127]

def period8Chunk : RowCoverage.Chunk where
  rows := [⟨2, target0⟩, ⟨8, target1⟩, ⟨24, target2⟩, ⟨30, target3⟩, ⟨48, target4⟩, ⟨56, target5⟩, ⟨63, target6⟩, ⟨71, target7⟩, ⟨78, target8⟩, ⟨79, target9⟩, ⟨86, target10⟩, ⟨87, target11⟩, ⟨107, target12⟩, ⟨115, target13⟩, ⟨120, target14⟩, ⟨122, target15⟩, ⟨148, target16⟩, ⟨156, target17⟩, ⟨158, target18⟩, ⟨160, target19⟩, ⟨164, target20⟩, ⟨168, target21⟩, ⟨170, target22⟩, ⟨172, target23⟩, ⟨200, target24⟩, ⟨202, target25⟩, ⟨203, target26⟩, ⟨204, target27⟩, ⟨206, target28⟩, ⟨208, target29⟩, ⟨210, target30⟩, ⟨237, target31⟩, ⟨245, target32⟩, ⟨247, target33⟩, ⟨249, target34⟩, ⟨253, target35⟩, ⟨257, target36⟩, ⟨259, target37⟩, ⟨261, target38⟩, ⟨293, target39⟩, ⟨320, target40⟩, ⟨328, target41⟩, ⟨330, target42⟩, ⟨341, target43⟩, ⟨348, target44⟩, ⟨356, target45⟩, ⟨358, target46⟩, ⟨425, target47⟩, ⟨433, target48⟩, ⟨435, target49⟩, ⟨439, target50⟩, ⟨446, target51⟩, ⟨454, target52⟩, ⟨456, target53⟩, ⟨552, target54⟩, ⟨560, target55⟩, ⟨561, target56⟩, ⟨566, target57⟩, ⟨568, target58⟩, ⟨574, target59⟩, ⟨575, target60⟩, ⟨580, target61⟩, ⟨594, target62⟩, ⟨602, target63⟩, ⟨610, target64⟩, ⟨611, target65⟩, ⟨616, target66⟩, ⟨618, target67⟩, ⟨624, target68⟩, ⟨625, target69⟩, ⟨631, target70⟩, ⟨635, target71⟩, ⟨637, target72⟩, ⟨643, target73⟩, ⟨647, target74⟩, ⟨661, target75⟩, ⟨663, target76⟩, ⟨669, target77⟩, ⟨673, target78⟩, ⟨692, target79⟩, ⟨693, target80⟩, ⟨699, target81⟩, ⟨700, target82⟩, ⟨718, target83⟩, ⟨719, target84⟩, ⟨724, target85⟩, ⟨726, target86⟩, ⟨732, target87⟩, ⟨733, target88⟩, ⟨813, target89⟩, ⟨815, target90⟩, ⟨821, target91⟩, ⟨825, target92⟩, ⟨839, target93⟩, ⟨841, target94⟩, ⟨847, target95⟩, ⟨851, target96⟩, ⟨892, target97⟩, ⟨894, target98⟩, ⟨900, target99⟩, ⟨904, target100⟩, ⟨914, target101⟩, ⟨916, target102⟩, ⟨922, target103⟩, ⟨926, target104⟩, ⟨938, target105⟩, ⟨940, target106⟩, ⟨948, target107⟩, ⟨953, target108⟩, ⟨955, target109⟩, ⟨968, target110⟩, ⟨970, target111⟩, ⟨977, target112⟩, ⟨982, target113⟩, ⟨984, target114⟩, ⟨991, target115⟩, ⟨1014, target116⟩, ⟨1015, target117⟩, ⟨1022, target118⟩, ⟨1023, target119⟩, ⟨1029, target120⟩, ⟨1030, target121⟩, ⟨1036, target122⟩, ⟨1037, target123⟩, ⟨1042, target124⟩, ⟨1050, target125⟩, ⟨1068, target126⟩, ⟨1072, target127⟩]
  indexMask := 53763110648220638567164506719626102818904873904693868541193419095784011410256904756437155045161200842460104485718443846762789390181885976528923600471827987535920537880962471109380630486242756769875120398694279280207076130734921779186217212354378580678463590100434217030985646822980838949668123870738274080859935845229003012
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

end FranklSmallCyclic.TransportBatches.G050.B000.Data
