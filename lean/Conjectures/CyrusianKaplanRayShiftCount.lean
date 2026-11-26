module
public import Conjectures.CyrusianKaplanRayPolynomial
public import Conjectures.CyrusianKaplanWeakCompositions
public import Conjectures.CyrusianKaplanQuasipolynomial

@[expose] public section
namespace CyrusianKaplan

open Polynomial
open scoped BigOperators

noncomputable def rayShiftCount (k p h g : ℕ) : ℕ :=
  Nat.card {q : Fin (k+1) → ℕ // h+p*(∑ i,q i)=g}

private theorem rayShiftCount_empty (k p h g : ℕ)
    (hN : ¬∃ q : Fin (k+1) → ℕ,h+p*(∑ i,q i)=g) : rayShiftCount k p h g=0 := by
  unfold rayShiftCount
  have hEmpty : IsEmpty {q : Fin (k+1) → ℕ // h+p*(∑ i,q i)=g} :=
    ⟨fun q => hN ⟨q.val,q.property⟩⟩
  exact Nat.card_eq_zero.mpr (Or.inl hEmpty)

theorem rayShiftCount_of_not_congruent (k p h g : ℕ) (hN : ¬g≡h [MOD p]) :
    rayShiftCount k p h g=0 := by
  apply rayShiftCount_empty
  rintro ⟨q,hq⟩
  apply hN
  unfold Nat.ModEq
  rw [← hq,add_comm,Nat.mul_add_mod]

theorem rayShiftCount_of_congruent (k p h g : ℕ) (hp : 0<p) (hC : g≡h [MOD p]) :
    rayShiftCount k p h g=if h≤g then ((g-h)/p+k).choose k else 0 := by
  split_ifs with hg
  · have hD := (Nat.modEq_iff_dvd' hg).mp hC.symm
    have hm : p*((g-h)/p)=g-h := by rw [mul_comm p _,Nat.div_mul_cancel hD]
    unfold rayShiftCount
    rw [← weakRayCompositions_card]
    apply Nat.card_congr
    apply Equiv.subtypeEquivRight
    intro q
    constructor
    · intro hq
      apply Nat.mul_left_cancel hp
      rw [hm]
      omega
    · intro hq
      change (∑ i,q i)=(g-h)/p at hq
      rw [hq,hm]
      omega
  · apply rayShiftCount_empty
    rintro ⟨q,hq⟩
    omega

theorem rayBinomialPolynomial_natDegree_le (k : ℕ) :
    (rayBinomialPolynomial k).natDegree≤k := by
  unfold rayBinomialPolynomial
  apply Polynomial.natDegree_comp_le.trans
  have hA : (C ((k.factorial:ℚ)⁻¹)*descPochhammer ℚ k).natDegree≤k := by
    exact Polynomial.natDegree_mul_le.trans (by simp [descPochhammer_natDegree])
  have hB : ((X : ℚ[X])+C (k:ℚ)).natDegree≤1 :=
    (Polynomial.natDegree_add_le _ _).trans (by simp)
  exact (Nat.mul_le_mul hA hB).trans_eq (mul_one k)

theorem shiftedRayPolynomial_natDegree_le (k p h : ℕ) :
    (shiftedRayPolynomial k p h).natDegree≤k := by
  unfold shiftedRayPolynomial
  apply Polynomial.natDegree_comp_le.trans
  have hB : (C ((p:ℚ)⁻¹)*((X : ℚ[X])-C (h:ℚ))).natDegree≤1 := by
    refine Polynomial.natDegree_mul_le.trans ?_
    simpa only [Polynomial.natDegree_C,zero_add] using
      (Polynomial.natDegree_sub_le (X : ℚ[X]) (C (h:ℚ))).trans (by simp)
  exact (Nat.mul_le_mul (rayBinomialPolynomial_natDegree_le k) hB).trans_eq (mul_one k)

/-- A finite sum of literal common-period ray slices has a
quasipolynomial of degree at most k at every positive genus, when
each numerator shift is bounded by (k+1) periods. -/
theorem finite_ray_shifts_quasipolynomial {B : Type*} [Fintype B] (h : B → ℕ)
    (k p : ℕ) (hp : 0<p) (hB : ∀ b,h b≤(k+1)*p) :
    HasPositiveGenusQuasipolynomial
      (fun g => ∑ b,(rayShiftCount k p (h b) g:ℚ)) k := by
  let Q (s : Fin p) : ℚ[X] :=
    ∑ b, if s.val=(h b)%p then shiftedRayPolynomial k p (h b) else 0
  refine ⟨p,hp,Q,?_,?_⟩
  · intro s
    apply Polynomial.natDegree_sum_le_of_forall_le
    intro b _
    split_ifs
    · exact shiftedRayPolynomial_natDegree_le _ _ _
    · simp
  · intro g hg
    change (∑ b,(rayShiftCount k p (h b) g:ℚ)) =
      ((∑ b,if g%p=(h b)%p then shiftedRayPolynomial k p (h b) else 0)).eval (g:ℚ)
    rw [Polynomial.eval_finsetSum]
    apply Finset.sum_congr rfl
    intro b _
    split_ifs with hmod
    · rw [rayShiftCount_of_congruent _ _ _ _ hp hmod,
        shiftedRayPolynomial_eval _ _ _ _ hp hg (hB b) hmod]
      split_ifs <;> simp
    · rw [rayShiftCount_of_not_congruent _ _ _ _ hmod,Nat.cast_zero,Polynomial.eval_zero]

end CyrusianKaplan
