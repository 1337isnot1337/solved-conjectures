# Complement matching averages for Minc's sixth conjecture

Research checkpoint, 20 November 2026 (America/Chicago). **Conjecture 6 remains open here.**

This note records an obstruction to proving a complement-matching comparison by continuous monotonicity. It does not disprove the proposed endpoint comparison, and it does not establish a property of a globally minimizing matrix. The graph family is the published Jerrum construction; no novelty is claimed for that construction or its matching counts. The [independent review](c6_complement_average_review.md) verifies the counting, switching multiplicities and derivative calculation.

## The comparison still needed

Let `A` be an `n` by `n` binary matrix with every row and column sum equal to `k`, where `1<=k<n`. Write `C=J-A`, with `J` the all-ones matrix, and let `P` be uniformly distributed over the perfect matching matrices supported by `C`.

For a global permanent minimizer `A` in this class, finding one `P` such that


```math
\mathop{\mathrm{per}}(A+P)
 \le \left(\frac{k+1}{k}\right)^n\mathop{\mathrm{per}}A
\tag{1}
```


would prove the next comparison in Conjecture 6. A sufficient stronger statement is the corresponding upper bound on the uniform expectation.

The exact average is already recorded in the repository's [whole-matching replacement note](matching_replacement_research.md):


```math
\mathbb E\mathop{\mathrm{per}}(A+P)
 =\frac1{\mathop{\mathrm{per}}C}
   \sum_{\substack{S,T\subseteq[n]\\|S|=|T|}}
      \mathop{\mathrm{per}}A[S,T]\,
      \mathop{\mathrm{per}}C[S,T]\,
      \mathop{\mathrm{per}}C[S^c,T^c].
\tag{2}
```


Here and below an empty permanent is one. For fixed `S,T`, an admissible permutation mapping `S` to `T` can be chosen in exactly the product of the two complementary `C` permanents. There is no additional factorial or binomial coefficient.

No upper bound on (2) proving (1) has been obtained. The calculation below also does not refute that bound.

## A uniform marginal bound in a dense complement

**Lemma.** Suppose `C` is a binary matrix of order `n`, with at most `k` zero entries in each row and column, and has a perfect matching. Fix an entry `c_ij=1`. If `n>2k+2`, a uniform perfect matching `P` of `C` satisfies


```math
\Pr(P_{ij}=1)
 \ge \frac{n-2k-2}{(n-1)(n-2)+n-2k-2}.
\tag{3}
```


In particular, if `n>=4k+4`, then


```math
\Pr(P_{ij}=1)>\frac1{2n}.
\tag{4}
```


**Proof.** Partition the admissible permutations into `U`, those containing `(i,j)`, and `V`, those not containing it. For `pi` in `V`, put `i'=pi^{-1}(j)` and `j'=pi(i)`. Thus `i'!=i` and `j'!=j`.

Choose a row `ell` different from `i,i'` such that both


```math
c_{i',\pi(\ell)}=c_{\ell,j'}=1.
```


At most `k` rows fail the first condition, and at most `k` fail the second. Excluding `i,i'` leaves at least `n-2k-2` choices. Replace the three matching edges on rows `i,i',ell` by


```math
(i,j),\qquad (i',\pi(\ell)),\qquad(\ell,j').
```


This produces an element of `U`. From the resulting permutation and the ordered pair `(i',ell)`, the original permutation is uniquely reconstructed. Each element of `U` therefore receives at most `(n-1)(n-2)` such triples. Consequently


```math
|V|(n-2k-2)\le |U|(n-1)(n-2),
```


which proves (3). For `n>=4k+4`, the numerator in (3) is at least `n/2`, while its denominator is `n^2-2n-2k<n^2`. This proves (4). The argument also shows that `U` is nonempty. $`\square`$

## Failure of continuous monotonicity for the uniform average

Define


```math
H_A(t)=\mathbb E\mathop{\mathrm{per}}\!\left(\frac{A+tP}{k+t}\right),
 \qquad 0\le t\le1.
\tag{5}
```


This uses one fixed uniform distribution over complement matchings; it is not resampled from a `t`-dependent graph. If `G_ij=per A(i|j)` is a permanental cofactor, direct differentiation gives


```math
\frac{H_A'(0)}{H_A(0)}
 =\frac{\sum_{i,j}\Pr(P_{ij}=1)G_{ij}}
        {\mathop{\mathrm{per}}A}-\frac nk.
\tag{6}
```


**Proposition.** For each fixed integer `k>=3`, there are arbitrarily large connected binary `k`-regular matrices `A` for which `H_A'(0)>0`.

**Proof.** Use Jerrum's graph `G_{k,f}`, as presented in Wanless [2, Example 1, p. 275]. Its two vertex classes are


```math
\{s\}\cup\{u_{a,b,c}:1\le a,b\le k,\ 1\le c\le f\},
 \qquad
 \{t\}\cup\{v_{a,b,c}:1\le a,b\le k,\ 1\le c\le f\}.
```


For each `a,c`, insert all edges between the corresponding `k` left and `k` right vertices except `(u_{a,1,c},v_{a,1,c})`. Add the chain edges


```math
(s,v_{a,1,1}),\quad
 (u_{a,1,c},v_{a,1,c+1})\ (1\le c\lt f),\quad
 (u_{a,1,f},t)
```


for each `a`. This is a connected simple `k`-regular bipartite graph with `n=k^2 f+1` vertices on each side. Let `A` be its biadjacency matrix. In particular `a_st=0`.

Put `b=(k-1)!` and `a=(k-1)b`. A block whose two distinguished vertices are matched externally has `b` internal perfect matchings; a block with no external matching edges has `a`.

In any perfect matching of the whole graph, a block has its incoming chain edge selected if and only if its outgoing chain edge is selected: its remaining left and right vertex counts must agree. Thus exactly one of the `k` chains is active from `s` to `t`. The other chains use no chain edges. This proves


```math
\mathop{\mathrm{per}}A=k\,b^f a^{(k-1)f}.
\tag{7}
```


After deleting `s,t`, no chain can be active, and all `kf` blocks use their `a` internal matchings. Therefore


```math
G_{st}=a^{kf},\qquad
 \frac{G_{st}}{\mathop{\mathrm{per}}A}=\frac{(k-1)^f}{k}.
\tag{8}
```


These are the published counts, with a block-balance proof included to fix the indexing. The exponent in the cofactor ratio is **`f`**, not `kf`.

For all sufficiently large `f`, we have both `n>=4k+4` and `(k-1)^f>2n^2`. Apply (4) to the complement edge `(s,t)`. All cofactors are nonnegative, so (6) gives


```math
\frac{H_A'(0)}{H_A(0)}
 >\frac{(k-1)^f}{2nk}-\frac nk>0.
\tag{9}
```


The two conditions eventually hold because `k` is fixed and `n=k^2 f+1`. $`\square`$

Thus the normalized uniform average cannot be proved decreasing throughout `[0,1]` for arbitrary regular binary matrices. The proposition does not decide whether its value at `t=1` is at most its value at `t=0`. It also does not show that the obstruction occurs at a global minimizer in the class required by Conjecture 6.

For comparison, a distribution with barycenter `E P=C/(n-k)` has


```math
H_A'(0)=\frac{k^{-n}}{n-k}
 \left(\sigma_{n-1}(A)-\frac{n^2}{k}\mathop{\mathrm{per}}A\right).
\tag{10}
```


Such distributions exist by a one-factorization of the regular complement. Their initial derivative is governed directly by the already disproved Holens–Đoković inequality. Uniform perfect matchings do not generally have this barycenter; the switching lemma is what justifies the separate assertion about the uniform law.

## Prior results and limits of the checkpoint

Wanless [1, pp. 61–62] already disproved a pointwise inclusion comparison: for the cyclic permutation matrix `S`, `A=I+S` and `B=I+S+S^2` satisfy


```math
\mathop{\mathrm{per}}A=2,\qquad
 \mathop{\mathrm{per}}B=L_n+2,
```


where `L_n` is the Lucas number, and `per(B/3)>per(A/2)` for every `n>=9`. The starting `A` is a degree-two global minimizer. This is prior art, not a new obstruction from this campaign. It excludes a claim about every complement matching, while (1) asks for one matching.

The argument above adds a different limitation to the present proof route: even the uniform complement average has the wrong initial derivative on an explicit infinite family. It is an elementary consequence of the published Jerrum family and a switching bound, with no claim to independent prior-art novelty. No new case of Conjecture 6 is proved or disproved.

The next missing statement is exactly the endpoint inequality for (2), restricted at least to globally minimizing `A`, or a different distribution for which that endpoint inequality can be proved. A positive initial derivative does not by itself obstruct either possibility. The single exceptional cofactor also does not yield an endpoint counterexample: its exponential rate `log(k-1)/k^2` is smaller than `log(1+1/k)` for every `k>=3`.

## Sources and retrieval

1. I. M. Wanless, *On Minc's sixth conjecture*, Linear and Multilinear Algebra **55** (2007), 57–63, DOI [10.1080/03081080600562670](https://doi.org/10.1080/03081080600562670). [Author-hosted complete journal PDF](https://users.monash.edu.au/~iwanless/papers/mincconj6LAMA.pdf). The complete seven-page primary paper was retrieved and read, including the inclusion counterexample on pp. 61–62.
2. I. M. Wanless, *The Holens–Đoković conjecture on permanents fails!*, Linear Algebra and its Applications **286** (1999), 273–285, DOI [10.1016/S0024-3795(98)10177-5](https://doi.org/10.1016/S0024-3795(98)10177-5). [Author-hosted complete journal PDF](https://users.monash.edu.au/~iwanless/papers/HolDjokLAA.pdf). The ordinary PDF text layer is badly damaged. Page 275 was separately rendered and OCRed; the construction and the two counts used here were then independently derived by block balance. Search excerpts contain unreliable formula extraction and were not used to set the exponents.
3. [Current Conjecture 6 statement](https://yair-lavi.com/mincs-list/conjecture-6/index.html), accessed 21 November 2026. It marks the full conjecture open and records partial sparse, dense, and fixed-degree progress. The present checkpoint does not change that status.

Searches for the complement-matching average and Minc's sixth conjecture did not locate a published full endpoint comparison. This is a bounded route audit, not a claim that the elementary switching application above has no prior occurrence.
