import Conjectures.LonelinessRenaultTwoMultiples
import Conjectures.LonelinessRenaultPhaseCells

/-! Universal phase comparisons in Renault's two-multiples-of-three case.
Every comparison concerns real phases; no finite sampling is used here. -/

namespace Loneliness.Renault

private theorem distance_int_zero (z : ℤ) : distance (z : ℝ) = 0 := by
  apply le_antisymm ?_ (distance_nonneg _)
  simpa only [sub_self, abs_zero] using distance_le_int (z : ℝ) z

theorem small_multiple_distance_gt (a : ℕ) (ha₂ : 2 ≤ a) (ha₅ : a ≤ 5)
    (x : ℝ) (hx₀ : 0 < x) (hx₆ : x < 1 / 6) :
    x < distance ((a : ℝ) * x) := by
  have ha₂R : (2 : ℝ) ≤ a := by exact_mod_cast ha₂
  have ha₅R : (a : ℝ) ≤ 5 := by exact_mod_cast ha₅
  have hlo := mul_le_mul_of_nonneg_right ha₂R hx₀.le
  have hhi := mul_le_mul_of_nonneg_right ha₅R hx₀.le
  apply distance_strict_of_cell (k := 0) <;>
    norm_num only [Int.cast_zero, sub_zero] <;> linarith

theorem ordered_phase_band (x y : ℝ)
    (hx₀ : 0 < distance x) (hx₆ : distance x < 1 / 6)
    (hxy : distance x ≤ distance y)
    (h₃ : min (distance (3 * x)) (distance (3 * y)) ≤ distance x)
    (h₅ : min (distance (5 * x)) (distance (5 * y)) ≤ distance x) :
    (1 / 10 : ℝ) < distance x ∧
      (11 / 30 : ℝ) < distance y ∧ distance y < 7 / 18 := by
  have h3x : distance x < distance (3 * x) := by
    have h := small_multiple_distance_gt 3 (by decide) (by decide) (distance x) hx₀ hx₆
    rw [distance_nat_mul_distance 3 x] at h
    exact h
  have h5x : distance x < distance (5 * x) := by
    have h := small_multiple_distance_gt 5 (by decide) (by decide) (distance x) hx₀ hx₆
    rw [distance_nat_mul_distance 5 x] at h
    exact h
  have h3y : distance (3 * distance y) ≤ distance x := by
    have h : distance (3 * y) ≤ distance x :=
      (min_le_iff.mp h₃).resolve_left (not_le.mpr h3x)
    rw [show distance (3 * distance y) = distance (3 * y) from
      distance_nat_mul_distance 3 y]
    exact h
  have h5y : distance (5 * distance y) ≤ distance x := by
    have h : distance (5 * y) ≤ distance x :=
      (min_le_iff.mp h₅).resolve_left (not_le.mpr h5x)
    rw [show distance (5 * distance y) = distance (5 * y) from
      distance_nat_mul_distance 5 y]
    exact h
  exact three_five_distance_band (distance x) (distance y) hx₀ hx₆ hxy
    (distance_le_half y) h3y h5y

theorem phase_fiber_affine_six (c : ℕ) (a b e q : ℤ) (t : ℝ)
    (hc : (c : ℤ) = e + 6 * q)
    (ht : distance ((c : ℝ) * t + 1 / 6) = 0)
    (hres : (6 : ℤ) ∣ 1 - a + e * b) :
    distance ((c : ℝ) * ((a : ℝ) * t + b / 6) + 1 / 6) = 0 := by
  obtain ⟨k, hk⟩ := hres
  have hcR : (c : ℝ) = e + 6 * q := by exact_mod_cast hc
  have hkR : (1 : ℝ) - a + (e : ℝ) * b = 6 * k := by exact_mod_cast hk
  have htR : (c : ℝ) * t + 1 / 6 = (round ((c : ℝ) * t + 1 / 6) : ℝ) :=
    sub_eq_zero.mp (abs_eq_zero.mp ht)
  have hform : (c : ℝ) * ((a : ℝ) * t + b / 6) + 1 / 6 =
      (a : ℝ) * ((c : ℝ) * t + 1 / 6) + k + ((q * b : ℤ) : ℝ) := by
    push_cast
    calc
      (c : ℝ) * ((a : ℝ) * t + b / 6) + 1 / 6 =
          (a : ℝ) * ((c : ℝ) * t + 1 / 6) +
            (1 - (a : ℝ) + (e : ℝ) * b) / 6 + (q : ℝ) * b := by
        rw [hcR]
        ring
      _ = _ := by rw [hkR]; ring
  rw [hform, htR]
  have hint : (a : ℝ) * (round ((c : ℝ) * t + 1 / 6) : ℝ) + k +
      ((q * b : ℤ) : ℝ) =
      ((a * round ((c : ℝ) * t + 1 / 6) + k + q * b : ℤ) : ℝ) := by
    push_cast
    ring
  rw [hint]
  exact distance_int_zero _

theorem phase_fiber_odd_multiple (a b c : ℕ)
    (ha : 3 ∣ a) (hb : 3 ∣ b) (hc : c % 3 ≠ 0)
    (t : ℝ) (ht : distance ((c : ℝ) * t + 1 / 6) = 0) (q : ℕ) :
    ∃ s : ℝ, distance ((c : ℝ) * s + 1 / 6) = 0 ∧
      distance ((a : ℝ) * s) = distance ((2 * (q : ℝ) + 1) * ((a : ℝ) * t)) ∧
      distance ((b : ℝ) * s) = distance ((2 * (q : ℝ) + 1) * ((b : ℝ) * t)) := by
  have htR : (c : ℝ) * t + 1 / 6 = (round ((c : ℝ) * t + 1 / 6) : ℝ) :=
    sub_eq_zero.mp (abs_eq_zero.mp ht)
  have build (j k : ℕ)
      (hform : (c : ℝ) * ((2 * (q : ℝ) + 1) * t + j / 3) + 1 / 6 =
        (2 * (q : ℝ) + 1) * ((c : ℝ) * t + 1 / 6) + k) :
      ∃ s : ℝ, distance ((c : ℝ) * s + 1 / 6) = 0 ∧
        distance ((a : ℝ) * s) = distance ((2 * (q : ℝ) + 1) * ((a : ℝ) * t)) ∧
        distance ((b : ℝ) * s) = distance ((2 * (q : ℝ) + 1) * ((b : ℝ) * t)) := by
    refine ⟨(2 * (q : ℝ) + 1) * t + j / 3, ?_, ?_, ?_⟩
    · rw [hform, htR]
      have hint : (2 * (q : ℝ) + 1) * (round ((c : ℝ) * t + 1 / 6) : ℝ) + k =
          (((2 * (q : ℤ) + 1) * round ((c : ℝ) * t + 1 / 6) + k : ℤ) : ℝ) := by
        push_cast
        ring
      rw [hint]
      exact distance_int_zero _
    · have h := distance_time_add_of_dvd a 3 (by decide) ha (j : ℤ)
        ((2 * (q : ℝ) + 1) * t)
      simp only [Int.cast_natCast, Nat.cast_ofNat] at h
      rw [h]
      congr 1
      ring
    · have h := distance_time_add_of_dvd b 3 (by decide) hb (j : ℤ)
        ((2 * (q : ℝ) + 1) * t)
      simp only [Int.cast_natCast, Nat.cast_ofNat] at h
      rw [h]
      congr 1
      ring
  have hmod : c % 3 = 1 ∨ c % 3 = 2 := by omega
  rcases hmod with he | he
  · apply build q ((c / 3) * q)
    have hcR : (c : ℝ) = 3 * ((c / 3 : ℕ) : ℝ) + 1 := by
      exact_mod_cast (show c = 3 * (c / 3) + 1 by omega)
    push_cast
    rw [hcR]
    ring
  · apply build (2 * q) ((2 * (c / 3) + 1) * q)
    have hcR : (c : ℝ) = 3 * ((c / 3 : ℕ) : ℝ) + 2 := by
      exact_mod_cast (show c = 3 * (c / 3) + 2 by omega)
    push_cast
    rw [hcR]
    ring

theorem phase_fiber_multiplier_distance (c : ℕ) (t : ℝ)
    (ht : distance ((c : ℝ) * t + 1 / 6) = 0) (m : ℕ) :
    distance ((c : ℝ) * ((m : ℝ) * t)) = distance ((m : ℝ) / 6) := by
  have htR : (c : ℝ) * t + 1 / 6 = (round ((c : ℝ) * t + 1 / 6) : ℝ) :=
    sub_eq_zero.mp (abs_eq_zero.mp ht)
  have harg : (c : ℝ) * ((m : ℝ) * t) = -((m : ℝ) / 6) +
      (((m : ℤ) * round ((c : ℝ) * t + 1 / 6) : ℤ) : ℝ) := by
    push_cast
    rw [← htR]
    ring
  rw [harg, CriticalFamilies.distance_add_int, CriticalFamilies.distance_neg]

end Loneliness.Renault
