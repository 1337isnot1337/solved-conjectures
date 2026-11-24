import Conjectures.MaTangRandomSubsetSumsCore

/-!
# Ma–Tang's random subset-sum threshold conjecture

Draft bridge from the actual kernel of a binary linear map to the finite
column-type obstruction. No randomness or dimension distribution is asserted.
-/

open scoped BigOperators

namespace MaTangRandomSubsetSums

section Kernel

variable {ι κ : Type*} [Fintype ι] [AddCommGroup κ] [Module (ZMod 2) κ]
variable {A : (ι → ZMod 2) →ₗ[ZMod 2] κ} {r : ℕ}

/-- Column of the generator matrix for a basis of the actual kernel. -/
noncomputable def kernelColumn
    (B : Module.Basis (Fin r) (ZMod 2) A.ker) (i : ι) (j : Fin r) :
    ZMod 2 := ((B j : A.ker) : ι → ZMod 2) i

/-- The difference of any two points in a first-coordinate fiber is
represented by the coordinates of a vector in the actual kernel. -/
theorem kernel_basis_represents_fiber
    (B : Module.Basis (Fin r) (ZMod 2) A.ker)
    (u x : ι → ZMod 2) (h : A x = A u) :
    ∃ t : Fin r → ZMod 2, ∀ i,
      x i = u i + ∑ j, kernelColumn B i j * t j := by
  classical
  have hzero : A (x - u) = 0 := by rw [map_sub, h, sub_self]
  let y : A.ker := ⟨x - u, LinearMap.mem_ker.mpr hzero⟩
  refine ⟨B.equivFun y, ?_⟩
  intro i
  have hy := congrArg (fun w : A.ker => (w : ι → ZMod 2) i)
    (B.sum_equivFun y)
  simp only [Submodule.coe_sum, Submodule.coe_smul, Finset.sum_apply,
    Pi.smul_apply, smul_eq_mul] at hy
  change (∑ j, B.equivFun y j * kernelColumn B i j) = x i - u i at hy
  have hsum : (∑ j, kernelColumn B i j * B.equivFun y j) = x i - u i := by
    calc
      _ = ∑ j, B.equivFun y j * kernelColumn B i j :=
        Finset.sum_congr rfl (fun j _ => mul_comm _ _)
      _ = _ := hy
  rw [hsum]
  ring

/-- Conditional deterministic obstruction for an actual binary linear map,
with the representation hypothesis discharged by its kernel basis. -/
theorem not_surjective_of_kernel_basis
    (B : Module.Basis (Fin r) (ZMod 2) A.ker) (c : ι → ZMod 3)
    (h : ∀ b : Fin r → ZMod 2, b ≠ 0 →
      (Finset.univ.filter (fun i : ι => kernelColumn B i = b ∧ c i ≠ 0)).card ≠ 1) :
    ¬ Function.Surjective (fun x : ι → ZMod 2 =>
      (A x, ∑ i, c i * bit (x i))) :=
  not_surjective_of_kernel_columns r A (kernelColumn B) c h
    (fun u x he => kernel_basis_represents_fiber B u x he)

/-- There is always such a basis: a kernel inside a finite binary cube is
finite dimensional. This choice does not assert a uniform distribution. -/
noncomputable def canonicalKernelBasis (A : (ι → ZMod 2) →ₗ[ZMod 2] κ) :
    Module.Basis (Fin (Module.finrank (ZMod 2) A.ker)) (ZMod 2) A.ker := by
  letI : Fact (Nat.Prime 2) := ⟨by decide⟩
  exact Module.finBasis (ZMod 2) A.ker

end Kernel

end MaTangRandomSubsetSums
