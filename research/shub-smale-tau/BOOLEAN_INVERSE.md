# Boolean inverses and extraction costs

Research status. This note proves reductions and counterexamples. It does not prove a superpolynomial lower bound for consecutive-root multiples or the Shub–Smale tau conjecture. The accepted pinned Anthropic theorem is used only within its stated scope. No novelty claim is made for the elementary reductions.

## 1. Models and the consecutive-root quantity

Put

```math
N=2^n,\qquad F_N(z)=\prod_{j=1}^{N}(z-j),\qquad
\mu(n)=\min_{0\ne H\in\mathbb Z[z],\ F_N\mid H}\tau(H).
```

Here $\tau$ counts arithmetic operations from $1,z$ over $+, -,\times$. For this note $n\ge1$. The degree bound gives $\mu(n)\ge n$.

For Boolean variables $X=(X_0,\ldots,X_{n-1})$, write

```math
B_n(X)=1+\sum_{i=0}^{n-1}2^iX_i.
```

Define a charged rational-parameter circuit to start from $1,y,X_0,\ldots,X_{n-1}$, to use $+, -,\times$, and to allow division only when its denominator is a nonzero polynomial or rational function of $y$ computed by a subcircuit containing no $X_i$. Rational functions of $y$ are not free inputs. All arithmetic operations, including those used to build the rational parameter constants, are counted. Every gate therefore computes an element of $\mathbb Q(y)[X]$.

Let $\kappa(n)$ be the minimum size of such a circuit computing a polynomial representative $U(X,y)\in\mathbb Q(y)[X]$ for which

```math
U(e,y)=\frac1{y-B_n(e)}\quad\text{in }\mathbb Q(y)
\qquad(e\in\{0,1\}^n).
\tag{1}
```

The polynomial representative need not be multilinear and may have exponentially large degree.

## 2. A cofactor-independent, linear-cost inverse reduction

### Proposition 2.1

For all $n\ge1$,

```math
\mu(n)\le4\kappa(n),\qquad
\kappa(n)\le5\mu(n)+2n+1\le7\mu(n)+1.
\tag{2}
```

Thus polynomial upper bounds for these two minimum complexities are equivalent. In particular, proving that every polynomial representative in (1) has superpolynomial charged circuit complexity is sufficient for the consecutive-root BSS route.

#### Proof: from a multiple to an inverse representative

Let $H$ be a nonzero multiple of $F_N$, computed by a program of length $s$. The binary-value polynomial $B=B_n(X)$ has a program of length $2n-1$: use Horner evaluation, replacing each doubling by $u+u$, then add $1$. Construct $0=1-1$ once.

For every original register $h$, compute simultaneously

```math
A_h=h(y),\qquad C_h=h(B),\qquad
D_h=\frac{h(y)-h(B)}{y-B}.
```

The last expression is a polynomial. At the initial registers, $(A_1,C_1,D_1)=(1,1,0)$ and $(A_z,C_z,D_z)=(y,B,1)$. Addition and subtraction act componentwise and cost three operations. At a multiplication register $h=ab$, set

```math
A_h=A_aA_b,\qquad C_h=C_aC_b,\qquad
D_h=D_aA_b+C_aD_b.
\tag{3}
```

These five operations preserve the identity because

```math
a(y)b(y)-a(B)b(B)
=(a(y)-a(B))b(y)+a(B)(b(y)-b(B)).
```

At the output set $U=D_H/A_H$. This is one permitted division because $A_H=H(y)\ne0$ and its circuit contains no Boolean variables. The total operation count is at most

```math
(2n-1)+1+5s+1=5s+2n+1.
```

As a polynomial identity over $\mathbb Q(y)$,

```math
(y-B)U+\frac{H(B)}{H(y)}=1.
\tag{4}
```

At every Boolean point $e$, the integer $B(e)$ belongs to $`\{1,\ldots,N\}`$, so $H(B(e))=0$. Equation (1) follows. The construction does not inspect or divide out the unknown cofactor of $F_N$.

#### Proof: from an inverse representative to a multiple

Clear every circuit register as $P/Q$, where $P\in\mathbb Z[y,X]$ and $0\ne Q\in\mathbb Z[y]$. At addition or subtraction use

```math
\frac{P_a}{Q_a}\pm\frac{P_b}{Q_b}
=\frac{P_aQ_b\pm P_bQ_a}{Q_aQ_b},
```

which uses four division-free operations. Products use two. A permitted division uses

```math
\frac{P_a/Q_a}{P_b/Q_b}
=\frac{P_aQ_b}{Q_aP_b},
```

also two. The denominator subcircuit contains no $X$, so $P_b$ is univariate and nonzero. At the output one obtains $U=P/Q$ and a univariate program of length at most $4t$ for $Q$, where $t$ is the original charged size.

For each $`j\in\{1,\ldots,N\}`$, choose the unique Boolean point $e$ with $B(e)=j$. Equation (1), as an equality of rational functions, gives

```math
(y-j)P(e,y)=Q(y).
```

This is a polynomial identity. Substituting $y=j$ proves $Q(j)=0$, even though the original rational functions have poles there. Consequently $F_N\mid Q$, $Q\ne0$, and $\mu(n)\le4t$.

If a model permits a divisor circuit that syntactically uses $X$ but cancels to a rational function of $y$, the same argument works after substituting $X=0$ in the final denominator circuit, with the safe count $4t+1$. The syntactic restriction above avoids this bookkeeping change. $\square$

### Relation to the literature

Alekseev–Grigoriev–Hirsch–Tzameret, arXiv:1911.06738v1 (15 November 2019), Definition 13 and Theorem 3.9, use charged rational-parameter circuits and clear denominators of an IPS certificate to produce many integer roots. Proposition 2.1 isolates the functional inverse component and gives its converse by divided differences. The source is not being cited as a proof that all short multiples yield short complete IPS certificates.

Primary source: <https://arxiv.org/pdf/1911.06738v1>, Section 3.2. The corresponding result in ECCC TR19-142 revision 1 (28 December 2022) is Theorem 4.13: <https://eccc.weizmann.ac.il/report/2019/142/revision/1/download/>. Its Section 4.2.4 explicitly distinguishes the displayed inverse from an ordinary VNP expression because the reciprocal depends on the Boolean witness; it uses a division-allowing variant instead.

## 3. What the Boolean quotient gives, and what it does not give

Let

```math
I_n=(X_0^2-X_0,\ldots,X_{n-1}^2-X_{n-1}),\qquad
A_n=\mathbb Q(y)[X]/I_n.
```

Every class has a unique multilinear representative: reduce each $X_i^k$, $k\ge1$, to $X_i$, and note inductively that a multilinear polynomial vanishing at all Boolean points is zero. Evaluation identifies $A_n$ with the product of $N$ copies of $\mathbb Q(y)$. Therefore $y-B$ is a unit of this algebra, and (1) determines its inverse class uniquely.

Equation (4) is an exact short identity, but its residual term is $H(B)/H(y)$, not an explicit short linear combination of the Boolean axioms. To turn (4) into an IPS-LIN identity one needs polynomials $V_i$ with

```math
H(B)=\sum_{i=0}^{n-1}V_i(X)(X_i^2-X_i).
\tag{5}
```

Such polynomials exist because $H(B)$ vanishes on the cube. Their existence alone does not bound their circuit size. A generic recursive interpolation construction has exponential cost in $n$: split a polynomial $G$ at $X_i=0,1$, write

```math
G=(1-X_i)G|_{X_i=0}+X_iG|_{X_i=1}+(X_i^2-X_i)E_i,
```

and recurse on the two restrictions. The quotient $E_i$ is obtained by two divided-difference transformations with constant-factor circuit overhead, but there are $2^n$ restrictions. This yields an $O(2^n\mathop{\mathrm{poly}}(s+n))$ construction, not a polynomial one.

Likewise the unique multilinear inverse is

```math
\overline U_n(X,y)=
\sum_{e\in\{0,1\}^n}\frac{
\prod_{i:e_i=1}X_i\prod_{i:e_i=0}(1-X_i)
}{y-B(e)}.
\tag{6}
```

Its total degree is at most $n$, but replacing a short high-degree representative by (6) is an additional circuit transformation. The quotient relations do not preserve ordinary degree: $X_i^k=X_i$ in $A_n$. Thus ordinary homogeneous-component extraction and Boolean multilinearization are different operations.

There is also no free passage from a short rational formula $1/(y-B)$ to a polynomial representative. The displayed rational formula divides by an expression containing $X$, which is forbidden in the charged model defining $\kappa(n)$.

## 4. The inverse table has strict Cauchy structure at every cut

Partition the bit positions into $S$ and its complement. Let $a_1<\cdots<a_p$ be the possible values of $1+\sum_{i\in S}2^ie_i$, and let $b_1<\cdots<b_q$ be the possible values of $\sum_{i\notin S}2^ie_i$. The inverse evaluation matrix is

```math
C_{ij}(y)=\frac1{y-a_i-b_j}.
```

Every square minor of order $r$ satisfies the Cauchy determinant identity

```math
\det C=
\frac{\prod_{i\lt j}(a_j-a_i)(b_j-b_i)}
{\prod_{i,j}(y-a_i-b_j)}.
\tag{7}
```

One proof multiplies the determinant by its common denominator. The resulting polynomial is alternating separately in the $a$'s and in the $b$'s, hence divisible by the two Vandermonde products; degree comparison and the coefficient of a diagonal pole term give constant factor one.

The numerator is nonzero, so every cut has rank $2^{\min(|S|,n-|S|)}$ over $\mathbb Q(y)$. For real $y>N$, every minor in this increasing row and column order is positive. Boolean evaluation and monomial coefficient arrays of a multilinear polynomial differ by an invertible tensor product of the two-by-two map $(c_0,c_1)\mapsto(c_0,c_0+c_1)$. Thus the coefficient tensor of $\overline U_n$ has the same full ranks.

The coefficient of $X_0\cdots X_{n-1}$ in (6) is

```math
R_n(y)=\sum_{e\in\{0,1\}^n}
\frac{(-1)^{n-|e|}}{y-B(e)}.
\tag{8}
```

It has a nonzero residue at every $j=1,\ldots,N$; therefore its reduced denominator is exactly $F_N(y)$, up to a nonzero scalar. This identifies a canonical denominator, but extracting (8) from a short arbitrary representative is the same missing Boolean finite-difference operation, not an available cheap gate operation.

## 5. Strict total positivity at all cuts still has short counterexamples

The Cauchy inverse has more than nonzero cut ranks. Nevertheless, even strict positivity of every minor at every cut does not by itself force a long constant-free program.

### Proposition 5.1

For $N=2^n$, $n\ge1$, set

```math
K=2^{4N^2}=2^{2^{2n+2}},\qquad
G_n(z)=\sum_{k=0}^{N-1}K^{N-1-k}z^k.
\tag{9}
```

Then $G_n\in\mathbb Z[z]$ is monic, primitive, and squarefree, has exactly one distinct integer root, and satisfies $\tau(G_n)\le6n+1$. Every square minor of every binary evaluation cut of the table $(G_n(j))_{j=1}^{N}$, with increasing partial sums, is strictly positive.

#### Proof: circuit and roots

Construct $2$ in one operation and square it $2n+2$ times, using $2n+3$ operations to obtain $K$. For

```math
S_m(K,z)=\sum_{k=0}^{m-1}K^{m-1-k}z^k,
```

use

```math
S_{2m}=S_m(K^m+z^m)
```

while squaring the stored $K^m,z^m$. There are at most $4n-2$ further operations, giving the asserted upper bound.

The identity $(z-K)G_n=z^N-K^N$ shows that the roots are $K\zeta$, for $\zeta^N=1$, $\zeta\ne1$. They are distinct in characteristic zero. The only real root is $-K$, since $N$ is even. In particular this is the only integer root. Monicity gives primitivity.

#### Proof: every minor is positive

Take any cut and any square submatrix of size $r$. Its increasing row and column labels are distinct integers $a_i,b_j$, and $1\le a_i+b_j\le N$. Since the full cut dimensions are $2^{|S|}$ and $2^{n-|S|}$,

```math
r^2\le N.
\tag{10}
```

Scale all entries by $K^{-(N-1)}$. The scaled matrix $P$ and a Cauchy matrix $C$ have entries

```math
P_{ij}=\sum_{k=0}^{N-1}\left(\frac{a_i+b_j}{K}\right)^k,
\qquad
C_{ij}=\frac{K}{K-a_i-b_j}.
```

Because $K>2N$, all entries lie between $0$ and $2$, and

```math
0\lt C_{ij}-P_{ij}\le2(N/K)^N.
\tag{11}
```

The Cauchy identity gives

```math
\det C=
\frac{K^r\prod_{i\lt j}(a_j-a_i)(b_j-b_i)}
{\prod_{i,j}(K-a_i-b_j)}
\ge K^{-r(r-1)},
\tag{12}
```

using integrality and distinctness to bound each positive Vandermonde factor below by one. Expanding the two determinants by permutations and telescoping each difference of $r$-fold products yields

```math
|\det C-\det P|\le r!\,r\,2^r(N/K)^N.
\tag{13}
```

By (10), $N-r(r-1)\ge1$. Also, using $r\le N$ and $n\le N$,

```math
\log_2\big(r!r2^rN^N\big)
\le N+(2N+1)n
\le3N^2<4N^2=\log_2K.
```

Consequently the right side of (13) is strictly smaller than $K^{-r(r-1)}$. Equation (12) implies $\det P>0$. Scaling back preserves positivity. The argument is uniform over all cuts and all minors. $\square$

This counterexample preserves the distinctions relevant here: all cut matrices are strictly totally positive, the polynomial has only one integer root, and squarefree or content normalization does not change it. It does not reproduce the exact rational dependence $1/(y-j)$ on a common parameter; that dependence remains available to a more specific invariant.

## 6. Where the pinned all-cuts machinery does and does not transfer

Pinned source revision:

<https://github.com/anthropics/formal-math/tree/11b6c7e3c927df2658f513b6b68ea7f8929c62c5/vp-vnp>.

The following are scope checks, not objections to the accepted results.

* `Statement.MainTheoremApprox` bounds circuits over Laurent-series constants approximating the permanent in characteristic different from two. Its quantifiers cover arbitrary constants, but its conclusion concerns the specified polynomial family.
* `Paper.LowDeg.lem_lowdeg` bounds program size by $c(M+m+1)+2(d+1)$ and run cost by an expression linear in $d+1$. Applying it at degree $d=2^n$ retains exponential dependence on $n$.
* `Paper.Flat.lem_balanced` decomposes the part of a polynomial that has ordinary degree one in each of $k$ variable blocks. It allows at most the original circuit size many products for each balanced partition, summed over the balanced partitions. It does not assert an analogous decomposition for the reduction modulo $X_i^2-X_i$.
* `Paper.Postpone.lem_postpone` represents the value as a sum indexed by vectors of constant-use counts. It does not bound that entire index set by a polynomial. The cut constructions operate with their stated program-value sums and hypotheses.

The concrete obstruction at this point is not the absence of all-cut ranks: (7) supplies them. The missing theorem would have to turn a short representative of the inverse class in $A_n$ into a restricted decomposition to which a proven lower-bound invariant applies. Ordinary degree truncation only retains bounded exponents; quotient reduction identifies every positive exponent of a Boolean variable with one. Proposition 5.1 rules out a repair based solely on positivity and cut minor ranks.

## 7. General extraction does not supply the missing theorem

### 7.1 Boolean normal forms are already hard for polynomial-degree inputs

There is a direct obstruction to a generic efficient normal-form theorem for the Boolean quotient. Consider the size-$`O(m^2)`$, degree-$`2m`$ polynomial

```math
T_m(X,Z)=\prod_{i=1}^m\left(\sum_{j=1}^mX_{ij}Z_j\right).
```

Reduce only the $Z$-variables modulo $Z_j^2-Z_j$. Expansion before reduction is indexed by all functions $\phi:[m]\to[m]$. After reduction it is

```math
\mathop{\mathrm{ML}}_{Z}(T_m)
=\sum_{\phi:[m]\to[m]}
\left(\prod_iX_{i,\phi(i)}\right)
\prod_{j\in\mathop{\mathrm{im}}\phi}Z_j.
```

A summand has $Z$-degree $m$ exactly when $\phi$ is surjective, hence a permutation. Therefore

```math
\big(\mathop{\mathrm{ML}}_{Z}(T_m)\big)_{\deg_Z=m}
=\mathop{\mathrm{per}}_m(X)\,Z_1\cdots Z_m.
\tag{14}
```

Given a size-$`S`$ circuit for the normal form, tracking its homogeneous $Z$-components of degrees $0,\ldots,m$ computes (14) in $O(m^2S)$ arithmetic operations: additions are componentwise and multiplication uses truncated convolution. Setting every $Z_j=1$ then computes the permanent. This works equally for a border circuit, since taking a fixed coefficient component preserves coefficientwise approximation.

Consequently, under the accepted permanent lower bound, Boolean normal forms of small circuits do not in general have polynomial-size circuits, even when the input degree is polynomial. A successful transfer in Section 6 must use the special inverse identity, rather than a general efficient passage to the Boolean quotient's multilinear normal form.

### 7.2 A compact coefficient-extraction obstruction

Let $m\ge2$, $b=m+1$, and consider

```math
P_m(t,X)=\prod_{i=1}^m\left(\sum_{j=0}^{m-1}X_{ij}t^{b^j}\right),
\qquad E_m=\sum_{j=0}^{m-1}b^j.
```

The powers $t^{b^j}$ have a jointly shared circuit of size $O(m\log m)$. Hence $P_m$ has size $O(m^2+m\log m)$, and $\log\deg_t P_m=O(m\log m)$. In a term of the product, let $`c_j\in\{0,\ldots,m\}`$ count the rows choosing column $j$. Its exponent is $\sum_jc_jb^j$. Since every digit $c_j<b$, uniqueness of base-$`b`$ expansion gives

```math
[t^{E_m}]P_m(t,X)=\mathop{\mathrm{per}}_m(X).
```

Therefore an unrestricted coefficient-extraction theorem with circuit overhead polynomial in source size and logarithmic degree would contradict the accepted permanent lower bound. The same applies to an unrestricted border-circuit extraction claim by `MainTheoremApprox`. This does not exclude an extraction theorem using additional consecutive-integer-root structure.

### 7.3 Border factor extraction keeps the factor degree

Bürgisser, arXiv:1812.06828v1 (17 December 2018; corrected version of the 2004 paper), Theorem 1.3, proves an approximative factor bound polynomial in exclusion complexity and factor degree. It removes dependence on multiplicity, not dependence on degree. For the desired factor $F_N$, the factor degree is $N=2^n$. The resulting upper bound is polynomial in $s$ and $2^n$, not in $s+n$. Extracting a low-degree factor after a substitution would help only after exhibiting a particular low-degree hard factor produced with polynomial overhead; no such factor has been obtained here.

Primary source: <https://arxiv.org/html/1812.06828v1>, Theorem 1.3.

### 7.4 Low-degree division and rational truncation

Dutta–Jindal–Pandey–Sinhababu, CCC 2021, Theorem 4, bounds the circuit size of a polynomial quotient $g/h$ polynomially in the input sizes and $\deg h$. Theorem 6 bounds a degree-$`d`$ univariate truncation of $g/h$ by a polynomial in the numerator circuit size, $\deg h$, and $\log d$, assuming $\deg g\le d$. These theorems do not make the Boolean inverse polynomial representative small: $1/(y-B)$ is not a polynomial in $X$, and a denominator encoding every integer pole has degree at least $2^n$.

Primary source: <https://drops.dagstuhl.de/storage/00lipics/lipics-vol200-ccc2021/LIPIcs.CCC.2021.25/LIPIcs.CCC.2021.25.pdf>.

## 8. Exact remaining target

A useful special statement is now concrete:

> Every charged rational-parameter circuit computing any polynomial representative of $(y-B_n)^{-1}$ in $A_n$ has size exceeding every fixed polynomial in $n$.

By Proposition 2.1 this is equivalent to the required consecutive-root multiple lower bound. The equivalence is linear in circuit size, handles arbitrary cofactors, and does not assume a cheap complete IPS certificate. It is a reformulation of the missing lower bound, not a proof of it.

The current all-cuts calculation supplies maximal ranks and strict positivity. The new geometric-sum example shows that those facts alone cannot control unrestricted constant-free programs. A successful next lemma must additionally use the exact integer pole configuration and track its cancellation through a charged circuit, or derive a stronger decomposition specifically for the Boolean inverse class.
