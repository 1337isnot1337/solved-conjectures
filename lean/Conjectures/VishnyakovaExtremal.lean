module

public import Conjectures.VishnyakovaTransform

/-!
# The extremal polynomial and its sampled sequence

The inverse image of `(1 + X)^n` has the literal rising-factorial formula.
At unit weight its values at nonnegative integers are `choose (k + n) n`.
These identities connect the radius extremizer to the sampled sequence used
in the original total-positivity formulation; no total-positivity hypothesis
or classification theorem is assumed here.
-/

@[expose] public section

namespace VishnyakovaRootRadius

open Polynomial

noncomputable def weightedExtremal (beta : ℝ) (hbeta : 0 < beta) (n : ℕ) : ℝ[X] :=
  (sourceTransform beta hbeta).symm ((Polynomial.X + Polynomial.C 1) ^ n)

theorem weightedExtremal_complex_eval (beta : ℝ) (hbeta : 0 < beta) (n : ℕ) (z : ℂ) :
    ((weightedExtremal beta hbeta n).map Complex.ofRealHom).eval z =
      ascendingProduct (z + (beta : ℂ)) n / (risingProduct beta n : ℂ) := by
  rw [weightedExtremal, sourceTransform_inverse_eval]
  have hmap : (((Polynomial.X + Polynomial.C 1) ^ n : ℝ[X]).map Complex.ofRealHom) =
      (Polynomial.C (1 : ℂ) + Polynomial.X) ^ n := by simp [add_comm]
  rw [hmap, ← binomialValue_eq_pairing]
  have hr : (risingProduct beta n : ℂ) ≠ 0 := by
    exact_mod_cast (risingProduct_pos beta hbeta n).ne'
  apply (eq_div_iff hr).mpr
  simpa only [monicDiagonalValue, mul_comm] using monicDiagonalValue_at_one beta hbeta z n

theorem weightedExtremal_real_eval (beta : ℝ) (hbeta : 0 < beta) (n : ℕ) (x : ℝ) :
    (weightedExtremal beta hbeta n).eval x = risingProduct (x + beta) n / risingProduct beta n := by
  apply Complex.ofReal_injective
  have h := weightedExtremal_complex_eval beta hbeta n (x : ℂ)
  have heval := Polynomial.eval_map_apply (p := weightedExtremal beta hbeta n)
    Complex.ofRealHom x
  simp only [Complex.ofRealHom_eq_coe] at heval
  rw [heval] at h
  simpa [ascendingProduct, risingProduct, map_prod] using h

theorem weightedExtremal_natDegree (beta : ℝ) (hbeta : 0 < beta) (n : ℕ) :
    (weightedExtremal beta hbeta n).natDegree = n := by
  rw [weightedExtremal, sourceTransform_inverse_natDegree,
    Polynomial.natDegree_pow, Polynomial.natDegree_X_add_C, mul_one]

theorem weightedExtremal_mem (beta : ℝ) (hbeta : 0 < beta) (n : ℕ) :
    WeightedClass beta hbeta n (weightedExtremal beta hbeta n) := by
  refine ⟨weightedExtremal_natDegree beta hbeta n, ?_⟩
  rw [weightedExtremal, LinearEquiv.apply_symm_apply]
  intro z hz
  have hz0 : (z + 1) ^ n = 0 := by simpa using hz
  have hz1 : z + 1 = 0 := eq_zero_of_pow_eq_zero hz0
  have hz' : z = -1 := by linear_combination hz1
  simp [hz']

theorem risingProduct_eq_ascPochhammer_eval (x : ℝ) (n : ℕ) :
    risingProduct x n = (ascPochhammer ℝ n).eval x := by
  induction n with
  | zero => simp [risingProduct]
  | succ n ih => rw [risingProduct_succ, ascPochhammer_succ_eval, ih]

/-- The polynomial attaining the unit-weight radius. -/
noncomputable def unitExtremal (n : ℕ) : ℝ[X] := weightedExtremal 1 (by norm_num) n

theorem unitExtremal_natDegree (n : ℕ) : (unitExtremal n).natDegree = n :=
  weightedExtremal_natDegree 1 (by norm_num) n

theorem unitExtremal_mem (n : ℕ) :
    WeightedClass 1 (by norm_num) n (unitExtremal n) :=
  weightedExtremal_mem 1 (by norm_num) n

/-- The sampled sequence is exactly the binomial sequence, at every index. -/
theorem unitExtremal_eval_nat (n k : ℕ) :
    (unitExtremal n).eval (k : ℝ) = ((k + n).choose n : ℝ) := by
  rw [unitExtremal, weightedExtremal_real_eval, risingProduct_one,
    risingProduct_eq_ascPochhammer_eval,
    show (k : ℝ) + 1 = ((k + 1 : ℕ) : ℝ) by norm_num,
    ascPochhammer_nat_eq_natCast_ascFactorial,
    Nat.ascFactorial_eq_factorial_mul_choose]
  have hfac : (n.factorial : ℝ) ≠ 0 := by exact_mod_cast n.factorial_ne_zero
  push_cast
  field_simp [hfac]

theorem unitExtremal_root_neg (n : ℕ) (hn : 0 < n) :
    ((unitExtremal n).map Complex.ofRealHom).eval (-(n : ℂ)) = 0 := by
  rw [unitExtremal, weightedExtremal_complex_eval]
  have hp : ascendingProduct (-(n : ℂ) + (1 : ℂ)) n = 0 := by
    unfold ascendingProduct
    apply Finset.prod_eq_zero (i := n - 1)
    · exact Finset.mem_range.mpr (Nat.sub_lt hn (by decide : 0 < (1 : ℕ)))
    · rw [Nat.cast_sub hn]
      push_cast
      ring
  rw [Complex.ofReal_one, hp, zero_div]

end VishnyakovaRootRadius
