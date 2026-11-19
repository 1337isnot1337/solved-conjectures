import Conjectures.LonelinessNearestPlaneRelative
import Conjectures.LonelinessSubspaceDensity
import Mathlib.Analysis.InnerProductSpace.PiL2

/-! The value consequence of reverse nearest-plane rounding. The integer
family is arbitrary; no reduced-basis existence or determinant identity is
assumed by the rounding estimate. -/

namespace Loneliness.NearestPlane

open scoped BigOperators
open SubspaceDensity

noncomputable section

variable {ι : Type*} [Fintype ι] [Nonempty ι]

def euclideanVector (w : ι → ℤ) : EuclideanSpace ℝ ι :=
  WithLp.toLp 2 (integerVector w)

def coordinatePrefix (w : ℕ → ι → ℤ) (r : ℕ) : Submodule ℝ (ι → ℝ) :=
  Submodule.span ℝ ((fun i => integerVector (w i)) '' Set.Iio r)

def tailGramSum (w : ℕ → ι → ℤ) (r : ℕ) : ℝ :=
  ∑ i ∈ Finset.range r,
    ‖InnerProductSpace.gramSchmidt ℝ (fun j => euclideanVector (w j)) (i+1)‖ ^ 2

omit [Nonempty ι] in
theorem tailGramSum_nonneg [Nonempty ι] (w : ℕ → ι → ℤ) (r : ℕ) :
    0 ≤ tailGramSum w r := by
  exact Finset.sum_nonneg (fun _ _ => sq_nonneg _)

omit [Nonempty ι] in
theorem euclidean_mem_prefix [Nonempty ι] {w : ℕ → ι → ℤ} {r : ℕ} {x : ι → ℝ}
    (hx : x ∈ coordinatePrefix w r) :
    WithLp.toLp 2 x ∈ prefixSpan (fun i => euclideanVector (w i)) r := by
  let f : (ι → ℝ) →ₗ[ℝ] EuclideanSpace ℝ ι :=
    (WithLp.linearEquiv 2 ℝ (ι → ℝ)).symm.toLinearMap
  have h := Submodule.mem_map_of_mem (f := f) hx
  change f x ∈ (Submodule.span ℝ
    ((fun i => integerVector (w i)) '' Set.Iio r)).map f at h
  rw [Submodule.map_span, Set.image_image] at h
  simpa only [f, LinearEquiv.coe_coe, WithLp.coe_symm_linearEquiv,
    Function.comp_def, prefixSpan, euclideanVector] using h

/-- Every point of an integer prefix space is close, modulo an integer vector,
to the real line of its first vector. The error excludes the first GS length. -/
theorem coordinate_rounding_along_first (w : ℕ → ι → ℤ) (r : ℕ)
    {x : ι → ℝ} (hx : x ∈ coordinatePrefix w (r+1)) :
    ∃ a : ℝ, ∃ z : ι → ℤ, ∀ j,
      |x j - (z j : ℝ) - (a • integerVector (w 0)) j| ≤
        (1 / 2 : ℝ) * Real.sqrt (tailGramSum w r) := by
  classical
  obtain ⟨a, z, hz⟩ := exists_rounding_along_first_vector
    (fun i => euclideanVector (w i)) r (euclidean_mem_prefix hx)
  let error : EuclideanSpace ℝ ι := WithLp.toLp 2 x - a • euclideanVector (w 0) -
    ∑ i ∈ Finset.range r, (z i : ℝ) • euclideanVector (w (i+1))
  have he : ‖error‖ ^ 2 ≤ (1 / 4 : ℝ) * tailGramSum w r := hz
  have hnorm : ‖error‖ ≤ (1 / 2 : ℝ) * Real.sqrt (tailGramSum w r) := by
    apply (sq_le_sq₀ (norm_nonneg error) (by positivity)).mp
    have hs := Real.sq_sqrt (tailGramSum_nonneg w r)
    nlinarith
  let Z : ι → ℤ := fun j => ∑ i ∈ Finset.range r, z i * w (i+1) j
  refine ⟨a, Z, fun j => ?_⟩
  have hcoord : error j = x j - (Z j : ℝ) - (a • integerVector (w 0)) j := by
    simp only [error, euclideanVector, WithLp.ofLp_sub, WithLp.ofLp_smul,
      WithLp.ofLp_sum, Pi.sub_apply, Pi.smul_apply,
      Finset.sum_apply, integerVector, Z, Int.cast_sum, Int.cast_mul, smul_eq_mul]
    ring
  rw [← hcoord, ← Real.norm_eq_abs]
  exact (PiLp.norm_apply_le error j).trans hnorm

/-- The containing-space loneliness is at most the line loneliness plus the
Euclidean nearest-plane radius. This is an all-points bound on the torus. -/
theorem prefix_spaceValue_le (w : ℕ → ι → ℤ) (r : ℕ) :
    spaceValue (coordinatePrefix w (r+1)) ≤
      spaceValue (Submodule.span ℝ {integerVector (w 0)}) +
        (1 / 2 : ℝ) * Real.sqrt (tailGramSum w r) := by
  apply spaceValue_le
  intro x hx
  obtain ⟨a, z, hz⟩ := coordinate_rounding_along_first w r hx
  have hy : a • integerVector (w 0) ∈ Submodule.span ℝ {integerVector (w 0)} :=
    Submodule.smul_mem _ a (Submodule.mem_span_singleton_self _)
  exact (point_transfer z hz).trans (add_le_add (point_le_spaceValue hy) le_rfl)

/-- A lower bound for a containing torus and an upper bound for its speed line
give the squared prefix estimate used by the finite product certificates. -/
theorem tailGramSum_lower (w : ℕ → ι → ℤ) (r : ℕ) (lower threshold : ℝ)
    (hspace : lower ≤ spaceValue (coordinatePrefix w (r+1)))
    (hline : spaceValue (Submodule.span ℝ {integerVector (w 0)}) ≤ threshold)
    (hgap : threshold ≤ lower) :
    4 * (lower - threshold)^2 ≤ tailGramSum w r := by
  have hv := prefix_spaceValue_le w r
  have hle : 2 * (lower - threshold) ≤ Real.sqrt (tailGramSum w r) := by
    linarith
  have hs := Real.sq_sqrt (tailGramSum_nonneg w r)
  have hr := Real.sqrt_nonneg (tailGramSum w r)
  have hsq := mul_self_le_mul_self (by linarith : 0 ≤ 2 * (lower - threshold)) hle
  nlinarith

end

end Loneliness.NearestPlane
