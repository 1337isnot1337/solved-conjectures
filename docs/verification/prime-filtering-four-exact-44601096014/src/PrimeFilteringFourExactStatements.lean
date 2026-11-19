import Conjectures.LonelinessPrimeFilteringFourArithmetic

open Loneliness.PrimeFilteringFourProfiles

example {M : ℕ} (hM : 0 < M) (ns : Fin 4 → ℕ) (hn : ∀ i, ns i % 7 ≠ 0) :
    ∃ (j : Fin 5) (k : Fin 7), ∀ i : Fin 4,
      ((j.val + 1 + k.val * M) * ns i / M) % 7 ≠ 0 ∧
      ((j.val + 1 + k.val * M) * ns i / M) % 7 ≠ 6 :=
  four_filter hM ns hn

example (m : ℕ) (ns : Fin 4 → ℕ) (hn : ∀ i, ns i % 7 ≠ 0) :
    ∃ (j : Fin 5) (k : Fin 7),
      Nat.Coprime (j.val + 1 + k.val * 7 ^ m) (7 ^ (m + 1)) ∧
      (∀ i : Fin 4, 7 ^ m ≤
        min (((j.val + 1 + k.val * 7 ^ m) * ns i) % 7 ^ (m + 1))
          (7 ^ (m + 1) - ((j.val + 1 + k.val * 7 ^ m) * ns i) % 7 ^ (m + 1))) ∧
      (∀ d : ℕ, 7 ∣ d →
        ((j.val + 1 + k.val * 7 ^ m) * d) % 7 ^ (m + 1) =
          ((j.val + 1) * d) % 7 ^ (m + 1)) :=
  four_prime_power_filter m ns hn

example {M x : ℕ} (hM : 0 < M)
    (h0 : (x / M) % 7 ≠ 0) (h6 : (x / M) % 7 ≠ 6) :
    M ≤ min (x % (7 * M)) (7 * M - x % (7 * M)) :=
  folded_bound_of_quotient hM h0 h6

example (M j k d : ℕ) (hd : 7 ∣ d) :
    ((j + k * M) * d) % (7 * M) = (j * d) % (7 * M) :=
  shifted_residue_of_seven_dvd M j k d hd
