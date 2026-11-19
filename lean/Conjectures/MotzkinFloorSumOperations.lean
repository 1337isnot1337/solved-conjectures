import Conjectures.MotzkinFloorSumCost

/-! Unit-cost arithmetic accounting for the explicit floor-sum program.
Addition, truncated subtraction, multiplication, quotient, remainder and an
integer comparison each cost one operation. Assignments and returning a value
cost zero. The nonzero-modulus terminal branch of `eval` has fourteen such
operations; the recursive branch has seventeen plus its recursive call. -/
namespace Motzkin.FloorSum

def operations (n M A B : ℕ) : ℕ :=
  if hM : M=0 then 1 else
  let height := (A%M)*n+B%M
  if height < M then 14
  else 17+operations (height/M) (A%M) M (height%M)
termination_by M
decreasing_by exact Nat.mod_lt _ (Nat.pos_of_ne_zero hM)

theorem operations_le_iterations (n M A B : ℕ) :
    operations n M A B ≤ 17*iterations n M A B+1 := by
  induction M using Nat.strong_induction_on generalizing n A B with
  | h M ih =>
    by_cases hM : M=0
    · subst M
      simp [operations,iterations]
    rw [operations,iterations,dite_eq_right hM,dite_eq_right hM]
    dsimp only
    by_cases hh : (A%M)*n+B%M < M
    · rw [ite_eq_left hh,ite_eq_left hh]
      decide
    · rw [ite_eq_right hh,ite_eq_right hh]
      have hrec := ih (A%M) (Nat.mod_lt A (Nat.pos_of_ne_zero hM))
        (((A%M)*n+B%M)/M) M (((A%M)*n+B%M)%M)
      omega

theorem operations_le_size (n M A B : ℕ) :
    operations n M A B ≤ 34*M.size+1 := by
  have h₁ := operations_le_iterations n M A B
  have h₂ := (iterations_le_euclidSteps n M A B).trans (euclidSteps_le_size M A)
  omega

theorem operations_le_log2 (n M A B : ℕ) (hM : 0 < M) :
    operations n M A B ≤ 34*(M.log2+1)+1 := by
  rw [← size_eq_log2_add_one hM]
  exact operations_le_size n M A B

end Motzkin.FloorSum
