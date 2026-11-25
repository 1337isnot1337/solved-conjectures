module

public import Mathlib.Algebra.Polynomial.Eval.Defs
public import Mathlib.Algebra.Polynomial.Degree.Lemmas
public import Mathlib.Basic.Complex.Basic
public import Mathlib.Tactic

public section
namespace HKMEhrhart
open Polynomial
open scoped Polynomial

/-- Subtract a fixed number of copies of an excluded counting family.
The algebra is stated for arbitrary bounds and polynomials, so neither
large counting polynomial is reduced by the verifier. -/
theorem assemble_counting_polynomial (U R : ℚ[X]) (C₀ C₁ C₂ : ℕ→ℕ)
    (c d : ℕ)
    (hU : ∀ m : ℕ, U.eval (m:ℚ) = (C₀ m:ℚ))
    (hR : ∀ m : ℕ, R.eval (m:ℚ) = (C₂ m:ℚ))
    (hcount : ∀ m, C₀ m = C₁ m + c*C₂ m)
    (hu : U.natDegree ≤ d) (hr : R.natDegree ≤ d) :
    ∃ E : ℚ[X], (∀ m : ℕ, E.eval (m:ℚ) = (C₁ m:ℚ)) ∧ E.natDegree ≤ d := by
  refine ⟨U - C (c:ℚ)*R,?_ ,?_⟩
  · intro m
    rw [eval_sub,eval_mul,eval_C,hU,hR,hcount,Nat.cast_add,Nat.cast_mul]
    exact add_sub_cancel_right _ _
  · refine (natDegree_sub_le _ _).trans (max_le hu ?_)
    refine natDegree_mul_le.trans ?_
    rw [natDegree_C,zero_add]
    exact hr

theorem counting_polynomial_complex (C : ℕ→ℕ) (d : ℕ)
    (h : ∃ E : ℚ[X], (∀ m : ℕ, E.eval (m:ℚ) = (C m:ℚ)) ∧ E.natDegree ≤ d) :
    ∃ E : ℂ[X], (∀ m : ℕ, E.eval (m:ℂ) = (C m:ℂ)) ∧ E.natDegree ≤ d := by
  obtain ⟨E,he,hd⟩ := h
  refine ⟨E.map (Rat.castHom ℂ),?_,natDegree_map_le.trans hd⟩
  intro m
  rw [eval_map]
  have hh : (Rat.castHom ℂ) (m:ℚ) = (m:ℂ) := map_natCast _ _
  rw [← hh,eval₂_at_apply,he,map_natCast]

end HKMEhrhart
