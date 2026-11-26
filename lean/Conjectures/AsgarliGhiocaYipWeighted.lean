import Mathlib.Algebra.Polynomial.AlgebraMap
import Mathlib.Algebra.Polynomial.BigOperators
import Mathlib.RingTheory.MvPolynomial.Symmetric.Defs
import Mathlib.RingTheory.MvPolynomial.WeightedHomogeneous

/-! # Weighted substitution in the formal resolvent

Injective substitution of homogeneous expressions reflects the grading, and
substitution of polynomials of bounded degree turns the weighted grade into an
ordinary univariate degree bound.
-/

namespace Conjectures.AsgarliGhiocaYip

open MvPolynomial Finset

variable {σ τ R : Type*} [CommRing R]
variable {w : σ → ℕ} {u : τ → ℕ}

private theorem isWeightedHomogeneous_aeval_monomial
    {g : σ → MvPolynomial τ R} (hg : ∀ i, (g i).IsWeightedHomogeneous u (w i))
    (m : σ →₀ ℕ) (r : R) : (aeval g (monomial m r)).IsWeightedHomogeneous u (Finsupp.weight w m) := by
  rw [aeval_monomial, MvPolynomial.algebraMap_eq, Finsupp.weight_apply, Finsupp.prod, Finsupp.sum]
  apply IsWeightedHomogeneous.C_mul
  apply IsWeightedHomogeneous.prod
  exact fun i _ ↦ (hg i).pow (m i)

private theorem component_aeval_comm {g : σ → MvPolynomial τ R}
    (hg : ∀ i, (g i).IsWeightedHomogeneous u (w i)) (n : ℕ) (P : MvPolynomial σ R) :
    weightedHomogeneousComponent u n (aeval g P) = aeval g (weightedHomogeneousComponent w n P) := by
  induction P using MvPolynomial.induction_on' with
  | add p q hp hq => simp [hp, hq]
  | monomial m r =>
    have h := isWeightedHomogeneous_aeval_monomial hg m r
    have hm := isWeightedHomogeneous_monomial (R := R) w m r rfl
    by_cases hn : n = Finsupp.weight w m
    · subst n; rw [h.weightedHomogeneousComponent_same, hm.weightedHomogeneousComponent_same]
    · rw [h.weightedHomogeneousComponent_ne n hn, hm.weightedHomogeneousComponent_ne n hn, map_zero]

theorem isWeightedHomogeneous_of_injective_aeval {g : σ → MvPolynomial τ R}
    (hg : ∀ i, (g i).IsWeightedHomogeneous u (w i)) (hi : Function.Injective (aeval (R := R) g))
    {P : MvPolynomial σ R} {n : ℕ} (hP : (aeval g P).IsWeightedHomogeneous u n) :
    P.IsWeightedHomogeneous w n := by
  have h : weightedHomogeneousComponent w n P = P := hi (by
    rw [← component_aeval_comm hg, hP.weightedHomogeneousComponent_same])
  rw [← h]
  exact weightedHomogeneousComponent_isWeightedHomogeneous n P

theorem natDegree_aeval_le_of_weightedHomogeneous {g : σ → Polynomial R}
    (hg : ∀ i, (g i).natDegree ≤ w i) {P : MvPolynomial σ R} {n : ℕ}
    (hP : P.IsWeightedHomogeneous w n) : (aeval g P).natDegree ≤ n := by
  classical
  nth_rw 1 [P.as_sum]
  rw [map_sum]
  apply Polynomial.natDegree_sum_le_of_forall_le
  intro m hm
  have hw : Finsupp.weight w m = n := hP (mem_support_iff.mp hm)
  rw [← hw, aeval_monomial, Polynomial.algebraMap_eq, Finsupp.prod, Finsupp.weight_apply, Finsupp.sum]
  apply (Polynomial.natDegree_C_mul_le _ _).trans
  apply (Polynomial.natDegree_prod_le _ _).trans
  exact sum_le_sum (fun i _ ↦ Polynomial.natDegree_pow_le_of_le _ (hg i))

/-- The elementary symmetric polynomial of a single block has the ordinary
homogeneous degree given by its index. -/
theorem isWeightedHomogeneous_block_esymm {ι : Type*} {d : ℕ} (i : ι) (n : ℕ) :
    (rename (fun j : Fin d ↦ (i, j)) (esymm (Fin d) R n)).IsWeightedHomogeneous (fun _ ↦ (1 : ℕ)) n := by
  classical
  simp only [esymm, map_sum, map_prod, rename_X]
  apply IsWeightedHomogeneous.sum
  intro t ht
  rw [← (show (∑ _j ∈ t, (1 : ℕ)) = n by simpa using (mem_powersetCard.mp ht).2)]
  apply IsWeightedHomogeneous.prod
  exact fun j _ ↦ isWeightedHomogeneous_X R _ (i, j)

end Conjectures.AsgarliGhiocaYip
