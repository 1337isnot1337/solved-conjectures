import Conjectures.DenominatorPrefixData12
import Mathlib.Tactic.NormNum
import Mathlib.Tactic.Ring

/-! Generated finite recursion rows. Every coefficient identity
is proved from the recursive equation and earlier shorter-head rows. -/
namespace DenominatorForest.PrefixCertificate
open Polynomial
theorem second_207 : prefixSecond [0,0,1,0,0,1,0,1,1] (-1) =
    (1 : ℚ[X])*X^6 + (8 : ℚ[X])*X^7 + (28 : ℚ[X])*X^8 + (48 : ℚ[X])*X^9 + (36 : ℚ[X])*X^10 := by
  have h := prefixSecond_eq [0,0,1,0,0,1,0,1,1] (-1)
  have hc : headChoices [0,0,1,0,0,1,0,1,1] (-1) = {0,1} := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ, freePoly, second_204, second_206] at h
  calc
    _ = _ := h
    _ = _ := by ring

theorem second_208 : prefixSecond [0,1,0,1,1,0,1,1,1] (-1) =
    (1 : ℚ[X])*X^6 + (8 : ℚ[X])*X^7 + (28 : ℚ[X])*X^8 + (48 : ℚ[X])*X^9 + (36 : ℚ[X])*X^10 := by
  have h := prefixSecond_eq [0,1,0,1,1,0,1,1,1] (-1)
  have hc : headChoices [0,1,0,1,1,0,1,1,1] (-1) = {0} := by decide
  rw [hc] at h
  norm_num [Finset.sum_insert, headStep, headOffset, List.range_succ, freePoly, second_205] at h
  calc
    _ = _ := h
    _ = _ := by ring

end DenominatorForest.PrefixCertificate
