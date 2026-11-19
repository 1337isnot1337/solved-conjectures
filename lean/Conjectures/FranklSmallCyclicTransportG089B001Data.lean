module

public import Conjectures.FranklSmallCyclicRowCoverage
public import Conjectures.FranklSmallCyclicCanonicalWords
public import Conjectures.FranklSmallCyclicOrbit10Block011Data

/-! 84 literal targets sharing one source proof block.
Original words and row indices are retained; weights may be transported.
-/
@[expose] public section

namespace FranklSmallCyclic.TransportBatches.G089.B001.Data

-- Period 10, original row 7396, representative 10206.
def source0 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B011.Data.entryAt ⟨54, by decide +kernel⟩

def target0 : Weights.Entry :=
  { word := [9, 12, 12, 12, 8, 8, 12], weights := [1, 0, 1, 0] }

def points0 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8), (9, 9)]

-- Period 10, original row 7814, representative 10199.
def source1 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B011.Data.entryAt ⟨47, by decide +kernel⟩

def target1 : Weights.Entry :=
  { word := [10, 8, 0, 2, 2, 10, 8], weights := [1, 0, 0, 1] }

def points1 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2), (9, 0)]

-- Period 10, original row 7818, representative 10208.
def source2 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B011.Data.entryAt ⟨56, by decide +kernel⟩

def target2 : Weights.Entry :=
  { word := [10, 8, 0, 2, 10, 10, 8], weights := [1, 0, 0, 1] }

def points2 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2), (9, 0)]

-- Period 10, original row 7834, representative 10177.
def source3 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B011.Data.entryAt ⟨25, by decide +kernel⟩

def target3 : Weights.Entry :=
  { word := [10, 8, 0, 4, 6, 0, 8], weights := [1, 0, 0, 1] }

def points3 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2), (9, 0)]

-- Period 10, original row 7836, representative 10155.
def source4 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B011.Data.entryAt ⟨3, by decide +kernel⟩

def target4 : Weights.Entry :=
  { word := [10, 8, 0, 4, 6, 8, 8], weights := [1, 0, 0, 1] }

def points4 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2), (9, 0)]

-- Period 10, original row 7860, representative 10210.
def source5 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B011.Data.entryAt ⟨58, by decide +kernel⟩

def target5 : Weights.Entry :=
  { word := [10, 8, 0, 10, 2, 10, 8], weights := [0, 1, 0, 1] }

def points5 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2), (9, 0)]

-- Period 10, original row 7862, representative 10209.
def source6 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B011.Data.entryAt ⟨57, by decide +kernel⟩

def target6 : Weights.Entry :=
  { word := [10, 8, 0, 10, 10, 10, 8], weights := [0, 1, 0, 1] }

def points6 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2), (9, 0)]

-- Period 10, original row 7885, representative 10182.
def source7 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B011.Data.entryAt ⟨30, by decide +kernel⟩

def target7 : Weights.Entry :=
  { word := [10, 8, 0, 12, 6, 0, 8], weights := [1, 0, 0, 1] }

def points7 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2), (9, 0)]

-- Period 10, original row 7887, representative 10160.
def source8 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B011.Data.entryAt ⟨8, by decide +kernel⟩

def target8 : Weights.Entry :=
  { word := [10, 8, 0, 12, 6, 8, 8], weights := [1, 0, 0, 1] }

def points8 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2), (9, 0)]

-- Period 10, original row 7929, representative 10191.
def source9 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B011.Data.entryAt ⟨39, by decide +kernel⟩

def target9 : Weights.Entry :=
  { word := [10, 8, 4, 2, 0, 9, 8], weights := [1, 0, 0, 1] }

def points9 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 7931, representative 10191.
def source10 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B011.Data.entryAt ⟨39, by decide +kernel⟩

def target10 : Weights.Entry :=
  { word := [10, 8, 4, 2, 0, 10, 8], weights := [1, 0, 0, 1] }

def points10 : List (ℕ × ℕ) := [(0, 9), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 7937, representative 10196.
def source11 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B011.Data.entryAt ⟨44, by decide +kernel⟩

def target11 : Weights.Entry :=
  { word := [10, 8, 4, 2, 8, 10, 8], weights := [1, 0, 0, 1] }

def points11 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 7939, representative 10169.
def source12 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B011.Data.entryAt ⟨17, by decide +kernel⟩

def target12 : Weights.Entry :=
  { word := [10, 8, 4, 4, 4, 0, 8], weights := [1, 0, 0, 1] }

def points12 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 7943, representative 10174.
def source13 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B011.Data.entryAt ⟨22, by decide +kernel⟩

def target13 : Weights.Entry :=
  { word := [10, 8, 4, 4, 12, 0, 8], weights := [1, 0, 0, 1] }

def points13 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 7945, representative 10152.
def source14 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B011.Data.entryAt ⟨0, by decide +kernel⟩

def target14 : Weights.Entry :=
  { word := [10, 8, 4, 4, 12, 8, 8], weights := [1, 0, 0, 1] }

def points14 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 7955, representative 10198.
def source15 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B011.Data.entryAt ⟨46, by decide +kernel⟩

def target15 : Weights.Entry :=
  { word := [10, 8, 4, 10, 0, 9, 8], weights := [0, 1, 0, 1] }

def points15 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 7956, representative 10198.
def source16 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B011.Data.entryAt ⟨46, by decide +kernel⟩

def target16 : Weights.Entry :=
  { word := [10, 8, 4, 10, 0, 10, 8], weights := [0, 1, 0, 1] }

def points16 : List (ℕ × ℕ) := [(0, 9), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 7960, representative 10197.
def source17 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B011.Data.entryAt ⟨45, by decide +kernel⟩

def target17 : Weights.Entry :=
  { word := [10, 8, 4, 10, 8, 10, 8], weights := [0, 1, 0, 1] }

def points17 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 7963, representative 10176.
def source18 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B011.Data.entryAt ⟨24, by decide +kernel⟩

def target18 : Weights.Entry :=
  { word := [10, 8, 4, 12, 4, 0, 8], weights := [1, 0, 0, 1] }

def points18 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 7965, representative 10154.
def source19 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B011.Data.entryAt ⟨2, by decide +kernel⟩

def target19 : Weights.Entry :=
  { word := [10, 8, 4, 12, 4, 8, 8], weights := [1, 0, 0, 1] }

def points19 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 7966, representative 10175.
def source20 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B011.Data.entryAt ⟨23, by decide +kernel⟩

def target20 : Weights.Entry :=
  { word := [10, 8, 4, 12, 12, 0, 8], weights := [1, 0, 0, 1] }

def points20 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 7968, representative 10153.
def source21 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B011.Data.entryAt ⟨1, by decide +kernel⟩

def target21 : Weights.Entry :=
  { word := [10, 8, 4, 12, 12, 8, 8], weights := [1, 0, 0, 1] }

def points21 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 7978, representative 10204.
def source22 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B011.Data.entryAt ⟨52, by decide +kernel⟩

def target22 : Weights.Entry :=
  { word := [10, 8, 8, 2, 2, 10, 8], weights := [1, 0, 0, 1] }

def points22 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 7982, representative 10205.
def source23 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B011.Data.entryAt ⟨53, by decide +kernel⟩

def target23 : Weights.Entry :=
  { word := [10, 8, 8, 2, 10, 10, 8], weights := [1, 0, 0, 1] }

def points23 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8000, representative 10180.
def source24 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B011.Data.entryAt ⟨28, by decide +kernel⟩

def target24 : Weights.Entry :=
  { word := [10, 8, 8, 4, 6, 0, 8], weights := [1, 0, 0, 1] }

def points24 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8002, representative 10158.
def source25 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B011.Data.entryAt ⟨6, by decide +kernel⟩

def target25 : Weights.Entry :=
  { word := [10, 8, 8, 4, 6, 8, 8], weights := [1, 0, 0, 1] }

def points25 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8044, representative 10207.
def source26 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B011.Data.entryAt ⟨55, by decide +kernel⟩

def target26 : Weights.Entry :=
  { word := [10, 8, 8, 10, 2, 10, 8], weights := [0, 1, 0, 1] }

def points26 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8046, representative 10206.
def source27 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B011.Data.entryAt ⟨54, by decide +kernel⟩

def target27 : Weights.Entry :=
  { word := [10, 8, 8, 10, 10, 10, 8], weights := [0, 1, 0, 1] }

def points27 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8073, representative 10181.
def source28 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B011.Data.entryAt ⟨29, by decide +kernel⟩

def target28 : Weights.Entry :=
  { word := [10, 8, 8, 12, 6, 0, 8], weights := [1, 0, 0, 1] }

def points28 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8075, representative 10159.
def source29 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B011.Data.entryAt ⟨7, by decide +kernel⟩

def target29 : Weights.Entry :=
  { word := [10, 8, 8, 12, 6, 8, 8], weights := [1, 0, 0, 1] }

def points29 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8137, representative 10192.
def source30 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B011.Data.entryAt ⟨40, by decide +kernel⟩

def target30 : Weights.Entry :=
  { word := [10, 8, 12, 2, 0, 9, 8], weights := [1, 0, 0, 1] }

def points30 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8139, representative 10192.
def source31 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B011.Data.entryAt ⟨40, by decide +kernel⟩

def target31 : Weights.Entry :=
  { word := [10, 8, 12, 2, 0, 10, 8], weights := [1, 0, 0, 1] }

def points31 : List (ℕ × ℕ) := [(0, 9), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8145, representative 10193.
def source32 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B011.Data.entryAt ⟨41, by decide +kernel⟩

def target32 : Weights.Entry :=
  { word := [10, 8, 12, 2, 8, 10, 8], weights := [1, 0, 0, 1] }

def points32 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8147, representative 10170.
def source33 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B011.Data.entryAt ⟨18, by decide +kernel⟩

def target33 : Weights.Entry :=
  { word := [10, 8, 12, 4, 4, 0, 8], weights := [1, 0, 0, 1] }

def points33 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8151, representative 10171.
def source34 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B011.Data.entryAt ⟨19, by decide +kernel⟩

def target34 : Weights.Entry :=
  { word := [10, 8, 12, 4, 12, 0, 8], weights := [1, 0, 0, 1] }

def points34 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8163, representative 10195.
def source35 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B011.Data.entryAt ⟨43, by decide +kernel⟩

def target35 : Weights.Entry :=
  { word := [10, 8, 12, 10, 0, 9, 8], weights := [0, 1, 0, 1] }

def points35 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8164, representative 10195.
def source36 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B011.Data.entryAt ⟨43, by decide +kernel⟩

def target36 : Weights.Entry :=
  { word := [10, 8, 12, 10, 0, 10, 8], weights := [0, 1, 0, 1] }

def points36 : List (ℕ × ℕ) := [(0, 9), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8170, representative 10194.
def source37 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B011.Data.entryAt ⟨42, by decide +kernel⟩

def target37 : Weights.Entry :=
  { word := [10, 8, 12, 10, 8, 10, 8], weights := [0, 1, 0, 1] }

def points37 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8173, representative 10173.
def source38 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B011.Data.entryAt ⟨21, by decide +kernel⟩

def target38 : Weights.Entry :=
  { word := [10, 8, 12, 12, 4, 0, 8], weights := [1, 0, 0, 1] }

def points38 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8176, representative 10172.
def source39 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B011.Data.entryAt ⟨20, by decide +kernel⟩

def target39 : Weights.Entry :=
  { word := [10, 8, 12, 12, 12, 0, 8], weights := [1, 0, 0, 1] }

def points39 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8730, representative 10199.
def source40 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B011.Data.entryAt ⟨47, by decide +kernel⟩

def target40 : Weights.Entry :=
  { word := [12, 8, 0, 2, 2, 10, 8], weights := [1, 0, 0, 1] }

def points40 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8734, representative 10208.
def source41 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B011.Data.entryAt ⟨56, by decide +kernel⟩

def target41 : Weights.Entry :=
  { word := [12, 8, 0, 2, 10, 10, 8], weights := [1, 0, 0, 1] }

def points41 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8750, representative 10177.
def source42 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B011.Data.entryAt ⟨25, by decide +kernel⟩

def target42 : Weights.Entry :=
  { word := [12, 8, 0, 4, 6, 0, 8], weights := [1, 0, 0, 1] }

def points42 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8752, representative 10155.
def source43 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B011.Data.entryAt ⟨3, by decide +kernel⟩

def target43 : Weights.Entry :=
  { word := [12, 8, 0, 4, 6, 8, 8], weights := [1, 0, 0, 1] }

def points43 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8776, representative 10210.
def source44 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B011.Data.entryAt ⟨58, by decide +kernel⟩

def target44 : Weights.Entry :=
  { word := [12, 8, 0, 10, 2, 10, 8], weights := [0, 1, 0, 1] }

def points44 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8778, representative 10209.
def source45 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B011.Data.entryAt ⟨57, by decide +kernel⟩

def target45 : Weights.Entry :=
  { word := [12, 8, 0, 10, 10, 10, 8], weights := [0, 1, 0, 1] }

def points45 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8793, representative 10182.
def source46 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B011.Data.entryAt ⟨30, by decide +kernel⟩

def target46 : Weights.Entry :=
  { word := [12, 8, 0, 12, 6, 0, 8], weights := [1, 0, 0, 1] }

def points46 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8795, representative 10160.
def source47 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B011.Data.entryAt ⟨8, by decide +kernel⟩

def target47 : Weights.Entry :=
  { word := [12, 8, 0, 12, 6, 8, 8], weights := [1, 0, 0, 1] }

def points47 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8819, representative 10211.
def source48 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B011.Data.entryAt ⟨59, by decide +kernel⟩

def target48 : Weights.Entry :=
  { word := [12, 8, 4, 2, 0, 1, 8], weights := [0, 1, 0, 1] }

def points48 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8821, representative 10211.
def source49 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B011.Data.entryAt ⟨59, by decide +kernel⟩

def target49 : Weights.Entry :=
  { word := [12, 8, 4, 2, 0, 2, 8], weights := [0, 1, 0, 1] }

def points49 : List (ℕ × ℕ) := [(0, 7), (1, 9), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8831, representative 10183.
def source50 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B011.Data.entryAt ⟨31, by decide +kernel⟩

def target50 : Weights.Entry :=
  { word := [12, 8, 4, 2, 0, 9, 8], weights := [0, 1, 0, 1] }

def points50 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8833, representative 10183.
def source51 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B011.Data.entryAt ⟨31, by decide +kernel⟩

def target51 : Weights.Entry :=
  { word := [12, 8, 4, 2, 0, 10, 8], weights := [0, 1, 0, 1] }

def points51 : List (ℕ × ℕ) := [(0, 9), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8839, representative 10188.
def source52 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B011.Data.entryAt ⟨36, by decide +kernel⟩

def target52 : Weights.Entry :=
  { word := [12, 8, 4, 2, 8, 10, 8], weights := [0, 1, 0, 1] }

def points52 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8841, representative 10161.
def source53 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B011.Data.entryAt ⟨9, by decide +kernel⟩

def target53 : Weights.Entry :=
  { word := [12, 8, 4, 4, 4, 0, 8], weights := [1, 0, 0, 1] }

def points53 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8845, representative 10166.
def source54 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B011.Data.entryAt ⟨14, by decide +kernel⟩

def target54 : Weights.Entry :=
  { word := [12, 8, 4, 4, 12, 0, 8], weights := [1, 0, 0, 1] }

def points54 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8865, representative 10190.
def source55 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B011.Data.entryAt ⟨38, by decide +kernel⟩

def target55 : Weights.Entry :=
  { word := [12, 8, 4, 10, 0, 9, 8], weights := [0, 1, 0, 1] }

def points55 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8866, representative 10190.
def source56 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B011.Data.entryAt ⟨38, by decide +kernel⟩

def target56 : Weights.Entry :=
  { word := [12, 8, 4, 10, 0, 10, 8], weights := [0, 1, 0, 1] }

def points56 : List (ℕ × ℕ) := [(0, 9), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8872, representative 10189.
def source57 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B011.Data.entryAt ⟨37, by decide +kernel⟩

def target57 : Weights.Entry :=
  { word := [12, 8, 4, 10, 8, 10, 8], weights := [0, 1, 0, 1] }

def points57 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8875, representative 10168.
def source58 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B011.Data.entryAt ⟨16, by decide +kernel⟩

def target58 : Weights.Entry :=
  { word := [12, 8, 4, 12, 4, 0, 8], weights := [1, 0, 0, 1] }

def points58 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8878, representative 10167.
def source59 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B011.Data.entryAt ⟨15, by decide +kernel⟩

def target59 : Weights.Entry :=
  { word := [12, 8, 4, 12, 12, 0, 8], weights := [0, 1, 1, 0] }

def points59 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8888, representative 10200.
def source60 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B011.Data.entryAt ⟨48, by decide +kernel⟩

def target60 : Weights.Entry :=
  { word := [12, 8, 8, 2, 2, 10, 8], weights := [0, 1, 0, 1] }

def points60 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8892, representative 10201.
def source61 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B011.Data.entryAt ⟨49, by decide +kernel⟩

def target61 : Weights.Entry :=
  { word := [12, 8, 8, 2, 10, 10, 8], weights := [0, 1, 0, 1] }

def points61 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8898, representative 10178.
def source62 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B011.Data.entryAt ⟨26, by decide +kernel⟩

def target62 : Weights.Entry :=
  { word := [12, 8, 8, 4, 6, 0, 8], weights := [1, 0, 0, 1] }

def points62 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8900, representative 10156.
def source63 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B011.Data.entryAt ⟨4, by decide +kernel⟩

def target63 : Weights.Entry :=
  { word := [12, 8, 8, 4, 6, 8, 8], weights := [1, 0, 0, 1] }

def points63 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8912, representative 10203.
def source64 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B011.Data.entryAt ⟨51, by decide +kernel⟩

def target64 : Weights.Entry :=
  { word := [12, 8, 8, 10, 2, 10, 8], weights := [0, 1, 0, 1] }

def points64 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8914, representative 10202.
def source65 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B011.Data.entryAt ⟨50, by decide +kernel⟩

def target65 : Weights.Entry :=
  { word := [12, 8, 8, 10, 10, 10, 8], weights := [0, 1, 0, 1] }

def points65 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8919, representative 10179.
def source66 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B011.Data.entryAt ⟨27, by decide +kernel⟩

def target66 : Weights.Entry :=
  { word := [12, 8, 8, 12, 6, 0, 8], weights := [0, 1, 1, 0] }

def points66 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8921, representative 10157.
def source67 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B011.Data.entryAt ⟨5, by decide +kernel⟩

def target67 : Weights.Entry :=
  { word := [12, 8, 8, 12, 6, 8, 8], weights := [0, 1, 1, 0] }

def points67 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8927, representative 10212.
def source68 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B011.Data.entryAt ⟨60, by decide +kernel⟩

def target68 : Weights.Entry :=
  { word := [12, 8, 12, 2, 0, 1, 8], weights := [0, 1, 0, 1] }

def points68 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8929, representative 10212.
def source69 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B011.Data.entryAt ⟨60, by decide +kernel⟩

def target69 : Weights.Entry :=
  { word := [12, 8, 12, 2, 0, 2, 8], weights := [0, 1, 0, 1] }

def points69 : List (ℕ × ℕ) := [(0, 7), (1, 9), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8939, representative 10184.
def source70 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B011.Data.entryAt ⟨32, by decide +kernel⟩

def target70 : Weights.Entry :=
  { word := [12, 8, 12, 2, 0, 9, 8], weights := [0, 1, 0, 1] }

def points70 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8941, representative 10184.
def source71 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B011.Data.entryAt ⟨32, by decide +kernel⟩

def target71 : Weights.Entry :=
  { word := [12, 8, 12, 2, 0, 10, 8], weights := [0, 1, 0, 1] }

def points71 : List (ℕ × ℕ) := [(0, 9), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8943, representative 10213.
def source72 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B011.Data.entryAt ⟨61, by decide +kernel⟩

def target72 : Weights.Entry :=
  { word := [12, 8, 12, 2, 8, 2, 8], weights := [0, 1, 0, 1] }

def points72 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8947, representative 10185.
def source73 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B011.Data.entryAt ⟨33, by decide +kernel⟩

def target73 : Weights.Entry :=
  { word := [12, 8, 12, 2, 8, 10, 8], weights := [0, 1, 0, 1] }

def points73 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8949, representative 10162.
def source74 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B011.Data.entryAt ⟨10, by decide +kernel⟩

def target74 : Weights.Entry :=
  { word := [12, 8, 12, 4, 4, 0, 8], weights := [1, 0, 0, 1] }

def points74 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8953, representative 10163.
def source75 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B011.Data.entryAt ⟨11, by decide +kernel⟩

def target75 : Weights.Entry :=
  { word := [12, 8, 12, 4, 12, 0, 8], weights := [1, 0, 0, 1] }

def points75 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8964, representative 10215.
def source76 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B011.Data.entryAt ⟨63, by decide +kernel⟩

def target76 : Weights.Entry :=
  { word := [12, 8, 12, 10, 0, 1, 8], weights := [0, 1, 0, 1] }

def points76 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8965, representative 10215.
def source77 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B011.Data.entryAt ⟨63, by decide +kernel⟩

def target77 : Weights.Entry :=
  { word := [12, 8, 12, 10, 0, 2, 8], weights := [0, 1, 0, 1] }

def points77 : List (ℕ × ℕ) := [(0, 7), (1, 9), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8973, representative 10187.
def source78 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B011.Data.entryAt ⟨35, by decide +kernel⟩

def target78 : Weights.Entry :=
  { word := [12, 8, 12, 10, 0, 9, 8], weights := [0, 1, 0, 1] }

def points78 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8974, representative 10187.
def source79 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B011.Data.entryAt ⟨35, by decide +kernel⟩

def target79 : Weights.Entry :=
  { word := [12, 8, 12, 10, 0, 10, 8], weights := [0, 1, 0, 1] }

def points79 : List (ℕ × ℕ) := [(0, 9), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8975, representative 10214.
def source80 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B011.Data.entryAt ⟨62, by decide +kernel⟩

def target80 : Weights.Entry :=
  { word := [12, 8, 12, 10, 8, 2, 8], weights := [0, 1, 0, 1] }

def points80 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8980, representative 10186.
def source81 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B011.Data.entryAt ⟨34, by decide +kernel⟩

def target81 : Weights.Entry :=
  { word := [12, 8, 12, 10, 8, 10, 8], weights := [0, 1, 0, 1] }

def points81 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8983, representative 10165.
def source82 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B011.Data.entryAt ⟨13, by decide +kernel⟩

def target82 : Weights.Entry :=
  { word := [12, 8, 12, 12, 4, 0, 8], weights := [1, 0, 0, 1] }

def points82 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8986, representative 10164.
def source83 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B011.Data.entryAt ⟨12, by decide +kernel⟩

def target83 : Weights.Entry :=
  { word := [12, 8, 12, 12, 12, 0, 8], weights := [0, 1, 1, 0] }

def points83 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

def period10Entries : List Weights.Entry := [target0, target1, target2, target3, target4, target5, target6, target7, target8, target9, target10, target11, target12, target13, target14, target15, target16, target17, target18, target19, target20, target21, target22, target23, target24, target25, target26, target27, target28, target29, target30, target31, target32, target33, target34, target35, target36, target37, target38, target39, target40, target41, target42, target43, target44, target45, target46, target47, target48, target49, target50, target51, target52, target53, target54, target55, target56, target57, target58, target59, target60, target61, target62, target63, target64, target65, target66, target67, target68, target69, target70, target71, target72, target73, target74, target75, target76, target77, target78, target79, target80, target81, target82, target83]

def period10Chunk : RowCoverage.Chunk where
  rows := [⟨7396, target0⟩, ⟨7814, target1⟩, ⟨7818, target2⟩, ⟨7834, target3⟩, ⟨7836, target4⟩, ⟨7860, target5⟩, ⟨7862, target6⟩, ⟨7885, target7⟩, ⟨7887, target8⟩, ⟨7929, target9⟩, ⟨7931, target10⟩, ⟨7937, target11⟩, ⟨7939, target12⟩, ⟨7943, target13⟩, ⟨7945, target14⟩, ⟨7955, target15⟩, ⟨7956, target16⟩, ⟨7960, target17⟩, ⟨7963, target18⟩, ⟨7965, target19⟩, ⟨7966, target20⟩, ⟨7968, target21⟩, ⟨7978, target22⟩, ⟨7982, target23⟩, ⟨8000, target24⟩, ⟨8002, target25⟩, ⟨8044, target26⟩, ⟨8046, target27⟩, ⟨8073, target28⟩, ⟨8075, target29⟩, ⟨8137, target30⟩, ⟨8139, target31⟩, ⟨8145, target32⟩, ⟨8147, target33⟩, ⟨8151, target34⟩, ⟨8163, target35⟩, ⟨8164, target36⟩, ⟨8170, target37⟩, ⟨8173, target38⟩, ⟨8176, target39⟩, ⟨8730, target40⟩, ⟨8734, target41⟩, ⟨8750, target42⟩, ⟨8752, target43⟩, ⟨8776, target44⟩, ⟨8778, target45⟩, ⟨8793, target46⟩, ⟨8795, target47⟩, ⟨8819, target48⟩, ⟨8821, target49⟩, ⟨8831, target50⟩, ⟨8833, target51⟩, ⟨8839, target52⟩, ⟨8841, target53⟩, ⟨8845, target54⟩, ⟨8865, target55⟩, ⟨8866, target56⟩, ⟨8872, target57⟩, ⟨8875, target58⟩, ⟨8878, target59⟩, ⟨8888, target60⟩, ⟨8892, target61⟩, ⟨8898, target62⟩, ⟨8900, target63⟩, ⟨8912, target64⟩, ⟨8914, target65⟩, ⟨8919, target66⟩, ⟨8921, target67⟩, ⟨8927, target68⟩, ⟨8929, target69⟩, ⟨8939, target70⟩, ⟨8941, target71⟩, ⟨8943, target72⟩, ⟨8947, target73⟩, ⟨8949, target74⟩, ⟨8953, target75⟩, ⟨8964, target76⟩, ⟨8965, target77⟩, ⟨8973, target78⟩, ⟨8974, target79⟩, ⟨8975, target80⟩, ⟨8980, target81⟩, ⟨8983, target82⟩, ⟨8986, target83⟩]
  indexMask := 129720741377097458580849487488083853286317964002247829654824440234169112469265590574413412851470452313791265301683204828975916285204091862800104653284127333002364986228182835254824815076448254657333671059920632555508717747508118877770320413453320444890521636334688888914980600008562980253765387703909603886209415926130126145836875718974323221665343070747744322795662220338160948870214697175949536313926952656336509959880623598286960330732894751767138571277934399741547644753500767405071954662191811658634100233081670483947160058450009640418037831910695767508473089167068291080683672496468645055412343688509039832186842345178918347194490536829598483879453413627469611627945419907387053660296725325226075057842841367872590915217056722907475269285001563067871307452356507200965055049535595717275515600105289022103112433839778240729399637970218616568187637425419967538234385231646483440679514894403434034184256980327815872826650484102237661788360527976122994584905066694427820976531736213585671408156935374025489508515784621457943479715801529004303757044224478330483353233834906237014270578690228368598596720756722530339248428207692495519330191261197414870836514129006279545817659410649564211463113773037799962239194493226329072887316607995310154780027756197314340537252522208569174721060802801469676571337341478678723820950911637255077302193285189140932246030164107862316869202950752732851635808288526100329233858329699633557198053409552093680040105887922097424487670889522812937681243639599890160868152283281899122855055507818331877888250425187380389367649167498285757222939495711440621755119770543711727049927019708706534999854432240709859118545070173597271841836552782047829051427378065578060630793907542774556973864947854653804757867723207889932403828941929606050019268539163995521580434342300733789909209487552946832387125825701248495459422047756448442453830521986824016497523845753848294639495267355039537018880776037212452233920786394226376394781176995271240739488331099631873998080998180823728517193352623155495935861975247976230781223721059104642325844692973553023425363803937282873729413627707414767797370239955925409348757513032093171254827680856009170149516225215230221594313766771033244400232664100593724909251483272561406317602573386985985739000147923987298219209769513080381497860250322707422723463086450147645444356699461739641688683878384999191932343302544422567160430601226448761133985087301346651970446097186570508943409946762349966710032716976960313444560683926332544368570139207811735824631785396458409220009467993350831557715315924635041299624142336320292295967049995077089537604238370723564487788492189960150226161724440899935759979550985584486873955911905808467242092448178291985088512
  count := 84

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

end FranklSmallCyclic.TransportBatches.G089.B001.Data
