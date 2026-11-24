import Conjectures.KovalevZeroFreeBeta

/-!
# Kovalev's square-root Taylor-section zero-free conjecture

The exact beta normalizing factor `(M+1/2) A_M` in equation (2) of the recorded
proof. This connects the concrete probability density with the finite
coefficient recurrence.
-/

namespace Conjectures.KovalevZeroFree

open ProbabilityTheory Set

noncomputable section

theorem beta_one_left {b : ℝ} (hb : 0 < b) : beta 1 b = 1 / b := by
  unfold beta
  rw [add_comm 1 b, Real.Gamma_add_one hb.ne', Real.Gamma_one, one_mul]
  have hg := (Real.Gamma_pos_of_pos hb).ne'
  field_simp

theorem beta_half_product (M : ℕ) :
    beta ((M : ℝ) + 1) (1 / 2) * (((M : ℝ) + 1 / 2) * halfCoeff M) = 1 := by
  induction M with
  | zero => norm_num [beta_one_left, halfCoeff]
  | succ M ih =>
    simp only [Nat.cast_add, Nat.cast_one]
    rw [beta_add_one_left (show 0 < (M : ℝ) + 1 by positivity)
      (show 0 < (1 / 2 : ℝ) by norm_num)]
    calc
      _ = beta ((M : ℝ) + 1) (1 / 2) * (((M : ℝ) + 1) * halfCoeff (M + 1)) := by
        have hd : (M : ℝ) + 1 + 1 / 2 ≠ 0 := by positivity
        field_simp
      _ = 1 := by rw [halfCoeff_recurrence, ih]

theorem halfCoeff_beta_normalizer (M : ℕ) :
    1 / beta ((M : ℝ) + 1) (1 / 2) = ((M : ℝ) + 1 / 2) * halfCoeff M := by
  apply (div_eq_iff (beta_pos (show 0 < (M : ℝ) + 1 by positivity)
    (show 0 < (1 / 2 : ℝ) by norm_num)).ne').mpr
  simpa only [mul_comm] using (beta_half_product M).symm

theorem halfCoeff_beta_density (M : ℕ) {t : ℝ} (ht : t ∈ Ioo (0 : ℝ) 1) :
    betaPDFReal ((M : ℝ) + 1) (1 / 2) t =
      (((M : ℝ) + 1 / 2) * halfCoeff M) * t ^ M * (1 - t) ^ (-(1 / 2 : ℝ)) := by
  simp only [betaPDFReal, ite_eq_left (show 0 < t ∧ t < 1 from ht), add_sub_cancel_right,
    Real.rpow_natCast, halfCoeff_beta_normalizer,
    show (1 / 2 : ℝ) - 1 = -(1 / 2 : ℝ) by ring]

end

end Conjectures.KovalevZeroFree
