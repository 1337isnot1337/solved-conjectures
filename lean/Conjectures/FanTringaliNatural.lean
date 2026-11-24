import Conjectures.FanTringaliBlocks
import Conjectures.FanTringaliRadixTransfer

/-!
# Fan–Tringali's power-monoid length-set conjecture: nonnegative integers

For every finite nonempty set of lengths at least two, the disjoint-clique
construction followed by radix encoding produces a finite subset of `ℕ`
containing zero whose full atomic factorization-length set is exactly the
prescribed set.

This is the reduced `ℕ₀` realization statement from Fan and Tringali (2018), §5.
The construction follows `results/fan-tringali-power-monoid-lengths/PROOF.md`,
Sections 1–4. Transfer to arbitrary non-torsion monoids is formalized separately.
-/

namespace FanTringali

/-- Full realization of every finite nonempty subset of `{2,3,...}` in the
reduced finitary power monoid of the nonnegative integers. -/
theorem finite_spectrum_nat (S : Finset ℕ) (hS : S.Nonempty)
    (hmin : ∀ n ∈ S, 2 ≤ n) :
    ∃ X : Finset ℕ, 0 ∈ X ∧ Lengths X = (S : Set ℕ) := by
  obtain ⟨X,hX₀,hLengths⟩ := exists_nat_same_lengths (spectrumSet S) (spectrumSet_zero S)
  exact ⟨X,hX₀,hLengths.trans (finite_spectrum_lattice S hS hmin)⟩

end FanTringali
