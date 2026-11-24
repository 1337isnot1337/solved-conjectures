# Directional cofactor roots and logarithmic jets

Research status, 23 November 2026. This proves a restricted extraction theorem whose bound depends on the number of distinct cofactor roots in one scaling parameter. It allows unbounded cofactor degree in all remaining parameters and arbitrary multiplicities. For the quadratic resultant, a tagged grid-triangle scaling gives a quantitative restriction on every hypothetical small multiple. No bound on that directional root count for an unrestricted cofactor is established, so the full BSS separation remains open.

## 1. A logarithmic-jet extraction lemma

Let `Y=(Y_1,...,Y_M)` and `z` be variables, and suppose

```math
P(Y,z)=R(Y,z)^eQ(Y,z)\ne0,\qquad e\ge1,
```

where `P,R,Q` are polynomials over `C`, and `P` has a division-free circuit of size `L`. View `Q` as a polynomial in `z` over `K=C(Y)`. Let `delta` be the degree of its squarefree part in `K[z]`; set `delta=0` if `Q` is independent of `z`.

**Lemma.** At every point `(a,c)` with `R(a,c)!=0`, and for every `D>=0`, the degree-`D` Taylor polynomial of

```math
G(Y,z)=\frac{\partial_zR(Y,z)}{R(Y,z)}
```

has border circuit size at most

```math
C(\delta+1)(L+M+1)(D+1)^7.                    \tag{1}
```

The bound is independent of the total degrees of `P,R,Q`, of `e`, and of the multiplicities of the roots of `Q` in `z`.

### Proof

Over an algebraic closure of `K`, write

```math
Q(Y,z)=a(Y)\prod_{j=1}^{\delta}(z-r_j(Y))^{m_j},
\qquad m_j\ge1,
```

with distinct algebraic roots `r_j`. Consequently

```math
\frac{\partial_zR}{R}
=\frac1e\left(
\frac{\partial_zP}{P}
-\sum_{j=1}^{\delta}\frac{m_j}{z-r_j(Y)}
\right).                                      \tag{2}
```

The factor `a(Y)` disappears because the derivative is with respect to `z`. Thus factors of arbitrarily high degree that are independent of this direction require no extraction.

Choose a generic parameter center `b` avoiding the leading-coefficient and discriminant exceptional sets for the distinct roots of `Q`. On a sufficiently small complex polydisc about `b`, the roots can all be chosen as holomorphic functions `r_j(Y)`. Each root branch is a local branch of an actual irreducible component of the small hypersurface `P(Y,z)=0`: its irreducible factor over `C(Y)[z]`, after clearing content, is an irreducible polynomial factor of `P` in `C[Y,z]`. Components independent of `z` are not among the selected branches.

Apply the finite-branch jet lemma of [SINGULAR_WITNESS.md](SINGULAR_WITNESS.md), Sections 1–4, to the equation `P=0`, with `Y` as input and `z` as its one witness coordinate. At permissible generic centers it gives every `J_b^D r_j` border size

```math
O\!\left(M+(L+1)(D+1)^3\log(D+2)\right).
```

There is one common permissible generic set for all the finitely many selected branches: intersect their open conditions. The source equation may be nonreduced, and the branches may have arbitrarily high multiplicity in `P`; those are exactly the cases covered by the singular-witness perturbation argument.

Choose a scalar `c_b` with `P(b,c_b)!=0`. At `(b,c_b)`, all denominators in (2) have nonzero constant terms. A circuit of size `O(L)` computes `partial_z P`; evaluating its ratio with `P` in the truncated ring gives the degree-`D` jet of `partial_z P/P` with polynomial overhead. For each `j`, use the jet of `r_j` and a truncated geometric series to compute the jet of `1/(z-r_j(Y))`. This adds `O((D+1)^2)` overhead to its input jet circuit and `O((D+1)^3)` further gates. Sum (2), using `m_j` and `1/e` as scalar constants. This is bounded by (1); the exponent seven is deliberately coarse.

To handle border inputs, use simultaneous ordinary approximants to the finitely many root jets and apply the fixed finite polynomial maps for the truncated inverses, normalized by the fixed nonzero scalars `c_b-r_j(b)`. These maps are coefficientwise continuous. Constant-term errors in approximants do not affect their limit. Thus no assumption that approximants remain roots of `P` is needed.

Finally let permissible points `(b,c_b)` tend to the specified `(a,c)`. Since `R(a,c)!=0`, the target rational function `G` is holomorphic on a fixed neighborhood. Its degree-`D` Taylor polynomials, expressed in the original coordinates, converge coefficientwise. The bound (1) is uniform in the centers and selected root values. Closedness of the fixed-size border class proves the claim at `(a,c)`, even if `P(a,c)=0`. QED.

## 2. A hard directional logarithmic jet of the resultant

Let `R_N` be the resultant of `N` generic homogeneous quadrics in `N` variables, in the full coefficient space of dimension `O(N^3)`. Choose `m=3^r+1`, put `D=m^2`, and assume `N>=5D`. Use the BCJS grid specialization from [FOURIER_RESULTANT_FILTER.md](FOURIER_RESULTANT_FILTER.md). Its affine coefficient map has the form

```math
\sigma(A)=a_0+\ell(A),\qquad R_N(a_0)=1,
\qquad P^{grid}(A)=R_N(\sigma(A)).
```

Here `a_0` is the diagonal system of pure squares, and `ell` inserts the symmetric cubic tensor entries on the anchored grid triangles.

Fix one anchored triangle `e_*`. Let `S` be the set of full quadratic-coefficient coordinates to which its tensor variables contribute. There are five tensor indices per grid position, so `S` has at most `3*5^3=375` coordinates. Each involves three distinct tensor indices; consequently every coordinate in `S` is zero at `a_0`. Let `T_z` multiply the coordinates in `S` by `z` and leave all other coefficient coordinates unchanged. Then

```math
T_z\sigma(A)=\sigma(\rho_z A),
```

where `rho_z` scales all tensor variables on the tagged triangle by `z`.

The relevant function on the full coefficient space is

```math
G_S(a)=\left.
\partial_z\log R_N(T_z a)\right|_{z=1}.
```

This is not the Euler derivative for an entire homogeneous equation block. Such a full-block Euler logarithmic derivative would be constant. Only the selected off-diagonal triangle coordinates are scaled here.

On the grid,

```math
G_S(\sigma(A))
=E_{e_*}\log P^{grid}(A),
\qquad
E_{e_*}=\sum_{a_\alpha\text{ on }e_*}
a_\alpha\partial_{a_\alpha}.
```

Let `zeta` be a primitive cube root of unity, and define

```math
\Pi_1 H(A)=\frac13\sum_{j=0}^{2}\zeta^{-j}H(\rho_{\zeta^j}A).
```

**Claim.**

```math
\Pi_1J_0^D\bigl(E_{e_*}\log P^{grid}\bigr)
=\kappa_{N,m}H_m.                              \tag{3}
```

**Proof.** BCJS Lemmas 3.4 and 3.6 imply that, in every monomial of `P^grid`, its counts `b_e` on all anchored triangles are congruent modulo three. A monomial of tagged character one therefore has degree at least `D`, with equality only when every `b_e=1`. A character-two monomial has degree at least `2D`. Nonconstant character-zero monomials have positive degree.

Write the formal logarithm as

```math
\log P^{grid}
=\sum_{k\ge1}\frac{(-1)^{k+1}}k(P^{grid}-1)^k.
```

For `k>=2`, a product contributing character one either contains a character-one factor, in which case its degree exceeds `D` because of the remaining positive-degree factors, or contains no character-one factor. In the latter case it needs at least two character-two factors, so its degree is at least `4D`. Products of character-zero factors have character zero. Thus the character-one degree-`D` term of the logarithm equals that of `P^grid` itself, namely `kappa H_m` by BCJS Lemma 3.7. There is no character-one term of smaller degree. Finally `E_{e_*}` multiplies each degree-`D` character-one monomial by `b_{e_*}=1`. This proves (3). QED.

## 3. A directional restriction on every small multiple

Suppose

```math
P_N(a)=R_N(a)^eQ_N(a)\ne0.
```

Define

```math
\delta_S(Q_N)
=\deg_z\mathop{\mathrm{rad}}_{\mathbb C(a)[z]}
                  Q_N(T_z a),
```

the number of distinct roots in the scaling parameter over the algebraic closure of `C(a)`. This includes the root `z=0` if it occurs and ignores nonzero factors independent of `z`. The polynomial `Q_N(T_z a)` is nonzero: for `z!=0`, `T_z` is an invertible linear change of the coefficient variables.

The supplied circuit gives a circuit of size `L(P_N)+O(1)` for `P_N(T_z a)`, since `|S|` is bounded by 375. Apply Section 1 in the full coefficient space at `(a,z)=(a_0,1)`, where `R_N(T_1a_0)=1`. Then set `z=1` and pull the Taylor jet back along `sigma`. Taking the full jet before this substitution avoids any requirement that the cofactor or multiple stay nonzero on the grid. The result is a border circuit for the jet in (3) of size

```math
\mathop{\mathrm{poly}}(N)
\bigl(L(P_N)+1\bigr)\bigl(\delta_S(Q_N)+1\bigr).
```

BCJS Lemma 3.3 and Appendix A.1 project `H_m` to the permanent of size `m-1`. For every sufficiently large `N`, choose the largest allowed `m` with `5m^2<=N`; then `m=Theta(sqrt(N))`. The pinned permanent border lower bound therefore gives an absolute `eta>0` such that

```math
\bigl(L(P_N)+1\bigr)\bigl(\delta_S(Q_N)+1\bigr)
\ge\exp\!\left(\eta(\log N)^{4/3}\right).        \tag{4}
```

This holds for each tagged triangle in the selected grid, with the same size bound. Thus any hypothetical polynomial-size multiple must have superpolynomially many distinct cofactor roots along every one of these fixed triangle scalings.

For example, if the cofactor is homogeneous in the tagged coordinates, of any degree and with arbitrary dependence on all other coefficients, then `Q_N(T_z a)=z^d Q_N(a)` and `delta_S(Q_N)<=1`. Such a cofactor cannot conceal the hard logarithmic jet. More generally polynomial directional squarefree degree is excluded even when the cofactor's total squarefree degree is arbitrarily large. Multiplicities of directional roots do not affect the parameter in (4).

## 4. What is still missing

No bound polynomial in `N` or in `L(P_N)` for `delta_S(Q_N)` follows from the generic-branch lemma. A short cofactor circuit can even have exponentially many distinct directional roots for every tagged triangle simultaneously. To see this, choose one distinct full coefficient coordinate `a_e` from each grid triangle, set `ell=sum_e a_e`, and put

```math
Q=1+\ell^{2^s}.
```

This has an `O(N+s)`-gate circuit. For the scaling of triangle `e`, write `U=a_e` and `V=sum_{f!=e}a_f`. Then

```math
Q(T_z a)=1+(V+zU)^{2^s}.
```

It has degree `2^s` over `C(a)` and is squarefree: a common root with its derivative would force both `V+zU=0` and `1+(V+zU)^(2^s)=0`, which is impossible. Thus `delta_S(Q)=2^s` for every triangle.

This does not construct a short multiple of the resultant. In fact this particular cofactor is covered by [FEW_PARAMETER_COFACTORS.md](FEW_PARAMETER_COFACTORS.md), using the one easy parameter `h_1=ell`, so the corresponding multiples are already excluded by that different argument. It shows that polynomially many tagged scalings cannot force a small directional root count merely from a small circuit for the cofactor. A new argument would have to combine directional extraction with additional information supplied by the small multiple or by the full decider.

Equation mixing and projective variable transformations preserve the resultant up to a character, but they do not make an arbitrary cofactor homogeneous in a tagged triangle. Their Euler logarithmic derivatives along full relative-invariant directions are known constants and do not supply (3). The hard direction used here deliberately scales only the grid triangle.

The next required step is therefore specific: prove that a multiple exposed by an HN decider, possibly using its full accepting and rejecting path information, has a bounded directional squarefree cofactor degree or another representation from which the same logarithmic jet can be extracted. No small gcd, content, saturation, or root-selection circuit is assumed here.

The new lemma imports the already reviewed finite-branch jet theorem and proves the remaining logarithmic and grid-filter steps explicitly. The BCJS and pinned lower-bound sources and versions are those recorded in the linked research notes. No novelty claim, formal verification, or full complex BSS separation is asserted.
