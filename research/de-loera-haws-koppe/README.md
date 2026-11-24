# Strict log-concavity for rank-three sparse paving matroids

Tracking issue: [#355](https://github.com/1337isnot1337/solved-conjectures/issues/355).

**Status: partial progress on the De Loera–Haws–Köppe conjecture, not a general resolution.** The theorem concerns the Ehrhart numerator of the matroid base polytope, not its Ehrhart polynomial, Kazhdan–Lusztig polynomial, or Chow polynomial.

**Theorem.** The Ehrhart `h*` coefficients of every rank-three sparse paving matroid, or its dual, are positive on their support and strictly log-concave at all internal indices. In particular, they are unimodal.

## Proof

For a matroid with `n` elements and rank three, if `n ≤ 5` the corank is at most two. Fu's [Theorem 1.2](https://arxiv.org/html/2609.37439v2) gives positivity on the support and strict log-concavity in corank two; the cases of corank at most one are unimodular simplices or points. The map `x → 1−x` identifies the base polytopes of dual matroids as affine lattice polytopes and preserves the Ehrhart numerator.

Assume `n ≥ 6`. A rank-three sparse paving matroid is simple, and every nonbasis triple is a circuit-hyperplane. It is connected: if not, it has a rank-one summand, which is a singleton since the matroid is simple. Three elements in its complementary summand union, of rank two, then form a nonbasis triple. That set of at least five elements contains two triples with two points in common, contradicting sparse paving (distinct circuit-hyperplanes cannot intersect in two points). Simplicity here also rules out loop summands. So its base polytope has dimension `n−1`.

Let `λ` be the number of circuit-hyperplanes. No pair of ground elements occurs in two of the triples, whence `0 ≤ λ ≤ L=n(n−1)/6`. Let `A(z)=Σ A_j z^j` be the Ehrhart numerator of the hypersimplex `Δ(3,n)`, and set `H(z)=Σ H_j z^j` for the matroid under consideration. Ferroni's [Corollary 4.10](https://arxiv.org/pdf/2105.04465) gives `E_M(t)=E_U(t)−λ E_{T_{3,n}}(t−1)`; by [Corollary 1.7 of Ferroni's minimal matroid paper](https://doi.org/10.1007/s00454-021-00313-4), the connected minimal matroid's numerator is `1+2(n−4)z+binom(n−4,2)z²`. All three dimensions are `n−1`. Since the Ehrhart counts agree at `t=0`, taking generating functions thus gives

```
H_j = A_j − λ B_j,  where
B_1=1, B_2=2(n−4), B_3=binom(n−4,2), B_j=0 otherwise.
```

The rank-three hypersimplex numerator `A` has only real roots by Adiprasito–Zhang, [Theorem 1.1, Eventual unimodality of the hypersimplex](https://hal.science/hal-05747878v1); the precise rank-three scope is also recorded in [Fu, Introduction](https://arxiv.org/html/2609.37439v2#S1). Its coefficients are nonnegative with constant term 1, so all nonzero roots are negative. Consequently the coefficients on its support are positive and strictly log-concave by Newton's inequalities. The degree of `A` is at least 4: the least positive `t` giving an interior lattice point of `tΔ(3,n)` is `ceil(n/3)` for `n≥6`, by the conditions `1≤x_i≤t−1` and `Σx_i=3t`; thus the degree is `n−ceil(n/3)≥4`. For internal indices `j≥4`, the log-concavity inequality for `H` follows from the one for `A`, since `H_j=A_j`, `H_{j+1}=A_{j+1}` and `0≤H_{j−1}≤A_{j−1}`. The argument below supplies positivity of `H_1,H_2,H_3`.

At `j=1,2,3` use the uniform bound `H_j≥A_j−LB_j`. We prove
```
A_j−LB_j>0   and   (A_j−LB_j)^2−A_{j−1}A_{j+1}>0.
```
Then `H_j² > A_{j−1}A_{j+1} ≥ H_{j−1}H_{j+1}`, as required. To prove the two stated polynomial inequalities in `n`, inclusion-exclusion and coefficient extraction give
```
E_U(t) = Σ_{i=0}² (−1)^i binom(n,i) binom(n−1+(3−i)t−i, (3−i)t−i),
A_j = Σ_{i=0}^j (−1)^i binom(n,i) E_U(j−i).
```
A binomial with negative lower index is zero. The summation for `E_U(t)` subtracts vectors violating one or two coordinate bounds, and violating three would require sum greater than `3t`. Put `s=n−6`. Using `binom(s+a,b)=Π_{i=0}^{b−1}(s+a−i)/(i+1)`, the resulting six polynomials have the following strictly positive coefficient lists, in increasing powers of `s`. Each row is multiplied by the indicated positive denominator.

| `j` | expression | denominator | coefficients |
|---|---|---:|---|
|1| `A_j−LB_j` |6| 54, 57, 14, 1 |
|1| `(A_j−LB_j)^2−A_{j−1}A_{j+1}` |720| 32400, 83316, 72296, 27855, 5365, 509, 19 |
|2| `A_j−LB_j` |720| 11520, 27324, 19804, 5985, 835, 51, 1 |
|2| `(A_j−LB_j)^2−A_{j−1}A_{j+1}` |10886400| 653184000, 5829425280, 14392684656, 16595277072, 10774555336, 4307928240, 1111837823, 189116361, 21187698, 1528230, 67271, 1617, 16 |
|3| `A_j−LB_j` |362880| 3265920, 10098144, 12086712, 7227044, 2378250, 452865, 50148, 3066, 90, 1 |
|3| `(A_j−LB_j)^2−A_{j−1}A_{j+1}` |7242504192000| 325912688640000, 2281660022476800, 6746264044369920, 11352501909608832, 12269255770291680, 9078761838365424, 4780726840156336, 1837172528702784, 523933461743790, 112047841126683, 18055897094202, 2190586132836, 198684769180, 13278168162, 638327508, 21268548, 463350, 5931, 34 |

The companion [exact checker](check_rank3_sparse.py) generates these lists using Python's standard-library rational arithmetic. The check is a finite polynomial identity certificate applying to every `n≥6`, not a bounded search over ground-set sizes. This finishes the proof.

## Attribution and limitations

De Loera, Haws and Köppe ask for general unimodality in [Conjecture 2(A)](https://math.ucdavis.edu/~deloera/researchsummary/Matroidpolys.pdf). Their independent Ehrhart positivity conjecture is false by [Ferroni](https://arxiv.org/abs/2105.04465). Fu's recent counterexamples concern Ferroni's stronger real-rootedness conjecture and do not disprove unimodality. Ferroni reports a computational check of stronger real-rootedness for sparse paving matroids on at most 35 elements. A [separate 2026 public preprint](https://github.com/Carptopus/MathExplore-Notes) claims eventual real-rootedness of all paving matroids of each fixed rank, with unspecified thresholds. Neither statement alone establishes the all-size rank-three sparse paving conclusion here. The substantive extra step is the all-size estimate preserving strict log-concavity across all coefficients changed by sparse paving relaxation. No general rank-three result for non-sparse-paving matroids, real-rootedness claim for rank-three sparse paving matroids, or priority claim is made.
