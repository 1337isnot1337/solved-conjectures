import Conjectures.LonelinessConsecutiveFamily
import Mathlib.Tactic.IntervalCases

/-! Checked covers for dimensions two through fourteen. Each cover establishes
an infinite family, with no bound on the integer parameter. -/

namespace Loneliness.ConsecutiveFamily

def cover2 : List Interval :=
  [(1, 0), (2, 1)]

theorem cover2_checked : Cover 2 (0, 0) cover2 := by decide +kernel

def cover3 : List Interval :=
  [(1, 0), (3, 1), (2, 1)]

theorem cover3_checked : Cover 3 (0, 0) cover3 := by decide +kernel

def cover4 : List Interval :=
  [(1, 0), (4, 1), (3, 1), (2, 1)]

theorem cover4_checked : Cover 4 (0, 0) cover4 := by decide +kernel

def cover5 : List Interval :=
  [(1, 0), (5, 1), (4, 1), (3, 1), (5, 2), (2, 1)]

theorem cover5_checked : Cover 5 (0, 0) cover5 := by decide +kernel

def cover6 : List Interval :=
  [(1, 0), (6, 1), (5, 1), (4, 1), (3, 1), (5, 2), (2, 1)]

theorem cover6_checked : Cover 6 (0, 0) cover6 := by decide +kernel

def cover7 : List Interval :=
  [(1, 0), (7, 1), (6, 1), (5, 1), (4, 1), (7, 2), (3, 1), (5, 2), (7, 3), (2, 1)]

theorem cover7_checked : Cover 7 (0, 0) cover7 := by decide +kernel

def cover8 : List Interval :=
  [(1, 0), (8, 1), (7, 1), (6, 1), (5, 1), (4, 1), (7, 2), (3, 1), (8, 3), (5, 2), (7, 3), (2, 1)]

theorem cover8_checked : Cover 8 (0, 0) cover8 := by decide +kernel

def cover9 : List Interval :=
  [(1, 0), (9, 1), (8, 1), (7, 1), (6, 1), (5, 1), (9, 2), (4, 1), (7, 2), (3, 1), (8, 3), (5, 2), (7, 3), (9, 4), (2, 1)]

theorem cover9_checked : Cover 9 (0, 0) cover9 := by decide +kernel

def cover10 : List Interval :=
  [(1, 0), (10, 1), (9, 1), (8, 1), (7, 1), (6, 1), (5, 1), (9, 2), (4, 1), (7, 2), (10, 3), (3, 1), (8, 3), (5, 2), (7, 3), (9, 4), (2, 1)]

theorem cover10_checked : Cover 10 (0, 0) cover10 := by decide +kernel

def cover11 : List Interval :=
  [(1, 0), (11, 1), (10, 1), (9, 1), (8, 1), (7, 1), (6, 1), (11, 2), (5, 1), (9, 2), (4, 1), (11, 3), (7, 2), (10, 3), (3, 1), (11, 4), (8, 3), (5, 2), (7, 3), (9, 4), (11, 5), (2, 1)]

theorem cover11_checked : Cover 11 (0, 0) cover11 := by decide +kernel

def cover12 : List Interval :=
  [(1, 0), (12, 1), (11, 1), (10, 1), (9, 1), (8, 1), (7, 1), (6, 1), (11, 2), (5, 1), (9, 2), (4, 1), (11, 3), (7, 2), (10, 3), (3, 1), (11, 4), (8, 3), (5, 2), (12, 5), (7, 3), (9, 4), (11, 5), (2, 1)]

theorem cover12_checked : Cover 12 (0, 0) cover12 := by decide +kernel

def cover13 : List Interval :=
  [(1, 0), (13, 1), (12, 1), (11, 1), (10, 1), (9, 1), (8, 1), (7, 1), (13, 2), (6, 1), (11, 2), (5, 1), (9, 2), (13, 3), (4, 1), (11, 3), (7, 2), (10, 3), (13, 4), (3, 1), (11, 4), (8, 3), (13, 5), (5, 2), (12, 5), (7, 3), (9, 4), (11, 5), (13, 6), (2, 1)]

theorem cover13_checked : Cover 13 (0, 0) cover13 := by decide +kernel

def cover14 : List Interval :=
  [(1, 0), (14, 1), (13, 1), (12, 1), (11, 1), (10, 1), (9, 1), (8, 1), (7, 1), (13, 2), (6, 1), (11, 2), (5, 1), (14, 3), (9, 2), (13, 3), (4, 1), (11, 3), (7, 2), (10, 3), (13, 4), (3, 1), (14, 5), (11, 4), (8, 3), (13, 5), (5, 2), (12, 5), (7, 3), (9, 4), (11, 5), (13, 6), (2, 1)]

theorem cover14_checked : Cover 14 (0, 0) cover14 := by decide +kernel

/-- Exact values for every positive integer parameter in each checked dimension.
This is a realization theorem; it does not classify arbitrary speed lists. -/
theorem family_value (n s : ℕ) (hn : 2 ≤ n) (hnmax : n ≤ 14) (hs : 1 ≤ s) :
    value (speeds n s) = (s : ℝ) / ((n : ℝ) * s + 1) := by
  interval_cases n
  · exact value_of_cover 2 s (by decide) hs cover2 cover2_checked
  · exact value_of_cover 3 s (by decide) hs cover3 cover3_checked
  · exact value_of_cover 4 s (by decide) hs cover4 cover4_checked
  · exact value_of_cover 5 s (by decide) hs cover5 cover5_checked
  · exact value_of_cover 6 s (by decide) hs cover6 cover6_checked
  · exact value_of_cover 7 s (by decide) hs cover7 cover7_checked
  · exact value_of_cover 8 s (by decide) hs cover8 cover8_checked
  · exact value_of_cover 9 s (by decide) hs cover9 cover9_checked
  · exact value_of_cover 10 s (by decide) hs cover10 cover10_checked
  · exact value_of_cover 11 s (by decide) hs cover11 cover11_checked
  · exact value_of_cover 12 s (by decide) hs cover12 cover12_checked
  · exact value_of_cover 13 s (by decide) hs cover13 cover13_checked
  · exact value_of_cover 14 s (by decide) hs cover14 cover14_checked

theorem family_maximum (n s : ℕ) (hn : 2 ≤ n) (hnmax : n ≤ 14) (hs : 1 ≤ s) :
    clearance (speeds n s) ((s : ℝ) / ((n : ℝ) * s + 1)) =
        (s : ℝ) / ((n : ℝ) * s + 1) ∧
      ∀ t : ℝ, clearance (speeds n s) t ≤ (s : ℝ) / ((n : ℝ) * s + 1) := by
  have hv := family_value n s hn hnmax hs
  have hu (t : ℝ) : clearance (speeds n s) t ≤ (s : ℝ) / ((n : ℝ) * s + 1) := by
    rw [← hv]
    exact clearance_le_value _ t
  exact ⟨le_antisymm (hu _) (family_lower n s hn hs), hu⟩

theorem family_realizes (n s : ℕ) (hn : 2 ≤ n) (hnmax : n ≤ 14) (hs : 1 ≤ s) :
    ∃ ds : List ℕ, ds.length = n ∧ ds.Nodup ∧
      (∀ d ∈ ds, 0 < d) ∧ ds.foldr Nat.gcd 0 = 1 ∧
      value ds = (s : ℝ) / ((n : ℝ) * s + 1) ∧ value ds < 1 / (n : ℝ) := by
  refine ⟨speeds n s, speeds_length n s (by omega), speeds_distinct n s hn hs,
    speeds_positive n s hn hs, speeds_primitive n s hn, family_value n s hn hnmax hs, ?_⟩
  rw [family_value n s hn hnmax hs]
  have hnp : (0 : ℝ) < n := by exact_mod_cast (show 0 < n by omega)
  apply (div_lt_div_iff₀ (by positivity) hnp).mpr
  nlinarith

end Loneliness.ConsecutiveFamily

namespace Loneliness

theorem six_consecutive_family_value (s : ℕ) (hs : 1 ≤ s) :
    value [1, 2, 3, 4, 5, 6 * s] = (s : ℝ) / (6 * (s : ℝ) + 1) := by
  have h := ConsecutiveFamily.family_value 6 s (by decide) (by decide) hs
  norm_num [ConsecutiveFamily.speeds, List.range'_succ] at h
  exact h

theorem seven_consecutive_family_value (s : ℕ) (hs : 1 ≤ s) :
    value [1, 2, 3, 4, 5, 6, 7 * s] = (s : ℝ) / (7 * (s : ℝ) + 1) := by
  have h := ConsecutiveFamily.family_value 7 s (by decide) (by decide) hs
  norm_num [ConsecutiveFamily.speeds, List.range'_succ] at h
  exact h

theorem eight_consecutive_family_value (s : ℕ) (hs : 1 ≤ s) :
    value [1, 2, 3, 4, 5, 6, 7, 8 * s] = (s : ℝ) / (8 * (s : ℝ) + 1) := by
  have h := ConsecutiveFamily.family_value 8 s (by decide) (by decide) hs
  norm_num [ConsecutiveFamily.speeds, List.range'_succ] at h
  exact h

end Loneliness
