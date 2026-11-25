module

public import Conjectures.ShumyatskyCycleCompletion
public import Conjectures.ShumyatskyPermutationCycles

/-! Glue the paired cycle completions to actual product automorphisms.
Only the designated return edges of the second permutation can change. -/

@[expose] public section

namespace Shumyatsky

variable {ι C S : Type*} [Group S]

/-- The destinations of the reserved source slots under the conjugating
    permutation. Each slot indexes the tail of a second return move. -/
def secondReturnTails {n : C → ℕ} (index : ι ≃ Σ c, Fin (n c + 1))
    (γ : Equiv.Perm ι) : Set ι :=
  Set.range fun c => γ (index.symm ⟨c, Fin.last (n c)⟩)

/-- Keep the first labels and all prescribed nonreturn second labels.
    The remaining second labels and an actual conjugator can be
    chosen in their original outer classes. -/
theorem exists_product_completion_in_classes [DecidableEq ι] [Nontrivial S]
    (σ τ γ : Equiv.Perm ι) (n : C → ℕ) (index : ι ≃ Σ c, Fin (n c + 1))
    (hCycle : ∀ i, index (σ i) = ⟨(index i).1, cycleNext (index i).2⟩)
    (x y x₀ y₀ g₀ : ι → MulAut S)
    (hOld : factorAction γ g₀ * factorAction σ x₀ * (factorAction γ g₀)⁻¹ =
      factorAction τ y₀)
    (hX : ∀ i, outerProjection (x i) = outerProjection (x₀ i))
    (hY : ∀ i, outerProjection (y i) = outerProjection (y₀ i)) :
    ∃ y' g' : ι → MulAut S,
      (∀ i, i ∉ secondReturnTails index γ → y' i = y i) ∧
      (∀ i, outerProjection (y' i) = outerProjection (y₀ i)) ∧
      (∀ i, outerProjection (g' i) = outerProjection (g₀ i)) ∧
      factorAction γ g' * factorAction σ x * (factorAction γ g')⁻¹ = factorAction τ y' := by
  obtain ⟨hIntertwine, hOldSteps⟩ := (factorAction_conj_iff _ _ _ _ _ _).1 hOld
  let vertex (c : C) (j : Fin (n c + 1)) := index.symm ⟨c, j⟩
  have hNext (c : C) (j : Fin (n c + 1)) :
      σ (vertex c j) = vertex c (cycleNext j) := by
    apply index.injective
    rw [hCycle]
    change (⟨(index (index.symm ⟨c, j⟩)).1, cycleNext (index (index.symm ⟨c, j⟩)).2⟩ :
      Σ c, Fin (n c + 1)) = index (index.symm ⟨c, cycleNext j⟩)
    rw [index.apply_symm_apply, index.apply_symm_apply]
  have hCycleCompletion (c : C) :
      ∃ ys gs : Fin (n c + 1) → MulAut S,
        (∀ j, j ≠ Fin.last (n c) → ys j = y (γ (vertex c j))) ∧
        (∀ j, outerProjection (ys j) = outerProjection (y₀ (γ (vertex c j)))) ∧
        (∀ j, outerProjection (gs j) = outerProjection (g₀ (vertex c j))) ∧
        (∀ j, gs (cycleNext j) = ys j * gs j * (x (vertex c j))⁻¹) := by
    apply exists_cycle_completion_in_classes outerProjection
      (fun j => x (vertex c j)) (fun j => y (γ (vertex c j)))
      (fun j => x₀ (vertex c j)) (fun j => y₀ (γ (vertex c j))) (fun j => g₀ (vertex c j))
    · intro j
      exact hX (vertex c j)
    · intro j
      exact hY (γ (vertex c j))
    · intro j
      rw [← hNext]
      exact hOldSteps (vertex c j)
  choose ys gs hSame hOuterY hOuterG hSteps using hCycleCompletion
  let y' (i : ι) := ys (index (γ.symm i)).1 (index (γ.symm i)).2
  let g' (i : ι) := gs (index i).1 (index i).2
  have hVertex (i : ι) : vertex (index i).1 (index i).2 = i := index.symm_apply_apply i
  have hYApply (i : ι) : y' (γ i) = ys (index i).1 (index i).2 := by
    unfold y'
    rw [γ.symm_apply_apply]
  refine ⟨y', g', ?_, ?_, ?_, ?_⟩
  · intro i hi
    obtain ⟨i, rfl⟩ := γ.surjective i
    rw [hYApply, hSame, hVertex]
    intro hLast
    apply hi
    refine ⟨(index i).1, ?_⟩
    change γ (vertex (index i).1 (Fin.last (n (index i).1))) = γ i
    rw [← hLast]
    exact congrArg γ (hVertex i)
  · intro i
    obtain ⟨i, rfl⟩ := γ.surjective i
    rw [hYApply, hOuterY, hVertex]
  · intro i
    rw [show g' i = gs (index i).1 (index i).2 from rfl, hOuterG, hVertex]
  · refine (factorAction_conj_iff _ _ _ _ _ _).2 ⟨hIntertwine, fun i => ?_⟩
    rw [hYApply]
    change gs (index (σ i)).1 (index (σ i)).2 =
      ys (index i).1 (index i).2 * gs (index i).1 (index i).2 * (x i)⁻¹
    rw [hCycle i]
    dsimp only
    rw [hSteps, hVertex]


/-- Conjugation of a permutation carries its cycles bijectively to
    the cycles of the conjugate permutation. -/
def conjugateCycleEquiv (σ γ : Equiv.Perm ι) :
    PermutationCycle σ ≃ PermutationCycle (γ * σ * γ⁻¹) where
  toFun := Quotient.map γ fun _ _ h => Equiv.Perm.SameCycle.conj h
  invFun := Quotient.map γ.symm fun _ _ h => Equiv.Perm.sameCycle_conj.mp h
  left_inv c := Quotient.inductionOn c fun i => by
    change cycleOfVertex σ (γ.symm (γ i)) = cycleOfVertex σ i
    rw [γ.symm_apply_apply]
  right_inv c := Quotient.inductionOn c fun i => by
    change cycleOfVertex (γ * σ * γ⁻¹) (γ (γ.symm i)) = cycleOfVertex (γ * σ * γ⁻¹) i
    rw [γ.apply_symm_apply]

/-- Start each paired cycle immediately after its chosen second
    return move, so precisely those moves are in the last slots. -/
theorem exists_indexed_cycles_with_reserved_tails [Finite ι] (σ γ : Equiv.Perm ι)
    (reserved : PermutationCycle (γ * σ * γ⁻¹) → ι)
    (hClass : ∀ c, cycleOfVertex (γ * σ * γ⁻¹) (reserved c) = c) :
    ∃ (n : PermutationCycle σ → ℕ) (index : ι ≃ Σ c, Fin (n c + 1)),
      (∀ i, index (σ i) = ⟨(index i).1, cycleNext (index i).2⟩) ∧
        secondReturnTails index γ = Set.range reserved := by
  let e := conjugateCycleEquiv σ γ
  let tail (c : PermutationCycle σ) := γ.symm (reserved (e c))
  have hTail (c : PermutationCycle σ) : cycleOfVertex σ (tail c) = c := by
    apply e.injective
    change cycleOfVertex (γ * σ * γ⁻¹) (γ (γ.symm (reserved (e c)))) = e c
    rw [γ.apply_symm_apply]
    exact hClass (e c)
  let start (c : PermutationCycle σ) : {i // cycleOfVertex σ i = c} :=
    ⟨σ (tail c), (cycleOfVertex_apply σ (tail c)).trans (hTail c)⟩
  obtain ⟨size, idx, hSize, hEval, hCyc⟩ := exists_indexed_permutation_cycles σ start
  let n (c : PermutationCycle σ) := size c - 1
  have hCast (c : PermutationCycle σ) : size c = n c + 1 :=
    (Nat.sub_add_cancel (Nat.succ_le_of_lt (hSize c))).symm
  let index := idx.trans (Equiv.sigmaCongrRight fun c => finCongr (hCast c))
  have hIndex (i : ι) : index (σ i) = ⟨(index i).1, cycleNext (index i).2⟩ := by
    change (⟨(idx (σ i)).1, (idx (σ i)).2.cast (hCast _)⟩ : Σ c, Fin (n c + 1)) =
      ⟨(idx i).1, cycleNext ((idx i).2.cast (hCast _))⟩
    rw [hCyc i]
    dsimp only
    rw [cycleNext_cast]
  have hBase (c : PermutationCycle σ) : index.symm ⟨c, 0⟩ = σ (tail c) := by
    change idx.symm ⟨c, (0 : Fin (n c + 1)).cast (hCast c).symm⟩ = σ (tail c)
    rw [hEval]
    simp [start]
  have hLast (c : PermutationCycle σ) :
      γ (index.symm ⟨c, Fin.last (n c)⟩) = reserved (e c) := by
    have hNext : cycleNext (Fin.last (n c)) = 0 := Fin.ext (by simp [cycleNext])
    have hBefore : index.symm ⟨c, Fin.last (n c)⟩ = tail c := by
      apply σ.injective
      apply index.injective
      rw [hIndex, index.apply_symm_apply, hNext, ← hBase c, index.apply_symm_apply]
    rw [hBefore]
    exact γ.apply_symm_apply _
  refine ⟨n, index, hIndex, ?_⟩
  ext i
  constructor
  · rintro ⟨c, rfl⟩
    exact ⟨e c, (hLast c).symm⟩
  · rintro ⟨d, rfl⟩
    obtain ⟨c, rfl⟩ := e.surjective d
    exact ⟨c, hLast c⟩

/-- Complete the actual product conjugacy while changing the second
    labels only at the one reserved move in each second cycle. -/
theorem exists_product_completion_at_reserved_moves [Finite ι] [DecidableEq ι] [Nontrivial S]
    (σ τ γ : Equiv.Perm ι) (reserved : PermutationCycle τ → ι)
    (hClass : ∀ c, cycleOfVertex τ (reserved c) = c)
    (x y x₀ y₀ g₀ : ι → MulAut S)
    (hOld : factorAction γ g₀ * factorAction σ x₀ * (factorAction γ g₀)⁻¹ =
      factorAction τ y₀)
    (hX : ∀ i, outerProjection (x i) = outerProjection (x₀ i))
    (hY : ∀ i, outerProjection (y i) = outerProjection (y₀ i)) :
    ∃ y' g' : ι → MulAut S,
      (∀ i, i ∉ Set.range reserved → y' i = y i) ∧
      (∀ i, outerProjection (y' i) = outerProjection (y₀ i)) ∧
      (∀ i, outerProjection (g' i) = outerProjection (g₀ i)) ∧
      factorAction γ g' * factorAction σ x * (factorAction γ g')⁻¹ = factorAction τ y' := by
  have hIntertwine := ((factorAction_conj_iff _ _ _ _ _ _).1 hOld).1
  have hConj : γ * σ * γ⁻¹ = τ := mul_inv_eq_iff_eq_mul.mpr hIntertwine
  subst τ
  obtain ⟨n, index, hIndex, hTails⟩ := exists_indexed_cycles_with_reserved_tails σ γ reserved hClass
  rw [← hTails]
  exact exists_product_completion_in_classes σ (γ * σ * γ⁻¹) γ n index hIndex x y x₀ y₀ g₀
    hOld hX hY

end Shumyatsky
