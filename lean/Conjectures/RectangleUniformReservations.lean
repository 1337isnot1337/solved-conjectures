import Conjectures.RectangleActiveRange
import Conjectures.RectangleReservationCap
import Conjectures.RectangleReservationSum

/-! Uniform legal reservation budgets for all widths at least the height.
The lower bounds here quantify over every active part size simultaneously. -/

namespace RectangleAsymptotics

open Filter
open scoped Topology

theorem reservation_floor_bounds (ε : ℝ) (h w a : ℕ)
    (hh : 2 ≤ h) (hw : h ≤ w) (hε : 0 < ε) (hεsmall : ε < 1/10)
    (ha : a ∈ active ε h w) (hL : 1 ≤ L ε h w)
    (hLp : L ε h w ≤ (h : ℝ)^(ε/2))
    (hp : 1/ε ≤ (h : ℝ)^(ε/2))
    (hp' : (1/ε)/(ε*(1-ε)) ≤ (h : ℝ)^(ε/2)) :
    (1-ε)*idealQ ε h w a ≤ (Q ε h w a : ℝ) ∧
    (1-ε)*idealB ε h w a ≤ (B ε h w a : ℝ) ∧
    (1-ε)*(ε*(B ε h w a : ℝ)) ≤ (C ε h w a : ℝ) := by
  have hqpos : 0 < 1-ε := by linarith
  have hQ := idealQ_ge_power ε h w a hh hw hε hεsmall ha hL hLp
  have hB := idealB_ge_power ε h w a hh hw hε hεsmall ha hL hLp
  have hq : (1-ε)*idealQ ε h w a ≤ (Q ε h w a : ℝ) := by
    rw [Q_eq_floor_ideal]
    exact floor_relative_lower hε (hp.trans hQ)
  have hb : (1-ε)*idealB ε h w a ≤ (B ε h w a : ℝ) := by
    rw [B_eq_floor_ideal]
    exact floor_relative_lower hε (hp.trans hB)
  have hcap : 1/ε ≤ ε*(B ε h w a : ℝ) := by
    calc
      1/ε ≤ idealB ε h w a*(ε*(1-ε)) :=
        (div_le_iff₀ (mul_pos hε hqpos)).mp (hp'.trans hB)
      _ = ε*((1-ε)*idealB ε h w a) := by ring
      _ ≤ _ := mul_le_mul_of_nonneg_left hb hε.le
  refine ⟨hq,hb,?_⟩
  exact floor_relative_lower hε hcap

theorem uniform_reservation_estimates (ε : ℝ) (hε : 0 < ε) (hεsmall : ε < 1/10)
    (K : ℕ) (R : ℝ) :
    ∀ᶠ h : ℕ in atTop,∀ w : ℕ,h ≤ w →
      0 < L ε h w ∧
      (1-7*ε)*scale h w ≤ ∑ a ∈ active ε h w,Real.sqrt (T ε h w a : ℝ) ∧
      ∀ a ∈ active ε h w,
        K ≤ T ε h w a ∧
        R ≤ (C ε h w a : ℝ)/Real.sqrt (T ε h w a : ℝ) ∧
        T ε h w a ≤ h*w := by
  have hqpos : 0 < 1-ε := by linarith
  have hcpos : 0 < (1-ε)^2*ε := mul_pos (sq_pos_of_pos hqpos) hε
  have hqcube : 0 < (1-ε)^3 := pow_pos hqpos 3
  have hp := (nat_rpow_tendsto_atTop (ε/2) (by linarith)).eventually
    (eventually_ge_atTop (max (1/ε) ((1/ε)/(ε*(1-ε)))))
  have hTlarge := (nat_rpow_tendsto_atTop (3*ε) (by linarith)).eventually
    (eventually_ge_atTop ((K : ℝ)/(1-ε)^3))
  have hClarge := (nat_rpow_tendsto_atTop (ε/4) (by linarith)).eventually
    (eventually_ge_atTop (R/((1-ε)^2*ε)))
  filter_upwards [eventually_ge_atTop 2,L_eventually_ge ε 1 hε hεsmall,
    L_eventually_le_power ε hε,L_eventually_relative_lower ε hε hεsmall,
    hp,hTlarge,hClarge] with h hh hL hLp hLrelative hpower hTpower hCpower
  intro w hw
  have hL1 := hL w hw
  have hL0 : 0 < L ε h w := by linarith
  have hLp' := hLp w hw
  have hfloor : ∀ a ∈ active ε h w,
      (1-ε)*idealQ ε h w a ≤ (Q ε h w a : ℝ) ∧
      (1-ε)*idealB ε h w a ≤ (B ε h w a : ℝ) ∧
      (1-ε)*(ε*(B ε h w a : ℝ)) ≤ (C ε h w a : ℝ) := by
    intro a ha
    exact reservation_floor_bounds ε h w a hh hw hε hεsmall ha hL1 hLp'
      ((le_max_left _ _).trans hpower) ((le_max_right _ _).trans hpower)
  have hT : ∀ a ∈ active ε h w,
      (1-ε)^3*(area h w/(L ε h w*(a : ℝ)^2)) ≤ (T ε h w a : ℝ) := by
    intro a ha
    have ha0 : 0 < a := by have := active_positive ε h w hε hh a ha; omega
    exact T_ge_volume ε h w a hε (by linarith) hL0 ha0
      (hfloor a ha).1 (hfloor a ha).2.1
  refine ⟨hL0,reservation_sum_sqrt_lower ε h w hh hw hε hεsmall hL0
    (hLrelative w hw) hT,?_⟩
  intro a ha
  have hvolume := volume_ge_height_power ε h w a hh hw hε hεsmall ha hL1 hLp'
  have hbudget : (K : ℝ) ≤ (T ε h w a : ℝ) := by
    calc
      (K : ℝ) ≤ (h : ℝ)^(3*ε)*(1-ε)^3 := (div_le_iff₀ hqcube).mp hTpower
      _ = (1-ε)^3*(h : ℝ)^(3*ε) := by ring
      _ ≤ (1-ε)^3*(area h w/(L ε h w*(a : ℝ)^2)) :=
        mul_le_mul_of_nonneg_left hvolume hqcube.le
      _ ≤ _ := hT a ha
  have hcap : R ≤ (C ε h w a : ℝ)/Real.sqrt (T ε h w a : ℝ) := by
    calc
      R ≤ (h : ℝ)^(ε/4)*((1-ε)^2*ε) := (div_le_iff₀ hcpos).mp hCpower
      _ = ((1-ε)^2*ε)*(h : ℝ)^(ε/4) := by ring
      _ ≤ _ := cap_ratio_ge_power ε h w a hh hw hε hεsmall ha hL1 hLp'
        (hfloor a ha).1 (hfloor a ha).2.1 (hfloor a ha).2.2
  exact ⟨by exact_mod_cast hbudget,hcap,T_le_area ε h w a hh hε ha hL1⟩

theorem uniform_reservation_product (ε : ℝ) (hε : 0 < ε) (hεsmall : ε < 1/10) :
    ∀ᶠ h : ℕ in atTop,∀ w : ℕ,h ≤ w →
      (∏ a : active ε h w,
        (RectanglePartitions.boundedParts a.val (C ε h w a.val) (T ε h w a.val)).card) ≤
          RectanglePartitions.rectangleCount h w := by
  filter_upwards [eventually_ge_atTop 2,L_eventually_ge ε 1 hε hεsmall] with h hh hL
  intro w hw
  exact reservation_product_lower ε h w (by linarith) (by have := hL w hw; linarith)
    (active_positive ε h w hε hh)

end RectangleAsymptotics
