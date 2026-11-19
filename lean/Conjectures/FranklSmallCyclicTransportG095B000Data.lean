module

public import Conjectures.FranklSmallCyclicRowCoverage
public import Conjectures.FranklSmallCyclicCanonicalWords
public import Conjectures.FranklSmallCyclicOrbit10Block017Data

/-! 128 literal targets sharing one source proof block.
Original words and row indices are retained; weights may be transported.
-/
@[expose] public section

namespace FranklSmallCyclic.TransportBatches.G095.B000.Data

-- Period 10, original row 2444, representative 10551.
def source0 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B017.Data.entryAt ⟨15, by decide +kernel⟩

def target0 : Weights.Entry :=
  { word := [2, 0, 4, 10, 0, 12, 8], weights := [1, 0, 1, 1] }

-- Period 10, original row 2495, representative 10539.
def source1 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B017.Data.entryAt ⟨3, by decide +kernel⟩

def target1 : Weights.Entry :=
  { word := [2, 0, 8, 12, 0, 12, 8], weights := [0, 0, 1, 0] }

-- Period 10, original row 2507, representative 10558.
def source2 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B017.Data.entryAt ⟨22, by decide +kernel⟩

def target2 : Weights.Entry :=
  { word := [2, 0, 9, 0, 1, 12, 8], weights := [0, 0, 1, 0] }

-- Period 10, original row 2515, representative 10559.
def source3 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B017.Data.entryAt ⟨23, by decide +kernel⟩

def target3 : Weights.Entry :=
  { word := [2, 0, 9, 8, 1, 12, 8], weights := [0, 0, 1, 0] }

-- Period 10, original row 2566, representative 10550.
def source4 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B017.Data.entryAt ⟨14, by decide +kernel⟩

def target4 : Weights.Entry :=
  { word := [2, 0, 12, 10, 0, 12, 8], weights := [1, 0, 1, 1] }

-- Period 10, original row 2855, representative 10538.
def source5 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B017.Data.entryAt ⟨2, by decide +kernel⟩

def target5 : Weights.Entry :=
  { word := [2, 8, 0, 12, 0, 12, 8], weights := [1, 0, 1, 0] }

-- Period 10, original row 2880, representative 10536.
def source6 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B017.Data.entryAt ⟨0, by decide +kernel⟩

def target6 : Weights.Entry :=
  { word := [2, 8, 0, 12, 8, 12, 8], weights := [1, 0, 1, 0] }

-- Period 10, original row 2956, representative 10560.
def source7 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B017.Data.entryAt ⟨24, by decide +kernel⟩

def target7 : Weights.Entry :=
  { word := [2, 8, 8, 0, 1, 12, 8], weights := [0, 0, 1, 0] }

-- Period 10, original row 3022, representative 10561.
def source8 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B017.Data.entryAt ⟨25, by decide +kernel⟩

def target8 : Weights.Entry :=
  { word := [2, 8, 8, 8, 1, 12, 8], weights := [0, 0, 1, 0] }

-- Period 10, original row 3040, representative 10537.
def source9 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B017.Data.entryAt ⟨1, by decide +kernel⟩

def target9 : Weights.Entry :=
  { word := [2, 8, 8, 12, 0, 12, 8], weights := [0, 0, 1, 0] }

-- Period 10, original row 3089, representative 10554.
def source10 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B017.Data.entryAt ⟨18, by decide +kernel⟩

def target10 : Weights.Entry :=
  { word := [2, 8, 9, 0, 1, 12, 8], weights := [0, 0, 1, 0] }

-- Period 10, original row 3097, representative 10555.
def source11 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B017.Data.entryAt ⟨19, by decide +kernel⟩

def target11 : Weights.Entry :=
  { word := [2, 8, 9, 8, 1, 12, 8], weights := [0, 0, 1, 0] }

-- Period 10, original row 3682, representative 10556.
def source12 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B017.Data.entryAt ⟨20, by decide +kernel⟩

def target12 : Weights.Entry :=
  { word := [4, 4, 8, 0, 1, 12, 8], weights := [0, 0, 1, 0] }

-- Period 10, original row 3690, representative 10557.
def source13 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B017.Data.entryAt ⟨21, by decide +kernel⟩

def target13 : Weights.Entry :=
  { word := [4, 4, 8, 8, 1, 12, 8], weights := [0, 0, 1, 0] }

-- Period 10, original row 3790, representative 10536.
def source14 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B017.Data.entryAt ⟨0, by decide +kernel⟩

def target14 : Weights.Entry :=
  { word := [4, 8, 0, 12, 8, 12, 8], weights := [1, 0, 1, 0] }

def points14 : List (ℕ × ℕ) := [(0, 0), (1, 2), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8), (9, 9)]

-- Period 10, original row 4047, representative 10552.
def source15 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B017.Data.entryAt ⟨16, by decide +kernel⟩

def target15 : Weights.Entry :=
  { word := [4, 12, 8, 0, 1, 12, 8], weights := [0, 0, 1, 0] }

-- Period 10, original row 4055, representative 10553.
def source16 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B017.Data.entryAt ⟨17, by decide +kernel⟩

def target16 : Weights.Entry :=
  { word := [4, 12, 8, 8, 1, 12, 8], weights := [0, 0, 1, 0] }

-- Period 10, original row 4121, representative 10596.
def source17 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B017.Data.entryAt ⟨60, by decide +kernel⟩

def target17 : Weights.Entry :=
  { word := [8, 0, 0, 12, 0, 12, 8], weights := [0, 0, 1, 0] }

-- Period 10, original row 4143, representative 10584.
def source18 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B017.Data.entryAt ⟨48, by decide +kernel⟩

def target18 : Weights.Entry :=
  { word := [8, 0, 1, 4, 8, 12, 8], weights := [1, 0, 1, 0] }

-- Period 10, original row 4179, representative 10591.
def source19 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B017.Data.entryAt ⟨55, by decide +kernel⟩

def target19 : Weights.Entry :=
  { word := [8, 0, 1, 12, 8, 12, 8], weights := [1, 0, 1, 0] }

-- Period 10, original row 4301, representative 10598.
def source20 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B017.Data.entryAt ⟨62, by decide +kernel⟩

def target20 : Weights.Entry :=
  { word := [8, 0, 4, 10, 0, 12, 8], weights := [1, 0, 1, 1] }

-- Period 10, original row 4358, representative 10582.
def source21 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B017.Data.entryAt ⟨46, by decide +kernel⟩

def target21 : Weights.Entry :=
  { word := [8, 0, 8, 4, 4, 12, 8], weights := [1, 0, 0, 1] }

-- Period 10, original row 4379, representative 10583.
def source22 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B017.Data.entryAt ⟨47, by decide +kernel⟩

def target22 : Weights.Entry :=
  { word := [8, 0, 8, 12, 4, 12, 8], weights := [1, 0, 0, 1] }

-- Period 10, original row 4383, representative 10576.
def source23 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B017.Data.entryAt ⟨40, by decide +kernel⟩

def target23 : Weights.Entry :=
  { word := [8, 0, 9, 4, 4, 12, 8], weights := [1, 0, 0, 1] }

-- Period 10, original row 4387, representative 10566.
def source24 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B017.Data.entryAt ⟨30, by decide +kernel⟩

def target24 : Weights.Entry :=
  { word := [8, 0, 9, 4, 12, 12, 8], weights := [1, 0, 0, 1] }

-- Period 10, original row 4391, representative 10577.
def source25 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B017.Data.entryAt ⟨41, by decide +kernel⟩

def target25 : Weights.Entry :=
  { word := [8, 0, 9, 12, 4, 12, 8], weights := [1, 0, 0, 1] }

-- Period 10, original row 4395, representative 10567.
def source26 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B017.Data.entryAt ⟨31, by decide +kernel⟩

def target26 : Weights.Entry :=
  { word := [8, 0, 9, 12, 12, 12, 8], weights := [1, 0, 0, 1] }

-- Period 10, original row 4477, representative 10597.
def source27 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B017.Data.entryAt ⟨61, by decide +kernel⟩

def target27 : Weights.Entry :=
  { word := [8, 0, 12, 10, 0, 12, 8], weights := [1, 0, 1, 1] }

-- Period 10, original row 4685, representative 10548.
def source28 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B017.Data.entryAt ⟨12, by decide +kernel⟩

def target28 : Weights.Entry :=
  { word := [8, 2, 0, 6, 0, 12, 8], weights := [1, 1, 1, 1] }

-- Period 10, original row 4687, representative 10545.
def source29 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B017.Data.entryAt ⟨9, by decide +kernel⟩

def target29 : Weights.Entry :=
  { word := [8, 2, 0, 6, 8, 12, 8], weights := [1, 1, 1, 1] }

-- Period 10, original row 4704, representative 10549.
def source30 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B017.Data.entryAt ⟨13, by decide +kernel⟩

def target30 : Weights.Entry :=
  { word := [8, 2, 0, 9, 0, 12, 8], weights := [0, 1, 1, 0] }

-- Period 10, original row 4844, representative 10541.
def source31 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B017.Data.entryAt ⟨5, by decide +kernel⟩

def target31 : Weights.Entry :=
  { word := [8, 2, 2, 10, 8, 12, 8], weights := [0, 1, 1, 0] }

-- Period 10, original row 4876, representative 10547.
def source32 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B017.Data.entryAt ⟨11, by decide +kernel⟩

def target32 : Weights.Entry :=
  { word := [8, 2, 8, 6, 0, 12, 8], weights := [1, 0, 1, 1] }

-- Period 10, original row 4878, representative 10544.
def source33 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B017.Data.entryAt ⟨8, by decide +kernel⟩

def target33 : Weights.Entry :=
  { word := [8, 2, 8, 6, 8, 12, 8], weights := [0, 1, 1, 0] }

-- Period 10, original row 4922, representative 10599.
def source34 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B017.Data.entryAt ⟨63, by decide +kernel⟩

def target34 : Weights.Entry :=
  { word := [8, 2, 8, 12, 12, 4, 8], weights := [0, 1, 1, 0] }

-- Period 10, original row 4981, representative 10599.
def source35 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B017.Data.entryAt ⟨63, by decide +kernel⟩

def target35 : Weights.Entry :=
  { word := [8, 2, 10, 10, 8, 4, 8], weights := [0, 1, 1, 0] }

def points35 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 4999, representative 10540.
def source36 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B017.Data.entryAt ⟨4, by decide +kernel⟩

def target36 : Weights.Entry :=
  { word := [8, 2, 10, 10, 8, 12, 8], weights := [0, 1, 1, 0] }

-- Period 10, original row 5022, representative 10584.
def source37 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B017.Data.entryAt ⟨48, by decide +kernel⟩

def target37 : Weights.Entry :=
  { word := [8, 4, 0, 4, 8, 12, 8], weights := [1, 0, 1, 0] }

def points37 : List (ℕ × ℕ) := [(0, 0), (1, 2), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8), (9, 9)]

-- Period 10, original row 5058, representative 10591.
def source38 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B017.Data.entryAt ⟨55, by decide +kernel⟩

def target38 : Weights.Entry :=
  { word := [8, 4, 0, 12, 8, 12, 8], weights := [1, 0, 1, 0] }

def points38 : List (ℕ × ℕ) := [(0, 0), (1, 2), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8), (9, 9)]

-- Period 10, original row 5172, representative 10578.
def source39 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B017.Data.entryAt ⟨42, by decide +kernel⟩

def target39 : Weights.Entry :=
  { word := [8, 4, 8, 4, 4, 12, 8], weights := [1, 0, 0, 1] }

-- Period 10, original row 5180, representative 10589.
def source40 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B017.Data.entryAt ⟨53, by decide +kernel⟩

def target40 : Weights.Entry :=
  { word := [8, 4, 8, 4, 8, 12, 8], weights := [0, 0, 1, 0] }

-- Period 10, original row 5198, representative 10568.
def source41 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B017.Data.entryAt ⟨32, by decide +kernel⟩

def target41 : Weights.Entry :=
  { word := [8, 4, 8, 4, 12, 12, 8], weights := [1, 0, 0, 1] }

-- Period 10, original row 5214, representative 10579.
def source42 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B017.Data.entryAt ⟨43, by decide +kernel⟩

def target42 : Weights.Entry :=
  { word := [8, 4, 8, 12, 4, 12, 8], weights := [1, 0, 0, 1] }

-- Period 10, original row 5222, representative 10590.
def source43 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B017.Data.entryAt ⟨54, by decide +kernel⟩

def target43 : Weights.Entry :=
  { word := [8, 4, 8, 12, 8, 12, 8], weights := [0, 0, 1, 0] }

-- Period 10, original row 5240, representative 10569.
def source44 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B017.Data.entryAt ⟨33, by decide +kernel⟩

def target44 : Weights.Entry :=
  { word := [8, 4, 8, 12, 12, 12, 8], weights := [1, 0, 0, 1] }

-- Period 10, original row 5339, representative 10594.
def source45 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B017.Data.entryAt ⟨58, by decide +kernel⟩

def target45 : Weights.Entry :=
  { word := [8, 8, 0, 4, 0, 12, 8], weights := [1, 0, 3, 0] }

-- Period 10, original row 5365, representative 10592.
def source46 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B017.Data.entryAt ⟨56, by decide +kernel⟩

def target46 : Weights.Entry :=
  { word := [8, 8, 0, 4, 8, 12, 8], weights := [1, 0, 1, 0] }

-- Period 10, original row 5403, representative 10595.
def source47 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B017.Data.entryAt ⟨59, by decide +kernel⟩

def target47 : Weights.Entry :=
  { word := [8, 8, 0, 12, 0, 12, 8], weights := [1, 0, 1, 0] }

-- Period 10, original row 5428, representative 10593.
def source48 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B017.Data.entryAt ⟨57, by decide +kernel⟩

def target48 : Weights.Entry :=
  { word := [8, 8, 0, 12, 8, 12, 8], weights := [1, 0, 1, 0] }

-- Period 10, original row 5464, representative 10585.
def source49 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B017.Data.entryAt ⟨49, by decide +kernel⟩

def target49 : Weights.Entry :=
  { word := [8, 8, 1, 4, 8, 12, 8], weights := [1, 0, 1, 0] }

-- Period 10, original row 5500, representative 10588.
def source50 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B017.Data.entryAt ⟨52, by decide +kernel⟩

def target50 : Weights.Entry :=
  { word := [8, 8, 1, 12, 8, 12, 8], weights := [1, 0, 1, 0] }

-- Period 10, original row 5694, representative 10580.
def source51 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B017.Data.entryAt ⟨44, by decide +kernel⟩

def target51 : Weights.Entry :=
  { word := [8, 8, 8, 4, 4, 12, 8], weights := [1, 0, 0, 1] }

-- Period 10, original row 5702, representative 10570.
def source52 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B017.Data.entryAt ⟨34, by decide +kernel⟩

def target52 : Weights.Entry :=
  { word := [8, 8, 8, 4, 12, 12, 8], weights := [1, 0, 0, 1] }

-- Period 10, original row 5728, representative 10581.
def source53 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B017.Data.entryAt ⟨45, by decide +kernel⟩

def target53 : Weights.Entry :=
  { word := [8, 8, 8, 12, 4, 12, 8], weights := [1, 0, 0, 1] }

-- Period 10, original row 5735, representative 10571.
def source54 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B017.Data.entryAt ⟨35, by decide +kernel⟩

def target54 : Weights.Entry :=
  { word := [8, 8, 8, 12, 12, 12, 8], weights := [1, 0, 0, 1] }

-- Period 10, original row 5739, representative 10572.
def source55 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B017.Data.entryAt ⟨36, by decide +kernel⟩

def target55 : Weights.Entry :=
  { word := [8, 8, 9, 4, 4, 12, 8], weights := [1, 0, 0, 1] }

-- Period 10, original row 5743, representative 10562.
def source56 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B017.Data.entryAt ⟨26, by decide +kernel⟩

def target56 : Weights.Entry :=
  { word := [8, 8, 9, 4, 12, 12, 8], weights := [1, 0, 0, 1] }

-- Period 10, original row 5747, representative 10573.
def source57 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B017.Data.entryAt ⟨37, by decide +kernel⟩

def target57 : Weights.Entry :=
  { word := [8, 8, 9, 12, 4, 12, 8], weights := [1, 0, 0, 1] }

-- Period 10, original row 5751, representative 10563.
def source58 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B017.Data.entryAt ⟨27, by decide +kernel⟩

def target58 : Weights.Entry :=
  { word := [8, 8, 9, 12, 12, 12, 8], weights := [1, 0, 0, 1] }

-- Period 10, original row 6062, representative 10558.
def source59 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B017.Data.entryAt ⟨22, by decide +kernel⟩

def target59 : Weights.Entry :=
  { word := [8, 10, 0, 1, 8, 1, 4], weights := [0, 1, 0, 0] }

def points59 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2), (9, 0)]

-- Period 10, original row 6064, representative 10556.
def source60 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B017.Data.entryAt ⟨20, by decide +kernel⟩

def target60 : Weights.Entry :=
  { word := [8, 10, 0, 1, 8, 2, 2], weights := [0, 1, 0, 0] }

def points60 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2), (9, 0)]

-- Period 10, original row 6067, representative 10560.
def source61 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B017.Data.entryAt ⟨24, by decide +kernel⟩

def target61 : Weights.Entry :=
  { word := [8, 10, 0, 1, 8, 8, 4], weights := [0, 1, 0, 0] }

def points61 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2), (9, 0)]

-- Period 10, original row 6069, representative 10554.
def source62 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B017.Data.entryAt ⟨18, by decide +kernel⟩

def target62 : Weights.Entry :=
  { word := [8, 10, 0, 1, 8, 9, 4], weights := [0, 1, 0, 0] }

def points62 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2), (9, 0)]

-- Period 10, original row 6071, representative 10552.
def source63 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B017.Data.entryAt ⟨16, by decide +kernel⟩

def target63 : Weights.Entry :=
  { word := [8, 10, 0, 1, 8, 10, 2], weights := [0, 1, 0, 0] }

def points63 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2), (9, 0)]

-- Period 10, original row 6076, representative 10594.
def source64 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B017.Data.entryAt ⟨58, by decide +kernel⟩

def target64 : Weights.Entry :=
  { word := [8, 10, 0, 2, 0, 8, 8], weights := [0, 3, 0, 1] }

def points64 : List (ℕ × ℕ) := [(0, 9), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2), (9, 0)]

-- Period 10, original row 6078, representative 10548.
def source65 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B017.Data.entryAt ⟨12, by decide +kernel⟩

def target65 : Weights.Entry :=
  { word := [8, 10, 0, 6, 0, 4, 8], weights := [1, 1, 1, 1] }

def points65 : List (ℕ × ℕ) := [(0, 9), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2), (9, 0)]

-- Period 10, original row 6079, representative 10546.
def source66 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B017.Data.entryAt ⟨10, by decide +kernel⟩

def target66 : Weights.Entry :=
  { word := [8, 10, 0, 6, 0, 12, 8], weights := [1, 1, 1, 1] }

-- Period 10, original row 6080, representative 10547.
def source67 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B017.Data.entryAt ⟨11, by decide +kernel⟩

def target67 : Weights.Entry :=
  { word := [8, 10, 0, 6, 8, 4, 8], weights := [1, 1, 0, 1] }

def points67 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2), (9, 0)]

-- Period 10, original row 6081, representative 10543.
def source68 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B017.Data.entryAt ⟨7, by decide +kernel⟩

def target68 : Weights.Entry :=
  { word := [8, 10, 0, 6, 8, 12, 8], weights := [1, 1, 1, 1] }

-- Period 10, original row 6084, representative 10549.
def source69 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B017.Data.entryAt ⟨13, by decide +kernel⟩

def target69 : Weights.Entry :=
  { word := [8, 10, 0, 8, 1, 4, 8], weights := [0, 1, 1, 0] }

def points69 : List (ℕ × ℕ) := [(0, 9), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2), (9, 0)]

-- Period 10, original row 6099, representative 10559.
def source70 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B017.Data.entryAt ⟨23, by decide +kernel⟩

def target70 : Weights.Entry :=
  { word := [8, 10, 0, 9, 8, 1, 4], weights := [0, 1, 0, 0] }

def points70 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2), (9, 0)]

-- Period 10, original row 6101, representative 10557.
def source71 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B017.Data.entryAt ⟨21, by decide +kernel⟩

def target71 : Weights.Entry :=
  { word := [8, 10, 0, 9, 8, 2, 2], weights := [0, 1, 0, 0] }

def points71 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2), (9, 0)]

-- Period 10, original row 6106, representative 10561.
def source72 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B017.Data.entryAt ⟨25, by decide +kernel⟩

def target72 : Weights.Entry :=
  { word := [8, 10, 0, 9, 8, 8, 4], weights := [0, 1, 0, 0] }

def points72 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2), (9, 0)]

-- Period 10, original row 6109, representative 10555.
def source73 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B017.Data.entryAt ⟨19, by decide +kernel⟩

def target73 : Weights.Entry :=
  { word := [8, 10, 0, 9, 8, 9, 4], weights := [0, 1, 0, 0] }

def points73 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2), (9, 0)]

-- Period 10, original row 6111, representative 10553.
def source74 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B017.Data.entryAt ⟨17, by decide +kernel⟩

def target74 : Weights.Entry :=
  { word := [8, 10, 0, 9, 8, 10, 2], weights := [0, 1, 0, 0] }

def points74 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2), (9, 0)]

-- Period 10, original row 6119, representative 10596.
def source75 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B017.Data.entryAt ⟨60, by decide +kernel⟩

def target75 : Weights.Entry :=
  { word := [8, 10, 0, 10, 0, 0, 8], weights := [0, 1, 0, 0] }

def points75 : List (ℕ × ℕ) := [(0, 7), (1, 8), (2, 9), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2), (9, 0)]

-- Period 10, original row 6125, representative 10538.
def source76 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B017.Data.entryAt ⟨2, by decide +kernel⟩

def target76 : Weights.Entry :=
  { word := [8, 10, 0, 10, 0, 8, 4], weights := [0, 1, 0, 1] }

def points76 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2), (9, 0)]

-- Period 10, original row 6126, representative 10595.
def source77 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B017.Data.entryAt ⟨59, by decide +kernel⟩

def target77 : Weights.Entry :=
  { word := [8, 10, 0, 10, 0, 8, 8], weights := [0, 1, 0, 1] }

def points77 : List (ℕ × ℕ) := [(0, 9), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2), (9, 0)]

-- Period 10, original row 6129, representative 10539.
def source78 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B017.Data.entryAt ⟨3, by decide +kernel⟩

def target78 : Weights.Entry :=
  { word := [8, 10, 0, 10, 8, 0, 4], weights := [0, 1, 0, 0] }

def points78 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2), (9, 0)]

-- Period 10, original row 6133, representative 10537.
def source79 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B017.Data.entryAt ⟨1, by decide +kernel⟩

def target79 : Weights.Entry :=
  { word := [8, 10, 0, 10, 8, 8, 4], weights := [0, 1, 0, 0] }

def points79 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2), (9, 0)]

-- Period 10, original row 6139, representative 10551.
def source80 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B017.Data.entryAt ⟨15, by decide +kernel⟩

def target80 : Weights.Entry :=
  { word := [8, 10, 0, 12, 2, 0, 4], weights := [1, 1, 0, 1] }

def points80 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2), (9, 0)]

-- Period 10, original row 6140, representative 10598.
def source81 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B017.Data.entryAt ⟨62, by decide +kernel⟩

def target81 : Weights.Entry :=
  { word := [8, 10, 0, 12, 2, 0, 8], weights := [1, 1, 0, 1] }

def points81 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2), (9, 0)]

-- Period 10, original row 6147, representative 10550.
def source82 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B017.Data.entryAt ⟨14, by decide +kernel⟩

def target82 : Weights.Entry :=
  { word := [8, 10, 0, 12, 10, 0, 4], weights := [1, 1, 0, 1] }

def points82 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2), (9, 0)]

-- Period 10, original row 6148, representative 10597.
def source83 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B017.Data.entryAt ⟨61, by decide +kernel⟩

def target83 : Weights.Entry :=
  { word := [8, 10, 0, 12, 10, 0, 8], weights := [1, 1, 0, 1] }

def points83 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2), (9, 0)]

-- Period 10, original row 6156, representative 10582.
def source84 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B017.Data.entryAt ⟨46, by decide +kernel⟩

def target84 : Weights.Entry :=
  { word := [8, 10, 2, 2, 8, 0, 8], weights := [1, 0, 0, 1] }

def points84 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 6161, representative 10576.
def source85 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B017.Data.entryAt ⟨40, by decide +kernel⟩

def target85 : Weights.Entry :=
  { word := [8, 10, 2, 2, 8, 1, 8], weights := [1, 0, 0, 1] }

def points85 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 6163, representative 10578.
def source86 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B017.Data.entryAt ⟨42, by decide +kernel⟩

def target86 : Weights.Entry :=
  { word := [8, 10, 2, 2, 8, 2, 8], weights := [1, 0, 0, 1] }

def points86 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 6168, representative 10580.
def source87 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B017.Data.entryAt ⟨44, by decide +kernel⟩

def target87 : Weights.Entry :=
  { word := [8, 10, 2, 2, 8, 8, 8], weights := [1, 0, 0, 1] }

def points87 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 6173, representative 10572.
def source88 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B017.Data.entryAt ⟨36, by decide +kernel⟩

def target88 : Weights.Entry :=
  { word := [8, 10, 2, 2, 8, 9, 8], weights := [1, 0, 0, 1] }

def points88 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 6175, representative 10574.
def source89 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B017.Data.entryAt ⟨38, by decide +kernel⟩

def target89 : Weights.Entry :=
  { word := [8, 10, 2, 2, 8, 10, 8], weights := [1, 0, 0, 1] }

-- Period 10, original row 6179, representative 10583.
def source90 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B017.Data.entryAt ⟨47, by decide +kernel⟩

def target90 : Weights.Entry :=
  { word := [8, 10, 2, 10, 8, 0, 8], weights := [1, 0, 0, 1] }

def points90 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 6184, representative 10577.
def source91 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B017.Data.entryAt ⟨41, by decide +kernel⟩

def target91 : Weights.Entry :=
  { word := [8, 10, 2, 10, 8, 1, 8], weights := [1, 0, 0, 1] }

def points91 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 6186, representative 10579.
def source92 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B017.Data.entryAt ⟨43, by decide +kernel⟩

def target92 : Weights.Entry :=
  { word := [8, 10, 2, 10, 8, 2, 8], weights := [1, 0, 0, 1] }

def points92 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 6196, representative 10581.
def source93 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B017.Data.entryAt ⟨45, by decide +kernel⟩

def target93 : Weights.Entry :=
  { word := [8, 10, 2, 10, 8, 8, 8], weights := [1, 0, 0, 1] }

def points93 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 6201, representative 10573.
def source94 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B017.Data.entryAt ⟨37, by decide +kernel⟩

def target94 : Weights.Entry :=
  { word := [8, 10, 2, 10, 8, 9, 8], weights := [1, 0, 0, 1] }

def points94 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 6203, representative 10575.
def source95 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B017.Data.entryAt ⟨39, by decide +kernel⟩

def target95 : Weights.Entry :=
  { word := [8, 10, 2, 10, 8, 10, 8], weights := [1, 0, 0, 1] }

-- Period 10, original row 6211, representative 10584.
def source96 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B017.Data.entryAt ⟨48, by decide +kernel⟩

def target96 : Weights.Entry :=
  { word := [8, 10, 8, 2, 0, 1, 8], weights := [0, 1, 0, 1] }

def points96 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 6213, representative 10584.
def source97 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B017.Data.entryAt ⟨48, by decide +kernel⟩

def target97 : Weights.Entry :=
  { word := [8, 10, 8, 2, 0, 2, 8], weights := [0, 1, 0, 1] }

def points97 : List (ℕ × ℕ) := [(0, 7), (1, 9), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 6218, representative 10592.
def source98 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B017.Data.entryAt ⟨56, by decide +kernel⟩

def target98 : Weights.Entry :=
  { word := [8, 10, 8, 2, 0, 8, 8], weights := [0, 1, 0, 1] }

def points98 : List (ℕ × ℕ) := [(0, 9), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 6223, representative 10585.
def source99 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B017.Data.entryAt ⟨49, by decide +kernel⟩

def target99 : Weights.Entry :=
  { word := [8, 10, 8, 2, 0, 9, 8], weights := [0, 1, 0, 1] }

def points99 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 6225, representative 10585.
def source100 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B017.Data.entryAt ⟨49, by decide +kernel⟩

def target100 : Weights.Entry :=
  { word := [8, 10, 8, 2, 0, 10, 8], weights := [0, 1, 0, 1] }

def points100 : List (ℕ × ℕ) := [(0, 9), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 6227, representative 10589.
def source101 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B017.Data.entryAt ⟨53, by decide +kernel⟩

def target101 : Weights.Entry :=
  { word := [8, 10, 8, 2, 8, 2, 8], weights := [0, 1, 0, 0] }

def points101 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 6233, representative 10586.
def source102 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B017.Data.entryAt ⟨50, by decide +kernel⟩

def target102 : Weights.Entry :=
  { word := [8, 10, 8, 2, 8, 10, 8], weights := [0, 1, 0, 0] }

-- Period 10, original row 6238, representative 10545.
def source103 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B017.Data.entryAt ⟨9, by decide +kernel⟩

def target103 : Weights.Entry :=
  { word := [8, 10, 8, 6, 0, 4, 8], weights := [1, 1, 1, 1] }

def points103 : List (ℕ × ℕ) := [(0, 9), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 6239, representative 10543.
def source104 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B017.Data.entryAt ⟨7, by decide +kernel⟩

def target104 : Weights.Entry :=
  { word := [8, 10, 8, 6, 0, 12, 8], weights := [1, 1, 1, 1] }

def points104 : List (ℕ × ℕ) := [(0, 9), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 6240, representative 10544.
def source105 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B017.Data.entryAt ⟨8, by decide +kernel⟩

def target105 : Weights.Entry :=
  { word := [8, 10, 8, 6, 8, 4, 8], weights := [0, 1, 1, 0] }

def points105 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 6241, representative 10542.
def source106 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B017.Data.entryAt ⟨6, by decide +kernel⟩

def target106 : Weights.Entry :=
  { word := [8, 10, 8, 6, 8, 12, 8], weights := [0, 1, 1, 0] }

-- Period 10, original row 6251, representative 10591.
def source107 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B017.Data.entryAt ⟨55, by decide +kernel⟩

def target107 : Weights.Entry :=
  { word := [8, 10, 8, 10, 0, 1, 8], weights := [0, 1, 0, 1] }

def points107 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 6253, representative 10591.
def source108 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B017.Data.entryAt ⟨55, by decide +kernel⟩

def target108 : Weights.Entry :=
  { word := [8, 10, 8, 10, 0, 2, 8], weights := [0, 1, 0, 1] }

def points108 : List (ℕ × ℕ) := [(0, 7), (1, 9), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 6257, representative 10536.
def source109 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B017.Data.entryAt ⟨0, by decide +kernel⟩

def target109 : Weights.Entry :=
  { word := [8, 10, 8, 10, 0, 8, 2], weights := [0, 1, 0, 1] }

def points109 : List (ℕ × ℕ) := [(0, 9), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 6258, representative 10536.
def source110 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B017.Data.entryAt ⟨0, by decide +kernel⟩

def target110 : Weights.Entry :=
  { word := [8, 10, 8, 10, 0, 8, 4], weights := [0, 1, 0, 1] }

def points110 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 6259, representative 10593.
def source111 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B017.Data.entryAt ⟨57, by decide +kernel⟩

def target111 : Weights.Entry :=
  { word := [8, 10, 8, 10, 0, 8, 8], weights := [0, 1, 0, 1] }

def points111 : List (ℕ × ℕ) := [(0, 9), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 6264, representative 10588.
def source112 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B017.Data.entryAt ⟨52, by decide +kernel⟩

def target112 : Weights.Entry :=
  { word := [8, 10, 8, 10, 0, 9, 8], weights := [0, 1, 0, 1] }

def points112 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 6266, representative 10588.
def source113 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B017.Data.entryAt ⟨52, by decide +kernel⟩

def target113 : Weights.Entry :=
  { word := [8, 10, 8, 10, 0, 10, 8], weights := [0, 1, 0, 1] }

def points113 : List (ℕ × ℕ) := [(0, 9), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 6269, representative 10590.
def source114 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B017.Data.entryAt ⟨54, by decide +kernel⟩

def target114 : Weights.Entry :=
  { word := [8, 10, 8, 10, 8, 2, 8], weights := [0, 1, 0, 0] }

def points114 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 6277, representative 10587.
def source115 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B017.Data.entryAt ⟨51, by decide +kernel⟩

def target115 : Weights.Entry :=
  { word := [8, 10, 8, 10, 8, 10, 8], weights := [0, 1, 0, 0] }

-- Period 10, original row 6281, representative 10541.
def source116 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B017.Data.entryAt ⟨5, by decide +kernel⟩

def target116 : Weights.Entry :=
  { word := [8, 10, 8, 12, 4, 4, 8], weights := [0, 1, 1, 0] }

def points116 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 6285, representative 10540.
def source117 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B017.Data.entryAt ⟨4, by decide +kernel⟩

def target117 : Weights.Entry :=
  { word := [8, 10, 8, 12, 12, 4, 8], weights := [0, 1, 1, 0] }

def points117 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 6289, representative 10566.
def source118 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B017.Data.entryAt ⟨30, by decide +kernel⟩

def target118 : Weights.Entry :=
  { word := [8, 10, 10, 2, 8, 1, 8], weights := [1, 0, 0, 1] }

def points118 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 6291, representative 10568.
def source119 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B017.Data.entryAt ⟨32, by decide +kernel⟩

def target119 : Weights.Entry :=
  { word := [8, 10, 10, 2, 8, 2, 8], weights := [1, 0, 0, 1] }

def points119 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 6296, representative 10570.
def source120 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B017.Data.entryAt ⟨34, by decide +kernel⟩

def target120 : Weights.Entry :=
  { word := [8, 10, 10, 2, 8, 8, 8], weights := [1, 0, 0, 1] }

def points120 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 6301, representative 10562.
def source121 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B017.Data.entryAt ⟨26, by decide +kernel⟩

def target121 : Weights.Entry :=
  { word := [8, 10, 10, 2, 8, 9, 8], weights := [1, 0, 0, 1] }

def points121 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 6303, representative 10564.
def source122 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B017.Data.entryAt ⟨28, by decide +kernel⟩

def target122 : Weights.Entry :=
  { word := [8, 10, 10, 2, 8, 10, 8], weights := [1, 0, 0, 1] }

-- Period 10, original row 6306, representative 10567.
def source123 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B017.Data.entryAt ⟨31, by decide +kernel⟩

def target123 : Weights.Entry :=
  { word := [8, 10, 10, 10, 8, 1, 8], weights := [1, 0, 0, 1] }

def points123 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 6308, representative 10569.
def source124 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B017.Data.entryAt ⟨33, by decide +kernel⟩

def target124 : Weights.Entry :=
  { word := [8, 10, 10, 10, 8, 2, 8], weights := [1, 0, 0, 1] }

def points124 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 6318, representative 10571.
def source125 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B017.Data.entryAt ⟨35, by decide +kernel⟩

def target125 : Weights.Entry :=
  { word := [8, 10, 10, 10, 8, 8, 8], weights := [1, 0, 0, 1] }

def points125 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 6323, representative 10563.
def source126 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B017.Data.entryAt ⟨27, by decide +kernel⟩

def target126 : Weights.Entry :=
  { word := [8, 10, 10, 10, 8, 9, 8], weights := [1, 0, 0, 1] }

def points126 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 6325, representative 10565.
def source127 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B017.Data.entryAt ⟨29, by decide +kernel⟩

def target127 : Weights.Entry :=
  { word := [8, 10, 10, 10, 8, 10, 8], weights := [1, 0, 0, 1] }

def period10Entries : List Weights.Entry := [target0, target1, target2, target3, target4, target5, target6, target7, target8, target9, target10, target11, target12, target13, target14, target15, target16, target17, target18, target19, target20, target21, target22, target23, target24, target25, target26, target27, target28, target29, target30, target31, target32, target33, target34, target35, target36, target37, target38, target39, target40, target41, target42, target43, target44, target45, target46, target47, target48, target49, target50, target51, target52, target53, target54, target55, target56, target57, target58, target59, target60, target61, target62, target63, target64, target65, target66, target67, target68, target69, target70, target71, target72, target73, target74, target75, target76, target77, target78, target79, target80, target81, target82, target83, target84, target85, target86, target87, target88, target89, target90, target91, target92, target93, target94, target95, target96, target97, target98, target99, target100, target101, target102, target103, target104, target105, target106, target107, target108, target109, target110, target111, target112, target113, target114, target115, target116, target117, target118, target119, target120, target121, target122, target123, target124, target125, target126, target127]

def period10Chunk : RowCoverage.Chunk where
  rows := [⟨2444, target0⟩, ⟨2495, target1⟩, ⟨2507, target2⟩, ⟨2515, target3⟩, ⟨2566, target4⟩, ⟨2855, target5⟩, ⟨2880, target6⟩, ⟨2956, target7⟩, ⟨3022, target8⟩, ⟨3040, target9⟩, ⟨3089, target10⟩, ⟨3097, target11⟩, ⟨3682, target12⟩, ⟨3690, target13⟩, ⟨3790, target14⟩, ⟨4047, target15⟩, ⟨4055, target16⟩, ⟨4121, target17⟩, ⟨4143, target18⟩, ⟨4179, target19⟩, ⟨4301, target20⟩, ⟨4358, target21⟩, ⟨4379, target22⟩, ⟨4383, target23⟩, ⟨4387, target24⟩, ⟨4391, target25⟩, ⟨4395, target26⟩, ⟨4477, target27⟩, ⟨4685, target28⟩, ⟨4687, target29⟩, ⟨4704, target30⟩, ⟨4844, target31⟩, ⟨4876, target32⟩, ⟨4878, target33⟩, ⟨4922, target34⟩, ⟨4981, target35⟩, ⟨4999, target36⟩, ⟨5022, target37⟩, ⟨5058, target38⟩, ⟨5172, target39⟩, ⟨5180, target40⟩, ⟨5198, target41⟩, ⟨5214, target42⟩, ⟨5222, target43⟩, ⟨5240, target44⟩, ⟨5339, target45⟩, ⟨5365, target46⟩, ⟨5403, target47⟩, ⟨5428, target48⟩, ⟨5464, target49⟩, ⟨5500, target50⟩, ⟨5694, target51⟩, ⟨5702, target52⟩, ⟨5728, target53⟩, ⟨5735, target54⟩, ⟨5739, target55⟩, ⟨5743, target56⟩, ⟨5747, target57⟩, ⟨5751, target58⟩, ⟨6062, target59⟩, ⟨6064, target60⟩, ⟨6067, target61⟩, ⟨6069, target62⟩, ⟨6071, target63⟩, ⟨6076, target64⟩, ⟨6078, target65⟩, ⟨6079, target66⟩, ⟨6080, target67⟩, ⟨6081, target68⟩, ⟨6084, target69⟩, ⟨6099, target70⟩, ⟨6101, target71⟩, ⟨6106, target72⟩, ⟨6109, target73⟩, ⟨6111, target74⟩, ⟨6119, target75⟩, ⟨6125, target76⟩, ⟨6126, target77⟩, ⟨6129, target78⟩, ⟨6133, target79⟩, ⟨6139, target80⟩, ⟨6140, target81⟩, ⟨6147, target82⟩, ⟨6148, target83⟩, ⟨6156, target84⟩, ⟨6161, target85⟩, ⟨6163, target86⟩, ⟨6168, target87⟩, ⟨6173, target88⟩, ⟨6175, target89⟩, ⟨6179, target90⟩, ⟨6184, target91⟩, ⟨6186, target92⟩, ⟨6196, target93⟩, ⟨6201, target94⟩, ⟨6203, target95⟩, ⟨6211, target96⟩, ⟨6213, target97⟩, ⟨6218, target98⟩, ⟨6223, target99⟩, ⟨6225, target100⟩, ⟨6227, target101⟩, ⟨6233, target102⟩, ⟨6238, target103⟩, ⟨6239, target104⟩, ⟨6240, target105⟩, ⟨6241, target106⟩, ⟨6251, target107⟩, ⟨6253, target108⟩, ⟨6257, target109⟩, ⟨6258, target110⟩, ⟨6259, target111⟩, ⟨6264, target112⟩, ⟨6266, target113⟩, ⟨6269, target114⟩, ⟨6277, target115⟩, ⟨6281, target116⟩, ⟨6285, target117⟩, ⟨6289, target118⟩, ⟨6291, target119⟩, ⟨6296, target120⟩, ⟨6301, target121⟩, ⟨6303, target122⟩, ⟨6306, target123⟩, ⟨6308, target124⟩, ⟨6318, target125⟩, ⟨6323, target126⟩, ⟨6325, target127⟩]
  indexMask := 130119347696085869647830957340600285486515943579230711878860785634624267487199201003409318945588345867756492518036647603952724933652875846484801502185006405820213605122031865446610652733352545480072586397374044889576770621299417497124174278377280934210483899758860222524582607117121639192548310780865240560042078967959851635981616581270395097180032902788201832021069883673509814608255178744845353622813150322615411759775960857825045938403114013207166570279066538016793634390582214846206922102649058888561164369579762147668956329726563014966752501747834184539746766389833017985243173503098498408948570730760753173524184701439368361497863976232584435867733185356117827166954861225886027583636790289075110089410958905364948870634138539049060758702462456681036047259396516424056512082830134409073360498163231636674625589174462629447624736153954798434401559162330330227060768725688466377191999394126423185323898675722512273644813434874895033870482984039643415127620809143521355780983387145845895606908045260905159851867958071193578732127526890669136583558102331966131683638968674467230787323941524487787192954988240041025576359426222972621178630053084849441783926924422344914701870354824021339286457195324529516723211653621134584118471259732077597301736079131947787129395515547844657116855028518204695835584447217042805410373454258690357581879728583682942661852928298549296040126799426628863134143013649227440539854794284959547296613656726961146748790612124434156721505998144074896475894525879276571739048164411261791406067604583563792649691380427173734562575640672723037769291022174874632484618692808387396270514419370307424165553038176466031374131731812832049144379598982063044021863446185780572628084872516464152623674999290003509659288777113406216893497721361953667884210667003305193869393651349392862707272124181915642704470363907942254998802357185427468131966160208308556700588428563861077692524001230848
  count := 128

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

end FranklSmallCyclic.TransportBatches.G095.B000.Data
