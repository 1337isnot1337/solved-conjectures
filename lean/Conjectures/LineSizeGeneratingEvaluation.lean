import Conjectures.LineSizeGeneratingEvaluationSum
import Conjectures.LineSizeRecordCount

/-! The convergent generating function counts actual finite configurations
of points in the real plane. The coefficient identification is proved by
the geometric realization and record-injectivity theorems. -/
noncomputable section
namespace LineSize.Generating

open Finset PowerSeries

variable {K : Type*} [NormedField K] [CharZero K] [CompleteSpace K]

def recordGenerating (q : K) : K := ∑' n : ℕ, (lineSizeCount n : K)*q^n

theorem lineSizeCount_seriesTerm (n : ℕ) (q : K) :
    (lineSizeCount n : K)*q^n=seriesTerm tupleCountSeries q n := by
  simp only [seriesTerm,coeff_tupleCountSeries,map_natCast,lineSizeCount_eq_tupleCount]

theorem summable_norm_lineSizeCount (q : K) (hq : ‖q‖ < 1) :
    Summable (fun n : ℕ => ‖(lineSizeCount n : K)*q^n‖) := by
  simpa only [lineSizeCount_seriesTerm] using
    (hasSeriesValue_tupleCountSeries q hq).summable_norm

theorem hasSum_lineSizeCount (q : K) (hq : ‖q‖ < 1) :
    HasSum (fun n : ℕ => (lineSizeCount n : K)*q^n) (exactValue q/(1-q)) := by
  simpa only [lineSizeCount_seriesTerm] using
    (hasSeriesValue_tupleCountSeries q hq).hasSum

theorem recordGenerating_eq (q : K) (hq : ‖q‖ < 1) :
    recordGenerating q=exactValue q/(1-q) :=
  (hasSum_lineSizeCount q hq).tsum_eq

theorem gapValue_eq_inverse_product (r : ℕ) (q : K) :
    gapValue r q=(∏ j : Fin r, (1-q^(j.val+1)))⁻¹ := by
  exact prod_inv_distrib (fun j : Fin r => 1-q^(j.val+1))

theorem gapValue_eq_range_product (r : ℕ) (q : K) :
    gapValue r q=∏ j ∈ range r, (1-q^(j+1))⁻¹ := by
  exact Fin.prod_univ_eq_prod_range (fun j => (1-q^(j+1))⁻¹) r

@[simp] theorem gapValue_one (q : K) : gapValue 1 q=(1-q)⁻¹ := by
  simp [gapValue]

@[simp] theorem gapValue_two (q : K) : gapValue 2 q=((1-q)*(1-q^2))⁻¹ := by
  rw [gapValue_eq_inverse_product]
  simp [Fin.prod_univ_two]

theorem largeCoreValue_eq (r : ℕ) (q : K) :
    largeCoreValue r q=
      ((2 : K)^(r-3)*q^(r^2)*(1+q^r))/(∏ j : Fin r, (1-q^(j.val+1))) := by
  rw [largeCoreValue,gapValue_eq_inverse_product,div_eq_mul_inv]

theorem recordGenerating_eq_explicit (q : K) (hq : ‖q‖ < 1) :
    recordGenerating q=
      (1+q^3/(1-q)+q^6/((1-q)*(1-q^2))+
        ∑' r : ℕ, ((2 : K)^r*q^((r+3)^2)*(1+q^(r+3)))/
          (∏ j : Fin (r+3), (1-q^(j.val+1))))/(1-q) := by
  rw [recordGenerating_eq q hq,exactValue,gapValue_one,gapValue_two]
  simp only [div_eq_mul_inv,largeCoreValue_eq,Nat.add_sub_cancel]

end LineSize.Generating
