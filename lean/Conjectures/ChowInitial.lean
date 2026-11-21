module

public import Conjectures.ChowRowProperties
public import Mathlib.Analysis.Real.Sqrt
public import Mathlib.Algebra.Polynomial.Roots
public import Mathlib.Order.Fin.Basic
public import Mathlib.Tactic.Linarith

/-!
# The exact rank-two and rank-three starting polynomials
-/

@[expose] public section

namespace Chow

open Polynomial
open scoped BigOperators

noncomputable def rankThreeRoots (i : Fin 3) : ℝ :=
  if i.val = 0 then -5 - 2 * Real.sqrt 6
  else if i.val = 1 then -1 else -5 + 2 * Real.sqrt 6

theorem rankThreeRoots_strictMono : StrictMono rankThreeRoots := by
  have hs : (Real.sqrt 6) ^ 2 = 6 := Real.sq_sqrt (by norm_num)
  have hn := Real.sqrt_nonneg (6 : ℝ)
  apply Fin.strictMono_iff_lt_succ.mpr
  intro i
  fin_cases i <;> norm_num [rankThreeRoots] <;> nlinarith

theorem rankThreeRoots_neg (i : Fin 3) : rankThreeRoots i < 0 := by
  have hs : (Real.sqrt 6) ^ 2 = 6 := Real.sq_sqrt (by norm_num)
  have hn := Real.sqrt_nonneg (6 : ℝ)
  fin_cases i <;> norm_num [rankThreeRoots] <;> nlinarith

theorem totalRow_zero_explicit : totalRow 0 = 2 * (X + 1) ^ 2 := by
  norm_num [totalRow, refinedRow, baseRow2, Fin.sum_univ_succ, Polynomial.C_ofNat]
  ring

theorem totalRow_one_explicit : totalRow 1 = 2 * (X + 1) * (X ^ 2 + 10 * X + 1) := by
  norm_num [totalRow, refinedRow, nextRow, baseRow2, cutoff, Fin.sum_univ_succ,
    Polynomial.C_ofNat]
  ring

theorem rankThreeRoots_product :
    (∏ i : Fin 3, (X - C (rankThreeRoots i))) = (X + 1) * (X ^ 2 + 10 * X + 1) := by
  have hs : (Real.sqrt 6) ^ 2 = 6 := Real.sq_sqrt (by norm_num)
  have hC : (C (Real.sqrt 6) : ℝ[X]) ^ 2 = 6 := by
    rw [← map_pow, hs]
    norm_num [Polynomial.C_ofNat]
  norm_num [rankThreeRoots, Fin.prod_univ_succ, map_add, map_sub, map_mul,
    map_neg, Polynomial.C_ofNat]
  ring_nf
  rw [hC]
  ring

theorem totalRow_one_roots :
    totalRow 1 = C (totalRow 1).leadingCoeff * ∏ i : Fin 3, (X - C (rankThreeRoots i)) := by
  have hf : totalRow 1 = C 2 * ∏ i : Fin 3, (X - C (rankThreeRoots i)) := by
    rw [rankThreeRoots_product, totalRow_one_explicit]
    norm_num [Polynomial.C_ofNat]
    ring
  have hl : (totalRow 1).leadingCoeff = 2 := by
    rw [hf]
    exact (monic_prod_X_sub_C rankThreeRoots Finset.univ).leadingCoeff_C_mul 2
  rw [hl]
  exact hf

theorem totalRow_zero_roots :
    totalRow 0 = C (totalRow 0).leadingCoeff * ∏ _i : Fin 2, (X - C (-1 : ℝ)) := by
  have hf : totalRow 0 = C 2 * ∏ _i : Fin 2, (X - C (-1 : ℝ)) := by
    rw [totalRow_zero_explicit]
    norm_num [Fin.prod_univ_succ, Polynomial.C_ofNat]
  have hl : (totalRow 0).leadingCoeff = 2 := by
    rw [hf]
    exact (monic_prod_X_sub_C (fun _i : Fin 2 => (-1 : ℝ)) Finset.univ).leadingCoeff_C_mul 2
  rw [hl]
  exact hf

theorem initial_weak_interlacing (i : Fin 2) :
    rankThreeRoots i.castSucc ≤ -1 ∧ -1 ≤ rankThreeRoots i.succ := by
  have hs : (Real.sqrt 6) ^ 2 = 6 := Real.sq_sqrt (by norm_num)
  have hn := Real.sqrt_nonneg (6 : ℝ)
  fin_cases i <;> norm_num [rankThreeRoots] <;> nlinarith

end Chow
