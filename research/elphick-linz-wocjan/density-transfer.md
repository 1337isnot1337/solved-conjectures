# Fractional-density blowups and the weighted obstruction

Date: 2026-11-24. Continuation of [issue #314](https://github.com/1337isnot1337/solved-conjectures/issues/314) and the [weighted obstruction](weighted-obstruction.md). This is a reduction and a limitation of the displayed certificate, **not a resolution of the Elphick–Linz–Wocjan conjecture**. Priority of the elementary reductions is not asserted.

## Equivalent fractional-density formulation

Write $`F_k(M)=\sum_{i=1}^k \max(\lambda_i(M),0)^2`$ for a real symmetric matrix $`M`$, padding by zero if necessary. The original conjecture is $`F_{\omega(G)}(A_G)\le (1-1/\omega(G))\|A_G\|_F^2`$ for simple graphs. See Elphick, Linz and Wocjan, [Two conjectured strengthenings of Turán's theorem](https://arxiv.org/abs/2101.05229), LAA 684 (2024), 23–36, doi:10.1016/j.laa.2023.12.010. The $`K_{r+1}`$-free formulation also appears in the literature (e.g. [A Brualdi–Hoffman–Turán problem on cycles](https://www.sciencedirect.com/science/article/pii/S0195669824000519)).

**Proposition.** The original conjecture is equivalent to the following assertion for every integer $`r\ge2`$: if $`C`$ is a symmetric matrix with entries in $`[0,1]`$, zero diagonal and $`K_{r+1}`$-free support, and $`D=\mathop{\mathrm{diag}}(d_1,\ldots,d_n)`$ with $`d_i\ge0`$, then
```math
 F_r(DCD)\ \le\ (1-1/r)\sum_{i,j} d_i^2d_j^2 C_{ij}. \tag{1}
```
The right side is linear in edge density, not the squared Frobenius norm of the compressed matrix.

**Proof.** First suppose the original conjecture. Let $`H`$ have clique number at most $`r`$, and form the uniform independent-set blowup $`H^{(t)}`$ with $`t`$ vertices per vertex of $`H`$. Its nonzero adjacency eigenvalues are $`t`$ times those of $`H`$, by compression to the subspace constant on each twin class. The disjoint union $`H^{(t)}\sqcup K_r`$ has clique number exactly $`r`$. Therefore
```math
 t^2 F_r(A_H)
 \le F_r(A_{H^{(t)}\sqcup K_r})
 \le (1-1/r)(t^2\|A_H\|_F^2+r(r-1)).
```
Divide by $`t^2`$ and let $`t`$ tend to infinity. Thus the conjecture implies the same bound with parameter $`r`$ for every $`K_{r+1}`$-free $`H`$, including those with clique number smaller than $`r`$.

For binary $`C=A_H`$, an independent-set blowup with integer class sizes $`p_i`$ has compressed adjacency $`\mathop{\mathrm{diag}}(\sqrt{p_i})C\mathop{\mathrm{diag}}(\sqrt{p_i})`$ and squared Frobenius norm $`\sum_{i,j}p_i p_j C_{ij}`$. Applying the preceding bound proves (1) when $`d_i^2=p_i`$. Homogeneity and approximation by nonnegative rational numbers extend it to all $`d_i\ge0`$; zero class sizes can equivalently be treated by deleting vertices or taking limits.

For arbitrary fractional $`C`$, independently keep each unordered edge $`ij`$ with probability $`C_{ij}`$. The resulting binary symmetric random matrix $`A`$ has $`K_{r+1}`$-free support in every outcome and expectation $`C`$. The function $`F_r`$ is convex on symmetric matrices: the identity
```math
 F_r(M)=\sup_{\substack{X\succeq0\\\mathop{\mathrm{rank}}X\le r}}
 (2\langle M,X\rangle-\|X\|_F^2)
```
follows by diagonalizing $`M`$, using the Ky Fan variational principle on the eigenbasis of $`X`$, and optimizing its at most $`r`$ nonnegative eigenvalues. Equality is attained by retaining the largest at most $`r`$ positive eigenvalues of $`M`$ with their eigenvectors. A supremum of affine functions is convex. Hence Jensen's inequality and the binary case give
```math
 F_r(DCD)\le \mathbb E F_r(DAD)
 \le (1-1/r)\sum_{i,j}d_i^2d_j^2 \mathbb E A_{ij},
```
as required. Conversely, taking $`D=I`$, $`C=A_G`$, $`r=\omega(G)`$ recovers the original conjecture for graphs with an edge; edgeless graphs are immediate.

In particular, if a weighted matrix $`B`$ is represented as $`DCD`$ with these constraints, then the sufficient strict-violation test in (1) is
```math
 F_r(B)>(1-1/r)\sum_{i,j}d_i d_j B_{ij}.
```
Thus a successful fractional-density counterexample would imply a genuine simple-graph counterexample. This proposition does not assert that all weighted Frobenius counterexamples pass the test.

## Exact impossibility of this transfer for the ten-vertex certificate

Let $`B`$ be the explicit integer matrix in the previous note. Write $`p_{ij}=d_i d_j`$. Any representation $`B=DCD`$ with $`0\le C_{ij}\le1`$ requires $`p_{ij}\ge B_{ij}`$ on every nonzero edge. On the cycle $`0,4,1,6,0`$ we have
```math
 p_{04}p_{16}=p_{14}p_{06}\ge100\cdot102=10200,
```
and the edge weights $`B_{04}=15`$, $`B_{16}=4`$, $`B_{14}=100`$, $`B_{06}=102`$. Consequently
```math
 15p_{04}+4p_{16}\ge2\sqrt{60\cdot10200}>1564,
```
since $`782^2=611524<612000`$. On all other edges we use $`p_{ij} B_{ij}\ge B_{ij}^2`$. Counting each edge in both directions yields
```math
 \sum_{i,j}d_i d_j B_{ij}>
 \|B\|_F^2+2(1564-15^2-4^2)=281528.
```

Independently, the exact rational LDL decomposition of $`B-tI`$ gives the following nonzero pivot sign strings:

| $`t`$ | Pivot signs | Positive eigenvalues of $`B-tI`$ |
|---:|:---|---:|
| 339 | `----------` | 0 |
| 193 | `-----+----` | 1 |
| 188 | `-----+---+` | 2 |

The decomposition is obtained by ordinary symmetric elimination with no pivoting; no pivot vanishes. Congruence preserves inertia, so Sylvester's law proves $`\lambda_1(B)<339`$, $`\lambda_2(B)<193`$, $`\lambda_3(B)<188`$, respectively. This implies
```math
 F_3(B)<339^2+193^2+188^2=187514.
```
Combining gives
```math
 3F_3(B)<562542<563056<
 2\sum_{i,j}d_i d_j B_{ij}.
```
The middle gap is 514. Thus this matrix cannot violate (1) at $`r=3`$, for **any** class-size scaling $`D`$ and any feasible fractional densities $`C`$, even without imposing the clique condition on $`C`$. It also cannot do so for larger $`r`$ if only the three leading positive eigenvalues are used.

This rules out the direct block-density transfer of this certificate. It does **not** rule out a simple-graph counterexample from a different matrix, a different construction, or extra eigenvalues in a finite graph beyond the compressed quotient. The earlier weighted counterexample and failure of complete positivity remain valid.

The companion script [check_density_transfer.py](check_density_transfer.py) verifies the certificate, exact inertia and rational inequalities using only Python's standard library. A local exact-arithmetic run on 2026-11-24 returned pivot counts $`0,1,2`$ and the gap 514. No floating-point eigenvalues are used.
