import Conjectures.JohnsonPfaffianCoefficients
namespace JohnsonPfaffian
open MvPolynomial

theorem eval_nonnegative_of_coeffs {σ : Type*} (p : MvPolynomial σ ℤ)
    (hp : NonnegativeCoeffs p) (g : σ → ℝ) (hg : ∀ x, 0 ≤ g x) :
    0 ≤ MvPolynomial.eval₂ (Int.castRingHom ℝ) g p := by
  classical
  rw [MvPolynomial.eval₂_eq]
  apply Finset.sum_nonneg
  intro m hm
  apply mul_nonneg
  · change (0:ℝ) ≤ (p.coeff m : ℝ)
    exact_mod_cast hp m
  · exact Finset.prod_nonneg (fun x hx => pow_nonneg (hg x) _)

theorem intervalPfaffian_nonnegative (u : ℕ) (I : Finset (ℕ × ℕ)) (t : ℕ × ℕ → ℝ)
    (hvalid : ∀ J ∈ I, J.1 ≤ J.2 ∧ J.2 < 2*u) (ht : ∀ J ∈ I, 0 ≤ t J) :
    0 ≤ intervalPfaffian u I t := by
  classical
  let U := intervalUniverse (2*u)
  have hsub : I ⊆ U := by
    intro J hJ
    exact (mem_intervalUniverse _ _).mpr (hvalid J hJ)
  let g : ℕ × ℕ → ℝ := fun J => if J ∈ I then t J else 0
  have hg : ∀ J, 0 ≤ g J := by
    intro J
    by_cases h : J ∈ I
    · simp [g,h,ht J h]
    · simp [g,h]
  have hp := eval_nonnegative_of_coeffs (intervalPfaffian u U (fun J => MvPolynomial.X J))
    (intervalPfaffian_coefficients_nonnegative u) g hg
  have hmap := map_intervalPfaffian (MvPolynomial.eval₂Hom (Int.castRingHom ℝ) g)
    u U (fun J => (MvPolynomial.X J : MvPolynomial (ℕ × ℕ) ℤ))
  change MvPolynomial.eval₂ (Int.castRingHom ℝ) g (intervalPfaffian u U (fun J => MvPolynomial.X J)) =
    intervalPfaffian u U (fun J => MvPolynomial.eval₂ (Int.castRingHom ℝ) g (MvPolynomial.X J)) at hmap
  simp only [MvPolynomial.eval₂_X] at hmap
  rw [hmap, ← intervalPfaffian_extend u I U t hsub] at hp
  exact hp
end JohnsonPfaffian
