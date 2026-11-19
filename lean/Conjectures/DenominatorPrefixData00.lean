import Conjectures.DenominatorPrefixTotals
import Mathlib.Tactic.NormNum
import Mathlib.Tactic.Ring

/-! Generated finite recursion rows. Every coefficient identity
is proved from the recursive equation and earlier shorter-head rows. -/
namespace DenominatorForest.PrefixCertificate
open Polynomial
theorem dead_000 : deadPoly [] 0 =
    (1 : ℚ[X]) := by
  simp

theorem dead_001 : deadPoly [] 1 =
    (1 : ℚ[X]) := by
  simp

theorem dead_002 : deadPoly [] 2 =
    (1 : ℚ[X]) := by
  simp

theorem dead_003 : deadPoly [] 3 =
    (1 : ℚ[X]) := by
  simp

theorem dead_004 : deadPoly [] 5 =
    (1 : ℚ[X]) := by
  simp

theorem dead_005 : deadPoly [] 6 =
    (1 : ℚ[X]) := by
  simp

theorem dead_006 : deadPoly [] 7 =
    (1 : ℚ[X]) := by
  simp

theorem dead_007 : deadPoly [1] 0 =
    (1 : ℚ[X]) + (1 : ℚ[X])*X^1 := by
  have h := deadPoly_eq [1] 0
  have hc : headChoices [1] 0 = {0} := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ, dead_000] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem dead_008 : deadPoly [1] 1 =
    (1 : ℚ[X]) + (1 : ℚ[X])*X^1 := by
  have h := deadPoly_eq [1] 1
  have hc : headChoices [1] 1 = {0} := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ, dead_000] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem dead_009 : deadPoly [1] 2 =
    (1 : ℚ[X]) := by
  have h := deadPoly_eq [1] 2
  have hc : headChoices [1] 2 = ∅ := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem dead_010 : deadPoly [1] 4 =
    (1 : ℚ[X]) := by
  have h := deadPoly_eq [1] 4
  have hc : headChoices [1] 4 = ∅ := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem dead_011 : deadPoly [1] 5 =
    (1 : ℚ[X]) := by
  have h := deadPoly_eq [1] 5
  have hc : headChoices [1] 5 = ∅ := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem dead_012 : deadPoly [1] 6 =
    (1 : ℚ[X]) := by
  have h := deadPoly_eq [1] 6
  have hc : headChoices [1] 6 = ∅ := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem dead_013 : deadPoly [2] (-1) =
    (1 : ℚ[X]) + (1 : ℚ[X])*X^1 := by
  have h := deadPoly_eq [2] (-1)
  have hc : headChoices [2] (-1) = {0} := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ, dead_001] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem dead_014 : deadPoly [2] 1 =
    (1 : ℚ[X]) + (1 : ℚ[X])*X^1 := by
  have h := deadPoly_eq [2] 1
  have hc : headChoices [2] 1 = {0} := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ, dead_001] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem dead_015 : deadPoly [2] 2 =
    (1 : ℚ[X]) + (1 : ℚ[X])*X^1 := by
  have h := deadPoly_eq [2] 2
  have hc : headChoices [2] 2 = {0} := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ, dead_001] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem dead_016 : deadPoly [2] 4 =
    (1 : ℚ[X]) := by
  have h := deadPoly_eq [2] 4
  have hc : headChoices [2] 4 = ∅ := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem dead_017 : deadPoly [2] 5 =
    (1 : ℚ[X]) := by
  have h := deadPoly_eq [2] 5
  have hc : headChoices [2] 5 = ∅ := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem dead_018 : deadPoly [2] 6 =
    (1 : ℚ[X]) := by
  have h := deadPoly_eq [2] 6
  have hc : headChoices [2] 6 = ∅ := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem dead_019 : deadPoly [3] (-1) =
    (1 : ℚ[X]) + (1 : ℚ[X])*X^1 := by
  have h := deadPoly_eq [3] (-1)
  have hc : headChoices [3] (-1) = {0} := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ, dead_002] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem dead_020 : deadPoly [3] 0 =
    (1 : ℚ[X]) + (1 : ℚ[X])*X^1 := by
  have h := deadPoly_eq [3] 0
  have hc : headChoices [3] 0 = {0} := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ, dead_002] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem dead_021 : deadPoly [3] 4 =
    (1 : ℚ[X]) := by
  have h := deadPoly_eq [3] 4
  have hc : headChoices [3] 4 = ∅ := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem dead_022 : deadPoly [3] 6 =
    (1 : ℚ[X]) := by
  have h := deadPoly_eq [3] 6
  have hc : headChoices [3] 6 = ∅ := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem dead_023 : deadPoly [4] (-1) =
    (1 : ℚ[X]) + (1 : ℚ[X])*X^1 := by
  have h := deadPoly_eq [4] (-1)
  have hc : headChoices [4] (-1) = {0} := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ, dead_003] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem dead_024 : deadPoly [4] 0 =
    (1 : ℚ[X]) + (1 : ℚ[X])*X^1 := by
  have h := deadPoly_eq [4] 0
  have hc : headChoices [4] 0 = {0} := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ, dead_003] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem dead_025 : deadPoly [4] 5 =
    (1 : ℚ[X]) := by
  have h := deadPoly_eq [4] 5
  have hc : headChoices [4] 5 = ∅ := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem dead_026 : deadPoly [4] 6 =
    (1 : ℚ[X]) := by
  have h := deadPoly_eq [4] 6
  have hc : headChoices [4] 6 = ∅ := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem dead_027 : deadPoly [6] (-1) =
    (1 : ℚ[X]) + (1 : ℚ[X])*X^1 := by
  have h := deadPoly_eq [6] (-1)
  have hc : headChoices [6] (-1) = {0} := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ, dead_004] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem dead_028 : deadPoly [6] 0 =
    (1 : ℚ[X]) + (1 : ℚ[X])*X^1 := by
  have h := deadPoly_eq [6] 0
  have hc : headChoices [6] 0 = {0} := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ, dead_004] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem dead_029 : deadPoly [6] 1 =
    (1 : ℚ[X]) + (1 : ℚ[X])*X^1 := by
  have h := deadPoly_eq [6] 1
  have hc : headChoices [6] 1 = {0} := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ, dead_004] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem dead_030 : deadPoly [6] 6 =
    (1 : ℚ[X]) + (1 : ℚ[X])*X^1 := by
  have h := deadPoly_eq [6] 6
  have hc : headChoices [6] 6 = {0} := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ, dead_004] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem dead_031 : deadPoly [7] (-1) =
    (1 : ℚ[X]) + (1 : ℚ[X])*X^1 := by
  have h := deadPoly_eq [7] (-1)
  have hc : headChoices [7] (-1) = {0} := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ, dead_005] at h
  calc
    _ = _ := h
    _ = _ := by ring

end DenominatorForest.PrefixCertificate
