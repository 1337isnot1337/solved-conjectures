module

public import Conjectures.FranklSmallCyclicRowCoverage
public import Conjectures.FranklSmallCyclicCanonicalWords
public import Conjectures.FranklSmallCyclicOrbit10Block014Data

/-! 32 literal targets sharing one source proof block.
Original words and row indices are retained; weights may be transported.
-/
@[expose] public section

namespace FranklSmallCyclic.TransportBatches.G092.B001.Data

-- Period 10, original row 5057, representative 10401.
def source0 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B014.Data.entryAt ⟨57, by decide +kernel⟩

def target0 : Weights.Entry :=
  { word := [8, 4, 0, 12, 8, 12, 4], weights := [1, 0, 0, 1] }

def points0 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 0), (9, 2)]

-- Period 10, original row 5178, representative 10392.
def source1 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B014.Data.entryAt ⟨48, by decide +kernel⟩

def target1 : Weights.Entry :=
  { word := [8, 4, 8, 4, 8, 12, 2], weights := [1, 0, 0, 1] }

def points1 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 5179, representative 10399.
def source2 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B014.Data.entryAt ⟨55, by decide +kernel⟩

def target2 : Weights.Entry :=
  { word := [8, 4, 8, 4, 8, 12, 4], weights := [1, 0, 0, 1] }

def points2 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 5220, representative 10393.
def source3 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B014.Data.entryAt ⟨49, by decide +kernel⟩

def target3 : Weights.Entry :=
  { word := [8, 4, 8, 12, 8, 12, 2], weights := [1, 0, 0, 1] }

def points3 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 5221, representative 10400.
def source4 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B014.Data.entryAt ⟨56, by decide +kernel⟩

def target4 : Weights.Entry :=
  { word := [8, 4, 8, 12, 8, 12, 4], weights := [1, 0, 0, 1] }

def points4 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 5307, representative 10355.
def source5 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B014.Data.entryAt ⟨11, by decide +kernel⟩

def target5 : Weights.Entry :=
  { word := [8, 6, 8, 12, 8, 12, 2], weights := [1, 1, 1, 1] }

def points5 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 5308, representative 10361.
def source6 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B014.Data.entryAt ⟨17, by decide +kernel⟩

def target6 : Weights.Entry :=
  { word := [8, 6, 8, 12, 8, 12, 4], weights := [1, 1, 1, 1] }

def points6 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 5338, representative 10404.
def source7 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B014.Data.entryAt ⟨60, by decide +kernel⟩

def target7 : Weights.Entry :=
  { word := [8, 8, 0, 4, 0, 12, 4], weights := [1, 0, 1, 2] }

def points7 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2), (9, 0)]

-- Period 10, original row 5364, representative 10402.
def source8 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B014.Data.entryAt ⟨58, by decide +kernel⟩

def target8 : Weights.Entry :=
  { word := [8, 8, 0, 4, 8, 12, 4], weights := [1, 0, 0, 1] }

def points8 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2), (9, 0)]

-- Period 10, original row 5402, representative 10405.
def source9 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B014.Data.entryAt ⟨61, by decide +kernel⟩

def target9 : Weights.Entry :=
  { word := [8, 8, 0, 12, 0, 12, 4], weights := [1, 0, 0, 1] }

def points9 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2), (9, 0)]

-- Period 10, original row 5427, representative 10403.
def source10 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B014.Data.entryAt ⟨59, by decide +kernel⟩

def target10 : Weights.Entry :=
  { word := [8, 8, 0, 12, 8, 12, 4], weights := [1, 0, 0, 1] }

def points10 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2), (9, 0)]

-- Period 10, original row 5463, representative 10395.
def source11 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B014.Data.entryAt ⟨51, by decide +kernel⟩

def target11 : Weights.Entry :=
  { word := [8, 8, 1, 4, 8, 12, 4], weights := [1, 0, 0, 1] }

def points11 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 5499, representative 10398.
def source12 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B014.Data.entryAt ⟨54, by decide +kernel⟩

def target12 : Weights.Entry :=
  { word := [8, 8, 1, 12, 8, 12, 4], weights := [1, 0, 0, 1] }

def points12 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 5840, representative 10407.
def source13 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B014.Data.entryAt ⟨63, by decide +kernel⟩

def target13 : Weights.Entry :=
  { word := [8, 8, 12, 10, 8, 12, 4], weights := [1, 1, 1, 1] }

def points13 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 6073, representative 10362.
def source14 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B014.Data.entryAt ⟨18, by decide +kernel⟩

def target14 : Weights.Entry :=
  { word := [8, 10, 0, 1, 8, 12, 4], weights := [0, 3, 1, 0] }

def points14 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2), (9, 0)]

-- Period 10, original row 6113, representative 10363.
def source15 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B014.Data.entryAt ⟨19, by decide +kernel⟩

def target15 : Weights.Entry :=
  { word := [8, 10, 0, 9, 8, 12, 4], weights := [0, 3, 1, 0] }

def points15 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2), (9, 0)]

-- Period 10, original row 6135, representative 10365.
def source16 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B014.Data.entryAt ⟨21, by decide +kernel⟩

def target16 : Weights.Entry :=
  { word := [8, 10, 0, 10, 8, 12, 4], weights := [0, 3, 0, 1] }

def points16 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2), (9, 0)]

-- Period 10, original row 6205, representative 10352.
def source17 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B014.Data.entryAt ⟨8, by decide +kernel⟩

def target17 : Weights.Entry :=
  { word := [8, 10, 2, 10, 8, 12, 2], weights := [1, 1, 1, 1] }

def points17 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 6206, representative 10358.
def source18 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B014.Data.entryAt ⟨14, by decide +kernel⟩

def target18 : Weights.Entry :=
  { word := [8, 10, 2, 10, 8, 12, 4], weights := [1, 1, 1, 1] }

def points18 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 6278, representative 10364.
def source19 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B014.Data.entryAt ⟨20, by decide +kernel⟩

def target19 : Weights.Entry :=
  { word := [8, 10, 8, 10, 8, 12, 4], weights := [0, 3, 0, 1] }

def points19 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 6327, representative 10351.
def source20 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B014.Data.entryAt ⟨7, by decide +kernel⟩

def target20 : Weights.Entry :=
  { word := [8, 10, 10, 10, 8, 12, 2], weights := [1, 1, 1, 1] }

def points20 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 6328, representative 10357.
def source21 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B014.Data.entryAt ⟨13, by decide +kernel⟩

def target21 : Weights.Entry :=
  { word := [8, 10, 10, 10, 8, 12, 4], weights := [1, 1, 1, 1] }

def points21 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 6351, representative 10395.
def source22 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B014.Data.entryAt ⟨51, by decide +kernel⟩

def target22 : Weights.Entry :=
  { word := [8, 12, 0, 4, 8, 12, 4], weights := [1, 0, 0, 1] }

def points22 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2), (9, 0)]

-- Period 10, original row 6387, representative 10398.
def source23 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B014.Data.entryAt ⟨54, by decide +kernel⟩

def target23 : Weights.Entry :=
  { word := [8, 12, 0, 12, 8, 12, 4], weights := [1, 0, 0, 1] }

def points23 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 1), (8, 2), (9, 0)]

-- Period 10, original row 6508, representative 10390.
def source24 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B014.Data.entryAt ⟨46, by decide +kernel⟩

def target24 : Weights.Entry :=
  { word := [8, 12, 8, 4, 8, 12, 2], weights := [1, 0, 0, 1] }

def points24 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 6509, representative 10396.
def source25 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B014.Data.entryAt ⟨52, by decide +kernel⟩

def target25 : Weights.Entry :=
  { word := [8, 12, 8, 4, 8, 12, 4], weights := [1, 0, 0, 1] }

def points25 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 6550, representative 10391.
def source26 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B014.Data.entryAt ⟨47, by decide +kernel⟩

def target26 : Weights.Entry :=
  { word := [8, 12, 8, 12, 8, 12, 2], weights := [1, 0, 0, 1] }

def points26 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 6551, representative 10397.
def source27 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B014.Data.entryAt ⟨53, by decide +kernel⟩

def target27 : Weights.Entry :=
  { word := [8, 12, 8, 12, 8, 12, 4], weights := [1, 0, 0, 1] }

def points27 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 6644, representative 10394.
def source28 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B014.Data.entryAt ⟨50, by decide +kernel⟩

def target28 : Weights.Entry :=
  { word := [9, 0, 1, 4, 8, 12, 4], weights := [1, 0, 0, 1] }

def points28 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 0), (9, 1)]

-- Period 10, original row 6680, representative 10401.
def source29 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B014.Data.entryAt ⟨57, by decide +kernel⟩

def target29 : Weights.Entry :=
  { word := [9, 0, 1, 12, 8, 12, 4], weights := [1, 0, 0, 1] }

def points29 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 0), (9, 1)]

-- Period 10, original row 7080, representative 10395.
def source30 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B014.Data.entryAt ⟨51, by decide +kernel⟩

def target30 : Weights.Entry :=
  { word := [9, 8, 1, 4, 8, 12, 4], weights := [1, 0, 0, 1] }

def points30 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 7116, representative 10398.
def source31 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B014.Data.entryAt ⟨54, by decide +kernel⟩

def target31 : Weights.Entry :=
  { word := [9, 8, 1, 12, 8, 12, 4], weights := [1, 0, 0, 1] }

def points31 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

def period10Entries : List Weights.Entry := [target0, target1, target2, target3, target4, target5, target6, target7, target8, target9, target10, target11, target12, target13, target14, target15, target16, target17, target18, target19, target20, target21, target22, target23, target24, target25, target26, target27, target28, target29, target30, target31]

def period10Chunk : RowCoverage.Chunk where
  rows := [⟨5057, target0⟩, ⟨5178, target1⟩, ⟨5179, target2⟩, ⟨5220, target3⟩, ⟨5221, target4⟩, ⟨5307, target5⟩, ⟨5308, target6⟩, ⟨5338, target7⟩, ⟨5364, target8⟩, ⟨5402, target9⟩, ⟨5427, target10⟩, ⟨5463, target11⟩, ⟨5499, target12⟩, ⟨5840, target13⟩, ⟨6073, target14⟩, ⟨6113, target15⟩, ⟨6135, target16⟩, ⟨6205, target17⟩, ⟨6206, target18⟩, ⟨6278, target19⟩, ⟨6327, target20⟩, ⟨6328, target21⟩, ⟨6351, target22⟩, ⟨6387, target23⟩, ⟨6508, target24⟩, ⟨6509, target25⟩, ⟨6550, target26⟩, ⟨6551, target27⟩, ⟨6644, target28⟩, ⟨6680, target29⟩, ⟨7080, target30⟩, ⟨7116, target31⟩]
  indexMask := 1347252955206960874220735241327712253116227330708424249617280159790659925981784869762613810549445316179093929103504716946817319406702345997205656897704228191271125514964933136187704228496388925184164686537238285446265101615418010195212948587279480876001024406652046835900515137749714408028170780046825311646870375503353876781742128963275594335335454225243141819549669497945540144240498024109101672358189977406697810618886346313391393659863052807109834556950379889557690274871224724450962928424090152004351131837636803945600575638290401010648905287715411720026971660141362609290450174611778658883291588794814552419351017028147353241295276458797868265966851281657093377899808813862854905806958630288601265708106790676791133870745535283458969029894949796445271000469946213770037945351585830861318935699262672173656517487784296947064291658260322232851490484381240088715174815072786142027339082336115353219694488420597525864732694805273988695360475977775311436477880587479539496995656103672481206820421906399016587306370855955916820186805955787653623016767461358601426447956458058911262289519479362675591582519363902912399013019521666188304748068559496689269887439121914699500790565778891104894446106653092154226171280223092744232571545635225809863018257554509220311298973219372936807058355421194951293067264286212289590450004442509642264826250928122791743059696703798257162823513320617675588054199490371079772320246098975606716722096186728166410794515874403741630768153714133425889534284008326511920982795856557602435279564960825096349015542548820155525397531156886092763383388932826534613633602958893445537025727234612386092026281518520033071424737470286942816827856730123512776824807694205377844471806619738421777027440727844910576467200633178260719780806807013656077797939530293564772370715716824725510166551413415728258025216421834338281180466159484623465984028832344799896236097302965446944381169104582261036962486407310593490749216208794142322517455876810568227193545707525081573574508600022056053732749234385477173036556026594877355095278891463892734142176306513719814624363035204194516425320539603843732189100989347600418049674141736370176
  count := 32

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

end FranklSmallCyclic.TransportBatches.G092.B001.Data
