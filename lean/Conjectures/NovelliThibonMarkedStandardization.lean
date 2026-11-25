module
public import Conjectures.NovelliThibonGraphLLT

@[expose] public section
namespace NovelliThibon

open Classical
variable {n : ℕ}

/-- A negative letter precedes a positive letter. Equal negative
letters standardize right to left; equal positive letters left to right. -/
def markedKey (S : Finset (Fin n)) (i : Fin n) : Bool ×ₗ Fin n :=
  toLex (decide (i∉S), if i∈S then i.rev else i)

theorem markedKey_injective (S : Finset (Fin n)) : Function.Injective (markedKey S) := by
  intro i j e
  have h₁ := congrArg (fun x : Bool ×ₗ Fin n => (ofLex x).1) e
  have h₂ := congrArg (fun x : Bool ×ₗ Fin n => (ofLex x).2) e
  by_cases hi : i∈S <;> by_cases hj : j∈S
  · exact Fin.rev_injective (by simpa [markedKey,hi,hj] using h₂)
  · simp [markedKey,hi,hj] at h₁
  · simp [markedKey,hi,hj] at h₁
  · simpa [markedKey,hi,hj] using h₂

def markedStandardize (S : Finset (Fin n)) : Equiv.Perm (Fin n) :=
  standardizeWord (markedKey S)

theorem markedStandardize_lt_iff (S : Finset (Fin n)) (i j : Fin n) :
    markedStandardize S i < markedStandardize S j ↔
      (i∈S ∧ j∉S) ∨ (i∈S ∧ j∈S ∧ j<i) ∨ (i∉S ∧ j∉S ∧ i<j) := by
  rw [markedStandardize,standardizeWord_lt_iff]
  have hfalse : ¬(markedKey S i = markedKey S j ∧ i<j) :=
    fun h => h.2.ne (markedKey_injective S h.1)
  simp only [hfalse,or_false]
  unfold markedKey
  rw [Prod.Lex.toLex_lt_toLex]
  by_cases hi : i∈S <;> by_cases hj : j∈S <;> simp [hi,hj,Fin.rev_lt_rev]

/-- The head, not the tail, determines inversions of a forward edge. -/
theorem markedStandardize_inversion_iff (S : Finset (Fin n)) {i j : Fin n}
    (h : i<j) : markedStandardize S j < markedStandardize S i ↔ j∈S := by
  rw [markedStandardize_lt_iff]
  by_cases hi : i∈S <;> by_cases hj : j∈S <;> simp [hi,hj,h,h.asymm]

/-- A marked standardization is characterized by its complete rank
comparison relation, not by an unverified choice of permutation. -/
theorem markedStandardize_unique (S : Finset (Fin n)) (σ : Equiv.Perm (Fin n))
    (h : ∀ i j, σ i < σ j ↔
      (i∈S ∧ j∉S) ∨ (i∈S ∧ j∈S ∧ j<i) ∨ (i∉S ∧ j∉S ∧ i<j)) :
    σ = markedStandardize S := by
  let e := (markedStandardize S).symm.trans σ
  have hs : StrictMono e := by
    intro i j hij
    change σ ((markedStandardize S).symm i) < σ ((markedStandardize S).symm j)
    rw [h,← markedStandardize_lt_iff]
    simpa only [Equiv.apply_symm_apply] using hij
  have hE : (e : Fin n → Fin n) = id :=
    StrictMono.eq_of_range_eq hs strictMono_id (by simp [Set.range_eq_univ.mpr e.surjective])
  apply Equiv.ext
  intro i
  have hi := congrFun hE (markedStandardize S i)
  change σ ((markedStandardize S).symm (markedStandardize S i)) = markedStandardize S i at hi
  simpa only [Equiv.symm_apply_apply] using hi

end NovelliThibon
