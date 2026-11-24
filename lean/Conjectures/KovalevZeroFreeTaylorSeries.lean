import Conjectures.KovalevZeroFreeCoefficients
import Mathlib.Analysis.Analytic.Binomial
import Mathlib.Analysis.Analytic.Uniqueness
import Mathlib.Analysis.Complex.SqrtDeriv
import Mathlib.Analysis.Normed.Ring.InfiniteSum

/-!
# Kovalev's zero-free Taylor polynomial conjecture

The binomial-series identification used in equation (1) of Cinna Davis's
recorded proof, `results/kovalev-zero-free/PROOF.md`, commit
`6432592c03b24aed190ed7b3204ed942a40a8da4`.
The original conjecture is Leonid V. Kovalev's Conjecture 1.2 in
*Sharp bounds for some segments of bounded power series*, arXiv:2507.04544v1.
-/

namespace Conjectures.KovalevZeroFree

open Finset Filter
open scoped Topology

noncomputable section

theorem real_choose_recurrence (a : ℝ) (n : ℕ) :
    ((n : ℝ) + 1) * Ring.choose a (n + 1) =
      (a - (n : ℝ)) * Ring.choose a n := by
  have h := Ring.descPochhammer_eq_factorial_smul_choose a (n + 1)
  rw [descPochhammer_succ_right] at h
  simp only [Polynomial.smeval_mul, Polynomial.smeval_sub, Polynomial.smeval_X,
    Polynomial.smeval_natCast, Nat.factorial_succ, mul_smul, nsmul_eq_mul,
    Nat.cast_add, Nat.cast_one] at h
  rw [Ring.descPochhammer_eq_factorial_smul_choose, nsmul_eq_mul] at h
  have hf : (n.factorial : ℝ) ≠ 0 := by exact_mod_cast Nat.factorial_ne_zero n
  apply (mul_left_cancel₀ hf)
  nlinarith [h]

theorem halfCoeff_eq_choose (n : ℕ) :
    halfCoeff n = (-1 : ℝ) ^ n * Ring.choose (-1 / 2 : ℝ) n := by
  induction n with
  | zero => simp
  | succ n ih =>
    have h := real_choose_recurrence (-1 / 2) n
    have hn : (n : ℝ) + 1 ≠ 0 := by positivity
    apply (mul_left_cancel₀ hn)
    rw [halfCoeff_recurrence, ih, pow_succ]
    calc
      ((n : ℝ) + 1 / 2) * ((-1 : ℝ) ^ n * Ring.choose (-1 / 2) n)
          = -(-1 : ℝ) ^ n * (((n : ℝ) + 1) * Ring.choose (-1 / 2) (n + 1)) := by
              rw [h]; ring
      _ = _ := by ring

theorem correction_eq_choose (n : ℕ) :
    -correction n = (-1 : ℝ) ^ (n + 1) * Ring.choose (1 / 2 : ℝ) (n + 1) := by
  have h := Ring.choose_succ_succ (-1 / 2 : ℝ) n
  rw [show (-1 / 2 : ℝ) + 1 = 1 / 2 by norm_num] at h
  rw [h, mul_add, ← halfCoeff_eq_choose]
  rw [pow_succ]
  rw [show (-1 : ℝ) ^ n * -1 * Ring.choose (-1 / 2) n =
    -((-1 : ℝ) ^ n * Ring.choose (-1 / 2) n) by ring]
  rw [← halfCoeff_eq_choose]
  dsimp [correction]
  ring

theorem halfCoeff_complex_eq_choose (n : ℕ) :
    (halfCoeff n : ℂ) = (-1 : ℂ) ^ n * Ring.choose (-1 / 2 : ℂ) n := by
  have h := congrArg (fun x : ℝ => (x : ℂ)) (halfCoeff_eq_choose n)
  push_cast at h
  exact h

/-- Coefficients of the principal square root of `1-z` at the origin. -/
def sqrtCoeff : ℕ → ℂ
  | 0 => 1
  | n + 1 => -(correction n : ℂ)

theorem sqrtCoeff_eq_choose (n : ℕ) :
    sqrtCoeff n = (-1 : ℂ) ^ n * Ring.choose (1 / 2 : ℂ) n := by
  cases n with
  | zero => simp [sqrtCoeff]
  | succ n =>
    have h := congrArg (fun x : ℝ => (x : ℂ)) (correction_eq_choose n)
    push_cast at h
    exact h

theorem hasSum_halfCoeff {z : ℂ} (hz : ‖z‖ < 1) :
    HasSum (fun n => (halfCoeff n : ℂ) * z ^ n) ((1 - z) ^ (-1 / 2 : ℂ)) := by
  have hb : -z ∈ Metric.eball (0 : ℂ) 1 := by
    rw [← ENNReal.ofReal_one, Metric.eball_ofReal]
    simpa using hz
  have h := (Complex.one_add_cpow_hasFPowerSeriesOnBall_zero
    (a := (-1 / 2 : ℂ))).hasSum hb
  convert h using 1
  · ext n
    simp only [halfCoeff_complex_eq_choose, binomialSeries_apply,
      List.prod_ofFn, Finset.prod_const, Finset.card_univ, Fintype.card_fin,
      smul_eq_mul]
    rw [show (-z) ^ n = (-1 : ℂ) ^ n * z ^ n by rw [neg_pow]]
    ring
  · simp [sub_eq_add_neg]

theorem hasSum_sqrtCoeff {z : ℂ} (hz : ‖z‖ < 1) :
    HasSum (fun n => sqrtCoeff n * z ^ n) (Complex.sqrt (1 - z)) := by
  have hb : -z ∈ Metric.eball (0 : ℂ) 1 := by
    rw [← ENNReal.ofReal_one, Metric.eball_ofReal]
    simpa using hz
  have h := (Complex.one_add_cpow_hasFPowerSeriesOnBall_zero
    (a := (1 / 2 : ℂ))).hasSum hb
  convert h using 1
  · ext n
    simp only [sqrtCoeff_eq_choose, binomialSeries_apply,
      List.prod_ofFn, Finset.prod_const, Finset.card_univ, Fintype.card_fin,
      smul_eq_mul]
    rw [show (-z) ^ n = (-1 : ℂ) ^ n * z ^ n by rw [neg_pow]]
    ring
  · simp [Complex.sqrt, one_div, sub_eq_add_neg]

theorem norm_halfCoeff_le_one (n : ℕ) : ‖(halfCoeff n : ℂ)‖ ≤ 1 := by
  have h := halfCoeff_antitone (Nat.zero_le n)
  simpa [Complex.norm_real, abs_of_pos (halfCoeff_pos n)] using h

theorem norm_sqrtCoeff_le_one (n : ℕ) : ‖sqrtCoeff n‖ ≤ 1 := by
  cases n with
  | zero => simp [sqrtCoeff]
  | succ n =>
    have h := halfCoeff_antitone (Nat.zero_le n)
    have hp := halfCoeff_pos (n + 1)
    simp only [sqrtCoeff, norm_neg, Complex.norm_real, Real.norm_eq_abs,
      abs_of_pos (correction_pos n)]
    simp only [halfCoeff_zero] at h
    dsimp [correction]
    linarith

theorem summable_norm_coeff_mul_pow {c : ℕ → ℂ}
    (hc : ∀ n, ‖c n‖ ≤ 1) {z : ℂ} (hz : ‖z‖ < 1) :
    Summable (fun n => ‖c n * z ^ n‖) := by
  apply Summable.of_nonneg_of_le (fun n => norm_nonneg _) _
    (summable_geometric_of_lt_one (norm_nonneg z) hz)
  intro n
  rw [norm_mul, norm_pow]
  exact mul_le_of_le_one_left (pow_nonneg (norm_nonneg z) n) (hc n)

/-- Coefficients after substituting `z^D` in `sqrt(1-z)`. -/
def dilatedSqrtCoeff (D k : ℕ) : ℂ :=
  if D ∣ k then sqrtCoeff (k / D) else 0

theorem norm_dilatedSqrtCoeff_le_one (D k : ℕ) :
    ‖dilatedSqrtCoeff D k‖ ≤ 1 := by
  unfold dilatedSqrtCoeff
  split_ifs
  · exact norm_sqrtCoeff_le_one _
  · simp

theorem hasSum_dilatedSqrtCoeff {D : ℕ} (hD : 0 < D) {z : ℂ} (hz : ‖z‖ < 1) :
    HasSum (fun k => dilatedSqrtCoeff D k * z ^ k) (Complex.sqrt (1 - z ^ D)) := by
  have hi : Function.Injective (fun j : ℕ => j * D) := by
    intro i j h
    exact Nat.eq_of_mul_eq_mul_right hD h
  have hzD : ‖z ^ D‖ < 1 := by
    rw [norm_pow]
    exact pow_lt_one₀ (norm_nonneg z) hz (Nat.ne_of_gt hD)
  apply (hi.hasSum_iff ?_).mp
  · simpa [Function.comp_def, dilatedSqrtCoeff, Nat.mul_div_cancel, hD,
      ← pow_mul, Nat.mul_comm] using hasSum_sqrtCoeff hzD
  · intro k hk
    have hdiv : ¬D ∣ k := by
      rintro ⟨j, rfl⟩
      exact hk ⟨j, Nat.mul_comm j D⟩
    simp [dilatedSqrtCoeff, hdiv]

end

end Conjectures.KovalevZeroFree
