module
public import Conjectures.NovelliThibonPieriFirstMoments
public import Mathlib.Logic.Equiv.Fin.Basic
public import Mathlib.Logic.Equiv.Option
public import Mathlib.Data.Fintype.EquivFin

@[expose] public section
namespace NovelliThibon

abbrev ExtraCell (base top : YoungDiagram) :=
  {c : ℕ × ℕ // c ∈ top ∧ c ∉ base}

noncomputable instance (base top : YoungDiagram) : Fintype (ExtraCell base top) := by
  classical
  apply Fintype.ofEquiv ↥(top.cells \ base.cells)
  exact Equiv.subtypeEquivRight (fun _ => Finset.mem_sdiff)

 /-- An order-preserving bijective listing of exactly the unfilled cells.
The predicate `base ≤ top` explicitly rules out non-extension cases. -/
abbrev TableauCompletion (n : ℕ) (base top : YoungDiagram) :=
  {e : Fin n ≃ ExtraCell base top // base ≤ top ∧ Monotone e.symm}

noncomputable instance (n : ℕ) (base top : YoungDiagram) : Fintype (TableauCompletion n base top) := by
  classical
  exact Subtype.fintype _

theorem completion_order {n : ℕ} {base top : YoungDiagram}
    (f : TableauCompletion n base top) {i j : Fin n}
    (h : (f.val i).val ≤ (f.val j).val) : i ≤ j := by
  have hh : (f.val i) ≤ (f.val j) := h
  simpa using f.property.2 hh

noncomputable def firstExtra {n : ℕ} {base top : YoungDiagram}
    (f : TableauCompletion (n+1) base top) : ExtraCell base top := f.val 0

theorem below_first_extra {n : ℕ} {base top : YoungDiagram}
    (f : TableauCompletion (n+1) base top) {c : ℕ×ℕ}
    (h : c ≤ (firstExtra f).val) (hne : c ≠ (firstExtra f).val) : c ∈ base := by
  by_contra hc
  have htop := top.isLowerSet h (firstExtra f).property.1
  let e : ExtraCell base top := ⟨c,htop,hc⟩
  have hh : e ≤ firstExtra f := h
  have hj : f.val.symm e ≤ 0 := by
    simpa [firstExtra] using f.property.2 hh
  have he : f.val.symm e = 0 := le_antisymm hj (Fin.zero_le _)
  have hh' := congrArg (fun i => (f.val i).val) he
  simpa [e,firstExtra] using hne (by simpa [e,firstExtra] using hh')

theorem first_extra_at_row_end {n : ℕ} {base top : YoungDiagram}
    (f : TableauCompletion (n+1) base top) :
    (firstExtra f).val.2 = base.rowLen (firstExtra f).val.1 := by
  have hn := (firstExtra f).property.2
  rw [YoungDiagram.mem_iff_lt_rowLen] at hn
  apply le_antisymm _ (Nat.le_of_not_gt hn)
  by_contra! h
  let c := ((firstExtra f).val.1,base.rowLen (firstExtra f).val.1)
  have hle : c ≤ (firstExtra f).val := ⟨le_rfl,h.le⟩
  have he : c ≠ (firstExtra f).val := fun e =>
    h.ne (congrArg Prod.snd e)
  exact (lt_irrefl _) (YoungDiagram.mem_iff_lt_rowLen.mp (below_first_extra f hle he))

noncomputable def firstExtendedDiagram {n : ℕ} {base top : YoungDiagram}
    (f : TableauCompletion (n+1) base top) : YoungDiagram where
  cells := insert (firstExtra f).val base.cells
  isLowerSet := by
    intro b a hab hb
    simp only [Finset.mem_coe,Finset.mem_insert] at hb ⊢
    obtain rfl|hb := hb
    · by_cases h : a=(firstExtra f).val
      · exact Or.inl h
      · exact Or.inr (below_first_extra f hab h)
    · exact Or.inr (base.isLowerSet hab hb)

theorem firstExtendedDiagram_le_top {n : ℕ} {base top : YoungDiagram}
    (f : TableauCompletion (n+1) base top) : firstExtendedDiagram f ≤ top := by
  intro c hc
  change c ∈ insert (firstExtra f).val base.cells at hc
  obtain rfl|hc := Finset.mem_insert.mp hc
  · exact (firstExtra f).property.1
  · exact f.property.1 hc

theorem height_mono_of_shape_le {base top : YoungDiagram} (h : base ≤ top) :
    base.colLen 0 ≤ top.colLen 0 := by
  by_contra! h'
  have hc : (top.colLen 0,0) ∈ base := YoungDiagram.mem_iff_lt_colLen.mpr h'
  exact (lt_irrefl _) (YoungDiagram.mem_iff_lt_colLen.mp (h hc))

/-- Deleting the chosen element from the unfilled cells agrees with
inserting that cell into the base diagram. -/
def extraCell_tail_equiv {base next top : YoungDiagram} (p : ExtraCell base top)
    (h : next.cells = insert p.val base.cells) : ExtraCell next top ≃ {c : ExtraCell base top // c ≠ p} where
  toFun c := by
    have hn : c.val ∉ (insert p.val base.cells) := by rw [← h]; exact c.property.2
    refine ⟨⟨c.val,c.property.1,?_⟩,?_⟩
    · exact fun he => hn (Finset.mem_insert_of_mem he)
    · intro he
      exact hn (Finset.mem_insert.mpr (Or.inl (congrArg Subtype.val he)))
  invFun c := by
    refine ⟨c.val.val,c.val.property.1,?_⟩
    change c.val.val ∉ next.cells
    rw [h]
    intro hc
    obtain he|hb := Finset.mem_insert.mp hc
    · exact c.property (Subtype.ext he)
    · exact c.val.property.2 hb
  left_inv _ := rfl
  right_inv _ := rfl

end NovelliThibon
