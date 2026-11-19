module

public import Conjectures.FranklSmallCyclicRowCoverage
public import Conjectures.FranklSmallCyclicCanonicalWords
public import Conjectures.FranklSmallCyclicOrbit10Block024Data

/-! 20 literal targets sharing one source proof block.
Original words and row indices are retained; weights may be transported.
-/
@[expose] public section

namespace FranklSmallCyclic.TransportBatches.G102.B001.Data

-- Period 10, original row 6941, representative 11015.
def source0 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B024.Data.entryAt ⟨31, by decide +kernel⟩

def target0 : Weights.Entry :=
  { word := [9, 0, 12, 10, 0, 8, 8], weights := [1, 0, 0, 1] }

def points0 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8), (9, 9)]

-- Period 10, original row 6952, representative 10993.
def source1 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B024.Data.entryAt ⟨9, by decide +kernel⟩

def target1 : Weights.Entry :=
  { word := [9, 0, 12, 10, 8, 2, 8], weights := [0, 1, 1, 0] }

def points1 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8), (9, 9)]

-- Period 10, original row 6960, representative 10996.
def source2 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B024.Data.entryAt ⟨12, by decide +kernel⟩

def target2 : Weights.Entry :=
  { word := [9, 0, 12, 12, 4, 0, 8], weights := [0, 0, 1, 1] }

def points2 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 4), (5, 5), (6, 3), (7, 2), (8, 0), (9, 1)]

-- Period 10, original row 6966, representative 10984.
def source3 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B024.Data.entryAt ⟨0, by decide +kernel⟩

def target3 : Weights.Entry :=
  { word := [9, 4, 4, 4, 0, 0, 8], weights := [1, 0, 0, 1] }

def points3 : List (ℕ × ℕ) := [(0, 7), (1, 8), (2, 9), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 6980, representative 10987.
def source4 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B024.Data.entryAt ⟨3, by decide +kernel⟩

def target4 : Weights.Entry :=
  { word := [9, 4, 4, 4, 8, 0, 8], weights := [1, 0, 0, 1] }

def points4 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 6994, representative 10989.
def source5 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B024.Data.entryAt ⟨5, by decide +kernel⟩

def target5 : Weights.Entry :=
  { word := [9, 4, 4, 12, 0, 0, 8], weights := [1, 0, 0, 1] }

def points5 : List (ℕ × ℕ) := [(0, 7), (1, 8), (2, 9), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 7008, representative 10988.
def source6 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B024.Data.entryAt ⟨4, by decide +kernel⟩

def target6 : Weights.Entry :=
  { word := [9, 4, 4, 12, 8, 0, 8], weights := [0, 1, 1, 0] }

def points6 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 7029, representative 10985.
def source7 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B024.Data.entryAt ⟨1, by decide +kernel⟩

def target7 : Weights.Entry :=
  { word := [9, 4, 12, 4, 8, 0, 8], weights := [1, 0, 0, 1] }

def points7 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 7050, representative 10986.
def source8 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B024.Data.entryAt ⟨2, by decide +kernel⟩

def target8 : Weights.Entry :=
  { word := [9, 4, 12, 12, 8, 0, 8], weights := [0, 1, 1, 0] }

def points8 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 7199, representative 11006.
def source9 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B024.Data.entryAt ⟨22, by decide +kernel⟩

def target9 : Weights.Entry :=
  { word := [9, 8, 4, 6, 0, 0, 8], weights := [0, 1, 0, 1] }

def points9 : List (ℕ × ℕ) := [(0, 7), (1, 8), (2, 9), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 7200, representative 10998.
def source10 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B024.Data.entryAt ⟨14, by decide +kernel⟩

def target10 : Weights.Entry :=
  { word := [9, 8, 4, 6, 0, 8, 8], weights := [0, 1, 0, 1] }

def points10 : List (ℕ × ℕ) := [(0, 9), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 7201, representative 11008.
def source11 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B024.Data.entryAt ⟨24, by decide +kernel⟩

def target11 : Weights.Entry :=
  { word := [9, 8, 4, 6, 8, 0, 8], weights := [0, 1, 0, 0] }

def points11 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 7202, representative 11001.
def source12 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B024.Data.entryAt ⟨17, by decide +kernel⟩

def target12 : Weights.Entry :=
  { word := [9, 8, 4, 6, 8, 8, 8], weights := [1, 0, 1, 0] }

def points12 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8), (9, 9)]

-- Period 10, original row 7221, representative 11010.
def source13 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B024.Data.entryAt ⟨26, by decide +kernel⟩

def target13 : Weights.Entry :=
  { word := [9, 8, 8, 6, 2, 0, 8], weights := [0, 1, 0, 0] }

def points13 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 7222, representative 11001.
def source14 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B024.Data.entryAt ⟨17, by decide +kernel⟩

def target14 : Weights.Entry :=
  { word := [9, 8, 8, 6, 2, 8, 8], weights := [0, 1, 0, 1] }

def points14 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 7223, representative 11011.
def source15 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B024.Data.entryAt ⟨27, by decide +kernel⟩

def target15 : Weights.Entry :=
  { word := [9, 8, 8, 6, 10, 0, 8], weights := [0, 1, 0, 0] }

def points15 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 7224, representative 11000.
def source16 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B024.Data.entryAt ⟨16, by decide +kernel⟩

def target16 : Weights.Entry :=
  { word := [9, 8, 8, 6, 10, 8, 8], weights := [1, 0, 1, 0] }

def points16 : List (ℕ × ℕ) := [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8), (9, 9)]

-- Period 10, original row 7290, representative 10999.
def source17 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B024.Data.entryAt ⟨15, by decide +kernel⟩

def target17 : Weights.Entry :=
  { word := [9, 8, 12, 6, 0, 8, 8], weights := [0, 1, 0, 1] }

def points17 : List (ℕ × ℕ) := [(0, 9), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 7291, representative 11007.
def source18 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B024.Data.entryAt ⟨23, by decide +kernel⟩

def target18 : Weights.Entry :=
  { word := [9, 8, 12, 6, 8, 0, 8], weights := [0, 1, 0, 0] }

def points18 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 7292, representative 11000.
def source19 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B024.Data.entryAt ⟨16, by decide +kernel⟩

def target19 : Weights.Entry :=
  { word := [9, 8, 12, 6, 8, 8, 8], weights := [0, 1, 0, 1] }

def points19 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

def period10Entries : List Weights.Entry := [target0, target1, target2, target3, target4, target5, target6, target7, target8, target9, target10, target11, target12, target13, target14, target15, target16, target17, target18, target19]

def period10Chunk : RowCoverage.Chunk where
  rows := [⟨6941, target0⟩, ⟨6952, target1⟩, ⟨6960, target2⟩, ⟨6966, target3⟩, ⟨6980, target4⟩, ⟨6994, target5⟩, ⟨7008, target6⟩, ⟨7029, target7⟩, ⟨7050, target8⟩, ⟨7199, target9⟩, ⟨7200, target10⟩, ⟨7201, target11⟩, ⟨7202, target12⟩, ⟨7221, target13⟩, ⟨7222, target14⟩, ⟨7223, target15⟩, ⟨7224, target16⟩, ⟨7290, target17⟩, ⟨7291, target18⟩, ⟨7292, target19⟩]
  indexMask := 225822094120329644780689953574882282479644864991804840853949919747336582594372837082734388378441835865116396999739023887319176568098232965056616719291782920861445284432025301586255844077136361153686657546274002544983541136180053150586707324497866124851706892725187667452038560440171235977202025517563176202948381786712978939952674374378512368345448881552122879740247759856635031214791408880918296298650192294522600105138447991339900831013108157164358017070361384818564527811035513935866727050062252321144472066834775504041421264774942683036524370356752570662348810192009062787266500282769988591358566305479412607396242294695024421051884610888229262629057791584972046412954204698562225630268347600253166999883944730446849414761299857713503913795978702152112522572709570568480903666523969091672558702857776827400930148098515710440691618674695216894768404191964575852686560787894867665684112030576811118414677093113047996223930831619831923711143189079459572149648264269989604018280164857689463792580043752746309542174027327780793669580303431172598098981305015525105530975866826717424465256610979068504126070689913073122561837286001226867776769923856259035096750866867275996360168638446187065875692476281398804464698071859236211573428028850608986264422385371695507720940853566628328479217000876109274415279062041461548481738185448687447270306917524256049541801591652487718283106771733296940553606437369332015768471822551819807768345950510076153442192560708018984738325485598358789096639311292849545491410165931705240509486503518140993332072049340548230309277887648556393750870733129148603831707734140570263093751704094048227716566995173979728259560563656380238302806666339900169759465274646942894884894387659967655075058920978336913828173741731123789474332579021536401671600710433550268177357330197284930833552629764008008663814488383382940674611011634001671847661815686896166979163684022450890155318881038213493203128377025813257344777779063944455554342511953141221700064305839719166109996041660243394281419109335295481920569221385480809982205037966222256863786735014650918653835855493968757559920664101694097406059356065186547381727576099571351016976684445667246707435919709813263627909918734942208
  count := 20

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

end FranklSmallCyclic.TransportBatches.G102.B001.Data
