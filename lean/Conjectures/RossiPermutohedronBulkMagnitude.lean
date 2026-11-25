module

public import Mathlib.Analysis.Complex.ExponentialBounds
public import Mathlib.Tactic

@[expose] public section
namespace RossiPermutohedron

/-- The factorial lower bound follows already from the single nth term
of the exponential series, avoiding a separate integral proof. -/
theorem factorial_gt_div_three_pow (n : ℕ) (hn : 0<n) :
    ((n:ℝ)/3)^n < (n.factorial:ℝ) := by
  have hf : 0<(n.factorial:ℝ) := by exact_mod_cast Nat.factorial_pos n
  have hh := Real.pow_div_factorial_le_exp (n:ℝ)
    (show (0:ℝ)≤n by positivity) n
  have hE : Real.exp (n:ℝ) < (3:ℝ)^n := by
    rw [show (n:ℝ)=(n:ℝ)*1 by ring, Real.exp_nat_mul]
    exact pow_lt_pow_left₀ Real.exp_one_lt_three (Real.exp_pos _).le hn.ne'
  have ht := hh.trans_lt hE
  have hc := (div_lt_iff₀ hf).mp ht
  rw [div_pow]
  apply (div_lt_iff₀ (show 0<(3:ℝ)^n by positivity)).mpr
  simpa [mul_comm] using hc

theorem five_quarters_pow_gt (n : ℕ) (hn : 32≤n) :
    11*(n:ℝ)<(5/4:ℝ)^n := by
  induction n, hn using Nat.le_induction with
  | base => norm_num
  | succ n hn ih =>
    rw [pow_succ, Nat.cast_succ]
    have hN : (32:ℝ)≤n := by exact_mod_cast hn
    linarith

/-- The nearest-pole contribution has enough magnitude for the unit
level, even after losing half to the tail. -/
theorem power_lt_factorial_of_normSq_le {n : ℕ} (hn : 128≤n) {R : ℝ}
    (hR : 0≤R) (hSq : R^2≤11*(n:ℝ)) :
    R^(n+1)<(n.factorial:ℝ) := by
  have hN : (128:ℝ)≤n := by exact_mod_cast hn
  have hn0 : 0<n := by omega
  have hnp : 0<(n:ℝ) := by exact_mod_cast hn0
  have hB : (5/4 : ℝ) ≤ (n:ℝ)/99 := by linarith
  have ht : 11*(n:ℝ) < ((n:ℝ)/99)^n :=
    (five_quarters_pow_gt n (by omega)).trans_le (pow_le_pow_left₀ (by norm_num) hB n)
  have hg := mul_lt_mul_of_pos_left ht (show 0<(11*(n:ℝ))^n by positivity)
  have he : (11*(n:ℝ))^n*((n:ℝ)/99)^n = (((n:ℝ)/3)^n)^2 := by
    rw [← mul_pow, ← pow_mul]
    rw [show (11*(n:ℝ))*((n:ℝ)/99)=((n:ℝ)/3)^2 by ring,
      ← pow_mul, mul_comm]
  rw [he,← pow_succ] at hg
  have hp : (R^(n+1))^2 ≤ (11*(n:ℝ))^(n+1) := by
    rw [← pow_mul,mul_comm,pow_mul]
    exact pow_le_pow_left₀ (sq_nonneg _) hSq _
  have hF := pow_lt_pow_left₀ (factorial_gt_div_three_pow n hn0)
    (show 0≤((n:ℝ)/3)^n by positivity) (by decide : (2:ℕ)≠0)
  exact (sq_lt_sq₀ (pow_nonneg hR _) (by positivity)).mp (hp.trans_lt (hg.trans hF))

end RossiPermutohedron
