module
public import Mathlib.Analysis.SpecialFunctions.ImproperIntegrals
public import Mathlib.MeasureTheory.Integral.Bochner.Set
import Mathlib.Tactic.Linarith

@[expose] public section
namespace PomeranceSarkozy

open MeasureTheory Set
open scoped ENNReal

noncomputable def realUpperTail (μ : Measure ℝ) (s : ℝ) : ℝ := μ.real (Ioi s)

theorem realUpperTail_measurable (μ : Measure ℝ) [IsFiniteMeasure μ] : Measurable (realUpperTail μ) :=
  (show Antitone (realUpperTail μ) from fun _ _ h=>
    measureReal_mono (Ioi_subset_Ioi h) (measure_ne_top _ _)).measurable

theorem realUpperTail_mem_Icc (μ : Measure ℝ) [IsProbabilityMeasure μ] (s : ℝ) :
    realUpperTail μ s∈Icc (0:ℝ) 1 := ⟨ENNReal.toReal_nonneg,measureReal_le_one⟩

/-- The second-moment bound gives one integrable envelope for tail
variances of all normalized Poisson laws. -/
theorem realUpperTail_variance_le_cauchy (μ : Measure ℝ) [IsProbabilityMeasure μ]
    (hInt : Integrable (fun x : ℝ=>x^2) μ) (hMom : (∫ x : ℝ,x^2 ∂μ) ≤ 1) (s : ℝ) :
    realUpperTail μ s*(1-realUpperTail μ s) ≤ 2/(1+s^2) := by
  let p := realUpperTail μ s
  have hp₀ : 0≤ p := (realUpperTail_mem_Icc μ s).1
  have hp₁ : p≤ 1 := (realUpperTail_mem_Icc μ s).2
  have h₁ : p*(1-p)≤ p := mul_le_of_le_one_right hp₀ (by linarith)
  have h₂ : p*(1-p)≤ 1-p := mul_le_of_le_one_left (sub_nonneg.mpr hp₁) hp₁
  by_cases hs : |s|≤ 1
  · have hsq : s^2≤ 1 := by
      rw [← sq_abs]
      simpa only [one_pow] using pow_le_pow_left₀ (abs_nonneg _) hs 2
    refine (h₁.trans hp₁).trans ((le_div_iff₀ (by positivity)).mpr ?_)
    linarith
  · have hs' : 1< |s| := lt_of_not_ge hs
    have hn : 0<s^2 := sq_pos_of_pos (show 0< |s| by linarith) |>.trans_eq (sq_abs s)
    let A : Set ℝ := {x | |s|≤ |x|}
    have h := (hInt.div_const (s^2)).measure_le_integral
      (Filter.Eventually.of_forall (fun x=>show 0≤ x^2/s^2 by positivity))
      (s:=A) (by
        intro x hx
        apply (le_div_iff₀ hn).mpr
        rw [one_mul,← sq_abs s,← sq_abs x]
        exact pow_le_pow_left₀ (abs_nonneg _) hx 2)
    rw [integral_div] at h
    have hv : 0≤ (∫ x : ℝ,x^2 ∂μ)/s^2 := div_nonneg (integral_nonneg (fun _=>sq_nonneg _)) hn.le
    have hA := ENNReal.toReal_mono ENNReal.ofReal_ne_top h
    rw [ENNReal.toReal_ofReal hv] at hA
    have hb : p*(1-p)≤ μ.real A := by
      by_cases hpos : 0≤ s
      · refine h₁.trans (measureReal_mono ?_ (measure_ne_top _ _))
        intro x hx
        change |s|≤ |x|
        rw [abs_of_nonneg hpos]
        exact (le_of_lt hx).trans (le_abs_self _)
      · have hneg : s≤ 0 := le_of_not_ge hpos
        have he : μ.real (Iic s)=1-p := by
          rw [← compl_Ioi,probReal_compl_eq_one_sub measurableSet_Ioi]
          rfl
        have h₂' : p*(1-p) ≤ μ.real (Iic s) := h₂.trans_eq he.symm
        refine h₂'.trans (measureReal_mono ?_ (measure_ne_top _ _))
        intro x hx
        change |s|≤ |x|
        rw [abs_of_nonpos hneg]
        exact (neg_le_neg hx).trans (neg_le_abs _)
    refine hb.trans (hA.trans ((div_le_div_of_nonneg_right hMom hn.le).trans ?_))
    have hsq : 1≤ s^2 := by
      rw [← sq_abs]
      simpa only [one_pow] using pow_le_pow_left₀ (by norm_num : (0:ℝ)≤ 1) hs'.le 2
    apply (div_le_div_iff₀ hn (by positivity)).mpr
    linarith

theorem cauchy_tail_envelope_integrable : Integrable (fun s : ℝ=>2/(1+s^2)) := by
  simpa only [div_eq_mul_inv] using integrable_inv_one_add_sq.const_mul (2:ℝ)

end PomeranceSarkozy
