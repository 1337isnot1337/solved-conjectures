module

public import Conjectures.McNamaraSteingrimssonSplitSound

@[expose] public section
namespace McNamaraSteingrimsson

theorem castPermutation_trans {ℓ m n : ℕ} (h₁ : ℓ=m) (h₂ : m=n)
    (p : Equiv.Perm (Fin ℓ)) :
    castPermutation h₂ (castPermutation h₁ p)=castPermutation (h₁.trans h₂) p := by
  subst m n
  rfl

theorem castPermutation_directSum_left {m m' n : ℕ} (h : m=m')
    (p : Equiv.Perm (Fin m)) (q : Equiv.Perm (Fin n)) :
    castPermutation (congrArg (·+n) h) (directSumPermutation p q) =
      directSumPermutation (castPermutation h p) q := by
  subst m'
  rfl

def FullPrefixFamily {m n d : ℕ} (α : Equiv.Perm (Fin (m+1))) (π : Equiv.Perm (Fin n))
    (β : Equiv.Perm (Fin d)) : Prop :=
  ∃ (l : ℕ) (h : m+1+l=d) (pR : Equiv.Perm (Fin l)),
    castPermutation h (directSumPermutation α pR)=β ∧ ClassicalPattern pR π

def ProperPrefixFamily {m n d : ℕ} (α : Equiv.Perm (Fin (m+1))) (π : Equiv.Perm (Fin n))
    (β : Equiv.Perm (Fin d)) : Prop :=
  ∃ (k l : ℕ) (h : k+l=d) (pL : Equiv.Perm (Fin k)) (pR : Equiv.Perm (Fin l)),
    k<m+1 ∧ castPermutation h (directSumPermutation pL pR)=β ∧
      ClassicalPattern pL α ∧ ClassicalPattern α pR ∧ ClassicalPattern pR π

/-- The two families in equation (1) of the written disproof, stated
as an exact classification of actual distinct permutation patterns. -/
theorem classicalPattern_twoSummandInterval_iff {m n d : ℕ}
    (p : Equiv.Perm (Fin m)) (π : Equiv.Perm (Fin n)) (β : Equiv.Perm (Fin d)) :
    let α := pointedPermutation p
    (ClassicalPattern α β ∧ ClassicalPattern β (directSumPermutation α π)) ↔
      FullPrefixFamily α π β ∨ ProperPrefixFamily α π β := by
  dsimp only
  let α := pointedPermutation p
  constructor
  · rintro ⟨hl,hr⟩
    obtain ⟨k,l,h,pL,pR,hβ,hL,hR⟩ := (classicalPattern_iff_splits β α π).mp hr
    have hp : ClassicalPattern α (directSumPermutation pL pR) := by
      rw [← hβ] at hl
      exact (classicalPattern_cast_right h _ _).mp hl
    have hk : k≤m+1 := classicalPattern_size_le hL
    by_cases he : k=m+1
    · apply Or.inl
      have hLp : ClassicalPattern (castPermutation he pL) α :=
        (classicalPattern_cast_left he _ _).mpr hL
      have hh := (classicalPattern_same_size_iff_eq _ _).mp hLp
      let e := congrArg (·+l) he
      refine ⟨l,e.symm.trans h,pR,?_,hR⟩
      change castPermutation (e.symm.trans h) (directSumPermutation α pR)=β
      rw [← hh, ← castPermutation_directSum_left, castPermutation_trans]
      exact hβ
    · apply Or.inr
      have hpR : ClassicalPattern α pR := by
        have hc := pointedPattern_in_directSum_iff.mp hp
        exact hc.resolve_left fun h' => he (le_antisymm hk (classicalPattern_size_le h'))
      exact ⟨k,l,h,pL,pR,lt_of_le_of_ne hk he,hβ,hL,hpR,hR⟩
  · rintro (⟨l,h,pR,rfl,hR⟩|⟨k,l,h,pL,pR,_,rfl,hL,hlo,hR⟩)
    · refine ⟨(classicalPattern_cast_right h _ _).mpr ?_,(classicalPattern_cast_left h _ _).mpr ?_⟩
      · exact occurrence_in_left (classicalPattern_refl _)
      · exact classicalPattern_directSum (classicalPattern_refl _) hR
    · refine ⟨(classicalPattern_cast_right h _ _).mpr ?_,(classicalPattern_cast_left h _ _).mpr ?_⟩
      · exact occurrence_in_right hlo
      · exact classicalPattern_directSum hL hR

end McNamaraSteingrimsson
