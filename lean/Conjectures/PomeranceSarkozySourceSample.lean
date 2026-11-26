module
public import Mathlib.Probability.Distributions.Uniform
public import Mathlib.MeasureTheory.Measure.ProbabilityMeasure
public import Mathlib.Analysis.Real.Sqrt
public import Mathlib.Algebra.Order.Floor.Semiring
public import Mathlib.Order.Interval.Finset.Nat

@[expose] public section
namespace PomeranceSarkozy

open Filter MeasureTheory
open scoped ENNReal Topology Classical

/-- The uniform probability on an inhabited finite set of natural numbers. -/
noncomputable def sourceFinsetSample (S : Finset ℕ) (hS : S.Nonempty) : ProbabilityMeasure ℕ :=
  ⟨Measure.uniformOfFinset S, ⟨by
    rw [Measure.uniformOfFinset_apply]
    simp only [Set.mem_univ, Finset.filter_true]
    exact ENNReal.div_self (by exact_mod_cast hS.card_pos.ne') (ENNReal.natCast_ne_top _)⟩⟩

theorem sourceFinsetSample_real (S : Finset ℕ) (hS : S.Nonempty) (A : Set ℕ) :
    (sourceFinsetSample S hS : Measure ℕ).real A = ((S.filter fun n ↦ n ∈ A).card : ℝ) / S.card := by
  rw [measureReal_def]
  change (Measure.uniformOfFinset S A).toReal = _
  rw [Measure.uniformOfFinset_apply, ENNReal.toReal_div, ENNReal.toReal_natCast,
    ENNReal.toReal_natCast]

/-- Uniform on the positive integers up to X, with a singleton at X = 0. -/
noncomputable def sourceFullSample (X : ℕ) : ProbabilityMeasure ℕ :=
  sourceFinsetSample (Finset.Icc 1 (max X 1)) (Finset.nonempty_Icc.mpr (le_max_right _ _))

theorem sourceFullSample_real {X : ℕ} (hX : 0 < X) (A : Set ℕ) :
    (sourceFullSample X : Measure ℕ).real A =
      (((Finset.Icc 1 X).filter fun n ↦ n ∈ A).card : ℝ) / X := by
  rw [sourceFullSample, sourceFinsetSample_real, max_eq_left hX, Nat.card_Icc]
  simp

theorem ceil_sqrt_le_nat (X : ℕ) : ⌈Real.sqrt (X : ℝ)⌉₊ ≤ X := by
  apply Nat.ceil_le.mpr
  rcases X with _ | X
  · simp
  · apply (Real.sqrt_le_iff.mpr ⟨by positivity, ?_⟩)
    have hx : 1 ≤ ((X + 1 : ℕ) : ℝ) := by exact_mod_cast Nat.le_add_left 1 X
    nlinarith

/-- The arithmetic window of the proof, including both endpoints. -/
noncomputable def sourceWindowSample (X : ℕ) : ProbabilityMeasure ℕ :=
  sourceFinsetSample (Finset.Icc ⌈Real.sqrt (X : ℝ)⌉₊ X)
    (Finset.nonempty_Icc.mpr (ceil_sqrt_le_nat X))

theorem sourceWindowSample_real (X : ℕ) (A : Set ℕ) :
    (sourceWindowSample X : Measure ℕ).real A =
      (((Finset.Icc ⌈Real.sqrt (X : ℝ)⌉₊ X).filter fun n ↦ n ∈ A).card : ℝ) /
        (X + 1 - ⌈Real.sqrt (X : ℝ)⌉₊ : ℕ) := by
  rw [sourceWindowSample, sourceFinsetSample_real, Nat.card_Icc]

end PomeranceSarkozy
