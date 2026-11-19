module

public import Conjectures.FranklSmallCyclicRowCoverage
public import Conjectures.FranklSmallCyclicCanonicalWords
public import Conjectures.FranklSmallCyclicOrbit7Block021Data

/-! 10 literal targets sharing one source proof block.
Original words and row indices are retained; weights may be transported.
-/
@[expose] public section

namespace FranklSmallCyclic.TransportBatches.G021.B004.Data

-- Period 8, original row 4927, representative 2724.
def source0 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B021.Data.entryAt ⟨22, by decide +kernel⟩

def target0 : Weights.Entry :=
  { word := [8, 2, 10, 2, 0, 2, 0], weights := [1, 0, 0, 0] }

def points0 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 8, original row 4960, representative 2731.
def source1 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B021.Data.entryAt ⟨29, by decide +kernel⟩

def target1 : Weights.Entry :=
  { word := [8, 2, 10, 10, 0, 2, 0], weights := [0, 1, 1, 0] }

def points1 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 8, original row 5098, representative 2768.
def source2 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B021.Data.entryAt ⟨66, by decide +kernel⟩

def target2 : Weights.Entry :=
  { word := [8, 4, 4, 4, 0, 0, 4], weights := [1, 0, 0, 0] }

def points2 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 2), (3, 5), (4, 4), (5, 6), (6, 3)]

-- Period 8, original row 5126, representative 2783.
def source3 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B021.Data.entryAt ⟨81, by decide +kernel⟩

def target3 : Weights.Entry :=
  { word := [8, 4, 4, 12, 0, 0, 4], weights := [0, 1, 0, 1] }

def points3 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 2), (3, 5), (4, 4), (5, 6), (6, 3)]

-- Period 8, original row 6428, representative 2710.
def source4 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B021.Data.entryAt ⟨8, by decide +kernel⟩

def target4 : Weights.Entry :=
  { word := [8, 12, 4, 4, 0, 0, 4], weights := [1, 0, 0, 1] }

def points4 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 8, original row 6456, representative 2715.
def source5 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B021.Data.entryAt ⟨13, by decide +kernel⟩

def target5 : Weights.Entry :=
  { word := [8, 12, 4, 12, 0, 0, 4], weights := [1, 0, 0, 1] }

def points5 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 8, original row 6965, representative 2768.
def source6 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B021.Data.entryAt ⟨66, by decide +kernel⟩

def target6 : Weights.Entry :=
  { word := [9, 4, 4, 4, 0, 0, 4], weights := [1, 0, 0, 0] }

def points6 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 2), (3, 5), (4, 4), (5, 6), (6, 3)]

-- Period 8, original row 6993, representative 2783.
def source7 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B021.Data.entryAt ⟨81, by decide +kernel⟩

def target7 : Weights.Entry :=
  { word := [9, 4, 4, 12, 0, 0, 4], weights := [0, 1, 0, 1] }

def points7 : List (ℕ × ℕ) := [(0, 1), (1, 0), (2, 2), (3, 5), (4, 4), (5, 6), (6, 3)]

-- Period 8, original row 7301, representative 2710.
def source8 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B021.Data.entryAt ⟨8, by decide +kernel⟩

def target8 : Weights.Entry :=
  { word := [9, 12, 4, 4, 0, 0, 4], weights := [1, 0, 0, 1] }

def points8 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 8, original row 7329, representative 2715.
def source9 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B021.Data.entryAt ⟨13, by decide +kernel⟩

def target9 : Weights.Entry :=
  { word := [9, 12, 4, 12, 0, 0, 4], weights := [1, 0, 0, 1] }

def points9 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

def period8Entries : List Weights.Entry := [target0, target1, target2, target3, target4, target5, target6, target7, target8, target9]

def period8Chunk : RowCoverage.Chunk where
  rows := [⟨4927, target0⟩, ⟨4960, target1⟩, ⟨5098, target2⟩, ⟨5126, target3⟩, ⟨6428, target4⟩, ⟨6456, target5⟩, ⟨6965, target6⟩, ⟨6993, target7⟩, ⟨7301, target8⟩, ⟨7329, target9⟩]
  indexMask := 17735287087071144575892368274628013993125175514997195559217877543554938425969326751129431797196792181520849221146981528023894805488327024737592415803923040465841291651460232409188780124335312826973438843345133383874283236969989919475335331081642664652791580875997254953728285760010095054239875379921652035967979556666360694171420230720012826698116322135750218403025757558167328524314145140317839002391190402320297413482260923373395960440096721148815624673845395650674610555635134569508314105318198500727914903564329833110536264262200858057422979288360105971299435477974143938071811426819295606449026954522582524688655782553463517121060993373434825738391956799891095285180640762180784952484884539395915615878381202263180378348226468783927980271036813684292765644566324288196796516897640667540704125190740223182297721340992562090116854754824465245794218928120573974348951186442220900044564939265079766368592053981929601527650359757386765720167399285439351631814835797525280063382806186839243919211346095707131956193119703255402597686475343022215490387743075290589901350358021059437659710112100119919090341709353940542607064580602837369406314396208067943076624561836187380941155247009612029753679214860215000623930169850326417400692793964116533909751918424151523733828240894106662802759381841171699084402073936939727377555882872807247757443651217967845559200425952369909135407317543268907236045423741384106495228762835581212194330990485052167656428028280366130394204773428534709343719368267548609523864387299479629248813235265422698018122017466209064218743800359590389872769245360520351888094437801600092076587930307430987169887136147970165379003843600592995916411352782718808911051912829838196593234645573208678292269827819773208838201022126626056690962681733489654569703160076539439425343704072194267573978725369564309238096689354160571567705617776961389648237654389743009517302910821541720601622328338204085730662668643608702087467512846932060081994109277724403422285927547774141444700736514937842374693223172258737639639302993851271356001060439222794199259844312330796423365352591159928366638837920508996110051415466202635025787369913123572443250053938370010745467960396289215113989561176685596287531220992
  count := 10

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

end FranklSmallCyclic.TransportBatches.G021.B004.Data
