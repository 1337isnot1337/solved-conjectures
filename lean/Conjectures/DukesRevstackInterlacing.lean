import Conjectures.DukesRevstackDegree
import Conjectures.ChowStrictInterlacing
import Mathlib.Analysis.Real.Sqrt

/-! Strict domination of the remainder at every negative root transfers
to an interlacing step. The base at size three has an explicit factorization. -/

open Polynomial
open scoped BigOperators

namespace DukesRevstack

def OrderedNegativeRoots (p : ℝ[X]) (d : ℕ) : Prop :=
  ∃ a : Fin d → ℝ, StrictMono a ∧ (∀ i, a i < 0) ∧ p = ∏ i, (X - C (a i))

def RemainderDominated (n : ℕ) : Prop :=
  ∀ x : ℝ, x < 0 → (reducedRevstack (R := ℝ) n).eval x = 0 →
    |x * ((eulerian (R := ℝ) (leftSize n)).eval x * (eulerian (rightSize n + 1)).eval x)| <
      |x * (1 - x) * (reducedRevstack n).derivative.eval x|

theorem eval_reducedRevstack_succ_mul_derivative_neg {n : ℕ} (hn : 0 < n)
    (hDom : RemainderDominated n) {x : ℝ} (hx : x < 0)
    (hRoot : (reducedRevstack (R := ℝ) n).eval x = 0) :
    (reducedRevstack (R := ℝ) (n + 1)).eval x * (reducedRevstack n).derivative.eval x < 0 := by
  let d := (reducedRevstack (R := ℝ) n).derivative.eval x
  let t := x * (1 - x)
  let rem := x * ((eulerian (R := ℝ) (leftSize n)).eval x * (eulerian (rightSize n + 1)).eval x)
  have hT : t < 0 := mul_neg_of_neg_of_pos hx (by linarith)
  have hBound : |rem| < |t * d| := hDom x hx hRoot
  rw [eval_reducedRevstack_succ_at_root n hn x hRoot]
  change (t * d + rem) * d < 0
  rcases lt_trichotomy d 0 with hD | hD | hD
  · have hTD := mul_pos_of_neg_of_neg hT hD
    rw [abs_of_pos hTD] at hBound
    exact mul_neg_of_pos_of_neg (by linarith only [hBound, neg_abs_le rem]) hD
  · rw [hD, mul_zero, abs_zero] at hBound
    exact ((abs_nonneg rem).not_gt hBound).elim
  · have hTD := mul_neg_of_neg_of_pos hT hD
    rw [abs_of_neg hTD] at hBound
    exact mul_neg_of_neg_of_pos (by linarith only [hBound, le_abs_self rem]) hD

theorem reducedRevstack_interlace_step (n : ℕ) (hn : 3 ≤ n) (hDom : RemainderDominated n)
    (a : Fin (n - 1) → ℝ) (hMono : StrictMono a) (hNeg : ∀ i, a i < 0)
    (hProd : (reducedRevstack (R := ℝ) n) = ∏ i, (X - C (a i))) :
    ∃ b : Fin (n - 1 + 1) → ℝ, StrictMono b ∧ (∀ i, b i < 0) ∧
      (∀ i : Fin (n - 1), b i.castSucc < a i ∧ a i < b i.succ) ∧
      (reducedRevstack (R := ℝ) (n + 1)) = ∏ i, (X - C (b i)) := by
  let p := reducedRevstack (R := ℝ) n
  let q := reducedRevstack (R := ℝ) (n + 1)
  have hP := reducedRevstack_monic_degree (R := ℝ) n hn
  have hQ := reducedRevstack_monic_degree (R := ℝ) (n + 1) (by omega)
  have hqdeg : q.natDegree = (n - 1) + 1 := by
    change (reducedRevstack (R := ℝ) (n + 1)).natDegree = _
    rw [hQ.natDegree_eq]
    omega
  have hp : p = C p.leadingCoeff * ∏ i, (X - C (a i)) := by
    change (reducedRevstack (R := ℝ) n) =
      C (reducedRevstack (R := ℝ) n).leadingCoeff * ∏ i, (X - C (a i))
    rwa [hP.leadingCoeff_eq, map_one, one_mul]
  have hpPos : 0 < p.leadingCoeff := by change 0 < (reducedRevstack n : ℝ[X]).leadingCoeff; rw [hP.leadingCoeff_eq]; norm_num
  have hqPos : 0 < q.leadingCoeff := by change 0 < (reducedRevstack (n + 1) : ℝ[X]).leadingCoeff; rw [hQ.leadingCoeff_eq]; norm_num
  have hq0 : 0 < q.eval 0 := by simp [q]
  have hSign (i : Fin (n - 1)) : q.eval (a i) * p.derivative.eval (a i) < 0 := by
    have hRoot : p.eval (a i) = 0 := by
      change (reducedRevstack (R := ℝ) n).eval (a i) = 0
      rw [hProd, eval_prod]
      exact Finset.prod_eq_zero (Finset.mem_univ i) (by simp)
    exact eval_reducedRevstack_succ_mul_derivative_neg (by omega) hDom (hNeg i) hRoot
  obtain ⟨b, hMonoB, hNegB, hInter, hFactor⟩ :=
    Chow.strict_interlacing_extension (by omega) p q a hMono hNeg hp hpPos hqdeg hqPos hq0 hSign
  refine ⟨b, hMonoB, hNegB, hInter, ?_⟩
  simpa only [q, hQ.leadingCoeff_eq, map_one, one_mul] using hFactor

theorem reducedRevstack_three :
    (reducedRevstack (R := ℝ) 3 : ℝ[X]) = 1 + 3 * X + X ^ 2 := by
  norm_num [reducedRevstack, leftSize, rightSize, eulerian, eulerianOperator]
  rw [show C (2 : ℝ) = 2 from map_natCast (C : ℝ →+* ℝ[X]) 2]
  ring

theorem reducedRevstack_three_roots :
    OrderedNegativeRoots (reducedRevstack (R := ℝ) 3) 2 := by
  let s := Real.sqrt 5
  have hS : 0 < s := Real.sqrt_pos.2 (by norm_num)
  have hSq : s ^ 2 = 5 := Real.sq_sqrt (by norm_num)
  let a : Fin 2 → ℝ := fun i => if i = 0 then (-3 - s) / 2 else (-3 + s) / 2
  have h0 : a 0 = (-3 - s) / 2 := by simp [a]
  have h1 : a 1 = (-3 + s) / 2 := by norm_num [a]
  refine ⟨a, ?_, ?_, ?_⟩
  · apply Fin.strictMono_iff_lt_succ.mpr
    intro i
    fin_cases i
    change a 0 < a 1
    rw [h0, h1]
    linarith
  · intro i
    have hLess : s < 3 := by nlinarith [sq_nonneg (s - 3)]
    fin_cases i
    · change a 0 < 0
      rw [h0]
      linarith
    · change a 1 < 0
      rw [h1]
      linarith
  · rw [reducedRevstack_three, Fin.prod_univ_two, h0, h1]
    have hmul : ((-3 - s) / 2) * ((-3 + s) / 2) = (1 : ℝ) := by nlinarith
    have hadd : ((-3 - s) / 2) + ((-3 + s) / 2) = (-3 : ℝ) := by ring
    calc
      _ = X ^ 2 - C (((-3 - s) / 2) + ((-3 + s) / 2)) * X +
          C (((-3 - s) / 2) * ((-3 + s) / 2)) := by
        rw [hmul, hadd, map_neg, map_one, show C (3 : ℝ) = 3 from map_natCast (C : ℝ →+* ℝ[X]) 3]
        ring
      _ = _ := by rw [map_add, map_mul]; ring

end DukesRevstack
