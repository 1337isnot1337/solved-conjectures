# Rational roots and monic normalization

Status: research. The tau conjecture is not proved or disproved. The
reductions in Sections 1--3 are proved below; no novelty claim is made.
They show that the rational-root and monic variants do not require a
separate stronger conjecture in the charged model used here.

## 1. Model and a nonvanishing evaluation point

A program starts with the registers 1 and x and uses binary addition,
subtraction, and multiplication. Its length is the number of gates.
All integer constants must be constructed. The output polynomial is
nonzero; intermediate registers are allowed to be zero.

For P in Z[x], let ||P||_1 be the sum of its absolute coefficient
values. Given a length-s program for f, replace both input registers
by 1 and replace every subtraction by addition. The resulting
integer program has s gates, every register is positive, and each
register bounds the coefficient norm of the corresponding original
polynomial. This follows from


```math
\|P\pm Q\|_1\le\|P\|_1+\|Q\|_1,
\qquad \|PQ\|_1\le\|P\|_1\|Q\|_1.
```


Let t be its output. Then t>=||f||_1>=1. This is the positive-majorant
construction also used in the factorial extraction in
[INTEGER_SPECIALIZATIONS.md](INTEGER_SPECIALIZATIONS.md).

Every nonzero integer polynomial P satisfies P(t)!=0 when
t>=||P||_1 is an integer. Indeed, if deg P=d>=1 and its leading
coefficient is a_d, then


```math
\left|\sum_{i\lt d}a_i t^i\right|
\le(\|P\|_1-|a_d|)t^{d-1}
\le(t-1)t^{d-1}\lt t^d\le|a_d|t^d.
```


The constant case is immediate. Evaluating the original program at
t computes c=f(t)!=0 in s further gates. Thus t and all the register
values h(t), including c, are available after at most 2s gates.

## 2. Rational roots reduce to integer roots with linear overhead

**Theorem 2.1.** Given a nonzero f in Z[x] by a program of length
s>=1, one can construct a nonzero g in Z[z] with


```math
\tau(g)\le6s+2,
\qquad N_{\mathbb Q}(f)\le N_{\mathbb Z}(g).
\tag{1}
```


The transformation is syntactic once the input program is given. It
uses no factorization, degree computation, zero test, or root search.

**Proof.** Compute t,c as in Section 1. Form the rational substitution


```math
x=t+\frac c z.
\tag{2}
```


For each original register h, maintain integer polynomials P_h,Q_h
such that


```math
h(t+c/z)=P_h(z)/Q_h(z).
```


The input 1 is represented by (1,1). The input x is represented by
(tz+c,z), whose numerator costs two gates. For addition or
subtraction use


```math
(P_u,Q_u)\pm(P_v,Q_v)
=(P_uQ_v\pm P_vQ_u,\;Q_uQ_v),
\tag{3}
```


which costs at most four gates. For multiplication use


```math
(P_u,Q_u)(P_v,Q_v)=(P_uP_v,\;Q_uQ_v),
\tag{4}
```


which costs two gates. At every register, Q_h is exactly a power
z^(e_h) with e_h>=0: this holds for the inputs and is preserved by
(3)--(4). In particular no denominator is the zero polynomial, even
if an original register h is identically zero. The numerator for a
zero register is simply zero; no test or special branch is required.

Let g=P_f. The substitution (2) is an automorphism between the
rational-function fields Q(x) and Q(z), with inverse z=c/(x-t),
because c!=0. Therefore f(t+c/z) is nonzero. The denominator invariant
then implies g!=0. The total cost is at most 2s+2+4s=6s+2.

Let r be a rational root of f. It is different from t. Write
r-t=a/b in lowest terms, with b>0 and a!=0. The polynomial
F(u)=f(t+u) has integer coefficients and constant coefficient c.
If d=deg F, multiplying F(a/b)=0 by b^d shows that a divides c b^d.
Since gcd(a,b)=1, a divides c. Consequently


```math
z_r=\frac c{r-t}=\frac{cb}{a}
```


is a nonzero integer. Substitution in the rational identity gives
f(t+c/z_r)=f(r)=0; its denominator is nonzero at z_r, so g(z_r)=0.
The map r->z_r is injective. This proves (1). QED.

If f is a nonzero constant, the same construction is valid and the
root-count assertion is vacuous. If the input length is zero, the
only outputs are 1 and x, and both root counts are at most one.

## 3. A monic integer output is also available

The numerator in Theorem 2.1 need not be monic. A divided-difference
normalization makes it monic without dividing by the integer c.

**Theorem 3.1.** Under the assumptions of Theorem 2.1, there is a
nonzero monic polynomial P in Z[z] satisfying


```math
\tau(P)\le24s+20,
\qquad N_{\mathbb Q}(f)\le N_{\mathbb Z}(P).
\tag{5}
```


**Proof.** After computing t and all h(t), introduce a new variable y
and form a=t+cy in two gates. Compute 0=1-1 in one gate. At every
original register h, maintain


```math
A_h=h(a),\qquad B_h=h(t),\qquad
D_h=\frac{h(a)-h(t)}{a-t}.
\tag{6}
```


The last expression denotes its polynomial divided difference; no
division gate is used. The B_h are already available from Section 1.
For the initial registers,


```math
(A_1,B_1,D_1)=(1,1,0),\qquad
(A_x,B_x,D_x)=(a,t,1).
```


For an addition or subtraction, compute A and D componentwise, at
cost at most two gates. For a product uv, compute


```math
A_{uv}=A_uA_v,
\qquad D_{uv}=D_uA_v+B_uD_v,
\tag{7}
```


at cost at most four gates. The identity
A_uA_v-B_uB_v=(A_u-B_u)A_v+B_u(A_v-B_v) proves the invariant.
It remains valid for zero registers, since it is a polynomial
identity rather than a conditional rational division.

At the output, form


```math
K(y)=1+yD_f(y).
\tag{8}
```


Since f(t)=c and a-t=cy, equations (6)--(8) give


```math
K(y)=\frac{f(t+cy)}c\in\mathbb Z[y],
\qquad K(0)=1.
\tag{9}
```


The quotient notation in (9) describes an identity; the actual
program is (8) and uses no division by c. Its length is at most
2s+2+1+4s+2=6s+5.

Now clear the substitution y=1/z through this complete program by
the rules (3)--(4), with input pairs (1,1) for 1 and (1,z) for y.
This costs at most four gates per original gate and gives


```math
P(z)=z^E K(1/z)\in\mathbb Z[z]
```


for a nonnegative integer E. Because P is a polynomial and K has a
nonzero leading coefficient, necessarily E>=deg K. Equation (9)
implies that the coefficient of z^E in P is exactly one. Thus P is
nonzero and monic. The cost is at most 4(6s+5)=24s+20.

The rational roots r of f map to the same nonzero integers
z_r=c/(r-t) as in Theorem 2.1, and K(1/z_r)=f(r)/c=0. They therefore
give distinct integer roots of P. The possible extra root zero,
arising from E>deg K, does not affect the required lower bound on
the number of roots. Repeated roots are allowed throughout. QED.

### 3.2 Equivalence of the three root-bound statements

Consider the following three assertions, each with an unspecified
absolute exponent and the same constant-free circuit convention:

1. Every nonzero integer polynomial has polynomially many distinct
   integer roots in its program length.
2. Every nonzero integer polynomial has polynomially many distinct
   rational roots in its program length.
3. Every nonzero monic integer polynomial has polynomially many
   distinct integer roots in its program length.

These assertions are equivalent. Assertion 2 implies 1 by inclusion
of root sets, and 1 implies 3 by restriction. Theorem 3.1 proves
3 implies 2. More explicitly, if the monic bound uses exponent C,
then for s>=1 the rational-root bound is at most (24s+21)^C, which
is at most (s+1)^(6C). The length-zero cases were handled above.
Theorem 2.1 separately gives the sharper direct reduction 1 implies
2, with a bound (6s+3)^C.

No claim about squarefree normalization is made. The transformed
monic polynomial may retain repeated roots and may gain the root
zero. No claim about consecutive roots is made either: the
fractional-linear map of the root set need not make it an interval.
The reductions change the location and scale of the roots while
preserving their distinctness and keeping every constant charged.


## 4. Prior formulation and scope

Qi Cheng, *Straight Line Programs and Torsion Points on Elliptic Curves*,
author manuscript, Introduction page 1, already states a rational-root
version using programs from 1 and x. The source was checked at
<https://qcheng2023.github.io/paper/BSS.pdf>. The reductions here give explicit
gate rules and bounds in the present convention; no priority claim is made.

The transformation also preserves the Galois action. The nonzero roots of
the monic output are exactly c/(alpha−t), where alpha ranges over the roots
of f, and the inverse map is alpha=t+c/z. Both maps have rational
coefficients. An extra zero root is fixed by every automorphism. Thus
normalization does not discard the correlation between local root counts
at different primes. It does not change the missing arithmetic step in
[PRIME_AVERAGES.md](PRIME_AVERAGES.md).
