module

public import Conjectures.GesselZhuangGammaBasic
public import Mathlib.Algebra.Polynomial.Splits
public import Mathlib.Algebra.Polynomial.Eval.Degree
public import Mathlib.Tactic.Linarith

/-!
# Gessel–Zhuang's pinnacle-set gamma-positivity conjecture

Elementary real-root and coefficient facts for the reciprocal-pair proof.
In particular, positivity of a quotient is derived from its actual roots;
it is not assumed as an extra factorization hypothesis.
-/

@[expose] public section

noncomputable section

namespace GesselZhuang

open Polynomial Finset

theorem gamma_coeff_C_nonnegative {a : ℝ} (ha : 0 ≤ a) (n : ℕ) :
    0 ≤ (C a).coeff n := by
  rw [coeff_C]
  split_ifs <;> positivity

theorem gamma_coeff_mul_nonnegative {p q : ℝ[X]}
    (hp : ∀ n, 0 ≤ p.coeff n) (hq : ∀ n, 0 ≤ q.coeff n) (n : ℕ) :
    0 ≤ (p * q).coeff n := by
  rw [coeff_mul]
  exact sum_nonneg fun i _ => mul_nonneg (hp i.1) (hq i.2)

theorem gamma_coeff_X_sub_C_nonnegative {r : ℝ} (hr : r ≤ 0) (n : ℕ) :
    0 ≤ (X - C r).coeff n := by
  rw [coeff_sub, coeff_X, coeff_C]
  split_ifs <;> linarith

theorem gamma_eval_positive {p : ℝ[X]} (hp : p ≠ 0)
    (hc : ∀ n, 0 ≤ p.coeff n) {x : ℝ} (hx : 0 < x) : 0 < p.eval x := by
  rw [eval_eq_sum_range]
  apply sum_pos'
  · intro n _
    exact mul_nonneg (hc n) (pow_nonneg hx.le n)
  · refine ⟨p.natDegree, mem_range.mpr (Nat.lt_succ_self _), ?_⟩
    have hlc : 0 < p.leadingCoeff :=
      lt_of_le_of_ne (hc p.natDegree) (Ne.symm (leadingCoeff_ne_zero.mpr hp))
    exact mul_pos hlc (pow_pos hx _)

theorem gamma_root_nonpositive {p : ℝ[X]} (hp : p ≠ 0)
    (hc : ∀ n, 0 ≤ p.coeff n) {r : ℝ} (hr : p.eval r = 0) : r ≤ 0 := by
  by_contra hn
  have hpos := gamma_eval_positive hp hc (lt_of_not_ge hn)
  linarith

theorem gamma_coeff_nonnegative_of_roots {p : ℝ[X]} (hs : p.Splits)
    (hlc : 0 ≤ p.leadingCoeff) (hr : ∀ r ∈ p.roots, r ≤ 0) :
    ∀ n, 0 ≤ p.coeff n := by
  have hm (s : Multiset ℝ) (h : ∀ r ∈ s, r ≤ 0) :
      ∀ n, 0 ≤ ((s.map fun r => X - C r).prod : ℝ[X]).coeff n := by
    induction s using Multiset.induction_on with
    | empty =>
        intro n
        simpa only [Multiset.map_zero, Multiset.prod_zero, C_1] using
          gamma_coeff_C_nonnegative (by norm_num : (0 : ℝ) ≤ 1) n
    | @cons a s ih =>
        simp only [Multiset.map_cons, Multiset.prod_cons]
        exact gamma_coeff_mul_nonnegative
          (gamma_coeff_X_sub_C_nonnegative (h a (Multiset.mem_cons_self a s)))
          (ih (fun r hr => h r (Multiset.mem_cons_of_mem hr)))
  rw [hs.eq_prod_roots]
  exact gamma_coeff_mul_nonnegative (gamma_coeff_C_nonnegative hlc) (hm _ hr)

theorem gamma_coeff_nonnegative_right_factor {f q : ℝ[X]}
    (hs : (f * q).Splits) (hp : f * q ≠ 0) (hf : f.Monic)
    (hc : ∀ n, 0 ≤ (f * q).coeff n) : ∀ n, 0 ≤ q.coeff n := by
  have hq : q ≠ 0 := fun h => hp (by rw [h, mul_zero])
  have hsplit : q.Splits := hs.of_dvd hp ⟨f, mul_comm f q⟩
  apply gamma_coeff_nonnegative_of_roots hsplit
  · have h := hc (f * q).natDegree
    change 0 ≤ (f * q).leadingCoeff at h
    simpa only [leadingCoeff_mul, hf.leadingCoeff, one_mul] using h
  · intro r hr
    have hroot : (f * q).eval r = 0 := by
      rw [eval_mul, (mem_roots hq).mp hr, mul_zero]
    exact gamma_root_nonpositive hp hc hroot

theorem gamma_reciprocal_root {N : ℕ} {p : ℝ[X]}
    (hd : p.natDegree ≤ N) (hsym : p.reflect N = p)
    {r : ℝ} (hr : r ≠ 0) (hroot : p.eval r = 0) : p.eval r⁻¹ = 0 := by
  let : Invertible r := invertibleOfNonzero hr
  have h := eval₂_reflect_eq_zero_iff (RingHom.id ℝ) r N p hd
  rw [hsym] at h
  simpa only [eval₂_id, invOf_eq_inv] using h.mpr hroot

theorem gamma_reflect_right_factor {A B : ℕ} {f q : ℝ[X]}
    (hf : f ≠ 0) (hfd : f.natDegree ≤ A) (hqd : q.natDegree ≤ B)
    (hfs : f.reflect A = f) (hps : (f * q).reflect (A + B) = f * q) :
    q.reflect B = q := by
  rw [reflect_mul f q hfd hqd, hfs] at hps
  exact mul_left_cancel₀ hf hps

theorem gamma_right_factor_properties {N A : ℕ} {f q : ℝ[X]}
    (hp : f * q ≠ 0) (hs : (f * q).Splits)
    (hc : ∀ n, 0 ≤ (f * q).coeff n) (hd : (f * q).natDegree ≤ N)
    (hsym : (f * q).reflect N = f * q)
    (hf : f.Monic) (hfdeg : f.natDegree = A) (hfsym : f.reflect A = f) :
    A ≤ N ∧ q.Splits ∧ (∀ n, 0 ≤ q.coeff n) ∧
      q.natDegree ≤ N - A ∧ q.reflect (N - A) = q := by
  have hq : q ≠ 0 := fun h => hp (by rw [h, mul_zero])
  have hdeg : (f * q).natDegree = A + q.natDegree := by
    rw [natDegree_mul hf.ne_zero hq, hfdeg]
  have hAN : A ≤ N := by omega
  have hqd : q.natDegree ≤ N - A := by omega
  refine ⟨hAN, hs.of_dvd hp ⟨f, mul_comm f q⟩,
    gamma_coeff_nonnegative_right_factor hs hp hf hc, hqd, ?_⟩
  apply gamma_reflect_right_factor hf.ne_zero hfdeg.le hqd hfsym
  simpa only [Nat.add_sub_of_le hAN] using hsym

end GesselZhuang
