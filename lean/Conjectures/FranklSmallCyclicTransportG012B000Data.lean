module

public import Conjectures.FranklSmallCyclicRowCoverage
public import Conjectures.FranklSmallCyclicCanonicalWords
public import Conjectures.FranklSmallCyclicOrbit7Block012Data

/-! 128 literal targets sharing one source proof block.
Original words and row indices are retained; weights may be transported.
-/
@[expose] public section

namespace FranklSmallCyclic.TransportBatches.G012.B000.Data

-- Period 7, original row 4, representative 1594.
def source0 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B012.Data.entryAt ⟨45, by decide +kernel⟩

def target0 : Weights.Entry :=
  { word := [0, 0, 1, 4, 2, 0, 9], weights := [0, 0, 1, 0] }

-- Period 7, original row 5, representative 1577.
def source1 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B012.Data.entryAt ⟨28, by decide +kernel⟩

def target1 : Weights.Entry :=
  { word := [0, 0, 1, 4, 2, 0, 10], weights := [0, 0, 1, 0] }

-- Period 7, original row 6, representative 1594.
def source2 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B012.Data.entryAt ⟨45, by decide +kernel⟩

def target2 : Weights.Entry :=
  { word := [0, 0, 1, 4, 2, 0, 12], weights := [1, 0, 0, 0] }

def points2 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 5), (4, 4), (5, 3), (6, 6)]

-- Period 7, original row 26, representative 1564.
def source3 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B012.Data.entryAt ⟨15, by decide +kernel⟩

def target3 : Weights.Entry :=
  { word := [0, 0, 1, 4, 10, 0, 9], weights := [0, 0, 1, 0] }

-- Period 7, original row 27, representative 1558.
def source4 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B012.Data.entryAt ⟨9, by decide +kernel⟩

def target4 : Weights.Entry :=
  { word := [0, 0, 1, 4, 10, 0, 10], weights := [0, 0, 1, 0] }

-- Period 7, original row 28, representative 1590.
def source5 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B012.Data.entryAt ⟨41, by decide +kernel⟩

def target5 : Weights.Entry :=
  { word := [0, 0, 1, 4, 10, 0, 12], weights := [1, 0, 0, 1] }

-- Period 7, original row 50, representative 1594.
def source6 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B012.Data.entryAt ⟨45, by decide +kernel⟩

def target6 : Weights.Entry :=
  { word := [0, 0, 2, 2, 2, 0, 9], weights := [0, 1, 0, 0] }

def points6 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 5), (5, 4), (6, 6)]

-- Period 7, original row 51, representative 1577.
def source7 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B012.Data.entryAt ⟨28, by decide +kernel⟩

def target7 : Weights.Entry :=
  { word := [0, 0, 2, 2, 2, 0, 10], weights := [0, 1, 0, 0] }

def points7 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 5), (5, 4), (6, 6)]

-- Period 7, original row 52, representative 1594.
def source8 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B012.Data.entryAt ⟨45, by decide +kernel⟩

def target8 : Weights.Entry :=
  { word := [0, 0, 2, 2, 2, 0, 12], weights := [1, 0, 0, 0] }

def points8 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 4), (4, 5), (5, 3), (6, 6)]

-- Period 7, original row 65, representative 1564.
def source9 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B012.Data.entryAt ⟨15, by decide +kernel⟩

def target9 : Weights.Entry :=
  { word := [0, 0, 2, 2, 10, 0, 9], weights := [0, 1, 0, 0] }

def points9 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 5), (5, 4), (6, 6)]

-- Period 7, original row 66, representative 1558.
def source10 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B012.Data.entryAt ⟨9, by decide +kernel⟩

def target10 : Weights.Entry :=
  { word := [0, 0, 2, 2, 10, 0, 10], weights := [0, 1, 0, 0] }

def points10 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 5), (5, 4), (6, 6)]

-- Period 7, original row 67, representative 1590.
def source11 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B012.Data.entryAt ⟨41, by decide +kernel⟩

def target11 : Weights.Entry :=
  { word := [0, 0, 2, 2, 10, 0, 12], weights := [1, 0, 0, 1] }

def points11 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 5), (5, 4), (6, 6)]

-- Period 7, original row 141, representative 1655.
def source12 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B012.Data.entryAt ⟨106, by decide +kernel⟩

def target12 : Weights.Entry :=
  { word := [0, 1, 0, 12, 0, 12, 4], weights := [1, 0, 1, 0] }

-- Period 7, original row 300, representative 1655.
def source13 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B012.Data.entryAt ⟨106, by decide +kernel⟩

def target13 : Weights.Entry :=
  { word := [0, 2, 0, 8, 1, 12, 4], weights := [0, 1, 1, 0] }

def points13 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6)]

-- Period 7, original row 303, representative 1611.
def source14 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B012.Data.entryAt ⟨62, by decide +kernel⟩

def target14 : Weights.Entry :=
  { word := [0, 2, 0, 8, 4, 4, 4], weights := [0, 1, 0, 1] }

-- Period 7, original row 312, representative 1648.
def source15 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B012.Data.entryAt ⟨99, by decide +kernel⟩

def target15 : Weights.Entry :=
  { word := [0, 2, 0, 8, 9, 12, 4], weights := [0, 1, 1, 0] }

-- Period 7, original row 314, representative 1607.
def source16 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B012.Data.entryAt ⟨58, by decide +kernel⟩

def target16 : Weights.Entry :=
  { word := [0, 2, 0, 8, 12, 4, 4], weights := [0, 1, 0, 1] }

-- Period 7, original row 411, representative 1610.
def source17 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B012.Data.entryAt ⟨61, by decide +kernel⟩

def target17 : Weights.Entry :=
  { word := [0, 2, 8, 8, 4, 4, 4], weights := [0, 1, 0, 1] }

-- Period 7, original row 414, representative 1603.
def source18 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B012.Data.entryAt ⟨54, by decide +kernel⟩

def target18 : Weights.Entry :=
  { word := [0, 2, 8, 8, 4, 12, 4], weights := [0, 1, 0, 1] }

-- Period 7, original row 416, representative 1606.
def source19 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B012.Data.entryAt ⟨57, by decide +kernel⟩

def target19 : Weights.Entry :=
  { word := [0, 2, 8, 8, 12, 4, 4], weights := [0, 1, 0, 1] }

-- Period 7, original row 419, representative 1601.
def source20 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B012.Data.entryAt ⟨52, by decide +kernel⟩

def target20 : Weights.Entry :=
  { word := [0, 2, 8, 8, 12, 12, 4], weights := [0, 1, 0, 1] }

-- Period 7, original row 510, representative 1577.
def source21 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B012.Data.entryAt ⟨28, by decide +kernel⟩

def target21 : Weights.Entry :=
  { word := [0, 4, 0, 4, 2, 0, 9], weights := [0, 0, 1, 0] }

def points21 : List (ℕ × ℕ) := [(0, 0), (1, 2), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 511, representative 1594.
def source22 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B012.Data.entryAt ⟨45, by decide +kernel⟩

def target22 : Weights.Entry :=
  { word := [0, 4, 0, 4, 2, 0, 10], weights := [0, 0, 1, 0] }

def points22 : List (ℕ × ℕ) := [(0, 0), (1, 2), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 512, representative 1594.
def source23 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B012.Data.entryAt ⟨45, by decide +kernel⟩

def target23 : Weights.Entry :=
  { word := [0, 4, 0, 4, 2, 0, 12], weights := [1, 0, 0, 0] }

def points23 : List (ℕ × ℕ) := [(0, 1), (1, 2), (2, 0), (3, 5), (4, 4), (5, 3), (6, 6)]

-- Period 7, original row 532, representative 1558.
def source24 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B012.Data.entryAt ⟨9, by decide +kernel⟩

def target24 : Weights.Entry :=
  { word := [0, 4, 0, 4, 10, 0, 9], weights := [0, 0, 1, 0] }

def points24 : List (ℕ × ℕ) := [(0, 0), (1, 2), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 533, representative 1564.
def source25 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B012.Data.entryAt ⟨15, by decide +kernel⟩

def target25 : Weights.Entry :=
  { word := [0, 4, 0, 4, 10, 0, 10], weights := [0, 0, 1, 0] }

def points25 : List (ℕ × ℕ) := [(0, 0), (1, 2), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 534, representative 1590.
def source26 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B012.Data.entryAt ⟨41, by decide +kernel⟩

def target26 : Weights.Entry :=
  { word := [0, 4, 0, 4, 10, 0, 12], weights := [1, 0, 0, 1] }

def points26 : List (ℕ × ℕ) := [(0, 0), (1, 2), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 556, representative 1594.
def source27 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B012.Data.entryAt ⟨45, by decide +kernel⟩

def target27 : Weights.Entry :=
  { word := [0, 4, 2, 0, 1, 0, 9], weights := [0, 1, 0, 0] }

def points27 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 2), (3, 5), (4, 3), (5, 4), (6, 6)]

-- Period 7, original row 557, representative 1594.
def source28 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B012.Data.entryAt ⟨45, by decide +kernel⟩

def target28 : Weights.Entry :=
  { word := [0, 4, 2, 0, 1, 0, 10], weights := [0, 0, 1, 0] }

def points28 : List (ℕ × ℕ) := [(0, 2), (1, 0), (2, 1), (3, 4), (4, 3), (5, 5), (6, 6)]

-- Period 7, original row 558, representative 1577.
def source29 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B012.Data.entryAt ⟨28, by decide +kernel⟩

def target29 : Weights.Entry :=
  { word := [0, 4, 2, 0, 1, 0, 12], weights := [0, 0, 1, 0] }

def points29 : List (ℕ × ℕ) := [(0, 2), (1, 0), (2, 1), (3, 4), (4, 3), (5, 5), (6, 6)]

-- Period 7, original row 570, representative 1595.
def source30 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B012.Data.entryAt ⟨46, by decide +kernel⟩

def target30 : Weights.Entry :=
  { word := [0, 4, 2, 0, 9, 0, 9], weights := [0, 1, 0, 1] }

-- Period 7, original row 571, representative 1595.
def source31 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B012.Data.entryAt ⟨46, by decide +kernel⟩

def target31 : Weights.Entry :=
  { word := [0, 4, 2, 0, 9, 0, 10], weights := [0, 0, 1, 1] }

def points31 : List (ℕ × ℕ) := [(0, 0), (1, 2), (2, 1), (3, 3), (4, 5), (5, 4), (6, 6)]

-- Period 7, original row 572, representative 1578.
def source32 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B012.Data.entryAt ⟨29, by decide +kernel⟩

def target32 : Weights.Entry :=
  { word := [0, 4, 2, 0, 9, 0, 12], weights := [0, 1, 0, 1] }

-- Period 7, original row 583, representative 1574.
def source33 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B012.Data.entryAt ⟨25, by decide +kernel⟩

def target33 : Weights.Entry :=
  { word := [0, 4, 2, 8, 2, 0, 9], weights := [0, 1, 1, 0] }

-- Period 7, original row 584, representative 1574.
def source34 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B012.Data.entryAt ⟨25, by decide +kernel⟩

def target34 : Weights.Entry :=
  { word := [0, 4, 2, 8, 2, 0, 10], weights := [0, 1, 1, 0] }

def points34 : List (ℕ × ℕ) := [(0, 0), (1, 2), (2, 1), (3, 3), (4, 5), (5, 4), (6, 6)]

-- Period 7, original row 597, representative 1555.
def source35 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B012.Data.entryAt ⟨6, by decide +kernel⟩

def target35 : Weights.Entry :=
  { word := [0, 4, 2, 8, 10, 0, 9], weights := [0, 1, 1, 0] }

-- Period 7, original row 598, representative 1555.
def source36 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B012.Data.entryAt ⟨6, by decide +kernel⟩

def target36 : Weights.Entry :=
  { word := [0, 4, 2, 8, 10, 0, 10], weights := [0, 1, 1, 0] }

def points36 : List (ℕ × ℕ) := [(0, 0), (1, 2), (2, 1), (3, 3), (4, 5), (5, 4), (6, 6)]

-- Period 7, original row 606, representative 1594.
def source37 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B012.Data.entryAt ⟨45, by decide +kernel⟩

def target37 : Weights.Entry :=
  { word := [0, 4, 4, 4, 0, 0, 9], weights := [1, 0, 0, 0] }

def points37 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 2), (3, 5), (4, 4), (5, 3), (6, 6)]

-- Period 7, original row 607, representative 1594.
def source38 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B012.Data.entryAt ⟨45, by decide +kernel⟩

def target38 : Weights.Entry :=
  { word := [0, 4, 4, 4, 0, 0, 10], weights := [0, 0, 1, 0] }

def points38 : List (ℕ × ℕ) := [(0, 2), (1, 0), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 608, representative 1577.
def source39 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B012.Data.entryAt ⟨28, by decide +kernel⟩

def target39 : Weights.Entry :=
  { word := [0, 4, 4, 4, 0, 0, 12], weights := [0, 0, 1, 0] }

def points39 : List (ℕ × ℕ) := [(0, 2), (1, 0), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 620, representative 1588.
def source40 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B012.Data.entryAt ⟨39, by decide +kernel⟩

def target40 : Weights.Entry :=
  { word := [0, 4, 4, 4, 8, 0, 9], weights := [1, 0, 1, 0] }

-- Period 7, original row 621, representative 1569.
def source41 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B012.Data.entryAt ⟨20, by decide +kernel⟩

def target41 : Weights.Entry :=
  { word := [0, 4, 4, 4, 8, 0, 10], weights := [1, 0, 1, 0] }

-- Period 7, original row 622, representative 1571.
def source42 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B012.Data.entryAt ⟨22, by decide +kernel⟩

def target42 : Weights.Entry :=
  { word := [0, 4, 4, 4, 8, 0, 12], weights := [1, 0, 0, 1] }

-- Period 7, original row 639, representative 1579.
def source43 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B012.Data.entryAt ⟨30, by decide +kernel⟩

def target43 : Weights.Entry :=
  { word := [0, 4, 8, 4, 2, 0, 9], weights := [0, 0, 1, 0] }

-- Period 7, original row 640, representative 1596.
def source44 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B012.Data.entryAt ⟨47, by decide +kernel⟩

def target44 : Weights.Entry :=
  { word := [0, 4, 8, 4, 2, 0, 10], weights := [0, 0, 1, 0] }

-- Period 7, original row 641, representative 1596.
def source45 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B012.Data.entryAt ⟨47, by decide +kernel⟩

def target45 : Weights.Entry :=
  { word := [0, 4, 8, 4, 2, 0, 12], weights := [1, 0, 0, 0] }

def points45 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 2), (3, 5), (4, 4), (5, 3), (6, 6)]

-- Period 7, original row 665, representative 1559.
def source46 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B012.Data.entryAt ⟨10, by decide +kernel⟩

def target46 : Weights.Entry :=
  { word := [0, 4, 8, 4, 10, 0, 9], weights := [0, 0, 1, 0] }

-- Period 7, original row 666, representative 1565.
def source47 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B012.Data.entryAt ⟨16, by decide +kernel⟩

def target47 : Weights.Entry :=
  { word := [0, 4, 8, 4, 10, 0, 10], weights := [0, 0, 1, 0] }

-- Period 7, original row 667, representative 1591.
def source48 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B012.Data.entryAt ⟨42, by decide +kernel⟩

def target48 : Weights.Entry :=
  { word := [0, 4, 8, 4, 10, 0, 12], weights := [1, 0, 0, 1] }

-- Period 7, original row 728, representative 1589.
def source49 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B012.Data.entryAt ⟨40, by decide +kernel⟩

def target49 : Weights.Entry :=
  { word := [0, 4, 12, 4, 8, 0, 9], weights := [1, 0, 1, 0] }

-- Period 7, original row 729, representative 1570.
def source50 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B012.Data.entryAt ⟨21, by decide +kernel⟩

def target50 : Weights.Entry :=
  { word := [0, 4, 12, 4, 8, 0, 10], weights := [1, 0, 1, 0] }

-- Period 7, original row 730, representative 1572.
def source51 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B012.Data.entryAt ⟨23, by decide +kernel⟩

def target51 : Weights.Entry :=
  { word := [0, 4, 12, 4, 8, 0, 12], weights := [1, 0, 0, 1] }

-- Period 7, original row 743, representative 1671.
def source52 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B012.Data.entryAt ⟨122, by decide +kernel⟩

def target52 : Weights.Entry :=
  { word := [0, 6, 0, 12, 8, 12, 4], weights := [0, 1, 0, 1] }

-- Period 7, original row 774, representative 1670.
def source53 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B012.Data.entryAt ⟨121, by decide +kernel⟩

def target53 : Weights.Entry :=
  { word := [0, 6, 8, 12, 8, 12, 4], weights := [0, 1, 0, 1] }

-- Period 7, original row 817, representative 1597.
def source54 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B012.Data.entryAt ⟨48, by decide +kernel⟩

def target54 : Weights.Entry :=
  { word := [0, 8, 0, 4, 2, 0, 9], weights := [0, 0, 1, 0] }

-- Period 7, original row 818, representative 1597.
def source55 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B012.Data.entryAt ⟨48, by decide +kernel⟩

def target55 : Weights.Entry :=
  { word := [0, 8, 0, 4, 2, 0, 10], weights := [0, 0, 1, 0] }

def points55 : List (ℕ × ℕ) := [(0, 0), (1, 2), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 819, representative 1599.
def source56 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B012.Data.entryAt ⟨50, by decide +kernel⟩

def target56 : Weights.Entry :=
  { word := [0, 8, 0, 4, 2, 0, 12], weights := [1, 0, 0, 1] }

-- Period 7, original row 843, representative 1566.
def source57 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B012.Data.entryAt ⟨17, by decide +kernel⟩

def target57 : Weights.Entry :=
  { word := [0, 8, 0, 4, 10, 0, 9], weights := [0, 0, 1, 0] }

-- Period 7, original row 844, representative 1566.
def source58 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B012.Data.entryAt ⟨17, by decide +kernel⟩

def target58 : Weights.Entry :=
  { word := [0, 8, 0, 4, 10, 0, 10], weights := [0, 0, 1, 0] }

def points58 : List (ℕ × ℕ) := [(0, 0), (1, 2), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 845, representative 1598.
def source59 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B012.Data.entryAt ⟨49, by decide +kernel⟩

def target59 : Weights.Entry :=
  { word := [0, 8, 0, 4, 10, 0, 12], weights := [1, 0, 0, 1] }

-- Period 7, original row 896, representative 1586.
def source60 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B012.Data.entryAt ⟨37, by decide +kernel⟩

def target60 : Weights.Entry :=
  { word := [0, 8, 1, 4, 2, 0, 9], weights := [0, 0, 1, 0] }

-- Period 7, original row 918, representative 1560.
def source61 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B012.Data.entryAt ⟨11, by decide +kernel⟩

def target61 : Weights.Entry :=
  { word := [0, 8, 1, 4, 10, 0, 9], weights := [0, 0, 1, 0] }

-- Period 7, original row 942, representative 1592.
def source62 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B012.Data.entryAt ⟨43, by decide +kernel⟩

def target62 : Weights.Entry :=
  { word := [0, 8, 2, 2, 2, 0, 9], weights := [0, 1, 0, 0] }

-- Period 7, original row 943, representative 1575.
def source63 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B012.Data.entryAt ⟨26, by decide +kernel⟩

def target63 : Weights.Entry :=
  { word := [0, 8, 2, 2, 2, 0, 10], weights := [0, 1, 0, 0] }

-- Period 7, original row 944, representative 1580.
def source64 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B012.Data.entryAt ⟨31, by decide +kernel⟩

def target64 : Weights.Entry :=
  { word := [0, 8, 2, 2, 2, 0, 12], weights := [1, 0, 0, 1] }

-- Period 7, original row 957, representative 1562.
def source65 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B012.Data.entryAt ⟨13, by decide +kernel⟩

def target65 : Weights.Entry :=
  { word := [0, 8, 2, 2, 10, 0, 9], weights := [0, 1, 0, 0] }

-- Period 7, original row 958, representative 1556.
def source66 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B012.Data.entryAt ⟨7, by decide +kernel⟩

def target66 : Weights.Entry :=
  { word := [0, 8, 2, 2, 10, 0, 10], weights := [0, 1, 0, 0] }

-- Period 7, original row 959, representative 1581.
def source67 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B012.Data.entryAt ⟨32, by decide +kernel⟩

def target67 : Weights.Entry :=
  { word := [0, 8, 2, 2, 10, 0, 12], weights := [1, 0, 0, 1] }

-- Period 7, original row 972, representative 1593.
def source68 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B012.Data.entryAt ⟨44, by decide +kernel⟩

def target68 : Weights.Entry :=
  { word := [0, 8, 2, 10, 2, 0, 9], weights := [0, 1, 0, 0] }

-- Period 7, original row 973, representative 1576.
def source69 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B012.Data.entryAt ⟨27, by decide +kernel⟩

def target69 : Weights.Entry :=
  { word := [0, 8, 2, 10, 2, 0, 10], weights := [0, 1, 0, 0] }

-- Period 7, original row 974, representative 1583.
def source70 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B012.Data.entryAt ⟨34, by decide +kernel⟩

def target70 : Weights.Entry :=
  { word := [0, 8, 2, 10, 2, 0, 12], weights := [1, 1, 0, 0] }

-- Period 7, original row 986, representative 1563.
def source71 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B012.Data.entryAt ⟨14, by decide +kernel⟩

def target71 : Weights.Entry :=
  { word := [0, 8, 2, 10, 10, 0, 9], weights := [0, 1, 0, 0] }

-- Period 7, original row 987, representative 1557.
def source72 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B012.Data.entryAt ⟨8, by decide +kernel⟩

def target72 : Weights.Entry :=
  { word := [0, 8, 2, 10, 10, 0, 10], weights := [0, 1, 0, 0] }

-- Period 7, original row 988, representative 1582.
def source73 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B012.Data.entryAt ⟨33, by decide +kernel⟩

def target73 : Weights.Entry :=
  { word := [0, 8, 2, 10, 10, 0, 12], weights := [1, 1, 0, 0] }

-- Period 7, original row 1147, representative 1651.
def source74 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B012.Data.entryAt ⟨102, by decide +kernel⟩

def target74 : Weights.Entry :=
  { word := [0, 9, 0, 4, 0, 12, 4], weights := [1, 0, 1, 2] }

-- Period 7, original row 1173, representative 1652.
def source75 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B012.Data.entryAt ⟨103, by decide +kernel⟩

def target75 : Weights.Entry :=
  { word := [0, 9, 0, 4, 8, 12, 4], weights := [1, 0, 0, 1] }

-- Period 7, original row 1207, representative 1654.
def source76 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B012.Data.entryAt ⟨105, by decide +kernel⟩

def target76 : Weights.Entry :=
  { word := [0, 9, 0, 12, 0, 12, 4], weights := [1, 0, 1, 0] }

-- Period 7, original row 1232, representative 1653.
def source77 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B012.Data.entryAt ⟨104, by decide +kernel⟩

def target77 : Weights.Entry :=
  { word := [0, 9, 0, 12, 8, 12, 4], weights := [1, 0, 1, 0] }

-- Period 7, original row 1339, representative 1651.
def source78 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B012.Data.entryAt ⟨102, by decide +kernel⟩

def target78 : Weights.Entry :=
  { word := [0, 10, 0, 0, 1, 12, 4], weights := [0, 1, 1, 2] }

def points78 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6)]

-- Period 7, original row 1342, representative 1646.
def source79 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B012.Data.entryAt ⟨97, by decide +kernel⟩

def target79 : Weights.Entry :=
  { word := [0, 10, 0, 0, 9, 12, 4], weights := [0, 1, 1, 2] }

-- Period 7, original row 1349, representative 1654.
def source80 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B012.Data.entryAt ⟨105, by decide +kernel⟩

def target80 : Weights.Entry :=
  { word := [0, 10, 0, 8, 1, 12, 4], weights := [0, 1, 1, 0] }

def points80 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6)]

-- Period 7, original row 1352, representative 1609.
def source81 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B012.Data.entryAt ⟨60, by decide +kernel⟩

def target81 : Weights.Entry :=
  { word := [0, 10, 0, 8, 4, 4, 4], weights := [0, 1, 0, 1] }

-- Period 7, original row 1361, representative 1647.
def source82 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B012.Data.entryAt ⟨98, by decide +kernel⟩

def target82 : Weights.Entry :=
  { word := [0, 10, 0, 8, 9, 12, 4], weights := [0, 1, 1, 0] }

-- Period 7, original row 1363, representative 1605.
def source83 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B012.Data.entryAt ⟨56, by decide +kernel⟩

def target83 : Weights.Entry :=
  { word := [0, 10, 0, 8, 12, 4, 4], weights := [0, 1, 0, 1] }

-- Period 7, original row 1371, representative 1676.
def source84 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B012.Data.entryAt ⟨127, by decide +kernel⟩

def target84 : Weights.Entry :=
  { word := [0, 10, 0, 12, 8, 12, 4], weights := [0, 1, 0, 1] }

-- Period 7, original row 1405, representative 1672.
def source85 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B012.Data.entryAt ⟨123, by decide +kernel⟩

def target85 : Weights.Entry :=
  { word := [0, 10, 2, 2, 8, 12, 4], weights := [0, 1, 0, 1] }

-- Period 7, original row 1433, representative 1675.
def source86 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B012.Data.entryAt ⟨126, by decide +kernel⟩

def target86 : Weights.Entry :=
  { word := [0, 10, 2, 10, 8, 12, 4], weights := [0, 1, 0, 1] }

-- Period 7, original row 1443, representative 1608.
def source87 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B012.Data.entryAt ⟨59, by decide +kernel⟩

def target87 : Weights.Entry :=
  { word := [0, 10, 8, 8, 4, 4, 4], weights := [0, 1, 0, 1] }

-- Period 7, original row 1446, representative 1602.
def source88 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B012.Data.entryAt ⟨53, by decide +kernel⟩

def target88 : Weights.Entry :=
  { word := [0, 10, 8, 8, 4, 12, 4], weights := [0, 1, 0, 1] }

-- Period 7, original row 1448, representative 1604.
def source89 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B012.Data.entryAt ⟨55, by decide +kernel⟩

def target89 : Weights.Entry :=
  { word := [0, 10, 8, 8, 12, 4, 4], weights := [0, 1, 0, 1] }

-- Period 7, original row 1451, representative 1600.
def source90 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B012.Data.entryAt ⟨51, by decide +kernel⟩

def target90 : Weights.Entry :=
  { word := [0, 10, 8, 8, 12, 12, 4], weights := [0, 1, 0, 1] }

-- Period 7, original row 1480, representative 1673.
def source91 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B012.Data.entryAt ⟨124, by decide +kernel⟩

def target91 : Weights.Entry :=
  { word := [0, 10, 10, 2, 8, 12, 4], weights := [0, 1, 0, 1] }

-- Period 7, original row 1501, representative 1674.
def source92 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B012.Data.entryAt ⟨125, by decide +kernel⟩

def target92 : Weights.Entry :=
  { word := [0, 10, 10, 10, 8, 12, 4], weights := [0, 1, 0, 1] }

-- Period 7, original row 1510, representative 1586.
def source93 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B012.Data.entryAt ⟨37, by decide +kernel⟩

def target93 : Weights.Entry :=
  { word := [0, 12, 0, 4, 2, 0, 10], weights := [0, 0, 1, 0] }

def points93 : List (ℕ × ℕ) := [(0, 0), (1, 2), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 1532, representative 1560.
def source94 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B012.Data.entryAt ⟨11, by decide +kernel⟩

def target94 : Weights.Entry :=
  { word := [0, 12, 0, 4, 10, 0, 10], weights := [0, 0, 1, 0] }

def points94 : List (ℕ × ℕ) := [(0, 0), (1, 2), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 1555, representative 1552.
def source95 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B012.Data.entryAt ⟨3, by decide +kernel⟩

def target95 : Weights.Entry :=
  { word := [0, 12, 2, 0, 1, 0, 9], weights := [0, 1, 0, 1] }

-- Period 7, original row 1556, representative 1584.
def source96 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B012.Data.entryAt ⟨35, by decide +kernel⟩

def target96 : Weights.Entry :=
  { word := [0, 12, 2, 0, 1, 0, 10], weights := [0, 1, 0, 1] }

-- Period 7, original row 1569, representative 1553.
def source97 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B012.Data.entryAt ⟨4, by decide +kernel⟩

def target97 : Weights.Entry :=
  { word := [0, 12, 2, 0, 9, 0, 9], weights := [0, 1, 0, 1] }

-- Period 7, original row 1570, representative 1585.
def source98 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B012.Data.entryAt ⟨36, by decide +kernel⟩

def target98 : Weights.Entry :=
  { word := [0, 12, 2, 0, 9, 0, 10], weights := [0, 1, 0, 1] }

-- Period 7, original row 1583, representative 1573.
def source99 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B012.Data.entryAt ⟨24, by decide +kernel⟩

def target99 : Weights.Entry :=
  { word := [0, 12, 2, 8, 2, 0, 10], weights := [0, 1, 1, 0] }

-- Period 7, original row 1597, representative 1554.
def source100 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B012.Data.entryAt ⟨5, by decide +kernel⟩

def target100 : Weights.Entry :=
  { word := [0, 12, 2, 8, 10, 0, 10], weights := [0, 1, 1, 0] }

-- Period 7, original row 1605, representative 1552.
def source101 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B012.Data.entryAt ⟨3, by decide +kernel⟩

def target101 : Weights.Entry :=
  { word := [0, 12, 4, 4, 0, 0, 9], weights := [1, 0, 0, 1] }

def points101 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6)]

-- Period 7, original row 1606, representative 1584.
def source102 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B012.Data.entryAt ⟨35, by decide +kernel⟩

def target102 : Weights.Entry :=
  { word := [0, 12, 4, 4, 0, 0, 10], weights := [1, 0, 0, 1] }

def points102 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6)]

-- Period 7, original row 1619, representative 1550.
def source103 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B012.Data.entryAt ⟨1, by decide +kernel⟩

def target103 : Weights.Entry :=
  { word := [0, 12, 4, 4, 8, 0, 9], weights := [1, 0, 1, 0] }

-- Period 7, original row 1620, representative 1567.
def source104 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B012.Data.entryAt ⟨18, by decide +kernel⟩

def target104 : Weights.Entry :=
  { word := [0, 12, 4, 4, 8, 0, 10], weights := [1, 0, 1, 0] }

-- Period 7, original row 1638, representative 1549.
def source105 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B012.Data.entryAt ⟨0, by decide +kernel⟩

def target105 : Weights.Entry :=
  { word := [0, 12, 8, 4, 2, 0, 9], weights := [0, 0, 1, 0] }

-- Period 7, original row 1639, representative 1587.
def source106 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B012.Data.entryAt ⟨38, by decide +kernel⟩

def target106 : Weights.Entry :=
  { word := [0, 12, 8, 4, 2, 0, 10], weights := [0, 0, 1, 0] }

-- Period 7, original row 1665, representative 1561.
def source107 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B012.Data.entryAt ⟨12, by decide +kernel⟩

def target107 : Weights.Entry :=
  { word := [0, 12, 8, 4, 10, 0, 10], weights := [0, 0, 1, 0] }

-- Period 7, original row 1727, representative 1551.
def source108 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B012.Data.entryAt ⟨2, by decide +kernel⟩

def target108 : Weights.Entry :=
  { word := [0, 12, 12, 4, 8, 0, 9], weights := [1, 0, 1, 0] }

-- Period 7, original row 1728, representative 1568.
def source109 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B012.Data.entryAt ⟨19, by decide +kernel⟩

def target109 : Weights.Entry :=
  { word := [0, 12, 12, 4, 8, 0, 10], weights := [1, 0, 1, 0] }

-- Period 7, original row 1741, representative 1594.
def source110 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B012.Data.entryAt ⟨45, by decide +kernel⟩

def target110 : Weights.Entry :=
  { word := [1, 0, 1, 4, 2, 0, 9], weights := [0, 0, 1, 0] }

def points110 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 1742, representative 1577.
def source111 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B012.Data.entryAt ⟨28, by decide +kernel⟩

def target111 : Weights.Entry :=
  { word := [1, 0, 1, 4, 2, 0, 10], weights := [0, 0, 1, 0] }

def points111 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 1743, representative 1594.
def source112 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B012.Data.entryAt ⟨45, by decide +kernel⟩

def target112 : Weights.Entry :=
  { word := [1, 0, 1, 4, 2, 0, 12], weights := [1, 0, 0, 0] }

def points112 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 5), (4, 4), (5, 3), (6, 6)]

-- Period 7, original row 1763, representative 1564.
def source113 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B012.Data.entryAt ⟨15, by decide +kernel⟩

def target113 : Weights.Entry :=
  { word := [1, 0, 1, 4, 10, 0, 9], weights := [0, 0, 1, 0] }

def points113 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 1764, representative 1558.
def source114 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B012.Data.entryAt ⟨9, by decide +kernel⟩

def target114 : Weights.Entry :=
  { word := [1, 0, 1, 4, 10, 0, 10], weights := [0, 0, 1, 0] }

def points114 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 1765, representative 1590.
def source115 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B012.Data.entryAt ⟨41, by decide +kernel⟩

def target115 : Weights.Entry :=
  { word := [1, 0, 1, 4, 10, 0, 12], weights := [1, 0, 0, 1] }

def points115 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 1787, representative 1594.
def source116 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B012.Data.entryAt ⟨45, by decide +kernel⟩

def target116 : Weights.Entry :=
  { word := [1, 0, 2, 2, 2, 0, 9], weights := [0, 1, 0, 0] }

def points116 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 5), (5, 4), (6, 6)]

-- Period 7, original row 1788, representative 1577.
def source117 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B012.Data.entryAt ⟨28, by decide +kernel⟩

def target117 : Weights.Entry :=
  { word := [1, 0, 2, 2, 2, 0, 10], weights := [0, 1, 0, 0] }

def points117 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 5), (5, 4), (6, 6)]

-- Period 7, original row 1789, representative 1594.
def source118 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B012.Data.entryAt ⟨45, by decide +kernel⟩

def target118 : Weights.Entry :=
  { word := [1, 0, 2, 2, 2, 0, 12], weights := [1, 0, 0, 0] }

def points118 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 4), (4, 5), (5, 3), (6, 6)]

-- Period 7, original row 1802, representative 1564.
def source119 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B012.Data.entryAt ⟨15, by decide +kernel⟩

def target119 : Weights.Entry :=
  { word := [1, 0, 2, 2, 10, 0, 9], weights := [0, 1, 0, 0] }

def points119 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 5), (5, 4), (6, 6)]

-- Period 7, original row 1803, representative 1558.
def source120 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B012.Data.entryAt ⟨9, by decide +kernel⟩

def target120 : Weights.Entry :=
  { word := [1, 0, 2, 2, 10, 0, 10], weights := [0, 1, 0, 0] }

def points120 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 5), (5, 4), (6, 6)]

-- Period 7, original row 1804, representative 1590.
def source121 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B012.Data.entryAt ⟨41, by decide +kernel⟩

def target121 : Weights.Entry :=
  { word := [1, 0, 2, 2, 10, 0, 12], weights := [1, 0, 0, 1] }

def points121 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 5), (5, 4), (6, 6)]

-- Period 7, original row 1845, representative 1594.
def source122 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B012.Data.entryAt ⟨45, by decide +kernel⟩

def target122 : Weights.Entry :=
  { word := [1, 4, 2, 0, 1, 0, 9], weights := [0, 1, 0, 0] }

def points122 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 2), (3, 5), (4, 3), (5, 4), (6, 6)]

-- Period 7, original row 1846, representative 1594.
def source123 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B012.Data.entryAt ⟨45, by decide +kernel⟩

def target123 : Weights.Entry :=
  { word := [1, 4, 2, 0, 1, 0, 10], weights := [0, 0, 1, 0] }

def points123 : List (ℕ × ℕ) := [(0, 2), (1, 0), (2, 1), (3, 4), (4, 3), (5, 5), (6, 6)]

-- Period 7, original row 1847, representative 1577.
def source124 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B012.Data.entryAt ⟨28, by decide +kernel⟩

def target124 : Weights.Entry :=
  { word := [1, 4, 2, 0, 1, 0, 12], weights := [0, 0, 1, 0] }

def points124 : List (ℕ × ℕ) := [(0, 2), (1, 0), (2, 1), (3, 4), (4, 3), (5, 5), (6, 6)]

-- Period 7, original row 1859, representative 1595.
def source125 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B012.Data.entryAt ⟨46, by decide +kernel⟩

def target125 : Weights.Entry :=
  { word := [1, 4, 2, 0, 9, 0, 9], weights := [0, 1, 0, 1] }

def points125 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 1860, representative 1595.
def source126 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B012.Data.entryAt ⟨46, by decide +kernel⟩

def target126 : Weights.Entry :=
  { word := [1, 4, 2, 0, 9, 0, 10], weights := [0, 0, 1, 1] }

def points126 : List (ℕ × ℕ) := [(0, 0), (1, 2), (2, 1), (3, 3), (4, 5), (5, 4), (6, 6)]

-- Period 7, original row 1861, representative 1578.
def source127 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B012.Data.entryAt ⟨29, by decide +kernel⟩

def target127 : Weights.Entry :=
  { word := [1, 4, 2, 0, 9, 0, 12], weights := [0, 1, 0, 1] }

def points127 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

def period7Entries : List Weights.Entry := [target0, target1, target2, target3, target4, target5, target6, target7, target8, target9, target10, target11, target12, target13, target14, target15, target16, target17, target18, target19, target20, target21, target22, target23, target24, target25, target26, target27, target28, target29, target30, target31, target32, target33, target34, target35, target36, target37, target38, target39, target40, target41, target42, target43, target44, target45, target46, target47, target48, target49, target50, target51, target52, target53, target54, target55, target56, target57, target58, target59, target60, target61, target62, target63, target64, target65, target66, target67, target68, target69, target70, target71, target72, target73, target74, target75, target76, target77, target78, target79, target80, target81, target82, target83, target84, target85, target86, target87, target88, target89, target90, target91, target92, target93, target94, target95, target96, target97, target98, target99, target100, target101, target102, target103, target104, target105, target106, target107, target108, target109, target110, target111, target112, target113, target114, target115, target116, target117, target118, target119, target120, target121, target122, target123, target124, target125, target126, target127]

def period7Chunk : RowCoverage.Chunk where
  rows := [⟨4, target0⟩, ⟨5, target1⟩, ⟨6, target2⟩, ⟨26, target3⟩, ⟨27, target4⟩, ⟨28, target5⟩, ⟨50, target6⟩, ⟨51, target7⟩, ⟨52, target8⟩, ⟨65, target9⟩, ⟨66, target10⟩, ⟨67, target11⟩, ⟨141, target12⟩, ⟨300, target13⟩, ⟨303, target14⟩, ⟨312, target15⟩, ⟨314, target16⟩, ⟨411, target17⟩, ⟨414, target18⟩, ⟨416, target19⟩, ⟨419, target20⟩, ⟨510, target21⟩, ⟨511, target22⟩, ⟨512, target23⟩, ⟨532, target24⟩, ⟨533, target25⟩, ⟨534, target26⟩, ⟨556, target27⟩, ⟨557, target28⟩, ⟨558, target29⟩, ⟨570, target30⟩, ⟨571, target31⟩, ⟨572, target32⟩, ⟨583, target33⟩, ⟨584, target34⟩, ⟨597, target35⟩, ⟨598, target36⟩, ⟨606, target37⟩, ⟨607, target38⟩, ⟨608, target39⟩, ⟨620, target40⟩, ⟨621, target41⟩, ⟨622, target42⟩, ⟨639, target43⟩, ⟨640, target44⟩, ⟨641, target45⟩, ⟨665, target46⟩, ⟨666, target47⟩, ⟨667, target48⟩, ⟨728, target49⟩, ⟨729, target50⟩, ⟨730, target51⟩, ⟨743, target52⟩, ⟨774, target53⟩, ⟨817, target54⟩, ⟨818, target55⟩, ⟨819, target56⟩, ⟨843, target57⟩, ⟨844, target58⟩, ⟨845, target59⟩, ⟨896, target60⟩, ⟨918, target61⟩, ⟨942, target62⟩, ⟨943, target63⟩, ⟨944, target64⟩, ⟨957, target65⟩, ⟨958, target66⟩, ⟨959, target67⟩, ⟨972, target68⟩, ⟨973, target69⟩, ⟨974, target70⟩, ⟨986, target71⟩, ⟨987, target72⟩, ⟨988, target73⟩, ⟨1147, target74⟩, ⟨1173, target75⟩, ⟨1207, target76⟩, ⟨1232, target77⟩, ⟨1339, target78⟩, ⟨1342, target79⟩, ⟨1349, target80⟩, ⟨1352, target81⟩, ⟨1361, target82⟩, ⟨1363, target83⟩, ⟨1371, target84⟩, ⟨1405, target85⟩, ⟨1433, target86⟩, ⟨1443, target87⟩, ⟨1446, target88⟩, ⟨1448, target89⟩, ⟨1451, target90⟩, ⟨1480, target91⟩, ⟨1501, target92⟩, ⟨1510, target93⟩, ⟨1532, target94⟩, ⟨1555, target95⟩, ⟨1556, target96⟩, ⟨1569, target97⟩, ⟨1570, target98⟩, ⟨1583, target99⟩, ⟨1597, target100⟩, ⟨1605, target101⟩, ⟨1606, target102⟩, ⟨1619, target103⟩, ⟨1620, target104⟩, ⟨1638, target105⟩, ⟨1639, target106⟩, ⟨1665, target107⟩, ⟨1727, target108⟩, ⟨1728, target109⟩, ⟨1741, target110⟩, ⟨1742, target111⟩, ⟨1743, target112⟩, ⟨1763, target113⟩, ⟨1764, target114⟩, ⟨1765, target115⟩, ⟨1787, target116⟩, ⟨1788, target117⟩, ⟨1789, target118⟩, ⟨1802, target119⟩, ⟨1803, target120⟩, ⟨1804, target121⟩, ⟨1845, target122⟩, ⟨1846, target123⟩, ⟨1847, target124⟩, ⟨1859, target125⟩, ⟨1860, target126⟩, ⟨1861, target127⟩]
  indexMask := 288327778456624124968702133472458669397615016248267722786971590881563418166468529077339820272025905206538300909041748087422426385385757391295176936057162414198360469496104114274946379338907642412326987105687044708796506916181928825654502385158436669296098202800327045603488647229637287027423484842699795837931406929123826800475285793514004967464892110305022924098503457497727595395612854008291115884668670500608794807010832140356825755623867872149332118374735171223194905941521321011712587276610341798859919000604554197388100460007108505777402484781541459230832
  count := 128

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem period7Chunk_entries :
    period7Chunk.rows.map RowCoverage.TaggedRow.entry = period7Entries := rfl

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem period7_index_check :
    RowCoverage.indexCheck CanonicalWords.count period7Chunk = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem period7_words_check :
    RowCoverage.wordsCheck CanonicalWords.wordAt period7Chunk = true := by
  decide +kernel

end FranklSmallCyclic.TransportBatches.G012.B000.Data
