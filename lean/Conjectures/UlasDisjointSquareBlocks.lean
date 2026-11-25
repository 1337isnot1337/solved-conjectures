import Conjectures.UlasDisjointSquareBlocksConstruction
import Conjectures.UlasDisjointSquareBlocksReduction
import Conjectures.UlasDisjointSquareBlocksOddCount
import Conjectures.UlasDisjointSquareBlocksOddPrime

/-!
# Ulas's disjoint-block square-product conjecture

The affine construction and the prime-avoiding tail counts imply infinitely
many collections at every sufficiently large count for each positive length.
-/

namespace UlasDisjointSquareBlocks

/-- Infinitely many actual collections for every positive multiple of a
single positive count, uniformly for every positive block length. -/
theorem infinite_solutions_at_all_positive_multiples (length : ℕ) (hlength : 0 < length) :
    ∃ count : ℕ, 0 < count ∧
      ∀ k : ℕ, 0 < k → (solutions length (k * count)).Infinite := by
  obtain ⟨count, hcount, hrep⟩ := exists_positive_repeatable_count length hlength
  exact ⟨count, hcount, fun k hk => (hrep.mul k).infinite (Nat.mul_pos hk hcount)⟩

/-- With the affine construction discharged, only prime avoidance in tails
remains as a hypothesis of the all-sufficiently-large-count conclusion. -/
theorem eventual_infinite_of_prime_avoiding_tails {length : ℕ} (hlength : 0 < length)
    (havoid : ∀ q : ℕ, q.Prime → ∀ T : ℕ,
      ∃ count : ℕ, CountAbove length T count ∧ ¬q ∣ count) :
    EventuallyInfinite length := by
  obtain ⟨modulus, hmodulus, hrep⟩ := exists_positive_repeatable_count length hlength
  exact eventual_infinite_of_repeatable_and_prime_avoidance hmodulus hrep
    (fun q hq _ T => havoid q hq T)

/-- For each positive common length, all sufficiently large fixed block
counts admit infinitely many pairwise disjoint square-product collections. -/
theorem eventual_infinite (length : ℕ) (hlength : 0 < length) : EventuallyInfinite length := by
  apply eventual_infinite_of_prime_avoiding_tails hlength
  intro q hq T
  by_cases hq₂ : q = 2
  · subst q
    obtain ⟨count, hc, ho⟩ := exists_odd_count_above hlength T
    exact ⟨count, hc, fun hd => (Nat.not_even_iff_odd.mpr ho) (even_iff_two_dvd.mpr hd)⟩
  · exact exists_odd_prime_avoiding_count_above hlength hq hq₂ T

/-- Conjecture 4 from Ulas (2005), with length fixed before the threshold. -/
theorem ulasConjecture : UlasConjecture := by
  intro length hlength
  exact eventual_infinite length (by omega)

end UlasDisjointSquareBlocks
