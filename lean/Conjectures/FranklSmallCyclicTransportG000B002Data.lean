module

public import Conjectures.FranklSmallCyclicRowCoverage
public import Conjectures.FranklSmallCyclicCanonicalWords
public import Conjectures.FranklSmallCyclicOrbit7Block000Data

/-! 40 literal targets sharing one source proof block.
Original words and row indices are retained; weights may be transported.
-/
@[expose] public section

namespace FranklSmallCyclic.TransportBatches.G000.B002.Data

-- Period 7, original row 8720, representative 80.
def source0 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B000.Data.entryAt ⟨76, by decide +kernel⟩

def target0 : Weights.Entry :=
  { word := [12, 4, 12, 8, 8, 2, 10], weights := [0, 1, 1, 0] }

def points0 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8722, representative 78.
def source1 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B000.Data.entryAt ⟨74, by decide +kernel⟩

def target1 : Weights.Entry :=
  { word := [12, 4, 12, 8, 8, 10, 10], weights := [0, 1, 1, 0] }

-- Period 7, original row 8740, representative 86.
def source2 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B000.Data.entryAt ⟨82, by decide +kernel⟩

def target2 : Weights.Entry :=
  { word := [12, 8, 0, 4, 2, 0, 10], weights := [1, 0, 0, 1] }

def points2 : List (ℕ × ℕ) := [(0, 1), (1, 2), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8745, representative 82.
def source3 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B000.Data.entryAt ⟨78, by decide +kernel⟩

def target3 : Weights.Entry :=
  { word := [12, 8, 0, 4, 2, 8, 10], weights := [1, 0, 1, 0] }

-- Period 7, original row 8756, representative 46.
def source4 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B000.Data.entryAt ⟨43, by decide +kernel⟩

def target4 : Weights.Entry :=
  { word := [12, 8, 0, 4, 8, 4, 10], weights := [1, 0, 0, 1] }

def points4 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8766, representative 91.
def source5 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B000.Data.entryAt ⟨87, by decide +kernel⟩

def target5 : Weights.Entry :=
  { word := [12, 8, 0, 4, 10, 0, 10], weights := [1, 0, 0, 1] }

def points5 : List (ℕ × ℕ) := [(0, 1), (1, 2), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8771, representative 83.
def source6 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B000.Data.entryAt ⟨79, by decide +kernel⟩

def target6 : Weights.Entry :=
  { word := [12, 8, 0, 4, 10, 8, 10], weights := [1, 0, 1, 0] }

-- Period 7, original row 8784, representative 93.
def source7 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B000.Data.entryAt ⟨89, by decide +kernel⟩

def target7 : Weights.Entry :=
  { word := [12, 8, 0, 12, 2, 0, 10], weights := [1, 0, 0, 1] }

def points7 : List (ℕ × ℕ) := [(0, 1), (1, 2), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8789, representative 85.
def source8 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B000.Data.entryAt ⟨81, by decide +kernel⟩

def target8 : Weights.Entry :=
  { word := [12, 8, 0, 12, 2, 8, 10], weights := [1, 0, 1, 0] }

-- Period 7, original row 8799, representative 47.
def source9 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B000.Data.entryAt ⟨44, by decide +kernel⟩

def target9 : Weights.Entry :=
  { word := [12, 8, 0, 12, 8, 4, 10], weights := [1, 0, 0, 1] }

def points9 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8809, representative 92.
def source10 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B000.Data.entryAt ⟨88, by decide +kernel⟩

def target10 : Weights.Entry :=
  { word := [12, 8, 0, 12, 10, 0, 10], weights := [1, 0, 0, 1] }

def points10 : List (ℕ × ℕ) := [(0, 1), (1, 2), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8814, representative 84.
def source11 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B000.Data.entryAt ⟨80, by decide +kernel⟩

def target11 : Weights.Entry :=
  { word := [12, 8, 0, 12, 10, 8, 10], weights := [1, 0, 1, 0] }

-- Period 7, original row 8828, representative 82.
def source12 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B000.Data.entryAt ⟨78, by decide +kernel⟩

def target12 : Weights.Entry :=
  { word := [12, 8, 4, 2, 0, 8, 10], weights := [0, 1, 0, 1] }

def points12 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8863, representative 85.
def source13 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B000.Data.entryAt ⟨81, by decide +kernel⟩

def target13 : Weights.Entry :=
  { word := [12, 8, 4, 10, 0, 8, 10], weights := [0, 1, 0, 1] }

def points13 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8936, representative 83.
def source14 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B000.Data.entryAt ⟨79, by decide +kernel⟩

def target14 : Weights.Entry :=
  { word := [12, 8, 12, 2, 0, 8, 10], weights := [0, 1, 0, 1] }

def points14 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8971, representative 84.
def source15 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B000.Data.entryAt ⟨80, by decide +kernel⟩

def target15 : Weights.Entry :=
  { word := [12, 8, 12, 10, 0, 8, 10], weights := [0, 1, 0, 1] }

def points15 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8990, representative 124.
def source16 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B000.Data.entryAt ⟨118, by decide +kernel⟩

def target16 : Weights.Entry :=
  { word := [12, 10, 0, 9, 8, 1, 12], weights := [1, 1, 0, 1] }

def points16 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8992, representative 38.
def source17 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B000.Data.entryAt ⟨35, by decide +kernel⟩

def target17 : Weights.Entry :=
  { word := [12, 10, 0, 9, 8, 2, 10], weights := [1, 1, 0, 1] }

def points17 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8994, representative 3.
def source18 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B000.Data.entryAt ⟨1, by decide +kernel⟩

def target18 : Weights.Entry :=
  { word := [12, 10, 0, 9, 8, 8, 6], weights := [1, 1, 0, 1] }

def points18 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8995, representative 129.
def source19 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B000.Data.entryAt ⟨121, by decide +kernel⟩

def target19 : Weights.Entry :=
  { word := [12, 10, 0, 9, 8, 8, 12], weights := [1, 1, 0, 1] }

def points19 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8997, representative 122.
def source20 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B000.Data.entryAt ⟨116, by decide +kernel⟩

def target20 : Weights.Entry :=
  { word := [12, 10, 0, 9, 8, 9, 12], weights := [1, 1, 0, 1] }

def points20 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 8999, representative 37.
def source21 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B000.Data.entryAt ⟨34, by decide +kernel⟩

def target21 : Weights.Entry :=
  { word := [12, 10, 0, 9, 8, 10, 10], weights := [1, 1, 0, 1] }

-- Period 7, original row 9001, representative 118.
def source22 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B000.Data.entryAt ⟨113, by decide +kernel⟩

def target22 : Weights.Entry :=
  { word := [12, 10, 0, 10, 8, 0, 12], weights := [0, 1, 0, 1] }

def points22 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 9003, representative 115.
def source23 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B000.Data.entryAt ⟨110, by decide +kernel⟩

def target23 : Weights.Entry :=
  { word := [12, 10, 0, 10, 8, 8, 12], weights := [0, 1, 0, 1] }

def points23 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 9009, representative 42.
def source24 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B000.Data.entryAt ⟨39, by decide +kernel⟩

def target24 : Weights.Entry :=
  { word := [12, 10, 0, 12, 2, 0, 10], weights := [1, 1, 0, 1] }

def points24 : List (ℕ × ℕ) := [(0, 1), (1, 2), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 9010, representative 133.
def source25 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B000.Data.entryAt ⟨125, by decide +kernel⟩

def target25 : Weights.Entry :=
  { word := [12, 10, 0, 12, 2, 0, 12], weights := [1, 1, 0, 1] }

def points25 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 9017, representative 41.
def source26 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B000.Data.entryAt ⟨38, by decide +kernel⟩

def target26 : Weights.Entry :=
  { word := [12, 10, 0, 12, 10, 0, 10], weights := [1, 1, 0, 1] }

def points26 : List (ℕ × ℕ) := [(0, 1), (1, 2), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 9018, representative 131.
def source27 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B000.Data.entryAt ⟨123, by decide +kernel⟩

def target27 : Weights.Entry :=
  { word := [12, 10, 0, 12, 10, 0, 12], weights := [1, 1, 0, 1] }

def points27 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 9023, representative 113.
def source28 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B000.Data.entryAt ⟨108, by decide +kernel⟩

def target28 : Weights.Entry :=
  { word := [12, 10, 8, 2, 8, 8, 12], weights := [0, 1, 0, 1] }

def points28 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 9041, representative 114.
def source29 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B000.Data.entryAt ⟨109, by decide +kernel⟩

def target29 : Weights.Entry :=
  { word := [12, 10, 8, 10, 8, 8, 12], weights := [0, 1, 0, 1] }

def points29 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 9055, representative 77.
def source30 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B000.Data.entryAt ⟨73, by decide +kernel⟩

def target30 : Weights.Entry :=
  { word := [12, 12, 4, 8, 8, 2, 10], weights := [0, 1, 1, 0] }

def points30 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 9057, representative 75.
def source31 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B000.Data.entryAt ⟨71, by decide +kernel⟩

def target31 : Weights.Entry :=
  { word := [12, 12, 4, 8, 8, 10, 10], weights := [0, 1, 1, 0] }

-- Period 7, original row 9063, representative 53.
def source32 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B000.Data.entryAt ⟨50, by decide +kernel⟩

def target32 : Weights.Entry :=
  { word := [12, 12, 8, 8, 1, 4, 10], weights := [1, 0, 1, 1] }

def points32 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 9068, representative 37.
def source33 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B000.Data.entryAt ⟨34, by decide +kernel⟩

def target33 : Weights.Entry :=
  { word := [12, 12, 8, 8, 1, 12, 10], weights := [1, 0, 1, 1] }

def points33 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 9071, representative 79.
def source34 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B000.Data.entryAt ⟨75, by decide +kernel⟩

def target34 : Weights.Entry :=
  { word := [12, 12, 8, 8, 2, 2, 10], weights := [0, 1, 1, 0] }

def points34 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 9073, representative 75.
def source35 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B000.Data.entryAt ⟨71, by decide +kernel⟩

def target35 : Weights.Entry :=
  { word := [12, 12, 8, 8, 2, 10, 10], weights := [0, 1, 1, 0] }

def points35 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 9080, representative 78.
def source36 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B000.Data.entryAt ⟨74, by decide +kernel⟩

def target36 : Weights.Entry :=
  { word := [12, 12, 8, 8, 10, 2, 10], weights := [0, 1, 1, 0] }

def points36 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 7, original row 9085, representative 76.
def source37 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B000.Data.entryAt ⟨72, by decide +kernel⟩

def target37 : Weights.Entry :=
  { word := [12, 12, 12, 8, 8, 2, 10], weights := [0, 1, 1, 0] }

def points37 : List (ℕ × ℕ) := [(0, 2), (1, 1), (2, 0), (3, 6), (4, 5), (5, 4), (6, 3)]

-- Period 8, original row 507, representative 2.
def source38 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B000.Data.entryAt ⟨0, by decide +kernel⟩

def target38 : Weights.Entry :=
  { word := [0, 4, 0, 4, 2, 0, 2], weights := [0, 0, 1, 0] }

def points38 : List (ℕ × ℕ) := [(0, 7), (2, 1), (3, 3), (4, 4), (5, 5), (6, 6)]

-- Period 8, original row 3417, representative 2.
def source39 : Weights.Entry :=
  FranklSmallCyclic.OrbitBatches.P7.B000.Data.entryAt ⟨0, by decide +kernel⟩

def target39 : Weights.Entry :=
  { word := [4, 0, 4, 2, 0, 2, 0], weights := [0, 0, 0, 1] }

def points39 : List (ℕ × ℕ) := [(0, 0), (2, 2), (3, 4), (4, 5), (5, 6), (6, 3)]

def period7Entries : List Weights.Entry := [target0, target1, target2, target3, target4, target5, target6, target7, target8, target9, target10, target11, target12, target13, target14, target15, target16, target17, target18, target19, target20, target21, target22, target23, target24, target25, target26, target27, target28, target29, target30, target31, target32, target33, target34, target35, target36, target37]

def period7Chunk : RowCoverage.Chunk where
  rows := [⟨8720, target0⟩, ⟨8722, target1⟩, ⟨8740, target2⟩, ⟨8745, target3⟩, ⟨8756, target4⟩, ⟨8766, target5⟩, ⟨8771, target6⟩, ⟨8784, target7⟩, ⟨8789, target8⟩, ⟨8799, target9⟩, ⟨8809, target10⟩, ⟨8814, target11⟩, ⟨8828, target12⟩, ⟨8863, target13⟩, ⟨8936, target14⟩, ⟨8971, target15⟩, ⟨8990, target16⟩, ⟨8992, target17⟩, ⟨8994, target18⟩, ⟨8995, target19⟩, ⟨8997, target20⟩, ⟨8999, target21⟩, ⟨9001, target22⟩, ⟨9003, target23⟩, ⟨9009, target24⟩, ⟨9010, target25⟩, ⟨9017, target26⟩, ⟨9018, target27⟩, ⟨9023, target28⟩, ⟨9041, target29⟩, ⟨9055, target30⟩, ⟨9057, target31⟩, ⟨9063, target32⟩, ⟨9068, target33⟩, ⟨9071, target34⟩, ⟨9073, target35⟩, ⟨9080, target36⟩, ⟨9085, target37⟩]
  indexMask := 74303006030329819609909974931467731711542523304035460735725739721410602150914626979984618045166224206693699011572026131911786813323626139653032223091673679615757264750765351802375893004310930819061335037279384180836229239912456028947620847145574212073383941554571171840522605380718826230725244849683811996723716704169382516449333775791550399989472264943947505436242048827101616553724600381978018675515003441965367023464176887662542190462133171001942718370149677764735714256535269769998254577212000991995949830378428899150923545582066184319441371822321618976578314852628088561513240807269054160235243672925058885418694275111989030691616214951641471160808560540700579597193090203314504305773854492039692913941861602055565522349844688482969616101728297468608988703323389624161243530417085496488375868459094802850824226019375535641856809396434017919747774730184696945742039712348144470694032817327425798795167093512628771102676988938628209714895284618420764290835083970186026240189013261589569982534224237529644499467497977594314410523781625379450103185498310972375039173364431245445748680515263462605399830532532958966252920312457599500885963619767818764590252806984776706998736134766311094346021654287559138245697134934852306967086041420914926423225073911706964476335172410644663053782094543446982228714064993568336879042023595500980660794457666280835320974833760827643829925944618580924111419643491526452538330691862797774895835471054552165980867708193083849724729650714007207733356772037183878497576569913777544352827002679578197944741135217405474582519351694033412426151237023729913187101427008601753774684867920814318739034761851591282595706909273223719532920182019210572177350264348127162100778909462145039666812208493866879001185049615828045075315297685583494869356922432355717098660195322305297356188811514559351447173963745509678902609118708555294661076772264464154512394872348429426083053827817138529674542763726423054646439414387042393285252483031608099633589329335663203862981596436114222471139840704373114367104754929728551192334474056741343696614980057323651532100609973166893391411867057374651134759596946124543163029955476602312303775547593312741851057537897853140216903580060628068566655547281400561297712130941316385262594854422604300476041177314151097320480862623901206341626442615076027686472977919030680769242864177212757458187575609186556735936489156959161998341387193530228958424164181344558197311616497222769959868316218350738266708538652111907387413893119464344892966837648823133058115034291833458163867605807313928970947774512585139252165558300789480867839509836527937058525592624632958622858459071807254181846543401892466386980813319580169471449346992477342152187538236386322568608647739691430522535852273303552
  count := 38

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

def period8Entries : List Weights.Entry := [target38, target39]

def period8Chunk : RowCoverage.Chunk where
  rows := [⟨507, target38⟩, ⟨3417, target39⟩]
  indexMask := 416385103432144394358611691202163221519851970890152578097039269306528433443499222298071769606057338082910934105788736723157025021950363952664327857845114507931740524778040008447150026552809780491391592617311264110659860518581956793187471881126325368565981869146190270341087477876234995546792536779290939065621771206407290304997148520095839131644543652830975633637025762007998025401768968099305476047569935533275428931870537918133527461047215408971529160853428709588400202968603896365859796252088582574210497894431682144235186515473693616133900070691540604596614163137542099727588521459019869714931391379594564559711242262870070159457759455178512026438712613490117291813427302116174210685022125842564213425816426019154210783108199012232703141497475459038964575237514307726404912284644764694761402173579739889459064560541509856591528337500451880515928479291938804836966758636734321183301002579173743731639363796466818031242223274887063256378272641346586003425737959588579754521350889690307829165917700510025707567700869318390579200
  count := 2

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

end FranklSmallCyclic.TransportBatches.G000.B002.Data
