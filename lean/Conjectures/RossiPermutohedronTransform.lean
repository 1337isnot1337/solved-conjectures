module

public import Mathlib.Topology.Algebra.Polynomial
public import Mathlib.Algebra.Polynomial.Reverse
public import Mathlib.Algebra.Polynomial.FieldDivision
public import Mathlib.Tactic

@[expose] public section
namespace RossiPermutohedron
open Polynomial

/-- Reciprocal of the polynomial obtained after translating and reflecting
the Eulerian variable. This is the transform in Rossi, Theorem 6.11. -/
noncomputable def reciprocalShift (p : ℝ[X]) : ℝ[X] :=
  (p.comp (1-X)).reverse

theorem reciprocalShift_eval_iff {p : ℝ[X]} {t : ℝ} (ht : t≠0) :
    (reciprocalShift p).IsRoot t ↔ p.IsRoot (1-t⁻¹) := by
  let _ := invertibleOfNonzero (inv_ne_zero ht)
  have H := eval₂_reverse_eq_zero_iff (RingHom.id ℝ) t⁻¹ (p.comp (1-X))
  rw [invOf_eq_inv, inv_inv] at H
  simpa [reciprocalShift,IsRoot,eval_comp] using H

theorem reciprocalShift_degree_le (p : ℝ[X]) :
    (reciprocalShift p).natDegree ≤ p.natDegree := by
  unfold reciprocalShift
  refine (reverse_natDegree_le _).trans ?_
  calc
    (p.comp (1-X)).natDegree ≤ p.natDegree * (1-X : ℝ[X]).natDegree := natDegree_comp_le
    _ ≤ p.natDegree * 1 := Nat.mul_le_mul_left _ <| (natDegree_sub_le _ _).trans (by simp)
    _ = p.natDegree := Nat.mul_one _

theorem shiftInversion_injective :
    Function.Injective (fun x : ℝ => (1-x)⁻¹) := by
  intro a b h
  have h' := inv_injective h
  linarith

theorem shiftInversion_sub_one (x : ℝ) : 1-((1-x)⁻¹)⁻¹=x := by
  simp

theorem shiftInversion_mem_small {x : ℝ} (hx : x<0) :
    (1-x)⁻¹ ∈ Set.Ioo (0:ℝ) 1 := by
  have h : 1 < 1-x := by linarith
  exact ⟨inv_pos.mpr (by linarith), inv_lt_one_of_one_lt₀ h⟩

theorem shiftInversion_large {x : ℝ} (hx : x∈Set.Ioo (0:ℝ) 1) : 1<(1-x)⁻¹ := by
  exact one_lt_inv₀ (sub_pos.mpr hx.2) |>.mpr (by linarith [hx.1])

end RossiPermutohedron
