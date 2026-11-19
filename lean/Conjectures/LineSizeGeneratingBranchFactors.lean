import Conjectures.LineSizeGeneratingBranchIntegral
import Conjectures.LineSizeGeometricProductBasic
import Conjectures.LineSizeEulerWeights

/-! Exact factorization of the counting branches on a circle.
The coefficient index is arbitrary. No saddle relation is assumed here. -/
noncomputable section
namespace LineSize.Generating.Branches

open Finset Complex Real
open CoefficientIntegral
open scoped Interval

theorem circlePoint_pow_phase (q theta : ℝ) (k : ℕ) :
    circlePoint q theta^k=((q^k : ℝ) : ℂ)*Geometric.phase ((k : ℝ)*theta) := by
  rw [circlePoint,mul_pow,Complex.ofReal_pow,Geometric.phase,
    ← Complex.exp_nat_mul (Complex.I*(theta : ℂ)) k]
  have harg : (k : ℂ)*(Complex.I*(theta : ℂ))=
      Complex.I*(((k : ℝ)*theta : ℝ) : ℂ) := by
    push_cast
    ring
  rw [harg]

theorem inverse_circlePower {q : ℝ} (hq : 0 ≤ q) (hq1 : q < 1)
    (k : ℕ) (hk : 0 < k) (theta : ℝ) :
    (1-circlePoint q theta^k)⁻¹=
      (((1-q^k)⁻¹ : ℝ) : ℂ)*Geometric.scalarFactor (q^k) ((k : ℝ)*theta) := by
  have hpow : q^k < 1 := pow_lt_one₀ hq hq1 (by omega)
  have hne : ((1-q^k : ℝ) : ℂ) ≠ 0 := by
    exact_mod_cast (sub_pos.mpr hpow).ne'
  have hden : 1-circlePoint q theta^k=Geometric.denominator (q^k) ((k : ℝ)*theta) := by
    rw [circlePoint_pow_phase,Geometric.denominator]
  rw [hden,Geometric.scalarFactor,Complex.ofReal_inv,div_eq_mul_inv,
    ← mul_assoc,inv_mul_cancel₀ hne,one_mul]

theorem inverse_circlePoint {q : ℝ} (hq : 0 ≤ q) (hq1 : q < 1) (theta : ℝ) :
    (1-circlePoint q theta)⁻¹=
      (((1-q)⁻¹ : ℝ) : ℂ)*Geometric.scalarFactor q theta := by
  simpa only [pow_one,Nat.cast_one,one_mul] using
    inverse_circlePower hq hq1 1 (by omega) theta

theorem inverse_circleProduct {q : ℝ} (hq : 0 ≤ q) (hq1 : q < 1)
    (r : ℕ) (theta : ℝ) :
    (∏ j ∈ range r, (1-circlePoint q theta^(j+1))⁻¹)=
      ((∏ j ∈ range r, (1-q^(j+1))⁻¹ : ℝ) : ℂ)*
        ∏ j ∈ range r, Geometric.scalarFactor (q^(j+1)) (((j : ℝ)+1)*theta) := by
  calc
    _ = ∏ j ∈ range r, (((1-q^(j+1))⁻¹ : ℝ) : ℂ)*
        Geometric.scalarFactor (q^(j+1)) (((j : ℝ)+1)*theta) := by
      apply prod_congr rfl
      intro j _hj
      simpa only [Nat.cast_add,Nat.cast_one] using
        inverse_circlePower hq hq1 (j+1) (by omega) theta
    _ = _ := by rw [prod_mul_distrib,← Complex.ofReal_prod]

theorem frequency_branch (n r : ℕ) (beta : Fin 2) (theta : ℝ) :
    frequency (r^2+r*beta.val) n theta=
      Geometric.phase (((r : ℝ)^2+(beta.val : ℝ)*(r : ℝ)-(n : ℝ))*theta) := by
  unfold frequency Geometric.phase
  congr 1
  push_cast
  ring

theorem branch_integrand_factor {q : ℝ} (hq : 0 ≤ q) (hq1 : q < 1)
    (n r : ℕ) (beta : Fin 2) (theta : ℝ) :
    branchValue r beta (circlePoint q theta)*fourierKernel n theta=
      ((branchValue r beta q : ℝ) : ℂ)*
        (Geometric.phase (((r : ℝ)^2+(beta.val : ℝ)*(r : ℝ)-(n : ℝ))*theta)*
          (∏ j ∈ range r, Geometric.scalarFactor (q^(j+1)) (((j : ℝ)+1)*theta))*
          Geometric.scalarFactor q theta) := by
  calc
    _ = (2 : ℂ)^r*(circlePoint q theta^(r^2+r*beta.val)*fourierKernel n theta)*
        ((1-circlePoint q theta)⁻¹*
          ∏ j ∈ range r, (1-circlePoint q theta^(j+1))⁻¹) := by
      rw [branchValue_eq_range_product,div_eq_mul_inv]
      ring
    _ = (2 : ℂ)^r*((q : ℂ)^(r^2+r*beta.val)*frequency (r^2+r*beta.val) n theta)*
        (((((1-q)⁻¹ : ℝ) : ℂ)*Geometric.scalarFactor q theta)*
          (((∏ j ∈ range r, (1-q^(j+1))⁻¹ : ℝ) : ℂ)*
            ∏ j ∈ range r, Geometric.scalarFactor (q^(j+1)) (((j : ℝ)+1)*theta))) := by
      rw [circlePoint_pow_mul_kernel,inverse_circlePoint hq hq1,
        inverse_circleProduct hq hq1]
    _ = _ := by
      rw [branchValue_eq_range_product,frequency_branch,div_eq_mul_inv]
      push_cast
      ring

theorem exp_neg_pow (t : ℝ) (k : ℕ) :
    Real.exp (-t)^k=Real.exp (-t*(k : ℝ)) := by
  rw [← Real.exp_nat_mul]
  congr 1
  ring

theorem exp_neg_pow_succ (t : ℝ) (j : ℕ) :
    Real.exp (-t)^(j+1)=Real.exp (-((j : ℝ)+1)*t) := by
  rw [exp_neg_pow]
  congr 1
  push_cast
  ring

theorem coreWeight_numerator (r : ℕ) (beta : Fin 2) (t : ℝ) :
    Real.exp ((r : ℝ)*Real.log 2-t*((r : ℝ)^2+(beta.val : ℝ)*(r : ℝ)))=
      (2 : ℝ)^r*Real.exp (-t)^(r^2+r*beta.val) := by
  have harg : (r : ℝ)*Real.log 2-t*((r : ℝ)^2+(beta.val : ℝ)*(r : ℝ))=
      (r : ℝ)*Real.log 2+((r^2+r*beta.val : ℕ) : ℝ)*(-t) := by
    push_cast
    ring
  rw [harg,Real.exp_add,Real.exp_nat_mul,Real.exp_log (by norm_num : (0 : ℝ) < 2),
    Real.exp_nat_mul]

theorem branchValue_exp_neg (r : ℕ) (beta : Fin 2) (t : ℝ) :
    branchValue r beta (Real.exp (-t))=
      EulerKernel.coreWeight r (beta.val : ℝ) t/(1-Real.exp (-t)) := by
  have hprod : (∏ j ∈ range r, (1-Real.exp (-t)^(j+1))⁻¹)=
      EulerKernel.finiteProduct r t := by
    simp only [EulerKernel.finiteProduct,exp_neg_pow_succ]
  rw [branchValue_eq_range_product,hprod,EulerKernel.coreWeight,coreWeight_numerator]
  ring

theorem characteristic_exp_neg (r : ℕ) (t theta : ℝ) :
    (∏ j ∈ range r, Geometric.scalarFactor (Real.exp (-t)^(j+1)) (((j : ℝ)+1)*theta))=
      Geometric.characteristic r t theta := by
  simp only [Geometric.characteristic,Geometric.parameter,exp_neg_pow,Nat.cast_add,
    Nat.cast_one]

def branchKernel (n r : ℕ) (beta : Fin 2) (t theta : ℝ) : ℂ :=
  Geometric.phase (((r : ℝ)^2+(beta.val : ℝ)*(r : ℝ)-(n : ℝ))*theta)*
    Geometric.characteristic r t theta*Geometric.scalarFactor (Real.exp (-t)) theta

theorem branch_integrand_exp_neg {t : ℝ} (ht : 0 < t)
    (n r : ℕ) (beta : Fin 2) (theta : ℝ) :
    branchValue r beta (circlePoint (Real.exp (-t)) theta)*fourierKernel n theta=
      ((EulerKernel.coreWeight r (beta.val : ℝ) t/(1-Real.exp (-t)) : ℝ) : ℂ)*
        branchKernel n r beta t theta := by
  have hq1 : Real.exp (-t) < 1 := by
    rw [Real.exp_lt_one_iff]
    linarith
  have h := branch_integrand_factor (Real.exp_pos (-t)).le hq1 n r beta theta
  rw [branchValue_exp_neg,characteristic_exp_neg] at h
  exact h

theorem branchIntegral_factor {t : ℝ} (ht : 0 < t) (n r : ℕ) (beta : Fin 2) :
    branchIntegral (Real.exp (-t)) n r beta=
      ((EulerKernel.coreWeight r (beta.val : ℝ) t/(1-Real.exp (-t)) : ℝ) : ℂ)*
        ∫ theta in -Real.pi..Real.pi, branchKernel n r beta t theta := by
  unfold branchIntegral
  simp_rw [branch_integrand_exp_neg ht]
  rw [intervalIntegral.integral_const_mul]

theorem count_eq_characteristic_integrals {t : ℝ} (ht : 0 < t)
    (n : ℕ) (hn : 3 ≤ n) :
    (lineSizeCount n : ℂ)=
      (∑' r : ℕ, ∑ beta : Fin 2,
        ((EulerKernel.coreWeight r (beta.val : ℝ) t/(1-Real.exp (-t)) : ℝ) : ℂ)*
          ∫ theta in -Real.pi..Real.pi, branchKernel n r beta t theta)/
        ((8 : ℂ)*(2*(Real.pi : ℂ))*(Real.exp (-t) : ℂ)^n)+1/2 := by
  have hq1 : Real.exp (-t) < 1 := by
    rw [Real.exp_lt_one_iff]
    linarith
  simpa only [branchIntegral_factor ht] using
    count_eq_branch_integrals (Real.exp_pos (-t)) hq1 n hn

end LineSize.Generating.Branches
