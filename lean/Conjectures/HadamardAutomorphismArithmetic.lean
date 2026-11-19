import Conjectures.HadamardAutomorphismArithmeticBasic
import Mathlib.Data.Nat.Sqrt
import Mathlib.Tactic.Linarith
import Mathlib.Tactic.IntervalCases

/-! Kernel-checked quadratic-form certificates for the norm obstruction. -/

set_option maxRecDepth 100000
set_option maxHeartbeats 0

namespace HadamardAutomorphism

private def noSquareCheck (C d B : ℕ) : Bool :=
  (List.range B).all (fun b => decide ((Nat.sqrt (C - d * b ^ 2)) ^ 2 ≠ C - d * b ^ 2))

unseal Nat.sqrt.iter in
private theorem prime_no_square_certificate : noSquareCheck (4 * 599) 479 3 = true := by
  decide

unseal Nat.sqrt.iter in
private theorem cube_no_square_certificate : noSquareCheck (4 * 599 ^ 3) 479 1340 = true := by
  decide

private theorem square_excluded_of_sqrt_certificate (a b C d B : ℕ)
    (hb : b < B)
    (hcert : noSquareCheck C d B = true) :
    a ^ 2 + d * b ^ 2 ≠ C := by
  intro h
  have ha : a ^ 2 = C - d * b ^ 2 := by omega
  have hs : Nat.sqrt (C - d * b ^ 2) = a := by rw [← ha, Nat.sqrt_eq']
  have hne : (Nat.sqrt (C - d * b ^ 2)) ^ 2 ≠ C - d * b ^ 2 := by
    have hall := List.all_eq_true.mp hcert
    exact of_decide_eq_true (hall b (List.mem_range.mpr hb))
  exact hne (by simpa only [hs] using ha)

theorem no_norm_prime_nat (a b : ℕ) : a ^ 2 + 479 * b ^ 2 ≠ 4 * 599 := by
  intro h
  have hb : b < 3 := by
    by_contra hb
    have hb' : 3 ≤ b := by omega
    have hsq := Nat.pow_le_pow_left hb' 2
    nlinarith
  exact square_excluded_of_sqrt_certificate a b (4 * 599) 479 3 hb
    prime_no_square_certificate h

theorem no_norm_cube_nat (a b : ℕ) : a ^ 2 + 479 * b ^ 2 ≠ 4 * 599 ^ 3 := by
  intro h
  have hb : b < 1340 := by
    by_contra hb
    have hb' : 1340 ≤ b := by omega
    have hsq := Nat.pow_le_pow_left hb' 2
    nlinarith
  exact square_excluded_of_sqrt_certificate a b (4 * 599 ^ 3) 479 1340 hb
    cube_no_square_certificate h

theorem no_norm_prime (a b : ℤ) : a ^ 2 + 479 * b ^ 2 ≠ 4 * 599 := by
  intro h
  have hh : (a.natAbs : ℤ) ^ 2 + 479 * (b.natAbs : ℤ) ^ 2 = 4 * 599 := by
    simpa only [Int.natAbs_pow_two] using h
  have hN : a.natAbs ^ 2 + 479 * b.natAbs ^ 2 = 4 * 599 := by exact_mod_cast hh
  exact no_norm_prime_nat _ _ hN

theorem no_norm_cube (a b : ℤ) : a ^ 2 + 479 * b ^ 2 ≠ 4 * 599 ^ 3 := by
  intro h
  have hh : (a.natAbs : ℤ) ^ 2 + 479 * (b.natAbs : ℤ) ^ 2 = 4 * 599 ^ 3 := by
    simpa only [Int.natAbs_pow_two] using h
  have hN : a.natAbs ^ 2 + 479 * b.natAbs ^ 2 = 4 * 599 ^ 3 := by exact_mod_cast hh
  exact no_norm_cube_nat _ _ hN

theorem norm_fifth_witness :
    (8054400 : ℤ) ^ 2 + 479 * 159859 ^ 2 = 599 ^ 5 ∧
      ¬ (599 : ℤ) ∣ 8054400 ∧ ¬ (599 : ℤ) ∣ 159859 := by norm_num

theorem class_exponent_obstruction (a : ℤ) (ha0 : 0 ≤ a) (ha3 : a ≤ 3) :
    ¬ (5 : ℤ) ∣ 239 * (2 * a - 3) := by
  interval_cases a <;> norm_num

theorem class_exponent_sum_three (a b : ℤ) (ha : 0 ≤ a) (hb : 0 ≤ b)
    (hsum : a + b = 3) : ¬ (5 : ℤ) ∣ 239 * (a - b) := by
  have h := class_exponent_obstruction a ha (by omega)
  have heq : a - b = 2 * a - 3 := by omega
  simpa only [heq] using h

end HadamardAutomorphism
