module

public import Conjectures.ChowCone
public import Conjectures.ChowRefinement
public import Mathlib.Algebra.Polynomial.Eval.Defs

/-!
# Exact rank-four certificates and all-rank ordered inequalities

Each rank-four certificate is an explicit polynomial identity expressing an
imaginary part as `Im z` times a sum of nonnegative squared moduli with
positive rational coefficients. Lean checks each identity by ring arithmetic.
The induction then uses the proved cutoff recurrence preservation theorem.
-/

@[expose] public section

namespace Chow

open Polynomial
open scoped BigOperators ComplexConjugate

noncomputable section

/-- Complex evaluation of a real polynomial. -/
def ceval (P : ℝ[X]) (z : ℂ) : ℂ := (P.map Complex.ofRealHom).eval z

/-- The explicit rank-four row from the refined recurrence. -/
def baseRow4 (i : Fin 8) : ℝ[X] :=
  let v : ℝ[X] := X
  match i.val with
  | 0 => 2 * (v + 1) * (v ^ 2 + 10 * v + 1)
  | 1 => 4 * v * (v + 1) * (v + 5)
  | 2 => 2 * v * (3 * v ^ 2 + 14 * v + 7)
  | 3 => 2 * v * (5 * v ^ 2 + 14 * v + 5)
  | 4 => 2 * v * (5 * v ^ 2 + 14 * v + 5)
  | 5 => 2 * v * (7 * v ^ 2 + 14 * v + 3)
  | 6 => 4 * v * (v + 1) * (5 * v + 1)
  | _ => 2 * v * (v + 1) * (v ^ 2 + 10 * v + 1)

/-- The same explicit row evaluated at a complex point. -/
def baseValue4 (i : Fin 8) (v : ℂ) : ℂ :=
  match i.val with
  | 0 => 2 * (v + 1) * (v ^ 2 + 10 * v + 1)
  | 1 => 4 * v * (v + 1) * (v + 5)
  | 2 => 2 * v * (3 * v ^ 2 + 14 * v + 7)
  | 3 => 2 * v * (5 * v ^ 2 + 14 * v + 5)
  | 4 => 2 * v * (5 * v ^ 2 + 14 * v + 5)
  | 5 => 2 * v * (7 * v ^ 2 + 14 * v + 3)
  | 6 => 4 * v * (v + 1) * (5 * v + 1)
  | _ => 2 * v * (v + 1) * (v ^ 2 + 10 * v + 1)

theorem baseRow4_ceval (i : Fin 8) (z : ℂ) : ceval (baseRow4 i) z = baseValue4 i z := by
  fin_cases i <;> simp [ceval, baseRow4, baseValue4]

theorem refinedRow_two (i : Fin 8) : refinedRow 2 i = baseRow4 i := by
  fin_cases i <;> norm_num [refinedRow, nextRow, baseRow2, cutoff, baseRow4,
    Fin.sum_univ_succ, Polynomial.C_ofNat] <;> ring

private theorem base_pair_0_1 (z : ℂ) (hz : 0 ≤ z.im) :
    0 ≤ (baseValue4 1 z * conj (baseValue4 0 z)).im ∧
    0 ≤ (z * baseValue4 0 z * conj (baseValue4 1 z)).im := by
  constructor
  · have h : (baseValue4 1 z * conj (baseValue4 0 z)).im =
        z.im * (40 * Complex.normSq (1 + (6 / 5) * z + (1 / 5) * z ^ 2) + (192 / 5) * Complex.normSq (z + z ^ 2)) := by
      norm_num [baseValue4, Complex.normSq_apply, Complex.mul_re, Complex.mul_im,
        Complex.add_re, Complex.add_im, Complex.conj_re, Complex.conj_im, pow_succ]
      ring
    rw [h]
    exact mul_nonneg hz (add_nonneg (mul_nonneg (by norm_num) (Complex.normSq_nonneg (1 + (6 / 5) * z + (1 / 5) * z ^ 2))) (mul_nonneg (by norm_num) (Complex.normSq_nonneg (z + z ^ 2))))
  · have h : (z * baseValue4 0 z * conj (baseValue4 1 z)).im =
        z.im * (392 * Complex.normSq (z + (54 / 49) * z ^ 2 + (5 / 49) * z ^ 3) + (192 / 49) * Complex.normSq (z ^ 2 + z ^ 3)) := by
      norm_num [baseValue4, Complex.normSq_apply, Complex.mul_re, Complex.mul_im,
        Complex.add_re, Complex.add_im, Complex.conj_re, Complex.conj_im, pow_succ]
      ring
    rw [h]
    exact mul_nonneg hz (add_nonneg (mul_nonneg (by norm_num) (Complex.normSq_nonneg (z + (54 / 49) * z ^ 2 + (5 / 49) * z ^ 3))) (mul_nonneg (by norm_num) (Complex.normSq_nonneg (z ^ 2 + z ^ 3))))
private theorem base_pair_0_2 (z : ℂ) (hz : 0 ≤ z.im) :
    0 ≤ (baseValue4 2 z * conj (baseValue4 0 z)).im ∧
    0 ≤ (z * baseValue4 0 z * conj (baseValue4 2 z)).im := by
  constructor
  · have h : (baseValue4 2 z * conj (baseValue4 0 z)).im =
        z.im * (28 * Complex.normSq (1 + 2 * z + (3 / 7) * z ^ 2) + 208 * Complex.normSq (z + (5 / 13) * z ^ 2) + (3648 / 91) * Complex.normSq (z ^ 2)) := by
      norm_num [baseValue4, Complex.normSq_apply, Complex.mul_re, Complex.mul_im,
        Complex.add_re, Complex.add_im, Complex.conj_re, Complex.conj_im, pow_succ]
      ring
    rw [h]
    exact mul_nonneg hz (add_nonneg (add_nonneg (mul_nonneg (by norm_num) (Complex.normSq_nonneg (1 + 2 * z + (3 / 7) * z ^ 2))) (mul_nonneg (by norm_num) (Complex.normSq_nonneg (z + (5 / 13) * z ^ 2)))) (mul_nonneg (by norm_num) (Complex.normSq_nonneg (z ^ 2))))
  · have h : (z * baseValue4 0 z * conj (baseValue4 2 z)).im =
        z.im * (252 * Complex.normSq (z + (74 / 63) * z ^ 2 + (1 / 9) * z ^ 3) + (10352 / 63) * Complex.normSq (z ^ 2 + (91 / 647) * z ^ 3) + (3648 / 647) * Complex.normSq (z ^ 3)) := by
      norm_num [baseValue4, Complex.normSq_apply, Complex.mul_re, Complex.mul_im,
        Complex.add_re, Complex.add_im, Complex.conj_re, Complex.conj_im, pow_succ]
      ring
    rw [h]
    exact mul_nonneg hz (add_nonneg (add_nonneg (mul_nonneg (by norm_num) (Complex.normSq_nonneg (z + (74 / 63) * z ^ 2 + (1 / 9) * z ^ 3))) (mul_nonneg (by norm_num) (Complex.normSq_nonneg (z ^ 2 + (91 / 647) * z ^ 3)))) (mul_nonneg (by norm_num) (Complex.normSq_nonneg (z ^ 3))))
private theorem base_pair_0_3 (z : ℂ) (hz : 0 ≤ z.im) :
    0 ≤ (baseValue4 3 z * conj (baseValue4 0 z)).im ∧
    0 ≤ (z * baseValue4 0 z * conj (baseValue4 3 z)).im := by
  constructor
  · have h : (baseValue4 3 z * conj (baseValue4 0 z)).im =
        z.im * (20 * Complex.normSq (1 + (14 / 5) * z + z ^ 2) + (1296 / 5) * Complex.normSq (z + (5 / 9) * z ^ 2) + 64 * Complex.normSq (z ^ 2)) := by
      norm_num [baseValue4, Complex.normSq_apply, Complex.mul_re, Complex.mul_im,
        Complex.add_re, Complex.add_im, Complex.conj_re, Complex.conj_im, pow_succ]
      ring
    rw [h]
    exact mul_nonneg hz (add_nonneg (add_nonneg (mul_nonneg (by norm_num) (Complex.normSq_nonneg (1 + (14 / 5) * z + z ^ 2))) (mul_nonneg (by norm_num) (Complex.normSq_nonneg (z + (5 / 9) * z ^ 2)))) (mul_nonneg (by norm_num) (Complex.normSq_nonneg (z ^ 2))))
  · have h : (z * baseValue4 0 z * conj (baseValue4 3 z)).im =
        z.im * (164 * Complex.normSq (z + (50 / 41) * z ^ 2 + (5 / 41) * z ^ 3) + (7056 / 41) * Complex.normSq (z ^ 2 + (9 / 49) * z ^ 3) + (576 / 49) * Complex.normSq (z ^ 3)) := by
      norm_num [baseValue4, Complex.normSq_apply, Complex.mul_re, Complex.mul_im,
        Complex.add_re, Complex.add_im, Complex.conj_re, Complex.conj_im, pow_succ]
      ring
    rw [h]
    exact mul_nonneg hz (add_nonneg (add_nonneg (mul_nonneg (by norm_num) (Complex.normSq_nonneg (z + (50 / 41) * z ^ 2 + (5 / 41) * z ^ 3))) (mul_nonneg (by norm_num) (Complex.normSq_nonneg (z ^ 2 + (9 / 49) * z ^ 3)))) (mul_nonneg (by norm_num) (Complex.normSq_nonneg (z ^ 3))))
private theorem base_pair_0_4 (z : ℂ) (hz : 0 ≤ z.im) :
    0 ≤ (baseValue4 4 z * conj (baseValue4 0 z)).im ∧
    0 ≤ (z * baseValue4 0 z * conj (baseValue4 4 z)).im := by
  constructor
  · have h : (baseValue4 4 z * conj (baseValue4 0 z)).im =
        z.im * (20 * Complex.normSq (1 + (14 / 5) * z + z ^ 2) + (1296 / 5) * Complex.normSq (z + (5 / 9) * z ^ 2) + 64 * Complex.normSq (z ^ 2)) := by
      norm_num [baseValue4, Complex.normSq_apply, Complex.mul_re, Complex.mul_im,
        Complex.add_re, Complex.add_im, Complex.conj_re, Complex.conj_im, pow_succ]
      ring
    rw [h]
    exact mul_nonneg hz (add_nonneg (add_nonneg (mul_nonneg (by norm_num) (Complex.normSq_nonneg (1 + (14 / 5) * z + z ^ 2))) (mul_nonneg (by norm_num) (Complex.normSq_nonneg (z + (5 / 9) * z ^ 2)))) (mul_nonneg (by norm_num) (Complex.normSq_nonneg (z ^ 2))))
  · have h : (z * baseValue4 0 z * conj (baseValue4 4 z)).im =
        z.im * (164 * Complex.normSq (z + (50 / 41) * z ^ 2 + (5 / 41) * z ^ 3) + (7056 / 41) * Complex.normSq (z ^ 2 + (9 / 49) * z ^ 3) + (576 / 49) * Complex.normSq (z ^ 3)) := by
      norm_num [baseValue4, Complex.normSq_apply, Complex.mul_re, Complex.mul_im,
        Complex.add_re, Complex.add_im, Complex.conj_re, Complex.conj_im, pow_succ]
      ring
    rw [h]
    exact mul_nonneg hz (add_nonneg (add_nonneg (mul_nonneg (by norm_num) (Complex.normSq_nonneg (z + (50 / 41) * z ^ 2 + (5 / 41) * z ^ 3))) (mul_nonneg (by norm_num) (Complex.normSq_nonneg (z ^ 2 + (9 / 49) * z ^ 3)))) (mul_nonneg (by norm_num) (Complex.normSq_nonneg (z ^ 3))))
private theorem base_pair_0_5 (z : ℂ) (hz : 0 ≤ z.im) :
    0 ≤ (baseValue4 5 z * conj (baseValue4 0 z)).im ∧
    0 ≤ (z * baseValue4 0 z * conj (baseValue4 5 z)).im := by
  constructor
  · have h : (baseValue4 5 z * conj (baseValue4 0 z)).im =
        z.im * (12 * Complex.normSq (1 + (14 / 3) * z + (7 / 3) * z ^ 2) + (752 / 3) * Complex.normSq (z + (31 / 47) * z ^ 2) + (3648 / 47) * Complex.normSq (z ^ 2)) := by
      norm_num [baseValue4, Complex.normSq_apply, Complex.mul_re, Complex.mul_im,
        Complex.add_re, Complex.add_im, Complex.conj_re, Complex.conj_im, pow_succ]
      ring
    rw [h]
    exact mul_nonneg hz (add_nonneg (add_nonneg (mul_nonneg (by norm_num) (Complex.normSq_nonneg (1 + (14 / 3) * z + (7 / 3) * z ^ 2))) (mul_nonneg (by norm_num) (Complex.normSq_nonneg (z + (31 / 47) * z ^ 2)))) (mul_nonneg (by norm_num) (Complex.normSq_nonneg (z ^ 2))))
  · have h : (z * baseValue4 0 z * conj (baseValue4 5 z)).im =
        z.im * (76 * Complex.normSq (z + (26 / 19) * z ^ 2 + (3 / 19) * z ^ 3) + (3376 / 19) * Complex.normSq (z ^ 2 + (47 / 211) * z ^ 3) + (3648 / 211) * Complex.normSq (z ^ 3)) := by
      norm_num [baseValue4, Complex.normSq_apply, Complex.mul_re, Complex.mul_im,
        Complex.add_re, Complex.add_im, Complex.conj_re, Complex.conj_im, pow_succ]
      ring
    rw [h]
    exact mul_nonneg hz (add_nonneg (add_nonneg (mul_nonneg (by norm_num) (Complex.normSq_nonneg (z + (26 / 19) * z ^ 2 + (3 / 19) * z ^ 3))) (mul_nonneg (by norm_num) (Complex.normSq_nonneg (z ^ 2 + (47 / 211) * z ^ 3)))) (mul_nonneg (by norm_num) (Complex.normSq_nonneg (z ^ 3))))
private theorem base_pair_0_6 (z : ℂ) (hz : 0 ≤ z.im) :
    0 ≤ (baseValue4 6 z * conj (baseValue4 0 z)).im ∧
    0 ≤ (z * baseValue4 0 z * conj (baseValue4 6 z)).im := by
  constructor
  · have h : (baseValue4 6 z * conj (baseValue4 0 z)).im =
        z.im * (8 * Complex.normSq (1 + 6 * z + 5 * z ^ 2) + 192 * Complex.normSq (z + z ^ 2)) := by
      norm_num [baseValue4, Complex.normSq_apply, Complex.mul_re, Complex.mul_im,
        Complex.add_re, Complex.add_im, Complex.conj_re, Complex.conj_im, pow_succ]
      ring
    rw [h]
    exact mul_nonneg hz (add_nonneg (mul_nonneg (by norm_num) (Complex.normSq_nonneg (1 + 6 * z + 5 * z ^ 2))) (mul_nonneg (by norm_num) (Complex.normSq_nonneg (z + z ^ 2))))
  · have h : (z * baseValue4 0 z * conj (baseValue4 6 z)).im =
        z.im * (40 * Complex.normSq (z + (6 / 5) * z ^ 2 + (1 / 5) * z ^ 3) + (192 / 5) * Complex.normSq (z ^ 2 + z ^ 3)) := by
      norm_num [baseValue4, Complex.normSq_apply, Complex.mul_re, Complex.mul_im,
        Complex.add_re, Complex.add_im, Complex.conj_re, Complex.conj_im, pow_succ]
      ring
    rw [h]
    exact mul_nonneg hz (add_nonneg (mul_nonneg (by norm_num) (Complex.normSq_nonneg (z + (6 / 5) * z ^ 2 + (1 / 5) * z ^ 3))) (mul_nonneg (by norm_num) (Complex.normSq_nonneg (z ^ 2 + z ^ 3))))
private theorem base_pair_0_7 (z : ℂ) (hz : 0 ≤ z.im) :
    0 ≤ (baseValue4 7 z * conj (baseValue4 0 z)).im ∧
    0 ≤ (z * baseValue4 0 z * conj (baseValue4 7 z)).im := by
  constructor
  · have h : (baseValue4 7 z * conj (baseValue4 0 z)).im =
        z.im * (4 * Complex.normSq (1 + 11 * z + 11 * z ^ 2 + z ^ 3)) := by
      norm_num [baseValue4, Complex.normSq_apply, Complex.mul_re, Complex.mul_im,
        Complex.add_re, Complex.add_im, Complex.conj_re, Complex.conj_im, pow_succ]
      ring
    rw [h]
    exact mul_nonneg hz (mul_nonneg (by norm_num) (Complex.normSq_nonneg (1 + 11 * z + 11 * z ^ 2 + z ^ 3)))
  · have h : (z * baseValue4 0 z * conj (baseValue4 7 z)).im =
        z.im * (0) := by
      norm_num [baseValue4, Complex.normSq_apply, Complex.mul_re, Complex.mul_im,
        Complex.add_re, Complex.add_im, Complex.conj_re, Complex.conj_im, pow_succ]
      ring
    rw [h]
    exact mul_nonneg hz (by norm_num)
private theorem base_pair_1_2 (z : ℂ) (hz : 0 ≤ z.im) :
    0 ≤ (baseValue4 2 z * conj (baseValue4 1 z)).im ∧
    0 ≤ (z * baseValue4 1 z * conj (baseValue4 2 z)).im := by
  constructor
  · have h : (baseValue4 2 z * conj (baseValue4 1 z)).im =
        z.im * (224 * Complex.normSq (z + (2 / 7) * z ^ 2) + (96 / 7) * Complex.normSq (z ^ 2)) := by
      norm_num [baseValue4, Complex.normSq_apply, Complex.mul_re, Complex.mul_im,
        Complex.add_re, Complex.add_im, Complex.conj_re, Complex.conj_im, pow_succ]
      ring
    rw [h]
    exact mul_nonneg hz (add_nonneg (mul_nonneg (by norm_num) (Complex.normSq_nonneg (z + (2 / 7) * z ^ 2))) (mul_nonneg (by norm_num) (Complex.normSq_nonneg (z ^ 2))))
  · have h : (z * baseValue4 1 z * conj (baseValue4 2 z)).im =
        z.im * (280 * Complex.normSq (z + (6 / 5) * z ^ 2 + (1 / 5) * z ^ 3) + (1024 / 5) * Complex.normSq (z ^ 2 + (7 / 32) * z ^ 3) + 3 * Complex.normSq (z ^ 3)) := by
      norm_num [baseValue4, Complex.normSq_apply, Complex.mul_re, Complex.mul_im,
        Complex.add_re, Complex.add_im, Complex.conj_re, Complex.conj_im, pow_succ]
      ring
    rw [h]
    exact mul_nonneg hz (add_nonneg (add_nonneg (mul_nonneg (by norm_num) (Complex.normSq_nonneg (z + (6 / 5) * z ^ 2 + (1 / 5) * z ^ 3))) (mul_nonneg (by norm_num) (Complex.normSq_nonneg (z ^ 2 + (7 / 32) * z ^ 3)))) (mul_nonneg (by norm_num) (Complex.normSq_nonneg (z ^ 3))))
private theorem base_pair_1_3 (z : ℂ) (hz : 0 ≤ z.im) :
    0 ≤ (baseValue4 3 z * conj (baseValue4 1 z)).im ∧
    0 ≤ (z * baseValue4 1 z * conj (baseValue4 3 z)).im := by
  constructor
  · have h : (baseValue4 3 z * conj (baseValue4 1 z)).im =
        z.im * (320 * Complex.normSq (z + (1 / 2) * z ^ 2) + 48 * Complex.normSq (z ^ 2)) := by
      norm_num [baseValue4, Complex.normSq_apply, Complex.mul_re, Complex.mul_im,
        Complex.add_re, Complex.add_im, Complex.conj_re, Complex.conj_im, pow_succ]
      ring
    rw [h]
    exact mul_nonneg hz (add_nonneg (mul_nonneg (by norm_num) (Complex.normSq_nonneg (z + (1 / 2) * z ^ 2))) (mul_nonneg (by norm_num) (Complex.normSq_nonneg (z ^ 2))))
  · have h : (z * baseValue4 1 z * conj (baseValue4 3 z)).im =
        z.im * (200 * Complex.normSq (z + (6 / 5) * z ^ 2 + (1 / 5) * z ^ 3) + 224 * Complex.normSq (z ^ 2 + (2 / 7) * z ^ 3) + (96 / 7) * Complex.normSq (z ^ 3)) := by
      norm_num [baseValue4, Complex.normSq_apply, Complex.mul_re, Complex.mul_im,
        Complex.add_re, Complex.add_im, Complex.conj_re, Complex.conj_im, pow_succ]
      ring
    rw [h]
    exact mul_nonneg hz (add_nonneg (add_nonneg (mul_nonneg (by norm_num) (Complex.normSq_nonneg (z + (6 / 5) * z ^ 2 + (1 / 5) * z ^ 3))) (mul_nonneg (by norm_num) (Complex.normSq_nonneg (z ^ 2 + (2 / 7) * z ^ 3)))) (mul_nonneg (by norm_num) (Complex.normSq_nonneg (z ^ 3))))
private theorem base_pair_1_4 (z : ℂ) (hz : 0 ≤ z.im) :
    0 ≤ (baseValue4 4 z * conj (baseValue4 1 z)).im ∧
    0 ≤ (z * baseValue4 1 z * conj (baseValue4 4 z)).im := by
  constructor
  · have h : (baseValue4 4 z * conj (baseValue4 1 z)).im =
        z.im * (320 * Complex.normSq (z + (1 / 2) * z ^ 2) + 48 * Complex.normSq (z ^ 2)) := by
      norm_num [baseValue4, Complex.normSq_apply, Complex.mul_re, Complex.mul_im,
        Complex.add_re, Complex.add_im, Complex.conj_re, Complex.conj_im, pow_succ]
      ring
    rw [h]
    exact mul_nonneg hz (add_nonneg (mul_nonneg (by norm_num) (Complex.normSq_nonneg (z + (1 / 2) * z ^ 2))) (mul_nonneg (by norm_num) (Complex.normSq_nonneg (z ^ 2))))
  · have h : (z * baseValue4 1 z * conj (baseValue4 4 z)).im =
        z.im * (200 * Complex.normSq (z + (6 / 5) * z ^ 2 + (1 / 5) * z ^ 3) + 224 * Complex.normSq (z ^ 2 + (2 / 7) * z ^ 3) + (96 / 7) * Complex.normSq (z ^ 3)) := by
      norm_num [baseValue4, Complex.normSq_apply, Complex.mul_re, Complex.mul_im,
        Complex.add_re, Complex.add_im, Complex.conj_re, Complex.conj_im, pow_succ]
      ring
    rw [h]
    exact mul_nonneg hz (add_nonneg (add_nonneg (mul_nonneg (by norm_num) (Complex.normSq_nonneg (z + (6 / 5) * z ^ 2 + (1 / 5) * z ^ 3))) (mul_nonneg (by norm_num) (Complex.normSq_nonneg (z ^ 2 + (2 / 7) * z ^ 3)))) (mul_nonneg (by norm_num) (Complex.normSq_nonneg (z ^ 3))))
private theorem base_pair_1_5 (z : ℂ) (hz : 0 ≤ z.im) :
    0 ≤ (baseValue4 5 z * conj (baseValue4 1 z)).im ∧
    0 ≤ (z * baseValue4 1 z * conj (baseValue4 5 z)).im := by
  constructor
  · have h : (baseValue4 5 z * conj (baseValue4 1 z)).im =
        z.im * (416 * Complex.normSq (z + (8 / 13) * z ^ 2) + (864 / 13) * Complex.normSq (z ^ 2)) := by
      norm_num [baseValue4, Complex.normSq_apply, Complex.mul_re, Complex.mul_im,
        Complex.add_re, Complex.add_im, Complex.conj_re, Complex.conj_im, pow_succ]
      ring
    rw [h]
    exact mul_nonneg hz (add_nonneg (mul_nonneg (by norm_num) (Complex.normSq_nonneg (z + (8 / 13) * z ^ 2))) (mul_nonneg (by norm_num) (Complex.normSq_nonneg (z ^ 2))))
  · have h : (z * baseValue4 1 z * conj (baseValue4 5 z)).im =
        z.im * (120 * Complex.normSq (z + (6 / 5) * z ^ 2 + (1 / 5) * z ^ 3) + (1216 / 5) * Complex.normSq (z ^ 2 + (13 / 38) * z ^ 3) + (432 / 19) * Complex.normSq (z ^ 3)) := by
      norm_num [baseValue4, Complex.normSq_apply, Complex.mul_re, Complex.mul_im,
        Complex.add_re, Complex.add_im, Complex.conj_re, Complex.conj_im, pow_succ]
      ring
    rw [h]
    exact mul_nonneg hz (add_nonneg (add_nonneg (mul_nonneg (by norm_num) (Complex.normSq_nonneg (z + (6 / 5) * z ^ 2 + (1 / 5) * z ^ 3))) (mul_nonneg (by norm_num) (Complex.normSq_nonneg (z ^ 2 + (13 / 38) * z ^ 3)))) (mul_nonneg (by norm_num) (Complex.normSq_nonneg (z ^ 3))))
private theorem base_pair_1_6 (z : ℂ) (hz : 0 ≤ z.im) :
    0 ≤ (baseValue4 6 z * conj (baseValue4 1 z)).im ∧
    0 ≤ (z * baseValue4 1 z * conj (baseValue4 6 z)).im := by
  constructor
  · have h : (baseValue4 6 z * conj (baseValue4 1 z)).im =
        z.im * (384 * Complex.normSq (z + z ^ 2)) := by
      norm_num [baseValue4, Complex.normSq_apply, Complex.mul_re, Complex.mul_im,
        Complex.add_re, Complex.add_im, Complex.conj_re, Complex.conj_im, pow_succ]
      ring
    rw [h]
    exact mul_nonneg hz (mul_nonneg (by norm_num) (Complex.normSq_nonneg (z + z ^ 2)))
  · have h : (z * baseValue4 1 z * conj (baseValue4 6 z)).im =
        z.im * (80 * Complex.normSq (z + (6 / 5) * z ^ 2 + (1 / 5) * z ^ 3) + (384 / 5) * Complex.normSq (z ^ 2 + z ^ 3)) := by
      norm_num [baseValue4, Complex.normSq_apply, Complex.mul_re, Complex.mul_im,
        Complex.add_re, Complex.add_im, Complex.conj_re, Complex.conj_im, pow_succ]
      ring
    rw [h]
    exact mul_nonneg hz (add_nonneg (mul_nonneg (by norm_num) (Complex.normSq_nonneg (z + (6 / 5) * z ^ 2 + (1 / 5) * z ^ 3))) (mul_nonneg (by norm_num) (Complex.normSq_nonneg (z ^ 2 + z ^ 3))))
private theorem base_pair_1_7 (z : ℂ) (hz : 0 ≤ z.im) :
    0 ≤ (baseValue4 7 z * conj (baseValue4 1 z)).im ∧
    0 ≤ (z * baseValue4 1 z * conj (baseValue4 7 z)).im := by
  constructor
  · have h : (baseValue4 7 z * conj (baseValue4 1 z)).im =
        z.im * (392 * Complex.normSq (z + (54 / 49) * z ^ 2 + (5 / 49) * z ^ 3) + (192 / 49) * Complex.normSq (z ^ 2 + z ^ 3)) := by
      norm_num [baseValue4, Complex.normSq_apply, Complex.mul_re, Complex.mul_im,
        Complex.add_re, Complex.add_im, Complex.conj_re, Complex.conj_im, pow_succ]
      ring
    rw [h]
    exact mul_nonneg hz (add_nonneg (mul_nonneg (by norm_num) (Complex.normSq_nonneg (z + (54 / 49) * z ^ 2 + (5 / 49) * z ^ 3))) (mul_nonneg (by norm_num) (Complex.normSq_nonneg (z ^ 2 + z ^ 3))))
  · have h : (z * baseValue4 1 z * conj (baseValue4 7 z)).im =
        z.im * (40 * Complex.normSq (z + (6 / 5) * z ^ 2 + (1 / 5) * z ^ 3) + (192 / 5) * Complex.normSq (z ^ 2 + z ^ 3)) := by
      norm_num [baseValue4, Complex.normSq_apply, Complex.mul_re, Complex.mul_im,
        Complex.add_re, Complex.add_im, Complex.conj_re, Complex.conj_im, pow_succ]
      ring
    rw [h]
    exact mul_nonneg hz (add_nonneg (mul_nonneg (by norm_num) (Complex.normSq_nonneg (z + (6 / 5) * z ^ 2 + (1 / 5) * z ^ 3))) (mul_nonneg (by norm_num) (Complex.normSq_nonneg (z ^ 2 + z ^ 3))))
private theorem base_pair_2_3 (z : ℂ) (hz : 0 ≤ z.im) :
    0 ≤ (baseValue4 3 z * conj (baseValue4 2 z)).im ∧
    0 ≤ (z * baseValue4 2 z * conj (baseValue4 3 z)).im := by
  constructor
  · have h : (baseValue4 3 z * conj (baseValue4 2 z)).im =
        z.im * (112 * Complex.normSq (z + (5 / 7) * z ^ 2) + (384 / 7) * Complex.normSq (z ^ 2)) := by
      norm_num [baseValue4, Complex.normSq_apply, Complex.mul_re, Complex.mul_im,
        Complex.add_re, Complex.add_im, Complex.conj_re, Complex.conj_im, pow_succ]
      ring
    rw [h]
    exact mul_nonneg hz (add_nonneg (mul_nonneg (by norm_num) (Complex.normSq_nonneg (z + (5 / 7) * z ^ 2))) (mul_nonneg (by norm_num) (Complex.normSq_nonneg (z ^ 2))))
  · have h : (z * baseValue4 2 z * conj (baseValue4 3 z)).im =
        z.im * (140 * Complex.normSq (z + 2 * z ^ 2 + (3 / 7) * z ^ 3) + 144 * Complex.normSq (z ^ 2 + (1 / 3) * z ^ 3) + (128 / 7) * Complex.normSq (z ^ 3)) := by
      norm_num [baseValue4, Complex.normSq_apply, Complex.mul_re, Complex.mul_im,
        Complex.add_re, Complex.add_im, Complex.conj_re, Complex.conj_im, pow_succ]
      ring
    rw [h]
    exact mul_nonneg hz (add_nonneg (add_nonneg (mul_nonneg (by norm_num) (Complex.normSq_nonneg (z + 2 * z ^ 2 + (3 / 7) * z ^ 3))) (mul_nonneg (by norm_num) (Complex.normSq_nonneg (z ^ 2 + (1 / 3) * z ^ 3)))) (mul_nonneg (by norm_num) (Complex.normSq_nonneg (z ^ 3))))
private theorem base_pair_2_4 (z : ℂ) (hz : 0 ≤ z.im) :
    0 ≤ (baseValue4 4 z * conj (baseValue4 2 z)).im ∧
    0 ≤ (z * baseValue4 2 z * conj (baseValue4 4 z)).im := by
  constructor
  · have h : (baseValue4 4 z * conj (baseValue4 2 z)).im =
        z.im * (112 * Complex.normSq (z + (5 / 7) * z ^ 2) + (384 / 7) * Complex.normSq (z ^ 2)) := by
      norm_num [baseValue4, Complex.normSq_apply, Complex.mul_re, Complex.mul_im,
        Complex.add_re, Complex.add_im, Complex.conj_re, Complex.conj_im, pow_succ]
      ring
    rw [h]
    exact mul_nonneg hz (add_nonneg (mul_nonneg (by norm_num) (Complex.normSq_nonneg (z + (5 / 7) * z ^ 2))) (mul_nonneg (by norm_num) (Complex.normSq_nonneg (z ^ 2))))
  · have h : (z * baseValue4 2 z * conj (baseValue4 4 z)).im =
        z.im * (140 * Complex.normSq (z + 2 * z ^ 2 + (3 / 7) * z ^ 3) + 144 * Complex.normSq (z ^ 2 + (1 / 3) * z ^ 3) + (128 / 7) * Complex.normSq (z ^ 3)) := by
      norm_num [baseValue4, Complex.normSq_apply, Complex.mul_re, Complex.mul_im,
        Complex.add_re, Complex.add_im, Complex.conj_re, Complex.conj_im, pow_succ]
      ring
    rw [h]
    exact mul_nonneg hz (add_nonneg (add_nonneg (mul_nonneg (by norm_num) (Complex.normSq_nonneg (z + 2 * z ^ 2 + (3 / 7) * z ^ 3))) (mul_nonneg (by norm_num) (Complex.normSq_nonneg (z ^ 2 + (1 / 3) * z ^ 3)))) (mul_nonneg (by norm_num) (Complex.normSq_nonneg (z ^ 3))))
private theorem base_pair_2_5 (z : ℂ) (hz : 0 ≤ z.im) :
    0 ≤ (baseValue4 5 z * conj (baseValue4 2 z)).im ∧
    0 ≤ (z * baseValue4 2 z * conj (baseValue4 5 z)).im := by
  constructor
  · have h : (baseValue4 5 z * conj (baseValue4 2 z)).im =
        z.im * (224 * Complex.normSq (z + (5 / 7) * z ^ 2) + (768 / 7) * Complex.normSq (z ^ 2)) := by
      norm_num [baseValue4, Complex.normSq_apply, Complex.mul_re, Complex.mul_im,
        Complex.add_re, Complex.add_im, Complex.conj_re, Complex.conj_im, pow_succ]
      ring
    rw [h]
    exact mul_nonneg hz (add_nonneg (mul_nonneg (by norm_num) (Complex.normSq_nonneg (z + (5 / 7) * z ^ 2))) (mul_nonneg (by norm_num) (Complex.normSq_nonneg (z ^ 2))))
  · have h : (z * baseValue4 2 z * conj (baseValue4 5 z)).im =
        z.im * (84 * Complex.normSq (z + 2 * z ^ 2 + (3 / 7) * z ^ 3) + 288 * Complex.normSq (z ^ 2 + (1 / 3) * z ^ 3) + (256 / 7) * Complex.normSq (z ^ 3)) := by
      norm_num [baseValue4, Complex.normSq_apply, Complex.mul_re, Complex.mul_im,
        Complex.add_re, Complex.add_im, Complex.conj_re, Complex.conj_im, pow_succ]
      ring
    rw [h]
    exact mul_nonneg hz (add_nonneg (add_nonneg (mul_nonneg (by norm_num) (Complex.normSq_nonneg (z + 2 * z ^ 2 + (3 / 7) * z ^ 3))) (mul_nonneg (by norm_num) (Complex.normSq_nonneg (z ^ 2 + (1 / 3) * z ^ 3)))) (mul_nonneg (by norm_num) (Complex.normSq_nonneg (z ^ 3))))
private theorem base_pair_2_6 (z : ℂ) (hz : 0 ≤ z.im) :
    0 ≤ (baseValue4 6 z * conj (baseValue4 2 z)).im ∧
    0 ≤ (z * baseValue4 2 z * conj (baseValue4 6 z)).im := by
  constructor
  · have h : (baseValue4 6 z * conj (baseValue4 2 z)).im =
        z.im * (224 * Complex.normSq (z + (8 / 7) * z ^ 2) + (864 / 7) * Complex.normSq (z ^ 2)) := by
      norm_num [baseValue4, Complex.normSq_apply, Complex.mul_re, Complex.mul_im,
        Complex.add_re, Complex.add_im, Complex.conj_re, Complex.conj_im, pow_succ]
      ring
    rw [h]
    exact mul_nonneg hz (add_nonneg (mul_nonneg (by norm_num) (Complex.normSq_nonneg (z + (8 / 7) * z ^ 2))) (mul_nonneg (by norm_num) (Complex.normSq_nonneg (z ^ 2))))
  · have h : (z * baseValue4 2 z * conj (baseValue4 6 z)).im =
        z.im * (56 * Complex.normSq (z + 2 * z ^ 2 + (3 / 7) * z ^ 3) + 192 * Complex.normSq (z ^ 2 + (1 / 2) * z ^ 3) + (432 / 7) * Complex.normSq (z ^ 3)) := by
      norm_num [baseValue4, Complex.normSq_apply, Complex.mul_re, Complex.mul_im,
        Complex.add_re, Complex.add_im, Complex.conj_re, Complex.conj_im, pow_succ]
      ring
    rw [h]
    exact mul_nonneg hz (add_nonneg (add_nonneg (mul_nonneg (by norm_num) (Complex.normSq_nonneg (z + 2 * z ^ 2 + (3 / 7) * z ^ 3))) (mul_nonneg (by norm_num) (Complex.normSq_nonneg (z ^ 2 + (1 / 2) * z ^ 3)))) (mul_nonneg (by norm_num) (Complex.normSq_nonneg (z ^ 3))))
private theorem base_pair_2_7 (z : ℂ) (hz : 0 ≤ z.im) :
    0 ≤ (baseValue4 7 z * conj (baseValue4 2 z)).im ∧
    0 ≤ (z * baseValue4 2 z * conj (baseValue4 7 z)).im := by
  constructor
  · have h : (baseValue4 7 z * conj (baseValue4 2 z)).im =
        z.im * (252 * Complex.normSq (z + (74 / 63) * z ^ 2 + (1 / 9) * z ^ 3) + (10352 / 63) * Complex.normSq (z ^ 2 + (91 / 647) * z ^ 3) + (3648 / 647) * Complex.normSq (z ^ 3)) := by
      norm_num [baseValue4, Complex.normSq_apply, Complex.mul_re, Complex.mul_im,
        Complex.add_re, Complex.add_im, Complex.conj_re, Complex.conj_im, pow_succ]
      ring
    rw [h]
    exact mul_nonneg hz (add_nonneg (add_nonneg (mul_nonneg (by norm_num) (Complex.normSq_nonneg (z + (74 / 63) * z ^ 2 + (1 / 9) * z ^ 3))) (mul_nonneg (by norm_num) (Complex.normSq_nonneg (z ^ 2 + (91 / 647) * z ^ 3)))) (mul_nonneg (by norm_num) (Complex.normSq_nonneg (z ^ 3))))
  · have h : (z * baseValue4 2 z * conj (baseValue4 7 z)).im =
        z.im * (28 * Complex.normSq (z + 2 * z ^ 2 + (3 / 7) * z ^ 3) + 208 * Complex.normSq (z ^ 2 + (5 / 13) * z ^ 3) + (3648 / 91) * Complex.normSq (z ^ 3)) := by
      norm_num [baseValue4, Complex.normSq_apply, Complex.mul_re, Complex.mul_im,
        Complex.add_re, Complex.add_im, Complex.conj_re, Complex.conj_im, pow_succ]
      ring
    rw [h]
    exact mul_nonneg hz (add_nonneg (add_nonneg (mul_nonneg (by norm_num) (Complex.normSq_nonneg (z + 2 * z ^ 2 + (3 / 7) * z ^ 3))) (mul_nonneg (by norm_num) (Complex.normSq_nonneg (z ^ 2 + (5 / 13) * z ^ 3)))) (mul_nonneg (by norm_num) (Complex.normSq_nonneg (z ^ 3))))
private theorem base_pair_3_4 (z : ℂ) (hz : 0 ≤ z.im) :
    0 ≤ (baseValue4 4 z * conj (baseValue4 3 z)).im ∧
    0 ≤ (z * baseValue4 3 z * conj (baseValue4 4 z)).im := by
  constructor
  · have h : (baseValue4 4 z * conj (baseValue4 3 z)).im =
        z.im * (0) := by
      norm_num [baseValue4, Complex.normSq_apply, Complex.mul_re, Complex.mul_im,
        Complex.add_re, Complex.add_im, Complex.conj_re, Complex.conj_im, pow_succ]
      ring
    rw [h]
    exact mul_nonneg hz (by norm_num)
  · have h : (z * baseValue4 3 z * conj (baseValue4 4 z)).im =
        z.im * (100 * Complex.normSq (z + (14 / 5) * z ^ 2 + z ^ 3)) := by
      norm_num [baseValue4, Complex.normSq_apply, Complex.mul_re, Complex.mul_im,
        Complex.add_re, Complex.add_im, Complex.conj_re, Complex.conj_im, pow_succ]
      ring
    rw [h]
    exact mul_nonneg hz (mul_nonneg (by norm_num) (Complex.normSq_nonneg (z + (14 / 5) * z ^ 2 + z ^ 3)))
private theorem base_pair_3_5 (z : ℂ) (hz : 0 ≤ z.im) :
    0 ≤ (baseValue4 5 z * conj (baseValue4 3 z)).im ∧
    0 ≤ (z * baseValue4 3 z * conj (baseValue4 5 z)).im := by
  constructor
  · have h : (baseValue4 5 z * conj (baseValue4 3 z)).im =
        z.im * (112 * Complex.normSq (z + (5 / 7) * z ^ 2) + (384 / 7) * Complex.normSq (z ^ 2)) := by
      norm_num [baseValue4, Complex.normSq_apply, Complex.mul_re, Complex.mul_im,
        Complex.add_re, Complex.add_im, Complex.conj_re, Complex.conj_im, pow_succ]
      ring
    rw [h]
    exact mul_nonneg hz (add_nonneg (mul_nonneg (by norm_num) (Complex.normSq_nonneg (z + (5 / 7) * z ^ 2))) (mul_nonneg (by norm_num) (Complex.normSq_nonneg (z ^ 2))))
  · have h : (z * baseValue4 3 z * conj (baseValue4 5 z)).im =
        z.im * (60 * Complex.normSq (z + (14 / 5) * z ^ 2 + z ^ 3) + (1168 / 5) * Complex.normSq (z ^ 2 + (35 / 73) * z ^ 3) + (1920 / 73) * Complex.normSq (z ^ 3)) := by
      norm_num [baseValue4, Complex.normSq_apply, Complex.mul_re, Complex.mul_im,
        Complex.add_re, Complex.add_im, Complex.conj_re, Complex.conj_im, pow_succ]
      ring
    rw [h]
    exact mul_nonneg hz (add_nonneg (add_nonneg (mul_nonneg (by norm_num) (Complex.normSq_nonneg (z + (14 / 5) * z ^ 2 + z ^ 3))) (mul_nonneg (by norm_num) (Complex.normSq_nonneg (z ^ 2 + (35 / 73) * z ^ 3)))) (mul_nonneg (by norm_num) (Complex.normSq_nonneg (z ^ 3))))
private theorem base_pair_3_6 (z : ℂ) (hz : 0 ≤ z.im) :
    0 ≤ (baseValue4 6 z * conj (baseValue4 3 z)).im ∧
    0 ≤ (z * baseValue4 3 z * conj (baseValue4 6 z)).im := by
  constructor
  · have h : (baseValue4 6 z * conj (baseValue4 3 z)).im =
        z.im * (128 * Complex.normSq (z + (5 / 4) * z ^ 2) + 120 * Complex.normSq (z ^ 2)) := by
      norm_num [baseValue4, Complex.normSq_apply, Complex.mul_re, Complex.mul_im,
        Complex.add_re, Complex.add_im, Complex.conj_re, Complex.conj_im, pow_succ]
      ring
    rw [h]
    exact mul_nonneg hz (add_nonneg (mul_nonneg (by norm_num) (Complex.normSq_nonneg (z + (5 / 4) * z ^ 2))) (mul_nonneg (by norm_num) (Complex.normSq_nonneg (z ^ 2))))
  · have h : (z * baseValue4 3 z * conj (baseValue4 6 z)).im =
        z.im * (40 * Complex.normSq (z + (14 / 5) * z ^ 2 + z ^ 3) + (992 / 5) * Complex.normSq (z ^ 2 + (20 / 31) * z ^ 3) + (2400 / 31) * Complex.normSq (z ^ 3)) := by
      norm_num [baseValue4, Complex.normSq_apply, Complex.mul_re, Complex.mul_im,
        Complex.add_re, Complex.add_im, Complex.conj_re, Complex.conj_im, pow_succ]
      ring
    rw [h]
    exact mul_nonneg hz (add_nonneg (add_nonneg (mul_nonneg (by norm_num) (Complex.normSq_nonneg (z + (14 / 5) * z ^ 2 + z ^ 3))) (mul_nonneg (by norm_num) (Complex.normSq_nonneg (z ^ 2 + (20 / 31) * z ^ 3)))) (mul_nonneg (by norm_num) (Complex.normSq_nonneg (z ^ 3))))
private theorem base_pair_3_7 (z : ℂ) (hz : 0 ≤ z.im) :
    0 ≤ (baseValue4 7 z * conj (baseValue4 3 z)).im ∧
    0 ≤ (z * baseValue4 3 z * conj (baseValue4 7 z)).im := by
  constructor
  · have h : (baseValue4 7 z * conj (baseValue4 3 z)).im =
        z.im * (164 * Complex.normSq (z + (50 / 41) * z ^ 2 + (5 / 41) * z ^ 3) + (7056 / 41) * Complex.normSq (z ^ 2 + (9 / 49) * z ^ 3) + (576 / 49) * Complex.normSq (z ^ 3)) := by
      norm_num [baseValue4, Complex.normSq_apply, Complex.mul_re, Complex.mul_im,
        Complex.add_re, Complex.add_im, Complex.conj_re, Complex.conj_im, pow_succ]
      ring
    rw [h]
    exact mul_nonneg hz (add_nonneg (add_nonneg (mul_nonneg (by norm_num) (Complex.normSq_nonneg (z + (50 / 41) * z ^ 2 + (5 / 41) * z ^ 3))) (mul_nonneg (by norm_num) (Complex.normSq_nonneg (z ^ 2 + (9 / 49) * z ^ 3)))) (mul_nonneg (by norm_num) (Complex.normSq_nonneg (z ^ 3))))
  · have h : (z * baseValue4 3 z * conj (baseValue4 7 z)).im =
        z.im * (20 * Complex.normSq (z + (14 / 5) * z ^ 2 + z ^ 3) + (1296 / 5) * Complex.normSq (z ^ 2 + (5 / 9) * z ^ 3) + 64 * Complex.normSq (z ^ 3)) := by
      norm_num [baseValue4, Complex.normSq_apply, Complex.mul_re, Complex.mul_im,
        Complex.add_re, Complex.add_im, Complex.conj_re, Complex.conj_im, pow_succ]
      ring
    rw [h]
    exact mul_nonneg hz (add_nonneg (add_nonneg (mul_nonneg (by norm_num) (Complex.normSq_nonneg (z + (14 / 5) * z ^ 2 + z ^ 3))) (mul_nonneg (by norm_num) (Complex.normSq_nonneg (z ^ 2 + (5 / 9) * z ^ 3)))) (mul_nonneg (by norm_num) (Complex.normSq_nonneg (z ^ 3))))
private theorem base_pair_4_5 (z : ℂ) (hz : 0 ≤ z.im) :
    0 ≤ (baseValue4 5 z * conj (baseValue4 4 z)).im ∧
    0 ≤ (z * baseValue4 4 z * conj (baseValue4 5 z)).im := by
  constructor
  · have h : (baseValue4 5 z * conj (baseValue4 4 z)).im =
        z.im * (112 * Complex.normSq (z + (5 / 7) * z ^ 2) + (384 / 7) * Complex.normSq (z ^ 2)) := by
      norm_num [baseValue4, Complex.normSq_apply, Complex.mul_re, Complex.mul_im,
        Complex.add_re, Complex.add_im, Complex.conj_re, Complex.conj_im, pow_succ]
      ring
    rw [h]
    exact mul_nonneg hz (add_nonneg (mul_nonneg (by norm_num) (Complex.normSq_nonneg (z + (5 / 7) * z ^ 2))) (mul_nonneg (by norm_num) (Complex.normSq_nonneg (z ^ 2))))
  · have h : (z * baseValue4 4 z * conj (baseValue4 5 z)).im =
        z.im * (60 * Complex.normSq (z + (14 / 5) * z ^ 2 + z ^ 3) + (1168 / 5) * Complex.normSq (z ^ 2 + (35 / 73) * z ^ 3) + (1920 / 73) * Complex.normSq (z ^ 3)) := by
      norm_num [baseValue4, Complex.normSq_apply, Complex.mul_re, Complex.mul_im,
        Complex.add_re, Complex.add_im, Complex.conj_re, Complex.conj_im, pow_succ]
      ring
    rw [h]
    exact mul_nonneg hz (add_nonneg (add_nonneg (mul_nonneg (by norm_num) (Complex.normSq_nonneg (z + (14 / 5) * z ^ 2 + z ^ 3))) (mul_nonneg (by norm_num) (Complex.normSq_nonneg (z ^ 2 + (35 / 73) * z ^ 3)))) (mul_nonneg (by norm_num) (Complex.normSq_nonneg (z ^ 3))))
private theorem base_pair_4_6 (z : ℂ) (hz : 0 ≤ z.im) :
    0 ≤ (baseValue4 6 z * conj (baseValue4 4 z)).im ∧
    0 ≤ (z * baseValue4 4 z * conj (baseValue4 6 z)).im := by
  constructor
  · have h : (baseValue4 6 z * conj (baseValue4 4 z)).im =
        z.im * (128 * Complex.normSq (z + (5 / 4) * z ^ 2) + 120 * Complex.normSq (z ^ 2)) := by
      norm_num [baseValue4, Complex.normSq_apply, Complex.mul_re, Complex.mul_im,
        Complex.add_re, Complex.add_im, Complex.conj_re, Complex.conj_im, pow_succ]
      ring
    rw [h]
    exact mul_nonneg hz (add_nonneg (mul_nonneg (by norm_num) (Complex.normSq_nonneg (z + (5 / 4) * z ^ 2))) (mul_nonneg (by norm_num) (Complex.normSq_nonneg (z ^ 2))))
  · have h : (z * baseValue4 4 z * conj (baseValue4 6 z)).im =
        z.im * (40 * Complex.normSq (z + (14 / 5) * z ^ 2 + z ^ 3) + (992 / 5) * Complex.normSq (z ^ 2 + (20 / 31) * z ^ 3) + (2400 / 31) * Complex.normSq (z ^ 3)) := by
      norm_num [baseValue4, Complex.normSq_apply, Complex.mul_re, Complex.mul_im,
        Complex.add_re, Complex.add_im, Complex.conj_re, Complex.conj_im, pow_succ]
      ring
    rw [h]
    exact mul_nonneg hz (add_nonneg (add_nonneg (mul_nonneg (by norm_num) (Complex.normSq_nonneg (z + (14 / 5) * z ^ 2 + z ^ 3))) (mul_nonneg (by norm_num) (Complex.normSq_nonneg (z ^ 2 + (20 / 31) * z ^ 3)))) (mul_nonneg (by norm_num) (Complex.normSq_nonneg (z ^ 3))))
private theorem base_pair_4_7 (z : ℂ) (hz : 0 ≤ z.im) :
    0 ≤ (baseValue4 7 z * conj (baseValue4 4 z)).im ∧
    0 ≤ (z * baseValue4 4 z * conj (baseValue4 7 z)).im := by
  constructor
  · have h : (baseValue4 7 z * conj (baseValue4 4 z)).im =
        z.im * (164 * Complex.normSq (z + (50 / 41) * z ^ 2 + (5 / 41) * z ^ 3) + (7056 / 41) * Complex.normSq (z ^ 2 + (9 / 49) * z ^ 3) + (576 / 49) * Complex.normSq (z ^ 3)) := by
      norm_num [baseValue4, Complex.normSq_apply, Complex.mul_re, Complex.mul_im,
        Complex.add_re, Complex.add_im, Complex.conj_re, Complex.conj_im, pow_succ]
      ring
    rw [h]
    exact mul_nonneg hz (add_nonneg (add_nonneg (mul_nonneg (by norm_num) (Complex.normSq_nonneg (z + (50 / 41) * z ^ 2 + (5 / 41) * z ^ 3))) (mul_nonneg (by norm_num) (Complex.normSq_nonneg (z ^ 2 + (9 / 49) * z ^ 3)))) (mul_nonneg (by norm_num) (Complex.normSq_nonneg (z ^ 3))))
  · have h : (z * baseValue4 4 z * conj (baseValue4 7 z)).im =
        z.im * (20 * Complex.normSq (z + (14 / 5) * z ^ 2 + z ^ 3) + (1296 / 5) * Complex.normSq (z ^ 2 + (5 / 9) * z ^ 3) + 64 * Complex.normSq (z ^ 3)) := by
      norm_num [baseValue4, Complex.normSq_apply, Complex.mul_re, Complex.mul_im,
        Complex.add_re, Complex.add_im, Complex.conj_re, Complex.conj_im, pow_succ]
      ring
    rw [h]
    exact mul_nonneg hz (add_nonneg (add_nonneg (mul_nonneg (by norm_num) (Complex.normSq_nonneg (z + (14 / 5) * z ^ 2 + z ^ 3))) (mul_nonneg (by norm_num) (Complex.normSq_nonneg (z ^ 2 + (5 / 9) * z ^ 3)))) (mul_nonneg (by norm_num) (Complex.normSq_nonneg (z ^ 3))))
private theorem base_pair_5_6 (z : ℂ) (hz : 0 ≤ z.im) :
    0 ≤ (baseValue4 6 z * conj (baseValue4 5 z)).im ∧
    0 ≤ (z * baseValue4 5 z * conj (baseValue4 6 z)).im := by
  constructor
  · have h : (baseValue4 6 z * conj (baseValue4 5 z)).im =
        z.im * (32 * Complex.normSq (z + 2 * z ^ 2) + 96 * Complex.normSq (z ^ 2)) := by
      norm_num [baseValue4, Complex.normSq_apply, Complex.mul_re, Complex.mul_im,
        Complex.add_re, Complex.add_im, Complex.conj_re, Complex.conj_im, pow_succ]
      ring
    rw [h]
    exact mul_nonneg hz (add_nonneg (mul_nonneg (by norm_num) (Complex.normSq_nonneg (z + 2 * z ^ 2))) (mul_nonneg (by norm_num) (Complex.normSq_nonneg (z ^ 2))))
  · have h : (z * baseValue4 5 z * conj (baseValue4 6 z)).im =
        z.im * (24 * Complex.normSq (z + (14 / 3) * z ^ 2 + (7 / 3) * z ^ 3) + (256 / 3) * Complex.normSq (z ^ 2 + (7 / 8) * z ^ 3) + 84 * Complex.normSq (z ^ 3)) := by
      norm_num [baseValue4, Complex.normSq_apply, Complex.mul_re, Complex.mul_im,
        Complex.add_re, Complex.add_im, Complex.conj_re, Complex.conj_im, pow_succ]
      ring
    rw [h]
    exact mul_nonneg hz (add_nonneg (add_nonneg (mul_nonneg (by norm_num) (Complex.normSq_nonneg (z + (14 / 3) * z ^ 2 + (7 / 3) * z ^ 3))) (mul_nonneg (by norm_num) (Complex.normSq_nonneg (z ^ 2 + (7 / 8) * z ^ 3)))) (mul_nonneg (by norm_num) (Complex.normSq_nonneg (z ^ 3))))
private theorem base_pair_5_7 (z : ℂ) (hz : 0 ≤ z.im) :
    0 ≤ (baseValue4 7 z * conj (baseValue4 5 z)).im ∧
    0 ≤ (z * baseValue4 5 z * conj (baseValue4 7 z)).im := by
  constructor
  · have h : (baseValue4 7 z * conj (baseValue4 5 z)).im =
        z.im * (76 * Complex.normSq (z + (26 / 19) * z ^ 2 + (3 / 19) * z ^ 3) + (3376 / 19) * Complex.normSq (z ^ 2 + (47 / 211) * z ^ 3) + (3648 / 211) * Complex.normSq (z ^ 3)) := by
      norm_num [baseValue4, Complex.normSq_apply, Complex.mul_re, Complex.mul_im,
        Complex.add_re, Complex.add_im, Complex.conj_re, Complex.conj_im, pow_succ]
      ring
    rw [h]
    exact mul_nonneg hz (add_nonneg (add_nonneg (mul_nonneg (by norm_num) (Complex.normSq_nonneg (z + (26 / 19) * z ^ 2 + (3 / 19) * z ^ 3))) (mul_nonneg (by norm_num) (Complex.normSq_nonneg (z ^ 2 + (47 / 211) * z ^ 3)))) (mul_nonneg (by norm_num) (Complex.normSq_nonneg (z ^ 3))))
  · have h : (z * baseValue4 5 z * conj (baseValue4 7 z)).im =
        z.im * (12 * Complex.normSq (z + (14 / 3) * z ^ 2 + (7 / 3) * z ^ 3) + (752 / 3) * Complex.normSq (z ^ 2 + (31 / 47) * z ^ 3) + (3648 / 47) * Complex.normSq (z ^ 3)) := by
      norm_num [baseValue4, Complex.normSq_apply, Complex.mul_re, Complex.mul_im,
        Complex.add_re, Complex.add_im, Complex.conj_re, Complex.conj_im, pow_succ]
      ring
    rw [h]
    exact mul_nonneg hz (add_nonneg (add_nonneg (mul_nonneg (by norm_num) (Complex.normSq_nonneg (z + (14 / 3) * z ^ 2 + (7 / 3) * z ^ 3))) (mul_nonneg (by norm_num) (Complex.normSq_nonneg (z ^ 2 + (31 / 47) * z ^ 3)))) (mul_nonneg (by norm_num) (Complex.normSq_nonneg (z ^ 3))))
private theorem base_pair_6_7 (z : ℂ) (hz : 0 ≤ z.im) :
    0 ≤ (baseValue4 7 z * conj (baseValue4 6 z)).im ∧
    0 ≤ (z * baseValue4 6 z * conj (baseValue4 7 z)).im := by
  constructor
  · have h : (baseValue4 7 z * conj (baseValue4 6 z)).im =
        z.im * (40 * Complex.normSq (z + (6 / 5) * z ^ 2 + (1 / 5) * z ^ 3) + (192 / 5) * Complex.normSq (z ^ 2 + z ^ 3)) := by
      norm_num [baseValue4, Complex.normSq_apply, Complex.mul_re, Complex.mul_im,
        Complex.add_re, Complex.add_im, Complex.conj_re, Complex.conj_im, pow_succ]
      ring
    rw [h]
    exact mul_nonneg hz (add_nonneg (mul_nonneg (by norm_num) (Complex.normSq_nonneg (z + (6 / 5) * z ^ 2 + (1 / 5) * z ^ 3))) (mul_nonneg (by norm_num) (Complex.normSq_nonneg (z ^ 2 + z ^ 3))))
  · have h : (z * baseValue4 6 z * conj (baseValue4 7 z)).im =
        z.im * (8 * Complex.normSq (z + 6 * z ^ 2 + 5 * z ^ 3) + 192 * Complex.normSq (z ^ 2 + z ^ 3)) := by
      norm_num [baseValue4, Complex.normSq_apply, Complex.mul_re, Complex.mul_im,
        Complex.add_re, Complex.add_im, Complex.conj_re, Complex.conj_im, pow_succ]
      ring
    rw [h]
    exact mul_nonneg hz (add_nonneg (mul_nonneg (by norm_num) (Complex.normSq_nonneg (z + 6 * z ^ 2 + 5 * z ^ 3))) (mul_nonneg (by norm_num) (Complex.normSq_nonneg (z ^ 2 + z ^ 3))))

theorem baseValue4_orderedCone (z : ℂ) (hz : 0 ≤ z.im) :
    OrderedCone z (fun i => baseValue4 i z) := by
  intro i j hij
  rcases lt_or_eq_of_le hij with hij | rfl
  · fin_cases i <;> fin_cases j <;> norm_num at hij
    · exact base_pair_0_1 z hz
    · exact base_pair_0_2 z hz
    · exact base_pair_0_3 z hz
    · exact base_pair_0_4 z hz
    · exact base_pair_0_5 z hz
    · exact base_pair_0_6 z hz
    · exact base_pair_0_7 z hz
    · exact base_pair_1_2 z hz
    · exact base_pair_1_3 z hz
    · exact base_pair_1_4 z hz
    · exact base_pair_1_5 z hz
    · exact base_pair_1_6 z hz
    · exact base_pair_1_7 z hz
    · exact base_pair_2_3 z hz
    · exact base_pair_2_4 z hz
    · exact base_pair_2_5 z hz
    · exact base_pair_2_6 z hz
    · exact base_pair_2_7 z hz
    · exact base_pair_3_4 z hz
    · exact base_pair_3_5 z hz
    · exact base_pair_3_6 z hz
    · exact base_pair_3_7 z hz
    · exact base_pair_4_5 z hz
    · exact base_pair_4_6 z hz
    · exact base_pair_4_7 z hz
    · exact base_pair_5_6 z hz
    · exact base_pair_5_7 z hz
    · exact base_pair_6_7 z hz
  · constructor
    · simp [Complex.mul_im, mul_comm]
    · have h : (z * baseValue4 i z * conj (baseValue4 i z)).im =
          z.im * Complex.normSq (baseValue4 i z) := by
        simp only [Complex.mul_im, Complex.mul_re, Complex.conj_re, Complex.conj_im,
          Complex.normSq_apply]
        ring
      rw [h]
      exact mul_nonneg hz (Complex.normSq_nonneg _)

theorem ceval_nextRow (n : ℕ) (f : Fin (2 * n) → ℝ[X])
    (i : Fin (2 * (n + 1))) (z : ℂ) :
    ceval (nextRow n f i) z = cutValue z (fun j => ceval (f j) z) (cutoff n i.val) := by
  simp [ceval, nextRow, cutValue, Polynomial.map_sum, Polynomial.eval_finsetSum, apply_ite]

theorem refinedRow_orderedCone (r : ℕ) (hr : 2 ≤ r) (z : ℂ) (hz : 0 ≤ z.im) :
    OrderedCone z (fun i => ceval (refinedRow r i) z) := by
  induction r, hr using Nat.le_induction with
  | base => simpa only [refinedRow_two, baseRow4_ceval] using baseValue4_orderedCone z hz
  | succ r hr ih =>
    have hcut : Monotone (fun i : Fin (2 * (r + 2 + 1)) => cutoff (r + 2) i.val) := by
      intro i j hij
      exact cutoff_monotone (r + 2) hij
    simpa only [refinedRow_succ, ceval_nextRow] using orderedCone_cutValue hz ih _ hcut

end

end Chow
