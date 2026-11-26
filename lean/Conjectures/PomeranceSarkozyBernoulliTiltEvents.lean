module
public import Conjectures.PomeranceSarkozyBernoulliTiltProduct
public import Mathlib.Algebra.BigOperators.Ring.Finset
import Mathlib.Tactic.Ring

@[expose] public section
namespace PomeranceSarkozy

open Finset

noncomputable def centeredBernoulliRowSum {ι : Type*} [Fintype ι] (p : ι→ℝ) (x : ι→Bool) : ℝ :=
  ∑ i,(bernoulliBoolValue (x i)-p i)

noncomputable def centeredBernoulliRowCumulant {ι : Type*} [Fintype ι] (p : ι→ℝ) (t : ℝ) : ℝ :=
  ∑ i,bernoulliCenteredCumulant (p i) t

noncomputable def bernoulliRowMass {ι : Type*} [Fintype ι] (p : ι→ℝ) (x : ι→Bool) : ℝ :=
  ∏ i,bernoulliBoolMass (p i) (x i)

theorem bernoulliBoolMass_nonneg (p : ℝ) (hp₀ : 0≤ p) (hp₁ : p≤ 1) (b : Bool) :
    0≤ bernoulliBoolMass p b := by cases b <;> simp [bernoulliBoolMass, hp₀, sub_nonneg.mpr hp₁]

theorem bernoulliRowMass_nonneg {ι : Type*} [Fintype ι]
    (p : ι→ℝ) (h₀ : ∀ i,0≤ p i) (h₁ : ∀ i,p i≤ 1) (x : ι→Bool) :
    0≤ bernoulliRowMass p x :=
  Finset.prod_nonneg fun i _=>bernoulliBoolMass_nonneg _ (h₀ i) (h₁ i) _

theorem bernoulliRowMass_total {ι : Type*} [Fintype ι] [DecidableEq ι] (p : ι→ℝ) :
    (∑ x : ι→Bool,bernoulliRowMass p x)=1 := by
  unfold bernoulliRowMass
  have h := Finset.sum_prod_piFinset (ι := ι) (univ : Finset Bool)
    (fun i b=>bernoulliBoolMass (p i) b)
  rw [Fintype.piFinset_univ] at h
  simpa [Fintype.sum_bool,bernoulliBoolMass] using h

private theorem bernoulliRowMass_untilt {ι : Type*} [Fintype ι] (p : ι→ℝ)
    (h₀ : ∀ i,0≤ p i) (h₁ : ∀ i,p i≤ 1) (t : ℝ) (x : ι→Bool) :
    bernoulliRowMass p x =
      bernoulliRowMass (fun i=>bernoulliTiltedProbability (p i) t) x *
        Real.exp (centeredBernoulliRowCumulant p t-t*centeredBernoulliRowSum p x) := by
  have h := bernoulliBoolProduct_centered_tilt univ p (fun i _=>h₀ i) (fun i _=>h₁ i) t x
  change bernoulliRowMass (fun i=>bernoulliTiltedProbability (p i) t) x =
    bernoulliRowMass p x*Real.exp (t*centeredBernoulliRowSum p x-centeredBernoulliRowCumulant p t) at h
  rw [h,mul_assoc,← Real.exp_add]
  rw [show t*centeredBernoulliRowSum p x-centeredBernoulliRowCumulant p t+
      (centeredBernoulliRowCumulant p t-t*centeredBernoulliRowSum p x)=0 by ring,
    Real.exp_zero,mul_one]

/-- Exact finite-sample lower bound from exponential tilting.  The
event need not be an interval; every one of its atoms just has to
satisfy the stated upper bound on the linear tilt. -/
theorem bernoulliRow_event_lower_of_tilt {ι : Type*} [Fintype ι] (p : ι→ℝ)
    (h₀ : ∀ i,0≤ p i) (h₁ : ∀ i,p i≤ 1) (t B : ℝ) (A : Finset (ι→Bool))
    (hA : ∀ x∈A,t*centeredBernoulliRowSum p x≤ B) :
    Real.exp (centeredBernoulliRowCumulant p t-B) *
      (∑ x∈A,bernoulliRowMass (fun i=>bernoulliTiltedProbability (p i) t) x) ≤
        ∑ x∈A,bernoulliRowMass p x := by
  rw [Finset.mul_sum]
  apply Finset.sum_le_sum
  intro x hx
  rw [bernoulliRowMass_untilt p h₀ h₁ t x,mul_comm (Real.exp _)]
  have hq (i : ι) := bernoulliTiltedProbability_mem_Icc (p i) t (h₀ i) (h₁ i)
  exact mul_le_mul_of_nonneg_left (Real.exp_le_exp.mpr (sub_le_sub_left (hA x hx) _))
    (bernoulliRowMass_nonneg _ (fun i=>(hq i).1) (fun i=>(hq i).2) x)

/-- Exact Chernoff upper bound for any event bounded from below in
the tilted linear statistic.  This handles either tail by the
sign of the chosen tilt and does not require strict positivity. -/
theorem bernoulliRow_event_upper_of_tilt {ι : Type*} [Fintype ι] [DecidableEq ι] (p : ι→ℝ)
    (h₀ : ∀ i,0≤ p i) (h₁ : ∀ i,p i≤ 1) (t B : ℝ) (A : Finset (ι→Bool))
    (hA : ∀ x∈A,B≤ t*centeredBernoulliRowSum p x) :
    (∑ x∈A,bernoulliRowMass p x) ≤ Real.exp (centeredBernoulliRowCumulant p t-B) := by
  classical
  let q (i : ι) := bernoulliTiltedProbability (p i) t
  have hq (i : ι) := bernoulliTiltedProbability_mem_Icc (p i) t (h₀ i) (h₁ i)
  have hq₀ := bernoulliRowMass_nonneg q (fun i=>(hq i).1) (fun i=>(hq i).2)
  calc
    _ ≤ Real.exp (centeredBernoulliRowCumulant p t-B)*(∑ x∈A,bernoulliRowMass q x) := by
      rw [Finset.mul_sum]
      apply Finset.sum_le_sum
      intro x hx
      rw [bernoulliRowMass_untilt p h₀ h₁ t x,mul_comm (Real.exp _)]
      exact mul_le_mul_of_nonneg_left (Real.exp_le_exp.mpr (sub_le_sub_left (hA x hx) _)) (hq₀ x)
    _ ≤ Real.exp (centeredBernoulliRowCumulant p t-B)*1 := by
      apply mul_le_mul_of_nonneg_left _ (Real.exp_nonneg _)
      rw [← bernoulliRowMass_total q]
      exact Finset.sum_le_sum_of_subset_of_nonneg (Finset.subset_univ _) (fun x _ _=>hq₀ x)
    _ = _ := mul_one _

end PomeranceSarkozy
