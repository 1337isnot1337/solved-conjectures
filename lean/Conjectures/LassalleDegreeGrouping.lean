module

public import Conjectures.LassalleNormalizedCoefficients
public import Mathlib.Algebra.BigOperators.Group.Finset.Sigma

@[expose] public section
namespace LassalleRefinement

theorem sum_triangle_by_degree {A : Type*} [AddCommMonoid A] (k : ℕ) (f : ℕ→ℕ→A) :
    (∑ i ∈ Finset.range (k+1), ∑ j ∈ Finset.range (k+1-i),f i j) =
      ∑ m ∈ Finset.range (k+1), ∑ i ∈ Finset.range (m+1),f i (m-i) := by
  classical
  simp only [Finset.sum_sigma']
  apply Finset.sum_bij (fun (p : Σ _ : ℕ, ℕ) _ => (⟨p.1+p.2,p.1⟩ : Σ _ : ℕ, ℕ))
  · rintro ⟨i,j⟩ h
    simp only [Finset.mem_sigma,Finset.mem_range] at h ⊢
    omega
  · rintro ⟨i,j⟩ _ ⟨i',j'⟩ _ h
    have h₁ := congrArg (fun (p : Σ _ : ℕ, ℕ) => p.1) h
    have h₂ := congrArg (fun (p : Σ _ : ℕ, ℕ) => p.2) h
    dsimp only at h₁ h₂
    have h₃ : j=j' := by omega
    subst i'
    subst j'
    rfl
  · rintro ⟨m,i⟩ h
    simp only [Finset.mem_sigma,Finset.mem_range] at h
    refine ⟨⟨i,m-i⟩,?_,?_⟩
    · simp only [Finset.mem_sigma,Finset.mem_range]
      omega
    · have he : i+(m-i)=m := by omega
      rw [he]
  · rintro ⟨i,j⟩ _
    simp

theorem fallingRatio_zero_left (a b i j : ℕ) (h : a < i) :
    fallingRatio a b i j=0 := by simp [fallingRatio,Nat.descFactorial_of_lt h]

theorem fallingRatio_zero_right (a b i j : ℕ) (h : b < j) :
    fallingRatio a b i j=0 := by simp [fallingRatio,Nat.descFactorial_of_lt h]

/-- The support constraints on i and j can be made independent of the row
position. The exact sum is now grouped by total degree. -/
theorem scaledQuotientRow_grouped (R M : ℝ) (k a : ℕ) (ha : a≤2*k) (hM : M≠0) :
    scaledQuotientRow R M k a =
      ∑ m ∈ Finset.range (k+1),∑ i ∈ Finset.range (m+1),
        realCoeff R i (m-i) * fallingRatio a (2*k-a) (2*i) (2*(m-i)) *
          normalizedInverse R M (k-i-(m-i)) := by
  rw [scaledQuotientRow_expansion R M k a ha hM]
  let f (i j : ℕ) := realCoeff R i j * fallingRatio a (2*k-a) (2*i) (2*j) *
      normalizedInverse R M (k-i-j)
  refine Eq.trans ?_ (sum_triangle_by_degree k f)
  change (∑ i ∈ Finset.range (a/2+1),∑ j ∈ Finset.range ((2*k-a)/2+1),f i j) =
    ∑ i ∈ Finset.range (k+1),∑ j ∈ Finset.range (k+1-i),f i j
  calc
    _ = ∑ i ∈ Finset.range (a/2+1),∑ j ∈ Finset.range (k+1-i),f i j := by
      apply Finset.sum_congr rfl
      intro i hi
      have h₁ := Finset.mem_range.mp hi
      apply Finset.sum_subset
      · intro j hj
        have h₂ := Finset.mem_range.mp hj
        exact Finset.mem_range.mpr (by omega)
      · intro j _ hj
        have h₂ : 2*k-a < 2*j := by simp only [Finset.mem_range] at hj; omega
        simp [f,fallingRatio_zero_right _ _ _ _ h₂]
    _ = _ := by
      apply Finset.sum_subset
      · intro i hi
        have h₁ := Finset.mem_range.mp hi
        exact Finset.mem_range.mpr (by omega)
      · intro i _ hi
        have h₁ : a < 2*i := by simp only [Finset.mem_range] at hi; omega
        simp [f,fallingRatio_zero_left _ _ _ _ h₁]

end LassalleRefinement
