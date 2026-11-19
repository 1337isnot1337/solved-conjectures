module

public import Conjectures.FranklSmallCyclicRowCoverage
public import Conjectures.FranklSmallCyclicCanonicalWords
public import Conjectures.FranklSmallCyclicOrbit7Block013Data

/-! 48 literal targets sharing one source proof block.
Original words and row indices are retained; weights may be transported.
-/
@[expose] public section

namespace FranklSmallCyclic.TransportBatches.G013.B002.Data

-- Period 7, original row 4867, representative 1800.
def source0 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B013.Data.entryAt ⟨123, by decide +kernel⟩

def target0 : Weights.Entry :=
  { word := [8, 2, 8, 2, 8, 8, 4], weights := [0, 1, 0, 1] }

def points0 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 4907, representative 1731.
def source1 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B013.Data.entryAt ⟨54, by decide +kernel⟩

def target1 : Weights.Entry :=
  { word := [8, 2, 8, 10, 8, 4, 4], weights := [0, 2, 0, 1] }

def points1 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 4911, representative 1801.
def source2 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B013.Data.entryAt ⟨124, by decide +kernel⟩

def target2 : Weights.Entry :=
  { word := [8, 2, 8, 10, 8, 8, 4], weights := [0, 1, 0, 0] }

def points2 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 4932, representative 1804.
def source3 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B013.Data.entryAt ⟨127, by decide +kernel⟩

def target3 : Weights.Entry :=
  { word := [8, 2, 10, 2, 0, 8, 4], weights := [1, 0, 0, 1] }

def points3 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 4948, representative 1797.
def source4 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B013.Data.entryAt ⟨120, by decide +kernel⟩

def target4 : Weights.Entry :=
  { word := [8, 2, 10, 2, 8, 8, 4], weights := [1, 0, 0, 1] }

def points4 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 4980, representative 1729.
def source5 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B013.Data.entryAt ⟨52, by decide +kernel⟩

def target5 : Weights.Entry :=
  { word := [8, 2, 10, 10, 8, 4, 4], weights := [1, 1, 1, 1] }

def points5 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 4987, representative 1798.
def source6 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B013.Data.entryAt ⟨121, by decide +kernel⟩

def target6 : Weights.Entry :=
  { word := [8, 2, 10, 10, 8, 8, 4], weights := [1, 0, 0, 1] }

def points6 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 5303, representative 1722.
def source7 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B013.Data.entryAt ⟨45, by decide +kernel⟩

def target7 : Weights.Entry :=
  { word := [8, 6, 8, 12, 8, 4, 4], weights := [1, 1, 1, 1] }

def points7 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 6062, representative 1792.
def source8 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B013.Data.entryAt ⟨115, by decide +kernel⟩

def target8 : Weights.Entry :=
  { word := [8, 10, 0, 1, 8, 1, 4], weights := [0, 1, 0, 0] }

def points8 : List (ℕ × ℕ) := [(0, 1), (1, 2), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 6066, representative 1727.
def source9 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B013.Data.entryAt ⟨50, by decide +kernel⟩

def target9 : Weights.Entry :=
  { word := [8, 10, 0, 1, 8, 4, 4], weights := [0, 3, 1, 0] }

def points9 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 6067, representative 1794.
def source10 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B013.Data.entryAt ⟨117, by decide +kernel⟩

def target10 : Weights.Entry :=
  { word := [8, 10, 0, 1, 8, 8, 4], weights := [0, 1, 0, 0] }

def points10 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 6069, representative 1790.
def source11 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B013.Data.entryAt ⟨113, by decide +kernel⟩

def target11 : Weights.Entry :=
  { word := [8, 10, 0, 1, 8, 9, 4], weights := [0, 1, 0, 0] }

def points11 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 6083, representative 1701.
def source12 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B013.Data.entryAt ⟨24, by decide +kernel⟩

def target12 : Weights.Entry :=
  { word := [8, 10, 0, 8, 1, 4, 4], weights := [0, 2, 1, 1] }

def points12 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 6090, representative 1697.
def source13 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B013.Data.entryAt ⟨20, by decide +kernel⟩

def target13 : Weights.Entry :=
  { word := [8, 10, 0, 8, 9, 4, 4], weights := [0, 2, 1, 1] }

def points13 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 6099, representative 1793.
def source14 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B013.Data.entryAt ⟨116, by decide +kernel⟩

def target14 : Weights.Entry :=
  { word := [8, 10, 0, 9, 8, 1, 4], weights := [0, 1, 0, 0] }

def points14 : List (ℕ × ℕ) := [(0, 1), (1, 2), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 6103, representative 1728.
def source15 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B013.Data.entryAt ⟨51, by decide +kernel⟩

def target15 : Weights.Entry :=
  { word := [8, 10, 0, 9, 8, 4, 4], weights := [0, 3, 1, 0] }

def points15 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 6106, representative 1795.
def source16 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B013.Data.entryAt ⟨118, by decide +kernel⟩

def target16 : Weights.Entry :=
  { word := [8, 10, 0, 9, 8, 8, 4], weights := [0, 1, 0, 0] }

def points16 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 6109, representative 1791.
def source17 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B013.Data.entryAt ⟨114, by decide +kernel⟩

def target17 : Weights.Entry :=
  { word := [8, 10, 0, 9, 8, 9, 4], weights := [0, 1, 0, 0] }

def points17 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 6118, representative 1787.
def source18 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B013.Data.entryAt ⟨110, by decide +kernel⟩

def target18 : Weights.Entry :=
  { word := [8, 10, 0, 10, 0, 0, 4], weights := [0, 1, 0, 0] }

def points18 : List (ℕ × ℕ) := [(0, 1), (1, 2), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 6125, representative 1783.
def source19 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B013.Data.entryAt ⟨106, by decide +kernel⟩

def target19 : Weights.Entry :=
  { word := [8, 10, 0, 10, 0, 8, 4], weights := [0, 1, 0, 1] }

def points19 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 6129, representative 1786.
def source20 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B013.Data.entryAt ⟨109, by decide +kernel⟩

def target20 : Weights.Entry :=
  { word := [8, 10, 0, 10, 8, 0, 4], weights := [0, 1, 0, 0] }

def points20 : List (ℕ × ℕ) := [(0, 1), (1, 2), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 6131, representative 1726.
def source21 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B013.Data.entryAt ⟨49, by decide +kernel⟩

def target21 : Weights.Entry :=
  { word := [8, 10, 0, 10, 8, 4, 4], weights := [0, 2, 0, 1] }

def points21 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 6133, representative 1780.
def source22 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B013.Data.entryAt ⟨103, by decide +kernel⟩

def target22 : Weights.Entry :=
  { word := [8, 10, 0, 10, 8, 8, 4], weights := [0, 1, 0, 0] }

def points22 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 6139, representative 1789.
def source23 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B013.Data.entryAt ⟨112, by decide +kernel⟩

def target23 : Weights.Entry :=
  { word := [8, 10, 0, 12, 2, 0, 4], weights := [1, 1, 0, 1] }

def points23 : List (ℕ × ℕ) := [(0, 1), (1, 2), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 6147, representative 1788.
def source24 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B013.Data.entryAt ⟨111, by decide +kernel⟩

def target24 : Weights.Entry :=
  { word := [8, 10, 0, 12, 10, 0, 4], weights := [1, 1, 0, 1] }

def points24 : List (ℕ × ℕ) := [(0, 1), (1, 2), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 6155, representative 1784.
def source25 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B013.Data.entryAt ⟨107, by decide +kernel⟩

def target25 : Weights.Entry :=
  { word := [8, 10, 2, 2, 8, 0, 4], weights := [1, 0, 0, 1] }

def points25 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 6167, representative 1774.
def source26 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B013.Data.entryAt ⟨97, by decide +kernel⟩

def target26 : Weights.Entry :=
  { word := [8, 10, 2, 2, 8, 8, 4], weights := [1, 0, 0, 1] }

def points26 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 6178, representative 1785.
def source27 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B013.Data.entryAt ⟨108, by decide +kernel⟩

def target27 : Weights.Entry :=
  { word := [8, 10, 2, 10, 8, 0, 4], weights := [1, 0, 0, 1] }

def points27 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 6188, representative 1724.
def source28 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B013.Data.entryAt ⟨47, by decide +kernel⟩

def target28 : Weights.Entry :=
  { word := [8, 10, 2, 10, 8, 4, 4], weights := [1, 1, 1, 1] }

def points28 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 6195, representative 1777.
def source29 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B013.Data.entryAt ⟨100, by decide +kernel⟩

def target29 : Weights.Entry :=
  { word := [8, 10, 2, 10, 8, 8, 4], weights := [1, 0, 0, 1] }

def points29 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 6217, representative 1781.
def source30 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B013.Data.entryAt ⟨104, by decide +kernel⟩

def target30 : Weights.Entry :=
  { word := [8, 10, 8, 2, 0, 8, 4], weights := [0, 1, 0, 1] }

def points30 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 6230, representative 1778.
def source31 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B013.Data.entryAt ⟨101, by decide +kernel⟩

def target31 : Weights.Entry :=
  { word := [8, 10, 8, 2, 8, 8, 4], weights := [0, 1, 0, 1] }

def points31 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 6258, representative 1782.
def source32 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B013.Data.entryAt ⟨105, by decide +kernel⟩

def target32 : Weights.Entry :=
  { word := [8, 10, 8, 10, 0, 8, 4], weights := [0, 1, 0, 1] }

def points32 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 6270, representative 1725.
def source33 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B013.Data.entryAt ⟨48, by decide +kernel⟩

def target33 : Weights.Entry :=
  { word := [8, 10, 8, 10, 8, 4, 4], weights := [0, 2, 0, 1] }

def points33 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 6274, representative 1779.
def source34 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B013.Data.entryAt ⟨102, by decide +kernel⟩

def target34 : Weights.Entry :=
  { word := [8, 10, 8, 10, 8, 8, 4], weights := [0, 1, 0, 0] }

def points34 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 6295, representative 1775.
def source35 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B013.Data.entryAt ⟨98, by decide +kernel⟩

def target35 : Weights.Entry :=
  { word := [8, 10, 10, 2, 8, 8, 4], weights := [1, 0, 0, 1] }

def points35 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 6310, representative 1723.
def source36 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B013.Data.entryAt ⟨46, by decide +kernel⟩

def target36 : Weights.Entry :=
  { word := [8, 10, 10, 10, 8, 4, 4], weights := [1, 1, 1, 1] }

def points36 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 6317, representative 1776.
def source37 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B013.Data.entryAt ⟨99, by decide +kernel⟩

def target37 : Weights.Entry :=
  { word := [8, 10, 10, 10, 8, 8, 4], weights := [1, 0, 0, 1] }

def points37 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 8, original row 2387, representative 1764.
def source38 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B013.Data.entryAt ⟨87, by decide +kernel⟩

def target38 : Weights.Entry :=
  { word := [2, 0, 0, 9, 4, 4, 4], weights := [1, 0, 1, 1] }

def points38 : List (ℕ × ℕ) := [(0, 7), (1, 0), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 8, original row 2389, representative 1690.
def source39 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B013.Data.entryAt ⟨13, by decide +kernel⟩

def target39 : Weights.Entry :=
  { word := [2, 0, 0, 9, 4, 12, 4], weights := [1, 0, 1, 1] }

def points39 : List (ℕ × ℕ) := [(0, 7), (1, 0), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 8, original row 2391, representative 1762.
def source40 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B013.Data.entryAt ⟨85, by decide +kernel⟩

def target40 : Weights.Entry :=
  { word := [2, 0, 0, 9, 12, 4, 4], weights := [1, 0, 1, 1] }

def points40 : List (ℕ × ℕ) := [(0, 7), (1, 0), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 8, original row 2393, representative 1688.
def source41 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B013.Data.entryAt ⟨11, by decide +kernel⟩

def target41 : Weights.Entry :=
  { word := [2, 0, 0, 9, 12, 12, 4], weights := [1, 0, 1, 1] }

def points41 : List (ℕ × ℕ) := [(0, 7), (1, 0), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 8, original row 2398, representative 1721.
def source42 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B013.Data.entryAt ⟨44, by decide +kernel⟩

def target42 : Weights.Entry :=
  { word := [2, 0, 0, 12, 0, 4, 4], weights := [1, 0, 1, 0] }

def points42 : List (ℕ × ℕ) := [(0, 7), (1, 0), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 8, original row 2600, representative 1721.
def source43 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B013.Data.entryAt ⟨44, by decide +kernel⟩

def target43 : Weights.Entry :=
  { word := [2, 2, 0, 10, 0, 0, 4], weights := [1, 1, 0, 0] }

def points43 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 3), (4, 5), (5, 4), (6, 6)]

-- Period 8, original row 2628, representative 1764.
def source44 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B013.Data.entryAt ⟨87, by decide +kernel⟩

def target44 : Weights.Entry :=
  { word := [2, 2, 2, 8, 1, 0, 4], weights := [1, 1, 0, 1] }

def points44 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 8, original row 2770, representative 1762.
def source45 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B013.Data.entryAt ⟨85, by decide +kernel⟩

def target45 : Weights.Entry :=
  { word := [2, 2, 10, 8, 1, 0, 4], weights := [1, 1, 0, 1] }

def points45 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 8, original row 3222, representative 1690.
def source46 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B013.Data.entryAt ⟨13, by decide +kernel⟩

def target46 : Weights.Entry :=
  { word := [2, 10, 2, 8, 1, 0, 4], weights := [1, 1, 0, 1] }

def points46 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 8, original row 3368, representative 1688.
def source47 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B013.Data.entryAt ⟨11, by decide +kernel⟩

def target47 : Weights.Entry :=
  { word := [2, 10, 10, 8, 1, 0, 4], weights := [1, 1, 0, 1] }

def points47 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

def period7Entries : List Weights.Entry := [target0, target1, target2, target3, target4, target5, target6, target7, target8, target9, target10, target11, target12, target13, target14, target15, target16, target17, target18, target19, target20, target21, target22, target23, target24, target25, target26, target27, target28, target29, target30, target31, target32, target33, target34, target35, target36, target37]

def period7Chunk : RowCoverage.Chunk where
  rows := [⟨4867, target0⟩, ⟨4907, target1⟩, ⟨4911, target2⟩, ⟨4932, target3⟩, ⟨4948, target4⟩, ⟨4980, target5⟩, ⟨4987, target6⟩, ⟨5303, target7⟩, ⟨6062, target8⟩, ⟨6066, target9⟩, ⟨6067, target10⟩, ⟨6069, target11⟩, ⟨6083, target12⟩, ⟨6090, target13⟩, ⟨6099, target14⟩, ⟨6103, target15⟩, ⟨6106, target16⟩, ⟨6109, target17⟩, ⟨6118, target18⟩, ⟨6125, target19⟩, ⟨6129, target20⟩, ⟨6131, target21⟩, ⟨6133, target22⟩, ⟨6139, target23⟩, ⟨6147, target24⟩, ⟨6155, target25⟩, ⟨6167, target26⟩, ⟨6178, target27⟩, ⟨6188, target28⟩, ⟨6195, target29⟩, ⟨6217, target30⟩, ⟨6230, target31⟩, ⟨6258, target32⟩, ⟨6270, target33⟩, ⟨6274, target34⟩, ⟨6295, target35⟩, ⟨6310, target36⟩, ⟨6317, target37⟩]
  indexMask := 407251275106686541447942276311371270821866413127520947794077957297689355781237336531835440077471579847408657519702171722337938186763730668425157583892368970430867436255985022145599414409891829365105460802362104580016966840354519883281026094920177521296171442319892103299861808406554752697470673734660700489984440919977586327225223993297968329194255580160823881820192271464410422070933480021519078534807627056670497091545891211683802923575072298421722563517499317333396478211414474464025581755375811552679973007118240264350106455239156621878792243200808864956790952599929525459323708172131429836497551168008811553074270399573689722284232947227571591657500557191911400757168792687249076979622802363961680324334206138350658823018001462269657551101246017519455913995293989765684994076271641361488625901536039778703698620125563597918472834574810400412194793469401407706103635348584811656779975482508797365989057184122247490719834839787342621075653482018538484797335624875678270968074324604982029504581786567559016047039948065124615114909110632062803744657377103258119367859132717786213513621638403408189080891666156557701160724238831970286391432224841875783717090590215566576862696071291094624693891882696792442940987071759522758674723045138472551694936706645848266800646585470462052041895540293040588371832623604936324373304227697116322493990551094130915573559910246058188467905381920002652006058489899583876205223277439831618831615960845449991554071904515050100854175504264011305086977566984720354125759905492715155523619416028540130204842923064207604732622042774762973613048652350882282510039224091224542657887846356999255341194551393112861789771402646716810149638840824017192560367962511254895122765557266193441593838856759775633715798804042955765503723735108723960573480162472098885631699311349939622164694583774499094212351334256610443664167574926539248752956387522471993366176989714131444310632038400
  count := 38

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

def period8Entries : List Weights.Entry := [target38, target39, target40, target41, target42, target43, target44, target45, target46, target47]

def period8Chunk : RowCoverage.Chunk where
  rows := [⟨2387, target38⟩, ⟨2389, target39⟩, ⟨2391, target40⟩, ⟨2393, target41⟩, ⟨2398, target42⟩, ⟨2600, target43⟩, ⟨2628, target44⟩, ⟨2770, target45⟩, ⟨3222, target46⟩, ⟨3368, target47⟩]
  indexMask := 739648526306070398488066948065557009641416598025626829401687222931403287993577832406766536160667742009931454632224551222635161823742186175442672810896674025376495695529798980309466152028905683282145161857386548534229400158024245194917228077644323396592682300508121462982915088650278007869807182231098797627220656090778383469396084216985381482693562741709047976953594092613095269486178160114442796125994150113671159860315998880201247902887798571797034933347138075225592132793024836073065411073875370005006006676636210108903723326888608659483881359892612083033087660585183439847090851981448690727551394867586802495819888301501999944395375498872848999282700966109597712504982303476505402483030361081691641743133544320046971659250875042389516023174495451857425737342857613286679887888109443670643716781857773672013689105028003797882995015426730930408390535367194967567766299249789755622229129805133527342726433418076017364945824242369833224143896662640639737729604429223366167668180008712601244728311936162143550832640
  count := 10

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

end FranklSmallCyclic.TransportBatches.G013.B002.Data
