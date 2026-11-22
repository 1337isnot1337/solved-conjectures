module

public import Conjectures.AgnosticVC.ProjectionWeightFubini
public import Conjectures.AgnosticVC.ProjectionScore
public import Conjectures.AgnosticVC.OptimizerLossDeletion
import Mathlib.Analysis.Calculus.FDeriv.Measurable
import Mathlib.Tactic

@[expose] public section

/-! The averaged score estimate controls the deletion of a single loss weight. -/

namespace AgnosticVC

open Finset MeasureTheory Set
open scoped BigOperators

variable {I H X : Type*} [Fintype I] [DecidableEq I] [Nonempty H]

omit [Fintype I] in
private theorem continuous_weight_update (i : I) :
    Continuous (fun z : (I → ℝ) × ℝ => Function.update z.1 i z.2) := by
  apply continuous_pi
  intro j
  by_cases hij : j = i
  · subst j
    simpa only [Function.update_self] using
      (continuous_snd : Continuous (fun z : (I → ℝ) × ℝ => z.2))
  · simp only [Function.update_of_ne hij]
    exact (continuous_apply j).comp continuous_fst

private theorem continuous_lossOnlyPath (σ : Schedule) (hτ : 0 < σ.temperature)
    (hc : ∀ j, 0 ≤ σ.coeff j) (predict : H → X → Bool) (x : I → X) (y : I → Bool) (i : I) :
    Continuous (fun z : (I → ℝ) × ℝ =>
      lossOnlyPath (sampleFamily predict x) σ y z.1 i z.2) := by
  simp_rw [lossOnlyPath_update]
  exact (continuous_traceLaw hτ hc predict x y).comp (continuous_weight_update i)

omit [Fintype I] in
private theorem weightDraw_update (u : I → unitInterval) (i : I) (t : unitInterval) :
    weightDraw (Function.update u i t) = Function.update (weightDraw u) i (2 * (t : ℝ)) := by
  funext j
  by_cases h : j = i
  · subst j
    simp [weightDraw]
  · simp [weightDraw, Function.update_of_ne h]

private theorem lossOnlyPath_resample (F : Finset (Finset I)) [Nonempty ↥F] (σ : Schedule)
    (y : I → Bool) (w : I → ℝ) (i : I) (t : ℝ) :
    lossOnlyPath F σ y (Function.update w i t) i = lossOnlyPath F σ y w i := by
  funext r
  rw [lossOnlyPath_update, lossOnlyPath_update, Function.update_idem]


private theorem measurable_scoreEnergy_path {A W : Type*} [Fintype A] [TopologicalSpace W]
    [MeasurableSpace W] [OpensMeasurableSpace W]
    (r : W → ℝ → A → ℝ) (p : W → A → ℝ) (t : W → ℝ)
    (hr : Continuous r.uncurry) (hp : Measurable p) (ht : Measurable t) :
    Measurable (fun w => scoreEnergy (p w) (deriv (r w) (t w))) := by
  have hm : Measurable (fun z : W × ℝ => deriv (r z.1) z.2) :=
    measurable_deriv_with_param hr
  have hpair : Measurable (fun w : W => (w, t w)) := measurable_id.prodMk ht
  have hd : Measurable (fun w => deriv (r w) (t w)) := hm.comp hpair
  unfold scoreEnergy
  apply Finset.measurable_sum
  intro a _
  exact (((measurable_pi_apply a).comp hd).pow_const 2).div ((measurable_pi_apply a).comp hp)

/-- Removing each loss while keeping the full restriction system costs at most `64*d` on
average over the independent weights. -/
theorem traceLaw_remove_loss_integral_le {n d m : ℕ} (hd : 0 < d) (hn : d ≤ n)
    (hlast : d * 4 ^ depth n d < m + 1) (hm : m + 1 ≤ 2 * n)
    (predict : H → X → Bool) (x : Fin (m + 1) → X) (y : Fin (m + 1) → Bool)
    (hdim : (sampleFamily predict x).vcDim ≤ d) :
    (∫ u, ∑ i : Fin (m + 1),
      hellingerSq (traceLaw (schedule n d) predict x y (weightDraw u))
        (traceLaw (schedule n d) predict x y (Function.update (weightDraw u) i 0))
      ∂weightMeasure (Fin (m + 1))) ≤ 64 * d := by
  let I := Fin (m + 1)
  let σ := schedule n d
  let F := sampleFamily predict x
  let W := I → unitInterval
  let μ := weightMeasure I
  let p (w : I → ℝ) := traceLaw σ predict x y w
  let r (w : I → ℝ) (i : I) := lossOnlyPath F σ y w i
  let v (w : I → ℝ) (i : I) := deriv (r w i) (w i)
  let g (i : I) (u : W) := scoreEnergy (p (weightDraw u)) (v (weightDraw u) i)
  let f (i : I) (u : W) := hellingerSq (p (weightDraw u))
    (p (Function.update (weightDraw u) i 0))
  let hτ : 0 < σ.temperature := schedule_temperature_pos hd (hd.trans_le hn)
  let hc (j : Fin σ.levels) : 0 ≤ σ.coeff j := schedule_coeff_nonneg n d j
  have hp (w : I → ℝ) : ∀ a, 0 < p w a :=
    optimizer_pos _ _ hτ (fun k => div_nonneg (hc k.1) (by positivity))
  have hp1 (w : I → ℝ) : ∑ a, p w a = 1 := (traceLaw_isLaw σ predict x y w).2
  have hu (u : W) (i : I) : weightDraw u i ∈ Icc (0 : ℝ) 2 := by
    have h := (u i).2
    change 2 * (u i : ℝ) ∈ Icc (0 : ℝ) 2
    exact ⟨by linarith [h.1], by linarith [h.2]⟩
  have hr (w : I → ℝ) (i : I) (t : ℝ) :
      r w i t = p (Function.update w i t) := lossOnlyPath_update F σ y w i t
  have hr0 (w : I → ℝ) (i : I) : r w i (w i) = p w := by
    rw [hr, Function.update_eq_self]
  have hder (w : I → ℝ) (i : I) (t : ℝ) (ht : t ∈ Icc (0 : ℝ) 2) :
      derivWithin (r w i) (Icc 0 2) t = deriv (r w i) t := by
    exact derivWithin_lossOnlyPath_eq F σ y w i ht hτ hc
  have hscore (u : W) : (∑ i, g i u) ≤ 64 * d := by
    have hs (i : I) :
        (∑ a, v (weightDraw u) i a = 0) ∧ ∃ c, ∀ a,
          entropyHessian σ.temperature (restrictionCoeff σ) (restrictTrace predict x σ)
            (p (weightDraw u)) (v (weightDraw u) i) a + mistakeIndicator y i a.1 = c := by
      have hh := lossOnlyPath_stationary F σ y (weightDraw u) i (hu u i) hτ hc
      dsimp only at hh
      rw [show derivWithin (lossOnlyPath F σ y (weightDraw u) i) (Icc 0 2) (weightDraw u i) =
          v (weightDraw u) i from hder _ _ _ (hu u i),
        show lossOnlyPath F σ y (weightDraw u) i (weightDraw u i) = p (weightDraw u) from hr0 _ _] at hh
      exact hh
    exact traceProjection_scoreEnergy_sum predict x y hd hn hdim
      (by simpa [I] using hlast) (by simpa [I] using hm) (p (weightDraw u)) (hp _) (hp1 _)
      (v (weightDraw u)) (fun i => (hs i).1) (fun i => (hs i).2)
  have cw : Continuous (weightDraw (I := I)) := by unfold weightDraw; fun_prop
  have cp : Continuous p := continuous_traceLaw hτ hc predict x y
  have hf (i : I) : Integrable (f i) μ := by
    have c0 : Continuous (fun u : W => Function.update (weightDraw u) i 0) :=
      (continuous_weight_update i).comp (cw.prodMk continuous_const)
    have cf : Continuous (f i) := by
      unfold f hellingerSq
      apply continuous_finsetSum
      intro a _
      exact ((((continuous_apply a).comp (cp.comp cw)).sqrt.sub
        ((continuous_apply a).comp (cp.comp c0)).sqrt)).pow 2
    exact cf.integrable_of_hasCompactSupport (HasCompactSupport.of_compactSpace _)
  have hg (i : I) : Integrable (g i) μ := by
    have hm (i : I) : Measurable (fun w : I → ℝ => scoreEnergy (p w) (v w i)) :=
      measurable_scoreEnergy_path (fun w t => r w i t) p (fun w => w i)
        (continuous_lossOnlyPath σ hτ hc predict x y i) cp.measurable (measurable_pi_apply i)
    have mg : Measurable (g i) := (hm i).comp (show Measurable (weightDraw : W → I → ℝ) from cw.measurable)
    apply Integrable.of_bound mg.aestronglyMeasurable (64 * d)
    filter_upwards with u
    have hnon (j : I) : 0 ≤ g j u := scoreEnergy_nonneg (fun a => (hp _ a).le) _
    rw [Real.norm_eq_abs, abs_of_nonneg (hnon i)]
    exact (single_le_sum (fun j _ => hnon j) (mem_univ i)).trans (hscore u)
  have hpoint (i : I) (u : W) :
      f i u ≤ ∫ t : unitInterval, g i (Function.update u i t) := by
    have hh := optimizer_remove_loss_le_uniform_energy F σ y (weightDraw u) i (hu u i) hτ hc
    change hellingerSq (r (weightDraw u) i (weightDraw u i)) (r (weightDraw u) i 0) ≤ _ at hh
    rw [hr0, hr] at hh
    calc
      f i u ≤ (∫ t in (0 : ℝ)..2,
          scoreEnergy (r (weightDraw u) i t) (derivWithin (r (weightDraw u) i) (Icc 0 2) t)) / 2 := hh
      _ = (∫ t in (0 : ℝ)..2,
          scoreEnergy (r (weightDraw u) i t) (deriv (r (weightDraw u) i) t)) / 2 := by
        congr 1
        apply intervalIntegral.integral_congr
        intro t ht
        change scoreEnergy (r (weightDraw u) i t) (derivWithin (r (weightDraw u) i) (Icc 0 2) t) =
          scoreEnergy (r (weightDraw u) i t) (deriv (r (weightDraw u) i) t)
        rw [hder _ _ _ (by simpa [uIcc_of_le (show (0 : ℝ) ≤ 2 by norm_num)] using ht)]
      _ = ∫ t : unitInterval,
          scoreEnergy (r (weightDraw u) i (2 * (t : ℝ))) (deriv (r (weightDraw u) i) (2 * (t : ℝ))) :=
        (integral_unitInterval_scaled _).symm
      _ = _ := by
        apply integral_congr_ae
        filter_upwards with t
        unfold g v
        rw [weightDraw_update, Function.update_self, hr]
        rw [show r (Function.update (weightDraw u) i (2 * (t : ℝ))) i = r (weightDraw u) i
          from lossOnlyPath_resample F σ y (weightDraw u) i (2 * (t : ℝ))]
  change (∫ u, ∑ i, f i u ∂μ) ≤ _
  rw [integral_finsetSum _ (fun i _ => hf i)]
  calc
    _ ≤ ∑ i, ∫ u, g i u ∂μ := sum_le_sum fun i _ =>
      weightIntegral_le_of_coordinate_average i (hf i) (hg i) (hpoint i)
    _ = ∫ u, ∑ i, g i u ∂μ := (integral_finsetSum _ (fun i _ => hg i)).symm
    _ ≤ _ := by
      simpa [μ] using integral_mono (integrable_finsetSum _ (fun i _ => hg i))
        (integrable_const (64 * (d : ℝ))) hscore

end AgnosticVC
