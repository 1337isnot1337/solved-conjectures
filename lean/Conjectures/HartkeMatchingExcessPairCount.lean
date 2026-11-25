import Conjectures.HartkeMatchingExcessSwitchCount
import Mathlib.Combinatorics.SimpleGraph.DegreeSum
import Mathlib.Tactic

/-!
# Hartke–Stolee–West–Yancey's matching-excess conjecture

Counting ordered nonmatching pairs and their mate images. The intersection
counts precisely the alternating switches, while the degree-sum identity
relates the selected pairs to the genuine graph edge count.
-/

namespace HartkeMatchingExcess

open SimpleGraph Finset

variable {V : Type*} [Fintype V] [DecidableEq V] {G : SimpleGraph V}

noncomputable def relationFinset (P : V → V → Prop) : Finset (V × V) := by
  classical
  exact univ.filter (fun p => P p.1 p.2)

omit [DecidableEq V] in
theorem mem_relationFinset (P : V → V → Prop) (p : V × V) :
    p ∈ relationFinset P ↔ P p.1 p.2 := by
  classical
  simp [relationFinset]

omit [DecidableEq V] in
theorem relationFinset_card (P : V → V → Prop) :
    (relationFinset P).card = ∑ v : V, Nat.card {w // P v w} := by
  classical
  calc
    (relationFinset P).card = Nat.card {p : V × V // P p.1 p.2} := by
      rw [Nat.card_eq_fintype_card, Fintype.card_subtype]
      rfl
    _ = Nat.card (Σ v : V, {w // P v w}) :=
      Nat.card_congr (Equiv.subtypeProdEquivSigmaSubtype P)
    _ = ∑ v : V, Nat.card {w // P v w} := Nat.card_sigma

noncomputable def freePairs (M : PerfectMatching G) : Finset (V × V) :=
  relationFinset (fun v w => w ≠ v ∧ w ≠ mate M v)

noncomputable def selectedPairs (M : PerfectMatching G) : Finset (V × V) :=
  relationFinset (fun v w => G.Adj v w ∧ w ≠ mate M v)

noncomputable def flipPair (M : PerfectMatching G) : Equiv.Perm (V × V) :=
  (matePerm M).prodCongr (matePerm M)

omit [Fintype V] [DecidableEq V] in
theorem flipPair_involutive (M : PerfectMatching G) : Function.Involutive (flipPair M) := by
  rintro ⟨x,y⟩
  exact Prod.ext (mate_involutive M x) (mate_involutive M y)

omit [Fintype V] [DecidableEq V] in
theorem flipPair_avoids_mate (M : PerfectMatching G) (p : V × V) :
    (flipPair M p).2 ≠ mate M (flipPair M p).1 ↔ p.2 ≠ mate M p.1 := by
  change mate M p.2 ≠ mate M (mate M p.1) ↔ _
  rw [mate_involutive M p.1]
  exact not_congr (mate_eq_iff M)

theorem freePairs_card (M : PerfectMatching G) :
    (freePairs M).card = Fintype.card V * (Fintype.card V - 2) := by
  classical
  rw [freePairs, relationFinset_card]
  have hc (v : V) : Nat.card {w // w ≠ v ∧ w ≠ mate M v} = Fintype.card V - 2 := by
    let e : {w // w ≠ v ∧ w ≠ mate M v} ≃ {w // ¬(w = v ∨ w = mate M v)} :=
      Equiv.subtypeEquivRight (fun _ => not_or.symm)
    rw [Nat.card_congr e, Nat.card_eq_fintype_card, Fintype.card_subtype_compl,
      Fintype.card_subtype_eq_or_eq_of_ne (Ne.symm (mate_ne M v))]
  simp only [hc, sum_const, card_univ, smul_eq_mul]

theorem selectedPairs_card_add_vertices (M : PerfectMatching G) :
    (selectedPairs M).card + Fintype.card V = 2 * Nat.card G.edgeSet := by
  classical
  have hrow (v : V) : Nat.card {w // G.Adj v w ∧ w ≠ mate M v} + 1 = G.degree v := by
    have he : univ.filter (fun w => G.Adj v w ∧ w ≠ mate M v) =
        (G.neighborFinset v).erase (mate M v) := by
      ext w
      simp [and_comm]
    rw [Nat.card_eq_fintype_card, Fintype.card_subtype, he]
    exact card_erase_add_one (by simpa using mate_graph_adj M v)
  calc
    (selectedPairs M).card + Fintype.card V =
        (∑ v : V, Nat.card {w // G.Adj v w ∧ w ≠ mate M v}) + ∑ _v : V, 1 := by
      rw [selectedPairs, relationFinset_card]
      simp
    _ = ∑ v : V, (Nat.card {w // G.Adj v w ∧ w ≠ mate M v} + 1) :=
      (sum_add_distrib).symm
    _ = ∑ v : V, G.degree v := sum_congr rfl (fun v _ => hrow v)
    _ = 2 * Nat.card G.edgeSet := by
      simpa only [edgeFinset_card, ← Nat.card_eq_fintype_card] using
        G.sum_degrees_eq_twice_card_edges

omit [DecidableEq V] in
theorem selectedPairs_subset (M : PerfectMatching G) : selectedPairs M ⊆ freePairs M := by
  intro p hp
  obtain ⟨ha, hn⟩ := (mem_relationFinset _ p).mp hp
  exact (mem_relationFinset _ p).mpr ⟨Ne.symm ha.ne, hn⟩

omit [DecidableEq V] in
theorem flip_selectedPairs_subset (M : PerfectMatching G) :
    (selectedPairs M).map (flipPair M).toEmbedding ⊆ freePairs M := by
  intro p hp
  obtain ⟨q, hq, rfl⟩ := mem_map.mp hp
  obtain ⟨ha, hn⟩ := (mem_relationFinset _ q).mp hq
  apply (mem_relationFinset _ _).mpr
  refine ⟨?_, (flipPair_avoids_mate M q).mpr hn⟩
  intro he
  exact ha.ne (mate_injective M he).symm

omit [DecidableEq V] in
theorem mem_flip_selectedPairs (M : PerfectMatching G) (p : V × V) :
    p ∈ (selectedPairs M).map (flipPair M).toEmbedding ↔
      G.Adj (mate M p.1) (mate M p.2) ∧ p.2 ≠ mate M p.1 := by
  constructor
  · intro hp
    obtain ⟨q, hq, rfl⟩ := mem_map.mp hp
    obtain ⟨ha, hn⟩ := (mem_relationFinset _ q).mp hq
    refine ⟨?_, (flipPair_avoids_mate M q).mpr hn⟩
    change G.Adj (mate M (mate M q.1)) (mate M (mate M q.2))
    rwa [mate_involutive, mate_involutive]
  · rintro ⟨ha, hn⟩
    refine mem_map.mpr ⟨flipPair M p, ?_, flipPair_involutive M p⟩
    exact (mem_relationFinset _ _).mpr ⟨ha, (flipPair_avoids_mate M p).mpr hn⟩

theorem selectedPairs_inter_card (M : PerfectMatching G) :
    ((selectedPairs M) ∩ (selectedPairs M).map (flipPair M).toEmbedding).card =
      Nat.card (BothPairs M) := by
  classical
  let S := (selectedPairs M) ∩ (selectedPairs M).map (flipPair M).toEmbedding
  have hm (p : V × V) : p ∈ S ↔
      G.Adj p.1 p.2 ∧ G.Adj (mate M p.1) (mate M p.2) ∧ p.2 ≠ mate M p.1 := by
    dsimp only [S]
    rw [mem_inter, mem_flip_selectedPairs M p]
    simp only [selectedPairs, mem_relationFinset]
    tauto
  let e : S ≃ BothPairs M := Equiv.subtypeEquivRight hm
  calc
    S.card = Nat.card S := by simp
    _ = Nat.card (BothPairs M) := Nat.card_congr e

theorem selectedPairs_double_le (M : PerfectMatching G) :
    2 * (selectedPairs M).card ≤ (freePairs M).card + Nat.card (BothPairs M) := by
  classical
  have hc := card_union_add_card_inter (selectedPairs M)
    ((selectedPairs M).map (flipPair M).toEmbedding)
  rw [card_map, selectedPairs_inter_card] at hc
  have hs : selectedPairs M ∪ (selectedPairs M).map (flipPair M).toEmbedding ⊆
      freePairs M := union_subset (selectedPairs_subset M) (flip_selectedPairs_subset M)
  have hb := card_le_card hs
  omega

theorem edge_card_le_square_add_matchings (n : ℕ) (hV : Fintype.card V = 2 * n)
    (M : PerfectMatching G) :
    Nat.card G.edgeSet ≤ n ^ 2 + (perfectMatchingCount G - 1) := by
  have hA := selectedPairs_card_add_vertices M
  have hB := bothPairs_card_le M
  have hU := selectedPairs_double_le M
  rw [freePairs_card, hV] at hU
  rw [hV] at hA
  have hp : (2 * n) * (2 * n - 2) + 4 * n = 4 * n ^ 2 := by
    by_cases hn : n = 0
    · simp [hn]
    · have hs : 2 * n - 2 + 2 = 2 * n := by omega
      nlinarith
  nlinarith

end HartkeMatchingExcess
