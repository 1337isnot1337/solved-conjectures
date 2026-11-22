module

public import Conjectures.AgnosticVC.NonBorelRange
public import Conjectures.AgnosticVC.SingletonExample
public import Conjectures.AgnosticVC.Obstruction
public import Mathlib.MeasureTheory.Constructions.UnitInterval

/-! The singleton-class example on the Borel unit interval. -/

@[expose] public section

open MeasureTheory ProbabilityTheory

namespace AgnosticVC

/-- The Borel unit interval contains a non-Borel set. Transport the non-Borel range on Baire
space by Mathlib's Borel isomorphism theorem. -/
private theorem exists_nonBorel_unitInterval : ∃ B : Set unitInterval, ¬ MeasurableSet B := by
  obtain ⟨f, _, hnon⟩ := exists_continuous_nat_nat_nonmeasurable_range
  have hBaire : ¬ Countable (ℕ → ℕ) := by
    intro hcount
    exact hnon (Set.to_countable _).measurableSet
  have hInterval : ¬ Countable unitInterval := by
    intro hcount
    have hzero := (Set.to_countable (Set.univ : Set unitInterval)).measure_zero volume
    simp at hzero
  have hStandard : StandardBorelSpace unitInterval := measurableSet_Icc.standardBorel
  let e : (ℕ → ℕ) ≃ᵐ unitInterval := PolishSpace.measurableEquivOfNotCountable hBaire hInterval
  exact ⟨e '' Set.range f, fun he => hnon (e.measurableSet_image.mp he)⟩

/-- A zero classifier and the singleton classifiers indexed by a non-Borel subset of the unit
interval give a jointly measurable class of VC dimension exactly one. Every trace order fails
the measurable canonical-selection requirement. For `n > c²`, every proper Markov kernel
fails the all-sample expected empirical bound at excess `c * sqrt (1/n)`. -/
theorem exists_unitInterval_singleton_obstruction :
    ∃ B : Set unitInterval,
      ¬ MeasurableSet B ∧
      ({x : unitInterval | ∃ h, singletonPredict B h x = true} = B) ∧
      Measurable (fun p : unitInterval × (Unit ⊕ B) => singletonPredict B p.2 p.1) ∧
      HasVCDimensionAtMost (singletonPredict B) 1 ∧
      ¬ HasVCDimensionAtMost (singletonPredict B) 0 ∧
      (∀ order : TraceOrder (Unit ⊕ B),
        letI := order
        ¬ HasMeasurableCanonicalRepresentatives (singletonPredict B)) ∧
      ∀ (c : ℝ) (n : ℕ), c^2 < (n : ℝ) →
        ∀ (K : Kernel (Fin n → unitInterval × Bool) (Unit ⊕ B)) [IsMarkovKernel K],
          ¬ ∀ z, (∫ h, empiricalError (singletonPredict B) z h ∂K z) ≤
            (⨅ h : Unit ⊕ B, empiricalError (singletonPredict B) z h) +
              c * Real.sqrt (1 / (n : ℝ)) := by
  obtain ⟨B, hB⟩ := exists_nonBorel_unitInterval
  have hN : B.Nonempty := by
    by_contra h
    exact hB ((Set.not_nonempty_iff_eq_empty.mp h).symm ▸ MeasurableSet.empty)
  have hJoint := measurable_singletonPredict B
  refine ⟨B, hB, singletonPredict_positive_locus B, hJoint,
    singletonPredict_vc_le_one B, singletonPredict_vc_not_zero hN, ?_, ?_⟩
  · intro order
    let := order
    intro hs
    exact singletonPredict_no_measurable_selection hB order hs.toHasMeasurableTraceSelection
  · intro c n hnc K _ hacc
    apply hB
    rw [← singletonPredict_positive_locus B]
    exact measurableSet_exists_predict_true_of_kernel_rate (singletonPredict B) hJoint K hnc hacc

end AgnosticVC
