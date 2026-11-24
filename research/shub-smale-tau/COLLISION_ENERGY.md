# Truncated root-difference energy: exact laws and the remaining gap

Status: research. No new unrestricted root upper bound is proved here.
The arithmetic minimum and product laws below are exact. A polynomial
circuit bound for the proposed root-selected energy is tau-equivalent,
as proved in Section 4. It must not be reported as a solution or as a
weaker independently established circuit estimate.

## 1. A primitive three-root obstruction to untruncated support

Let p_1,...,p_k be the first k primes, M_k=product_j p_j, and
A_k=2^(M_k). The polynomial


```math
g_k(x)=x(x-1)(x-A_k)
```


is monic and squarefree and has exactly three integer roots
R_k={0,1,A_k}. Its root differences have gcd 1, while their product
in absolute value is


```math
\Delta(R_k)=A_k(A_k-1).
```


The elementary cyclotomic support lemma in
[ARITHMETIC.md](ARITHMETIC.md), Lemma 5.3, gives


```math
\omega(\Delta(R_k))\ge \omega(2^{M_k}-1)\ge2^{k-1}.
\tag{1.1}
```


For completeness, its argument is short. In
2^M-1=product_(d|M) Phi_d(2), all 2^k-1 factors with d>1 are integers
greater than 1. For an odd prime ell dividing Phi_d(2), squarefreeness
of M implies d is either ord_ell(2) or ell ord_ell(2). In the case
ell does not divide d this follows from squarefreeness of x^d-1 modulo
ell. In the other case write d=ell e and use
Phi_(ell e)=Phi_e^(ell-1) modulo ell. Thus each prime covers at most
two of those nonunit factors, proving (1.1).

Bertrand's theorem gives p_j<=2^j and
log_2 M_k<=k(k+1)/2. Starting from 2=1+1, binary powering computes
A_k in at most 2 floor(log_2 M_k)+1 gates. Four further gates form
x-1, x-A_k, and their product with x. Consequently


```math
\tau(g_k)\le k(k+1)+5.
\tag{1.2}
```


The exponent is implemented by its binary powering schedule; neither
M_k nor its prime factors are uncharged scalar inputs. The only
imported prime bound is Bertrand's theorem, in the form that for each
integer n>=1 a prime lies in (n,2n]. A primary version is P. Erdos,
*Beweis eines Satzes von Tschebyschef*, Acta Sci. Math. (Szeged) 5
(1932), 194--198, main unnumbered theorem on p. 194:
<https://www.renyi.hu/~p_erdos/1932-01.pdf>.

Thus raw prime support of root differences is not polynomially bounded
by circuit size, even after dividing out the common affine scale. The
failure occurs for a primitive three-point configuration, independently
of cofactors or root multiplicity.

## 2. A truncation with an exact universal minimum

For an integer T>=2, put


```math
L_T=\mathop{\mathrm{lcm}}(1,\ldots,T),\qquad
 K_T(d)=\log\gcd(|d|,L_T)\quad(d\ne0).
```


For a finite set R of distinct integers, define


```math
E_T(R)=\sum_{\{r,t\}\subset R}K_T(r-t).
\tag{2.1}
```


All logarithms in this note are natural. Every pair contributes at
most B_T=log L_T; primes greater than T and valuations deeper than
floor(log_p T) contribute nothing. This removes the unbounded support
and depth in Section 1 when T is bounded by the root count.

For q=p^a, let n_(q,c) count elements of R in the residue class c
modulo q. Then the exact identity is


```math
E_T(R)=\sum_{p^a\le T}\log p
               \sum_{c\bmod p^a}\binom{n_{p^a,c}}2.
\tag{2.2}
```


Indeed min(v_p(d),floor(log_p T)) is the number of positive a with
p^a<=T and p^a|d. Each unordered congruent pair is counted once in
the corresponding residue class.

For N=|R|, write N=q b+c, 0<=c<q. Among q nonnegative integers with
sum N, the sum of their binomial coefficients is minimized when they
differ by at most one: replacing entries u,v with u-1,v+1 decreases
the sum whenever u>=v+2. The minimum is


```math
q\binom b2+bc.
\tag{2.3}
```


An interval I_N of N consecutive integers attains this minimum for
every q simultaneously. Therefore, for every T>=2,


```math
\boxed{E_T(R)\ge E_T(I_N)
  =\sum_{d=1}^{N-1}(N-d)\log\gcd(d,L_T).}
\tag{2.4}
```


In particular, if T>=N-1, every d occurring on the right divides L_T,
so


```math
\boxed{E_T(R)\ge\log\prod_{j=1}^{N-1}j!.}
\tag{2.5}
```


This is also an integer divisibility statement: the product of
gcd(|r-t|,L_T) over pairs is divisible by product_(j=1)^(N-1) j!.
It follows prime by prime from (2.3). Equality holds for an interval.
No prime distribution theorem is used.

A coarser useful formula is


```math
E_T(R)\ge\frac12(N^2 A_T-NB_T),\qquad
 A_T=\sum_{p^a\le T}\frac{\log p}{p^a}.
\tag{2.6}
```


It follows by Cauchy--Schwarz in each residue-class sum. At T=N,
the lower bound (2.5) is of order N^2 log N. An elementary quantitative
lower bound for N>=8 is


```math
E_N(R)\ge\lfloor N/2\rfloor\lfloor N/4\rfloor
                           \log\lfloor N/4\rfloor:
\tag{2.7}
```


use the last floor(N/2) factorials in (2.5), each of which contains
at least floor(N/4) factors at least floor(N/4).

The crude upper bound is


```math
E_T(R)\le\binom N2 B_T.
\tag{2.8}
```


For completeness B_T<4T log 2. For a positive integer m, every prime
power p^a in (m,2m] contributes a positive term to the p-adic
valuation of binom(2m,m), so
B_(2m)-B_m<=log binom(2m,m)<=2m log 2. Sum this at powers of two,
and dominate T by the next power of two. Hence E_N(R)=O(N^3).

## 3. Exact product and history laws

For disjoint A,B, let


```math
C_T(A,B)=\sum_{a\in A,\ b\in B}K_T(a-b).
```


If C=A intersect B, direct partition of unordered pairs gives


```math
E_T(A\cup B)=E_T(A)+E_T(B)-E_T(C)
                      +C_T(A\setminus B,B\setminus A).
\tag{3.1}
```


Thus the integer-root energy of a product obeys (3.1), with A,B the
integer root sets of the two factors. A power has the same energy as
its base. The cross term is nonnegative and is at most
|A\setminus B||B\setminus A| B_T. Dropping it is invalid.

A more convenient way to avoid paying repeatedly for multiplication
reuse is to fix the final integer root set R and let S_i consist of
those r in R where some nonzero polynomial register among the first
i registers vanishes. Identically zero registers are excluded.
Start with S_0=R intersect {0}, accounting for the input x.

At a multiplication gate producing a nonzero polynomial, a root of
the product was already a root of one parent. Thus S_i=S_(i-1), and
the energy changes by exactly zero. At an addition/subtraction gate,
put D_i=S_i\setminus S_(i-1). Then


```math
E_T(S_i)-E_T(S_{i-1})
    =E_T(D_i)+C_T(S_{i-1},D_i).
\tag{3.2}
```


This is a genuine history identity, but it supplies no upper bound
for the new set D_i. Its right side cannot be replaced by an energy
of the operands' integer root sets.

For example, put F_N=product_(j=1)^N(x-j),
U=F_N^2+F_N+1, and V=F_N^2+1. Neither U nor V has a real root,
whereas U-V=F_N has energy (2.5). This refutes a gate rule that
charges only parent root supports, even before circuit history is
considered.

There is also an explicit complete-history example with one root
birth. Build the constants 1,...,2N and the common A=x+N, and for
each j set B_j=N+j. Represent each x-j by the positive pair (A,B_j).
Multiply pairs by


```math
(a,b)(c,d)=(ac+bd,ad+bc).
\tag{3.3}
```


After N factors the difference of the final pair is F_N. Every
nonconstant register before that last subtraction is positive at
each r=1,...,N. Hence all N selected roots first vanish at that one
subtraction. The program has at most 8N-5 gates for N>=1, and all its
polynomial degrees are at most N. Consequently an increment bound
of the form


```math
E_N(S_i)-E_N(S_{i-1})
       \le C N A_N(1+\log\deg h_i)^c
\tag{3.4}
```


with fixed C,c is false: the left side is of order N^2 log N, while
the right side is at most order N (log N)^(c+2), since A_N<=
sum_(m=2)^N log(m)/m=O((log N)^2). Charging only the bit lengths of
multiplication exponents therefore cannot justify (3.4).

Replacing the final subtraction by the three-gate tail a+1,
h=(a+1)-b, h-1 gives the same root birth at a last
addition whose parents have resultant Res(h,1)=1. All preceding
nonzero registers are still nonzero on R. This program is not claimed
to be minimal: its purpose is to refute a resultant-only law for
arbitrary histories. The separate minimal-program unit-resultant
descent retains the earlier addition that produced h and does not
prove an energy estimate for it.

## 4. The honest scope of the candidate addition bound

For a length-s program and its final N-element integer root set R,
take T=max(2,N). A sufficient proposed addition law would be the
existence of absolute constants C,c such that every nonzero
addition/subtraction gate in the history above satisfies


```math
E_T(S_i)-E_T(S_{i-1})\le C(1+s)^c N.
\tag{4.1}
```


Products contribute zero. Summing (4.1), then using (2.5), would give
N log N<=O((1+s)^(c+1)), and therefore the tau conjecture.

But (4.1) is not an established intermediate theorem, and allowing an
unspecified polynomial exponent makes it tau-equivalent. To see the
converse, assume the tau conjecture gives N<=(1+s)^d. By monotonicity
of E_T under inclusion and (2.8), every increment is at most
E_T(R)=O(N^3), hence at most O((1+s)^(2d)N). Small N is absorbed
in the absolute constant. This is (4.1) with another fixed exponent.
The same argument shows that merely bounding E_T(R)/N polynomially
in s is tau-equivalent.

The truncation therefore repairs the explicit defect in Section 1
and records product reuse exactly, but supplies no established
unrestricted gain. A useful next step must prove a gate estimate
from additional trace data, rather than assume (4.1). In particular,
it must retain cancellation information at additions with nonzero
parent values, survive the unit-resultant descent, and remove repeated
power contributions without dropping the cross term in (3.1).
