module

public import Conjectures.FranklSmallCyclicRowCoverage
public import Conjectures.FranklSmallCyclicCanonicalWords
public import Conjectures.FranklSmallCyclicOrbit7Block025Data

/-! 128 literal targets sharing one source proof block.
Original words and row indices are retained; weights may be transported.
-/
@[expose] public section

namespace FranklSmallCyclic.TransportBatches.G025.B000.Data

-- Period 7, original row 3, representative 3289.
def source0 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨72, by decide +kernel⟩

def target0 : Weights.Entry :=
  { word := [0, 0, 1, 4, 2, 0, 8], weights := [0, 0, 1, 0] }

-- Period 7, original row 9, representative 3245.
def source1 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨28, by decide +kernel⟩

def target1 : Weights.Entry :=
  { word := [0, 0, 1, 4, 2, 8, 8], weights := [0, 0, 1, 0] }

-- Period 7, original row 25, representative 3281.
def source2 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨64, by decide +kernel⟩

def target2 : Weights.Entry :=
  { word := [0, 0, 1, 4, 10, 0, 8], weights := [0, 0, 1, 0] }

-- Period 7, original row 31, representative 3228.
def source3 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨11, by decide +kernel⟩

def target3 : Weights.Entry :=
  { word := [0, 0, 1, 4, 10, 8, 8], weights := [0, 0, 1, 0] }

-- Period 7, original row 49, representative 3289.
def source4 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨72, by decide +kernel⟩

def target4 : Weights.Entry :=
  { word := [0, 0, 2, 2, 2, 0, 8], weights := [0, 1, 0, 0] }

def points4 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 5), (5, 4), (6, 6)]

-- Period 7, original row 53, representative 3304.
def source5 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨87, by decide +kernel⟩

def target5 : Weights.Entry :=
  { word := [0, 0, 2, 2, 2, 8, 0], weights := [0, 1, 0, 0] }

-- Period 7, original row 57, representative 3239.
def source6 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨22, by decide +kernel⟩

def target6 : Weights.Entry :=
  { word := [0, 0, 2, 2, 2, 8, 8], weights := [0, 1, 0, 0] }

-- Period 7, original row 64, representative 3281.
def source7 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨64, by decide +kernel⟩

def target7 : Weights.Entry :=
  { word := [0, 0, 2, 2, 10, 0, 8], weights := [0, 1, 0, 0] }

def points7 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 5), (5, 4), (6, 6)]

-- Period 7, original row 68, representative 3303.
def source8 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨86, by decide +kernel⟩

def target8 : Weights.Entry :=
  { word := [0, 0, 2, 2, 10, 8, 0], weights := [0, 1, 0, 0] }

-- Period 7, original row 72, representative 3222.
def source9 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨5, by decide +kernel⟩

def target9 : Weights.Entry :=
  { word := [0, 0, 2, 2, 10, 8, 8], weights := [0, 1, 0, 0] }

-- Period 7, original row 76, representative 3296.
def source10 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨79, by decide +kernel⟩

def target10 : Weights.Entry :=
  { word := [0, 0, 6, 2, 0, 8, 0], weights := [1, 0, 0, 0] }

-- Period 7, original row 80, representative 3259.
def source11 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨42, by decide +kernel⟩

def target11 : Weights.Entry :=
  { word := [0, 0, 6, 2, 0, 8, 8], weights := [1, 0, 0, 1] }

-- Period 7, original row 84, representative 3295.
def source12 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨78, by decide +kernel⟩

def target12 : Weights.Entry :=
  { word := [0, 0, 6, 2, 8, 8, 0], weights := [0, 1, 0, 0] }

-- Period 7, original row 88, representative 3252.
def source13 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨35, by decide +kernel⟩

def target13 : Weights.Entry :=
  { word := [0, 0, 6, 2, 8, 8, 8], weights := [0, 1, 0, 0] }

-- Period 7, original row 104, representative 3302.
def source14 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨85, by decide +kernel⟩

def target14 : Weights.Entry :=
  { word := [0, 0, 10, 2, 2, 8, 0], weights := [0, 1, 0, 0] }

-- Period 7, original row 108, representative 3240.
def source15 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨23, by decide +kernel⟩

def target15 : Weights.Entry :=
  { word := [0, 0, 10, 2, 2, 8, 8], weights := [0, 1, 0, 0] }

-- Period 7, original row 112, representative 3301.
def source16 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨84, by decide +kernel⟩

def target16 : Weights.Entry :=
  { word := [0, 0, 10, 2, 10, 8, 0], weights := [0, 1, 0, 0] }

-- Period 7, original row 116, representative 3223.
def source17 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨6, by decide +kernel⟩

def target17 : Weights.Entry :=
  { word := [0, 0, 10, 2, 10, 8, 8], weights := [0, 1, 0, 0] }

-- Period 7, original row 509, representative 3289.
def source18 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨72, by decide +kernel⟩

def target18 : Weights.Entry :=
  { word := [0, 4, 0, 4, 2, 0, 8], weights := [0, 0, 1, 0] }

def points18 : List (ℕ × ℕ) := [(0, 0), (1, 2), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 515, representative 3241.
def source19 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨24, by decide +kernel⟩

def target19 : Weights.Entry :=
  { word := [0, 4, 0, 4, 2, 8, 8], weights := [0, 0, 1, 0] }

-- Period 7, original row 531, representative 3281.
def source20 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨64, by decide +kernel⟩

def target20 : Weights.Entry :=
  { word := [0, 4, 0, 4, 10, 0, 8], weights := [0, 0, 1, 0] }

def points20 : List (ℕ × ℕ) := [(0, 0), (1, 2), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 537, representative 3224.
def source21 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨7, by decide +kernel⟩

def target21 : Weights.Entry :=
  { word := [0, 4, 0, 4, 10, 8, 8], weights := [0, 0, 1, 0] }

-- Period 7, original row 555, representative 3289.
def source22 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨72, by decide +kernel⟩

def target22 : Weights.Entry :=
  { word := [0, 4, 2, 0, 1, 0, 8], weights := [0, 0, 1, 0] }

def points22 : List (ℕ × ℕ) := [(0, 2), (1, 0), (2, 1), (3, 4), (4, 3), (5, 5), (6, 6)]

-- Period 7, original row 562, representative 3264.
def source23 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨47, by decide +kernel⟩

def target23 : Weights.Entry :=
  { word := [0, 4, 2, 0, 1, 8, 8], weights := [0, 1, 0, 1] }

-- Period 7, original row 569, representative 3290.
def source24 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨73, by decide +kernel⟩

def target24 : Weights.Entry :=
  { word := [0, 4, 2, 0, 9, 0, 8], weights := [0, 1, 0, 1] }

-- Period 7, original row 576, representative 3260.
def source25 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨43, by decide +kernel⟩

def target25 : Weights.Entry :=
  { word := [0, 4, 2, 0, 9, 8, 8], weights := [0, 1, 0, 1] }

-- Period 7, original row 582, representative 3286.
def source26 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨69, by decide +kernel⟩

def target26 : Weights.Entry :=
  { word := [0, 4, 2, 8, 2, 0, 8], weights := [0, 1, 1, 0] }

-- Period 7, original row 586, representative 3234.
def source27 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨17, by decide +kernel⟩

def target27 : Weights.Entry :=
  { word := [0, 4, 2, 8, 2, 8, 8], weights := [0, 1, 1, 0] }

-- Period 7, original row 596, representative 3278.
def source28 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨61, by decide +kernel⟩

def target28 : Weights.Entry :=
  { word := [0, 4, 2, 8, 10, 0, 8], weights := [0, 1, 1, 0] }

-- Period 7, original row 600, representative 3217.
def source29 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨0, by decide +kernel⟩

def target29 : Weights.Entry :=
  { word := [0, 4, 2, 8, 10, 8, 8], weights := [0, 1, 1, 0] }

-- Period 7, original row 605, representative 3289.
def source30 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨72, by decide +kernel⟩

def target30 : Weights.Entry :=
  { word := [0, 4, 4, 4, 0, 0, 8], weights := [0, 0, 1, 0] }

def points30 : List (ℕ × ℕ) := [(0, 2), (1, 0), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 612, representative 3264.
def source31 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨47, by decide +kernel⟩

def target31 : Weights.Entry :=
  { word := [0, 4, 4, 4, 0, 8, 8], weights := [1, 0, 0, 1] }

def points31 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6)]

-- Period 7, original row 619, representative 3284.
def source32 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨67, by decide +kernel⟩

def target32 : Weights.Entry :=
  { word := [0, 4, 4, 4, 8, 0, 8], weights := [1, 0, 1, 0] }

-- Period 7, original row 626, representative 3253.
def source33 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨36, by decide +kernel⟩

def target33 : Weights.Entry :=
  { word := [0, 4, 4, 4, 8, 8, 8], weights := [1, 0, 1, 0] }

-- Period 7, original row 632, representative 3249.
def source34 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨32, by decide +kernel⟩

def target34 : Weights.Entry :=
  { word := [0, 4, 6, 8, 8, 8, 8], weights := [0, 1, 1, 0] }

-- Period 7, original row 638, representative 3291.
def source35 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨74, by decide +kernel⟩

def target35 : Weights.Entry :=
  { word := [0, 4, 8, 4, 2, 0, 8], weights := [0, 0, 1, 0] }

-- Period 7, original row 644, representative 3244.
def source36 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨27, by decide +kernel⟩

def target36 : Weights.Entry :=
  { word := [0, 4, 8, 4, 2, 8, 8], weights := [0, 0, 1, 0] }

-- Period 7, original row 664, representative 3282.
def source37 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨65, by decide +kernel⟩

def target37 : Weights.Entry :=
  { word := [0, 4, 8, 4, 10, 0, 8], weights := [0, 0, 1, 0] }

-- Period 7, original row 670, representative 3227.
def source38 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨10, by decide +kernel⟩

def target38 : Weights.Entry :=
  { word := [0, 4, 8, 4, 10, 8, 8], weights := [0, 0, 1, 0] }

-- Period 7, original row 694, representative 3267.
def source39 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨50, by decide +kernel⟩

def target39 : Weights.Entry :=
  { word := [0, 4, 10, 0, 1, 8, 8], weights := [0, 1, 0, 1] }

-- Period 7, original row 701, representative 3263.
def source40 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨46, by decide +kernel⟩

def target40 : Weights.Entry :=
  { word := [0, 4, 10, 0, 9, 8, 8], weights := [0, 1, 0, 1] }

-- Period 7, original row 706, representative 3233.
def source41 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨16, by decide +kernel⟩

def target41 : Weights.Entry :=
  { word := [0, 4, 10, 8, 2, 8, 8], weights := [0, 1, 1, 0] }

-- Period 7, original row 720, representative 3267.
def source42 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨50, by decide +kernel⟩

def target42 : Weights.Entry :=
  { word := [0, 4, 12, 4, 0, 8, 8], weights := [1, 0, 0, 1] }

def points42 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6)]

-- Period 7, original row 727, representative 3285.
def source43 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨68, by decide +kernel⟩

def target43 : Weights.Entry :=
  { word := [0, 4, 12, 4, 8, 0, 8], weights := [1, 0, 1, 0] }

-- Period 7, original row 734, representative 3256.
def source44 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨39, by decide +kernel⟩

def target44 : Weights.Entry :=
  { word := [0, 4, 12, 4, 8, 8, 8], weights := [1, 0, 1, 0] }

-- Period 7, original row 816, representative 3292.
def source45 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨75, by decide +kernel⟩

def target45 : Weights.Entry :=
  { word := [0, 8, 0, 4, 2, 0, 8], weights := [0, 0, 1, 0] }

-- Period 7, original row 822, representative 3247.
def source46 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨30, by decide +kernel⟩

def target46 : Weights.Entry :=
  { word := [0, 8, 0, 4, 2, 8, 8], weights := [0, 0, 1, 0] }

-- Period 7, original row 827, representative 3296.
def source47 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨79, by decide +kernel⟩

def target47 : Weights.Entry :=
  { word := [0, 8, 0, 4, 6, 0, 0], weights := [0, 0, 1, 0] }

def points47 : List (ℕ × ℕ) := [(0, 1), (1, 2), (2, 0), (3, 5), (4, 6), (5, 4), (6, 3)]

-- Period 7, original row 829, representative 3294.
def source48 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨77, by decide +kernel⟩

def target48 : Weights.Entry :=
  { word := [0, 8, 0, 4, 6, 8, 0], weights := [0, 0, 1, 0] }

-- Period 7, original row 842, representative 3283.
def source49 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨66, by decide +kernel⟩

def target49 : Weights.Entry :=
  { word := [0, 8, 0, 4, 10, 0, 8], weights := [0, 0, 1, 0] }

-- Period 7, original row 848, representative 3230.
def source50 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨13, by decide +kernel⟩

def target50 : Weights.Entry :=
  { word := [0, 8, 0, 4, 10, 8, 8], weights := [0, 0, 1, 0] }

-- Period 7, original row 895, representative 3276.
def source51 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨59, by decide +kernel⟩

def target51 : Weights.Entry :=
  { word := [0, 8, 1, 4, 2, 0, 8], weights := [0, 0, 1, 0] }

-- Period 7, original row 901, representative 3246.
def source52 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨29, by decide +kernel⟩

def target52 : Weights.Entry :=
  { word := [0, 8, 1, 4, 2, 8, 8], weights := [0, 0, 1, 0] }

-- Period 7, original row 917, representative 3274.
def source53 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨57, by decide +kernel⟩

def target53 : Weights.Entry :=
  { word := [0, 8, 1, 4, 10, 0, 8], weights := [0, 0, 1, 0] }

-- Period 7, original row 923, representative 3229.
def source54 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨12, by decide +kernel⟩

def target54 : Weights.Entry :=
  { word := [0, 8, 1, 4, 10, 8, 8], weights := [0, 0, 1, 0] }

-- Period 7, original row 941, representative 3287.
def source55 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨70, by decide +kernel⟩

def target55 : Weights.Entry :=
  { word := [0, 8, 2, 2, 2, 0, 8], weights := [0, 1, 0, 0] }

-- Period 7, original row 945, representative 3300.
def source56 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨83, by decide +kernel⟩

def target56 : Weights.Entry :=
  { word := [0, 8, 2, 2, 2, 8, 0], weights := [0, 1, 0, 0] }

-- Period 7, original row 949, representative 3235.
def source57 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨18, by decide +kernel⟩

def target57 : Weights.Entry :=
  { word := [0, 8, 2, 2, 2, 8, 8], weights := [0, 1, 0, 0] }

-- Period 7, original row 956, representative 3279.
def source58 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨62, by decide +kernel⟩

def target58 : Weights.Entry :=
  { word := [0, 8, 2, 2, 10, 0, 8], weights := [0, 1, 0, 0] }

-- Period 7, original row 960, representative 3299.
def source59 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨82, by decide +kernel⟩

def target59 : Weights.Entry :=
  { word := [0, 8, 2, 2, 10, 8, 0], weights := [0, 1, 0, 0] }

-- Period 7, original row 964, representative 3218.
def source60 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨1, by decide +kernel⟩

def target60 : Weights.Entry :=
  { word := [0, 8, 2, 2, 10, 8, 8], weights := [0, 1, 0, 0] }

-- Period 7, original row 971, representative 3288.
def source61 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨71, by decide +kernel⟩

def target61 : Weights.Entry :=
  { word := [0, 8, 2, 10, 2, 0, 8], weights := [0, 1, 0, 0] }

-- Period 7, original row 978, representative 3238.
def source62 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨21, by decide +kernel⟩

def target62 : Weights.Entry :=
  { word := [0, 8, 2, 10, 2, 8, 8], weights := [0, 1, 0, 0] }

-- Period 7, original row 985, representative 3280.
def source63 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨63, by decide +kernel⟩

def target63 : Weights.Entry :=
  { word := [0, 8, 2, 10, 10, 0, 8], weights := [0, 1, 0, 0] }

-- Period 7, original row 992, representative 3221.
def source64 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨4, by decide +kernel⟩

def target64 : Weights.Entry :=
  { word := [0, 8, 2, 10, 10, 8, 8], weights := [0, 1, 0, 0] }

-- Period 7, original row 996, representative 3304.
def source65 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨87, by decide +kernel⟩

def target65 : Weights.Entry :=
  { word := [0, 8, 4, 4, 4, 0, 0], weights := [0, 0, 1, 0] }

def points65 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 998, representative 3300.
def source66 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨83, by decide +kernel⟩

def target66 : Weights.Entry :=
  { word := [0, 8, 4, 4, 4, 8, 0], weights := [0, 0, 1, 0] }

def points66 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 1000, representative 3302.
def source67 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨85, by decide +kernel⟩

def target67 : Weights.Entry :=
  { word := [0, 8, 4, 4, 12, 0, 0], weights := [0, 0, 1, 0] }

def points67 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 1002, representative 3298.
def source68 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨81, by decide +kernel⟩

def target68 : Weights.Entry :=
  { word := [0, 8, 4, 4, 12, 8, 0], weights := [0, 0, 1, 0] }

-- Period 7, original row 1012, representative 3294.
def source69 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨77, by decide +kernel⟩

def target69 : Weights.Entry :=
  { word := [0, 8, 6, 2, 0, 8, 0], weights := [1, 0, 0, 0] }

def points69 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 3), (6, 4)]

-- Period 7, original row 1016, representative 3257.
def source70 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨40, by decide +kernel⟩

def target70 : Weights.Entry :=
  { word := [0, 8, 6, 2, 0, 8, 8], weights := [1, 0, 0, 1] }

-- Period 7, original row 1020, representative 3293.
def source71 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨76, by decide +kernel⟩

def target71 : Weights.Entry :=
  { word := [0, 8, 6, 2, 8, 8, 0], weights := [0, 1, 0, 0] }

-- Period 7, original row 1024, representative 3250.
def source72 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨33, by decide +kernel⟩

def target72 : Weights.Entry :=
  { word := [0, 8, 6, 2, 8, 8, 8], weights := [0, 1, 0, 0] }

-- Period 7, original row 1031, representative 3258.
def source73 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨41, by decide +kernel⟩

def target73 : Weights.Entry :=
  { word := [0, 8, 6, 10, 0, 8, 8], weights := [1, 0, 0, 1] }

-- Period 7, original row 1038, representative 3251.
def source74 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨34, by decide +kernel⟩

def target74 : Weights.Entry :=
  { word := [0, 8, 6, 10, 8, 8, 8], weights := [0, 1, 0, 0] }

-- Period 7, original row 1046, representative 3295.
def source75 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨78, by decide +kernel⟩

def target75 : Weights.Entry :=
  { word := [0, 8, 8, 4, 6, 0, 0], weights := [0, 0, 1, 0] }

def points75 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 1048, representative 3293.
def source76 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨76, by decide +kernel⟩

def target76 : Weights.Entry :=
  { word := [0, 8, 8, 4, 6, 8, 0], weights := [0, 0, 1, 0] }

def points76 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 1080, representative 3298.
def source77 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨81, by decide +kernel⟩

def target77 : Weights.Entry :=
  { word := [0, 8, 10, 2, 2, 8, 0], weights := [0, 1, 0, 0] }

def points77 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 1084, representative 3236.
def source78 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨19, by decide +kernel⟩

def target78 : Weights.Entry :=
  { word := [0, 8, 10, 2, 2, 8, 8], weights := [0, 1, 0, 0] }

-- Period 7, original row 1088, representative 3297.
def source79 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨80, by decide +kernel⟩

def target79 : Weights.Entry :=
  { word := [0, 8, 10, 2, 10, 8, 0], weights := [0, 1, 0, 0] }

-- Period 7, original row 1092, representative 3219.
def source80 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨2, by decide +kernel⟩

def target80 : Weights.Entry :=
  { word := [0, 8, 10, 2, 10, 8, 8], weights := [0, 1, 0, 0] }

-- Period 7, original row 1099, representative 3237.
def source81 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨20, by decide +kernel⟩

def target81 : Weights.Entry :=
  { word := [0, 8, 10, 10, 2, 8, 8], weights := [0, 1, 0, 0] }

-- Period 7, original row 1106, representative 3220.
def source82 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨3, by decide +kernel⟩

def target82 : Weights.Entry :=
  { word := [0, 8, 10, 10, 10, 8, 8], weights := [0, 1, 0, 0] }

-- Period 7, original row 1110, representative 3303.
def source83 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨86, by decide +kernel⟩

def target83 : Weights.Entry :=
  { word := [0, 8, 12, 4, 4, 0, 0], weights := [0, 0, 1, 0] }

def points83 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 1112, representative 3299.
def source84 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨82, by decide +kernel⟩

def target84 : Weights.Entry :=
  { word := [0, 8, 12, 4, 4, 8, 0], weights := [0, 0, 1, 0] }

def points84 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 1114, representative 3301.
def source85 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨84, by decide +kernel⟩

def target85 : Weights.Entry :=
  { word := [0, 8, 12, 4, 12, 0, 0], weights := [0, 0, 1, 0] }

def points85 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 1116, representative 3297.
def source86 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨80, by decide +kernel⟩

def target86 : Weights.Entry :=
  { word := [0, 8, 12, 4, 12, 8, 0], weights := [0, 0, 1, 0] }

def points86 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 1508, representative 3276.
def source87 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨59, by decide +kernel⟩

def target87 : Weights.Entry :=
  { word := [0, 12, 0, 4, 2, 0, 8], weights := [0, 0, 1, 0] }

def points87 : List (ℕ × ℕ) := [(0, 0), (1, 2), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 1514, representative 3242.
def source88 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨25, by decide +kernel⟩

def target88 : Weights.Entry :=
  { word := [0, 12, 0, 4, 2, 8, 8], weights := [0, 0, 1, 0] }

-- Period 7, original row 1530, representative 3274.
def source89 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨57, by decide +kernel⟩

def target89 : Weights.Entry :=
  { word := [0, 12, 0, 4, 10, 0, 8], weights := [0, 0, 1, 0] }

def points89 : List (ℕ × ℕ) := [(0, 0), (1, 2), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 1536, representative 3225.
def source90 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨8, by decide +kernel⟩

def target90 : Weights.Entry :=
  { word := [0, 12, 0, 4, 10, 8, 8], weights := [0, 0, 1, 0] }

-- Period 7, original row 1554, representative 3272.
def source91 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨55, by decide +kernel⟩

def target91 : Weights.Entry :=
  { word := [0, 12, 2, 0, 1, 0, 8], weights := [0, 1, 0, 1] }

-- Period 7, original row 1561, representative 3265.
def source92 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨48, by decide +kernel⟩

def target92 : Weights.Entry :=
  { word := [0, 12, 2, 0, 1, 8, 8], weights := [0, 1, 0, 1] }

-- Period 7, original row 1568, representative 3273.
def source93 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨56, by decide +kernel⟩

def target93 : Weights.Entry :=
  { word := [0, 12, 2, 0, 9, 0, 8], weights := [0, 1, 0, 1] }

-- Period 7, original row 1575, representative 3261.
def source94 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨44, by decide +kernel⟩

def target94 : Weights.Entry :=
  { word := [0, 12, 2, 0, 9, 8, 8], weights := [0, 1, 0, 1] }

-- Period 7, original row 1581, representative 3271.
def source95 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨54, by decide +kernel⟩

def target95 : Weights.Entry :=
  { word := [0, 12, 2, 8, 2, 0, 8], weights := [0, 1, 1, 0] }

-- Period 7, original row 1585, representative 3232.
def source96 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨15, by decide +kernel⟩

def target96 : Weights.Entry :=
  { word := [0, 12, 2, 8, 2, 8, 8], weights := [0, 1, 1, 0] }

-- Period 7, original row 1595, representative 3270.
def source97 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨53, by decide +kernel⟩

def target97 : Weights.Entry :=
  { word := [0, 12, 2, 8, 10, 0, 8], weights := [0, 1, 1, 0] }

-- Period 7, original row 1604, representative 3272.
def source98 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨55, by decide +kernel⟩

def target98 : Weights.Entry :=
  { word := [0, 12, 4, 4, 0, 0, 8], weights := [1, 0, 0, 1] }

def points98 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6)]

-- Period 7, original row 1611, representative 3265.
def source99 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨48, by decide +kernel⟩

def target99 : Weights.Entry :=
  { word := [0, 12, 4, 4, 0, 8, 8], weights := [1, 0, 0, 1] }

def points99 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6)]

-- Period 7, original row 1618, representative 3268.
def source100 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨51, by decide +kernel⟩

def target100 : Weights.Entry :=
  { word := [0, 12, 4, 4, 8, 0, 8], weights := [1, 0, 1, 0] }

-- Period 7, original row 1625, representative 3254.
def source101 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨37, by decide +kernel⟩

def target101 : Weights.Entry :=
  { word := [0, 12, 4, 4, 8, 8, 8], weights := [1, 0, 1, 0] }

-- Period 7, original row 1631, representative 3248.
def source102 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨31, by decide +kernel⟩

def target102 : Weights.Entry :=
  { word := [0, 12, 6, 8, 8, 8, 8], weights := [0, 1, 1, 0] }

-- Period 7, original row 1637, representative 3277.
def source103 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨60, by decide +kernel⟩

def target103 : Weights.Entry :=
  { word := [0, 12, 8, 4, 2, 0, 8], weights := [0, 0, 1, 0] }

-- Period 7, original row 1643, representative 3243.
def source104 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨26, by decide +kernel⟩

def target104 : Weights.Entry :=
  { word := [0, 12, 8, 4, 2, 8, 8], weights := [0, 0, 1, 0] }

-- Period 7, original row 1663, representative 3275.
def source105 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨58, by decide +kernel⟩

def target105 : Weights.Entry :=
  { word := [0, 12, 8, 4, 10, 0, 8], weights := [0, 0, 1, 0] }

-- Period 7, original row 1669, representative 3226.
def source106 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨9, by decide +kernel⟩

def target106 : Weights.Entry :=
  { word := [0, 12, 8, 4, 10, 8, 8], weights := [0, 0, 1, 0] }

-- Period 7, original row 1693, representative 3266.
def source107 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨49, by decide +kernel⟩

def target107 : Weights.Entry :=
  { word := [0, 12, 10, 0, 1, 8, 8], weights := [0, 1, 0, 1] }

-- Period 7, original row 1700, representative 3262.
def source108 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨45, by decide +kernel⟩

def target108 : Weights.Entry :=
  { word := [0, 12, 10, 0, 9, 8, 8], weights := [0, 1, 0, 1] }

-- Period 7, original row 1705, representative 3231.
def source109 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨14, by decide +kernel⟩

def target109 : Weights.Entry :=
  { word := [0, 12, 10, 8, 2, 8, 8], weights := [0, 1, 1, 0] }

-- Period 7, original row 1719, representative 3266.
def source110 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨49, by decide +kernel⟩

def target110 : Weights.Entry :=
  { word := [0, 12, 12, 4, 0, 8, 8], weights := [1, 0, 0, 1] }

def points110 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6)]

-- Period 7, original row 1726, representative 3269.
def source111 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨52, by decide +kernel⟩

def target111 : Weights.Entry :=
  { word := [0, 12, 12, 4, 8, 0, 8], weights := [1, 0, 1, 0] }

-- Period 7, original row 1733, representative 3255.
def source112 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨38, by decide +kernel⟩

def target112 : Weights.Entry :=
  { word := [0, 12, 12, 4, 8, 8, 8], weights := [1, 0, 1, 0] }

-- Period 7, original row 1740, representative 3289.
def source113 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨72, by decide +kernel⟩

def target113 : Weights.Entry :=
  { word := [1, 0, 1, 4, 2, 0, 8], weights := [0, 0, 1, 0] }

def points113 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 1746, representative 3245.
def source114 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨28, by decide +kernel⟩

def target114 : Weights.Entry :=
  { word := [1, 0, 1, 4, 2, 8, 8], weights := [0, 0, 1, 0] }

def points114 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 1762, representative 3281.
def source115 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨64, by decide +kernel⟩

def target115 : Weights.Entry :=
  { word := [1, 0, 1, 4, 10, 0, 8], weights := [0, 0, 1, 0] }

def points115 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 1768, representative 3228.
def source116 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨11, by decide +kernel⟩

def target116 : Weights.Entry :=
  { word := [1, 0, 1, 4, 10, 8, 8], weights := [0, 0, 1, 0] }

def points116 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 1786, representative 3289.
def source117 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨72, by decide +kernel⟩

def target117 : Weights.Entry :=
  { word := [1, 0, 2, 2, 2, 0, 8], weights := [0, 1, 0, 0] }

def points117 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 5), (5, 4), (6, 6)]

-- Period 7, original row 1790, representative 3304.
def source118 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨87, by decide +kernel⟩

def target118 : Weights.Entry :=
  { word := [1, 0, 2, 2, 2, 8, 0], weights := [0, 1, 0, 0] }

def points118 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 1794, representative 3239.
def source119 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨22, by decide +kernel⟩

def target119 : Weights.Entry :=
  { word := [1, 0, 2, 2, 2, 8, 8], weights := [0, 1, 0, 0] }

def points119 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 1801, representative 3281.
def source120 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨64, by decide +kernel⟩

def target120 : Weights.Entry :=
  { word := [1, 0, 2, 2, 10, 0, 8], weights := [0, 1, 0, 0] }

def points120 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 5), (5, 4), (6, 6)]

-- Period 7, original row 1805, representative 3303.
def source121 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨86, by decide +kernel⟩

def target121 : Weights.Entry :=
  { word := [1, 0, 2, 2, 10, 8, 0], weights := [0, 1, 0, 0] }

def points121 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 1809, representative 3222.
def source122 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨5, by decide +kernel⟩

def target122 : Weights.Entry :=
  { word := [1, 0, 2, 2, 10, 8, 8], weights := [0, 1, 0, 0] }

def points122 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 1825, representative 3302.
def source123 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨85, by decide +kernel⟩

def target123 : Weights.Entry :=
  { word := [1, 0, 10, 2, 2, 8, 0], weights := [0, 1, 0, 0] }

def points123 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 1829, representative 3240.
def source124 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨23, by decide +kernel⟩

def target124 : Weights.Entry :=
  { word := [1, 0, 10, 2, 2, 8, 8], weights := [0, 1, 0, 0] }

def points124 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 1833, representative 3301.
def source125 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨84, by decide +kernel⟩

def target125 : Weights.Entry :=
  { word := [1, 0, 10, 2, 10, 8, 0], weights := [0, 1, 0, 0] }

def points125 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 1837, representative 3223.
def source126 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨6, by decide +kernel⟩

def target126 : Weights.Entry :=
  { word := [1, 0, 10, 2, 10, 8, 8], weights := [0, 1, 0, 0] }

def points126 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 1844, representative 3289.
def source127 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨72, by decide +kernel⟩

def target127 : Weights.Entry :=
  { word := [1, 4, 2, 0, 1, 0, 8], weights := [0, 0, 1, 0] }

def points127 : List (ℕ × ℕ) := [(0, 2), (1, 0), (2, 1), (3, 4), (4, 3), (5, 5), (6, 6)]

def period7Entries : List Weights.Entry := [target0, target1, target2, target3, target4, target5, target6, target7, target8, target9, target10, target11, target12, target13, target14, target15, target16, target17, target18, target19, target20, target21, target22, target23, target24, target25, target26, target27, target28, target29, target30, target31, target32, target33, target34, target35, target36, target37, target38, target39, target40, target41, target42, target43, target44, target45, target46, target47, target48, target49, target50, target51, target52, target53, target54, target55, target56, target57, target58, target59, target60, target61, target62, target63, target64, target65, target66, target67, target68, target69, target70, target71, target72, target73, target74, target75, target76, target77, target78, target79, target80, target81, target82, target83, target84, target85, target86, target87, target88, target89, target90, target91, target92, target93, target94, target95, target96, target97, target98, target99, target100, target101, target102, target103, target104, target105, target106, target107, target108, target109, target110, target111, target112, target113, target114, target115, target116, target117, target118, target119, target120, target121, target122, target123, target124, target125, target126, target127]

def period7Chunk : RowCoverage.Chunk where
  rows := [⟨3, target0⟩, ⟨9, target1⟩, ⟨25, target2⟩, ⟨31, target3⟩, ⟨49, target4⟩, ⟨53, target5⟩, ⟨57, target6⟩, ⟨64, target7⟩, ⟨68, target8⟩, ⟨72, target9⟩, ⟨76, target10⟩, ⟨80, target11⟩, ⟨84, target12⟩, ⟨88, target13⟩, ⟨104, target14⟩, ⟨108, target15⟩, ⟨112, target16⟩, ⟨116, target17⟩, ⟨509, target18⟩, ⟨515, target19⟩, ⟨531, target20⟩, ⟨537, target21⟩, ⟨555, target22⟩, ⟨562, target23⟩, ⟨569, target24⟩, ⟨576, target25⟩, ⟨582, target26⟩, ⟨586, target27⟩, ⟨596, target28⟩, ⟨600, target29⟩, ⟨605, target30⟩, ⟨612, target31⟩, ⟨619, target32⟩, ⟨626, target33⟩, ⟨632, target34⟩, ⟨638, target35⟩, ⟨644, target36⟩, ⟨664, target37⟩, ⟨670, target38⟩, ⟨694, target39⟩, ⟨701, target40⟩, ⟨706, target41⟩, ⟨720, target42⟩, ⟨727, target43⟩, ⟨734, target44⟩, ⟨816, target45⟩, ⟨822, target46⟩, ⟨827, target47⟩, ⟨829, target48⟩, ⟨842, target49⟩, ⟨848, target50⟩, ⟨895, target51⟩, ⟨901, target52⟩, ⟨917, target53⟩, ⟨923, target54⟩, ⟨941, target55⟩, ⟨945, target56⟩, ⟨949, target57⟩, ⟨956, target58⟩, ⟨960, target59⟩, ⟨964, target60⟩, ⟨971, target61⟩, ⟨978, target62⟩, ⟨985, target63⟩, ⟨992, target64⟩, ⟨996, target65⟩, ⟨998, target66⟩, ⟨1000, target67⟩, ⟨1002, target68⟩, ⟨1012, target69⟩, ⟨1016, target70⟩, ⟨1020, target71⟩, ⟨1024, target72⟩, ⟨1031, target73⟩, ⟨1038, target74⟩, ⟨1046, target75⟩, ⟨1048, target76⟩, ⟨1080, target77⟩, ⟨1084, target78⟩, ⟨1088, target79⟩, ⟨1092, target80⟩, ⟨1099, target81⟩, ⟨1106, target82⟩, ⟨1110, target83⟩, ⟨1112, target84⟩, ⟨1114, target85⟩, ⟨1116, target86⟩, ⟨1508, target87⟩, ⟨1514, target88⟩, ⟨1530, target89⟩, ⟨1536, target90⟩, ⟨1554, target91⟩, ⟨1561, target92⟩, ⟨1568, target93⟩, ⟨1575, target94⟩, ⟨1581, target95⟩, ⟨1585, target96⟩, ⟨1595, target97⟩, ⟨1604, target98⟩, ⟨1611, target99⟩, ⟨1618, target100⟩, ⟨1625, target101⟩, ⟨1631, target102⟩, ⟨1637, target103⟩, ⟨1643, target104⟩, ⟨1663, target105⟩, ⟨1669, target106⟩, ⟨1693, target107⟩, ⟨1700, target108⟩, ⟨1705, target109⟩, ⟨1719, target110⟩, ⟨1726, target111⟩, ⟨1733, target112⟩, ⟨1740, target113⟩, ⟨1746, target114⟩, ⟨1762, target115⟩, ⟨1768, target116⟩, ⟨1786, target117⟩, ⟨1790, target118⟩, ⟨1794, target119⟩, ⟨1801, target120⟩, ⟨1805, target121⟩, ⟨1809, target122⟩, ⟨1825, target123⟩, ⟨1829, target124⟩, ⟨1833, target125⟩, ⟨1837, target126⟩, ⟨1844, target127⟩]
  indexMask := 1267406919612619039068291518045830156864352498349526175735300635402422766442138092355606872279844625346547880674440960722046574141642967799276495413494648736909002214241741184945575443812647593010862787960925699596591507834178245683522181195577557384818681644086379990033585771588955453874627859493027295531808808849329007360331418753181562732449604669108086611906200989744615600895525994465326186026511671178105974414818918862755232034809769511074490185300392539621213592420336225687650294291934267181742276990458543869408453864277925456539014785639907848
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

end FranklSmallCyclic.TransportBatches.G025.B000.Data
