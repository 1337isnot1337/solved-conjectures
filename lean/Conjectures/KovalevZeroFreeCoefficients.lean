import Mathlib.Analysis.Complex.Basic
import Mathlib.Algebra.BigOperators.Field
import Mathlib.Tactic.FieldSimp
import Mathlib.Tactic.Linarith
import Mathlib.Tactic.NormNum
import Mathlib.Tactic.Positivity
import Mathlib.Tactic.Ring

/-!
# Kovalev's square-root Taylor-section zero-free conjecture

Coefficient identities and the strict coefficient budget from Sections 1 and 3
of `results/kovalev-zero-free/PROOF.md`, commit
`6432592c03b24aed190ed7b3204ed942a40a8da4` (Cinna Davis).
The original conjecture is Leonid V. Kovalev's Conjecture 1.2 in
*Sharp bounds for some segments of bounded power series*, arXiv:2507.04544v1.
These algebraic lemmas alone do not establish the zero-free theorem.
-/

namespace Conjectures.KovalevZeroFree

open Finset

noncomputable section

/-- The coefficients `(1/2)_k / k!` of the inverse square root. -/
def halfCoeff : ℕ → ℝ
  | 0 => 1
  | k + 1 => ((k : ℝ) + 1 / 2) / ((k : ℝ) + 1) * halfCoeff k

@[simp] theorem halfCoeff_zero : halfCoeff 0 = 1 := rfl

theorem halfCoeff_succ (k : ℕ) :
    halfCoeff (k + 1) = ((k : ℝ) + 1 / 2) / ((k : ℝ) + 1) * halfCoeff k := rfl

theorem halfCoeff_pos (k : ℕ) : 0 < halfCoeff k := by
  induction k with
  | zero => norm_num [halfCoeff]
  | succ k ih => rw [halfCoeff_succ]; positivity

theorem halfCoeff_recurrence (k : ℕ) :
    ((k : ℝ) + 1) * halfCoeff (k + 1) = ((k : ℝ) + 1 / 2) * halfCoeff k := by
  rw [halfCoeff_succ]
  field_simp

theorem halfCoeff_succ_lt (k : ℕ) : halfCoeff (k + 1) < halfCoeff k := by
  have h := halfCoeff_recurrence k
  have hp := halfCoeff_pos k
  nlinarith

theorem halfCoeff_antitone : Antitone halfCoeff :=
  antitone_nat_of_succ_le fun k => (halfCoeff_succ_lt k).le

/-- The positive coefficient `c_(k+1)` in `1 - sqrt(1-z)`. -/
def correction (k : ℕ) : ℝ := halfCoeff k - halfCoeff (k + 1)

theorem correction_pos (k : ℕ) : 0 < correction k :=
  sub_pos.mpr (halfCoeff_succ_lt k)

theorem correction_recurrence (k : ℕ) :
    ((k : ℝ) + 1) * correction k = halfCoeff k / 2 := by
  have h := halfCoeff_recurrence k
  dsimp [correction]
  nlinarith

theorem sum_correction (J : ℕ) :
    ∑ j ∈ range J, correction j = 1 - halfCoeff J := by
  induction J with
  | zero => simp
  | succ J ih => rw [sum_range_succ, ih]; simp [correction]

theorem sum_weighted_correction (J : ℕ) :
    ∑ j ∈ range J, ((j : ℝ) + 1) * correction j = (J : ℝ) * halfCoeff J := by
  induction J with
  | zero => simp
  | succ J ih =>
    rw [sum_range_succ, ih, Nat.cast_add, Nat.cast_one]
    have h := halfCoeff_recurrence J
    dsimp [correction]
    nlinarith

/-- The source's strict coefficient budget, with no restriction on `J`, `D`, or `n`
other than the exact section-index inequality. -/
theorem correction_budget_lt (J D n : ℕ) (hJD : J * D ≤ n) (p : ℕ → ℝ)
    (hp : ∀ j ∈ range J, p j ≤ 1 + (D : ℝ) * ((j : ℝ) + 1) / ((n : ℝ) + 1)) :
    ∑ j ∈ range J, correction j * p j < 1 := by
  have hn : 0 < (n : ℝ) + 1 := by positivity
  have hJD' : (J : ℝ) * (D : ℝ) ≤ (n : ℝ) := by exact_mod_cast hJD
  have hB := halfCoeff_pos J
  calc
    ∑ j ∈ range J, correction j * p j
        ≤ ∑ j ∈ range J,
            correction j * (1 + (D : ℝ) * ((j : ℝ) + 1) / ((n : ℝ) + 1)) := by
          exact sum_le_sum fun j hj => mul_le_mul_of_nonneg_left (hp j hj)
            (correction_pos j).le
    _ = (1 - halfCoeff J) + ((D : ℝ) / ((n : ℝ) + 1)) *
          ((J : ℝ) * halfCoeff J) := by
        calc
          _ = (∑ j ∈ range J, correction j) +
                ((D : ℝ) / ((n : ℝ) + 1)) *
                (∑ j ∈ range J, ((j : ℝ) + 1) * correction j) := by
                  rw [mul_sum, ← sum_add_distrib]
                  exact sum_congr rfl fun j _ => by ring
          _ = _ := by rw [sum_correction, sum_weighted_correction]
    _ < 1 := by
      rw [div_mul_eq_mul_div]
      have hm := mul_le_mul_of_nonneg_right hJD' hB.le
      have hf : (D : ℝ) * ((J : ℝ) * halfCoeff J) / ((n : ℝ) + 1) < halfCoeff J := by
        apply (div_lt_iff₀ hn).mpr
        nlinarith
      linarith

/-- A section of `(1-z)^(-1/2)`. -/
def invSection (M : ℕ) (z : ℂ) : ℂ :=
  ∑ k ∈ range (M + 1), (halfCoeff k : ℂ) * z ^ k

/-- The exact finite coefficient-convolution formula from equation (1).
Its identification with the actual analytic Taylor coefficients is proved separately. -/
def sectionPolynomial (D n : ℕ) (z : ℂ) : ℂ :=
  invSection n z - ∑ j ∈ range (n / D),
    (correction j : ℂ) * z ^ ((j + 1) * D) * invSection (n - (j + 1) * D) z

theorem invSection_zero (n : ℕ) : invSection n 0 = 1 := by
  simp [invSection, sum_range_succ']

theorem invSection_one_re (n : ℕ) : (invSection n 1).re =
    ∑ k ∈ range (n + 1), halfCoeff k := by
  simp [invSection]

theorem invSection_one_im (n : ℕ) : (invSection n 1).im = 0 := by
  simp [invSection]

theorem invSection_one_re_pos (n : ℕ) : 0 < (invSection n 1).re := by
  rw [invSection_one_re]
  exact sum_pos (fun k _ => halfCoeff_pos k) (nonempty_range_iff.mpr (by omega))

theorem invSection_one_re_mono {m n : ℕ} (hmn : m ≤ n) :
    (invSection m 1).re ≤ (invSection n 1).re := by
  rw [invSection_one_re, invSection_one_re]
  exact sum_le_sum_of_subset_of_nonneg (range_mono (Nat.add_le_add_right hmn 1))
    (fun k _ _ => (halfCoeff_pos k).le)

theorem section_one_re_pos (D n : ℕ) : 0 < (sectionPolynomial D n 1).re := by
  have hB := halfCoeff_pos (n / D)
  have hA := invSection_one_re_pos n
  have hsum :
      (∑ j ∈ range (n / D), correction j * (invSection (n - (j + 1) * D) 1).re)
        ≤ (1 - halfCoeff (n / D)) * (invSection n 1).re := by
    calc
      _ ≤ ∑ j ∈ range (n / D), correction j * (invSection n 1).re := by
        exact sum_le_sum fun j _ => mul_le_mul_of_nonneg_left
          (invSection_one_re_mono (Nat.sub_le _ _)) (correction_pos j).le
      _ = _ := by rw [← sum_mul, sum_correction]
  have hre : (sectionPolynomial D n 1).re = (invSection n 1).re -
      ∑ j ∈ range (n / D), correction j * (invSection (n - (j + 1) * D) 1).re := by
    simp [sectionPolynomial, Complex.mul_re]
  rw [hre]
  nlinarith

theorem section_one_ne_zero (D n : ℕ) : sectionPolynomial D n 1 ≠ 0 := by
  intro h
  have := section_one_re_pos D n
  rw [h, Complex.zero_re] at this
  exact lt_irrefl _ this

end

end Conjectures.KovalevZeroFree
