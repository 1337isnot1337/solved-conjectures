# Zauner’s conjecture

**Partial research.** In every coprime tensor factorization of a Weyl–Heisenberg SIC dimension, the singular spectrum of the phase table is determined by the Schmidt probabilities of the fiducial. This gives an exact rank, a quantitative obstruction to low-rank approximations, and an algebraic constraint preserved by field embeddings. These are necessary conditions for the all-dimensional conjecture, which remains open. [Issue #386](https://github.com/1337isnot1337/solved-conjectures/issues/386)

## Target and sources

The Weyl–Heisenberg assertion asks for a unit vector $\psi\in\mathbb C^d$ in every dimension $d\ge2$ whose orbit under the $d^2$ cyclic shifts and phase operators is a symmetric informationally complete set of lines. Equivalently, every nonidentity Weyl displacement has squared overlap with $\psi$ equal to $1/(d+1)$. Zauner’s stronger symmetry formulation further asks that the fiducial be an eigenvector of the canonical order-three Clifford unitary. The necessary conditions below hold for every Weyl–Heisenberg fiducial, including those with that symmetry. The November 24, 2026 source check found the Stark-conditional construction and a later Galois reduction from ghost SICs, which leaves all-dimensional existence open. [Zauner’s thesis](https://www.gerhardzauner.at/documents/gz-quantumdesigns.pdf) · [Appleby, Conjecture B](https://arxiv.org/abs/quant-ph/0412001) · [Appleby–Flammia–Kopp](https://arxiv.org/abs/2501.03970) · [Khodaiemehr, 2026](https://arxiv.org/abs/2611.01524)

Coprime Weyl tensor factorization and reduced states, including flat Schmidt spectra for aligned SICs in dimension towers, are established in the cited primary work. The contribution here is to use the operator coordinates, with the identity entry adjusted to have the same modulus as the others, to extract an exact singular spectrum and compare with low-rank phase data. Priority for these refinements is provisional. [*Dimension towers of SICs*, §§4–5](https://arxiv.org/abs/1707.09911)

## Weyl tensor factorization and purity

Let $d=ab$ where $a,b\ge2$ and $\gcd(a,b)=1$. Identify $|j\rangle$ with $|j\bmod a\rangle\otimes|j\bmod b\rangle$. The shift by $x$ is the product of the corresponding shifts on the factors. The phase indexed by $z$ becomes the product of phases indexed by $b^{-1}z\pmod a$ and $a^{-1}z\pmod b$. Indeed the integer label reconstructs as $j\equiv b(b^{-1}\bmod a)j_a+a(a^{-1}\bmod b)j_b\pmod{d}$. Consequently the global Weyl operators, up to conventional overall phases, are exactly the products of the factor Weyl operators. We use the product convention for the coefficient table.

Let $D_s$ and $E_t$ be standard Weyl operators on the two factors, with $D_0=I_a$ and $E_0=I_b$. For $\rho=|\psi\rangle\langle\psi|$, set

```math
C_{s,t}=\operatorname{tr}\bigl((D_s\otimes E_t)^*\rho\bigr),\qquad
\lambda=(d+1)^{-1/2}.
```

Then $C_{0,0}=1$ and the other entries have modulus $\lambda$. The rows are indexed by all $a^2$ Weyl operators and the columns by all $b^2$ Weyl operators. Write the squared Schmidt coefficients as $p_1,\ldots,p_r>0$, with sum one. Parseval in the local operator basis gives

```math
P_2:=\sum_{i=1}^r p_i^2
=\operatorname{tr}(\rho_A^2)
=\frac1a\sum_s |C_{s,0}|^2
=\frac1a\left(1+\frac{a^2-1}{d+1}\right)
=\frac{a+b}{d+1}.
```

This is symmetric in the two factors. In particular $r\ge \lceil(d+1)/(a+b)\rceil$ by Cauchy–Schwarz. A flat nonzero spectrum requires $r=(d+1)/(a+b)$, in agreement with known aligned examples where this is an integer.

## Exact spectrum of the phase table

Let $J$ be the matrix with only its $(0,0)$ entry equal to one, and let $P$ be the phase table with $P_{0,0}=1$ and $P_{s,t}=\lambda^{-1}C_{s,t}$ elsewhere. Thus

```math
P=\sqrt{d+1}\,C-(\sqrt{d+1}-1)J.
```

Choose orthonormal Schmidt bases on the two factors, extended to full orthonormal bases. In the normalized Weyl operator bases, the coefficient matrix of $\rho$ is $C/\sqrt d$. Changing to the matrix-unit bases is a left and right unitary change of coordinates for this matrix, preserving its singular values. In the matrix-unit bases the expression

```math
\rho=\sum_{i,j\le r}\sqrt{p_i p_j}\,|i\rangle\langle j|
\otimes |i\rangle\langle j|
```

has just one coefficient for each common matrix-unit label $(i,j)$. Thus the nonzero singular values of $C$ are $\sqrt{d p_i p_j}$ for all ordered pairs $i,j\le r$.

The entry matrix $J$ corresponds under this change of coordinates to the product of the normalized identity operators. In matrix-unit coordinates it has coefficient $1/\sqrt d$ at every pair of diagonal labels and zero elsewhere. Hence the singular values of $P$ come from the following mutually orthogonal blocks, with zeros for any unused coordinates.

- For each ordered off-diagonal pair $i\ne j$ with $i,j\le r$, one singular value $\sqrt{d(d+1)p_i p_j}$.
- The singular values of the $a\times b$ matrix with entry at $(i,j)$ given by

```math
\sqrt{d(d+1)}\,p_i\mathbf 1\{i=j\le r\}
-\frac{\sqrt{d+1}-1}{\sqrt d},
```

  taking $p_i=0$ beyond $r$.

Since the dimensions are coprime and nontrivial, we may assume $a<b$. The diagonal block has a column beyond $r$ proportional to the all-ones vector in dimension $a$. Subtracting this column from each of the first $r$ columns yields the respective positive multiples of the first $r$ coordinate vectors. Its rank is therefore $r+1$ if $r<a$ and $r$ if $r=a$. The full rank formula is

```math
\operatorname{rank}(C)=r^2,\qquad
\operatorname{rank}(P)=r^2+\mathbf 1\{r<\min(a,b)\}.
```

The off-diagonal blocks carry exactly $d(d+1)(1-P_2)=d(a-1)(b-1)$ of the phase table’s squared Frobenius norm $d^2$. This proportion is independent of the remaining details of the Schmidt probabilities.

## Distances from separated phase data

For any complex matrix $Q$ of rank at most $R$ with the shape of $P$, the matrix $\lambda Q+(1-\lambda)J$ has rank at most $R+1$. The best rank-$(R+1)$ approximation to $C$ in Frobenius norm can capture at most the sum of its largest $R+1$ squared singular values. Dividing this captured sum by $d$, and using the formula for $C$, gives an upper bound

```math
\sqrt{R+1}\left(\sum_{i,j}(p_i p_j)^2\right)^{1/2}
=\sqrt{R+1}\,P_2.
```

Since $\|C\|_F^2=d$ and $C-\lambda Q-(1-\lambda)J=\lambda(P-Q)$, this proves

```math
\frac{\|P-Q\|_F^2}{d^2}
\ \ge\ \frac{d+1}{d}\max\left\{0,1-\sqrt{R+1}\,\frac{a+b}{d+1}\right\}.
```

A sum of $R$ products of separate row and column phase functions has rank at most $R$. In particular when $a,b$ are comparable, the exact phase rank is at least a constant times $d$. The best unconstrained rank-$R$ relative Frobenius error tends to one when $R=o(d)$, since the lower bound tends to one and the zero matrix gives the upper bound one. The same lower bound applies across each CRT bipartition of a multifactor dimension.

## Algebraic implication and open scope

The ranks of algebraic matrices are unchanged by a field embedding, since nonzero minors remain nonzero. If an algebraic overlap table can be mapped by a field embedding to a Weyl–Heisenberg SIC overlap table, its rank across this factorization must already be $r^2$ with $r\ge\lceil(d+1)/(a+b)\rceil$. For any nonzero algebraic $\gamma$, the same argument applied to the origin correction $C-\gamma J$ gives the invariant rank $r^2+\mathbf 1\{r<\min(a,b)\}$. The diagonal block proof uses only the nonzero common correction and therefore applies even when $\gamma$ changes sign or is nonreal under the embedding. This constrains an algebraic construction before the field embedding intended to produce a SIC.

The constraints apply to actual fiducials and the coprime tensor factorizations that are available. They do not provide a way to produce suitable phase data or to prove existence in arbitrary dimension.

## Cross-checks

The matrix-unit calculation before the purity substitution holds for every bipartite pure state. Direct numerical checks used Fourier-rotated Schmidt bases in factors $(2,3)$ and $(3,5)$. The chosen Schmidt probabilities were $\frac12(1\pm\sqrt{3/7})$ and $(1/2,1/2)$ respectively, giving the two required purity values. Direct global Weyl evaluation agreed with every CRT-reindexed local coefficient. Computed singular values and ranks agreed with the block formula for the phase normalization and for the different complex correction $C-(2+3i)J$. The synthetic states exercise both rank branches of the linear-algebra identity, with corrected ranks four and five. No SIC existence conclusion uses these numerical controls.
