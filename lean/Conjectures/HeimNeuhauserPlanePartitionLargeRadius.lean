import Conjectures.HeimNeuhauserPlanePartitionSaddle

/-! An unconditional third-moment bound for saddle radii at least nine tenths. -/

namespace PlanePartition

open Finset

private theorem geometric_cube {r : ℝ} (hr : 0 ≤ r) (hr' : r < 1) :
    ∑' k : ℕ, (k : ℝ) ^ 3 * r ^ k = r * (1 + 4*r + r^2) / (1-r)^4 := by
  rw [tsum_pow_mul_geometric_of_norm_lt_one 3 (by simpa only [Real.norm_eq_abs, abs_of_nonneg hr] using hr')]
  norm_num [sum_range_succ, Nat.stirlingSecond, Nat.factorial]
  field_simp [sub_ne_zero.mpr hr'.ne']
  ring

private theorem geometric_fourth {r : ℝ} (hr : 0 ≤ r) (hr' : r < 1) :
    ∑' k : ℕ, (k : ℝ) ^ 4 * r ^ k = r * (1 + 11*r + 11*r^2 + r^3) / (1-r)^5 := by
  rw [tsum_pow_mul_geometric_of_norm_lt_one 4 (by simpa only [Real.norm_eq_abs, abs_of_nonneg hr] using hr')]
  norm_num [sum_range_succ, Nat.stirlingSecond, Nat.factorial]
  field_simp [sub_ne_zero.mpr hr'.ne']
  ring

theorem variance_ge_geometric {r : ℝ} (hr : 0 ≤ r) (hr' : r < 1) :
    r * (1 + 4*r + r^2) / (1-r)^4 ≤ moment 1 r := by
  rw [← geometric_cube hr hr']
  have hnorm : ‖r‖ < 1 := by simpa only [Real.norm_eq_abs, abs_of_nonneg hr] using hr'
  apply (summable_pow_mul_geometric_of_norm_lt_one 3 hnorm).tsum_le_tsum _ (moment_summable 1 hr hr')
  intro k
  have h : (k : ℝ)^2 ≤ divisorSquareSum k := by exact_mod_cast divisorSquareSum_lower k
  simp only [momentTerm, pow_one]
  apply mul_le_mul_of_nonneg_right _ (pow_nonneg hr _)
  nlinarith only [mul_le_mul_of_nonneg_left h (Nat.cast_nonneg k : (0 : ℝ) ≤ k)]

theorem thirdMoment_le_geometric {r : ℝ} (hr : 0 ≤ r) (hr' : r < 1) :
    moment 2 r ≤ (33/20) * (r * (1 + 11*r + 11*r^2 + r^3) / (1-r)^5) := by
  rw [← geometric_fourth hr hr', ← tsum_mul_left]
  have hnorm : ‖r‖ < 1 := by simpa only [Real.norm_eq_abs, abs_of_nonneg hr] using hr'
  apply (moment_summable 2 hr hr').tsum_le_tsum _ ((summable_pow_mul_geometric_of_norm_lt_one 4 hnorm).mul_left _)
  intro k
  unfold momentTerm
  rw [← mul_assoc (33 / 20 : ℝ)]
  apply mul_le_mul_of_nonneg_right _ (pow_nonneg hr _)
  nlinarith only [mul_le_mul_of_nonneg_left (divisorSquareSum_upper k) (sq_nonneg (k : ℝ))]

theorem largeRadius_thirdMoment {x r : ℝ} (hx : 1 ≤ x) (hr : (9/10 : ℝ) ≤ r) (hr' : r < 1) :
    9 * (x * moment 2 r)^2 ≤ (x * moment 1 r)^3 := by
  have hx₀ : 0 < x := by linarith
  have hr₀ : 0 < r := by linarith
  have hd : 0 < 1-r := by linarith
  have hd' : (1-r)^2 ≤ (1/10 : ℝ)^2 := by gcongr; linarith
  have hpoly : 541/100 ≤ 1+4*r+r^2 := by nlinarith [mul_nonneg (by linarith : 0 ≤ r - 9/10) (by linarith : 0 ≤ r + 9/10)]
  have hpoly' : 1+11*r+11*r^2+r^3 ≤ 24 := by
    have h₂ : r^2 ≤ (1 : ℝ)^2 := by gcongr
    have h₃ : r^3 ≤ (1 : ℝ)^3 := by gcongr
    linarith
  have hK : x * moment 2 r ≤ (x*r) * ((33/20)*24) / (1-r)^5 := by
    calc
      _ ≤ x * ((33/20) * (r * (1+11*r+11*r^2+r^3)/(1-r)^5)) :=
        mul_le_mul_of_nonneg_left (thirdMoment_le_geometric hr₀.le hr') hx₀.le
      _ ≤ x * ((33/20) * (r * 24 / (1-r)^5)) := by gcongr
      _ = _ := by ring
  have hV : (x*r) * (541/100) / (1-r)^4 ≤ x * moment 1 r := by
    calc
      _ = x * (r * (541/100) / (1-r)^4) := by ring
      _ ≤ x * (r * (1+4*r+r^2) / (1-r)^4) := by gcongr
      _ ≤ _ := mul_le_mul_of_nonneg_left (variance_ge_geometric hr₀.le hr') hx₀.le
  have hrx : 9/10 ≤ x*r := hr.trans (le_mul_of_one_le_left hr₀.le hx)
  have hnum : 9*((33/20 : ℝ)*24)^2*(1-r)^2 ≤ (x*r)*(541/100)^3 := by nlinarith only [hd', hrx]
  have hK₀ : 0 ≤ x * moment 2 r := mul_nonneg hx₀.le (tsum_nonneg (fun k => momentTerm_nonneg 2 k hr₀.le))
  calc
    _ ≤ 9 * ((x*r) * ((33/20)*24) / (1-r)^5)^2 := by gcongr
    _ ≤ ((x*r)*(541/100)/(1-r)^4)^3 := by
      have hmul := mul_le_mul_of_nonneg_left hnum (sq_nonneg (x*r))
      calc
        _ = ((x*r)^2*(9*((33/20)*24)^2*(1-r)^2))/(1-r)^12 := by field_simp [hd.ne']
        _ ≤ ((x*r)^2*((x*r)*(541/100)^3))/(1-r)^12 := div_le_div_of_nonneg_right hmul (pow_nonneg hd.le _)
        _ = _ := by field_simp [hd.ne']
    _ ≤ _ := by gcongr

end PlanePartition
