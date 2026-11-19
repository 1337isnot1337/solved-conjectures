import Conjectures.HadamardLegendreBasic
import Conjectures.HadamardAutomorphismFourier
import Mathlib.Algebra.Algebra.Hom.Rat
import Mathlib.Tactic.Abel

/-!
# Fourier identities for actual Legendre rows

The character sums below are finite sums of the actual integer rows.
A ring automorphism that inverts the character gives the usual Fourier
norm identity. Invariance under a domain automorphism that inverts the
same character makes the Fourier sum fixed by that ring automorphism.
-/

namespace HadamardLegendre

open scoped BigOperators
open HadamardBorderNormalizationTransport

variable {G K : Type*} [AddCommGroup G] [Fintype G]
  [Field K] [Algebra ℚ K]

def fourierSum (χ : AddChar G K) (f : G → ℤ) : K :=
  ∑ x, (f x : K) * χ x

theorem fourierSum_conjugate_mul (χ : AddChar G K) (τ : K ≃ₐ[ℚ] K)
    (hτ : ∀ x, τ (χ x) = χ (-x)) (f : G → ℤ) :
    τ (fourierSum χ f) * fourierSum χ f =
      ∑ u, (correlation f u : K) * χ u := by
  calc
    τ (fourierSum χ f) * fourierSum χ f =
        ∑ x, ∑ y, ((f x : K) * χ (-x)) * ((f y : K) * χ y) := by
      simp only [fourierSum, map_sum, map_mul, map_intCast, hτ,
        Finset.sum_mul, Finset.mul_sum]
    _ = ∑ x, ∑ u, ((f x : K) * (f (x + u) : K)) * χ u := by
      apply Finset.sum_congr rfl
      intro x hx
      symm
      apply Fintype.sum_equiv (Equiv.addLeft x)
      intro u
      change ((f x : K) * (f (x + u) : K)) * χ u =
        ((f x : K) * χ (-x)) * ((f (x + u) : K) * χ (x + u))
      have hchar : χ (-x) * χ (x + u) = χ u := by
        rw [← AddChar.map_add_eq_mul]
        congr 1
        abel
      rw [← hchar]
      ring
    _ = ∑ u, (correlation f u : K) * χ u := by
      rw [Finset.sum_comm]
      apply Finset.sum_congr rfl
      intro u hu
      rw [← Finset.sum_mul]
      simp only [correlation, Int.cast_sum, Int.cast_mul]

theorem pair_fourier_norm (χ : AddChar G K) (τ : K ≃ₐ[ℚ] K)
    (hτ : ∀ x, τ (χ x) = χ (-x)) (hχ : χ ≠ 1)
    (f : Rows2 G) (hf : IsLegendrePair f) :
    (∑ i, τ (fourierSum χ (f i)) * fourierSum χ (f i)) =
      2 * ((Fintype.card G : K) + 1) := by
  classical
  have hsumχ : (∑ x, χ x) = 0 :=
    HadamardAutomorphism.nontrivial_character_sum_zero χ hχ
  have hpoint (u : G) :
      (pairCorrelation f u : K) =
        (if u = 0 then 2 * ((Fintype.card G : K) + 1) else 0) - 2 := by
    by_cases hu : u = 0
    · subst u
      rw [pairCorrelation_zero f hf.1]
      push_cast
      simp
      ring
    · rw [hf.2 u hu, ite_eq_right hu]
      norm_num
  calc
    (∑ i, τ (fourierSum χ (f i)) * fourierSum χ (f i)) =
        ∑ i, ∑ u, (correlation (f i) u : K) * χ u := by
      simp only [fourierSum_conjugate_mul χ τ hτ]
    _ = ∑ u, (pairCorrelation f u : K) * χ u := by
      rw [Finset.sum_comm]
      apply Finset.sum_congr rfl
      intro u hu
      rw [← Finset.sum_mul]
      simp only [pairCorrelation, Int.cast_sum]
    _ = ∑ u, ((if u = 0 then
        2 * ((Fintype.card G : K) + 1) else 0) - 2) * χ u :=
      Finset.sum_congr rfl fun u _ => congrArg (fun z : K => z * χ u) (hpoint u)
    _ = 2 * ((Fintype.card G : K) + 1) := by
      simp only [sub_mul, Finset.sum_sub_distrib]
      rw [← Finset.mul_sum, hsumχ, mul_zero, sub_zero]
      simp [ite_mul]

theorem fourierSum_fixed_of_invariant (χ : AddChar G K) (τ : K ≃ₐ[ℚ] K)
    (hτ : ∀ x, τ (χ x) = χ (-x)) (e : G ≃+ G)
    (hχe : ∀ x, χ (e x) = χ (-x)) (f : G → ℤ)
    (hfe : ∀ x, f (e x) = f x) :
    τ (fourierSum χ f) = fourierSum χ f := by
  have hreindex :
      (∑ x, (f (e x) : K) * χ (e x)) = fourierSum χ f :=
    Equiv.sum_comp e.toEquiv (fun x => (f x : K) * χ x)
  calc
    τ (fourierSum χ f) = ∑ x, (f x : K) * χ (e x) := by
      simp only [fourierSum, map_sum, map_mul, map_intCast, hτ, hχe]
    _ = fourierSum χ f := by
      simpa only [hfe] using hreindex

theorem invariant_pair_fourier_squares (χ : AddChar G K) (τ : K ≃ₐ[ℚ] K)
    (hτ : ∀ x, τ (χ x) = χ (-x)) (hχ : χ ≠ 1)
    (e : G ≃+ G) (hχe : ∀ x, χ (e x) = χ (-x))
    (f : Rows2 G) (hf : IsLegendrePair f)
    (hfe : ∀ i x, f i (e x) = f i x) :
    fourierSum χ (f 0) ^ 2 + fourierSum χ (f 1) ^ 2 =
      2 * ((Fintype.card G : K) + 1) := by
  have h := pair_fourier_norm χ τ hτ hχ f hf
  simp only [Fin.sum_univ_two,
    fourierSum_fixed_of_invariant χ τ hτ e hχe (f 0) (hfe 0),
    fourierSum_fixed_of_invariant χ τ hτ e hχe (f 1) (hfe 1)] at h
  simpa only [pow_two] using h

end HadamardLegendre
