import Conjectures.CircularDeletedColoring
import Mathlib.Combinatorics.SimpleGraph.DegreeSum

/-! Finite simple graphs specified by coloured edges, with a checked degree at every vertex. -/

namespace CircularIndex.Deleted

def tableGraph (n p : ℕ) (rows : Array ℕ) : SimpleGraph (Fin n) where
  Adj v w := v ≠ w ∧ colour rows v w < p
  symm := ⟨fun v w h => ⟨h.1.symm, (colour_comm rows v w) ▸ h.2⟩⟩
  loopless := ⟨fun _ h => h.1 rfl⟩

instance (n p : ℕ) (rows : Array ℕ) : DecidableRel (tableGraph n p rows).Adj :=
  fun v w => inferInstanceAs (Decidable (v ≠ w ∧ colour rows v w < p))

def countedDegree {n : ℕ} (G : SimpleGraph (Fin n)) [DecidableRel G.Adj] (v : Fin n) : ℕ :=
  (Finset.univ.filter (G.Adj v)).card

theorem degree_eq_counted {n : ℕ} (G : SimpleGraph (Fin n)) [DecidableRel G.Adj] (v : Fin n) :
    G.degree v = countedDegree G v := by
  rw [SimpleGraph.degree, G.neighborFinset_eq_filter]
  rfl

/-- Checking the degree table determines both the maximum degree and the edge count.
When edge density equals the exhibited real colouring radius the index is exact. -/
theorem table_exact {n p q d e : ℕ} [NeZero p] {rows inverse : Array ℕ}
    {degrees : Fin n → ℕ} (v₀ : Fin n)
    (hc : ∀ v, ValidAt (tableGraph n p rows) p q rows inverse v)
    (hd : ∀ v, countedDegree (tableGraph n p rows) v = degrees v)
    (hmax : ∀ v, degrees v ≤ d) (h₀ : degrees v₀ = d)
    (hE : ∑ v, degrees v = 2*e) (hm : e*q = p*(n/2))
    (hn : 2 ≤ n) (hq : 0 < q) (hqp : q ≤ p) :
    (∀ v, (tableGraph n p rows).degree v ≤ d) ∧
    (tableGraph n p rows).degree v₀ = d ∧
    circularChromaticIndex (tableGraph n p rows) = (p : ℝ)/q := by
  let G := tableGraph n p rows
  have hdegrees (v : Fin n) : G.degree v = degrees v := (degree_eq_counted _ _).trans (hd v)
  have hcount := G.sum_degrees_eq_twice_card_edges
  simp_rw [hdegrees] at hcount
  rw [hE, ← G.card_edgeSet] at hcount
  have hedge : Fintype.card G.edgeSet = e := by omega
  obtain ⟨hl,hu⟩ := bounds_of_card hc hn hq hqp hedge
  refine ⟨fun v => (hdegrees v).trans_le (hmax v), (hdegrees v₀).trans h₀, le_antisymm hu ?_⟩
  apply le_trans _ hl
  have hn' : 0 < ((n/2 : ℕ) : ℝ) := by exact_mod_cast (show 0 < n/2 by omega)
  have hq' : 0 < (q : ℝ) := by exact_mod_cast hq
  apply (div_le_div_iff₀ hq' hn').mpr
  exact_mod_cast hm.symm.le

end CircularIndex.Deleted
