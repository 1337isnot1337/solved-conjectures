module

public import Conjectures.McNamaraSteingrimssonBlockFibers
public import Conjectures.McNamaraSteingrimssonPatternSize

@[expose] public section
namespace McNamaraSteingrimsson

noncomputable def fiberPositionRanks {s d : ℕ} {w : Fin s→ℕ}
    (selected : Fin d → BlockPosition w) (j : Fin s) :
    PositionFiber selected j ≃ Fin (Fintype.card (PositionFiber selected j)) :=
  codeRank (fun x => x.val.val) (Fin.val_injective.comp Subtype.val_injective)

noncomputable def fiberValueRanks {s d : ℕ} {w : Fin s→ℕ}
    (b : Equiv.Perm (Fin d)) (selected : Fin d → BlockPosition w) (j : Fin s) :
    PositionFiber selected j ≃ Fin (Fintype.card (PositionFiber selected j)) :=
  codeRank (fun x => (b x.val).val)
    (Fin.val_injective.comp (b.injective.comp Subtype.val_injective))

noncomputable def fiberBlockEquiv {s d : ℕ} {w : Fin s→ℕ}
    (selected : Fin d → BlockPosition w) :
    BlockPosition (fun j => Fintype.card (PositionFiber selected j)) ≃ Fin d :=
  (Equiv.sigmaCongrRight (fun j => (fiberPositionRanks selected j).symm)).trans
    (Equiv.sigmaFiberEquiv (fun i => (selected i).fst))

theorem fiberBlockEquiv_label {s d : ℕ} {w : Fin s→ℕ} (selected : Fin d → BlockPosition w)
    (i : BlockPosition (fun j => Fintype.card (PositionFiber selected j))) :
    (selected (fiberBlockEquiv selected i)).fst=i.fst :=
  ((fiberPositionRanks selected i.fst).symm i.snd).property

theorem fiber_block_card {s d : ℕ} {w : Fin s→ℕ} (selected : Fin d → BlockPosition w) :
    Fintype.card (BlockPosition (fun j => Fintype.card (PositionFiber selected j)))=d :=
  (Fintype.card_congr (fiberBlockEquiv selected)).trans (Fintype.card_fin _)

theorem fiberBlockEquiv_position {s d : ℕ} {w : Fin s→ℕ}
    (selected : Fin d → BlockPosition w)
    (hpos : ∀ i j, i<j ↔ blockPositionLT (selected i) (selected j))
    (x y : BlockPosition (fun j => Fintype.card (PositionFiber selected j))) :
    blockPositionLT x y ↔ fiberBlockEquiv selected x<fiberBlockEquiv selected y := by
  rcases x with ⟨i,x⟩
  rcases y with ⟨j,y⟩
  rcases lt_trichotomy i j with hl|rfl|hr
  · exact iff_of_true (Or.inl hl) ((hpos _ _).mpr (Or.inl
      ((fiberBlockEquiv_label selected ⟨i,x⟩).trans_lt
        (hl.trans_eq (fiberBlockEquiv_label selected ⟨j,y⟩).symm))))
  · change i < i ∨ i = i ∧ x.val<y.val ↔ _
    simp only [lt_irrefl,false_or,true_and]
    have h := codeRank_lt_iff (fun x : PositionFiber selected i => x.val.val)
      (Fin.val_injective.comp Subtype.val_injective)
      ((fiberPositionRanks selected i).symm x) ((fiberPositionRanks selected i).symm y)
    change fiberPositionRanks selected i ((fiberPositionRanks selected i).symm x) <
      fiberPositionRanks selected i ((fiberPositionRanks selected i).symm y) ↔ _ at h
    change x < y ↔ ((fiberPositionRanks selected i).symm x).val.val <
      ((fiberPositionRanks selected i).symm y).val.val
    simpa only [Equiv.apply_symm_apply] using h
  · have h := (hpos _ _).mpr (Or.inl
      ((fiberBlockEquiv_label selected ⟨j,y⟩).trans_lt
        (hr.trans_eq (fiberBlockEquiv_label selected ⟨i,x⟩).symm)))
    exact iff_of_false (fun H => H.elim (lt_asymm hr) (fun z => hr.ne z.1.symm))
      (lt_asymm h)

theorem fiberBlockEquiv_value {s d : ℕ} {w : Fin s→ℕ}
    {b : Equiv.Perm (Fin d)} {host : BlockOrder w}
    (selected : Fin d → BlockPosition w)
    (hval : ∀ i j, b i<b j ↔ blockValueLT host (selected i) (selected j))
    (x y : BlockPosition (fun j => Fintype.card (PositionFiber selected j))) :
    blockValueLT (selectedFiberPattern b selected) x y ↔
      b (fiberBlockEquiv selected x)<b (fiberBlockEquiv selected y) := by
  rcases x with ⟨i,x⟩
  rcases y with ⟨j,y⟩
  rcases lt_trichotomy i j with hl|rfl|hr
  · exact iff_of_true (Or.inl hl) ((hval _ _).mpr (Or.inl
      ((fiberBlockEquiv_label selected ⟨i,x⟩).trans_lt
        (hl.trans_eq (fiberBlockEquiv_label selected ⟨j,y⟩).symm))))
  · change i < i ∨ i = i ∧ (selectedFiberPattern b selected i x).val <
      (selectedFiberPattern b selected i y).val ↔ _
    simp only [lt_irrefl,false_or,true_and]
    exact codeRank_lt_iff (fun x : PositionFiber selected i => (b x.val).val)
      (Fin.val_injective.comp (b.injective.comp Subtype.val_injective))
      ((fiberPositionRanks selected i).symm x) ((fiberPositionRanks selected i).symm y)
  · have h := (hval _ _).mpr (Or.inl
      ((fiberBlockEquiv_label selected ⟨j,y⟩).trans_lt
        (hr.trans_eq (fiberBlockEquiv_label selected ⟨i,x⟩).symm)))
    exact iff_of_false (fun H => H.elim (lt_asymm hr) (fun z => hr.ne z.1.symm))
      (lt_asymm h)

/-- The whole middle permutation is precisely the ordered direct sum
of the standardizations of its selected host-block fibers. -/
theorem middle_eq_fiber_blockPermutation {s d : ℕ} {w : Fin s→ℕ}
    {b : Equiv.Perm (Fin d)} {host : BlockOrder w}
    (selected : Fin d → BlockPosition w)
    (hpos : ∀ i j, i<j ↔ blockPositionLT (selected i) (selected j))
    (hval : ∀ i j, b i<b j ↔ blockValueLT host (selected i) (selected j)) :
    castPermutation (fiber_block_card selected)
      (blockPermutation (fun _ => (Fintype.card_subtype_le _).trans_eq (Fintype.card_fin d)) (selectedFiberPattern b selected))=b := by
  let widths := fun j => Fintype.card (PositionFiber selected j)
  let hB : ∀ i,widths i≤d := fun _ => (Fintype.card_subtype_le _).trans_eq (Fintype.card_fin _)
  let p := selectedFiberPattern b selected
  have H : ClassicalPattern (blockPermutation hB p) b := by
    let pos := codeRank (blockPositionCode d) (blockPositionCode_inj hB)
    let val := codeRank (blockValueCode d p) (blockValueCode_inj hB p)
    refine ⟨fun i => fiberBlockEquiv selected (pos.symm i),?_,?_⟩
    · intro i j hij
      apply (fiberBlockEquiv_position selected hpos _ _).mp
      apply (blockPositionCode_lt hB _ _).mp
      apply (codeRank_lt_iff _ _ _ _).mp
      change pos (pos.symm i) < pos (pos.symm j)
      simpa only [Equiv.apply_symm_apply] using hij
    · intro i j
      change val (pos.symm i)<val (pos.symm j) ↔ _
      exact (codeRank_lt_iff _ _ _ _).trans ((blockValueCode_lt hB p _ _).trans
        (fiberBlockEquiv_value selected hval _ _))
  exact (classicalPattern_same_size_iff_eq _ _).mp
    ((classicalPattern_cast_left (fiber_block_card selected) _ _).mpr H)

end McNamaraSteingrimsson
