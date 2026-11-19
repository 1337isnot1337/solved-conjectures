import Conjectures.LineSizeCoreGaussian
import Conjectures.LineSizeSaddleLimits

/-! The pointwise Gaussian limit of the literal positive core weights.
The core index may move with the scale; its normalized coordinate is the
only location hypothesis. -/
noncomputable section
namespace LineSize.EulerKernel

open Real Set Filter
open scoped Topology

theorem productDenominator_continuous : Continuous productDenominator := by
  unfold productDenominator
  fun_prop

@[simp] theorem productDenominator_u0 : productDenominator Profile.u0 = Real.pi := by
  rw [productDenominator, Profile.exp_neg_u0]
  ring

theorem core_scaled_argument_tendsto {α : Type*} {l : Filter α}
    {r : α → ℕ} {t : α → ℝ} {z0 : ℝ}
    (ht : Tendsto t l (𝓝 0)) (htpos : ∀ᶠ k in l, 0 < t k)
    (hz : Tendsto (fun k => coreCoordinate (r k) (t k)) l (𝓝 z0)) :
    Tendsto (fun k => (r k : ℝ) * t k) l (𝓝 Profile.u0) := by
  apply (Saddle.scaled_argument_tendsto ht hz).congr'
  filter_upwards [htpos] with k hk
  exact (coreCoordinate_identity (r k) hk).symm

theorem core_eventually_compact {α : Type*} {l : Filter α}
    {r : α → ℕ} {t : α → ℝ} {z0 : ℝ}
    (ht : Tendsto t l (𝓝 0)) (htpos : ∀ᶠ k in l, 0 < t k)
    (hz : Tendsto (fun k => coreCoordinate (r k) (t k)) l (𝓝 z0)) :
    ∀ᶠ k in l, 0 < r k ∧ Profile.u0 / 2 ≤ (r k : ℝ) * t k ∧
      (r k : ℝ) * t k ≤ 3 * Profile.u0 / 2 := by
  have hu0 := Profile.u0_pos
  have hu := core_scaled_argument_tendsto ht htpos hz
  have hi : Ioo (Profile.u0 / 2) (3 * Profile.u0 / 2) ∈ 𝓝 Profile.u0 :=
    Ioo_mem_nhds (by linarith) (by linarith)
  filter_upwards [htpos, hu.eventually hi] with k hk hki
  have hrR : (0 : ℝ) < r k := by nlinarith [hki.1]
  refine ⟨?_, hki.1.le, hki.2.le⟩
  exact_mod_cast hrR

theorem correctionError_tendsto {α : Type*} {l : Filter α}
    {r : α → ℕ} {t : α → ℝ} {z0 : ℝ}
    (ht : Tendsto t l (𝓝 0)) (htpos : ∀ᶠ k in l, 0 < t k)
    (hz : Tendsto (fun k => coreCoordinate (r k) (t k)) l (𝓝 z0)) :
    Tendsto (fun k => regularError (r k) (t k) - stirlingError (r k)) l (𝓝 0) := by
  have hu0 := Profile.u0_pos
  obtain ⟨C, _, hbound⟩ := correctionError_uniform
    (show 0 < Profile.u0 / 2 by positivity) (show 0 < 3 * Profile.u0 / 2 by positivity)
  have hcompact := core_eventually_compact ht htpos hz
  have hmajorant : ∀ᶠ k in l,
      |regularError (r k) (t k) - stirlingError (r k)| ≤ C * t k := by
    filter_upwards [htpos, hcompact] with k hk hkc
    exact hbound (r k) (t k) hkc.1 hk hkc.2.1 hkc.2.2
  have hC : Tendsto (fun _ : α => C) l (𝓝 C) := tendsto_const_nhds
  have hlim : Tendsto (fun k => C * t k) l (𝓝 0) := by
    simpa only [mul_zero] using hC.mul ht
  have habs := squeeze_zero' (Filter.Eventually.of_forall (fun k =>
    abs_nonneg (regularError (r k) (t k) - stirlingError (r k)))) hmajorant hlim
  rw [tendsto_zero_iff_norm_tendsto_zero]
  simpa only [Real.norm_eq_abs] using habs

theorem core_phase_tendsto {α : Type*} {l : Filter α}
    {r : α → ℕ} {t : α → ℝ} {z0 : ℝ}
    (ht : Tendsto t l (𝓝 0)) (htpos : ∀ᶠ k in l, 0 < t k)
    (hz : Tendsto (fun k => coreCoordinate (r k) (t k)) l (𝓝 z0)) :
    Tendsto (fun k => (Profile.Phi ((r k : ℝ) * t k) - Profile.A) / t k)
      l (𝓝 (-(3 / 2 : ℝ) * z0 ^ 2)) := by
  apply (Saddle.phase_scaled_tendsto ht htpos hz).congr'
  filter_upwards [htpos] with k hk
  rw [← coreCoordinate_identity (r k) hk]

theorem normalizedWeight_tendsto {α : Type*} {l : Filter α}
    {r : α → ℕ} {t : α → ℝ} {z0 : ℝ} (β : ℝ)
    (ht : Tendsto t l (𝓝 0)) (htpos : ∀ᶠ k in l, 0 < t k)
    (hz : Tendsto (fun k => coreCoordinate (r k) (t k)) l (𝓝 z0)) :
    Tendsto (fun k => normalizedWeight (r k) β (t k)) l
      (𝓝 (exp (-β * Profile.u0) / sqrt Real.pi * exp (-(3 / 2 : ℝ) * z0 ^ 2))) := by
  have hu := core_scaled_argument_tendsto ht htpos hz
  have hphase := core_phase_tendsto ht htpos hz
  have hβ : Tendsto (fun _ : α => β) l (𝓝 β) := tendsto_const_nhds
  have hexponent := hphase.sub (hβ.mul hu)
  have hnum := (Real.continuous_exp.tendsto _).comp hexponent
  have hden : Tendsto (fun k => productDenominator ((r k : ℝ) * t k))
      l (𝓝 Real.pi) := by
    simpa only [Function.comp_def, productDenominator_u0] using
      productDenominator_continuous.continuousAt.tendsto.comp hu
  have hsqrt := (Real.continuous_sqrt.tendsto Real.pi).comp hden
  have herror := correctionError_tendsto ht htpos hz
  have he := (Real.continuous_exp.tendsto 0).comp herror
  have hlim := (hnum.div hsqrt (Real.sqrt_pos.mpr Real.pi_pos).ne').mul he
  have hvalue :
      exp (-(3 / 2 : ℝ) * z0 ^ 2 - β * Profile.u0) / sqrt Real.pi * exp 0 =
        exp (-β * Profile.u0) / sqrt Real.pi * exp (-(3 / 2 : ℝ) * z0 ^ 2) := by
    rw [Real.exp_zero, mul_one,
      show -(3 / 2 : ℝ) * z0 ^ 2 - β * Profile.u0 =
        -β * Profile.u0 + -(3 / 2 : ℝ) * z0 ^ 2 by ring, Real.exp_add]
    ring
  rw [hvalue] at hlim
  apply hlim.congr'
  filter_upwards [htpos, core_eventually_compact ht htpos hz] with k hk hkc
  exact (normalizedWeight_correction_exact hkc.1 hk).symm

end LineSize.EulerKernel
