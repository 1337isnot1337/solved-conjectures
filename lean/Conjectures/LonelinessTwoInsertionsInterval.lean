import Conjectures.LonelinessRational

/-! Literal interval certificates for two unrestricted added speeds.
The second speed is unbounded: an interval of width at least `2*δ/v`
always contains a point whose `v`-phase has distance at least `δ`.
No sampled-time maximum is used. -/

namespace Loneliness.TwoInsertions

noncomputable section

def window (p : ℕ) : Set ℝ := Set.Icc (1 / (p + 2 : ℝ)) (1 / (p : ℝ))

def TwoSpeedWindow (p b c : ℕ) : Prop :=
  ∃ t ∈ window p,
    1 / (p + 2 : ℝ) ≤ distance ((b : ℝ) * t) ∧
    1 / (p + 2 : ℝ) ≤ distance ((c : ℝ) * t)

theorem exists_good_on_interval (v a b δ : ℝ) (hv : 0 < v)
    (hδ : 0 ≤ δ) (hhalf : δ ≤ 1 / 2) (hwidth : 2*δ/v ≤ b-a) :
    ∃ t ∈ Set.Icc a b, δ ≤ distance (v*t) := by
  have hab : a ≤ b := by
    have hn : 0 ≤ 2*δ/v := by positivity
    linarith
  by_cases hgood : δ ≤ distance (v*a)
  · exact ⟨a, ⟨le_rfl, hab⟩, hgood⟩
  · have hbad : |v*a - (round (v*a) : ℝ)| < δ := lt_of_not_ge hgood
    obtain ⟨hl, hu⟩ := abs_lt.mp hbad
    let z : ℤ := round (v*a)
    let t : ℝ := ((z : ℝ)+δ)/v
    have hscaled : 2*δ ≤ (b-a)*v := (div_le_iff₀ hv).mp hwidth
    have hvt : v*t = (z : ℝ)+δ := by
      dsimp [t]
      field_simp [ne_of_gt hv]
    refine ⟨t, ⟨?_, ?_⟩, ?_⟩
    · apply (le_div_iff₀ hv).mpr
      dsimp [z]
      nlinarith
    · apply (div_le_iff₀ hv).mpr
      dsimp [z]
      nlinarith
    · apply distance_lower_of_cell (k := z)
      · rw [hvt]
        linarith
      · rw [hvt]
        linarith

theorem twoSpeedWindow_symm {p b c : ℕ} (h : TwoSpeedWindow p b c) :
    TwoSpeedWindow p c b := by
  obtain ⟨t, ht, hb, hc⟩ := h
  exact ⟨t, ht, hc, hb⟩

end

structure IntervalCertificate where
  left : ℚ
  right : ℚ
  shift : ℤ
  cutoff : ℕ
  deriving DecidableEq, Repr

def IntervalCertificate.Valid (p b : ℕ) (a : IntervalCertificate) : Prop :=
  1 / (p + 2 : ℚ) ≤ a.left ∧ a.left ≤ a.right ∧
  a.right ≤ 1 / (p : ℚ) ∧
  1 / (p + 2 : ℚ) ≤ (b : ℚ)*a.left-a.shift ∧
  (b : ℚ)*a.right-a.shift ≤ 1-1/(p+2 : ℚ) ∧
  0 < a.cutoff ∧ 2 ≤ (p+2 : ℚ)*a.cutoff*(a.right-a.left)

instance (p b : ℕ) (a : IntervalCertificate) : Decidable (a.Valid p b) :=
  inferInstanceAs (Decidable (_ ∧ _ ∧ _ ∧ _ ∧ _ ∧ _ ∧ _))

theorem IntervalCertificate.good {p b : ℕ} {a : IntervalCertificate}
    (h : a.Valid p b) {t : ℝ} (ht : t ∈ Set.Icc (a.left : ℝ) a.right) :
    1/(p+2 : ℝ) ≤ distance ((b : ℝ)*t) := by
  have hb : (0 : ℝ) ≤ b := Nat.cast_nonneg b
  have hl : 1/(p+2 : ℝ) ≤ (b : ℝ)*(a.left : ℝ)-a.shift := by
    simpa only [Rat.cast_div, Rat.cast_add, Rat.cast_one, Rat.cast_ofNat,
      Rat.cast_natCast, Rat.cast_mul, Rat.cast_sub, Rat.cast_intCast] using
      (Rat.cast_le (K := ℝ)).mpr h.2.2.2.1
  have hu : (b : ℝ)*(a.right : ℝ)-a.shift ≤ 1-1/(p+2 : ℝ) := by
    simpa only [Rat.cast_div, Rat.cast_add, Rat.cast_one, Rat.cast_ofNat,
      Rat.cast_natCast, Rat.cast_mul, Rat.cast_sub, Rat.cast_intCast] using
      (Rat.cast_le (K := ℝ)).mpr h.2.2.2.2.1
  apply distance_lower_of_cell (k := a.shift)
  · nlinarith [mul_le_mul_of_nonneg_left ht.1 hb]
  · nlinarith [mul_le_mul_of_nonneg_left ht.2 hb]

theorem IntervalCertificate.unbounded_second {p b c : ℕ} {a : IntervalCertificate}
    (hp : 3 ≤ p) (h : a.Valid p b) (hc : a.cutoff ≤ c) : TwoSpeedWindow p b c := by
  have hcpos : 0 < c := lt_of_lt_of_le h.2.2.2.2.2.1 hc
  have hcr : (0 : ℝ) < c := by exact_mod_cast hcpos
  have hq : (0 : ℝ) < p+2 := by positivity
  have hq2 : (2 : ℝ) ≤ p+2 := by
    have hp0 : (0 : ℝ) ≤ p := Nat.cast_nonneg p
    linarith
  have hwidth : 2*(1/(p+2 : ℝ))/(c : ℝ) ≤ (a.right : ℝ)-a.left := by
    have hscale : (2 : ℝ) ≤ (p+2 : ℝ)*(a.cutoff : ℝ)*
        ((a.right : ℝ)-(a.left : ℝ)) := by exact_mod_cast h.2.2.2.2.2.2
    have hnonneg : (0 : ℝ) ≤ (a.right : ℝ)-a.left := by
      exact_mod_cast sub_nonneg.mpr h.2.1
    have hcut : (a.cutoff : ℝ) ≤ c := by exact_mod_cast hc
    have hbound := mul_le_mul_of_nonneg_right
      (mul_le_mul_of_nonneg_left hcut hq.le) hnonneg
    apply (div_le_iff₀ hcr).mpr
    have hdiv : 2/(p+2 : ℝ) ≤ ((a.right : ℝ)-a.left)*(c : ℝ) :=
      (div_le_iff₀ hq).mpr (by nlinarith)
    simpa only [one_div, div_eq_mul_inv, one_mul] using hdiv
  obtain ⟨t, ht, hct⟩ := exists_good_on_interval (c : ℝ) a.left a.right
    (1/(p+2 : ℝ)) hcr (by positivity)
    ((one_div_le_one_div_of_le (by norm_num) hq2)) hwidth
  refine ⟨t, ⟨?_, ?_⟩, IntervalCertificate.good h ht, hct⟩
  · have hl : 1/(p+2 : ℝ) ≤ (a.left : ℝ) := by
      simpa only [Rat.cast_div, Rat.cast_add, Rat.cast_one, Rat.cast_ofNat,
        Rat.cast_natCast] using (Rat.cast_le (K := ℝ)).mpr h.1
    exact hl.trans ht.1
  · have hu : (a.right : ℝ) ≤ 1/(p : ℝ) := by
      simpa only [Rat.cast_div, Rat.cast_one, Rat.cast_natCast] using
        (Rat.cast_le (K := ℝ)).mpr h.2.2.1
    exact ht.2.trans hu

structure PairCertificate where
  time : ℚ
  firstShift : ℤ
  secondShift : ℤ
  deriving DecidableEq, Repr

def PairCertificate.Valid (p b c : ℕ) (a : PairCertificate) : Prop :=
  1/(p+2 : ℚ) ≤ a.time ∧ a.time ≤ 1/(p : ℚ) ∧
  LowerCertificate [b,c] (1/(p+2 : ℚ)) a.time [a.firstShift,a.secondShift]

instance (p b c : ℕ) (a : PairCertificate) : Decidable (a.Valid p b c) :=
  inferInstanceAs (Decidable (_ ∧ _ ∧ _))

theorem PairCertificate.sound {p b c : ℕ} {a : PairCertificate}
    (h : a.Valid p b c) : TwoSpeedWindow p b c := by
  refine ⟨a.time, ⟨?_, ?_⟩, ?_, ?_⟩
  · simpa only [Rat.cast_div, Rat.cast_add, Rat.cast_one, Rat.cast_ofNat,
      Rat.cast_natCast] using (Rat.cast_le (K := ℝ)).mpr h.1
  · simpa only [Rat.cast_div, Rat.cast_one, Rat.cast_natCast] using
      (Rat.cast_le (K := ℝ)).mpr h.2.1
  · have hgood := lowerCertificate_sound h.2.2 b (by simp)
    simpa only [Rat.cast_div, Rat.cast_add, Rat.cast_one, Rat.cast_ofNat,
      Rat.cast_natCast] using hgood
  · have hgood := lowerCertificate_sound h.2.2 c (by simp)
    simpa only [Rat.cast_div, Rat.cast_add, Rat.cast_one, Rat.cast_ofNat,
      Rat.cast_natCast] using hgood

end Loneliness.TwoInsertions
