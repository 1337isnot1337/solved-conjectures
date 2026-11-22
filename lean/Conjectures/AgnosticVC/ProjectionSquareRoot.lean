module

public import Conjectures.AgnosticVC.ProjectionOverlap
import Mathlib.Tactic

@[expose] public section

/-! The operator-norm version of the quadratic-form overlap estimate. -/

namespace AgnosticVC

open Finset
open scoped BigOperators InnerProductSpace

variable {E : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E] [FiniteDimensional ℝ E]

/-- A positive operator on a finite-dimensional real Hilbert space has a positive square root. -/
theorem exists_positive_operator_sqrt (T : E →L[ℝ] E) (hT : T.IsPositive) :
    ∃ R : E →L[ℝ] E, R.IsPositive ∧ R.comp R = T := by
  classical
  let e := hT.isSymmetric.eigenvectorBasis rfl
  let eigs := hT.isSymmetric.eigenvalues rfl
  let R : E →L[ℝ] E := ∑ i : Fin (Module.finrank ℝ E),
    Real.sqrt (eigs i) • InnerProductSpace.rankOne ℝ (e i) (e i)
  refine ⟨R, ContinuousLinearMap.isPositive_sum univ
    (fun i _ => (InnerProductSpace.isPositive_rankOne_self (e i)).smul_of_nonneg
      (Real.sqrt_nonneg _)), ?_⟩
  have hR (i : Fin (Module.finrank ℝ E)) :
      R (e i) = Real.sqrt (eigs i) • e i := by
    simp only [R, _root_.sum_apply, smul_apply, InnerProductSpace.rankOne_apply,
      orthonormal_iff_ite.mp e.orthonormal]
    rw [sum_eq_single i]
    · simp
    · intro j _ hji
      simp [hji]
    · simp
  apply ContinuousLinearMap.coe_inj.mp
  apply e.toBasis.ext
  intro i
  change R (R (e i)) = T (e i)
  rw [hR, map_smul, hR, smul_smul, ← sq, Real.sq_sqrt (hT.toLinearMap.nonneg_eigenvalues rfl i)]
  exact (hT.isSymmetric.apply_eigenvectorBasis rfl i).symm

omit [FiniteDimensional ℝ E] in
private theorem projection_sqrt_norm_sq {T R : E →L[ℝ] E} (hR : R.IsPositive)
    (h : R.comp R = T) (x : E) :
    ‖R x‖ ^ 2 = ⟪T x, x⟫_ℝ := by
  rw [← h, ContinuousLinearMap.comp_apply, hR.inner_left_eq_inner_right,
    real_inner_self_eq_norm_sq]

/-- Express the estimand in the range of the square root without any invertibility hypothesis. -/
private theorem projection_sqrt_range {T R : E →L[ℝ] E} (hR : R.IsPositive)
    (h : R.comp R = T) (v : E) :
    ∃ y, T y = R v ∧ ‖R y‖ ≤ ‖v‖ := by
  let w : E := R.range.starProjection v
  have hw : w ∈ R.range := Submodule.starProjection_apply_mem _ _
  obtain ⟨y, hy⟩ := hw
  change R y = w at hy
  have hzero : R (v - w) = 0 := by
    apply ext_inner_right ℝ
    intro z
    rw [hR.inner_left_eq_inner_right, inner_zero_left]
    exact R.range.starProjection_inner_eq_zero v (R z) ⟨z, rfl⟩
  have hRv : R w = R v := by
    rw [map_sub, sub_eq_zero] at hzero
    exact hzero.symm
  refine ⟨y, ?_, ?_⟩
  · rw [← h, ContinuousLinearMap.comp_apply, hy, hRv]
  · rw [hy]
    exact R.range.norm_starProjection_apply_le v

variable {I : Type*} [Fintype I] [DecidableEq I]
variable (S : Finset I → Submodule ℝ E) [∀ s, (S s).HasOrthogonalProjection]

/-- Operator-norm overlap for any positive square-root realizations of the two factors. -/
theorem averagedProjection_sqrt_overlap (hS : Monotone S) {m M k : ℕ}
    (hk : 0 < k) (hmM : k * m ≤ M) (hM : M ≤ Fintype.card I)
    {R Q : E →L[ℝ] E} (hR : R.IsPositive) (hQ : Q.IsPositive)
    (hR2 : R.comp R = averagedProjection S m)
    (hQ2 : Q.comp Q = 1 - averagedProjection S M) :
    ‖Q.comp R‖ ≤ Real.sqrt ((k : ℝ)⁻¹) := by
  apply ContinuousLinearMap.opNorm_le_bound _ (Real.sqrt_nonneg _)
  intro v
  obtain ⟨y, hy, hnorm⟩ := projection_sqrt_range hR hR2 v
  apply le_of_sq_le_sq _ (by positivity)
  rw [ContinuousLinearMap.comp_apply, projection_sqrt_norm_sq hQ hQ2,
    mul_pow, Real.sq_sqrt (by positivity)]
  have ho := averagedProjection_overlap S hS hk hmM hM y
  rw [← projection_sqrt_norm_sq hR hR2 y, hy] at ho
  exact ho.trans (mul_le_mul_of_nonneg_left (by gcongr) (by positivity))

/-- The two factors of the overlap estimate always admit the required positive square roots. -/
theorem averagedProjection_has_sqrt_overlap (hS : Monotone S) {m M k : ℕ}
    (hk : 0 < k) (hmM : k * m ≤ M) (hM : M ≤ Fintype.card I) :
    ∃ R Q : E →L[ℝ] E, R.IsPositive ∧ Q.IsPositive ∧
      R.comp R = averagedProjection S m ∧ Q.comp Q = 1 - averagedProjection S M ∧
      ‖Q.comp R‖ ≤ Real.sqrt ((k : ℝ)⁻¹) := by
  obtain ⟨R, hR, hR2⟩ := exists_positive_operator_sqrt _ (averagedProjection_isPositive S m)
  obtain ⟨Q, hQ, hQ2⟩ := exists_positive_operator_sqrt _
    (ContinuousLinearMap.le_def.mp (averagedProjection_le_one S M hM))
  exact ⟨R, Q, hR, hQ, hR2, hQ2, averagedProjection_sqrt_overlap S hS hk hmM hM hR hQ hR2 hQ2⟩

end AgnosticVC
