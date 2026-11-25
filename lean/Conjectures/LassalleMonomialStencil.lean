module

public import Conjectures.LassalleFallingDerivativeFormulas
public import Conjectures.LassalleDeterminant

@[expose] public section
namespace LassalleRefinement

theorem stencil_monomial_at_index (n a i j : ℕ) (ha : 0<a) (hb : a<n) (hi : i+j≤n)
    (c : Component) :
    determinantInputs n
      (fallingRatio (a-1) (n-(a-1)) i j)
      (fallingRatio a (n-a) i j)
      (fallingRatio (a+1) (n-(a+1)) i j) c =
    derivativeValue ((a:ℝ)/n) (1/(n:ℝ)) c i j := by
  have hn : 0<n := by omega
  have hx : c.offset≤a := by cases c <;> simp [Component.offset] <;> omega
  have hy : c.degree-c.offset≤n-a := by
    cases c <;> simp [Component.offset,Component.degree] <;> omega
  rw [derivativeValue_at_index hn (by omega) c i j hi hx hy]
  cases c
  case row =>
    simp [determinantInputs,fallingDerivative_row,Component.offset,Component.degree]
  case down =>
    simp only [determinantInputs,Component.offset,Component.degree,Nat.sub_self,Nat.sub_zero]
    rw [fallingDerivative_first .down (Or.inl rfl)]
    have h := fallingRatio_first_difference (a-1) (n-a) i j (by omega)
    rw [show a-1+1=a by omega,show n-a+1=n-(a-1) by omega] at h
    have he : (((a-1:ℕ):ℝ)+((n-a:ℕ):ℝ)+1)=(n:ℝ) := by
      exact_mod_cast (show a-1+(n-a)+1=n by omega)
    rwa [he] at h
  case up =>
    simp only [determinantInputs,Component.offset,Component.degree,Nat.sub_zero]
    rw [fallingDerivative_first .up (Or.inr rfl)]
    have h := fallingRatio_first_difference a (n-a-1) i j (by omega)
    rw [show n-a-1+1=n-a by omega,show n-a-1=n-(a+1) by omega] at h
    have he : (a:ℝ)+((n-(a+1):ℕ):ℝ)+1=(n:ℝ) := by
      exact_mod_cast (show a+(n-(a+1))+1=n by omega)
    rw [he] at h
    rwa [show n-a-1=n-(a+1) by omega]
  case curvature =>
    simp only [determinantInputs,Component.offset,Component.degree]
    norm_num
    rw [fallingDerivative_second]
    have h := fallingRatio_second_difference (a-1) (n-a-1) i j (by omega)
    rw [show a-1+2=a+1 by omega,show a-1+1=a by omega,
      show n-a-1+2=n-(a-1) by omega,show n-a-1+1=n-a by omega] at h
    have he₂ : (((a-1:ℕ):ℝ)+((n-a-1:ℕ):ℝ)+2)=(n:ℝ) := by
      exact_mod_cast (show a-1+(n-a-1)+2=n by omega)
    have he₁ : (((a-1:ℕ):ℝ)+((n-a-1:ℕ):ℝ)+1)=(n:ℝ)-1 := by
      linarith
    rw [he₂,he₁,show n-a-1=n-(a+1) by omega] at h
    rw [show n-a-1=n-(a+1) by omega]
    linear_combination h

theorem stencil_scale (s n l q r : ℝ) (c : Component) :
    determinantInputs n (s*l) (s*q) (s*r) c = s*determinantInputs n l q r c := by
  cases c <;> simp only [determinantInputs] <;> ring

theorem stencil_sum {α : Type*} (S : Finset α) (n : ℝ) (l q r : α→ℝ) (c : Component) :
    determinantInputs n (∑ a ∈ S,l a) (∑ a ∈ S,q a) (∑ a ∈ S,r a) c =
      ∑ a ∈ S,determinantInputs n (l a) (q a) (r a) c := by
  cases c <;> simp only [determinantInputs]
  case down => rw [←Finset.mul_sum,Finset.sum_sub_distrib]
  case up => rw [←Finset.mul_sum,Finset.sum_sub_distrib]
  case curvature =>
    rw [←Finset.mul_sum,Finset.sum_add_distrib,Finset.sum_sub_distrib,←Finset.mul_sum]

end LassalleRefinement
