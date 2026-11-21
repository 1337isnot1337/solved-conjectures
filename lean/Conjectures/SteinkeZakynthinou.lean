module

public import Conjectures.SteinkeZakynthinou.Averaging
public import Conjectures.SteinkeZakynthinou.DecodedChannel

/-!
The proper agnostic real-threshold case of Steinke and Zakynthinou,
COLT 2020, Conjecture 6 and §3.
-/

@[expose] public section

open MeasureTheory SteinkeZakynthinou.Learner
open scoped BigOperators

namespace SteinkeZakynthinou

private theorem integrable_selectorMean {n : ℕ} {X : Type*} [MeasurableSpace X]
    {μ : Measure X} (f : Selector n → X → ℝ) (hf : ∀ s, Integrable (f s) μ) :
    Integrable (fun x => selectorMean (fun s => f s x)) μ := by
  unfold selectorMean
  exact (integrable_finsetSum _ (fun s _ => hf s)).div_const _

private theorem integral_selectorMean {n : ℕ} {X : Type*} [MeasurableSpace X]
    {μ : Measure X} (f : Selector n → X → ℝ) (hf : ∀ s, Integrable (f s) μ) :
    (∫ x, selectorMean (fun s => f s x) ∂μ) = selectorMean (fun s => ∫ x, f s x ∂μ) := by
  unfold selectorMean
  rw [integral_div, integral_finsetSum _ (fun s _ => hf s)]

private theorem integrable_chargeAfterSelect {n : ℕ} (hn : 0 < n) (D : Measure Observation)
    [IsProbabilityMeasure D] (i : Fin n) (s : Selector n) :
    Integrable (fun T => ownCharge (select T s) i) (poolMeasure n D) :=
  (measurePreserving_select D s).integrable_comp_of_integrable (integrable_ownCharge hn D i)

theorem integrable_poolCharge {n : ℕ} (hn : 0 < n) (D : Measure Observation)
    [IsProbabilityMeasure D] : Integrable poolCharge (poolMeasure n D) := by
  unfold poolCharge
  apply integrable_finsetSum
  intro i _
  exact integrable_selectorMean _ (fun s =>
    (integrable_chargeAfterSelect hn D i (Function.update s i false)).add
      (integrable_chargeAfterSelect hn D i (Function.update s i true)))

theorem integral_poolCharge_le {n : ℕ} (hn : 0 < n) (D : Measure Observation)
    [IsProbabilityMeasure D] :
    (∫ T, poolCharge T ∂poolMeasure n D) ≤ 146 := by
  let Q := fun (i : Fin n) (b : Bool) (s : Selector n) (T : Pool n) =>
    ownCharge (select T (Function.update s i b)) i
  have hQ (i : Fin n) (b : Bool) (s : Selector n) :
      Integrable (Q i b s) (poolMeasure n D) :=
    integrable_chargeAfterSelect hn D i (Function.update s i b)
  have hi (i : Fin n) :
      (∫ T, selectorMean (fun s => Q i false s T + Q i true s T) ∂poolMeasure n D) =
      2 * ∫ z, ownCharge z i ∂sampleMeasure n D := by
    rw [integral_selectorMean (fun s T => Q i false s T + Q i true s T)
      (fun s => (hQ i false s).add (hQ i true s))]
    have he (s : Selector n) : (∫ T, Q i false s T + Q i true s T ∂poolMeasure n D) =
        2 * ∫ z, ownCharge z i ∂sampleMeasure n D := by
      rw [integral_add (f := fun T => Q i false s T) (g := fun T => Q i true s T)
        (hQ i false s) (hQ i true s)]
      dsimp [Q]
      rw [integral_select D _ (measurable_ownCharge i), integral_select D _ (measurable_ownCharge i), two_mul]
    simp only [he, selectorMean_const]
  change (∫ T, ∑ i, selectorMean (fun s => Q i false s T + Q i true s T) ∂poolMeasure n D) ≤ _
  rw [integral_finsetSum (f := fun i T => selectorMean (fun s => Q i false s T + Q i true s T))
    Finset.univ (fun i _ => integrable_selectorMean (fun s T => Q i false s T + Q i true s T)
      (fun s => (hQ i false s).add (hQ i true s)))]
  change (∑ i, ∫ T, selectorMean (fun s => Q i false s T + Q i true s T) ∂poolMeasure n D) ≤ _
  rw [Finset.sum_congr rfl (fun i _ => hi i), ← Finset.mul_sum,
    ← integral_finsetSum _ (fun i _ => integrable_ownCharge hn D i)]
  have hh := integral_mono
    (integrable_finsetSum Finset.univ (fun i _ => integrable_ownCharge hn D i))
    (integrable_const (73 : ℝ)) (sum_ownCharge_le hn)
  rw [integral_const] at hh
  simp only [Measure.real, measure_univ, ENNReal.toReal_one, one_smul] at hh
  linarith

theorem shiftedTreeLearner_cmi_le {n : ℕ} (hn : 0 < n) (D : Measure Observation)
    [IsProbabilityMeasure D] : (shiftedTreeLearner hn).cmi D ≤ 300 := by
  let a := shiftedTreeLearner hn
  have h (T : Pool n) : a.poolInformation T ≤ 2 * poolCharge T + (Real.log 4 + Real.log 3) := by
    have h₀ := learner_poolInformation_le_aux hn T
    have h₁ := auxInfo_le_poolCharge hn T
    change a.poolInformation T ≤ _ at h₀
    linarith
  have hh := integral_mono (a.integrable_poolInformation D)
    (((integrable_poolCharge hn D).const_mul 2).add (integrable_const (Real.log 4 + Real.log 3))) h
  change a.cmi D ≤ _
  apply hh.trans
  change (∫ T, 2 * poolCharge T + (Real.log 4 + Real.log 3) ∂poolMeasure n D) ≤ _
  rw [integral_add (f := fun T => 2 * poolCharge T) (g := fun _ => Real.log 4 + Real.log 3)
    ((integrable_poolCharge hn D).const_mul 2) (integrable_const _), integral_const_mul, integral_const]
  simp only [Measure.real, measure_univ, ENNReal.toReal_one, one_smul]
  linarith [integral_poolCharge_le hn D, Real.log_le_self (by norm_num : (0 : ℝ) ≤ 4),
    Real.log_le_self (by norm_num : (0 : ℝ) ≤ 3)]

theorem shiftedTreeLearner_cmi_bits_le {n : ℕ} (hn : 0 < n) (D : Measure Observation)
    [IsProbabilityMeasure D] : (shiftedTreeLearner hn).cmi D / Real.log 2 ≤ 600 := by
  have h : 0 < Real.log 2 := by linarith [log_two_ge_half]
  apply (div_le_iff₀ h).mpr
  linarith [shiftedTreeLearner_cmi_le hn D, log_two_ge_half]

theorem shiftedTreeLearner_expectedLoss_le_inf {n : ℕ} (hn : 0 < n) (z : Sample n) :
    (shiftedTreeLearner hn).expectedLoss z ≤
      sInf (Set.range (empiricalLoss z)) + 512 / Real.sqrt n := by
  apply sub_le_iff_le_add.mp
  apply le_csInf (Set.range_nonempty _)
  rintro _ ⟨t, rfl⟩
  linarith [shiftedTreeLearner_expectedLoss_le hn z t]

/-- A measurable proper learner satisfies the source samplewise accuracy
and original iid-pool CMI bounds with one universal constant. -/
theorem properThresholdTheorem : ProperThresholdProblem := by
  refine ⟨1024, by norm_num, fun n hn => ⟨shiftedTreeLearner hn, ?_, ?_⟩⟩
  · intro D hD
    let _ : IsProbabilityMeasure D := hD
    exact ⟨(shiftedTreeLearner hn).integrable_poolInformation D,
      (shiftedTreeLearner_cmi_le hn D).trans (by norm_num)⟩
  · intro z t
    apply (shiftedTreeLearner_expectedLoss_le hn z t).trans
    exact add_le_add_right (div_le_div_of_nonneg_right (by norm_num) (Real.sqrt_nonneg _)) _

/-- The source bounds with the infimum over finite real thresholds and
information measured in bits. -/
theorem properThresholdTheorem_bits :
    ∃ C : ℝ, 0 ≤ C ∧ ∀ n : ℕ, 0 < n → ∃ a : Learner n,
      (∀ D : Measure Observation, IsProbabilityMeasure D →
        Integrable a.poolInformation (poolMeasure n D) ∧ a.cmi D / Real.log 2 ≤ C) ∧
      ∀ z : Sample n, a.expectedLoss z ≤ sInf (Set.range (empiricalLoss z)) + C / Real.sqrt n := by
  refine ⟨1024, by norm_num, fun n hn => ⟨shiftedTreeLearner hn, ?_, ?_⟩⟩
  · intro D hD
    let _ : IsProbabilityMeasure D := hD
    exact ⟨(shiftedTreeLearner hn).integrable_poolInformation D,
      (shiftedTreeLearner_cmi_bits_le hn D).trans (by norm_num)⟩
  · intro z
    apply (shiftedTreeLearner_expectedLoss_le_inf hn z).trans
    exact add_le_add_right (div_le_div_of_nonneg_right (by norm_num) (Real.sqrt_nonneg _)) _

end SteinkeZakynthinou
