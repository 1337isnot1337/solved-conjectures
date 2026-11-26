import Conjectures.CircularCompleteMinusEdgeLevels
import Mathlib.Data.Fintype.EquivFin
import Mathlib.Order.WellFounded

/-!
# Acyclic transversals form one spanning directed path

This implements a finite Hall reformulation of Step 3 of the recorded proof.
The chosen arcs have one outgoing edge except at the sink and one incoming
edge except at the source. Well-foundedness excludes a separate cycle. The
resulting order also respects every arc of the original relation.
-/

namespace CircularCompleteMinusEdge

structure PathMatching {α : Type*} (R : α → α → Prop) where
  source : α
  sink : α
  next : {a // a ≠ sink} ≃ {a // a ≠ source}
  follows : ∀ a, R a.val (next a).val

namespace PathMatching

variable {α : Type*} {R : α → α → Prop} (D : PathMatching R)

def Selected (a b : α) : Prop := ∃ ha : a ≠ D.sink, (D.next ⟨a, ha⟩).val = b

theorem selected_sub {a b : α} (h : D.Selected a b) : R a b := by
  obtain ⟨ha, h⟩ := h
  rw [← h]
  exact D.follows ⟨a, ha⟩

theorem selected_out_unique {a b c : α} (hb : D.Selected a b)
    (hc : D.Selected a c) : b = c := by
  obtain ⟨ha, hb⟩ := hb
  obtain ⟨ha', hc⟩ := hc
  exact hb.symm.trans hc

theorem selected_in_unique {a b c : α} (ha : D.Selected a c)
    (hb : D.Selected b c) : a = b := by
  obtain ⟨ha', ha⟩ := ha
  obtain ⟨hb', hb⟩ := hb
  exact congrArg Subtype.val (D.next.injective (Subtype.ext (ha.trans hb.symm)))

theorem selected_source_iff (a : α) : (∀ b, ¬ D.Selected b a) ↔ a = D.source := by
  constructor
  · intro hs
    by_contra ha
    let b := D.next.symm ⟨a, ha⟩
    apply hs b.val
    refine ⟨b.property, ?_⟩
    exact congrArg Subtype.val (D.next.apply_symm_apply ⟨a, ha⟩)
  · rintro rfl b ⟨hb, heq⟩
    exact (D.next ⟨b, hb⟩).property heq

theorem selected_wellFounded (hwf : WellFounded R) : WellFounded D.Selected :=
  Subrelation.wf (fun {_ _} h => D.selected_sub h) hwf

section Finite

variable [Fintype α] (hwf : WellFounded R)

noncomputable def level (a : α) : ℕ := by
  classical
  exact longestLevel D.Selected (D.selected_wellFounded hwf) a

theorem level_zero_iff (a : α) : D.level hwf a = 0 ↔ a = D.source := by
  classical
  exact (longestLevel_zero_iff D.Selected (D.selected_wellFounded hwf) a).trans
    (D.selected_source_iff a)

theorem level_predecessor {a : α} (ha : 0 < D.level hwf a) :
    ∃ b, D.Selected b a ∧ D.level hwf a = D.level hwf b + 1 := by
  classical
  exact longestLevel_predecessor D.Selected (D.selected_wellFounded hwf) ha

theorem level_lt_of_selected {a b : α} (hab : D.Selected a b) :
    D.level hwf a < D.level hwf b := by
  classical
  exact longestLevel_lt D.Selected (D.selected_wellFounded hwf) hab

theorem level_injective : Function.Injective (D.level hwf) := by
  have haux : ∀ k : ℕ, ∀ a b : α,
      D.level hwf a = k → D.level hwf b = k → a = b := by
    intro k
    induction k using Nat.strong_induction_on with
    | h k ih =>
      intro a b ha hb
      by_cases hk : k = 0
      · exact ((D.level_zero_iff hwf a).mp (ha.trans hk)).trans
          ((D.level_zero_iff hwf b).mp (hb.trans hk)).symm
      · obtain ⟨x, hxa, hxa'⟩ := D.level_predecessor hwf (by omega : 0 < D.level hwf a)
        obtain ⟨y, hyb, hyb'⟩ := D.level_predecessor hwf (by omega : 0 < D.level hwf b)
        have hxy : x = y := ih (D.level hwf x) (by omega) x y rfl (by omega)
        subst y
        exact D.selected_out_unique hxa hyb
  intro a b hab
  exact haux (D.level hwf a) a b rfl hab.symm

theorem level_lt_card (a : α) : D.level hwf a < Fintype.card α := by
  classical
  exact longestLevel_lt_card D.Selected (D.selected_wellFounded hwf) a

noncomputable def orderEquiv : α ≃ Fin (Fintype.card α) := by
  let f : α → Fin (Fintype.card α) := fun a => ⟨D.level hwf a, D.level_lt_card hwf a⟩
  apply Equiv.ofBijective f
  apply (Fintype.bijective_iff_injective_and_card f).mpr
  refine ⟨?_, by simp⟩
  intro a b h
  exact D.level_injective hwf (congrArg Fin.val h)

@[simp] theorem orderEquiv_val (a : α) : (D.orderEquiv hwf a).val = D.level hwf a := rfl

theorem relation_of_levels_consecutive {a b : α}
    (hab : D.level hwf b = D.level hwf a + 1) : R a b := by
  obtain ⟨x, hxb, hlevel⟩ := D.level_predecessor hwf (by omega : 0 < D.level hwf b)
  have hxa : x = a := D.level_injective hwf (by omega)
  subst x
  exact D.selected_sub hxb

theorem transGen_of_level_lt {a b : α} (hab : D.level hwf a < D.level hwf b) :
    Relation.TransGen R a b := by
  have haux : ∀ k : ℕ, ∀ b : α, D.level hwf b = k →
      ∀ a : α, D.level hwf a < k → Relation.TransGen R a b := by
    intro k
    induction k using Nat.strong_induction_on with
    | h k ih =>
      intro b hb a ha
      obtain ⟨x, hxb, hlevel⟩ := D.level_predecessor hwf (by omega : 0 < D.level hwf b)
      by_cases hax : D.level hwf a = D.level hwf x
      · have heq := D.level_injective hwf hax
        subst x
        exact Relation.TransGen.single (D.selected_sub hxb)
      · exact (ih (D.level hwf x) (by omega) x rfl a (by omega)).tail (D.selected_sub hxb)
  exact haux (D.level hwf b) b rfl a hab

theorem level_lt_of_relation {a b : α} (hab : R a b) : D.level hwf a < D.level hwf b := by
  by_contra h
  by_cases heq : D.level hwf a = D.level hwf b
  · have heq' := D.level_injective hwf heq
    subst b
    exact hwf.asymmetric a a hab hab
  · have hba : Relation.TransGen R b a := D.transGen_of_level_lt hwf (by omega)
    exact hwf.transGen.asymmetric a b (Relation.TransGen.single hab) hba

end Finite

end PathMatching

end CircularCompleteMinusEdge
