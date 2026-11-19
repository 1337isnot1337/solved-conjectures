import Conjectures.RectangleAsymptoticUpper
import Conjectures.RectangleUniformFilter
import Conjectures.RectangleParameterBounds

/-! The full uniform upper half of the growing-rectangle asymptotic. -/
namespace RectangleAsymptotics

open Filter
open scoped Topology

/-- The upper estimate is uniform in every width w >= h. -/
theorem uniform_upper {ε : ℝ} (hε : 0 < ε) :
    ∀ᶠ h : ℕ in atTop, ∀ w : ℕ, h ≤ w →
      Real.log (RectanglePartitions.rectangleCount h w : ℝ) ≤
        (2*Real.sqrt RectangleEuler.basel+ε)*scale h w := by
  apply (RectangleUniform.eventually_regime_iff (fun p =>
    Real.log (RectanglePartitions.rectangleCount p.1 p.2 : ℝ) ≤
      (2*Real.sqrt RectangleEuler.basel+ε)*scale p.1 p.2)).1
  have hp := RectangleUniform.fst_tendsto.eventually (eventually_ge_atTop 2)
  have hwpos := RectangleUniform.snd_tendsto.eventually (eventually_gt_atTop 0)
  have hheight := RectangleAsymptoticUpper.eventually_height_upper
    (fun p : ℕ × ℕ => p.1) (fun p => p.2) RectangleUniform.fst_tendsto hwpos hε
  have harea := RectangleAsymptoticUpper.eventually_unrestricted_upper
    (fun p : ℕ × ℕ => p.1) (fun p => p.2) RectangleUniform.area_tendsto
    (show 0 < ε/2 by linarith)
  filter_upwards [hp,RectangleUniform.ordered_eventually,hheight,harea] with p hph hpw hH hA
  rcases p with ⟨h,w⟩
  dsimp only at hph hpw hH hA ⊢
  by_cases hc : (h : ℝ) ≤ (area h w)^(1/4 : ℝ)
  · rw [scale_eq_height hc]
    exact hH
  · have hq : (area h w)^(1/4 : ℝ) ≤ h := le_of_lt (lt_of_not_ge hc)
    rw [scale_eq_quarter (by omega) hpw hq]
    convert hA using 1 <;> dsimp only [area] <;> ring

end RectangleAsymptotics
