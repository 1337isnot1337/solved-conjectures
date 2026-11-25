import Conjectures.KauersKoutschanTracePolynomials
import Mathlib.Analysis.Calculus.Deriv.Polynomial
import Mathlib.MeasureTheory.Integral.IntervalIntegral.FundThmCalculus

/-! The normalized two-coordinate Schur moment can be integrated along the trace
using the characteristic power sum, with the determinant fixed. -/

namespace KauersKoutschan

open Polynomial MeasureTheory

theorem affine_trace_integral (d u v : ℝ) (n : ℕ) :
    (↑(n + 1 : ℕ) : ℝ) * (v - u) *
      (∫ t in (0 : ℝ)..1, (traceComplete d n).eval (u + (v - u) * t)) =
      (tracePower d (n + 1)).eval v - (tracePower d (n + 1)).eval u := by
  let f (t : ℝ) := (tracePower d (n + 1)).eval (u + (v - u) * t)
  have hf (t : ℝ) :
      HasDerivAt f ((↑(n + 1 : ℕ) : ℝ) * (v - u) *
        (traceComplete d n).eval (u + (v - u) * t)) t := by
    have ha : HasDerivAt (fun x : ℝ => u + (v - u) * x) (v - u) t := by
      have ha' : HasDerivAt (fun x : ℝ => u + (v - u) * x) (0 + (v - u) * 1) t :=
        (hasDerivAt_const t u).add ((hasDerivAt_id t).const_mul (v - u))
      simpa only [zero_add, mul_one] using ha'
    have hg := ((tracePower d (n + 1)).hasDerivAt (u + (v - u) * t)).comp t ha
    rw [derivative_tracePower, eval_mul, eval_natCast] at hg
    have hh : (↑(n + 1 : ℕ) : ℝ) * (v - u) * (traceComplete d n).eval (u + (v - u) * t) =
        (↑(n + 1 : ℕ) : ℝ) * (traceComplete d n).eval (u + (v - u) * t) * (v - u) := by ring
    rw [hh]
    exact hg
  have hc : Continuous (fun t : ℝ => (↑(n + 1 : ℕ) : ℝ) * (v - u) *
      (traceComplete d n).eval (u + (v - u) * t)) :=
    continuous_const.mul ((traceComplete d n).continuous.comp
      (continuous_const.add (continuous_const.mul continuous_id)))
  have hi := intervalIntegral.integral_eq_sub_of_hasDerivAt
    (fun t _ => hf t) (hc.intervalIntegrable 0 1)
  rw [← intervalIntegral.integral_const_mul, hi]
  simp only [f, mul_one, mul_zero, add_zero]
  rw [show u + (v - u) = v by ring]

/-- With positive radius and distinct scalings, the normalized uniform
coordinate integral is the product of the two complete characters. -/
theorem normalized_trace_moment (a b radius : ℝ) (n : ℕ)
    (hr : 0 < radius) (hab : a ≠ b) :
    let d := (1 - radius) * a * b
    let u := -a + (radius - 1) * b
    let v := (radius - 1) * a - b
    (↑(n + 1 : ℕ) : ℝ) * (∫ t in (0 : ℝ)..1, (traceComplete d n).eval (u + (v - u) * t)) =
      (traceComplete (a * b) n).eval (a + b) *
        (traceComplete (1 - radius) n).eval (radius - 2) := by
  dsimp only
  let d := (1 - radius) * a * b
  let u := -a + (radius - 1) * b
  let v := (radius - 1) * a - b
  have hU : (tracePower d (n + 1)).eval u = (-a) ^ (n + 1) + ((radius - 1) * b) ^ (n + 1) := by
    rw [show d = (-a) * ((radius - 1) * b) by dsimp [d]; ring]
    exact tracePower_eval (-a) ((radius - 1) * b) (n + 1)
  have hV : (tracePower d (n + 1)).eval v = ((radius - 1) * a) ^ (n + 1) + (-b) ^ (n + 1) := by
    rw [show d = ((radius - 1) * a) * (-b) by dsimp [d]; ring]
    exact tracePower_eval ((radius - 1) * a) (-b) (n + 1)
  have hA := traceComplete_eval_mul_difference a b n
  have hR : radius * (traceComplete (1 - radius) n).eval (radius - 2) =
      (radius - 1) ^ (n + 1) - (-1 : ℝ) ^ (n + 1) := by
    have he := traceComplete_eval_mul_difference (radius - 1) (-1 : ℝ) n
    rw [show radius - 1 - -1 = radius by ring,
      show (radius - 1) * -1 = 1 - radius by ring,
      show radius - 1 + -1 = radius - 2 by ring] at he
    exact he
  have hdifference : (tracePower d (n + 1)).eval v - (tracePower d (n + 1)).eval u =
      (radius * (a - b)) *
        ((traceComplete (a * b) n).eval (a + b) * (traceComplete (1 - radius) n).eval (radius - 2)) := by
    calc
      _ = ((radius - 1) ^ (n + 1) - (-1 : ℝ) ^ (n + 1)) * (a ^ (n + 1) - b ^ (n + 1)) := by
        rw [hU, hV, ← neg_one_mul a, ← neg_one_mul b]
        simp only [mul_pow]
        ring
      _ = _ := by rw [← hA, ← hR]; ring
  have hi := affine_trace_integral d u v n
  rw [hdifference] at hi
  have hvu : v - u = radius * (a - b) := by dsimp [u, v]; ring
  apply mul_left_cancel₀ (mul_ne_zero (ne_of_gt hr) (sub_ne_zero.mpr hab))
  change (radius * (a - b)) * ((↑(n + 1 : ℕ) : ℝ) *
    (∫ t in (0 : ℝ)..1, (traceComplete d n).eval (u + (v - u) * t))) = _
  exact (show _ = _ from
    calc
      (radius * (a - b)) * ((↑(n + 1 : ℕ) : ℝ) *
        (∫ t in (0 : ℝ)..1, (traceComplete d n).eval (u + (v - u) * t))) =
          (↑(n + 1 : ℕ) : ℝ) * (v - u) *
            (∫ t in (0 : ℝ)..1, (traceComplete d n).eval (u + (v - u) * t)) := by rw [hvu]; ring
      _ = _ := hi)

/-- The same normalized coordinate integral, including coincident scalings. -/
theorem normalized_trace_moment_all (a b radius : ℝ) (n : ℕ) (hr : 0 < radius) :
    let d := (1 - radius) * a * b
    let u := -a + (radius - 1) * b
    let v := (radius - 1) * a - b
    (↑(n + 1 : ℕ) : ℝ) * (∫ t in (0 : ℝ)..1, (traceComplete d n).eval (u + (v - u) * t)) =
      (traceComplete (a * b) n).eval (a + b) *
        (traceComplete (1 - radius) n).eval (radius - 2) := by
  by_cases hab : a = b
  · subst b
    dsimp only
    have hu : -a + (radius - 1) * a = a * (radius - 2) := by ring
    have hv : (radius - 1) * a - a = a * (radius - 2) := by ring
    have hd : (1 - radius) * a * a = a ^ 2 * (1 - radius) := by ring
    rw [hu, hv, hd]
    simp only [sub_self, zero_mul, add_zero, intervalIntegral.integral_const,
      sub_zero, one_smul, traceComplete_eval_scale, traceComplete_eval_equal_roots]
    ring
  · exact normalized_trace_moment a b radius n hr hab

end KauersKoutschan
