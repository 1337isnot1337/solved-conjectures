import Conjectures.GravgaardLeeUpperLowerMoves

/-! # Gravgaard–Lee's mixed upper/lower Lüroth conjecture

An orbit of genuine upper digits has a geometric prefix scale. If every
scene remains linked, its lower width also tends to zero. The resulting
actual digit expansion cannot have an eventually constant maximal tail.
-/

open Set Finset Filter Topology

namespace GravgaardLeeUpperLower

open GravgaardLeeLargeLuroth GravgaardLeeMixedLuroth

noncomputable section

namespace Frame

variable {k : ℕ} (s : Frame k)

theorem upperWidth_le_scale : s.upperWidth ≤ s.P := by
  have hp : (2 : ℝ) ≤ s.p := by exact_mod_cast s.p_ge_two
  have hrec : 1 / ((s.p : ℝ) - 1) ≤ 1 := by
    simpa using one_div_le_one_div_of_le (by norm_num : (0 : ℝ) < 1)
      (show 1 ≤ (s.p : ℝ) - 1 by linarith)
  have ha := endpoint_pos (k := k) (by have := s.k_ge_three; omega)
  dsimp [upperWidth]
  have hP := s.P_pos
  nlinarith [mul_le_mul_of_nonneg_left hrec s.P_pos.le]

theorem lowerWidth_pos : 0 < s.lowerWidth := by
  have he : (0 : ℝ) < s.e := by exact_mod_cast (show 0 < s.e by
    have := s.e_ge_three
    omega)
  have ha := endpoint_pos (k := k) (by have := s.k_ge_three; omega)
  have hw := width_pos (d := s.e) (by have := s.e_ge_three; omega)
  exact mul_pos s.Q_pos (by dsimp [branch]; positivity)

theorem lowerWidth_le_scale : s.lowerWidth ≤ s.Q := by
  have he : (2 : ℝ) ≤ s.e := by exact_mod_cast (show 2 ≤ s.e by
    have := s.e_ge_three
    omega)
  have htop : branch s.e (endpoint k) ≤ 1 / ((s.e : ℝ) - 1) := by
    have h := branch_mono (d := s.e) (by have := s.e_ge_three; omega)
      (endpoint_le_one (k := k) (by have := s.k_ge_three; omega))
    exact h.trans_eq (by
      simpa [branch] using digitTop (show 2 ≤ s.e by have := s.e_ge_three; omega))
  have hrec : 1 / ((s.e : ℝ) - 1) ≤ 1 := by
    simpa using one_div_le_one_div_of_le (by norm_num : (0 : ℝ) < 1)
      (show 1 ≤ (s.e : ℝ) - 1 by linarith)
  exact (mul_le_mul_of_nonneg_left (htop.trans hrec) s.Q_pos.le).trans_eq (mul_one s.Q)

theorem lowerWidth_square_bound (h : s.Linked) :
    s.lowerWidth ^ 2 * (1 - endpoint k) ≤ 3 * s.Q * s.P := by
  have he : (3 : ℝ) ≤ s.e := by exact_mod_cast s.e_ge_three
  have hW : 0 < 1 - endpoint k := sub_pos.mpr (endpoint_lt_one s.k_ge_three)
  have htop : branch s.e (endpoint k) ≤ 1 / ((s.e : ℝ) - 1) := by
    have h := branch_mono (d := s.e) (by have := s.e_ge_three; omega)
      (endpoint_le_one (k := k) (by have := s.k_ge_three; omega))
    exact h.trans_eq (by
      simpa [branch] using digitTop (show 2 ≤ s.e by have := s.e_ge_three; omega))
  have hb : 0 ≤ branch s.e (endpoint k) := (mul_pos_iff_of_pos_left s.Q_pos).mp
    s.lowerWidth_pos |>.le
  have hrec : (1 / ((s.e : ℝ) - 1)) ^ 2 ≤ 3 * width (s.e + 1) := by
    have hden : 0 < (s.e : ℝ) * ((s.e : ℝ) + 1) := by positivity
    have hsq : 0 < ((s.e : ℝ) - 1) ^ 2 := sq_pos_of_pos (by linarith)
    have hpoly : (s.e : ℝ) * ((s.e : ℝ) + 1) ≤
        3 * ((s.e : ℝ) - 1) ^ 2 := by
      nlinarith [mul_nonneg (show 0 ≤ (s.e : ℝ) - 3 by linarith)
        (show 0 ≤ 2 * (s.e : ℝ) - 1 by linarith)]
    calc
      _ = 1 / (((s.e : ℝ) - 1) ^ 2) := by rw [one_div_pow]
      _ ≤ 3 / ((s.e : ℝ) * ((s.e : ℝ) + 1)) :=
        (div_le_div_iff₀ hsq hden).2 (by nlinarith)
      _ = _ := by
        simp only [width, Nat.cast_add, Nat.cast_one, add_sub_cancel_right, mul_one_div]
        rw [mul_comm ((s.e : ℝ) + 1)]
  have hs : (branch s.e (endpoint k)) ^ 2 ≤ 3 * width (s.e + 1) := by
    nlinarith
  have hscaled := mul_le_mul_of_nonneg_left hs
    (mul_nonneg (sq_nonneg s.Q) hW.le)
  have hQ := s.Q_pos
  have hgap := mul_le_mul_of_nonneg_left h.2 (show 0 ≤ 3 * s.Q by positivity)
  have hupper := mul_le_mul_of_nonneg_left s.upperWidth_le_scale
    (show 0 ≤ 3 * s.Q by positivity)
  dsimp [lowerWidth, lowerGap] at *
  nlinarith

end Frame

namespace Scene

variable {k : ℕ}

/-- One actual lower digit has been appended; the upper cylinder may shrink. -/
def AdvanceLower (s t : Scene k) : Prop := ∃ d : ℕ,
  s.e ≤ d ∧ t.Q = s.Q * width d ∧ t.v = s.v + s.Q / d ∧ t.e = k ∧
  t.upperCylinder ⊆ s.upperCylinder

def CanAdvance (s : Scene k) (x : ℝ) : Prop :=
  ∃ t : Scene k, t.Valid x ∧ AdvanceLower s t

theorem LowerMove.advance {s t : Scene k} (h : LowerMove s t) : AdvanceLower s t := by
  obtain ⟨d, hd, hQ, hv, he, _, _, _, hc⟩ := h
  exact ⟨d, hd, hQ, hv, he, hc⟩

theorem AdvanceLower.after_upper {s t u : Scene k} (hst : UpperMove s t)
    (htu : AdvanceLower t u) : AdvanceLower s u := by
  obtain ⟨_, _, _, _, _, hQ, hv, _, he, hc⟩ := hst
  obtain ⟨d, hd, hQ', hv', he', hc'⟩ := htu
  refine ⟨d, he.trans hd, ?_, ?_, he', hc'.trans hc⟩
  · simpa [hQ] using hQ'
  · simpa [hQ, hv] using hv'

theorem exists_blocked_upper {s : Scene k} {x : ℝ} (hs : s.Valid x)
    (hb : ¬s.CanAdvance x) :
    ∃ t : Scene k, t.Valid x ∧ ¬t.CanAdvance x ∧ UpperMove s t := by
  obtain ⟨t, ht, hm⟩ := s.exists_move hs
  rcases hm with hm | hm
  · refine ⟨t, ht, ?_, hm⟩
    rintro ⟨u, hu, htu⟩
    exact hb ⟨u, hu, htu.after_upper hm⟩
  · exact False.elim (hb ⟨t, ht, hm.advance⟩)

/-- An infinite orbit of actual upper digits, with valid linked states. -/
structure UpperOrbit (s : Scene k) (x : ℝ) where
  state : ℕ → Scene k
  initial : state 0 = s
  valid : ∀ n, (state n).Valid x
  step : ∀ n, UpperMove (state n) (state (n + 1))

namespace UpperOrbit

variable {s : Scene k} {x : ℝ} (o : UpperOrbit s x)

def digit (n : ℕ) : ℕ := Classical.choose (o.step n)

theorem digit_spec (n : ℕ) :
    (o.state n).p ≤ o.digit n ∧ o.digit n ≤ k ∧
    (o.state (n + 1)).P = (o.state n).P * width (o.digit n) ∧
    (o.state (n + 1)).u = (o.state n).u + (o.state n).P / o.digit n ∧
    (o.state (n + 1)).Q = (o.state n).Q ∧
    (o.state (n + 1)).v = (o.state n).v ∧
    (o.state (n + 1)).p = 2 ∧ (o.state n).e ≤ (o.state (n + 1)).e ∧
    (o.state (n + 1)).upperCylinder ⊆ (o.state n).upperCylinder :=
  Classical.choose_spec (o.step n)

theorem digit_bounds (n : ℕ) : 2 ≤ o.digit n ∧ o.digit n ≤ k :=
  ⟨(o.state n).p_ge_two.trans (o.digit_spec n).1, (o.digit_spec n).2.1⟩

theorem scale_eq (n : ℕ) :
    (o.state n).P = s.P * ∏ j ∈ range n, width (o.digit j) := by
  induction n with
  | zero => simp [o.initial]
  | succ n ih => rw [(o.digit_spec n).2.2.1, ih, prod_range_succ]; ring

theorem offset_eq (n : ℕ) : (o.state n).u = s.u + s.P * truncation o.digit n := by
  induction n with
  | zero => simp [o.initial, truncation]
  | succ n ih =>
    rw [(o.digit_spec n).2.2.2.1, ih, o.scale_eq n, prefix_succ]
    ring

theorem lower_scale_eq (n : ℕ) : (o.state n).Q = s.Q := by
  induction n with
  | zero => simp [o.initial]
  | succ n ih => exact (o.digit_spec n).2.2.2.2.1.trans ih

theorem lower_offset_eq (n : ℕ) : (o.state n).v = s.v := by
  induction n with
  | zero => simp [o.initial]
  | succ n ih => exact (o.digit_spec n).2.2.2.2.2.1.trans ih

theorem cylinder_subset (n : ℕ) : (o.state n).upperCylinder ⊆ s.upperCylinder := by
  induction n with
  | zero => simp [o.initial]
  | succ n ih => exact (o.digit_spec n).2.2.2.2.2.2.2.2.trans ih

theorem scale_tendsto : Tendsto (fun n => (o.state n).P) atTop (𝓝 0) := by
  have hlim := (tendsto_pow_atTop_nhds_zero_of_lt_one
    (by norm_num : (0 : ℝ) ≤ 1 / 2) (by norm_num : (1 / 2 : ℝ) < 1)).const_mul s.P
  simp only [mul_zero] at hlim
  refine tendsto_of_tendsto_of_tendsto_of_le_of_le tendsto_const_nhds hlim
    (fun n => (o.state n).P_pos.le) (fun n => ?_)
  rw [o.scale_eq]
  exact mul_le_mul_of_nonneg_left (scale_le o.digit (fun i => (o.digit_bounds i).1) n)
    s.P_pos.le

theorem offset_tendsto :
    Tendsto (fun n => (o.state n).u) atTop (𝓝 (s.u + s.P * value o.digit)) := by
  simpa only [o.offset_eq] using
    ((tendsto_prefix o.digit (fun i => (o.digit_bounds i).1)).const_mul s.P).const_add s.u

theorem lowerWidth_tendsto :
    Tendsto (fun n => (o.state n).toFrame.lowerWidth) atTop (𝓝 0) := by
  have hW : 0 < 1 - endpoint k := sub_pos.mpr (endpoint_lt_one s.toFrame.k_ge_three)
  refine tendsto_order.2 ⟨fun a ha => Eventually.of_forall (fun n =>
    ha.trans_le (o.state n).toFrame.lowerWidth_pos.le), ?_⟩
  intro b hb
  have hQ := s.Q_pos
  have hε : 0 < b ^ 2 * (1 - endpoint k) / (3 * s.Q) := by positivity
  filter_upwards [(tendsto_order.1 o.scale_tendsto).2 _ hε] with n hn
  have hbound := (o.state n).toFrame.lowerWidth_square_bound (o.valid n).1
  rw [o.lower_scale_eq] at hbound
  have hsmall := (lt_div_iff₀ (show 0 < 3 * s.Q by positivity)).1 hn
  by_contra h
  have hle : b ≤ (o.state n).toFrame.lowerWidth := le_of_not_gt h
  have hsq : b ^ 2 ≤ (o.state n).toFrame.lowerWidth ^ 2 := by nlinarith
  have := mul_le_mul_of_nonneg_right hsq hW.le
  nlinarith

theorem residual_tendsto : Tendsto (fun n => (o.state n).residual x) atTop (𝓝 0) := by
  have hlim := o.scale_tendsto.add o.lowerWidth_tendsto
  simp only [zero_add] at hlim
  refine tendsto_of_tendsto_of_tendsto_of_le_of_le tendsto_const_nhds hlim
    (fun n => (o.valid n).2.1.le) (fun n => ?_)
  exact (o.valid n).2.2.trans (add_le_add (o.state n).toFrame.upperWidth_le_scale le_rfl)

theorem value_identity : x = s.u + s.v + s.P * value o.digit := by
  have hv : Tendsto (fun n => (o.state n).v) atTop (𝓝 s.v) := by
    simpa only [o.lower_offset_eq] using tendsto_const_nhds (x := s.v)
  have h := ((tendsto_const_nhds (x := x)).sub o.offset_tendsto).sub hv
  have h' := h.sub (o.scale_tendsto.mul_const (endpoint k))
  have heq := tendsto_nhds_unique o.residual_tendsto h'
  simp only [zero_mul, sub_zero] at heq
  linarith

theorem tail_identity (n : ℕ) :
    x - (o.state n).u - s.v =
      (o.state n).P * value (fun i => o.digit (n + i)) := by
  have hv := o.value_identity
  rw [value_truncation o.digit (fun i => (o.digit_bounds i).1) n] at hv
  rw [o.offset_eq, o.scale_eq]
  nlinarith

theorem nonmax_arbitrarily_late (N : ℕ) : ∃ n, N ≤ n ∧ o.digit n < k := by
  by_contra h
  push Not at h
  have hd : (fun i => o.digit (N + i)) = fun _ => k := by
    funext i
    exact le_antisymm (o.digit_bounds _).2 (h _ (by omega))
  have ht := o.tail_identity N
  rw [hd, value_const (show 2 ≤ k by have := s.toFrame.k_ge_three; omega)] at ht
  have hp := (o.valid N).2.1
  rw [residual, o.lower_offset_eq] at hp
  linarith

end UpperOrbit

def Blocked (k : ℕ) (x : ℝ) := {s : Scene k // s.Valid x ∧ ¬s.CanAdvance x}

def blockedNext {x : ℝ} (s : Blocked k x) : Blocked k x :=
  ⟨Classical.choose (exists_blocked_upper s.property.1 s.property.2),
    (Classical.choose_spec (exists_blocked_upper s.property.1 s.property.2)).1,
    (Classical.choose_spec (exists_blocked_upper s.property.1 s.property.2)).2.1⟩

theorem blockedNext_move {x : ℝ} (s : Blocked k x) :
    UpperMove s.val (blockedNext s).val :=
  (Classical.choose_spec (exists_blocked_upper s.property.1 s.property.2)).2.2

def blockedStates {x : ℝ} (s : Blocked k x) : ℕ → Blocked k x
  | 0 => s
  | n + 1 => blockedNext (blockedStates s n)

def blockedOrbit {x : ℝ} (s : Blocked k x) : UpperOrbit s.val x where
  state n := (blockedStates s n).val
  initial := rfl
  valid n := (blockedStates s n).property.1
  step n := blockedNext_move (blockedStates s n)

end Scene

end
end GravgaardLeeUpperLower
