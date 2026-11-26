import Conjectures.AsgarliGhiocaYipSeparator
import Mathlib.FieldTheory.Separable

/-! # The polynomial of ordering values in one fiber

The product uses permutations of an enumeration with multiplicities. It need
not start with distinct roots: separability of the product forces distinctness.
-/

namespace Conjectures.AsgarliGhiocaYip

open Finset Polynomial

variable {K E : Type*} [Field K] [Field E] [Algebra K E]
variable {k d : ℕ}

/-- The product over all permuted tuples in a specialization of the cover. -/
noncomputable def orderingResolvent (r : Fin d → E) (s : K) (v : Fin k → Fin d → E) : E[X] :=
  ∏ p : LabelPermutations k d, (X - C (separatorValue r s (fun i j ↦ v i (p i j))))

theorem monic_orderingResolvent (r : Fin d → E) (s : K) (v : Fin k → Fin d → E) :
    (orderingResolvent r s v).Monic := monic_prod_of_monic _ _ fun _ _ ↦ monic_X_sub_C _

theorem natDegree_orderingResolvent (r : Fin d → E) (s : K) (v : Fin k → Fin d → E) :
    (orderingResolvent r s v).natDegree = d.factorial ^ k := by
  rw [orderingResolvent, natDegree_finsetProd_X_sub_C_eq_card, card_univ, card_labelPermutations]

theorem separable_orderingResolvent_iff (r : Fin d → E) (s : K) (v : Fin k → Fin d → E) :
    (orderingResolvent r s v).Separable ↔ Function.Injective
      (fun p : LabelPermutations k d ↦ separatorValue r s (fun i j ↦ v i (p i j))) :=
  separable_prod_X_sub_C_iff

theorem orderingResolvent_reindex (r : Fin d → E) (s : K) (v : Fin k → Fin d → E)
    (τ : LabelPermutations k d) : orderingResolvent r s (fun i j ↦ v i (τ i j)) = orderingResolvent r s v := by
  exact Equiv.prod_comp (Equiv.mulLeft τ) (fun p : LabelPermutations k d ↦
    X - C (separatorValue r s (fun i j ↦ v i (p i j))))

theorem eval_orderingResolvent_at_value (r : Fin d → E) (s : K) (v : Fin k → Fin d → E)
    (p : LabelPermutations k d) :
    (orderingResolvent r s v).eval (separatorValue r s (fun i j ↦ v i (p i j))) = 0 := by
  classical
  simp only [orderingResolvent, eval_prod, eval_sub, eval_X, eval_C, prod_eq_zero_iff, mem_univ, true_and]
  exact ⟨p, sub_self _⟩

theorem existsUnique_labelPermutations_of_root {r : Fin d → E} {s : K} {v : Fin k → Fin d → E}
    (hsep : (orderingResolvent r s v).Separable) {z : E} (hz : (orderingResolvent r s v).eval z = 0) :
    ∃! p : LabelPermutations k d, separatorValue r s (fun i j ↦ v i (p i j)) = z := by
  classical
  simp only [orderingResolvent, eval_prod, eval_sub, eval_X, eval_C,
    prod_eq_zero_iff, mem_univ, true_and, sub_eq_zero] at hz
  obtain ⟨p, hp⟩ := hz
  exact ⟨p, hp.symm, fun p' hp' ↦ (separable_orderingResolvent_iff r s v).mp hsep (hp'.trans hp)⟩

theorem injective_of_separable_orderingResolvent {r : Fin d → E} {s : K} {v : Fin k → Fin d → E}
    (hsep : (orderingResolvent r s v).Separable) (i : Fin k) : Function.Injective (v i) := by
  classical
  intro a b hab
  let e : LabelPermutations k d := fun _ ↦ Equiv.refl _
  let p : LabelPermutations k d := Function.update e i (Equiv.swap a b)
  have h : (fun i' j ↦ v i' (p i' j)) = fun i' j ↦ v i' (e i' j) := by
    funext i' j
    by_cases hi : i' = i
    · subst i'
      simp only [p, Function.update_self, e, Equiv.refl_apply]
      by_cases haj : j = a
      · subst j; simpa using hab.symm
      by_cases hbj : j = b
      · subst j; simpa using hab
      · rw [Equiv.swap_apply_of_ne_of_ne haj hbj]
    · simp [p, Function.update_of_ne hi]
  have hp : p = e := (separable_orderingResolvent_iff r s v).mp hsep (congrArg (separatorValue r s) h)
  have he := congrArg (fun w : LabelPermutations k d ↦ w i a) hp
  simpa [p, e] using he.symm

theorem map_separatorValue (φ : E ≃ₐ[K] E) {r : Fin d → E} (σ : Equiv.Perm (Fin d))
    (hσ : ∀ j, φ (r j) = r (σ j)) (s : K) (v : Fin k → Fin d → E) :
    φ (separatorValue r s v) = separatorValue r s (fun i j ↦ φ (v i (σ.symm j))) := by
  classical
  simp only [separatorValue, separatorPolynomial, eval_finsetSum, eval_monomial,
    map_sum, map_mul, map_pow, AlgEquiv.commutes, hσ]
  apply sum_congr rfl
  intro e _
  let i := (finProdFinEquiv (m := k) (n := d)).symm e
  simpa only [Equiv.symm_apply_apply] using Equiv.sum_comp σ
    (fun j ↦ φ (v i.1 (σ.symm j)) * r j ^ i.2.val * (algebraMap K E s)^e.val)

/-- If the separator values are distinct, the permutation picked out by a rational
root intertwines the action on the labels with the action on the enumerated roots. -/
theorem equivariant_of_rational_ordering_value
    (φ : E ≃ₐ[K] E) {r : Fin d → E} (σ : Equiv.Perm (Fin d)) (hσ : ∀ j, φ (r j) = r (σ j))
    {s : K} {v : Fin k → Fin d → E} (τ : Fin k → Equiv.Perm (Fin d))
    (hτ : ∀ i j, φ (v i j) = v i (τ i j)) (hsep : (orderingResolvent r s v).Separable)
    (p : LabelPermutations k d) {z : K}
    (h : separatorValue r s (fun i j ↦ v i (p i j)) = algebraMap K E z) :
    ∀ i j, φ (v i (p i j)) = v i (p i (σ j)) := by
  let p' : LabelPermutations k d := fun i ↦ (σ.symm.trans (p i)).trans (τ i)
  have hp' : separatorValue r s (fun i j ↦ v i (p' i j)) = algebraMap K E z := by
    have he := map_separatorValue φ σ hσ s (fun i j ↦ v i (p i j))
    rw [h, AlgEquiv.commutes] at he
    simpa [p', hτ] using he.symm
  have heq : p' = p := (separable_orderingResolvent_iff r s v).mp hsep (hp'.trans h.symm)
  intro i j
  have he := congrArg (fun w : LabelPermutations k d ↦ w i (σ j)) heq
  simpa [p', hτ] using congrArg (v i) he

end Conjectures.AsgarliGhiocaYip
