module

public import Conjectures.PomeranceSarkozyActualCountEvents
public import Conjectures.PomeranceSarkozyGrowingEventBounds
public import Conjectures.PomeranceSarkozyGrowingCRT
public import Conjectures.PomeranceSarkozyGrowingFactorial
public import Conjectures.PomeranceSarkozyGrowingPrimeMass

@[expose] public section
namespace PomeranceSarkozy

open Filter Topology MeasureTheory ProbabilityTheory
open scoped ENNReal NNReal

private theorem product_incidence_mass (X : ℕ) :
    (incidenceReciprocalMass (psOffsets X ×ˢ psPrimes X) : ℝ) =
      (psH X : ℝ) * (psRate X : ℝ) := by
  unfold incidenceReciprocalMass psRate
  push_cast
  simp [Finset.sum_product]

private theorem crtWindowL1Bound_nonneg (J : Finset Incidence) (N R : ℕ) :
    0 ≤ (crtWindowL1Bound J N R : ℝ) := by
  have hm : 0 ≤ incidenceReciprocalMass J := Finset.sum_nonneg fun _ _ => by positivity
  unfold crtWindowL1Bound
  positivity

/-- For the literal offset/primes rectangle, all terms of the explicit CRT bound vanish. -/
theorem growing_crt_window_error_tendsto :
    Tendsto (fun X : ℕ =>
      (crtWindowL1Bound (psOffsets X ×ˢ psPrimes X) (psLength X) (psR X) : ℝ))
      atTop (𝓝 0) := by
  let J := fun X => psOffsets X ×ˢ psPrimes X
  have hM : ∀ᶠ X : ℕ in atTop, ((J X).card : ℝ) ≤ (psH X : ℝ) * psZ X := by
    filter_upwards with X
    simp only [J, Finset.card_product, psOffsets_card, Nat.cast_mul]
    exact mul_le_mul_of_nonneg_left (psPrimes_card_le X) (by positivity)
  have ha : ∀ᶠ X : ℕ in atTop, 0 ≤ (incidenceReciprocalMass (J X) : ℝ) := by
    filter_upwards with X
    rw [show (incidenceReciprocalMass (J X) : ℝ) = _ from product_incidence_mass X]
    positivity
  have hA : ∃ C : ℝ, ∀ᶠ X : ℕ in atTop, (incidenceReciprocalMass (J X) : ℝ) ≤ C * psL X^2 := by
    refine ⟨20, ?_⟩
    filter_upwards [psRate_le, psL_tendsto.eventually_ge_atTop 0] with X hrate hL
    have hH : (psH X : ℝ) ≤ 10 * psL X := Nat.floor_le (by positivity)
    have h := mul_le_mul hH hrate (by positivity) (by positivity)
    rw [show (incidenceReciprocalMass (J X) : ℝ) = _ from product_incidence_mass X]
    linarith
  have hc := (growing_crt_card_error_tendsto (fun X => (J X).card) hM).const_mul 3
  have hf := growing_factorial_error_tendsto _ ha hA
  exact squeeze_zero' (.of_forall fun X => crtWindowL1Bound_nonneg _ _ _)
    (.of_forall fun X => crtWindowL1Bound_le_growing_errors _ _ _)
    (by simpa only [mul_zero, add_zero] using hc.add hf)

/-- Every moving event of the shifted arithmetic prime counts has asymptotically the
same probability as under genuinely independent Poisson variables of the retained rate. -/
theorem growing_arithmetic_poisson_event (A : (X : ℕ) → Set (↥(psOffsets X) → ℕ)) :
    Tendsto (fun X : ℕ =>
      (arithmeticOffsetCountMeasure (psOffsets X) (psPrimes X) (psStart X) (psLength X)).real (A X) -
      (Measure.pi (fun _ : ↥(psOffsets X) => poissonMeasure (psRate X))).real (A X))
      atTop (𝓝 0) := by
  apply (tendsto_zero_iff_abs_tendsto_zero _).mpr
  apply squeeze_zero' (.of_forall fun _ => abs_nonneg _) _
    (by simpa only [add_zero] using growing_crt_window_error_tendsto.add growing_replacement_error_tendsto)
  filter_upwards [psH_le_psY, psH_le_psStart, psLength_half_le,
    eventually_ge_atTop 1, psL_tendsto.eventually_ge_atTop 1] with X hHY hHS hhalf hX hL
  let e := (psPrimes X).equivFin.symm
  have hN : 0 < psLength X := by
    have hx : (1:ℝ) ≤ X := by exact_mod_cast hX
    exact_mod_cast (show 0 < (psLength X : ℝ) by linarith)
  have hY : 0 < psY X := Nat.floor_pos.mpr (one_le_pow₀ hL)
  have hprime (p) (hp : p ∈ psPrimes X) : p.Prime := (Finset.mem_filter.mp hp).2
  have hPy (p) (hp : p ∈ psPrimes X) : psY X < p :=
    (Finset.mem_Ioc.mp (Finset.mem_filter.mp hp).1).1
  have hrate : (∑ i, reciprocalRates (fun i => (e i).val) i) = psRate X := by
    unfold psRate
    rw [← Finset.sum_coe_sort (psPrimes X) (fun p : ℕ => (p : ℝ≥0)⁻¹)]
    apply Fintype.sum_equiv e
    intro i
    apply NNReal.eq
    simp [reciprocalRates, one_div]
    rfl
  have hb := arithmetic_poisson_event_error_le (psOffsets X) (psPrimes X) e
    (psStart X) (psLength X) (psR X) (psY X) hN hY hprime hPy
    (fun h hh p hp => ((Finset.mem_Icc.mp hh).2.trans hHY).trans_lt (hPy p hp))
    (fun h hh => (Finset.mem_Icc.mp hh).2.trans hHS) (A X)
  dsimp only at hb
  rw [hrate, ← ENNReal.ofReal_add (crtWindowL1Bound_nonneg _ _ _) (by positivity)] at hb
  exact (ENNReal.ofReal_le_ofReal_iff (add_nonneg (crtWindowL1Bound_nonneg _ _ _) (by positivity))).mp hb

end PomeranceSarkozy
