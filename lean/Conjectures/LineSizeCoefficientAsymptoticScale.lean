import Conjectures.LineSizeAnalyticProfile
import Conjectures.LineSizeEulerKernel
import Mathlib.Analysis.SpecificLimits.Basic
import Mathlib.Analysis.SpecialFunctions.Pow.Real

/-! Exact scalar identities for the saddle choice `sqrt(A/n)`.
These lemmas contain no assumptions about the line-size count. -/
noncomputable section
namespace LineSize.CoefficientAsymptotic

open Real Filter
open scoped Topology

def scale (n : ℕ) : ℝ := Real.sqrt (Profile.A/(n : ℝ))

def normalizer (n : ℕ) : ℝ :=
  Real.sqrt (scale n)*Real.exp ((n : ℝ)*scale n+Profile.A/scale n)

def fourthRoot (x : ℝ) : ℝ := Real.sqrt (Real.sqrt x)

def normalizedConstant : ℝ := 3/(16*Real.sqrt Real.pi*Real.sqrt (6*Profile.A))

def sharpConstant : ℝ := 3/(16*Real.sqrt (6*Real.pi)*fourthRoot Profile.A)

def rate (n : ℕ) : ℝ :=
  Real.exp (2*Real.sqrt (Profile.A*(n : ℝ)))/fourthRoot (n : ℝ)

def sharpModel (n : ℕ) : ℝ := sharpConstant*rate n

theorem scale_nonneg (n : ℕ) : 0 ≤ scale n := Real.sqrt_nonneg _

theorem scale_pos {n : ℕ} (hn : 0 < n) : 0 < scale n :=
  Real.sqrt_pos.mpr (div_pos Profile.A_pos (Nat.cast_pos.mpr hn))

theorem scale_sq (n : ℕ) : (scale n)^2=Profile.A/(n : ℝ) :=
  Real.sq_sqrt (div_nonneg Profile.A_pos.le (Nat.cast_nonneg n))

theorem index_eq {n : ℕ} (hn : 0 < n) : (n : ℝ)=Profile.A/(scale n)^2 := by
  have hnR : (n : ℝ) ≠ 0 := (Nat.cast_pos.mpr hn).ne'
  rw [scale_sq]
  field_simp [hnR,Profile.A_pos.ne']

theorem scale_tendsto_zero : Tendsto scale atTop (𝓝 0) := by
  change Tendsto (fun n : ℕ => Real.sqrt (Profile.A/(n : ℝ))) atTop (𝓝 0)
  simpa only [Real.sqrt_zero,Function.comp_def] using
    (Real.continuous_sqrt.tendsto 0).comp
      (tendsto_const_div_atTop_nhds_zero_nat Profile.A)

theorem sqrt_scale_tendsto_zero : Tendsto (fun n => Real.sqrt (scale n)) atTop (𝓝 0) := by
  simpa only [Real.sqrt_zero,Function.comp_def] using
    (Real.continuous_sqrt.tendsto 0).comp scale_tendsto_zero

theorem scale_eventually_pos : ∀ᶠ n : ℕ in atTop, 0 < scale n := by
  filter_upwards [eventually_gt_atTop (0 : ℕ)] with n hn
  exact scale_pos hn

theorem scale_eventually_le_one : ∀ᶠ n : ℕ in atTop, scale n ≤ 1 :=
  (scale_tendsto_zero.eventually (gt_mem_nhds (by norm_num : (0 : ℝ) < 1))).mono
    (fun _ hn => hn.le)

theorem mul_scale_eq_sqrt {n : ℕ} (hn : 0 < n) :
    (n : ℝ)*scale n=Real.sqrt (Profile.A*(n : ℝ)) := by
  have hnR : (n : ℝ) ≠ 0 := (Nat.cast_pos.mpr hn).ne'
  apply (sq_eq_sq₀ (mul_nonneg (Nat.cast_nonneg n) (scale_nonneg n))
    (Real.sqrt_nonneg _)).mp
  rw [Real.sq_sqrt (mul_nonneg Profile.A_pos.le (Nat.cast_nonneg n)),mul_pow,scale_sq]
  field_simp [hnR]

theorem exponent_eq {n : ℕ} (hn : 0 < n) :
    (n : ℝ)*scale n+Profile.A/scale n=2*Real.sqrt (Profile.A*(n : ℝ)) := by
  have hnR : (n : ℝ) ≠ 0 := (Nat.cast_pos.mpr hn).ne'
  have ha : Profile.A=(n : ℝ)*(scale n)^2 := by
    rw [scale_sq]
    field_simp [hnR]
  have hquot : Profile.A/scale n=(n : ℝ)*scale n := by
    apply (div_eq_iff (scale_pos hn).ne').mpr
    calc
      Profile.A=(n : ℝ)*(scale n)^2 := ha
      _ = ((n : ℝ)*scale n)*scale n := by ring
  rw [hquot,mul_scale_eq_sqrt hn]
  ring

theorem fourthRoot_pos {x : ℝ} (hx : 0 < x) : 0 < fourthRoot x :=
  Real.sqrt_pos.mpr (Real.sqrt_pos.mpr hx)

theorem fourthRoot_eq_rpow {x : ℝ} (hx : 0 ≤ x) : fourthRoot x=x^(1/4 : ℝ) := by
  rw [fourthRoot,Real.sqrt_eq_rpow,Real.sqrt_eq_rpow,← Real.rpow_mul hx]
  norm_num

theorem sqrt_scale_mul_fourthRoot {n : ℕ} (hn : 0 < n) :
    Real.sqrt (scale n)*fourthRoot (n : ℝ)=fourthRoot Profile.A := by
  have hsn : Real.sqrt (n : ℝ) ≠ 0 := (Real.sqrt_pos.mpr (Nat.cast_pos.mpr hn)).ne'
  have hprod : scale n*Real.sqrt (n : ℝ)=Real.sqrt Profile.A := by
    rw [scale,Real.sqrt_div Profile.A_pos.le,div_mul_cancel₀ _ hsn]
  change Real.sqrt (scale n)*Real.sqrt (Real.sqrt (n : ℝ))=Real.sqrt (Real.sqrt Profile.A)
  rw [← Real.sqrt_mul (scale_nonneg n),hprod]

theorem normalizer_nonneg (n : ℕ) : 0 ≤ normalizer n :=
  mul_nonneg (Real.sqrt_nonneg _) (Real.exp_pos _).le

theorem normalizer_pos {n : ℕ} (hn : 0 < n) : 0 < normalizer n :=
  mul_pos (Real.sqrt_pos.mpr (scale_pos hn)) (Real.exp_pos _)

theorem normalizer_mul_fourthRoot {n : ℕ} (hn : 0 < n) :
    normalizer n*fourthRoot (n : ℝ)=
      fourthRoot Profile.A*Real.exp (2*Real.sqrt (Profile.A*(n : ℝ))) := by
  rw [normalizer,exponent_eq hn]
  calc
    _ = (Real.sqrt (scale n)*fourthRoot (n : ℝ))*
        Real.exp (2*Real.sqrt (Profile.A*(n : ℝ))) := by ring
    _ = _ := by rw [sqrt_scale_mul_fourthRoot hn]

theorem rate_pos {n : ℕ} (hn : 0 < n) : 0 < rate n :=
  div_pos (Real.exp_pos _) (fourthRoot_pos (Nat.cast_pos.mpr hn))

theorem normalizer_div_rate {n : ℕ} (hn : 0 < n) :
    normalizer n/rate n=fourthRoot Profile.A := by
  apply (div_eq_iff (rate_pos hn).ne').mpr
  rw [rate,← mul_div_assoc]
  exact (eq_div_iff (fourthRoot_pos (Nat.cast_pos.mpr hn)).ne').mpr
    (normalizer_mul_fourthRoot hn)

theorem sharpConstant_pos : 0 < sharpConstant := by
  have hroot := fourthRoot_pos Profile.A_pos
  unfold sharpConstant
  positivity

theorem sharpConstant_eq_rpow :
    sharpConstant=3/(16*Real.sqrt (6*Real.pi)*Profile.A^(1/4 : ℝ)) := by
  rw [sharpConstant,fourthRoot_eq_rpow Profile.A_pos.le]

theorem normalizedConstant_mul_fourthRoot :
    normalizedConstant*fourthRoot Profile.A=sharpConstant := by
  have hroot : fourthRoot Profile.A ≠ 0 := (fourthRoot_pos Profile.A_pos).ne'
  have h6 : Real.sqrt 6 ≠ 0 := by positivity
  have hpi : Real.sqrt Real.pi ≠ 0 := (Real.sqrt_pos.mpr Real.pi_pos).ne'
  have hsq : Real.sqrt Profile.A=(fourthRoot Profile.A)^2 :=
    (Real.sq_sqrt (Real.sqrt_nonneg Profile.A)).symm
  unfold normalizedConstant sharpConstant
  rw [Real.sqrt_mul (by norm_num : (0 : ℝ) ≤ 6) Profile.A,
    Real.sqrt_mul (by norm_num : (0 : ℝ) ≤ 6) Real.pi,hsq]
  field_simp [hroot,h6,hpi]

theorem sharpModel_eq_rpow (n : ℕ) :
    sharpModel n=(3/(16*Real.sqrt (6*Real.pi)*Profile.A^(1/4 : ℝ)))*
      (n : ℝ)^(-(1/4 : ℝ))*Real.exp (2*Real.sqrt (Profile.A*(n : ℝ))) := by
  rw [sharpModel,sharpConstant_eq_rpow,rate,fourthRoot_eq_rpow (Nat.cast_nonneg n),
    Real.rpow_neg (Nat.cast_nonneg n),div_eq_mul_inv]
  ring

theorem half_normalizer_bound {n : ℕ} (hn : 0 < n) :
    (1/2 : ℝ)/normalizer n ≤ Real.sqrt (scale n)/(2*Profile.A) := by
  have ht := scale_pos hn
  have hnt : 0 ≤ (n : ℝ)*scale n := mul_nonneg (Nat.cast_nonneg n) ht.le
  have he : Profile.A/scale n ≤ Real.exp ((n : ℝ)*scale n+Profile.A/scale n) := by
    have h := Real.add_one_le_exp ((n : ℝ)*scale n+Profile.A/scale n)
    linarith
  have hb : Profile.A ≤ scale n*Real.exp ((n : ℝ)*scale n+Profile.A/scale n) := by
    simpa only [mul_comm] using (div_le_iff₀ ht).mp he
  apply (div_le_div_iff₀ (normalizer_pos hn) (mul_pos (by norm_num : (0 : ℝ) < 2) Profile.A_pos)).mpr
  calc
    (1/2 : ℝ)*(2*Profile.A)=Profile.A := by ring
    _ ≤ scale n*Real.exp ((n : ℝ)*scale n+Profile.A/scale n) := hb
    _ = Real.sqrt (scale n)*normalizer n := by
      rw [normalizer,← mul_assoc,← pow_two,Real.sq_sqrt ht.le]

theorem half_normalizer_tendsto_zero :
    Tendsto (fun n : ℕ => (1/2 : ℝ)/normalizer n) atTop (𝓝 0) := by
  have hupper : Tendsto (fun n : ℕ => Real.sqrt (scale n)/(2*Profile.A)) atTop (𝓝 0) := by
    simpa only [zero_div] using sqrt_scale_tendsto_zero.div_const (2*Profile.A)
  apply squeeze_zero'
    (Filter.Eventually.of_forall (fun n => div_nonneg (by norm_num) (normalizer_nonneg n)))
    ((eventually_gt_atTop (0 : ℕ)).mono (fun _ hn => half_normalizer_bound hn)) hupper

theorem t_div_one_sub_exp_neg_tendsto {α : Type*} {l : Filter α} {t : α → ℝ}
    (ht : Tendsto t l (𝓝 0)) (htne : ∀ᶠ k in l, t k ≠ 0) :
    Tendsto (fun k => t k/(1-Real.exp (-t k))) l (𝓝 1) := by
  have hm : Tendsto (fun k => EulerKernel.meanExp (t k)) l (𝓝 1) := by
    simpa only [EulerKernel.meanExp_zero,Function.comp_def] using
      (EulerKernel.meanExp_analyticAt 0).continuousAt.tendsto.comp ht
  have hi : Tendsto (fun k => (EulerKernel.meanExp (t k))⁻¹) l (𝓝 1) := by
    simpa only [inv_one] using hm.inv₀ (by norm_num : (1 : ℝ) ≠ 0)
  apply hi.congr'
  filter_upwards [htne] with k hk
  rw [EulerKernel.meanExp_of_ne hk,inv_div]

theorem scale_prefactor_tendsto_one :
    Tendsto (fun n : ℕ => scale n/(1-Real.exp (-scale n))) atTop (𝓝 1) :=
  t_div_one_sub_exp_neg_tendsto scale_tendsto_zero
    (scale_eventually_pos.mono (fun _ hn => hn.ne'))

end LineSize.CoefficientAsymptotic
