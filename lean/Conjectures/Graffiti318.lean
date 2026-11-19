import Conjectures.Graffiti318Basic
import Mathlib.Combinatorics.SimpleGraph.Metric
import Mathlib.Combinatorics.SimpleGraph.DeleteEdges
import Mathlib.Data.Finset.Lattice.Fold
import Mathlib.Data.Fintype.EquivFin
import Mathlib.Order.Lattice.Nat

/-! All-order proof of Graffiti.pc Conjecture 318, including the stronger
total-domination-pair statement and total domination number two.

Result and proof credited to @JesterInABarrel. Source:
`results/graffiti-pc-318/PROOF.md`.
-/

namespace Graffiti318

open SimpleGraph

variable {V : Type*} [Fintype V] [DecidableEq V]
variable (G : SimpleGraph V) [DecidableRel G.Adj]

/-- Number of edges of the simple complement. Loops are not counted. -/
def missingEdgeCount : ℕ := Gᶜ.edgeFinset.card

/-- The vertex itself is included, because its distance is zero. -/
noncomputable def evenDistanceCount (v : V) : ℕ :=
  (Finset.univ.filter (fun w : V => Even (G.dist v w))).card

noncomputable def maxEvenDistanceCount : ℕ :=
  Finset.univ.sup (evenDistanceCount G)

/-- The minimum size of a total dominating set. The theorems below establish
existence before identifying this infimum. -/
noncomputable def totalDominationNumber : ℕ :=
  sInf {n : ℕ | ∃ D : Finset V, TotalDominating G D ∧ D.card = n}

theorem evenDistanceCount_le_complement_degree_add_one (v : V) :
    evenDistanceCount G v ≤ Gᶜ.degree v + 1 := by
  have hsub : Finset.univ.filter (fun w : V => Even (G.dist v w)) ⊆
      insert v (Gᶜ.neighborFinset v) := by
    intro w hw
    have heven := (Finset.mem_filter.mp hw).2
    by_cases hwv : w = v
    · exact Finset.mem_insert.mpr (Or.inl hwv)
    · apply Finset.mem_insert.mpr
      right
      rw [SimpleGraph.mem_neighborFinset, SimpleGraph.compl_adj]
      refine ⟨Ne.symm hwv,?_⟩
      intro hadj
      have hd : G.dist v w = 1 := SimpleGraph.dist_eq_one_iff_adj.mpr hadj
      have hbad : Even (1 : ℕ) := hd ▸ heven
      exact (by decide : ¬ Even (1 : ℕ)) hbad
  calc
    evenDistanceCount G v ≤ (insert v (Gᶜ.neighborFinset v)).card :=
      Finset.card_le_card hsub
    _ = Gᶜ.degree v + 1 := by simp [SimpleGraph.card_neighborFinset_eq_degree]

theorem remaining_missing_edges_le_one (v : V)
    (hbound : missingEdgeCount G ≤ evenDistanceCount G v) :
    (Gᶜ.deleteIncidenceSet v).edgeFinset.card ≤ 1 := by
  have h := hbound.trans (evenDistanceCount_le_complement_degree_add_one G v)
  change Gᶜ.edgeFinset.card ≤ Gᶜ.degree v + 1 at h
  rw [SimpleGraph.card_edgeFinset_deleteIncidenceSet]
  omega

theorem uniqueNonneighborAway_of_remaining_missing_edges (v : V)
    (hcard : (Gᶜ.deleteIncidenceSet v).edgeFinset.card ≤ 1) :
    UniqueNonneighborAway G v := by
  intro a b c hav hbv hcv hab hac hnab hnac
  have habmem : s(a,b) ∈ (Gᶜ.deleteIncidenceSet v).edgeFinset := by
    rw [SimpleGraph.mem_edgeFinset, SimpleGraph.mem_edgeSet,
      SimpleGraph.deleteIncidenceSet_adj, SimpleGraph.compl_adj]
    exact ⟨⟨hab,hnab⟩,hav,hbv⟩
  have hacmem : s(a,c) ∈ (Gᶜ.deleteIncidenceSet v).edgeFinset := by
    rw [SimpleGraph.mem_edgeFinset, SimpleGraph.mem_edgeSet,
      SimpleGraph.deleteIncidenceSet_adj, SimpleGraph.compl_adj]
    exact ⟨⟨hac,hnac⟩,hav,hcv⟩
  have heq := Finset.card_le_one.mp hcard _ habmem _ hacmem
  rcases Sym2.eq_iff.mp heq with h | h
  · exact h.2
  · exact False.elim (hac h.1)

theorem uniqueNonneighborAway_of_even_distance_bound (v : V)
    (hbound : missingEdgeCount G ≤ evenDistanceCount G v) :
    UniqueNonneighborAway G v :=
  uniqueNonneighborAway_of_remaining_missing_edges G v
    (remaining_missing_edges_le_one G v hbound)

theorem exists_uniqueNonneighborAway [Nonempty V]
    (hbound : missingEdgeCount G ≤ maxEvenDistanceCount G) :
    ∃ v : V, UniqueNonneighborAway G v := by
  obtain ⟨v,_hv,heq⟩ := Finset.exists_mem_eq_sup (Finset.univ : Finset V)
    Finset.univ_nonempty (evenDistanceCount G)
  refine ⟨v,uniqueNonneighborAway_of_even_distance_bound G v ?_⟩
  change missingEdgeCount G ≤ Finset.univ.sup (evenDistanceCount G) at hbound
  rwa [heq] at hbound

omit [Fintype V] [DecidableRel G.Adj] in
theorem totalDominationNumber_eq_two_of_pair (v a b : V) (hab : G.Adj a b)
    (hpair : TotalDominating G {a,b}) : totalDominationNumber G = 2 := by
  let S : Set ℕ := {n | ∃ D : Finset V, TotalDominating G D ∧ D.card = n}
  have htwo : 2 ∈ S := ⟨{a,b},hpair,by simp [hab.ne]⟩
  change sInf S = 2
  apply le_antisymm (Nat.sInf_le htwo)
  obtain ⟨D,hD,hcard⟩ := Nat.sInf_mem (show S.Nonempty from ⟨2,htwo⟩)
  rw [← hcard]
  exact totalDominating_card_ge_two G v hD

/-- The full conjecture and its stated strengthening, for every finite
simple connected graph of order at least two. -/
theorem conjecture318 (hconnected : G.Connected) (horder : 2 ≤ Fintype.card V)
    (hbound : missingEdgeCount G ≤ maxEvenDistanceCount G) :
    (∀ D : Finset V, TotalDominating G D →
      ∃ a b : V, a ∈ D ∧ b ∈ D ∧ G.Adj a b ∧ TotalDominating G {a,b}) ∧
    (∀ D : Finset V, MinimalTotalDominating G D → D.card = 2) ∧
    WellTotalDominated G ∧ totalDominationNumber G = 2 := by
  let : Nontrivial V := Fintype.one_lt_card_iff_nontrivial.mp (by omega)
  obtain ⟨v,hunique⟩ := exists_uniqueNonneighborAway G hbound
  have hfull : TotalDominating G Finset.univ := by
    intro x
    obtain ⟨y,hxy⟩ := hconnected.preconnected.exists_adj_of_nontrivial x
    exact ⟨y,Finset.mem_univ _,hxy⟩
  obtain ⟨a,b,_ha,_hb,hab,hpair⟩ := totalDominating_contains_pair G v hunique _ hfull
  exact ⟨totalDominating_contains_pair G v hunique,
    fun D hD => minimalTotalDominating_card_eq_two G v hunique hD,
    wellTotalDominated_of_uniqueNonneighborAway G v hunique,
    totalDominationNumber_eq_two_of_pair G v a b hab hpair⟩

end Graffiti318
