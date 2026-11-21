import Conjectures.LopezPousoSeguraBesselODE
open Set MeasureTheory
namespace BesselWeights

theorem strictConvex_extend_zero (g : ℝ → ℝ)
    (hc : ContinuousOn g (Ici 0))
    (hd : ∀ t > 0, DifferentiableAt ℝ g t)
    (hs : StrictConvexOn ℝ (Ioi 0) g) : StrictConvexOn ℝ (Ici 0) g := by
  apply StrictMonoOn.strictConvexOn_of_deriv (convex_Ici 0) hc
  rw [interior_Ici]
  exact hs.strictMonoOn_deriv (fun t ht => hd t ht)

theorem mixture_inverse_phase (H lam : ℝ → ℝ) (c : ℝ) (μ : Measure ℝ)
    (hc : 0 < c) (hμ : μ ≠ 0) (hpos : ∀ᵐ q ∂μ, 0 < q)
    (hI : ∀ y ∈ Ioi (0:ℝ), Integrable (fun q => kernel q y) μ)
    (hrep : ∀ y > 0, H y^2 = ∫ q, kernel q y ∂μ)
    (hlpos : ∀ t > 0, 0 < lam t) (hHpos : ∀ y > 0, 0 < H y)
    (hH : ∀ y > 0, DifferentiableAt ℝ H y)
    (hlam : ∀ t > 0, HasDerivAt lam (c*H (lam t)) t)
    (hend : ContinuousOn (fun t => c*H (lam t)) (Ici 0)) :
    StrictConvexOn ℝ (Ici 0) (fun t => c*H (lam t)) := by
  have hconv : StrictConvexOn ℝ (Ioi 0) (fun y => H y^2) :=
    (mixture_strictConvex μ hμ hpos hI).congr (fun y hy => (hrep y hy).symm)
  apply strictConvex_extend_zero _ hend
  · intro t ht
    exact (((hH (lam t) (hlpos t ht)).comp t (hlam t ht).differentiableAt).const_mul c)
  · exact inverse_phase_strictConvex H lam c hc hlpos hHpos hH hlam hconv

theorem signs_from_mixture (H lam : ℝ → ℝ) (c : ℝ) (μ : Measure ℝ)
    (hc : 0 < c) (hμ : μ ≠ 0) (hpos : ∀ᵐ q ∂μ, 0 < q)
    (hI : ∀ y ∈ Ioi (0:ℝ), Integrable (fun q => kernel q y) μ)
    (hrep : ∀ y > 0, H y^2 = ∫ q, kernel q y ∂μ)
    (hlpos : ∀ t > 0, 0 < lam t) (hHpos : ∀ y > 0, 0 < H y)
    (hH : ∀ y > 0, DifferentiableAt ℝ H y)
    (hld : ContinuousOn lam (Set.Ici 0)) (hd : ∀ t > 0, HasDerivAt lam (c*H (lam t)) t)
    (hend : ContinuousOn (fun t => c*H (lam t)) (Ici 0))
    (hg0 : c*H (lam 0)=0) (hl0 : lam 0=0) :
    (∀ n, 0 < C (fun t => c*H (lam t)) lam n) ∧
    StrictMono (C (fun t => c*H (lam t)) lam) ∧
    (∀ n, E (fun t => c*H (lam t)) lam n < 0) ∧
    StrictAnti (E (fun t => c*H (lam t)) lam) ∧
    (∀ n, 0 < sourceK (fun t => c*H (lam t)) lam n) ∧
    StrictMono (sourceK (fun t => c*H (lam t)) lam) := by
  let g : ℝ → ℝ := fun t => c*H (lam t)
  have hs := mixture_inverse_phase H lam c μ hc hμ hpos hI hrep hlpos hHpos hH hd hend
  have hsub (a b : ℝ) (ha : 0 ≤ a) (hab : a ≤ b) : Icc a b ⊆ Ici 0 := by
    intro x hx
    exact le_trans ha hx.1
  have hc1 : ∀ a : ℝ, 0 ≤ a → ContinuousOn g (Icc a (a+1)) := by
    intro a ha
    exact hend.mono (hsub a (a+1) ha (by linarith))
  have hs1 : ∀ a : ℝ, 0 ≤ a → StrictConvexOn ℝ (Icc a (a+1)) g := by
    intro a ha
    exact hs.subset (hsub a (a+1) ha (by linarith)) (convex_Icc a (a+1))
  have hc2 : ∀ a : ℝ, 0 ≤ a → ContinuousOn g (Icc a (a+2)) := by
    intro a ha
    exact hend.mono (hsub a (a+2) ha (by linarith))
  have hs2 : ∀ a : ℝ, 0 ≤ a → StrictConvexOn ℝ (Icc a (a+2)) g := by
    intro a ha
    exact hs.subset (hsub a (a+2) ha (by linarith)) (convex_Icc a (a+2))
  have hgp : ∀ n : ℕ, 0 < g (n+1) := by
    intro n
    exact mul_pos hc (hHpos _ (hlpos _ (by positivity)))
  have hC := c_increasing_and_positive g lam hg0 hl0 hc1 hs1 hld hd
  have hE := e_decreasing_and_negative g lam hl0 (hlpos 1 (by norm_num)) hc2 hs2 hld hd
  have hK := sourceK_positive_strictMono g lam hg0 hl0 hgp hc1 hs1 hld hd
  exact ⟨hC.1, hC.2, hE.1, hE.2, hK.1, hK.2⟩
end BesselWeights
