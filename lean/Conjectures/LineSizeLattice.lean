import Conjectures.LineSizeLatticeGaussian

/-!
# Limits of scaled sums on shifted lattices

The convergence statements keep the coefficient limits explicit.  A shrinking
cell width and an origin tending to negative infinity do not, by themselves,
imply convergence of an arbitrary family of coefficient sequences.
-/

noncomputable section

open Set Filter MeasureTheory
open scoped Topology

namespace LineSize.Lattice

theorem leftEndpoint_tendsto {ι : Type*} {l : Filter ι} {h c : ι → ℝ}
    (hh : ∀ᶠ i in l, 0 < h i) (hlim : Tendsto h l (𝓝 0))
    (clim : Tendsto c l atBot) (x : ℝ) :
    Tendsto (fun i => leftEndpoint (h i) (c i) x) l (𝓝 x) := by
  have hc : ∀ᶠ i in l, c i ≤ x := (tendsto_atBot.1 clim) x
  have hlo : ∀ᶠ i in l, 0 ≤ x-leftEndpoint (h i) (c i) x := by
    filter_upwards [hh, hc] with i hi hci
    exact sub_nonneg.mpr (leftEndpoint_bounds hi hci).1
  have hhi : ∀ᶠ i in l, x-leftEndpoint (h i) (c i) x ≤ h i := by
    filter_upwards [hh, hc] with i hi hci
    linarith [(leftEndpoint_bounds hi hci).2]
  have hdiff : Tendsto (fun i => x-leftEndpoint (h i) (c i) x) l (𝓝 0) :=
    squeeze_zero' hlo hhi hlim
  have ht : Tendsto (fun i => x-(x-leftEndpoint (h i) (c i) x)) l (𝓝 (x-0)) :=
    tendsto_const_nhds.sub hdiff
  simpa only [sub_sub_cancel, sub_zero] using ht

theorem step_tendsto_of_grid_values {ι : Type*} {l : Filter ι} {h c : ι → ℝ}
    {A : ι → ℕ → ℂ} {x : ℝ} {z : ℂ} (clim : Tendsto c l atBot)
    (hA : Tendsto (fun i => A i ⌊(x-c i)/h i⌋₊) l (𝓝 z)) :
    Tendsto (fun i => step (h i) (c i) (A i) x) l (𝓝 z) := by
  apply Tendsto.congr' ?_ hA
  filter_upwards [(tendsto_atBot.1 clim) x] with i hci
  simp only [step, not_lt.mpr hci, ite_false]

theorem scaled_tsum_tendsto_of_dominated {ι : Type*} {l : Filter ι}
    [l.IsCountablyGenerated] {h c : ι → ℝ} {A : ι → ℕ → ℂ} {f : ℝ → ℂ}
    (hh : ∀ᶠ i in l, 0 < h i)
    (hA : ∀ᶠ i in l, Summable (fun r : ℕ => ‖A i r‖)) (bound : ℝ → ℝ)
    (hbound : ∀ᶠ i in l, ∀ᵐ x : ℝ, ‖step (h i) (c i) (A i) x‖ ≤ bound x)
    (hboundInt : Integrable bound)
    (hlim : ∀ᵐ x : ℝ, Tendsto (fun i => step (h i) (c i) (A i) x) l (𝓝 (f x))) :
    Tendsto (fun i => (h i : ℂ) * ∑' r : ℕ, A i r) l (𝓝 (∫ x : ℝ, f x)) := by
  have hm : ∀ᶠ i in l, AEStronglyMeasurable (step (h i) (c i) (A i)) :=
    Eventually.of_forall (fun i => (measurable_step (h i) (c i) (A i)).aestronglyMeasurable)
  have ht := tendsto_integral_filter_of_dominated_convergence bound hm hbound hboundInt hlim
  apply Tendsto.congr' ?_ ht
  filter_upwards [hh, hA] with i hi hAi
  exact integral_step hi (A i) hAi

theorem scaled_tsum_tendsto_of_gaussian_bound {ι : Type*} {l : Filter ι}
    [l.IsCountablyGenerated] {h c : ι → ℝ} {A : ι → ℕ → ℂ} {f : ℝ → ℂ}
    {C : ℝ} (hC : 0 ≤ C) (hh : ∀ᶠ i in l, 0 < h i ∧ h i ≤ 1)
    (hA : ∀ᶠ i in l, ∀ r : ℕ, ‖A i r‖ ≤
      C * (1+|c i+h i*(r:ℝ)|) * Real.exp (-(c i+h i*(r:ℝ))^2))
    (hlim : ∀ᵐ x : ℝ, Tendsto (fun i => step (h i) (c i) (A i) x) l (𝓝 (f x))) :
    Tendsto (fun i => (h i : ℂ) * ∑' r : ℕ, A i r) l (𝓝 (∫ x : ℝ, f x)) := by
  apply scaled_tsum_tendsto_of_dominated (hh.mono (fun _ hi => hi.1))
    (bound := gaussianEnvelope C)
  · filter_upwards [hh, hA] with i hi hAi
    exact summable_norm_of_gaussian_bound hi.1 hi.2 hC (A i) hAi
  · filter_upwards [hh, hA] with i hi hAi
    exact ae_of_all _ (step_norm_le_gaussianEnvelope hi.1 hi.2 hC (A i) hAi)
  · exact integrable_gaussianEnvelope C
  · exact hlim

theorem shifted_lattice_gaussian_limit {ι : Type*} {l : Filter ι}
    [l.IsCountablyGenerated] {h c : ι → ℝ} {A : ι → ℕ → ℂ} {f : ℝ → ℂ}
    {C : ℝ} (hC : 0 ≤ C) (hh : ∀ᶠ i in l, 0 < h i)
    (hlim : Tendsto h l (𝓝 0)) (clim : Tendsto c l atBot)
    (hA : ∀ᶠ i in l, ∀ r : ℕ, ‖A i r‖ ≤
      C * (1+|c i+h i*(r:ℝ)|) * Real.exp (-(c i+h i*(r:ℝ))^2))
    (hgrid : ∀ᵐ x : ℝ,
      Tendsto (fun i => A i ⌊(x-c i)/h i⌋₊) l (𝓝 (f x))) :
    Tendsto (fun i => (h i : ℂ) * ∑' r : ℕ, A i r) l (𝓝 (∫ x : ℝ, f x)) := by
  apply scaled_tsum_tendsto_of_gaussian_bound hC (hA := hA)
  · have hs : ∀ᶠ i in l, h i < 1 :=
      hlim.eventually (eventually_lt_nhds (show (0 : ℝ) < 1 by norm_num))
    filter_upwards [hh, hs] with i hi hsi
    exact ⟨hi, hsi.le⟩
  · filter_upwards [hgrid] with x hx
    exact step_tendsto_of_grid_values clim hx

end LineSize.Lattice
