import Conjectures.BraunBrueggeThetaOptimizerGeometry
import Conjectures.BraunBrueggeThetaOptimizerRows

/-! The complete finite base of Braun and Bruegge's journal Conjecture 33. -/

namespace BraunBruegge

/-- For every total path length from 11 through 143 the proposed three-path graph
maximizes the number of geometric facets, uniquely up to permuting the lengths. -/
theorem theta_optimizer_finite (l : ℕ) (lo : 11 ≤ l) (hi : l ≤ 143)
    (length : Fin 3 → ℕ) (hp : ∀ i, 0 < length i) (hs : ∑ i, length i = l) :
    Nat.card {F // IsFacet (thetaGraph length) F} ≤
      Nat.card {F // IsFacet (thetaGraph (thetaOptimizerLengths l)) F} ∧
    (Nat.card {F // IsFacet (thetaGraph length) F} =
      Nat.card {F // IsFacet (thetaGraph (thetaOptimizerLengths l)) F} ↔
        ∃ e : Equiv.Perm (Fin 3), length ∘ e = thetaOptimizerLengths l) :=
  thetaOptimizer_of_sorted l lo (fun x y z =>
    checkThetaOptimizerAtTotal_sound l x y z (thetaOptimizerRows_checked l lo hi)) length hp hs

end BraunBruegge
