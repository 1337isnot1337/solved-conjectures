module

public import Conjectures.McNamaraSteingrimssonCanonicalCuts
public import Conjectures.McNamaraSteingrimssonBlockNormalize

@[expose] public section
namespace McNamaraSteingrimsson

def blockOffset {s : ℕ} (w : Fin s→ℕ) (i : Fin s) : ℕ :=
  ∑ j ∈ Finset.univ.filter (· < i),w j

theorem blockOffset_add_le_next {s : ℕ} (w : Fin s→ℕ) {i j : Fin s} (h : i<j) :
    blockOffset w i + w i ≤ blockOffset w j := by
  let S : Finset (Fin s) := Finset.univ.filter (· < i)
  let T : Finset (Fin s) := Finset.univ.filter (· < j)
  have hi : i∉S := by simp [S]
  have hz : insert i S ⊆ T := by
    intro x hx
    rcases Finset.mem_insert.mp hx with rfl|hx
    · simpa [T] using h
    · have hxi : x < i := by simpa [S] using hx
      simpa [T] using hxi.trans h
  have he := Finset.sum_le_sum_of_subset_of_nonneg hz (fun k _ _ => Nat.zero_le (w k))
  rw [Finset.sum_insert hi,Nat.add_comm] at he
  exact he

theorem blockOffset_add_le_total {s : ℕ} (w : Fin s→ℕ) (i : Fin s) :
    blockOffset w i + w i ≤ ∑ j,w j := by
  let S : Finset (Fin s) := Finset.univ.filter (· < i)
  have hi : i∉S := by simp [S]
  have he := Finset.sum_le_sum_of_subset_of_nonneg (Finset.subset_univ (insert i S))
    (fun k _ _ => Nat.zero_le (w k))
  rw [Finset.sum_insert hi,Nat.add_comm] at he
  exact he

def blockOffsetCode {s : ℕ} {w : Fin s→ℕ} (x : BlockPosition w) :
    Fin (Fintype.card (BlockPosition w)) :=
  ⟨blockOffset w x.fst+x.snd.val,by
    rw [card_blockPosition]
    exact (Nat.add_lt_add_left x.snd.isLt _).trans_le (blockOffset_add_le_total w _)⟩

theorem blockOffsetCode_lt {s : ℕ} {w : Fin s→ℕ} (x y : BlockPosition w) :
    blockOffsetCode x<blockOffsetCode y ↔ blockPositionLT x y := by
  rcases lt_trichotomy x.fst y.fst with h|he|h
  · refine iff_of_true ?_ (Or.inl h)
    change blockOffset w x.fst+x.snd.val < blockOffset w y.fst+y.snd.val
    exact (Nat.add_lt_add_left x.snd.isLt _).trans_le
      ((blockOffset_add_le_next w h).trans (Nat.le_add_right ..))
  · change blockOffset w x.fst+x.snd.val < blockOffset w y.fst+y.snd.val ↔ _
    rw [congrArg (blockOffset w) he,Nat.add_lt_add_iff_left]
    exact ⟨fun h => Or.inr ⟨he,h⟩,fun H => H.elim (fun hz => (he.not_lt hz).elim) And.right⟩
  · refine iff_of_false ?_ (fun H => H.elim (lt_asymm h) (fun z => h.ne z.1.symm))
    apply lt_asymm
    change blockOffset w y.fst+y.snd.val < blockOffset w x.fst+x.snd.val
    exact (Nat.add_lt_add_left y.snd.isLt _).trans_le
      ((blockOffset_add_le_next w h).trans (Nat.le_add_right ..))

theorem blockOffsetCode_injective {s : ℕ} {w : Fin s→ℕ} :
    Function.Injective (@blockOffsetCode s w) := by
  intro x y h
  have hxy : ¬blockPositionLT x y := fun H => h.not_lt ((blockOffsetCode_lt _ _).mpr H)
  have hyx : ¬blockPositionLT y x := fun H => h.symm.not_lt ((blockOffsetCode_lt _ _).mpr H)
  have he : x.fst=y.fst := le_antisymm (le_of_not_gt fun h => hyx (Or.inl h))
    (le_of_not_gt fun h => hxy (Or.inl h))
  apply blockPosition_ext he
  exact le_antisymm (le_of_not_gt fun h => hyx (Or.inr ⟨he.symm,h⟩))
    (le_of_not_gt fun h => hxy (Or.inr ⟨he,h⟩))

/-- The normalizing position rank is exactly the sum of earlier widths
plus the local slot, even when some widths vanish. -/
theorem positionRank_eq_blockOffsetCode {s B : ℕ} {w : Fin s→ℕ} (hB : ∀ i,w i≤B) :
    (codeRank (blockPositionCode B) (blockPositionCode_inj hB) :
      BlockPosition w → Fin (Fintype.card (BlockPosition w)))=blockOffsetCode := by
  let e := codeRank (blockPositionCode B) (blockPositionCode_inj hB)
  have hl (i j : BlockPosition w) : e i<e j ↔ blockPositionLT i j :=
    (codeRank_lt_iff _ _ _ _).trans (blockPositionCode_lt hB _ _)
  have hm : StrictMono (blockOffsetCode ∘ e.symm) := by
    intro i j hij
    apply (blockOffsetCode_lt _ _).mpr
    apply (hl _ _).mp
    simpa only [Equiv.apply_symm_apply] using hij
  funext i
  have he := congrFun hm.eq_id (e i)
  simpa only [Function.comp_apply,Equiv.symm_apply_apply,id_eq] using he.symm

theorem blockPermutation_at_offset {s B : ℕ} {w : Fin s→ℕ} (hB : ∀ i,w i≤B)
    (p : BlockOrder w) (x : BlockPosition w) :
    blockPermutation hB p (blockOffsetCode x)=blockOffsetCode ⟨x.fst,p x.fst x.snd⟩ := by
  let e := codeRank (blockValueCode B p) (blockValueCode_inj hB p)
  let b (x : BlockPosition w) : BlockPosition w := ⟨x.fst,p x.fst x.snd⟩
  have hm : StrictMono ((blockOffsetCode ∘ b) ∘ e.symm) := by
    intro i j hij
    apply (blockOffsetCode_lt _ _).mpr
    have H : e (e.symm i)<e (e.symm j) := by simpa only [Equiv.apply_symm_apply] using hij
    exact (blockValueCode_lt hB p _ _).mp ((codeRank_lt_iff _ _ _ _).mp H)
  have he := congrFun hm.eq_id (e x)
  have hv : e x=blockOffsetCode (b x) := by
    simpa only [Function.comp_apply,Equiv.symm_apply_apply,id_eq] using he.symm
  have hpos := congrFun (positionRank_eq_blockOffsetCode hB) x
  rw [← hpos]
  change e ((codeRank (blockPositionCode B) (blockPositionCode_inj hB)).symm
    ((codeRank (blockPositionCode B) (blockPositionCode_inj hB)) x)) = _
  rwa [Equiv.symm_apply_apply]

end McNamaraSteingrimsson
