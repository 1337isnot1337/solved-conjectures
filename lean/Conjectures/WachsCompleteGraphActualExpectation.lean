module
public import Conjectures.WachsGammaShiftBound
public import Conjectures.WachsCompleteGraphStrictLogConcavity

@[expose] public section
namespace WachsCompleteGraph

open MeasureTheory PowerSeries WeightedCompletePartition

theorem affine_pow_sum (t x : ℝ) (k : ℕ) :
    (1-t*x)^k = ∑ j ∈ Finset.range (k+1),(k.choose j:ℝ)*(-t)^j*x^j := by
  rw [show 1-t*x = (-t*x)+1 by ring,add_pow]
  apply Finset.sum_congr rfl
  intro j _
  rw [mul_pow,one_pow]
  ring

theorem affine_pow_integrable {μ : Measure ℝ} {A : PowerSeries ℝ}
    (h : ProbabilitySeriesMoments μ A) (t : ℝ) (k : ℕ) :
    Integrable (fun x => (1-t*x)^k) μ := by
  have he : (fun x : ℝ => (1-t*x)^k) =
      fun x => ∑ j ∈ Finset.range (k+1),(k.choose j:ℝ)*(-t)^j*x^j :=
    funext (fun x => affine_pow_sum t x k)
  rw [he]
  exact integrable_finsetSum _ (fun j _ => (h.moments_integrable j).const_mul _)

theorem affine_pow_integral {μ : Measure ℝ} {A : PowerSeries ℝ}
    (h : ProbabilitySeriesMoments μ A) (t : ℝ) (k : ℕ) :
    (∫ x, (1-t*x)^k ∂μ) =
      ∑ j ∈ Finset.range (k+1),(k.choose j:ℝ)*(-t)^j*((j.factorial:ℝ)*coeff j A) := by
  simp_rw [affine_pow_sum t]
  rw [integral_finsetSum _ (fun j _ => (h.moments_integrable j).const_mul _)]
  apply Finset.sum_congr rfl
  intro j _
  rw [integral_const_mul,h.integral_eq_coeff]

/-- The actual complete-graph specialization is an expectation under
the literal shifted sum of independent Gamma laws. -/
theorem weighted_complete_graph_expectation_of_rates (p k : ℕ) (t : ℝ) (rates : Fin p → ℝ)
    (hpos : ∀ i,0<rates i) (hfac : HasLaguerreFactorization p rates) :
    Polynomial.eval₂ (Int.castRingHom ℝ) t (characteristic (p+2) (k+1)) =
      ∫ x, (1-t*x)^k ∂shiftedGammaLaw k p rates := by
  rw [weighted_complete_graph_formal_moments p k t rates hfac,
    affine_pow_integral (shiftedGammaLaw_seriesMoments k p rates hpos)]
  rfl

theorem weighted_complete_graph_actual_expectation (p : ℕ) :
    ∃ rates : Fin p → ℝ, StrictMono rates ∧ (∀ i,0<rates i) ∧
      ∀ k t, Polynomial.eval₂ (Int.castRingHom ℝ) t (characteristic (p+2) (k+1)) =
        ∫ x, (1-t*x)^k ∂shiftedGammaLaw k p rates := by
  obtain ⟨r,hm,hp,hf⟩ := laguerre_has_positive_factorization p
  exact ⟨r,hm,hp,fun k t => weighted_complete_graph_expectation_of_rates p k t r hp hf⟩

end WachsCompleteGraph
