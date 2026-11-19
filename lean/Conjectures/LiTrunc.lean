import Mathlib.Algebra.Polynomial.Eval.Defs
import Mathlib.Algebra.Polynomial.AlgebraMap
import Mathlib.Algebra.TrivSqZeroExt.Basic
import Mathlib.Algebra.MvPolynomial.Eval

/-!
# The `t^2 = 0` truncation bridge

This file relates the coefficient of `t` in a polynomial over `ℚ` to the
`ε`-component of its image in the dual numbers `ℚ[ε]/(ε^2)`, and shows that
this truncation commutes with polynomial evaluation.  It is the bridge
between the exact `ℚ[t]` specialization and the finite dual-number
computation.
-/

open Polynomial MvPolynomial
open scoped BigOperators

namespace LiTrunc

abbrev TZ := TrivSqZeroExt ℚ ℚ

instance : DecidableEq TZ := inferInstanceAs (DecidableEq (ℚ × ℚ))

/-- The algebra map `ℚ[t] → ℚ[ε]/(ε²)` sending `t` to `ε`. -/
def truncAlg : Polynomial ℚ →ₐ[ℚ] TZ :=
  Polynomial.eval₂AlgHom (Algebra.ofId ℚ TZ) (TrivSqZeroExt.inr (1 : ℚ))
    (fun _ => Commute.all _ _)

@[simp] lemma truncAlg_C (r : ℚ) : truncAlg (Polynomial.C r) = TrivSqZeroExt.inl r := by
  simp [truncAlg, TrivSqZeroExt.algebraMap_eq_inl]

@[simp] lemma truncAlg_X : truncAlg (Polynomial.X : Polynomial ℚ) = TrivSqZeroExt.inr (1 : ℚ) := by
  simp [truncAlg]

/-- The square of the nilpotent `ε` vanishes. -/
lemma inr_one_sq : ((TrivSqZeroExt.inr (1 : ℚ) : TZ) * TrivSqZeroExt.inr (1 : ℚ)) = 0 := by
  rw [TrivSqZeroExt.inr_mul_inr]

lemma inr_one_pow_add_two (n : ℕ) :
    ((TrivSqZeroExt.inr (1 : ℚ) : TZ) ^ (n + 2)) = 0 := by
  induction n with
  | zero => simp [pow_two]
  | succ n ih =>
      rw [show n + 1 + 2 = (n + 2) + 1 by omega, pow_succ, ih, zero_mul]

/-- The `ε`-component of the truncation is the coefficient of `t`. -/
theorem snd_truncAlg (p : Polynomial ℚ) :
    (truncAlg p).snd = p.coeff 1 := by
  induction p using Polynomial.induction_on' with
  | add p q hp hq =>
      rw [map_add, TrivSqZeroExt.snd_add, hp, hq, Polynomial.coeff_add]
  | monomial n a =>
      rw [truncAlg, Polynomial.eval₂AlgHom_apply, Polynomial.eval₂_monomial,
        Polynomial.coeff_monomial]
      cases n with
      | zero =>
          simp [TrivSqZeroExt.algebraMap_eq_inl]
      | succ n =>
          cases n with
          | zero =>
              simp [TrivSqZeroExt.algebraMap_eq_inl, TrivSqZeroExt.snd_mul]
          | succ n =>
              rw [inr_one_pow_add_two, mul_zero]
              simp

/-- Truncation commutes with multivariate polynomial evaluation. -/
theorem truncAlg_aeval (w : Fin 3 → Polynomial ℚ) (g : MvPolynomial (Fin 3) ℚ) :
    truncAlg (MvPolynomial.aeval w g) =
      MvPolynomial.aeval (fun i => truncAlg (w i)) g := by
  have h : (truncAlg.comp (MvPolynomial.aeval w) : MvPolynomial (Fin 3) ℚ →ₐ[ℚ] TZ)
      = MvPolynomial.aeval (fun i => truncAlg (w i)) := by
    rw [MvPolynomial.aeval_unique (truncAlg.comp (MvPolynomial.aeval w))]
    congr 1
    funext i
    show truncAlg (MvPolynomial.aeval w (MvPolynomial.X i)) = truncAlg (w i)
    rw [MvPolynomial.aeval_X]
  exact DFunLike.congr_fun h g

end LiTrunc
