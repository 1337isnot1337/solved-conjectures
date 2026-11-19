import Conjectures.DenominatorPrefixData07
import Mathlib.Tactic.NormNum
import Mathlib.Tactic.Ring

/-! Generated finite recursion rows. Every coefficient identity
is proved from the recursive equation and earlier shorter-head rows. -/
namespace DenominatorForest.PrefixCertificate
open Polynomial
theorem second_047 : prefixSecond [2,1] (-1) =
    (1 : ℚ[X])*X^2 + (2 : ℚ[X])*X^3 := by
  have h := prefixSecond_eq [2,1] (-1)
  have hc : headChoices [2,1] (-1) = {0,1} := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ, freePoly, second_008, second_019] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem second_048 : prefixSecond [2,1] 3 =
    (0 : ℚ[X]) := by
  have h := prefixSecond_eq [2,1] 3
  have hc : headChoices [2,1] 3 = ∅ := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ, freePoly] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem second_049 : prefixSecond [2,1] 5 =
    (0 : ℚ[X]) := by
  have h := prefixSecond_eq [2,1] 5
  have hc : headChoices [2,1] 5 = ∅ := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ, freePoly] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem second_050 : prefixSecond [2,2] (-2) =
    (1 : ℚ[X])*X^1 + (2 : ℚ[X])*X^2 + (2 : ℚ[X])*X^3 := by
  have h := prefixSecond_eq [2,2] (-2)
  have hc : headChoices [2,2] (-2) = {0,1} := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ, freePoly, dead_050, second_014, second_020] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem second_051 : prefixSecond [2,2] 3 =
    (0 : ℚ[X]) := by
  have h := prefixSecond_eq [2,2] 3
  have hc : headChoices [2,2] 3 = ∅ := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ, freePoly] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem second_052 : prefixSecond [2,2] 5 =
    (0 : ℚ[X]) := by
  have h := prefixSecond_eq [2,2] 5
  have hc : headChoices [2,2] 5 = ∅ := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ, freePoly] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem second_053 : prefixSecond [3,1] (-1) =
    (1 : ℚ[X])*X^2 + (1 : ℚ[X])*X^3 := by
  have h := prefixSecond_eq [3,1] (-1)
  have hc : headChoices [3,1] (-1) = {0,1} := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ, freePoly, second_009, second_023] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem second_054 : prefixSecond [3,1] 4 =
    (0 : ℚ[X]) := by
  have h := prefixSecond_eq [3,1] 4
  have hc : headChoices [3,1] 4 = ∅ := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ, freePoly] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem second_055 : prefixSecond [3,1] 5 =
    (0 : ℚ[X]) := by
  have h := prefixSecond_eq [3,1] 5
  have hc : headChoices [3,1] 5 = ∅ := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ, freePoly] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem second_056 : prefixSecond [3,2] (-2) =
    (1 : ℚ[X])*X^1 + (2 : ℚ[X])*X^2 + (2 : ℚ[X])*X^3 := by
  have h := prefixSecond_eq [3,2] (-2)
  have hc : headChoices [3,2] (-2) = {0,1} := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ, freePoly, dead_056, second_015, second_024] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem second_057 : prefixSecond [3,2] 4 =
    (0 : ℚ[X]) := by
  have h := prefixSecond_eq [3,2] 4
  have hc : headChoices [3,2] 4 = ∅ := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ, freePoly] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem second_058 : prefixSecond [3,2] 5 =
    (0 : ℚ[X]) := by
  have h := prefixSecond_eq [3,2] 5
  have hc : headChoices [3,2] 5 = ∅ := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ, freePoly] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem second_059 : prefixSecond [5,1] (-1) =
    (1 : ℚ[X])*X^2 + (1 : ℚ[X])*X^3 := by
  have h := prefixSecond_eq [5,1] (-1)
  have hc : headChoices [5,1] (-1) = {0,1} := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ, freePoly, second_010, second_027] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem second_060 : prefixSecond [5,1] 0 =
    (1 : ℚ[X])*X^2 + (1 : ℚ[X])*X^3 := by
  have h := prefixSecond_eq [5,1] 0
  have hc : headChoices [5,1] 0 = {0,1} := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ, freePoly, second_010, second_027] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem second_061 : prefixSecond [5,1] 5 =
    (0 : ℚ[X]) := by
  have h := prefixSecond_eq [5,1] 5
  have hc : headChoices [5,1] 5 = {0} := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ, freePoly, second_010] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem second_062 : prefixSecond [5,2] (-2) =
    (1 : ℚ[X])*X^1 + (2 : ℚ[X])*X^2 + (1 : ℚ[X])*X^3 := by
  have h := prefixSecond_eq [5,2] (-2)
  have hc : headChoices [5,2] (-2) = {0,1} := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ, freePoly, dead_062, second_016, second_028] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem second_063 : prefixSecond [5,2] 0 =
    (0 : ℚ[X]) := by
  have h := prefixSecond_eq [5,2] 0
  have hc : headChoices [5,2] 0 = {0,1} := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ, freePoly, second_016, second_028] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem second_064 : prefixSecond [5,2] 5 =
    (0 : ℚ[X]) := by
  have h := prefixSecond_eq [5,2] 5
  have hc : headChoices [5,2] 5 = {0} := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ, freePoly, second_016] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem second_065 : prefixSecond [5,3] (-2) =
    (1 : ℚ[X])*X^1 + (2 : ℚ[X])*X^2 + (1 : ℚ[X])*X^3 := by
  have h := prefixSecond_eq [5,3] (-2)
  have hc : headChoices [5,3] (-2) = {0,1} := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ, freePoly, dead_065, second_021, second_029] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem second_066 : prefixSecond [5,3] (-1) =
    (0 : ℚ[X]) := by
  have h := prefixSecond_eq [5,3] (-1)
  have hc : headChoices [5,3] (-1) = {0,1} := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ, freePoly, second_021, second_029] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem second_067 : prefixSecond [5,3] 5 =
    (0 : ℚ[X]) := by
  have h := prefixSecond_eq [5,3] 5
  have hc : headChoices [5,3] 5 = {0} := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ, freePoly, second_021] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem second_068 : prefixSecond [6,1] (-1) =
    (1 : ℚ[X])*X^2 + (1 : ℚ[X])*X^3 := by
  have h := prefixSecond_eq [6,1] (-1)
  have hc : headChoices [6,1] (-1) = {0,1} := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ, freePoly, second_011, second_031] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem second_069 : prefixSecond [6,1] 1 =
    (0 : ℚ[X]) := by
  have h := prefixSecond_eq [6,1] 1
  have hc : headChoices [6,1] 1 = {0} := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ, freePoly, second_011] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem second_070 : prefixSecond [6,1] 5 =
    (0 : ℚ[X]) := by
  have h := prefixSecond_eq [6,1] 5
  have hc : headChoices [6,1] 5 = {0} := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ, freePoly, second_011] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem second_071 : prefixSecond [6,2] (-2) =
    (1 : ℚ[X])*X^1 + (2 : ℚ[X])*X^2 + (1 : ℚ[X])*X^3 := by
  have h := prefixSecond_eq [6,2] (-2)
  have hc : headChoices [6,2] (-2) = {0,1} := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ, freePoly, dead_071, second_017, second_032] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem second_072 : prefixSecond [6,2] 1 =
    (0 : ℚ[X]) := by
  have h := prefixSecond_eq [6,2] 1
  have hc : headChoices [6,2] 1 = {0,1} := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ, freePoly, second_017, second_032] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem second_073 : prefixSecond [6,2] 5 =
    (0 : ℚ[X]) := by
  have h := prefixSecond_eq [6,2] 5
  have hc : headChoices [6,2] 5 = {0} := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ, freePoly, second_017] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem second_074 : prefixSecond [6,4] (-2) =
    (1 : ℚ[X])*X^1 + (2 : ℚ[X])*X^2 + (1 : ℚ[X])*X^3 := by
  have h := prefixSecond_eq [6,4] (-2)
  have hc : headChoices [6,4] (-2) = {0,1} := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ, freePoly, dead_074, second_025, second_033] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem second_075 : prefixSecond [6,4] (-1) =
    (0 : ℚ[X]) := by
  have h := prefixSecond_eq [6,4] (-1)
  have hc : headChoices [6,4] (-1) = {0,1} := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ, freePoly, second_025, second_033] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem second_076 : prefixSecond [6,4] 5 =
    (0 : ℚ[X]) := by
  have h := prefixSecond_eq [6,4] 5
  have hc : headChoices [6,4] 5 = {0} := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ, freePoly, second_025] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem second_077 : prefixSecond [7,1] (-1) =
    (1 : ℚ[X])*X^2 + (1 : ℚ[X])*X^3 := by
  have h := prefixSecond_eq [7,1] (-1)
  have hc : headChoices [7,1] (-1) = {0,1} := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ, freePoly, second_012, second_035] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem second_078 : prefixSecond [7,1] 0 =
    (1 : ℚ[X])*X^2 + (1 : ℚ[X])*X^3 := by
  have h := prefixSecond_eq [7,1] 0
  have hc : headChoices [7,1] 0 = {0,1} := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ, freePoly, second_012, second_035] at h
  calc
    _ = _ := h
    _ = _ := by ring

end DenominatorForest.PrefixCertificate
