module

public import Conjectures.VishnyakovaTotalPositivityMinors
public import Conjectures.VishnyakovaTotalPositivityRatios
public import Mathlib.RingTheory.PowerSeries.Trunc
public import Mathlib.RingTheory.PowerSeries.Inverse
public import Mathlib.Algebra.Polynomial.Reverse
public import Mathlib.Algebra.Polynomial.Eval.Degree
public import Mathlib.Basic.Complex.Basic
public import Mathlib.Algebra.Polynomial.Degree.SmallDegree

/-!
# Positive poles of a rational Toeplitz-positive series

The proof is by induction on the degree of a displayed denominator. It only
asserts positivity for roots that are not canceled by the numerator, so no
choice of reduced fraction is required. A positive ratio limit supplies one
linear denominator factor, and the bordered-minor theorem permits its removal.
-/

@[expose] public section

namespace VishnyakovaTotalPositivity

open Polynomial Filter
open scoped BigOperators Topology PowerSeries

theorem mk_removePole (a : ℕ → ℝ) (γ : ℝ) :
    PowerSeries.mk (removePole a γ) =
      ((1 - Polynomial.C γ * Polynomial.X : ℝ[X]) : ℝ⟦X⟧) * PowerSeries.mk a := by
  ext n
  cases n with
  | zero => simp [removePole]
  | succ n =>
    simp only [Polynomial.coe_sub, Polynomial.coe_one, Polynomial.coe_mul, Polynomial.coe_C,
      Polynomial.coe_X, sub_mul, one_mul, mul_assoc, map_sub, PowerSeries.coeff_mk,
      PowerSeries.coeff_C_mul, PowerSeries.coeff_succ_X_mul, removePole]

theorem polynomial_mul_mk_coeff (Q : ℝ[X]) (a : ℕ → ℝ) (n : ℕ)
    (hdegree : Q.natDegree ≤ n) :
    PowerSeries.coeff n ((Q : ℝ⟦X⟧) * PowerSeries.mk a) =
      ∑ j : Fin (Q.natDegree + 1), Q.coeff j.val * a (n - j.val) := by
  rw [PowerSeries.coeff_mul, Finset.Nat.sum_antidiagonal_eq_sum_range_succ_mk]
  simp only [Polynomial.coeff_coe, PowerSeries.coeff_mk]
  rw [Fin.sum_univ_eq_sum_range (fun j => Q.coeff j * a (n - j))]
  symm
  apply Finset.sum_subset
  · exact Finset.range_mono (by omega)
  · intro j hj hj'
    have hjdeg : Q.natDegree < j := by
      simp only [Finset.mem_range] at hj hj'
      omega
    rw [Polynomial.coeff_eq_zero_of_natDegree_lt hjdeg, zero_mul]

theorem rational_forward_recurrence (a : ℕ → ℝ) (P Q : ℝ[X])
    (hfrac : (Q : ℝ⟦X⟧) * PowerSeries.mk a = (P : ℝ⟦X⟧)) :
    ∀ᶠ n in atTop,
      (∑ i : Fin (Q.natDegree + 1), Q.coeff (Q.natDegree - i.val) * a (n + i.val)) = 0 := by
  filter_upwards [eventually_ge_atTop (P.natDegree + 1)] with n hn
  have hc := congrArg (PowerSeries.coeff (n + Q.natDegree)) hfrac
  rw [polynomial_mul_mk_coeff Q a _ (by omega), Polynomial.coeff_coe,
    Polynomial.coeff_eq_zero_of_natDegree_lt (by omega)] at hc
  have heq := Equiv.sum_comp (Fin.revPerm (n := Q.natDegree + 1))
    (fun j : Fin (Q.natDegree + 1) => Q.coeff j.val * a (n + Q.natDegree - j.val))
  rw [← heq] at hc
  convert hc using 1
  apply Finset.sum_congr rfl
  intro i _
  simp only [Fin.revPerm_apply, Fin.val_rev]
  have hi := i.isLt
  congr 2 <;> omega

theorem denominator_root_of_characteristic (Q : ℝ[X]) {γ : ℝ} (hγ : 0 < γ)
    (hchar : (∑ i : Fin (Q.natDegree + 1), Q.coeff (Q.natDegree - i.val) * γ ^ i.val) = 0) :
    Q.eval γ⁻¹ = 0 := by
  have hrev : Q.reverse.eval γ = 0 := by
    rw [Polynomial.eval_eq_sum_range' (Nat.lt_succ_of_le Q.reverse_natDegree_le),
      ← Fin.sum_univ_eq_sum_range]
    convert hchar using 1
    apply Finset.sum_congr rfl
    intro i _
    rw [Polynomial.coeff_reverse, Polynomial.revAt_le (by omega : i.val ≤ Q.natDegree)]
  let : Invertible (γ⁻¹) := invertibleOfNonzero (inv_ne_zero hγ.ne')
  have h := Polynomial.eval₂_reverse_mul_pow (RingHom.id ℝ) γ⁻¹ Q
  simpa only [invOf_eq_inv, inv_inv, Polynomial.eval₂_id, hrev, zero_mul] using h.symm

theorem exists_polynomial_of_finite_support (a : ℕ → ℝ)
    (hfin : ∃ N, ∀ n, N ≤ n → a n = 0) :
    ∃ A : ℝ[X], (A : ℝ⟦X⟧) = PowerSeries.mk a := by
  obtain ⟨N, hN⟩ := hfin
  refine ⟨PowerSeries.trunc N (PowerSeries.mk a), ?_⟩
  ext n
  rw [Polynomial.coeff_coe, PowerSeries.coeff_trunc, PowerSeries.coeff_mk]
  split_ifs with hn
  · rfl
  · exact (hN n (by omega)).symm

private theorem positive_poles_aux (d : ℕ) :
    ∀ (a : ℕ → ℝ) (P Q : ℝ[X]), Q.natDegree = d → Q ≠ 0 → 0 < a 0 →
      ConsecutiveColumnMinorsNonneg a →
      (Q : ℝ⟦X⟧) * PowerSeries.mk a = (P : ℝ⟦X⟧) →
      ∀ z : ℂ, (Q.map Complex.ofRealHom).eval z = 0 →
        (P.map Complex.ofRealHom).eval z ≠ 0 → z.im = 0 ∧ 0 < z.re := by
  induction d using Nat.strong_induction_on with
  | h d ih =>
    intro a P Q hdegree hQ ha0 ha hfrac z hz hPz
    rcases ha.positive_or_finite_support ha0 with hpos | hfin
    · obtain ⟨γ, hγ, hratio, hchar⟩ := positive_ratio_limit_of_recurrence a hpos ha.logConcave
        Q.natDegree (fun i => Q.coeff (Q.natDegree - i.val))
        (by simpa only [Fin.val_zero, Nat.sub_zero, Polynomial.coeff_natDegree] using
          Polynomial.leadingCoeff_ne_zero.mpr hQ)
        (rational_forward_recurrence a P Q hfrac)
      have hroot : Q.eval γ⁻¹ = 0 := denominator_root_of_characteristic Q hγ hchar
      obtain ⟨R, hR⟩ := (Polynomial.dvd_iff_isRoot).mpr hroot
      let Q' : ℝ[X] := Polynomial.C (-γ⁻¹) * R
      let L : ℝ[X] := 1 - Polynomial.C γ * Polynomial.X
      have hL : L * Polynomial.C (-γ⁻¹) = Polynomial.X - Polynomial.C γ⁻¹ := by
        calc
          L * Polynomial.C (-γ⁻¹) =
              Polynomial.C γ * Polynomial.C γ⁻¹ * Polynomial.X - Polynomial.C γ⁻¹ := by
            simp only [L, Polynomial.C_neg]
            ring
          _ = Polynomial.X - Polynomial.C γ⁻¹ := by
            rw [← Polynomial.C_mul, mul_inv_cancel₀ hγ.ne', Polynomial.C_1, one_mul]
      have hfactor : Q = L * Q' := by
        dsimp only [Q']
        rw [← mul_assoc, hL]
        exact hR
      have hLzero : L ≠ 0 := by
        intro h
        have h0 := congrArg (fun p : ℝ[X] => p.coeff 0) h
        simp [L] at h0
      have hQ' : Q' ≠ 0 := by
        intro h
        apply hQ
        rw [hfactor, h, mul_zero]
      have hLdegree : L.natDegree = 1 := by
        have hlead : (-Polynomial.C γ * Polynomial.X + 1 : ℝ[X]).natDegree = 1 := by
          simpa only [Polynomial.C_neg, Polynomial.C_1, neg_mul] using
            (Polynomial.natDegree_linear (a := -γ) (b := 1) (neg_ne_zero.mpr hγ.ne'))
        have heq : L = -Polynomial.C γ * Polynomial.X + 1 := by dsimp [L]; ring
        rw [heq]
        exact hlead
      have hsmaller : Q'.natDegree < d := by
        rw [← hdegree, hfactor, Polynomial.natDegree_mul hLzero hQ', hLdegree]
        omega
      have hfrac' : (Q' : ℝ⟦X⟧) * PowerSeries.mk (removePole a γ) = (P : ℝ⟦X⟧) := by
        rw [mk_removePole]
        change (Q' : ℝ⟦X⟧) * ((L : ℝ⟦X⟧) * PowerSeries.mk a) = _
        rw [← mul_assoc, mul_comm (Q' : ℝ⟦X⟧), ← Polynomial.coe_mul, ← hfactor]
        exact hfrac
      have hzfactor : (L.map Complex.ofRealHom).eval z *
          (Q'.map Complex.ofRealHom).eval z = 0 := by
        rw [hfactor, Polynomial.map_mul, Polynomial.eval_mul] at hz
        exact hz
      rcases mul_eq_zero.mp hzfactor with hLz | hQ'z
      · have hmul : (γ : ℂ) * z = 1 := by
          have hlin : 1 - (γ : ℂ) * z = 0 := by
            simpa only [L, Polynomial.map_sub, Polynomial.map_one, Polynomial.map_mul,
            Polynomial.map_C, Polynomial.map_X, Polynomial.eval_sub, Polynomial.eval_one,
            Polynomial.eval_mul, Polynomial.eval_C, Polynomial.eval_X,
              Complex.ofRealHom_eq_coe] using hLz
          exact (sub_eq_zero.mp hlin).symm
        have hzreal : z = (γ⁻¹ : ℝ) := by
          apply mul_left_cancel₀ (Complex.ofReal_ne_zero.mpr hγ.ne')
          rw [hmul, ← Complex.ofReal_mul, mul_inv_cancel₀ hγ.ne', Complex.ofReal_one]
        rw [hzreal]
        simp only [Complex.ofReal_im, Complex.ofReal_re, true_and]
        exact inv_pos.mpr hγ
      · exact ih Q'.natDegree hsmaller (removePole a γ) P Q' rfl hQ' ha0
          (ha.removePole hpos hratio) hfrac' z hQ'z hPz
    · obtain ⟨A, hA⟩ := exists_polynomial_of_finite_support a hfin
      have hpoly : Q * A = P := by
        apply Polynomial.coe_injective ℝ
        rw [Polynomial.coe_mul, hA]
        exact hfrac
      apply False.elim
      apply hPz
      rw [← hpoly, Polynomial.map_mul, Polynomial.eval_mul, hz, zero_mul]

/-- Every uncanceled pole of a rational series with nonnegative consecutive
Toeplitz minors and positive constant coefficient is a positive real number. -/
theorem rational_positive_poles (a : ℕ → ℝ) (P Q : ℝ[X])
    (hQ : Q ≠ 0) (ha0 : 0 < a 0) (ha : ConsecutiveColumnMinorsNonneg a)
    (hfrac : (Q : ℝ⟦X⟧) * PowerSeries.mk a = (P : ℝ⟦X⟧))
    (z : ℂ) (hz : (Q.map Complex.ofRealHom).eval z = 0)
    (hPz : (P.map Complex.ofRealHom).eval z ≠ 0) : z.im = 0 ∧ 0 < z.re :=
  positive_poles_aux Q.natDegree a P Q rfl hQ ha0 ha hfrac z hz hPz

end VishnyakovaTotalPositivity
