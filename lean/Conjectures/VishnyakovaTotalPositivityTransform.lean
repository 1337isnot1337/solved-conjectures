module

public import Conjectures.VishnyakovaTransform
public import Mathlib.RingTheory.PowerSeries.WellKnown

/-!
# The exact sampled-series numerator for the source transform

This file realizes the rational generating identity in Section 1 of the
original paper and the associated Möbius change of root coordinates. The
transform and its degree are the existing source definitions.
-/

@[expose] public section

namespace VishnyakovaTotalPositivity

open Polynomial VishnyakovaRootRadius
open scoped BigOperators PowerSeries

/-- Formal generating series of the values of a real polynomial on `ℕ`. -/
noncomputable def sampleSeries : ℝ[X] →ₗ[ℝ] ℝ⟦X⟧ where
  toFun P := PowerSeries.mk (fun n => P.eval (n : ℝ))
  map_add' P Q := by ext n; simp
  map_smul' c P := by ext n; simp

@[simp] theorem sampleSeries_coeff (P : ℝ[X]) (n : ℕ) :
    PowerSeries.coeff n (sampleSeries P) = P.eval (n : ℝ) := by
  exact PowerSeries.coeff_mk n (fun n => P.eval (n : ℝ))

theorem normalizedFalling_one_eval_nat (k n : ℕ) :
    (normalizedFalling 1 k).eval (n : ℝ) = (n.choose k : ℝ) := by
  rw [Nat.cast_choose_eq_descPochhammer_div]
  simp only [normalizedFalling, risingProduct_one, Polynomial.eval_mul, Polynomial.eval_C,
    div_eq_mul_inv]
  ring

theorem chooseSeries_shift (k : ℕ) :
    (PowerSeries.mk (fun n => (n.choose k : ℝ))) =
      PowerSeries.X ^ k * PowerSeries.mk (fun n => ((k + n).choose k : ℝ)) := by
  ext n
  rw [PowerSeries.coeff_mk, PowerSeries.coeff_X_pow_mul']
  split_ifs with hkn
  · rw [PowerSeries.coeff_mk]
    congr 2
    omega
  · rw [Nat.choose_eq_zero_of_lt (by omega), Nat.cast_zero]

theorem sampleSeries_normalizedFalling (k : ℕ) :
    (1 - PowerSeries.X : ℝ⟦X⟧) ^ (k + 1) * sampleSeries (normalizedFalling 1 k) =
      PowerSeries.X ^ k := by
  have hsample : sampleSeries (normalizedFalling 1 k) =
      PowerSeries.mk (fun n => (n.choose k : ℝ)) := by
    ext n
    simp [normalizedFalling_one_eval_nat]
  rw [hsample, chooseSeries_shift]
  calc
    (1 - PowerSeries.X : ℝ⟦X⟧) ^ (k + 1) *
        (PowerSeries.X ^ k * PowerSeries.mk (fun n => ((k + n).choose k : ℝ))) =
      PowerSeries.X ^ k *
        (PowerSeries.mk (fun n => ((k + n).choose k : ℝ)) * (1 - PowerSeries.X) ^ (k + 1)) := by ring
    _ = PowerSeries.X ^ k := by
      rw [PowerSeries.mk_add_choose_mul_one_sub_pow_eq_one, mul_one]

theorem sampleSeries_normalizedFalling_bound (N k : ℕ) (hk : k ≤ N) :
    (1 - PowerSeries.X : ℝ⟦X⟧) ^ (N + 1) * sampleSeries (normalizedFalling 1 k) =
      PowerSeries.X ^ k * (1 - PowerSeries.X) ^ (N - k) := by
  have hN : N + 1 = (N - k) + (k + 1) := by omega
  rw [hN, pow_add, mul_assoc, sampleSeries_normalizedFalling]
  ring

/-- The polynomial numerator after clearing the degree-`N+1` geometric pole. -/
noncomputable def sourceNumerator (N : ℕ) (Q : ℝ[X]) : ℝ[X] :=
  ∑ k ∈ Finset.range (N + 1), Polynomial.C (Q.coeff k) * Polynomial.X ^ k *
    (1 - Polynomial.X) ^ (N - k)

theorem source_falling_expansion (P : ℝ[X]) (N : ℕ) (hN : P.natDegree ≤ N) :
    P = ∑ k ∈ Finset.range (N + 1),
      (sourceTransform 1 (by norm_num) P).coeff k • normalizedFalling 1 k := by
  apply (sourceTransform 1 (by norm_num)).injective
  simp only [map_sum, map_smul, sourceTransform_normalizedFalling]
  simp only [Polynomial.smul_eq_C_mul]
  apply Polynomial.as_sum_range_C_mul_X_pow'
  rw [sourceTransform_natDegree]
  omega

theorem source_numerator_series (P : ℝ[X]) (N : ℕ) (hN : P.natDegree ≤ N) :
    (1 - PowerSeries.X : ℝ⟦X⟧) ^ (N + 1) * sampleSeries P =
      (sourceNumerator N (sourceTransform 1 (by norm_num) P) : ℝ⟦X⟧) := by
  let Q := sourceTransform 1 (by norm_num) P
  have hP := source_falling_expansion P N hN
  nth_rw 1 [hP]
  rw [map_sum, Finset.mul_sum]
  change _ = Polynomial.coeToPowerSeries.ringHom
    (∑ k ∈ Finset.range (N + 1), Polynomial.C (Q.coeff k) * Polynomial.X ^ k *
      (1 - Polynomial.X) ^ (N - k))
  rw [map_sum]
  apply Finset.sum_congr rfl
  intro k hk
  rw [map_smul, mul_smul_comm, sampleSeries_normalizedFalling_bound N k (by
    simp only [Finset.mem_range] at hk
    omega)]
  simp only [map_mul, map_pow, map_sub, Polynomial.coeToPowerSeries.ringHom_apply,
    Polynomial.coe_C, Polynomial.coe_X, map_one, PowerSeries.smul_eq_C_mul]
  ring

theorem sourceNumerator_eval_one (Q : ℝ[X]) (N : ℕ) :
    (sourceNumerator N Q).eval 1 = Q.coeff N := by
  simp only [sourceNumerator, Polynomial.eval_finsetSum, Polynomial.eval_mul,
    Polynomial.eval_C, Polynomial.eval_pow, Polynomial.eval_X, Polynomial.eval_sub,
    Polynomial.eval_one, sub_self, one_pow, mul_one]
  rw [Finset.sum_eq_single N]
  · simp
  · intro k hk hkN
    have hkn : k < N := by simp only [Finset.mem_range] at hk; omega
    rw [zero_pow (by omega : N - k ≠ 0), mul_zero]
  · intro h
    exact False.elim (h (Finset.mem_range.mpr (by omega)))

theorem sourceNumerator_eval_mobius (Q : ℝ[X]) (N : ℕ) (hN : Q.natDegree ≤ N)
    (z : ℂ) (hz : z ≠ 1) :
    ((sourceNumerator N Q).map Complex.ofRealHom).eval z =
      (1 - z) ^ N * (Q.map Complex.ofRealHom).eval (z / (1 - z)) := by
  have hden : 1 - z ≠ 0 := sub_ne_zero.mpr (Ne.symm hz)
  rw [Polynomial.eval_map, Polynomial.eval_map,
    Polynomial.eval₂_eq_sum_range' Complex.ofRealHom (by omega : Q.natDegree < N + 1)]
  simp only [sourceNumerator, Polynomial.eval₂_finsetSum, Polynomial.eval₂_mul,
    Polynomial.eval₂_C, Polynomial.eval₂_pow, Polynomial.eval₂_X, Polynomial.eval₂_sub,
    Polynomial.eval₂_one, Finset.mul_sum]
  apply Finset.sum_congr rfl
  intro k hk
  have hkn : k ≤ N := by simp only [Finset.mem_range] at hk; omega
  have hpow : (1 - z) ^ N = (1 - z) ^ k * (1 - z) ^ (N - k) := by
    rw [← pow_add, Nat.add_sub_of_le hkn]
  rw [hpow, div_pow]
  field_simp

/-- Nonpositive numerator roots are exactly the required interval roots after
the source's Möbius substitution. -/
theorem rootsInUnitInterval_of_numerator (Q : ℝ[X]) (N : ℕ) (hN : Q.natDegree ≤ N)
    (hroots : ∀ z : ℂ, ((sourceNumerator N Q).map Complex.ofRealHom).eval z = 0 →
      z.im = 0 ∧ z.re ≤ 0) : RootsInUnitInterval Q := by
  intro w hw
  by_cases hwneg : w = -1
  · simp [hwneg]
  · have hp : 1 + w ≠ 0 := by
      intro h
      apply hwneg
      linear_combination h
    let z : ℂ := w / (1 + w)
    have hz : z ≠ 1 := by
      intro h
      have hh := (div_eq_iff hp).mp h
      change w = 1 * (1 + w) at hh
      have : (1 : ℂ) = 0 := by linear_combination -hh
      exact one_ne_zero this
    have hback : z / (1 - z) = w := by
      dsimp [z]
      field_simp
      ring
    have hzero : ((sourceNumerator N Q).map Complex.ofRealHom).eval z = 0 := by
      rw [sourceNumerator_eval_mobius Q N hN z hz, hback, hw, mul_zero]
    obtain ⟨hzim, hzre⟩ := hroots z hzero
    have hzreal : z = (z.re : ℂ) := by apply Complex.ext <;> simp [hzim]
    have hwreal : w = ((z.re / (1 - z.re) : ℝ) : ℂ) := by
      rw [← hback, hzreal]
      push_cast
      rfl
    rw [hwreal]
    simp only [Complex.ofReal_im, Complex.ofReal_re, true_and]
    have hpos : 0 < 1 - z.re := by linarith
    constructor
    · apply (le_div_iff₀ hpos).mpr
      linarith
    · exact div_nonpos_of_nonpos_of_nonneg hzre hpos.le

end VishnyakovaTotalPositivity
