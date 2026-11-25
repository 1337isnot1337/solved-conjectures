module

public import Mathlib.Analysis.Complex.Polynomial.Basic
public import Mathlib.Tactic

/-! An exact Laguerre-inequality certificate for the displayed length-17 row. -/

@[expose] public section

namespace AlexanderssonParkingExcedance

open Polynomial

/-- The Laguerre expression for a real polynomial at a real point. -/
noncomputable def laguerre (p : ℝ[X]) (x : ℝ) : ℝ :=
  (p.derivative.eval x) ^ 2 - p.eval x * p.derivative.derivative.eval x

private theorem laguerre_mul (p q : ℝ[X]) (x : ℝ) :
    laguerre (p * q) x = q.eval x ^ 2 * laguerre p x + p.eval x ^ 2 * laguerre q x := by
  simp only [laguerre, derivative_mul, derivative_add, eval_add, eval_mul]
  ring

private theorem laguerre_prod (m : Multiset ℝ) (x : ℝ) :
    0 ≤ laguerre (m.map (fun r => X - C r)).prod x := by
  induction m using Multiset.induction_on with
  | empty => simp [laguerre]
  | cons r m ih =>
    rw [Multiset.map_cons, Multiset.prod_cons, laguerre_mul]
    have hr : laguerre (X - C r) x = 1 := by simp [laguerre]
    rw [hr]
    positivity

theorem laguerre_nonneg_of_splits (p : ℝ[X]) (hp : p.Splits) (x : ℝ) :
    0 ≤ laguerre p x := by
  rw [hp.eq_prod_roots, laguerre_mul]
  have hC : laguerre (C p.leadingCoeff) x = 0 := by simp [laguerre]
  rw [hC, mul_zero, zero_add]
  have h := laguerre_prod p.roots x
  positivity

/-- A negative Laguerre expression certifies an actual nonreal root. -/
theorem nonreal_root_of_laguerre_neg (p : ℝ[X]) (x : ℝ) (h : laguerre p x < 0) :
    ∃ z : ℂ, (p.map Complex.ofRealHom).IsRoot z ∧ z.im ≠ 0 := by
  by_contra! hall
  have hs : p.Splits := by
    apply (IsAlgClosed.splits (p.map Complex.ofRealHom)).of_splits_map_of_injective Complex.ofReal_injective
    intro z hz
    refine ⟨z.re, Complex.ext rfl ?_⟩
    simpa using (hall z (isRoot_of_mem_roots hz)).symm
  exact (not_lt_of_ge (laguerre_nonneg_of_splits p hs x)) h

/-- The displayed length-17 row, in ascending degree order. -/
def row17 : List ℤ :=
  [355687428096000, 14275291188684965, 220079797544966499, 1742926757301248149,
    7868015556095346463, 21067674348334416341, 33787202856242622669,
    32220523133498449897, 17905034013658213079, 5600870095867413683,
    933784805146283433, 76123471388456123, 2635027764733129, 30185810407651,
    69315686247, 9227447, 1]

/-- Horner interpretation of a coefficient list ordered by increasing degree. -/
noncomputable def polynomialOfList : List ℤ → ℝ[X]
  | [] => 0
  | a :: as => C (a : ℝ) + X * polynomialOfList as

private def evaluationJet (x : ℚ) : List ℤ → ℚ × ℚ × ℚ
  | [] => (0, 0, 0)
  | a :: as =>
    let (p, dp, ddp) := evaluationJet x as
    (a + x * p, p + x * dp, 2 * dp + x * ddp)

private theorem evaluationJet_eq (x : ℚ) (as : List ℤ) :
    let jet := evaluationJet x as
    let p := polynomialOfList as
    p.eval (x : ℝ) = (jet.1 : ℝ) ∧ p.derivative.eval (x : ℝ) = (jet.2.1 : ℝ) ∧
      p.derivative.derivative.eval (x : ℝ) = (jet.2.2 : ℝ) := by
  induction as with
  | nil => simp [evaluationJet, polynomialOfList]
  | cons a as ih =>
    simp only [evaluationJet, polynomialOfList, derivative_add, derivative_C, derivative_mul,
      derivative_X, zero_add, one_mul, eval_add, eval_mul, eval_C, eval_X] at *
    rcases ih with ⟨hp, hd, hdd⟩
    simp only [hp, hd, hdd, Rat.cast_add, Rat.cast_mul, Rat.cast_intCast, Rat.cast_ofNat]
    simp only [true_and]; ring

theorem row17_laguerre_neg : laguerre (polynomialOfList row17) (-(1 : ℝ) / 5) < 0 := by
  let x : ℚ := -1 / 5
  have h := evaluationJet_eq x row17
  rw [show (-(1 : ℝ) / 5) = (x : ℝ) by norm_num [x]]
  unfold laguerre
  rw [h.1, h.2.1, h.2.2]
  have hn : (evaluationJet x row17).2.1 ^ 2 -
      (evaluationJet x row17).1 * (evaluationJet x row17).2.2 < 0 := by decide +kernel
  exact_mod_cast hn

theorem row17_nonreal_root :
    ∃ z : ℂ, ((polynomialOfList row17).map Complex.ofRealHom).IsRoot z ∧ z.im ≠ 0 :=
  nonreal_root_of_laguerre_neg _ _ row17_laguerre_neg

end AlexanderssonParkingExcedance
