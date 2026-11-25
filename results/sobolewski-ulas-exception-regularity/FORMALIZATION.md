# Lean scope for Sobolewski–Ulas’s binary-partition exception regularity conjecture

**Partial.** Lean checks exact structural claims for the normalized
exception set used in the repository’s [written proof](PROOF.md).
The proposal is [Sobolewski and Ulas, Conjecture 7.1](https://link.springer.com/article/10.1007/s00025-023-01966-8#Sec7).

1. The [digit formulas](../../lean/Conjectures/SobolewskiUlasExceptionDigits.lean)
   identify the odd layer with the actual binary digit sum. The
   [counting recurrence](../../lean/Conjectures/SobolewskiUlasExceptionCount.lean)
   counts the distinct elements of the literal union
   $`S=\{4^j(8s+3+2t_s):j,s\ge0\}`$ up to every natural endpoint.
2. The [repeated-digit identities](../../lean/Conjectures/SobolewskiUlasExceptionRepeated.lean)
   prove both exact counting-error formulas from the written proof.
   The [enumeration](../../lean/Conjectures/SobolewskiUlasExceptionEnumeration.lean)
   is defined by the least cutoff attaining the specified count.
   Lean proves exact attainment, strict increase, and the upper bound
   from the lowest layer. It proves the corresponding
   [unbounded remainder](../../lean/Conjectures/SobolewskiUlasExceptionUnbounded.lean)
   on the written subsequence.
3. An [elementary parity argument](../../lean/Conjectures/SobolewskiUlasExceptionNonperiodic.lean)
   proves that membership in this normalized set is not ultimately periodic.

## All power-of-two bases

The [logarithmic bound](../../lean/Conjectures/SobolewskiUlasExceptionCarry.lean)
controls the exact remainder by comparing high base-sixteen prefixes.
Lean also verifies the [repeated digit word](../../lean/Conjectures/SobolewskiUlasExceptionRepeatedInput.lean)
and the [base-power and finite linear representation arguments](../../lean/Conjectures/SobolewskiUlasExceptionRegularPowers.lean).
The exact [source-layer enumeration](../../lean/Conjectures/SobolewskiUlasExceptionSourceLayer.lean)
is not regular in any positive power of two, including after restoring
the author's positive indexing and factor of two. The proof replaces the
written characteristic-root argument with an integer-state pigeonhole:
a logarithmically bounded finite window has fewer possible recurrence
states than starting positions. A repeated state forces subsequent
repetition, which contradicts the proved unbounded remainder.

Lean also checks the positive gap bound of twelve. The [power-of-two
receipt](verification/powers-of-two/receipt.json) covers these statements.
The identification with the actual binary partition function and the
Cobham–Durand transfer for bases that are not powers of two remain
outside the Lean proof. Thus Conjecture 7.1 is still marked partial.

The [receipt](verification/normalized-counting/receipt.json) records
strict compilation, the audit of all owned declarations, and stock
kernel replay for the pinned seven-module closure.
