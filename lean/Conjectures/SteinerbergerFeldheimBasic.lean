import Mathlib.MeasureTheory.Integral.IntegralEqImproper
import Mathlib.Analysis.SpecialFunctions.ExpDeriv
import Mathlib.MeasureTheory.Measure.WithDensity
import Mathlib.Tactic.FunProp
import Mathlib.Tactic.Linarith
import Mathlib.Tactic.Positivity
import Mathlib.Tactic.Ring

/-!
# Steinerberger's quantitative Feldheim-tail conjecture

The probability law in `results/steinerberger-feldheim-tail/PROOF.md` has
survival function `exp (-x - x^2/200)` on the nonnegative half-line.  This
file constructs that law and proves its normalization and exact tails.
The quantitative estimates and the product-event calculation are separate.

The conjectures were proposed by Stefan Steinerberger.  The recorded
counterexample and its provenance are documented in the existing entry;
this formalization does not assert an independent priority claim.
-/

open MeasureTheory Set Filter
open scoped ENNReal Topology

namespace SteinerbergerFeldheim

noncomputable section

/-- The survival function of the recorded counterexample, for `x ≥ 0`. -/
def survival (x : ℝ) : ℝ := Real.exp (-x - x ^ 2 / 200)

/-- Its density on the nonnegative half-line. -/
def density (x : ℝ) : ℝ := (1 + x / 100) * survival x

@[simp] theorem survival_zero : survival 0 = 1 := by simp [survival]

theorem survival_pos (x : ℝ) : 0 < survival x := Real.exp_pos _

theorem density_pos {x : ℝ} (hx : 0 ≤ x) : 0 < density x := by
  exact mul_pos (by positivity) (survival_pos x)

theorem continuous_survival : Continuous survival := by unfold survival; fun_prop

theorem continuous_density : Continuous density := by
  unfold density
  exact (continuous_const.add (continuous_id.div_const 100)).mul continuous_survival

theorem contDiff_density (n : WithTop ℕ∞) : ContDiff ℝ n density := by
  unfold density survival
  fun_prop

theorem survival_strictAntiOn : StrictAntiOn survival (Ici (0 : ℝ)) := by
  intro x hx y hy hxy
  apply Real.exp_lt_exp.mpr
  have hsq : x ^ 2 ≤ y ^ 2 := (sq_le_sq₀ hx hy).mpr hxy.le
  nlinarith

theorem hasDerivAt_survival (x : ℝ) : HasDerivAt survival (-density x) x := by
  convert (((hasDerivAt_id x).neg.sub ((hasDerivAt_id x).pow 2 |>.div_const 200)).exp)
    using 1
  · funext y
    rfl
  · dsimp [density, survival]
    ring

theorem hasDerivAt_neg_survival (x : ℝ) :
    HasDerivAt (fun y => -survival y) (density x) x := by
  convert (hasDerivAt_survival x).neg using 1
  simp

theorem survival_le_exp_neg (x : ℝ) : survival x ≤ Real.exp (-x) := by
  apply Real.exp_le_exp.mpr
  nlinarith [sq_nonneg x]

theorem tendsto_survival_zero : Tendsto survival atTop (𝓝 0) := by
  exact squeeze_zero (fun x => (survival_pos x).le) survival_le_exp_neg
    Real.tendsto_exp_neg_atTop_nhds_zero

theorem integrableOn_density {a : ℝ} (ha : 0 ≤ a) : IntegrableOn density (Ioi a) := by
  apply integrableOn_Ioi_deriv_of_nonneg' (g := fun x => -survival x)
    (l := 0) (fun x _ => hasDerivAt_neg_survival x)
  · intro x hx
    exact (density_pos (ha.trans hx.le)).le
  · simpa only [neg_zero] using tendsto_survival_zero.neg

theorem integral_density_tail {a : ℝ} (ha : 0 ≤ a) :
    ∫ x in Ioi a, density x = survival a := by
  have h := integral_Ioi_of_hasDerivAt_of_tendsto'
    (f := fun x => -survival x) (m := 0)
    (fun x (_ : x ∈ Ici a) => hasDerivAt_neg_survival x)
    (integrableOn_density ha) (by simpa only [neg_zero] using tendsto_survival_zero.neg)
  simpa only [zero_sub, neg_neg] using h

/-- The actual probability measure, rather than a scalar surrogate for its tails. -/
def law : Measure ℝ :=
  (volume.restrict (Ioi 0)).withDensity (fun x => ENNReal.ofReal (density x))

theorem lintegral_density_tail {a : ℝ} (ha : 0 ≤ a) :
    ∫⁻ x in Ioi a, ENNReal.ofReal (density x) = ENNReal.ofReal (survival a) := by
  rw [← ofReal_integral_eq_lintegral_ofReal (integrableOn_density ha),
    integral_density_tail ha]
  filter_upwards [ae_restrict_mem measurableSet_Ioi] with x hx
  exact (density_pos (ha.trans hx.le)).le

instance law_isProbabilityMeasure : IsProbabilityMeasure law := by
  constructor
  simp only [law, withDensity_apply _ MeasurableSet.univ, Measure.restrict_univ]
  simpa using lintegral_density_tail (a := 0) le_rfl

instance law_nullSingletonClass : NullSingletonClass law := by
  unfold law
  infer_instance

theorem law_absolutelyContinuous : law ≪ volume :=
  (withDensity_absolutelyContinuous _ _).trans Measure.absolutelyContinuous_restrict

theorem law_Ioi {a : ℝ} (ha : 0 ≤ a) :
    law (Ioi a) = ENNReal.ofReal (survival a) := by
  rw [law, withDensity_apply _ measurableSet_Ioi,
    Measure.restrict_restrict_of_subset (Ioi_subset_Ioi ha)]
  exact lintegral_density_tail ha

theorem law_Ici {a : ℝ} (ha : 0 ≤ a) :
    law (Ici a) = ENNReal.ofReal (survival a) := by
  rw [← measure_congr (Ioi_ae_eq_Ici (μ := law))]
  exact law_Ioi ha

theorem law_real_Ici {a : ℝ} (ha : 0 ≤ a) :
    law.real (Ici a) = survival a := by
  rw [Measure.real, law_Ici ha, ENNReal.toReal_ofReal (survival_pos a).le]

theorem law_real_Ioi {a : ℝ} (ha : 0 ≤ a) :
    law.real (Ioi a) = survival a := by
  rw [Measure.real, law_Ioi ha, ENNReal.toReal_ofReal (survival_pos a).le]

theorem law_positive_ae : ∀ᵐ x ∂law, 0 < x := by
  exact (withDensity_absolutelyContinuous _ _).ae_le (ae_restrict_mem measurableSet_Ioi)

theorem law_Iic_of_nonpos {a : ℝ} (ha : a ≤ 0) : law (Iic a) = 0 := by
  apply measure_mono_null (Iic_subset_Iic.mpr ha)
  have h := ae_iff.mp law_positive_ae
  convert h using 1
  congr 1
  ext x
  simp

theorem law_nonnegative_ae : ∀ᵐ x ∂law, 0 ≤ x :=
  law_positive_ae.mono fun _ hx => hx.le

/-- No bounded interval contains the support of the law. -/
theorem law_unbounded (a : ℝ) : 0 < law (Ioi a) := by
  by_cases ha : 0 ≤ a
  · rw [law_Ioi ha]
    exact ENNReal.ofReal_pos.mpr (survival_pos a)
  · have hsub : Ioi (0 : ℝ) ⊆ Ioi a := Ioi_subset_Ioi (le_of_not_ge ha)
    have hzero : law (Ioi 0) = 1 := by simp [law_Ioi (a := 0) le_rfl]
    exact lt_of_lt_of_le (hzero ▸ (zero_lt_one : (0 : ℝ≥0∞) < 1)) (measure_mono hsub)

end
end SteinerbergerFeldheim
