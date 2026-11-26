import Conjectures.ChernFuLinThreeStatisticFlagTree

/-! # Length-graded mass and the extension-series telescoping identity

Terminal weights may themselves have positive-degree terms. At coefficient
`d`, only levels `0,...,d` and coefficients at complementary degrees occur.
-/

namespace Conjectures.ChernFuLinThreeStatistic.Mass

open PowerSeries Finset
noncomputable section
variable {K : Type*} [Field K]
local notation "S" => PowerSeries K

def integrate (lev : ℕ → S) : S := mk fun n => ∑ i ∈ range (n+1), coeff (n-i) (lev i)

theorem add (F G : ℕ → S) : integrate (fun i => F i+G i)=integrate F+integrate G := by
  ext; simp [integrate,sum_add_distrib]

theorem sub (F G : ℕ → S) : integrate (fun i => F i-G i)=integrate F-integrate G := by
  ext; simp [integrate,sum_sub_distrib]

theorem scale (c : S) (F : ℕ → S) : integrate (fun i => c*F i)=c*integrate F := by
  apply PowerSeries.ext; intro n
  rw [coeff_mul,Finset.Nat.sum_antidiagonal_eq_sum_range_succ (fun i j => coeff i c*coeff j (integrate F))]
  simp only [integrate,coeff_mk,mul_sum]
  have triangle (f : ℕ → ℕ → K) : (∑ i ∈ range (n+1), ∑ j ∈ range (n-i+1), f i j) =
      ∑ j ∈ range (n+1), ∑ i ∈ range (n-j+1), f i j := by
    have h (g : ℕ → ℕ → K) (i : ℕ) (hi : i<n+1) :
        (∑ j ∈ range (n-i+1), g i j) = ∑ j ∈ range (n+1), if i+j≤n then g i j else 0 := by
      rw [←sum_filter]; congr 1; ext j; simp; omega
    calc
      _ = ∑ i ∈ range (n+1), ∑ j ∈ range (n+1), if i+j≤n then f i j else 0 :=
        sum_congr rfl fun i hi => h f i (mem_range.mp hi)
      _ = _ := by rw [sum_comm]; apply sum_congr rfl; intro j hj; rw [h (fun j i => f i j) j (mem_range.mp hj)]; simp [Nat.add_comm]
  calc
    _ = ∑ i ∈ range (n+1), ∑ j ∈ range (n-i+1), coeff j c * coeff (n-j-i) (F i) := by
      apply sum_congr rfl; intro i _; rw [coeff_mul,Finset.Nat.sum_antidiagonal_eq_sum_range_succ (fun j l => coeff j c * coeff l (F i))];
      apply sum_congr rfl; intro j _; rw [Nat.sub_sub, Nat.add_comm i j,← Nat.sub_sub]
    _ = _ := triangle _

theorem shift (F : ℕ → S) : integrate F = F 0 + X*integrate (fun i => F (i+1)) := by
  apply PowerSeries.ext; intro n; cases n with
  | zero => simp [integrate]
  | succ n =>
    rw [map_add,coeff_succ_X_mul]; simp only [integrate,coeff_mk]
    rw [sum_range_succ']; simp only [Nat.sub_zero,Nat.add_sub_add_right]; rw [add_comm]

theorem congr (F G : ℕ → S) (h : ∀ i, F i=G i) : integrate F=integrate G := congrArg integrate (funext h)

/-- If summing the child over a whole level gives the next level, the
backward extension recurrence evaluates the ordinary weighted terminal sum. -/
theorem telescope (E T C : ℕ → S) (h₁ : ∀ n, E (n+1)=C n)
    (h₂ : ∀ n, E n=T n+X*C n) : integrate T=E 0 := by
  have h := shift E
  have h' : integrate E=integrate T+X*integrate C := by
    rw [congr E _ h₂,add,scale]
  rw [congr _ _ h₁,h'] at h; exact add_right_cancel h

end
end Conjectures.ChernFuLinThreeStatistic.Mass
