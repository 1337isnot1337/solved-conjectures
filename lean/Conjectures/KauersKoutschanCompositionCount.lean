import Conjectures.KauersKoutschanCompositionBlocks
import Conjectures.KauersKoutschanSignedBlocks
import Mathlib.Data.Fintype.Powerset

/-! Reindex the signed factorial count by the two actual value compositions. -/

open scoped BigOperators

namespace KauersKoutschan

abbrev ValueCompositions (n : ℕ) := (row : Fin 2) → Composition (rowLength n row)

abbrev CompositionHeads {n : ℕ} (c : ValueCompositions n) :=
  Σ row : Fin 2, Fin (c row).toCompositionAsSet.length

def compositionBlockSize {n : ℕ} (c : ValueCompositions n) (q : CompositionHeads c) : ℕ :=
  (c q.1).toCompositionAsSet.blocksFun q.2

private def compositionFits {n : ℕ} (c : ValueCompositions n)
    (color : CompositionHeads c → Fin 2) : Prop := by
  classical
  exact ∀ row, (∑ q : {q : CompositionHeads c // color q = row}, compositionBlockSize c q.1) =
    rowLength n row

noncomputable def compositionAssignmentCount {n : ℕ} (c : ValueCompositions n) : ℕ := by
  classical
  exact ∑ color : CompositionHeads c → Fin 2, if compositionFits c color then
    ∏ row : Fin 2, (Fintype.card {q : CompositionHeads c // color q = row}).factorial else 0

noncomputable def compositionSign {n : ℕ} (c : ValueCompositions n) : ℚ :=
  ∏ q : CompositionHeads c, sign (compositionBlockSize c q - 1)

private theorem factorialAssignmentCount_eq_composition {n : ℕ} (s : Finset (Fin (n - 2))) :
    factorialAssignmentCount s = compositionAssignmentCount (selectedEdgeCompositions n s) := by
  classical
  let c := selectedEdgeCompositions n s
  let e : CompositionHeads c ≃ BlockHeads s := compositionHeadEquiv s
  let f := e.symm.arrowCongr (Equiv.refl (Fin 2))
  unfold factorialAssignmentCount compositionAssignmentCount
  apply Fintype.sum_equiv f
  intro color
  let fiber (row : Fin 2) : RowHeads color row ≃ {q : CompositionHeads c // f color q = row} :=
    e.symm.subtypeEquiv (fun b => by
      change color b = row ↔ color (e (e.symm b)) = row
      rw [e.apply_symm_apply])
  have hlen (q : CompositionHeads c) : runLength s (e q).1 = compositionBlockSize c q :=
    compositionHeadEquiv_length s q
  have hsum (row : Fin 2) :
      (∑ b : RowHeads color row, runLength s b.1.1) =
        ∑ q : {q : CompositionHeads c // f color q = row}, compositionBlockSize c q.1 := by
    apply Fintype.sum_equiv (fiber row)
    intro b
    have h := hlen (e.symm b.1)
    rw [e.apply_symm_apply] at h
    exact h
  have hfit : FitsRows color ↔ compositionFits c (f color) := by
    unfold FitsRows compositionFits
    simp_rw [hsum]
  by_cases h : FitsRows color
  · rw [ite_eq_left h, ite_eq_left (hfit.mp h)]
    apply Finset.prod_congr rfl
    intro row _
    rw [Fintype.card_congr (fiber row)]
  · rw [ite_eq_right h, ite_eq_right (fun hc => h (hfit.mpr hc))]

private theorem blockSign_eq_composition {n : ℕ} (s : Finset (Fin (n - 2))) :
    (∏ b : BlockHeads s, sign (runLength s b.1 - 1)) =
      compositionSign (selectedEdgeCompositions n s) := by
  classical
  unfold compositionSign
  apply Fintype.prod_equiv (compositionHeadEquiv s).symm
  intro b
  have h := compositionHeadEquiv_length s ((compositionHeadEquiv s).symm b)
  rw [(compositionHeadEquiv s).apply_symm_apply] at h
  rw [h]
  rfl

/-- The original permutation count, expressed as signed factorial weights of
all compositions of the two value-chain lengths. -/
theorem permutationCount_signed_compositions (n : ℕ) :
    (permutationCount n : ℚ) =
      ∑ c : ValueCompositions n, compositionSign c * (compositionAssignmentCount c : ℚ) := by
  classical
  rw [permutationCount_signed_factorial_blocks, Finset.powerset_univ]
  apply Fintype.sum_equiv (selectedEdgeCompositions n)
  intro s
  rw [blockSign_eq_composition, factorialAssignmentCount_eq_composition]

end KauersKoutschan
