module

public import Conjectures.FranklSmallCyclicRowCoverage
public import Conjectures.FranklSmallCyclicCanonicalWords
public import Conjectures.FranklSmallCyclicOrbit7Block001Data

/-! 32 literal targets sharing one source proof block.
Original words and row indices are retained; weights may be transported.
-/
@[expose] public section

namespace FranklSmallCyclic.TransportBatches.G001.B002.Data

-- Period 7, original row 8362, representative 219.
def source0 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B001.Data.entryAt ⟨80, by decide +kernel⟩

def target0 : Weights.Entry :=
  { word := [10, 10, 8, 12, 10, 0, 1], weights := [1, 1, 0, 1] }

def points0 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8374, representative 206.
def source1 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B001.Data.entryAt ⟨68, by decide +kernel⟩

def target1 : Weights.Entry :=
  { word := [10, 10, 8, 12, 12, 4, 0], weights := [1, 0, 1, 0] }

def points1 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8375, representative 191.
def source2 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B001.Data.entryAt ⟨53, by decide +kernel⟩

def target2 : Weights.Entry :=
  { word := [10, 10, 8, 12, 12, 4, 8], weights := [1, 1, 1, 1] }

def points2 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8376, representative 200.
def source3 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B001.Data.entryAt ⟨62, by decide +kernel⟩

def target3 : Weights.Entry :=
  { word := [10, 10, 8, 12, 12, 12, 0], weights := [1, 0, 1, 0] }

def points3 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8377, representative 186.
def source4 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B001.Data.entryAt ⟨49, by decide +kernel⟩

def target4 : Weights.Entry :=
  { word := [10, 10, 8, 12, 12, 12, 8], weights := [1, 1, 1, 1] }

def points4 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8378, representative 214.
def source5 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B001.Data.entryAt ⟨75, by decide +kernel⟩

def target5 : Weights.Entry :=
  { word := [10, 10, 10, 8, 1, 0, 1], weights := [1, 1, 0, 1] }

def points5 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8384, representative 136.
def source6 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B001.Data.entryAt ⟨0, by decide +kernel⟩

def target6 : Weights.Entry :=
  { word := [10, 10, 10, 8, 1, 0, 12], weights := [1, 1, 0, 1] }

def points6 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8385, representative 210.
def source7 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B001.Data.entryAt ⟨72, by decide +kernel⟩

def target7 : Weights.Entry :=
  { word := [10, 10, 10, 8, 1, 8, 1], weights := [1, 1, 1, 1] }

def points7 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8399, representative 209.
def source8 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B001.Data.entryAt ⟨71, by decide +kernel⟩

def target8 : Weights.Entry :=
  { word := [10, 10, 10, 8, 9, 8, 1], weights := [1, 1, 1, 1] }

def points8 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8586, representative 159.
def source9 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B001.Data.entryAt ⟨23, by decide +kernel⟩

def target9 : Weights.Entry :=
  { word := [12, 2, 0, 9, 8, 1, 12], weights := [1, 1, 0, 1] }

def points9 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8591, representative 163.
def source10 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B001.Data.entryAt ⟨27, by decide +kernel⟩

def target10 : Weights.Entry :=
  { word := [12, 2, 0, 9, 8, 8, 12], weights := [1, 1, 0, 1] }

def points10 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8593, representative 157.
def source11 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B001.Data.entryAt ⟨21, by decide +kernel⟩

def target11 : Weights.Entry :=
  { word := [12, 2, 0, 9, 8, 9, 12], weights := [1, 1, 0, 1] }

def points11 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8602, representative 154.
def source12 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B001.Data.entryAt ⟨18, by decide +kernel⟩

def target12 : Weights.Entry :=
  { word := [12, 2, 0, 10, 0, 0, 12], weights := [0, 1, 0, 1] }

def points12 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8608, representative 150.
def source13 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B001.Data.entryAt ⟨14, by decide +kernel⟩

def target13 : Weights.Entry :=
  { word := [12, 2, 0, 10, 0, 8, 12], weights := [0, 1, 0, 1] }

def points13 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8610, representative 153.
def source14 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B001.Data.entryAt ⟨17, by decide +kernel⟩

def target14 : Weights.Entry :=
  { word := [12, 2, 0, 10, 8, 0, 12], weights := [0, 1, 0, 1] }

def points14 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8612, representative 147.
def source15 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B001.Data.entryAt ⟨11, by decide +kernel⟩

def target15 : Weights.Entry :=
  { word := [12, 2, 0, 10, 8, 8, 12], weights := [0, 1, 0, 1] }

def points15 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8619, representative 165.
def source16 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B001.Data.entryAt ⟨29, by decide +kernel⟩

def target16 : Weights.Entry :=
  { word := [12, 2, 0, 12, 10, 0, 12], weights := [1, 1, 0, 1] }

def points16 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8632, representative 148.
def source17 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B001.Data.entryAt ⟨12, by decide +kernel⟩

def target17 : Weights.Entry :=
  { word := [12, 2, 8, 2, 0, 8, 12], weights := [0, 1, 0, 1] }

def points17 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8640, representative 145.
def source18 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B001.Data.entryAt ⟨9, by decide +kernel⟩

def target18 : Weights.Entry :=
  { word := [12, 2, 8, 2, 8, 8, 12], weights := [0, 1, 0, 1] }

def points18 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8665, representative 149.
def source19 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B001.Data.entryAt ⟨13, by decide +kernel⟩

def target19 : Weights.Entry :=
  { word := [12, 2, 8, 10, 0, 8, 12], weights := [0, 1, 0, 1] }

def points19 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8676, representative 146.
def source20 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B001.Data.entryAt ⟨10, by decide +kernel⟩

def target20 : Weights.Entry :=
  { word := [12, 2, 8, 10, 8, 8, 12], weights := [0, 1, 0, 1] }

def points20 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8680, representative 138.
def source21 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B001.Data.entryAt ⟨2, by decide +kernel⟩

def target21 : Weights.Entry :=
  { word := [12, 2, 8, 10, 8, 12, 12], weights := [1, 2, 1, 2] }

def points21 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8700, representative 264.
def source22 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B001.Data.entryAt ⟨125, by decide +kernel⟩

def target22 : Weights.Entry :=
  { word := [12, 4, 8, 8, 1, 12, 2], weights := [1, 0, 1, 1] }

def points22 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8991, representative 218.
def source23 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B001.Data.entryAt ⟨79, by decide +kernel⟩

def target23 : Weights.Entry :=
  { word := [12, 10, 0, 9, 8, 2, 2], weights := [1, 1, 0, 1] }

def points23 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8998, representative 217.
def source24 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B001.Data.entryAt ⟨78, by decide +kernel⟩

def target24 : Weights.Entry :=
  { word := [12, 10, 0, 9, 8, 10, 2], weights := [1, 1, 0, 1] }

def points24 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 9005, representative 222.
def source25 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B001.Data.entryAt ⟨83, by decide +kernel⟩

def target25 : Weights.Entry :=
  { word := [12, 10, 0, 12, 2, 0, 2], weights := [1, 1, 0, 1] }

def points25 : List (ℕ × ℕ) := [(0, 1), (1, 2), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 9013, representative 221.
def source26 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B001.Data.entryAt ⟨82, by decide +kernel⟩

def target26 : Weights.Entry :=
  { word := [12, 10, 0, 12, 10, 0, 2], weights := [1, 1, 0, 1] }

def points26 : List (ℕ × ℕ) := [(0, 1), (1, 2), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 9065, representative 263.
def source27 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B001.Data.entryAt ⟨124, by decide +kernel⟩

def target27 : Weights.Entry :=
  { word := [12, 12, 8, 8, 1, 12, 2], weights := [1, 0, 1, 1] }

def points27 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 8, original row 2390, representative 216.
def source28 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B001.Data.entryAt ⟨77, by decide +kernel⟩

def target28 : Weights.Entry :=
  { word := [2, 0, 0, 9, 4, 12, 12], weights := [1, 0, 1, 1] }

def points28 : List (ℕ × ℕ) := [(0, 7), (1, 0), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 8, original row 2394, representative 214.
def source29 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B001.Data.entryAt ⟨75, by decide +kernel⟩

def target29 : Weights.Entry :=
  { word := [2, 0, 0, 9, 12, 12, 12], weights := [1, 0, 1, 1] }

def points29 : List (ℕ × ℕ) := [(0, 7), (1, 0), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 8, original row 8236, representative 216.
def source30 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B001.Data.entryAt ⟨77, by decide +kernel⟩

def target30 : Weights.Entry :=
  { word := [10, 10, 2, 8, 1, 0, 4], weights := [1, 1, 0, 1] }

def points30 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 8, original row 8380, representative 214.
def source31 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B001.Data.entryAt ⟨75, by decide +kernel⟩

def target31 : Weights.Entry :=
  { word := [10, 10, 10, 8, 1, 0, 4], weights := [1, 1, 0, 1] }

def points31 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

def period7Entries : List Weights.Entry := [target0, target1, target2, target3, target4, target5, target6, target7, target8, target9, target10, target11, target12, target13, target14, target15, target16, target17, target18, target19, target20, target21, target22, target23, target24, target25, target26, target27]

def period7Chunk : RowCoverage.Chunk where
  rows := [⟨8362, target0⟩, ⟨8374, target1⟩, ⟨8375, target2⟩, ⟨8376, target3⟩, ⟨8377, target4⟩, ⟨8378, target5⟩, ⟨8384, target6⟩, ⟨8385, target7⟩, ⟨8399, target8⟩, ⟨8586, target9⟩, ⟨8591, target10⟩, ⟨8593, target11⟩, ⟨8602, target12⟩, ⟨8608, target13⟩, ⟨8610, target14⟩, ⟨8612, target15⟩, ⟨8619, target16⟩, ⟨8632, target17⟩, ⟨8640, target18⟩, ⟨8665, target19⟩, ⟨8676, target20⟩, ⟨8680, target21⟩, ⟨8700, target22⟩, ⟨8991, target23⟩, ⟨8998, target24⟩, ⟨9005, target25⟩, ⟨9013, target26⟩, ⟨9065, target27⟩]
  indexMask := 68692716943521556369142087124252932770596185965273403008948241313815262321443365860301205706163312453291062505272996785595925004206037775624922410056758359568454644675714343485272038237111560172665850466829225751371661579916751922051287777166845310374408773287667418059148832000999034687210708719048775612481156712745842933079007994148526053132490112974061097719573625529774175440604324148380203316223891769194439863149466709704548947599149150243796295029102351174256485946070135914581530472747030793676510012099897286662598426700702597837583963611122159241949087171172044107942374737856636885153778086994775265978498048549280702685225615911217830777172394602166939367366023166106392252224921652126834792363172298847039156403122486459491719640521770298711689163999146907038616683573146864396748191229905260735663792902496275200470049271762312635889153285595213112061825057448822202517925663670489862716299724233831981668604880913733209890546827006349275172103459880074789231865434839059079420415189071070585219449469361727598780967305547043091717115428642786417417039851017968419448124941656869346549979559097542467124445240319256296696745311430777987652965981643680996283008586617076294388908389136426091032271233173426433691502272245091536499442234467936467843375464853718669016341747028671696755362557058153024546101497248591085130729114632107255688267346405021031836266523342284567586721132964229507803716417448727519970209111738596668725350993368466041254911454015458127323079312621309336880149301610913993403668149420166797068143603483534237410589861872730394922715231318798431140082343899558462339967421373813221780193247455009388781538594305157978832185038078471107259906034039111596026730589522764054174364141381675371179334653901081167016550953455602654131599407143876034530671549853531009273707748051282569515716793439467537160517503077365486250168348769162390253559250197274853980459807073401005203284766869209194640733636171780233295072122910258969206753505879437474215284652487047846637373524429723973481484693839452063879850913394458627520429982519576743477825921353567200902382986263118388795970213314305837954865013788702403514022068362895942016664781935712831274081498203191021853853182741126643802678270420489900090665463237544339898786546780924424355070082099993704943876032611578665283215983647238254545360178257500051622216203135750410366665086586077535783581287719987168671386655989362618398041165846007792645105990672564554361008609845478047910181285403690377861342397702585461108934613117194097644177077390429882591662723333221956443919609159183899462873914414594412125695540589306747385939194882924807040269414239801032175977803293868250851158029517688683042426199040846697170116837126755067274257760256
  count := 28

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

def period8Entries : List Weights.Entry := [target28, target29, target30, target31]

def period8Chunk : RowCoverage.Chunk where
  rows := [⟨2390, target28⟩, ⟨2394, target29⟩, ⟨8236, target30⟩, ⟨8380, target31⟩]
  indexMask := 427921063435401397047032187828086443154699367076229151515429727680979439469528077811987310360142307532482819250941187837345721662014966044078932181959845765994194065856701351174203431761491984671593083534838014767193969273304879951408258304318204152053414295501363685441419733655465173251079112332422055643279265876764213337050144255587163477536610563842507273284522352472198900797294420742513712074626469937786589368650115000796714180120057149707497640646543942134711618274728407625984148972087471226354411760068328513524619338734596389438500834470922887564516943101508455012744919765696104594560473767128400555130359043722930665760054634324007348988117676667290521724365352920404211608415154591209322971070442522416022174699664231489123934104412793304480177981542055618778119396880948134196656660665320389711440538327582044386740133904224298477249046025145274497211672398612160148984767946140450461168554921438551835750068287721939919415299181195335532442567714672683988830613598019027374808169526924417021100320760340871791505900511804210335322287436664382703658097741752665510052628373121861585754390724412260037181718144969580127196807077538828578979953336804580347792973355984694982488312958178036598234658352535646860308819023235622517416871408117115017757013289822288711120488640359425386499732040580084026288801108348394609123805288319176421587932340735882608001951140152416553224335428845724027809256081212345384535285669831255491174332570389435740072854373918038664517093139615564044485513152929664429365553440765323261576274865949635061070047630431481287367672915814972961201946039576278486297603670356317019000510302264118305624616914121051042740795077398826172510195459437872367399358540013464035281867816067542331120777406221750729055196740289382509069387394778790264154251670600466551358969573938555649063447148736140079205838465341885433018209147451676569812414465256416450008836215030842360549308937904990412177451929941453847512577766202390557991215198718445313563485410754054822916048413611592758448796059512074101484160839017316380425392673249585207821925559627329511623838268565807909259890055220637603911608115956219512575321953336986019445725476558961908708483506375281539184062310256250879980885586603724798759397184556726456871885515843331316045093787815309406327768037412974568340881406012233283226110833806072442141721786624438025500493407674111535542131256057994648972638401794382097332467865312324276237809330606782876639561029114365154149019234274174249067852815444170456681783501515359518720
  count := 4

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem period8Chunk_entries :
    period8Chunk.rows.map RowCoverage.TaggedRow.entry = period8Entries := rfl

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem period8_index_check :
    RowCoverage.indexCheck CanonicalWords.count period8Chunk = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem period8_words_check :
    RowCoverage.wordsCheck CanonicalWords.wordAt period8Chunk = true := by
  decide +kernel

end FranklSmallCyclic.TransportBatches.G001.B002.Data
