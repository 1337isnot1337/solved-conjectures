module

public import Conjectures.PomeranceSarkozyStatisticBridge
public import Conjectures.PomeranceSarkozyModelBandProbability
public import Conjectures.PomeranceSarkozyOmittedPrimeDecay
public import Conjectures.PomeranceSarkozyGrowingEvent
public import Conjectures.PomeranceSarkozyGrowingDiscardedOffsets
public import Conjectures.PomeranceSarkozyOmittedPrimeEvent
public import Conjectures.PomeranceSarkozySourceSample

@[expose] public section
namespace PomeranceSarkozy

open Filter Finset MeasureTheory ProbabilityTheory
open scoped ENNReal Topology Classical

/-- The restricted prime counts of a single arithmetic sample. -/
def sourceOffsetCountVector (I P : Finset ℕ) (n : ℕ) : ↥I → ℕ :=
  fun h => restrictedPrimeCount P (n - h.val)

private theorem literalOffsetCount_eq_sourceOffsetCountVector (I P : Finset ℕ) (L N : ℕ)
    (j : Fin N) (hP : ∀ p ∈ P, p.Prime) (hI : ∀ h ∈ I, h < L) :
    literalOffsetCount I P L N j = sourceOffsetCountVector I P (L + j.val) := by
  funext h
  exact literalOffsetCount_eq_restrictedPrimeCount I P hP L N j h
    ((hI h.val h.property).trans_le (Nat.le_add_right _ _))

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

theorem psWindowStart_gt : ∀ᶠ X in atTop, 1 < psStart X ∧ psH X < psStart X := by
  have hLog := (isLittleO_log_rpow_atTop (by norm_num : (0 : ℝ) < 1 / 2)).bound
    (by norm_num : (0 : ℝ) < 1 / 20)
  filter_upwards [tendsto_natCast_atTop_atTop.eventually hLog,
    psL_tendsto.eventually_ge_atTop 0, eventually_gt_atTop (1 : ℕ)] with X hlog hL hX
  have hXr : (1 : ℝ) < X := by exact_mod_cast hX
  have hlogX := Real.log_nonneg hXr.le
  simp only [Real.norm_eq_abs, abs_of_nonneg hlogX, ← Real.sqrt_eq_rpow,
    abs_of_nonneg (Real.sqrt_nonneg _)] at hlog
  have hLlog : psL X ≤ Real.log X := Real.log_le_self hlogX
  have hfloor := Nat.floor_le (show 0 ≤ 10 * psL X by positivity)
  have hceil := Nat.le_ceil (Real.sqrt (X : ℝ))
  have hsqrt : 1 < Real.sqrt (X : ℝ) := by simpa using Real.sqrt_lt_sqrt (zero_le_one : (0 : ℝ) ≤ 1) hXr
  constructor
  · exact_mod_cast hsqrt.trans_le hceil
  · change ⌊10 * psL X⌋₊ < ⌈Real.sqrt (X : ℝ)⌉₊
    exact_mod_cast (show (⌊10 * psL X⌋₊ : ℝ) < (⌈Real.sqrt (X : ℝ)⌉₊ : ℝ) by linarith)

private theorem thresholdBand_card_le_vector (P : Finset ℕ) (n H B : ℕ) :
    (thresholdBand P n H B).card ≤
      nearThresholdBandCount B (sourceOffsetCountVector (Icc 1 H) P n) := by
  let e : ↥(Icc 1 H) ↪ ℕ := ⟨Subtype.val, Subtype.val_injective⟩
  let S := Finset.univ.filter fun h : ↥(Icc 1 H) =>
    h.val ≤ restrictedPrimeCount P (n - h.val) + B ∧
      restrictedPrimeCount P (n - h.val) ≤ h.val + B
  have hSub : thresholdBand P n H B ⊆ S.map e := by
    intro h hh
    obtain ⟨hI, _, hlow, hhigh⟩ := Finset.mem_filter.mp hh
    refine Finset.mem_map.mpr ⟨⟨h, hI⟩, Finset.mem_filter.mpr ⟨Finset.mem_univ _, ?_⟩, rfl⟩
    exact ⟨hhigh.le, hlow.trans (Nat.le_add_right _ _)⟩
  have hCard := Finset.card_le_card hSub
  rw [Finset.card_map] at hCard
  convert hCard using 1
  unfold nearThresholdBandCount
  congr 1

/-- Pushforward events of the truncated arithmetic count are exact count-vector events. -/
theorem sourceWindowSample_truncatedCount_event (X : ℕ) (hH : psH X < psStart X)
    (A : Set ℕ) :
    (sourceWindowSample X : Measure ℕ).real
      {n | 1 + (truncatedOffsets (psPrimes X) n (psH X)).card ∈ A} =
      (arithmeticOffsetCountMeasure (psOffsets X) (psPrimes X) (psStart X) (psLength X)).real
        (offsetThresholdStatistic ⁻¹' A) := by
  have hP (p : ℕ) (hp : p ∈ psPrimes X) : p.Prime := (Finset.mem_filter.mp hp).2
  have hI (h : ℕ) (hh : h ∈ psOffsets X) : h < psStart X :=
    (Finset.mem_Icc.mp hh).2.trans_lt hH
  rw [← sourceWindowSample_offsetCount_event X (psOffsets X) (psPrimes X) hP hI,
    sourceWindowSample_real, sourceWindowSample_real]
  congr 2
  apply congrArg Finset.card
  ext n
  simp only [Finset.mem_filter, Set.mem_ofPred_eq, Set.mem_preimage]
  refine and_congr_right_iff.mpr fun hn => ?_
  rw [psOffsets, offsetThresholdStatistic_sourceOffsetCountVector (psPrimes X) n (psH X)
    (hH.trans_le (Finset.mem_Icc.mp hn).1)]

/-- The probability of a large arithmetic threshold band is bounded by its count-vector event. -/
theorem sourceWindowSample_band_probability_le (X B : ℕ) (t : ℝ) (hH : psH X < psStart X) :
    (sourceWindowSample X : Measure ℕ).real
      {n | t ≤ ((thresholdBand (psPrimes X) n (psH X) B).card : ℝ)} ≤
      (arithmeticOffsetCountMeasure (psOffsets X) (psPrimes X) (psStart X) (psLength X)).real
        {x | t ≤ (nearThresholdBandCount B x : ℝ)} := by
  have hP (p : ℕ) (hp : p ∈ psPrimes X) : p.Prime := (Finset.mem_filter.mp hp).2
  have hI (h : ℕ) (hh : h ∈ psOffsets X) : h < psStart X :=
    (Finset.mem_Icc.mp hh).2.trans_lt hH
  rw [← sourceWindowSample_offsetCount_event X (psOffsets X) (psPrimes X) hP hI]
  apply sourceWindowSample_real_le_of_subset_on_window
  intro n _ hn
  change t ≤ ((thresholdBand (psPrimes X) n (psH X) B).card : ℝ) at hn
  change t ≤ (nearThresholdBandCount B (sourceOffsetCountVector (psOffsets X) (psPrimes X) n) : ℝ)
  exact hn.trans (by exact_mod_cast thresholdBand_card_le_vector (psPrimes X) n (psH X) B)

/-- If the two arithmetic tails vanish and the count-vector event comparison holds,
the actual arithmetic count and the truncated count differ by `oₚ(L^(1/4))`. -/
theorem sourceTruncation_error_tendsto_of_events
    (hTail : Tendsto (fun X => (sourceWindowSample X : Measure ℕ).real
      {n | ∃ h ∈ sourceOffsetEvents n, psH X < h}) atTop (𝓝 0))
    (hSmall : Tendsto (fun X => (sourceWindowSample X : Measure ℕ).real
      {n | ∃ h ∈ psOffsets X, h < n ∧
        restrictedPrimeCount (psPrimes X) (n - h) + psBandWidth X < distinctPrimeCount (n - h)})
      atTop (𝓝 0))
    (hCompare : ∀ A : (X : ℕ) → Set (↥(psOffsets X) → ℕ),
      Tendsto (fun X =>
        (arithmeticOffsetCountMeasure (psOffsets X) (psPrimes X) (psStart X) (psLength X)).real (A X) -
          (Measure.pi (fun _ : ↥(psOffsets X) => poissonMeasure (psRate X))).real (A X)) atTop (𝓝 0))
    {t : ℝ} (ht : 0 < t) :
    Tendsto (fun X => (sourceWindowSample X : Measure ℕ).real
      {n | t ≤ |sourceTruncationError X n / (psL X)^(1 / 4 : ℝ)|}) atTop (𝓝 0) := by
  let s (X : ℕ) : ℝ := (psL X)^(1 / 4 : ℝ)
  let A (X : ℕ) : Set (↥(psOffsets X) → ℕ) :=
    {v | t * s X ≤ (nearThresholdBandCount (psBandWidth X) v : ℝ)}
  let arith (X : ℕ) : ℝ :=
    (arithmeticOffsetCountMeasure (psOffsets X) (psPrimes X) (psStart X) (psLength X)).real (A X)
  let model (X : ℕ) : ℝ :=
    (Measure.pi (fun _ : ↥(psOffsets X) => poissonMeasure (psRate X))).real (A X)
  have hs : ∀ᶠ X in atTop, 0 < s X :=
    (psL_tendsto.eventually_gt_atTop 0).mono fun _ hx => Real.rpow_pos_of_pos hx _
  have hwidth : Tendsto (fun X => (2 * (psBandWidth X : ℝ) + 1) / (t * s X)) atTop (𝓝 0) := by
    have hupper : Tendsto (fun X => (2 / t) * (((psBandWidth X : ℝ) + 1) / s X)) atTop (𝓝 0) := by
      simpa only [mul_zero] using psBandWidth_quarter.const_mul (2 / t)
    refine squeeze_zero' (hs.mono fun X hX => by positivity) ?_ hupper
    filter_upwards [hs] with X hX
    rw [div_mul_eq_div_div_swap]
    calc
      (2 * (psBandWidth X : ℝ) + 1) / s X / t ≤ 2 * ((psBandWidth X : ℝ) + 1) / s X / t :=
        div_le_div_of_nonneg_right (div_le_div_of_nonneg_right (by linarith) hX.le) ht.le
      _ = (2 / t) * (((psBandWidth X : ℝ) + 1) / s X) := by ring
  have hModel : Tendsto model atTop (𝓝 0) := by
    refine squeeze_zero' (Eventually.of_forall fun _ => measureReal_nonneg) ?_ hwidth
    filter_upwards [hs] with X hX
    exact poisson_band_count_probability_le (psH X) (psBandWidth X) (psRate X) (mul_pos ht hX)
  have hArith : Tendsto arith atTop (𝓝 0) := by
    have h := (hCompare A).add hModel
    simpa only [arith, model, sub_add_cancel, add_zero] using h
  have hUpper := (hTail.add hSmall).add hArith
  simp only [add_zero] at hUpper
  refine squeeze_zero' (Eventually.of_forall fun _ => measureReal_nonneg) ?_ hUpper
  filter_upwards [hs, psWindowStart_gt] with X hX hstart
  exact (sourceTruncation_error_event_le X (psBandWidth X) hX hstart.1).trans
    (add_le_add le_rfl (sourceWindowSample_band_probability_le X (psBandWidth X) (t * s X) hstart.2))

/-- The quarter-scale discrepancy between the original arithmetic statistic and its
prime-and-offset truncation tends to zero in probability on the literal sample window. -/
theorem sourceTruncation_error_tendsto {t : ℝ} (ht : 0 < t) :
    Tendsto (fun X => (sourceWindowSample X : Measure ℕ).real
      {n | t ≤ |sourceTruncationError X n / (psL X)^(1 / 4 : ℝ)|}) atTop (𝓝 0) := by
  refine sourceTruncation_error_tendsto_of_events ?_ ?_ growing_arithmetic_poisson_event ht
  · have hEvent (X : ℕ) : (sourceWindowSample X : Measure ℕ).real
          {n | ∃ h ∈ sourceOffsetEvents n, psH X < h} = discardedOffsetProbability X (psH X) := by
      rw [sourceWindowSample_real, discardedOffsetProbability, Nat.card_Icc]
      congr 2
      apply congrArg Finset.card
      ext n
      let E : Set ℕ := {m | ∃ h ∈ sourceOffsetEvents m, psH X < h}
      exact (@Finset.mem_filter ℕ (fun m => m ∈ E) (fun m => Classical.propDecidable (m ∈ E))
        (Icc (psStart X) X) n).trans mem_discardedOffsetSamples.symm
    simpa only [hEvent] using growing_discarded_offset_probability
  · simpa only [sourceWindowSample_real, Set.mem_ofPred_eq, psStart, psLength] using
      omitted_prime_event_tendsto

end PomeranceSarkozy
