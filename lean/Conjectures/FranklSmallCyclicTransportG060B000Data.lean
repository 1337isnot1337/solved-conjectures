module

public import Conjectures.FranklSmallCyclicRowCoverage
public import Conjectures.FranklSmallCyclicCanonicalWords
public import Conjectures.FranklSmallCyclicOrbit9Block007Data

/-! 128 literal targets sharing one source proof block.
Original words and row indices are retained; weights may be transported.
-/
@[expose] public section

namespace FranklSmallCyclic.TransportBatches.G060.B000.Data

-- Period 9, original row 336, representative 7656.
def source0 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B007.Data.entryAt ⟨9, by decide +kernel⟩

def target0 : Weights.Entry :=
  { word := [0, 2, 2, 2, 8, 0, 9], weights := [1, 1, 0, 0] }

-- Period 9, original row 337, representative 7656.
def source1 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B007.Data.entryAt ⟨9, by decide +kernel⟩

def target1 : Weights.Entry :=
  { word := [0, 2, 2, 2, 8, 0, 10], weights := [1, 1, 0, 0] }

def points1 : List (ℕ × ℕ) := [(0, 8), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 0)]

-- Period 9, original row 338, representative 7658.
def source2 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B007.Data.entryAt ⟨11, by decide +kernel⟩

def target2 : Weights.Entry :=
  { word := [0, 2, 2, 2, 8, 0, 12], weights := [1, 0, 0, 1] }

-- Period 9, original row 387, representative 7657.
def source3 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B007.Data.entryAt ⟨10, by decide +kernel⟩

def target3 : Weights.Entry :=
  { word := [0, 2, 2, 10, 8, 0, 9], weights := [1, 1, 0, 0] }

-- Period 9, original row 388, representative 7657.
def source4 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B007.Data.entryAt ⟨10, by decide +kernel⟩

def target4 : Weights.Entry :=
  { word := [0, 2, 2, 10, 8, 0, 10], weights := [1, 1, 0, 0] }

def points4 : List (ℕ × ℕ) := [(0, 8), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 0)]

-- Period 9, original row 389, representative 7659.
def source5 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B007.Data.entryAt ⟨12, by decide +kernel⟩

def target5 : Weights.Entry :=
  { word := [0, 2, 2, 10, 8, 0, 12], weights := [1, 1, 0, 0] }

-- Period 9, original row 1154, representative 7648.
def source6 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B007.Data.entryAt ⟨1, by decide +kernel⟩

def target6 : Weights.Entry :=
  { word := [0, 9, 0, 4, 2, 0, 9], weights := [1, 0, 1, 0] }

-- Period 9, original row 1155, representative 7648.
def source7 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B007.Data.entryAt ⟨1, by decide +kernel⟩

def target7 : Weights.Entry :=
  { word := [0, 9, 0, 4, 2, 0, 10], weights := [1, 0, 1, 0] }

def points7 : List (ℕ × ℕ) := [(0, 8), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 0)]

-- Period 9, original row 1156, representative 7652.
def source8 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B007.Data.entryAt ⟨5, by decide +kernel⟩

def target8 : Weights.Entry :=
  { word := [0, 9, 0, 4, 2, 0, 12], weights := [1, 0, 0, 1] }

-- Period 9, original row 1180, representative 7649.
def source9 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B007.Data.entryAt ⟨2, by decide +kernel⟩

def target9 : Weights.Entry :=
  { word := [0, 9, 0, 4, 10, 0, 9], weights := [1, 0, 1, 0] }

-- Period 9, original row 1181, representative 7649.
def source10 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B007.Data.entryAt ⟨2, by decide +kernel⟩

def target10 : Weights.Entry :=
  { word := [0, 9, 0, 4, 10, 0, 10], weights := [1, 0, 1, 0] }

def points10 : List (ℕ × ℕ) := [(0, 8), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 0)]

-- Period 9, original row 1182, representative 7653.
def source11 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B007.Data.entryAt ⟨6, by decide +kernel⟩

def target11 : Weights.Entry :=
  { word := [0, 9, 0, 4, 10, 0, 12], weights := [1, 0, 0, 1] }

-- Period 9, original row 1214, representative 7651.
def source12 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B007.Data.entryAt ⟨4, by decide +kernel⟩

def target12 : Weights.Entry :=
  { word := [0, 9, 0, 12, 2, 0, 9], weights := [1, 0, 1, 0] }

-- Period 9, original row 1215, representative 7651.
def source13 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B007.Data.entryAt ⟨4, by decide +kernel⟩

def target13 : Weights.Entry :=
  { word := [0, 9, 0, 12, 2, 0, 10], weights := [1, 0, 1, 0] }

def points13 : List (ℕ × ℕ) := [(0, 8), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 0)]

-- Period 9, original row 1216, representative 7655.
def source14 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B007.Data.entryAt ⟨8, by decide +kernel⟩

def target14 : Weights.Entry :=
  { word := [0, 9, 0, 12, 2, 0, 12], weights := [1, 0, 1, 0] }

-- Period 9, original row 1239, representative 7650.
def source15 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B007.Data.entryAt ⟨3, by decide +kernel⟩

def target15 : Weights.Entry :=
  { word := [0, 9, 0, 12, 10, 0, 9], weights := [1, 0, 1, 0] }

-- Period 9, original row 1240, representative 7650.
def source16 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B007.Data.entryAt ⟨3, by decide +kernel⟩

def target16 : Weights.Entry :=
  { word := [0, 9, 0, 12, 10, 0, 10], weights := [1, 0, 1, 0] }

def points16 : List (ℕ × ℕ) := [(0, 8), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 0)]

-- Period 9, original row 1241, representative 7654.
def source17 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B007.Data.entryAt ⟨7, by decide +kernel⟩

def target17 : Weights.Entry :=
  { word := [0, 9, 0, 12, 10, 0, 12], weights := [1, 0, 1, 0] }

-- Period 9, original row 1415, representative 7647.
def source18 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B007.Data.entryAt ⟨0, by decide +kernel⟩

def target18 : Weights.Entry :=
  { word := [0, 10, 2, 10, 8, 0, 12], weights := [1, 1, 0, 0] }

-- Period 9, original row 4133, representative 7746.
def source19 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B007.Data.entryAt ⟨99, by decide +kernel⟩

def target19 : Weights.Entry :=
  { word := [8, 0, 1, 4, 2, 8, 10], weights := [1, 0, 1, 0] }

-- Period 9, original row 4134, representative 7754.
def source20 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B007.Data.entryAt ⟨107, by decide +kernel⟩

def target20 : Weights.Entry :=
  { word := [8, 0, 1, 4, 2, 8, 12], weights := [1, 0, 0, 1] }

-- Period 9, original row 4155, representative 7747.
def source21 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B007.Data.entryAt ⟨100, by decide +kernel⟩

def target21 : Weights.Entry :=
  { word := [8, 0, 1, 4, 10, 8, 10], weights := [1, 0, 1, 0] }

-- Period 9, original row 4156, representative 7755.
def source22 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B007.Data.entryAt ⟨108, by decide +kernel⟩

def target22 : Weights.Entry :=
  { word := [8, 0, 1, 4, 10, 8, 12], weights := [1, 0, 0, 1] }

-- Period 9, original row 4169, representative 7753.
def source23 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B007.Data.entryAt ⟨106, by decide +kernel⟩

def target23 : Weights.Entry :=
  { word := [8, 0, 1, 12, 2, 8, 10], weights := [1, 0, 1, 0] }

-- Period 9, original row 4170, representative 7761.
def source24 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B007.Data.entryAt ⟨114, by decide +kernel⟩

def target24 : Weights.Entry :=
  { word := [8, 0, 1, 12, 2, 8, 12], weights := [1, 0, 1, 0] }

-- Period 9, original row 4191, representative 7750.
def source25 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B007.Data.entryAt ⟨103, by decide +kernel⟩

def target25 : Weights.Entry :=
  { word := [8, 0, 1, 12, 10, 8, 10], weights := [1, 0, 1, 0] }

-- Period 9, original row 4192, representative 7758.
def source26 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B007.Data.entryAt ⟨111, by decide +kernel⟩

def target26 : Weights.Entry :=
  { word := [8, 0, 1, 12, 10, 8, 12], weights := [1, 0, 1, 0] }

-- Period 9, original row 4208, representative 7696.
def source27 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B007.Data.entryAt ⟨49, by decide +kernel⟩

def target27 : Weights.Entry :=
  { word := [8, 0, 2, 2, 2, 8, 10], weights := [1, 0, 0, 1] }

-- Period 9, original row 4209, representative 7704.
def source28 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B007.Data.entryAt ⟨57, by decide +kernel⟩

def target28 : Weights.Entry :=
  { word := [8, 0, 2, 2, 2, 8, 12], weights := [1, 0, 0, 1] }

-- Period 9, original row 4223, representative 7697.
def source29 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B007.Data.entryAt ⟨50, by decide +kernel⟩

def target29 : Weights.Entry :=
  { word := [8, 0, 2, 2, 10, 8, 10], weights := [1, 0, 0, 1] }

-- Period 9, original row 4224, representative 7705.
def source30 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B007.Data.entryAt ⟨58, by decide +kernel⟩

def target30 : Weights.Entry :=
  { word := [8, 0, 2, 2, 10, 8, 12], weights := [1, 0, 0, 1] }

-- Period 9, original row 4237, representative 7703.
def source31 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B007.Data.entryAt ⟨56, by decide +kernel⟩

def target31 : Weights.Entry :=
  { word := [8, 0, 2, 10, 2, 8, 10], weights := [1, 0, 0, 1] }

-- Period 9, original row 4238, representative 7711.
def source32 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B007.Data.entryAt ⟨64, by decide +kernel⟩

def target32 : Weights.Entry :=
  { word := [8, 0, 2, 10, 2, 8, 12], weights := [1, 0, 0, 1] }

-- Period 9, original row 4251, representative 7700.
def source33 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B007.Data.entryAt ⟨53, by decide +kernel⟩

def target33 : Weights.Entry :=
  { word := [8, 0, 2, 10, 10, 8, 10], weights := [1, 0, 0, 1] }

-- Period 9, original row 4252, representative 7708.
def source34 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B007.Data.entryAt ⟨61, by decide +kernel⟩

def target34 : Weights.Entry :=
  { word := [8, 0, 2, 10, 10, 8, 12], weights := [1, 0, 0, 1] }

-- Period 9, original row 4321, representative 7712.
def source35 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B007.Data.entryAt ⟨65, by decide +kernel⟩

def target35 : Weights.Entry :=
  { word := [8, 0, 6, 2, 0, 8, 10], weights := [1, 0, 0, 1] }

-- Period 9, original row 4322, representative 7712.
def source36 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B007.Data.entryAt ⟨65, by decide +kernel⟩

def target36 : Weights.Entry :=
  { word := [8, 0, 6, 2, 0, 8, 12], weights := [1, 0, 0, 1] }

def points36 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 8), (8, 7)]

-- Period 9, original row 4329, representative 7713.
def source37 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B007.Data.entryAt ⟨66, by decide +kernel⟩

def target37 : Weights.Entry :=
  { word := [8, 0, 6, 2, 8, 8, 10], weights := [1, 0, 0, 1] }

-- Period 9, original row 4330, representative 7715.
def source38 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B007.Data.entryAt ⟨68, by decide +kernel⟩

def target38 : Weights.Entry :=
  { word := [8, 0, 6, 2, 8, 8, 12], weights := [1, 0, 0, 1] }

-- Period 9, original row 4336, representative 7717.
def source39 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B007.Data.entryAt ⟨70, by decide +kernel⟩

def target39 : Weights.Entry :=
  { word := [8, 0, 6, 10, 0, 8, 10], weights := [1, 0, 0, 1] }

-- Period 9, original row 4337, representative 7717.
def source40 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B007.Data.entryAt ⟨70, by decide +kernel⟩

def target40 : Weights.Entry :=
  { word := [8, 0, 6, 10, 0, 8, 12], weights := [1, 0, 0, 1] }

def points40 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 8), (8, 7)]

-- Period 9, original row 4343, representative 7714.
def source41 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B007.Data.entryAt ⟨67, by decide +kernel⟩

def target41 : Weights.Entry :=
  { word := [8, 0, 6, 10, 8, 8, 10], weights := [0, 1, 1, 0] }

-- Period 9, original row 4344, representative 7716.
def source42 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B007.Data.entryAt ⟨69, by decide +kernel⟩

def target42 : Weights.Entry :=
  { word := [8, 0, 6, 10, 8, 8, 12], weights := [1, 0, 0, 1] }

-- Period 9, original row 4402, representative 7701.
def source43 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B007.Data.entryAt ⟨54, by decide +kernel⟩

def target43 : Weights.Entry :=
  { word := [8, 0, 10, 2, 2, 8, 10], weights := [1, 0, 0, 1] }

-- Period 9, original row 4403, representative 7709.
def source44 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B007.Data.entryAt ⟨62, by decide +kernel⟩

def target44 : Weights.Entry :=
  { word := [8, 0, 10, 2, 2, 8, 12], weights := [1, 0, 0, 1] }

-- Period 9, original row 4410, representative 7698.
def source45 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B007.Data.entryAt ⟨51, by decide +kernel⟩

def target45 : Weights.Entry :=
  { word := [8, 0, 10, 2, 10, 8, 10], weights := [1, 0, 0, 1] }

-- Period 9, original row 4411, representative 7706.
def source46 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B007.Data.entryAt ⟨59, by decide +kernel⟩

def target46 : Weights.Entry :=
  { word := [8, 0, 10, 2, 10, 8, 12], weights := [1, 0, 0, 1] }

-- Period 9, original row 4417, representative 7702.
def source47 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B007.Data.entryAt ⟨55, by decide +kernel⟩

def target47 : Weights.Entry :=
  { word := [8, 0, 10, 10, 2, 8, 10], weights := [0, 1, 1, 0] }

-- Period 9, original row 4418, representative 7710.
def source48 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B007.Data.entryAt ⟨63, by decide +kernel⟩

def target48 : Weights.Entry :=
  { word := [8, 0, 10, 10, 2, 8, 12], weights := [1, 0, 0, 1] }

-- Period 9, original row 4424, representative 7699.
def source49 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B007.Data.entryAt ⟨52, by decide +kernel⟩

def target49 : Weights.Entry :=
  { word := [8, 0, 10, 10, 10, 8, 10], weights := [0, 1, 1, 0] }

-- Period 9, original row 4425, representative 7707.
def source50 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B007.Data.entryAt ⟨60, by decide +kernel⟩

def target50 : Weights.Entry :=
  { word := [8, 0, 10, 10, 10, 8, 12], weights := [1, 0, 0, 1] }

-- Period 9, original row 4520, representative 7648.
def source51 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B007.Data.entryAt ⟨1, by decide +kernel⟩

def target51 : Weights.Entry :=
  { word := [8, 1, 4, 2, 0, 8, 1], weights := [0, 1, 0, 1] }

def points51 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 4548, representative 7651.
def source52 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B007.Data.entryAt ⟨4, by decide +kernel⟩

def target52 : Weights.Entry :=
  { word := [8, 1, 4, 10, 0, 8, 1], weights := [0, 1, 0, 1] }

def points52 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 4583, representative 7656.
def source53 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B007.Data.entryAt ⟨9, by decide +kernel⟩

def target53 : Weights.Entry :=
  { word := [8, 1, 8, 4, 4, 4, 0], weights := [0, 0, 1, 1] }

def points53 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 4600, representative 7657.
def source54 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B007.Data.entryAt ⟨10, by decide +kernel⟩

def target54 : Weights.Entry :=
  { word := [8, 1, 8, 12, 4, 4, 0], weights := [0, 0, 1, 1] }

def points54 : List (ℕ × ℕ) := [(0, 0), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 4609, representative 7649.
def source55 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B007.Data.entryAt ⟨2, by decide +kernel⟩

def target55 : Weights.Entry :=
  { word := [8, 1, 12, 2, 0, 8, 1], weights := [0, 1, 0, 1] }

def points55 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 4641, representative 7650.
def source56 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B007.Data.entryAt ⟨3, by decide +kernel⟩

def target56 : Weights.Entry :=
  { word := [8, 1, 12, 10, 0, 8, 1], weights := [0, 1, 0, 1] }

def points56 : List (ℕ × ℕ) := [(0, 0), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1)]

-- Period 9, original row 5012, representative 7746.
def source57 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B007.Data.entryAt ⟨99, by decide +kernel⟩

def target57 : Weights.Entry :=
  { word := [8, 4, 0, 4, 2, 8, 10], weights := [1, 0, 1, 0] }

def points57 : List (ℕ × ℕ) := [(0, 0), (1, 2), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 5013, representative 7754.
def source58 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B007.Data.entryAt ⟨107, by decide +kernel⟩

def target58 : Weights.Entry :=
  { word := [8, 4, 0, 4, 2, 8, 12], weights := [1, 0, 0, 1] }

def points58 : List (ℕ × ℕ) := [(0, 0), (1, 2), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 5034, representative 7747.
def source59 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B007.Data.entryAt ⟨100, by decide +kernel⟩

def target59 : Weights.Entry :=
  { word := [8, 4, 0, 4, 10, 8, 10], weights := [1, 0, 1, 0] }

def points59 : List (ℕ × ℕ) := [(0, 0), (1, 2), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 5035, representative 7755.
def source60 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B007.Data.entryAt ⟨108, by decide +kernel⟩

def target60 : Weights.Entry :=
  { word := [8, 4, 0, 4, 10, 8, 12], weights := [1, 0, 0, 1] }

def points60 : List (ℕ × ℕ) := [(0, 0), (1, 2), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 5048, representative 7753.
def source61 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B007.Data.entryAt ⟨106, by decide +kernel⟩

def target61 : Weights.Entry :=
  { word := [8, 4, 0, 12, 2, 8, 10], weights := [1, 0, 1, 0] }

def points61 : List (ℕ × ℕ) := [(0, 0), (1, 2), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 5049, representative 7761.
def source62 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B007.Data.entryAt ⟨114, by decide +kernel⟩

def target62 : Weights.Entry :=
  { word := [8, 4, 0, 12, 2, 8, 12], weights := [1, 0, 1, 0] }

def points62 : List (ℕ × ℕ) := [(0, 0), (1, 2), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 5070, representative 7750.
def source63 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B007.Data.entryAt ⟨103, by decide +kernel⟩

def target63 : Weights.Entry :=
  { word := [8, 4, 0, 12, 10, 8, 10], weights := [1, 0, 1, 0] }

def points63 : List (ℕ × ℕ) := [(0, 0), (1, 2), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 5071, representative 7758.
def source64 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B007.Data.entryAt ⟨111, by decide +kernel⟩

def target64 : Weights.Entry :=
  { word := [8, 4, 0, 12, 10, 8, 12], weights := [1, 0, 1, 0] }

def points64 : List (ℕ × ℕ) := [(0, 0), (1, 2), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8)]

-- Period 9, original row 5087, representative 7672.
def source65 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B007.Data.entryAt ⟨25, by decide +kernel⟩

def target65 : Weights.Entry :=
  { word := [8, 4, 2, 8, 2, 8, 10], weights := [0, 1, 1, 0] }

-- Period 9, original row 5095, representative 7670.
def source66 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B007.Data.entryAt ⟨23, by decide +kernel⟩

def target66 : Weights.Entry :=
  { word := [8, 4, 2, 8, 10, 8, 10], weights := [0, 1, 1, 0] }

-- Period 9, original row 5108, representative 7762.
def source67 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B007.Data.entryAt ⟨115, by decide +kernel⟩

def target67 : Weights.Entry :=
  { word := [8, 4, 4, 4, 0, 8, 10], weights := [1, 0, 0, 1] }

-- Period 9, original row 5109, representative 7762.
def source68 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B007.Data.entryAt ⟨115, by decide +kernel⟩

def target68 : Weights.Entry :=
  { word := [8, 4, 4, 4, 0, 8, 12], weights := [1, 0, 0, 1] }

def points68 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 8), (8, 7)]

-- Period 9, original row 5122, representative 7763.
def source69 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B007.Data.entryAt ⟨116, by decide +kernel⟩

def target69 : Weights.Entry :=
  { word := [8, 4, 4, 4, 8, 8, 10], weights := [1, 0, 1, 0] }

-- Period 9, original row 5123, representative 7767.
def source70 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B007.Data.entryAt ⟨120, by decide +kernel⟩

def target70 : Weights.Entry :=
  { word := [8, 4, 4, 4, 8, 8, 12], weights := [1, 0, 0, 1] }

-- Period 9, original row 5136, representative 7773.
def source71 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B007.Data.entryAt ⟨126, by decide +kernel⟩

def target71 : Weights.Entry :=
  { word := [8, 4, 4, 12, 0, 8, 10], weights := [1, 0, 1, 0] }

-- Period 9, original row 5137, representative 7773.
def source72 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B007.Data.entryAt ⟨126, by decide +kernel⟩

def target72 : Weights.Entry :=
  { word := [8, 4, 4, 12, 0, 8, 12], weights := [1, 0, 1, 0] }

def points72 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 8), (8, 7)]

-- Period 9, original row 5150, representative 7766.
def source73 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B007.Data.entryAt ⟨119, by decide +kernel⟩

def target73 : Weights.Entry :=
  { word := [8, 4, 4, 12, 8, 8, 10], weights := [1, 0, 1, 0] }

-- Period 9, original row 5151, representative 7770.
def source74 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B007.Data.entryAt ⟨123, by decide +kernel⟩

def target74 : Weights.Entry :=
  { word := [8, 4, 4, 12, 8, 8, 12], weights := [1, 0, 1, 0] }

-- Period 9, original row 5156, representative 7673.
def source75 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B007.Data.entryAt ⟨26, by decide +kernel⟩

def target75 : Weights.Entry :=
  { word := [8, 4, 6, 8, 8, 8, 10], weights := [0, 1, 1, 0] }

-- Period 9, original row 5167, representative 7751.
def source76 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B007.Data.entryAt ⟨104, by decide +kernel⟩

def target76 : Weights.Entry :=
  { word := [8, 4, 8, 4, 2, 8, 10], weights := [1, 0, 1, 0] }

-- Period 9, original row 5168, representative 7759.
def source77 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B007.Data.entryAt ⟨112, by decide +kernel⟩

def target77 : Weights.Entry :=
  { word := [8, 4, 8, 4, 2, 8, 12], weights := [1, 0, 0, 1] }

-- Period 9, original row 5193, representative 7748.
def source78 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B007.Data.entryAt ⟨101, by decide +kernel⟩

def target78 : Weights.Entry :=
  { word := [8, 4, 8, 4, 10, 8, 10], weights := [1, 0, 1, 0] }

-- Period 9, original row 5194, representative 7756.
def source79 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B007.Data.entryAt ⟨109, by decide +kernel⟩

def target79 : Weights.Entry :=
  { word := [8, 4, 8, 4, 10, 8, 12], weights := [1, 0, 0, 1] }

-- Period 9, original row 5209, representative 7752.
def source80 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B007.Data.entryAt ⟨105, by decide +kernel⟩

def target80 : Weights.Entry :=
  { word := [8, 4, 8, 12, 2, 8, 10], weights := [1, 0, 1, 0] }

-- Period 9, original row 5210, representative 7760.
def source81 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B007.Data.entryAt ⟨113, by decide +kernel⟩

def target81 : Weights.Entry :=
  { word := [8, 4, 8, 12, 2, 8, 12], weights := [1, 0, 1, 0] }

-- Period 9, original row 5235, representative 7749.
def source82 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B007.Data.entryAt ⟨102, by decide +kernel⟩

def target82 : Weights.Entry :=
  { word := [8, 4, 8, 12, 10, 8, 10], weights := [1, 0, 1, 0] }

-- Period 9, original row 5236, representative 7757.
def source83 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B007.Data.entryAt ⟨110, by decide +kernel⟩

def target83 : Weights.Entry :=
  { word := [8, 4, 8, 12, 10, 8, 12], weights := [1, 0, 1, 0] }

-- Period 9, original row 5249, representative 7671.
def source84 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B007.Data.entryAt ⟨24, by decide +kernel⟩

def target84 : Weights.Entry :=
  { word := [8, 4, 10, 8, 2, 8, 10], weights := [0, 1, 1, 0] }

-- Period 9, original row 5252, representative 7669.
def source85 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B007.Data.entryAt ⟨22, by decide +kernel⟩

def target85 : Weights.Entry :=
  { word := [8, 4, 10, 8, 10, 8, 10], weights := [0, 1, 1, 0] }

-- Period 9, original row 5258, representative 7771.
def source86 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B007.Data.entryAt ⟨124, by decide +kernel⟩

def target86 : Weights.Entry :=
  { word := [8, 4, 12, 4, 0, 8, 10], weights := [1, 0, 0, 1] }

-- Period 9, original row 5259, representative 7771.
def source87 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B007.Data.entryAt ⟨124, by decide +kernel⟩

def target87 : Weights.Entry :=
  { word := [8, 4, 12, 4, 0, 8, 12], weights := [1, 0, 0, 1] }

def points87 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 8), (8, 7)]

-- Period 9, original row 5272, representative 7764.
def source88 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B007.Data.entryAt ⟨117, by decide +kernel⟩

def target88 : Weights.Entry :=
  { word := [8, 4, 12, 4, 8, 8, 10], weights := [1, 0, 1, 0] }

-- Period 9, original row 5273, representative 7768.
def source89 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B007.Data.entryAt ⟨121, by decide +kernel⟩

def target89 : Weights.Entry :=
  { word := [8, 4, 12, 4, 8, 8, 12], weights := [1, 0, 0, 1] }

-- Period 9, original row 5279, representative 7772.
def source90 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B007.Data.entryAt ⟨125, by decide +kernel⟩

def target90 : Weights.Entry :=
  { word := [8, 4, 12, 12, 0, 8, 10], weights := [1, 0, 1, 0] }

-- Period 9, original row 5280, representative 7772.
def source91 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B007.Data.entryAt ⟨125, by decide +kernel⟩

def target91 : Weights.Entry :=
  { word := [8, 4, 12, 12, 0, 8, 12], weights := [1, 0, 1, 0] }

def points91 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 8), (8, 7)]

-- Period 9, original row 5293, representative 7765.
def source92 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B007.Data.entryAt ⟨118, by decide +kernel⟩

def target92 : Weights.Entry :=
  { word := [8, 4, 12, 12, 8, 8, 10], weights := [1, 0, 1, 0] }

-- Period 9, original row 5294, representative 7769.
def source93 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B007.Data.entryAt ⟨122, by decide +kernel⟩

def target93 : Weights.Entry :=
  { word := [8, 4, 12, 12, 8, 8, 12], weights := [1, 0, 1, 0] }

-- Period 9, original row 5320, representative 7662.
def source94 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B007.Data.entryAt ⟨15, by decide +kernel⟩

def target94 : Weights.Entry :=
  { word := [8, 8, 0, 1, 4, 8, 12], weights := [0, 1, 0, 0] }

-- Period 9, original row 5326, representative 7660.
def source95 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B007.Data.entryAt ⟨13, by decide +kernel⟩

def target95 : Weights.Entry :=
  { word := [8, 8, 0, 1, 12, 8, 12], weights := [0, 1, 0, 0] }

-- Period 9, original row 5351, representative 7774.
def source96 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B007.Data.entryAt ⟨127, by decide +kernel⟩

def target96 : Weights.Entry :=
  { word := [8, 8, 0, 4, 2, 8, 10], weights := [1, 0, 1, 0] }

-- Period 9, original row 5454, representative 7718.
def source97 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B007.Data.entryAt ⟨71, by decide +kernel⟩

def target97 : Weights.Entry :=
  { word := [8, 8, 1, 4, 2, 8, 10], weights := [1, 0, 1, 0] }

-- Period 9, original row 5455, representative 7726.
def source98 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B007.Data.entryAt ⟨79, by decide +kernel⟩

def target98 : Weights.Entry :=
  { word := [8, 8, 1, 4, 2, 8, 12], weights := [1, 0, 0, 1] }

-- Period 9, original row 5476, representative 7719.
def source99 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B007.Data.entryAt ⟨72, by decide +kernel⟩

def target99 : Weights.Entry :=
  { word := [8, 8, 1, 4, 10, 8, 10], weights := [1, 0, 1, 0] }

-- Period 9, original row 5477, representative 7727.
def source100 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B007.Data.entryAt ⟨80, by decide +kernel⟩

def target100 : Weights.Entry :=
  { word := [8, 8, 1, 4, 10, 8, 12], weights := [1, 0, 0, 1] }

-- Period 9, original row 5490, representative 7725.
def source101 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B007.Data.entryAt ⟨78, by decide +kernel⟩

def target101 : Weights.Entry :=
  { word := [8, 8, 1, 12, 2, 8, 10], weights := [1, 0, 1, 0] }

-- Period 9, original row 5491, representative 7733.
def source102 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B007.Data.entryAt ⟨86, by decide +kernel⟩

def target102 : Weights.Entry :=
  { word := [8, 8, 1, 12, 2, 8, 12], weights := [1, 0, 1, 0] }

-- Period 9, original row 5512, representative 7722.
def source103 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B007.Data.entryAt ⟨75, by decide +kernel⟩

def target103 : Weights.Entry :=
  { word := [8, 8, 1, 12, 10, 8, 10], weights := [1, 0, 1, 0] }

-- Period 9, original row 5513, representative 7730.
def source104 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B007.Data.entryAt ⟨83, by decide +kernel⟩

def target104 : Weights.Entry :=
  { word := [8, 8, 1, 12, 10, 8, 12], weights := [1, 0, 1, 0] }

-- Period 9, original row 5529, representative 7674.
def source105 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B007.Data.entryAt ⟨27, by decide +kernel⟩

def target105 : Weights.Entry :=
  { word := [8, 8, 2, 2, 2, 8, 10], weights := [1, 0, 0, 1] }

-- Period 9, original row 5530, representative 7682.
def source106 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B007.Data.entryAt ⟨35, by decide +kernel⟩

def target106 : Weights.Entry :=
  { word := [8, 8, 2, 2, 2, 8, 12], weights := [1, 0, 0, 1] }

-- Period 9, original row 5544, representative 7675.
def source107 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B007.Data.entryAt ⟨28, by decide +kernel⟩

def target107 : Weights.Entry :=
  { word := [8, 8, 2, 2, 10, 8, 10], weights := [1, 0, 0, 1] }

-- Period 9, original row 5545, representative 7683.
def source108 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B007.Data.entryAt ⟨36, by decide +kernel⟩

def target108 : Weights.Entry :=
  { word := [8, 8, 2, 2, 10, 8, 12], weights := [1, 0, 0, 1] }

-- Period 9, original row 5558, representative 7681.
def source109 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B007.Data.entryAt ⟨34, by decide +kernel⟩

def target109 : Weights.Entry :=
  { word := [8, 8, 2, 10, 2, 8, 10], weights := [0, 1, 1, 0] }

-- Period 9, original row 5559, representative 7689.
def source110 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B007.Data.entryAt ⟨42, by decide +kernel⟩

def target110 : Weights.Entry :=
  { word := [8, 8, 2, 10, 2, 8, 12], weights := [1, 0, 0, 1] }

-- Period 9, original row 5572, representative 7678.
def source111 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B007.Data.entryAt ⟨31, by decide +kernel⟩

def target111 : Weights.Entry :=
  { word := [8, 8, 2, 10, 10, 8, 10], weights := [0, 1, 1, 0] }

-- Period 9, original row 5573, representative 7686.
def source112 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B007.Data.entryAt ⟨39, by decide +kernel⟩

def target112 : Weights.Entry :=
  { word := [8, 8, 2, 10, 10, 8, 12], weights := [1, 0, 0, 1] }

-- Period 9, original row 5647, representative 7690.
def source113 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B007.Data.entryAt ⟨43, by decide +kernel⟩

def target113 : Weights.Entry :=
  { word := [8, 8, 6, 2, 0, 8, 10], weights := [1, 0, 0, 1] }

-- Period 9, original row 5648, representative 7690.
def source114 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B007.Data.entryAt ⟨43, by decide +kernel⟩

def target114 : Weights.Entry :=
  { word := [8, 8, 6, 2, 0, 8, 12], weights := [1, 0, 0, 1] }

def points114 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 8), (8, 7)]

-- Period 9, original row 5655, representative 7691.
def source115 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B007.Data.entryAt ⟨44, by decide +kernel⟩

def target115 : Weights.Entry :=
  { word := [8, 8, 6, 2, 8, 8, 10], weights := [1, 0, 0, 1] }

-- Period 9, original row 5656, representative 7693.
def source116 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B007.Data.entryAt ⟨46, by decide +kernel⟩

def target116 : Weights.Entry :=
  { word := [8, 8, 6, 2, 8, 8, 12], weights := [1, 0, 0, 1] }

-- Period 9, original row 5662, representative 7695.
def source117 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B007.Data.entryAt ⟨48, by decide +kernel⟩

def target117 : Weights.Entry :=
  { word := [8, 8, 6, 10, 0, 8, 10], weights := [1, 0, 0, 1] }

-- Period 9, original row 5663, representative 7695.
def source118 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B007.Data.entryAt ⟨48, by decide +kernel⟩

def target118 : Weights.Entry :=
  { word := [8, 8, 6, 10, 0, 8, 12], weights := [1, 0, 0, 1] }

def points118 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 8), (8, 7)]

-- Period 9, original row 5669, representative 7692.
def source119 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B007.Data.entryAt ⟨45, by decide +kernel⟩

def target119 : Weights.Entry :=
  { word := [8, 8, 6, 10, 8, 8, 10], weights := [0, 1, 1, 0] }

-- Period 9, original row 5670, representative 7694.
def source120 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B007.Data.entryAt ⟨47, by decide +kernel⟩

def target120 : Weights.Entry :=
  { word := [8, 8, 6, 10, 8, 8, 12], weights := [1, 0, 0, 1] }

-- Period 9, original row 5674, representative 7663.
def source121 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B007.Data.entryAt ⟨16, by decide +kernel⟩

def target121 : Weights.Entry :=
  { word := [8, 8, 8, 1, 4, 8, 12], weights := [0, 1, 0, 0] }

-- Period 9, original row 5680, representative 7661.
def source122 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B007.Data.entryAt ⟨14, by decide +kernel⟩

def target122 : Weights.Entry :=
  { word := [8, 8, 8, 1, 12, 8, 12], weights := [0, 1, 0, 0] }

-- Period 9, original row 5758, representative 7679.
def source123 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B007.Data.entryAt ⟨32, by decide +kernel⟩

def target123 : Weights.Entry :=
  { word := [8, 8, 10, 2, 2, 8, 10], weights := [1, 0, 0, 1] }

-- Period 9, original row 5759, representative 7687.
def source124 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B007.Data.entryAt ⟨40, by decide +kernel⟩

def target124 : Weights.Entry :=
  { word := [8, 8, 10, 2, 2, 8, 12], weights := [1, 0, 0, 1] }

-- Period 9, original row 5766, representative 7676.
def source125 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B007.Data.entryAt ⟨29, by decide +kernel⟩

def target125 : Weights.Entry :=
  { word := [8, 8, 10, 2, 10, 8, 10], weights := [1, 0, 0, 1] }

-- Period 9, original row 5767, representative 7684.
def source126 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B007.Data.entryAt ⟨37, by decide +kernel⟩

def target126 : Weights.Entry :=
  { word := [8, 8, 10, 2, 10, 8, 12], weights := [1, 0, 0, 1] }

-- Period 9, original row 5773, representative 7680.
def source127 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P9.B007.Data.entryAt ⟨33, by decide +kernel⟩

def target127 : Weights.Entry :=
  { word := [8, 8, 10, 10, 2, 8, 10], weights := [0, 1, 1, 0] }

def period9Entries : List Weights.Entry := [target0, target1, target2, target3, target4, target5, target6, target7, target8, target9, target10, target11, target12, target13, target14, target15, target16, target17, target18, target19, target20, target21, target22, target23, target24, target25, target26, target27, target28, target29, target30, target31, target32, target33, target34, target35, target36, target37, target38, target39, target40, target41, target42, target43, target44, target45, target46, target47, target48, target49, target50, target51, target52, target53, target54, target55, target56, target57, target58, target59, target60, target61, target62, target63, target64, target65, target66, target67, target68, target69, target70, target71, target72, target73, target74, target75, target76, target77, target78, target79, target80, target81, target82, target83, target84, target85, target86, target87, target88, target89, target90, target91, target92, target93, target94, target95, target96, target97, target98, target99, target100, target101, target102, target103, target104, target105, target106, target107, target108, target109, target110, target111, target112, target113, target114, target115, target116, target117, target118, target119, target120, target121, target122, target123, target124, target125, target126, target127]

def period9Chunk : RowCoverage.Chunk where
  rows := [⟨336, target0⟩, ⟨337, target1⟩, ⟨338, target2⟩, ⟨387, target3⟩, ⟨388, target4⟩, ⟨389, target5⟩, ⟨1154, target6⟩, ⟨1155, target7⟩, ⟨1156, target8⟩, ⟨1180, target9⟩, ⟨1181, target10⟩, ⟨1182, target11⟩, ⟨1214, target12⟩, ⟨1215, target13⟩, ⟨1216, target14⟩, ⟨1239, target15⟩, ⟨1240, target16⟩, ⟨1241, target17⟩, ⟨1415, target18⟩, ⟨4133, target19⟩, ⟨4134, target20⟩, ⟨4155, target21⟩, ⟨4156, target22⟩, ⟨4169, target23⟩, ⟨4170, target24⟩, ⟨4191, target25⟩, ⟨4192, target26⟩, ⟨4208, target27⟩, ⟨4209, target28⟩, ⟨4223, target29⟩, ⟨4224, target30⟩, ⟨4237, target31⟩, ⟨4238, target32⟩, ⟨4251, target33⟩, ⟨4252, target34⟩, ⟨4321, target35⟩, ⟨4322, target36⟩, ⟨4329, target37⟩, ⟨4330, target38⟩, ⟨4336, target39⟩, ⟨4337, target40⟩, ⟨4343, target41⟩, ⟨4344, target42⟩, ⟨4402, target43⟩, ⟨4403, target44⟩, ⟨4410, target45⟩, ⟨4411, target46⟩, ⟨4417, target47⟩, ⟨4418, target48⟩, ⟨4424, target49⟩, ⟨4425, target50⟩, ⟨4520, target51⟩, ⟨4548, target52⟩, ⟨4583, target53⟩, ⟨4600, target54⟩, ⟨4609, target55⟩, ⟨4641, target56⟩, ⟨5012, target57⟩, ⟨5013, target58⟩, ⟨5034, target59⟩, ⟨5035, target60⟩, ⟨5048, target61⟩, ⟨5049, target62⟩, ⟨5070, target63⟩, ⟨5071, target64⟩, ⟨5087, target65⟩, ⟨5095, target66⟩, ⟨5108, target67⟩, ⟨5109, target68⟩, ⟨5122, target69⟩, ⟨5123, target70⟩, ⟨5136, target71⟩, ⟨5137, target72⟩, ⟨5150, target73⟩, ⟨5151, target74⟩, ⟨5156, target75⟩, ⟨5167, target76⟩, ⟨5168, target77⟩, ⟨5193, target78⟩, ⟨5194, target79⟩, ⟨5209, target80⟩, ⟨5210, target81⟩, ⟨5235, target82⟩, ⟨5236, target83⟩, ⟨5249, target84⟩, ⟨5252, target85⟩, ⟨5258, target86⟩, ⟨5259, target87⟩, ⟨5272, target88⟩, ⟨5273, target89⟩, ⟨5279, target90⟩, ⟨5280, target91⟩, ⟨5293, target92⟩, ⟨5294, target93⟩, ⟨5320, target94⟩, ⟨5326, target95⟩, ⟨5351, target96⟩, ⟨5454, target97⟩, ⟨5455, target98⟩, ⟨5476, target99⟩, ⟨5477, target100⟩, ⟨5490, target101⟩, ⟨5491, target102⟩, ⟨5512, target103⟩, ⟨5513, target104⟩, ⟨5529, target105⟩, ⟨5530, target106⟩, ⟨5544, target107⟩, ⟨5545, target108⟩, ⟨5558, target109⟩, ⟨5559, target110⟩, ⟨5572, target111⟩, ⟨5573, target112⟩, ⟨5647, target113⟩, ⟨5648, target114⟩, ⟨5655, target115⟩, ⟨5656, target116⟩, ⟨5662, target117⟩, ⟨5663, target118⟩, ⟨5669, target119⟩, ⟨5670, target120⟩, ⟨5674, target121⟩, ⟨5680, target122⟩, ⟨5758, target123⟩, ⟨5759, target124⟩, ⟨5766, target125⟩, ⟨5767, target126⟩, ⟨5773, target127⟩]
  indexMask := 7182326483117070402731456389547304369427742774688597257884703364364039827284169937628231780458881490064747671246611446598777340506575880578414912154653761551635340260765498902032704387508903981101675069403272348759919275964038248697380530501509849398152381566911420806669682695001595077910112522802240225320657288670615532536645453958870206601920294183443161407665806881582103236126872631012722771893752513229672095941141946380944974762535841604944804288434932624197647530768651359259142826836405724470812101423646128813532744549340158819326612018085401068353211534184251375573574555066941759774186334676314738547842112803879653188495269455347386150643385403484916442389731806595420386073727188962708803028715745881709627157436491182938181938514508869703797007530949105324454728976573217102284059783993703566096094256795580873077466900297621769960099616798624775682869785213944030250085577821852095032730772402040719587686951231175813983485445256282000857667146405615818319972540016497480654086598114164136117453472110529834330360554606626936735200979917493211382243479724016730621677931704240269993339431786910882558186691658934957863781692522968873497457349990850811816023860818274479328184719666483611992588027094342395482496819192595956577871581026487052802468411775544080081044596592908512109362047376055159015277022143254443279881358154250141063185489111357473471188782213063608850332074895378729583504175221448617159146682869807875673694841524405981051850688929046914300933110812949529191887963652423917387814270928295387754014405741077105888188033266068105202884016247356982608726214786470100585018595195719458444562147198363859753545194414391725646875118043073819283623220119490467719529810762259930336828843781056066393544327168
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

end FranklSmallCyclic.TransportBatches.G060.B000.Data
