# Rank of two controlled exterior compressions

Research status: the rank calculations and the resulting permissible
target sizes are proved. Membership of either compressed target in a
candidate tagged-source span is not proved.

Let `s=2k>=2`, let `E=C^{2k}` have its fixed ordered basis, and let

```math
V=\Lambda^k E,\qquad p=\dim V={2k\choose k}.
```

Write `e_I` for its exterior basis indexed by the `k`-subsets `I` of
`[2k]`. On the full exterior algebra, `c_a` denotes left exterior
multiplication by the basis vector `e_a`, and `a_a` denotes contraction
by the corresponding dual basis vector. Thus

```math
a_a c_b+c_b a_a=\delta_{ab}I,
```

and the other two pairs of creation or annihilation operators
anticommute. All signs below are those of this fixed exterior basis.

## 1. One selected transfer per row

For every `I`, choose `a_I in I` and `b_I notin I`, and define

```math
E_I=c_{b_I}a_{a_I}:V\longrightarrow V,
\qquad
L_C(e_I\otimes e_J)=e_I\otimes E_I e_J.                  \tag{1}
```

This is a well-defined linear map on the `p^2`-dimensional C space.
It may depend on the first basis index `I`; it is not being asserted
to be a single uniform ground-space change.

For a fixed `I`, the basis vector `e_J` has nonzero image precisely
when `a_I in J` and `b_I notin J`. Its image is then, up to sign,
`e_(J\{a_I} union {b_I})`. These images are distinct. Consequently

```math
\mathop{\mathrm{rank}}E_I={2k-2\choose k-1},
\qquad
\mathop{\mathrm{rank}}L_C=p{2k-2\choose k-1}.                  \tag{2}
```

The retained rank fraction is

```math
{\mathop{\mathrm{rank}}L_C\over p^2}
 ={k\over2(2k-1)}\ge {1\over4}.                          \tag{3}
```

There is also a direct support interpretation. Let `Pi_I` be the
diagonal projector onto the basis vectors with `a_I in J` and
`b_I notin J`. On this subspace, `E_I` is a signed permutation onto
the subspace with the two membership conditions reversed. Extend
this signed bijection to an invertible signed permutation `R_I` on
all of `V`. Then `E_I=R_I Pi_I`. Taking their controlled direct sums
over `I` gives

```math
L_C=R\Pi,
```

where `R` is a local C isomorphism and `Pi` is a coordinate projector.
Thus the target compressed by `L_C` is locally equivalent to the
support-correct partial target that retains all flags and precisely
the pairs `(I,J)` with `a_I in J` and `b_I notin J`. Its support
density is exactly the fraction in (3).

Both the single-party rank-fraction lemma and the separate partial
support-density lemma therefore give the same constant-factor
spectral lower bound for this target. Neither lemma supplies a map
from the proposed source to it.

## 2. A sum of paired transfers

For each `I`, choose a bijection `tau_I:I->I^c`. Define

```math
E_I=\sum_{a\in I}c_{\tau_I(a)}a_a,
\qquad
L_C(e_I\otimes e_J)=e_I\otimes E_Ie_J.                   \tag{4}
```

Then

```math
\dim\ker E_I={k\choose\lfloor k/2\rfloor}^2,
```

and hence

```math
\mathop{\mathrm{rank}}L_C
 =p\left(p-{k\choose\lfloor k/2\rfloor}^2\right).       \tag{5}
```

Here is a proof that includes the representation-theoretic step.
Give the exterior basis its standard orthonormal inner product. For
one fixed `I`, write `E=E_I` and

```math
F=E^*=\sum_{a\in I}c_a a_{\tau_I(a)},
\qquad H=[E,F].
```

The creation--annihilation relations give

```math
H=N_{I^c}-N_I,\qquad [H,E]=2E,\qquad [H,F]=-2F,           \tag{6}
```

where `N_I` counts occupied coordinates in `I`. Operators on distinct
paired coordinates commute here because each summand has even
exterior degree. The identities can alternatively be verified on
the four states of each pair and then summed.

On `Lambda^k E`, the weight of a basis vector having `j` occupied
coordinates in `I` is `k-2j`; every weight has the parity of `k`.
Finite-dimensional spaces with the adjoint relations (6) split
orthogonally into highest-weight strings, as follows. Take a
highest-weight vector `v` of weight `m`, so `Ev=0`. Induction using
(6) gives

```math
E F^r v=r(m-r+1)F^{r-1}v.                                \tag{7}
```

Taking inner products gives

```math
\|F^r v\|^2=r(m-r+1)\|F^{r-1}v\|^2.
```

Positivity and termination show that `m` is a nonnegative integer,
and the string has the nonzero vectors `v,Fv,...,F^m v`, with weights
`m,m-2,...,-m`. Its span is invariant under `E,F,H`; its orthogonal
complement is also invariant because `E^*=F` and `H^*=H`.
Repeating this construction decomposes the whole finite-dimensional
space into such strings.

Each string contributes one vector to `ker E`. Every string's top
weight has parity `k`, so it also contributes exactly one vector to
weight zero if `k` is even, or to weight one if `k` is odd.
The dimension of that central weight space is

```math
{k\choose\lfloor k/2\rfloor}
{k\choose\lceil k/2\rceil}
 ={k\choose\lfloor k/2\rfloor}^2.
```

This proves the kernel formula. All choices of `I` and its bijection
are conjugate by changes of the exterior basis. The controlled map
`L_C` is block diagonal in `I`, so summing the identical block ranks
proves (5).

## 3. A uniform constant rank bound for the sum

Put `m_k=binom(k,floor(k/2))^2`. Vandermonde's identity gives

```math
p=\sum_{j=0}^k {k\choose j}^2.
```

If `k` is odd, there are two equal central terms `m_k`, so
`m_k<=p/2`. If `k=2t` is even, with `t>=1`, each adjacent term is

```math
{2t\choose t-1}^2
 =\left({t\over t+1}\right)^2m_k\ge {m_k\over4}.
```

The central term and its two neighbors give `p>=3m_k/2`. Therefore,
for all positive `k`,

```math
\mathop{\mathrm{rank}}L_C\ge p^2/3.                           \tag{8}
```

A source restriction to this exact one-party compression would thus
retain at least one third of the target's value under every normalized
spectral point. The unresolved statement is that the complete
compressed tensor belongs to an available tagged-source subspace
cover. The rank estimate alone does not prove that membership.

The source-membership failure for an explicit unrotated Gaussian family
is proved in [GAUSSIAN_SINGLE_TRANSFER_FAILURE.md](GAUSSIAN_SINGLE_TRANSFER_FAILURE.md).
The general exact compression search remains
[ARBITRARY_C_COMPRESSION.md](ARBITRARY_C_COMPRESSION.md).
