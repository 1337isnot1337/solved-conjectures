module

public import Conjectures.AgnosticVC.Output
public import Conjectures.AgnosticVC.PairedDeletion

/-! Exact deletion charges on the canonical full-block output alphabet. -/

@[expose] public section

namespace AgnosticVC

variable {n : ℕ} {X H : Type*} [Nonempty H]

noncomputable def liftedDeletionCharge (σ : Schedule) (predict : H → X → Bool)
    (T : Fin (n+1) → X × Bool) (i : Fin (n+1))
    (lift : TraceSpace predict (Prod.fst ∘ T ∘ i.succAbove) → TraceSpace predict (Prod.fst ∘ T)) : ℝ :=
  let x := Prod.fst ∘ T
  let y := Prod.snd ∘ T
  let e := i.succAbove
  hellingerSq (marginal lift (learnedTraceMass σ predict (x ∘ e) (y ∘ e)))
    (learnedTraceMass σ predict x y)

noncomputable def rawLiftedDeletionCharge (σ : Schedule) (predict : H → X → Bool)
    (T : Fin (n+1) → X × Bool) (i : Fin (n+1))
    (lift : TraceSpace predict (Prod.fst ∘ T ∘ i.succAbove) → TraceSpace predict (Prod.fst ∘ T))
    (w : Fin (n+1) → ℝ) : ℝ :=
  let x := Prod.fst ∘ T
  let y := Prod.snd ∘ T
  let e := i.succAbove
  hellingerSq (marginal lift (traceLaw σ predict (x ∘ e) (y ∘ e) (w ∘ e)))
    (traceLaw σ predict x y w)

variable [TraceOrder H]

noncomputable def blockDeletionCharge (σ : Schedule) (predict : H → X → Bool)
    (T : Fin (n+1) → X × Bool) (i : Fin (n+1)) : ℝ :=
  liftedDeletionCharge σ predict T i (extendTrace predict (Prod.fst ∘ T) i.succAbove)

noncomputable def rawBlockDeletionCharge (σ : Schedule) (predict : H → X → Bool)
    (T : Fin (n+1) → X × Bool) (i : Fin (n+1)) (w : Fin (n+1) → ℝ) : ℝ :=
  rawLiftedDeletionCharge σ predict T i (extendTrace predict (Prod.fst ∘ T) i.succAbove) w

theorem blockDeletionCharge_nonneg (σ : Schedule) (predict : H → X → Bool)
    (T : Fin (n+1) → X × Bool) (i : Fin (n+1)) :
    0 ≤ blockDeletionCharge σ predict T i := by
  unfold blockDeletionCharge liftedDeletionCharge
  exact hellingerSq_nonneg _ _

end AgnosticVC
