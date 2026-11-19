import Conjectures.DenominatorPrefixData05
import Mathlib.Tactic.NormNum
import Mathlib.Tactic.Ring

/-! Generated finite recursion rows. Every coefficient identity
is proved from the recursive equation and earlier shorter-head rows. -/
namespace DenominatorForest.PrefixCertificate
open Polynomial
theorem dead_192 : deadPoly [2,0,1,0,1,1] 1 =
    (1 : ℚ[X]) + (1 : ℚ[X])*X^1 := by
  have h := deadPoly_eq [2,0,1,0,1,1] 1
  have hc : headChoices [2,0,1,0,1,1] 1 = {0} := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ, dead_172] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem dead_193 : deadPoly [3,0,1,0,1,1] (-2) =
    (1 : ℚ[X]) + (2 : ℚ[X])*X^1 + (3 : ℚ[X])*X^2 + (6 : ℚ[X])*X^3 + (11 : ℚ[X])*X^4 + (13 : ℚ[X])*X^5 + (6 : ℚ[X])*X^6 := by
  have h := deadPoly_eq [3,0,1,0,1,1] (-2)
  have hc : headChoices [3,0,1,0,1,1] (-2) = {0,1} := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ, dead_173, dead_182] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem dead_194 : deadPoly [3,0,1,0,1,1] 0 =
    (1 : ℚ[X]) + (1 : ℚ[X])*X^1 := by
  have h := deadPoly_eq [3,0,1,0,1,1] 0
  have hc : headChoices [3,0,1,0,1,1] 0 = {0} := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ, dead_173] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem dead_195 : deadPoly [3,1,0,1,1,1] (-1) =
    (1 : ℚ[X]) + (2 : ℚ[X])*X^1 + (2 : ℚ[X])*X^2 + (4 : ℚ[X])*X^3 + (9 : ℚ[X])*X^4 + (12 : ℚ[X])*X^5 + (6 : ℚ[X])*X^6 := by
  have h := deadPoly_eq [3,1,0,1,1,1] (-1)
  have hc : headChoices [3,1,0,1,1,1] (-1) = {0,1} := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ, dead_175, dead_180] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem dead_196 : deadPoly [3,2,0,1,1,1] (-2) =
    (1 : ℚ[X]) + (3 : ℚ[X])*X^1 + (7 : ℚ[X])*X^2 + (14 : ℚ[X])*X^3 + (24 : ℚ[X])*X^4 + (24 : ℚ[X])*X^5 + (12 : ℚ[X])*X^6 := by
  have h := deadPoly_eq [3,2,0,1,1,1] (-2)
  have hc : headChoices [3,2,0,1,1,1] (-2) = {0,1,2} := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ, dead_177, dead_181, dead_184] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem dead_197 : deadPoly [3,3,1,0,1,1] (-3) =
    (1 : ℚ[X]) + (4 : ℚ[X])*X^1 + (10 : ℚ[X])*X^2 + (19 : ℚ[X])*X^3 + (28 : ℚ[X])*X^4 + (26 : ℚ[X])*X^5 + (12 : ℚ[X])*X^6 := by
  have h := deadPoly_eq [3,3,1,0,1,1] (-3)
  have hc : headChoices [3,3,1,0,1,1] (-3) = {0,1,2,3} := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ, dead_179, dead_183, dead_185, dead_186] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem dead_198 : deadPoly [0,1,1,0,1,1,1] 0 =
    (1 : ℚ[X]) + (1 : ℚ[X])*X^1 + (2 : ℚ[X])*X^2 + (3 : ℚ[X])*X^3 + (5 : ℚ[X])*X^4 + (12 : ℚ[X])*X^5 + (18 : ℚ[X])*X^6 + (12 : ℚ[X])*X^7 := by
  have h := deadPoly_eq [0,1,1,0,1,1,1] 0
  have hc : headChoices [0,1,1,0,1,1,1] 0 = {0} := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ, dead_189] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem dead_199 : deadPoly [1,0,0,1,0,1,1] (-1) =
    (1 : ℚ[X]) + (2 : ℚ[X])*X^1 + (3 : ℚ[X])*X^2 + (4 : ℚ[X])*X^3 + (8 : ℚ[X])*X^4 + (15 : ℚ[X])*X^5 + (20 : ℚ[X])*X^6 + (12 : ℚ[X])*X^7 := by
  have h := deadPoly_eq [1,0,0,1,0,1,1] (-1)
  have hc : headChoices [1,0,0,1,0,1,1] (-1) = {0,1} := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ, dead_187, dead_191] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem dead_200 : deadPoly [1,0,0,1,0,1,1] 0 =
    (1 : ℚ[X]) + (1 : ℚ[X])*X^1 + (1 : ℚ[X])*X^2 + (1 : ℚ[X])*X^3 + (2 : ℚ[X])*X^4 + (4 : ℚ[X])*X^5 + (7 : ℚ[X])*X^6 + (6 : ℚ[X])*X^7 := by
  have h := deadPoly_eq [1,0,0,1,0,1,1] 0
  have hc : headChoices [1,0,0,1,0,1,1] 0 = {0} := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ, dead_187] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem dead_201 : deadPoly [2,0,0,1,0,1,1] (-1) =
    (1 : ℚ[X]) + (2 : ℚ[X])*X^1 + (2 : ℚ[X])*X^2 + (3 : ℚ[X])*X^3 + (6 : ℚ[X])*X^4 + (11 : ℚ[X])*X^5 + (13 : ℚ[X])*X^6 + (6 : ℚ[X])*X^7 := by
  have h := deadPoly_eq [2,0,0,1,0,1,1] (-1)
  have hc : headChoices [2,0,0,1,0,1,1] (-1) = {0,1} := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ, dead_188, dead_193] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem dead_202 : deadPoly [2,1,1,0,1,1,1] (-2) =
    (1 : ℚ[X]) + (3 : ℚ[X])*X^1 + (6 : ℚ[X])*X^2 + (10 : ℚ[X])*X^3 + (19 : ℚ[X])*X^4 + (36 : ℚ[X])*X^5 + (42 : ℚ[X])*X^6 + (24 : ℚ[X])*X^7 := by
  have h := deadPoly_eq [2,1,1,0,1,1,1] (-2)
  have hc : headChoices [2,1,1,0,1,1,1] (-2) = {0,1,2} := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ, dead_190, dead_195, dead_196] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem dead_203 : deadPoly [2,2,0,1,0,1,1] (-3) =
    (1 : ℚ[X]) + (3 : ℚ[X])*X^1 + (6 : ℚ[X])*X^2 + (10 : ℚ[X])*X^3 + (19 : ℚ[X])*X^4 + (28 : ℚ[X])*X^5 + (26 : ℚ[X])*X^6 + (12 : ℚ[X])*X^7 := by
  have h := deadPoly_eq [2,2,0,1,0,1,1] (-3)
  have hc : headChoices [2,2,0,1,0,1,1] (-3) = {0,1,2} := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ, dead_192, dead_194, dead_197] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem dead_204 : deadPoly [0,1,0,0,1,0,1,1] (-1) =
    (1 : ℚ[X]) + (1 : ℚ[X])*X^1 + (2 : ℚ[X])*X^2 + (3 : ℚ[X])*X^3 + (4 : ℚ[X])*X^4 + (8 : ℚ[X])*X^5 + (15 : ℚ[X])*X^6 + (20 : ℚ[X])*X^7 + (12 : ℚ[X])*X^8 := by
  have h := deadPoly_eq [0,1,0,0,1,0,1,1] (-1)
  have hc : headChoices [0,1,0,0,1,0,1,1] (-1) = {0} := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ, dead_199] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem dead_205 : deadPoly [1,0,1,1,0,1,1,1] (-1) =
    (1 : ℚ[X]) + (2 : ℚ[X])*X^1 + (4 : ℚ[X])*X^2 + (8 : ℚ[X])*X^3 + (13 : ℚ[X])*X^4 + (24 : ℚ[X])*X^5 + (48 : ℚ[X])*X^6 + (60 : ℚ[X])*X^7 + (36 : ℚ[X])*X^8 := by
  have h := deadPoly_eq [1,0,1,1,0,1,1,1] (-1)
  have hc : headChoices [1,0,1,1,0,1,1,1] (-1) = {0,1} := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ, dead_198, dead_202] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem dead_206 : deadPoly [1,1,0,0,1,0,1,1] (-2) =
    (1 : ℚ[X]) + (3 : ℚ[X])*X^1 + (6 : ℚ[X])*X^2 + (9 : ℚ[X])*X^3 + (14 : ℚ[X])*X^4 + (27 : ℚ[X])*X^5 + (43 : ℚ[X])*X^6 + (46 : ℚ[X])*X^7 + (24 : ℚ[X])*X^8 := by
  have h := deadPoly_eq [1,1,0,0,1,0,1,1] (-2)
  have hc : headChoices [1,1,0,0,1,0,1,1] (-2) = {0,1,2} := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ, dead_200, dead_201, dead_203] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem dead_207 : deadPoly [0,0,1,0,0,1,0,1,1] (-1) =
    (1 : ℚ[X]) + (2 : ℚ[X])*X^1 + (4 : ℚ[X])*X^2 + (8 : ℚ[X])*X^3 + (12 : ℚ[X])*X^4 + (18 : ℚ[X])*X^5 + (35 : ℚ[X])*X^6 + (58 : ℚ[X])*X^7 + (66 : ℚ[X])*X^8 + (36 : ℚ[X])*X^9 := by
  have h := deadPoly_eq [0,0,1,0,0,1,0,1,1] (-1)
  have hc : headChoices [0,0,1,0,0,1,0,1,1] (-1) = {0,1} := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ, dead_204, dead_206] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem dead_208 : deadPoly [0,1,0,1,1,0,1,1,1] (-1) =
    (1 : ℚ[X]) + (1 : ℚ[X])*X^1 + (2 : ℚ[X])*X^2 + (4 : ℚ[X])*X^3 + (8 : ℚ[X])*X^4 + (13 : ℚ[X])*X^5 + (24 : ℚ[X])*X^6 + (48 : ℚ[X])*X^7 + (60 : ℚ[X])*X^8 + (36 : ℚ[X])*X^9 := by
  have h := deadPoly_eq [0,1,0,1,1,0,1,1,1] (-1)
  have hc : headChoices [0,1,0,1,1,0,1,1,1] (-1) = {0} := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ, dead_205] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem second_000 : prefixSecond [] 0 =
    (1 : ℚ[X])*X^1 := by
  norm_num

theorem second_001 : prefixSecond [] 1 =
    (0 : ℚ[X]) := by
  norm_num

theorem second_002 : prefixSecond [] 2 =
    (0 : ℚ[X]) := by
  norm_num

theorem second_003 : prefixSecond [] 3 =
    (0 : ℚ[X]) := by
  norm_num

theorem second_004 : prefixSecond [] 5 =
    (0 : ℚ[X]) := by
  norm_num

theorem second_005 : prefixSecond [] 6 =
    (0 : ℚ[X]) := by
  norm_num

theorem second_006 : prefixSecond [] 7 =
    (0 : ℚ[X]) := by
  norm_num

theorem second_007 : prefixSecond [1] 0 =
    (1 : ℚ[X])*X^2 := by
  have h := prefixSecond_eq [1] 0
  have hc : headChoices [1] 0 = {0} := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ, freePoly, second_000] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem second_008 : prefixSecond [1] 1 =
    (1 : ℚ[X])*X^2 := by
  have h := prefixSecond_eq [1] 1
  have hc : headChoices [1] 1 = {0} := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ, freePoly, second_000] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem second_009 : prefixSecond [1] 2 =
    (0 : ℚ[X]) := by
  have h := prefixSecond_eq [1] 2
  have hc : headChoices [1] 2 = ∅ := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ, freePoly] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem second_010 : prefixSecond [1] 4 =
    (0 : ℚ[X]) := by
  have h := prefixSecond_eq [1] 4
  have hc : headChoices [1] 4 = ∅ := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ, freePoly] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem second_011 : prefixSecond [1] 5 =
    (0 : ℚ[X]) := by
  have h := prefixSecond_eq [1] 5
  have hc : headChoices [1] 5 = ∅ := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ, freePoly] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem second_012 : prefixSecond [1] 6 =
    (0 : ℚ[X]) := by
  have h := prefixSecond_eq [1] 6
  have hc : headChoices [1] 6 = ∅ := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ, freePoly] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem second_013 : prefixSecond [2] (-1) =
    (1 : ℚ[X])*X^1 + (1 : ℚ[X])*X^2 := by
  have h := prefixSecond_eq [2] (-1)
  have hc : headChoices [2] (-1) = {0} := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ, freePoly, dead_013, second_001] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem second_014 : prefixSecond [2] 1 =
    (0 : ℚ[X]) := by
  have h := prefixSecond_eq [2] 1
  have hc : headChoices [2] 1 = {0} := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ, freePoly, second_001] at h
  calc
    _ = _ := h
    _ = _ := by ring

end DenominatorForest.PrefixCertificate
