module

public import Conjectures.McNamaraSteingrimssonTwoSummandInterval

@[expose] public section
namespace McNamaraSteingrimsson

theorem castPermutation_directSum_right {m n n' : ℕ} (h : n=n')
    (p : Equiv.Perm (Fin m)) (q : Equiv.Perm (Fin n)) :
    castPermutation (congrArg (m+·) h) (directSumPermutation p q) =
      directSumPermutation p (castPermutation h q) := by
  subst n'
  rfl

/-- Reassociation does not change an actual direct-sum permutation. -/
theorem directSumPermutation_assoc {a b c : ℕ}
    (p : Equiv.Perm (Fin a)) (q : Equiv.Perm (Fin b)) (r : Equiv.Perm (Fin c)) :
    castPermutation (Nat.add_assoc a b c) (directSumPermutation (directSumPermutation p q) r) =
      directSumPermutation p (directSumPermutation q r) := by
  let e := Nat.add_assoc a b c
  apply Equiv.ext
  intro i
  rw [castPermutation_apply]
  change Fin.cast e (directSumPermutation (directSumPermutation p q) r (Fin.cast e.symm i)) =
    directSumPermutation p (directSumPermutation q r) i
  let goal (i : Fin (a+(b+c))) :=
    Fin.cast e (directSumPermutation (directSumPermutation p q) r (Fin.cast e.symm i)) =
      directSumPermutation p (directSumPermutation q r) i
  change goal i
  refine Fin.addCases (motive := goal) ?_ (fun j => ?_) i
  · intro x
    have h (x : Fin a) :
        Fin.cast e.symm (Fin.castAdd (b+c) x)=Fin.castAdd c (Fin.castAdd b x) := Fin.ext rfl
    dsimp only [goal]
    rw [h,directSum_castAdd,directSum_castAdd,directSum_castAdd]
    exact Fin.ext rfl
  · refine Fin.addCases (motive := fun j => goal (Fin.natAdd a j)) ?_ ?_ j
    · intro x
      have h (x : Fin b) :
          Fin.cast e.symm (Fin.natAdd a (Fin.castAdd c x))=
            Fin.castAdd c (Fin.natAdd a x) := Fin.ext rfl
      dsimp only [goal]
      rw [h,directSum_castAdd,directSum_natAdd,directSum_natAdd,directSum_castAdd]
      exact Fin.ext rfl
    · intro x
      have h (x : Fin c) :
          Fin.cast e.symm (Fin.natAdd a (Fin.natAdd b x))=Fin.natAdd (a+b) x := by
        apply Fin.ext
        change a+(b+x.val)=a+b+x.val
        omega
      dsimp only [goal]
      rw [h,directSum_natAdd,directSum_natAdd,directSum_natAdd]
      apply Fin.ext
      change a+b+(r x).val=a+(b+(r x).val)
      omega

end McNamaraSteingrimsson
