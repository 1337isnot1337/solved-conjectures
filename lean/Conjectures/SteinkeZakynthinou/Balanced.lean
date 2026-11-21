module

public import Conjectures.SteinkeZakynthinou.Tree

/-! Consecutive balanced intervals for the folded threshold cycle. -/

@[expose] public section

namespace SteinkeZakynthinou.Tree

/-- A balanced tree on the positions `a, ..., a + k`. -/
def balanced (a : ℕ) : (k : ℕ) → Tree
  | 0 => .leaf a
  | k + 1 =>
    .fork (balanced a (k / 2)) (balanced (a + k / 2 + 1) (k - k / 2))
termination_by k => k
decreasing_by all_goals omega

/-- The left child has floor or ceiling half the length, as does the right. -/
theorem balanced_position_bounds (a k : ℕ) (p : (balanced a k).Path) :
    a ≤ (balanced a k).position p ∧ (balanced a k).position p ≤ a + k := by
  induction k using Nat.strong_induction_on generalizing a with
  | h k ih =>
    cases k with
    | zero =>
      revert p
      rw [balanced]
      intro p
      simp [position]
    | succ k =>
      revert p
      rw [balanced]
      intro p
      cases p with
      | inl p =>
        have h := ih (k / 2) (by omega) a p
        simp only [position]
        omega
      | inr p =>
        have h := ih (k - k / 2) (by omega) (a + k / 2 + 1) p
        simp only [position]
        omega

theorem balanced_position_surj (a k i : ℕ) (ha : a ≤ i) (hi : i ≤ a + k) :
    ∃ p : (balanced a k).Path, (balanced a k).position p = i := by
  induction k using Nat.strong_induction_on generalizing a with
  | h k ih =>
    cases k with
    | zero =>
      have h : i = a := by omega
      subst i
      rw [balanced]
      exact ⟨(), rfl⟩
    | succ k =>
      rw [balanced]
      by_cases h : i ≤ a + k / 2
      · obtain ⟨p, hp⟩ := ih (k / 2) (by omega) a ha h
        exact ⟨Sum.inl p, hp⟩
      · obtain ⟨p, hp⟩ := ih (k - k / 2) (by omega) (a + k / 2 + 1) (by omega) (by omega)
        exact ⟨Sum.inr p, hp⟩

theorem balanced_position_inj (a k : ℕ) :
    Function.Injective (balanced a k).position := by
  induction k using Nat.strong_induction_on generalizing a with
  | h k ih =>
    cases k with
    | zero =>
      rw [balanced]
      intro p q _
      exact Subsingleton.elim p q
    | succ k =>
      rw [balanced]
      intro p q he
      cases p with
      | inl p =>
        cases q with
        | inl q => exact congrArg Sum.inl (ih (k / 2) (by omega) a he)
        | inr q =>
          have hl := balanced_position_bounds a (k / 2) p
          have hr := balanced_position_bounds (a + k / 2 + 1) (k - k / 2) q
          simp only [position] at he
          omega
      | inr p =>
        cases q with
        | inl q =>
          have hl := balanced_position_bounds a (k / 2) q
          have hr := balanced_position_bounds (a + k / 2 + 1) (k - k / 2) p
          simp only [position] at he
          omega
        | inr q => exact congrArg Sum.inr (ih (k - k / 2) (by omega) _ he)

/-- The abstract tree positions are precisely the consecutive interval. -/
noncomputable def balancedPositionEquiv (a k : ℕ) :
    (balanced a k).Path ≃ Fin (k + 1) :=
  Equiv.ofBijective (fun p =>
      ⟨(balanced a k).position p - a, by
        have h := balanced_position_bounds a k p
        omega⟩)
    ⟨by
        intro p q h
        apply balanced_position_inj a k
        have h' := congrArg Fin.val h
        have hp := (balanced_position_bounds a k p).1
        have hq := (balanced_position_bounds a k q).1
        change (balanced a k).position p - a = (balanced a k).position q - a at h'
        omega,
      by
        intro i
        obtain ⟨p, hp⟩ := balanced_position_surj a k (a + i) (by omega) (by omega)
        exact ⟨p, Fin.ext (by dsimp; omega)⟩⟩

/-- At each successive internal ancestor the length minus one is at most
half that of its parent. This is the bound used for depth charges. -/
def spans : (t : Tree) → t.Path → List Tree
  | .leaf _, _ => []
  | .fork l r, .inl p => .fork l r :: l.spans p
  | .fork l r, .inr p => .fork l r :: r.spans p

theorem spans_balanced (a k : ℕ) (p : (balanced a k).Path) (j : ℕ)
    (hj : j < ((balanced a k).spans p).length) :
    ∃ b ell, ((balanced a k).spans p)[j] = balanced b ell ∧
      0 < ell ∧ 2^j * ell ≤ k := by
  induction k using Nat.strong_induction_on generalizing a j with
  | h k ih =>
    cases k with
    | zero =>
      revert p
      rw [balanced]
      intro p hj
      simp [spans] at hj
    | succ k =>
      cases j with
      | zero =>
        revert p
        rw [balanced]
        intro p hj
        refine ⟨a, k + 1, ?_, by omega, by simp⟩
        rw [balanced]
        cases p <;> rfl
      | succ j =>
        revert p
        rw [balanced]
        intro p hj
        cases p with
        | inl p =>
          simp only [spans, List.length_cons, Nat.succ_lt_succ_iff] at hj
          obtain ⟨b, ell, he, hpos, hm⟩ := ih (k / 2) (by omega) a p j hj
          exact ⟨b, ell, he, hpos, by
            rw [pow_succ, mul_right_comm]
            omega⟩
        | inr p =>
          simp only [spans, List.length_cons, Nat.succ_lt_succ_iff] at hj
          obtain ⟨b, ell, he, hpos, hm⟩ := ih (k - k / 2) (by omega)
            (a + k / 2 + 1) p j hj
          exact ⟨b, ell, he, hpos, by
            rw [pow_succ, mul_right_comm]
            omega⟩

end SteinkeZakynthinou.Tree
