import Conjectures.KauersKoutschanOrderedRows
import Conjectures.KauersKoutschanBlockOrder
import Mathlib.Data.Finset.Sort

/-! Recover the row assignment and the order of blocks from a realizing permutation. -/

open scoped BigOperators

namespace KauersKoutschan

private noncomputable def placedRows {n : ℕ} {s : Finset (Fin (n - 2))}
    (p : Equiv.Perm (Fin n)) :
    (Σ b : BlockHeads s, Fin (runLength s b.1)) ≃ Σ row : Fin 2, Fin (rowLength n row) :=
  ((blocksByLength s).symm.trans p.symm).trans ((positionCoordinateEquiv n).trans (positionRows n))

private theorem placedRows_row {n : ℕ} {s : Finset (Fin (n - 2))}
    {p : Equiv.Perm (Fin n)} (hp : p ∈ s.inf edgeEvent)
    (q : Σ b : BlockHeads s, Fin (runLength s b.1)) :
    (placedRows p q).1 = actualColor p q.1 := by
  obtain ⟨b, k⟩ := q
  have h := (admissibleOffset_iff_lt_runLength s b.1 k).mpr k.isLt
  apply Fin.ext
  change ((p.symm ⟨(b.1 : ℕ) + 2 * (k : ℕ), h.1⟩ : ℕ) % 2) =
    ((p.symm b.1 : ℕ) % 2)
  have hoff := inverse_preserves_block_offsets hp b.1 k h.1 h.2
  have hb : (⟨(b.1 : ℕ), b.1.isLt⟩ : Fin n) = b.1 := Fin.ext rfl
  rw [hb] at hoff
  rw [hoff]
  omega

private def sourceRowFiber {n : ℕ} {s : Finset (Fin (n - 2))}
    (color : BlockHeads s → Fin 2) (row : Fin 2) :
    (Σ b : RowHeads color row, Fin (runLength s b.1.1)) ≃
      {q : Σ b : BlockHeads s, Fin (runLength s b.1) // color q.1 = row} where
  toFun q := ⟨⟨q.1.1, q.2⟩, q.1.2⟩
  invFun q := ⟨⟨q.1.1, q.2⟩, q.1.2⟩
  left_inv _ := rfl
  right_inv _ := rfl

private def targetRowFiber (n : ℕ) (row : Fin 2) :
    {q : Σ i : Fin 2, Fin (rowLength n i) // q.1 = row} ≃ Fin (rowLength n row) where
  toFun q := Fin.cast (congrArg (rowLength n) q.2) q.1.2
  invFun x := ⟨⟨row, x⟩, rfl⟩
  left_inv q := by
    rcases q with ⟨⟨i, x⟩, hi⟩
    change i = row at hi
    subst i
    rfl
  right_inv _ := rfl

/-- An actual permutation's blocks occupy their rows exactly. -/
theorem actualColor_fits {n : ℕ} {s : Finset (Fin (n - 2))}
    {p : Equiv.Perm (Fin n)} (hp : p ∈ s.inf edgeEvent) :
    FitsRows (s := s) (actualColor (s := s) p) := by
  classical
  intro row
  let e := (sourceRowFiber (s := s) (actualColor p) row).trans
    (((placedRows p).subtypeEquiv (fun q => by rw [placedRows_row hp q])).trans
      (targetRowFiber n row))
  simpa [Fintype.card_sigma] using Fintype.card_congr e

private theorem within_row_headPosition_injective {n : ℕ} {s : Finset (Fin (n - 2))}
    (p : Equiv.Perm (Fin n)) (row : Fin 2) :
    Function.Injective (fun b : RowHeads (actualColor (s := s) p) row => headPosition p b.1) := by
  intro b c h
  have hb : (p.symm b.1.1 : ℕ) % 2 = row := congrArg Fin.val b.2
  have hc : (p.symm c.1.1 : ℕ) % 2 = row := congrArg Fin.val c.2
  change (p.symm b.1.1 : ℕ) / 2 = (p.symm c.1.1 : ℕ) / 2 at h
  exact Subtype.ext (Subtype.ext (p.symm.injective (Fin.ext (by omega))))

/-- Rank the blocks in each row by the actual position of their heads. -/
noncomputable def actualOrders {n : ℕ} {s : Finset (Fin (n - 2))}
    (p : Equiv.Perm (Fin n)) : RowOrders (actualColor (s := s) p) := by
  intro row
  letI : LinearOrder (RowHeads (actualColor (s := s) p) row) :=
    LinearOrder.lift' (fun b => headPosition p b.1) (within_row_headPosition_injective p row)
  exact (Fintype.orderIsoFinOfCardEq _ rfl).symm.toEquiv

theorem actualOrders_lt_iff {n : ℕ} {s : Finset (Fin (n - 2))}
    (p : Equiv.Perm (Fin n)) (row : Fin 2) (a b : RowHeads (actualColor (s := s) p) row) :
    actualOrders p row a < actualOrders p row b ↔ headPosition p a.1 < headPosition p b.1 := by
  let _ : LinearOrder (RowHeads (actualColor (s := s) p) row) :=
    LinearOrder.lift' (fun b => headPosition p b.1) (within_row_headPosition_injective p row)
  exact (Fintype.orderIsoFinOfCardEq (RowHeads (actualColor p) row) rfl).symm.lt_iff_lt

end KauersKoutschan
