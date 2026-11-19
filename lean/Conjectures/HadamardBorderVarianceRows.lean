import Conjectures.HadamardBorderVariance

/-!
# Four compressed rows from their energy identities

A total variance of nine forces exactly one constant row and three rows with
one exceptional entry. Common parity scales the exceptional jumps from one
to two. Relabeling proves the same result for any finite quotient of size
four, without using a group structure or a splitting.
-/

namespace HadamardBorderVariance

open scoped BigOperators

private theorem four_variances_sum_nine (a b c d : ℤ)
    (ha : 0 ≤ a) (hb : 0 ≤ b) (hc : 0 ≤ c) (hd : 0 ≤ d)
    (hma : a % 4 = 0 ∨ a % 4 = 3) (hmb : b % 4 = 0 ∨ b % 4 = 3)
    (hmc : c % 4 = 0 ∨ c % 4 = 3) (hmd : d % 4 = 0 ∨ d % 4 = 3)
    (hsum : a + b + c + d = 9) :
    (a = 0 ∧ b = 3 ∧ c = 3 ∧ d = 3) ∨
    (a = 3 ∧ b = 0 ∧ c = 3 ∧ d = 3) ∨
    (a = 3 ∧ b = 3 ∧ c = 0 ∧ d = 3) ∨
    (a = 3 ∧ b = 3 ∧ c = 3 ∧ d = 0) := by
  omega

theorem variances_of_total_nine (x : Fin 4 → Fin 4 → ℤ)
    (htotal : ∑ i, variance (x i) = 9) :
    ∃ k : Fin 4, variance (x k) = 0 ∧
      ∀ i, i ≠ k → variance (x i) = 3 := by
  have hsum : variance (x 0) + variance (x 1) + variance (x 2) +
      variance (x 3) = 9 := by
    simpa only [Fin.sum_univ_four] using htotal
  have hcases := four_variances_sum_nine
    (variance (x 0)) (variance (x 1)) (variance (x 2)) (variance (x 3))
    (variance_nonneg (x 0)) (variance_nonneg (x 1))
    (variance_nonneg (x 2)) (variance_nonneg (x 3))
    (variance_mod_four (x 0)) (variance_mod_four (x 1))
    (variance_mod_four (x 2)) (variance_mod_four (x 3)) hsum
  rcases hcases with ⟨ha, hb, hc, hd⟩ | ⟨ha, hb, hc, hd⟩ |
    ⟨ha, hb, hc, hd⟩ | ⟨ha, hb, hc, hd⟩
  · refine ⟨0, ha, ?_⟩
    intro i hi
    fin_cases i
    · exact (hi rfl).elim
    · exact hb
    · exact hc
    · exact hd
  · refine ⟨1, hb, ?_⟩
    intro i hi
    fin_cases i
    · exact ha
    · exact (hi rfl).elim
    · exact hc
    · exact hd
  · refine ⟨2, hc, ?_⟩
    intro i hi
    fin_cases i
    · exact ha
    · exact hb
    · exact (hi rfl).elim
    · exact hd
  · refine ⟨3, hd, ?_⟩
    intro i hi
    fin_cases i
    · exact ha
    · exact hb
    · exact hc
    · exact (hi rfl).elim

/-- Exactly one row is constant, and all three remaining rows have one
exceptional entry differing by one. -/
theorem four_rows_of_total_nine (x : Fin 4 → Fin 4 → ℤ)
    (htotal : ∑ i, variance (x i) = 9) :
    ∃ (k : Fin 4) (baseline : ℤ),
      (∀ q, x k q = baseline) ∧
      (∀ i, i ≠ k → SingleException (x i)) ∧
      ∀ i, (∃ b : ℤ, ∀ q, x i q = b) ↔ i = k := by
  obtain ⟨k, hk, hothers⟩ := variances_of_total_nine x htotal
  obtain ⟨baseline, hconstant⟩ := (variance_eq_zero_iff (x k)).mp hk
  refine ⟨k, baseline, hconstant, ?_, ?_⟩
  · intro i hi
    exact (variance_eq_three_iff (x i)).mp (hothers i hi)
  · intro i
    constructor
    · intro hc
      have hzero := (variance_eq_zero_iff (x i)).mpr hc
      by_contra hi
      have hthree := hothers i hi
      omega
    · rintro rfl
      exact ⟨baseline, hconstant⟩

theorem total_variance_identity (c : Fin 4 → Fin 4 → ℤ) :
    (∑ i, variance (c i)) =
      4 * (∑ i, ∑ q, c i q ^ 2) - ∑ i, (∑ q, c i q) ^ 2 := by
  simp only [variance, Finset.sum_sub_distrib, Finset.mul_sum]

/-- The common-parity offset cancels, and the two stated energy identities
force total variance nine. The parameter s may be any integer. -/
theorem total_variance_eq_nine_of_common_parity
    (c x : Fin 4 → Fin 4 → ℤ) (e s : ℤ)
    (hparity : ∀ i q, c i q = 2 * x i q + e)
    (henergy : (∑ i, ∑ q, c i q ^ 2) = 4 * s + 12)
    (hrows : (∑ i, (∑ q, c i q) ^ 2) = 16 * s + 12) :
    (∑ i, variance (x i)) = 9 := by
  have hc : (∑ i, variance (c i)) = 36 := by
    rw [total_variance_identity, henergy, hrows]
    ring
  have hscale (i : Fin 4) : variance (c i) = 4 * variance (x i) := by
    have hrow : c i = fun q => 2 * x i q + e := funext (hparity i)
    rw [hrow]
    simpa using variance_affine (x i) 2 e
  have hx : 4 * (∑ i, variance (x i)) = 36 := by
    simpa only [hscale, ← Finset.mul_sum] using hc
  omega

/-- The shape hypothesis used by actual row normalization follows from the
two energy equations and common parity. No classification is assumed. -/
theorem compression_shapes_of_energy
    (c x : Fin 4 → Fin 4 → ℤ) (e s : ℤ)
    (hparity : ∀ i q, c i q = 2 * x i q + e)
    (henergy : (∑ i, ∑ q, c i q ^ 2) = 4 * s + 12)
    (hrows : (∑ i, (∑ q, c i q) ^ 2) = 16 * s + 12) :
    ∃ (k : Fin 4) (d : ℤ), (∀ q, c k q = d) ∧
      ∀ i, i ≠ k → ∃ (baseline : ℤ) (exception : Fin 4) (ε : ℤ),
        (ε = 1 ∨ ε = -1) ∧ ∀ q, c i q =
          baseline + if q = exception then 2 * ε else 0 := by
  have htotal := total_variance_eq_nine_of_common_parity
    c x e s hparity henergy hrows
  obtain ⟨k, d, hconstant, hshapes, _hunique⟩ := four_rows_of_total_nine x htotal
  refine ⟨k, 2 * d + e, ?_, ?_⟩
  · intro q
    rw [hparity, hconstant]
  · intro i hi
    obtain ⟨baseline, exception, ε, hε, hshape⟩ := hshapes i hi
    refine ⟨2 * baseline + e, exception, ε, hε, ?_⟩
    intro q
    rw [hparity, hshape]
    by_cases hq : q = exception <;> simp [hq] <;> ring

/-- An equality of residues modulo two supplies the integer parity lift. -/
theorem compression_shapes_of_mod_two
    (c : Fin 4 → Fin 4 → ℤ) (s : ℤ)
    (hparity : ∀ i q, c i q % 2 = s % 2)
    (henergy : (∑ i, ∑ q, c i q ^ 2) = 4 * s + 12)
    (hrows : (∑ i, (∑ q, c i q) ^ 2) = 16 * s + 12) :
    ∃ (k : Fin 4) (d : ℤ), (∀ q, c k q = d) ∧
      ∀ i, i ≠ k → ∃ (baseline : ℤ) (exception : Fin 4) (ε : ℤ),
        (ε = 1 ∨ ε = -1) ∧ ∀ q, c i q =
          baseline + if q = exception then 2 * ε else 0 := by
  apply compression_shapes_of_energy c (fun i q => c i q / 2) (s % 2) s
    ?_ henergy hrows
  intro i q
  have hmod := hparity i q
  omega

/-- The same exact compression shapes on an arbitrary finite index type of
cardinality four. This conclusion is the input to the accepted actual-row
normalization theorem. -/
theorem compression_shapes_of_card_four {Q : Type*} [Fintype Q] [DecidableEq Q]
    (c : Fin 4 → Q → ℤ) (s : ℤ) (hQ : Fintype.card Q = 4)
    (hparity : ∀ i q, c i q % 2 = s % 2)
    (henergy : (∑ i, ∑ q, c i q ^ 2) = 4 * s + 12)
    (hrows : (∑ i, (∑ q, c i q) ^ 2) = 16 * s + 12) :
    ∃ (k : Fin 4) (d : ℤ), (∀ q, c k q = d) ∧
      ∀ i, i ≠ k → ∃ (baseline : ℤ) (exception : Q) (ε : ℤ),
        (ε = 1 ∨ ε = -1) ∧ ∀ q, c i q =
          baseline + if q = exception then 2 * ε else 0 := by
  classical
  let e : Q ≃ Fin 4 := Fintype.equivFinOfCardEq hQ
  let c' : Fin 4 → Fin 4 → ℤ := fun i q => c i (e.symm q)
  have hparity' : ∀ i q, c' i q % 2 = s % 2 :=
    fun i q => hparity i (e.symm q)
  have henergy' : (∑ i, ∑ q, c' i q ^ 2) = 4 * s + 12 := by
    calc
      (∑ i, ∑ q, c' i q ^ 2) = ∑ i, ∑ q, c i q ^ 2 := by
        apply Finset.sum_congr rfl
        intro i hi
        exact Equiv.sum_comp e.symm (fun q => c i q ^ 2)
      _ = 4 * s + 12 := henergy
  have hrow (i : Fin 4) : (∑ q, c' i q) = ∑ q, c i q :=
    Equiv.sum_comp e.symm (c i)
  have hrows' : (∑ i, (∑ q, c' i q) ^ 2) = 16 * s + 12 := by
    simpa only [hrow] using hrows
  obtain ⟨k, d, hconstant, hshapes⟩ :=
    compression_shapes_of_mod_two c' s hparity' henergy' hrows'
  refine ⟨k, d, ?_, ?_⟩
  · intro q
    simpa only [c', Equiv.symm_apply_apply] using hconstant (e q)
  · intro i hi
    obtain ⟨baseline, exception, ε, hε, hshape⟩ := hshapes i hi
    refine ⟨baseline, e.symm exception, ε, hε, ?_⟩
    intro q
    have htest : e q = exception ↔ q = e.symm exception := by
      constructor
      · intro h
        have hh := congrArg e.symm h
        simpa only [Equiv.symm_apply_apply] using hh
      · rintro rfl
        exact e.apply_symm_apply exception
    simpa only [c', Equiv.symm_apply_apply, htest] using hshape (e q)

end HadamardBorderVariance
