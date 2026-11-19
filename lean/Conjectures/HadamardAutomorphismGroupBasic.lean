import Conjectures.HadamardAutomorphismPermutationMatrix
import Mathlib.Algebra.GroupWithZero.Units.Fintype

/-!
# The signed Hadamard automorphism group

The carrier consists of all actual signed row/column permutation pairs
preserving the given matrix. Closure is proved from the entrywise invariance
equation, independently of the order-479 obstruction.
-/

namespace HadamardAutomorphism

open scoped BigOperators

variable {ι : Type*}

theorem signedLift_one : signedLift (1 : Equiv.Perm ι) (fun _ => 1) = 1 := by
  apply Equiv.ext
  rintro ⟨i, u⟩
  simp only [signedLift_apply, Equiv.Perm.one_apply, one_mul]

theorem signedLift_mul (σ ρ : Equiv.Perm ι) (s u : ι → ℤˣ) :
    signedLift σ s * signedLift ρ u =
      signedLift (σ * ρ) (fun i => s (ρ i) * u i) := by
  apply Equiv.ext
  rintro ⟨i, v⟩
  simp only [Equiv.Perm.mul_apply, signedLift_apply, mul_assoc]

theorem signedLift_inv (σ : Equiv.Perm ι) (s : ι → ℤˣ) :
    (signedLift σ s)⁻¹ = signedLift σ⁻¹ (fun i => (s (σ⁻¹ i))⁻¹) := by
  ext ⟨i, u⟩ <;> rfl

theorem realSign_inv (u : ℤˣ) : realSign u⁻¹ = realSign u := by
  rcases Int.units_eq_one_or u with rfl | rfl <;> norm_num [realSign]

theorem signed_invariance_inv (H : Matrix ι ι ℝ) (σ τ : Equiv.Perm ι)
    (s t : ι → ℤˣ)
    (hinv : ∀ i j, H (σ i) (τ j) = realSign (s i) * realSign (t j) * H i j) :
    ∀ i j, H (σ⁻¹ i) (τ⁻¹ j) =
      realSign ((s (σ⁻¹ i))⁻¹) * realSign ((t (τ⁻¹ j))⁻¹) * H i j := by
  intro i j
  have h : H i j = realSign (s (σ⁻¹ i)) * realSign (t (τ⁻¹ j)) *
      H (σ⁻¹ i) (τ⁻¹ j) := by
    simpa only [Equiv.Perm.coe_inv, Equiv.apply_symm_apply] using hinv (σ⁻¹ i) (τ⁻¹ j)
  rw [realSign_inv, realSign_inv]
  calc
    H (σ⁻¹ i) (τ⁻¹ j) = realSign (s (σ⁻¹ i)) ^ 2 *
        realSign (t (τ⁻¹ j)) ^ 2 * H (σ⁻¹ i) (τ⁻¹ j) := by
      rw [realSign_sq, realSign_sq, one_mul, one_mul]
    _ = realSign (s (σ⁻¹ i)) * realSign (t (τ⁻¹ j)) *
        (realSign (s (σ⁻¹ i)) * realSign (t (τ⁻¹ j)) * H (σ⁻¹ i) (τ⁻¹ j)) := by ring
    _ = realSign (s (σ⁻¹ i)) * realSign (t (τ⁻¹ j)) * H i j :=
      congrArg (fun x : ℝ => realSign (s (σ⁻¹ i)) * realSign (t (τ⁻¹ j)) * x) h.symm

/-- All signed row/column permutation pairs preserving `H`, as an actual subgroup. -/
def signedHadamardAut (H : Matrix ι ι ℝ) :
    Subgroup (Equiv.Perm (ι × ℤˣ) × Equiv.Perm (ι × ℤˣ)) where
  carrier P := ∃ σ τ : Equiv.Perm ι, ∃ s t : ι → ℤˣ,
    P = (signedLift σ s, signedLift τ t) ∧
      ∀ i j, H (σ i) (τ j) = realSign (s i) * realSign (t j) * H i j
  one_mem' := by
    refine ⟨1, 1, (fun _ => 1), (fun _ => 1), ?_, ?_⟩
    · change ((1 : Equiv.Perm (ι × ℤˣ)), (1 : Equiv.Perm (ι × ℤˣ))) = _
      exact Prod.ext signedLift_one.symm signedLift_one.symm
    · intro i j
      simp
  mul_mem' := by
    rintro P Q ⟨σ, τ, s, t, rfl, hP⟩ ⟨ρ, υ, u, v, rfl, hQ⟩
    refine ⟨σ * ρ, τ * υ, (fun i => s (ρ i) * u i),
      (fun j => t (υ j) * v j), ?_, ?_⟩
    · exact Prod.ext (signedLift_mul σ ρ s u) (signedLift_mul τ υ t v)
    · intro i j
      simp only [Equiv.Perm.mul_apply, realSign_mul]
      rw [hP, hQ]
      ring
  inv_mem' := by
    rintro P ⟨σ, τ, s, t, rfl, hinv⟩
    refine ⟨σ⁻¹, τ⁻¹, (fun i => (s (σ⁻¹ i))⁻¹),
      (fun j => (t (τ⁻¹ j))⁻¹), ?_, signed_invariance_inv H σ τ s t hinv⟩
    exact Prod.ext (signedLift_inv σ s) (signedLift_inv τ t)

/-- Every signed symmetry occurs in the automorphism group. -/
theorem signedHadamardAut_mem (H : Matrix ι ι ℝ) (σ τ : Equiv.Perm ι)
    (s t : ι → ℤˣ)
    (hinv : ∀ i j, H (σ i) (τ j) = realSign (s i) * realSign (t j) * H i j) :
    (signedLift σ s, signedLift τ t) ∈ signedHadamardAut H :=
  ⟨σ, τ, s, t, rfl, hinv⟩

end HadamardAutomorphism
