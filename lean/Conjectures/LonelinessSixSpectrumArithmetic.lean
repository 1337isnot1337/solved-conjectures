import Conjectures.LonelinessSixSpectrumRealization
import Mathlib.Data.Nat.GCD.Basic

/-! Reduced fractions in the proposed six-speed spectrum.  The denominator
condition in the note is necessary; the two reduced families below give the
exact arithmetic characterization.  The realization results are unconditional.
Classification of arbitrary six-speed lists remains a separate obligation. -/

namespace Loneliness.SixSpectrumArithmetic

private theorem reduced_fraction_unique (a q c d : ℕ)
    (hq : 0 < q) (hd : 0 < d)
    (haq : Nat.Coprime a q) (hcd : Nat.Coprime c d)
    (heq : (a : ℝ) / q = (c : ℝ) / d) : a = c ∧ q = d := by
  have hcrossR : (a : ℝ) * d = (c : ℝ) * q :=
    (div_eq_div_iff (by positivity) (by positivity)).mp heq
  have hcross : a * d = c * q := by exact_mod_cast hcrossR
  have hqd : q ∣ d := by
    apply haq.symm.dvd_mul_left.mp
    exact ⟨c, by nlinarith [hcross]⟩
  have hdq : d ∣ q := by
    apply hcd.symm.dvd_mul_left.mp
    exact ⟨a, by nlinarith [hcross]⟩
  have hden : q = d := Nat.dvd_antisymm hqd hdq
  subst d
  exact ⟨mul_right_cancel₀ (Nat.ne_of_gt hq) hcross, rfl⟩

theorem first_family_coprime (s : ℕ) : Nat.Coprime s (6 * s + 1) := by
  exact (Nat.coprime_mul_right_add_right s 1 6).2 (Nat.coprime_one_right s)

theorem second_family_coprime (s : ℕ) :
    Nat.Coprime (3 * s + 5) (18 * s + 33) := by
  have hthree : Nat.Coprime (3 * s + 5) 3 :=
    (Nat.coprime_mul_left_add_left 5 3 s).2 (by decide)
  rw [show 18 * s + 33 = 6 * (3 * s + 5) + 3 by omega]
  exact (Nat.coprime_mul_right_add_right (3 * s + 5) 3 6).2 hthree

theorem first_family_value (s : ℕ) :
    (((6 * s + 1 : ℕ) : ℝ) - 1) / (6 * ((6 * s + 1 : ℕ) : ℝ)) =
      (s : ℝ) / ((6 * s + 1 : ℕ) : ℝ) := by
  have hd : ((6 * s + 1 : ℕ) : ℝ) ≠ 0 := by positivity
  apply (div_eq_div_iff (mul_ne_zero (by norm_num) hd) hd).2
  norm_num only [Nat.cast_add, Nat.cast_mul, Nat.cast_ofNat]
  ring

theorem second_family_value (s : ℕ) :
    (((6 * s + 11 : ℕ) : ℝ) - 1) / (6 * ((6 * s + 11 : ℕ) : ℝ)) =
      ((3 * s + 5 : ℕ) : ℝ) / ((18 * s + 33 : ℕ) : ℝ) := by
  have hleft : 6 * ((6 * s + 11 : ℕ) : ℝ) ≠ 0 := by positivity
  have hright : ((18 * s + 33 : ℕ) : ℝ) ≠ 0 := by positivity
  apply (div_eq_div_iff hleft hright).2
  norm_num only [Nat.cast_add, Nat.cast_mul, Nat.cast_ofNat]
  ring

/-- Exact reduced forms; the second family starts with `5/33`. -/
theorem parameter_iff_reduced_families (a q : ℕ)
    (hq : 0 < q) (hcoprime : Nat.Coprime a q) :
    (∃ P : ℕ, 7 ≤ P ∧ (P % 6 = 1 ∨ P % 6 = 5) ∧
      (a : ℝ) / q = ((P : ℝ) - 1) / (6 * (P : ℝ))) ↔
    (1 ≤ a ∧ q = 6 * a + 1) ∨
      ∃ s : ℕ, a = 3 * s + 5 ∧ q = 18 * s + 33 := by
  constructor
  · rintro ⟨P, hP, hmod, hvalue⟩
    rcases hmod with hmod | hmod
    · let s := P / 6
      have hPs : P = 6 * s + 1 := by dsimp [s]; omega
      have hs : 1 ≤ s := by omega
      have hvalue' : (a : ℝ) / q = (s : ℝ) / ((6 * s + 1 : ℕ) : ℝ) := by
        rw [hPs] at hvalue
        exact hvalue.trans (first_family_value s)
      obtain ⟨ha, hq'⟩ := reduced_fraction_unique a q s (6 * s + 1)
        hq (by omega) hcoprime (first_family_coprime s) hvalue'
      exact Or.inl ⟨by omega, by omega⟩
    · let s := P / 6 - 1
      have hPs : P = 6 * s + 11 := by dsimp [s]; omega
      have hvalue' : (a : ℝ) / q =
          ((3 * s + 5 : ℕ) : ℝ) / ((18 * s + 33 : ℕ) : ℝ) := by
        rw [hPs] at hvalue
        exact hvalue.trans (second_family_value s)
      obtain ⟨ha, hq'⟩ := reduced_fraction_unique a q (3 * s + 5) (18 * s + 33)
        hq (by omega) hcoprime (second_family_coprime s) hvalue'
      exact Or.inr ⟨s, ha, hq'⟩
  · intro h
    rcases h with ⟨ha, hq'⟩ | ⟨s, ha, hq'⟩
    · refine ⟨6 * a + 1, by omega, Or.inl (by omega), ?_⟩
      rw [hq']
      exact (first_family_value a).symm
    · refine ⟨6 * s + 11, by omega, Or.inr (by omega), ?_⟩
      rw [ha, hq']
      exact (second_family_value s).symm

/-- The reduced denominator is odd, and exceeds six times the numerator by
exactly one or three, as asserted in the six-speed note. -/
theorem reduced_denominator_restrictions (a q P : ℕ)
    (hq : 0 < q) (hcoprime : Nat.Coprime a q) (hP : 7 ≤ P)
    (hmod : P % 6 = 1 ∨ P % 6 = 5)
    (hvalue : (a : ℝ) / q = ((P : ℝ) - 1) / (6 * (P : ℝ))) :
    Odd q ∧ (q - 6 * a = 1 ∨ q - 6 * a = 3) := by
  have h := (parameter_iff_reduced_families a q hq hcoprime).mp
    ⟨P, hP, hmod, hvalue⟩
  rcases h with ⟨ha, hq'⟩ | ⟨s, ha, hq'⟩
  · exact ⟨⟨3 * a, by omega⟩, Or.inl (by omega)⟩
  · exact ⟨⟨9 * s + 16, by omega⟩, Or.inr (by omega)⟩

/-- Every member of either reduced family is the exact value of six distinct,
positive, primitive integer speeds. No classification hypothesis is used. -/
theorem reduced_families_realized (a q : ℕ)
    (h : (1 ≤ a ∧ q = 6 * a + 1) ∨
      ∃ s : ℕ, a = 3 * s + 5 ∧ q = 18 * s + 33) :
    ∃ ds : List ℕ, ds.length = 6 ∧ ds.Nodup ∧ (∀ d ∈ ds, 0 < d) ∧
      ds.foldr Nat.gcd 0 = 1 ∧ value ds = (a : ℝ) / q ∧ value ds < 1 / 6 := by
  have hq : 0 < q := by
    rcases h with ⟨ha, hq'⟩ | ⟨s, ha, hq'⟩ <;> omega
  have hcoprime : Nat.Coprime a q := by
    rcases h with ⟨ha, hq'⟩ | ⟨s, ha, hq'⟩
    · rw [hq']
      exact first_family_coprime a
    · rw [ha, hq']
      exact second_family_coprime s
  obtain ⟨P, hP, hmod, hvalue⟩ :=
    (parameter_iff_reduced_families a q hq hcoprime).mpr h
  obtain ⟨ds, hlen, hdistinct, hpositive, hprimitive, hds, hbelow⟩ :=
    SixSpectrumRealization.realizes P hP hmod
  exact ⟨ds, hlen, hdistinct, hpositive, hprimitive, hds.trans hvalue.symm, hbelow⟩

/-- Odd denominator and gap one or three alone do not characterize the
proposed spectrum, even between one seventh and one sixth. -/
theorem denominator_conditions_not_sufficient :
    Odd (27 : ℕ) ∧ 27 - 6 * (4 : ℕ) = 3 ∧
      (1 / 7 : ℝ) ≤ 4 / 27 ∧ (4 / 27 : ℝ) < 1 / 6 ∧
      ¬∃ P : ℕ, 7 ≤ P ∧ (P % 6 = 1 ∨ P % 6 = 5) ∧
        (4 : ℝ) / 27 = ((P : ℝ) - 1) / (6 * (P : ℝ)) := by
  refine ⟨by decide, by decide, by norm_num, by norm_num, ?_⟩
  intro h
  have hf := (parameter_iff_reduced_families 4 27 (by decide) (by decide)).mp h
  rcases hf with ⟨ha, hq⟩ | ⟨s, ha, hq⟩ <;> omega

end Loneliness.SixSpectrumArithmetic
