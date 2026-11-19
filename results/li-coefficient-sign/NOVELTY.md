# Novelty and prior-art audit (17 November 2026)

This file records **what the sources establish**, not a claim of exhaustive publication priority. No prior explicit **non-spider** positive-coefficient example was located in the searches below. Independent expert review could identify earlier implicit examples.

## Li's precise questions (2026)

Ethan Y. H. Li, [*A quantitative way to e-positivity of trees*](https://arxiv.org/abs/2503.09484), version 2 dated 10 February 2026, Section 4 (printed p. 16):

- **Problem 4.6, first question:** For a CPET tree with maximum degree 4, must *some* degree-4 vertex be adjacent to at least two leaves? The present tree has a **unique** degree-4 vertex with **one** leaf neighbor, so the answer is no.
- **Problem 4.6, second question:** Must there be exactly one degree-4 vertex? Our tree **does not** refute this half: it has exactly one. Moreover, older work already mentions a counterexample; see below.
- **Problem 4.9:** For an odd-order CPET tree with maximum degree 4, must `[e_3 e_2^{(n-3)/2}]X_T` be negative? Our 31-vertex non-spider has coefficient `+29`, so no.
- **Informal prediction immediately before Problem 4.6:** for a **non-spider** CPET tree, the connected partition count `b_(3,2^((n-3)/2))` should be one, and the target coefficient negative. Our counts are `8` and `+29`.

Li's Figure 4.1 reports the four non-spider examples for `n <= 21`, each with a negative target coefficient. Our example has `n=31`, beyond that enumeration.

## Older counterexamples to unrestricted claims

**The unrestricted Problem 4.9 / leaf-neighbor expectations were not novel even before this note.**

Mirko Hornak and Mariusz Wozniak, [*On arbitrarily vertex decomposable trees*](https://umv.science.upjs.sk/preprints/dokumenty/A3-2006.pdf) (2006 preprint / *Discrete Mathematics* 308 (2008), 1268--1281), Table 2, list the arbitrarily vertex-decomposable four-legged spider with arm **orders** `(2,3,13,16)`, hence arm **lengths** `(1,2,12,15)`. It has 31 vertices and its degree-4 vertex has exactly one leaf neighbor. By [Kai Zheng, *On the e-positivity of trees and spiders*](https://doi.org/10.1016/j.jcta.2022.105608), *J. Combin. Theory Ser. A* 189 (2022), Theorem 5.3, its target elementary coefficient is `+7` (also checked by the verifier's edge-cut algorithm after moving pendant edge `(8,15)` to `(14,15)`). This is a **spider**, not a non-spider counterexample.

Hornak and Wozniak also recorded that A. Marczyk had constructed arbitrarily vertex-decomposable trees that were neither spiders nor caterpillars and included **two** degree-4 vertices (2006 preprint, printed p. 19, paragraph following Corollary 23). This already contradicts the *second* question of Li's Problem 4.6. The older note does not calculate the sign for our exact non-spider problem.

## Relevant recent work

Davion Q. B. Tang, David G. L. Wang, and Monica M. Y. Wang, [*e-Positive caterpillars have maximum degree at most three*](https://arxiv.org/abs/2610.39481) (29 October 2026), prove the broad non-e-positivity conjecture for **caterpillars** and exhibit two infinite families of **non-spider CPET caterpillars**. Their Section 2, Theorem 2.2, notes that a CPET caterpillar of degree four has two leaf neighbors at its unique degree-4 vertex. Our tree is **not a caterpillar**, and the paper does not report our non-spider positive-coefficient example.

The present tree has `[e_2^8e_3^5]X_T=-6304`. Hence it does not contradict the original [Dahlberg--She--van Willigenburg conjecture](https://doi.org/10.37236/8930) that every tree with maximum degree at least 4 is non-e-positive.

## Search scope and limitations

Checked Li's latest publicly accessible version (arXiv v2), its numbered questions and figure, older arbitrarily vertex-decomposable tree classifications, Zheng's spider coefficient formula, and Tang--Wang--Wang's October 2026 caterpillar paper. Web searches additionally combined exact phrases and variants of `Problem 4.9`, `Problem 4.6`, `CPET`, `e3 e2`, `chromatic symmetric function`, `non-spider`, `non-caterpillar`, `31 vertex`, `arbitrarily vertex decomposable`, and `positive coefficient`.

**Conclusion:** An explicit non-spider, non-caterpillar, 31-vertex CPET tree with target coefficient `+29` and eight triple-plus-pairs connected partitions appears to be an unreported counterexample in the literature examined. This is narrower than claiming to be the first counterexample to Problems 4.6 or 4.9 without restriction. Absence from these search results is not proof of global novelty, and the proof remains unrefereed.
