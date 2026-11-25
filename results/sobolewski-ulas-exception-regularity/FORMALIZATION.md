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

The identification with the original binary partition function,
the logarithmic upper bound on the remainder, the finite linear
representation argument for powers of two, and the Cobham–Durand
transfer for other bases are outside this check. In particular the
unboundedness theorem is not a Lean disproof of regularity by itself.

The [receipt](verification/normalized-counting/receipt.json) records
strict compilation, the audit of all owned declarations, and stock
kernel replay for the pinned seven-module closure.
