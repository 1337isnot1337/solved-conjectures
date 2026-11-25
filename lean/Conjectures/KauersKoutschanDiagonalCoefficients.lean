import Conjectures.KauersKoutschanTraceCoefficients

/-! Coefficient extraction for a shifted complete homogeneous character. -/

open scoped BigOperators

namespace KauersKoutschan

noncomputable abbrev twoDegree (p q : ℕ) : Fin 2 →₀ ℕ := Finsupp.single 0 p + Finsupp.single 1 q

private theorem coeff_rowPowers (p q r s : ℕ) :
    (rowMarker 0 ^ r * rowMarker 1 ^ s).coeff (twoDegree p q) =
      if p = r ∧ q = s then 1 else 0 := by
  change (MvPolynomial.X 0 ^ r * MvPolynomial.X 1 ^ s : TwoVariablePolynomial).coeff
    (twoDegree p q) = _
  rw [MvPolynomial.X_pow_eq_monomial, MvPolynomial.X_pow_eq_monomial,
    MvPolynomial.monomial_mul_monomial, MvPolynomial.coeff_monomial, mul_one]
  have heq : twoDegree r s = twoDegree p q ↔ p = r ∧ q = s := by
    constructor
    · intro h
      have h₀ := congrArg (fun d : Fin 2 →₀ ℕ => d 0) h
      have h₁ := congrArg (fun d : Fin 2 →₀ ℕ => d 1) h
      exact ⟨by simpa [twoDegree] using h₀.symm, by simpa [twoDegree] using h₁.symm⟩
    · rintro ⟨rfl, rfl⟩
      rfl
  change (if twoDegree r s = twoDegree p q then (1 : ℝ) else 0) = _
  by_cases h : twoDegree r s = twoDegree p q
  · rw [ite_eq_left h, ite_eq_left (heq.mp h)]
  · rw [ite_eq_right h, ite_eq_right (fun hc => h (heq.mpr hc))]

/-- The literal coefficient of the shifted character is either zero or one,
given exactly by the two lower bounds and the total-degree equation. -/
theorem coeff_shifted_diagonal (p q r s m : ℕ) :
    ((rowMarker 0 ^ r * rowMarker 1 ^ s) *
      (traceComplete (rowMarker 0 * rowMarker 1) m).eval (rowMarker 0 + rowMarker 1)).coeff
      (twoDegree p q) =
      if r ≤ p ∧ s ≤ q ∧ p + q = r + s + m then 1 else 0 := by
  rw [traceComplete_eval_geometric, Finset.mul_sum, MvPolynomial.coeff_sum]
  have hterm (k : ℕ) :
      ((rowMarker 0 ^ r * rowMarker 1 ^ s) *
        (rowMarker 0 ^ k * rowMarker 1 ^ (m - k))).coeff (twoDegree p q) =
          if p = r + k ∧ q = s + (m - k) then 1 else 0 := by
    rw [show (rowMarker 0 ^ r * rowMarker 1 ^ s) *
      (rowMarker 0 ^ k * rowMarker 1 ^ (m - k)) =
      rowMarker 0 ^ (r + k) * rowMarker 1 ^ (s + (m - k)) by rw [pow_add, pow_add]; ring]
    exact coeff_rowPowers p q (r + k) (s + (m - k))
  simp_rw [hterm]
  split_ifs with h
  · obtain ⟨hr, hs, hdegree⟩ := h
    have hk : p - r < m + 1 := by omega
    have hp : p = r + (p - r) := by omega
    have hq : q = s + (m - (p - r)) := by omega
    rw [Finset.sum_eq_single (p - r)]
    · rw [ite_eq_left ⟨hp, hq⟩]
    · intro j _ hj
      apply ite_eq_right
      intro hj'
      exact hj (by have := hj'.1; omega)
    · intro hk'
      exact (hk' (Finset.mem_range.mpr hk)).elim
  · apply Finset.sum_eq_zero
    intro k hk
    apply ite_eq_right
    intro hh
    have hkm := Finset.mem_range.mp hk
    exact h (by obtain ⟨_, _⟩ := hh; omega)

end KauersKoutschan
