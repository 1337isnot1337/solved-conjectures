module
public import Conjectures.PomeranceSarkozyGaussianAbsolute
public import Conjectures.PomeranceSarkozyTailCross

@[expose] public section
namespace PomeranceSarkozy

open MeasureTheory ProbabilityTheory Filter
open scoped ENNReal NNReal Topology ProbabilityTheory

/-- Summing the variance of all threshold indicators counts half the distance
between two independent draws. Here both sides are unnormalized masses. -/
private theorem twice_tail_cross (p : ℕ → ℝ≥0∞) :
    (∑' h, survivalAtoms p h * lowerAtoms p h) +
      (∑' h, survivalAtoms p h * lowerAtoms p h) =
    ∑' k : ℕ, ∑' l : ℕ, ENNReal.ofReal |(k : ℝ) - l| * (p k * p l) := by
  let f (k l : ℕ) := ((k - l : ℕ) : ℝ≥0∞) * (p k * p l)
  rw [tail_cross_tsum]
  change (∑' k, ∑' l, f k l) + (∑' k, ∑' l, f k l) = _
  conv_lhs => rhs; rw [ENNReal.tsum_comm]
  rw [← ENNReal.tsum_add]
  apply tsum_congr
  intro k
  rw [← ENNReal.tsum_add]
  apply tsum_congr
  intro l
  dsimp only [f]
  rw [mul_comm (p l) (p k), ← add_mul]
  congr 1
  rcases le_total l k with h | h
  · rw [Nat.sub_eq_zero_of_le h, Nat.cast_zero, add_zero,
      abs_of_nonneg (sub_nonneg.mpr (Nat.cast_le.mpr h)), ← Nat.cast_sub h,
      ENNReal.ofReal_natCast]
  · rw [Nat.sub_eq_zero_of_le h, Nat.cast_zero, zero_add,
      abs_sub_comm, abs_of_nonneg (sub_nonneg.mpr (Nat.cast_le.mpr h)),
      ← Nat.cast_sub h, ENNReal.ofReal_natCast]

private theorem poisson_difference_abs_lintegral (b : ℝ≥0) :
    (∫⁻ x : ℝ, ENNReal.ofReal |x| ∂poissonDifferenceLaw b) =
    ∑' k : ℕ, ∑' l : ℕ, ENNReal.ofReal |(k : ℝ) - l| *
      (ENNReal.ofReal (poissonNatMass b k) * ENNReal.ofReal (poissonNatMass b l)) := by
  let μ := poissonMeasure b
  change (∫⁻ x : ℝ, ENNReal.ofReal |x|
    ∂(((μ.map (Nat.cast : ℕ → ℝ)).prod (μ.map (Nat.cast : ℕ → ℝ))).map
      (fun z : ℝ × ℝ => z.1 - z.2))) = _
  rw [lintegral_map (by fun_prop) (by fun_prop),
    Measure.map_prod_map _ _ (by fun_prop) (by fun_prop),
    lintegral_map (by fun_prop) (by fun_prop), lintegral_countable', ENNReal.tsum_prod']
  apply tsum_congr
  intro k
  apply tsum_congr
  intro l
  change ENNReal.ofReal |(k : ℝ) - l| * (μ.prod μ) {(k, l)} = _
  rw [← Set.singleton_prod_singleton, Measure.prod_prod]
  change _ = _ * (ENNReal.ofReal (μ.real {k}) * ENNReal.ofReal (μ.real {l}))
  rw [ofReal_measureReal (measure_ne_top _ _), ofReal_measureReal (measure_ne_top _ _)]

/-- The normalized Poisson difference has absolute first moment exactly twice
the normalized total variance of its one-dimensional threshold indicators. -/
theorem poisson_threshold_variance_moment (b : ℝ≥0) :
    (∑' h, (poissonSurvival b h).toReal * (1 - (poissonSurvival b h).toReal)) /
      Real.sqrt (b : ℝ) =
      (∫ x : ℝ, |x| ∂(normalizedPoissonDifference b : Measure ℝ)) / 2 := by
  let p (k : ℕ) := ENNReal.ofReal (poissonNatMass b k)
  have hmass : ∑' k, p k = 1 := poissonNatMass_atomicMass b
  have hsplit (h : ℕ) : lowerAtoms p h + survivalAtoms p h = 1 :=
    (lower_add_survival p h).trans hmass
  have hu (h : ℕ) : survivalAtoms p h ≤ 1 := (le_add_self).trans_eq (hsplit h)
  have hl (h : ℕ) : lowerAtoms p h ≤ 1 := (le_self_add).trans_eq (hsplit h)
  have hu' (h : ℕ) : survivalAtoms p h ≠ ∞ := ne_top_of_le_ne_top ENNReal.one_ne_top (hu h)
  have hl' (h : ℕ) : lowerAtoms p h ≠ ∞ := ne_top_of_le_ne_top ENNReal.one_ne_top (hl h)
  let S := ∑' h, survivalAtoms p h * lowerAtoms p h
  have hS : S ≠ ∞ := by
    apply ne_top_of_le_ne_top (b := ENNReal.ofReal (b : ℝ)) ENNReal.ofReal_ne_top
    rw [← poissonSurvival_tsum]
    exact ENNReal.tsum_le_tsum (fun h => mul_le_of_le_one_right zero_le (hl h))
  have hreal : S.toReal =
      ∑' h, (poissonSurvival b h).toReal * (1 - (poissonSurvival b h).toReal) := by
    rw [show S = ∑' h, survivalAtoms p h * lowerAtoms p h from rfl,
      ENNReal.tsum_toReal_eq (fun h => ENNReal.mul_ne_top (hu' h) (hl' h))]
    apply tsum_congr
    intro h
    have hs := congrArg ENNReal.toReal (hsplit h)
    rw [ENNReal.toReal_add (hl' h) (hu' h), ENNReal.toReal_one] at hs
    rw [ENNReal.toReal_mul]
    change _ = (survivalAtoms p h).toReal * (1 - (survivalAtoms p h).toReal)
    congr 1
    linarith
  have habs : (∫ x : ℝ, |x| ∂poissonDifferenceLaw b) = S.toReal + S.toReal := by
    rw [integral_eq_lintegral_of_nonneg_ae (ae_of_all _ abs_nonneg) (by fun_prop),
      poisson_difference_abs_lintegral]
    change (∑' k : ℕ, ∑' l : ℕ, ENNReal.ofReal |(k : ℝ) - l| * (p k * p l)).toReal = _
    rw [← twice_tail_cross, ENNReal.toReal_add hS hS]
  change _ = (∫ x : ℝ, |x| ∂(poissonDifferenceLaw b).map
    (fun x : ℝ => (Real.sqrt (b : ℝ))⁻¹ * x)) / 2
  rw [integral_map (by fun_prop) (by fun_prop)]
  simp_rw [abs_mul, abs_of_nonneg (inv_nonneg.mpr (Real.sqrt_nonneg _))]
  rw [integral_const_mul, habs, ← hreal]
  ring

theorem poisson_threshold_variance_tsum_tendsto (b : ℕ → ℝ≥0)
    (hb : Tendsto (fun n => (b n : ℝ)) atTop atTop) :
    Tendsto (fun n => (∑' h, (poissonSurvival (b n) h).toReal *
      (1 - (poissonSurvival (b n) h).toReal)) / Real.sqrt (b n : ℝ))
      atTop (𝓝 (1 / Real.sqrt Real.pi)) := by
  simp_rw [poisson_threshold_variance_moment]
  convert (normalizedPoissonDifference_abs_moment_tendsto b hb).div_const 2 using 1
  congr 1
  ring

end PomeranceSarkozy
