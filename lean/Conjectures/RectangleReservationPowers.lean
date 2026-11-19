import Conjectures.RectangleReservationFinite
import Conjectures.RectangleParameterBounds

/-! Coarse power margins for the reservations. These deterministic bounds
make all floor and partition thresholds uniform over active heights. -/

namespace RectangleAsymptotics

theorem active_le_height_power (ε : ℝ) (h w a : ℕ) (hh : 2 ≤ h) (hw : h ≤ w)
    (hε : ε ≤ 1/2) (ha : a ∈ active ε h w) : (a : ℝ) ≤ (h : ℝ)^(1-2*ε) := by
  have ham : (a : ℝ) ≤ M ε h w := by exact_mod_cast (Finset.mem_Icc.mp ha).2
  exact ham.trans (M_le_height_power ε h w (by omega) hw hε)

theorem smallAspect_M_sq (ε : ℝ) (h w : ℕ) (hh : 2 ≤ h) (hw : h ≤ w)
    (hε : 0 < ε) (hεsmall : ε < 1/10) (hs : smallAspect ε h w) :
    (M ε h w : ℝ)^2 ≤ (h : ℝ)^(1-ε) := by
  have hh0 : (0 : ℝ) < h := by exact_mod_cast (show 0 < h by omega)
  have hh1 : (1 : ℝ) ≤ h := by exact_mod_cast (show 1 ≤ h by omega)
  have harea : area h w ≤ (h : ℝ)^(2+ε) := by
    calc
      area h w = (h : ℝ)*(w : ℝ) := by simp only [area,Nat.cast_mul]
      _ ≤ (h : ℝ)*((h : ℝ)^(1+ε)) := mul_le_mul_of_nonneg_left hs hh0.le
      _ = (h : ℝ)^(1 : ℝ)*(h : ℝ)^(1+ε) := by rw [Real.rpow_one]
      _ = (h : ℝ)^(2+ε) := by rw [← Real.rpow_add hh0]; congr 1; ring
  have hmono := Real.rpow_le_rpow (area_nonneg h w) harea (show 0 ≤ 1/2-ε by linarith)
  rw [← Real.rpow_mul hh0.le] at hmono
  have hexp : (2+ε)*(1/2-ε) ≤ 1-ε := by nlinarith only [hε,sq_nonneg ε]
  exact (M_sq_le_area_power ε h w (by omega) hw (by linarith)).trans
    (hmono.trans (Real.rpow_le_rpow_of_exponent_le hh1 hexp))

theorem power_le_height_div (h : ℕ) (r D : ℝ) (hh : 0 < h) (hD : 0 < D)
    (hbound : D ≤ (h : ℝ)^(1-r)) : (h : ℝ)^r ≤ (h : ℝ)/D := by
  have hh0 : (0 : ℝ) < h := by exact_mod_cast hh
  apply (le_div_iff₀ hD).mpr
  calc
    (h : ℝ)^r*D ≤ (h : ℝ)^r*(h : ℝ)^(1-r) :=
      mul_le_mul_of_nonneg_left hbound (Real.rpow_nonneg hh0.le r)
    _ = h := by rw [← Real.rpow_add hh0,show r+(1-r)=(1 : ℝ) by ring,Real.rpow_one]

theorem idealQ_ge_power (ε : ℝ) (h w a : ℕ) (hh : 2 ≤ h) (hw : h ≤ w)
    (hε : 0 < ε) (hεsmall : ε < 1/10) (ha : a ∈ active ε h w)
    (hL : 1 ≤ L ε h w) (hLp : L ε h w ≤ (h : ℝ)^(ε/2)) :
    (h : ℝ)^(ε/2) ≤ idealQ ε h w a := by
  have hh0 : (0 : ℝ) < h := by exact_mod_cast (show 0 < h by omega)
  have hh1 : (1 : ℝ) ≤ h := by exact_mod_cast (show 1 ≤ h by omega)
  have ha0 : (0 : ℝ) < a := by exact_mod_cast (show 0 < a by have := active_positive ε h w hε hh a ha; omega)
  have hL0 : 0 < L ε h w := by linarith
  by_cases hs : smallAspect ε h w
  · have ham : (a : ℝ) ≤ M ε h w := by exact_mod_cast (Finset.mem_Icc.mp ha).2
    have haSq : (a : ℝ)^2 ≤ (h : ℝ)^(1-ε) :=
      ((sq_le_sq₀ (Nat.cast_nonneg a) (Nat.cast_nonneg (M ε h w))).mpr ham).trans
        (smallAspect_M_sq ε h w hh hw hε hεsmall hs)
    have hD : L ε h w*(a : ℝ)^2 ≤ (h : ℝ)^(1-ε/2) := by
      calc
        _ ≤ (h : ℝ)^(ε/2)*(h : ℝ)^(1-ε) :=
          mul_le_mul hLp haSq (sq_nonneg _) (Real.rpow_nonneg hh0.le _)
        _ = _ := by rw [← Real.rpow_add hh0]; congr 1; ring
    have hdpos : 0 < L ε h w*(a : ℝ)^2 := mul_pos hL0 (sq_pos_of_pos ha0)
    simpa only [idealQ,if_pos hs] using power_le_height_div h (ε/2) _ (by omega) hdpos hD
  · have haUpper := (active_le_height_power ε h w a hh hw (by linarith) ha).trans
      (Real.rpow_le_rpow_of_exponent_le hh1 (show 1-2*ε ≤ 1-ε/2 by linarith))
    simpa only [idealQ,if_neg hs] using power_le_height_div h (ε/2) (a : ℝ) (by omega) ha0 haUpper

theorem idealB_ge_power (ε : ℝ) (h w a : ℕ) (hh : 2 ≤ h) (hw : h ≤ w)
    (hε : 0 < ε) (hεsmall : ε < 1/10) (ha : a ∈ active ε h w)
    (hL : 1 ≤ L ε h w) (hLp : L ε h w ≤ (h : ℝ)^(ε/2)) :
    (h : ℝ)^(ε/2) ≤ idealB ε h w a := by
  have hh0 : (0 : ℝ) < h := by exact_mod_cast (show 0 < h by omega)
  have hh1 : (1 : ℝ) ≤ h := by exact_mod_cast (show 1 ≤ h by omega)
  have hwR : (h : ℝ) ≤ w := by exact_mod_cast hw
  have ha0 : (0 : ℝ) < a := by exact_mod_cast (show 0 < a by have := active_positive ε h w hε hh a ha; omega)
  have hL0 : 0 < L ε h w := by linarith
  by_cases hs : smallAspect ε h w
  · have hp := Real.rpow_le_rpow_of_exponent_le hh1 (show ε/2 ≤ (1 : ℝ) by linarith)
    rw [Real.rpow_one] at hp
    exact hp.trans (by simpa only [idealB,if_pos hs] using hwR)
  · have haUpper := active_le_height_power ε h w a hh hw (by linarith) ha
    have hD : L ε h w*(a : ℝ) ≤ (h : ℝ)^(1-ε/2) := by
      calc
        _ ≤ (h : ℝ)^(ε/2)*(h : ℝ)^(1-2*ε) :=
          mul_le_mul hLp haUpper ha0.le (Real.rpow_nonneg hh0.le _)
        _ = (h : ℝ)^(1-3*ε/2) := by rw [← Real.rpow_add hh0]; congr 1; ring
        _ ≤ _ := Real.rpow_le_rpow_of_exponent_le hh1 (by linarith)
    have hdpos : 0 < L ε h w*(a : ℝ) := mul_pos hL0 ha0
    have hp := (power_le_height_div h (ε/2) _ (by omega) hdpos hD).trans
      (div_le_div_of_nonneg_right hwR hdpos.le)
    simpa only [idealB,if_neg hs] using hp

theorem volume_ge_height_power (ε : ℝ) (h w a : ℕ) (hh : 2 ≤ h) (hw : h ≤ w)
    (hε : 0 < ε) (hεsmall : ε < 1/10) (ha : a ∈ active ε h w)
    (hL : 1 ≤ L ε h w) (hLp : L ε h w ≤ (h : ℝ)^(ε/2)) :
    (h : ℝ)^(3*ε) ≤ area h w/(L ε h w*(a : ℝ)^2) := by
  have hh0 : (0 : ℝ) < h := by exact_mod_cast (show 0 < h by omega)
  have hh1 : (1 : ℝ) ≤ h := by exact_mod_cast (show 1 ≤ h by omega)
  have ha0 : (0 : ℝ) < a := by exact_mod_cast (show 0 < a by have := active_positive ε h w hε hh a ha; omega)
  have hL0 : 0 < L ε h w := by linarith
  have haUpper := active_le_height_power ε h w a hh hw (by linarith) ha
  have haSq : (a : ℝ)^2 ≤ (h : ℝ)^(2-4*ε) := by
    have hh := (sq_le_sq₀ ha0.le (Real.rpow_nonneg hh0.le (1-2*ε))).mpr haUpper
    rw [← Real.rpow_mul_natCast hh0.le] at hh
    convert hh using 1 <;> congr 1 <;> ring
  have hD : L ε h w*(a : ℝ)^2 ≤ (h : ℝ)^(2-3*ε) := by
    calc
      _ ≤ (h : ℝ)^(ε/2)*(h : ℝ)^(2-4*ε) :=
        mul_le_mul hLp haSq (sq_nonneg _) (Real.rpow_nonneg hh0.le _)
      _ = (h : ℝ)^(2-7*ε/2) := by rw [← Real.rpow_add hh0]; congr 1; ring
      _ ≤ _ := Real.rpow_le_rpow_of_exponent_le hh1 (by linarith)
  apply (le_div_iff₀ (mul_pos hL0 (sq_pos_of_pos ha0))).mpr
  calc
    _ ≤ (h : ℝ)^(3*ε)*(h : ℝ)^(2-3*ε) :=
      mul_le_mul_of_nonneg_left hD (Real.rpow_nonneg hh0.le _)
    _ = (h : ℝ)^2 := by
      rw [← Real.rpow_add hh0,show 3*ε+(2-3*ε)=(2 : ℝ) by ring]
      exact Real.rpow_natCast _ 2
    _ ≤ area h w := area_ge_sq hw

theorem T_le_area (ε : ℝ) (h w a : ℕ) (hh : 2 ≤ h) (hε : 0 < ε)
    (ha : a ∈ active ε h w) (hL : 1 ≤ L ε h w) : T ε h w a ≤ h*w := by
  have haNat : 1 ≤ a := by have := active_positive ε h w hε hh a ha; omega
  have ha0 : 0 < a := by omega
  have haR : (1 : ℝ) ≤ a := by exact_mod_cast haNat
  have hL0 : 0 < L ε h w := by linarith
  have hD : 1 ≤ L ε h w*(a : ℝ)^2 := by
    have hs : (1 : ℝ) ≤ (a : ℝ)^2 := by
      simpa only [one_pow] using
        (sq_le_sq₀ (by norm_num : (0 : ℝ) ≤ 1) (Nat.cast_nonneg a)).mpr haR
    simpa only [one_mul] using mul_le_mul hL hs (by norm_num : (0 : ℝ) ≤ 1) hL0.le
  have hvol : area h w/(L ε h w*(a : ℝ)^2) ≤ area h w := by
    apply (div_le_iff₀ (show 0 < L ε h w*(a : ℝ)^2 by linarith)).mpr
    simpa only [mul_one] using mul_le_mul_of_nonneg_left hD (area_nonneg h w)
  have ht := (T_le_volume ε h w a hL0 ha0).trans hvol
  change (T ε h w a : ℝ) ≤ ((h*w : ℕ) : ℝ) at ht
  exact_mod_cast ht

end RectangleAsymptotics
