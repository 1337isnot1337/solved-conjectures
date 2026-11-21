# Lyapunov determinant factorization: independent algebra review

Status: research only. The complementary-minor identity and nondivisibility argument below pass mathematical review. The alleged named exact-product conjecture could not be found in any of the three cited primary versions. This note is not a conjecture resolution and is not included in the results collection.

## Statement and conventions

Let $`p\geq1`$, $`m=p(p+1)/2`$, and $`r=p(p-1)/2`$. Let $`\Sigma`$ be a generic symmetric $`p\times p`$ matrix. In fixed coordinate orders define the $`m\times p^2`$ matrix $`A(\Sigma)`$ by

```math
A(\Sigma)\mathop{\mathrm{vec}}(M)=\mathop{\mathrm{vech}}(M\Sigma+\Sigma M^T).
```

Let $`K_{ij}=E_{ij}-E_{ji}`$, for $`i\lt j`$, and let $`H(\Sigma)`$ have columns $`\mathop{\mathrm{vec}}(\Sigma K_{ij})`$. For every set $`E`$ of $`m`$ matrix coordinates, there is an orientation sign $`\varepsilon_E\in\{1,-1\}`$ such that

```math
\det A(\Sigma)_{\cdot,E}
 =\varepsilon_E\,2^p\det\Sigma\,
   \det H(\Sigma)_{E^c,\cdot}.
```

The orientation sign must be reconciled with the source's edge order, row order, and signs of the skew basis. An unsigned identity cannot be inferred without that reconciliation. If all row/column orders are fixed and $`R`$ below has determinant $`\delta2^r`$, then with one-based coordinate indices

```math
\varepsilon_E=\delta^{-1}
 (-1)^{m(m+1)/2+\sum_{e\in E}e}.
```

## Complementary-minor proof

Choose the symmetric basis $`E_{ii}`$ and $`E_{ij}+E_{ji}`$ in the order induced by the fixed, unscaled $`\mathop{\mathrm{vech}}`$ coordinates, followed by the skew basis $`K_{ij}`$ in its fixed order. Let $`R`$ be the change-of-basis matrix to the fixed coordinates of all matrices. Each off-diagonal pair contributes a block of determinant $`\pm2`$, so $`\det R=\delta2^r`$ for a fixed sign $`\delta`$.

Let $`B`$ consist of the images of these basis matrices under left multiplication by $`\Sigma`$, with symmetric columns first. Then

```math
B=[\Sigma\,\mathrm{Sym},H],\qquad
\det B=\delta2^r(\det\Sigma)^p.
```

On symmetric matrices the composition with $`A`$ is $`S\mapsto2\Sigma S\Sigma`$; on skew matrices it vanishes. Thus $`AB=[T,0]`$. The determinant of congruence $`S\mapsto\Sigma S\Sigma`$ on the symmetric matrices is $`(\det\Sigma)^{p+1}`$. This follows first for diagonal $`\Sigma`$, where the eigenvalues are $`\lambda_i^2`$ and $`\lambda_i\lambda_j`$, and then for real symmetric $`\Sigma`$ by orthogonal diagonalization; polynomial identity extends it to all symmetric indeterminates. Consequently

```math
\det T=2^m(\det\Sigma)^{p+1}.
```

For invertible $`\Sigma`$, $`A=T[I_m,0]B^{-1}`$. Jacobi's complementary-minor identity applied to the rows $`1,\ldots,m`$ and columns $`E`$ of $`B^{-1}`$ gives the displayed factorization, since $`m-r=p`$. It holds for every symmetric $`\Sigma`$ by polynomial continuation. This argument neither assumes that the graph is simple nor needs an invertibility assertion for the selected minor.

## Nondivisibility for complete simple directed graphs

Assume $`E`$ contains every diagonal coordinate and exactly one of each off-diagonal transposed pair. Choose $`u\in\mathbb R^p`$ with all $`u_i\ne0`$, and put

```math
Q=I-\frac{uu^T}{u^Tu}.
```

Then $`\det Q=0`$ for $`p\geq1`$. Suppose that $`H(Q)_{E^c,\cdot}`$ has a nonzero kernel vector, represented by a skew-symmetric matrix $`K`$. Then $`M=QK`$ is supported on $`E`$. As $`E`$ has no off-diagonal transposed pair,

```math
\mathop{\mathrm{tr}}(M^2)=\sum_i M_{ii}^2\geq0.
```

Since $`Q^2=Q`$ and $`Q^T=Q`$, cyclicity of trace gives

```math
\mathop{\mathrm{tr}}(M^2)
 =\mathop{\mathrm{tr}}((QKQ)^2)
 =-\lVert QKQ\rVert_F^2\leq0.
```

Both sides therefore vanish: $`M_{ii}=0`$ for all $`i`$ and $`QKQ=0`$. Write $`w=Ku/(u^Tu)`$; skew symmetry gives $`w\perp u`$. Decomposing $`\mathbb R^p=u^\perp\oplus\mathbb Ru`$ and using $`QKQ=0`$ yields

```math
K=w u^T-u w^T,\qquad QK=w u^T.
```

The diagonal condition says $`w_i u_i=0`$ for every $`i`$, hence $`w=0`$ and $`K=0`$, a contradiction. Thus the square matrix $`H(Q)_{E^c,\cdot}`$ is nonsingular. In particular, its determinant is not divisible by $`\det\Sigma`$, because evaluating any such divisibility identity at $`\Sigma=Q`$ would force it to vanish. The $`p=1`$ case uses the conventional empty determinant $`1`$ and is immediate.

Since the generic symmetric determinant is irreducible, the displayed factorization and this nondivisibility also show that its multiplicity is exactly one for a complete simple directed graph.

## Source audit: no attributable exact-product conjecture

All three primary versions of Dettling, Homs, Améndola, Drton, and Hansen, *Identifiability in Continuous Lyapunov Models*, were checked. Each corresponding corollary proves the separate divisibilities by $`\det\Sigma`$ and by the complementary kernel minor. None states the alleged exact-product conjecture:

| Primary version | Statement inspected |
| --- | --- |
| [arXiv v1, 8 September 2022](https://arxiv.org/pdf/2209.03835v1) | Corollary 43, printed page 24 |
| [arXiv v2, 15 November 2023](https://arxiv.org/pdf/2209.03835v2) | Corollary 44, printed page 25 |
| [Published author copy](https://nrhstat.org/publication/2023-lyapunov/2023-Lyapunov.pdf), [DOI 10.1137/22M1520311](https://doi.org/10.1137/22M1520311) | Corollary B.2, printed page 1820 |

[MathDB 356020](https://mathdb.com/p/356020/factorization-conjecture-for-the-determinant-of-the-lyapunov) attributes an exact factorization and multiplicity claim to this paper. That secondary attribution is unsupported by the inspected primary versions. Consequently this calculation is preserved as research, without a named-conjecture or novelty claim.

The source does state a different conjecture extending its sum-of-squares assertion to all simple graphs, immediately after Proposition 30 in v1 and Proposition 31 in v2. The identity proved here does not produce the required sum-of-squares representation and does not resolve that conjecture.

The trace-sign proof of identifiability for simple graphs is already in the source (v1 Theorem 31; v2 Theorem 32; published Theorem 7.1). The rank-$`p-1`$ projection argument above adapts that method to a singular matrix. That antecedent is part of the argument's provenance.

Independent review: algebra agent, 21 November 2026.
