module
public import Conjectures.NovelliThibonAlternants
public import Mathlib.Order.Hom.Set

@[expose] public section
namespace NovelliThibon

open Equiv

variable {ι : Type*} [Fintype ι] [LinearOrder ι] [Subsingleton (ι ≃o ι)]

/-- Strictly decreasing exponent vectors determine distinct permutation
orbits, and the coefficient at the strictly decreasing vector itself is one. -/
theorem coeff_alternant_strict {a b : ι → ℕ} (ha : StrictAnti a) (hb : StrictAnti b) :
    (alternant a).coeff (Finsupp.equivFunOnFinite.symm b) =
      if a=b then 1 else 0 := by
  classical
  unfold alternant
  rw [MvPolynomial.coeff_sum]
  simp only [MvPolynomial.coeff_monomial,Equiv.apply_eq_iff_eq]
  have hp (p : Perm ι) (h : a ∘ p.symm=b) : a=b ∧ p=1 := by
    have hr : Set.range a=Set.range b := by
      rw [← h,Set.range_comp, Set.range_eq_univ.mpr p.symm.surjective,Set.image_univ]
    have hab : a=b := StrictMono.eq_of_range_eq (β:=ℕᵒᵈ) ha hb hr
    refine ⟨hab,?_⟩
    ext i
    have hh := congrFun h (p i)
    simp only [Function.comp_apply,p.symm_apply_apply] at hh
    exact (hb.injective (hab ▸ hh)).symm
  by_cases h : a=b
  · subst b
    rw [ite_eq_left rfl,Finset.sum_eq_single 1]
    · have hi : a ∘ (1 : Perm ι).symm = a := by funext i; rfl
      simp [hi]
    · intro p _ hne
      have hh : a ∘ p.symm ≠ a := fun e => hne (hp p e).2
      simp [hh]
    · simp
  · rw [ite_eq_right h]
    apply Finset.sum_eq_zero
    intro p _
    exact ite_eq_right (fun e => h (hp p e).1)

open Classical in
noncomputable def validRaises (a : ι → ℕ) : Finset ι :=
  Finset.univ.filter fun j => StrictAnti (raiseAt a j)

open Classical in
noncomputable def exponentChains : ℕ → (ι → ℕ) → (ι → ℕ) → ℕ
  | 0,a,b => if a=b then 1 else 0
  | n+1,a,b => ∑ j ∈ validRaises a,exponentChains n (raiseAt a j) b

omit [Subsingleton (ι ≃o ι)] in
theorem validRaises_strict {a : ι → ℕ} {j : ι} (hj : j ∈ validRaises a) :
    StrictAnti (raiseAt a j) := (Finset.mem_filter.mp hj).2

/-- The coefficient after repeated multiplication by the first power
sum counts exactly the chains of strictly decreasing exponent vectors. -/
theorem coeff_alternant_mul_p1_pow (n : ℕ) {a b : ι → ℕ}
    (ha : StrictAnti a) (hb : StrictAnti b) :
    (alternant a * (∑ j : ι,MvPolynomial.X j)^n).coeff (Finsupp.equivFunOnFinite.symm b)
      = (exponentChains n a b : ℤ) := by
  classical
  induction n generalizing a with
  | zero =>
    simp [exponentChains,coeff_alternant_strict ha hb,apply_ite]
  | succ n ih =>
    rw [pow_succ',← mul_assoc,alternant_mul_p1_valid ha,Finset.sum_mul,MvPolynomial.coeff_sum]
    rw [exponentChains,Nat.cast_sum]
    apply Finset.sum_congr rfl
    intro j hj
    exact ih (validRaises_strict hj)

end NovelliThibon
