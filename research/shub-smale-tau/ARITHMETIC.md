# Arbitrary integer roots: exact arithmetic lemmas and failed local reductions

Research status: the Shub–Smale tau conjecture is not proved or disproved here.
The statements proved below are elementary auxiliary facts and explicit failures
of stronger intermediate claims. No novelty is claimed for these facts.

## 1. Model and quantifiers

A division-free constant-free straight-line program begins with `1` and `x`.
Each of its `s` gates forms the sum, difference, or product of two previously
available expressions. Its output is a polynomial in `Z[x]`. Let `tau(f)` be
the minimum number of gates producing `f`. For nonzero `f`, write

```math
R(f)=\{r\in\mathbb Z:f(r)=0\},\qquad N(f)=|R(f)|.
```

The target is one absolute `C` such that `N(f) <= (1+tau(f))^C` for every
nonzero integer polynomial. The zero polynomial must be excluded. Distinct
roots, not multiplicities, are counted. The estimates below hold for every
program of length `s` producing `f`, whether or not that program is shortest.

## 2. Integrality yields a cofactor-robust coefficient obstruction

### Lemma 2.1 (coefficient norm)

If `s >= 1`, then every polynomial produced by a length-`s` program satisfies

```math
\|f\|_1:=\sum_j|[x^j]f|\le 2^{2^{s-1}}.
```

Proof. Both inputs have norm one. For polynomials `u,v`,
`||u +/- v||_1 <= ||u||_1+||v||_1` and
`||uv||_1 <= ||u||_1 ||v||_1`. After one gate the maximum norm is at most two.
Once `B >= 2` bounds all previous norms, `B^2` bounds the next norm because
`2B <= B^2`. Induction gives `B_s=2^{2^{s-1}}`. This also bounds the absolute
value of every coefficient. The bound is attained by the constant obtained
from `2=1+1` followed by `s-1` squarings.

### Lemma 2.2 (product of nonzero integer roots)

Let `f` be nonzero and let `a_nu` be its first nonzero coefficient. Then

```math
\prod_{r\in R(f)\setminus\{0\}}r\quad\hbox{divides}\quad a_\nu
\qquad\hbox{in }\mathbb Z.
\tag{2.1}
```

Proof. Divide by `x^nu` to obtain `F in Z[x]` with `F(0)=a_nu != 0`.
Successive division by the monic factors `x-r`, for the distinct nonzero
integer roots `r`, gives

```math
F(x)=\left(\prod_{r\in R(f)\setminus\{0\}}(x-r)\right)h(x),
\qquad h\in\mathbb Z[x].
```

The quotients have integer coefficients because each divisor is monic.
After any subset of the factors has been removed, every remaining root is
still a root of the quotient: the removed factors are nonzero at that root.
Evaluating at zero proves (2.1); moreover `h(0)` is a nonzero integer.
This proof permits an arbitrary cofactor and arbitrary multiplicities.

### Corollary 2.3 (a weak improvement over the degree bound)

For `s >= 1` and `N=N(f) >= 1`,

```math
\left(\left\lfloor\frac{N-1}{2}\right\rfloor!\right)^2
\le |a_\nu|\le 2^{2^{s-1}}.
\tag{2.2}
```

The case `N=0` is trivial. Consequently `N=O(2^s/s)` as `s` tends to infinity.

Proof. There is at most one zero root. Among `k` distinct nonzero integers,
the smallest possible product of absolute values is

```math
B(k)=
\begin{cases}
(t!)^2,&k=2t,\\
(t!)^2(t+1),&k=2t+1.
\end{cases}
```

Indeed, each positive magnitude can occur at most twice. Lemmas 2.1 and 2.2
give (2.2). The factorial bound implies the asymptotic estimate. An explicit
coarser estimate is `N <= 2^{s+1}/s+2` for `s >= 8`: put
`t=floor((N-1)/2)` and use
`2 log_2(t!) >= t log_2(t/2)` for `t >= 2`. If `t > 2^s/s`, this contradicts
`2 log_2(t!) <= 2^{s-1}`, since
`s-1-log_2(s) >= s/2` for `s >= 8`.

This is still exponential in `s`. It is not progress to a polynomial bound
without another idea. Its exact integrality input is that distinct integers
must have an increasing sequence of absolute values. Exponentially many
distinct real roots can all lie in a fixed bounded interval, so this factorial
argument has no real-root analogue.

### Corollary 2.4 (consecutive roots, arbitrary cofactor)

If a nonzero `f in Z[x]` vanishes at `1,2,...,M`, then every program producing
`f` satisfies

```math
M!\le 2^{2^{s-1}},\qquad
s\ge 1+\log_2\log_2(M!)\quad(M\ge2).
\tag{2.3}
```

For `M=2^n` this is `s >= n+log_2(n)+O(1)`. The cofactor may vanish at zero:
using the first nonzero coefficient rather than the constant coefficient
is essential. The bound is far below superpolynomial growth in `n` and
therefore does not supply the intended BSS separation.

## 3. An exact averaging identity over all primes and precision levels

Let `R={r_1,...,r_N}` be any finite nonempty set of distinct integers. Put

```math
\Delta_R=\prod_{i<j}|r_i-r_j|\in\mathbb Z_{>0},
```

with the empty product equal to one. For a prime `p` and integer `k>=1`, let

```math
C_{p,k}(R)=\#\{\{i,j\}:i<j,\ r_i\equiv r_j\pmod {p^k}\}.
```

### Lemma 3.1 (weighted collision identity)

For every such set,

```math
v_p(\Delta_R)=\sum_{k\ge1}C_{p,k}(R),
\qquad
\log\Delta_R=\sum_p\sum_{k\ge1}C_{p,k}(R)\log p.
\tag{3.1}
```

All sums are finite. Proof: for every nonzero integer `d`,
`v_p(d)=sum_{k>=1} 1[p^k divides d]`. Sum this identity over the root pairs,
then use unique factorization of the positive integer `Delta_R`.

### Corollary 3.2 (prime selection with its exact cost)

For every finite nonempty set of primes `P`, with
`W=sum_{p in P} log p`, some `p in P` satisfies

```math
C_{p,1}(R)\le\frac{\log\Delta_R}{W}.
\tag{3.2}
```

If `q_p` is the number of occupied residues modulo `p`, then

```math
q_p\ge\frac{N^2}{N+2C_{p,1}(R)}.
\tag{3.3}
```

Proof. The weighted average in (3.2) is at most the full nonnegative sum
in (3.1). If the nonempty residue classes have sizes `n_1,...,n_q`, then
`N+2C_{p,1}=sum n_i^2`, and Cauchy--Schwarz gives (3.3).

For a root set of a length-`s` program, Lemma 2.2 also gives

```math
\begin{aligned}
\Delta_R
&\le 2^{\binom N2}
\left(\prod_{r\in R}\max(1,|r|)\right)^{N-1},\\
\log\Delta_R
&\le\left[\binom N2+(N-1)2^{s-1}\right]\log 2.
\end{aligned}
\tag{3.4}
```

Here `|a-b| <= 2 max(1,|a|)max(1,|b|)` proves the first line; the product
is at most `|a_nu|` by Lemma 2.2. Thus this exact averaging method only
guarantees a prime with `O(N)` colliding pairs once the available total
log-prime weight is at least a suitable constant times `2^s+N`.
This is a sufficient budget, not a claim of necessity. This upper estimate does not yield a
polynomial-in-`s` budget. It does not prove that a better prime-selection
argument is impossible.

### Counterexample 3.3 (no height-free prescribed-prime guarantee)

Given any finite set of primes `P`, any precision `K>=1`, and any `N`, put

```math
Q=\prod_{p\in P}p^K,
\qquad R=\{1+Qj:1\le j\le N\}.
```

Then every root candidate lies in one residue class modulo each `p^K`,
and has valuation zero at each `p in P`. Hence
`C_{p,k}(R)=binom(N,2)` for `p in P` and `1<=k<=K`, while every selected
prime sees only one occupied residue and one valuation.

This disproves a prime-selection claim for every finite integer set that
depends only on `N` and on a prescribed finite prime set, with no height or
circuit hypothesis. It does **not** construct a short program whose roots
are `R`. Proving that short programs cannot realize the requisite clustering
would itself be additional, unresolved content.

Even knowing that every prime has at most two distinct root valuations
does not bound the size of a general integer set: take arbitrarily many
distinct prime numbers as the set. At each prime the valuations are a
subset of `{0,1}`. The joint valuation vectors, rather than separate
coordinate cardinalities, retain the distinguishing information.

## 4. Addition gates lose information that valuations alone cannot recover

### Lemma 4.1 (exact cancellation rule)

For nonzero integers `a,b` and a prime `p`, if
`alpha=v_p(a) != beta=v_p(b)`, then

```math
v_p(a\mathbin\pm b)=\min(\alpha,\beta).
```

If `alpha=beta=t`, write `a=p^t u`, `b=p^t v` with `u,v` units. Then

```math
v_p(a\mathbin\pm b)=t+v_p(u\mathbin\pm v),
\tag{4.1}
```

allowing value infinity when the sum or difference is zero. The unit
residues, at potentially unbounded precision, are indispensable.
The product rule is exact without a correction:
`v_p(ab)=v_p(a)+v_p(b)`.

### Counterexample 4.2 (unbounded valuation diversity in one subtraction)

For fixed `p` and any `N`, evaluate on
`R_N={1+p^j:1<=j<=N}`. Both input tables `x` and `1` have the single
valuation zero. The one-gate output `x-1` has the `N` distinct valuations
`1,...,N`. Therefore no bound on output valuation diversity can be a
function only of the two input valuation diversities and the number of
gates, uniformly over arbitrary integer evaluation sets.

This is an obstruction to an intermediate-table invariant, not a
counterexample to tau: the points of `R_N` are not roots of `x-1`.
Any viable invariant must use more than these local valuation cardinalities
or exploit the global final-output-root condition in a new way.

### Counterexample 4.3 (exponential cancellation depth with short constants)

For fixed `p`, construct `A_n=p^{2^n}` by repeated squaring. The operands
`1` and `A_n-1` both have valuation zero, while their sum has valuation
`2^n`. Their constant-free circuit size is `O(n+tau(p))`. Thus even the
required precision cannot be bounded polynomially in the program length
by looking only at the operand valuations. This concerns valuation depth,
not the number of roots, and must not be presented as a disproof of tau.

### Counterexample 4.4 (finite-field roots are also insufficient)

For any prime `p`, the polynomial `x^p-x` has all `p` residues as roots
modulo `p` and has a constant-free program of length `O(log p)` by binary
exponentiation. Its integer roots are only `0,1` when `p=2`, and
`-1,0,1` when `p` is odd. A uniform polynomial bound on root counts modulo
an arbitrary prime, in terms of straight-line length, is therefore false.

## 5. Fixed p-adic root bounds fail even for simple roots

The following construction is **imported**, not original: Koiran, Portier,
and Rojas, arXiv:1309.0486v1 (2013), Example 1.16. It is included with a
self-contained verification because it rules out a tempting stronger target.

Fix a prime `p`. Define

```math
h_1(x)=x(1-x),\quad a_n=p^{3^{n-1}},\quad
h_{n+1}(x)=h_n(x)(a_n-h_n(x)).
\tag{5.1}
```

Then `tau(h_n)=O(n+tau(p))`, `deg h_n=2^n`, the polynomial has exactly
`2^n` distinct roots in `Z_p`, and its integer roots are exactly `0,1`.

The size bound follows from `a_{n+1}=a_n^3` (two multiplications) and
the two gates for updating `h_n`. The degree doubles at each step.
For integer `x` other than `0,1`, `h_1(x)<0`; since `a_n>0`, induction
gives `h_n(x)<0`. Thus no additional integer roots occur.

For completeness, use the following standard strong Hensel statement:
if `g in Z_p[x]` and `c in Z_p` satisfy
`v_p(g(c))>2v_p(g'(c))`, there is a root `eta in Z_p` with
`v_p(eta-c)>v_p(g'(c))`. It follows by the Newton iteration
`c_{j+1}=c_j-g(c_j)/g'(c_j)`: the correction is integral, the derivative
valuation remains fixed, and the error valuation increases at least
geometrically, so the iterates converge in `Z_p`.

Inductively, all `2^n` roots of `h_n` are simple and their derivatives
have the common valuation

```math
d_n=(3^{n-1}-1)/2.
```

This holds at `n=1`, whose two derivatives are units. At a root `rho` of
`h_n`, apply Hensel to `h_n-a_n`: the value has valuation
`3^{n-1}=2d_n+1`. It produces a nearby root `eta` of `h_n-a_n` with
`v_p(eta-rho)>d_n`. These neighborhoods are disjoint: the leading
coefficient of `h_n` is a unit and
`h_n'(rho)=lead(h_n) product_{sigma != rho}(rho-sigma)`, whose valuation
is `d_n`, so every distinct pair of its integral roots has distance
valuation at most `d_n`. Therefore there are `2^n` distinct new roots.
They do not coincide with old roots because `a_n != 0`. The degree of
`h_n-a_n` is `2^n`, so these are all its roots.

The derivative of an integral polynomial is 1-Lipschitz on `Z_p`.
Thus `v_p(h_n'(eta))=d_n`. At either an old root or a new root, the
derivative of `h_{n+1}` is `+/-a_n h_n'`, of valuation
`3^{n-1}+d_n=(3^n-1)/2=d_{n+1}`. This closes the induction.

Consequently, replacing integer roots by all roots in one fixed `Q_p`
cannot prove tau through a polynomial root-count bound. The example
also pinpoints the missing information: local integrality at one prime
does not imply being an ordinary integer.

## 5.1. Attempt to sum cancellation over all primes

The single-prime obstructions suggest charging the total cancellation
over all primes instead. This gives an exact conservation identity, but
the resulting budget still grows exponentially in the program length.

Let `a,b` be nonzero integers and assume `a +/- b != 0`. Define the
cancellation increment

```math
c_p=v_p(a\mathbin\pm b)-\min(v_p(a),v_p(b))\ge0.
```

With `g=gcd(|a|,|b|)`, unique factorization gives

```math
\sum_p c_p\log p
=\log\frac{|a\mathbin\pm b|}{g}
\le\log\frac{|a|+|b|}{g}.
\tag{5.2}
```

Indeed `v_p(g)=min(v_p(a),v_p(b))`, so `c_p` is the valuation of the
nonzero integer `(a +/- b)/g`. This identity includes cancellation at
every prime simultaneously and is exact, not an estimate arising from
choosing a bad prime. For the short constants `a=1`, `b=2^{2^n}-1`,
the left side equals `2^n log 2`. Thus an assertion that total
logarithmically weighted cancellation at an addition gate is polynomial
in the length of its constant-free prefix is false.

The product formula has converted the p-adic budget into the size of
an ordinary integer, whose logarithm can already be exponential after
repeated squaring. Merely summing the local data across all primes
therefore does not repair the missing cancellation bound. An invariant
would have to account for how this large cancellation can create
*distinct integer roots*, not just for the cancellation amount.

## 5.2. Even the number of newly appearing primes can be superpolynomial

Discarding valuation multiplicities and counting only prime support does
not give a polynomial gate budget either. The following proof does not
need the Bang--Zsigmondy primitive-divisor theorem.

### Lemma 5.3 (an elementary cyclotomic support bound)

If `M` is a positive squarefree integer with `k>=1` distinct prime factors, then

```math
\omega(2^M-1)\ge 2^{k-1},
\tag{5.3}
```

where `omega` counts distinct prime divisors.

Proof. Let `Phi_d` be the `d`th cyclotomic polynomial. The usual
factorization into roots of each exact order gives

```math
2^M-1=\prod_{d\mid M}\Phi_d(2).
```

For every `d>1`, `Phi_d(2)` is an integer greater than one: it is a
product of factors `2-zeta` over primitive roots of unity `zeta != 1`,
each with absolute value greater than one. Conjugate factors have
positive product; the only possible real factor is `2-(-1)=3`.
The integrality of `Phi_d` also follows inductively from
`x^d-1=product_{e|d}Phi_e(x)` by division by monic integer polynomials.
Thus there are `2^k-1` nonunit factors to cover by prime divisors.

Every prime `ell` dividing these values is odd. If `ell` does not
divide `d` and `ell | Phi_d(2)`, then the multiplicative order of
`2` modulo `ell` equals `d`. Indeed `x^d-1` is squarefree modulo
`ell`, since its derivative `d x^{d-1}` has no common root with it.
Hence its different cyclotomic factors cannot have a common root.
If `2` had order a proper divisor `r` of `d`, some factor of
`x^r-1` would share the root `2` with `Phi_d`, a contradiction.

If instead `ell | d`, write `d=ell e`; squarefreeness gives
`ell` not dividing `e`. The roots-of-unity factorization gives

```math
\Phi_e(x^\ell)=\Phi_e(x)\Phi_{\ell e}(x).
```

Reducing modulo `ell` and using Frobenius, then cancelling the monic
nonzero polynomial `Phi_e`, yields

```math
\Phi_{\ell e}(x)\equiv\Phi_e(x)^{\ell-1}\pmod\ell.
```

Therefore `ell | Phi_e(2)`, and the preceding case shows
`ord_ell(2)=e`. For any fixed prime `ell`, the only possible indices
among the divisors of `M` whose cyclotomic values it divides are

```math
d=\mathop{\mathrm{ord}}_\ell(2)
\quad\hbox{and}\quad
d=\ell\mathop{\mathrm{ord}}_\ell(2).
```

A prime therefore covers at most two of the `2^k-1` nonunit factors.
This proves `omega(2^M-1) >= ceil((2^k-1)/2)=2^{k-1}`.

### Corollary 5.4 (prime support cannot be polynomially gate bounded)

Let `p_1,...,p_k` be the first `k` primes and `M_k=product_j p_j`.
Bertrand's postulate gives `p_j <= 2^j`, hence
`log_2(M_k) <= k(k+1)/2`. Binary exponentiation, starting with
`2=1+1`, computes `2^{M_k}-1` with at most

```math
2\lfloor\log_2 M_k\rfloor+2\le k(k+1)+2
```

constant-free gates. Lemma 5.3 gives at least `2^{k-1}` distinct prime
divisors of this output. In particular, its final subtraction takes
operands whose prime supports are `{2}` and the empty set and produces
superpolynomially many distinct prime divisors relative to the whole
program length.

The only prime-distribution input here is Bertrand's postulate, in the
form that a prime exists in `(n,2n]` for every integer `n>=1`.
Primary source: P. Erdős, *Beweis eines Satzes von Tschebyschef*,
Acta Sci. Math. (Szeged) **5** (1932), pp. 194--198; main unnumbered
theorem stated on p. 194, original published version:
<https://www.renyi.hu/~p_erdos/1932-01.pdf>.

This is a counterexample to a proposed invariant, not to tau:
the output is a nonzero constant and has no roots. It shows why
bounding the number of possible prime coordinates of a short
coefficient cannot replace the missing root-count argument.

## 6. What a successful arbitrary-root argument still needs

The exact identity (3.1) is a valid prime-averaging lemma for every root
configuration, and (4.1) tracks cancellation exactly. Their combination
does not bound the normalized-unit correction at addition gates. The
known coefficient-height estimate permits exponential complexity in the
precision and prime-weight parameters.

A sufficiently strong, explicit missing statement would be constants
`A,B` such that every length-`s` program with `s>=1` and nonzero output admits a
prime `p <= (1+s)^A` for which each residue class modulo `p` contains at
most `(1+s)^B` integer roots of the output. This would give
`N(f) <= (1+s)^{A+B}` immediately. No proof is supplied. It is a sufficient
reformulation, not an independent advance or a claimed weaker theorem.

The weaker Koiran--Portier--Rojas valuation hypothesis is different:
Theorem 1.2 of arXiv:1309.0486v1 gives permanent hardness from one fixed
prime and polynomially many valuations of integer roots of SPS
polynomials. That implication goes from a root bound to permanent
hardness; permanent hardness does not supply its converse. Theorem 1.14(I)
states the BSS and constant-free permanent consequences of tau.

Primary source:
[Koiran--Portier--Rojas, arXiv:1309.0486v1](https://arxiv.org/html/1309.0486v1),
Definition 1.13, Theorems 1.2 and 1.14(I), Example 1.16.

## 6.1. A restricted circuit class where prime constraints do propagate

A separate attack through iterated squaring leads to a relevant existing
result. Shawn Walker, *Coefficient growth in square chains*,
[arXiv:1902.11164v1](https://arxiv.org/pdf/1902.11164) (2019),
Proposition 2.3, proves the following. If

```math
P_0(x)=x,\qquad P_j(x)=P_{j-1}(x)^2-c_j,\qquad P(x)=P_k(x)
```

splits completely over the integers, then every prime `p<=2^{j-1}`
divides `c_j`. If `c_k!=0` and `j>=5`, then `log c_j>2^{j-2}`.
The prime constraint comes from Proposition 1.1 and Corollary 2.1:
over an odd-characteristic field, a fully split chain with nonzero final
coefficient has at least `2^{k-1}+1` distinct roots; the finite field
cannot accommodate that many. The case of the prime two is handled
separately by Lemma 2.2. These are imported results.

Here is the precise computational consequence. If every `c_j` has
bitlength at most `B`, then for `k>=5` and `c_k!=0`,

```math
N(P)\le 2^k<4\log c_k\le 4B\log2.
```

For `k<=4`, degree gives `N(P)<=16`. Trailing zero coefficients merely
square a shorter chain and can be removed without changing its distinct
roots. Thus explicit coefficient bitlength gives a polynomial root bound
for these completely split chains. A small constant-free program can
generate coefficients of exponentially large bitlength, so this does not
give a polynomial bound in tau.

The structural limit is also explicit. Backward factorization of a square
minus a square forces each shorter chain to split. A general addition
gate does not preserve this property. No extension of this propagation
argument to arbitrary shared straight-line programs is established here.

## 7. Verification record

The arguments above are mathematical proofs, except the explicitly missing
statement in Section 6. Exact local Python checks confirmed (3.1) on four
small root sets, the minimal-product inequality on those sets, and
Counterexample 4.2 for `p=2,3,5` with ten evaluation points each. Finite
checks are consistency checks only; they do not establish tau or the
general statements, which require the displayed proofs. No Lean
formalization was performed.

Exact SymPy computations also checked Lemma 5.3 for the first four
primorials `M=2,6,30,210`: the respective numbers of distinct prime
divisors of `2^M-1` are `1,2,6,20`, and each prime occurs in at most two
of the values `Phi_d(2)` with `d|M`.
