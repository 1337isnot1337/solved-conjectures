module

public import Conjectures.LassalleBesselRealSeries
public import Mathlib.Topology.Order.IntermediateValue

@[expose] public section
namespace LassalleRefinement

theorem besselRealSeries_error {R : ℝ} (hR : 0≤R) (hR4 : R≤4) (m : ℕ) :
    |besselRealSeries R-besselRealPartial R (m+1)|≤besselTerm R (m+1) := by
  let f (i : ℕ) := besselTerm R (i+1)
  have hf : Summable f := (summable_nat_add_iff 1).2 (besselTerm_summable hR hR4)
  have hfa : Antitone f := by
    apply antitone_nat_of_succ_le
    intro i
    have h := besselTerm_ratio_unitInterval hR hR4 (i+1) (by omega)
    exact h.trans (mul_le_of_le_one_left (besselTerm_nonneg hR _) (by norm_num))
  have hbound := alternating_series_error_bound f hfa hf m
  have he (i : ℕ) : (-1:ℝ)^(i+1)*besselTerm R (i+1)=-((-1:ℝ)^i*f i) := by
    dsimp [f]
    rw [pow_succ]
    ring
  have hS : besselRealSeries R=1-(∑' i,(-1:ℝ)^i*f i) := by
    have hS := (besselTerm_summable hR hR4).alternating.sum_add_tsum_nat_add 1
    simp_rw [he,tsum_neg] at hS
    simpa [besselRealSeries,besselTerm,sub_eq_add_neg] using hS.symm
  have hP : besselRealPartial R (m+1)=1-∑ i ∈ Finset.range m,(-1:ℝ)^i*f i := by
    unfold besselRealPartial
    rw [Finset.sum_range_succ']
    have hzero : besselTerm R 0=1 := by simp [besselTerm]
    simp_rw [he,Finset.sum_neg_distrib,hzero,pow_zero,one_mul]
    ring
  rw [hS,hP]
  rw [show (1-(∑' i,(-1:ℝ)^i*f i))-(1-(∑ i ∈ Finset.range m,(-1:ℝ)^i*f i)) =
       (∑ i ∈ Finset.range m,(-1:ℝ)^i*f i)-(∑' i,(-1:ℝ)^i*f i) by ring,abs_sub_comm]
  exact hbound

theorem besselRealPartial_cast (r : ℚ) (n : ℕ) :
    (((∑ i ∈ Finset.range n,besselFinite r i):ℚ):ℝ)=besselRealPartial (r:ℝ) n := by
  unfold besselRealPartial besselTerm besselFinite
  push_cast
  apply Finset.sum_congr rfl
  intro i _
  rw [←mul_div_assoc,←mul_pow,neg_one_mul]

theorem besselTerm_cast (r : ℚ) (n : ℕ) : (besselPositive r n:ℝ)=besselTerm (r:ℝ) n := by
  unfold besselPositive besselTerm
  push_cast
  rfl

theorem besselRealSeries_signs :
    0<besselRealSeries (rootLo:ℝ) ∧ besselRealSeries (rootHi:ℝ)<0 := by
  have hL₀ : (0:ℝ)≤(rootLo:ℝ) := by norm_num [rootLo]
  have hL₄ : (rootLo:ℝ)≤4 := by norm_num [rootLo]
  have hH₀ : (0:ℝ)≤(rootHi:ℝ) := by norm_num [rootHi]
  have hH₄ : (rootHi:ℝ)≤4 := by norm_num [rootHi]
  have hL : besselPositive rootLo 22 < ∑ i ∈ Finset.range 22,besselFinite rootLo i := by decide +kernel
  have hH : (∑ i ∈ Finset.range 21,besselFinite rootHi i)+besselPositive rootHi 21 < 0 := by decide +kernel
  have hLc : (besselPositive rootLo 22:ℝ)<(((∑ i ∈ Finset.range 22,besselFinite rootLo i):ℚ):ℝ) := by exact_mod_cast hL
  have hHc : (((∑ i ∈ Finset.range 21,besselFinite rootHi i)+besselPositive rootHi 21:ℚ):ℝ) < (0:ℝ) :=
    by exact_mod_cast hH
  rw [besselTerm_cast,besselRealPartial_cast] at hLc
  rw [Rat.cast_add,besselTerm_cast,besselRealPartial_cast] at hHc
  have hLE := abs_le.mp (besselRealSeries_error hL₀ hL₄ 21)
  have hHE := abs_le.mp (besselRealSeries_error hH₀ hH₄ 20)
  exact ⟨by linarith [hLE.1],by linarith [hHE.2]⟩

theorem besselRealSeries_root_in_bracket :
    ∃ R ∈ Set.Icc (rootLo:ℝ) (rootHi:ℝ), besselRealSeries R=0 := by
  have ht : (rootLo:ℝ)≤(rootHi:ℝ) := by exact_mod_cast rootLo_lt_rootHi.le
  have hi : Set.Icc (rootLo:ℝ) (rootHi:ℝ) ⊆ Set.Icc (0:ℝ) 4 := by
    intro R hR
    exact ⟨(by norm_num [rootLo] : (0:ℝ)≤(rootLo:ℝ)).trans hR.1,
      hR.2.trans (by norm_num [rootHi])⟩
  exact intermediate_value_Icc' ht (besselRealSeries_continuousOn.mono hi)
    ⟨besselRealSeries_signs.2.le,besselRealSeries_signs.1.le⟩

end LassalleRefinement
