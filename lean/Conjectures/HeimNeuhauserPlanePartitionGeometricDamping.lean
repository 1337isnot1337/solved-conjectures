import Conjectures.HeimNeuhauserPlanePartitionFourier
import Mathlib.Analysis.Complex.Trigonometric

/-! Explicit lower envelope for the damping of the plane-partition Fourier series. -/

namespace PlanePartition

open Real

private noncomputable def zetaAt (r t : ℝ) : ℂ := (r : ℂ) * Complex.exp ((t : ℂ) * Complex.I)

private theorem zetaAt_norm {r : ℝ} (hr : 0 ≤ r) (t : ℝ) : ‖zetaAt r t‖ = r := by
  simp [zetaAt, Complex.norm_exp_ofReal_mul_I, Real.norm_eq_abs, hr]

private theorem cosine_term (r t : ℝ) (k : ℕ) :
    ((k : ℂ) * zetaAt r t ^ k).re = k * r ^ k * cos (k*t) := by
  have he : Complex.exp ((t : ℂ)*Complex.I) ^ k = Complex.exp (((k : ℝ)*t : ℝ)*Complex.I) := by
    rw [← Complex.exp_nat_mul]
    congr 1
    push_cast
    ring
  rw [zetaAt, mul_pow, he, ← mul_assoc]
  rw [← Complex.ofReal_pow, ← Complex.ofReal_natCast, ← Complex.ofReal_mul, Complex.re_ofReal_mul,
    Complex.exp_ofReal_mul_I_re]

private theorem generating_real {r : ℝ} (hr : 0 ≤ r) (hr' : r < 1) (t : ℝ) :
    HasSum (fun k : ℕ => (k : ℝ)*r^k*cos (k*t))
      (zetaAt r t / (1 - zetaAt r t)^2).re := by
  have hz : ‖zetaAt r t‖ < 1 := by rwa [zetaAt_norm hr]
  simpa only [cosine_term] using Complex.hasSum_re (hasSum_coe_mul_geometric_of_norm_lt_one hz)

private theorem kernel_real (r t : ℝ) :
    (zetaAt r t / (1 - zetaAt r t)^2).re =
      r*((1+r^2)*cos t - 2*r) / ((1-r)^2+2*r*(1-cos t))^2 := by
  let z := zetaAt r t
  have h₁ : z.re = r*cos t := by simp [z, zetaAt]
  have h₂ : z.im = r*sin t := by simp [z, zetaAt]
  have hQ : Complex.normSq (1-z) = (1-r)^2+2*r*(1-cos t) := by
    simp only [Complex.normSq_apply, Complex.sub_re, Complex.sub_im, Complex.one_re, Complex.one_im, h₁, h₂]
    linear_combination r^2 * sin_sq_add_cos_sq t
  change (z / (1-z)^2).re = _
  rw [Complex.div_re, map_pow, hQ, ← add_div]
  congr 1
  simp only [sq, Complex.mul_re, Complex.mul_im, Complex.sub_re, Complex.sub_im, Complex.one_re, Complex.one_im, h₁, h₂]
  have hh := sin_sq_add_cos_sq t
  linear_combination r^3*cos t*hh + (-2*r^2)*hh

noncomputable def envelopeB (x r : ℝ) := x*r/(1-r)^2
noncomputable def envelopeS (r t : ℝ) := 2*r*(1-cos t)/(1-r)^2
noncomputable def envelopeA (r : ℝ) := (1+r^2)/(2*r)
noncomputable def envelopeDamping (x r t : ℝ) :=
  let s := envelopeS r t
  envelopeB x r * (s * (2+envelopeA r+s)/(1+s)^2)

theorem envelopeDamping_le {x r : ℝ} (hx : 0 ≤ x) (hr : 0 < r) (hr' : r < 1) (t : ℝ) :
    envelopeDamping x r t ≤ damping x r t := by
  have hd : 0 < 1-r := by linarith
  have ht : 0 ≤ 1-cos t := sub_nonneg.mpr (cos_le_one t)
  have hn : ‖r‖ < 1 := by simpa only [Real.norm_eq_abs, abs_of_nonneg hr.le] using hr'
  have h0 := (hasSum_coe_mul_geometric_of_norm_lt_one hn).sub (generating_real hr.le hr' t)
  have hs (k : ℕ) : (k : ℝ)*r^k - k*r^k*cos (k*t) = k*r^k*(1-cos (k*t)) := by ring
  simp only [hs, kernel_real] at h0
  have hreal : x*(r/(1-r)^2 - r*((1+r^2)*cos t - 2*r)/((1-r)^2+2*r*(1-cos t))^2) =
      envelopeDamping x r t := by
    have hden : 0 < (1-r)^2+2*r*(1-cos t) := add_pos_of_pos_of_nonneg (sq_pos_of_pos hd) (by positivity)
    unfold envelopeDamping envelopeS envelopeA envelopeB
    field_simp [hd.ne', hr.ne', hden.ne']
    ring
  rw [← hreal, ← h0.tsum_eq, ← tsum_mul_left]
  apply (h0.summable.mul_left x).tsum_le_tsum
  · intro k
    have hl : x*(k*r^k) ≤ intensity x r k := by
      by_cases hk : k = 0
      · simp [hk, intensity]
      have hk' : (0 : ℝ) < k := by exact_mod_cast Nat.pos_of_ne_zero hk
      rw [intensity, le_div_iff₀ hk']
      have hg : (k : ℝ)^2 ≤ divisorSquareSum k := by exact_mod_cast divisorSquareSum_lower k
      nlinarith only [mul_le_mul_of_nonneg_left hg (mul_nonneg hx (pow_nonneg hr.le k))]
    rw [← mul_assoc]
    exact mul_le_mul_of_nonneg_right hl (sub_nonneg.mpr (cos_le_one _))
  · have hi := intensity_summable hx hr.le hr'
    apply (hi.mul_left 2).of_norm_bounded
    intro k
    have hk : 0 ≤ intensity x r k := by unfold intensity; positivity
    rw [Real.norm_eq_abs, abs_of_nonneg (mul_nonneg hk (sub_nonneg.mpr (cos_le_one _)))]
    nlinarith only [mul_nonneg hk (by linarith [neg_one_le_cos ((k : ℝ)*t)] : 0 ≤ 1+cos ((k : ℝ)*t))]

end PlanePartition
