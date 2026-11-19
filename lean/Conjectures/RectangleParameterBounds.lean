import Conjectures.RectangleParameters
import Mathlib.Analysis.SpecialFunctions.Log.Basic
import Mathlib.Tactic.Linarith
import Mathlib.Tactic.Positivity
import Mathlib.Tactic.Ring
import Mathlib.Tactic.NormNum

/-! Shared algebraic bounds for area, the active side-length cutoff,
and the normalization in the uniform rectangle asymptotic. -/

namespace RectangleAsymptotics

theorem area_nonneg (h w : ℕ) : 0 ≤ area h w := by unfold area; positivity

theorem area_pos {h w : ℕ} (hh : 0 < h) (hw : h ≤ w) : 0 < area h w := by
  have hw' : 0 < w := lt_of_lt_of_le hh hw
  unfold area
  positivity

theorem area_ge_sq {h w : ℕ} (hw : h ≤ w) : (h : ℝ)^2 ≤ area h w := by
  have hw' : (h : ℝ) ≤ w := by exact_mod_cast hw
  simpa only [area,Nat.cast_mul,pow_two] using
    mul_le_mul_of_nonneg_left hw' (Nat.cast_nonneg h)

theorem U_le_height (h w : ℕ) : U h w ≤ h := min_le_left _ _

theorem U_le_quarter (h w : ℕ) : U h w ≤ (area h w)^(1/4 : ℝ) := min_le_right _ _

theorem U_pos {h w : ℕ} (hh : 0 < h) (hw : h ≤ w) : 0 < U h w := by
  unfold U
  exact lt_min (by exact_mod_cast hh) (Real.rpow_pos_of_pos (area_pos hh hw) _)

theorem sqrt_height_le_U {h w : ℕ} (hh : 1 ≤ h) (hw : h ≤ w) : Real.sqrt (h : ℝ) ≤ U h w := by
  have hhR : (1 : ℝ) ≤ h := by exact_mod_cast hh
  apply le_min
  · exact Real.sqrt_le_self_iff.mpr (Or.inr hhR)
  · calc
      Real.sqrt (h : ℝ) = ((h : ℝ)^2)^(1/4 : ℝ) := by
        rw [Real.sqrt_eq_rpow,← Real.rpow_natCast_mul (Nat.cast_nonneg h)]
        norm_num
      _ ≤ (area h w)^(1/4 : ℝ) := Real.rpow_le_rpow (sq_nonneg _) (area_ge_sq hw) (by norm_num)

theorem one_le_U {h w : ℕ} (hh : 1 ≤ h) (hw : h ≤ w) : 1 ≤ U h w :=
  (Real.one_le_sqrt.mpr (by exact_mod_cast hh)).trans (sqrt_height_le_U hh hw)

theorem log_U_lower {h w : ℕ} (hh : 1 ≤ h) (hw : h ≤ w) :
    Real.log (h : ℝ)/2 ≤ Real.log (U h w) := by
  have hh0 : (0 : ℝ) < h := by exact_mod_cast (show 0 < h by omega)
  have ht := Real.log_le_log (Real.sqrt_pos.mpr hh0) (sqrt_height_le_U hh hw)
  simpa only [Real.log_sqrt hh0.le] using ht

theorem log_U_upper {h w : ℕ} (hh : 1 ≤ h) (hw : h ≤ w) :
    Real.log (U h w) ≤ Real.log (h : ℝ) :=
  Real.log_le_log (U_pos (by omega) hw) (U_le_height h w)

theorem scale_pos {h w : ℕ} (hh : 2 ≤ h) (hw : h ≤ w) : 0 < scale h w := by
  have hlog : 0 < Real.log (h : ℝ) := Real.log_pos (by exact_mod_cast (show 1 < h by omega))
  have hlogU : 0 < Real.log (U h w) := by have := log_U_lower (by omega : 1 ≤ h) hw; linarith
  exact Real.sqrt_pos.mpr (mul_pos (area_pos (by omega) hw) hlogU)

theorem U_eq_height {h w : ℕ} (hc : (h : ℝ) ≤ (area h w)^(1/4 : ℝ)) : U h w=h := min_eq_left hc

theorem U_eq_quarter {h w : ℕ} (hc : (area h w)^(1/4 : ℝ) ≤ h) :
    U h w=(area h w)^(1/4 : ℝ) := min_eq_right hc

theorem log_U_eq_quarter {h w : ℕ} (hh : 0 < h) (hw : h ≤ w)
    (hc : (area h w)^(1/4 : ℝ) ≤ h) : Real.log (U h w)=(1/4 : ℝ)*Real.log (area h w) := by
  rw [U_eq_quarter hc,Real.log_rpow (area_pos hh hw)]

theorem scale_eq_height {h w : ℕ} (hc : (h : ℝ) ≤ (area h w)^(1/4 : ℝ)) :
    scale h w=Real.sqrt (area h w*Real.log (h : ℝ)) := by rw [scale,U_eq_height hc]

theorem scale_eq_quarter {h w : ℕ} (hh : 0 < h) (hw : h ≤ w)
    (hc : (area h w)^(1/4 : ℝ) ≤ h) :
    scale h w=Real.sqrt (area h w*Real.log (area h w))/2 := by
  rw [scale,log_U_eq_quarter hh hw hc]
  rw [show area h w*((1/4 : ℝ)*Real.log (area h w))=(area h w*Real.log (area h w))/4 by ring]
  rw [Real.sqrt_div' _ (by norm_num : (0 : ℝ) ≤ 4)]
  rw [show (4 : ℝ)=(2 : ℝ)^2 by norm_num,Real.sqrt_sq (by norm_num : (0 : ℝ) ≤ 2)]

theorem active_lower (ε : ℝ) (h w a : ℕ) (ha : a ∈ active ε h w) : (h : ℝ)^ε ≤ a := by
  have hh := (Finset.mem_Icc.mp ha).1
  exact (Nat.le_ceil _).trans (by exact_mod_cast hh)

theorem active_positive (ε : ℝ) (h w : ℕ) (hε : 0 < ε) (hh : 2 ≤ h) :
    ∀ a ∈ active ε h w,1 < a := by
  intro a ha
  have hp := Real.one_lt_rpow (show (1 : ℝ) < h by exact_mod_cast (show 1 < h by omega)) hε
  have hh := hp.trans_le (active_lower ε h w a ha)
  exact_mod_cast hh

theorem M_le_power (ε : ℝ) (h w : ℕ) (hh : 1 ≤ h) (hw : h ≤ w) :
    (M ε h w : ℝ) ≤ (U h w)^(1-2*ε) :=
  Nat.floor_le (Real.rpow_nonneg (U_pos (by omega) hw).le _)

theorem M_le_height_power (ε : ℝ) (h w : ℕ) (hh : 1 ≤ h) (hw : h ≤ w) (hε : ε ≤ 1/2) :
    (M ε h w : ℝ) ≤ (h : ℝ)^(1-2*ε) :=
  (M_le_power ε h w hh hw).trans
    (Real.rpow_le_rpow (U_pos (by omega) hw).le (U_le_height h w) (by linarith))

theorem M_le_U (ε : ℝ) (h w : ℕ) (hh : 1 ≤ h) (hw : h ≤ w) (hε : 0 ≤ ε) :
    (M ε h w : ℝ) ≤ U h w := by
  have hr := Real.rpow_le_rpow_of_exponent_le (one_le_U hh hw) (show 1-2*ε ≤ (1 : ℝ) by linarith)
  rw [Real.rpow_one] at hr
  exact (M_le_power ε h w hh hw).trans hr

theorem M_sq_le_area_power (ε : ℝ) (h w : ℕ) (hh : 1 ≤ h) (hw : h ≤ w) (hε : ε ≤ 1/2) :
    (M ε h w : ℝ)^2 ≤ (area h w)^(1/2-ε) := by
  have hp : 0 ≤ 1-2*ε := by linarith
  have hm := (M_le_power ε h w hh hw).trans
    (Real.rpow_le_rpow (U_pos (by omega) hw).le (U_le_quarter h w) hp)
  rw [← Real.rpow_mul (area_nonneg h w)] at hm
  have hr : 0 ≤ (area h w)^((1/4 : ℝ)*(1-2*ε)) := Real.rpow_nonneg (area_nonneg h w) _
  have hs : (M ε h w : ℝ)^2 ≤ ((area h w)^((1/4 : ℝ)*(1-2*ε)))^2 := by
    exact (sq_le_sq₀ (Nat.cast_nonneg (M ε h w)) hr).mpr hm
  rw [← Real.rpow_mul_natCast (area_nonneg h w)] at hs
  convert hs using 1 <;> congr 1 <;> ring

end RectangleAsymptotics
