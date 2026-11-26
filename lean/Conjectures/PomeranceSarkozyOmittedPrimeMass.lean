module

public import Conjectures.PomeranceSarkozyGrowingPrimeMass
public import Conjectures.PomeranceSarkozyTailProbability
import Mathlib.Tactic.Linarith

@[expose] public section
namespace PomeranceSarkozy

open Filter Finset Topology

def psAllPrimes (X : ℕ) : Finset ℕ := (Icc 0 X).filter Nat.Prime

noncomputable def psOmittedPrimes (X : ℕ) : Finset ℕ := psAllPrimes X \ psPrimes X

private theorem psPrimes_subset_psAllPrimes {X : ℕ} (hX : 1 ≤ X) (hL : 1 ≤ psL X) :
    psPrimes X ⊆ psAllPrimes X := by
  have hpow : 1 ≤ psL X ^ 6 := one_le_pow₀ hL
  have hZ : psZ X ≤ (X : ℝ) := by
    unfold psZ
    apply Real.rpow_le_self_of_one_le (by exact_mod_cast hX)
    exact (div_le_iff₀ (zero_lt_one.trans_le hpow)).mpr (by simpa using hpow)
  have hfloor : ⌊psZ X⌋₊ ≤ X := by simpa using Nat.floor_mono hZ
  intro p hp
  obtain ⟨hi, hprime⟩ := mem_filter.mp hp
  exact mem_filter.mpr ⟨mem_Icc.mpr ⟨Nat.zero_le p,
    (mem_Ioc.mp hi).2.trans hfloor⟩, hprime⟩

private theorem psOmittedPrimeMass_add_psRate {X : ℕ} (h : psPrimes X ⊆ psAllPrimes X) :
    (reciprocalPrimeMass (psOmittedPrimes X) : ℝ) + (psRate X : ℝ) =
      primeReciprocalSum (X : ℝ) := by
  unfold reciprocalPrimeMass psOmittedPrimes psRate primeReciprocalSum
  push_cast
  simp only [Nat.floor_natCast, one_div]
  exact sum_sdiff (f := fun p : ℕ => (p : ℝ)⁻¹) h

/-- The omitted primes up to the sample bound have total reciprocal mass O(log log log X). -/
theorem psOmittedPrimeMass_bound : ∃ C : ℝ, ∀ᶠ X in atTop,
    (reciprocalPrimeMass (psOmittedPrimes X) : ℝ) ≤ C * Real.log (psL X) := by
  obtain ⟨B, hB⟩ := primeReciprocalSum_logLog_bounded
  obtain ⟨C, hC⟩ := psRate_approx
  refine ⟨C + |B|, ?_⟩
  filter_upwards [hC, psL_tendsto.eventually_ge_atTop (Real.exp 1),
    eventually_ge_atTop (2 : ℕ)] with X hr hL hX
  have hlog : 1 ≤ Real.log (psL X) := by
    simpa only [Real.log_exp] using Real.log_le_log (Real.exp_pos 1) hL
  have hsub : psPrimes X ⊆ psAllPrimes X := psPrimes_subset_psAllPrimes
    (by omega) ((Real.one_le_exp (by norm_num)).trans hL)
  have hMertens := (abs_le.mp (hB X (by exact_mod_cast hX))).2
  change primeReciprocalSum (X : ℝ) - psL X ≤ B at hMertens
  rw [← psOmittedPrimeMass_add_psRate hsub] at hMertens
  have hB' : B ≤ |B| * Real.log (psL X) :=
    (le_abs_self B).trans (le_mul_of_one_le_right (abs_nonneg B) hlog)
  rw [add_mul]
  linarith [(abs_le.mp hr).1]

/-- For a sample point up to X, every prime factor is retained or omitted. -/
theorem distinctPrimeCount_le_restricted_add_omitted (X m : ℕ) (hm : m ≤ X) :
    distinctPrimeCount m ≤ restrictedPrimeCount (psPrimes X) m +
      restrictedPrimeCount (psOmittedPrimes X) m := by
  have hcover : m.primeFactors ⊆ (psPrimes X ∩ m.primeFactors) ∪
      (psOmittedPrimes X ∩ m.primeFactors) := by
    intro p hp
    by_cases hkeep : p ∈ psPrimes X
    · exact mem_union_left _ (mem_inter.mpr ⟨hkeep, hp⟩)
    · have hall : p ∈ psAllPrimes X := mem_filter.mpr
        ⟨mem_Icc.mpr ⟨Nat.zero_le p, (Nat.le_of_mem_primeFactors hp).trans hm⟩,
          Nat.prime_of_mem_primeFactors hp⟩
      exact mem_union_right _ (mem_inter.mpr ⟨mem_sdiff.mpr ⟨hall, hkeep⟩, hp⟩)
  exact (card_le_card hcover).trans (card_union_le _ _)

end PomeranceSarkozy
