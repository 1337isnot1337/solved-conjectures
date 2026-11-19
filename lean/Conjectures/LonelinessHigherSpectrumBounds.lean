import Conjectures.LonelinessSevenSpectrumRealization
import Conjectures.LonelinessEightSpectrumRealization
import Conjectures.LonelinessHigherExamplesEight
import Conjectures.LonelinessExceptionalEightFamilyCertificates
import Conjectures.LonelinessNormalization
import Mathlib.Data.Nat.GCD.Basic

/-! Exact spectra and sharp denominator bounds on all stated seven- and
eight-speed families and sporadics. Membership in these candidate sets is
explicit; exhaustive classification of arbitrary tuples is separate.
The speed inequalities hold for every positive-denominator representation
of the value, and therefore hold in particular for its reduced fraction. -/

namespace Loneliness.HigherSpectrumBounds

structure Row where
  speeds : List ℕ
  numerator : ℕ
  denominator : ℕ
  deriving DecidableEq

def sevenRows : List Row := [
  ⟨[1, 2, 3, 4, 5, 7, 12], 1, 8⟩,
  ⟨[1, 2, 3, 4, 5, 7, 18], 3, 23⟩,
  ⟨[1, 2, 3, 4, 5, 7, 24], 4, 29⟩,
  ⟨[1, 2, 5, 6, 7, 8, 39], 3, 22⟩,
  ⟨[1, 3, 4, 5, 6, 7, 11], 2, 15⟩,
  ⟨[1, 3, 4, 5, 6, 9, 28], 4, 29⟩,
  ⟨[1, 3, 4, 5, 7, 11, 12], 2, 15⟩,
  ⟨[1, 3, 4, 5, 7, 11, 18], 2, 15⟩,
  ⟨[1, 3, 4, 5, 7, 11, 24], 2, 15⟩,
  ⟨[1, 3, 4, 5, 7, 11, 30], 5, 37⟩,
  ⟨[1, 3, 4, 5, 7, 11, 36], 6, 43⟩,
  ⟨[1, 3, 4, 5, 7, 13, 18], 3, 23⟩,
  ⟨[1, 3, 4, 5, 7, 24, 71], 11, 78⟩,
  ⟨[1, 3, 4, 5, 13, 14, 18], 2, 15⟩,
  ⟨[1, 4, 5, 6, 7, 10, 11], 2, 15⟩,
  ⟨[1, 4, 5, 6, 7, 11, 13], 1, 8⟩,
  ⟨[1, 4, 5, 6, 7, 11, 16], 2, 15⟩,
  ⟨[1, 4, 5, 6, 7, 11, 23], 4, 29⟩,
  ⟨[1, 4, 5, 6, 7, 11, 26], 2, 15⟩,
  ⟨[1, 4, 5, 6, 7, 11, 29], 5, 36⟩,
  ⟨[1, 4, 5, 6, 7, 11, 39], 2, 15⟩,
  ⟨[1, 4, 5, 6, 7, 11, 52], 4, 29⟩,
  ⟨[1, 4, 5, 6, 7, 11, 65], 10, 71⟩,
  ⟨[1, 5, 6, 11, 16, 17, 112], 16, 113⟩,
  ⟨[2, 6, 7, 8, 10, 13, 14], 2, 15⟩,
  ⟨[2, 7, 9, 11, 12, 13, 20], 4, 29⟩,
  ⟨[2, 7, 9, 11, 13, 20, 54], 9, 65⟩]

def eightRows : List Row := [
  ⟨[1, 2, 3, 4, 5, 7, 18, 40], 5, 41⟩,
  ⟨[1, 2, 3, 4, 5, 7, 18, 80], 10, 81⟩,
  ⟨[1, 2, 5, 6, 7, 8, 11, 13], 2, 17⟩,
  ⟨[1, 3, 4, 5, 6, 7, 11, 32], 4, 33⟩,
  ⟨[1, 3, 4, 5, 7, 11, 12, 32], 4, 33⟩,
  ⟨[1, 3, 4, 5, 7, 11, 13, 24], 3, 25⟩,
  ⟨[1, 3, 4, 5, 7, 11, 18, 32], 4, 33⟩,
  ⟨[1, 3, 4, 5, 7, 11, 24, 62], 9, 73⟩,
  ⟨[1, 3, 4, 5, 7, 11, 30, 56], 7, 57⟩,
  ⟨[1, 3, 4, 5, 7, 13, 18, 40], 5, 41⟩,
  ⟨[1, 3, 4, 5, 7, 13, 24, 29], 3, 25⟩,
  ⟨[1, 4, 5, 6, 7, 10, 11, 32], 4, 33⟩,
  ⟨[1, 4, 5, 6, 7, 11, 23, 32], 4, 33⟩,
  ⟨[1, 4, 5, 6, 7, 11, 26, 32], 4, 33⟩,
  ⟨[1, 4, 5, 6, 7, 11, 32, 36], 4, 33⟩,
  ⟨[1, 5, 6, 7, 8, 11, 13, 19], 3, 25⟩,
  ⟨[1, 5, 6, 7, 8, 11, 13, 21], 2, 17⟩]

theorem seven_row_values (row : Row) (hr : row ∈ sevenRows) :
    value row.speeds = (row.numerator : ℝ) / (row.denominator : ℝ) := by
  simp only [sevenRows, List.mem_cons, List.mem_singleton] at hr
  rcases hr with rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl
  · exact HigherExamples.seven_01_value
  · exact HigherExamples.seven_02_value
  · exact HigherExamples.seven_03_value
  · exact HigherExamples.seven_04_value
  · exact HigherExamples.seven_05_value
  · exact HigherExamples.seven_06_value
  · exact HigherExamples.seven_07_value
  · exact HigherExamples.seven_08_value
  · exact HigherExamples.seven_09_value
  · exact HigherExamples.seven_10_value
  · exact HigherExamples.seven_11_value
  · exact HigherExamples.seven_12_value
  · exact HigherExamples.seven_13_value
  · exact HigherExamples.seven_14_value
  · exact HigherExamples.seven_15_value
  · exact HigherExamples.seven_16_value
  · exact HigherExamples.seven_17_value
  · exact HigherExamples.seven_18_value
  · exact HigherExamples.seven_19_value
  · exact HigherExamples.seven_20_value
  · exact HigherExamples.seven_21_value
  · exact HigherExamples.seven_22_value
  · exact HigherExamples.seven_23_value
  · exact HigherExamples.seven_24_value
  · exact HigherExamples.seven_25_value
  · exact HigherExamples.seven_26_value
  · exact HigherExamples.seven_27_value

theorem eight_row_values (row : Row) (hr : row ∈ eightRows) :
    value row.speeds = (row.numerator : ℝ) / (row.denominator : ℝ) := by
  simp only [eightRows, List.mem_cons, List.mem_singleton] at hr
  rcases hr with rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl
  · exact HigherExamples.eight_01_value
  · exact HigherExamples.eight_02_value
  · exact HigherExamples.eight_03_value
  · exact HigherExamples.eight_04_value
  · exact HigherExamples.eight_05_value
  · exact HigherExamples.eight_06_value
  · exact HigherExamples.eight_07_value
  · exact HigherExamples.eight_08_value
  · exact HigherExamples.eight_09_value
  · exact HigherExamples.eight_10_value
  · exact HigherExamples.eight_11_value
  · exact HigherExamples.eight_12_value
  · exact HigherExamples.eight_13_value
  · exact HigherExamples.eight_14_value
  · exact HigherExamples.eight_15_value
  · exact HigherExamples.eight_16_value
  · exact HigherExamples.eight_17_value

theorem seven_row_arithmetic : ∀ row ∈ sevenRows,
    0 < row.denominator ∧ Nat.Coprime row.numerator row.denominator ∧
    (∀ d ∈ row.speeds, 5 * d ≤ 13 * row.denominator) ∧
    1 ≤ row.numerator ∧
    (row.denominator = 7 * row.numerator + 1 ∨
      (row.numerator = 3 ∧ row.denominator = 23) ∨
      (row.numerator = 5 ∧ row.denominator = 37) ∨
      (row.numerator = 9 ∧ row.denominator = 65)) := by
  decide +kernel

theorem eight_row_arithmetic : ∀ row ∈ eightRows,
    0 < row.denominator ∧ Nat.Coprime row.numerator row.denominator ∧
    (∀ d ∈ row.speeds, 17 * d ≤ 21 * row.denominator) ∧
    1 ≤ row.numerator ∧ row.denominator = 8 * row.numerator + 1 := by
  decide +kernel

def KnownSeven (ds : List ℕ) : Prop :=
  (∃ s : ℕ, 1 ≤ s ∧ ds.Perm [1, 2, 3, 4, 5, 6, 7 * s]) ∨
    ∃ row ∈ sevenRows, ds.Perm row.speeds

def KnownEight (ds : List ℕ) : Prop :=
  (∃ s : ℕ, 1 ≤ s ∧
    (ds.Perm [1, 2, 3, 4, 5, 6, 7, 8 * s] ∨
      ds.Perm [1, 2, 3, 4, 5, 7, 12, 8 * s] ∨
      ds.Perm [1, 4, 5, 6, 7, 11, 13, 8 * s])) ∨
    ∃ row ∈ eightRows, ds.Perm row.speeds

theorem denominator_dvd {p q a b : ℕ} (hq : 0 < q) (hb : 0 < b)
    (hab : Nat.Coprime a b) (h : (p : ℝ) / q = (a : ℝ) / b) : b ∣ q := by
  have hqR : (q : ℝ) ≠ 0 := by exact_mod_cast (Nat.ne_of_gt hq)
  have hbR : (b : ℝ) ≠ 0 := by exact_mod_cast (Nat.ne_of_gt hb)
  have hcrossR : (p : ℝ) * b = (a : ℝ) * q := (div_eq_div_iff hqR hbR).mp h
  have hcross : p * b = a * q := by exact_mod_cast hcrossR
  apply hab.symm.dvd_of_dvd_mul_left
  rw [← hcross]
  exact ⟨p, Nat.mul_comm _ _⟩

theorem denominator_le {p q a b : ℕ} (hq : 0 < q) (hb : 0 < b)
    (hab : Nat.Coprime a b) (h : (p : ℝ) / q = (a : ℝ) / b) : b ≤ q :=
  Nat.le_of_dvd hq (denominator_dvd hq hb hab h)

theorem reduced_fraction_unique {p q a b : ℕ} (hq : 0 < q) (hb : 0 < b)
    (hpq : Nat.Coprime p q) (hab : Nat.Coprime a b)
    (h : (p : ℝ) / q = (a : ℝ) / b) : p = a ∧ q = b := by
  have heq : q = b := Nat.dvd_antisymm
    (denominator_dvd hb hq hpq h.symm) (denominator_dvd hq hb hab h)
  subst q
  have hbR : (b : ℝ) ≠ 0 := by exact_mod_cast (Nat.ne_of_gt hb)
  have hnum := congrArg (fun x : ℝ => x * (b : ℝ)) h
  simp only [div_mul_cancel₀ _ hbR] at hnum
  exact ⟨by exact_mod_cast hnum, rfl⟩

theorem consecutive_denominator_bound (n s p q : ℕ)
    (hn : 2 ≤ n) (hnmax : n ≤ 14) (hs : 1 ≤ s) (hq : 0 < q)
    (hvalue : value (ConsecutiveFamily.speeds n s) = (p : ℝ) / q) :
    ∀ d ∈ ConsecutiveFamily.speeds n s, d < q := by
  have hcop : Nat.Coprime s (n * s + 1) :=
    (Nat.coprime_mul_right_add_right s 1 n).2 (by simp)
  have hfrac : (p : ℝ) / q = (s : ℝ) / ((n * s + 1 : ℕ) : ℝ) := by
    simpa only [Nat.cast_add, Nat.cast_mul, Nat.cast_one] using
      hvalue.symm.trans (ConsecutiveFamily.family_value n s hn hnmax hs)
  have hden := denominator_le hq (by omega : 0 < n * s + 1) hcop hfrac
  have hns : n ≤ n * s := by nlinarith
  intro d hd
  rcases (ConsecutiveFamily.mem_speeds (by omega : 1 ≤ n)).mp hd with hd | rfl
  · omega
  · omega

theorem exceptional_denominator_bound (W : List ℕ) (s p q : ℕ)
    (hs : 1 ≤ s) (hW : ∀ d ∈ W, d ≤ 13) (hq : 0 < q)
    (hvalue : value (W ++ [8 * s]) = (p : ℝ) / q)
    (hformula : value (W ++ [8 * s]) =
      if s = 1 then (2 / 17 : ℝ) else (s : ℝ) / (8 * (s : ℝ) + 1)) :
    ∀ d ∈ W ++ [8 * s], d < q := by
  by_cases hsone : s = 1
  · subst s
    have hfrac : (p : ℝ) / q = (2 : ℝ) / 17 := by
      simpa using hvalue.symm.trans hformula
    have hden := denominator_le hq (by decide : 0 < 17) (by decide : Nat.Coprime 2 17) hfrac
    intro d hd
    rcases List.mem_append.mp hd with hd | hd
    · have hdle := hW d hd
      omega
    · simp only [List.mem_singleton] at hd
      omega
  · have hcop : Nat.Coprime s (8 * s + 1) :=
      (Nat.coprime_mul_right_add_right s 1 8).2 (by simp)
    have hfrac : (p : ℝ) / q = (s : ℝ) / ((8 * s + 1 : ℕ) : ℝ) := by
      simpa only [hsone, ite_eq_right, Nat.cast_add, Nat.cast_mul, Nat.cast_ofNat,
        Nat.cast_one] using hvalue.symm.trans hformula
    have hden := denominator_le hq (by omega : 0 < 8 * s + 1) hcop hfrac
    intro d hd
    rcases List.mem_append.mp hd with hd | hd
    · have hdle := hW d hd
      omega
    · simp only [List.mem_singleton] at hd
      omega

theorem seven_speed_bound (ds : List ℕ) (hknown : KnownSeven ds)
    (p q : ℕ) (hq : 0 < q) (hvalue : value ds = (p : ℝ) / q) :
    ∀ d ∈ ds, 5 * d ≤ 13 * q := by
  rcases hknown with ⟨s, hs, hperm⟩ | ⟨row, hr, hperm⟩
  · have hbase := (CriticalFamilies.value_perm hperm).symm.trans hvalue
    have hbound := consecutive_denominator_bound 7 s p q (by decide) (by decide) hs hq
      (by simpa [ConsecutiveFamily.speeds, List.range'_succ] using hbase)
    intro d hd
    have hd' : d ∈ ConsecutiveFamily.speeds 7 s := by
      simpa [ConsecutiveFamily.speeds, List.range'_succ] using hperm.mem_iff.mp hd
    have hlt := hbound d hd'
    omega
  · obtain ⟨hb, hcop, hbound, _⟩ := seven_row_arithmetic row hr
    have hfrac := hvalue.symm.trans
      ((CriticalFamilies.value_perm hperm).trans (seven_row_values row hr))
    have hden := denominator_le hq hb hcop hfrac
    intro d hd
    have hd' := hbound d (hperm.mem_iff.mp hd)
    omega

theorem eight_speed_bound (ds : List ℕ) (hknown : KnownEight ds)
    (p q : ℕ) (hq : 0 < q) (hvalue : value ds = (p : ℝ) / q) :
    ∀ d ∈ ds, 17 * d ≤ 21 * q := by
  rcases hknown with ⟨s, hs, hperm | hperm | hperm⟩ | ⟨row, hr, hperm⟩
  · have hbase := (CriticalFamilies.value_perm hperm).symm.trans hvalue
    have hbound := consecutive_denominator_bound 8 s p q (by decide) (by decide) hs hq
      (by simpa [ConsecutiveFamily.speeds, List.range'_succ] using hbase)
    intro d hd
    have hd' : d ∈ ConsecutiveFamily.speeds 8 s := by
      simpa [ConsecutiveFamily.speeds, List.range'_succ] using hperm.mem_iff.mp hd
    have hlt := hbound d hd'
    omega
  · have hbase := (CriticalFamilies.value_perm hperm).symm.trans hvalue
    have hbound := exceptional_denominator_bound [1, 2, 3, 4, 5, 7, 12] s p q hs
      (by decide) hq hbase (ExceptionalEightFamily.first_all_positive_parameters s hs)
    intro d hd
    have hlt := hbound d (hperm.mem_iff.mp hd)
    omega
  · have hbase := (CriticalFamilies.value_perm hperm).symm.trans hvalue
    have hbound := exceptional_denominator_bound [1, 4, 5, 6, 7, 11, 13] s p q hs
      (by decide) hq hbase (ExceptionalEightFamily.second_all_positive_parameters s hs)
    intro d hd
    have hlt := hbound d (hperm.mem_iff.mp hd)
    omega
  · obtain ⟨hb, hcop, hbound, _⟩ := eight_row_arithmetic row hr
    have hfrac := hvalue.symm.trans
      ((CriticalFamilies.value_perm hperm).trans (eight_row_values row hr))
    have hden := denominator_le hq hb hcop hfrac
    intro d hd
    have hd' := hbound d (hperm.mem_iff.mp hd)
    omega

theorem seven_sharp_witness :
    KnownSeven [1, 4, 5, 6, 7, 11, 39] ∧
    value [1, 4, 5, 6, 7, 11, 39] = (2 / 15 : ℝ) ∧
    39 ∈ ([1, 4, 5, 6, 7, 11, 39] : List ℕ) ∧
    (5 * 39 : ℕ) = 13 * 15 := by
  refine ⟨Or.inr ⟨⟨[1, 4, 5, 6, 7, 11, 39], 2, 15⟩, by decide +kernel,
    List.Perm.refl _⟩, HigherExamples.seven_21_value, by decide, by decide⟩

theorem eight_sharp_witness :
    KnownEight [1, 5, 6, 7, 8, 11, 13, 21] ∧
    value [1, 5, 6, 7, 8, 11, 13, 21] = (2 / 17 : ℝ) ∧
    21 ∈ ([1, 5, 6, 7, 8, 11, 13, 21] : List ℕ) ∧
    (17 * 21 : ℕ) = 21 * 17 := by
  refine ⟨Or.inr ⟨⟨[1, 5, 6, 7, 8, 11, 13, 21], 2, 17⟩, by decide +kernel,
    List.Perm.refl _⟩, HigherExamples.eight_17_value, by decide, by decide⟩

theorem seven_constant_optimal (C : ℝ)
    (h : ∀ ds : List ℕ, KnownSeven ds → ∀ p q : ℕ, 0 < q →
      value ds = (p : ℝ) / q → ∀ d ∈ ds, (d : ℝ) ≤ C * q) :
    (13 / 5 : ℝ) ≤ C := by
  have hc := h [1, 4, 5, 6, 7, 11, 39] seven_sharp_witness.1 2 15
    (by decide) HigherExamples.seven_21_value 39 (by decide)
  norm_num at hc
  linarith

theorem eight_constant_optimal (C : ℝ)
    (h : ∀ ds : List ℕ, KnownEight ds → ∀ p q : ℕ, 0 < q →
      value ds = (p : ℝ) / q → ∀ d ∈ ds, (d : ℝ) ≤ C * q) :
    (21 / 17 : ℝ) ≤ C := by
  have hc := h [1, 5, 6, 7, 8, 11, 13, 21] eight_sharp_witness.1 2 17
    (by decide) HigherExamples.eight_17_value 21 (by decide)
  norm_num at hc
  linarith

end Loneliness.HigherSpectrumBounds

