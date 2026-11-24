import Conjectures.GravgaardLeeUpperLowerBasic

/-! # Gravgaard–Lee's mixed upper/lower Lüroth conjecture

The linked-interval geometry in section 1 of the existing
`DIRECT-REFINEMENT.md`. These steps preserve the strict positive residual;
the separate finite refinement that forces a lower-side digit is not assumed.
-/

open Set
open scoped Pointwise

namespace GravgaardLeeUpperLower

open GravgaardLeeLargeLuroth GravgaardLeeMixedLuroth

noncomputable section

theorem lower_gap_identity {k e : ℕ} (he : 2 ≤ e) :
    1 / (e : ℝ) = branch (e + 1) (endpoint k) +
      (1 - endpoint k) * width (e + 1) := by
  have heR : (2 : ℝ) ≤ e := by exact_mod_cast he
  have he0 : (e : ℝ) ≠ 0 := by linarith
  have hep : (e : ℝ) + 1 ≠ 0 := by linarith
  unfold branch width
  simp only [Nat.cast_add, Nat.cast_one, add_sub_cancel_right]
  field_simp
  ring

theorem lower_branch_ge_previous_gap {k e : ℕ} (hk : 2 ≤ k) (he : 3 ≤ e) :
    endpoint k * width e ≤ branch (e + 1) (endpoint k) := by
  have heR : (3 : ℝ) ≤ e := by exact_mod_cast he
  have hwidth : width e ≤ 1 / ((e : ℝ) + 1) := by
    apply one_div_le_one_div_of_le (by linarith)
    nlinarith [sq_nonneg ((e : ℝ) - 2)]
  have ha := endpoint_pos hk
  calc
    endpoint k * width e ≤ 1 * width e :=
      mul_le_mul_of_nonneg_right (endpoint_le_one hk) (width_pos (by omega)).le
    _ ≤ 1 / ((e : ℝ) + 1) := by simpa using hwidth
    _ ≤ branch (e + 1) (endpoint k) := by
      have hh := mul_nonneg (width_pos (d := e + 1) (by omega)).le ha.le
      simp only [branch, Nat.cast_add, Nat.cast_one]
      linarith

theorem appended_lower_gap_bound {k e : ℕ} (hk : 3 ≤ k) (he : 3 ≤ e) :
    width e * width (k + 1) ≤ width (e + 1) := by
  have hew := consecutive_width_bound he
  have hkw := width_le_half (show 2 ≤ k + 1 by omega)
  have hwe := (width_pos (d := e) (by omega)).le
  nlinarith [mul_le_mul_of_nonneg_left hkw hwe]

theorem twice_lower_gap_le_reciprocal {k e : ℕ} (hk : 2 ≤ k) (he : 3 ≤ e) :
    2 * (1 - endpoint k) * width e ≤ 1 / (e : ℝ) := by
  have heR : (3 : ℝ) ≤ e := by exact_mod_cast he
  have he0 : (e : ℝ) ≠ 0 := by linarith
  have he1 : (e : ℝ) - 1 ≠ 0 := by linarith
  have ha := endpoint_pos hk
  unfold width
  rw [mul_one_div]
  apply (div_le_iff₀ (mul_pos (by linarith : (0 : ℝ) < e)
    (by linarith : (0 : ℝ) < (e : ℝ) - 1))).2
  have hid : (1 / (e : ℝ)) * ((e : ℝ) * (e - 1)) = e - 1 := by field_simp
  rw [hid]
  linarith

/-- The digit constraints and positive prefix scales of one linked-interval state. -/
structure Frame (k : ℕ) where
  P : ℝ
  Q : ℝ
  p : ℕ
  e : ℕ
  P_pos : 0 < P
  Q_pos : 0 < Q
  p_ge_two : 2 ≤ p
  p_lt_k : p < k
  e_ge_k : k ≤ e

namespace Frame

variable {k : ℕ} (s : Frame k)

include s in
theorem k_ge_three : 3 ≤ k := by have := s.p_ge_two; have := s.p_lt_k; omega
theorem e_ge_three : 3 ≤ s.e := s.k_ge_three.trans s.e_ge_k

def upperWidth : ℝ := s.P * (1 / ((s.p : ℝ) - 1) - endpoint k)
def lowerWidth : ℝ := s.Q * branch s.e (endpoint k)
def upperGap : ℝ := s.P * endpoint k * width s.p
def lowerGap : ℝ := s.Q * (1 - endpoint k) * width (s.e + 1)
def lowerRightWidth : ℝ := s.Q * endpoint k * width s.e
def upperLeftWidth : ℝ := s.P * (1 / (s.p : ℝ) - endpoint k)
def upperRightWidth : ℝ := s.P * (1 - endpoint k) * width s.p

def Linked : Prop := s.upperGap ≤ s.lowerWidth ∧ s.lowerGap ≤ s.upperWidth
def Valid (z : ℝ) : Prop := s.Linked ∧ 0 < z ∧ z ≤ s.upperWidth + s.lowerWidth

theorem upperLeftWidth_pos : 0 < s.upperLeftWidth :=
  mul_pos s.P_pos (sub_pos.mpr (endpoint_lt_one_div s.p_ge_two s.p_lt_k))

theorem upperRightWidth_pos : 0 < s.upperRightWidth := by
  exact mul_pos (mul_pos s.P_pos (sub_pos.mpr (endpoint_lt_one s.k_ge_three)))
    (width_pos s.p_ge_two)

theorem upperGap_pos : 0 < s.upperGap :=
  mul_pos (mul_pos s.P_pos (endpoint_pos (by have := s.k_ge_three; omega)))
    (width_pos s.p_ge_two)

theorem upper_split :
    s.upperWidth = s.upperLeftWidth + s.upperGap + s.upperRightWidth := by
  dsimp [upperWidth, upperLeftWidth, upperGap, upperRightWidth]
  rw [← digitTop s.p_ge_two]
  ring

theorem lower_split : s.lowerWidth = s.Q / s.e + s.lowerRightWidth := by
  dsimp [lowerWidth, lowerRightWidth, branch]
  ring

theorem upper_gap_le_twice_left : s.upperGap ≤ 2 * s.upperLeftWidth := by
  have h := mul_le_mul_of_nonneg_left
    (upper_gap_le_two_left s.p_ge_two s.p_lt_k) s.P_pos.le
  dsimp [upperGap, upperLeftWidth]
  nlinarith

def appendUpper : Frame k where
  P := s.P * width s.p
  Q := s.Q
  p := 2
  e := s.e
  P_pos := mul_pos s.P_pos (width_pos s.p_ge_two)
  Q_pos := s.Q_pos
  p_ge_two := le_rfl
  p_lt_k := by have := s.k_ge_three; omega
  e_ge_k := s.e_ge_k

def appendLower : Frame k where
  P := s.P
  Q := s.Q * width s.e
  p := s.p
  e := k
  P_pos := s.P_pos
  Q_pos := mul_pos s.Q_pos (width_pos (by have := s.e_ge_three; omega))
  p_ge_two := s.p_ge_two
  p_lt_k := s.p_lt_k
  e_ge_k := le_rfl

def discardLower : Frame k where
  P := s.P
  Q := s.Q
  p := s.p
  e := s.e + 1
  P_pos := s.P_pos
  Q_pos := s.Q_pos
  p_ge_two := s.p_ge_two
  p_lt_k := s.p_lt_k
  e_ge_k := by have := s.e_ge_k; omega

@[simp] theorem appendUpper_upperWidth : s.appendUpper.upperWidth = s.upperRightWidth := by
  norm_num [appendUpper, upperWidth, upperRightWidth]
  ring

@[simp] theorem appendUpper_upperGap : s.appendUpper.upperGap = s.upperGap / 2 := by
  norm_num [appendUpper, upperGap, width]
  ring

@[simp] theorem appendUpper_lowerWidth : s.appendUpper.lowerWidth = s.lowerWidth := rfl
@[simp] theorem appendUpper_lowerGap : s.appendUpper.lowerGap = s.lowerGap := rfl

@[simp] theorem appendLower_upperWidth : s.appendLower.upperWidth = s.upperWidth := rfl
@[simp] theorem appendLower_upperGap : s.appendLower.upperGap = s.upperGap := rfl

@[simp] theorem appendLower_lowerWidth : s.appendLower.lowerWidth = s.lowerRightWidth := by
  dsimp [appendLower, lowerWidth, lowerRightWidth]
  rw [endpoint_fixed (by have := s.k_ge_three; omega)]
  ring

theorem appendLower_lowerGap_le : s.appendLower.lowerGap ≤ s.lowerGap := by
  have h := mul_le_mul_of_nonneg_left
    (appended_lower_gap_bound s.k_ge_three s.e_ge_three)
    (mul_pos s.Q_pos (sub_pos.mpr (endpoint_lt_one s.k_ge_three))).le
  dsimp [appendLower, lowerGap]
  nlinarith

@[simp] theorem discardLower_upperWidth : s.discardLower.upperWidth = s.upperWidth := rfl
@[simp] theorem discardLower_upperGap : s.discardLower.upperGap = s.upperGap := rfl

theorem discardLower_lowerGap_le : s.discardLower.lowerGap ≤ s.lowerGap := by
  have h := mul_le_mul_of_nonneg_left
    (width_antitone (by have := s.e_ge_three; omega : 2 ≤ s.e + 1)
      (by omega : s.e + 1 ≤ s.e + 1 + 1))
    (mul_pos s.Q_pos (sub_pos.mpr (endpoint_lt_one s.k_ge_three))).le
  exact h

theorem discardLower_width_ge : s.lowerRightWidth ≤ s.discardLower.lowerWidth := by
  have h := mul_le_mul_of_nonneg_left
    (lower_branch_ge_previous_gap (k := k) (by have := s.k_ge_three; omega) s.e_ge_three)
    s.Q_pos.le
  dsimp [lowerRightWidth, discardLower, lowerWidth]
  nlinarith

theorem lower_gap_sum : s.Q / s.e = s.discardLower.lowerWidth + s.lowerGap := by
  have h := lower_gap_identity (k := k) (show 2 ≤ s.e by have := s.e_ge_three; omega)
  dsimp [discardLower, lowerWidth, lowerGap]
  calc
    s.Q / (s.e : ℝ) = s.Q * (1 / (s.e : ℝ)) := by ring
    _ = _ := by rw [h]; ring

theorem appendLower_valid {z : ℝ} (hz : s.Valid z)
    (hchoose : s.upperGap ≤ s.lowerRightWidth) (hbranch : s.Q / s.e < z) :
    s.appendLower.Valid (z - s.Q / s.e) := by
  refine ⟨⟨?_, ?_⟩, sub_pos.mpr hbranch, ?_⟩
  · simpa using hchoose
  · exact s.appendLower_lowerGap_le.trans hz.1.2
  · simp only [appendLower_upperWidth, appendLower_lowerWidth]
    have hsum := s.lower_split
    linarith [hz.2.2]

theorem discardLower_valid {z : ℝ} (hz : s.Valid z)
    (hchoose : s.upperGap ≤ s.lowerRightWidth) (hbranch : z ≤ s.Q / s.e) :
    s.discardLower.Valid z := by
  refine ⟨⟨hchoose.trans s.discardLower_width_ge, ?_⟩, hz.2.1, ?_⟩
  · exact s.discardLower_lowerGap_le.trans hz.1.2
  · simp only [discardLower_upperWidth]
    have hsum := s.lower_gap_sum
    linarith [hz.1.2]

theorem appendUpper_valid {z : ℝ} (hz : s.Valid z)
    (hchoose : s.lowerRightWidth < s.upperGap)
    (hbranch : s.upperLeftWidth + s.upperGap < z) :
    s.appendUpper.Valid (z - (s.upperLeftWidth + s.upperGap)) := by
  have hk : 2 ≤ k := by have := s.k_ge_three; omega
  have ha := endpoint_pos hk
  have hW := sub_pos.mpr (endpoint_lt_one s.k_ge_three)
  have hscale : s.Q * width s.e < s.P * width s.p := by
    dsimp [lowerRightWidth, upperGap] at hchoose
    nlinarith
  have hlow : s.lowerGap ≤ s.Q * (1 - endpoint k) * width s.e := by
    exact mul_le_mul_of_nonneg_left
      (width_antitone (by have := s.e_ge_three; omega) (by omega : s.e ≤ s.e + 1))
      (mul_pos s.Q_pos hW).le
  have hright : s.lowerGap ≤ s.upperRightWidth := by
    dsimp [upperRightWidth]
    nlinarith [mul_lt_mul_of_pos_left hscale hW]
  refine ⟨⟨?_, ?_⟩, sub_pos.mpr hbranch, ?_⟩
  · simp only [appendUpper_upperGap, appendUpper_lowerWidth]
    linarith [hz.1.1, s.upperGap_pos]
  · simpa using hright
  · simp only [appendUpper_upperWidth, appendUpper_lowerWidth]
    linarith [hz.2.2, s.upper_split]

/-- A sufficiently large lower-digit cutoff makes its largest gap small. -/
theorem exists_small_lower_gap : ∃ e' : ℕ, s.e ≤ e' ∧
    s.Q * (1 - endpoint k) * width (e' + 1) ≤ s.upperLeftWidth := by
  obtain ⟨n, hn⟩ := exists_nat_gt (s.Q * (1 - endpoint k) / s.upperLeftWidth)
  let e' := max s.e (n + 1)
  have he : s.e ≤ e' := le_max_left _ _
  have hne : n < e' := by have := le_max_right s.e (n + 1); omega
  have he3 : 3 ≤ e' := s.e_ge_three.trans he
  have heR : (3 : ℝ) ≤ e' := by exact_mod_cast he3
  have hneR : (n : ℝ) < e' := by exact_mod_cast hne
  have hprod : s.Q * (1 - endpoint k) < (e' : ℝ) * s.upperLeftWidth :=
    (div_lt_iff₀ s.upperLeftWidth_pos).mp (hn.trans hneR)
  have hwidth : width (e' + 1) ≤ 1 / (e' : ℝ) := by
    unfold width
    simp only [Nat.cast_add, Nat.cast_one, add_sub_cancel_right]
    apply one_div_le_one_div_of_le (by linarith)
    nlinarith [sq_nonneg (e' : ℝ)]
  refine ⟨e', he, ?_⟩
  calc
    s.Q * (1 - endpoint k) * width (e' + 1) ≤
        s.Q * (1 - endpoint k) * (1 / (e' : ℝ)) :=
      mul_le_mul_of_nonneg_left hwidth
        (mul_pos s.Q_pos (sub_pos.mpr (endpoint_lt_one s.k_ge_three))).le
    _ ≤ s.upperLeftWidth := by
      rw [mul_one_div]
      exact (div_le_iff₀ (by linarith : (0 : ℝ) < e')).2 (by nlinarith)

/-- The least cutoff with a small lower gap still leaves enough lower width
to bridge the old upper gap. This is the source's minimal-cutoff argument. -/
theorem exists_linked_left_cutoff : ∃ e' : ℕ, s.e ≤ e' ∧
    s.Q * (1 - endpoint k) * width (e' + 1) ≤ s.upperLeftWidth ∧
    (s.Linked → s.upperGap ≤ s.Q * branch e' (endpoint k)) := by
  let hex := s.exists_small_lower_gap
  let e' := Nat.find hex
  have he : s.e ≤ e' := (Nat.find_spec hex).1
  have hsmall := (Nat.find_spec hex).2
  refine ⟨e', he, hsmall, fun hlink => ?_⟩
  by_cases heq : e' = s.e
  · simpa [heq, lowerWidth] using hlink.1
  have hep : s.e ≤ e' - 1 := by omega
  have hepos : 0 < e' := by have := s.e_ge_three; omega
  have hprev : ¬s.Q * (1 - endpoint k) * width ((e' - 1) + 1) ≤
      s.upperLeftWidth := by
    intro h
    exact Nat.find_min hex (show e' - 1 < Nat.find hex by dsimp [e'] at *; omega) ⟨hep, h⟩
  rw [Nat.sub_add_cancel hepos] at hprev
  have hstrict := lt_of_not_ge hprev
  have he3 : 3 ≤ e' := s.e_ge_three.trans he
  have hrec := mul_le_mul_of_nonneg_left
    (twice_lower_gap_le_reciprocal (k := k) (by have := s.k_ge_three; omega) he3)
    s.Q_pos.le
  have hlast : s.Q / (e' : ℝ) ≤ s.Q * branch e' (endpoint k) := by
    have hpos := mul_nonneg
      (width_pos (d := e') (by omega)).le
      (endpoint_pos (k := k) (by have := s.k_ge_three; omega)).le
    have hh := mul_le_mul_of_nonneg_left
      (show 1 / (e' : ℝ) ≤ branch e' (endpoint k) by dsimp [branch]; linarith)
      s.Q_pos.le
    simpa [div_eq_mul_inv] using hh
  apply le_of_lt
  calc
    s.upperGap ≤ 2 * s.upperLeftWidth := s.upper_gap_le_twice_left
    _ < 2 * (s.Q * (1 - endpoint k) * width e') := by linarith
    _ ≤ s.Q / (e' : ℝ) := by convert hrec using 1 <;> ring
    _ ≤ _ := hlast

/-- Retain the left upper-digit group, normalizing a singleton digit `k`
by appending it immediately. Its relative minimum is unchanged. -/
def discardUpper (e' : ℕ) (he : s.e ≤ e') : Frame k :=
  if hp : s.p + 1 < k then
    { P := s.P, Q := s.Q, p := s.p + 1, e := e'
      P_pos := s.P_pos, Q_pos := s.Q_pos
      p_ge_two := by have := s.p_ge_two; omega
      p_lt_k := hp, e_ge_k := s.e_ge_k.trans he }
  else
    { P := s.P * width k, Q := s.Q, p := 2, e := e'
      P_pos := mul_pos s.P_pos (width_pos (by have := s.k_ge_three; omega))
      Q_pos := s.Q_pos, p_ge_two := le_rfl
      p_lt_k := by have := s.k_ge_three; omega
      e_ge_k := s.e_ge_k.trans he }

theorem discardUpper_lowerWidth (e' : ℕ) (he : s.e ≤ e') :
    (s.discardUpper e' he).lowerWidth = s.Q * branch e' (endpoint k) := by
  unfold discardUpper
  split_ifs <;> rfl

theorem discardUpper_lowerGap (e' : ℕ) (he : s.e ≤ e') :
    (s.discardUpper e' he).lowerGap =
      s.Q * (1 - endpoint k) * width (e' + 1) := by
  unfold discardUpper
  split_ifs <;> rfl

theorem discardUpper_upperWidth (e' : ℕ) (he : s.e ≤ e') :
    (s.discardUpper e' he).upperWidth = s.upperLeftWidth := by
  by_cases hp : s.p + 1 < k
  · simp [discardUpper, hp, upperWidth, upperLeftWidth]
  · have hk_eq : k = s.p + 1 := by have := s.p_lt_k; omega
    have hcast : (k : ℝ) - 1 = (s.p : ℝ) := by simp [hk_eq]
    have hd := digitTop (show 2 ≤ k by have := s.k_ge_three; omega)
    rw [hcast] at hd
    have hf := endpoint_fixed (show 2 ≤ k by have := s.k_ge_three; omega)
    dsimp [branch] at hf
    simp only [discardUpper, hp, ↓reduceDIte, upperWidth, upperLeftWidth]
    norm_num
    calc
      s.P * width k * (1 - endpoint k) =
          s.P * ((1 / (k : ℝ) + width k) -
            (1 / (k : ℝ) + width k * endpoint k)) := by ring
      _ = _ := by rw [hd, hf]; simp [one_div]

theorem discardUpper_upperGap_le (e' : ℕ) (he : s.e ≤ e') :
    (s.discardUpper e' he).upperGap ≤ s.upperGap := by
  have ha := endpoint_pos (k := k) (by have := s.k_ge_three; omega)
  by_cases hp : s.p + 1 < k
  · simp only [discardUpper, hp, ↓reduceDIte, upperGap]
    exact mul_le_mul_of_nonneg_left
      (width_antitone s.p_ge_two (by omega : s.p ≤ s.p + 1)) (mul_pos s.P_pos ha).le
  · have hw := width_antitone s.p_ge_two s.p_lt_k.le
    have hh := mul_le_mul_of_nonneg_left hw (mul_pos s.P_pos ha).le
    have hpos := mul_pos (mul_pos s.P_pos ha)
      (width_pos (d := k) (by have := s.k_ge_three; omega))
    simp only [discardUpper, hp, ↓reduceDIte, upperGap]
    have htwo : width 2 = (1 : ℝ) / 2 := by norm_num [width]
    rw [htwo]
    nlinarith

theorem exists_discardUpper_valid {z : ℝ} (hz : s.Valid z)
    (hbranch : z ≤ s.upperLeftWidth + s.upperGap) :
    ∃ e' : ℕ, ∃ he : s.e ≤ e', (s.discardUpper e' he).Valid z := by
  obtain ⟨e', he, hsmall, hlink⟩ := s.exists_linked_left_cutoff
  refine ⟨e', he, ⟨⟨?_, ?_⟩, hz.2.1, ?_⟩⟩
  · rw [s.discardUpper_lowerWidth]
    exact (s.discardUpper_upperGap_le e' he).trans (hlink hz.1)
  · rw [s.discardUpper_lowerGap, s.discardUpper_upperWidth]
    exact hsmall
  · rw [s.discardUpper_upperWidth, s.discardUpper_lowerWidth]
    linarith [hlink hz.1]

def initial (hk : 3 ≤ k) : Frame k where
  P := 1
  Q := 1
  p := 2
  e := k
  P_pos := by norm_num
  Q_pos := by norm_num
  p_ge_two := le_rfl
  p_lt_k := by omega
  e_ge_k := le_rfl

theorem initial_valid (hk : 3 ≤ k) {z : ℝ} (hz : z ∈ Ioc (0 : ℝ) 1) :
    (initial hk).Valid z := by
  have hk2 : 2 ≤ k := by omega
  have ha := endpoint_pos hk2
  have hW := sub_pos.mpr (endpoint_lt_one hk)
  have hw := width_le_half (show 2 ≤ k + 1 by omega)
  have hf := endpoint_fixed hk2
  refine ⟨⟨?_, ?_⟩, hz.1, ?_⟩
  · norm_num [initial, upperGap, lowerWidth, width, hf]
    linarith
  · norm_num [initial, lowerGap, upperWidth]
    nlinarith [mul_le_mul_of_nonneg_left hw hW.le]
  · norm_num [initial, upperWidth, lowerWidth, hf]
    exact hz.2

end Frame

end
end GravgaardLeeUpperLower
