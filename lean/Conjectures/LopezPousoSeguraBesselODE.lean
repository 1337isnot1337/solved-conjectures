import Conjectures.LopezPousoSeguraBesselMixture
open Set
namespace BesselWeights

theorem inverse_phase_strictConvex (H lam : ℝ → ℝ) (c : ℝ) (hc : 0 < c)
    (hlpos : ∀ t > 0, 0 < lam t)
    (hHpos : ∀ y > 0, 0 < H y)
    (hH : ∀ y > 0, DifferentiableAt ℝ H y)
    (hlam : ∀ t > 0, HasDerivAt lam (c*H (lam t)) t)
    (hconv : StrictConvexOn ℝ (Ioi 0) (fun y => H y^2)) :
    StrictConvexOn ℝ (Ioi 0) (fun t => c*H (lam t)) := by
  have hlamcont : ContinuousOn lam (Ioi 0) := by
    intro t ht
    exact (hlam t ht).continuousAt.continuousWithinAt
  have hlammono : StrictMonoOn lam (Ioi 0) := by
    apply strictMonoOn_of_deriv_pos (convex_Ioi 0) hlamcont
    intro t ht
    have ht' : 0 < t := interior_subset ht
    rw [(hlam t ht').deriv]
    exact mul_pos hc (hHpos (lam t) (hlpos t ht'))
  have hH2diff : ∀ y ∈ Ioi (0:ℝ), DifferentiableAt ℝ (fun y => H y^2) y := by
    intro y hy
    exact (hH y hy).pow 2
  have hH2mono := hconv.strictMonoOn_deriv hH2diff
  have hder (t : ℝ) (ht : 0 < t) :
      deriv (fun t => c*H (lam t)) t = c^2/2 * deriv (fun y => H y^2) (lam t) := by
    have hh := ((hH (lam t) (hlpos t ht)).hasDerivAt.comp t (hlam t ht)).const_mul c
    have h2 := ((hH (lam t) (hlpos t ht)).hasDerivAt.pow 2).deriv
    change HasDerivAt (fun t => c*H (lam t)) _ t at hh
    change deriv (fun y => H y^2) (lam t) = _ at h2
    rw [hh.deriv, h2]
    ring
  have hgcont : ContinuousOn (fun t => c*H (lam t)) (Ioi 0) := by
    intro t ht
    exact (((hH (lam t) (hlpos t ht)).continuousAt.comp (hlam t ht).continuousAt).const_mul c).continuousWithinAt
  apply StrictMonoOn.strictConvexOn_of_deriv (convex_Ioi 0) hgcont
  rw [interior_Ioi]
  intro x hx y hy hxy
  rw [hder x hx, hder y hy]
  apply mul_lt_mul_of_pos_left _ (by positivity)
  exact hH2mono (hlpos x hx) (hlpos y hy) (hlammono hx hy hxy)
end BesselWeights
