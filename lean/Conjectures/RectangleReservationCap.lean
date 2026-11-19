import Conjectures.RectangleReservationPowers

/-! A uniform lower margin for the width cap compared with the square root
of the partition budget. -/

namespace RectangleAsymptotics

theorem power_mul_volume_le_idealB_sq (ε : ℝ) (h w a : ℕ) (hh : 2 ≤ h) (hw : h ≤ w)
    (hε : 0 < ε) (hεsmall : ε < 1/10) (ha : a ∈ active ε h w)
    (hL : 1 ≤ L ε h w) (hLp : L ε h w ≤ (h : ℝ)^(ε/2)) :
    (h : ℝ)^(ε/2)*(area h w/(L ε h w*(a : ℝ)^2)) ≤ (idealB ε h w a)^2 := by
  have hh0 : (0 : ℝ) < h := by exact_mod_cast (show 0 < h by omega)
  have hh1 : (1 : ℝ) ≤ h := by exact_mod_cast (show 1 ≤ h by omega)
  have hwR : (h : ℝ) ≤ w := by exact_mod_cast hw
  have ha0 : (0 : ℝ) < a := by exact_mod_cast (show 0 < a by have := active_positive ε h w hε hh a ha; omega)
  have hL0 : 0 < L ε h w := by linarith
  have hvol : 0 ≤ area h w/(L ε h w*(a : ℝ)^2) :=
    div_nonneg (area_nonneg h w) (mul_nonneg hL0.le (sq_nonneg (a : ℝ)))
  by_cases hs : smallAspect ε h w
  · have haLower := active_lower ε h w a ha
    have hpSq : (h : ℝ)^(2*ε) ≤ (a : ℝ)^2 := by
      have hh := (sq_le_sq₀ (Real.rpow_nonneg hh0.le ε) ha0.le).mpr haLower
      rw [← Real.rpow_mul_natCast hh0.le] at hh
      convert hh using 1 <;> congr 1 <;> ring
    have hD : (h : ℝ)^(ε/2) ≤ L ε h w*(a : ℝ)^2 := by
      calc
        _ ≤ (h : ℝ)^(2*ε) := Real.rpow_le_rpow_of_exponent_le hh1 (by linarith)
        _ ≤ (a : ℝ)^2 := hpSq
        _ ≤ _ := by simpa only [one_mul] using mul_le_mul_of_nonneg_right hL (sq_nonneg (a : ℝ))
    calc
      _ ≤ (L ε h w*(a : ℝ)^2)*(area h w/(L ε h w*(a : ℝ)^2)) :=
        mul_le_mul_of_nonneg_right hD hvol
      _ = area h w := by field_simp
      _ ≤ (w : ℝ)^2 := by
        simpa only [area,Nat.cast_mul,pow_two] using mul_le_mul_of_nonneg_right hwR (Nat.cast_nonneg w)
      _ = _ := by rw [idealB,if_pos hs]
  · have hlarge : (h : ℝ)^(1+ε) < w := lt_of_not_ge hs
    have hmul : (h : ℝ)^(ε/2)*(L ε h w*(h : ℝ)) ≤ w := by
      calc
        _ = (h : ℝ)*((h : ℝ)^(ε/2)*L ε h w) := by ring
        _ ≤ (h : ℝ)*((h : ℝ)^(ε/2)*(h : ℝ)^(ε/2)) :=
          mul_le_mul_of_nonneg_left
            (mul_le_mul_of_nonneg_left hLp (Real.rpow_nonneg hh0.le _)) hh0.le
        _ = (h : ℝ)^(1+ε) := by
          rw [← Real.rpow_add hh0,show ε/2+ε/2=ε by ring]
          calc
            (h : ℝ)*(h : ℝ)^ε=(h : ℝ)^(1 : ℝ)*(h : ℝ)^ε := by rw [Real.rpow_one]
            _ = _ := (Real.rpow_add hh0 1 ε).symm
        _ ≤ w := hlarge.le
    have hr : (h : ℝ)^(ε/2) ≤ (w : ℝ)/(L ε h w*(h : ℝ)) :=
      (le_div_iff₀ (mul_pos hL0 hh0)).mpr hmul
    calc
      _ ≤ ((w : ℝ)/(L ε h w*(h : ℝ)))*(area h w/(L ε h w*(a : ℝ)^2)) :=
        mul_le_mul_of_nonneg_right hr hvol
      _ = _ := by
        simp only [idealB,if_neg hs,area,Nat.cast_mul]
        field_simp <;> ring

theorem cap_ratio_ge_power (ε : ℝ) (h w a : ℕ) (hh : 2 ≤ h) (hw : h ≤ w)
    (hε : 0 < ε) (hεsmall : ε < 1/10) (ha : a ∈ active ε h w)
    (hL : 1 ≤ L ε h w) (hLp : L ε h w ≤ (h : ℝ)^(ε/2))
    (hq : (1-ε)*idealQ ε h w a ≤ (Q ε h w a : ℝ))
    (hb : (1-ε)*idealB ε h w a ≤ (B ε h w a : ℝ))
    (hc : (1-ε)*(ε*(B ε h w a : ℝ)) ≤ (C ε h w a : ℝ)) :
    ((1-ε)^2*ε)*(h : ℝ)^(ε/4) ≤ (C ε h w a : ℝ)/Real.sqrt (T ε h w a : ℝ) := by
  have hh0 : (0 : ℝ) < h := by exact_mod_cast (show 0 < h by omega)
  have haNat : 0 < a := by have := active_positive ε h w hε hh a ha; omega
  have ha0 : (0 : ℝ) < a := by exact_mod_cast haNat
  have hL0 : 0 < L ε h w := by linarith
  have hqpos : 0 < 1-ε := by linarith
  have hVpos : 0 < area h w/(L ε h w*(a : ℝ)^2) := by
    exact div_pos (area_pos (by omega) hw) (mul_pos hL0 (sq_pos_of_pos ha0))
  have hT := T_ge_volume ε h w a hε (by linarith) hL0 haNat hq hb
  have hTpos : (0 : ℝ) < T ε h w a := (mul_pos (pow_pos hqpos 3) hVpos).trans_le hT
  let k : ℝ := (1-ε)^2*ε
  have hk : 0 ≤ k := by dsimp [k]; positivity
  have hcap : k*idealB ε h w a ≤ (C ε h w a : ℝ) := by
    calc
      k*idealB ε h w a=((1-ε)*ε)*((1-ε)*idealB ε h w a) := by dsimp [k]; ring
      _ ≤ ((1-ε)*ε)*(B ε h w a : ℝ) :=
        mul_le_mul_of_nonneg_left hb (mul_nonneg hqpos.le hε.le)
      _ ≤ _ := by simpa only [mul_assoc] using hc
  have hsqcap := (sq_le_sq₀ (mul_nonneg hk (idealB_nonneg ε h w a hL0.le))
    (Nat.cast_nonneg (C ε h w a))).mpr hcap
  have hvol := power_mul_volume_le_idealB_sq ε h w a hh hw hε hεsmall ha hL hLp
  have hbudget : (h : ℝ)^(ε/2)*(T ε h w a : ℝ) ≤ (idealB ε h w a)^2 :=
    (mul_le_mul_of_nonneg_left (T_le_volume ε h w a hL0 haNat) (Real.rpow_nonneg hh0.le _)).trans hvol
  have hsq : k^2*((h : ℝ)^(ε/2)*(T ε h w a : ℝ)) ≤ (C ε h w a : ℝ)^2 := by
    calc
      _ ≤ k^2*(idealB ε h w a)^2 := mul_le_mul_of_nonneg_left hbudget (sq_nonneg k)
      _ = (k*idealB ε h w a)^2 := by ring
      _ ≤ _ := hsqcap
  have hpow : ((h : ℝ)^(ε/4))^2=(h : ℝ)^(ε/2) := by
    rw [← Real.rpow_mul_natCast hh0.le]
    congr 1
    ring
  have hsq' : ((k*(h : ℝ)^(ε/4))*Real.sqrt (T ε h w a : ℝ))^2 ≤ (C ε h w a : ℝ)^2 := by
    simpa only [mul_pow,hpow,Real.sq_sqrt (Nat.cast_nonneg (T ε h w a)),mul_assoc] using hsq
  have hlin := (sq_le_sq₀
    (mul_nonneg (mul_nonneg hk (Real.rpow_nonneg hh0.le _)) (Real.sqrt_nonneg _))
    (Nat.cast_nonneg (C ε h w a))).mp hsq'
  exact (le_div_iff₀ (Real.sqrt_pos.mpr hTpos)).mpr hlin

end RectangleAsymptotics
