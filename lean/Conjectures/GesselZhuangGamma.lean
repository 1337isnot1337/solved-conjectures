module

public import Conjectures.GesselZhuangGammaRoots
public import Mathlib.Algebra.Polynomial.Div
public import Mathlib.Tactic.ComputeDegree
public import Mathlib.Tactic.LinearCombination

/-!
# Gessel–Zhuang's pinnacle-set gamma-positivity conjecture

The reciprocal-root pairing theorem used in Section 3 of the recorded
proof. This includes the zero polynomial and polynomials whose lowest
nonzero coefficient has positive index. Symmetry is taken at the stated
center, rather than silently substituted by the ordinary degree.
-/

@[expose] public section

noncomputable section

namespace GesselZhuang

open Polynomial

theorem gamma_reflect_one_add_X : (1 + X : ℝ[X]).reflect 1 = 1 + X := by
  simp [reflect_add, reflect_one, reflect_one_X, add_comm]

theorem gamma_reciprocal_pair_expression {r : ℝ} (hr : r ≠ 0) :
    (X - C r) * (X - C r⁻¹) =
      (1 + X : ℝ[X]) ^ 2 + C (-r - r⁻¹ - 2) * X := by
  have hC : C r * C r⁻¹ = (1 : ℝ[X]) := by
    rw [← C_mul, mul_inv_cancel₀ hr, C_1]
  simp only [map_sub, map_neg, map_ofNat]
  linear_combination hC

theorem gamma_reciprocal_pair_nonnegative {r : ℝ} (hr : r < 0) :
    0 ≤ -r - r⁻¹ - 2 := by
  have hri : r * r⁻¹ = 1 := mul_inv_cancel₀ hr.ne
  have hs : 0 ≤ (r + 1) ^ 2 := sq_nonneg _
  have hprod : r * (-r - r⁻¹ - 2) ≤ 0 := by nlinarith
  exact nonneg_of_mul_nonpos_right hprod hr

theorem gamma_reflect_reciprocal_pair {r : ℝ} (hr : r ≠ 0) :
    ((X - C r) * (X - C r⁻¹) : ℝ[X]).reflect 2 =
      (X - C r) * (X - C r⁻¹) := by
  rw [gamma_reciprocal_pair_expression hr]
  have hpow : ((1 + X : ℝ[X]) ^ 2).reflect 2 = (1 + X) ^ 2 := by
    rw [pow_two]
    change ((1 + X) * (1 + X) : ℝ[X]).reflect (1 + 1) = _
    rw [reflect_mul _ _ (by compute_degree) (by compute_degree),
      gamma_reflect_one_add_X]
  rw [reflect_add, hpow, reflect_C_mul]
  congr 2
  simpa only [revAt_le (by decide : 1 ≤ 2), Nat.reduceSub, pow_one] using
    (reflect_monomial (R := ℝ) 2 1)

theorem gamma_divX_symmetric {N : ℕ} {p : ℝ[X]}
    (hN : 2 ≤ N) (hs : p.reflect N = p) : p.divX.reflect (N - 2) = p.divX := by
  ext j
  by_cases hj : j ≤ N - 2
  · rw [coeff_reflect, revAt_le hj, coeff_divX, coeff_divX]
    have h := congrArg (fun q : ℝ[X] => q.coeff (j + 1)) hs
    rw [coeff_reflect, revAt_le (by omega)] at h
    simpa only [show N - 2 - j + 1 = N - (j + 1) by omega] using h
  · rw [coeff_reflect, revAt_eq_self_of_lt (by omega)]

/-- Every real-rooted nonnegative polynomial symmetric at the prescribed
center admits the literal nonnegative gamma expansion. -/
theorem gammaPositive_of_splits (N : ℕ) (p : ℝ[X]) (hs : p.Splits)
    (hc : ∀ n, 0 ≤ p.coeff n) (hd : p.natDegree ≤ N) (hsym : p.reflect N = p) :
    GammaPositive N p := by
  induction N using Nat.strong_induction_on generalizing p with
  | h N ih =>
    by_cases hp : p = 0
    · subst p
      exact gammaPositive_zero N
    by_cases hzero : p.coeff 0 = 0
    · have htop : p.coeff N = 0 := by
        have h := congrArg (fun q : ℝ[X] => q.coeff 0) hsym
        simpa only [coeff_reflect, revAt_zero, hzero] using h
      have hpdeg : p.natDegree < N := by
        apply lt_of_le_of_ne hd
        intro h
        apply (leadingCoeff_ne_zero.mpr hp)
        simpa only [leadingCoeff, ← h] using htop
      have hpos : 0 < p.natDegree := by
        apply Nat.pos_of_ne_zero
        intro h
        have hC := eq_C_of_natDegree_eq_zero h
        rw [hzero, C_0] at hC
        exact hp hC
      have hN : 2 ≤ N := by omega
      have hpq : X * p.divX = p := by
        simpa only [hzero, C_0, add_zero] using X_mul_divX_add p
      have hqs : p.divX.Splits := splits_X_mul.mp (by rw [hpq]; exact hs)
      have hqc : ∀ n, 0 ≤ p.divX.coeff n := fun n => by
        rw [coeff_divX]
        exact hc (n + 1)
      have hqd : p.divX.natDegree ≤ N - 2 := by
        rw [natDegree_divX_eq_natDegree_tsub_one]
        omega
      have hγ := ih (N - 2) (by omega) p.divX hqs hqc hqd
        (gamma_divX_symmetric hN hsym)
      have hresult := hγ.X_mul
      simpa only [Nat.sub_add_cancel hN, hpq] using hresult
    · have hdeg : p.natDegree = N := by
        apply le_antisymm hd
        apply le_natDegree_of_ne_zero
        have h := congrArg (fun q : ℝ[X] => q.coeff 0) hsym
        simp only [coeff_reflect, revAt_zero] at h
        rw [h]
        exact hzero
      by_cases hN : N = 0
      · rw [hN] at hdeg ⊢
        rw [eq_C_of_natDegree_eq_zero hdeg]
        exact gammaPositive_C (hc 0)
      have hdegree : p.degree ≠ 0 := by
        intro h
        have hnat : p.natDegree = 0 := natDegree_eq_of_degree_eq_some (n := 0) h
        exact hN (hdeg.symm.trans hnat)
      obtain ⟨r, hr⟩ := hs.exists_eval_eq_zero hdegree
      have hr0 : r ≠ 0 := by
        intro h
        subst r
        exact hzero ((coeff_zero_eq_eval_zero p).trans hr)
      have hrlt : r < 0 := lt_of_le_of_ne (gamma_root_nonpositive hp hc hr) hr0
      by_cases hrone : r = -1
      · have hdiv : (1 + X : ℝ[X]) ∣ p := by
          have h : X - C (-1 : ℝ) ∣ p := dvd_iff_isRoot.mpr (hrone ▸ hr)
          simpa only [C_neg, C_1, sub_neg_eq_add, add_comm] using h
        obtain ⟨q, rfl⟩ := hdiv
        obtain ⟨hAN, hqs, hqc, hqd, hqsy⟩ := gamma_right_factor_properties
          hp hs hc hd hsym (by simpa only [C_1, add_comm] using monic_X_add_C (1 : ℝ))
          (by simpa only [C_1, add_comm] using natDegree_X_add_C (1 : ℝ))
          gamma_reflect_one_add_X
        have hγ := ih (N - 1) (by omega) q hqs hqc hqd hqsy
        simpa only [Nat.sub_add_cancel hAN] using hγ.one_add_X_mul
      · have hri : p.eval r⁻¹ = 0 := gamma_reciprocal_root hd hsym hr0 hr
        have hdistinct : r⁻¹ ≠ r := by
          intro h
          have hsq : r ^ 2 = 1 := by
            simpa only [h, pow_two] using mul_inv_cancel₀ hr0
          rcases sq_eq_one_iff.mp hsq with h | h
          · linarith
          · exact hrone h
        obtain ⟨q₁, hq₁⟩ := dvd_iff_isRoot.mpr hr
        have hqroot : q₁.eval r⁻¹ = 0 := by
          rw [hq₁, eval_mul, eval_sub, eval_X, eval_C] at hri
          exact (mul_eq_zero.mp hri).resolve_left (sub_ne_zero.mpr hdistinct)
        obtain ⟨q, hq⟩ := dvd_iff_isRoot.mpr hqroot
        have hpq : p = ((X - C r) * (X - C r⁻¹)) * q := by
          rw [hq₁, hq, mul_assoc]
        rw [hpq] at hp hs hc hd hsym ⊢
        obtain ⟨hAN, hqs, hqc, hqd, hqsy⟩ := gamma_right_factor_properties
          hp hs hc hd hsym ((monic_X_sub_C r).mul (monic_X_sub_C r⁻¹))
          (by rw [natDegree_mul (monic_X_sub_C r).ne_zero (monic_X_sub_C r⁻¹).ne_zero,
            natDegree_X_sub_C, natDegree_X_sub_C]) (gamma_reflect_reciprocal_pair hr0)
        have hγ := ih (N - 2) (by omega) q hqs hqc hqd hqsy
        rw [gamma_reciprocal_pair_expression hr0]
        simpa only [Nat.sub_add_cancel hAN] using
          hγ.quadratic_mul (gamma_reciprocal_pair_nonnegative hrlt)

end GesselZhuang
