module
public import Conjectures.WachsLaguerrePositiveRoots
public import Conjectures.WachsCompleteGraphGammaProduct

@[expose] public section
namespace WachsCompleteGraph

open Polynomial

theorem normalizedLaguerre_positive_factors {p : ℕ} {r : Fin p → ℝ}
    (hr : PositiveLaguerreRoots p r) :
    (normalizedLaguerre p).map (algebraMap ℚ ℝ) =
      ∏ i : Fin p, ((1:Polynomial ℝ) + C (r i)⁻¹*X) := by
  apply Polynomial.funext
  intro x
  let c := (-1:ℝ)^p * ((p+1).factorial:ℝ)
  have hc : c ≠ 0 := by dsimp [c]; positivity
  have h0 := monicLaguerre_zero_value p
  rw [eval_factor_sequence hr.2.2] at h0
  have h0' : (∏ i : Fin p, -r i) = c := by simpa only [zero_sub] using h0
  have hx := monicLaguerre_value p (-x)
  rw [neg_neg,eval_factor_sequence hr.2.2] at hx
  apply mul_left_cancel₀ hc
  calc
    _ = ∏ i : Fin p, (-x-r i) := hx.symm
    _ = ∏ i : Fin p, (-r i)*(1+(r i)⁻¹*x) := by
      apply Finset.prod_congr rfl
      intro i _
      have hi := (hr.2.1 i).ne'
      field_simp
      ring
    _ = _ := by
      rw [Finset.prod_mul_distrib,h0',Polynomial.eval_prod]
      simp only [eval_add,eval_one,eval_mul,eval_C,eval_X]

/-- Laguerre's factorization at unit scale, with distinct positive
rates supplied by the exact interlacing proof. -/
theorem laguerre_has_positive_factorization (p : ℕ) :
    ∃ r : Fin p → ℝ, StrictMono r ∧ (∀ i,0<r i) ∧ HasLaguerreFactorization p r := by
  obtain ⟨r,hr⟩ := laguerre_positive_roots p
  refine ⟨r,hr.1,hr.2.1,?_⟩
  unfold HasLaguerreFactorization laguerreAt
  rw [PowerSeries.rescale_one,← Polynomial.polynomial_map_coe,normalizedLaguerre_positive_factors hr]
  change (Polynomial.coeToPowerSeries.ringHom (R:=ℝ)) (∏ i : Fin p, ((1:Polynomial ℝ)+C (r i)⁻¹*X)) = _
  rw [map_prod]
  simp [linearFactor]

end WachsCompleteGraph
