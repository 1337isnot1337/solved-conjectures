module
public import Conjectures.NovelliThibonSignedFundamentals
public import Mathlib.Data.Fin.Basic

@[expose] public section
namespace NovelliThibon

open Classical

def initialRanks (n a : ℕ) : Finset (Fin n) :=
  Finset.univ.filter fun i => i.val < a

theorem mem_initialRanks {n a : ℕ} (i : Fin n) :
    i∈initialRanks n a ↔ i.val < a := by simp [initialRanks]

theorem card_initialRanks {n a : ℕ} (h : a≤n) :
    (initialRanks n a).card=a := by
  have he : initialRanks n a =
      (Finset.univ : Finset (Fin a)).map (Fin.castLEEmb h) := by
    ext i
    rw [mem_initialRanks,Finset.mem_map]
    constructor
    · intro hi
      exact ⟨⟨i.val,hi⟩,Finset.mem_univ _,Fin.ext rfl⟩
    · rintro ⟨j,_,rfl⟩
      exact j.isLt
  rw [he,Finset.card_map,Finset.card_univ,Fintype.card_fin]

/-- A lower set of ranks is exactly the initial segment of its own
cardinality. No least-missing-rank choice is needed. -/
theorem eq_initialRanks_of_downclosed {n : ℕ} (S : Finset (Fin n))
    (h : ∀ ⦃i j : Fin n⦄,i≤j → j∈S → i∈S) : S=initialRanks n S.card := by
  ext i
  rw [mem_initialRanks]
  constructor
  · intro hi
    have hsub : initialRanks n (i.val+1) ⊆ S := by
      intro j hj
      exact h (Nat.le_of_lt_succ ((mem_initialRanks j).mp hj)) hi
    have hc := Finset.card_le_card hsub
    rw [card_initialRanks i.isLt] at hc
    exact hc
  · intro hi
    by_contra hn
    have hsub : S ⊆ initialRanks n i.val := by
      intro j hj
      apply (mem_initialRanks j).mpr
      by_contra ht
      exact hn (h (le_of_not_gt ht) hj)
    have hc := Finset.card_le_card hsub
    rw [card_initialRanks i.isLt.le] at hc
    exact (not_le_of_gt hi) hc

theorem signedAdmissible_downclosed {n : ℕ} {D : Finset (Fin n)} {S : Finset (Fin (n+1))}
    (h : SignedAdmissible D S) {i j : Fin (n+1)} (hij : i≤j) (hj : j∈S) : i∈S := by
  let f (a : Fin (n+1)) : Bool := decide (a∉S)
  have hm : Monotone f := by
    apply Fin.monotone_iff_le_succ.mpr
    intro a
    obtain ⟨ha,hb⟩|⟨ha,hb,_⟩|⟨ha,hb,_⟩ := h a <;> simp [f,ha,hb]
  have hh := hm hij
  by_contra hi
  simp [f,hi,hj] at hh
  exact (by decide : ¬ (true ≤ false)) hh

def SignedCutAdmissible {n : ℕ} (D : Finset (Fin n)) (a : ℕ) : Prop :=
  (∀ i : Fin n,i.val+1 < a → i∈D) ∧ (∀ i : Fin n,a ≤ i.val → i∉D)

theorem signedAdmissible_initialRanks {n : ℕ} (D : Finset (Fin n)) (a : ℕ) :
    SignedAdmissible D (initialRanks (n+1) a) ↔ SignedCutAdmissible D a := by
  have hstep (i : Fin n) : i.succ.val=i.val+1 := rfl
  constructor
  · intro h
    constructor
    · intro i hi
      have ha : i.castSucc.val < a := by change i.val < a; omega
      have hb : i.succ.val < a := hi
      have hh := h i
      simp only [mem_initialRanks,ha,hb,not_true_eq_false,and_false,false_and,false_or,or_false,true_and] at hh
      exact hh
    · intro i hi
      have ha : ¬ i.castSucc.val < a := not_lt_of_ge hi
      have hb : ¬ i.succ.val < a := by rw [hstep]; omega
      have hh := h i
      simp only [mem_initialRanks,ha,hb,false_and,false_or,not_false_eq_true,true_and] at hh
      exact hh
  · rintro ⟨hp,hs⟩ i
    simp only [mem_initialRanks]
    change ((i.val < a ∧ ¬ i.val+1 < a) ∨
      (i.val < a ∧ i.val+1 < a ∧ i∈D) ∨ (¬ i.val < a ∧ ¬ i.val+1 < a ∧ i∉D))
    by_cases hz : i.val+1 < a
    · exact Or.inr (Or.inl ⟨by omega,hz,hp _ hz⟩)
    · by_cases hx : i.val < a
      · exact Or.inl ⟨hx,hz⟩
      · exact Or.inr (Or.inr ⟨hx,hz,hs _ (Nat.le_of_not_gt hx)⟩)

noncomputable def signedCutsEquiv {n : ℕ} (D : Finset (Fin n)) :
    {S : Finset (Fin (n+1)) // SignedAdmissible D S} ≃
      {a : Fin (n+2) // SignedCutAdmissible D a.val} where
  toFun S := ⟨⟨S.val.card,by have h := Finset.card_le_univ S.val; simpa using Nat.lt_succ_of_le h⟩,
    (signedAdmissible_initialRanks _ _).mp ((eq_initialRanks_of_downclosed S.val
      (fun _ _ hi hj => signedAdmissible_downclosed S.property hi hj)) ▸ S.property)⟩
  invFun a := ⟨initialRanks (n+1) a.val.val,(signedAdmissible_initialRanks _ _).mpr a.property⟩
  left_inv S := Subtype.ext (eq_initialRanks_of_downclosed S.val
    (fun _ _ hi hj => signedAdmissible_downclosed S.property hi hj)).symm
  right_inv a := Subtype.ext (Fin.ext (card_initialRanks (Nat.le_of_lt_succ a.val.isLt)))

end NovelliThibon
