module

public import Conjectures.AgnosticVC.Output
public import Conjectures.AgnosticVC.PairedDeletion

/-! Exact deletion charges on the canonical full-block output alphabet. -/

@[expose] public section

namespace AgnosticVC

variable {n : ℕ} {X H : Type*} [Nonempty H] [TraceOrder H]

noncomputable def blockDeletionCharge (σ : Schedule) (predict : H → X → Bool)
    (T : Fin (n+1) → X × Bool) (i : Fin (n+1)) : ℝ :=
  let x := fun j => (T j).1
  let y := fun j => (T j).2
  let e := i.succAbove
  hellingerSq
    (marginal (extendTrace predict x e) (learnedTraceMass σ predict (x ∘ e) (y ∘ e)))
    (learnedTraceMass σ predict x y)

noncomputable def rawBlockDeletionCharge (σ : Schedule) (predict : H → X → Bool)
    (T : Fin (n+1) → X × Bool) (i : Fin (n+1)) (w : Fin (n+1) → ℝ) : ℝ :=
  let x := fun j => (T j).1
  let y := fun j => (T j).2
  let e := i.succAbove
  hellingerSq
    (marginal (extendTrace predict x e) (traceLaw σ predict (x ∘ e) (y ∘ e) (w ∘ e)))
    (traceLaw σ predict x y w)

theorem blockDeletionCharge_nonneg (σ : Schedule) (predict : H → X → Bool)
    (T : Fin (n+1) → X × Bool) (i : Fin (n+1)) :
    0 ≤ blockDeletionCharge σ predict T i := hellingerSq_nonneg _ _

end AgnosticVC
