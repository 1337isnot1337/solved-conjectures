module

public import Mathlib.Analysis.SpecificLimits.Normed
public import Mathlib.Analysis.SpecialFunctions.Log.Basic
public import Mathlib.Analysis.Real.Sqrt
public import Mathlib.Analysis.SpecialFunctions.ImproperIntegrals

public section
namespace NuttallCumulants
open Filter
open scoped Topology

theorem exp_real_nat_mul (m : ℕ) (c : ℝ) : Real.exp (c*(m:ℝ)) = Real.exp c ^ m := by
  induction m with
  | zero => simp
  | succ m ih =>
    rw [Nat.cast_succ, mul_add, mul_one, Real.exp_add, ih, pow_succ]

/-- The scalar comparison at the end of §6, uniformly for fixed constants. -/
theorem tail_dominance_ratio_tendsto (k : ℕ) (C D : ℝ) (hC : 0 ≤ C) (hD : 0 ≤ D) :
    Tendsto (fun m : ℕ => (Real.log (m:ℝ))^k * Real.exp (C*Real.sqrt (m:ℝ)) *
        (D / Real.log (m:ℝ))^m) atTop (𝓝 0) := by
  have hlog := Real.tendsto_log_atTop.comp (tendsto_natCast_atTop_atTop (R := ℝ))
  have hlarge := hlog.eventually_ge_atTop (max 1 (2*Real.exp C*D))
  have hmaj := tendsto_pow_const_mul_const_pow_of_lt_one k
    (show (0:ℝ) ≤ 1/2 by norm_num) (show (1/2:ℝ) < 1 by norm_num)
  apply squeeze_zero' _ _ hmaj
  · filter_upwards [eventually_ge_atTop (1:ℕ)] with m hm
    have hm' : (1:ℝ) ≤ (m:ℝ) := by exact_mod_cast hm
    exact mul_nonneg (mul_nonneg (pow_nonneg (Real.log_nonneg hm') _) (Real.exp_pos _).le)
      (pow_nonneg (div_nonneg hD (Real.log_nonneg hm')) _)
  · filter_upwards [eventually_ge_atTop (1:ℕ), hlarge] with m hm hL
    have hm' : (1:ℝ) ≤ (m:ℝ) := by exact_mod_cast hm
    have hlog' : 0 < Real.log (m:ℝ) := zero_lt_one.trans_le ((le_max_left _ _).trans hL)
    have hs := Real.sqrt_le_self_iff.mpr (Or.inr hm')
    have hlm : Real.log (m:ℝ) ≤ m :=
      (Real.log_le_sub_one_of_pos (zero_lt_one.trans_le hm')).trans (by linarith)
    have hratio : Real.exp C * (D / Real.log (m:ℝ)) ≤ 1/2 := by
      rw [← mul_div_assoc, div_le_iff₀ hlog']
      have hh := (le_max_right (1:ℝ) (2*Real.exp C*D)).trans hL
      change 2*Real.exp C*D ≤ Real.log (m:ℝ) at hh
      nlinarith only [hh]
    calc
      _ ≤ (m:ℝ)^k * Real.exp (C*(m:ℝ)) * (D / Real.log (m:ℝ))^m := by
        gcongr
      _ = (m:ℝ)^k * (Real.exp C * (D / Real.log (m:ℝ)))^m := by
        rw [exp_real_nat_mul, mul_assoc, ← mul_pow]
      _ ≤ _ := mul_le_mul_of_nonneg_left
        (pow_le_pow_left₀ (mul_nonneg (Real.exp_pos _).le (div_nonneg hD hlog'.le)) hratio _)
        (pow_nonneg (Nat.cast_nonneg _) _)

open Set MeasureTheory intervalIntegral

noncomputable def momentMajorant (m s : ℕ) (x : ℝ) : ℝ :=
  x^(m-s) * (1+x)^(s-1) * Real.exp (-Real.exp (2*x))

theorem momentMajorant_nonneg (m s : ℕ) {x : ℝ} (hx : 0 ≤ x) :
    0 ≤ momentMajorant m s x := by unfold momentMajorant; positivity

theorem momentMajorant_continuous (m s : ℕ) : Continuous (momentMajorant m s) := by
  unfold momentMajorant
  fun_prop

theorem momentMajorant_le (m s : ℕ) (hs : 1 ≤ s) (hm : s ≤ m) {x : ℝ} (hx : 0 ≤ x) :
    momentMajorant m s x ≤ (1+x)^(m-1) * Real.exp (-Real.exp (2*x)) := by
  unfold momentMajorant
  apply mul_le_mul_of_nonneg_right _ (Real.exp_pos _).le
  rw [show m-1 = (m-s)+(s-1) by omega, pow_add]
  gcongr
  linarith

theorem momentMajorant_tail_le_exp (m s : ℕ) (hs : 1 ≤ s) (hm : s ≤ m) {x : ℝ}
    (hx : 0 ≤ x) (hx' : Real.log (m:ℝ) ≤ x) :
    momentMajorant m s x ≤ Real.exp (-x) := by
  have h1mp : (0:ℝ) < 1+x := by linarith
  have hm0 : (0:ℝ) < m := by exact_mod_cast (zero_lt_one.trans_le (hs.trans hm))
  have hmexp : (m:ℝ) ≤ Real.exp x := by rwa [← Real.exp_log hm0, Real.exp_le_exp]
  have hlog : Real.log (1+x) ≤ x := by
    have h := Real.log_le_sub_one_of_pos h1mp
    linarith
  have hlog0 : 0 ≤ Real.log (1+x) := Real.log_nonneg (by linarith)
  have hnx : 2*x ≤ Real.exp x := by
    have he := Real.add_one_le_exp (x/2)
    have h2 := mul_le_mul he he (by linarith : 0 ≤ x/2+1) (Real.exp_pos _).le
    rw [← Real.exp_add, show x/2+x/2=x by ring] at h2
    nlinarith [sq_nonneg (x/2-1)]
  have hsq : Real.exp x ^ 2 = Real.exp (2*x) := by
    rw [pow_two, ← Real.exp_add]
    congr 1
    ring
  have hmul : ((m-1:ℕ):ℝ) * Real.log (1+x) ≤ Real.exp (2*x)/2 := by
    calc
      _ ≤ (m:ℝ) * x := by
        exact mul_le_mul (by exact_mod_cast Nat.sub_le m 1) hlog hlog0 hm0.le
      _ ≤ Real.exp x * x := mul_le_mul_of_nonneg_right hmexp hx
      _ ≤ _ := by
        have hc := mul_le_mul_of_nonneg_left hnx (Real.exp_pos x).le
        rw [← hsq]
        nlinarith only [hc]
  have hE := Real.add_one_le_exp (2*x)
  calc
    _ ≤ (1+x)^(m-1) * Real.exp (-Real.exp (2*x)) := momentMajorant_le m s hs hm hx
    _ = Real.exp (((m-1:ℕ):ℝ)*Real.log (1+x) - Real.exp (2*x)) := by
      rw [sub_eq_add_neg, Real.exp_add, mul_comm ((↑(m-1:ℕ):ℝ)), exp_real_nat_mul, Real.exp_log h1mp]
    _ ≤ Real.exp (-x) := Real.exp_le_exp.mpr (by linarith)

theorem momentMajorant_bounded_le (m s : ℕ) (hs : 1 ≤ s) (hm : s ≤ m)
    {L x : ℝ} (hx : 0 ≤ x) (hxL : x ≤ L) :
    momentMajorant m s x ≤ (1+L)^(m-1) := by
  have h0 : 0 ≤ 1+x := by linarith
  calc
    _ ≤ (1+x)^(m-1) * Real.exp (-Real.exp (2*x)) := momentMajorant_le m s hs hm hx
    _ ≤ (1+x)^(m-1) * 1 := mul_le_mul_of_nonneg_left
      (Real.exp_le_one_iff.mpr (neg_nonpos.mpr (Real.exp_pos _).le)) (pow_nonneg h0 _)
    _ ≤ _ := by rw [mul_one]; exact pow_le_pow_left₀ h0 (by linarith) _

theorem momentMajorant_integrable_tail (m s : ℕ) (hs : 1 ≤ s) (hm : s ≤ m)
    {L : ℝ} (hL : 0 ≤ L) (hlog : Real.log (m:ℝ) ≤ L) :
    IntegrableOn (momentMajorant m s) (Ioi L) := by
  refine Integrable.mono' (integrableOn_exp_neg_Ioi L)
    (momentMajorant_continuous m s).aestronglyMeasurable ?_
  filter_upwards [ae_restrict_mem measurableSet_Ioi] with x hx
  have h0 := hL.trans (le_of_lt hx)
  rw [Real.norm_of_nonneg (momentMajorant_nonneg m s h0)]
  exact momentMajorant_tail_le_exp m s hs hm h0 (hlog.trans (le_of_lt hx))

theorem momentMajorant_integral_bound (m s : ℕ) (hs : 1 ≤ s) (hm : s ≤ m)
    (hlog : 1 ≤ Real.log (m:ℝ)) :
    (∫ x in Ioi (0:ℝ), momentMajorant m s x) ≤ 2*(2*Real.log (m:ℝ))^m := by
  let L := Real.log (m:ℝ)
  have hL : 0 ≤ L := zero_le_one.trans hlog
  have hi : IntervalIntegrable (momentMajorant m s) volume 0 L :=
    (momentMajorant_continuous m s).intervalIntegrable 0 L
  have htail := momentMajorant_integrable_tail m s hs hm hL (show Real.log (m:ℝ) ≤ L from le_rfl)
  have hcut : Disjoint (Ioc (0:ℝ) L) (Ioi L) := by
    rw [Set.disjoint_left]
    exact fun x hx hy => (not_lt_of_ge hx.2) hy
  have hB : (∫ x in Ioc (0:ℝ) L, momentMajorant m s x) ≤ L*(1+L)^(m-1) := by
    have h := intervalIntegral.integral_mono_on hL hi intervalIntegrable_const
      (fun x hx => momentMajorant_bounded_le m s hs hm hx.1 hx.2)
    rw [intervalIntegral.integral_of_le hL, intervalIntegral.integral_const] at h
    simpa only [sub_zero, smul_eq_mul] using h
  have hT : (∫ x in Ioi L, momentMajorant m s x) ≤ Real.exp (-L) := by
    rw [← integral_exp_neg_Ioi L]
    exact MeasureTheory.setIntegral_mono_on htail (integrableOn_exp_neg_Ioi L) measurableSet_Ioi
      (fun x hx => momentMajorant_tail_le_exp m s hs hm (hL.trans (le_of_lt hx)) (le_of_lt hx))
  rw [← Ioc_union_Ioi_eq_Ioi hL, setIntegral_union hcut measurableSet_Ioi hi.1 htail]
  have hB' : L*(1+L)^(m-1) ≤ (2*L)^m := by
    calc
      _ ≤ (2*L) * (2*L)^(m-1) := by
        have hbase : 0 ≤ 1+L := by linarith
        exact mul_le_mul (by linarith) (pow_le_pow_left₀ hbase (by linarith) _)
          (pow_nonneg hbase _) (by positivity)
      _ = _ := by rw [← pow_succ', show m-1+1=m by omega]
  have hT' : Real.exp (-L) ≤ (2*L)^m :=
    (Real.exp_le_one_iff.mpr (neg_nonpos.mpr hL)).trans (one_le_pow₀ (by linarith [show 1 ≤ L from hlog]))
  linarith

theorem momentMajorant_integrable (m s : ℕ) (hs : 1 ≤ s) (hm : s ≤ m) :
    IntegrableOn (momentMajorant m s) (Ioi (0:ℝ)) := by
  let L := max 0 (Real.log (m:ℝ))
  have hL : 0 ≤ L := le_max_left _ _
  have hi : IntervalIntegrable (momentMajorant m s) volume 0 L :=
    (momentMajorant_continuous m s).intervalIntegrable 0 L
  have htail := momentMajorant_integrable_tail m s hs hm hL (le_max_right _ _)
  rw [← Ioc_union_Ioi_eq_Ioi hL]
  exact hi.1.union htail

/-- Any fixed positive prefactor in the comparison (18) is harmless. -/
theorem tail_dominance_eventually_lt_one (k : ℕ) (A C D : ℝ) (hC : 0 ≤ C) (hD : 0 ≤ D) :
    ∀ᶠ m : ℕ in atTop, A * ((Real.log (m:ℝ))^k * Real.exp (C*Real.sqrt (m:ℝ)) *
        (D / Real.log (m:ℝ))^m) < 1 := by
  have h := (tail_dominance_ratio_tendsto k C D hC hD).const_mul A
  rw [mul_zero] at h
  exact h.eventually (Iio_mem_nhds (zero_lt_one : (0:ℝ) < 1))
end NuttallCumulants
