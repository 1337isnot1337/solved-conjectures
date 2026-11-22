# Steinke–Zakynthinou’s agnostic VC learning conjecture

[Manuscript (PDF)](paper.pdf) · [LaTeX source](paper.tex) · [Scope audit](SCOPE.md)

**Partial result on the unrestricted conjecture.** Lean verifies both rates under the measurable-selection convention below. For a binary hypothesis class of VC dimension at most $`d`$, with $`1\le d\le n`$, one randomized learner returns a member of the class. The choice of learner is independent of the data distribution. [Lean theorem](../../lean/Conjectures/AgnosticVC/Theorem.lean) · [Earlier proof outline](PROOF.md)

| Guarantee for the same learner | Verified bound |
| --- | --- |
| Expected fraction of mistakes on **every** labeled training sample | At most the best empirical error in the class plus $`583\sqrt{d/n}`$ |
| Information the **entire returned hypothesis** reveals about the fair selector, conditional on an iid pool | At most $`19{,}712d`$ nats |

The first estimate compares with the infimum of ordinary zero–one losses. The second uses the joint distribution of the selector and the named hypothesis. Lean identifies its discrete information formula with Mathlib’s KL divergence from the product of their marginals when output singletons are measurable. For any other prescribed output measurable space, Lean proves that its KL is bounded above by the same complete-name information. [Arbitrary output measurable spaces](../../lean/Conjectures/AgnosticVC/CoarseKL.lean) · [Empirical loss and infimum](../../lean/Conjectures/AgnosticVC/EmpiricalInfimum.lean) · [Joint and marginal laws](../../lean/Conjectures/AgnosticVC/OriginalInformation.lean) · [KL theorem](../../lean/Conjectures/AgnosticVC/KLRates.lean)

## Scope

The [scope audit](SCOPE.md) compares the original definitions with the formal hypotheses and gives a VC-one obstruction to unrestricted Borel selection.

- **Every hypothesis set and every fixed pool.** Arbitrary cardinalities, repeated features and label noise are allowed. Fix all $`2n`$ labeled positions, permute them uniformly, compute the selector information with the order known, then average over orders. The same information bound holds for each such pool. [Fixed-pool theorem](../../lean/Conjectures/AgnosticVC/Theorem.lean)
- **Every iid law for which the information is defined.** Almost-everywhere measurability of the exact pool statistic suffices. Lean proves that the statistic has finite range and hence is integrable. This covers every countably supported data law on a feature space with measurable singletons, even for uncountable hypothesis classes. [Population theorem](../../lean/Conjectures/AgnosticVC/MeasurableInformation.lean)
- **One measurable Markov learner for every iid law.** The construction uses the first hypothesis realizing each trace in any chosen global well-order. The same two numerical constants work for every choice of order. When these representatives satisfy the stated measurability condition, Lean proves the learner is a Markov kernel on the original hypothesis space. Lean proves the condition for every countable class of measurable predictors and for arbitrary classes on countable instance spaces with measurable singletons. It also suffices to put a countable subclass of measurable predictors first in the order, provided that it realizes every finite trace of the whole class. [Kernel and selection condition](../../lean/Conjectures/AgnosticVC/Kernel.lean)

## Proof and verification

[![Lean build, axiom audit and kernel replay](https://github.com/1337isnot1337/solved-conjectures/actions/workflows/lean-agnostic-vc.yml/badge.svg?branch=main)](https://github.com/1337isnot1337/solved-conjectures/actions/workflows/lean-agnostic-vc.yml)

The learner gives each training mistake a random weight and regularizes the entropy of predictions on subsets of several sizes. Controlling the change in its output law when one example is removed bounds the information revealed by the selector. [Weighted loss estimate](../../lean/Conjectures/AgnosticVC/ProjectionWeightIntegral.lean) · [Deletion bound and rates](../../lean/Conjectures/AgnosticVC/Rates.lean)

To typeset the paper, run `tectonic paper.tex` in this directory. From the repository root, run `python3 scripts/verify_agnostic_vc.py --fetch-cache` with the pinned Lean toolchain available. It builds the theorem, elaborates all local proof files with warnings as errors, audits their declarations and replays their compiled proofs with the pinned kernel checker. The `verify.py` diagnostic separately checks selected finite-dimensional estimates. [Verification receipt](verification.json) · [Tracking issue](https://github.com/1337isnot1337/solved-conjectures/issues/240)

The authors advertised **US$500** for a positive resolution of Conjecture 6. The measurable theorem is a partial result on that unrestricted question. The repository records no award. The real-threshold case has a separate result and prize. [Original statement and prize, §§2–3](https://proceedings.mlr.press/v125/steinke20b/steinke20b.pdf) · [Literature audit](../../research/bounty-continuation-2026-11-21/learning-information/vc-information-complexity-target.md) · [Threshold result](../steinke-zakynthinou-thresholds/)
