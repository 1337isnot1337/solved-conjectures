import Conjectures.LonelinessPrimeFilteringFourFinite
import Mathlib.Data.Nat.Prime.Basic

namespace Loneliness.PrimeFilteringFourProfiles

theorem folded_bound_of_quotient {M x : ℕ} (hM : 0 < M)
    (h0 : (x / M) % 7 ≠ 0) (h6 : (x / M) % 7 ≠ 6) :
    M ≤ min (x % (7 * M)) (7 * M - x % (7 * M)) := by
  let r := x % (7 * M)
  have hd : r / M = (x / M) % 7 := Nat.mod_mul_left_div_self x M 7
  have hr : r / M ≤ 5 := by
    have h := Nat.mod_lt (x / M) (by decide : 0 < 7)
    omega
  have hlo : M ≤ r := by
    by_contra h
    have hz : r / M = 0 := Nat.div_eq_of_lt (by omega)
    omega
  have hhi : r < 6 * M := calc
    r < M * (r / M + 1) := Nat.lt_mul_div_succ r hM
    _ ≤ M * 6 := Nat.mul_le_mul_left M (by omega)
    _ = 6 * M := Nat.mul_comm M 6
  exact le_min hlo (by dsimp [r] at *; omega)

theorem shifted_multiplier_coprime (m : ℕ) (j : Fin 5) (k : Fin 7)
    (n : ℕ) (h0 : ((j.val + 1 + k.val * 7 ^ m) * n / 7 ^ m) % 7 ≠ 0) :
    Nat.Coprime (j.val + 1 + k.val * 7 ^ m) (7 ^ (m + 1)) := by
  have hb : (j.val + 1 + k.val * 7 ^ m) % 7 ≠ 0 := by
    cases m with
    | zero =>
        simp only [pow_zero, Nat.div_one] at h0
        intro h
        simp only [pow_zero] at h
        have hz : ((j.val + 1 + k.val * 1) * n) % 7 = 0 := by
          rw [Nat.mul_mod, h]
          simp
        exact h0 hz
    | succ m =>
        have hm : 7 ^ (m + 1) % 7 = 0 := by
          rw [pow_succ, Nat.mul_mod]
          simp
        rw [Nat.add_mod, Nat.mul_mod, hm]
        simp only [Nat.mul_zero, Nat.zero_mod, Nat.add_zero, Nat.mod_mod]
        have hj := j.isLt
        omega
  have hcop : Nat.Coprime 7 (j.val + 1 + k.val * 7 ^ m) :=
    (Nat.Prime.coprime_iff_not_dvd (by decide : Nat.Prime 7)).2
      (fun h => hb (Nat.mod_eq_zero_of_dvd h))
  exact hcop.symm.pow_right (m + 1)

theorem shifted_residue_of_seven_dvd (M j k d : ℕ) (hd : 7 ∣ d) :
    ((j + k * M) * d) % (7 * M) = (j * d) % (7 * M) := by
  obtain ⟨e, rfl⟩ := hd
  have he : (j + k * M) * (7 * e) = j * (7 * e) + k * e * (7 * M) := by
    ring
  rw [he, Nat.add_mul_mod_self_right]

theorem four_prime_power_filter_of_canonical_checks
    (h : ∀ f : Fin 10, canonicalCheck f = true)
    (m : ℕ) (ns : Fin 4 → ℕ) (hn : ∀ i, ns i % 7 ≠ 0) :
    ∃ (j : Fin 5) (k : Fin 7),
      Nat.Coprime (j.val + 1 + k.val * 7 ^ m) (7 ^ (m + 1)) ∧
      (∀ i : Fin 4, 7 ^ m ≤
        min (((j.val + 1 + k.val * 7 ^ m) * ns i) % 7 ^ (m + 1))
          (7 ^ (m + 1) - ((j.val + 1 + k.val * 7 ^ m) * ns i) % 7 ^ (m + 1))) ∧
      (∀ d : ℕ, 7 ∣ d →
        ((j.val + 1 + k.val * 7 ^ m) * d) % 7 ^ (m + 1) =
          ((j.val + 1) * d) % 7 ^ (m + 1)) := by
  have hM : 0 < 7 ^ m := Nat.pow_pos (by decide)
  obtain ⟨j, k, hs⟩ := four_filter_of_canonical_checks h hM ns hn
  refine ⟨j, k, shifted_multiplier_coprime m j k (ns 0) (hs 0).1, ?_, ?_⟩
  · intro i
    have hf := folded_bound_of_quotient hM (hs i).1 (hs i).2
    simpa only [pow_succ, Nat.mul_comm 7] using hf
  · intro d hd
    have hr := shifted_residue_of_seven_dvd (7 ^ m) (j.val + 1) k.val d hd
    simpa only [pow_succ, Nat.mul_comm 7] using hr

theorem four_prime_power_filter
    (m : ℕ) (ns : Fin 4 → ℕ) (hn : ∀ i, ns i % 7 ≠ 0) :
    ∃ (j : Fin 5) (k : Fin 7),
      Nat.Coprime (j.val + 1 + k.val * 7 ^ m) (7 ^ (m + 1)) ∧
      (∀ i : Fin 4, 7 ^ m ≤
        min (((j.val + 1 + k.val * 7 ^ m) * ns i) % 7 ^ (m + 1))
          (7 ^ (m + 1) - ((j.val + 1 + k.val * 7 ^ m) * ns i) % 7 ^ (m + 1))) ∧
      (∀ d : ℕ, 7 ∣ d →
        ((j.val + 1 + k.val * 7 ^ m) * d) % 7 ^ (m + 1) =
          ((j.val + 1) * d) % 7 ^ (m + 1)) :=
  four_prime_power_filter_of_canonical_checks canonical_checks_verified m ns hn

end Loneliness.PrimeFilteringFourProfiles
