module
public import Conjectures.PomeranceSarkozyTailProbability
public import Mathlib.Analysis.Real.Sqrt

@[expose] public section
namespace PomeranceSarkozy

open Finset

/-- Every prime that can divide a positive integer in the sample. -/
def discardedOffsetPrimes (X : ℕ) : Finset ℕ :=
  (Icc 0 X).filter Nat.Prime

/-- Samples on which an offset beyond `H` contributes to the source count. -/
noncomputable def discardedOffsetSamples (start X H : ℕ) : Finset ℕ := by
  classical
  exact (Icc start X).filter fun n => ∃ h ∈ sourceOffsetEvents n, H < h

private theorem restrictedPrimeCount_all {m X : ℕ} (hm : m ≤ X) :
    restrictedPrimeCount (discardedOffsetPrimes X) m = distinctPrimeCount m := by
  unfold restrictedPrimeCount distinctPrimeCount
  congr 1
  apply Finset.inter_eq_right.mpr
  intro p hp
  obtain ⟨hprime, hdvd, hm0⟩ := Nat.mem_primeFactors.mp hp
  exact Finset.mem_filter.mpr ⟨Finset.mem_Icc.mpr
    ⟨Nat.zero_le p, (Nat.le_of_dvd (Nat.pos_of_ne_zero hm0) hdvd).trans hm⟩, hprime⟩

/-- The literal discarded-offset event is bounded by the sum of shifted factorial tails. -/
theorem discardedOffset_fraction_le_factorial (start X H : ℕ)
    (hN : 0 < (Icc start X).card) (hHalf : X ≤ 2 * (Icc start X).card) :
    ((discardedOffsetSamples start X H).card : ℚ) / (Icc start X).card ≤
      ∑ h ∈ Ioc H X, 2 * (reciprocalPrimeMass (discardedOffsetPrimes X)) ^ (h + 1) /
        ((h + 1).factorial : ℚ) := by
  classical
  let tail := fun h => primeTailSamples (discardedOffsetPrimes X) start X h (h + 1)
  have hsub : discardedOffsetSamples start X H ⊆ (Ioc H X).biUnion tail := by
    intro n hn
    obtain ⟨hnI, h, hh, hH⟩ := Finset.mem_filter.mp hn
    obtain ⟨hhn, hhω⟩ := mem_sourceOffsetEvents.mp hh
    have hnX := (Finset.mem_Icc.mp hnI).2
    apply Finset.mem_biUnion.mpr
    refine ⟨h, Finset.mem_Ioc.mpr ⟨hH, hhn.le.trans hnX⟩, Finset.mem_filter.mpr ⟨hnI, hhn, ?_⟩⟩
    rw [restrictedPrimeCount_all ((Nat.sub_le n h).trans hnX)]
    exact hhω
  have hc := (Finset.card_le_card hsub).trans Finset.card_biUnion_le
  calc
    _ ≤ ((∑ h ∈ Ioc H X, (tail h).card : ℕ) : ℚ) / (Icc start X).card :=
      div_le_div_of_nonneg_right (by exact_mod_cast hc) (by positivity)
    _ = ∑ h ∈ Ioc H X, arithmeticTailProbability (discardedOffsetPrimes X) start X h (h + 1) := by
      simp only [Nat.cast_sum, Finset.sum_div, arithmeticTailProbability, tail]
    _ ≤ _ := Finset.sum_le_sum fun h _ =>
      primeTail_probability_le_two_factorial (discardedOffsetPrimes X)
        (fun p hp => (Finset.mem_filter.mp hp).2) start X h (h + 1) hN hHalf

end PomeranceSarkozy
