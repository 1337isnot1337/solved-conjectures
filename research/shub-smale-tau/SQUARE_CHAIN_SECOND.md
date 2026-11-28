# Prefix collisions in the second Bremner square-chain family

Status: open research. This note continues [SQUARE_CHAIN_EXTENSION.md](SQUARE_CHAIN_EXTENSION.md). It excludes cross-family and ordinary second-family prefix lifts, and proves a common-rotation restriction. The complementary-prefix case is resolved separately in [SQUARE_CHAIN_COMPLEMENT.md](SQUARE_CHAIN_COMPLEMENT.md). Arbitrary rational square chains remain outside these results. No unbounded-depth construction or tau bound is proved.

## 1. An explicit map for the second family

The primary source remains Andrew Bremner, *When Can
`(((X^2-P)^2-Q)^2-R)^2-S^2` Split into Linear Factors?*,
Experimental Mathematics 17(4) (2008), 385--390. Section 3, printed
pages 389--390, gives the plane cubic

```math
\mathcal C:\quad
3a^2b-4ab^2+b^3+(a^2-14ab+9b^2)c+10(a+b)c^2=0
\tag{1.1}
```

and the following root representatives:

```math
\begin{aligned}
A&=a^2b-ab^2+(3a-7b)c^2,
\\ B&=c(a^2+2ab-b^2+10c^2),
\\ C&=a^2b-ab^2+(7a-3b)c^2,
\\ D&=-c(a^2-2ab-b^2-10c^2),
\\ E&=-c(a^2+b^2+2(a+b)c-10c^2),
\\ F&=-2a^2b+3ab^2-b^3-(a^2-8ab+7b^2)c-(a+3b)c^2,
\\ G&=-c(a^2+b^2-2(a+b)c-10c^2),
\\ H&=-a^2b+ab^2+(6ab-2b^2)c+(3a-11b)c^2.
\end{aligned}
\tag{1.2}
```

They satisfy the four square and product identities in [SQUARE_CHAIN_EXTENSION.md](SQUARE_CHAIN_EXTENSION.md),
equation (1.5). The same formulas there recover `P,Q,R,S` and
the degree-16 split square chain. This is an imported fixed-degree
construction, not a new root-count result.

The following explicit birational map is derived here for computation:
for a point on

```math
\mathcal E_2:\quad Y^2=X^3-X^2-8X+112,
\tag{1.3}
```

put

```math
(a:b:c)=
\bigl(XY-2X^2-2X-8:
       (Y-10)(X+4):
       (2-X)(X+4)\bigr).
\tag{1.4}
```

Here and below the displayed formulas are used only where they define
a nonzero projective triple and a nondegenerate root chain. These
domain restrictions are checked before a point is used.

To derive (1.4), the tangent at `(1:1:0)` is `a-b-2c=0`; substituting
`a=b+2c` into (1.1) gives `8c^2(b+3c)`. Thus, with `c=1`, use

```math
w=\frac{b+3}{a-b-2},\qquad a=b+2+(b+3)/w.
```

After removing the factor for the tangent's third intersection,
the equation becomes

```math
(2w+3)b^2+10b+8w^2+14w+3=0.
```

Set `X=-4w-4` and `Y=2((2w+3)b+5)`. Direct expansion gives (1.3),
and solving these expressions for `a,b` gives (1.4). The rational
formulas are inverse on their common open domain. This also supplies
an independent direct check that (1.4) lands on (1.1).

Binary elliptic addition on (1.3), followed by the fixed polynomial
formulas (1.4) and (1.2), charges all constants in `O(log(|k|+1))`
operations for any selected nondegenerate multiple of a fixed rational
point. Scalar numerator/denominator pairs and the common root
denominator clear the rational values as in [SQUARE_CHAIN_EXTENSION.md](SQUARE_CHAIN_EXTENSION.md). This statement
concerns a fixed root count of 16.

## 2. Common rotations do not supply an additional free parameter

Suppose a nondegenerate rational degree-16 square chain has its root
representatives paired as `(A_i,B_i)`, `1<=i<=4`, with
`A_i^2+B_i^2=2P`. Put

```math
t_i=(A_i^2-B_i^2)/2,\qquad v_i=A_iB_i.
```

Then `t_i^2+v_i^2=P^2` and

```math
t_1^2+t_2^2=t_3^2+t_4^2=2Q.
\tag{2.1}
```

Apply the same rational transformation, with `(c,d)!=(0,0)`,

```math
(A_i,B_i)\longmapsto
(cA_i+dB_i,-dA_i+cB_i)
\tag{2.2}
```

to all four pairs. It preserves the common pair norm up to the factor
`c^2+d^2`. Write `K_1=t_1v_1+t_2v_2` and
`K_2=t_3v_3+t_4v_4`. The transformed first-level differences are

```math
t_i'=(c^2-d^2)t_i+2cdv_i.
```

The equality of the two sums in (2.1) for the transformed roots is
equivalent to

```math
4cd(c^2-d^2)(K_1-K_2)=0.
\tag{2.3}
```

For a nondegenerate rational split chain, `K_1=K_2` is impossible.
To prove this, consider the four complex numbers
`Z_i=(t_i+iv_i)^2`, all on the circle of radius `P^2`. Equation
(2.1) and `K_1=K_2` give

```math
Z_1+Z_2=Z_3+Z_4=2(2Q-P^2)+2iK_1.
```

If this common sum is nonzero, two unordered points on a circle
are determined by their nonzero midpoint: they are the intersections
of the circle with the line perpendicular to the radius through the
midpoint. Hence `{Z_1,Z_2}={Z_3,Z_4}`. Their real parts determine
the unordered pairs `{t_1^2,t_2^2}` and `{t_3^2,t_4^2}`, which are
therefore equal. The two next-level squared differences are equal,
so the final squared constant is zero and the chain is a repeated
square, a contradiction.

If the common sum is zero, then `Q/P^2=1/2`. This is excluded over
the rationals by the Hadamard argument in [SQUARE_CHAIN_EXTENSION.md](SQUARE_CHAIN_EXTENSION.md), Section 3:
Hadamard pairing would then transform the roots by the irrational
input scale `sqrt(2)` while keeping all transformed roots rational.

Consequently (2.3) forces `cd(c^2-d^2)=0`. These cases give only
scaled permutations/sign changes or the already known Hadamard
operation. A common rotation of all first-level pairs therefore
cannot generate a new degree-16 family for a depth extension.
This argument does not treat independent rotations of the pairs.

## 3. Exact test of a cross-family degree-32 lift

### Theorem 3.1

No nondegenerate rational chain in the first family covered by [SQUARE_CHAIN_EXTENSION.md](SQUARE_CHAIN_EXTENSION.md),
Theorem 6.1, and no nondegenerate rational chain in the second cubic
family (1.1)--(1.2) have equal normalized prefix coefficients `q,r`.
Either or both chains may undergo Hadamard transformation. Consequently
this cross-family pairing cannot supply the degree-32 construction in
[SQUARE_CHAIN_EXTENSION.md](SQUARE_CHAIN_EXTENSION.md), equation (2.1). This theorem does not treat pairing two chains
inside the second family or arbitrary rational square chains.

**Proof.** Every nondegenerate rational point of the second cubic is
covered by the coordinate computation in Section 1. In fact, if `c=0`,
then `B=D=E=G=0`, so the chain is degenerate. If `c!=0` and
`a-b-2c=0`, the cubic equation becomes `8c^2(b+3c)=0`, giving
`(a:b:c)=(-1:-3:1)`. Its representatives from (1.2) repeat the values
`+-8,+-24`, so this point is also degenerate. At every remaining point,
the inverse formulas for `w,X,Y` in Section 1 are defined. For a direct
chart check, set `c=1` and `delta=a-b-2!=0`. If `w=0`, then `b=-3`;
the cubic becomes `-8(a-3)(a+1)=0`, and the non-tangent case is
`(3:-3:1)`, which is degenerate. If `w=-3/2`, then `a=b/3`; the cubic
becomes `40b(b+3)/9=0`, and the non-tangent case is `(0:0:1)`, also
degenerate. Otherwise, substituting `X=-4w-4` and
`Y=2((2w+3)b+5)` into (1.4) gives

```math
c'=-8w(2w+3)\ne0,\qquad (a',b',c')=c'(a,b,1).
```

This proves directly that the forward map covers every nondegenerate
second-family point, without requiring a projective limiting argument.

Put

```math
L(X)=(X+8)(X^2+16)(X^2-8X+32)(X^2+4X+8),
```

and define

```math
\begin{aligned}
B_6(X)&=5X^6+8X^5+64X^4+768X^3+6016X^2+3072X+2048,
\\ B_7(X)&=X^7-5X^6-16X^5+224X^4-512X^3-2496X^2
                   +10752X+29696,
\\ B_{18}(X)&=X^{18}+15X^{17}+176X^{16}-296X^{15}
 -5920X^{14}-8576X^{13}-130624X^{12}+322560X^{11}
\\ &\quad+2641920X^{10}-23879680X^9+23539712X^8
 +689176576X^7+1017970688X^6
\\ &\quad+1470103552X^5+18634506240X^4+56803459072X^3
 +65875738624X^2+30802968576X+5435817984.
\end{aligned}
```

The normalized prefix functions of the second family are exactly

```math
q_2(X)=\frac{4B_6(X)B_7(X)}{L(X)^2},\qquad
r_2(X)=\frac{256(X-12)^2(X-2)^4(X+4)^2B_{18}(X)}{L(X)^4}.
\tag{3.1}
```

These follow by substituting (1.4) into the root formulas and reducing
by (1.3). The remaining coefficient of `Y` vanishes identically. The
script `bremner_second_symbolic.py` verifies these identities by exact
polynomial arithmetic and also verifies all four root identities
needed for the construction. No point sampling is used for (3.1).

Write the first-family functions from [SQUARE_CHAIN_EXTENSION.md](SQUARE_CHAIN_EXTENSION.md) as
`q_0=A_q/D_q`, `r_0=A_r/D_r`, and the two functions in (3.1) as
`q_2=C_q/E_q`, `r_2=C_r/E_r`. Equal finite prefixes imply

```math
F(w,X)=A_q(w)E_q(X)-C_q(X)D_q(w)=0,
\qquad
G(w,X)=A_r(w)E_r(X)-C_r(X)D_r(w)=0.
\tag{3.2}
```

Their bidegrees are `(5,14)` and `(12,28)`. The resultant in `X`
therefore has degree at most `5*28+12*14=308` in `w`. Its exact
factorization, with a nonzero scalar factor omitted, is

```math
\mathop{\mathrm{Res}}_X(F,G)=
 (4w-5)(w-20)^4(w+10)^{28}(w^2+100)^{60}
 \left(\prod_{j=1}^{14}D_j(w)\right)T_{111}(w).
\tag{3.3}
```

The fourteen factors `D_j` and primes at which their leading
coefficients are nonzero and their reductions have no root are:

| Factor | Root-free prime |
|---|---:|
| `w^2-100w+100` | 7 |
| `w^2-65w+100` | 7 |
| `w^2+500` | 11 |
| `4w^2-25w+250` | 7 |
| `w^3-2100w^2+22500w-50000` | 7 |
| `w^3-570w^2+4500w-5000` | 7 |
| `w^3-125w^2+2500w-12500` | 7 |
| `w^3-65w^2-200w-500` | 7 |
| `w^3+40w^2+1300w-2000` | 7 |
| `w^4-980w^3+15000w^2-50000w+250000` | 11 |
| `w^4-740w^3+18600w^2-266000w+1210000` | 7 |
| `w^4-520w^3+11000w^2-100000w+250000` | 11 |
| `361w^4-2420w^3-3000w^2-50000w+250000` | 7 |
| `w^5+95w^4+1900w^3-35000w^2+500000w-1250000` | 11 |

The degree-111 factor `T_111` is specified by its complete integer
coefficient list in `bremner_cross_certificate.json`, together
with the exact scalar in (3.3). Its leading coefficient is 7 modulo
199 and its value at every residue modulo 199 is nonzero. The JSON
also gives those 199 exact residues. The resultant identity and each
finite-field assertion are independently verified by the repository's
standard-library script `bremner_cross_checks.py`. It verifies seven
construction and prefix identities, then checks (3.3) at 309 distinct
integers using exact `42 x 42` Sylvester determinants. Since the
resultant and the factor product both have degree at most 308, these
309 checks prove the polynomial identity. It also verifies all 316
stored finite-field residues across the sixteen nonlinear factors.
Run it from the research directory with

```text
python bremner_cross_checks.py
```

The independent SymPy derivation is reproducible from (3.1)--(3.2) by

```text
python bremner_second_symbolic.py --cross --output bremner_cross_certificate.json
```

A rational root of any factor whose reduction has no root is
impossible: if its denominator were divisible by the selected prime,
the leading coefficient would be divisible by that prime; otherwise
reduction would produce a root in the finite field. Thus (3.3) leaves
only the rational values `w=-10,20,5/4`.

The value `w=-10` is a pole of the first-family prefix functions.
At `w=20`, the function `r_0` is zero, which makes a real split chain
degenerate as in [SQUARE_CHAIN_EXTENSION.md](SQUARE_CHAIN_EXTENSION.md). The last value is incompatible with a
rational first-family point: (6.2) there is an elliptic `x` coordinate
on `y^2=w^3-16w^2+100w`, whereas

```math
\left.w^3-16w^2+100w\right|_{w=5/4}
 =6525/64=29(15/8)^2
```

is not a rational square. Thus there is no finite nondegenerate
rational cross-family prefix collision.

The projective exceptions do not add a candidate. A first-family
`w=infinity` has `r_0=0`, hence degeneracy. A second-family
`X=infinity` has `q_2=r_2=0`; in a nondegenerate real split chain,
`P>0` and `Q` is half a sum of two nonzero squares, so `q>0`.
The only rational zero of `L` is `X=-8`; it is a genuine pole of
the reduced prefix functions and cannot represent a finite prefix.

Finally, if exactly one of the two chains is Hadamard transformed,
move that transformation to the first-family side of the equality.
Its prefix is represented by `100/w` according to [SQUARE_CHAIN_EXTENSION.md](SQUARE_CHAIN_EXTENSION.md), (6.11),
and its parameter remains rational and nondegenerate. The rational
elliptic-point condition used to exclude `5/4` is preserved as well:
if `(w,y)` lies on `y^2=w^3-16w^2+100w`, then
`(100/w,100y/w^2)` lies on the same curve. If both chains are
transformed, their transformations cancel in the prefix equality.
The already proved cross-family exclusion therefore covers all
Hadamard variants. QED.

### 3.1 What an actual lift would have to charge

The absent candidate here was a pair with equal `q,r`, unequal `z`,
and a rational-square ratio between the two `P` values. An actual
witness in a different family would also have to supply the rational
alignment factor `lambda` with `lambda^2=P_2/P_1`. Its arithmetic
construction cost is part of the witness; extracting a rational square
root of a short scalar program is not assumed to have a short program.
Once the point coordinates and this alignment factor have charged
rational programs of total length `t`, the fixed-degree maps, rational
input scaling, equation (2.1) of [SQUARE_CHAIN_EXTENSION.md](SQUARE_CHAIN_EXTENSION.md), and clearing scalar
denominators construct the degree-32 polynomial with `O(t+1)` charged
operations. A fixed finite witness would not disprove tau. An
unbounded extension rule would need polynomial total circuit cost as
the number of roots doubles repeatedly.

## 4. Ordinary second-family self-collisions

### Theorem 4.1

Two nondegenerate rational chains in the second cubic family with the
same normalized prefix `q,r` have the same normalized final coefficient
`z`. They therefore cannot supply the degree-32 prefix lift. The same
statement holds if both chains are Hadamard transformed. The case
where exactly one chain is Hadamard transformed is separate and is resolved in [SQUARE_CHAIN_COMPLEMENT.md](SQUARE_CHAIN_COMPLEMENT.md).

**Proof.** The direct chart argument in Section 3 covers every
nondegenerate rational second-family point by (1.3)--(1.4).

The reduced degrees of the two rational functions (3.1) are 14 and 28.
Define

```math
h_2(X)=r_2(X)-\frac{25}{9}q_2(X)^2.
\tag{4.1}
```

The scalar `25/9` cancels the leading principal parts at some of the
prefix poles. Exact simplification gives the reduced denominator

```math
9(X+8)^3(X^2+16)^3(X^2-8X+32)^4(X^2+4X+8)^4.
\tag{4.2}
```

The numerator has degree 23 and leading coefficient `-7696`, and
is coprime to (4.2). These are exact rational polynomial identities
checked in `bremner_second_symbolic.py`, not asymptotic estimates.
Thus `h_2` has rational-function degree 25. The tower-law argument
from [SQUARE_CHAIN_EXTENSION.md](SQUARE_CHAIN_EXTENSION.md) yields

```math
[\mathbb Q(X):\mathbb Q(q_2,r_2)]
 =[\mathbb Q(X):\mathbb Q(q_2,h_2)]
 \mid\gcd(14,25)=1.
```

Consequently the second-family prefix map is generically injective
on its `X` parameter. The final normalized coefficient is also
independent of the sign of `Y`; exact reduction gives

```math
z_2(X)=\frac{262144X^2(X-12)^4(X-2)^8(X+3)^2(X+4)^4(3X+4)^2
 (X^2-24)^2(X^2-4X-16)^2 C_3(X)^2 E_3(X) D_3(X)^2}
 {(X+8)^6(X^2+16)^6(X^2-8X+32)^8(X^2+4X+8)^8},
\tag{4.3}
```

where `C_3=X^3-4X^2+8X+32`, `E_3=X^3-X^2-8X+112`, and
`D_3=X^3+4X^2+72X+32`. This identity is verified by the same
coordinate-ring reduction in `second_family_functions()`.
Thus the two elliptic points with the same `X` cannot supply
different final squared constants. Generic injectivity alone would
still leave exceptional distinct rational `X` fibers. The following
exact elimination excludes every such nondegenerate rational fiber.

Here are the exact equations used in the elimination. Write
`q_2=A/D` and `h_2=B/E` in reduced form, with the definitions above,
and form

```math
\begin{aligned}
\mathcal U(X,T)&=
  \frac{A(X)D(T)-A(T)D(X)}{X-T},
\\ \mathcal V(X,T)&=
  \frac{B(X)E(T)-B(T)E(X)}{X-T}.
\end{aligned}
\tag{4.4}
```

Their bidegrees are `(13,13)` and `(24,24)`. Every distinct finite
rational pair with the same prefix is a common zero of (4.4), so its
first coordinate is a zero of

```math
\mathcal R(X)=\mathop{\mathrm{Res}}_T(\mathcal U,\mathcal V),
\qquad \deg\mathcal R\le624.
\tag{4.5}
```

The exact degree is 624. Its primitive part with positive leading
coefficient satisfies

```math
\begin{split}
\mathop{\mathrm{prim}}\mathcal R(X)={}&
(X-12)^2(X-2)^4(X+4)^2(X+8)^{38}
\\ &\cdot(X^2-8X+32)^{48}(X^2-4X-16)^2(X^2-24)
\\ &\cdot(X^2+16)^{38}(X^2+4X+8)^{46}
\\ &\cdot(X^3-X^2-8X+112)(X^3+4X^2+72X+32)K_{302}(X).
\end{split}
\tag{4.6}
```

The complete integer coefficients of `K_302` are in
`bremner_second_self_certificate.json`. Its leading coefficient is
8 modulo 11. Its values at `0,1,...,10`, reduced modulo 11, are

```math
8,2,9,3,5,6,1,3,3,7,5.
\tag{4.7}
```

Consequently `K_302` has no rational root, by the same denominator
argument used in Section 3. The five quadratic factors in (4.6)
have discriminants `-64,80,96,-64,-16`, respectively, all nonsquares.
The two cubic factors have no root modulo 3: their values at
`0,1,2` are respectively `1,2,1` and `2,1,2`. Their leading
coefficients are nonzero modulo 3, so they have no rational root.

Thus the only rational zeros of the full resultant are
`X=-8,-4,2,12`. At `X=-8`, the reduced prefix functions have a
genuine pole. At each of `X=-4,2,12`, formula (3.1) gives `r_2=0`,
so a real split chain is degenerate. None can occur in the
nondegenerate rational domain. The projective point `X=infinity`
has `q_2=r_2=z_2=0` and is also degenerate.

Suppose now that two nondegenerate rational second-family chains
have equal prefixes. If their `X` parameters were distinct, (4.4)
would have a common zero and their first `X` parameter would be
an admissible rational root of (4.6), which has just been excluded.
Their `X` parameters are therefore equal, and (4.3) gives equal `z`.
Applying Hadamard to both chains changes both `q` values to `1-q`
and leaves `r,z` unchanged, so the same conclusion holds. QED.

### 4.1 Exact computation and reduction certificate

The independent repository verifier `bremner_second_self_checks.py`
uses only the Python standard library. It checks the actual
`37 x 37` Sylvester determinant at 625 distinct integer parameters,
with its nonzero scalar normalization separated from the primitive
raw polynomial. The proved degree bound 624 makes these checks a
polynomial identity certificate. It then checks the product identity
(4.6), the root-free reduction (4.7), both cubic reductions modulo 3,
and the four rational candidate exclusions. Run it with

```text
python bremner_second_self_checks.py
```

The degree-624 resultant was computed exactly and checkpointed in
`bremner_second_self_raw.json`. A full irreducible
factorization was unnecessary. Repeatedly removing factors supported
on the explicit prefix/final zeros and poles left the degree-302
factor; the final certificate (4.6) is an exact integer polynomial
identity and has normalization one relative to the saved primitive
raw polynomial.

The direct computation command is

```text
python bremner_second_symbolic.py --self --raw-output bremner_second_self_raw.json --output bremner_second_self_certificate.json
```

For the existing checkpoint, the much faster exact reduction check is

```text
python bremner_second_symbolic.py --reduce-self bremner_second_self_raw.json --output bremner_second_self_certificate.json
```

It verifies the full polynomial product in (4.6), its exact degree,
all eleven modular values in (4.7), and that each removed factor
divides a numerator or denominator of the explicit `q_2,r_2,z_2`.
The latter gives an additional independent admissibility check;
the proof above uses the simpler rational-root exclusions.

### 4.2 Complementary prefixes require a separate certificate

Hadamard pairing inside the second family requires a separate check.
If exactly one chain is transformed, the equations are

```math
q_2(X)+q_2(T)=1,\qquad r_2(X)=r_2(T).
\tag{4.8}
```

Unlike the first family, no rational change of `X` realizing this
transformation has been established here. The resultant (4.5) does
not test (4.8). These complementary-prefix fibers are excluded by the separate symmetric resultant and lattice certificate in [SQUARE_CHAIN_COMPLEMENT.md](SQUARE_CHAIN_COMPLEMENT.md), Theorem 3.1. When both chains are transformed the equality reduces
to the ordinary self-collision equations already stated.
