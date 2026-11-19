import Conjectures.LineSizeMomentLimits
import Conjectures.LineSizeGeometricProductLimit
import Conjectures.LineSizeLatticeFourierDomination
import Conjectures.LineSizeGaussianIntegral

/-! The actual normalized coefficient integrand. Its norm bound and moving
core limit are consequences of the finite product and moment estimates;
neither is an assumed local limit theorem. -/
noncomputable section
namespace LineSize.Geometric

open Real Filter MeasureTheory
open scoped Topology

def centeredCharacteristic (r : ℕ) (β t y : ℝ) : ℂ :=
  phase (((r : ℝ) ^ 2 + β * (r : ℝ) - Profile.A / t ^ 2) * (t * sqrt t * y)) *
    characteristic r t (t * sqrt t * y) * scalarFactor (exp (-t)) (t * sqrt t * y)

def normalizedCoefficient (r : ℕ) (β t y : ℝ) : ℂ :=
  (EulerKernel.normalizedWeight r β t : ℂ) * centeredCharacteristic r β t y

def gaussianCoefficient (β : ℝ) (p : ℝ × ℝ) : ℂ :=
  ((exp (-β * Profile.u0) / sqrt Real.pi : ℝ) : ℂ) * GaussianIntegral.saddleKernel p

theorem centeredCharacteristic_norm_le (r : ℕ) (β : ℝ) {t : ℝ} (ht : 0 < t) (y : ℝ) :
    ‖centeredCharacteristic r β t y‖ ≤ Lattice.scaledMajorant r t y := by
  have hq : exp (-t) < 1 := by rw [Real.exp_lt_one_iff]; linarith
  rw [centeredCharacteristic, norm_mul, norm_mul, phase_norm, one_mul,
    characteristic_norm r ht]
  change Lattice.scaledMajorant r t y * ‖scalarFactor (exp (-t)) (t * sqrt t * y)‖ ≤ _
  exact mul_le_of_le_one_right (Lattice.scaledMajorant_nonneg r t y)
    (scalarFactor_norm_le_one (Real.exp_pos _).le hq _)

theorem normalizedCoefficient_norm_le (r : ℕ) (β : ℝ) {t : ℝ} (ht : 0 < t) (y : ℝ) :
    ‖normalizedCoefficient r β t y‖ ≤
      EulerKernel.normalizedWeight r β t * Lattice.scaledMajorant r t y := by
  rw [normalizedCoefficient, norm_mul,
    Complex.norm_of_nonneg (EulerKernel.normalizedWeight_pos r β ht).le]
  exact mul_le_mul_of_nonneg_left (centeredCharacteristic_norm_le r β ht y)
    (EulerKernel.normalizedWeight_pos r β ht).le

theorem normalizedCoefficient_gaussian_bound :
    ∃ C : ℝ, 0 < C ∧ ∀ (r : ℕ) (β t y : ℝ), 0 ≤ β → 0 < t → t ≤ 1 →
      ‖normalizedCoefficient r β t y‖ ≤
        C * (1 + |EulerKernel.coreCoordinate r t|) *
          exp (-(EulerKernel.coreCoordinate r t) ^ 2) * Lattice.scaledMajorant r t y := by
  obtain ⟨C, hC, hbound⟩ := EulerKernel.normalizedWeight_gaussian_bound
  refine ⟨C, hC, ?_⟩
  intro r β t y hβ ht ht1
  exact (normalizedCoefficient_norm_le r β ht y).trans
    (mul_le_mul_of_nonneg_right (hbound r β t hβ ht ht1) (Lattice.scaledMajorant_nonneg r t y))

theorem centeredCharacteristic_continuous (r : ℕ) (β : ℝ) {t : ℝ} (ht : 0 < t) :
    Continuous (centeredCharacteristic r β t) := by
  have hq : exp (-t) < 1 := by rw [Real.exp_lt_one_iff]; linarith
  have htheta : Continuous (fun y : ℝ => t * sqrt t * y) := by fun_prop
  have hc := (characteristic_continuous r ht).comp htheta
  have he := (scalarFactor_continuous (Real.exp_pos (-t)).le hq).comp htheta
  have hp : Continuous (fun y : ℝ =>
      phase (((r : ℝ) ^ 2 + β * (r : ℝ) - Profile.A / t ^ 2) * (t * sqrt t * y))) := by
    unfold phase
    fun_prop
  exact (hp.mul hc).mul he

theorem normalizedCoefficient_continuous (r : ℕ) (β : ℝ) {t : ℝ} (ht : 0 < t) :
    Continuous (normalizedCoefficient r β t) :=
  continuous_const.mul (centeredCharacteristic_continuous r β ht)

theorem centeredCharacteristic_tendsto {α : Type*} {l : Filter α}
    {r : α → ℕ} {t : α → ℝ} {z0 : ℝ} (β : ℝ)
    (ht : Tendsto t l (𝓝 0)) (htpos : ∀ᶠ k in l, 0 < t k)
    (hz : Tendsto (fun k => EulerKernel.coreCoordinate (r k) (t k)) l (𝓝 z0)) (y : ℝ) :
    Tendsto (fun k => centeredCharacteristic (r k) β (t k) y) l
      (𝓝 (Complex.exp (linear ((z0 * (3 * Profile.u0)) * y) -
        ((Profile.V0 * y ^ 2 / 2 : ℝ) : ℂ)))) := by
  have hu0 := Profile.u0_pos
  have hr : ∀ᶠ k in l, (r k : ℝ) * t k ≤ 3 * Profile.u0 / 2 :=
    (EulerKernel.core_eventually_compact ht htpos hz).mono (fun _ h => h.2.2)
  have hm : Tendsto (fun k => t k * sqrt (t k) *
      (((r k : ℝ) ^ 2 + β * (r k : ℝ) - Profile.A / t k ^ 2) +
        EulerKernel.weightedMean (r k) (t k))) l (𝓝 (z0 * (3 * Profile.u0))) := by
    apply (EulerKernel.centeredMean_scaled_tendsto β ht htpos hz).congr'
    exact Filter.Eventually.of_forall (fun k => by ring)
  exact centered_product_tendsto (show 0 < 3 * Profile.u0 / 2 by positivity)
    ht htpos hr hm (EulerKernel.weightedVariance_scaled_tendsto ht htpos hz) y

theorem gaussianCoefficient_factor (β y x : ℝ) :
    (((exp (-β * Profile.u0) / sqrt Real.pi * exp (-(3 / 2 : ℝ) * x ^ 2)) : ℝ) : ℂ) *
      Complex.exp (linear ((x * (3 * Profile.u0)) * y) -
        ((Profile.V0 * y ^ 2 / 2 : ℝ) : ℂ)) = gaussianCoefficient β (y, x) := by
  rw [Complex.ofReal_mul, Complex.ofReal_exp, mul_assoc, ← Complex.exp_add]
  unfold gaussianCoefficient GaussianIntegral.saddleKernel GaussianIntegral.kernel linear
  congr 2
  push_cast
  ring

theorem normalizedCoefficient_tendsto {α : Type*} {l : Filter α}
    {r : α → ℕ} {t : α → ℝ} {z0 : ℝ} (β : ℝ)
    (ht : Tendsto t l (𝓝 0)) (htpos : ∀ᶠ k in l, 0 < t k)
    (hz : Tendsto (fun k => EulerKernel.coreCoordinate (r k) (t k)) l (𝓝 z0)) (y : ℝ) :
    Tendsto (fun k => normalizedCoefficient (r k) β (t k) y)
      l (𝓝 (gaussianCoefficient β (y, z0))) := by
  have hw := (Complex.continuous_ofReal.tendsto _).comp
    (EulerKernel.normalizedWeight_tendsto β ht htpos hz)
  have hc := centeredCharacteristic_tendsto β ht htpos hz y
  have h := hw.mul hc
  rw [gaussianCoefficient_factor] at h
  simpa only [Function.comp_apply, normalizedCoefficient] using h

theorem integrable_gaussianCoefficient (β : ℝ) :
    Integrable (gaussianCoefficient β) (volume.prod volume) :=
  GaussianIntegral.integrable_saddleKernel.const_mul _

theorem integral_gaussianCoefficient (β : ℝ) :
    (∫ p : ℝ × ℝ, gaussianCoefficient β p ∂(volume.prod volume)) =
      ((exp (-β * Profile.u0) / sqrt Real.pi *
        (2 * Real.pi / sqrt (6 * Profile.A)) : ℝ) : ℂ) := by
  unfold gaussianCoefficient
  rw [integral_const_mul, GaussianIntegral.integral_saddleKernel, Complex.ofReal_mul]

end LineSize.Geometric
