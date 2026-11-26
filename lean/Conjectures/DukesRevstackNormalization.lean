import Conjectures.DukesRevstackLogistic
import Conjectures.DukesRevstackInterlacing

/-! The logistic zero test and derivative estimate transfer to the
exact polynomial root and remainder criteria. -/

open Polynomial

namespace DukesRevstack

noncomputable def logisticRevstack (n : ℕ) (t : ℝ) : ℝ :=
  signedLogisticDerivative n t +
    signedLogisticDerivative (leftSize n) t * signedLogisticDerivative (rightSize n) t

theorem logisticRevstack_eq_polynomial (n : ℕ) (hn : 0 < n) (t : ℝ) :
    logisticRevstack n t =
      -negativeExp t * (reducedRevstack (R := ℝ) n).eval (negativeExp t) /
        (1 - negativeExp t) ^ (n + 1) := by
  let x := negativeExp t
  have hN := split_size_add hn
  have hP : (1 - x) ^ (leftSize n + 1) * (1 - x) ^ (rightSize n + 1) =
      (1 - x) ^ (n + 1) := by
    rw [← pow_add]
    congr 1
    omega
  unfold logisticRevstack signedLogisticDerivative reducedRevstack
  change -x * (eulerian (R := ℝ) n).eval x / (1 - x) ^ (n + 1) +
      (-x * (eulerian (R := ℝ) (leftSize n)).eval x / (1 - x) ^ (leftSize n + 1)) *
        (-x * (eulerian (R := ℝ) (rightSize n)).eval x / (1 - x) ^ (rightSize n + 1)) = _
  rw [div_mul_div_comm, hP, ← add_div]
  simp only [eval_sub, eval_mul, eval_X]
  congr 1
  ring

theorem logisticRevstack_zero_of_root {n : ℕ} (hn : 0 < n) {t : ℝ}
    (hRoot : (reducedRevstack (R := ℝ) n).eval (negativeExp t) = 0) :
    logisticRevstack n t = 0 := by
  simp [logisticRevstack_eq_polynomial n hn, hRoot]

theorem hasDerivAt_logisticRevstack_at_root {n : ℕ} (hn : 0 < n) {t : ℝ}
    (hRoot : (reducedRevstack (R := ℝ) n).eval (negativeExp t) = 0) :
    HasDerivAt (logisticRevstack n)
      ((negativeExp t) ^ 2 * (reducedRevstack (R := ℝ) n).derivative.eval (negativeExp t) /
        (1 - negativeExp t) ^ (n + 1)) t := by
  let x := negativeExp t
  let p := reducedRevstack (R := ℝ) n
  have hX : HasDerivAt negativeExp (-x) t := hasDerivAt_negativeExp t
  have hU : HasDerivAt (fun s => 1 - negativeExp s) x t := by
    simpa using hX.const_sub (1 : ℝ)
  have hP : HasDerivAt (fun s => p.eval (negativeExp s)) (p.derivative.eval x * -x) t :=
    by simpa only [Function.comp_def] using (p.hasDerivAt x).comp t hX
  have hN := hX.neg.mul hP
  have hD := hU.pow (n + 1)
  have hPos : 0 < 1 - x := by
    have := negativeExp_neg t
    change x < 0 at this
    linarith
  have hPow : (1 - negativeExp t) ^ (n + 1) ≠ 0 := pow_ne_zero _ hPos.ne'
  have hDer := hN.div hD hPow
  rw [show logisticRevstack n = _ from funext (logisticRevstack_eq_polynomial n hn)]
  convert hDer using 1
  change x ^ 2 * p.derivative.eval x / (1 - x) ^ (n + 1) =
    ((- -x * p.eval x + -x * (p.derivative.eval x * -x)) * (1 - x) ^ (n + 1) -
      -x * p.eval x * ((↑(n + 1) : ℝ) * (1 - x) ^ (n + 1 - 1) * x)) /
        ((1 - x) ^ (n + 1)) ^ 2
  change p.eval x = 0 at hRoot
  rw [hRoot]
  field_simp
  ring

theorem norm_logisticRemainder_at_root {n : ℕ} (hn : 0 < n) {t : ℝ}
    (hRoot : (reducedRevstack (R := ℝ) n).eval (negativeExp t) = 0)
    (hDom : |signedLogisticDerivative (leftSize n) t * signedLogisticDerivative (rightSize n + 1) t| <
      |deriv (logisticRevstack n) t|) :
    |negativeExp t * ((eulerian (R := ℝ) (leftSize n)).eval (negativeExp t) *
        (eulerian (rightSize n + 1)).eval (negativeExp t))| <
      |negativeExp t * (1 - negativeExp t) *
        (reducedRevstack (R := ℝ) n).derivative.eval (negativeExp t)| := by
  let x := negativeExp t
  let A := (eulerian (R := ℝ) (leftSize n)).eval x
  let B := (eulerian (R := ℝ) (rightSize n + 1)).eval x
  let P := (reducedRevstack (R := ℝ) n).derivative.eval x
  have hx : x < 0 := negativeExp_neg t
  have hu : 0 < 1 - x := by linarith
  have hL : 0 < (1 - x) ^ (n + 1) := pow_pos hu _
  have hA : 0 < x ^ 2 := sq_pos_of_ne_zero hx.ne
  have hSize := split_size_add hn
  have hExp : (leftSize n + 1) + (rightSize n + 1 + 1) = n + 1 + 1 := by omega
  have hRem :
      signedLogisticDerivative (leftSize n) t * signedLogisticDerivative (rightSize n + 1) t =
        x ^ 2 * (A * B) / ((1 - x) ^ (n + 1) * (1 - x)) := by
    change (-x * A / (1 - x) ^ (leftSize n + 1)) * (-x * B / (1 - x) ^ (rightSize n + 1 + 1)) = _
    rw [div_mul_div_comm, ← pow_add, hExp, pow_succ]
    congr 1
    ring
  have hDer := (hasDerivAt_logisticRevstack_at_root hn hRoot).deriv
  rw [hRem, hDer] at hDom
  change |x ^ 2 * (A * B) / ((1 - x) ^ (n + 1) * (1 - x))| < |x ^ 2 * P / (1 - x) ^ (n + 1)| at hDom
  rw [abs_div, abs_div, abs_mul (x ^ 2), abs_mul (x ^ 2),
    abs_of_pos hA, abs_of_pos (mul_pos hL hu), abs_of_pos hL] at hDom
  have hh := (div_lt_div_iff₀ (mul_pos hL hu) hL).mp hDom
  have hCancel : x ^ 2 * (1 - x) ^ (n + 1) * |A * B| <
      x ^ 2 * (1 - x) ^ (n + 1) * ((1 - x) * |P|) := by
    convert hh using 1 <;> ring
  have hAbs := lt_of_mul_lt_mul_left hCancel (mul_nonneg hA.le hL.le)
  change |x * (A * B)| < |x * (1 - x) * P|
  rw [abs_mul x (A * B), abs_mul (x * (1 - x)) P, abs_mul x (1 - x), abs_of_pos hu, mul_assoc]
  exact mul_lt_mul_of_pos_left hAbs (abs_pos.mpr hx.ne)

end DukesRevstack
