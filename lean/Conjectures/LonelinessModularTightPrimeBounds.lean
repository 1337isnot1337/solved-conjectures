import Conjectures.LonelinessModularTightPrimeProducts
import Conjectures.LonelinessModularTightPrimeDataSix
import Conjectures.LonelinessModularTightPrimeDataSeven
import Conjectures.LonelinessModularTightPrimeDataEight
import Conjectures.LonelinessModularTightPrimeDataNine
import Conjectures.LonelinessModularTightPrimeDataTen
import Conjectures.LonelinessModularTightPrimeDataEleven
import Conjectures.LonelinessModularTightPrimeDataTwelve
import Conjectures.LonelinessModularTightPrimeDataThirteen

/-! Assemble separately checked finite prime data. The natural squared-norm
bound is explicit here; the geometric adapters discharge that bound. -/

namespace Loneliness.Modular.TightPrimeBounds

open scoped BigOperators

/-- Primality, coprimality, and the exact integer AM--GM margin. -/
theorem prime_data_valid (k : ℕ) (hk : 6 ≤ k) (hk' : k ≤ 13) :
    (∀ p ∈ primeSet k, p.Prime) ∧
    (forcedDivisor k).Coprime (∏ p ∈ primeSet k, p) ∧
    (squaredNormBound k)^k < k^k * (forcedDivisor k * ∏ p ∈ primeSet k, p)^2 := by
  interval_cases k
  · exact ⟨all_primes_six, coprime_six, margin_six⟩
  · exact ⟨all_primes_seven, coprime_seven, margin_seven⟩
  · exact ⟨all_primes_eight, coprime_eight, margin_eight⟩
  · exact ⟨all_primes_nine, coprime_nine, margin_nine⟩
  · exact ⟨all_primes_ten, coprime_ten, margin_ten⟩
  · exact ⟨all_primes_eleven, coprime_eleven, margin_eleven⟩
  · exact ⟨all_primes_twelve, coprime_twelve, margin_twelve⟩
  · exact ⟨all_primes_thirteen, coprime_thirteen, margin_thirteen⟩

theorem exists_prime_of_tight_bound (k : ℕ) (hk : 6 ≤ k) (hk' : k ≤ 13)
    (v : Fin k → ℕ) (hpositive : ∀ i, 0 < v i)
    (hvalue : value (List.ofFn v) ≤ (1 : ℝ) / ((k : ℝ)+1))
    (hnorm : (∑ i, (v i)^2) ≤ squaredNormBound k) :
    ∃ p ∈ primeSet k, ∀ i, ¬ p ∣ v i := by
  obtain ⟨hprime, hcoprime, hmargin⟩ := prime_data_valid k hk hk'
  exact exists_prime_avoiding_forced_of_tight (by omega) v hpositive hvalue
    (primeSet k) hprime hcoprime
    ((Nat.pow_le_pow_left hnorm k).trans_lt hmargin)

end Loneliness.Modular.TightPrimeBounds
