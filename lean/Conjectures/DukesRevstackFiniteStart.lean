import Conjectures.DukesRevstackEnumeration
import Conjectures.DukesRevstackNormalization

/-! The transfer theorem concerns literal revstack descent polynomials.
The first strict transition is checked exactly from the quadratic. -/

open Polynomial
open scoped BigOperators

namespace DukesRevstack

theorem literal_revstack_interlacing_step (n : ℕ) (hn : 3 ≤ n) (hDom : RemainderDominated n)
    (a : Fin (n - 1) → ℝ) (hMono : StrictMono a) (hNeg : ∀ i, a i < 0)
    (hProd : (reducedRevstack (R := ℝ) n) = ∏ i, (X - C (a i))) :
    ∃ b : Fin (n - 1 + 1) → ℝ, StrictMono b ∧ (∀ i, b i < 0) ∧
      (∀ i : Fin (n - 1), b i.castSucc < a i ∧ a i < b i.succ) ∧
      (revstackDescentPolynomial (R := ℝ) n (n - 2) : ℝ[X]) = X * ∏ i, (X - C (a i)) ∧
      (revstackDescentPolynomial (R := ℝ) (n + 1) (n + 1 - 2) : ℝ[X]) = X * ∏ i, (X - C (b i)) := by
  obtain ⟨b, hMonoB, hNegB, hInter, hFacB⟩ := reducedRevstack_interlace_step n hn hDom a hMono hNeg hProd
  refine ⟨b, hMonoB, hNegB, hInter, ?_, ?_⟩
  · rw [revstackDescentPolynomial_eq n hn, hProd]
  · rw [revstackDescentPolynomial_eq (n + 1) (by omega), hFacB]

theorem remainder_dominated_three : RemainderDominated 3 := by
  intro x hx hRoot
  have hOne : (eulerian (R := ℝ) 1 : ℝ[X]) = 1 := by simp [eulerian, eulerianOperator]
  have hTwo : (eulerian (R := ℝ) 2 : ℝ[X]) = 1 + X := by simp [eulerian_succ, eulerianOperator]
  have hLS : leftSize 3 = 1 := rfl
  have hRS : rightSize 3 + 1 = 2 := rfl
  rw [hLS, hRS, hOne, hTwo, reducedRevstack_three] at *
  norm_num [derivative_add, derivative_mul, derivative_X_pow, derivative_X] at hRoot ⊢
  have hSquare : (3 + 2 * x) ^ 2 = 5 := by nlinarith only [hRoot]
  have hAbs : 1 < |3 + 2 * x| := by
    by_contra! hn
    have hSq := (sq_le_sq₀ (abs_nonneg (3 + 2 * x)) (by norm_num : 0 ≤ (1 : ℝ))).mpr hn
    rw [sq_abs, hSquare] at hSq
    norm_num at hSq
  have hRem : |1 + x| ≤ 1 - x := abs_le.mpr ⟨by linarith, by linarith⟩
  have hT : 0 < 1 - x := by linarith
  have hBound : |1 + x| < (1 - x) * |3 + 2 * x| := by
    apply lt_of_le_of_lt hRem
    simpa only [mul_one] using mul_lt_mul_of_pos_left hAbs hT
  rw [abs_of_pos hT, mul_assoc]
  exact mul_lt_mul_of_pos_left hBound (abs_pos.mpr hx.ne)

theorem revstack_three_to_four_interlacing :
    ∃ a : Fin 2 → ℝ, ∃ b : Fin 3 → ℝ,
      StrictMono a ∧ StrictMono b ∧ (∀ i, a i < 0) ∧ (∀ i, b i < 0) ∧
      (∀ i : Fin 2, b i.castSucc < a i ∧ a i < b i.succ) ∧
      (revstackDescentPolynomial (R := ℝ) 3 1 : ℝ[X]) = X * ∏ i, (X - C (a i)) ∧
      (revstackDescentPolynomial (R := ℝ) 4 2 : ℝ[X]) = X * ∏ i, (X - C (b i)) := by
  obtain ⟨a, hMono, hNeg, hProd⟩ := reducedRevstack_three_roots
  obtain ⟨b, hMonoB, hNegB, hInter, hFacA, hFacB⟩ := literal_revstack_interlacing_step 3 (by decide)
    remainder_dominated_three a hMono hNeg hProd
  exact ⟨a, b, hMono, hMonoB, hNeg, hNegB, hInter, hFacA, hFacB⟩

end DukesRevstack
