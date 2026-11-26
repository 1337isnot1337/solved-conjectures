module
public import Conjectures.CyrusianKaplanExactMonotonicityReduction
public import Conjectures.CyrusianKaplanPolynomialError

@[expose] public section
namespace CyrusianKaplan

open Polynomial

/-- The written monotonicity conclusion follows once the signed
correction has residue polynomials of degree at most 2r-1 with a
single shared top coefficient. This route does not require
introducing a measure-theoretic volume normalization into Lean. -/
theorem exact_ordinarization_eventually_increasing_of_common_correction_coeff
    (r p m : ℕ) (hr : 1≤r) (hp : 0<p)
    (P : Fin p → ℝ[X]) (C : ℝ)
    (hDeg : ∀ s,(P s).natDegree≤2*r-1)
    (hC : ∀ s,(P s).coeff (2*r-1)=C)
    (hEq : ∀ g : ℕ, m≤g →
      (Nat.card (ExactOrdinarizationClass g r):ℝ)-((baselinePairs g r).card:ℝ)=
        (P ⟨g%p,Nat.mod_lt _ hp⟩).eval (g:ℝ)) :
    ∃ m' : ℕ, ∀ g : ℕ, m'≤g →
      Nat.card (ExactOrdinarizationClass g r)<Nat.card (ExactOrdinarizationClass (g+1) r) := by
  apply eventual_ordinarization_increase_of_correction_estimate r hr
  obtain ⟨D,hD,hErr⟩ := finite_polynomials_common_top_uniform_error P (2*r-1) C hDeg hC
  refine ⟨C,D,hD,max m 1,fun g hg => ?_⟩
  rw [hEq g ((le_max_left m 1).trans hg)]
  have hG : (1:ℝ)≤(g:ℝ) := by
    exact_mod_cast (le_max_right m 1).trans hg
  simpa only [show 2*r-1-1=2*r-2 by omega] using
    hErr ⟨g%p,Nat.mod_lt _ hp⟩ (g:ℝ) hG

end CyrusianKaplan
