module

public import Conjectures.FranklSmallCyclicRowCoverage
public import Conjectures.FranklSmallCyclicCanonicalWords
public import Conjectures.FranklSmallCyclicOrbit10Block001Data

/-! 31 literal targets sharing one source proof block.
Original words and row indices are retained; weights may be transported.
-/
@[expose] public section

namespace FranklSmallCyclic.TransportBatches.G079.B001.Data

-- Period 10, original row 8356, representative 9534.
def source0 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B001.Data.entryAt ⟨22, by decide +kernel⟩

def target0 : Weights.Entry :=
  { word := [10, 10, 8, 12, 8, 4, 2], weights := [2, 1, 2, 1] }

def points0 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8357, representative 9543.
def source1 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B001.Data.entryAt ⟨31, by decide +kernel⟩

def target1 : Weights.Entry :=
  { word := [10, 10, 8, 12, 8, 4, 8], weights := [1, 0, 3, 0] }

def points1 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8359, representative 9533.
def source2 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B001.Data.entryAt ⟨21, by decide +kernel⟩

def target2 : Weights.Entry :=
  { word := [10, 10, 8, 12, 8, 12, 2], weights := [2, 1, 2, 1] }

def points2 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8360, representative 9540.
def source3 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B001.Data.entryAt ⟨28, by decide +kernel⟩

def target3 : Weights.Entry :=
  { word := [10, 10, 8, 12, 8, 12, 8], weights := [1, 0, 3, 0] }

def points3 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8364, representative 9552.
def source4 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B001.Data.entryAt ⟨40, by decide +kernel⟩

def target4 : Weights.Entry :=
  { word := [10, 10, 8, 12, 10, 0, 4], weights := [1, 1, 0, 1] }

def points4 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8369, representative 9548.
def source5 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B001.Data.entryAt ⟨36, by decide +kernel⟩

def target5 : Weights.Entry :=
  { word := [10, 10, 8, 12, 10, 8, 2], weights := [1, 1, 1, 1] }

def points5 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8370, representative 9550.
def source6 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B001.Data.entryAt ⟨38, by decide +kernel⟩

def target6 : Weights.Entry :=
  { word := [10, 10, 8, 12, 10, 8, 4], weights := [2, 1, 1, 2] }

def points6 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8375, representative 9537.
def source7 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B001.Data.entryAt ⟨25, by decide +kernel⟩

def target7 : Weights.Entry :=
  { word := [10, 10, 8, 12, 12, 4, 8], weights := [1, 1, 1, 1] }

def points7 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8377, representative 9535.
def source8 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B001.Data.entryAt ⟨23, by decide +kernel⟩

def target8 : Weights.Entry :=
  { word := [10, 10, 8, 12, 12, 12, 8], weights := [1, 1, 1, 1] }

def points8 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8394, representative 9546.
def source9 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B001.Data.entryAt ⟨34, by decide +kernel⟩

def target9 : Weights.Entry :=
  { word := [10, 10, 10, 8, 9, 0, 4], weights := [1, 1, 0, 1] }

def points9 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8989, representative 9564.
def source10 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B001.Data.entryAt ⟨52, by decide +kernel⟩

def target10 : Weights.Entry :=
  { word := [12, 10, 0, 9, 8, 1, 4], weights := [1, 1, 0, 1] }

def points10 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8991, representative 9563.
def source11 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B001.Data.entryAt ⟨51, by decide +kernel⟩

def target11 : Weights.Entry :=
  { word := [12, 10, 0, 9, 8, 2, 2], weights := [1, 1, 0, 1] }

def points11 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8993, representative 9565.
def source12 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B001.Data.entryAt ⟨53, by decide +kernel⟩

def target12 : Weights.Entry :=
  { word := [12, 10, 0, 9, 8, 8, 4], weights := [1, 1, 0, 1] }

def points12 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8996, representative 9562.
def source13 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B001.Data.entryAt ⟨50, by decide +kernel⟩

def target13 : Weights.Entry :=
  { word := [12, 10, 0, 9, 8, 9, 4], weights := [1, 1, 0, 1] }

def points13 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8998, representative 9561.
def source14 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B001.Data.entryAt ⟨49, by decide +kernel⟩

def target14 : Weights.Entry :=
  { word := [12, 10, 0, 9, 8, 10, 2], weights := [1, 1, 0, 1] }

def points14 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 9000, representative 9527.
def source15 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B001.Data.entryAt ⟨15, by decide +kernel⟩

def target15 : Weights.Entry :=
  { word := [12, 10, 0, 10, 8, 0, 4], weights := [0, 1, 0, 1] }

def points15 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 9002, representative 9525.
def source16 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B001.Data.entryAt ⟨13, by decide +kernel⟩

def target16 : Weights.Entry :=
  { word := [12, 10, 0, 10, 8, 8, 4], weights := [0, 1, 0, 1] }

def points16 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 9006, representative 9555.
def source17 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B001.Data.entryAt ⟨43, by decide +kernel⟩

def target17 : Weights.Entry :=
  { word := [12, 10, 0, 12, 2, 0, 4], weights := [1, 1, 0, 1] }

def points17 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 9014, representative 9554.
def source18 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B001.Data.entryAt ⟨42, by decide +kernel⟩

def target18 : Weights.Entry :=
  { word := [12, 10, 0, 12, 10, 0, 4], weights := [1, 1, 0, 1] }

def points18 : List (ℕ × ℕ) := [(0, 8), (1, 9), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 9021, representative 9568.
def source19 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B001.Data.entryAt ⟨56, by decide +kernel⟩

def target19 : Weights.Entry :=
  { word := [12, 10, 8, 2, 8, 2, 8], weights := [0, 1, 0, 1] }

def points19 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 9022, representative 9517.
def source20 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B001.Data.entryAt ⟨5, by decide +kernel⟩

def target20 : Weights.Entry :=
  { word := [12, 10, 8, 2, 8, 8, 4], weights := [0, 1, 0, 1] }

def points20 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 9025, representative 9566.
def source21 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B001.Data.entryAt ⟨54, by decide +kernel⟩

def target21 : Weights.Entry :=
  { word := [12, 10, 8, 2, 8, 10, 8], weights := [0, 1, 0, 1] }

def points21 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 9037, representative 9569.
def source22 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B001.Data.entryAt ⟨57, by decide +kernel⟩

def target22 : Weights.Entry :=
  { word := [12, 10, 8, 10, 8, 2, 8], weights := [0, 1, 0, 1] }

def points22 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 9039, representative 9532.
def source23 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B001.Data.entryAt ⟨20, by decide +kernel⟩

def target23 : Weights.Entry :=
  { word := [12, 10, 8, 10, 8, 6, 8], weights := [1, 1, 1, 1] }

def points23 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 9040, representative 9518.
def source24 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B001.Data.entryAt ⟨6, by decide +kernel⟩

def target24 : Weights.Entry :=
  { word := [12, 10, 8, 10, 8, 8, 4], weights := [0, 1, 0, 1] }

def points24 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 9043, representative 9567.
def source25 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B001.Data.entryAt ⟨55, by decide +kernel⟩

def target25 : Weights.Entry :=
  { word := [12, 10, 8, 10, 8, 10, 8], weights := [0, 1, 0, 1] }

def points25 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 9044, representative 9514.
def source26 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B001.Data.entryAt ⟨2, by decide +kernel⟩

def target26 : Weights.Entry :=
  { word := [12, 10, 8, 10, 8, 12, 4], weights := [1, 2, 1, 2] }

def points26 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 9047, representative 9531.
def source27 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B001.Data.entryAt ⟨19, by decide +kernel⟩

def target27 : Weights.Entry :=
  { word := [12, 10, 8, 12, 4, 4, 8], weights := [1, 1, 1, 1] }

def points27 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 9049, representative 9529.
def source28 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B001.Data.entryAt ⟨17, by decide +kernel⟩

def target28 : Weights.Entry :=
  { word := [12, 10, 8, 12, 4, 12, 8], weights := [1, 1, 1, 1] }

def points28 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 9051, representative 9530.
def source29 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B001.Data.entryAt ⟨18, by decide +kernel⟩

def target29 : Weights.Entry :=
  { word := [12, 10, 8, 12, 12, 4, 8], weights := [1, 1, 1, 1] }

def points29 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 9053, representative 9528.
def source30 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B001.Data.entryAt ⟨16, by decide +kernel⟩

def target30 : Weights.Entry :=
  { word := [12, 10, 8, 12, 12, 12, 8], weights := [1, 1, 1, 1] }

def points30 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

def period10Entries : List Weights.Entry := [target0, target1, target2, target3, target4, target5, target6, target7, target8, target9, target10, target11, target12, target13, target14, target15, target16, target17, target18, target19, target20, target21, target22, target23, target24, target25, target26, target27, target28, target29, target30]

def period10Chunk : RowCoverage.Chunk where
  rows := [⟨8356, target0⟩, ⟨8357, target1⟩, ⟨8359, target2⟩, ⟨8360, target3⟩, ⟨8364, target4⟩, ⟨8369, target5⟩, ⟨8370, target6⟩, ⟨8375, target7⟩, ⟨8377, target8⟩, ⟨8394, target9⟩, ⟨8989, target10⟩, ⟨8991, target11⟩, ⟨8993, target12⟩, ⟨8996, target13⟩, ⟨8998, target14⟩, ⟨9000, target15⟩, ⟨9002, target16⟩, ⟨9006, target17⟩, ⟨9014, target18⟩, ⟨9021, target19⟩, ⟨9022, target20⟩, ⟨9025, target21⟩, ⟨9037, target22⟩, ⟨9039, target23⟩, ⟨9040, target24⟩, ⟨9043, target25⟩, ⟨9044, target26⟩, ⟨9047, target27⟩, ⟨9049, target28⟩, ⟨9051, target29⟩, ⟨9053, target30⟩]
  indexMask := 22326022795069762277487174091524983877834135572888530672367085179562871273626619373203941472182553474701416921322903035048631251364615493252914428313351800264074674371087912734971684956008308634635244465953613708401942652572436274148658256511685203134260056036523754278077119512958307994845983375832143903740783377795260190172354197772278386289223506971631829943459263901818948972259468277243851282972544417914704037189424603570563409715452145207609595038427374802276826915699062839191051933741977377698324508144718209889951977386040723921409332917103227580250835489704017981172234317706195762822504410014737178140227588645971663684438975444761174602245285505894205658826719994326182730995073673218559976447020662547153340485221611926854939601119951564433850398180050950585426001327150501998312127363444571694851360455481392830727347979806464923614109054266001659777733468260652450502056393965492534915166854907026786674555864751921449279875951177036386073369206210275466795443251495629503604284703002831144846922556027403370416044692412708414147996609189147082986651256538508923627934354892324958916443835411332564476489206515813390225462792269711846932573713940791454857066607496787143204082220254973827805150790346689788255320177412786227437389751203060467968074733884291840080836590875708920946873766397105026674964936858893980557551370716665456880223735748374507788740899017808235874734226914153224604970293928056477391153256279549837389536412927998888313076591290590398338056357839344325293906237440032848583449233503885633175376344549938741331223626181665207804420719056871936579090741039232157231166680930940918852093784437450317948294441736272641441494210195930458145167299243112746215302490223496037937461344778680918156932872461303684805217753399170636023328016729345091089366665888787565425478595734741785028158959663719271822764700487129324006428145470099363490128215086965106169009848212743994731087196919850735431464658600553956570395377975891071767655904390582019792895491861598691910843146676993734116905666890101404602595292535919729076859061304515890821540054639096480192584322340748445486175060383580315122585565855538538623512654955340981582210198669201822925041436552641826347186335158960424778798256717972161459489358388987712579635192461453778123356750487053274367949279781775029799207873194064661889189851891642188295998966166631158009653754693765581555018724429705088235336209086491875096028874405306653032188810986475082439324460516192182737432414330756388719701000076356618528540679763469019054430320661038338244946110427965151641078543855799004126433516607518606933705664665361345228600892450021775456328352223413105833471423417864725730547261254851656703323175150580283078599859665067580730638336
  count := 31

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

end FranklSmallCyclic.TransportBatches.G079.B001.Data
