import Conjectures.LineSizeRecordRealization
import Conjectures.LineSizeOrdinary

/-! At fixed point count the large record determines the full line-size
record. Consequently the actual geometric count is exactly the tuple count. -/
noncomputable section
namespace LineSize

theorem hasLineSize_card_of_collinear (P : Finset Point)
    (hP : Collinear ℝ (P : Set Point)) (hcard : 2 ≤ P.card) :
    HasLineSize P P.card := by
  obtain ⟨a,b,ha,hb,hab⟩ := Finset.one_lt_card_iff.mp (show 1 < P.card by omega)
  exact ⟨a,ha,b,hb,hab,congrArg Finset.card
    (linePoints_eq_self_of_collinear P hP a b ha hb hab)⟩

theorem collinear_of_hasLineSize_card (P : Finset Point)
    (hs : HasLineSize P P.card) : Collinear ℝ (P : Set Point) := by
  classical
  obtain ⟨a,ha,b,hb,hab,hcard⟩ := hs
  have hpoints : linePoints P a b=P :=
    Finset.eq_of_subset_of_card_le (linePoints_subset P a b) hcard.ge
  apply (collinear_iff_of_mem (k := ℝ) (show a ∈ (P : Set Point) from ha)).mpr
  refine ⟨(b -ᵥ a : Point),?_⟩
  intro q hq
  have hline : q ∈ line[ℝ,a,b] :=
    ((mem_linePoints P a b q).mp (hpoints.symm ▸ hq)).2
  obtain ⟨t,ht⟩ := mem_affineSpan_pair_iff_exists_lineMap_eq.mp hline
  exact ⟨t,by simpa only [AffineMap.lineMap_apply] using ht.symm⟩

theorem lineSizeRecord_eq_singleton_of_collinear (P : Finset Point)
    (hP : Collinear ℝ (P : Set Point)) (hcard : 2 ≤ P.card) :
    lineSizeRecord P={P.card} := by
  ext s
  rw [mem_lineSizeRecord,Finset.mem_singleton]
  constructor
  · exact hasLineSize_eq_card_of_collinear P hP
  · rintro rfl
    exact hasLineSize_card_of_collinear P hP hcard

theorem full_record_eq_of_no_two (P Q : Finset Point)
    (hcard : 2 ≤ P.card) (hcards : P.card=Q.card)
    (hlarge : largeLineSizeRecord P=largeLineSizeRecord Q)
    (hno : ¬HasLineSize P 2) : lineSizeRecord P=lineSizeRecord Q := by
  have hPcol : Collinear ℝ (P : Set Point) := by
    by_contra hn
    exact hno (ordinary_line_exists P hn)
  have hPfull := hasLineSize_card_of_collinear P hPcol hcard
  have hbig : 3 ≤ P.card := by
    by_contra hn
    have he : P.card=2 := by omega
    exact hno (he ▸ hPfull)
  have hQfull : HasLineSize Q P.card := by
    apply ((mem_largeLineSizeRecord Q P.card).mp ?_).1
    rw [← hlarge]
    exact (mem_largeLineSizeRecord P P.card).mpr ⟨hPfull,hbig⟩
  have hQcol : Collinear ℝ (Q : Set Point) :=
    collinear_of_hasLineSize_card Q (hcards ▸ hQfull)
  rw [lineSizeRecord_eq_singleton_of_collinear P hPcol hcard,
    lineSizeRecord_eq_singleton_of_collinear Q hQcol (by omega),hcards]

theorem lineSizeRecord_eq_of_large_eq (P Q : Finset Point)
    (hcards : P.card=Q.card)
    (hlarge : largeLineSizeRecord P=largeLineSizeRecord Q) :
    lineSizeRecord P=lineSizeRecord Q := by
  by_cases hsmall : P.card ≤ 1
  · rw [lineSizeRecord_eq_empty_of_card_le_one P hsmall,
      lineSizeRecord_eq_empty_of_card_le_one Q (by omega)]
  · have hcard : 2 ≤ P.card := by omega
    by_cases hPtwo : HasLineSize P 2
    · by_cases hQtwo : HasLineSize Q 2
      · rw [lineSizeRecord_eq_insert_two P hPtwo,
          lineSizeRecord_eq_insert_two Q hQtwo,hlarge]
      · exact (full_record_eq_of_no_two Q P (by omega) hcards.symm
          hlarge.symm hQtwo).symm
    · exact full_record_eq_of_no_two P Q hcard hcards hlarge hPtwo

def recordLargePart (record : Finset ℕ) : Finset ℕ := record.filter (3 ≤ ·)

@[simp] theorem recordLargePart_lineSizeRecord (P : Finset Point) :
    recordLargePart (lineSizeRecord P)=largeLineSizeRecord P := rfl

theorem recordLargePart_injOn_attainable (n : ℕ) :
    Set.InjOn recordLargePart (attainableRecords n : Set (Finset ℕ)) := by
  intro R hR S hS hRS
  obtain ⟨P,hP,hPR⟩ := (mem_attainableRecords n R).mp hR
  obtain ⟨Q,hQ,hQS⟩ := (mem_attainableRecords n S).mp hS
  have hlarge : largeLineSizeRecord P=largeLineSizeRecord Q := by
    rw [← recordLargePart_lineSizeRecord,← recordLargePart_lineSizeRecord,hPR,hQS]
    exact hRS
  exact hPR.symm.trans ((lineSizeRecord_eq_of_large_eq P Q (by omega) hlarge).trans hQS)

theorem attainable_large_records (n : ℕ) :
    (attainableRecords n).image recordLargePart=feasibleSizes n := by
  ext S
  rw [Finset.mem_image,feasibleSizes_iff_realizable]
  constructor
  · rintro ⟨R,hR,hRS⟩
    obtain ⟨P,hP,hPR⟩ := (mem_attainableRecords n R).mp hR
    refine ⟨P,hP,?_⟩
    rw [← recordLargePart_lineSizeRecord,hPR,hRS]
  · rintro ⟨P,hP,hPS⟩
    exact ⟨lineSizeRecord P,(mem_attainableRecords n _).mpr ⟨P,hP,rfl⟩,hPS⟩

theorem lineSizeCount_eq_tupleCount (n : ℕ) : lineSizeCount n=tupleCount n := by
  unfold lineSizeCount tupleCount
  rw [← attainable_large_records]
  exact (Finset.card_image_of_injOn (recordLargePart_injOn_attainable n)).symm

end LineSize
