module
public import Mathlib.Analysis.Polynomial.Basic
public import Mathlib.Topology.Algebra.Polynomial
public import Mathlib.Topology.Order.IntermediateValue

@[expose] public section
namespace WachsCompleteGraph

open Polynomial

/-- A linearly ordered list with as many distinct roots as the degree
gives an exact factorization, including multiplicities. -/
theorem monic_eq_prod_of_distinct_roots {n : ℕ} {P : Polynomial ℝ}
    (hP : P.Monic) (hd : P.natDegree = n) (r : Fin n → ℝ)
    (hr : Function.Injective r) (hroot : ∀ i, P.eval (r i) = 0) :
    P = ∏ i : Fin n, (X - C (r i)) := by
  classical
  let S := Finset.univ.image r
  have hS : S.card = n := by
    rw [Finset.card_image_of_injective _ hr]
    simp
  have hz (x : ℝ) (hx : x ∈ S) : P.eval x = 0 := by
    obtain ⟨i,_,rfl⟩ := Finset.mem_image.mp hx
    exact hroot i
  have hR := roots_eq_of_natDegree_le_card_of_ne_zero hz (by rw [hd,hS]) hP.ne_zero
  calc
    P = (P.roots.map fun a => X-C a).prod :=
      (prod_multiset_X_sub_C_of_monic_of_roots_card_eq hP (by rw [hR,Finset.card_val,hS,hd])).symm
    _ = ∏ a ∈ S, (X-C a) := by rw [hR]; rfl
    _ = _ := Finset.prod_image (fun i _ j _ hij => hr hij)

/-- There is a strict interior root between any two evaluations of
opposite sign. -/
theorem exists_root_between {P : Polynomial ℝ} {a b : ℝ}
    (hab : a < b) (hs : P.eval a * P.eval b < 0) :
    ∃ x ∈ Set.Ioo a b, P.eval x = 0 := by
  have hna : P.eval a ≠ 0 := fun h => by rw [h,zero_mul] at hs; exact (lt_irrefl _ hs).elim
  have hnb : P.eval b ≠ 0 := fun h => by rw [h,mul_zero] at hs; exact (lt_irrefl _ hs).elim
  have h : 0 ∈ P.eval '' Set.Icc a b := by
    rcases mul_neg_iff.mp hs with ⟨hpos,hneg⟩ | ⟨hneg,hpos⟩
    · exact intermediate_value_Icc' hab.le P.continuous.continuousOn ⟨hneg.le,hpos.le⟩
    · exact intermediate_value_Icc hab.le P.continuous.continuousOn ⟨hneg.le,hpos.le⟩
  obtain ⟨x,hx,hz⟩ := h
  refine ⟨x,⟨lt_of_le_of_ne hx.1 (fun e => hna (e.symm ▸ hz)),
    lt_of_le_of_ne hx.2 (fun e => hnb (e ▸ hz))⟩,hz⟩

/-- A factored polynomial changes sign across a segment containing
exactly one of its roots, with both endpoints strictly off all roots. -/
theorem sign_crossing_single {n : ℕ} (r : Fin n → ℝ) (i : Fin n) {a b : ℝ}
    (ha : a < r i) (hb : r i < b)
    (hrest : ∀ j, j ≠ i → r j < a ∨ b < r j) :
    (∏ j, (a-r j)) * (∏ j, (b-r j)) < 0 := by
  classical
  rw [← Finset.prod_mul_distrib,Finset.prod_eq_mul_prod_sdiff_singleton_of_mem (Finset.mem_univ i)]
  apply mul_neg_of_neg_of_pos
  · exact mul_neg_of_neg_of_pos (sub_neg.mpr ha) (sub_pos.mpr hb)
  · apply Finset.prod_pos
    intro j hj
    have hn : j ≠ i := by simpa using (Finset.mem_sdiff.mp hj).2
    obtain h | h := hrest j hn
    · exact mul_pos (sub_pos.mpr h) (sub_pos.mpr (h.trans (ha.trans hb)))
    · exact mul_pos_of_neg_of_neg (sub_neg.mpr ((ha.trans hb).trans h)) (sub_neg.mpr h)

end WachsCompleteGraph
