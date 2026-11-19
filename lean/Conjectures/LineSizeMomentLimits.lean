import Conjectures.LineSizeCoreLimit
import Conjectures.LineSizeEulerRiemann

/-! Limits of the actual finite geometric moments along a moving core index.
The Euler--Riemann errors are uniform only on a fixed compact interval for
`r * t`; convergence of the core coordinate supplies that interval. -/
noncomputable section
namespace LineSize.EulerKernel

open Real Set Filter MeasureTheory
open scoped Topology

private theorem tendsto_zero_of_eventually_abs_le {α : Type*} {l : Filter α}
    {e s : α → ℝ} (hs : Tendsto s l (𝓝 0))
    (hbound : ∀ᶠ k in l, |e k| ≤ s k) : Tendsto e l (𝓝 0) := by
  have habs := squeeze_zero'
    (Filter.Eventually.of_forall (fun k => abs_nonneg (e k))) hbound hs
  rw [tendsto_zero_iff_norm_tendsto_zero]
  simpa only [Real.norm_eq_abs] using habs

theorem weightedVariance_scaled_tendsto {α : Type*} {l : Filter α}
    {r : α → ℕ} {t : α → ℝ} {z0 : ℝ}
    (ht : Tendsto t l (𝓝 0)) (htpos : ∀ᶠ k in l, 0 < t k)
    (hz : Tendsto (fun k => coreCoordinate (r k) (t k)) l (𝓝 z0)) :
    Tendsto (fun k => t k ^ 3 * weightedVariance (r k) (t k)) l (𝓝 Profile.V0) := by
  have hu0 := Profile.u0_pos
  obtain ⟨C, _, hbound⟩ := weightedVariance_error_uniform
    (show 0 < 3 * Profile.u0 / 2 by positivity)
  have hcompact := core_eventually_compact ht htpos hz
  have ht1 : ∀ᶠ k in l, t k ≤ 1 :=
    (ht.eventually (eventually_lt_nhds (show (0 : ℝ) < 1 by norm_num))).mono
      (fun _ hk => hk.le)
  have hmajorant : ∀ᶠ k in l,
      |t k ^ 3 * weightedVariance (r k) (t k) - Profile.V ((r k : ℝ) * t k)|
        ≤ C * t k := by
    filter_upwards [htpos, ht1, hcompact] with k hk hk1 hkc
    exact hbound (r k) (t k) hk hk1 hkc.2.2
  have hC : Tendsto (fun _ : α => C) l (𝓝 C) := tendsto_const_nhds
  have he := tendsto_zero_of_eventually_abs_le
    (by simpa only [mul_zero] using hC.mul ht) hmajorant
  have hV : Tendsto (fun k => Profile.V ((r k : ℝ) * t k)) l (𝓝 Profile.V0) :=
    (Saddle.hasDerivAt_V Profile.u0_pos).continuousAt.tendsto.comp
      (core_scaled_argument_tendsto ht htpos hz)
  simpa only [sub_add_cancel, zero_add] using he.add hV

theorem weightedMean_scaled_error_tendsto {α : Type*} {l : Filter α}
    {r : α → ℕ} {t : α → ℝ} {z0 : ℝ}
    (ht : Tendsto t l (𝓝 0)) (htpos : ∀ᶠ k in l, 0 < t k)
    (hz : Tendsto (fun k => coreCoordinate (r k) (t k)) l (𝓝 z0)) :
    Tendsto (fun k =>
      (t k ^ 2 * weightedMean (r k) (t k) -
        (∫ x in 0..((r k : ℝ) * t k), Profile.meanKernel x)) / sqrt (t k))
      l (𝓝 0) := by
  have hu0 := Profile.u0_pos
  obtain ⟨C, _, hbound⟩ := weightedMean_error_uniform
    (show 0 < 3 * Profile.u0 / 2 by positivity)
  have hcompact := core_eventually_compact ht htpos hz
  have ht1 : ∀ᶠ k in l, t k ≤ 1 :=
    (ht.eventually (eventually_lt_nhds (show (0 : ℝ) < 1 by norm_num))).mono
      (fun _ hk => hk.le)
  have hmajorant : ∀ᶠ k in l,
      |(t k ^ 2 * weightedMean (r k) (t k) -
        (∫ x in 0..((r k : ℝ) * t k), Profile.meanKernel x)) / sqrt (t k)|
        ≤ C * sqrt (t k) := by
    filter_upwards [htpos, ht1, hcompact] with k hk hk1 hkc
    have hs : 0 < sqrt (t k) := Real.sqrt_pos.mpr hk
    rw [abs_div, abs_of_pos hs]
    calc
      _ ≤ (C * t k) / sqrt (t k) :=
        div_le_div_of_nonneg_right (hbound (r k) (t k) hk hk1 hkc.2.2) hs.le
      _ = C * sqrt (t k) := by rw [mul_div_assoc, Real.div_sqrt]
  have hC : Tendsto (fun _ : α => C) l (𝓝 C) := tendsto_const_nhds
  have hsqrt : Tendsto (fun k => sqrt (t k)) l (𝓝 0) := by
    simpa only [Real.sqrt_zero, Function.comp_def] using
      (Real.continuous_sqrt.tendsto 0).comp ht
  exact tendsto_zero_of_eventually_abs_le
    (by simpa only [mul_zero] using hC.mul hsqrt) hmajorant

private theorem centered_mean_algebra (R W J A β s t : ℝ)
    (hs : s ≠ 0) (hst : s ^ 2 = t) :
    t * s * (R ^ 2 + β * R + W - A / t ^ 2) =
      ((R * t) ^ 2 + J - A) / s + β * (R * t) * s + (t ^ 2 * W - J) / s := by
  subst t
  field_simp
  ring

theorem centeredMean_scaled_identity (r : ℕ) {t : ℝ} (ht : 0 < t) (β : ℝ) :
    t * sqrt t * ((r : ℝ) ^ 2 + β * (r : ℝ) + weightedMean r t - Profile.A / t ^ 2) =
      (Profile.M ((r : ℝ) * t) - Profile.A) / sqrt t +
        β * ((r : ℝ) * t) * sqrt t +
        (t ^ 2 * weightedMean r t -
          (∫ x in 0..((r : ℝ) * t), Profile.meanKernel x)) / sqrt t := by
  exact centered_mean_algebra (r : ℝ) (weightedMean r t)
    (∫ x in 0..((r : ℝ) * t), Profile.meanKernel x) Profile.A β (sqrt t) t
    (Real.sqrt_pos.mpr ht).ne' (Real.sq_sqrt ht.le)

theorem centeredMean_scaled_tendsto {α : Type*} {l : Filter α}
    {r : α → ℕ} {t : α → ℝ} {z0 : ℝ} (β : ℝ)
    (ht : Tendsto t l (𝓝 0)) (htpos : ∀ᶠ k in l, 0 < t k)
    (hz : Tendsto (fun k => coreCoordinate (r k) (t k)) l (𝓝 z0)) :
    Tendsto (fun k => t k * sqrt (t k) *
      ((r k : ℝ) ^ 2 + β * (r k : ℝ) + weightedMean (r k) (t k) - Profile.A / t k ^ 2))
      l (𝓝 (z0 * (3 * Profile.u0))) := by
  have hm : Tendsto
      (fun k => (Profile.M ((r k : ℝ) * t k) - Profile.A) / sqrt (t k))
      l (𝓝 (z0 * (3 * Profile.u0))) := by
    apply (Saddle.mean_scaled_tendsto ht htpos hz).congr'
    filter_upwards [htpos] with k hk
    rw [← coreCoordinate_identity (r k) hk]
  have hβ : Tendsto (fun _ : α => β) l (𝓝 β) := tendsto_const_nhds
  have hsqrt : Tendsto (fun k => sqrt (t k)) l (𝓝 0) := by
    simpa only [Real.sqrt_zero, Function.comp_def] using
      (Real.continuous_sqrt.tendsto 0).comp ht
  have hlinear : Tendsto (fun k => β * ((r k : ℝ) * t k) * sqrt (t k))
      l (𝓝 0) := by
    simpa only [mul_zero] using
      (hβ.mul (core_scaled_argument_tendsto ht htpos hz)).mul hsqrt
  have he := weightedMean_scaled_error_tendsto ht htpos hz
  have hlim := (hm.add hlinear).add he
  simp only [add_zero] at hlim
  apply hlim.congr'
  filter_upwards [htpos] with k hk
  exact (centeredMean_scaled_identity (r k) hk β).symm

end LineSize.EulerKernel
