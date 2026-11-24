# Reciprocal prime counts and universal local covers

Status: research. The tau conjecture is not proved or disproved. Sections 1–4 are elementary deductions. Section 5 identifies an unresolved averaging requirement. The rational-root and integer-root tau formulations are equivalent by the explicit reduction in [NORMALIZATION.md](NORMALIZATION.md). No novelty claim is made for the larger-sieve argument or the circuit decompositions used below.

## 1. A coefficient-sensitive larger sieve

All logarithms in this section are natural. Let a nonzero polynomial
`f in Z[x]` have a constant-free division-free straight-line program of
length `s >= 1`, with initial registers `1,x` and operations `+,-,*`.
Put

```math
B=2^{s-1}\log 2.
```

Every coefficient of `f` has absolute value at most `exp(B)`. Indeed,
the coefficient `l1` norm starts at one; the first operation gives norm
at most two; and thereafter both addition and multiplication preserve
the induction `M_{j+1} <= M_j^2` when `M_j >= 2`.

Let `R={r_1,...,r_N}` be any set of distinct integer roots of `f`.
If `a_nu` is the first nonzero coefficient of `f`, then

```math
\prod_{r\in R\setminus\{0\}}|r|\mid |a_\nu|.
```

To see this, divide `f` by its maximal power of `x`, then divide by
the distinct monic factors `x-r` for the nonzero roots. The quotient
remains in `Z[x]`; comparing constant coefficients gives the assertion.
Therefore

```math
\sum_{r\in R}\log\max(1,|r|)\le B.
```

For

```math
\Delta_R=\prod_{1\le i\lt j\le N}|r_i-r_j|,
```

the elementary inequality
`|a-b| <= 2 max(1,|a|) max(1,|b|)` gives

```math
\log\Delta_R\le {N\choose2}\log2+(N-1)B.       \tag{1.1}
```

For each prime `p`, let `nu_p(f)` be the number of roots of the
reduction of `f` in `F_p`. If that reduction is zero, set `nu_p(f)=p`.
Let `P` be any nonempty finite set of primes, and put

```math
W=\sum_{p\in P}\log p,
\qquad
A=\sum_{p\in P}\frac{\log p}{\nu_p(f)}.
```

The quantity `A` is used only when `N>=1`; then `nu_p(f)>=1` for all
primes, so there is no division by zero.

**Proposition 1.1.** For `N>=1`,

```math
N^2(A-\log2)
\le N(W+2B-\log2)-2B.                              \tag{1.2}
```

In particular, if `A>log2`, then

```math
N\le\frac{W+2B-\log2}{A-\log2}.                    \tag{1.3}
```

**Proof.** Let `c_p` be the number of occupied residues of `R` modulo
`p`, and let their sizes be `n_1,...,n_{c_p}`. The number of unordered
pairs congruent modulo `p` is

```math
C_p=\frac12\left(\sum_i n_i^2-N\right)
\ge\frac12\left(\frac{N^2}{c_p}-N\right)
\ge\frac12\left(\frac{N^2}{\nu_p(f)}-N\right).
```

Every such pair contributes a factor of `p` to `Delta_R`. Thus

```math
N^2A-NW\le2\sum_{p\in P}C_p\log p
\le2\log\Delta_R
\le N(N-1)\log2+2(N-1)B.
```

Rearrangement proves (1.2). Dropping the nonpositive final term after
dividing by `N` proves (1.3). No separation assumption on the roots
and no assumption on a cofactor of `f` is used. QED.

To avoid a zero denominator even for rootless polynomials, define

```math
A_+=\sum_{p\in P}\frac{\log p}{1+\nu_p(f)}.
```

Since `A_+<=A` when there is an integer root, (1.2) and (1.3) remain
valid after replacing `A` by `A_+`.

**Corollary 1.2 (a sufficient, unproved prime-averaging condition).**
Suppose that there is an absolute `C` such that, for every `s>=1` and
every nonzero `f` with a length-`s` program, there is a finite set `P`
of primes satisfying

```math
W\ge4B,
\qquad
A_+\ge\max\left\{2\log2,\frac{W}{(s+1)^C}\right\}.
                                                               \tag{1.4}
```

Then `N_Z(f)<=3(s+1)^C`.

**Proof.** Rootless polynomials are automatic. Otherwise (1.3) gives

```math
N_\mathbb Z(f)
\le\frac{W+2B}{A_+-\log2}
\le\frac{3W/2}{A_+/2}
\le3(s+1)^C.
```

The existence assertion (1.4), including its dependence on circuit
history through cancellation gates, has not been established. The
proposition proves only the implication from that assertion to tau.

## 2. Why the reciprocal statistic survives the cyclotomic example

Let `M` be squarefree with `k` distinct prime divisors. For a uniformly
chosen `a` in `(Z/MZ)^*`, set `T(a)=gcd(M,a-1)`. The Chinese remainder
theorem makes the local events `a=1 mod p` independent, each with
probability `1/(p-1)`. Consequently

```math
\mathbb E T
=\prod_{p\mid M}\left(1+\frac{p-1}{p-1}\right)=2^k,
```

whereas

```math
\mathbb E\frac1T
=\prod_{p\mid M}\left(1-\frac1{p-1}+\frac1{p(p-1)}\right)
=\prod_{p\mid M}\left(1-\frac1p\right)
=\frac{\varphi(M)}M.                              \tag{2.1}
```

Write the prime divisors increasingly as `p_1<...\lt p_k`. Since
`p_i>=i+1`,

```math
\frac{\varphi(M)}M
\ge\prod_{i=1}^k\frac{i}{i+1}=\frac1{k+1}.        \tag{2.2}
```

Thus the harmonic mean of `T` is at most `k+1`, despite its
exponentially large arithmetic mean. For good primes `ell`, the
number of roots of `x^M-1` modulo `ell` is `gcd(M,ell-1)`. Equation
(2.1) is an exact finite residue-class average; identifying it with
an asymptotic prime average is a separate use of equidistribution in
arithmetic progressions. No prime-distribution theorem is needed for
the displayed algebraic calculation.

This calculation does not prove (1.4). It only shows that the earlier
cyclotomic counterexample to arithmetic-mean bounds is not a
counterexample to a polynomial harmonic-mean bound.

## 3. A universal multiquadratic local cover

Let `q_1,...,q_k` be distinct primes, with `k>=2`, and put

```math
a_S=\prod_{i\in S}q_i\quad(\varnothing\ne S\subseteq\{1,...,k\}),
\qquad
F_k(x)=\prod_{\varnothing\ne S\subseteq[k]}(x^2-a_S).
                                                               \tag{3.1}
```

Every `a_S` is a positive nonsquare integer, and different subsets
give different values. Therefore `F_k` has no rational roots.

Call an odd prime `p` good if it divides neither any `a_S` nor any
nonzero difference `a_S-a_T` for `S!=T`. The exceptional set is
finite. For good `p`, all quadratic factors have disjoint root sets
modulo `p`, and each has either zero or two roots. Let

```math
\epsilon_i=\left(\frac{q_i}{p}\right)\in\{1,-1\}.
```

The subset `S` contributes two roots exactly when
`product_(i in S) epsilon_i=1`. Hence

```math
\nu_p(F_k)=
\begin{cases}
2^{k+1}-2,&\epsilon_1=\cdots=\epsilon_k=1,\\
2^k-2,&\text{otherwise}.
\end{cases}                                                   \tag{3.2}
```

For the second case, a nontrivial character of the `k`-dimensional
binary vector space has a kernel of size `2^{k-1}`; subtract the
empty subset, then multiply by two.

Thus at every good prime,

```math
\frac1{1+\nu_p(F_k)}\le\frac1{2^k-1}.             \tag{3.3}
```

There is no universal reciprocal-root lower bound depending only on
the number of rational roots. A bound in terms of circuit size would
need to show that this kind of local cover cannot be produced too
cheaply.

### 3.1 Extracting the integer-root family costs only a constant factor

Define

```math
G_k(y)=\prod_{\varnothing\ne S\subseteq[k]}(y-a_S).
```

Then `F_k(x)=G_k(x^2)`, and `G_k` has exactly `2^k-1` distinct integer
roots.

**Lemma 3.1.** If an even polynomial `F in Z[x]` has a constant-free
program of length `s`, and `F(x)=G(x^2)`, then

```math
\tau(G)\le7s+1.
```

**Proof.** Compute `0=1-1` once. For every register `h(x)`, maintain
the unique pair of integer polynomials `A(y),B(y)` satisfying
`h(x)=A(x^2)+xB(x^2)`. The initial pairs are `(1,0)` and `(0,1)`.
Addition and subtraction operate componentwise and cost at most two
gates. Multiplication uses

```math
(A+xB)(C+xD)=(AC+yBD)+x(AD+BC),\qquad y=x^2,
```

which costs at most seven gates over the new input `y`: four products
`AC,BD,AD,BC`, one product `yBD`, and two additions. At the output,
evenness means that the second component is zero, and the first is
`G`. No division, coefficient extraction oracle, or large constant
is used. QED.

Conversely, substituting `x^2` into a program for `G` costs one extra
gate, so `tau(F_k)<=tau(G_k)+1`. Thus the two families have equivalent
circuit complexity up to absolute constant factors.

In particular, a polynomial-size-in-`k` circuit family for (3.1)
would disprove the original integer tau conjecture. Such a circuit
family has not been constructed here. This stress test is therefore
a concrete hard case for the harmonic approach, not an established
counterexample to it.

### 3.2 The immediate recurrences do not give a short circuit

For the version including the empty subset, put

```math
P_k(X,Y)=\prod_{S\subseteq[k]}(X-a_SY),\qquad a_\varnothing=1.
```

Then

```math
P_0(X,Y)=X-Y,
\qquad
P_k(X,Y)=P_{k-1}(X,Y)P_{k-1}(X,q_kY).             \tag{3.4}
```

This identity uses two differently evaluated copies of the preceding
circuit. The direct construction has a recurrence with a factor of
two, and therefore exponential size. A circuit DAG computing the
first value does not automatically provide the second value.

Equivalently, the `a_S` are the eigenvalues of the tensor product of
the diagonal matrices `diag(1,q_i)`. Taking its characteristic
polynomial gives (3.4), but the matrix dimension is `2^k`. Merely
calling this construction a determinant or a tower of norms does not
remove that dimension or the repeated evaluations. No lower bound
against every possible use of these structures is asserted.

## 4. The same sieve condition would control rational roots

This is a substantive scope issue. Let the distinct rational roots
of `f` be `a_i/b_i` in lowest terms, with `b_i>0`. Let

```math
H_i=\max(|a_i|,b_i).
```

The product of the distinct primitive factors `b_i x-a_i` divides
`f` in `Z[x]`. This follows from divisibility over `Q[x]` and Gauss's
lemma, since their product is primitive. Comparing leading
coefficients gives `product b_i <= exp(B)`. Removing the zero root
and comparing the first nonzero coefficient gives
`product_(a_i!=0)|a_i| <= exp(B)`. The zero root has `(a_i,b_i)=(0,1)`.
Therefore

```math
\sum_i\log H_i\le2B.                            \tag{4.1}
```

The nonzero integers

```math
a_i b_j-a_j b_i
```

have product of absolute values at most
`exp(binom(N,2)log2+2(N-1)B)`. Two primitive pairs give the same
point of `P^1(F_p)` exactly when `p` divides their determinant. Their
reductions are always defined because `gcd(a_i,b_i)=1`.

The homogenization of `f` vanishes at these projective points. Its
number of projective roots is at most `nu_p(f)+1`, including the
case where reduction is identically zero. For `N_Q(f)>=1`, repeating
the collision proof gives

```math
N_\mathbb Q(f)^2(A_+-\log2)
\le N_\mathbb Q(f)(W+4B-\log2)-4B.                \tag{4.2}
```

Consequently, if (1.4) held with the slightly stronger requirement
`W>=8B`, it would imply

```math
N_\mathbb Q(f)\le3(s+1)^C.
```

The rational-root formulation is equivalent to the integer-root
formulation in the charged model. [NORMALIZATION.md](NORMALIZATION.md),
Theorems 2.1 and 3.1, proves this by explicit constructions of sizes
6s+2 and 24s+20, the latter with monic output. Those proofs do not extract
a leading coefficient or use a factorization oracle. Thus (4.2) does not
introduce a stronger root-count target, although the required prime-average
inequality remains unproved.

## 5. What is still missing

The proven sieve inequalities hold for arbitrary configurations and
arbitrary unknown cofactors. They make no claim that local counts
remain controlled through addition gates. The missing statement is a
lower bound for the reciprocal modular-root average in terms of the
charged circuit length.

For comparison, if `Omega` is the distinct-root set over a splitting
field with Galois group `G`, the asymptotic good-prime average is
governed by the conjugacy-invariant statistic

```math
\mathcal H(f)
=\frac1{|G|}\sum_{g\in G}\frac1{1+|\mathop{\mathrm{Fix}}_\Omega(g)|}.
```

Every rational root is fixed by all `g`, so

```math
\mathcal H(f)\le\frac1{1+N_\mathbb Q(f)}.
```

For a nonconstant irreducible polynomial, Burnside averaging gives
`E |Fix(g)|=1`, and convexity gives `H(f)>=1/2`. For a polynomial
with `t` distinct irreducible factors the same elementary bound is only
`H(f)>=1/(t+1)`. The number of irreducible factors itself can be
superpolynomial in circuit size, as the cyclotomic example shows.
Equation (2.1) shows that their joint Galois correlation can still
leave `H` large. The multiquadratic cover shows the opposite pattern.

No estimate relating these correlations to addition-gate history has
been established. Equivariance of each register map alone is
insufficient, as the orbit-collapse examples in [CIRCUIT_HISTORY.md](CIRCUIT_HISTORY.md) show.

The passage from the Galois statistic to a limiting prime average is
an imported use of Chebotarev, separate from the elementary sieve.
[CIRCUIT_HISTORY.md](CIRCUIT_HISTORY.md), Section 11, records Milne, *Algebraic Number Theory*, version 3.08
(19 July 2020), Theorem 8.31, at
https://jmilne.org/math/CourseNotes/ANT.pdf . No effective prime-size
bound is asserted here.

For existing adelic formulations, Phillipson–Rojas,
*Fewnomial Systems with Many Roots, and an Adelic Tau Conjecture*,
arXiv:1011.4128v5 (6 November 2012), Section 2, states an adelic
conjecture after Theorem 2.7 for the restricted SPS family. Its
Example 2.5 gives exponentially many roots simultaneously at any
preselected finite set of p-adic places, with no real roots. That
conjecture is not an established theorem for arbitrary circuits:
https://arxiv.org/html/1011.4128v5 .
