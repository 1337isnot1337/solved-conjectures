module

public import Conjectures.FranklSmallCyclicRowCoverage
public import Conjectures.FranklSmallCyclicCanonicalWords
public import Conjectures.FranklSmallCyclicOrbit10Block008Data

/-! 26 literal targets sharing one source proof block.
Original words and row indices are retained; weights may be transported.
-/
@[expose] public section

namespace FranklSmallCyclic.TransportBatches.G086.B001.Data

-- Period 10, original row 8714, representative 10009.
def source0 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B008.Data.entryAt ⟨49, by decide +kernel⟩

def target0 : Weights.Entry :=
  { word := [12, 4, 8, 8, 10, 2, 2], weights := [0, 1, 1, 0] }

def points0 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8716, representative 10005.
def source1 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B008.Data.entryAt ⟨45, by decide +kernel⟩

def target1 : Weights.Entry :=
  { word := [12, 4, 8, 8, 10, 10, 2], weights := [0, 1, 1, 0] }

def points1 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8719, representative 10007.
def source2 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B008.Data.entryAt ⟨47, by decide +kernel⟩

def target2 : Weights.Entry :=
  { word := [12, 4, 12, 8, 8, 2, 2], weights := [0, 1, 1, 0] }

def points2 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8721, representative 10003.
def source3 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B008.Data.entryAt ⟨43, by decide +kernel⟩

def target3 : Weights.Entry :=
  { word := [12, 4, 12, 8, 8, 10, 2], weights := [0, 1, 1, 0] }

def points3 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8824, representative 10011.
def source4 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B008.Data.entryAt ⟨51, by decide +kernel⟩

def target4 : Weights.Entry :=
  { word := [12, 8, 4, 2, 0, 8, 2], weights := [0, 1, 0, 1] }

def points4 : List (ℕ × ℕ) := [(0, 9), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8825, representative 10011.
def source5 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B008.Data.entryAt ⟨51, by decide +kernel⟩

def target5 : Weights.Entry :=
  { word := [12, 8, 4, 2, 0, 8, 4], weights := [0, 1, 0, 1] }

def points5 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8836, representative 10016.
def source6 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B008.Data.entryAt ⟨56, by decide +kernel⟩

def target6 : Weights.Entry :=
  { word := [12, 8, 4, 2, 8, 8, 4], weights := [0, 1, 0, 1] }

def points6 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8859, representative 10018.
def source7 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B008.Data.entryAt ⟨58, by decide +kernel⟩

def target7 : Weights.Entry :=
  { word := [12, 8, 4, 10, 0, 8, 2], weights := [0, 1, 0, 1] }

def points7 : List (ℕ × ℕ) := [(0, 9), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8860, representative 10018.
def source8 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B008.Data.entryAt ⟨58, by decide +kernel⟩

def target8 : Weights.Entry :=
  { word := [12, 8, 4, 10, 0, 8, 4], weights := [0, 1, 0, 1] }

def points8 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8870, representative 10017.
def source9 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B008.Data.entryAt ⟨57, by decide +kernel⟩

def target9 : Weights.Entry :=
  { word := [12, 8, 4, 10, 8, 8, 4], weights := [0, 1, 0, 1] }

def points9 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8932, representative 10012.
def source10 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B008.Data.entryAt ⟨52, by decide +kernel⟩

def target10 : Weights.Entry :=
  { word := [12, 8, 12, 2, 0, 8, 2], weights := [0, 1, 0, 1] }

def points10 : List (ℕ × ℕ) := [(0, 9), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8933, representative 10012.
def source11 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B008.Data.entryAt ⟨52, by decide +kernel⟩

def target11 : Weights.Entry :=
  { word := [12, 8, 12, 2, 0, 8, 4], weights := [0, 1, 0, 1] }

def points11 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8944, representative 10013.
def source12 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B008.Data.entryAt ⟨53, by decide +kernel⟩

def target12 : Weights.Entry :=
  { word := [12, 8, 12, 2, 8, 8, 4], weights := [0, 1, 0, 1] }

def points12 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8967, representative 10015.
def source13 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B008.Data.entryAt ⟨55, by decide +kernel⟩

def target13 : Weights.Entry :=
  { word := [12, 8, 12, 10, 0, 8, 2], weights := [0, 1, 0, 1] }

def points13 : List (ℕ × ℕ) := [(0, 9), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8968, representative 10015.
def source14 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B008.Data.entryAt ⟨55, by decide +kernel⟩

def target14 : Weights.Entry :=
  { word := [12, 8, 12, 10, 0, 8, 4], weights := [0, 1, 0, 1] }

def points14 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8978, representative 10014.
def source15 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B008.Data.entryAt ⟨54, by decide +kernel⟩

def target15 : Weights.Entry :=
  { word := [12, 8, 12, 10, 8, 8, 4], weights := [0, 1, 0, 1] }

def points15 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 9054, representative 10000.
def source16 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B008.Data.entryAt ⟨40, by decide +kernel⟩

def target16 : Weights.Entry :=
  { word := [12, 12, 4, 8, 8, 2, 2], weights := [0, 1, 1, 0] }

def points16 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 9056, representative 9996.
def source17 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B008.Data.entryAt ⟨36, by decide +kernel⟩

def target17 : Weights.Entry :=
  { word := [12, 12, 4, 8, 8, 10, 2], weights := [0, 1, 1, 0] }

def points17 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 9058, representative 9966.
def source18 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B008.Data.entryAt ⟨6, by decide +kernel⟩

def target18 : Weights.Entry :=
  { word := [12, 12, 8, 0, 1, 4, 8], weights := [0, 0, 1, 0] }

def points18 : List (ℕ × ℕ) := [(0, 9), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 9062, representative 9967.
def source19 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B008.Data.entryAt ⟨7, by decide +kernel⟩

def target19 : Weights.Entry :=
  { word := [12, 12, 8, 8, 1, 4, 8], weights := [0, 0, 1, 0] }

def points19 : List (ℕ × ℕ) := [(0, 9), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 9070, representative 10002.
def source20 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B008.Data.entryAt ⟨42, by decide +kernel⟩

def target20 : Weights.Entry :=
  { word := [12, 12, 8, 8, 2, 2, 2], weights := [0, 1, 1, 0] }

def points20 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 9072, representative 9998.
def source21 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B008.Data.entryAt ⟨38, by decide +kernel⟩

def target21 : Weights.Entry :=
  { word := [12, 12, 8, 8, 2, 10, 2], weights := [0, 1, 1, 0] }

def points21 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 9079, representative 10001.
def source22 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B008.Data.entryAt ⟨41, by decide +kernel⟩

def target22 : Weights.Entry :=
  { word := [12, 12, 8, 8, 10, 2, 2], weights := [0, 1, 1, 0] }

def points22 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 9081, representative 9997.
def source23 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B008.Data.entryAt ⟨37, by decide +kernel⟩

def target23 : Weights.Entry :=
  { word := [12, 12, 8, 8, 10, 10, 2], weights := [0, 1, 1, 0] }

def points23 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 9084, representative 9999.
def source24 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B008.Data.entryAt ⟨39, by decide +kernel⟩

def target24 : Weights.Entry :=
  { word := [12, 12, 12, 8, 8, 2, 2], weights := [0, 1, 1, 0] }

def points24 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 9086, representative 9995.
def source25 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B008.Data.entryAt ⟨35, by decide +kernel⟩

def target25 : Weights.Entry :=
  { word := [12, 12, 12, 8, 8, 10, 2], weights := [0, 1, 1, 0] }

def points25 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

def period10Entries : List Weights.Entry := [target0, target1, target2, target3, target4, target5, target6, target7, target8, target9, target10, target11, target12, target13, target14, target15, target16, target17, target18, target19, target20, target21, target22, target23, target24, target25]

def period10Chunk : RowCoverage.Chunk where
  rows := [⟨8714, target0⟩, ⟨8716, target1⟩, ⟨8719, target2⟩, ⟨8721, target3⟩, ⟨8824, target4⟩, ⟨8825, target5⟩, ⟨8836, target6⟩, ⟨8859, target7⟩, ⟨8860, target8⟩, ⟨8870, target9⟩, ⟨8932, target10⟩, ⟨8933, target11⟩, ⟨8944, target12⟩, ⟨8967, target13⟩, ⟨8968, target14⟩, ⟨8978, target15⟩, ⟨9054, target16⟩, ⟨9056, target17⟩, ⟨9058, target18⟩, ⟨9062, target19⟩, ⟨9070, target20⟩, ⟨9072, target21⟩, ⟨9079, target22⟩, ⟨9081, target23⟩, ⟨9084, target24⟩, ⟨9086, target25⟩]
  indexMask := 185712143402107654213226760467292639732258798764016002178171226824392190637259489399736888281067203629288009820842356811372050698376287773402305054311544913409303775885157221545118657600196556064906085953059430818993929336418667843179397707262853488435299491264651404175432681676770460948397588601352990981146547350993528676777591384815526110699684273942768920343765866441111091307704298727345669859482459266222356876709504882659833472553434843293657538736581546138845063863914359948039370283369839343697774418770208389576704187417206252534481647439259143000017110925142969903113236954513496388794991899120350228573617719269099278373186078559781560507694244533487559466664201981985944455839895203109177148031181496804924164492531653186976056713049403538717906099528760860533614736182689135093793495013795783684131174008282346283961580171432188745551007351117420342317950319414293505503262519540722432946182628948090245125004441949091992961912808673642553556646525749929197192016108483977874191382452336009043043224955630448750734878326050712322359334691592275810179959992247834800833759987632325979634773510971961587890122004349124902244645293776280477144121275688665636132082236230620170635917993838161202157995921602397562326951500786803407750152361140997051635065047279339871111750633836257392694483709562429343234224431693552425594477675574848901320483547713136244357959869947907994187101698164945809214597367384854927781207686025250329488688732607156659652346817234956104376257890683669866404354259270538548858099809883617348089788054451551753485211826393928220829372177989305035406197759660986360752176966677757422045302686459658884714881959058716433388731497692438001379827514532882069646841468835318543720297050863719105091975303103776222704147594647747283054610680161105786000904203045790424346272715225570810076574614856066890431475325565779869730834487174756920849787952000929318311067682074894499299884339038006700888862468061083873939488645220407863975721025680673430266699460778853731994803706752747751326915747221225789689295461255886849910671432965711464364262245468397794362129661334194932814210448955603726108865925110520849828847398961753540681611051840218508967606153396696100642254611798028396898647079101605169755434262051040642920894057138226415121249543818204784325039739262585222779626342409230372411720717643028801439382063944652057797262320991075378166667514949313756474250630702946163310176219306012189426749711326199869728979093533575287360942676432384436950149398945619575071776309809510370399592567107895959710336762422983552274440951765828266590534677382617602324936760599400868189472118029345189088002942525081857124298899397486423575004051171578181865542587537423087639761946991963875119644923733737472
  count := 26

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

end FranklSmallCyclic.TransportBatches.G086.B001.Data
