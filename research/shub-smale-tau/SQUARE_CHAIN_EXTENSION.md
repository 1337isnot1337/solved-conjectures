# A concrete attempt to extend rational square-chain families

Status: research. This note studies an explicit construction of a
degree-32 square chain from two degree-16 chains. It proves that the
entire first displayed Bremner elliptic family, including its Hadamard
transforms, cannot provide the required prefix collision. The proof
uses exact function-field and resultant certificates, not the finite
search. Other families and a construction of unbounded depth remain
unresolved. No tau-conjecture result is claimed.

## 1. Primary construction and charged constants

The source is Andrew Bremner, *When Can
`(((X^2-P)^2-Q)^2-R)^2-S^2` Split into Linear Factors?*, Experimental
Mathematics **17**(4) (2008), 385--390,
DOI `10.1080/10586458.2008.10128879`. Equations (2--2), (2--7), and
the inverse map following (2--7), printed pages 387--389, were checked
in the primary article text at

<https://scispace.com/pdf/when-can-x-2-p-2-q-2-r-2-s-2-split-into-linear-factors-3nneuzjm0b.pdf>.

The degree remains 16 throughout Bremner's two infinite families.
Varying their elliptic-curve parameter is not an increase in root count.
The first family has the following explicit description.

Let `(u,v)` lie on


```math
E:\quad v^2=(u-4)(u-3)(u+6)
          =u^3-u^2-30u+72.
\tag{1.1}
```


Put


```math
\begin{aligned}
a&=(-21+4u)(3-10u+2u^2+v),\\
b&=171+102u-44u^2-69v-4uv,\\
c&=(-21+4u)(-15+5u+2v).
\end{aligned}
\tag{1.2}
```


Define six of the positive/negative root representatives by


```math
\begin{aligned}
A&=a^2b-ab^2+3ac^2-7bc^2,\\
B&=c(a^2+2ab-b^2+10c^2),\\
C&=a^2b-ab^2+7ac^2-3bc^2,\\
D&=-c(a^2-2ab-b^2-10c^2),\\
E_0&=-c(a^2+b^2+2ac+2bc-10c^2),\\
G&=-c(a^2+b^2-2ac-2bc-10c^2).
\end{aligned}
\tag{1.3}
```


For the other two, set


```math
\begin{aligned}
T={}&2a^2b-2ab^2+2a^2c+4abc+2b^2c+10ac^2-10bc^2,\\
J={}&-8(a+b)c^3(a^2+b^2-10c^2),\\
F&=(T+J/T)/2,\qquad H=(T-J/T)/2.
\end{aligned}
\tag{1.4}
```


These formulas are used where `T!=0`. They give


```math
A^2+B^2=C^2+D^2=E_0^2+F^2=G^2+H^2,
\qquad
A^2B^2+C^2D^2=E_0^2F^2+G^2H^2.
\tag{1.5}
```


Equations (1.3)--(1.4) are Bremner's first construction, with the last
two entries recovered from their sum and difference of squares. To
check them directly, substitute (1.2), clear the denominator `T`, and
reduce powers of `v` using (1.1).

For any eight rational numbers satisfying (1.5), define


```math
\begin{aligned}
P&=(A^2+B^2)/2,\\
Q&=\frac12\left(\left(\frac{A^2-B^2}{2}\right)^2
                   +\left(\frac{C^2-D^2}{2}\right)^2\right),\\
r_1&=(A^2B^2-C^2D^2)/2,\qquad
r_2=(E_0^2F^2-G^2H^2)/2,\\
R&=(r_1^2+r_2^2)/2,\qquad S=(r_1^2-r_2^2)/2.
\end{aligned}
\tag{1.6}
```


Then direct pairing gives


```math
\left(((x^2-P)^2-Q)^2-R\right)^2-S^2
  =\prod_{Z\in\{A,B,C,D,E_0,F,G,H\}}(x^2-Z^2).
\tag{1.7}
```


For example, `(x^2-A^2)(x^2-B^2)` equals
`(x^2-P)^2-(A^2-B^2)^2/4`. Pairing this with the corresponding
`C,D` expression gives `((x^2-P)^2-Q)^2-r_1^2`; the other four roots
give the same expression with `r_2^2`. Their product proves (1.7).

### 1.1 The elliptic multiples have short charged descriptions

Let `P_0=(2,4)` on (1.1). Its double is


```math
2P_0=(73/16,195/64).
```


This point is not torsion, as can be proved without a rank computation.
For a point on (1.1) with
`v_2(u)=-2e`, `v_2(v)=-3e`, `e>=2`, the doubling slope


```math
\lambda=\frac{3u^2-2u-30}{2v}
```


has valuation `-e-1`. The formulas
`u(2P)=lambda^2+1-2u` and
`v(2P)=-v+lambda(u-u(2P))` then give valuations
`-2(e+1),-3(e+1)`: in each sum the displayed leading valuation is
strictly smaller than the other terms. Doubling `2P_0` therefore
strictly increases `e` forever, so these points never repeat. A
torsion point would have only finitely many doubles. Thus `P_0` has
infinite order.

The usual rational addition formulas on (1.1) compute `kP_0` by binary
doubling and addition with `O(log(|k|+1))` rational operations. One
fixes the actual nonzero-denominator branch when forming a circuit.
Scalar numerator/denominator pairs replace each rational operation
by at most four integer `+,-,*` gates. Substituting (1.2)--(1.4) adds
only a fixed number of operations. A common product of the eight
root denominators gives eight integers proportional to the rational
root representatives, with the same asymptotic gate count.

To obtain integer chain coefficients without an uncharged division by
two, multiply those integer representatives once more by two. If the
unscaled integer representatives are `A_0,...,H_0`, then the new
coefficients in (1.6) are computed as


```math
\begin{aligned}
P&=2(A_0^2+B_0^2),\\
Q&=2\bigl((A_0^2-B_0^2)^2+(C_0^2-D_0^2)^2\bigr),\\
R&=32(U^2+V^2),\qquad S=32(U^2-V^2),\\
U&=A_0^2B_0^2-C_0^2D_0^2,\quad
V=E_0^2F_0^2-G_0^2H_0^2.
\end{aligned}
\tag{1.8}
```


Thus every nondegenerate selected member is a charged constant-free
16-root polynomial with size `O(log(|k|+1))`. This is compatible with
tau, since the root count stays fixed at 16.

## 2. The exact depth-extension condition

Suppose two polynomials of the form (1.7) have the same first three
coefficients `P,Q,R`, and last coefficients `S_1^2!=S_2^2`. Both are
assumed to have 16 distinct rational roots. With


```math
W(x)=((x^2-P)^2-Q)^2-R,
```


their product is


```math
(W^2-S_1^2)(W^2-S_2^2)
 =\left(W^2-\frac{S_1^2+S_2^2}{2}\right)^2
     -\left(\frac{S_1^2-S_2^2}{2}\right)^2.
\tag{2.1}
```


This is a square chain of depth five. The two root sets are disjoint,
because a common root would give `S_1^2=S_2^2`. It therefore has
32 distinct rational roots. Clearing their common denominator by an
input scaling and clearing coefficient denominators gives an integer
polynomial with 32 integer roots, with all constants charged.

For comparing chains up to rational input scaling, use


```math
q=Q/P^2,\qquad r=R/P^4,\qquad z=S^2/P^8.
\tag{2.2}
```


If two chains have equal `q,r`, a rational square ratio between their
`P` values, and unequal `z`, their first three coefficients can be
aligned by a rational input scaling and (2.1) applies. The square
condition on the `P` ratio cannot be omitted when rational roots are
required.

Finding one such pair would only establish the next finite depth. A
counterexample to tau needs a repeatable construction with an
unbounded number of roots and polynomially charged constants; that
additional recursion has not been obtained.

## 3. A symmetry that does not produce the required collision

For every full rational split chain, pair its roots at the first
squaring level so that `A^2+B^2=2P`. Replacing each pair by
`A+B,A-B` gives the Hadamard transformation. In the degree-16 notation
it sends


```math
(P,Q,R,S)\longmapsto
\bigl(2P,\ 4(P^2-Q),\ 16R,\ 16S\bigr).
\tag{3.1}
```


To verify the formula, at a transformed root `A+B` the first
centered square has value `2AB`. Its square minus `4(P^2-Q)` is
`-4((A^2-P)^2-Q)`. The next squaring multiplies the old third-level
value by 16; the final squaring multiplies the polynomial value by
256. This proves that all transformed roots satisfy the new chain.
They remain distinct: equality of squared transformed roots forces
equality of `A^2B^2` between two pairs with the same sum of squares,
hence the same unordered pair of original squared roots. Within a
pair, distinctness follows from `AB!=0` and `A!=+-B`, which hold
for a squarefree even split chain.

The normalized transformation is


```math
(q,r,z)\longmapsto(1-q,r,z).
\tag{3.2}
```


In fact `q=1/2` is impossible for a nondegenerate rational split
chain. If it held, (3.1) would be precisely the input scaling that
multiplies every original root by `sqrt(2)`: the coefficient at the
`j`-th level scales by `2^(2^(j-1))`. But the transformed roots are
rational sums and differences of rational roots, whereas a nonzero
rational root times `sqrt(2)` is irrational. This contradiction
proves the claim. Thus Hadamard pairing never aligns the first three
coefficients while changing the final one.

For the first elliptic family, the involution


```math
T\longmapsto -T-P_0
\tag{3.3}
```


acts on the normalized coefficients as (3.2). Here is a direct
algebraic specification suitable for checking that assertion. If
`T=(u,v)` and `l=u-2`, write


```math
\begin{aligned}
U&=(v-4)^2-(u+1)l^2,\\
V&=v l^3-(v-4)(u l^2-U).
\end{aligned}
```


Then (3.3) is `(U/l^2,V/l^3)` wherever the displayed formula is
defined. Substitute this point into (1.2); a common projective
denominator gives the new triple


```math
\begin{aligned}
a'&=(-21l^2+4U)(3l^4-10Ul^2+2U^2+Vl),\\
b'&=l(171l^5+102Ul^3-44U^2l-69Vl^2-4UV),\\
c'&=l(-21l^2+4U)(-15l^3+5Ul+2V).
\end{aligned}
\tag{3.4}
```


Let `(P',Q',R',S')` be obtained from this triple using (1.3)--(1.6).
The three identities to check are


```math
\begin{aligned}
Q'P^2+Q(P')^2-P^2(P')^2&=0,\\
R'P^4-R(P')^4&=0,\\
(S')^2P^8-S^2(P')^8&=0.
\end{aligned}
\tag{3.5}
```


They follow by polynomial substitution and reduction by
`v^2-(u-4)(u-3)(u+6)`. They were checked exactly in the quadratic
coordinate ring `Q[u,v]/(v^2-(u-4)(u-3)(u+6))`, storing each
element as a pair of polynomials in `u`. These are algebraic identity
checks, not tests at finitely many rational points. They apply on the
common domain of the maps; exceptional denominator points must be
handled by the original rational maps or omitted.

## 4. Explicit equations for the remaining collision

The first and second Bremner families satisfy `A-C=E_0-G`. Write


```math
A=-s+t,\quad C=s+t,\quad E_0=-s+w,\quad G=s+w.
```


The other four squared entries are


```math
\begin{aligned}
B^2&=5s^2+2st+w^2,&D^2&=5s^2-2st+w^2,\\
F^2&=5s^2+2sw+t^2,&H^2&=5s^2-2sw+t^2.
\end{aligned}
\tag{4.1}
```


Let `a=s^2`, `b=t^2`, `c=w^2`, `B_0=b+c`, and `D_0=b-c`.
Expanding (1.6) gives


```math
\begin{aligned}
P&=(6a+B_0)/2,\\
Q&=(D_0^2+8aB_0+16a^2)/4,\\
R&=2a\bigl(D_0^2(B_0-8a)+16a^2B_0\bigr),\\
S&=2aD_0(D_0^2-8aB_0+16a^2).
\end{aligned}
\tag{4.2}
```


Eliminating `B_0,D_0^2` yields the exact necessary equations


```math
\begin{aligned}
R={}&16aPQ-112a^2Q-64a^2P^2+640a^3P-1088a^4,\\
S^2={}&256a^2(Q-4aP+8a^2)(Q-8aP+24a^2)^2.
\end{aligned}
\tag{4.3}
```


Thus a collision with common `P,Q,R` and different `S^2` requires
two distinct rational squares `a,a'` solving the quartic in (4.3).
Subtracting the two quartics gives, when its denominator is nonzero,


```math
Q=4\frac{P^2(a+a')-10P(a^2+aa'+(a')^2)
             +17(a+a')(a^2+(a')^2)}
            {P-7(a+a')}.
\tag{4.4}
```


These necessary equations are not sufficient: one must also recover
rational `s,t,w` and all four squares in (4.1), and require 16 distinct
roots in each chain. For the first elliptic family one may instead
substitute (1.2)--(1.6) for two points `T,T'` on `E` directly into
`q(T)=q(T')`, `r(T)=r(T')`, and the rational square scaling condition.
This gives an explicit algebraic correspondence. Section 6 below
classifies its relevant rational prefix fibers for the first family.
The equations for the general linear-section construction remain open.

## 5. Preliminary finite check

The script `bremner_probe.py` computes elliptic multiples using
exact rational arithmetic and verifies (1.5) and every root in (1.7).
For the 40 signed multiples `+-kP_0`, `1<=k<=20`, it obtained 39
nondegenerate chains and 40 distinct normalized prefix keys after
also applying Hadamard pairing. Every repeated key had the same
last invariant; no pair satisfying the extension test was found.
The repeated keys were explained by (3.3), which sends index `k`
to `-k-1`.

The finite check alone does not exclude a collision. The following
exact calculation does exclude it within the stated first family.
A construction in a different family, followed by a rule that repeats
the extension as the depth grows, remains unresolved.

## 6. An exact rational-fiber obstruction for the first family

### Theorem 6.1

Take any two nondegenerate rational chains supplied by (1.1)--(1.7),
on the displayed domain where their formulas are defined. Either
chain may additionally undergo the Hadamard transformation (3.1).
If their normalized prefix coefficients `q,r` agree, then their
normalized final coefficients `z` agree. Thus these chains cannot be
combined by (2.1) to obtain 32 distinct rational roots. This statement
allows all rational points of (1.1) in the indicated domain, not only
multiples tested in Section 5. It does not cover Bremner's second
family or arbitrary rational split square chains.

**Proof.** First take the rational two-isogeny in translated coordinates


```math
X=\frac{(u+6)(u-4)}{u-3},\qquad
Y=\frac{v((u-3)^2+9)}{(u-3)^2}.
\tag{6.1}
```


Direct substitution gives


```math
Y^2=X^3-16X^2+100X=X((X-8)^2+36).
```


The map has generic degree two: `t=u-3` solves
`t^2+(8-X)t-9=0`, and then `v=Yt^2/(t^2+9)`.
The two roots are interchanged by the nontrivial rational automorphism
`t -> -9/t`, with the corresponding elliptic `v` coordinate.
Translate the image point by the negative of `(5,-15)`, then take its
`x` coordinate. The result is


```math
w=5\frac{X^2-7X+100-6Y}{(X-5)^2}
 =\frac{5\bigl((u+6)^2(u-4)^2
       -7(u+6)(u-4)(u-3)+100(u-3)^2
       -6v((u-3)^2+9)\bigr)}{(u^2-3u-9)^2}.
\tag{6.2}
```


The last denominator has no rational zero, because the discriminant
of `u^2-3u-9` is 45. Thus `w` is finite for every rational affine
point in the theorem, including points where the intermediate
coordinates (6.1) are undefined. At `u=3,v=0`, its value is 5;
the root construction there is degenerate. At other real points
where the elliptic group formulas are defined, (6.2) is an
`x` coordinate on the displayed curve, so it is nonnegative.
The exceptional values follow by the direct rational formula or
continuity. Nondegenerate chains therefore have `w>=0`.

Define the following explicit rational functions:


```math
q_0(w)=
 \frac{5(w^2-10w+40)(w^3-20w^2+1700w+2000)}
      {9(w+10)(w^2+100)^2},
\tag{6.3}
```



```math
\begin{split}
r_0(w)&=
 \frac{3200w(w-20)^2(w-5)^2 B(w)}
      {81(w+10)^4(w^2+100)^4},\\
B(w)&=3w^6-478w^5+28220w^4-435600w^3
             +2822000w^2-4780000w+3000000,
\end{split}
\tag{6.4}
```



```math
z_0(w)=
 \frac{51200000w^2(w-50)^2(w-20)^4(w-10)^2(w-5)^4(w-2)^2
             (w^2-160w+100)^2(w^2-16w+100)}
      {6561(w+10)^8(w^2+100)^8}.
\tag{6.5}
```


Polynomial substitution and reduction by
`v^2-(u-4)(u-3)(u+6)` prove


```math
Q/P^2=q_0(w),\qquad R/P^4=r_0(w),\qquad S^2/P^8=z_0(w).
\tag{6.6}
```


These three identities are supplied as exact coefficient-ring
certificates in `bremner_symbolic.py`. They involve no division
in the coordinate-ring verification: homogenize the numerator and
denominator of each function at the numerator and denominator in
(6.2), multiply by `P^2,P^4,P^8`, respectively, and check that both
coefficients in the basis `1,v` vanish as polynomials in `u`.

For completeness, the generic function-field degree is already
decisive against a generic collision. The reduced rational-function
degrees of (6.3) and (6.4) are 5 and 12. Their numerator values at
`w=-10` are `-21600000` and `-7138368000000000000`, while their
remainders modulo `w^2+100` are `6800000-680000w` and
`680000000000000000`. Thus neither numerator shares a factor with
its denominator, proving these exact degrees. Consequently


```math
[\mathbb Q(w):\mathbb Q(q_0,r_0)]
\mid \gcd(5,12)=1.
```


Here the fact that `[Q(w):Q(a(w)/b(w))]=max(deg a,deg b)` for coprime
`a,b` follows from the irreducible polynomial `a(T)-Zb(T)` over
`Q(Z)`: it is primitive and linear in the independent variable `Z`,
and any factorization in `Q[T,Z]` would give a common factor of
`a,b`. The tower law gives the divisibility just used. The complete
map from the elliptic curve has generic degree four, because (6.1)
has degree two, translation has degree one, and an elliptic
`x` coordinate has degree two.

Generic degree does not exclude exceptional rational collisions.
To check those, write `q_0=A_q/D_q`, `r_0=A_r/D_r` with exactly
the numerators and denominators in (6.3)--(6.4), and set


```math
\begin{aligned}
U(w,t)&=\frac{A_q(w)D_q(t)-A_q(t)D_q(w)}{w-t},\\
V(w,t)&=\frac{A_r(w)D_r(t)-A_r(t)D_r(w)}{w-t}.
\end{aligned}
\tag{6.7}
```


These are integer polynomials of bidegrees `(4,4)` and `(11,11)`.
The primitive part with positive leading coefficient of their
resultant in `t` is the following exact polynomial:


```math
\mathop{\mathrm{prim}}\mathop{\mathrm{Res}}_t(U,V)
  =(w+10)^8(w^2+100)^{18}\prod_{i=1}^{10}G_i(w)\,J(w),
\tag{6.8}
```


where the ten `G_i` and their discriminants are

| `G_i(w)` | Discriminant |
|---|---:|
| `w^2-340w+100` | 115200 |
| `w^2-280w+2500` | 68400 |
| `w^2-180w+500` | 30400 |
| `w^2-120w+400` | 12800 |
| `w^2-64w+484` | 2160 |
| `w^2-40w+100` | 1200 |
| `w^2-36w+20` | 1216 |
| `w^2-30w+25` | 800 |
| `5w^2-56w+20` | 2736 |
| `121w^2-1600w+2500` | 1350000 |

All ten discriminants are nonsquares. The degree-24 polynomial `J`
can be specified compactly by


```math
J(w)=w^{12}\Psi(w+100/w),
\tag{6.9}
```


where the coefficients of `Psi`, in descending degree from 12 to 0,
are the following integer list:

```text
734930659,
-991226305040,
576869756587800,
-197082584713584000,
45130153529234640000,
-7380354996061766400000,
826986969749187360000000,
-60811458077039639040000000,
2884715068818980774400000000,
-86889283136758819840000000000,
1598405397598986752000000000000,
-16322316787910246400000000000000,
70700253139107840000000000000000
```

Expression (6.9) is a polynomial; the negative powers cancel after
multiplication by `w^12`. Its leading coefficient is `734930659`,
which is 8 modulo 13. Its values at `0,1,...,12`, reduced modulo 13,
are respectively


```math
8,2,12,12,12,7,6,7,6,2,4,12,12.
\tag{6.10}
```


Thus `J` has no rational root. Indeed, a rational root `a/b` in
lowest terms cannot have `13|b`, because the leading coefficient is
nonzero modulo 13. Reducing the equation modulo 13 would then give
a root among the thirteen values in (6.10), a contradiction.

If distinct rational numbers `w,t` had the same finite values of
`q_0,r_0`, they would be a common zero of (6.7). Their resultant
would vanish at `w`. Formula (6.8) excludes this: its only rational
root is `w=-10`, where the displayed rational functions have poles.
The factor `w^2+100` has no rational root, the `G_i` have none, and
(6.10) excludes all rational roots of `J`. Therefore the map
`w -> (q_0(w),r_0(w))` is injective on its finite rational domain.

At the projective point `w=infinity`, the values are
`q_0=5/9`, `r_0=0`, `z_0=0`. This cannot represent a nondegenerate
real split chain: `P>0` and `R=(r_1^2+r_2^2)/2`, so `r=0` would
give `r_1=r_2=0`, then `S=0`, and a repeated polynomial square.
The rational pole `w=-10` cannot occur for a nondegenerate chain
with finite `q,r`; it is also outside `w>=0`.

Finally, direct substitution in (6.3)--(6.5) proves


```math
q_0(100/w)=1-q_0(w),\qquad
r_0(100/w)=r_0(w),\qquad
z_0(100/w)=z_0(w).
\tag{6.11}
```


The nondegenerate domain has `w!=0`, since `r_0(0)=0`. Consequently
the Hadamard-transformed chain is represented by the finite rational
parameter `100/w`, whether or not one explicitly lifts that parameter
back to the original elliptic curve. Two chains covered by the theorem
with the same prefix must therefore have the same effective `w`,
and then (6.5) gives the same `z`. This proves the theorem. QED.

### 6.1 Reproducible exact certificates

The repository verifier `bremner_certificate.py` uses only the Python
standard library. It checks the four construction identities (1.5),
the three coordinate-ring identities (6.6), the three Hadamard identities (6.11), and the complete
resultant identity with normalization constant
`2^83 * 3^46 * 5^63 * 17^2` for the convention (6.7). Its resultant
check evaluates fixed `15 x 15` Sylvester determinants at 89 distinct
integers. The bidegrees in (6.7) prove the degree bound 88, so these
89 exact evaluations prove the polynomial identity. It also verifies
the quadratic discriminants and all thirteen residues in (6.10).
Run it from the research directory with

```text
python bremner_certificate.py
```

The independent derivation script `bremner_symbolic.py` uses SymPy
only for exact rational polynomial arithmetic. The command

```text
python bremner_symbolic.py --certificate bremner_certificates.json
```

verifies all three identities (3.5), the three identities (6.6), the
three identities (6.11), coprimality of the displayed numerators and
denominators, and the complete integer factorization (6.8). It also
checks the quadratic discriminants and all thirteen residues in
(6.10). The JSON records the exact degree-24 coefficient list, the
quadratic factors, normalization constant, and arithmetic version.
These checks are polynomial identity verification with proved degree
bounds, not an inference from the finite root search in Section 5.
