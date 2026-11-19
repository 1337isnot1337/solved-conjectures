import Mathlib.Combinatorics.SimpleGraph.Finite
import Mathlib.Combinatorics.SimpleGraph.Connectivity.Connected

/-! Structural part of Graffiti.pc Conjecture 318.

Result and proof credited to @JesterInABarrel, as recorded in
`results/graffiti-pc-318/PROOF.md`. The argument below formalizes the
contributed proof using uniqueness of a nonneighbor instead of explicit
multipartite parts.
-/

namespace Graffiti318

open SimpleGraph

variable {V : Type*}

/-- Every vertex, including a selected vertex, has a neighbor in the set. -/
def TotalDominating (G : SimpleGraph V) (D : Finset V) : Prop :=
  ∀ x : V, ∃ y ∈ D, G.Adj x y

/-- Minimality is with respect to inclusion. -/
def MinimalTotalDominating (G : SimpleGraph V) (D : Finset V) : Prop :=
  TotalDominating G D ∧ ∀ E : Finset V, E ⊆ D → TotalDominating G E → E = D

/-- Minimum cardinality among all total dominating sets. -/
def MinimumTotalDominating (G : SimpleGraph V) (D : Finset V) : Prop :=
  TotalDominating G D ∧ ∀ E : Finset V, TotalDominating G E → D.card ≤ E.card

def WellTotalDominated (G : SimpleGraph V) : Prop :=
  ∀ D : Finset V, MinimalTotalDominating G D → MinimumTotalDominating G D

/-- Away from the distinguished vertex, each vertex has at most one
distinct nonneighbor. At most one missing edge is sufficient for this. -/
def UniqueNonneighborAway (G : SimpleGraph V) (v : V) : Prop :=
  ∀ ⦃a b c : V⦄, a ≠ v → b ≠ v → c ≠ v → a ≠ b → a ≠ c →
    ¬ G.Adj a b → ¬ G.Adj a c → b = c

section

variable [DecidableEq V] (G : SimpleGraph V)

theorem pair_subset_of_mem {a b : V} {D : Finset V} (ha : a ∈ D) (hb : b ∈ D) :
    ({a,b} : Finset V) ⊆ D := by
  intro x hx
  rcases Finset.mem_insert.mp hx with h | h
  · exact h ▸ ha
  · exact (Finset.mem_singleton.mp h) ▸ hb

/-- Every total dominating set contains an adjacent total dominating pair
under the structural condition used in the contributed proof. -/
theorem totalDominating_contains_pair (v : V) (hunique : UniqueNonneighborAway G v)
    (D : Finset V) (hD : TotalDominating G D) :
    ∃ a b : V, a ∈ D ∧ b ∈ D ∧ G.Adj a b ∧ TotalDominating G {a,b} := by
  classical
  obtain ⟨a,ha,hva⟩ := hD v
  have hav : a ≠ v := hva.ne.symm
  by_cases hother : ∃ b ∈ D, b ≠ v ∧ G.Adj a b
  · obtain ⟨b,hb,hbv,hab⟩ := hother
    refine ⟨a,b,ha,hb,hab,?_⟩
    intro x
    by_cases hxv : x = v
    · subst x
      exact ⟨a,by simp,hva⟩
    by_cases hxa : G.Adj x a
    · exact ⟨a,by simp,hxa⟩
    by_cases hxeqa : x = a
    · subst x
      exact ⟨b,by simp,hab⟩
    have hxeqb : x ≠ b := by
      intro h
      subst x
      exact hxa hab.symm
    have hxb : G.Adj x b := by
      by_contra hxb
      exact hab.ne (hunique hxv hav hbv hxeqa hxeqb hxa hxb)
    exact ⟨b,by simp,hxb⟩
  · obtain ⟨b,hb,hab⟩ := hD a
    have hbv : b = v := by
      by_contra hbv
      exact hother ⟨b,hb,hbv,hab⟩
    subst b
    refine ⟨a,v,ha,hb,hab,?_⟩
    intro x
    by_cases hxa : G.Adj x a
    · exact ⟨a,by simp,hxa⟩
    by_cases hxeqa : x = a
    · subst x
      exact ⟨v,by simp,hab⟩
    have hxv : x ≠ v := by
      intro h
      subst x
      exact hxa hva
    obtain ⟨c,hc,hxc⟩ := hD x
    have hcv : c = v := by
      by_contra hcv
      have hnac : ¬ G.Adj a c := fun hac => hother ⟨c,hc,hcv,hac⟩
      have hneqac : a ≠ c := by
        intro h
        subst c
        exact hxa hxc
      have hnax : ¬ G.Adj a x := fun hax => hxa hax.symm
      exact hxc.ne (hunique hav hxv hcv (Ne.symm hxeqa) hneqac hnax hnac)
    subst c
    exact ⟨v,by simp,hxc⟩

/-- Two vertices are necessary even without finiteness of the ambient graph. -/
theorem totalDominating_card_ge_two (v : V) {D : Finset V}
    (hD : TotalDominating G D) : 2 ≤ D.card := by
  obtain ⟨a,ha,_hva⟩ := hD v
  obtain ⟨b,hb,hab⟩ := hD a
  have hcard : ({a,b} : Finset V).card = 2 := by simp [hab.ne]
  rw [← hcard]
  exact Finset.card_le_card (pair_subset_of_mem ha hb)

theorem minimalTotalDominating_card_eq_two (v : V)
    (hunique : UniqueNonneighborAway G v) {D : Finset V}
    (hD : MinimalTotalDominating G D) : D.card = 2 := by
  obtain ⟨a,b,ha,hb,hab,hpair⟩ := totalDominating_contains_pair G v hunique D hD.1
  have heq : ({a,b} : Finset V) = D := hD.2 _ (pair_subset_of_mem ha hb) hpair
  rw [← heq]
  simp [hab.ne]

theorem wellTotalDominated_of_uniqueNonneighborAway (v : V)
    (hunique : UniqueNonneighborAway G v) : WellTotalDominated G := by
  intro D hD
  refine ⟨hD.1,?_⟩
  intro E hE
  rw [minimalTotalDominating_card_eq_two G v hunique hD]
  exact totalDominating_card_ge_two G v hE

end

end Graffiti318
