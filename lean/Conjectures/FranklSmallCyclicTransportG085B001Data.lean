module

public import Conjectures.FranklSmallCyclicRowCoverage
public import Conjectures.FranklSmallCyclicCanonicalWords
public import Conjectures.FranklSmallCyclicOrbit10Block007Data

/-! 28 literal targets sharing one source proof block.
Original words and row indices are retained; weights may be transported.
-/
@[expose] public section

namespace FranklSmallCyclic.TransportBatches.G085.B001.Data

-- Period 10, original row 8101, representative 9902.
def source0 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B007.Data.entryAt ⟨6, by decide +kernel⟩

def target0 : Weights.Entry :=
  { word := [10, 8, 8, 12, 12, 12, 8], weights := [1, 0, 0, 1] }

def points0 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8103, representative 9918.
def source1 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B007.Data.entryAt ⟨22, by decide +kernel⟩

def target1 : Weights.Entry :=
  { word := [10, 8, 9, 0, 1, 12, 8], weights := [0, 0, 1, 0] }

def points1 : List (ℕ × ℕ) := [(0, 9), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8111, representative 9919.
def source2 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B007.Data.entryAt ⟨23, by decide +kernel⟩

def target2 : Weights.Entry :=
  { word := [10, 8, 9, 8, 1, 12, 8], weights := [0, 0, 1, 0] }

def points2 : List (ℕ × ℕ) := [(0, 9), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8425, representative 9915.
def source3 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B007.Data.entryAt ⟨19, by decide +kernel⟩

def target3 : Weights.Entry :=
  { word := [12, 0, 0, 12, 0, 12, 8], weights := [0, 0, 1, 0] }

def points3 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8), (9, 9)]

-- Period 10, original row 8471, representative 9927.
def source4 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B007.Data.entryAt ⟨31, by decide +kernel⟩

def target4 : Weights.Entry :=
  { word := [12, 0, 4, 10, 0, 12, 8], weights := [1, 0, 1, 1] }

def points4 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8), (9, 9)]

-- Period 10, original row 8498, representative 9910.
def source5 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B007.Data.entryAt ⟨14, by decide +kernel⟩

def target5 : Weights.Entry :=
  { word := [12, 0, 8, 4, 4, 12, 8], weights := [1, 0, 0, 1] }

def points5 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8), (9, 9)]

-- Period 10, original row 8515, representative 9911.
def source6 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B007.Data.entryAt ⟨15, by decide +kernel⟩

def target6 : Weights.Entry :=
  { word := [12, 0, 8, 12, 4, 12, 8], weights := [1, 0, 0, 1] }

def points6 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8), (9, 9)]

-- Period 10, original row 8564, representative 9926.
def source7 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B007.Data.entryAt ⟨30, by decide +kernel⟩

def target7 : Weights.Entry :=
  { word := [12, 0, 12, 10, 0, 12, 8], weights := [1, 0, 1, 1] }

def points7 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8), (9, 9)]

-- Period 10, original row 8694, representative 9920.
def source8 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B007.Data.entryAt ⟨24, by decide +kernel⟩

def target8 : Weights.Entry :=
  { word := [12, 4, 8, 0, 1, 12, 8], weights := [0, 0, 1, 0] }

def points8 : List (ℕ × ℕ) := [(0, 9), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8702, representative 9921.
def source9 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B007.Data.entryAt ⟨25, by decide +kernel⟩

def target9 : Weights.Entry :=
  { word := [12, 4, 8, 8, 1, 12, 8], weights := [0, 0, 1, 0] }

def points9 : List (ℕ × ℕ) := [(0, 9), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8748, representative 9953.
def source10 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B007.Data.entryAt ⟨57, by decide +kernel⟩

def target10 : Weights.Entry :=
  { word := [12, 8, 0, 4, 4, 4, 8], weights := [1, 0, 0, 1] }

def points10 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8755, representative 9957.
def source11 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B007.Data.entryAt ⟨61, by decide +kernel⟩

def target11 : Weights.Entry :=
  { word := [12, 8, 0, 4, 8, 4, 8], weights := [1, 0, 0, 1] }

def points11 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8759, representative 9907.
def source12 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B007.Data.entryAt ⟨11, by decide +kernel⟩

def target12 : Weights.Entry :=
  { word := [12, 8, 0, 4, 8, 12, 8], weights := [1, 0, 0, 1] }

def points12 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8774, representative 9954.
def source13 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B007.Data.entryAt ⟨58, by decide +kernel⟩

def target13 : Weights.Entry :=
  { word := [12, 8, 0, 4, 12, 4, 8], weights := [1, 0, 0, 1] }

def points13 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8792, representative 9956.
def source14 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B007.Data.entryAt ⟨60, by decide +kernel⟩

def target14 : Weights.Entry :=
  { word := [12, 8, 0, 12, 4, 4, 8], weights := [1, 0, 0, 1] }

def points14 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8798, representative 9958.
def source15 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B007.Data.entryAt ⟨62, by decide +kernel⟩

def target15 : Weights.Entry :=
  { word := [12, 8, 0, 12, 8, 4, 8], weights := [1, 0, 0, 1] }

def points15 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8802, representative 9908.
def source16 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B007.Data.entryAt ⟨12, by decide +kernel⟩

def target16 : Weights.Entry :=
  { word := [12, 8, 0, 12, 8, 12, 8], weights := [1, 0, 0, 1] }

def points16 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8817, representative 9955.
def source17 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B007.Data.entryAt ⟨59, by decide +kernel⟩

def target17 : Weights.Entry :=
  { word := [12, 8, 0, 12, 12, 4, 8], weights := [1, 0, 0, 1] }

def points17 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8894, representative 9942.
def source18 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B007.Data.entryAt ⟨46, by decide +kernel⟩

def target18 : Weights.Entry :=
  { word := [12, 8, 8, 4, 4, 4, 8], weights := [1, 0, 0, 1] }

def points18 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8896, representative 9896.
def source19 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B007.Data.entryAt ⟨0, by decide +kernel⟩

def target19 : Weights.Entry :=
  { word := [12, 8, 8, 4, 4, 12, 8], weights := [1, 0, 0, 1] }

def points19 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8902, representative 9943.
def source20 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B007.Data.entryAt ⟨47, by decide +kernel⟩

def target20 : Weights.Entry :=
  { word := [12, 8, 8, 4, 12, 4, 8], weights := [1, 0, 0, 1] }

def points20 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8904, representative 9897.
def source21 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B007.Data.entryAt ⟨1, by decide +kernel⟩

def target21 : Weights.Entry :=
  { word := [12, 8, 8, 4, 12, 12, 8], weights := [1, 0, 0, 1] }

def points21 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8916, representative 9945.
def source22 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B007.Data.entryAt ⟨49, by decide +kernel⟩

def target22 : Weights.Entry :=
  { word := [12, 8, 8, 12, 4, 4, 8], weights := [1, 0, 0, 1] }

def points22 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8918, representative 9899.
def source23 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B007.Data.entryAt ⟨3, by decide +kernel⟩

def target23 : Weights.Entry :=
  { word := [12, 8, 8, 12, 4, 12, 8], weights := [1, 0, 0, 1] }

def points23 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8923, representative 9944.
def source24 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B007.Data.entryAt ⟨48, by decide +kernel⟩

def target24 : Weights.Entry :=
  { word := [12, 8, 8, 12, 12, 4, 8], weights := [1, 0, 0, 1] }

def points24 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 8925, representative 9898.
def source25 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B007.Data.entryAt ⟨2, by decide +kernel⟩

def target25 : Weights.Entry :=
  { word := [12, 8, 8, 12, 12, 12, 8], weights := [1, 0, 0, 1] }

def points25 : List (ℕ × ℕ) := [(0, 9), (1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 9059, representative 9916.
def source26 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B007.Data.entryAt ⟨20, by decide +kernel⟩

def target26 : Weights.Entry :=
  { word := [12, 12, 8, 0, 1, 12, 8], weights := [0, 0, 1, 0] }

def points26 : List (ℕ × ℕ) := [(0, 9), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

-- Period 10, original row 9067, representative 9917.
def source27 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P10.B007.Data.entryAt ⟨21, by decide +kernel⟩

def target27 : Weights.Entry :=
  { word := [12, 12, 8, 8, 1, 12, 8], weights := [0, 0, 1, 0] }

def points27 : List (ℕ × ℕ) := [(0, 9), (1, 7), (2, 8), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1), (9, 0)]

def period10Entries : List Weights.Entry := [target0, target1, target2, target3, target4, target5, target6, target7, target8, target9, target10, target11, target12, target13, target14, target15, target16, target17, target18, target19, target20, target21, target22, target23, target24, target25, target26, target27]

def period10Chunk : RowCoverage.Chunk where
  rows := [⟨8101, target0⟩, ⟨8103, target1⟩, ⟨8111, target2⟩, ⟨8425, target3⟩, ⟨8471, target4⟩, ⟨8498, target5⟩, ⟨8515, target6⟩, ⟨8564, target7⟩, ⟨8694, target8⟩, ⟨8702, target9⟩, ⟨8748, target10⟩, ⟨8755, target11⟩, ⟨8759, target12⟩, ⟨8774, target13⟩, ⟨8792, target14⟩, ⟨8798, target15⟩, ⟨8802, target16⟩, ⟨8817, target17⟩, ⟨8894, target18⟩, ⟨8896, target19⟩, ⟨8902, target20⟩, ⟨8904, target21⟩, ⟨8916, target22⟩, ⟨8918, target23⟩, ⟨8923, target24⟩, ⟨8925, target25⟩, ⟨9059, target26⟩, ⟨9067, target27⟩]
  indexMask := 275844191476328688303981183031502555818109392865785964358950814970943670265761047499985915774700527007477758919170428037477280592294933936932030832590124796558363805358455960710925539925839483473907878605974037830390010527445292326511818476873377305416963527137385052223244327678712356018135855740580159733482435445222066331784577806611588587154188694036963036507330664937331838724241725622980827642684877237967762287143296432170470976471918569452864545996150516375534976078878960578067964824602102211030132864886275570266773264765383908839170510842047855213291062846519750703753832584602925295282343243999843837238986205015095567653545925510325529854164018200233324557876921091785445859489298112419716790579751170276369661575454756454180340237097105222993919420109381751099216138778524774086002159027662587927931924433079034245085891862530825131333944256229999294195312445116977432129121913830726828559268606943226595112681834285641296697632825573712552508885151144530855984668073468177403914460291599715484381199755985458902282172087754125785014397372225122202095353604736741329396863087256966864133343075961055221376324663104019011171717388521761265611973487855378704402280888379701469055817503783236809870046183049008382714905967103532767388599127310081135150501562192591385943775452849793859527998802857334813576399752485145324159272458855786968058901489943686214605259553014827646811968252744950418718905253590599646718392710715871195325146096978050122762249601042745928527985410281174464501758387747675795741057429682030603453050456778155149802308237821627991764659327091569206710532920331568620112259680149669933044896905264240456209348630312521050715640255139200413506988951367521283861213517932071860524614796203897430702049939338869936874989532143223816440000203529792554065115962164095582659367066010219853891255479284319330257791739933196132487908473511974182213361214955461961002868269471506085131131202783629191763923116099470799517028366448285991727706308074861365348682658859061013683529967880291071064140628938323457784204850781127903144375971888385950015581629770883015705596775966292394996736769986128880835272261749882506040539258204721085276886214304628557589204243321304039545004422840730856310056115800402973609891045631939660033930204831738827183866442760039130067699581570259232920784130464096408115777554904050059330014613519933137497276911881137211360210394067725518944559981793375162949122204646859897651207702257895322015741487289306937046852736040452395052036552253180645332553760528264894843820834898032704622083738717950133780143952823998355733804187295825242096106701824637416740019183127290020417335282302868375235065782298985029522500900240789606010240873218621293533686976794252516418956296192
  count := 28

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

end FranklSmallCyclic.TransportBatches.G085.B001.Data
