module
public import Conjectures.NovelliThibonYoungRaises

@[expose] public section
namespace NovelliThibon

theorem exponents_of_actual_insert (μ nu : YoungDiagram) {m : ℕ} (j : Fin (m+2))
    (h : nu.cells = insert (j.val,μ.rowLen j.val) μ.cells) :
    shapeExponents nu = raiseAt (shapeExponents μ) j := by
  funext i
  have hh (k : ℕ) : k < nu.rowLen i.val ↔
      k < raiseAt (fun v : Fin (m+2) => μ.rowLen v.val) j i := by
    rw [← YoungDiagram.mem_iff_lt_rowLen]
    change (i.val,k) ∈ nu.cells ↔ _
    rw [h,Finset.mem_insert,Prod.mk.injEq]
    change ((i.val=j.val ∧ k=μ.rowLen j.val) ∨ (i.val,k) ∈ μ) ↔ _
    rw [YoungDiagram.mem_iff_lt_rowLen]
    by_cases e : i=j
    · subst i
      simp only [raiseAt,ite_true,true_and]
      omega
    · have he : i.val ≠ j.val := fun hn => e (Fin.ext hn)
      simp [raiseAt,e,he]
  have hrow : nu.rowLen i.val = raiseAt (fun v : Fin (m+2) => μ.rowLen v.val) j i := by
    apply le_antisymm
    · exact Nat.le_of_not_gt (fun hn => (lt_irrefl _) ((hh _).mp hn))
    · exact Nat.le_of_not_gt (fun hn => (lt_irrefl _) ((hh _).mpr hn))
  simp only [shapeExponents,hrow,raiseAt]
  omega

abbrev BoundedDiagram (k : ℕ) := {μ : YoungDiagram // μ.colLen 0 ≤ k}

def ActualRowMove {m : ℕ} (μ : BoundedDiagram (m+2)) (j : Fin (m+2)) : Prop :=
  ∃ nu : BoundedDiagram (m+2),
    nu.val.cells = insert (j.val,μ.val.rowLen j.val) μ.val.cells

theorem actualRowMove_iff {m : ℕ} (μ : BoundedDiagram (m+2)) (j : Fin (m+2)) :
    ActualRowMove μ j ↔ StrictAnti (raiseAt (shapeExponents μ.val) j) := by
  constructor
  · rintro ⟨nu,hnu⟩
    rw [← exponents_of_actual_insert μ.val nu.val j hnu]
    exact shapeExponents_strict nu.val m
  · intro h
    exact ⟨⟨raiseDiagram μ.val j h,raiseDiagram_height μ.val j h⟩,
      diagram_raise_cells μ.val j μ.property h⟩

open Classical in
noncomputable def actualRowMoves {m : ℕ} (μ : BoundedDiagram (m+2)) : Finset (Fin (m+2)) :=
  Finset.univ.filter (ActualRowMove μ)

theorem actualRowMoves_eq_validRaises {m : ℕ} (μ : BoundedDiagram (m+2)) :
    actualRowMoves μ = validRaises (shapeExponents μ.val) := by
  ext j
  simp only [actualRowMoves,validRaises,Finset.mem_filter,Finset.mem_univ,true_and]
  exact actualRowMove_iff μ j

theorem actualRowMove_of_mem {m : ℕ} (μ : BoundedDiagram (m+2))
    {j : Fin (m+2)} (hj : j ∈ actualRowMoves μ) : ActualRowMove μ j := by
  classical
  simpa only [actualRowMoves,Finset.mem_filter,Finset.mem_univ,true_and] using hj

noncomputable def nextDiagram {m : ℕ} (μ : BoundedDiagram (m+2))
    (j : ↥(actualRowMoves μ)) : BoundedDiagram (m+2) :=
  Classical.choose (actualRowMove_of_mem μ j.property)

theorem nextDiagram_cells {m : ℕ} (μ : BoundedDiagram (m+2))
    (j : ↥(actualRowMoves μ)) :
    (nextDiagram μ j).val.cells = insert (j.val.val,μ.val.rowLen j.val.val) μ.val.cells :=
  Classical.choose_spec (actualRowMove_of_mem μ j.property)

theorem shapeExponents_nextDiagram {m : ℕ} (μ : BoundedDiagram (m+2))
    (j : ↥(actualRowMoves μ)) :
    shapeExponents (nextDiagram μ j).val = raiseAt (shapeExponents μ.val) j.val :=
  exponents_of_actual_insert μ.val _ j.val (nextDiagram_cells μ j)

open Classical in
/-- Counts literal chains of shapes where each move inserts the unique
rightmost new cell of a valid row. Intermediate diagrams stay bounded. -/
noncomputable def diagramChains {m : ℕ} : ℕ → BoundedDiagram (m+2) → BoundedDiagram (m+2) → ℕ
  | 0,μ,nu => if μ=nu then 1 else 0
  | n+1,μ,nu => ∑ j : ↥(actualRowMoves μ),diagramChains n (nextDiagram μ j) nu

theorem exponentChains_eq_diagramChains {m : ℕ} (n : ℕ) (μ nu : BoundedDiagram (m+2)) :
    exponentChains n (shapeExponents μ.val (m:=m)) (shapeExponents nu.val (m:=m)) = diagramChains n μ nu := by
  classical
  induction n generalizing μ with
  | zero =>
    simp only [exponentChains,diagramChains]
    congr 1
    exact propext ⟨fun h => Subtype.ext (shapeExponents_injective_of_height μ.property nu.property h),
      fun h => congrArg (fun x : BoundedDiagram (m+2) => shapeExponents x.val (m:=m)) h⟩
  | succ n ih =>
    rw [exponentChains,diagramChains,← actualRowMoves_eq_validRaises,← Finset.sum_coe_sort]
    apply Fintype.sum_congr
    intro j
    rw [← shapeExponents_nextDiagram μ j,ih]

theorem verticalTwoDiagram_height : verticalTwoDiagram.colLen 0 ≤ 2 := by
  by_contra! h
  have hmem : (2,0) ∈ verticalTwoDiagram := YoungDiagram.mem_iff_lt_colLen.mpr h
  have hr := YoungDiagram.mem_iff_lt_rowLen.mp hmem
  simp [verticalTwoDiagram_rowLen] at hr

end NovelliThibon
