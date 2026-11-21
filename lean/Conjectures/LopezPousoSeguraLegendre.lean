import Conjectures.LopezPousoSegura
import Mathlib.RingTheory.Polynomial.ShiftedLegendre

open Polynomial
namespace LopezPousoSegura

theorem P2_eq_shifted (x : ℝ) :
    P2 x = aeval ((x + 1) / 2) (shiftedLegendre 2) := by
  norm_num [P2, shiftedLegendre, Finset.sum_range_succ, aeval_def]
  norm_num [Nat.choose]
  ring
end LopezPousoSegura

namespace LopezPousoSegura

theorem actual_legendre_roots (x : ℝ) :
    Polynomial.aeval ((x + 1) / 2) (Polynomial.shiftedLegendre 2) = 0 ↔
      x = lowerNode ∨ x = upperNode := by
  rw [← P2_eq_shifted, all_roots]

theorem actual_legendre_derivative (x : ℝ) :
    HasDerivAt (fun y : ℝ => Polynomial.aeval ((y + 1) / 2)
      (Polynomial.shiftedLegendre 2)) (3*x) x := by
  simp_rw [← P2_eq_shifted]
  unfold P2
  convert (((hasDerivAt_id x).pow 2).const_mul 3 |>.sub_const 1).div_const 2 using 1
  all_goals try simp only [id_eq, Nat.reduceSub, pow_one, mul_one]
  all_goals try { funext y; simp only [Pi.pow_apply, id_eq] }
  all_goals ring
end LopezPousoSegura
