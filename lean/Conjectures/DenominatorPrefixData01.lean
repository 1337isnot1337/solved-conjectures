import Conjectures.DenominatorPrefixData00
import Mathlib.Tactic.NormNum
import Mathlib.Tactic.Ring

/-! Generated finite recursion rows. Every coefficient identity
is proved from the recursive equation and earlier shorter-head rows. -/
namespace DenominatorForest.PrefixCertificate
open Polynomial
theorem dead_032 : deadPoly [7] 0 =
    (1 : ℚ[X]) + (1 : ℚ[X])*X^1 := by
  have h := deadPoly_eq [7] 0
  have hc : headChoices [7] 0 = {0} := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ, dead_005] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem dead_033 : deadPoly [7] 2 =
    (1 : ℚ[X]) + (1 : ℚ[X])*X^1 := by
  have h := deadPoly_eq [7] 2
  have hc : headChoices [7] 2 = {0} := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ, dead_005] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem dead_034 : deadPoly [7] 6 =
    (1 : ℚ[X]) + (1 : ℚ[X])*X^1 := by
  have h := deadPoly_eq [7] 6
  have hc : headChoices [7] 6 = {0} := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ, dead_005] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem dead_035 : deadPoly [8] (-1) =
    (1 : ℚ[X]) + (1 : ℚ[X])*X^1 := by
  have h := deadPoly_eq [8] (-1)
  have hc : headChoices [8] (-1) = {0} := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ, dead_006] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem dead_036 : deadPoly [8] 0 =
    (1 : ℚ[X]) + (1 : ℚ[X])*X^1 := by
  have h := deadPoly_eq [8] 0
  have hc : headChoices [8] 0 = {0} := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ, dead_006] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem dead_037 : deadPoly [8] 1 =
    (1 : ℚ[X]) + (1 : ℚ[X])*X^1 := by
  have h := deadPoly_eq [8] 1
  have hc : headChoices [8] 1 = {0} := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ, dead_006] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem dead_038 : deadPoly [8] 2 =
    (1 : ℚ[X]) + (1 : ℚ[X])*X^1 := by
  have h := deadPoly_eq [8] 2
  have hc : headChoices [8] 2 = {0} := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ, dead_006] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem dead_039 : deadPoly [8] 4 =
    (1 : ℚ[X]) + (1 : ℚ[X])*X^1 := by
  have h := deadPoly_eq [8] 4
  have hc : headChoices [8] 4 = {0} := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ, dead_006] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem dead_040 : deadPoly [8] 5 =
    (1 : ℚ[X]) + (1 : ℚ[X])*X^1 := by
  have h := deadPoly_eq [8] 5
  have hc : headChoices [8] 5 = {0} := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ, dead_006] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem dead_041 : deadPoly [1,1] (-1) =
    (1 : ℚ[X]) + (2 : ℚ[X])*X^1 + (2 : ℚ[X])*X^2 := by
  have h := deadPoly_eq [1,1] (-1)
  have hc : headChoices [1,1] (-1) = {0,1} := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ, dead_007, dead_013] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem dead_042 : deadPoly [1,1] 0 =
    (1 : ℚ[X]) + (2 : ℚ[X])*X^1 + (2 : ℚ[X])*X^2 := by
  have h := deadPoly_eq [1,1] 0
  have hc : headChoices [1,1] 0 = {0,1} := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ, dead_007, dead_013] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem dead_043 : deadPoly [1,1] 1 =
    (1 : ℚ[X]) + (1 : ℚ[X])*X^1 + (1 : ℚ[X])*X^2 := by
  have h := deadPoly_eq [1,1] 1
  have hc : headChoices [1,1] 1 = {0} := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ, dead_007] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem dead_044 : deadPoly [1,1] 3 =
    (1 : ℚ[X]) := by
  have h := deadPoly_eq [1,1] 3
  have hc : headChoices [1,1] 3 = ∅ := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem dead_045 : deadPoly [1,1] 4 =
    (1 : ℚ[X]) := by
  have h := deadPoly_eq [1,1] 4
  have hc : headChoices [1,1] 4 = ∅ := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem dead_046 : deadPoly [1,1] 5 =
    (1 : ℚ[X]) := by
  have h := deadPoly_eq [1,1] 5
  have hc : headChoices [1,1] 5 = ∅ := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem dead_047 : deadPoly [2,1] (-1) =
    (1 : ℚ[X]) + (2 : ℚ[X])*X^1 + (2 : ℚ[X])*X^2 := by
  have h := deadPoly_eq [2,1] (-1)
  have hc : headChoices [2,1] (-1) = {0,1} := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ, dead_008, dead_019] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem dead_048 : deadPoly [2,1] 3 =
    (1 : ℚ[X]) := by
  have h := deadPoly_eq [2,1] 3
  have hc : headChoices [2,1] 3 = ∅ := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem dead_049 : deadPoly [2,1] 5 =
    (1 : ℚ[X]) := by
  have h := deadPoly_eq [2,1] 5
  have hc : headChoices [2,1] 5 = ∅ := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem dead_050 : deadPoly [2,2] (-2) =
    (1 : ℚ[X]) + (2 : ℚ[X])*X^1 + (2 : ℚ[X])*X^2 := by
  have h := deadPoly_eq [2,2] (-2)
  have hc : headChoices [2,2] (-2) = {0,1} := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ, dead_014, dead_020] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem dead_051 : deadPoly [2,2] 3 =
    (1 : ℚ[X]) := by
  have h := deadPoly_eq [2,2] 3
  have hc : headChoices [2,2] 3 = ∅ := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem dead_052 : deadPoly [2,2] 5 =
    (1 : ℚ[X]) := by
  have h := deadPoly_eq [2,2] 5
  have hc : headChoices [2,2] 5 = ∅ := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem dead_053 : deadPoly [3,1] (-1) =
    (1 : ℚ[X]) + (2 : ℚ[X])*X^1 + (1 : ℚ[X])*X^2 := by
  have h := deadPoly_eq [3,1] (-1)
  have hc : headChoices [3,1] (-1) = {0,1} := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ, dead_009, dead_023] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem dead_054 : deadPoly [3,1] 4 =
    (1 : ℚ[X]) := by
  have h := deadPoly_eq [3,1] 4
  have hc : headChoices [3,1] 4 = ∅ := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem dead_055 : deadPoly [3,1] 5 =
    (1 : ℚ[X]) := by
  have h := deadPoly_eq [3,1] 5
  have hc : headChoices [3,1] 5 = ∅ := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem dead_056 : deadPoly [3,2] (-2) =
    (1 : ℚ[X]) + (2 : ℚ[X])*X^1 + (2 : ℚ[X])*X^2 := by
  have h := deadPoly_eq [3,2] (-2)
  have hc : headChoices [3,2] (-2) = {0,1} := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ, dead_015, dead_024] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem dead_057 : deadPoly [3,2] 4 =
    (1 : ℚ[X]) := by
  have h := deadPoly_eq [3,2] 4
  have hc : headChoices [3,2] 4 = ∅ := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem dead_058 : deadPoly [3,2] 5 =
    (1 : ℚ[X]) := by
  have h := deadPoly_eq [3,2] 5
  have hc : headChoices [3,2] 5 = ∅ := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem dead_059 : deadPoly [5,1] (-1) =
    (1 : ℚ[X]) + (2 : ℚ[X])*X^1 + (1 : ℚ[X])*X^2 := by
  have h := deadPoly_eq [5,1] (-1)
  have hc : headChoices [5,1] (-1) = {0,1} := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ, dead_010, dead_027] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem dead_060 : deadPoly [5,1] 0 =
    (1 : ℚ[X]) + (2 : ℚ[X])*X^1 + (1 : ℚ[X])*X^2 := by
  have h := deadPoly_eq [5,1] 0
  have hc : headChoices [5,1] 0 = {0,1} := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ, dead_010, dead_027] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem dead_061 : deadPoly [5,1] 5 =
    (1 : ℚ[X]) + (1 : ℚ[X])*X^1 := by
  have h := deadPoly_eq [5,1] 5
  have hc : headChoices [5,1] 5 = {0} := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ, dead_010] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem dead_062 : deadPoly [5,2] (-2) =
    (1 : ℚ[X]) + (2 : ℚ[X])*X^1 + (1 : ℚ[X])*X^2 := by
  have h := deadPoly_eq [5,2] (-2)
  have hc : headChoices [5,2] (-2) = {0,1} := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ, dead_016, dead_028] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem dead_063 : deadPoly [5,2] 0 =
    (1 : ℚ[X]) + (2 : ℚ[X])*X^1 + (1 : ℚ[X])*X^2 := by
  have h := deadPoly_eq [5,2] 0
  have hc : headChoices [5,2] 0 = {0,1} := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ, dead_016, dead_028] at h
  calc
    _ = _ := h
    _ = _ := by ring

end DenominatorForest.PrefixCertificate
