import Conjectures.LonelinessModularForcedDivisor
import Conjectures.LonelinessPrefixProductTables

/-! Exact norm ceilings and the selected finite prime lists for the tight
six- through thirteen-speed reductions. The geometric norm estimate is an
explicit input here and is discharged in `LonelinessTightNormBounds`. -/

namespace Loneliness.Modular.TightPrimeBounds

open scoped BigOperators

set_option maxRecDepth 16384
set_option maxHeartbeats 0

/-- Integer ceiling obtained from the checked rational product bound. -/
def squaredNormBound : ℕ → ℕ
  | 6 => 34333151
  | 7 => 5143824000
  | 8 => 1111407829944
  | 9 => 333055029458264
  | 10 => 134109197352809224
  | 11 => 70686894467424129757
  | 12 => 47711408571608044810046
  | 13 => 40476043859539475774890749
  | _ => 0

/-- The first eight original six-speed primes and the original lists for
seven through thirteen speeds. -/
def primeList : ℕ → List ℕ
  | 6 => [257, 271, 307, 313, 359, 373, 379, 383]
  | 7 => [251, 257, 263, 269, 271, 277, 281, 283, 293, 307, 311, 313, 317, 331, 337, 347, 349]
  | 8 => [71, 89, 97, 101, 107, 113, 131, 137, 139, 149, 151, 157, 163, 167, 173, 179, 181, 191, 193, 197, 199, 211, 223, 227, 229, 233]
  | 9 => [71, 73, 79, 83, 89, 97, 101, 103, 107, 109, 113, 127,
      131, 137, 139, 149, 151, 157, 163, 167, 173, 179, 181, 191,
      193, 197, 199, 211]
  | 10 => [127, 131, 137, 139, 149, 151, 157, 163, 167, 173, 179, 181,
      191, 193, 197, 199, 211, 223, 227, 229, 233, 239, 241, 251,
      257, 263, 269, 271, 277, 281, 283, 293, 307, 311, 313, 317,
      331, 337, 347, 349, 353, 359, 367, 373, 379, 383, 389, 397,
      401, 409, 419, 421, 431, 433, 439, 443, 449, 457, 461, 463,
      467]
  | 11 => [239, 251, 281, 311, 313, 317, 331, 347, 353, 359, 367, 373,
      379, 383, 389, 397, 401, 409, 419, 421, 431, 433, 439, 443,
      449, 457, 461, 463, 467, 479, 487, 491, 499, 503, 509, 521,
      523, 541, 547, 557, 563, 569, 571, 577]
  | 12 => [167, 179, 181, 191, 193, 197, 199, 211, 223, 227, 229, 233,
      239, 241, 251, 257, 263, 269, 271, 277, 281, 283, 293, 307,
      311, 313, 317, 331, 337, 347, 349, 353, 359, 367, 373, 379,
      383, 389, 397, 401, 409, 419, 421, 431, 433, 439, 443, 449,
      457, 461, 463, 467, 479, 487, 491, 499, 503, 509, 521, 523,
      541, 547, 557, 563, 569, 571, 577, 587, 593, 599, 601, 607,
      613, 617, 619, 631, 641, 643, 647, 653, 659, 661, 673, 677,
      683, 691, 701, 709, 719, 727, 733]
  | 13 => [83, 139, 167, 181, 191, 199, 211, 223, 227, 229, 233, 239,
      241, 251, 257, 263, 269, 271, 277, 281, 283, 293, 307, 311,
      313, 317, 331, 337, 347, 349, 353, 359, 367, 373, 379, 383,
      389, 397, 401, 409, 419, 421, 431, 433, 439, 443, 449, 457,
      461, 463, 467, 479, 487, 491, 499, 503, 509, 521, 523, 541,
      547, 557]
  | _ => []

def primeSet (k : ℕ) : Finset ℕ := (primeList k).toFinset

/-- A strict margin accounts for rounding the real norm bound to integers. -/
theorem prefix_margin (k : ℕ) (hk : 6 ≤ k) (hk' : k ≤ 13) :
    1 < (∏ i ∈ Finset.range (k-1), (PrefixProduct.kzIncrement k i : ℝ)) *
      ((squaredNormBound k + 1 : ℕ) : ℝ) := by
  interval_cases k <;>
    norm_num [squaredNormBound, Finset.prod_range_succ, PrefixProduct.kzIncrement]

/-- Ordinary kernel reduction checks primality, coprimality, and the complete
integer AM--GM margin. The forced divisor is needed for counts nine and thirteen. -/
theorem prime_data_valid (k : ℕ) (hk : 6 ≤ k) (hk' : k ≤ 13) :
    (∀ p ∈ primeSet k, p.Prime) ∧
    (forcedDivisor k).Coprime (∏ p ∈ primeSet k, p) ∧
    (squaredNormBound k)^k < k^k * (forcedDivisor k * ∏ p ∈ primeSet k, p)^2 := by
  interval_cases k <;> decide +kernel

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
