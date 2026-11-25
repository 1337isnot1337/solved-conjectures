import Conjectures.KovalevZeroFreeCorrection

/-!
# Kovalev's square-root Taylor-section zero-free conjecture

Finite assembly of the recorded argument's equation (4) and strict norm
comparison. The temporary remainder identity parameter is discharged by the
actual beta integral theorem in the final conjecture module.
-/

namespace Conjectures.KovalevZeroFree

open Finset

noncomputable section

theorem section_correction_identity (D n : ℕ) (z : ℂ)
    (hid : ∀ M : ℕ, Complex.sqrt (1 - z) * invSection M z =
      1 - z ^ (M + 1) * remainder M z) :
    Complex.sqrt (1 - z) * sectionPolynomial D n z =
      leadingPart D n z - z ^ (n + 1) * correctionRemainder D n z := by
  have hterm : ∀ j ∈ range (n / D),
      Complex.sqrt (1 - z) *
        ((correction j : ℂ) * z ^ ((j + 1) * D) * invSection (n - (j + 1) * D) z) =
      (correction j : ℂ) * z ^ ((j + 1) * D) -
        z ^ (n + 1) * ((correction j : ℂ) * remainder (n - (j + 1) * D) z) := by
    intro j hj
    have hk := section_shift_le hj
    have he : (j + 1) * D + (n - (j + 1) * D + 1) = n + 1 := by omega
    have hp : z ^ ((j + 1) * D) * z ^ (n - (j + 1) * D + 1) = z ^ (n + 1) := by
      rw [← pow_add, he]
    calc
      _ = ((correction j : ℂ) * z ^ ((j + 1) * D)) *
          (Complex.sqrt (1 - z) * invSection (n - (j + 1) * D) z) := by ring
      _ = ((correction j : ℂ) * z ^ ((j + 1) * D)) *
          (1 - z ^ (n - (j + 1) * D + 1) * remainder (n - (j + 1) * D) z) := by rw [hid]
      _ = (correction j : ℂ) * z ^ ((j + 1) * D) -
          (z ^ ((j + 1) * D) * z ^ (n - (j + 1) * D + 1)) *
            ((correction j : ℂ) * remainder (n - (j + 1) * D) z) := by ring
      _ = _ := by rw [hp]
  rw [sectionPolynomial, mul_sub, mul_sum, hid]
  rw [sum_congr rfl hterm, sum_sub_distrib, ← mul_sum]
  unfold leadingPart correctionRemainder
  ring

theorem sectionPolynomial_ne_zero_of_remainder_identity {D : ℕ} (hD : 0 < D)
    (n : ℕ) {z : ℂ} (hz : ‖z‖ ≤ 1)
    (hid : ∀ M : ℕ, Complex.sqrt (1 - z) * invSection M z =
      1 - z ^ (M + 1) * remainder M z) :
    sectionPolynomial D n z ≠ 0 := by
  by_cases hz1 : z = 1
  · subst z
    exact section_one_ne_zero D n
  intro hzero
  have he := section_correction_identity D n z hid
  rw [hzero, mul_zero] at he
  have hG : leadingPart D n z = z ^ (n + 1) * correctionRemainder D n z :=
    sub_eq_zero.mp he.symm
  have hlower := leadingPart_norm_lower D n hz
  have hupper : ‖leadingPart D n z‖ < halfCoeff (n / D) := by
    calc
      _ = ‖z‖ ^ (n + 1) * ‖correctionRemainder D n z‖ := by rw [hG, norm_mul, norm_pow]
      _ ≤ ‖correctionRemainder D n z‖ := mul_le_of_le_one_left (norm_nonneg _)
        (pow_le_one₀ (norm_nonneg z) hz)
      _ < _ := correctionRemainder_norm_lt hD n hz hz1
  exact (not_lt_of_ge hlower) hupper

end

end Conjectures.KovalevZeroFree
