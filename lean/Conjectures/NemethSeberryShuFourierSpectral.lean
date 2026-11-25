import Conjectures.NemethSeberryShuFourierSampling
import Conjectures.NemethSeberryShuCongruence

/-! Exact Fourier eigenvectors and Parseval identity for the actual binary
circulant matrix. -/

open Finset
open scoped ComplexConjugate Matrix

namespace NemethSeberryShu

noncomputable section

variable {p : ℕ} [NeZero p]

/-- Orthogonality of the columns of the finite Fourier matrix. -/
theorem character_orthogonality (i j : ZMod p) :
    (∑ l : ZMod p, ZMod.stdAddChar (l * i) * conj (ZMod.stdAddChar (l * j))) =
      if i = j then (p : ℂ) else 0 := by
  simp_rw [← standardCharacter_neg, ← AddChar.map_add_eq_mul, ← sub_eq_add_neg, ← mul_sub]
  simp_rw [mul_comm _ (i - j)]
  rw [standardCharacter_sum]
  simp [sub_eq_zero]

/-- Parseval for the unnormalized Fourier coefficients of a binary support. -/
theorem supportFourier_parseval (S : Finset (ZMod p)) :
    (∑ l : ZMod p, ‖supportFourier S l‖ ^ 2) = (p : ℝ) * S.card := by
  have hc (l : ZMod p) :
      (‖supportFourier S l‖ ^ 2 : ℂ) =
        ∑ i ∈ S, ∑ j ∈ S, ZMod.stdAddChar (l * i) * conj (ZMod.stdAddChar (l * j)) := by
    have h : supportFourier S l * conj (supportFourier S l) =
        (‖supportFourier S l‖ ^ 2 : ℂ) := by
      exact RCLike.mul_conj _
    rw [← h, supportFourier, map_sum, Finset.sum_mul_sum]
  apply Complex.ofReal_injective
  push_cast
  simp_rw [hc]
  rw [sum_comm]
  calc
    _ = ∑ i ∈ S, ∑ j ∈ S, ∑ l : ZMod p,
        ZMod.stdAddChar (l * i) * conj (ZMod.stdAddChar (l * j)) := by
      apply sum_congr rfl
      intro i _
      rw [sum_comm]
    _ = (p : ℂ) * S.card := by
      simp_rw [character_orthogonality]
      simp [nsmul_eq_mul, mul_comm]

/-- The actual binary circulant over the complex numbers has the standard
Fourier eigenvectors, with the source's support Fourier coefficients. -/
theorem binaryCirculant_mulVec_character (S : Finset (ZMod p)) (l : ZMod p) :
    ((binaryCirculant S).map (Nat.cast : ℕ → ℂ)).mulVec
      (fun i => ZMod.stdAddChar (l * i)) =
        supportFourier S l • (fun i => ZMod.stdAddChar (l * i)) := by
  funext i
  simp only [Matrix.mulVec_apply, dotProduct, Matrix.row, Matrix.map_apply, binaryCirculant,
    Nat.cast_ite, Nat.cast_one, Nat.cast_zero, Pi.smul_apply, smul_eq_mul]
  let f (j : ZMod p) :=
    (if j - i ∈ S then (1 : ℂ) else 0) * ZMod.stdAddChar (l * j)
  have hshift : (∑ j : ZMod p, f j) = ∑ j : ZMod p, f (j + i) :=
    (Equiv.sum_comp (Equiv.addRight i) f).symm
  change (∑ j : ZMod p, f j) = _
  rw [hshift]
  have hterm (j : ZMod p) : f (j + i) =
      if j ∈ S then ZMod.stdAddChar (l * j) * ZMod.stdAddChar (l * i) else 0 := by
    dsimp [f]
    rw [add_sub_cancel_right, mul_add, AddChar.map_add_eq_mul]
    split_ifs <;> simp
  simp_rw [hterm]
  have hfilter : (univ.filter fun j : ZMod p => j ∈ S) = S := by
    ext j
    simp
  rw [← sum_filter, hfilter, ← sum_mul]
  rfl

end

end NemethSeberryShu
