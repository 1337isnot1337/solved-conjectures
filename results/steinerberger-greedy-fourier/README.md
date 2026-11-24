# Steinerberger’s greedy-energy Fourier conjecture

**Disproved.** The original logarithmic Fourier bound fails for an actual infinite sequence satisfying the greedy rule. The existing written proof also gives exact dyadic Fourier magnitudes for every singleton initialization and tie-breaking rule, with a sharp logarithm-squared limsup constant.

**Lean verification: complete for the original conjecture.** The four Lean modules construct the classical base-two van der Corput sequence, prove its greedy admissibility at every index, and show that its actual truncated weighted absolute Fourier sum exceeds every constant multiple of the logarithm arbitrarily far out. The sharp constant and the all-initialization and all-tie-breaking supplements remain unformalized.

- [Complete written proof](PROOF.md)
- [Source and original independent audit](AUDIT.md)
- [Lean scope and statement correspondence](FORMALIZATION.md)
- [Independent Lean review](LEAN_REVIEW.md)
- [Lean endpoint](../../lean/Conjectures/SteinerbergerGreedy.lean)
- [Publication verification receipt](verification/receipt.json)
- [Original frozen lane evidence](verification/lane/receipt.json)
- [Discovery issue #436](https://github.com/1337isnot1337/solved-conjectures/issues/436)
- [Repository-wide verification and deployment follow-up #563](https://github.com/1337isnot1337/solved-conjectures/issues/563)

The formalization follows the recorded repository argument, credits Steinerberger as proposer and Pausinger and Kritzinger for the prior dyadic sequence results, and makes no new priority claim. Scoped proof checks, aggregate repository checks, hosted workflows, and public-site deployment are recorded separately.
