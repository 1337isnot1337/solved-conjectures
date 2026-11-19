module

public import Conjectures.FranklSmallCyclicRowCoverage
public import Conjectures.FranklSmallCyclicCanonicalWords
public import Conjectures.FranklSmallCyclicOrbit10Block009Data

/-! 74 literal targets sharing one source proof block.
Original words and row indices are retained; weights may be transported.
-/
@[expose] public section

namespace FranklSmallCyclic.TransportBatches.G087.B001.Data

-- Period 10, original row 6573, representative 10071.
def source0 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B009.Data.entryAt ⟨47, by decide +kernel⟩

def target0 : Weights.Entry :=
  { word := [8, 12, 10, 0, 1, 8, 9], weights := [0, 1, 2, 1] }

def points0 : List (ℕ × ℕ) := [(0, 9), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 6576, representative 10070.
def source1 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B009.Data.entryAt ⟨46, by decide +kernel⟩

def target1 : Weights.Entry :=
  { word := [8, 12, 10, 0, 9, 8, 9], weights := [0, 1, 2, 1] }

def points1 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 7145, representative 10077.
def source2 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B009.Data.entryAt ⟨53, by decide +kernel⟩

def target2 : Weights.Entry :=
  { word := [9, 8, 2, 2, 2, 8, 9], weights := [1, 0, 0, 1] }

def points2 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8), (9, 9)]

-- Period 10, original row 7160, representative 10078.
def source3 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B009.Data.entryAt ⟨54, by decide +kernel⟩

def target3 : Weights.Entry :=
  { word := [9, 8, 2, 2, 10, 8, 9], weights := [1, 0, 0, 1] }

def points3 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8), (9, 9)]

-- Period 10, original row 7174, representative 10084.
def source4 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B009.Data.entryAt ⟨60, by decide +kernel⟩

def target4 : Weights.Entry :=
  { word := [9, 8, 2, 10, 2, 8, 9], weights := [0, 1, 1, 0] }

def points4 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8), (9, 9)]

-- Period 10, original row 7188, representative 10081.
def source5 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B009.Data.entryAt ⟨57, by decide +kernel⟩

def target5 : Weights.Entry :=
  { word := [9, 8, 2, 10, 10, 8, 9], weights := [0, 1, 1, 0] }

def points5 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8), (9, 9)]

-- Period 10, original row 7257, representative 10082.
def source6 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B009.Data.entryAt ⟨58, by decide +kernel⟩

def target6 : Weights.Entry :=
  { word := [9, 8, 10, 2, 2, 8, 9], weights := [1, 0, 0, 1] }

def points6 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8), (9, 9)]

-- Period 10, original row 7265, representative 10079.
def source7 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B009.Data.entryAt ⟨55, by decide +kernel⟩

def target7 : Weights.Entry :=
  { word := [9, 8, 10, 2, 10, 8, 9], weights := [1, 0, 0, 1] }

def points7 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8), (9, 9)]

-- Period 10, original row 7272, representative 10083.
def source8 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B009.Data.entryAt ⟨59, by decide +kernel⟩

def target8 : Weights.Entry :=
  { word := [9, 8, 10, 10, 2, 8, 9], weights := [0, 1, 1, 0] }

def points8 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8), (9, 9)]

-- Period 10, original row 7279, representative 10080.
def source9 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B009.Data.entryAt ⟨56, by decide +kernel⟩

def target9 : Weights.Entry :=
  { word := [9, 8, 10, 10, 10, 8, 9], weights := [0, 1, 1, 0] }

def points9 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8), (9, 9)]

-- Period 10, original row 7427, representative 10059.
def source10 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B009.Data.entryAt ⟨35, by decide +kernel⟩

def target10 : Weights.Entry :=
  { word := [10, 0, 4, 2, 0, 8, 2], weights := [1, 0, 0, 1] }

def points10 : List (ℕ × ℕ) := [(0, 9), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 0), (9, 1)]

-- Period 10, original row 7428, representative 10059.
def source11 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B009.Data.entryAt ⟨35, by decide +kernel⟩

def target11 : Weights.Entry :=
  { word := [10, 0, 4, 2, 0, 8, 4], weights := [1, 0, 0, 1] }

def points11 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 0), (9, 1)]

-- Period 10, original row 7439, representative 10064.
def source12 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B009.Data.entryAt ⟨40, by decide +kernel⟩

def target12 : Weights.Entry :=
  { word := [10, 0, 4, 2, 8, 8, 4], weights := [1, 0, 0, 1] }

def points12 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 0), (9, 1)]

-- Period 10, original row 7450, representative 10066.
def source13 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B009.Data.entryAt ⟨42, by decide +kernel⟩

def target13 : Weights.Entry :=
  { word := [10, 0, 4, 10, 0, 8, 2], weights := [0, 1, 0, 1] }

def points13 : List (ℕ × ℕ) := [(0, 9), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 0), (9, 1)]

-- Period 10, original row 7451, representative 10066.
def source14 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B009.Data.entryAt ⟨42, by decide +kernel⟩

def target14 : Weights.Entry :=
  { word := [10, 0, 4, 10, 0, 8, 4], weights := [0, 1, 0, 1] }

def points14 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 0), (9, 1)]

-- Period 10, original row 7466, representative 10065.
def source15 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B009.Data.entryAt ⟨41, by decide +kernel⟩

def target15 : Weights.Entry :=
  { word := [10, 0, 4, 10, 8, 8, 4], weights := [0, 1, 0, 1] }

def points15 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 0), (9, 1)]

-- Period 10, original row 7544, representative 10060.
def source16 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B009.Data.entryAt ⟨36, by decide +kernel⟩

def target16 : Weights.Entry :=
  { word := [10, 0, 12, 2, 0, 8, 2], weights := [1, 0, 0, 1] }

def points16 : List (ℕ × ℕ) := [(0, 9), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 0), (9, 1)]

-- Period 10, original row 7545, representative 10060.
def source17 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B009.Data.entryAt ⟨36, by decide +kernel⟩

def target17 : Weights.Entry :=
  { word := [10, 0, 12, 2, 0, 8, 4], weights := [1, 0, 0, 1] }

def points17 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 0), (9, 1)]

-- Period 10, original row 7556, representative 10061.
def source18 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B009.Data.entryAt ⟨37, by decide +kernel⟩

def target18 : Weights.Entry :=
  { word := [10, 0, 12, 2, 8, 8, 4], weights := [1, 0, 0, 1] }

def points18 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 0), (9, 1)]

-- Period 10, original row 7572, representative 10063.
def source19 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B009.Data.entryAt ⟨39, by decide +kernel⟩

def target19 : Weights.Entry :=
  { word := [10, 0, 12, 10, 0, 8, 2], weights := [0, 1, 0, 1] }

def points19 : List (ℕ × ℕ) := [(0, 9), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 0), (9, 1)]

-- Period 10, original row 7573, representative 10063.
def source20 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B009.Data.entryAt ⟨39, by decide +kernel⟩

def target20 : Weights.Entry :=
  { word := [10, 0, 12, 10, 0, 8, 4], weights := [0, 1, 0, 1] }

def points20 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 0), (9, 1)]

-- Period 10, original row 7588, representative 10062.
def source21 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B009.Data.entryAt ⟨38, by decide +kernel⟩

def target21 : Weights.Entry :=
  { word := [10, 0, 12, 10, 8, 8, 4], weights := [0, 1, 0, 1] }

def points21 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 0), (9, 1)]

-- Period 10, original row 7821, representative 10043.
def source22 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B009.Data.entryAt ⟨19, by decide +kernel⟩

def target22 : Weights.Entry :=
  { word := [10, 8, 0, 4, 2, 0, 4], weights := [1, 0, 0, 1] }

def points22 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2), (9, 0)]

-- Period 10, original row 7826, representative 10027.
def source23 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B009.Data.entryAt ⟨3, by decide +kernel⟩

def target23 : Weights.Entry :=
  { word := [10, 8, 0, 4, 2, 8, 2], weights := [1, 0, 0, 1] }

def points23 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2), (9, 0)]

-- Period 10, original row 7827, representative 10035.
def source24 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B009.Data.entryAt ⟨11, by decide +kernel⟩

def target24 : Weights.Entry :=
  { word := [10, 8, 0, 4, 2, 8, 4], weights := [1, 0, 0, 1] }

def points24 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2), (9, 0)]

-- Period 10, original row 7847, representative 10048.
def source25 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B009.Data.entryAt ⟨24, by decide +kernel⟩

def target25 : Weights.Entry :=
  { word := [10, 8, 0, 4, 10, 0, 4], weights := [1, 0, 0, 1] }

def points25 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2), (9, 0)]

-- Period 10, original row 7852, representative 10032.
def source26 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B009.Data.entryAt ⟨8, by decide +kernel⟩

def target26 : Weights.Entry :=
  { word := [10, 8, 0, 4, 10, 8, 2], weights := [1, 0, 0, 1] }

def points26 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2), (9, 0)]

-- Period 10, original row 7853, representative 10040.
def source27 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B009.Data.entryAt ⟨16, by decide +kernel⟩

def target27 : Weights.Entry :=
  { word := [10, 8, 0, 4, 10, 8, 4], weights := [1, 0, 0, 1] }

def points27 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2), (9, 0)]

-- Period 10, original row 7873, representative 10050.
def source28 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B009.Data.entryAt ⟨26, by decide +kernel⟩

def target28 : Weights.Entry :=
  { word := [10, 8, 0, 12, 2, 0, 4], weights := [1, 0, 0, 1] }

def points28 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2), (9, 0)]

-- Period 10, original row 7878, representative 10034.
def source29 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B009.Data.entryAt ⟨10, by decide +kernel⟩

def target29 : Weights.Entry :=
  { word := [10, 8, 0, 12, 2, 8, 2], weights := [1, 0, 0, 1] }

def points29 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2), (9, 0)]

-- Period 10, original row 7879, representative 10042.
def source30 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B009.Data.entryAt ⟨18, by decide +kernel⟩

def target30 : Weights.Entry :=
  { word := [10, 8, 0, 12, 2, 8, 4], weights := [1, 0, 0, 1] }

def points30 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2), (9, 0)]

-- Period 10, original row 7898, representative 10049.
def source31 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B009.Data.entryAt ⟨25, by decide +kernel⟩

def target31 : Weights.Entry :=
  { word := [10, 8, 0, 12, 10, 0, 4], weights := [1, 0, 0, 1] }

def points31 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2), (9, 0)]

-- Period 10, original row 7903, representative 10033.
def source32 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B009.Data.entryAt ⟨9, by decide +kernel⟩

def target32 : Weights.Entry :=
  { word := [10, 8, 0, 12, 10, 8, 2], weights := [1, 0, 0, 1] }

def points32 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2), (9, 0)]

-- Period 10, original row 7904, representative 10041.
def source33 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B009.Data.entryAt ⟨17, by decide +kernel⟩

def target33 : Weights.Entry :=
  { word := [10, 8, 0, 12, 10, 8, 4], weights := [1, 0, 0, 1] }

def points33 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2), (9, 0)]

-- Period 10, original row 7934, representative 10024.
def source34 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B009.Data.entryAt ⟨0, by decide +kernel⟩

def target34 : Weights.Entry :=
  { word := [10, 8, 4, 2, 8, 8, 4], weights := [1, 0, 0, 1] }

def points34 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 7949, representative 10026.
def source35 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B009.Data.entryAt ⟨2, by decide +kernel⟩

def target35 : Weights.Entry :=
  { word := [10, 8, 4, 10, 0, 8, 2], weights := [0, 1, 0, 1] }

def points35 : List (ℕ × ℕ) := [(0, 9), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 7950, representative 10026.
def source36 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B009.Data.entryAt ⟨2, by decide +kernel⟩

def target36 : Weights.Entry :=
  { word := [10, 8, 4, 10, 0, 8, 4], weights := [0, 1, 0, 1] }

def points36 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 7958, representative 10025.
def source37 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B009.Data.entryAt ⟨1, by decide +kernel⟩

def target37 : Weights.Entry :=
  { word := [10, 8, 4, 10, 8, 8, 4], weights := [0, 1, 0, 1] }

def points37 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 7985, representative 10044.
def source38 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B009.Data.entryAt ⟨20, by decide +kernel⟩

def target38 : Weights.Entry :=
  { word := [10, 8, 8, 4, 2, 0, 4], weights := [1, 0, 0, 1] }

def points38 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 7990, representative 10028.
def source39 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B009.Data.entryAt ⟨4, by decide +kernel⟩

def target39 : Weights.Entry :=
  { word := [10, 8, 8, 4, 2, 8, 2], weights := [1, 0, 0, 1] }

def points39 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 7991, representative 10036.
def source40 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B009.Data.entryAt ⟨12, by decide +kernel⟩

def target40 : Weights.Entry :=
  { word := [10, 8, 8, 4, 2, 8, 4], weights := [1, 0, 0, 1] }

def points40 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8015, representative 10045.
def source41 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B009.Data.entryAt ⟨21, by decide +kernel⟩

def target41 : Weights.Entry :=
  { word := [10, 8, 8, 4, 10, 0, 4], weights := [1, 0, 0, 1] }

def points41 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8020, representative 10029.
def source42 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B009.Data.entryAt ⟨5, by decide +kernel⟩

def target42 : Weights.Entry :=
  { word := [10, 8, 8, 4, 10, 8, 2], weights := [1, 0, 0, 1] }

def points42 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8021, representative 10037.
def source43 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B009.Data.entryAt ⟨13, by decide +kernel⟩

def target43 : Weights.Entry :=
  { word := [10, 8, 8, 4, 10, 8, 4], weights := [1, 0, 0, 1] }

def points43 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8059, representative 10047.
def source44 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B009.Data.entryAt ⟨23, by decide +kernel⟩

def target44 : Weights.Entry :=
  { word := [10, 8, 8, 12, 2, 0, 4], weights := [1, 0, 0, 1] }

def points44 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8064, representative 10031.
def source45 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B009.Data.entryAt ⟨7, by decide +kernel⟩

def target45 : Weights.Entry :=
  { word := [10, 8, 8, 12, 2, 8, 2], weights := [1, 0, 0, 1] }

def points45 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8065, representative 10039.
def source46 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B009.Data.entryAt ⟨15, by decide +kernel⟩

def target46 : Weights.Entry :=
  { word := [10, 8, 8, 12, 2, 8, 4], weights := [1, 0, 0, 1] }

def points46 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8088, representative 10046.
def source47 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B009.Data.entryAt ⟨22, by decide +kernel⟩

def target47 : Weights.Entry :=
  { word := [10, 8, 8, 12, 10, 0, 4], weights := [1, 0, 0, 1] }

def points47 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8093, representative 10030.
def source48 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B009.Data.entryAt ⟨6, by decide +kernel⟩

def target48 : Weights.Entry :=
  { word := [10, 8, 8, 12, 10, 8, 2], weights := [1, 0, 0, 1] }

def points48 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8094, representative 10038.
def source49 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B009.Data.entryAt ⟨14, by decide +kernel⟩

def target49 : Weights.Entry :=
  { word := [10, 8, 8, 12, 10, 8, 4], weights := [1, 0, 0, 1] }

def points49 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8433, representative 10051.
def source50 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B009.Data.entryAt ⟨27, by decide +kernel⟩

def target50 : Weights.Entry :=
  { word := [12, 0, 4, 2, 0, 8, 2], weights := [0, 1, 0, 1] }

def points50 : List (ℕ × ℕ) := [(0, 9), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 0), (9, 1)]

-- Period 10, original row 8434, representative 10051.
def source51 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B009.Data.entryAt ⟨27, by decide +kernel⟩

def target51 : Weights.Entry :=
  { word := [12, 0, 4, 2, 0, 8, 4], weights := [0, 1, 0, 1] }

def points51 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 0), (9, 1)]

-- Period 10, original row 8445, representative 10056.
def source52 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B009.Data.entryAt ⟨32, by decide +kernel⟩

def target52 : Weights.Entry :=
  { word := [12, 0, 4, 2, 8, 8, 4], weights := [0, 1, 0, 1] }

def points52 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 0), (9, 1)]

-- Period 10, original row 8461, representative 10058.
def source53 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B009.Data.entryAt ⟨34, by decide +kernel⟩

def target53 : Weights.Entry :=
  { word := [12, 0, 4, 10, 0, 8, 2], weights := [0, 1, 0, 1] }

def points53 : List (ℕ × ℕ) := [(0, 9), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 0), (9, 1)]

-- Period 10, original row 8462, representative 10058.
def source54 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B009.Data.entryAt ⟨34, by decide +kernel⟩

def target54 : Weights.Entry :=
  { word := [12, 0, 4, 10, 0, 8, 4], weights := [0, 1, 0, 1] }

def points54 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 0), (9, 1)]

-- Period 10, original row 8477, representative 10057.
def source55 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B009.Data.entryAt ⟨33, by decide +kernel⟩

def target55 : Weights.Entry :=
  { word := [12, 0, 4, 10, 8, 8, 4], weights := [0, 1, 0, 1] }

def points55 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 0), (9, 1)]

-- Period 10, original row 8522, representative 10052.
def source56 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B009.Data.entryAt ⟨28, by decide +kernel⟩

def target56 : Weights.Entry :=
  { word := [12, 0, 12, 2, 0, 8, 2], weights := [0, 1, 0, 1] }

def points56 : List (ℕ × ℕ) := [(0, 9), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 0), (9, 1)]

-- Period 10, original row 8523, representative 10052.
def source57 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B009.Data.entryAt ⟨28, by decide +kernel⟩

def target57 : Weights.Entry :=
  { word := [12, 0, 12, 2, 0, 8, 4], weights := [0, 1, 0, 1] }

def points57 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 0), (9, 1)]

-- Period 10, original row 8534, representative 10053.
def source58 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B009.Data.entryAt ⟨29, by decide +kernel⟩

def target58 : Weights.Entry :=
  { word := [12, 0, 12, 2, 8, 8, 4], weights := [0, 1, 0, 1] }

def points58 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 0), (9, 1)]

-- Period 10, original row 8554, representative 10055.
def source59 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B009.Data.entryAt ⟨31, by decide +kernel⟩

def target59 : Weights.Entry :=
  { word := [12, 0, 12, 10, 0, 8, 2], weights := [0, 1, 0, 1] }

def points59 : List (ℕ × ℕ) := [(0, 9), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 0), (9, 1)]

-- Period 10, original row 8555, representative 10055.
def source60 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B009.Data.entryAt ⟨31, by decide +kernel⟩

def target60 : Weights.Entry :=
  { word := [12, 0, 12, 10, 0, 8, 4], weights := [0, 1, 0, 1] }

def points60 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 0), (9, 1)]

-- Period 10, original row 8570, representative 10054.
def source61 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B009.Data.entryAt ⟨30, by decide +kernel⟩

def target61 : Weights.Entry :=
  { word := [12, 0, 12, 10, 8, 8, 4], weights := [0, 1, 0, 1] }

def points61 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 0), (9, 1)]

-- Period 10, original row 8737, representative 10043.
def source62 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B009.Data.entryAt ⟨19, by decide +kernel⟩

def target62 : Weights.Entry :=
  { word := [12, 8, 0, 4, 2, 0, 4], weights := [1, 0, 0, 1] }

def points62 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8742, representative 10027.
def source63 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B009.Data.entryAt ⟨3, by decide +kernel⟩

def target63 : Weights.Entry :=
  { word := [12, 8, 0, 4, 2, 8, 2], weights := [1, 0, 0, 1] }

def points63 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8743, representative 10035.
def source64 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B009.Data.entryAt ⟨11, by decide +kernel⟩

def target64 : Weights.Entry :=
  { word := [12, 8, 0, 4, 2, 8, 4], weights := [1, 0, 0, 1] }

def points64 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8763, representative 10048.
def source65 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B009.Data.entryAt ⟨24, by decide +kernel⟩

def target65 : Weights.Entry :=
  { word := [12, 8, 0, 4, 10, 0, 4], weights := [1, 0, 0, 1] }

def points65 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8768, representative 10032.
def source66 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B009.Data.entryAt ⟨8, by decide +kernel⟩

def target66 : Weights.Entry :=
  { word := [12, 8, 0, 4, 10, 8, 2], weights := [1, 0, 0, 1] }

def points66 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8769, representative 10040.
def source67 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B009.Data.entryAt ⟨16, by decide +kernel⟩

def target67 : Weights.Entry :=
  { word := [12, 8, 0, 4, 10, 8, 4], weights := [1, 0, 0, 1] }

def points67 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8781, representative 10050.
def source68 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B009.Data.entryAt ⟨26, by decide +kernel⟩

def target68 : Weights.Entry :=
  { word := [12, 8, 0, 12, 2, 0, 4], weights := [1, 0, 0, 1] }

def points68 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8786, representative 10034.
def source69 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B009.Data.entryAt ⟨10, by decide +kernel⟩

def target69 : Weights.Entry :=
  { word := [12, 8, 0, 12, 2, 8, 2], weights := [1, 0, 0, 1] }

def points69 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8787, representative 10042.
def source70 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B009.Data.entryAt ⟨18, by decide +kernel⟩

def target70 : Weights.Entry :=
  { word := [12, 8, 0, 12, 2, 8, 4], weights := [1, 0, 0, 1] }

def points70 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8806, representative 10049.
def source71 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B009.Data.entryAt ⟨25, by decide +kernel⟩

def target71 : Weights.Entry :=
  { word := [12, 8, 0, 12, 10, 0, 4], weights := [1, 0, 0, 1] }

def points71 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8811, representative 10033.
def source72 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B009.Data.entryAt ⟨9, by decide +kernel⟩

def target72 : Weights.Entry :=
  { word := [12, 8, 0, 12, 10, 8, 2], weights := [1, 0, 0, 1] }

def points72 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8812, representative 10041.
def source73 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B009.Data.entryAt ⟨17, by decide +kernel⟩

def target73 : Weights.Entry :=
  { word := [12, 8, 0, 12, 10, 8, 4], weights := [1, 0, 0, 1] }

def points73 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

def period10Entries : List Weights.Entry := [target0, target1, target2, target3, target4, target5, target6, target7, target8, target9, target10, target11, target12, target13, target14, target15, target16, target17, target18, target19, target20, target21, target22, target23, target24, target25, target26, target27, target28, target29, target30, target31, target32, target33, target34, target35, target36, target37, target38, target39, target40, target41, target42, target43, target44, target45, target46, target47, target48, target49, target50, target51, target52, target53, target54, target55, target56, target57, target58, target59, target60, target61, target62, target63, target64, target65, target66, target67, target68, target69, target70, target71, target72, target73]

def period10Chunk : RowCoverage.Chunk where
  rows := [⟨6573, target0⟩, ⟨6576, target1⟩, ⟨7145, target2⟩, ⟨7160, target3⟩, ⟨7174, target4⟩, ⟨7188, target5⟩, ⟨7257, target6⟩, ⟨7265, target7⟩, ⟨7272, target8⟩, ⟨7279, target9⟩, ⟨7427, target10⟩, ⟨7428, target11⟩, ⟨7439, target12⟩, ⟨7450, target13⟩, ⟨7451, target14⟩, ⟨7466, target15⟩, ⟨7544, target16⟩, ⟨7545, target17⟩, ⟨7556, target18⟩, ⟨7572, target19⟩, ⟨7573, target20⟩, ⟨7588, target21⟩, ⟨7821, target22⟩, ⟨7826, target23⟩, ⟨7827, target24⟩, ⟨7847, target25⟩, ⟨7852, target26⟩, ⟨7853, target27⟩, ⟨7873, target28⟩, ⟨7878, target29⟩, ⟨7879, target30⟩, ⟨7898, target31⟩, ⟨7903, target32⟩, ⟨7904, target33⟩, ⟨7934, target34⟩, ⟨7949, target35⟩, ⟨7950, target36⟩, ⟨7958, target37⟩, ⟨7985, target38⟩, ⟨7990, target39⟩, ⟨7991, target40⟩, ⟨8015, target41⟩, ⟨8020, target42⟩, ⟨8021, target43⟩, ⟨8059, target44⟩, ⟨8064, target45⟩, ⟨8065, target46⟩, ⟨8088, target47⟩, ⟨8093, target48⟩, ⟨8094, target49⟩, ⟨8433, target50⟩, ⟨8434, target51⟩, ⟨8445, target52⟩, ⟨8461, target53⟩, ⟨8462, target54⟩, ⟨8477, target55⟩, ⟨8522, target56⟩, ⟨8523, target57⟩, ⟨8534, target58⟩, ⟨8554, target59⟩, ⟨8555, target60⟩, ⟨8570, target61⟩, ⟨8737, target62⟩, ⟨8742, target63⟩, ⟨8743, target64⟩, ⟨8763, target65⟩, ⟨8768, target66⟩, ⟨8769, target67⟩, ⟨8781, target68⟩, ⟨8786, target69⟩, ⟨8787, target70⟩, ⟨8806, target71⟩, ⟨8811, target72⟩, ⟨8812, target73⟩]
  indexMask := 7193058034004330583827205231450279386292008105429266120309976885316231073405855612830484076093035976337922815305375653327156716489335252872146097450163461197335223602382826751641362884524042112343283869898795981657284947298808257727263166743582096440964200925549918483260305480094047788294539407623335166768729416477034581431548074188197082268868162565289709782994245351149765389655032988010959583552969928485409588341805631938277325917620237710706557213897818845820823363000463426552631529020411472172096014091957740921894702086919487346905758848685490968048226163001572319361372977773550206915278795917799779117482391716266817602413961255584787317671170941270773273131691875722689337527452727411494523161347187724143601945585171623219118290038007271189208566278758446582454033177538919604904673923827453839598114955809297790678001229525087837408537828886886233629324339127533521314285178887598880037323012398186357588001494488569560793660948347366522833930888019577480956982145329574135400494199782005264682637098645652480612395198623572182245698798807077282933583395647761857591246252321078027588122950850297544794946001460381484939695142326031058885289934111512691345222253406406156712877006940108713842903594433266178316917025062670249588308325041167461281824894044031542019539613308635670624067405517426369408146920215963530934735398338853306884361981004395144533201705968771060275645318596250906244935055981532769239338386870496792094183867356426161445622547036575496411237180850863120104231366604604824144214744964630577176911705652237359881129980219840889320421764973918550071955605964778896576599534118893218114219713074189894039699251107719645456024258667235455709194669758212851031334657087982380963042041357378163327943841317436128538700396114900703423511962500861719669042412649909584377640918439510716409974150755738975830715140755227322812356611056628872001474241150975504629024022574984885659629787591645667709254522620306719503409505407438377956497323049221741327482629581780634496971449480370089220018494744216222213066162232893886547119767237492222122418372019528414242945715290741607511030386423669864472187055490360357655339698474946255794015016864380716084784079116591458676575059610488125812986837787546892926164345188256783559506856157068816342745886698918746905937780157415839062035731148600535649784965307348923001910140755214944369839945189954441181082244794138398701521396503594091824321049372302443760649813181852167306090744976349373552456697866139665980797377589363085195432191368593207907816972776048177170110228786358895978823054498630251361700868981202052373994508200976978265681341956158916846789649133733332232699904
  count := 74

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

end FranklSmallCyclic.TransportBatches.G087.B001.Data
