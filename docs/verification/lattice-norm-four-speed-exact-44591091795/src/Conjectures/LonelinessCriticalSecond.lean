import Conjectures.LonelinessFiveFamily

/-! Exact values for the second critical four-speed family with a fifth speed
divisible by five. The uniform proof uses seven intervals on a half-period. -/

namespace Loneliness

theorem second_family_upper_half (s : ℕ) (hs : 2 ≤ s) (r : ℝ)
    (hr : (5 * (s : ℝ) + 1) * r = s)
    (hlo : 2 / 11 ≤ r) (_hhi : r ≤ 1 / 5)
    {t : ℝ} (ht₀ : 0 ≤ t) (ht₁ : t ≤ 1 / 2) :
    clearance [1, 3, 4, 7, 5 * s] t ≤ r := by
  have hs' : (2 : ℝ) ≤ s := by exact_mod_cast hs
  have hsn : 0 ≤ 5 * (s : ℝ) := by positivity
  have hrn : 0 ≤ r := by linarith
  by_cases h₁ : t ≤ r
  · apply clearance_le_if_near (d := 1) (by simp) (k := 0) <;> norm_num <;> linarith
  by_cases h₂ : t ≤ (1 - r) / 4
  · have htl := mul_le_mul_of_nonneg_left (le_of_not_ge h₁) hsn
    have htu := mul_le_mul_of_nonneg_left h₂ hsn
    apply clearance_le_if_near (d := 5 * s) (by simp) (k := (s : ℤ))
    · push_cast; nlinarith
    · push_cast; nlinarith
  by_cases h₃ : t ≤ (1 + r) / 4
  · apply clearance_le_if_near (d := 4) (by simp) (k := 1) <;>
      norm_num <;> linarith
  by_cases h₄ : t ≤ (1 + r) / 3
  · apply clearance_le_if_near (d := 3) (by simp) (k := 1) <;>
      norm_num <;> linarith
  by_cases h₅ : t ≤ (3 - r) / 7
  · have htl := mul_le_mul_of_nonneg_left (le_of_not_ge h₄) hsn
    have htu := mul_le_mul_of_nonneg_left h₅ hsn
    apply clearance_le_if_near (d := 5 * s) (by simp) (k := 2 * (s : ℤ))
    · push_cast; nlinarith
    · push_cast; nlinarith
  by_cases h₆ : t ≤ (3 + r) / 7
  · apply clearance_le_if_near (d := 7) (by simp) (k := 3) <;>
      norm_num <;> linarith
  · apply clearance_le_if_near (d := 4) (by simp) (k := 2) <;>
      norm_num <;> linarith

theorem second_family_value (s : ℕ) (hs : 2 ≤ s) :
    value [1, 3, 4, 7, 5 * s] = (s : ℝ) / (5 * (s : ℝ) + 1) := by
  let r : ℝ := (s : ℝ) / (5 * (s : ℝ) + 1)
  have hs' : (2 : ℝ) ≤ s := by exact_mod_cast hs
  have hd : 0 < 5 * (s : ℝ) + 1 := by positivity
  have hr : (5 * (s : ℝ) + 1) * r = s := by dsimp [r]; field_simp
  have hlo : 2 / 11 ≤ r := by dsimp [r]; apply (le_div_iff₀ hd).mpr; linarith
  have hhi : r ≤ 1 / 5 := by dsimp [r]; apply (div_le_iff₀ hd).mpr; linarith
  have hrn : 0 ≤ r := by linarith
  have ht : r ∈ Set.Icc (0 : ℝ) 1 := ⟨hrn, by linarith⟩
  have hlower : r ≤ clearance [1, 3, 4, 7, 5 * s] r := by
    apply le_clearance (by linarith)
    intro d hdmem
    simp only [List.mem_cons, List.not_mem_nil, or_false] at hdmem
    rcases hdmem with rfl | rfl | rfl | rfl | rfl
    · apply distance_lower_of_cell (k := 0)
      · norm_num
      · norm_num; linarith
    · apply distance_lower_of_cell (k := 0) <;> norm_num <;> linarith
    · apply distance_lower_of_cell (k := 0) <;> norm_num <;> linarith
    · apply distance_lower_of_cell (k := 1) <;> norm_num <;> linarith
    · apply distance_lower_of_cell (k := (s : ℤ) - 1) <;> push_cast <;> nlinarith
  apply le_antisymm
  · apply value_le
    intro t ht
    by_cases hth : t ≤ 1 / 2
    · exact second_family_upper_half s hs r hr hlo hhi ht.1 hth
    · rw [← clearance_reflection _ t]
      apply second_family_upper_half s hs r hr hlo hhi <;> linarith [ht.2]
  · exact hlower.trans (le_value ht)

def second_family_one_cover : List Segment := [
  ⟨-2 / 11, 2 / 11, 1, 0⟩,
  ⟨9 / 55, 13 / 55, 5, 1⟩,
  ⟨9 / 44, 13 / 44, 4, 1⟩,
  ⟨3 / 11, 13 / 33, 3, 1⟩,
  ⟨4 / 11, 24 / 55, 5, 2⟩,
  ⟨31 / 77, 5 / 11, 7, 3⟩,
  ⟨5 / 11, 6 / 11, 4, 2⟩,
  ⟨6 / 11, 46 / 77, 7, 4⟩,
  ⟨31 / 55, 7 / 11, 5, 3⟩,
  ⟨20 / 33, 8 / 11, 3, 2⟩,
  ⟨31 / 44, 35 / 44, 4, 3⟩,
  ⟨42 / 55, 46 / 55, 5, 4⟩,
  ⟨9 / 11, 13 / 11, 1, 1⟩]

theorem second_family_one_value : value [1, 3, 4, 7, 5] = (2 / 11 : ℝ) := by
  have h := certified_value (ds := [1, 3, 4, 7, 5]) (r := 2 / 11)
    (cs := second_family_one_cover) (t := 5 / 11) (ks := [0, 1, 1, 3, 2])
    (by norm_num [second_family_one_cover, Segment.Valid])
    (by norm_num [second_family_one_cover, coversFrom])
    (by norm_num [LowerCertificate]) (by norm_num) (by norm_num)
  norm_num at h
  exact h

theorem second_family_spectrum (s : ℕ) (hs : 1 ≤ s) :
    ∃ k : ℕ, 1 ≤ k ∧ value [1, 3, 4, 7, 5 * s] =
      (k : ℝ) / (5 * (k : ℝ) + 1) := by
  by_cases hs₁ : s = 1
  · subst s
    refine ⟨2, by omega, ?_⟩
    norm_num [second_family_one_value]
  · exact ⟨s, hs, second_family_value s (by omega)⟩

end Loneliness
