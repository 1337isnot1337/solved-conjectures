import Conjectures.HartkeMatchingExcessPairCount
import Conjectures.HartkeMatchingExcessExtensionEdges
import Mathlib.Order.Int.ConditionallyCompleteOrder
import Mathlib.Order.ConditionallyCompleteLattice.Basic

/-!
# Hartke–Stolee–West–Yancey's matching-excess conjecture

The actual extremal constant over all finite even orders. The elementary
alternating-switch bound makes the integer excesses bounded above. Their
maximum is attained; Hetyei's extension realizes that maximum at every
sufficiently large even order. Thus this definition agrees with the eventual
constant in Dudek–Schmitt's theorem used in the original conjecture.
-/

namespace HartkeMatchingExcess

open SimpleGraph Finset

theorem perfectMatching_nonempty_of_pos {V : Type*} {G : SimpleGraph V}
    (hp : 0 < perfectMatchingCount G) : Nonempty (PerfectMatching G) :=
  (Nat.card_pos_iff.mp hp).1

theorem graphExcess_le_count (n : ℕ) (G : SimpleGraph (Fin n ⊕ Fin n))
    (hp : 0 < perfectMatchingCount G) :
    graphExcess n G ≤ ((perfectMatchingCount G - 1 : ℕ) : ℤ) := by
  obtain ⟨M⟩ := perfectMatching_nonempty_of_pos hp
  have he := edge_card_le_square_add_matchings n (by simp; omega) M
  have hei : (Nat.card G.edgeSet : ℤ) ≤ (n : ℤ) ^ 2 +
      ((perfectMatchingCount G - 1 : ℕ) : ℤ) := by exact_mod_cast he
  unfold graphExcess
  omega

/-- Excesses of all finite simple graphs with exactly `p` perfect matchings.
Every even vertex count is represented; `Fin n ⊕ Fin n` is only a labeling. -/
def excessValues (p : ℕ) : Set ℤ :=
  {c | ∃ (n : ℕ) (G : SimpleGraph (Fin n ⊕ Fin n)),
    perfectMatchingCount G = p ∧ graphExcess n G = c}

/-- The eventual constant `c_p` in the original conjecture. -/
noncomputable def matchingExcess (p : ℕ) : ℤ := sSup (excessValues p)

theorem excessValues_nonempty (p : ℕ) (hp : 0 < p) : (excessValues p).Nonempty := by
  obtain ⟨n, G, hc, he⟩ := binary_excess_witness (p - 1)
  exact ⟨_, n, G, by omega, he⟩

theorem excessValues_bddAbove (p : ℕ) (hp : 0 < p) : BddAbove (excessValues p) := by
  refine ⟨((p - 1 : ℕ) : ℤ), ?_⟩
  rintro c ⟨n, G, hc, rfl⟩
  simpa only [hc] using graphExcess_le_count n G (by omega)

theorem graphExcess_le_matchingExcess (n p : ℕ) (hp : 0 < p)
    (G : SimpleGraph (Fin n ⊕ Fin n)) (hc : perfectMatchingCount G = p) :
    graphExcess n G ≤ matchingExcess p :=
  le_csSup (excessValues_bddAbove p hp) ⟨n, G, hc, rfl⟩

theorem matchingExcess_attained (p : ℕ) (hp : 0 < p) :
    ∃ (n : ℕ) (G : SimpleGraph (Fin n ⊕ Fin n)),
      perfectMatchingCount G = p ∧ graphExcess n G = matchingExcess p :=
  Int.csSup_mem (excessValues_nonempty p hp) (excessValues_bddAbove p hp)

theorem matchingExcess_le (p : ℕ) (hp : 0 < p) :
    matchingExcess p ≤ ((p - 1 : ℕ) : ℤ) := by
  obtain ⟨n, G, hc, he⟩ := matchingExcess_attained p hp
  rw [← he]
  simpa only [hc] using graphExcess_le_count n G (by omega)

theorem binaryWeight_le_matchingExcess (t : ℕ) :
    (binaryWeight t : ℤ) ≤ matchingExcess (t + 1) := by
  obtain ⟨n, G, hc, he⟩ := binary_excess_witness t
  rw [← he]
  exact graphExcess_le_matchingExcess n (t + 1) (by omega) G hc

theorem deletedWeight_le_matchingExcess (t u : ℕ) (hu : 2 ≤ u) :
    (binaryWeight (t / (2 ^ u - 1)) : ℤ) - 1 ≤ matchingExcess (t + 1) := by
  obtain ⟨n, G, hc, he⟩ := deleted_excess_witness t u hu
  exact he.trans (graphExcess_le_matchingExcess n (t + 1) (by omega) G hc)

theorem matchingExcess_nonneg (p : ℕ) (hp : 0 < p) : 0 ≤ matchingExcess p := by
  have h := binaryWeight_le_matchingExcess (p - 1)
  rw [Nat.sub_add_cancel hp] at h
  exact (Int.natCast_nonneg _).trans h

theorem matchingExcess_eventually_attained (p : ℕ) (hp : 0 < p) :
    ∃ n₀, ∀ n, n₀ ≤ n → ∃ G : SimpleGraph (Fin n ⊕ Fin n),
      perfectMatchingCount G = p ∧ graphExcess n G = matchingExcess p := by
  obtain ⟨n₀, G, hc, he⟩ := matchingExcess_attained p hp
  refine ⟨n₀, fun n hn => ?_⟩
  obtain ⟨H, hp', he'⟩ := extend_witness_to n₀ n hn G
  exact ⟨H, hp'.trans hc, he'.trans he⟩

/-- The largest edge count among graphs on `2*n` vertices with exactly `p`
perfect matchings. It is zero when that set of graphs is empty. -/
noncomputable def extremalEdges (n p : ℕ) : ℕ := by
  classical
  exact univ.sup (fun G : SimpleGraph (Fin n ⊕ Fin n) =>
    if perfectMatchingCount G = p then Nat.card G.edgeSet else 0)

theorem edge_card_le_extremalEdges (n p : ℕ) (G : SimpleGraph (Fin n ⊕ Fin n))
    (hc : perfectMatchingCount G = p) : Nat.card G.edgeSet ≤ extremalEdges n p := by
  classical
  unfold extremalEdges
  have h := Finset.le_sup (f := fun H : SimpleGraph (Fin n ⊕ Fin n) =>
    if perfectMatchingCount H = p then Nat.card H.edgeSet else 0) (mem_univ G)
  simpa only [ite_eq_left hc] using h

theorem extremalEdges_le (n p C : ℕ)
    (h : ∀ G : SimpleGraph (Fin n ⊕ Fin n),
      perfectMatchingCount G = p → Nat.card G.edgeSet ≤ C) : extremalEdges n p ≤ C := by
  classical
  unfold extremalEdges
  apply Finset.sup_le
  intro G _
  split_ifs with hc
  · exact h G hc
  · exact Nat.zero_le _

theorem extremalEdges_eq_of_attained (n p : ℕ) (hp : 0 < p)
    (G : SimpleGraph (Fin n ⊕ Fin n)) (hc : perfectMatchingCount G = p)
    (he : graphExcess n G = matchingExcess p) :
    extremalEdges n p = n ^ 2 + (matchingExcess p).toNat := by
  have hC : ((matchingExcess p).toNat : ℤ) = matchingExcess p :=
    Int.toNat_of_nonneg (matchingExcess_nonneg p hp)
  apply Nat.le_antisymm
  · apply extremalEdges_le
    intro H hH
    have hx := graphExcess_le_matchingExcess n p hp H hH
    unfold graphExcess at hx
    have hi : (Nat.card H.edgeSet : ℤ) ≤ (n : ℤ) ^ 2 +
        ((matchingExcess p).toNat : ℤ) := by omega
    exact_mod_cast hi
  · have hcard : Nat.card G.edgeSet = n ^ 2 + (matchingExcess p).toNat := by
      unfold graphExcess at he
      have hi : (Nat.card G.edgeSet : ℤ) = (n : ℤ) ^ 2 +
          ((matchingExcess p).toNat : ℤ) := by omega
      exact_mod_cast hi
    rw [← hcard]
    exact edge_card_le_extremalEdges n p G hc

/-- The exact eventual formula defining the source's `c_p`; no earlier
extremal theorem is assumed as an axiom or a hypothesis. -/
theorem extremalEdges_eventually (p : ℕ) (hp : 0 < p) :
    ∃ n₀, ∀ n, n₀ ≤ n →
      (extremalEdges n p : ℤ) = (n : ℤ) ^ 2 + matchingExcess p := by
  obtain ⟨n₀, h₀⟩ := matchingExcess_eventually_attained p hp
  refine ⟨n₀, fun n hn => ?_⟩
  obtain ⟨G, hc, he⟩ := h₀ n hn
  rw [extremalEdges_eq_of_attained n p hp G hc he]
  push_cast
  rw [Int.toNat_of_nonneg (matchingExcess_nonneg p hp)]

end HartkeMatchingExcess
