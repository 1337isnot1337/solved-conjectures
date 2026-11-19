module

public import Conjectures.FranklBasic
public import Mathlib.Data.List.GetD
public import Mathlib.Data.List.Nodup

@[expose] public section

/-! Three distinct triples with a common point have five possible incidence
patterns. Removing the common point leaves three distinct two-element sets.
They form a triangle, a three-edge star, a path, a two-edge path plus an edge,
or a matching. This is a classification of literal finite sets. -/

namespace Frankl.Vaughan

variable {α : Type*} [DecidableEq α]

inductive Kind where
  | triangle | star | path | pathEdge | matching
  deriving DecidableEq, Repr

def groundSize : Kind → ℕ
  | .triangle => 4
  | .star => 5
  | .path => 5
  | .pathEdge => 6
  | .matching => 7

def triples : Kind → Finset (Finset ℕ)
  | .triangle => {{0, 1, 2}, {0, 1, 3}, {0, 2, 3}}
  | .star => {{0, 1, 2}, {0, 1, 3}, {0, 1, 4}}
  | .path => {{0, 1, 2}, {0, 2, 3}, {0, 3, 4}}
  | .pathEdge => {{0, 1, 2}, {0, 2, 3}, {0, 4, 5}}
  | .matching => {{0, 1, 2}, {0, 3, 4}, {0, 5, 6}}

def label (p : α) (l : List α) (i : ℕ) : α := l.getD i p

omit [DecidableEq α] in
theorem label_injOn (p : α) {l : List α} (hl : l.Nodup) :
    Set.InjOn (label p l) (Finset.range l.length) := by
  intro i hi j hj hij
  have hi' := Finset.mem_range.mp hi
  have hj' := Finset.mem_range.mp hj
  unfold label at hij
  rw [List.getD_eq_getElem l p hi', List.getD_eq_getElem l p hj'] at hij
  exact hl.eq_of_getElem_eq hi' hj' hij

def Realizes (kind : Kind) (p : α) (D E F : Finset α) : Prop :=
  ∃ f : ℕ → α, Set.InjOn f (Finset.range (groundSize kind)) ∧
    (triples kind).image (Finset.image f) = {insert p D, insert p E, insert p F}

theorem realizes_of_list (kind : Kind) (p : α) (D E F : Finset α) (l : List α)
    (hlen : l.length = groundSize kind) (hl : l.Nodup)
    (himage : (triples kind).image (Finset.image (label p l)) =
      {insert p D, insert p E, insert p F}) : Realizes kind p D E F := by
  refine ⟨label p l, ?_, himage⟩
  simpa only [hlen] using label_injOn p hl

theorem realizes_swap_first {kind : Kind} {p : α} {D E F : Finset α}
    (h : Realizes kind p D E F) : Realizes kind p E D F := by
  simpa only [Realizes, Finset.insert_comm] using h

theorem realizes_swap_last {kind : Kind} {p : α} {D E F : Finset α}
    (h : Realizes kind p D E F) : Realizes kind p D F E := by
  obtain ⟨f, hf, heq⟩ := h
  refine ⟨f, hf, heq.trans ?_⟩
  exact congrArg (fun S : Finset (Finset α) => insert (insert p D) S)
    (Finset.pair_comm (insert p E) (insert p F))

theorem pair_with_member {S : Finset α} {a : α} (hS : S.card = 2) (ha : a ∈ S) :
    ∃ b : α, a ≠ b ∧ S = {a, b} := by
  obtain ⟨x, y, hxy, rfl⟩ := Finset.card_eq_two.mp hS
  have hm : a = x ∨ a = y := by simpa only [Finset.mem_insert, Finset.mem_singleton] using ha
  rcases hm with rfl | rfl
  · exact ⟨y, hxy, rfl⟩
  · exact ⟨x, hxy.symm, Finset.pair_comm x a⟩

theorem pair_eq_of_two_members {S : Finset α} {a b : α}
    (hS : S.card = 2) (hab : a ≠ b) (ha : a ∈ S) (hb : b ∈ S) : S = {a, b} := by
  have hsub : ({a, b} : Finset α) ⊆ S := by
    intro x hx
    simp only [Finset.mem_insert, Finset.mem_singleton] at hx
    rcases hx with rfl | rfl <;> assumption
  have hcard : S.card ≤ ({a, b} : Finset α).card := by
    rw [hS, Finset.card_pair_eq_two_iff.mpr hab]
  exact (Finset.eq_of_subset_of_card_le hsub hcard).symm

theorem disjoint_pairs_iff (a b c d : α) :
    Disjoint ({a, b} : Finset α) {c, d} ↔
      a ≠ c ∧ a ≠ d ∧ b ≠ c ∧ b ≠ d := by
  simp only [Finset.disjoint_insert_left, Finset.disjoint_singleton_left,
    Finset.mem_insert, Finset.mem_singleton, not_or, and_assoc]

theorem realizes_matching {p : α} {D E F : Finset α}
    (hD : D.card = 2) (hE : E.card = 2) (hF : F.card = 2)
    (hpD : p ∉ D) (hpE : p ∉ E) (hpF : p ∉ F)
    (hDE : Disjoint D E) (hDF : Disjoint D F) (hEF : Disjoint E F) :
    Realizes .matching p D E F := by
  obtain ⟨a, b, hab, rfl⟩ := Finset.card_eq_two.mp hD
  obtain ⟨c, d, hcd, rfl⟩ := Finset.card_eq_two.mp hE
  obtain ⟨e, f, hef, rfl⟩ := Finset.card_eq_two.mp hF
  have hDE' := (disjoint_pairs_iff a b c d).mp hDE
  have hDF' := (disjoint_pairs_iff a b e f).mp hDF
  have hEF' := (disjoint_pairs_iff c d e f).mp hEF
  apply realizes_of_list .matching p _ _ _ [p, a, b, c, d, e, f] rfl
  · simp_all
  · simp [triples, label, List.getD]

theorem realizes_path {p : α} {D E F : Finset α}
    (hD : D.card = 2) (hE : E.card = 2) (hF : F.card = 2)
    (hpD : p ∉ D) (hpE : p ∉ E) (hpF : p ∉ F)
    (hDE : Disjoint D E) (hFD : ¬ Disjoint F D) (hFE : ¬ Disjoint F E) :
    Realizes .path p D E F := by
  obtain ⟨b, hbF, hbD⟩ := Finset.not_disjoint_iff.mp hFD
  obtain ⟨c, hcF, hcE⟩ := Finset.not_disjoint_iff.mp hFE
  have hbc : b ≠ c := fun h => Finset.disjoint_left.mp hDE hbD (h.symm ▸ hcE)
  obtain ⟨a, hba, hD'⟩ := pair_with_member hD hbD
  obtain ⟨d, hcd, hE'⟩ := pair_with_member hE hcE
  have hF' := pair_eq_of_two_members hF hbc hbF hcF
  rw [Finset.pair_comm b a] at hD'
  subst D
  subst E
  subst F
  have hDE' := (disjoint_pairs_iff a b c d).mp hDE
  apply realizes_of_list .path p _ _ _ [p, a, b, c, d] rfl
  · simp_all [ne_comm]
  · simp [triples, label, List.getD]
    exact congrArg (fun S : Finset (Finset α) => insert {p, a, b} S)
      (Finset.pair_comm ({p, b, c} : Finset α) {p, c, d})

theorem realizes_pathEdge {p : α} {D E F : Finset α}
    (hD : D.card = 2) (hE : E.card = 2) (hF : F.card = 2)
    (hpD : p ∉ D) (hpE : p ∉ E) (hpF : p ∉ F)
    (hDE : Disjoint D E) (hFE : Disjoint F E) (hDF : ¬ Disjoint D F)
    (hne : D ≠ F) : Realizes .pathEdge p D E F := by
  obtain ⟨b, hbD, hbF⟩ := Finset.not_disjoint_iff.mp hDF
  obtain ⟨a, hba, hD'⟩ := pair_with_member hD hbD
  obtain ⟨c, hbc, hF'⟩ := pair_with_member hF hbF
  obtain ⟨d, e, hde, rfl⟩ := Finset.card_eq_two.mp hE
  have hac : a ≠ c := by
    intro h
    apply hne
    rw [hD', hF', h]
  rw [Finset.pair_comm b a] at hD'
  subst D
  subst F
  have hDE' := (disjoint_pairs_iff a b d e).mp hDE
  have hFE' := (disjoint_pairs_iff b c d e).mp hFE
  apply realizes_of_list .pathEdge p _ _ _ [p, a, b, c, d, e] rfl
  · simp_all [ne_comm]
  · simp [triples, label, List.getD]
    exact congrArg (fun S : Finset (Finset α) => insert {p, a, b} S)
      (Finset.pair_comm ({p, b, c} : Finset α) {p, d, e})

theorem classify_with_disjoint_pair {p : α} {D E F : Finset α}
    (hD : D.card = 2) (hE : E.card = 2) (hF : F.card = 2)
    (hpD : p ∉ D) (hpE : p ∉ E) (hpF : p ∉ F)
    (hDE : Disjoint D E) (hneDF : D ≠ F) (hneEF : E ≠ F) :
    ∃ kind : Kind, Realizes kind p D E F := by
  by_cases hFD : Disjoint F D
  · by_cases hFE : Disjoint F E
    · exact ⟨.matching, realizes_matching hD hE hF hpD hpE hpF hDE hFD.symm hFE.symm⟩
    · have hEF : ¬ Disjoint E F := fun h => hFE h.symm
      exact ⟨.pathEdge, realizes_swap_first
        (realizes_pathEdge hE hD hF hpE hpD hpF hDE.symm hFD hEF hneEF)⟩
  · by_cases hFE : Disjoint F E
    · have hDF : ¬ Disjoint D F := fun h => hFD h.symm
      exact ⟨.pathEdge, realizes_pathEdge hD hE hF hpD hpE hpF hDE hFE hDF hneDF⟩
    · exact ⟨.path, realizes_path hD hE hF hpD hpE hpF hDE hFD hFE⟩

theorem realizes_star {p : α} {D E F : Finset α}
    (hD : D.card = 2) (hE : E.card = 2) (hF : F.card = 2)
    (hpD : p ∉ D) (hpE : p ∉ E) (hpF : p ∉ F)
    (hneDE : D ≠ E) (hneDF : D ≠ F) (hneEF : E ≠ F)
    (hcommon : ∃ a, a ∈ D ∧ a ∈ E ∧ a ∈ F) : Realizes .star p D E F := by
  obtain ⟨a, haD, haE, haF⟩ := hcommon
  obtain ⟨b, hab, hD'⟩ := pair_with_member hD haD
  obtain ⟨c, hac, hE'⟩ := pair_with_member hE haE
  obtain ⟨d, had, hF'⟩ := pair_with_member hF haF
  have hbc : b ≠ c := fun h => hneDE (by rw [hD', hE', h])
  have hbd : b ≠ d := fun h => hneDF (by rw [hD', hF', h])
  have hcd : c ≠ d := fun h => hneEF (by rw [hE', hF', h])
  subst D
  subst E
  subst F
  apply realizes_of_list .star p _ _ _ [p, a, b, c, d] rfl
  · simp_all
  · simp [triples, label, List.getD]

theorem realizes_triangle {p : α} {D E F : Finset α}
    (hD : D.card = 2) (hE : E.card = 2) (hF : F.card = 2)
    (hpD : p ∉ D) (hpE : p ∉ E) (hpF : p ∉ F)
    (hDE : ¬ Disjoint D E) (hDF : ¬ Disjoint D F) (hEF : ¬ Disjoint E F)
    (hcommon : ¬ ∃ a, a ∈ D ∧ a ∈ E ∧ a ∈ F) : Realizes .triangle p D E F := by
  obtain ⟨a, haD, haE⟩ := Finset.not_disjoint_iff.mp hDE
  obtain ⟨b, hbD, hbF⟩ := Finset.not_disjoint_iff.mp hDF
  obtain ⟨c, hcE, hcF⟩ := Finset.not_disjoint_iff.mp hEF
  have hab : a ≠ b := fun h => hcommon ⟨a, haD, haE, h.symm ▸ hbF⟩
  have hac : a ≠ c := fun h => hcommon ⟨a, haD, haE, h.symm ▸ hcF⟩
  have hbc : b ≠ c := fun h => hcommon ⟨b, hbD, h.symm ▸ hcE, hbF⟩
  have hD' := pair_eq_of_two_members hD hab haD hbD
  have hE' := pair_eq_of_two_members hE hac haE hcE
  have hF' := pair_eq_of_two_members hF hbc hbF hcF
  subst D
  subst E
  subst F
  apply realizes_of_list .triangle p _ _ _ [p, a, b, c] rfl
  · simp_all
  · simp [triples, label, List.getD]

/-- Complete classification of three distinct two-element sets. -/
theorem three_edges_classification {p : α} {D E F : Finset α}
    (hD : D.card = 2) (hE : E.card = 2) (hF : F.card = 2)
    (hpD : p ∉ D) (hpE : p ∉ E) (hpF : p ∉ F)
    (hneDE : D ≠ E) (hneDF : D ≠ F) (hneEF : E ≠ F) :
    ∃ kind : Kind, Realizes kind p D E F := by
  by_cases hDE : Disjoint D E
  · exact classify_with_disjoint_pair hD hE hF hpD hpE hpF hDE hneDF hneEF
  by_cases hDF : Disjoint D F
  · obtain ⟨kind, hkind⟩ := classify_with_disjoint_pair hD hF hE hpD hpF hpE
      hDF hneDE hneEF.symm
    exact ⟨kind, realizes_swap_last hkind⟩
  by_cases hEF : Disjoint E F
  · obtain ⟨kind, hkind⟩ := classify_with_disjoint_pair hE hF hD hpE hpF hpD
      hEF hneDE.symm hneDF.symm
    exact ⟨kind, realizes_swap_first (realizes_swap_last hkind)⟩
  by_cases hcommon : ∃ a, a ∈ D ∧ a ∈ E ∧ a ∈ F
  · exact ⟨.star, realizes_star hD hE hF hpD hpE hpF hneDE hneDF hneEF hcommon⟩
  · exact ⟨.triangle, realizes_triangle hD hE hF hpD hpE hpF hDE hDF hEF hcommon⟩

/-- Every three distinct triples with a common point are an injective
relabelling of one of the five finite canonical patterns. -/
theorem three_triples_classification (A B C : Finset α) (p : α)
    (hA : A.card = 3) (hB : B.card = 3) (hC : C.card = 3)
    (hneAB : A ≠ B) (hneAC : A ≠ C) (hneBC : B ≠ C)
    (hpA : p ∈ A) (hpB : p ∈ B) (hpC : p ∈ C) :
    ∃ kind : Kind, ∃ f : ℕ → α, Set.InjOn f (Finset.range (groundSize kind)) ∧
      (triples kind).image (Finset.image f) = {A, B, C} := by
  have hcA : (A.erase p).card = 2 := by rw [Finset.card_erase_of_mem hpA, hA]
  have hcB : (B.erase p).card = 2 := by rw [Finset.card_erase_of_mem hpB, hB]
  have hcC : (C.erase p).card = 2 := by rw [Finset.card_erase_of_mem hpC, hC]
  have heAB : A.erase p ≠ B.erase p := by
    intro h
    exact hneAB (by simpa only [Finset.insert_erase hpA, Finset.insert_erase hpB] using
      (congrArg (fun S : Finset α => insert p S) h))
  have heAC : A.erase p ≠ C.erase p := by
    intro h
    exact hneAC (by simpa only [Finset.insert_erase hpA, Finset.insert_erase hpC] using
      (congrArg (fun S : Finset α => insert p S) h))
  have heBC : B.erase p ≠ C.erase p := by
    intro h
    exact hneBC (by simpa only [Finset.insert_erase hpB, Finset.insert_erase hpC] using
      (congrArg (fun S : Finset α => insert p S) h))
  obtain ⟨kind, f, hf, heq⟩ := three_edges_classification hcA hcB hcC
    (Finset.notMem_erase p A) (Finset.notMem_erase p B) (Finset.notMem_erase p C)
    heAB heAC heBC
  refine ⟨kind, f, hf, ?_⟩
  simpa only [Finset.insert_erase hpA, Finset.insert_erase hpB,
    Finset.insert_erase hpC] using heq

end Frankl.Vaughan
