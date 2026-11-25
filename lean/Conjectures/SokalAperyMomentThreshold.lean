import Conjectures.SokalAperyEndpoint
import Conjectures.SokalAperyLegendre
import Conjectures.SokalAperyTorus
import Mathlib.MeasureTheory.Measure.Lebesgue.Basic

/-! Checked components of the excluded-interval proof and two direct Stieltjes obstructions. -/

namespace SokalApery

/-- A subinterval adjacent to zero and the exceptional parameter are excluded. -/
theorem not_stieltjes_on_checked_parameters {x : ℝ}
    (hx : x ∈ Set.Ioc (0 : ℝ) (1 / 40) ∪ {(1 / 4 : ℝ)}) :
    ¬ IsStieltjes (apery x) := by
  rcases hx with hx | hx
  · exact not_stieltjes_of_small_parameter hx.1 hx.2
  · have he : x = 1 / 4 := hx
    simpa only [he] using not_stieltjes_at_quarter

open Set Filter Complex MeasureTheory
open scoped Topology

/-- For a lower endpoint inside the cut, the local half-transform identification
already contradicts a Stieltjes representation. -/
theorem not_stieltjes_of_lower_endpoint_germ {μ : Measure ℝ} [IsFiniteMeasure μ]
    {a : ℕ → ℝ} {b : ℝ} (hb : b ∈ Ioo (-1 : ℝ) 1)
    (hμ : ∀ᵐ t ∂μ, b ≤ t) (hpos : ∀ s > b, μ (Iic s) ≠ 0)
    (hg : ∀ ν, Represents ν a → ∃ w : ℂ, 0 < w.im ∧
      halfTransform μ =ᶠ[𝓝 w] pulledBackMoment ν) :
    ¬ IsStieltjes a := by
  rintro ⟨ν, hν⟩
  obtain ⟨w, hw, hG⟩ := hg ν hν
  exact halfTransform_no_extension_at_lower_endpoint hμ hpos
    (halfTransform_extends_of_germ hν hw hG hb)

private def angleBox : Set (ℝ × ℝ) :=
  Icc (-Real.pi / 2) (3 * Real.pi / 2) ×ˢ Icc (-Real.pi / 2) (3 * Real.pi / 2)

private theorem angleBox_measurable : MeasurableSet angleBox :=
  measurableSet_Icc.prod measurableSet_Icc

private theorem angleBox_compact : IsCompact angleBox := isCompact_Icc.prod isCompact_Icc

private theorem continuous_torus_pair (r : ℝ) : Continuous (fun p : ℝ × ℝ => torus r p.1 p.2) := by
  unfold torus
  fun_prop

/-- The distribution of the torus argument under the normalized area measure
on a square of side two pi. -/
noncomputable def torusMeasure (r : ℝ) : Measure ℝ :=
  ENNReal.ofReal (((2 * Real.pi) ^ 2)⁻¹) •
    Measure.map (fun p : ℝ × ℝ => torus r p.1 p.2) (volume.restrict angleBox)

instance (r : ℝ) : IsFiniteMeasure (torusMeasure r) := by
  let : IsFiniteMeasure (volume.restrict angleBox) :=
    isFiniteMeasure_restrict.mpr angleBox_compact.measure_lt_top.ne
  let := (volume.restrict angleBox).isFiniteMeasure_map (f := fun p => torus r p.1 p.2)
  refine ⟨?_⟩
  rw [torusMeasure, Measure.smul_apply, smul_eq_mul]
  exact ENNReal.mul_lt_top ENNReal.ofReal_lt_top (measure_lt_top _ _)

theorem torusMeasure_lower_of_le_half {r : ℝ} (hr : 0 ≤ r) (hr' : r ≤ 1 / 2) :
    ∀ᵐ t ∂torusMeasure r, saddleValue r ≤ t := by
  apply ae_iff.mpr
  rw [show {t : ℝ | ¬ saddleValue r ≤ t} = Iio (saddleValue r) by ext t; simp,
    torusMeasure, Measure.smul_apply, smul_eq_mul,
    Measure.map_apply (continuous_torus_pair r).measurable measurableSet_Iio]
  have he : (fun p : ℝ × ℝ => torus r p.1 p.2) ⁻¹' Iio (saddleValue r) = ∅ := by
    apply eq_empty_iff_forall_notMem.mpr
    intro p hp
    exact (not_lt_of_ge (torus_min_of_le_half hr hr' p.1 p.2)) hp
  simp [he]

theorem torusMeasure_pos_below {r s : ℝ} (hs : saddleValue r < s) :
    torusMeasure r (Iic s) ≠ 0 := by
  let U := {p : ℝ × ℝ | torus r p.1 p.2 < s} ∩
    (Ioo (-Real.pi / 2) (3 * Real.pi / 2) ×ˢ Ioo (-Real.pi / 2) (3 * Real.pi / 2))
  have hU : IsOpen U := (isOpen_lt (continuous_torus_pair r) continuous_const).inter
    (isOpen_Ioo.prod isOpen_Ioo)
  have hne : U.Nonempty := by
    refine ⟨(0, Real.pi), ?_⟩
    exact ⟨by simpa only [mem_ofPred_eq, torus_at_zero_pi] using hs,
      ⟨⟨by linarith [Real.pi_pos], by linarith [Real.pi_pos]⟩,
       ⟨by linarith [Real.pi_pos], by linarith [Real.pi_pos]⟩⟩⟩
  rw [torusMeasure, Measure.smul_apply, smul_eq_mul, Measure.map_apply
      (continuous_torus_pair r).measurable measurableSet_Iic,
      Measure.restrict_apply ((continuous_torus_pair r).measurable measurableSet_Iic)]
  have hsub : U ⊆ (fun p : ℝ × ℝ => torus r p.1 p.2) ⁻¹' Iic s ∩ angleBox := by
    intro p hp
    exact ⟨(show torus r p.1 p.2 < s from hp.1).le,
      ⟨⟨hp.2.1.1.le, hp.2.1.2.le⟩, ⟨hp.2.2.1.le, hp.2.2.2.le⟩⟩⟩
  exact mul_ne_zero (ENNReal.ofReal_ne_zero_iff.mpr (by positivity))
    ((hU.measure_pos volume hne).trans_le (measure_mono hsub)).ne'

/-- Below one quarter the germ identification for the actual torus measure
suffices to exclude a Stieltjes representation. -/
theorem not_stieltjes_of_torus_germ_below_quarter {r : ℝ} (hr : 0 < r) (hr' : r < 1 / 2)
    (hg : ∀ ν, Represents ν (apery (r ^ 2)) → ∃ w : ℂ, 0 < w.im ∧
      halfTransform (torusMeasure r) =ᶠ[𝓝 w] pulledBackMoment ν) :
    ¬ IsStieltjes (apery (r ^ 2)) :=
  not_stieltjes_of_lower_endpoint_germ
    (saddleValue_mem_Ioo hr (by linarith) hr'.ne)
    (torusMeasure_lower_of_le_half hr.le hr'.le) (fun _ hs => torusMeasure_pos_below hs) hg

end SokalApery
