import Conjectures.KauersKoutschanDiagonalCoefficients
import Conjectures.KauersKoutschanCount
import Conjectures.KauersKoutschanOrderedRows
import Conjectures.KauersKoutschanMaskExpansion

/-! The extracted contribution of each source mask is its truncated
derangement divided-difference sum. -/

open scoped BigOperators

namespace KauersKoutschan

open KauersKoutschanCertificate (bit cells)

private theorem factorialMomentPair_C_mul
    (a : TwoVariablePolynomial) (z : rowMarkedWeights) :
    factorialMomentPair (MvPolynomial.C a * z) = a * factorialMomentPair z := by
  rw [← MvPolynomial.smul_eq_C_mul, map_smul, smul_eq_mul]

private theorem coeff_shifted_trace_moment (p q r s p' q' : ℕ)
    (hdegree : p + q = r + s + p' + q') :
    (factorialMomentPair (MvPolynomial.C (rowMarker 0 ^ r * rowMarker 1 ^ s) *
      (markedHomogeneous p' * markedHomogeneous q'))).coeff (twoDegree p q) =
      ∑ j ∈ Finset.range (min p' q' + 1),
        if r + j ≤ p ∧ s + j ≤ q then (dividedDifference (p' + q' + 1 - j) j : ℝ) else 0 := by
  rw [factorialMomentPair_C_mul, factorialMomentPair_marked_trace_product, Finset.mul_sum,
    MvPolynomial.coeff_sum]
  apply Finset.sum_congr rfl
  intro j hj
  have hmin := Finset.mem_range.mp hj
  have hjp : j ≤ p' := le_trans (by omega : j ≤ min p' q') (min_le_left _ _)
  have hjq : j ≤ q' := le_trans (by omega : j ≤ min p' q') (min_le_right _ _)
  let m := p' + q' - 2 * j
  let a := rowMarker 0
  let b := rowMarker 1
  let H := (traceComplete (a * b) m).eval (a + b)
  let v := (dividedDifference (j + (m + 1)) j : ℝ)
  change (a ^ r * b ^ s * ((a * b) ^ j * H * MvPolynomial.C v)).coeff (twoDegree p q) = _
  rw [show a ^ r * b ^ s * ((a * b) ^ j * H * MvPolynomial.C v) =
    MvPolynomial.C v * ((a ^ (r + j) * b ^ (s + j)) * H) by rw [mul_pow, pow_add, pow_add]; ring,
    MvPolynomial.coeff_C_mul]
  have hd : p + q = (r + j) + (s + j) + m := by dsimp [m]; omega
  have hk : j + (m + 1) = p' + q' + 1 - j := by dsimp [m]; omega
  change v * ((rowMarker 0 ^ (r + j) * rowMarker 1 ^ (s + j)) *
      (traceComplete (rowMarker 0 * rowMarker 1) m).eval (rowMarker 0 + rowMarker 1)).coeff
      (twoDegree p q) = _
  rw [coeff_shifted_diagonal]
  simp only [v, hd, hk, and_true, mul_ite, mul_one, mul_zero]

private theorem rowLength_sum (n : ℕ) : rowLength n 0 + rowLength n 1 = n := by
  change (n + 1 - 0) / 2 + (n + 1 - 1) / 2 = n
  omega

set_option maxHeartbeats 1000000 in
/-- The exact coefficient from one mask matches the source cutoff and moment. -/
theorem coeff_maskWeight (n mask : ℕ) :
    (factorialMomentPair (maskWeight (rowLength n 0) (rowLength n 1) mask)).coeff
        (twoDegree (rowLength n 0) (rowLength n 1)) =
      ((if (cells n mask).2 < 0 then 0 else
        ∑ j ∈ Finset.range ((cells n mask).2.toNat + 1),
          dividedDifference ((cells n mask).1 - j) j) : ℚ) := by
  let p := rowLength n 0
  let q := rowLength n 1
  let a := bit mask 0
  let b := bit mask 1
  let c := bit mask 2
  let d := bit mask 3
  let s := (cells n mask).1
  let u := (cells n mask).2
  let p' := p - a - c
  let q' := q - b - d
  have hn : p + q = n := rowLength_sum n
  have hs : s = n + 1 - a - b - c - d := rfl
  have hu : u = min (min ((p : ℤ) - a - b) ((q : ℤ) - c - d))
      (min ((p : ℤ) - a - c) ((q : ℤ) - b - d)) := by
    simp [u, cells, a, b, c, d, p, q, rowLength]
  have hfit : 0 ≤ u ↔ a + b ≤ p ∧ c + d ≤ q ∧ a + c ≤ p ∧ b + d ≤ q := by
    rw [hu]
    simp only [le_min_iff]
    omega
  change (factorialMomentPair (if a + c ≤ p ∧ b + d ≤ q then
    MvPolynomial.C (rowMarker 0 ^ (a + b) * rowMarker 1 ^ (c + d)) *
      (markedHomogeneous p' * markedHomogeneous q') else 0)).coeff (twoDegree p q) =
    (((if u < 0 then 0 else
      ∑ j ∈ Finset.range (u.toNat + 1), dividedDifference (s - j) j) : ℚ) : ℝ)
  by_cases hcol : a + c ≤ p ∧ b + d ≤ q
  · rw [ite_eq_left hcol]
    have hdegree : p + q = (a + b) + (c + d) + p' + q' := by
      dsimp [p', q']
      omega
    have hs' : s = p' + q' + 1 := by
      rw [hs]
      dsimp [p', q']
      omega
    rw [coeff_shifted_trace_moment p q (a + b) (c + d) p' q' hdegree, hs']
    by_cases hrow : a + b ≤ p ∧ c + d ≤ q
    · have hnonneg : ¬u < 0 := not_lt_of_ge (hfit.mpr ⟨hrow.1, hrow.2, hcol.1, hcol.2⟩)
      let bound := min (min (p - a - b) (q - c - d)) (min p' q')
      have hb : u = (bound : ℤ) := by
        rw [hu]
        dsimp [bound, p', q']
        simp only [Nat.cast_min, Nat.cast_sub (show b ≤ p - a by omega),
          Nat.cast_sub (show d ≤ q - c by omega), Nat.cast_sub (show c ≤ p - a by omega),
          Nat.cast_sub (show d ≤ q - b by omega), Nat.cast_sub (show a ≤ p by omega),
          Nat.cast_sub (show c ≤ q by omega), Nat.cast_sub (show b ≤ q by omega)]
      have hfilter :
          (Finset.range (min p' q' + 1)).filter (fun j => a + b + j ≤ p ∧ c + d + j ≤ q) =
            Finset.range (bound + 1) := by
        ext j
        simp only [Finset.mem_filter, Finset.mem_range]
        unfold bound
        omega
      rw [ite_eq_right hnonneg, hb, Int.toNat_natCast, Rat.cast_sum, ← Finset.sum_filter, hfilter]
    · have hneg : u < 0 := by
        by_contra h
        have ht := hfit.mp (le_of_not_gt h)
        exact hrow ⟨ht.1, ht.2.1⟩
      rw [ite_eq_left hneg, Rat.cast_zero]
      apply Finset.sum_eq_zero
      intro j _
      exact ite_eq_right (fun h => hrow (by omega))
  · have hneg : u < 0 := by
      by_contra h
      have ht := hfit.mp (le_of_not_gt h)
      exact hcol ⟨ht.2.2.1, ht.2.2.2⟩
    rw [ite_eq_right hcol, ite_eq_left hneg]
    simp

end KauersKoutschan
