module

public import Conjectures.LassalleDerivativeAtIndex

@[expose] public section
namespace LassalleRefinement

theorem fallingDerivative_row (x y i j : ℕ) :
    fallingDerivative .row x y i j = fallingRatio x y i j := by
  simp [fallingDerivative,derivativeTerms]

theorem fallingDerivative_first (c : Component) (hc : c=.down ∨ c=.up) (x y i j : ℕ) :
    fallingDerivative c x y i j =
      (i:ℝ)*fallingRatio x y (i-1) j - (j:ℝ)*fallingRatio x y i (j-1) := by
  rcases hc with rfl|rfl <;>
    by_cases hi : i=0 <;> by_cases hj : j=0 <;>
    simp [fallingDerivative,derivativeTerms,hi,hj,sub_eq_add_neg,mul_comm]

theorem fallingDerivative_second (x y i j : ℕ) :
    fallingDerivative .curvature x y i j =
      (i:ℝ)*(i-1:ℕ)*fallingRatio x y (i-2) j -
        2*(i:ℝ)*(j:ℝ)*fallingRatio x y (i-1) (j-1) +
        (j:ℝ)*(j-1:ℕ)*fallingRatio x y i (j-2) := by
  have hi : i=0 ∨ i=1 ∨ 2 ≤ i := by omega
  have hj : j=0 ∨ j=1 ∨ 2≤j := by omega
  rcases hi with rfl|rfl|hi <;> rcases hj with rfl|rfl|hj
  all_goals
    try have hi0 : i≠0 := by omega
    try have hj0 : j≠0 := by omega
    simp_all [fallingDerivative,derivativeTerms,sub_eq_add_neg,not_lt_of_ge]
  all_goals ring

end LassalleRefinement
