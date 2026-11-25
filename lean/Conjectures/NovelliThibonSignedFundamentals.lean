module
public import Conjectures.NovelliThibonMarkedStandardization

@[expose] public section
namespace NovelliThibon

open Classical
variable {n : ℕ}

/-- The finite fundamental condition in the signed alphabet, negative
before positive. Negative equalities are permitted only at descents;
positive equalities only away from descents. -/
def SignedAdmissible (D : Finset (Fin n)) (S : Finset (Fin (n+1))) : Prop :=
  ∀ i : Fin n, (i.castSucc∈S ∧ i.succ∉S) ∨
    (i.castSucc∈S ∧ i.succ∈S ∧ i∈D) ∨
    (i.castSucc∉S ∧ i.succ∉S ∧ i∉D)

noncomputable def signedFundamentalAt {R : Type*} [CommRing R] (D : Finset (Fin n)) (z : R) : R :=
  ∑ S : Finset (Fin (n+1)) with SignedAdmissible D S, (-z)^S.card

theorem signed_sorted_word_iff (σ : Equiv.Perm (Fin (n+1))) (S : Finset (Fin (n+1))) :
    SignedAdmissible (inverseDescentSet σ) (σ.finsetCongr S) ↔ markedStandardize S=σ := by
  let e := σ.symm.trans (markedStandardize S)
  have hm (i : Fin (n+1)) : i∈σ.finsetCongr S ↔ σ.symm i∈S := by
    change i∈S.map σ.toEmbedding ↔ _
    simp
  have hd (i : Fin n) : i∈inverseDescentSet σ ↔ σ.symm i.succ < σ.symm i.castSucc := by
    simp [inverseDescentSet]
  have hnd (i : Fin n) : i∉inverseDescentSet σ ↔ σ.symm i.castSucc < σ.symm i.succ := by
    have hne : σ.symm i.succ ≠ σ.symm i.castSucc :=
      fun he => Fin.castSucc_lt_succ.ne (σ.symm.injective he).symm
    exact ⟨fun hn => lt_of_le_of_ne (le_of_not_gt (fun hl => hn ((hd i).mpr hl))) hne.symm,
      fun hl hin => hl.asymm ((hd i).mp hin)⟩
  have hstep (i : Fin n) :
      ((i.castSucc∈σ.finsetCongr S ∧ i.succ∉σ.finsetCongr S) ∨
        (i.castSucc∈σ.finsetCongr S ∧ i.succ∈σ.finsetCongr S ∧ i∈inverseDescentSet σ) ∨
        (i.castSucc∉σ.finsetCongr S ∧ i.succ∉σ.finsetCongr S ∧ i∉inverseDescentSet σ)) ↔
        e i.castSucc < e i.succ := by
    change _ ↔ markedStandardize S (σ.symm i.castSucc) < markedStandardize S (σ.symm i.succ)
    rw [markedStandardize_lt_iff]
    simp only [hm,hnd]
    simp only [hd]
  have hmono : SignedAdmissible (inverseDescentSet σ) (σ.finsetCongr S) ↔ StrictMono e := by
    rw [Fin.strictMono_iff_lt_succ]
    exact forall_congr' hstep
  rw [hmono]
  constructor
  · intro he
    have h : (e : Fin (n+1) → Fin (n+1)) = id := StrictMono.eq_of_range_eq he strictMono_id
      (by simp [Set.range_eq_univ.mpr e.surjective])
    apply Equiv.ext
    intro i
    have hi := congrFun h (σ i)
    change markedStandardize S (σ.symm (σ i)) = σ i at hi
    simpa only [Equiv.symm_apply_apply] using hi
  · intro h i j hij
    change markedStandardize S (σ.symm i) < markedStandardize S (σ.symm j)
    simpa only [h,Equiv.apply_symm_apply] using hij

/-- Superfundamental evaluation reindexes by the unique signed
standardization of the two-letter word. -/
theorem signedFundamentalAt_as_fibre {R : Type*} [CommRing R]
    (σ : Equiv.Perm (Fin (n+1))) (z : R) :
    signedFundamentalAt (inverseDescentSet σ) z =
      ∑ S : Finset (Fin (n+1)) with markedStandardize S=σ, (-z)^S.card := by
  unfold signedFundamentalAt
  rw [Finset.sum_filter,Finset.sum_filter]
  conv_lhs => rw [← Equiv.sum_comp (σ.finsetCongr)]
  apply Finset.sum_congr rfl
  intro S _
  have hcard : (σ.finsetCongr S).card = S.card := Finset.card_map _
  simp only [hcard,signed_sorted_word_iff]

end NovelliThibon
