import Conjectures.LonelinessHyperplaneArithmetic
import Mathlib.LinearAlgebra.Unimodular
import Mathlib.LinearAlgebra.FreeModule.PID
import Mathlib.LinearAlgebra.Dimension.Free

/-! Completion of a primitive integer speed vector to an actual integer basis.
The generic extension uses a linear functional taking the value one, a basis
of its kernel over the PID ℤ, and a direct basis-cons construction. -/

namespace Loneliness.PrimitiveBasis

open scoped BigOperators

noncomputable section

variable {M : Type*} [AddCommGroup M]

/-- Any unimodular vector in a finite free integer module can be the first
vector of a basis with the same finite index type. -/
theorem unimodular_basis_extension {n : ℕ}
    (b : Module.Basis (Fin (n+1)) ℤ M) (v : M)
    (hv : Module.IsUnimodular ℤ v) :
    ∃ B : Module.Basis (Fin (n+1)) ℤ M, B 0 = v := by
  classical
  obtain ⟨f, hf⟩ := hv
  obtain ⟨r, bk⟩ := Submodule.basisOfPid b f.ker
  have hind : ∀ c : ℤ, ∀ x ∈ f.ker, c • v + x = 0 → c = 0 := by
    intro c x hx h
    have hx' : f x = 0 := hx
    simpa [map_add, map_smul, hf, hx', smul_eq_mul] using congrArg f h
  have hspan : ∀ x : M, ∃ c : ℤ, x + c • v ∈ f.ker := by
    intro x
    refine ⟨-f x, ?_⟩
    change f (x + (-f x) • v) = 0
    simp [hf, smul_eq_mul]
  let B := Module.Basis.mkFinCons v bk hind hspan
  have hr : r+1 = n+1 := by
    calc
      r+1 = Module.finrank ℤ M := by
        simpa using (Module.finrank_eq_card_basis B).symm
      _ = n+1 := by simpa using Module.finrank_eq_card_basis b
  have hr' : r = n := by omega
  subst r
  refine ⟨B, ?_⟩
  simp [B, Module.Basis.coe_mkFinCons]

variable {ι : Type*} [Fintype ι]

/-- An integer coefficient vector defines an integer linear functional. -/
def coefficientFunctional (e : ι → ℤ) : (ι → ℤ) →ₗ[ℤ] ℤ where
  toFun x := ∑ i, e i * x i
  map_add' x y := by simp [mul_add, Finset.sum_add_distrib]
  map_smul' c x := by
    simp [smul_eq_mul, Finset.mul_sum, mul_assoc, mul_left_comm]

/-- Literal coordinate gcd one supplies the functional needed for completion. -/
theorem primitive_isUnimodular (v : ι → ℤ) (hv : Hyperplane.PrimitiveNormal v) :
    Module.IsUnimodular ℤ v := by
  obtain ⟨e, he⟩ := Hyperplane.primitive_bezout v hv
  refine ⟨coefficientFunctional e, ?_⟩
  simpa [coefficientFunctional, mul_comm] using he

/-- A primitive integer vector can be extended to a full integer basis. -/
theorem primitive_basis_extension {n : ℕ} (v : Fin (n+1) → ℤ)
    (hv : Hyperplane.PrimitiveNormal v) :
    ∃ B : Module.Basis (Fin (n+1)) ℤ (Fin (n+1) → ℤ), B 0 = v := by
  exact unimodular_basis_extension (Pi.basisFun ℤ (Fin (n+1))) v
    (primitive_isUnimodular v hv)

end

end Loneliness.PrimitiveBasis
