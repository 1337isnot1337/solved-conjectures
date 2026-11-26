import Conjectures.DukesRevstackPolynomial
import Mathlib.Analysis.Calculus.Deriv.Inv
import Mathlib.Analysis.Calculus.Deriv.Polynomial
import Mathlib.Analysis.Calculus.IteratedDeriv.Lemmas
import Mathlib.Analysis.SpecialFunctions.ExpDeriv
import Mathlib.Tactic.FieldSimp

/-! The negative-exponential change of variable identifies the Eulerian
polynomials with derivatives of the real logistic function. -/

open Polynomial

namespace DukesRevstack

noncomputable def negativeExp (t : ℝ) : ℝ := -Real.exp (-t)

theorem negativeExp_neg (t : ℝ) : negativeExp t < 0 := neg_lt_zero.mpr (Real.exp_pos _)

theorem hasDerivAt_negativeExp (t : ℝ) :
    HasDerivAt negativeExp (-negativeExp t) t := by
  have h := (Real.hasDerivAt_exp (-t)).comp t (hasDerivAt_id t).neg
  unfold negativeExp
  rw [neg_neg]
  have h' := h.neg
  change HasDerivAt (fun s : ℝ => -Real.exp (-s)) (-(Real.exp (-t) * (-1))) t at h'
  simpa using h'

noncomputable def logistic (t : ℝ) : ℝ := 1 / (1 + Real.exp t)

noncomputable def signedLogisticDerivative (n : ℕ) (t : ℝ) : ℝ :=
  let x := negativeExp t
  (-x) * (eulerian (R := ℝ) n).eval x / (1 - x) ^ (n + 1)

theorem signedLogisticDerivative_zero (t : ℝ) : signedLogisticDerivative 0 t = logistic t := by
  have hE : Real.exp t ≠ 0 := (Real.exp_pos t).ne'
  simp only [signedLogisticDerivative, negativeExp, neg_neg, eulerian_zero, eval_one,
    mul_one, zero_add, pow_one, logistic, Real.exp_neg]
  have hDen : 1 + (Real.exp t)⁻¹ ≠ 0 := by positivity
  have hDen' : 1 + Real.exp t ≠ 0 := by positivity
  simp only [sub_neg_eq_add]
  apply (div_eq_div_iff hDen hDen').mpr
  rw [mul_add, mul_one, inv_mul_cancel₀ hE, one_mul, add_comm]

theorem hasDerivAt_signedLogisticDerivative (n : ℕ) (t : ℝ) :
    HasDerivAt (signedLogisticDerivative n) (-signedLogisticDerivative (n + 1) t) t := by
  let x := negativeExp t
  let p := eulerian (R := ℝ) n
  have hx : x < 0 := negativeExp_neg t
  have hX : HasDerivAt negativeExp (-x) t := hasDerivAt_negativeExp t
  have hU : HasDerivAt (fun s => 1 - negativeExp s) x t := by
    simpa using hX.const_sub (1 : ℝ)
  have hP : HasDerivAt (fun s => p.eval (negativeExp s)) (p.derivative.eval x * -x) t :=
    by simpa only [Function.comp_def] using (p.hasDerivAt x).comp t hX
  have hN := hX.neg.mul hP
  have hD := hU.pow (n + 1)
  have hPos : 0 < 1 - x := by linarith
  have hNonzero : (1 - negativeExp t) ^ (n + 1) ≠ 0 := pow_ne_zero _ hPos.ne'
  have hDiv := hN.div hD hNonzero
  convert hDiv using 1
  · rfl
  change -(-x * ((eulerian (R := ℝ) (n + 1)).eval x) / (1 - x) ^ (n + 1 + 1)) = _
  rw [eulerian_succ]
  unfold eulerianOperator
  simp only [eval_add, eval_mul, eval_X, eval_C, eval_one, eval_sub, Nat.cast_add, Nat.cast_one,
    Nat.add_sub_cancel, neg_neg]
  change -(-x * ((1 + (n : ℝ) * x) * p.eval x + x * (1 - x) * p.derivative.eval x) /
      (1 - x) ^ (n + 1 + 1)) =
    ((x * p.eval x + -x * (p.derivative.eval x * -x)) * (1 - x) ^ (n + 1) -
      -x * p.eval x * (((n : ℝ) + 1) * (1 - x) ^ n * x)) /
        ((1 - x) ^ (n + 1)) ^ 2
  rw [pow_succ (1 - x) (n + 1), pow_succ (1 - x) n]
  have hPow : (1 - x) ^ n ≠ 0 := pow_ne_zero n hPos.ne'
  field_simp [hPos.ne', hPow]
  ring

theorem iteratedDeriv_logistic (n : ℕ) (t : ℝ) :
    iteratedDeriv n logistic t = (-1 : ℝ) ^ n * signedLogisticDerivative n t := by
  induction n generalizing t with
  | zero => simp [signedLogisticDerivative_zero]
  | succ n ih =>
    rw [iteratedDeriv_succ, funext ih]
    rw [((hasDerivAt_signedLogisticDerivative n t).const_mul ((-1 : ℝ) ^ n)).deriv, pow_succ]
    ring

end DukesRevstack
