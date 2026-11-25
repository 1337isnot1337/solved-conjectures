import Conjectures.GravgaardLeeDiameterDigits

/-!
# Alternating Lüroth digits with two initial scales
-/

open Filter Finset Set
open scoped Topology Pointwise

namespace GravgaardLeeDiameter

open GravgaardLeeLargeLuroth GravgaardLeeUpperLower

noncomputable section

private structure SplitState where
  rest : ℝ
  active : ℝ
  waiting : ℝ

namespace SplitState

private def Valid (s : SplitState) : Prop :=
  0 < s.rest ∧ s.rest ≤ s.active ∧ s.rest ≤ s.waiting

private def digit (s : SplitState) : ℕ := ⌊s.active / s.rest⌋₊ + 1

private def step (s : SplitState) : SplitState :=
  ⟨s.rest - s.active / (s.digit : ℝ), s.waiting, s.active * width s.digit⟩

private theorem digit_ge (s : SplitState) (hs : s.Valid) {k : ℕ}
    (h : ((k : ℝ) - 1) * s.rest ≤ s.active) : k ≤ s.digit := by
  by_cases hk : 1 ≤ k
  · have hh : k - 1 ≤ ⌊s.active / s.rest⌋₊ := Nat.le_floor (by
      rw [Nat.cast_sub hk, Nat.cast_one]
      exact (le_div_iff₀ hs.1).mpr h)
    unfold digit
    omega
  · omega

private theorem step_valid (s : SplitState) (hs : s.Valid) :
    s.step.Valid ∧ s.step.rest ≤ s.rest / (s.digit : ℝ) ∧ s.digit < s.step.digit := by
  have hd : 2 ≤ s.digit := s.digit_ge hs (by norm_num; exact hs.2.1)
  have hdR : (2 : ℝ) ≤ s.digit := by exact_mod_cast hd
  have hd0 : 0 < (s.digit : ℝ) := by linarith
  have hd1 : 0 < (s.digit : ℝ) - 1 := by linarith
  have ha : 0 < s.active := hs.1.trans_le hs.2.1
  have hlo : ((s.digit : ℝ) - 1) * s.rest ≤ s.active := by
    simpa [digit] using (le_div_iff₀ hs.1).mp (Nat.floor_le (div_nonneg ha.le hs.1.le))
  have hhi : s.active < (s.digit : ℝ) * s.rest := by
    simpa [digit] using (div_lt_iff₀ hs.1).mp (Nat.lt_floor_add_one (s.active / s.rest))
  have hpos : 0 < s.step.rest := sub_pos.mpr ((div_lt_iff₀ hd0).2 (by rwa [mul_comm]))
  have hsmall : s.step.rest ≤ s.rest / (s.digit : ℝ) := by
    apply (le_div_iff₀ hd0).2
    change (s.rest - s.active / (s.digit : ℝ)) * (s.digit : ℝ) ≤ s.rest
    rw [sub_mul, div_mul_cancel₀ _ hd0.ne']
    nlinarith
  have hs' : s.step.Valid := by
    refine ⟨hpos, hsmall.trans ((div_le_self hs.1.le (by linarith)).trans hs.2.2), ?_⟩
    apply hsmall.trans
    change s.rest / (s.digit : ℝ) ≤ s.active * (1 / ((s.digit : ℝ) * ((s.digit : ℝ) - 1)))
    rw [mul_one_div]
    apply (le_div_iff₀ (mul_pos hd0 hd1)).2
    rwa [← mul_assoc, div_mul_cancel₀ _ hd0.ne', mul_comm]
  have hn : s.digit ≤ ⌊s.step.active / s.step.rest⌋₊ := by
    apply Nat.le_floor
    apply (le_div_iff₀ hpos).mpr
    rw [mul_comm]
    exact ((le_div_iff₀ hd0).mp hsmall).trans hs.2.2
  exact ⟨hs', hsmall, by change s.digit < _ + 1; omega⟩

private def iter (s : SplitState) (n : ℕ) : SplitState := step^[n] s

private theorem iter_succ (s : SplitState) (n : ℕ) : s.iter (n + 1) = (s.iter n).step := by
  simp [iter, Function.iterate_succ_apply']

private def digits (s : SplitState) (offset n : ℕ) := (s.iter (2 * n + offset)).digit

private theorem iter_valid {s : SplitState} (hs : s.Valid) (n : ℕ) : (s.iter n).Valid := by
  induction n with
  | zero => exact hs
  | succ n ih => rw [iter_succ]; exact ((s.iter n).step_valid ih).1

private theorem iter_tendsto {s : SplitState} (hs : s.Valid) :
    Tendsto (fun n => (s.iter n).rest) atTop (𝓝 0) := by
  have hb (n : ℕ) : (s.iter n).rest ≤ s.rest * (1 / 2 : ℝ) ^ n := by
    induction n with
    | zero => simp [iter]
    | succ n ih =>
        have hv := iter_valid hs n
        have hd : (2 : ℝ) ≤ (s.iter n).digit := by
          exact_mod_cast (s.iter n).digit_ge hv (k := 2) (by norm_num; exact hv.2.1)
        rw [iter_succ]
        have hnext := ((s.iter n).step_valid hv).2.1.trans
          (div_le_div_of_nonneg_left hv.1.le (by norm_num) hd)
        rw [pow_succ]
        linarith
  have ht := (tendsto_pow_atTop_nhds_zero_of_lt_one
    (by norm_num : (0 : ℝ) ≤ 1 / 2) (by norm_num)).const_mul s.rest
  rw [mul_zero] at ht
  exact tendsto_of_tendsto_of_tendsto_of_le_of_le tendsto_const_nhds ht
    (fun n => (iter_valid hs n).1.le) hb

private theorem scale_prefix (s : SplitState) (offset : ℕ) (n : ℕ) :
    (s.iter (2 * n + offset)).active =
      (s.iter offset).active * ∏ j ∈ range n, width (s.digits offset j) := by
  induction n with
  | zero => simp
  | succ n ih =>
      rw [show 2 * (n + 1) + offset = 2 * n + offset + 1 + 1 by omega,
        iter_succ, iter_succ, prod_range_succ, ← mul_assoc, ← ih]
      rfl

private theorem prefix_sum (s : SplitState) (n : ℕ) :
    s.active * truncation (s.digits 0) n + s.waiting * truncation (s.digits 1) n +
      (s.iter (2 * n)).rest = s.rest := by
  induction n with
  | zero => simp [iter, truncation]
  | succ n ih =>
      have h0 := s.scale_prefix 0 n
      have h1 := s.scale_prefix 1 n
      have hP : (s.iter 0).active = s.active := rfl
      have hQ : (s.iter 1).active = s.waiting := rfl
      rw [hP, Nat.add_zero] at h0
      rw [hQ] at h1
      unfold digits at h0 h1
      have hstep (j : ℕ) : (s.iter (j + 1)).rest =
          (s.iter j).rest - (s.iter j).active / ((s.iter j).digit : ℝ) := by
        rw [iter_succ]
        rfl
      rw [prefix_succ, prefix_succ,
        show 2 * (n + 1) = 2 * n + 1 + 1 by omega, hstep, hstep]
      simp only [digits, Nat.add_zero]
      rw [h0, h1]
      ring_nf at ih ⊢
      exact ih

end SplitState

/-- Split a small positive residual into two genuine tails at the
specified cylinder scales and with independently prescribed digit bounds. -/
theorem two_scaled_tails {k l : ℕ} (hk : 2 ≤ k) (hl : 2 ≤ l) {P Q z : ℝ}
    (hz : 0 < z) (hP : z ≤ P) (hQ : z ≤ Q)
    (hfirst : ((k : ℝ) - 1) * z ≤ P) (hsecond : ((l : ℝ) - 1) * z ≤ Q) :
    ∃ u ∈ largeDigitSet k, ∃ v ∈ largeDigitSet l, P * u + Q * v = z := by
  let s : SplitState := ⟨z, P, Q⟩
  have hs : s.Valid := ⟨hz, hP, hQ⟩
  have hmono : StrictMono (fun n => (s.iter n).digit) := by
    apply strictMono_nat_of_lt_succ
    intro n
    rw [SplitState.iter_succ]
    exact ((s.iter n).step_valid (SplitState.iter_valid hs n)).2.2
  have h0 : k ≤ (s.iter 0).digit := s.digit_ge hs hfirst
  have h1 : l ≤ (s.iter 1).digit := by
    rw [SplitState.iter_succ]
    apply (s.iter 0).step.digit_ge ((s.iter 0).step_valid hs).1
    have h := (s.step_valid hs).2.1
    have hlR : (2 : ℝ) ≤ l := by exact_mod_cast hl
    have hdR : (2 : ℝ) ≤ s.digit := by
      exact_mod_cast s.digit_ge hs (k := 2) (by norm_num; exact hP)
    change s.step.rest ≤ z / (s.digit : ℝ) at h
    change ((l : ℝ) - 1) * s.step.rest ≤ Q
    have hz' := h.trans (div_le_self hz.le (by linarith))
    exact (mul_le_mul_of_nonneg_left hz' (by linarith)).trans hsecond
  let a := s.digits 0
  let b := s.digits 1
  have ha (n : ℕ) : k ≤ a n := h0.trans (hmono.monotone (Nat.zero_le _))
  have hb (n : ℕ) : l ≤ b n := h1.trans (hmono.monotone (by change 1 ≤ 2 * n + 1; omega))
  refine ⟨value a, (mem_largeDigitSet hk).mpr ⟨a, ha, rfl⟩,
    value b, (mem_largeDigitSet hl).mpr ⟨b, hb, rfl⟩, ?_⟩
  have hrest := (SplitState.iter_tendsto hs).comp
    (tendsto_atTop_mono (fun n => show n ≤ 2 * n by omega) tendsto_id)
  have hlim := (((tendsto_prefix a (fun n => hk.trans (ha n))).const_mul P).add
    ((tendsto_prefix b (fun n => hl.trans (hb n))).const_mul Q)).add hrest
  simp only [Function.comp_apply, add_zero] at hlim
  have hfun : (fun n => P * truncation a n + Q * truncation b n + (s.iter (2 * n)).rest) =
      fun _ => z := funext (s.prefix_sum)
  rw [hfun] at hlim
  exact tendsto_nhds_unique hlim tendsto_const_nhds

end

end GravgaardLeeDiameter
