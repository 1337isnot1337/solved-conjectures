import Conjectures.LonelinessCriticalBase

/-! Exact rational orbit points obtained from the integer Bézout identity. -/

namespace Loneliness.Renault

theorem gcd_orbit_point (a b : ℕ) (hb : 0 < b) (j : ℕ)
    (hj : j < b / Nat.gcd a b) :
    ∃ t : ℝ, Int.fract ((b : ℝ) * t) = 0 ∧
      Int.fract ((a : ℝ) * t) = (j : ℝ) / (b / Nat.gcd a b : ℕ) := by
  let g : ℕ := Nat.gcd a b
  let q : ℕ := b / g
  have hq : 0 < q := Nat.div_gcd_pos_of_pos_right a hb
  have hbR : (0 : ℝ) < b := by exact_mod_cast hb
  have hqR : (0 : ℝ) < q := by exact_mod_cast hq
  have hfactor : g * q = b := Nat.mul_div_cancel' (Nat.gcd_dvd_right a b)
  have hfactorR : (g : ℝ) * q = b := by exact_mod_cast hfactor
  have hbezout : (g : ℤ) = (a : ℤ) * Nat.gcdA a b + (b : ℤ) * Nat.gcdB a b :=
    Nat.gcd_eq_gcd_ab a b
  let k : ℤ := (j : ℤ) * Nat.gcdA a b
  let z : ℤ := -(j : ℤ) * Nat.gcdB a b
  have hmul : (a : ℤ) * k = (j : ℤ) * g + (b : ℤ) * z := by
    dsimp [k, z]
    nlinarith [congrArg (fun x : ℤ => (j : ℤ) * x) hbezout]
  have hmulR : (a : ℝ) * k = (j : ℝ) * g + (b : ℝ) * z := by exact_mod_cast hmul
  have hratio : (g : ℝ) / b = 1 / (q : ℝ) := by
    apply (div_eq_div_iff hbR.ne' hqR.ne').mpr
    simpa using hfactorR
  let t : ℝ := (k : ℝ) / b
  have hbt : (b : ℝ) * t = k := by dsimp [t]; field_simp
  have hat : (a : ℝ) * t = (j : ℝ) / q + z := by
    calc
      (a : ℝ) * t = ((a : ℝ) * k) / b := by dsimp [t]; ring
      _ = ((j : ℝ) * g + (b : ℝ) * z) / b := by rw [hmulR]
      _ = (j : ℝ) * ((g : ℝ) / b) + z := by field_simp
      _ = (j : ℝ) / q + z := by rw [hratio]; ring
  refine ⟨t, ?_, ?_⟩
  · rw [hbt, Int.fract_intCast]
  · change Int.fract ((a : ℝ) * t) = (j : ℝ) / q
    rw [hat, Int.fract_add_intCast]
    apply Int.fract_eq_self.mpr
    constructor
    · positivity
    · apply (div_lt_one hqR).mpr
      exact_mod_cast hj

end Loneliness.Renault
