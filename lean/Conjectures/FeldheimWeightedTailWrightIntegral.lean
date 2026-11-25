import Conjectures.FeldheimWeightedTailBasic

/-!
# Feldheim–Feldheim’s weighted tail conjecture

The integral estimate in §2 of the recorded proof: a nonnegative continuous
deviation on the unit interval, zero at both endpoints, has a bounded mean
under the fixed-weight approximate Wright inequality. All interval integrals
are the actual Lebesgue integrals.
-/

open Set MeasureTheory

namespace Conjectures.FeldheimWeightedTail

noncomputable section

theorem unit_intervalIntegrable {F : ℝ → ℝ}
    (hF : ContinuousOn F (Icc (0 : ℝ) 1)) : IntervalIntegrable F volume 0 1 :=
  hF.intervalIntegrable_of_Icc (by norm_num)

theorem unit_comp_intervalIntegrable {F u : ℝ → ℝ}
    (hF : ContinuousOn F (Icc (0 : ℝ) 1))
    (hu : ContinuousOn u (Icc (0 : ℝ) 1))
    (hmap : ∀ x ∈ Icc (0 : ℝ) 1, u x ∈ Icc (0 : ℝ) 1) :
    IntervalIntegrable (fun x => F (u x)) volume 0 1 :=
  (hF.comp hu hmap).intervalIntegrable_of_Icc (by norm_num)

theorem unit_subinterval_integrable {F : ℝ → ℝ} {a b : ℝ}
    (hF : ContinuousOn F (Icc (0 : ℝ) 1)) (ha : 0 ≤ a) (hab : a ≤ b) (hb : b ≤ 1) :
    IntervalIntegrable F volume a b :=
  (hF.mono (Icc_subset_Icc ha hb)).intervalIntegrable_of_Icc hab

/-- The integral of a nonnegative endpoint-zero deviation is controlled by its Wright error. -/
theorem wright_unit_integral_le {F : ℝ → ℝ} {t e : ℝ}
    (ht : 0 < t) (ht2 : t ≤ 1/2)
    (hF : ContinuousOn F (Icc (0 : ℝ) 1))
    (hpos : ∀ x ∈ Icc (0 : ℝ) 1, 0 ≤ F x)
    (h0 : F 0 = 0) (h1 : F 1 = 0)
    (hW : WrightBoundOn F (Icc (0 : ℝ) 1) t e) :
    (∫ x in (0 : ℝ)..1, F x) ≤ ((1-t)/t)*e := by
  have ht1 : t ≤ 1 := by linarith
  have hs : 0 < 1-t := by linarith
  have hI := unit_intervalIntegrable hF
  have htx : IntervalIntegrable (fun x => F (t*x)) volume 0 1 :=
    unit_comp_intervalIntegrable hF (by fun_prop) (by
      intro x hx
      constructor
      · exact mul_nonneg ht.le hx.1
      · nlinarith [hx.1, hx.2])
  have hsx : IntervalIntegrable (fun x => F ((1-t)*x)) volume 0 1 :=
    unit_comp_intervalIntegrable hF (by fun_prop) (by
      intro x hx
      constructor
      · exact mul_nonneg hs.le hx.1
      · nlinarith [hx.1, hx.2])
  have hatx : IntervalIntegrable (fun x => F (1-t+t*x)) volume 0 1 :=
    unit_comp_intervalIntegrable hF (by fun_prop) (by
      intro x hx
      constructor <;> nlinarith [hx.1, hx.2])
  have hatsx : IntervalIntegrable (fun x => F (t+(1-t)*x)) volume 0 1 :=
    unit_comp_intervalIntegrable hF (by fun_prop) (by
      intro x hx
      constructor <;> nlinarith [hx.1, hx.2])
  have hleft := intervalIntegral.integral_mono_on (μ := volume) (a := 0) (b := 1)
    (by norm_num) (htx.add hsx) (hI.add intervalIntegrable_const) (by
      intro x hx
      have hh := hW 0 (by norm_num) x hx
      simpa only [mul_zero, zero_add, h0] using hh)
  have hright := intervalIntegral.integral_mono_on (μ := volume) (a := 0) (b := 1)
    (by norm_num) (hatx.add hatsx) (hI.add intervalIntegrable_const) (by
      intro x hx
      have hh := hW 1 (by norm_num) x hx
      simpa only [mul_one, h1, zero_add] using hh)
  rw [intervalIntegral.integral_add htx hsx,
    intervalIntegral.integral_add hI intervalIntegrable_const,
    intervalIntegral.integral_comp_mul_left F ht.ne',
    intervalIntegral.integral_comp_mul_left F hs.ne'] at hleft
  rw [intervalIntegral.integral_add hatx hatsx,
    intervalIntegral.integral_add hI intervalIntegrable_const,
    intervalIntegral.integral_comp_add_mul F ht.ne' (1-t),
    intervalIntegral.integral_comp_add_mul F hs.ne' t] at hright
  simp only [mul_zero, mul_one, add_zero, sub_zero, intervalIntegral.integral_const,
    smul_eq_mul, sub_add_cancel] at hleft hright
  have htend : t + (1-t) = 1 := by ring
  rw [htend] at hright
  have hu := unit_subinterval_integrable hF (a := 0) (b := t) (by norm_num) ht.le ht1
  have hsu := unit_subinterval_integrable hF (a := 0) (b := 1-t) (by norm_num) hs.le (by linarith)
  have hv := unit_subinterval_integrable hF (a := 1-t) (b := 1) hs.le (by linarith) le_rfl
  have hsv := unit_subinterval_integrable hF (a := t) (b := 1) ht.le ht1 le_rfl
  have hsplit₁ := intervalIntegral.integral_add_adjacent_intervals hu hsv
  have hsplit₂ := intervalIntegral.integral_add_adjacent_intervals hsu hv
  have hnonneg₁ : 0 ≤ ∫ x in (0 : ℝ)..t, F x :=
    intervalIntegral.integral_nonneg ht.le (fun x hx => hpos x ⟨hx.1, hx.2.trans ht1⟩)
  have hnonneg₂ : 0 ≤ ∫ x in (1-t)..1, F x :=
    intervalIntegral.integral_nonneg (by linarith) (fun x hx => hpos x ⟨hs.le.trans hx.1, hx.2⟩)
  have hsum := mul_le_mul_of_nonneg_left (add_le_add hleft hright)
    (by positivity : 0 ≤ t*(1-t))
  have he₁ : t*(1-t)*(t⁻¹*(∫ x in (0 : ℝ)..t, F x) +
      (1-t)⁻¹*(∫ x in (0 : ℝ)..(1-t), F x) +
      (t⁻¹*(∫ x in (1-t)..1, F x) +
      (1-t)⁻¹*(∫ x in t..1, F x))) =
      (1-t)*((∫ x in (0 : ℝ)..t, F x)+(∫ x in (1-t)..1, F x)) +
      t*((∫ x in (0 : ℝ)..(1-t), F x)+(∫ x in t..1, F x)) := by
    field_simp [ht.ne', hs.ne']
    ring
  rw [he₁] at hsum
  have hB : 0 ≤ (1-2*t)*((∫ x in (0 : ℝ)..t, F x)+(∫ x in (1-t)..1, F x)) :=
    mul_nonneg (by linarith) (add_nonneg hnonneg₁ hnonneg₂)
  have hpoly : (2*t)*(t*(∫ x in (0 : ℝ)..1, F x)) ≤ (2*t)*((1-t)*e) := by
    nlinarith [hsplit₁, hsplit₂]
  have hcancel : t*(∫ x in (0 : ℝ)..1, F x) ≤ (1-t)*e := by
    nlinarith only [hpoly, ht]
  rw [div_mul_eq_mul_div]
  apply (le_div_iff₀ ht).mpr
  simpa only [mul_comm (∫ x in (0 : ℝ)..1, F x) t] using hcancel

end

end Conjectures.FeldheimWeightedTail
