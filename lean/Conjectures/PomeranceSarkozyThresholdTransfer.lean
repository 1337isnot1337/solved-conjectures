module
public import Conjectures.PomeranceSarkozyArithmeticTruncation
public import Conjectures.PomeranceSarkozyModelThresholdLaw
public import Conjectures.PomeranceSarkozyWindowWeakTransfer
import Mathlib.Tactic.Linarith

@[expose] public section
namespace PomeranceSarkozy

open Filter MeasureTheory ProbabilityTheory
open scoped Topology Classical

/-- The arithmetic statistic whose prime and offset cutoffs are used in the model. -/
noncomputable def sourceTruncatedScaled (X n : ℕ) : ℝ :=
  (((1 + (truncatedOffsets (psPrimes X) n (psH X)).card : ℕ) : ℝ) - psL X) /
    (psL X) ^ (1 / 4 : ℝ)

theorem offsetThresholdStatistic_cast (I : Finset ℕ) (x : ↥I → ℕ) :
    (offsetThresholdStatistic x : ℝ) = 1 + thresholdVectorCount I x := by
  simp only [offsetThresholdStatistic, Nat.cast_add, Nat.cast_one, thresholdVectorCount,
    Finset.card_filter, Nat.cast_sum, Nat.cast_ite, Nat.cast_zero]

private noncomputable def thresholdNormalized (X : ℕ) (x : ↥(psOffsets X) → ℕ) : ℝ :=
  (thresholdVectorCount (psOffsets X) x - (psL X - 1)) / (psL X)^(1/4 : ℝ)

/-- Event identity on the literal upper window before the Poisson comparison. -/
theorem sourceTruncatedScaled_event (X : ℕ) (hs : psH X < psStart X) (A : Set ℝ)
    (hA : MeasurableSet A) :
    ((sourceWindowSample X).map (sourceTruncatedScaled X) : Measure ℝ).real A =
      (arithmeticOffsetCountMeasure (psOffsets X) (psPrimes X) (psStart X) (psLength X)).real
        ((fun x ↦ (thresholdVectorCount (psOffsets X) x - (psL X - 1)) /
          (psL X)^(1/4 : ℝ)) ⁻¹' A) := by
  have hprime (p : ℕ) (hp : p ∈ psPrimes X) : p.Prime := (Finset.mem_filter.mp hp).2
  have hI (h : ℕ) (hh : h ∈ psOffsets X) : h < psStart X := (Finset.mem_Icc.mp hh).2.trans_lt hs
  rw [← sourceWindowSample_offsetCount_event X _ _ hprime hI]
  rw [measureReal_def, ProbabilityMeasure.map_apply' _ Measurable.of_discrete.aemeasurable hA,
    ← measureReal_def, sourceWindowSample_real, sourceWindowSample_real]
  congr 2
  apply congrArg Finset.card
  apply Finset.filter_congr
  intro n hn
  have hlo : psStart X ≤ n := (Finset.mem_Icc.mp hn).1
  have he := offsetThresholdStatistic_sourceOffsetCountVector (psPrimes X) n (psH X) (hs.trans_le hlo)
  have her := congrArg (fun k : ℕ ↦ (k : ℝ)) he
  change sourceTruncatedScaled X n ∈ A ↔ thresholdNormalized X
    (sourceOffsetCountVector (psOffsets X) (psPrimes X) n) ∈ A
  suffices eq : sourceTruncatedScaled X n =
      thresholdNormalized X (sourceOffsetCountVector (psOffsets X) (psPrimes X) n) by rw [eq]
  unfold sourceTruncatedScaled thresholdNormalized
  congr 1
  rw [← her, offsetThresholdStatistic_cast]
  unfold psOffsets
  ring

/-- A growing comparison holding for moving vector events transfers the
Poisson threshold law to the arithmetic truncated statistic. -/
theorem sourceTruncatedScaled_weak_limit {Z : ProbabilityMeasure ℝ}
    (hmodel : Tendsto (fun X ↦ poissonThresholdScaledLaw (psOffsets X) (psRate X)
      (psL X - 1) ((psL X)^(1/4 : ℝ))) atTop (𝓝 Z))
    (hs : ∀ᶠ X in atTop, psH X < psStart X)
    (hcmp : ∀ E : (X : ℕ) → Set (↥(psOffsets X) → ℕ), Tendsto (fun X ↦
      (arithmeticOffsetCountMeasure (psOffsets X) (psPrimes X) (psStart X) (psLength X)).real (E X) -
      (Measure.pi (fun _ : ↥(psOffsets X) ↦ poissonMeasure (psRate X))).real (E X)) atTop (𝓝 0)) :
    Tendsto (fun X ↦ (sourceWindowSample X).map (sourceTruncatedScaled X)) atTop (𝓝 Z) := by
  apply weak_limit_of_event_error hmodel
  intro A hA
  refine (hcmp (fun X ↦ thresholdNormalized X ⁻¹' A)).congr' ?_
  filter_upwards [hs] with X hX
  rw [sourceTruncatedScaled_event X hX A hA]
  congr 1
  unfold poissonThresholdScaledLaw
  rw [measureReal_def, measureReal_def]
  exact congrArg ENNReal.toReal (Measure.map_apply Measurable.of_discrete hA).symm

end PomeranceSarkozy
