module

public import Conjectures.McNamaraSteingrimssonBlockOffsets

@[expose] public section
namespace McNamaraSteingrimsson

theorem blockOffset_mono {s : ℕ} (w : Fin s→ℕ) : Monotone (blockOffset w) := by
  intro i j h
  rcases h.eq_or_lt with rfl|h
  · exact le_rfl
  · exact (Nat.le_add_right _ _).trans (blockOffset_add_le_next w h)

theorem blockOffsetCode_surjective {s B : ℕ} {w : Fin s→ℕ} (hB : ∀ i,w i≤B) :
    Function.Surjective (@blockOffsetCode s w) := by
  rw [← positionRank_eq_blockOffsetCode hB]
  exact (codeRank (blockPositionCode B) (blockPositionCode_inj hB)).surjective

theorem canonicalCut_blockOffset {s B : ℕ} {w : Fin s→ℕ} (hB : ∀ i,w i≤B)
    (p : BlockOrder w) (i : Fin s) :
    CanonicalCut (blockPermutation hB p) (blockOffset w i) := by
  refine ⟨?_,?_⟩
  · rw [card_blockPosition]
    exact (Nat.le_add_right _ _).trans (blockOffset_add_le_total w i)
  · intro j hj
    obtain ⟨x,rfl⟩ := blockOffsetCode_surjective hB j
    have hx : x.fst < i := by
      by_contra! H
      exact (not_lt_of_ge
        ((blockOffset_mono w H).trans (Nat.le_add_right _ _))) hj
    rw [blockPermutation_at_offset]
    exact (Nat.add_lt_add_left (p x.fst x.snd).isLt _).trans_le (blockOffset_add_le_next w hx)

theorem canonicalCut_blockEnd {s B : ℕ} {w : Fin s→ℕ} (hB : ∀ i,w i≤B)
    (p : BlockOrder w) (i : Fin s) :
    CanonicalCut (blockPermutation hB p) (blockOffset w i+w i) := by
  refine ⟨?_,?_⟩
  · rw [card_blockPosition]
    exact blockOffset_add_le_total w i
  · intro j hj
    obtain ⟨x,rfl⟩ := blockOffsetCode_surjective hB j
    have hx : x.fst ≤ i := by
      by_contra! H
      exact (not_lt_of_ge
        ((blockOffset_add_le_next w H).trans (Nat.le_add_right _ _))) hj
    rw [blockPermutation_at_offset]
    rcases hx.eq_or_lt with he|hl
    · change blockOffset w x.fst+(p x.fst x.snd).val < blockOffset w i+w i
      have hh := Nat.add_lt_add_left (p x.fst x.snd).isLt (blockOffset w x.fst)
      simpa only [he] using hh
    · exact ((Nat.add_lt_add_left (p x.fst x.snd).isLt _).trans_le
        (blockOffset_add_le_next w hl)).trans_le (Nat.le_add_right _ _)

theorem not_canonicalCut_inside_firstMax_block {s B : ℕ} {w : Fin s→ℕ} (hB : ∀ i,w i≤B)
    (p : BlockOrder w) {i : Fin s} (hi : BeginsWithMaximum (p i))
    {k : ℕ} (hstart : blockOffset w i < k) (hend : k < blockOffset w i+w i) :
    ¬CanonicalCut (blockPermutation hB p) k := by
  intro hcut
  have hw : 0<w i := by omega
  let x : BlockPosition w := ⟨i,⟨0,hw⟩⟩
  have hx : (blockOffsetCode x).val<k := by
    change blockOffset w i+0<k
    simpa only [Nat.add_zero] using hstart
  have h := hcut.2 (blockOffsetCode x) hx
  rw [blockPermutation_at_offset] at h
  have he := hi x.snd rfl
  change blockOffset w i+(p i x.snd).val<k at h
  omega

end McNamaraSteingrimsson
