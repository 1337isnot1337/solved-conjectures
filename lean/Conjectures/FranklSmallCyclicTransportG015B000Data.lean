module

public import Conjectures.FranklSmallCyclicRowCoverage
public import Conjectures.FranklSmallCyclicCanonicalWords
public import Conjectures.FranklSmallCyclicOrbit7Block015Data

/-! 128 literal targets sharing one source proof block.
Original words and row indices are retained; weights may be transported.
-/
@[expose] public section

namespace FranklSmallCyclic.TransportBatches.G015.B000.Data

-- Period 7, original row 19, representative 1956.
def source0 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B015.Data.entryAt ⟨23, by decide +kernel⟩

def target0 : Weights.Entry :=
  { word := [0, 0, 1, 4, 8, 12, 4], weights := [1, 0, 0, 1] }

-- Period 7, original row 42, representative 1959.
def source1 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B015.Data.entryAt ⟨26, by decide +kernel⟩

def target1 : Weights.Entry :=
  { word := [0, 0, 1, 12, 8, 12, 4], weights := [1, 0, 1, 0] }

-- Period 7, original row 136, representative 1972.
def source2 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B015.Data.entryAt ⟨39, by decide +kernel⟩

def target2 : Weights.Entry :=
  { word := [0, 1, 0, 12, 0, 4, 2], weights := [1, 0, 1, 0] }

-- Period 7, original row 142, representative 2041.
def source3 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B015.Data.entryAt ⟨108, by decide +kernel⟩

def target3 : Weights.Entry :=
  { word := [0, 1, 0, 12, 0, 12, 8], weights := [0, 0, 1, 0] }

-- Period 7, original row 215, representative 2039.
def source4 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B015.Data.entryAt ⟨106, by decide +kernel⟩

def target4 : Weights.Entry :=
  { word := [0, 1, 8, 4, 4, 12, 8], weights := [1, 0, 0, 1] }

-- Period 7, original row 232, representative 2040.
def source5 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B015.Data.entryAt ⟨107, by decide +kernel⟩

def target5 : Weights.Entry :=
  { word := [0, 1, 8, 12, 4, 12, 8], weights := [1, 0, 0, 1] }

-- Period 7, original row 265, representative 1999.
def source6 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B015.Data.entryAt ⟨66, by decide +kernel⟩

def target6 : Weights.Entry :=
  { word := [0, 1, 12, 10, 0, 4, 2], weights := [1, 0, 1, 1] }

-- Period 7, original row 295, representative 1972.
def source7 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B015.Data.entryAt ⟨39, by decide +kernel⟩

def target7 : Weights.Entry :=
  { word := [0, 2, 0, 8, 1, 4, 2], weights := [0, 1, 1, 0] }

def points7 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6)]

-- Period 7, original row 301, representative 2041.
def source8 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B015.Data.entryAt ⟨108, by decide +kernel⟩

def target8 : Weights.Entry :=
  { word := [0, 2, 0, 8, 1, 12, 8], weights := [0, 0, 1, 0] }

def points8 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6)]

-- Period 7, original row 343, representative 1986.
def source9 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B015.Data.entryAt ⟨53, by decide +kernel⟩

def target9 : Weights.Entry :=
  { word := [0, 2, 2, 2, 8, 4, 2], weights := [0, 1, 0, 1] }

-- Period 7, original row 363, representative 2056.
def source10 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B015.Data.entryAt ⟨123, by decide +kernel⟩

def target10 : Weights.Entry :=
  { word := [0, 2, 2, 2, 8, 12, 8], weights := [0, 1, 0, 1] }

-- Period 7, original row 392, representative 1987.
def source11 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B015.Data.entryAt ⟨54, by decide +kernel⟩

def target11 : Weights.Entry :=
  { word := [0, 2, 2, 10, 8, 4, 2], weights := [0, 1, 1, 0] }

-- Period 7, original row 408, representative 2057.
def source12 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B015.Data.entryAt ⟨124, by decide +kernel⟩

def target12 : Weights.Entry :=
  { word := [0, 2, 2, 10, 8, 12, 8], weights := [0, 1, 1, 0] }

-- Period 7, original row 413, representative 2009.
def source13 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B015.Data.entryAt ⟨76, by decide +kernel⟩

def target13 : Weights.Entry :=
  { word := [0, 2, 8, 8, 4, 6, 8], weights := [0, 1, 1, 0] }

-- Period 7, original row 418, representative 2005.
def source14 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B015.Data.entryAt ⟨72, by decide +kernel⟩

def target14 : Weights.Entry :=
  { word := [0, 2, 8, 8, 12, 6, 8], weights := [0, 0, 1, 0] }

-- Period 7, original row 441, representative 1984.
def source15 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B015.Data.entryAt ⟨51, by decide +kernel⟩

def target15 : Weights.Entry :=
  { word := [0, 2, 10, 2, 8, 4, 2], weights := [0, 1, 0, 1] }

-- Period 7, original row 461, representative 2054.
def source16 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B015.Data.entryAt ⟨121, by decide +kernel⟩

def target16 : Weights.Entry :=
  { word := [0, 2, 10, 2, 8, 12, 8], weights := [0, 1, 0, 1] }

-- Period 7, original row 466, representative 1999.
def source17 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B015.Data.entryAt ⟨66, by decide +kernel⟩

def target17 : Weights.Entry :=
  { word := [0, 2, 10, 10, 0, 4, 2], weights := [0, 1, 1, 1] }

def points17 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6)]

-- Period 7, original row 487, representative 1985.
def source18 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B015.Data.entryAt ⟨52, by decide +kernel⟩

def target18 : Weights.Entry :=
  { word := [0, 2, 10, 10, 8, 4, 2], weights := [0, 1, 1, 0] }

-- Period 7, original row 503, representative 2055.
def source19 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B015.Data.entryAt ⟨122, by decide +kernel⟩

def target19 : Weights.Entry :=
  { word := [0, 2, 10, 10, 8, 12, 8], weights := [0, 1, 1, 0] }

-- Period 7, original row 525, representative 1948.
def source20 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B015.Data.entryAt ⟨15, by decide +kernel⟩

def target20 : Weights.Entry :=
  { word := [0, 4, 0, 4, 8, 12, 4], weights := [1, 0, 0, 1] }

-- Period 7, original row 548, representative 1955.
def source21 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B015.Data.entryAt ⟨22, by decide +kernel⟩

def target21 : Weights.Entry :=
  { word := [0, 4, 0, 12, 8, 12, 4], weights := [1, 0, 1, 0] }

-- Period 7, original row 591, representative 1939.
def source22 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B015.Data.entryAt ⟨6, by decide +kernel⟩

def target22 : Weights.Entry :=
  { word := [0, 4, 2, 8, 8, 12, 2], weights := [0, 1, 1, 0] }

-- Period 7, original row 656, representative 1946.
def source23 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B015.Data.entryAt ⟨13, by decide +kernel⟩

def target23 : Weights.Entry :=
  { word := [0, 4, 8, 4, 8, 12, 2], weights := [1, 0, 1, 0] }

-- Period 7, original row 657, representative 1953.
def source24 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B015.Data.entryAt ⟨20, by decide +kernel⟩

def target24 : Weights.Entry :=
  { word := [0, 4, 8, 4, 8, 12, 4], weights := [1, 0, 0, 1] }

-- Period 7, original row 684, representative 1947.
def source25 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B015.Data.entryAt ⟨14, by decide +kernel⟩

def target25 : Weights.Entry :=
  { word := [0, 4, 8, 12, 8, 12, 2], weights := [1, 0, 1, 0] }

-- Period 7, original row 685, representative 1954.
def source26 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B015.Data.entryAt ⟨21, by decide +kernel⟩

def target26 : Weights.Entry :=
  { word := [0, 4, 8, 12, 8, 12, 4], weights := [1, 0, 1, 0] }

-- Period 7, original row 711, representative 1938.
def source27 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B015.Data.entryAt ⟨5, by decide +kernel⟩

def target27 : Weights.Entry :=
  { word := [0, 4, 10, 8, 8, 12, 2], weights := [0, 1, 1, 0] }

-- Period 7, original row 738, representative 1989.
def source28 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B015.Data.entryAt ⟨56, by decide +kernel⟩

def target28 : Weights.Entry :=
  { word := [0, 6, 0, 12, 8, 4, 2], weights := [0, 1, 1, 0] }

-- Period 7, original row 744, representative 2060.
def source29 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B015.Data.entryAt ⟨127, by decide +kernel⟩

def target29 : Weights.Entry :=
  { word := [0, 6, 0, 12, 8, 12, 8], weights := [0, 1, 1, 0] }

-- Period 7, original row 753, representative 1979.
def source30 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B015.Data.entryAt ⟨46, by decide +kernel⟩

def target30 : Weights.Entry :=
  { word := [0, 6, 2, 8, 8, 4, 2], weights := [0, 1, 1, 0] }

-- Period 7, original row 764, representative 2049.
def source31 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B015.Data.entryAt ⟨116, by decide +kernel⟩

def target31 : Weights.Entry :=
  { word := [0, 6, 2, 8, 8, 12, 8], weights := [0, 1, 1, 0] }

-- Period 7, original row 767, representative 2058.
def source32 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B015.Data.entryAt ⟨125, by decide +kernel⟩

def target32 : Weights.Entry :=
  { word := [0, 6, 8, 4, 8, 12, 8], weights := [0, 0, 1, 0] }

-- Period 7, original row 768, representative 1988.
def source33 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B015.Data.entryAt ⟨55, by decide +kernel⟩

def target33 : Weights.Entry :=
  { word := [0, 6, 8, 12, 8, 4, 2], weights := [0, 1, 1, 0] }

-- Period 7, original row 775, representative 2059.
def source34 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B015.Data.entryAt ⟨126, by decide +kernel⟩

def target34 : Weights.Entry :=
  { word := [0, 6, 8, 12, 8, 12, 8], weights := [0, 0, 1, 0] }

-- Period 7, original row 780, representative 1978.
def source35 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B015.Data.entryAt ⟨45, by decide +kernel⟩

def target35 : Weights.Entry :=
  { word := [0, 6, 10, 8, 8, 4, 2], weights := [0, 1, 1, 0] }

-- Period 7, original row 791, representative 2048.
def source36 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B015.Data.entryAt ⟨115, by decide +kernel⟩

def target36 : Weights.Entry :=
  { word := [0, 6, 10, 8, 8, 12, 8], weights := [0, 1, 1, 0] }

-- Period 7, original row 798, representative 1962.
def source37 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B015.Data.entryAt ⟨29, by decide +kernel⟩

def target37 : Weights.Entry :=
  { word := [0, 8, 0, 0, 1, 12, 4], weights := [0, 0, 1, 1] }

-- Period 7, original row 803, representative 1942.
def source38 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B015.Data.entryAt ⟨9, by decide +kernel⟩

def target38 : Weights.Entry :=
  { word := [0, 8, 0, 0, 9, 12, 4], weights := [0, 0, 1, 1] }

-- Period 7, original row 810, representative 1962.
def source39 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B015.Data.entryAt ⟨29, by decide +kernel⟩

def target39 : Weights.Entry :=
  { word := [0, 8, 0, 4, 0, 12, 4], weights := [0, 0, 1, 1] }

def points39 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6)]

-- Period 7, original row 836, representative 1960.
def source40 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B015.Data.entryAt ⟨27, by decide +kernel⟩

def target40 : Weights.Entry :=
  { word := [0, 8, 0, 4, 8, 12, 4], weights := [1, 0, 0, 1] }

-- Period 7, original row 858, representative 1963.
def source41 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B015.Data.entryAt ⟨30, by decide +kernel⟩

def target41 : Weights.Entry :=
  { word := [0, 8, 0, 8, 1, 12, 4], weights := [0, 1, 1, 0] }

-- Period 7, original row 866, representative 1964.
def source42 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B015.Data.entryAt ⟨31, by decide +kernel⟩

def target42 : Weights.Entry :=
  { word := [0, 8, 0, 8, 8, 12, 4], weights := [0, 1, 0, 1] }

-- Period 7, original row 870, representative 1943.
def source43 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B015.Data.entryAt ⟨10, by decide +kernel⟩

def target43 : Weights.Entry :=
  { word := [0, 8, 0, 8, 9, 12, 4], weights := [0, 1, 1, 0] }

-- Period 7, original row 879, representative 1963.
def source44 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B015.Data.entryAt ⟨30, by decide +kernel⟩

def target44 : Weights.Entry :=
  { word := [0, 8, 0, 12, 0, 12, 4], weights := [1, 0, 1, 0] }

def points44 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6)]

-- Period 7, original row 888, representative 1961.
def source45 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B015.Data.entryAt ⟨28, by decide +kernel⟩

def target45 : Weights.Entry :=
  { word := [0, 8, 0, 12, 8, 12, 4], weights := [1, 0, 1, 0] }

-- Period 7, original row 911, representative 1957.
def source46 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B015.Data.entryAt ⟨24, by decide +kernel⟩

def target46 : Weights.Entry :=
  { word := [0, 8, 1, 4, 8, 12, 4], weights := [1, 0, 0, 1] }

-- Period 7, original row 934, representative 1958.
def source47 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B015.Data.entryAt ⟨25, by decide +kernel⟩

def target47 : Weights.Entry :=
  { word := [0, 8, 1, 12, 8, 12, 4], weights := [1, 0, 1, 0] }

-- Period 7, original row 1006, representative 1935.
def source48 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B015.Data.entryAt ⟨2, by decide +kernel⟩

def target48 : Weights.Entry :=
  { word := [0, 8, 4, 8, 4, 12, 4], weights := [0, 1, 0, 1] }

-- Period 7, original row 1010, representative 1933.
def source49 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B015.Data.entryAt ⟨0, by decide +kernel⟩

def target49 : Weights.Entry :=
  { word := [0, 8, 4, 8, 12, 12, 4], weights := [0, 1, 0, 1] }

-- Period 7, original row 1057, representative 1941.
def source50 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B015.Data.entryAt ⟨8, by decide +kernel⟩

def target50 : Weights.Entry :=
  { word := [0, 8, 8, 8, 4, 12, 4], weights := [0, 1, 0, 1] }

-- Period 7, original row 1062, representative 1940.
def source51 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B015.Data.entryAt ⟨7, by decide +kernel⟩

def target51 : Weights.Entry :=
  { word := [0, 8, 8, 8, 12, 12, 4], weights := [0, 1, 0, 1] }

-- Period 7, original row 1120, representative 1934.
def source52 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B015.Data.entryAt ⟨1, by decide +kernel⟩

def target52 : Weights.Entry :=
  { word := [0, 8, 12, 8, 4, 12, 4], weights := [0, 1, 0, 1] }

-- Period 7, original row 1148, representative 2023.
def source53 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B015.Data.entryAt ⟨90, by decide +kernel⟩

def target53 : Weights.Entry :=
  { word := [0, 9, 0, 4, 0, 12, 8], weights := [1, 0, 3, 0] }

-- Period 7, original row 1168, representative 1967.
def source54 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B015.Data.entryAt ⟨34, by decide +kernel⟩

def target54 : Weights.Entry :=
  { word := [0, 9, 0, 4, 8, 4, 2], weights := [1, 0, 1, 0] }

-- Period 7, original row 1174, representative 2028.
def source55 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B015.Data.entryAt ⟨95, by decide +kernel⟩

def target55 : Weights.Entry :=
  { word := [0, 9, 0, 4, 8, 12, 8], weights := [1, 0, 1, 0] }

-- Period 7, original row 1202, representative 1969.
def source56 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B015.Data.entryAt ⟨36, by decide +kernel⟩

def target56 : Weights.Entry :=
  { word := [0, 9, 0, 12, 0, 4, 2], weights := [1, 0, 1, 0] }

-- Period 7, original row 1208, representative 2030.
def source57 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B015.Data.entryAt ⟨97, by decide +kernel⟩

def target57 : Weights.Entry :=
  { word := [0, 9, 0, 12, 0, 12, 8], weights := [1, 0, 1, 0] }

-- Period 7, original row 1227, representative 1968.
def source58 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B015.Data.entryAt ⟨35, by decide +kernel⟩

def target58 : Weights.Entry :=
  { word := [0, 9, 0, 12, 8, 4, 2], weights := [1, 0, 1, 0] }

-- Period 7, original row 1233, representative 2029.
def source59 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B015.Data.entryAt ⟨96, by decide +kernel⟩

def target59 : Weights.Entry :=
  { word := [0, 9, 0, 12, 8, 12, 8], weights := [1, 0, 1, 0] }

-- Period 7, original row 1286, representative 2024.
def source60 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B015.Data.entryAt ⟨91, by decide +kernel⟩

def target60 : Weights.Entry :=
  { word := [0, 9, 8, 4, 4, 12, 8], weights := [1, 0, 0, 1] }

-- Period 7, original row 1294, representative 2025.
def source61 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B015.Data.entryAt ⟨92, by decide +kernel⟩

def target61 : Weights.Entry :=
  { word := [0, 9, 8, 4, 12, 12, 8], weights := [1, 0, 0, 1] }

-- Period 7, original row 1316, representative 2027.
def source62 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B015.Data.entryAt ⟨94, by decide +kernel⟩

def target62 : Weights.Entry :=
  { word := [0, 9, 8, 12, 4, 12, 8], weights := [1, 0, 0, 1] }

-- Period 7, original row 1323, representative 2026.
def source63 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B015.Data.entryAt ⟨93, by decide +kernel⟩

def target63 : Weights.Entry :=
  { word := [0, 9, 8, 12, 12, 12, 8], weights := [1, 0, 0, 1] }

-- Period 7, original row 1340, representative 2023.
def source64 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B015.Data.entryAt ⟨90, by decide +kernel⟩

def target64 : Weights.Entry :=
  { word := [0, 10, 0, 0, 1, 12, 8], weights := [0, 1, 3, 0] }

def points64 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6)]

-- Period 7, original row 1344, representative 1969.
def source65 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B015.Data.entryAt ⟨36, by decide +kernel⟩

def target65 : Weights.Entry :=
  { word := [0, 10, 0, 8, 1, 4, 2], weights := [0, 1, 1, 0] }

def points65 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6)]

-- Period 7, original row 1350, representative 2030.
def source66 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B015.Data.entryAt ⟨97, by decide +kernel⟩

def target66 : Weights.Entry :=
  { word := [0, 10, 0, 8, 1, 12, 8], weights := [0, 1, 1, 0] }

def points66 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6)]

-- Period 7, original row 1366, representative 1990.
def source67 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B015.Data.entryAt ⟨57, by decide +kernel⟩

def target67 : Weights.Entry :=
  { word := [0, 10, 0, 12, 8, 4, 2], weights := [0, 1, 1, 0] }

-- Period 7, original row 1386, representative 1982.
def source68 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B015.Data.entryAt ⟨49, by decide +kernel⟩

def target68 : Weights.Entry :=
  { word := [0, 10, 2, 2, 8, 4, 2], weights := [0, 1, 0, 1] }

-- Period 7, original row 1406, representative 2052.
def source69 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B015.Data.entryAt ⟨119, by decide +kernel⟩

def target69 : Weights.Entry :=
  { word := [0, 10, 2, 2, 8, 12, 8], weights := [0, 1, 0, 1] }

-- Period 7, original row 1418, representative 1983.
def source70 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B015.Data.entryAt ⟨50, by decide +kernel⟩

def target70 : Weights.Entry :=
  { word := [0, 10, 2, 10, 8, 4, 2], weights := [0, 1, 1, 0] }

-- Period 7, original row 1434, representative 2053.
def source71 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B015.Data.entryAt ⟨120, by decide +kernel⟩

def target71 : Weights.Entry :=
  { word := [0, 10, 2, 10, 8, 12, 8], weights := [0, 1, 1, 0] }

-- Period 7, original row 1442, representative 2016.
def source72 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B015.Data.entryAt ⟨83, by decide +kernel⟩

def target72 : Weights.Entry :=
  { word := [0, 10, 8, 4, 12, 12, 8], weights := [1, 0, 2, 1] }

-- Period 7, original row 1445, representative 2008.
def source73 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B015.Data.entryAt ⟨75, by decide +kernel⟩

def target73 : Weights.Entry :=
  { word := [0, 10, 8, 8, 4, 6, 8], weights := [0, 1, 1, 0] }

-- Period 7, original row 1450, representative 2004.
def source74 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B015.Data.entryAt ⟨71, by decide +kernel⟩

def target74 : Weights.Entry :=
  { word := [0, 10, 8, 8, 12, 6, 8], weights := [0, 1, 1, 0] }

-- Period 7, original row 1454, representative 2020.
def source75 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B015.Data.entryAt ⟨87, by decide +kernel⟩

def target75 : Weights.Entry :=
  { word := [0, 10, 8, 12, 4, 12, 8], weights := [0, 1, 1, 0] }

-- Period 7, original row 1456, representative 2017.
def source76 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B015.Data.entryAt ⟨84, by decide +kernel⟩

def target76 : Weights.Entry :=
  { word := [0, 10, 8, 12, 12, 12, 8], weights := [0, 1, 1, 0] }

-- Period 7, original row 1461, representative 1980.
def source77 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B015.Data.entryAt ⟨47, by decide +kernel⟩

def target77 : Weights.Entry :=
  { word := [0, 10, 10, 2, 8, 4, 2], weights := [0, 1, 0, 1] }

-- Period 7, original row 1481, representative 2050.
def source78 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B015.Data.entryAt ⟨117, by decide +kernel⟩

def target78 : Weights.Entry :=
  { word := [0, 10, 10, 2, 8, 12, 8], weights := [0, 1, 0, 1] }

-- Period 7, original row 1486, representative 1981.
def source79 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B015.Data.entryAt ⟨48, by decide +kernel⟩

def target79 : Weights.Entry :=
  { word := [0, 10, 10, 10, 8, 4, 2], weights := [0, 1, 1, 0] }

-- Period 7, original row 1502, representative 2051.
def source80 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B015.Data.entryAt ⟨118, by decide +kernel⟩

def target80 : Weights.Entry :=
  { word := [0, 10, 10, 10, 8, 12, 8], weights := [0, 1, 1, 0] }

-- Period 7, original row 1524, representative 1949.
def source81 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B015.Data.entryAt ⟨16, by decide +kernel⟩

def target81 : Weights.Entry :=
  { word := [0, 12, 0, 4, 8, 12, 4], weights := [1, 0, 0, 1] }

-- Period 7, original row 1547, representative 1952.
def source82 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B015.Data.entryAt ⟨19, by decide +kernel⟩

def target82 : Weights.Entry :=
  { word := [0, 12, 0, 12, 8, 12, 4], weights := [1, 0, 1, 0] }

-- Period 7, original row 1590, representative 1937.
def source83 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B015.Data.entryAt ⟨4, by decide +kernel⟩

def target83 : Weights.Entry :=
  { word := [0, 12, 2, 8, 8, 12, 2], weights := [0, 1, 1, 0] }

-- Period 7, original row 1655, representative 1944.
def source84 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B015.Data.entryAt ⟨11, by decide +kernel⟩

def target84 : Weights.Entry :=
  { word := [0, 12, 8, 4, 8, 12, 2], weights := [1, 0, 1, 0] }

-- Period 7, original row 1656, representative 1950.
def source85 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B015.Data.entryAt ⟨17, by decide +kernel⟩

def target85 : Weights.Entry :=
  { word := [0, 12, 8, 4, 8, 12, 4], weights := [1, 0, 0, 1] }

-- Period 7, original row 1683, representative 1945.
def source86 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B015.Data.entryAt ⟨12, by decide +kernel⟩

def target86 : Weights.Entry :=
  { word := [0, 12, 8, 12, 8, 12, 2], weights := [1, 0, 1, 0] }

-- Period 7, original row 1684, representative 1951.
def source87 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B015.Data.entryAt ⟨18, by decide +kernel⟩

def target87 : Weights.Entry :=
  { word := [0, 12, 8, 12, 8, 12, 4], weights := [1, 0, 1, 0] }

-- Period 7, original row 1710, representative 1936.
def source88 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B015.Data.entryAt ⟨3, by decide +kernel⟩

def target88 : Weights.Entry :=
  { word := [0, 12, 10, 8, 8, 12, 2], weights := [0, 1, 1, 0] }

-- Period 7, original row 1756, representative 1956.
def source89 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B015.Data.entryAt ⟨23, by decide +kernel⟩

def target89 : Weights.Entry :=
  { word := [1, 0, 1, 4, 8, 12, 4], weights := [1, 0, 0, 1] }

def points89 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 1779, representative 1959.
def source90 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B015.Data.entryAt ⟨26, by decide +kernel⟩

def target90 : Weights.Entry :=
  { word := [1, 0, 1, 12, 8, 12, 4], weights := [1, 0, 1, 0] }

def points90 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 1880, representative 1939.
def source91 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B015.Data.entryAt ⟨6, by decide +kernel⟩

def target91 : Weights.Entry :=
  { word := [1, 4, 2, 8, 8, 12, 2], weights := [0, 1, 1, 0] }

def points91 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 1940, representative 1946.
def source92 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B015.Data.entryAt ⟨13, by decide +kernel⟩

def target92 : Weights.Entry :=
  { word := [1, 4, 8, 4, 8, 12, 2], weights := [1, 0, 1, 0] }

def points92 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 1941, representative 1953.
def source93 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B015.Data.entryAt ⟨20, by decide +kernel⟩

def target93 : Weights.Entry :=
  { word := [1, 4, 8, 4, 8, 12, 4], weights := [1, 0, 0, 1] }

def points93 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 1968, representative 1947.
def source94 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B015.Data.entryAt ⟨14, by decide +kernel⟩

def target94 : Weights.Entry :=
  { word := [1, 4, 8, 12, 8, 12, 2], weights := [1, 0, 1, 0] }

def points94 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 1969, representative 1954.
def source95 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B015.Data.entryAt ⟨21, by decide +kernel⟩

def target95 : Weights.Entry :=
  { word := [1, 4, 8, 12, 8, 12, 4], weights := [1, 0, 1, 0] }

def points95 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 1995, representative 1938.
def source96 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B015.Data.entryAt ⟨5, by decide +kernel⟩

def target96 : Weights.Entry :=
  { word := [1, 4, 10, 8, 8, 12, 2], weights := [0, 1, 1, 0] }

def points96 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 2041, representative 1957.
def source97 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B015.Data.entryAt ⟨24, by decide +kernel⟩

def target97 : Weights.Entry :=
  { word := [1, 8, 1, 4, 8, 12, 4], weights := [1, 0, 0, 1] }

def points97 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 2064, representative 1958.
def source98 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B015.Data.entryAt ⟨25, by decide +kernel⟩

def target98 : Weights.Entry :=
  { word := [1, 8, 1, 12, 8, 12, 4], weights := [1, 0, 1, 0] }

def points98 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 2239, representative 1937.
def source99 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B015.Data.entryAt ⟨4, by decide +kernel⟩

def target99 : Weights.Entry :=
  { word := [1, 12, 2, 8, 8, 12, 2], weights := [0, 1, 1, 0] }

def points99 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 2299, representative 1944.
def source100 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B015.Data.entryAt ⟨11, by decide +kernel⟩

def target100 : Weights.Entry :=
  { word := [1, 12, 8, 4, 8, 12, 2], weights := [1, 0, 1, 0] }

def points100 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 2300, representative 1950.
def source101 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B015.Data.entryAt ⟨17, by decide +kernel⟩

def target101 : Weights.Entry :=
  { word := [1, 12, 8, 4, 8, 12, 4], weights := [1, 0, 0, 1] }

def points101 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 2327, representative 1945.
def source102 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B015.Data.entryAt ⟨12, by decide +kernel⟩

def target102 : Weights.Entry :=
  { word := [1, 12, 8, 12, 8, 12, 2], weights := [1, 0, 1, 0] }

def points102 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 2328, representative 1951.
def source103 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B015.Data.entryAt ⟨18, by decide +kernel⟩

def target103 : Weights.Entry :=
  { word := [1, 12, 8, 12, 8, 12, 4], weights := [1, 0, 1, 0] }

def points103 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 2354, representative 1936.
def source104 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B015.Data.entryAt ⟨3, by decide +kernel⟩

def target104 : Weights.Entry :=
  { word := [1, 12, 10, 8, 8, 12, 2], weights := [0, 1, 1, 0] }

def points104 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 7, original row 2589, representative 1997.
def source105 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B015.Data.entryAt ⟨64, by decide +kernel⟩

def target105 : Weights.Entry :=
  { word := [2, 2, 0, 9, 8, 2, 2], weights := [1, 1, 0, 1] }

-- Period 7, original row 2596, representative 1992.
def source106 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B015.Data.entryAt ⟨59, by decide +kernel⟩

def target106 : Weights.Entry :=
  { word := [2, 2, 0, 9, 8, 10, 2], weights := [1, 1, 0, 1] }

-- Period 7, original row 2599, representative 1972.
def source107 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B015.Data.entryAt ⟨39, by decide +kernel⟩

def target107 : Weights.Entry :=
  { word := [2, 2, 0, 10, 0, 0, 2], weights := [1, 1, 0, 0] }

def points107 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 3), (4, 5), (5, 4), (6, 6)]

-- Period 7, original row 2616, representative 1999.
def source108 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B015.Data.entryAt ⟨66, by decide +kernel⟩

def target108 : Weights.Entry :=
  { word := [2, 2, 0, 12, 10, 0, 2], weights := [1, 1, 0, 1] }

def points108 : List (ℕ × ℕ) := [(0, 1), (1, 2), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 2627, representative 2001.
def source109 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B015.Data.entryAt ⟨68, by decide +kernel⟩

def target109 : Weights.Entry :=
  { word := [2, 2, 2, 8, 1, 0, 2], weights := [1, 1, 0, 1] }

-- Period 7, original row 2641, representative 2000.
def source110 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B015.Data.entryAt ⟨67, by decide +kernel⟩

def target110 : Weights.Entry :=
  { word := [2, 2, 2, 8, 9, 0, 2], weights := [1, 1, 0, 1] }

-- Period 7, original row 2660, representative 1970.
def source111 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B015.Data.entryAt ⟨37, by decide +kernel⟩

def target111 : Weights.Entry :=
  { word := [2, 2, 8, 2, 0, 8, 2], weights := [1, 0, 0, 1] }

-- Period 7, original row 2694, representative 1996.
def source112 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B015.Data.entryAt ⟨63, by decide +kernel⟩

def target112 : Weights.Entry :=
  { word := [2, 2, 8, 9, 8, 2, 2], weights := [1, 1, 0, 1] }

-- Period 7, original row 2701, representative 1991.
def source113 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B015.Data.entryAt ⟨58, by decide +kernel⟩

def target113 : Weights.Entry :=
  { word := [2, 2, 8, 9, 8, 10, 2], weights := [1, 1, 0, 1] }

-- Period 7, original row 2710, representative 1971.
def source114 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B015.Data.entryAt ⟨38, by decide +kernel⟩

def target114 : Weights.Entry :=
  { word := [2, 2, 8, 10, 0, 8, 2], weights := [1, 0, 0, 1] }

-- Period 7, original row 2734, representative 1997.
def source115 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B015.Data.entryAt ⟨64, by decide +kernel⟩

def target115 : Weights.Entry :=
  { word := [2, 2, 8, 12, 2, 0, 2], weights := [1, 1, 0, 1] }

def points115 : List (ℕ × ℕ) := [(0, 2), (1, 0), (2, 1), (3, 6), (4, 3), (5, 5), (6, 4)]

-- Period 7, original row 2740, representative 1994.
def source116 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B015.Data.entryAt ⟨61, by decide +kernel⟩

def target116 : Weights.Entry :=
  { word := [2, 2, 8, 12, 2, 8, 2], weights := [1, 1, 1, 1] }

-- Period 7, original row 2750, representative 1995.
def source117 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B015.Data.entryAt ⟨62, by decide +kernel⟩

def target117 : Weights.Entry :=
  { word := [2, 2, 8, 12, 10, 0, 2], weights := [1, 1, 1, 0] }

-- Period 7, original row 2756, representative 1993.
def source118 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B015.Data.entryAt ⟨60, by decide +kernel⟩

def target118 : Weights.Entry :=
  { word := [2, 2, 8, 12, 10, 8, 2], weights := [1, 1, 1, 1] }

-- Period 7, original row 2769, representative 1999.
def source119 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B015.Data.entryAt ⟨66, by decide +kernel⟩

def target119 : Weights.Entry :=
  { word := [2, 2, 10, 8, 1, 0, 2], weights := [1, 1, 0, 1] }

def points119 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 4), (4, 5), (5, 3), (6, 6)]

-- Period 7, original row 2783, representative 1998.
def source120 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B015.Data.entryAt ⟨65, by decide +kernel⟩

def target120 : Weights.Entry :=
  { word := [2, 2, 10, 8, 9, 0, 2], weights := [1, 1, 0, 1] }

-- Period 7, original row 3165, representative 1962.
def source121 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B015.Data.entryAt ⟨29, by decide +kernel⟩

def target121 : Weights.Entry :=
  { word := [2, 10, 0, 1, 0, 8, 0], weights := [1, 1, 0, 0] }

def points121 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 3167, representative 1962.
def source122 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B015.Data.entryAt ⟨29, by decide +kernel⟩

def target122 : Weights.Entry :=
  { word := [2, 10, 0, 2, 0, 8, 0], weights := [1, 1, 0, 0] }

def points122 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 5), (4, 6), (5, 4), (6, 3)]

-- Period 7, original row 3173, representative 1963.
def source123 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B015.Data.entryAt ⟨30, by decide +kernel⟩

def target123 : Weights.Entry :=
  { word := [2, 10, 0, 9, 0, 8, 0], weights := [0, 1, 1, 0] }

def points123 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 3194, representative 1963.
def source124 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B015.Data.entryAt ⟨30, by decide +kernel⟩

def target124 : Weights.Entry :=
  { word := [2, 10, 0, 10, 0, 8, 0], weights := [0, 1, 0, 1] }

def points124 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 5), (4, 6), (5, 4), (6, 3)]

-- Period 7, original row 3230, representative 1935.
def source125 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B015.Data.entryAt ⟨2, by decide +kernel⟩

def target125 : Weights.Entry :=
  { word := [2, 10, 2, 8, 2, 8, 0], weights := [1, 0, 1, 0] }

def points125 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 3232, representative 1941.
def source126 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B015.Data.entryAt ⟨8, by decide +kernel⟩

def target126 : Weights.Entry :=
  { word := [2, 10, 2, 8, 8, 8, 0], weights := [1, 0, 1, 0] }

def points126 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 3244, representative 1934.
def source127 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B015.Data.entryAt ⟨1, by decide +kernel⟩

def target127 : Weights.Entry :=
  { word := [2, 10, 2, 8, 10, 8, 0], weights := [1, 0, 1, 0] }

def points127 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

def period7Entries : List Weights.Entry := [target0, target1, target2, target3, target4, target5, target6, target7, target8, target9, target10, target11, target12, target13, target14, target15, target16, target17, target18, target19, target20, target21, target22, target23, target24, target25, target26, target27, target28, target29, target30, target31, target32, target33, target34, target35, target36, target37, target38, target39, target40, target41, target42, target43, target44, target45, target46, target47, target48, target49, target50, target51, target52, target53, target54, target55, target56, target57, target58, target59, target60, target61, target62, target63, target64, target65, target66, target67, target68, target69, target70, target71, target72, target73, target74, target75, target76, target77, target78, target79, target80, target81, target82, target83, target84, target85, target86, target87, target88, target89, target90, target91, target92, target93, target94, target95, target96, target97, target98, target99, target100, target101, target102, target103, target104, target105, target106, target107, target108, target109, target110, target111, target112, target113, target114, target115, target116, target117, target118, target119, target120, target121, target122, target123, target124, target125, target126, target127]

def period7Chunk : RowCoverage.Chunk where
  rows := [⟨19, target0⟩, ⟨42, target1⟩, ⟨136, target2⟩, ⟨142, target3⟩, ⟨215, target4⟩, ⟨232, target5⟩, ⟨265, target6⟩, ⟨295, target7⟩, ⟨301, target8⟩, ⟨343, target9⟩, ⟨363, target10⟩, ⟨392, target11⟩, ⟨408, target12⟩, ⟨413, target13⟩, ⟨418, target14⟩, ⟨441, target15⟩, ⟨461, target16⟩, ⟨466, target17⟩, ⟨487, target18⟩, ⟨503, target19⟩, ⟨525, target20⟩, ⟨548, target21⟩, ⟨591, target22⟩, ⟨656, target23⟩, ⟨657, target24⟩, ⟨684, target25⟩, ⟨685, target26⟩, ⟨711, target27⟩, ⟨738, target28⟩, ⟨744, target29⟩, ⟨753, target30⟩, ⟨764, target31⟩, ⟨767, target32⟩, ⟨768, target33⟩, ⟨775, target34⟩, ⟨780, target35⟩, ⟨791, target36⟩, ⟨798, target37⟩, ⟨803, target38⟩, ⟨810, target39⟩, ⟨836, target40⟩, ⟨858, target41⟩, ⟨866, target42⟩, ⟨870, target43⟩, ⟨879, target44⟩, ⟨888, target45⟩, ⟨911, target46⟩, ⟨934, target47⟩, ⟨1006, target48⟩, ⟨1010, target49⟩, ⟨1057, target50⟩, ⟨1062, target51⟩, ⟨1120, target52⟩, ⟨1148, target53⟩, ⟨1168, target54⟩, ⟨1174, target55⟩, ⟨1202, target56⟩, ⟨1208, target57⟩, ⟨1227, target58⟩, ⟨1233, target59⟩, ⟨1286, target60⟩, ⟨1294, target61⟩, ⟨1316, target62⟩, ⟨1323, target63⟩, ⟨1340, target64⟩, ⟨1344, target65⟩, ⟨1350, target66⟩, ⟨1366, target67⟩, ⟨1386, target68⟩, ⟨1406, target69⟩, ⟨1418, target70⟩, ⟨1434, target71⟩, ⟨1442, target72⟩, ⟨1445, target73⟩, ⟨1450, target74⟩, ⟨1454, target75⟩, ⟨1456, target76⟩, ⟨1461, target77⟩, ⟨1481, target78⟩, ⟨1486, target79⟩, ⟨1502, target80⟩, ⟨1524, target81⟩, ⟨1547, target82⟩, ⟨1590, target83⟩, ⟨1655, target84⟩, ⟨1656, target85⟩, ⟨1683, target86⟩, ⟨1684, target87⟩, ⟨1710, target88⟩, ⟨1756, target89⟩, ⟨1779, target90⟩, ⟨1880, target91⟩, ⟨1940, target92⟩, ⟨1941, target93⟩, ⟨1968, target94⟩, ⟨1969, target95⟩, ⟨1995, target96⟩, ⟨2041, target97⟩, ⟨2064, target98⟩, ⟨2239, target99⟩, ⟨2299, target100⟩, ⟨2300, target101⟩, ⟨2327, target102⟩, ⟨2328, target103⟩, ⟨2354, target104⟩, ⟨2589, target105⟩, ⟨2596, target106⟩, ⟨2599, target107⟩, ⟨2616, target108⟩, ⟨2627, target109⟩, ⟨2641, target110⟩, ⟨2660, target111⟩, ⟨2694, target112⟩, ⟨2701, target113⟩, ⟨2710, target114⟩, ⟨2734, target115⟩, ⟨2740, target116⟩, ⟨2750, target117⟩, ⟨2756, target118⟩, ⟨2769, target119⟩, ⟨2783, target120⟩, ⟨3165, target121⟩, ⟨3167, target122⟩, ⟨3173, target123⟩, ⟨3194, target124⟩, ⟨3230, target125⟩, ⟨3232, target126⟩, ⟨3244, target127⟩]
  indexMask := 34788720006515766372569999506879092677833749062761870775359739156906817875044051388967954378764895168586771742346567617040902814609390186016734126417348878357484531256246647931183777518391185028368725513615068165949333624745708583831604220584386172721910644541652519895715198075469309288008093633046977009497423483470272299162500619156134529492273599920749074744547016033164342819810386892847707753940893870610903731253747770294386807148992717569536908868558859000301204137344519230428553859294088281662448495846372253023885952288715459609889701991429551301206245126018535730690867425812067082823901467052696707550049589215359288746996351016555786839749082375988630247671680812934621245378335848830921277195151617134147918897329827441497003349410314818301631601471976892849576070280658615587419104709763536477176573597268824000664292717862033259653382118638969840731818051065820610101264170781127508283821007173622782161075322038937586935935376388724607547059434685822602313728
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

end FranklSmallCyclic.TransportBatches.G015.B000.Data
