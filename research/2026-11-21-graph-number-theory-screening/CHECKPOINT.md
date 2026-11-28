# Graph and arithmetic screening checkpoint

Date: 2026-11-21. This is a research and exclusion record. It adds no claimed new resolution.

## Dimitrov–Lazarova's conjecture

**Excluded from the new-result count: an earlier public general lemma already implies the full target.**

The exact target is Conjecture 1 in Section 4 of Stoyan Dimitrov and Meglena Lazarova, *Lower Bounds on Expressions Depending on the Functions φ(n), ψ(n) and σ(n): Part 4*, Mathematics 14(21) (2026), 3935, published 28 October 2026, DOI [10.3390/math14213935](https://doi.org/10.3390/math14213935). It states, for every integer $`n\ge2`$ and $`k\ge1`$,

```math
\frac{\varphi(n)^{3k}+\psi(n)^{3k}+\sigma(n)^{3k}}
{\varphi(n)^k\psi(n)^k\sigma(n)^k}
\ge
\frac{2(n+1)^{3k}+(n-1)^{3k}}{(n+1)^{2k}(n-1)^k}.
```

The complete inequality follows immediately from an elementary ordered-variable inequality. Put

```math
x=\left(\frac{\psi(n)}{\varphi(n)}\right)^k,
\qquad y=\left(\frac{\sigma(n)}{\varphi(n)}\right)^k,
\qquad r=\left(\frac{n+1}{n-1}\right)^k.
```

The standard inequalities $`0<\varphi(n)\le n-1`$ and $`n+1\le\psi(n)\le\sigma(n)`$ give $`1<r\le x\le y`$. Direct algebra gives

```math
\frac{1+x^3+y^3}{xy}-\left(2x+\frac1{x^2}\right)
=\frac{(y-x)(xy^2+x^2y-x^3-1)}{x^2y}\ge0,
```

because $`xy^2+x^2y-x^3-1\ge x^3-1\ge0`$. Also $`t\mapsto2t+t^{-2}`$ is increasing for $`t\ge1`$. Hence

```math
\frac{1+x^3+y^3}{xy}\ge2x+x^{-2}\ge2r+r^{-2},
```

which is exactly the source statement. This covers its entire parameter range, without numerical inference.

The reason it is not promoted is substantive. The earlier [trureturing proof of Part 4, Conjecture 4](https://www.trureturing.org/research/dimitrov-lazarova-part4-conjecture-4/) publicly states the general inequality

```math
\frac{1+x^3+y^3}{xy}\ge\frac{1+2r^3}{r^2}
\qquad(x,y\ge r\ge1),
```

and gives a nonnegative polynomial decomposition for its cleared difference. It also explicitly imports the arithmetic order bounds needed above. Its recorded settlement is 15 November 2026 at 02:06:30 UTC; the approved source is pinned at `65937383c5491847e346685ec2fe88262e0179f3`. Although that page expressly makes no separate claim about Conjecture 1, its stated general lemma plus the displayed substitution already settles the entire target. The shorter independent factorization here is therefore not counted as an original resolution. Conjectures 2, 3 and 4 also have separate earlier public dossiers:

- [Conjecture 2](https://www.trureturing.org/research/dimitrov-lazarova-part4-conjecture-2/).
- [Conjecture 3](https://www.trureturing.org/research/dimitrov-lazarova-part4-conjecture-3/).
- [Conjecture 4](https://www.trureturing.org/research/dimitrov-lazarova-part4-conjecture-4/).

Searches included the exact author pair, title, DOI, conjecture number, and `DimitrovPartIVC1`. No separate C1 dossier was located. This negative finding does not negate the positive general-lemma overlap. GitHub code search returned a rate-limit error for the DOI query, so that query supplies no negative evidence. Direct access to arXiv 2606.12484 was unavailable through the web tool; no claim about the contents of that predecessor paper is based on its inaccessible PDF.

## Xie–Xu's conjecture

**Still a research target in the inspected sources; no new proof or counterexample is claimed here.**

The final primary source is Xie and Xu, *Ultra log-concavity and real-rootedness of dependence polynomials*, Electronic Journal of Combinatorics 33(4) (2026), P4.9, DOI [10.37236/13310](https://doi.org/10.37236/13310), [arXiv 2408.09152v2](https://arxiv.org/abs/2408.09152v2). Final Conjecture 17 concerns every finite additive 2-matroid: a nonempty downward-closed family $`\mathcal I`$ such that, if $`S,T\in\mathcal I`$ and $`|T|\ge|S|+2`$, some $`x\in T\setminus S`$ satisfies $`S\cup\{x\}\in\mathcal I`$. The conjecture asks for ultra log-concavity of the counts by cardinality, normalized using the size of the ambient ground set.

Two nearby prior results must not be confused with this exact statement:

1. Alex Chengyu Li's [*Additive Augmentation Gaps Do Not Force Log Concavity*](https://crabresearch.com/research/augmentation-gap-log-concavity?lang=en), first released 6 September 2026 and revised 18 September, refutes the source's rank-dependent augmentation assertion, using additive gap 3. Its rank-four example has count sequence $`(1,13,25,7,2)`$. It does not refute additive gap 2.
2. The 4 November 2026 [EvidencePress dependence-polynomial release](https://evidencepress.org/releases/dependence-ultra-log-concavity/) gives a complete weighted graph-dependence theorem, addressing final Conjecture 14. Its [author repository](https://github.com/ipitchford/dependence-ultra-log-concavity) separately records additive-2 results in rank at most four, or ambient size at most seven, and leaves the general additive-2 assertion open. The files `supplement/frontier_note.md`, `supplement/rank_four_reduction.md`, and `supplement/rank_four_section.tex` were inspected.

A tempting hypergraph obstruction in that supplement does not yield a counterexample to Conjecture 17. With ground set $`E\sqcup\{v\}\sqcup A`$, $`|E|=3`$, $`|A|=4`$, the candidate facets $`\{v\}\cup A`$ and $`E\cup B`$ for $`B\in\binom A2`$ fail the required additive-2 augmentation. For example, a singleton $`\{v\}`$ and the feasible triple $`E`$ already violate it. No failure of an auxiliary sufficient condition is reported as a failure of the conjecture.

Structural constructions using a large complete core with a shallow extension, or symmetric two-block downsets, did not produce a complete route. The target was timeboxed rather than recast as a finite-case problem.

## Other exclusions and source gates

- **Zhao's Motzkin-root conjecture:** excluded. Complete prior proof manuscripts are public in `xzwwwwww/math` (source addition 17 October 2026, commit `2e173134a5da24512ff9d2fbf1504b5634d29af8`) and `dvgyl/math-and-theory` (inspected manuscript at `35f81bf23648b1b12fc9388e0b2c177c7f443298`). The latter's `papers/mathematics/motzkin/bounded-forcing/manuscript.tex` was read. The primary source is Feng Zhen Zhao, [Integers 26 (2026), A55](https://math.colgate.edu/~integers/aa55/aa55.pdf). The repository's existing history also records this exclusion.
- **Pandey's generalized Petersen parity conjecture:** excluded following an earlier public [refutation dossier](https://the-omega-institute.github.io/trureturing-mdbook/Library/GraphInvariants/pandey2026parity.html). The primary source is [arXiv 2601.03293](https://arxiv.org/abs/2601.03293). An offline Petersen-polynomial calculation was diagnostic only and is not claimed as a new result.
- **Réti–Došlić–Ali's Sombor maximizer conjecture and the corresponding elliptic Sombor conjecture:** excluded by Guillaume Lecomte's [*Extremal $`\ell`$-cyclic graphs for the Sombor and elliptic Sombor indices*](https://www.aimspress.com/article/doi/10.3934/math.20261448), AIMS Mathematics 11(11) (2026), 37434–37464, published 12 November 2026. The primary abstract explicitly states the full $`0\le\ell\le n-2`$ results.
- **Sabeel-e-Hafi–Ahmad–Farooq's cactus minimizer conjecture:** only a source lead. The [primary abstract](https://doi.org/10.1016/j.kjs.2026.100686) says that the elliptic Sombor minimum for $`2k+1\le n<3k`$ remains conjectural. The exact conjectured structure has not yet been retrieved; the abstract alone is insufficient to reserve, solve or count it.

## Independent reviews completed

The López Pouso–Segura quadrature audit is separately committed at `research/2026-11-21-lopez-pouso-segura-quadrature/AUDIT.md`, commit `70e32bc2a98240c45d9f175dd82e9645bbc41093`. It verifies the all-sufficiently-large-even-order failure of the asserted node/weight upper bound, as well as the exact two-node failure of the companion bound. Priority screening for that target belongs to the special-functions worker.

The Novelli–Thibon first-moment and hook audits are included in the promoted package `results/novelli-thibon/`, promotion commit `8bcf7d94349bf2a135bb0b9c7363246f4bb0dc26`. The additional Conjecture 5.4 positivity argument was independently checked and reported to its worker as a deduction from credited fixed-descent LLT and general LLT-positivity results. It supplies no additional named-result count.
