module

public import Conjectures.SeparableDerangementDiagonalCounts

/-! Realize point displacements along an alternating signed Schröder
tree. Two points with the same displacement first split at a direct
sum node. -/

@[expose] public section

open scoped BigOperators

namespace SeparableDerangements

/-- An ordered Schröder tree, whose internal vertices have arity at least two. -/
inductive SchroederTree where
  | leaf
  | node (k : ℕ) (child : Fin (k + 2) → SchroederTree)

namespace SchroederTree

/-- The number of leaves, in the original child order. -/
def leafCount : SchroederTree → ℕ
  | .leaf => 1
  | .node _ child => ∑ i, (child i).leafCount

theorem leafCount_pos (t : SchroederTree) : 0 < t.leafCount := by
  induction t with
  | leaf => decide
  | node k child ih =>
    change 0 < ∑ i, (child i).leafCount
    rw [Fin.sum_univ_succ]
    have h := ih 0
    omega

/-- The actual permutation obtained by alternating direct and skew
    sums on internal edges. A true root sign uses a skew sum. -/
def permutation : (t : SchroederTree) → Bool → Equiv.Perm (Fin t.leafCount)
  | .leaf, _ => Equiv.refl _
  | .node _ child, skew => blockSums skew (fun i => (child i).leafCount)
    (fun i => (child i).permutation (!skew))

/-- The position of a point when it is viewed as a point of the parent. -/
def childPosition {k : ℕ} (child : Fin (k + 2) → SchroederTree) (i : Fin (k + 2))
    (a : Fin (child i).leafCount) : Fin (.node k child : SchroederTree).leafCount :=
  blockPosition (fun j => (child j).leafCount) i a

theorem displacement_child {k : ℕ} (child : Fin (k + 2) → SchroederTree) (skew : Bool)
    (i : Fin (k + 2)) (a : Fin (child i).leafCount) :
    displacement ((.node k child : SchroederTree).permutation skew) (childPosition child i a) =
      displacement ((child i).permutation (!skew)) a +
        (if skew then (after (fun j => (child j).leafCount) i : ℤ) -
          before (fun j => (child j).leafCount) i else 0) :=
  displacement_blockSums skew (fun j => (child j).leafCount)
    (fun j => (child j).permutation (!skew)) i a

/-- The lowest common ancestor of the two point positions is a direct-sum vertex. -/
def DirectSplit : (t : SchroederTree) → Bool → Fin t.leafCount → Fin t.leafCount → Prop
  | .leaf, _, _, _ => False
  | .node k child, skew, a, b =>
    (skew = false ∧ ∃ (i j : Fin (k + 2)) (x : Fin (child i).leafCount)
      (y : Fin (child j).leafCount), i ≠ j ∧ childPosition child i x = a ∧ childPosition child j y = b) ∨
    (∃ (i : Fin (k + 2)) (x y : Fin (child i).leafCount), childPosition child i x = a ∧
      childPosition child i y = b ∧ DirectSplit (child i) (!skew) x y)

/-- Distinct positions on one diagonal first separate at a direct
    node, so no ordered same-diagonal pair has a skew lowest common ancestor. -/
theorem directSplit_of_same_displacement
    (t : SchroederTree) (skew : Bool) (a b : Fin t.leafCount) (hne : a ≠ b)
    (he : displacement (t.permutation skew) a = displacement (t.permutation skew) b) :
    DirectSplit t skew a b := by
  induction t generalizing skew with
  | leaf =>
    apply (hne _).elim
    exact (Subsingleton.elim (α := Fin 1) a b)
  | node k child ih =>
    let m (i : Fin (k + 2)) := (child i).leafCount
    let e : (Σ i, Fin (m i)) ≃ Fin (∑ i, m i) := finSigmaFinEquiv
    obtain ⟨⟨i, a'⟩, ha⟩ := e.surjective a
    obtain ⟨⟨j, b'⟩, hb⟩ := e.surjective b
    change finSigmaFinEquiv ⟨i, a'⟩ = a at ha
    change finSigmaFinEquiv ⟨j, b'⟩ = b at hb
    rw [← blockPosition_eq_finSigmaFinEquiv] at ha hb
    subst a
    subst b
    by_cases hij : i = j
    · subst j
      have hne' : a' ≠ b' := fun h => hne (congrArg (childPosition child i) h)
      change displacement ((.node k child : SchroederTree).permutation skew)
        (childPosition child i a') =
        displacement ((.node k child : SchroederTree).permutation skew) (childPosition child i b') at he
      rw [displacement_child, displacement_child] at he
      exact Or.inr ⟨i, a', b', rfl, rfl, ih i (!skew) a' b' hne' (add_right_cancel he)⟩
    · cases skew with
      | false => exact Or.inl ⟨rfl, i, j, a', b', hij, rfl, rfl⟩
      | true =>
        exact (hij (same_skew_displacement_implies_same_block m
          (fun j => (child j).permutation false) a' b' he)).elim

end SchroederTree

end SeparableDerangements
