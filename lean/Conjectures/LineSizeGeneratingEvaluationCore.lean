import Conjectures.LineSizeGeneratingEvaluationBasic
import Conjectures.LineSizeGeneratingCoefficient
import Conjectures.LineSizeGeneratingGaussian
import Mathlib.Topology.Algebra.InfiniteSum.Real
import Mathlib.Tactic.Linarith

/-! Evaluation and a summable majorant for every fixed core length. -/
noncomputable section
namespace LineSize.Generating

open Finset PowerSeries

variable {K : Type*} [NormedField K]

def gapValue (r : ℕ) (q : K) : K :=
  ∏ j : Fin r, (1-q^(j.val+1))⁻¹

def largeCoreValue (r : ℕ) (q : K) : K :=
  (2 : K)^(r-3)*q^(r^2)*(1+q^r)*gapValue r q

def coreValue (r : ℕ) (q : K) : K :=
  if r=0 then 1 else if r=1 then q^3*gapValue 1 q
  else if r=2 then q^6*gapValue 2 q else largeCoreValue r q

theorem coreValue_of_ge_three (r : ℕ) (hr : 3 ≤ r) (q : K) :
    coreValue r q=largeCoreValue r q := by
  rw [coreValue,ite_eq_right (by omega),ite_eq_right (by omega),ite_eq_right (by omega)]

theorem hasSeriesValue_largeCoreTerm [CharZero K] [CompleteSpace K]
    (r : ℕ) (q : K) (hq : ‖q‖ < 1) :
    HasSeriesValue (largeCoreTerm r) q (largeCoreValue r q) := by
  have h := (((hasSeriesValue_X_pow q (r^2)).mul
    ((hasSeriesValue_one q).add (hasSeriesValue_X_pow q r))).mul
      (hasSeriesValue_gapSeries r q hq)).nsmul (2^(r-3))
  simpa only [largeCoreTerm,largeCoreValue,gapValue,Nat.cast_pow,Nat.cast_ofNat,
    mul_assoc] using h

theorem hasSeriesValue_coreTerm [CharZero K] [CompleteSpace K]
    (r : ℕ) (q : K) (hq : ‖q‖ < 1) :
    HasSeriesValue (coreTerm r) q (coreValue r q) := by
  rcases r with _ | _ | _ | r
  · simpa [coreValue] using hasSeriesValue_one q
  · simpa [coreValue,gapValue] using
      (hasSeriesValue_X_pow q 3).mul (hasSeriesValue_gapSeries 1 q hq)
  · simpa [coreValue,gapValue] using
      (hasSeriesValue_X_pow q 6).mul (hasSeriesValue_gapSeries 2 q hq)
  · rw [coreTerm_of_ge_three (r+3) (by omega),
      coreValue_of_ge_three (r+3) (by omega)]
    exact hasSeriesValue_largeCoreTerm (r+3) q hq

theorem pow_succ_le_self {R : ℝ} (hR : 0 ≤ R) (hR1 : R ≤ 1) (j : ℕ) :
    R^(j+1) ≤ R := by
  rw [pow_succ]
  simpa only [one_mul] using
    mul_le_mul_of_nonneg_right (pow_le_one₀ hR hR1 (n := j)) hR

theorem gapValue_nonneg (r : ℕ) {R : ℝ} (hR : 0 ≤ R) (hR1 : R < 1) :
    0 ≤ gapValue r R := by
  apply prod_nonneg
  intro j _hj
  apply inv_nonneg.mpr
  have hpow := pow_succ_le_self hR hR1.le j.val
  linarith

theorem gapValue_le (r : ℕ) {R : ℝ} (hR : 0 ≤ R) (hR1 : R < 1) :
    gapValue r R ≤ ((1-R)⁻¹)^r := by
  have hfactor : ∀ j : Fin r, (1-R^(j.val+1))⁻¹ ≤ (1-R)⁻¹ := by
    intro j
    simpa only [one_div] using
      one_div_le_one_div_of_le (sub_pos.mpr hR1)
        (sub_le_sub_left (pow_succ_le_self hR hR1.le j.val) 1)
  have hprod := prod_le_prod (s := (univ : Finset (Fin r)))
    (f := fun j : Fin r => (1-R^(j.val+1))⁻¹)
    (g := fun _ : Fin r => (1-R)⁻¹)
    (fun j _hj => inv_nonneg.mpr (by
      have hpow := pow_succ_le_self hR hR1.le j.val
      linarith))
    (fun j _hj => hfactor j)
  simpa only [gapValue,prod_const,card_univ,Fintype.card_fin] using hprod

theorem largeCoreValue_nonneg (r : ℕ) {R : ℝ} (hR : 0 ≤ R) (hR1 : R < 1) :
    0 ≤ largeCoreValue r R := by
  unfold largeCoreValue
  exact mul_nonneg
    (mul_nonneg (mul_nonneg (pow_nonneg (by norm_num) _) (pow_nonneg hR _))
      (add_nonneg zero_le_one (pow_nonneg hR _)))
    (gapValue_nonneg r hR hR1)

theorem largeCoreValue_le_gaussian (r : ℕ) (hr : 3 ≤ r)
    {R : ℝ} (hR : 0 ≤ R) (hR1 : R < 1) :
    largeCoreValue r R ≤ gaussianWeight (2*(1-R)⁻¹) R r := by
  have hnum : (2 : ℝ)^(r-3)*(1+R^r) ≤ (2 : ℝ)^r := by
    calc
      (2 : ℝ)^(r-3)*(1+R^r) ≤ (2 : ℝ)^(r-3)*2 :=
        mul_le_mul_of_nonneg_left (by have := pow_le_one₀ hR hR1.le (n := r); linarith)
          (pow_nonneg (by norm_num) _)
      _ = (2 : ℝ)^(r-3+1) := (pow_succ _ _).symm
      _ ≤ (2 : ℝ)^r := pow_le_pow_right₀ (by norm_num) (by omega)
  have hgap := gapValue_le r hR hR1
  calc
    largeCoreValue r R = R^(r^2)*(((2 : ℝ)^(r-3)*(1+R^r))*gapValue r R) := by
      unfold largeCoreValue
      ring
    _ ≤ R^(r^2)*((2 : ℝ)^r*((1-R)⁻¹)^r) :=
      mul_le_mul_of_nonneg_left
        (mul_le_mul hnum hgap (gapValue_nonneg r hR hR1)
          (pow_nonneg (by norm_num) r)) (pow_nonneg hR _)
    _ = gaussianWeight (2*(1-R)⁻¹) R r := by
      rw [gaussianWeight,mul_pow]
      ring

theorem summable_coreValue {R : ℝ} (hR : 0 ≤ R) (hR1 : R < 1) :
    Summable (fun r => coreValue r R) := by
  have hgauss := summable_gaussianWeight (2*(1-R)⁻¹) R
    (mul_nonneg (by norm_num) (inv_nonneg.mpr (sub_nonneg.mpr hR1.le))) hR hR1
  apply (summable_nat_add_iff 3).mp
  apply ((summable_nat_add_iff 3).mpr hgauss).of_nonneg_of_le
  · intro n
    rw [coreValue_of_ge_three (n+3) (by omega)]
    exact largeCoreValue_nonneg (n+3) hR hR1
  · intro n
    rw [coreValue_of_ge_three (n+3) (by omega)]
    exact largeCoreValue_le_gaussian (n+3) (by omega) hR hR1

theorem seriesTerm_coreTerm_nonneg (r n : ℕ) {R : ℝ} (hR : 0 ≤ R) :
    0 ≤ seriesTerm (coreTerm r) R n := by
  simp only [seriesTerm,coeff_coreTerm,map_natCast]
  exact mul_nonneg (Nat.cast_nonneg _) (pow_nonneg hR _)

end LineSize.Generating
