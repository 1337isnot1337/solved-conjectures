# Recovering an unknown cofactor with few distinct roots

Status: proved restricted reduction, within an unresolved research project.
The Shub--Smale tau conjecture and the unrestricted consecutive-root
all-multiples problem are not solved. No novelty claim is made. The theorem
below removes the requirement that the low-degree bases of a powered
cofactor be supplied: it recovers suitable bases from the circuit for the
multiple itself.

## 1. Statement and model

Let


```math
F_N(x)=\prod_{j=1}^{N}(x-j),\qquad N\ge1.
```


A constant-free division-free program starts with 1 and x and uses binary
addition, subtraction, and multiplication. Its length is the number of
operations. All integer constants used below are constructed from 1.

### Theorem 1.1

Suppose a program of length s computes a nonzero polynomial


```math
H=F_NQ\in\mathbb Z[x],\qquad Q\in\mathbb Z[x]\setminus\{0\}.
```


Let d be the number of distinct complex roots of Q. Then there is a
nonzero integer c and a constant-free division-free program for cF_N of
length


```math
O\bigl((s+1)(d+1)^{14}\bigr).
\tag{1.1}
```


The implicit constant is absolute. No program, coefficient list,
factorization, or root list for Q is supplied. No coprimality assumption
between Q and F_N is made. The bound is independent of the total degree
of Q except through s and d; root multiplicities may be arbitrarily large.

This is a circuit-existence theorem. The value of d, a suitable shift,
the occurring multiplicities, and the nonzero pivots of low-degree scalar
linear algebra may be selected nonuniformly. The statement does not claim
a polynomial-time algorithm that finds these choices from the input circuit.

If d=0, Q is a nonzero integer constant and H itself is the required output.
Hence the proof assumes d>=1. The exponent 14 is a loose polynomial bound,
not an optimization claim.

## 2. Scalar arithmetic can be cleared without charging bit lengths

We repeatedly compute rational numbers as intermediate scalar data. The
final polynomial programs still have only +,-,* and integer constants
constructed from 1.

### Lemma 2.1. Scalar fraction clearing

A rational scalar computation using L operations +,-,*,/ from available
integers, with every divisor nonzero, can be replaced by an integer
computation using O(L) operations that represents every value as P/Q,
where P,Q are computed integers and Q!=0. A list of k such rational
outputs can be multiplied by one common nonzero computed integer D so
that every scaled output is a computed integer, with O(k) additional
operations.

**Proof.** Represent the initial integer a by (a,1). For example, addition
uses (P1Q2+P2Q1,Q1Q2), multiplication uses (P1P2,Q1Q2), and division uses
(P1Q2,Q1P2). At most four integer gates are needed per operation. The
nonzero-divisor hypothesis ensures that no produced denominator is zero.
For final pairs (P_j,Q_j), take D=product_j Q_j. Prefix and suffix products
compute D/Q_j as the product of all other denominators, with no division.
Then DP_j/Q_j=P_j product_(i!=j)Q_i. QED.

Consequently, Gaussian elimination on a nonsingular r-square rational
matrix whose entries have short scalar computations can be compiled into
short integer computations for numerators and denominators of its solution.
One can choose a valid pivot schedule nonuniformly. It uses O(r^3) rational
operations. Dense Euclidean gcd computation for two rational polynomials
of degrees at most r uses O(r^3) scalar operations: at most r polynomial
division steps, each requiring O(r^2) operations. Its degree and pivot
choices can likewise be fixed for the actual input. Lemma 2.1 removes all
scalar divisions from the resulting coefficient programs.

These are arithmetic gate counts. They do not charge the possibly enormous
binary lengths of the integer values occurring in the computation.

## 3. A short safe center and a shift avoiding the cofactor roots

The degree of every polynomial computed by a length-s program is at most
2^s. This follows inductively because addition takes the maximum of the
two input degrees and multiplication adds them. Hence


```math
N\le\deg H\le2^s,
 \qquad \deg Q\le2^s.
\tag{3.1}
```


In particular N and every positive root multiplicity of Q have binary
length O(s+1), so a chosen such integer can be constructed in O(s+1)
gates by binary doubling and addition.

Compute a positive majorant t from the program for H: replace both
initial registers by 1 and replace subtraction by addition. The same
number s of gates gives


```math
t\ge\|H\|_1\ge1,
```


where the norm is the sum of the absolute values of the coefficients.
Every complex root alpha of H satisfies |alpha|<t. Indeed, if H has
degree D and leading coefficient a_D, then for |z|>=t,


```math
\left|\sum_{i\lt D}a_i z^i\right|
 \le(\|H\|_1-|a_D|)|z|^{D-1}
 \le(t-1)|z|^{D-1}<|z|^D\le|a_Dz^D|.
\tag{3.2}
```


As N is a root of H, this also gives t>N.

Let Omega be the set of distinct roots of Q, so |Omega|=d. Choose an
integer


```math
1\le h\le d^2+1
\tag{3.3}
```


such that Omega and Omega-h are disjoint. A bad h must equal a difference
of two roots in Omega, and there are at most d^2 ordered pairs. The
pigeonhole principle proves the existence of (3.3). Its binary length is
O(log(d+1)); no root computation is part of the claimed output program.

Put


```math
D_h(x)=\prod_{i=0}^{h-1}(x+i),\qquad
 E_{N,h}(x)=\prod_{i=0}^{h-1}(x+i-N).
\tag{3.4}
```


All the following numbers are nonzero:


```math
H(t),\quad H(t+h),\quad D_h(t),\quad E_{N,h}(t).
\tag{3.5}
```


For H this follows from (3.2), since h>0. For D_h and E_(N,h), all
displayed linear factors are positive at t>N.

## 4. A low-degree rational function exposes the cofactor multiplicities

The endpoint identity gives


```math
\frac{F_N(x+h)}{F_N(x)}=\frac{D_h(x)}{E_{N,h}(x)}.
\tag{4.1}
```


Taking logarithmic derivatives of the rational identity (4.1), and using
H=F_NQ, yields


```math
\begin{split}
 L_h(x):={}&\frac{H'(x+h)}{H(x+h)}-\frac{H'(x)}{H(x)}
            -\frac{D_h'(x)}{D_h(x)}
            +\frac{E_{N,h}'(x)}{E_{N,h}(x)}\\
       ={}&\frac{Q'(x+h)}{Q(x+h)}-\frac{Q'(x)}{Q(x)}.
\end{split}
\tag{4.2}
```


Let m_alpha be the positive multiplicity of alpha in Q. Over C(x),


```math
L_h(x)=\sum_{\alpha\in\Omega}m_\alpha
        \left(\frac1{x-(\alpha-h)}-\frac1{x-\alpha}\right).
\tag{4.3}
```


Because the two support sets are disjoint, (4.3) has exactly 2d distinct
simple poles. At an original cofactor root alpha the residue is
-m_alpha, and at alpha-h it is +m_alpha. None of these residues is zero
in characteristic zero. Thus the reduced denominator of L_h has degree
exactly M=2d and is squarefree, while its reduced numerator has degree
less than M. This remains true when Q has roots among 1,...,N: (4.2)
has subtracted the multiplicity-one contribution of F_N exactly.

The left side of (4.2) has a rational circuit of length O(s+h+1), after
the scalar constants have been made available. Simultaneous computation
of a polynomial and its derivative costs O(s) by the gatewise product
rule; constructing D_h,E_(N,h) and their derivatives costs O(h).
This uses no information about the coefficients of Q.

## 5. Exact Padé recovery from a short jet

Expand at the safe center t, writing z=x-t:


```math
L_h(t+z)=\sum_{k\ge0}\ell_k z^k
         =\frac{A_*(z)}{R_*(z)},
\tag{5.1}
```


where deg R_*=M, deg A_*<M, gcd(A_*,R_*)=1, and R_*(0)=1. The
normalization is possible by (3.5). All coefficients lie in Q.

Compute the coefficients ell_0,...,ell_(2M-1) from the rational circuit
in (4.2). Every denominator has nonzero constant term at t. One can
therefore evaluate the circuit in rational coefficient arrays modulo
z^(2M). For division of series f/g, use


```math
v_0=f_0/g_0,\qquad
 v_k=\left(f_k-\sum_{i=1}^k g_i v_{k-i}\right)/g_0.
\tag{5.2}
```


Addition, multiplication, and (5.2) each use O(M^2) rational scalar
operations per gate. Consequently the whole jet has a scalar computation
of length


```math
O((s+h+1)(d+1)^2)
 =O((s+1)(d+1)^4).
\tag{5.3}
```


Lemma 2.1 compiles these operations to integer numerator/denominator
programs. No degree(H)-length array is used.

Write R_*(z)=1+sum_(j=1)^M r_j z^j. Its coefficients are the unique
solution of the M-square linear system


```math
\ell_k+\sum_{j=1}^{M}r_j\ell_{k-j}=0,
                 \qquad M\le k\le2M-1.
\tag{5.4}
```


After solving it, compute the coefficients of A_* by multiplying R_*
by the jet and retaining degrees less than M.

To prove uniqueness, let A_1/R_1 and A_2/R_2 satisfy the same degree
bounds, R_i(0)=1, and the same jet through degree 2M-1, with the true
reduced pair among them. Their cross difference A_1R_2-A_2R_1 has
degree at most 2M-1 and is divisible by z^(2M), hence is zero.
Coprimality of the true pair implies that its degree-M denominator
divides the other denominator. The equal degree bound and the value
one at zero force the denominators, and then numerators, to agree.
Existence is supplied by (5.1), so the matrix in (5.4) is nonsingular.

The solve costs O(M^3) rational operations. Clear one common scalar
denominator for the entire pair A_*,R_* using Lemma 2.1. This gives
integer polynomials A_tilde,R_tilde with


```math
\frac{A_\sim}{R_\sim}=\frac{A_*}{R_*},
 \qquad (A_\sim,R_\sim)=c(A_*,R_*)
 \quad\text{for one }c\in\mathbb Z\setminus\{0\}.
\tag{5.5}
```


Using a single common scalar in (5.5) is essential: it leaves the
residue A/R' unchanged. Set


```math
A(x)=A_\sim(x-t),\qquad R(x)=R_\sim(x-t).
```


These are integer polynomials with short charged coefficient programs,
deg R=2d, R squarefree, and L_h=A/R. Horner substitution by x-t constructs
each polynomial circuit with O(d) additional gates. Expanding the resulting
coefficient lists in the ordinary x basis costs O(d^2) scalar operations,
which is absorbed by (5.3). These coefficient lists are used in the next
section's dense polynomial arithmetic.

## 6. Recovering bases grouped by multiplicity

Let m_1,...,m_r be the distinct positive multiplicities occurring in Q.
There are at most d of them. By (3.1), each m_j<=2^s, so its constant
program has length O(s+1).

For a positive integer m in this list, compute the monic gcd over Q:


```math
G_m=\gcd\bigl(R,\ A+mR'\bigr).
\tag{6.1}
```


At an original cofactor root alpha, equations (4.3) and (5.5) give


```math
A(\alpha)+mR'(\alpha)
   =(m-m_\alpha)R'(\alpha).
```


At a shifted root beta=alpha-h, they give


```math
A(\beta)+mR'(\beta)
   =(m+m_\alpha)R'(\beta)\ne0.
```


The derivative R' is nonzero at every root because R is squarefree.
Thus G_m has exactly the original roots of Q whose multiplicity is m,
each once. In particular,


```math
\sum_m\deg G_m=d,
```


and no coprimality with F_N was needed.

Both arguments of every gcd have degree at most 2d. Dense rational
Euclidean computation therefore uses O((d+1)^3) scalar operations for
each m. Its actual nonzero leading-coefficient pivots can be selected
nonuniformly. Clear the output coefficient denominators, separately for
each gcd, to produce an integer polynomial S_m that is a nonzero
integer scalar multiple of G_m. Every coefficient is produced by a
constant-free integer program; no algebraic-root constant has been
introduced.

All coefficient computations, including the jet, Padé solve, at most d
gcds, chosen multiplicity constants, and denominator clearing, have a
shared program of length


```math
O((s+1)(d+1)^4).
\tag{6.2}
```


The bases S_m have total degree d. If separate programs for all of them
are required, copy the shared computation at most d times. Their total
length is then bounded by O((s+1)(d+1)^5).

The multiplicities and root sets now agree, so


```math
Q=\lambda\prod_m S_m^m
              \qquad\text{for some }\lambda\in\mathbb Q^*.
\tag{6.3}
```


The scalar need not be an integer after the individual bases have been
scaled. There is no need to compute it or divide by it.

## 7. Removing the recovered powers

Use the already proved powered-cofactor extraction in
[POWERED_COFACTORS.md](POWERED_COFACTORS.md), Theorem 4.1. Its algebraic proof also works
with the nonzero rational scalar lambda in (6.3); the following paragraph
records the needed amendment explicitly.

Put S=product_m S_m, let M_0=max m, and put
J=product_m S_m^(M_0-m). Then
product_m S_m^m times J equals S^(M_0). The bases have total degree d,
and the shift h chosen in Section 3 also makes S and S(x+h) coprime.
A charged low-degree Bezout computation gives


```math
C(x)S(x)+D(x)S(x+h)=c_1\ne0,
                \qquad C,D\in\mathbb Z[x],\ c_1\in\mathbb Z.
```


The short power-lifting identity from that theorem gives integer
polynomials U,V with


```math
U S^{M_0}+V S(x+h)^{M_0}=c_1^{M_0L},
\tag{7.1}
```


where L is a power of two at least M_0 and its circuit overhead is
O(log(M_0+1)). The endpoint transport is exact:


```math
\mathcal A_{N,h}H
 =\frac{E_{N,h}(x)H(x+h)}{D_h(x)}
 =F_N(x)Q(x+h).
\tag{7.2}
```


It is computed without division by the known degree-h Newton-basis
matrix construction in [ANCHORED_DIFFERENCES.md](ANCHORED_DIFFERENCES.md), Lemma 2.1.
Its cost is O((s+1)(h+1)^4+log(N+1)), independent of deg H.

Multiply (7.1) by lambda F_N and use (6.3). This gives the
division-free polynomial identity


```math
(UJ)H+(VJ(x+h))\mathcal A_{N,h}H
       =\lambda c_1^{M_0L}F_N.
\tag{7.3}
```


The left side is computed entirely in Z[x]. The scalar on the right
is nonzero. Since F_N is monic, that scalar is the leading coefficient
of the left side and is therefore an integer. This proves the rational
scalar amendment without computing lambda or its denominator.

For the size bound, the powered extraction uses


```math
O\left((s+T+1)(d+1)^8
       +(d+1)\sum_m\log_2(m+1)+\log(N+1)\right),
```


where T is the total size of supplied base programs. Section 6 gives
T=O((s+1)(d+1)^5). Also sum_m log_2(m+1)<=d(s+1) and
log_2(N+1)<=s+1 by (3.1). Substitution is bounded by
O((s+1)(d+1)^14), as stated. This proves Theorem 1.1.

## 8. Scope

The theorem handles an unknown cofactor with few distinct complex roots,
even when those roots have enormous multiplicities and even when they
coincide with prescribed consecutive roots. The low-degree object used
for recovery is the shifted logarithmic derivative, not the high-degree
cofactor itself.

The parameter d is not bounded polynomially in s by this argument.
For example, when Q itself has exponentially many distinct roots, the
recovery bound can still be exponential. If H=F_N^2, then Q=F_N has
d=N; the theorem does not remove that multiplicity in polynomial time
in log N. Thus uniform powers of a large distinct-root support and
unrestricted cofactors remain outside the proved reduction.

The output is a nonzero integer scalar multiple of F_N. The argument
does not divide out that scalar, prove a lower bound for F_N, or prove
the full arbitrary-integer-root tau conjecture.

## 9. Exact checks and review

Root and both other research workers independently reviewed the proof,
including its nonuniform choices, scalar-denominator compilation, the exact
Padé rank argument, residue signs, and the nonintegral scalar amendment.
The accompanying [cofactor_recovery_checks.py](cofactor_recovery_checks.py)
recovers the bases from five small dense test inputs using only the stated
jet, Padé and gcd operations. The input factorizations are used to create
the tests and to check their outputs, not by the recovery procedure.
The examples include complex and irrational real cofactor roots, large
relative multiplicities, nonmonic factors, overlap with the prescribed
interval, a unit shift that must be rejected, and H=F_3^4. Extra scaling
of each recovered base forces a nonintegral residual scalar. The checks
verify finite algebraic identities; they do not verify the asymptotic
circuit bound, which rests on the written proof.


## Refinement of the separating shift

[RATIONAL_POLE_SELECTION.md](RATIONAL_POLE_SELECTION.md), Section 1, proves that if the unknown cofactor has r distinct irreducible factors over Q, a separating positive integer shift can be chosen at most binom(r,2)+1. This replaces the d²+1 shift choice in the proof without changing its other steps. It does not replace the radical-degree parameter d in the Padé reconstruction: a single irreducible cofactor x^(2^k)+2 already contributes 2^(k+1) shifted logarithmic-derivative poles. The same note gives a charged long-jet obstruction to fixed-center rational-pole selection.
