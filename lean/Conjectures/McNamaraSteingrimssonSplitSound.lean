module

public import Conjectures.McNamaraSteingrimssonPatternSplit
public import Conjectures.McNamaraSteingrimssonSumAssembly
public import Conjectures.McNamaraSteingrimssonPointedCount

@[expose] public section
namespace McNamaraSteingrimsson

theorem castPermutation_apply {m n : ℕ} (h : m=n) (p : Equiv.Perm (Fin m)) (i : Fin n) :
    castPermutation h p i=Fin.cast h (p (Fin.cast h.symm i)) := by
  subst n
  rfl

theorem castPermutation_symm {m n : ℕ} (h : m=n) (p : Equiv.Perm (Fin n)) :
    castPermutation h (castPermutation h.symm p)=p := by
  subst n
  rfl

/-- A literal subpattern of a direct sum splits, at the first selected
position in the second host summand, into its two canonical subpatterns. -/
theorem classicalPattern_iff_splits {d a b : ℕ} (p : Equiv.Perm (Fin d))
    (q : Equiv.Perm (Fin a)) (r : Equiv.Perm (Fin b)) :
    ClassicalPattern p (directSumPermutation q r) ↔
      ∃ (k l : ℕ) (h : k+l=d) (pL : Equiv.Perm (Fin k)) (pR : Equiv.Perm (Fin l)),
        castPermutation h (directSumPermutation pL pR)=p ∧ ClassicalPattern pL q ∧
          ClassicalPattern pR r := by
  constructor
  · rintro ⟨f,hf,ho⟩
    obtain ⟨k,hk,hcuts⟩ := embedding_boundary_index f hf a
    let l := d-k
    have h : k+l=d := by dsimp [l]; omega
    let p' := castPermutation h.symm p
    let f' : Fin (k+l)→Fin (a+b) := fun i => f (Fin.cast h i)
    have hf' : StrictMono f' := fun _ _ hi => hf hi
    have ho' (i j : Fin (k+l)) : p' i < p' j ↔
        directSumPermutation q r (f' i) < directSumPermutation q r (f' j) := by
      have hh := ho (Fin.cast h i) (Fin.cast h j)
      change castPermutation h.symm p i < castPermutation h.symm p j ↔ _
      rw [castPermutation_apply,castPermutation_apply]
      exact hh
    have hleft (i : Fin k) : (f' (Fin.castAdd l i)).val<a := by
      exact (hcuts _).mpr i.isLt
    have hright (j : Fin l) : a≤(f' (Fin.natAdd k j)).val := by
      apply Nat.le_of_not_gt
      intro hh
      have hlt := (hcuts _).mp hh
      change k+j.val < k at hlt
      omega
    obtain ⟨pL,pR,hp,hL,hR⟩ := pattern_embedding_factors f' hf' ho' hleft hright
    refine ⟨k,l,h,pL,pR,?_,hL,hR⟩
    rw [hp]
    exact castPermutation_symm h p
  · rintro ⟨k,l,h,pL,pR,rfl,hL,hR⟩
    exact (classicalPattern_cast_left h _ _).mpr (classicalPattern_directSum hL hR)

end McNamaraSteingrimsson
