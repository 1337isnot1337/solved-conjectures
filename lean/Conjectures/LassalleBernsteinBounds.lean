module

public import Conjectures.LassalleBernsteinSecondDifference

@[expose] public section
namespace LassalleRefinement

theorem descending_product_le (x y i j : ℕ) :
    x.descFactorial i*y.descFactorial j ≤ (x+y).descFactorial (i+j) := by
  by_cases hi : i≤x
  · have hx : x.descFactorial i≤(x+y).descFactorial i := Nat.descFactorial_le _ (by omega)
    have hy : y.descFactorial j≤(x+y-i).descFactorial j := Nat.descFactorial_le _ (by omega)
    have he := Nat.descFactorial_mul_descFactorial (k:=i) (m:=i+j) (n:=x+y) (by omega)
    rw [show i+j-i=j by omega,mul_comm] at he
    exact (Nat.mul_le_mul hx hy).trans_eq he
  · rw [Nat.descFactorial_of_lt (by omega : x < i),Nat.zero_mul]
    omega

theorem fallingRatio_nonnegative (x y i j : ℕ) : 0≤fallingRatio x y i j := by
  unfold fallingRatio
  positivity

theorem fallingRatio_le_one (x y i j : ℕ) : fallingRatio x y i j≤1 := by
  by_cases h : i+j≤x+y
  · unfold fallingRatio
    have hp : (0:ℝ)<((x+y).descFactorial (i+j):ℕ) := by
      exact_mod_cast (Nat.descFactorial_pos.mpr h)
    apply (div_le_iff₀ hp).mpr
    rw [one_mul]
    exact_mod_cast descending_product_le x y i j
  · unfold fallingRatio
    rw [Nat.descFactorial_of_lt (Nat.lt_of_not_ge h)]
    simp

theorem abs_fallingRatio_le_one (x y i j : ℕ) : |fallingRatio x y i j|≤1 := by
  rw [abs_of_nonneg (fallingRatio_nonnegative ..)]
  exact fallingRatio_le_one ..

end LassalleRefinement
