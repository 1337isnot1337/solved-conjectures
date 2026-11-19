import Conjectures.DenominatorPrefixData09
import Mathlib.Tactic.NormNum
import Mathlib.Tactic.Ring

/-! Generated finite recursion rows. Every coefficient identity
is proved from the recursive equation and earlier shorter-head rows. -/
namespace DenominatorForest.PrefixCertificate
open Polynomial
theorem second_111 : prefixSecond [4,2,1] 4 =
    (0 : ℚ[X]) := by
  have h := prefixSecond_eq [4,2,1] 4
  have hc : headChoices [4,2,1] 4 = {0} := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ, freePoly, second_048] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem second_112 : prefixSecond [4,2,2] (-3) =
    (1 : ℚ[X])*X^1 + (3 : ℚ[X])*X^2 + (4 : ℚ[X])*X^3 + (2 : ℚ[X])*X^4 := by
  have h := prefixSecond_eq [4,2,2] (-3)
  have hc : headChoices [4,2,2] (-3) = {0,1,2} := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ, freePoly, dead_112, second_051, second_063, second_066] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem second_113 : prefixSecond [4,2,2] 4 =
    (0 : ℚ[X]) := by
  have h := prefixSecond_eq [4,2,2] 4
  have hc : headChoices [4,2,2] 4 = {0} := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ, freePoly, second_051] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem second_114 : prefixSecond [5,1,1] (-2) =
    (1 : ℚ[X])*X^2 + (3 : ℚ[X])*X^3 + (2 : ℚ[X])*X^4 := by
  have h := prefixSecond_eq [5,1,1] (-2)
  have hc : headChoices [5,1,1] (-2) = {0,1,2} := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ, freePoly, second_045, second_068, second_071] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem second_115 : prefixSecond [5,1,1] 0 =
    (1 : ℚ[X])*X^3 + (1 : ℚ[X])*X^4 := by
  have h := prefixSecond_eq [5,1,1] 0
  have hc : headChoices [5,1,1] 0 = {0,1} := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ, freePoly, second_045, second_068] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem second_116 : prefixSecond [5,1,1] 4 =
    (0 : ℚ[X]) := by
  have h := prefixSecond_eq [5,1,1] 4
  have hc : headChoices [5,1,1] 4 = {0} := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ, freePoly, second_045] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem second_117 : prefixSecond [5,3,1] (-2) =
    (1 : ℚ[X])*X^2 + (2 : ℚ[X])*X^3 + (1 : ℚ[X])*X^4 := by
  have h := prefixSecond_eq [5,3,1] (-2)
  have hc : headChoices [5,3,1] (-2) = {0,1,2} := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ, freePoly, second_054, second_069, second_074] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem second_118 : prefixSecond [5,3,1] 4 =
    (0 : ℚ[X]) := by
  have h := prefixSecond_eq [5,3,1] 4
  have hc : headChoices [5,3,1] 4 = {0} := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ, freePoly, second_054] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem second_119 : prefixSecond [5,3,2] (-3) =
    (1 : ℚ[X])*X^1 + (3 : ℚ[X])*X^2 + (4 : ℚ[X])*X^3 + (2 : ℚ[X])*X^4 := by
  have h := prefixSecond_eq [5,3,2] (-3)
  have hc : headChoices [5,3,2] (-3) = {0,1,2} := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ, freePoly, dead_119, second_057, second_072, second_075] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem second_120 : prefixSecond [5,3,2] 4 =
    (0 : ℚ[X]) := by
  have h := prefixSecond_eq [5,3,2] 4
  have hc : headChoices [5,3,2] 4 = {0} := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ, freePoly, second_057] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem second_121 : prefixSecond [6,1,1] (-2) =
    (1 : ℚ[X])*X^2 + (3 : ℚ[X])*X^3 + (2 : ℚ[X])*X^4 := by
  have h := prefixSecond_eq [6,1,1] (-2)
  have hc : headChoices [6,1,1] (-2) = {0,1,2} := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ, freePoly, second_046, second_077, second_082] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem second_122 : prefixSecond [6,1,1] (-1) =
    (1 : ℚ[X])*X^2 + (3 : ℚ[X])*X^3 + (2 : ℚ[X])*X^4 := by
  have h := prefixSecond_eq [6,1,1] (-1)
  have hc : headChoices [6,1,1] (-1) = {0,1,2} := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ, freePoly, second_046, second_077, second_082] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem second_123 : prefixSecond [6,1,1] 0 =
    (1 : ℚ[X])*X^3 + (1 : ℚ[X])*X^4 := by
  have h := prefixSecond_eq [6,1,1] 0
  have hc : headChoices [6,1,1] 0 = {0,1} := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ, freePoly, second_046, second_077] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem second_124 : prefixSecond [6,1,1] 2 =
    (0 : ℚ[X]) := by
  have h := prefixSecond_eq [6,1,1] 2
  have hc : headChoices [6,1,1] 2 = {0} := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ, freePoly, second_046] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem second_125 : prefixSecond [6,1,1] 3 =
    (0 : ℚ[X]) := by
  have h := prefixSecond_eq [6,1,1] 3
  have hc : headChoices [6,1,1] 3 = {0} := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ, freePoly, second_046] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem second_126 : prefixSecond [6,2,1] (-2) =
    (1 : ℚ[X])*X^2 + (3 : ℚ[X])*X^3 + (2 : ℚ[X])*X^4 := by
  have h := prefixSecond_eq [6,2,1] (-2)
  have hc : headChoices [6,2,1] (-2) = {0,1,2} := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ, freePoly, second_049, second_078, second_087] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem second_127 : prefixSecond [6,2,1] 2 =
    (0 : ℚ[X]) := by
  have h := prefixSecond_eq [6,2,1] 2
  have hc : headChoices [6,2,1] 2 = {0} := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ, freePoly, second_049] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem second_128 : prefixSecond [6,2,2] (-3) =
    (1 : ℚ[X])*X^1 + (3 : ℚ[X])*X^2 + (4 : ℚ[X])*X^3 + (2 : ℚ[X])*X^4 := by
  have h := prefixSecond_eq [6,2,2] (-3)
  have hc : headChoices [6,2,2] (-3) = {0,1,2} := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ, freePoly, dead_128, second_052, second_083, second_088] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem second_129 : prefixSecond [6,2,2] 2 =
    (0 : ℚ[X]) := by
  have h := prefixSecond_eq [6,2,2] 2
  have hc : headChoices [6,2,2] 2 = {0} := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ, freePoly, second_052] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem second_130 : prefixSecond [6,3,1] (-2) =
    (1 : ℚ[X])*X^2 + (2 : ℚ[X])*X^3 + (1 : ℚ[X])*X^4 := by
  have h := prefixSecond_eq [6,3,1] (-2)
  have hc : headChoices [6,3,1] (-2) = {0,1,2} := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ, freePoly, second_055, second_079, second_090] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem second_131 : prefixSecond [6,3,1] 3 =
    (0 : ℚ[X]) := by
  have h := prefixSecond_eq [6,3,1] 3
  have hc : headChoices [6,3,1] 3 = {0} := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ, freePoly, second_055] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem second_132 : prefixSecond [6,3,2] (-3) =
    (1 : ℚ[X])*X^1 + (3 : ℚ[X])*X^2 + (4 : ℚ[X])*X^3 + (2 : ℚ[X])*X^4 := by
  have h := prefixSecond_eq [6,3,2] (-3)
  have hc : headChoices [6,3,2] (-3) = {0,1,2} := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ, freePoly, dead_132, second_058, second_084, second_091] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem second_133 : prefixSecond [6,3,2] 3 =
    (0 : ℚ[X]) := by
  have h := prefixSecond_eq [6,3,2] 3
  have hc : headChoices [6,3,2] 3 = {0} := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ, freePoly, second_058] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem second_134 : prefixSecond [6,5,1] (-2) =
    (1 : ℚ[X])*X^2 + (2 : ℚ[X])*X^3 + (2 : ℚ[X])*X^4 := by
  have h := prefixSecond_eq [6,5,1] (-2)
  have hc : headChoices [6,5,1] (-2) = {0,1,2} := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ, freePoly, second_061, second_080, second_093] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem second_135 : prefixSecond [6,5,1] (-1) =
    (1 : ℚ[X])*X^2 + (2 : ℚ[X])*X^3 + (2 : ℚ[X])*X^4 := by
  have h := prefixSecond_eq [6,5,1] (-1)
  have hc : headChoices [6,5,1] (-1) = {0,1,2} := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ, freePoly, second_061, second_080, second_093] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem second_136 : prefixSecond [6,5,2] (-3) =
    (1 : ℚ[X])*X^1 + (3 : ℚ[X])*X^2 + (4 : ℚ[X])*X^3 + (2 : ℚ[X])*X^4 := by
  have h := prefixSecond_eq [6,5,2] (-3)
  have hc : headChoices [6,5,2] (-3) = {0,1,2} := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ, freePoly, dead_136, second_064, second_085, second_094] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem second_137 : prefixSecond [6,5,2] (-1) =
    (0 : ℚ[X]) := by
  have h := prefixSecond_eq [6,5,2] (-1)
  have hc : headChoices [6,5,2] (-1) = {0,1,2} := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ, freePoly, second_064, second_085, second_094] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem second_138 : prefixSecond [6,5,3] (-3) =
    (1 : ℚ[X])*X^1 + (3 : ℚ[X])*X^2 + (4 : ℚ[X])*X^3 + (2 : ℚ[X])*X^4 := by
  have h := prefixSecond_eq [6,5,3] (-3)
  have hc : headChoices [6,5,3] (-3) = {0,1,2} := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ, freePoly, dead_138, second_067, second_089, second_095] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem second_139 : prefixSecond [6,5,3] (-2) =
    (0 : ℚ[X]) := by
  have h := prefixSecond_eq [6,5,3] (-2)
  have hc : headChoices [6,5,3] (-2) = {0,1,2} := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ, freePoly, second_067, second_089, second_095] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem second_140 : prefixSecond [6,6,1] (-2) =
    (1 : ℚ[X])*X^2 + (2 : ℚ[X])*X^3 + (2 : ℚ[X])*X^4 := by
  have h := prefixSecond_eq [6,6,1] (-2)
  have hc : headChoices [6,6,1] (-2) = {0,1,2} := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ, freePoly, second_070, second_081, second_096] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem second_141 : prefixSecond [6,6,1] 0 =
    (0 : ℚ[X]) := by
  have h := prefixSecond_eq [6,6,1] 0
  have hc : headChoices [6,6,1] 0 = {0,1} := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ, freePoly, second_070, second_081] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem second_142 : prefixSecond [6,6,2] (-3) =
    (1 : ℚ[X])*X^1 + (3 : ℚ[X])*X^2 + (4 : ℚ[X])*X^3 + (2 : ℚ[X])*X^4 := by
  have h := prefixSecond_eq [6,6,2] (-3)
  have hc : headChoices [6,6,2] (-3) = {0,1,2} := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ, freePoly, dead_142, second_073, second_086, second_097] at h
  calc
    _ = _ := h
    _ = _ := by ring

end DenominatorForest.PrefixCertificate
