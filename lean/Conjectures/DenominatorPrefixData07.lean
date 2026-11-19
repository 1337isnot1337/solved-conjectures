import Conjectures.DenominatorPrefixData06
import Mathlib.Tactic.NormNum
import Mathlib.Tactic.Ring

/-! Generated finite recursion rows. Every coefficient identity
is proved from the recursive equation and earlier shorter-head rows. -/
namespace DenominatorForest.PrefixCertificate
open Polynomial
theorem second_015 : prefixSecond [2] 2 =
    (0 : ℚ[X]) := by
  have h := prefixSecond_eq [2] 2
  have hc : headChoices [2] 2 = {0} := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ, freePoly, second_001] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem second_016 : prefixSecond [2] 4 =
    (0 : ℚ[X]) := by
  have h := prefixSecond_eq [2] 4
  have hc : headChoices [2] 4 = ∅ := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ, freePoly] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem second_017 : prefixSecond [2] 5 =
    (0 : ℚ[X]) := by
  have h := prefixSecond_eq [2] 5
  have hc : headChoices [2] 5 = ∅ := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ, freePoly] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem second_018 : prefixSecond [2] 6 =
    (0 : ℚ[X]) := by
  have h := prefixSecond_eq [2] 6
  have hc : headChoices [2] 6 = ∅ := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ, freePoly] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem second_019 : prefixSecond [3] (-1) =
    (1 : ℚ[X])*X^1 + (1 : ℚ[X])*X^2 := by
  have h := prefixSecond_eq [3] (-1)
  have hc : headChoices [3] (-1) = {0} := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ, freePoly, dead_019, second_002] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem second_020 : prefixSecond [3] 0 =
    (0 : ℚ[X]) := by
  have h := prefixSecond_eq [3] 0
  have hc : headChoices [3] 0 = {0} := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ, freePoly, second_002] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem second_021 : prefixSecond [3] 4 =
    (0 : ℚ[X]) := by
  have h := prefixSecond_eq [3] 4
  have hc : headChoices [3] 4 = ∅ := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ, freePoly] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem second_022 : prefixSecond [3] 6 =
    (0 : ℚ[X]) := by
  have h := prefixSecond_eq [3] 6
  have hc : headChoices [3] 6 = ∅ := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ, freePoly] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem second_023 : prefixSecond [4] (-1) =
    (1 : ℚ[X])*X^1 + (1 : ℚ[X])*X^2 := by
  have h := prefixSecond_eq [4] (-1)
  have hc : headChoices [4] (-1) = {0} := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ, freePoly, dead_023, second_003] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem second_024 : prefixSecond [4] 0 =
    (0 : ℚ[X]) := by
  have h := prefixSecond_eq [4] 0
  have hc : headChoices [4] 0 = {0} := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ, freePoly, second_003] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem second_025 : prefixSecond [4] 5 =
    (0 : ℚ[X]) := by
  have h := prefixSecond_eq [4] 5
  have hc : headChoices [4] 5 = ∅ := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ, freePoly] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem second_026 : prefixSecond [4] 6 =
    (0 : ℚ[X]) := by
  have h := prefixSecond_eq [4] 6
  have hc : headChoices [4] 6 = ∅ := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ, freePoly] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem second_027 : prefixSecond [6] (-1) =
    (1 : ℚ[X])*X^1 + (1 : ℚ[X])*X^2 := by
  have h := prefixSecond_eq [6] (-1)
  have hc : headChoices [6] (-1) = {0} := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ, freePoly, dead_027, second_004] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem second_028 : prefixSecond [6] 0 =
    (0 : ℚ[X]) := by
  have h := prefixSecond_eq [6] 0
  have hc : headChoices [6] 0 = {0} := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ, freePoly, second_004] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem second_029 : prefixSecond [6] 1 =
    (0 : ℚ[X]) := by
  have h := prefixSecond_eq [6] 1
  have hc : headChoices [6] 1 = {0} := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ, freePoly, second_004] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem second_030 : prefixSecond [6] 6 =
    (0 : ℚ[X]) := by
  have h := prefixSecond_eq [6] 6
  have hc : headChoices [6] 6 = {0} := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ, freePoly, second_004] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem second_031 : prefixSecond [7] (-1) =
    (1 : ℚ[X])*X^1 + (1 : ℚ[X])*X^2 := by
  have h := prefixSecond_eq [7] (-1)
  have hc : headChoices [7] (-1) = {0} := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ, freePoly, dead_031, second_005] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem second_032 : prefixSecond [7] 0 =
    (0 : ℚ[X]) := by
  have h := prefixSecond_eq [7] 0
  have hc : headChoices [7] 0 = {0} := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ, freePoly, second_005] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem second_033 : prefixSecond [7] 2 =
    (0 : ℚ[X]) := by
  have h := prefixSecond_eq [7] 2
  have hc : headChoices [7] 2 = {0} := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ, freePoly, second_005] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem second_034 : prefixSecond [7] 6 =
    (0 : ℚ[X]) := by
  have h := prefixSecond_eq [7] 6
  have hc : headChoices [7] 6 = {0} := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ, freePoly, second_005] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem second_035 : prefixSecond [8] (-1) =
    (1 : ℚ[X])*X^1 + (1 : ℚ[X])*X^2 := by
  have h := prefixSecond_eq [8] (-1)
  have hc : headChoices [8] (-1) = {0} := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ, freePoly, dead_035, second_006] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem second_036 : prefixSecond [8] 0 =
    (0 : ℚ[X]) := by
  have h := prefixSecond_eq [8] 0
  have hc : headChoices [8] 0 = {0} := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ, freePoly, second_006] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem second_037 : prefixSecond [8] 1 =
    (0 : ℚ[X]) := by
  have h := prefixSecond_eq [8] 1
  have hc : headChoices [8] 1 = {0} := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ, freePoly, second_006] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem second_038 : prefixSecond [8] 2 =
    (0 : ℚ[X]) := by
  have h := prefixSecond_eq [8] 2
  have hc : headChoices [8] 2 = {0} := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ, freePoly, second_006] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem second_039 : prefixSecond [8] 4 =
    (0 : ℚ[X]) := by
  have h := prefixSecond_eq [8] 4
  have hc : headChoices [8] 4 = {0} := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ, freePoly, second_006] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem second_040 : prefixSecond [8] 5 =
    (0 : ℚ[X]) := by
  have h := prefixSecond_eq [8] 5
  have hc : headChoices [8] 5 = {0} := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ, freePoly, second_006] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem second_041 : prefixSecond [1,1] (-1) =
    (1 : ℚ[X])*X^2 + (2 : ℚ[X])*X^3 := by
  have h := prefixSecond_eq [1,1] (-1)
  have hc : headChoices [1,1] (-1) = {0,1} := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ, freePoly, second_007, second_013] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem second_042 : prefixSecond [1,1] 0 =
    (1 : ℚ[X])*X^2 + (2 : ℚ[X])*X^3 := by
  have h := prefixSecond_eq [1,1] 0
  have hc : headChoices [1,1] 0 = {0,1} := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ, freePoly, second_007, second_013] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem second_043 : prefixSecond [1,1] 1 =
    (1 : ℚ[X])*X^3 := by
  have h := prefixSecond_eq [1,1] 1
  have hc : headChoices [1,1] 1 = {0} := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ, freePoly, second_007] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem second_044 : prefixSecond [1,1] 3 =
    (0 : ℚ[X]) := by
  have h := prefixSecond_eq [1,1] 3
  have hc : headChoices [1,1] 3 = ∅ := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ, freePoly] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem second_045 : prefixSecond [1,1] 4 =
    (0 : ℚ[X]) := by
  have h := prefixSecond_eq [1,1] 4
  have hc : headChoices [1,1] 4 = ∅ := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ, freePoly] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem second_046 : prefixSecond [1,1] 5 =
    (0 : ℚ[X]) := by
  have h := prefixSecond_eq [1,1] 5
  have hc : headChoices [1,1] 5 = ∅ := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ, freePoly] at h
  calc
    _ = _ := h
    _ = _ := by ring

end DenominatorForest.PrefixCertificate
