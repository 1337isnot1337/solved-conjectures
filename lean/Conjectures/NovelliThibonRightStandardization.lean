module
public import Conjectures.NovelliThibonFiniteFundamental
public import Mathlib.Data.Fin.Rev

@[expose] public section
namespace NovelliThibon

variable {A : Type*} [LinearOrder A] {n : ℕ}

/-- Increasing letters, breaking ties from right to left.
The ordinary LLT strict ascent statistic is constant on these fibers. -/
def rightStandardize (w : Fin n → A) : Equiv.Perm (Fin n) :=
  Fin.revPerm.trans (standardizeWord (w ∘ Fin.rev))

theorem rightStandardize_lt_iff (w : Fin n → A) (i j : Fin n) :
    rightStandardize w i < rightStandardize w j ↔ w i < w j ∨ w i=w j ∧ j<i := by
  change standardizeWord (w ∘ Fin.rev) i.rev < standardizeWord (w ∘ Fin.rev) j.rev ↔ _
  rw [standardizeWord_lt_iff]
  simp [Fin.rev_lt_rev]

theorem rightStandardize_ascent (w : Fin n → A) {i j : Fin n} (h : i<j) :
    rightStandardize w i < rightStandardize w j ↔ w i<w j := by
  rw [rightStandardize_lt_iff]
  exact ⟨fun hh => hh.elim id (fun x => (h.asymm x.2).elim),Or.inl⟩

def RightFundamentalWord (σ : Equiv.Perm (Fin (n+1))) (w : Fin (n+1) → A) : Prop :=
  Monotone (w ∘ σ.symm) ∧
  ∀ i : Fin n, σ.symm i.castSucc < σ.symm i.succ →
    w (σ.symm i.castSucc) < w (σ.symm i.succ)

theorem rightFundamentalWord_iff_rightStandardize (σ : Equiv.Perm (Fin (n+1)))
    (w : Fin (n+1) → A) : RightFundamentalWord σ w ↔ rightStandardize w=σ := by
  let τ := Fin.revPerm.trans σ
  have hτ (i : Fin (n+1)) : τ.symm i = (σ.symm i).rev := by
    change Fin.revPerm.symm (σ.symm i) = _
    rw [Fin.revPerm_symm]
    rfl
  have hp : RightFundamentalWord σ w ↔ AdjacentFundamentalWord τ (w ∘ Fin.rev) := by
    have hm : (w ∘ Fin.rev) ∘ τ.symm = w ∘ σ.symm := by
      funext i
      simp only [Function.comp_apply,hτ,Fin.rev_rev]
    unfold RightFundamentalWord AdjacentFundamentalWord
    simp only [hm,Function.comp_apply,hτ,Fin.rev_rev,Fin.rev_lt_rev]
  rw [hp,adjacentFundamentalWord_iff_standardize]
  constructor
  · intro h
    apply Equiv.ext
    intro i
    change standardizeWord (w ∘ Fin.rev) i.rev = σ i
    rw [h]
    change σ i.rev.rev = σ i
    rw [Fin.rev_rev]
  · intro h
    apply Equiv.ext
    intro i
    have he := Equiv.congr_fun h i.rev
    change standardizeWord (w ∘ Fin.rev) i.rev.rev = σ i.rev at he
    rw [Fin.rev_rev] at he
    exact he

end NovelliThibon
