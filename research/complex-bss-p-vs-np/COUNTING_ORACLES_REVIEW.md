# Review: countable-range oracles and the cyclic weighted trace

Reviewer: weighted-protocol agent, 23 November 2026 (America/Chicago).

Reviewed [COUNTING_ORACLES_AND_CYCLIC_TRACE.md](COUNTING_ORACLES_AND_CYCLIC_TRACE.md) in full. The mathematical claims and their stated scope pass. This is an internal written review, not formal verification or a novelty claim.

## Countable-range oracle lemma

For fixed input dimension, the field generated over the rationals by all possible oracle output coordinates, the fixed machine constants, and the finitely many coefficients of the target polynomial and a principal-open guard is countable. An algebraically independent input tuple over this field exists and lies in that principal open.

Freezing the realized computation at this tuple gives an arithmetic rational circuit with at most the charged number of arithmetic steps. Adaptive oracle query lengths and oracle-dependent memory or control choices are frozen by that same history. No oracle-selection function is computed. Every oracle value actually read is an allowed scalar constant in the countable field. The assumed defined divisions ensure that all executed denominators are nonzero at the tuple.

The difference between this rational circuit and the target polynomial cannot have a nonzero numerator over that field: algebraic independence would forbid its vanishing at the chosen input. Thus the rational circuit computes the polynomial identically.

At a generic center avoiding the finitely many executed denominators, the substitution
```math
x=c+s(x-c)
```
permits gatewise arithmetic in the truncated ring modulo $`s^{d+1}`$. Each divisor has nonzero scalar constant term. Convolution and the usual triangular recurrence for inverse-series coefficients require $`O((d+1)^2)`$ gates per original gate. Since the final polynomial has degree at most $`d`$, summing the retained coefficients at $`s=1`$ recovers it exactly. The stated bound
```math
O((T+n+1)(d+1)^2)
```
is valid.

The open-domain condition is used correctly. Arbitrary Zariski-dense correctness is insufficient for countably many histories; integer-valued targets restricted to integer inputs illustrate this. For finite answer ranges at the relevant query lengths, a finite-history density argument does give the separate stronger dense-set version. The statement correctly excludes a unit-cost operation that raises a variable to an oracle-supplied integer power.

## Cyclic trace

With $`B=m+1`$, the exponents $`b_j=B^{j-1}`$ have unique base-$`B`$ encodings for multiplicities $`0\le c_j\le m`$. Thus the coefficient of $`t^\kappa`$, where $`\kappa=\sum_j b_j`$, is exactly the permanent.

The chosen
```math
D=2^{m\lceil\log_2(m+1)\rceil+1}
```
exceeds both $`mB^{m-1}=\deg_tK_m`$ and $`\kappa`$. Every exponent of $`t^{D-\kappa}K_m`$ is strictly between zero and $`2D`$; its only possible multiple of $`D`$ is $`D`$. The root-of-unity sum over $`t^D=z`$, for $`z\ne0`$, therefore gives
```math
\sum_{t^D=z}D^{-1}t^{D-\kappa}K_m(X,t)
=z\,\mathop{\mathrm{per}}_m(X).
```
This holds for arbitrary complex matrices, including all cancellations.

The circuit count is correct: compute successive $`t^{B^{j-1}}`$ by powering the preceding one to $`B`$, using $`O(m\log(m+1))`$ gates; build the row sums and product with $`O(m^2)`$ gates; obtain $`t^{D-\kappa}`$ by binary powering in $`O(m\log(m+1))`$ gates. The exponent bookkeeping and the computation of the scalar $`D`$ are uniform and polynomial. Gate-variable equations give a quadratic incidence with unique auxiliary values.

The reduced fiber has $`D`$ points and constant unweighted invariants, whereas the displayed weighted trace varies polynomially with $`X`$. Setting $`z=1`$ and applying the oracle lemma would turn a polynomial-time weighted-value algorithm into a polynomial-size arithmetic circuit for the permanent. This conclusion concerns value output; it does not turn a Boolean graph decider into such a value algorithm.

## Primary-source direction checks

I independently opened and checked the following primary sources and statements:

- Bürgisser--Cucker, [arXiv:cs/0312007v1](https://arxiv.org/pdf/cs/0312007), Theorem 2.6(i), Theorem 3.4(i), Theorem 5.2, and the displayed degree algorithm in Section 5.3. The algorithm computes dimension using HN and counts generic slice points using the separate counting oracle.
- Bürgisser--Cucker--Lotz, [C. R. Acad. Sci. Paris 339 (2004), 371--376](https://www.numdam.org/item/10.1016/j.crma.2004.06.008.pdf), Theorem 1.1. It gives Euler-characteristic completeness for the counting-oracle function class under Turing reductions.
- Basu, [arXiv:0912.2652v7](https://arxiv.org/pdf/0912.2652), Definition 1.22, Remark 1.25, Theorems 2.1 and 2.6, and Section 5(C). The hierarchy is the compact projective one, and the oracle returns the full Poincare polynomial. The source does not reverse that direction or identify the oracle with Euler characteristic.


The note's bounded-count observation is also correct: $`k`$ distinct points give a witness of size proportional to $`k`$, with pairwise distinction imposed by inverse witnesses for a nonzero coordinate difference or a nonzero linear combination of differences. It yields a polynomial algorithm for polynomially truncated counts under HN in P, and supplies no logarithmic-size witness for exponential $`k`$.

No gap was found. The note does not prove the requested BSS separation.
