module
public import Conjectures.LassalleCatalanQuotient

@[expose] public section
namespace LassalleRefinement

theorem quotientRow_symm (k a : ℕ) (ha : a≤2*k) :
    quotientRow k (2*k-a)=quotientRow k a := by
  have he : 2*k-(2*k-a)=a := by omega
  simp only [quotientRow,he]
  conv_lhs => rw [Finset.sum_comm]
  apply Finset.sum_congr rfl
  intro i _
  apply Finset.sum_congr rfl
  intro j _
  have hh : k-j-i=k-i-j := by omega
  rw [hh]
  ring

theorem quotientRow_strict_from_first_half
    (h : ∀ k a, 54≤k → 0<a → a≤k → quotientRow k (a-1)*quotientRow k (a+1)<quotientRow k a^2)
    (k a : ℕ) (hk : 54≤k) (hp : 0<a) (ha : a<2*k) :
    quotientRow k (a-1)*quotientRow k (a+1)<quotientRow k a^2 := by
  by_cases hm : a≤k
  · exact h k a hk hp hm
  · let b := 2*k-a
    have hb : 0<b ∧ b≤k := by dsimp [b]; omega
    have hr := h k b hk hb.1 hb.2
    have h₁ : a-1=2*k-(b+1) := by dsimp [b]; omega
    have h₂ : a+1=2*k-(b-1) := by dsimp [b]; omega
    have h₃ : a=2*k-b := by dsimp [b]; omega
    have e₁ : quotientRow k (a-1)=quotientRow k (b+1) :=
      (congrArg (quotientRow k) h₁).trans (quotientRow_symm k (b+1) (by omega))
    have e₂ : quotientRow k (a+1)=quotientRow k (b-1) :=
      (congrArg (quotientRow k) h₂).trans (quotientRow_symm k (b-1) (by omega))
    have e₃ : quotientRow k a=quotientRow k b :=
      (congrArg (quotientRow k) h₃).trans (quotientRow_symm k b (by omega))
    rw [e₁,e₂,e₃,mul_comm]
    exact hr

end LassalleRefinement
