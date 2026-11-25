module

public import Conjectures.WachsCompleteGraphGammaProduct
public import Mathlib.Basic.Real.Basic

@[expose] public section
namespace WachsCompleteGraph

noncomputable def formalGammaMoment (p n j : ℕ) (rates : Fin p→ℝ) : ℝ :=
  (j.factorial:ℝ)*PowerSeries.coeff j (gammaSumSeries p n rates)

theorem exp_rescale_coeff_to_moments (M : PowerSeries ℝ) (k : ℕ) (t : ℝ) :
    (k.factorial:ℝ)*PowerSeries.coeff k (PowerSeries.exp ℝ*PowerSeries.rescale (-t) M) =
      ∑ j ∈ Finset.range (k+1), (k.choose j:ℝ)*(-t)^j*
        ((j.factorial:ℝ)*PowerSeries.coeff j M) := by
  rw [mul_comm (PowerSeries.exp ℝ),PowerSeries.coeff_mul,
    Finset.Nat.sum_antidiagonal_eq_sum_range_succ_mk,Finset.mul_sum]
  apply Finset.sum_congr rfl
  intro j hj
  rw [PowerSeries.coeff_rescale,PowerSeries.coeff_exp]
  rw [map_div₀,map_one,map_natCast]
  have hj' : j≤k := Nat.lt_succ_iff.mp (Finset.mem_range.mp hj)
  have hf := congrArg (fun n : ℕ => (n:ℝ)) (Nat.choose_mul_factorial_mul_factorial hj')
  push_cast at hf ⊢
  have hfc : ((k-j).factorial:ℝ)≠0 := by positivity
  field_simp
  linear_combination -((-t)^j*PowerSeries.coeff j M)*hf

/-- Conditional only on the polynomial's linear root factorization,
this is the exact complete-graph coefficient expressed by formal
Gamma moments, for arbitrary p and all sizes k+1. -/
theorem laguerre_answer_gamma_moments (p k : ℕ) (t : ℝ) (rates : Fin p→ℝ)
    (h : HasLaguerreFactorization p rates) :
    (k.factorial:ℝ)*PowerSeries.coeff k (PowerSeries.exp ℝ*(forcingAt p t)⁻¹^(k+1)) =
      ∑ j ∈ Finset.range (k+1), (k.choose j:ℝ)*(-t)^j*formalGammaMoment p (k+1) j rates := by
  rw [laguerre_answer_coefficient,laguerre_gamma_series h]
  exact exp_rescale_coeff_to_moments (gammaSumSeries p (k+1) rates) k t

end WachsCompleteGraph
