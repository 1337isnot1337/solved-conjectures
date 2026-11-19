import Conjectures.LineSizeSaddleGrid

/-! Dominated convergence for the actual normalized coefficient integral.
The Gaussian bound, measurability, short-core gap, and pointwise limit are
all discharged here for the literal generating-function factors. -/
noncomputable section
namespace LineSize.Geometric

open Real Set Filter MeasureTheory
open scoped Topology

def supportedIntegral (β t : ℝ) : ℂ :=
  ∫ y : ℝ, if |t * sqrt t * y| ≤ Real.pi then
    (sqrt t : ℂ) * ∑' r : ℕ, normalizedCoefficient r β t y else 0

theorem supportedIntegral_tendsto {α : Type*} {l : Filter α} [l.IsCountablyGenerated]
    {t : α → ℝ} {β : ℝ} (hβ : 0 ≤ β)
    (ht : Tendsto t l (𝓝 0)) (htpos : ∀ᶠ k in l, 0 < t k) :
    Tendsto (fun k => supportedIntegral β (t k)) l
      (𝓝 (((exp (-β * Profile.u0) / sqrt Real.pi *
        (2 * Real.pi / sqrt (6 * Profile.A))) : ℝ) : ℂ)) := by
  have hu0 := Profile.u0_pos
  let a : ℝ := Profile.u0 / 2
  let b : ℝ := (Profile.u0 - a) ^ 2
  have ha : 0 < a := by dsimp [a]; positivity
  have hau : a < Profile.u0 := by dsimp [a]; linarith
  have hb : 0 < b := sq_pos_of_pos (sub_pos.mpr hau)
  obtain ⟨C, hC, hbound⟩ := normalizedCoefficient_gaussian_bound
  have ht1 : ∀ᶠ k in l, t k ≤ 1 :=
    (ht.eventually (gt_mem_nhds (by norm_num : (0 : ℝ) < 1))).mono (fun _ hk => hk.le)
  have hsmall : ∀ᶠ k in l, t k ≤ a / 64 :=
    (ht.eventually (gt_mem_nhds (by positivity : (0 : ℝ) < a / 64))).mono
      (fun _ hk => hk.le)
  have hdata : ∀ᶠ k in l,
      0 < sqrt (t k) ∧ sqrt (t k) ≤ 1 ∧ 0 < t k ∧ t k ≤ a / 64 := by
    filter_upwards [htpos, ht1, hsmall] with k hk hk1 hks
    refine ⟨Real.sqrt_pos.mpr hk, ?_, hk, hks⟩
    simpa only [Real.sqrt_one] using Real.sqrt_le_sqrt hk1
  have hAm : ∀ᶠ k in l, ∀ r : ℕ, Measurable (normalizedCoefficient r β (t k)) := by
    filter_upwards [htpos] with k hk
    intro r
    exact (normalizedCoefficient_continuous r β hk).measurable
  have hA : ∀ᶠ k in l, ∀ r y, |t k * sqrt (t k) * y| ≤ Real.pi →
      ‖normalizedCoefficient r β (t k) y‖ ≤
        C * (1 + |saddleOrigin (t k) + sqrt (t k) * (r : ℝ)|) *
          exp (-(saddleOrigin (t k) + sqrt (t k) * (r : ℝ)) ^ 2) *
            Lattice.scaledMajorant r (t k) y := by
    filter_upwards [htpos, ht1] with k hk hk1
    intro r y _
    have h := hbound r β (t k) y hβ hk hk1
    rw [← EulerKernel.coreCoordinate_grid r hk] at h
    exact h
  have hgap : ∀ᶠ k in l, ∀ r : ℕ, (r : ℝ) * t k < a →
      b ≤ t k * (saddleOrigin (t k) + sqrt (t k) * (r : ℝ)) ^ 2 := by
    filter_upwards [htpos] with k hk
    intro r hr
    exact Lattice.normalized_small_core_gap hau hk hr
  have hlim : ∀ᵐ p : ℝ × ℝ ∂(volume.prod volume),
      Tendsto (fun k => Lattice.jointStep (sqrt (t k)) (saddleOrigin (t k)) (t k)
        (fun r => normalizedCoefficient r β (t k)) p) l (𝓝 (gaussianCoefficient β p)) :=
    ae_of_all _ (fun p => jointStep_tendsto β ht htpos p)
  have h := Lattice.scaled_sum_integral_tendsto hC.le ha hb hdata hAm hA hgap hlim
  rw [integral_gaussianCoefficient] at h
  exact h

end LineSize.Geometric
