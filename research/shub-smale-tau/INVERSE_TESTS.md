# Exact inverse identities and finite-prime imitations

Status: research. No lower bound for the consecutive-root family or for arbitrary integer-root sets is proved here. This note continues [BOOLEAN_INVERSE.md](BOOLEAN_INVERSE.md); it keeps the rational parameter and the exact inverse identity, rather than replacing them by matrix ranks alone.

## 1. The exact Cauchy inverse is easy in growing positive characteristic

Let $N=2^n$, $n\ge1$, and choose a prime $p$ with $N\lt p<2N$, using Bertrand's postulate. Work over $\mathbb F_p(y)$, and put


```math
B(X)=1+\sum_{i=0}^{n-1}2^iX_i.
```


The labels $B(e)$, $e\in\{0,1\}^n$, are still pairwise distinct: they are the integers $1,\ldots,N$, reduced modulo $p$.

### Proposition 1.1

There is a charged $O(n)$-size circuit over $\mathbb F_p(y)$ for a polynomial $U_p(X,y)$ whose value at every Boolean point is


```math
U_p(e,y)=\frac1{y-B(e)}.
\tag{1}
```


Every binary-cut matrix of these values has maximal rank. Moreover there is an $O(n^2)$-size complete IPS-LIN identity for the inverse equation and the Boolean axioms.

#### Proof

Set $H_p(z)=z^p-z$. Binary exponentiation computes this in $O(\log p)=O(n)$ operations, starting from $1,z$. Every element of $\mathbb F_p$ is a root. The divided-difference construction from [BOOLEAN_INVERSE.md](BOOLEAN_INVERSE.md) computes


```math
U_p(X,y)=\frac{H_p(y)-H_p(B)}{H_p(y)(y-B)}
\in\mathbb F_p(y)[X]
```


using only $O(n)$ charged operations and division by the parameter-only polynomial $H_p(y)$. This proves (1).

For each cut, the Cauchy determinant numerator is a product of differences between distinct row labels and between distinct column labels. Those labels are integers in an interval of length less than $p$, so the differences remain nonzero modulo $p$. The denominator factors $y-a_i-b_j$ are nonzero in $\mathbb F_p(y)$. Thus every square minor is nonzero.

Frobenius gives the exact polynomial identity


```math
H_p(B)=B^p-B
=\sum_{i=0}^{n-1}2^i(X_i^p-X_i).
```


For


```math
S_{p-1}(X)=1+X+\cdots+X^{p-2},
```


the identity $X^p-X=(X^2-X)S_{p-1}(X)$ holds. A geometric sum of any specified length $d$ is computed in $O(\log d)$ operations by maintaining both $X^d$ and $S_d(X)$:


```math
S_{2d}=S_d(1+X^d),\qquad
S_{2d+1}=S_{2d}+X^{2d}.
```


Combining these identities yields


```math
(y-B)U_p+
\sum_{i=0}^{n-1}
\frac{2^iS_{p-1}(X_i)}{y^p-y}(X_i^2-X_i)=1.
\tag{2}
```


The geometric sums cost $O(n\log p)=O(n^2)$, and the remaining scalar and polynomial arithmetic has polynomial cost. Every denominator in (2) is a parameter-only rational function. $\square$

The proposition retains the exact common parameter, simple integer-labelled poles, Boolean-point residue vectors, and full cut ranks. Its failure to hold over $\mathbb Z$ is precisely the missing arithmetic restriction: the integer polynomial $z^p-z$ has only the integer roots $-1,0,1$ when $p$ is odd.

This does not contradict the accepted pinned theorem. Its characteristic-dependent threshold is part of its statement, and it does not assert lower bounds for all functional inverse representatives. A proposed transfer lemma that uses only field-independent Cauchy-pole and Boolean-quotient structure would be false. It must use characteristic zero and the charged arithmetic that constructs the denominator.

Using $z^{p-1}-1$ instead shows that the short-multiple obstruction in positive characteristic does not disappear merely by requiring the polynomial degree to be smaller than the characteristic: its degree is $p-1$, it still vanishes at every label $1,\ldots,N$, and its program has $O(n)$ size.

## 2. Unknown multiplicity obstructs naive residue-as-border extraction

Return to characteristic zero. Let $H$ be any nonzero integral multiple of $F_N$, and let


```math
U(X,y)=\frac{H(y)-H(B)}{H(y)(y-B)}.
\tag{3}
```


Suppose $H$ has multiplicity $m\ge1$ at the integer $j$, so


```math
H(j+\varepsilon)=c\varepsilon^m+O(\varepsilon^{m+1}),\qquad c\ne0.
```


The Laurent expansion of (3), viewed as a polynomial in $X$ with Laurent-series coefficients, satisfies


```math
\lim_{\varepsilon\to0}\varepsilon^m U(X,j+\varepsilon)
=\frac{H(B)}{c(B-j)}.
\tag{4}
```


The quotient on the right is polynomial because $H(j)=0$. Formula (4) follows by specializing the polynomial divided difference at $y=j$; its value there is $H(B)/(B-j)$.

If $m=1$, the right side has value one at the unique Boolean point with $B(e)=j$, and zero at every other Boolean point. It is therefore a polynomial representative of that point idempotent. Its degree can still be as large as $\deg H-1$.

If $m>1$, the right side vanishes at every Boolean point, including $B(e)=j$. The leading global Laurent coefficient is zero only in the Boolean quotient. In particular, $(y-j)U(X,y)$ still has poles as a polynomial in $X$; its pole order is $m-1$. One cannot apply the definition of a border circuit to it before removing these negative-power terms.

At the level of values on the Boolean cube, the coefficient of $(y-j)^{-1}$ in $U$ is the point idempotent. At the level of a polynomial representative, obtaining that coefficient from the leading expansion may require access up to order $m-1$. An arbitrary cofactor can make $m$ exponential in circuit size by repeated powering. Ordinary truncated coefficient tracking then has dependence on $m$, and no polynomial-in-$\log m$ transformation is established here.

There is no contradiction between these statements: specialization to the Boolean quotient kills the higher pole coefficients, while taking the global leading Laurent coefficient occurs before that quotient operation.

The canonical multilinear point idempotent itself is already cheap, independently of $H$:


```math
\delta_e(X)=\prod_{i:e_i=1}X_i\prod_{i:e_i=0}(1-X_i).
```


Therefore producing individual point representatives does not supply a cheap sum of exponentially many selected representatives or a cheap canonical normal form for that sum.

## 3. Grouped residues and the missing contraction

For a set $T\subseteq\{1,\ldots,N\}$, the sum of the Boolean residue vectors at poles in $T$ is the indicator of the corresponding set of bit strings. If membership in that set has a small Boolean circuit, arithmetizing that Boolean circuit already gives a small polynomial representative of the indicator. The representative may have large individual degrees and is not necessarily the canonical multilinear polynomial.

A concrete test uses $m^2$ bits indexed by entries of an $m$-by-$m$ matrix. Let $T$ encode the Boolean permutation matrices. A polynomial representative of its indicator is obtained by multiplying the row and column exact-one predicates. For one row $Z_1,\ldots,Z_m$, an exact-one predicate is


```math
E(Z)=\sum_{j=1}^m Z_j\prod_{k\ne j}(1-Z_k).
```


The product of the $m$ row predicates and $m$ column predicates has polynomial circuit size and agrees with the desired indicator on the cube. Its lowest nonzero homogeneous component has degree $2m$.

In contrast, the canonical multilinear indicator is


```math
\sum_{\sigma\in S_m}
\prod_i X_{i,\sigma(i)}
\prod_{(i,j):j\ne\sigma(i)}(1-X_{ij}),
```


whose homogeneous part of degree $m$ is exactly $\mathop{\mathrm{per}}_m(X)$. Thus the low-degree hard polynomial appears only after the canonical quotient operation. A cheap arbitrary representative of a grouped residue indicator does not give it.

Equivalently, applying a root filter to a Kronecker-encoded product of row sums requires a coefficientwise action, or a sum over Boolean assignments. Ordinary arithmetic substitution into a short univariate root polynomial does not implement that action. A division-free circuit is closed under composition; it is not automatically closed under this coefficientwise contraction.

This records the failed overhead in the attempted reduction. The required selection may be polynomial-time decidable on a root's binary label, but converting its functional representative into the weighted sum that defines the permanent is a separate operation.

## 4. Updated primary-source scope check

The later ECCC version of Alekseev–Grigoriev–Hirsch–Tzameret is Revision 1 of TR19-142, dated 28 December 2022:

<https://eccc.weizmann.ac.il/report/2019/142/revision/1/download/>.

Its Theorem 4.13 is the updated numbering for the rational-parameter IPS result cited as Theorem 3.9 in arXiv:1911.06738v1. Section 4.2.4 writes the multilinear inverse as a sum over Boolean assignments of rational functions. It explicitly distinguishes this expression from ordinary VNP membership, because the reciprocal denominator depends on the summation variables; it introduces a class denoted $\mathrm{VNP}_{\mathrm{div}}^0$ for such expressions. This source does not provide the transfer to the accepted pinned VNP theorem.


## 5. Remaining special step

The linear equivalence from the previous note remains the concrete target: proving a superpolynomial charged circuit lower bound for every polynomial representative of $(y-B_n)^{-1}$ in the characteristic-zero Boolean quotient is equivalent to the consecutive-root multiple lower bound.

The current calculations rule out two unjustified shortcuts. Exact Cauchy-pole structure without the characteristic-zero arithmetic restriction is insufficient by Proposition 1.1. A Laurent leading term or a selected residue is insufficient to obtain the needed canonical polynomial when unknown cofactors create multiplicities or when the selected indicator is represented noncanonically.

No polynomial-overhead grouped-residue, radical-selection, or low-degree hard-factor extraction theorem is proved here. Those transformations remain possible research targets only with the omitted arithmetic and complexity bounds supplied explicitly.

## 6. Arithmetic source dependency

The unrestricted tropical valuation step used in the earlier p-adic
estimate has an explicit isolated-root counterexample. The final 2002
numerical root inequality is not disproved here. The stronger estimates
are conditional until that dependency is repaired. See
[GATE_COUNTS.md](GATE_COUNTS.md) for the exact statement and counterexample,
and [CIRCUIT_HISTORY.md](CIRCUIT_HISTORY.md), Sections 5–7, for the
square-compression calculation and the failed genericity repairs.

## 7. Simultaneous finite-prime approximations to the inverse

The following elementary construction addresses the characteristic-zero
arithmetic restriction. It does not produce an exact inverse. It shows
that a prescribed finite collection of prime-adic tests, even to very
high precision, can all be imitated by a short charged circuit whose
univariate denominator has at most three integer roots.

Let $S=\{p_1,\ldots,p_t\}$ be a nonempty finite set of primes, and let
$k\ge1$. Set


```math
L=\prod_{p\in S}(p-1),\qquad d=L+1,\qquad
h(z)=z^d-z,\qquad H(z)=h(z)^k.
\tag{5}
```


For a prime $p$, write $v_p^G$ for the Gauss valuation on
$\mathbb Q(y)$: for a nonzero polynomial it is the minimum of the
valuations of its coefficients, and on rational functions it is the
difference of these minima for numerator and denominator. Set
$v_p^G(0)=+\infty$.

### Proposition 7.1

There is a charged circuit for a polynomial
$U\in\mathbb Q(y)[X_0,\ldots,X_{n-1}]$ of size


```math
O\!\left(n+\sum_{p\in S}\log_2p+\log_2 k\right)
\tag{6}
```


such that, for every Boolean point $e$, every $p\in S$, and
$j=B_n(e)$,


```math
v_p^G\!\left(U(e,y)-\frac1{y-j}\right)\ge k.
\tag{7}
```


Nevertheless $U$ is not the exact functional inverse when $n\ge1$.
Its common univariate denominator can be taken to be $H(y)$, whose
distinct integer roots form a subset of $\{-1,0,1\}$.

**Proof.** Since $p-1\mid d-1$, Fermat's theorem gives
$h(j)\equiv0\pmod p$ for every integer $j$; the case $p\mid j$
also follows directly from (5). Hence $v_p(H(j))\ge k$.

Use the polynomial divided difference


```math
U(X,y)=\frac{H(y)-H(B_n(X))}{(y-B_n(X))H(y)}.
\tag{8}
```


The numerator divided by $y-B_n(X)$ is an integer polynomial, so
(8) is a polynomial in $X$ with rational-function coefficients and
uses division only by a parameter-only polynomial. It satisfies the
exact identity


```math
(y-B_n(X))U(X,y)=1-\frac{H(B_n(X))}{H(y)}.
\tag{9}
```


Both $H(y)$ and $y-j$ are monic, so their Gauss valuations are
zero at every prime. Evaluating (9) at $e$ proves (7).

Binary exponentiation computes $H$ with at most
$2\lfloor\log_2d\rfloor+2\lfloor\log_2k\rfloor+1$ arithmetic
gates, and $d\le\prod_{p\in S}p$. The simultaneous divided-difference
construction in [BOOLEAN_INVERSE.md](BOOLEAN_INVERSE.md) has linear overhead, proving (6).
The exponents in (5) describe the multiplication schedule; no large
integer is supplied as an uncharged circuit constant.

Finally, an integer zero of $h(z)=z(z^{d-1}-1)$ is zero or an integer
root of unity. Thus there are at most the three asserted roots. In
particular $H(2)\ne0$, so (9) is not the exact inverse identity at
the Boolean point labelled $2$, which exists for $n\ge1$. $\square$

### Corollary 7.2: all prescribed prime-adic cut-minor valuations agree

Fix $N=2^n$, $n\ge1$, and choose
$k>Nn$ in Proposition 7.1. For every binary digit cut, form the
evaluation matrix of $U$ on the Boolean cube and the exact Cauchy
matrix of $1/(y-B_n)$. Every square minor of these two matrices has
the same Gauss valuation at every prime in $S$. The circuit size
remains


```math
O\!\left(n+\sum_{p\in S}\log_2p\right),
```


by taking $k=Nn+1$.

**Proof.** An $r$-by-$r$ minor of a digit cut has entries
$1/(y-1-a_i-b_j)$, where the distinct increasing row and column
labels $a_i,b_j$ are nonnegative integers less than $N$, and
$r^2\le N$. The Cauchy determinant formula gives


```math
v_p^G(\det C)=
\sum_{i\lt j}v_p(a_j-a_i)+\sum_{i\lt j}v_p(b_j-b_i)
\le r(r-1)\lfloor\log_p(N-1)\rfloor\lt Nn.
\tag{10}
```


Every Cauchy entry is Gauss-integral, and (7) says the corresponding
entry error has valuation at least $k$. Expanding the determinant
difference, each summand contains at least one entry error and all
remaining factors are Gauss-integral. Thus
$v_p^G(\det U-\det C)\ge k$. Since (10) is strictly less than $k$,
the nonarchimedean triangle law gives equality of the two determinant
valuations. This argument applies simultaneously to every cut and
every square minor. $\square$

The order of quantifiers matters. The primes are fixed first, and the
short approximation is then constructed for that finite set. This
does not rule out a prime-selection theorem that uses further exact
information about the given circuit. It does rule out treating a
fixed finite collection of cut-minor valuations, or bounded-precision
inverse identities at those primes, as sufficient by itself. Exact
vanishing at all prescribed integers is stronger than all these
finite-prime approximations.

## 8. Differentiation, multiplicity removal, and low-degree factors

### 8.1 What logarithmic differentiation does provide

Given a circuit of length $s$ for a nonconstant $H$, simultaneous
automatic differentiation computes $H$ and $H'$ with at most a
constant times $s+1$ gates. For an addition or subtraction,
differentiate its two inputs; for a product, use
$(uv)'=u'v+uv'$. In the charged parameter model the rational function


```math
R_H(y)=\frac{H'(y)}{H(y)}
```


therefore also has a circuit of length $O(s+1)$. At any root $j$
of multiplicity $m_j$, writing $H(y)=(y-j)^{m_j}Q(y)$ with
$Q(j)\ne0$ gives the exact local identity


```math
R_H(y)=\frac{m_j}{y-j}+\frac{Q'(y)}{Q(y)}.
\tag{11}
```


Thus all poles of the reduced rational function are simple, without
first computing a squarefree part or any factor of $H$.

This does not yet label its poles by Boolean point idempotents. For
example, the tempting expression


```math
W(X,\varepsilon)=
\varepsilon\frac{H'(B_n(X)+\varepsilon)}{H(B_n(X)+\varepsilon)}
\tag{12}
```


has limit $m_j$ after setting $X=e$, where $j=B_n(e)$ is a
prescribed root. But its global limit in the rational-function field
$\mathbb C(X)$ is zero: $H(B_n(X))$ is a nonzero polynomial, so
the quotient in (12) is regular at $\varepsilon=0$ over that field.
Moreover its denominator depends on $X$, contrary to the charged
polynomial-representative model. The limits before and after passage
to the Boolean quotient are different. Formula (12) is not a border
circuit for the polynomial of labelled multiplicities.

The best relevant factor theorem checked for exact circuits is
Dutta--Saxena--Sinhababu, *Discovering the roots*, author manuscript
for JACM (2022), Theorem 1: if $f=u_0u_1$ and
$\mathop{\mathrm{size}}(f)+\mathop{\mathrm{size}}(u_0)\le s$, every factor
of $u_1$ has size polynomial in $s+\deg\mathop{\mathrm{rad}}(u_1)$.
For $F_N\mid H$, the radical degree is at least $N$. The theorem
removes a multiplicity cost but does not remove the number of distinct
roots from the bound. Its Theorem 2 instead gives a small numerator
and denominator followed by a truncated division that may have a
nonunit denominator; it does not justify the Boolean quotient step.

Source: <https://www.cse.iitk.ac.in/users/nitin/papers/factor-closure-jacm.pdf>,
Theorems 1 and 2.

### 8.2 A restriction on the composition-and-factor approach

The following is a consequence of an existing approximate factor
theorem. It does not provide a new circuit lower bound.

**Proposition 8.1.** Let $g_1,\ldots,g_t\in\mathbb C[X]$ be
nonconstant polynomials with circuit sizes at most $s$, and let
$H_1,\ldots,H_t\in\mathbb C[z]$ be arbitrary nonzero univariate
polynomials. Every nonzero degree-$d$ factor $P$ of


```math
\prod_{i=1}^t H_i(g_i(X))
```


has border circuit size polynomial in $s+d+1$, independently of the
degrees and circuit sizes of the $H_i$. Constants are unrestricted
complex constants in this proposition.

**Proof.** Work in the unique factorization domain $\mathbb C[X]$.
Factor $P=c\prod_{\ell=1}^r p_\ell^{e_\ell}$ into distinct
nonconstant irreducibles. Since each outer polynomial splits over
$\mathbb C$, every $p_\ell$ divides some
$g_{i(\ell)}-\alpha_\ell$. This nonzero polynomial has circuit size
at most $s+1$. Bürgisser's approximate factor bound, Theorem 1.3 of
arXiv:1812.06828v1, therefore gives


```math
\underline L(p_\ell)\le
\mathop{\mathrm{poly}}(s+1,\deg p_\ell).
```


There are at most $d$ irreducible factors, and
$\sum_\ell e_\ell\deg p_\ell=d$. Compute the powers by binary
exponentiation and multiply the approximating circuits. Products
and powers preserve their limits. The total border size is
polynomial in $s+d+1$. $\square$

The approximate factor theorem used here bounds the border
complexity of a degree-$d$ factor polynomially in $d$ and the
complexity of any nonzero multiple; it is independent of the
factor's multiplicity. The 2018 arXiv version corrects Theorem 5.7
of the 2004 publication and is the version cited here:
<https://arxiv.org/html/1812.06828v1>, Theorem 1.3.

In particular, substituting short polynomials into a hypothetical
short consecutive-root multiple, differentiating only the outer
univariate polynomial, multiplying such expressions, and selecting
low-degree factors cannot produce the required border-hard family.
The resulting low-degree factors are already border-easy regardless
of whether the outer polynomial has many integer roots. A successful
factor construction must add another relation that is absent from
this class of compositions. Addition between independent
substitutions or a Boolean quotient contraction are possible places
for such a relation, but no required construction is established here.

## 9. Current source on the Valiant-to-BSS direction

Bürgisser, *Intractability of Hilbert's Nullstellensatz implies
algebraic hardness of permanent*, arXiv:2606.25121v2 (19 October 2026),
Theorem 1.1 proves implications from BSS separation to constant-free
Valiant separation, in the stated uniform and nonuniform models.
Its Conjecture 1.1 is the reverse-direction assertion


```math
\mathrm{VNP}_{\mathbb C}\not\subseteq\overline{\mathrm{VP}}_{\mathbb C}
\quad\Longrightarrow\quad
\mathrm P_{\mathbb C}(\mathrm{nu})\ne
\mathrm {NP}_{\mathbb C}(\mathrm{nu}).
```


Section 1.4 describes a recent reduction from small circuits for
quadratic-system multivariate resultants to small permanent
circuits, and identifies extension to arbitrary nonzero multiples
of those resultants as a remaining step. Accordingly the accepted
pinned border lower bound does not gain the desired BSS implication
from this cited theorem alone. The separate consecutive-root
multiple criterion still requires its own lower bound.

Primary version: <https://arxiv.org/html/2606.25121v2>, Section 1.4,
Theorem 1.1 and Conjecture 1.1.
