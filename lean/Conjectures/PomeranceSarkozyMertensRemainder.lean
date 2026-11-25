module
public import Conjectures.PomeranceSarkozyMertensAbel
public import Mathlib.MeasureTheory.Function.Floor
import Mathlib.Tactic.Positivity
import Mathlib.Tactic.Linarith

@[expose] public section
namespace PomeranceSarkozy

open MeasureTheory
open scoped Interval

noncomputable def mertensCorrection (t : ℝ) : ℝ :=
  logSquaredKernel t*(primeWeightedReciprocal ⌊t⌋₊-Real.log t)

private theorem logSquaredKernel_nonneg_of_gt_one {t : ℝ} (ht : 1<t) :
    0≤logSquaredKernel t := by
  have hpos : 0<t := zero_lt_one.trans ht
  unfold logSquaredKernel
  positivity

private theorem mertensCorrection_measurable : Measurable mertensCorrection := by
  have hp : Measurable primeWeightedReciprocal := .of_discrete
  have hw := hp.comp (Nat.measurable_floor : Measurable (Nat.floor : ℝ→ℕ))
  have hk : Measurable logSquaredKernel := by
    unfold logSquaredKernel
    fun_prop
  unfold mertensCorrection
  exact hk.mul (hw.sub Real.measurable_log)

private theorem mertensCorrection_integrable_on {x C : ℝ} (hx : 2≤x)
    (hC : ∀ t : ℝ,2≤t→|primeWeightedReciprocal ⌊t⌋₊-Real.log t|≤C) :
    IntegrableOn mertensCorrection (Set.Ioc (2:ℝ) x) := by
  have hK := (intervalIntegrable_iff_integrableOn_Ioc_of_le hx).mp
    (logSquaredKernel_intervalIntegrable hx)
  apply (hK.const_mul C).mono' mertensCorrection_measurable.aestronglyMeasurable
  filter_upwards [ae_restrict_mem measurableSet_Ioc] with t ht
  have hK₀ := logSquaredKernel_nonneg_of_gt_one ((by norm_num : (1:ℝ)<2).trans ht.1)
  unfold mertensCorrection
  rw [Real.norm_eq_abs,abs_mul,abs_of_nonneg hK₀,mul_comm C]
  exact mul_le_mul_of_nonneg_left (hC t ht.1.le) hK₀

/-- The accumulated Abel correction is uniformly bounded, because
the kernel with the squared logarithmic denominator is integrable. -/
theorem mertensCorrection_integral_bound {x C : ℝ} (hx : 2≤x) (hC₀ : 0≤C)
    (hC : ∀ t : ℝ,2≤t→|primeWeightedReciprocal ⌊t⌋₊-Real.log t|≤C) :
    |(∫ t in Set.Ioc (2:ℝ) x,mertensCorrection t)|≤C*reciprocalLog 2 := by
  have hE := mertensCorrection_integrable_on hx hC
  have hK := (intervalIntegrable_iff_integrableOn_Ioc_of_le hx).mp
    (logSquaredKernel_intervalIntegrable hx)
  calc
    _ ≤ ∫ t in Set.Ioc (2:ℝ) x,|mertensCorrection t| := abs_integral_le_integral_abs
    _ ≤ ∫ t in Set.Ioc (2:ℝ) x,C*logSquaredKernel t := by
      apply integral_mono_ae hE.abs (hK.const_mul C)
      filter_upwards [ae_restrict_mem measurableSet_Ioc] with t ht
      have hK₀ := logSquaredKernel_nonneg_of_gt_one ((by norm_num : (1:ℝ)<2).trans ht.1)
      unfold mertensCorrection
      rw [abs_mul,abs_of_nonneg hK₀,mul_comm C]
      exact mul_le_mul_of_nonneg_left (hC t ht.1.le) hK₀
    _ = C*(reciprocalLog 2-reciprocalLog x) := by
      rw [integral_const_mul,← intervalIntegral.integral_of_le hx,logSquaredKernel_integral hx]
    _ ≤ _ := by
      apply mul_le_mul_of_nonneg_left _ hC₀
      apply sub_le_self
      exact inv_nonneg.mpr (Real.log_nonneg (by linarith))

theorem primeReciprocalSum_expanded {x C : ℝ} (hx : 2≤x)
    (hC : ∀ t : ℝ,2≤t→|primeWeightedReciprocal ⌊t⌋₊-Real.log t|≤C) :
    primeReciprocalSum x=reciprocalLog x*primeWeightedReciprocal ⌊x⌋₊+
      (Real.log (Real.log x)-Real.log (Real.log 2))+
      ∫ t in Set.Ioc (2:ℝ) x,mertensCorrection t := by
  have hE := mertensCorrection_integrable_on hx hC
  have hK := (intervalIntegrable_iff_integrableOn_Ioc_of_le hx).mp (logKernel_intervalIntegrable hx)
  have hi : (∫ t in Set.Ioc (2:ℝ) x,logSquaredKernel t*primeWeightedReciprocal ⌊t⌋₊) =
      (∫ t in Set.Ioc (2:ℝ) x,logKernel t)+(∫ t in Set.Ioc (2:ℝ) x,mertensCorrection t) := by
    rw [← integral_add hK hE]
    apply integral_congr_ae
    filter_upwards [ae_restrict_mem measurableSet_Ioc] with t ht
    have ht' : 1<t := (by norm_num : (1:ℝ)<2).trans ht.1
    have hlog := Real.log_pos ht'
    have he : logKernel t=logSquaredKernel t*Real.log t := by
      unfold logKernel logSquaredKernel
      field_simp
    rw [he]
    unfold mertensCorrection
    ring
  rw [primeReciprocalSum_abel hx,hi,← intervalIntegral.integral_of_le hx,logKernel_integral hx]
  ring

/-- Bounded-error reciprocal prime sum, derived from the finite
Mangoldt identity and the explicit Abel kernel bounds. -/
theorem primeReciprocalSum_logLog_bounded :
    ∃ B : ℝ,∀ x : ℝ,2≤x→|primeReciprocalSum x-Real.log (Real.log x)|≤B := by
  obtain ⟨C,hC₀,hC⟩ := primeWeightedReciprocal_log_real_bounded
  refine ⟨(1+C*reciprocalLog 2)+|Real.log (Real.log 2)|+C*reciprocalLog 2,fun x hx => ?_⟩
  let A := primeWeightedReciprocal ⌊x⌋₊
  let E := ∫ t in Set.Ioc (2:ℝ) x,mertensCorrection t
  have hlogx : 0<Real.log x := Real.log_pos ((by norm_num : (1:ℝ)<2).trans_le hx)
  have hlog2 : 0<Real.log 2 := Real.log_pos (by norm_num)
  have hw₀ : 0≤reciprocalLog x := inv_nonneg.mpr hlogx.le
  have hw : reciprocalLog x≤reciprocalLog 2 := by
    unfold reciprocalLog
    simpa only [one_div] using one_div_le_one_div_of_le hlog2 (Real.log_le_log (by norm_num) hx)
  have hA : |A|≤C+Real.log x := by
    calc
      _ = |(A-Real.log x)+Real.log x| := by congr 1; ring
      _ ≤ _ := (abs_add_le _ _).trans (add_le_add (hC x hx) (by simp [abs_of_nonneg hlogx.le]))
  have hprod : |reciprocalLog x*A|≤1+C*reciprocalLog 2 := by
    rw [abs_mul,abs_of_nonneg hw₀]
    calc
      _ ≤ reciprocalLog x*(C+Real.log x) := mul_le_mul_of_nonneg_left hA hw₀
      _ = 1+C*reciprocalLog x := by
        have h₁ : reciprocalLog x*Real.log x=1 := inv_mul_cancel₀ hlogx.ne'
        rw [mul_add,h₁]
        ring
      _ ≤ _ := add_le_add le_rfl (mul_le_mul_of_nonneg_left hw hC₀)
  have hE : |E|≤C*reciprocalLog 2 := mertensCorrection_integral_bound hx hC₀ hC
  have he : primeReciprocalSum x-Real.log (Real.log x) =
      reciprocalLog x*A+(-Real.log (Real.log 2))+E := by
    have h := primeReciprocalSum_expanded hx hC
    unfold A E
    linarith
  rw [he]
  refine (abs_add_le _ _).trans (add_le_add ?_ hE)
  exact (abs_add_le _ _).trans (by rw [abs_neg]; exact add_le_add hprod le_rfl)

end PomeranceSarkozy
