module
public import Conjectures.PomeranceSarkozyTailProbability
public import Mathlib.Analysis.Real.Sqrt
import Mathlib.Analysis.Complex.ExponentialBounds
import Mathlib.Analysis.SpecificLimits.Basic
import Mathlib.Algebra.Order.Field.GeomSum

@[expose] public section
namespace PomeranceSarkozy

open Finset Filter
open scoped Topology

/-- Every prime that can divide a positive integer in the sample. -/
def discardedOffsetPrimes (X : ℕ) : Finset ℕ :=
  (Icc 0 X).filter Nat.Prime

theorem discardedOffsetPrimeMass_eq_sum (X : ℕ) :
    (reciprocalPrimeMass (discardedOffsetPrimes X) : ℝ) =
      ∑ p ∈ Icc 0 X with p.Prime, (1 : ℝ) / (p : ℝ) := by
  unfold reciprocalPrimeMass discardedOffsetPrimes
  push_cast
  simp only [one_div]

/-- Samples on which an offset beyond `H` contributes to the source count. -/
noncomputable def discardedOffsetSamples (start X H : ℕ) : Finset ℕ := by
  classical
  exact (Icc start X).filter fun n => ∃ h ∈ sourceOffsetEvents n, H < h

theorem mem_discardedOffsetSamples {start X H n : ℕ} :
    n ∈ discardedOffsetSamples start X H ↔
      n ∈ Icc start X ∧ ∃ h ∈ sourceOffsetEvents n, H < h := by
  classical
  rw [discardedOffsetSamples, Finset.mem_filter]

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
    obtain ⟨hnI, h, hh, hH⟩ := mem_discardedOffsetSamples.mp hn
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

/-- Failure probability for the uniform sample on `[ceil (sqrt X), X]`. -/
noncomputable def discardedOffsetProbability (X H : ℕ) : ℝ :=
  ((discardedOffsetSamples ⌈Real.sqrt (X : ℝ)⌉₊ X H).card : ℝ) /
    (Icc ⌈Real.sqrt (X : ℝ)⌉₊ X).card

private theorem sqrtSample_card (X : ℕ) (hX : 4 ≤ X) :
    0 < (Icc ⌈Real.sqrt (X : ℝ)⌉₊ X).card ∧
      X ≤ 2 * (Icc ⌈Real.sqrt (X : ℝ)⌉₊ X).card := by
  let start := ⌈Real.sqrt (X : ℝ)⌉₊
  have hX' : (4 : ℝ) ≤ X := by exact_mod_cast hX
  have hs : Real.sqrt (X : ℝ) ≤ (X : ℝ) / 2 := by
    apply Real.sqrt_le_iff.mpr
    refine ⟨by positivity, ?_⟩
    have hX₀ : 0 ≤ (X : ℝ) := by positivity
    nlinarith only [mul_nonneg (sub_nonneg.mpr hX') hX₀]
  have hstart : start ≤ X := Nat.ceil_le.mpr (hs.trans (by linarith))
  have hstart' : (start : ℝ) ≤ (X : ℝ) / 2 + 1 :=
    (Nat.ceil_lt_add_one (Real.sqrt_nonneg _)).le.trans (add_le_add_left hs 1)
  change 0 < (Icc start X).card ∧ X ≤ 2 * (Icc start X).card
  have hhalf : (X : ℝ) ≤ 2 * ((Icc start X).card : ℝ) := by
    rw [Nat.card_Icc, Nat.cast_sub (by omega : start ≤ X + 1), Nat.cast_add, Nat.cast_one]
    linarith
  exact ⟨by rw [Nat.card_Icc]; omega, by exact_mod_cast hhalf⟩

theorem discardedOffsetProbability_le_factorial (X H : ℕ) (hX : 4 ≤ X) :
    discardedOffsetProbability X H ≤
      ∑ h ∈ Ioc H X, 2 * (reciprocalPrimeMass (discardedOffsetPrimes X) : ℝ) ^ (h + 1) /
        ((h + 1).factorial : ℝ) := by
  obtain ⟨hp, hh⟩ := sqrtSample_card X hX
  unfold discardedOffsetProbability
  have hrat := discardedOffset_fraction_le_factorial ⌈Real.sqrt (X : ℝ)⌉₊ X H hp hh
  have hreal := (Rat.cast_le (K := ℝ)).mpr hrat
  push_cast at hreal
  exact hreal

private theorem factorialTail_le_geometric (μ : ℝ) (a : ℕ) (hμ : 0 ≤ μ)
    (ha : 0 < a) (hm : 5 * μ ≤ (a : ℝ)) :
    μ ^ a / (a.factorial : ℝ) ≤ (3 / 5 : ℝ) ^ a := by
  have ha' : (0 : ℝ) < a := by exact_mod_cast ha
  have hb : μ / (a : ℝ) ≤ 1 / 5 := (div_le_iff₀ ha').mpr (by linarith)
  calc
    _ = (μ / (a : ℝ)) ^ a * ((a : ℝ) ^ a / (a.factorial : ℝ)) := by
      rw [← mul_div_assoc, ← mul_pow, div_mul_cancel₀ _ ha'.ne']
    _ ≤ (μ / (a : ℝ)) ^ a * Real.exp (a : ℝ) :=
      mul_le_mul_of_nonneg_left (Real.pow_div_factorial_le_exp (a : ℝ) (by positivity) a) (by positivity)
    _ = (μ / (a : ℝ) * Real.exp 1) ^ a := by rw [mul_pow, ← Real.exp_nat_mul, mul_one]
    _ ≤ _ := by
      apply pow_le_pow_left₀ (by positivity)
      calc
        _ ≤ (1 / 5 : ℝ) * 3 :=
          mul_le_mul hb Real.exp_one_lt_three.le (Real.exp_nonneg _) (by positivity)
        _ = _ := by norm_num

/-- A geometric bound independent of the number of candidate discarded offsets. -/
theorem discardedOffsetProbability_le_geometric (X H : ℕ) (hX : 4 ≤ X)
    (hm : 5 * (reciprocalPrimeMass (discardedOffsetPrimes X) : ℝ) ≤ (H : ℝ) + 1) :
    discardedOffsetProbability X H ≤ 3 * (3 / 5 : ℝ) ^ (H + 1) := by
  let μ : ℝ := reciprocalPrimeMass (discardedOffsetPrimes X)
  let q : ℝ := 3 / 5
  have hμ : 0 ≤ μ := by unfold μ reciprocalPrimeMass; positivity
  have hI : Ioc H X = Ico (H + 1) (X + 1) := by
    ext h
    simp only [mem_Ioc, mem_Ico]
    omega
  calc
    _ ≤ ∑ h ∈ Ioc H X, 2 * μ ^ (h + 1) / ((h + 1).factorial : ℝ) :=
      discardedOffsetProbability_le_factorial X H hX
    _ ≤ ∑ h ∈ Ioc H X, 2 * q ^ (h + 1) := by
      apply Finset.sum_le_sum
      intro h hh
      rw [mul_div_assoc]
      apply mul_le_mul_of_nonneg_left _ (by positivity)
      have hH : (H : ℝ) ≤ h := by exact_mod_cast (Finset.mem_Ioc.mp hh).1.le
      exact factorialTail_le_geometric μ (h + 1) hμ (by omega) (by push_cast; linarith)
    _ = 2 * q * ∑ h ∈ Ico (H + 1) (X + 1), q ^ h := by
      rw [hI, Finset.mul_sum]
      apply Finset.sum_congr rfl
      intro h _
      rw [pow_succ]
      ring
    _ ≤ 2 * q * (q ^ (H + 1) / (1 - q)) := by
      apply mul_le_mul_of_nonneg_left (geom_sum_Ico_le_of_lt_one ?_ ?_) <;> norm_num [q]
    _ = _ := by dsimp [q]; ring

/-- Under the eventual prime-mass and cutoff bounds, discarded offsets occur with
vanishing probability in the actual uniform arithmetic sample. -/
theorem discardedOffsetProbability_tendsto (L : ℕ → ℝ) (H : ℕ → ℕ)
    (hL : Tendsto L atTop atTop)
    (hμ : ∀ᶠ X in atTop, (reciprocalPrimeMass (discardedOffsetPrimes X) : ℝ) ≤ 2 * L X)
    (hH : ∀ᶠ X in atTop, 10 * L X ≤ (H X : ℝ) + 1) :
    Tendsto (fun X => discardedOffsetProbability X (H X)) atTop (𝓝 0) := by
  have hh : Tendsto (fun X => H X + 1) atTop atTop := by
    apply tendsto_atTop.2
    intro k
    filter_upwards [hL.eventually_ge_atTop ((k : ℝ) / 10), hH] with X hX hx
    exact_mod_cast (show (k : ℝ) ≤ ((H X + 1 : ℕ) : ℝ) by push_cast; linarith)
  have hpow := (tendsto_pow_atTop_nhds_zero_of_lt_one
    (by norm_num : (0 : ℝ) ≤ 3 / 5) (by norm_num : (3 / 5 : ℝ) < 1)).comp hh
  have hbound : Tendsto (fun X => 3 * (3 / 5 : ℝ) ^ (H X + 1)) atTop (𝓝 0) := by
    simpa only [Function.comp_apply, mul_zero] using hpow.const_mul 3
  refine squeeze_zero' (Eventually.of_forall fun _ => by unfold discardedOffsetProbability; positivity)
    ?_ hbound
  filter_upwards [eventually_ge_atTop (4 : ℕ), hμ, hH] with X hx hm hh
  exact discardedOffsetProbability_le_geometric X (H X) hx (by linarith)

end PomeranceSarkozy
