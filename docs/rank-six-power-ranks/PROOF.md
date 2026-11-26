# Power ranks of the rank-six recurrence

Principia Math in Progress refuted the particular-rank clause of Conjecture 5.3 in September with a rank-eight recurrence whose power ranks detect perfect squares. Both proofs use the same eventual-quasipolynomial interpretation. The result here gives a separate rank-six sequence and its exact power ranks for every exponent at least 49. [Earlier proof](https://github.com/PrincipiaMathOrg/math-solutions/blob/47371706c400c79d06e3fb62190fcf6f7a725c85/site-backup/mathdb-366795/mathdb-366795-solution.tex).

## Status and precise scope

This note gives a proposed counterexample to the eventual pseudo-polynomiality
assertion in Conjecture 5.3 of Eric Rowland and Jesús Sistos Barrón,
*Complexity of powers of a constant-recursive sequence*,
[arXiv:2501.14643v1](https://arxiv.org/html/2501.14643v1), January 2025.
The exact assertion established below is that the ranks of the powers of a
particular integer constant-recursive sequence are **not eventually
quasipolynomial**. Here quasipolynomial means polynomial on each residue class
modulo one fixed positive integer. The source uses “pseudo-polynomial” without
an explicit definition; the conjecture is interpreted in this usual
quasipolynomial sense. This terminology point is recorded rather than hidden.

The counterexample refutes the universal particular-rank clause, and hence the
conjunction in Conjecture 5.3. It does not refute or prove the separate
general-rank eventual-polynomiality clause. It is not a resolution claim for
the paper's already-refuted fixed-rank finiteness conjecture.

Research issue: [#115](https://github.com/1337isnot1337/solved-conjectures/issues/115).
Date of calculation and source audit: 2026-11-20.
Publication status: independent symbolic review and exact checks passed; external review and author terminology confirmation remain outstanding.

## Statement

For integers $n\ge0$, define

```math
s(n)=n(1+8^n)+2^n-16^n.
```

Let $R(M)$ be the minimum order of a constant-coefficient linear recurrence
satisfied by the sequence $(s(n)^M)_{n\ge0}$, allowing the recurrence to begin
at any sufficiently large index, as in the source's Section 2.

**Theorem.** The sequence $s$ has rank six. For every integer $M\ge49$,

```math
R(M)=\frac{7M^2+3M+2}{2}
      -3\mathbf 1_{2\mid M}
      -6\mathbf 1_{M\text{ is a square}}. \tag{1}
```

Consequently $R(M)$ is not eventually quasipolynomial.

All roots in this construction are positive integers. Thus the calculation
works for recurrences over $\mathbb Q$, $\mathbb R$, or $\mathbb C$, and the
annihilating characteristic polynomials have integer coefficients.

## 1. Rank of an exponential polynomial

If $\lambda_1,\ldots,\lambda_h$ are distinct nonzero complex numbers and each
$p_i(n)$ is a nonzero polynomial, then the minimum recurrence order of

```math
u(n)=\sum_{i=1}^h p_i(n)\lambda_i^n
```

is $\sum_i(\deg p_i+1)$. Its minimum characteristic polynomial is

```math
\prod_{i=1}^h (X-\lambda_i)^{\deg p_i+1}. \tag{2}
```

For completeness, let $E$ be the shift operator. On a term
$p(n)\lambda^n$, the operator $E-\lambda$ lowers the polynomial degree by
exactly one until it annihilates the term. The operator $E-\mu$, for
$\mu\ne\lambda$, preserves that degree and has nonzero leading
coefficient. Distinct exponential-polynomial spaces are linearly independent:
apply the product of the powers of $E-\lambda_j$ that annihilate all but one
space to a proposed relation. The surviving polynomial times $\lambda_i^n$
cannot vanish on a tail unless it is the zero polynomial. Applying this
independence to an arbitrary annihilating polynomial in $E$ shows that it must
contain every factor in (2), with at least its stated multiplicity. The product
in (2) itself annihilates $u$, proving both assertions. The same argument is
valid for tail recurrences.

The four roots of $s(n)$ are $1,8,2,16$, with coefficient polynomials
$n,n,1,-1$, respectively. Formula (2) gives rank $2+2+1+1=6$.

## 2. Exact coefficient expansion

Set

```math
S(t,x)=t(1+x^3)+x(1-x^3),\qquad
S(t,x)^M=\sum_{k=0}^{4M} P_{M,k}(t)x^k.
```

Then $s(n)^M=\sum_k P_{M,k}(n)(2^k)^n$. The numbers $2^k$ are distinct,
so (2) computes $R(M)$ by adding $\deg P_{M,k}+1$ over its nonzero
polynomials.

Choosing $r$ copies of $x(1-x^3)$ in the expansion yields

```math
\binom Mr t^{M-r}x^r(1+x^3)^{M-r}(1-x^3)^r. \tag{3}
```

It contributes to $P_{M,k}$ precisely when

```math
k=r+3j,\qquad 0\le r\le M,\quad 0\le j\le M. \tag{4}
```

Different $r$ produce different powers of $t$, so cancellation between
different $r$ cannot occur.

Define

```math
K_r(j;M)=[z^r](1+z)^{M-j}(1-z)^j.
```

A binomial-coefficient identity gives

```math
\binom Mr[z^j](1+z)^{M-r}(1-z)^r
=\binom Mj K_r(j;M). \tag{5}
```

Indeed, expand both sides and use
$\binom Mr\binom r\ell\binom{M-r}{j-\ell}
=\binom Mj\binom j\ell\binom{M-j}{r-\ell}$ term by term.
Thus the coefficient of $t^{M-r}$ in $P_{M,k}$ is
$\binom Mj K_r(j;M)$ when (4) holds.

For $D=M-2j$, differentiation of the defining generating polynomial gives

```math
(r+1)K_{r+1}=D K_r-(M-r+1)K_{r-1}.
```

Starting from $K_0=1$ and $K_1=D$ therefore gives

```math
K_2=(D^2-M)/2,
```

```math
K_4=(D^4-6MD^2+8D^2+3M^2-6M)/24,
```

```math
K_5=\frac{D\bigl(D^4-10MD^2+20D^2+15M^2-50M+24\bigr)}{120}. \tag{6}
```

These are exact polynomial identities, not asymptotic estimates.

## 3. The initial degree sum

For $0\le k\le3M$, the least admissible $r$ in (4) is the residue
$r_0\in\{0,1,2\}$ of $k$ modulo three. Its corresponding $j$ is
$j_0=(k-r_0)/3$. For $3M<k\le4M$, the least admissible $r$ is
$r_0=k-3M$, with $j_0=M$.

If these least-$r$ coefficients were all nonzero, their contributions to rank
would be as follows.

| Exponents $k$ | Count | Rank contribution for each $k$ |
| --- | ---: | ---: |
| $0,3,\ldots,3M$ | $M+1$ | $M+1$ |
| $1,4,\ldots,3M-2$ | $M$ | $M$ |
| $2,5,\ldots,3M-1$ | $M$ | $M-1$ |
| $k=3M+r$, $1\le r\le M$ | $M$ | $M-r+1$ |

The sum is

```math
(M+1)^2+M^2+M(M-1)+\sum_{r=1}^M(M-r+1)
=\frac{7M^2+3M+2}{2}. \tag{7}
```

We next locate every actual loss from this sum.

## 4. All coefficient cancellations

### Residue zero and the upper tail

For $r_0=0$, (5) uses $K_0=1$, so there is no cancellation.

For $k=3M+r_0>3M$, the coefficient is
$\binom M{r_0}[z^M](1+z)^{M-r_0}(1-z)^{r_0}
=\binom M{r_0}(-1)^{r_0}$, which is nonzero. There is no loss in the
upper tail, including $k=4M$.

### Residue one

For $r_0=1$, the leading coefficient vanishes exactly when
$M-2j_0=0$. This occurs at one exponent $k=1+3M/2$ when $M$ is even,
and at no exponent when $M$ is odd.

For this exceptional $k$, the next admissible choice is $r=4$,
$j=j_0-1=M/2-1$. Now $D=M-2j=2$, and (6) gives

```math
K_4(M/2-1;M)=\frac{(M-2)(M-8)}8.
```

This is nonzero for even $M\ge50$. The degree decreases from $M-1$
to $M-4$, so the rank contribution loses exactly three. There are no
admissible degrees between these because $r$ must remain in its residue
class modulo three.

### Residue two

For $r_0=2$, the leading coefficient vanishes exactly when

```math
(M-2j_0)^2=M. \tag{8}
```

There are no integer solutions unless $M=m^2$ is a square. If $M=m^2$
with $m\ge7$, there are exactly two solutions

```math
j_0=\frac{M-m}{2},\qquad j_0=\frac{M+m}{2}.
```

They are integers, lie between $0$ and $M-1$, and give two distinct
exponents $k=2+3j_0\le3M$.

The next admissible choice is $r=5$, $j=j_0-1$. Its value of $D$ is
$2+m$ or $2-m$. Substituting $M=m^2$ into (6) gives respectively

```math
K_5=\frac{(m-6)(m-2)(m+1)(m+2)(3m+5)}{60}, \tag{9}
```

```math
K_5=-\frac{(m-2)(m-1)(m+2)(m+6)(3m-5)}{60}. \tag{10}
```

Every factor is nonzero for $m\ge7$. Hence each of these two polynomial
degrees decreases from $M-2$ to $M-5$, for a rank loss of exactly three
at each exponent. The total square-dependent loss is six.

The residue-one exceptional exponent and the residue-two exceptional
exponents cannot coincide, because they have different residues modulo
three. There are no other leading coefficient zeros. Subtracting these
losses from (7) proves (1) for every $M\ge49$.

## 5. Failure of eventual quasipolynomiality

If $R(M)$ were eventually quasipolynomial, formula (1) would imply the same
for $\mathbf1_{M\text{ is a square}}$, since polynomials and the parity
indicator are quasipolynomial and this class is closed under addition and
scalar multiplication.

A bounded eventually quasipolynomial sequence is eventually periodic: on
each residue class, its defining polynomial must be constant, because a
nonconstant polynomial is unbounded along that class.

The square indicator is not eventually periodic. For any proposed period
$q>0$ and threshold $N$, choose $m$ so large that $m^2\ge N$ and
$2m+1>q$. Then $m^2$ is a square but

```math
m^2<m^2+q<(m+1)^2,
```

so $m^2+q$ is not a square. This contradicts period $q$. Therefore
$R(M)$ is not eventually quasipolynomial.

## Verification and limits

The proof above is symbolic and covers every exponent $M\ge49$. Finite
computations are supplementary checks, not the source of the unbounded
claim. The companion `verify.py` verifier expands $S(t,x)^M$ using integer
arithmetic and computes every coefficient polynomial degree independently
of the formula. The recorded run checks every $1\le M\le180$, and every
predicted individual coefficient degree for $49\le M\le180$. It also
checks the exact expansion ranks for $1\le M\le8$ against the
Berlekamp–Massey algorithm applied to actual sequence values modulo
$1{,}000{,}000{,}007$. All checks pass; the full output is in
`verification.json`. Run `python3 docs/rank-six-power-ranks/verify.py` to replay.

This argument is not peer reviewed. Its [complete Lean formalization](LEAN_STATUS.md)
proves the precise result stated here. The source's
term “pseudo-polynomial” is not defined explicitly, so the exact mathematical
conclusion is stated with the defined term “quasipolynomial.”

## Sources and prior-work distinction

1. Eric Rowland and Jesús Sistos Barrón, *Complexity of powers of a
   constant-recursive sequence*, arXiv:2501.14643v1, 24 January 2025,
   Section 2 (rank and exponential polynomials), Section 5 (Conjecture 5.3).
   [Original HTML](https://arxiv.org/html/2501.14643v1),
   [current arXiv record](https://arxiv.org/abs/2501.14643),
   [author-hosted PDF](https://ericrowland.github.io/papers/Complexity_of_powers_of_a_constant-recursive_sequence.pdf).
2. The Omega Institute, *Infinitely many rank sequences of initial rank
   three*, public research record. Its stated result refutes the different
   fixed-rank finiteness conjecture from the source's introduction. Its scope
   table explicitly leaves Conjecture 5.3 open.
   [Primary research record](https://www.trureturing.org/research/rowland-sistos-barron-2025-rank-sequences/),
   [source dossier](https://the-omega-institute.github.io/trureturing-mdbook/Library/Eigenstructure/rowlandsistosbarron2025powers.html).
3. [Eric Rowland's current research-paper list](https://ericrowland.github.io/papers.html)
   links the same 23-page preprint. The arXiv record inspected on 2026-11-20
   lists only version 1.
4. Shivam Patel, *Hilbert-polynomial proof of the degree conjecture for
   general rank sequences*, posted to
   [MathDB](https://mathdb.com/p/366796/degree-conjecture-for-general-rank-sequences),
   visible on 2026-11-20. This earlier submitted proof handles the general
   no-cancellation clause, including repeated roots. Its final paragraph
   explicitly excludes particular sequences with exceptional cancellations.
   It is relevant prior work, not a new result claimed in this note.

See the companion novelty-audit file for searches, exclusions, and the limits
of the priority check.
