module
public import Conjectures.NovelliThibonPairFactor
public import Mathlib.Algebra.BigOperators.Group.Finset.Sigma

@[expose] public section
namespace NovelliThibon

open Classical

variable {n : ℕ} {A R : Type*} [LinearOrder A] [Fintype A] [CommSemiring R]

/-- The exact universal first-weight identity.  Arbitrary coefficients
can weight the ordered comparisons, so it incorporates positive and
negative graph contributions when the coefficient ring has negatives. -/
theorem fundamental_linear_response (x : A → R)
    (E : Finset (Fin (n+1) × Fin (n+1))) (c : Fin (n+1) × Fin (n+1) → R)
    (hE : ∀ e ∈ E,e.1 < e.2) :
    (∑ σ : Equiv.Perm (Fin (n+1)),
      fundamentalEvaluation σ x *
        (∑ e ∈ E,if σ e.2 < σ e.1 then c e else 0)) =
      (∑ e ∈ E,c e) * (alphabetPairSum x*(alphabetSum x)^((n+1)-2)) := by
  classical
  simp_rw [Finset.mul_sum]
  rw [Finset.sum_comm,Finset.sum_mul]
  apply Finset.sum_congr rfl
  intro e he
  rw [← fundamentals_single_comparison x (hE e he),Finset.mul_sum,Finset.sum_filter]
  apply Finset.sum_congr rfl
  intro σ _
  by_cases h : σ e.2 < σ e.1
  · simp [h,mul_comm]
  · simp [h]

theorem fundamental_empty_variation (x : A → R) :
    (∑ σ : Equiv.Perm (Fin (n+1)),fundamentalEvaluation σ x) =
      (alphabetSum x)^(n+1) := by
  rw [fundamental_evaluations_sum,words_total_weight]

end NovelliThibon
