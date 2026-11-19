import Conjectures.CutPeriodParts3TransitionRows0
import Conjectures.CutPeriodParts3TransitionRows1
import Conjectures.CutPeriodParts3TransitionRows2
import Conjectures.CutPeriodParts3TransitionRows3
import Conjectures.CutPeriodParts3TransitionRows4
import Conjectures.CutPeriodParts3TransitionRows5
import Conjectures.CutPeriodParts3TransitionRows6
import Conjectures.CutPeriodParts3TransitionRows7
import Conjectures.CutPeriodParts3TransitionRows8
import Conjectures.CutPeriodParts3TransitionRows9
import Conjectures.CutPeriodParts3TransitionRows10
import Conjectures.CutPeriodParts3TransitionRows11
import Conjectures.CutPeriodParts3TransitionRows12
import Conjectures.CutPeriodParts3TransitionRows13
import Conjectures.CutPeriodParts3TransitionRows14
import Conjectures.CutPeriodParts3TransitionRows15
import Conjectures.CutPeriodParts3TransitionRows16
import Conjectures.CutPeriodParts3TransitionRows17
import Conjectures.CutPeriodParts3TransitionRows18
import Conjectures.CutPeriodParts3TransitionRows19
import Conjectures.CutPeriodParts3TransitionRows20
import Conjectures.CutPeriodParts3TransitionRows21
import Conjectures.CutPeriodParts3TransitionRows22
import Conjectures.CutPeriodParts3TransitionRows23
import Conjectures.CutPeriodParts3TransitionRows24
import Conjectures.CutPeriodParts3TransitionRows25
import Conjectures.CutPeriodParts3TransitionRows26
namespace CutPeriod.Parts3Certificate
open BinaryAutomata
set_option Elab.async false
set_option linter.all false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
set_option exponentiation.threshold 6804
theorem checked_fast : ∀ q : Fin 6804, ∀ d, cachedSuccessors q d=fast q d := by
  let Block : Fin 27 → Prop := fun i => ∀ q : Fin 6804,
    i.val*256≤q.val → q.val<(i.val+1)*256 → ∀ d, cachedSuccessors q d=fast q d
  have hb : ∀ i, Block i :=
    FiniteCertificate.checked_list_rows (P:=Block) [⟨0,transition_block_0⟩,⟨1,transition_block_1⟩,⟨2,transition_block_2⟩,⟨3,transition_block_3⟩,⟨4,transition_block_4⟩,⟨5,transition_block_5⟩,⟨6,transition_block_6⟩,⟨7,transition_block_7⟩,⟨8,transition_block_8⟩,⟨9,transition_block_9⟩,⟨10,transition_block_10⟩,⟨11,transition_block_11⟩,⟨12,transition_block_12⟩,⟨13,transition_block_13⟩,⟨14,transition_block_14⟩,⟨15,transition_block_15⟩,⟨16,transition_block_16⟩,⟨17,transition_block_17⟩,⟨18,transition_block_18⟩,⟨19,transition_block_19⟩,⟨20,transition_block_20⟩,⟨21,transition_block_21⟩,⟨22,transition_block_22⟩,⟨23,transition_block_23⟩,⟨24,transition_block_24⟩,⟨25,transition_block_25⟩,⟨26,transition_block_26⟩] (by decide +kernel)
  intro q
  let i : Fin 27 := ⟨q.val/256,by have hq := q.isLt; omega⟩
  apply hb i q
  all_goals dsimp only [i]; have hq := q.isLt; omega
theorem checked_successors : ∀ s d, cachedSuccessors s d=semantic.successors s d :=
  fun s d => (checked_fast s d).trans (fast_eq s d)

theorem composed_eq : composed=semantic := by
  have h : cachedSuccessors=semantic.successors := funext (fun s => funext (checked_successors s))
  unfold composed
  rw [h]

end CutPeriod.Parts3Certificate
