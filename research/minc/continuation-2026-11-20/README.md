# Minc continuation, 20 November 2026

Coordination: [issue 139](https://github.com/1337isnot1337/solved-conjectures/issues/139#issuecomment-7056213903).

This continuation investigates full unresolved entries on [the live Minc list](https://yair-lavi.com/mincs-list/). It has obtained **zero new complete resolutions**. The requested total of ten has not been met. No Lean work is in scope.

## Work recorded here

| Target | Work | Status |
| --- | --- | --- |
| C5, Ryser's design conjecture | Exact multirow redistribution search using certified design thresholds | No counterexample; finite negative search is not a theorem |
| C9, Marcus's block-permanent inequality | Updated primary literature; two exact padding obstructions | Full inequality unresolved |
| C24, integrality of the minimum permanent | Checked the new entropy route against the integer-lattice requirement | The needed rounding inequality is unproved |
| C34, Lih-Wang inequality | Exact coefficient and curvature identities; exploratory searches | Full inequality unresolved |
| C30, Chollet's conjecture | New structural investigation | In progress |
| C36 and P7, sign-matrix problems | Binary constructions and prior-art checks | In progress |
| P17, permanental-compound characteristic polynomial | Symmetric-power compression and collision-state resolvent route | No uniformly faster algorithm established |
| P2 and C42, permanent dominance | Complex affine-group counterexample diagnostics | No exact counterexample |

The [inequalities note](inequalities/c9_c34_checkpoint.md) and [regular-matrix note](regular/README.md) give exact statements, source links, calculations, and limitations. Their programs are discovery tools. Floating-point searches cannot establish the inequalities, and exact finite searches do not resolve the unrestricted conjectures.

The previous campaign's general P18 approximation theorem, Pula-Song-Wanless threshold, and Malek endpoint theorem retain the different scopes in [the existing continuation record](../NEXT.md). They are not new results of this continuation and are not counted here as three full numbered entries.

## Coordination boundaries

Before starting, the workers read the repository's previous reductions and fresh issue comments. Concurrent C6 coupling, C20 Poisson/stable-polynomial, C44 radial-asymptotic, and P1 spectral work is reserved elsewhere. This directory avoids overwriting those files. New claims require a complete argument, a fresh primary-source check, and an independent attempt to break the proof.

## Reproduction

The C5 code uses integer subset recurrences. Its inputs and selected logs are in `regular/`; the note specifies which row subsets were sampled. The C9/C34 code uses C++ permanent derivatives and Python optimization; compile and run commands are in the inequalities note. No negative result from a bounded search is treated as a proof of any original conjecture.
