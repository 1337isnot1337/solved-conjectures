module
public import Mathlib

@[expose] public section
namespace PomeranceSarkozy

open MeasureTheory ProbabilityTheory
open scoped NNReal

noncomputable def bernoulliNatMass (b : ℝ) (k : ℕ) : ℝ :=
  if k=0 then 1-b else if k=1 then b else 0

noncomputable def poissonNatMass (b : ℝ≥0) (k : ℕ) : ℝ :=
  (poissonMeasure b).real {k}

theorem poissonNatMass_hasSum (b : ℝ≥0) : HasSum (poissonNatMass b) 1 := by
  change HasSum (fun k => (poissonMeasure b).real {k}) 1
  simp_rw [poissonMeasure_real_singleton]
  exact hasSum_one_poissonMeasure b

theorem bernoulliNatMass_hasSum (b : ℝ) : HasSum (bernoulliNatMass b) 1 := by
  have h : bernoulliNatMass b =
      (fun k : ℕ => (if k=0 then 1-b else 0)+(if k=1 then b else 0)) := by
    funext k
    by_cases h₀ : k=0
    · subst k
      norm_num [bernoulliNatMass]
    · simp [bernoulliNatMass,h₀]
  rw [h]
  have h₀ : HasSum (fun k : ℕ => if k=0 then 1-b else 0) (1-b) := hasSum_ite_eq _ _
  have h₁ : HasSum (fun k : ℕ => if k=1 then b else 0) b := hasSum_ite_eq _ _
  simpa using h₀.add h₁

/-- Exact distance to the true Poisson measure. Only the atom at one
has a positive Bernoulli-minus-Poisson discrepancy. -/
theorem bernoulli_poisson_nat_hasSum_l1 (b : ℝ≥0) :
    HasSum (fun k => |bernoulliNatMass (b:ℝ) k - poissonNatMass b k|)
      (2*(b:ℝ)*(1-Real.exp (-(b:ℝ)))) := by
  let d (k : ℕ) := bernoulliNatMass (b:ℝ) k-poissonNatMass b k
  have hzero : HasSum d 0 := by
    simpa [d] using (bernoulliNatMass_hasSum (b:ℝ)).sub (poissonNatMass_hasSum b)
  have hnonpos (k : ℕ) (hk : k≠1) : d k≤0 := by
    by_cases h₀ : k=0
    · subst k
      have h := Real.add_one_le_exp (-(b:ℝ))
      simp [d,bernoulliNatMass,poissonNatMass,poissonMeasure_real_singleton]
      linarith
    · simp [d,bernoulliNatMass,h₀,hk,poissonNatMass,poissonMeasure_real_singleton]
      positivity
  have h₁ : d 1=(b:ℝ)*(1-Real.exp (-(b:ℝ))) := by
    norm_num [d,bernoulliNatMass,poissonNatMass,poissonMeasure_real_singleton]
    ring
  have h₁' : 0≤d 1 := by
    rw [h₁]
    exact mul_nonneg b.coe_nonneg (sub_nonneg.mpr (Real.exp_le_one_iff.mpr (neg_nonpos.mpr b.coe_nonneg)))
  have hpoint (k : ℕ) : |d k|=(if k=1 then 2*d 1 else 0)-d k := by
    by_cases hk : k=1
    · subst k
      rw [ite_eq_left rfl,abs_of_nonneg h₁']
      ring
    · rw [ite_eq_right hk,abs_of_nonpos (hnonpos k hk)]
      ring
  change HasSum (fun k => |d k|) _
  simp_rw [hpoint]
  have hsingle : HasSum (fun k : ℕ => if k=1 then 2*d 1 else 0) (2*d 1) := hasSum_ite_eq _ _
  simpa [h₁,mul_assoc] using hsingle.sub hzero

theorem bernoulli_poisson_nat_l1_le (b : ℝ≥0) :
    (∑' k, |bernoulliNatMass (b:ℝ) k-poissonNatMass b k|)≤2*(b:ℝ)^2 := by
  rw [(bernoulli_poisson_nat_hasSum_l1 b).tsum_eq]
  have h := Real.add_one_le_exp (-(b:ℝ))
  calc
    _ ≤ (2*(b:ℝ))*(b:ℝ) := mul_le_mul_of_nonneg_left (by linarith) (by positivity)
    _ = _ := by ring

end PomeranceSarkozy
