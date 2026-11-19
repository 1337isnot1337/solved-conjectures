import Conjectures.DenominatorPrefixData10
import Mathlib.Tactic.NormNum
import Mathlib.Tactic.Ring

/-! Generated finite recursion rows. Every coefficient identity
is proved from the recursive equation and earlier shorter-head rows. -/
namespace DenominatorForest.PrefixCertificate
open Polynomial
theorem second_143 : prefixSecond [6,6,2] 0 =
    (0 : ℚ[X]) := by
  have h := prefixSecond_eq [6,6,2] 0
  have hc : headChoices [6,6,2] 0 = {0,1,2} := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ, freePoly, second_073, second_086, second_097] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem second_144 : prefixSecond [6,6,4] (-3) =
    (1 : ℚ[X])*X^1 + (3 : ℚ[X])*X^2 + (4 : ℚ[X])*X^3 + (2 : ℚ[X])*X^4 := by
  have h := prefixSecond_eq [6,6,4] (-3)
  have hc : headChoices [6,6,4] (-3) = {0,1,2} := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ, freePoly, dead_144, second_076, second_092, second_098] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem second_145 : prefixSecond [6,6,4] (-2) =
    (0 : ℚ[X]) := by
  have h := prefixSecond_eq [6,6,4] (-2)
  have hc : headChoices [6,6,4] (-2) = {0,1,2} := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ, freePoly, second_076, second_092, second_098] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem second_146 : prefixSecond [0,1,1,1] 0 =
    (1 : ℚ[X])*X^3 + (4 : ℚ[X])*X^4 + (6 : ℚ[X])*X^5 := by
  have h := prefixSecond_eq [0,1,1,1] 0
  have hc : headChoices [0,1,1,1] 0 = {0} := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ, freePoly, second_102] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem second_147 : prefixSecond [0,1,1,1] 1 =
    (0 : ℚ[X]) := by
  have h := prefixSecond_eq [0,1,1,1] 1
  have hc : headChoices [0,1,1,1] 1 = ∅ := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ, freePoly] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem second_148 : prefixSecond [0,1,1,1] 3 =
    (0 : ℚ[X]) := by
  have h := prefixSecond_eq [0,1,1,1] 3
  have hc : headChoices [0,1,1,1] 3 = ∅ := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ, freePoly] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem second_149 : prefixSecond [1,0,1,1] (-1) =
    (1 : ℚ[X])*X^3 + (4 : ℚ[X])*X^4 + (6 : ℚ[X])*X^5 := by
  have h := prefixSecond_eq [1,0,1,1] (-1)
  have hc : headChoices [1,0,1,1] (-1) = {0,1} := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ, freePoly, second_099, second_105] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem second_150 : prefixSecond [1,0,1,1] 2 =
    (0 : ℚ[X]) := by
  have h := prefixSecond_eq [1,0,1,1] 2
  have hc : headChoices [1,0,1,1] 2 = ∅ := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ, freePoly] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem second_151 : prefixSecond [1,0,1,1] 3 =
    (0 : ℚ[X]) := by
  have h := prefixSecond_eq [1,0,1,1] 3
  have hc : headChoices [1,0,1,1] 3 = ∅ := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ, freePoly] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem second_152 : prefixSecond [3,1,1,1] (-2) =
    (1 : ℚ[X])*X^2 + (5 : ℚ[X])*X^3 + (10 : ℚ[X])*X^4 + (6 : ℚ[X])*X^5 := by
  have h := prefixSecond_eq [3,1,1,1] (-2)
  have hc : headChoices [3,1,1,1] (-2) = {0,1,2,3} := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ, freePoly, second_103, second_108, second_110, second_112] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem second_153 : prefixSecond [3,1,1,1] 3 =
    (0 : ℚ[X]) := by
  have h := prefixSecond_eq [3,1,1,1] 3
  have hc : headChoices [3,1,1,1] 3 = {0} := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ, freePoly, second_103] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem second_154 : prefixSecond [4,0,1,1] (-1) =
    (1 : ℚ[X])*X^3 + (3 : ℚ[X])*X^4 + (2 : ℚ[X])*X^5 := by
  have h := prefixSecond_eq [4,0,1,1] (-1)
  have hc : headChoices [4,0,1,1] (-1) = {0,1} := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ, freePoly, second_100, second_114] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem second_155 : prefixSecond [4,0,1,1] 3 =
    (0 : ℚ[X]) := by
  have h := prefixSecond_eq [4,0,1,1] 3
  have hc : headChoices [4,0,1,1] 3 = {0} := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ, freePoly, second_100] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem second_156 : prefixSecond [4,2,1,1] (-3) =
    (1 : ℚ[X])*X^2 + (4 : ℚ[X])*X^3 + (7 : ℚ[X])*X^4 + (4 : ℚ[X])*X^5 := by
  have h := prefixSecond_eq [4,2,1,1] (-3)
  have hc : headChoices [4,2,1,1] (-3) = {0,1,2,3} := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ, freePoly, second_106, second_115, second_117, second_119] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem second_157 : prefixSecond [4,2,1,1] 3 =
    (0 : ℚ[X]) := by
  have h := prefixSecond_eq [4,2,1,1] 3
  have hc : headChoices [4,2,1,1] 3 = {0} := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ, freePoly, second_106] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem second_158 : prefixSecond [5,0,1,1] (-1) =
    (1 : ℚ[X])*X^3 + (3 : ℚ[X])*X^4 + (2 : ℚ[X])*X^5 := by
  have h := prefixSecond_eq [5,0,1,1] (-1)
  have hc : headChoices [5,0,1,1] (-1) = {0,1} := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ, freePoly, second_101, second_121] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem second_159 : prefixSecond [5,0,1,1] 2 =
    (0 : ℚ[X]) := by
  have h := prefixSecond_eq [5,0,1,1] 2
  have hc : headChoices [5,0,1,1] 2 = {0} := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ, freePoly, second_101] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem second_160 : prefixSecond [5,1,1,1] (-2) =
    (1 : ℚ[X])*X^2 + (5 : ℚ[X])*X^3 + (10 : ℚ[X])*X^4 + (6 : ℚ[X])*X^5 := by
  have h := prefixSecond_eq [5,1,1,1] (-2)
  have hc : headChoices [5,1,1,1] (-2) = {0,1,2,3} := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ, freePoly, second_104, second_122, second_126, second_128] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem second_161 : prefixSecond [5,1,1,1] 1 =
    (0 : ℚ[X]) := by
  have h := prefixSecond_eq [5,1,1,1] 1
  have hc : headChoices [5,1,1,1] 1 = {0} := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ, freePoly, second_104] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem second_162 : prefixSecond [5,2,1,1] (-3) =
    (1 : ℚ[X])*X^2 + (4 : ℚ[X])*X^3 + (7 : ℚ[X])*X^4 + (4 : ℚ[X])*X^5 := by
  have h := prefixSecond_eq [5,2,1,1] (-3)
  have hc : headChoices [5,2,1,1] (-3) = {0,1,2,3} := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ, freePoly, second_107, second_123, second_130, second_132] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem second_163 : prefixSecond [5,2,1,1] 2 =
    (0 : ℚ[X]) := by
  have h := prefixSecond_eq [5,2,1,1] 2
  have hc : headChoices [5,2,1,1] 2 = {0} := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ, freePoly, second_107] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem second_164 : prefixSecond [5,4,1,1] (-2) =
    (1 : ℚ[X])*X^2 + (4 : ℚ[X])*X^3 + (6 : ℚ[X])*X^4 + (4 : ℚ[X])*X^5 := by
  have h := prefixSecond_eq [5,4,1,1] (-2)
  have hc : headChoices [5,4,1,1] (-2) = {0,1,2,3} := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ, freePoly, second_109, second_124, second_134, second_136] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem second_165 : prefixSecond [5,4,2,1] (-3) =
    (1 : ℚ[X])*X^2 + (4 : ℚ[X])*X^3 + (6 : ℚ[X])*X^4 + (4 : ℚ[X])*X^5 := by
  have h := prefixSecond_eq [5,4,2,1] (-3)
  have hc : headChoices [5,4,2,1] (-3) = {0,1,2,3} := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ, freePoly, second_111, second_127, second_135, second_138] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem second_166 : prefixSecond [5,4,2,2] (-4) =
    (1 : ℚ[X])*X^1 + (4 : ℚ[X])*X^2 + (8 : ℚ[X])*X^3 + (8 : ℚ[X])*X^4 + (4 : ℚ[X])*X^5 := by
  have h := prefixSecond_eq [5,4,2,2] (-4)
  have hc : headChoices [5,4,2,2] (-4) = {0,1,2,3} := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ, freePoly, dead_166, second_113, second_129, second_137, second_139] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem second_167 : prefixSecond [5,5,1,1] (-3) =
    (1 : ℚ[X])*X^2 + (4 : ℚ[X])*X^3 + (6 : ℚ[X])*X^4 + (4 : ℚ[X])*X^5 := by
  have h := prefixSecond_eq [5,5,1,1] (-3)
  have hc : headChoices [5,5,1,1] (-3) = {0,1,2,3} := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ, freePoly, second_116, second_125, second_140, second_142] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem second_168 : prefixSecond [5,5,1,1] (-1) =
    (1 : ℚ[X])*X^3 + (2 : ℚ[X])*X^4 + (2 : ℚ[X])*X^5 := by
  have h := prefixSecond_eq [5,5,1,1] (-1)
  have hc : headChoices [5,5,1,1] (-1) = {0,1,2} := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ, freePoly, second_116, second_125, second_140] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem second_169 : prefixSecond [5,5,3,1] (-3) =
    (1 : ℚ[X])*X^2 + (3 : ℚ[X])*X^3 + (4 : ℚ[X])*X^4 + (2 : ℚ[X])*X^5 := by
  have h := prefixSecond_eq [5,5,3,1] (-3)
  have hc : headChoices [5,5,3,1] (-3) = {0,1,2,3} := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ, freePoly, second_118, second_131, second_141, second_144] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem second_170 : prefixSecond [5,5,3,2] (-4) =
    (1 : ℚ[X])*X^1 + (4 : ℚ[X])*X^2 + (8 : ℚ[X])*X^3 + (8 : ℚ[X])*X^4 + (4 : ℚ[X])*X^5 := by
  have h := prefixSecond_eq [5,5,3,2] (-4)
  have hc : headChoices [5,5,3,2] (-4) = {0,1,2,3} := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ, freePoly, dead_170, second_120, second_133, second_143, second_145] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem second_171 : prefixSecond [0,1,0,1,1] (-1) =
    (1 : ℚ[X])*X^4 + (4 : ℚ[X])*X^5 + (6 : ℚ[X])*X^6 := by
  have h := prefixSecond_eq [0,1,0,1,1] (-1)
  have hc : headChoices [0,1,0,1,1] (-1) = {0} := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ, freePoly, second_149] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem second_172 : prefixSecond [0,1,0,1,1] 1 =
    (0 : ℚ[X]) := by
  have h := prefixSecond_eq [0,1,0,1,1] 1
  have hc : headChoices [0,1,0,1,1] 1 = ∅ := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ, freePoly] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem second_173 : prefixSecond [0,1,0,1,1] 2 =
    (0 : ℚ[X]) := by
  have h := prefixSecond_eq [0,1,0,1,1] 2
  have hc : headChoices [0,1,0,1,1] 2 = ∅ := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ, freePoly] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem second_174 : prefixSecond [1,0,1,1,1] 0 =
    (1 : ℚ[X])*X^4 + (4 : ℚ[X])*X^5 + (6 : ℚ[X])*X^6 := by
  have h := prefixSecond_eq [1,0,1,1,1] 0
  have hc : headChoices [1,0,1,1,1] 0 = {0} := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ, freePoly, second_146] at h
  calc
    _ = _ := h
    _ = _ := by ring

end DenominatorForest.PrefixCertificate
