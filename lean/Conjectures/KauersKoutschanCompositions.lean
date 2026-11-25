import Conjectures.KauersKoutschanOrderedRows
import Mathlib.Combinatorics.Enumerative.Composition

/-! Selection of value-chain edges is equivalent to one composition per chain. -/

namespace KauersKoutschan

/-- The internal edges are the positions before the last value on each chain. -/
def edgeCoordinates (n : ℕ) :
    Fin (n - 2) ≃ Σ row : Fin 2, Fin (rowLength n row - 1) :=
  ((positionCoordinateEquiv (n - 2)).trans (positionRows (n - 2))).trans
    (Equiv.sigmaCongrRight fun row => finCongr (by
      have h := row.isLt
      dsimp [rowLength]
      omega))

theorem edgeCoordinates_row_offset (n : ℕ) (e : Fin (n - 2)) :
    ((edgeCoordinates n e).1 : ℕ) = (e : ℕ) % 2 ∧
      ((edgeCoordinates n e).2 : ℕ) = (e : ℕ) / 2 :=
  ⟨rfl, rfl⟩

private noncomputable def fiberFinsets (n : ℕ) :
    Finset (Σ row : Fin 2, Fin (rowLength n row - 1)) ≃
      ((row : Fin 2) → Finset (Fin (rowLength n row - 1))) := by
  classical
  exact {
    toFun := fun s row => Finset.univ.filter (fun i => ⟨row, i⟩ ∈ s)
    invFun := fun fibers => Finset.univ.sigma fibers
    left_inv := by
      intro s
      ext q
      rcases q with ⟨row, i⟩
      simp
    right_inv := by
      intro fibers
      funext row
      ext i
      simp
  }

noncomputable def selectedByRow (n : ℕ) :
    Finset (Fin (n - 2)) ≃ ((row : Fin 2) → Finset (Fin (rowLength n row - 1))) :=
  (edgeCoordinates n).finsetCongr.trans (fiberFinsets n)

theorem mem_selectedByRow_iff (n : ℕ) (s : Finset (Fin (n - 2)))
    (row : Fin 2) (i : Fin (rowLength n row - 1)) :
    i ∈ selectedByRow n s row ↔ (edgeCoordinates n).symm ⟨row, i⟩ ∈ s := by
  classical
  change i ∈ Finset.univ.filter (fun j =>
    (⟨row, j⟩ : Σ row : Fin 2, Fin (rowLength n row - 1)) ∈ s.map (edgeCoordinates n).toEmbedding) ↔ _
  rw [Finset.mem_filter, Finset.mem_map]
  simp only [Finset.mem_univ, true_and, Function.Embedding.coeFn_mk]
  constructor
  · rintro ⟨a, ha, h⟩
    rwa [← h, Equiv.symm_apply_apply]
  · intro h
    exact ⟨_, h, (edgeCoordinates n).apply_symm_apply _⟩

private def complementFinset {α : Type} [Fintype α] [DecidableEq α] : Finset α ≃ Finset α where
  toFun := compl
  invFun := compl
  left_inv := compl_compl
  right_inv := compl_compl

/-- Cut each value chain at exactly the edges excluded from the selection. -/
noncomputable def selectedEdgeCompositions (n : ℕ) :
    Finset (Fin (n - 2)) ≃ ((row : Fin 2) → Composition (rowLength n row)) :=
  (selectedByRow n).trans (Equiv.piCongrRight fun row =>
    complementFinset.trans ((compositionAsSetEquiv (rowLength n row)).symm.trans
      (compositionEquiv (rowLength n row)).symm))

/-- An interior boundary is exactly a missing edge of the original selection. -/
theorem composition_boundary_iff {n : ℕ} (s : Finset (Fin (n - 2)))
    (row : Fin 2) (i : Fin (rowLength n row - 1)) :
    (⟨1 + (i : ℕ), by have := i.isLt; omega⟩ : Fin (rowLength n row + 1)) ∈
      (selectedEdgeCompositions n s row).toCompositionAsSet.boundaries ↔
        (edgeCoordinates n).symm ⟨row, i⟩ ∉ s := by
  classical
  let m := rowLength n row
  let cuts := (selectedByRow n s row)ᶜ
  have h : (selectedEdgeCompositions n s row).toCompositionAsSet =
      (compositionAsSetEquiv m).symm cuts := by
    change compositionEquiv m ((compositionEquiv m).symm ((compositionAsSetEquiv m).symm cuts)) = _
    exact (compositionEquiv m).apply_symm_apply _
  rw [h]
  have hb : i ∈ compositionAsSetEquiv m ((compositionAsSetEquiv m).symm cuts) ↔ i ∈ cuts := by
    rw [(compositionAsSetEquiv m).apply_symm_apply]
  have hmem (c : CompositionAsSet m) :
      i ∈ compositionAsSetEquiv m c ↔
        (⟨1 + (i : ℕ), by have := i.isLt; omega⟩ : Fin (m + 1)) ∈ c.boundaries := by
    simp [compositionAsSetEquiv]
  exact ((hmem _).symm.trans hb).trans
    (Finset.mem_compl.trans (not_congr (mem_selectedByRow_iff n s row i)))

end KauersKoutschan
