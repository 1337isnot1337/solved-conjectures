module

public import Conjectures.FranklSmallCyclicRowCoverage
public import Conjectures.FranklSmallCyclicCanonicalWords
public import Conjectures.FranklSmallCyclicOrbit7Block014Data

/-! 128 literal targets sharing one source proof block.
Original words and row indices are retained; weights may be transported.
-/
@[expose] public section

namespace FranklSmallCyclic.TransportBatches.G014.B000.Data

-- Period 7, original row 151, representative 1854.
def source0 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B014.Data.entryAt ⟨49, by decide +kernel⟩

def target0 : Weights.Entry :=
  { word := [0, 1, 4, 2, 0, 8, 4], weights := [1, 0, 0, 1] }

-- Period 7, original row 162, representative 1855.
def source1 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B014.Data.entryAt ⟨50, by decide +kernel⟩

def target1 : Weights.Entry :=
  { word := [0, 1, 4, 2, 8, 8, 4], weights := [1, 0, 0, 1] }

-- Period 7, original row 179, representative 1861.
def source2 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B014.Data.entryAt ⟨56, by decide +kernel⟩

def target2 : Weights.Entry :=
  { word := [0, 1, 4, 10, 0, 8, 4], weights := [1, 0, 0, 1] }

-- Period 7, original row 186, representative 1888.
def source3 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B014.Data.entryAt ⟨83, by decide +kernel⟩

def target3 : Weights.Entry :=
  { word := [0, 1, 4, 10, 0, 12, 2], weights := [1, 0, 1, 1] }

-- Period 7, original row 194, representative 1858.
def source4 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B014.Data.entryAt ⟨53, by decide +kernel⟩

def target4 : Weights.Entry :=
  { word := [0, 1, 4, 10, 8, 8, 4], weights := [1, 0, 0, 1] }

-- Period 7, original row 240, representative 1859.
def source5 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B014.Data.entryAt ⟨54, by decide +kernel⟩

def target5 : Weights.Entry :=
  { word := [0, 1, 12, 2, 0, 8, 4], weights := [1, 0, 0, 1] }

-- Period 7, original row 251, representative 1856.
def source6 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B014.Data.entryAt ⟨51, by decide +kernel⟩

def target6 : Weights.Entry :=
  { word := [0, 1, 12, 2, 8, 8, 4], weights := [1, 0, 0, 1] }

-- Period 7, original row 272, representative 1860.
def source7 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B014.Data.entryAt ⟨55, by decide +kernel⟩

def target7 : Weights.Entry :=
  { word := [0, 1, 12, 10, 0, 8, 4], weights := [1, 0, 0, 1] }

-- Period 7, original row 279, representative 1887.
def source8 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B014.Data.entryAt ⟨82, by decide +kernel⟩

def target8 : Weights.Entry :=
  { word := [0, 1, 12, 10, 0, 12, 2], weights := [1, 0, 1, 1] }

-- Period 7, original row 287, representative 1857.
def source9 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B014.Data.entryAt ⟨52, by decide +kernel⟩

def target9 : Weights.Entry :=
  { word := [0, 1, 12, 10, 8, 8, 4], weights := [1, 0, 0, 1] }

-- Period 7, original row 323, representative 1854.
def source10 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B014.Data.entryAt ⟨49, by decide +kernel⟩

def target10 : Weights.Entry :=
  { word := [0, 2, 2, 2, 0, 8, 4], weights := [0, 1, 0, 1] }

def points10 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6)]

-- Period 7, original row 334, representative 1862.
def source11 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B014.Data.entryAt ⟨57, by decide +kernel⟩

def target11 : Weights.Entry :=
  { word := [0, 2, 2, 2, 8, 0, 4], weights := [1, 0, 0, 1] }

-- Period 7, original row 351, representative 1850.
def source12 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B014.Data.entryAt ⟨45, by decide +kernel⟩

def target12 : Weights.Entry :=
  { word := [0, 2, 2, 2, 8, 8, 4], weights := [1, 0, 0, 1] }

-- Period 7, original row 361, representative 1880.
def source13 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B014.Data.entryAt ⟨75, by decide +kernel⟩

def target13 : Weights.Entry :=
  { word := [0, 2, 2, 2, 8, 12, 2], weights := [0, 1, 0, 1] }

-- Period 7, original row 371, representative 1861.
def source14 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B014.Data.entryAt ⟨56, by decide +kernel⟩

def target14 : Weights.Entry :=
  { word := [0, 2, 2, 10, 0, 8, 4], weights := [0, 1, 0, 1] }

def points14 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6)]

-- Period 7, original row 378, representative 1888.
def source15 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B014.Data.entryAt ⟨83, by decide +kernel⟩

def target15 : Weights.Entry :=
  { word := [0, 2, 2, 10, 0, 12, 2], weights := [0, 1, 1, 1] }

def points15 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6)]

-- Period 7, original row 385, representative 1863.
def source16 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B014.Data.entryAt ⟨58, by decide +kernel⟩

def target16 : Weights.Entry :=
  { word := [0, 2, 2, 10, 8, 0, 4], weights := [1, 1, 0, 0] }

-- Period 7, original row 399, representative 1853.
def source17 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B014.Data.entryAt ⟨48, by decide +kernel⟩

def target17 : Weights.Entry :=
  { word := [0, 2, 2, 10, 8, 8, 4], weights := [1, 0, 0, 1] }

-- Period 7, original row 406, representative 1881.
def source18 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B014.Data.entryAt ⟨76, by decide +kernel⟩

def target18 : Weights.Entry :=
  { word := [0, 2, 2, 10, 8, 12, 2], weights := [0, 1, 1, 0] }

-- Period 7, original row 428, representative 1859.
def source19 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B014.Data.entryAt ⟨54, by decide +kernel⟩

def target19 : Weights.Entry :=
  { word := [0, 2, 10, 2, 0, 8, 4], weights := [0, 1, 0, 1] }

def points19 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6)]

-- Period 7, original row 449, representative 1851.
def source20 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B014.Data.entryAt ⟨46, by decide +kernel⟩

def target20 : Weights.Entry :=
  { word := [0, 2, 10, 2, 8, 8, 4], weights := [1, 0, 0, 1] }

-- Period 7, original row 459, representative 1878.
def source21 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B014.Data.entryAt ⟨73, by decide +kernel⟩

def target21 : Weights.Entry :=
  { word := [0, 2, 10, 2, 8, 12, 2], weights := [0, 1, 0, 1] }

-- Period 7, original row 473, representative 1860.
def source22 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B014.Data.entryAt ⟨55, by decide +kernel⟩

def target22 : Weights.Entry :=
  { word := [0, 2, 10, 10, 0, 8, 4], weights := [0, 1, 0, 1] }

def points22 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6)]

-- Period 7, original row 480, representative 1887.
def source23 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B014.Data.entryAt ⟨82, by decide +kernel⟩

def target23 : Weights.Entry :=
  { word := [0, 2, 10, 10, 0, 12, 2], weights := [0, 1, 1, 1] }

def points23 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 4), (4, 3), (5, 5), (6, 6)]

-- Period 7, original row 494, representative 1852.
def source24 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B014.Data.entryAt ⟨47, by decide +kernel⟩

def target24 : Weights.Entry :=
  { word := [0, 2, 10, 10, 8, 8, 4], weights := [1, 0, 0, 1] }

-- Period 7, original row 501, representative 1879.
def source25 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B014.Data.entryAt ⟨74, by decide +kernel⟩

def target25 : Weights.Entry :=
  { word := [0, 2, 10, 10, 8, 12, 2], weights := [0, 1, 1, 0] }

-- Period 7, original row 763, representative 1873.
def source26 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B014.Data.entryAt ⟨68, by decide +kernel⟩

def target26 : Weights.Entry :=
  { word := [0, 6, 2, 8, 8, 12, 2], weights := [0, 1, 1, 0] }

-- Period 7, original row 773, representative 1882.
def source27 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B014.Data.entryAt ⟨77, by decide +kernel⟩

def target27 : Weights.Entry :=
  { word := [0, 6, 8, 12, 8, 12, 2], weights := [0, 1, 1, 0] }

-- Period 7, original row 790, representative 1872.
def source28 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B014.Data.entryAt ⟨67, by decide +kernel⟩

def target28 : Weights.Entry :=
  { word := [0, 6, 10, 8, 8, 12, 2], weights := [0, 1, 1, 0] }

-- Period 7, original row 1124, representative 1932.
def source29 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B014.Data.entryAt ⟨127, by decide +kernel⟩

def target29 : Weights.Entry :=
  { word := [0, 8, 12, 8, 12, 12, 4], weights := [0, 1, 0, 1] }

-- Period 7, original row 1128, representative 1820.
def source30 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B014.Data.entryAt ⟨15, by decide +kernel⟩

def target30 : Weights.Entry :=
  { word := [0, 9, 0, 1, 4, 8, 4], weights := [0, 1, 0, 0] }

-- Period 7, original row 1134, representative 1823.
def source31 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B014.Data.entryAt ⟨18, by decide +kernel⟩

def target31 : Weights.Entry :=
  { word := [0, 9, 0, 1, 12, 8, 4], weights := [0, 1, 0, 0] }

-- Period 7, original row 1152, representative 1834.
def source32 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B014.Data.entryAt ⟨29, by decide +kernel⟩

def target32 : Weights.Entry :=
  { word := [0, 9, 0, 4, 2, 0, 4], weights := [1, 0, 0, 1] }

-- Period 7, original row 1158, representative 1830.
def source33 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B014.Data.entryAt ⟨25, by decide +kernel⟩

def target33 : Weights.Entry :=
  { word := [0, 9, 0, 4, 2, 8, 4], weights := [1, 0, 0, 1] }

-- Period 7, original row 1178, representative 1835.
def source34 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B014.Data.entryAt ⟨30, by decide +kernel⟩

def target34 : Weights.Entry :=
  { word := [0, 9, 0, 4, 10, 0, 4], weights := [1, 0, 0, 1] }

-- Period 7, original row 1184, representative 1831.
def source35 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B014.Data.entryAt ⟨26, by decide +kernel⟩

def target35 : Weights.Entry :=
  { word := [0, 9, 0, 4, 10, 8, 4], weights := [1, 0, 0, 1] }

-- Period 7, original row 1212, representative 1837.
def source36 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B014.Data.entryAt ⟨32, by decide +kernel⟩

def target36 : Weights.Entry :=
  { word := [0, 9, 0, 12, 2, 0, 4], weights := [1, 0, 1, 0] }

-- Period 7, original row 1218, representative 1833.
def source37 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B014.Data.entryAt ⟨28, by decide +kernel⟩

def target37 : Weights.Entry :=
  { word := [0, 9, 0, 12, 2, 8, 4], weights := [1, 0, 1, 0] }

-- Period 7, original row 1237, representative 1836.
def source38 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B014.Data.entryAt ⟨31, by decide +kernel⟩

def target38 : Weights.Entry :=
  { word := [0, 9, 0, 12, 10, 0, 4], weights := [1, 0, 1, 0] }

-- Period 7, original row 1243, representative 1832.
def source39 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B014.Data.entryAt ⟨27, by decide +kernel⟩

def target39 : Weights.Entry :=
  { word := [0, 9, 0, 12, 10, 8, 4], weights := [1, 0, 1, 0] }

-- Period 7, original row 1265, representative 1821.
def source40 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B014.Data.entryAt ⟨16, by decide +kernel⟩

def target40 : Weights.Entry :=
  { word := [0, 9, 8, 1, 4, 8, 4], weights := [0, 1, 0, 0] }

-- Period 7, original row 1271, representative 1822.
def source41 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B014.Data.entryAt ⟨17, by decide +kernel⟩

def target41 : Weights.Entry :=
  { word := [0, 9, 8, 1, 12, 8, 4], weights := [0, 1, 0, 0] }

-- Period 7, original row 1377, representative 1828.
def source42 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B014.Data.entryAt ⟨23, by decide +kernel⟩

def target42 : Weights.Entry :=
  { word := [0, 10, 2, 2, 8, 0, 4], weights := [1, 0, 0, 1] }

-- Period 7, original row 1394, representative 1824.
def source43 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B014.Data.entryAt ⟨19, by decide +kernel⟩

def target43 : Weights.Entry :=
  { word := [0, 10, 2, 2, 8, 8, 4], weights := [1, 0, 0, 1] }

-- Period 7, original row 1404, representative 1876.
def source44 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B014.Data.entryAt ⟨71, by decide +kernel⟩

def target44 : Weights.Entry :=
  { word := [0, 10, 2, 2, 8, 12, 2], weights := [0, 1, 0, 1] }

-- Period 7, original row 1411, representative 1829.
def source45 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B014.Data.entryAt ⟨24, by decide +kernel⟩

def target45 : Weights.Entry :=
  { word := [0, 10, 2, 10, 8, 0, 4], weights := [1, 1, 0, 0] }

-- Period 7, original row 1425, representative 1827.
def source46 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B014.Data.entryAt ⟨22, by decide +kernel⟩

def target46 : Weights.Entry :=
  { word := [0, 10, 2, 10, 8, 8, 4], weights := [1, 0, 0, 1] }

-- Period 7, original row 1432, representative 1877.
def source47 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B014.Data.entryAt ⟨72, by decide +kernel⟩

def target47 : Weights.Entry :=
  { word := [0, 10, 2, 10, 8, 12, 2], weights := [0, 1, 1, 0] }

-- Period 7, original row 1469, representative 1825.
def source48 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B014.Data.entryAt ⟨20, by decide +kernel⟩

def target48 : Weights.Entry :=
  { word := [0, 10, 10, 2, 8, 8, 4], weights := [1, 0, 0, 1] }

-- Period 7, original row 1479, representative 1874.
def source49 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B014.Data.entryAt ⟨69, by decide +kernel⟩

def target49 : Weights.Entry :=
  { word := [0, 10, 10, 2, 8, 12, 2], weights := [0, 1, 0, 1] }

-- Period 7, original row 1493, representative 1826.
def source50 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B014.Data.entryAt ⟨21, by decide +kernel⟩

def target50 : Weights.Entry :=
  { word := [0, 10, 10, 10, 8, 8, 4], weights := [1, 0, 0, 1] }

-- Period 7, original row 1500, representative 1875.
def source51 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B014.Data.entryAt ⟨70, by decide +kernel⟩

def target51 : Weights.Entry :=
  { word := [0, 10, 10, 10, 8, 12, 2], weights := [0, 1, 1, 0] }

-- Period 7, original row 2399, representative 1813.
def source52 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B014.Data.entryAt ⟨8, by decide +kernel⟩

def target52 : Weights.Entry :=
  { word := [2, 0, 0, 12, 0, 4, 8], weights := [0, 0, 1, 0] }

-- Period 7, original row 2410, representative 1834.
def source53 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B014.Data.entryAt ⟨29, by decide +kernel⟩

def target53 : Weights.Entry :=
  { word := [2, 0, 4, 2, 0, 8, 1], weights := [1, 0, 0, 1] }

def points53 : List (ℕ × ℕ) := [(0, 2), (1, 0), (2, 1), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 2433, representative 1837.
def source54 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B014.Data.entryAt ⟨32, by decide +kernel⟩

def target54 : Weights.Entry :=
  { word := [2, 0, 4, 10, 0, 8, 1], weights := [0, 1, 0, 1] }

def points54 : List (ℕ × ℕ) := [(0, 2), (1, 0), (2, 1), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 2468, representative 1862.
def source55 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B014.Data.entryAt ⟨57, by decide +kernel⟩

def target55 : Weights.Entry :=
  { word := [2, 0, 8, 4, 4, 4, 0], weights := [0, 0, 1, 1] }

def points55 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 3), (5, 4), (6, 5)]

-- Period 7, original row 2469, representative 1810.
def source56 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B014.Data.entryAt ⟨5, by decide +kernel⟩

def target56 : Weights.Entry :=
  { word := [2, 0, 8, 4, 4, 4, 8], weights := [1, 0, 0, 1] }

-- Period 7, original row 2470, representative 1828.
def source57 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B014.Data.entryAt ⟨23, by decide +kernel⟩

def target57 : Weights.Entry :=
  { word := [2, 0, 8, 4, 4, 12, 0], weights := [1, 0, 0, 1] }

def points57 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 2490, representative 1812.
def source58 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B014.Data.entryAt ⟨7, by decide +kernel⟩

def target58 : Weights.Entry :=
  { word := [2, 0, 8, 12, 0, 4, 8], weights := [0, 0, 1, 0] }

-- Period 7, original row 2498, representative 1863.
def source59 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B014.Data.entryAt ⟨58, by decide +kernel⟩

def target59 : Weights.Entry :=
  { word := [2, 0, 8, 12, 4, 4, 0], weights := [1, 0, 0, 1] }

def points59 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 3), (5, 4), (6, 5)]

-- Period 7, original row 2499, representative 1811.
def source60 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B014.Data.entryAt ⟨6, by decide +kernel⟩

def target60 : Weights.Entry :=
  { word := [2, 0, 8, 12, 4, 4, 8], weights := [1, 0, 0, 1] }

-- Period 7, original row 2500, representative 1829.
def source61 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B014.Data.entryAt ⟨24, by decide +kernel⟩

def target61 : Weights.Entry :=
  { word := [2, 0, 8, 12, 4, 12, 0], weights := [0, 0, 1, 1] }

def points61 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 2506, representative 1816.
def source62 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B014.Data.entryAt ⟨11, by decide +kernel⟩

def target62 : Weights.Entry :=
  { word := [2, 0, 9, 0, 1, 4, 8], weights := [0, 0, 1, 0] }

-- Period 7, original row 2510, representative 1817.
def source63 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B014.Data.entryAt ⟨12, by decide +kernel⟩

def target63 : Weights.Entry :=
  { word := [2, 0, 9, 8, 1, 4, 8], weights := [0, 0, 1, 0] }

-- Period 7, original row 2527, representative 1835.
def source64 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B014.Data.entryAt ⟨30, by decide +kernel⟩

def target64 : Weights.Entry :=
  { word := [2, 0, 12, 2, 0, 8, 1], weights := [1, 0, 0, 1] }

def points64 : List (ℕ × ℕ) := [(0, 2), (1, 0), (2, 1), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 2552, representative 1817.
def source65 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B014.Data.entryAt ⟨12, by decide +kernel⟩

def target65 : Weights.Entry :=
  { word := [2, 0, 12, 10, 0, 4, 8], weights := [1, 0, 0, 0] }

def points65 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 5), (4, 4), (5, 3), (6, 6)]

-- Period 7, original row 2555, representative 1836.
def source66 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B014.Data.entryAt ⟨31, by decide +kernel⟩

def target66 : Weights.Entry :=
  { word := [2, 0, 12, 10, 0, 8, 1], weights := [0, 1, 0, 1] }

def points66 : List (ℕ × ℕ) := [(0, 2), (1, 0), (2, 1), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 2805, representative 1854.
def source67 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B014.Data.entryAt ⟨49, by decide +kernel⟩

def target67 : Weights.Entry :=
  { word := [2, 8, 0, 4, 2, 0, 1], weights := [1, 0, 0, 1] }

def points67 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 2817, representative 1854.
def source68 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B014.Data.entryAt ⟨49, by decide +kernel⟩

def target68 : Weights.Entry :=
  { word := [2, 8, 0, 4, 4, 4, 0], weights := [1, 0, 1, 0] }

def points68 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 5), (4, 6), (5, 4), (6, 3)]

-- Period 7, original row 2825, representative 1807.
def source69 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B014.Data.entryAt ⟨2, by decide +kernel⟩

def target69 : Weights.Entry :=
  { word := [2, 8, 0, 4, 8, 4, 8], weights := [1, 0, 1, 0] }

-- Period 7, original row 2831, representative 1859.
def source70 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B014.Data.entryAt ⟨54, by decide +kernel⟩

def target70 : Weights.Entry :=
  { word := [2, 8, 0, 4, 10, 0, 1], weights := [1, 0, 0, 1] }

def points70 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 2843, representative 1859.
def source71 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B014.Data.entryAt ⟨54, by decide +kernel⟩

def target71 : Weights.Entry :=
  { word := [2, 8, 0, 4, 12, 4, 0], weights := [1, 0, 1, 0] }

def points71 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 5), (4, 6), (5, 4), (6, 3)]

-- Period 7, original row 2851, representative 1809.
def source72 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B014.Data.entryAt ⟨4, by decide +kernel⟩

def target72 : Weights.Entry :=
  { word := [2, 8, 0, 12, 0, 4, 8], weights := [1, 0, 1, 0] }

-- Period 7, original row 2857, representative 1861.
def source73 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B014.Data.entryAt ⟨56, by decide +kernel⟩

def target73 : Weights.Entry :=
  { word := [2, 8, 0, 12, 2, 0, 1], weights := [1, 0, 0, 1] }

def points73 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 2869, representative 1861.
def source74 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B014.Data.entryAt ⟨56, by decide +kernel⟩

def target74 : Weights.Entry :=
  { word := [2, 8, 0, 12, 4, 4, 0], weights := [1, 0, 1, 0] }

def points74 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 5), (4, 6), (5, 4), (6, 3)]

-- Period 7, original row 2870, representative 1806.
def source75 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B014.Data.entryAt ⟨1, by decide +kernel⟩

def target75 : Weights.Entry :=
  { word := [2, 8, 0, 12, 4, 4, 8], weights := [1, 0, 0, 1] }

-- Period 7, original row 2876, representative 1808.
def source76 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B014.Data.entryAt ⟨3, by decide +kernel⟩

def target76 : Weights.Entry :=
  { word := [2, 8, 0, 12, 8, 4, 8], weights := [1, 0, 1, 0] }

-- Period 7, original row 2882, representative 1860.
def source77 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B014.Data.entryAt ⟨55, by decide +kernel⟩

def target77 : Weights.Entry :=
  { word := [2, 8, 0, 12, 10, 0, 1], weights := [1, 0, 0, 1] }

def points77 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 2894, representative 1860.
def source78 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B014.Data.entryAt ⟨55, by decide +kernel⟩

def target78 : Weights.Entry :=
  { word := [2, 8, 0, 12, 12, 4, 0], weights := [1, 0, 1, 0] }

def points78 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 5), (4, 6), (5, 4), (6, 3)]

-- Period 7, original row 2895, representative 1805.
def source79 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B014.Data.entryAt ⟨0, by decide +kernel⟩

def target79 : Weights.Entry :=
  { word := [2, 8, 0, 12, 12, 4, 8], weights := [1, 0, 0, 1] }

-- Period 7, original row 2896, representative 1820.
def source80 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B014.Data.entryAt ⟨15, by decide +kernel⟩

def target80 : Weights.Entry :=
  { word := [2, 8, 2, 0, 1, 8, 1], weights := [0, 0, 1, 0] }

def points80 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 2899, representative 1821.
def source81 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B014.Data.entryAt ⟨16, by decide +kernel⟩

def target81 : Weights.Entry :=
  { word := [2, 8, 2, 0, 9, 8, 1], weights := [0, 0, 1, 0] }

def points81 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 2907, representative 1830.
def source82 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B014.Data.entryAt ⟨25, by decide +kernel⟩

def target82 : Weights.Entry :=
  { word := [2, 8, 4, 2, 0, 8, 1], weights := [1, 0, 0, 1] }

def points82 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 2934, representative 1833.
def source83 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B014.Data.entryAt ⟨28, by decide +kernel⟩

def target83 : Weights.Entry :=
  { word := [2, 8, 4, 10, 0, 8, 1], weights := [0, 1, 0, 1] }

def points83 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 2955, representative 1818.
def source84 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B014.Data.entryAt ⟨13, by decide +kernel⟩

def target84 : Weights.Entry :=
  { word := [2, 8, 8, 0, 1, 4, 8], weights := [0, 0, 1, 0] }

-- Period 7, original row 2969, representative 1855.
def source85 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B014.Data.entryAt ⟨50, by decide +kernel⟩

def target85 : Weights.Entry :=
  { word := [2, 8, 8, 4, 2, 0, 1], weights := [1, 0, 0, 1] }

def points85 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 2981, representative 1850.
def source86 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B014.Data.entryAt ⟨45, by decide +kernel⟩

def target86 : Weights.Entry :=
  { word := [2, 8, 8, 4, 4, 4, 0], weights := [1, 0, 0, 1] }

def points86 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 2983, representative 1824.
def source87 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B014.Data.entryAt ⟨19, by decide +kernel⟩

def target87 : Weights.Entry :=
  { word := [2, 8, 8, 4, 4, 12, 0], weights := [1, 0, 0, 1] }

def points87 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 2999, representative 1856.
def source88 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B014.Data.entryAt ⟨51, by decide +kernel⟩

def target88 : Weights.Entry :=
  { word := [2, 8, 8, 4, 10, 0, 1], weights := [1, 0, 0, 1] }

def points88 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 3011, representative 1851.
def source89 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B014.Data.entryAt ⟨46, by decide +kernel⟩

def target89 : Weights.Entry :=
  { word := [2, 8, 8, 4, 12, 4, 0], weights := [1, 0, 0, 1] }

def points89 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 3013, representative 1825.
def source90 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B014.Data.entryAt ⟨20, by decide +kernel⟩

def target90 : Weights.Entry :=
  { word := [2, 8, 8, 4, 12, 12, 0], weights := [1, 0, 0, 1] }

def points90 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 3017, representative 1819.
def source91 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B014.Data.entryAt ⟨14, by decide +kernel⟩

def target91 : Weights.Entry :=
  { word := [2, 8, 8, 8, 1, 4, 8], weights := [0, 0, 1, 0] }

-- Period 7, original row 3043, representative 1858.
def source92 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B014.Data.entryAt ⟨53, by decide +kernel⟩

def target92 : Weights.Entry :=
  { word := [2, 8, 8, 12, 2, 0, 1], weights := [1, 0, 0, 1] }

def points92 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 3055, representative 1853.
def source93 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B014.Data.entryAt ⟨48, by decide +kernel⟩

def target93 : Weights.Entry :=
  { word := [2, 8, 8, 12, 4, 4, 0], weights := [1, 0, 0, 1] }

def points93 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 3057, representative 1827.
def source94 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B014.Data.entryAt ⟨22, by decide +kernel⟩

def target94 : Weights.Entry :=
  { word := [2, 8, 8, 12, 4, 12, 0], weights := [1, 0, 0, 1] }

def points94 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 3072, representative 1857.
def source95 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B014.Data.entryAt ⟨52, by decide +kernel⟩

def target95 : Weights.Entry :=
  { word := [2, 8, 8, 12, 10, 0, 1], weights := [1, 0, 0, 1] }

def points95 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 3084, representative 1852.
def source96 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B014.Data.entryAt ⟨47, by decide +kernel⟩

def target96 : Weights.Entry :=
  { word := [2, 8, 8, 12, 12, 4, 0], weights := [1, 0, 0, 1] }

def points96 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 3086, representative 1826.
def source97 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B014.Data.entryAt ⟨21, by decide +kernel⟩

def target97 : Weights.Entry :=
  { word := [2, 8, 8, 12, 12, 12, 0], weights := [1, 0, 0, 1] }

def points97 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 3088, representative 1814.
def source98 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B014.Data.entryAt ⟨9, by decide +kernel⟩

def target98 : Weights.Entry :=
  { word := [2, 8, 9, 0, 1, 4, 8], weights := [0, 0, 1, 0] }

-- Period 7, original row 3092, representative 1815.
def source99 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B014.Data.entryAt ⟨10, by decide +kernel⟩

def target99 : Weights.Entry :=
  { word := [2, 8, 9, 8, 1, 4, 8], weights := [0, 0, 1, 0] }

-- Period 7, original row 3104, representative 1823.
def source100 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B014.Data.entryAt ⟨18, by decide +kernel⟩

def target100 : Weights.Entry :=
  { word := [2, 8, 10, 0, 1, 8, 1], weights := [0, 0, 1, 0] }

def points100 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 3107, representative 1822.
def source101 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B014.Data.entryAt ⟨17, by decide +kernel⟩

def target101 : Weights.Entry :=
  { word := [2, 8, 10, 0, 9, 8, 1], weights := [0, 0, 1, 0] }

def points101 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 3115, representative 1831.
def source102 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B014.Data.entryAt ⟨26, by decide +kernel⟩

def target102 : Weights.Entry :=
  { word := [2, 8, 12, 2, 0, 8, 1], weights := [1, 0, 0, 1] }

def points102 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 3142, representative 1832.
def source103 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B014.Data.entryAt ⟨27, by decide +kernel⟩

def target103 : Weights.Entry :=
  { word := [2, 8, 12, 10, 0, 8, 1], weights := [0, 1, 0, 1] }

def points103 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 3169, representative 1915.
def source104 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B014.Data.entryAt ⟨110, by decide +kernel⟩

def target104 : Weights.Entry :=
  { word := [2, 10, 0, 2, 0, 8, 8], weights := [2, 1, 0, 1] }

-- Period 7, original row 3178, representative 1896.
def source105 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B014.Data.entryAt ⟨91, by decide +kernel⟩

def target105 : Weights.Entry :=
  { word := [2, 10, 0, 9, 8, 2, 2], weights := [1, 1, 0, 1] }

-- Period 7, original row 3185, representative 1895.
def source106 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B014.Data.entryAt ⟨90, by decide +kernel⟩

def target106 : Weights.Entry :=
  { word := [2, 10, 0, 9, 8, 10, 2], weights := [1, 1, 0, 1] }

-- Period 7, original row 3188, representative 1866.
def source107 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B014.Data.entryAt ⟨61, by decide +kernel⟩

def target107 : Weights.Entry :=
  { word := [2, 10, 0, 10, 0, 0, 2], weights := [1, 1, 0, 0] }

-- Period 7, original row 3190, representative 1917.
def source108 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B014.Data.entryAt ⟨112, by decide +kernel⟩

def target108 : Weights.Entry :=
  { word := [2, 10, 0, 10, 0, 0, 8], weights := [1, 1, 0, 0] }

-- Period 7, original row 3197, representative 1916.
def source109 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B014.Data.entryAt ⟨111, by decide +kernel⟩

def target109 : Weights.Entry :=
  { word := [2, 10, 0, 10, 0, 8, 8], weights := [1, 0, 0, 1] }

-- Period 7, original row 3205, representative 1888.
def source110 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B014.Data.entryAt ⟨83, by decide +kernel⟩

def target110 : Weights.Entry :=
  { word := [2, 10, 0, 12, 2, 0, 2], weights := [1, 1, 0, 1] }

def points110 : List (ℕ × ℕ) := [(0, 1), (1, 2), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 3207, representative 1923.
def source111 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B014.Data.entryAt ⟨118, by decide +kernel⟩

def target111 : Weights.Entry :=
  { word := [2, 10, 0, 12, 2, 0, 8], weights := [1, 1, 1, 0] }

-- Period 7, original row 3213, representative 1887.
def source112 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B014.Data.entryAt ⟨82, by decide +kernel⟩

def target112 : Weights.Entry :=
  { word := [2, 10, 0, 12, 10, 0, 2], weights := [1, 1, 0, 1] }

def points112 : List (ℕ × ℕ) := [(0, 1), (1, 2), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 3215, representative 1922.
def source113 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B014.Data.entryAt ⟨117, by decide +kernel⟩

def target113 : Weights.Entry :=
  { word := [2, 10, 0, 12, 10, 0, 8], weights := [1, 1, 1, 0] }

-- Period 7, original row 3221, representative 1892.
def source114 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B014.Data.entryAt ⟨87, by decide +kernel⟩

def target114 : Weights.Entry :=
  { word := [2, 10, 2, 8, 1, 0, 2], weights := [1, 1, 0, 1] }

-- Period 7, original row 3223, representative 1931.
def source115 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B014.Data.entryAt ⟨126, by decide +kernel⟩

def target115 : Weights.Entry :=
  { word := [2, 10, 2, 8, 1, 0, 8], weights := [1, 1, 0, 1] }

-- Period 7, original row 3228, representative 1929.
def source116 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B014.Data.entryAt ⟨124, by decide +kernel⟩

def target116 : Weights.Entry :=
  { word := [2, 10, 2, 8, 1, 8, 8], weights := [1, 1, 1, 1] }

-- Period 7, original row 3235, representative 1891.
def source117 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B014.Data.entryAt ⟨86, by decide +kernel⟩

def target117 : Weights.Entry :=
  { word := [2, 10, 2, 8, 9, 0, 2], weights := [1, 1, 0, 1] }

-- Period 7, original row 3237, representative 1930.
def source118 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B014.Data.entryAt ⟨125, by decide +kernel⟩

def target118 : Weights.Entry :=
  { word := [2, 10, 2, 8, 9, 0, 8], weights := [1, 1, 0, 1] }

-- Period 7, original row 3242, representative 1928.
def source119 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B014.Data.entryAt ⟨123, by decide +kernel⟩

def target119 : Weights.Entry :=
  { word := [2, 10, 2, 8, 9, 8, 8], weights := [1, 1, 1, 1] }

-- Period 7, original row 3250, representative 1909.
def source120 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B014.Data.entryAt ⟨104, by decide +kernel⟩

def target120 : Weights.Entry :=
  { word := [2, 10, 8, 2, 0, 1, 8], weights := [1, 0, 0, 1] }

-- Period 7, original row 3252, representative 1901.
def source121 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B014.Data.entryAt ⟨96, by decide +kernel⟩

def target121 : Weights.Entry :=
  { word := [2, 10, 8, 2, 0, 2, 8], weights := [1, 0, 0, 1] }

-- Period 7, original row 3255, representative 1864.
def source122 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B014.Data.entryAt ⟨59, by decide +kernel⟩

def target122 : Weights.Entry :=
  { word := [2, 10, 8, 2, 0, 8, 2], weights := [1, 0, 0, 1] }

-- Period 7, original row 3257, representative 1913.
def source123 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B014.Data.entryAt ⟨108, by decide +kernel⟩

def target123 : Weights.Entry :=
  { word := [2, 10, 8, 2, 0, 8, 8], weights := [1, 0, 0, 1] }

-- Period 7, original row 3262, representative 1910.
def source124 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B014.Data.entryAt ⟨105, by decide +kernel⟩

def target124 : Weights.Entry :=
  { word := [2, 10, 8, 2, 0, 9, 8], weights := [1, 0, 0, 1] }

-- Period 7, original row 3264, representative 1902.
def source125 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B014.Data.entryAt ⟨97, by decide +kernel⟩

def target125 : Weights.Entry :=
  { word := [2, 10, 8, 2, 0, 10, 8], weights := [1, 0, 0, 1] }

-- Period 7, original row 3268, representative 1906.
def source126 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B014.Data.entryAt ⟨101, by decide +kernel⟩

def target126 : Weights.Entry :=
  { word := [2, 10, 8, 2, 8, 2, 8], weights := [1, 0, 0, 1] }

-- Period 7, original row 3272, representative 1903.
def source127 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B014.Data.entryAt ⟨98, by decide +kernel⟩

def target127 : Weights.Entry :=
  { word := [2, 10, 8, 2, 8, 10, 8], weights := [1, 0, 0, 1] }

def period7Entries : List Weights.Entry := [target0, target1, target2, target3, target4, target5, target6, target7, target8, target9, target10, target11, target12, target13, target14, target15, target16, target17, target18, target19, target20, target21, target22, target23, target24, target25, target26, target27, target28, target29, target30, target31, target32, target33, target34, target35, target36, target37, target38, target39, target40, target41, target42, target43, target44, target45, target46, target47, target48, target49, target50, target51, target52, target53, target54, target55, target56, target57, target58, target59, target60, target61, target62, target63, target64, target65, target66, target67, target68, target69, target70, target71, target72, target73, target74, target75, target76, target77, target78, target79, target80, target81, target82, target83, target84, target85, target86, target87, target88, target89, target90, target91, target92, target93, target94, target95, target96, target97, target98, target99, target100, target101, target102, target103, target104, target105, target106, target107, target108, target109, target110, target111, target112, target113, target114, target115, target116, target117, target118, target119, target120, target121, target122, target123, target124, target125, target126, target127]

def period7Chunk : RowCoverage.Chunk where
  rows := [⟨151, target0⟩, ⟨162, target1⟩, ⟨179, target2⟩, ⟨186, target3⟩, ⟨194, target4⟩, ⟨240, target5⟩, ⟨251, target6⟩, ⟨272, target7⟩, ⟨279, target8⟩, ⟨287, target9⟩, ⟨323, target10⟩, ⟨334, target11⟩, ⟨351, target12⟩, ⟨361, target13⟩, ⟨371, target14⟩, ⟨378, target15⟩, ⟨385, target16⟩, ⟨399, target17⟩, ⟨406, target18⟩, ⟨428, target19⟩, ⟨449, target20⟩, ⟨459, target21⟩, ⟨473, target22⟩, ⟨480, target23⟩, ⟨494, target24⟩, ⟨501, target25⟩, ⟨763, target26⟩, ⟨773, target27⟩, ⟨790, target28⟩, ⟨1124, target29⟩, ⟨1128, target30⟩, ⟨1134, target31⟩, ⟨1152, target32⟩, ⟨1158, target33⟩, ⟨1178, target34⟩, ⟨1184, target35⟩, ⟨1212, target36⟩, ⟨1218, target37⟩, ⟨1237, target38⟩, ⟨1243, target39⟩, ⟨1265, target40⟩, ⟨1271, target41⟩, ⟨1377, target42⟩, ⟨1394, target43⟩, ⟨1404, target44⟩, ⟨1411, target45⟩, ⟨1425, target46⟩, ⟨1432, target47⟩, ⟨1469, target48⟩, ⟨1479, target49⟩, ⟨1493, target50⟩, ⟨1500, target51⟩, ⟨2399, target52⟩, ⟨2410, target53⟩, ⟨2433, target54⟩, ⟨2468, target55⟩, ⟨2469, target56⟩, ⟨2470, target57⟩, ⟨2490, target58⟩, ⟨2498, target59⟩, ⟨2499, target60⟩, ⟨2500, target61⟩, ⟨2506, target62⟩, ⟨2510, target63⟩, ⟨2527, target64⟩, ⟨2552, target65⟩, ⟨2555, target66⟩, ⟨2805, target67⟩, ⟨2817, target68⟩, ⟨2825, target69⟩, ⟨2831, target70⟩, ⟨2843, target71⟩, ⟨2851, target72⟩, ⟨2857, target73⟩, ⟨2869, target74⟩, ⟨2870, target75⟩, ⟨2876, target76⟩, ⟨2882, target77⟩, ⟨2894, target78⟩, ⟨2895, target79⟩, ⟨2896, target80⟩, ⟨2899, target81⟩, ⟨2907, target82⟩, ⟨2934, target83⟩, ⟨2955, target84⟩, ⟨2969, target85⟩, ⟨2981, target86⟩, ⟨2983, target87⟩, ⟨2999, target88⟩, ⟨3011, target89⟩, ⟨3013, target90⟩, ⟨3017, target91⟩, ⟨3043, target92⟩, ⟨3055, target93⟩, ⟨3057, target94⟩, ⟨3072, target95⟩, ⟨3084, target96⟩, ⟨3086, target97⟩, ⟨3088, target98⟩, ⟨3092, target99⟩, ⟨3104, target100⟩, ⟨3107, target101⟩, ⟨3115, target102⟩, ⟨3142, target103⟩, ⟨3169, target104⟩, ⟨3178, target105⟩, ⟨3185, target106⟩, ⟨3188, target107⟩, ⟨3190, target108⟩, ⟨3197, target109⟩, ⟨3205, target110⟩, ⟨3207, target111⟩, ⟨3213, target112⟩, ⟨3215, target113⟩, ⟨3221, target114⟩, ⟨3223, target115⟩, ⟨3228, target116⟩, ⟨3235, target117⟩, ⟨3237, target118⟩, ⟨3242, target119⟩, ⟨3250, target120⟩, ⟨3252, target121⟩, ⟨3255, target122⟩, ⟨3257, target123⟩, ⟨3262, target124⟩, ⟨3264, target125⟩, ⟨3268, target126⟩, ⟨3272, target127⟩]
  indexMask := 9965108327806705392017059062617455774482262572111912117535522306723628183936276813770011892847593773247093054756820709378314010513079037100001880015419589450648072224158865627499568770566403450708460046431320420293116843827054562945440249772762803665505087205743187840523953465572784197566217339274228174935443793387924071797651606449568034372988423568806781864468662098394614050931645901433301665746718756366874505003217912432023015331263360007173730414066345453270558252923304117344964720499654250064028653286816727921911587438692350564619625075374951317170693925408665287462587728103312063059855977025330968805964440904888655433382759031934222658040162083278753237934209335915893657077706822783866003217895342605512795147817116689643606784880658094779369504748517049401835260785155886938048699474697248881388433341568066871203451069317629452433807569023101926245201267861686396595997763498230751436919483170822758359463926959204348041493865690334999006852754603811164238233013846016
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

end FranklSmallCyclic.TransportBatches.G014.B000.Data
