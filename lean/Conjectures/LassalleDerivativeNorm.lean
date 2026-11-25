module

public import Conjectures.LassalleDerivativeIntervals

@[expose] public section
namespace LassalleRefinement

noncomputable def derivativeSupNorm (i j : ℕ) : ℝ := max 1 ((i:ℝ)+(j:ℝ))^2

noncomputable def derivativeMass (c : Component) (i j : ℕ) : ℝ :=
  ((derivativeTerms c i j).map fun m => |(m.2.2:ℝ)|).sum

private theorem optional_nonnegative_singleton (p : Prop) [Decidable p]
    (x : ℝ) (hx : 0≤x) : (if p then ([] : List ℝ) else [x]).sum≤x := by
  split_ifs <;> simp [hx]

private theorem map_optional_singleton {α β : Type} (p : Prop) [Decidable p]
    (f : α → β) (x : α) :
    (if p then [] else [x]).map f = if p then [] else [f x] := by
  split_ifs <;> simp

theorem derivativeMass_bound (c : Component) (i j : ℕ) :
    derivativeMass c i j ≤ derivativeSupNorm i j := by
  have hmax : (1:ℝ)≤max 1 ((i:ℝ)+(j:ℝ)) := le_max_left ..
  have hm : (i:ℝ)+(j:ℝ)≤max 1 ((i:ℝ)+(j:ℝ)) := le_max_right ..
  have hp : (0:ℝ)≤(i:ℝ)+(j:ℝ) := by positivity
  have h₁ : (1:ℝ)≤(max 1 ((i:ℝ)+(j:ℝ)))^2 := by nlinarith
  have h₂ : ((i:ℝ)+(j:ℝ))^2≤(max 1 ((i:ℝ)+(j:ℝ)))^2 := pow_le_pow_left₀ hp hm 2
  unfold derivativeSupNorm
  cases c
  case row =>
    simpa [derivativeMass,derivativeTerms] using h₁
  case down | up =>
    all_goals
      unfold derivativeMass
      simp only [derivativeTerms,List.map_append,List.sum_append,map_optional_singleton,
        Int.cast_natCast,Int.cast_neg,abs_neg,abs_of_nonneg (Nat.cast_nonneg _ : (0:ℝ)≤(i:ℝ)),
        abs_of_nonneg (Nat.cast_nonneg _ : (0:ℝ)≤(j:ℝ))]
      have hp₁ := optional_nonnegative_singleton (i=0) (i:ℝ) (Nat.cast_nonneg _)
      have hp₂ := optional_nonnegative_singleton (j=0) (j:ℝ) (Nat.cast_nonneg _)
      have hh := add_le_add hp₁ hp₂
      have hlin : (i:ℝ)+j ≤ (max 1 ((i:ℝ)+(j:ℝ)))^2 := by nlinarith
      exact hh.trans hlin
  case curvature =>
    unfold derivativeMass
    simp only [derivativeTerms,List.map_append,List.sum_append,map_optional_singleton,
      Int.cast_natCast,Int.cast_mul,Int.cast_neg,Int.cast_ofNat,abs_mul,abs_neg,abs_of_nonneg (Nat.cast_nonneg _ : (0:ℝ)≤(i:ℝ)),
      abs_of_nonneg (Nat.cast_nonneg _ : (0:ℝ)≤(j:ℝ)),
      abs_of_nonneg (Nat.cast_nonneg _ : (0:ℝ)≤((i-1:ℕ):ℝ)),
      abs_of_nonneg (Nat.cast_nonneg _ : (0:ℝ)≤((j-1:ℕ):ℝ)),abs_of_nonneg (by norm_num : (0:ℝ)≤2)]
    have hi := optional_nonnegative_singleton (i<2) ((i:ℝ)*((i-1:ℕ):ℝ)) (by positivity)
    have hj := optional_nonnegative_singleton (j<2) ((j:ℝ)*((j-1:ℕ):ℝ)) (by positivity)
    have hc := optional_nonnegative_singleton (i=0 ∨ j=0) (2*(i:ℝ)*(j:ℝ)) (by positivity)
    have hlt₁ : ((i-1:ℕ):ℝ)≤(i:ℝ) := by exact_mod_cast Nat.sub_le i 1
    have hlt₂ : ((j-1:ℕ):ℝ)≤(j:ℝ) := by exact_mod_cast Nat.sub_le j 1
    have hs₁ := mul_le_mul_of_nonneg_left hlt₁ (Nat.cast_nonneg i : (0:ℝ)≤ i)
    have hs₂ := mul_le_mul_of_nonneg_left hlt₂ (Nat.cast_nonneg j : (0:ℝ)≤ j)
    have he :
        (i:ℝ)*((i-1:ℕ):ℝ) + 2*(i:ℝ)*(j:ℝ) + (j:ℝ)*((j-1:ℕ):ℝ) ≤ ((i:ℝ)+(j:ℝ))^2 := by
      nlinarith
    simpa only [add_assoc] using (add_le_add (add_le_add hi hc) hj).trans (he.trans h₂)

end LassalleRefinement
