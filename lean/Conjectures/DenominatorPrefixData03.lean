import Conjectures.DenominatorPrefixData02
import Mathlib.Tactic.NormNum
import Mathlib.Tactic.Ring

/-! Generated finite recursion rows. Every coefficient identity
is proved from the recursive equation and earlier shorter-head rows. -/
namespace DenominatorForest.PrefixCertificate
open Polynomial
theorem dead_096 : deadPoly [7,7] (-2) =
    (1 : ℚ[X]) + (2 : ℚ[X])*X^1 + (2 : ℚ[X])*X^2 := by
  have h := deadPoly_eq [7,7] (-2)
  have hc : headChoices [7,7] (-2) = {0,1} := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ, dead_034, dead_040] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem dead_097 : deadPoly [7,7] (-1) =
    (1 : ℚ[X]) + (2 : ℚ[X])*X^1 + (2 : ℚ[X])*X^2 := by
  have h := deadPoly_eq [7,7] (-1)
  have hc : headChoices [7,7] (-1) = {0,1} := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ, dead_034, dead_040] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem dead_098 : deadPoly [7,7] 1 =
    (1 : ℚ[X]) + (2 : ℚ[X])*X^1 + (2 : ℚ[X])*X^2 := by
  have h := deadPoly_eq [7,7] 1
  have hc : headChoices [7,7] 1 = {0,1} := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ, dead_034, dead_040] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem dead_099 : deadPoly [0,1,1] 0 =
    (1 : ℚ[X]) + (1 : ℚ[X])*X^1 + (2 : ℚ[X])*X^2 + (2 : ℚ[X])*X^3 := by
  have h := deadPoly_eq [0,1,1] 0
  have hc : headChoices [0,1,1] 0 = {0} := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ, dead_041] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem dead_100 : deadPoly [0,1,1] 3 =
    (1 : ℚ[X]) := by
  have h := deadPoly_eq [0,1,1] 3
  have hc : headChoices [0,1,1] 3 = ∅ := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem dead_101 : deadPoly [0,1,1] 4 =
    (1 : ℚ[X]) := by
  have h := deadPoly_eq [0,1,1] 4
  have hc : headChoices [0,1,1] 4 = ∅ := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem dead_102 : deadPoly [1,1,1] (-1) =
    (1 : ℚ[X]) + (3 : ℚ[X])*X^1 + (6 : ℚ[X])*X^2 + (6 : ℚ[X])*X^3 := by
  have h := deadPoly_eq [1,1,1] (-1)
  have hc : headChoices [1,1,1] (-1) = {0,1,2} := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ, dead_042, dead_047, dead_050] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem dead_103 : deadPoly [1,1,1] 2 =
    (1 : ℚ[X]) := by
  have h := deadPoly_eq [1,1,1] 2
  have hc : headChoices [1,1,1] 2 = ∅ := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem dead_104 : deadPoly [1,1,1] 4 =
    (1 : ℚ[X]) := by
  have h := deadPoly_eq [1,1,1] 4
  have hc : headChoices [1,1,1] 4 = ∅ := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem dead_105 : deadPoly [2,1,1] (-2) =
    (1 : ℚ[X]) + (3 : ℚ[X])*X^1 + (5 : ℚ[X])*X^2 + (4 : ℚ[X])*X^3 := by
  have h := deadPoly_eq [2,1,1] (-2)
  have hc : headChoices [2,1,1] (-2) = {0,1,2} := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ, dead_043, dead_053, dead_056] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem dead_106 : deadPoly [2,1,1] 3 =
    (1 : ℚ[X]) := by
  have h := deadPoly_eq [2,1,1] 3
  have hc : headChoices [2,1,1] 3 = ∅ := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem dead_107 : deadPoly [2,1,1] 4 =
    (1 : ℚ[X]) := by
  have h := deadPoly_eq [2,1,1] 4
  have hc : headChoices [2,1,1] 4 = ∅ := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem dead_108 : deadPoly [4,1,1] (-1) =
    (1 : ℚ[X]) + (3 : ℚ[X])*X^1 + (4 : ℚ[X])*X^2 + (2 : ℚ[X])*X^3 := by
  have h := deadPoly_eq [4,1,1] (-1)
  have hc : headChoices [4,1,1] (-1) = {0,1,2} := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ, dead_044, dead_059, dead_062] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem dead_109 : deadPoly [4,1,1] 4 =
    (1 : ℚ[X]) + (1 : ℚ[X])*X^1 := by
  have h := deadPoly_eq [4,1,1] 4
  have hc : headChoices [4,1,1] 4 = {0} := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ, dead_044] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem dead_110 : deadPoly [4,2,1] (-2) =
    (1 : ℚ[X]) + (3 : ℚ[X])*X^1 + (4 : ℚ[X])*X^2 + (2 : ℚ[X])*X^3 := by
  have h := deadPoly_eq [4,2,1] (-2)
  have hc : headChoices [4,2,1] (-2) = {0,1,2} := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ, dead_048, dead_060, dead_065] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem dead_111 : deadPoly [4,2,1] 4 =
    (1 : ℚ[X]) + (1 : ℚ[X])*X^1 := by
  have h := deadPoly_eq [4,2,1] 4
  have hc : headChoices [4,2,1] 4 = {0} := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ, dead_048] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem dead_112 : deadPoly [4,2,2] (-3) =
    (1 : ℚ[X]) + (3 : ℚ[X])*X^1 + (4 : ℚ[X])*X^2 + (2 : ℚ[X])*X^3 := by
  have h := deadPoly_eq [4,2,2] (-3)
  have hc : headChoices [4,2,2] (-3) = {0,1,2} := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ, dead_051, dead_063, dead_066] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem dead_113 : deadPoly [4,2,2] 4 =
    (1 : ℚ[X]) + (1 : ℚ[X])*X^1 := by
  have h := deadPoly_eq [4,2,2] 4
  have hc : headChoices [4,2,2] 4 = {0} := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ, dead_051] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem dead_114 : deadPoly [5,1,1] (-2) =
    (1 : ℚ[X]) + (3 : ℚ[X])*X^1 + (4 : ℚ[X])*X^2 + (2 : ℚ[X])*X^3 := by
  have h := deadPoly_eq [5,1,1] (-2)
  have hc : headChoices [5,1,1] (-2) = {0,1,2} := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ, dead_045, dead_068, dead_071] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem dead_115 : deadPoly [5,1,1] 0 =
    (1 : ℚ[X]) + (2 : ℚ[X])*X^1 + (2 : ℚ[X])*X^2 + (1 : ℚ[X])*X^3 := by
  have h := deadPoly_eq [5,1,1] 0
  have hc : headChoices [5,1,1] 0 = {0,1} := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ, dead_045, dead_068] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem dead_116 : deadPoly [5,1,1] 4 =
    (1 : ℚ[X]) + (1 : ℚ[X])*X^1 := by
  have h := deadPoly_eq [5,1,1] 4
  have hc : headChoices [5,1,1] 4 = {0} := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ, dead_045] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem dead_117 : deadPoly [5,3,1] (-2) =
    (1 : ℚ[X]) + (3 : ℚ[X])*X^1 + (3 : ℚ[X])*X^2 + (1 : ℚ[X])*X^3 := by
  have h := deadPoly_eq [5,3,1] (-2)
  have hc : headChoices [5,3,1] (-2) = {0,1,2} := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ, dead_054, dead_069, dead_074] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem dead_118 : deadPoly [5,3,1] 4 =
    (1 : ℚ[X]) + (1 : ℚ[X])*X^1 := by
  have h := deadPoly_eq [5,3,1] 4
  have hc : headChoices [5,3,1] 4 = {0} := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ, dead_054] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem dead_119 : deadPoly [5,3,2] (-3) =
    (1 : ℚ[X]) + (3 : ℚ[X])*X^1 + (4 : ℚ[X])*X^2 + (2 : ℚ[X])*X^3 := by
  have h := deadPoly_eq [5,3,2] (-3)
  have hc : headChoices [5,3,2] (-3) = {0,1,2} := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ, dead_057, dead_072, dead_075] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem dead_120 : deadPoly [5,3,2] 4 =
    (1 : ℚ[X]) + (1 : ℚ[X])*X^1 := by
  have h := deadPoly_eq [5,3,2] 4
  have hc : headChoices [5,3,2] 4 = {0} := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ, dead_057] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem dead_121 : deadPoly [6,1,1] (-2) =
    (1 : ℚ[X]) + (3 : ℚ[X])*X^1 + (4 : ℚ[X])*X^2 + (2 : ℚ[X])*X^3 := by
  have h := deadPoly_eq [6,1,1] (-2)
  have hc : headChoices [6,1,1] (-2) = {0,1,2} := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ, dead_046, dead_077, dead_082] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem dead_122 : deadPoly [6,1,1] (-1) =
    (1 : ℚ[X]) + (3 : ℚ[X])*X^1 + (4 : ℚ[X])*X^2 + (2 : ℚ[X])*X^3 := by
  have h := deadPoly_eq [6,1,1] (-1)
  have hc : headChoices [6,1,1] (-1) = {0,1,2} := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ, dead_046, dead_077, dead_082] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem dead_123 : deadPoly [6,1,1] 0 =
    (1 : ℚ[X]) + (2 : ℚ[X])*X^1 + (2 : ℚ[X])*X^2 + (1 : ℚ[X])*X^3 := by
  have h := deadPoly_eq [6,1,1] 0
  have hc : headChoices [6,1,1] 0 = {0,1} := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ, dead_046, dead_077] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem dead_124 : deadPoly [6,1,1] 2 =
    (1 : ℚ[X]) + (1 : ℚ[X])*X^1 := by
  have h := deadPoly_eq [6,1,1] 2
  have hc : headChoices [6,1,1] 2 = {0} := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ, dead_046] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem dead_125 : deadPoly [6,1,1] 3 =
    (1 : ℚ[X]) + (1 : ℚ[X])*X^1 := by
  have h := deadPoly_eq [6,1,1] 3
  have hc : headChoices [6,1,1] 3 = {0} := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ, dead_046] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem dead_126 : deadPoly [6,2,1] (-2) =
    (1 : ℚ[X]) + (3 : ℚ[X])*X^1 + (4 : ℚ[X])*X^2 + (2 : ℚ[X])*X^3 := by
  have h := deadPoly_eq [6,2,1] (-2)
  have hc : headChoices [6,2,1] (-2) = {0,1,2} := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ, dead_049, dead_078, dead_087] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem dead_127 : deadPoly [6,2,1] 2 =
    (1 : ℚ[X]) + (1 : ℚ[X])*X^1 := by
  have h := deadPoly_eq [6,2,1] 2
  have hc : headChoices [6,2,1] 2 = {0} := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ, dead_049] at h
  calc
    _ = _ := h
    _ = _ := by ring

end DenominatorForest.PrefixCertificate
