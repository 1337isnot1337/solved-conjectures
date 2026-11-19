import Conjectures.LonelinessHyperplaneProbability
import Conjectures.LonelinessHyperplaneHaarValue
import Mathlib.Topology.Order.Compact
import Mathlib.MeasureTheory.Measure.Module

/-! Independent Haar shifts and uniformly sampled integer velocities.
The law is the literal finite mixture of the Haar pushforwards of the
actual velocity maxima. A CDF comparison with the exact hyperplane
profile proves the limiting distribution at every real threshold. -/

namespace Loneliness.Hyperplane

open MeasureTheory Filter
open scoped BigOperators Topology ENNReal

noncomputable section

variable {ι : Type*} [Fintype ι] [DecidableEq ι] [Nonempty ι]

local instance circleVolume_isProbabilityMeasure :
    IsProbabilityMeasure (volume : Measure UnitAddCircle) :=
  ⟨UnitAddCircle.measure_univ⟩

theorem continuous_torusPointClearance :
    Continuous (torusPointClearance (ι := ι)) := by
  unfold torusPointClearance
  exact Continuous.finset_inf'_apply Finset.univ_nonempty
    (fun i _ => (continuous_apply i).norm)

theorem continuous_torusVelocityValue (v : ι → ℤ) :
    Continuous (torusVelocityValue v) := by
  have hf : Continuous (fun p : (ι → UnitAddCircle) × UnitAddCircle =>
      torusPointClearance (p.1 + fun i => v i • p.2)) := by
    apply continuous_torusPointClearance.comp
    exact continuous_fst.add (continuous_pi
      (fun i => (continuous_zsmul (v i)).comp continuous_snd))
  have hc := (isCompact_univ : IsCompact (Set.univ : Set UnitAddCircle)).continuous_sSup
    (f := fun (s : ι → UnitAddCircle) (t : UnitAddCircle) =>
      torusPointClearance (s + fun i => v i • t)) hf
  simpa only [torusVelocityValue, Set.image_univ] using hc

def haarProfileCDF (m : ι → ℤ) (u : ℝ) : ℝ :=
  (volume : Measure (ι → UnitAddCircle)).real {s | torusPredictedValue m s ≤ u}

def haarVelocityCDF (v : ι → ℤ) (u : ℝ) : ℝ :=
  (volume : Measure (ι → UnitAddCircle)).real {s | torusVelocityValue v s ≤ u}

theorem haarProfileCDF_nonneg (m : ι → ℤ) (u : ℝ) : 0 ≤ haarProfileCDF m u :=
  ENNReal.toReal_nonneg

theorem haarVelocityCDF_nonneg (v : ι → ℤ) (u : ℝ) : 0 ≤ haarVelocityCDF v u :=
  ENNReal.toReal_nonneg

theorem haarVelocityCDF_le_one (v : ι → ℤ) (u : ℝ) : haarVelocityCDF v u ≤ 1 :=
  measureReal_le_one

theorem haarProfileCDF_eq_uniform (m : ι → ℤ) (hm : PrimitiveNormal m) (u : ℝ) :
    haarProfileCDF m u =
      (ENNReal.ofReal (2 * normalMass m) • (volume : Measure ℝ).restrict
        (Set.Icc (1 / 2 - 1 / (2 * normalMass m)) (1 / 2))).real (Set.Iic u) := by
  rw [← haar_predictedValue_distribution m hm]
  unfold haarProfileCDF
  rw [measureReal_def, measureReal_def,
    Measure.map_apply (continuous_torusPredictedValue m).measurable measurableSet_Iic]
  rfl

theorem haarProfileCDF_formula (m : ι → ℤ) (hm : PrimitiveNormal m) (u : ℝ) :
    haarProfileCDF m u =
      max (2 * normalMass m *
        (min u (1 / 2) - (1 / 2 - 1 / (2 * normalMass m)))) 0 := by
  let a : ℝ := 1 / 2 - 1 / (2 * normalMass m)
  have hinter : Set.Iic u ∩ Set.Icc a (1 / 2) = Set.Icc a (min u (1 / 2)) := by
    ext x
    constructor
    · rintro ⟨hxu, hax, hxb⟩
      exact ⟨hax, le_min hxu hxb⟩
    · rintro ⟨hax, hx⟩
      exact ⟨hx.trans (min_le_left _ _), hax, hx.trans (min_le_right _ _)⟩
  rw [haarProfileCDF_eq_uniform m hm]
  change (ENNReal.ofReal (2 * normalMass m) • (volume : Measure ℝ).restrict
    (Set.Icc a (1 / 2))).real (Set.Iic u) = _
  rw [measureReal_def, Measure.smul_apply, Measure.restrict_apply measurableSet_Iic,
    hinter, Real.volume_Icc, smul_eq_mul,
    ← ENNReal.ofReal_mul
      (mul_nonneg (by norm_num) (normalMass_pos m hm).le), ENNReal.toReal_ofReal']

theorem continuous_haarProfileCDF (m : ι → ℤ) (hm : PrimitiveNormal m) :
    Continuous (haarProfileCDF m) := by
  change Continuous (fun u : ℝ => haarProfileCDF m u)
  simp_rw [haarProfileCDF_formula m hm]
  exact (continuous_const.mul
    ((continuous_id.min continuous_const).sub continuous_const)).max continuous_const

theorem haarProfileCDF_le_velocity
    (m : ι → ℤ) (hm : PrimitiveNormal m) (v : ι → ℤ)
    (hv : integerPairing m v = 0) (u : ℝ) : haarProfileCDF m u ≤ haarVelocityCDF v u := by
  refine measureReal_mono ?_ (measure_ne_top _ _)
  intro s hs
  exact (torusVelocityValue_le_profile m hm v hv s).trans hs

theorem haarVelocityCDF_le_profile_of_gap
    (m v : ι → ℤ) (ε : ℝ) (hgap : uniformShiftGap m v < ε) (u : ℝ) :
    haarVelocityCDF v u ≤ haarProfileCDF m (u + ε) := by
  refine measureReal_mono ?_ (measure_ne_top _ _)
  intro s hs
  have hpoint : torusPredictedValue m s - torusVelocityValue v s < ε := by
    obtain ⟨r, rfl⟩ := real_shift_surjective s
    rw [torusPredictedValue_coe, torusVelocityValue_coe]
    exact (shiftGap_le_uniformShiftGap m v r).trans_lt hgap
  change torusPredictedValue m s ≤ u + ε
  change torusVelocityValue v s ≤ u at hs
  linarith

def independentShiftCDF (m : ι → ℤ) (u : ℝ) (N : ℕ) : ℝ :=
  (∑ v ∈ positiveBoxAdmissible m N, haarVelocityCDF (positiveBoxCoordinates v) u) /
    (positiveBoxAdmissible m N).card

/-- The normalized mixture is the law obtained by choosing a sampled
velocity uniformly and an independent standard Haar shift. -/
def independentShiftLaw (m : ι → ℤ) (N : ℕ) : Measure ℝ :=
  ((positiveBoxAdmissible m N).card : ℝ≥0∞)⁻¹ •
    ∑ v ∈ positiveBoxAdmissible m N,
      Measure.map (torusVelocityValue (positiveBoxCoordinates v))
        (volume : Measure (ι → UnitAddCircle))

theorem independentShiftLaw_isProbability
    (m : ι → ℤ) (N : ℕ) (hN : 0 < (positiveBoxAdmissible m N).card) :
    IsProbabilityMeasure (independentShiftLaw m N) := by
  refine ⟨?_⟩
  unfold independentShiftLaw
  rw [Measure.smul_apply, Measure.finsetSum_apply]
  simp only [Measure.map_apply
    (continuous_torusVelocityValue _).measurable MeasurableSet.univ,
    Set.preimage_univ, measure_univ, Finset.sum_const, nsmul_eq_mul, mul_one,
    smul_eq_mul]
  exact ENNReal.inv_mul_cancel (by exact_mod_cast hN.ne') (by finiteness)

theorem independentShiftLaw_cdf (m : ι → ℤ) (N : ℕ) (u : ℝ) :
    (independentShiftLaw m N).real (Set.Iic u) = independentShiftCDF m u N := by
  unfold independentShiftLaw independentShiftCDF
  rw [measureReal_def, Measure.smul_apply, smul_eq_mul, ENNReal.toReal_mul,
    ENNReal.toReal_inv, ENNReal.toReal_natCast, Measure.finsetSum_apply]
  rw [ENNReal.toReal_sum (fun v _ => measure_ne_top _ _)]
  simp only [Measure.map_apply
    (continuous_torusVelocityValue _).measurable measurableSet_Iic]
  change ((positiveBoxAdmissible m N).card : ℝ)⁻¹ *
    (∑ v ∈ positiveBoxAdmissible m N, haarVelocityCDF (positiveBoxCoordinates v) u) = _
  ring

theorem independentShiftCDF_lower
    (m : ι → ℤ) (hm : PrimitiveNormal m) (u : ℝ) (N : ℕ)
    (hN : 0 < (positiveBoxAdmissible m N).card) :
    haarProfileCDF m u ≤ independentShiftCDF m u N := by
  have hden : (0 : ℝ) < (positiveBoxAdmissible m N).card := by exact_mod_cast hN
  apply (le_div_iff₀ hden).mpr
  calc
    haarProfileCDF m u * ((positiveBoxAdmissible m N).card : ℝ) =
        ∑ v ∈ positiveBoxAdmissible m N, haarProfileCDF m u := by simp [mul_comm]
    _ ≤ _ := by
      apply Finset.sum_le_sum
      intro v hv
      exact haarProfileCDF_le_velocity m hm (positiveBoxCoordinates v)
        (Finset.mem_filter.mp hv).2.1 u

theorem independentShiftCDF_upper
    (m : ι → ℤ) (u ε : ℝ) (N : ℕ) (hN : 0 < (positiveBoxAdmissible m N).card) :
    independentShiftCDF m u N ≤ haarProfileCDF m (u + ε) +
      uniformFailureProbability m ε N := by
  classical
  have hden : ((positiveBoxAdmissible m N).card : ℝ) ≠ 0 := by exact_mod_cast hN.ne'
  have heach : ∀ v ∈ positiveBoxAdmissible m N,
      haarVelocityCDF (positiveBoxCoordinates v) u ≤ haarProfileCDF m (u + ε) +
        if ε ≤ uniformShiftGap m (positiveBoxCoordinates v) then 1 else 0 := by
    intro v _
    by_cases hv : ε ≤ uniformShiftGap m (positiveBoxCoordinates v)
    · rw [if_pos hv]
      linarith [haarVelocityCDF_le_one (positiveBoxCoordinates v) u,
        haarProfileCDF_nonneg m (u + ε)]
    · rw [if_neg hv, add_zero]
      exact haarVelocityCDF_le_profile_of_gap m (positiveBoxCoordinates v) ε
        (lt_of_not_ge hv) u
  have hsum := Finset.sum_le_sum heach
  have hbound := div_le_div_of_nonneg_right hsum
    (by positivity : (0 : ℝ) ≤ (positiveBoxAdmissible m N).card)
  simpa only [Finset.sum_add_distrib, Finset.sum_const, nsmul_eq_mul,
    Finset.sum_boole, add_div, mul_div_cancel_left₀ _ hden,
    independentShiftCDF, uniformFailureProbability, positiveBoxUniformBad] using hbound

/-- The distribution functions of the actual independent-shift laws
converge at every real threshold to the uniform profile distribution. -/
theorem independentShiftCDF_tendsto
    (m : ι → ℤ) (hm : PrimitiveNormal m) (hreal : RealAdmissible m)
    (hdim : 2 ≤ Fintype.card ι) (u : ℝ) :
    Tendsto (independentShiftCDF m u) atTop (𝓝 (haarProfileCDF m u)) := by
  apply Metric.tendsto_atTop.mpr
  intro η hη
  obtain ⟨δ, hδ, hclose⟩ := Metric.continuousAt_iff.mp
    (continuous_haarProfileCDF m hm).continuousAt (η / 2) (by linarith)
  let ε := δ / 2
  have hε : 0 < ε := by dsimp only [ε]; linarith
  have hprofile : haarProfileCDF m (u + ε) - haarProfileCDF m u < η / 2 := by
    have hd : dist (u + ε) u < δ := by
      rw [Real.dist_eq, add_sub_cancel_left, abs_of_pos hε]
      dsimp only [ε]
      linarith
    exact (abs_lt.mp (by simpa only [Real.dist_eq] using hclose hd)).2
  obtain ⟨C, _, _, hrate⟩ := exists_uniform_probability_rate m hm hreal hdim ε hε
  obtain ⟨N₀, hN₀⟩ := Metric.tendsto_atTop.mp
    (uniformFailureProbability_tendsto_zero m hm hreal hdim ε hε)
    (η / 2) (by linarith)
  refine ⟨max C N₀, ?_⟩
  intro N hN
  have hsample := (hrate N ((le_max_left _ _).trans hN)).1
  have hbad : uniformFailureProbability m ε N < η / 2 := by
    have hb := hN₀ N ((le_max_right _ _).trans hN)
    simpa only [Real.dist_eq, sub_zero,
      abs_of_nonneg (uniformFailureProbability_nonneg m ε N)] using hb
  have hlo := independentShiftCDF_lower m hm u N hsample
  have hhi := independentShiftCDF_upper m u ε N hsample
  rw [Real.dist_eq, abs_of_nonneg (sub_nonneg.mpr hlo)]
  linarith

theorem independentShiftLaw_cdf_tendsto_uniform
    (m : ι → ℤ) (hm : PrimitiveNormal m) (hreal : RealAdmissible m)
    (hdim : 2 ≤ Fintype.card ι) (u : ℝ) :
    Tendsto (fun N : ℕ => (independentShiftLaw m N).real (Set.Iic u)) atTop
      (𝓝 ((ENNReal.ofReal (2 * normalMass m) • (volume : Measure ℝ).restrict
        (Set.Icc (1 / 2 - 1 / (2 * normalMass m)) (1 / 2))).real (Set.Iic u))) := by
  simpa only [independentShiftLaw_cdf, haarProfileCDF_eq_uniform m hm] using
    independentShiftCDF_tendsto m hm hreal hdim u

end

end Loneliness.Hyperplane
