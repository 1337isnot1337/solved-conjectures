import Conjectures.DenominatorPrefixData01
import Mathlib.Tactic.NormNum
import Mathlib.Tactic.Ring

/-! Generated finite recursion rows. Every coefficient identity
is proved from the recursive equation and earlier shorter-head rows. -/
namespace DenominatorForest.PrefixCertificate
open Polynomial
theorem dead_064 : deadPoly [5,2] 5 =
    (1 : ℚ[X]) + (1 : ℚ[X])*X^1 := by
  have h := deadPoly_eq [5,2] 5
  have hc : headChoices [5,2] 5 = {0} := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ, dead_016] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem dead_065 : deadPoly [5,3] (-2) =
    (1 : ℚ[X]) + (2 : ℚ[X])*X^1 + (1 : ℚ[X])*X^2 := by
  have h := deadPoly_eq [5,3] (-2)
  have hc : headChoices [5,3] (-2) = {0,1} := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ, dead_021, dead_029] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem dead_066 : deadPoly [5,3] (-1) =
    (1 : ℚ[X]) + (2 : ℚ[X])*X^1 + (1 : ℚ[X])*X^2 := by
  have h := deadPoly_eq [5,3] (-1)
  have hc : headChoices [5,3] (-1) = {0,1} := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ, dead_021, dead_029] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem dead_067 : deadPoly [5,3] 5 =
    (1 : ℚ[X]) + (1 : ℚ[X])*X^1 := by
  have h := deadPoly_eq [5,3] 5
  have hc : headChoices [5,3] 5 = {0} := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ, dead_021] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem dead_068 : deadPoly [6,1] (-1) =
    (1 : ℚ[X]) + (2 : ℚ[X])*X^1 + (1 : ℚ[X])*X^2 := by
  have h := deadPoly_eq [6,1] (-1)
  have hc : headChoices [6,1] (-1) = {0,1} := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ, dead_011, dead_031] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem dead_069 : deadPoly [6,1] 1 =
    (1 : ℚ[X]) + (1 : ℚ[X])*X^1 := by
  have h := deadPoly_eq [6,1] 1
  have hc : headChoices [6,1] 1 = {0} := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ, dead_011] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem dead_070 : deadPoly [6,1] 5 =
    (1 : ℚ[X]) + (1 : ℚ[X])*X^1 := by
  have h := deadPoly_eq [6,1] 5
  have hc : headChoices [6,1] 5 = {0} := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ, dead_011] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem dead_071 : deadPoly [6,2] (-2) =
    (1 : ℚ[X]) + (2 : ℚ[X])*X^1 + (1 : ℚ[X])*X^2 := by
  have h := deadPoly_eq [6,2] (-2)
  have hc : headChoices [6,2] (-2) = {0,1} := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ, dead_017, dead_032] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem dead_072 : deadPoly [6,2] 1 =
    (1 : ℚ[X]) + (2 : ℚ[X])*X^1 + (1 : ℚ[X])*X^2 := by
  have h := deadPoly_eq [6,2] 1
  have hc : headChoices [6,2] 1 = {0,1} := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ, dead_017, dead_032] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem dead_073 : deadPoly [6,2] 5 =
    (1 : ℚ[X]) + (1 : ℚ[X])*X^1 := by
  have h := deadPoly_eq [6,2] 5
  have hc : headChoices [6,2] 5 = {0} := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ, dead_017] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem dead_074 : deadPoly [6,4] (-2) =
    (1 : ℚ[X]) + (2 : ℚ[X])*X^1 + (1 : ℚ[X])*X^2 := by
  have h := deadPoly_eq [6,4] (-2)
  have hc : headChoices [6,4] (-2) = {0,1} := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ, dead_025, dead_033] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem dead_075 : deadPoly [6,4] (-1) =
    (1 : ℚ[X]) + (2 : ℚ[X])*X^1 + (1 : ℚ[X])*X^2 := by
  have h := deadPoly_eq [6,4] (-1)
  have hc : headChoices [6,4] (-1) = {0,1} := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ, dead_025, dead_033] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem dead_076 : deadPoly [6,4] 5 =
    (1 : ℚ[X]) + (1 : ℚ[X])*X^1 := by
  have h := deadPoly_eq [6,4] 5
  have hc : headChoices [6,4] 5 = {0} := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ, dead_025] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem dead_077 : deadPoly [7,1] (-1) =
    (1 : ℚ[X]) + (2 : ℚ[X])*X^1 + (1 : ℚ[X])*X^2 := by
  have h := deadPoly_eq [7,1] (-1)
  have hc : headChoices [7,1] (-1) = {0,1} := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ, dead_012, dead_035] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem dead_078 : deadPoly [7,1] 0 =
    (1 : ℚ[X]) + (2 : ℚ[X])*X^1 + (1 : ℚ[X])*X^2 := by
  have h := deadPoly_eq [7,1] 0
  have hc : headChoices [7,1] 0 = {0,1} := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ, dead_012, dead_035] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem dead_079 : deadPoly [7,1] 1 =
    (1 : ℚ[X]) + (1 : ℚ[X])*X^1 := by
  have h := deadPoly_eq [7,1] 1
  have hc : headChoices [7,1] 1 = {0} := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ, dead_012] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem dead_080 : deadPoly [7,1] 3 =
    (1 : ℚ[X]) + (1 : ℚ[X])*X^1 := by
  have h := deadPoly_eq [7,1] 3
  have hc : headChoices [7,1] 3 = {0} := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ, dead_012] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem dead_081 : deadPoly [7,1] 4 =
    (1 : ℚ[X]) + (1 : ℚ[X])*X^1 := by
  have h := deadPoly_eq [7,1] 4
  have hc : headChoices [7,1] 4 = {0} := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ, dead_012] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem dead_082 : deadPoly [7,2] (-2) =
    (1 : ℚ[X]) + (2 : ℚ[X])*X^1 + (1 : ℚ[X])*X^2 := by
  have h := deadPoly_eq [7,2] (-2)
  have hc : headChoices [7,2] (-2) = {0,1} := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ, dead_018, dead_036] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem dead_083 : deadPoly [7,2] 0 =
    (1 : ℚ[X]) + (2 : ℚ[X])*X^1 + (1 : ℚ[X])*X^2 := by
  have h := deadPoly_eq [7,2] 0
  have hc : headChoices [7,2] 0 = {0,1} := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ, dead_018, dead_036] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem dead_084 : deadPoly [7,2] 1 =
    (1 : ℚ[X]) + (2 : ℚ[X])*X^1 + (1 : ℚ[X])*X^2 := by
  have h := deadPoly_eq [7,2] 1
  have hc : headChoices [7,2] 1 = {0,1} := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ, dead_018, dead_036] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem dead_085 : deadPoly [7,2] 3 =
    (1 : ℚ[X]) + (1 : ℚ[X])*X^1 := by
  have h := deadPoly_eq [7,2] 3
  have hc : headChoices [7,2] 3 = {0} := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ, dead_018] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem dead_086 : deadPoly [7,2] 4 =
    (1 : ℚ[X]) + (1 : ℚ[X])*X^1 := by
  have h := deadPoly_eq [7,2] 4
  have hc : headChoices [7,2] 4 = {0} := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ, dead_018] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem dead_087 : deadPoly [7,3] (-2) =
    (1 : ℚ[X]) + (2 : ℚ[X])*X^1 + (1 : ℚ[X])*X^2 := by
  have h := deadPoly_eq [7,3] (-2)
  have hc : headChoices [7,3] (-2) = {0,1} := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ, dead_022, dead_037] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem dead_088 : deadPoly [7,3] (-1) =
    (1 : ℚ[X]) + (2 : ℚ[X])*X^1 + (1 : ℚ[X])*X^2 := by
  have h := deadPoly_eq [7,3] (-1)
  have hc : headChoices [7,3] (-1) = {0,1} := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ, dead_022, dead_037] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem dead_089 : deadPoly [7,3] 3 =
    (1 : ℚ[X]) + (1 : ℚ[X])*X^1 := by
  have h := deadPoly_eq [7,3] 3
  have hc : headChoices [7,3] 3 = {0} := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ, dead_022] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem dead_090 : deadPoly [7,4] (-2) =
    (1 : ℚ[X]) + (2 : ℚ[X])*X^1 + (1 : ℚ[X])*X^2 := by
  have h := deadPoly_eq [7,4] (-2)
  have hc : headChoices [7,4] (-2) = {0,1} := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ, dead_026, dead_038] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem dead_091 : deadPoly [7,4] (-1) =
    (1 : ℚ[X]) + (2 : ℚ[X])*X^1 + (1 : ℚ[X])*X^2 := by
  have h := deadPoly_eq [7,4] (-1)
  have hc : headChoices [7,4] (-1) = {0,1} := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ, dead_026, dead_038] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem dead_092 : deadPoly [7,4] 4 =
    (1 : ℚ[X]) + (1 : ℚ[X])*X^1 := by
  have h := deadPoly_eq [7,4] 4
  have hc : headChoices [7,4] 4 = {0} := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ, dead_026] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem dead_093 : deadPoly [7,6] (-2) =
    (1 : ℚ[X]) + (2 : ℚ[X])*X^1 + (2 : ℚ[X])*X^2 := by
  have h := deadPoly_eq [7,6] (-2)
  have hc : headChoices [7,6] (-2) = {0,1} := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ, dead_030, dead_039] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem dead_094 : deadPoly [7,6] (-1) =
    (1 : ℚ[X]) + (2 : ℚ[X])*X^1 + (2 : ℚ[X])*X^2 := by
  have h := deadPoly_eq [7,6] (-1)
  have hc : headChoices [7,6] (-1) = {0,1} := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ, dead_030, dead_039] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem dead_095 : deadPoly [7,6] 0 =
    (1 : ℚ[X]) + (2 : ℚ[X])*X^1 + (2 : ℚ[X])*X^2 := by
  have h := deadPoly_eq [7,6] 0
  have hc : headChoices [7,6] 0 = {0,1} := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ, dead_030, dead_039] at h
  calc
    _ = _ := h
    _ = _ := by ring

end DenominatorForest.PrefixCertificate
