import Mathlib.Data.ZMod.Basic
import Mathlib.Data.Nat.Prime.Basic
import Lean.Elab.Tactic.Omega
import Mathlib.Tactic.Ring

namespace Loneliness.PrimeFilteringTwoHigher

theorem exists_coprime_multiplier {N u target : ℕ} (hN : 0 < N)
    (hu : Nat.Coprime u N) (ht : Nat.Coprime target N) :
    ∃ a : ℕ, Nat.Coprime a N ∧ (a * u) % N = target % N := by
  let : NeZero N := ⟨by omega⟩
  let v := ZMod.unitOfCoprime target ht * (ZMod.unitOfCoprime u hu)⁻¹
  have hv : v * ZMod.unitOfCoprime u hu = ZMod.unitOfCoprime target ht := by
    simp [v, mul_assoc]
  have hval := congrArg (fun w : (ZMod N)ˣ => (w : ZMod N)) hv
  simp only [Units.val_mul, ZMod.coe_unitOfCoprime] at hval
  refine ⟨(v : ZMod N).val, ZMod.val_coe_unit_coprime v, ?_⟩
  apply (ZMod.natCast_eq_natCast_iff' _ _ _).mp
  rw [Nat.cast_mul, ZMod.natCast_zmod_val]
  exact hval

theorem coprime_seven_power {u : ℕ} (hu : u % 7 ≠ 0) (n : ℕ) :
    Nat.Coprime u (7 ^ n) := by
  have h : Nat.Coprime 7 u :=
    (Nat.Prime.coprime_iff_not_dvd (by decide : Nat.Prime 7)).2
      (fun h => hu (Nat.mod_eq_zero_of_dvd h))
  exact h.symm.pow_right n

theorem exists_lower_level_target {i m u : ℕ} (him : i < m) (hu : u % 7 ≠ 0) :
    ∃ a : ℕ, Nat.Coprime a (7 ^ (m + 1)) ∧
      (a * (7 ^ i * u)) % 7 ^ (m + 1) = 7 ^ i + 7 ^ m := by
  have hm : 7 ^ (m - i) % 7 = 0 := by
    apply Nat.mod_eq_zero_of_dvd
    have h := Nat.pow_dvd_pow 7 (show 1 ≤ m - i by omega)
    simpa only [pow_one] using h
  have ht : (1 + 7 ^ (m - i)) % 7 ≠ 0 := by
    rw [Nat.add_mod, hm]
    decide
  obtain ⟨a, ha, hmod⟩ := exists_coprime_multiplier (Nat.pow_pos (by decide))
    (coprime_seven_power hu (m + 1)) (coprime_seven_power ht (m + 1))
  refine ⟨a, ha, ?_⟩
  have he : 7 ^ i * (1 + 7 ^ (m - i)) = 7 ^ i + 7 ^ m := by
    have hexp : i + (m - i) = m := by omega
    rw [Nat.mul_add, Nat.mul_one, ← pow_add, hexp]
  have hi : 7 ^ i ≤ 7 ^ m := Nat.pow_le_pow_right (by decide) (by omega)
  have hlt : 7 ^ i + 7 ^ m < 7 ^ (m + 1) := by
    rw [pow_succ]
    have hp : 0 < 7 ^ m := Nat.pow_pos (by decide)
    omega
  calc
    (a * (7 ^ i * u)) % 7 ^ (m + 1) =
        (7 ^ i * (a * u)) % 7 ^ (m + 1) := by congr 1; ring
    _ = (7 ^ i * (1 + 7 ^ (m - i))) % 7 ^ (m + 1) := by
        rw [Nat.mul_mod, hmod, ← Nat.mul_mod]
    _ = (7 ^ i + 7 ^ m) % 7 ^ (m + 1) := by rw [he]
    _ = 7 ^ i + 7 ^ m := Nat.mod_eq_of_lt hlt

theorem lower_level_target_multiples {i m x : ℕ} (him : i < m)
    (hx : x % 7 ^ (m + 1) = 7 ^ i + 7 ^ m)
    {j : ℕ} (hj : 1 ≤ j) (hj5 : j ≤ 5) :
    7 ^ m ≤ min ((j * x) % 7 ^ (m + 1))
      (7 ^ (m + 1) - (j * x) % 7 ^ (m + 1)) := by
  have hi : 7 ^ i * 7 ≤ 7 ^ m := by
    rw [← pow_succ]
    exact Nat.pow_le_pow_right (by decide) (by omega)
  have hlo : 7 ^ m ≤ j * (7 ^ i + 7 ^ m) := by
    have h := Nat.mul_le_mul_right (7 ^ i + 7 ^ m) hj
    omega
  have hhi : j * (7 ^ i + 7 ^ m) ≤ 6 * 7 ^ m := by
    have h := Nat.mul_le_mul_right (7 ^ i + 7 ^ m) hj5
    omega
  have hp : 0 < 7 ^ m := Nat.pow_pos (by decide)
  have hlt : j * (7 ^ i + 7 ^ m) < 7 ^ (m + 1) := by
    rw [pow_succ]
    omega
  have he : (j * x) % 7 ^ (m + 1) = j * (7 ^ i + 7 ^ m) := by
    rw [← Nat.mul_mod_mod j x (7 ^ (m + 1)), hx, Nat.mod_eq_of_lt hlt]
  rw [he, pow_succ]
  exact le_min hlo (by omega)

theorem top_level_folded (m q : ℕ) (hq : q % 7 ≠ 0) :
    7 ^ m ≤ min ((7 ^ m * q) % 7 ^ (m + 1))
      (7 ^ (m + 1) - (7 ^ m * q) % 7 ^ (m + 1)) := by
  have hsmall : q % 7 < 7 := Nat.mod_lt _ (by decide)
  have hlo := Nat.mul_le_mul_left (7 ^ m) (show 1 ≤ q % 7 by omega)
  have hhi := Nat.mul_le_mul_left (7 ^ m) (show q % 7 ≤ 6 by omega)
  rw [pow_succ, Nat.mul_mod_mul_left]
  exact le_min (by simpa only [Nat.mul_one] using hlo) (by omega)

end Loneliness.PrimeFilteringTwoHigher
