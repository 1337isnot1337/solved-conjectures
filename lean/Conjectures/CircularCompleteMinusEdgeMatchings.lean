import Conjectures.CircularCompleteMinusEdgeAcyclic
import Mathlib.Combinatorics.Hall.Basic
import Mathlib.Algebra.BigOperators.Group.Finset.Basic

/-!
# Endpoints and expansion of edge matchings

These are the endpoint-counting inequalities E1 and E2 in Step 3 of the
accepted complete-minus-one-edge proof. A matching whose covered vertices
miss at most one vertex of the next matching has a transversal into that
matching by incident edges.
-/

namespace CircularCompleteMinusEdge

open CircularIndex

variable {V : Type*} [DecidableEq V] {G : SimpleGraph V}

def IsEdgeMatching (M : Finset G.edgeSet) : Prop :=
  ∀ e ∈ M, ∀ f ∈ M, Incident e f → e = f

omit [DecidableEq V] in
theorem IsEdgeMatching.mono {M N : Finset G.edgeSet} (hM : IsEdgeMatching M)
    (hNM : N ⊆ M) : IsEdgeMatching N :=
  fun e he f hf => hM e (hNM he) f (hNM hf)

noncomputable def covered (M : Finset G.edgeSet) : Finset V := by
  classical
  exact M.biUnion (fun e => e.val.toFinset)

@[simp] theorem mem_covered {M : Finset G.edgeSet} {v : V} :
    v ∈ covered M ↔ ∃ e ∈ M, v ∈ e.val := by
  classical
  simp [covered]

theorem covered_mono {M N : Finset G.edgeSet} (hMN : M ⊆ N) : covered M ⊆ covered N := by
  intro v hv
  obtain ⟨e, he, hv⟩ := mem_covered.mp hv
  exact mem_covered.mpr ⟨e, hMN he, hv⟩

theorem covered_card_le (M : Finset G.edgeSet) : (covered M).card ≤ 2 * M.card := by
  classical
  have hc (e : G.edgeSet) : e.val.toFinset.card = 2 :=
    Sym2.card_toFinset_of_not_isDiag e.val (G.not_isDiag_of_mem_edgeSet e.property)
  calc
    (covered M).card ≤ ∑ e ∈ M, e.val.toFinset.card := Finset.card_biUnion_le
    _ = 2 * M.card := by
      simp only [hc, Finset.sum_const, smul_eq_mul]
      omega

theorem covered_card {M : Finset G.edgeSet} (hM : IsEdgeMatching M) :
    (covered M).card = 2 * M.card := by
  classical
  have hc (e : G.edgeSet) : e.val.toFinset.card = 2 :=
    Sym2.card_toFinset_of_not_isDiag e.val (G.not_isDiag_of_mem_edgeSet e.property)
  have hdis : (M : Set G.edgeSet).PairwiseDisjoint (fun e => e.val.toFinset) := by
    intro e he f hf hef
    apply Finset.disjoint_left.mpr
    intro v hve hvf
    exact hef (hM e he f hf ⟨v, by simpa using hve, by simpa using hvf⟩)
  rw [covered, Finset.card_biUnion hdis]
  simp only [hc, Finset.sum_const, smul_eq_mul]
  omega

noncomputable def neighbors (M N : Finset G.edgeSet) : Finset G.edgeSet := by
  classical
  exact N.filter (fun f => ∃ e ∈ M, Incident e f)

omit [DecidableEq V] in
@[simp] theorem mem_neighbors {M N : Finset G.edgeSet} {f : G.edgeSet} :
    f ∈ neighbors M N ↔ f ∈ N ∧ ∃ e ∈ M, Incident e f := by
  classical
  simp [neighbors]

theorem covered_subset_missing_union_neighbors (M N : Finset G.edgeSet) :
    covered M ⊆ (covered M \ covered N) ∪ covered (neighbors M N) := by
  classical
  intro v hv
  by_cases hvN : v ∈ covered N
  · apply Finset.mem_union_right
    obtain ⟨e, he, hve⟩ := mem_covered.mp hv
    obtain ⟨f, hf, hvf⟩ := mem_covered.mp hvN
    exact mem_covered.mpr ⟨f, mem_neighbors.mpr ⟨hf, e, he, v, hve, hvf⟩, hvf⟩
  · exact Finset.mem_union_left _ (Finset.mem_sdiff.mpr ⟨hv, hvN⟩)

theorem matching_expansion {M N : Finset G.edgeSet} (hM : IsEdgeMatching M)
    (hmiss : (covered M \ covered N).card ≤ 1) : M.card ≤ (neighbors M N).card := by
  classical
  have hc := Finset.card_le_card (covered_subset_missing_union_neighbors M N)
  have hu := Finset.card_union_le (covered M \ covered N) (covered (neighbors M N))
  have hn := covered_card_le (neighbors M N)
  rw [covered_card hM] at hc
  omega

theorem matching_transversal {M N : Finset G.edgeSet} (hM : IsEdgeMatching M)
    (hmiss : (covered M \ covered N).card ≤ 1) :
    ∃ f : {e // e ∈ M} → {e // e ∈ N},
      Function.Injective f ∧ ∀ e, Incident e.val (f e).val := by
  classical
  let t : {e // e ∈ M} → Finset G.edgeSet := fun e => N.filter (Incident e.val)
  have hHall (A : Finset {e // e ∈ M}) : A.card ≤ (A.biUnion t).card := by
    let S : Finset G.edgeSet := A.image Subtype.val
    have hSM : S ⊆ M := by
      intro e he
      obtain ⟨a, _, rfl⟩ := Finset.mem_image.mp he
      exact a.property
    have hS : IsEdgeMatching S := hM.mono hSM
    have hm : (covered S \ covered N).card ≤ 1 := by
      apply (Finset.card_le_card ?_).trans hmiss
      intro v hv
      exact Finset.mem_sdiff.mpr ⟨covered_mono hSM (Finset.mem_sdiff.mp hv).1,
        (Finset.mem_sdiff.mp hv).2⟩
    have hA : A.card = S.card := (Finset.card_image_of_injective A Subtype.val_injective).symm
    have heq : A.biUnion t = neighbors S N := by
      ext f
      simp only [Finset.mem_biUnion, t, Finset.mem_filter, mem_neighbors, S,
        Finset.mem_image]
      constructor
      · rintro ⟨a, ha, hf, hinc⟩
        exact ⟨hf, a.val, ⟨a, ha, rfl⟩, hinc⟩
      · rintro ⟨hf, e, ⟨a, ha, rfl⟩, hinc⟩
        exact ⟨a, ha, hf, hinc⟩
    rw [hA, heq]
    exact matching_expansion hS hm
  obtain ⟨f, hf, hft⟩ := (Finset.all_card_le_biUnion_card_iff_exists_injective t).mp hHall
  refine ⟨fun e => ⟨f e, (Finset.mem_filter.mp (hft e)).1⟩, ?_, ?_⟩
  · intro e g h
    exact hf (congrArg Subtype.val h)
  · intro e
    exact (Finset.mem_filter.mp (hft e)).2

end CircularCompleteMinusEdge
