import Conjectures.LineSizeGeneratingEvaluationCore
import Conjectures.LineSizeGeneratingFunction

/-! Absolute convergence justifies interchanging the coefficient sum and
the sum over core lengths. -/
noncomputable section
namespace LineSize.Generating

open Finset PowerSeries

variable {K : Type*} [NormedField K] [CharZero K] [CompleteSpace K]

theorem summable_coreMatrix {R : ℝ} (hR : 0 ≤ R) (hR1 : R < 1) :
    Summable (fun p : ℕ × ℕ => seriesTerm (coreTerm p.1) R p.2) := by
  have hnorm : ‖R‖ < 1 := by
    rwa [Real.norm_eq_abs,abs_of_nonneg hR]
  apply (summable_prod_of_nonneg
    (fun p : ℕ × ℕ => seriesTerm_coreTerm_nonneg p.1 p.2 hR)).mpr
  constructor
  · intro r
    exact (hasSeriesValue_coreTerm r R hnorm).hasSum.summable
  · exact (summable_coreValue hR hR1).congr
      (fun r => (hasSeriesValue_coreTerm r R hnorm).hasSum.tsum_eq.symm)

omit [CharZero K] [CompleteSpace K] in
theorem norm_natCast_le_real (n : ℕ) : ‖(n : K)‖ ≤ (n : ℝ) := by
  have h : ‖n • (1 : K)‖ ≤ (n : ℝ)*‖(1 : K)‖ := norm_nsmul_le
  simpa only [nsmul_eq_mul,mul_one,norm_one] using h

omit [CompleteSpace K] in
theorem norm_seriesTerm_coreTerm_le (r n : ℕ) (q : K) :
    ‖seriesTerm (coreTerm r) q n‖ ≤ seriesTerm (coreTerm r) ‖q‖ n := by
  simp only [seriesTerm,coeff_coreTerm,map_natCast,norm_mul,norm_pow]
  exact mul_le_mul_of_nonneg_right (norm_natCast_le_real _) (pow_nonneg (norm_nonneg q) _)

omit [CompleteSpace K] in
theorem summable_norm_coreMatrix (q : K) (hq : ‖q‖ < 1) :
    Summable (fun p : ℕ × ℕ => ‖seriesTerm (coreTerm p.1) q p.2‖) := by
  apply (summable_coreMatrix (norm_nonneg q) hq).of_nonneg_of_le
  · intro p
    exact norm_nonneg _
  · intro p
    exact norm_seriesTerm_coreTerm_le p.1 p.2 q

omit [CompleteSpace K] in
theorem hasSum_core_column (n : ℕ) (q : K) :
    HasSum (fun r => seriesTerm (coreTerm r) q n) (seriesTerm tupleCostSeries q n) := by
  have hoff : ∀ r ∉ range (n+1), seriesTerm (coreTerm r) q n=0 := by
    intro r hr
    have hnr : n < r := by
      have hr' : ¬r < n+1 := by simpa only [mem_range] using hr
      omega
    rw [seriesTerm,coeff_coreTerm_eq_zero_of_gt r n hnr,
      map_zero,zero_mul]
  have hsum : (∑ r ∈ range (n+1), seriesTerm (coreTerm r) q n)=
      seriesTerm tupleCostSeries q n := by
    simp only [seriesTerm,coeff_tupleCostSeries_eq_core_sum,map_sum,sum_mul]
  rw [← hsum]
  exact hasSum_sum_of_ne_finset_zero hoff

omit [CompleteSpace K] in
theorem summable_norm_tupleCostSeries (q : K) (hq : ‖q‖ < 1) :
    Summable (fun n => ‖seriesTerm tupleCostSeries q n‖) := by
  have hnorm := summable_norm_coreMatrix q hq
  apply hnorm.prod_symm.prod.of_nonneg_of_le
  · intro n
    exact norm_nonneg _
  · intro n
    rw [← (hasSum_core_column n q).tsum_eq]
    exact norm_tsum_le_tsum_norm (hnorm.prod_symm.prod_factor n)

theorem summable_coreValue_of_norm_lt_one (q : K) (hq : ‖q‖ < 1) :
    Summable (fun r => coreValue r q) := by
  have hdouble := (summable_norm_coreMatrix q hq).of_norm
  exact hdouble.prod.congr (fun r => (hasSeriesValue_coreTerm r q hq).hasSum.tsum_eq)

theorem hasSeriesValue_tupleCostSeries (q : K) (hq : ‖q‖ < 1) :
    HasSeriesValue tupleCostSeries q (∑' r, coreValue r q) := by
  have hnorm := summable_norm_tupleCostSeries q hq
  have hdouble : Summable (Function.uncurry (fun r n => seriesTerm (coreTerm r) q n)) :=
    (summable_norm_coreMatrix q hq).of_norm
  have hvalue : (∑' n, seriesTerm tupleCostSeries q n)=∑' r, coreValue r q := by
    calc
      (∑' n, seriesTerm tupleCostSeries q n)=
          ∑' n, ∑' r, seriesTerm (coreTerm r) q n :=
        tsum_congr (fun n => (hasSum_core_column n q).tsum_eq.symm)
      _ = ∑' r, ∑' n, seriesTerm (coreTerm r) q n := hdouble.tsum_comm
      _ = ∑' r, coreValue r q :=
        tsum_congr (fun r => (hasSeriesValue_coreTerm r q hq).hasSum.tsum_eq)
  exact ⟨hnorm,hvalue ▸ hnorm.of_norm.hasSum⟩

def exactValue (q : K) : K :=
  1+q^3*gapValue 1 q+q^6*gapValue 2 q+∑' r : ℕ, largeCoreValue (r+3) q

theorem tsum_coreValue_eq (q : K) (hq : ‖q‖ < 1) :
    (∑' r, coreValue r q)=exactValue q := by
  have hsplit := (summable_coreValue_of_norm_lt_one q hq).sum_add_tsum_nat_add 3
  have hfirst : (∑ r ∈ range 3, coreValue r q)=1+q^3*gapValue 1 q+q^6*gapValue 2 q := by
    simp [sum_range_succ,coreValue]
  rw [hfirst] at hsplit
  rw [← hsplit,exactValue]
  congr 1

theorem hasSeriesValue_tupleCostSeries_exact (q : K) (hq : ‖q‖ < 1) :
    HasSeriesValue tupleCostSeries q (exactValue q) := by
  rw [← tsum_coreValue_eq q hq]
  exact hasSeriesValue_tupleCostSeries q hq

theorem tupleCountSeries_eq_geometric_mul :
    tupleCountSeries=geometric 1*tupleCostSeries := by
  have hinv : geometric 1*(1-(PowerSeries.X : PowerSeries ℚ))=1 := by
    simpa only [pow_one] using geometric_mul_one_sub 1 (by omega)
  calc
    tupleCountSeries=1*tupleCountSeries := (one_mul _).symm
    _ = (geometric 1*(1-(PowerSeries.X : PowerSeries ℚ)))*tupleCountSeries := by rw [hinv]
    _ = geometric 1*tupleCostSeries := by rw [mul_assoc,one_sub_X_mul_tupleCountSeries]

theorem hasSeriesValue_tupleCountSeries (q : K) (hq : ‖q‖ < 1) :
    HasSeriesValue tupleCountSeries q (exactValue q/(1-q)) := by
  rw [tupleCountSeries_eq_geometric_mul]
  have h := (hasSeriesValue_geometric 1 (by omega) q hq).mul
    (hasSeriesValue_tupleCostSeries_exact q hq)
  simpa only [pow_one,div_eq_mul_inv,mul_comm] using h

end LineSize.Generating
