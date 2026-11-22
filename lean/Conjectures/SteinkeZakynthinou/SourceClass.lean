module

public import Conjectures.SteinkeZakynthinou.Statement
public import Mathlib.MeasureTheory.Constructions.Polish.Basic

/-! The threshold class of Steinke and Zakynthinou's framework paper, §4.4.
The extra always-zero classifier is a comparator. Finite real outputs already recover
all finite-sample losses of this class. -/

@[expose] public section

open MeasureTheory
open scoped BigOperators

namespace SteinkeZakynthinou

/-- The finite cutoff `t` predicts `true` at and above `t`. -/
noncomputable def realThresholdPrediction (t x : ℝ) : Bool := decide (t ≤ x)

/-- The literal source class `ℝ ∪ {∞}`. The value `none` represents `∞`. -/
noncomputable def sourceThresholdPrediction (t : Option ℝ) (x : ℝ) : Bool :=
  t.elim false (fun a => realThresholdPrediction a x)

@[simp] theorem sourceThresholdPrediction_none (x : ℝ) :
    sourceThresholdPrediction none x = false := rfl

@[simp] theorem sourceThresholdPrediction_some (t x : ℝ) :
    sourceThresholdPrediction (some t) x = realThresholdPrediction t x := rfl

/-- Empirical loss against any comparator in the source class. -/
noncomputable def sourceEmpiricalLoss {n : ℕ} (z : Sample n) (t : Option ℝ) : ℝ :=
  (∑ i, if sourceThresholdPrediction t (z i).1 = (z i).2 then (0 : ℝ) else 1) / n

@[simp] theorem sourceEmpiricalLoss_some {n : ℕ} (z : Sample n) (t : ℝ) :
    sourceEmpiricalLoss z (some t) = empiricalLoss z t := rfl

/-- A finite cutoff strictly above all observed features behaves like `∞` on the sample. -/
theorem exists_finite_threshold_same_sample_predictions {n : ℕ} (z : Sample n) (t : Option ℝ) :
    ∃ u : ℝ, ∀ i, sourceThresholdPrediction t (z i).1 = realThresholdPrediction u (z i).1 := by
  cases t with
  | some t => exact ⟨t, fun _ => rfl⟩
  | none =>
    obtain ⟨M, hM⟩ := (Set.finite_range (fun i => (z i).1)).bddAbove
    refine ⟨M + 1, fun i => ?_⟩
    have hle : (z i).1 ≤ M := hM ⟨i, rfl⟩
    have hlt : (z i).1 < M + 1 := hle.trans_lt (lt_add_of_pos_right M zero_lt_one)
    simp [realThresholdPrediction, hlt.not_ge]

/-- Every source comparator has exactly the loss of some finite real cutoff on the sample. -/
theorem exists_finite_threshold_same_source_loss {n : ℕ} (z : Sample n) (t : Option ℝ) :
    ∃ u : ℝ, sourceEmpiricalLoss z t = empiricalLoss z u := by
  obtain ⟨u, hu⟩ := exists_finite_threshold_same_sample_predictions z t
  refine ⟨u, ?_⟩
  rw [← sourceEmpiricalLoss_some]
  unfold sourceEmpiricalLoss
  congr 1
  exact Finset.sum_congr rfl fun i _ => by rw [hu i, sourceThresholdPrediction_some]

theorem sourceEmpiricalLoss_range_eq {n : ℕ} (z : Sample n) :
    Set.range (sourceEmpiricalLoss z) = Set.range (empiricalLoss z) := by
  ext a
  constructor
  · rintro ⟨t, rfl⟩
    obtain ⟨u, hu⟩ := exists_finite_threshold_same_source_loss z t
    exact ⟨u, hu.symm⟩
  · rintro ⟨u, rfl⟩
    exact ⟨some u, sourceEmpiricalLoss_some z u⟩

/-- Including the always-zero function does not change the empirical infimum. -/
theorem sourceEmpiricalLoss_iInf_eq {n : ℕ} (z : Sample n) :
    (⨅ t : Option ℝ, sourceEmpiricalLoss z t) = ⨅ u : ℝ, empiricalLoss z u :=
  congrArg sInf (sourceEmpiricalLoss_range_eq z)

/-- Finite-threshold comparisons imply the exact bound against the source-class infimum. -/
theorem Learner.expectedLoss_le_sourceInfimum {n : ℕ} (a : Learner n) (z : Sample n) (δ : ℝ)
    (h : ∀ u : ℝ, a.expectedLoss z ≤ empiricalLoss z u + δ) :
    a.expectedLoss z ≤ (⨅ t : Option ℝ, sourceEmpiricalLoss z t) + δ := by
  rw [sourceEmpiricalLoss_iInf_eq]
  apply sub_le_iff_le_add.mp
  apply le_ciInf
  exact fun u => sub_le_iff_le_add.mpr (h u)

/-- Finite-threshold predictions restricted to the rational inputs. -/
noncomputable def thresholdRationalEvaluations (t : ℝ) (r : ℚ) : Bool :=
  realThresholdPrediction t r

/-- Rational density makes the real cutoff identifiable from its rational predictions. -/
theorem thresholdRationalEvaluations_injective : Function.Injective thresholdRationalEvaluations := by
  have hne {a b : ℝ} (hab : a < b) : thresholdRationalEvaluations a ≠ thresholdRationalEvaluations b := by
    obtain ⟨r, har, hrb⟩ := exists_rat_btwn hab
    intro h
    have hr := congrFun h r
    simp [thresholdRationalEvaluations, realThresholdPrediction, har.le, hrb.not_ge] at hr
  intro a b h
  exact le_antisymm (le_of_not_gt fun hba => hne hba h.symm) (le_of_not_gt fun hab => hne hab h)

/-- Two finite real parameters represent the same function only when they are equal. -/
theorem realThresholdPrediction_injective : Function.Injective realThresholdPrediction := by
  intro a b h
  exact thresholdRationalEvaluations_injective (funext fun r => congrFun h (r : ℝ))

/-- The finite cutoffs and the always-zero classifier are all distinct as functions. -/
theorem sourceThresholdPrediction_injective : Function.Injective sourceThresholdPrediction := by
  intro a b h
  cases a with
  | none =>
    cases b with
    | none => rfl
    | some b => simpa [realThresholdPrediction] using congrFun h b
  | some a =>
    cases b with
    | none => simpa [realThresholdPrediction] using congrFun h a
    | some b => exact congrArg some (realThresholdPrediction_injective h)

/-- Each rational evaluation is Borel in the cutoff, so their countable tuple is Borel. -/
theorem measurable_thresholdRationalEvaluations : Measurable thresholdRationalEvaluations := by
  apply Measurable.of_eval
  intro r
  apply measurable_to_bool
  change MeasurableSet {t : ℝ | decide (t ≤ (r : ℝ)) = true}
  simp only [decide_eq_true_eq]
  change MeasurableSet (Set.Iic (r : ℝ))
  exact measurableSet_Iic

/-- On the finite real parameters used by the learner, rational predictions give a Borel
embedding and admit a measurable inverse on the realized code space. -/
theorem thresholdRationalEvaluations_measurableEmbedding :
    MeasurableEmbedding thresholdRationalEvaluations :=
  measurable_thresholdRationalEvaluations.measurableEmbedding thresholdRationalEvaluations_injective

theorem measurable_thresholdRationalRecovery :
    Measurable (Set.rangeSplitting thresholdRationalEvaluations) :=
  thresholdRationalEvaluations_measurableEmbedding.measurable_rangeSplitting

@[simp] theorem thresholdRationalRecovery_apply (t : ℝ) :
    Set.rangeSplitting thresholdRationalEvaluations (Set.rangeFactorization thresholdRationalEvaluations t) = t :=
  thresholdRationalEvaluations_injective (Set.apply_rangeSplitting _ _)

end SteinkeZakynthinou
