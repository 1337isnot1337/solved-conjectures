module

public import Conjectures.FranklSmallCyclicRowCoverage
public import Conjectures.FranklSmallCyclicCanonicalWords
public import Conjectures.FranklSmallCyclicOrbit9Block017Data

/-! 128 literal targets sharing one source proof block.
Original words and row indices are retained; weights may be transported.
-/
@[expose] public section

namespace FranklSmallCyclic.TransportBatches.G070.B001.Data

-- Period 9, original row 3140, representative 8947.
def source0 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B017.Data.entryAt ⟨20, by decide +kernel⟩

def target0 : Weights.Entry :=
  { word := [2, 8, 12, 10, 0, 1, 8], weights := [1, 0, 0, 1] }

-- Period 9, original row 3141, representative 8947.
def source1 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B017.Data.entryAt ⟨20, by decide +kernel⟩

def target1 : Weights.Entry :=
  { word := [2, 8, 12, 10, 0, 2, 8], weights := [1, 0, 0, 1] }

def points1 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 8), (8, 7)]

-- Period 9, original row 3145, representative 8957.
def source2 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B017.Data.entryAt ⟨30, by decide +kernel⟩

def target2 : Weights.Entry :=
  { word := [2, 8, 12, 10, 0, 8, 8], weights := [1, 0, 0, 1] }

-- Period 9, original row 3151, representative 8946.
def source3 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B017.Data.entryAt ⟨19, by decide +kernel⟩

def target3 : Weights.Entry :=
  { word := [2, 8, 12, 10, 8, 2, 8], weights := [1, 0, 0, 1] }

-- Period 9, original row 3716, representative 8931.
def source4 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B017.Data.entryAt ⟨4, by decide +kernel⟩

def target4 : Weights.Entry :=
  { word := [4, 8, 0, 2, 2, 2, 8], weights := [1, 0, 0, 1] }

def points4 : List (ℕ × ℕ) := [(0, 0), (1, 2), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 3720, representative 8940.
def source5 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B017.Data.entryAt ⟨13, by decide +kernel⟩

def target5 : Weights.Entry :=
  { word := [4, 8, 0, 2, 10, 2, 8], weights := [1, 0, 0, 1] }

def points5 : List (ℕ × ℕ) := [(0, 0), (1, 2), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 3726, representative 8967.
def source6 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B017.Data.entryAt ⟨40, by decide +kernel⟩

def target6 : Weights.Entry :=
  { word := [4, 8, 0, 4, 2, 0, 8], weights := [1, 0, 1, 0] }

def points6 : List (ℕ × ℕ) := [(0, 0), (1, 2), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 3732, representative 8959.
def source7 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B017.Data.entryAt ⟨32, by decide +kernel⟩

def target7 : Weights.Entry :=
  { word := [4, 8, 0, 4, 2, 8, 8], weights := [1, 0, 1, 0] }

def points7 : List (ℕ × ℕ) := [(0, 0), (1, 2), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 3752, representative 8972.
def source8 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B017.Data.entryAt ⟨45, by decide +kernel⟩

def target8 : Weights.Entry :=
  { word := [4, 8, 0, 4, 10, 0, 8], weights := [1, 0, 1, 0] }

def points8 : List (ℕ × ℕ) := [(0, 0), (1, 2), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 3758, representative 8964.
def source9 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B017.Data.entryAt ⟨37, by decide +kernel⟩

def target9 : Weights.Entry :=
  { word := [4, 8, 0, 4, 10, 8, 8], weights := [1, 0, 1, 0] }

def points9 : List (ℕ × ℕ) := [(0, 0), (1, 2), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 3763, representative 8942.
def source10 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B017.Data.entryAt ⟨15, by decide +kernel⟩

def target10 : Weights.Entry :=
  { word := [4, 8, 0, 10, 2, 2, 8], weights := [1, 0, 0, 1] }

def points10 : List (ℕ × ℕ) := [(0, 0), (1, 2), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 3765, representative 8941.
def source11 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B017.Data.entryAt ⟨14, by decide +kernel⟩

def target11 : Weights.Entry :=
  { word := [4, 8, 0, 10, 10, 2, 8], weights := [1, 0, 0, 1] }

def points11 : List (ℕ × ℕ) := [(0, 0), (1, 2), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 3770, representative 8974.
def source12 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B017.Data.entryAt ⟨47, by decide +kernel⟩

def target12 : Weights.Entry :=
  { word := [4, 8, 0, 12, 2, 0, 8], weights := [1, 0, 1, 0] }

def points12 : List (ℕ × ℕ) := [(0, 0), (1, 2), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 3776, representative 8966.
def source13 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B017.Data.entryAt ⟨39, by decide +kernel⟩

def target13 : Weights.Entry :=
  { word := [4, 8, 0, 12, 2, 8, 8], weights := [1, 0, 1, 0] }

def points13 : List (ℕ × ℕ) := [(0, 0), (1, 2), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 3795, representative 8973.
def source14 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B017.Data.entryAt ⟨46, by decide +kernel⟩

def target14 : Weights.Entry :=
  { word := [4, 8, 0, 12, 10, 0, 8], weights := [1, 0, 1, 0] }

def points14 : List (ℕ × ℕ) := [(0, 0), (1, 2), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 3801, representative 8965.
def source15 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B017.Data.entryAt ⟨38, by decide +kernel⟩

def target15 : Weights.Entry :=
  { word := [4, 8, 0, 12, 10, 8, 8], weights := [1, 0, 1, 0] }

def points15 : List (ℕ × ℕ) := [(0, 0), (1, 2), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 3814, representative 8951.
def source16 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B017.Data.entryAt ⟨24, by decide +kernel⟩

def target16 : Weights.Entry :=
  { word := [4, 8, 4, 2, 0, 8, 8], weights := [1, 0, 0, 1] }

-- Period 9, original row 3823, representative 8928.
def source17 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B017.Data.entryAt ⟨1, by decide +kernel⟩

def target17 : Weights.Entry :=
  { word := [4, 8, 4, 2, 8, 2, 8], weights := [1, 0, 0, 1] }

-- Period 9, original row 3844, representative 8930.
def source18 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B017.Data.entryAt ⟨3, by decide +kernel⟩

def target18 : Weights.Entry :=
  { word := [4, 8, 4, 10, 0, 1, 8], weights := [1, 0, 0, 1] }

-- Period 9, original row 3845, representative 8930.
def source19 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B017.Data.entryAt ⟨3, by decide +kernel⟩

def target19 : Weights.Entry :=
  { word := [4, 8, 4, 10, 0, 2, 8], weights := [1, 0, 0, 1] }

def points19 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 8), (8, 7)]

-- Period 9, original row 3849, representative 8954.
def source20 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B017.Data.entryAt ⟨27, by decide +kernel⟩

def target20 : Weights.Entry :=
  { word := [4, 8, 4, 10, 0, 8, 8], weights := [1, 0, 0, 1] }

-- Period 9, original row 3855, representative 8929.
def source21 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B017.Data.entryAt ⟨2, by decide +kernel⟩

def target21 : Weights.Entry :=
  { word := [4, 8, 4, 10, 8, 2, 8], weights := [0, 1, 1, 0] }

-- Period 9, original row 3874, representative 8932.
def source22 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B017.Data.entryAt ⟨5, by decide +kernel⟩

def target22 : Weights.Entry :=
  { word := [4, 8, 8, 2, 2, 2, 8], weights := [1, 0, 0, 1] }

-- Period 9, original row 3878, representative 8933.
def source23 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B017.Data.entryAt ⟨6, by decide +kernel⟩

def target23 : Weights.Entry :=
  { word := [4, 8, 8, 2, 10, 2, 8], weights := [1, 0, 0, 1] }

-- Period 9, original row 3899, representative 8935.
def source24 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B017.Data.entryAt ⟨8, by decide +kernel⟩

def target24 : Weights.Entry :=
  { word := [4, 8, 8, 10, 2, 2, 8], weights := [0, 1, 1, 0] }

-- Period 9, original row 3901, representative 8934.
def source25 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B017.Data.entryAt ⟨7, by decide +kernel⟩

def target25 : Weights.Entry :=
  { word := [4, 8, 8, 10, 10, 2, 8], weights := [0, 1, 1, 0] }

-- Period 9, original row 3922, representative 8952.
def source26 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B017.Data.entryAt ⟨25, by decide +kernel⟩

def target26 : Weights.Entry :=
  { word := [4, 8, 12, 2, 0, 8, 8], weights := [1, 0, 0, 1] }

-- Period 9, original row 3952, representative 8927.
def source27 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B017.Data.entryAt ⟨0, by decide +kernel⟩

def target27 : Weights.Entry :=
  { word := [4, 8, 12, 10, 0, 1, 8], weights := [1, 0, 0, 1] }

-- Period 9, original row 3953, representative 8927.
def source28 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B017.Data.entryAt ⟨0, by decide +kernel⟩

def target28 : Weights.Entry :=
  { word := [4, 8, 12, 10, 0, 2, 8], weights := [1, 0, 0, 1] }

def points28 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 8), (8, 7)]

-- Period 9, original row 3957, representative 8953.
def source29 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B017.Data.entryAt ⟨26, by decide +kernel⟩

def target29 : Weights.Entry :=
  { word := [4, 8, 12, 10, 0, 8, 8], weights := [1, 0, 0, 1] }

-- Period 9, original row 4125, representative 8995.
def source30 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B017.Data.entryAt ⟨68, by decide +kernel⟩

def target30 : Weights.Entry :=
  { word := [8, 0, 1, 4, 2, 0, 4], weights := [1, 0, 0, 1] }

def points30 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 4131, representative 8943.
def source31 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B017.Data.entryAt ⟨16, by decide +kernel⟩

def target31 : Weights.Entry :=
  { word := [8, 0, 1, 4, 2, 8, 4], weights := [1, 0, 0, 1] }

def points31 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 4147, representative 8996.
def source32 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B017.Data.entryAt ⟨69, by decide +kernel⟩

def target32 : Weights.Entry :=
  { word := [8, 0, 1, 4, 10, 0, 4], weights := [1, 0, 0, 1] }

def points32 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 4153, representative 8944.
def source33 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B017.Data.entryAt ⟨17, by decide +kernel⟩

def target33 : Weights.Entry :=
  { word := [8, 0, 1, 4, 10, 8, 4], weights := [1, 0, 0, 1] }

def points33 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 4161, representative 9002.
def source34 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B017.Data.entryAt ⟨75, by decide +kernel⟩

def target34 : Weights.Entry :=
  { word := [8, 0, 1, 12, 2, 0, 4], weights := [1, 0, 0, 1] }

def points34 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 4166, representative 8930.
def source35 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B017.Data.entryAt ⟨3, by decide +kernel⟩

def target35 : Weights.Entry :=
  { word := [8, 0, 1, 12, 2, 8, 2], weights := [1, 0, 0, 1] }

def points35 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 4167, representative 8950.
def source36 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B017.Data.entryAt ⟨23, by decide +kernel⟩

def target36 : Weights.Entry :=
  { word := [8, 0, 1, 12, 2, 8, 4], weights := [1, 0, 0, 1] }

def points36 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 4183, representative 8999.
def source37 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B017.Data.entryAt ⟨72, by decide +kernel⟩

def target37 : Weights.Entry :=
  { word := [8, 0, 1, 12, 10, 0, 4], weights := [1, 0, 0, 1] }

def points37 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 4188, representative 8927.
def source38 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B017.Data.entryAt ⟨0, by decide +kernel⟩

def target38 : Weights.Entry :=
  { word := [8, 0, 1, 12, 10, 8, 2], weights := [1, 0, 0, 1] }

def points38 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 4189, representative 8947.
def source39 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B017.Data.entryAt ⟨20, by decide +kernel⟩

def target39 : Weights.Entry :=
  { word := [8, 0, 1, 12, 10, 8, 4], weights := [1, 0, 0, 1] }

def points39 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 4197, representative 8995.
def source40 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B017.Data.entryAt ⟨68, by decide +kernel⟩

def target40 : Weights.Entry :=
  { word := [8, 0, 2, 2, 2, 0, 4], weights := [1, 0, 0, 1] }

def points40 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 4), (5, 5), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 4203, representative 9032.
def source41 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B017.Data.entryAt ⟨105, by decide +kernel⟩

def target41 : Weights.Entry :=
  { word := [8, 0, 2, 2, 2, 8, 1], weights := [1, 0, 0, 1] }

def points41 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 4212, representative 8996.
def source42 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B017.Data.entryAt ⟨69, by decide +kernel⟩

def target42 : Weights.Entry :=
  { word := [8, 0, 2, 2, 10, 0, 4], weights := [1, 0, 0, 1] }

def points42 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 4), (5, 5), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 4218, representative 9033.
def source43 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B017.Data.entryAt ⟨106, by decide +kernel⟩

def target43 : Weights.Entry :=
  { word := [8, 0, 2, 2, 10, 8, 1], weights := [1, 0, 0, 1] }

def points43 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 4227, representative 9002.
def source44 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B017.Data.entryAt ⟨75, by decide +kernel⟩

def target44 : Weights.Entry :=
  { word := [8, 0, 2, 10, 2, 0, 4], weights := [1, 0, 0, 1] }

def points44 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 4), (5, 5), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 4232, representative 9039.
def source45 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B017.Data.entryAt ⟨112, by decide +kernel⟩

def target45 : Weights.Entry :=
  { word := [8, 0, 2, 10, 2, 8, 1], weights := [1, 0, 0, 1] }

def points45 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 4241, representative 8999.
def source46 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B017.Data.entryAt ⟨72, by decide +kernel⟩

def target46 : Weights.Entry :=
  { word := [8, 0, 2, 10, 10, 0, 4], weights := [1, 0, 0, 1] }

def points46 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 4), (5, 5), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 4246, representative 9036.
def source47 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B017.Data.entryAt ⟨109, by decide +kernel⟩

def target47 : Weights.Entry :=
  { word := [8, 0, 2, 10, 10, 8, 1], weights := [1, 0, 0, 1] }

def points47 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 4259, representative 8967.
def source48 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B017.Data.entryAt ⟨40, by decide +kernel⟩

def target48 : Weights.Entry :=
  { word := [8, 0, 4, 2, 0, 8, 2], weights := [0, 1, 0, 1] }

def points48 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 4260, representative 8967.
def source49 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B017.Data.entryAt ⟨40, by decide +kernel⟩

def target49 : Weights.Entry :=
  { word := [8, 0, 4, 2, 0, 8, 4], weights := [0, 1, 0, 1] }

def points49 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 4271, representative 8968.
def source50 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B017.Data.entryAt ⟨41, by decide +kernel⟩

def target50 : Weights.Entry :=
  { word := [8, 0, 4, 2, 8, 8, 4], weights := [0, 1, 0, 1] }

def points50 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 4291, representative 8974.
def source51 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B017.Data.entryAt ⟨47, by decide +kernel⟩

def target51 : Weights.Entry :=
  { word := [8, 0, 4, 10, 0, 8, 2], weights := [0, 1, 0, 1] }

def points51 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 4292, representative 8974.
def source52 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B017.Data.entryAt ⟨47, by decide +kernel⟩

def target52 : Weights.Entry :=
  { word := [8, 0, 4, 10, 0, 8, 4], weights := [0, 1, 0, 1] }

def points52 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 4307, representative 8971.
def source53 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B017.Data.entryAt ⟨44, by decide +kernel⟩

def target53 : Weights.Entry :=
  { word := [8, 0, 4, 10, 8, 8, 4], weights := [0, 1, 0, 1] }

def points53 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 4316, representative 9040.
def source54 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B017.Data.entryAt ⟨113, by decide +kernel⟩

def target54 : Weights.Entry :=
  { word := [8, 0, 6, 2, 0, 8, 1], weights := [1, 0, 0, 1] }

def points54 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 4324, representative 9041.
def source55 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B017.Data.entryAt ⟨114, by decide +kernel⟩

def target55 : Weights.Entry :=
  { word := [8, 0, 6, 2, 8, 8, 1], weights := [1, 0, 0, 1] }

def points55 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 4331, representative 9043.
def source56 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B017.Data.entryAt ⟨116, by decide +kernel⟩

def target56 : Weights.Entry :=
  { word := [8, 0, 6, 10, 0, 8, 1], weights := [1, 0, 0, 1] }

def points56 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 4338, representative 9042.
def source57 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B017.Data.entryAt ⟨115, by decide +kernel⟩

def target57 : Weights.Entry :=
  { word := [8, 0, 6, 10, 8, 8, 1], weights := [0, 1, 1, 0] }

def points57 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 4363, representative 9009.
def source58 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B017.Data.entryAt ⟨82, by decide +kernel⟩

def target58 : Weights.Entry :=
  { word := [8, 0, 8, 8, 4, 6, 0], weights := [0, 1, 1, 0] }

def points58 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 4397, representative 9037.
def source59 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B017.Data.entryAt ⟨110, by decide +kernel⟩

def target59 : Weights.Entry :=
  { word := [8, 0, 10, 2, 2, 8, 1], weights := [1, 0, 0, 1] }

def points59 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 4405, representative 9034.
def source60 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B017.Data.entryAt ⟨107, by decide +kernel⟩

def target60 : Weights.Entry :=
  { word := [8, 0, 10, 2, 10, 8, 1], weights := [1, 0, 0, 1] }

def points60 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 4412, representative 9038.
def source61 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B017.Data.entryAt ⟨111, by decide +kernel⟩

def target61 : Weights.Entry :=
  { word := [8, 0, 10, 10, 2, 8, 1], weights := [0, 1, 1, 0] }

def points61 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 4419, representative 9035.
def source62 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B017.Data.entryAt ⟨108, by decide +kernel⟩

def target62 : Weights.Entry :=
  { word := [8, 0, 10, 10, 10, 8, 1], weights := [0, 1, 1, 0] }

def points62 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 4432, representative 8972.
def source63 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B017.Data.entryAt ⟨45, by decide +kernel⟩

def target63 : Weights.Entry :=
  { word := [8, 0, 12, 2, 0, 8, 2], weights := [0, 1, 0, 1] }

def points63 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 4433, representative 8972.
def source64 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B017.Data.entryAt ⟨45, by decide +kernel⟩

def target64 : Weights.Entry :=
  { word := [8, 0, 12, 2, 0, 8, 4], weights := [0, 1, 0, 1] }

def points64 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 4444, representative 8969.
def source65 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B017.Data.entryAt ⟨42, by decide +kernel⟩

def target65 : Weights.Entry :=
  { word := [8, 0, 12, 2, 8, 8, 4], weights := [0, 1, 0, 1] }

def points65 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 4467, representative 8973.
def source66 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B017.Data.entryAt ⟨46, by decide +kernel⟩

def target66 : Weights.Entry :=
  { word := [8, 0, 12, 10, 0, 8, 2], weights := [0, 1, 0, 1] }

def points66 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 4468, representative 8973.
def source67 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B017.Data.entryAt ⟨46, by decide +kernel⟩

def target67 : Weights.Entry :=
  { word := [8, 0, 12, 10, 0, 8, 4], weights := [0, 1, 0, 1] }

def points67 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 4483, representative 8970.
def source68 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B017.Data.entryAt ⟨43, by decide +kernel⟩

def target68 : Weights.Entry :=
  { word := [8, 0, 12, 10, 8, 8, 4], weights := [0, 1, 0, 1] }

def points68 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 5004, representative 8995.
def source69 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B017.Data.entryAt ⟨68, by decide +kernel⟩

def target69 : Weights.Entry :=
  { word := [8, 4, 0, 4, 2, 0, 4], weights := [1, 0, 0, 1] }

def points69 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2)]

-- Period 9, original row 5010, representative 8943.
def source70 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B017.Data.entryAt ⟨16, by decide +kernel⟩

def target70 : Weights.Entry :=
  { word := [8, 4, 0, 4, 2, 8, 4], weights := [1, 0, 0, 1] }

def points70 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2)]

-- Period 9, original row 5026, representative 8996.
def source71 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B017.Data.entryAt ⟨69, by decide +kernel⟩

def target71 : Weights.Entry :=
  { word := [8, 4, 0, 4, 10, 0, 4], weights := [1, 0, 0, 1] }

def points71 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2)]

-- Period 9, original row 5032, representative 8944.
def source72 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B017.Data.entryAt ⟨17, by decide +kernel⟩

def target72 : Weights.Entry :=
  { word := [8, 4, 0, 4, 10, 8, 4], weights := [1, 0, 0, 1] }

def points72 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2)]

-- Period 9, original row 5040, representative 9002.
def source73 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B017.Data.entryAt ⟨75, by decide +kernel⟩

def target73 : Weights.Entry :=
  { word := [8, 4, 0, 12, 2, 0, 4], weights := [1, 0, 0, 1] }

def points73 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2)]

-- Period 9, original row 5045, representative 8930.
def source74 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B017.Data.entryAt ⟨3, by decide +kernel⟩

def target74 : Weights.Entry :=
  { word := [8, 4, 0, 12, 2, 8, 2], weights := [1, 0, 0, 1] }

def points74 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2)]

-- Period 9, original row 5046, representative 8950.
def source75 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B017.Data.entryAt ⟨23, by decide +kernel⟩

def target75 : Weights.Entry :=
  { word := [8, 4, 0, 12, 2, 8, 4], weights := [1, 0, 0, 1] }

def points75 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2)]

-- Period 9, original row 5062, representative 8999.
def source76 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B017.Data.entryAt ⟨72, by decide +kernel⟩

def target76 : Weights.Entry :=
  { word := [8, 4, 0, 12, 10, 0, 4], weights := [1, 0, 0, 1] }

def points76 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2)]

-- Period 9, original row 5067, representative 8927.
def source77 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B017.Data.entryAt ⟨0, by decide +kernel⟩

def target77 : Weights.Entry :=
  { word := [8, 4, 0, 12, 10, 8, 2], weights := [1, 0, 0, 1] }

def points77 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2)]

-- Period 9, original row 5068, representative 8947.
def source78 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B017.Data.entryAt ⟨20, by decide +kernel⟩

def target78 : Weights.Entry :=
  { word := [8, 4, 0, 12, 10, 8, 4], weights := [1, 0, 0, 1] }

def points78 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2)]

-- Period 9, original row 5074, representative 9016.
def source79 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B017.Data.entryAt ⟨89, by decide +kernel⟩

def target79 : Weights.Entry :=
  { word := [8, 4, 2, 0, 1, 8, 1], weights := [0, 1, 2, 1] }

def points79 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 5077, representative 9017.
def source80 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B017.Data.entryAt ⟨90, by decide +kernel⟩

def target80 : Weights.Entry :=
  { word := [8, 4, 2, 0, 9, 8, 1], weights := [0, 1, 2, 1] }

def points80 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 5104, representative 8931.
def source81 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B017.Data.entryAt ⟨4, by decide +kernel⟩

def target81 : Weights.Entry :=
  { word := [8, 4, 4, 4, 0, 8, 2], weights := [1, 0, 0, 1] }

def points81 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 5105, representative 8931.
def source82 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B017.Data.entryAt ⟨4, by decide +kernel⟩

def target82 : Weights.Entry :=
  { word := [8, 4, 4, 4, 0, 8, 4], weights := [1, 0, 0, 1] }

def points82 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 5112, representative 8991.
def source83 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B017.Data.entryAt ⟨64, by decide +kernel⟩

def target83 : Weights.Entry :=
  { word := [8, 4, 4, 4, 8, 0, 4], weights := [1, 0, 0, 1] }

def points83 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 5118, representative 8932.
def source84 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B017.Data.entryAt ⟨5, by decide +kernel⟩

def target84 : Weights.Entry :=
  { word := [8, 4, 4, 4, 8, 8, 2], weights := [1, 0, 0, 1] }

def points84 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 5119, representative 8936.
def source85 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B017.Data.entryAt ⟨9, by decide +kernel⟩

def target85 : Weights.Entry :=
  { word := [8, 4, 4, 4, 8, 8, 4], weights := [1, 0, 0, 1] }

def points85 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 5132, representative 8942.
def source86 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B017.Data.entryAt ⟨15, by decide +kernel⟩

def target86 : Weights.Entry :=
  { word := [8, 4, 4, 12, 0, 8, 2], weights := [1, 0, 0, 1] }

def points86 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 5133, representative 8942.
def source87 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B017.Data.entryAt ⟨15, by decide +kernel⟩

def target87 : Weights.Entry :=
  { word := [8, 4, 4, 12, 0, 8, 4], weights := [1, 0, 0, 1] }

def points87 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 5140, representative 8994.
def source88 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B017.Data.entryAt ⟨67, by decide +kernel⟩

def target88 : Weights.Entry :=
  { word := [8, 4, 4, 12, 8, 0, 4], weights := [1, 0, 0, 1] }

def points88 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 5146, representative 8935.
def source89 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B017.Data.entryAt ⟨8, by decide +kernel⟩

def target89 : Weights.Entry :=
  { word := [8, 4, 4, 12, 8, 8, 2], weights := [0, 1, 1, 0] }

def points89 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 5147, representative 8939.
def source90 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B017.Data.entryAt ⟨12, by decide +kernel⟩

def target90 : Weights.Entry :=
  { word := [8, 4, 4, 12, 8, 8, 4], weights := [1, 0, 0, 1] }

def points90 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 5152, representative 9015.
def source91 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B017.Data.entryAt ⟨88, by decide +kernel⟩

def target91 : Weights.Entry :=
  { word := [8, 4, 6, 8, 8, 8, 1], weights := [0, 1, 1, 0] }

def points91 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 5159, representative 9000.
def source92 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B017.Data.entryAt ⟨73, by decide +kernel⟩

def target92 : Weights.Entry :=
  { word := [8, 4, 8, 4, 2, 0, 4], weights := [1, 0, 0, 1] }

def points92 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 5164, representative 8928.
def source93 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B017.Data.entryAt ⟨1, by decide +kernel⟩

def target93 : Weights.Entry :=
  { word := [8, 4, 8, 4, 2, 8, 2], weights := [1, 0, 0, 1] }

def points93 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 5165, representative 8948.
def source94 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B017.Data.entryAt ⟨21, by decide +kernel⟩

def target94 : Weights.Entry :=
  { word := [8, 4, 8, 4, 2, 8, 4], weights := [1, 0, 0, 1] }

def points94 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 5185, representative 8997.
def source95 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B017.Data.entryAt ⟨70, by decide +kernel⟩

def target95 : Weights.Entry :=
  { word := [8, 4, 8, 4, 10, 0, 4], weights := [1, 0, 0, 1] }

def points95 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 5191, representative 8945.
def source96 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B017.Data.entryAt ⟨18, by decide +kernel⟩

def target96 : Weights.Entry :=
  { word := [8, 4, 8, 4, 10, 8, 4], weights := [1, 0, 0, 1] }

def points96 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 5201, representative 9001.
def source97 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B017.Data.entryAt ⟨74, by decide +kernel⟩

def target97 : Weights.Entry :=
  { word := [8, 4, 8, 12, 2, 0, 4], weights := [1, 0, 0, 1] }

def points97 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 5206, representative 8929.
def source98 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B017.Data.entryAt ⟨2, by decide +kernel⟩

def target98 : Weights.Entry :=
  { word := [8, 4, 8, 12, 2, 8, 2], weights := [0, 1, 1, 0] }

def points98 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 5207, representative 8949.
def source99 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B017.Data.entryAt ⟨22, by decide +kernel⟩

def target99 : Weights.Entry :=
  { word := [8, 4, 8, 12, 2, 8, 4], weights := [1, 0, 0, 1] }

def points99 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 5227, representative 8998.
def source100 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B017.Data.entryAt ⟨71, by decide +kernel⟩

def target100 : Weights.Entry :=
  { word := [8, 4, 8, 12, 10, 0, 4], weights := [1, 0, 0, 1] }

def points100 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 5233, representative 8946.
def source101 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B017.Data.entryAt ⟨19, by decide +kernel⟩

def target101 : Weights.Entry :=
  { word := [8, 4, 8, 12, 10, 8, 4], weights := [1, 0, 0, 1] }

def points101 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 5241, representative 9019.
def source102 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B017.Data.entryAt ⟨92, by decide +kernel⟩

def target102 : Weights.Entry :=
  { word := [8, 4, 10, 0, 1, 8, 1], weights := [0, 1, 2, 1] }

def points102 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 5244, representative 9018.
def source103 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B017.Data.entryAt ⟨91, by decide +kernel⟩

def target103 : Weights.Entry :=
  { word := [8, 4, 10, 0, 9, 8, 1], weights := [0, 1, 2, 1] }

def points103 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 5254, representative 8940.
def source104 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B017.Data.entryAt ⟨13, by decide +kernel⟩

def target104 : Weights.Entry :=
  { word := [8, 4, 12, 4, 0, 8, 2], weights := [1, 0, 0, 1] }

def points104 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 5255, representative 8940.
def source105 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B017.Data.entryAt ⟨13, by decide +kernel⟩

def target105 : Weights.Entry :=
  { word := [8, 4, 12, 4, 0, 8, 4], weights := [1, 0, 0, 1] }

def points105 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 5262, representative 8992.
def source106 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B017.Data.entryAt ⟨65, by decide +kernel⟩

def target106 : Weights.Entry :=
  { word := [8, 4, 12, 4, 8, 0, 4], weights := [1, 0, 0, 1] }

def points106 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 5268, representative 8933.
def source107 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B017.Data.entryAt ⟨6, by decide +kernel⟩

def target107 : Weights.Entry :=
  { word := [8, 4, 12, 4, 8, 8, 2], weights := [1, 0, 0, 1] }

def points107 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 5269, representative 8937.
def source108 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B017.Data.entryAt ⟨10, by decide +kernel⟩

def target108 : Weights.Entry :=
  { word := [8, 4, 12, 4, 8, 8, 4], weights := [1, 0, 0, 1] }

def points108 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 5275, representative 8941.
def source109 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B017.Data.entryAt ⟨14, by decide +kernel⟩

def target109 : Weights.Entry :=
  { word := [8, 4, 12, 12, 0, 8, 2], weights := [1, 0, 0, 1] }

def points109 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 5276, representative 8941.
def source110 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B017.Data.entryAt ⟨14, by decide +kernel⟩

def target110 : Weights.Entry :=
  { word := [8, 4, 12, 12, 0, 8, 4], weights := [1, 0, 0, 1] }

def points110 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 5283, representative 8993.
def source111 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B017.Data.entryAt ⟨66, by decide +kernel⟩

def target111 : Weights.Entry :=
  { word := [8, 4, 12, 12, 8, 0, 4], weights := [1, 0, 0, 1] }

def points111 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 5289, representative 8934.
def source112 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B017.Data.entryAt ⟨7, by decide +kernel⟩

def target112 : Weights.Entry :=
  { word := [8, 4, 12, 12, 8, 8, 2], weights := [0, 1, 1, 0] }

def points112 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 5290, representative 8938.
def source113 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B017.Data.entryAt ⟨11, by decide +kernel⟩

def target113 : Weights.Entry :=
  { word := [8, 4, 12, 12, 8, 8, 4], weights := [1, 0, 0, 1] }

def points113 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 5343, representative 9003.
def source114 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B017.Data.entryAt ⟨76, by decide +kernel⟩

def target114 : Weights.Entry :=
  { word := [8, 8, 0, 4, 2, 0, 4], weights := [1, 0, 0, 1] }

def points114 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2)]

-- Period 9, original row 5348, representative 8951.
def source115 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B017.Data.entryAt ⟨24, by decide +kernel⟩

def target115 : Weights.Entry :=
  { word := [8, 8, 0, 4, 2, 8, 2], weights := [1, 0, 0, 1] }

def points115 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2)]

-- Period 9, original row 5349, representative 8955.
def source116 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B017.Data.entryAt ⟨28, by decide +kernel⟩

def target116 : Weights.Entry :=
  { word := [8, 8, 0, 4, 2, 8, 4], weights := [1, 0, 0, 1] }

def points116 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2)]

-- Period 9, original row 5369, representative 9004.
def source117 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B017.Data.entryAt ⟨77, by decide +kernel⟩

def target117 : Weights.Entry :=
  { word := [8, 8, 0, 4, 10, 0, 4], weights := [1, 0, 0, 1] }

def points117 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2)]

-- Period 9, original row 5374, representative 8952.
def source118 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B017.Data.entryAt ⟨25, by decide +kernel⟩

def target118 : Weights.Entry :=
  { word := [8, 8, 0, 4, 10, 8, 2], weights := [1, 0, 0, 1] }

def points118 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2)]

-- Period 9, original row 5375, representative 8956.
def source119 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B017.Data.entryAt ⟨29, by decide +kernel⟩

def target119 : Weights.Entry :=
  { word := [8, 8, 0, 4, 10, 8, 4], weights := [1, 0, 0, 1] }

def points119 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2)]

-- Period 9, original row 5407, representative 9006.
def source120 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B017.Data.entryAt ⟨79, by decide +kernel⟩

def target120 : Weights.Entry :=
  { word := [8, 8, 0, 12, 2, 0, 4], weights := [1, 0, 0, 1] }

def points120 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2)]

-- Period 9, original row 5412, representative 8954.
def source121 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B017.Data.entryAt ⟨27, by decide +kernel⟩

def target121 : Weights.Entry :=
  { word := [8, 8, 0, 12, 2, 8, 2], weights := [1, 0, 0, 1] }

def points121 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2)]

-- Period 9, original row 5413, representative 8958.
def source122 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B017.Data.entryAt ⟨31, by decide +kernel⟩

def target122 : Weights.Entry :=
  { word := [8, 8, 0, 12, 2, 8, 4], weights := [1, 0, 0, 1] }

def points122 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2)]

-- Period 9, original row 5432, representative 9005.
def source123 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B017.Data.entryAt ⟨78, by decide +kernel⟩

def target123 : Weights.Entry :=
  { word := [8, 8, 0, 12, 10, 0, 4], weights := [1, 0, 0, 1] }

def points123 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2)]

-- Period 9, original row 5437, representative 8953.
def source124 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B017.Data.entryAt ⟨26, by decide +kernel⟩

def target124 : Weights.Entry :=
  { word := [8, 8, 0, 12, 10, 8, 2], weights := [1, 0, 0, 1] }

def points124 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2)]

-- Period 9, original row 5438, representative 8957.
def source125 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B017.Data.entryAt ⟨30, by decide +kernel⟩

def target125 : Weights.Entry :=
  { word := [8, 8, 0, 12, 10, 8, 4], weights := [1, 0, 0, 1] }

def points125 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2)]

-- Period 9, original row 5446, representative 8979.
def source126 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B017.Data.entryAt ⟨52, by decide +kernel⟩

def target126 : Weights.Entry :=
  { word := [8, 8, 1, 4, 2, 0, 4], weights := [1, 0, 0, 1] }

def points126 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 5468, representative 8980.
def source127 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B017.Data.entryAt ⟨53, by decide +kernel⟩

def target127 : Weights.Entry :=
  { word := [8, 8, 1, 4, 10, 0, 4], weights := [1, 0, 0, 1] }

def points127 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

def period9Entries : List Weights.Entry := [target0, target1, target2, target3, target4, target5, target6, target7, target8, target9, target10, target11, target12, target13, target14, target15, target16, target17, target18, target19, target20, target21, target22, target23, target24, target25, target26, target27, target28, target29, target30, target31, target32, target33, target34, target35, target36, target37, target38, target39, target40, target41, target42, target43, target44, target45, target46, target47, target48, target49, target50, target51, target52, target53, target54, target55, target56, target57, target58, target59, target60, target61, target62, target63, target64, target65, target66, target67, target68, target69, target70, target71, target72, target73, target74, target75, target76, target77, target78, target79, target80, target81, target82, target83, target84, target85, target86, target87, target88, target89, target90, target91, target92, target93, target94, target95, target96, target97, target98, target99, target100, target101, target102, target103, target104, target105, target106, target107, target108, target109, target110, target111, target112, target113, target114, target115, target116, target117, target118, target119, target120, target121, target122, target123, target124, target125, target126, target127]

def period9Chunk : RowCoverage.Chunk where
  rows := [⟨3140, target0⟩, ⟨3141, target1⟩, ⟨3145, target2⟩, ⟨3151, target3⟩, ⟨3716, target4⟩, ⟨3720, target5⟩, ⟨3726, target6⟩, ⟨3732, target7⟩, ⟨3752, target8⟩, ⟨3758, target9⟩, ⟨3763, target10⟩, ⟨3765, target11⟩, ⟨3770, target12⟩, ⟨3776, target13⟩, ⟨3795, target14⟩, ⟨3801, target15⟩, ⟨3814, target16⟩, ⟨3823, target17⟩, ⟨3844, target18⟩, ⟨3845, target19⟩, ⟨3849, target20⟩, ⟨3855, target21⟩, ⟨3874, target22⟩, ⟨3878, target23⟩, ⟨3899, target24⟩, ⟨3901, target25⟩, ⟨3922, target26⟩, ⟨3952, target27⟩, ⟨3953, target28⟩, ⟨3957, target29⟩, ⟨4125, target30⟩, ⟨4131, target31⟩, ⟨4147, target32⟩, ⟨4153, target33⟩, ⟨4161, target34⟩, ⟨4166, target35⟩, ⟨4167, target36⟩, ⟨4183, target37⟩, ⟨4188, target38⟩, ⟨4189, target39⟩, ⟨4197, target40⟩, ⟨4203, target41⟩, ⟨4212, target42⟩, ⟨4218, target43⟩, ⟨4227, target44⟩, ⟨4232, target45⟩, ⟨4241, target46⟩, ⟨4246, target47⟩, ⟨4259, target48⟩, ⟨4260, target49⟩, ⟨4271, target50⟩, ⟨4291, target51⟩, ⟨4292, target52⟩, ⟨4307, target53⟩, ⟨4316, target54⟩, ⟨4324, target55⟩, ⟨4331, target56⟩, ⟨4338, target57⟩, ⟨4363, target58⟩, ⟨4397, target59⟩, ⟨4405, target60⟩, ⟨4412, target61⟩, ⟨4419, target62⟩, ⟨4432, target63⟩, ⟨4433, target64⟩, ⟨4444, target65⟩, ⟨4467, target66⟩, ⟨4468, target67⟩, ⟨4483, target68⟩, ⟨5004, target69⟩, ⟨5010, target70⟩, ⟨5026, target71⟩, ⟨5032, target72⟩, ⟨5040, target73⟩, ⟨5045, target74⟩, ⟨5046, target75⟩, ⟨5062, target76⟩, ⟨5067, target77⟩, ⟨5068, target78⟩, ⟨5074, target79⟩, ⟨5077, target80⟩, ⟨5104, target81⟩, ⟨5105, target82⟩, ⟨5112, target83⟩, ⟨5118, target84⟩, ⟨5119, target85⟩, ⟨5132, target86⟩, ⟨5133, target87⟩, ⟨5140, target88⟩, ⟨5146, target89⟩, ⟨5147, target90⟩, ⟨5152, target91⟩, ⟨5159, target92⟩, ⟨5164, target93⟩, ⟨5165, target94⟩, ⟨5185, target95⟩, ⟨5191, target96⟩, ⟨5201, target97⟩, ⟨5206, target98⟩, ⟨5207, target99⟩, ⟨5227, target100⟩, ⟨5233, target101⟩, ⟨5241, target102⟩, ⟨5244, target103⟩, ⟨5254, target104⟩, ⟨5255, target105⟩, ⟨5262, target106⟩, ⟨5268, target107⟩, ⟨5269, target108⟩, ⟨5275, target109⟩, ⟨5276, target110⟩, ⟨5283, target111⟩, ⟨5289, target112⟩, ⟨5290, target113⟩, ⟨5343, target114⟩, ⟨5348, target115⟩, ⟨5349, target116⟩, ⟨5369, target117⟩, ⟨5374, target118⟩, ⟨5375, target119⟩, ⟨5407, target120⟩, ⟨5412, target121⟩, ⟨5413, target122⟩, ⟨5432, target123⟩, ⟨5437, target124⟩, ⟨5438, target125⟩, ⟨5446, target126⟩, ⟨5468, target127⟩]
  indexMask := 107650585142806591280559297737336383082527630548211638948571660606552870746943650883107756180042028840503588064821841645119789189499045195674649017607046586652686642547345319561264566169970763013944040692342647000390806323271144652890465360490358481942005327440412977221250290424680832215872424398877508300662260785859227689072020518058065402578299710649377072141023365497869603570657690016884336166549718149811297688482334927942264531267492085049783524367340575945630008511987003119374817842477869953358375725222812016772863964194548266894026846321620211138951221641985480562260901415712156370406840445512790543310224853989492172833397464990983015179353943997752123603154890317279466130974637808278544918186135440126523442989593769834316347188344115538313971017434586883859060248989564025983070254103289395663528489371269418474000073277524870151146665185158877273892250090576410023674841518032056105480412860973186469280483161055581980789810963770012922221464496328054533773666090570917627284666143328202820650538630669189377017938356352597038454375723662278300924284645262822866806740509268681069939529655890218511277038899204826488009952507186789612215303227518291421537539025210506052237902320441540710364681730588131977522029271664402028764105095987793865607594582166435432241068142628692176042362266365717205994827606426947595517404570412435986461776510657320260318565718322202383481311909142341813847978439962705554738174316979217839478981839380068527916501441997520761858230991466110727763226640022353324204984365625800429288185640307944655260311548642856743509702523028450668997869875938996084981962404624151258568455719864570540399263744
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

end FranklSmallCyclic.TransportBatches.G070.B001.Data
