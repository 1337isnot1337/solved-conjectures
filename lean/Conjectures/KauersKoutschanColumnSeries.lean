import Conjectures.KauersKoutschanWeightedCompositions
import Conjectures.KauersKoutschanTracePolynomials
import Mathlib.RingTheory.PowerSeries.Basic

/-! The formal column generating series of the signed block compositions. -/

open scoped BigOperators

namespace KauersKoutschan

open PowerSeries Finset

variable {R : Type*} [CommRing R]

noncomputable def compositionSeries (w : ℕ → R) : R⟦X⟧ := mk (weightedCompositionSum w)

private noncomputable def firstWeightSeries (w : ℕ → R) : R⟦X⟧ :=
  mk (fun n => if n = 0 then 0 else w n)

theorem compositionSeries_first_weight (w : ℕ → R) :
    compositionSeries w = 1 + firstWeightSeries w * compositionSeries w := by
  apply PowerSeries.ext
  intro n
  cases n with
  | zero => simp [compositionSeries, firstWeightSeries, weightedCompositionSum_zero]
  | succ n =>
    rw [map_add, PowerSeries.coeff_one, ite_eq_right (Nat.succ_ne_zero _), zero_add,
      PowerSeries.coeff_mul, Nat.antidiagonal_succ, sum_cons, sum_map, Nat.antidiagonal_eq_map, sum_map]
    simp only [compositionSeries, firstWeightSeries, PowerSeries.coeff_mk]
    change weightedCompositionSum w (n + 1) =
      ((if (0 : ℕ) = 0 then 0 else w 0) * weightedCompositionSum w (n + 1)) +
        ∑ k ∈ Finset.range (n + 1),
          (if k + 1 = 0 then 0 else w (k + 1)) * weightedCompositionSum w (n - k)
    simp [weightedCompositionSum_succ]
    exact Fin.sum_univ_eq_sum_range (fun k => w (k + 1) * weightedCompositionSum w (n - k)) _

private noncomputable def signedGeometric (u : R) : R⟦X⟧ :=
  mk (fun n => if n = 0 then 0 else (-1) ^ (n - 1) * u ^ n)

private theorem signedGeometric_cancel (u : R) :
    (1 + C u * X) * signedGeometric u = C u * X := by
  rw [add_mul, one_mul, mul_assoc]
  apply PowerSeries.ext
  intro n
  cases n with
  | zero => simp [signedGeometric, PowerSeries.coeff_mul, PowerSeries.coeff_X]
  | succ n =>
    cases n with
    | zero => simp [signedGeometric, PowerSeries.coeff_succ_X_mul]
    | succ n =>
      simp only [map_add, PowerSeries.coeff_C_mul, PowerSeries.coeff_succ_X_mul, signedGeometric,
        PowerSeries.coeff_mk, ite_eq_right (Nat.succ_ne_zero _), Nat.succ_sub_one,
        PowerSeries.coeff_X, ite_eq_right (show n + 1 + 1 ≠ 1 by omega), mul_zero, pow_succ]
      ring

private def columnWeight (u v x y : R) (n : ℕ) : R :=
  (-1) ^ (n - 1) * (x * u ^ n + y * v ^ n)

/-- One ordered column of blocks, with its sign, row length, and row moment markers. -/
noncomputable abbrev signedColumnSeries (u v x y : R) : R⟦X⟧ :=
  compositionSeries (columnWeight u v x y)

private theorem columnWeight_series (u v x y : R) :
    firstWeightSeries (columnWeight u v x y) =
      C x * signedGeometric u + C y * signedGeometric v := by
  apply PowerSeries.ext
  intro n
  cases n with
  | zero => simp [firstWeightSeries, signedGeometric]
  | succ n =>
    simp only [firstWeightSeries, signedGeometric, columnWeight, map_add, PowerSeries.coeff_C_mul,
      PowerSeries.coeff_mk, ite_eq_right (Nat.succ_ne_zero _)]
    ring

/-- Clearing the two geometric denominators yields the exact quadratic
trace–determinant denominator for the original column compositions. -/
theorem signedColumnSeries_denominator (u v x y : R) :
    (1 - C ((x - 1) * u + (y - 1) * v) * X + C ((1 - x - y) * u * v) * X ^ 2) *
      signedColumnSeries u v x y = (1 + C u * X) * (1 + C v * X) := by
  let F := signedColumnSeries u v x y
  let A : R⟦X⟧ := 1 + C u * X
  let B : R⟦X⟧ := 1 + C v * X
  let G := C x * signedGeometric u + C y * signedGeometric v
  have hF : F = 1 + G * F := by
    have h := compositionSeries_first_weight (columnWeight u v x y)
    rw [columnWeight_series] at h
    exact h
  have ha : A * signedGeometric u = C u * X := signedGeometric_cancel u
  have hb : B * signedGeometric v = C v * X := signedGeometric_cancel v
  have hd : 1 - C ((x - 1) * u + (y - 1) * v) * X +
      C ((1 - x - y) * u * v) * X ^ 2 = A * B * (1 - G) := by
    simp only [map_mul, map_add, map_sub, map_one]
    unfold G
    linear_combination C x * B * ha + C y * A * hb
  rw [hd]
  change A * B * (1 - G) * F = A * B
  linear_combination A * B * hF

/-- The homogeneous trace polynomials as coefficients of a formal series. -/
noncomputable def traceSeries (d t : R) : R⟦X⟧ :=
  mk (fun n => (traceComplete d n).eval t)

private theorem traceSeries_denominator (d t : R) :
    (1 - C t * X + C d * X ^ 2) * traceSeries d t = 1 := by
  rw [add_mul, sub_mul, one_mul, mul_assoc, pow_two, mul_assoc, mul_assoc X X]
  apply PowerSeries.ext
  intro n
  cases n with
  | zero => simp [traceSeries, traceComplete]
  | succ n =>
    cases n with
    | zero =>
      simp [traceSeries, traceComplete, PowerSeries.coeff_succ_X_mul]
    | succ n =>
      simp only [map_add, map_sub, PowerSeries.coeff_C_mul, PowerSeries.coeff_succ_X_mul,
        PowerSeries.coeff_one, ite_eq_right (Nat.succ_ne_zero _), traceSeries, PowerSeries.coeff_mk]
      rw [show traceComplete d (n + 1 + 1) =
        Polynomial.X * traceComplete d (n + 1) - Polynomial.C d * traceComplete d n by rfl,
        Polynomial.eval_sub, Polynomial.eval_mul, Polynomial.eval_mul, Polynomial.eval_X, Polynomial.eval_C]
      ring

/-- The signed composition series is exactly the homogeneous trace series
times the four-choice numerator for a single column. -/
theorem signedColumnSeries_eq_traceSeries (u v x y : R) :
    signedColumnSeries u v x y =
      ((1 + C u * X) * (1 + C v * X)) *
        traceSeries ((1 - x - y) * u * v) ((x - 1) * u + (y - 1) * v) := by
  let F := signedColumnSeries u v x y
  let A : R⟦X⟧ := (1 + C u * X) * (1 + C v * X)
  let d := (1 - x - y) * u * v
  let t := (x - 1) * u + (y - 1) * v
  let D : R⟦X⟧ := 1 - C t * X + C d * X ^ 2
  let H := traceSeries d t
  have hF : D * F = A := signedColumnSeries_denominator u v x y
  have hH : D * H = 1 := traceSeries_denominator d t
  change F = A * H
  calc
    F = (D * H) * F := by rw [hH, one_mul]
    _ = (D * F) * H := by ring
    _ = A * H := by rw [hF]

theorem signedColumnSeries_coeff (u v x y : R) (n : ℕ) :
    coeff n (signedColumnSeries u v x y) =
      let d := (1 - x - y) * u * v
      let t := (x - 1) * u + (y - 1) * v
      (traceComplete d n).eval t +
        (if 1 ≤ n then (u + v) * (traceComplete d (n - 1)).eval t else 0) +
        (if 2 ≤ n then (u * v) * (traceComplete d (n - 2)).eval t else 0) := by
  let H := traceSeries ((1 - x - y) * u * v) ((x - 1) * u + (y - 1) * v)
  rw [signedColumnSeries_eq_traceSeries]
  change coeff n (((1 + C u * X) * (1 + C v * X)) * H) = _
  rw [show ((1 + C u * X) * (1 + C v * X)) * H =
    H + C (u + v) * (X * H) + C (u * v) * (X ^ 2 * H) by simp only [map_add, map_mul]; ring]
  have hx : coeff n (X * H) = if 1 ≤ n then coeff (n - 1) H else 0 := by
    simpa only [pow_one] using coeff_X_pow_mul' H 1 n
  rw [map_add, map_add, PowerSeries.coeff_C_mul, PowerSeries.coeff_C_mul, hx,
    PowerSeries.coeff_X_pow_mul']
  simp [H, traceSeries, mul_ite]

end KauersKoutschan
