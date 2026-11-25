import Conjectures.KauersKoutschanBlockLengths
import Mathlib.Algebra.BigOperators.Fin

/-! Ordered blocks of the correct total length construct a literal permutation. -/

open scoped BigOperators

namespace KauersKoutschan

abbrev RowHeads {n : ℕ} {s : Finset (Fin (n - 2))}
    (color : BlockHeads s → Fin 2) (row : Fin 2) :=
  {b : BlockHeads s // color b = row}

noncomputable instance {n : ℕ} {s : Finset (Fin (n - 2))}
    (color : BlockHeads s → Fin 2) (row : Fin 2) : Fintype (RowHeads color row) := by
  unfold RowHeads
  classical
  infer_instance

abbrev rowLength (n : ℕ) (row : Fin 2) : ℕ := (n + 1 - (row : ℕ)) / 2

def FitsRows {n : ℕ} {s : Finset (Fin (n - 2))} (color : BlockHeads s → Fin 2) : Prop :=
  ∀ row, (∑ b : RowHeads color row, runLength s b.1.1) = rowLength n row

abbrev RowOrders {n : ℕ} {s : Finset (Fin (n - 2))} (color : BlockHeads s → Fin 2) :=
  ∀ row : Fin 2, RowHeads color row ≃ Fin (Fintype.card (RowHeads color row))

def positionRows (n : ℕ) :
    PositionCoordinates n ≃ Σ row : Fin 2, Fin (rowLength n row) where
  toFun q := ⟨⟨q.1.1, q.2.1⟩, ⟨q.1.2, q.2.2⟩⟩
  invFun q := ⟨(q.1, q.2), q.1.isLt, q.2.isLt⟩
  left_inv _ := Subtype.ext rfl
  right_inv q := by rcases q with ⟨⟨i, hi⟩, ⟨j, hj⟩⟩; rfl

private def blocksInRows {n : ℕ} {s : Finset (Fin (n - 2))} (color : BlockHeads s → Fin 2) :
    (Σ b : BlockHeads s, Fin (runLength s b.1)) ≃
      Σ row : Fin 2, Σ b : RowHeads color row, Fin (runLength s b.1.1) where
  toFun q := ⟨color q.1, ⟨q.1, rfl⟩, q.2⟩
  invFun q := ⟨q.2.1.1, q.2.2⟩
  left_inv _ := rfl
  right_inv q := by
    rcases q with ⟨row, ⟨b, hb⟩, k⟩
    subst row
    rfl

private def orderedSigma {α : Type} {m : ℕ} (order : α ≃ Fin m) (length : α → ℕ) :
    (Σ b : α, Fin (length b)) ≃ Σ i : Fin m, Fin (length (order.symm i)) :=
  Equiv.sigmaCongr order (fun b => finCongr (congrArg length (order.symm_apply_apply b).symm))

private noncomputable def orderedRowOffsets {n : ℕ} {s : Finset (Fin (n - 2))}
    {color : BlockHeads s → Fin 2} (fits : FitsRows color) (order : RowOrders color)
    (row : Fin 2) :
    (Σ b : RowHeads color row, Fin (runLength s b.1.1)) ≃ Fin (rowLength n row) :=
  ((orderedSigma (order row) (fun b => runLength s b.1.1)).trans finSigmaFinEquiv).trans (finCongr
    (((order row).symm.sum_comp (fun b => runLength s b.1.1)).trans (fits row)))

noncomputable def orderedPrefix {n : ℕ} {s : Finset (Fin (n - 2))}
    {color : BlockHeads s → Fin 2} (order : RowOrders color) (row : Fin 2)
    (b : RowHeads color row) : ℕ :=
  ∑ i : Fin (order row b).val,
    runLength s ((order row).symm (Fin.castLE (order row b).isLt.le i)).1.1

private theorem orderedRowOffsets_apply {n : ℕ} {s : Finset (Fin (n - 2))}
    {color : BlockHeads s → Fin 2} (fits : FitsRows color) (order : RowOrders color)
    (row : Fin 2) (b : RowHeads color row) (k : Fin (runLength s b.1.1)) :
    (orderedRowOffsets fits order row ⟨b, k⟩ : ℕ) = orderedPrefix order row b + (k : ℕ) := by
  simp [orderedRowOffsets, orderedPrefix, orderedSigma, Equiv.sigmaCongr,
    Equiv.sigmaCongrRight, Equiv.sigmaCongrLeft]

/-- Pack each row in its specified order, from left to right. -/
noncomputable def permutationOfRowOrders {n : ℕ} {s : Finset (Fin (n - 2))}
    {color : BlockHeads s → Fin 2} (fits : FitsRows color) (order : RowOrders color) :
    Equiv.Perm (Fin n) :=
  ((blocksByLength s).trans ((blocksInRows color).trans
    ((Equiv.sigmaCongrRight (orderedRowOffsets fits order)).trans
      ((positionRows n).symm.trans (positionCoordinateEquiv n).symm)))).symm

theorem permutationOfRowOrders_position {n : ℕ} {s : Finset (Fin (n - 2))}
    {color : BlockHeads s → Fin 2} (fits : FitsRows color) (order : RowOrders color)
    (b : BlockHeads s) (k : Fin (runLength s b.1)) :
    ((permutationOfRowOrders fits order).symm ((blocksByLength s).symm ⟨b, k⟩) : ℕ) =
      2 * (orderedPrefix order (color b) ⟨b, rfl⟩ + (k : ℕ)) + (color b : ℕ) := by
  simp only [permutationOfRowOrders, Equiv.symm_symm, Equiv.trans_apply, Equiv.apply_symm_apply]
  change 2 * (orderedRowOffsets fits order (color b) ⟨⟨b, rfl⟩, k⟩ : ℕ) +
    (color b : ℕ) = _
  exact congrArg (fun a : ℕ => 2 * a + (color b : ℕ))
    (orderedRowOffsets_apply fits order (color b) ⟨b, rfl⟩ k)

private theorem chosen_edge_coordinates {n : ℕ} {s : Finset (Fin (n - 2))}
    {e : Fin (n - 2)} (he : e ∈ s) :
    (blocksByLength s (upper e)).1 = (blocksByLength s (lower e)).1 ∧
      ((blocksByLength s (upper e)).2 : ℕ) = ((blocksByLength s (lower e)).2 : ℕ) + 1 := by
  have hsel : selectedAt s (e : ℕ) := Finset.mem_image.mpr ⟨e, he, rfl⟩
  have hstep : blockStart s ((e : ℕ) + 2) = blockStart s (e : ℕ) := by
    rw [blockStart, dite_eq_left (by simpa using hsel)]
    simp
  constructor
  · apply Subtype.ext
    apply Fin.ext
    exact hstep
  · change ((e : ℕ) + 2 - blockStart s ((e : ℕ) + 2)) / 2 =
      (((e : ℕ) - blockStart s (e : ℕ)) / 2) + 1
    rw [hstep]
    obtain ⟨_, k, hk, _⟩ := blockStart_spec s (e : ℕ)
    omega

/-- The permutation constructed from legal row orders realizes every selected edge. -/
theorem permutationOfRowOrders_realizes {n : ℕ} {s : Finset (Fin (n - 2))}
    {color : BlockHeads s → Fin 2} (fits : FitsRows color) (order : RowOrders color) :
    permutationOfRowOrders fits order ∈ s.inf edgeEvent := by
  apply (mem_edge_intersection s (permutationOfRowOrders fits order)).mpr
  intro e he
  let lo := blocksByLength s (lower e)
  let hi := blocksByLength s (upper e)
  have hlo := permutationOfRowOrders_position fits order lo.1 lo.2
  have hhi := permutationOfRowOrders_position fits order hi.1 hi.2
  have hlow : (blocksByLength s).symm ⟨lo.1, lo.2⟩ = lower e := by
    exact (blocksByLength s).symm_apply_apply (lower e)
  have hhigh : (blocksByLength s).symm ⟨hi.1, hi.2⟩ = upper e := by
    exact (blocksByLength s).symm_apply_apply (upper e)
  rw [hlow] at hlo
  rw [hhigh] at hhi
  have hsame : hi.1 = lo.1 := (chosen_edge_coordinates he).1
  have hnext : (hi.2 : ℕ) = (lo.2 : ℕ) + 1 := (chosen_edge_coordinates he).2
  have hprefix : orderedPrefix order (color hi.1) ⟨hi.1, rfl⟩ =
      orderedPrefix order (color lo.1) ⟨lo.1, rfl⟩ :=
    congrArg (fun b => orderedPrefix order (color b) ⟨b, rfl⟩) hsame
  have hcolor : (color hi.1 : ℕ) = color lo.1 :=
    congrArg (fun b => (color b : ℕ)) hsame
  rw [hlo, hhi, hprefix, hcolor, hnext]
  omega

def actualColor {n : ℕ} {s : Finset (Fin (n - 2))}
    (p : Equiv.Perm (Fin n)) (b : BlockHeads s) : Fin 2 :=
  ⟨(p.symm b.1 : ℕ) % 2, by omega⟩

/-- The constructed permutation assigns each block to its specified row. -/
theorem actualColor_permutationOfRowOrders {n : ℕ} {s : Finset (Fin (n - 2))}
    {color : BlockHeads s → Fin 2} (fits : FitsRows color) (order : RowOrders color) :
    actualColor (permutationOfRowOrders fits order) = color := by
  funext b
  let z : Fin (runLength s b.1) := ⟨0, runLength_pos s b.1⟩
  have h := permutationOfRowOrders_position fits order b z
  have hbase : (blocksByLength s).symm ⟨b, z⟩ = b.1 := by
    apply Fin.ext
    change (b.1 : ℕ) + 2 * (z : ℕ) = b.1
    simp [z]
  rw [hbase] at h
  apply Fin.ext
  change ((permutationOfRowOrders fits order).symm b.1 : ℕ) % 2 = color b
  rw [h]
  have hlt := (color b).isLt
  omega

end KauersKoutschan
