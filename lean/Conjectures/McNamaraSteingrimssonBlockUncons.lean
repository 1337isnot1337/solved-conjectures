module

public import Conjectures.McNamaraSteingrimssonLaterOmission
public import Conjectures.McNamaraSteingrimssonSplitSound

@[expose] public section
namespace McNamaraSteingrimsson

theorem head_tail_block_card {s : ℕ} (w : Fin (s+1)→ℕ) :
    Fintype.card (BlockPosition w)=w 0+Fintype.card (BlockPosition (fun i : Fin s => w i.succ)) := by
  rw [card_blockPosition,card_blockPosition,Fin.sum_univ_succ]

theorem blockOffset_succ_eq_head_add_tail {s : ℕ} (w : Fin (s+1)→ℕ) (i : Fin s) :
    blockOffset w i.succ = w 0 + blockOffset (fun i : Fin s => w i.succ) i := by
  have h : (Finset.univ.filter (· < i) : Finset (Fin s))=Finset.Iio i := by
    ext j
    simp
  rw [blockOffset_tail_eq,blockOffset,h]

/-- Peeling off a block in the normalized block product is exactly
the ordinary binary direct sum on rank-standardized permutations. -/
theorem blockPermutation_uncons {s B : ℕ} {w : Fin (s+1)→ℕ}
    (hB : ∀ i,w i≤B) (p : BlockOrder w) :
    castPermutation (head_tail_block_card w) (blockPermutation hB p) =
      directSumPermutation (p 0)
        (blockPermutation (fun i : Fin s => hB i.succ) (fun i : Fin s => p i.succ)) := by
  let e := head_tail_block_card w
  let N := Fintype.card (BlockPosition (fun i : Fin s => w i.succ))
  let G := blockPermutation (fun i : Fin s => hB i.succ) (fun i : Fin s => p i.succ)
  apply Equiv.ext
  intro z
  obtain ⟨x,hx⟩ := blockOffsetCode_surjective hB (Fin.cast e.symm z)
  have hz : z=Fin.cast e (blockOffsetCode x) := by
    rw [hx,Fin.cast_cast]
    rfl
  obtain ⟨i,x⟩ := x
  change (castPermutation e (blockPermutation hB p)) z=directSumPermutation (p 0) G z
  rw [hz,castPermutation_apply,Fin.cast_cast]
  change Fin.cast e (blockPermutation hB p (blockOffsetCode ⟨i,x⟩)) = _
  rw [blockPermutation_at_offset]
  let claim (i : Fin (s+1)) (x : Fin (w i)) :=
    Fin.cast e (blockOffsetCode ⟨i,p i x⟩) =
      directSumPermutation (p 0) G (Fin.cast e (blockOffsetCode ⟨i,x⟩))
  change claim i x
  refine Fin.cases (motive := fun i => ∀ x,claim i x) ?_ (fun i => ?_) i x
  · intro x
    have H (y : Fin (w 0)) :
        Fin.cast e (blockOffsetCode ⟨(0 : Fin (s+1)),y⟩)=Fin.castAdd N y := by
      apply Fin.ext
      change blockOffset w 0+y.val=y.val
      simp
    change Fin.cast e (blockOffsetCode ⟨0,p 0 x⟩) =
      directSumPermutation (p 0) G (Fin.cast e (blockOffsetCode ⟨0,x⟩))
    rw [H,H,directSum_castAdd]
  · intro x
    let tail := fun i : Fin s => w i.succ
    have H (y : Fin (w i.succ)) :
        Fin.cast e (blockOffsetCode ⟨i.succ,y⟩)=
          Fin.natAdd (w 0) (blockOffsetCode (w := tail) ⟨i,y⟩) := by
      apply Fin.ext
      change blockOffset w i.succ+y.val=w 0+(blockOffset tail i+y.val)
      rw [blockOffset_succ_eq_head_add_tail,Nat.add_assoc]
    change Fin.cast e (blockOffsetCode ⟨i.succ,p i.succ x⟩) =
      directSumPermutation (p 0) G (Fin.cast e (blockOffsetCode ⟨i.succ,x⟩))
    rw [H,H,directSum_natAdd]
    change _ = Fin.natAdd (w 0) (blockPermutation _ _ (blockOffsetCode (w := tail) ⟨i,x⟩))
    rw [blockPermutation_at_offset]

end McNamaraSteingrimsson
