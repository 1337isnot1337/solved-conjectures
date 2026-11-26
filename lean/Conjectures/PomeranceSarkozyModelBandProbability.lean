module
public import Conjectures.PomeranceSarkozyNearThresholdBand
public import Mathlib.MeasureTheory.Constructions.Pi
public import Mathlib.Probability.Distributions.Poisson.Basic
import Mathlib.MeasureTheory.Integral.Lebesgue.Markov
import Mathlib.Algebra.BigOperators.Ring.Finset

@[expose] public section
namespace PomeranceSarkozy

open MeasureTheory ProbabilityTheory
open scoped ENNReal NNReal BigOperators

/-- Count offsets whose observed values are within `B` of the offset threshold. -/
def nearThresholdBandCount {H : ℕ} (B : ℕ) (x : ↥(Finset.Icc 1 H) → ℕ) : ℕ :=
  (Finset.univ.filter fun h : ↥(Finset.Icc 1 H) =>
    (h : ℕ) ≤ x h + B ∧ x h ≤ (h : ℕ) + B).card

/-- The expected number of offsets in the inclusive threshold band is at most `2B + 1`.
Markov's inequality gives the stated probability bound under the Poisson product law. -/
theorem poisson_band_count_probability_le (H B : ℕ) (b : ℝ≥0) {t : ℝ} (ht : 0 < t) :
    (Measure.pi (fun _ : ↥(Finset.Icc 1 H) => poissonMeasure b)).real
      {x | t ≤ (nearThresholdBandCount B x : ℝ)} ≤ (2 * (B : ℝ) + 1) / t := by
  classical
  let K := ↥(Finset.Icc 1 H)
  let μ := Measure.pi (fun _ : K => poissonMeasure b)
  let band (h : ℕ) : Set ℕ := {k | h ≤ k + B ∧ k ≤ h + B}
  let event (h : K) : Set (K → ℕ) := Function.eval h ⁻¹' band h
  let atom (k : ℕ) : ℝ≥0∞ := poissonMeasure b {k}
  have hband (h : ℕ) : MeasurableSet (band h) := (band h).to_countable.measurableSet
  have hevent (h : K) : MeasurableSet (event h) :=
    (measurable_pi_apply h) (hband h)
  have hevent_mass (h : K) : μ (event h) = bandMass atom B h := by
    change μ (Function.eval h ⁻¹' band h) = _
    rw [← Measure.map_apply (measurable_pi_apply h) (hband h),
      (measurePreserving_eval (fun _ : K => poissonMeasure b) h).map_eq,
      ← Measure.tsum_indicator_apply_singleton _ _ (hband h)]
    simp only [bandMass, band, Set.indicator_apply, Set.mem_ofPred_eq, atom]
  have hatom : (∑' k, atom k) = 1 := by
    simpa only [Set.indicator_univ, measure_univ, atom] using
      (Measure.tsum_indicator_apply_singleton (poissonMeasure b) Set.univ MeasurableSet.univ)
  let indicator (h : K) : (K → ℕ) → ℝ≥0∞ := (event h).indicator (fun _ => 1)
  have hindicator (h : K) : Measurable (indicator h) :=
    measurable_const.indicator (hevent h)
  let count (x : K → ℕ) : ℝ≥0∞ := nearThresholdBandCount B x
  have hcount : count = fun x => ∑ h, indicator h x := by
    funext x
    simp only [count, indicator, event, band, Set.indicator_apply, Set.mem_preimage,
      Function.eval, Set.mem_ofPred_eq, Finset.sum_boole, nearThresholdBandCount]
    apply congrArg (fun n : ℕ => (n : ℝ≥0∞))
    apply congrArg Finset.card
    ext h
    simp only [Finset.mem_filter]
  have hmeas : Measurable count := by
    rw [hcount]
    exact Finset.measurable_sum _ (fun h _ => hindicator h)
  have hmean : (∫⁻ x, count x ∂μ) ≤ ((2 * B + 1 : ℕ) : ℝ≥0∞) := by
    rw [hcount, lintegral_finsetSum _ (fun h _ => hindicator h)]
    have hindicator_mass (h : K) : (∫⁻ x, indicator h x ∂μ) = μ (event h) := by
      simp [indicator, lintegral_indicator (hevent h)]
    simp only [hindicator_mass, hevent_mass]
    rw [← tsum_fintype (fun h : K => bandMass atom B h) (L := SummationFilter.unconditional K)]
    exact (ENNReal.tsum_comp_le_tsum_of_injective Subtype.val_injective (bandMass atom B)).trans
      (bandMass_tsum_le atom B hatom)
  have hset : {x : K → ℕ | ENNReal.ofReal t ≤ count x} =
      {x : K → ℕ | t ≤ (nearThresholdBandCount B x : ℝ)} := by
    ext x
    simp [count, ENNReal.ofReal_le_iff_le_toReal]
  have hle := (mul_meas_ge_le_lintegral (μ := μ) hmeas (ENNReal.ofReal t)).trans hmean
  rw [hset] at hle
  have hreal := ENNReal.toReal_mono (ENNReal.natCast_ne_top (2 * B + 1)) hle
  rw [ENNReal.toReal_mul, ENNReal.toReal_ofReal ht.le, ENNReal.toReal_natCast] at hreal
  push_cast at hreal
  apply (le_div_iff₀ ht).2
  rw [mul_comm]
  exact hreal

end PomeranceSarkozy
