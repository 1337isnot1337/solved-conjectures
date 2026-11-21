# Chen–Kitaev–Zhang's record conjectures

Date: 21 November 2026. Status: complete proposed proof of Conjectures 1 and 3, independently checked within this research campaign; external review remains open. The bounded priority audit is recorded separately.

## Statement and attribution

Chen, Kitaev and Zhang, *Distributions of statistics on separable permutations*, Discrete Applied Mathematics 355 (2024), 169–179, DOI [10.1016/j.dam.2024.05.004](https://doi.org/10.1016/j.dam.2024.05.004), conclude with three conjectures. The [author manuscript](https://arxiv.org/html/2404.18517v1) specifies the following two targets.

1. For every length at least three, each of the four record-count distributions on separable permutations is unimodal with a maximum at two records.
2. On reducible separable permutations, the right-maxima and left-minima distributions are weakly decreasing from one record. The same holds for left maxima and right minima on irreducible separable permutations, at every positive length.

These are Conjectures 1 and 3, respectively. “Irreducible” means indecomposable under direct sum; the singleton is irreducible, and the empty permutation belongs to neither positive class. Records are strict and unshifted.

The proof below supplies the missing comparisons involving one, two and three records, and combines them with the all-index declining tail used in the previously public proof of Conjecture 2. That tail method is due to the [trureturing project](https://github.com/the-omega-institute/trureturing/blob/bba1aad31d92f0ac31774c3a7e7c04a3db945c56/Blueprint/D5/S1/Words/Patterns/Separable/RecordAllIndex.md). Its [ordinary-mathematics manuscript](https://github.com/the-omega-institute/trureturing-source-theories/blob/2a39da5107abbfa3a72cc883486dbc15a15994a1/docs/develop/theory/SEPARABLE_SIGNED_RECORD_WEIGHTS.md), especially Theorems 7.2, 8.2 and 8.3, gives the complete argument. Sections 3–5 reconstruct that argument, with independently regenerated exact certificates, so the present proof can be checked without trusting a claim about a formal build. No new credit is claimed for Conjecture 2 or its Newton-kernel method. No Lean work is performed here.

The current literature audit found no earlier complete statement of Conjecture 1 or 3 in the inspected material. This remains a bounded priority finding; see the separate source audit.

## 1. Generating functions from the actual permutation classes

Let $R(t)$ count nonempty separable permutations by length. Every nontrivial separable permutation is decomposable under exactly one of direct sum and skew sum. Complementation interchanges these two types. The unique decomposition into direct-indecomposable components consequently gives

```math
R=t+tR+R^2,
\qquad
t(1+R)=R(1-R).
```

Write $r_n=[t^n]R$. Thus $r_0=0$, $r_1=1$, $r_2=2$, and $r_{n+1}\ge r_n>0$ for every $n\ge1$, either from the displayed equation or by adjoining a final largest entry.

Let $F(t,z)$ count all nonempty separable permutations by length and number of right maxima. Let $J(t,z)$ count the direct-indecomposable ones. Only the last direct-sum component contributes right maxima, so

```math
F=(1+R)J.
```

Let $K(t,z)$ count skew-indecomposable separable permutations. Their skew decomposition adds record counts, while a nontrivial skew-indecomposable separable permutation is direct-decomposable. Therefore

```math
K=tz+RJ,
\qquad
F=\frac{K}{1-K}.
```

Eliminating $F,K$ gives the source-faithful quadratic

```math
J=tz+tz(1+R)J+R(1+R)J^2.                 \tag{1}
```

Equivalently, with $q=R/(1+R)=(R+t)/2$,

```math
\frac{F}{1+F}=tz+qF.                    \tag{2}
```

The series $q$ has nonnegative coefficients. If $F_k=[z^k]F$, coefficient extraction yields

```math
F_1=t(1+R),\qquad
F_2=t^2(1+R)^3,\qquad
F_3=t^3(1+R)^4(1+2R).                  \tag{3}
```

For the Conjecture 3 classes, let $H=tz+RJ$. Its first record coefficient is $H_1=F_1$, and

```math
H_k=qF_k\quad(k\ge2).                  \tag{4}
```

The reducible-right-maxima series is $H-tz$. Reverse-complement preserves direct decomposability and exchanges right maxima with left minima. Reversal exchanges the direct and skew types at lengths at least two and exchanges right with left maxima. Inversion preserves the direct type and exchanges left maxima with right minima. Consequently the four Conjecture 3 distributions are precisely $H$ or $H-tz$, with the singleton correction stated above. Reverse and complement give equality of all four unrestricted record distributions.

## 2. The three missing low-record comparisons

We prove

```math
[t^n](F_2-F_1)>0 \quad(n\ge3),         \tag{5}
```

```math
F_2-F_3\succeq0,
\qquad
H_1-H_2\succeq0.                       \tag{6}
```

Here $A\succeq0$ means that every coefficient of $A$ is nonnegative.

The Schröder recurrence, obtained by differentiating the quadratic for $R$, is

```math
nr_n=(6n-9)r_{n-1}-(n-3)r_{n-2}
\quad(n\ge3).                          \tag{7}
```

Reducing (3) modulo $R^2=(1-t)R-t$ gives, beyond the indicated initial terms,

```math
[t^n](F_2-F_1)
=r_{n-4}-6r_{n-3}+7r_{n-2}-r_{n-1}
\quad(n\ge5),
```

```math
[t^n](F_2-F_3)
=-2r_{n-7}+23r_{n-6}-87r_{n-5}
 +122r_{n-4}-53r_{n-3}+7r_{n-2}
\quad(n\ge8),
```

```math
[t^n](H_1-H_2)
=-r_{n-4}+5r_{n-3}-4r_{n-2}+r_{n-1}
\quad(n\ge5).
```

Apply (7) repeatedly. Each expression is

```math
\frac{A(m)r_{m+1}+B(m)r_m}{D(m)},       \tag{8}
```

with the following exact polynomials.

| Difference | $m$ | $D(m)$ | $A(m)$ | $B(m)$ |
| --- | --- | --- | --- | --- |
| $F_2-F_1$ | $n-4$ | $(m+2)(m+3)$ | $m(m+47)$ | $-6(m-3)$ |
| $F_2-F_3$ | $n-7$ | $(m+2)(m+3)(m+4)(m+5)$ | $1282m^4+4637m^3+13106m^2+11515m+4740$ | $-220m^4-467m^3-1232m^2+779m+420$ |
| $H_1-H_2$ | $n-4$ | $(m+2)(m+3)$ | $16m^2+11m+21$ | $-3m^2-9$ |

For every $m\ge1$, both $A(m)$ and $A(m)+B(m)$ are positive. In the middle row their sum is

```math
1062m^4+4170m^3+11874m^2+12294m+5160.
```

In the first and third rows the sums are $m^2+41m+18$ and $13m^2+11m+12$, respectively. Thus the numerator of (8) is

```math
A(m)(r_{m+1}-r_m)+(A(m)+B(m))r_m>0.
```

The remaining coefficients, obtained directly from the quadratic, are:

| Series | Indices | Coefficients |
| --- | --- | --- |
| $F_2-F_1$ | $0,1,2,3,4$ | $0,-1,0,1,3$ |
| $F_2-F_3$ | $0,1,2,3,4,5,6,7$ | $0,0,1,2,3,5,12,43$ |
| $H_1-H_2$ | $0,1,2,3,4$ | $0,1,1,1,2$ |

This proves (5) and (6). These are uniform inequalities over all lengths. The recurrence reductions in (8) are symbolic polynomial identities, not an extrapolation from these initial values.

## 3. A self-contained version of the known declining tail

This section and the next two reconstruct the prior trureturing argument cited above. The needed conclusion is

```math
J_k-J_{k+1}\succeq0\quad(k\ge3),        \tag{9}
```

where $J_k=[z^k]J$.

Use an independent variable $u$ and set

```math
a=u(3+2u),\quad b=u(1+u)^3,
\quad c=4b-a^2=u(4+3u).
```

Define polynomials $T_r(u)$ by the Motzkin generating function

```math
M(v)=1+avM(v)+bv^2M(v)^2
       =\sum_{r\ge0}T_r(u)v^r.
```

They have the explicit nonnegative-coefficient expression

```math
T_r(u)=\sum_{j=0}^{\lfloor r/2\rfloor}
\frac1{j+1}\binom{2j}{j}\binom r{2j}
a^{r-2j}b^j.                            \tag{10}
```

Differentiating the quadratic and eliminating $M^2$ gives

```math
v(1-2av-cv^2)M'(v)+(2-3av-cv^2)M(v)=2.
```

Comparing coefficients proves, for every $r\ge0$,

```math
(r+4)T_{r+2}=(2r+5)aT_{r+1}+(r+1)cT_r.
                                                        \tag{11}
```

Let

```math
G_r(u)=(1+u)^2(T_r+T_{r+1})
 -u(1-u)(1+u)(T_r+2T_{r+1}+T_{r+2}).      \tag{12}
```

The key coefficient sign law is

```math
G_r(R(t))\succeq0\quad\hbox{for every }r\ge0.             \tag{13}
```

## 4. Exact certificates for the sign law

For any polynomial $f(u)$ define

```math
V_f(u)=\frac{(1+u)^2f'(u)}{1-2u-u^2}.
```

Differentiating $t(1+R)=R(1-R)$ gives

```math
R'(t)=\frac{(1+R)^2}{1-2R-R^2}.
```

Hence $V_f\succeq0$ and $f(0)\ge0$ imply $f(R)\succeq0$: the derivative of $f(R)$ is the composition $V_f(R)$, and integration divides its nonnegative coefficients by positive integers.

This test has a finite exact certificate. Write $N_f=(1+u)^2f'(u)=\sum_{j=0}^d p_ju^j$. Set $v_{-1}=v_{-2}=0$ and

```math
v_j=p_j+2v_{j-1}+v_{j-2}\quad(0\le j\le d).
```

If these $d+1$ integers are nonnegative, all subsequent coefficients of $V_f$ are nonnegative by the recurrence $v_j=2v_{j-1}+v_{j-2}$.

Put

```math
E_1=(1+u)^2(1-u-2u^2+3u^3),
\qquad
E_2=(1+u)^2(1-2u-2u^2+4u^3).
```

Apply the certificate to the following sixteen explicitly specified polynomials. The complete coefficient lists and prefixes are in `ckz_certificates.json`; the table records the degree, the minimum of the entire checked prefix, and its final two coefficients. Formula (10) specifies each polynomial exactly.

| $f$ | Degree | Prefix minimum | Final two prefix coefficients |
| --- | ---: | ---: | --- |
| $G_0$ | 7 | 4 | 2224, 5372 |
| $G_1$ | 9 | 4 | 65048, 157044 |
| $G_2$ | 11 | 1 | 1396800, 3372180 |
| $G_3$ | 13 | 0 | 28929352, 69841644 |
| $G_4$ | 15 | 0 | 595325008, 1437241724 |
| $G_5$ | 17 | 0 | 12268912216, 29619774292 |
| $G_6$ | 19 | 0 | 253749072288, 612604451796 |
| $G_7$ | 21 | 0 | 5268900164232, 12720250235340 |
| $G_8$ | 23 | 0 | 109820457718256, 265130038449532 |
| $G_9$ | 25 | 0 | 2296951016145560, 5545330295285428 |
| $G_{10}$ | 27 | 0 | 48191416390935808, 116344371040966548 |
| $G_{11}$ | 29 | 0 | 1013887358943381960, 2447740612679751468 |
| $E_1T_1$ | 7 | 3 | 2252, 5440 |
| $E_1T_2$ | 9 | 1 | 70668, 170612 |
| $E_2T_{13}$ | 31 | 0 | 5530646749767915772, 13352162391984380168 |
| $E_2T_{14}$ | 33 | 0 | 122941413579146512220, 296806828040095303908 |

Their constant terms are nonnegative. Consequently (13) holds for $0\le r\le11$. Recurrence (11), after multiplication by $E_1$ or $E_2$ and substitution $u=R(t)$, propagates the last four certificates to

```math
E_1(R)T_r(R)\succeq0\quad(r\ge1),
\qquad
E_2(R)T_r(R)\succeq0\quad(r\ge13).
```

There is no sign loss in this induction: $a(R)$ and $c(R)$ have nonnegative coefficients and all scalar factors in (11) are positive.

Substitution of (11) in (12) gives the exact identity

```math
(r+4)G_r=(r+4)(E_1T_r+E_2T_{r+1})
 +3u(1-u)(1+u)(cT_r+aT_{r+1}).          \tag{14}
```

For $r\ge12$, the first two terms are nonnegative after composition. The remaining factor obeys

```math
R(1-R)(1+R)=t(1+R)^2\succeq0,
```

and $T_r,a,c$ all have nonnegative coefficients. Therefore (14) proves (13) for every remaining index. This is an unbounded induction; its sixteen certificates do not impose a cutoff on the conjectures.

## 5. Returning from the kernels to actual record counts

Let $B(v)=(1-v)^{-1}M(v/(1-v))$. Its coefficient at $v^m$ is

```math
\sum_{r=0}^m\binom mrT_r(u),
```

and it satisfies $B=1+(1+a)vB+bv^2B^2$. Direct substitution shows that

```math
L(v,u)=v+v^2(1+u)^2B(v)
```

is the unique zero-constant-term solution of

```math
L=v+v(1+u)L+u(1+u)L^2.
```

Comparing with the actual quadratic (1) gives $J(t,z)=L(tz,R(t))$, and hence

```math
J_{m+2}=t^{m+2}(1+R)^2
\sum_{r=0}^m\binom mrT_r(R).            \tag{15}
```

Apply Pascal's identity twice to the adjacent rows in (15), and use $t(1+R)^2=R(1-R)(1+R)$. For every $m\ge0$ this gives

```math
J_{m+3}-J_{m+4}
=t^{m+3}\sum_{r=0}^m\binom mrG_r(R).   \tag{16}
```

The sign law (13) proves (9), with no omitted class-identification assumption or low-length exception.

## 6. Completion of the two conjectures

Since $F=(1+R)J$, equation (9) proves $F_k-F_{k+1}\succeq0$ for every $k\ge3$. Section 2 proves the $k=2$ comparison and the rise from one to two at every length at least three. Thus

```math
[t^n]F_1\le[t^n]F_2\ge[t^n]F_3\ge[t^n]F_4\ge\cdots
\quad(n\ge3).
```

The first inequality is strict. Equidistribution under reversal and complementation proves Conjecture 1 for all four record statistics.

For $k\ge2$, equations (4) and the just-proved tail imply

```math
H_k-H_{k+1}=q(F_k-F_{k+1})\succeq0.
```

Section 2 supplies $H_1-H_2\succeq0$. The series $H-tz$ has the same rows at lengths at least two; its length-one row is zero and is also weakly decreasing. The exact class transports in Section 1 now prove Conjecture 3, including its singleton convention.

## Reproduction and scope of checks

Run `python3 ckz_verify.py` in the directory containing the script. Only Python's standard library is required. It regenerates all sixteen certificates, checks their complete nonnegative prefixes and their exact polynomial remainder identities, verifies the universal reduction (14), and checks the three low-record identities symbolically in the variable $m$. As a separate convention check, it enumerates the actual separable permutations through length eight and compares the record distributions with the displayed generating functions.

The mathematical argument covers every permitted length and record count. Enumeration through eight is a diagnostic check of the definitions; it is not the reason the all-length result holds. The exact certificate arithmetic is a finite component of the proof of the reused tail theorem. The work is unrefereed, and a full prior-resolution audit remains necessary before advertising priority.
