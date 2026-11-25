module

public import Conjectures.RossiPermutohedronCharacteristic
public import Mathlib.Algebra.Polynomial.Splits

@[expose] public section
namespace RossiPermutohedron
open Polynomial

theorem rankPolynomial_isRoot_iff {n : ℕ} (hn : 0<n) {t : ℝ} (ht : t≠0) :
    (rankPolynomial n).IsRoot (-(t⁻¹)) ↔
      (reciprocalShift (shiftedEulerian (eulerianRec n))).IsRoot t := by
  rw [reciprocalShift_eval_iff ht,rankPolynomial_shifted hn]
  simp [IsRoot,eval_comp,sub_eq_add_neg]

theorem rankPolynomial_nonzero {n : ℕ} (hn : 0<n) : rankPolynomial n≠0 := by
  intro h
  have h0 := congrArg (Polynomial.eval (0:ℝ)) h
  simp [rankPolynomial_eq hn] at h0

theorem rankPolynomial_degree_le (m : ℕ) : (rankPolynomial (m+2)).natDegree≤m+2 := by
  rw [rankPolynomial_shifted (by omega)]
  have ha : (eulerianRec (m+2)) ≠ 0 := by
    intro h
    have hh := eulerianRec_eval0 (m+2)
    simp [h] at hh
  refine natDegree_comp_le.trans ?_
  rw [shiftedEulerian_natDegree ha,(eulerianRec_degree (m+1)).1]
  rw [add_comm (1 : ℝ[X]) X,← C_1,natDegree_X_add_C,mul_one]

/-- Rossi's equivalent rank-generating-polynomial formulation, for the literal
finite face set of Definition 2.3. The full multiset has n distinct negative
roots, so there are no remaining complex roots. -/
theorem rankPolynomial_roots_of_recurrence (m : ℕ)
    (hmodel : ∃ (s : Finset ℝ) (z : ℝ), s.card=m ∧
      (∀ x∈s,x∈Set.Ioo (0:ℝ) 1) ∧ 1<z ∧
      (reciprocalShift (shiftedEulerian (eulerianRec (m+2)))).roots =
        (insert z (insert 1 s)).val) :
    (rankPolynomial (m+2)).Splits ∧
      ∃ s : Finset ℝ, s.card=m+2 ∧ (∀ x∈s,x<0) ∧ (rankPolynomial (m+2)).roots=s.val := by
  classical
  obtain ⟨s,z,hs,hx,hz,hroots⟩ := hmodel
  let χ := reciprocalShift (shiftedEulerian (eulerianRec (m+2)))
  let r : Finset ℝ := insert z (insert 1 s)
  let e : ℝ ↪ ℝ := ⟨fun t => -(t⁻¹), fun a b h => inv_injective (neg_injective h)⟩
  have hone : (1:ℝ) ∉ s := fun h => (lt_irrefl _) (hx 1 h).2
  have hlarge : z∉insert 1 s := by
    intro h
    rcases Finset.mem_insert.mp h with h|h
    · exact hz.ne' h
    · exact (not_lt_of_ge hz.le) (hx z h).2
  have hc : r.card=m+2 := by simp [r,Finset.card_insert_of_notMem hlarge,
    Finset.card_insert_of_notMem hone,hs]
  have hpos (x : ℝ) (h : x∈r) : 0<x := by
    rcases Finset.mem_insert.mp h with rfl|h
    · exact zero_lt_one.trans hz
    rcases Finset.mem_insert.mp h with rfl|h
    · exact zero_lt_one
    · exact (hx x h).1
  have hneg (x : ℝ) (h : x∈r.map e) : x<0 := by
    obtain ⟨t,ht,rfl⟩ := Finset.mem_map.mp h
    exact neg_neg_of_pos (inv_pos.mpr (hpos t ht))
  have hc0 : χ≠0 := reciprocalShift_nonzero (by simp [shiftedEulerian_eval1])
  have hp0 := rankPolynomial_nonzero (n := m+2) (by omega)
  have hle : (r.map e).val ≤ (rankPolynomial (m+2)).roots := by
    apply (Multiset.le_iff_subset (r.map e).nodup).mpr
    intro x h
    obtain ⟨t,ht,rfl⟩ := Finset.mem_map.mp h
    apply (mem_roots hp0).mpr
    apply (rankPolynomial_isRoot_iff (by omega) (hpos t ht).ne').mpr
    apply (mem_roots hc0).mp
    change t ∈ (reciprocalShift (shiftedEulerian (eulerianRec (m+2)))).roots
    rwa [hroots]
  have he := Multiset.eq_of_le_of_card_le hle (by
    have h := (card_roots' (rankPolynomial (m+2))).trans (rankPolynomial_degree_le m)
    simpa only [← Finset.card_def,Finset.card_map,hc] using h)
  have hc' : (r.map e).card=m+2 := by rwa [Finset.card_map]
  refine ⟨splits_iff_card_roots.mpr ?_,r.map e,hc',hneg,he.symm⟩
  refine le_antisymm (card_roots' _) ?_
  rw [he.symm,← Finset.card_def,hc']
  exact rankPolynomial_degree_le m

end RossiPermutohedron
