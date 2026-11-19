import Conjectures.DenominatorCycleOrbit

namespace DenominatorForest

open Polynomial

theorem binary_getD (word : List Nat) (h : ∀ b ∈ word, b ≤ 1) :
    ∀ i, word.getD i 0 ≤ 1 := by
  intro i
  by_cases hi : i < word.length
  · exact h _ (DenominatorFinite.getD_mem word i hi)
  · rw [List.getD_eq_default word 0 (by omega)]
    omega

theorem primary_small : ∀ i, primaryWord.getD i 0 ≤ 1 :=
  binary_getD primaryWord (by simp [primaryWord])

theorem dual_small : ∀ i, dualWord.getD i 0 ≤ 1 :=
  binary_getD dualWord (by simp [dualWord])

theorem primary_length : primaryWord.length=10 := rfl

theorem dual_length : dualWord.length=10 := rfl

theorem primary_rotations_distinct : RotationsDistinct primaryWord := by
  unfold RotationsDistinct
  decide

theorem dual_rotations_distinct : RotationsDistinct dualWord := by
  unfold RotationsDistinct
  decide

theorem dual_reverse_complement : dualWord=primaryWord.reverse.map (fun b => 1-b) := rfl

noncomputable def primarySeries : PowerSeries ℚ := wordSeries primaryWord primary_small

noncomputable def dualSeries : PowerSeries ℚ := wordSeries dualWord dual_small

theorem primary_generic_identity :
    (((1 : ℚ[X])-prefixSecond (phaseHead primaryWord 1) (phaseOffset primaryWord 1)):PowerSeries ℚ)*
      primarySeries=
      (((1-Polynomial.X)*(sumFirst primaryWord*((1:ℚ[X])-prefixSecond (phaseHead primaryWord 1) (phaseOffset primaryWord 1))+
        sumSecond primaryWord*deadPoly (phaseHead primaryWord 1) (phaseOffset primaryWord 1)):ℚ[X]):PowerSeries ℚ) := by
  exact wordSeries_identity primaryWord primary_small (by decide) rfl rfl rfl

theorem dual_generic_identity :
    (((1 : ℚ[X])-prefixSecond (phaseHead dualWord 1) (phaseOffset dualWord 1)):PowerSeries ℚ)*
      dualSeries=
      (((1-Polynomial.X)*(sumFirst dualWord*((1:ℚ[X])-prefixSecond (phaseHead dualWord 1) (phaseOffset dualWord 1))+
        sumSecond dualWord*deadPoly (phaseHead dualWord 1) (phaseOffset dualWord 1)):ℚ[X]):PowerSeries ℚ) := by
  exact wordSeries_identity dualWord dual_small (by decide) rfl rfl rfl

theorem primary_cycle_card (k : Nat) (hk : 2 ≤ k) : (cycleSet primaryWord k).card=10 := by
  apply cycleSet_card primaryWord primary_small primary_rotations_distinct k
  change 11 ≤ 10*k
  omega

theorem dual_cycle_card (k : Nat) (hk : 2 ≤ k) : (cycleSet dualWord k).card=10 := by
  apply cycleSet_card dualWord dual_small dual_rotations_distinct k
  change 11 ≤ 10*k
  omega

end DenominatorForest
