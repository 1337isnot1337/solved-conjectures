module

public import Conjectures.FranklSmallCyclicRowCoverage
public import Conjectures.FranklSmallCyclicCanonicalWords
public import Conjectures.FranklSmallCyclicOrbit10Block019Data

/-! 45 literal targets sharing one source proof block.
Original words and row indices are retained; weights may be transported.
-/
@[expose] public section

namespace FranklSmallCyclic.TransportBatches.G097.B001.Data

-- Period 10, original row 4896, representative 10680.
def source0 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B019.Data.entryAt ⟨16, by decide +kernel⟩

def target0 : Weights.Entry :=
  { word := [8, 2, 8, 10, 0, 8, 8], weights := [1, 0, 0, 1] }

-- Period 10, original row 4901, representative 10675.
def source1 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B019.Data.entryAt ⟨11, by decide +kernel⟩

def target1 : Weights.Entry :=
  { word := [8, 2, 8, 10, 0, 9, 8], weights := [1, 0, 0, 1] }

-- Period 10, original row 4903, representative 10675.
def source2 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B019.Data.entryAt ⟨11, by decide +kernel⟩

def target2 : Weights.Entry :=
  { word := [8, 2, 8, 10, 0, 10, 8], weights := [1, 0, 0, 1] }

def points2 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 8), (8, 7), (9, 9)]

-- Period 10, original row 4906, representative 10677.
def source3 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B019.Data.entryAt ⟨13, by decide +kernel⟩

def target3 : Weights.Entry :=
  { word := [8, 2, 8, 10, 8, 2, 8], weights := [0, 1, 0, 0] }

-- Period 10, original row 4914, representative 10674.
def source4 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B019.Data.entryAt ⟨10, by decide +kernel⟩

def target4 : Weights.Entry :=
  { word := [8, 2, 8, 10, 8, 10, 8], weights := [0, 1, 0, 0] }

-- Period 10, original row 5018, representative 10671.
def source5 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B019.Data.entryAt ⟨7, by decide +kernel⟩

def target5 : Weights.Entry :=
  { word := [8, 4, 0, 4, 8, 4, 8], weights := [1, 0, 1, 0] }

def points5 : List (ℕ × ℕ) := [(0, 0), (1, 2), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8), (9, 9)]

-- Period 10, original row 5051, representative 10664.
def source6 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B019.Data.entryAt ⟨0, by decide +kernel⟩

def target6 : Weights.Entry :=
  { word := [8, 4, 0, 12, 4, 4, 8], weights := [1, 0, 0, 1] }

def points6 : List (ℕ × ℕ) := [(0, 0), (1, 2), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8), (9, 9)]

-- Period 10, original row 5054, representative 10678.
def source7 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B019.Data.entryAt ⟨14, by decide +kernel⟩

def target7 : Weights.Entry :=
  { word := [8, 4, 0, 12, 8, 4, 8], weights := [1, 0, 1, 0] }

def points7 : List (ℕ × ℕ) := [(0, 0), (1, 2), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8), (9, 9)]

-- Period 10, original row 5175, representative 10676.
def source8 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B019.Data.entryAt ⟨12, by decide +kernel⟩

def target8 : Weights.Entry :=
  { word := [8, 4, 8, 4, 8, 4, 8], weights := [0, 0, 1, 0] }

def points8 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 5217, representative 10677.
def source9 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B019.Data.entryAt ⟨13, by decide +kernel⟩

def target9 : Weights.Entry :=
  { word := [8, 4, 8, 12, 8, 4, 8], weights := [0, 0, 1, 0] }

def points9 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 5250, representative 10727.
def source10 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B019.Data.entryAt ⟨63, by decide +kernel⟩

def target10 : Weights.Entry :=
  { word := [8, 4, 10, 8, 10, 8, 2], weights := [0, 1, 1, 0] }

def points10 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 5319, representative 10720.
def source11 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B019.Data.entryAt ⟨56, by decide +kernel⟩

def target11 : Weights.Entry :=
  { word := [8, 8, 0, 1, 4, 8, 4], weights := [0, 1, 0, 0] }

def points11 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2), (9, 0)]

-- Period 10, original row 5325, representative 10718.
def source12 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B019.Data.entryAt ⟨54, by decide +kernel⟩

def target12 : Weights.Entry :=
  { word := [8, 8, 0, 1, 12, 8, 4], weights := [0, 1, 0, 0] }

def points12 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2), (9, 0)]

-- Period 10, original row 5337, representative 10681.
def source13 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B019.Data.entryAt ⟨17, by decide +kernel⟩

def target13 : Weights.Entry :=
  { word := [8, 8, 0, 4, 0, 4, 8], weights := [1, 0, 2, 1] }

def points13 : List (ℕ × ℕ) := [(0, 9), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2), (9, 0)]

-- Period 10, original row 5354, representative 10665.
def source14 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B019.Data.entryAt ⟨1, by decide +kernel⟩

def target14 : Weights.Entry :=
  { word := [8, 8, 0, 4, 4, 4, 8], weights := [1, 0, 0, 1] }

def points14 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2), (9, 0)]

-- Period 10, original row 5361, representative 10679.
def source15 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B019.Data.entryAt ⟨15, by decide +kernel⟩

def target15 : Weights.Entry :=
  { word := [8, 8, 0, 4, 8, 4, 8], weights := [1, 0, 0, 1] }

def points15 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2), (9, 0)]

-- Period 10, original row 5399, representative 10682.
def source16 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B019.Data.entryAt ⟨18, by decide +kernel⟩

def target16 : Weights.Entry :=
  { word := [8, 8, 0, 12, 0, 4, 8], weights := [1, 0, 0, 1] }

def points16 : List (ℕ × ℕ) := [(0, 9), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2), (9, 0)]

-- Period 10, original row 5418, representative 10668.
def source17 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B019.Data.entryAt ⟨4, by decide +kernel⟩

def target17 : Weights.Entry :=
  { word := [8, 8, 0, 12, 4, 4, 8], weights := [1, 0, 0, 1] }

def points17 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2), (9, 0)]

-- Period 10, original row 5424, representative 10680.
def source18 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B019.Data.entryAt ⟨16, by decide +kernel⟩

def target18 : Weights.Entry :=
  { word := [8, 8, 0, 12, 8, 4, 8], weights := [1, 0, 0, 1] }

def points18 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2), (9, 0)]

-- Period 10, original row 5460, representative 10672.
def source19 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B019.Data.entryAt ⟨8, by decide +kernel⟩

def target19 : Weights.Entry :=
  { word := [8, 8, 1, 4, 8, 4, 8], weights := [1, 0, 0, 1] }

def points19 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 5496, representative 10675.
def source20 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B019.Data.entryAt ⟨11, by decide +kernel⟩

def target20 : Weights.Entry :=
  { word := [8, 8, 1, 12, 8, 4, 8], weights := [1, 0, 0, 1] }

def points20 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 5673, representative 10721.
def source21 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B019.Data.entryAt ⟨57, by decide +kernel⟩

def target21 : Weights.Entry :=
  { word := [8, 8, 8, 1, 4, 8, 4], weights := [0, 1, 0, 0] }

def points21 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 5679, representative 10719.
def source22 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B019.Data.entryAt ⟨55, by decide +kernel⟩

def target22 : Weights.Entry :=
  { word := [8, 8, 8, 1, 12, 8, 4], weights := [0, 1, 0, 0] }

def points22 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 5692, representative 10666.
def source23 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B019.Data.entryAt ⟨2, by decide +kernel⟩

def target23 : Weights.Entry :=
  { word := [8, 8, 8, 4, 4, 4, 8], weights := [1, 0, 0, 1] }

def points23 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 5726, representative 10667.
def source24 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B019.Data.entryAt ⟨3, by decide +kernel⟩

def target24 : Weights.Entry :=
  { word := [8, 8, 8, 12, 4, 4, 8], weights := [1, 0, 0, 1] }

def points24 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 6348, representative 10672.
def source25 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B019.Data.entryAt ⟨8, by decide +kernel⟩

def target25 : Weights.Entry :=
  { word := [8, 12, 0, 4, 8, 4, 8], weights := [1, 0, 0, 1] }

def points25 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2), (9, 0)]

-- Period 10, original row 6384, representative 10675.
def source26 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B019.Data.entryAt ⟨11, by decide +kernel⟩

def target26 : Weights.Entry :=
  { word := [8, 12, 0, 12, 8, 4, 8], weights := [1, 0, 0, 1] }

def points26 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2), (9, 0)]

-- Period 10, original row 6415, representative 10725.
def source27 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B019.Data.entryAt ⟨61, by decide +kernel⟩

def target27 : Weights.Entry :=
  { word := [8, 12, 2, 8, 2, 8, 2], weights := [0, 1, 1, 0] }

def points27 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 6423, representative 10723.
def source28 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B019.Data.entryAt ⟨59, by decide +kernel⟩

def target28 : Weights.Entry :=
  { word := [8, 12, 2, 8, 10, 8, 2], weights := [0, 1, 1, 0] }

def points28 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 6483, representative 10726.
def source29 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B019.Data.entryAt ⟨62, by decide +kernel⟩

def target29 : Weights.Entry :=
  { word := [8, 12, 6, 8, 8, 8, 2], weights := [0, 1, 1, 0] }

def points29 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 6505, representative 10673.
def source30 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B019.Data.entryAt ⟨9, by decide +kernel⟩

def target30 : Weights.Entry :=
  { word := [8, 12, 8, 4, 8, 4, 8], weights := [0, 0, 1, 0] }

def points30 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 6547, representative 10674.
def source31 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B019.Data.entryAt ⟨10, by decide +kernel⟩

def target31 : Weights.Entry :=
  { word := [8, 12, 8, 12, 8, 4, 8], weights := [0, 0, 1, 0] }

def points31 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 6577, representative 10724.
def source32 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B019.Data.entryAt ⟨60, by decide +kernel⟩

def target32 : Weights.Entry :=
  { word := [8, 12, 10, 8, 2, 8, 2], weights := [0, 1, 1, 0] }

def points32 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 6580, representative 10722.
def source33 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B019.Data.entryAt ⟨58, by decide +kernel⟩

def target33 : Weights.Entry :=
  { word := [8, 12, 10, 8, 10, 8, 2], weights := [0, 1, 1, 0] }

def points33 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 6641, representative 10671.
def source34 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B019.Data.entryAt ⟨7, by decide +kernel⟩

def target34 : Weights.Entry :=
  { word := [9, 0, 1, 4, 8, 4, 8], weights := [1, 0, 1, 0] }

def points34 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8), (9, 9)]

-- Period 10, original row 6674, representative 10664.
def source35 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B019.Data.entryAt ⟨0, by decide +kernel⟩

def target35 : Weights.Entry :=
  { word := [9, 0, 1, 12, 4, 4, 8], weights := [1, 0, 0, 1] }

def points35 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8), (9, 9)]

-- Period 10, original row 6677, representative 10678.
def source36 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B019.Data.entryAt ⟨14, by decide +kernel⟩

def target36 : Weights.Entry :=
  { word := [9, 0, 1, 12, 8, 4, 8], weights := [1, 0, 1, 0] }

def points36 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8), (9, 9)]

-- Period 10, original row 6791, representative 10685.
def source37 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B019.Data.entryAt ⟨21, by decide +kernel⟩

def target37 : Weights.Entry :=
  { word := [9, 0, 4, 10, 0, 4, 8], weights := [1, 0, 2, 1] }

def points37 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8), (9, 9)]

-- Period 10, original row 6828, representative 10669.
def source38 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B019.Data.entryAt ⟨5, by decide +kernel⟩

def target38 : Weights.Entry :=
  { word := [9, 0, 8, 4, 4, 4, 8], weights := [1, 0, 0, 1] }

def points38 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8), (9, 9)]

-- Period 10, original row 6849, representative 10670.
def source39 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B019.Data.entryAt ⟨6, by decide +kernel⟩

def target39 : Weights.Entry :=
  { word := [9, 0, 8, 12, 4, 4, 8], weights := [1, 0, 0, 1] }

def points39 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8), (9, 9)]

-- Period 10, original row 6935, representative 10684.
def source40 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B019.Data.entryAt ⟨20, by decide +kernel⟩

def target40 : Weights.Entry :=
  { word := [9, 0, 12, 10, 0, 4, 8], weights := [1, 0, 1, 1] }

def points40 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8), (9, 9)]

-- Period 10, original row 7077, representative 10672.
def source41 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B019.Data.entryAt ⟨8, by decide +kernel⟩

def target41 : Weights.Entry :=
  { word := [9, 8, 1, 4, 8, 4, 8], weights := [1, 0, 0, 1] }

def points41 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 7113, representative 10675.
def source42 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B019.Data.entryAt ⟨11, by decide +kernel⟩

def target42 : Weights.Entry :=
  { word := [9, 8, 1, 12, 8, 4, 8], weights := [1, 0, 0, 1] }

def points42 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 7210, representative 10666.
def source43 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B019.Data.entryAt ⟨2, by decide +kernel⟩

def target43 : Weights.Entry :=
  { word := [9, 8, 8, 4, 4, 4, 8], weights := [1, 0, 0, 1] }

def points43 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 7226, representative 10667.
def source44 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B019.Data.entryAt ⟨3, by decide +kernel⟩

def target44 : Weights.Entry :=
  { word := [9, 8, 8, 12, 4, 4, 8], weights := [1, 0, 0, 1] }

def points44 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

def period10Entries : List Weights.Entry := [target0, target1, target2, target3, target4, target5, target6, target7, target8, target9, target10, target11, target12, target13, target14, target15, target16, target17, target18, target19, target20, target21, target22, target23, target24, target25, target26, target27, target28, target29, target30, target31, target32, target33, target34, target35, target36, target37, target38, target39, target40, target41, target42, target43, target44]

def period10Chunk : RowCoverage.Chunk where
  rows := [⟨4896, target0⟩, ⟨4901, target1⟩, ⟨4903, target2⟩, ⟨4906, target3⟩, ⟨4914, target4⟩, ⟨5018, target5⟩, ⟨5051, target6⟩, ⟨5054, target7⟩, ⟨5175, target8⟩, ⟨5217, target9⟩, ⟨5250, target10⟩, ⟨5319, target11⟩, ⟨5325, target12⟩, ⟨5337, target13⟩, ⟨5354, target14⟩, ⟨5361, target15⟩, ⟨5399, target16⟩, ⟨5418, target17⟩, ⟨5424, target18⟩, ⟨5460, target19⟩, ⟨5496, target20⟩, ⟨5673, target21⟩, ⟨5679, target22⟩, ⟨5692, target23⟩, ⟨5726, target24⟩, ⟨6348, target25⟩, ⟨6384, target26⟩, ⟨6415, target27⟩, ⟨6423, target28⟩, ⟨6483, target29⟩, ⟨6505, target30⟩, ⟨6547, target31⟩, ⟨6577, target32⟩, ⟨6580, target33⟩, ⟨6641, target34⟩, ⟨6674, target35⟩, ⟨6677, target36⟩, ⟨6791, target37⟩, ⟨6828, target38⟩, ⟨6849, target39⟩, ⟨6935, target40⟩, ⟨7077, target41⟩, ⟨7113, target42⟩, ⟨7210, target43⟩, ⟨7226, target44⟩]
  indexMask := 1748861006811787910382065945712246312060732968847819261594560138471482037975822459285850285490692594715729670982485065987918891914734905285759971529348385880816908684683894611925525978926455494658771921311731409062156500144332639894186406032482516557218399549961487153578070791626016268988581684160510347830581390436013497589325674110111614014108008635801728485943854359829988677736243768683805120243475799164658669587208704332989500704037490416892048167321040247717181285182142066993669465622820104107402937965938395818253818090018157461559725661994944654702829506418019589368647370153704555553395378896981382589919231624838681582417331197100779594147132941962116807652862633441531108878318628298258686740964378653198864522946718042869939174331372569540079143827965815875217304472210761128101765959646175729645010930136012289404155678480318732083029699936421762056104268842488136292433033340816983041345514459518324564387241250052143804118804794984418566890113225299557834456706920852129177538025169239233109210692296223877152595464583272060685586356568690651431387791178795600308739701668659111939585371205079733061745489687163846322991476596212731543903683779579743956934328348403537398188173045654299428454266678507998150866846602820458115596943686446495110078434430025958687006171723728323460447268534430175781651651599574537964306578722752062412993484001429590124330652271429549726226890590308135035993948460761883548748870846607141078591727325461404007076299353603699579213189239868671790203297494776306175559163824843147398397956448013510604534412285971808978744551012455257595988131884728316696257211412829269315506735942537713648935546161975073377343002754804751422621706357794607500904523131786519828175982427882474095715820300686915324763690575458302030128285364497958493229039971150217963558325837532269746565093529214330535475133389613924073919115419872923233657253583331931051299162874628889208250809407248120662367356047002703888092089912254468439893432761229148077470725268199899313768414502904879010587361429778599330422138556146906638405145243380082123263705223612308745887614061557979974588524028763762125663584922752137560494432674799397010061573771755520
  count := 45

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

end FranklSmallCyclic.TransportBatches.G097.B001.Data
