module
public import Conjectures.CyrusianKaplanExactDegreeCheckpoint
public import Conjectures.CyrusianKaplanCorrectionUniformCount

@[expose] public section
namespace CyrusianKaplan

open Polynomial

/-- The complete scoped written Cyrusian–Kaplan result: for each
fixed positive ordinarization number, the actual numerical-semigroup
count has an exact degree-2r quasipolynomial on all positive genera
and is eventually strictly increasing in genus. This is not the
Bras-Amorós assertion of monotonicity at every genus. -/
theorem cyrusian_kaplan_ordinarization_resolution (r : ℕ) (hr : 1≤r) :
    (∃ p : ℕ, ∃ hp : 0<p, ∃ P : Fin p → ℚ[X],
      (∀ s, (P s).natDegree=2*r) ∧
      ∀ g : ℕ, 0<g →
        (Nat.card (ExactOrdinarizationClass g r):ℚ)=
          (P ⟨g%p,Nat.mod_lt _ hp⟩).eval (g:ℚ)) ∧
    (∃ m : ℕ,∀ g : ℕ,m≤g →
      Nat.card (ExactOrdinarizationClass g r)<Nat.card (ExactOrdinarizationClass (g+1) r)) :=
  ⟨exact_ordinarization_quasipolynomial r hr,
    exact_ordinarization_count_eventually_strictly_increasing r hr⟩

end CyrusianKaplan
