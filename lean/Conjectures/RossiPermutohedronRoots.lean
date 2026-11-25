module

public import Conjectures.RossiPermutohedronFaceRootTransport
public import Conjectures.RossiPermutohedronRecurrenceAll

@[expose] public section
namespace RossiPermutohedron
open Polynomial

/-- Rossi's original Conjecture 6.16 in its explicitly equivalent rank
enumerator form, with every face counted and all roots listed once. -/
theorem rankPolynomial_exact_roots (n : ℕ) (hn : 3≤n) :
    (rankPolynomial n).Splits ∧
      ∃ s : Finset ℝ, s.card=n ∧ (∀ x∈s,x<0) ∧ (rankPolynomial n).roots=s.val := by
  let m := n-2
  have hm : 1≤m := by dsimp [m]; omega
  have hmn : m+2=n := by dsimp [m]; omega
  simpa only [hmn] using rankPolynomial_roots_of_recurrence m (recurrence_model_roots_all m hm)

/-- The all-real, simple root split of Rossi's evaluated characteristic face sum. -/
theorem characteristicFacePolynomial_exact_roots (n : ℕ) (hn : 3≤n) :
    (characteristicFacePolynomial n).Splits ∧
      ∃ (s : Finset ℝ) (z : ℝ), s.card=n-2 ∧ (∀ x∈s,x∈Set.Ioo (0:ℝ) 1) ∧ 1<z ∧
        (characteristicFacePolynomial n).roots = (insert z (insert 1 s)).val := by
  let m := n-2
  have hm : 1≤m := by dsimp [m]; omega
  have hmn : m+2=n := by dsimp [m]; omega
  obtain ⟨s,z,hs,hx,hz,hroots⟩ := recurrence_model_roots_all m hm
  have hone : (1:ℝ) ∉ s := fun h => (lt_irrefl _) (hx 1 h).2
  have hlarge : z∉insert 1 s := by
    intro h
    rcases Finset.mem_insert.mp h with h|h
    · exact hz.ne' h
    · exact (not_lt_of_ge hz.le) (hx z h).2
  have hc : (insert z (insert 1 s)).card=m+2 := by
    rw [Finset.card_insert_of_notMem hlarge,Finset.card_insert_of_notMem hone,hs]
  have hdeg : (reciprocalShift (shiftedEulerian (eulerianRec (m+2)))).natDegree≤m+2 := by
    apply (reciprocalShift_degree_le _).trans
    have ha : eulerianRec (m+2) ≠ 0 := by
      intro h
      have h0 := eulerianRec_eval0 (m+2)
      simp [h] at h0
    rw [shiftedEulerian_natDegree ha,(eulerianRec_degree (m+1)).1]
  have hsplits : (reciprocalShift (shiftedEulerian (eulerianRec (m+2)))).Splits := by
    apply splits_iff_card_roots.mpr
    refine le_antisymm (card_roots' _) ?_
    rwa [hroots,← Finset.card_def,hc]
  rw [← characteristicFacePolynomial_eq_recurrence,hmn] at hsplits hroots
  exact ⟨hsplits,s,z,hs,hx,hz,hroots⟩

end RossiPermutohedron
