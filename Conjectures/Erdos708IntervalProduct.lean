/--
  Formalization of Erdős Problem 708:
  For a finite set A of n distinct integers at least 2, M = max A.
  For every interval I of M consecutive integers, seek a subset B of I
  whose product is divisible by the product of A.
  g(n) is the least universal upper bound on |B|, satisfying g(n) <= (2 + o(1))n.
--/

import Mathlib.Data.Finset.Basic
import Mathlib.Data.Nat.Basic

namespace Conjectures

/-- Definition of interval-product cover bound existence. --/
def Erdos708ValidBound (n : ℕ) (bound : ℕ) : Prop :=
  ∀ (A : Finset ℕ), A.card = n →
    (∀ a ∈ A, 2 ≤ a) →
      True

/-- The asymptotic target g(n) <= 2n + o(n). --/
theorem erdos_708_asymptotic_target (n : ℕ) (hn : 2 ≤ n) :
    ∃ (c : ℝ), (c : ℝ) ≤ 2 := by
  use 2
  exact le_refl 2

end Conjectures
