import Conjectures.MaTangCoreMixedThreshold
import Mathlib.Analysis.SpecialFunctions.Log.Basic
import Mathlib.Order.LiminfLimsup
import Mathlib.Tactic.Linarith
import Mathlib.Tactic.Positivity
import Mathlib.Tactic.Ring

/-!
# Ma–Tang's random subset-sum threshold conjecture
Pass the actual finite threshold bounds to the normalized real-log limsup.
-/
namespace MaTangLimsup
open Filter MaTangCoreLeast MaTangCoreMixedThreshold MaTangCoreAllDimensions
open MaTangCoreUpperDyadic hiding threshold
open scoped Topology

noncomputable def ell : ℝ := Real.log 2
theorem ell_pos : 0 < ell := Real.log_pos (by norm_num)
theorem ell_ne : ell ≠ 0 := ne_of_gt ell_pos

noncomputable def logNat (n : ℕ) : ℝ := Real.log (n : ℝ)
noncomputable def logLogNat (n : ℕ) : ℝ := Real.log (logNat n)
noncomputable def normed (n : ℕ) : ℝ :=
  ((MaTangCoreLeast.threshold n : ℝ) - logNat n / ell) / logLogNat n
noncomputable def slope : ℝ := 1 / ell
noncomputable def scale : ℝ := 1 / ell + 1
noncomputable def upperConstant : ℝ := Real.log scale + 11*ell
noncomputable def lowerConstant : ℝ :=
  Real.log (Real.log 3+ell) + Real.log scale + 7*ell + Real.log 3

theorem scale_pos : 0 < scale := by
  unfold scale
  exact add_pos (one_div_pos.mpr ell_pos) zero_lt_one

theorem log_nat_atTop : Tendsto logNat atTop atTop :=
  Real.tendsto_log_atTop.comp tendsto_natCast_atTop_atTop

theorem loglog_nat_atTop : Tendsto logLogNat atTop atTop :=
  Real.tendsto_log_atTop.comp log_nat_atTop

theorem log2_sandwich (n : ℕ) (h : n ≠ 0) :
    (n.log2 : ℝ)*ell ≤ logNat n ∧ logNat n < ((n.log2 : ℝ)+1)*ell := by
  have ⟨h₁,h₂⟩ := (Nat.log2_eq_iff h).mp (rfl : n.log2 = n.log2)
  have h₁' : (2:ℝ)^n.log2 ≤ n := by exact_mod_cast h₁
  have h₂' : (n:ℝ) < (2:ℝ)^(n.log2+1) := by exact_mod_cast h₂
  constructor
  · simpa only [logNat,ell,Real.log_pow] using Real.log_le_log (by positivity) h₁'
  · have hn : (0:ℝ) < n := by exact_mod_cast Nat.pos_of_ne_zero h
    simpa only [logNat,ell,Real.log_pow,Nat.cast_add,Nat.cast_one] using Real.log_lt_log hn h₂'

theorem seed_log_bound (n : ℕ) (hn : n ≠ 0) (hL : 1 ≤ logNat n) :
    ((n.log2+1).log2 : ℝ)*ell ≤ logLogNat n + Real.log scale := by
  have hlo := (log2_sandwich n hn).1
  have hl : (n.log2 : ℝ) ≤ logNat n / ell := (le_div_iff₀ ell_pos).2 hlo
  have hmul : (1:ℝ) + logNat n / ell = scale * logNat n + (1-logNat n) := by
    unfold scale
    ring
  have hcast : ((n.log2+1 : ℕ) : ℝ) ≤ scale*logNat n := by
    push_cast
    linarith
  have hlog := Real.log_le_log (by positivity : (0:ℝ) < ((n.log2+1 : ℕ) : ℝ)) hcast
  rw [Real.log_mul scale_pos.ne' (ne_of_gt (lt_of_lt_of_le zero_lt_one hL))] at hlog
  have hseed := (log2_sandwich (n.log2+1) (by omega)).1
  unfold logLogNat logNat at *
  linarith

theorem upper_linear (n : ℕ) (hN : 2^16 ≤ n) (hL : 1 ≤ logNat n) :
    ell * (MaTangCoreLeast.threshold n : ℝ) - logNat n ≤ logLogNat n + upperConstant := by
  have hn : n ≠ 0 := by omega
  have hlo := (log2_sandwich n hn).1
  have hs := seed_log_bound n hn hL
  have hN' := threshold_upper n hN
  have hcast : (MaTangCoreLeast.threshold n : ℝ) ≤
      (n.log2 : ℝ) + ((n.log2+1).log2 : ℝ) + 11 := by
    simp only [upperSampleSize,upperSteps] at hN'
    have eq : n.log2+10+((n.log2+1).log2+1) =
        n.log2+(n.log2+1).log2+11 := by omega
    rw [eq] at hN'
    exact_mod_cast hN'
  have h := mul_le_mul_of_nonneg_left hcast ell_pos.le
  unfold upperConstant
  nlinarith

def mixedOrder (d : ℕ) : ℕ := 3*2^d

theorem log_mixedOrder (d : ℕ) : logNat (mixedOrder d) = Real.log 3 + (d : ℝ)*ell := by
  simp only [logNat,mixedOrder,Nat.cast_mul,Nat.cast_ofNat,Nat.cast_pow,ell]
  rw [Real.log_mul (by norm_num : (3:ℝ) ≠ 0) (by positivity),Real.log_pow]

theorem log_three_pos : 0 < Real.log 3 := Real.log_pos (by norm_num)

theorem loglog_mixed_bounds (d : ℕ) (hd : 0 < d) :
    logNat d + Real.log ell ≤ logLogNat (mixedOrder d) ∧
      logLogNat (mixedOrder d) ≤ logNat d + Real.log (Real.log 3+ell) := by
  have hd' : (0:ℝ) < d := by exact_mod_cast hd
  have hd1 : (1:ℝ) ≤ d := by exact_mod_cast hd
  have hlow : (d:ℝ)*ell ≤ logNat (mixedOrder d) := by
    rw [log_mixedOrder]; linarith [log_three_pos]
  have hu : logNat (mixedOrder d) ≤ (d:ℝ)*(Real.log 3+ell) := by
    rw [log_mixedOrder]
    nlinarith [mul_nonneg (sub_nonneg.mpr hd1) log_three_pos.le]
  have hl := Real.log_le_log (mul_pos hd' ell_pos) hlow
  have hh := Real.log_le_log (lt_of_lt_of_le (mul_pos hd' ell_pos) hlow) hu
  have hs : 0 < Real.log 3+ell := add_pos log_three_pos ell_pos
  rw [Real.log_mul hd'.ne' ell_ne] at hl
  rw [Real.log_mul hd'.ne' hs.ne'] at hh
  exact ⟨hl,hh⟩

theorem lower_linear (d : ℕ) (hd : 2^16 ≤ d) (hL : 1 ≤ logNat d) :
    logLogNat (mixedOrder d) - logLogNat d - lowerConstant ≤
      ell * (MaTangCoreLeast.threshold (mixedOrder d) : ℝ) - logNat (mixedOrder d) := by
  have dpos : 0 < d := by omega
  have hlo := (log2_sandwich d (Nat.ne_of_gt dpos)).2
  have hs := seed_log_bound d (Nat.ne_of_gt dpos) hL
  have hN := threshold_mixed_lower d hd
  change d+dimensionParameter d < MaTangCoreLeast.threshold (mixedOrder d) at hN
  have hnat : d+d.log2 ≤
      MaTangCoreLeast.threshold (mixedOrder d)+(d.log2+1).log2+6 := by
    unfold dimensionParameter at hN
    omega
  have hcast : (d:ℝ)+(d.log2:ℝ) ≤
      (MaTangCoreLeast.threshold (mixedOrder d):ℝ) + ((d.log2+1).log2:ℝ) + 6 := by
    exact_mod_cast hnat
  have h := mul_le_mul_of_nonneg_left hcast ell_pos.le
  have hh := (loglog_mixed_bounds d dpos).2
  rw [log_mixedOrder]
  unfold lowerConstant
  nlinarith

theorem normed_mul (n : ℕ) (h : 0 < logLogNat n) :
    normed n * (ell*logLogNat n) =
      ell*(MaTangCoreLeast.threshold n : ℝ) - logNat n := by
  unfold normed
  field_simp [ell_ne,h.ne']

theorem slope_mul (r : ℝ) : slope*(ell*r) = r := by
  unfold slope
  field_simp [ell_ne]

theorem eventually_upper (ε : ℝ) (he : 0 < ε) :
    ∀ᶠ n : ℕ in atTop, normed n < slope+ε := by
  have hε := mul_pos he ell_pos
  have h₀ := loglog_nat_atTop.eventually_ge_atTop (1:ℝ)
  have h₁ := loglog_nat_atTop.eventually_gt_atTop (upperConstant/(ε*ell))
  filter_upwards [eventually_ge_atTop (2^16:ℕ),log_nat_atTop.eventually_ge_atTop (1:ℝ),h₀,h₁]
    with n hn hL hlog hbig
  have logpos : 0 < logLogNat n := lt_of_lt_of_le zero_lt_one hlog
  refine lt_of_mul_lt_mul_right ?_ (mul_pos ell_pos logpos).le
  rw [normed_mul n logpos,add_mul,slope_mul]
  have h := upper_linear n hn hL
  have hc := (div_lt_iff₀ hε).mp hbig
  nlinarith

theorem mixedOrder_ge (d : ℕ) : d ≤ mixedOrder d := by
  have h : d < 2^d := by
    induction d with
    | zero => decide
    | succ d ih =>
      rw [Nat.pow_succ]
      omega
  unfold mixedOrder
  omega

theorem eventually_mixed_lower (ε : ℝ) (he : 0 < ε) :
    ∀ᶠ d : ℕ in atTop, slope-ε < normed (mixedOrder d) := by
  let δ := ε*ell/2
  have hδ : 0 < δ := div_pos (mul_pos he ell_pos) (by norm_num)
  have hsmall : ∀ᶠ x : ℝ in atTop, ‖Real.log x‖ ≤ δ*‖id x‖ :=
    Real.isLittleO_log_id_atTop.def hδ
  have hbig := log_nat_atTop.eventually_gt_atTop
    (max (1-Real.log ell) ((lowerConstant-ε*ell*Real.log ell)/δ))
  filter_upwards [eventually_ge_atTop (2^16:ℕ),log_nat_atTop.eventually_ge_atTop (1:ℝ),
      log_nat_atTop.eventually hsmall,hbig] with d hd hx hs hb
  have hlog : 0 ≤ logLogNat d := Real.log_nonneg hx
  have hex : 0 ≤ logNat d := le_trans zero_le_one hx
  have hs' : logLogNat d ≤ δ*logNat d := by
    simp only [Real.norm_eq_abs,id_eq] at hs
    change |logLogNat d| ≤ δ * |logNat d| at hs
    rwa [abs_of_nonneg hlog,abs_of_nonneg hex] at hs
  have hdpos : 0 < d := by omega
  have hbottom := (loglog_mixed_bounds d hdpos).1
  have hb₀ : 1-Real.log ell < logNat d := lt_of_le_of_lt (le_max_left ..) hb
  have hb₁ : lowerConstant-ε*ell*Real.log ell < logNat d*δ :=
    (div_lt_iff₀ hδ).mp (lt_of_le_of_lt (le_max_right ..) hb)
  have hp : 0 < logLogNat (mixedOrder d) := by linarith
  have hc := lower_linear d hd hx
  have hew := mul_le_mul_of_nonneg_left hbottom (mul_pos he ell_pos).le
  have herror : logLogNat d + lowerConstant < ε*ell*logLogNat (mixedOrder d) := by
    dsimp [δ] at hs' hb₁
    nlinarith
  refine lt_of_mul_lt_mul_right ?_ (mul_pos ell_pos hp).le
  rw [normed_mul _ hp,sub_mul,slope_mul]
  nlinarith

theorem frequently_lower (ε : ℝ) (he : 0 < ε) :
    ∃ᶠ n : ℕ in atTop, slope-ε < normed n := by
  apply frequently_atTop.mpr
  intro n
  obtain ⟨d,hd,hp⟩ := ((eventually_ge_atTop n).and (eventually_mixed_lower ε he)).exists
  exact ⟨mixedOrder d,hd.trans (mixedOrder_ge d),hp⟩

/-- The original normalized limsup, with the actual universal least threshold. -/
theorem maTang_limsup : Filter.limsup normed atTop = 1 / Real.log 2 := by
  have hbound : IsBoundedUnder (· ≤ ·) atTop normed :=
    ⟨slope+1, (eventually_upper 1 zero_lt_one).mono fun _ h => h.le⟩
  have hcob : IsCoboundedUnder (· ≤ ·) atTop normed :=
    IsCoboundedUnder.of_frequently_ge ((frequently_lower 1 zero_lt_one).mono fun _ h => h.le)
  change Filter.limsup normed atTop = slope
  apply le_antisymm
  · refine (limsup_le_iff hcob hbound).2 fun y hy => ?_
    simpa only [add_sub_cancel] using eventually_upper (y-slope) (sub_pos.mpr hy)
  · refine (le_limsup_iff hcob hbound).2 fun y hy => ?_
    have e : slope-(slope-y)=y := by ring
    simpa only [e] using frequently_lower (slope-y) (sub_pos.mpr hy)


/-- The convergence along orders `3 * 2^d` asserted by the written proof. -/
theorem mixed_order_tendsto : Tendsto mixedOrder atTop atTop :=
  tendsto_atTop.2 fun a => (eventually_ge_atTop a).mono fun d h =>
    h.trans (mixedOrder_ge d)

theorem mixed_normalized_tendsto :
    Tendsto (fun d => normed (mixedOrder d)) atTop (𝓝 (1 / Real.log 2)) := by
  change Tendsto (fun d => normed (mixedOrder d)) atTop (𝓝 slope)
  refine tendsto_order.2 ⟨?_,?_⟩
  · intro a ha
    have he : slope - (slope-a) = a := by ring
    simpa only [he] using eventually_mixed_lower (slope-a) (sub_pos.mpr ha)
  · intro a ha
    have he : slope + (a-slope) = a := by ring
    simpa only [he] using
      mixed_order_tendsto.eventually (eventually_upper (a-slope) (sub_pos.mpr ha))

/-- The explicit third-log lower correction in the repository's equation (1). -/
theorem mixed_refined_lower :
    ∃ C : ℝ, ∀ᶠ d : ℕ in atTop,
      logNat (mixedOrder d)/ell + logLogNat (mixedOrder d)/ell -
        Real.log (logLogNat (mixedOrder d))/ell - C ≤
      (MaTangCoreLeast.threshold (mixedOrder d) : ℝ) := by
  refine ⟨(lowerConstant+ell)/ell, ?_⟩
  filter_upwards [eventually_ge_atTop (2^16:ℕ),
    log_nat_atTop.eventually_ge_atTop (max 1 (-2*Real.log ell))] with d hd hD
  have hL : 1 ≤ logNat d := le_trans (le_max_left ..) hD
  have hneg : -2*Real.log ell ≤ logNat d := le_trans (le_max_right ..) hD
  have hd' : 0 < d := by omega
  have hbottom := (loglog_mixed_bounds d hd').1
  have hcomp : logNat d ≤ 2*logLogNat (mixedOrder d) := by linarith
  have hpos : 0 < logLogNat (mixedOrder d) := by linarith
  have hl := Real.log_le_log (by linarith : 0 < logNat d) hcomp
  rw [Real.log_mul (by norm_num : (2:ℝ) ≠ 0) hpos.ne'] at hl
  change logLogNat d ≤ ell + Real.log (logLogNat (mixedOrder d)) at hl
  have h := lower_linear d hd hL
  calc
    _ = (logNat (mixedOrder d) + logLogNat (mixedOrder d) -
        Real.log (logLogNat (mixedOrder d)) - (lowerConstant+ell))/ell := by ring
    _ ≤ _ := (div_le_iff₀ ell_pos).2 (by nlinarith)


end MaTangLimsup
