import Conjectures.DenominatorPrefixData04
import Mathlib.Tactic.NormNum
import Mathlib.Tactic.Ring

/-! Generated finite recursion rows. Every coefficient identity
is proved from the recursive equation and earlier shorter-head rows. -/
namespace DenominatorForest.PrefixCertificate
open Polynomial
theorem dead_160 : deadPoly [5,1,1,1] (-2) =
    (1 : ℚ[X]) + (4 : ℚ[X])*X^1 + (9 : ℚ[X])*X^2 + (12 : ℚ[X])*X^3 + (6 : ℚ[X])*X^4 := by
  have h := deadPoly_eq [5,1,1,1] (-2)
  have hc : headChoices [5,1,1,1] (-2) = {0,1,2,3} := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ, dead_104, dead_122, dead_126, dead_128] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem dead_161 : deadPoly [5,1,1,1] 1 =
    (1 : ℚ[X]) + (1 : ℚ[X])*X^1 := by
  have h := deadPoly_eq [5,1,1,1] 1
  have hc : headChoices [5,1,1,1] 1 = {0} := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ, dead_104] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem dead_162 : deadPoly [5,2,1,1] (-3) =
    (1 : ℚ[X]) + (4 : ℚ[X])*X^1 + (8 : ℚ[X])*X^2 + (9 : ℚ[X])*X^3 + (4 : ℚ[X])*X^4 := by
  have h := deadPoly_eq [5,2,1,1] (-3)
  have hc : headChoices [5,2,1,1] (-3) = {0,1,2,3} := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ, dead_107, dead_123, dead_130, dead_132] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem dead_163 : deadPoly [5,2,1,1] 2 =
    (1 : ℚ[X]) + (1 : ℚ[X])*X^1 := by
  have h := deadPoly_eq [5,2,1,1] 2
  have hc : headChoices [5,2,1,1] 2 = {0} := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ, dead_107] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem dead_164 : deadPoly [5,4,1,1] (-2) =
    (1 : ℚ[X]) + (4 : ℚ[X])*X^1 + (8 : ℚ[X])*X^2 + (8 : ℚ[X])*X^3 + (4 : ℚ[X])*X^4 := by
  have h := deadPoly_eq [5,4,1,1] (-2)
  have hc : headChoices [5,4,1,1] (-2) = {0,1,2,3} := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ, dead_109, dead_124, dead_134, dead_136] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem dead_165 : deadPoly [5,4,2,1] (-3) =
    (1 : ℚ[X]) + (4 : ℚ[X])*X^1 + (8 : ℚ[X])*X^2 + (8 : ℚ[X])*X^3 + (4 : ℚ[X])*X^4 := by
  have h := deadPoly_eq [5,4,2,1] (-3)
  have hc : headChoices [5,4,2,1] (-3) = {0,1,2,3} := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ, dead_111, dead_127, dead_135, dead_138] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem dead_166 : deadPoly [5,4,2,2] (-4) =
    (1 : ℚ[X]) + (4 : ℚ[X])*X^1 + (8 : ℚ[X])*X^2 + (8 : ℚ[X])*X^3 + (4 : ℚ[X])*X^4 := by
  have h := deadPoly_eq [5,4,2,2] (-4)
  have hc : headChoices [5,4,2,2] (-4) = {0,1,2,3} := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ, dead_113, dead_129, dead_137, dead_139] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem dead_167 : deadPoly [5,5,1,1] (-3) =
    (1 : ℚ[X]) + (4 : ℚ[X])*X^1 + (8 : ℚ[X])*X^2 + (8 : ℚ[X])*X^3 + (4 : ℚ[X])*X^4 := by
  have h := deadPoly_eq [5,5,1,1] (-3)
  have hc : headChoices [5,5,1,1] (-3) = {0,1,2,3} := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ, dead_116, dead_125, dead_140, dead_142] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem dead_168 : deadPoly [5,5,1,1] (-1) =
    (1 : ℚ[X]) + (3 : ℚ[X])*X^1 + (5 : ℚ[X])*X^2 + (4 : ℚ[X])*X^3 + (2 : ℚ[X])*X^4 := by
  have h := deadPoly_eq [5,5,1,1] (-1)
  have hc : headChoices [5,5,1,1] (-1) = {0,1,2} := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ, dead_116, dead_125, dead_140] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem dead_169 : deadPoly [5,5,3,1] (-3) =
    (1 : ℚ[X]) + (4 : ℚ[X])*X^1 + (7 : ℚ[X])*X^2 + (6 : ℚ[X])*X^3 + (2 : ℚ[X])*X^4 := by
  have h := deadPoly_eq [5,5,3,1] (-3)
  have hc : headChoices [5,5,3,1] (-3) = {0,1,2,3} := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ, dead_118, dead_131, dead_141, dead_144] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem dead_170 : deadPoly [5,5,3,2] (-4) =
    (1 : ℚ[X]) + (4 : ℚ[X])*X^1 + (8 : ℚ[X])*X^2 + (8 : ℚ[X])*X^3 + (4 : ℚ[X])*X^4 := by
  have h := deadPoly_eq [5,5,3,2] (-4)
  have hc : headChoices [5,5,3,2] (-4) = {0,1,2,3} := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ, dead_120, dead_133, dead_143, dead_145] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem dead_171 : deadPoly [0,1,0,1,1] (-1) =
    (1 : ℚ[X]) + (1 : ℚ[X])*X^1 + (2 : ℚ[X])*X^2 + (4 : ℚ[X])*X^3 + (7 : ℚ[X])*X^4 + (6 : ℚ[X])*X^5 := by
  have h := deadPoly_eq [0,1,0,1,1] (-1)
  have hc : headChoices [0,1,0,1,1] (-1) = {0} := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ, dead_149] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem dead_172 : deadPoly [0,1,0,1,1] 1 =
    (1 : ℚ[X]) := by
  have h := deadPoly_eq [0,1,0,1,1] 1
  have hc : headChoices [0,1,0,1,1] 1 = ∅ := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem dead_173 : deadPoly [0,1,0,1,1] 2 =
    (1 : ℚ[X]) := by
  have h := deadPoly_eq [0,1,0,1,1] 2
  have hc : headChoices [0,1,0,1,1] 2 = ∅ := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem dead_174 : deadPoly [1,0,1,1,1] 0 =
    (1 : ℚ[X]) + (1 : ℚ[X])*X^1 + (1 : ℚ[X])*X^2 + (3 : ℚ[X])*X^3 + (6 : ℚ[X])*X^4 + (6 : ℚ[X])*X^5 := by
  have h := deadPoly_eq [1,0,1,1,1] 0
  have hc : headChoices [1,0,1,1,1] 0 = {0} := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ, dead_146] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem dead_175 : deadPoly [1,0,1,1,1] 2 =
    (1 : ℚ[X]) := by
  have h := deadPoly_eq [1,0,1,1,1] 2
  have hc : headChoices [1,0,1,1,1] 2 = ∅ := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem dead_176 : deadPoly [2,0,1,1,1] (-1) =
    (1 : ℚ[X]) + (2 : ℚ[X])*X^1 + (4 : ℚ[X])*X^2 + (9 : ℚ[X])*X^3 + (12 : ℚ[X])*X^4 + (6 : ℚ[X])*X^5 := by
  have h := deadPoly_eq [2,0,1,1,1] (-1)
  have hc : headChoices [2,0,1,1,1] (-1) = {0,1} := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ, dead_147, dead_152] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem dead_177 : deadPoly [2,0,1,1,1] 2 =
    (1 : ℚ[X]) + (1 : ℚ[X])*X^1 := by
  have h := deadPoly_eq [2,0,1,1,1] 2
  have hc : headChoices [2,0,1,1,1] 2 = {0} := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ, dead_147] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem dead_178 : deadPoly [3,1,0,1,1] (-2) =
    (1 : ℚ[X]) + (3 : ℚ[X])*X^1 + (6 : ℚ[X])*X^2 + (11 : ℚ[X])*X^3 + (13 : ℚ[X])*X^4 + (6 : ℚ[X])*X^5 := by
  have h := deadPoly_eq [3,1,0,1,1] (-2)
  have hc : headChoices [3,1,0,1,1] (-2) = {0,1,2} := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ, dead_150, dead_154, dead_156] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem dead_179 : deadPoly [3,1,0,1,1] 2 =
    (1 : ℚ[X]) + (1 : ℚ[X])*X^1 := by
  have h := deadPoly_eq [3,1,0,1,1] 2
  have hc : headChoices [3,1,0,1,1] 2 = {0} := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ, dead_150] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem dead_180 : deadPoly [4,0,1,1,1] (-1) =
    (1 : ℚ[X]) + (2 : ℚ[X])*X^1 + (4 : ℚ[X])*X^2 + (9 : ℚ[X])*X^3 + (12 : ℚ[X])*X^4 + (6 : ℚ[X])*X^5 := by
  have h := deadPoly_eq [4,0,1,1,1] (-1)
  have hc : headChoices [4,0,1,1,1] (-1) = {0,1} := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ, dead_148, dead_160] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem dead_181 : deadPoly [4,0,1,1,1] 0 =
    (1 : ℚ[X]) + (1 : ℚ[X])*X^1 := by
  have h := deadPoly_eq [4,0,1,1,1] 0
  have hc : headChoices [4,0,1,1,1] 0 = {0} := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ, dead_148] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem dead_182 : deadPoly [4,1,0,1,1] (-2) =
    (1 : ℚ[X]) + (3 : ℚ[X])*X^1 + (6 : ℚ[X])*X^2 + (11 : ℚ[X])*X^3 + (13 : ℚ[X])*X^4 + (6 : ℚ[X])*X^5 := by
  have h := deadPoly_eq [4,1,0,1,1] (-2)
  have hc : headChoices [4,1,0,1,1] (-2) = {0,1,2} := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ, dead_151, dead_158, dead_162] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem dead_183 : deadPoly [4,1,0,1,1] 1 =
    (1 : ℚ[X]) + (1 : ℚ[X])*X^1 := by
  have h := deadPoly_eq [4,1,0,1,1] 1
  have hc : headChoices [4,1,0,1,1] 1 = {0} := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ, dead_151] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem dead_184 : deadPoly [4,3,1,1,1] (-3) =
    (1 : ℚ[X]) + (5 : ℚ[X])*X^1 + (14 : ℚ[X])*X^2 + (24 : ℚ[X])*X^3 + (24 : ℚ[X])*X^4 + (12 : ℚ[X])*X^5 := by
  have h := deadPoly_eq [4,3,1,1,1] (-3)
  have hc : headChoices [4,3,1,1,1] (-3) = {0,1,2,3,4} := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ, dead_153, dead_161, dead_164, dead_165, dead_166] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem dead_185 : deadPoly [4,4,0,1,1] (-2) =
    (1 : ℚ[X]) + (3 : ℚ[X])*X^1 + (6 : ℚ[X])*X^2 + (8 : ℚ[X])*X^3 + (8 : ℚ[X])*X^4 + (4 : ℚ[X])*X^5 := by
  have h := deadPoly_eq [4,4,0,1,1] (-2)
  have hc : headChoices [4,4,0,1,1] (-2) = {0,1,2} := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ, dead_155, dead_159, dead_167] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem dead_186 : deadPoly [4,4,2,1,1] (-4) =
    (1 : ℚ[X]) + (5 : ℚ[X])*X^1 + (13 : ℚ[X])*X^2 + (20 : ℚ[X])*X^3 + (18 : ℚ[X])*X^4 + (8 : ℚ[X])*X^5 := by
  have h := deadPoly_eq [4,4,2,1,1] (-4)
  have hc : headChoices [4,4,2,1,1] (-4) = {0,1,2,3,4} := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ, dead_157, dead_163, dead_168, dead_169, dead_170] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem dead_187 : deadPoly [0,0,1,0,1,1] 0 =
    (1 : ℚ[X]) + (1 : ℚ[X])*X^1 + (1 : ℚ[X])*X^2 + (2 : ℚ[X])*X^3 + (4 : ℚ[X])*X^4 + (7 : ℚ[X])*X^5 + (6 : ℚ[X])*X^6 := by
  have h := deadPoly_eq [0,0,1,0,1,1] 0
  have hc : headChoices [0,0,1,0,1,1] 0 = {0} := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ, dead_171] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem dead_188 : deadPoly [0,0,1,0,1,1] 1 =
    (1 : ℚ[X]) := by
  have h := deadPoly_eq [0,0,1,0,1,1] 1
  have hc : headChoices [0,0,1,0,1,1] 1 = ∅ := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem dead_189 : deadPoly [1,1,0,1,1,1] (-1) =
    (1 : ℚ[X]) + (2 : ℚ[X])*X^1 + (3 : ℚ[X])*X^2 + (5 : ℚ[X])*X^3 + (12 : ℚ[X])*X^4 + (18 : ℚ[X])*X^5 + (12 : ℚ[X])*X^6 := by
  have h := deadPoly_eq [1,1,0,1,1,1] (-1)
  have hc : headChoices [1,1,0,1,1,1] (-1) = {0,1} := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ, dead_174, dead_176] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem dead_190 : deadPoly [1,1,0,1,1,1] 1 =
    (1 : ℚ[X]) + (1 : ℚ[X])*X^1 + (1 : ℚ[X])*X^2 + (1 : ℚ[X])*X^3 + (3 : ℚ[X])*X^4 + (6 : ℚ[X])*X^5 + (6 : ℚ[X])*X^6 := by
  have h := deadPoly_eq [1,1,0,1,1,1] 1
  have hc : headChoices [1,1,0,1,1,1] 1 = {0} := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ, dead_174] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem dead_191 : deadPoly [2,0,1,0,1,1] (-2) =
    (1 : ℚ[X]) + (2 : ℚ[X])*X^1 + (3 : ℚ[X])*X^2 + (6 : ℚ[X])*X^3 + (11 : ℚ[X])*X^4 + (13 : ℚ[X])*X^5 + (6 : ℚ[X])*X^6 := by
  have h := deadPoly_eq [2,0,1,0,1,1] (-2)
  have hc : headChoices [2,0,1,0,1,1] (-2) = {0,1} := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ, dead_172, dead_178] at h
  calc
    _ = _ := h
    _ = _ := by ring

end DenominatorForest.PrefixCertificate
