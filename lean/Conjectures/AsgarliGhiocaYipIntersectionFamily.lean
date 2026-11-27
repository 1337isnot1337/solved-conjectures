import Conjectures.AsgarliGhiocaYipOrderedRoots
import Conjectures.AsgarliGhiocaYipPlaneFactor

/-! # The intersection equations as a formal monic family -/

namespace Conjectures.AsgarliGhiocaYip

open Polynomial Finset
open scoped Classical

variable {K : Type*} [Field K]

/-- Parameter polynomial in `T`, ordinate polynomial in `Y`. Dividing by the
common leading coefficient supplies a monic polynomial in the ordinate. -/
noncomputable def monicIntersectionFamily (g : K[X]) (d : ℕ) (c u a : K) : PlanePolynomial K :=
  (∑ j ∈ range (d + 1), monomial j (C (g.coeff j * c⁻¹) * X ^ (d - j))) +
    monomial 1 (C (u * c⁻¹)) - monomial 0 (C (a * c⁻¹))

theorem specialize_monicIntersectionFamily (g : K[X]) (d : ℕ) (c u a t : K) :
    specialize t (monicIntersectionFamily g d c u a) = C c⁻¹ * intersectionPolynomial g d u a t := by
  simp only [monicIntersectionFamily, intersectionPolynomial, specialize, coe_mapRingHom, map_sub,
    map_add, Polynomial.map_sum, ← C_mul_X_pow_eq_monomial, Polynomial.map_mul, Polynomial.map_C,
    Polynomial.map_X, Polynomial.map_pow, coe_evalRingHom, eval_C, eval_pow, eval_X,
    mul_sub, mul_add, mul_sum, pow_zero, pow_one, mul_one, map_mul]
  have hsum : (∑ j ∈ range (d + 1), C (g.coeff j) * C c⁻¹ * C (t ^ (d - j)) * X ^ j) =
      ∑ j ∈ range (d + 1), C c⁻¹ * (C (g.coeff j) * C (t ^ (d - j)) * X ^ j) := by
    apply sum_congr rfl
    intro j _; ring
  rw [hsum]
  ring

theorem natDegree_coeff_monicIntersectionFamily_le (g : K[X]) (d : ℕ) (c u a : K) (j : ℕ) :
    ((monicIntersectionFamily g d c u a).coeff j).natDegree ≤ d - j := by
  unfold monicIntersectionFamily
  simp only [coeff_add, coeff_sub, finsetSum_coeff, coeff_monomial]
  apply (natDegree_sub_le ..).trans (max_le ?_ ?_)
  · apply (natDegree_add_le ..).trans (max_le ?_ ?_)
    · apply natDegree_sum_le_of_forall_le
      intro m _
      split_ifs with h
      · subst m
        exact (natDegree_C_mul_le _ _).trans (natDegree_X_pow _).le
      · simp
    · split_ifs
      · simp only [natDegree_C, Nat.zero_le]
      · simp
  · split_ifs
    · simp only [natDegree_C, Nat.zero_le]
    · simp

theorem monic_monicIntersectionFamily (g : K[X]) {d : ℕ} (hd : 2 ≤ d) {c : K} (hc : c ≠ 0)
    (hg : g.natDegree = d) (hg' : g.leadingCoeff = c) (u a : K) :
    (monicIntersectionFamily g d c u a).Monic ∧ (monicIntersectionFamily g d c u a).natDegree = d := by
  let F := monicIntersectionFamily g d c u a
  have hle : F.natDegree ≤ d := by
    apply natDegree_le_iff_coeff_eq_zero.mpr
    intro j hj
    have hn : j ∉ range (d + 1) := by simp; omega
    simp only [F, monicIntersectionFamily, coeff_sub, coeff_add, finsetSum_coeff]
    rw [sum_eq_zero]
    · rw [coeff_monomial_of_ne _ (show j ≠ 1 by omega), coeff_monomial_of_ne _ (show j ≠ 0 by omega)]
      simp
    · intro m hm
      exact coeff_monomial_of_ne _ (by have := mem_range.mp hm; omega)
  have hcd : F.coeff d = 1 := by
    have hgcoeff : g.coeff d = c := by rw [← hg, coeff_natDegree, hg']
    simp only [F, monicIntersectionFamily, coeff_sub, coeff_add, finsetSum_coeff]
    rw [sum_eq_single d]
    · rw [coeff_monomial_same]
      rw [coeff_monomial_of_ne _ (show d ≠ 1 by omega), coeff_monomial_of_ne _ (show d ≠ 0 by omega)]
      simp [hgcoeff, hc]
    · intro m _ hm; exact coeff_monomial_of_ne _ hm.symm
    · simp
  have hn : F.natDegree = d := le_antisymm hle (le_natDegree_of_ne_zero (hcd.symm ▸ one_ne_zero))
  exact ⟨by rw [Monic, ← coeff_natDegree, hn, hcd], hn⟩

private theorem exists_multiset_enumeration {α : Type*} (M : Multiset α) :
    ∃ v : Fin M.card → α, (univ : Finset (Fin M.card)).val.map v = M := by
  induction M using Quotient.inductionOn with
  | h l =>
    refine ⟨fun i ↦ l[i.val], ?_⟩
    rw [Fin.univ_val_map]
    exact congrArg (fun L : List α ↦ (L : Multiset α)) (List.ofFn_get l)

/-- Enumerate the roots of a monic polynomial with multiplicity over any
algebraically closed field. The same interface works at the generic point. -/
theorem exists_monic_root_factorization {L : Type*} [Field L] [IsAlgClosed L]
    {p : L[X]} (hm : p.Monic) {d : ℕ} (hd : p.natDegree = d) :
    ∃ v : Fin d → L, p = ∏ j, (X - C (v j)) := by
  have hc : p.roots.card = d := IsAlgClosed.card_roots_eq_natDegree.trans hd
  obtain ⟨v, hv⟩ := exists_multiset_enumeration p.roots
  let e := finCongr hc.symm
  let w : Fin d → L := v ∘ e
  have hw : (univ : Finset (Fin d)).val.map w = p.roots := by
    rw [show w = v ∘ e from rfl, ← Multiset.map_map]
    have he : (univ : Finset (Fin d)).val.map e = (univ : Finset (Fin p.roots.card)).val := by
      change (univ : Finset (Fin d)).val.map e.toEmbedding = _
      rw [← Finset.map_val (f := e.toEmbedding), map_univ_equiv]
    rw [he, hv]
  refine ⟨w, ?_⟩
  rw [(IsAlgClosed.splits p).eq_prod_roots_of_monic hm, ← hw, Multiset.map_map]
  rfl

/-- A degree-sized enumeration that works also at fibers with multiple roots. -/
theorem exists_intersection_enumeration (g : K[X]) {d : ℕ} (hd : 2 ≤ d) {c : K} (hc : c ≠ 0)
    (hg : g.natDegree = d) (hg' : g.leadingCoeff = c) (u a t : K) :
    ∃ v : Fin d → AlgebraicClosure K,
      Set.range v = (intersectionPolynomial g d u a t).rootSet (AlgebraicClosure K) ∧
      (specialize t (monicIntersectionFamily g d c u a)).map (algebraMap K (AlgebraicClosure K)) =
        ∏ j, (X - C (v j)) := by
  let E := AlgebraicClosure K
  let F := monicIntersectionFamily g d c u a
  let Q := (specialize t F).map (algebraMap K E)
  obtain ⟨hF, hFdeg⟩ := monic_monicIntersectionFamily g hd hc hg hg' u a
  have hQ : Q.Monic := (hF.map _).map _
  have hQdeg : Q.natDegree = d := ((hF.map _).natDegree_map _).trans ((hF.natDegree_map _).trans hFdeg)
  have hR : Q.roots.card = d := (IsAlgClosed.card_roots_eq_natDegree).trans hQdeg
  obtain ⟨w, hw⟩ := exists_multiset_enumeration Q.roots
  let e := finCongr hR.symm
  let v : Fin d → E := w ∘ e
  have hv : (univ : Finset (Fin d)).val.map v = Q.roots := by
    rw [show v = w ∘ e from rfl, ← Multiset.map_map]
    have he : (univ : Finset (Fin d)).val.map e = (univ : Finset (Fin Q.roots.card)).val := by
      change (univ : Finset (Fin d)).val.map e.toEmbedding = _
      rw [← Finset.map_val (f := e.toEmbedding), map_univ_equiv]
    rw [he, hw]
  refine ⟨v, ?_, ?_⟩
  · have hs : Q.roots = (intersectionPolynomial g d u a t).aroots E := by
      change ((specialize t F).map (algebraMap K E)).roots = _
      rw [specialize_monicIntersectionFamily, Polynomial.map_mul, Polynomial.map_C, roots_C_mul]
      simpa only [map_zero] using (algebraMap K E).injective.ne (inv_ne_zero hc)
    ext z
    change (∃ j, v j = z) ↔ z ∈ (intersectionPolynomial g d u a t).rootSet E
    rw [Polynomial.rootSet, Finset.mem_coe, Multiset.mem_toFinset, ← hs, ← hv]
    simp only [Multiset.mem_map, Finset.mem_val, mem_univ, true_and]
  · change Q = _
    have hsplit : Q.Splits := IsAlgClosed.splits Q
    rw [hsplit.eq_prod_roots_of_monic hQ, ← hv, Multiset.map_map]
    rfl

end Conjectures.AsgarliGhiocaYip
