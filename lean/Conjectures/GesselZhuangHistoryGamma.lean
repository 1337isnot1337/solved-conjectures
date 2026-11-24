module

public import Conjectures.GesselZhuangPathGamma
public import Mathlib.Data.Fintype.Sigma

/-!
# Gessel–Zhuang's pinnacle-set gamma-positivity conjecture

The path gamma expansion, written as the literal finite sum over complete
insertion histories. This form can be transported through the proved
history/permutation equivalence without assuming any enumeration formula.
-/

@[expose] public section

namespace GesselZhuang

open Polynomial
open scoped BigOperators

theorem X_mul_pathSetPolynomial_eq_history_sum (n : ℕ) (S : Finset ℕ) :
    X * pathSetPolynomial n S =
      ∑ H : (p : HeightPath n 0) × History p,
        if H.1.downLabels = S then
          (X : ℝ[X]) ^ (History.inverseDescents H.1 H.2 + 1) else 0 := by
  classical
  rw [Fintype.sum_sigma]
  simp only [pathSetPolynomial, Finset.mul_sum, Finset.sum_filter]
  apply Finset.sum_congr rfl
  intro p _
  by_cases hp : p.downLabels = S
  · simp only [hp, ite_true]
    rw [pathPolynomial_eq_historyPolynomial, X_mul_historyPolynomial]
  · simp [hp]

theorem X_mul_pathCountPolynomial_eq_history_sum (n k : ℕ) :
    X * pathCountPolynomial n k =
      ∑ H : (p : HeightPath n 0) × History p,
        if H.1.downLabels.card = k then
          (X : ℝ[X]) ^ (History.inverseDescents H.1 H.2 + 1) else 0 := by
  classical
  rw [Fintype.sum_sigma]
  simp only [pathCountPolynomial, Finset.mul_sum, Finset.sum_filter]
  apply Finset.sum_congr rfl
  intro p _
  by_cases hp : p.downLabels.card = k
  · simp only [hp, ite_true]
    rw [pathPolynomial_eq_historyPolynomial, X_mul_historyPolynomial]
  · simp [hp]

theorem history_set_sum_gammaPositive (n : ℕ) (S : Finset ℕ) :
    GammaPositive (n + 2)
      (∑ H : (p : HeightPath n 0) × History p,
        if H.1.downLabels = S then
          (X : ℝ[X]) ^ (History.inverseDescents H.1 H.2 + 1) else 0) := by
  rw [← X_mul_pathSetPolynomial_eq_history_sum]
  exact X_mul_pathSetPolynomial_gammaPositive n S

theorem history_count_sum_gammaPositive (n k : ℕ) :
    GammaPositive (n + 2)
      (∑ H : (p : HeightPath n 0) × History p,
        if H.1.downLabels.card = k then
          (X : ℝ[X]) ^ (History.inverseDescents H.1 H.2 + 1) else 0) := by
  rw [← X_mul_pathCountPolynomial_eq_history_sum]
  exact X_mul_pathCountPolynomial_gammaPositive n k

end GesselZhuang
