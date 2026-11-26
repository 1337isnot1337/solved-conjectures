import Conjectures.AsgarliGhiocaYipOrderedRoots
import Conjectures.AsgarliGhiocaYipUniversalResolvent

/-! # From a twist equation to a counted ordering -/

namespace Conjectures.AsgarliGhiocaYip

open Polynomial Finset
open scoped Classical

variable {K E : Type*} [Field K] [Field E] [Algebra K E]
variable {k d : ℕ}

theorem injective_array_of_linearValue {w v : Fin k → Fin d → E}
    (h : Function.Injective (linearOrderingValue w v)) (i : Fin k) : Function.Injective (v i) := by
  classical
  intro a b hab
  let e : LabelPermutations k d := 1
  let p : LabelPermutations k d := Function.update e i (Equiv.swap a b)
  have hp : linearOrderingValue w v p = linearOrderingValue w v e := by
    unfold linearOrderingValue
    apply sum_congr rfl
    intro l _
    apply sum_congr rfl
    intro j _
    by_cases hli : l = i
    · subst l
      simp only [p, Function.update_self, e, Pi.one_apply, Equiv.Perm.one_apply]
      by_cases haj : j = a
      · subst j; simp [hab]
      by_cases hbj : j = b
      · subst j; simp [hab]
      · rw [Equiv.swap_apply_of_ne_of_ne haj hbj]
    · simp [p, Function.update_of_ne hli]
  have he := congrArg (fun q : LabelPermutations k d ↦ q i a) (h hp)
  simpa [p, e] using he.symm

variable [Fintype K] [Algebra.IsAlgebraic K E]

/-- Equip a distinct root enumeration with its root-set codomain. -/
noncomputable def enumerationEquiv {p : K[X]} (v : Fin d → E)
    (hi : Function.Injective v) (hr : Set.range v = p.rootSet E) : Fin d ≃ p.rootSet E :=
  Equiv.ofBijective (fun j ↦ ⟨v j, by rw [← hr]; exact Set.mem_range_self j⟩) (by
    constructor
    · intro a b h; exact hi (congrArg Subtype.val h)
    · intro x
      have hx : x.val ∈ Set.range v := by rw [hr]; exact x.property
      obtain ⟨j, hj⟩ := hx
      exact ⟨j, Subtype.ext hj⟩)

omit [Fintype K] [Algebra.IsAlgebraic K E] in
@[simp] theorem enumerationEquiv_val {p : K[X]} (v : Fin d → E)
    (hi : Function.Injective v) (hr : Set.range v = p.rootSet E) (j : Fin d) :
    (enumerationEquiv v hi hr j).val = v j := rfl

/-- Frobenius on the labels of a geometric root set. -/
noncomputable def labelFrobenius {p : K[X]} (e : Fin d ≃ p.rootSet E) : Equiv.Perm (Fin d) :=
  e.trans ((rootPermutation p).trans e.symm)

theorem labelFrobenius_val {p : K[X]} (e : Fin d ≃ p.rootSet E) (j : Fin d) :
    (e (labelFrobenius e j)).val = (e j).val ^ Fintype.card K := by
  rw [show e (labelFrobenius e j) = rootPermutation p (e j) from by simp [labelFrobenius]]
  rfl

theorem frobenius_linearOrderingValue (w : Fin k → Fin d → K) (v : Fin k → Fin d → E)
    (α : LabelPermutations k d) (hα : ∀ i j, v i (α i j) = v i j ^ Fintype.card K)
    (π : LabelPermutations k d) :
    linearOrderingValue (fun i j ↦ algebraMap K E (w i j)) v (α * π) =
      (linearOrderingValue (fun i j ↦ algebraMap K E (w i j)) v π) ^ Fintype.card K := by
  let φ := FiniteField.frobeniusAlgEquivOfAlgebraic K E
  have hφ (z : E) : φ z = z ^ Fintype.card K := rfl
  change _ = φ (linearOrderingValue (fun i j ↦ algebraMap K E (w i j)) v π)
  simp only [linearOrderingValue, map_sum, map_mul, AlgEquiv.commutes, Pi.mul_apply, Equiv.Perm.mul_apply]
  apply sum_congr rfl
  intro i _; apply sum_congr rfl; intro j _
  rw [hα, hφ]

section Ordering

variable {g : Fin k → K[X]} {p : K[X]} {u a t : K}

/-- Translate a compatible permutation of the root labels into the actual
bijections counted by `orderedPointCount`. -/
noncomputable def orderingOfCompatibleLabels (e : Fin d ≃ p.rootSet (AlgebraicClosure K))
    (b : ∀ i, Fin d ≃ (intersectionPolynomial (g i) d u a t).rootSet (AlgebraicClosure K))
    (π : LabelPermutations k d)
    (h : ∀ i, labelFrobenius (b i) * π i = π i * labelFrobenius e) : Ordering g d p u a t := by
  refine ⟨fun i ↦ e.symm.trans ((π i).trans (b i)), ?_⟩
  intro i x
  obtain ⟨j, rfl⟩ := e.surjective x
  have h' := congrArg (fun f : Equiv.Perm (Fin d) ↦ f j) (h i)
  simp only [Equiv.Perm.mul_apply] at h'
  have hroot (l : Fin d) : rootPermutation (intersectionPolynomial (g i) d u a t) (b i l) =
      b i (labelFrobenius (b i) l) := by simp [labelFrobenius]
  simp only [Equiv.trans_apply, Equiv.symm_apply_apply, hroot]
  exact congrArg (b i) h'.symm

theorem orderingOfCompatibleLabels_injective (e : Fin d ≃ p.rootSet (AlgebraicClosure K))
    (b : ∀ i, Fin d ≃ (intersectionPolynomial (g i) d u a t).rootSet (AlgebraicClosure K))
    {π ρ : LabelPermutations k d}
    {hπ : ∀ i, labelFrobenius (b i) * π i = π i * labelFrobenius e}
    {hρ : ∀ i, labelFrobenius (b i) * ρ i = ρ i * labelFrobenius e}
    (h : orderingOfCompatibleLabels e b π hπ = orderingOfCompatibleLabels e b ρ hρ) : π = ρ := by
  funext i; apply Equiv.ext; intro j
  apply (b i).injective
  have he := congrArg (fun r : Ordering g d p u a t ↦ r.val i (e j)) h
  simpa only [orderingOfCompatibleLabels, Equiv.trans_apply, Equiv.symm_apply_apply] using he

end Ordering

end Conjectures.AsgarliGhiocaYip
