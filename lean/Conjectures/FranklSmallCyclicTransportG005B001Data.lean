module

public import Conjectures.FranklSmallCyclicRowCoverage
public import Conjectures.FranklSmallCyclicCanonicalWords
public import Conjectures.FranklSmallCyclicOrbit7Block005Data

/-! 128 literal targets sharing one source proof block.
Original words and row indices are retained; weights may be transported.
-/
@[expose] public section

namespace FranklSmallCyclic.TransportBatches.G005.B001.Data

-- Period 7, original row 3651, representative 755.
def source0 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B005.Data.entryAt ⟨103, by decide +kernel⟩

def target0 : Weights.Entry :=
  { word := [4, 2, 8, 10, 0, 8, 9], weights := [1, 0, 0, 1] }

-- Period 7, original row 3745, representative 759.
def source1 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B005.Data.entryAt ⟨107, by decide +kernel⟩

def target1 : Weights.Entry :=
  { word := [4, 8, 0, 4, 8, 4, 12], weights := [1, 0, 0, 1] }

-- Period 7, original row 3788, representative 760.
def source2 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B005.Data.entryAt ⟨108, by decide +kernel⟩

def target2 : Weights.Entry :=
  { word := [4, 8, 0, 12, 8, 4, 12], weights := [1, 0, 1, 0] }

-- Period 7, original row 3996, representative 747.
def source3 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B005.Data.entryAt ⟨95, by decide +kernel⟩

def target3 : Weights.Entry :=
  { word := [4, 10, 0, 12, 2, 0, 9], weights := [1, 1, 1, 0] }

def points3 : List (ℕ × ℕ) := [(0, 0), (1, 2), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 4004, representative 745.
def source4 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B005.Data.entryAt ⟨93, by decide +kernel⟩

def target4 : Weights.Entry :=
  { word := [4, 10, 0, 12, 10, 0, 9], weights := [1, 1, 1, 0] }

def points4 : List (ℕ × ℕ) := [(0, 0), (1, 2), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 4108, representative 663.
def source5 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B005.Data.entryAt ⟨11, by decide +kernel⟩

def target5 : Weights.Entry :=
  { word := [8, 0, 0, 9, 4, 12, 12], weights := [1, 0, 1, 1] }

-- Period 7, original row 4112, representative 659.
def source6 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B005.Data.entryAt ⟨7, by decide +kernel⟩

def target6 : Weights.Entry :=
  { word := [8, 0, 0, 9, 12, 12, 12], weights := [1, 0, 1, 1] }

-- Period 7, original row 4122, representative 655.
def source7 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B005.Data.entryAt ⟨3, by decide +kernel⟩

def target7 : Weights.Entry :=
  { word := [8, 0, 0, 12, 0, 12, 12], weights := [1, 0, 1, 0] }

-- Period 7, original row 4302, representative 669.
def source8 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B005.Data.entryAt ⟨17, by decide +kernel⟩

def target8 : Weights.Entry :=
  { word := [8, 0, 4, 10, 0, 12, 10], weights := [1, 0, 1, 1] }

-- Period 7, original row 4303, representative 669.
def source9 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B005.Data.entryAt ⟨17, by decide +kernel⟩

def target9 : Weights.Entry :=
  { word := [8, 0, 4, 10, 0, 12, 12], weights := [1, 0, 1, 1] }

def points9 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 4311, representative 667.
def source10 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B005.Data.entryAt ⟨15, by decide +kernel⟩

def target10 : Weights.Entry :=
  { word := [8, 0, 4, 10, 8, 12, 12], weights := [1, 0, 1, 1] }

-- Period 7, original row 4367, representative 662.
def source11 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B005.Data.entryAt ⟨10, by decide +kernel⟩

def target11 : Weights.Entry :=
  { word := [8, 0, 8, 9, 4, 12, 12], weights := [1, 0, 1, 1] }

-- Period 7, original row 4371, representative 658.
def source12 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B005.Data.entryAt ⟨6, by decide +kernel⟩

def target12 : Weights.Entry :=
  { word := [8, 0, 8, 9, 12, 12, 12], weights := [1, 0, 1, 1] }

-- Period 7, original row 4478, representative 668.
def source13 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B005.Data.entryAt ⟨16, by decide +kernel⟩

def target13 : Weights.Entry :=
  { word := [8, 0, 12, 10, 0, 12, 10], weights := [1, 0, 1, 1] }

-- Period 7, original row 4479, representative 668.
def source14 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B005.Data.entryAt ⟨16, by decide +kernel⟩

def target14 : Weights.Entry :=
  { word := [8, 0, 12, 10, 0, 12, 12], weights := [1, 0, 1, 1] }

def points14 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 4487, representative 666.
def source15 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B005.Data.entryAt ⟨14, by decide +kernel⟩

def target15 : Weights.Entry :=
  { word := [8, 0, 12, 10, 8, 12, 12], weights := [1, 0, 1, 1] }

-- Period 7, original row 4507, representative 764.
def source16 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B005.Data.entryAt ⟨112, by decide +kernel⟩

def target16 : Weights.Entry :=
  { word := [8, 1, 0, 12, 0, 4, 2], weights := [0, 0, 1, 1] }

def points16 : List (ℕ × ℕ) := [(0, 2), (1, 0), (2, 1), (3, 5), (4, 4), (5, 6), (6, 3)]

-- Period 7, original row 4557, representative 747.
def source17 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B005.Data.entryAt ⟨95, by decide +kernel⟩

def target17 : Weights.Entry :=
  { word := [8, 1, 4, 10, 0, 12, 2], weights := [0, 1, 1, 1] }

def points17 : List (ℕ × ℕ) := [(0, 2), (1, 0), (2, 1), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 4650, representative 745.
def source18 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B005.Data.entryAt ⟨93, by decide +kernel⟩

def target18 : Weights.Entry :=
  { word := [8, 1, 12, 10, 0, 12, 2], weights := [0, 1, 1, 1] }

def points18 : List (ℕ × ℕ) := [(0, 2), (1, 0), (2, 1), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 4691, representative 753.
def source19 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B005.Data.entryAt ⟨101, by decide +kernel⟩

def target19 : Weights.Entry :=
  { word := [8, 2, 0, 8, 1, 4, 10], weights := [0, 2, 1, 1] }

-- Period 7, original row 4827, representative 768.
def source20 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B005.Data.entryAt ⟨116, by decide +kernel⟩

def target20 : Weights.Entry :=
  { word := [8, 2, 2, 10, 8, 4, 10], weights := [1, 1, 1, 1] }

-- Period 7, original row 4982, representative 767.
def source21 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B005.Data.entryAt ⟨115, by decide +kernel⟩

def target21 : Weights.Entry :=
  { word := [8, 2, 10, 10, 8, 4, 10], weights := [1, 1, 1, 1] }

-- Period 7, original row 5305, representative 769.
def source22 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B005.Data.entryAt ⟨117, by decide +kernel⟩

def target22 : Weights.Entry :=
  { word := [8, 6, 8, 12, 8, 4, 10], weights := [1, 1, 1, 1] }

-- Period 7, original row 5340, representative 653.
def source23 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B005.Data.entryAt ⟨1, by decide +kernel⟩

def target23 : Weights.Entry :=
  { word := [8, 8, 0, 4, 0, 12, 12], weights := [1, 0, 1, 2] }

-- Period 7, original row 5388, representative 661.
def source24 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B005.Data.entryAt ⟨9, by decide +kernel⟩

def target24 : Weights.Entry :=
  { word := [8, 8, 0, 9, 4, 12, 12], weights := [1, 1, 1, 1] }

-- Period 7, original row 5392, representative 657.
def source25 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B005.Data.entryAt ⟨5, by decide +kernel⟩

def target25 : Weights.Entry :=
  { word := [8, 8, 0, 9, 12, 12, 12], weights := [1, 1, 1, 1] }

-- Period 7, original row 5404, representative 654.
def source26 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B005.Data.entryAt ⟨2, by decide +kernel⟩

def target26 : Weights.Entry :=
  { word := [8, 8, 0, 12, 0, 12, 12], weights := [1, 0, 1, 0] }

-- Period 7, original row 5429, representative 652.
def source27 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B005.Data.entryAt ⟨0, by decide +kernel⟩

def target27 : Weights.Entry :=
  { word := [8, 8, 0, 12, 8, 12, 12], weights := [1, 0, 1, 0] }

-- Period 7, original row 5634, representative 665.
def source28 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B005.Data.entryAt ⟨13, by decide +kernel⟩

def target28 : Weights.Entry :=
  { word := [8, 8, 4, 10, 8, 12, 12], weights := [1, 1, 1, 1] }

-- Period 7, original row 5716, representative 660.
def source29 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B005.Data.entryAt ⟨8, by decide +kernel⟩

def target29 : Weights.Entry :=
  { word := [8, 8, 8, 9, 4, 12, 12], weights := [1, 1, 1, 1] }

-- Period 7, original row 5720, representative 656.
def source30 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B005.Data.entryAt ⟨4, by decide +kernel⟩

def target30 : Weights.Entry :=
  { word := [8, 8, 8, 9, 12, 12, 12], weights := [1, 1, 1, 1] }

-- Period 7, original row 5841, representative 664.
def source31 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B005.Data.entryAt ⟨12, by decide +kernel⟩

def target31 : Weights.Entry :=
  { word := [8, 8, 12, 10, 8, 12, 12], weights := [1, 1, 1, 1] }

-- Period 7, original row 5890, representative 754.
def source32 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B005.Data.entryAt ⟨102, by decide +kernel⟩

def target32 : Weights.Entry :=
  { word := [8, 9, 0, 4, 8, 4, 2], weights := [1, 0, 1, 0] }

def points32 : List (ℕ × ℕ) := [(0, 1), (1, 2), (2, 0), (3, 5), (4, 6), (5, 4), (6, 3)]

-- Period 7, original row 5924, representative 756.
def source33 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B005.Data.entryAt ⟨104, by decide +kernel⟩

def target33 : Weights.Entry :=
  { word := [8, 9, 0, 12, 0, 4, 2], weights := [1, 0, 1, 0] }

def points33 : List (ℕ × ℕ) := [(0, 1), (1, 2), (2, 0), (3, 5), (4, 6), (5, 4), (6, 3)]

-- Period 7, original row 5949, representative 755.
def source34 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B005.Data.entryAt ⟨103, by decide +kernel⟩

def target34 : Weights.Entry :=
  { word := [8, 9, 0, 12, 8, 4, 2], weights := [1, 0, 1, 0] }

def points34 : List (ℕ × ℕ) := [(0, 1), (1, 2), (2, 0), (3, 5), (4, 6), (5, 4), (6, 3)]

-- Period 7, original row 6085, representative 752.
def source35 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B005.Data.entryAt ⟨100, by decide +kernel⟩

def target35 : Weights.Entry :=
  { word := [8, 10, 0, 8, 1, 4, 10], weights := [0, 2, 1, 1] }

-- Period 7, original row 6190, representative 766.
def source36 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B005.Data.entryAt ⟨114, by decide +kernel⟩

def target36 : Weights.Entry :=
  { word := [8, 10, 2, 10, 8, 4, 10], weights := [1, 1, 1, 1] }

-- Period 7, original row 6312, representative 765.
def source37 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B005.Data.entryAt ⟨113, by decide +kernel⟩

def target37 : Weights.Entry :=
  { word := [8, 10, 10, 10, 8, 4, 10], weights := [1, 1, 1, 1] }

-- Period 7, original row 6804, representative 669.
def source38 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B005.Data.entryAt ⟨17, by decide +kernel⟩

def target38 : Weights.Entry :=
  { word := [9, 0, 4, 10, 0, 12, 10], weights := [1, 0, 1, 1] }

def points38 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 6805, representative 669.
def source39 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B005.Data.entryAt ⟨17, by decide +kernel⟩

def target39 : Weights.Entry :=
  { word := [9, 0, 4, 10, 0, 12, 12], weights := [1, 0, 1, 1] }

def points39 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 6813, representative 667.
def source40 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B005.Data.entryAt ⟨15, by decide +kernel⟩

def target40 : Weights.Entry :=
  { word := [9, 0, 4, 10, 8, 12, 12], weights := [1, 0, 1, 1] }

def points40 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 6839, representative 662.
def source41 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B005.Data.entryAt ⟨10, by decide +kernel⟩

def target41 : Weights.Entry :=
  { word := [9, 0, 8, 9, 4, 12, 12], weights := [1, 0, 1, 1] }

def points41 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 6843, representative 658.
def source42 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B005.Data.entryAt ⟨6, by decide +kernel⟩

def target42 : Weights.Entry :=
  { word := [9, 0, 8, 9, 12, 12, 12], weights := [1, 0, 1, 1] }

def points42 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 6950, representative 668.
def source43 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B005.Data.entryAt ⟨16, by decide +kernel⟩

def target43 : Weights.Entry :=
  { word := [9, 0, 12, 10, 0, 12, 10], weights := [1, 0, 1, 1] }

def points43 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 6951, representative 668.
def source44 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B005.Data.entryAt ⟨16, by decide +kernel⟩

def target44 : Weights.Entry :=
  { word := [9, 0, 12, 10, 0, 12, 12], weights := [1, 0, 1, 1] }

def points44 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 6959, representative 666.
def source45 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B005.Data.entryAt ⟨14, by decide +kernel⟩

def target45 : Weights.Entry :=
  { word := [9, 0, 12, 10, 8, 12, 12], weights := [1, 0, 1, 1] }

def points45 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 7603, representative 731.
def source46 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B005.Data.entryAt ⟨79, by decide +kernel⟩

def target46 : Weights.Entry :=
  { word := [10, 2, 0, 9, 8, 1, 4], weights := [1, 1, 0, 1] }

def points46 : List (ℕ × ℕ) := [(0, 1), (1, 2), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 7607, representative 733.
def source47 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B005.Data.entryAt ⟨81, by decide +kernel⟩

def target47 : Weights.Entry :=
  { word := [10, 2, 0, 9, 8, 8, 4], weights := [1, 1, 0, 1] }

def points47 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 7610, representative 725.
def source48 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B005.Data.entryAt ⟨73, by decide +kernel⟩

def target48 : Weights.Entry :=
  { word := [10, 2, 0, 9, 8, 9, 4], weights := [1, 1, 0, 1] }

def points48 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 7615, representative 764.
def source49 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B005.Data.entryAt ⟨112, by decide +kernel⟩

def target49 : Weights.Entry :=
  { word := [10, 2, 0, 10, 0, 0, 2], weights := [0, 1, 0, 1] }

def points49 : List (ℕ × ℕ) := [(0, 0), (1, 2), (2, 1), (3, 4), (4, 5), (5, 6), (6, 3)]

-- Period 7, original row 7616, representative 719.
def source50 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B005.Data.entryAt ⟨67, by decide +kernel⟩

def target50 : Weights.Entry :=
  { word := [10, 2, 0, 10, 0, 0, 4], weights := [0, 1, 0, 1] }

def points50 : List (ℕ × ℕ) := [(0, 1), (1, 2), (2, 0), (3, 4), (4, 5), (5, 6), (6, 3)]

-- Period 7, original row 7623, representative 709.
def source51 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B005.Data.entryAt ⟨57, by decide +kernel⟩

def target51 : Weights.Entry :=
  { word := [10, 2, 0, 10, 0, 8, 4], weights := [0, 1, 0, 1] }

def points51 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 7627, representative 718.
def source52 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B005.Data.entryAt ⟨66, by decide +kernel⟩

def target52 : Weights.Entry :=
  { word := [10, 2, 0, 10, 8, 0, 4], weights := [0, 1, 0, 1] }

def points52 : List (ℕ × ℕ) := [(0, 1), (1, 2), (2, 0), (3, 4), (4, 5), (5, 6), (6, 3)]

-- Period 7, original row 7629, representative 708.
def source53 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B005.Data.entryAt ⟨56, by decide +kernel⟩

def target53 : Weights.Entry :=
  { word := [10, 2, 0, 10, 8, 8, 4], weights := [0, 1, 0, 1] }

def points53 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 7633, representative 731.
def source54 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B005.Data.entryAt ⟨79, by decide +kernel⟩

def target54 : Weights.Entry :=
  { word := [10, 2, 0, 12, 10, 0, 4], weights := [1, 1, 0, 1] }

def points54 : List (ℕ × ℕ) := [(0, 1), (1, 2), (2, 0), (3, 4), (4, 5), (5, 6), (6, 3)]

-- Period 7, original row 7644, representative 723.
def source55 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B005.Data.entryAt ⟨71, by decide +kernel⟩

def target55 : Weights.Entry :=
  { word := [10, 2, 2, 8, 1, 0, 4], weights := [1, 1, 0, 1] }

def points55 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 4), (4, 5), (5, 6), (6, 3)]

-- Period 7, original row 7658, representative 722.
def source56 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B005.Data.entryAt ⟨70, by decide +kernel⟩

def target56 : Weights.Entry :=
  { word := [10, 2, 2, 8, 9, 0, 4], weights := [1, 1, 0, 1] }

def points56 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 4), (4, 5), (5, 6), (6, 3)]

-- Period 7, original row 7674, representative 759.
def source57 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B005.Data.entryAt ⟨107, by decide +kernel⟩

def target57 : Weights.Entry :=
  { word := [10, 2, 8, 2, 0, 8, 2], weights := [1, 0, 0, 1] }

def points57 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 7675, representative 704.
def source58 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B005.Data.entryAt ⟨52, by decide +kernel⟩

def target58 : Weights.Entry :=
  { word := [10, 2, 8, 2, 0, 8, 4], weights := [1, 0, 0, 1] }

def points58 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 7684, representative 716.
def source59 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B005.Data.entryAt ⟨64, by decide +kernel⟩

def target59 : Weights.Entry :=
  { word := [10, 2, 8, 2, 8, 0, 4], weights := [1, 0, 0, 1] }

def points59 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 7688, representative 705.
def source60 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B005.Data.entryAt ⟨53, by decide +kernel⟩

def target60 : Weights.Entry :=
  { word := [10, 2, 8, 2, 8, 8, 4], weights := [1, 0, 0, 1] }

def points60 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 7706, representative 730.
def source61 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B005.Data.entryAt ⟨78, by decide +kernel⟩

def target61 : Weights.Entry :=
  { word := [10, 2, 8, 9, 8, 1, 4], weights := [1, 1, 0, 1] }

def points61 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 7710, representative 732.
def source62 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B005.Data.entryAt ⟨80, by decide +kernel⟩

def target62 : Weights.Entry :=
  { word := [10, 2, 8, 9, 8, 8, 4], weights := [1, 1, 0, 1] }

def points62 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 7713, representative 724.
def source63 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B005.Data.entryAt ⟨72, by decide +kernel⟩

def target63 : Weights.Entry :=
  { word := [10, 2, 8, 9, 8, 9, 4], weights := [1, 1, 0, 1] }

def points63 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 7724, representative 760.
def source64 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B005.Data.entryAt ⟨108, by decide +kernel⟩

def target64 : Weights.Entry :=
  { word := [10, 2, 8, 10, 0, 8, 2], weights := [0, 1, 0, 1] }

def points64 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 7725, representative 707.
def source65 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B005.Data.entryAt ⟨55, by decide +kernel⟩

def target65 : Weights.Entry :=
  { word := [10, 2, 8, 10, 0, 8, 4], weights := [0, 1, 0, 1] }

def points65 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 7735, representative 717.
def source66 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B005.Data.entryAt ⟨65, by decide +kernel⟩

def target66 : Weights.Entry :=
  { word := [10, 2, 8, 10, 8, 0, 4], weights := [0, 1, 0, 1] }

def points66 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 7741, representative 706.
def source67 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B005.Data.entryAt ⟨54, by decide +kernel⟩

def target67 : Weights.Entry :=
  { word := [10, 2, 8, 10, 8, 8, 4], weights := [0, 1, 0, 1] }

def points67 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 7749, representative 729.
def source68 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B005.Data.entryAt ⟨77, by decide +kernel⟩

def target68 : Weights.Entry :=
  { word := [10, 2, 8, 12, 2, 0, 4], weights := [1, 1, 0, 1] }

def points68 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 7765, representative 728.
def source69 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B005.Data.entryAt ⟨76, by decide +kernel⟩

def target69 : Weights.Entry :=
  { word := [10, 2, 8, 12, 10, 0, 4], weights := [1, 1, 0, 1] }

def points69 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 7771, representative 727.
def source70 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B005.Data.entryAt ⟨75, by decide +kernel⟩

def target70 : Weights.Entry :=
  { word := [10, 2, 8, 12, 10, 8, 4], weights := [2, 1, 1, 2] }

def points70 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 7784, representative 721.
def source71 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B005.Data.entryAt ⟨69, by decide +kernel⟩

def target71 : Weights.Entry :=
  { word := [10, 2, 10, 8, 1, 0, 4], weights := [1, 1, 0, 1] }

def points71 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 7798, representative 720.
def source72 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B005.Data.entryAt ⟨68, by decide +kernel⟩

def target72 : Weights.Entry :=
  { word := [10, 2, 10, 8, 9, 0, 4], weights := [1, 1, 0, 1] }

def points72 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8179, representative 700.
def source73 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B005.Data.entryAt ⟨48, by decide +kernel⟩

def target73 : Weights.Entry :=
  { word := [10, 10, 0, 1, 0, 8, 0], weights := [1, 1, 0, 0] }

def points73 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8181, representative 700.
def source74 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B005.Data.entryAt ⟨48, by decide +kernel⟩

def target74 : Weights.Entry :=
  { word := [10, 10, 0, 2, 0, 8, 0], weights := [1, 1, 0, 0] }

def points74 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 5), (4, 6), (5, 4), (6, 3)]

-- Period 7, original row 8183, representative 653.
def source75 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B005.Data.entryAt ⟨1, by decide +kernel⟩

def target75 : Weights.Entry :=
  { word := [10, 10, 0, 2, 0, 8, 8], weights := [2, 1, 0, 1] }

def points75 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8187, representative 701.
def source76 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B005.Data.entryAt ⟨49, by decide +kernel⟩

def target76 : Weights.Entry :=
  { word := [10, 10, 0, 9, 0, 8, 0], weights := [0, 1, 1, 0] }

def points76 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8204, representative 655.
def source77 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B005.Data.entryAt ⟨3, by decide +kernel⟩

def target77 : Weights.Entry :=
  { word := [10, 10, 0, 10, 0, 0, 8], weights := [0, 1, 0, 1] }

def points77 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8208, representative 701.
def source78 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B005.Data.entryAt ⟨49, by decide +kernel⟩

def target78 : Weights.Entry :=
  { word := [10, 10, 0, 10, 0, 8, 0], weights := [0, 1, 0, 1] }

def points78 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 5), (4, 6), (5, 4), (6, 3)]

-- Period 7, original row 8211, representative 654.
def source79 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B005.Data.entryAt ⟨2, by decide +kernel⟩

def target79 : Weights.Entry :=
  { word := [10, 10, 0, 10, 0, 8, 8], weights := [0, 1, 0, 1] }

def points79 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8221, representative 669.
def source80 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B005.Data.entryAt ⟨17, by decide +kernel⟩

def target80 : Weights.Entry :=
  { word := [10, 10, 0, 12, 2, 0, 8], weights := [1, 1, 0, 1] }

def points80 : List (ℕ × ℕ) := [(0, 1), (1, 2), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8229, representative 668.
def source81 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B005.Data.entryAt ⟨16, by decide +kernel⟩

def target81 : Weights.Entry :=
  { word := [10, 10, 0, 12, 10, 0, 8], weights := [1, 1, 0, 1] }

def points81 : List (ℕ × ℕ) := [(0, 1), (1, 2), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8237, representative 663.
def source82 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B005.Data.entryAt ⟨11, by decide +kernel⟩

def target82 : Weights.Entry :=
  { word := [10, 10, 2, 8, 1, 0, 8], weights := [1, 1, 0, 1] }

def points82 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8242, representative 661.
def source83 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B005.Data.entryAt ⟨9, by decide +kernel⟩

def target83 : Weights.Entry :=
  { word := [10, 10, 2, 8, 1, 8, 8], weights := [1, 1, 1, 1] }

def points83 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8244, representative 673.
def source84 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B005.Data.entryAt ⟨21, by decide +kernel⟩

def target84 : Weights.Entry :=
  { word := [10, 10, 2, 8, 2, 8, 0], weights := [1, 0, 1, 0] }

def points84 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8246, representative 675.
def source85 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B005.Data.entryAt ⟨23, by decide +kernel⟩

def target85 : Weights.Entry :=
  { word := [10, 10, 2, 8, 8, 8, 0], weights := [1, 0, 1, 0] }

def points85 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8251, representative 662.
def source86 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B005.Data.entryAt ⟨10, by decide +kernel⟩

def target86 : Weights.Entry :=
  { word := [10, 10, 2, 8, 9, 0, 8], weights := [1, 1, 0, 1] }

def points86 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8256, representative 660.
def source87 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B005.Data.entryAt ⟨8, by decide +kernel⟩

def target87 : Weights.Entry :=
  { word := [10, 10, 2, 8, 9, 8, 8], weights := [1, 1, 1, 1] }

def points87 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8258, representative 672.
def source88 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B005.Data.entryAt ⟨20, by decide +kernel⟩

def target88 : Weights.Entry :=
  { word := [10, 10, 2, 8, 10, 8, 0], weights := [1, 0, 1, 0] }

def points88 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8259, representative 680.
def source89 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B005.Data.entryAt ⟨28, by decide +kernel⟩

def target89 : Weights.Entry :=
  { word := [10, 10, 8, 1, 0, 8, 0], weights := [1, 1, 0, 0] }

def points89 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8261, representative 694.
def source90 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B005.Data.entryAt ⟨42, by decide +kernel⟩

def target90 : Weights.Entry :=
  { word := [10, 10, 8, 2, 0, 1, 0], weights := [1, 0, 0, 1] }

def points90 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8263, representative 686.
def source91 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B005.Data.entryAt ⟨34, by decide +kernel⟩

def target91 : Weights.Entry :=
  { word := [10, 10, 8, 2, 0, 2, 0], weights := [1, 0, 0, 1] }

def points91 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8265, representative 698.
def source92 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B005.Data.entryAt ⟨46, by decide +kernel⟩

def target92 : Weights.Entry :=
  { word := [10, 10, 8, 2, 0, 8, 0], weights := [1, 0, 0, 1] }

def points92 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8273, representative 695.
def source93 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B005.Data.entryAt ⟨43, by decide +kernel⟩

def target93 : Weights.Entry :=
  { word := [10, 10, 8, 2, 0, 9, 0], weights := [1, 0, 0, 1] }

def points93 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8275, representative 687.
def source94 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B005.Data.entryAt ⟨35, by decide +kernel⟩

def target94 : Weights.Entry :=
  { word := [10, 10, 8, 2, 0, 10, 0], weights := [1, 0, 0, 1] }

def points94 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8279, representative 691.
def source95 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B005.Data.entryAt ⟨39, by decide +kernel⟩

def target95 : Weights.Entry :=
  { word := [10, 10, 8, 2, 8, 2, 0], weights := [1, 0, 0, 1] }

def points95 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8283, representative 688.
def source96 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B005.Data.entryAt ⟨36, by decide +kernel⟩

def target96 : Weights.Entry :=
  { word := [10, 10, 8, 2, 8, 10, 0], weights := [1, 0, 0, 1] }

def points96 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8290, representative 702.
def source97 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B005.Data.entryAt ⟨50, by decide +kernel⟩

def target97 : Weights.Entry :=
  { word := [10, 10, 8, 8, 0, 8, 0], weights := [1, 0, 1, 0] }

def points97 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8296, representative 681.
def source98 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B005.Data.entryAt ⟨29, by decide +kernel⟩

def target98 : Weights.Entry :=
  { word := [10, 10, 8, 9, 0, 8, 0], weights := [0, 1, 1, 0] }

def points98 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8310, representative 697.
def source99 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B005.Data.entryAt ⟨45, by decide +kernel⟩

def target99 : Weights.Entry :=
  { word := [10, 10, 8, 10, 0, 1, 0], weights := [0, 1, 0, 1] }

def points99 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8312, representative 693.
def source100 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B005.Data.entryAt ⟨41, by decide +kernel⟩

def target100 : Weights.Entry :=
  { word := [10, 10, 8, 10, 0, 2, 0], weights := [0, 1, 0, 1] }

def points100 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8315, representative 699.
def source101 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B005.Data.entryAt ⟨47, by decide +kernel⟩

def target101 : Weights.Entry :=
  { word := [10, 10, 8, 10, 0, 8, 0], weights := [0, 1, 0, 1] }

def points101 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8319, representative 652.
def source102 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B005.Data.entryAt ⟨0, by decide +kernel⟩

def target102 : Weights.Entry :=
  { word := [10, 10, 8, 10, 0, 8, 8], weights := [0, 1, 0, 1] }

def points102 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8323, representative 696.
def source103 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B005.Data.entryAt ⟨44, by decide +kernel⟩

def target103 : Weights.Entry :=
  { word := [10, 10, 8, 10, 0, 9, 0], weights := [0, 1, 0, 1] }

def points103 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8325, representative 690.
def source104 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B005.Data.entryAt ⟨38, by decide +kernel⟩

def target104 : Weights.Entry :=
  { word := [10, 10, 8, 10, 0, 10, 0], weights := [0, 1, 0, 1] }

def points104 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8330, representative 692.
def source105 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B005.Data.entryAt ⟨40, by decide +kernel⟩

def target105 : Weights.Entry :=
  { word := [10, 10, 8, 10, 8, 2, 0], weights := [0, 1, 0, 1] }

def points105 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8336, representative 689.
def source106 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B005.Data.entryAt ⟨37, by decide +kernel⟩

def target106 : Weights.Entry :=
  { word := [10, 10, 8, 10, 8, 10, 0], weights := [0, 1, 0, 1] }

def points106 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8343, representative 667.
def source107 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B005.Data.entryAt ⟨15, by decide +kernel⟩

def target107 : Weights.Entry :=
  { word := [10, 10, 8, 12, 2, 0, 8], weights := [1, 1, 0, 1] }

def points107 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8349, representative 665.
def source108 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B005.Data.entryAt ⟨13, by decide +kernel⟩

def target108 : Weights.Entry :=
  { word := [10, 10, 8, 12, 2, 8, 8], weights := [1, 1, 1, 1] }

def points108 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8365, representative 666.
def source109 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B005.Data.entryAt ⟨14, by decide +kernel⟩

def target109 : Weights.Entry :=
  { word := [10, 10, 8, 12, 10, 0, 8], weights := [1, 1, 0, 1] }

def points109 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8371, representative 664.
def source110 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B005.Data.entryAt ⟨12, by decide +kernel⟩

def target110 : Weights.Entry :=
  { word := [10, 10, 8, 12, 10, 8, 8], weights := [1, 1, 1, 1] }

def points110 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8381, representative 659.
def source111 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B005.Data.entryAt ⟨7, by decide +kernel⟩

def target111 : Weights.Entry :=
  { word := [10, 10, 10, 8, 1, 0, 8], weights := [1, 1, 0, 1] }

def points111 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8386, representative 657.
def source112 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B005.Data.entryAt ⟨5, by decide +kernel⟩

def target112 : Weights.Entry :=
  { word := [10, 10, 10, 8, 1, 8, 8], weights := [1, 1, 1, 1] }

def points112 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8388, representative 671.
def source113 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B005.Data.entryAt ⟨19, by decide +kernel⟩

def target113 : Weights.Entry :=
  { word := [10, 10, 10, 8, 2, 8, 0], weights := [1, 0, 1, 0] }

def points113 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8390, representative 674.
def source114 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B005.Data.entryAt ⟨22, by decide +kernel⟩

def target114 : Weights.Entry :=
  { word := [10, 10, 10, 8, 8, 8, 0], weights := [1, 0, 1, 0] }

def points114 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8395, representative 658.
def source115 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B005.Data.entryAt ⟨6, by decide +kernel⟩

def target115 : Weights.Entry :=
  { word := [10, 10, 10, 8, 9, 0, 8], weights := [1, 1, 0, 1] }

def points115 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8400, representative 656.
def source116 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B005.Data.entryAt ⟨4, by decide +kernel⟩

def target116 : Weights.Entry :=
  { word := [10, 10, 10, 8, 9, 8, 8], weights := [1, 1, 1, 1] }

def points116 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8402, representative 670.
def source117 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B005.Data.entryAt ⟨18, by decide +kernel⟩

def target117 : Weights.Entry :=
  { word := [10, 10, 10, 8, 10, 8, 0], weights := [1, 0, 1, 0] }

def points117 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8411, representative 751.
def source118 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B005.Data.entryAt ⟨99, by decide +kernel⟩

def target118 : Weights.Entry :=
  { word := [12, 0, 0, 9, 4, 12, 4], weights := [1, 0, 1, 1] }

def points118 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8415, representative 750.
def source119 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B005.Data.entryAt ⟨98, by decide +kernel⟩

def target119 : Weights.Entry :=
  { word := [12, 0, 0, 9, 12, 12, 4], weights := [1, 0, 1, 1] }

def points119 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8420, representative 764.
def source120 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B005.Data.entryAt ⟨112, by decide +kernel⟩

def target120 : Weights.Entry :=
  { word := [12, 0, 0, 12, 0, 4, 4], weights := [0, 0, 1, 1] }

def points120 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 5), (4, 4), (5, 6), (6, 3)]

-- Period 7, original row 8424, representative 737.
def source121 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B005.Data.entryAt ⟨85, by decide +kernel⟩

def target121 : Weights.Entry :=
  { word := [12, 0, 0, 12, 0, 12, 4], weights := [0, 0, 1, 1] }

def points121 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8470, representative 747.
def source122 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B005.Data.entryAt ⟨95, by decide +kernel⟩

def target122 : Weights.Entry :=
  { word := [12, 0, 4, 10, 0, 12, 4], weights := [0, 1, 1, 1] }

def points122 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8480, representative 746.
def source123 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B005.Data.entryAt ⟨94, by decide +kernel⟩

def target123 : Weights.Entry :=
  { word := [12, 0, 4, 10, 8, 12, 4], weights := [0, 1, 1, 1] }

def points123 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8502, representative 749.
def source124 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B005.Data.entryAt ⟨97, by decide +kernel⟩

def target124 : Weights.Entry :=
  { word := [12, 0, 8, 9, 4, 12, 4], weights := [1, 0, 1, 1] }

def points124 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8506, representative 748.
def source125 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B005.Data.entryAt ⟨96, by decide +kernel⟩

def target125 : Weights.Entry :=
  { word := [12, 0, 8, 9, 12, 12, 4], weights := [1, 0, 1, 1] }

def points125 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8563, representative 745.
def source126 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B005.Data.entryAt ⟨93, by decide +kernel⟩

def target126 : Weights.Entry :=
  { word := [12, 0, 12, 10, 0, 12, 4], weights := [0, 1, 1, 1] }

def points126 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8573, representative 744.
def source127 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B005.Data.entryAt ⟨92, by decide +kernel⟩

def target127 : Weights.Entry :=
  { word := [12, 0, 12, 10, 8, 12, 4], weights := [0, 1, 1, 1] }

def points127 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

def period7Entries : List Weights.Entry := [target0, target1, target2, target3, target4, target5, target6, target7, target8, target9, target10, target11, target12, target13, target14, target15, target16, target17, target18, target19, target20, target21, target22, target23, target24, target25, target26, target27, target28, target29, target30, target31, target32, target33, target34, target35, target36, target37, target38, target39, target40, target41, target42, target43, target44, target45, target46, target47, target48, target49, target50, target51, target52, target53, target54, target55, target56, target57, target58, target59, target60, target61, target62, target63, target64, target65, target66, target67, target68, target69, target70, target71, target72, target73, target74, target75, target76, target77, target78, target79, target80, target81, target82, target83, target84, target85, target86, target87, target88, target89, target90, target91, target92, target93, target94, target95, target96, target97, target98, target99, target100, target101, target102, target103, target104, target105, target106, target107, target108, target109, target110, target111, target112, target113, target114, target115, target116, target117, target118, target119, target120, target121, target122, target123, target124, target125, target126, target127]

def period7Chunk : RowCoverage.Chunk where
  rows := [⟨3651, target0⟩, ⟨3745, target1⟩, ⟨3788, target2⟩, ⟨3996, target3⟩, ⟨4004, target4⟩, ⟨4108, target5⟩, ⟨4112, target6⟩, ⟨4122, target7⟩, ⟨4302, target8⟩, ⟨4303, target9⟩, ⟨4311, target10⟩, ⟨4367, target11⟩, ⟨4371, target12⟩, ⟨4478, target13⟩, ⟨4479, target14⟩, ⟨4487, target15⟩, ⟨4507, target16⟩, ⟨4557, target17⟩, ⟨4650, target18⟩, ⟨4691, target19⟩, ⟨4827, target20⟩, ⟨4982, target21⟩, ⟨5305, target22⟩, ⟨5340, target23⟩, ⟨5388, target24⟩, ⟨5392, target25⟩, ⟨5404, target26⟩, ⟨5429, target27⟩, ⟨5634, target28⟩, ⟨5716, target29⟩, ⟨5720, target30⟩, ⟨5841, target31⟩, ⟨5890, target32⟩, ⟨5924, target33⟩, ⟨5949, target34⟩, ⟨6085, target35⟩, ⟨6190, target36⟩, ⟨6312, target37⟩, ⟨6804, target38⟩, ⟨6805, target39⟩, ⟨6813, target40⟩, ⟨6839, target41⟩, ⟨6843, target42⟩, ⟨6950, target43⟩, ⟨6951, target44⟩, ⟨6959, target45⟩, ⟨7603, target46⟩, ⟨7607, target47⟩, ⟨7610, target48⟩, ⟨7615, target49⟩, ⟨7616, target50⟩, ⟨7623, target51⟩, ⟨7627, target52⟩, ⟨7629, target53⟩, ⟨7633, target54⟩, ⟨7644, target55⟩, ⟨7658, target56⟩, ⟨7674, target57⟩, ⟨7675, target58⟩, ⟨7684, target59⟩, ⟨7688, target60⟩, ⟨7706, target61⟩, ⟨7710, target62⟩, ⟨7713, target63⟩, ⟨7724, target64⟩, ⟨7725, target65⟩, ⟨7735, target66⟩, ⟨7741, target67⟩, ⟨7749, target68⟩, ⟨7765, target69⟩, ⟨7771, target70⟩, ⟨7784, target71⟩, ⟨7798, target72⟩, ⟨8179, target73⟩, ⟨8181, target74⟩, ⟨8183, target75⟩, ⟨8187, target76⟩, ⟨8204, target77⟩, ⟨8208, target78⟩, ⟨8211, target79⟩, ⟨8221, target80⟩, ⟨8229, target81⟩, ⟨8237, target82⟩, ⟨8242, target83⟩, ⟨8244, target84⟩, ⟨8246, target85⟩, ⟨8251, target86⟩, ⟨8256, target87⟩, ⟨8258, target88⟩, ⟨8259, target89⟩, ⟨8261, target90⟩, ⟨8263, target91⟩, ⟨8265, target92⟩, ⟨8273, target93⟩, ⟨8275, target94⟩, ⟨8279, target95⟩, ⟨8283, target96⟩, ⟨8290, target97⟩, ⟨8296, target98⟩, ⟨8310, target99⟩, ⟨8312, target100⟩, ⟨8315, target101⟩, ⟨8319, target102⟩, ⟨8323, target103⟩, ⟨8325, target104⟩, ⟨8330, target105⟩, ⟨8336, target106⟩, ⟨8343, target107⟩, ⟨8349, target108⟩, ⟨8365, target109⟩, ⟨8371, target110⟩, ⟨8381, target111⟩, ⟨8386, target112⟩, ⟨8388, target113⟩, ⟨8390, target114⟩, ⟨8395, target115⟩, ⟨8400, target116⟩, ⟨8402, target117⟩, ⟨8411, target118⟩, ⟨8415, target119⟩, ⟨8420, target120⟩, ⟨8424, target121⟩, ⟨8470, target122⟩, ⟨8480, target123⟩, ⟨8502, target124⟩, ⟨8506, target125⟩, ⟨8563, target126⟩, ⟨8573, target127⟩]
  indexMask := 5377454396770202761431985911395178324563311010778183269675060138393185235344363277032714855556595140608482805997750211255766038165075628620055525655702352975650178208480223913031360106655844777956069810344257033252644112501343714070573046249261553208948713974256889740806724595957063612578251645992352417480796282575521587612747737381883735446651537337312591681399422990589397437754408029994548995152227143275873333628374905374735803277881324156829008019422303267504664766656236535707708319274553950867723103564253403484309175393343232832379527024611614195485786296250150753013317213505523535274009394453289996845610176296541396824658212030150720926896030207071178720606540742691597800687675353092906128360761486102271404884985901650845414465034587994570786826960917934627279429141647783184079989026269373454072973891858049877898833286100690035951556088941059177176526932778146840581735983182006040943157494729063107580558708915728461078895055386346575111708132606089043009052094996889421483355496797008070333677685638397659204232848987089774311824049121562426201277246441698600560990567508255557685597055813082213213097267079021655980841420334330075109769470978677136791669171727966867879984645994278246784209853612184064434282518103573889787063445661852708493132432746199297629819236739529831511409785167096888948855751098453299702978049524820444971059991944302108654422381525009655956439206228385795157805979244510317770477075011469162459482368285566788921847481805607594352944366111174388641875611502758099540621578580669317450454259336014227140238102724695798076814702040446105552665453297385659162537517398918635933480831616439360232605780017263020816555375889762841366447177031218724759717133951396628694543683087142911465342957836164342566268844799927346608174699099860571934391970345434600555648241526877959776766249470940952945003254079263171888195508710772272957136171545823326509390903878934888311714433434767102179245742247597687030548988550438077387932262522676681392267937618076350834030856566566618924667288619313874631859276535627285580452305726152392719572833818278995614116294647559486995898930153002806950026142237245157695007752440482799796976332726888574140878537996025210375882617777149631223325052589238234654910835328993406699478212565075933116521600423551486419700652594786821775731499769257828294383279191421210113172004710137977527063985507127818526914387728272221372585865137054134415826629856563715639783427537664657723767587871026333466471759309601259147254916787440566444964193830807303644173951377692576041069616850305571542393940207493598154850304
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

end FranklSmallCyclic.TransportBatches.G005.B001.Data
