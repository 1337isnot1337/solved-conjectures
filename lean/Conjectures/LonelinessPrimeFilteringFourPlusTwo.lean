import Conjectures.LonelinessPrimeFilteringFourArithmetic
import Conjectures.LonelinessPrimeFilteringTwoHigherPair

namespace Loneliness.PrimeFilteringTwoHigher

theorem coprime_seven_power_mod_ne {a m : ℕ}
    (ha : Nat.Coprime a (7 ^ (m + 1))) : a % 7 ≠ 0 := by
  have hdiv : 7 ∣ 7 ^ (m + 1) := by
    simpa only [pow_one] using Nat.pow_dvd_pow 7 (show 1 ≤ m + 1 by omega)
  have ha7 : Nat.Coprime a 7 := Nat.Coprime.of_dvd_right hdiv ha
  intro hz
  exact (Nat.Prime.coprime_iff_not_dvd (by decide : Nat.Prime 7)).mp ha7.symm
    (Nat.dvd_of_mod_eq_zero hz)

theorem four_plus_two_grid {i m u v : ℕ} (hi : 1 ≤ i) (him : i ≤ m)
    (hu : u % 7 ≠ 0) (hv : v % 7 ≠ 0)
    (ns : Fin 4 → ℕ) (hn : ∀ x, ns x % 7 ≠ 0) :
    ∃ a : ℕ, Nat.Coprime a (7 ^ (m + 1)) ∧
      (∀ x : Fin 4, 7 ^ m ≤ min ((a * ns x) % 7 ^ (m + 1))
        (7 ^ (m + 1) - (a * ns x) % 7 ^ (m + 1))) ∧
      (7 ^ m ≤ min ((a * (7 ^ i * u)) % 7 ^ (m + 1))
        (7 ^ (m + 1) - (a * (7 ^ i * u)) % 7 ^ (m + 1))) ∧
      (7 ^ m ≤ min ((a * (7 ^ m * v)) % 7 ^ (m + 1))
        (7 ^ (m + 1) - (a * (7 ^ m * v)) % 7 ^ (m + 1))) := by
  obtain ⟨a, ha, hseed⟩ := two_level_seed him hu hv
  have hunit : ∀ x : Fin 4, (a * ns x) % 7 ≠ 0 := by
    intro x
    exact coprime_seven_power_mod_ne (ha.mul_left (coprime_seven_power (hn x) (m + 1)))
  obtain ⟨j, k, hb, hlow, hpreserve⟩ :=
    PrimeFilteringFourProfiles.four_prime_power_filter m (fun x => a * ns x) hunit
  let b := j.val + 1 + k.val * 7 ^ m
  have hpi : 7 ∣ 7 ^ i := by
    simpa only [pow_one] using Nat.pow_dvd_pow 7 hi
  have hpm : 7 ∣ 7 ^ m := by
    simpa only [pow_one] using Nat.pow_dvd_pow 7 (show 1 ≤ m by omega)
  have hdi : 7 ∣ a * (7 ^ i * u) :=
    dvd_mul_of_dvd_right (dvd_mul_of_dvd_left hpi u) a
  have hdm : 7 ∣ a * (7 ^ m * v) :=
    dvd_mul_of_dvd_right (dvd_mul_of_dvd_left hpm v) a
  have hj : j.val + 1 ≤ 5 := by have h := j.isLt; omega
  have hs := hseed (j.val + 1) (by omega) hj
  refine ⟨b * a, hb.mul_left ha, ?_, ?_, ?_⟩
  · intro x
    simpa only [Nat.mul_assoc] using hlow x
  · have he : (b * a * (7 ^ i * u)) % 7 ^ (m + 1) =
        ((j.val + 1) * (a * (7 ^ i * u))) % 7 ^ (m + 1) := by
      simpa only [Nat.mul_assoc] using hpreserve (a * (7 ^ i * u)) hdi
    rw [he]
    exact hs.1
  · have he : (b * a * (7 ^ m * v)) % 7 ^ (m + 1) =
        ((j.val + 1) * (a * (7 ^ m * v))) % 7 ^ (m + 1) := by
      simpa only [Nat.mul_assoc] using hpreserve (a * (7 ^ m * v)) hdm
    rw [he]
    exact hs.2

end Loneliness.PrimeFilteringTwoHigher
