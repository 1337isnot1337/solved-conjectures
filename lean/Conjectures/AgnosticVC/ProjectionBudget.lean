module

public import Conjectures.AgnosticVC.ProjectionConditional
public import Conjectures.AgnosticVC.ProjectionMultiscale
import Mathlib.Algebra.Field.GeomSum
import Mathlib.Tactic

@[expose] public section

/-! Summing the multiscale estimate over prediction coordinates. -/

namespace AgnosticVC

open Finset
open scoped BigOperators InnerProductSpace

variable {I : Type*} [Fintype I] [DecidableEq I]

/-- The prediction indicator centered under the given trace law, in Euclidean coordinates. -/
noncomputable def traceProjectionCentered (F : Finset (Finset I)) (p : F → ℝ) (i : I) :
    EuclideanSpace ℝ F :=
  probabilityEmbed p (fun a : F =>
    predictionIndicator i a.1 - expected p (fun a : F => predictionIndicator i a.1))

omit [Fintype I] in
theorem traceProjectionCentered_norm_sq_le (F : Finset (Finset I)) (p : F → ℝ)
    (hp : ∀ a, 0 ≤ p a) (hp1 : ∑ a, p a = 1) (i : I) :
    ‖traceProjectionCentered F p i‖ ^ 2 ≤ 1 / 4 := by
  let f (a : F) := predictionIndicator i a.1
  let μ := expected p f
  have hf (a : F) : f a ^ 2 = f a := by
    dsimp [f, predictionIndicator]
    split <;> norm_num
  change ‖probabilityEmbed p (fun a => f a - μ)‖ ^ 2 ≤ 1 / 4
  rw [probabilityEmbed_norm_sq hp]
  have heq (a : F) : p a * (f a - μ) ^ 2 =
      p a * f a - (2 * μ) * (p a * f a) + μ ^ 2 * p a := by
    calc
      _ = p a * f a ^ 2 - (2 * μ) * (p a * f a) + μ ^ 2 * p a := by ring
      _ = _ := by rw [hf]
  simp_rw [heq, sum_add_distrib, sum_sub_distrib, ← mul_sum, hp1, mul_one]
  change μ - 2 * μ * μ + μ ^ 2 ≤ _
  nlinarith [sq_nonneg (μ - 1 / 2)]

private theorem scaleDecay_budget (n : ℕ) :
    ∑ j : Fin n, (1 / 2 : ℝ) ^ (j : ℕ) ≤ 2 := by
  rw [Fin.sum_univ_eq_sum_range (fun j => (1 / 2 : ℝ) ^ j),
    geom_sum_eq (show (1 / 2 : ℝ) ≠ 1 by norm_num)]
  calc
    _ = 2 - 2 * (1 / 2 : ℝ) ^ n := by ring
    _ ≤ _ := sub_le_self _ (by positivity)

/-- The sum of the quadratic forms in the inverse bound is uniformly (O(d)). -/
theorem traceProjection_budget (F : Finset (Finset I)) (p : F → ℝ)
    (hp : ∀ a, 0 < p a) (hp1 : ∑ a, p a = 1) {n d J : ℕ}
    (hd : 0 < d) (hn : 0 < n) (hdim : F.vcDim ≤ d)
    (hN : d * 4 ^ J < Fintype.card I) (hNn : Fintype.card I ≤ 2 * n) :
    let b := projectionScaleWeight (Real.sqrt ((n : ℝ) / d))
    let B := projectionScaleBand (traceProjectionSubspace F p) d J
    let x := traceProjectionCentered F p
    (∑ i : I, 4 * ∑ j : Fin (J + 2), (b j)⁻¹ ^ 2 * ⟪B j (x i), x i⟫_ℝ) ≤ 64 * d := by
  intro b B x
  let N : ℝ := Fintype.card I
  let t : ℝ := (n : ℝ) / d
  have ht : 0 < t := by dsimp [t]; positivity
  have hB (j : Fin (J + 2)) :
      (∑ i : I, ⟪B j (x i), x i⟫_ℝ) ≤ N * (4 / (4 : ℝ) ^ (j : ℕ)) := by
    by_cases h0 : (j : ℕ) = 0
    · simp only [B, h0, projectionScaleBand_zero, pow_zero, div_one]
      calc
        _ ≤ ∑ i : I, (1 / 4 : ℝ) := sum_le_sum fun i _ =>
          (projectionForm_mono (averagedProjection_le_one _ d (by
            have h4 : 1 ≤ 4 ^ J := Nat.one_le_pow _ _ (by decide)
            exact (Nat.le_mul_of_pos_right d (by omega)).trans hN.le)) (x i)).trans (by
              simpa only [one_apply_eq_self, real_inner_self_eq_norm_sq] using
                traceProjectionCentered_norm_sq_le F p (fun a => (hp a).le) hp1 i)
        _ ≤ N * 4 := by
          rw [sum_const, card_univ, nsmul_eq_mul]
          exact mul_le_mul_of_nonneg_left (by norm_num) (by positivity)
    · let j' := (j : ℕ) - 1
      have hj' : j' ≤ J := by have := j.isLt; omega
      have hm : d * 4 ^ j' < Fintype.card I :=
        (Nat.mul_le_mul_left _ (Nat.pow_le_pow_right (by decide) hj')).trans_lt hN
      have hband := projectionScaleBand_le_prev_residual (S := traceProjectionSubspace F p)
        hN.le (Nat.pos_of_ne_zero h0) (show (j : ℕ) ≤ J + 1 by have := j.isLt; omega)
      calc
        _ ≤ ∑ i : I, ⟪(1 - averagedProjection (traceProjectionSubspace F p) (d * 4 ^ j'))
            (x i), x i⟫_ℝ := sum_le_sum fun i _ => projectionForm_mono hband _
        _ ≤ N * ((d : ℝ) / ((d * 4 ^ j' : ℕ) + 1 : ℝ)) :=
          traceProjection_average_residual_le F p hp hp1 hm hdim
            (fun i => expected p (fun a : F => predictionIndicator i a.1))
        _ ≤ _ := by
          have hj : (j : ℕ) = j' + 1 := by dsimp [j']; omega
          have hP : 0 < (4 : ℝ) ^ j' := by positivity
          rw [hj, pow_succ, show 4 / ((4 : ℝ) ^ j' * 4) = 1 / (4 : ℝ) ^ j' by ring]
          apply mul_le_mul_of_nonneg_left _ (by positivity)
          push_cast
          have hd' : 0 < (d : ℝ) := by exact_mod_cast hd
          apply (div_le_div_iff₀ (by positivity) hP).mpr
          nlinarith
  have hweight (j : Fin (J + 2)) :
      (b j)⁻¹ ^ 2 * (N * (4 / (4 : ℝ) ^ (j : ℕ))) ≤
        (4 * N / t) * (1 / 2 : ℝ) ^ (j : ℕ) := by
    have he : (b j)⁻¹ ^ 2 * (N * (4 / (4 : ℝ) ^ (j : ℕ))) =
        (4 * N / t) * (441 / 1600 : ℝ) ^ (j : ℕ) := by
      change ((Real.sqrt t / (21 / 20 : ℝ) ^ (j : ℕ))⁻¹) ^ 2 *
        (N * (4 / (4 : ℝ) ^ (j : ℕ))) = _
      rw [inv_div, div_pow, Real.sq_sqrt ht.le]
      calc
        _ = (4 * N / t) * (((21 / 20 : ℝ) ^ (j : ℕ)) ^ 2 / (4 : ℝ) ^ (j : ℕ)) := by ring
        _ = _ := by
          rw [← pow_mul, mul_comm (j : ℕ) 2, pow_mul, ← div_pow]
          norm_num
    rw [he]
    exact mul_le_mul_of_nonneg_left (pow_le_pow_left₀ (by norm_num) (by norm_num) _)
      (by positivity)
  rw [← mul_sum, sum_comm (f := fun (i : I) (j : Fin (J + 2)) =>
    (b j)⁻¹ ^ 2 * ⟪B j (x i), x i⟫_ℝ)]
  simp only [← mul_sum]
  calc
    _ ≤ 4 * ∑ j : Fin (J + 2), (4 * N / t) * (1 / 2 : ℝ) ^ (j : ℕ) := by
      apply mul_le_mul_of_nonneg_left _ (by norm_num)
      exact sum_le_sum fun j _ =>
        (mul_le_mul_of_nonneg_left (hB j) (sq_nonneg _)).trans (hweight j)
    _ ≤ 32 * N / t := by
      rw [← mul_sum, ← mul_assoc]
      have h := mul_le_mul_of_nonneg_left (scaleDecay_budget (J + 2))
        (show 0 ≤ 4 * (4 * N / t) by positivity)
      convert h using 1; ring
    _ ≤ _ := by
      have hN' : N ≤ 2 * (n : ℝ) := by
        change (Fintype.card I : ℝ) ≤ 2 * (n : ℝ)
        exact_mod_cast hNn
      apply (div_le_iff₀ ht).mpr
      have hdn : (d : ℝ) ≠ 0 := by exact_mod_cast hd.ne'
      have he : 64 * (d : ℝ) * t = 64 * (n : ℝ) := by dsimp [t]; field_simp
      rw [he]
      linarith

end AgnosticVC
