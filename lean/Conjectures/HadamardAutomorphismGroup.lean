import Conjectures.HadamardAutomorphismMain
import Mathlib.Algebra.GroupWithZero.Units.Fintype

/-!
# The signed Hadamard automorphism group

This is the subgroup of actual signed row/column permutation pairs preserving
the given matrix. Its carrier includes every such pair. Closure is proved
from the entrywise invariance equation. Cauchy's theorem converts the
order-479 obstruction into a statement about the cardinality of this group.
-/

namespace HadamardAutomorphism

open scoped BigOperators

variable {ι : Type*}

theorem signedLift_one : signedLift (1 : Equiv.Perm ι) (fun _ => 1) = 1 := by
  ext ⟨i, u⟩
  simp

theorem signedLift_mul (σ ρ : Equiv.Perm ι) (s u : ι → ℤˣ) :
    signedLift σ s * signedLift ρ u =
      signedLift (σ * ρ) (fun i => s (ρ i) * u i) := by
  ext ⟨i, v⟩
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
  have h := hinv (σ⁻¹ i) (τ⁻¹ j)
  simp only [Equiv.Perm.coe_inv, Equiv.apply_symm_apply] at h
  rw [realSign_inv, realSign_inv]
  calc
    H (σ⁻¹ i) (τ⁻¹ j) = realSign (s (σ⁻¹ i)) ^ 2 *
        realSign (t (τ⁻¹ j)) ^ 2 * H (σ⁻¹ i) (τ⁻¹ j) := by
      rw [realSign_sq, realSign_sq, one_mul, one_mul]
    _ = realSign (s (σ⁻¹ i)) * realSign (t (τ⁻¹ j)) *
        (realSign (s (σ⁻¹ i)) * realSign (t (τ⁻¹ j)) * H (σ⁻¹ i) (τ⁻¹ j)) := by ring
    _ = realSign (s (σ⁻¹ i)) * realSign (t (τ⁻¹ j)) * H i j := by rw [← h]

/-- All signed row/column permutation pairs preserving `H`, as an actual subgroup. -/
def signedHadamardAut (H : Matrix ι ι ℝ) :
    Subgroup (Equiv.Perm (ι × ℤˣ) × Equiv.Perm (ι × ℤˣ)) where
  carrier P := ∃ σ τ : Equiv.Perm ι, ∃ s t : ι → ℤˣ,
    P = (signedLift σ s, signedLift τ t) ∧
      ∀ i j, H (σ i) (τ j) = realSign (s i) * realSign (t j) * H i j
  one_mem' := by
    refine ⟨1, 1, (fun _ => 1), (fun _ => 1), ?_, ?_⟩
    · simpa only [signedLift_one]
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

/-- The order of the full signed automorphism group of a Hadamard matrix of
order 2396 is not divisible by 479. -/
theorem hadamard_automorphism_card_not_dvd_479 [Fintype ι] [DecidableEq ι]
    (H : Matrix ι ι ℝ) (hcard : Fintype.card ι = 2396)
    (hsign : ∀ i j, H i j ^ 2 = 1)
    (horth : ∀ i k, ∑ j, H i j * H k j = if i = k then (2396 : ℝ) else 0) :
    ¬ 479 ∣ Nat.card (signedHadamardAut H) := by
  let : Fact (Nat.Prime 479) := ⟨by norm_num⟩
  intro hdiv
  obtain ⟨g, hg⟩ := exists_prime_orderOf_dvd_card' (G := signedHadamardAut H) 479 hdiv
  obtain ⟨σ, τ, s, t, heq, hinv⟩ := g.property
  have horder : orderOf g.val = 479 :=
    (orderOf_injective (signedHadamardAut H).subtype Subtype.coe_injective g).trans hg
  rw [heq] at horder
  exact hadamard_signed_pair_order_ne_479 H σ τ s t hcard hsign horth hinv horder

end HadamardAutomorphism
