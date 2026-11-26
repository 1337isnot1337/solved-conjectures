import Conjectures.HeimNeuhauserPlanePartitionCharacteristic
import Conjectures.HeimNeuhauserPlanePartitionCosineInversion

/-! Fourier inversion for the actual geometrically tilted plane-partition coefficients. -/

namespace PlanePartition

open Real
open scoped Interval

private noncomputable def unitAngle (t : ℝ) := Complex.exp ((t : ℂ) * Complex.I)

private theorem unitAngle_re (t : ℝ) : (unitAngle t).re = cos t := Complex.exp_ofReal_mul_I_re _
private theorem unitAngle_im (t : ℝ) : (unitAngle t).im = sin t := Complex.exp_ofReal_mul_I_im _

private theorem unitAngle_add (a b : ℝ) : unitAngle a * unitAngle b = unitAngle (a + b) := by
  rw [unitAngle, unitAngle, unitAngle, ← Complex.exp_add, Complex.ofReal_add, add_mul]

private theorem unitAngle_pow (t : ℝ) (k : ℕ) : unitAngle t ^ k = unitAngle (k * t) := by
  rw [unitAngle, unitAngle, ← Complex.exp_nat_mul]
  push_cast
  ring_nf

private noncomputable def onCircle (r t : ℝ) := (r : ℂ) * unitAngle t

private theorem onCircle_norm {r : ℝ} (hr : 0 ≤ r) (t : ℝ) : ‖onCircle r t‖ = r := by
  simp [onCircle, unitAngle, Complex.norm_exp_ofReal_mul_I, Real.norm_eq_abs, hr]

private theorem weight_onCircle (p : PowerSeries ℝ) (r t : ℝ) (k : ℕ) :
    weightedCoefficient p (onCircle r t) k =
      ((weightedCoefficient p r k : ℝ) : ℂ) * unitAngle (k * t) := by
  simp [weightedCoefficient, onCircle, mul_pow, unitAngle_pow, mul_assoc]

private noncomputable def exponentAtAngle (x r t : ℝ) (k : ℕ) : ℂ :=
  (intensity x r k : ℂ) * unitAngle (k * t)

private theorem exponentAtAngle_sum {x r : ℝ} (hx : 0 ≤ x) (hr : 0 ≤ r) (hr' : r < 1) (t : ℝ) :
    Summable (exponentAtAngle x r t) := by
  apply Summable.of_norm
  have hi (k : ℕ) : 0 ≤ intensity x r k := by unfold intensity; positivity
  simpa only [exponentAtAngle, Complex.norm_mul, Complex.norm_real, Real.norm_eq_abs,
    abs_of_nonneg (hi _), unitAngle, Complex.norm_exp_ofReal_mul_I, mul_one] using intensity_summable hx hr hr'

private theorem centered_exponent {x r : ℝ} (hx : 0 ≤ x) (hr : 0 ≤ r) (hr' : r < 1)
    {n : ℕ} (hs : x * moment 0 r = n) (t : ℝ) :
    let w := (∑' k, exponentAtAngle x r t k) - (∑' k, intensity x r k : ℝ) -
      ((n : ℝ) * t : ℝ) * Complex.I
    w.re = -damping x r t ∧ w.im = phase x r t := by
  have hz := exponentAtAngle_sum hx hr hr' t
  have hrterm (k : ℕ) : (exponentAtAngle x r t k).re = intensity x r k * cos (k * t) := by
    simp only [exponentAtAngle, Complex.re_ofReal_mul, unitAngle_re]
  have hiterm (k : ℕ) : (exponentAtAngle x r t k).im = intensity x r k * sin (k * t) := by
    simp only [exponentAtAngle, Complex.im_ofReal_mul, unitAngle_im]
  have hcos := (Complex.hasSum_re hz.hasSum).summable
  simp only [hrterm] at hcos
  constructor
  · simp only [Complex.sub_re, Complex.ofReal_re, Complex.mul_I_re, Complex.ofReal_im, neg_zero,
      sub_zero, Complex.re_tsum hz, hrterm, damping]
    rw [← hcos.tsum_sub (intensity_summable hx hr hr'), ← tsum_neg]
    congr 1
    funext k
    ring
  · simp [Complex.im_tsum hz, hiterm, phase, hs]

private noncomputable def tiltedMass (x r : ℝ) (k : ℕ) := tiltConstant x r * r ^ k * planePartition x k

private theorem tiltedMass_summable {x r : ℝ} (hx : 0 < x) (hr : 0 < r) (hr' : r < 1) :
    Summable fun k => |tiltedMass x r k| := by
  have hz : ‖(r : ℂ)‖ < 1 := by simpa only [Complex.norm_real, Real.norm_eq_abs, abs_of_pos hr] using hr'
  have h := (Complex.hasSum_re (planePartition_hasSum hx.le hz)).summable
  simp only [← Complex.ofReal_pow, ← Complex.ofReal_mul, Complex.ofReal_re] at h
  have ha (k : ℕ) : 0 < tiltedMass x r k :=
    mul_pos (mul_pos (exp_pos _) (pow_pos hr _)) (planePartition_pos hx _)
  simp only [abs_of_pos (ha _)]
  simpa only [tiltedMass, mul_assoc, mul_comm (r ^ _) (planePartition x _)] using
    h.mul_left (tiltConstant x r)

private theorem tiltedMass_cosine {x r : ℝ} (hx : 0 ≤ x) (hr : 0 ≤ r) (hr' : r < 1)
    {n : ℕ} (hs : x * moment 0 r = n) (t : ℝ) :
    ∑' k : ℕ, tiltedMass x r k * cos (((k : ℤ) - n : ℤ) * t) =
      exp (-damping x r t) * cos (phase x r t) := by
  let A := ∑' k, exponentAtAngle x r t k
  let L := ∑' k, intensity x r k
  have hz : ‖onCircle r t‖ < 1 := (onCircle_norm hr _).symm ▸ hr'
  have h := planePartition_hasSum hx hz
  simp only [weight_onCircle, weighted_exponent] at h
  change HasSum _ (Complex.exp A) at h
  let center := (exp (-L) : ℂ) * unitAngle (-(n * t))
  have hcenter : Complex.exp A * center = Complex.exp (A - (L : ℂ) - ((n : ℝ) * t : ℝ) * Complex.I) := by
    simp only [center, unitAngle, Complex.ofReal_exp, Complex.ofReal_neg]
    rw [← mul_assoc, ← Complex.exp_add, ← Complex.exp_add]
    congr 1
    ring
  have hm (k : ℕ) : ((planePartition x k : ℂ) * onCircle r t ^ k * center).re =
      tiltedMass x r k * cos (((k : ℤ) - n : ℤ) * t) := by
    have hangle : (k : ℝ) * t + -(n * t) = (((k : ℤ) - n : ℤ) : ℝ) * t := by push_cast; ring
    have he : (planePartition x k : ℂ) * onCircle r t ^ k * center =
        (tiltedMass x r k : ℂ) * (unitAngle (k * t) * unitAngle (-(n * t))) := by
      simp only [onCircle, center, mul_pow, unitAngle_pow, tiltedMass, tiltConstant, Complex.ofReal_mul, Complex.ofReal_pow, L]
      ring
    rw [he, unitAngle_add, hangle]
    simp only [Complex.re_ofReal_mul, unitAngle_re]
  have hres := (Complex.hasSum_re (h.mul_right center)).tsum_eq
  have hw := centered_exponent hx hr hr' hs t
  simpa only [hm, hcenter, Complex.exp_re, A, L, hw.1, hw.2] using hres

/-- Exact centered second-difference inversion for the original coefficients. -/
theorem planePartition_fourier_inversion {x r : ℝ} (hx : 0 < x) (hr : r ∈ Set.Ioo (0 : ℝ) 1)
    {n : ℕ} (hn : 0 < n) (hs : x * moment 0 r = n) :
    tiltConstant x r * r ^ n * planePartition x n -
      (tiltConstant x r * r ^ (n - 1) * planePartition x (n - 1) +
       tiltConstant x r * r ^ (n + 1) * planePartition x (n + 1)) / 2 =
      π⁻¹ * ∫ t in (0 : ℝ)..π, (1 - cos t) * exp (-damping x r t) * cos (phase x r t) := by
  have h := centered_cosine_inversion _ (tiltedMass_summable hx hr.1 hr.2) hn
  simp_rw [tiltedMass_cosine hx.le hr.1.le hr.2 hs, ← mul_assoc] at h
  rw [h, ← mul_assoc, inv_mul_cancel₀ pi_ne_zero, one_mul]
  rfl

/-- Only the normalized third moment and outer integral estimates remain. -/
theorem strictTuran_of_two_saddle_bounds {x : ℝ} {n : ℕ} (hx : 1 ≤ x) (hn : 251 ≤ n)
    (hγ : ∀ r ∈ Set.Ioo (0 : ℝ) 1, x * moment 0 r = n →
      9 * (x * moment 2 r) ^ 2 ≤ (x * moment 1 r) ^ 3)
    (htail : ∀ r ∈ Set.Ioo (0 : ℝ) 1, x * moment 0 r = n →
      -(2 / 5 : ℝ) ≤ ∫ u in (3 : ℝ)..(π * sqrt (x * moment 1 r)),
        OrdinaryDarcais.normalizedIntegrand (x * moment 1 r) (damping x r) (phase x r) u) :
    planePartition x (n - 1) * planePartition x (n + 1) < planePartition x n ^ 2 := by
  have hx' : 0 < x := by linarith
  have hn' : 0 < n := by omega
  obtain ⟨r, ⟨hr, hs⟩, _⟩ := existsUnique_saddle hx' (show (0 : ℝ) < n by exact_mod_cast hn')
  exact strictTuran_of_saddle_estimates hx hr hn hs (hγ r hr hs) (htail r hr hs)
    (planePartition_fourier_inversion hx' hr hn' hs)

end PlanePartition
