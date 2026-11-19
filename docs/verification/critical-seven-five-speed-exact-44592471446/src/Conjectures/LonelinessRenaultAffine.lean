import Conjectures.LonelinessCriticalBase

/-! Integer-affine phase identities for the sixth-shift arguments in
Renault's five-speed proof. The signed residue equality is an explicit
integer equality, so every identity also covers negative shifts. -/

namespace Loneliness.Renault

private theorem time_affine_six_eq (v : ℕ) (a b e q : ℤ) (t : ℝ)
    (hv : (v : ℤ) = e + 6 * q) :
    (v : ℝ) * ((a : ℝ) * t + b / 6) =
      (a : ℝ) * ((v : ℝ) * t) + (e : ℝ) * b / 6 + ((q * b : ℤ) : ℝ) := by
  have hvR : (v : ℝ) = e + 6 * q := by exact_mod_cast hv
  push_cast
  rw [hvR]
  ring

theorem distance_time_affine_six (v : ℕ) (a b e q : ℤ) (t : ℝ)
    (hv : (v : ℤ) = e + 6 * q) :
    distance ((v : ℝ) * ((a : ℝ) * t + b / 6)) =
      distance ((a : ℝ) * ((v : ℝ) * t) + (e : ℝ) * b / 6) := by
  rw [time_affine_six_eq v a b e q t hv, CriticalFamilies.distance_add_int]

theorem fract_time_affine_six (v : ℕ) (a b e q : ℤ) (t : ℝ)
    (hv : (v : ℤ) = e + 6 * q) :
    Int.fract ((v : ℝ) * ((a : ℝ) * t + b / 6)) =
      Int.fract ((a : ℝ) * ((v : ℝ) * t) + (e : ℝ) * b / 6) := by
  rw [time_affine_six_eq v a b e q t hv, Int.fract_add_intCast]

theorem fract_int_mul_fract (a : ℤ) (x : ℝ) :
    Int.fract ((a : ℝ) * Int.fract x) = Int.fract ((a : ℝ) * x) := by
  apply Int.fract_eq_fract.mpr
  refine ⟨-a * ⌊x⌋, ?_⟩
  simp only [Int.fract, Int.cast_mul, Int.cast_neg]
  ring

theorem fract_nat_mul_fract (a : ℕ) (x : ℝ) :
    Int.fract ((a : ℝ) * Int.fract x) = Int.fract ((a : ℝ) * x) := by
  exact_mod_cast fract_int_mul_fract (a : ℤ) x

private theorem time_add_of_dvd_eq (v d : ℕ) (hd : 0 < d)
    (k : ℕ) (hv : v = d * k) (b : ℤ) (t : ℝ) :
    (v : ℝ) * (t + (b : ℝ) / d) = (v : ℝ) * t + ((k : ℤ) * b : ℤ) := by
  have hdR : (d : ℝ) ≠ 0 := by positivity
  rw [hv]
  push_cast
  field_simp

theorem distance_time_add_of_dvd (v d : ℕ) (hd : 0 < d)
    (hv : d ∣ v) (b : ℤ) (t : ℝ) :
    distance ((v : ℝ) * (t + (b : ℝ) / d)) = distance ((v : ℝ) * t) := by
  obtain ⟨k, hk⟩ := hv
  rw [time_add_of_dvd_eq v d hd k hk b t, CriticalFamilies.distance_add_int]

theorem fract_time_add_of_dvd (v d : ℕ) (hd : 0 < d)
    (hv : d ∣ v) (b : ℤ) (t : ℝ) :
    Int.fract ((v : ℝ) * (t + (b : ℝ) / d)) = Int.fract ((v : ℝ) * t) := by
  obtain ⟨k, hk⟩ := hv
  rw [time_add_of_dvd_eq v d hd k hk b t, Int.fract_add_intCast]

end Loneliness.Renault
