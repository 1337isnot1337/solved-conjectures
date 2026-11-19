import Conjectures.LonelinessExceptionalEightFamily

/-! Both exceptional product-plane families, including the exceptional s=1
values. All s≥2 are covered by the symbolic certificates; the two remaining
finite values use exact rational interval certificates. -/

namespace Loneliness.ExceptionalEightFamily

set_option maxRecDepth 10000
set_option maxHeartbeats 800000

def firstBase : List ℕ := [1, 2, 3, 4, 5, 7, 12]

def firstCover : List ConsecutiveFamily.Interval :=
  [(1, 0), (8, 1), (7, 1), (12, 2), (5, 1), (4, 1), (7, 2), (3, 1), (8, 3), (5, 2), (7, 3), (2, 1)]

theorem first_suitable : Suitable firstBase := by norm_num [Suitable, firstBase]

theorem first_cover_checked : Cover firstBase (0, 0) firstCover := by decide +kernel

theorem first_family_value (s : ℕ) (hs : 2 ≤ s) :
    value [1, 2, 3, 4, 5, 7, 12, 8 * s] = (s : ℝ) / (8 * (s : ℝ) + 1) := by
  have h := value_of_cover firstBase first_suitable (by decide +kernel) s hs
    firstCover first_cover_checked
  simpa [firstBase] using h

theorem first_family_maximum (s : ℕ) (hs : 2 ≤ s) :
    clearance [1, 2, 3, 4, 5, 7, 12, 8 * s] ((s : ℝ) / (8 * (s : ℝ) + 1)) =
        (s : ℝ) / (8 * (s : ℝ) + 1) ∧
      ∀ t : ℝ, clearance [1, 2, 3, 4, 5, 7, 12, 8 * s] t ≤ (s : ℝ) / (8 * (s : ℝ) + 1) := by
  have h := maximum_of_cover firstBase first_suitable (by decide +kernel) s hs
    firstCover first_cover_checked
  simpa [firstBase] using h

def firstOneCover : List Segment := [
  ⟨(-2 / 17), (2 / 17), 1, 0⟩,
  ⟨(15 / 136), (19 / 136), 8, 1⟩,
  ⟨(15 / 119), (19 / 119), 7, 1⟩,
  ⟨(8 / 51), (3 / 17), 12, 2⟩,
  ⟨(3 / 17), (19 / 85), 5, 1⟩,
  ⟨(15 / 68), (19 / 68), 4, 1⟩,
  ⟨(32 / 119), (36 / 119), 7, 2⟩,
  ⟨(5 / 17), (19 / 51), 3, 1⟩,
  ⟨(49 / 136), (53 / 136), 8, 3⟩,
  ⟨(32 / 85), (36 / 85), 5, 2⟩,
  ⟨(7 / 17), (53 / 119), 7, 3⟩,
  ⟨(15 / 34), (19 / 34), 2, 1⟩,
  ⟨(66 / 119), (10 / 17), 7, 4⟩,
  ⟨(49 / 85), (53 / 85), 5, 3⟩,
  ⟨(83 / 136), (87 / 136), 8, 5⟩,
  ⟨(32 / 51), (12 / 17), 3, 2⟩,
  ⟨(83 / 119), (87 / 119), 7, 5⟩,
  ⟨(49 / 68), (53 / 68), 4, 3⟩,
  ⟨(66 / 85), (14 / 17), 5, 4⟩,
  ⟨(14 / 17), (43 / 51), 12, 10⟩,
  ⟨(100 / 119), (104 / 119), 7, 6⟩,
  ⟨(117 / 136), (121 / 136), 8, 7⟩,
  ⟨(15 / 17), (19 / 17), 1, 1⟩]

theorem first_at_one_value : value [1, 2, 3, 4, 5, 7, 12, 8] = (2 / 17 : ℝ) := by
  have h := certified_value (ds := [1, 2, 3, 4, 5, 7, 12, 8]) (r := (2 / 17))
    (cs := firstOneCover) (t := (3 / 17)) (ks := [0, 0, 0, 0, 0, 1, 2, 1])
    (by norm_num [firstOneCover, Segment.Valid])
    (by norm_num [firstOneCover, coversFrom])
    (by norm_num [LowerCertificate]) (by norm_num) (by norm_num)
  norm_num at h
  exact h

theorem first_all_positive_parameters (s : ℕ) (hs : 1 ≤ s) :
    value [1, 2, 3, 4, 5, 7, 12, 8 * s] = if s = 1 then (2 / 17 : ℝ) else (s : ℝ) / (8 * (s : ℝ) + 1) := by
  by_cases h : s = 1
  · subst s
    simpa using first_at_one_value
  · simpa [h] using first_family_value s (by omega)

def secondBase : List ℕ := [1, 4, 5, 6, 7, 11, 13]

def secondCover : List ConsecutiveFamily.Interval :=
  [(1, 0), (8, 1), (7, 1), (6, 1), (5, 1), (4, 1), (7, 2), (13, 4), (6, 2), (11, 4), (8, 3), (5, 2), (7, 3), (11, 5), (13, 6), (4, 2)]

theorem second_suitable : Suitable secondBase := by norm_num [Suitable, secondBase]

theorem second_cover_checked : Cover secondBase (0, 0) secondCover := by decide +kernel

theorem second_family_value (s : ℕ) (hs : 2 ≤ s) :
    value [1, 4, 5, 6, 7, 11, 13, 8 * s] = (s : ℝ) / (8 * (s : ℝ) + 1) := by
  have h := value_of_cover secondBase second_suitable (by decide +kernel) s hs
    secondCover second_cover_checked
  simpa [secondBase] using h

theorem second_family_maximum (s : ℕ) (hs : 2 ≤ s) :
    clearance [1, 4, 5, 6, 7, 11, 13, 8 * s] ((s : ℝ) / (8 * (s : ℝ) + 1)) =
        (s : ℝ) / (8 * (s : ℝ) + 1) ∧
      ∀ t : ℝ, clearance [1, 4, 5, 6, 7, 11, 13, 8 * s] t ≤ (s : ℝ) / (8 * (s : ℝ) + 1) := by
  have h := maximum_of_cover secondBase second_suitable (by decide +kernel) s hs
    secondCover second_cover_checked
  simpa [secondBase] using h

def secondOneCover : List Segment := [
  ⟨(-2 / 17), (2 / 17), 1, 0⟩,
  ⟨(15 / 136), (19 / 136), 8, 1⟩,
  ⟨(15 / 119), (19 / 119), 7, 1⟩,
  ⟨(5 / 34), (19 / 102), 6, 1⟩,
  ⟨(3 / 17), (19 / 85), 5, 1⟩,
  ⟨(15 / 68), (19 / 68), 4, 1⟩,
  ⟨(32 / 119), (36 / 119), 7, 2⟩,
  ⟨(66 / 221), (70 / 221), 13, 4⟩,
  ⟨(16 / 51), (6 / 17), 6, 2⟩,
  ⟨(6 / 17), (70 / 187), 11, 4⟩,
  ⟨(49 / 136), (53 / 136), 8, 3⟩,
  ⟨(32 / 85), (36 / 85), 5, 2⟩,
  ⟨(7 / 17), (53 / 119), 7, 3⟩,
  ⟨(83 / 187), (87 / 187), 11, 5⟩,
  ⟨(100 / 221), (8 / 17), 13, 6⟩,
  ⟨(8 / 17), (9 / 17), 4, 2⟩,
  ⟨(9 / 17), (121 / 221), 13, 7⟩,
  ⟨(100 / 187), (104 / 187), 11, 6⟩,
  ⟨(66 / 119), (10 / 17), 7, 4⟩,
  ⟨(49 / 85), (53 / 85), 5, 3⟩,
  ⟨(83 / 136), (87 / 136), 8, 5⟩,
  ⟨(117 / 187), (11 / 17), 11, 7⟩,
  ⟨(11 / 17), (35 / 51), 6, 4⟩,
  ⟨(151 / 221), (155 / 221), 13, 9⟩,
  ⟨(83 / 119), (87 / 119), 7, 5⟩,
  ⟨(49 / 68), (53 / 68), 4, 3⟩,
  ⟨(66 / 85), (14 / 17), 5, 4⟩,
  ⟨(83 / 102), (29 / 34), 6, 5⟩,
  ⟨(100 / 119), (104 / 119), 7, 6⟩,
  ⟨(117 / 136), (121 / 136), 8, 7⟩,
  ⟨(15 / 17), (19 / 17), 1, 1⟩]

theorem second_at_one_value : value [1, 4, 5, 6, 7, 11, 13, 8] = (2 / 17 : ℝ) := by
  have h := certified_value (ds := [1, 4, 5, 6, 7, 11, 13, 8]) (r := (2 / 17))
    (cs := secondOneCover) (t := (6 / 17)) (ks := [0, 1, 1, 2, 2, 3, 4, 2])
    (by norm_num [secondOneCover, Segment.Valid])
    (by norm_num [secondOneCover, coversFrom])
    (by norm_num [LowerCertificate]) (by norm_num) (by norm_num)
  norm_num at h
  exact h

theorem second_all_positive_parameters (s : ℕ) (hs : 1 ≤ s) :
    value [1, 4, 5, 6, 7, 11, 13, 8 * s] = if s = 1 then (2 / 17 : ℝ) else (s : ℝ) / (8 * (s : ℝ) + 1) := by
  by_cases h : s = 1
  · subst s
    simpa using second_at_one_value
  · simpa [h] using second_family_value s (by omega)

end Loneliness.ExceptionalEightFamily
