module

public import Conjectures.AgnosticVC.DeletionCoupling
public import Conjectures.AgnosticVC.VCRenumber
public import Conjectures.AgnosticVC.OptimizerDeletionBudget
public import Mathlib.MeasureTheory.Function.LocallyIntegrable

/-! Summing the realized deletion comparison on the actual full-block alphabet. -/

@[expose] public section

open MeasureTheory
open scoped BigOperators

namespace AgnosticVC

variable {n d : ℕ} {X H : Type*} [Nonempty H]

theorem rawBlockDeletion_sum_le (hd : 0 < d) (hn : d ≤ n) (predict : H → X → Bool)
    (hvc : HasVCDimensionAtMost predict d) (T : Fin (n+1) → X × Bool) (w : Fin (n+1) → ℝ) :
    let x := fun i => (T i).1
    let y := fun i => (T i).2
    let p := traceLaw (schedule n d) predict x y
    ∑ i, rawBlockDeletionCharge (schedule n d) predict T i w ≤
      576 * (d:ℝ) + 68 * ∑ i, hellingerSq (p w) (p (Function.update w i 0)) := by
  intro x y p
  have h := sum_hellingerSq_schedule_deleted_le hd hn (sampleFamily predict x)
    (sampleFamily_vcDim_le hvc x) y w (deletedTraceSection predict x) (deletedTraceSection_leftInverse predict x)
  dsimp only at h
  simp_rw [marginal_deletedTraceSection_optimizer_eq predict x _ _ y w
    (schedule_temperature_pos hd (hd.trans_le hn)) (schedule_coeff_nonneg n d)] at h
  apply le_trans _ h
  apply le_of_eq
  apply Finset.sum_congr rfl
  intro i _
  apply hellingerSq_comm

private theorem continuous_hellinger {A W : Type*} [Fintype A] [TopologicalSpace W]
    {p q : W → A → ℝ} (hp : Continuous p) (hq : Continuous q) :
    Continuous (fun u => hellingerSq (p u) (q u)) := by
  unfold hellingerSq
  exact continuous_finsetSum _ fun a _ =>
    ((Real.continuous_sqrt.comp ((continuous_apply a).comp hp)).sub
      (Real.continuous_sqrt.comp ((continuous_apply a).comp hq))).pow 2

private theorem rawDeletion_integrable (hd : 0 < d) (hn : d ≤ n) (predict : H → X → Bool)
    (T : Fin (n+1) → X × Bool) (i : Fin (n+1)) :
    Integrable (fun u => rawBlockDeletionCharge (schedule n d) predict T i (weightDraw u))
      (weightMeasure (Fin (n+1))) := by
  apply Continuous.integrable_of_hasCompactSupport _ (HasCompactSupport.of_compactSpace _)
  apply continuous_hellinger
  · apply continuous_pi
    intro a
    apply (continuous_marginal_apply _ _).comp
    apply (continuous_traceLaw (schedule_temperature_pos hd (hd.trans_le hn)) (schedule_coeff_nonneg n d)
      predict _ _).comp
    exact continuous_pi fun j => continuous_const.mul (continuous_subtype_val.comp (continuous_apply (i.succAbove j)))
  · apply (continuous_traceLaw (schedule_temperature_pos hd (hd.trans_le hn))
      (schedule_coeff_nonneg n d) predict _ _).comp
    unfold weightDraw
    fun_prop

theorem deletion_sum_le_of_loss_integral (hd : 0 < d) (hn : d ≤ n) (predict : H → X → Bool)
    (hvc : HasVCDimensionAtMost predict d) (T : Fin (n+1) → X × Bool)
    (hLoss : let p := traceLaw (schedule n d) predict (fun i => (T i).1) (fun i => (T i).2)
      (∫ u, ∑ i, hellingerSq (p (weightDraw u)) (p (Function.update (weightDraw u) i 0))
        ∂weightMeasure (Fin (n+1))) ≤ 64 * d) :
    ∑ i, blockDeletionCharge (schedule n d) predict T i ≤ 4928 * d := by
  let σ := schedule n d
  let μ := weightMeasure (Fin (n+1))
  let p := traceLaw σ predict (fun i => (T i).1) (fun i => (T i).2)
  let g := fun u : Fin (n+1) → unitInterval => ∑ i, hellingerSq (p (weightDraw u))
    (p (Function.update (weightDraw u) i 0))
  have hτ := schedule_temperature_pos hd (hd.trans_le hn)
  have hc := schedule_coeff_nonneg n d
  have cp : Continuous p := continuous_traceLaw hτ hc predict _ _
  have cw : Continuous (weightDraw (I := Fin (n+1))) := by unfold weightDraw; fun_prop
  have cg : Continuous g := by
    apply continuous_finsetSum
    intro i _
    apply continuous_hellinger (cp.comp cw)
    apply cp.comp
    apply continuous_pi
    intro j
    by_cases h : j = i
    · subst j; simpa only [Function.update_self] using (continuous_const : Continuous (fun _ : Fin (n+1) → unitInterval => (0:ℝ)))
    · simpa only [Function.update_of_ne h, Function.comp_def] using (continuous_apply j).comp cw
  have ig : Integrable g μ := cg.integrable_of_hasCompactSupport (HasCompactSupport.of_compactSpace _)
  change (∫ u, g u ∂μ) ≤ 64 * d at hLoss
  calc
    _ ≤ ∑ i, ∫ u, rawBlockDeletionCharge σ predict T i (weightDraw u) ∂μ :=
      Finset.sum_le_sum fun i _ => blockDeletionCharge_le_shared hτ hc predict T i
    _ = ∫ u, ∑ i, rawBlockDeletionCharge σ predict T i (weightDraw u) ∂μ :=
      (integral_finsetSum _ (fun i _ => rawDeletion_integrable hd hn predict T i)).symm
    _ ≤ ∫ u, 576*(d:ℝ) + 68*g u ∂μ := integral_mono
      (integrable_finsetSum _ (fun i _ => rawDeletion_integrable hd hn predict T i))
      ((integrable_const _).add (ig.const_mul 68)) (fun u => rawBlockDeletion_sum_le hd hn predict hvc T _)
    _ ≤ _ := by
      rw [integral_add (f := fun _ => 576*(d:ℝ)) (g := fun u => 68*g u)
        (integrable_const _) (ig.const_mul _)]
      have hi : (∫ _ : Fin (n+1) → unitInterval, 576*(d:ℝ) ∂μ) = 576*d := by simp [μ]
      rw [hi, integral_const_mul]
      linarith

end AgnosticVC
