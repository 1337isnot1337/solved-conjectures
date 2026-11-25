module

public import Conjectures.WachsCompleteGraphForcing
public import Mathlib.RingTheory.PowerSeries.Inverse

@[expose] public section
namespace WachsCompleteGraph

variable {K : Type*} [Field K] [Algebra ℚ K]

noncomputable def expAt (t : K) : PowerSeries K :=
  PowerSeries.rescale t (PowerSeries.exp K)

noncomputable def laguerreAt (p : ℕ) (t : K) : PowerSeries K :=
  PowerSeries.rescale t (PowerSeries.map (algebraMap ℚ K) (normalizedLaguerre p).toPowerSeries)

noncomputable def forcingAt (p : ℕ) (t : K) : PowerSeries K :=
  PowerSeries.rescale t (PowerSeries.map (algebraMap ℚ K) (forcingQuotient p))

theorem expAt_constantCoeff (t : K) : PowerSeries.constantCoeff (expAt t)=1 := by
  rw [←PowerSeries.coeff_zero_eq_constantCoeff_apply]
  simp [expAt,PowerSeries.coeff_rescale]

theorem expAt_neg_inverse (t : K) : (expAt t)⁻¹=expAt (-t) := by
  have he : expAt t * expAt (-t)=1 := by
    unfold expAt
    rw [PowerSeries.exp_mul_exp_eq_exp_add,add_neg_cancel]
    simp [PowerSeries.rescale_zero]
  have hc : PowerSeries.constantCoeff (expAt t)≠0 := by
    rw [expAt_constantCoeff]
    exact one_ne_zero
  calc
    _ = (expAt t)⁻¹*(expAt t*expAt (-t)) := by rw [he,mul_one]
    _ = _ := by rw [←mul_assoc,PowerSeries.inv_mul_cancel _ hc,one_mul]

theorem expAt_pow (t : K) (n : ℕ) : expAt t^n=expAt ((n:K)*t) := by
  unfold expAt
  rw [←map_pow,PowerSeries.exp_pow_eq_rescale_exp,PowerSeries.rescale_mul]
  rfl

theorem laguerre_formal_answer (p : ℕ) (t : K) (n : ℕ) :
    PowerSeries.exp K * (forcingAt p t)⁻¹^n =
      expAt (1-(n:K)*t) * (laguerreAt p t)⁻¹^n := by
  have hf : forcingAt p t=laguerreAt p t*expAt t := forcingQuotient_specialize p t
  rw [hf,PowerSeries.mul_inv_rev,expAt_neg_inverse,mul_pow,expAt_pow,←mul_assoc]
  conv_lhs => lhs; rw [←show expAt (1:K)=PowerSeries.exp K by simp [expAt]]
  unfold expAt
  rw [PowerSeries.exp_mul_exp_eq_exp_add,mul_neg,sub_eq_add_neg]

/-- The exact all-parameter Laguerre coefficient of the Lagrange-normalized
complete-graph expression; k+1 is the number of graph vertices. -/
theorem laguerre_answer_coefficient (p k : ℕ) (t : K) :
    (k.factorial:K) * PowerSeries.coeff k
      (PowerSeries.exp K * (forcingAt p t)⁻¹^(k+1)) =
    (k.factorial:K) * PowerSeries.coeff k
      (expAt (1-((k+1:ℕ):K)*t) * (laguerreAt p t)⁻¹^(k+1)) := by
  rw [laguerre_formal_answer]

end WachsCompleteGraph
