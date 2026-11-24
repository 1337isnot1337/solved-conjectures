# Partial-support repairs of Sun's propagation: exact tests and remaining maps

Research note, 23 November 2026 (America/Chicago). This note investigates
the relaxed goal of constructing dense partial weighted matrix
multiplication with source cost $`N^{2+o(1)}`$. It does not assume that the
unprinted ordinary-row maps in Sun's odd-characteristic propagation
are the diagnostic maps considered below.

## The sufficient relaxed goal

Li, [arXiv:2611.04175v1](https://arxiv.org/abs/2611.04175v1),
Theorem 2.11, implies that a partial weighted matrix multiplication
tensor with m nonzero cycles and border rank at most r satisfies

```math
m^{\omega/3}\le r.
```

Thus a legally constructed unbounded family with $`m_N=N^{3-o(1)}`$
and $`r_N=N^{2+o(1)}`$ would suffice. Neither exact cycle coefficients nor
the particular source constant $`2N^2`$ are required. However, every
off-cycle coefficient must vanish, and subsequent local maps must act
on the source state actually constructed. The full-support weighted
lower bound in [the weighted-support note](WEIGHTED_SUPPORT_REPAIRS.md) does not exclude this relaxation.

## A concrete ordinary fresh block

Let the fresh matrix indices be elements of $`G=\mathbb F_2^2`$, identified
with $`0,1,2,3`$ under xor. Let

```math
A=\{0,3,4,9,12\},\qquad
\mathcal N=\{1,2,5,6,7,8,10,11,13,14,15\}.
```

For a fresh cycle $`(i,j,k)`$ set $`Q=i+j`$, $`R=j+k`$, and
$`\lambda=Q+4R`$. The ordinary physical-cycle block is

```math
P_{\rm ord}(c)=\sum_{\substack{i,j,k\in G\\(i+j)+4(j+k)\in\mathcal N}}
c_{ijk}X_{ij}Y_{jk}Z_{ki},\qquad c_{ijk}\ne0.
```

It has exactly $`11\cdot4=44`$ cycles. This is the natural componentwise
physical-cycle choice tested in [the propagation audit](SUN_PROPAGATION_AUDIT.md); Sun's
odd-characteristic Lemma 10.4 does not give this as the actual
tensor-valued right-hand side.

### Proposition

For every nonzero weighting of this 44-cycle support,

```math
\underline R(P_{\rm ord}(c))\ge18.                     \tag{1}
```

In particular, the ordinary block is not a finite degeneration of
$`D_{16}`$. This rules out simply supplying that fresh block from the
sixteen new diagonal labels before tensoring with an old target.
It does not rule out a source-resolved construction using extra
information in the old source or an asymptotic construction.

### Proof

Regard each X-slice as a matrix with row indices $`(j,k)`$ on Y and
column indices $`(k,i)`$ on Z. The slice obtained by summing the four
covectors $`X^*_{j+2,j}`$ is a nonsingular weighted permutation matrix
$`D`$: all four addresses with $`Q=2`$ are ordinary. Its entry in row
$`(j,k)`$ and column $`(k,j+2)`$ is $`c_{j+2,j,k}\ne0`$.

Consider the slices at $`X_{3,0}`$ and $`X_{2,1}`$, and multiply their
matrices on the right by $`D^{-1}`$. The first normalized slice is

```math
B=\sum_{k\ne0}
\frac{c_{3,0,k}}{c_{3,1,k}}\,
E_{(0,k),(1,k)},
```

and the second is

```math
C=\sum_{k\ne1}
\frac{c_{2,1,k}}{c_{2,0,k}}\,
E_{(1,k),(0,k)}.
```

Indeed both have $`Q=3`$, whose only excluded R value is zero. Therefore

```math
[B,C]=\sum_{k\in\{2,3\}}
\frac{c_{3,0,k}c_{2,1,k}}{c_{3,1,k}c_{2,0,k}}
\bigl(E_{(0,k),(0,k)}-E_{(1,k),(1,k)}\bigr).
```

The four displayed diagonal entries are nonzero, so the commutator
has rank four.

For completeness, the required commutator rank inequality is elementary.
If a tensor with an invertible m-square slice has rank at most r,
normalize that slice to the identity. For a generic choice of the
normalizing slice, a rank decomposition gives matrices
$`L\in\mathbb C^{m\times r}`$, $`R\in\mathbb C^{r\times m}`$ with
$`LR=I_m`$, and each other normalized slice has the form $`LDR`$ for a
diagonal matrix D. Put $`Q=I_r-RL`$, whose rank is $`r-m`$. For two
diagonal matrices $`D,E`$,

```math
[LDR,LER]=L(EQD-DQE)R,
```

which has rank at most $`2(r-m)`$. The inequality extends first to any
invertible normalizing slice by taking a limit, and then to tensors of
border rank at most r, since the inverse slice is regular on the open
set where its determinant is nonzero and bounded matrix rank is closed.
Here $`m=16`$ and the commutator has rank four, so $`r\ge16+2=18`$.

## The residual in the direct physical-cycle reconstruction

The checked scalar elimination has leakage $`K\otimes I_4`$. If one
specifies the same fresh cycle tensor $`T_{\lambda,g}`$ over every old
physical cycle $`C`$, the residual has the exact factorization

```math
\sum_C M_C\otimes
\left(T_{a,g}-\sum_{\lambda\in\mathcal N}K_{a,\lambda}T_{\lambda,g}\right)
=M_N\otimes R_{a,g}.
```

The fixed fresh tensors $`R_{a,g}`$ are nonzero, with the flattening ranks
already recorded in the first propagation audit. Contracting any
nonzero $`R_{a,g}`$ to a scalar gives a restriction back to $`M_N`$.
Consequently a rank estimate $`O(N^2\,\mathop{\mathrm{polylog}}N)`$ for
this residual would itself provide such an estimate for matrix
multiplication. It cannot be inferred from the fact that the fresh
address space has fixed dimension.

If a different legal ordinary map confined its residual to only
$`O(N^2\,\mathop{\mathrm{polylog}}N)`$ old cycles, direct correction by
rank-one terms could instead be affordable. The source has not supplied
that support statement. In the diagnostic factorization above the
residual lies over every old cycle, including dense cycles.

## What remains unavailable for direct expansion

Appendix A.11 of
[Sun, arXiv:2610.13971v1](https://arxiv.org/pdf/2610.13971v1) writes the
global maps as a composition of named source, dense, completion, and
row/Weyl maps. It states the scalar character identities and the desired
cycle relabelling. It does not give the matrix entries of the
odd-characteristic fresh ordinary selector, its tensor-valued
right-hand sides, or the maps from those right-hand sides into the
claimed active normal forms. These are precisely the entries required
to calculate all coefficients of a first propagation step.

The exact scalar Walsh solve does not fill this gap. Solving a linear
system whose entries are whole tensors is not automatically realizable
by three separate local maps on the stated source. The local support
and phase dependencies have to be exhibited. No dense partial family,
no quadratic correction recurrence, and no induction have been
established by the present computations.

