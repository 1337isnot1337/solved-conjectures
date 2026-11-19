import Conjectures.DenominatorPrefixRows
import Conjectures.Denominator

/-! Exact all-degree numerator and denominator identities from the finite
prefix recursion. The connection to the actual orbit generating function is
proved separately from these polynomial computations. -/
namespace DenominatorForest.PrefixCertificate
open Polynomial

noncomputable def factorF : ℚ[X] := 1+X^3+4*X^4+6*X^5

theorem commonDenominator_factor :
    Denominator.dualQ=Denominator.primaryQ*factorF := by
  unfold Denominator.dualQ Denominator.primaryQ factorF
  ring

theorem primary_denominator :
    (1 : ℚ[X])-prefixSecond (phaseHead primaryWord 1) (phaseOffset primaryWord 1)=
      Denominator.dualQ := by
  rw [primary_second_root]
  unfold Denominator.dualQ
  ring

theorem dual_denominator :
    (1 : ℚ[X])-prefixSecond (phaseHead dualWord 1) (phaseOffset dualWord 1)=
      Denominator.dualQ := by
  rw [dual_second_root]
  unfold Denominator.dualQ
  ring

theorem primary_numerator :
    (1-X)*(sumFirst primaryWord*Denominator.dualQ+
      sumSecond primaryWord*deadPoly (phaseHead primaryWord 1) (phaseOffset primaryWord 1))=
      Denominator.primaryR*factorF := by
  rw [primary_sumFirst,primary_sumSecond,primary_first_root]
  unfold Denominator.dualQ Denominator.primaryR factorF
  ring

theorem dual_numerator :
    (1-X)*(sumFirst dualWord*Denominator.dualQ+
      sumSecond dualWord*deadPoly (phaseHead dualWord 1) (phaseOffset dualWord 1))=
      Denominator.dualR := by
  rw [dual_sumFirst,dual_sumSecond,dual_first_root]
  unfold Denominator.dualQ Denominator.dualR
  ring

theorem primary_denominator_degree : Denominator.primaryQ.natDegree=5 := by
  unfold Denominator.primaryQ
  compute_degree <;> norm_num

theorem dual_denominator_degree : Denominator.dualQ.natDegree=10 := by
  unfold Denominator.dualQ
  compute_degree <;> norm_num

end DenominatorForest.PrefixCertificate
