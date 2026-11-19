import Conjectures.LineSizeGeneratingBranches
import Conjectures.LineSizeCoefficientIntegralSeries

/-! The literal `2^r` core branches and their coefficient integrals.
Every fixed branch is a finite product of convergent geometric series.
The sum of the branch integrals has finite support for each coefficient. -/
noncomputable section
namespace LineSize.Generating.Branches

open Finset PowerSeries Complex Real
open CoefficientIntegral
open scoped Interval

variable {K : Type*} [NormedField K]

def branchValue (r : ℕ) (beta : Fin 2) (z : K) : K :=
  (2 : K)^r*(z^(r^2+r*beta.val)*
    ((1-z)⁻¹*∏ j : Fin r, (1-z^(j.val+1))⁻¹))

theorem branchValue_eq (r : ℕ) (beta : Fin 2) (z : K) :
    branchValue r beta z=
      ((2 : K)^r*z^(r^2+r*beta.val)/(1-z))*
        ∏ j : Fin r, (1-z^(j.val+1))⁻¹ := by
  rw [branchValue,div_eq_mul_inv]
  ring

theorem branchValue_eq_range_product (r : ℕ) (beta : Fin 2) (z : K) :
    branchValue r beta z=
      ((2 : K)^r*z^(r^2+r*beta.val)/(1-z))*
        ∏ j ∈ range r, (1-z^(j+1))⁻¹ := by
  rw [branchValue_eq]
  congr 1
  exact Fin.prod_univ_eq_prod_range (fun j : ℕ => (1 - z ^ (j + 1))⁻¹) r

theorem hasSeriesValue_branchSeries [CharZero K] [CompleteSpace K]
    (r : ℕ) (beta : Fin 2) (z : K) (hz : ‖z‖ < 1) :
    HasSeriesValue (branchSeries r beta) z (branchValue r beta z) := by
  have h := ((hasSeriesValue_X_pow z (r^2+r*beta.val)).mul
    ((hasSeriesValue_geometric 1 (by omega) z hz).mul
      (hasSeriesValue_gapSeries r z hz))).nsmul (2^r)
  simpa only [branchSeries,branchValue,Nat.cast_pow,Nat.cast_ofNat,pow_one] using h

theorem powerSeriesValue_branchSeries (r : ℕ) (beta : Fin 2) (z : ℂ)
    (hz : ‖z‖ < 1) :
    powerSeriesValue (branchSeries r beta) z=branchValue r beta z :=
  powerSeriesValue_eq (hasSeriesValue_branchSeries r beta z hz)

def branchIntegral (q : ℝ) (n r : ℕ) (beta : Fin 2) : ℂ :=
  ∫ theta in -Real.pi..Real.pi,
    branchValue r beta (circlePoint q theta)*fourierKernel n theta

theorem branchIntegral_eq {q : ℝ} (hq : 0 ≤ q) (hq1 : q < 1)
    (n r : ℕ) (beta : Fin 2) :
    branchIntegral q n r beta=
      (2*(Real.pi : ℂ))*(Rat.castHom ℂ (coeff n (branchSeries r beta))*(q : ℂ)^n) := by
  have hnorm : ‖(q : ℂ)‖ < 1 := by rwa [Complex.norm_of_nonneg hq]
  have h := powerSeries_integral hq
    (hasSeriesValue_branchSeries r beta (q : ℂ) hnorm) n
  have hfun :
      (fun theta : ℝ => powerSeriesValue (branchSeries r beta) (circlePoint q theta)*
        fourierKernel n theta)=
      (fun theta : ℝ => branchValue r beta (circlePoint q theta)*fourierKernel n theta) := by
    funext theta
    rw [powerSeriesValue_branchSeries r beta (circlePoint q theta)
      (by rwa [norm_circlePoint hq])]
  rw [hfun] at h
  exact h

theorem branchIntegral_eq_zero {q : ℝ} (hq : 0 ≤ q) (hq1 : q < 1)
    (n r : ℕ) (beta : Fin 2) (hn : n < r) :
    branchIntegral q n r beta=0 := by
  rw [branchIntegral_eq hq hq1,coeff_branchSeries_eq_zero r n beta hn,
    map_zero,zero_mul,mul_zero]

theorem sum_branchIntegral {q : ℝ} (hq : 0 ≤ q) (hq1 : q < 1) (n : ℕ) :
    (∑ r ∈ range (n+1), ∑ beta : Fin 2, branchIntegral q n r beta)=
      (2*(Real.pi : ℂ))*(Rat.castHom ℂ (weightedCoefficient n)*(q : ℂ)^n) := by
  simp only [branchIntegral_eq hq hq1,weightedCoefficient,map_sum,mul_sum,sum_mul]

theorem hasSum_branchIntegral {q : ℝ} (hq : 0 ≤ q) (hq1 : q < 1) (n : ℕ) :
    HasSum (fun r : ℕ => ∑ beta : Fin 2, branchIntegral q n r beta)
      ((2*(Real.pi : ℂ))*(Rat.castHom ℂ (weightedCoefficient n)*(q : ℂ)^n)) := by
  have hoff : ∀ r ∉ range (n+1), (∑ beta : Fin 2, branchIntegral q n r beta)=0 := by
    intro r hr
    have hnr : n < r := by
      have hr' : ¬r < n+1 := by simpa only [mem_range] using hr
      omega
    exact sum_eq_zero (fun beta _ => branchIntegral_eq_zero hq hq1 n r beta hnr)
  have h : HasSum (fun r : ℕ => ∑ beta : Fin 2, branchIntegral q n r beta)
      (∑ r ∈ range (n+1), ∑ beta : Fin 2, branchIntegral q n r beta) :=
    hasSum_sum_of_ne_finset_zero hoff
  rw [sum_branchIntegral hq hq1 n] at h
  exact h

theorem tsum_branchIntegral {q : ℝ} (hq : 0 ≤ q) (hq1 : q < 1) (n : ℕ) :
    (∑' r : ℕ, ∑ beta : Fin 2, branchIntegral q n r beta)=
      (2*(Real.pi : ℂ))*(Rat.castHom ℂ (weightedCoefficient n)*(q : ℂ)^n) :=
  (hasSum_branchIntegral hq hq1 n).tsum_eq

theorem lineSizeCount_extension_complex (n : ℕ) (hn : 3 ≤ n) :
    (lineSizeCount n : ℂ)=Rat.castHom ℂ (weightedCoefficient n)/8+1/2 := by
  simpa using congrArg (Rat.castHom ℂ) (lineSizeCount_extension_of_ge_three n hn)

/-- This is the coefficient decomposition with the literal global factor `1/8`.
The final term is exactly the correction for the artificial cores `r = 0,1,2`. -/
theorem scaled_count_eq_branch_integrals {q : ℝ} (hq : 0 ≤ q) (hq1 : q < 1)
    (n : ℕ) (hn : 3 ≤ n) :
    (lineSizeCount n : ℂ)*(q : ℂ)^n=
      (1/8 : ℂ)*(1/(2*(Real.pi : ℂ)))*
        (∑' r : ℕ, ∑ beta : Fin 2, branchIntegral q n r beta)+
      (1/2 : ℂ)*(q : ℂ)^n := by
  have hpi : 2*(Real.pi : ℂ) ≠ 0 := by
    apply mul_ne_zero (by norm_num)
    exact_mod_cast Real.pi_ne_zero
  rw [lineSizeCount_extension_complex n hn,tsum_branchIntegral hq hq1 n]
  field_simp [hpi]

theorem count_eq_branch_integrals {q : ℝ} (hq : 0 < q) (hq1 : q < 1)
    (n : ℕ) (hn : 3 ≤ n) :
    (lineSizeCount n : ℂ)=
      (∑' r : ℕ, ∑ beta : Fin 2, branchIntegral q n r beta)/
        ((8 : ℂ)*(2*(Real.pi : ℂ))*(q : ℂ)^n)+1/2 := by
  have hpi : 2*(Real.pi : ℂ) ≠ 0 := by
    apply mul_ne_zero (by norm_num)
    exact_mod_cast Real.pi_ne_zero
  have hqC : (q : ℂ) ≠ 0 := by exact_mod_cast hq.ne'
  rw [lineSizeCount_extension_complex n hn,tsum_branchIntegral hq.le hq1 n]
  field_simp [hpi,hqC]

end LineSize.Generating.Branches
