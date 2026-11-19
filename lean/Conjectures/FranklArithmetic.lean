module

public import Mathlib.Algebra.Order.Ring.Pow
public import Mathlib.Basic.Real.Basic
public import Mathlib.Tactic.FieldSimp
public import Mathlib.Tactic.Linarith
public import Mathlib.Tactic.NormNum
public import Mathlib.Tactic.Positivity
public import Mathlib.Tactic.Ring


@[expose] public section

/-!
Exact numerical bounds for the large-generator argument in
`results/frankl-generator-families/HIGH-GIRTH.md`.

These theorems only discharge its arithmetic. They do not assume or assert
the combinatorial lopsided-dependence or uniform-union statements.
-/

namespace FranklArithmetic

/-- The sufficient local-lemma test holds for every integer `k ≥ 15`. -/
theorem sufficient_test (k : ℕ) (hk : 15 ≤ k) :
    (2 * (k : ℝ)) * (3 / 4 : ℝ) ^ k ≤ 20 / 49 := by
  induction k, hk using Nat.le_induction with
  | base => norm_num
  | succ k hk ih =>
    have hkR : (15 : ℝ) ≤ k := by exact_mod_cast hk
    have hp : 0 ≤ (3 / 4 : ℝ) ^ k := by positivity
    have hstep : (2 * ((k : ℝ) + 1)) * (3 / 4 : ℝ) ≤ 2 * (k : ℝ) := by
      nlinarith
    calc
      (2 * ((k + 1 : ℕ) : ℝ)) * (3 / 4 : ℝ) ^ (k + 1) =
          ((2 * ((k : ℝ) + 1)) * (3 / 4 : ℝ)) * (3 / 4 : ℝ) ^ k := by
        push_cast
        rw [pow_succ]
        ring
      _ ≤ (2 * (k : ℝ)) * (3 / 4 : ℝ) ^ k := mul_le_mul_of_nonneg_right hstep hp
      _ ≤ 20 / 49 := ih

/-- The chosen conditional-event bound. -/
noncomputable def eventBound (k : ℕ) : ℝ := 1 / (7 * (k : ℝ))

theorem eventBound_pos {k : ℕ} (hk : 0 < k) : 0 < eventBound k := by
  unfold eventBound
  positivity

theorem eventBound_le_one {k : ℕ} (hk : 0 < k) : eventBound k ≤ 1 := by
  have hkR : (1 : ℝ) ≤ k := by exact_mod_cast hk
  unfold eventBound
  apply (div_le_iff₀ (by positivity : (0 : ℝ) < 7 * k)).2
  nlinarith

theorem avoidance_block {k : ℕ} (hk : 0 < k) :
    5 / 7 ≤ (1 - eventBound k) ^ (2 * k) := by
  have hkR : (0 : ℝ) < k := by exact_mod_cast hk
  have hx : eventBound k ≤ 1 := eventBound_le_one hk
  have h := one_add_mul_le_pow (a := -eventBound k) (by linarith : -2 ≤ -eventBound k)
    (2 * k)
  have hid : 1 + ((2 * k : ℕ) : ℝ) * (-eventBound k) = 5 / 7 := by
    unfold eventBound
    push_cast
    field_simp
    ring
  rw [hid] at h
  simpa only [sub_eq_add_neg] using h

/-- The exact event probability meets the lopsided local-lemma criterion. -/
theorem lopsided_criterion {k : ℕ} (hk : 15 ≤ k) :
    (1 / 2 : ℝ) * (3 / 4 : ℝ) ^ k ≤
      eventBound k * (1 - eventBound k) ^ (2 * k) := by
  have hk0 : 0 < k := by omega
  have hkR : (0 : ℝ) < k := by exact_mod_cast hk0
  have htest := sufficient_test k hk
  have hnum : (1 / 2 : ℝ) * (3 / 4 : ℝ) ^ k ≤ eventBound k * (5 / 7) := by
    unfold eventBound
    calc
      (1 / 2 : ℝ) * (3 / 4 : ℝ) ^ k ≤ (5 / 7) / (7 * (k : ℝ)) := by
        apply (le_div_iff₀ (by positivity : (0 : ℝ) < 7 * k)).2
        nlinarith
      _ = 1 / (7 * (k : ℝ)) * (5 / 7) := by ring
  exact hnum.trans (mul_le_mul_of_nonneg_left (avoidance_block hk0)
    (eventBound_pos hk0).le)

/-- Three blocks of at most `2k` conditioning events have avoidance at least `(5/7)^3`. -/
theorem avoidance_three_blocks {k : ℕ} (hk : 0 < k) :
    (5 / 7 : ℝ) ^ 3 ≤ (1 - eventBound k) ^ (3 * (2 * k)) := by
  have h := pow_le_pow_left₀ (by norm_num : (0 : ℝ) ≤ 5 / 7) (avoidance_block hk) 3
  simpa [pow_mul, Nat.mul_comm] using h

/-- The query factor is exactly `343/1000`, without decimal rounding. -/
theorem absence_bound {k : ℕ} (hk : 0 < k) :
    (1 / 8 : ℝ) / (1 - eventBound k) ^ (3 * (2 * k)) ≤ 343 / 1000 := by
  have h := avoidance_three_blocks hk
  have hd : (0 : ℝ) < (1 - eventBound k) ^ (3 * (2 * k)) :=
    lt_of_lt_of_le (by norm_num) h
  apply (div_le_iff₀ hd).2
  nlinarith

theorem presence_of_absence {p : ℝ} (hp : p ≤ 343 / 1000) : 657 / 1000 ≤ 1 - p := by
  linarith

end FranklArithmetic
