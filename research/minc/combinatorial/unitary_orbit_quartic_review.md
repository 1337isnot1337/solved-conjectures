# Independent review of the unitary-orbit quartic identity

Reviewed 20 November 2026 (America/Chicago). Scope: the exact quartic cancellation, deficit,
spectral envelope, and equality classification. The asymptotic
maximization argument is being reviewed separately by the Brualdi agent.

The reviewed files were fetched from GitHub main:

- research/minc/combinatorial/unitary_orbit_quartic_germ.md,
  blob 97805ab5e65144dbc9f4ec4bd7406abeccdedc2e.
- research/minc/combinatorial/verify_unitary_orbit_quartic.py,
  blob 2757afd29a10cc73789bfca0f36ef2ec605b3d37.

The claims within this review's scope pass. No mathematical correction
is required. They concern the local fourth-order coefficient and do not
resolve Minc Problem 1.

## Exact quartic identity

Let $`H`$ be any zero-diagonal complex Hermitian matrix of order
$`n\ge2`$. Put $`w_{ij}=|h_{ij}|^2`$, $`S=\sum_{i\lt j}w_{ij}=s_2/2`$,
and $`W=\sum_{i\lt j}w_{ij}^2`$. Let $`A,D`$ sum $`w_ew_f`$ over unordered
pairs of incident and disjoint edges, respectively. Let $`C`$ sum the
real part of the edge-product around each simple unoriented four-cycle.

The walk multiplicities are

```math
s_4=2W+4A+8C.
```

A walk using two vertices gives $`2w_e^2`$. Each incident edge pair
gives four rooted closed walks. Each unoriented simple four-cycle has
four roots and two directions, contributing eight times the real part
of its edge-product. This argument does not require real entries.

A fixed-point-free permutation on four vertices is either a pair of
transpositions or a four-cycle. Consequently

```math
q_4(H)=D+2C,\qquad
S^2=W+2A+2D,\qquad
\sum_i r_i^2=2W+2A.
```

Substitution yields

```math
q_4(H)+\sum_i(r_i-s_2/n)^2
=\frac{s_4}{4}
+\left(\frac18-\frac1n\right)s_2^2+W.
```

All identities remain valid in orders two and three: the unavailable
edge configurations simply contribute zero. Thus equations (14)--(16)
have the correct all-order normalization and complex conjugations.

## Deficit and equality

Hermitian symmetry gives

```math
s_4=\|H^2\|_F^2
=\sum_i r_i^2+\sum_{i\ne j}|(H^2)_{ij}|^2.
```

It follows exactly that

```math
\frac{s_4}{2}-W
=
\sum_i\sum_{\substack{j\lt k\\j,k\ne i}}w_{ij}w_{ik}
+\frac12\sum_{i\ne j}|(H^2)_{ij}|^2
=\mathcal D(H)\ge0.
```


If $`\mathcal D(H)=0`$, every summand in the first sum vanishes.
Therefore no row has two nonzero off-diagonal entries. Since $`H`$ is
Hermitian, its undirected support is a matching with isolated vertices.
After a simultaneous permutation of rows and columns, it consists of
blocks

```math
\begin{pmatrix}0&z\\\overline z&0\end{pmatrix}
```

and isolated zeros. Such a block has eigenvalues $`+|z|,-|z|`$.
Its square is diagonal, so this support condition also makes the second
sum vanish. Thus it is both necessary and sufficient for zero deficit.

Conversely, any real spectrum symmetric under sign can be paired as
$`(a_1,-a_1,\ldots,a_k,-a_k,0,\ldots,0)`$, taking $`a_j>0`$.
The real blocks with off-diagonal entry $`a_j`$, together with isolated
zeros, give a zero-diagonal Hermitian matrix with exactly that spectrum.
The spectral theorem places it on the required unitary orbit. This
construction works for every order, arbitrary repeated eigenvalues, and
arbitrary multiplicity of zero.

The zero-diagonal orbit is compact and nonempty. Nonemptiness follows
by conjugating the prescribed trace-zero diagonal matrix by a Fourier
unitary; compactness follows from the compact unitary orbit and the
closed diagonal constraint. Therefore the continuous deficit attains
its minimum. The quartic envelope

```math
\Gamma_n(x)\le
\frac{3s_4}{4}
+\left(\frac18-\frac1n\right)s_2^2
```

has equality if and only if the spectrum is sign-symmetric. A spectrum
that is not sign-symmetric has a strictly positive deficit minimum,
including when its cubic moment happens to vanish.

This classifies equality in the quartic spectral envelope. It does not
classify maximizing matrices for the full permanent at fixed nonzero
perturbation.

## Cubic bound and critical-point normalization

For $`s_2>0`$,

```math
s_3=\sum_{i\ne j}h_{ij}(H^2)_{ji}.
```

Complex Cauchy--Schwarz gives

```math
s_3^2\le s_2\sum_{i\ne j}|(H^2)_{ij}|^2,
\qquad
\mathcal D(H)\ge\frac{s_3^2}{2s_2}.
```

Thus equation (20) is valid. Its explicit improvement is strict when
$`s_3\ne0`$; equation (19) and compactness supply strictness in the
remaining nonsymmetric-spectral cases.

With the real Frobenius inner product on Hermitian matrices, the
gradient of $`W=\sum_{i\lt j}|h_{ij}|^4`$ is
$`2(H\circ|H|^2)`$. Pairing that gradient plus diagonal multipliers with
the orbit tangents $`[K,H]`$ gives the stated commutator condition.
The connected-support rank hypothesis is the constraint qualification;
the note correctly labels the condition necessary only.

## Companion checker

The checker uses exact rational arithmetic. Its adjoint-action recursion
produces $`\mathop{\mathrm{ad}}_K^j(H)/j!`$, and its polynomial permanent
expansion retains the required fourth-order terms. The fourth-power and
deficit checks implement the identities above for real symmetric inputs.
They do not test arbitrary complex Hermitian matrices or prove the
all-order equality classification. The arguments above supply those
parts independently, so no additional finite test is needed.
