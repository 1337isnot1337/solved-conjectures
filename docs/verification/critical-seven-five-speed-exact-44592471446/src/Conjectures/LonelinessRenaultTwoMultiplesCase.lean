import Conjectures.LonelinessRenaultTwoMultiplesPhase

/-! Residue cases in Renault's two-multiples-of-three argument. -/

namespace Loneliness.Renault

def FiveSafe (a b c d e : ℕ) (t : ℝ) : Prop :=
  (1 / 6 : ℝ) ≤ distance ((a : ℝ) * t) ∧
  (1 / 6 : ℝ) ≤ distance ((b : ℝ) * t) ∧
  (1 / 6 : ℝ) ≤ distance ((c : ℝ) * t) ∧
  (1 / 6 : ℝ) ≤ distance ((d : ℝ) * t) ∧
  (1 / 6 : ℝ) ≤ distance ((e : ℝ) * t)

private theorem three_residue (v : ℕ) (hv : 3 ∣ v) (hnot : ¬6 ∣ v) :
    ∃ q : ℤ, (v : ℤ) = 3 + 6 * q := by
  have h₃ : v % 3 = 0 := Nat.mod_eq_zero_of_dvd hv
  have h₆ : v % 6 ≠ 0 := fun h => hnot (Nat.dvd_of_mod_eq_zero h)
  have hmod : v % 6 = 3 := by omega
  refine ⟨(v / 6 : ℕ), ?_⟩
  exact_mod_cast (show v = 3 + 6 * (v / 6) by omega)

private theorem distance_signed_half (x : ℝ) (σ : ℤ) (hσ : σ = 1 ∨ σ = -1) :
    distance (x + (σ : ℝ) / 2) = 1 / 2 - distance x := by
  rcases hσ with rfl | rfl
  · simpa using distance_add_half x
  · have heq : x + ((-1 : ℤ) : ℝ) / 2 = (x + 1 / 2) + ((-1 : ℤ) : ℝ) := by
      norm_num
      ring
    rw [heq, CriticalFamilies.distance_add_int, distance_add_half]

private theorem sixth_shift_six (v : ℕ) (hv : 6 ∣ v) (m σ : ℤ) (t : ℝ) :
    distance ((v : ℝ) * ((m : ℝ) * t + σ / 6)) =
      distance ((m : ℝ) * ((v : ℝ) * t)) := by
  obtain ⟨q, hq⟩ := hv
  have hi : (v : ℤ) = 0 + 6 * (q : ℤ) := by
    simp only [zero_add]
    exact_mod_cast hq
  simpa only [Int.cast_zero, zero_mul, zero_div, add_zero] using
    distance_time_affine_six v m σ 0 q t hi

private theorem sixth_shift_three (v : ℕ) (hv : 3 ∣ v) (hnot : ¬6 ∣ v)
    (m σ : ℤ) (hσ : σ = 1 ∨ σ = -1) (t : ℝ) :
    distance ((v : ℝ) * ((m : ℝ) * t + σ / 6)) =
      1 / 2 - distance ((m : ℝ) * ((v : ℝ) * t)) := by
  obtain ⟨q, hq⟩ := three_residue v hv hnot
  rw [distance_time_affine_six v m σ 3 q t hq]
  have harg : (m : ℝ) * ((v : ℝ) * t) + ((3 : ℤ) : ℝ) * σ / 6 =
      (m : ℝ) * ((v : ℝ) * t) + σ / 2 := by norm_num; ring
  rw [harg, distance_signed_half _ σ hσ]

private theorem sixth_shift_three_cases (v : ℕ) (hv : 3 ∣ v)
    (m σ : ℤ) (hσ : σ = 1 ∨ σ = -1) (t : ℝ) :
    distance ((v : ℝ) * ((m : ℝ) * t + σ / 6)) =
        distance ((m : ℝ) * ((v : ℝ) * t)) ∨
      distance ((v : ℝ) * ((m : ℝ) * t + σ / 6)) =
        1 / 2 - distance ((m : ℝ) * ((v : ℝ) * t)) := by
  by_cases h : 6 ∣ v
  · exact Or.inl (sixth_shift_six v h m σ t)
  · exact Or.inr (sixth_shift_three v hv h m σ hσ t)

private theorem odd_half_shift (v : ℕ) (hv : Odd v) (t : ℝ) :
    distance ((v : ℝ) * (t + 1 / 2)) = distance ((v : ℝ) * t + 1 / 2) := by
  obtain ⟨k, hk⟩ := hv
  have harg : (v : ℝ) * (t + 1 / 2) = (v : ℝ) * t + 1 / 2 + (k : ℤ) := by
    rw [hk]
    push_cast
    ring
  rw [harg, CriticalFamilies.distance_add_int]

private theorem nonthree_residues (c : ℕ) (hc : c % 3 ≠ 0) :
    (∃ σ q : ℤ, (σ = 1 ∨ σ = -1) ∧ (c : ℤ) = σ + 6 * q) ∨
      (2 ∣ c ∧ ∃ σ q : ℤ, (σ = 1 ∨ σ = -1) ∧ (c : ℤ) = 2 * σ + 6 * q) := by
  have hm : c % 6 = 1 ∨ c % 6 = 2 ∨ c % 6 = 4 ∨ c % 6 = 5 := by omega
  rcases hm with hm | hm | hm | hm
  · left
    refine ⟨1, (c / 6 : ℕ), Or.inl rfl, ?_⟩
    exact_mod_cast (show c = 1 + 6 * (c / 6) by omega)
  · right
    refine ⟨Nat.dvd_of_mod_eq_zero (by omega), 1, (c / 6 : ℕ), Or.inl rfl, ?_⟩
    exact_mod_cast (show c = 2 * 1 + 6 * (c / 6) by omega)
  · right
    refine ⟨Nat.dvd_of_mod_eq_zero (by omega), -1, ((c / 6 : ℕ) : ℤ) + 1,
      Or.inr rfl, ?_⟩
    have h : (c : ℤ) = 4 + 6 * ((c / 6 : ℕ) : ℤ) := by
      exact_mod_cast (show c = 4 + 6 * (c / 6) by omega)
    omega
  · left
    refine ⟨-1, ((c / 6 : ℕ) : ℤ) + 1, Or.inr rfl, ?_⟩
    have h : (c : ℤ) = 5 + 6 * ((c / 6 : ℕ) : ℤ) := by
      exact_mod_cast (show c = 5 + 6 * (c / 6) by omega)
    omega

private theorem normalized_multiplier (v m : ℕ) (t : ℝ) :
    distance ((v : ℝ) * ((m : ℝ) * t)) =
      distance ((m : ℝ) * distance ((v : ℝ) * t)) := by
  calc
    distance ((v : ℝ) * ((m : ℝ) * t)) =
        distance ((m : ℝ) * ((v : ℝ) * t)) := by congr 1; ring
    _ = _ := (distance_nat_mul_distance m _).symm

private theorem band_multipliers_safe (a b c : ℕ) (t : ℝ)
    (ht : distance ((c : ℝ) * t + 1 / 6) = 0)
    (ha₀ : (1 / 10 : ℝ) < distance ((a : ℝ) * t))
    (ha₁ : distance ((a : ℝ) * t) < 1 / 6)
    (hb₀ : (11 / 30 : ℝ) < distance ((b : ℝ) * t))
    (hb₁ : distance ((b : ℝ) * t) < 7 / 18)
    (m : ℕ) (hm : m = 2 ∨ m = 4) :
    (1 / 6 : ℝ) ≤ distance ((a : ℝ) * ((m : ℝ) * t)) ∧
      (1 / 6 : ℝ) ≤ distance ((b : ℝ) * ((m : ℝ) * t)) ∧
      (1 / 6 : ℝ) ≤ distance ((c : ℝ) * ((m : ℝ) * t)) := by
  rcases hm with rfl | rfl
  · refine ⟨?_, ?_, ?_⟩
    · rw [normalized_multiplier]
      apply distance_lower_of_cell (k := 0) <;>
        norm_num only [Nat.cast_ofNat, Int.cast_zero, sub_zero] <;> linarith only [ha₀, ha₁]
    · rw [normalized_multiplier]
      apply distance_lower_of_cell (k := 0) <;>
        norm_num only [Nat.cast_ofNat, Int.cast_zero, sub_zero] <;> linarith only [hb₀, hb₁]
    · rw [phase_fiber_multiplier_distance c t ht]
      apply distance_lower_of_cell (k := 0) <;> norm_num
  · refine ⟨?_, ?_, ?_⟩
    · rw [normalized_multiplier]
      apply distance_lower_of_cell (k := 0) <;>
        norm_num only [Nat.cast_ofNat, Int.cast_zero, sub_zero] <;> linarith only [ha₀, ha₁]
    · rw [normalized_multiplier]
      apply distance_lower_of_cell (k := 1) <;>
        norm_num only [Nat.cast_ofNat, Int.cast_one] <;> linarith only [hb₀, hb₁]
    · rw [phase_fiber_multiplier_distance c t ht]
      apply distance_lower_of_cell (k := 0) <;> norm_num

private theorem three_even_fiber_contradiction (a b c d e : ℕ) (t : ℝ)
    (ha : 6 ∣ a) (hb : 6 ∣ b) (hc : 2 ∣ c) (hd : Odd d) (he : Odd e)
    (ht : distance ((c : ℝ) * t + 1 / 6) = 0)
    (ha₀ : (1 / 10 : ℝ) < distance ((a : ℝ) * t))
    (ha₁ : distance ((a : ℝ) * t) < 1 / 6)
    (hb₀ : (11 / 30 : ℝ) < distance ((b : ℝ) * t))
    (hb₁ : distance ((b : ℝ) * t) < 7 / 18)
    (hno : ∀ u : ℝ, ¬ FiveSafe a b c d e u) : False := by
  have ha₂ : 2 ∣ a := dvd_trans (by decide : 2 ∣ 6) ha
  have hb₂ : 2 ∣ b := dvd_trans (by decide : 2 ∣ 6) hb
  have safe₂ := band_multipliers_safe a b c t ht ha₀ ha₁ hb₀ hb₁ 2 (Or.inl rfl)
  have safe₄ := band_multipliers_safe a b c t ht ha₀ ha₁ hb₀ hb₁ 4 (Or.inr rfl)
  norm_num only [Nat.cast_ofNat] at safe₂ safe₄
  have even_shift (v : ℕ) (hv : 2 ∣ v) (s : ℝ) :
      distance ((v : ℝ) * (s + 1 / 2)) = distance ((v : ℝ) * s) := by
    simpa using distance_time_add_of_dvd v 2 (by decide) hv 1 s
  have hfirst : ¬ ((1 / 6 : ℝ) ≤ distance ((d : ℝ) * (2 * t)) ∧
      (1 / 6 : ℝ) ≤ distance ((e : ℝ) * (2 * t))) := by
    intro h
    exact hno (2 * t) ⟨safe₂.1, safe₂.2.1, safe₂.2.2, h⟩
  have hsecond : ¬ ((1 / 6 : ℝ) ≤ distance ((d : ℝ) * (2 * t) + 1 / 2) ∧
      (1 / 6 : ℝ) ≤ distance ((e : ℝ) * (2 * t) + 1 / 2)) := by
    intro h
    apply hno (2 * t + 1 / 2)
    refine ⟨?_, ?_, ?_, ?_, ?_⟩
    · rw [even_shift a ha₂]; exact safe₂.1
    · rw [even_shift b hb₂]; exact safe₂.2.1
    · rw [even_shift c hc]; exact safe₂.2.2
    · rw [odd_half_shift d hd]; exact h.1
    · rw [odd_half_shift e he]; exact h.2
  have hgood := two_odd_phase_improvement ((d : ℝ) * (2 * t))
    ((e : ℝ) * (2 * t)) hfirst hsecond
  apply hno (4 * t + 1 / 2)
  refine ⟨?_, ?_, ?_, ?_, ?_⟩
  · rw [even_shift a ha₂]; exact safe₄.1
  · rw [even_shift b hb₂]; exact safe₄.2.1
  · rw [even_shift c hc]; exact safe₄.2.2
  · rw [odd_half_shift d hd]
    have harg : (d : ℝ) * (4 * t) + 1 / 2 = 2 * ((d : ℝ) * (2 * t)) + 1 / 2 := by ring
    rw [harg]
    exact hgood.1.le
  · rw [odd_half_shift e he]
    have harg : (e : ℝ) * (4 * t) + 1 / 2 = 2 * ((e : ℝ) * (2 * t)) + 1 / 2 := by ring
    rw [harg]
    exact hgood.2.le

theorem ordered_phase_fiber_zero (a b c d e : ℕ)
    (ha₃ : 3 ∣ a) (hb₃ : 3 ∣ b) (hc₃ : c % 3 ≠ 0)
    (hsix : 6 ∣ a ∨ 6 ∣ b)
    (hparity : 2 ∣ a → 2 ∣ b → 2 ∣ c → Odd d ∧ Odd e)
    (t : ℝ) (ht : distance ((c : ℝ) * t + 1 / 6) = 0)
    (hsmall : distance ((a : ℝ) * t) < 1 / 6)
    (horder : distance ((a : ℝ) * t) ≤ distance ((b : ℝ) * t))
    (hmax : ∀ u : ℝ, distance ((c : ℝ) * u + 1 / 6) = 0 →
      min (distance ((a : ℝ) * u)) (distance ((b : ℝ) * u)) ≤ distance ((a : ℝ) * t))
    (hno : ∀ u : ℝ, ¬ FiveSafe a b c d e u) :
    distance ((a : ℝ) * t) = 0 := by
  by_contra hn
  let r := distance ((a : ℝ) * t)
  let s := distance ((b : ℝ) * t)
  have hr₀ : 0 < r := by
    have h : 0 ≤ r := distance_nonneg _
    rcases h.eq_or_lt with h | h
    · exact False.elim (hn h.symm)
    · exact h
  have hr₆ : r < 1 / 6 := hsmall
  have hthree : min (distance (3 * ((a : ℝ) * t)))
      (distance (3 * ((b : ℝ) * t))) ≤ r := by
    obtain ⟨u, hu, hau, hbu⟩ := phase_fiber_odd_multiple a b c ha₃ hb₃ hc₃ t ht 1
    have h := hmax u hu
    rw [hau, hbu] at h
    norm_num only [Nat.cast_one, Nat.cast_ofNat] at h
    exact h
  have hfive : min (distance (5 * ((a : ℝ) * t)))
      (distance (5 * ((b : ℝ) * t))) ≤ r := by
    obtain ⟨u, hu, hau, hbu⟩ := phase_fiber_odd_multiple a b c ha₃ hb₃ hc₃ t ht 2
    have h := hmax u hu
    rw [hau, hbu] at h
    norm_num only [Nat.cast_one, Nat.cast_ofNat] at h
    exact h
  obtain ⟨hr₁₀, hs₀, hs₁⟩ := ordered_phase_band ((a : ℝ) * t) ((b : ℝ) * t)
    hr₀ hr₆ horder hthree hfive
  change (1 / 10 : ℝ) < r at hr₁₀
  change (11 / 30 : ℝ) < s at hs₀
  change s < 7 / 18 at hs₁
  have a2 : r < distance (2 * ((a : ℝ) * t)) := by
    have h := small_multiple_distance_gt 2 (by decide) (by decide) r hr₀ hr₆
    rw [distance_nat_mul_distance 2 ((a : ℝ) * t)] at h
    exact h
  have a3 : r < distance (3 * ((a : ℝ) * t)) := by
    have h := small_multiple_distance_gt 3 (by decide) (by decide) r hr₀ hr₆
    rw [distance_nat_mul_distance 3 ((a : ℝ) * t)] at h
    exact h
  have a2_upper : distance (2 * ((a : ℝ) * t)) ≤ 2 * r := by
    have heq := distance_nat_mul_distance 2 ((a : ℝ) * t)
    norm_num only [Nat.cast_ofNat] at heq
    rw [← heq]
    have hp : 0 ≤ 2 * r := by positivity
    simpa only [Int.cast_zero, sub_zero, abs_of_nonneg hp] using
      distance_le_int (2 * r) 0
  have a2_half : r < 1 / 2 - distance (2 * ((a : ℝ) * t)) := by
    linarith only [a2_upper, hr₆]
  have b2 : r < distance (2 * ((b : ℝ) * t)) := by
    have heq := distance_nat_mul_distance 2 ((b : ℝ) * t)
    norm_num only [Nat.cast_ofNat] at heq
    rw [← heq]
    apply distance_strict_of_cell (k := 0) <;>
      norm_num only [Nat.cast_ofNat, Int.cast_zero, sub_zero] <;>
      linarith only [hr₆, hs₀, hs₁]
  have b2_upper : distance (2 * ((b : ℝ) * t)) ≤ 1 - 2 * s := by
    have heq := distance_nat_mul_distance 2 ((b : ℝ) * t)
    norm_num only [Nat.cast_ofNat] at heq
    rw [← heq]
    have hp : 2 * s - 1 ≤ 0 := by linarith only [hs₁]
    have h := distance_le_int (2 * s) 1
    simpa only [Int.cast_one, abs_of_nonpos hp, neg_sub] using h
  have b2_half : r < 1 / 2 - distance (2 * ((b : ℝ) * t)) := by
    linarith only [b2_upper, hr₆, hs₀]
  have b3_upper : distance (3 * ((b : ℝ) * t)) ≤ r :=
    (min_le_iff.mp hthree).resolve_left (not_le.mpr a3)
  have b3_half : r < 1 / 2 - distance (3 * ((b : ℝ) * t)) := by
    linarith only [b3_upper, hr₆]
  have impossible (u : ℝ) (hu : distance ((c : ℝ) * u + 1 / 6) = 0)
      (hau : r < distance ((a : ℝ) * u)) (hbu : r < distance ((b : ℝ) * u)) : False :=
    not_lt_of_ge (hmax u hu) (lt_min hau hbu)
  rcases nonthree_residues c hc₃ with ⟨σ, q, hσ, hc⟩ | ⟨hc₂, σ, q, hσ, hc⟩
  · have hu : distance ((c : ℝ) * (2 * t + (σ : ℝ) / 6) + 1 / 6) = 0 := by
      apply phase_fiber_affine_six c 2 σ σ q t hc ht
      rcases hσ with rfl | rfl <;> norm_num
    apply impossible _ hu
    · have hcases := sixth_shift_three_cases a ha₃ 2 σ hσ t
      norm_num only [Int.cast_ofNat] at hcases
      rcases hcases with h | h
      · rw [h]; exact a2
      · rw [h]; exact a2_half
    · have hcases := sixth_shift_three_cases b hb₃ 2 σ hσ t
      norm_num only [Int.cast_ofNat] at hcases
      rcases hcases with h | h
      · rw [h]; exact b2
      · rw [h]; exact b2_half
  · by_cases ha₆ : 6 ∣ a
    · by_cases hb₆ : 6 ∣ b
      · obtain ⟨hd, he⟩ := hparity
          (dvd_trans (by decide : 2 ∣ 6) ha₆) (dvd_trans (by decide : 2 ∣ 6) hb₆) hc₂
        exact three_even_fiber_contradiction a b c d e t ha₆ hb₆ hc₂ hd he ht
          hr₁₀ hr₆ hs₀ hs₁ hno
      · have hu : distance ((c : ℝ) * (3 * t + (σ : ℝ) / 6) + 1 / 6) = 0 := by
          apply phase_fiber_affine_six c 3 σ (2 * σ) q t hc ht
          rcases hσ with rfl | rfl <;> norm_num
        apply impossible _ hu
        · have heq := sixth_shift_six a ha₆ 3 σ t
          norm_num only [Int.cast_ofNat] at heq
          rw [heq]
          exact a3
        · have heq := sixth_shift_three b hb₃ hb₆ 3 σ hσ t
          norm_num only [Int.cast_ofNat] at heq
          rw [heq]
          exact b3_half
    · have hb₆ : 6 ∣ b := hsix.resolve_left ha₆
      have hneg : -σ = 1 ∨ -σ = -1 := by rcases hσ with rfl | rfl <;> norm_num
      have hu : distance ((c : ℝ) * (((-1 : ℤ) : ℝ) * t + ((-σ : ℤ) : ℝ) / 6) + 1 / 6) = 0 := by
        apply phase_fiber_affine_six c (-1) (-σ) (2 * σ) q t hc ht
        rcases hσ with rfl | rfl <;> norm_num
      apply impossible _ hu
      · rw [sixth_shift_three a ha₃ ha₆ (-1) (-σ) hneg t]
        norm_num only [Int.cast_neg, Int.cast_one, neg_one_mul]
        rw [CriticalFamilies.distance_neg]
        linarith only [hr₆]
      · rw [sixth_shift_six b hb₆ (-1) (-σ) t]
        norm_num only [Int.cast_neg, Int.cast_one, neg_one_mul]
        rw [CriticalFamilies.distance_neg]
        linarith only [hr₆, hs₀]

end Loneliness.Renault
