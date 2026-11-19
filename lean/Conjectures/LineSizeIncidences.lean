import Conjectures.LineSizeCarriers

/-! Canonical indexed pairs give distinct intersection points. A selected
intersection lies on exactly its two endpoint carriers. -/
noncomputable section
namespace LineSize

def Arrangement.carrierAt (A : Arrangement) {n : ℕ} (hn : A.carriers.card = n)
    (i : ℕ) : Carrier :=
  if hi : i < n then
    ((A.carriers.equivFinOfCardEq hn).symm ⟨i,hi⟩ : Carrier)
  else ⟨0,0⟩

theorem Arrangement.carrierAt_mem (A : Arrangement) {n : ℕ}
    (hn : A.carriers.card = n) (i : ℕ) (hi : i < n) :
    A.carrierAt hn i ∈ A.carriers := by
  simp only [carrierAt,dite_eq_left hi]
  exact ((A.carriers.equivFinOfCardEq hn).symm ⟨i,hi⟩).property

theorem Arrangement.carrierAt_injective (A : Arrangement) {n : ℕ}
    (hn : A.carriers.card = n) (i j : ℕ) (hi : i < n) (hj : j < n)
    (he : A.carrierAt hn i = A.carrierAt hn j) : i = j := by
  have hs : (A.carriers.equivFinOfCardEq hn).symm ⟨i,hi⟩ =
      (A.carriers.equivFinOfCardEq hn).symm ⟨j,hj⟩ := by
    apply Subtype.ext
    simpa only [carrierAt,dite_eq_left hi,dite_eq_left hj] using he
  exact congrArg Fin.val ((A.carriers.equivFinOfCardEq hn).symm.injective hs)

theorem Arrangement.carrierAt_ne (A : Arrangement) {n : ℕ}
    (hn : A.carriers.card = n) (i j : ℕ) (hi : i < n) (hj : j < n)
    (hij : i ≠ j) : A.carrierAt hn i ≠ A.carrierAt hn j := by
  intro he
  exact hij (A.carrierAt_injective hn i j hi hj he)

theorem Arrangement.carrierAt_slopes (A : Arrangement) {n : ℕ}
    (hn : A.carriers.card = n) (i j : ℕ) (hi : i < n) (hj : j < n)
    (hij : i ≠ j) : (A.carrierAt hn i).slope ≠ (A.carrierAt hn j).slope :=
  A.slopes _ (A.carrierAt_mem hn i hi) _ (A.carrierAt_mem hn j hj)
    (A.carrierAt_ne hn i j hi hj hij)

theorem Arrangement.indexed_meet_on_iff (A : Arrangement) {n : ℕ}
    (hn : A.carriers.card = n) (i j m : ℕ)
    (hi : i < n) (hj : j < n) (hm : m < n) (hij : i ≠ j) :
    OnCarrier (A.carrierAt hn m) (meet (A.carrierAt hn i) (A.carrierAt hn j)) ↔
      m = i ∨ m = j := by
  constructor
  · intro hon
    by_contra h
    have hmi : m ≠ i := fun he => h (Or.inl he)
    have hmj : m ≠ j := fun he => h (Or.inr he)
    exact A.no_triple
      _ (A.carrierAt_mem hn i hi) _ (A.carrierAt_mem hn j hj)
      _ (A.carrierAt_mem hn m hm)
      (A.carrierAt_ne hn i j hi hj hij)
      (A.carrierAt_ne hn i m hi hm hmi.symm)
      (A.carrierAt_ne hn j m hj hm hmj.symm)
      _ (meet_on_left _ _)
      (meet_on_right _ _ (A.carrierAt_slopes hn i j hi hj hij)) hon
  · intro h
    rcases h with hmi | hmj
    · subst m
      exact meet_on_left _ _
    · subst m
      exact meet_on_right _ _ (A.carrierAt_slopes hn i j hi hj hij)

theorem Arrangement.indexed_meet_eq_iff (A : Arrangement) {n : ℕ}
    (hn : A.carriers.card = n) (i j k l : ℕ)
    (hij : i < j) (hj : j < n) (hkl : k < l) (hl : l < n) :
    meet (A.carrierAt hn i) (A.carrierAt hn j) =
      meet (A.carrierAt hn k) (A.carrierAt hn l) ↔ i = k ∧ j = l := by
  constructor
  · intro he
    have hi : i < n := by omega
    have hk : k < n := by omega
    have hiOn : OnCarrier (A.carrierAt hn i)
        (meet (A.carrierAt hn k) (A.carrierAt hn l)) := by
      rw [← he]
      exact meet_on_left _ _
    have hjOn : OnCarrier (A.carrierAt hn j)
        (meet (A.carrierAt hn k) (A.carrierAt hn l)) := by
      rw [← he]
      exact meet_on_right _ _ (A.carrierAt_slopes hn i j hi hj hij.ne)
    have hiPair := (A.indexed_meet_on_iff hn k l i hk hl hi hkl.ne).mp hiOn
    have hjPair := (A.indexed_meet_on_iff hn k l j hk hl hj hkl.ne).mp hjOn
    omega
  · rintro ⟨rfl,rfl⟩
    rfl

def Arrangement.pointsOfEdges (A : Arrangement) {n : ℕ}
    (hn : A.carriers.card = n) (E : Finset (ℕ × ℕ)) : Finset Point :=
  E.image (fun e => meet (A.carrierAt hn e.1) (A.carrierAt hn e.2))

theorem Arrangement.card_pointsOfEdges (A : Arrangement) {n : ℕ}
    (hn : A.carriers.card = n) (E : Finset (ℕ × ℕ))
    (hE : ∀ e ∈ E, e.1 < e.2 ∧ e.2 < n) :
    (A.pointsOfEdges hn E).card = E.card := by
  unfold pointsOfEdges
  apply Finset.card_image_of_injOn
  intro e he f hf hef
  have h := (A.indexed_meet_eq_iff hn e.1 e.2 f.1 f.2
    (hE e he).1 (hE e he).2 (hE f hf).1 (hE f hf).2).mp hef
  exact Prod.ext h.1 h.2

theorem Arrangement.pointsOfEdges_subset (A : Arrangement) {n : ℕ}
    (hn : A.carriers.card = n) (E : Finset (ℕ × ℕ))
    (hE : ∀ e ∈ E, e.1 < e.2 ∧ e.2 < n) :
    A.pointsOfEdges hn E ⊆ A.points := by
  intro p hp
  obtain ⟨e,he,rfl⟩ := Finset.mem_image.mp hp
  have hi : e.1 < n := by have := hE e he; omega
  exact A.intersection_mem _ (A.carrierAt_mem hn e.1 hi)
    _ (A.carrierAt_mem hn e.2 (hE e he).2)
    (A.carrierAt_ne hn e.1 e.2 hi (hE e he).2 (hE e he).1.ne)

theorem noExtraLine_mono (C : Finset Carrier) (P Q : Finset Point)
    (hP : NoExtraLine C P) (hsub : Q ⊆ P) : NoExtraLine C Q := by
  intro a b p q r hp hq hr
  exact hP a b p q r (hsub hp) (hsub hq) (hsub hr)

theorem Arrangement.pointsOfEdges_noExtra (A : Arrangement) {n : ℕ}
    (hn : A.carriers.card = n) (E : Finset (ℕ × ℕ))
    (hE : ∀ e ∈ E, e.1 < e.2 ∧ e.2 < n) :
    NoExtraLine A.carriers (A.pointsOfEdges hn E) :=
  noExtraLine_mono _ _ _ A.no_extra (A.pointsOfEdges_subset hn E hE)

end LineSize
