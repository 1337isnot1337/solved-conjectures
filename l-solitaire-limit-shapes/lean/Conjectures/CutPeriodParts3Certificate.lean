import Conjectures.CutPeriodParts3RefinementRows0
import Conjectures.CutPeriodParts3RefinementRows1
import Conjectures.CutPeriodParts3RefinementRows2
import Conjectures.CutPeriodParts3RefinementRows3
import Conjectures.CutPeriodParts3RefinementRows4
import Conjectures.CutPeriodParts3RefinementRows5
import Conjectures.CutPeriodParts3RefinementRows6
import Conjectures.CutPeriodParts3RefinementRows7
namespace CutPeriod.Parts3Certificate
open BinaryAutomata
set_option Elab.async false
set_option linter.all false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
set_option exponentiation.threshold 6804
theorem checked_start : maskOfList ((active 0).map Fin.val)=composed.startMask := by decide
theorem checked_label_start : label 0=machine.start := by decide
theorem checked_step : ∀ q : Fin 2013, ∀ d, maskOfList ((active (next q d)).map Fin.val)=
      maskOfList (((active q).flatMap (fun s => composed.successors s d)).map Fin.val) := by
  let Block : Fin 8 → Prop := fun i => ∀ q : Fin 2013,
    i.val*256≤q.val → q.val<(i.val+1)*256 → ∀ d, maskOfList ((active (next q d)).map Fin.val)=
      maskOfList (((active q).flatMap (fun s => composed.successors s d)).map Fin.val)
  have hb : ∀ i, Block i :=
    FiniteCertificate.checked_list_rows (P:=Block) [⟨0,refinement_block_0⟩,⟨1,refinement_block_1⟩,⟨2,refinement_block_2⟩,⟨3,refinement_block_3⟩,⟨4,refinement_block_4⟩,⟨5,refinement_block_5⟩,⟨6,refinement_block_6⟩,⟨7,refinement_block_7⟩] (by decide +kernel)
  intro q
  let i : Fin 8 := ⟨q.val/256,by have hq := q.isLt; omega⟩
  apply hb i q
  all_goals dsimp only [i]; have hq := q.isLt; omega
theorem checked_label_step : ∀ q d, label (next q d)=machine.step (label q) d := by decide
theorem checked_final : ∀ q : Fin 2013, (active q).any composed.final=machine.final (label q) := by
  let Block : Fin 8 → Prop := fun i => ∀ q : Fin 2013,
    i.val*256≤q.val → q.val<(i.val+1)*256 → (active q).any composed.final=machine.final (label q)
  have hb : ∀ i, Block i :=
    FiniteCertificate.checked_list_rows (P:=Block) [⟨0,final_block_0⟩,⟨1,final_block_1⟩,⟨2,final_block_2⟩,⟨3,final_block_3⟩,⟨4,final_block_4⟩,⟨5,final_block_5⟩,⟨6,final_block_6⟩,⟨7,final_block_7⟩] (by decide +kernel)
  intro q
  let i : Fin 8 := ⟨q.val/256,by have hq := q.isLt; omega⟩
  apply hb i q
  all_goals dsimp only [i]; have hq := q.isLt; omega
theorem language (w : List Digit) : composed.accepts w=machine.accepts w :=
  certified_list_refinement composed machine (0 : Fin 2013) active label next
    checked_start checked_label_start checked_step checked_label_step checked_final w

theorem correct (w : List Digit) : machine.accepts w=true ↔
    ∃ cols : List Column, cols.map Column.out=w ∧
      Parts2Certificate.machine.accepts (cols.map Column.left)=true ∧
      GraphCertificate.machine.accepts (cols.map Column.right)=true ∧
      leftSize cols+rightSize cols=outSize cols ∧ leftValue cols ^^^ rightValue cols=outValue cols := by
  rw [←language,composed_eq]
  exact sum_accepts_iff encoding _ _ _ _
    Parts2Certificate.machine.rejectingSink_sound GraphCertificate.machine.rejectingSink_sound w

theorem recognizes_piles : CutPeriod.RecognizesPiles machine 3 := by
  intro w
  rw [←language,composed_eq]
  exact CutPeriod.sum_recognizes_successor encoding Parts2Certificate.machine 2
    Parts2Certificate.recognizes_piles w

#print axioms correct
#print axioms recognizes_piles
end CutPeriod.Parts3Certificate
