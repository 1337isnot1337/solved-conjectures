import Conjectures.Denominator
import Mathlib.Algebra.Polynomial.Degree.Domain

/-! A reduced polynomial denominator divides every denominator representing
the same formal power series. This proves degree minimality without assuming
any published degree bound. -/
namespace Denominator
open Polynomial

theorem reduced_denominator_dvd (H : PowerSeries ℚ) (Q R A B : ℚ[X])
    (hcoprime : IsCoprime Q R)
    (hQ : (Q : PowerSeries ℚ)*H=(R : PowerSeries ℚ))
    (hB : (B : PowerSeries ℚ)*H=(A : PowerSeries ℚ)) : Q ∣ B := by
  have hcross : Q*A=B*R := by
    apply Polynomial.coe_injective ℚ
    simp only [Polynomial.coe_mul]
    rw [← hB,← hQ]
    ring
  exact hcoprime.dvd_of_dvd_mul_right ⟨A,hcross.symm⟩

theorem reduced_denominator_degree_le (H : PowerSeries ℚ) (Q R A B : ℚ[X])
    (hcoprime : IsCoprime Q R)
    (hQ : (Q : PowerSeries ℚ)*H=(R : PowerSeries ℚ))
    (hB : (B : PowerSeries ℚ)*H=(A : PowerSeries ℚ)) (hB0 : B ≠ 0) :
    Q.natDegree ≤ B.natDegree :=
  Polynomial.natDegree_le_of_dvd (reduced_denominator_dvd H Q R A B hcoprime hQ hB) hB0

theorem primary_minimal_degree (H : PowerSeries ℚ)
    (hH : (primaryQ : PowerSeries ℚ)*H=(primaryR : PowerSeries ℚ))
    (A B : ℚ[X]) (hB : (B : PowerSeries ℚ)*H=(A : PowerSeries ℚ)) (hB0 : B ≠ 0) :
    5 ≤ B.natDegree := by
  have h := reduced_denominator_degree_le H primaryQ primaryR A B primary_coprime hH hB hB0
  have hdegree : primaryQ.natDegree=5 := by
    unfold primaryQ
    compute_degree <;> norm_num
  simpa only [hdegree] using h

theorem dual_minimal_degree (H : PowerSeries ℚ)
    (hH : (dualQ : PowerSeries ℚ)*H=(dualR : PowerSeries ℚ))
    (A B : ℚ[X]) (hB : (B : PowerSeries ℚ)*H=(A : PowerSeries ℚ)) (hB0 : B ≠ 0) :
    10 ≤ B.natDegree := by
  have h := reduced_denominator_degree_le H dualQ dualR A B dual_coprime hH hB hB0
  have hdegree : dualQ.natDegree=10 := by
    unfold dualQ
    compute_degree <;> norm_num
  simpa only [hdegree] using h

end Denominator
