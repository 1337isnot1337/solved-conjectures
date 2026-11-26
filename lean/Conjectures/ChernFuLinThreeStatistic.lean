import Conjectures.ChernFuLinThreeStatisticXTail

/-! # Chern–Fu–Lin's three-statistic equidistribution (Conjecture 6.1)

The written proof is the minimum decomposition and weighted kernel argument
published in repository issue #439. We use the literal pattern containment
and the X insertion tree from the Burstein formalization (PR #749).
-/

namespace Conjectures.ChernFuLinThreeStatistic

open BursteinA218225

/-- For every length, prescribed *set of positions* of left-to-right minima,
number of right-to-left maxima, and number of inverse descents, the two
literal avoidance classes have equally many permutations in the fibre. -/
theorem equidistribution (n : ℕ) (L : Finset (Fin n)) (r d : ℕ) :
    fibreCount InX L r d = fibreCount InZ L r d :=
  Expansion.equidistributed_of_X_tail Growth.X_tail_identity n L r d

end Conjectures.ChernFuLinThreeStatistic
