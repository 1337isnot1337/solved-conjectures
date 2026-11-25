import Conjectures.KovalevZeroFreeTaylorSeries
import Mathlib.Algebra.Ring.GeomSum

/-!
# Kovalev's zero-free Taylor polynomial conjecture

Identification of the coefficient convolution with the actual derivatives of
the principal square root of the geometric polynomial at zero. This discharges
the analytic coefficient extraction in equation (1) of the recorded proof,
`results/kovalev-zero-free/PROOF.md`, commit
`6432592c03b24aed190ed7b3204ed942a40a8da4`.
-/

namespace Conjectures.KovalevZeroFree

open Finset Filter
open scoped Topology

noncomputable section

def formalCoeff (D n : ℕ) : ℂ :=
  ∑ i ∈ range (n + 1), dilatedSqrtCoeff D i * (halfCoeff (n - i) : ℂ)

def radicalProduct (D : ℕ) (z : ℂ) : ℂ :=
  Complex.sqrt (1 - z ^ D) * (1 - z) ^ (-1 / 2 : ℂ)

def radicand (D : ℕ) (z : ℂ) : ℂ := ∑ i ∈ range D, z ^ i

theorem hasSum_formalCoeff {D : ℕ} (hD : 0 < D) {z : ℂ} (hz : ‖z‖ < 1) :
    HasSum (fun n => formalCoeff D n * z ^ n) (radicalProduct D z) := by
  have hb := hasSum_dilatedSqrtCoeff hD hz
  have ha := hasSum_halfCoeff hz
  have h := hasSum_sum_range_mul_of_summable_norm
    (summable_norm_coeff_mul_pow (norm_dilatedSqrtCoeff_le_one D) hz)
    (summable_norm_coeff_mul_pow norm_halfCoeff_le_one hz)
  rw [hb.tsum_eq, ha.tsum_eq] at h
  unfold radicalProduct
  convert h using 1
  ext n
  rw [formalCoeff, sum_mul]
  apply sum_congr rfl
  intro i hi
  have he : i + (n - i) = n := Nat.add_sub_of_le (by simpa using hi)
  have hzpow : z ^ n = z ^ i * z ^ (n - i) := by rw [← pow_add, he]
  rw [hzpow]
  ring

theorem radicalProduct_hasFPowerSeriesAt {D : ℕ} (hD : 0 < D) :
    HasFPowerSeriesAt (radicalProduct D)
      (FormalMultilinearSeries.ofScalars ℂ (formalCoeff D)) 0 := by
  rw [hasFPowerSeriesAt_iff]
  filter_upwards [Metric.ball_mem_nhds (0 : ℂ) (by norm_num : (0 : ℝ) < 1)] with z hz
  rw [Metric.mem_ball, dist_zero_right] at hz
  simpa [FormalMultilinearSeries.coeff_ofScalars, smul_eq_mul, mul_comm]
    using hasSum_formalCoeff hD hz

theorem radicand_zero {D : ℕ} (hD : 0 < D) : radicand D 0 = 1 := by
  obtain ⟨d, rfl⟩ := Nat.exists_eq_succ_of_ne_zero (Nat.ne_of_gt hD)
  simp [radicand, sum_range_succ']

theorem radicalProduct_zero {D : ℕ} (hD : 0 < D) : radicalProduct D 0 = 1 := by
  simp [radicalProduct, Nat.ne_of_gt hD]

theorem radicand_analyticAt (D : ℕ) (z : ℂ) : AnalyticAt ℂ (radicand D) z := by
  unfold radicand
  exact (range D).analyticAt_fun_sum
    (fun i _ => (analyticAt_id : AnalyticAt ℂ (fun w : ℂ => w) z).pow i)

theorem sqrt_radicand_analyticAt {D : ℕ} (hD : 0 < D) :
    AnalyticAt ℂ (fun z => Complex.sqrt (radicand D z)) 0 := by
  exact (radicand_analyticAt D 0).cpow analyticAt_const (by simp [radicand_zero hD])

theorem radicalProduct_sq (D : ℕ) {z : ℂ} (hz : z ≠ 1) :
    radicalProduct D z ^ 2 = radicand D z := by
  have hi : ((1 - z) ^ (-1 / 2 : ℂ)) ^ 2 = (1 - z)⁻¹ := by
    rw [← Complex.cpow_mul_nat]
    norm_num [Complex.cpow_neg_one]
  rw [radicalProduct, mul_pow, hi]
  simp only [Complex.sqrt, Complex.cpow_ofNat_inv_pow]
  have hn : 1 - z ≠ 0 := sub_ne_zero.mpr (Ne.symm hz)
  rw [← geom_sum_mul_neg z D, mul_assoc, mul_inv_cancel₀ hn, mul_one]
  rfl

theorem radicalProduct_eventually_eq_sqrt {D : ℕ} (hD : 0 < D) :
    radicalProduct D =ᶠ[𝓝 0] (fun z => Complex.sqrt (radicand D z)) := by
  have hp := (radicalProduct_hasFPowerSeriesAt hD).analyticAt
  have hf := sqrt_radicand_analyticAt hD
  have hs : ∀ᶠ z in 𝓝 (0 : ℂ), radicalProduct D z + Complex.sqrt (radicand D z) ≠ 0 :=
    (hp.continuousAt.add hf.continuousAt).eventually_ne (by
      simp [radicalProduct_zero hD, radicand_zero hD])
  filter_upwards [hs, eventually_ne_nhds (show (0 : ℂ) ≠ 1 by norm_num)] with z hs hz
  have hsq : Complex.sqrt (radicand D z) ^ 2 = radicand D z := by
    simp [Complex.sqrt]
  have hmul : (radicalProduct D z - Complex.sqrt (radicand D z)) *
      (radicalProduct D z + Complex.sqrt (radicand D z)) = 0 := by
    calc
      _ = radicalProduct D z ^ 2 - Complex.sqrt (radicand D z) ^ 2 := by ring
      _ = 0 := by rw [radicalProduct_sq D hz, hsq, sub_self]
  exact sub_eq_zero.mp ((mul_eq_zero.mp hmul).resolve_right hs)

theorem sqrt_radicand_hasFPowerSeriesAt {D : ℕ} (hD : 0 < D) :
    HasFPowerSeriesAt (fun z => Complex.sqrt (radicand D z))
      (FormalMultilinearSeries.ofScalars ℂ (formalCoeff D)) 0 :=
  (radicalProduct_hasFPowerSeriesAt hD).congr (radicalProduct_eventually_eq_sqrt hD)

/-- The convolution coefficients are the actual complex Taylor coefficients. -/
theorem formalCoeff_eq_iteratedDeriv {D : ℕ} (hD : 0 < D) (n : ℕ) :
    formalCoeff D n =
      iteratedDeriv n (fun z => Complex.sqrt (radicand D z)) 0 / (n.factorial : ℂ) := by
  have he := (sqrt_radicand_hasFPowerSeriesAt hD).eq_formalMultilinearSeries
    (sqrt_radicand_analyticAt hD).hasFPowerSeriesAt
  exact congrFun (FormalMultilinearSeries.ofScalars_series_injective ℂ ℂ he) n

end

end Conjectures.KovalevZeroFree
