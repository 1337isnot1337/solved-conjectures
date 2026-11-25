module
public import Conjectures.NovelliThibonTableauCompletions
public import Mathlib.Data.Fintype.Sigma

@[expose] public section
namespace NovelliThibon

variable {n : ℕ} {base next top : YoungDiagram}

noncomputable def enumTail {A : Type*} (e : Fin (n+1) ≃ A) :
    Fin n ≃ {x : A // x ≠ e 0} :=
  Equiv.ofBijective (fun i => ⟨e i.succ,fun he => Fin.succ_ne_zero i (e.injective he)⟩) ⟨
    fun i j h => Fin.succ_injective _ (e.injective (congrArg Subtype.val h)), by
      intro x
      have h : e.symm x.val ≠ 0 := by
        intro he
        exact x.property ((e.apply_symm_apply x.val).symm.trans (congrArg e he))
      refine ⟨(e.symm x.val).pred h,Subtype.ext ?_⟩
      change e ((e.symm x.val).pred h).succ = x.val
      rw [Fin.succ_pred,e.apply_symm_apply]⟩

theorem enumTail_apply {A : Type*} (e : Fin (n+1) ≃ A) (i : Fin n) :
    (enumTail e i).val = e i.succ := rfl

theorem enumeration_respects_order
    (e : Fin n ≃ ExtraCell base top)
    (h : ∀ i j : Fin n,(e i).val ≤ (e j).val → i≤j) : Monotone e.symm := by
  intro a b hab
  apply h
  simp only [e.apply_symm_apply]
  exact hab

noncomputable def completionTail (f : TableauCompletion (n+1) base top)
    (hnext : next ≤ top) (h : next.cells=insert (firstExtra f).val base.cells) :
    TableauCompletion n next top :=
  ⟨(enumTail f.val).trans (extraCell_tail_equiv (firstExtra f) h).symm, hnext, by
    apply enumeration_respects_order
    intro i j hij
    change (f.val i.succ).val ≤ (f.val j.succ).val at hij
    exact Fin.succ_le_succ_iff.mp (completion_order f hij)⟩

theorem completionTail_apply (f : TableauCompletion (n+1) base top)
    (hnext : next≤top) (h : next.cells=insert (firstExtra f).val base.cells) (i : Fin n) :
    ((completionTail f hnext h).val i).val = (f.val i.succ).val := rfl

noncomputable def prependCompletion (p : ExtraCell base top)
    (hbase : base≤top) (h : next.cells=insert p.val base.cells)
    (f : TableauCompletion n next top) : TableauCompletion (n+1) base top := by
  classical
  let e : Fin (n+1) ≃ ExtraCell base top :=
    (finSuccEquiv n).trans
      (((f.val.trans (extraCell_tail_equiv p h)).optionCongr).trans (Equiv.optionSubtypeNe p))
  have ez : e 0 = p := by simp [e]
  have es (i : Fin n) : (e i.succ).val = (f.val i).val := by
    simp only [e,Equiv.trans_apply,finSuccEquiv_succ]
    rfl
  refine ⟨e,hbase,enumeration_respects_order e ?_⟩
  intro i j hij
  induction i using Fin.cases with
  | zero => exact Fin.zero_le _
  | succ i =>
    induction j using Fin.cases with
    | zero =>
      rw [ez,es] at hij
      have hpNext : p.val ∈ next := by
        change p.val ∈ next.cells
        rw [h]
        exact Finset.mem_insert_self _ _
      exact ((f.val i).property.2 (next.isLowerSet hij hpNext)).elim
    | succ j =>
      exact Fin.succ_le_succ_iff.mpr (completion_order f (by simpa only [es] using hij))

theorem prependCompletion_zero (p : ExtraCell base top) (hbase : base≤top)
    (h : next.cells=insert p.val base.cells) (f : TableauCompletion n next top) :
    (prependCompletion p hbase h f).val 0 = p := by
  classical
  simp [prependCompletion]

theorem prependCompletion_succ (p : ExtraCell base top) (hbase : base≤top)
    (h : next.cells=insert p.val base.cells) (f : TableauCompletion n next top) (i : Fin n) :
    ((prependCompletion p hbase h f).val i.succ).val = (f.val i).val := by
  classical
  simp only [prependCompletion,Equiv.trans_apply,finSuccEquiv_succ]
  rfl

end NovelliThibon
