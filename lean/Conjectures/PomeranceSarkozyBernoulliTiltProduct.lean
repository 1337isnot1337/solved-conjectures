module
public import Conjectures.PomeranceSarkozyRareCumulantThird
public import Mathlib.Analysis.Complex.Exponential
import Mathlib.Tactic.FieldSimp
import Mathlib.Tactic.Ring

@[expose] public section
namespace PomeranceSarkozy

open Finset

def bernoulliBoolMass (p : ℝ) (b : Bool) : ℝ := if b then p else 1-p

def bernoulliBoolValue (b : Bool) : ℝ := if b then 1 else 0

/-- The exact Radon–Nikodym weight for one Boolean coordinate,
including coordinates with zero or unit success probability. -/
theorem bernoulliBoolMass_logistic_tilt (p t : ℝ) (hp₀ : 0≤ p) (hp₁ : p≤ 1)
    (b : Bool) :
    bernoulliBoolMass (bernoulliTiltedProbability p t) b =
      bernoulliBoolMass p b * Real.exp (t*bernoulliBoolValue b) /
        bernoulliExponentialDenominator p t := by
  have hD := (bernoulliExponentialDenominator_pos hp₀ hp₁ t).ne'
  cases b with
  | true => simp [bernoulliBoolMass,bernoulliBoolValue,bernoulliTiltedProbability]
  | false =>
    simp only [bernoulliBoolMass,bernoulliBoolValue,Bool.false_eq_true,ite_false,
      mul_zero,Real.exp_zero,mul_one,bernoulliTiltedProbability]
    field_simp
    unfold bernoulliExponentialDenominator
    ring

/-- Tilting a finite independent Bernoulli row changes each
parameter to its logistic tilt, with exactly the joint atom weight. -/
theorem bernoulliBoolProduct_centered_tilt {ι : Type*} (S : Finset ι)
    (p : ι→ℝ) (h₀ : ∀ i∈S,0≤ p i) (h₁ : ∀ i∈S,p i≤ 1)
    (t : ℝ) (x : ι→Bool) :
    (∏ i∈S,bernoulliBoolMass (bernoulliTiltedProbability (p i) t) (x i)) =
      (∏ i∈S,bernoulliBoolMass (p i) (x i)) *
        Real.exp (t*(∑ i∈S,(bernoulliBoolValue (x i)-p i)) -
          (∑ i∈S,bernoulliCenteredCumulant (p i) t)) := by
  let D (i : ι) := bernoulliExponentialDenominator (p i) t
  have hOne (i : ι) (hi : i∈S) :
      bernoulliBoolMass (bernoulliTiltedProbability (p i) t) (x i) =
        bernoulliBoolMass (p i) (x i) * Real.exp (t*(bernoulliBoolValue (x i)-p i)-
          bernoulliCenteredCumulant (p i) t) := by
    rw [bernoulliBoolMass_logistic_tilt _ _ (h₀ i hi) (h₁ i hi)]
    unfold bernoulliCenteredCumulant
    rw [show t*(bernoulliBoolValue (x i)-p i)-
      (Real.log (bernoulliExponentialDenominator (p i) t)-t*p i)=
        t*bernoulliBoolValue (x i)-Real.log (D i) by unfold D; ring,
      Real.exp_sub,Real.exp_log (bernoulliExponentialDenominator_pos (h₀ i hi) (h₁ i hi) t),
      mul_div_assoc]
  rw [Finset.prod_congr rfl hOne,Finset.prod_mul_distrib,← Real.exp_sum]
  congr 2
  rw [Finset.sum_sub_distrib,← Finset.mul_sum]

end PomeranceSarkozy
