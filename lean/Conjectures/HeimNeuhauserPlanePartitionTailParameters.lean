import Conjectures.HeimNeuhauserPlanePartitionFourierSign
import Conjectures.HeimNeuhauserPlanePartitionDampingBounds
import Conjectures.HeimNeuhauserPlanePartitionMomentCells

/-! Radius-independent outer-tail scales and the two middle-tail regimes. -/

namespace PlanePartition

open Real

noncomputable def variance (x r : ℝ) := x * moment 1 r

/-- Uniform constants for the finite middle integral and the large-angle damping. -/
structure TailParameters (x r : ℝ) : Prop where
  outer : 39/2 ≤ envelopeB x r * outerMultiplier r
  middle : ((7/10)*variance x r ≤ baseVariance x r ∧ 145*r ≤ (1-r)^2*variance x r) ∨
    ((20/33)*variance x r ≤ baseVariance x r ∧ 400*r ≤ (1-r)^2*variance x r)

theorem saddle_variance_lower {x r : ℝ} (hx : 1 ≤ x) (hr : r ∈ Set.Ioo (0 : ℝ) 1)
    (hn : 251 ≤ x * moment 0 r) : 251 ≤ variance x r :=
  hn.trans (mul_le_mul_of_nonneg_left (mean_le_variance hr.1.le hr.2) (by linarith))

private theorem mean_upper {r : ℝ} (hr : 0 < r) (hr' : r < 1) :
    moment 0 r ≤ (33/20) * (r*(1+r)/(1-r)^3) := by
  have hnorm : ‖r‖ < 1 := by simpa only [Real.norm_eq_abs, abs_of_pos hr] using hr'
  rw [← tsum_sq_mul_geometric_of_norm_lt_one hnorm, ← tsum_mul_left]
  apply (moment_summable 0 hr.le hr').tsum_le_tsum _ ((summable_pow_mul_geometric_of_norm_lt_one 2 hnorm).mul_left _)
  intro k
  simp only [momentTerm, pow_zero, one_mul, ← mul_assoc]
  exact mul_le_mul_of_nonneg_right (divisorSquareSum_upper k) (pow_nonneg hr.le _)

theorem saddle_xr_lower {x r : ℝ} (hx : 1 ≤ x) (hr : r ∈ Set.Ioo (0 : ℝ) 1)
    (hn : 251 ≤ x * moment 0 r) : 3/4 ≤ x*r := by
  have hx₀ : 0 ≤ x := by linarith
  by_cases h : 3/4 ≤ r
  · exact h.trans (le_mul_of_one_le_left hr.1.le hx)
  · have hd : (1/4 : ℝ)^3 ≤ (1-r)^3 := by gcongr; linarith
    have hfrac : (1+r)/(1-r)^3 ≤ (7/4)/(1/4 : ℝ)^3 :=
      div_le_div₀ (by linarith [hr.1] : (0 : ℝ) ≤ 7/4) (by linarith) (by positivity) hd
    have hm := (mean_upper hr.1 hr.2).trans
      (show (33/20)*(r*(1+r)/(1-r)^3) ≤ (33/20)*r*((7/4)/(1/4 : ℝ)^3) by
        calc
          _ = (33/20)*r*((1+r)/(1-r)^3) := by ring
          _ ≤ _ := mul_le_mul_of_nonneg_left hfrac (mul_nonneg (by norm_num) hr.1.le))
    have hbound := hn.trans (mul_le_mul_of_nonneg_left hm hx₀)
    nlinarith only [hbound]

theorem saddle_variance_upper {x r : ℝ} (hx : 1 ≤ x) (hr : r ∈ Set.Ioo (0 : ℝ) 1)
    (hn : 251 ≤ x * moment 0 r) : variance x r ≤ 16*(envelopeB x r)^2 := by
  have hx₀ : 0 ≤ x := by linarith
  have hy := saddle_xr_lower hx hr hn
  have hd : 0 < 1-r := by linarith [hr.2]
  have hp : 1+4*r+r^2 ≤ 6 := by
    have hsq : r^2 ≤ (1 : ℝ)^2 := pow_le_pow_left₀ hr.1.le hr.2.le 2
    linarith [hr.2]
  have hnum : x*r*(1+4*r+r^2) ≤ (20/33)*16*(x*r)^2 := by
    have h₀ : 0 ≤ x*r := mul_nonneg hx₀ hr.1.le
    have h₁ := mul_le_mul_of_nonneg_left hp h₀
    have h₂ := mul_le_mul_of_nonneg_left hy h₀
    nlinarith only [h₁, h₂]
  have hscale := div_le_div_of_nonneg_right hnum (pow_nonneg hd.le 4)
  have hbound : baseVariance x r ≤ (20/33)*(16*(envelopeB x r)^2) := by
    calc
      _ ≤ ((20/33)*16*(x*r)^2)/(1-r)^4 := hscale
      _ = _ := by unfold envelopeB; field_simp [hd.ne']
  have hcmp := (baseVariance_ge hx₀ hr.1.le hr.2).trans hbound
  unfold variance
  linarith

theorem small_radius_middle {x r : ℝ} (hx : 1 ≤ x) (hr : r ∈ Set.Ioo (0 : ℝ) 1)
    (hn : 251 ≤ x * moment 0 r) (h : r ≤ 1/4) :
    (20/33)*variance x r ≤ baseVariance x r ∧ 400*r ≤ (1-r)^2*variance x r := by
  refine ⟨baseVariance_ge (by linarith) hr.1.le hr.2, ?_⟩
  have hd : (3/4 : ℝ)^2 ≤ (1-r)^2 := by gcongr; linarith
  have hm : (3/4 : ℝ)^2*251 ≤ (1-r)^2*variance x r :=
    mul_le_mul hd (saddle_variance_lower hx hr hn) (by norm_num) (sq_nonneg _)
  linarith

theorem large_radius_tail {x r : ℝ} (hx : 1 ≤ x) (hr : r ∈ Set.Ioo (0 : ℝ) 1)
    (h : 9/10 ≤ r) : TailParameters x r := by
  have hd : 0 < 1-r := by linarith [hr.2]
  have hd₂ : (1-r)^2 ≤ (1/10 : ℝ)^2 := by gcongr; linarith
  have hx₀ : 0 ≤ x := by linarith
  have hy : 9/10 ≤ x*r := h.trans (le_mul_of_one_le_left hr.1.le hx)
  have hB : 90 ≤ envelopeB x r := by unfold envelopeB; rw [le_div_iff₀ (sq_pos_of_pos hd)]; linarith
  refine ⟨?_, Or.inr ⟨baseVariance_ge hx₀ hr.1.le hr.2, ?_⟩⟩
  · have hc := mul_le_mul hB (outerMultiplier_ge hr.1.le) (by norm_num : (0 : ℝ) ≤ 2/5) (by linarith : 0 ≤ envelopeB x r)
    linarith
  · have hp : 400*(1-r)^2 ≤ 1+4*r+r^2 := by nlinarith only [hd₂, h, sq_nonneg r]
    have hnum := mul_le_mul_of_nonneg_left hp hr.1.le
    have hnum' : 400*r*(1-r)^2 ≤ x*r*(1+4*r+r^2) := by
      have hh := mul_le_mul_of_nonneg_right (le_mul_of_one_le_left hr.1.le hx) (show 0 ≤ 1+4*r+r^2 by positivity)
      nlinarith only [hh,hnum]
    have hv := mul_le_mul_of_nonneg_left (variance_ge_geometric hr.1.le hr.2) hx₀
    calc
      _ ≤ ((x*r*(1+4*r+r^2))/(1-r)^2) := (le_div_iff₀ (sq_pos_of_pos hd)).2 hnum'
      _ = (1-r)^2*(x*(r*(1+4*r+r^2)/(1-r)^4)) := by field_simp [hd.ne']
      _ ≤ _ := mul_le_mul_of_nonneg_left hv (sq_nonneg _)

end PlanePartition
