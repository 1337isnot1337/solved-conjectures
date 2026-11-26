import Conjectures.GawronUlasPartitionCusps

/-!
# Separation of radial and oblique rates

For parts `1 mod 3`, the growth-rate series can be bounded by a few terms
and a telescoping majorant. No evaluation of the dilogarithm is needed.
-/

open Filter Complex Finset
open scoped Topology

namespace GawronUlasPartitionSigns

private theorem tail_bound {η : ℂ} (hη : ‖η‖ = 1) {N : ℕ} (hN : 0 < N) :
    ‖∑' j : ℕ, cuspTerm η (j + N)‖ ≤ 1 / (N : ℝ) := by
  have hs := (summable_cuspTerm hη).comp_injective (add_left_injective N)
  have hn := hs.norm
  refine (norm_tsum_le_tsum_norm hn).trans ?_
  apply le_of_tendsto hn.hasSum.tendsto_sum_nat
  apply Eventually.of_forall
  intro m
  have hm (j : ℕ) : ‖cuspTerm η (j + N)‖ ≤
      (1 / ((j : ℝ) + N)) - (1 / ((j : ℝ) + N + 1)) := by
    refine (norm_cuspTerm_le hη _).trans ?_
    have hpos : (0 : ℝ) < (j : ℝ) + N := by positivity
    push_cast
    field_simp [hpos.ne', (show (0 : ℝ) < (j : ℝ) + N + 1 by positivity).ne']
    nlinarith
  have H (k : ℕ) : (∑ j ∈ range k, ‖cuspTerm η (j + N)‖) ≤
      1 / (N : ℝ) - 1 / ((k : ℝ) + N) := by
    induction k with
    | zero => simp
    | succ k ih =>
      rw [sum_range_succ, Nat.cast_succ]
      rw [show (k : ℝ) + 1 + N = (k : ℝ) + N + 1 by ring]
      linarith [hm k]
  exact (H m).trans (sub_le_self _ (by positivity))

private theorem partial_re_bound {η : ℂ} (hη : ‖η‖ = 1) {N : ℕ} (hN : 0 < N) :
    (∑' j, cuspTerm η j).re ≤ (∑ j ∈ range N, cuspTerm η j).re + 1 / (N : ℝ) := by
  rw [← (summable_cuspTerm hη).sum_add_tsum_nat_add N, Complex.add_re]
  exact add_le_add le_rfl ((Complex.re_le_norm _).trans (tail_bound hη hN))

private theorem cuspTerm_cube {η : ℂ} (h : η ^ 3 = 1) (j : ℕ) :
    cuspTerm η j = (-η) ^ (j + 1) / ((j : ℂ) + 1) ^ 2 := by
  simp [cuspTerm, pow_mul, h]

private theorem cube_sq {η : ℂ} (hη : ‖η‖ = 1) (h3 : η ^ 3 = 1) :
    η ^ 2 = starRingEnd ℂ η := by
  have hne : η ≠ 0 := by intro h; simp [h] at hη
  have H : η * η ^ 2 = η * starRingEnd ℂ η := by
    rw [← pow_succ', h3, Complex.mul_conj, Complex.normSq_eq_norm_sq, hη]
    norm_num
  exact mul_left_cancel₀ hne H

private theorem cube_re {η : ℂ} (hη : ‖η‖ = 1) (h3 : η ^ 3 = 1) (hne : η ≠ 1) :
    η.re = -1 / 2 := by
  have h : (η - 1) * (η ^ 2 + η + 1) = 0 := by linear_combination h3
  have h' := (mul_eq_zero.mp h).resolve_left (sub_ne_zero.mpr hne)
  have H := congrArg Complex.re h'
  rw [cube_sq hη h3] at H
  simp only [Complex.add_re, Complex.conj_re, Complex.one_re, Complex.zero_re] at H
  linarith

theorem radial_rate_le {η : ℂ} (hη : ‖η‖ = 1) : cuspRate η 1 ≤ 1 / 6 := by
  suffices H : (∑' j, cuspTerm η j).re ≤ 1 / 2 by
    simp only [cuspRate, mul_one, Complex.div_re]
    norm_num [Complex.normSq_ofNat] at *
    linarith
  by_cases h3 : η ^ 3 = 1
  · by_cases he : η = 1
    · subst η
      have H := partial_re_bound hη (N := 1) (by decide)
      norm_num [sum_range_succ, cuspTerm_cube h3] at H ⊢
      linarith
    · have hre := cube_re hη h3 he
      have h₂ : (-η) ^ 2 = starRingEnd ℂ η := (neg_sq η).trans (cube_sq hη h3)
      have h₃ : (-η) ^ 3 = -1 := by rw [neg_pow, h3]; norm_num
      have h₄ : (-η) ^ 4 = η := by rw [show (4 : ℕ) = 3 + 1 by decide, pow_succ, h₃]; simp
      have H := partial_re_bound hη (N := 4) (by decide)
      simp_rw [cuspTerm_cube h3] at H ⊢
      norm_num [sum_range_succ, h₂, h₃, h₄, Complex.div_re,
        Complex.normSq_ofNat, hre] at H
      linarith
  · by_cases h6 : η ^ 6 = 1
    · have hs : η ^ 3 = -1 := by
        have he : (η ^ 3) ^ 2 = 1 := by rw [← pow_mul]; exact h6
        exact (sq_eq_one_iff.mp he).resolve_left h3
      have hnorm (j : ℕ) : ‖cuspTerm η j‖ ≤
          if Even (j + 1) then ((j : ℝ) + 1)⁻¹ ^ 2 else 0 := by
        split_ifs with hj
        · exact norm_cuspTerm_le hη j
        · have ho : Odd (j + 1) := Nat.not_even_iff_odd.mp hj
          norm_num [cuspTerm, pow_mul, hs, ho.neg_one_pow]
      have H := partial_re_bound hη (N := 7) (by decide)
      have H' : (∑ j ∈ range 7, cuspTerm η j).re ≤
          ∑ j ∈ range 7, if Even (j + 1) then ((j : ℝ) + 1)⁻¹ ^ 2 else 0 := by
        rw [Complex.re_sum]
        exact sum_le_sum fun j _ ↦ (Complex.re_le_norm _).trans (hnorm j)
      refine H.trans ((add_le_add H' le_rfl).trans ?_)
      norm_num [sum_range_succ, Nat.even_iff]
    · have H := partial_re_bound hη (N := 2) (by decide)
      simpa [sum_range_succ, cuspTerm, h3, h6] using H

/-- The cube root with negative imaginary part, used for the oblique path. -/
noncomputable def obliqueRoot : ℂ := ⟨-1 / 2, -√(3 : ℝ) / 2⟩

private theorem root_sq : obliqueRoot ^ 2 = starRingEnd ℂ obliqueRoot := by
  have hs := Real.sq_sqrt (by norm_num : (0 : ℝ) ≤ 3)
  apply Complex.ext <;> simp [pow_two, Complex.mul_re, Complex.mul_im, obliqueRoot] <;> nlinarith

theorem norm_obliqueRoot : ‖obliqueRoot‖ = 1 := by
  have hs := Real.sq_sqrt (by norm_num : (0 : ℝ) ≤ 3)
  have H : ‖obliqueRoot‖ ^ 2 = 1 := by
    rw [Complex.sq_norm, Complex.normSq_apply]
    simp [obliqueRoot]
    nlinarith
  nlinarith [norm_nonneg obliqueRoot]

private theorem root_cube : obliqueRoot ^ 3 = 1 := by
  rw [pow_succ, root_sq, mul_comm, Complex.mul_conj, Complex.normSq_eq_norm_sq, norm_obliqueRoot]
  norm_num

theorem oblique_rate_gt : 1 / 6 < cuspRate obliqueRoot (1 + I) := by
  have h₂ : (-obliqueRoot) ^ 2 = starRingEnd ℂ obliqueRoot := (neg_sq _).trans root_sq
  have h₃ : (-obliqueRoot) ^ 3 = -1 := by rw [neg_pow, root_cube]; norm_num
  have h₄ : (-obliqueRoot) ^ 4 = obliqueRoot := by rw [pow_succ, h₃]; simp
  have h₅ : (-obliqueRoot) ^ 5 = -starRingEnd ℂ obliqueRoot := by
    rw [pow_succ, h₄, mul_neg, ← pow_two, root_sq]
  have h₆ : (-obliqueRoot) ^ 6 = 1 := by rw [show (6 : ℕ) = 3 * 2 by decide, pow_mul, h₃]; norm_num
  let d : ℂ := 3 * (1 + I)
  have hdiv (z : ℂ) : (z / d).re = (z.re + z.im) / 6 := by
    norm_num [d, Complex.div_re, Complex.normSq_apply, Complex.mul_re, Complex.mul_im]
    ring
  have hd : 4 ≤ ‖d‖ := by
    have H : ‖d‖ ^ 2 = 18 := by
      rw [Complex.sq_norm, Complex.normSq_apply]
      norm_num [d, Complex.mul_re, Complex.mul_im]
    nlinarith [norm_nonneg d]
  have hpart : (5 / 24 : ℝ) < ((∑ j ∈ range 6, cuspTerm obliqueRoot j) / d).re := by
    have hs := Real.sq_sqrt (by norm_num : (0 : ℝ) ≤ 3)
    have hlow : (17 / 10 : ℝ) < √(3 : ℝ) := by nlinarith [Real.sqrt_nonneg (3 : ℝ)]
    rw [hdiv]
    simp_rw [cuspTerm_cube root_cube]
    norm_num [sum_range_succ, h₂, h₃, h₄, h₅, h₆, Complex.div_re, Complex.div_im,
      Complex.normSq_ofNat]
    simp [obliqueRoot]
    linarith
  have htail : ‖(∑' j : ℕ, cuspTerm obliqueRoot (j + 6)) / d‖ ≤ 1 / 24 := by
    rw [norm_div]
    calc
      _ ≤ (1 / 6) / 4 := div_le_div₀ (by positivity) (by
        simpa using tail_bound norm_obliqueRoot (N := 6) (by decide)) (by norm_num) hd
      _ = _ := by norm_num
  have htailRe := (abs_le.mp (Complex.abs_re_le_norm
    ((∑' j : ℕ, cuspTerm obliqueRoot (j + 6)) / d))).1
  change _ < ((∑' j, cuspTerm obliqueRoot j) / d).re
  rw [← (summable_cuspTerm norm_obliqueRoot).sum_add_tsum_nat_add 6, add_div, Complex.add_re]
  linarith

end GawronUlasPartitionSigns
