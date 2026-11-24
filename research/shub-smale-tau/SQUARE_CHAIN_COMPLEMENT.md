# Complementary prefix obstruction for the second Bremner family

Status: research. This note completes the restricted two-family pairing test. It does not exclude arbitrary degree-32 rational square chains or prove a tau bound. The first-family, cross-family and ordinary second-family statements are in [SQUARE_CHAIN_EXTENSION.md](SQUARE_CHAIN_EXTENSION.md) and [SQUARE_CHAIN_SECOND.md](SQUARE_CHAIN_SECOND.md).

## 1. Scope of the family test

[SQUARE_CHAIN_SCOPE.md](SQUARE_CHAIN_SCOPE.md), Proposition 1.1, gives Michael E. Paul's exact 16-root example outside both displayed elliptic families and their Hadamard images. The final theorem below is limited to pairings drawn from those families. The larger rational-point system is displayed as equation (1.6) of that note.

## 2. Symmetric formulation of the complementary equations

Use the second-family rational functions from [SQUARE_CHAIN_SECOND.md](SQUARE_CHAIN_SECOND.md),
`q_2=A/D` and `r_2=B/E` in their displayed reduced integer forms.
For one Hadamard-transformed input, equal prefixes require

```math
q_2(X)+q_2(T)=1,\qquad r_2(X)=r_2(T).
\tag{2.1}
```

The diagonal `X=T` would force `q_2=1/2`, impossible for a
nondegenerate rational split chain by the Hadamard irrational-scaling
argument in [SQUARE_CHAIN_EXTENSION.md](SQUARE_CHAIN_EXTENSION.md). Thus every relevant pair satisfies `X!=T`.
It is a common zero of the symmetric polynomials

```math
\begin{aligned}
F(X,T)&=A(X)D(T)+A(T)D(X)-D(X)D(T),\\
G(X,T)&=\frac{B(X)E(T)-B(T)E(X)}{X-T}.
\end{aligned}
\tag{2.2}
```

Their bidegrees are `(14,14)` and `(27,27)`. Put

```math
s=X+T,\qquad p=XT.
```

Every symmetric polynomial of bidegree at most `(d,d)` is a
polynomial of ordinary total degree at most `d` in `s,p`.
For a direct proof, a symmetric monomial pair with `i>j` is

```math
X^iT^j+X^jT^i=p^j C_{i-j}(s,p),
```

where `C_0=2`, `C_1=s`, and `C_k=s C_{k-1}-p C_{k-2}`.
The right side has ordinary total degree at most `j+(i-j)=i<=d`.
Diagonal monomials are powers of `p`. Therefore (2.2) gives two
polynomials `F_sym(s,p),G_sym(s,p)` of total degrees at most 14
and 27. Their resultant in `p` has degree at most `14*27=378`
in `s`, provided it is nonzero.

The last degree bound follows from the determinant definition with
total-degree coefficient bounds: in the Sylvester determinant, each
nonzero term has the same weighted sum of the coefficient indices,
so the powers of `s` sum to at most the product of the two total
degrees. Equivalently, substituting `s=z^{-1},p=u z^{-1}` and
clearing each polynomial's total degree shows that multiplication
by `z^(14*27)` clears the resultant's pole at infinity.

This reduces the ordered-pair degree bound 756 by passing to
unordered pairs. A rational candidate must subsequently give
rational `p` and a rational square discriminant `s^2-4p`; it must
also lift to rational points on the elliptic curve, define
nondegenerate chains with different final squared constants, and
meet the charged square-scaling condition. The symmetric resultant
is a necessary test, not a sufficient construction.

### 2.1 There is no generic complementary parameter symmetry

The prefix functions generate `Q(X)`: [SQUARE_CHAIN_SECOND.md](SQUARE_CHAIN_SECOND.md) proves this using
degrees 14 and 25 for `q_2` and `r_2-25q_2^2/9`. If the prefix image
curve were invariant under `(q,r)->(1-q,r)`, that involution would
therefore induce an automorphism of `Q(X)` over `Q`, hence a rational
Möbius transformation `M(X)`.

The displayed numerators in [SQUARE_CHAIN_SECOND.md](SQUARE_CHAIN_SECOND.md) give the exact gcd identities

```math
\gcd(A,B)=1,\qquad \gcd(A-D,B)=(X-2)^2
```

up to nonzero scalar factors. Consequently the only point on the
projective parameter line with `q_2=r_2=0` is infinity, and the only
point with `q_2=1,r_2=0` is 2. The putative involution must interchange
these points. The poles of `q_2` are

```math
-8,\quad \pm4i,\quad4\pm4i,\quad-2\pm2i.
```

Its only rational pole is -8, which a rational Möbius transformation
preserving the pole set must fix. These three conditions determine

```math
M(X)=\frac{2X+96}{X-2}.
\tag{2.3}
```

But `M(4i)=-8-20i`, which is absent from the pole list. This is a
contradiction. Thus there is no generic complementary symmetry.
This conclusion does not exclude exceptional rational pairs.

It does show that the symmetric resultant in Section 2 is nonzero.
Indeed, a common curve component of (2.2) with nonconstant projection
to `X` would give infinitely many prefix points in both the image
curve and its reflection, forcing those irreducible image curves to
coincide. There is no vertical common component: for fixed `X=a`,
if `D(a)=0`, coprimality gives `F(a,T)=A(a)D(T)!=0` as a polynomial;
if `D(a)!=0`, the identity `F(a,T)=0` for all `T` would make `q_2`
constant. The same holds horizontally. Passing to unordered pairs
is a finite map, so it cannot introduce a common curve component.
Thus the problem is a finite algebraic intersection. Section 3 checks all rational candidates and their nondegeneracy conditions exactly.

## 3. Exact exclusion of the complementary rational fibers

### Theorem 3.1

There are no two nondegenerate rational chains in the second Bremner
family whose prefixes satisfy (2.1). Consequently a second-family
chain and a Hadamard transform of another second-family chain cannot
supply the degree-32 prefix lift.

**Proof.** A nondegenerate second-family chain has a finite rational
parameter `X`, by the chart and infinity checks in [SQUARE_CHAIN_SECOND.md](SQUARE_CHAIN_SECOND.md). If two
such parameters `X,T` satisfied (2.1), then `X!=T` and their rational
sum and product would satisfy the symmetric equations of Section 2.

The exact resultant of those symmetric equations has degree 374.
Its primitive part with positive leading coefficient is

```math
\mathop{\mathrm{prim}}\mathop{\mathrm{Res}}_p(F_{\rm sym},G_{\rm sym})
   =L(s)\,Q(s)\,K_{164}(s),
\tag{3.1}
```

where

```math
L(s)=(s-6)(s+10)(s+16)^4(s+4)^8(s-8)^{11}s^{11}(s-4)^{18}
\tag{3.2}
```

and `Q` is the product of the following quadratic factors with the
indicated exponents:

| Quadratic | Exponent | Discriminant |
|---|---:|---:|
| `s^2-16s+128` | 4 | -256 |
| `s^2+64` | 4 | -256 |
| `s^2-8s+80` | 8 | -256 |
| `s^2-4s+8` | 8 | -16 |
| `s^2-4s+40` | 8 | -144 |
| `s^2+4s+8` | 8 | -16 |
| `s^2+4s+40` | 8 | -144 |
| `s^2+20s+104` | 8 | -16 |
| `s^2+16s+80` | 10 | -64 |
| `s^2+8s+32` | 12 | -64 |

All of these quadratics are positive for real `s`, so none has a
rational root. The full integer coefficient lists for (3.1), including
`K_164`, are in `bremner_complement_certificate.json`. The
factorization of the saved primitive polynomial has scalar one.
It was obtained without an irreducible factorization of `K_164`.

We next exclude rational roots of `K_164` using the exact certificate
proved in Section 3.1 below. Let

```math
H=\max(|\mathop{\mathrm{lc}}K_{164}|,|K_{164}(0)|).
```

This is a positive integer less than `10^163`. The leading coefficient
of `K_164` is 6 modulo 11. Its values modulo 11 at `0,1,...,10` are

```math
5,0,5,9,7,0,3,1,8,7,2,
\tag{3.3}
```

so the only roots are 1 and 5. The derivative values at these roots
are respectively 7 and 2 modulo 11; both roots are simple.

For each root, the file
`bremner_complement_root_certificate.json` gives a lift `rho`
modulo `M=11^512`, and two integer vectors `u,v` satisfying

```math
\begin{gathered}
K_{164}(\rho)\equiv0\pmod M,\qquad
u_1\equiv\rho u_2\pmod M,\quad
v_1\equiv\rho v_2\pmod M,\\
|\det(u,v)|=M,\qquad
\|u\|^2\le\|v\|^2,\qquad
2|u\cdot v|\le\|u\|^2,\\
M>2H^2,\qquad \|u\|^2>2H^2.
\end{gathered}
\tag{3.4}
```

All these are integer equalities, congruences, or inequalities.
They are checked directly from the recorded integer data, without
assuming the correctness of the algorithm that found the basis.
In both branches, the shortest squared norm is at least `10^532`,
while `2H^2<2*10^326`. The exact inequalities (3.4), rather than
these decimal-size observations, are used in the proof.

Lemma 3.2 shows that these certificates exclude every rational root
of `K_164`. Therefore (3.1) leaves only

```math
s\in\{-16,-10,-4,0,4,6,8\}.
\tag{3.5}
```

It remains to test the product coordinate; the resultant condition
alone is not sufficient. For each value in (3.5), compute the monic
gcd of `F_sym(s,p)` and `G_sym(s,p)` over `Q[p]`. The exact results
and their consequences are:

| `s` | Gcd in `p` | Obstruction to rational `X,T` |
|---:|---|---|
| -16 | `p-64` | Discriminant 0 gives `X=T=-8`, a pole. |
| -10 | `p-56` | Discriminant `s^2-4p=-124` is negative. |
| -4 | `(p-8)^2` | Discriminant -16 is negative. |
| 0 | `(p-16)^2` | Discriminant -64 is negative. |
| 4 | `(p^2-32p+512)^2(p^2+8p-448)` | Neither quadratic has a rational root: their discriminants are -1024 and `1856=64*29`. |
| 6 | `p+8` | `p=-8` gives discriminant `68=4*17`, a nonsquare. |
| 8 | `(p-32)^2(p+8)` | Discriminants -64 and `96=16*6` are not rational squares. |

These gcds are exact polynomial identities, recorded in
`bremner_complement_fibers.json` and independently recomputed by
the verifier. If `X,T` were rational, their product would be rational
and their discriminant would equal `(X-T)^2`, a rational square.
The table therefore excludes every candidate. This proves the
theorem. QED.

### 3.1 The finite rational-root exclusion lemma

### Lemma 3.2

Let `f` be a nonzero integer polynomial of degree `d`, with nonzero
constant coefficient, and let `H=max(|lc(f)|,|f(0)|)`. Let `ell` be a
prime not dividing its leading coefficient. Suppose every root in `F_ell` of
`f mod ell` is simple. For each such root, suppose we have a lift
`rho mod M`, where `M` is a power of `ell` and `M>2H^2`, together
with vectors satisfying (3.4), with `f` in place of `K_164`.
Then `f` has no rational root.

**Proof.** Suppose `a/b` is a root, written in lowest terms with
`b>0`. Multiplying `f(a/b)=0` by `b^d` and reducing modulo `a`
and modulo `b` gives

```math
a\mid f(0),\qquad b\mid\mathop{\mathrm{lc}}(f).
```

Here `a!=0`, since the constant coefficient is nonzero. Thus
`|a|<=H`, `1<=b<=H`, and `ell` does not divide `b`.

The residue `a/b mod M` is consequently defined and is a root of
`f mod M`. It reduces to one of the listed simple roots modulo
`ell`. A simple root has a unique lift modulo every power of
`ell`: if `r` is a root modulo `ell^k`, write a possible next lift
as `r+t ell^k`. Taylor expansion modulo `ell^(k+1)` gives

```math
f(r+t\ell^k)\equiv f(r)+t\ell^k f'(r)\pmod{\ell^{k+1}}.
```

Since `f'(r)` is nonzero modulo `ell`, exactly one residue `t mod ell`
solves this equation. Induction proves uniqueness. Hence

```math
a\equiv\rho b\pmod M
```

for the corresponding saved lift.

Consider the lattice

```math
\Lambda_\rho=\{(c,d)\in\mathbb Z^2:c\equiv\rho d\pmod M\}.
```

Its determinant is `M`, as witnessed by the basis `(M,0),(rho,1)`.
The recorded vectors `u,v` lie in this lattice and have determinant
of absolute value `M`, so they form a basis of the whole lattice.

We prove from the recorded inequalities that `u` is a shortest
nonzero lattice vector. Write `v=c u+w`, where `w` is perpendicular
to `u`. Then `|c|<=1/2` and

```math
\|w\|^2=\|v\|^2-c^2\|u\|^2\ge\tfrac34\|u\|^2.
```

For a nonzero integer combination `m u+n v`, if `n=0`, its norm
is at least `||u||`. If `|n|=1`, the nearest integer to `-nc`
can be chosen as zero, so

```math
\|m u+n v\|^2=(m+nc)^2\|u\|^2+\|w\|^2
   \ge c^2\|u\|^2+\|w\|^2=\|v\|^2\ge\|u\|^2.
```

If `|n|>=2`, the perpendicular component alone gives squared norm
at least `4||w||^2>=3||u||^2`. This proves the shortest-vector claim.

But the nonzero vector `(a,b)` lies in the lattice and has
`a^2+b^2<=2H^2<||u||^2`, a contradiction. Thus no rational root
exists. QED.

No claim about general lattice reduction is imported here. The
certificate needs only the explicitly proved two-dimensional
shortest-vector criterion and finite-field lifting argument.

### 3.2 Reproducible certificates

Run the optional regeneration commands below from this research directory. The repository-wide standard-library verifier is documented in README.md.

`bremner_complement_symbolic.py` derives the symmetric equations and
checks their reconstruction coefficient by coefficient. It computes
the resultant exactly and writes its coefficients before any optional
factor analysis. The complete factor/product identity in (3.1) is
in `bremner_complement_certificate.json`; its scalar relative
to the saved primitive polynomial is one.

The standard-library script `rational_root_certificate.py`
can generate the two lifts and reduced bases. More importantly, its
verification mode reads the saved data and checks (3.3)--(3.4)
without repeating either the lifting or reduction algorithm:

```text
python rational_root_certificate.py --verify --source bremner_complement_certificate.json --output bremner_complement_root_certificate.json
```

The independent repository verifier `bremner_complement_checks.py`
checks the symmetric equations, the factor product, both lattice
certificates, and all seven exact gcd fibers. Its resultant identity
check uses fixed `40 x 40` Sylvester determinants at 379 distinct
integer sums. The a priori degree bound 378 from Section 2 makes
those checks a polynomial identity proof even though the saved
polynomial has the smaller exact degree 374. Scalar normalization
of the determinant is separate from the primitive polynomial.

## 4. The exact scope of the completed family route

Combining [SQUARE_CHAIN_EXTENSION.md](SQUARE_CHAIN_EXTENSION.md), [SQUARE_CHAIN_SECOND.md](SQUARE_CHAIN_SECOND.md), and Theorem 3.1 above proves the
following bounded conclusion:

> No pair drawn from either of the two displayed elliptic families,
> allowing their Hadamard transforms and rational input scalings,
> can supply two distinct degree-16 rational split fibers with the
> same first three square-chain coefficients.

The first-family theorem handles two members of that family and its
transforms. The cross-family theorem handles one member from each
family, including either transform. The ordinary second-family
theorem handles two ordinary members or two transformed members.
Theorem 3.1 handles the remaining case of exactly one transformed
second-family member. In each same-family case where prefixes
agree, the final squared constants agree as well, so the root sets
cannot be disjoint.

Any nondegenerate rational degree-32 square chain splits at its last
level into two degree-16 chains of precisely the prefix type used
here. To see this, write it as `(W(x)^2-c)^2-d`, with `W` the
preceding degree-8 square chain. At a rational root, `W(x)^2-c`
is rational and squares to `d`; therefore `d=e^2` for a rational
nonzero `e`. The two factors are `W(x)^2-(c+e)` and
`W(x)^2-(c-e)`. Each has degree 16 and must split into 16 distinct
rational roots, since their product has 32 distinct rational roots.
Evaluating either factor at a rational root shows that `c+e` and
`c-e` are rational squares. Their constants are different and
their first three coefficients agree.

Thus a degree-32 chain cannot have both degree-16 factors supplied
by the completed two-family route. This is not a theorem excluding
all degree-32 chains: SQUARE_CHAIN_SCOPE.md, Proposition 1.1, already gives an explicit
degree-16 chain outside the covered families. No classification of
the rational points of the system in SQUARE_CHAIN_SCOPE.md, equation (1.6), no construction at unbounded depth,
and no general straight-line-program root bound has been proved.
