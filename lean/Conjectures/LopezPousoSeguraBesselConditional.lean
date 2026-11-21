import Conjectures.LopezPousoSeguraBesselGrowth
open Filter MeasureTheory
open scoped Topology
namespace BesselWeights

theorem conditional_bessel_weight_conjectures (H lam : ℝ → ℝ) (c : ℝ) (μ : Measure ℝ) [IsFiniteMeasure μ]
    (δ err t : ℕ → ℝ) (B K : ℝ)
    (hc : 0 < c) (hμ : μ ≠ 0) (hpos : ∀ᵐ q ∂μ, 0 < q)
    (hrep : ∀ y > 0, H y^2 = ∫ q, kernel q y ∂μ)
    (hlpos : ∀ t > 0, 0 < lam t) (hHpos : ∀ y > 0, 0 < H y)
    (hH : ∀ y > 0, DifferentiableAt ℝ H y)
    (hld : ContinuousOn lam (Set.Ici 0)) (hd : ∀ t > 0, HasDerivAt lam (c*H (lam t)) t)
    (hend : ContinuousOn (fun t => c*H (lam t)) (Set.Ici 0))
    (hg0 : c*H (lam 0)=0) (hl0 : lam 0=0)
    (hB : 0 ≤ B) (hδ0 : Tendsto δ atTop (𝓝 0)) (he0 : Tendsto err atTop (𝓝 0))
    (hδ : ∀ᶠ (n : ℕ) in atTop, ‖δ n‖ ≤ K/((n:ℝ)+1)^3)
    (he : ∀ᶠ (n : ℕ) in atTop, |err n| ≤ B/((n:ℝ)+1)^2)
    (ha : ∀ n : ℕ, (c*H (lam (n+1)))/4 = referenceWeight n+δ n)
    (hl : ∀ n : ℕ, lam (n+1) = referenceLambda n+err n)
    (ht : Tendsto t atTop (𝓝 0)) (htpos : ∀ᶠ n in atTop, 0 < t n)
    (hmain : Tendsto (fun n => (∑' k, (referenceWeight k+δ k)/(1+(referenceLambda k+err k)*t n)^2)-1/(4*t n)) atTop (𝓝 0))
    (href : Tendsto (fun n => (∑' k, referenceWeight k/(1+referenceLambda k*t n)^2)-1/(4*t n)) atTop (𝓝 (-1/16+Real.pi^2/192))) :
    (∀ n, 0 < C (fun t => c*H (lam t)) lam n) ∧
    StrictMono (C (fun t => c*H (lam t)) lam) ∧
    (∀ n, E (fun t => c*H (lam t)) lam n < 0) ∧
    StrictAnti (E (fun t => c*H (lam t)) lam) ∧
    (∀ n, 0 < sourceK (fun t => c*H (lam t)) lam n) ∧
    StrictMono (sourceK (fun t => c*H (lam t)) lam) ∧
    Tendsto (C (fun t => c*H (lam t)) lam) atTop (𝓝 (Real.pi^2/12)) ∧
    Tendsto (E (fun t => c*H (lam t)) lam) atTop (𝓝 (-(Real.pi^2)/6)) ∧
    Tendsto (sourceK (fun t => c*H (lam t)) lam) atTop (𝓝 (Real.pi^2/12)) := by
  let g : ℝ → ℝ := fun t => c*H (lam t)
  have hsign := signs_from_finite_mixture H lam c μ hc hμ hpos hrep hlpos hHpos hH hld hd hend hg0 hl0
  have hgp : ∀ n : ℕ, 0 < g (n+1) := by
    intro n
    exact mul_pos hc (hHpos _ (hlpos _ (by positivity)))
  have hr : ∀ n : ℕ, 0 < lam (n+1) := by
    intro n
    exact hlpos _ (by positivity)
  have hlimit := all_limits_from_source_resolvents g lam δ err t B K hB hδ0 he0 hgp hr hδ he ha hl ht htpos hmain href
  exact ⟨hsign.1, hsign.2.1, hsign.2.2.1, hsign.2.2.2.1, hsign.2.2.2.2.1,
    hsign.2.2.2.2.2, hlimit.1, hlimit.2.1, hlimit.2.2⟩
end BesselWeights
