import Conjectures.HeimNeuhauserPlanePartitionGeometricDamping
import Conjectures.HeimNeuhauserPlanePartitionLargeRadius

/-! Lower bounds on the Fourier damping in the inner and outer angle ranges. -/

namespace PlanePartition

open Real Finset

noncomputable def baseVariance (x r : ℝ) := x*r*(1+4*r+r^2)/(1-r)^4

theorem baseVariance_ge {x r : ℝ} (hx : 0 ≤ x) (hr : 0 ≤ r) (hr' : r < 1) :
    (20/33) * (x * moment 1 r) ≤ baseVariance x r := by
  have hn : ‖r‖ < 1 := by simpa only [Real.norm_eq_abs, abs_of_nonneg hr] using hr'
  have hg : ∑' k : ℕ, (k : ℝ)^3*r^k = r*(1+4*r+r^2)/(1-r)^4 := by
    rw [tsum_pow_mul_geometric_of_norm_lt_one 3 hn]
    norm_num [sum_range_succ, Nat.stirlingSecond, Nat.factorial]
    field_simp [sub_ne_zero.mpr hr'.ne']
    ring
  have h : moment 1 r ≤ (33/20) * ∑' k : ℕ, (k : ℝ)^3*r^k := by
    rw [← tsum_mul_left]
    apply (moment_summable 1 hr hr').tsum_le_tsum _ ((summable_pow_mul_geometric_of_norm_lt_one 3 hn).mul_left _)
    intro k
    simp only [momentTerm, pow_one, ← mul_assoc]
    apply mul_le_mul_of_nonneg_right _ (pow_nonneg hr _)
    nlinarith only [mul_le_mul_of_nonneg_left (divisorSquareSum_upper k) (Nat.cast_nonneg k : (0 : ℝ) ≤ k)]
  rw [hg] at h
  calc
    _ = ((20/33)*x)*moment 1 r := by ring
    _ ≤ ((20/33)*x) * ((33/20) * (r*(1+4*r+r^2)/(1-r)^4)) :=
      mul_le_mul_of_nonneg_left h (by positivity)
    _ = _ := by unfold baseVariance; ring

theorem damping_ge_defect {x r : ℝ} (hx : 0 ≤ x) (hr : 0 < r) (hr' : r < 1) (t : ℝ) :
    baseVariance x r * (1-cos t)/(1+envelopeS r t)^2 ≤ damping x r t := by
  have hd : 0 < 1-r := by linarith
  have ht : 0 ≤ 1-cos t := sub_nonneg.mpr (cos_le_one t)
  have hs : 0 ≤ envelopeS r t := by unfold envelopeS; positivity
  have hB : 0 ≤ envelopeB x r := by unfold envelopeB; positivity
  calc
    _ = envelopeB x r * (envelopeS r t*(2+envelopeA r)/(1+envelopeS r t)^2) := by
      unfold baseVariance envelopeB envelopeA
      rw [mul_div_assoc']
      congr 1
      unfold envelopeS
      field_simp [hd.ne', hr.ne']; ring
    _ ≤ envelopeDamping x r t := by
      dsimp only [envelopeDamping]
      exact mul_le_mul_of_nonneg_left (div_le_div_of_nonneg_right
        (mul_le_mul_of_nonneg_left (le_add_of_nonneg_right hs) hs) (sq_nonneg _)) hB
    _ ≤ _ := envelopeDamping_le hx hr hr' t

theorem defect_small {t : ℝ} (ht : 0 ≤ t) (ht' : t ≤ 1) :
    (11/24)*t^2 ≤ 1-cos t := by
  have h : t^2 ≤ (1 : ℝ)^2 := by gcongr
  nlinarith only [cosineDefect_lower ht, mul_le_mul_of_nonneg_left h (sq_nonneg t)]

noncomputable def outerNumerator (r : ℝ) :=
  (11/24)*(1+r^2)+(11/6)*r+(121/144)*r^2

noncomputable def outerMultiplier (r : ℝ) := outerNumerator r/(1+(11/12)*r)^2

theorem outerMultiplier_ge {r : ℝ} (hr : 0 ≤ r) : 2/5 ≤ outerMultiplier r := by
  unfold outerMultiplier outerNumerator
  rw [le_div_iff₀ (by positivity)]
  nlinarith only [hr, sq_nonneg r]

private theorem factor_mono_before_one {s g a : ℝ} (hg : 0 ≤ g) (hsg : g ≤ s)
    (ha : 0 ≤ a) (hag : a*g ≤ 1) :
    g*(2+a+g)/(1+g)^2 ≤ s*(2+a+s)/(1+s)^2 := by
  have hs : 0 ≤ s := hg.trans hsg
  have hden : (1+g)^2 ≤ (1+s)^2 := by gcongr
  have hf (q : ℝ) (hq : 0 ≤ q) : q*(2+a+q)/(1+q)^2 = 1 - (1-a*q)/(1+q)^2 := by
    field_simp [show 1+q ≠ 0 by linarith]; ring
  rw [hf g hg, hf s hs]
  have hnum : 1-a*s ≤ 1-a*g := by nlinarith only [mul_le_mul_of_nonneg_left hsg ha]
  have hfrac : (1-a*s)/(1+s)^2 ≤ (1-a*g)/(1+g)^2 := by
    calc
      _ ≤ (1-a*g)/(1+s)^2 := div_le_div_of_nonneg_right hnum (by positivity)
      _ ≤ _ := div_le_div_of_nonneg_left (by linarith) (by positivity) hden
  linarith

theorem damping_ge_outer {x r t : ℝ} (hx : 0 ≤ x) (hr : 0 < r) (hr' : r < 1)
    (ht : 1-r ≤ t) (ht' : t ≤ π) :
    envelopeB x r * outerMultiplier r ≤ damping x r t := by
  have hd : 0 < 1-r := by linarith
  have hcos := cos_le_cos_of_nonneg_of_le_pi hd.le ht' ht
  have hdef := defect_small hd.le (show 1-r ≤ 1 by linarith)
  let g := (11/12)*r
  have hg : 0 ≤ g := by dsimp [g]; positivity
  have hs : g ≤ envelopeS r t := by
    unfold envelopeS
    rw [le_div_iff₀ (sq_pos_of_pos hd)]
    dsimp [g]
    nlinarith only [mul_le_mul_of_nonneg_left (hdef.trans (sub_le_sub_left hcos 1)) hr.le]
  have ha : 0 ≤ envelopeA r := by unfold envelopeA; positivity
  have hag : envelopeA r*g ≤ 1 := by
    have he : envelopeA r*g = (11/24)*(1+r^2) := by unfold envelopeA g; field_simp [hr.ne']; ring
    rw [he]
    have hh : r^2 ≤ (1 : ℝ)^2 := by gcongr
    linarith
  have he : outerMultiplier r = g*(2+envelopeA r+g)/(1+g)^2 := by
    unfold outerMultiplier outerNumerator envelopeA g
    congr 1
    field_simp [hr.ne']; ring
  rw [he]
  exact (mul_le_mul_of_nonneg_left (factor_mono_before_one hg hs ha hag)
    (show 0 ≤ envelopeB x r by unfold envelopeB; positivity)).trans (envelopeDamping_le hx hr hr' t)

end PlanePartition
