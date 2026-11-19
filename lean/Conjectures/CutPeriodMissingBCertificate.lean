-- Generated data; all Boolean-language refinements are checked by Lean.
import Conjectures.BinaryBoolean
import Conjectures.CutPeriodOptionData
import Conjectures.CutPeriodLowerCertificate
namespace CutPeriod.MissingBCertificate
open BinaryAutomata
set_option maxRecDepth 100000
set_option maxHeartbeats 0
def semantic : DFA (Fin 23 × Fin 28) := (LowerCertificate.machine).product OptionData.machineB (fun a b => a && !b)
def representativeData (idx : Nat) : (Fin 23 × Fin 28) := (if idx<17 then (if idx<8 then (if idx<4 then (if idx<2 then (if idx<1 then ((0 : Fin 23),(0 : Fin 28)) else ((1 : Fin 23),(1 : Fin 28))) else (if idx<3 then ((2 : Fin 23),(2 : Fin 28)) else ((3 : Fin 23),(3 : Fin 28)))) else (if idx<6 then (if idx<5 then ((4 : Fin 23),(4 : Fin 28)) else ((5 : Fin 23),(5 : Fin 28))) else (if idx<7 then ((6 : Fin 23),(6 : Fin 28)) else ((7 : Fin 23),(7 : Fin 28))))) else (if idx<12 then (if idx<10 then (if idx<9 then ((8 : Fin 23),(8 : Fin 28)) else ((9 : Fin 23),(9 : Fin 28))) else (if idx<11 then ((10 : Fin 23),(10 : Fin 28)) else ((11 : Fin 23),(11 : Fin 28)))) else (if idx<14 then (if idx<13 then ((3 : Fin 23),(12 : Fin 28)) else ((12 : Fin 23),(13 : Fin 28))) else (if idx<15 then ((13 : Fin 23),(14 : Fin 28)) else (if idx<16 then ((14 : Fin 23),(15 : Fin 28)) else ((15 : Fin 23),(16 : Fin 28))))))) else (if idx<25 then (if idx<21 then (if idx<19 then (if idx<18 then ((8 : Fin 23),(17 : Fin 28)) else ((16 : Fin 23),(18 : Fin 28))) else (if idx<20 then ((10 : Fin 23),(6 : Fin 28)) else ((17 : Fin 23),(4 : Fin 28)))) else (if idx<23 then (if idx<22 then ((5 : Fin 23),(19 : Fin 28)) else ((18 : Fin 23),(20 : Fin 28))) else (if idx<24 then ((19 : Fin 23),(7 : Fin 28)) else ((8 : Fin 23),(21 : Fin 28))))) else (if idx<29 then (if idx<27 then (if idx<26 then ((20 : Fin 23),(11 : Fin 28)) else ((3 : Fin 23),(22 : Fin 28))) else (if idx<28 then ((12 : Fin 23),(23 : Fin 28)) else ((21 : Fin 23),(24 : Fin 28)))) else (if idx<31 then (if idx<30 then ((22 : Fin 23),(25 : Fin 28)) else ((16 : Fin 23),(26 : Fin 28))) else (if idx<32 then ((5 : Fin 23),(27 : Fin 28)) else (if idx<33 then ((18 : Fin 23),(9 : Fin 28)) else ((21 : Fin 23),(15 : Fin 28))))))))
def rawRow (idx : Nat) : Array Nat := (if idx<17 then (if idx<8 then (if idx<4 then (if idx<2 then (if idx<1 then #[0,1,2,3] else #[1,1,1,1]) else (if idx<3 then #[4,5,6,7] else #[1,1,8,1])) else (if idx<6 then (if idx<5 then #[6,9,6,10] else #[11,12,13,14]) else (if idx<7 then #[6,6,6,6] else #[6,15,6,16]))) else (if idx<12 then (if idx<10 then (if idx<9 then #[17,1,18,3] else #[10,19,6,6]) else (if idx<11 then #[6,6,6,6] else #[20,21,22,23])) else (if idx<14 then (if idx<13 then #[1,1,24,1] else #[6,22,6,6]) else (if idx<15 then #[25,26,27,14] else (if idx<16 then #[6,28,6,29] else #[6,6,6,10]))))) else (if idx<25 then (if idx<21 then (if idx<19 then (if idx<18 then #[17,1,30,3] else #[4,31,32,23]) else (if idx<20 then #[6,6,6,6] else #[6,9,6,10])) else (if idx<23 then (if idx<22 then #[11,3,13,14] else #[10,19,6,6]) else (if idx<24 then #[19,33,6,16] else #[17,1,18,3]))) else (if idx<29 then (if idx<27 then (if idx<26 then #[20,21,22,23] else #[1,1,8,1]) else (if idx<28 then #[6,22,6,6] else #[6,28,6,29])) else (if idx<31 then (if idx<30 then #[6,6,6,10] else #[4,31,32,23]) else (if idx<32 then #[11,3,13,14] else (if idx<33 then #[10,19,6,6] else #[6,28,6,29]))))))
def labelData (_idx : Nat) : Nat := 0
def machineRow (_idx : Nat) : Array Nat := #[0,0,0,0]
def finalData (_idx : Nat) : Bool := false

def machine : DFA (Fin 1) := {
  step := fun q d => Fin.ofNat 1 ((machineRow q.val)[d.val]!)
  start := 0
  final := fun q => finalData q.val
}

def rep (q : Fin 34) : (Fin 23 × Fin 28) := representativeData q.val
def label (q : Fin 34) : Fin 1 := Fin.ofNat 1 (labelData q.val)
def next (q : Fin 34) (d : Digit) : Fin 34 :=
  Fin.ofNat 34 ((rawRow q.val)[d.val]!)
theorem checked_start : rep 0=semantic.start := by decide
theorem checked_label_start : label 0=machine.start := by decide
theorem transition_row_0 : ∀ d, rep (next (0 : Fin 34) d)=semantic.step (rep (0 : Fin 34)) d := by decide
theorem transition_row_1 : ∀ d, rep (next (1 : Fin 34) d)=semantic.step (rep (1 : Fin 34)) d := by decide
theorem transition_row_2 : ∀ d, rep (next (2 : Fin 34) d)=semantic.step (rep (2 : Fin 34)) d := by decide
theorem transition_row_3 : ∀ d, rep (next (3 : Fin 34) d)=semantic.step (rep (3 : Fin 34)) d := by decide
theorem transition_row_4 : ∀ d, rep (next (4 : Fin 34) d)=semantic.step (rep (4 : Fin 34)) d := by decide
theorem transition_row_5 : ∀ d, rep (next (5 : Fin 34) d)=semantic.step (rep (5 : Fin 34)) d := by decide
theorem transition_row_6 : ∀ d, rep (next (6 : Fin 34) d)=semantic.step (rep (6 : Fin 34)) d := by decide
theorem transition_row_7 : ∀ d, rep (next (7 : Fin 34) d)=semantic.step (rep (7 : Fin 34)) d := by decide
theorem transition_row_8 : ∀ d, rep (next (8 : Fin 34) d)=semantic.step (rep (8 : Fin 34)) d := by decide
theorem transition_row_9 : ∀ d, rep (next (9 : Fin 34) d)=semantic.step (rep (9 : Fin 34)) d := by decide
theorem transition_row_10 : ∀ d, rep (next (10 : Fin 34) d)=semantic.step (rep (10 : Fin 34)) d := by decide
theorem transition_row_11 : ∀ d, rep (next (11 : Fin 34) d)=semantic.step (rep (11 : Fin 34)) d := by decide
theorem transition_row_12 : ∀ d, rep (next (12 : Fin 34) d)=semantic.step (rep (12 : Fin 34)) d := by decide
theorem transition_row_13 : ∀ d, rep (next (13 : Fin 34) d)=semantic.step (rep (13 : Fin 34)) d := by decide
theorem transition_row_14 : ∀ d, rep (next (14 : Fin 34) d)=semantic.step (rep (14 : Fin 34)) d := by decide
theorem transition_row_15 : ∀ d, rep (next (15 : Fin 34) d)=semantic.step (rep (15 : Fin 34)) d := by decide
theorem transition_row_16 : ∀ d, rep (next (16 : Fin 34) d)=semantic.step (rep (16 : Fin 34)) d := by decide
theorem transition_row_17 : ∀ d, rep (next (17 : Fin 34) d)=semantic.step (rep (17 : Fin 34)) d := by decide
theorem transition_row_18 : ∀ d, rep (next (18 : Fin 34) d)=semantic.step (rep (18 : Fin 34)) d := by decide
theorem transition_row_19 : ∀ d, rep (next (19 : Fin 34) d)=semantic.step (rep (19 : Fin 34)) d := by decide
theorem transition_row_20 : ∀ d, rep (next (20 : Fin 34) d)=semantic.step (rep (20 : Fin 34)) d := by decide
theorem transition_row_21 : ∀ d, rep (next (21 : Fin 34) d)=semantic.step (rep (21 : Fin 34)) d := by decide
theorem transition_row_22 : ∀ d, rep (next (22 : Fin 34) d)=semantic.step (rep (22 : Fin 34)) d := by decide
theorem transition_row_23 : ∀ d, rep (next (23 : Fin 34) d)=semantic.step (rep (23 : Fin 34)) d := by decide
theorem transition_row_24 : ∀ d, rep (next (24 : Fin 34) d)=semantic.step (rep (24 : Fin 34)) d := by decide
theorem transition_row_25 : ∀ d, rep (next (25 : Fin 34) d)=semantic.step (rep (25 : Fin 34)) d := by decide
theorem transition_row_26 : ∀ d, rep (next (26 : Fin 34) d)=semantic.step (rep (26 : Fin 34)) d := by decide
theorem transition_row_27 : ∀ d, rep (next (27 : Fin 34) d)=semantic.step (rep (27 : Fin 34)) d := by decide
theorem transition_row_28 : ∀ d, rep (next (28 : Fin 34) d)=semantic.step (rep (28 : Fin 34)) d := by decide
theorem transition_row_29 : ∀ d, rep (next (29 : Fin 34) d)=semantic.step (rep (29 : Fin 34)) d := by decide
theorem transition_row_30 : ∀ d, rep (next (30 : Fin 34) d)=semantic.step (rep (30 : Fin 34)) d := by decide
theorem transition_row_31 : ∀ d, rep (next (31 : Fin 34) d)=semantic.step (rep (31 : Fin 34)) d := by decide
theorem transition_row_32 : ∀ d, rep (next (32 : Fin 34) d)=semantic.step (rep (32 : Fin 34)) d := by decide
theorem transition_row_33 : ∀ d, rep (next (33 : Fin 34) d)=semantic.step (rep (33 : Fin 34)) d := by decide
theorem checked_step : ∀ q d, rep (next q d)=semantic.step (rep q) d :=
  (checked_list_rows (n:=34) [⟨0,transition_row_0⟩,⟨1,transition_row_1⟩,⟨2,transition_row_2⟩,⟨3,transition_row_3⟩,⟨4,transition_row_4⟩,⟨5,transition_row_5⟩,⟨6,transition_row_6⟩,⟨7,transition_row_7⟩,⟨8,transition_row_8⟩,⟨9,transition_row_9⟩,⟨10,transition_row_10⟩,⟨11,transition_row_11⟩,⟨12,transition_row_12⟩,⟨13,transition_row_13⟩,⟨14,transition_row_14⟩,⟨15,transition_row_15⟩,⟨16,transition_row_16⟩,⟨17,transition_row_17⟩,⟨18,transition_row_18⟩,⟨19,transition_row_19⟩,⟨20,transition_row_20⟩,⟨21,transition_row_21⟩,⟨22,transition_row_22⟩,⟨23,transition_row_23⟩,⟨24,transition_row_24⟩,⟨25,transition_row_25⟩,⟨26,transition_row_26⟩,⟨27,transition_row_27⟩,⟨28,transition_row_28⟩,⟨29,transition_row_29⟩,⟨30,transition_row_30⟩,⟨31,transition_row_31⟩,⟨32,transition_row_32⟩,⟨33,transition_row_33⟩] (by decide))
theorem checked_label_step : ∀ q d, label (next q d)=machine.step (label q) d := by decide
theorem final_row_0 : semantic.final (rep (0 : Fin 34))=machine.final (label (0 : Fin 34)) := by decide
theorem final_row_1 : semantic.final (rep (1 : Fin 34))=machine.final (label (1 : Fin 34)) := by decide
theorem final_row_2 : semantic.final (rep (2 : Fin 34))=machine.final (label (2 : Fin 34)) := by decide
theorem final_row_3 : semantic.final (rep (3 : Fin 34))=machine.final (label (3 : Fin 34)) := by decide
theorem final_row_4 : semantic.final (rep (4 : Fin 34))=machine.final (label (4 : Fin 34)) := by decide
theorem final_row_5 : semantic.final (rep (5 : Fin 34))=machine.final (label (5 : Fin 34)) := by decide
theorem final_row_6 : semantic.final (rep (6 : Fin 34))=machine.final (label (6 : Fin 34)) := by decide
theorem final_row_7 : semantic.final (rep (7 : Fin 34))=machine.final (label (7 : Fin 34)) := by decide
theorem final_row_8 : semantic.final (rep (8 : Fin 34))=machine.final (label (8 : Fin 34)) := by decide
theorem final_row_9 : semantic.final (rep (9 : Fin 34))=machine.final (label (9 : Fin 34)) := by decide
theorem final_row_10 : semantic.final (rep (10 : Fin 34))=machine.final (label (10 : Fin 34)) := by decide
theorem final_row_11 : semantic.final (rep (11 : Fin 34))=machine.final (label (11 : Fin 34)) := by decide
theorem final_row_12 : semantic.final (rep (12 : Fin 34))=machine.final (label (12 : Fin 34)) := by decide
theorem final_row_13 : semantic.final (rep (13 : Fin 34))=machine.final (label (13 : Fin 34)) := by decide
theorem final_row_14 : semantic.final (rep (14 : Fin 34))=machine.final (label (14 : Fin 34)) := by decide
theorem final_row_15 : semantic.final (rep (15 : Fin 34))=machine.final (label (15 : Fin 34)) := by decide
theorem final_row_16 : semantic.final (rep (16 : Fin 34))=machine.final (label (16 : Fin 34)) := by decide
theorem final_row_17 : semantic.final (rep (17 : Fin 34))=machine.final (label (17 : Fin 34)) := by decide
theorem final_row_18 : semantic.final (rep (18 : Fin 34))=machine.final (label (18 : Fin 34)) := by decide
theorem final_row_19 : semantic.final (rep (19 : Fin 34))=machine.final (label (19 : Fin 34)) := by decide
theorem final_row_20 : semantic.final (rep (20 : Fin 34))=machine.final (label (20 : Fin 34)) := by decide
theorem final_row_21 : semantic.final (rep (21 : Fin 34))=machine.final (label (21 : Fin 34)) := by decide
theorem final_row_22 : semantic.final (rep (22 : Fin 34))=machine.final (label (22 : Fin 34)) := by decide
theorem final_row_23 : semantic.final (rep (23 : Fin 34))=machine.final (label (23 : Fin 34)) := by decide
theorem final_row_24 : semantic.final (rep (24 : Fin 34))=machine.final (label (24 : Fin 34)) := by decide
theorem final_row_25 : semantic.final (rep (25 : Fin 34))=machine.final (label (25 : Fin 34)) := by decide
theorem final_row_26 : semantic.final (rep (26 : Fin 34))=machine.final (label (26 : Fin 34)) := by decide
theorem final_row_27 : semantic.final (rep (27 : Fin 34))=machine.final (label (27 : Fin 34)) := by decide
theorem final_row_28 : semantic.final (rep (28 : Fin 34))=machine.final (label (28 : Fin 34)) := by decide
theorem final_row_29 : semantic.final (rep (29 : Fin 34))=machine.final (label (29 : Fin 34)) := by decide
theorem final_row_30 : semantic.final (rep (30 : Fin 34))=machine.final (label (30 : Fin 34)) := by decide
theorem final_row_31 : semantic.final (rep (31 : Fin 34))=machine.final (label (31 : Fin 34)) := by decide
theorem final_row_32 : semantic.final (rep (32 : Fin 34))=machine.final (label (32 : Fin 34)) := by decide
theorem final_row_33 : semantic.final (rep (33 : Fin 34))=machine.final (label (33 : Fin 34)) := by decide
theorem checked_final : ∀ q, semantic.final (rep q)=machine.final (label q) :=
  (checked_list_rows (n:=34) [⟨0,final_row_0⟩,⟨1,final_row_1⟩,⟨2,final_row_2⟩,⟨3,final_row_3⟩,⟨4,final_row_4⟩,⟨5,final_row_5⟩,⟨6,final_row_6⟩,⟨7,final_row_7⟩,⟨8,final_row_8⟩,⟨9,final_row_9⟩,⟨10,final_row_10⟩,⟨11,final_row_11⟩,⟨12,final_row_12⟩,⟨13,final_row_13⟩,⟨14,final_row_14⟩,⟨15,final_row_15⟩,⟨16,final_row_16⟩,⟨17,final_row_17⟩,⟨18,final_row_18⟩,⟨19,final_row_19⟩,⟨20,final_row_20⟩,⟨21,final_row_21⟩,⟨22,final_row_22⟩,⟨23,final_row_23⟩,⟨24,final_row_24⟩,⟨25,final_row_25⟩,⟨26,final_row_26⟩,⟨27,final_row_27⟩,⟨28,final_row_28⟩,⟨29,final_row_29⟩,⟨30,final_row_30⟩,⟨31,final_row_31⟩,⟨32,final_row_32⟩,⟨33,final_row_33⟩] (by decide))

theorem language (w : List Digit) : semantic.accepts w=machine.accepts w :=
  certified_dfa_refinement semantic machine (0 : Fin 34) rep label next
    checked_start checked_label_start checked_step checked_label_step checked_final w

theorem checked_nonacceptance : ∀ q, machine.final q=false := by decide
theorem rejects (w : List Digit) : semantic.accepts w=false := by
  rw [language]
  exact DFA.rejects_of_final_false machine checked_nonacceptance w
#print axioms rejects
end CutPeriod.MissingBCertificate
