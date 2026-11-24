import Mathlib.MeasureTheory.Function.JacobianOneDim
import Mathlib.Analysis.Calculus.Deriv.Mul
import Mathlib.Analysis.Calculus.Deriv.Inv
import Mathlib.Tactic.FieldSimp
import Mathlib.Tactic.FunProp
import Mathlib.Tactic.Linarith
import Mathlib.Tactic.Positivity
import Mathlib.Tactic.Ring

/-!
# Kovalev's square-root Taylor-section zero-free conjecture

One-dimensional changes of variables for the beta-average coupling. These
maps describe multiplication of the odds ratio by a positive scalar and its
inverse, so the actual distributional identity can be proved directly from
density integrals instead of assuming beta--gamma independence facts.
-/

namespace Conjectures.KovalevZeroFree

open Set MeasureTheory
open scoped ENNReal

noncomputable section

def mobius (v t : ℝ) : ℝ := t / (v + (1 - v) * t)

def oddsScale (v t : ℝ) : ℝ := v * t / (1 - t + v * t)

def mobiusJacobian (v t : ℝ) : ℝ := v / (v + (1 - v) * t) ^ 2

theorem mobius_den_pos {v t : ℝ} (hv : 0 < v) (ht : t ∈ Icc (0 : ℝ) 1) :
    0 < v + (1 - v) * t := by
  by_cases hlt : t < 1
  · have h := mul_pos hv (sub_pos.mpr hlt)
    nlinarith [ht.1]
  · have h : t = 1 := by linarith [ht.2]
    simp [h]

theorem oddsScale_den_pos {v t : ℝ} (hv : 0 < v) (ht : t ∈ Ioo (0 : ℝ) 1) :
    0 < 1 - t + v * t := by
  have := mul_pos hv ht.1
  linarith [ht.2]

theorem mobius_mem {v t : ℝ} (hv : 0 < v) (ht : t ∈ Ioo (0 : ℝ) 1) :
    mobius v t ∈ Ioo (0 : ℝ) 1 := by
  have hd := mobius_den_pos hv ⟨ht.1.le, ht.2.le⟩
  refine ⟨div_pos ht.1 hd, ?_⟩
  apply (div_lt_one hd).mpr
  have := mul_pos hv (sub_pos.mpr ht.2)
  nlinarith

theorem oddsScale_mem {v t : ℝ} (hv : 0 < v) (ht : t ∈ Ioo (0 : ℝ) 1) :
    oddsScale v t ∈ Ioo (0 : ℝ) 1 := by
  have hd := oddsScale_den_pos hv ht
  refine ⟨div_pos (mul_pos hv ht.1) hd, ?_⟩
  exact (div_lt_one hd).mpr (by linarith [ht.2])

theorem oddsScale_mobius {v t : ℝ} (hv : 0 < v) (ht : t ∈ Ioo (0 : ℝ) 1) :
    oddsScale v (mobius v t) = t := by
  have hd := (mobius_den_pos hv ⟨ht.1.le, ht.2.le⟩).ne'
  have ho := (oddsScale_den_pos hv (mobius_mem hv ht)).ne'
  unfold oddsScale
  apply (div_eq_iff ho).mpr
  let d := v + (1 - v) * t
  change v * (t / d) = t * (1 - t / d + v * (t / d))
  apply (mul_left_inj' hd).mp
  change v * (t / d) * d = (t * (1 - t / d + v * (t / d))) * d
  calc
    _ = v * t := by rw [mul_assoc, div_mul_cancel₀ _ hd]
    _ = t * (d - t + v * t) := by dsimp [d]; ring
    _ = t * ((1 - t / d + v * (t / d)) * d) := by
      simp only [add_mul, sub_mul, one_mul, mul_assoc]
      rw [div_mul_cancel₀ t (show d ≠ 0 from hd)]
    _ = _ := by ring

theorem mobius_oddsScale {v t : ℝ} (hv : 0 < v) (ht : t ∈ Ioo (0 : ℝ) 1) :
    mobius v (oddsScale v t) = t := by
  have hd := (oddsScale_den_pos hv ht).ne'
  unfold oddsScale mobius
  field_simp
  ring

theorem mobius_injOn {v : ℝ} (hv : 0 < v) : InjOn (mobius v) (Ioo (0 : ℝ) 1) := by
  intro x hx y hy h
  have he := congrArg (oddsScale v) h
  rwa [oddsScale_mobius hv hx, oddsScale_mobius hv hy] at he

theorem mobius_image {v : ℝ} (hv : 0 < v) :
    mobius v '' Ioo (0 : ℝ) 1 = Ioo (0 : ℝ) 1 := by
  ext x
  constructor
  · rintro ⟨t, ht, rfl⟩
    exact mobius_mem hv ht
  · intro hx
    exact ⟨oddsScale v x, oddsScale_mem hv hx, mobius_oddsScale hv hx⟩

theorem mobius_hasDeriv {v t : ℝ} (hv : 0 < v) (ht : t ∈ Ioo (0 : ℝ) 1) :
    HasDerivAt (mobius v) (mobiusJacobian v t) t := by
  have hd := (mobius_den_pos hv ⟨ht.1.le, ht.2.le⟩).ne'
  convert ((hasDerivAt_id t).div
    ((hasDerivAt_const t v).add ((hasDerivAt_id t).const_mul (1 - v))) hd) using 1
  · rfl
  · dsimp [mobiusJacobian]
    ring

theorem mobiusJacobian_pos {v t : ℝ} (hv : 0 < v) (ht : t ∈ Ioo (0 : ℝ) 1) :
    0 < mobiusJacobian v t := by
  unfold mobiusJacobian
  exact div_pos hv (sq_pos_of_pos (mobius_den_pos hv ⟨ht.1.le, ht.2.le⟩))

@[fun_prop] theorem measurable_mobius : Measurable (fun p : ℝ × ℝ => mobius p.1 p.2) := by
  unfold mobius
  fun_prop

@[fun_prop] theorem measurable_oddsScale : Measurable (fun p : ℝ × ℝ => oddsScale p.1 p.2) := by
  unfold oddsScale
  fun_prop

@[fun_prop] theorem measurable_mobiusJacobian :
    Measurable (fun p : ℝ × ℝ => mobiusJacobian p.1 p.2) := by
  unfold mobiusJacobian
  fun_prop

theorem lintegral_mobius_substitution {v : ℝ} (hv : 0 < v) (g : ℝ → ℝ≥0∞) :
    ∫⁻ t in Ioo (0 : ℝ) 1, ENNReal.ofReal (mobiusJacobian v t) * g (mobius v t) =
      ∫⁻ t in Ioo (0 : ℝ) 1, g t := by
  have he := lintegral_image_eq_lintegral_abs_deriv_mul measurableSet_Ioo
    (fun t ht => (mobius_hasDeriv hv ht).hasDerivWithinAt) (mobius_injOn hv) g
  rw [mobius_image hv] at he
  rw [he]
  apply setLIntegral_congr_fun measurableSet_Ioo
  intro t ht
  dsimp only
  rw [abs_of_pos (mobiusJacobian_pos hv ht)]

end

end Conjectures.KovalevZeroFree
