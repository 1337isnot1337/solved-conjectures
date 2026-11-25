module
public import Conjectures.NovelliThibonTableauSplit

@[expose] public section
namespace NovelliThibon

variable {m n : ℕ}

noncomputable def completionMove (μ nu : BoundedDiagram (m+2))
    (f : TableauCompletion (n+1) μ.val nu.val) : ↥(actualRowMoves μ) := by
  classical
  let c := (firstExtra f).val
  have htop := (firstExtra f).property.1
  have hc : c.1 < m+2 :=
    (YoungDiagram.mem_iff_lt_colLen.mp htop).trans_le
      ((nu.val.colLen_anti 0 c.2 (Nat.zero_le _)).trans nu.property)
  let j : Fin (m+2) := ⟨c.1,hc⟩
  refine ⟨j,?_⟩
  unfold actualRowMoves
  apply Finset.mem_filter.mpr
  refine ⟨Finset.mem_univ _,⟨⟨firstExtendedDiagram f,?_⟩,?_⟩⟩
  · exact (height_mono_of_shape_le (firstExtendedDiagram_le_top f)).trans nu.property
  · change insert c μ.val.cells = insert (c.1,μ.val.rowLen c.1) μ.val.cells
    exact congrArg (fun p => insert p μ.val.cells) (Prod.ext rfl (first_extra_at_row_end f))

theorem completionMove_row (μ nu : BoundedDiagram (m+2))
    (f : TableauCompletion (n+1) μ.val nu.val) :
    (completionMove μ nu f).val.val = (firstExtra f).val.1 := rfl

theorem completionMove_inserts (μ nu : BoundedDiagram (m+2))
    (f : TableauCompletion (n+1) μ.val nu.val) :
    (nextDiagram μ (completionMove μ nu f)).val.cells =
      insert (firstExtra f).val μ.val.cells := by
  rw [nextDiagram_cells,completionMove_row]
  exact congrArg (fun p => insert p μ.val.cells) (Prod.ext rfl (first_extra_at_row_end f).symm)

theorem completionMove_next_le (μ nu : BoundedDiagram (m+2))
    (f : TableauCompletion (n+1) μ.val nu.val) :
    (nextDiagram μ (completionMove μ nu f)).val ≤ nu.val := by
  have h : (nextDiagram μ (completionMove μ nu f)).val = firstExtendedDiagram f :=
    YoungDiagram.ext (completionMove_inserts μ nu f)
  rw [h]
  exact firstExtendedDiagram_le_top f

def moveCellInTop (μ nu : BoundedDiagram (m+2)) (j : ↥(actualRowMoves μ))
    (h : (nextDiagram μ j).val ≤ nu.val) : ExtraCell μ.val nu.val := by
  let c := (j.val.val,μ.val.rowLen j.val.val)
  have hc : c ∈ (nextDiagram μ j).val := by
    change c ∈ (nextDiagram μ j).val.cells
    rw [nextDiagram_cells]
    exact Finset.mem_insert_self _ _
  exact ⟨c,h hc,fun h => (lt_irrefl _) (YoungDiagram.mem_iff_lt_rowLen.mp h)⟩

theorem base_le_nextDiagram (μ : BoundedDiagram (m+2)) (j : ↥(actualRowMoves μ)) :
    μ.val ≤ (nextDiagram μ j).val := by
  intro c hc
  change c ∈ (nextDiagram μ j).val.cells
  rw [nextDiagram_cells]
  exact Finset.mem_insert_of_mem hc

noncomputable def prependMove (μ nu : BoundedDiagram (m+2)) (j : ↥(actualRowMoves μ))
    (f : TableauCompletion n (nextDiagram μ j).val nu.val) :
    TableauCompletion (n+1) μ.val nu.val :=
  prependCompletion (moveCellInTop μ nu j f.property.1)
    ((base_le_nextDiagram μ j).trans f.property.1) (nextDiagram_cells μ j) f

theorem prependMove_zero (μ nu : BoundedDiagram (m+2)) (j : ↥(actualRowMoves μ))
    (f : TableauCompletion n (nextDiagram μ j).val nu.val) :
    ((prependMove μ nu j f).val 0).val = (j.val.val,μ.val.rowLen j.val.val) :=
  congrArg Subtype.val (prependCompletion_zero _ _ _ _)

theorem prependMove_succ (μ nu : BoundedDiagram (m+2)) (j : ↥(actualRowMoves μ))
    (f : TableauCompletion n (nextDiagram μ j).val nu.val) (i : Fin n) :
    ((prependMove μ nu j f).val i.succ).val = (f.val i).val :=
  prependCompletion_succ _ _ _ _ _

theorem tableauCompletion_ext {base top : YoungDiagram}
    {f g : TableauCompletion n base top} (h : ∀ i : Fin n,(f.val i).val = (g.val i).val) :
    f = g := by
  apply Subtype.ext
  apply Equiv.ext
  intro i
  exact Subtype.ext (h i)

/-- Removing the smallest new entry is inverse to inserting a valid
Ferrers cell and listing it first. This is a bijection of actual fillings. -/
noncomputable def tableauCompletion_succ_equiv (μ nu : BoundedDiagram (m+2)) :
    (Σ j : ↥(actualRowMoves μ),TableauCompletion n (nextDiagram μ j).val nu.val) ≃
      TableauCompletion (n+1) μ.val nu.val := by
  refine Equiv.ofBijective (fun q => prependMove μ nu q.1 q.2) ⟨?_,?_⟩
  · rintro ⟨i,f⟩ ⟨j,g⟩ h
    change prependMove μ nu i f = prependMove μ nu j g at h
    have hz := congrArg (fun e : TableauCompletion (n+1) μ.val nu.val => (e.val 0).val) h
    rw [prependMove_zero,prependMove_zero] at hz
    have hij : i=j := Subtype.ext (Fin.ext (congrArg Prod.fst hz))
    subst j
    have hf : f=g := by
      apply tableauCompletion_ext
      intro k
      have hv := congrArg (fun e : TableauCompletion (n+1) μ.val nu.val => (e.val k.succ).val) h
      simpa only [prependMove_succ] using hv
    rw [hf]
  · intro f
    let j := completionMove μ nu f
    let g := completionTail f (completionMove_next_le μ nu f) (completionMove_inserts μ nu f)
    refine ⟨⟨j,g⟩,?_⟩
    apply tableauCompletion_ext
    intro k
    induction k using Fin.cases with
    | zero =>
      change ((prependMove μ nu j g).val 0).val = (firstExtra f).val
      rw [prependMove_zero]
      exact Prod.ext (completionMove_row μ nu f) (first_extra_at_row_end f).symm
    | succ k =>
      change ((prependMove μ nu j g).val k.succ).val = (f.val k.succ).val
      rw [prependMove_succ]
      rfl

end NovelliThibon
