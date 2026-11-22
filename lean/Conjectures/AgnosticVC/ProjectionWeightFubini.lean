module

public import Conjectures.AgnosticVC.Learner
public import Mathlib.MeasureTheory.Integral.Prod
import Mathlib.Tactic

@[expose] public section

namespace AgnosticVC

open MeasureTheory Set
open scoped unitInterval

/-- Collapse resampling of one independently uniform coordinate by product Fubini. -/
theorem weightIntegral_le_of_coordinate_average {k : ℕ} (i : Fin (k + 1))
    {f g : (Fin (k + 1) → unitInterval) → ℝ}
    (hf : Integrable f (weightMeasure (Fin (k + 1))))
    (hg : Integrable g (weightMeasure (Fin (k + 1))))
    (h : ∀ u, f u ≤ ∫ t : unitInterval, g (Function.update u i t)) :
    (∫ u, f u ∂weightMeasure (Fin (k + 1))) ≤ ∫ u, g u ∂weightMeasure (Fin (k + 1)) := by
  let e := MeasurableEquiv.piFinSuccAbove (fun _ : Fin (k + 1) => unitInterval) i
  let ν := weightMeasure (Fin k)
  have mp : MeasurePreserving e.symm ((volume : Measure unitInterval).prod ν)
      (weightMeasure (Fin (k + 1))) :=
    (measurePreserving_piFinSuccAbove (fun _ : Fin (k + 1) => (volume : Measure unitInterval)) i).symm e
  have hupdate (u : Fin k → unitInterval) (s t : unitInterval) :
      Function.update (e.symm (s, u)) i t = e.symm (t, u) := by
    let insert (s : unitInterval) : Fin (k + 1) → unitInterval :=
      Fin.insertNth (α := fun _ : Fin (k + 1) => unitInterval) i s u
    apply funext
    refine i.forall_iff_succAbove.mpr ⟨?_, fun j => ?_⟩
    · change Function.update (insert s) i t i = insert t i
      simp [insert]
    · change Function.update (insert s) i t (i.succAbove j) = insert t (i.succAbove j)
      simp [insert, i.succAbove_ne j]
  have hf' : Integrable (fun z => f (e.symm z)) ((volume : Measure unitInterval).prod ν) :=
    mp.integrable_comp_of_integrable hf
  have hg' : Integrable (fun z => g (e.symm z)) ((volume : Measure unitInterval).prod ν) :=
    mp.integrable_comp_of_integrable hg
  rw [← mp.integral_comp' f, ← mp.integral_comp' g, integral_prod_symm _ hf', integral_prod_symm _ hg']
  apply integral_mono_ae hf'.integral_prod_right hg'.integral_prod_right
  filter_upwards [hf'.prod_left_ae] with u hu
  have hle (s : unitInterval) : f (e.symm (s, u)) ≤ ∫ t : unitInterval, g (e.symm (t, u)) := by
    simpa only [hupdate] using h (e.symm (s, u))
  simpa only [integral_const, probReal_univ, one_smul] using
    integral_mono hu (integrable_const (∫ t : unitInterval, g (e.symm (t, u)))) hle

/-- The scaled uniform draw converts the interval integral into a uniform average. -/
theorem integral_unitInterval_scaled (f : ℝ → ℝ) :
    (∫ t : unitInterval, f (2 * (t : ℝ))) = (∫ t in (0 : ℝ)..2, f t) / 2 := by
  rw [integral_subtype measurableSet_Icc (fun x : ℝ => f (2 * x)), integral_Icc_eq_integral_Ioc,
    ← intervalIntegral.integral_of_le (show (0 : ℝ) ≤ 1 by norm_num),
    intervalIntegral.integral_comp_mul_left _ (show (2 : ℝ) ≠ 0 by norm_num)]
  norm_num [smul_eq_mul, div_eq_mul_inv, mul_comm]

end AgnosticVC
