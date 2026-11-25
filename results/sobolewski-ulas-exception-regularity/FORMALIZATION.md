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
## Reduction of the original conjecture

The [original statement](../../lean/Conjectures/SobolewskiUlasExceptionOriginalReduction.lean)
counts unordered partitions into powers of two using Mathlib’s
`Nat.Partition`, and defines exceptions by failure to be a sum of three
integer squares. Lean proves that two strictly increasing enumerations
of one set must agree. This transfers the source-layer result to every
such enumeration of the original exception set, conditional on
the identification in [Sobolewski–Ulas, Corollary 3.3](https://link.springer.com/article/10.1007/s00025-023-01966-8#Sec3).

For bases that are not powers of two, Lean proves that regularity
would give a finite kernel for the bounded normalized gap sequence.
The [binary automaton](../../lean/Conjectures/SobolewskiUlasExceptionBinaryAutomaton.lean)
gives a finite binary kernel for the normalized exception indicator, and the
[gap expansion](../../lean/Conjectures/SobolewskiUlasExceptionGapExpansion.lean)
recovers that indicator, up to translation, by concatenating a one
and the appropriate number of zeros for each gap. Lean checks
multiplicative independence from base two. At this point the
[non-erasing substitution theorem of Durand](https://arxiv.org/abs/1010.4009)
(Theorem 16), together with the finite-kernel characterization of
automatic sequences and the uniform substitution representation,
gives ultimate periodicity, contradicting the verified nonperiodicity.
Lean takes this last implication as an explicit hypothesis.

The [original-reduction receipt](verification/original-reduction/receipt.json)
records this decomposition of the proof. The next checkpoint discharges
the arithmetic part of the classification.

## Actual binary partition values modulo 32

Lean proves the exact recurrence for the Mathlib partition count by
bijections: remove a one from each odd partition; split an even
partition into those containing a one and those whose parts can all
be halved. An even count is consequently the prefix sum of all counts.
Iterated prefix sums give a three-coordinate recurrence modulo 32.
The [25-state certificate](../../lean/Conjectures/SobolewskiUlasExceptionResidueCertificate.lean)
checks both binary transitions and every output condition. It proves
for **every** index that the actual even binary partition count is
28 modulo 32 exactly on the explicit source layers. For positive
indices it also proves the valuation is one or two.

The elementary obstruction to representing `4^a(8b+7)` as three integer
squares is unconditional: every explicit source-layer member is an actual
exception. For the reverse inclusion, the sufficiency direction of
Legendre’s three-square theorem is still an explicit assumption. Lean
checks the literal positive-index tail in Conjecture 7.1, conditionally on
Legendre for powers of two and on Legendre plus Durand for all bases.
The [pinned replay](verification/actual-congruences/receipt.json) checks
this closure. The conjecture remains marked partial; neither missing
theorem is a project axiom.

The [receipt](verification/normalized-counting/receipt.json) records
strict compilation, the audit of all owned declarations, and stock
kernel replay for the pinned seven-module closure.
