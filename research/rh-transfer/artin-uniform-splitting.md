# Artin's primitive root conjecture

## Status and dependency

This note extracts a useful uniform splitting estimate from entry 029 of OpenAI's mathematical manuscripts, proves the two index-divisor tails that it controls, and states the remaining average estimate precisely. It does **not** prove Artin's density asymptotic.

The numerical zero-free strip below is a separate imported claim from the October 4, 2026 manuscript. It is not an implication of the accepted Alpöge RH/Dirichlet-GRH archive established by this campaign. We have checked the statement, the final Mellin-continuation step, the field reduction, and the splitting deduction. We have not audited the manuscript's full preceding theta-series argument. No Lean verification is involved.

The target is the full density formula, for each integer a that is neither a square nor −1:

```math
\#\{p\le X:a\bmod p\text{ is a primitive root}\}
  \sim A(a)\mathop{\mathrm{Li}}(X),
\qquad
A(a)=\sum_{n\ge1}\frac{\mu(n)}
 {[\mathbf Q(\mu_n,a^{1/n}):\mathbf Q]}.
```

The infinitude and positive-lower-density statements discussed below are distinct prior claims. They are not counted as new results here.

## 1. Primary source and exact hypothesis

The source is OpenAI, *Primitive roots for every admissible integer base*, October 4, 2026, pinned at commit **4eaee87548250b2682affda7d05d947c05554bae** in [openai/math](https://github.com/openai/math/tree/4eaee87548250b2682affda7d05d947c05554bae/preprints/Primitive-roots-for-every-admissible-integer-base-October-4-2026/build).

Relevant source files:

| File | Exact item | Blob SHA |
|---|---|---|
| [01-introduction.tex](https://github.com/openai/math/blob/4eaee87548250b2682affda7d05d947c05554bae/preprints/Primitive-roots-for-every-admissible-integer-base-October-4-2026/build/sections/01-introduction.tex) | Theorem 1.2, label thm:hecke-zero-free | d3ed0c86e7524058a601145a4863acdb89d576e7 |
| [01a-reduction.tex](https://github.com/openai/math/blob/4eaee87548250b2682affda7d05d947c05554bae/preprints/Primitive-roots-for-every-admissible-integer-base-October-4-2026/build/sections/01a-reduction.tex) | Proposition 2.2 and the splitting test | 260e5612b0f4e3b70a870d7dc28001abb24a16ee |
| [06-zero-free.tex](https://github.com/openai/math/blob/4eaee87548250b2682affda7d05d947c05554bae/preprints/Primitive-roots-for-every-admissible-integer-base-October-4-2026/build/sections/06-zero-free.tex) | Final Mellin continuation | 589df3a177b3961e83ff3b8f6fadcba6ebb2f64a |
| [07-splitting.tex](https://github.com/openai/math/blob/4eaee87548250b2682affda7d05d947c05554bae/preprints/Primitive-roots-for-every-admissible-integer-base-October-4-2026/build/sections/07-splitting.tex) | Lemmas spl:field-bounds, spl:smooth-estimate; final proof | ee9b3eac0decd351991b6b3f8d2b237b5df2970d |
| [08-type-ii.tex](https://github.com/openai/math/blob/4eaee87548250b2682affda7d05d947c05554bae/preprints/Primitive-roots-for-every-admissible-integer-base-October-4-2026/build/sections/08-type-ii.tex) | Theorem 10.1, Lemma 10.2, Proposition 10.3 | 42684fbb88a94407b4021f747635c1e50df64e7b |

For a fixed real number 0<δ<1/2, write H(δ) for:

> For every cyclotomic number field F containing μ12 and every finite-order Hecke character η of F, the function L_F(s,η) has no zeros in Re(s)>1−δ. The trivial character is included; its simple pole at s=1 is allowed.

Theorem 1.2 claims H(10^−6). The width is independent of F, η, conductor, and height. Auxiliary analytic constants and onsets may depend on F and η.

The final argument in 06-zero-free.tex actually obtains a saving 1/20000: its function f_η(Z) is bounded by a constant times Z^(7/15−1/20000) as Z tends to infinity, and by O_A(Z^A) near zero for every A. Its Mellin transform therefore continues the quotient of a holomorphic, nowhere-zero numerator by L^S(s,η) to Re(s)>1−1/20000. That continuation excludes denominator zeros there. Deleted finite Euler factors have their zeros on Re(s)=0.

An F- or η-dependent onset does not by itself invalidate this continuation: the finite middle part of the Mellin integral is entire, while the exponents determine the convergence half-plane. The unverified dependency is the preceding quantitative estimate for f_η, not that elementary onset issue. We keep the source's stated conservative value δ=10^−6 when giving a numerical example.

## 2. Uniform splitting for polynomially growing q

Fix an integer |a|>1. For a prime q put

```math
K_q=\mathbf Q(\mu_q,a^{1/q}),\qquad
N_a(x,q)=\#\{x\lt p\le2x:p\text{ splits completely in }K_q\}.
```

There is a q_0(a) such that, for every prime q>q_0(a),

```math
n_q=[K_q:\mathbf Q]=q(q-1),\qquad
\log |D_{K_q}|+n_q\ll_a n_q\log(2q).
```

These are the field bounds in 07-splitting.tex. To see the relevant zero-free descent, set F_q=Q(μ12q) and K'_q=K_qF_q. The extension K'_q/F_q is cyclic Kummer, so its Dedekind zeta function is a product of finite-order Hecke L-functions over F_q. Under H(δ), it has no zeros in Re(s)>1−δ. Also K'_q/K_q is abelian, and ζ_(K'_q)/ζ_(K_q) is a product of entire nonprincipal Hecke L-functions. Thus a zero of ζ_(K_q) away from s=1 cannot disappear upstairs. At s=1 the Dedekind zeta function has a pole, not a zero.

For a fixed nonnegative smooth compactly supported function f on (0,∞), define

```math
\Theta_{K,f}(x)=
 \sum_{\mathfrak p}\sum_{j\ge1}
   \log N\mathfrak p\,
   f\bigl((N\mathfrak p)^j/x\bigr).
```

The source's smoothed explicit formula gives, uniformly in K and x≥2,

```math
\Theta_{K,f}(x)\ll_f
 x+x^{1-\delta}\bigl(\log|D_K|+[K:\mathbf Q]\bigr),
\tag{2.1}
```

provided ζ_K has the stated zero-free half-plane. It uses a uniform unit-height zero count and the rapid decay of the Mellin transform of f. Its cited zero-count input is Hasanalizade–Shen–Wong, *Counting zeros of Dedekind zeta functions*, Math. Comp. 91 (2022), 277–293, [DOI 10.1090/mcom/3665](https://doi.org/10.1090/mcom/3665), rather than the defective parameter-removal step in Trudgian's 2015 bound discussed in the separate Grosswald review.

Take f≥1 on [1,2]. Every completely split rational prime contributes at least n_q log x to the left side of (2.1). Consequently,

```math
N_a(x,q)\ll_a
 \frac{x}{q(q-1)\log x}
 +\frac{x^{1-\delta}\log(2q)}{\log x}.
\tag{2.2}
```

**The q restriction in the stated proposition is unnecessary for (2.2).** The source's final proof derives precisely this inequality before using q≤exp((log x)^0.3) in its last sentence. All preceding field and explicit-formula bounds are uniform for q>q_0(a). Therefore (2.2) also holds for q in any fixed polynomial range. If q≤x^B for fixed B, its error is O_(a,B)(x^(1−δ)).

This enlargement concerns the same imported zero-free input. It does not turn the exponent 1−δ into the square-root exponent supplied by GRH.

## 3. The small index-divisor tail is closed

For p not dividing a, define the multiplicative index

```math
i_p(a)=\frac{p-1}{\mathop{\mathrm{ord}}_p(a)}.
```

For p not dividing aq,

```math
q\mid i_p(a)
 \quad\Longleftrightarrow\quad
p\text{ splits completely in }K_q.
\tag{3.1}
```

Indeed, complete splitting requires p≡1 mod q and a to be a qth power modulo p; these are equivalent to a^((p−1)/q)≡1 mod p.

Fix 0<η<δ and y>q_0(a). From (2.2) and the union bound,

```math
\begin{aligned}
&\#\{x\lt p\le2x:\exists\text{ prime }q,
                \ y\lt q\le x^\eta,\ q\mid i_p(a)\}
\\ &\quad\ll_a
 \frac{x}{\log x}\sum_{q>y}\frac1{q(q-1)}
 +\frac{x^{1-\delta}}{\log x}
       \sum_{q\le x^\eta}\log(2q)
\\ &\quad\ll_a
 \frac{x}{\lfloor y\rfloor\log x}
 +\frac{x^{1-\delta+\eta}}{\log x}.

\end{aligned} \tag{3.2}
```

The first estimate uses the telescoping bound over all integers, and the second uses Chebyshev's estimate for the sum of log q over primes. Constants may depend on the fixed parameters; none depends on the growing q.

Thus the normalized upper limit of this tail is O_a(1/y). For example, the source's stated δ=10^−6 permits the fixed choice η=5·10^−7. The exact value is not a new numerical-case result; any fixed η strictly below the supplied strip width works.

## 4. The large index-divisor tail is closed unconditionally

Fix A>0 and let

```math
Q_1(x)=\sqrt{x}(\log x)^A.
```

If x<p≤2x and some prime q>Q_1(x) divides i_p(a), then

```math
m=\frac{p-1}{q}\le
 \frac{2\sqrt{x}}{(\log x)^A},
 \qquad p\mid a^m-1.
```

For M equal to the integer part of the upper bound,

```math
\log\prod_{1\le m\le M}|a^m-1|
 \le \sum_{m\le M}\bigl(m\log|a|+\log 2\bigr)
 \ll_a M^2.
```

Every distinct prime p>x in question contributes at least log x to this product's logarithm. Therefore

```math
\#\{x\lt p\le2x:\exists\text{ prime }q>Q_1(x),
                         \ q\mid i_p(a)\}
 \ll_a\frac{x}{(\log x)^{2A+1}}
 =o_a\!\left(\frac{x}{\log x}\right).
\tag{4.1}
```

This proof needs no zero-free hypothesis and counts the union directly, so repeated occurrences of the same prime cause no overcounting problem.

## 5. Exact sufficient missing estimate

For fixed 0<η<δ and A>0, the remaining assertion is

```math
\boxed{
 \ \sum_{\substack{x^\eta\lt q\le Q_1(x)\\q\ {\rm prime}}}
 N_a(x,q)
 =o_a\!\left(\frac{x}{\log x}\right).
\ }
\tag{5.1}
```

For this fixed η, (5.1) is equivalent up to constant factors to the corresponding bad-prime union being negligible. Each i_p(a)<2x has at most log(2x)/(η log x) prime divisors exceeding x^η. Thus a prime in the union is counted between once and O(1/η) times.

**Conditional reduction.** H(δ), together with (5.1) for each admissible a and one fixed pair η,A as above, implies the full Artin density formula.

Here is the proof, including the order of limits. Let M_y be the product of primes at most y and let P_y(x) count x<p≤2x with gcd(i_p(a),M_y)=1. For fixed y, finite inclusion-exclusion and the ordinary Chebotarev theorem give

```math
P_y(x)=
 \left(\delta_y+o_{a,y}(1)\right)
 \bigl(\mathop{\mathrm{Li}}(2x)-\mathop{\mathrm{Li}}(x)\bigr),
\qquad
\delta_y=\sum_{n\mid M_y}
 \frac{\mu(n)}{[\mathbf Q(\mu_n,a^{1/n}):\mathbf Q]}.
\tag{5.2}
```

For squarefree n, the compositum of the fields K_q, q dividing n, is K_n. Bézout's identity applied to the numbers n/q recovers a^(1/n) from compatible roots a^(1/q), so (5.2) uses the correct intersection fields.

Let h be the greatest common divisor of the valuations of |a| at its prime divisors. For squarefree n,

```math
[K_n:\mathbf Q]\ge\frac{n\varphi(n)}{2h}.
\tag{5.3}
```

A short justification is useful. If an odd prime q divides n but not h, a is not a qth power in the abelian field Q(μ_n). Otherwise the real qth root of a would lie in that field. Its rational field has degree q: a prime valuation of a not divisible by q forces ramification divisible by q, while its defining polynomial has degree q. That real degree-q field is not normal, because the other qth roots are nonreal. This contradicts its containment in an abelian extension. Kummer theory therefore forces every such q to divide [K_n:Q(μ_n)]. Only the factor 2 and prime factors of h can be lost, proving (5.3).

Consequently,

```math
\sum_{n\ge1}\frac{|\mu(n)|}{[K_n:\mathbf Q]}
 \le2h\prod_q\left(1+\frac1{q(q-1)}\right)<\infty,
```

and δ_y tends to A(a). Its strict positivity for admissible integers is the standard algebraic constant calculation in Hooley's theorem, not a new claim of this note; see [Hooley, 1967](https://doi.org/10.1515/crll.1967.225.209) and the formulation in [Fan–Pollack, 2025](https://doi.org/10.1112/mtk.70055).

Let P_a(x) count primitive-root primes in (x,2x]. Then P_a(x)≤P_y(x). Every prime in the difference has an index divisor q>y. Split these divisors at x^η and Q_1(x). Equations (3.2), (4.1), and (5.1) give

```math
0\le P_y(x)-P_a(x)
 \le \left(O_a(1/y)+o_{a,y}(1)\right)\frac{x}{\log x}.
```

First let x tend to infinity with y fixed; then let y tend to infinity. Both normalized limits equal A(a). Summing the dyadic statement gives the cumulative asymptotic: for a prescribed error tolerance, use the uniform tail of the dyadic asymptotic above a fixed threshold, and bound the finitely many smaller primes separately.

This is a sufficient reduction. We do not claim that Artin's density conclusion by itself implies the particular average bound (5.1).

## 6. Why the supplied estimates do not yet prove (5.1)

### Pointwise summation

Summing the error in (2.2) up to Q_1(x) gives a bound on the scale

```math
x^{1-\delta}Q_1(x)/\log x
 =x^{3/2-\delta}(\log x)^{A-1},
```

which is far larger than x/log x for the supplied δ. No choice of logarithmic A repairs the power of x.

Ignoring the Kummer condition and using only p≡1 mod q gives, by Brun–Titchmarsh,

```math
\sum_{x^\eta\lt q\le Q_1(x)}N_a(x,q)
 \ll \frac{x}{\log x}
       \sum_{x^\eta\lt q\le Q_1(x)}\frac1q
 \ll_\eta \frac{x}{\log x}.
```

For fixed η<1/2 the reciprocal-prime sum tends to log(1/(2η)), not zero. This estimate has the right order of magnitude but lacks the required vanishing factor.

### The marked Type II interface

Theorem 10.1 of the source is uniform over bounded functions F only when

```math
F(\ell h)=F(h)
\quad\text{for every positive }h
\text{ and every prime }\ell\in\bigcup_{i=1}^K\mathcal P_i,
```

where each band is

```math
\mathcal P_i=
 \{\ell:\exp((\log x)^{a_i})\le\ell\le
             \exp(2(\log x)^{a_i})\},
\qquad 0.1\lt a_1<\cdots\lt a_K<0.2.
```

Equivalently, F must depend only on h after removing its complete band-prime part, including all powers. Its coefficients are a specified prime-versus-rough discrepancy in one variable and a bounded rough-supported sequence in the other. Lemma 10.2 allows other scalar coefficients only after proving cancellation against every character of logarithmic modulus, throughout the long frequency range |t|≤2X(log x)^B, for every fixed B. Proposition 10.3 verifies that condition for another specified rough-factor discrepancy.

The missing index condition depends on the congruence

```math
a^{h/q}\equiv1\pmod{h+1},\qquad q\mid h.
```

Multiplication of h by a band prime changes both modulus and exponent. No band-invariant encoding of this condition on the needed range has been proved. Boundedness alone is insufficient to invoke Theorem 10.1; an arbitrary Kummer indicator also does not automatically meet Lemma 10.2's coefficient cancellation hypothesis.

The source's two bilinear variables factor a candidate prime during composite subtraction. They are not the q and (p−1)/q in the index obstruction. Interchanging these roles without a new argument would misapply the theorem.

A useful extension would have to establish either (5.1) directly, or a marked estimate retaining the required growing-q Kummer traces with enough uniformity to imply (5.1). The existing source statements have not supplied that extension.

## 7. Prior-art boundary as of November 20, 2026

- The October 4 source's Theorem 1.1 claims at least c_a x/(log x)^2 primitive-root primes in every sufficiently large dyadic interval.
- [Bhargava, October 12, 2026](https://hexagonmath.org/pdf/2610.00228v1), Theorems 1–2, claims positive lower density. Under a common Dedekind zero-free width 1/N, the lower proportion is at least c_a/(N log N). Its abstract explicitly distinguishes this lower bound from the exact Artin density. Its construction removes the middle range by restricting the predecessor's factorization; it does not estimate that range for all primes.
- [Vojdanovski, November 12, 2026](https://hexagonmath.org/pdf/2611.00341v1), Theorem 1.1, claims the simultaneous positive-lower-density classification subject to the two Matthews obstructions. Theorem 1.2 retains a fixed cubic Kummer Frobenius condition in a large-prime-factor statistic. The field, modulus, and finite character family are fixed before x grows; this does not provide the varying prime-degree family in (5.1).
- [Fan–Pollack, 2025](https://doi.org/10.1112/mtk.70055), Theorem 1.1, proves a uniform version of Hooley's asymptotic under the required Kummer-field GRH. Rational Dirichlet GRH alone is not its hypothesis.

These recent manuscripts are recorded as primary prior claims and possible inputs, not certified by this note. Their weaker conclusions are excluded from the campaign's new-result count. No full Artin resolution is claimed here.

## 8. Checkpoint

Closed deductions: the polynomial-q version of the source's splitting inequality; the small-tail estimate (3.2); the unconditional large-tail estimate (4.1); and the complete conditional reduction from (5.1) to the classical Artin constant.

Remaining mathematical input: prove the middle-family average (5.1), or a different estimate sufficient to replace it. The companion average-Chebotarev investigation is assigned to the Dirichlet worker. The Hecke-family descent and the possible RH-amplification bridge are assigned to the nonabelian worker.

Updated November 20, 2026. Coordination: [issue 80](https://github.com/1337isnot1337/solved-conjectures/issues/80).
