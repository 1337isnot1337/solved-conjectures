import Conjectures.HeimNeuhauserPlanePartitionSaddle
import Mathlib.Analysis.Normed.Ring.InfiniteSum
import Mathlib.Topology.Algebra.InfiniteSum.Real

/-! Absolute Cauchy products for the original plane-partition generating series. -/

namespace PlanePartition

open Finset PowerSeries
open scoped PowerSeries

section Evaluation

variable {S : Type*} [NormedCommRing S] [Algebra ℝ S]

noncomputable def weightedCoefficient (p : ℝ⟦X⟧) (z : S) (n : ℕ) : S :=
  algebraMap ℝ S (coeff n p) * z ^ n

theorem weightedCoefficient_mul (p q : ℝ⟦X⟧) (z : S) (n : ℕ) :
    weightedCoefficient (p * q) z n = ∑ ij ∈ antidiagonal n,
      weightedCoefficient p z ij.1 * weightedCoefficient q z ij.2 := by
  rw [weightedCoefficient, coeff_mul, map_sum, sum_mul]
  apply sum_congr rfl
  intro ij hij
  rw [map_mul, ← mem_antidiagonal.mp hij, pow_add]
  unfold weightedCoefficient
  ring

theorem weightedCoefficient_pow [CompleteSpace S] (p : ℝ⟦X⟧) (z : S)
    (hs : Summable fun k => ‖weightedCoefficient p z k‖) (m : ℕ) :
    Summable (fun k => ‖weightedCoefficient (p ^ m) z k‖) ∧
      ∑' k, weightedCoefficient (p ^ m) z k = (∑' k, weightedCoefficient p z k) ^ m := by
  induction m with
  | zero =>
    have one (k : ℕ) : weightedCoefficient (1 : ℝ⟦X⟧) z k = if k = 0 then 1 else 0 := by
      by_cases h : k = 0 <;> simp [weightedCoefficient, coeff_one, h]
    simp only [pow_zero, one, apply_ite, norm_zero]
    exact ⟨(hasSum_ite_eq 0 ‖(1 : S)‖).summable, tsum_ite_eq ..⟩
  | succ m ih =>
    constructor
    · simp only [pow_succ, weightedCoefficient_mul]
      exact summable_norm_sum_mul_antidiagonal_of_summable_norm ih.1 hs
    · rw [pow_succ, pow_succ, ← ih.2, tsum_mul_tsum_eq_tsum_sum_antidiagonal_of_summable_norm ih.1 hs]
      simp only [weightedCoefficient_mul]

end Evaluation

theorem exponentSeries_coeff_nonneg {x : ℝ} (hx : 0 ≤ x) (k : ℕ) :
    0 ≤ coeff k (exponentSeries x) := by
  simp only [exponentSeries, coeff_mk]
  split <;> positivity

theorem exponentSeries_pow_coeff_nonneg {x : ℝ} (hx : 0 ≤ x) (m n : ℕ) :
    0 ≤ coeff n (exponentSeries x ^ m) := by
  induction m generalizing n with
  | zero => simp only [pow_zero, coeff_one]; split <;> positivity
  | succ m ih =>
    rw [pow_succ, coeff_mul]
    exact sum_nonneg (fun p _ => mul_nonneg (ih p.1) (exponentSeries_coeff_nonneg hx p.2))

theorem planePartition_tsum_coeff (x : ℝ) (n : ℕ) :
    planePartition x n = ∑' m : ℕ, (m.factorial : ℝ)⁻¹ * coeff n (exponentSeries x ^ m) := by
  have hc : PowerSeries.HasSubst (exponentSeries x) :=
    PowerSeries.HasSubst.of_constantCoeff_zero' (by simp [exponentSeries])
  rw [planePartition, coeff_subst' hc, ← tsum_eq_finsum (L := .unconditional ℕ) (coeff_subst_finite' hc (PowerSeries.exp ℝ) n)]
  simp [coeff_exp]

theorem exponent_weighted_nonneg {x r : ℝ} (hx : 0 ≤ x) (hr : 0 ≤ r) (m n : ℕ) :
    0 ≤ weightedCoefficient (exponentSeries x ^ m) r n :=
  mul_nonneg (exponentSeries_pow_coeff_nonneg hx m n) (pow_nonneg hr _)

end PlanePartition
