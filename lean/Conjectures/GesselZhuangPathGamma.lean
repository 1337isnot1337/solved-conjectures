module

public import Conjectures.GesselZhuangHistoryPolynomial
public import Conjectures.GesselZhuangGamma

/-!
# Gessel–Zhuang's pinnacle-set gamma-positivity conjecture

Every fixed internal-gap path has a nonnegative gamma expansion. Summing over
the paths with prescribed down-step labels preserves the same center. The
literal permutation interpretation remains the task of the combinatorial
bijection, rather than a hypothesis of any theorem in this file.
-/

@[expose] public section

namespace GesselZhuang

open Polynomial
open scoped BigOperators

theorem pathPolynomial_gammaPositive {n h : ℕ} (p : HeightPath n h) :
    GammaPositive n (pathPolynomial p) :=
  gammaPositive_of_splits n (pathPolynomial p) (pathPolynomial_splits p)
    (pathPolynomial_coeff_nonneg p) (pathPolynomial_natDegree_le p)
    (pathPolynomial_symmetric p)

theorem historyPolynomial_gammaPositive {n h : ℕ} (p : HeightPath n h) :
    GammaPositive n (historyPolynomial p) := by
  rw [← pathPolynomial_eq_historyPolynomial]
  exact pathPolynomial_gammaPositive p

theorem X_mul_historyPolynomial {n h : ℕ} (p : HeightPath n h) :
    X * historyPolynomial p =
      ∑ H : History p, (X : ℝ[X]) ^ (History.inverseDescents p H + 1) := by
  rw [historyPolynomial, Finset.mul_sum]
  apply Finset.sum_congr rfl
  intro H _
  rw [pow_succ]
  exact mul_comm _ _

/-- Sum over all complete height paths with the specified original down labels. -/
noncomputable def pathSetPolynomial (n : ℕ) (S : Finset ℕ) : ℝ[X] :=
  ∑ p ∈ (Finset.univ : Finset (HeightPath n 0)).filter (fun p => p.downLabels = S),
    pathPolynomial p

theorem pathSetPolynomial_gammaPositive (n : ℕ) (S : Finset ℕ) :
    GammaPositive n (pathSetPolynomial n S) :=
  GammaPositive.sum _ _ n (fun p _ => pathPolynomial_gammaPositive p)

theorem X_mul_pathSetPolynomial_gammaPositive (n : ℕ) (S : Finset ℕ) :
    GammaPositive (n + 2) (X * pathSetPolynomial n S) :=
  (pathSetPolynomial_gammaPositive n S).X_mul

/-- Sum over all complete paths with a fixed number of down steps. -/
noncomputable def pathCountPolynomial (n k : ℕ) : ℝ[X] :=
  ∑ p ∈ (Finset.univ : Finset (HeightPath n 0)).filter
      (fun p => p.downLabels.card = k), pathPolynomial p

theorem pathCountPolynomial_gammaPositive (n k : ℕ) :
    GammaPositive n (pathCountPolynomial n k) :=
  GammaPositive.sum _ _ n (fun p _ => pathPolynomial_gammaPositive p)

theorem X_mul_pathCountPolynomial_gammaPositive (n k : ℕ) :
    GammaPositive (n + 2) (X * pathCountPolynomial n k) :=
  (pathCountPolynomial_gammaPositive n k).X_mul

end GesselZhuang
