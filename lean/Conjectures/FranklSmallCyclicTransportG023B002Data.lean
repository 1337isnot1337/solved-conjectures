module

public import Conjectures.FranklSmallCyclicRowCoverage
public import Conjectures.FranklSmallCyclicCanonicalWords
public import Conjectures.FranklSmallCyclicOrbit7Block023Data

/-! 128 literal targets sharing one source proof block.
Original words and row indices are retained; weights may be transported.
-/
@[expose] public section

namespace FranklSmallCyclic.TransportBatches.G023.B002.Data

-- Period 7, original row 2228, representative 3007.
def source0 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨49, by decide +kernel⟩

def target0 : Weights.Entry :=
  { word := [1, 12, 2, 8, 2, 0, 1], weights := [0, 1, 1, 0] }

def points0 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 2229, representative 3036.
def source1 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨76, by decide +kernel⟩

def target1 : Weights.Entry :=
  { word := [1, 12, 2, 8, 2, 0, 2], weights := [0, 1, 1, 0] }

def points1 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 2242, representative 3004.
def source2 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨46, by decide +kernel⟩

def target2 : Weights.Entry :=
  { word := [1, 12, 2, 8, 10, 0, 1], weights := [0, 1, 1, 0] }

def points2 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 2243, representative 3015.
def source3 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨56, by decide +kernel⟩

def target3 : Weights.Entry :=
  { word := [1, 12, 2, 8, 10, 0, 2], weights := [0, 1, 1, 0] }

def points3 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 2251, representative 3046.
def source4 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨86, by decide +kernel⟩

def target4 : Weights.Entry :=
  { word := [1, 12, 4, 4, 0, 0, 2], weights := [1, 0, 0, 1] }

def points4 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6)]

-- Period 7, original row 2258, representative 2978.
def source5 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨20, by decide +kernel⟩

def target5 : Weights.Entry :=
  { word := [1, 12, 4, 4, 0, 8, 2], weights := [1, 0, 0, 1] }

def points5 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6)]

-- Period 7, original row 2259, representative 2974.
def source6 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨16, by decide +kernel⟩

def target6 : Weights.Entry :=
  { word := [1, 12, 4, 4, 0, 8, 4], weights := [1, 0, 0, 1] }

def points6 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6)]

-- Period 7, original row 2264, representative 3010.
def source7 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨52, by decide +kernel⟩

def target7 : Weights.Entry :=
  { word := [1, 12, 4, 4, 8, 0, 1], weights := [0, 0, 1, 1] }

def points7 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 2265, representative 3030.
def source8 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨70, by decide +kernel⟩

def target8 : Weights.Entry :=
  { word := [1, 12, 4, 4, 8, 0, 2], weights := [1, 0, 1, 0] }

def points8 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 2266, representative 2995.
def source9 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨37, by decide +kernel⟩

def target9 : Weights.Entry :=
  { word := [1, 12, 4, 4, 8, 0, 4], weights := [1, 0, 0, 1] }

def points9 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 2278, representative 3009.
def source10 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨51, by decide +kernel⟩

def target10 : Weights.Entry :=
  { word := [1, 12, 8, 4, 2, 0, 1], weights := [0, 0, 1, 0] }

def points10 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 2279, representative 3050.
def source11 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨90, by decide +kernel⟩

def target11 : Weights.Entry :=
  { word := [1, 12, 8, 4, 2, 0, 2], weights := [0, 0, 1, 0] }

def points11 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 2280, representative 3001.
def source12 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨43, by decide +kernel⟩

def target12 : Weights.Entry :=
  { word := [1, 12, 8, 4, 2, 0, 4], weights := [1, 0, 0, 1] }

def points12 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 2286, representative 2990.
def source13 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨32, by decide +kernel⟩

def target13 : Weights.Entry :=
  { word := [1, 12, 8, 4, 2, 8, 4], weights := [1, 0, 0, 1] }

def points13 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 2290, representative 3003.
def source14 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨45, by decide +kernel⟩

def target14 : Weights.Entry :=
  { word := [1, 12, 8, 4, 4, 4, 0], weights := [0, 0, 1, 1] }

def points14 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 2304, representative 3006.
def source15 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨48, by decide +kernel⟩

def target15 : Weights.Entry :=
  { word := [1, 12, 8, 4, 10, 0, 1], weights := [0, 0, 1, 0] }

def points15 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 2305, representative 3022.
def source16 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨63, by decide +kernel⟩

def target16 : Weights.Entry :=
  { word := [1, 12, 8, 4, 10, 0, 2], weights := [0, 0, 1, 0] }

def points16 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 2306, representative 2999.
def source17 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨41, by decide +kernel⟩

def target17 : Weights.Entry :=
  { word := [1, 12, 8, 4, 10, 0, 4], weights := [1, 0, 0, 1] }

def points17 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 2312, representative 2983.
def source18 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨25, by decide +kernel⟩

def target18 : Weights.Entry :=
  { word := [1, 12, 8, 4, 10, 8, 4], weights := [1, 0, 0, 1] }

def points18 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 2316, representative 3002.
def source19 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨44, by decide +kernel⟩

def target19 : Weights.Entry :=
  { word := [1, 12, 8, 4, 12, 4, 0], weights := [0, 0, 1, 1] }

def points19 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 2335, representative 2979.
def source20 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨21, by decide +kernel⟩

def target20 : Weights.Entry :=
  { word := [1, 12, 10, 0, 1, 8, 2], weights := [0, 1, 0, 1] }

def points20 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 2336, representative 2975.
def source21 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨17, by decide +kernel⟩

def target21 : Weights.Entry :=
  { word := [1, 12, 10, 0, 1, 8, 4], weights := [0, 1, 0, 1] }

def points21 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 2342, representative 2967.
def source22 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨9, by decide +kernel⟩

def target22 : Weights.Entry :=
  { word := [1, 12, 10, 0, 9, 8, 2], weights := [0, 1, 0, 1] }

def points22 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 2343, representative 2971.
def source23 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨13, by decide +kernel⟩

def target23 : Weights.Entry :=
  { word := [1, 12, 10, 0, 9, 8, 4], weights := [0, 1, 0, 1] }

def points23 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 2361, representative 2979.
def source24 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨21, by decide +kernel⟩

def target24 : Weights.Entry :=
  { word := [1, 12, 12, 4, 0, 8, 2], weights := [1, 0, 0, 1] }

def points24 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6)]

-- Period 7, original row 2362, representative 2975.
def source25 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨17, by decide +kernel⟩

def target25 : Weights.Entry :=
  { word := [1, 12, 12, 4, 0, 8, 4], weights := [1, 0, 0, 1] }

def points25 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6)]

-- Period 7, original row 2367, representative 3011.
def source26 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨53, by decide +kernel⟩

def target26 : Weights.Entry :=
  { word := [1, 12, 12, 4, 8, 0, 1], weights := [0, 0, 1, 1] }

def points26 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 2368, representative 3031.
def source27 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨71, by decide +kernel⟩

def target27 : Weights.Entry :=
  { word := [1, 12, 12, 4, 8, 0, 2], weights := [1, 0, 1, 0] }

def points27 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 2369, representative 2996.
def source28 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨38, by decide +kernel⟩

def target28 : Weights.Entry :=
  { word := [1, 12, 12, 4, 8, 0, 4], weights := [1, 0, 0, 1] }

def points28 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 2409, representative 3063.
def source29 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨102, by decide +kernel⟩

def target29 : Weights.Entry :=
  { word := [2, 0, 4, 2, 0, 8, 0], weights := [1, 0, 0, 1] }

def points29 : List (ℕ × ℕ) := [(0, 2), (1, 0), (2, 1), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 2417, representative 3000.
def source30 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨42, by decide +kernel⟩

def target30 : Weights.Entry :=
  { word := [2, 0, 4, 2, 0, 9, 0], weights := [1, 0, 0, 1] }

def points30 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 2419, representative 3000.
def source31 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨42, by decide +kernel⟩

def target31 : Weights.Entry :=
  { word := [2, 0, 4, 2, 0, 10, 0], weights := [1, 0, 0, 1] }

def points31 : List (ℕ × ℕ) := [(0, 2), (1, 0), (2, 1), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 2421, representative 3059.
def source32 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨98, by decide +kernel⟩

def target32 : Weights.Entry :=
  { word := [2, 0, 4, 2, 8, 2, 0], weights := [0, 0, 0, 1] }

def points32 : List (ℕ × ℕ) := [(0, 1), (1, 2), (2, 0), (3, 4), (4, 5), (5, 6), (6, 3)]

-- Period 7, original row 2425, representative 3001.
def source33 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨43, by decide +kernel⟩

def target33 : Weights.Entry :=
  { word := [2, 0, 4, 2, 8, 10, 0], weights := [1, 0, 0, 1] }

def points33 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 2429, representative 3042.
def source34 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨82, by decide +kernel⟩

def target34 : Weights.Entry :=
  { word := [2, 0, 4, 4, 4, 8, 0], weights := [1, 0, 0, 1] }

def points34 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 2456, representative 3045.
def source35 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨85, by decide +kernel⟩

def target35 : Weights.Entry :=
  { word := [2, 0, 4, 12, 4, 8, 0], weights := [0, 0, 1, 1] }

def points35 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 2458, representative 3040.
def source36 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨80, by decide +kernel⟩

def target36 : Weights.Entry :=
  { word := [2, 0, 8, 1, 4, 2, 0], weights := [1, 1, 0, 0] }

def points36 : List (ℕ × ℕ) := [(0, 2), (1, 0), (2, 1), (3, 6), (4, 4), (5, 5), (6, 3)]

-- Period 7, original row 2459, representative 2997.
def source37 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨39, by decide +kernel⟩

def target37 : Weights.Entry :=
  { word := [2, 0, 8, 1, 4, 10, 0], weights := [1, 0, 1, 0] }

def points37 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 2460, representative 3034.
def source38 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨74, by decide +kernel⟩

def target38 : Weights.Entry :=
  { word := [2, 0, 8, 2, 2, 2, 0], weights := [1, 0, 0, 1] }

def points38 : List (ℕ × ℕ) := [(0, 2), (1, 0), (2, 1), (3, 6), (4, 3), (5, 5), (6, 4)]

-- Period 7, original row 2462, representative 2995.
def source39 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨37, by decide +kernel⟩

def target39 : Weights.Entry :=
  { word := [2, 0, 8, 2, 2, 10, 0], weights := [1, 0, 0, 1] }

def points39 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 2464, representative 3035.
def source40 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨75, by decide +kernel⟩

def target40 : Weights.Entry :=
  { word := [2, 0, 8, 2, 10, 2, 0], weights := [1, 0, 0, 1] }

def points40 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 2466, representative 2996.
def source41 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨38, by decide +kernel⟩

def target41 : Weights.Entry :=
  { word := [2, 0, 8, 2, 10, 10, 0], weights := [1, 0, 0, 1] }

def points41 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 2522, representative 3053.
def source42 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨93, by decide +kernel⟩

def target42 : Weights.Entry :=
  { word := [2, 0, 12, 2, 0, 1, 0], weights := [1, 0, 0, 1] }

def points42 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 2524, representative 3053.
def source43 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨93, by decide +kernel⟩

def target43 : Weights.Entry :=
  { word := [2, 0, 12, 2, 0, 2, 0], weights := [1, 0, 0, 1] }

def points43 : List (ℕ × ℕ) := [(0, 2), (1, 0), (2, 1), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 2526, representative 3062.
def source44 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨101, by decide +kernel⟩

def target44 : Weights.Entry :=
  { word := [2, 0, 12, 2, 0, 8, 0], weights := [1, 0, 0, 1] }

def points44 : List (ℕ × ℕ) := [(0, 2), (1, 0), (2, 1), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 2534, representative 2998.
def source45 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨40, by decide +kernel⟩

def target45 : Weights.Entry :=
  { word := [2, 0, 12, 2, 0, 9, 0], weights := [1, 0, 0, 1] }

def points45 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 2536, representative 2998.
def source46 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨40, by decide +kernel⟩

def target46 : Weights.Entry :=
  { word := [2, 0, 12, 2, 0, 10, 0], weights := [1, 0, 0, 1] }

def points46 : List (ℕ × ℕ) := [(0, 2), (1, 0), (2, 1), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 2538, representative 3054.
def source47 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨94, by decide +kernel⟩

def target47 : Weights.Entry :=
  { word := [2, 0, 12, 2, 8, 2, 0], weights := [1, 0, 0, 1] }

def points47 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 2542, representative 2999.
def source48 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨41, by decide +kernel⟩

def target48 : Weights.Entry :=
  { word := [2, 0, 12, 2, 8, 10, 0], weights := [1, 0, 0, 1] }

def points48 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 2544, representative 3053.
def source49 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨93, by decide +kernel⟩

def target49 : Weights.Entry :=
  { word := [2, 0, 12, 4, 4, 0, 0], weights := [1, 0, 0, 1] }

def points49 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 4), (5, 5), (6, 3)]

-- Period 7, original row 2546, representative 3043.
def source50 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨83, by decide +kernel⟩

def target50 : Weights.Entry :=
  { word := [2, 0, 12, 4, 4, 8, 0], weights := [1, 0, 0, 1] }

def points50 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 2578, representative 3044.
def source51 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨84, by decide +kernel⟩

def target51 : Weights.Entry :=
  { word := [2, 0, 12, 12, 4, 8, 0], weights := [0, 0, 1, 1] }

def points51 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 2793, representative 2973.
def source52 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨15, by decide +kernel⟩

def target52 : Weights.Entry :=
  { word := [2, 8, 0, 1, 4, 2, 0], weights := [1, 0, 1, 0] }

def points52 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 2794, representative 2974.
def source53 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨16, by decide +kernel⟩

def target53 : Weights.Entry :=
  { word := [2, 8, 0, 1, 4, 10, 0], weights := [1, 0, 1, 0] }

def points53 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 2795, representative 2976.
def source54 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨18, by decide +kernel⟩

def target54 : Weights.Entry :=
  { word := [2, 8, 0, 1, 12, 2, 0], weights := [1, 0, 1, 0] }

def points54 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 2796, representative 2975.
def source55 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨17, by decide +kernel⟩

def target55 : Weights.Entry :=
  { word := [2, 8, 0, 1, 12, 10, 0], weights := [1, 0, 1, 0] }

def points55 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 2797, representative 2973.
def source56 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨15, by decide +kernel⟩

def target56 : Weights.Entry :=
  { word := [2, 8, 0, 2, 2, 2, 0], weights := [1, 0, 0, 1] }

def points56 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 5), (4, 6), (5, 4), (6, 3)]

-- Period 7, original row 2799, representative 2974.
def source57 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨16, by decide +kernel⟩

def target57 : Weights.Entry :=
  { word := [2, 8, 0, 2, 2, 10, 0], weights := [1, 0, 0, 1] }

def points57 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 5), (4, 6), (5, 4), (6, 3)]

-- Period 7, original row 2801, representative 2976.
def source58 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨18, by decide +kernel⟩

def target58 : Weights.Entry :=
  { word := [2, 8, 0, 2, 10, 2, 0], weights := [1, 0, 0, 1] }

def points58 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 5), (4, 6), (5, 4), (6, 3)]

-- Period 7, original row 2803, representative 2975.
def source59 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨17, by decide +kernel⟩

def target59 : Weights.Entry :=
  { word := [2, 8, 0, 2, 10, 10, 0], weights := [1, 0, 0, 1] }

def points59 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 5), (4, 6), (5, 4), (6, 3)]

-- Period 7, original row 2902, representative 2992.
def source60 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨34, by decide +kernel⟩

def target60 : Weights.Entry :=
  { word := [2, 8, 4, 2, 0, 1, 0], weights := [1, 0, 0, 1] }

def points60 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 2904, representative 2988.
def source61 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨30, by decide +kernel⟩

def target61 : Weights.Entry :=
  { word := [2, 8, 4, 2, 0, 2, 0], weights := [1, 0, 0, 1] }

def points61 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 2906, representative 2994.
def source62 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨36, by decide +kernel⟩

def target62 : Weights.Entry :=
  { word := [2, 8, 4, 2, 0, 8, 0], weights := [1, 0, 0, 1] }

def points62 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 2914, representative 2993.
def source63 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨35, by decide +kernel⟩

def target63 : Weights.Entry :=
  { word := [2, 8, 4, 2, 0, 9, 0], weights := [1, 0, 0, 1] }

def points63 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 2916, representative 2989.
def source64 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨31, by decide +kernel⟩

def target64 : Weights.Entry :=
  { word := [2, 8, 4, 2, 0, 10, 0], weights := [1, 0, 0, 1] }

def points64 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 2918, representative 2991.
def source65 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨33, by decide +kernel⟩

def target65 : Weights.Entry :=
  { word := [2, 8, 4, 2, 8, 2, 0], weights := [1, 0, 0, 1] }

def points65 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 2922, representative 2990.
def source66 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨32, by decide +kernel⟩

def target66 : Weights.Entry :=
  { word := [2, 8, 4, 2, 8, 10, 0], weights := [1, 0, 0, 1] }

def points66 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 2924, representative 2963.
def source67 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨5, by decide +kernel⟩

def target67 : Weights.Entry :=
  { word := [2, 8, 4, 4, 4, 0, 0], weights := [1, 0, 0, 1] }

def points67 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 2926, representative 2959.
def source68 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨1, by decide +kernel⟩

def target68 : Weights.Entry :=
  { word := [2, 8, 4, 4, 4, 8, 0], weights := [1, 0, 0, 1] }

def points68 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 2928, representative 2964.
def source69 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨6, by decide +kernel⟩

def target69 : Weights.Entry :=
  { word := [2, 8, 4, 4, 12, 0, 0], weights := [1, 0, 0, 1] }

def points69 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 2930, representative 2960.
def source70 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨2, by decide +kernel⟩

def target70 : Weights.Entry :=
  { word := [2, 8, 4, 4, 12, 8, 0], weights := [1, 0, 0, 1] }

def points70 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 2950, representative 2962.
def source71 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨4, by decide +kernel⟩

def target71 : Weights.Entry :=
  { word := [2, 8, 4, 12, 4, 8, 0], weights := [1, 0, 0, 1] }

def points71 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 2953, representative 2961.
def source72 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨3, by decide +kernel⟩

def target72 : Weights.Entry :=
  { word := [2, 8, 4, 12, 12, 8, 0], weights := [1, 0, 0, 1] }

def points72 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 2957, representative 2969.
def source73 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨11, by decide +kernel⟩

def target73 : Weights.Entry :=
  { word := [2, 8, 8, 1, 4, 2, 0], weights := [1, 0, 1, 0] }

def points73 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 2958, representative 2970.
def source74 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨12, by decide +kernel⟩

def target74 : Weights.Entry :=
  { word := [2, 8, 8, 1, 4, 10, 0], weights := [1, 0, 1, 0] }

def points74 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 2959, representative 2972.
def source75 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨14, by decide +kernel⟩

def target75 : Weights.Entry :=
  { word := [2, 8, 8, 1, 12, 2, 0], weights := [1, 0, 1, 0] }

def points75 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 2960, representative 2971.
def source76 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨13, by decide +kernel⟩

def target76 : Weights.Entry :=
  { word := [2, 8, 8, 1, 12, 10, 0], weights := [1, 0, 1, 0] }

def points76 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 3110, representative 2985.
def source77 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨27, by decide +kernel⟩

def target77 : Weights.Entry :=
  { word := [2, 8, 12, 2, 0, 1, 0], weights := [1, 0, 0, 1] }

def points77 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 3112, representative 2981.
def source78 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨23, by decide +kernel⟩

def target78 : Weights.Entry :=
  { word := [2, 8, 12, 2, 0, 2, 0], weights := [1, 0, 0, 1] }

def points78 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 3114, representative 2987.
def source79 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨29, by decide +kernel⟩

def target79 : Weights.Entry :=
  { word := [2, 8, 12, 2, 0, 8, 0], weights := [1, 0, 0, 1] }

def points79 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 3122, representative 2986.
def source80 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨28, by decide +kernel⟩

def target80 : Weights.Entry :=
  { word := [2, 8, 12, 2, 0, 9, 0], weights := [1, 0, 0, 1] }

def points80 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 3124, representative 2982.
def source81 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨24, by decide +kernel⟩

def target81 : Weights.Entry :=
  { word := [2, 8, 12, 2, 0, 10, 0], weights := [1, 0, 0, 1] }

def points81 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 3126, representative 2984.
def source82 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨26, by decide +kernel⟩

def target82 : Weights.Entry :=
  { word := [2, 8, 12, 2, 8, 2, 0], weights := [1, 0, 0, 1] }

def points82 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 3130, representative 2983.
def source83 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨25, by decide +kernel⟩

def target83 : Weights.Entry :=
  { word := [2, 8, 12, 2, 8, 10, 0], weights := [1, 0, 0, 1] }

def points83 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 3136, representative 2958.
def source84 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨0, by decide +kernel⟩

def target84 : Weights.Entry :=
  { word := [2, 8, 12, 4, 12, 0, 0], weights := [1, 0, 0, 1] }

def points84 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 3392, representative 3046.
def source85 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨86, by decide +kernel⟩

def target85 : Weights.Entry :=
  { word := [4, 0, 0, 1, 4, 10, 0], weights := [1, 0, 1, 0] }

def points85 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 3395, representative 3046.
def source86 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨86, by decide +kernel⟩

def target86 : Weights.Entry :=
  { word := [4, 0, 0, 2, 2, 10, 0], weights := [1, 0, 0, 1] }

def points86 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 5), (4, 6), (5, 4), (6, 3)]

-- Period 7, original row 3419, representative 3061.
def source87 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨100, by decide +kernel⟩

def target87 : Weights.Entry :=
  { word := [4, 0, 4, 2, 0, 8, 0], weights := [0, 1, 0, 0] }

def points87 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 3427, representative 3008.
def source88 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨50, by decide +kernel⟩

def target88 : Weights.Entry :=
  { word := [4, 0, 4, 2, 0, 9, 0], weights := [0, 1, 0, 0] }

def points88 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 3429, representative 3049.
def source89 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨89, by decide +kernel⟩

def target89 : Weights.Entry :=
  { word := [4, 0, 4, 2, 0, 10, 0], weights := [0, 1, 0, 0] }

def points89 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 3431, representative 3059.
def source90 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨98, by decide +kernel⟩

def target90 : Weights.Entry :=
  { word := [4, 0, 4, 2, 8, 2, 0], weights := [0, 1, 0, 0] }

def points90 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 3435, representative 3050.
def source91 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨90, by decide +kernel⟩

def target91 : Weights.Entry :=
  { word := [4, 0, 4, 2, 8, 10, 0], weights := [0, 1, 0, 0] }

def points91 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 3439, representative 3038.
def source92 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨78, by decide +kernel⟩

def target92 : Weights.Entry :=
  { word := [4, 0, 4, 4, 4, 8, 0], weights := [0, 0, 1, 0] }

def points92 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 3441, representative 3037.
def source93 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨77, by decide +kernel⟩

def target93 : Weights.Entry :=
  { word := [4, 0, 4, 8, 4, 2, 0], weights := [0, 1, 1, 0] }

def points93 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 2), (3, 3), (4, 5), (5, 4), (6, 6)]

-- Period 7, original row 3443, representative 3036.
def source94 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨76, by decide +kernel⟩

def target94 : Weights.Entry :=
  { word := [4, 0, 4, 8, 4, 10, 0], weights := [0, 1, 1, 0] }

def points94 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 3471, representative 3039.
def source95 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨79, by decide +kernel⟩

def target95 : Weights.Entry :=
  { word := [4, 0, 4, 12, 4, 8, 0], weights := [0, 0, 1, 0] }

def points95 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 3473, representative 3058.
def source96 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨97, by decide +kernel⟩

def target96 : Weights.Entry :=
  { word := [4, 0, 8, 1, 4, 2, 0], weights := [1, 0, 1, 0] }

def points96 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 2), (3, 3), (4, 5), (5, 4), (6, 6)]

-- Period 7, original row 3474, representative 3047.
def source97 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨87, by decide +kernel⟩

def target97 : Weights.Entry :=
  { word := [4, 0, 8, 1, 4, 10, 0], weights := [1, 0, 1, 0] }

def points97 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 3475, representative 3032.
def source98 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨72, by decide +kernel⟩

def target98 : Weights.Entry :=
  { word := [4, 0, 8, 2, 2, 2, 0], weights := [0, 1, 0, 1] }

def points98 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 3477, representative 3030.
def source99 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨70, by decide +kernel⟩

def target99 : Weights.Entry :=
  { word := [4, 0, 8, 2, 2, 10, 0], weights := [0, 1, 0, 1] }

def points99 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 3479, representative 3033.
def source100 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨73, by decide +kernel⟩

def target100 : Weights.Entry :=
  { word := [4, 0, 8, 2, 10, 2, 0], weights := [0, 1, 0, 1] }

def points100 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 3481, representative 3031.
def source101 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨71, by decide +kernel⟩

def target101 : Weights.Entry :=
  { word := [4, 0, 8, 2, 10, 10, 0], weights := [0, 1, 0, 1] }

def points101 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 3508, representative 3029.
def source102 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨69, by decide +kernel⟩

def target102 : Weights.Entry :=
  { word := [4, 0, 12, 2, 0, 8, 0], weights := [0, 1, 0, 0] }

def points102 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 3516, representative 3005.
def source103 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨47, by decide +kernel⟩

def target103 : Weights.Entry :=
  { word := [4, 0, 12, 2, 0, 9, 0], weights := [0, 1, 0, 0] }

def points103 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 3518, representative 3021.
def source104 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨62, by decide +kernel⟩

def target104 : Weights.Entry :=
  { word := [4, 0, 12, 2, 0, 10, 0], weights := [0, 1, 0, 0] }

def points104 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 3520, representative 3027.
def source105 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨67, by decide +kernel⟩

def target105 : Weights.Entry :=
  { word := [4, 0, 12, 2, 8, 2, 0], weights := [0, 1, 0, 0] }

def points105 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 3524, representative 3022.
def source106 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨63, by decide +kernel⟩

def target106 : Weights.Entry :=
  { word := [4, 0, 12, 2, 8, 10, 0], weights := [0, 1, 0, 0] }

def points106 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 3528, representative 3017.
def source107 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨58, by decide +kernel⟩

def target107 : Weights.Entry :=
  { word := [4, 0, 12, 4, 4, 8, 0], weights := [0, 0, 1, 0] }

def points107 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 3530, representative 3016.
def source108 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨57, by decide +kernel⟩

def target108 : Weights.Entry :=
  { word := [4, 0, 12, 8, 4, 2, 0], weights := [0, 1, 1, 0] }

def points108 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 2), (3, 3), (4, 5), (5, 4), (6, 6)]

-- Period 7, original row 3532, representative 3015.
def source109 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨56, by decide +kernel⟩

def target109 : Weights.Entry :=
  { word := [4, 0, 12, 8, 4, 10, 0], weights := [0, 1, 1, 0] }

def points109 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 3564, representative 3018.
def source110 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨59, by decide +kernel⟩

def target110 : Weights.Entry :=
  { word := [4, 0, 12, 12, 4, 8, 0], weights := [0, 0, 1, 0] }

def points110 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 3711, representative 2977.
def source111 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨19, by decide +kernel⟩

def target111 : Weights.Entry :=
  { word := [4, 8, 0, 1, 4, 2, 0], weights := [1, 0, 1, 0] }

def points111 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 3712, representative 2978.
def source112 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨20, by decide +kernel⟩

def target112 : Weights.Entry :=
  { word := [4, 8, 0, 1, 4, 10, 0], weights := [1, 0, 1, 0] }

def points112 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 3713, representative 2980.
def source113 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨22, by decide +kernel⟩

def target113 : Weights.Entry :=
  { word := [4, 8, 0, 1, 12, 2, 0], weights := [1, 0, 1, 0] }

def points113 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 3714, representative 2979.
def source114 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨21, by decide +kernel⟩

def target114 : Weights.Entry :=
  { word := [4, 8, 0, 1, 12, 10, 0], weights := [1, 0, 1, 0] }

def points114 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 3715, representative 2977.
def source115 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨19, by decide +kernel⟩

def target115 : Weights.Entry :=
  { word := [4, 8, 0, 2, 2, 2, 0], weights := [1, 0, 0, 1] }

def points115 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 5), (4, 6), (5, 4), (6, 3)]

-- Period 7, original row 3717, representative 2978.
def source116 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨20, by decide +kernel⟩

def target116 : Weights.Entry :=
  { word := [4, 8, 0, 2, 2, 10, 0], weights := [1, 0, 0, 1] }

def points116 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 5), (4, 6), (5, 4), (6, 3)]

-- Period 7, original row 3719, representative 2980.
def source117 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨22, by decide +kernel⟩

def target117 : Weights.Entry :=
  { word := [4, 8, 0, 2, 10, 2, 0], weights := [1, 0, 0, 1] }

def points117 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 5), (4, 6), (5, 4), (6, 3)]

-- Period 7, original row 3721, representative 2979.
def source118 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨21, by decide +kernel⟩

def target118 : Weights.Entry :=
  { word := [4, 8, 0, 2, 10, 10, 0], weights := [1, 0, 0, 1] }

def points118 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 5), (4, 6), (5, 4), (6, 3)]

-- Period 7, original row 3869, representative 2965.
def source119 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨7, by decide +kernel⟩

def target119 : Weights.Entry :=
  { word := [4, 8, 8, 1, 4, 2, 0], weights := [1, 0, 1, 0] }

def points119 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 3870, representative 2966.
def source120 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨8, by decide +kernel⟩

def target120 : Weights.Entry :=
  { word := [4, 8, 8, 1, 4, 10, 0], weights := [1, 0, 1, 0] }

def points120 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 3871, representative 2968.
def source121 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨10, by decide +kernel⟩

def target121 : Weights.Entry :=
  { word := [4, 8, 8, 1, 12, 2, 0], weights := [1, 0, 1, 0] }

def points121 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 3872, representative 2967.
def source122 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨9, by decide +kernel⟩

def target122 : Weights.Entry :=
  { word := [4, 8, 8, 1, 12, 10, 0], weights := [1, 0, 1, 0] }

def points122 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 4286, representative 3074.
def source123 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨113, by decide +kernel⟩

def target123 : Weights.Entry :=
  { word := [8, 0, 4, 8, 4, 10, 8], weights := [0, 1, 1, 0] }

-- Period 7, original row 4458, representative 3073.
def source124 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨112, by decide +kernel⟩

def target124 : Weights.Entry :=
  { word := [8, 0, 12, 8, 4, 10, 8], weights := [0, 1, 1, 0] }

-- Period 7, original row 5322, representative 3071.
def source125 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨110, by decide +kernel⟩

def target125 : Weights.Entry :=
  { word := [8, 8, 0, 1, 4, 10, 8], weights := [1, 2, 1, 0] }

-- Period 7, original row 5328, representative 3069.
def source126 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨108, by decide +kernel⟩

def target126 : Weights.Entry :=
  { word := [8, 8, 0, 1, 12, 10, 8], weights := [1, 2, 1, 0] }

-- Period 7, original row 5332, representative 3075.
def source127 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B023.Data.entryAt ⟨114, by decide +kernel⟩

def target127 : Weights.Entry :=
  { word := [8, 8, 0, 2, 2, 10, 8], weights := [1, 0, 0, 1] }

def period7Entries : List Weights.Entry := [target0, target1, target2, target3, target4, target5, target6, target7, target8, target9, target10, target11, target12, target13, target14, target15, target16, target17, target18, target19, target20, target21, target22, target23, target24, target25, target26, target27, target28, target29, target30, target31, target32, target33, target34, target35, target36, target37, target38, target39, target40, target41, target42, target43, target44, target45, target46, target47, target48, target49, target50, target51, target52, target53, target54, target55, target56, target57, target58, target59, target60, target61, target62, target63, target64, target65, target66, target67, target68, target69, target70, target71, target72, target73, target74, target75, target76, target77, target78, target79, target80, target81, target82, target83, target84, target85, target86, target87, target88, target89, target90, target91, target92, target93, target94, target95, target96, target97, target98, target99, target100, target101, target102, target103, target104, target105, target106, target107, target108, target109, target110, target111, target112, target113, target114, target115, target116, target117, target118, target119, target120, target121, target122, target123, target124, target125, target126, target127]

def period7Chunk : RowCoverage.Chunk where
  rows := [⟨2228, target0⟩, ⟨2229, target1⟩, ⟨2242, target2⟩, ⟨2243, target3⟩, ⟨2251, target4⟩, ⟨2258, target5⟩, ⟨2259, target6⟩, ⟨2264, target7⟩, ⟨2265, target8⟩, ⟨2266, target9⟩, ⟨2278, target10⟩, ⟨2279, target11⟩, ⟨2280, target12⟩, ⟨2286, target13⟩, ⟨2290, target14⟩, ⟨2304, target15⟩, ⟨2305, target16⟩, ⟨2306, target17⟩, ⟨2312, target18⟩, ⟨2316, target19⟩, ⟨2335, target20⟩, ⟨2336, target21⟩, ⟨2342, target22⟩, ⟨2343, target23⟩, ⟨2361, target24⟩, ⟨2362, target25⟩, ⟨2367, target26⟩, ⟨2368, target27⟩, ⟨2369, target28⟩, ⟨2409, target29⟩, ⟨2417, target30⟩, ⟨2419, target31⟩, ⟨2421, target32⟩, ⟨2425, target33⟩, ⟨2429, target34⟩, ⟨2456, target35⟩, ⟨2458, target36⟩, ⟨2459, target37⟩, ⟨2460, target38⟩, ⟨2462, target39⟩, ⟨2464, target40⟩, ⟨2466, target41⟩, ⟨2522, target42⟩, ⟨2524, target43⟩, ⟨2526, target44⟩, ⟨2534, target45⟩, ⟨2536, target46⟩, ⟨2538, target47⟩, ⟨2542, target48⟩, ⟨2544, target49⟩, ⟨2546, target50⟩, ⟨2578, target51⟩, ⟨2793, target52⟩, ⟨2794, target53⟩, ⟨2795, target54⟩, ⟨2796, target55⟩, ⟨2797, target56⟩, ⟨2799, target57⟩, ⟨2801, target58⟩, ⟨2803, target59⟩, ⟨2902, target60⟩, ⟨2904, target61⟩, ⟨2906, target62⟩, ⟨2914, target63⟩, ⟨2916, target64⟩, ⟨2918, target65⟩, ⟨2922, target66⟩, ⟨2924, target67⟩, ⟨2926, target68⟩, ⟨2928, target69⟩, ⟨2930, target70⟩, ⟨2950, target71⟩, ⟨2953, target72⟩, ⟨2957, target73⟩, ⟨2958, target74⟩, ⟨2959, target75⟩, ⟨2960, target76⟩, ⟨3110, target77⟩, ⟨3112, target78⟩, ⟨3114, target79⟩, ⟨3122, target80⟩, ⟨3124, target81⟩, ⟨3126, target82⟩, ⟨3130, target83⟩, ⟨3136, target84⟩, ⟨3392, target85⟩, ⟨3395, target86⟩, ⟨3419, target87⟩, ⟨3427, target88⟩, ⟨3429, target89⟩, ⟨3431, target90⟩, ⟨3435, target91⟩, ⟨3439, target92⟩, ⟨3441, target93⟩, ⟨3443, target94⟩, ⟨3471, target95⟩, ⟨3473, target96⟩, ⟨3474, target97⟩, ⟨3475, target98⟩, ⟨3477, target99⟩, ⟨3479, target100⟩, ⟨3481, target101⟩, ⟨3508, target102⟩, ⟨3516, target103⟩, ⟨3518, target104⟩, ⟨3520, target105⟩, ⟨3524, target106⟩, ⟨3528, target107⟩, ⟨3530, target108⟩, ⟨3532, target109⟩, ⟨3564, target110⟩, ⟨3711, target111⟩, ⟨3712, target112⟩, ⟨3713, target113⟩, ⟨3714, target114⟩, ⟨3715, target115⟩, ⟨3717, target116⟩, ⟨3719, target117⟩, ⟨3721, target118⟩, ⟨3869, target119⟩, ⟨3870, target120⟩, ⟨3871, target121⟩, ⟨3872, target122⟩, ⟨4286, target123⟩, ⟨4458, target124⟩, ⟨5322, target125⟩, ⟨5328, target126⟩, ⟨5332, target127⟩]
  indexMask := 1314210108913830692691388261162732158881377436569643669554067280119591074519092469512516333095075802872128199635853497810572313483855638330492115881886259071639635290789362462796196031138694337354719190753893220377928958594551616863652149091670405414247675567854231847135664005485775564246191010806769660982349000946082989455845039993392393558594549458294818860443995092248713571889748419188668169930426333268763865995037261311752745378245468993369247059884690054712307353321952504052998162427797445978716530780356110397310214800300954134345390115812741107429886325740577116264320237518356680101448456315264052711990020484044356395418145413530325257240081347064235008136343579993958111692228939141271065867514386634948741942080660394249077586463453260377283529804173695336854516179243310681674939734941511169095018378784869718630034572037521548650344768128409829746289158498120507445841428239549105275945524020295838603686313410325844924246801258939638590012853045776131904873512381569429832888637817999614696510301849328648425159860075871437569773207030536242154944989216054117809826127709997437161482189122634657226895195063647157395395457473974822466633688430800027846559092185754645642893160247249136301195900026110221748834757562137030787534748879468944648068592755191955189454332429943371032788644884933885622239270326929006457317009340433757722384567704711226200797834991393810567271851314872420564348496264261062520753428666963119905102028960467030576617693081209601505524360556750590419115436706399416923706077789926861976748743435925942237875936235807817953725511625102312246901300354703878520832
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

end FranklSmallCyclic.TransportBatches.G023.B002.Data
