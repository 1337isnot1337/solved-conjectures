import Conjectures.HadamardLegendreFourier
import Conjectures.HadamardLegendreCyclotomic

/-!
# Inverted prime quotients obstruct length-1197 Legendre pairs

The endpoint starts with actual sign rows and their periodic correlations.
A surjective prime quotient on which a common exact symmetry acts by
negation produces the nontrivial character used in the odd-degree
two-square contradiction.
-/

namespace HadamardLegendre

open scoped BigOperators
open NumberField IsCyclotomicExtension

variable {G : Type*} [AddCommGroup G] [Fintype G]

theorem no_legendre_inverted_character
    (p : ℕ) [Fact (Nat.Prime p)] (hp : p % 4 = 3)
    (K : Type*) [Field K] [NumberField K] [IsCyclotomicExtension {p} ℚ K]
    (χ : AddChar G K) (hχ : χ ≠ 1)
    (hτχ : ∀ x, cyclotomicConjugation p K (χ x) = χ (-x))
    (e : G ≃+ G) (hχe : ∀ x, χ (e x) = χ (-x))
    (f : Rows2 G) (hf : IsLegendrePair f)
    (hfe : ∀ i x, f i (e x) = f i x)
    (hcard : Fintype.card G = 1197) : False := by
  let F := realFixedField p K
  let a : F := ⟨fourierSum χ (f 0), (mem_realFixedField p K _).mpr
    (fourierSum_fixed_of_invariant χ (cyclotomicConjugation p K) hτχ
      e hχe (f 0) (hfe 0))⟩
  let b : F := ⟨fourierSum χ (f 1), (mem_realFixedField p K _).mpr
    (fourierSum_fixed_of_invariant χ (cyclotomicConjugation p K) hτχ
      e hχe (f 1) (hfe 1))⟩
  have hsum : (a : K) ^ 2 + (b : K) ^ 2 = 2396 := by
    have h := invariant_pair_fourier_squares χ (cyclotomicConjugation p K)
      hτχ hχ e hχe f hf hfe
    norm_num [hcard] at h
    exact h
  have hab : a ^ 2 + b ^ 2 = (2396 : F) := by
    apply Subtype.ext
    exact hsum
  have hhalf : (a / 2) ^ 2 + (b / 2) ^ 2 = (599 : F) := by
    calc
      (a / 2) ^ 2 + (b / 2) ^ 2 = (a ^ 2 + b ^ 2) / 4 := by ring
      _ = (599 : F) := by rw [hab]; norm_num
  exact realFixedField_no_two_squares_599 p K hp (a / 2) (b / 2) hhalf

set_option backward.isDefEq.respectTransparency false in
theorem no_legendre_inverting_prime_quotient
    (p : ℕ) [Fact (Nat.Prime p)] (hp : p % 4 = 3)
    (π : G →+ ZMod p) (hπ : Function.Surjective π)
    (e : G ≃+ G) (he : ∀ x, π (e x) = -π x)
    (f : Rows2 G) (hf : IsLegendrePair f)
    (hfe : ∀ i x, f i (e x) = f i x)
    (hcard : Fintype.card G = 1197) : False := by
  let : NeZero (p : ℚ) := ⟨by exact_mod_cast (Fact.out : Nat.Prime p).ne_zero⟩
  let : IsCyclotomicExtension {p} ℚ (CyclotomicField p ℚ) :=
    CyclotomicField.isCyclotomicExtension p ℚ
  let K := CyclotomicField p ℚ
  let χ : AddChar G K := (cyclotomicCharacter p K).compAddMonoidHom π
  have hχ : χ ≠ 1 := by
    intro h
    apply cyclotomicCharacter_nontrivial p K
    ext a
    obtain ⟨x, rfl⟩ := hπ a
    have hx := DFunLike.congr_fun h x
    change cyclotomicCharacter p K (π x) = 1 at hx
    exact hx
  have hτχ (x : G) :
      cyclotomicConjugation p K (χ x) = χ (-x) := by
    change cyclotomicConjugation p K (cyclotomicCharacter p K (π x)) =
      cyclotomicCharacter p K (π (-x))
    rw [map_neg]
    exact cyclotomicConjugation_character p K (π x)
  have hχe (x : G) : χ (e x) = χ (-x) := by
    change cyclotomicCharacter p K (π (e x)) =
      cyclotomicCharacter p K (π (-x))
    rw [he, map_neg]
  exact no_legendre_inverted_character p hp K χ hχ hτχ e hχe f hf hfe hcard

end HadamardLegendre
