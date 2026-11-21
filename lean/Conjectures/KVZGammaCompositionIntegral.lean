module

public import Mathlib.MeasureTheory.Integral.Pi
public import Mathlib.LinearAlgebra.Matrix.Determinant.Basic
public import Mathlib.Data.Fintype.Perm
public import Mathlib.Tactic.Ring

/-!
# The integral determinant identity

Finite determinant expansions and the product integral theorem give the exact
continuous Cauchy--Binet identity. Every integrability hypothesis concerns an
ordinary product of two scalar functions. No determinant identity is assumed.
-/

@[expose] public section

namespace KVZGamma

open MeasureTheory Matrix
open scoped BigOperators

noncomputable section

variable {n : ℕ} {E : Type*}

/-- Rows are functions and columns are evaluation nodes. -/
def functionDet (A : Fin n → E → ℝ) (t : Fin n → E) : ℝ :=
  Matrix.det (Matrix.of fun i j => A i (t j))

theorem functionDet_eq (A : Fin n → E → ℝ) (t : Fin n → E) :
    functionDet A t = Matrix.det (Matrix.of fun i j => A i (t j)) := by
  simp only [functionDet]

private theorem prod_mul_functionDet (A B : Fin n → E → ℝ) (t : Fin n → E) :
    (∏ i, A i (t i)) * functionDet B t =
      ∑ σ : Equiv.Perm (Fin n), ((Equiv.Perm.sign σ : ℤ) : ℝ) *
        ∏ i, A i (t i) * B (σ i) (t i) := by
  classical
  rw [functionDet, Matrix.det_apply', Finset.mul_sum]
  apply Finset.sum_congr rfl
  intro σ _
  simp only [Matrix.of_apply, Finset.prod_mul_distrib]
  ring

variable [MeasurableSpace E] (μ : Measure E) [SigmaFinite μ]

/-- A product of coordinate functions times an evaluation determinant is
integrable when every scalar pair product is integrable. -/
theorem integrable_prod_functionDet (A B : Fin n → E → ℝ)
    (h : ∀ i j, Integrable (fun u => A i u * B j u) μ) :
    Integrable (fun t => (∏ i, A i (t i)) * functionDet B t)
      (Measure.pi fun _ : Fin n => μ) := by
  classical
  simp_rw [prod_mul_functionDet]
  apply integrable_finsetSum
  intro σ _
  exact (Integrable.fintype_prod (fun i => h i (σ i))).const_mul _

/-- Integrating one determinant against a coordinate product gives the
matrix of scalar integrals. -/
theorem integral_prod_functionDet (A B : Fin n → E → ℝ)
    (h : ∀ i j, Integrable (fun u => A i u * B j u) μ) :
    (∫ t, (∏ i, A i (t i)) * functionDet B t ∂Measure.pi (fun _ : Fin n => μ)) =
      Matrix.det (Matrix.of fun i j => ∫ u, A i u * B j u ∂μ) := by
  classical
  simp_rw [prod_mul_functionDet]
  rw [integral_finsetSum]
  · have hprod (σ : Equiv.Perm (Fin n)) :
        (∫ t, ∏ i, A i (t i) * B (σ i) (t i)
          ∂Measure.pi (fun _ : Fin n => μ)) =
          ∏ i, ∫ u, A i u * B (σ i) u ∂μ :=
      integral_fintype_prod_eq_prod (fun i u => A i u * B (σ i) u)
    simp_rw [integral_const_mul, hprod]
    rw [← Matrix.det_transpose (Matrix.of fun i j => ∫ u, A i u * B j u ∂μ),
      Matrix.det_apply']
    rfl
  · intro σ _
    exact (Integrable.fintype_prod (fun i => h i (σ i))).const_mul _

omit [MeasurableSpace E] in
private theorem functionDet_mul_functionDet (A B : Fin n → E → ℝ) (t : Fin n → E) :
    functionDet A t * functionDet B t =
      ∑ σ : Equiv.Perm (Fin n), ((Equiv.Perm.sign σ : ℤ) : ℝ) *
        ((∏ i, A (σ i) (t i)) * functionDet B t) := by
  classical
  rw [functionDet_eq A, Matrix.det_apply', Finset.sum_mul]
  apply Finset.sum_congr rfl
  intro σ _
  simp only [Matrix.of_apply]
  ring

/-- The full determinant product is integrable under the same scalar
hypotheses. -/
theorem integrable_functionDet_mul (A B : Fin n → E → ℝ)
    (h : ∀ i j, Integrable (fun u => A i u * B j u) μ) :
    Integrable (fun t => functionDet A t * functionDet B t)
      (Measure.pi fun _ : Fin n => μ) := by
  classical
  simp_rw [functionDet_mul_functionDet]
  apply integrable_finsetSum
  intro σ _
  exact (integrable_prod_functionDet μ (fun i => A (σ i)) B
    (fun i j => h (σ i) j)).const_mul _

/-- The continuous Cauchy--Binet formula on the full product space. The
factorial counts all permutations of the integration coordinates. -/
theorem integral_functionDet_mul (A B : Fin n → E → ℝ)
    (h : ∀ i j, Integrable (fun u => A i u * B j u) μ) :
    (∫ t, functionDet A t * functionDet B t ∂Measure.pi (fun _ : Fin n => μ)) =
      (n.factorial : ℝ) * Matrix.det (Matrix.of fun i j => ∫ u, A i u * B j u ∂μ) := by
  classical
  simp_rw [functionDet_mul_functionDet]
  rw [integral_finsetSum]
  · simp_rw [integral_const_mul]
    have heach (σ : Equiv.Perm (Fin n)) :
        ((Equiv.Perm.sign σ : ℤ) : ℝ) *
            (∫ t, (∏ i, A (σ i) (t i)) * functionDet B t
              ∂Measure.pi (fun _ : Fin n => μ)) =
          Matrix.det (Matrix.of fun i j => ∫ u, A i u * B j u ∂μ) := by
      rw [integral_prod_functionDet μ (fun i => A (σ i)) B (fun i j => h (σ i) j)]
      have hp := Matrix.det_permute σ
        (Matrix.of fun i j => ∫ u, A i u * B j u ∂μ)
      change Matrix.det (Matrix.of fun i j => ∫ u, A (σ i) u * B j u ∂μ) = _ at hp
      rw [hp, ← mul_assoc, ← Int.cast_mul, Int.units_coe_mul_self, Int.cast_one, one_mul]
    simp only [heach, Finset.sum_const, Finset.card_univ, Fintype.card_perm,
      Fintype.card_fin, nsmul_eq_mul]
  · intro σ _
    exact (integrable_prod_functionDet μ (fun i => A (σ i)) B
      (fun i j => h (σ i) j)).const_mul _

end

end KVZGamma
