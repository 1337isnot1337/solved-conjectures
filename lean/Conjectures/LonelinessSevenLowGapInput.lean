import Conjectures.LonelinessHigherSpectrumBounds

/-! The exact seven-speed low-gap input used in the eight-coordinate plane
argument. Within the stated seven-speed candidates, value below 3/23 leaves
exactly the three seven-speed bases of the eight-speed product families.
The passage to arbitrary speed lists retains the primitive seven-speed
classification as an explicit hypothesis and transports the gcd scaling. -/

namespace Loneliness.SevenLowGapInput

open HigherSpectrumBounds

def IsBase (ds : List ℕ) : Prop :=
  ds.Perm [1, 2, 3, 4, 5, 6, 7] ∨
    ds.Perm [1, 2, 3, 4, 5, 7, 12] ∨
    ds.Perm [1, 4, 5, 6, 7, 11, 13]

def PrimitiveClassification : Prop :=
  ∀ ds : List ℕ, ds.length = 7 → ds.Nodup → (∀ d ∈ ds, 0 < d) →
    Normalization.gcd ds = 1 → value ds < (1 : ℝ) / 7 → KnownSeven ds

def SevenSpeedGap : Prop :=
  ∀ ds : List ℕ, ds.length = 7 → ds.Nodup → (∀ d ∈ ds, 0 < d) →
    value ds < (3 / 23 : ℝ) →
    ∃ d : ℕ, 1 ≤ d ∧
      (ds.Perm ([1, 2, 3, 4, 5, 6, 7].map (fun a => d * a)) ∨
        ds.Perm ([1, 2, 3, 4, 5, 7, 12].map (fun a => d * a)) ∨
        ds.Perm ([1, 4, 5, 6, 7, 11, 13].map (fun a => d * a)))

theorem seven_row_low_shapes : ∀ row ∈ sevenRows,
    row.numerator * 23 < 3 * row.denominator →
      row.speeds = [1, 2, 3, 4, 5, 7, 12] ∨
        row.speeds = [1, 4, 5, 6, 7, 11, 13] := by
  decide +kernel

theorem consecutive_low_parameter (s : ℕ) (hs : 1 ≤ s)
    (hbelow : value [1, 2, 3, 4, 5, 6, 7 * s] < (3 / 23 : ℝ)) : s = 1 := by
  rw [seven_consecutive_family_value s hs] at hbelow
  have hcross := (div_lt_div_iff₀ (by positivity : (0 : ℝ) < 7 * (s : ℝ) + 1)
    (by norm_num : (0 : ℝ) < 23)).mp hbelow
  have hltR : (s : ℝ) < 2 := by linarith only [hcross]
  have hlt : s < 2 := by exact_mod_cast hltR
  omega

theorem known_seven_low_shapes (ds : List ℕ) (hknown : KnownSeven ds)
    (hbelow : value ds < (3 / 23 : ℝ)) : IsBase ds := by
  rcases hknown with ⟨s, hs, hp⟩ | ⟨row, hr, hp⟩
  · have hsone := consecutive_low_parameter s hs
      (by rw [← CriticalFamilies.value_perm hp]; exact hbelow)
    exact Or.inl (by simpa only [hsone, mul_one] using hp)
  · have hden : (0 : ℝ) < row.denominator := by
      exact_mod_cast (seven_row_arithmetic row hr).1
    have hrowbelow : (row.numerator : ℝ) / row.denominator < (3 / 23 : ℝ) := by
      rw [← seven_row_values row hr, ← CriticalFamilies.value_perm hp]
      exact hbelow
    have hcrossR := (div_lt_div_iff₀ hden (by norm_num : (0 : ℝ) < 23)).mp hrowbelow
    have hcross : row.numerator * 23 < 3 * row.denominator := by exact_mod_cast hcrossR
    rcases seven_row_low_shapes row hr hcross with hsecond | hthird
    · exact Or.inr (Or.inl (by simpa only [hsecond] using hp))
    · exact Or.inr (Or.inr (by simpa only [hthird] using hp))

theorem base_value (ds : List ℕ) (hbase : IsBase ds) : value ds = (1 / 8 : ℝ) := by
  rcases hbase with hp | hp | hp
  · rw [CriticalFamilies.value_perm hp]
    have h := seven_consecutive_family_value 1 (by decide)
    norm_num at h
    exact h
  · rw [CriticalFamilies.value_perm hp]
    exact HigherExamples.seven_01_value
  · rw [CriticalFamilies.value_perm hp]
    exact HigherExamples.seven_16_value

theorem known_seven_eighth_iff (ds : List ℕ) (hknown : KnownSeven ds) :
    value ds = (1 / 8 : ℝ) ↔ IsBase ds := by
  constructor
  · intro hv
    apply known_seven_low_shapes ds hknown
    rw [hv]
    norm_num
  · exact base_value ds

theorem normalized_low_shapes (hclass : PrimitiveClassification)
    (ds : List ℕ) (hlen : ds.length = 7) (hdistinct : ds.Nodup)
    (hpositive : ∀ d ∈ ds, 0 < d) (hbelow : value ds < (3 / 23 : ℝ)) :
    IsBase (Normalization.normalize ds) := by
  have hne : ds ≠ [] := by intro hz; simp [hz] at hlen
  have hv : value (Normalization.normalize ds) = value ds :=
    Normalization.value_normalize ds hne hpositive
  have hnormalized : value (Normalization.normalize ds) < (3 / 23 : ℝ) := by
    rw [hv]
    exact hbelow
  have hknown := hclass (Normalization.normalize ds)
    (by simpa only [Normalization.normalize_length] using hlen)
    (Normalization.normalize_nodup hdistinct)
    (Normalization.normalize_positive ds hpositive)
    (Normalization.normalize_primitive ds hne hpositive)
    (by linarith only [hnormalized])
  exact known_seven_low_shapes (Normalization.normalize ds) hknown hnormalized

theorem sevenSpeedGap_of_primitiveClassification
    (hclass : PrimitiveClassification) : SevenSpeedGap := by
  intro ds hlen hdistinct hpositive hbelow
  have hne : ds ≠ [] := by intro hz; simp [hz] at hlen
  have hbase := normalized_low_shapes hclass ds hlen hdistinct hpositive hbelow
  refine ⟨Normalization.gcd ds, Normalization.gcd_pos hne hpositive, ?_⟩
  rcases hbase with hp | hp | hp
  · apply Or.inl
    have hmap := hp.map (fun a => Normalization.gcd ds * a)
    simpa only [Normalization.rescale_normalize] using hmap
  · apply Or.inr ∘ Or.inl
    have hmap := hp.map (fun a => Normalization.gcd ds * a)
    simpa only [Normalization.rescale_normalize] using hmap
  · apply Or.inr ∘ Or.inr
    have hmap := hp.map (fun a => Normalization.gcd ds * a)
    simpa only [Normalization.rescale_normalize] using hmap

theorem low_value_eq_eighth (hclass : PrimitiveClassification)
    (ds : List ℕ) (hlen : ds.length = 7) (hdistinct : ds.Nodup)
    (hpositive : ∀ d ∈ ds, 0 < d) (hbelow : value ds < (3 / 23 : ℝ)) :
    value ds = (1 / 8 : ℝ) := by
  have hne : ds ≠ [] := by intro hz; simp [hz] at hlen
  rw [← Normalization.value_normalize ds hne hpositive]
  exact base_value (Normalization.normalize ds)
    (normalized_low_shapes hclass ds hlen hdistinct hpositive hbelow)

end Loneliness.SevenLowGapInput
