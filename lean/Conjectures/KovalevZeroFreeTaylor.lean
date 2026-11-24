import Conjectures.KovalevZeroFreeTaylorAnalytic
import Conjectures.KovalevZeroFreeTaylorFinite

/-!
# Kovalev's zero-free Taylor polynomial conjecture

The exact analytic Taylor-section bridge for every positive geometric-polynomial
length and every section degree. It formalizes equation (1) of Cinna Davis's
recorded argument at commit `6432592c03b24aed190ed7b3204ed942a40a8da4`.
The conjecture is Leonid V. Kovalev's Conjecture 1.2, arXiv:2507.04544v1.
-/

namespace Conjectures.KovalevZeroFree

open Finset

noncomputable section

theorem formalCoeff_prefix_eq_section {D : ℕ} (hD : 0 < D) (n : ℕ) (z : ℂ) :
    (∑ k ∈ range (n + 1), formalCoeff D k * z ^ k) = sectionPolynomial D n z := by
  unfold formalCoeff
  rw [cauchy_prefix_eq (fun j => (halfCoeff j : ℂ)) (dilatedSqrtCoeff D) n z]
  change (∑ i ∈ range (n + 1), dilatedSqrtCoeff D i * z ^ i * invSection (n - i) z) = _
  calc
    _ = ∑ i ∈ range (n + 1),
        if D ∣ i then sqrtCoeff (i / D) * z ^ i * invSection (n - i) z else 0 := by
      apply sum_congr rfl
      intro i hi
      by_cases h : D ∣ i <;> simp [dilatedSqrtCoeff, h]
    _ = ∑ j ∈ range (n / D + 1),
        sqrtCoeff j * z ^ (j * D) * invSection (n - j * D) z := by
      rw [sum_multiples_prefix hD]
      simp [hD]
    _ = sectionPolynomial D n z := by
      rw [sum_range_succ']
      simp only [sqrtCoeff, zero_mul, pow_zero, one_mul, mul_one, Nat.sub_zero,
        neg_mul, sum_neg_distrib]
      rw [sectionPolynomial]
      ring

/-- The finite polynomial in the zero-free proof is literally the Taylor section
of the principal square root at zero; no coefficient-identification hypothesis remains. -/
theorem sectionPolynomial_eq_taylor {D : ℕ} (hD : 0 < D) (n : ℕ) (z : ℂ) :
    sectionPolynomial D n z = ∑ k ∈ range (n + 1),
      (iteratedDeriv k (fun w : ℂ => Complex.sqrt (∑ i ∈ range D, w ^ i)) 0 /
        (k.factorial : ℂ)) * z ^ k := by
  rw [← formalCoeff_prefix_eq_section hD]
  apply sum_congr rfl
  intro k hk
  rw [formalCoeff_eq_iteratedDeriv hD]
  rfl

end

end Conjectures.KovalevZeroFree
