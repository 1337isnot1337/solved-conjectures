# Literature and scope record

Checked on 20 November 2026. The conclusion is limited to the sources searched: no earlier proof or disproof of the arbitrary-exponent shifted-product conjecture was located. Search-engine absence cannot establish priority by itself.

## Primary statements

1. **Mona Gatzweiler and Christian Krattenthaler**, *A positivity conjecture for a quotient of q-binomial coefficients*, Ramanujan Journal **69** (2026), Article 13. [Published article](https://doi.org/10.1007/s11139-025-01285-2), [open full text](https://pmc.ncbi.nlm.nih.gov/articles/PMC12711936/), [arXiv:2502.06032v3](https://arxiv.org/abs/2502.06032v3). The published Conjecture 4 says $`m\ge n`$, with an arbitrary sequence of **nonnegative** integer exponents. It requires polynomiality for the chosen shift only. Symmetry belongs to the separate Conjecture 3. The arXiv record checked lists its latest revision as 20 November 2025.

2. **Mona Gatzweiler, Fabián Levicán-Santibáñez and Atsuro Yoshida**, *Cyclotomic generating functions, empty weighted complete intersections and positivity*, [arXiv:2603.22226](https://arxiv.org/abs/2603.22226), [full text](https://arxiv.org/html/2603.22226v1). Conjecture 1.3 restates the exact target and identifies it as the earlier Conjecture 4. Corollary 1.8/3.11 proves a sufficient large-shift condition, in particular $`m\ge n^2`$. The counterexample here has $`(m,n)=(33,30)`$, outside that condition. The paper's Example 4.2 is an unrestricted quotient representing $`\Phi_{105}`$; it is not a common-shift example satisfying the present conjecture. Example 4.5 is a nonnegative quotient of two Gaussian binomials, not a counterexample. The arXiv record checked contains one version, submitted 23 March 2026.

3. **Dennis Stanton**, *Fake Gaussian sequences*, [author-hosted note](https://www-users.cse.umn.edu/~stant001/PAPERS/macmahon.pdf). The earlier counterexample quoted in Gatzweiler–Krattenthaler has $`m=1`$, $`n=17`$ and a nonsymmetric sequence. It fails the condition $`m\ge n`$ and does not resolve Conjecture 4. Stanton's original symmetric conjecture imposes polynomiality for all shifts. That stronger hypothesis is not satisfied merely by the construction in this repository.

## Later records checked

- [Christian Krattenthaler's publication list](https://www.mat.univie.ac.at/~kratt/papers.html), including the 2026 entries after the original paper. No later resolution was listed.
- [Fabián Levicán-Santibáñez's author webpage](https://homepage.univie.ac.at/fabian.levican/), listing the cyclotomic-generating-function paper.
- [MathDB's exact Stanton-fraction entry](https://mathdb.com/p/373779/gatzweiler-krattenthaler-conjecture-on-positivity-of-stanton), which explicitly gives the arbitrary-exponent, $`m\ge n`$ statement and showed no posted solutions when inspected. This secondary entry was used to discover and cross-check scope; the mathematical statement is supported by the two primary papers above.
- [MathDB's separate Gaussian-binomial quotient entry](https://mathdb.com/p/373778/gatzweiler-krattenthaler-positivity-conjecture-for-quotients) and [Stanton entry](https://mathdb.com/p/373777/stanton-s-conjecture-on-symmetric-fake-gaussian-sequences). These are distinct statements and are not claimed solved here.

- **Thomas Prellberg**, *A positivity conjecture of Prellberg and Stanton*, [arXiv:2610.26878](https://arxiv.org/abs/2610.26878), October 2026. Section 5 of the [accessible manuscript transcription](https://www.paperpeel.com/paper/2610.26878) explicitly compares its dilation product with Gatzweiler–Krattenthaler Conjectures 1 and 3 and does not identify either as a specialization. It gives no resolution of the arbitrary-exponent Conjecture 4. This later paper was checked because its positivity result and references could otherwise be mistaken for a resolution of the present target. Direct arXiv full-text retrieval failed during this check, so this comparison relies on the manuscript transcription and indexed section text.


## November q-rious counterexample: distinct hypothesis

**Fabián Levicán-Santibáñez, Atsuro Yoshida, OpenAI GPT-6 Astra and OpenAI GPT-6.1 Sol**, *A q-rious counterexample*, submitted 11 November 2026, [Diderot record](https://projectdiderot.com/papers/ae0f59f5-0adf-4644-8fc3-9962ffac8876), [complete six-page manuscript](https://open-author-production.up.railway.app/files/85660a4f-c31f-4fcf-9e1b-4c01f395bccd.pdf), [supplement](https://github.com/iZafiro/q-rious-counterexample/blob/main/verify-lean.md). The manuscript and supplement were inspected. Theorem 1.1 disproves Warnaar–Zudilin positivity for factorial ratios satisfying Landau's condition; Corollary 6.1 also disproves their unimodality conjecture. The March cyclotomic-generating-function paper appears as reference [5]. Neither document states a resolution of the common-shift Conjecture 4.

The following comparison is our deduction, not a claim made in that preprint. It checks that the displayed prior family does not give an implicit counterexample to the present statement.

Use $`B_m=[2m]_q!/([m]_q!)^2`$, $`N=2^k`$, $`H=4kN\operatorname{lcm}(1,\ldots,N)`$ and $`L=H/(4kN)`$. Its equation (2) defines $`P_k=\prod_{m=1}^{4N}B_m^{e_m}`$, where

```math
e_m/H=\mathbf1_{m=1}-\mathbf1_{m\le N}\mu(m)/m+1/(4kN).
```

Let $`S_N=\sum_{m\le N}\mu(m)/m`$, and write the unique finite Euler product $`P_k=\prod_{j\ge1}(1-q^j)^{E_j}`$. Uniqueness follows by taking the smallest index with nonzero exponent in the quotient of two such representations: that exponent gives a nonzero first coefficient. Direct expansion gives

```math
E_1/H=-1+S_N-1/k,\qquad E_{8N}=L>0,
```

and, for $`4N<j\le8N`$,

```math
E_j=L(4N-\lceil j/2\rceil+1)\le H/(2k).
```

All $`E_j`$ vanish for $`j>8N`$. The preprint's equation (6) gives $`|S_N|\le2C/k^2`$, where $`C=C_2/(\log2)^2`$ comes from its cited analytic estimate. Its proof supplies the sufficient conditions

```math
k\ge24C,\qquad k^2\ge\frac{4C}{1-3/\pi},\qquad
2^k\ge2048,\qquad
\frac{41616C}{k^2}+\frac{62424}{k}<\frac9{100}.
```

These conditions hold for all sufficiently large integer $`k`$; the manuscript does not give a numerical value of $`C`$ or a concrete $`k`$. In particular, these conditions imply $`k>2`$ and $`|S_N|<1/2`$.

Suppose the same $`P_k`$ admitted a common-shift representation with shift $`s\ge n`$ and nonnegative exponents $`a_i`$. Its largest Euler-product index would be $`s+\max\{i:a_i>0\}\le2s`$. Hence $`s\ge4N`$. Since the denominator and numerator index ranges are disjoint, uniqueness also gives $`E_{s+1}=a_1=-E_1`$. But $`-E_1/H=1-S_N+1/k>1/2`$, while $`E_{s+1}/H\le1/(2k)<1/2`$ (or is zero beyond $`8N`$). This is a contradiction.

Thus every member of the prior family satisfying the manuscript's displayed sufficient conditions lies outside the common-shift class. Its November theorem settles a different conjecture and does not supply the five-factor example in this repository. This comparison does not prove an exhaustive absence of other earlier resolutions.

## Search strings

Both available web search engines were used. Queries included:

- `"Gatzweiler" "Krattenthaler" "positivity" proof conjecture`
- `"Gatzweiler" "Krattenthaler" "Conjecture 4" counterexample`
- `"Gatzweiler" "Levicán" "positivity" counterexample`
- `"Stanton" "fake Gaussian" conjecture solved`
- `"Gatzweiler" "Krattenthaler" counterexample`
- `"Gatzweiler" "Conjecture 4" disproof`
- `"fake Gaussian" "counterexample" "2026"`
- `"Gatzweiler" "Krattenthaler" "disproved"`
- `"Gatzweiler" "Krattenthaler" "refuted"`
- `"Gatzweiler" "shifted" positivity`
- `"Gatzweiler–Krattenthaler" "Stanton fractions"`
- `"Gatzweiler" "50" "63"`
- `"Gatzweiler" "33"`
- `"17,18,21,27,30"`
- `"17, 18, 21, 27, 30" polynomial`
- `"50,51,54,60,63"`
- `"50, 51, 54, 60, 63" polynomial`
- `"Gatzweiler" "counterexamples" positivity`

The exact support and numerator searches did not locate a mathematical source for the construction. A 2026 counterexample concerning Billey–Swanson's two-sided majorisation conjecture also appeared in the broad searches; it concerns a different statement and was not taken as resolving this target.

## Acceptance record

The candidate was discovered by imposing cyclotomic polynomiality constraints and a gap at the first numerator exponent, rather than by optimizing a coefficient over random polynomials. The resulting five-factor identity was then verified by exact polynomial division in SymPy and independently by a standard-library integer verifier. A second agent independently checked the original conjecture's assumptions, the cyclotomic support, the degree, and the four negative coefficients. The complete proof in [proof.md](proof.md) does not rely on either implementation.

This is a new unrefereed result in the repository, subject to correction if an earlier resolution or a mathematical error is identified. No assertion of journal acceptance or external expert review is made.
