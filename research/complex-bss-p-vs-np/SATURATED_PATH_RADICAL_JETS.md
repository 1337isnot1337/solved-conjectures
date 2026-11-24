# Saturated accepting paths and a four-radical extraction criterion

Research status, 23 November 2026. A generic accepting path supplies a small saturated presentation of the resultant hypersurface, which is stronger than one small polynomial multiple. The exact reductions below expose this extra information. The final extraction still assumes a degree-independent bound for normalized jets of polynomial radicals; that bound is not proved here. The full complex BSS separation remains open.

## 1. A generic accepting path presents the hypersurface after saturation

Let `A=(A_1,...,A_M)`, let `R` be a nonconstant irreducible polynomial over `C`, and suppose a deterministic BSS machine decides `H=V(R)` on all of `C^M` in at most `T` steps. Arithmetic, division where defined, and equality branches are charged; the machine may use its fixed complex constants. After fixing the input dimension, there are finitely many paths of length at most `T`.

Choose an accepting path whose cell meets `H` densely. Such a path exists because the accepting cells cover the irreducible variety `H`. Along this fixed path write every register as a shared numerator/denominator pair

```math
v_g=\frac{p_g(A)}{q_g(A)}.
```

The standard recursive clearing rules use at most four division-free operations per arithmetic gate. All pairs therefore have a shared division-free circuit of size `O(T+M)`. In particular, the parameter computations in these pairs are charged; arbitrary rational functions are not free constants.

Let `F_1,...,F_r`, with `r<=T`, be the numerators used by equality tests that take the zero branch. Let `G` be the product of:

- the numerators used by equality tests that take the nonzero branch;
- the numerator of each **divisor register** used by an executed division;
- the denominator factors needed to keep every computed register defined.

An empty product is one. Including all register denominators is harmless and gives one explicit convention. Numerators of dividends or division results are not included merely because a division occurred: a valid division can have zero output.

The polynomial `G` is nonzero and has a shared circuit of size `O(T+M)`. On the open set `D(G)`, every selected computation is defined and every nonzero condition of the path holds. Thus its exact cell is

```math
C=V(F_1,\ldots,F_r)\cap D(G).                     \tag{1}
```

Each `F_i` vanishes on the dense subset of `H` following this path, so `R|F_i` (including the possibility `F_i=0`). Conversely, no factor used in `G` vanishes identically on `H`, since the path is defined and follows its specified nonzero branches on a dense subset of `H`. Hence `R` does not divide `G`.

Correctness gives `C subset H`. Since all `F_i` vanish on all of `H`, equation (1) also gives the reverse inclusion on `D(G)`. Therefore

```math
C=H\cap D(G),
\qquad
\sqrt{(F_1,\ldots,F_r):G^\infty}=(R).              \tag{2}
```

For the last identity, the variety of a saturated ideal is the Zariski closure of the corresponding locally closed set. The right side of (1) is dense in `H`, because `R` does not divide `G`. The Nullstellensatz then gives (2). The list contains a nonzero `F_i`; otherwise the accepting cell would be the nonempty ambient open `D(G)`, which cannot lie in the proper hypersurface `H`.

There is a useful divisorial consequence. If an irreducible polynomial `p` divides every nonzero `F_i` and does not divide `G`, then `V(p) cap D(G)` is dense in `V(p)` and lies in `C`. Equation (2) forces `V(p) subset H`, hence `p` is associated to `R`. Thus all extraneous common irreducible factors of the equality polynomials are supported in `G`. This statement concerns their common factors, not the cofactor of each individual equality polynomial.

## 2. The special one-equation case gives a pure pole divisor

Suppose the path has one nonzero equality polynomial `P` (the remaining equality polynomials, if any, are identically zero). Write

```math
P=R^eQ,\qquad e\ge1,\qquad R\nmid Q.
```

Equation (2) implies that every irreducible factor of `Q` divides `G`. Let `s=O(T+M)` be a bound for the division-free circuit size of `P` and `G`. Their polynomial degrees are at most `2^s` after increasing the bound by a fixed constant if necessary. Choose

```math
K=2^s.
```

Each multiplicity in `Q` is at most `deg P<=K`, while every one of its irreducible factors occurs in `G` with multiplicity at least one. Consequently `Q|G^K`. The rational function

```math
F=\frac{G^K}{P}=\frac{H}{R^e},
\qquad H=\frac{G^K}{Q}\in\mathbb C[A],
\qquad R\nmid H                                    \tag{3}
```

has a pure power of `R` as its reduced denominator. Computing `G^K` requires `s` squarings, so the supplied rational circuit for `F` has size `O(T+M)`. No circuit for `Q`, `H`, or the reduced denominator has been produced.

The one-equation qualification is necessary. With several equality polynomials, (2) controls their common divisorial content. A generic linear combination introduces new factors that need not divide `G`; it cannot automatically be substituted for `P` in this argument.

For example, take `R=y`, `F_1=yx`, `F_2=y(1-xz)`, and `G=1`. Their ideal is exactly `(y)`, because `y=zF_1+F_2`. Nevertheless every nonzero constant combination is

```math
aF_1+bF_2=y\bigl[b+x(a-bz)\bigr],
```

with a nonconstant cofactor. If `b!=0`, the `xz` term proves nonconstancy; if `b=0`, then `a!=0` and the cofactor is `ax`. Thus even exact primality of the equality ideal does not make a constant linear combination have a pure resultant divisor.

## 3. Independent linear combinations isolate the common divisors

Return to the general list, discard identically zero entries if desired, and introduce two independent arrays of variables `lambda=(lambda_1,...,lambda_r)` and `mu=(mu_1,...,mu_r)`. Define

```math
U(A,\lambda)=\sum_i\lambda_iF_i(A),
\qquad
V(A,\mu)=\sum_i\mu_iF_i(A).                       \tag{4}
```

Both polynomials are nonzero. Their shared circuit, together with `G`, has size `O(T+M)`, and the enlarged variable count is `M+2r`. The new variables and their multiplications/additions are charged.

For a nonzero polynomial `f`, let `rad(f)` denote the product of its distinct nonconstant irreducible factors, defined up to a nonzero complex scalar. Set `rad(c)=1` for nonzero constants. Then

```math
\frac{\mathop{\mathrm{rad}}(GU)\,
      \mathop{\mathrm{rad}}(GV)}
     {\mathop{\mathrm{rad}}(GUV)\,
      \mathop{\mathrm{rad}}(G)}
=cR(A)\qquad(c\in\mathbb C^*).                    \tag{5}
```

This is an identity of rational functions in all the enlarged variables, and its left side is in fact a polynomial.

### Proof of the common-factor claim

Let `d=gcd(F_1,...,F_r)` after omitting zeros, and write `F_i=d f_i`, so that `gcd_i f_i=1`. The primitive linear forms `sum_i lambda_i f_i` and `sum_i mu_i f_i` have no common nonconstant factor in `C[A,lambda,mu]`.

One way to see this is to pass to `C(A)`: nonzero linear forms in disjoint variable arrays are coprime. A common polynomial factor before localization must therefore be supported in `C[A]`. Such a factor would divide all coefficients `f_i`, contrary to their gcd being one. The conclusion also covers `r=1`, where the two primitive forms are scalar multiples of the independent variables `lambda_1` and `mu_1`.

Thus the common irreducible factors of `U` and `V` are exactly those of `d`. By Section 1, the only such factor not dividing `G` is `R`.

### Proof of the radical identity

Fix an irreducible polynomial `p` in `C[A,lambda,mu]`. Its exponent on the left side of (5) is

```math
1_{p\mid GU}+1_{p\mid GV}
-1_{p\mid GUV}-1_{p\mid G}.
```

This equals zero when `p|G`. Otherwise it equals one precisely when `p` divides both `U` and `V`, and equals zero in the other cases. The previous argument leaves exactly the factor `R`, with exponent one. Unique factorization proves (5), including the unspecified scalar from the choices of radicals. QED.

All four inputs to the radical operation in (5) have small division-free circuits. The identity itself does not assert that their radicals can be computed cheaply.

## 4. A weaker radical-jet primitive would suffice

For a polynomial `S` and a center `b` with `S(b)!=0`, write

```math
\mathcal J_{b,D}(S)
=J_0^D\!\left(\frac{S(b+Z)}{S(b)}\right),
```

where `J_0^D` retains total degree at most `D` in the increment variables `Z`. Consider the following unproved closure assertion:

> There is a fixed polynomial bound in `s+n+D` for the border circuit size of `mathcal J_(b,D)(rad(f))`, whenever `f` is a nonzero `n`-variable polynomial given by an `s`-gate circuit and `b` lies in a permissible dense open set with `f(b)!=0`. The bound is independent of `deg f`, of all factor multiplicities, and of the chosen center.

Only existence of nonuniform border circuits for these jets is needed. The assertion need not supply a factoring algorithm or a full circuit for `rad(f)`.

Let `S_1,S_2,S_3,S_4` be the four radicals in the order appearing in (5). At a common generic center `b=(a,lambda^0,mu^0)` where `GUV!=0`, normalize their Taylor jets separately. The scalar in (5) cancels, giving

```math
\frac{S_1(b+Z)/S_1(b)\;S_2(b+Z)/S_2(b)}
     {S_3(b+Z)/S_3(b)\;S_4(b+Z)/S_4(b)}
=\frac{R(a+Z_A)}{R(a)}.                           \tag{6}
```

The normalized denominators have constant term one. A truncated geometric series and truncated arithmetic therefore reconstruct the right-side degree-`D` jet from the four input jets. If their border sizes are `s_1,...,s_4`, a deliberately coarse bound is

```math
C(D+1)^3\left(s_1+s_2+s_3+s_4+M+2r+1\right).       \tag{7}
```

The same bound holds for border inputs: simultaneously approximate the four jets, apply the finite polynomial coefficient maps for truncated multiplication and inversion, and pass to the coefficientwise limit. Approximants need not have exact constant term one; the limiting jets do, and the finite geometric-series maps are continuous there.

Multiplication by the permitted scalar `R(a)` gives `J_a^D R`. Common permissible centers can then tend to any specified `a_0` with `R(a_0)!=0`. The target polynomial jets converge coefficientwise even if the individual normalized radical jets develop poles. The size bound is uniform in the centers, so closedness of the border class retains (7) at `a_0`. This is the same order of operations used in the earlier cofactor lemmas: recover the full coefficient-space jet before applying a special grid substitution.

## 5. Quantitative consequence for a hypothetical HN_C decider

Apply the preceding statements to the universal quadratic resultant `R_N`, whose coefficient dimension is `M=O(N^3)`, and to the polynomial-time reduction of its zero test to `HN_C`. At the diagonal coefficient tuple `a_0` of pure squares, normalize `R_N(a_0)=1`.

The BCJS grid construction in [FOURIER_RESULTANT_FILTER.md](FOURIER_RESULTANT_FILTER.md) uses `m=3^j+1`, `D=m^2`, and `N>=5D`. The degree-`D` coefficient-space jet at `a_0`, followed by the grid pullback and its three character evaluations, gives `kappa H_m`; BCJS Lemma 3.3 and Appendix A.1 project this to the permanent of size `m-1`. Choose the largest allowed `m` for each sufficiently large `N`, so `m=Theta(sqrt(N))`.

If the HN_C decider ran in time polynomial in the encoded input size, then `T`, `r`, and the four radical-input circuit sizes would all be polynomial in `N`. The radical-jet primitive in Section 4 would make (7) polynomial in `N`, contradicting the imported permanent border lower bound. Thus that primitive, together with the imported bound, would prove the desired separation in the standard constant-allowing model.

Equivalently, if such a polynomial-time decider existed, the four explicitly specified small circuit families in (5) would furnish a counterexample to the radical-jet primitive. For generic common centers and the indicated polynomial jet orders, at least one of their normalized radical jets would require

```math
\exp\!\left(\eta(\log N)^{4/3}\right)
```

border size for some positive `eta`, after absorbing the polynomial overhead in (7). To justify the generic-center formulation, the coefficient map of a normalized polynomial jet is rational in the center on its nonvanishing open set, while every fixed-size border circuit class is Zariski closed. A hypothetical smaller bound on a dense set of centers would therefore persist under the limiting argument and contradict the hard jet at `a_0`.

This is conditional. The ordinary degree-dependent factor theorem gives no such radical-jet bound when the radical degree can be exponential. Dutta–Saxena–Sinhababu, [*Discovering the roots: Uniform closure results for algebraic classes under factoring*](https://www.cse.iitk.ac.in/users/nitin/papers/factor-closure-jacm.pdf) (author-hosted 2022 manuscript), Conjecture 1, proposes

```math
\min\{\deg(\mathop{\mathrm{rad}}f),
          L(\mathop{\mathrm{rad}}f)\}
\le\mathop{\mathrm{poly}}(L(f)).
```

Together with their Theorem 1, this would imply polynomial-size radicals for all small circuits: the small-size alternative is immediate, while in the small-degree alternative Theorem 1 applies with supplied known factor one and desired factor `rad(f)`. Full radical circuits imply the weaker jet primitive by truncation. No part of the Radical Conjecture is imported as a proved result here.

## 6. The weak primitive is true in some cases but still open in general

If `f` is squarefree, its radical is `f` up to scalar, and ordinary truncated circuit evaluation proves the primitive immediately. More generally, if every irreducible factor has the same multiplicity `e`, write `f=c S^e` with `S` squarefree. At a nonzero center, the formal identity

```math
\frac{S(b+Z)}{S(b)}
=\left(\frac{f(b+Z)}{f(b)}\right)^{1/e}
```

gives its degree-`D` jet by the first `D+1` binomial coefficients. This is a finite polynomial map on jets and has polynomial overhead independent of `e`. It is also a special case of [COMPOSITION_MULTIPLES.md](COMPOSITION_MULTIPLES.md).

Different unknown multiplicities are the unresolved case. Small derivative circuits do expose a rational multiplicity function, but their cleared graph equations have spurious vertical components, as [SIGNED_MULTIPLICITY_RATIONAL_MAP.md](SIGNED_MULTIPLICITY_RATIONAL_MAP.md) records. Two exact tests further delimit possible proofs of the primitive.

### Local input jets can conceal even the first radical coefficient

Let `s>=1`, set `M=2^s>=2`, and put

```math
f(t)=(1-t)^M,
\qquad
g(t)=(1-t)^M-(-t)^M.
```

Both have `O(s)`-gate circuits, take value one at zero, and have identical degree-`(M-1)` Taylor polynomials there. But `rad(f)` normalized at zero is `1-t`. The polynomial `g` has degree `M-1` and its roots are exactly

```math
t=\frac1{1-\xi},\qquad \xi^M=1,\quad\xi\ne1.
```

They are distinct, so `g` is squarefree and its normalized radical is `g` itself. Their radical linear coefficients are therefore `-1` and `-M`. A rule reading only a polynomially bounded number of input Taylor coefficients at that center cannot distinguish these examples. This does not refute the radical-jet circuit bound: both radical outputs have short circuits, and that bound may use the complete input circuit or other generic centers.

### A short circuit can realize many distinct multiplicities

Let `D=2^m`, fix a primitive `D`-th root `zeta`, and use the polynomials `B_j(t)` constructed in [RECIPROCAL_POLE_CLUSTER_OBSTRUCTION.md](RECIPROCAL_POLE_CLUSTER_OBSTRUCTION.md), Section 1. Their shared circuit has size `O(m^2)`, their coefficients are algebraic, and `B_j(zeta^a)` is the `j`-th binary digit `a_j` of `a`.

Choose one scalar `tau` transcendental over the algebraic numbers and set

```math
A_j(t)=B_j(t)+\tau(t^D-1),
\qquad
P(t)=\prod_{j=0}^{m-1}A_j(t)^{2^j}.                \tag{8}
```

These polynomials have a shared `O(m^2)`-gate circuit. At `t=zeta^a`, a factor `A_j` vanishes exactly when `a_j=0`. Each such zero is simple, because

```math
A_j'(\zeta^a)=B_j'(\zeta^a)+\tau D(\zeta^a)^{D-1}
```

cannot vanish: its first summand is algebraic, while its second is a nonzero algebraic multiple of the transcendental scalar. Consequently

```math
\mathop{\mathrm{ord}}_{\zeta^a}P
=\sum_{j:a_j=0}2^j=D-1-a.                          \tag{9}
```

Thus one short circuit realizes every positive multiplicity from one through `D-1`. Their number is superpolynomial in `m`, despite the `O(m^2)` circuit. This rules out a general polynomial bound on the number of multiplicity classes as a substitute for radical extraction. It does not prove that `rad(P)` is hard.

Neither binary encoding of multiplicities nor a degree-independent gcd/saturation routine has been justified. Equation (5) therefore isolates a stronger frontier supplied by the full accepting path without converting that frontier into a proved extraction algorithm. The conditional implication in Section 5 is not supplied by Bürgisser's 2026 Theorem 1.1; the relevant reverse direction in his Conjecture 1.1 remains a conjecture.

## 7. Linearity in the combining variables does not itself normalize content

The linear factor in (4) gives a precise local calculation. Write `F_i=d f_i` as in Section 3, and choose an index `j` with `F_j!=0`. In the rational function field,

```math
U=F_j\left(\lambda_j+
             \sum_{i\ne j}\lambda_i\frac{F_i}{F_j}\right).
                                                               \tag{10}
```

The parenthesized factor has a short rational circuit and is linear in the combining variables. For every coefficient direction `partial`, subtracting its logarithmic derivative from that of `U` gives

```math
\partial\log U-
\partial\log\left(\lambda_j+
             \sum_{i\ne j}\lambda_iF_i/F_j\right)
=\partial\log F_j
=\partial\log d+\partial\log f_j.                 \tag{11}
```

Thus the horizontal linear factor can be removed, but a primitive coefficient `f_j` remains. The supplied `G` restricts the common content `d` of the `F_i`; it does not constrain the factors of an individual primitive coefficient `f_j`. The example in Section 2 has residual coefficient `x` even though `G=1`. Likewise, in the enlarged polynomial ring,

```math
\gcd(U,\partial_{\lambda_j}U)=d
```

up to scalar, because the primitive linear factor is coprime to its coefficient `f_j`. Computing this content is still a gcd operation on circuit polynomials. Linearity in a combining variable does not furnish its cost bound: arbitrary two-polynomial gcds already occur as the content of `lambda_1 p+lambda_2 q`.

There is also a direct radical-jet reduction. Given any nonzero polynomial `f(A)`, introduce a fresh variable `x` and put `F_1=f`, `F_2=xf`. Then

```math
U=f(A)(\lambda_1+x\lambda_2),
\qquad
\mathop{\mathrm{rad}}U
=c\,\mathop{\mathrm{rad}}f\,(\lambda_1+x\lambda_2).
```

The primitive linear factor is explicit, irreducible, and coprime to `f`. At the center `x=0,lambda_1=1,lambda_2=0`, normalized jets restricted to zero increments in these three variables give exactly the normalized radical jets of `f`. If a proposed bound holds first only at generic centers, move those centers to the displayed one; the relevant radical value stays nonzero whenever `f` is nonzero at its coefficient center, so the border bound persists. Consequently a general radical-jet bound based solely on this linear-factor structure would already imply the unrestricted radical-jet primitive.

This last embedding need not satisfy the target hypothesis of an irreducible saturated hypersurface outside `G`. It therefore does not refute using that additional exclusion information or the resultant incidence. It specifies the part of the normalization problem that linearity alone leaves untouched.
