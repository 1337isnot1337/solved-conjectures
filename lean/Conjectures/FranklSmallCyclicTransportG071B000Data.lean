module

public import Conjectures.FranklSmallCyclicRowCoverage
public import Conjectures.FranklSmallCyclicCanonicalWords
public import Conjectures.FranklSmallCyclicOrbit9Block018Data

/-! 128 literal targets sharing one source proof block.
Original words and row indices are retained; weights may be transported.
-/
@[expose] public section

namespace FranklSmallCyclic.TransportBatches.G071.B000.Data

-- Period 9, original row 123, representative 9136.
def source0 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B018.Data.entryAt ⟨81, by decide +kernel⟩

def target0 : Weights.Entry :=
  { word := [0, 1, 0, 2, 2, 2, 8], weights := [1, 0, 0, 1] }

-- Period 9, original row 125, representative 9108.
def source1 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B018.Data.entryAt ⟨53, by decide +kernel⟩

def target1 : Weights.Entry :=
  { word := [0, 1, 0, 2, 2, 10, 8], weights := [1, 0, 0, 1] }

-- Period 9, original row 134, representative 9141.
def source2 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B018.Data.entryAt ⟨86, by decide +kernel⟩

def target2 : Weights.Entry :=
  { word := [0, 1, 0, 10, 2, 2, 8], weights := [1, 0, 0, 1] }

-- Period 9, original row 135, representative 9113.
def source3 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B018.Data.entryAt ⟨58, by decide +kernel⟩

def target3 : Weights.Entry :=
  { word := [0, 1, 0, 10, 2, 10, 8], weights := [1, 0, 0, 1] }

-- Period 9, original row 145, representative 9128.
def source4 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B018.Data.entryAt ⟨73, by decide +kernel⟩

def target4 : Weights.Entry :=
  { word := [0, 1, 4, 2, 0, 1, 8], weights := [1, 0, 0, 1] }

-- Period 9, original row 147, representative 9128.
def source5 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B018.Data.entryAt ⟨73, by decide +kernel⟩

def target5 : Weights.Entry :=
  { word := [0, 1, 4, 2, 0, 2, 8], weights := [1, 0, 0, 1] }

def points5 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 8), (8, 7)]

-- Period 9, original row 152, representative 9146.
def source6 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B018.Data.entryAt ⟨91, by decide +kernel⟩

def target6 : Weights.Entry :=
  { word := [0, 1, 4, 2, 0, 8, 8], weights := [1, 0, 0, 1] }

-- Period 9, original row 157, representative 9100.
def source7 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B018.Data.entryAt ⟨45, by decide +kernel⟩

def target7 : Weights.Entry :=
  { word := [0, 1, 4, 2, 0, 9, 8], weights := [1, 0, 0, 1] }

-- Period 9, original row 159, representative 9100.
def source8 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B018.Data.entryAt ⟨45, by decide +kernel⟩

def target8 : Weights.Entry :=
  { word := [0, 1, 4, 2, 0, 10, 8], weights := [1, 0, 0, 1] }

def points8 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 8), (8, 7)]

-- Period 9, original row 161, representative 9133.
def source9 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B018.Data.entryAt ⟨78, by decide +kernel⟩

def target9 : Weights.Entry :=
  { word := [0, 1, 4, 2, 8, 2, 8], weights := [1, 0, 0, 1] }

-- Period 9, original row 165, representative 9105.
def source10 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B018.Data.entryAt ⟨50, by decide +kernel⟩

def target10 : Weights.Entry :=
  { word := [0, 1, 4, 2, 8, 10, 8], weights := [1, 0, 0, 1] }

-- Period 9, original row 167, representative 9128.
def source11 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B018.Data.entryAt ⟨73, by decide +kernel⟩

def target11 : Weights.Entry :=
  { word := [0, 1, 4, 4, 4, 0, 8], weights := [1, 0, 0, 1] }

def points11 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 5), (5, 4), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 169, representative 9124.
def source12 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B018.Data.entryAt ⟨69, by decide +kernel⟩

def target12 : Weights.Entry :=
  { word := [0, 1, 4, 4, 4, 8, 8], weights := [0, 0, 1, 0] }

-- Period 9, original row 171, representative 9123.
def source13 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B018.Data.entryAt ⟨68, by decide +kernel⟩

def target13 : Weights.Entry :=
  { word := [0, 1, 4, 8, 4, 2, 8], weights := [0, 1, 1, 0] }

-- Period 9, original row 173, representative 9099.
def source14 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B018.Data.entryAt ⟨44, by decide +kernel⟩

def target14 : Weights.Entry :=
  { word := [0, 1, 4, 8, 4, 10, 8], weights := [0, 1, 1, 0] }

-- Period 9, original row 174, representative 9135.
def source15 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B018.Data.entryAt ⟨80, by decide +kernel⟩

def target15 : Weights.Entry :=
  { word := [0, 1, 4, 10, 0, 1, 8], weights := [1, 0, 0, 1] }

-- Period 9, original row 175, representative 9135.
def source16 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B018.Data.entryAt ⟨80, by decide +kernel⟩

def target16 : Weights.Entry :=
  { word := [0, 1, 4, 10, 0, 2, 8], weights := [1, 0, 0, 1] }

def points16 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 8), (8, 7)]

-- Period 9, original row 180, representative 9149.
def source17 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B018.Data.entryAt ⟨94, by decide +kernel⟩

def target17 : Weights.Entry :=
  { word := [0, 1, 4, 10, 0, 8, 8], weights := [1, 0, 0, 1] }

-- Period 9, original row 184, representative 9107.
def source18 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B018.Data.entryAt ⟨52, by decide +kernel⟩

def target18 : Weights.Entry :=
  { word := [0, 1, 4, 10, 0, 9, 8], weights := [1, 0, 0, 1] }

-- Period 9, original row 185, representative 9107.
def source19 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B018.Data.entryAt ⟨52, by decide +kernel⟩

def target19 : Weights.Entry :=
  { word := [0, 1, 4, 10, 0, 10, 8], weights := [1, 0, 0, 1] }

def points19 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 8), (8, 7)]

-- Period 9, original row 191, representative 9134.
def source20 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B018.Data.entryAt ⟨79, by decide +kernel⟩

def target20 : Weights.Entry :=
  { word := [0, 1, 4, 10, 8, 2, 8], weights := [0, 1, 1, 0] }

-- Period 9, original row 196, representative 9106.
def source21 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B018.Data.entryAt ⟨51, by decide +kernel⟩

def target21 : Weights.Entry :=
  { word := [0, 1, 4, 10, 8, 10, 8], weights := [0, 1, 1, 0] }

-- Period 9, original row 199, representative 9135.
def source22 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B018.Data.entryAt ⟨80, by decide +kernel⟩

def target22 : Weights.Entry :=
  { word := [0, 1, 4, 12, 4, 0, 8], weights := [1, 0, 0, 1] }

def points22 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 5), (5, 4), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 201, representative 9127.
def source23 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B018.Data.entryAt ⟨72, by decide +kernel⟩

def target23 : Weights.Entry :=
  { word := [0, 1, 4, 12, 4, 8, 8], weights := [0, 0, 1, 0] }

-- Period 9, original row 205, representative 9137.
def source24 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B018.Data.entryAt ⟨82, by decide +kernel⟩

def target24 : Weights.Entry :=
  { word := [0, 1, 8, 2, 2, 2, 8], weights := [1, 0, 0, 1] }

-- Period 9, original row 207, representative 9109.
def source25 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B018.Data.entryAt ⟨54, by decide +kernel⟩

def target25 : Weights.Entry :=
  { word := [0, 1, 8, 2, 2, 10, 8], weights := [1, 0, 0, 1] }

-- Period 9, original row 209, representative 9138.
def source26 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B018.Data.entryAt ⟨83, by decide +kernel⟩

def target26 : Weights.Entry :=
  { word := [0, 1, 8, 2, 10, 2, 8], weights := [1, 0, 0, 1] }

-- Period 9, original row 211, representative 9110.
def source27 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B018.Data.entryAt ⟨55, by decide +kernel⟩

def target27 : Weights.Entry :=
  { word := [0, 1, 8, 2, 10, 10, 8], weights := [1, 0, 0, 1] }

-- Period 9, original row 225, representative 9140.
def source28 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B018.Data.entryAt ⟨85, by decide +kernel⟩

def target28 : Weights.Entry :=
  { word := [0, 1, 8, 10, 2, 2, 8], weights := [0, 1, 1, 0] }

-- Period 9, original row 226, representative 9112.
def source29 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B018.Data.entryAt ⟨57, by decide +kernel⟩

def target29 : Weights.Entry :=
  { word := [0, 1, 8, 10, 2, 10, 8], weights := [0, 1, 1, 0] }

-- Period 9, original row 227, representative 9139.
def source30 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B018.Data.entryAt ⟨84, by decide +kernel⟩

def target30 : Weights.Entry :=
  { word := [0, 1, 8, 10, 10, 2, 8], weights := [0, 1, 1, 0] }

-- Period 9, original row 228, representative 9111.
def source31 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B018.Data.entryAt ⟨56, by decide +kernel⟩

def target31 : Weights.Entry :=
  { word := [0, 1, 8, 10, 10, 10, 8], weights := [0, 1, 1, 0] }

-- Period 9, original row 234, representative 9129.
def source32 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B018.Data.entryAt ⟨74, by decide +kernel⟩

def target32 : Weights.Entry :=
  { word := [0, 1, 12, 2, 0, 1, 8], weights := [1, 0, 0, 1] }

-- Period 9, original row 236, representative 9129.
def source33 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B018.Data.entryAt ⟨74, by decide +kernel⟩

def target33 : Weights.Entry :=
  { word := [0, 1, 12, 2, 0, 2, 8], weights := [1, 0, 0, 1] }

def points33 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 8), (8, 7)]

-- Period 9, original row 241, representative 9147.
def source34 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B018.Data.entryAt ⟨92, by decide +kernel⟩

def target34 : Weights.Entry :=
  { word := [0, 1, 12, 2, 0, 8, 8], weights := [1, 0, 0, 1] }

-- Period 9, original row 246, representative 9101.
def source35 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B018.Data.entryAt ⟨46, by decide +kernel⟩

def target35 : Weights.Entry :=
  { word := [0, 1, 12, 2, 0, 9, 8], weights := [1, 0, 0, 1] }

-- Period 9, original row 248, representative 9101.
def source36 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B018.Data.entryAt ⟨46, by decide +kernel⟩

def target36 : Weights.Entry :=
  { word := [0, 1, 12, 2, 0, 10, 8], weights := [1, 0, 0, 1] }

def points36 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 8), (8, 7)]

-- Period 9, original row 250, representative 9130.
def source37 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B018.Data.entryAt ⟨75, by decide +kernel⟩

def target37 : Weights.Entry :=
  { word := [0, 1, 12, 2, 8, 2, 8], weights := [1, 0, 0, 1] }

-- Period 9, original row 254, representative 9102.
def source38 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B018.Data.entryAt ⟨47, by decide +kernel⟩

def target38 : Weights.Entry :=
  { word := [0, 1, 12, 2, 8, 10, 8], weights := [1, 0, 0, 1] }

-- Period 9, original row 256, representative 9129.
def source39 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B018.Data.entryAt ⟨74, by decide +kernel⟩

def target39 : Weights.Entry :=
  { word := [0, 1, 12, 4, 4, 0, 8], weights := [1, 0, 0, 1] }

def points39 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 5), (5, 4), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 258, representative 9125.
def source40 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B018.Data.entryAt ⟨70, by decide +kernel⟩

def target40 : Weights.Entry :=
  { word := [0, 1, 12, 4, 4, 8, 8], weights := [0, 0, 1, 0] }

-- Period 9, original row 260, representative 9122.
def source41 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B018.Data.entryAt ⟨67, by decide +kernel⟩

def target41 : Weights.Entry :=
  { word := [0, 1, 12, 8, 4, 2, 8], weights := [0, 1, 1, 0] }

-- Period 9, original row 262, representative 9098.
def source42 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B018.Data.entryAt ⟨43, by decide +kernel⟩

def target42 : Weights.Entry :=
  { word := [0, 1, 12, 8, 4, 10, 8], weights := [0, 1, 1, 0] }

-- Period 9, original row 263, representative 9132.
def source43 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B018.Data.entryAt ⟨77, by decide +kernel⟩

def target43 : Weights.Entry :=
  { word := [0, 1, 12, 10, 0, 1, 8], weights := [1, 0, 0, 1] }

-- Period 9, original row 264, representative 9132.
def source44 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B018.Data.entryAt ⟨77, by decide +kernel⟩

def target44 : Weights.Entry :=
  { word := [0, 1, 12, 10, 0, 2, 8], weights := [1, 0, 0, 1] }

def points44 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 8), (8, 7)]

-- Period 9, original row 273, representative 9148.
def source45 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B018.Data.entryAt ⟨93, by decide +kernel⟩

def target45 : Weights.Entry :=
  { word := [0, 1, 12, 10, 0, 8, 8], weights := [1, 0, 0, 1] }

-- Period 9, original row 277, representative 9104.
def source46 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B018.Data.entryAt ⟨49, by decide +kernel⟩

def target46 : Weights.Entry :=
  { word := [0, 1, 12, 10, 0, 9, 8], weights := [1, 0, 0, 1] }

-- Period 9, original row 278, representative 9104.
def source47 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B018.Data.entryAt ⟨49, by decide +kernel⟩

def target47 : Weights.Entry :=
  { word := [0, 1, 12, 10, 0, 10, 8], weights := [1, 0, 0, 1] }

def points47 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 8), (8, 7)]

-- Period 9, original row 284, representative 9131.
def source48 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B018.Data.entryAt ⟨76, by decide +kernel⟩

def target48 : Weights.Entry :=
  { word := [0, 1, 12, 10, 8, 2, 8], weights := [0, 1, 1, 0] }

-- Period 9, original row 289, representative 9103.
def source49 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B018.Data.entryAt ⟨48, by decide +kernel⟩

def target49 : Weights.Entry :=
  { word := [0, 1, 12, 10, 8, 10, 8], weights := [0, 1, 1, 0] }

-- Period 9, original row 292, representative 9132.
def source50 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B018.Data.entryAt ⟨77, by decide +kernel⟩

def target50 : Weights.Entry :=
  { word := [0, 1, 12, 12, 4, 0, 8], weights := [1, 0, 0, 1] }

def points50 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 5), (5, 4), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 294, representative 9126.
def source51 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B018.Data.entryAt ⟨71, by decide +kernel⟩

def target51 : Weights.Entry :=
  { word := [0, 1, 12, 12, 4, 8, 8], weights := [0, 0, 1, 0] }

-- Period 9, original row 317, representative 9128.
def source52 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B018.Data.entryAt ⟨73, by decide +kernel⟩

def target52 : Weights.Entry :=
  { word := [0, 2, 2, 2, 0, 1, 8], weights := [0, 1, 0, 1] }

def points52 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 319, representative 9128.
def source53 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B018.Data.entryAt ⟨73, by decide +kernel⟩

def target53 : Weights.Entry :=
  { word := [0, 2, 2, 2, 0, 2, 8], weights := [0, 1, 0, 1] }

def points53 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6), (7, 8), (8, 7)]

-- Period 9, original row 324, representative 9146.
def source54 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B018.Data.entryAt ⟨91, by decide +kernel⟩

def target54 : Weights.Entry :=
  { word := [0, 2, 2, 2, 0, 8, 8], weights := [0, 1, 0, 1] }

def points54 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 329, representative 9100.
def source55 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B018.Data.entryAt ⟨45, by decide +kernel⟩

def target55 : Weights.Entry :=
  { word := [0, 2, 2, 2, 0, 9, 8], weights := [0, 1, 0, 1] }

def points55 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 331, representative 9100.
def source56 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B018.Data.entryAt ⟨45, by decide +kernel⟩

def target56 : Weights.Entry :=
  { word := [0, 2, 2, 2, 0, 10, 8], weights := [0, 1, 0, 1] }

def points56 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6), (7, 8), (8, 7)]

-- Period 9, original row 335, representative 9150.
def source57 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B018.Data.entryAt ⟨95, by decide +kernel⟩

def target57 : Weights.Entry :=
  { word := [0, 2, 2, 2, 8, 0, 8], weights := [1, 1, 0, 0] }

-- Period 9, original row 340, representative 9114.
def source58 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B018.Data.entryAt ⟨59, by decide +kernel⟩

def target58 : Weights.Entry :=
  { word := [0, 2, 2, 2, 8, 1, 8], weights := [1, 0, 0, 1] }

-- Period 9, original row 342, representative 9118.
def source59 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B018.Data.entryAt ⟨63, by decide +kernel⟩

def target59 : Weights.Entry :=
  { word := [0, 2, 2, 2, 8, 2, 8], weights := [1, 0, 0, 1] }

-- Period 9, original row 352, representative 9142.
def source60 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B018.Data.entryAt ⟨87, by decide +kernel⟩

def target60 : Weights.Entry :=
  { word := [0, 2, 2, 2, 8, 8, 8], weights := [1, 0, 0, 1] }

-- Period 9, original row 357, representative 9090.
def source61 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B018.Data.entryAt ⟨35, by decide +kernel⟩

def target61 : Weights.Entry :=
  { word := [0, 2, 2, 2, 8, 9, 8], weights := [1, 0, 0, 1] }

-- Period 9, original row 359, representative 9094.
def source62 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B018.Data.entryAt ⟨39, by decide +kernel⟩

def target62 : Weights.Entry :=
  { word := [0, 2, 2, 2, 8, 10, 8], weights := [1, 0, 0, 1] }

-- Period 9, original row 366, representative 9135.
def source63 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B018.Data.entryAt ⟨80, by decide +kernel⟩

def target63 : Weights.Entry :=
  { word := [0, 2, 2, 10, 0, 1, 8], weights := [0, 1, 0, 1] }

def points63 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 367, representative 9135.
def source64 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B018.Data.entryAt ⟨80, by decide +kernel⟩

def target64 : Weights.Entry :=
  { word := [0, 2, 2, 10, 0, 2, 8], weights := [0, 1, 0, 1] }

def points64 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6), (7, 8), (8, 7)]

-- Period 9, original row 372, representative 9149.
def source65 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B018.Data.entryAt ⟨94, by decide +kernel⟩

def target65 : Weights.Entry :=
  { word := [0, 2, 2, 10, 0, 8, 8], weights := [0, 1, 0, 1] }

def points65 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 376, representative 9107.
def source66 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B018.Data.entryAt ⟨52, by decide +kernel⟩

def target66 : Weights.Entry :=
  { word := [0, 2, 2, 10, 0, 9, 8], weights := [0, 1, 0, 1] }

def points66 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 377, representative 9107.
def source67 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B018.Data.entryAt ⟨52, by decide +kernel⟩

def target67 : Weights.Entry :=
  { word := [0, 2, 2, 10, 0, 10, 8], weights := [0, 1, 0, 1] }

def points67 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6), (7, 8), (8, 7)]

-- Period 9, original row 386, representative 9151.
def source68 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B018.Data.entryAt ⟨96, by decide +kernel⟩

def target68 : Weights.Entry :=
  { word := [0, 2, 2, 10, 8, 0, 8], weights := [1, 1, 0, 0] }

-- Period 9, original row 390, representative 9117.
def source69 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B018.Data.entryAt ⟨62, by decide +kernel⟩

def target69 : Weights.Entry :=
  { word := [0, 2, 2, 10, 8, 1, 8], weights := [0, 1, 1, 0] }

-- Period 9, original row 391, representative 9121.
def source70 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B018.Data.entryAt ⟨66, by decide +kernel⟩

def target70 : Weights.Entry :=
  { word := [0, 2, 2, 10, 8, 2, 8], weights := [0, 1, 1, 0] }

-- Period 9, original row 400, representative 9145.
def source71 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B018.Data.entryAt ⟨90, by decide +kernel⟩

def target71 : Weights.Entry :=
  { word := [0, 2, 2, 10, 8, 8, 8], weights := [0, 1, 1, 0] }

-- Period 9, original row 404, representative 9093.
def source72 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B018.Data.entryAt ⟨38, by decide +kernel⟩

def target72 : Weights.Entry :=
  { word := [0, 2, 2, 10, 8, 9, 8], weights := [0, 1, 1, 0] }

-- Period 9, original row 405, representative 9097.
def source73 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B018.Data.entryAt ⟨42, by decide +kernel⟩

def target73 : Weights.Entry :=
  { word := [0, 2, 2, 10, 8, 10, 8], weights := [0, 1, 1, 0] }

-- Period 9, original row 422, representative 9129.
def source74 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B018.Data.entryAt ⟨74, by decide +kernel⟩

def target74 : Weights.Entry :=
  { word := [0, 2, 10, 2, 0, 1, 8], weights := [0, 1, 0, 1] }

def points74 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 424, representative 9129.
def source75 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B018.Data.entryAt ⟨74, by decide +kernel⟩

def target75 : Weights.Entry :=
  { word := [0, 2, 10, 2, 0, 2, 8], weights := [0, 1, 0, 1] }

def points75 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6), (7, 8), (8, 7)]

-- Period 9, original row 429, representative 9147.
def source76 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B018.Data.entryAt ⟨92, by decide +kernel⟩

def target76 : Weights.Entry :=
  { word := [0, 2, 10, 2, 0, 8, 8], weights := [0, 1, 0, 1] }

def points76 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 434, representative 9101.
def source77 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B018.Data.entryAt ⟨46, by decide +kernel⟩

def target77 : Weights.Entry :=
  { word := [0, 2, 10, 2, 0, 9, 8], weights := [0, 1, 0, 1] }

def points77 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 436, representative 9101.
def source78 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B018.Data.entryAt ⟨46, by decide +kernel⟩

def target78 : Weights.Entry :=
  { word := [0, 2, 10, 2, 0, 10, 8], weights := [0, 1, 0, 1] }

def points78 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6), (7, 8), (8, 7)]

-- Period 9, original row 438, representative 9115.
def source79 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B018.Data.entryAt ⟨60, by decide +kernel⟩

def target79 : Weights.Entry :=
  { word := [0, 2, 10, 2, 8, 1, 8], weights := [1, 0, 0, 1] }

-- Period 9, original row 440, representative 9119.
def source80 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B018.Data.entryAt ⟨64, by decide +kernel⟩

def target80 : Weights.Entry :=
  { word := [0, 2, 10, 2, 8, 2, 8], weights := [1, 0, 0, 1] }

-- Period 9, original row 450, representative 9143.
def source81 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B018.Data.entryAt ⟨88, by decide +kernel⟩

def target81 : Weights.Entry :=
  { word := [0, 2, 10, 2, 8, 8, 8], weights := [1, 0, 0, 1] }

-- Period 9, original row 455, representative 9091.
def source82 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B018.Data.entryAt ⟨36, by decide +kernel⟩

def target82 : Weights.Entry :=
  { word := [0, 2, 10, 2, 8, 9, 8], weights := [1, 0, 0, 1] }

-- Period 9, original row 457, representative 9095.
def source83 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B018.Data.entryAt ⟨40, by decide +kernel⟩

def target83 : Weights.Entry :=
  { word := [0, 2, 10, 2, 8, 10, 8], weights := [1, 0, 0, 1] }

-- Period 9, original row 464, representative 9132.
def source84 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B018.Data.entryAt ⟨77, by decide +kernel⟩

def target84 : Weights.Entry :=
  { word := [0, 2, 10, 10, 0, 1, 8], weights := [0, 1, 0, 1] }

def points84 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 465, representative 9132.
def source85 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B018.Data.entryAt ⟨77, by decide +kernel⟩

def target85 : Weights.Entry :=
  { word := [0, 2, 10, 10, 0, 2, 8], weights := [0, 1, 0, 1] }

def points85 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6), (7, 8), (8, 7)]

-- Period 9, original row 474, representative 9148.
def source86 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B018.Data.entryAt ⟨93, by decide +kernel⟩

def target86 : Weights.Entry :=
  { word := [0, 2, 10, 10, 0, 8, 8], weights := [0, 1, 0, 1] }

def points86 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 478, representative 9104.
def source87 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B018.Data.entryAt ⟨49, by decide +kernel⟩

def target87 : Weights.Entry :=
  { word := [0, 2, 10, 10, 0, 9, 8], weights := [0, 1, 0, 1] }

def points87 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 479, representative 9104.
def source88 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B018.Data.entryAt ⟨49, by decide +kernel⟩

def target88 : Weights.Entry :=
  { word := [0, 2, 10, 10, 0, 10, 8], weights := [0, 1, 0, 1] }

def points88 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6), (7, 8), (8, 7)]

-- Period 9, original row 485, representative 9116.
def source89 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B018.Data.entryAt ⟨61, by decide +kernel⟩

def target89 : Weights.Entry :=
  { word := [0, 2, 10, 10, 8, 1, 8], weights := [0, 1, 1, 0] }

-- Period 9, original row 486, representative 9120.
def source90 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B018.Data.entryAt ⟨65, by decide +kernel⟩

def target90 : Weights.Entry :=
  { word := [0, 2, 10, 10, 8, 2, 8], weights := [0, 1, 1, 0] }

-- Period 9, original row 495, representative 9144.
def source91 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B018.Data.entryAt ⟨89, by decide +kernel⟩

def target91 : Weights.Entry :=
  { word := [0, 2, 10, 10, 8, 8, 8], weights := [0, 1, 1, 0] }

-- Period 9, original row 499, representative 9092.
def source92 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B018.Data.entryAt ⟨37, by decide +kernel⟩

def target92 : Weights.Entry :=
  { word := [0, 2, 10, 10, 8, 9, 8], weights := [0, 1, 1, 0] }

-- Period 9, original row 500, representative 9096.
def source93 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B018.Data.entryAt ⟨41, by decide +kernel⟩

def target93 : Weights.Entry :=
  { word := [0, 2, 10, 10, 8, 10, 8], weights := [0, 1, 1, 0] }

-- Period 9, original row 585, representative 9167.
def source94 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B018.Data.entryAt ⟨112, by decide +kernel⟩

def target94 : Weights.Entry :=
  { word := [0, 4, 2, 8, 2, 8, 2], weights := [0, 1, 1, 0] }

-- Period 9, original row 599, representative 9155.
def source95 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B018.Data.entryAt ⟨100, by decide +kernel⟩

def target95 : Weights.Entry :=
  { word := [0, 4, 2, 8, 10, 8, 2], weights := [0, 1, 1, 0] }

-- Period 9, original row 642, representative 9174.
def source96 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B018.Data.entryAt ⟨119, by decide +kernel⟩

def target96 : Weights.Entry :=
  { word := [0, 4, 8, 4, 2, 8, 2], weights := [0, 0, 1, 0] }

-- Period 9, original row 668, representative 9162.
def source97 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B018.Data.entryAt ⟨107, by decide +kernel⟩

def target97 : Weights.Entry :=
  { word := [0, 4, 8, 4, 10, 8, 2], weights := [0, 0, 1, 0] }

-- Period 9, original row 669, representative 9182.
def source98 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B018.Data.entryAt ⟨127, by decide +kernel⟩

def target98 : Weights.Entry :=
  { word := [0, 4, 8, 4, 10, 8, 4], weights := [1, 0, 0, 1] }

-- Period 9, original row 705, representative 9166.
def source99 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B018.Data.entryAt ⟨111, by decide +kernel⟩

def target99 : Weights.Entry :=
  { word := [0, 4, 10, 8, 2, 8, 2], weights := [0, 1, 1, 0] }

-- Period 9, original row 714, representative 9154.
def source100 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B018.Data.entryAt ⟨99, by decide +kernel⟩

def target100 : Weights.Entry :=
  { word := [0, 4, 10, 8, 10, 8, 2], weights := [0, 1, 1, 0] }

-- Period 9, original row 820, representative 9175.
def source101 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B018.Data.entryAt ⟨120, by decide +kernel⟩

def target101 : Weights.Entry :=
  { word := [0, 8, 0, 4, 2, 8, 2], weights := [0, 0, 1, 0] }

-- Period 9, original row 846, representative 9163.
def source102 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B018.Data.entryAt ⟨108, by decide +kernel⟩

def target102 : Weights.Entry :=
  { word := [0, 8, 0, 4, 10, 8, 2], weights := [0, 0, 1, 0] }

-- Period 9, original row 899, representative 9172.
def source103 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B018.Data.entryAt ⟨117, by decide +kernel⟩

def target103 : Weights.Entry :=
  { word := [0, 8, 1, 4, 2, 8, 2], weights := [0, 0, 1, 0] }

-- Period 9, original row 921, representative 9160.
def source104 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B018.Data.entryAt ⟨105, by decide +kernel⟩

def target104 : Weights.Entry :=
  { word := [0, 8, 1, 4, 10, 8, 2], weights := [0, 0, 1, 0] }

-- Period 9, original row 922, representative 9180.
def source105 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B018.Data.entryAt ⟨125, by decide +kernel⟩

def target105 : Weights.Entry :=
  { word := [0, 8, 1, 4, 10, 8, 4], weights := [1, 0, 0, 1] }

-- Period 9, original row 947, representative 9168.
def source106 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B018.Data.entryAt ⟨113, by decide +kernel⟩

def target106 : Weights.Entry :=
  { word := [0, 8, 2, 2, 2, 8, 2], weights := [0, 1, 0, 0] }

-- Period 9, original row 962, representative 9156.
def source107 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B018.Data.entryAt ⟨101, by decide +kernel⟩

def target107 : Weights.Entry :=
  { word := [0, 8, 2, 2, 10, 8, 2], weights := [0, 1, 0, 0] }

-- Period 9, original row 963, representative 9176.
def source108 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B018.Data.entryAt ⟨121, by decide +kernel⟩

def target108 : Weights.Entry :=
  { word := [0, 8, 2, 2, 10, 8, 4], weights := [1, 0, 0, 1] }

-- Period 9, original row 976, representative 9171.
def source109 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B018.Data.entryAt ⟨116, by decide +kernel⟩

def target109 : Weights.Entry :=
  { word := [0, 8, 2, 10, 2, 8, 2], weights := [0, 1, 0, 0] }

-- Period 9, original row 990, representative 9159.
def source110 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B018.Data.entryAt ⟨104, by decide +kernel⟩

def target110 : Weights.Entry :=
  { word := [0, 8, 2, 10, 10, 8, 2], weights := [0, 1, 0, 0] }

-- Period 9, original row 991, representative 9179.
def source111 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B018.Data.entryAt ⟨124, by decide +kernel⟩

def target111 : Weights.Entry :=
  { word := [0, 8, 2, 10, 10, 8, 4], weights := [1, 0, 0, 1] }

-- Period 9, original row 1082, representative 9169.
def source112 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B018.Data.entryAt ⟨114, by decide +kernel⟩

def target112 : Weights.Entry :=
  { word := [0, 8, 10, 2, 2, 8, 2], weights := [0, 1, 0, 0] }

-- Period 9, original row 1090, representative 9157.
def source113 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B018.Data.entryAt ⟨102, by decide +kernel⟩

def target113 : Weights.Entry :=
  { word := [0, 8, 10, 2, 10, 8, 2], weights := [0, 1, 0, 0] }

-- Period 9, original row 1091, representative 9177.
def source114 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B018.Data.entryAt ⟨122, by decide +kernel⟩

def target114 : Weights.Entry :=
  { word := [0, 8, 10, 2, 10, 8, 4], weights := [1, 0, 0, 1] }

-- Period 9, original row 1097, representative 9170.
def source115 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B018.Data.entryAt ⟨115, by decide +kernel⟩

def target115 : Weights.Entry :=
  { word := [0, 8, 10, 10, 2, 8, 2], weights := [0, 1, 0, 0] }

-- Period 9, original row 1104, representative 9158.
def source116 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B018.Data.entryAt ⟨103, by decide +kernel⟩

def target116 : Weights.Entry :=
  { word := [0, 8, 10, 10, 10, 8, 2], weights := [0, 1, 0, 0] }

-- Period 9, original row 1105, representative 9178.
def source117 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B018.Data.entryAt ⟨123, by decide +kernel⟩

def target117 : Weights.Entry :=
  { word := [0, 8, 10, 10, 10, 8, 4], weights := [1, 0, 0, 1] }

-- Period 9, original row 1139, representative 9068.
def source118 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B018.Data.entryAt ⟨13, by decide +kernel⟩

def target118 : Weights.Entry :=
  { word := [0, 9, 0, 2, 2, 2, 8], weights := [1, 0, 0, 1] }

-- Period 9, original row 1143, representative 9073.
def source119 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B018.Data.entryAt ⟨18, by decide +kernel⟩

def target119 : Weights.Entry :=
  { word := [0, 9, 0, 2, 10, 2, 8], weights := [1, 0, 0, 1] }

-- Period 9, original row 1145, representative 9057.
def source120 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B018.Data.entryAt ⟨2, by decide +kernel⟩

def target120 : Weights.Entry :=
  { word := [0, 9, 0, 2, 10, 10, 8], weights := [1, 0, 0, 1] }

-- Period 9, original row 1153, representative 9086.
def source121 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B018.Data.entryAt ⟨31, by decide +kernel⟩

def target121 : Weights.Entry :=
  { word := [0, 9, 0, 4, 2, 0, 8], weights := [1, 0, 1, 0] }

-- Period 9, original row 1159, representative 9082.
def source122 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B018.Data.entryAt ⟨27, by decide +kernel⟩

def target122 : Weights.Entry :=
  { word := [0, 9, 0, 4, 2, 8, 8], weights := [1, 0, 1, 0] }

-- Period 9, original row 1179, representative 9087.
def source123 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B018.Data.entryAt ⟨32, by decide +kernel⟩

def target123 : Weights.Entry :=
  { word := [0, 9, 0, 4, 10, 0, 8], weights := [1, 0, 1, 0] }

-- Period 9, original row 1185, representative 9083.
def source124 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B018.Data.entryAt ⟨28, by decide +kernel⟩

def target124 : Weights.Entry :=
  { word := [0, 9, 0, 4, 10, 8, 8], weights := [1, 0, 1, 0] }

-- Period 9, original row 1198, representative 9075.
def source125 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B018.Data.entryAt ⟨20, by decide +kernel⟩

def target125 : Weights.Entry :=
  { word := [0, 9, 0, 10, 2, 2, 8], weights := [1, 0, 0, 1] }

-- Period 9, original row 1199, representative 9059.
def source126 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B018.Data.entryAt ⟨4, by decide +kernel⟩

def target126 : Weights.Entry :=
  { word := [0, 9, 0, 10, 2, 10, 8], weights := [1, 0, 0, 1] }

-- Period 9, original row 1200, representative 9074.
def source127 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B018.Data.entryAt ⟨19, by decide +kernel⟩

def target127 : Weights.Entry :=
  { word := [0, 9, 0, 10, 10, 2, 8], weights := [1, 0, 0, 1] }

def period9Entries : List Weights.Entry := [target0, target1, target2, target3, target4, target5, target6, target7, target8, target9, target10, target11, target12, target13, target14, target15, target16, target17, target18, target19, target20, target21, target22, target23, target24, target25, target26, target27, target28, target29, target30, target31, target32, target33, target34, target35, target36, target37, target38, target39, target40, target41, target42, target43, target44, target45, target46, target47, target48, target49, target50, target51, target52, target53, target54, target55, target56, target57, target58, target59, target60, target61, target62, target63, target64, target65, target66, target67, target68, target69, target70, target71, target72, target73, target74, target75, target76, target77, target78, target79, target80, target81, target82, target83, target84, target85, target86, target87, target88, target89, target90, target91, target92, target93, target94, target95, target96, target97, target98, target99, target100, target101, target102, target103, target104, target105, target106, target107, target108, target109, target110, target111, target112, target113, target114, target115, target116, target117, target118, target119, target120, target121, target122, target123, target124, target125, target126, target127]

def period9Chunk : RowCoverage.Chunk where
  rows := [⟨123, target0⟩, ⟨125, target1⟩, ⟨134, target2⟩, ⟨135, target3⟩, ⟨145, target4⟩, ⟨147, target5⟩, ⟨152, target6⟩, ⟨157, target7⟩, ⟨159, target8⟩, ⟨161, target9⟩, ⟨165, target10⟩, ⟨167, target11⟩, ⟨169, target12⟩, ⟨171, target13⟩, ⟨173, target14⟩, ⟨174, target15⟩, ⟨175, target16⟩, ⟨180, target17⟩, ⟨184, target18⟩, ⟨185, target19⟩, ⟨191, target20⟩, ⟨196, target21⟩, ⟨199, target22⟩, ⟨201, target23⟩, ⟨205, target24⟩, ⟨207, target25⟩, ⟨209, target26⟩, ⟨211, target27⟩, ⟨225, target28⟩, ⟨226, target29⟩, ⟨227, target30⟩, ⟨228, target31⟩, ⟨234, target32⟩, ⟨236, target33⟩, ⟨241, target34⟩, ⟨246, target35⟩, ⟨248, target36⟩, ⟨250, target37⟩, ⟨254, target38⟩, ⟨256, target39⟩, ⟨258, target40⟩, ⟨260, target41⟩, ⟨262, target42⟩, ⟨263, target43⟩, ⟨264, target44⟩, ⟨273, target45⟩, ⟨277, target46⟩, ⟨278, target47⟩, ⟨284, target48⟩, ⟨289, target49⟩, ⟨292, target50⟩, ⟨294, target51⟩, ⟨317, target52⟩, ⟨319, target53⟩, ⟨324, target54⟩, ⟨329, target55⟩, ⟨331, target56⟩, ⟨335, target57⟩, ⟨340, target58⟩, ⟨342, target59⟩, ⟨352, target60⟩, ⟨357, target61⟩, ⟨359, target62⟩, ⟨366, target63⟩, ⟨367, target64⟩, ⟨372, target65⟩, ⟨376, target66⟩, ⟨377, target67⟩, ⟨386, target68⟩, ⟨390, target69⟩, ⟨391, target70⟩, ⟨400, target71⟩, ⟨404, target72⟩, ⟨405, target73⟩, ⟨422, target74⟩, ⟨424, target75⟩, ⟨429, target76⟩, ⟨434, target77⟩, ⟨436, target78⟩, ⟨438, target79⟩, ⟨440, target80⟩, ⟨450, target81⟩, ⟨455, target82⟩, ⟨457, target83⟩, ⟨464, target84⟩, ⟨465, target85⟩, ⟨474, target86⟩, ⟨478, target87⟩, ⟨479, target88⟩, ⟨485, target89⟩, ⟨486, target90⟩, ⟨495, target91⟩, ⟨499, target92⟩, ⟨500, target93⟩, ⟨585, target94⟩, ⟨599, target95⟩, ⟨642, target96⟩, ⟨668, target97⟩, ⟨669, target98⟩, ⟨705, target99⟩, ⟨714, target100⟩, ⟨820, target101⟩, ⟨846, target102⟩, ⟨899, target103⟩, ⟨921, target104⟩, ⟨922, target105⟩, ⟨947, target106⟩, ⟨962, target107⟩, ⟨963, target108⟩, ⟨976, target109⟩, ⟨990, target110⟩, ⟨991, target111⟩, ⟨1082, target112⟩, ⟨1090, target113⟩, ⟨1091, target114⟩, ⟨1097, target115⟩, ⟨1104, target116⟩, ⟨1105, target117⟩, ⟨1139, target118⟩, ⟨1143, target119⟩, ⟨1145, target120⟩, ⟨1153, target121⟩, ⟨1159, target122⟩, ⟨1179, target123⟩, ⟨1185, target124⟩, ⟨1198, target125⟩, ⟨1199, target126⟩, ⟨1200, target127⟩]
  indexMask := 30132872725385833110589856526098823980317225513334262860141229516976818592435206152031832983468964953549815628806435115767797001200658896730613946976540510338081744963286841556900369152056415805463040421535081943169617244477982137976529777905363853665484746016909496510977495771948784389286754704512707853320756822806046853932136743905035318254511610699467194368
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

end FranklSmallCyclic.TransportBatches.G071.B000.Data
