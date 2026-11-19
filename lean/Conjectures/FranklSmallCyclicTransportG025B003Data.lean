module

public import Conjectures.FranklSmallCyclicRowCoverage
public import Conjectures.FranklSmallCyclicCanonicalWords
public import Conjectures.FranklSmallCyclicOrbit7Block025Data

/-! 23 literal targets sharing one source proof block.
Original words and row indices are retained; weights may be transported.
-/
@[expose] public section

namespace FranklSmallCyclic.TransportBatches.G025.B003.Data

-- Period 9, original row 2192, representative 3303.
def source0 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨86, by decide +kernel⟩

def target0 : Weights.Entry :=
  { word := [1, 8, 12, 4, 4, 0, 0], weights := [0, 0, 1, 0] }

def points0 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 9, original row 2196, representative 3301.
def source1 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨84, by decide +kernel⟩

def target1 : Weights.Entry :=
  { word := [1, 8, 12, 4, 12, 0, 0], weights := [0, 0, 1, 0] }

def points1 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 10, original row 53, representative 3304.
def source2 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨87, by decide +kernel⟩

def target2 : Weights.Entry :=
  { word := [0, 0, 2, 2, 2, 8, 0], weights := [0, 1, 0, 0] }

def points2 : List (ℕ × ℕ) := [(0, 7), (1, 8), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 10, original row 68, representative 3303.
def source3 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨86, by decide +kernel⟩

def target3 : Weights.Entry :=
  { word := [0, 0, 2, 2, 10, 8, 0], weights := [0, 1, 0, 0] }

def points3 : List (ℕ × ℕ) := [(0, 7), (1, 8), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 10, original row 76, representative 3296.
def source4 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨79, by decide +kernel⟩

def target4 : Weights.Entry :=
  { word := [0, 0, 6, 2, 0, 8, 0], weights := [1, 0, 0, 0] }

def points4 : List (ℕ × ℕ) := [(0, 7), (1, 8), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 10, original row 84, representative 3295.
def source5 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨78, by decide +kernel⟩

def target5 : Weights.Entry :=
  { word := [0, 0, 6, 2, 8, 8, 0], weights := [0, 1, 0, 0] }

def points5 : List (ℕ × ℕ) := [(0, 7), (1, 8), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 10, original row 104, representative 3302.
def source6 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨85, by decide +kernel⟩

def target6 : Weights.Entry :=
  { word := [0, 0, 10, 2, 2, 8, 0], weights := [0, 1, 0, 0] }

def points6 : List (ℕ × ℕ) := [(0, 7), (1, 8), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 10, original row 112, representative 3301.
def source7 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨84, by decide +kernel⟩

def target7 : Weights.Entry :=
  { word := [0, 0, 10, 2, 10, 8, 0], weights := [0, 1, 0, 0] }

def points7 : List (ℕ × ℕ) := [(0, 7), (1, 8), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 10, original row 827, representative 3296.
def source8 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨79, by decide +kernel⟩

def target8 : Weights.Entry :=
  { word := [0, 8, 0, 4, 6, 0, 0], weights := [0, 0, 1, 0] }

def points8 : List (ℕ × ℕ) := [(0, 1), (1, 2), (2, 7), (3, 5), (4, 6), (5, 4), (6, 3)]

-- Period 10, original row 996, representative 3304.
def source9 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨87, by decide +kernel⟩

def target9 : Weights.Entry :=
  { word := [0, 8, 4, 4, 4, 0, 0], weights := [0, 0, 1, 0] }

def points9 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 10, original row 1000, representative 3302.
def source10 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨85, by decide +kernel⟩

def target10 : Weights.Entry :=
  { word := [0, 8, 4, 4, 12, 0, 0], weights := [0, 0, 1, 0] }

def points10 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 10, original row 1046, representative 3295.
def source11 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨78, by decide +kernel⟩

def target11 : Weights.Entry :=
  { word := [0, 8, 8, 4, 6, 0, 0], weights := [0, 0, 1, 0] }

def points11 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 10, original row 1110, representative 3303.
def source12 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨86, by decide +kernel⟩

def target12 : Weights.Entry :=
  { word := [0, 8, 12, 4, 4, 0, 0], weights := [0, 0, 1, 0] }

def points12 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 10, original row 1114, representative 3301.
def source13 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨84, by decide +kernel⟩

def target13 : Weights.Entry :=
  { word := [0, 8, 12, 4, 12, 0, 0], weights := [0, 0, 1, 0] }

def points13 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 10, original row 1790, representative 3304.
def source14 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨87, by decide +kernel⟩

def target14 : Weights.Entry :=
  { word := [1, 0, 2, 2, 2, 8, 0], weights := [0, 1, 0, 0] }

def points14 : List (ℕ × ℕ) := [(0, 7), (1, 8), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 10, original row 1805, representative 3303.
def source15 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨86, by decide +kernel⟩

def target15 : Weights.Entry :=
  { word := [1, 0, 2, 2, 10, 8, 0], weights := [0, 1, 0, 0] }

def points15 : List (ℕ × ℕ) := [(0, 7), (1, 8), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 10, original row 1825, representative 3302.
def source16 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨85, by decide +kernel⟩

def target16 : Weights.Entry :=
  { word := [1, 0, 10, 2, 2, 8, 0], weights := [0, 1, 0, 0] }

def points16 : List (ℕ × ℕ) := [(0, 7), (1, 8), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 10, original row 1833, representative 3301.
def source17 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨84, by decide +kernel⟩

def target17 : Weights.Entry :=
  { word := [1, 0, 10, 2, 10, 8, 0], weights := [0, 1, 0, 0] }

def points17 : List (ℕ × ℕ) := [(0, 7), (1, 8), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 10, original row 2126, representative 3304.
def source18 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨87, by decide +kernel⟩

def target18 : Weights.Entry :=
  { word := [1, 8, 4, 4, 4, 0, 0], weights := [0, 0, 1, 0] }

def points18 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 10, original row 2130, representative 3302.
def source19 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨85, by decide +kernel⟩

def target19 : Weights.Entry :=
  { word := [1, 8, 4, 4, 12, 0, 0], weights := [0, 0, 1, 0] }

def points19 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 10, original row 2138, representative 3295.
def source20 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨78, by decide +kernel⟩

def target20 : Weights.Entry :=
  { word := [1, 8, 8, 4, 6, 0, 0], weights := [0, 0, 1, 0] }

def points20 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 10, original row 2192, representative 3303.
def source21 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨86, by decide +kernel⟩

def target21 : Weights.Entry :=
  { word := [1, 8, 12, 4, 4, 0, 0], weights := [0, 0, 1, 0] }

def points21 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 10, original row 2196, representative 3301.
def source22 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B025.Data.entryAt ⟨84, by decide +kernel⟩

def target22 : Weights.Entry :=
  { word := [1, 8, 12, 4, 12, 0, 0], weights := [0, 0, 1, 0] }

def points22 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3)]

def period9Entries : List Weights.Entry := [target0, target1]

def period9Chunk : RowCoverage.Chunk where
  rows := [⟨2192, target0⟩, ⟨2196, target1⟩]
  indexMask := 12251786405586457029513318645769281990871642807941350672613335293035007355433272529011681996992000937259142884782929769586807374149865432744553650981745401459203291220179840169599967577057877854691678659877824200905624750781146550110437612882526912073097722120914824870088486131490888468517192570299122081409214836014401410347558448130941157256056552305244432288534816218650302483525250885763554748612230175700712049582709392957824105229981692299708733246546501172819262667568058363115426664162028692821324807756961777644458007873898557730731488686862298939883276172605339547804578790907526775939581227307810054142758696674090932709094124861611941958721032159232
  count := 2

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem period9Chunk_entries :
    period9Chunk.rows.map RowCoverage.TaggedRow.entry = period9Entries := rfl

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem period9_index_check :
    RowCoverage.indexCheck CanonicalWords.count period9Chunk = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem period9_words_check :
    RowCoverage.wordsCheck CanonicalWords.wordAt period9Chunk = true := by
  decide +kernel

def period10Entries : List Weights.Entry := [target2, target3, target4, target5, target6, target7, target8, target9, target10, target11, target12, target13, target14, target15, target16, target17, target18, target19, target20, target21, target22]

def period10Chunk : RowCoverage.Chunk where
  rows := [⟨53, target2⟩, ⟨68, target3⟩, ⟨76, target4⟩, ⟨84, target5⟩, ⟨104, target6⟩, ⟨112, target7⟩, ⟨827, target8⟩, ⟨996, target9⟩, ⟨1000, target10⟩, ⟨1046, target11⟩, ⟨1110, target12⟩, ⟨1114, target13⟩, ⟨1790, target14⟩, ⟨1805, target15⟩, ⟨1825, target16⟩, ⟨1833, target17⟩, ⟨2126, target18⟩, ⟨2130, target19⟩, ⟨2138, target20⟩, ⟨2192, target21⟩, ⟨2196, target22⟩]
  indexMask := 12251786405586457069685877079245968304765397111873834792738675208691187022665315233747756026318688427425647052270638209119528469538377762450070215832667014412604970414265165305192969002865347843275902736418846010067058188846548215649546333280145542478889774744051952252244467374237026335893474553559209689182887758503784444848056888077841303702702401402205770582414837594019739189853507327964538128030565160680013131997723409847184407430284565643429632588026979687194118558972298379565924512938949153418343175541861103419698887136066691379300237105967206082634772077364284835489866514049185115170643704153141823116396048243904684941468534921381789592245468397568
  count := 21

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

end FranklSmallCyclic.TransportBatches.G025.B003.Data
