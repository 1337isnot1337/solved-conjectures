import Conjectures.RectangleHarmonicRange
import Mathlib.Analysis.SpecialFunctions.Pow.Asymptotics

/-! Uniform nonemptiness of the active range and its logarithmic mass.
All eventual statements are uniform over every width at least the height. -/

namespace RectangleAsymptotics

open Filter
open scoped Topology

theorem nat_rpow_tendsto_atTop (r : ℝ) (hr : 0 < r) :
    Tendsto (fun h : ℕ => (h : ℝ)^r) atTop atTop :=
  (tendsto_rpow_atTop hr).comp tendsto_natCast_atTop_atTop

theorem one_add_log_le_rpow_eventually (r : ℝ) (hr : 0 < r) :
    ∀ᶠ h : ℕ in atTop,1+Real.log (h : ℝ) ≤ (h : ℝ)^r := by
  have hn : Tendsto (fun h : ℕ => (h : ℝ)) atTop atTop := tendsto_natCast_atTop_atTop
  have hl := (isLittleO_log_rpow_atTop hr).tendsto_div_nhds_zero.comp hn
  have hi := (nat_rpow_tendsto_atTop r hr).inv_tendsto_atTop
  have hs : Tendsto (fun h : ℕ => (1+Real.log (h : ℝ))/(h : ℝ)^r) atTop (𝓝 0) := by
    simpa only [add_div,one_div,zero_add,Function.comp_apply,Pi.inv_apply] using hi.add hl
  have he := (tendsto_order.mp hs).2 1 (by norm_num)
  filter_upwards [he,eventually_ge_atTop 1] with h hh hh1
  have hp : (0 : ℝ) < (h : ℝ)^r := Real.rpow_pos_of_pos (by exact_mod_cast (show 0 < h by omega)) _
  have hh' := (div_le_iff₀ hp).mp hh.le
  simpa only [one_mul] using hh'

theorem cutoff_power_ge_height (ε : ℝ) (h w : ℕ) (hh : 1 ≤ h) (hw : h ≤ w) (hε : ε ≤ 1/2) :
    (h : ℝ)^(1/2-ε) ≤ (U h w)^(1-2*ε) := by
  have hs := Real.rpow_le_rpow (Real.sqrt_nonneg (h : ℝ)) (sqrt_height_le_U hh hw)
    (show 0 ≤ 1-2*ε by linarith)
  rw [Real.sqrt_eq_rpow,← Real.rpow_mul (Nat.cast_nonneg h)] at hs
  convert hs using 1 <;> congr 1 <;> ring

theorem active_nonempty_eventually (ε : ℝ) (hε : 0 < ε) (hεsmall : ε < 1/10) :
    ∀ᶠ h : ℕ in atTop,∀ w : ℕ,h ≤ w → a0 ε h ≤ M ε h w := by
  have hp := (nat_rpow_tendsto_atTop ε hε).eventually (eventually_ge_atTop (2 : ℝ))
  have hq := (nat_rpow_tendsto_atTop (1/2-2*ε) (by linarith)).eventually (eventually_ge_atTop (2 : ℝ))
  filter_upwards [eventually_ge_atTop 2,hp,hq] with h hh hhpow hhpow'
  intro w hw
  have hh0 : (0 : ℝ) < h := by exact_mod_cast (show 0 < h by omega)
  have hcut := cutoff_power_ge_height ε h w (by omega) hw (by linarith)
  have heq : (h : ℝ)^ε*(h : ℝ)^(1/2-2*ε)=(h : ℝ)^(1/2-ε) := by
    rw [← Real.rpow_add hh0]
    congr 1
    ring
  have hlarge : 2*(h : ℝ)^ε ≤ (U h w)^(1-2*ε) := by
    have hm := mul_le_mul_of_nonneg_left hhpow' (Real.rpow_nonneg hh0.le ε)
    rw [heq] at hm
    calc
      2*(h : ℝ)^ε = (h : ℝ)^ε*2 := mul_comm _ _
      _ ≤ (h : ℝ)^(1/2-ε) := hm
      _ ≤ _ := hcut
  have hceil := Nat.ceil_lt_add_one (Real.rpow_nonneg hh0.le ε)
  have hfloor := Nat.lt_floor_add_one ((U h w)^(1-2*ε))
  change (a0 ε h : ℝ) < (h : ℝ)^ε+1 at hceil
  change (U h w)^(1-2*ε) < (M ε h w : ℝ)+1 at hfloor
  have hm : (a0 ε h : ℝ) ≤ M ε h w := by linarith only [hceil,hfloor,hlarge,hhpow]
  exact_mod_cast hm

theorem L_eventually_ge (ε R : ℝ) (hε : 0 < ε) (hεsmall : ε < 1/10) :
    ∀ᶠ h : ℕ in atTop,∀ w : ℕ,h ≤ w → R ≤ L ε h w := by
  have hl : Tendsto (fun h : ℕ => Real.log (h : ℝ)) atTop atTop :=
    Real.tendsto_log_atTop.comp tendsto_natCast_atTop_atTop
  have hlarge := hl.eventually (eventually_ge_atTop (max 0 (4*(R+1))))
  filter_upwards [active_nonempty_eventually ε hε hεsmall,eventually_ge_atTop 2,hlarge]
    with h hactive hh hlog
  intro w hw
  have hlo := L_lower ε h w hh hw hε (hactive w hw)
  have hUlo := log_U_lower (by omega : 1 ≤ h) hw
  have hlog0 : 0 ≤ Real.log (h : ℝ) := (le_max_left _ _).trans hlog
  have hlogR : 4*(R+1) ≤ Real.log (h : ℝ) := (le_max_right _ _).trans hlog
  have hlogU0 : 0 ≤ Real.log (U h w) := by linarith
  have hmul := mul_le_mul_of_nonneg_right (show (1/2 : ℝ) ≤ 1-4*ε by linarith) hlogU0
  linarith only [hlo,hUlo,hlogR,hmul]

theorem L_eventually_le_power (ε : ℝ) (hε : 0 < ε) :
    ∀ᶠ h : ℕ in atTop,∀ w : ℕ,h ≤ w → L ε h w ≤ (h : ℝ)^(ε/2) := by
  filter_upwards [one_add_log_le_rpow_eventually (ε/2) (by linarith),eventually_ge_atTop 2]
    with h hh hh2
  intro w hw
  exact (L_le_log_height ε h w hh2 hw hε).trans hh

theorem L_eventually_relative_lower (ε : ℝ) (hε : 0 < ε) (hεsmall : ε < 1/10) :
    ∀ᶠ h : ℕ in atTop,∀ w : ℕ,h ≤ w →
      (1-5*ε)*Real.log (U h w) ≤ L ε h w := by
  have hl : Tendsto (fun h : ℕ => Real.log (h : ℝ)) atTop atTop :=
    Real.tendsto_log_atTop.comp tendsto_natCast_atTop_atTop
  have hlarge := hl.eventually (eventually_ge_atTop (2/ε))
  filter_upwards [active_nonempty_eventually ε hε hεsmall,eventually_ge_atTop 2,hlarge]
    with h hactive hh hlog
  intro w hw
  have hlo := L_lower ε h w hh hw hε (hactive w hw)
  have hUlo := log_U_lower (by omega : 1 ≤ h) hw
  have hnum := (div_le_iff₀ hε).mp hlog
  have hmul := mul_le_mul_of_nonneg_left hUlo hε.le
  linarith only [hlo,hnum,hmul]

end RectangleAsymptotics
