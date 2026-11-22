module

public import Conjectures.AgnosticVC.DeletionChannel
public import Conjectures.AgnosticVC.PairedIntegral
public import Conjectures.AgnosticVC.Mixtures

/-! Couple all deletion laws by the same vector of continuous uniform weights. -/

@[expose] public section

open MeasureTheory
open scoped BigOperators

namespace AgnosticVC

variable {n : ℕ} {X H : Type*} [Nonempty H]

private theorem trace_cont {I : Type*} [Fintype I] [DecidableEq I] {σ : Schedule}
    (hτ : 0 < σ.temperature) (ha : ∀ j, 0 ≤ σ.coeff j) (predict : H → X → Bool)
    (x : I → X) (y : I → Bool) : Continuous (fun u : I → unitInterval =>
      traceLaw σ predict x y (weightDraw u)) := by
  apply (continuous_traceLaw hτ ha predict x y).comp
  unfold weightDraw
  fun_prop

variable [TraceOrder H]

theorem blockDeletionCharge_le_shared {σ : Schedule} (hτ : 0 < σ.temperature)
    (ha : ∀ j, 0 ≤ σ.coeff j) (predict : H → X → Bool) (T : Fin (n+1) → X × Bool)
    (i : Fin (n+1)) : blockDeletionCharge σ predict T i ≤
      ∫ u, rawBlockDeletionCharge σ predict T i (weightDraw u) ∂weightMeasure (Fin (n+1)) := by
  classical
  let x := fun j => (T j).1
  let y := fun j => (T j).2
  let e := i.succAbove
  let ν := weightMeasure (Fin (n+1))
  let μ := weightMeasure (Fin n)
  let ext := extendTrace predict x e
  let small := fun u : Fin n → unitInterval => traceLaw σ predict (x ∘ e) (y ∘ e) (weightDraw u)
  let p := fun u : Fin (n+1) → unitInterval => marginal ext (small (u ∘ e))
  let q := fun u : Fin (n+1) → unitInterval => traceLaw σ predict x y (weightDraw u)
  have ce : Continuous (fun u : Fin (n+1) → unitInterval => u ∘ e) :=
    continuous_pi fun j => continuous_apply (e j)
  have cs : Continuous small := trace_cont hτ ha predict (x ∘ e) (y ∘ e)
  have cp (a) : Continuous (fun u => p u a) := (continuous_marginal_apply ext a).comp (cs.comp ce)
  have cq : Continuous q := trace_cont hτ ha predict x y
  have intSmall (b) : Integrable (fun u => small u b) μ :=
    integrable_traceLaw hτ ha predict (x ∘ e) (y ∘ e) b
  have hsi (b) : Integrable (fun u => small (u ∘ e) b) ν :=
    (measurePreserving_subtuple (volume : Measure unitInterval) e
      (Fin.succAbove_right_injective (p := i))).integrable_comp_of_integrable (intSmall b)
  have massP (a) : (∫ u, p u a ∂ν) =
      marginal ext (learnedTraceMass σ predict (x ∘ e) (y ∘ e)) a := by
    dsimp only [p, marginal]
    rw [integral_finsetSum (f := fun b u => small (u ∘ e) b) _ (fun b _ => hsi b)]
    apply Finset.sum_congr rfl
    intro b _
    exact integral_subtuple (volume : Measure unitInterval) e (Fin.succAbove_right_injective (p := i)) (intSmall b)
  have H := hellingerSq_mixture_le ν p q
    (fun u => (traceLaw_isLaw σ predict (x ∘ e) (y ∘ e) _).marginal ext)
    (fun u => traceLaw_isLaw σ predict x y _)
    (fun a => (cp a).measurable) (fun a => ((continuous_apply a).comp cq).measurable)
  simp_rw [massP] at H
  exact H

end AgnosticVC
