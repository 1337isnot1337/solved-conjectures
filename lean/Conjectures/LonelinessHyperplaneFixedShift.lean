import Conjectures.LonelinessHyperplaneProbability

/-! The distribution at a fixed shift converges to the point mass at
the exact hyperplane profile. The distribution functions are literal
finite sampling ratios, and the torus formulation is included. -/

namespace Loneliness.Hyperplane

open Filter
open scoped Topology

noncomputable section

variable {ι : Type*} [Fintype ι] [DecidableEq ι] [Nonempty ι]

def fixedShiftCDF (m : ι → ℤ) (s : ι → ℝ) (u : ℝ) (N : ℕ) : ℝ :=
  ((positiveBoxBelow m s u N).card : ℝ) / (positiveBoxAdmissible m N).card

theorem fixedShiftCDF_nonneg (m : ι → ℤ) (s : ι → ℝ) (u : ℝ) (N : ℕ) :
    0 ≤ fixedShiftCDF m s u N := by
  unfold fixedShiftCDF
  positivity

theorem fixedShiftCDF_le_failure (m : ι → ℤ) (s : ι → ℝ) (u : ℝ) (N : ℕ) :
    fixedShiftCDF m s u N ≤ uniformFailureProbability m (predictedValue m s - u) N := by
  classical
  have hsub : positiveBoxBelow m s u N ⊆
      positiveBoxUniformBad m (predictedValue m s - u) N := by
    intro v hv
    obtain ⟨hvA, hbelow⟩ := Finset.mem_filter.mp hv
    refine Finset.mem_filter.mpr ⟨hvA, ?_⟩
    exact (sub_le_sub_left hbelow _).trans (shiftGap_le_uniformShiftGap m
      (positiveBoxCoordinates v) s)
  have hcard : ((positiveBoxBelow m s u N).card : ℝ) ≤
      ((positiveBoxUniformBad m (predictedValue m s - u) N).card : ℝ) := by
    exact_mod_cast Finset.card_le_card hsub
  exact div_le_div_of_nonneg_right hcard (by positivity)

theorem fixedShiftCDF_tendsto_zero_of_lt
    (m : ι → ℤ) (hm : PrimitiveNormal m) (hreal : RealAdmissible m)
    (hdim : 2 ≤ Fintype.card ι) (s : ι → ℝ) (u : ℝ)
    (hu : u < predictedValue m s) :
    Tendsto (fixedShiftCDF m s u) atTop (𝓝 0) :=
  squeeze_zero (fixedShiftCDF_nonneg m s u) (fixedShiftCDF_le_failure m s u)
    (uniformFailureProbability_tendsto_zero m hm hreal hdim
      (predictedValue m s - u) (sub_pos.mpr hu))

theorem fixedShiftCDF_eq_one_of_ge
    (m : ι → ℤ) (hm : PrimitiveNormal m) (s : ι → ℝ) (u : ℝ)
    (hu : predictedValue m s ≤ u) (N : ℕ) (hN : 0 < (positiveBoxAdmissible m N).card) :
    fixedShiftCDF m s u N = 1 := by
  classical
  have hset : positiveBoxBelow m s u N = positiveBoxAdmissible m N := by
    apply Finset.filter_eq_self.mpr
    intro v hv
    have hkernel := (Finset.mem_filter.mp hv).2.1
    exact (orthogonal_velocity_value_le m hm (positiveBoxCoordinates v) hkernel s).trans hu
  unfold fixedShiftCDF
  rw [hset]
  exact div_self (by exact_mod_cast hN.ne')

theorem fixedShiftCDF_tendsto
    (m : ι → ℤ) (hm : PrimitiveNormal m) (hreal : RealAdmissible m)
    (hdim : 2 ≤ Fintype.card ι) (s : ι → ℝ) (u : ℝ) :
    Tendsto (fixedShiftCDF m s u) atTop
      (𝓝 (if u < predictedValue m s then 0 else 1)) := by
  by_cases hu : u < predictedValue m s
  · rw [if_pos hu]
    exact fixedShiftCDF_tendsto_zero_of_lt m hm hreal hdim s u hu
  · rw [if_neg hu]
    obtain ⟨C, _, _, hrate⟩ := exists_uniform_probability_rate m hm hreal hdim 1 (by norm_num)
    apply tendsto_const_nhds.congr'
    filter_upwards [eventually_ge_atTop C] with N hN
    exact (fixedShiftCDF_eq_one_of_ge m hm s u (le_of_not_gt hu) N (hrate N hN).1).symm

/-- For each torus shift, the distribution function converges to the
distribution function of the point mass at the stated profile. -/
theorem fixedShift_torus_cdf_tendsto
    (m : ι → ℤ) (hm : PrimitiveNormal m) (hreal : RealAdmissible m)
    (hdim : 2 ≤ Fintype.card ι) (s : ι → UnitAddCircle) (u : ℝ) :
    Tendsto (fun N : ℕ =>
      (((positiveBoxAdmissible m N).filter (fun v =>
        torusVelocityValue (positiveBoxCoordinates v) s ≤ u)).card : ℝ) /
          (positiveBoxAdmissible m N).card) atTop
      (𝓝 (if u < torusPredictedValue m s then 0 else 1)) := by
  obtain ⟨r, rfl⟩ := real_shift_surjective s
  simpa only [torusVelocityValue_coe, torusPredictedValue_coe, fixedShiftCDF,
    positiveBoxBelow] using fixedShiftCDF_tendsto m hm hreal hdim r u

end

end Loneliness.Hyperplane
