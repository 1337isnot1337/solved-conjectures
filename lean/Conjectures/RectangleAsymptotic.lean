import Conjectures.RectangleUniformUpper
import Conjectures.RectangleUniformLower
import Conjectures.RectangleUniformReservations
import Conjectures.RectangleLimitConstant
import Conjectures.RectangleContinuous

/-! The growing-rectangle logarithmic asymptotic, uniform over every width
at least the height. The count permits arbitrary real tile positions and
identifies rotations and arrangements of the same block multiset. -/

namespace RectangleAsymptotics

open Filter
open scoped Topology

theorem uniform_lower {ε : ℝ} (hε : 0 < ε) :
    ∀ᶠ h : ℕ in atTop,∀ w : ℕ,h ≤ w →
      (2*Real.sqrt RectangleEuler.basel-ε)*scale h w ≤
        Real.log (RectanglePartitions.rectangleCount h w : ℝ) :=
  uniform_lower_of_reservations uniform_reservation_estimates hε

theorem grid_log_asymptotic :
    Tendsto (fun p : ℕ × ℕ =>
      Real.log (RectanglePartitions.rectangleCount p.1 p.2 : ℝ)/scale p.1 p.2)
      RectangleUniform.regime (𝓝 (Real.pi*Real.sqrt (2/3 : ℝ))) := by
  rw [←RectangleEuler.twice_sqrt_basel]
  apply RectangleUniform.ratio_tendsto
    (fun p : ℕ × ℕ => Real.log (RectanglePartitions.rectangleCount p.1 p.2 : ℝ))
    (fun p => scale p.1 p.2) (2*Real.sqrt RectangleEuler.basel)
  · filter_upwards [RectangleUniform.fst_tendsto.eventually (eventually_ge_atTop 2),
      RectangleUniform.ordered_eventually] with p hp hw
    exact scale_pos hp hw
  · intro ε hε
    exact (RectangleUniform.eventually_regime_iff _).2 (uniform_lower hε)
  · intro ε hε
    exact (RectangleUniform.eventually_regime_iff _).2 (uniform_upper hε)

/-- The theorem for finite tilings with arbitrary real positions. -/
theorem rectangle_log_asymptotic :
    Tendsto (fun p : ℕ × ℕ =>
      Real.log (RectanglePartitions.realRectangleCount p.1 p.2 : ℝ)/scale p.1 p.2)
      RectangleUniform.regime (𝓝 (Real.pi*Real.sqrt (2/3 : ℝ))) := by
  simpa only [RectanglePartitions.realRectangleCount_eq] using grid_log_asymptotic

/-- One height threshold works for all larger heights and every width w >= h. -/
theorem uniform_log_asymptotic {ε : ℝ} (hε : 0 < ε) :
    ∃ H : ℕ,2 ≤ H ∧ ∀ h : ℕ,H ≤ h → ∀ w : ℕ,h ≤ w →
      |Real.log (RectanglePartitions.realRectangleCount h w : ℝ)/scale h w -
        Real.pi*Real.sqrt (2/3 : ℝ)| < ε := by
  have he := (Metric.tendsto_nhds.mp rectangle_log_asymptotic) ε hε
  simp only [Real.dist_eq] at he
  have hh := (RectangleUniform.eventually_regime_iff _).1 he
  obtain ⟨H,hH⟩ := eventually_atTop.mp hh
  refine ⟨max H 2,le_max_right _ _,?_⟩
  intro h hh w hw
  exact hH h ((le_max_left _ _).trans hh) w hw

/-- Every sequence or filtered family of growing shorter sides has the same limit. -/
theorem rectangle_log_asymptotic_along {ι : Type*} {l : Filter ι}
    (h w : ι → ℕ) (hh : Tendsto h l atTop) (hw : ∀ᶠ x in l,h x ≤ w x) :
    Tendsto (fun x => Real.log (RectanglePartitions.realRectangleCount (h x) (w x) : ℝ)/
      scale (h x) (w x)) l (𝓝 (Real.pi*Real.sqrt (2/3 : ℝ))) := by
  apply Metric.tendsto_nhds.mpr
  intro ε hε
  obtain ⟨H,_hH,hbound⟩ := uniform_log_asymptotic hε
  filter_upwards [hh.eventually (eventually_ge_atTop H),hw] with x hx horder
  simpa only [Real.dist_eq] using hbound (h x) hx (w x) horder

end RectangleAsymptotics
