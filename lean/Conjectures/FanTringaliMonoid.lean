import Conjectures.FanTringaliNatural
import Conjectures.FanTringaliMonoidTransfer

/-!
# Fan–Tringali's length-set conjecture

The original conjecture in §5 of Yushuang Fan and Salvatore Tringali,
*Power monoids: A bridge between factorization theory and arithmetic
combinatorics*, J. Algebra 512 (2018), 252–294.

The graph construction and no-carry encoding follow the existing recorded
argument in `results/fan-tringali-power-monoid-lengths/PROOF.md`, committed by
Cinna Davis in `0d5b985640ecc020f8b99b6e3b1ebc2d8a7fbbe4`. The transfer
to arbitrary noncommutative Dedekind-finite monoids is proved in
`FanTringaliMonoidBasic`, `FanTringaliMonoidNormalization`, and
`FanTringaliMonoidTransfer`, following the original authors' Proposition
3.2(iii) and Theorem 3.8. No unformalized transfer theorem is a hypothesis.

“Non-torsion” has exactly the original positive-power-set meaning. The same
actual finite set realizes the prescribed length set in both the ordinary
and restricted finitary power monoids. No assertion about prescribed
factorization multiplicities or the separate survey supplement is made.
-/

open scoped Pointwise

namespace FanTringali

variable {H : Type*} [Monoid H] [DecidableEq H] [IsDedekindFiniteMonoid H]

/-- The original fully quantified realization, for both power monoids of every
Dedekind-finite monoid with an infinite positive-power orbit. -/
theorem finite_spectrum_power_monoids (hH : ∃ u : H, HasInfinitePowers u)
    (S : Finset ℕ) (hS : S.Nonempty) (hmin : ∀ n ∈ S, 2 ≤ n) :
    ∃ X : Finset H, X.Nonempty ∧ MeetsUnits X ∧
      PowerLengths X = (S : Set ℕ) ∧ RestrictedLengths X = (S : Set ℕ) := by
  obtain ⟨u, hu⟩ := hH
  obtain ⟨A, hA, hLengths⟩ := finite_spectrum_nat S hS hmin
  have hOne := powerImage_one_mem u hA
  have hinj := pow_injective_of_infinitePowers hu
  refine ⟨powerImage u A, ⟨1, hOne⟩, ⟨1, hOne, isUnit_one⟩, ?_, ?_⟩
  · exact (powerLengths_powerImage u hinj hA).trans hLengths
  · exact (restrictedLengths_powerImage u hinj hA).trans hLengths

end FanTringali
