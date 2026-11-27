# Audit and reproduction

## Exact target and priority

- Primary source: Kai Liang, [*Quaternary games with infinite misère quotients*, arXiv:2611.29198v1](https://arxiv.org/abs/2611.29198v1), PDF dated November 24, 2026. Definition 4.2 and Conjecture 4.3 are on printed page 8, PDF page 9. The latter explicitly specifies periods 5, 7, 7, 3 and includes all prefixes of the form (0,b), so (0,2) is within its exact quantifiers.
- Sections 3.1 and 3.2 establish known two-heap and quotient results for 0.3102. There is no period-four conclusion for the fixed-heap-two slice there. Open Problem 6.5 asks about arbitrary-offset slice algebraic periodicity but does not explicitly demand period five in its formulation. We do not count a resolution of 6.5. Related [0.3312](../plambeck-siegel-03312/) and [0.3123](../liang-03123-slice/) entries settle different statements from the same paper.
- Checked the arXiv record/version, the full source statement, the author's [companion repository](https://github.com/liang-kai-ruqi/automata_and_games) (tree 7e2aac2bf85d3284a4494398af3d08948e3ccbac), [Plambeck–Siegel's original quotient paper](https://arxiv.org/abs/math/0609825), further title/identifier/citation searches, and targeted searches with 0.3102, Conjecture 4.3, period four, period twenty, PPNN, and three-heap slices. No prior exact resolution was located. This is a bounded priority search, not a claim of independent external validation or proof of absolute novelty.
- Tracking issue: [#956](https://github.com/1337isnot1337/solved-conjectures/issues/956). Source code and checks are from the repository investigation.

## Exact certificate

```sh
python3 check.py
```

The script checks all 684 transfer representatives and derives the printed table from 598 directly evaluated corner and descendant positions. It checks all residues of the asserted gap-two word and confirms that the entire four-residue bulk table has no nontrivial smaller cyclic period. The proof that these representatives suffice covers the no-move state, removal exceptions, possible swaps of the two variable heaps, and either cutoff crossing. Every recursive edge decreases total counters in the original position. A finite screen alone would not establish the conjecture's failure.

## Independent implementation

```sh
c++ -std=c++17 -O2 -Wall -Wextra check_independent.cpp -o /tmp/check-03102
/tmp/check-03102
```

The independent implementation uses labeled positions and a bottom-up total-counter order, with no sorted lookup or periodic folding. It computes 390,963 positions, checks 121,801 bulk outcomes against the explicit formula, checks 351 horizontal translations, and sees 342 violations of period five at gap two (including both label orders). This is a second implementation check of the formulas, not the reason the witness extends indefinitely. No Lean or external peer review is claimed.
