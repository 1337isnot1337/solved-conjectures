import Conjectures.LonelinessHyperplaneFourierAverage
import Mathlib.MeasureTheory.Integral.Bochner.ContinuousLinearMap

/-! A finite list of proper integer frequency relations contains every
velocity circle that fails to be uniformly dense in the torus kernel.
One continuous bump and all its translates give the uniform statement. -/

namespace Loneliness.Hyperplane

open MeasureTheory

noncomputable section

variable {ι : Type*} [Fintype ι]

/-- Outside finitely many additional rational hyperplanes, an integer
velocity circle comes within `ε` of every point in the actual torus kernel.
The same finite list works for every target point. -/
theorem exists_finite_frequency_dense_velocity
    (m : ι → ℤ) (hm : PrimitiveNormal m) (ε : ℝ) (hε : 0 < ε) :
    ∃ B : Finset (ι → ℤ),
      (∀ n ∈ B, ¬ ∃ c : ℤ, n = c • m) ∧
      ∀ (v : ι → ℤ) (hv : integerPairing m v = 0),
        (∀ n ∈ B, integerPairing n v ≠ 0) →
        ∀ x : torusRelationGroup m,
          ∃ t : UnitAddCircle, dist (integerVelocityInRelation m v hv t) x < ε := by
  classical
  let g : torusRelationGroup m → ℝ := fun x => max 0 (ε - ‖x‖)
  have hgcont : Continuous g :=
    continuous_const.max (continuous_const.sub continuous_norm)
  have hgint : Integrable g (relationHaar m) := by
    simpa only [IntegrableOn, Measure.restrict_univ] using
      (ContinuousOn.integrableOn_compact (μ := relationHaar m)
        isCompact_univ hgcont.continuousOn)
  have hgnonneg : 0 ≤ g := fun x => le_max_left _ _
  have hgzero : g 0 ≠ 0 := by
    simp only [g, norm_zero, sub_zero, max_eq_right hε.le]
    exact hε.ne'
  let a : ℝ := ∫ x : torusRelationGroup m, g x ∂relationHaar m
  have ha : 0 < a :=
    integral_pos_of_integrable_nonneg_nonzero hgcont hgint hgnonneg hgzero
  let f : C(torusRelationGroup m, ℂ) :=
    ⟨fun x => (g x : ℂ), Complex.continuous_ofReal.comp hgcont⟩
  have hfint : (∫ x : torusRelationGroup m, f x ∂relationHaar m) = (a : ℂ) :=
    integral_ofReal
  obtain ⟨B, hB, havg⟩ :=
    exists_finite_frequency_average_control m hm f (a / 2) (by linarith)
  refine ⟨B, hB, ?_⟩
  intro v hv havoid x
  by_contra h
  have hdist : ∀ t : UnitAddCircle, ε ≤ dist (integerVelocityInRelation m v hv t) x := by
    intro t
    exact le_of_not_gt (fun ht => h ⟨t, ht⟩)
  have hzero : ∀ t : UnitAddCircle, f (-x + integerVelocityInRelation m v hv t) = 0 := by
    intro t
    have hnorm : ε ≤ ‖-x + integerVelocityInRelation m v hv t‖ := by
      simpa only [dist_eq_norm, sub_eq_add_neg, add_comm] using hdist t
    change ((max 0 (ε - ‖-x + integerVelocityInRelation m v hv t‖) : ℝ) : ℂ) = 0
    rw [max_eq_left (by linarith), Complex.ofReal_zero]
  have hmean := havg v hv havoid (-x)
  have hvint : (∫ t : UnitAddCircle, f (-x + integerVelocityInRelation m v hv t)) = 0 := by
    simp only [hzero, integral_zero]
  rw [hvint, hfint] at hmean
  have hnorm : ‖(0 : ℂ) - (a : ℂ)‖ = a := by
    simp only [zero_sub, norm_neg, Complex.norm_real, Real.norm_eq_abs, abs_of_pos ha]
  rw [hnorm] at hmean
  linarith

end

end Loneliness.Hyperplane
