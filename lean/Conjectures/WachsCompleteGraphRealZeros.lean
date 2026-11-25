module
public import Conjectures.WachsExpectationRoots

@[expose] public section
namespace WachsCompleteGraph

open MeasureTheory WeightedCompletePartition

noncomputable def realWeightedCharacteristic (p k : ℕ) : Polynomial ℝ :=
  (characteristic (p+2) (k+1)).map (Int.castRingHom ℝ)

theorem realCharacteristic_eq_expectationPolynomial (p k : ℕ) (rates : Fin p → ℝ)
    (hr : ∀ i,0<rates i) (hf : HasLaguerreFactorization p rates) :
    realWeightedCharacteristic p k = expectationPolynomial (shiftedGammaLaw k p rates) k := by
  apply Polynomial.funext
  intro t
  rw [realWeightedCharacteristic,Polynomial.eval_map,
    weighted_complete_graph_expectation_of_rates p k t rates hr hf]
  exact (expectationPolynomial_eval (shiftedGammaLaw_seriesMoments k p rates hr) k t).symm

/-- At least three equal colors and even degree: the literal
rank-generating polynomial is everywhere strictly positive on ℝ. -/
theorem weighted_complete_graph_even_no_real_roots (p k : ℕ) (hk : Even k) :
    ∀ t : ℝ, 0 < (realWeightedCharacteristic (p+1) k).eval t := by
  obtain ⟨r,_,hpos,hfac⟩ := laguerre_has_positive_factorization (p+1)
  have _ := shiftedGammaLaw_isProbability k (p+1) r hpos
  have _ := shiftedGammaLaw_nullSingleton k p r hpos
  rw [realCharacteristic_eq_expectationPolynomial (p+1) k r hpos hfac]
  exact expectation_even_pos (shiftedGammaLaw_seriesMoments k (p+1) r hpos) hk

/-- At least three equal colors and odd degree: exactly one real root,
simple and strictly inside (0, 1 / number of vertices). -/
theorem weighted_complete_graph_odd_one_simple_real_root (p k : ℕ) (hk : Even k) :
    ∃ t ∈ Set.Ioo 0 (((k+2:ℕ):ℝ)⁻¹),
      (realWeightedCharacteristic (p+1) (k+1)).IsRoot t ∧
      (realWeightedCharacteristic (p+1) (k+1)).rootMultiplicity t = 1 ∧
      ∀ x, (realWeightedCharacteristic (p+1) (k+1)).IsRoot x → x=t := by
  obtain ⟨r,_,hpos,hfac⟩ := laguerre_has_positive_factorization (p+1)
  have _ := shiftedGammaLaw_isProbability (k+1) (p+1) r hpos
  have _ := shiftedGammaLaw_nullSingleton (k+1) p r hpos
  rw [realCharacteristic_eq_expectationPolynomial (p+1) (k+1) r hpos hfac]
  let c : ℝ := ((k+2:ℕ):ℝ)
  have hc : 0<c := by dsimp [c]; positivity
  have hbound : ∀ᵐ z ∂shiftedGammaLaw (k+1) (p+1) r, 1-c⁻¹*z < 0 := by
    filter_upwards [shiftedGammaLaw_strictly_above_shift (k+1) p r hpos] with z hz
    have hm := mul_lt_mul_of_pos_left hz (inv_pos.mpr hc)
    change c⁻¹*c < c⁻¹*z at hm
    rw [inv_mul_cancel₀ hc.ne'] at hm
    exact sub_neg.mpr hm
  exact expectation_odd_unique_simple_root (shiftedGammaLaw_seriesMoments (k+1) (p+1) r hpos)
    (shiftedGammaLaw_positive (k+1) (p+1) r hpos) hk (inv_pos.mpr hc) hbound

end WachsCompleteGraph
