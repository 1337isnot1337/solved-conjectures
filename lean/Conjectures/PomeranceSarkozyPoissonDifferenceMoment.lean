module
public import Conjectures.PomeranceSarkozyPoissonDifferenceChar
public import Conjectures.PomeranceSarkozyPoissonVariance
public import Mathlib.Probability.Moments.Variance
import Mathlib.Tactic.FieldSimp
import Mathlib.Tactic.Ring

@[expose] public section
namespace PomeranceSarkozy

open MeasureTheory ProbabilityTheory
open scoped NNReal ENNReal ProbabilityTheory

private theorem poissonNatMass_formula (b : ℝ≥0) (n : ℕ) :
    poissonNatMass b n=Real.exp (-(b:ℝ))*(b:ℝ)^n/(n.factorial:ℝ) := by
  exact poissonMeasure_real_singleton b n

theorem poisson_real_mean (b : ℝ≥0) : ∫ x : ℝ,x ∂Po(ℝ,b)=(b:ℝ) := by
  rw [integral_map (by fun_prop) (by fun_prop),integral_poissonMeasure]
  simp_rw [← poissonNatMass_formula,smul_eq_mul,mul_comm (poissonNatMass _ _)]
  exact (poisson_mean_hasSum b).tsum_eq

theorem poisson_real_memLp (b : ℝ≥0) : MemLp (id : ℝ→ℝ) 2 Po(ℝ,b) := by
  rw [memLp_two_iff_integrable_sq (by fun_prop : AEStronglyMeasurable (id : ℝ→ℝ) Po(ℝ,b))]
  change Integrable (fun x : ℝ=>x^2) ((poissonMeasure b).map (Nat.cast : ℕ→ℝ))
  rw [integrable_map_measure (by fun_prop) (by fun_prop),integrable_poissonMeasure_iff]
  have h := (poisson_square_hasSum b).summable
  convert h using 1
  funext n
  rw [Function.comp_apply,Real.norm_of_nonneg (sq_nonneg _),poissonNatMass_formula,mul_comm]

theorem poisson_real_variance (b : ℝ≥0) : Var[(id : ℝ→ℝ);Po(ℝ,b)]=(b:ℝ) := by
  rw [variance_eq_integral (by fun_prop : AEMeasurable (id : ℝ→ℝ) Po(ℝ,b))]
  change ∫ x : ℝ,(x-(∫ y : ℝ,y ∂Po(ℝ,b)))^2 ∂Po(ℝ,b)=_
  rw [poisson_real_mean]
  rw [integral_map (by fun_prop) (by fun_prop),integral_poissonMeasure]
  simp_rw [← poissonNatMass_formula,smul_eq_mul,mul_comm (poissonNatMass _ _)]
  exact (poisson_variance_hasSum b).tsum_eq

/-- The normalized Poisson difference has exact second moment two at
every positive rate. In particular its absolute values are uniformly
integrable along any positive-rate sequence. -/
theorem normalizedPoissonDifference_secondMoment (b : ℝ≥0) (hb : 0<b) :
    ∫ x : ℝ,x^2 ∂(normalizedPoissonDifference b : Measure ℝ)=2 := by
  let μ := Po(ℝ,b)
  let ρ := μ.prod μ
  let A := (Prod.fst : ℝ×ℝ→ℝ)
  let B := (Prod.snd : ℝ×ℝ→ℝ)
  let d (x : ℝ×ℝ) := A x - B x
  have hA : MeasurePreserving A ρ μ := measurePreserving_fst
  have hB : MeasurePreserving B ρ μ := measurePreserving_snd
  have mA : MemLp A 2 ρ := (poisson_real_memLp b).comp_measurePreserving hA
  have mB : MemLp B 2 ρ := (poisson_real_memLp b).comp_measurePreserving hB
  have hd : Measurable d := hA.measurable.sub hB.measurable
  have hMeanA : ∫ x,A x ∂ρ=(b:ℝ) := by
    have h := integral_map hA.measurable.aemeasurable
      (by fun_prop : AEStronglyMeasurable (id : ℝ→ℝ) (ρ.map A))
    rw [hA.map_eq] at h
    exact h.symm.trans (poisson_real_mean b)
  have hMeanB : ∫ x,B x ∂ρ=(b:ℝ) := by
    have h := integral_map hB.measurable.aemeasurable
      (by fun_prop : AEStronglyMeasurable (id : ℝ→ℝ) (ρ.map B))
    rw [hB.map_eq] at h
    exact h.symm.trans (poisson_real_mean b)
  have hMean : ∫ x,d x ∂ρ=0 := by
    unfold d
    rw [integral_sub (mA.integrable (by simp)) (mB.integrable (by simp)),hMeanA,hMeanB,sub_self]
  have hAB : A ⟂ᵢ[ρ] B := indepFun_prod (X:=id) (Y:=id) measurable_id measurable_id
  have hvA : Var[A;ρ]=(b:ℝ) := by
    rw [← variance_id_map hA.measurable.aemeasurable,hA.map_eq,poisson_real_variance]
  have hvB : Var[B;ρ]=(b:ℝ) := by
    rw [← variance_id_map hB.measurable.aemeasurable,hB.map_eq,poisson_real_variance]
  have hv : Var[d;ρ]=2*(b:ℝ) := by
    unfold d
    rw [variance_fun_sub mA mB,hAB.covariance_eq_zero mA mB,hvA,hvB]
    ring
  have hsq : ∫ x,(d x)^2 ∂ρ=2*(b:ℝ) := by
    rw [variance_eq_integral hd.aemeasurable,hMean] at hv
    simpa only [sub_zero] using hv
  have hb' : (0:ℝ)<(b:ℝ) := by exact_mod_cast hb
  have hs : 0<Real.sqrt (b:ℝ) := Real.sqrt_pos.mpr hb'
  change ∫ x : ℝ,x^2 ∂((ρ.map d).map (fun x : ℝ=>(Real.sqrt (b:ℝ))⁻¹*x))=2
  rw [integral_map (by fun_prop) (by fun_prop),integral_map hd.aemeasurable (by fun_prop)]
  simp_rw [mul_pow]
  rw [integral_const_mul,hsq,inv_pow,Real.sq_sqrt hb'.le]
  field_simp

end PomeranceSarkozy
