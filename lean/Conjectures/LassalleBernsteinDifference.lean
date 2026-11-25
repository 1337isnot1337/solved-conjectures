module

public import Conjectures.LassalleBernsteinAtIndex

@[expose] public section
namespace LassalleRefinement

theorem descending_factorial_increment (a i : ℕ) :
    ((a+1).descFactorial i:ℝ) - (a.descFactorial i:ℝ) =
      (i:ℝ)*(a.descFactorial (i-1):ℝ) := by
  cases i with
  | zero => simp
  | succ i =>
    have h := Nat.descFactorial_mul_self a i
    have h' := congrArg (fun v : ℕ => (v:ℝ)) h
    push_cast at h'
    rw [Nat.succ_descFactorial_succ]
    push_cast
    linear_combination h'

noncomputable def fallingRatio (x y i j : ℕ) : ℝ :=
  (x.descFactorial i:ℝ)*(y.descFactorial j:ℝ)/((x+y).descFactorial (i+j):ℝ)

private theorem fallingRatio_scaled_left (x y i j : ℕ) :
    (i:ℝ)*fallingRatio x y (i-1) j =
      ((i:ℝ)*(x.descFactorial (i-1):ℝ)*(y.descFactorial j:ℝ)) /
        ((x+y).descFactorial (i+j-1):ℝ) := by
  by_cases hi : i=0
  · simp [hi]
  · unfold fallingRatio
    rw [show i-1+j=i+j-1 by omega]
    ring

private theorem fallingRatio_scaled_right (x y i j : ℕ) :
    (j:ℝ)*fallingRatio x y i (j-1) =
      ((j:ℝ)*(x.descFactorial i:ℝ)*(y.descFactorial (j-1):ℝ)) /
        ((x+y).descFactorial (i+j-1):ℝ) := by
  by_cases hj : j=0
  · simp [hj]
  · unfold fallingRatio
    rw [show i+(j-1)=i+j-1 by omega]
    ring

private theorem fallingRatio_first_difference_nonzero
    (x y i j : ℕ) (hm : i+j≤x+y+1) (hp : 0 < i+j) :
    (x+y+1:ℝ)*(fallingRatio (x+1) y i j-fallingRatio x (y+1) i j) =
      (i:ℝ)*fallingRatio x y (i-1) j - (j:ℝ)*fallingRatio x y i (j-1) := by
  rw [fallingRatio_scaled_left,fallingRatio_scaled_right]
  have denominator :
      ((x+y+1).descFactorial (i+j):ℝ) =
        (x+y+1:ℝ)*((x+y).descFactorial (i+j-1):ℝ) := by
    conv_lhs => rw [show i+j=(i+j-1)+1 by omega,Nat.succ_descFactorial_succ]
    push_cast
    rfl
  have hn : (x+y+1:ℝ)≠0 := by positivity
  have hden : ((x+y).descFactorial (i+j-1):ℝ)≠0 := by
    exact_mod_cast (Nat.descFactorial_pos.mpr (by omega : i+j-1≤x+y)).ne'
  have hx := descending_factorial_increment x i
  have hy := descending_factorial_increment y j
  unfold fallingRatio
  rw [show x+1+y=x+y+1 by omega,show x+(y+1)=x+y+1 by omega,denominator]
  field_simp
  linear_combination (y.descFactorial j:ℝ)*hx -
    (x.descFactorial i:ℝ)*hy

/-- The first difference of a normalized Bernstein monomial is exactly
the corresponding first derivative coefficient at degree one less. -/
theorem fallingRatio_first_difference (x y i j : ℕ) (hm : i+j≤x+y+1) :
    (x+y+1:ℝ)*(fallingRatio (x+1) y i j-fallingRatio x (y+1) i j) =
      (i:ℝ)*fallingRatio x y (i-1) j - (j:ℝ)*fallingRatio x y i (j-1) := by
  by_cases hp : 0 < i+j
  · exact fallingRatio_first_difference_nonzero x y i j hm hp
  · have hi : i=0 := by omega
    have hj : j=0 := by omega
    simp [hi,hj,fallingRatio]

end LassalleRefinement
