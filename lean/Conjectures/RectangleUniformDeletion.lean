import Conjectures.RectangleDeletionLoss
import Conjectures.RectangleParameterBounds
import Conjectures.RectangleUniformFilter

/-! The total cost of deleting small parts is uniformly negligible for w >= h. -/

namespace RectangleAsymptotics

open Filter
open scoped Topology

noncomputable def deletionLoss (ε : ℝ) (h w : ℕ) : ℝ :=
  ∑ a ∈ active ε h w,((a-1 : ℕ) : ℝ)*Real.log ((T ε h w a : ℝ)+1)

theorem log_U_tendsto :
    Tendsto (fun p : ℕ × ℕ => Real.log (U p.1 p.2)) RectangleUniform.regime atTop := by
  have hh : Tendsto (fun p : ℕ × ℕ => (p.1 : ℝ)) RectangleUniform.regime atTop :=
    tendsto_natCast_atTop_atTop.comp RectangleUniform.fst_tendsto
  have hl := (Real.tendsto_log_atTop.comp hh).atTop_div_const (by norm_num : (0 : ℝ)<2)
  apply tendsto_atTop_mono' _ ?_ hl
  filter_upwards [RectangleUniform.fst_tendsto.eventually (eventually_ge_atTop 1),
    RectangleUniform.ordered_eventually] with p hp ho
  exact log_U_lower hp ho

theorem deletionLoss_le {ε : ℝ} {h w : ℕ} (hε : 0 < ε) (hh : 2 ≤ h)
    (hT : ∀ a ∈ active ε h w,T ε h w a ≤ h*w) :
    deletionLoss ε h w ≤ (M ε h w : ℝ)^2*Real.log (area h w+1) := by
  apply RectanglePartitions.deletion_sum_le
  · intro a ha
    exact (active_positive ε h w hε hh a ha).le
  · intro a ha
    exact (Finset.mem_Icc.mp ha).2
  · exact hT

theorem sqrt_area_le_scale {h w : ℕ} (hlog : 1 ≤ Real.log (U h w)) :
    Real.sqrt (area h w) ≤ scale h w := by
  apply Real.sqrt_le_sqrt
  simpa only [mul_one] using mul_le_mul_of_nonneg_left hlog (area_nonneg h w)

/-- The only reservation-specific input is the elementary total-area budget. -/
theorem uniform_deletion_bound {ε δ : ℝ} (hε : 0 < ε) (hεmax : ε ≤ 1/2) (hδ : 0 < δ)
    (hT : ∀ᶠ h : ℕ in atTop,∀ w : ℕ,h ≤ w →
      ∀ a ∈ active ε h w,T ε h w a ≤ h*w) :
    ∀ᶠ h : ℕ in atTop,∀ w : ℕ,h ≤ w → deletionLoss ε h w ≤ δ*scale h w := by
  apply (RectangleUniform.eventually_regime_iff (fun p =>
    deletionLoss ε p.1 p.2 ≤ δ*scale p.1 p.2)).1
  have hb := (RectangleUniform.eventually_regime_iff (fun p =>
    ∀ a ∈ active ε p.1 p.2,T ε p.1 p.2 a ≤ p.1*p.2)).2 hT
  have hr := (RectanglePartitions.tendsto_log_add_one_div_rpow hε).comp RectangleUniform.area_tendsto
  filter_upwards [RectangleUniform.fst_tendsto.eventually (eventually_ge_atTop 2),
    RectangleUniform.ordered_eventually,log_U_tendsto.eventually (eventually_ge_atTop 1),
    (tendsto_order.1 hr).2 δ hδ,hb] with p hp ho hlog he ht
  rcases p with ⟨h,w⟩
  dsimp only at hp ho hlog he ht ⊢
  have hN : 0 < area h w := area_pos (by omega) ho
  have hlogN : 0 ≤ Real.log (area h w+1) :=
    Real.log_nonneg (le_add_of_nonneg_left hN.le)
  calc
    deletionLoss ε h w ≤ (M ε h w : ℝ)^2*Real.log (area h w+1) :=
      deletionLoss_le hε hp ht
    _ ≤ (area h w)^((1/2 : ℝ)-ε)*Real.log (area h w+1) :=
      mul_le_mul_of_nonneg_right (M_sq_le_area_power ε h w (by omega) ho hεmax) hlogN
    _ = (Real.log (area h w+1)/(area h w)^ε)*Real.sqrt (area h w) :=
      RectanglePartitions.deletion_power_identity hN
    _ ≤ δ*Real.sqrt (area h w) :=
      mul_le_mul_of_nonneg_right he.le (Real.sqrt_nonneg _)
    _ ≤ δ*scale h w := mul_le_mul_of_nonneg_left (sqrt_area_le_scale hlog) hδ.le

end RectangleAsymptotics
