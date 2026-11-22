module

public import Conjectures.AgnosticVC.Learner
public import Mathlib.Algebra.Order.Ring.Pow

/-! Quantitative budget estimates for the parameters used by the learner. -/

@[expose] public section

open scoped BigOperators

namespace AgnosticVC

theorem depth_bounds {n d : ℕ} (hd : 0 < d) (hn : d ≤ n) :
    d * 16 ^ depth n d ≤ n ∧ n < d * 16 ^ (depth n d + 1) := by
  have hdiv : 0 < n / d := Nat.div_pos hn hd
  constructor
  · simpa [depth, Nat.mul_comm] using (Nat.le_div_iff_mul_le hd).mp (Nat.pow_log_le_self 16 hdiv.ne')
  · simpa [depth, Nat.mul_comm] using (Nat.div_lt_iff_lt_mul hd).mp
      (Nat.lt_pow_succ_log_self (by decide : 1 < 16) (n/d))

theorem last_size_sq_le {n d : ℕ} (hd : 0 < d) (hn : d ≤ n) :
    (d * 4 ^ depth n d)^2 ≤ n*d := by
  have he : (4 ^ depth n d)^2 = 16 ^ depth n d := by rw [← Nat.pow_mul, Nat.mul_comm, Nat.pow_mul]
  rw [Nat.mul_pow, he]
  calc
    _ = (d * 16^depth n d) * d := by ring
    _ ≤ _ := Nat.mul_le_mul_right _ (depth_bounds hd hn).1

theorem schedule_size_le {n d : ℕ} (hd : 0 < d) (hn : d ≤ n) (j : Fin (schedule n d).levels) :
    (schedule n d).size j ≤ n := by
  have hj : j.val ≤ depth n d := Nat.le_of_lt_succ j.isLt
  change d * 4 ^ j.val ≤ n
  exact (Nat.mul_le_mul_left _ ((Nat.pow_le_pow_right (by decide : 0 < 4) hj).trans
    (Nat.pow_le_pow_left (by decide : 4 ≤ 16) _))).trans (depth_bounds hd hn).1

theorem temperatureAt_nonneg (n d j : ℕ) : 0 ≤ temperatureAt n d j := by
  unfold temperatureAt
  positivity

theorem temperatureAt_succ (n d j : ℕ) :
    temperatureAt n d j = (21/20 : ℝ) * temperatureAt n d (j+1) := by
  unfold temperatureAt
  rw [pow_succ]
  ring

/-- The affine weights telescope, avoiding an infinite-series estimate. -/
private theorem entropy_sum_eq (n d k : ℕ) :
    (∑ j ∈ Finset.range k, (temperatureAt n d j - temperatureAt n d (j+1)) *
      (1+4*(j:ℝ))) =
      81 * temperatureAt n d 0 - temperatureAt n d k * (81 + 4*k) := by
  induction k with
  | zero => simp [mul_comm]
  | succ k ih =>
    rw [Finset.sum_range_succ, ih, Nat.cast_succ]
    nth_rw 2 [temperatureAt_succ n d k]
    rw [temperatureAt_succ n d k]
    ring

theorem entropy_sum_le (n d k : ℕ) :
    (∑ j ∈ Finset.range k, (temperatureAt n d j - temperatureAt n d (j+1)) *
      (1+4*(j:ℝ))) ≤ 81 * Real.sqrt ((n:ℝ)/d) := by
  rw [entropy_sum_eq]
  simpa [temperatureAt] using sub_le_self (81 * temperatureAt n d 0)
    (mul_nonneg (temperatureAt_nonneg n d k) (by positivity : 0 ≤ (81 : ℝ) + 4*k))

theorem full_entropy_budget {n d : ℕ} (hd : 0 < d) (hn : d ≤ n) :
    (schedule n d).temperature * (1 + Real.log ((n:ℝ)/d)) ≤
      320 * Real.sqrt ((n:ℝ)/d) := by
  let k := depth n d + 1
  have hdr : (0:ℝ) < d := by exact_mod_cast hd
  have hnr : (0:ℝ) < n := by exact_mod_cast hd.trans_le hn
  have hr : (n:ℝ)/d ≤ (16:ℝ)^k := by
    apply (div_le_iff₀ hdr).mpr
    exact_mod_cast (show n ≤ 16^k*d by simpa [k, Nat.mul_comm] using (depth_bounds hd hn).2.le)
  have hl := Real.log_le_log (div_pos hnr hdr) hr
  rw [Real.log_pow] at hl
  have h16 : Real.log 16 ≤ 16 := Real.log_le_self (by norm_num)
  have hb := one_add_mul_sub_le_pow (by norm_num : (-1:ℝ) ≤ 21/20) k
  have ha : 1 + Real.log ((n:ℝ)/d) ≤ 320 * (21/20:ℝ)^k := by
    nlinarith [mul_le_mul_of_nonneg_left h16 (Nat.cast_nonneg (α := ℝ) k)]
  change (Real.sqrt ((n:ℝ)/d) / (21/20:ℝ)^k) * _ ≤ _
  rw [div_mul_eq_mul_div, div_le_iff₀ (by positivity)]
  nlinarith [mul_le_mul_of_nonneg_left ha (Real.sqrt_nonneg ((n:ℝ)/d))]

/-- Total restriction-replacement sensitivity accumulated through k levels. -/
theorem restriction_size_sum_le (n d k : ℕ) :
    (∑ j ∈ Finset.range k, (temperatureAt n d j - temperatureAt n d (j+1)) *
      ((d:ℝ)*4^j)) ≤ temperatureAt n d k * ((d:ℝ)*4^k) / 4 := by
  induction k with
  | zero => simp; positivity [temperatureAt_nonneg n d 0]
  | succ k ih =>
    rw [Finset.sum_range_succ, pow_succ]
    rw [temperatureAt_succ n d k] at ih ⊢
    nlinarith [mul_nonneg (temperatureAt_nonneg n d (k+1))
      (mul_nonneg (Nat.cast_nonneg (α := ℝ) d) (pow_nonneg (by norm_num : 0 ≤ (4:ℝ)) k))]

end AgnosticVC
