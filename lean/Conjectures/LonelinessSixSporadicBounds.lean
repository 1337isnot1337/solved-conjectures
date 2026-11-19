import Conjectures.LonelinessSixSpectrumArithmetic

/-! The nine explicit sporadic sextuples in the six-speed note. The speed
bound holds for every positive-denominator representation of their actual
value. The reduced denominator has defect one. The list may be permuted;
exhaustiveness outside this finite list is a separate obligation. -/

namespace Loneliness.SixSporadicBounds

structure Row where
  speeds : List ℕ
  numerator : ℕ
  denominator : ℕ
  deriving DecidableEq

def rows : List Row := [
  ⟨[1, 2, 5, 6, 7, 8], 2, 13⟩,
  ⟨[2, 5, 6, 8, 10, 11], 2, 13⟩,
  ⟨[1, 4, 5, 6, 7, 22], 2, 13⟩,
  ⟨[1, 2, 3, 5, 8, 18], 3, 19⟩,
  ⟨[2, 3, 5, 6, 8, 11], 3, 19⟩,
  ⟨[2, 5, 6, 7, 8, 11], 3, 19⟩,
  ⟨[1, 3, 4, 5, 18, 46], 4, 25⟩,
  ⟨[1, 3, 4, 5, 7, 24], 5, 31⟩,
  ⟨[1, 4, 5, 6, 7, 33], 6, 37⟩]

theorem row_values (row : Row) (hr : row ∈ rows) :
    value row.speeds = (row.numerator : ℝ) / (row.denominator : ℝ) := by
  simp only [rows, List.mem_cons, List.not_mem_nil, or_false] at hr
  rcases hr with rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl
  · exact PairSum.Examples.six_sporadic_01.value_eq
  · exact PairSum.Examples.six_sporadic_02.value_eq
  · exact PairSum.Examples.six_sporadic_03.value_eq
  · exact PairSum.Examples.six_sporadic_04.value_eq
  · exact PairSum.Examples.six_sporadic_05.value_eq
  · exact PairSum.Examples.six_sporadic_06.value_eq
  · exact PairSum.Examples.six_sporadic_07.value_eq
  · exact PairSum.Examples.six_sporadic_08.value_eq
  · exact PairSum.Examples.six_sporadic_09.value_eq

theorem row_arithmetic : ∀ row ∈ rows,
    0 < row.denominator ∧ 1 ≤ row.numerator ∧
    Nat.Coprime row.numerator row.denominator ∧
    row.denominator = 6 * row.numerator + 1 ∧
    (∀ d ∈ row.speeds, d < 3 * row.denominator) := by
  decide +kernel

def IsListed (ds : List ℕ) : Prop := ∃ row ∈ rows, ds.Perm row.speeds

private theorem denominator_dvd {a q c d : ℕ}
    (hq : 0 < q) (hd : 0 < d) (hcd : Nat.Coprime c d)
    (heq : (a : ℝ) / q = (c : ℝ) / d) : d ∣ q := by
  have hcrossR : (a : ℝ) * d = (c : ℝ) * q :=
    (div_eq_div_iff (by positivity) (by positivity)).mp heq
  have hcross : a * d = c * q := by exact_mod_cast hcrossR
  apply hcd.symm.dvd_mul_left.mp
  exact ⟨a, by nlinarith [hcross]⟩

private theorem reduced_fraction_unique {a q c d : ℕ}
    (hq : 0 < q) (hd : 0 < d)
    (haq : Nat.Coprime a q) (hcd : Nat.Coprime c d)
    (heq : (a : ℝ) / q = (c : ℝ) / d) : a = c ∧ q = d := by
  have hcrossR : (a : ℝ) * d = (c : ℝ) * q :=
    (div_eq_div_iff (by positivity) (by positivity)).mp heq
  have hcross : a * d = c * q := by exact_mod_cast hcrossR
  have hden : q = d := Nat.dvd_antisymm
    (denominator_dvd hd hq haq heq.symm) (denominator_dvd hq hd hcd heq)
  subst d
  exact ⟨mul_right_cancel₀ (Nat.ne_of_gt hq) hcross, rfl⟩

theorem listed_value_form (ds : List ℕ) (hlisted : IsListed ds) :
    ∃ a : ℕ, 1 ≤ a ∧ value ds = (a : ℝ) / (6 * (a : ℝ) + 1) := by
  obtain ⟨row, hr, hperm⟩ := hlisted
  obtain ⟨_, ha, _, hden, _⟩ := row_arithmetic row hr
  have hv := (CriticalFamilies.value_perm hperm).trans (row_values row hr)
  exact ⟨row.numerator, ha, by simpa [hden] using hv⟩

theorem listed_spectrum_parameter (ds : List ℕ) (hlisted : IsListed ds) :
    ∃ P : ℕ, 7 ≤ P ∧ P % 6 = 1 ∧
      value ds = ((P : ℝ) - 1) / (6 * (P : ℝ)) := by
  obtain ⟨a, ha, hv⟩ := listed_value_form ds hlisted
  refine ⟨6 * a + 1, by omega, by omega, ?_⟩
  have hfrac := (SixSpectrumArithmetic.first_family_value a).symm
  have hv' : value ds = (a : ℝ) / ((6 * a + 1 : ℕ) : ℝ) := by
    simpa using hv
  exact hv'.trans hfrac

theorem listed_speed_bound (ds : List ℕ) (hlisted : IsListed ds)
    (a q : ℕ) (hq : 0 < q) (hvalue : value ds = (a : ℝ) / q) :
    ∀ d ∈ ds, d < 3 * q := by
  obtain ⟨row, hr, hperm⟩ := hlisted
  obtain ⟨hb, _, hcoprime, _, hbound⟩ := row_arithmetic row hr
  have hfrac := hvalue.symm.trans
    ((CriticalFamilies.value_perm hperm).trans (row_values row hr))
  have hden := Nat.le_of_dvd hq (denominator_dvd hq hb hcoprime hfrac)
  intro d hd
  have hd' := hbound d (hperm.mem_iff.mp hd)
  omega

theorem listed_reduced_denominator (ds : List ℕ) (hlisted : IsListed ds)
    (a q : ℕ) (hq : 0 < q) (hcoprime : Nat.Coprime a q)
    (hvalue : value ds = (a : ℝ) / q) : 1 ≤ a ∧ q = 6 * a + 1 := by
  obtain ⟨row, hr, hperm⟩ := hlisted
  obtain ⟨hb, ha, hcoprime', hden, _⟩ := row_arithmetic row hr
  have hfrac := hvalue.symm.trans
    ((CriticalFamilies.value_perm hperm).trans (row_values row hr))
  obtain ⟨hnum, hden'⟩ := reduced_fraction_unique hq hb hcoprime hcoprime' hfrac
  exact ⟨by omega, by omega⟩

end Loneliness.SixSporadicBounds
