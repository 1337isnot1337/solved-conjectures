module
public import Conjectures.NovelliThibonFundamentalWords
public import Mathlib.Algebra.BigOperators.Ring.Finset
public import Mathlib.Data.Fintype.Perm

@[expose] public section
namespace NovelliThibon

open Classical

variable {n : ℕ} {A R : Type*} [LinearOrder A] [Fintype A] [CommSemiring R]

def wordWeight (x : A → R) (w : Fin n → A) : R :=
  ∏ i : Fin n, x (w i)

/-- Evaluation of the finite-alphabet fundamental function, indexed by
inverse descents of the permutation. -/
noncomputable def fundamentalEvaluation (σ : Equiv.Perm (Fin (n+1))) (x : A → R) : R :=
  ∑ w : (Fin (n+1) → A) with AdjacentFundamentalWord σ w, wordWeight x w

theorem fundamentalEvaluation_as_fibre (σ : Equiv.Perm (Fin (n+1))) (x : A → R) :
    fundamentalEvaluation σ x =
      ∑ w : (Fin (n+1) → A) with standardizeWord w = σ, wordWeight x w := by
  unfold fundamentalEvaluation
  have h : (Finset.univ.filter fun w : Fin (n+1) → A => AdjacentFundamentalWord σ w) =
      Finset.univ.filter (fun w : Fin (n+1) → A => standardizeWord w = σ) := by
    ext w
    simp only [Finset.mem_filter,Finset.mem_univ,true_and]
    exact adjacentFundamentalWord_iff_standardize σ w
  rw [h]

theorem fundamental_evaluations_sum (x : A → R) :
    (∑ σ : Equiv.Perm (Fin (n+1)), fundamentalEvaluation σ x) =
      ∑ w : (Fin (n+1) → A), wordWeight x w := by
  classical
  simp_rw [fundamentalEvaluation_as_fibre]
  exact Finset.sum_fiberwise Finset.univ standardizeWord (wordWeight x)

/-- Restricting the sum of fundamentals to a strict inversion is
exactly the unrestricted-word sum with a strict letter inequality. -/
theorem fundamental_comparison_fibre (x : A → R) {i j : Fin (n+1)} (hij : i < j) :
    (∑ σ : Equiv.Perm (Fin (n+1)) with σ j < σ i, fundamentalEvaluation σ x) =
      ∑ w : (Fin (n+1) → A) with w j < w i, wordWeight x w := by
  classical
  simp_rw [fundamentalEvaluation_as_fibre,Finset.sum_filter]
  let Q (w : Fin (n+1) → A) := if standardizeWord w j < standardizeWord w i then wordWeight x w else 0
  have h (σ : Equiv.Perm (Fin (n+1))) :
      (if σ j < σ i then ∑ w : (Fin (n+1) → A),
        if standardizeWord w = σ then wordWeight x w else 0 else 0) =
      ∑ w : (Fin (n+1) → A) with standardizeWord w = σ, Q w := by
    rw [Finset.sum_filter]
    by_cases hlt : σ j < σ i
    · rw [ite_eq_left hlt]
      apply Finset.sum_congr rfl
      intro w _
      by_cases hw : standardizeWord w = σ
      · simp [hw, Q, hlt]
      · simp [hw]
    · rw [ite_eq_right hlt]
      symm
      apply Finset.sum_eq_zero
      intro w _
      by_cases hw : standardizeWord w = σ
      · simp [hw,Q,hlt]
      · simp [hw]
  simp_rw [h]
  rw [Finset.sum_fiberwise]
  unfold Q
  simp only [standardizeWord_inversion_iff _ hij]

end NovelliThibon
