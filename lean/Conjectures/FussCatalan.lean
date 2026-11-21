import Mathlib.Analysis.Calculus.LocalExtr.Polynomial
import Mathlib.Algebra.Polynomial.Splits
import Mathlib.Algebra.Polynomial.Reverse
import Mathlib.Tactic.NormNum

/-! Real-rooted polynomials remain real-rooted under differentiation. -/

namespace FussCatalan
open Polynomial

theorem splits_derivative (p : ℝ[X]) (hp : p.Splits) : p.derivative.Splits := by
  rw [splits_iff_card_roots] at hp ⊢
  have h1 := p.card_roots_le_derivative
  have h2 := p.derivative.card_roots'
  rw [natDegree_derivative] at h2 ⊢
  omega

theorem splits_iterate_derivative (p : ℝ[X]) (hp : p.Splits) (n : ℕ) :
    (derivative^[n] p).Splits := by
  induction n with
  | zero => simpa using hp
  | succ n ih =>
    rw [Function.iterate_succ_apply']
    exact splits_derivative _ ih

/-- Reversing coefficients preserves real-rootedness. -/
theorem splits_reverse (p : ℝ[X]) (hp : p.Splits) : p.reverse.Splits := by
  induction hp using Submonoid.closure_induction with
  | mem p hp =>
    rcases hp with hp | hp
    · obtain ⟨a, rfl⟩ := hp
      simp
    · obtain ⟨a, rfl⟩ := hp
      apply Splits.of_natDegree_le_one
      exact (reverse_natDegree_le _).trans (by simp)
  | one =>
    have he : reverse (1 : ℝ[X]) = 1 := by simpa only [map_one] using (reverse_C (1 : ℝ))
    rw [he]
    exact Splits.one
  | mul a b ha hb iha ihb =>
    rw [reverse_mul_of_domain]
    exact iha.mul ihb

/-- A coefficient reversal and translation implement a fractional-linear root transform. -/
noncomputable def rootTransform (p : ℝ[X]) : ℝ[X] := (p.reverse.comp (X+1)).reverse

theorem rootTransform_splits (p : ℝ[X]) (hp : p.Splits) : (rootTransform p).Splits := by
  apply splits_reverse
  apply Splits.comp_X_add_C
  exact splits_reverse p hp

/-- The derivatives used in the Rolle proof have only real roots. -/
theorem base_iterated_derivative_splits (d e : ℕ) :
    (derivative^[d] ((X : ℝ[X])^(d+1) * (1-X)^e)).Splits := by
  apply splits_iterate_derivative
  apply Splits.mul (Splits.X_pow _)
  apply Splits.pow _ e
  have h : (1-X : ℝ[X]) = -(X + C (-1)) := by simp; ring
  rw [h]
  exact (Splits.X_add_C (-1)).neg

/-- The fractional-linear transform of the derivative in the proof is real-rooted. -/
theorem transformed_base_splits (d e : ℕ) :
    (rootTransform (derivative^[d] ((X : ℝ[X])^(d+1) * (1-X)^e))).Splits :=
  rootTransform_splits _ (base_iterated_derivative_splits d e)

/-- The binomial polynomial appearing after removing the zero at the origin. -/
noncomputable def binomialPolynomial (d e : ℕ) : ℝ[X] :=
  ∑ j ∈ Finset.range (d+1), C (((d.choose j : ℝ) * (e.choose j : ℝ)) / (j+1)) * X^j

theorem binomialPolynomial_pos (d e : ℕ) {x : ℝ} (hx : 0 ≤ x) :
    0 < (binomialPolynomial d e).eval x := by
  have hs : 1 ≤ (binomialPolynomial d e).eval x := by
    simp only [binomialPolynomial, eval_finsetSum, eval_mul, eval_C, eval_pow, eval_X]
    calc
      (1 : ℝ) = ((d.choose 0 : ℝ) * (e.choose 0 : ℝ)) / (0+1) * x^0 := by simp
      _ ≤ ∑ j ∈ Finset.range (d+1), ((d.choose j : ℝ) * (e.choose j : ℝ)) / (j+1) * x^j := by
        have hh := Finset.single_le_sum (s := Finset.range (d+1))
          (f := fun j : ℕ => ((d.choose j : ℝ) * (e.choose j : ℝ)) / (j+1) * x^j)
          (a := 0) (by intro j hj; positivity) (by simp)
        simpa using hh
  linarith

theorem binomialPolynomial_zero (e : ℕ) : binomialPolynomial 0 e = 1 := by
  simp [binomialPolynomial]

theorem binomialPolynomial_coeff (d e j : ℕ) :
    (binomialPolynomial d e).coeff j =
      if j ≤ d then ((d.choose j : ℝ) * (e.choose j : ℝ)) / (j+1) else 0 := by
  classical
  simp [binomialPolynomial]

theorem binomialPolynomial_natDegree (d e : ℕ) (hde : d ≤ e) :
    (binomialPolynomial d e).natDegree = d := by
  apply natDegree_eq_of_le_of_coeff_ne_zero
  · apply natDegree_le_iff_coeff_eq_zero.mpr
    intro j hj
    simp [binomialPolynomial_coeff, Nat.not_le_of_gt hj]
  · rw [binomialPolynomial_coeff]
    simp only [le_refl, ↓reduceIte, Nat.choose_self, Nat.cast_one, one_mul]
    have hpos : 0 < e.choose d := Nat.choose_pos hde
    positivity

end FussCatalan
