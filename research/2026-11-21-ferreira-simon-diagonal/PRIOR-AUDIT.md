# Independent prior-resolution audit

Date: 2026-11-21. Target: Ferreira–Simon's conjecture in Remark 5(b) of [arXiv:2512.04940v1](https://arxiv.org/html/2512.04940v1): strict increase of $\alpha\mapsto E_{\alpha,\alpha}(-1)$ for $0<\alpha<1$.

## Finding

This additional search did not locate an earlier resolution of the exact target. It did locate the classical quantile formula used in the proof, so that formula must not be presented as a new result. The conclusion is bounded by the sources and search limits below; it does not establish worldwide priority.

## Classical probability literature

Lancelot F. James, [*Lamperti-type laws*, Annals of Applied Probability 20 (2010), 1303–1340](https://arxiv.org/pdf/0708.0618), Proposition 2.3(ii), equation (2.13), gives exactly

```math
F_{X_\alpha}^{-1}(u)=\left(\frac{\sin(\pi\alpha u)}{\sin(\pi\alpha(1-u))}\right)^{1/\alpha}.
```

The proof package rederives its Jacobian and then uses its dependence on $\alpha$. The primary paper's Section 2.5 on logarithms and hyperbolic laws was also inspected. Remark 2.5 records a classical hyperbolic characteristic function for the scaled logarithm. No diagonal Mittag–Leffler monotonicity assertion was found in these sections. Text searches throughout the paper for `increasing`, `decreasing`, `monotonic`, `peaked`, and `stochastic order` returned no matches.

Both web search engines were used with combinations including `Lamperti peakedness`, `Lamperti peakedness order`, `Lamperti convex order`, `Lamperti stochastic order`, `Lamperti log-peakedness`, `Lamperti quantile order`, `Lamperti distribution monotonicity`, `log Lamperti self-decomposable`, `Mittag-Leffler diagonal monotonicity Ferreira Simon`, and the exact formula paired with `increasing`. The relevant results gave the primary conjecture and classical representations. Many other matches concerned the Lamperti transformation of stochastic processes, which is a different subject. No exact earlier diagonal result was identified.

These checks do not establish that every possible equivalent stochastic-order result has been published nowhere. The proof's quantile identity is explicitly attributed to James.

## Public solution archives

The search included global GitHub queries for `Lamperti peakedness`, `Lamperti monotonicity`, `Lamperti quantile`, `Lamperti Mittag monotonicity`, `Ferreira–Simon`, and quoted Mittag–Leffler/diagonal/conjecture terms. Broad queries were noisy and capped at 100 returned files; they are not treated as exhaustive. More focused archive queries used the source identifier `2512.04940` and combinations of `Lamperti` with `Mittag`.

To reduce dependence on GitHub's search index, the following complete catalogues were fetched and inspected directly:

| Catalogue | Observed content blob | Finding |
| --- | --- | --- |
| [KnowledgeSense manuscript README](https://github.com/KnowledgeSense/math/blob/main/README.md) | `3a4e8c444623a042b581d60fd65b5a1470b03f88` | No matching target in the catalogue |
| [Pudim applications record](https://github.com/pudim-project/pudim-ai-demo-zetalaw/blob/main/APPLICATIONS.md) | `4f5f4a47f4ad858198fc790f78bfebf073636e9e` | Its Ferreira–Simon entry concerns Tricomi quotients from a different paper; its other Mittag–Leffler entries concern different assertions |
| [Principia site-backup manifest](https://github.com/PrincipiaMathOrg/math-solutions/blob/47371706c400c79d06e3fb62190fcf6f7a725c85/site-backup/MANIFEST.json) | `e258a2e1f173e03f393d701950a72327ef389f72` | Five Mittag–Leffler title matches, checked individually below |
| [Co-PEER README](https://github.com/qqliu/CoPEER/blob/main/README.md) | `79bff2fccde07affe48ccb059fa701017daa7f3c` | No matching target in this document |
| [Trureturing book README](https://github.com/the-omega-institute/trureturing-mdbook/blob/main/README.md) | `ce3a62a41e0ba137b7b6863fe2a43eb86438690c` | No matching target in this document |

The original statement and main theorem in each potentially relevant Principia solution were read from its TeX source:

| Record | Actual assertion | Why it does not resolve this target |
| --- | --- | --- |
| [MathDB 349140](https://github.com/PrincipiaMathOrg/math-solutions/blob/47371706c400c79d06e3fb62190fcf6f7a725c85/site-backup/mathdb-349140/mathdb-349140-solution.tex) | Simon's complete-monotonicity criterion for Le Roy-type functions with powers of gamma coefficients | Different function family and criterion |
| [MathDB 361624](https://github.com/PrincipiaMathOrg/math-solutions/blob/47371706c400c79d06e3fb62190fcf6f7a725c85/site-backup/mathdb-361624/mathdb-361624-solution.tex) | Chaudhary–Diethelm–Hashemishahraki first-zero asymptotics for $E_{\alpha,\alpha}(-t^\alpha)$ | Order approaches one or two from within $(1,2)$; it does not study this target's interval |
| [MathDB 361625](https://github.com/PrincipiaMathOrg/math-solutions/blob/47371706c400c79d06e3fb62190fcf6f7a725c85/site-backup/mathdb-361625/mathdb-361625-solution.tex) | Endpoint slope of the first zero of $E_{\alpha,2}(-t^\alpha)$ | Different second parameter and different property |
| [MathDB 361626](https://github.com/PrincipiaMathOrg/math-solutions/blob/47371706c400c79d06e3fb62190fcf6f7a725c85/site-backup/mathdb-361626/mathdb-361626-solution.tex) | First-zero asymptotics of $E_{\alpha,1}(-t^\alpha)$ near order one from above | Different function and parameter domain |
| [MathDB 370772](https://github.com/PrincipiaMathOrg/math-solutions/blob/47371706c400c79d06e3fb62190fcf6f7a725c85/site-backup/mathdb-370772/mathdb-370772-solution.tex) | Chorfi–Et-tahri–Maniar–Yamamoto complete monotonicity of a sum of two squared Mittag–Leffler terms | Monotonicity is in the argument of a different expression |

Exact-source searches in Principia, KnowledgeSense, Pudim, Trureturing, Co-PEER, the cross-theory formal database, and `tamnd/math2` returned no indexed match for `2512.04940`. An additional `Lamperti Mittag` search of the probability/solution archives returned a source paper on stable mixtures and representations, with no matching diagonal conjecture statement in the displayed passage. Negative indexed queries are weaker evidence than reading a complete source and are recorded as such.

No Lean verification was performed. Formalization archives were used only to find bibliographic records and ordinary mathematical manuscripts.
