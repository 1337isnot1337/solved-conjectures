import Conjectures.GravgaardLeeUpperLowerForcing

/-! # Gravgaard–Lee's mixed upper/lower Lüroth conjecture

Iterating genuine lower-digit advances produces an actual infinite lower
expansion. Only the bounded-digit upper set is closed in the limiting step.
This proves the full interval inclusion for every threshold at least three.
-/

open Set Finset Filter Topology
open scoped Pointwise

namespace GravgaardLeeUpperLower

open GravgaardLeeLargeLuroth GravgaardLeeMixedLuroth

noncomputable section

namespace Frame

variable {k : ℕ}

theorem upper_scale_bound (s : Frame k) (hs : s.Linked) :
    s.P ≤ s.Q / (endpoint k * width (k - 1)) := by
  have hk := s.k_ge_three
  have ha := endpoint_pos (k := k) (by omega)
  have hw := width_pos (d := k - 1) (by omega)
  apply (le_div_iff₀ (mul_pos ha hw)).2
  calc
    s.P * (endpoint k * width (k - 1)) ≤ s.upperGap := by
      have h := mul_le_mul_of_nonneg_left
        (width_antitone s.p_ge_two (show s.p ≤ k - 1 by have := s.p_lt_k; omega))
        (mul_pos s.P_pos ha).le
      simpa only [upperGap, mul_assoc] using h
    _ ≤ s.lowerWidth := hs.1
    _ ≤ s.Q := s.lowerWidth_le_scale

end Frame

namespace Scene

variable {k : ℕ}

/-- Each step appends exactly one actual lower digit and keeps the upper
cylinder inside the preceding actual upper cylinder. -/
structure LowerOrbit (s : Scene k) (x : ℝ) where
  state : ℕ → Scene k
  initial : state 0 = s
  valid : ∀ n, (state n).Valid x
  step : ∀ n, AdvanceLower (state n) (state (n + 1))

namespace LowerOrbit

variable {s : Scene k} {x : ℝ} (o : LowerOrbit s x)

def digit (n : ℕ) : ℕ := Classical.choose (o.step n)

theorem digit_spec (n : ℕ) : (o.state n).e ≤ o.digit n ∧
    (o.state (n + 1)).Q = (o.state n).Q * width (o.digit n) ∧
    (o.state (n + 1)).v = (o.state n).v + (o.state n).Q / o.digit n ∧
    (o.state (n + 1)).e = k ∧
    (o.state (n + 1)).upperCylinder ⊆ (o.state n).upperCylinder :=
  Classical.choose_spec (o.step n)

theorem digit_bound (n : ℕ) : k ≤ o.digit n :=
  (o.state n).e_ge_k.trans (o.digit_spec n).1

theorem digit_ge_two (n : ℕ) : 2 ≤ o.digit n :=
  (show 2 ≤ k by have := s.toFrame.k_ge_three; omega).trans (o.digit_bound n)

theorem scale_eq (n : ℕ) :
    (o.state n).Q = s.Q * ∏ j ∈ range n, width (o.digit j) := by
  induction n with
  | zero => simp [o.initial]
  | succ n ih => rw [(o.digit_spec n).2.1, ih, prod_range_succ]; ring

theorem offset_eq (n : ℕ) : (o.state n).v = s.v + s.Q * truncation o.digit n := by
  induction n with
  | zero => simp [o.initial, truncation]
  | succ n ih =>
    rw [(o.digit_spec n).2.2.1, ih, o.scale_eq n, prefix_succ]
    ring

theorem cylinder_subset (n : ℕ) : (o.state n).upperCylinder ⊆ s.upperCylinder := by
  induction n with
  | zero => simp [o.initial]
  | succ n ih => exact (o.digit_spec n).2.2.2.2.trans ih

theorem scale_tendsto : Tendsto (fun n => (o.state n).Q) atTop (𝓝 0) := by
  have hlim := (tendsto_pow_atTop_nhds_zero_of_lt_one
    (by norm_num : (0 : ℝ) ≤ 1 / 2) (by norm_num : (1 / 2 : ℝ) < 1)).const_mul s.Q
  simp only [mul_zero] at hlim
  refine tendsto_of_tendsto_of_tendsto_of_le_of_le tendsto_const_nhds hlim
    (fun n => (o.state n).Q_pos.le) (fun n => ?_)
  rw [o.scale_eq]
  exact mul_le_mul_of_nonneg_left (scale_le o.digit o.digit_ge_two n) s.Q_pos.le

theorem offset_tendsto :
    Tendsto (fun n => (o.state n).v) atTop (𝓝 (s.v + s.Q * value o.digit)) := by
  simpa only [o.offset_eq] using
    ((tendsto_prefix o.digit o.digit_ge_two).const_mul s.Q).const_add s.v

theorem upper_scale_tendsto : Tendsto (fun n => (o.state n).P) atTop (𝓝 0) := by
  have ha := endpoint_pos (k := k) (show 2 ≤ k by have := s.toFrame.k_ge_three; omega)
  have hw := width_pos (d := k - 1) (by have := s.toFrame.k_ge_three; omega)
  have hlim := o.scale_tendsto.div_const (endpoint k * width (k - 1))
  simp only [zero_div] at hlim
  exact tendsto_of_tendsto_of_tendsto_of_le_of_le tendsto_const_nhds hlim
    (fun n => (o.state n).P_pos.le)
    (fun n => (o.state n).toFrame.upper_scale_bound (o.valid n).1)

theorem residual_tendsto : Tendsto (fun n => (o.state n).residual x) atTop (𝓝 0) := by
  have hlim := o.upper_scale_tendsto.add o.scale_tendsto
  simp only [zero_add] at hlim
  refine tendsto_of_tendsto_of_tendsto_of_le_of_le tendsto_const_nhds hlim
    (fun n => (o.valid n).2.1.le) (fun n => ?_)
  exact (o.valid n).2.2.trans (add_le_add (o.state n).toFrame.upperWidth_le_scale
    (o.state n).toFrame.lowerWidth_le_scale)

theorem minimum_tendsto : Tendsto (fun n => (o.state n).u + (o.state n).P * endpoint k)
    atTop (𝓝 (x - (s.v + s.Q * value o.digit))) := by
  have hlim := ((tendsto_const_nhds (x := x)).sub o.offset_tendsto).sub o.residual_tendsto
  simp only [sub_zero] at hlim
  convert hlim using 1
  funext n
  dsimp [residual]
  ring

theorem upper_limit_mem : x - (s.v + s.Q * value o.digit) ∈ s.upperCylinder := by
  apply s.upperCylinder_compact.isClosed.mem_of_tendsto o.minimum_tendsto
  exact Eventually.of_forall fun n => o.cylinder_subset n (o.state n).minimum_mem

end LowerOrbit

def ValidScene (k : ℕ) (x : ℝ) := {s : Scene k // s.Valid x}

def advanceNext {x : ℝ} (s : ValidScene k x) : ValidScene k x :=
  ⟨Classical.choose (s.val.canAdvance s.property),
    (Classical.choose_spec (s.val.canAdvance s.property)).1⟩

theorem advanceNext_move {x : ℝ} (s : ValidScene k x) :
    AdvanceLower s.val (advanceNext s).val :=
  (Classical.choose_spec (s.val.canAdvance s.property)).2

def advanceStates {x : ℝ} (s : ValidScene k x) : ℕ → ValidScene k x
  | 0 => s
  | n + 1 => advanceNext (advanceStates s n)

def lowerOrbit {x : ℝ} (s : ValidScene k x) : LowerOrbit s.val x where
  state n := (advanceStates s n).val
  initial := rfl
  valid n := (advanceStates s n).property
  step n := advanceNext_move (advanceStates s n)

def initialScene (hk : 3 ≤ k) : Scene k where
  toFrame := Frame.initial hk
  u := 0
  v := 0

theorem initialScene_valid (hk : 3 ≤ k) {x : ℝ}
    (hx : x ∈ Ioc (endpoint k) (1 + endpoint k)) : (initialScene hk).Valid x := by
  change (Frame.initial hk).Valid (x - 0 - 0 - 1 * endpoint k)
  apply Frame.initial_valid hk
  constructor <;> simp only [sub_zero, one_mul] <;> linarith [hx.1, hx.2]

theorem initialScene_cylinder (hk : 3 ≤ k) :
    (initialScene hk).upperCylinder = smallDigitSet k := by
  simp [upperCylinder, initialScene, Frame.initial, upperTail_two]

end Scene

/-- The exact interval lower inclusion, uniformly for every k at least three.
The constructed lower summand is a genuine infinite Lüroth expansion. -/
theorem interval_subset_sum_ge_three {k : ℕ} (hk : 3 ≤ k) :
    Ioc (endpoint k) (1 + endpoint k) ⊆ smallDigitSet k + largeDigitSet k := by
  intro x hx
  let s := Scene.initialScene hk
  let o : Scene.LowerOrbit s x := Scene.lowerOrbit ⟨s, Scene.initialScene_valid hk hx⟩
  have hu := o.upper_limit_mem
  have hu' : x - value o.digit ∈ smallDigitSet k := by
    change x - (0 + 1 * value o.digit) ∈ (Scene.initialScene hk).upperCylinder at hu
    rw [Scene.initialScene_cylinder] at hu
    simpa only [zero_add, one_mul] using hu
  have hv : value o.digit ∈ largeDigitSet k :=
    (mem_largeDigitSet (show 2 ≤ k by omega)).2 ⟨o.digit, o.digit_bound, rfl⟩
  exact ⟨x - value o.digit, hu', value o.digit, hv, sub_add_cancel _ _⟩

end
end GravgaardLeeUpperLower
