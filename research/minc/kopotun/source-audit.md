# Kopotun's conjecture

Source and priority audit, 2026-11-21 UTC. This note concerns the eventual radial chord conjecture from Kopotun's 1996 paper, not his separate positive-transform conjecture.

## Exact historical target

Let $`\Omega_n`$ be the doubly stochastic matrices, let $`J_n`$ have every entry $`1/n`$, and let $`\sigma_k`$ be the sum of all order-$`k`$ subpermanents. The conjecture stated in the original publisher abstract is

```math
\forall k\geq3\quad\exists n_k\geq k+1\quad
\forall n\geq n_k\quad\forall A\in\Omega_n\quad\forall\alpha\in[0,1],
```

```math
\sigma_k(\alpha J_n+(1-\alpha)A)
\leq\alpha\sigma_k(J_n)+(1-\alpha)\sigma_k(A).
```

The threshold may depend on $`k`$, but cannot depend on $`A`$ or $`\alpha`$. It must apply to every larger order. Thus an explicit threshold for every degree resolves the full stated quantifier pattern. Extending a finite table of degrees or matrix orders would not do so. No assertion that the optimal threshold equals $`k+1`$ is present in the inspected abstract.

The primary bibliographic source is K. A. Kopotun, *A note on the convexity of the sum of subpermanents*, Linear Algebra and its Applications **245** (1996), 157–169, [DOI 10.1016/0024-3795(94)00228-2](https://doi.org/10.1016/0024-3795(94)00228-2). The [publisher abstract](https://www.sciencedirect.com/science/article/pii/0024379594002282) explicitly states the conjecture and gives the known thresholds $`n_3=4`$ and $`n_4=6`$. It also states global convexity of $`\sigma_2`$ for $`n\geq2`$ and of $`\sigma_3`$ for $`n\geq4`$.

The original full PDF was located at the [author-hosted URL](https://home.cc.umanitoba.ca/~kopotunk/Publications/k-laa.pdf), linked from the paper's bibliographic record. The web reader could not retrieve it because of its robots restriction. A public-file download attempt through the permitted isolated connector failed at the connector level before a file was obtained. Publisher full-text/PDF requests also failed. Consequently the formula and quantifiers above are verified from the primary abstract, but the original internal label “Conjecture 1” and its page number have **not** been independently checked against the complete 1996 text in this lane. A final paper can cite the article and its explicitly conjectural abstract without pretending that the full text was read.

## Exact connection to the Minc list

The current [Conjecture 34 page](https://yair-lavi.com/mincs-list/conjecture-34/index.html) cites Kopotun's 1996 article as reference 4. Its progress paragraph credits a normal-matrix spectral-sector case. It does not reproduce the eventual all-degree conjecture above. The page still describes the full Lih–Wang permanent half-segment inequality as open.

The current [Conjecture 4 page](https://yair-lavi.com/mincs-list/conjecture-4/index.html) concerns Wang's permanent transform and marks that assertion proved. Its bibliography does not directly list the 1996 article. The [Cheon–Wanless 2005 survey](https://users.monash.edu.au/~iwanless/papers/permsurveyLAA.pdf), linked from the Minc-list index, cites Kopotun 1996 as reference 50. Under Conjecture 4 it mentions the positive-transform extension. Under Conjecture 29, printed page 331, it mentions subpermanent convexity and partial results when $`k\leq3`$ or the comparison matrix is $`J_n`$.

Therefore the eventual chord conjecture is a genuine named subsidiary in a paper explicitly linked by a numbered Minc page. It is not a separately numbered Minc problem, nor an additional conjecture literally stated on that page. Its resolution cannot be counted as the full Lih–Wang Conjecture 34 or as a new resolution of the already proved Conjecture 4. Under a rule requiring the exact target to be stated on the live page, this source chain alone does not establish eligibility for that count.

## Statements distinguished in this audit

| Statement | Quantifiers and scope |
|---|---|
| Eventual radial chord conjecture | Every fixed degree, all sufficiently large orders, all $`A`$, full $`\alpha\in[0,1]`$, one comparison endpoint fixed at $`J_n`$ |
| Eventual global convexity | Every fixed degree, all sufficiently large orders, every pair $`A,B\in\Omega_n`$ and their whole segment; stronger than the historical target |
| Lih–Wang Conjecture 34 | Degree equals the matrix order, every order, $`\alpha\in[1/2,1]`$; not supplied by a condition such as $`n\geq16k^2`$ |
| Hwang's 1991 radial convexity conjecture | Permanent on the half-segment between $`J_n`$ and $`(J_n+A)/2`$; again degree equals order |
| Kopotun's 1996 positive transform | $`\sigma_k(A)\geq\sigma_k((nJ_n+A)/(n+1))`$ for all degrees and orders; proved in 2026 |
| Holens–Đoković | A neighboring-degree inequality, false in general; its disproof does not contradict eventual fixed-degree convexity |

In particular, the known nonconvexity of the permanent on $`\Omega_n`$ for general $`n`$ does not refute eventual convexity of a fixed lower degree. The two statements take different limits in $`(n,k)`$.

## Later sources checked

**Hwang 1991.** The [primary publisher abstract](https://www.tandfonline.com/doi/abs/10.1080/03081089108818095), *Convexity of the permanent for doubly stochastic matrices*, Linear and Multilinear Algebra **30**, 129–134, proposes half-segment strict radial convexity of the permanent and proves order three. It does not give an eventual fixed-degree theorem.

**Cheon–Wanless 2005 and Troanca 2008.** The full 2005 survey was inspected. [Troanca's institutional thesis](https://mspace.lib.umanitoba.ca/server/api/core/bitstreams/5f1b99a6-487f-4308-91e8-0ff0c3b4e7b1/content), printed page 35, repeats the eventual radial chord conjecture with its existential order threshold. This corroborates the primary abstract and shows that the statement was still being recorded as conjectural after 1996; it is not evidence of its present status by itself.

**Subramanian–Somasundaram 2016.** *Some Conjectures on Permanents of Doubly Stochastic Matrices*, Journal of Discrete Mathematical Sciences and Cryptography **19**, 997–1011, [DOI 10.1080/09720529.2015.1130813](https://doi.org/10.1080/09720529.2015.1130813). The [authors' institutional abstract](https://www.amrita.edu/publication/some-conjectures-on-permanents-of-doubly-stochastic-matrices/) states a sufficient condition for radial endpoint domination. The original full text was not retrieved. The root-free sufficient condition is restated precisely as Theorem 1.2 in the following 2024 primary paper; it is not an unconditional fixed-degree threshold theorem.

**Udayan–Somasundaram 2024.** The full publisher HTML of [*Lih Wang's and Dittert's conjectures on permanents*](https://www.degruyterbrill.com/document/doi/10.1515/spma-2024-0006/html), DOI 10.1515/spma-2024-0006, was inspected. Its theorems concern order four and a conditional order-six range. Its phrase about Kopotun extending the chord inequality to subpermanents is not a theorem asserting all-degree eventual convexity. No such later theorem is stated there.

**Lavi 2026.** The complete [Kopotun Subpermanent Transform Inequality](https://yair-lavi.com/publications/kopotun-subpermanent-transform-inequality/paper.pdf), dated 11 October 2026 and deposited as [Hexagon 2611.00201v1](https://hexagonmath.org/pdf/2611.00201v1), was inspected. It explicitly identifies the positive-transform statement as Kopotun's Conjecture 2, printed page 167. Its introduction expressly separates the stronger convexity/monotonicity questions from its proved transform comparison. The main theorem does not establish the historical radial chord conjecture or global convexity. Its centered scalar estimate and its cited source, [Marcus–Minc 2609.29262v1](https://arxiv.org/html/2609.29262v1), are prior mathematical tools and must be credited.

The current [author publication list](https://yair-lavi.com/) and the follow-up index [In the wake of AI papers](https://kimballmartin.github.io/ai-wake/) were also checked. The index was used only for discovery, followed by reading the primary papers. Its relevant entries, through 13 November, list the Wang and Kopotun transform papers, not an eventual convexity theorem. Recent searches through 20 November likewise returned no such theorem.

## Public repository overlap requiring explicit credit

Direct GitHub searches found a separate pre-existing [DCPRevere/maths-pub project](https://github.com/DCPRevere/maths-pub/tree/0a1cb0a14fefe85668365d448f9bbaf4dd89d458/combinatorics/permanents/cheon-hwang). The inspected commit is dated 2026-08-12 12:25:31 UTC. Its [release record](https://github.com/DCPRevere/maths-pub/blob/0a1cb0a14fefe85668365d448f9bbaf4dd89d458/RELEASES.md) identifies an archived kit at [DOI 10.5281/zenodo.21902861](https://doi.org/10.5281/zenodo.21902861). The Zenodo landing page itself was unavailable; the repository and its commit metadata were read directly.

Its [main manuscript](https://github.com/DCPRevere/maths-pub/blob/0a1cb0a14fefe85668365d448f9bbaf4dd89d458/combinatorics/permanents/cheon-hwang/paper.tex) claims the Cheon–Hwang inequality for every $`2\leq k<n`$, which is a different row/column-sum functional. No eventual radial or global convexity theorem was found in the inspected manuscript. This audit does not independently certify its main proof.

The accompanying [general-layer verifier](https://github.com/DCPRevere/maths-pub/blob/0a1cb0a14fefe85668365d448f9bbaf4dd89d458/combinatorics/permanents/cheon-hwang/sub-dittert/graded_verify_universal.py) records the scalar centered bound

```math
|\sigma_m(X)|\leq\frac{D_m^2}{m!}\|X\|_F^m,
```

where $`D_m`$ is the derangement number. The bound is stated for every real matrix with zero row and column sums; it is not restricted to matrices of the form $`A-J_n`$ with $`A`$ nonnegative. That unrestricted scope is essential for polarization below. Its doubly stochastic application subsequently uses $`\|A-J_n\|_F^2\leq n-1`$. The companion [ratio/GAP verifier](https://github.com/DCPRevere/maths-pub/blob/0a1cb0a14fefe85668365d448f9bbaf4dd89d458/combinatorics/permanents/cheon-hwang/sub-dittert/graded_verify_rat.py) uses related bounds for eventual normalized-subpermanent inequalities. The [uniform verifier](https://github.com/DCPRevere/maths-pub/blob/0a1cb0a14fefe85668365d448f9bbaf4dd89d458/combinatorics/permanents/cheon-hwang/sub-dittert/graded_verify_uniformG.py) explicitly records the partition expansion, singleton cancellation, derangement mass and graph-sum bound underlying the estimate. Numerical verifiers alone would not establish this universal assertion.

### The prior mathematical proof is accessible

The scripts cite a development note `UNIFORM-G.md`. Complete recursive trees were inspected for both the current commit above, containing 676 entries, and the archived commit `e0573cc`, containing 675 entries. Neither tree was truncated, and neither contains that note. The repository's releases endpoint returned an empty list. Both the Zenodo landing page and its record API were unavailable through the web reader, so no assertion is made about additional files hosted only in Zenodo.

However, the missing note is not a mathematical gap in the available public record. Two files in both Git trees contain complete mathematical exposition before their implementation sections:

- [FinnerOne.lean](https://github.com/DCPRevere/maths-pub/blob/0a1cb0a14fefe85668365d448f9bbaf4dd89d458/combinatorics/permanents/cheon-hwang/leanproj/FinnerOne.lean) explains the signed-permutation expansion of injective index sums, the cancellation of terms with fixed points under zero margins, and the resulting derangement count.
- [FinnerTwo.lean](https://github.com/DCPRevere/maths-pub/blob/0a1cb0a14fefe85668365d448f9bbaf4dd89d458/combinatorics/permanents/cheon-hwang/leanproj/FinnerTwo.lean) gives a full elementary proof of the bipartite graph-sum estimate, using weighted arithmetic–geometric mean and the inequality $`\sum a_i^p\leq(\sum a_i)^p`$ for $`a_i\geq0`$, $`p\geq1`$.

The mathematical prose and the scope of the declaration in [UniformLayer.lean](https://github.com/DCPRevere/maths-pub/blob/0a1cb0a14fefe85668365d448f9bbaf4dd89d458/combinatorics/permanents/cheon-hwang/leanproj/UniformLayer.lean) were inspected for source attribution. No Lean verification, build, proof repair, or implementation work was performed. The proof is assessed as ordinary mathematics independently of the repository's machine-verification claims. The two exposition files have the same respective blob hashes in the archived and current trees.

For clarity, the mathematical chain is as follows. For a function $`i:[m]\to[n]`$, the sum of the signs of permutations $`\tau`$ satisfying $`i\circ\tau=i`$ is one if $`i`$ is injective and zero otherwise. In the noninjective case, a transposition in a repeated fiber pairs the summands with opposite signs. Applying this identity to both the row and column assignments gives a double signed-permutation expansion of $`m!\sigma_m(X)`$. Any fixed point in either permutation forces its term to vanish by a zero-margin condition. There remain $`D_m^2`$ pairs of derangements.

For each surviving pair, its cycle blocks define a bipartite multiplicity graph with $`m`$ edges and every vertex of degree at least two. Write its multiplicities as $`c_{pq}`$ and its row degrees as $`d_p=\sum_qc_{pq}`$. Put $`R_s=\sum_t|x_{st}|^2`$. Summing the column labels first and applying the stated weighted mean inequality gives

```math
\begin{aligned}
\sum_{i,j}\prod_{p,q}|x_{i_pj_q}|^{c_{pq}}
&\leq\sum_i\prod_pR_{i_p}^{d_p/2}\\
&=\prod_p\sum_s R_s^{d_p/2}
\leq\prod_p\left(\sum_sR_s\right)^{d_p/2}
=\|X\|_F^m.
\end{aligned}
```

The first inequality uses the column degrees being at least two; the second uses $`d_p/2\geq1`$. Taking absolute values in the signed expansion proves exactly the advertised scalar bound. This confirms that its unrestricted centered-matrix scope is justified by the accessible prior exposition.

### Polarization already implies eventual global convexity

The following is our explicit deduction from the prior bound, rather than a claim that the earlier project stated a convexity theorem. It shows that changing the target from radial to global convexity does not remove the prior overlap.

Let $`V_n`$ be the real vector space of zero-margin matrices. More generally, suppose

```math
|\sigma_j(X)|\leq C_j\|X\|_F^j\qquad(X\in V_n),
```

with $`C_j`$ independent of $`n`$. The earlier result supplies $`C_j=D_j^2/j!`$. Let $`T_j`$ be the symmetric $`j`$-linear polarization of $`\sigma_j`$ on $`V_n`$. The real polarization identity is

```math
T_j(Y_1,\ldots,Y_j)=\frac1{2^jj!}
\sum_{\varepsilon\in\{-1,1\}^j}
\left(\prod_i\varepsilon_i\right)
\sigma_j\left(\sum_i\varepsilon_iY_i\right).
```

For unit Frobenius-norm arguments, the argument of each polynomial has norm at most $`j`$. Rescaling each argument then gives

```math
|T_j(Y_1,\ldots,Y_j)|\leq
\frac{C_jj^j}{j!}\prod_i\|Y_i\|_F.
```

Consequently, for any $`X,D\in V_n`$,

```math
|D^2\sigma_j(X)[D,D]|\leq
K_j\|X\|_F^{j-2}\|D\|_F^2,
\qquad K_j=\frac{C_jj^j}{(j-2)!}.
```

Fix $`k\geq3`$. Put $`S_{n,k}=k!\binom nk^2n^{-k}`$ and $`f_{n,k}=\sigma_k/S_{n,k}`$. The exact centered expansion is

```math
f_{n,k}(J_n+X)=\sum_{j=0}^k a_{n,k,j}\sigma_j(X),
\qquad a_{n,k,j}=\frac{n^j(k)_j}{(n)_j^2},
```

where $`(a)_j`$ is a falling factorial. On $`V_n`$, $`\sigma_1=0`$ and $`\sigma_2(X)=\|X\|_F^2/2`$. For $`A\in\Omega_n`$, the centered matrix $`X=A-J_n`$ satisfies $`\|X\|_F^2\leq n-1`$. Thus

```math
D^2f_{n,k}(A)[D,D]\geq
\frac{k(k-1)}{(n-1)^2}(1-R_{n,k})\|D\|_F^2,
```

where

```math
R_{n,k}=\sum_{j=3}^kK_j
\frac{n^{j-2}(k-2)_{j-2}}{(n-2)_{j-2}^2}
(n-1)^{(j-2)/2}.
```

For fixed $`k`$, the $`j`$th term is $`O_k(n^{-(j-2)/2})`$, uniformly over $`A`$ and $`D`$. Therefore $`R_{n,k}\to0`$. No interchange of an infinite degree sum and a limit is involved: there are only $`k-2`$ terms.

An explicit, although very large, threshold follows directly. For $`n\geq2k`$, every factor in $`(n-2)_{j-2}`$ is at least $`n/2`$. Define

```math
M_k=\sum_{j=3}^k4^{j-2}(k-2)_{j-2}K_j.
```

Then $`R_{n,k}\leq M_k/\sqrt n`$. Hence all

```math
n\geq\max\{2k,\lceil4M_k^2\rceil\}
```

satisfy the uniform Hessian bound

```math
D^2\sigma_k(A)[D,D]\geq
S_{n,k}\frac{k(k-1)}{2(n-1)^2}\|D\|_F^2.
```

Integration along any segment of $`\Omega_n`$ proves global strict convexity for all sufficiently large orders. Taking one endpoint to be $`J_n`$ yields the full quantifier pattern of Kopotun's historical conjecture. This deduction requires no newer tensor isotropy estimate. The campaign's $`16k^2`$ argument gives a much smaller sufficient threshold and a separate direct proof, but its existential radial and global conclusions already follow from the accessible prior scalar bound.

Another returned primary research note, [Carptopus's Lih–Wang endpoint and cycle-product manuscript](https://github.com/Carptopus/MathExplore-Notes/blob/6e96176abbbb884906b2235b418d2315908bb5bd/research/lih-wang-endpoint-and-cycle-products/manuscript.md), was inspected. Its endpoint gate and cycle-forest results are structurally restricted permanent theorems. It explicitly leaves the full Lih–Wang assertion open and does not state eventual all-degree/global subpermanent convexity.

## Search coverage and bounded conclusion

Both web engines were used for exact title, DOI, author and conjecture searches; variants included “radial convexity,” “global convexity,” “strictly convex,” “Hessian,” “fixed degree,” “sufficiently large,” and “asymptotic,” together with subpermanent terminology. Recent searches used 2026 and fourteen-day filters. Direct GitHub code queries included `Kopotun convexity`, `Kopotun conjecture`, the exact DOI, `subpermanent radial convexity`, `subpermanent Hessian`, and repository-scoped queries for the concrete mathematical hits. Search-index lag and inaccessible old full texts remain limitations.

No earlier source explicitly stating the full eventual chord or global convexity conclusion was located. However, an accessible August 2026 proof of a general centered scalar bound already has both conclusions as direct consequences, as shown above. This is substantial prior mathematical overlap, not a missing citation that can be avoided by using the word “global.” Under the user's rule excluding threshold improvements and already resolved assertions, the proposed $`16k^2`$ theorem remains uncounted research; it must not be registered as a newly solved conjecture.

The exact historical quantifiers are supported by the original publisher abstract. The complete 1996 text remains an access limitation, and the original 2016 full text was also not obtained. Their inaccessible portions should not be described as inspected. The exact Minc-page eligibility caveat remains independent of the priority issue. This audit is not a claim that the entire literature has been exhaustively certified, nor a resolution of any additional numbered Minc-list problem.
