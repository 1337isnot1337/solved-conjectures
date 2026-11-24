import Conjectures.GravgaardLeeUpperLowerCylinders

/-! # Gravgaard–Lee's mixed upper/lower Lüroth conjecture

Finite refinement to the next appended digit. Group cuts are accelerated to
their first stopping cutoff, retaining the exact positive-target invariant.
This section does not yet force the appended digit to occur on the lower side.
-/

open Set

namespace GravgaardLeeUpperLower

open GravgaardLeeLargeLuroth GravgaardLeeMixedLuroth

noncomputable section

theorem exists_scaled_width_lt {C L : ℝ} (hC : 0 ≤ C) (hL : 0 < L) (e : ℕ) :
    ∃ d : ℕ, e ≤ d ∧ 2 ≤ d ∧ C * width d < L := by
  obtain ⟨n, hn⟩ := exists_nat_gt (C / L)
  let d := max e (n + 2)
  have hnlt : n < d := by have := le_max_right e (n + 2); omega
  have hd2 : 2 ≤ d := by have := le_max_right e (n + 2); omega
  have hdR : (2 : ℝ) ≤ d := by exact_mod_cast hd2
  have hnR : (n : ℝ) < d := by exact_mod_cast hnlt
  have hprod := (div_lt_iff₀ hL).mp (hn.trans hnR)
  have hwidth : width d ≤ 1 / (d : ℝ) := by
    apply one_div_le_one_div_of_le (by linarith)
    nlinarith [mul_nonneg (show 0 ≤ (d : ℝ) by linarith)
      (show 0 ≤ (d : ℝ) - 2 by linarith)]
  refine ⟨d, le_max_left _ _, hd2, ?_⟩
  calc
    C * width d ≤ C * (1 / (d : ℝ)) := mul_le_mul_of_nonneg_left hwidth hC
    _ < L := by rw [mul_one_div]; exact (div_lt_iff₀ (by linarith)).2 (by nlinarith)

namespace Scene

variable {k : ℕ}

/-- Discarding initial digit groups changes neither prefix translation nor scale. -/
structure Cut (s t : Scene k) : Prop where
  scaleUpper : t.P = s.P
  scaleLower : t.Q = s.Q
  offsetUpper : t.u = s.u
  offsetLower : t.v = s.v
  upperCutoff : s.p ≤ t.p
  lowerCutoff : s.e ≤ t.e
  cylinder : t.upperCylinder ⊆ s.upperCylinder

theorem Cut.refl (s : Scene k) : Cut s s :=
  ⟨rfl, rfl, rfl, rfl, le_rfl, le_rfl, Subset.rfl⟩

theorem Cut.trans {s t u : Scene k} (hst : Cut s t) (htu : Cut t u) : Cut s u :=
  ⟨htu.scaleUpper.trans hst.scaleUpper, htu.scaleLower.trans hst.scaleLower,
    htu.offsetUpper.trans hst.offsetUpper, htu.offsetLower.trans hst.offsetLower,
    hst.upperCutoff.trans htu.upperCutoff, hst.lowerCutoff.trans htu.lowerCutoff,
    htu.cylinder.trans hst.cylinder⟩

theorem Cut.residual_eq {s t : Scene k} (h : Cut s t) (x : ℝ) :
    t.residual x = s.residual x := by
  simp only [residual, h.scaleUpper, h.offsetUpper, h.offsetLower]

/-- Exactly one upper digit is appended, after finitely many group cuts. -/
def UpperMove (s t : Scene k) : Prop := ∃ d : ℕ,
  s.p ≤ d ∧ d ≤ k ∧ t.P = s.P * width d ∧ t.u = s.u + s.P / d ∧
  t.Q = s.Q ∧ t.v = s.v ∧ t.p = 2 ∧ s.e ≤ t.e ∧
  t.upperCylinder ⊆ s.upperCylinder

/-- Exactly one lower digit is appended, after finitely many group cuts. -/
def LowerMove (s t : Scene k) : Prop := ∃ d : ℕ,
  s.e ≤ d ∧ t.Q = s.Q * width d ∧ t.v = s.v + s.Q / d ∧ t.e = k ∧
  t.P = s.P ∧ t.u = s.u ∧ s.p ≤ t.p ∧
  t.upperCylinder ⊆ s.upperCylinder

theorem UpperMove.after_cut {s t u : Scene k} (hst : Cut s t) (htu : UpperMove t u) :
    UpperMove s u := by
  obtain ⟨d, hpd, hdk, hP, hu, hQ, hv, hp, he, hc⟩ := htu
  refine ⟨d, hst.upperCutoff.trans hpd, hdk, ?_, ?_, hQ.trans hst.scaleLower,
    hv.trans hst.offsetLower, hp, hst.lowerCutoff.trans he, hc.trans hst.cylinder⟩
  · simpa [hst.scaleUpper] using hP
  · simpa [hst.scaleUpper, hst.offsetUpper] using hu

theorem LowerMove.after_cut {s t u : Scene k} (hst : Cut s t) (htu : LowerMove t u) :
    LowerMove s u := by
  obtain ⟨d, hed, hQ, hv, he, hP, hu, hp, hc⟩ := htu
  refine ⟨d, hst.lowerCutoff.trans hed, ?_, ?_, he, hP.trans hst.scaleUpper,
    hu.trans hst.offsetUpper, hst.upperCutoff.trans hp, hc.trans hst.cylinder⟩
  · simpa [hst.scaleLower] using hQ
  · simpa [hst.scaleLower, hst.offsetLower] using hv

theorem appendUpper_move (s : Scene k) : UpperMove s s.appendUpper :=
  ⟨s.p, le_rfl, s.p_lt_k.le, rfl, rfl, rfl, rfl, rfl, le_rfl, s.appendUpper_subset⟩

theorem appendLower_move (s : Scene k) : LowerMove s s.appendLower :=
  ⟨s.e, le_rfl, rfl, rfl, rfl, rfl, rfl, le_rfl, Subset.rfl⟩

theorem discardUpper_cut (s : Scene k) (e' : ℕ) (he : s.e ≤ e')
    (hp : s.p + 1 < k) : Cut s (s.discardUpper e' he) := by
  refine ⟨?_, ?_, ?_, ?_, ?_, ?_, s.discardUpper_subset e' he⟩ <;>
    simp [discardUpper, Frame.discardUpper, hp, he]

theorem discardUpper_move (s : Scene k) (e' : ℕ) (he : s.e ≤ e')
    (hp : ¬s.p + 1 < k) : UpperMove s (s.discardUpper e' he) := by
  refine ⟨k, s.p_lt_k.le, le_rfl, ?_, ?_, ?_, ?_, ?_, ?_, s.discardUpper_subset e' he⟩ <;>
    simp [discardUpper, Frame.discardUpper, hp, he]

def raiseLower (s : Scene k) (e' : ℕ) (he : s.e ≤ e') : Scene k where
  toFrame := { s.toFrame with e := e', e_ge_k := s.e_ge_k.trans he }
  u := s.u
  v := s.v

theorem raiseLower_cut (s : Scene k) (e' : ℕ) (he : s.e ≤ e') :
    Cut s (s.raiseLower e' he) :=
  ⟨rfl, rfl, rfl, rfl, le_rfl, he, Subset.rfl⟩

theorem raiseLower_self (s : Scene k) : s.raiseLower s.e le_rfl = s := by
  cases s
  rfl

theorem raiseLower_valid_of_previous (s : Scene k) {x : ℝ} (hx : s.Valid x)
    (d : ℕ) (hed : s.e < d)
    (hg : s.toFrame.upperGap ≤ s.Q * endpoint k * width (d - 1))
    (hz : s.residual x ≤ s.Q / (d - 1 : ℕ)) :
    (s.raiseLower d hed.le).Valid x := by
  have he3 := s.toFrame.e_ge_three
  have hprev3 : 3 ≤ d - 1 := by omega
  have hd1 : 1 ≤ d := by omega
  have ha := endpoint_pos (k := k) (by have := s.toFrame.k_ge_three; omega)
  have hW := sub_pos.mpr (endpoint_lt_one s.toFrame.k_ge_three)
  have hgwidth := lower_branch_ge_previous_gap (k := k)
    (by have := s.toFrame.k_ge_three; omega) hprev3
  rw [Nat.sub_add_cancel hd1] at hgwidth
  have hgwidthQ := mul_le_mul_of_nonneg_left hgwidth s.Q_pos.le
  have hgap := mul_le_mul_of_nonneg_left
    (width_antitone (by omega : 2 ≤ s.e + 1) (by omega : s.e + 1 ≤ d + 1))
    (mul_pos s.Q_pos hW).le
  have hprevGap := mul_le_mul_of_nonneg_left
    (width_antitone (by omega : 2 ≤ s.e + 1) (by omega : s.e + 1 ≤ d))
    (mul_pos s.Q_pos hW).le
  have hid := lower_gap_identity (k := k) (show 2 ≤ d - 1 by omega)
  rw [Nat.sub_add_cancel hd1] at hid
  have hscaled := congrArg (fun a : ℝ => s.Q * a) hid
  change _ ∧ 0 < s.residual x ∧ s.residual x ≤
    s.toFrame.upperWidth + s.Q * branch d (endpoint k)
  refine ⟨⟨?_, ?_⟩, hx.2.1, ?_⟩
  · change s.toFrame.upperGap ≤ s.Q * branch d (endpoint k)
    nlinarith
  · change s.Q * (1 - endpoint k) * width (d + 1) ≤ s.toFrame.upperWidth
    exact hgap.trans hx.1.2
  · have hlink := hx.1.2
    dsimp [Frame.lowerGap] at hlink
    simp only [div_eq_mul_inv, one_mul] at hz hscaled
    nlinarith

/-- The lower-digit cuts stop at a valid state that can append a lower digit
or at a valid state where the upper refinement rule applies. -/
theorem exists_lower_phase (s : Scene k) {x : ℝ} (hx : s.Valid x) :
    ∃ t : Scene k, Cut s t ∧ t.Valid x ∧
      (t.toFrame.lowerRightWidth < t.toFrame.upperGap ∨
        ∃ u : Scene k, LowerMove t u ∧ u.Valid x) := by
  have ha := endpoint_pos (k := k) (by have := s.toFrame.k_ge_three; omega)
  obtain ⟨D, heD, _, hD⟩ := exists_scaled_width_lt (mul_pos s.Q_pos ha).le
    s.toFrame.upperGap_pos s.e
  have hex : ∃ d : ℕ, s.e ≤ d ∧
      (s.Q / d < s.residual x ∨ s.Q * endpoint k * width d < s.toFrame.upperGap) :=
    ⟨D, heD, Or.inr hD⟩
  let d := Nat.find hex
  have hed : s.e ≤ d := (Nat.find_spec hex).1
  have hstop := (Nat.find_spec hex).2
  let t := s.raiseLower d hed
  have ht : t.Valid x := by
    by_cases hd : d = s.e
    · simpa [t, hd, raiseLower_self] using hx
    · have hed' : s.e < d := by omega
      have hpred : s.e ≤ d - 1 := by omega
      have hmin := Nat.find_min hex (show d - 1 < Nat.find hex by
        have := s.toFrame.e_ge_three
        dsimp [d] at *
        omega)
      have hz : s.residual x ≤ s.Q / (d - 1 : ℕ) :=
        le_of_not_gt fun h => hmin ⟨hpred, Or.inl h⟩
      have hg : s.toFrame.upperGap ≤ s.Q * endpoint k * width (d - 1) :=
        le_of_not_gt fun h => hmin ⟨hpred, Or.inr h⟩
      exact s.raiseLower_valid_of_previous hx d hed' hg hz
  refine ⟨t, s.raiseLower_cut d hed, ht, ?_⟩
  by_cases hchoose : t.toFrame.upperGap ≤ t.toFrame.lowerRightWidth
  · right
    have hbranch : t.Q / t.e < t.residual x := by
      rcases hstop with h | h
      · exact h
      · have hc : s.toFrame.upperGap ≤ s.Q * endpoint k * width d := hchoose
        exact False.elim (not_lt_of_ge hc h)
    exact ⟨t.appendLower, t.appendLower_move, t.appendLower_valid ht hchoose hbranch⟩
  · exact Or.inl (lt_of_not_ge hchoose)

/-- Every linked positive state admits a finite valid refinement that appends
one digit on one of the two sides. No infinite or zero-tail conclusion is used. -/
theorem exists_move (s : Scene k) {x : ℝ} (hx : s.Valid x) :
    ∃ t : Scene k, t.Valid x ∧ (UpperMove s t ∨ LowerMove s t) := by
  suffices h : ∀ n : ℕ, ∀ s : Scene k, k - s.p ≤ n → s.Valid x →
      ∃ t : Scene k, t.Valid x ∧ (UpperMove s t ∨ LowerMove s t) from
    h (k - s.p) s le_rfl hx
  intro n
  induction n with
  | zero =>
    intro s hn _
    have := s.p_lt_k
    omega
  | succ n ih =>
    intro s hn hx
    obtain ⟨t, hst, ht, hphase⟩ := s.exists_lower_phase hx
    rcases hphase with hchoose | ⟨u, hmove, hu⟩
    · by_cases hbranch : t.toFrame.upperLeftWidth + t.toFrame.upperGap < t.residual x
      · exact ⟨t.appendUpper, t.appendUpper_valid ht hchoose hbranch,
          Or.inl (UpperMove.after_cut hst t.appendUpper_move)⟩
      · obtain ⟨e', he, hu⟩ := t.exists_discardUpper_valid ht (le_of_not_gt hbranch)
        by_cases hp : t.p + 1 < k
        · have hcut := hst.trans (t.discardUpper_cut e' he hp)
          have hpnext : (t.discardUpper e' he).p = t.p + 1 := by
            simp [discardUpper, Frame.discardUpper, hp]
          have hn' : k - (t.discardUpper e' he).p ≤ n := by
            rw [hpnext]
            have := hst.upperCutoff
            have := t.p_lt_k
            omega
          obtain ⟨v, hv, hmove⟩ := ih _ hn' hu
          refine ⟨v, hv, ?_⟩
          rcases hmove with hmove | hmove
          · exact Or.inl (UpperMove.after_cut hcut hmove)
          · exact Or.inr (LowerMove.after_cut hcut hmove)
        · exact ⟨t.discardUpper e' he, hu,
            Or.inl (UpperMove.after_cut hst (t.discardUpper_move e' he hp))⟩
    · exact ⟨u, hu, Or.inr (LowerMove.after_cut hst hmove)⟩

end Scene

end
end GravgaardLeeUpperLower
