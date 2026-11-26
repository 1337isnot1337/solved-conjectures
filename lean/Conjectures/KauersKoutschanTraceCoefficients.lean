import Conjectures.KauersKoutschanPolynomialMoments
import Conjectures.KauersKoutschanTraceProducts
import Conjectures.KauersKoutschanColumnSeries

/-! Expand the diagonal character and apply the exact moment to two traces. -/

open scoped BigOperators

namespace KauersKoutschan

open Polynomial

private def geometricTraceSum {R : Type*} [CommRing R] (a b : R) (n : ℕ) : R :=
  ∑ k ∈ Finset.range (n + 1), a ^ k * b ^ (n - k)

private theorem geometricTraceSum_succ {R : Type*} [CommRing R] (a b : R) (n : ℕ) :
    geometricTraceSum a b (n + 1) = b * geometricTraceSum a b n + a ^ (n + 1) := by
  rw [geometricTraceSum, Finset.sum_range_succ, Nat.sub_self, pow_zero, mul_one,
    geometricTraceSum, Finset.mul_sum]
  congr 1
  apply Finset.sum_congr rfl
  intro k hk
  have h := Finset.mem_range.mp hk
  rw [show n + 1 - k = n - k + 1 by omega, pow_succ]
  ring

/-- On the two actual diagonal entries, the trace character has coefficient one
at each monomial of the indicated total degree. -/
theorem traceComplete_eval_geometric {R : Type*} [CommRing R] (a b : R) (n : ℕ) :
    (traceComplete (a * b) n).eval (a + b) =
      ∑ k ∈ Finset.range (n + 1), a ^ k * b ^ (n - k) := by
  change (traceComplete (a * b) n).eval (a + b) = geometricTraceSum a b n
  induction n using Nat.twoStepInduction with
  | zero => simp [traceComplete, geometricTraceSum]
  | one => simp [traceComplete, geometricTraceSum, Finset.sum_range_succ]; ring
  | more n h₀ h₁ =>
    rw [traceComplete, eval_sub, eval_mul, eval_mul, eval_C, eval_X, h₀, h₁]
    calc
      _ = b * geometricTraceSum a b (n + 1) + a ^ (n + 2) := by
        have h := geometricTraceSum_succ a b n
        rw [pow_succ a (n + 1)]
        linear_combination a * h
      _ = _ := (geometricTraceSum_succ a b (n + 1)).symm

theorem eval_traceComplete_product {R : Type*} [CommRing R] (d t : R) (p q : ℕ) :
    (traceComplete d p).eval t * (traceComplete d q).eval t =
      ∑ j ∈ Finset.range (min p q + 1), d ^ j * (traceComplete d (p + q - 2 * j)).eval t := by
  have h := congrArg (evalRingHom t) (traceComplete_product d p q)
  have hc : evalRingHom t (C d) = d := eval_C
  simp only [map_mul, map_pow, map_sum, hc] at h
  exact h

noncomputable abbrev rowMarkedWeights := MvPolynomial (Fin 2) TwoVariablePolynomial

noncomputable abbrev markedColumns : PowerSeries rowMarkedWeights :=
  signedColumnSeries (MvPolynomial.C (rowMarker 0)) (MvPolynomial.C (rowMarker 1))
    (MvPolynomial.X 0) (MvPolynomial.X 1)

private noncomputable abbrev markedDeterminant : rowMarkedWeights :=
  MvPolynomial.C (rowMarker 0 * rowMarker 1) *
    (1 - MvPolynomial.X 0 - MvPolynomial.X 1)

private noncomputable abbrev markedTrace : rowMarkedWeights :=
  MvPolynomial.C (rowMarker 0) * (MvPolynomial.X 0 - 1) +
    MvPolynomial.C (rowMarker 1) * (MvPolynomial.X 1 - 1)

noncomputable abbrev markedHomogeneous (n : ℕ) : rowMarkedWeights :=
  (traceComplete markedDeterminant n).eval markedTrace

theorem factorialMomentPair_marked_trace_product (p q : ℕ) :
    factorialMomentPair (markedHomogeneous p * markedHomogeneous q) =
      ∑ j ∈ Finset.range (min p q + 1),
        (rowMarker 0 * rowMarker 1) ^ j *
          (traceComplete (rowMarker 0 * rowMarker 1) (p + q - 2 * j)).eval (rowMarker 0 + rowMarker 1) *
          MvPolynomial.C (dividedDifference (j + ((p + q - 2 * j) + 1)) j : ℝ) := by
  have h := eval_traceComplete_product markedDeterminant markedTrace p q
  change markedHomogeneous p * markedHomogeneous q =
    ∑ j ∈ Finset.range (min p q + 1),
      genericSchurCharacter (rowMarker 0) (rowMarker 1) j (p + q - 2 * j) at h
  rw [h, map_sum]
  apply Finset.sum_congr rfl
  intro j _
  exact polynomial_factorial_schur_moment j (p + q - 2 * j)

end KauersKoutschan
