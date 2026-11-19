import Conjectures.Loneliness

/-! An unconditional realization of every proposed five-speed spectrum value.
For every positive integer `s`, the speeds `1,2,3,4,5*s` have loneliness
exactly `s/(5*s+1)`. The proof bounds all real times by six explicit intervals
on the half-period and reflection. -/

namespace Loneliness

theorem distance_int_sub (n : ℤ) (x : ℝ) : distance ((n : ℝ) - x) = distance x := by
  have bound (n : ℤ) (x : ℝ) : distance ((n : ℝ) - x) ≤ distance x := by
    calc
      distance ((n : ℝ) - x) ≤ |(n : ℝ) - x - ((n - round x : ℤ) : ℝ)| :=
        distance_le_int _ _
      _ = |-(x - (round x : ℝ))| := by congr 1; push_cast; ring
      _ = distance x := by rw [abs_neg]; rfl
  apply le_antisymm (bound n x)
  have h := bound n ((n : ℝ) - x)
  have heq : (n : ℝ) - ((n : ℝ) - x) = x := by ring
  rw [heq] at h
  exact h

theorem clearance_reflection (ds : List ℕ) (t : ℝ) :
    clearance ds (1 - t) = clearance ds t := by
  induction ds with
  | nil => rfl
  | cons d ds ih =>
    simp only [clearance, ih]
    congr 1
    have heq : (d : ℝ) * (1 - t) = (d : ℝ) - d * t := by ring
    rw [heq]
    exact distance_int_sub (d : ℤ) ((d : ℝ) * t)

theorem clearance_le_if_near {ds : List ℕ} {d : ℕ} (hd : d ∈ ds)
    {t r : ℝ} {k : ℤ} (hl : (k : ℝ) - r ≤ (d : ℝ) * t)
    (hu : (d : ℝ) * t ≤ (k : ℝ) + r) : clearance ds t ≤ r := by
  apply (clearance_le_of_mem hd t).trans
  apply (distance_le_int _ k).trans
  exact abs_le.mpr ⟨by linarith, by linarith⟩

theorem five_family_upper_half (s : ℕ) (hs : 1 ≤ s) (r : ℝ)
    (hr : (5 * (s : ℝ) + 1) * r = s)
    (hlo : 1 / 6 ≤ r) (_hhi : r ≤ 1 / 5)
    {t : ℝ} (ht₀ : 0 ≤ t) (ht₁ : t ≤ 1 / 2) :
    clearance [1, 2, 3, 4, 5 * s] t ≤ r := by
  have hs' : (1 : ℝ) ≤ s := by exact_mod_cast hs
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
  by_cases h₅ : t ≤ (1 - r) / 2
  · have htl := mul_le_mul_of_nonneg_left (le_of_not_ge h₄) hsn
    have htu := mul_le_mul_of_nonneg_left h₅ hsn
    apply clearance_le_if_near (d := 5 * s) (by simp) (k := 2 * (s : ℤ))
    · push_cast; nlinarith
    · push_cast; nlinarith
  · apply clearance_le_if_near (d := 2) (by simp) (k := 1) <;>
      norm_num <;> linarith

theorem five_family_value (s : ℕ) (hs : 1 ≤ s) :
    value [1, 2, 3, 4, 5 * s] = (s : ℝ) / (5 * (s : ℝ) + 1) := by
  let r : ℝ := (s : ℝ) / (5 * (s : ℝ) + 1)
  have hs' : (1 : ℝ) ≤ s := by exact_mod_cast hs
  have hd : 0 < 5 * (s : ℝ) + 1 := by positivity
  have hr : (5 * (s : ℝ) + 1) * r = s := by dsimp [r]; field_simp
  have hlo : 1 / 6 ≤ r := by dsimp [r]; apply (le_div_iff₀ hd).mpr; linarith
  have hhi : r ≤ 1 / 5 := by dsimp [r]; apply (div_le_iff₀ hd).mpr; linarith
  have hrn : 0 ≤ r := by linarith
  have ht : r ∈ Set.Icc (0 : ℝ) 1 := ⟨hrn, by linarith⟩
  have hlower : r ≤ clearance [1, 2, 3, 4, 5 * s] r := by
    apply le_clearance (by linarith)
    intro d hdmem
    simp only [List.mem_cons, List.not_mem_nil, or_false] at hdmem
    rcases hdmem with rfl | rfl | rfl | rfl | rfl
    · apply distance_lower_of_cell (k := 0)
      · norm_num
      · norm_num; linarith
    · apply distance_lower_of_cell (k := 0) <;> norm_num <;> linarith
    · apply distance_lower_of_cell (k := 0) <;> norm_num <;> linarith
    · apply distance_lower_of_cell (k := 0) <;> norm_num <;> linarith
    · apply distance_lower_of_cell (k := (s : ℤ) - 1) <;> push_cast <;> nlinarith
  apply le_antisymm
  · apply value_le
    intro t ht
    by_cases hth : t ≤ 1 / 2
    · exact five_family_upper_half s hs r hr hlo hhi ht.1 hth
    · rw [← clearance_reflection _ t]
      apply five_family_upper_half s hs r hr hlo hhi <;> linarith [ht.2]
  · exact hlower.trans (le_value ht)

theorem five_family_below_threshold (s : ℕ) (hs : 1 ≤ s) :
    value [1, 2, 3, 4, 5 * s] < 1 / 5 := by
  rw [five_family_value s hs]
  have hd : 0 < 5 * (s : ℝ) + 1 := by positivity
  apply (div_lt_iff₀ hd).mpr
  linarith

theorem five_family_distinct (s : ℕ) (hs : 1 ≤ s) :
    ([1, 2, 3, 4, 5 * s] : List ℕ).Nodup := by
  clear hs
  simp [List.nodup_cons]
  omega

theorem five_family_positive (s : ℕ) (hs : 1 ≤ s) :
    ∀ d ∈ ([1, 2, 3, 4, 5 * s] : List ℕ), 0 < d := by
  intro d hd
  simp only [List.mem_cons, List.not_mem_nil, or_false] at hd
  rcases hd with rfl | rfl | rfl | rfl | rfl <;> omega

theorem five_family_primitive (s : ℕ) :
    ([1, 2, 3, 4, 5 * s] : List ℕ).foldr Nat.gcd 0 = 1 := by simp

/-- Every proposed spectrum value is attained by a primitive set of exactly
five distinct positive integer speeds. Exhaustion is a separate theorem. -/
theorem five_family_realizes (s : ℕ) (hs : 1 ≤ s) :
    ∃ ds : List ℕ, ds.length = 5 ∧ ds.Nodup ∧
      (∀ d ∈ ds, 0 < d) ∧ ds.foldr Nat.gcd 0 = 1 ∧
      value ds = (s : ℝ) / (5 * (s : ℝ) + 1) ∧ value ds < 1 / 5 := by
  exact ⟨[1, 2, 3, 4, 5 * s], rfl, five_family_distinct s hs,
    five_family_positive s hs, five_family_primitive s, five_family_value s hs,
    five_family_below_threshold s hs⟩

end Loneliness
