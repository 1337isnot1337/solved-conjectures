module

public import Conjectures.LassalleBernsteinDifference

@[expose] public section
namespace LassalleRefinement

private theorem lowerLeftDifference (x y i j : ℕ) (hm : i+j≤x+y+2) :
    (x+y+1:ℝ)*((i:ℝ)*(fallingRatio (x+1) y (i-1) j-fallingRatio x (y+1) (i-1) j)) =
      (i:ℝ)*(i-1:ℕ)*fallingRatio x y (i-2) j -
        (i:ℝ)*(j:ℝ)*fallingRatio x y (i-1) (j-1) := by
  by_cases hi : i=0
  · simp [hi]
  have h := fallingRatio_first_difference x y (i-1) j (by omega)
  rw [show i-1-1=i-2 by omega] at h
  linear_combination (i:ℝ)*h

private theorem lowerRightDifference (x y i j : ℕ) (hm : i+j≤x+y+2) :
    (x+y+1:ℝ)*((j:ℝ)*(fallingRatio (x+1) y i (j-1)-fallingRatio x (y+1) i (j-1))) =
      (i:ℝ)*(j:ℝ)*fallingRatio x y (i-1) (j-1) -
        (j:ℝ)*(j-1:ℕ)*fallingRatio x y i (j-2) := by
  by_cases hj : j=0
  · simp [hj]
  have h := fallingRatio_first_difference x y i (j-1) (by omega)
  rw [show j-1-1=j-2 by omega] at h
  linear_combination (j:ℝ)*h

/-- Exact second forward difference of a normalized Bernstein monomial,
as the curvature component of the written certificate. -/
theorem fallingRatio_second_difference (x y i j : ℕ) (hm : i+j≤x+y+2) :
    (x+y+2:ℝ)*(x+y+1:ℝ)*
      (fallingRatio (x+2) y i j-2*fallingRatio (x+1) (y+1) i j+fallingRatio x (y+2) i j) =
      (i:ℝ)*(i-1:ℕ)*fallingRatio x y (i-2) j -
        2*(i:ℝ)*(j:ℝ)*fallingRatio x y (i-1) (j-1) +
        (j:ℝ)*(j-1:ℕ)*fallingRatio x y i (j-2) := by
  have h₁ := fallingRatio_first_difference (x+1) y i j (by omega)
  have h₂ := fallingRatio_first_difference x (y+1) i j (by omega)
  rw [show x+1+1=x+2 by omega] at h₁
  rw [show y+1+1=y+2 by omega] at h₂
  push_cast at h₁ h₂
  have hL := lowerLeftDifference x y i j hm
  have hR := lowerRightDifference x y i j hm
  linear_combination (x+y+1:ℝ)*(h₁-h₂)+hL-hR

end LassalleRefinement
