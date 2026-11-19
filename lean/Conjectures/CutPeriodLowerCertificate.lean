-- Generated data; Lean checks all finite representation claims.
import Conjectures.CutPeriodLower
namespace CutPeriod.LowerCertificate
open BinaryAutomata
set_option maxRecDepth 100000
set_option maxHeartbeats 0
def representatives : Array (List Nat) := #[[1],[1,5],[0,4],[7,11],[6,10],[0,4,5],[5,7,11],[5,6,10],[0,3,4,5],[0,3,4],[4,5,6,9],[3,4,6,9],[5,13,17],[5,12,16],[4,5,20,23],[3,5,19,23],[4,5,12,15],[3,4,12,15],[3,5,18,22],[3,4,18,21],[3,4,5,6,9],[3,4,5,12,15],[3,4,5,18,21],[4,5,26,32,35],[3,5,25,32,35],[4,5,29,38,41],[3,5,28,38,41],[3,5,24,31,35],[3,5,24,30,34],[3,5,27,37,41],[3,5,27,36,40],[4,5,44,50],[3,4,5,44,50],[4,5,47,53,56],[3,4,5,47,53,56],[3,5,43,50],[3,5,46,53,56],[3,4,5,24,30,33],[3,4,5,27,36,39],[3,4,24,30,33],[3,4,27,36,39],[3,5,42,49],[3,4,5,42,48],[3,5,45,52,56],[3,5,45,51,55],[3,4,42,48],[3,4,5,45,51,54],[3,4,45,51,54],[4,5,14,29,59],[3,4,5,14,29,59],[4,5,20,62,65],[3,4,5,20,62,65],[3,5,14,28,59],[3,4,5,14,27,59],[4,5,32,56,62],[3,4,5,32,56,62],[4,5,41,68],[3,4,5,41,68],[3,5,13,27,59],[3,5,12,27,58],[3,5,20,61,65],[3,5,19,60,65],[3,4,5,12,27,57],[3,5,18,60,64],[3,4,5,18,60,63],[3,5,32,56,61],[3,5,31,56,60],[3,5,30,55,60],[3,5,41,67],[3,5,40,66],[4,5,71,77],[3,4,5,71,77],[4,5,56,74,80],[3,4,5,56,74,80],[4,5,14,17],[3,4,5,14,17],[4,5,20,26,29,65],[3,4,5,20,26,29,65],[3,5,70,77],[3,5,56,73,80],[3,5,20,26,28,65],[3,4,5,30,54,60],[3,4,5,39,66],[3,4,12,27,57],[3,4,18,60,63],[3,4,30,54,60],[3,4,39,66],[3,5,69,76],[3,4,5,69,75],[3,5,56,72,79],[3,5,55,72,78],[3,4,5,54,72,78],[3,5,13,17],[3,5,12,16],[3,5,20,25,27,65],[3,5,19,24,27,65],[3,5,18,24,27,64],[3,4,5,18,24,27,63],[3,4,69,75],[3,4,54,72,78],[3,4,18,24,27,63],[3,4,5,26,32,35],[3,4,5,29,38,41],[4,5,29,44,77],[3,4,5,29,44,77],[3,5,28,44,77],[3,4,5,27,44,77],[3,5,27,43,77],[3,5,27,42,76],[3,4,5,27,42,75],[3,4,27,42,75]]
def rawTable : Array (Array Nat) := #[#[1,2,3,4],#[1,5,6,7],#[8,9,10,11],#[12,13,14,15],#[16,17,18,19],#[8,8,10,20],#[12,13,14,15],#[16,21,18,22],#[8,8,20,20],#[8,9,20,11],#[21,21,22,22],#[21,17,22,19],#[23,24,25,26],#[27,28,29,30],#[31,32,33,34],#[32,35,34,36],#[37,37,38,38],#[37,39,38,40],#[41,42,43,44],#[42,45,46,47],#[21,21,22,22],#[37,37,38,38],#[42,42,46,46],#[48,49,50,51],#[52,53,51,51],#[54,55,56,57],#[55,55,57,57],#[58,59,60,61],#[62,62,63,64],#[55,65,57,57],#[66,67,68,69],#[70,71,72,73],#[71,71,73,73],#[74,75,76,77],#[75,75,77,77],#[71,78,73,79],#[75,75,77,80],#[62,62,64,64],#[81,81,82,82],#[62,83,64,84],#[81,85,82,86],#[87,88,89,90],#[88,88,91,91],#[92,93,94,95],#[21,21,96,97],#[88,98,91,99],#[21,21,97,97],#[21,17,97,100],#[23,101,25,102],#[101,101,102,102],#[103,104,33,34],#[104,104,34,34],#[101,101,102,102],#[101,101,102,102],#[48,49,50,51],#[49,49,51,51],#[54,55,56,57],#[55,55,57,57],#[101,24,102,26],#[27,28,29,30],#[105,106,34,34],#[106,107,34,36],#[37,37,38,38],#[108,109,43,44],#[109,109,46,46],#[52,53,51,51],#[58,59,60,61],#[62,62,63,64],#[55,65,57,57],#[66,67,68,69],#[70,71,72,73],#[71,71,73,73],#[74,75,76,77],#[75,75,77,77],#[23,101,25,102],#[101,101,102,102],#[103,104,33,34],#[104,104,34,34],#[71,78,73,79],#[75,75,77,80],#[104,104,34,34],#[62,62,64,64],#[81,81,82,82],#[37,39,38,40],#[109,110,46,47],#[62,83,64,84],#[81,85,82,86],#[87,88,89,90],#[88,88,91,91],#[92,93,94,95],#[21,21,96,97],#[21,21,97,97],#[101,24,102,26],#[27,28,29,30],#[105,106,34,34],#[106,107,34,36],#[108,109,43,44],#[109,109,46,46],#[88,98,91,99],#[21,17,97,100],#[109,110,46,47],#[49,49,51,51],#[55,55,57,57],#[70,71,72,73],#[71,71,73,73],#[71,71,73,73],#[71,71,73,73],#[71,78,73,79],#[87,88,89,90],#[88,88,91,91],#[88,98,91,99]]
def labels : Array Nat := #[0,0,1,2,3,1,2,3,1,1,1,1,4,5,6,7,1,1,8,1,1,1,1,6,9,6,10,11,3,12,13,6,6,6,6,14,15,1,1,1,1,8,1,16,3,1,1,1,6,6,6,6,10,10,6,6,6,6,17,5,18,19,1,8,1,18,20,3,12,13,6,6,6,6,6,6,6,6,21,22,10,1,1,1,1,1,1,8,1,16,3,1,4,5,18,19,8,1,1,1,1,6,6,6,6,10,10,21,8,1,1]
def table : Array (Array Nat) := #[#[0,1,2,3],#[1,1,1,1],#[4,5,6,7],#[1,1,8,1],#[6,9,6,10],#[11,3,12,13],#[6,6,6,6],#[6,14,6,15],#[8,1,16,3],#[10,10,6,6],#[6,6,6,6],#[17,5,18,19],#[6,18,6,6],#[20,3,12,13],#[6,21,6,22],#[6,6,6,10],#[4,5,18,19],#[6,9,6,10],#[10,10,6,6],#[10,21,6,15],#[17,5,18,19],#[6,21,6,22],#[6,6,6,10]]
def finals : Array Bool := #[false,false,false,false,true,false,true,true,false,true,false,true,false,false,true,false,false,false,false,false,false,false,true]

def machine : DFA (Fin 23) := {
  step := fun q d => Fin.ofNat 23 (table[q.val]![d.val]!)
  start := 0
  final := fun q => finals[q.val]!
}
def active (q : Fin 111) : List (Fin 81) :=
  representatives[q.val]!.map (Fin.ofNat 81)
def label (q : Fin 111) : Fin 23 := Fin.ofNat 23 labels[q.val]!
def next (q : Fin 111) (d : Digit) : Fin 111 :=
  Fin.ofNat 111 (rawTable[q.val]![d.val]!)

theorem checked_start : maskOfList ((active 0).map Fin.val)=Lower.semantic.startMask := by decide
theorem checked_label_start : label 0=machine.start := by decide
theorem refinement_row_0 : ∀ d,
    maskOfList ((active (next (0 : Fin 111) d)).map Fin.val)=
      maskOfList (((active (0 : Fin 111)).flatMap (fun s => Lower.semantic.successors s d)).map Fin.val) := by decide
theorem refinement_row_1 : ∀ d,
    maskOfList ((active (next (1 : Fin 111) d)).map Fin.val)=
      maskOfList (((active (1 : Fin 111)).flatMap (fun s => Lower.semantic.successors s d)).map Fin.val) := by decide
theorem refinement_row_2 : ∀ d,
    maskOfList ((active (next (2 : Fin 111) d)).map Fin.val)=
      maskOfList (((active (2 : Fin 111)).flatMap (fun s => Lower.semantic.successors s d)).map Fin.val) := by decide
theorem refinement_row_3 : ∀ d,
    maskOfList ((active (next (3 : Fin 111) d)).map Fin.val)=
      maskOfList (((active (3 : Fin 111)).flatMap (fun s => Lower.semantic.successors s d)).map Fin.val) := by decide
theorem refinement_row_4 : ∀ d,
    maskOfList ((active (next (4 : Fin 111) d)).map Fin.val)=
      maskOfList (((active (4 : Fin 111)).flatMap (fun s => Lower.semantic.successors s d)).map Fin.val) := by decide
theorem refinement_row_5 : ∀ d,
    maskOfList ((active (next (5 : Fin 111) d)).map Fin.val)=
      maskOfList (((active (5 : Fin 111)).flatMap (fun s => Lower.semantic.successors s d)).map Fin.val) := by decide
theorem refinement_row_6 : ∀ d,
    maskOfList ((active (next (6 : Fin 111) d)).map Fin.val)=
      maskOfList (((active (6 : Fin 111)).flatMap (fun s => Lower.semantic.successors s d)).map Fin.val) := by decide
theorem refinement_row_7 : ∀ d,
    maskOfList ((active (next (7 : Fin 111) d)).map Fin.val)=
      maskOfList (((active (7 : Fin 111)).flatMap (fun s => Lower.semantic.successors s d)).map Fin.val) := by decide
theorem refinement_row_8 : ∀ d,
    maskOfList ((active (next (8 : Fin 111) d)).map Fin.val)=
      maskOfList (((active (8 : Fin 111)).flatMap (fun s => Lower.semantic.successors s d)).map Fin.val) := by decide
theorem refinement_row_9 : ∀ d,
    maskOfList ((active (next (9 : Fin 111) d)).map Fin.val)=
      maskOfList (((active (9 : Fin 111)).flatMap (fun s => Lower.semantic.successors s d)).map Fin.val) := by decide
theorem refinement_row_10 : ∀ d,
    maskOfList ((active (next (10 : Fin 111) d)).map Fin.val)=
      maskOfList (((active (10 : Fin 111)).flatMap (fun s => Lower.semantic.successors s d)).map Fin.val) := by decide
theorem refinement_row_11 : ∀ d,
    maskOfList ((active (next (11 : Fin 111) d)).map Fin.val)=
      maskOfList (((active (11 : Fin 111)).flatMap (fun s => Lower.semantic.successors s d)).map Fin.val) := by decide
theorem refinement_row_12 : ∀ d,
    maskOfList ((active (next (12 : Fin 111) d)).map Fin.val)=
      maskOfList (((active (12 : Fin 111)).flatMap (fun s => Lower.semantic.successors s d)).map Fin.val) := by decide
theorem refinement_row_13 : ∀ d,
    maskOfList ((active (next (13 : Fin 111) d)).map Fin.val)=
      maskOfList (((active (13 : Fin 111)).flatMap (fun s => Lower.semantic.successors s d)).map Fin.val) := by decide
theorem refinement_row_14 : ∀ d,
    maskOfList ((active (next (14 : Fin 111) d)).map Fin.val)=
      maskOfList (((active (14 : Fin 111)).flatMap (fun s => Lower.semantic.successors s d)).map Fin.val) := by decide
theorem refinement_row_15 : ∀ d,
    maskOfList ((active (next (15 : Fin 111) d)).map Fin.val)=
      maskOfList (((active (15 : Fin 111)).flatMap (fun s => Lower.semantic.successors s d)).map Fin.val) := by decide
theorem refinement_row_16 : ∀ d,
    maskOfList ((active (next (16 : Fin 111) d)).map Fin.val)=
      maskOfList (((active (16 : Fin 111)).flatMap (fun s => Lower.semantic.successors s d)).map Fin.val) := by decide
theorem refinement_row_17 : ∀ d,
    maskOfList ((active (next (17 : Fin 111) d)).map Fin.val)=
      maskOfList (((active (17 : Fin 111)).flatMap (fun s => Lower.semantic.successors s d)).map Fin.val) := by decide
theorem refinement_row_18 : ∀ d,
    maskOfList ((active (next (18 : Fin 111) d)).map Fin.val)=
      maskOfList (((active (18 : Fin 111)).flatMap (fun s => Lower.semantic.successors s d)).map Fin.val) := by decide
theorem refinement_row_19 : ∀ d,
    maskOfList ((active (next (19 : Fin 111) d)).map Fin.val)=
      maskOfList (((active (19 : Fin 111)).flatMap (fun s => Lower.semantic.successors s d)).map Fin.val) := by decide
theorem refinement_row_20 : ∀ d,
    maskOfList ((active (next (20 : Fin 111) d)).map Fin.val)=
      maskOfList (((active (20 : Fin 111)).flatMap (fun s => Lower.semantic.successors s d)).map Fin.val) := by decide
theorem refinement_row_21 : ∀ d,
    maskOfList ((active (next (21 : Fin 111) d)).map Fin.val)=
      maskOfList (((active (21 : Fin 111)).flatMap (fun s => Lower.semantic.successors s d)).map Fin.val) := by decide
theorem refinement_row_22 : ∀ d,
    maskOfList ((active (next (22 : Fin 111) d)).map Fin.val)=
      maskOfList (((active (22 : Fin 111)).flatMap (fun s => Lower.semantic.successors s d)).map Fin.val) := by decide
theorem refinement_row_23 : ∀ d,
    maskOfList ((active (next (23 : Fin 111) d)).map Fin.val)=
      maskOfList (((active (23 : Fin 111)).flatMap (fun s => Lower.semantic.successors s d)).map Fin.val) := by decide
theorem refinement_row_24 : ∀ d,
    maskOfList ((active (next (24 : Fin 111) d)).map Fin.val)=
      maskOfList (((active (24 : Fin 111)).flatMap (fun s => Lower.semantic.successors s d)).map Fin.val) := by decide
theorem refinement_row_25 : ∀ d,
    maskOfList ((active (next (25 : Fin 111) d)).map Fin.val)=
      maskOfList (((active (25 : Fin 111)).flatMap (fun s => Lower.semantic.successors s d)).map Fin.val) := by decide
theorem refinement_row_26 : ∀ d,
    maskOfList ((active (next (26 : Fin 111) d)).map Fin.val)=
      maskOfList (((active (26 : Fin 111)).flatMap (fun s => Lower.semantic.successors s d)).map Fin.val) := by decide
theorem refinement_row_27 : ∀ d,
    maskOfList ((active (next (27 : Fin 111) d)).map Fin.val)=
      maskOfList (((active (27 : Fin 111)).flatMap (fun s => Lower.semantic.successors s d)).map Fin.val) := by decide
theorem refinement_row_28 : ∀ d,
    maskOfList ((active (next (28 : Fin 111) d)).map Fin.val)=
      maskOfList (((active (28 : Fin 111)).flatMap (fun s => Lower.semantic.successors s d)).map Fin.val) := by decide
theorem refinement_row_29 : ∀ d,
    maskOfList ((active (next (29 : Fin 111) d)).map Fin.val)=
      maskOfList (((active (29 : Fin 111)).flatMap (fun s => Lower.semantic.successors s d)).map Fin.val) := by decide
theorem refinement_row_30 : ∀ d,
    maskOfList ((active (next (30 : Fin 111) d)).map Fin.val)=
      maskOfList (((active (30 : Fin 111)).flatMap (fun s => Lower.semantic.successors s d)).map Fin.val) := by decide
theorem refinement_row_31 : ∀ d,
    maskOfList ((active (next (31 : Fin 111) d)).map Fin.val)=
      maskOfList (((active (31 : Fin 111)).flatMap (fun s => Lower.semantic.successors s d)).map Fin.val) := by decide
theorem refinement_row_32 : ∀ d,
    maskOfList ((active (next (32 : Fin 111) d)).map Fin.val)=
      maskOfList (((active (32 : Fin 111)).flatMap (fun s => Lower.semantic.successors s d)).map Fin.val) := by decide
theorem refinement_row_33 : ∀ d,
    maskOfList ((active (next (33 : Fin 111) d)).map Fin.val)=
      maskOfList (((active (33 : Fin 111)).flatMap (fun s => Lower.semantic.successors s d)).map Fin.val) := by decide
theorem refinement_row_34 : ∀ d,
    maskOfList ((active (next (34 : Fin 111) d)).map Fin.val)=
      maskOfList (((active (34 : Fin 111)).flatMap (fun s => Lower.semantic.successors s d)).map Fin.val) := by decide
theorem refinement_row_35 : ∀ d,
    maskOfList ((active (next (35 : Fin 111) d)).map Fin.val)=
      maskOfList (((active (35 : Fin 111)).flatMap (fun s => Lower.semantic.successors s d)).map Fin.val) := by decide
theorem refinement_row_36 : ∀ d,
    maskOfList ((active (next (36 : Fin 111) d)).map Fin.val)=
      maskOfList (((active (36 : Fin 111)).flatMap (fun s => Lower.semantic.successors s d)).map Fin.val) := by decide
theorem refinement_row_37 : ∀ d,
    maskOfList ((active (next (37 : Fin 111) d)).map Fin.val)=
      maskOfList (((active (37 : Fin 111)).flatMap (fun s => Lower.semantic.successors s d)).map Fin.val) := by decide
theorem refinement_row_38 : ∀ d,
    maskOfList ((active (next (38 : Fin 111) d)).map Fin.val)=
      maskOfList (((active (38 : Fin 111)).flatMap (fun s => Lower.semantic.successors s d)).map Fin.val) := by decide
theorem refinement_row_39 : ∀ d,
    maskOfList ((active (next (39 : Fin 111) d)).map Fin.val)=
      maskOfList (((active (39 : Fin 111)).flatMap (fun s => Lower.semantic.successors s d)).map Fin.val) := by decide
theorem refinement_row_40 : ∀ d,
    maskOfList ((active (next (40 : Fin 111) d)).map Fin.val)=
      maskOfList (((active (40 : Fin 111)).flatMap (fun s => Lower.semantic.successors s d)).map Fin.val) := by decide
theorem refinement_row_41 : ∀ d,
    maskOfList ((active (next (41 : Fin 111) d)).map Fin.val)=
      maskOfList (((active (41 : Fin 111)).flatMap (fun s => Lower.semantic.successors s d)).map Fin.val) := by decide
theorem refinement_row_42 : ∀ d,
    maskOfList ((active (next (42 : Fin 111) d)).map Fin.val)=
      maskOfList (((active (42 : Fin 111)).flatMap (fun s => Lower.semantic.successors s d)).map Fin.val) := by decide
theorem refinement_row_43 : ∀ d,
    maskOfList ((active (next (43 : Fin 111) d)).map Fin.val)=
      maskOfList (((active (43 : Fin 111)).flatMap (fun s => Lower.semantic.successors s d)).map Fin.val) := by decide
theorem refinement_row_44 : ∀ d,
    maskOfList ((active (next (44 : Fin 111) d)).map Fin.val)=
      maskOfList (((active (44 : Fin 111)).flatMap (fun s => Lower.semantic.successors s d)).map Fin.val) := by decide
theorem refinement_row_45 : ∀ d,
    maskOfList ((active (next (45 : Fin 111) d)).map Fin.val)=
      maskOfList (((active (45 : Fin 111)).flatMap (fun s => Lower.semantic.successors s d)).map Fin.val) := by decide
theorem refinement_row_46 : ∀ d,
    maskOfList ((active (next (46 : Fin 111) d)).map Fin.val)=
      maskOfList (((active (46 : Fin 111)).flatMap (fun s => Lower.semantic.successors s d)).map Fin.val) := by decide
theorem refinement_row_47 : ∀ d,
    maskOfList ((active (next (47 : Fin 111) d)).map Fin.val)=
      maskOfList (((active (47 : Fin 111)).flatMap (fun s => Lower.semantic.successors s d)).map Fin.val) := by decide
theorem refinement_row_48 : ∀ d,
    maskOfList ((active (next (48 : Fin 111) d)).map Fin.val)=
      maskOfList (((active (48 : Fin 111)).flatMap (fun s => Lower.semantic.successors s d)).map Fin.val) := by decide
theorem refinement_row_49 : ∀ d,
    maskOfList ((active (next (49 : Fin 111) d)).map Fin.val)=
      maskOfList (((active (49 : Fin 111)).flatMap (fun s => Lower.semantic.successors s d)).map Fin.val) := by decide
theorem refinement_row_50 : ∀ d,
    maskOfList ((active (next (50 : Fin 111) d)).map Fin.val)=
      maskOfList (((active (50 : Fin 111)).flatMap (fun s => Lower.semantic.successors s d)).map Fin.val) := by decide
theorem refinement_row_51 : ∀ d,
    maskOfList ((active (next (51 : Fin 111) d)).map Fin.val)=
      maskOfList (((active (51 : Fin 111)).flatMap (fun s => Lower.semantic.successors s d)).map Fin.val) := by decide
theorem refinement_row_52 : ∀ d,
    maskOfList ((active (next (52 : Fin 111) d)).map Fin.val)=
      maskOfList (((active (52 : Fin 111)).flatMap (fun s => Lower.semantic.successors s d)).map Fin.val) := by decide
theorem refinement_row_53 : ∀ d,
    maskOfList ((active (next (53 : Fin 111) d)).map Fin.val)=
      maskOfList (((active (53 : Fin 111)).flatMap (fun s => Lower.semantic.successors s d)).map Fin.val) := by decide
theorem refinement_row_54 : ∀ d,
    maskOfList ((active (next (54 : Fin 111) d)).map Fin.val)=
      maskOfList (((active (54 : Fin 111)).flatMap (fun s => Lower.semantic.successors s d)).map Fin.val) := by decide
theorem refinement_row_55 : ∀ d,
    maskOfList ((active (next (55 : Fin 111) d)).map Fin.val)=
      maskOfList (((active (55 : Fin 111)).flatMap (fun s => Lower.semantic.successors s d)).map Fin.val) := by decide
theorem refinement_row_56 : ∀ d,
    maskOfList ((active (next (56 : Fin 111) d)).map Fin.val)=
      maskOfList (((active (56 : Fin 111)).flatMap (fun s => Lower.semantic.successors s d)).map Fin.val) := by decide
theorem refinement_row_57 : ∀ d,
    maskOfList ((active (next (57 : Fin 111) d)).map Fin.val)=
      maskOfList (((active (57 : Fin 111)).flatMap (fun s => Lower.semantic.successors s d)).map Fin.val) := by decide
theorem refinement_row_58 : ∀ d,
    maskOfList ((active (next (58 : Fin 111) d)).map Fin.val)=
      maskOfList (((active (58 : Fin 111)).flatMap (fun s => Lower.semantic.successors s d)).map Fin.val) := by decide
theorem refinement_row_59 : ∀ d,
    maskOfList ((active (next (59 : Fin 111) d)).map Fin.val)=
      maskOfList (((active (59 : Fin 111)).flatMap (fun s => Lower.semantic.successors s d)).map Fin.val) := by decide
theorem refinement_row_60 : ∀ d,
    maskOfList ((active (next (60 : Fin 111) d)).map Fin.val)=
      maskOfList (((active (60 : Fin 111)).flatMap (fun s => Lower.semantic.successors s d)).map Fin.val) := by decide
theorem refinement_row_61 : ∀ d,
    maskOfList ((active (next (61 : Fin 111) d)).map Fin.val)=
      maskOfList (((active (61 : Fin 111)).flatMap (fun s => Lower.semantic.successors s d)).map Fin.val) := by decide
theorem refinement_row_62 : ∀ d,
    maskOfList ((active (next (62 : Fin 111) d)).map Fin.val)=
      maskOfList (((active (62 : Fin 111)).flatMap (fun s => Lower.semantic.successors s d)).map Fin.val) := by decide
theorem refinement_row_63 : ∀ d,
    maskOfList ((active (next (63 : Fin 111) d)).map Fin.val)=
      maskOfList (((active (63 : Fin 111)).flatMap (fun s => Lower.semantic.successors s d)).map Fin.val) := by decide
theorem refinement_row_64 : ∀ d,
    maskOfList ((active (next (64 : Fin 111) d)).map Fin.val)=
      maskOfList (((active (64 : Fin 111)).flatMap (fun s => Lower.semantic.successors s d)).map Fin.val) := by decide
theorem refinement_row_65 : ∀ d,
    maskOfList ((active (next (65 : Fin 111) d)).map Fin.val)=
      maskOfList (((active (65 : Fin 111)).flatMap (fun s => Lower.semantic.successors s d)).map Fin.val) := by decide
theorem refinement_row_66 : ∀ d,
    maskOfList ((active (next (66 : Fin 111) d)).map Fin.val)=
      maskOfList (((active (66 : Fin 111)).flatMap (fun s => Lower.semantic.successors s d)).map Fin.val) := by decide
theorem refinement_row_67 : ∀ d,
    maskOfList ((active (next (67 : Fin 111) d)).map Fin.val)=
      maskOfList (((active (67 : Fin 111)).flatMap (fun s => Lower.semantic.successors s d)).map Fin.val) := by decide
theorem refinement_row_68 : ∀ d,
    maskOfList ((active (next (68 : Fin 111) d)).map Fin.val)=
      maskOfList (((active (68 : Fin 111)).flatMap (fun s => Lower.semantic.successors s d)).map Fin.val) := by decide
theorem refinement_row_69 : ∀ d,
    maskOfList ((active (next (69 : Fin 111) d)).map Fin.val)=
      maskOfList (((active (69 : Fin 111)).flatMap (fun s => Lower.semantic.successors s d)).map Fin.val) := by decide
theorem refinement_row_70 : ∀ d,
    maskOfList ((active (next (70 : Fin 111) d)).map Fin.val)=
      maskOfList (((active (70 : Fin 111)).flatMap (fun s => Lower.semantic.successors s d)).map Fin.val) := by decide
theorem refinement_row_71 : ∀ d,
    maskOfList ((active (next (71 : Fin 111) d)).map Fin.val)=
      maskOfList (((active (71 : Fin 111)).flatMap (fun s => Lower.semantic.successors s d)).map Fin.val) := by decide
theorem refinement_row_72 : ∀ d,
    maskOfList ((active (next (72 : Fin 111) d)).map Fin.val)=
      maskOfList (((active (72 : Fin 111)).flatMap (fun s => Lower.semantic.successors s d)).map Fin.val) := by decide
theorem refinement_row_73 : ∀ d,
    maskOfList ((active (next (73 : Fin 111) d)).map Fin.val)=
      maskOfList (((active (73 : Fin 111)).flatMap (fun s => Lower.semantic.successors s d)).map Fin.val) := by decide
theorem refinement_row_74 : ∀ d,
    maskOfList ((active (next (74 : Fin 111) d)).map Fin.val)=
      maskOfList (((active (74 : Fin 111)).flatMap (fun s => Lower.semantic.successors s d)).map Fin.val) := by decide
theorem refinement_row_75 : ∀ d,
    maskOfList ((active (next (75 : Fin 111) d)).map Fin.val)=
      maskOfList (((active (75 : Fin 111)).flatMap (fun s => Lower.semantic.successors s d)).map Fin.val) := by decide
theorem refinement_row_76 : ∀ d,
    maskOfList ((active (next (76 : Fin 111) d)).map Fin.val)=
      maskOfList (((active (76 : Fin 111)).flatMap (fun s => Lower.semantic.successors s d)).map Fin.val) := by decide
theorem refinement_row_77 : ∀ d,
    maskOfList ((active (next (77 : Fin 111) d)).map Fin.val)=
      maskOfList (((active (77 : Fin 111)).flatMap (fun s => Lower.semantic.successors s d)).map Fin.val) := by decide
theorem refinement_row_78 : ∀ d,
    maskOfList ((active (next (78 : Fin 111) d)).map Fin.val)=
      maskOfList (((active (78 : Fin 111)).flatMap (fun s => Lower.semantic.successors s d)).map Fin.val) := by decide
theorem refinement_row_79 : ∀ d,
    maskOfList ((active (next (79 : Fin 111) d)).map Fin.val)=
      maskOfList (((active (79 : Fin 111)).flatMap (fun s => Lower.semantic.successors s d)).map Fin.val) := by decide
theorem refinement_row_80 : ∀ d,
    maskOfList ((active (next (80 : Fin 111) d)).map Fin.val)=
      maskOfList (((active (80 : Fin 111)).flatMap (fun s => Lower.semantic.successors s d)).map Fin.val) := by decide
theorem refinement_row_81 : ∀ d,
    maskOfList ((active (next (81 : Fin 111) d)).map Fin.val)=
      maskOfList (((active (81 : Fin 111)).flatMap (fun s => Lower.semantic.successors s d)).map Fin.val) := by decide
theorem refinement_row_82 : ∀ d,
    maskOfList ((active (next (82 : Fin 111) d)).map Fin.val)=
      maskOfList (((active (82 : Fin 111)).flatMap (fun s => Lower.semantic.successors s d)).map Fin.val) := by decide
theorem refinement_row_83 : ∀ d,
    maskOfList ((active (next (83 : Fin 111) d)).map Fin.val)=
      maskOfList (((active (83 : Fin 111)).flatMap (fun s => Lower.semantic.successors s d)).map Fin.val) := by decide
theorem refinement_row_84 : ∀ d,
    maskOfList ((active (next (84 : Fin 111) d)).map Fin.val)=
      maskOfList (((active (84 : Fin 111)).flatMap (fun s => Lower.semantic.successors s d)).map Fin.val) := by decide
theorem refinement_row_85 : ∀ d,
    maskOfList ((active (next (85 : Fin 111) d)).map Fin.val)=
      maskOfList (((active (85 : Fin 111)).flatMap (fun s => Lower.semantic.successors s d)).map Fin.val) := by decide
theorem refinement_row_86 : ∀ d,
    maskOfList ((active (next (86 : Fin 111) d)).map Fin.val)=
      maskOfList (((active (86 : Fin 111)).flatMap (fun s => Lower.semantic.successors s d)).map Fin.val) := by decide
theorem refinement_row_87 : ∀ d,
    maskOfList ((active (next (87 : Fin 111) d)).map Fin.val)=
      maskOfList (((active (87 : Fin 111)).flatMap (fun s => Lower.semantic.successors s d)).map Fin.val) := by decide
theorem refinement_row_88 : ∀ d,
    maskOfList ((active (next (88 : Fin 111) d)).map Fin.val)=
      maskOfList (((active (88 : Fin 111)).flatMap (fun s => Lower.semantic.successors s d)).map Fin.val) := by decide
theorem refinement_row_89 : ∀ d,
    maskOfList ((active (next (89 : Fin 111) d)).map Fin.val)=
      maskOfList (((active (89 : Fin 111)).flatMap (fun s => Lower.semantic.successors s d)).map Fin.val) := by decide
theorem refinement_row_90 : ∀ d,
    maskOfList ((active (next (90 : Fin 111) d)).map Fin.val)=
      maskOfList (((active (90 : Fin 111)).flatMap (fun s => Lower.semantic.successors s d)).map Fin.val) := by decide
theorem refinement_row_91 : ∀ d,
    maskOfList ((active (next (91 : Fin 111) d)).map Fin.val)=
      maskOfList (((active (91 : Fin 111)).flatMap (fun s => Lower.semantic.successors s d)).map Fin.val) := by decide
theorem refinement_row_92 : ∀ d,
    maskOfList ((active (next (92 : Fin 111) d)).map Fin.val)=
      maskOfList (((active (92 : Fin 111)).flatMap (fun s => Lower.semantic.successors s d)).map Fin.val) := by decide
theorem refinement_row_93 : ∀ d,
    maskOfList ((active (next (93 : Fin 111) d)).map Fin.val)=
      maskOfList (((active (93 : Fin 111)).flatMap (fun s => Lower.semantic.successors s d)).map Fin.val) := by decide
theorem refinement_row_94 : ∀ d,
    maskOfList ((active (next (94 : Fin 111) d)).map Fin.val)=
      maskOfList (((active (94 : Fin 111)).flatMap (fun s => Lower.semantic.successors s d)).map Fin.val) := by decide
theorem refinement_row_95 : ∀ d,
    maskOfList ((active (next (95 : Fin 111) d)).map Fin.val)=
      maskOfList (((active (95 : Fin 111)).flatMap (fun s => Lower.semantic.successors s d)).map Fin.val) := by decide
theorem refinement_row_96 : ∀ d,
    maskOfList ((active (next (96 : Fin 111) d)).map Fin.val)=
      maskOfList (((active (96 : Fin 111)).flatMap (fun s => Lower.semantic.successors s d)).map Fin.val) := by decide
theorem refinement_row_97 : ∀ d,
    maskOfList ((active (next (97 : Fin 111) d)).map Fin.val)=
      maskOfList (((active (97 : Fin 111)).flatMap (fun s => Lower.semantic.successors s d)).map Fin.val) := by decide
theorem refinement_row_98 : ∀ d,
    maskOfList ((active (next (98 : Fin 111) d)).map Fin.val)=
      maskOfList (((active (98 : Fin 111)).flatMap (fun s => Lower.semantic.successors s d)).map Fin.val) := by decide
theorem refinement_row_99 : ∀ d,
    maskOfList ((active (next (99 : Fin 111) d)).map Fin.val)=
      maskOfList (((active (99 : Fin 111)).flatMap (fun s => Lower.semantic.successors s d)).map Fin.val) := by decide
theorem refinement_row_100 : ∀ d,
    maskOfList ((active (next (100 : Fin 111) d)).map Fin.val)=
      maskOfList (((active (100 : Fin 111)).flatMap (fun s => Lower.semantic.successors s d)).map Fin.val) := by decide
theorem refinement_row_101 : ∀ d,
    maskOfList ((active (next (101 : Fin 111) d)).map Fin.val)=
      maskOfList (((active (101 : Fin 111)).flatMap (fun s => Lower.semantic.successors s d)).map Fin.val) := by decide
theorem refinement_row_102 : ∀ d,
    maskOfList ((active (next (102 : Fin 111) d)).map Fin.val)=
      maskOfList (((active (102 : Fin 111)).flatMap (fun s => Lower.semantic.successors s d)).map Fin.val) := by decide
theorem refinement_row_103 : ∀ d,
    maskOfList ((active (next (103 : Fin 111) d)).map Fin.val)=
      maskOfList (((active (103 : Fin 111)).flatMap (fun s => Lower.semantic.successors s d)).map Fin.val) := by decide
theorem refinement_row_104 : ∀ d,
    maskOfList ((active (next (104 : Fin 111) d)).map Fin.val)=
      maskOfList (((active (104 : Fin 111)).flatMap (fun s => Lower.semantic.successors s d)).map Fin.val) := by decide
theorem refinement_row_105 : ∀ d,
    maskOfList ((active (next (105 : Fin 111) d)).map Fin.val)=
      maskOfList (((active (105 : Fin 111)).flatMap (fun s => Lower.semantic.successors s d)).map Fin.val) := by decide
theorem refinement_row_106 : ∀ d,
    maskOfList ((active (next (106 : Fin 111) d)).map Fin.val)=
      maskOfList (((active (106 : Fin 111)).flatMap (fun s => Lower.semantic.successors s d)).map Fin.val) := by decide
theorem refinement_row_107 : ∀ d,
    maskOfList ((active (next (107 : Fin 111) d)).map Fin.val)=
      maskOfList (((active (107 : Fin 111)).flatMap (fun s => Lower.semantic.successors s d)).map Fin.val) := by decide
theorem refinement_row_108 : ∀ d,
    maskOfList ((active (next (108 : Fin 111) d)).map Fin.val)=
      maskOfList (((active (108 : Fin 111)).flatMap (fun s => Lower.semantic.successors s d)).map Fin.val) := by decide
theorem refinement_row_109 : ∀ d,
    maskOfList ((active (next (109 : Fin 111) d)).map Fin.val)=
      maskOfList (((active (109 : Fin 111)).flatMap (fun s => Lower.semantic.successors s d)).map Fin.val) := by decide
theorem refinement_row_110 : ∀ d,
    maskOfList ((active (next (110 : Fin 111) d)).map Fin.val)=
      maskOfList (((active (110 : Fin 111)).flatMap (fun s => Lower.semantic.successors s d)).map Fin.val) := by decide
theorem checked_step : ∀ q d,
    maskOfList ((active (next q d)).map Fin.val)=
      maskOfList (((active q).flatMap (fun s => Lower.semantic.successors s d)).map Fin.val) :=
  (checked_list_rows (n:=111) [⟨0,refinement_row_0⟩,⟨1,refinement_row_1⟩,⟨2,refinement_row_2⟩,⟨3,refinement_row_3⟩,⟨4,refinement_row_4⟩,⟨5,refinement_row_5⟩,⟨6,refinement_row_6⟩,⟨7,refinement_row_7⟩,⟨8,refinement_row_8⟩,⟨9,refinement_row_9⟩,⟨10,refinement_row_10⟩,⟨11,refinement_row_11⟩,⟨12,refinement_row_12⟩,⟨13,refinement_row_13⟩,⟨14,refinement_row_14⟩,⟨15,refinement_row_15⟩,⟨16,refinement_row_16⟩,⟨17,refinement_row_17⟩,⟨18,refinement_row_18⟩,⟨19,refinement_row_19⟩,⟨20,refinement_row_20⟩,⟨21,refinement_row_21⟩,⟨22,refinement_row_22⟩,⟨23,refinement_row_23⟩,⟨24,refinement_row_24⟩,⟨25,refinement_row_25⟩,⟨26,refinement_row_26⟩,⟨27,refinement_row_27⟩,⟨28,refinement_row_28⟩,⟨29,refinement_row_29⟩,⟨30,refinement_row_30⟩,⟨31,refinement_row_31⟩,⟨32,refinement_row_32⟩,⟨33,refinement_row_33⟩,⟨34,refinement_row_34⟩,⟨35,refinement_row_35⟩,⟨36,refinement_row_36⟩,⟨37,refinement_row_37⟩,⟨38,refinement_row_38⟩,⟨39,refinement_row_39⟩,⟨40,refinement_row_40⟩,⟨41,refinement_row_41⟩,⟨42,refinement_row_42⟩,⟨43,refinement_row_43⟩,⟨44,refinement_row_44⟩,⟨45,refinement_row_45⟩,⟨46,refinement_row_46⟩,⟨47,refinement_row_47⟩,⟨48,refinement_row_48⟩,⟨49,refinement_row_49⟩,⟨50,refinement_row_50⟩,⟨51,refinement_row_51⟩,⟨52,refinement_row_52⟩,⟨53,refinement_row_53⟩,⟨54,refinement_row_54⟩,⟨55,refinement_row_55⟩,⟨56,refinement_row_56⟩,⟨57,refinement_row_57⟩,⟨58,refinement_row_58⟩,⟨59,refinement_row_59⟩,⟨60,refinement_row_60⟩,⟨61,refinement_row_61⟩,⟨62,refinement_row_62⟩,⟨63,refinement_row_63⟩,⟨64,refinement_row_64⟩,⟨65,refinement_row_65⟩,⟨66,refinement_row_66⟩,⟨67,refinement_row_67⟩,⟨68,refinement_row_68⟩,⟨69,refinement_row_69⟩,⟨70,refinement_row_70⟩,⟨71,refinement_row_71⟩,⟨72,refinement_row_72⟩,⟨73,refinement_row_73⟩,⟨74,refinement_row_74⟩,⟨75,refinement_row_75⟩,⟨76,refinement_row_76⟩,⟨77,refinement_row_77⟩,⟨78,refinement_row_78⟩,⟨79,refinement_row_79⟩,⟨80,refinement_row_80⟩,⟨81,refinement_row_81⟩,⟨82,refinement_row_82⟩,⟨83,refinement_row_83⟩,⟨84,refinement_row_84⟩,⟨85,refinement_row_85⟩,⟨86,refinement_row_86⟩,⟨87,refinement_row_87⟩,⟨88,refinement_row_88⟩,⟨89,refinement_row_89⟩,⟨90,refinement_row_90⟩,⟨91,refinement_row_91⟩,⟨92,refinement_row_92⟩,⟨93,refinement_row_93⟩,⟨94,refinement_row_94⟩,⟨95,refinement_row_95⟩,⟨96,refinement_row_96⟩,⟨97,refinement_row_97⟩,⟨98,refinement_row_98⟩,⟨99,refinement_row_99⟩,⟨100,refinement_row_100⟩,⟨101,refinement_row_101⟩,⟨102,refinement_row_102⟩,⟨103,refinement_row_103⟩,⟨104,refinement_row_104⟩,⟨105,refinement_row_105⟩,⟨106,refinement_row_106⟩,⟨107,refinement_row_107⟩,⟨108,refinement_row_108⟩,⟨109,refinement_row_109⟩,⟨110,refinement_row_110⟩] (by decide))

theorem checked_label_step : ∀ q d, label (next q d)=machine.step (label q) d := by decide
theorem final_row_0 : (active (0 : Fin 111)).any Lower.semantic.final=machine.final (label (0 : Fin 111)) := by decide
theorem final_row_1 : (active (1 : Fin 111)).any Lower.semantic.final=machine.final (label (1 : Fin 111)) := by decide
theorem final_row_2 : (active (2 : Fin 111)).any Lower.semantic.final=machine.final (label (2 : Fin 111)) := by decide
theorem final_row_3 : (active (3 : Fin 111)).any Lower.semantic.final=machine.final (label (3 : Fin 111)) := by decide
theorem final_row_4 : (active (4 : Fin 111)).any Lower.semantic.final=machine.final (label (4 : Fin 111)) := by decide
theorem final_row_5 : (active (5 : Fin 111)).any Lower.semantic.final=machine.final (label (5 : Fin 111)) := by decide
theorem final_row_6 : (active (6 : Fin 111)).any Lower.semantic.final=machine.final (label (6 : Fin 111)) := by decide
theorem final_row_7 : (active (7 : Fin 111)).any Lower.semantic.final=machine.final (label (7 : Fin 111)) := by decide
theorem final_row_8 : (active (8 : Fin 111)).any Lower.semantic.final=machine.final (label (8 : Fin 111)) := by decide
theorem final_row_9 : (active (9 : Fin 111)).any Lower.semantic.final=machine.final (label (9 : Fin 111)) := by decide
theorem final_row_10 : (active (10 : Fin 111)).any Lower.semantic.final=machine.final (label (10 : Fin 111)) := by decide
theorem final_row_11 : (active (11 : Fin 111)).any Lower.semantic.final=machine.final (label (11 : Fin 111)) := by decide
theorem final_row_12 : (active (12 : Fin 111)).any Lower.semantic.final=machine.final (label (12 : Fin 111)) := by decide
theorem final_row_13 : (active (13 : Fin 111)).any Lower.semantic.final=machine.final (label (13 : Fin 111)) := by decide
theorem final_row_14 : (active (14 : Fin 111)).any Lower.semantic.final=machine.final (label (14 : Fin 111)) := by decide
theorem final_row_15 : (active (15 : Fin 111)).any Lower.semantic.final=machine.final (label (15 : Fin 111)) := by decide
theorem final_row_16 : (active (16 : Fin 111)).any Lower.semantic.final=machine.final (label (16 : Fin 111)) := by decide
theorem final_row_17 : (active (17 : Fin 111)).any Lower.semantic.final=machine.final (label (17 : Fin 111)) := by decide
theorem final_row_18 : (active (18 : Fin 111)).any Lower.semantic.final=machine.final (label (18 : Fin 111)) := by decide
theorem final_row_19 : (active (19 : Fin 111)).any Lower.semantic.final=machine.final (label (19 : Fin 111)) := by decide
theorem final_row_20 : (active (20 : Fin 111)).any Lower.semantic.final=machine.final (label (20 : Fin 111)) := by decide
theorem final_row_21 : (active (21 : Fin 111)).any Lower.semantic.final=machine.final (label (21 : Fin 111)) := by decide
theorem final_row_22 : (active (22 : Fin 111)).any Lower.semantic.final=machine.final (label (22 : Fin 111)) := by decide
theorem final_row_23 : (active (23 : Fin 111)).any Lower.semantic.final=machine.final (label (23 : Fin 111)) := by decide
theorem final_row_24 : (active (24 : Fin 111)).any Lower.semantic.final=machine.final (label (24 : Fin 111)) := by decide
theorem final_row_25 : (active (25 : Fin 111)).any Lower.semantic.final=machine.final (label (25 : Fin 111)) := by decide
theorem final_row_26 : (active (26 : Fin 111)).any Lower.semantic.final=machine.final (label (26 : Fin 111)) := by decide
theorem final_row_27 : (active (27 : Fin 111)).any Lower.semantic.final=machine.final (label (27 : Fin 111)) := by decide
theorem final_row_28 : (active (28 : Fin 111)).any Lower.semantic.final=machine.final (label (28 : Fin 111)) := by decide
theorem final_row_29 : (active (29 : Fin 111)).any Lower.semantic.final=machine.final (label (29 : Fin 111)) := by decide
theorem final_row_30 : (active (30 : Fin 111)).any Lower.semantic.final=machine.final (label (30 : Fin 111)) := by decide
theorem final_row_31 : (active (31 : Fin 111)).any Lower.semantic.final=machine.final (label (31 : Fin 111)) := by decide
theorem final_row_32 : (active (32 : Fin 111)).any Lower.semantic.final=machine.final (label (32 : Fin 111)) := by decide
theorem final_row_33 : (active (33 : Fin 111)).any Lower.semantic.final=machine.final (label (33 : Fin 111)) := by decide
theorem final_row_34 : (active (34 : Fin 111)).any Lower.semantic.final=machine.final (label (34 : Fin 111)) := by decide
theorem final_row_35 : (active (35 : Fin 111)).any Lower.semantic.final=machine.final (label (35 : Fin 111)) := by decide
theorem final_row_36 : (active (36 : Fin 111)).any Lower.semantic.final=machine.final (label (36 : Fin 111)) := by decide
theorem final_row_37 : (active (37 : Fin 111)).any Lower.semantic.final=machine.final (label (37 : Fin 111)) := by decide
theorem final_row_38 : (active (38 : Fin 111)).any Lower.semantic.final=machine.final (label (38 : Fin 111)) := by decide
theorem final_row_39 : (active (39 : Fin 111)).any Lower.semantic.final=machine.final (label (39 : Fin 111)) := by decide
theorem final_row_40 : (active (40 : Fin 111)).any Lower.semantic.final=machine.final (label (40 : Fin 111)) := by decide
theorem final_row_41 : (active (41 : Fin 111)).any Lower.semantic.final=machine.final (label (41 : Fin 111)) := by decide
theorem final_row_42 : (active (42 : Fin 111)).any Lower.semantic.final=machine.final (label (42 : Fin 111)) := by decide
theorem final_row_43 : (active (43 : Fin 111)).any Lower.semantic.final=machine.final (label (43 : Fin 111)) := by decide
theorem final_row_44 : (active (44 : Fin 111)).any Lower.semantic.final=machine.final (label (44 : Fin 111)) := by decide
theorem final_row_45 : (active (45 : Fin 111)).any Lower.semantic.final=machine.final (label (45 : Fin 111)) := by decide
theorem final_row_46 : (active (46 : Fin 111)).any Lower.semantic.final=machine.final (label (46 : Fin 111)) := by decide
theorem final_row_47 : (active (47 : Fin 111)).any Lower.semantic.final=machine.final (label (47 : Fin 111)) := by decide
theorem final_row_48 : (active (48 : Fin 111)).any Lower.semantic.final=machine.final (label (48 : Fin 111)) := by decide
theorem final_row_49 : (active (49 : Fin 111)).any Lower.semantic.final=machine.final (label (49 : Fin 111)) := by decide
theorem final_row_50 : (active (50 : Fin 111)).any Lower.semantic.final=machine.final (label (50 : Fin 111)) := by decide
theorem final_row_51 : (active (51 : Fin 111)).any Lower.semantic.final=machine.final (label (51 : Fin 111)) := by decide
theorem final_row_52 : (active (52 : Fin 111)).any Lower.semantic.final=machine.final (label (52 : Fin 111)) := by decide
theorem final_row_53 : (active (53 : Fin 111)).any Lower.semantic.final=machine.final (label (53 : Fin 111)) := by decide
theorem final_row_54 : (active (54 : Fin 111)).any Lower.semantic.final=machine.final (label (54 : Fin 111)) := by decide
theorem final_row_55 : (active (55 : Fin 111)).any Lower.semantic.final=machine.final (label (55 : Fin 111)) := by decide
theorem final_row_56 : (active (56 : Fin 111)).any Lower.semantic.final=machine.final (label (56 : Fin 111)) := by decide
theorem final_row_57 : (active (57 : Fin 111)).any Lower.semantic.final=machine.final (label (57 : Fin 111)) := by decide
theorem final_row_58 : (active (58 : Fin 111)).any Lower.semantic.final=machine.final (label (58 : Fin 111)) := by decide
theorem final_row_59 : (active (59 : Fin 111)).any Lower.semantic.final=machine.final (label (59 : Fin 111)) := by decide
theorem final_row_60 : (active (60 : Fin 111)).any Lower.semantic.final=machine.final (label (60 : Fin 111)) := by decide
theorem final_row_61 : (active (61 : Fin 111)).any Lower.semantic.final=machine.final (label (61 : Fin 111)) := by decide
theorem final_row_62 : (active (62 : Fin 111)).any Lower.semantic.final=machine.final (label (62 : Fin 111)) := by decide
theorem final_row_63 : (active (63 : Fin 111)).any Lower.semantic.final=machine.final (label (63 : Fin 111)) := by decide
theorem final_row_64 : (active (64 : Fin 111)).any Lower.semantic.final=machine.final (label (64 : Fin 111)) := by decide
theorem final_row_65 : (active (65 : Fin 111)).any Lower.semantic.final=machine.final (label (65 : Fin 111)) := by decide
theorem final_row_66 : (active (66 : Fin 111)).any Lower.semantic.final=machine.final (label (66 : Fin 111)) := by decide
theorem final_row_67 : (active (67 : Fin 111)).any Lower.semantic.final=machine.final (label (67 : Fin 111)) := by decide
theorem final_row_68 : (active (68 : Fin 111)).any Lower.semantic.final=machine.final (label (68 : Fin 111)) := by decide
theorem final_row_69 : (active (69 : Fin 111)).any Lower.semantic.final=machine.final (label (69 : Fin 111)) := by decide
theorem final_row_70 : (active (70 : Fin 111)).any Lower.semantic.final=machine.final (label (70 : Fin 111)) := by decide
theorem final_row_71 : (active (71 : Fin 111)).any Lower.semantic.final=machine.final (label (71 : Fin 111)) := by decide
theorem final_row_72 : (active (72 : Fin 111)).any Lower.semantic.final=machine.final (label (72 : Fin 111)) := by decide
theorem final_row_73 : (active (73 : Fin 111)).any Lower.semantic.final=machine.final (label (73 : Fin 111)) := by decide
theorem final_row_74 : (active (74 : Fin 111)).any Lower.semantic.final=machine.final (label (74 : Fin 111)) := by decide
theorem final_row_75 : (active (75 : Fin 111)).any Lower.semantic.final=machine.final (label (75 : Fin 111)) := by decide
theorem final_row_76 : (active (76 : Fin 111)).any Lower.semantic.final=machine.final (label (76 : Fin 111)) := by decide
theorem final_row_77 : (active (77 : Fin 111)).any Lower.semantic.final=machine.final (label (77 : Fin 111)) := by decide
theorem final_row_78 : (active (78 : Fin 111)).any Lower.semantic.final=machine.final (label (78 : Fin 111)) := by decide
theorem final_row_79 : (active (79 : Fin 111)).any Lower.semantic.final=machine.final (label (79 : Fin 111)) := by decide
theorem final_row_80 : (active (80 : Fin 111)).any Lower.semantic.final=machine.final (label (80 : Fin 111)) := by decide
theorem final_row_81 : (active (81 : Fin 111)).any Lower.semantic.final=machine.final (label (81 : Fin 111)) := by decide
theorem final_row_82 : (active (82 : Fin 111)).any Lower.semantic.final=machine.final (label (82 : Fin 111)) := by decide
theorem final_row_83 : (active (83 : Fin 111)).any Lower.semantic.final=machine.final (label (83 : Fin 111)) := by decide
theorem final_row_84 : (active (84 : Fin 111)).any Lower.semantic.final=machine.final (label (84 : Fin 111)) := by decide
theorem final_row_85 : (active (85 : Fin 111)).any Lower.semantic.final=machine.final (label (85 : Fin 111)) := by decide
theorem final_row_86 : (active (86 : Fin 111)).any Lower.semantic.final=machine.final (label (86 : Fin 111)) := by decide
theorem final_row_87 : (active (87 : Fin 111)).any Lower.semantic.final=machine.final (label (87 : Fin 111)) := by decide
theorem final_row_88 : (active (88 : Fin 111)).any Lower.semantic.final=machine.final (label (88 : Fin 111)) := by decide
theorem final_row_89 : (active (89 : Fin 111)).any Lower.semantic.final=machine.final (label (89 : Fin 111)) := by decide
theorem final_row_90 : (active (90 : Fin 111)).any Lower.semantic.final=machine.final (label (90 : Fin 111)) := by decide
theorem final_row_91 : (active (91 : Fin 111)).any Lower.semantic.final=machine.final (label (91 : Fin 111)) := by decide
theorem final_row_92 : (active (92 : Fin 111)).any Lower.semantic.final=machine.final (label (92 : Fin 111)) := by decide
theorem final_row_93 : (active (93 : Fin 111)).any Lower.semantic.final=machine.final (label (93 : Fin 111)) := by decide
theorem final_row_94 : (active (94 : Fin 111)).any Lower.semantic.final=machine.final (label (94 : Fin 111)) := by decide
theorem final_row_95 : (active (95 : Fin 111)).any Lower.semantic.final=machine.final (label (95 : Fin 111)) := by decide
theorem final_row_96 : (active (96 : Fin 111)).any Lower.semantic.final=machine.final (label (96 : Fin 111)) := by decide
theorem final_row_97 : (active (97 : Fin 111)).any Lower.semantic.final=machine.final (label (97 : Fin 111)) := by decide
theorem final_row_98 : (active (98 : Fin 111)).any Lower.semantic.final=machine.final (label (98 : Fin 111)) := by decide
theorem final_row_99 : (active (99 : Fin 111)).any Lower.semantic.final=machine.final (label (99 : Fin 111)) := by decide
theorem final_row_100 : (active (100 : Fin 111)).any Lower.semantic.final=machine.final (label (100 : Fin 111)) := by decide
theorem final_row_101 : (active (101 : Fin 111)).any Lower.semantic.final=machine.final (label (101 : Fin 111)) := by decide
theorem final_row_102 : (active (102 : Fin 111)).any Lower.semantic.final=machine.final (label (102 : Fin 111)) := by decide
theorem final_row_103 : (active (103 : Fin 111)).any Lower.semantic.final=machine.final (label (103 : Fin 111)) := by decide
theorem final_row_104 : (active (104 : Fin 111)).any Lower.semantic.final=machine.final (label (104 : Fin 111)) := by decide
theorem final_row_105 : (active (105 : Fin 111)).any Lower.semantic.final=machine.final (label (105 : Fin 111)) := by decide
theorem final_row_106 : (active (106 : Fin 111)).any Lower.semantic.final=machine.final (label (106 : Fin 111)) := by decide
theorem final_row_107 : (active (107 : Fin 111)).any Lower.semantic.final=machine.final (label (107 : Fin 111)) := by decide
theorem final_row_108 : (active (108 : Fin 111)).any Lower.semantic.final=machine.final (label (108 : Fin 111)) := by decide
theorem final_row_109 : (active (109 : Fin 111)).any Lower.semantic.final=machine.final (label (109 : Fin 111)) := by decide
theorem final_row_110 : (active (110 : Fin 111)).any Lower.semantic.final=machine.final (label (110 : Fin 111)) := by decide
theorem checked_final : ∀ q, (active q).any Lower.semantic.final=machine.final (label q) :=
  (checked_list_rows (n:=111) [⟨0,final_row_0⟩,⟨1,final_row_1⟩,⟨2,final_row_2⟩,⟨3,final_row_3⟩,⟨4,final_row_4⟩,⟨5,final_row_5⟩,⟨6,final_row_6⟩,⟨7,final_row_7⟩,⟨8,final_row_8⟩,⟨9,final_row_9⟩,⟨10,final_row_10⟩,⟨11,final_row_11⟩,⟨12,final_row_12⟩,⟨13,final_row_13⟩,⟨14,final_row_14⟩,⟨15,final_row_15⟩,⟨16,final_row_16⟩,⟨17,final_row_17⟩,⟨18,final_row_18⟩,⟨19,final_row_19⟩,⟨20,final_row_20⟩,⟨21,final_row_21⟩,⟨22,final_row_22⟩,⟨23,final_row_23⟩,⟨24,final_row_24⟩,⟨25,final_row_25⟩,⟨26,final_row_26⟩,⟨27,final_row_27⟩,⟨28,final_row_28⟩,⟨29,final_row_29⟩,⟨30,final_row_30⟩,⟨31,final_row_31⟩,⟨32,final_row_32⟩,⟨33,final_row_33⟩,⟨34,final_row_34⟩,⟨35,final_row_35⟩,⟨36,final_row_36⟩,⟨37,final_row_37⟩,⟨38,final_row_38⟩,⟨39,final_row_39⟩,⟨40,final_row_40⟩,⟨41,final_row_41⟩,⟨42,final_row_42⟩,⟨43,final_row_43⟩,⟨44,final_row_44⟩,⟨45,final_row_45⟩,⟨46,final_row_46⟩,⟨47,final_row_47⟩,⟨48,final_row_48⟩,⟨49,final_row_49⟩,⟨50,final_row_50⟩,⟨51,final_row_51⟩,⟨52,final_row_52⟩,⟨53,final_row_53⟩,⟨54,final_row_54⟩,⟨55,final_row_55⟩,⟨56,final_row_56⟩,⟨57,final_row_57⟩,⟨58,final_row_58⟩,⟨59,final_row_59⟩,⟨60,final_row_60⟩,⟨61,final_row_61⟩,⟨62,final_row_62⟩,⟨63,final_row_63⟩,⟨64,final_row_64⟩,⟨65,final_row_65⟩,⟨66,final_row_66⟩,⟨67,final_row_67⟩,⟨68,final_row_68⟩,⟨69,final_row_69⟩,⟨70,final_row_70⟩,⟨71,final_row_71⟩,⟨72,final_row_72⟩,⟨73,final_row_73⟩,⟨74,final_row_74⟩,⟨75,final_row_75⟩,⟨76,final_row_76⟩,⟨77,final_row_77⟩,⟨78,final_row_78⟩,⟨79,final_row_79⟩,⟨80,final_row_80⟩,⟨81,final_row_81⟩,⟨82,final_row_82⟩,⟨83,final_row_83⟩,⟨84,final_row_84⟩,⟨85,final_row_85⟩,⟨86,final_row_86⟩,⟨87,final_row_87⟩,⟨88,final_row_88⟩,⟨89,final_row_89⟩,⟨90,final_row_90⟩,⟨91,final_row_91⟩,⟨92,final_row_92⟩,⟨93,final_row_93⟩,⟨94,final_row_94⟩,⟨95,final_row_95⟩,⟨96,final_row_96⟩,⟨97,final_row_97⟩,⟨98,final_row_98⟩,⟨99,final_row_99⟩,⟨100,final_row_100⟩,⟨101,final_row_101⟩,⟨102,final_row_102⟩,⟨103,final_row_103⟩,⟨104,final_row_104⟩,⟨105,final_row_105⟩,⟨106,final_row_106⟩,⟨107,final_row_107⟩,⟨108,final_row_108⟩,⟨109,final_row_109⟩,⟨110,final_row_110⟩] (by decide))

theorem language (w : List Digit) : Lower.semantic.accepts w=machine.accepts w :=
  certified_list_refinement Lower.semantic machine (0 : Fin 111) active label next
    checked_start checked_label_start checked_step checked_label_step checked_final w

theorem correct (w : List Digit) : machine.accepts w=true ↔
    0<decodeHigh sizeBit w ∧ decodeHigh valueBit w<CutPeriod.value (decodeHigh sizeBit w) := by
  rw [←language]
  exact Lower.correct w
#print axioms correct
end CutPeriod.LowerCertificate
