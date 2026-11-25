import Conjectures.OrdinaryDarcaisFinite
import Conjectures.OrdinaryDarcaisCentral

/-! The link between the normalized Fourier bounds and a Turán comparison. -/

namespace OrdinaryDarcais

open Real
open scoped Interval

/-- Undo `u = t √V` and apply the centered-difference identity. The identity,
pointwise phase and damping bounds, and tail estimate are hypotheses. -/
theorem strictTuran_of_fourier_bounds {x r c V : ℝ} {n : ℕ} {A θ : ℝ → ℝ}
    (hx : 0 < x) (hr : 0 < r) (hc : 0 < c) (hn : 0 < n) (hV : 501 ≤ V)
    (hAcont : Continuous A) (hθcont : Continuous θ)
    (hA : ∀ u ∈ Set.Icc (0 : ℝ) 2, A (u / sqrt V) ≤ u ^ 2 / 2)
    (hθ : ∀ u ∈ Set.Icc (0 : ℝ) (11 / 4), |θ (u / sqrt V)| ≤ (7 / 16) * u ^ 3 / 6)
    (htail : -(19 / 50 : ℝ) ≤
      ∫ u in (11 / 4 : ℝ)..(π * sqrt V), normalizedIntegrand V A θ u)
    (hinv : c * r ^ n * darcais x n -
      (c * r ^ (n - 1) * darcais x (n - 1) + c * r ^ (n + 1) * darcais x (n + 1)) / 2 =
      π⁻¹ * (∫ t in (0 : ℝ)..π, (1 - cos t) * exp (-A t) * cos (θ t))) :
    darcais x (n - 1) * darcais x (n + 1) < darcais x n ^ 2 := by
  have hnormalized := normalized_fourier_pos_of_tail hV hAcont hθcont hA hθ htail
  let f (t : ℝ) := (1 - cos t) * exp (-A t) * cos (θ t)
  have hV₀ : 0 < V := by linarith
  have hs : 0 < sqrt V := sqrt_pos.mpr hV₀
  have hchange : (∫ u in (0 : ℝ)..(π * sqrt V), f (u / sqrt V)) =
      sqrt V * ∫ t in (0 : ℝ)..π, f t := by
    rw [intervalIntegral.integral_comp_div f hs.ne']
    simp [hs.ne', smul_eq_mul]
  simp_rw [show normalizedIntegrand V A θ = fun u => V * f (u / sqrt V) by
    funext u; unfold normalizedIntegrand f; ring] at hnormalized
  rw [intervalIntegral.integral_const_mul, hchange, ← mul_assoc] at hnormalized
  have hpos : 0 < ∫ t in (0 : ℝ)..π, f t :=
    pos_of_mul_pos_right hnormalized (mul_nonneg hV₀.le hs.le)
  apply strictTuran_of_tilted_center hx hr hc hn
  apply sub_pos.mp
  rw [hinv]
  exact mul_pos (inv_pos.mpr pi_pos) hpos

end OrdinaryDarcais
