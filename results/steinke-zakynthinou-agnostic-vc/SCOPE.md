# Scope of the proposed agnostic VC theorem

**Decision.** The Lean development proves both rates with the published quantifier order once a measurable choice of representatives is available. The deterministic-pool theorem needs no such choice of measurable functions. The development does not establish that every class in the literal wording of Conjecture 6 admits the required measurable population learner. We therefore classify it as a partial result on the unrestricted conjecture.

## What the authors specify

Conjecture 6 asks for one absolute constant and, for every binary class of VC dimension $d\ge1$ and every $n\ge d$, a proper learner, chosen before the distribution, with original CMI at most $cd$ under every iid law and empirical excess at most $c\sqrt{d/n}$ on every sample. Definition 3 uses the actual output random variable, a fair selector and a random supersample. The paper does not prescribe a sigma-algebra on every possible hypothesis class or replace expectation with an outer-expectation convention. [Problem paper, Definition 3 and Conjecture 6](https://proceedings.mlr.press/v125/steinke20b/steinke20b.pdf)

The framework paper defines mutual information as KL divergence from the product of marginals and conditional information as an expectation over the conditioning variable. Its proof of Lemma 4.15 chooses the first empirical minimizer in a well-order supplied by Lemma 4.17. That proves consistency of tie-breaking. Neither lemma proves Borel measurability of a selector. These sources justify the exchangeability calculation once the integral exists. They leave open whether the authors would accept the finite-pool formulation alone for arbitrary classes. [Framework paper, Definitions 2.6 and 2.8, Lemmas 4.15 and 4.17](https://arxiv.org/pdf/2001.09122)

| Formal conclusion | Quantifiers and scope |
| --- | --- |
| Fixed pool | For every class and every deterministic labeled pool, the average of its whole-output selector information over uniform permutations is at most $19{,}712d$. The empirical excess is at most $583\sqrt{d/n}$ on each training sample. |
| Distribution-specific integral | The very same learner works for each iid law under which its scalar pool-information statistic is almost everywhere measurable. The statistic has finite range, so measurability gives integrability. This alone does not construct a measurable output kernel. |
| Measurable proper learner | If the chosen representatives satisfy the three event conditions below, one measurable Markov learner satisfies the two bounds for **every** iid law. These conditions hold for countable classes of measurable predictors, and for countable instance domains with measurable singletons and arbitrary hypothesis classes. |

For every finite tuple of features the required events are (i) a prescribed trace is realizable, (ii) the first hypothesis realizing a prescribed subtuple trace has a specified trace on the full tuple, and (iii) that first hypothesis belongs to a prescribed measurable output set. The first two conditions make the finite information calculation measurable. The third supplies a measurable distribution on the returned hypothesis. [Selection fields](../../lean/Conjectures/AgnosticVC/VCMeasurability.lean) · [Output kernel](../../lean/Conjectures/AgnosticVC/Kernel.lean) · [Main statements](../../lean/Conjectures/AgnosticVC/Theorem.lean)

## Why the distinction matters

Take a non-Borel subset $B$ of the Borel interval. Let the class consist of the zero function and the indicators of the singletons in $B$. This is a VC-one class of Borel classifiers. Already on a one-point input the event that trace 1 is realizable is $B$. No ordering of the hypotheses can make that event Borel.

There is a stronger test for the interpretation in which a learner must be a Borel Markov kernel and evaluation is jointly Borel. Feed the learner $n$ copies of $(x,1)$. The probability $p(x)$ that its returned hypothesis predicts 1 at $x$ must be Borel by integration of the joint evaluation event against the kernel. Outside $B$ this probability is zero. On $B$ the empirical infimum is zero, so the all-sample accuracy requirement forces $p(x)\ge1-c/\sqrt n>0$ once $n>c^2$. It would follow that $B=\{p>0\}$ is Borel. Here the natural parameter space is the disjoint union of a point and $B$ with its trace sigma-algebra, and evaluation is jointly measurable since it uses equality of real numbers. The manuscript gives an injectively parametrized variant with **both** spaces standard Borel.

This obstruction rules out an unrestricted Borel-kernel theorem on arbitrarily prescribed spaces, even if one changes the algorithm. It does not determine which conventions the problem authors intended. The question for them is whether the all-class shuffled-pool theorem, with the iid implication whenever the scalar statistic is measurable, meets the scope of their problem. Independent review and prize adjudication remain open.
