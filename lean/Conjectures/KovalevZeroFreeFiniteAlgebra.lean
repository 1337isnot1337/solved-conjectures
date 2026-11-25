import Conjectures.KovalevZeroFreeCoefficients

/-!
# Kovalev's square-root Taylor-section zero-free conjecture

The finite triangle-inequality assembly in Section 3 of the recorded proof.
Its hypotheses are discharged by the actual beta remainder in the comparison
module; this algebraic lemma alone is not the conjecture endpoint.
-/

namespace Conjectures.KovalevZeroFree

open Finset

noncomputable section

theorem weighted_correction_norm_lt (J : ℕ) (c p : ℕ → ℝ) (A : ℂ) (B : ℕ → ℂ)
    (hc : ∀ j ∈ range J, 0 ≤ c j) (hA : ‖A‖ < 1)
    (hcmp : ∀ j ∈ range J, ‖(p j : ℂ) * A - B j‖ ≤ p j - 1)
    (hW : ∑ j ∈ range J, c j * p j < 1) :
    ‖A - ∑ j ∈ range J, (c j : ℂ) * B j‖ < 1 - ∑ j ∈ range J, c j := by
  let W : ℝ := ∑ j ∈ range J, c j * p j
  have hpos : 0 < 1 - W := sub_pos.mpr hW
  have hsum : ∑ j ∈ range J, (c j : ℂ) * ((p j : ℂ) * A - B j) =
      (W : ℂ) * A - ∑ j ∈ range J, (c j : ℂ) * B j := by
    simp_rw [mul_sub, ← mul_assoc]
    rw [sum_sub_distrib, ← sum_mul]
    congr 1
    simp only [W, Complex.ofReal_sum, Complex.ofReal_mul]
  have hid : A - ∑ j ∈ range J, (c j : ℂ) * B j =
      ((1 - W : ℝ) : ℂ) * A +
        ∑ j ∈ range J, (c j : ℂ) * ((p j : ℂ) * A - B j) := by
    rw [hsum]
    push_cast
    ring
  have hfirst : ‖((1 - W : ℝ) : ℂ) * A‖ < 1 - W := by
    rw [norm_mul, Complex.norm_real, Real.norm_eq_abs, abs_of_pos hpos]
    simpa using mul_lt_mul_of_pos_left hA hpos
  have hsumBound :
      ‖∑ j ∈ range J, (c j : ℂ) * ((p j : ℂ) * A - B j)‖ ≤
        ∑ j ∈ range J, c j * (p j - 1) := by
    apply (norm_sum_le _ _).trans
    apply sum_le_sum
    intro j hj
    rw [norm_mul, Complex.norm_real, Real.norm_eq_abs, abs_of_nonneg (hc j hj)]
    exact mul_le_mul_of_nonneg_left (hcmp j hj) (hc j hj)
  rw [hid]
  calc
    _ ≤ ‖((1 - W : ℝ) : ℂ) * A‖ +
        ‖∑ j ∈ range J, (c j : ℂ) * ((p j : ℂ) * A - B j)‖ := norm_add_le _ _
    _ < (1 - W) + ∑ j ∈ range J, c j * (p j - 1) :=
      add_lt_add_of_lt_of_le hfirst hsumBound
    _ = 1 - ∑ j ∈ range J, c j := by
      simp_rw [mul_sub, mul_one]
      rw [sum_sub_distrib]
      dsimp [W]
      ring

def leadingPart (D n : ℕ) (z : ℂ) : ℂ :=
  1 - ∑ j ∈ range (n / D), (correction j : ℂ) * z ^ ((j + 1) * D)

theorem leadingPart_norm_lower (D n : ℕ) {z : ℂ} (hz : ‖z‖ ≤ 1) :
    halfCoeff (n / D) ≤ ‖leadingPart D n z‖ := by
  have hsum : ‖∑ j ∈ range (n / D), (correction j : ℂ) * z ^ ((j + 1) * D)‖ ≤
      1 - halfCoeff (n / D) := by
    calc
      _ ≤ ∑ j ∈ range (n / D), ‖(correction j : ℂ) * z ^ ((j + 1) * D)‖ :=
        norm_sum_le _ _
      _ ≤ ∑ j ∈ range (n / D), correction j := by
        apply sum_le_sum
        intro j hj
        rw [norm_mul, Complex.norm_real, Real.norm_eq_abs, abs_of_pos (correction_pos j),
          norm_pow]
        exact mul_le_of_le_one_right (correction_pos j).le
          (pow_le_one₀ (norm_nonneg z) hz)
      _ = _ := sum_correction (n / D)
  have htriangle := norm_sub_norm_le (1 : ℂ)
    (∑ j ∈ range (n / D), (correction j : ℂ) * z ^ ((j + 1) * D))
  rw [norm_one] at htriangle
  exact (by linarith : halfCoeff (n / D) ≤
    ‖1 - ∑ j ∈ range (n / D), (correction j : ℂ) * z ^ ((j + 1) * D)‖)

end

end Conjectures.KovalevZeroFree
