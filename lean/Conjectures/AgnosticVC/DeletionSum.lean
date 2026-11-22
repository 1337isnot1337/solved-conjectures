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

variable {n d m : ℕ} {X H : Type*} [Nonempty H]

theorem rawLiftedDeletion_sum_le (hd : 0 < d) (hn : d ≤ n) (hm : n ≤ m + 1)
    (hsize : ∀ j, (schedule n d).size j < m + 1) (predict : H → X → Bool)
    (hvc : HasVCDimensionAtMost predict d) (T : Fin (m+1) → X × Bool)
    (lift : ∀ i : Fin (m+1), TraceSpace predict (Prod.fst ∘ T ∘ i.succAbove) → TraceSpace predict (Prod.fst ∘ T))
    (hlift : ∀ i v, forgetTrace (sampleFamily predict (Prod.fst ∘ T)) i (lift i v) =
      deletedTraceEquiv predict (Prod.fst ∘ T) i v)
    (w : Fin (m+1) → ℝ) :
    let x := fun i => (T i).1
    let y := fun i => (T i).2
    let p := traceLaw (schedule n d) predict x y
    ∑ i, rawLiftedDeletionCharge (schedule n d) predict T i (lift i) w ≤
      576 * (d:ℝ) + 68 * ∑ i, hellingerSq (p w) (p (Function.update w i 0)) := by
  intro x y p
  let sectionRep (i : Fin (m+1)) := lift i ∘ (deletedTraceEquiv predict x i).symm
  have hs (i : Fin (m+1)) : Function.LeftInverse (forgetTrace (sampleFamily predict x) i) (sectionRep i) := by
    intro b
    exact (hlift i ((deletedTraceEquiv predict x i).symm b)).trans
      ((deletedTraceEquiv predict x i).apply_symm_apply b)
  have h := sum_hellingerSq_schedule_deleted_le hd hn hm hsize (sampleFamily predict x)
    (sampleFamily_vcDim_le hvc x) y w sectionRep hs
  dsimp only [sectionRep] at h
  simp_rw [marginal_deletedTraceOptimizer_renumber predict x _ _ y w
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

private theorem rawLiftedDeletion_integrable (hd : 0 < d) (hn : d ≤ n) (predict : H → X → Bool)
    (T : Fin (m+1) → X × Bool) (i : Fin (m+1))
    (lift : TraceSpace predict (Prod.fst ∘ T ∘ i.succAbove) → TraceSpace predict (Prod.fst ∘ T)) :
    Integrable (fun u => rawLiftedDeletionCharge (schedule n d) predict T i lift (weightDraw u))
      (weightMeasure (Fin (m+1))) := by
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

theorem lifted_deletion_sum_le_of_loss_integral (hd : 0 < d) (hn : d ≤ n) (hm : n ≤ m + 1)
    (hsize : ∀ j, (schedule n d).size j < m + 1) (predict : H → X → Bool)
    (hvc : HasVCDimensionAtMost predict d) (T : Fin (m+1) → X × Bool)
    (lift : ∀ i : Fin (m+1), TraceSpace predict (Prod.fst ∘ T ∘ i.succAbove) → TraceSpace predict (Prod.fst ∘ T))
    (hlift : ∀ i v, forgetTrace (sampleFamily predict (Prod.fst ∘ T)) i (lift i v) =
      deletedTraceEquiv predict (Prod.fst ∘ T) i v)
    (hLoss : let p := traceLaw (schedule n d) predict (fun i => (T i).1) (fun i => (T i).2)
      (∫ u, ∑ i, hellingerSq (p (weightDraw u)) (p (Function.update (weightDraw u) i 0))
        ∂weightMeasure (Fin (m+1))) ≤ 64 * d) :
    ∑ i, liftedDeletionCharge (schedule n d) predict T i (lift i) ≤ 4928 * d := by
  let σ := schedule n d
  let μ := weightMeasure (Fin (m+1))
  let p := traceLaw σ predict (fun i => (T i).1) (fun i => (T i).2)
  let g := fun u : Fin (m+1) → unitInterval => ∑ i, hellingerSq (p (weightDraw u))
    (p (Function.update (weightDraw u) i 0))
  have hτ := schedule_temperature_pos hd (hd.trans_le hn)
  have hc := schedule_coeff_nonneg n d
  have cp : Continuous p := continuous_traceLaw hτ hc predict _ _
  have cw : Continuous (weightDraw (I := Fin (m+1))) := by unfold weightDraw; fun_prop
  have cg : Continuous g := by
    apply continuous_finsetSum
    intro i _
    apply continuous_hellinger (cp.comp cw)
    apply cp.comp
    apply continuous_pi
    intro j
    by_cases h : j = i
    · subst j; simpa only [Function.update_self] using (continuous_const : Continuous (fun _ : Fin (m+1) → unitInterval => (0:ℝ)))
    · simpa only [Function.update_of_ne h, Function.comp_def] using (continuous_apply j).comp cw
  have ig : Integrable g μ := cg.integrable_of_hasCompactSupport (HasCompactSupport.of_compactSpace _)
  change (∫ u, g u ∂μ) ≤ 64 * d at hLoss
  calc
    _ ≤ ∑ i, ∫ u, rawLiftedDeletionCharge σ predict T i (lift i) (weightDraw u) ∂μ :=
      Finset.sum_le_sum fun i _ => liftedDeletionCharge_le_shared hτ hc predict T i (lift i)
    _ = ∫ u, ∑ i, rawLiftedDeletionCharge σ predict T i (lift i) (weightDraw u) ∂μ :=
      (integral_finsetSum _ (fun i _ => rawLiftedDeletion_integrable hd hn predict T i (lift i))).symm
    _ ≤ ∫ u, 576*(d:ℝ) + 68*g u ∂μ := integral_mono
      (integrable_finsetSum _ (fun i _ => rawLiftedDeletion_integrable hd hn predict T i (lift i)))
      ((integrable_const _).add (ig.const_mul 68)) (fun u => rawLiftedDeletion_sum_le hd hn hm hsize predict hvc T lift hlift _)
    _ ≤ _ := by
      rw [integral_add (f := fun _ => 576*(d:ℝ)) (g := fun u => 68*g u)
        (integrable_const _) (ig.const_mul _)]
      have hi : (∫ _ : Fin (m+1) → unitInterval, 576*(d:ℝ) ∂μ) = 576*d := by simp [μ]
      rw [hi, integral_const_mul]
      linarith

omit [Nonempty H] in
private theorem canonical_lift_forget [TraceOrder H] (predict : H → X → Bool)
    (x : Fin (m+1) → X) (i : Fin (m+1)) (v : TraceSpace predict (x ∘ i.succAbove)) :
    forgetTrace (sampleFamily predict x) i (extendTrace predict x i.succAbove v) =
      deletedTraceEquiv predict x i v := by
  simpa only [deletedTraceSection, Function.comp_apply, Equiv.symm_apply_apply] using
    deletedTraceSection_leftInverse predict x i (deletedTraceEquiv predict x i v)

theorem rawBlockDeletion_sum_le [TraceOrder H] (hd : 0 < d) (hn : d ≤ n) (hm : n ≤ m + 1)
    (hsize : ∀ j, (schedule n d).size j < m + 1) (predict : H → X → Bool)
    (hvc : HasVCDimensionAtMost predict d) (T : Fin (m+1) → X × Bool) (w : Fin (m+1) → ℝ) :
    let x := fun i => (T i).1
    let y := fun i => (T i).2
    let p := traceLaw (schedule n d) predict x y
    ∑ i, rawBlockDeletionCharge (schedule n d) predict T i w ≤
      576 * (d:ℝ) + 68 * ∑ i, hellingerSq (p w) (p (Function.update w i 0)) :=
  rawLiftedDeletion_sum_le hd hn hm hsize predict hvc T
    (fun i => extendTrace predict (Prod.fst ∘ T) i.succAbove)
    (canonical_lift_forget predict (Prod.fst ∘ T)) w

theorem deletion_sum_le_of_loss_integral [TraceOrder H] (hd : 0 < d) (hn : d ≤ n) (hm : n ≤ m + 1)
    (hsize : ∀ j, (schedule n d).size j < m + 1) (predict : H → X → Bool)
    (hvc : HasVCDimensionAtMost predict d) (T : Fin (m+1) → X × Bool)
    (hLoss : let p := traceLaw (schedule n d) predict (fun i => (T i).1) (fun i => (T i).2)
      (∫ u, ∑ i, hellingerSq (p (weightDraw u)) (p (Function.update (weightDraw u) i 0))
        ∂weightMeasure (Fin (m+1))) ≤ 64 * d) :
    ∑ i, blockDeletionCharge (schedule n d) predict T i ≤ 4928 * d :=
  lifted_deletion_sum_le_of_loss_integral hd hn hm hsize predict hvc T
    (fun i => extendTrace predict (Prod.fst ∘ T) i.succAbove)
    (canonical_lift_forget predict (Prod.fst ∘ T)) hLoss

end AgnosticVC
