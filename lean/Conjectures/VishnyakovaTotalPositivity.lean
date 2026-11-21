module

public import Conjectures.VishnyakovaTotalPositivityRational
public import Conjectures.VishnyakovaTotalPositivityReciprocal
public import Conjectures.VishnyakovaTotalPositivityTransform

/-!
# The sampled total-positivity class in the original conjecture

The necessity implication is proved from the infinite Toeplitz minors. Initial
zero samples are removed before taking the signed reciprocal. The resulting
rational identity retains their power of `X`, so the proof does not require a
positive constant sample or a reduced fraction.
-/

@[expose] public section

namespace VishnyakovaTotalPositivity

open Polynomial VishnyakovaRootRadius
open scoped BigOperators PowerSeries

theorem series_initial_shift (a : ℕ → ℝ) (m : ℕ)
    (hz : ∀ k, k < m → a k = 0) :
    PowerSeries.mk a = PowerSeries.X ^ m * PowerSeries.mk (fun n => a (n + m)) := by
  ext n
  rw [PowerSeries.coeff_mk, PowerSeries.coeff_X_pow_mul']
  split_ifs with hmn
  · rw [PowerSeries.coeff_mk, Nat.sub_add_cancel hmn]
  · exact hz n (by omega)

theorem rescale_neg_one_polynomial (P : ℝ[X]) :
    PowerSeries.rescale (-1 : ℝ) (P : ℝ⟦X⟧) =
      ((P.comp (-Polynomial.X) : ℝ[X]) : ℝ⟦X⟧) := by
  have hC (a : ℝ) : PowerSeries.rescale (-1 : ℝ) (PowerSeries.C a) = PowerSeries.C a := by
    ext n
    by_cases hn : n = 0 <;> simp [PowerSeries.coeff_C, hn]
  induction P using Polynomial.induction_on' with
  | add P Q hP hQ =>
    simp only [Polynomial.coe_add, map_add, Polynomial.add_comp, hP, hQ]
  | monomial n a =>
    rw [← Polynomial.C_mul_X_pow_eq_monomial]
    simp only [Polynomial.coe_mul, Polynomial.coe_C, Polynomial.coe_pow,
      Polynomial.coe_X, map_mul, map_pow, hC, PowerSeries.rescale_neg_one_X,
      Polynomial.mul_comp, Polynomial.C_comp, Polynomial.X_pow_comp, Polynomial.coe_neg]

/-- A polynomial numerator of a totally nonnegative sampled series has only
nonpositive real zeros when its sole possible geometric pole is at `1`. -/
theorem polynomial_numerator_roots_nonpositive (a : ℕ → ℝ) (S : ℝ[X]) (N : ℕ)
    (ha : (toeplitz a).IsTotallyNonneg) (hex : ∃ n, a n ≠ 0)
    (hS1 : S.eval 1 ≠ 0)
    (hfrac : (1 - PowerSeries.X : ℝ⟦X⟧) ^ (N + 1) * PowerSeries.mk a = (S : ℝ⟦X⟧))
    (z : ℂ) (hz : (S.map Complex.ofRealHom).eval z = 0) : z.im = 0 ∧ z.re ≤ 0 := by
  classical
  by_cases hz0 : z = 0
  · simp [hz0]
  let m := Nat.find hex
  have hm : a m ≠ 0 := Nat.find_spec hex
  have hzero : ∀ k, k < m → a k = 0 := by
    intro k hk
    by_contra hk0
    exact Nat.find_min hex hk hk0
  let a' : ℕ → ℝ := fun n => a (n + m)
  have ha' : (toeplitz a').IsTotallyNonneg := totallyNonneg_shift_of_initial_zeros ha m hzero
  have ha0 : 0 < a' 0 := by
    have hnonneg := (consecutiveColumnMinorsNonneg_of_totallyNonneg ha).nonneg m
    simpa [a'] using lt_of_le_of_ne hnonneg hm.symm
  let G : ℝ⟦X⟧ := (PowerSeries.mk (fun n => (-1 : ℝ) ^ n * a' n))⁻¹
  let b : ℕ → ℝ := fun n => PowerSeries.coeff n G
  have hG : PowerSeries.mk b = G := by
    ext n
    exact PowerSeries.coeff_mk n b
  have hinv : PowerSeries.mk (fun n => (-1 : ℝ) ^ n * a' n) * PowerSeries.mk b = 1 := by
    rw [hG]
    apply PowerSeries.mul_inv_cancel
    simpa using ha0.ne'
  have hb0 : 0 < b 0 := signed_reciprocal_constant_pos a' b ha0 hinv
  have hb : ConsecutiveColumnMinorsNonneg b :=
    signed_reciprocal_consecutiveMinors a' b ha' ha0 hinv
  let U : ℝ[X] := (-Polynomial.X) ^ m * (1 + Polynomial.X) ^ (N + 1)
  let V : ℝ[X] := S.comp (-Polynomial.X)
  have hshift : PowerSeries.mk a = PowerSeries.X ^ m * PowerSeries.mk a' :=
    series_initial_shift a m hzero
  have hsigned :
      ((1 + PowerSeries.X : ℝ⟦X⟧) ^ (N + 1) * (-PowerSeries.X) ^ m) *
        PowerSeries.mk (fun n => (-1 : ℝ) ^ n * a' n) = (V : ℝ⟦X⟧) := by
    have h := congrArg (PowerSeries.rescale (-1 : ℝ)) hfrac
    rw [map_mul, map_pow, map_sub, map_one, PowerSeries.rescale_neg_one_X,
      rescale_neg_one_polynomial, hshift, map_mul, map_pow,
      PowerSeries.rescale_neg_one_X, PowerSeries.rescale_mk] at h
    simpa only [sub_neg_eq_add, mul_assoc] using h
  have hreciprocal : (V : ℝ⟦X⟧) * PowerSeries.mk b = (U : ℝ⟦X⟧) := by
    rw [← hsigned, mul_assoc, hinv, mul_one]
    simp only [U, Polynomial.coe_mul, Polynomial.coe_pow, Polynomial.coe_neg,
      Polynomial.coe_X, Polynomial.coe_add, Polynomial.coe_one]
    ring
  have hV : V ≠ 0 := by
    intro h
    have h' := congrArg (fun P : ℝ[X] => P.comp (-Polynomial.X)) h
    rw [Polynomial.zero_comp] at h'
    change (S.comp (-Polynomial.X)).comp (-Polynomial.X) = 0 at h'
    rw [Polynomial.comp_neg_X_comp_neg_X] at h'
    apply hS1
    rw [h']
    simp
  have hz1 : z ≠ 1 := by
    intro h
    apply hS1
    rw [h, Polynomial.eval_map, Polynomial.eval₂_at_one] at hz
    exact Complex.ofReal_injective hz
  have hVz : (V.map Complex.ofRealHom).eval (-z) = 0 := by
    simpa only [V, Polynomial.eval_map, Polynomial.eval₂_comp, Polynomial.eval₂_neg,
      Polynomial.eval₂_X, neg_neg] using hz
  have hUz : (U.map Complex.ofRealHom).eval (-z) ≠ 0 := by
    have hden : 1 - z ≠ 0 := sub_ne_zero.mpr (Ne.symm hz1)
    simpa [U, sub_eq_add_neg] using
      mul_ne_zero (pow_ne_zero m hz0) (pow_ne_zero (N + 1) hden)
  have hr := rational_positive_poles b U V hV hb0 hb hreciprocal (-z) hVz hUz
  constructor
  · simpa using hr.1
  · have hneg : 0 < -z.re := by simpa using hr.2
    linarith

theorem exists_nat_eval_ne_zero (P : ℝ[X]) (hP : P ≠ 0) :
    ∃ n : ℕ, P.eval (n : ℝ) ≠ 0 := by
  by_contra h
  push Not at h
  apply hP
  apply Polynomial.eq_zero_of_natDegree_lt_card_of_eval_eq_zero P
    (f := fun i : Fin (P.natDegree + 1) => (i.val : ℝ))
  · intro i j hij
    exact Fin.ext (Nat.cast_injective hij)
  · intro i
    exact h i.val
  · simp

/-- The original infinite sampled total-nonnegativity hypothesis implies the
exact source-transform root condition, including when the initial samples vanish. -/
theorem sampled_totallyNonneg_rootsInUnitInterval (P : ℝ[X]) (hP : P ≠ 0)
    (hTN : Matrix.IsTotallyNonneg
      (fun i j : ℕ => if i ≤ j then P.eval ((j - i : ℕ) : ℝ) else 0)) :
    RootsInUnitInterval (sourceTransform 1 (by norm_num) P) := by
  let Q := sourceTransform 1 (by norm_num) P
  have hQ : Q ≠ 0 := by
    intro h
    apply hP
    exact (sourceTransform 1 (by norm_num)).injective (by simpa only [map_zero] using h)
  have hQdegree : Q.natDegree = P.natDegree := sourceTransform_natDegree 1 (by norm_num) P
  apply rootsInUnitInterval_of_numerator Q P.natDegree hQdegree.le
  have hS1 : (sourceNumerator P.natDegree Q).eval 1 ≠ 0 := by
    rw [sourceNumerator_eval_one, ← hQdegree, Polynomial.coeff_natDegree]
    exact Polynomial.leadingCoeff_ne_zero.mpr hQ
  intro z hz
  exact polynomial_numerator_roots_nonpositive (fun n => P.eval (n : ℝ))
    (sourceNumerator P.natDegree Q) P.natDegree hTN (exists_nat_eval_ne_zero P hP) hS1
    (source_numerator_series P P.natDegree le_rfl) z hz

end VishnyakovaTotalPositivity
