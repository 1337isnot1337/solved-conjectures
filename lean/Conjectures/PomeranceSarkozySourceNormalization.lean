module
public import Conjectures.PomeranceSarkozyOffsets
public import Conjectures.PomeranceSarkozySourceSample
public import Conjectures.PomeranceSarkozyWindowWeakTransfer
public import Mathlib.Analysis.SpecialFunctions.Pow.Asymptotics
import Mathlib.MeasureTheory.Measure.Prokhorov
import Mathlib.Topology.Instances.ENNReal.Lemmas

@[expose] public section
namespace PomeranceSarkozy

open Filter MeasureTheory
open scoped ENNReal Topology

private theorem window_loglog_bounds {X n : ℕ} (hX : 1 < (X : ℝ))
    (hn₀ : ⌈Real.sqrt (X : ℝ)⌉₊ ≤ n) (hn₁ : n ≤ X) :
    Real.log (Real.log X) - Real.log 2 ≤ Real.log (Real.log n) ∧
      Real.log (Real.log n) ≤ Real.log (Real.log X) := by
  have hXpos : 0 < (X : ℝ) := zero_lt_one.trans hX
  have hsqrt : Real.sqrt (X : ℝ) ≤ (n : ℝ) := Nat.ceil_le.mp hn₀
  have hlogX : 0 < Real.log (X : ℝ) := Real.log_pos hX
  have hlogsqrt : Real.log (Real.sqrt (X : ℝ)) = Real.log (X : ℝ) / 2 := by
    rw [Real.sqrt_eq_rpow, Real.log_rpow hXpos]
    ring
  have hlognlo : Real.log (X : ℝ) / 2 ≤ Real.log (n : ℝ) := by
    rw [← hlogsqrt]
    exact Real.log_le_log (Real.sqrt_pos.2 hXpos) hsqrt
  have hlogn : 0 < Real.log (n : ℝ) := (half_pos hlogX).trans_le hlognlo
  constructor
  · rw [← Real.log_div hlogX.ne' (by norm_num)]
    exact Real.log_le_log (half_pos hlogX) hlognlo
  · exact Real.log_le_log hlogn (Real.log_le_log ((Real.sqrt_pos.2 hXpos).trans_le hsqrt)
      (Nat.cast_le.mpr hn₁))

/-- Uniform bound on the change of center and scale when the original
normalized value stays bounded. -/
private theorem quarterNormalization_dist_le {a x y c R : ℝ}
    (hc : 0 ≤ c) (hx : 0 < x - c) (hy : x - c ≤ y) (hyx : y ≤ x)
    (hf : |(a - x) / x ^ (1 / 4 : ℝ)| ≤ R) :
    dist ((a - x) / x ^ (1 / 4 : ℝ)) ((a - y) / y ^ (1 / 4 : ℝ)) ≤
      R * (c / (x - c)) + c / (x - c) ^ (1 / 4 : ℝ) := by
  have hypos : 0 < y := hx.trans_le hy
  have hxpos : 0 < x := hypos.trans_le hyx
  have hq : 0 ≤ (1 / 4 : ℝ) := by norm_num
  have hxq := Real.rpow_pos_of_pos hxpos (1 / 4 : ℝ)
  have hyq := Real.rpow_pos_of_pos hypos (1 / 4 : ℝ)
  have hxy : 0 ≤ x - y := sub_nonneg.mpr hyx
  have hscale_nonneg : 0 ≤ x ^ (1 / 4 : ℝ) / y ^ (1 / 4 : ℝ) - 1 := by
    apply sub_nonneg.mpr
    rw [le_div_iff₀ hyq, one_mul]
    exact Real.rpow_le_rpow hypos.le hyx hq
  have hshift : x - y ≤ c := by linarith
  have hscale : x ^ (1 / 4 : ℝ) / y ^ (1 / 4 : ℝ) - 1 ≤ c / (x - c) := by
    calc
      _ ≤ x / y - 1 := by
        apply sub_le_sub_right
        rw [← Real.div_rpow hxpos.le hypos.le]
        apply Real.rpow_le_self_of_one_le _ (by norm_num)
        simpa only [one_mul] using (le_div_iff₀ hypos).mpr (by simpa using hyx)
      _ = (x - y) / y := by rw [sub_div, div_self hypos.ne']
      _ ≤ c / y := div_le_div_of_nonneg_right hshift hypos.le
      _ ≤ c / (x - c) := div_le_div_of_nonneg_left hc hx hy
  calc
    _ = |((a - x) / x ^ (1 / 4 : ℝ)) * (x ^ (1 / 4 : ℝ) / y ^ (1 / 4 : ℝ) - 1) +
        (x - y) / y ^ (1 / 4 : ℝ)| := by
          rw [dist_comm, Real.dist_eq]
          congr 1
          field_simp [hxq.ne', hyq.ne']
          ring
    _ ≤ |(a - x) / x ^ (1 / 4 : ℝ)| * (x ^ (1 / 4 : ℝ) / y ^ (1 / 4 : ℝ) - 1) +
        (x - y) / y ^ (1 / 4 : ℝ) := by
          simpa only [abs_mul, abs_of_nonneg hscale_nonneg,
            abs_of_nonneg (div_nonneg hxy hyq.le)] using
              (abs_add_le (((a - x) / x ^ (1 / 4 : ℝ)) *
                (x ^ (1 / 4 : ℝ) / y ^ (1 / 4 : ℝ) - 1)) ((x - y) / y ^ (1 / 4 : ℝ)))
    _ ≤ _ := add_le_add
      ((mul_le_mul_of_nonneg_right hf hscale_nonneg).trans
        (mul_le_mul_of_nonneg_left hscale ((abs_nonneg _).trans hf)))
      ((div_le_div_of_nonneg_right hshift hyq.le).trans
        (div_le_div_of_nonneg_left hc (Real.rpow_pos_of_pos hx _)
          (Real.rpow_le_rpow hx.le hy hq)))

/-- On the upper arithmetic window, replacing the sample-size center and
quarter-root scale by the pointwise center and scale preserves the weak limit. -/
theorem sourceWindow_normalization_weak_limit (Z : ProbabilityMeasure ℝ)
    (h : Tendsto (fun X : ℕ ↦ (sourceWindowSample X).map (fun n : ℕ ↦
      ((sourceG n : ℝ) - Real.log (Real.log X)) / Real.log (Real.log X) ^ (1 / 4 : ℝ)))
      atTop (𝓝 Z)) :
    Tendsto (fun X : ℕ ↦ (sourceWindowSample X).map (fun n : ℕ ↦
      ((sourceG n : ℝ) - Real.log (Real.log n)) / Real.log (Real.log n) ^ (1 / 4 : ℝ)))
      atTop (𝓝 Z) := by
  let L (n : ℕ) := Real.log (Real.log n)
  let f (X n : ℕ) := ((sourceG n : ℝ) - L X) / L X ^ (1 / 4 : ℝ)
  let g (_ n : ℕ) := ((sourceG n : ℝ) - L n) / L n ^ (1 / 4 : ℝ)
  let ν (X : ℕ) := (sourceWindowSample X).map (f X)
  let W (X : ℕ) := Finset.Icc ⌈Real.sqrt (X : ℝ)⌉₊ X
  let c := Real.log 2
  have hc : 0 ≤ c := (Real.log_pos (by norm_num : (1 : ℝ) < 2)).le
  have hν : Tendsto ν atTop (𝓝 Z) := h
  have hcompact : IsCompact (closure (Set.range ν)) :=
    hν.isCompact_insert_range.of_isClosed_subset isClosed_closure
      (closure_minimal (Set.subset_insert Z _) hν.isCompact_insert_range.isClosed)
  have htight := isTightMeasureSet_of_isCompact_closure hcompact
  have hL : Tendsto L atTop atTop :=
    Real.tendsto_log_atTop.comp (Real.tendsto_log_atTop.comp tendsto_natCast_atTop_atTop)
  have hLc : Tendsto (fun X ↦ L X - c) atTop atTop := by
    simpa only [sub_eq_add_neg] using tendsto_atTop_add_const_right atTop (-c) hL
  have hW (X : ℕ) : (sourceWindowSample X : Measure ℕ) ((W X : Set ℕ)ᶜ) = 0 := by
    change Measure.uniformOfFinset (W X) ((W X : Set ℕ)ᶜ) = 0
    rw [Measure.uniformOfFinset_apply]
    simp
  refine weak_limit_of_row_perturbation (Ω := fun _ ↦ ℕ) sourceWindowSample f g
    (fun _ ↦ .of_discrete) (fun _ ↦ .of_discrete) hν ?_
  intro δ hδ
  apply ENNReal.tendsto_nhds_zero.mpr
  intro η hη
  obtain ⟨K, hK, hmass⟩ := isTightMeasureSet_iff_exists_isCompact_measure_compl_le.mp htight η hη
  obtain ⟨R, hR⟩ := hK.bddAbove_image (continuous_abs : Continuous (fun x : ℝ ↦ |x|)).continuousOn
  have herr : Tendsto (fun X ↦ R * (c / (L X - c)) + c / (L X - c) ^ (1 / 4 : ℝ))
      atTop (𝓝 0) := by
    have hq := (tendsto_rpow_atTop (by norm_num : 0 < (1 / 4 : ℝ))).comp hLc
    simpa only [Function.comp_apply, mul_zero, zero_add] using
      ((tendsto_const_nhds.div_atTop hLc).const_mul R).add (tendsto_const_nhds.div_atTop hq)
  filter_upwards [(tendsto_natCast_atTop_atTop (R := ℝ)).eventually_gt_atTop 1,
    hLc.eventually_gt_atTop 0, herr.eventually_lt_const hδ] with X hX hpos hclose
  have hsub : {n | δ < dist (f X n) (g X n)} ⊆ (W X : Set ℕ)ᶜ ∪ (f X) ⁻¹' Kᶜ := by
    intro n hn
    by_cases hnW : n ∈ W X
    · right
      intro hnK
      obtain ⟨hnlo, hnhi⟩ := Finset.mem_Icc.mp hnW
      obtain ⟨hy, hyx⟩ := window_loglog_bounds hX hnlo hnhi
      have hf : |f X n| ≤ R := hR (Set.mem_image_of_mem abs hnK)
      exact (not_lt_of_ge ((quarterNormalization_dist_le hc hpos hy hyx hf).trans hclose.le)) hn
    · exact Or.inl hnW
  refine (measure_mono hsub).trans ((measure_union_le _ _).trans ?_)
  rw [hW, zero_add, ← (sourceWindowSample X).map_apply' Measurable.of_discrete.aemeasurable
    hK.isClosed.measurableSet.compl]
  exact hmass _ ⟨ν X, Set.mem_range_self X, rfl⟩

end PomeranceSarkozy
