import Conjectures.UlasDisjointSquareBlocksConstruction
import Conjectures.UlasDisjointSquareBlocksReduction

/-!
# Ulas's conjecture: verified partial formalization

The affine construction is unconditional and produces infinitely many
solutions at every positive multiple of one fixed positive count, for each
positive block length. The conjecture asks for every sufficiently large
count. Its remaining input is the existence, in every tail, of square-product
collections with count not divisible by any prescribed prime.

The source argument obtains the prime-two input using the uniform
Granville--Soundararajan sign-density estimate and a probabilistic selection;
odd primes use a binary-code weight-divisibility argument. Those inputs are
not proved in this development. No result here asserts the full conjecture.
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

end UlasDisjointSquareBlocks
