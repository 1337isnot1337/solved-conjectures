module

public import Conjectures.WachsCompleteGraphGammaFactors

@[expose] public section
namespace WachsCompleteGraph

variable {K : Type*} [Field K] [Algebra ℚ K]

noncomputable def gammaSumSeries (p n : ℕ) (rates : Fin p → K) : PowerSeries K :=
  expAt (n:K) * ∏ i : Fin p,gammaMomentFactor n (rates i)

/-- The one polynomial input left by the classical positive Laguerre
factorization, stated as a literal equality at unit scale. -/
def HasLaguerreFactorization (p : ℕ) (rates : Fin p → K) : Prop :=
  laguerreAt p (1:K) = ∏ i : Fin p,linearFactor ((rates i)⁻¹)

omit [Algebra ℚ K] in
theorem rescale_constant (a t : K) :
    PowerSeries.rescale t (PowerSeries.C a)=PowerSeries.C a := by
  apply PowerSeries.ext
  intro j
  cases j <;> simp [PowerSeries.coeff_rescale]

omit [Algebra ℚ K] in
theorem rescale_linearFactor (a t : K) :
    PowerSeries.rescale t (linearFactor a)=linearFactor (a*t) := by
  simp only [linearFactor,map_add,map_one,map_mul,rescale_constant,PowerSeries.rescale_X]
  rw [←mul_assoc,←map_mul]

theorem laguerreAt_factor {p : ℕ} {rates : Fin p→K} (h : HasLaguerreFactorization p rates) (t : K) :
    laguerreAt p t=∏ i : Fin p,linearFactor (t/rates i) := by
  have he : laguerreAt p t = PowerSeries.rescale t (laguerreAt p (1:K)) := by simp [laguerreAt]
  rw [he,show laguerreAt p (1:K) = _ from h,map_prod]
  apply Finset.prod_congr rfl
  intro i _
  rw [rescale_linearFactor]
  congr 1
  ring

theorem laguerreAt_constantCoeff (p : ℕ) (t : K) : PowerSeries.constantCoeff (laguerreAt p t)=1 := by
  rw [←PowerSeries.coeff_zero_eq_constantCoeff_apply]
  simp [laguerreAt,PowerSeries.coeff_rescale,normalizedLaguerre_coeff]

theorem inverse_laguerre_gamma_factors {p : ℕ} {rates : Fin p→K}
    (h : HasLaguerreFactorization p rates) (t : K) (n : ℕ) :
    (laguerreAt p t)⁻¹^n = ∏ i : Fin p,PowerSeries.rescale (-t) (gammaMomentFactor n (rates i)) := by
  let A := laguerreAt p t
  let P := ∏ i : Fin p,PowerSeries.rescale (-t) (gammaMomentFactor n (rates i))
  have h1 : A^n*P=1 := by
    dsimp [A,P]
    rw [laguerreAt_factor h,←Finset.prod_pow,←Finset.prod_mul_distrib]
    exact Finset.prod_eq_one (fun i _ => rescale_gammaMomentFactor_mul n t (rates i))
  have h2 : A⁻¹^n*A^n=1 := by
    rw [←mul_pow,PowerSeries.inv_mul_cancel _ (by rw [laguerreAt_constantCoeff]; exact one_ne_zero),
      one_pow]
  calc
    _ = A⁻¹^n*(A^n*P) := by rw [h1,mul_one]
    _ = _ := by rw [←mul_assoc,h2,one_mul]

theorem laguerre_gamma_series {p : ℕ} {rates : Fin p→K}
    (h : HasLaguerreFactorization p rates) (t : K) (n : ℕ) :
    expAt (1-(n:K)*t)*(laguerreAt p t)⁻¹^n =
    PowerSeries.exp K*PowerSeries.rescale (-t) (gammaSumSeries p n rates) := by
  rw [inverse_laguerre_gamma_factors h,gammaSumSeries,map_mul,map_prod]
  have he : PowerSeries.rescale (-t) (expAt (n:K))=expAt (-(n:K)*t) := by
    unfold expAt
    have hres := (congrArg (fun f : PowerSeries K →+* PowerSeries K => f (PowerSeries.exp K))
      (PowerSeries.rescale_mul (n:K) (-t))).symm
    simpa only [RingHom.comp_apply,mul_neg,neg_mul] using hres
  rw [he,←mul_assoc]
  congr 1
  conv_rhs => lhs; rw [←show expAt (1:K)=PowerSeries.exp K by simp [expAt]]
  unfold expAt
  rw [PowerSeries.exp_mul_exp_eq_exp_add]
  congr 2
  ring

end WachsCompleteGraph
