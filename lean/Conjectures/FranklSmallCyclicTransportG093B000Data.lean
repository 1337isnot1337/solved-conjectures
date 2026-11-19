module

public import Conjectures.FranklSmallCyclicRowCoverage
public import Conjectures.FranklSmallCyclicCanonicalWords
public import Conjectures.FranklSmallCyclicOrbit10Block015Data

/-! 128 literal targets sharing one source proof block.
Original words and row indices are retained; weights may be transported.
-/
@[expose] public section

namespace FranklSmallCyclic.TransportBatches.G093.B000.Data

-- Period 10, original row 2448, representative 10462.
def source0 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B015.Data.entryAt ⟨54, by decide +kernel⟩

def target0 : Weights.Entry :=
  { word := [2, 0, 4, 10, 8, 4, 4], weights := [1, 0, 1, 1] }

-- Period 10, original row 2472, representative 10433.
def source1 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B015.Data.entryAt ⟨25, by decide +kernel⟩

def target1 : Weights.Entry :=
  { word := [2, 0, 8, 4, 8, 4, 4], weights := [1, 0, 0, 1] }

-- Period 10, original row 2476, representative 10457.
def source2 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B015.Data.entryAt ⟨49, by decide +kernel⟩

def target2 : Weights.Entry :=
  { word := [2, 0, 8, 9, 4, 4, 4], weights := [1, 0, 1, 1] }

-- Period 10, original row 2480, representative 10456.
def source3 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B015.Data.entryAt ⟨48, by decide +kernel⟩

def target3 : Weights.Entry :=
  { word := [2, 0, 8, 9, 12, 4, 4], weights := [1, 0, 1, 1] }

-- Period 10, original row 2488, representative 10437.
def source4 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B015.Data.entryAt ⟨29, by decide +kernel⟩

def target4 : Weights.Entry :=
  { word := [2, 0, 8, 12, 0, 4, 2], weights := [1, 0, 1, 0] }

-- Period 10, original row 2489, representative 10437.
def source5 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B015.Data.entryAt ⟨29, by decide +kernel⟩

def target5 : Weights.Entry :=
  { word := [2, 0, 8, 12, 0, 4, 4], weights := [1, 0, 1, 0] }

def points5 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 8), (8, 7), (9, 9)]

-- Period 10, original row 2502, representative 10434.
def source6 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B015.Data.entryAt ⟨26, by decide +kernel⟩

def target6 : Weights.Entry :=
  { word := [2, 0, 8, 12, 8, 4, 4], weights := [1, 0, 1, 0] }

-- Period 10, original row 2518, representative 10467.
def source7 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B015.Data.entryAt ⟨59, by decide +kernel⟩

def target7 : Weights.Entry :=
  { word := [2, 0, 9, 8, 9, 4, 4], weights := [1, 0, 1, 1] }

-- Period 10, original row 2550, representative 10463.
def source8 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B015.Data.entryAt ⟨55, by decide +kernel⟩

def target8 : Weights.Entry :=
  { word := [2, 0, 12, 10, 0, 4, 2], weights := [1, 0, 1, 1] }

-- Period 10, original row 2551, representative 10463.
def source9 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B015.Data.entryAt ⟨55, by decide +kernel⟩

def target9 : Weights.Entry :=
  { word := [2, 0, 12, 10, 0, 4, 4], weights := [1, 0, 1, 1] }

def points9 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 8), (8, 7), (9, 9)]

-- Period 10, original row 2570, representative 10461.
def source10 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B015.Data.entryAt ⟨53, by decide +kernel⟩

def target10 : Weights.Entry :=
  { word := [2, 0, 12, 10, 8, 4, 4], weights := [1, 0, 1, 1] }

-- Period 10, original row 2583, representative 10424.
def source11 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B015.Data.entryAt ⟨16, by decide +kernel⟩

def target11 : Weights.Entry :=
  { word := [2, 2, 0, 9, 0, 4, 8], weights := [1, 1, 2, 0] }

-- Period 10, original row 2586, representative 10423.
def source12 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B015.Data.entryAt ⟨15, by decide +kernel⟩

def target12 : Weights.Entry :=
  { word := [2, 2, 0, 9, 0, 12, 8], weights := [1, 1, 2, 0] }

-- Period 10, original row 2589, representative 10471.
def source13 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B015.Data.entryAt ⟨63, by decide +kernel⟩

def target13 : Weights.Entry :=
  { word := [2, 2, 0, 9, 8, 2, 2], weights := [1, 1, 0, 1] }

-- Period 10, original row 2594, representative 10470.
def source14 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B015.Data.entryAt ⟨62, by decide +kernel⟩

def target14 : Weights.Entry :=
  { word := [2, 2, 0, 9, 8, 9, 4], weights := [1, 1, 0, 1] }

-- Period 10, original row 2596, representative 10469.
def source15 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B015.Data.entryAt ⟨61, by decide +kernel⟩

def target15 : Weights.Entry :=
  { word := [2, 2, 0, 9, 8, 10, 2], weights := [1, 1, 0, 1] }

-- Period 10, original row 2607, representative 10436.
def source16 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B015.Data.entryAt ⟨28, by decide +kernel⟩

def target16 : Weights.Entry :=
  { word := [2, 2, 0, 10, 0, 8, 4], weights := [1, 0, 0, 1] }

-- Period 10, original row 2611, representative 10437.
def source17 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B015.Data.entryAt ⟨29, by decide +kernel⟩

def target17 : Weights.Entry :=
  { word := [2, 2, 0, 10, 8, 0, 4], weights := [0, 1, 0, 1] }

def points17 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2), (9, 0)]

-- Period 10, original row 2613, representative 10435.
def source18 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B015.Data.entryAt ⟨27, by decide +kernel⟩

def target18 : Weights.Entry :=
  { word := [2, 2, 0, 10, 8, 8, 4], weights := [1, 0, 0, 1] }

-- Period 10, original row 2617, representative 10463.
def source19 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B015.Data.entryAt ⟨55, by decide +kernel⟩

def target19 : Weights.Entry :=
  { word := [2, 2, 0, 12, 10, 0, 4], weights := [1, 1, 0, 1] }

def points19 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2), (9, 0)]

-- Period 10, original row 2642, representative 10457.
def source20 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B015.Data.entryAt ⟨49, by decide +kernel⟩

def target20 : Weights.Entry :=
  { word := [2, 2, 2, 8, 9, 0, 4], weights := [1, 1, 0, 1] }

def points20 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 2651, representative 10452.
def source21 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B015.Data.entryAt ⟨44, by decide +kernel⟩

def target21 : Weights.Entry :=
  { word := [2, 2, 8, 0, 1, 4, 8], weights := [0, 1, 3, 0] }

-- Period 10, original row 2652, representative 10448.
def source22 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B015.Data.entryAt ⟨40, by decide +kernel⟩

def target22 : Weights.Entry :=
  { word := [2, 2, 8, 0, 1, 12, 8], weights := [0, 1, 3, 0] }

-- Period 10, original row 2660, representative 10429.
def source23 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B015.Data.entryAt ⟨21, by decide +kernel⟩

def target23 : Weights.Entry :=
  { word := [2, 2, 8, 2, 0, 8, 2], weights := [1, 0, 0, 1] }

-- Period 10, original row 2661, representative 10429.
def source24 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B015.Data.entryAt ⟨21, by decide +kernel⟩

def target24 : Weights.Entry :=
  { word := [2, 2, 8, 2, 0, 8, 4], weights := [1, 0, 0, 1] }

def points24 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 8), (8, 7), (9, 9)]

-- Period 10, original row 2670, representative 10433.
def source25 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B015.Data.entryAt ⟨25, by decide +kernel⟩

def target25 : Weights.Entry :=
  { word := [2, 2, 8, 2, 8, 0, 4], weights := [1, 0, 0, 1] }

def points25 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 2674, representative 10430.
def source26 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B015.Data.entryAt ⟨22, by decide +kernel⟩

def target26 : Weights.Entry :=
  { word := [2, 2, 8, 2, 8, 8, 4], weights := [1, 0, 0, 1] }

-- Period 10, original row 2685, representative 10453.
def source27 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B015.Data.entryAt ⟨45, by decide +kernel⟩

def target27 : Weights.Entry :=
  { word := [2, 2, 8, 8, 1, 4, 8], weights := [0, 1, 3, 0] }

-- Period 10, original row 2686, representative 10449.
def source28 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B015.Data.entryAt ⟨41, by decide +kernel⟩

def target28 : Weights.Entry :=
  { word := [2, 2, 8, 8, 1, 12, 8], weights := [0, 1, 3, 0] }

-- Period 10, original row 2688, representative 10422.
def source29 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B015.Data.entryAt ⟨14, by decide +kernel⟩

def target29 : Weights.Entry :=
  { word := [2, 2, 8, 9, 0, 4, 8], weights := [1, 1, 2, 0] }

-- Period 10, original row 2691, representative 10421.
def source30 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B015.Data.entryAt ⟨13, by decide +kernel⟩

def target30 : Weights.Entry :=
  { word := [2, 2, 8, 9, 0, 12, 8], weights := [1, 1, 2, 0] }

-- Period 10, original row 2692, representative 10467.
def source31 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B015.Data.entryAt ⟨59, by decide +kernel⟩

def target31 : Weights.Entry :=
  { word := [2, 2, 8, 9, 8, 1, 4], weights := [1, 1, 0, 1] }

def points31 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 2694, representative 10466.
def source32 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B015.Data.entryAt ⟨58, by decide +kernel⟩

def target32 : Weights.Entry :=
  { word := [2, 2, 8, 9, 8, 2, 2], weights := [1, 1, 0, 1] }

-- Period 10, original row 2696, representative 10468.
def source33 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B015.Data.entryAt ⟨60, by decide +kernel⟩

def target33 : Weights.Entry :=
  { word := [2, 2, 8, 9, 8, 8, 4], weights := [1, 1, 0, 1] }

-- Period 10, original row 2699, representative 10465.
def source34 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B015.Data.entryAt ⟨57, by decide +kernel⟩

def target34 : Weights.Entry :=
  { word := [2, 2, 8, 9, 8, 9, 4], weights := [1, 1, 0, 1] }

-- Period 10, original row 2701, representative 10464.
def source35 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B015.Data.entryAt ⟨56, by decide +kernel⟩

def target35 : Weights.Entry :=
  { word := [2, 2, 8, 9, 8, 10, 2], weights := [1, 1, 0, 1] }

-- Period 10, original row 2710, representative 10432.
def source36 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B015.Data.entryAt ⟨24, by decide +kernel⟩

def target36 : Weights.Entry :=
  { word := [2, 2, 8, 10, 0, 8, 2], weights := [1, 0, 0, 1] }

-- Period 10, original row 2711, representative 10432.
def source37 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B015.Data.entryAt ⟨24, by decide +kernel⟩

def target37 : Weights.Entry :=
  { word := [2, 2, 8, 10, 0, 8, 4], weights := [1, 0, 0, 1] }

def points37 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 8), (8, 7), (9, 9)]

-- Period 10, original row 2721, representative 10434.
def source38 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B015.Data.entryAt ⟨26, by decide +kernel⟩

def target38 : Weights.Entry :=
  { word := [2, 2, 8, 10, 8, 0, 4], weights := [0, 1, 0, 1] }

def points38 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 2726, representative 10447.
def source39 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B015.Data.entryAt ⟨39, by decide +kernel⟩

def target39 : Weights.Entry :=
  { word := [2, 2, 8, 10, 8, 6, 8], weights := [1, 1, 1, 1] }

-- Period 10, original row 2727, representative 10431.
def source40 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B015.Data.entryAt ⟨23, by decide +kernel⟩

def target40 : Weights.Entry :=
  { word := [2, 2, 8, 10, 8, 8, 4], weights := [1, 0, 0, 1] }

-- Period 10, original row 2731, representative 10455.
def source41 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B015.Data.entryAt ⟨47, by decide +kernel⟩

def target41 : Weights.Entry :=
  { word := [2, 2, 8, 12, 0, 4, 8], weights := [1, 0, 2, 0] }

-- Period 10, original row 2732, representative 10451.
def source42 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B015.Data.entryAt ⟨43, by decide +kernel⟩

def target42 : Weights.Entry :=
  { word := [2, 2, 8, 12, 0, 12, 8], weights := [1, 0, 2, 0] }

-- Period 10, original row 2735, representative 10462.
def source43 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B015.Data.entryAt ⟨54, by decide +kernel⟩

def target43 : Weights.Entry :=
  { word := [2, 2, 8, 12, 2, 0, 4], weights := [1, 1, 0, 1] }

def points43 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 2740, representative 10459.
def source44 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B015.Data.entryAt ⟨51, by decide +kernel⟩

def target44 : Weights.Entry :=
  { word := [2, 2, 8, 12, 2, 8, 2], weights := [1, 1, 1, 1] }

-- Period 10, original row 2744, representative 10446.
def source45 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B015.Data.entryAt ⟨38, by decide +kernel⟩

def target45 : Weights.Entry :=
  { word := [2, 2, 8, 12, 4, 4, 8], weights := [1, 1, 1, 1] }

-- Period 10, original row 2746, representative 10444.
def source46 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B015.Data.entryAt ⟨36, by decide +kernel⟩

def target46 : Weights.Entry :=
  { word := [2, 2, 8, 12, 4, 12, 8], weights := [1, 1, 1, 1] }

-- Period 10, original row 2747, representative 10454.
def source47 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B015.Data.entryAt ⟨46, by decide +kernel⟩

def target47 : Weights.Entry :=
  { word := [2, 2, 8, 12, 8, 4, 8], weights := [1, 0, 2, 0] }

-- Period 10, original row 2748, representative 10450.
def source48 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B015.Data.entryAt ⟨42, by decide +kernel⟩

def target48 : Weights.Entry :=
  { word := [2, 2, 8, 12, 8, 12, 8], weights := [1, 0, 2, 0] }

-- Period 10, original row 2751, representative 10461.
def source49 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B015.Data.entryAt ⟨53, by decide +kernel⟩

def target49 : Weights.Entry :=
  { word := [2, 2, 8, 12, 10, 0, 4], weights := [1, 1, 0, 1] }

def points49 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 2756, representative 10458.
def source50 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B015.Data.entryAt ⟨50, by decide +kernel⟩

def target50 : Weights.Entry :=
  { word := [2, 2, 8, 12, 10, 8, 2], weights := [1, 1, 1, 1] }

-- Period 10, original row 2757, representative 10460.
def source51 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B015.Data.entryAt ⟨52, by decide +kernel⟩

def target51 : Weights.Entry :=
  { word := [2, 2, 8, 12, 10, 8, 4], weights := [2, 1, 1, 2] }

-- Period 10, original row 2762, representative 10445.
def source52 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B015.Data.entryAt ⟨37, by decide +kernel⟩

def target52 : Weights.Entry :=
  { word := [2, 2, 8, 12, 12, 4, 8], weights := [1, 1, 1, 1] }

-- Period 10, original row 2764, representative 10443.
def source53 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B015.Data.entryAt ⟨35, by decide +kernel⟩

def target53 : Weights.Entry :=
  { word := [2, 2, 8, 12, 12, 12, 8], weights := [1, 1, 1, 1] }

-- Period 10, original row 2784, representative 10456.
def source54 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B015.Data.entryAt ⟨48, by decide +kernel⟩

def target54 : Weights.Entry :=
  { word := [2, 2, 10, 8, 9, 0, 4], weights := [1, 1, 0, 1] }

def points54 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 2823, representative 10425.
def source55 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B015.Data.entryAt ⟨17, by decide +kernel⟩

def target55 : Weights.Entry :=
  { word := [2, 8, 0, 4, 8, 4, 2], weights := [1, 0, 1, 0] }

-- Period 10, original row 2824, representative 10429.
def source56 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B015.Data.entryAt ⟨21, by decide +kernel⟩

def target56 : Weights.Entry :=
  { word := [2, 8, 0, 4, 8, 4, 4], weights := [1, 0, 0, 1] }

def points56 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2), (9, 0)]

-- Period 10, original row 2849, representative 10436.
def source57 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B015.Data.entryAt ⟨28, by decide +kernel⟩

def target57 : Weights.Entry :=
  { word := [2, 8, 0, 12, 0, 4, 2], weights := [1, 0, 1, 0] }

def points57 : List (ℕ × ℕ) := [(0, 8), (1, 7), (2, 9), (3, 5), (4, 6), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 2850, representative 10436.
def source58 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B015.Data.entryAt ⟨28, by decide +kernel⟩

def target58 : Weights.Entry :=
  { word := [2, 8, 0, 12, 0, 4, 4], weights := [1, 0, 1, 0] }

def points58 : List (ℕ × ℕ) := [(0, 7), (1, 8), (2, 9), (3, 5), (4, 6), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 2874, representative 10428.
def source59 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B015.Data.entryAt ⟨20, by decide +kernel⟩

def target59 : Weights.Entry :=
  { word := [2, 8, 0, 12, 8, 4, 2], weights := [1, 0, 1, 0] }

-- Period 10, original row 2875, representative 10432.
def source60 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B015.Data.entryAt ⟨24, by decide +kernel⟩

def target60 : Weights.Entry :=
  { word := [2, 8, 0, 12, 8, 4, 4], weights := [1, 0, 0, 1] }

def points60 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2), (9, 0)]

-- Period 10, original row 2989, representative 10426.
def source61 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B015.Data.entryAt ⟨18, by decide +kernel⟩

def target61 : Weights.Entry :=
  { word := [2, 8, 8, 4, 8, 4, 2], weights := [1, 0, 1, 0] }

-- Period 10, original row 2990, representative 10430.
def source62 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B015.Data.entryAt ⟨22, by decide +kernel⟩

def target62 : Weights.Entry :=
  { word := [2, 8, 8, 4, 8, 4, 4], weights := [1, 0, 0, 1] }

def points62 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 3025, representative 10468.
def source63 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B015.Data.entryAt ⟨60, by decide +kernel⟩

def target63 : Weights.Entry :=
  { word := [2, 8, 8, 8, 9, 4, 4], weights := [1, 0, 1, 1] }

def points63 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 3033, representative 10435.
def source64 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B015.Data.entryAt ⟨27, by decide +kernel⟩

def target64 : Weights.Entry :=
  { word := [2, 8, 8, 12, 0, 4, 2], weights := [1, 0, 0, 1] }

def points64 : List (ℕ × ℕ) := [(0, 9), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 3034, representative 10435.
def source65 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B015.Data.entryAt ⟨27, by decide +kernel⟩

def target65 : Weights.Entry :=
  { word := [2, 8, 8, 12, 0, 4, 4], weights := [1, 0, 0, 1] }

def points65 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 3062, representative 10427.
def source66 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B015.Data.entryAt ⟨19, by decide +kernel⟩

def target66 : Weights.Entry :=
  { word := [2, 8, 8, 12, 8, 4, 2], weights := [1, 0, 1, 0] }

-- Period 10, original row 3063, representative 10431.
def source67 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B015.Data.entryAt ⟨23, by decide +kernel⟩

def target67 : Weights.Entry :=
  { word := [2, 8, 8, 12, 8, 4, 4], weights := [1, 0, 0, 1] }

def points67 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 3090, representative 10470.
def source68 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B015.Data.entryAt ⟨62, by decide +kernel⟩

def target68 : Weights.Entry :=
  { word := [2, 8, 9, 8, 1, 4, 2], weights := [1, 0, 1, 1] }

def points68 : List (ℕ × ℕ) := [(0, 9), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 3091, representative 10470.
def source69 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B015.Data.entryAt ⟨62, by decide +kernel⟩

def target69 : Weights.Entry :=
  { word := [2, 8, 9, 8, 1, 4, 4], weights := [1, 0, 1, 1] }

def points69 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 3100, representative 10465.
def source70 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B015.Data.entryAt ⟨57, by decide +kernel⟩

def target70 : Weights.Entry :=
  { word := [2, 8, 9, 8, 9, 4, 4], weights := [1, 0, 1, 1] }

def points70 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 3152, representative 10460.
def source71 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B015.Data.entryAt ⟨52, by decide +kernel⟩

def target71 : Weights.Entry :=
  { word := [2, 8, 12, 10, 8, 4, 4], weights := [2, 1, 1, 2] }

def points71 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 3207, representative 10412.
def source72 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B015.Data.entryAt ⟨4, by decide +kernel⟩

def target72 : Weights.Entry :=
  { word := [2, 10, 0, 12, 2, 0, 8], weights := [1, 1, 1, 0] }

-- Period 10, original row 3215, representative 10411.
def source73 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B015.Data.entryAt ⟨3, by decide +kernel⟩

def target73 : Weights.Entry :=
  { word := [2, 10, 0, 12, 10, 0, 8], weights := [1, 1, 1, 0] }

-- Period 10, original row 3223, representative 10420.
def source74 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B015.Data.entryAt ⟨12, by decide +kernel⟩

def target74 : Weights.Entry :=
  { word := [2, 10, 2, 8, 1, 0, 8], weights := [1, 1, 0, 1] }

-- Period 10, original row 3228, representative 10418.
def source75 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B015.Data.entryAt ⟨10, by decide +kernel⟩

def target75 : Weights.Entry :=
  { word := [2, 10, 2, 8, 1, 8, 8], weights := [1, 1, 1, 1] }

-- Period 10, original row 3237, representative 10419.
def source76 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B015.Data.entryAt ⟨11, by decide +kernel⟩

def target76 : Weights.Entry :=
  { word := [2, 10, 2, 8, 9, 0, 8], weights := [1, 1, 0, 1] }

-- Period 10, original row 3242, representative 10417.
def source77 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B015.Data.entryAt ⟨9, by decide +kernel⟩

def target77 : Weights.Entry :=
  { word := [2, 10, 2, 8, 9, 8, 8], weights := [1, 1, 1, 1] }

-- Period 10, original row 3331, representative 10410.
def source78 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B015.Data.entryAt ⟨2, by decide +kernel⟩

def target78 : Weights.Entry :=
  { word := [2, 10, 8, 12, 2, 0, 8], weights := [1, 1, 1, 0] }

-- Period 10, original row 3337, representative 10408.
def source79 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B015.Data.entryAt ⟨0, by decide +kernel⟩

def target79 : Weights.Entry :=
  { word := [2, 10, 8, 12, 2, 8, 8], weights := [1, 1, 1, 1] }

-- Period 10, original row 3353, representative 10409.
def source80 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B015.Data.entryAt ⟨1, by decide +kernel⟩

def target80 : Weights.Entry :=
  { word := [2, 10, 8, 12, 10, 0, 8], weights := [1, 1, 1, 0] }

-- Period 10, original row 3369, representative 10416.
def source81 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B015.Data.entryAt ⟨8, by decide +kernel⟩

def target81 : Weights.Entry :=
  { word := [2, 10, 10, 8, 1, 0, 8], weights := [1, 1, 0, 1] }

-- Period 10, original row 3374, representative 10414.
def source82 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B015.Data.entryAt ⟨6, by decide +kernel⟩

def target82 : Weights.Entry :=
  { word := [2, 10, 10, 8, 1, 8, 8], weights := [1, 1, 1, 1] }

-- Period 10, original row 3383, representative 10415.
def source83 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B015.Data.entryAt ⟨7, by decide +kernel⟩

def target83 : Weights.Entry :=
  { word := [2, 10, 10, 8, 9, 0, 8], weights := [1, 1, 0, 1] }

-- Period 10, original row 3388, representative 10413.
def source84 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B015.Data.entryAt ⟨5, by decide +kernel⟩

def target84 : Weights.Entry :=
  { word := [2, 10, 10, 8, 9, 8, 8], weights := [1, 1, 1, 1] }

-- Period 10, original row 3569, representative 10424.
def source85 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B015.Data.entryAt ⟨16, by decide +kernel⟩

def target85 : Weights.Entry :=
  { word := [4, 2, 0, 9, 0, 4, 8], weights := [1, 1, 2, 0] }

def points85 : List (ℕ × ℕ) := [(0, 0), (1, 2), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8), (9, 9)]

-- Period 10, original row 3572, representative 10423.
def source86 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B015.Data.entryAt ⟨15, by decide +kernel⟩

def target86 : Weights.Entry :=
  { word := [4, 2, 0, 9, 0, 12, 8], weights := [1, 1, 2, 0] }

def points86 : List (ℕ × ℕ) := [(0, 0), (1, 2), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8), (9, 9)]

-- Period 10, original row 3575, representative 10471.
def source87 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B015.Data.entryAt ⟨63, by decide +kernel⟩

def target87 : Weights.Entry :=
  { word := [4, 2, 0, 9, 8, 2, 2], weights := [1, 1, 0, 1] }

def points87 : List (ℕ × ℕ) := [(0, 0), (1, 2), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8), (9, 9)]

-- Period 10, original row 3580, representative 10470.
def source88 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B015.Data.entryAt ⟨62, by decide +kernel⟩

def target88 : Weights.Entry :=
  { word := [4, 2, 0, 9, 8, 9, 4], weights := [1, 1, 0, 1] }

def points88 : List (ℕ × ℕ) := [(0, 0), (1, 2), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8), (9, 9)]

-- Period 10, original row 3582, representative 10469.
def source89 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B015.Data.entryAt ⟨61, by decide +kernel⟩

def target89 : Weights.Entry :=
  { word := [4, 2, 0, 9, 8, 10, 2], weights := [1, 1, 0, 1] }

def points89 : List (ℕ × ℕ) := [(0, 0), (1, 2), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8), (9, 9)]

-- Period 10, original row 3593, representative 10436.
def source90 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B015.Data.entryAt ⟨28, by decide +kernel⟩

def target90 : Weights.Entry :=
  { word := [4, 2, 0, 10, 0, 8, 4], weights := [1, 0, 0, 1] }

def points90 : List (ℕ × ℕ) := [(0, 0), (1, 2), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8), (9, 9)]

-- Period 10, original row 3597, representative 10437.
def source91 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B015.Data.entryAt ⟨29, by decide +kernel⟩

def target91 : Weights.Entry :=
  { word := [4, 2, 0, 10, 8, 0, 4], weights := [0, 1, 0, 1] }

def points91 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 3599, representative 10435.
def source92 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B015.Data.entryAt ⟨27, by decide +kernel⟩

def target92 : Weights.Entry :=
  { word := [4, 2, 0, 10, 8, 8, 4], weights := [1, 0, 0, 1] }

def points92 : List (ℕ × ℕ) := [(0, 0), (1, 2), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8), (9, 9)]

-- Period 10, original row 3603, representative 10463.
def source93 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B015.Data.entryAt ⟨55, by decide +kernel⟩

def target93 : Weights.Entry :=
  { word := [4, 2, 0, 12, 10, 0, 4], weights := [1, 1, 0, 1] }

def points93 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 3615, representative 10425.
def source94 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B015.Data.entryAt ⟨17, by decide +kernel⟩

def target94 : Weights.Entry :=
  { word := [4, 2, 8, 2, 0, 8, 2], weights := [1, 0, 0, 1] }

def points94 : List (ℕ × ℕ) := [(0, 9), (1, 7), (2, 8), (3, 6), (4, 5), (5, 3), (6, 4), (7, 2), (8, 0), (9, 1)]

-- Period 10, original row 3616, representative 10425.
def source95 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B015.Data.entryAt ⟨17, by decide +kernel⟩

def target95 : Weights.Entry :=
  { word := [4, 2, 8, 2, 0, 8, 4], weights := [1, 0, 0, 1] }

def points95 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 3), (6, 4), (7, 2), (8, 0), (9, 1)]

-- Period 10, original row 3627, representative 10426.
def source96 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B015.Data.entryAt ⟨18, by decide +kernel⟩

def target96 : Weights.Entry :=
  { word := [4, 2, 8, 2, 8, 8, 4], weights := [0, 1, 0, 1] }

def points96 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 3648, representative 10428.
def source97 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B015.Data.entryAt ⟨20, by decide +kernel⟩

def target97 : Weights.Entry :=
  { word := [4, 2, 8, 10, 0, 8, 2], weights := [1, 0, 0, 1] }

def points97 : List (ℕ × ℕ) := [(0, 9), (1, 7), (2, 8), (3, 6), (4, 5), (5, 3), (6, 4), (7, 2), (8, 0), (9, 1)]

-- Period 10, original row 3649, representative 10428.
def source98 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B015.Data.entryAt ⟨20, by decide +kernel⟩

def target98 : Weights.Entry :=
  { word := [4, 2, 8, 10, 0, 8, 4], weights := [1, 0, 0, 1] }

def points98 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 3), (6, 4), (7, 2), (8, 0), (9, 1)]

-- Period 10, original row 3662, representative 10442.
def source99 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B015.Data.entryAt ⟨34, by decide +kernel⟩

def target99 : Weights.Entry :=
  { word := [4, 2, 8, 10, 8, 6, 8], weights := [1, 1, 1, 1] }

-- Period 10, original row 3663, representative 10427.
def source100 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B015.Data.entryAt ⟨19, by decide +kernel⟩

def target100 : Weights.Entry :=
  { word := [4, 2, 8, 10, 8, 8, 4], weights := [0, 1, 0, 1] }

def points100 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 3670, representative 10441.
def source101 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B015.Data.entryAt ⟨33, by decide +kernel⟩

def target101 : Weights.Entry :=
  { word := [4, 2, 8, 12, 4, 4, 8], weights := [1, 1, 1, 1] }

-- Period 10, original row 3672, representative 10439.
def source102 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B015.Data.entryAt ⟨31, by decide +kernel⟩

def target102 : Weights.Entry :=
  { word := [4, 2, 8, 12, 4, 12, 8], weights := [1, 1, 1, 1] }

-- Period 10, original row 3674, representative 10440.
def source103 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B015.Data.entryAt ⟨32, by decide +kernel⟩

def target103 : Weights.Entry :=
  { word := [4, 2, 8, 12, 12, 4, 8], weights := [1, 1, 1, 1] }

-- Period 10, original row 3676, representative 10438.
def source104 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B015.Data.entryAt ⟨30, by decide +kernel⟩

def target104 : Weights.Entry :=
  { word := [4, 2, 8, 12, 12, 12, 8], weights := [1, 1, 1, 1] }

-- Period 10, original row 3683, representative 10471.
def source105 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B015.Data.entryAt ⟨63, by decide +kernel⟩

def target105 : Weights.Entry :=
  { word := [4, 4, 8, 8, 1, 4, 2], weights := [1, 0, 1, 1] }

def points105 : List (ℕ × ℕ) := [(0, 9), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 3684, representative 10471.
def source106 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B015.Data.entryAt ⟨63, by decide +kernel⟩

def target106 : Weights.Entry :=
  { word := [4, 4, 8, 8, 1, 4, 4], weights := [1, 0, 1, 1] }

def points106 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 3698, representative 10466.
def source107 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B015.Data.entryAt ⟨58, by decide +kernel⟩

def target107 : Weights.Entry :=
  { word := [4, 4, 8, 8, 9, 4, 4], weights := [1, 0, 1, 1] }

def points107 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 3741, representative 10425.
def source108 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B015.Data.entryAt ⟨17, by decide +kernel⟩

def target108 : Weights.Entry :=
  { word := [4, 8, 0, 4, 8, 4, 2], weights := [1, 0, 1, 0] }

def points108 : List (ℕ × ℕ) := [(0, 0), (1, 2), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8), (9, 9)]

-- Period 10, original row 3742, representative 10429.
def source109 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B015.Data.entryAt ⟨21, by decide +kernel⟩

def target109 : Weights.Entry :=
  { word := [4, 8, 0, 4, 8, 4, 4], weights := [1, 0, 0, 1] }

def points109 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 3784, representative 10428.
def source110 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B015.Data.entryAt ⟨20, by decide +kernel⟩

def target110 : Weights.Entry :=
  { word := [4, 8, 0, 12, 8, 4, 2], weights := [1, 0, 1, 0] }

def points110 : List (ℕ × ℕ) := [(0, 0), (1, 2), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8), (9, 9)]

-- Period 10, original row 3785, representative 10432.
def source111 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B015.Data.entryAt ⟨24, by decide +kernel⟩

def target111 : Weights.Entry :=
  { word := [4, 8, 0, 12, 8, 4, 4], weights := [1, 0, 0, 1] }

def points111 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 3856, representative 10459.
def source112 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B015.Data.entryAt ⟨51, by decide +kernel⟩

def target112 : Weights.Entry :=
  { word := [4, 8, 4, 10, 8, 4, 4], weights := [1, 1, 1, 1] }

def points112 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 3964, representative 10458.
def source113 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B015.Data.entryAt ⟨50, by decide +kernel⟩

def target113 : Weights.Entry :=
  { word := [4, 8, 12, 10, 8, 4, 4], weights := [1, 1, 1, 1] }

def points113 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 3995, representative 10412.
def source114 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B015.Data.entryAt ⟨4, by decide +kernel⟩

def target114 : Weights.Entry :=
  { word := [4, 10, 0, 12, 2, 0, 8], weights := [1, 1, 1, 0] }

def points114 : List (ℕ × ℕ) := [(0, 0), (1, 2), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8), (9, 9)]

-- Period 10, original row 4003, representative 10411.
def source115 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B015.Data.entryAt ⟨3, by decide +kernel⟩

def target115 : Weights.Entry :=
  { word := [4, 10, 0, 12, 10, 0, 8], weights := [1, 1, 1, 0] }

def points115 : List (ℕ × ℕ) := [(0, 0), (1, 2), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8), (9, 9)]

-- Period 10, original row 4048, representative 10469.
def source116 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B015.Data.entryAt ⟨61, by decide +kernel⟩

def target116 : Weights.Entry :=
  { word := [4, 12, 8, 8, 1, 4, 2], weights := [1, 0, 1, 1] }

def points116 : List (ℕ × ℕ) := [(0, 9), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 4049, representative 10469.
def source117 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B015.Data.entryAt ⟨61, by decide +kernel⟩

def target117 : Weights.Entry :=
  { word := [4, 12, 8, 8, 1, 4, 4], weights := [1, 0, 1, 1] }

def points117 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 4063, representative 10464.
def source118 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B015.Data.entryAt ⟨56, by decide +kernel⟩

def target118 : Weights.Entry :=
  { word := [4, 12, 8, 8, 9, 4, 4], weights := [1, 0, 1, 1] }

def points118 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 4107, representative 10420.
def source119 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B015.Data.entryAt ⟨12, by decide +kernel⟩

def target119 : Weights.Entry :=
  { word := [8, 0, 0, 9, 4, 12, 4], weights := [1, 0, 1, 1] }

def points119 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 0), (8, 1), (9, 2)]

-- Period 10, original row 4111, representative 10416.
def source120 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B015.Data.entryAt ⟨8, by decide +kernel⟩

def target120 : Weights.Entry :=
  { word := [8, 0, 0, 9, 12, 12, 4], weights := [1, 0, 1, 1] }

def points120 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 0), (8, 1), (9, 2)]

-- Period 10, original row 4299, representative 10412.
def source121 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B015.Data.entryAt ⟨4, by decide +kernel⟩

def target121 : Weights.Entry :=
  { word := [8, 0, 4, 10, 0, 12, 2], weights := [0, 1, 1, 1] }

def points121 : List (ℕ × ℕ) := [(0, 9), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 0), (9, 1)]

-- Period 10, original row 4300, representative 10412.
def source122 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B015.Data.entryAt ⟨4, by decide +kernel⟩

def target122 : Weights.Entry :=
  { word := [8, 0, 4, 10, 0, 12, 4], weights := [0, 1, 1, 1] }

def points122 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 0), (9, 1)]

-- Period 10, original row 4310, representative 10410.
def source123 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B015.Data.entryAt ⟨2, by decide +kernel⟩

def target123 : Weights.Entry :=
  { word := [8, 0, 4, 10, 8, 12, 4], weights := [0, 1, 1, 1] }

def points123 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 0), (9, 1)]

-- Period 10, original row 4366, representative 10419.
def source124 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B015.Data.entryAt ⟨11, by decide +kernel⟩

def target124 : Weights.Entry :=
  { word := [8, 0, 8, 9, 4, 12, 4], weights := [1, 0, 1, 1] }

def points124 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 0), (9, 1)]

-- Period 10, original row 4370, representative 10415.
def source125 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B015.Data.entryAt ⟨7, by decide +kernel⟩

def target125 : Weights.Entry :=
  { word := [8, 0, 8, 9, 12, 12, 4], weights := [1, 0, 1, 1] }

def points125 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 0), (9, 1)]

-- Period 10, original row 4475, representative 10411.
def source126 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B015.Data.entryAt ⟨3, by decide +kernel⟩

def target126 : Weights.Entry :=
  { word := [8, 0, 12, 10, 0, 12, 2], weights := [0, 1, 1, 1] }

def points126 : List (ℕ × ℕ) := [(0, 9), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 0), (9, 1)]

-- Period 10, original row 4476, representative 10411.
def source127 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B015.Data.entryAt ⟨3, by decide +kernel⟩

def target127 : Weights.Entry :=
  { word := [8, 0, 12, 10, 0, 12, 4], weights := [0, 1, 1, 1] }

def points127 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 0), (9, 1)]

def period10Entries : List Weights.Entry := [target0, target1, target2, target3, target4, target5, target6, target7, target8, target9, target10, target11, target12, target13, target14, target15, target16, target17, target18, target19, target20, target21, target22, target23, target24, target25, target26, target27, target28, target29, target30, target31, target32, target33, target34, target35, target36, target37, target38, target39, target40, target41, target42, target43, target44, target45, target46, target47, target48, target49, target50, target51, target52, target53, target54, target55, target56, target57, target58, target59, target60, target61, target62, target63, target64, target65, target66, target67, target68, target69, target70, target71, target72, target73, target74, target75, target76, target77, target78, target79, target80, target81, target82, target83, target84, target85, target86, target87, target88, target89, target90, target91, target92, target93, target94, target95, target96, target97, target98, target99, target100, target101, target102, target103, target104, target105, target106, target107, target108, target109, target110, target111, target112, target113, target114, target115, target116, target117, target118, target119, target120, target121, target122, target123, target124, target125, target126, target127]

def period10Chunk : RowCoverage.Chunk where
  rows := [⟨2448, target0⟩, ⟨2472, target1⟩, ⟨2476, target2⟩, ⟨2480, target3⟩, ⟨2488, target4⟩, ⟨2489, target5⟩, ⟨2502, target6⟩, ⟨2518, target7⟩, ⟨2550, target8⟩, ⟨2551, target9⟩, ⟨2570, target10⟩, ⟨2583, target11⟩, ⟨2586, target12⟩, ⟨2589, target13⟩, ⟨2594, target14⟩, ⟨2596, target15⟩, ⟨2607, target16⟩, ⟨2611, target17⟩, ⟨2613, target18⟩, ⟨2617, target19⟩, ⟨2642, target20⟩, ⟨2651, target21⟩, ⟨2652, target22⟩, ⟨2660, target23⟩, ⟨2661, target24⟩, ⟨2670, target25⟩, ⟨2674, target26⟩, ⟨2685, target27⟩, ⟨2686, target28⟩, ⟨2688, target29⟩, ⟨2691, target30⟩, ⟨2692, target31⟩, ⟨2694, target32⟩, ⟨2696, target33⟩, ⟨2699, target34⟩, ⟨2701, target35⟩, ⟨2710, target36⟩, ⟨2711, target37⟩, ⟨2721, target38⟩, ⟨2726, target39⟩, ⟨2727, target40⟩, ⟨2731, target41⟩, ⟨2732, target42⟩, ⟨2735, target43⟩, ⟨2740, target44⟩, ⟨2744, target45⟩, ⟨2746, target46⟩, ⟨2747, target47⟩, ⟨2748, target48⟩, ⟨2751, target49⟩, ⟨2756, target50⟩, ⟨2757, target51⟩, ⟨2762, target52⟩, ⟨2764, target53⟩, ⟨2784, target54⟩, ⟨2823, target55⟩, ⟨2824, target56⟩, ⟨2849, target57⟩, ⟨2850, target58⟩, ⟨2874, target59⟩, ⟨2875, target60⟩, ⟨2989, target61⟩, ⟨2990, target62⟩, ⟨3025, target63⟩, ⟨3033, target64⟩, ⟨3034, target65⟩, ⟨3062, target66⟩, ⟨3063, target67⟩, ⟨3090, target68⟩, ⟨3091, target69⟩, ⟨3100, target70⟩, ⟨3152, target71⟩, ⟨3207, target72⟩, ⟨3215, target73⟩, ⟨3223, target74⟩, ⟨3228, target75⟩, ⟨3237, target76⟩, ⟨3242, target77⟩, ⟨3331, target78⟩, ⟨3337, target79⟩, ⟨3353, target80⟩, ⟨3369, target81⟩, ⟨3374, target82⟩, ⟨3383, target83⟩, ⟨3388, target84⟩, ⟨3569, target85⟩, ⟨3572, target86⟩, ⟨3575, target87⟩, ⟨3580, target88⟩, ⟨3582, target89⟩, ⟨3593, target90⟩, ⟨3597, target91⟩, ⟨3599, target92⟩, ⟨3603, target93⟩, ⟨3615, target94⟩, ⟨3616, target95⟩, ⟨3627, target96⟩, ⟨3648, target97⟩, ⟨3649, target98⟩, ⟨3662, target99⟩, ⟨3663, target100⟩, ⟨3670, target101⟩, ⟨3672, target102⟩, ⟨3674, target103⟩, ⟨3676, target104⟩, ⟨3683, target105⟩, ⟨3684, target106⟩, ⟨3698, target107⟩, ⟨3741, target108⟩, ⟨3742, target109⟩, ⟨3784, target110⟩, ⟨3785, target111⟩, ⟨3856, target112⟩, ⟨3964, target113⟩, ⟨3995, target114⟩, ⟨4003, target115⟩, ⟨4048, target116⟩, ⟨4049, target117⟩, ⟨4063, target118⟩, ⟨4107, target119⟩, ⟨4111, target120⟩, ⟨4299, target121⟩, ⟨4300, target122⟩, ⟨4310, target123⟩, ⟨4366, target124⟩, ⟨4370, target125⟩, ⟨4475, target126⟩, ⟨4476, target127⟩]
  indexMask := 3857907860333112563232583124539741783271271305479182996831079104140616281298988352753198406279852352269447527097704147935541870860203668888080292671386403446634348039258678082123261517939161980248959842616623234133806659477608344767173214336435749087505671616231453416890298143781185479521920439951533114784543034791598398323495774008425582799019627442191195896551256415303182795246317860510697575144782295223610810672210425579609629994705644804356090759612404723871160287271715349393767885194874441773667368732631596633384938647614467552367504041631508987112150926896937950233775192541753985533073735317302253280018916687816191666607325146921838182826897625781662849941043366115205444063084176493022968807154199881722735489196630972745099216230802260480855822448346289781542957512595363527351586877826837826961714031380534014587477961475920415900009656084413910746912125059853787889029885085645280598948339527733908602802951227744541554657552275158875398434184404591611480182765739058813816449923051094971556004990059865972470381268588164309003861138017391458128275621293482404869724870280124479957398667757093858101751353713848238878619246914516606422459053082081076980398334016143076633172522212227076225472010154168259724779712304951682977850218435756415125385324532907604916284917210635549642468469308631860306620587605400183203368569919242240
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

end FranklSmallCyclic.TransportBatches.G093.B000.Data
