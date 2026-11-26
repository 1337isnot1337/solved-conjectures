module
public import Conjectures.PomeranceSarkozyOffsets
public import Conjectures.PomeranceSarkozySourceSample
public import Mathlib.Analysis.Asymptotics.Lemmas
public import Mathlib.Analysis.SpecialFunctions.Pow.Asymptotics
public import Mathlib.MeasureTheory.Measure.Prokhorov

@[expose] public section
namespace PomeranceSarkozy

open Filter MeasureTheory
open scoped Asymptotics ENNReal Topology

private theorem counting_proportion_le_add_of_tail_imp {p q : ℕ → Prop}
    [DecidablePred p] [DecidablePred q] {N : ℕ} (hN : ∀ n ≥ N, p n → q n) (X : ℕ) :
    (((Finset.Icc 1 X).filter p).card : ℝ) / X ≤
      (((Finset.Icc 1 X).filter q).card : ℝ) / X + (N : ℝ) / X := by
  have hcard :
      ((Finset.Icc 1 X).filter p).card ≤ ((Finset.Icc 1 X).filter q).card + N := by
    have hsub : (Finset.Icc 1 X).filter p ⊆ (Finset.Icc 1 X).filter q ∪ Finset.range N := by
      intro n hn
      obtain ⟨hin, hp⟩ := Finset.mem_filter.mp hn
      by_cases hlarge : N ≤ n
      · exact Finset.mem_union_left _ (Finset.mem_filter.mpr ⟨hin, hN n hlarge hp⟩)
      · exact Finset.mem_union_right _ (Finset.mem_range.mpr (lt_of_not_ge hlarge))
    refine (Finset.card_le_card hsub).trans ?_
    simpa only [Finset.card_range] using
      (Finset.card_union_le ((Finset.Icc 1 X).filter q) (Finset.range N))
  rw [← add_div]
  exact div_le_div_of_nonneg_right (by exact_mod_cast hcard) (Nat.cast_nonneg X)

private theorem tendsto_cutoff_div (N : ℕ) :
    Tendsto (fun X : ℕ ↦ (N : ℝ) / X) atTop (𝓝 0) :=
  tendsto_const_nhds.div_atTop tendsto_natCast_atTop_atTop

/-- An eventual implication transfers a zero-density bound. The finitely many earlier
indices contribute at most the cutoff divided by the sample size. -/
theorem tendsto_counting_proportion_of_eventually_imp {p q : ℕ → Prop}
    [DecidablePred p] [DecidablePred q] (hpq : ∀ᶠ n in atTop, p n → q n)
    (hq : Tendsto (fun X : ℕ ↦ (((Finset.Icc 1 X).filter q).card : ℝ) / X) atTop (𝓝 0)) :
    Tendsto (fun X : ℕ ↦ (((Finset.Icc 1 X).filter p).card : ℝ) / X) atTop (𝓝 0) := by
  obtain ⟨N, hN⟩ := eventually_atTop.mp hpq
  refine squeeze_zero (fun X ↦ div_nonneg (Nat.cast_nonneg _) (Nat.cast_nonneg X)) ?_
    (by simpa only [add_zero] using hq.add (tendsto_cutoff_div N))
  exact counting_proportion_le_add_of_tail_imp hN

open scoped Classical in
/-- A square-root error estimate on a density-one set implies the empirical
convergence in probability for the literal source counting function. -/
theorem source_sqrt_converges_in_probability_of_density_one (s : Set ℕ)
    (hDensity : Tendsto (fun X : ℕ ↦
      (((Finset.Icc 1 X).filter fun n ↦ n ∉ s).card : ℝ) / X) atTop (𝓝 0))
    (hEstimate : (fun n : ℕ ↦ (sourceG n : ℝ) - Real.log (Real.log n)) =o[atTop ⊓ 𝓟 s]
      (fun n : ℕ ↦ Real.sqrt (Real.log (Real.log n)))) (ε : ℝ) (hε : 0 < ε) :
    Tendsto (fun X : ℕ ↦ (((Finset.Icc 1 X).filter fun n ↦
      ε < |((sourceG n : ℝ) - Real.log (Real.log n)) / Real.sqrt (Real.log (Real.log n))|).card : ℝ) /
      X) atTop (𝓝 0) := by
  have hsmall := hEstimate.tendsto_div_nhds_zero
  have hzero : |(0 : ℝ)| < ε := by simpa only [abs_zero] using hε
  have hnear := hsmall.abs.eventually (gt_mem_nhds hzero)
  refine tendsto_counting_proportion_of_eventually_imp ?_ hDensity
  filter_upwards [eventually_inf_principal.mp hnear] with n hn hbad hs
  exact lt_asymm hbad (hn hs)

open scoped Classical in
/-- A weak limit for the quarter-root normalization forces the square-root
exceedance proportions to tend to zero. -/
theorem source_sqrt_converges_in_probability_of_quarter_weak_limit
    {μ : ProbabilityMeasure ℝ}
    (hQuarter : Tendsto (fun X : ℕ ↦ (sourceFullSample X).map (fun n : ℕ ↦
      ((sourceG n : ℝ) - Real.log (Real.log n)) / Real.log (Real.log n) ^ (1 / 4 : ℝ)))
      atTop (𝓝 μ)) (ε : ℝ) (hε : 0 < ε) :
    Tendsto (fun X : ℕ ↦ (((Finset.Icc 1 X).filter fun n ↦
      ε < |((sourceG n : ℝ) - Real.log (Real.log n)) / Real.sqrt (Real.log (Real.log n))|).card : ℝ) /
      X) atTop (𝓝 0) := by
  let L (n : ℕ) := Real.log (Real.log n)
  let f (n : ℕ) := ((sourceG n : ℝ) - L n) / L n ^ (1 / 4 : ℝ)
  let p (n : ℕ) := ε < |((sourceG n : ℝ) - L n) / Real.sqrt (L n)|
  let ν (X : ℕ) := (sourceFullSample X).map f
  change Tendsto (fun X : ℕ ↦ (((Finset.Icc 1 X).filter p).card : ℝ) / X) atTop (𝓝 0)
  have hc : IsCompact (closure (Set.range ν)) :=
    hQuarter.isCompact_insert_range.of_isClosed_subset isClosed_closure
      (closure_minimal (Set.subset_insert μ _) hQuarter.isCompact_insert_range.isClosed)
  have ht := isTightMeasureSet_of_isCompact_closure hc
  have hL : Tendsto L atTop atTop :=
    Real.tendsto_log_atTop.comp (Real.tendsto_log_atTop.comp tendsto_natCast_atTop_atTop)
  have hscale : Tendsto (fun n ↦ L n ^ (1 / 4 : ℝ)) atTop atTop :=
    (tendsto_rpow_atTop (by norm_num : 0 < (1 / 4 : ℝ))).comp hL
  refine tendsto_order.mpr ⟨fun δ hδ ↦ Eventually.of_forall (fun X ↦
    hδ.trans_le (div_nonneg (Nat.cast_nonneg _) (Nat.cast_nonneg X))), ?_⟩
  intro δ hδ
  have hδhalf : 0 < δ / 2 := half_pos hδ
  obtain ⟨K, hK, hmass⟩ := isTightMeasureSet_iff_exists_isCompact_measure_compl_le.mp ht
    (ENNReal.ofReal (δ / 2)) (ENNReal.ofReal_pos.mpr hδhalf)
  obtain ⟨R, hR⟩ := hK.bddAbove_image (continuous_abs : Continuous (fun x : ℝ ↦ |x|)).continuousOn
  have hpoint : ∀ᶠ n in atTop, p n → n ∈ f ⁻¹' Kᶜ := by
    filter_upwards [hL.eventually_gt_atTop 0, hscale.eventually_ge_atTop (R / ε)]
      with n hn hRscale hbad hmem
    have hroot : Real.sqrt (L n) = L n ^ (1 / 4 : ℝ) * L n ^ (1 / 4 : ℝ) := by
      rw [Real.sqrt_eq_rpow, ← Real.rpow_add hn]
      congr 1
      norm_num
    have hscale_pos : 0 < L n ^ (1 / 4 : ℝ) := Real.rpow_pos_of_pos hn _
    have hRε : R ≤ ε * L n ^ (1 / 4 : ℝ) := by
      simpa only [mul_comm] using (div_le_iff₀ hε).mp hRscale
    change ε < |((sourceG n : ℝ) - L n) / Real.sqrt (L n)| at hbad
    rw [hroot, ← div_div, abs_div, abs_of_pos hscale_pos] at hbad
    exact (not_lt_of_ge (hR (Set.mem_image_of_mem abs hmem)))
      (hRε.trans_lt ((lt_div_iff₀ hscale_pos).mp hbad))
  obtain ⟨N, hN⟩ := eventually_atTop.mp hpoint
  have htail (X : ℕ) (hX : 0 < X) :
      (((Finset.Icc 1 X).filter fun n ↦ n ∈ f ⁻¹' Kᶜ).card : ℝ) / X ≤ δ / 2 := by
    have hbound : (ν X : Measure ℝ) Kᶜ ≤ ENNReal.ofReal (δ / 2) :=
      hmass _ ⟨ν X, Set.mem_range_self X, rfl⟩
    rw [← sourceFullSample_real hX (f ⁻¹' Kᶜ), measureReal_def]
    rw [← (sourceFullSample X).map_apply' Measurable.of_discrete.aemeasurable
      hK.isClosed.measurableSet.compl]
    exact (ENNReal.toReal_mono ENNReal.ofReal_ne_top hbound).trans_eq
      (ENNReal.toReal_ofReal hδhalf.le)
  filter_upwards [eventually_gt_atTop (0 : ℕ), (tendsto_cutoff_div N).eventually_lt_const hδhalf]
    with X hX hcutoff
  exact (counting_proportion_le_add_of_tail_imp hN X).trans_lt (by linarith [htail X hX])

end PomeranceSarkozy
