# Lean formalization of the second-largest-terminal conjecture

Lean verifies the canonical decomposition and the final limit reduction for
Bóna–Pantone’s Conjecture 6.3. The [decomposition module](../../lean/Conjectures/PantoneBonaTerminal.lean)
identifies the general increasing-prefix rule at length five with the literal
avoidance class for `12345`, `12453`, `13452`, and `23451`. At every pattern
length $`k\ge4`$, it proves the unique split at the first entry ending an
increasing subsequence of length $`k-1`$. The tail is decreasing, and its
values lie in a unique gap following a front marker. This includes the gap
after the last marker. The module partitions the actual four-pattern
permutation count by cut and checks the local count $`\binom{g+r}{r}`$ of
interleavings in a gap of size $`g`$ with $`r`$ tail entries.

The [walk module](../../lean/Conjectures/PantoneBonaTerminalWalk.lean) proves
that deleting any contiguous block of $`g`$ coordinate choices preserves
survival when every initial adjacent gap is widened by $`g`$. It also checks
the exact change in each coordinate's prefix count after the deleted block.

The [limit module](../../lean/Conjectures/PantoneBonaTerminalLimit.lean)
proves the fixed-tail binomial-moment limits from pointwise gap limits and a
uniform exponential bound. At width three, the same uniform bound supplies
a summable majorant for the normalized sum over tail lengths. The
[final theorem](../../lean/Conjectures/PantoneBonaSecondLargestTerminal.lean)
defines the gap statistics on the actual permutations and derives the
normalized limit $`27\sqrt3/(32\pi)`$ under the counting identity, Regev's
front asymptotic and bound, and the two gap estimates.

The Lean scope is partial. The correspondence assembling the local
interleavings into the binomial counting identity, the Regev inputs, and
the probabilistic proofs of the gap estimates remain hypotheses in the
asymptotic reduction. The [written proof](PROOF.md) supplies those arguments.
The [original exact checker](verify.py) independently compared literal and
canonical counts through length eight for widths two, three, and four.

## Replay

Run from the repository root with the pinned Lean toolchain on the path.

```sh
python3 scripts/verify_lean_target.py \
  --root Conjectures.PantoneBonaSecondLargestTerminal \
  --require PantoneBonaTerminal.reaches_succ \
  --require PantoneBonaTerminal.singleGap_iff_unique_marker \
  --require PantoneBonaTerminal.avoids_iff_canonical_split \
  --require PantoneBonaTerminal.canonical_cut_unique \
  --require PantoneBonaTerminal.avoidsA54_iff \
  --require PantoneBonaTerminal.canonicalEquiv \
  --require PantoneBonaTerminal.countA54_eq_sum_cuts \
  --require PantoneBonaTerminal.card_gap_interleavings \
  --require PantoneBonaTerminal.count_take_deleteBlock \
  --require PantoneBonaTerminal.survives_deleteBlock \
  --require PantoneBonaTerminal.gapMoment_limit \
  --require PantoneBonaTerminal.gapMoment_bound_width_three \
  --require PantoneBonaTerminal.count_limit_of_gap_estimates \
  --require PantoneBonaTerminal.countA54_limit_of_front_estimates \
  --out results/pantone-bona-second-largest-terminal/verification
```

The [receipt](verification/receipt.json) records strict compilation, the audit
of every owned declaration, and stock-kernel replay of the four-module closure.
The allowed transitive axioms are `propext`, `Classical.choice`, and `Quot.sound`.
