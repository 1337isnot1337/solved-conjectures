import Conjectures.DenominatorPrefixData11
import Mathlib.Tactic.NormNum
import Mathlib.Tactic.Ring

/-! Generated finite recursion rows. Every coefficient identity
is proved from the recursive equation and earlier shorter-head rows. -/
namespace DenominatorForest.PrefixCertificate
open Polynomial
theorem second_175 : prefixSecond [1,0,1,1,1] 2 =
    (0 : ℚ[X]) := by
  have h := prefixSecond_eq [1,0,1,1,1] 2
  have hc : headChoices [1,0,1,1,1] 2 = ∅ := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ, freePoly] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem second_176 : prefixSecond [2,0,1,1,1] (-1) =
    (1 : ℚ[X])*X^3 + (5 : ℚ[X])*X^4 + (10 : ℚ[X])*X^5 + (6 : ℚ[X])*X^6 := by
  have h := prefixSecond_eq [2,0,1,1,1] (-1)
  have hc : headChoices [2,0,1,1,1] (-1) = {0,1} := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ, freePoly, second_147, second_152] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem second_177 : prefixSecond [2,0,1,1,1] 2 =
    (0 : ℚ[X]) := by
  have h := prefixSecond_eq [2,0,1,1,1] 2
  have hc : headChoices [2,0,1,1,1] 2 = {0} := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ, freePoly, second_147] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem second_178 : prefixSecond [3,1,0,1,1] (-2) =
    (1 : ℚ[X])*X^3 + (5 : ℚ[X])*X^4 + (10 : ℚ[X])*X^5 + (6 : ℚ[X])*X^6 := by
  have h := prefixSecond_eq [3,1,0,1,1] (-2)
  have hc : headChoices [3,1,0,1,1] (-2) = {0,1,2} := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ, freePoly, second_150, second_154, second_156] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem second_179 : prefixSecond [3,1,0,1,1] 2 =
    (0 : ℚ[X]) := by
  have h := prefixSecond_eq [3,1,0,1,1] 2
  have hc : headChoices [3,1,0,1,1] 2 = {0} := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ, freePoly, second_150] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem second_180 : prefixSecond [4,0,1,1,1] (-1) =
    (1 : ℚ[X])*X^3 + (5 : ℚ[X])*X^4 + (10 : ℚ[X])*X^5 + (6 : ℚ[X])*X^6 := by
  have h := prefixSecond_eq [4,0,1,1,1] (-1)
  have hc : headChoices [4,0,1,1,1] (-1) = {0,1} := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ, freePoly, second_148, second_160] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem second_181 : prefixSecond [4,0,1,1,1] 0 =
    (0 : ℚ[X]) := by
  have h := prefixSecond_eq [4,0,1,1,1] 0
  have hc : headChoices [4,0,1,1,1] 0 = {0} := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ, freePoly, second_148] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem second_182 : prefixSecond [4,1,0,1,1] (-2) =
    (1 : ℚ[X])*X^3 + (5 : ℚ[X])*X^4 + (10 : ℚ[X])*X^5 + (6 : ℚ[X])*X^6 := by
  have h := prefixSecond_eq [4,1,0,1,1] (-2)
  have hc : headChoices [4,1,0,1,1] (-2) = {0,1,2} := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ, freePoly, second_151, second_158, second_162] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem second_183 : prefixSecond [4,1,0,1,1] 1 =
    (0 : ℚ[X]) := by
  have h := prefixSecond_eq [4,1,0,1,1] 1
  have hc : headChoices [4,1,0,1,1] 1 = {0} := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ, freePoly, second_151] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem second_184 : prefixSecond [4,3,1,1,1] (-3) =
    (1 : ℚ[X])*X^2 + (6 : ℚ[X])*X^3 + (16 : ℚ[X])*X^4 + (20 : ℚ[X])*X^5 + (12 : ℚ[X])*X^6 := by
  have h := prefixSecond_eq [4,3,1,1,1] (-3)
  have hc : headChoices [4,3,1,1,1] (-3) = {0,1,2,3,4} := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ, freePoly, second_153, second_161, second_164, second_165, second_166] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem second_185 : prefixSecond [4,4,0,1,1] (-2) =
    (1 : ℚ[X])*X^3 + (4 : ℚ[X])*X^4 + (6 : ℚ[X])*X^5 + (4 : ℚ[X])*X^6 := by
  have h := prefixSecond_eq [4,4,0,1,1] (-2)
  have hc : headChoices [4,4,0,1,1] (-2) = {0,1,2} := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ, freePoly, second_155, second_159, second_167] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem second_186 : prefixSecond [4,4,2,1,1] (-4) =
    (1 : ℚ[X])*X^2 + (5 : ℚ[X])*X^3 + (12 : ℚ[X])*X^4 + (14 : ℚ[X])*X^5 + (8 : ℚ[X])*X^6 := by
  have h := prefixSecond_eq [4,4,2,1,1] (-4)
  have hc : headChoices [4,4,2,1,1] (-4) = {0,1,2,3,4} := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ, freePoly, second_157, second_163, second_168, second_169, second_170] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem second_187 : prefixSecond [0,0,1,0,1,1] 0 =
    (1 : ℚ[X])*X^5 + (4 : ℚ[X])*X^6 + (6 : ℚ[X])*X^7 := by
  have h := prefixSecond_eq [0,0,1,0,1,1] 0
  have hc : headChoices [0,0,1,0,1,1] 0 = {0} := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ, freePoly, second_171] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem second_188 : prefixSecond [0,0,1,0,1,1] 1 =
    (0 : ℚ[X]) := by
  have h := prefixSecond_eq [0,0,1,0,1,1] 1
  have hc : headChoices [0,0,1,0,1,1] 1 = ∅ := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ, freePoly] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem second_189 : prefixSecond [1,1,0,1,1,1] (-1) =
    (1 : ℚ[X])*X^4 + (6 : ℚ[X])*X^5 + (14 : ℚ[X])*X^6 + (12 : ℚ[X])*X^7 := by
  have h := prefixSecond_eq [1,1,0,1,1,1] (-1)
  have hc : headChoices [1,1,0,1,1,1] (-1) = {0,1} := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ, freePoly, second_174, second_176] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem second_190 : prefixSecond [1,1,0,1,1,1] 1 =
    (1 : ℚ[X])*X^5 + (4 : ℚ[X])*X^6 + (6 : ℚ[X])*X^7 := by
  have h := prefixSecond_eq [1,1,0,1,1,1] 1
  have hc : headChoices [1,1,0,1,1,1] 1 = {0} := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ, freePoly, second_174] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem second_191 : prefixSecond [2,0,1,0,1,1] (-2) =
    (1 : ℚ[X])*X^4 + (5 : ℚ[X])*X^5 + (10 : ℚ[X])*X^6 + (6 : ℚ[X])*X^7 := by
  have h := prefixSecond_eq [2,0,1,0,1,1] (-2)
  have hc : headChoices [2,0,1,0,1,1] (-2) = {0,1} := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ, freePoly, second_172, second_178] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem second_192 : prefixSecond [2,0,1,0,1,1] 1 =
    (0 : ℚ[X]) := by
  have h := prefixSecond_eq [2,0,1,0,1,1] 1
  have hc : headChoices [2,0,1,0,1,1] 1 = {0} := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ, freePoly, second_172] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem second_193 : prefixSecond [3,0,1,0,1,1] (-2) =
    (1 : ℚ[X])*X^4 + (5 : ℚ[X])*X^5 + (10 : ℚ[X])*X^6 + (6 : ℚ[X])*X^7 := by
  have h := prefixSecond_eq [3,0,1,0,1,1] (-2)
  have hc : headChoices [3,0,1,0,1,1] (-2) = {0,1} := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ, freePoly, second_173, second_182] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem second_194 : prefixSecond [3,0,1,0,1,1] 0 =
    (0 : ℚ[X]) := by
  have h := prefixSecond_eq [3,0,1,0,1,1] 0
  have hc : headChoices [3,0,1,0,1,1] 0 = {0} := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ, freePoly, second_173] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem second_195 : prefixSecond [3,1,0,1,1,1] (-1) =
    (1 : ℚ[X])*X^4 + (5 : ℚ[X])*X^5 + (10 : ℚ[X])*X^6 + (6 : ℚ[X])*X^7 := by
  have h := prefixSecond_eq [3,1,0,1,1,1] (-1)
  have hc : headChoices [3,1,0,1,1,1] (-1) = {0,1} := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ, freePoly, second_175, second_180] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem second_196 : prefixSecond [3,2,0,1,1,1] (-2) =
    (1 : ℚ[X])*X^3 + (6 : ℚ[X])*X^4 + (16 : ℚ[X])*X^5 + (20 : ℚ[X])*X^6 + (12 : ℚ[X])*X^7 := by
  have h := prefixSecond_eq [3,2,0,1,1,1] (-2)
  have hc : headChoices [3,2,0,1,1,1] (-2) = {0,1,2} := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ, freePoly, second_177, second_181, second_184] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem second_197 : prefixSecond [3,3,1,0,1,1] (-3) =
    (1 : ℚ[X])*X^3 + (6 : ℚ[X])*X^4 + (16 : ℚ[X])*X^5 + (20 : ℚ[X])*X^6 + (12 : ℚ[X])*X^7 := by
  have h := prefixSecond_eq [3,3,1,0,1,1] (-3)
  have hc : headChoices [3,3,1,0,1,1] (-3) = {0,1,2,3} := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ, freePoly, second_179, second_183, second_185, second_186] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem second_198 : prefixSecond [0,1,1,0,1,1,1] 0 =
    (1 : ℚ[X])*X^5 + (6 : ℚ[X])*X^6 + (14 : ℚ[X])*X^7 + (12 : ℚ[X])*X^8 := by
  have h := prefixSecond_eq [0,1,1,0,1,1,1] 0
  have hc : headChoices [0,1,1,0,1,1,1] 0 = {0} := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ, freePoly, second_189] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem second_199 : prefixSecond [1,0,0,1,0,1,1] (-1) =
    (1 : ℚ[X])*X^5 + (6 : ℚ[X])*X^6 + (14 : ℚ[X])*X^7 + (12 : ℚ[X])*X^8 := by
  have h := prefixSecond_eq [1,0,0,1,0,1,1] (-1)
  have hc : headChoices [1,0,0,1,0,1,1] (-1) = {0,1} := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ, freePoly, second_187, second_191] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem second_200 : prefixSecond [1,0,0,1,0,1,1] 0 =
    (1 : ℚ[X])*X^6 + (4 : ℚ[X])*X^7 + (6 : ℚ[X])*X^8 := by
  have h := prefixSecond_eq [1,0,0,1,0,1,1] 0
  have hc : headChoices [1,0,0,1,0,1,1] 0 = {0} := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ, freePoly, second_187] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem second_201 : prefixSecond [2,0,0,1,0,1,1] (-1) =
    (1 : ℚ[X])*X^5 + (5 : ℚ[X])*X^6 + (10 : ℚ[X])*X^7 + (6 : ℚ[X])*X^8 := by
  have h := prefixSecond_eq [2,0,0,1,0,1,1] (-1)
  have hc : headChoices [2,0,0,1,0,1,1] (-1) = {0,1} := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ, freePoly, second_188, second_193] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem second_202 : prefixSecond [2,1,1,0,1,1,1] (-2) =
    (1 : ℚ[X])*X^4 + (7 : ℚ[X])*X^5 + (22 : ℚ[X])*X^6 + (34 : ℚ[X])*X^7 + (24 : ℚ[X])*X^8 := by
  have h := prefixSecond_eq [2,1,1,0,1,1,1] (-2)
  have hc : headChoices [2,1,1,0,1,1,1] (-2) = {0,1,2} := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ, freePoly, second_190, second_195, second_196] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem second_203 : prefixSecond [2,2,0,1,0,1,1] (-3) =
    (1 : ℚ[X])*X^4 + (6 : ℚ[X])*X^5 + (16 : ℚ[X])*X^6 + (20 : ℚ[X])*X^7 + (12 : ℚ[X])*X^8 := by
  have h := prefixSecond_eq [2,2,0,1,0,1,1] (-3)
  have hc : headChoices [2,2,0,1,0,1,1] (-3) = {0,1,2} := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ, freePoly, second_192, second_194, second_197] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem second_204 : prefixSecond [0,1,0,0,1,0,1,1] (-1) =
    (1 : ℚ[X])*X^6 + (6 : ℚ[X])*X^7 + (14 : ℚ[X])*X^8 + (12 : ℚ[X])*X^9 := by
  have h := prefixSecond_eq [0,1,0,0,1,0,1,1] (-1)
  have hc : headChoices [0,1,0,0,1,0,1,1] (-1) = {0} := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ, freePoly, second_199] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem second_205 : prefixSecond [1,0,1,1,0,1,1,1] (-1) =
    (1 : ℚ[X])*X^5 + (8 : ℚ[X])*X^6 + (28 : ℚ[X])*X^7 + (48 : ℚ[X])*X^8 + (36 : ℚ[X])*X^9 := by
  have h := prefixSecond_eq [1,0,1,1,0,1,1,1] (-1)
  have hc : headChoices [1,0,1,1,0,1,1,1] (-1) = {0,1} := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ, freePoly, second_198, second_202] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem second_206 : prefixSecond [1,1,0,0,1,0,1,1] (-2) =
    (1 : ℚ[X])*X^5 + (7 : ℚ[X])*X^6 + (22 : ℚ[X])*X^7 + (34 : ℚ[X])*X^8 + (24 : ℚ[X])*X^9 := by
  have h := prefixSecond_eq [1,1,0,0,1,0,1,1] (-2)
  have hc : headChoices [1,1,0,0,1,0,1,1] (-2) = {0,1,2} := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ, freePoly, second_200, second_201, second_203] at h
  calc
    _ = _ := h
    _ = _ := by ring

end DenominatorForest.PrefixCertificate
