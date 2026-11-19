module

public import Mathlib.SetTheory.Cardinal.Finite
public import Mathlib.Logic.Equiv.Sum
public import Mathlib.Data.Fintype.Pi
public import Mathlib.Data.Fintype.Sets
public import Mathlib.Data.Fin.VecNotation
public import Mathlib.Tactic.FinCases
public import Lean.Elab.Tactic.Omega

@[expose] public section

/-!
# Counting the three branch states

For each child, `A i`, `B i`, and `C i` are its finite sets of configurations
whose top vertex is occupied, dominated by its children, or requires its
parent. The parent-occupied choices are precisely products of `B i ⊕ C i`.
For an unoccupied parent, all children must be of type `A i ⊕ B i`; the parent
is dominated exactly when at least one child is of type `A i`.

These theorems count actual distinct choices and prove the subtraction in the
message recurrence. The graph decomposition giving these child configuration
types is separate from this finite counting lemma.
-/

namespace FranklTreeCounts

variable {ι : Type*} (A B C : ι → Type*)

/-- An unoccupied parent is dominated when some child is occupied. -/
def Dominated (f : ∀ i, A i ⊕ B i) : Prop := ∃ i, (f i).isLeft

theorem isRight_of_not_dominated {f : ∀ i, A i ⊕ B i}
    (h : ¬Dominated A B f) (i : ι) : (f i).isRight := by
  cases hf : f i with
  | inl a => exact False.elim (h ⟨i, by simp [hf]⟩)
  | inr b => simp

/-- Choices with no occupied child are precisely products of dominated-child
configurations. The map removes the right injections without losing data. -/
def noDominatedEquiv :
    {f : ∀ i, A i ⊕ B i // ¬Dominated A B f} ≃ (∀ i, B i) where
  toFun f i := (f.1 i).getRight (isRight_of_not_dominated A B f.2 i)
  invFun f := ⟨fun i => .inr (f i), by simp [Dominated]⟩
  left_inv f := by
    apply Subtype.ext
    funext i
    exact Sum.inr_getRight _ _
  right_inv f := by funext i; rfl

section Finite

variable [Fintype ι] [∀ i, Finite (A i)] [∀ i, Finite (B i)] [∀ i, Finite (C i)]

/-- The dominated and needs-parent states partition all unoccupied choices. -/
theorem dominated_add_needsParent_card :
    Nat.card {f : ∀ i, A i ⊕ B i // Dominated A B f} + Nat.card (∀ i, B i) =
      Nat.card (∀ i, A i ⊕ B i) := by
  classical
  let _ (i : ι) : Fintype (A i) := Fintype.ofFinite (A i)
  let _ (i : ι) : Fintype (B i) := Fintype.ofFinite (B i)
  calc
    _ = Nat.card {f : ∀ i, A i ⊕ B i // Dominated A B f} +
        Nat.card {f : ∀ i, A i ⊕ B i // ¬Dominated A B f} := by
          rw [Nat.card_congr (noDominatedEquiv A B)]
    _ = Nat.card ({f : ∀ i, A i ⊕ B i // Dominated A B f} ⊕
        {f : ∀ i, A i ⊕ B i // ¬Dominated A B f}) := Nat.card_sum.symm
    _ = Nat.card (∀ i, A i ⊕ B i) := Nat.card_congr (Equiv.sumCompl (Dominated A B))

theorem occupied_card :
    Nat.card (∀ i, B i ⊕ C i) = ∏ i, (Nat.card (B i) + Nat.card (C i)) := by
  simp [Nat.card_pi, Nat.card_sum]

omit [∀ i, Finite (B i)] in
theorem needsParent_card : Nat.card (∀ i, B i) = ∏ i, Nat.card (B i) := Nat.card_pi

theorem dominated_card :
    Nat.card {f : ∀ i, A i ⊕ B i // Dominated A B f} =
      (∏ i, (Nat.card (A i) + Nat.card (B i))) - ∏ i, Nat.card (B i) := by
  have h := dominated_add_needsParent_card A B
  simp only [Nat.card_pi, Nat.card_sum] at h
  omega

/-- Nonnegativity of the subtraction follows from the exact partition. -/
theorem needsParent_le_unoccupied :
    (∏ i, Nat.card (B i)) ≤ ∏ i, (Nat.card (A i) + Nat.card (B i)) := by
  have h := dominated_add_needsParent_card A B
  simp only [Nat.card_pi, Nat.card_sum] at h
  omega

/-- Exact message counts obtained from the finite branch-choice semantics. -/
noncomputable def branchCounts : Fin 3 → ℕ :=
  ![Nat.card (∀ i, B i ⊕ C i),
    Nat.card {f : ∀ i, A i ⊕ B i // Dominated A B f},
    Nat.card (∀ i, B i)]

theorem branchCounts_eq : branchCounts A B C =
    ![∏ i, (Nat.card (B i) + Nat.card (C i)),
      (∏ i, (Nat.card (A i) + Nat.card (B i))) - ∏ i, Nat.card (B i),
      ∏ i, Nat.card (B i)] := by
  ext i
  fin_cases i <;> simp [branchCounts, occupied_card, dominated_card, needsParent_card]

end Finite

end FranklTreeCounts
