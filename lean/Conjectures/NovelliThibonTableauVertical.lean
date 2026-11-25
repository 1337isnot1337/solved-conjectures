module
public import Conjectures.NovelliThibonTableauChains

@[expose] public section
namespace NovelliThibon

open Classical in
theorem tableauCompletion_zero_card (μ nu : YoungDiagram) :
    Fintype.card (TableauCompletion 0 μ nu) = if μ=nu then 1 else 0 := by
  classical
  by_cases he : μ=nu
  · subst nu
    rw [ite_eq_left rfl]
    let f : TableauCompletion 0 μ μ :=
      ⟨Equiv.ofBijective Fin.elim0 ⟨fun i => i.elim0,fun x => (x.property.2 x.property.1).elim⟩,
        le_rfl,fun x => (x.property.2 x.property.1).elim⟩
    let u : Unique (TableauCompletion 0 μ μ) :=
      ⟨⟨f⟩,fun g => tableauCompletion_ext (fun i => i.elim0)⟩
    exact @Fintype.card_unique _ u _
  · rw [ite_eq_right he]
    apply Fintype.card_eq_zero_iff.mpr
    refine ⟨fun f => he (le_antisymm f.property.1 ?_)⟩
    intro c hc
    by_contra h
    exact Fin.elim0 (f.val.symm ⟨c,hc,h⟩)

theorem tableauCompletion_card_eq_diagramChains {m : ℕ} (n : ℕ) (μ nu : BoundedDiagram (m+2)) :
    Fintype.card (TableauCompletion n μ.val nu.val) = diagramChains n μ nu := by
  classical
  induction n generalizing μ with
  | zero =>
    rw [tableauCompletion_zero_card,diagramChains]
    by_cases h : μ=nu
    · simp [h]
    · have h' : μ.val ≠ nu.val := fun e => h (Subtype.ext e)
      simp [h,h']
  | succ n ih =>
    rw [diagramChains,Fintype.card_congr (tableauCompletion_succ_equiv μ nu).symm,Fintype.card_sigma]
    simp_rw [ih]

def originDiagram : YoungDiagram where
  cells := {(0,0)}
  isLowerSet := by
    intro b a hab hb
    simp only [Finset.mem_coe,Finset.mem_singleton] at hb ⊢
    subst b
    exact Prod.ext (Nat.eq_zero_of_le_zero hab.1) (Nat.eq_zero_of_le_zero hab.2)

theorem verticalTwoDiagram_cells_insert :
    verticalTwoDiagram.cells = insert (1,0) originDiagram.cells := by
  change ({(0,0),(1,0)}:Finset (ℕ×ℕ)) = {(1,0),(0,0)}
  exact Finset.pair_comm _ _

theorem originDiagram_cells_insert : originDiagram.cells = insert (0,0) (⊥ : YoungDiagram).cells := rfl

/-- Standard tableaux of the full diagram whose entries 1 and 2
occupy the bottom-left and the cell directly above it in French notation. -/
abbrev VerticalStandardTableau (n : ℕ) (top : YoungDiagram) :=
  {f : TableauCompletion (n+2) ⊥ top //
    (f.val 0).val = (0,0) ∧ (f.val (Fin.succ (0 : Fin (n+1)))).val = (1,0)}

noncomputable instance (n : ℕ) (top : YoungDiagram) : Fintype (VerticalStandardTableau n top) := by
  classical
  exact Subtype.fintype _

theorem vertical_two_le_of_tableau {n : ℕ} {top : YoungDiagram} (f : VerticalStandardTableau n top) :
    verticalTwoDiagram ≤ top := by
  intro c hc
  change c ∈ ({(0,0),(1,0)}:Finset (ℕ×ℕ)) at hc
  have h0 := (f.val.val 0).property.1
  have h1 := (f.val.val (Fin.succ (0 : Fin (n+1)))).property.1
  rw [f.property.1] at h0
  rw [f.property.2] at h1
  simp only [Finset.mem_insert,Finset.mem_singleton] at hc
  rcases hc with rfl|rfl <;> assumption

theorem origin_le_of_vertical_le {top : YoungDiagram} (h : verticalTwoDiagram ≤ top) :
    originDiagram ≤ top := by
  intro c hc
  change c ∈ ({(0,0)}:Finset (ℕ×ℕ)) at hc
  obtain rfl := Finset.mem_singleton.mp hc
  exact h (Finset.mem_insert_self _ _)

noncomputable def prependVertical {n : ℕ} {top : YoungDiagram}
    (f : TableauCompletion n verticalTwoDiagram top) : VerticalStandardTableau n top := by
  have hor := origin_le_of_vertical_le f.property.1
  let p : ExtraCell originDiagram top := ⟨(1,0),
    f.property.1 (Finset.mem_insert_of_mem (Finset.mem_singleton_self _)),by
      change (1,0) ∉ ({(0,0)}:Finset (ℕ×ℕ)); decide⟩
  let q : ExtraCell ⊥ top := ⟨(0,0),hor (Finset.mem_singleton_self _),by simp⟩
  let first := prependCompletion p hor verticalTwoDiagram_cells_insert f
  let full := prependCompletion q bot_le originDiagram_cells_insert first
  refine ⟨full,?_ ,?_⟩
  · change (full.val 0).val = _
    rw [prependCompletion_zero]
  · change (full.val (Fin.succ (0 : Fin (n+1)))).val = _
    rw [prependCompletion_succ,prependCompletion_zero]

theorem prependVertical_succ_succ {n : ℕ} {top : YoungDiagram}
    (f : TableauCompletion n verticalTwoDiagram top) (i : Fin n) :
    ((prependVertical f).val.val i.succ.succ).val = (f.val i).val := by
  unfold prependVertical
  rw [prependCompletion_succ,prependCompletion_succ]

/-- Completing the vertical start is equivalent to a literal standard
tableau with 2 above 1, including the empty-completion endpoint. -/
noncomputable def verticalTableauEquiv {n : ℕ} {top : YoungDiagram} :
    TableauCompletion n verticalTwoDiagram top ≃ VerticalStandardTableau n top := by
  refine Equiv.ofBijective prependVertical ⟨?_,?_⟩
  · intro f g h
    apply tableauCompletion_ext
    intro i
    have hh := congrArg (fun v : VerticalStandardTableau n top => (v.val.val i.succ.succ).val) h
    simpa only [prependVertical_succ_succ] using hh
  · intro f
    have hor := origin_le_of_vertical_le (vertical_two_le_of_tableau f)
    have h₀ : originDiagram.cells = insert (firstExtra f.val).val (⊥ : YoungDiagram).cells :=
      originDiagram_cells_insert.trans (congrArg (fun p => insert p (⊥ : YoungDiagram).cells) f.property.1.symm)
    let tail := completionTail f.val hor h₀
    have h₁ : (firstExtra tail).val = (1,0) :=
      (completionTail_apply f.val hor h₀ 0).trans f.property.2
    have h' : verticalTwoDiagram.cells = insert (firstExtra tail).val originDiagram.cells :=
      verticalTwoDiagram_cells_insert.trans (congrArg (fun p => insert p originDiagram.cells) h₁.symm)
    let g := completionTail tail (vertical_two_le_of_tableau f) h'
    refine ⟨g,?_⟩
    apply Subtype.ext
    apply tableauCompletion_ext
    intro i
    induction i using Fin.cases with
    | zero => exact (prependVertical g).property.1.trans f.property.1.symm
    | succ i =>
      induction i using Fin.cases with
      | zero => exact (prependVertical g).property.2.trans f.property.2.symm
      | succ i =>
        rw [prependVertical_succ_succ]
        rfl

theorem diagramChains_eq_verticalStandardTableau_card {m : ℕ} (n : ℕ)
    (top : BoundedDiagram (m+2)) :
    diagramChains n (boundedVerticalTwo m) top = Fintype.card (VerticalStandardTableau n top.val) :=
  (tableauCompletion_card_eq_diagramChains n (boundedVerticalTwo m) top).symm.trans
    (Fintype.card_congr verticalTableauEquiv)

end NovelliThibon
