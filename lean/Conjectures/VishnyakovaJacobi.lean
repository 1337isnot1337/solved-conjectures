module

public import Conjectures.VishnyakovaRootRadius
public import Mathlib.Algebra.Order.BigOperators.Group.Finset

/-!
# The weighted Jacobi estimate

The tridiagonal argument is expressed through a finite recurrence and a
positive weighted inner product.  This avoids an unproved determinant or
spectral-parameter correspondence.  The off-diagonal coefficients are `j`
and `beta+j`; their positive weights make the quadratic form real.
-/

@[expose] public section

namespace VishnyakovaRootRadius

open scoped BigOperators ComplexConjugate

noncomputable def jacobiWeight (beta : ℝ) : ℕ → ℝ
  | 0 => 1
  | n + 1 => jacobiWeight beta n * (beta + (n : ℝ)) / ((n : ℝ) + 1)

theorem jacobiWeight_pos (beta : ℝ) (hbeta : 0 < beta) (n : ℕ) :
    0 < jacobiWeight beta n := by
  induction n with
  | zero => simp [jacobiWeight]
  | succ n ih =>
    exact div_pos (mul_pos ih (by positivity)) (by positivity)

theorem jacobiWeight_step (beta : ℝ) (n : ℕ) :
    jacobiWeight beta (n + 1) * ((n : ℝ) + 1) =
      jacobiWeight beta n * (beta + (n : ℝ)) := by
  rw [jacobiWeight, div_mul_cancel₀ _ (by positivity : (n : ℝ) + 1 ≠ 0)]

noncomputable def jacobiMass (beta : ℝ) (q : ℕ → ℂ) (n : ℕ) : ℝ :=
  ∑ j ∈ Finset.range n, jacobiWeight beta j * Complex.normSq (q j)

noncomputable def jacobiMoment (beta : ℝ) (q : ℕ → ℂ) (n : ℕ) : ℝ :=
  ∑ j ∈ Finset.range n, jacobiWeight beta j * (j : ℝ) * Complex.normSq (q j)

noncomputable def jacobiCross (beta : ℝ) (q : ℕ → ℂ) (n : ℕ) : ℝ :=
  ∑ j ∈ Finset.range n,
    jacobiWeight beta j * (beta + (j : ℝ)) * (2 * (q (j + 1) * conj (q j)).re)

private theorem cross_term_bound (a b : ℂ) :
    |2 * (b * conj a).re| ≤ Complex.normSq a + Complex.normSq b := by
  have hp := Complex.normSq_nonneg (a + b)
  have hm := Complex.normSq_nonneg (a - b)
  rw [abs_le]
  simp only [Complex.normSq_apply, Complex.add_re, Complex.add_im,
    Complex.sub_re, Complex.sub_im, Complex.mul_re, Complex.conj_re,
    Complex.conj_im] at hp hm ⊢
  constructor <;> nlinarith

private theorem jacobi_edge_norm_identity (beta : ℝ) (q : ℕ → ℂ) (n : ℕ) :
    (∑ j ∈ Finset.range n, jacobiWeight beta j * (beta + (j : ℝ)) *
      (Complex.normSq (q j) + Complex.normSq (q (j + 1)))) +
      jacobiWeight beta n * (beta + (n : ℝ)) * Complex.normSq (q n) =
      2 * jacobiMoment beta q (n + 1) + beta * jacobiMass beta q (n + 1) := by
  induction n with
  | zero => simp [jacobiMoment, jacobiMass, jacobiWeight]
  | succ n ih =>
    have hw := jacobiWeight_step beta n
    simp only [jacobiMoment, jacobiMass, Finset.sum_range_succ, Nat.cast_add,
      Nat.cast_one] at ih ⊢
    linear_combination ih - Complex.normSq (q (n + 1)) * hw

theorem jacobiCross_bound (beta : ℝ) (hbeta : 0 < beta) (q : ℕ → ℂ) (n : ℕ) :
    |jacobiCross beta q n| ≤
      2 * jacobiMoment beta q (n + 1) + beta * jacobiMass beta q (n + 1) := by
  have hpos (j : ℕ) : 0 ≤ jacobiWeight beta j * (beta + (j : ℝ)) :=
    mul_nonneg (jacobiWeight_pos beta hbeta j).le (by positivity)
  calc
    |jacobiCross beta q n| ≤
        ∑ j ∈ Finset.range n,
          |jacobiWeight beta j * (beta + (j : ℝ)) *
            (2 * (q (j + 1) * conj (q j)).re)| := Finset.abs_sum_le_sum_abs _ _
    _ ≤ ∑ j ∈ Finset.range n, jacobiWeight beta j * (beta + (j : ℝ)) *
        (Complex.normSq (q j) + Complex.normSq (q (j + 1))) := by
      apply Finset.sum_le_sum
      intro j hj
      rw [abs_mul, abs_of_nonneg (hpos j)]
      exact mul_le_mul_of_nonneg_left (cross_term_bound (q j) (q (j + 1))) (hpos j)
    _ ≤ (∑ j ∈ Finset.range n, jacobiWeight beta j * (beta + (j : ℝ)) *
        (Complex.normSq (q j) + Complex.normSq (q (j + 1)))) +
          jacobiWeight beta n * (beta + (n : ℝ)) * Complex.normSq (q n) :=
      le_add_of_nonneg_right (mul_nonneg (hpos n) (Complex.normSq_nonneg _))
    _ = _ := jacobi_edge_norm_identity beta q n

private theorem jacobi_neighbor_sum (beta : ℝ) (q : ℕ → ℂ) (n : ℕ) :
    (∑ j ∈ Finset.range (n + 1), (jacobiWeight beta j : ℂ) *
      (((beta : ℂ) + (j : ℂ)) * q (j + 1) + (j : ℂ) * q (j - 1)) * conj (q j)) =
      (jacobiCross beta q n : ℂ) +
        (jacobiWeight beta n : ℂ) * ((beta : ℂ) + (n : ℂ)) * q (n + 1) * conj (q n) := by
  induction n with
  | zero => simp [jacobiCross, mul_assoc]
  | succ n ih =>
    have hw : (jacobiWeight beta (n + 1) : ℂ) * ((n : ℂ) + 1) =
        (jacobiWeight beta n : ℂ) * ((beta : ℂ) + (n : ℂ)) := by
      exact_mod_cast jacobiWeight_step beta n
    have hc : q (n + 1) * conj (q n) + q n * conj (q (n + 1)) =
        ((2 * (q (n + 1) * conj (q n)).re : ℝ) : ℂ) := by
      simpa [map_mul, mul_comm] using Complex.add_conj (q (n + 1) * conj (q n))
    rw [Finset.sum_range_succ, ih]
    simp only [jacobiCross, Finset.sum_range_succ, Nat.cast_add, Nat.cast_one,
      Nat.add_sub_cancel, Complex.ofReal_add, Complex.ofReal_mul]
    push_cast at hc ⊢
    linear_combination (q n * conj (q (n + 1))) * hw +
      ((jacobiWeight beta n : ℂ) * ((beta : ℂ) + (n : ℂ))) * hc

private theorem jacobi_diagonal_sum (beta : ℝ) (q : ℕ → ℂ) (z t : ℂ) (n : ℕ) :
    (∑ j ∈ Finset.range n, (jacobiWeight beta j : ℂ) *
      (z - (j : ℂ) + (2 * (j : ℂ) + (beta : ℂ)) * t) * q j * conj (q j)) =
      z * (jacobiMass beta q n : ℂ) - (jacobiMoment beta q n : ℂ) +
        t * (2 * (jacobiMoment beta q n : ℂ) + (beta : ℂ) * (jacobiMass beta q n : ℂ)) := by
  induction n with
  | zero => simp [jacobiMass, jacobiMoment]
  | succ n ih =>
    rw [Finset.sum_range_succ, ih]
    have hnorm := Complex.mul_conj (q n)
    simp only [jacobiMass, jacobiMoment, Finset.sum_range_succ,
      Complex.ofReal_add, Complex.ofReal_mul, Complex.ofReal_natCast]
    linear_combination ((jacobiWeight beta n : ℂ) *
      (z - (n : ℂ) + (2 * (n : ℂ) + (beta : ℂ)) * t)) * hnorm

/-- A nonzero finite Jacobi vector gives the real scalar Rayleigh identity.
The vanishing terminal coordinate removes the boundary term. -/
theorem jacobi_rayleigh_identity (beta : ℝ) (q : ℕ → ℂ) (z t s : ℂ) (n : ℕ)
    (hqn : q (n + 1) = 0)
    (hrec : ∀ j, j < n + 1 →
      (z - (j : ℂ) + (2 * (j : ℂ) + (beta : ℂ)) * t) * q j =
        Complex.I * s *
          (((beta : ℂ) + (j : ℂ)) * q (j + 1) + (j : ℂ) * q (j - 1))) :
    z * (jacobiMass beta q (n + 1) : ℂ) =
      (jacobiMoment beta q (n + 1) : ℂ) -
        t * (2 * (jacobiMoment beta q (n + 1) : ℂ) +
          (beta : ℂ) * (jacobiMass beta q (n + 1) : ℂ)) +
        Complex.I * s * (jacobiCross beta q n : ℂ) := by
  have hsum :
      (∑ j ∈ Finset.range (n + 1), (jacobiWeight beta j : ℂ) *
        (z - (j : ℂ) + (2 * (j : ℂ) + (beta : ℂ)) * t) * q j * conj (q j)) =
      Complex.I * s *
        (∑ j ∈ Finset.range (n + 1), (jacobiWeight beta j : ℂ) *
          (((beta : ℂ) + (j : ℂ)) * q (j + 1) + (j : ℂ) * q (j - 1)) * conj (q j)) := by
    rw [Finset.mul_sum]
    apply Finset.sum_congr rfl
    intro j hj
    linear_combination (jacobiWeight beta j : ℂ) * conj (q j) * hrec j (Finset.mem_range.mp hj)
  rw [jacobi_diagonal_sum, jacobi_neighbor_sum, hqn] at hsum
  simp only [mul_zero, zero_mul, add_zero] at hsum
  linear_combination hsum

theorem jacobiMass_pos (beta : ℝ) (hbeta : 0 < beta) (q : ℕ → ℂ) (hq0 : q 0 ≠ 0)
    (n : ℕ) : 0 < jacobiMass beta q (n + 1) := by
  apply Finset.sum_pos'
  · intro j hj
    exact mul_nonneg (jacobiWeight_pos beta hbeta j).le (Complex.normSq_nonneg _)
  · refine ⟨0, by simp, ?_⟩
    exact mul_pos (jacobiWeight_pos beta hbeta 0) (Complex.normSq_pos.mpr hq0)

theorem jacobiMoment_bounds (beta : ℝ) (hbeta : 0 < beta) (q : ℕ → ℂ) (n : ℕ) :
    0 ≤ jacobiMoment beta q (n + 1) ∧
      jacobiMoment beta q (n + 1) ≤ (n : ℝ) * jacobiMass beta q (n + 1) := by
  constructor
  · apply Finset.sum_nonneg
    intro j hj
    exact mul_nonneg (mul_nonneg (jacobiWeight_pos beta hbeta j).le
      (Nat.cast_nonneg j)) (Complex.normSq_nonneg _)
  · unfold jacobiMoment jacobiMass
    rw [Finset.mul_sum]
    apply Finset.sum_le_sum
    intro j hj
    have hjn : (j : ℝ) ≤ n := by
      exact_mod_cast Nat.le_of_lt_succ (Finset.mem_range.mp hj)
    have hw := mul_nonneg (jacobiWeight_pos beta hbeta j).le (Complex.normSq_nonneg (q j))
    calc
      jacobiWeight beta j * (j : ℝ) * Complex.normSq (q j) =
          (j : ℝ) * (jacobiWeight beta j * Complex.normSq (q j)) := by ring
      _ ≤ (n : ℝ) * (jacobiWeight beta j * Complex.normSq (q j)) :=
        mul_le_mul_of_nonneg_right hjn hw

/-- The full disk estimate for a finite Jacobi recurrence. -/
theorem jacobi_disk_bound (beta : ℝ) (hbeta : 0 < beta) (q : ℕ → ℂ)
    (hq0 : q 0 ≠ 0) (z t s : ℂ) (n : ℕ)
    (hs : s ^ 2 = t * (1 - t)) (ht : 0 ≤ t.im) (hz : 0 < z.im)
    (hqn : q (n + 1) = 0)
    (hrec : ∀ j, j < n + 1 →
      (z - (j : ℂ) + (2 * (j : ℂ) + (beta : ℂ)) * t) * q j =
        Complex.I * s *
          (((beta : ℂ) + (j : ℂ)) * q (j + 1) + (j : ℂ) * q (j - 1))) :
    ‖z + ((beta / 2 : ℝ) : ℂ)‖ ≤ (n : ℝ) + beta / 2 := by
  let N := jacobiMass beta q (n + 1)
  let D := jacobiMoment beta q (n + 1)
  let K := jacobiCross beta q n
  have hN : 0 < N := jacobiMass_pos beta hbeta q hq0 n
  have hD : 0 ≤ D ∧ D ≤ (n : ℝ) * N := jacobiMoment_bounds beta hbeta q n
  have hK : |K| ≤ 2 * D + beta * N := jacobiCross_bound beta hbeta q n
  have hd : 0 ≤ D / N := div_nonneg hD.1 hN.le
  have hdR : D / N ≤ (n : ℝ) := (div_le_iff₀ hN).mpr hD.2
  have hk : |K / N| ≤ 2 * (D / N) + beta := by
    rw [abs_div, abs_of_pos hN, div_le_iff₀ hN]
    calc
      |K| ≤ 2 * D + beta * N := hK
      _ = (2 * (D / N) + beta) * N := by field_simp [hN.ne']
  have henergy : z * (N : ℂ) = (D : ℂ) -
      t * (2 * (D : ℂ) + (beta : ℂ) * (N : ℂ)) + Complex.I * s * (K : ℂ) :=
    jacobi_rayleigh_identity beta q z t s n hqn hrec
  have hNc : (N : ℂ) ≠ 0 := by exact_mod_cast hN.ne'
  have heigen : z = ((D / N : ℝ) : ℂ) -
      t * ((2 * (D / N) + beta : ℝ) : ℂ) + Complex.I * s * ((K / N : ℝ) : ℂ) := by
    push_cast
    field_simp [hNc]
    linear_combination henergy
  exact (rayleigh_disk_bound beta (D / N) (n : ℝ) (K / N) hbeta hd hdR hk
    t s z hs ht hz heigen).1

end VishnyakovaRootRadius
