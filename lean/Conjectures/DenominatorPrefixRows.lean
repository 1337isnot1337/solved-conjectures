import Conjectures.DenominatorPrefixData13

namespace DenominatorForest.PrefixCertificate
open Polynomial

theorem primary_sumFirst : sumFirst primaryWord =
    (10 : ℚ[X]) + (13 : ℚ[X])*X^1 + (20 : ℚ[X])*X^2 + (30 : ℚ[X])*X^3 + (41 : ℚ[X])*X^4 + (54 : ℚ[X])*X^5 + (76 : ℚ[X])*X^6 + (90 : ℚ[X])*X^7 + (78 : ℚ[X])*X^8 + (36 : ℚ[X])*X^9 := by
  norm_num [sumFirst, phaseHead, phaseOffset, primaryWord, Finset.sum_range_succ, dead_000, dead_007, dead_041, dead_099, dead_149, dead_171, dead_187, dead_199, dead_204, dead_207]
  ring

theorem primary_sumSecond : sumSecond primaryWord =
    (1 : ℚ[X])*X^1 + (2 : ℚ[X])*X^2 + (4 : ℚ[X])*X^3 + (7 : ℚ[X])*X^4 + (12 : ℚ[X])*X^5 + (18 : ℚ[X])*X^6 + (34 : ℚ[X])*X^7 + (54 : ℚ[X])*X^8 + (60 : ℚ[X])*X^9 + (36 : ℚ[X])*X^10 := by
  norm_num [sumSecond, phaseHead, phaseOffset, primaryWord, Finset.sum_range_succ, second_000, second_007, second_041, second_099, second_149, second_171, second_187, second_199, second_204, second_207]
  ring

theorem primary_first_root :
    deadPoly (phaseHead primaryWord 1) (phaseOffset primaryWord 1) =
      (1 : ℚ[X]) + (2 : ℚ[X])*X^1 + (4 : ℚ[X])*X^2 + (8 : ℚ[X])*X^3 + (12 : ℚ[X])*X^4 + (18 : ℚ[X])*X^5 + (35 : ℚ[X])*X^6 + (58 : ℚ[X])*X^7 + (66 : ℚ[X])*X^8 + (36 : ℚ[X])*X^9 := by
  simpa [phaseHead, phaseOffset, primaryWord] using dead_207

theorem primary_second_root :
    prefixSecond (phaseHead primaryWord 1) (phaseOffset primaryWord 1) =
      (1 : ℚ[X])*X^6 + (8 : ℚ[X])*X^7 + (28 : ℚ[X])*X^8 + (48 : ℚ[X])*X^9 + (36 : ℚ[X])*X^10 := by
  simpa [phaseHead, phaseOffset, primaryWord] using second_207

theorem dual_sumFirst : sumFirst dualWord =
    (10 : ℚ[X]) + (14 : ℚ[X])*X^1 + (23 : ℚ[X])*X^2 + (35 : ℚ[X])*X^3 + (50 : ℚ[X])*X^4 + (73 : ℚ[X])*X^5 + (102 : ℚ[X])*X^6 + (120 : ℚ[X])*X^7 + (96 : ℚ[X])*X^8 + (36 : ℚ[X])*X^9 := by
  norm_num [sumFirst, phaseHead, phaseOffset, dualWord, Finset.sum_range_succ, dead_000, dead_007, dead_042, dead_102, dead_146, dead_174, dead_189, dead_198, dead_205, dead_208]
  ring

theorem dual_sumSecond : sumSecond dualWord =
    (1 : ℚ[X])*X^1 + (3 : ℚ[X])*X^2 + (7 : ℚ[X])*X^3 + (12 : ℚ[X])*X^4 + (18 : ℚ[X])*X^5 + (35 : ℚ[X])*X^6 + (62 : ℚ[X])*X^7 + (88 : ℚ[X])*X^8 + (84 : ℚ[X])*X^9 + (36 : ℚ[X])*X^10 := by
  norm_num [sumSecond, phaseHead, phaseOffset, dualWord, Finset.sum_range_succ, second_000, second_007, second_042, second_102, second_146, second_174, second_189, second_198, second_205, second_208]
  ring

theorem dual_first_root :
    deadPoly (phaseHead dualWord 1) (phaseOffset dualWord 1) =
      (1 : ℚ[X]) + (1 : ℚ[X])*X^1 + (2 : ℚ[X])*X^2 + (4 : ℚ[X])*X^3 + (8 : ℚ[X])*X^4 + (13 : ℚ[X])*X^5 + (24 : ℚ[X])*X^6 + (48 : ℚ[X])*X^7 + (60 : ℚ[X])*X^8 + (36 : ℚ[X])*X^9 := by
  simpa [phaseHead, phaseOffset, dualWord] using dead_208

theorem dual_second_root :
    prefixSecond (phaseHead dualWord 1) (phaseOffset dualWord 1) =
      (1 : ℚ[X])*X^6 + (8 : ℚ[X])*X^7 + (28 : ℚ[X])*X^8 + (48 : ℚ[X])*X^9 + (36 : ℚ[X])*X^10 := by
  simpa [phaseHead, phaseOffset, dualWord] using second_208

end DenominatorForest.PrefixCertificate
