import Conjectures.AsgarliGhiocaYipResolventFiber
import Conjectures.AsgarliGhiocaYipSymmetricBlocks
import Conjectures.AsgarliGhiocaYipWeighted
import Mathlib.Algebra.Polynomial.Lifts

/-! # The formal polynomial of all ordering values

The products here are performed before specialization, in polynomial rings on
formal variables. The weights on columns of the symmetric-coefficient arrays
are `1, …, d` in each block.
-/

namespace Conjectures.AsgarliGhiocaYip

open Finset
open scoped Classical

variable {R : Type*} [CommRing R] {k d : ℕ}

private abbrev Variables (k d : ℕ) := Fin k × Fin d

/-- A linear separator with coefficients in the base field. -/
def linearOrderingValue (w : Fin k → Fin d → R) (v : Fin k → Fin d → R)
    (π : LabelPermutations k d) : R := ∑ i, ∑ j, w i j * v i (π i j)

private noncomputable def universalValue (w : Fin k → Fin d → R) (π : LabelPermutations k d) :
    MvPolynomial (Variables k d) R :=
  ∑ i, ∑ j, MvPolynomial.C (w i j) * MvPolynomial.X (i, π i j)

/-- A polynomial in `Z` with independent indeterminates for the enumerated roots. -/
noncomputable def universalOrderingResolvent (w : Fin k → Fin d → R) :
    Polynomial (MvPolynomial (Variables k d) R) :=
  ∏ π : LabelPermutations k d, (Polynomial.X - Polynomial.C (universalValue w π))

private theorem universalOrderingResolvent_relabel (w : Fin k → Fin d → R) (τ : LabelPermutations k d) :
    (universalOrderingResolvent w).map
      (MvPolynomial.rename (fun a : Variables k d ↦ (a.1, τ a.1 a.2))).toRingHom =
        universalOrderingResolvent w := by
  let f := MvPolynomial.rename (R := R) (fun a : Variables k d ↦ (a.1, τ a.1 a.2))
  have h (π : LabelPermutations k d) : f.toRingHom (universalValue w π) = universalValue w (τ * π) := by
    simp [f, universalValue, map_sum, map_mul, Pi.mul_apply, Equiv.Perm.mul_apply]
  change (universalOrderingResolvent w).map f.toRingHom = _
  simp only [universalOrderingResolvent, Polynomial.map_prod, Polynomial.map_sub, Polynomial.map_X,
    Polynomial.map_C, h]
  exact Equiv.prod_comp (Equiv.mulLeft τ)
    (fun π : LabelPermutations k d ↦ Polynomial.X - Polynomial.C (universalValue w π))

private theorem universalOrderingResolvent_block (w : Fin k → Fin d → R)
    (i : Fin k) (p : Equiv.Perm (Fin d)) :
    (universalOrderingResolvent w).map (MvPolynomial.rename (blockPerm i p)).toRingHom =
      universalOrderingResolvent w := by
  let τ : LabelPermutations k d := Function.update (fun _ ↦ Equiv.refl _) i p
  have h : (fun a : Variables k d ↦ (a.1, τ a.1 a.2)) = blockPerm i p := by
    funext a
    rcases a with ⟨l, j⟩
    by_cases hli : l = i
    · subst l; simp [τ]
    · simp [τ, hli, Function.update_of_ne]
  rw [← h]
  exact universalOrderingResolvent_relabel w τ

private theorem exists_coefficientResolvent (w : Fin k → Fin d → R) :
    ∃ Q : Polynomial (MvPolynomial (Variables k d) R),
      Q.map (esymmBlocks.toRingHom) = universalOrderingResolvent w := by
  apply (Polynomial.mem_lifts _).mp
  apply (Polynomial.lifts_iff_coeff_lifts _).mpr
  intro j
  change ∃ _, _
  apply exists_esymmBlocks_eq
  intro i p
  change (MvPolynomial.rename (blockPerm i p)).toRingHom ((universalOrderingResolvent w).coeff j) = _
  rw [← Polynomial.coeff_map, universalOrderingResolvent_block]

/-- The unique polynomial in elementary symmetric coefficients that gives the
universal resolvent under the block substitutions. -/
noncomputable def coefficientResolvent (w : Fin k → Fin d → R) :
    Polynomial (MvPolynomial (Variables k d) R) := Classical.choose (exists_coefficientResolvent w)

theorem coefficientResolvent_map (w : Fin k → Fin d → R) :
    (coefficientResolvent w).map (esymmBlocks.toRingHom) = universalOrderingResolvent w :=
  Classical.choose_spec (exists_coefficientResolvent w)

theorem coefficientResolvent_monic [Nontrivial R] (w : Fin k → Fin d → R) :
    (coefficientResolvent w).Monic := by
  apply Polynomial.monic_of_injective (f := esymmBlocks.toRingHom) esymmBlocks_injective
  rw [coefficientResolvent_map]
  exact Polynomial.monic_prod_of_monic _ _ fun _ _ ↦ Polynomial.monic_X_sub_C _

theorem natDegree_coefficientResolvent [Nontrivial R] (w : Fin k → Fin d → R) :
    (coefficientResolvent w).natDegree = d.factorial ^ k := by
  rw [← (coefficientResolvent_monic w).natDegree_map esymmBlocks.toRingHom,
    coefficientResolvent_map, universalOrderingResolvent,
    Polynomial.natDegree_finsetProd_X_sub_C_eq_card, card_univ, card_labelPermutations]

private theorem universalValue_homogeneous (w : Fin k → Fin d → R) (π : LabelPermutations k d) :
    (universalValue w π).IsWeightedHomogeneous (fun _ ↦ (1 : ℕ)) 1 := by
  apply MvPolynomial.IsWeightedHomogeneous.sum
  intro i _; apply MvPolynomial.IsWeightedHomogeneous.sum
  intro j _
  exact (MvPolynomial.isWeightedHomogeneous_X R (fun _ ↦ (1 : ℕ)) (i, π i j)).C_mul (w i j)

private theorem coeff_prod_sub_linear_homogeneous [Nontrivial R] {ι ξ : Type*}
    (v : ι → MvPolynomial ξ R) (hv : ∀ i, (v i).IsWeightedHomogeneous (fun _ ↦ (1 : ℕ)) 1)
    (s : Finset ι) (j : ℕ) :
    ((∏ i ∈ s, (Polynomial.X - Polynomial.C (v i))).coeff j).IsWeightedHomogeneous
      (fun _ ↦ (1 : ℕ)) (s.card - j) := by
  let V := MvPolynomial ξ R
  let A (π : ι) : Polynomial V := Polynomial.X - Polynomial.C (v π)
  have hA (π : ι) (j : ℕ) :
      ((A π).coeff j).IsWeightedHomogeneous (fun _ ↦ (1 : ℕ)) (1 - j) := by
    rcases j with _ | j
    · simp only [A, Polynomial.coeff_sub, Polynomial.coeff_X_zero, Polynomial.coeff_C_zero, zero_sub]
      exact (hv π).neg
    · by_cases hj : j = 0
      · subst j
        simpa [A] using MvPolynomial.isWeightedHomogeneous_one R (fun _ : ξ ↦ (1 : ℕ))
      · simpa [A, Polynomial.coeff_X, hj] using
          MvPolynomial.isWeightedHomogeneous_zero R (fun _ : ξ ↦ (1 : ℕ)) (1 - (j + 1))
  change ((∏ π ∈ s, A π).coeff j).IsWeightedHomogeneous (fun _ ↦ (1 : ℕ)) (s.card - j)
  induction s using Finset.induction_on generalizing j with
  | empty =>
    by_cases hj : j = 0
    · subst j; simpa using MvPolynomial.isWeightedHomogeneous_one R (fun _ : ξ ↦ (1 : ℕ))
    · simpa [Polynomial.coeff_one, hj] using
        MvPolynomial.isWeightedHomogeneous_zero R (fun _ : ξ ↦ (1 : ℕ)) 0
  | insert p s hp ih =>
    rw [prod_insert hp, card_insert_of_notMem hp, Polynomial.coeff_mul]
    apply MvPolynomial.IsWeightedHomogeneous.sum
    rintro ⟨i, m⟩ hm
    have hij := Finset.mem_antidiagonal.mp hm
    by_cases hi : i ≤ 1
    · by_cases hj : m ≤ s.card
      · exact (show 1 - i + (s.card - m) = s.card + 1 - j by omega) ▸ (hA p i).mul (ih m)
      · have hz : (∏ π ∈ s, A π).coeff m = 0 := by
          apply Polynomial.coeff_eq_zero_of_natDegree_lt
          exact (le_of_eq (Polynomial.natDegree_finsetProd_X_sub_C_eq_card s _)).trans_lt (by omega)
        rw [hz, mul_zero]
        exact MvPolynomial.isWeightedHomogeneous_zero R _ _
    · have hz : (A p).coeff i = 0 := by
        apply Polynomial.coeff_eq_zero_of_natDegree_lt
        exact (Polynomial.natDegree_X_sub_C_le _).trans_lt (by omega)
      rw [hz, zero_mul]
      exact MvPolynomial.isWeightedHomogeneous_zero R _ _

private theorem coeff_universalOrderingResolvent_homogeneous [Nontrivial R]
    (w : Fin k → Fin d → R) (l : ℕ) :
    ((universalOrderingResolvent w).coeff l).IsWeightedHomogeneous (fun _ ↦ (1 : ℕ))
      (d.factorial ^ k - l) := by
  simpa only [universalOrderingResolvent, card_univ, card_labelPermutations] using
    coeff_prod_sub_linear_homogeneous (universalValue w) (universalValue_homogeneous w) univ l

theorem coeff_coefficientResolvent_weighted [Nontrivial R] (w : Fin k → Fin d → R) (j : ℕ) :
    ((coefficientResolvent w).coeff j).IsWeightedHomogeneous (fun a ↦ a.2.val + 1)
      (d.factorial ^ k - j) := by
  apply isWeightedHomogeneous_of_injective_aeval
    (g := fun a : Variables k d ↦ blockESymm a.1 (a.2.val + 1))
    (fun a ↦ isWeightedHomogeneous_block_esymm a.1 (a.2.val + 1)) esymmBlocks_injective
  change (esymmBlocks.toRingHom ((coefficientResolvent w).coeff j)).IsWeightedHomogeneous _ _
  rw [← Polynomial.coeff_map (f := esymmBlocks.toRingHom), coefficientResolvent_map]
  exact coeff_universalOrderingResolvent_homogeneous w j

private theorem universalOrderingResolvent_relabel_weights (w : Fin k → Fin d → R)
    (σ : Equiv.Perm (Fin d)) :
    universalOrderingResolvent (fun i j ↦ w i (σ j)) = universalOrderingResolvent w := by
  let τ : LabelPermutations k d := fun _ ↦ σ.symm
  have h (π : LabelPermutations k d) :
      universalValue (fun i j ↦ w i (σ j)) π = universalValue w (π * τ) := by
    unfold universalValue
    apply sum_congr rfl
    intro i _
    simpa only [Pi.mul_apply, Equiv.Perm.mul_apply, τ, Equiv.symm_apply_apply] using
      Equiv.sum_comp σ (fun j ↦ MvPolynomial.C (w i j) * MvPolynomial.X (i, π i (σ.symm j)))
  simp only [universalOrderingResolvent, h]
  exact Equiv.prod_comp (Equiv.mulRight τ)
    (fun π : LabelPermutations k d ↦ Polynomial.X - Polynomial.C (universalValue w π))

theorem coefficientResolvent_relabel_weights (w : Fin k → Fin d → R) (σ : Equiv.Perm (Fin d)) :
    coefficientResolvent (fun i j ↦ w i (σ j)) = coefficientResolvent w := by
  apply Polynomial.map_injective _ esymmBlocks_injective
  simp only [coefficientResolvent_map, universalOrderingResolvent_relabel_weights]

theorem coefficientResolvent_map_scalars {S : Type*} [CommRing S] (f : R →+* S)
    (w : Fin k → Fin d → R) :
    (coefficientResolvent w).map (MvPolynomial.map f) = coefficientResolvent (fun i j ↦ f (w i j)) := by
  let m := MvPolynomial.map (σ := Variables k d) f
  have hc : esymmBlocks.toRingHom.comp m = m.comp esymmBlocks.toRingHom := by
    apply MvPolynomial.ringHom_ext
    · intro r; simp [m, esymmBlocks]
    · intro x
      simp [m, esymmBlocks, blockESymm, MvPolynomial.esymm, map_sum, map_prod]
  apply Polynomial.map_injective _ esymmBlocks_injective
  rw [coefficientResolvent_map, Polynomial.map_map, hc, ← Polynomial.map_map, coefficientResolvent_map]
  simp only [universalOrderingResolvent, Polynomial.map_prod, Polynomial.map_sub, Polynomial.map_X,
    Polynomial.map_C]
  simp only [universalValue, m, map_sum, map_mul, MvPolynomial.map_C, MvPolynomial.map_X]

private theorem eval_comp_esymmBlocks {S : Type*} [CommRing S] (f : R →+* S)
    (v : Fin k → Fin d → S) :
    (MvPolynomial.eval₂Hom f (fun a : Variables k d ↦ v a.1 a.2)).comp esymmBlocks.toRingHom =
      MvPolynomial.eval₂Hom f (fun a ↦ ((univ : Finset (Fin d)).val.map (v a.1)).esymm (a.2.val + 1)) := by
  apply MvPolynomial.ringHom_ext
  · intro r; simp [esymmBlocks]
  · rintro ⟨i, j⟩
    simp only [esymmBlocks, RingHom.comp_apply, AlgHom.toRingHom_eq_coe, RingHom.coe_coe,
      MvPolynomial.aeval_X, blockESymm, MvPolynomial.esymm, map_sum, map_prod, MvPolynomial.rename_X,
      MvPolynomial.eval₂Hom_X']
    exact (Finset.esymm_map_val _ _ _).symm

/-- Specialization after substituting elementary symmetric values is exactly the
product of the linear forms on the permuted root arrays. -/
theorem coefficientResolvent_eval_of_roots {S : Type*} [CommRing S] (f : R →+* S)
    (w : Fin k → Fin d → R) (v : Fin k → Fin d → S) :
    (coefficientResolvent w).map (MvPolynomial.eval₂Hom f (fun a ↦
      ((univ : Finset (Fin d)).val.map (v a.1)).esymm (a.2.val + 1))) =
    ∏ π : LabelPermutations k d,
      (Polynomial.X - Polynomial.C (∑ i, ∑ j, f (w i j) * v i (π i j))) := by
  rw [← eval_comp_esymmBlocks f v, ← Polynomial.map_map, coefficientResolvent_map]
  simp only [universalOrderingResolvent, Polynomial.map_prod, Polynomial.map_sub, Polynomial.map_X,
    Polynomial.map_C]
  simp only [universalValue, map_sum, map_mul, MvPolynomial.eval₂Hom_C, MvPolynomial.eval₂Hom_X']

/-! ## Interpolation of right translations of the labels -/

private noncomputable def universalTwist (w : Fin k → Fin d → R) (τ : LabelPermutations k d) :
    Polynomial (MvPolynomial (Variables k d) R) :=
  ∑ π : LabelPermutations k d, Polynomial.C (universalValue w (π * τ)) *
    ∏ π' ∈ univ.erase π, (Polynomial.X - Polynomial.C (universalValue w π'))

private theorem universalTwist_relabel (w : Fin k → Fin d → R) (τ γ : LabelPermutations k d) :
    (universalTwist w τ).map
      (MvPolynomial.rename (fun a : Variables k d ↦ (a.1, γ a.1 a.2))).toRingHom =
        universalTwist w τ := by
  let e := Equiv.mulLeft γ
  let f := MvPolynomial.rename (R := R) (fun a : Variables k d ↦ (a.1, γ a.1 a.2))
  have h (π : LabelPermutations k d) : f.toRingHom (universalValue w π) = universalValue w (e π) := by
    simp [f, universalValue, map_sum, map_mul, e, Pi.mul_apply, Equiv.Perm.mul_apply]
  have hprod (π : LabelPermutations k d) :
      (∏ π' ∈ univ.erase π, (Polynomial.X - Polynomial.C (universalValue w (e π')))) =
        ∏ π' ∈ univ.erase (e π), (Polynomial.X - Polynomial.C (universalValue w π')) := by
    apply Finset.prod_equiv e
    · intro π'; simp
    · intros; rfl
  change (universalTwist w τ).map f.toRingHom = _
  simp only [universalTwist, Polynomial.map_sum, Polynomial.map_mul, Polynomial.map_C,
    Polynomial.map_prod, Polynomial.map_sub, Polynomial.map_X, h, hprod]
  have hmul (π : LabelPermutations k d) : e (π * τ) = e π * τ := mul_assoc .. |>.symm
  simp only [hmul]
  exact Equiv.sum_comp e (fun π : LabelPermutations k d ↦ Polynomial.C (universalValue w (π * τ)) *
    ∏ π' ∈ univ.erase π, (Polynomial.X - Polynomial.C (universalValue w π')))

private theorem exists_coefficientTwist (w : Fin k → Fin d → R) (τ : LabelPermutations k d) :
    ∃ Q : Polynomial (MvPolynomial (Variables k d) R),
      Q.map (esymmBlocks.toRingHom) = universalTwist w τ := by
  apply (Polynomial.mem_lifts _).mp
  apply (Polynomial.lifts_iff_coeff_lifts _).mpr
  intro j
  change ∃ _, _
  apply exists_esymmBlocks_eq
  intro i p
  let γ : LabelPermutations k d := Function.update (fun _ ↦ Equiv.refl _) i p
  have h : (fun a : Variables k d ↦ (a.1, γ a.1 a.2)) = blockPerm i p := by
    funext a
    rcases a with ⟨l, j⟩
    by_cases hli : l = i
    · subst l; simp [γ]
    · simp [γ, hli, Function.update_of_ne]
  change (MvPolynomial.rename (blockPerm i p)).toRingHom ((universalTwist w τ).coeff j) = _
  rw [← Polynomial.coeff_map, ← h, universalTwist_relabel]

/-- The interpolation numerator for an ordering translated on the right by `τ`.
Its denominator at any root of the resolvent is the ordinate derivative. -/
noncomputable def coefficientTwist (w : Fin k → Fin d → R) (τ : LabelPermutations k d) :
    Polynomial (MvPolynomial (Variables k d) R) := Classical.choose (exists_coefficientTwist w τ)

private theorem coefficientTwist_map (w : Fin k → Fin d → R) (τ : LabelPermutations k d) :
    (coefficientTwist w τ).map (esymmBlocks.toRingHom) = universalTwist w τ :=
  Classical.choose_spec (exists_coefficientTwist w τ)

theorem natDegree_coefficientTwist_le [Nontrivial R] (w : Fin k → Fin d → R) (τ : LabelPermutations k d) :
    (coefficientTwist w τ).natDegree ≤ d.factorial ^ k - 1 := by
  have hdeg := Polynomial.natDegree_map_eq_of_injective (f := esymmBlocks.toRingHom)
    esymmBlocks_injective (coefficientTwist w τ)
  rw [← hdeg, coefficientTwist_map, universalTwist]
  apply Polynomial.natDegree_sum_le_of_forall_le
  intro π _
  apply (Polynomial.natDegree_C_mul_le _ _).trans
  rw [Polynomial.natDegree_finsetProd_X_sub_C_eq_card, card_erase_of_mem (mem_univ π),
    card_univ, card_labelPermutations]

theorem coeff_coefficientTwist_weighted [Nontrivial R] (w : Fin k → Fin d → R)
    (τ : LabelPermutations k d) (j : ℕ) :
    ((coefficientTwist w τ).coeff j).IsWeightedHomogeneous (fun a ↦ a.2.val + 1)
      (d.factorial ^ k - j) := by
  apply isWeightedHomogeneous_of_injective_aeval
    (g := fun a : Variables k d ↦ blockESymm a.1 (a.2.val + 1))
    (fun a ↦ isWeightedHomogeneous_block_esymm a.1 (a.2.val + 1)) esymmBlocks_injective
  change (esymmBlocks.toRingHom ((coefficientTwist w τ).coeff j)).IsWeightedHomogeneous _ _
  rw [← Polynomial.coeff_map (f := esymmBlocks.toRingHom), coefficientTwist_map, universalTwist,
    Polynomial.finsetSum_coeff]
  apply MvPolynomial.IsWeightedHomogeneous.sum
  intro π _
  rw [Polynomial.coeff_C_mul]
  let s := (univ : Finset (LabelPermutations k d)).erase π
  have hs : s.card + 1 = d.factorial ^ k := by
    have hn : 0 < d.factorial ^ k := by positivity
    simp only [s, card_erase_of_mem (mem_univ π), card_univ, card_labelPermutations,
      Nat.sub_add_cancel hn]
  by_cases hj : j ≤ s.card
  · have h := (universalValue_homogeneous w (π * τ)).mul
      (coeff_prod_sub_linear_homogeneous (universalValue w) (universalValue_homogeneous w) s j)
    simpa only [show 1 + (s.card - j) = d.factorial ^ k - j by omega] using h
  · have hz : (∏ π' ∈ s, (Polynomial.X - Polynomial.C (universalValue w π'))).coeff j = 0 := by
      apply Polynomial.coeff_eq_zero_of_natDegree_lt
      rw [Polynomial.natDegree_finsetProd_X_sub_C_eq_card]
      omega
    rw [show (univ : Finset (LabelPermutations k d)).erase π = s from rfl, hz, mul_zero]
    exact MvPolynomial.isWeightedHomogeneous_zero R _ _

theorem coefficientTwist_eval_of_roots {S : Type*} [CommRing S] (f : R →+* S)
    (w : Fin k → Fin d → R) (v : Fin k → Fin d → S) (τ : LabelPermutations k d) :
    (coefficientTwist w τ).map (MvPolynomial.eval₂Hom f (fun a ↦
      ((univ : Finset (Fin d)).val.map (v a.1)).esymm (a.2.val + 1))) =
    ∑ π : LabelPermutations k d, Polynomial.C (linearOrderingValue (fun i j ↦ f (w i j)) v (π * τ)) *
      ∏ π' ∈ univ.erase π, (Polynomial.X - Polynomial.C (linearOrderingValue (fun i j ↦ f (w i j)) v π')) := by
  rw [← eval_comp_esymmBlocks f v, ← Polynomial.map_map, coefficientTwist_map]
  simp only [universalTwist, Polynomial.map_sum, Polynomial.map_mul, Polynomial.map_prod, Polynomial.map_sub,
    Polynomial.map_X, Polynomial.map_C]
  simp only [universalValue, linearOrderingValue, map_sum, map_mul, MvPolynomial.eval₂Hom_C,
    MvPolynomial.eval₂Hom_X']

end Conjectures.AsgarliGhiocaYip
