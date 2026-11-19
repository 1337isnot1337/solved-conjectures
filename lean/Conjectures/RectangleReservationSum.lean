import Conjectures.RectangleReservationFinite
import Conjectures.RectangleParameterBounds

/-! The aggregate square-root budget obtained from the pointwise volume
and harmonic-mass bounds. -/

namespace RectangleAsymptotics

open Finset

theorem sqrt_volume (N L a : ℝ) (hN : 0 ≤ N) (hL : 0 < L) (ha : 0 < a) :
    Real.sqrt (N/(L*a^2))=Real.sqrt (N/L)/a := by
  rw [div_mul_eq_div_div,Real.sqrt_div (div_nonneg hN hL.le),Real.sqrt_sq ha.le]

theorem sqrt_div_mul (N L : ℝ) (hN : 0 ≤ N) (hL : 0 < L) :
    Real.sqrt (N/L)*L=Real.sqrt (N*L) := by
  calc
    Real.sqrt (N/L)*L=Real.sqrt ((N/L)*L^2) := by
      rw [Real.sqrt_mul (div_nonneg hN hL.le),Real.sqrt_sq hL.le]
    _ = Real.sqrt (N*L) := by congr 1; field_simp <;> ring

theorem sqrt_T_lower (ε : ℝ) (h w a : ℕ) (hε : 0 < ε) (hε1 : ε ≤ 1)
    (hL : 0 < L ε h w) (ha : 0 < a)
    (hT : (1-ε)^3*(area h w/(L ε h w*(a : ℝ)^2)) ≤ (T ε h w a : ℝ)) :
    ((1-ε)^2*Real.sqrt (area h w/L ε h w))*(1/(a : ℝ)) ≤ Real.sqrt (T ε h w a : ℝ) := by
  have hq : 0 ≤ 1-ε := by linarith
  have hq1 : 1-ε ≤ 1 := by linarith
  have haR : (0 : ℝ) < a := by exact_mod_cast ha
  have hvol : 0 ≤ area h w/(L ε h w*(a : ℝ)^2) :=
    div_nonneg (area_nonneg h w) (mul_nonneg hL.le (sq_nonneg (a : ℝ)))
  have hp : (1-ε)^4 ≤ (1-ε)^3 := by
    calc
      (1-ε)^4=(1-ε)^3*(1-ε) := by ring
      _ ≤ (1-ε)^3*1 := mul_le_mul_of_nonneg_left hq1 (pow_nonneg hq 3)
      _ = _ := by ring
  have hh := (mul_le_mul_of_nonneg_right hp hvol).trans hT
  have hs := Real.sqrt_le_sqrt hh
  rw [show (1-ε)^4=((1-ε)^2)^2 by ring,
    Real.sqrt_mul (sq_nonneg ((1-ε)^2)),Real.sqrt_sq (sq_nonneg (1-ε)),
    sqrt_volume _ _ _ (area_nonneg h w) hL haR] at hs
  simpa only [mul_one_div,mul_div_assoc] using hs

theorem reservation_sum_sqrt_lower (ε : ℝ) (h w : ℕ) (hh : 2 ≤ h) (hw : h ≤ w)
    (hε : 0 < ε) (hεsmall : ε < 1/10) (hL : 0 < L ε h w)
    (hLrelative : (1-5*ε)*Real.log (U h w) ≤ L ε h w)
    (hT : ∀ a ∈ active ε h w,
      (1-ε)^3*(area h w/(L ε h w*(a : ℝ)^2)) ≤ (T ε h w a : ℝ)) :
    (1-7*ε)*scale h w ≤ ∑ a ∈ active ε h w,Real.sqrt (T ε h w a : ℝ) := by
  have hq : 0 ≤ 1-ε := by linarith
  have hk : 0 ≤ 1-5*ε := by linarith
  have hk1 : 1-5*ε ≤ 1 := by linarith
  have hlog : 0 ≤ Real.log (U h w) := Real.log_nonneg (one_le_U (by omega) hw)
  have hsum :
      (∑ a ∈ active ε h w,((1-ε)^2*Real.sqrt (area h w/L ε h w))*(1/(a : ℝ))) ≤
        ∑ a ∈ active ε h w,Real.sqrt (T ε h w a : ℝ) := by
    apply Finset.sum_le_sum
    intro a ha
    exact sqrt_T_lower ε h w a hε (by linarith) hL
      (by have := active_positive ε h w hε hh a ha; omega) (hT a ha)
  rw [← Finset.mul_sum] at hsum
  change ((1-ε)^2*Real.sqrt (area h w/L ε h w))*L ε h w ≤ _ at hsum
  rw [mul_assoc,sqrt_div_mul _ _ (area_nonneg h w) hL] at hsum
  have hkl : (1-5*ε)^2*Real.log (U h w) ≤ L ε h w := by
    have hs : (1-5*ε)^2 ≤ 1-5*ε := by
      nlinarith only [mul_nonneg hk (sub_nonneg.mpr hk1)]
    exact (mul_le_mul_of_nonneg_right hs hlog).trans hLrelative
  have hprod : (1-5*ε)^2*(area h w*Real.log (U h w)) ≤ area h w*L ε h w := by
    calc
      _ = area h w*((1-5*ε)^2*Real.log (U h w)) := by ring
      _ ≤ _ := mul_le_mul_of_nonneg_left hkl (area_nonneg h w)
  have hsqrt := Real.sqrt_le_sqrt hprod
  rw [Real.sqrt_mul (sq_nonneg (1-5*ε)),Real.sqrt_sq hk] at hsqrt
  change (1-5*ε)*scale h w ≤ Real.sqrt (area h w*L ε h w) at hsqrt
  have hcoef : 1-7*ε ≤ (1-ε)^2*(1-5*ε) := by
    have hm := mul_nonneg (sq_nonneg ε) (show 0 ≤ 11-5*ε by linarith)
    nlinarith only [hm]
  calc
    (1-7*ε)*scale h w ≤ ((1-ε)^2*(1-5*ε))*scale h w :=
      mul_le_mul_of_nonneg_right hcoef (Real.sqrt_nonneg _)
    _ = (1-ε)^2*((1-5*ε)*scale h w) := by ring
    _ ≤ (1-ε)^2*Real.sqrt (area h w*L ε h w) :=
      mul_le_mul_of_nonneg_left hsqrt (sq_nonneg (1-ε))
    _ ≤ _ := hsum

end RectangleAsymptotics
