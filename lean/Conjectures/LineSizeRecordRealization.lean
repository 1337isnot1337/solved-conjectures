import Conjectures.LineSizeRealization
import Conjectures.LineSizeRecords
import Conjectures.LineSizeTuples

/-! Exact realizability of the large line-size record of a finite set of
distinct points in the real plane. -/
noncomputable section
namespace LineSize

theorem Arrangement.carrierAt_surjective (A : Arrangement) {k : ℕ}
    (hk : A.carriers.card=k) (c : Carrier) (hc : c ∈ A.carriers) :
    ∃ i < k, A.carrierAt hk i=c := by
  let j : Fin k := A.carriers.equivFinOfCardEq hk ⟨c,hc⟩
  refine ⟨j.val,j.isLt,?_⟩
  simp only [Arrangement.carrierAt,dite_eq_left j.isLt]
  change ((A.carriers.equivFinOfCardEq hk).symm j).val=c
  simp [j]

theorem linePoints_eq_carrierPoints (P : Finset Point) (D : Carrier)
    (a b : Point) (ha : OnCarrier D a) (hb : OnCarrier D b) (hab : a ≠ b) :
    linePoints P a b=carrierPoints P D := by
  ext p
  simp only [mem_linePoints,mem_carrierPoints,carrierLine_pair D a b ha hb hab,
    mem_carrierLine]

theorem hasLineSize_of_carrier_count (P : Finset Point) (D : Carrier) (s : ℕ)
    (hcount : (carrierPoints P D).card=s) (hs : 2 ≤ s) : HasLineSize P s := by
  obtain ⟨a,b,ha,hb,hab⟩ := Finset.one_lt_card_iff.mp
    (show 1 < (carrierPoints P D).card by omega)
  obtain ⟨haP,haD⟩ := (mem_carrierPoints P D a).mp ha
  obtain ⟨hbP,hbD⟩ := (mem_carrierPoints P D b).mp hb
  refine ⟨a,haP,b,hbP,hab,?_⟩
  rw [linePoints_eq_carrierPoints P D a b haD hbD hab,hcount]

theorem carrier_of_large_line (C : Finset Carrier) (P : Finset Point)
    (hP : NoExtraLine C P) (s : ℕ) (hs : HasLineSize P s) (hlarge : 3 ≤ s) :
    ∃ c ∈ C, (carrierPoints P c).card=s := by
  obtain ⟨a,ha,b,hb,hab,hcard⟩ := hs
  obtain ⟨p,q,r,hp,hq,hr,hpq,hpr,hqr⟩ := Finset.two_lt_card_iff.mp
    (show 2 < (linePoints P a b).card by omega)
  obtain ⟨hpP,hpL⟩ := (mem_linePoints P a b p).mp hp
  obtain ⟨hqP,hqL⟩ := (mem_linePoints P a b q).mp hq
  obtain ⟨hrP,hrL⟩ := (mem_linePoints P a b r).mp hr
  obtain ⟨c,hc,hL⟩ := hP a b p q r hpP hqP hrP hpq hpr hqr hpL hqL hrL
  have he : linePoints P a b=carrierPoints P c := by
    ext x
    simp only [mem_linePoints,mem_carrierPoints,hL,mem_carrierLine]
  exact ⟨c,hc,he ▸ hcard⟩

theorem large_record_of_carrier_realization (A : Arrangement) (k : ℕ)
    (hk : A.carriers.card=k) (P : Finset Point) (d : ℕ → ℕ)
    (hP : NoExtraLine A.carriers P)
    (hcount : ∀ i < k, (carrierPoints P (A.carrierAt hk i)).card=d i)
    (hlarge : ∀ i < k, 3 ≤ d i) :
    largeLineSizeRecord P=(Finset.range k).image d := by
  classical
  ext s
  rw [mem_largeLineSizeRecord,Finset.mem_image]
  constructor
  · rintro ⟨hs,hbig⟩
    obtain ⟨c,hc,hcs⟩ := carrier_of_large_line A.carriers P hP s hs hbig
    obtain ⟨i,hi,he⟩ := A.carrierAt_surjective hk c hc
    refine ⟨i,Finset.mem_range.mpr hi,?_⟩
    have h := hcount i hi
    rw [he,hcs] at h
    exact h.symm
  · rintro ⟨i,hi,rfl⟩
    have hik := Finset.mem_range.mp hi
    exact ⟨hasLineSize_of_carrier_count P _ (d i) (hcount i hik)
      (by have := hlarge i hik; omega),hlarge i hik⟩

theorem exists_large_record_iff (n : ℕ) (S : Finset ℕ) :
    (∃ P : Finset Point, P.card=n ∧ largeLineSizeRecord P=S) ↔
      (∀ s ∈ S, 3 ≤ s) ∧ tupleCost S ≤ n := by
  constructor
  · rintro ⟨P,hP,hrecord⟩
    have hlarge : ∀ s ∈ S, 3 ≤ s := by
      intro s hs
      rw [← hrecord] at hs
      exact ((mem_largeLineSizeRecord P s).mp hs).2
    refine ⟨hlarge,?_⟩
    rw [tupleCost,← hP]
    apply realizable_cost_le P (tupleAt S) S.card
    · intro i hi
      have hs := tupleAt_mem S i hi
      rw [← hrecord] at hs
      exact ((mem_largeLineSizeRecord P _).mp hs).1
    · intro i j hij hj
      exact (tupleAt_decreasing S i j hij hj).ne'
  · rintro ⟨hlarge,hcost⟩
    obtain ⟨A,hk,P,hP,hcard,hcounts⟩ := exists_padded_carrier_realization
      (tupleAt S) S.card n (tupleAt_decreasing S) hcost
    refine ⟨P,hcard,?_⟩
    rw [large_record_of_carrier_realization A S.card hk P (tupleAt S) hP hcounts
      (tupleAt_ge_three S hlarge),tupleAt_image_range]

theorem feasibleSizes_iff_realizable (n : ℕ) (S : Finset ℕ) :
    S ∈ feasibleSizes n ↔
      ∃ P : Finset Point, P.card=n ∧ largeLineSizeRecord P=S := by
  rw [mem_feasibleSizes,exists_large_record_iff]

end LineSize
