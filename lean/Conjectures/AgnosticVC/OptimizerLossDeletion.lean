module

public import Conjectures.AgnosticVC.OptimizerEnergy
public import Conjectures.AgnosticVC.Learner
public import Conjectures.AgnosticVC.OptimizerSubsetSwap

@[expose] public section

open scoped BigOperators Topology
open MeasureTheory Set

namespace AgnosticVC

variable {I : Type*} [Fintype I] [DecidableEq I]

/-- The contribution of one unit of weight at a position. -/
def mistakeIndicator (y : I → Bool) (i : I) (v : Finset I) : ℝ :=
  if decide (i ∈ v) = y i then 0 else 1

theorem mistakeCount_update_affine (y : I → Bool) (w : I → ℝ) (i : I) (u : ℝ) (v : Finset I) :
    mistakeCount y (Function.update w i u) v =
      mistakeCount y (Function.update w i 0) v + u * mistakeIndicator y i v := by
  have h (t : ℝ) : mistakeCount y (Function.update w i t) v =
      (∑ j ∈ Finset.univ.erase i, if decide (j ∈ v) = y j then 0 else w j) +
        (if decide (i ∈ v) = y i then 0 else t) := by
    unfold mistakeCount
    rw [← Finset.sum_erase_add _ _ (Finset.mem_univ i), Function.update_self]
    congr 1
    refine Finset.sum_congr rfl fun j hj => ?_
    rw [Function.update_of_ne (Finset.mem_erase.mp hj).1]
  rw [h u, h 0]
  by_cases he : decide (i ∈ v) = y i <;> simp [mistakeIndicator, he]

/-- The full-support optimizer as the weight of a single example varies. -/
noncomputable def lossOnlyPath (F : Finset (Finset I)) [Nonempty ↥F] (σ : Schedule)
    (y : I → Bool) (w : I → ℝ) (i : I) (t : ℝ) : ↥F → ℝ :=
  optimizer (fun v => mistakeCount y (Function.update w i 0) v.val + t * mistakeIndicator y i v.val)
    σ.temperature (restrictionCoeff σ) (fun k => restrictionOn F k.2.val)

theorem lossOnlyPath_update (F : Finset (Finset I)) [Nonempty ↥F] (σ : Schedule)
    (y : I → Bool) (w : I → ℝ) (i : I) (t : ℝ) :
    lossOnlyPath F σ y w i t = optimizer (fun v => mistakeCount y (Function.update w i t) v.val)
      σ.temperature (restrictionCoeff σ) (fun k => restrictionOn F k.2.val) := by
  unfold lossOnlyPath
  simp_rw [mistakeCount_update_affine y w i t]

/-- The first deletion step, averaged over a fresh uniform value of the replaced weight. -/
theorem optimizer_remove_loss_le_uniform_energy (F : Finset (Finset I)) [Nonempty ↥F]
    (σ : Schedule) (y : I → Bool) (w : I → ℝ) (i : I)
    (hw : w i ∈ Icc 0 2) (hτ : 0 < σ.temperature) (hc : ∀ j, 0 ≤ σ.coeff j) :
    let r := lossOnlyPath F σ y w i
    hellingerSq (r (w i)) (r 0) ≤
      (∫ t in (0 : ℝ)..2, scoreEnergy (r t) (derivWithin r (Icc 0 2) t)) / 2 :=
  optimizer_remove_weight_le_uniform_energy _ _ _ _ _ hw hτ
    (fun k => div_nonneg (hc k.1) (by positivity))

/-- The tangent optimality equation for the loss-only deletion path. -/
theorem lossOnlyPath_stationary (F : Finset (Finset I)) [Nonempty ↥F]
    (σ : Schedule) (y : I → Bool) (w : I → ℝ) (i : I) {t : ℝ}
    (ht : t ∈ Icc 0 2) (hτ : 0 < σ.temperature) (hc : ∀ j, 0 ≤ σ.coeff j) :
    let r := lossOnlyPath F σ y w i
    let v := derivWithin r (Icc 0 2) t
    (∑ a, v a = 0) ∧ ∃ c, ∀ a,
      entropyHessian σ.temperature (restrictionCoeff σ) (fun k => restrictionOn F k.2.val)
        (r t) v a + mistakeIndicator y i a.val = c := by
  have hlt : (0 : ℝ) < 2 := by norm_num
  have hh := optimizer_path_stationary (fun a : ↥F => mistakeCount y (Function.update w i 0) a.val)
    (fun a => mistakeIndicator y i a.val) σ.temperature (restrictionCoeff σ) 0
    (fun k => restrictionOn F k.2.val) hlt ht hτ (fun u _ k => by
      simpa only [Pi.zero_apply, mul_zero, add_zero] using
        (show 0 ≤ restrictionCoeff σ k from div_nonneg (hc k.1) (by positivity)))
  unfold lossOnlyPath
  simpa only [Pi.zero_apply, mul_zero, add_zero, gradientForcing, zero_mul,
    Finset.sum_const_zero] using hh

/-- A loss-only path is continuously differentiable on the whole real line. -/
theorem contDiff_lossOnlyPath (F : Finset (Finset I)) [Nonempty ↥F] (σ : Schedule)
    (y : I → Bool) (w : I → ℝ) (i : I) (hτ : 0 < σ.temperature) (hc : ∀ j, 0 ≤ σ.coeff j) :
    ContDiff ℝ 1 (lossOnlyPath F σ y w i) := by
  rw [← contDiffOn_univ]
  unfold lossOnlyPath
  simpa only [Pi.zero_apply, mul_zero, add_zero] using optimizer_contDiffOn
    (fun a : ↥F => mistakeCount y (Function.update w i 0) a.val)
    (fun a => mistakeIndicator y i a.val) σ.temperature (restrictionCoeff σ) 0
    (fun k => restrictionOn F k.2.val) (s := Set.univ) hτ (fun u _ k => by
      simpa only [Pi.zero_apply, mul_zero, add_zero] using
        (show 0 ≤ restrictionCoeff σ k from div_nonneg (hc k.1) (by positivity)))

theorem differentiable_lossOnlyPath (F : Finset (Finset I)) [Nonempty ↥F] (σ : Schedule)
    (y : I → Bool) (w : I → ℝ) (i : I) (hτ : 0 < σ.temperature) (hc : ∀ j, 0 ≤ σ.coeff j) :
    Differentiable ℝ (lossOnlyPath F σ y w i) :=
  (contDiff_lossOnlyPath F σ y w i hτ hc).differentiable (by norm_num)

theorem derivWithin_lossOnlyPath_eq (F : Finset (Finset I)) [Nonempty ↥F] (σ : Schedule)
    (y : I → Bool) (w : I → ℝ) (i : I) {t : ℝ} (ht : t ∈ Icc 0 2)
    (hτ : 0 < σ.temperature) (hc : ∀ j, 0 ≤ σ.coeff j) :
    derivWithin (lossOnlyPath F σ y w i) (Icc 0 2) t = deriv (lossOnlyPath F σ y w i) t :=
  (differentiable_lossOnlyPath F σ y w i hτ hc t).derivWithin
    (uniqueDiffOn_Icc (by norm_num : (0 : ℝ) < 2) t ht)

end AgnosticVC
