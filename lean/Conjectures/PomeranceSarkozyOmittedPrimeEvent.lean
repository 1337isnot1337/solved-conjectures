module

public import Conjectures.PomeranceSarkozyGrowingGeometry
public import Conjectures.PomeranceSarkozyOmittedPrimeDecay
public import Conjectures.PomeranceSarkozyOmittedPrimeMass

@[expose] public section
namespace PomeranceSarkozy

open Classical Filter Finset Topology

/-- Samples at which an allowed offset loses more than the band width. -/
noncomputable def psOmittedBad (X : ℕ) : Finset ℕ :=
  (Icc (psStart X) X).filter fun n => ∃ h ∈ psOffsets X, h < n ∧
    restrictedPrimeCount (psPrimes X) (n - h) + psBandWidth X < distinctPrimeCount (n - h)

private theorem psOmittedMass_nonneg (X : ℕ) :
    0 ≤ (reciprocalPrimeMass (psOmittedPrimes X) : ℝ) := by
  exact_mod_cast (show 0 ≤ reciprocalPrimeMass (psOmittedPrimes X) from by
    unfold reciprocalPrimeMass
    positivity)

/-- The finite union over offsets is controlled by the omitted-prime factorial bound. -/
theorem omitted_prime_event_count_le (X : ℕ) :
    ((psOmittedBad X).card : ℝ) ≤ (psH X : ℝ) * (X : ℝ) *
      ((reciprocalPrimeMass (psOmittedPrimes X) : ℝ)^(psBandWidth X) /
        ((psBandWidth X).factorial : ℝ)) := by
  let tail (h : ℕ) := primeTailSamples (psOmittedPrimes X) (psStart X) X h (psBandWidth X)
  have hprime : ∀ p ∈ psOmittedPrimes X, Nat.Prime p := by
    intro p hp
    unfold psOmittedPrimes at hp
    have hp' := (mem_sdiff.mp hp).1
    unfold psAllPrimes at hp'
    exact (mem_filter.mp hp').2
  have hsub : psOmittedBad X ⊆ (psOffsets X).biUnion tail := by
    intro n hn
    obtain ⟨hnI, h, hh, hshift, hbad⟩ := mem_filter.mp hn
    refine mem_biUnion.mpr ⟨h, hh, mem_filter.mpr ⟨hnI, hshift, ?_⟩⟩
    have hpart := distinctPrimeCount_le_restricted_add_omitted X (n - h)
      ((Nat.sub_le n h).trans (mem_Icc.mp hnI).2)
    omega
  have htail (h : ℕ) : ((tail h).card : ℝ) ≤
      (X : ℝ) * (reciprocalPrimeMass (psOmittedPrimes X) : ℝ)^(psBandWidth X) /
        ((psBandWidth X).factorial : ℝ) := by
    dsimp only [tail]
    exact_mod_cast primeTail_factorial_count (psOmittedPrimes X) hprime (psStart X) X h
      (psBandWidth X)
  calc
    _ ≤ ∑ h ∈ psOffsets X, ((tail h).card : ℝ) := by
      exact_mod_cast (card_le_card hsub).trans card_biUnion_le
    _ ≤ ∑ _h ∈ psOffsets X, (X : ℝ) *
        (reciprocalPrimeMass (psOmittedPrimes X) : ℝ)^(psBandWidth X) /
          ((psBandWidth X).factorial : ℝ) := sum_le_sum fun h _ => htail h
    _ = _ := by
      simp only [sum_const, nsmul_eq_mul, psOffsets_card]
      ring

/-- In the growing sample, the fraction of points with an omitted-prime error tends to zero. -/
theorem omitted_prime_event_tendsto :
    Tendsto (fun X : ℕ => ((((Icc (psStart X) X).filter fun n =>
      ∃ h ∈ psOffsets X, h < n ∧ restrictedPrimeCount (psPrimes X) (n - h) + psBandWidth X <
        distinctPrimeCount (n - h)).card : ℝ) / (psLength X : ℝ))) atTop (𝓝 0) := by
  change Tendsto (fun X : ℕ => ((psOmittedBad X).card : ℝ) / (psLength X : ℝ)) atTop (𝓝 0)
  let a (X : ℕ) : ℝ := reciprocalPrimeMass (psOmittedPrimes X)
  have ha (X : ℕ) : 0 ≤ a X := psOmittedMass_nonneg X
  have hdecay := omitted_prime_factorial_decay a (Eventually.of_forall ha) psOmittedPrimeMass_bound
  refine tendsto_of_tendsto_of_tendsto_of_le_of_le' tendsto_const_nhds hdecay ?_ ?_
  · exact Eventually.of_forall fun _ => by positivity
  · filter_upwards [psLength_half_le, eventually_ge_atTop (1 : ℕ)] with X hHalf hX
    have hX' : 0 < (X : ℝ) := Nat.cast_pos.mpr hX
    have hN : (0 : ℝ) < psLength X := by linarith
    apply (div_le_iff₀ hN).mpr
    calc
      _ ≤ (psH X : ℝ) * (X : ℝ) * (a X^(psBandWidth X) / (psBandWidth X).factorial) :=
        omitted_prime_event_count_le X
      _ ≤ (psH X : ℝ) * (2 * (psLength X : ℝ)) *
          (a X^(psBandWidth X) / (psBandWidth X).factorial) := by
        exact mul_le_mul_of_nonneg_right
          (mul_le_mul_of_nonneg_left (by linarith) (by positivity))
          (div_nonneg (pow_nonneg (ha X) _) (by positivity))
      _ = _ := by ring

end PomeranceSarkozy
