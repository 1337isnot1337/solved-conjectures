module

public import Conjectures.PomeranceSarkozyActualCountMeasure
public import Conjectures.PomeranceSarkozyGrowingCutoffs
public import Conjectures.PomeranceSarkozySourceSample

@[expose] public section
namespace PomeranceSarkozy

open Filter Finset MeasureTheory
open scoped ENNReal Topology Classical

/-- The restricted prime counts of a single arithmetic sample. -/
def sourceOffsetCountVector (I P : Finset ℕ) (n : ℕ) : ↥I → ℕ :=
  fun h => restrictedPrimeCount P (n - h.val)

private theorem literalOffsetCount_eq_sourceOffsetCountVector (I P : Finset ℕ) (L N : ℕ)
    (j : Fin N) (hP : ∀ p ∈ P, p.Prime) (hI : ∀ h ∈ I, h < L) :
    literalOffsetCount I P L N j = sourceOffsetCountVector I P (L + j.val) := by
  funext h
  unfold literalOffsetCount sourceOffsetCountVector restrictedPrimeCount
  congr 1
  ext p
  simp only [Finset.mem_filter, Finset.mem_inter, Nat.mem_primeFactors]
  have hne : L + j.val - h.val ≠ 0 := by have := hI h.val h.property; omega
  exact ⟨fun ⟨hp, hdvd⟩ => ⟨hp, hP p hp, hdvd, hne⟩,
    fun ⟨hp, _, hdvd, _⟩ => ⟨hp, hdvd⟩⟩

/-- The arithmetic window is exactly the uniform law on its consecutive sample indices. -/
theorem sourceWindowSample_eq_map_window (X : ℕ) :
    (sourceWindowSample X : Measure ℕ) =
      (Measure.uniformOfFinset (Finset.univ : Finset (Fin (psLength X)))).map
        (fun j => psStart X + j.val) := by
  let L := psStart X
  let N := psLength X
  have hL : L ≤ X := ceil_sqrt_le_nat X
  have hN : N = X + 1 - L := rfl
  ext A hA
  change Measure.uniformOfFinset (Icc L X) A =
    ((Measure.uniformOfFinset (Finset.univ : Finset (Fin N))).map
      (fun j => L + j.val)) A
  rw [Measure.map_apply (.of_discrete) hA, Measure.uniformOfFinset_apply,
    Measure.uniformOfFinset_apply, Finset.card_univ, Fintype.card_fin, Nat.card_Icc]
  change ((((Icc L X).filter fun n => n ∈ A).card : ℕ) : ℝ≥0∞) / N =
    ((((Finset.univ : Finset (Fin N)).filter fun j => L + j.val ∈ A).card : ℕ) : ℝ≥0∞) / N
  congr 2
  symm
  refine Finset.card_bij (fun j _ => L + j.val) ?_ ?_ ?_
  · intro j hj
    exact Finset.mem_filter.mpr
      ⟨Finset.mem_Icc.mpr ⟨by omega, by have := j.isLt; omega⟩, (Finset.mem_filter.mp hj).2⟩
  · intro j _ k _ he
    exact Fin.ext (by omega)
  · intro n hn
    obtain ⟨hnI, hnA⟩ := Finset.mem_filter.mp hn
    obtain ⟨hnL, hnX⟩ := Finset.mem_Icc.mp hnI
    let j : Fin N := ⟨n - L, by omega⟩
    have he : L + j.val = n := by dsimp [j]; omega
    exact ⟨j, Finset.mem_filter.mpr ⟨Finset.mem_univ _, he ▸ hnA⟩, he⟩

/-- The literal count-vector law uses the same arithmetic window as `sourceWindowSample`. -/
theorem sourceWindowSample_offsetCount_event (X : ℕ) (I P : Finset ℕ)
    (hP : ∀ p ∈ P, p.Prime) (hI : ∀ h ∈ I, h < psStart X)
    (A : Set (↥I → ℕ)) :
    (sourceWindowSample X : Measure ℕ).real (sourceOffsetCountVector I P ⁻¹' A) =
      (arithmeticOffsetCountMeasure I P (psStart X) (psLength X)).real A := by
  rw [sourceWindowSample_eq_map_window, measureReal_def, measureReal_def,
    arithmeticOffsetCountMeasure, Measure.map_apply (.of_discrete) (Set.to_countable _).measurableSet,
    Measure.map_apply (.of_discrete) A.to_countable.measurableSet]
  congr 2
  ext j
  change sourceOffsetCountVector I P (psStart X + j.val) ∈ A ↔
      literalOffsetCount I P (psStart X) (psLength X) j ∈ A
  rw [literalOffsetCount_eq_sourceOffsetCountVector _ _ _ _ j hP hI]

/-- Number of coordinates exceeding their own offset threshold, plus the zero offset. -/
def offsetThresholdStatistic {I : Finset ℕ} (x : ↥I → ℕ) : ℕ :=
  1 + (Finset.univ.filter fun h : ↥I => h.val < x h).card

/-- On a sample above every offset, the truncated arithmetic statistic is the count-vector statistic. -/
theorem offsetThresholdStatistic_sourceOffsetCountVector (P : Finset ℕ) (n H : ℕ)
    (hH : H < n) :
    offsetThresholdStatistic (sourceOffsetCountVector (Icc 1 H) P n) =
      1 + (truncatedOffsets P n H).card := by
  unfold offsetThresholdStatistic truncatedOffsets
  congr 1
  refine Finset.card_bij (fun h _ => h.val) ?_ ?_ ?_
  · intro h hm
    exact Finset.mem_filter.mpr ⟨h.property, (Finset.mem_Icc.mp h.property).2.trans_lt hH,
      (Finset.mem_filter.mp hm).2⟩
  · intro h _ k _ hk
    exact Subtype.ext hk
  · intro h hh
    obtain ⟨hI, _, hw⟩ := Finset.mem_filter.mp hh
    exact ⟨⟨h, hI⟩, Finset.mem_filter.mpr ⟨Finset.mem_univ _, hw⟩, rfl⟩

/-- The error between the original and the truncated arithmetic counts. -/
noncomputable def sourceTruncationError (X n : ℕ) : ℝ :=
  (sourceG n : ℝ) - (1 + (truncatedOffsets (psPrimes X) n (psH X)).card : ℕ)

/-- Real probabilities of events under the finite sample only depend on its support. -/
private theorem sourceWindowSample_real_le_of_subset_on_window (X : ℕ) (A B : Set ℕ)
    (hAB : ∀ n ∈ Icc (psStart X) X, n ∈ A → n ∈ B) :
    (sourceWindowSample X : Measure ℕ).real A ≤ (sourceWindowSample X : Measure ℕ).real B := by
  rw [sourceWindowSample_real, sourceWindowSample_real]
  apply div_le_div_of_nonneg_right _ (by positivity)
  have hSub : ((Icc (psStart X) X).filter fun n => n ∈ A) ⊆
      ((Icc (psStart X) X).filter fun n => n ∈ B) := by
    intro n hn
    obtain ⟨hWindow, hA⟩ := Finset.mem_filter.mp hn
    exact Finset.mem_filter.mpr ⟨hWindow, hAB n hWindow hA⟩
  exact_mod_cast Finset.card_le_card hSub

/-- The probability of a large truncation error is at most the sum of the three bad-event
probabilities in the written proof. This finite step uses the exact original arithmetic count. -/
theorem sourceTruncation_error_event_le (X B : ℕ) {s t : ℝ} (hs : 0 < s)
    (hStart : 1 < psStart X) :
    (sourceWindowSample X : Measure ℕ).real {n | t ≤ |sourceTruncationError X n / s|} ≤
      (sourceWindowSample X : Measure ℕ).real
        {n | ∃ h ∈ sourceOffsetEvents n, psH X < h} +
      (sourceWindowSample X : Measure ℕ).real
        {n | ∃ h ∈ psOffsets X, h < n ∧
          restrictedPrimeCount (psPrimes X) (n - h) + B < distinctPrimeCount (n - h)} +
      (sourceWindowSample X : Measure ℕ).real
        {n | t * s ≤ ((thresholdBand (psPrimes X) n (psH X) B).card : ℝ)} := by
  let μ : Measure ℕ := sourceWindowSample X
  let A : Set ℕ := {n | ∃ h ∈ sourceOffsetEvents n, psH X < h}
  let C : Set ℕ := {n | ∃ h ∈ psOffsets X, h < n ∧
    restrictedPrimeCount (psPrimes X) (n - h) + B < distinctPrimeCount (n - h)}
  let D : Set ℕ := {n | t * s ≤ ((thresholdBand (psPrimes X) n (psH X) B).card : ℝ)}
  change μ.real _ ≤ μ.real A + μ.real C + μ.real D
  calc
    _ ≤ μ.real ((A ∪ C) ∪ D) := by
      apply sourceWindowSample_real_le_of_subset_on_window
      intro n hn hError
      by_cases hnA : n ∈ A
      · exact Or.inl (Or.inl hnA)
      by_cases hnC : n ∈ C
      · exact Or.inl (Or.inr hnC)
      have hn1 := hStart.trans_le (Finset.mem_Icc.mp hn).1
      have hTail (h : ℕ) (hh : h ∈ (sourceOffsetEvents n).erase 0) : h ≤ psH X :=
        le_of_not_gt fun hgt => hnA ⟨h, (Finset.mem_erase.mp hh).2, hgt⟩
      have hSmall (h : ℕ) (hh : h ∈ Icc 1 (psH X)) (hhn : h < n) :
          distinctPrimeCount (n - h) ≤ restrictedPrimeCount (psPrimes X) (n - h) + B :=
        le_of_not_gt fun hgt => hnC ⟨h, hh, hhn, hgt⟩
      obtain ⟨hlo, hhi⟩ := sourceG_truncation_bounds (psPrimes X) hn1 (psH X) B hTail hSmall
      have hlo' : 0 ≤ sourceTruncationError X n := by
        unfold sourceTruncationError
        exact sub_nonneg.mpr (by exact_mod_cast hlo)
      have hhi' : sourceTruncationError X n ≤ (thresholdBand (psPrimes X) n (psH X) B).card := by
        unfold sourceTruncationError
        apply sub_le_iff_le_add.mpr
        rw [add_comm]
        exact_mod_cast hhi
      change t ≤ |sourceTruncationError X n / s| at hError
      rw [abs_of_nonneg (div_nonneg hlo' hs.le)] at hError
      exact Or.inr (((le_div_iff₀ hs).mp hError).trans hhi')
    _ ≤ μ.real A + μ.real C + μ.real D :=
      (measureReal_union_le _ _).trans (add_le_add (measureReal_union_le A C) le_rfl)

end PomeranceSarkozy
