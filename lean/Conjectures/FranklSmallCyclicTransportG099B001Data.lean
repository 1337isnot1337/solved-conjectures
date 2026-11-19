module

public import Conjectures.FranklSmallCyclicRowCoverage
public import Conjectures.FranklSmallCyclicCanonicalWords
public import Conjectures.FranklSmallCyclicOrbit10Block021Data

/-! 101 literal targets sharing one source proof block.
Original words and row indices are retained; weights may be transported.
-/
@[expose] public section

namespace FranklSmallCyclic.TransportBatches.G099.B001.Data

-- Period 10, original row 5165, representative 10829.
def source0 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B021.Data.entryAt ⟨37, by decide +kernel⟩

def target0 : Weights.Entry :=
  { word := [8, 4, 8, 4, 2, 8, 4], weights := [1, 0, 0, 1] }

def points0 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 5190, representative 10806.
def source1 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B021.Data.entryAt ⟨14, by decide +kernel⟩

def target1 : Weights.Entry :=
  { word := [8, 4, 8, 4, 10, 8, 2], weights := [1, 0, 0, 1] }

def points1 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 5191, representative 10826.
def source2 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B021.Data.entryAt ⟨34, by decide +kernel⟩

def target2 : Weights.Entry :=
  { word := [8, 4, 8, 4, 10, 8, 4], weights := [1, 0, 0, 1] }

def points2 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 5206, representative 10810.
def source3 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B021.Data.entryAt ⟨18, by decide +kernel⟩

def target3 : Weights.Entry :=
  { word := [8, 4, 8, 12, 2, 8, 2], weights := [0, 1, 1, 0] }

def points3 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 5207, representative 10830.
def source4 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B021.Data.entryAt ⟨38, by decide +kernel⟩

def target4 : Weights.Entry :=
  { word := [8, 4, 8, 12, 2, 8, 4], weights := [1, 0, 0, 1] }

def points4 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 5232, representative 10807.
def source5 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B021.Data.entryAt ⟨15, by decide +kernel⟩

def target5 : Weights.Entry :=
  { word := [8, 4, 8, 12, 10, 8, 2], weights := [0, 1, 1, 0] }

def points5 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 5233, representative 10827.
def source6 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B021.Data.entryAt ⟨35, by decide +kernel⟩

def target6 : Weights.Entry :=
  { word := [8, 4, 8, 12, 10, 8, 4], weights := [1, 0, 0, 1] }

def points6 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 5254, representative 10821.
def source7 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B021.Data.entryAt ⟨29, by decide +kernel⟩

def target7 : Weights.Entry :=
  { word := [8, 4, 12, 4, 0, 8, 2], weights := [1, 0, 0, 1] }

def points7 : List (ℕ × ℕ) := [(0, 9), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 5255, representative 10821.
def source8 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B021.Data.entryAt ⟨29, by decide +kernel⟩

def target8 : Weights.Entry :=
  { word := [8, 4, 12, 4, 0, 8, 4], weights := [1, 0, 0, 1] }

def points8 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 5268, representative 10814.
def source9 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B021.Data.entryAt ⟨22, by decide +kernel⟩

def target9 : Weights.Entry :=
  { word := [8, 4, 12, 4, 8, 8, 2], weights := [1, 0, 0, 1] }

def points9 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 5269, representative 10818.
def source10 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B021.Data.entryAt ⟨26, by decide +kernel⟩

def target10 : Weights.Entry :=
  { word := [8, 4, 12, 4, 8, 8, 4], weights := [1, 0, 0, 1] }

def points10 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 5275, representative 10822.
def source11 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B021.Data.entryAt ⟨30, by decide +kernel⟩

def target11 : Weights.Entry :=
  { word := [8, 4, 12, 12, 0, 8, 2], weights := [1, 0, 0, 1] }

def points11 : List (ℕ × ℕ) := [(0, 9), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 5276, representative 10822.
def source12 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B021.Data.entryAt ⟨30, by decide +kernel⟩

def target12 : Weights.Entry :=
  { word := [8, 4, 12, 12, 0, 8, 4], weights := [1, 0, 0, 1] }

def points12 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 5289, representative 10815.
def source13 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B021.Data.entryAt ⟨23, by decide +kernel⟩

def target13 : Weights.Entry :=
  { word := [8, 4, 12, 12, 8, 8, 2], weights := [0, 1, 1, 0] }

def points13 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 5290, representative 10819.
def source14 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B021.Data.entryAt ⟨27, by decide +kernel⟩

def target14 : Weights.Entry :=
  { word := [8, 4, 12, 12, 8, 8, 4], weights := [1, 0, 0, 1] }

def points14 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 5348, representative 10832.
def source15 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B021.Data.entryAt ⟨40, by decide +kernel⟩

def target15 : Weights.Entry :=
  { word := [8, 8, 0, 4, 2, 8, 2], weights := [1, 0, 0, 1] }

def points15 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2), (9, 0)]

-- Period 10, original row 5349, representative 10836.
def source16 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B021.Data.entryAt ⟨44, by decide +kernel⟩

def target16 : Weights.Entry :=
  { word := [8, 8, 0, 4, 2, 8, 4], weights := [1, 0, 0, 1] }

def points16 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2), (9, 0)]

-- Period 10, original row 5374, representative 10833.
def source17 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B021.Data.entryAt ⟨41, by decide +kernel⟩

def target17 : Weights.Entry :=
  { word := [8, 8, 0, 4, 10, 8, 2], weights := [1, 0, 0, 1] }

def points17 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2), (9, 0)]

-- Period 10, original row 5375, representative 10837.
def source18 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B021.Data.entryAt ⟨45, by decide +kernel⟩

def target18 : Weights.Entry :=
  { word := [8, 8, 0, 4, 10, 8, 4], weights := [1, 0, 0, 1] }

def points18 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2), (9, 0)]

-- Period 10, original row 5412, representative 10835.
def source19 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B021.Data.entryAt ⟨43, by decide +kernel⟩

def target19 : Weights.Entry :=
  { word := [8, 8, 0, 12, 2, 8, 2], weights := [1, 0, 0, 1] }

def points19 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2), (9, 0)]

-- Period 10, original row 5413, representative 10839.
def source20 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B021.Data.entryAt ⟨47, by decide +kernel⟩

def target20 : Weights.Entry :=
  { word := [8, 8, 0, 12, 2, 8, 4], weights := [1, 0, 0, 1] }

def points20 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2), (9, 0)]

-- Period 10, original row 5437, representative 10834.
def source21 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B021.Data.entryAt ⟨42, by decide +kernel⟩

def target21 : Weights.Entry :=
  { word := [8, 8, 0, 12, 10, 8, 2], weights := [1, 0, 0, 1] }

def points21 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2), (9, 0)]

-- Period 10, original row 5438, representative 10838.
def source22 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B021.Data.entryAt ⟨46, by decide +kernel⟩

def target22 : Weights.Entry :=
  { word := [8, 8, 0, 12, 10, 8, 4], weights := [1, 0, 0, 1] }

def points22 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2), (9, 0)]

-- Period 10, original row 5452, representative 10796.
def source23 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B021.Data.entryAt ⟨4, by decide +kernel⟩

def target23 : Weights.Entry :=
  { word := [8, 8, 1, 4, 2, 8, 4], weights := [1, 0, 0, 1] }

def points23 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 5474, representative 10797.
def source24 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B021.Data.entryAt ⟨5, by decide +kernel⟩

def target24 : Weights.Entry :=
  { word := [8, 8, 1, 4, 10, 8, 4], weights := [1, 0, 0, 1] }

def points24 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 5488, representative 10803.
def source25 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B021.Data.entryAt ⟨11, by decide +kernel⟩

def target25 : Weights.Entry :=
  { word := [8, 8, 1, 12, 2, 8, 4], weights := [1, 0, 0, 1] }

def points25 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 5510, representative 10800.
def source26 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B021.Data.entryAt ⟨8, by decide +kernel⟩

def target26 : Weights.Entry :=
  { word := [8, 8, 1, 12, 10, 8, 4], weights := [1, 0, 0, 1] }

def points26 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 5580, representative 10840.
def source27 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B021.Data.entryAt ⟨48, by decide +kernel⟩

def target27 : Weights.Entry :=
  { word := [8, 8, 4, 2, 0, 8, 2], weights := [0, 1, 0, 1] }

def points27 : List (ℕ × ℕ) := [(0, 9), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 5581, representative 10840.
def source28 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B021.Data.entryAt ⟨48, by decide +kernel⟩

def target28 : Weights.Entry :=
  { word := [8, 8, 4, 2, 0, 8, 4], weights := [0, 1, 0, 1] }

def points28 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 5592, representative 10841.
def source29 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B021.Data.entryAt ⟨49, by decide +kernel⟩

def target29 : Weights.Entry :=
  { word := [8, 8, 4, 2, 8, 8, 4], weights := [0, 1, 0, 1] }

def points29 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 5619, representative 10847.
def source30 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B021.Data.entryAt ⟨55, by decide +kernel⟩

def target30 : Weights.Entry :=
  { word := [8, 8, 4, 10, 0, 8, 2], weights := [0, 1, 0, 1] }

def points30 : List (ℕ × ℕ) := [(0, 9), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 5620, representative 10847.
def source31 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B021.Data.entryAt ⟨55, by decide +kernel⟩

def target31 : Weights.Entry :=
  { word := [8, 8, 4, 10, 0, 8, 4], weights := [0, 1, 0, 1] }

def points31 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 5630, representative 10844.
def source32 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B021.Data.entryAt ⟨52, by decide +kernel⟩

def target32 : Weights.Entry :=
  { word := [8, 8, 4, 10, 8, 8, 4], weights := [0, 1, 0, 1] }

def points32 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 5788, representative 10845.
def source33 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B021.Data.entryAt ⟨53, by decide +kernel⟩

def target33 : Weights.Entry :=
  { word := [8, 8, 12, 2, 0, 8, 2], weights := [0, 1, 0, 1] }

def points33 : List (ℕ × ℕ) := [(0, 9), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 5789, representative 10845.
def source34 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B021.Data.entryAt ⟨53, by decide +kernel⟩

def target34 : Weights.Entry :=
  { word := [8, 8, 12, 2, 0, 8, 4], weights := [0, 1, 0, 1] }

def points34 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 5800, representative 10842.
def source35 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B021.Data.entryAt ⟨50, by decide +kernel⟩

def target35 : Weights.Entry :=
  { word := [8, 8, 12, 2, 8, 8, 4], weights := [0, 1, 0, 1] }

def points35 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 5826, representative 10846.
def source36 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B021.Data.entryAt ⟨54, by decide +kernel⟩

def target36 : Weights.Entry :=
  { word := [8, 8, 12, 10, 0, 8, 2], weights := [0, 1, 0, 1] }

def points36 : List (ℕ × ℕ) := [(0, 9), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 5827, representative 10846.
def source37 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B021.Data.entryAt ⟨54, by decide +kernel⟩

def target37 : Weights.Entry :=
  { word := [8, 8, 12, 10, 0, 8, 4], weights := [0, 1, 0, 1] }

def points37 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 5837, representative 10843.
def source38 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B021.Data.entryAt ⟨51, by decide +kernel⟩

def target38 : Weights.Entry :=
  { word := [8, 8, 12, 10, 8, 8, 4], weights := [0, 1, 0, 1] }

def points38 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 6340, representative 10796.
def source39 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B021.Data.entryAt ⟨4, by decide +kernel⟩

def target39 : Weights.Entry :=
  { word := [8, 12, 0, 4, 2, 8, 4], weights := [1, 0, 0, 1] }

def points39 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2), (9, 0)]

-- Period 10, original row 6362, representative 10797.
def source40 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B021.Data.entryAt ⟨5, by decide +kernel⟩

def target40 : Weights.Entry :=
  { word := [8, 12, 0, 4, 10, 8, 4], weights := [1, 0, 0, 1] }

def points40 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2), (9, 0)]

-- Period 10, original row 6376, representative 10803.
def source41 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B021.Data.entryAt ⟨11, by decide +kernel⟩

def target41 : Weights.Entry :=
  { word := [8, 12, 0, 12, 2, 8, 4], weights := [1, 0, 0, 1] }

def points41 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2), (9, 0)]

-- Period 10, original row 6398, representative 10800.
def source42 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B021.Data.entryAt ⟨8, by decide +kernel⟩

def target42 : Weights.Entry :=
  { word := [8, 12, 0, 12, 10, 8, 4], weights := [1, 0, 0, 1] }

def points42 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2), (9, 0)]

-- Period 10, original row 6462, representative 10795.
def source43 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B021.Data.entryAt ⟨3, by decide +kernel⟩

def target43 : Weights.Entry :=
  { word := [8, 12, 4, 12, 0, 8, 2], weights := [1, 0, 0, 1] }

def points43 : List (ℕ × ℕ) := [(0, 9), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 6463, representative 10795.
def source44 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B021.Data.entryAt ⟨3, by decide +kernel⟩

def target44 : Weights.Entry :=
  { word := [8, 12, 4, 12, 0, 8, 4], weights := [1, 0, 0, 1] }

def points44 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 6477, representative 10792.
def source45 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B021.Data.entryAt ⟨0, by decide +kernel⟩

def target45 : Weights.Entry :=
  { word := [8, 12, 4, 12, 8, 8, 4], weights := [1, 0, 0, 1] }

def points45 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 6495, representative 10801.
def source46 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B021.Data.entryAt ⟨9, by decide +kernel⟩

def target46 : Weights.Entry :=
  { word := [8, 12, 8, 4, 2, 8, 4], weights := [1, 0, 0, 1] }

def points46 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 6521, representative 10798.
def source47 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B021.Data.entryAt ⟨6, by decide +kernel⟩

def target47 : Weights.Entry :=
  { word := [8, 12, 8, 4, 10, 8, 4], weights := [1, 0, 0, 1] }

def points47 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 6537, representative 10802.
def source48 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B021.Data.entryAt ⟨10, by decide +kernel⟩

def target48 : Weights.Entry :=
  { word := [8, 12, 8, 12, 2, 8, 4], weights := [1, 0, 0, 1] }

def points48 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 6563, representative 10799.
def source49 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B021.Data.entryAt ⟨7, by decide +kernel⟩

def target49 : Weights.Entry :=
  { word := [8, 12, 8, 12, 10, 8, 4], weights := [1, 0, 0, 1] }

def points49 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 6584, representative 10793.
def source50 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B021.Data.entryAt ⟨1, by decide +kernel⟩

def target50 : Weights.Entry :=
  { word := [8, 12, 12, 4, 0, 8, 2], weights := [1, 0, 0, 1] }

def points50 : List (ℕ × ℕ) := [(0, 9), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 6585, representative 10793.
def source51 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B021.Data.entryAt ⟨1, by decide +kernel⟩

def target51 : Weights.Entry :=
  { word := [8, 12, 12, 4, 0, 8, 4], weights := [1, 0, 0, 1] }

def points51 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 6605, representative 10794.
def source52 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B021.Data.entryAt ⟨2, by decide +kernel⟩

def target52 : Weights.Entry :=
  { word := [8, 12, 12, 12, 0, 8, 2], weights := [1, 0, 0, 1] }

def points52 : List (ℕ × ℕ) := [(0, 9), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 6606, representative 10794.
def source53 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B021.Data.entryAt ⟨2, by decide +kernel⟩

def target53 : Weights.Entry :=
  { word := [8, 12, 12, 12, 0, 8, 4], weights := [1, 0, 0, 1] }

def points53 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 6632, representative 10804.
def source54 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B021.Data.entryAt ⟨12, by decide +kernel⟩

def target54 : Weights.Entry :=
  { word := [9, 0, 1, 4, 2, 8, 2], weights := [1, 0, 0, 1] }

def points54 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 0), (9, 1)]

-- Period 10, original row 6633, representative 10824.
def source55 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B021.Data.entryAt ⟨32, by decide +kernel⟩

def target55 : Weights.Entry :=
  { word := [9, 0, 1, 4, 2, 8, 4], weights := [1, 0, 0, 1] }

def points55 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 0), (9, 1)]

-- Period 10, original row 6654, representative 10805.
def source56 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B021.Data.entryAt ⟨13, by decide +kernel⟩

def target56 : Weights.Entry :=
  { word := [9, 0, 1, 4, 10, 8, 2], weights := [1, 0, 0, 1] }

def points56 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 0), (9, 1)]

-- Period 10, original row 6655, representative 10825.
def source57 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B021.Data.entryAt ⟨33, by decide +kernel⟩

def target57 : Weights.Entry :=
  { word := [9, 0, 1, 4, 10, 8, 4], weights := [1, 0, 0, 1] }

def points57 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 0), (9, 1)]

-- Period 10, original row 6668, representative 10811.
def source58 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B021.Data.entryAt ⟨19, by decide +kernel⟩

def target58 : Weights.Entry :=
  { word := [9, 0, 1, 12, 2, 8, 2], weights := [1, 0, 0, 1] }

def points58 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 0), (9, 1)]

-- Period 10, original row 6669, representative 10831.
def source59 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B021.Data.entryAt ⟨39, by decide +kernel⟩

def target59 : Weights.Entry :=
  { word := [9, 0, 1, 12, 2, 8, 4], weights := [1, 0, 0, 1] }

def points59 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 0), (9, 1)]

-- Period 10, original row 6690, representative 10808.
def source60 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B021.Data.entryAt ⟨16, by decide +kernel⟩

def target60 : Weights.Entry :=
  { word := [9, 0, 1, 12, 10, 8, 2], weights := [1, 0, 0, 1] }

def points60 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 0), (9, 1)]

-- Period 10, original row 6691, representative 10828.
def source61 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B021.Data.entryAt ⟨36, by decide +kernel⟩

def target61 : Weights.Entry :=
  { word := [9, 0, 1, 12, 10, 8, 4], weights := [1, 0, 0, 1] }

def points61 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 0), (9, 1)]

-- Period 10, original row 6761, representative 10848.
def source62 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B021.Data.entryAt ⟨56, by decide +kernel⟩

def target62 : Weights.Entry :=
  { word := [9, 0, 4, 2, 0, 8, 2], weights := [0, 1, 0, 1] }

def points62 : List (ℕ × ℕ) := [(0, 9), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 0), (9, 1)]

-- Period 10, original row 6762, representative 10848.
def source63 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B021.Data.entryAt ⟨56, by decide +kernel⟩

def target63 : Weights.Entry :=
  { word := [9, 0, 4, 2, 0, 8, 4], weights := [0, 1, 0, 1] }

def points63 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 0), (9, 1)]

-- Period 10, original row 6773, representative 10849.
def source64 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B021.Data.entryAt ⟨57, by decide +kernel⟩

def target64 : Weights.Entry :=
  { word := [9, 0, 4, 2, 8, 8, 4], weights := [0, 1, 0, 1] }

def points64 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 0), (9, 1)]

-- Period 10, original row 6793, representative 10855.
def source65 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B021.Data.entryAt ⟨63, by decide +kernel⟩

def target65 : Weights.Entry :=
  { word := [9, 0, 4, 10, 0, 8, 2], weights := [0, 1, 0, 1] }

def points65 : List (ℕ × ℕ) := [(0, 9), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 0), (9, 1)]

-- Period 10, original row 6794, representative 10855.
def source66 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B021.Data.entryAt ⟨63, by decide +kernel⟩

def target66 : Weights.Entry :=
  { word := [9, 0, 4, 10, 0, 8, 4], weights := [0, 1, 0, 1] }

def points66 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 0), (9, 1)]

-- Period 10, original row 6809, representative 10852.
def source67 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B021.Data.entryAt ⟨60, by decide +kernel⟩

def target67 : Weights.Entry :=
  { word := [9, 0, 4, 10, 8, 8, 4], weights := [0, 1, 0, 1] }

def points67 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 0), (9, 1)]

-- Period 10, original row 6904, representative 10853.
def source68 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B021.Data.entryAt ⟨61, by decide +kernel⟩

def target68 : Weights.Entry :=
  { word := [9, 0, 12, 2, 0, 8, 2], weights := [0, 1, 0, 1] }

def points68 : List (ℕ × ℕ) := [(0, 9), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 0), (9, 1)]

-- Period 10, original row 6905, representative 10853.
def source69 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B021.Data.entryAt ⟨61, by decide +kernel⟩

def target69 : Weights.Entry :=
  { word := [9, 0, 12, 2, 0, 8, 4], weights := [0, 1, 0, 1] }

def points69 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 0), (9, 1)]

-- Period 10, original row 6916, representative 10850.
def source70 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B021.Data.entryAt ⟨58, by decide +kernel⟩

def target70 : Weights.Entry :=
  { word := [9, 0, 12, 2, 8, 8, 4], weights := [0, 1, 0, 1] }

def points70 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 0), (9, 1)]

-- Period 10, original row 6939, representative 10854.
def source71 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B021.Data.entryAt ⟨62, by decide +kernel⟩

def target71 : Weights.Entry :=
  { word := [9, 0, 12, 10, 0, 8, 2], weights := [0, 1, 0, 1] }

def points71 : List (ℕ × ℕ) := [(0, 9), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 0), (9, 1)]

-- Period 10, original row 6940, representative 10854.
def source72 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B021.Data.entryAt ⟨62, by decide +kernel⟩

def target72 : Weights.Entry :=
  { word := [9, 0, 12, 10, 0, 8, 4], weights := [0, 1, 0, 1] }

def points72 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 0), (9, 1)]

-- Period 10, original row 6955, representative 10851.
def source73 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B021.Data.entryAt ⟨59, by decide +kernel⟩

def target73 : Weights.Entry :=
  { word := [9, 0, 12, 10, 8, 8, 4], weights := [0, 1, 0, 1] }

def points73 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 0), (9, 1)]

-- Period 10, original row 6971, representative 10812.
def source74 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B021.Data.entryAt ⟨20, by decide +kernel⟩

def target74 : Weights.Entry :=
  { word := [9, 4, 4, 4, 0, 8, 2], weights := [1, 0, 0, 1] }

def points74 : List (ℕ × ℕ) := [(0, 9), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 6972, representative 10812.
def source75 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B021.Data.entryAt ⟨20, by decide +kernel⟩

def target75 : Weights.Entry :=
  { word := [9, 4, 4, 4, 0, 8, 4], weights := [1, 0, 0, 1] }

def points75 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 6985, representative 10813.
def source76 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B021.Data.entryAt ⟨21, by decide +kernel⟩

def target76 : Weights.Entry :=
  { word := [9, 4, 4, 4, 8, 8, 2], weights := [1, 0, 0, 1] }

def points76 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 6986, representative 10817.
def source77 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B021.Data.entryAt ⟨25, by decide +kernel⟩

def target77 : Weights.Entry :=
  { word := [9, 4, 4, 4, 8, 8, 4], weights := [1, 0, 0, 1] }

def points77 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 6999, representative 10823.
def source78 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B021.Data.entryAt ⟨31, by decide +kernel⟩

def target78 : Weights.Entry :=
  { word := [9, 4, 4, 12, 0, 8, 2], weights := [1, 0, 0, 1] }

def points78 : List (ℕ × ℕ) := [(0, 9), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 7000, representative 10823.
def source79 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B021.Data.entryAt ⟨31, by decide +kernel⟩

def target79 : Weights.Entry :=
  { word := [9, 4, 4, 12, 0, 8, 4], weights := [1, 0, 0, 1] }

def points79 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 7013, representative 10816.
def source80 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B021.Data.entryAt ⟨24, by decide +kernel⟩

def target80 : Weights.Entry :=
  { word := [9, 4, 4, 12, 8, 8, 2], weights := [0, 1, 1, 0] }

def points80 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 7014, representative 10820.
def source81 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B021.Data.entryAt ⟨28, by decide +kernel⟩

def target81 : Weights.Entry :=
  { word := [9, 4, 4, 12, 8, 8, 4], weights := [1, 0, 0, 1] }

def points81 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 7020, representative 10821.
def source82 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B021.Data.entryAt ⟨29, by decide +kernel⟩

def target82 : Weights.Entry :=
  { word := [9, 4, 12, 4, 0, 8, 2], weights := [1, 0, 0, 1] }

def points82 : List (ℕ × ℕ) := [(0, 9), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 7021, representative 10821.
def source83 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B021.Data.entryAt ⟨29, by decide +kernel⟩

def target83 : Weights.Entry :=
  { word := [9, 4, 12, 4, 0, 8, 4], weights := [1, 0, 0, 1] }

def points83 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 7034, representative 10814.
def source84 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B021.Data.entryAt ⟨22, by decide +kernel⟩

def target84 : Weights.Entry :=
  { word := [9, 4, 12, 4, 8, 8, 2], weights := [1, 0, 0, 1] }

def points84 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 7035, representative 10818.
def source85 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B021.Data.entryAt ⟨26, by decide +kernel⟩

def target85 : Weights.Entry :=
  { word := [9, 4, 12, 4, 8, 8, 4], weights := [1, 0, 0, 1] }

def points85 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 7041, representative 10822.
def source86 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B021.Data.entryAt ⟨30, by decide +kernel⟩

def target86 : Weights.Entry :=
  { word := [9, 4, 12, 12, 0, 8, 2], weights := [1, 0, 0, 1] }

def points86 : List (ℕ × ℕ) := [(0, 9), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 7042, representative 10822.
def source87 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B021.Data.entryAt ⟨30, by decide +kernel⟩

def target87 : Weights.Entry :=
  { word := [9, 4, 12, 12, 0, 8, 4], weights := [1, 0, 0, 1] }

def points87 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 7055, representative 10815.
def source88 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B021.Data.entryAt ⟨23, by decide +kernel⟩

def target88 : Weights.Entry :=
  { word := [9, 4, 12, 12, 8, 8, 2], weights := [0, 1, 1, 0] }

def points88 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 7056, representative 10819.
def source89 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B021.Data.entryAt ⟨27, by decide +kernel⟩

def target89 : Weights.Entry :=
  { word := [9, 4, 12, 12, 8, 8, 4], weights := [1, 0, 0, 1] }

def points89 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 7069, representative 10796.
def source90 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B021.Data.entryAt ⟨4, by decide +kernel⟩

def target90 : Weights.Entry :=
  { word := [9, 8, 1, 4, 2, 8, 4], weights := [1, 0, 0, 1] }

def points90 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 7091, representative 10797.
def source91 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B021.Data.entryAt ⟨5, by decide +kernel⟩

def target91 : Weights.Entry :=
  { word := [9, 8, 1, 4, 10, 8, 4], weights := [1, 0, 0, 1] }

def points91 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 7105, representative 10803.
def source92 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B021.Data.entryAt ⟨11, by decide +kernel⟩

def target92 : Weights.Entry :=
  { word := [9, 8, 1, 12, 2, 8, 4], weights := [1, 0, 0, 1] }

def points92 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 7127, representative 10800.
def source93 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B021.Data.entryAt ⟨8, by decide +kernel⟩

def target93 : Weights.Entry :=
  { word := [9, 8, 1, 12, 10, 8, 4], weights := [1, 0, 0, 1] }

def points93 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 7335, representative 10795.
def source94 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B021.Data.entryAt ⟨3, by decide +kernel⟩

def target94 : Weights.Entry :=
  { word := [9, 12, 4, 12, 0, 8, 2], weights := [1, 0, 0, 1] }

def points94 : List (ℕ × ℕ) := [(0, 9), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 7336, representative 10795.
def source95 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B021.Data.entryAt ⟨3, by decide +kernel⟩

def target95 : Weights.Entry :=
  { word := [9, 12, 4, 12, 0, 8, 4], weights := [1, 0, 0, 1] }

def points95 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 7350, representative 10792.
def source96 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B021.Data.entryAt ⟨0, by decide +kernel⟩

def target96 : Weights.Entry :=
  { word := [9, 12, 4, 12, 8, 8, 4], weights := [1, 0, 0, 1] }

def points96 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 7356, representative 10793.
def source97 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B021.Data.entryAt ⟨1, by decide +kernel⟩

def target97 : Weights.Entry :=
  { word := [9, 12, 12, 4, 0, 8, 2], weights := [1, 0, 0, 1] }

def points97 : List (ℕ × ℕ) := [(0, 9), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 7357, representative 10793.
def source98 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B021.Data.entryAt ⟨1, by decide +kernel⟩

def target98 : Weights.Entry :=
  { word := [9, 12, 12, 4, 0, 8, 4], weights := [1, 0, 0, 1] }

def points98 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 7377, representative 10794.
def source99 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B021.Data.entryAt ⟨2, by decide +kernel⟩

def target99 : Weights.Entry :=
  { word := [9, 12, 12, 12, 0, 8, 2], weights := [1, 0, 0, 1] }

def points99 : List (ℕ × ℕ) := [(0, 9), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 7378, representative 10794.
def source100 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B021.Data.entryAt ⟨2, by decide +kernel⟩

def target100 : Weights.Entry :=
  { word := [9, 12, 12, 12, 0, 8, 4], weights := [1, 0, 0, 1] }

def points100 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

def period10Entries : List Weights.Entry := [target0, target1, target2, target3, target4, target5, target6, target7, target8, target9, target10, target11, target12, target13, target14, target15, target16, target17, target18, target19, target20, target21, target22, target23, target24, target25, target26, target27, target28, target29, target30, target31, target32, target33, target34, target35, target36, target37, target38, target39, target40, target41, target42, target43, target44, target45, target46, target47, target48, target49, target50, target51, target52, target53, target54, target55, target56, target57, target58, target59, target60, target61, target62, target63, target64, target65, target66, target67, target68, target69, target70, target71, target72, target73, target74, target75, target76, target77, target78, target79, target80, target81, target82, target83, target84, target85, target86, target87, target88, target89, target90, target91, target92, target93, target94, target95, target96, target97, target98, target99, target100]

def period10Chunk : RowCoverage.Chunk where
  rows := [⟨5165, target0⟩, ⟨5190, target1⟩, ⟨5191, target2⟩, ⟨5206, target3⟩, ⟨5207, target4⟩, ⟨5232, target5⟩, ⟨5233, target6⟩, ⟨5254, target7⟩, ⟨5255, target8⟩, ⟨5268, target9⟩, ⟨5269, target10⟩, ⟨5275, target11⟩, ⟨5276, target12⟩, ⟨5289, target13⟩, ⟨5290, target14⟩, ⟨5348, target15⟩, ⟨5349, target16⟩, ⟨5374, target17⟩, ⟨5375, target18⟩, ⟨5412, target19⟩, ⟨5413, target20⟩, ⟨5437, target21⟩, ⟨5438, target22⟩, ⟨5452, target23⟩, ⟨5474, target24⟩, ⟨5488, target25⟩, ⟨5510, target26⟩, ⟨5580, target27⟩, ⟨5581, target28⟩, ⟨5592, target29⟩, ⟨5619, target30⟩, ⟨5620, target31⟩, ⟨5630, target32⟩, ⟨5788, target33⟩, ⟨5789, target34⟩, ⟨5800, target35⟩, ⟨5826, target36⟩, ⟨5827, target37⟩, ⟨5837, target38⟩, ⟨6340, target39⟩, ⟨6362, target40⟩, ⟨6376, target41⟩, ⟨6398, target42⟩, ⟨6462, target43⟩, ⟨6463, target44⟩, ⟨6477, target45⟩, ⟨6495, target46⟩, ⟨6521, target47⟩, ⟨6537, target48⟩, ⟨6563, target49⟩, ⟨6584, target50⟩, ⟨6585, target51⟩, ⟨6605, target52⟩, ⟨6606, target53⟩, ⟨6632, target54⟩, ⟨6633, target55⟩, ⟨6654, target56⟩, ⟨6655, target57⟩, ⟨6668, target58⟩, ⟨6669, target59⟩, ⟨6690, target60⟩, ⟨6691, target61⟩, ⟨6761, target62⟩, ⟨6762, target63⟩, ⟨6773, target64⟩, ⟨6793, target65⟩, ⟨6794, target66⟩, ⟨6809, target67⟩, ⟨6904, target68⟩, ⟨6905, target69⟩, ⟨6916, target70⟩, ⟨6939, target71⟩, ⟨6940, target72⟩, ⟨6955, target73⟩, ⟨6971, target74⟩, ⟨6972, target75⟩, ⟨6985, target76⟩, ⟨6986, target77⟩, ⟨6999, target78⟩, ⟨7000, target79⟩, ⟨7013, target80⟩, ⟨7014, target81⟩, ⟨7020, target82⟩, ⟨7021, target83⟩, ⟨7034, target84⟩, ⟨7035, target85⟩, ⟨7041, target86⟩, ⟨7042, target87⟩, ⟨7055, target88⟩, ⟨7056, target89⟩, ⟨7069, target90⟩, ⟨7091, target91⟩, ⟨7105, target92⟩, ⟨7127, target93⟩, ⟨7335, target94⟩, ⟨7336, target95⟩, ⟨7350, target96⟩, ⟨7356, target97⟩, ⟨7357, target98⟩, ⟨7377, target99⟩, ⟨7378, target100⟩]
  indexMask := 14976125681946842541949248904484631974924191458357283210771348546932612385763505185065679153583493577906555909778341453371400083499037620244610626361466035433881998594948438438224301983564418667179758537904205499751135609113561770991034433774080098640124222087741780079775150318959706140221808938397851829419181786441533505234322394519092775278137950910734779466000812680165454875909542631507638399966540461834943901771554390979701434140616728871199423571505935308053521299388039026840274977974647257633501784559837586034636624837013344558542320385151106355909380711986616425685693349159107934529322785054027476407604207780261763107911515782618722972559490746607312885154892687168398500470607004599865935132799176309560693191937809891141253644030275841783499065217037498048878554612099875949269128455784500815837215100715023627837858659675778280605252967084427975959291636059832126748940806977962066962185909473174799622552997505105858860997216051383532037630289724176885946798519253601898652765743777646887651346745018581790301522573234469538841787049218806994417617668061910188096414902827132473639325472684173052025584385810164816447384476540263033302283890744107427515592162100673629164396453534144385480273786075938803391722626930863891739978932168798499017209796793006956431595923848353134444783139532736208047745946899304001088566772457967280428120915160939332713783976199794987978239633921499732577605117880134567874851148968188476461211352292066839562051874618337917791497939367453581576423028910734155551176665469116279058563499871564265579163523685148258081801390002167074323170160399578271718669763836271301156148133900205194896114768450650129077842952141251337633788059459317517296425895587655569317155593461420947779778549748571472605167585924411881730962548764127211121413942538390012485679440280711054461271817539392575036330502701950010625604396920290897925000225643011486440822842069563641201223616303055639254106112367733327329509916853269114871082647640605873165537379800667576476000425849366307296757491275743034939842041456658530645676675195955649621286229552210254824675240475220122404516789076496478416230908596411754434357045449743456227738374647352095525873540040940461725649079912967747204546560
  count := 101

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

end FranklSmallCyclic.TransportBatches.G099.B001.Data
