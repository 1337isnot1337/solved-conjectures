module
public import Conjectures.PomeranceSarkozyActualCountMeasure
public import Conjectures.PomeranceSarkozyGrowingCutoffs
public import Conjectures.PomeranceSarkozySourceSample

@[expose] public section
namespace PomeranceSarkozy

open MeasureTheory
open scoped ENNReal

/-- Count the retained prime factors at an offset in the literal integer window. -/
noncomputable def windowOffsetCount (X n : ℕ) (h : ↥(psOffsets X)) : ℕ :=
  ((psPrimes X).filter fun p => p ∣ n - h.val).card

/-- Reindexing the source window by `Fin (psLength X)` preserves every count-vector event. -/
theorem window_vector_event_eq (X : ℕ) (A : Set (↥(psOffsets X) → ℕ)) :
    (sourceWindowSample X : Measure ℕ).real (windowOffsetCount X ⁻¹' A) =
      (arithmeticOffsetCountMeasure (psOffsets X) (psPrimes X) (psStart X) (psLength X)).real A := by
  classical
  have hstart : psStart X ≤ X := ceil_sqrt_le_nat X
  have hA : MeasurableSet A := A.to_countable.measurableSet
  rw [sourceWindowSample_real, measureReal_def, arithmeticOffsetCountMeasure,
    Measure.map_apply (.of_discrete) hA, Measure.uniformOfFinset_apply,
    ENNReal.toReal_div, ENNReal.toReal_natCast, ENNReal.toReal_natCast,
    Finset.card_univ, Fintype.card_fin]
  change (((Finset.Icc (psStart X) X).filter fun n => windowOffsetCount X n ∈ A).card : ℝ) /
    (psLength X : ℝ) = _
  congr 1
  apply congrArg (fun n : ℕ => (n : ℝ))
  symm
  apply Finset.card_bij (fun j _ => psStart X + j.val)
  · intro j hj
    have hjlt := j.isLt
    unfold psLength at hjlt
    refine Finset.mem_filter.mpr ⟨Finset.mem_Icc.mpr ⟨by omega, by omega⟩, ?_⟩
    exact (Finset.mem_filter.mp hj).2
  · intro j _ k _ h
    exact Fin.ext (Nat.add_left_cancel h)
  · intro n hn
    obtain ⟨hnmem, hndata⟩ := Finset.mem_filter.mp hn
    obtain ⟨hlo, hhi⟩ := Finset.mem_Icc.mp hnmem
    let j : Fin (psLength X) := ⟨n - psStart X, by unfold psLength; omega⟩
    have heq : psStart X + j.val = n := by
      dsimp [j]
      omega
    refine ⟨j, Finset.mem_filter.mpr ⟨Finset.mem_univ _, ?_⟩, heq⟩
    change windowOffsetCount X (psStart X + j.val) ∈ A
    rwa [heq]

end PomeranceSarkozy
