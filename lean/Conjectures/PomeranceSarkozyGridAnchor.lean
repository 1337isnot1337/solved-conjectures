module
public import Mathlib.Analysis.SpecificLimits.Normed
public import Mathlib.Algebra.Order.Floor.Ring
import Mathlib.Tactic.FieldSimp
import Mathlib.Tactic.Linarith
import Mathlib.Tactic.Ring

@[expose] public section
namespace PomeranceSarkozy

open Filter
open scoped Topology

noncomputable def base32AnchorIndex (m : ℕ) (t : ℝ) : ℕ := ⌊(32:ℝ)^m*t⌋₊

noncomputable def base32GridPoint (m j : ℕ) : ℝ := (j:ℝ)/(32:ℝ)^m

theorem base32_anchor_index_le (m : ℕ) {t : ℝ} (ht : t ≤ 1) :
    base32AnchorIndex m t ≤ 32^m := by
  unfold base32AnchorIndex
  have h : (32:ℝ)^m*t≤((32^m:ℕ):ℝ) := by
    push_cast
    simpa only [mul_one] using mul_le_mul_of_nonneg_left ht (by positivity : 0≤(32:ℝ)^m)
  simpa only [Nat.floor_natCast] using Nat.floor_le_floor h

theorem base32_gridPoint_succ_refine (m j : ℕ) :
    base32GridPoint (m+1) (32*j) = base32GridPoint m j := by
  unfold base32GridPoint
  push_cast
  rw [pow_succ]
  field_simp

/-- The new left anchor is at most 31 fine edges to the right
of the old anchor when the grid is refined. -/
theorem base32_anchor_index_refine (m : ℕ) {t : ℝ} (ht : 0 ≤ t) :
    32*base32AnchorIndex m t ≤ base32AnchorIndex (m+1) t ∧
      base32AnchorIndex (m+1) t ≤ 32*base32AnchorIndex m t+31 := by
  let k := base32AnchorIndex m t
  let k' := base32AnchorIndex (m+1) t
  let q := (32:ℝ)^m
  have hl : (k:ℝ)≤q*t := Nat.floor_le (by positivity)
  have hu : q*t<(k:ℝ)+1 := Nat.lt_floor_add_one _
  constructor
  · apply Nat.le_floor
    push_cast
    change 32*(k:ℝ) ≤ (32:ℝ)^(m+1)*t
    rw [pow_succ]
    change 32*(k:ℝ) ≤ q*32*t
    linarith
  · have hf : (k':ℝ)≤(32:ℝ)^(m+1)*t := Nat.floor_le (by positivity)
    rw [pow_succ] at hf
    change (k':ℝ) ≤ q*32*t at hf
    have hN : (k':ℝ)<((32*k+32:ℕ):ℝ) := by push_cast; linarith
    have h : k'<32*k+32 := by exact_mod_cast hN
    change k'≤32*k+31
    omega

/-- Points within one mesh spacing have left anchors within one edge. -/
theorem base32_nearby_anchor_indices (m : ℕ) {s t : ℝ} (hs : 0≤s) (ht : 0≤t)
    (h : |s-t|≤((32:ℝ)^m)⁻¹) :
    base32AnchorIndex m s ≤ base32AnchorIndex m t+1 ∧
      base32AnchorIndex m t ≤ base32AnchorIndex m s+1 := by
  let q := (32:ℝ)^m
  have hq : 0<q := by unfold q; positivity
  have core (a b : ℝ) (ha : 0≤a) (hab : a-b≤q⁻¹) :
      base32AnchorIndex m a ≤ base32AnchorIndex m b+1 := by
    have hDiff := mul_le_mul_of_nonneg_left hab hq.le
    rw [mul_sub,mul_inv_cancel₀ hq.ne'] at hDiff
    have hA : (base32AnchorIndex m a:ℝ)≤q*a := Nat.floor_le (mul_nonneg hq.le ha)
    have hB : q*b<(base32AnchorIndex m b:ℝ)+1 := Nat.lt_floor_add_one _
    have hLt : (base32AnchorIndex m a:ℝ)<((base32AnchorIndex m b+2:ℕ):ℝ) := by
      push_cast
      linarith
    have hh : base32AnchorIndex m a<base32AnchorIndex m b+2 := by exact_mod_cast hLt
    omega
  have h₁ : s-t≤q⁻¹ := (le_abs_self _).trans h
  have h₂ : -(s-t)≤q⁻¹ := (neg_le_abs (s-t)).trans h
  exact ⟨core s t hs h₁,core t s ht (by linarith)⟩

/-- The left anchors converge to the original point. -/
theorem base32_anchor_tendsto {t : ℝ} (ht : 0≤t) :
    Tendsto (fun m => base32GridPoint m (base32AnchorIndex m t)) atTop (𝓝 t) := by
  have hd : Tendsto (fun m : ℕ => ((32:ℝ)^m)⁻¹) atTop (𝓝 0) :=
    tendsto_inv_atTop_zero.comp (tendsto_pow_atTop_atTop_of_one_lt (by norm_num))
  apply tendsto_iff_norm_sub_tendsto_zero.mpr
  refine squeeze_zero (fun _=>norm_nonneg _) (fun m=>?_) hd
  let q := (32:ℝ)^m
  let j := base32AnchorIndex m t
  have hq : 0<q := by unfold q; positivity
  have h₀ : (j:ℝ)≤q*t := Nat.floor_le (mul_nonneg hq.le ht)
  have h₁ : q*t<(j:ℝ)+1 := Nat.lt_floor_add_one _
  have hg : (j:ℝ)/q ≤ t := (div_le_iff₀ hq).mpr (by linarith)
  change ‖(j:ℝ)/q-t‖ ≤ q⁻¹
  rw [Real.norm_eq_abs,abs_of_nonpos (sub_nonpos.mpr hg)]
  rw [← one_div]
  refine (le_div_iff₀ hq).mpr ?_
  have he : (-((j:ℝ)/q-t))*q = t*q-j := by
    field_simp
    ring
  rw [he]
  linarith

end PomeranceSarkozy
