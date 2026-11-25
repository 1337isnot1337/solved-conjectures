module

public import Conjectures.McNamaraSteingrimssonBlockAssembly
public import Conjectures.McNamaraSteingrimssonSumAssoc
public import Conjectures.McNamaraSteingrimssonFamilyCounts

@[expose] public section
namespace McNamaraSteingrimsson

theorem blockPermutation_bound_independent {s B C : ℕ} {w : Fin s→ℕ}
    (hB : ∀ i,w i≤B) (hC : ∀ i,w i≤C) (q : BlockOrder w) :
    blockPermutation hB q=blockPermutation hC q := by
  have h := classicalPattern_of_block_matches hB hC q q id strictMono_id
    (fun i => (classicalPattern_same_size_iff_eq (q i) (q i)).mpr rfl)
  exact (classicalPattern_same_size_iff_eq _ _).mp h

abbrev afterTwo {s : ℕ} (w : Fin (s+2)→ℕ) (i : Fin s) : ℕ := w i.succ.succ

theorem firstTwo_tail_card {s : ℕ} (w : Fin (s+2)→ℕ) :
    Fintype.card (BlockPosition w) =
      (w 0 + w (0 : Fin (s+1)).succ) + Fintype.card (BlockPosition (afterTwo w)) := by
  rw [head_tail_block_card w,head_tail_block_card (fun i : Fin (s+1) => w i.succ)]
  exact (Nat.add_assoc ..).symm

theorem blockPermutation_two_uncons {s B : ℕ} {w : Fin (s+2)→ℕ}
    (hB : ∀ i,w i≤B) (q : BlockOrder w) :
    castPermutation (firstTwo_tail_card w) (blockPermutation hB q)=
      directSumPermutation (directSumPermutation (q 0) (q (0 : Fin (s+1)).succ))
        (blockPermutation (fun i : Fin s => hB i.succ.succ) (fun i : Fin s => q i.succ.succ)) := by
  let v : Fin (s+1)→ℕ := fun i => w i.succ
  let p : BlockOrder v := fun i => q i.succ
  let e₁ := head_tail_block_card w
  let e₂ := head_tail_block_card v
  let eR := congrArg (w 0+·) e₂
  let N := Fintype.card (BlockPosition (afterTwo w))
  let eA := Nat.add_assoc (w 0) (w (0 : Fin (s+1)).succ) N
  have step₁ := blockPermutation_uncons hB q
  have step₂ := blockPermutation_uncons (fun i : Fin (s+1) => hB i.succ) p
  have he : castPermutation (e₁.trans eR) (blockPermutation hB q) =
      directSumPermutation (q 0)
        (directSumPermutation (q (0 : Fin (s+1)).succ)
          (blockPermutation (fun i : Fin s => hB i.succ.succ) (fun i : Fin s => q i.succ.succ))) := by
    rw [← castPermutation_trans e₁ eR,step₁]
    change castPermutation (congrArg (w 0+·) e₂)
      (directSumPermutation (q 0) (blockPermutation (fun i : Fin (s+1) => hB i.succ) p)) = _
    rw [castPermutation_directSum_right e₂,step₂]
  apply castPermutation_injective eA
  rw [castPermutation_trans,directSumPermutation_assoc]
  exact he

/-- The literal normalized sum of copies of one fixed permutation. -/
noncomputable def uniformBlockPermutation (s : ℕ) {K : ℕ} (p : Equiv.Perm (Fin K)) :
    Equiv.Perm (Fin (Fintype.card (BlockPosition (fun _ : Fin s => K)))) :=
  blockPermutation (fun _ => le_rfl) (fun _ : Fin s => p)

theorem uniformBlock_card (s K : ℕ) :
    Fintype.card (BlockPosition (fun _ : Fin s => K))=s*K := by
  rw [card_blockPosition]
  simp

theorem blockPermutation_eq_uniform {s B K : ℕ} {w : Fin s→ℕ}
    (hB : ∀ i,w i≤B) (q : BlockOrder w) (p : Equiv.Perm (Fin K))
    (hW : ∀ i,w i=K) (hQ : ∀ i,castPermutation (hW i) (q i)=p) :
    castPermutation (congrArg (fun v : Fin s→ℕ => Fintype.card (BlockPosition v)) (funext hW))
      (blockPermutation hB q)=uniformBlockPermutation s p := by
  have he : w=(fun _ => K) := funext hW
  subst w
  have hp : q=(fun _ => p) := funext hQ
  subst q
  exact blockPermutation_bound_independent hB _ _

end McNamaraSteingrimsson
