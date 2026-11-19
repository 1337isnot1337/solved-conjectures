import Conjectures.DenominatorPrefixData03
import Mathlib.Tactic.NormNum
import Mathlib.Tactic.Ring

/-! Generated finite recursion rows. Every coefficient identity
is proved from the recursive equation and earlier shorter-head rows. -/
namespace DenominatorForest.PrefixCertificate
open Polynomial
theorem dead_128 : deadPoly [6,2,2] (-3) =
    (1 : ℚ[X]) + (3 : ℚ[X])*X^1 + (4 : ℚ[X])*X^2 + (2 : ℚ[X])*X^3 := by
  have h := deadPoly_eq [6,2,2] (-3)
  have hc : headChoices [6,2,2] (-3) = {0,1,2} := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ, dead_052, dead_083, dead_088] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem dead_129 : deadPoly [6,2,2] 2 =
    (1 : ℚ[X]) + (1 : ℚ[X])*X^1 := by
  have h := deadPoly_eq [6,2,2] 2
  have hc : headChoices [6,2,2] 2 = {0} := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ, dead_052] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem dead_130 : deadPoly [6,3,1] (-2) =
    (1 : ℚ[X]) + (3 : ℚ[X])*X^1 + (3 : ℚ[X])*X^2 + (1 : ℚ[X])*X^3 := by
  have h := deadPoly_eq [6,3,1] (-2)
  have hc : headChoices [6,3,1] (-2) = {0,1,2} := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ, dead_055, dead_079, dead_090] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem dead_131 : deadPoly [6,3,1] 3 =
    (1 : ℚ[X]) + (1 : ℚ[X])*X^1 := by
  have h := deadPoly_eq [6,3,1] 3
  have hc : headChoices [6,3,1] 3 = {0} := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ, dead_055] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem dead_132 : deadPoly [6,3,2] (-3) =
    (1 : ℚ[X]) + (3 : ℚ[X])*X^1 + (4 : ℚ[X])*X^2 + (2 : ℚ[X])*X^3 := by
  have h := deadPoly_eq [6,3,2] (-3)
  have hc : headChoices [6,3,2] (-3) = {0,1,2} := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ, dead_058, dead_084, dead_091] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem dead_133 : deadPoly [6,3,2] 3 =
    (1 : ℚ[X]) + (1 : ℚ[X])*X^1 := by
  have h := deadPoly_eq [6,3,2] 3
  have hc : headChoices [6,3,2] 3 = {0} := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ, dead_058] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem dead_134 : deadPoly [6,5,1] (-2) =
    (1 : ℚ[X]) + (3 : ℚ[X])*X^1 + (4 : ℚ[X])*X^2 + (2 : ℚ[X])*X^3 := by
  have h := deadPoly_eq [6,5,1] (-2)
  have hc : headChoices [6,5,1] (-2) = {0,1,2} := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ, dead_061, dead_080, dead_093] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem dead_135 : deadPoly [6,5,1] (-1) =
    (1 : ℚ[X]) + (3 : ℚ[X])*X^1 + (4 : ℚ[X])*X^2 + (2 : ℚ[X])*X^3 := by
  have h := deadPoly_eq [6,5,1] (-1)
  have hc : headChoices [6,5,1] (-1) = {0,1,2} := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ, dead_061, dead_080, dead_093] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem dead_136 : deadPoly [6,5,2] (-3) =
    (1 : ℚ[X]) + (3 : ℚ[X])*X^1 + (4 : ℚ[X])*X^2 + (2 : ℚ[X])*X^3 := by
  have h := deadPoly_eq [6,5,2] (-3)
  have hc : headChoices [6,5,2] (-3) = {0,1,2} := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ, dead_064, dead_085, dead_094] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem dead_137 : deadPoly [6,5,2] (-1) =
    (1 : ℚ[X]) + (3 : ℚ[X])*X^1 + (4 : ℚ[X])*X^2 + (2 : ℚ[X])*X^3 := by
  have h := deadPoly_eq [6,5,2] (-1)
  have hc : headChoices [6,5,2] (-1) = {0,1,2} := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ, dead_064, dead_085, dead_094] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem dead_138 : deadPoly [6,5,3] (-3) =
    (1 : ℚ[X]) + (3 : ℚ[X])*X^1 + (4 : ℚ[X])*X^2 + (2 : ℚ[X])*X^3 := by
  have h := deadPoly_eq [6,5,3] (-3)
  have hc : headChoices [6,5,3] (-3) = {0,1,2} := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ, dead_067, dead_089, dead_095] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem dead_139 : deadPoly [6,5,3] (-2) =
    (1 : ℚ[X]) + (3 : ℚ[X])*X^1 + (4 : ℚ[X])*X^2 + (2 : ℚ[X])*X^3 := by
  have h := deadPoly_eq [6,5,3] (-2)
  have hc : headChoices [6,5,3] (-2) = {0,1,2} := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ, dead_067, dead_089, dead_095] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem dead_140 : deadPoly [6,6,1] (-2) =
    (1 : ℚ[X]) + (3 : ℚ[X])*X^1 + (4 : ℚ[X])*X^2 + (2 : ℚ[X])*X^3 := by
  have h := deadPoly_eq [6,6,1] (-2)
  have hc : headChoices [6,6,1] (-2) = {0,1,2} := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ, dead_070, dead_081, dead_096] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem dead_141 : deadPoly [6,6,1] 0 =
    (1 : ℚ[X]) + (2 : ℚ[X])*X^1 + (2 : ℚ[X])*X^2 := by
  have h := deadPoly_eq [6,6,1] 0
  have hc : headChoices [6,6,1] 0 = {0,1} := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ, dead_070, dead_081] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem dead_142 : deadPoly [6,6,2] (-3) =
    (1 : ℚ[X]) + (3 : ℚ[X])*X^1 + (4 : ℚ[X])*X^2 + (2 : ℚ[X])*X^3 := by
  have h := deadPoly_eq [6,6,2] (-3)
  have hc : headChoices [6,6,2] (-3) = {0,1,2} := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ, dead_073, dead_086, dead_097] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem dead_143 : deadPoly [6,6,2] 0 =
    (1 : ℚ[X]) + (3 : ℚ[X])*X^1 + (4 : ℚ[X])*X^2 + (2 : ℚ[X])*X^3 := by
  have h := deadPoly_eq [6,6,2] 0
  have hc : headChoices [6,6,2] 0 = {0,1,2} := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ, dead_073, dead_086, dead_097] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem dead_144 : deadPoly [6,6,4] (-3) =
    (1 : ℚ[X]) + (3 : ℚ[X])*X^1 + (4 : ℚ[X])*X^2 + (2 : ℚ[X])*X^3 := by
  have h := deadPoly_eq [6,6,4] (-3)
  have hc : headChoices [6,6,4] (-3) = {0,1,2} := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ, dead_076, dead_092, dead_098] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem dead_145 : deadPoly [6,6,4] (-2) =
    (1 : ℚ[X]) + (3 : ℚ[X])*X^1 + (4 : ℚ[X])*X^2 + (2 : ℚ[X])*X^3 := by
  have h := deadPoly_eq [6,6,4] (-2)
  have hc : headChoices [6,6,4] (-2) = {0,1,2} := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ, dead_076, dead_092, dead_098] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem dead_146 : deadPoly [0,1,1,1] 0 =
    (1 : ℚ[X]) + (1 : ℚ[X])*X^1 + (3 : ℚ[X])*X^2 + (6 : ℚ[X])*X^3 + (6 : ℚ[X])*X^4 := by
  have h := deadPoly_eq [0,1,1,1] 0
  have hc : headChoices [0,1,1,1] 0 = {0} := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ, dead_102] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem dead_147 : deadPoly [0,1,1,1] 1 =
    (1 : ℚ[X]) := by
  have h := deadPoly_eq [0,1,1,1] 1
  have hc : headChoices [0,1,1,1] 1 = ∅ := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem dead_148 : deadPoly [0,1,1,1] 3 =
    (1 : ℚ[X]) := by
  have h := deadPoly_eq [0,1,1,1] 3
  have hc : headChoices [0,1,1,1] 3 = ∅ := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem dead_149 : deadPoly [1,0,1,1] (-1) =
    (1 : ℚ[X]) + (2 : ℚ[X])*X^1 + (4 : ℚ[X])*X^2 + (7 : ℚ[X])*X^3 + (6 : ℚ[X])*X^4 := by
  have h := deadPoly_eq [1,0,1,1] (-1)
  have hc : headChoices [1,0,1,1] (-1) = {0,1} := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ, dead_099, dead_105] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem dead_150 : deadPoly [1,0,1,1] 2 =
    (1 : ℚ[X]) := by
  have h := deadPoly_eq [1,0,1,1] 2
  have hc : headChoices [1,0,1,1] 2 = ∅ := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem dead_151 : deadPoly [1,0,1,1] 3 =
    (1 : ℚ[X]) := by
  have h := deadPoly_eq [1,0,1,1] 3
  have hc : headChoices [1,0,1,1] 3 = ∅ := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem dead_152 : deadPoly [3,1,1,1] (-2) =
    (1 : ℚ[X]) + (4 : ℚ[X])*X^1 + (9 : ℚ[X])*X^2 + (12 : ℚ[X])*X^3 + (6 : ℚ[X])*X^4 := by
  have h := deadPoly_eq [3,1,1,1] (-2)
  have hc : headChoices [3,1,1,1] (-2) = {0,1,2,3} := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ, dead_103, dead_108, dead_110, dead_112] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem dead_153 : deadPoly [3,1,1,1] 3 =
    (1 : ℚ[X]) + (1 : ℚ[X])*X^1 := by
  have h := deadPoly_eq [3,1,1,1] 3
  have hc : headChoices [3,1,1,1] 3 = {0} := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ, dead_103] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem dead_154 : deadPoly [4,0,1,1] (-1) =
    (1 : ℚ[X]) + (2 : ℚ[X])*X^1 + (3 : ℚ[X])*X^2 + (4 : ℚ[X])*X^3 + (2 : ℚ[X])*X^4 := by
  have h := deadPoly_eq [4,0,1,1] (-1)
  have hc : headChoices [4,0,1,1] (-1) = {0,1} := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ, dead_100, dead_114] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem dead_155 : deadPoly [4,0,1,1] 3 =
    (1 : ℚ[X]) + (1 : ℚ[X])*X^1 := by
  have h := deadPoly_eq [4,0,1,1] 3
  have hc : headChoices [4,0,1,1] 3 = {0} := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ, dead_100] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem dead_156 : deadPoly [4,2,1,1] (-3) =
    (1 : ℚ[X]) + (4 : ℚ[X])*X^1 + (8 : ℚ[X])*X^2 + (9 : ℚ[X])*X^3 + (4 : ℚ[X])*X^4 := by
  have h := deadPoly_eq [4,2,1,1] (-3)
  have hc : headChoices [4,2,1,1] (-3) = {0,1,2,3} := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ, dead_106, dead_115, dead_117, dead_119] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem dead_157 : deadPoly [4,2,1,1] 3 =
    (1 : ℚ[X]) + (1 : ℚ[X])*X^1 := by
  have h := deadPoly_eq [4,2,1,1] 3
  have hc : headChoices [4,2,1,1] 3 = {0} := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ, dead_106] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem dead_158 : deadPoly [5,0,1,1] (-1) =
    (1 : ℚ[X]) + (2 : ℚ[X])*X^1 + (3 : ℚ[X])*X^2 + (4 : ℚ[X])*X^3 + (2 : ℚ[X])*X^4 := by
  have h := deadPoly_eq [5,0,1,1] (-1)
  have hc : headChoices [5,0,1,1] (-1) = {0,1} := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ, dead_101, dead_121] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem dead_159 : deadPoly [5,0,1,1] 2 =
    (1 : ℚ[X]) + (1 : ℚ[X])*X^1 := by
  have h := deadPoly_eq [5,0,1,1] 2
  have hc : headChoices [5,0,1,1] 2 = {0} := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ, dead_101] at h
  calc
    _ = _ := h
    _ = _ := by ring

end DenominatorForest.PrefixCertificate
