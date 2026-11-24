import Conjectures.FeldheimWeightedTailWrightIntegral

/-!
# Feldheim–Feldheim’s weighted tail conjecture

The complete unit-interval stability estimate from the recorded proof's
§2. Interior points are controlled by averaging the Wright inequality;
boundary points are controlled by its three finite applications.
-/

open Set MeasureTheory

namespace Conjectures.FeldheimWeightedTail

noncomputable section

theorem wright_unit_boundary_le {F : ℝ → ℝ} {t e M z : ℝ}
    (ht : 0 < t) (ht2 : t ≤ 1/2)
    (hpos : ∀ x ∈ Icc (0 : ℝ) 1, 0 ≤ F x)
    (hmax : ∀ x ∈ Icc (0 : ℝ) 1, F x ≤ M)
    (h0 : F 0 = 0) (hW : WrightBoundOn F (Icc (0 : ℝ) 1) t e)
    (hz0 : 0 ≤ z) (hzt : z ≤ t) : 3*F z ≤ 2*M+3*e := by
  have ht1 : t ≤ 1 := by linarith
  have hs : 0 < 1-t := by linarith
  have hz1 : z ≤ 1 := hzt.trans ht1
  have hR : z/t ∈ Icc (0 : ℝ) 1 := by
    constructor
    · positivity
    · exact (div_le_one ht).mpr hzt
  have hL : z/(1-t) ∈ Icc (0 : ℝ) 1 := by
    constructor
    · positivity
    · apply (div_le_one hs).mpr
      linarith
  let wR := (1-t)*(z/t)
  let wL := t*(z/(1-t))
  have hwR : wR ∈ Icc (0 : ℝ) 1 := by
    constructor
    · dsimp only [wR]; positivity
    · dsimp only [wR]; nlinarith [hR.1, hR.2]
  have hwL : wL ∈ Icc (0 : ℝ) 1 := by
    constructor
    · dsimp only [wL]; positivity
    · dsimp only [wL]; nlinarith [hL.1, hL.2]
  have heR : t*(z/t) = z := by field_simp
  have heL : (1-t)*(z/(1-t)) = z := by field_simp
  have hA := hW 0 (by norm_num) (z/t) hR
  have hB := hW 0 (by norm_num) (z/(1-t)) hL
  simp only [mul_zero, zero_add, h0, heR, heL] at hA hB
  have heC : (1-t)*wL+t*wR = z := by
    dsimp only [wL, wR]
    field_simp
    ring
  have hC := hW wL hwL wR hwR
  rw [heC] at hC
  have hn := hpos (t*wL+(1-t)*wR) (by
    convert convexCombination_mem_unit (x := wL) (y := wR)
      (t := 1-t) hs.le (by linarith) hwL hwR using 1; ring)
  have hmR := hmax (z/t) hR
  have hmL := hmax (z/(1-t)) hL
  change F z+F wR ≤ F (z/t)+e at hA
  change F wL+F z ≤ F (z/(1-t))+e at hB
  linarith

theorem wright_unit_interior_le {F : ℝ → ℝ} {t e z : ℝ}
    (ht : 0 < t) (ht2 : t ≤ 1/2)
    (hF : ContinuousOn F (Icc (0 : ℝ) 1))
    (hpos : ∀ x ∈ Icc (0 : ℝ) 1, 0 ≤ F x)
    (h0 : F 0 = 0) (h1 : F 1 = 0)
    (hW : WrightBoundOn F (Icc (0 : ℝ) 1) t e)
    (hzt : t ≤ z) (hzs : z ≤ 1-t) :
    F z ≤ (1+(1-t)/t^2)*e := by
  have hs : 0 < 1-t := by linarith
  have ht1 : t ≤ 1 := by linarith
  let u : ℝ → ℝ := fun y => (z-t*y)/(1-t)
  let a := (z-t)/(1-t)
  let b := z/(1-t)
  have hu (y : ℝ) (hy : y ∈ Icc (0 : ℝ) 1) : u y ∈ Icc (0 : ℝ) 1 := by
    constructor
    · apply div_nonneg _ hs.le
      nlinarith [hy.1, hy.2]
    · apply (div_le_one hs).mpr
      nlinarith [hy.1, hy.2]
  have huc : ContinuousOn u (Icc (0 : ℝ) 1) := by dsimp only [u]; fun_prop
  have hI := unit_intervalIntegrable hF
  have hUI := unit_comp_intervalIntegrable hF huc hu
  have hpoint (y : ℝ) (hy : y ∈ Icc (0 : ℝ) 1) : F z ≤ F (u y)+F y+e := by
    have h := hW (u y) (hu y hy) y hy
    have he : (1-t)*u y+t*y = z := by dsimp only [u]; field_simp; ring
    rw [he] at h
    have hn := hpos (t*u y+(1-t)*y) (by
      convert convexCombination_mem_unit (x := u y) (y := y)
        (t := 1-t) hs.le (by linarith) (hu y hy) hy using 1; ring)
    linarith
  have hi := intervalIntegral.integral_mono_on (μ := volume) (a := 0) (b := 1)
    (by norm_num) (intervalIntegrable_const (c := F z))
    ((hUI.add hI).add intervalIntegrable_const) hpoint
  rw [intervalIntegral.integral_add (hUI.add hI) intervalIntegrable_const,
    intervalIntegral.integral_add hUI hI] at hi
  simp only [intervalIntegral.integral_const, sub_zero, one_smul] at hi
  have huEq : u = fun y => b-(t/(1-t))*y := by
    funext y
    dsimp only [u, b]
    ring
  have htr : t/(1-t) ≠ 0 := div_ne_zero ht.ne' hs.ne'
  have hbta : b-t/(1-t) = a := by dsimp only [a,b]; ring
  have hint : (∫ y in (0 : ℝ)..1, F (u y)) =
      ((1-t)/t)*(∫ x in a..b, F x) := by
    rw [huEq, intervalIntegral.integral_comp_sub_mul F htr b]
    simp only [mul_one, mul_zero, sub_zero, hbta, inv_div, smul_eq_mul]
  rw [hint] at hi
  have ha0 : 0 ≤ a := by dsimp only [a]; positivity
  have hab : a ≤ b := by
    dsimp only [a,b]
    exact div_le_div_of_nonneg_right (by linarith) hs.le
  have hb1 : b ≤ 1 := (div_le_one hs).mpr hzs
  have hsub : (∫ x in a..b, F x) ≤ ∫ x in (0 : ℝ)..1, F x := by
    apply intervalIntegral.integral_mono_interval ha0 hab hb1 _ hI
    filter_upwards [ae_restrict_mem measurableSet_Ioc] with x hx
    exact hpos x ⟨hx.1.le, hx.2⟩
  have hbound := wright_unit_integral_le ht ht2 hF hpos h0 h1 hW
  have hscale : 0 ≤ (1-t)/t := div_nonneg hs.le ht.le
  calc
    F z ≤ ((1-t)/t)*(∫ x in a..b, F x)+(∫ x in (0 : ℝ)..1, F x)+e := hi
    _ ≤ ((1-t)/t)*(∫ x in (0 : ℝ)..1, F x)+(∫ x in (0 : ℝ)..1, F x)+e := by
      gcongr
    _ = (1/t)*(∫ x in (0 : ℝ)..1, F x)+e := by field_simp; ring
    _ ≤ (1/t)*(((1-t)/t)*e)+e := by gcongr
    _ = (1+(1-t)/t^2)*e := by field_simp; ring

/-- Quantitative fixed-weight Wright stability for a single nonnegative deviation component. -/
theorem wright_unit_le {F : ℝ → ℝ} {t e : ℝ}
    (ht : 0 < t) (ht2 : t ≤ 1/2) (he : 0 ≤ e)
    (hF : ContinuousOn F (Icc (0 : ℝ) 1))
    (hpos : ∀ x ∈ Icc (0 : ℝ) 1, 0 ≤ F x)
    (h0 : F 0 = 0) (h1 : F 1 = 0)
    (hW : WrightBoundOn F (Icc (0 : ℝ) 1) t e) :
    ∀ z ∈ Icc (0 : ℝ) 1, F z ≤ wrightConstant t*e := by
  obtain ⟨z, hz, hmax⟩ := isCompact_Icc.exists_isMaxOn
    (show (Icc (0 : ℝ) 1).Nonempty from ⟨0, by norm_num⟩) hF
  have hM : F z ≤ wrightConstant t*e := by
    by_cases hl : z ≤ t
    · have hh := wright_unit_boundary_le ht ht2 hpos hmax h0 hW hz.1 hl
      have hK := mul_le_mul_of_nonneg_right (wrightConstant_ge_three t) he
      linarith
    · by_cases hr : 1-t ≤ z
      · have hpos' : ∀ x ∈ Icc (0 : ℝ) 1, 0 ≤ F (1-x) := by
          intro x hx
          apply hpos
          constructor <;> linarith [hx.1, hx.2]
        have hmax' : ∀ x ∈ Icc (0 : ℝ) 1, F (1-x) ≤ F z := by
          intro x hx
          apply hmax
          constructor <;> linarith [hx.1, hx.2]
        have hh := wright_unit_boundary_le (F := fun x => F (1-x)) ht ht2 hpos' hmax'
          (by simpa using h1) hW.reflect_unit (z := 1-z) (by linarith [hz.2]) (by linarith)
        have hz' : 1-(1-z) = z := by ring
        rw [hz'] at hh
        have hK := mul_le_mul_of_nonneg_right (wrightConstant_ge_three t) he
        linarith
      · exact (wright_unit_interior_le ht ht2 hF hpos h0 h1 hW (by linarith) (by linarith)).trans
          (mul_le_mul_of_nonneg_right (wrightConstant_ge_interior t) he)
  intro x hx
  exact (hmax hx).trans hM

end

end Conjectures.FeldheimWeightedTail
