import Mathlib.RingTheory.MvPolynomial.Symmetric.FundamentalTheorem
import Mathlib.RingTheory.MvPolynomial.WeightedHomogeneous
import Mathlib.RingTheory.MvPolynomial.Homogeneous
import Mathlib.Algebra.MvPolynomial.Eval
import Mathlib.Tactic

/-!
# Weighted-homogeneity transfer for the `e`-basis map
-/

open MvPolynomial
open scoped BigOperators

namespace LiWeighted

/-- The weights `1, 2, 3` on the three `e`-variables. -/
def wt : Fin 3 → ℕ := fun i => i.val + 1

theorem isHomogeneous_esymm (n : ℕ) :
    (esymm (Fin 3) ℚ n).IsHomogeneous n := by
  rw [esymm_eq_sum_subtype]
  apply IsHomogeneous.sum
  intro t _
  have h := IsHomogeneous.prod (s := (t : Finset (Fin 3)))
    (φ := fun i => (X i : MvPolynomial (Fin 3) ℚ)) (n := fun _ => 1)
    (by intro i _; exact isHomogeneous_X _ _)
  have ht : (t : Finset (Fin 3)).card = n := t.2
  simpa [ht] using h

/-- The `e`-basis map sends weighted-homogeneous degree `n` to homogeneous degree `n`. -/
theorem aeval_esymm_weightedHomogeneous {p : MvPolynomial (Fin 3) ℚ} {n : ℕ}
    (hp : IsWeightedHomogeneous wt p n) :
    IsHomogeneous (aeval (fun i : Fin 3 => esymm (Fin 3) ℚ (i + 1)) p) n := by
  have hsum : aeval (fun i : Fin 3 => esymm (Fin 3) ℚ (i + 1)) p
      = ∑ s ∈ p.support,
          aeval (fun i : Fin 3 => esymm (Fin 3) ℚ (i + 1)) (monomial s (p.coeff s)) := by
    conv_lhs => rw [MvPolynomial.as_sum p]
    rw [map_sum]
  rw [hsum]
  apply IsHomogeneous.sum
  intro s hs
  rw [MvPolynomial.aeval_monomial]
  have hcoeff : p.coeff s ≠ 0 := by
    simpa using hs
  have hweight : Finsupp.weight wt s = n := hp hcoeff
  have hprod : s.prod (fun i k => esymm (Fin 3) ℚ (i + 1) ^ k)
      = ∏ i : Fin 3, esymm (Fin 3) ℚ (i + 1) ^ s i := by
    rw [Finsupp.prod_of_support_subset s (Finset.subset_univ _)
      (fun i k => esymm (Fin 3) ℚ (i + 1) ^ k) (by intro i _; simp)]
  rw [hprod, ← hweight, Finsupp.weight_eq_sum]
  simp only [nsmul_eq_mul]
  apply IsHomogeneous.C_mul
  apply IsHomogeneous.prod
  intro i _
  simpa [wt, mul_comm] using (isHomogeneous_esymm (i.val + 1)).pow (s i)

end LiWeighted
