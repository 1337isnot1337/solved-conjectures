import Conjectures.HadamardAutomorphismPermutationMatrix
import Conjectures.HadamardAutomorphismPermutationCycles
import Conjectures.HadamardAutomorphismPermutationIntegral
import Conjectures.HadamardAutomorphismMatrixObstruction

/-!
# Order-479 automorphisms of actual Hadamard matrices

The theorem starts with a real sign matrix and its full Hadamard equations.
It removes the signs of an odd-order signed symmetry, proves the forced cycle
counts, labels the actual cycles, and maps the actual matrix to the ring of
integers of the 479th cyclotomic field. The Fourier determinant obstruction
then rules out the signed symmetry.
-/

namespace HadamardAutomorphism

open NumberField
open scoped BigOperators Matrix

/-- A real Hadamard matrix with the forced five cyclic blocks is impossible. -/
theorem real_cyclic_hadamard_impossible
    (H : Matrix StandardIndex StandardIndex ℝ)
    (hsign : ∀ i j, H i j ^ 2 = 1)
    (horth : ∀ i k, ∑ j, H i j * H k j = if i = k then (2396 : ℝ) else 0)
    (hfixed : ∀ j b, H none (some (j, b)) = H none (some (j, 0)))
    (hblock : ∀ i j a b,
      H (some (i, a)) (some (j, b)) = H (some (i, 0)) (some (j, b - a))) : False := by
  let : StarRing (𝓞 (CyclotomicField 479 ℚ)) :=
    integerCyclotomicStarRing479 (CyclotomicField 479 ℚ)
  let A := signMatrixOver (𝓞 (CyclotomicField 479 ℚ)) H
  apply cyclic_integer_hadamard_impossible (CyclotomicField 479 ℚ) A
  · exact signMatrixOver_conjTranspose_mul (𝓞 (CyclotomicField 479 ℚ))
      H 2396 (by decide) hsign horth
  · intro i j a
    exact signMatrixOver_values (𝓞 (CyclotomicField 479 ℚ)) H (some (i, 0)) (some (j, a))
  · intro j b
    exact congrArg (fun x => (integerSign x : 𝓞 (CyclotomicField 479 ℚ))) (hfixed j b)
  · intro i j a b
    exact congrArg (fun x => (integerSign x : 𝓞 (CyclotomicField 479 ℚ))) (hblock i j a b)

variable {ι : Type*} [Fintype ι] [DecidableEq ι]

/-- Nontrivial ordinary permutation symmetries of exponent 479 do not exist. -/
theorem ordinary_order479_hadamard_impossible
    (H : Matrix ι ι ℝ) (σ τ : Equiv.Perm ι)
    (hcard : Fintype.card ι = 2396)
    (hsign : ∀ i j, H i j ^ 2 = 1)
    (horth : ∀ i k, ∑ j, H i j * H k j = if i = k then (2396 : ℝ) else 0)
    (hinv : ∀ i j, H (σ i) (τ j) = H i j)
    (hσ : σ ^ 479 = 1) (hτ : τ ^ 479 = 1) (hnt : τ ≠ 1) : False := by
  obtain ⟨hfσ, hfτ⟩ :=
    order2396_fixed_points_and_cycles H σ τ hcard horth hsign hinv hσ hτ hnt
  obtain ⟨e, f, hsign', horth', hfixed, hblock⟩ :=
    exists_cyclic_reindex H σ τ hcard hσ hτ hfσ.1 hfτ.1 2396 hsign horth hinv
  exact real_cyclic_hadamard_impossible (orbitReindex H e f) hsign' horth' hfixed hblock

/-- A nontrivial pair of signed permutations preserving a real Hadamard matrix
of order 2396 cannot have exponent 479. -/
theorem signed_order479_hadamard_impossible
    (H : Matrix ι ι ℝ) (σ τ : Equiv.Perm ι) (s t : ι → ℤˣ)
    (hcard : Fintype.card ι = 2396)
    (hsign : ∀ i j, H i j ^ 2 = 1)
    (horth : ∀ i k, ∑ j, H i j * H k j = if i = k then (2396 : ℝ) else 0)
    (hinv : ∀ i j, H (σ i) (τ j) = realSign (s i) * realSign (t j) * H i j)
    (hσ : signedLift σ s ^ 479 = 1) (hτ : signedLift τ t ^ 479 = 1)
    (hnt : signedLift σ s ≠ 1 ∨ signedLift τ t ≠ 1) : False := by
  have hodd : Odd (479 : ℕ) := by decide
  obtain ⟨d, e, hsign', horth', hinv'⟩ :=
    normalize_signed_hadamard H σ τ s t hodd hσ hτ 2396 hsign horth hinv
  have hστ : σ ^ 479 = 1 := (signedLift_pow_eq_one_imp σ s 479 hσ).1
  have hττ : τ ^ 479 = 1 := (signedLift_pow_eq_one_imp τ t 479 hτ).1
  have hτnt : τ ≠ 1 := by
    rcases hnt with hnt | hnt
    · have hσnt : σ ≠ 1 := signedLift_ne_one_imp_ne_one σ s hodd hσ hnt
      have hm : signSwitch H d e * (signSwitch H d e).transpose =
          (2396 : ℝ) • (1 : Matrix ι ι ℝ) := by
        ext i k
        simpa [Matrix.mul_apply, Matrix.transpose_apply, Matrix.smul_apply,
          Matrix.one_apply] using horth' i k
      exact nontrivial_column_of_nontrivial_row (signSwitch H d e) σ τ
        (by norm_num : (2396 : ℝ) ≠ 0) hm hinv' hσnt
    · exact signedLift_ne_one_imp_ne_one τ t hodd hτ hnt
  exact ordinary_order479_hadamard_impossible (signSwitch H d e) σ τ hcard
    hsign' horth' hinv' hστ hττ hτnt

/-- No signed row/column permutation pair of order 479 preserves a real
Hadamard matrix of order 2396. The order is taken in the actual product of
permutation groups acting on signed row and column indices. -/
theorem hadamard_signed_pair_order_ne_479
    (H : Matrix ι ι ℝ) (σ τ : Equiv.Perm ι) (s t : ι → ℤˣ)
    (hcard : Fintype.card ι = 2396)
    (hsign : ∀ i j, H i j ^ 2 = 1)
    (horth : ∀ i k, ∑ j, H i j * H k j = if i = k then (2396 : ℝ) else 0)
    (hinv : ∀ i j, H (σ i) (τ j) = realSign (s i) * realSign (t j) * H i j) :
    orderOf (signedLift σ s, signedLift τ t) ≠ 479 := by
  intro horder
  have hp : (signedLift σ s, signedLift τ t) ^ 479 = 1 := by
    simpa only [horder] using pow_orderOf_eq_one (signedLift σ s, signedLift τ t)
  have hσ : signedLift σ s ^ 479 = 1 := congrArg Prod.fst hp
  have hτ : signedLift τ t ^ 479 = 1 := congrArg Prod.snd hp
  have hnt : signedLift σ s ≠ 1 ∨ signedLift τ t ≠ 1 := by
    by_cases h : signedLift σ s = 1
    · right
      intro h'
      have hone : (signedLift σ s, signedLift τ t) = 1 := Prod.ext h h'
      rw [hone, orderOf_one] at horder
      norm_num at horder
    · exact Or.inl h
  exact signed_order479_hadamard_impossible H σ τ s t hcard hsign horth hinv hσ hτ hnt

end HadamardAutomorphism
