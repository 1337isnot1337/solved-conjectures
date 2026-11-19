import Conjectures.DenominatorPrefixData08
import Mathlib.Tactic.NormNum
import Mathlib.Tactic.Ring

/-! Generated finite recursion rows. Every coefficient identity
is proved from the recursive equation and earlier shorter-head rows. -/
namespace DenominatorForest.PrefixCertificate
open Polynomial
theorem second_079 : prefixSecond [7,1] 1 =
    (0 : ℚ[X]) := by
  have h := prefixSecond_eq [7,1] 1
  have hc : headChoices [7,1] 1 = {0} := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ, freePoly, second_012] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem second_080 : prefixSecond [7,1] 3 =
    (0 : ℚ[X]) := by
  have h := prefixSecond_eq [7,1] 3
  have hc : headChoices [7,1] 3 = {0} := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ, freePoly, second_012] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem second_081 : prefixSecond [7,1] 4 =
    (0 : ℚ[X]) := by
  have h := prefixSecond_eq [7,1] 4
  have hc : headChoices [7,1] 4 = {0} := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ, freePoly, second_012] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem second_082 : prefixSecond [7,2] (-2) =
    (1 : ℚ[X])*X^1 + (2 : ℚ[X])*X^2 + (1 : ℚ[X])*X^3 := by
  have h := prefixSecond_eq [7,2] (-2)
  have hc : headChoices [7,2] (-2) = {0,1} := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ, freePoly, dead_082, second_018, second_036] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem second_083 : prefixSecond [7,2] 0 =
    (0 : ℚ[X]) := by
  have h := prefixSecond_eq [7,2] 0
  have hc : headChoices [7,2] 0 = {0,1} := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ, freePoly, second_018, second_036] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem second_084 : prefixSecond [7,2] 1 =
    (0 : ℚ[X]) := by
  have h := prefixSecond_eq [7,2] 1
  have hc : headChoices [7,2] 1 = {0,1} := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ, freePoly, second_018, second_036] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem second_085 : prefixSecond [7,2] 3 =
    (0 : ℚ[X]) := by
  have h := prefixSecond_eq [7,2] 3
  have hc : headChoices [7,2] 3 = {0} := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ, freePoly, second_018] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem second_086 : prefixSecond [7,2] 4 =
    (0 : ℚ[X]) := by
  have h := prefixSecond_eq [7,2] 4
  have hc : headChoices [7,2] 4 = {0} := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ, freePoly, second_018] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem second_087 : prefixSecond [7,3] (-2) =
    (1 : ℚ[X])*X^1 + (2 : ℚ[X])*X^2 + (1 : ℚ[X])*X^3 := by
  have h := prefixSecond_eq [7,3] (-2)
  have hc : headChoices [7,3] (-2) = {0,1} := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ, freePoly, dead_087, second_022, second_037] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem second_088 : prefixSecond [7,3] (-1) =
    (0 : ℚ[X]) := by
  have h := prefixSecond_eq [7,3] (-1)
  have hc : headChoices [7,3] (-1) = {0,1} := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ, freePoly, second_022, second_037] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem second_089 : prefixSecond [7,3] 3 =
    (0 : ℚ[X]) := by
  have h := prefixSecond_eq [7,3] 3
  have hc : headChoices [7,3] 3 = {0} := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ, freePoly, second_022] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem second_090 : prefixSecond [7,4] (-2) =
    (1 : ℚ[X])*X^1 + (2 : ℚ[X])*X^2 + (1 : ℚ[X])*X^3 := by
  have h := prefixSecond_eq [7,4] (-2)
  have hc : headChoices [7,4] (-2) = {0,1} := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ, freePoly, dead_090, second_026, second_038] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem second_091 : prefixSecond [7,4] (-1) =
    (0 : ℚ[X]) := by
  have h := prefixSecond_eq [7,4] (-1)
  have hc : headChoices [7,4] (-1) = {0,1} := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ, freePoly, second_026, second_038] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem second_092 : prefixSecond [7,4] 4 =
    (0 : ℚ[X]) := by
  have h := prefixSecond_eq [7,4] 4
  have hc : headChoices [7,4] 4 = {0} := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ, freePoly, second_026] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem second_093 : prefixSecond [7,6] (-2) =
    (1 : ℚ[X])*X^1 + (2 : ℚ[X])*X^2 + (2 : ℚ[X])*X^3 := by
  have h := prefixSecond_eq [7,6] (-2)
  have hc : headChoices [7,6] (-2) = {0,1} := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ, freePoly, dead_093, second_030, second_039] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem second_094 : prefixSecond [7,6] (-1) =
    (0 : ℚ[X]) := by
  have h := prefixSecond_eq [7,6] (-1)
  have hc : headChoices [7,6] (-1) = {0,1} := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ, freePoly, second_030, second_039] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem second_095 : prefixSecond [7,6] 0 =
    (0 : ℚ[X]) := by
  have h := prefixSecond_eq [7,6] 0
  have hc : headChoices [7,6] 0 = {0,1} := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ, freePoly, second_030, second_039] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem second_096 : prefixSecond [7,7] (-2) =
    (1 : ℚ[X])*X^1 + (2 : ℚ[X])*X^2 + (2 : ℚ[X])*X^3 := by
  have h := prefixSecond_eq [7,7] (-2)
  have hc : headChoices [7,7] (-2) = {0,1} := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ, freePoly, dead_096, second_034, second_040] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem second_097 : prefixSecond [7,7] (-1) =
    (0 : ℚ[X]) := by
  have h := prefixSecond_eq [7,7] (-1)
  have hc : headChoices [7,7] (-1) = {0,1} := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ, freePoly, second_034, second_040] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem second_098 : prefixSecond [7,7] 1 =
    (0 : ℚ[X]) := by
  have h := prefixSecond_eq [7,7] 1
  have hc : headChoices [7,7] 1 = {0,1} := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ, freePoly, second_034, second_040] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem second_099 : prefixSecond [0,1,1] 0 =
    (1 : ℚ[X])*X^3 + (2 : ℚ[X])*X^4 := by
  have h := prefixSecond_eq [0,1,1] 0
  have hc : headChoices [0,1,1] 0 = {0} := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ, freePoly, second_041] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem second_100 : prefixSecond [0,1,1] 3 =
    (0 : ℚ[X]) := by
  have h := prefixSecond_eq [0,1,1] 3
  have hc : headChoices [0,1,1] 3 = ∅ := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ, freePoly] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem second_101 : prefixSecond [0,1,1] 4 =
    (0 : ℚ[X]) := by
  have h := prefixSecond_eq [0,1,1] 4
  have hc : headChoices [0,1,1] 4 = ∅ := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ, freePoly] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem second_102 : prefixSecond [1,1,1] (-1) =
    (1 : ℚ[X])*X^2 + (4 : ℚ[X])*X^3 + (6 : ℚ[X])*X^4 := by
  have h := prefixSecond_eq [1,1,1] (-1)
  have hc : headChoices [1,1,1] (-1) = {0,1,2} := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ, freePoly, second_042, second_047, second_050] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem second_103 : prefixSecond [1,1,1] 2 =
    (0 : ℚ[X]) := by
  have h := prefixSecond_eq [1,1,1] 2
  have hc : headChoices [1,1,1] 2 = ∅ := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ, freePoly] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem second_104 : prefixSecond [1,1,1] 4 =
    (0 : ℚ[X]) := by
  have h := prefixSecond_eq [1,1,1] 4
  have hc : headChoices [1,1,1] 4 = ∅ := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ, freePoly] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem second_105 : prefixSecond [2,1,1] (-2) =
    (1 : ℚ[X])*X^2 + (3 : ℚ[X])*X^3 + (4 : ℚ[X])*X^4 := by
  have h := prefixSecond_eq [2,1,1] (-2)
  have hc : headChoices [2,1,1] (-2) = {0,1,2} := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ, freePoly, second_043, second_053, second_056] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem second_106 : prefixSecond [2,1,1] 3 =
    (0 : ℚ[X]) := by
  have h := prefixSecond_eq [2,1,1] 3
  have hc : headChoices [2,1,1] 3 = ∅ := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ, freePoly] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem second_107 : prefixSecond [2,1,1] 4 =
    (0 : ℚ[X]) := by
  have h := prefixSecond_eq [2,1,1] 4
  have hc : headChoices [2,1,1] 4 = ∅ := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ, freePoly] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem second_108 : prefixSecond [4,1,1] (-1) =
    (1 : ℚ[X])*X^2 + (3 : ℚ[X])*X^3 + (2 : ℚ[X])*X^4 := by
  have h := prefixSecond_eq [4,1,1] (-1)
  have hc : headChoices [4,1,1] (-1) = {0,1,2} := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ, freePoly, second_044, second_059, second_062] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem second_109 : prefixSecond [4,1,1] 4 =
    (0 : ℚ[X]) := by
  have h := prefixSecond_eq [4,1,1] 4
  have hc : headChoices [4,1,1] 4 = {0} := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ, freePoly, second_044] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem second_110 : prefixSecond [4,2,1] (-2) =
    (1 : ℚ[X])*X^2 + (3 : ℚ[X])*X^3 + (2 : ℚ[X])*X^4 := by
  have h := prefixSecond_eq [4,2,1] (-2)
  have hc : headChoices [4,2,1] (-2) = {0,1,2} := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ, freePoly, second_048, second_060, second_065] at h
  calc
    _ = _ := h
    _ = _ := by ring

end DenominatorForest.PrefixCertificate
