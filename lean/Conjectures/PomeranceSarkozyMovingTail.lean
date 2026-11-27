module

public import Conjectures.PomeranceSarkozySourceSample
public import Mathlib.MeasureTheory.Measure.Prokhorov

@[expose] public section
namespace PomeranceSarkozy

open Filter MeasureTheory
open scoped Classical ENNReal Topology

/-- A weak empirical limit forces the exceedances of a diverging cutoff to have density zero. -/
theorem source_moving_cutoff_zero_density (f b : ℕ → ℝ) {μ : ProbabilityMeasure ℝ}
    (h : Tendsto (fun X : ℕ => (sourceFullSample X).map f) atTop (𝓝 μ))
    (hb : Tendsto b atTop atTop) :
    Tendsto (fun X : ℕ => (((Finset.Icc 1 X).filter fun n => b n < |f n|).card : ℝ) / X)
      atTop (𝓝 0) := by
  let ν (X : ℕ) := (sourceFullSample X).map f
  have hc : IsCompact (closure (Set.range ν)) :=
    h.isCompact_insert_range.of_isClosed_subset isClosed_closure
      (closure_minimal (Set.subset_insert μ _) h.isCompact_insert_range.isClosed)
  have ht := isTightMeasureSet_of_isCompact_closure hc
  refine tendsto_order.mpr ⟨fun δ hδ => Eventually.of_forall (fun X =>
    hδ.trans_le (div_nonneg (Nat.cast_nonneg _) (Nat.cast_nonneg X))), ?_⟩
  intro δ hδ
  have hδhalf : 0 < δ / 2 := half_pos hδ
  obtain ⟨K, hK, hmass⟩ := isTightMeasureSet_iff_exists_isCompact_measure_compl_le.mp ht
    (ENNReal.ofReal (δ / 2)) (ENNReal.ofReal_pos.mpr hδhalf)
  obtain ⟨R, hR⟩ := hK.bddAbove_image
    (continuous_abs : Continuous (fun x : ℝ => |x|)).continuousOn
  obtain ⟨N, hN⟩ := eventually_atTop.mp (hb.eventually_ge_atTop R)
  let A : Set ℕ := f ⁻¹' Kᶜ
  have htail (X : ℕ) (hX : 0 < X) :
      (((Finset.Icc 1 X).filter fun n => n ∈ A).card : ℝ) / X ≤ δ / 2 := by
    have hbound : (ν X : Measure ℝ) Kᶜ ≤ ENNReal.ofReal (δ / 2) :=
      hmass _ ⟨ν X, Set.mem_range_self X, rfl⟩
    rw [← sourceFullSample_real hX A, measureReal_def]
    change ((sourceFullSample X : Measure ℕ) (f ⁻¹' Kᶜ)).toReal ≤ δ / 2
    rw [← (sourceFullSample X).map_apply' Measurable.of_discrete.aemeasurable
      hK.isClosed.measurableSet.compl]
    exact (ENNReal.toReal_mono ENNReal.ofReal_ne_top hbound).trans_eq
      (ENNReal.toReal_ofReal hδhalf.le)
  have hprefix : Tendsto (fun X : ℕ => (N : ℝ) / X) atTop (𝓝 0) :=
    tendsto_const_nhds.div_atTop tendsto_natCast_atTop_atTop
  filter_upwards [eventually_gt_atTop (0 : ℕ), hprefix.eventually_lt_const hδhalf]
    with X hX hNX
  have hcount : ((Finset.Icc 1 X).filter fun n => b n < |f n|).card ≤
      ((Finset.Icc 1 X).filter fun n => n ∈ A).card + N := by
    have hsub : (Finset.Icc 1 X).filter (fun n => b n < |f n|) ⊆
        (Finset.Icc 1 X).filter (fun n => n ∈ A) ∪ Finset.range N := by
      intro n hn
      obtain ⟨hin, hbad⟩ := Finset.mem_filter.mp hn
      by_cases hlarge : N ≤ n
      · apply Finset.mem_union_left _
        refine Finset.mem_filter.mpr ⟨hin, ?_⟩
        intro hmem
        exact (not_lt_of_ge (hR (Set.mem_image_of_mem abs hmem)))
          ((hN n hlarge).trans_lt hbad)
      · exact Finset.mem_union_right _ (Finset.mem_range.mpr (lt_of_not_ge hlarge))
    refine (Finset.card_le_card hsub).trans ?_
    simpa only [Finset.card_range] using
      (Finset.card_union_le ((Finset.Icc 1 X).filter fun n => n ∈ A) (Finset.range N))
  calc
    _ ≤ ((((Finset.Icc 1 X).filter fun n => n ∈ A).card : ℝ) + N) / X :=
      div_le_div_of_nonneg_right (by exact_mod_cast hcount) (Nat.cast_nonneg X)
    _ = (((Finset.Icc 1 X).filter fun n => n ∈ A).card : ℝ) / X + (N : ℝ) / X := add_div _ _ _
    _ < δ := by linarith [htail X hX]

end PomeranceSarkozy
