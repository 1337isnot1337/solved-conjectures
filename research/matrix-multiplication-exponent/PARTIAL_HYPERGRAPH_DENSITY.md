# A density bound for support-correct partial hypergraph tensors

Research status: this is a consequence of the project's proved
nonzero-coefficient untwisting theorem. It relaxes a construction
target; no dense partial construction is supplied here.

## 1. Transitive support and the partial target

Fix finite positive integers p,M. Let

```math
T=T_{p,M}
 =\sum_{i,j=1}^p\sum_{w=1}^M
 A_{iw}B_{jw}C_{ij}D_{ij}
 =U_{ACD}(p)U_{BCD}(p)W_{AB}(M).
```

Let Omega be a nonempty subset of [p] times [p] times [M], and let
P_Omega be a tensor with exactly these support terms, each having
a nonzero complex coefficient. Write

```math
K=p^2M,\qquad \rho=|\Omega|/K.
```

The permutations of the three edge indices i,j,w act transitively
on the K support terms of T, and are local tensor isomorphisms:
permute i together at A,C,D; j together at B,C,D; and w together at
A,B. The full tensor T is fixed by this action.

For every normalized spectral point phi,

```math
\phi(P_\Omega)\ge\rho\,\phi(T).                    \tag{1}
```

There is no bound on the size of M relative to p in this statement.
The only imported nontrivial implication is the full hypergraph
coefficient-untwisting theorem in
[GENERAL_FREE_SET_SEPARATOR.md](GENERAL_FREE_SET_SEPARATOR.md),
Section 5: a tensor with all the support terms of a product of full
unit tensors, and nonzero coefficients on every term, has spectral
value at least that of the unweighted product at every normalized
spectral point. Only this one direction is imported.

## 2. Proof by covering tensor powers

Use natural logarithms in this covering estimate. Fix n>=1. The n-th tensor power of T has K^n support terms. The
corresponding power of P_Omega occupies rho^n of them. Choose r
independent uniform elements of the n-fold product of the local
permutation group. For any fixed support term, the probability that
it is missed by every permuted copy is

```math
(1-\rho^n)^r\le\exp(-r\rho^n).
```

The union bound shows that a cover exists whenever
r rho^n>n log K. In particular a cover exists with

```math
r_n=\left\lceil\rho^{-n}(n\log K+1)\right\rceil.
                                                        \tag{2}
```

This is also valid for K=1. It uses a finite group and a finite
probability calculation; no limiting random tensor is introduced.

Let g_1,...,g_(r_n) be a covering list. Choose complex scalars
lambda_1,...,lambda_(r_n) so that

```math
W_n=\sum_{z=1}^{r_n}\lambda_z\,
                   g_z(P_\Omega^{\otimes n})
```

has a nonzero coefficient at every support term of T^n. This is
possible: at any fixed term its coefficient is a linear polynomial
in the lambda_z, and coverage plus the nonzero input coefficients
makes that polynomial nonzero. A finite union of proper linear
hyperplanes cannot cover the complex parameter space. The sum
contains no terms outside the support of T^n.

The full direct sum of r_n copies of P_Omega^n restricts to W_n by
applying the indicated local permutations on each block and adding
the blocks at every party; absorb lambda_z in one party map. Hence
restriction monotonicity, full direct-sum additivity, and
multiplicativity give

```math
\phi(W_n)\le r_n\,\phi(P_\Omega)^n.
```

After regrouping, T^n is still a hypergraph-unit product, with edge
sizes p^n,p^n,M^n. Coefficient untwisting gives
phi(W_n)>=phi(T)^n. Finally

```math
\lim_{n\to\infty}r_n^{1/n}=\rho^{-1}.
```

Taking n-th roots proves (1). The factor log K is harmless here
because K is fixed before n tends to infinity.

## 3. Consequence for a prospective geodesic trade

Suppose a legal source with parameters p,M has a restriction or
degeneration to P_Omega. A normalized spectral-point lower bound
for the target can use rho times the value of the full T. Thus a
sequence with rho=p^(-o(1)) supplies the same leading lower bound as
the full target. In particular a joint type of polynomial density in a
middle-exterior construction is sufficient if every output term is
a genuine term of T and every retained coefficient is nonzero.

The type restriction does not authorize deleting off-cycle terms.
It also does not permit assuming a density from counts of source
records whose coefficients have not been checked after cancellation.

For an explicit sequence of covers rather than only the spectral
inequality, choose the power n after the finite p,M and rho have
been fixed. If p tends to infinity and rho=p^(-o(1)), choose n(p)
so large that

```math
\frac{\log(n(p)\log(p^2M)+2)}{n(p)\log p}\longrightarrow0.
```

Such a choice exists for every finite M(p), however fast it grows.
The source-only full-unit cost in (2) then has logarithmic rate
log(1/rho)/log p+o(1). This explicitly handles the quantifier that
would be missed by applying the single-power cover estimate and
assuming log(p^2M)=p^o(1).

The same proof applies to any finite tensor support on which a
group of local isomorphisms acts transitively, provided the full
support with arbitrary nonzero coefficients has spectral value at
least that of the unweighted tensor. Here that one-sided fact is
supplied by the established
hypergraph coefficient theorem; it is not assumed for arbitrary
tensors.
