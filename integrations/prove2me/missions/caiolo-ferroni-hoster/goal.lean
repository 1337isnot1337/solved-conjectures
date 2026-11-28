import Definitions.Def_CaioloFerroniHosterRankFive
import Mathlib.Algebra.IsPrimePow
import Mathlib.Algebra.Polynomial.Derivative
import Mathlib.Algebra.Polynomial.Splits

open CaioloFerroniHoster Polynomial
open scoped Classical

theorem CaioloFerroniHoster.counterexample_family (q : ℕ) (hprime : IsPrimePow q) (hq : 17 ≤ q) :
    ∃ (F K : Type) (_ : Field F) (_ : Field K) (_ : Fintype F) (_ : Fintype K)
      (_ : Algebra F K), Fintype.card F = q ∧ Module.finrank F K = 4 ∧
      ∃ M : Matroid (Point F (K × K) K),
        M.E = Set.univ ∧ IsSimple M ∧ M.eRank = 5 ∧
        (matroidDualChow M).natDegree = 4 ∧
        (∀ x : ℝ, 0 < (matroidDualChow M).eval x) ∧
        (matroidDualAugmented M).natDegree = 5 ∧
        (∀ x : ℝ, (matroidDualAugmented M).eval x = 0 ↔ x = -1) ∧
        (matroidDualAugmented M).derivative.eval (-1) ≠ 0 ∧
        ¬ (matroidDualChow M).Splits ∧ ¬ (matroidDualAugmented M).Splits := by sorry
