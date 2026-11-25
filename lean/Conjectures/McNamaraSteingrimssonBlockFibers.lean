module

public import Conjectures.McNamaraSteingrimssonMiddleBlockCoverage

@[expose] public section
namespace McNamaraSteingrimsson

abbrev PositionFiber {s d : ℕ} {w : Fin s→ℕ}
    (selected : Fin d → BlockPosition w) (j : Fin s) :=
  {i : Fin d // (selected i).fst=j}

/-- Each selected slot of a host block appears once. The fiber is the
actual set of positions in the middle occurrence, not an embedding count. -/
theorem selectedFiber_card_eq_of_full {s d : ℕ} {w : Fin s→ℕ}
    (selected : Fin d → BlockPosition w) (hi : Function.Injective selected)
    (j : Fin s) (hj : ∀ x : Fin (w j), ∃ i, selected i=⟨j,x⟩) :
    Fintype.card (PositionFiber selected j)=w j := by
  let f (x : PositionFiber selected j) : Fin (w j) :=
    ⟨(selected x.val).snd.val,by exact (selected x.val).snd.isLt.trans_le (le_of_eq (congrArg w x.property))⟩
  have hinj : Function.Injective f := by
    intro x y he
    apply Subtype.ext
    apply hi
    exact blockPosition_ext (x.property.trans y.property.symm) (congrArg Fin.val he)
  have hsurj : Function.Surjective f := by
    intro x
    obtain ⟨i,he⟩ := hj x
    have hlabel : (selected i).fst=j := congrArg Sigma.fst he
    refine ⟨⟨i,hlabel⟩,Fin.ext ?_⟩
    change (selected i).snd.val=x.val
    exact congrArg (fun z : BlockPosition w => z.snd.val) he
  exact (Fintype.card_congr (Equiv.ofBijective f ⟨hinj,hsurj⟩)).trans (Fintype.card_fin _)

theorem selectedFiber_card_le {s d : ℕ} {w : Fin s→ℕ}
    (selected : Fin d → BlockPosition w) (hi : Function.Injective selected) (j : Fin s) :
    Fintype.card (PositionFiber selected j)≤w j := by
  let f (x : PositionFiber selected j) : Fin (w j) :=
    ⟨(selected x.val).snd.val,by exact (selected x.val).snd.isLt.trans_le (le_of_eq (congrArg w x.property))⟩
  have hinj : Function.Injective f := by
    intro x y he
    apply Subtype.ext
    apply hi
    exact blockPosition_ext (x.property.trans y.property.symm) (congrArg Fin.val he)
  simpa only [Fintype.card_fin] using Fintype.card_le_of_injective f hinj

/-- The fiber standardization takes the relative values at the actual
middle positions assigned to one host block. -/
noncomputable def selectedFiberPattern {s d : ℕ} {w : Fin s→ℕ}
    (b : Equiv.Perm (Fin d)) (selected : Fin d → BlockPosition w) (j : Fin s) :
    Equiv.Perm (Fin (Fintype.card (PositionFiber selected j))) :=
  (codeRank (fun x : PositionFiber selected j => x.val.val)
    (Fin.val_injective.comp Subtype.val_injective)).symm.trans
  (codeRank (fun x : PositionFiber selected j => (b x.val).val)
    (Fin.val_injective.comp (b.injective.comp Subtype.val_injective)))

theorem selectedFiberPattern_contains {s d : ℕ} {w : Fin s→ℕ}
    {b : Equiv.Perm (Fin d)} {host : BlockOrder w}
    (selected : Fin d → BlockPosition w)
    (hpos : ∀ i j, i<j ↔ blockPositionLT (selected i) (selected j))
    (hval : ∀ i j, b i<b j ↔ blockValueLT host (selected i) (selected j))
    (j : Fin s) : ClassicalPattern (selectedFiberPattern b selected j) (host j) := by
  let pos := codeRank (fun x : PositionFiber selected j => x.val.val)
    (Fin.val_injective.comp Subtype.val_injective)
  let val := codeRank (fun x : PositionFiber selected j => (b x.val).val)
    (Fin.val_injective.comp (b.injective.comp Subtype.val_injective))
  let toSlot (x : PositionFiber selected j) : Fin (w j) :=
    ⟨(selected x.val).snd.val,by exact (selected x.val).snd.isLt.trans_le (le_of_eq (congrArg w x.property))⟩
  refine ⟨fun i => toSlot (pos.symm i),?_,?_⟩
  · intro i k hik
    let x := pos.symm i
    let y := pos.symm k
    have hp : pos x<pos y := by simpa [x,y] using hik
    have hp' : x.val<y.val := (codeRank_lt_iff _ _ x y).mp hp
    rcases (hpos _ _).mp hp' with h|⟨_,h⟩
    · rw [x.property,y.property] at h
      exact (lt_irrefl _ h).elim
    · exact h
  · intro i k
    let x := pos.symm i
    let y := pos.symm k
    change val x<val y ↔ host j (toSlot x)<host j (toSlot y)
    have hv : val x<val y ↔ b x.val<b y.val := codeRank_lt_iff _ _ _ _
    rw [hv,hval]
    have hx : selected x.val=⟨j,toSlot x⟩ := blockPosition_ext x.property rfl
    have hy : selected y.val=⟨j,toSlot y⟩ := blockPosition_ext y.property rfl
    rw [hx,hy]
    simp only [blockValueLT,lt_irrefl,false_or,true_and]
    rfl

end McNamaraSteingrimsson
