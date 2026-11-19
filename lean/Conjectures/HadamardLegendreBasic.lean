import Conjectures.HadamardBorderNormalizationTransportOps
import Mathlib.Algebra.BigOperators.Fin
import Mathlib.Tactic.FinCases
import Mathlib.Tactic.IntervalCases
import Mathlib.Tactic.Linarith
import Mathlib.Tactic.Ring

/-!
# Actual Legendre pairs and their row sums

The two rows are integer-valued functions on a finite abelian group. The
Legendre-pair premise consists exactly of sign-valuedness and combined
periodic autocorrelation -2 at every nonzero shift.
-/

namespace HadamardLegendre

open scoped BigOperators
open HadamardBorderNormalizationTransport

abbrev Rows2 (G : Type*) := Fin 2 → G → ℤ

variable {G : Type*}

def rowSum [Fintype G] (f : G → ℤ) : ℤ := ∑ x, f x

section Correlation

variable [Fintype G] [AddCommGroup G]

def pairCorrelation (f : Rows2 G) (u : G) : ℤ :=
  ∑ i, correlation (f i) u

def IsLegendrePair (f : Rows2 G) : Prop :=
  (∀ i, SignValued (f i)) ∧ ∀ u, u ≠ 0 → pairCorrelation f u = -2

theorem pairCorrelation_zero (f : Rows2 G)
    (hf : ∀ i, SignValued (f i)) :
    pairCorrelation f 0 = 2 * (Fintype.card G : ℤ) := by
  have hrow (i : Fin 2) : correlation (f i) 0 = (Fintype.card G : ℤ) := by
    unfold correlation
    calc
      (∑ x, f i x * f i (x + 0)) = ∑ _x : G, (1 : ℤ) := by
        apply Finset.sum_congr rfl
        intro x hx
        rcases hf i x with h | h <;> simp [h]
      _ = (Fintype.card G : ℤ) := by simp
  simp [pairCorrelation, hrow]

theorem sum_correlation_eq_rowSum_sq (f : G → ℤ) :
    (∑ u, correlation f u) = rowSum f ^ 2 := by
  unfold correlation
  rw [Finset.sum_comm]
  calc
    (∑ x, ∑ u, f x * f (x + u)) =
        ∑ x, f x * ∑ y, f y := by
      apply Finset.sum_congr rfl
      intro x hx
      rw [← Finset.mul_sum]
      congr 1
      exact Equiv.sum_comp (Equiv.addLeft x) f
    _ = rowSum f ^ 2 := by
      rw [← Finset.sum_mul]
      simp only [rowSum, pow_two]

theorem sum_pairCorrelation_eq_rowSum_squares (f : Rows2 G) :
    (∑ u, pairCorrelation f u) = ∑ i, rowSum (f i) ^ 2 := by
  unfold pairCorrelation
  rw [Finset.sum_comm]
  simp only [sum_correlation_eq_rowSum_sq]

theorem sum_pairCorrelation_of_legendre (f : Rows2 G)
    (hf : IsLegendrePair f) : (∑ u, pairCorrelation f u) = 2 := by
  classical
  have hshape (u : G) :
      pairCorrelation f u =
        (if u = 0 then 2 * ((Fintype.card G : ℤ) + 1) else 0) - 2 := by
    by_cases hu : u = 0
    · simp [hu, pairCorrelation_zero f hf.1]
      ring
    · rw [hf.2 u hu, ite_eq_right hu]
      norm_num
  calc
    (∑ u, pairCorrelation f u) =
        ∑ u : G, ((if u = 0 then
          2 * ((Fintype.card G : ℤ) + 1) else 0) - 2) :=
      Finset.sum_congr rfl fun u _ => hshape u
    _ = 2 := by
      simp [Finset.sum_sub_distrib]
      ring

private theorem signs_of_two_squares (x y : ℤ) (h : x ^ 2 + y ^ 2 = 2) :
    (x = 1 ∨ x = -1) ∧ (y = 1 ∨ y = -1) := by
  have hxlo : -1 ≤ x := by nlinarith [sq_nonneg y]
  have hxhi : x ≤ 1 := by nlinarith [sq_nonneg y]
  have hylo : -1 ≤ y := by nlinarith [sq_nonneg x]
  have hyhi : y ≤ 1 := by nlinarith [sq_nonneg x]
  interval_cases x <;> interval_cases y <;> norm_num at *

theorem rowSum_sign_of_legendre (f : Rows2 G) (hf : IsLegendrePair f) :
    ∀ i, rowSum (f i) = 1 ∨ rowSum (f i) = -1 := by
  have hsum : (∑ i, rowSum (f i) ^ 2) = 2 := by
    rw [← sum_pairCorrelation_eq_rowSum_squares, sum_pairCorrelation_of_legendre f hf]
  have htwo : rowSum (f 0) ^ 2 + rowSum (f 1) ^ 2 = 2 := by
    simpa only [Fin.sum_univ_two] using hsum
  have hsigns := signs_of_two_squares _ _ htwo
  intro i
  fin_cases i
  · exact hsigns.1
  · exact hsigns.2

def normalizeSigns (f : Rows2 G) : Rows2 G :=
  fun i x => rowSum (f i) * f i x

theorem normalizeSigns_rowSum (f : Rows2 G) (hf : IsLegendrePair f) (i : Fin 2) :
    rowSum (normalizeSigns f i) = 1 := by
  change (∑ x, rowSum (f i) * f i x) = 1
  rw [← Finset.mul_sum]
  change rowSum (f i) * rowSum (f i) = 1
  rcases rowSum_sign_of_legendre f hf i with h | h <;> simp [h]

theorem normalizeSigns_pairCorrelation (f : Rows2 G) (hf : IsLegendrePair f) (u : G) :
    pairCorrelation (normalizeSigns f) u = pairCorrelation f u := by
  apply Finset.sum_congr rfl
  intro i hi
  exact correlation_mul_sign (f i) (rowSum (f i)) (rowSum_sign_of_legendre f hf i) u

theorem normalizeSigns_isLegendrePair (f : Rows2 G) (hf : IsLegendrePair f) :
    IsLegendrePair (normalizeSigns f) := by
  constructor
  · intro i x
    rcases rowSum_sign_of_legendre f hf i with hs | hs <;>
      rcases hf.1 i x with hx | hx <;> simp [normalizeSigns, hs, hx]
  · intro u hu
    rw [normalizeSigns_pairCorrelation f hf u]
    exact hf.2 u hu

end Correlation

end HadamardLegendre
