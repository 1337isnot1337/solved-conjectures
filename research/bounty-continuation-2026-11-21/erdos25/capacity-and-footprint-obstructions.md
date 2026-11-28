# Erdős 25: capacity and footprint barriers to a direct block conversion

> Subsequent status: the general finite Haar-zeta comparison and its stronger LCM-capacity version are now [disproved](finite-zeta-counterexample.md), with [independent](COUNTEREXAMPLE_REVIEW.md) and [coordinator](COUNTEREXAMPLE_COORDINATOR_REVIEW.md) reviews. The earlier conditional implication and restricted theorems remain valid. Erdős 25 itself remains unresolved. The original argument below is preserved.

21 November 2026. The [target audit](target-and-prior-audit.md) records the full paid question and prior work. This note proves restrictions on converting Wang's multiple-residue construction into a singleton system. None settles Erdős 25. No novelty is claimed for the elementary counting inequalities or for the cited classical theorems.

Wang's [primary construction, Section 3](https://github.com/ShouqiaoW/erdos/blob/main/486/paper.tex) has, at scale $`Q_j=2^j`$,

```math
k_j=2\left\lfloor\frac{\sqrt j}{8}\right\rfloor,
\qquad
E_j\subseteq[11Q_j/10,19Q_j/10],
\qquad |E_j|\ge3Q_j/8,
```

and uses moduli in $`[19Q_j/20,21Q_j/20]`$. Its completed periodic union has measure at most $`e^{-k_j/100}`$. Many endpoints share a modulus but require different residues. That multiplicity is essential to these simultaneous bounds.

## 1. Too many required prime divisors leave too few singleton classes

Fix distinct primes $`p_1,\ldots,p_k`$ and put

```math
\nu(q)=|\{i:p_i\mid q\}|,\qquad
\lambda=\sum_{i=1}^k\frac1{p_i}.
```

For every $`1\le h\le k`$ and every real $`Y\ge1`$,

```math
|\{q\le Y:\nu(q)\ge h\}|
\le
Y\frac{\lambda^h}{h!}
\le
Y\left(\frac{e\lambda}{h}\right)^h.                 \tag{1}
```

To prove this, every qualifying $`q`$ is divisible by $`d_S=\prod_{i\in S}p_i`$ for at least one $`h`$-element set $`S`$. Hence its count is at most

```math
\sum_{|S|=h}\left\lfloor\frac{Y}{d_S}\right\rfloor
\le Y\sum_{|S|=h}\frac1{d_S}
\le Y\frac{\lambda^h}{h!}.
```

The last inequality follows by expanding $`\lambda^h`$: every product with distinct indices appears $`h!`$ times. The elementary factorial bound $`h!\ge(h/e)^h`$ gives (1).

There is also a reciprocal version:

```math
\sum_{\substack{q\le Y\\\nu(q)\ge h}}\frac1q
\le
(1+\log Y)\frac{\lambda^h}{h!}.                     \tag{2}
```

Indeed, after the same overcount by $`S`$, the contribution of multiples of $`d_S`$ is $`H_{\lfloor Y/d_S\rfloor}/d_S`$, bounded by $`(1+\log Y)/d_S`$.

For one residue $`a(q)\bmod q`$, the activation condition gives

```math
|\{m\le Y:m\ge q,\ m\equiv a(q)\pmod q\}|\le Y/q.   \tag{3}
```

There is no extra additive one: normalizing $`0\le a(q)\lt q`$ makes the active sequence $`q+a(q),2q+a(q),\ldots`$, with the usual interpretation when $`a(q)=0`$. Combining (2) and (3), **even if every eligible modulus is used**, a singleton system whose moduli all satisfy $`\nu(q)\ge h`$ deletes at most

```math
Y(1+\log Y)\frac{\lambda^h}{h!}                    \tag{4}
```

integers up to $`Y`$.

### Application to the prime-incidence skeleton

For a central subset in Wang's construction, at least

```math
h_j=\left\lceil k_j/2-\sqrt{k_j}\right\rceil
```

of the $`k_j`$ prescribed primes divide the modulus. For large $`j`$, $`h_j\ge k_j/3`$. The following estimate is uniform over the choice of distinct primes, so it does not depend on Wang's primes being large.

Order the primes increasingly. The $`i`$th is at least $`i+1`$, giving $`\lambda\le\log(k_j+1)`$. For any fixed $`C>0`$ and $`Y=C2^j`$, (4) therefore gives

```math
\frac{|\text{deleted integers up to }Y|}{Y}
\le
(1+\log(C2^j))
\left(\frac{e\log(k_j+1)}{h_j}\right)^{h_j}
\longrightarrow0.                                \tag{5}
```

For completeness, the defining floor implies $`j<(4k_j+8)^2`$. Thus the prefactor is $`O(k_j^2)`$, while the second factor is at most $`(3e\log(k_j+1)/k_j)^{k_j/3}`$ once its base is below one. Its logarithm is $`-\Omega(k_j\log k_j)`$, which dominates the logarithm of that polynomial prefactor.

Consequently, preserving this many-prime-incidence requirement cannot produce a positive endpoint fraction in a singleton system. This remains true if the replacement moduli are allowed to range anywhere below the endpoint cutoff, rather than staying comparable to it. Simply making the primes smaller does not fix the allocation problem.

A construction with fewer prescribed prime divisors is outside this restriction.

## 2. A general lower bound on a singleton block's periodic footprint

This section does not impose any prime-incidence structure.

Fix $`0\lt a\le b`$, $`c>0`$, and $`Q`$ large enough that $`aQ\ge1`$. Suppose a finite set of distinct moduli satisfies

```math
aQ\le q\le bQ,
```

with one residue $`r_q\bmod q`$ each. Let $`U`$ be the union of their completed residue classes in the profinite integers, and let $`\mu`$ be Haar probability measure.

Suppose these classes cover at least $`cQ`$ integer endpoints in an interval of diameter less than $`aQ`$. Each residue class can contain at most one endpoint, so the number $`M`$ of moduli is at least $`cQ`$.

Define the nonnegative counting function

```math
Z(\omega)=\sum_q 1_{\{\omega\equiv r_q\pmod q\}}.
```

Then

```math
\mathbb E Z=\sum_q\frac1q\ge c/b.                  \tag{6}
```

The intersection of two residue classes has measure either zero or $`1/\mathop{\mathrm{lcm}}(q,r)`$. Thus

```math
\begin{aligned}
\mathbb E Z^2
&\le\sum_{q,r}\frac{\gcd(q,r)}{qr}
\\ &\le\frac1{a^2Q^2}
   \sum_{u,v\le\lfloor bQ\rfloor}\gcd(u,v)
\\ &=\frac1{a^2Q^2}
   \sum_{d\le\lfloor bQ\rfloor}
   \varphi(d)\left\lfloor\frac{\lfloor bQ\rfloor}{d}\right\rfloor^2
\\ &\le\frac{b^2}{a^2}(1+\log(bQ)).
\end{aligned}                                                     \tag{7}
```

The equality uses $`\gcd(u,v)=\sum_{d\mid u,\ d\mid v}\varphi(d)`$. For the final bound use $`\varphi(d)\le d`$ and the harmonic-sum estimate.

Cauchy–Schwarz applied on the support $`U`$ now proves

```math
\boxed{\displaystyle
\mu(U)\ge
\frac{c^2a^2}{b^4(1+\log(bQ))}.}                    \tag{8}
```

For Wang's endpoint and modulus intervals, insert $`a=19/20`$, $`b=21/20`$, and $`c=3/8`$:

```math
\mu(U)\ge
\frac{(95/294)^2}{1+\log(21Q/20)}.                  \tag{9}
```

At $`Q=2^j`$, this is a positive constant times $`1/j`$. Wang's required upper bound $`e^{-k_j/100}`$ is eventually smaller. Therefore **no singleton block can satisfy all of Wang's numerical block conclusions at sufficiently large scales**, regardless of how its moduli or residues are chosen inside the specified intervals.

The lower bound also rules out a summable-footprint union-bound assembly over infinitely many epochs $`j\in[a_t,2a_t]`$ with a fixed positive endpoint fraction: each epoch contributes a fixed positive lower bound to the sum of individual footprint measures.

It does not show that the measure of the union of footprints is their sum. Correlations between different scales are not excluded by this second-moment argument.

## 3. A classical cross-scale obstruction for injective endpoint assignments

The correlation issue can be handled for a more restricted endpoint assignment by two established theorems.

**Rogers' theorem.** For finitely many moduli, the union of their arbitrary residue classes has measure at least the union of their zero residue classes. A source statement is Filaseta–Ford–Konyagin–Pomerance–Yu, [*Sieving by large integers and covering systems of congruences*, printed p. 498](https://www.math.kent.edu/~yu/research/covering.pdf). Tao's [19 January 2026 exposition, Theorems 1 and 3](https://terrytao.wordpress.com/2026/01/19/rogers-theorem-on-sieving/), provides the compression proof and credits Rogers and Halberstam–Roth.

**Davenport–Erdős.** For any set $`D`$ of positive integers, its set of positive multiples $`M(D)`$ has logarithmic density equal to the increasing limit of the densities of the finite unions of multiples. See [*On sequences of positive integers* (1936), Theorem 1, printed pp. 149–150](https://www.renyi.hu/~p_erdos/1936-04.pdf).

Let $`D`$ be the complete set of distinct moduli in a proposed singleton construction and put

```math
U=\bigcup_{q\in D}[a(q)]_q,
\qquad
U_0=\bigcup_{q\in D}[0]_q.
```

Finite Rogers inequalities and continuity from below imply

```math
\mu(U)\ge\mu(U_0)=\mathop{\mathrm{ld}}(M(D)).          \tag{10}
```

Now suppose a set of designated early endpoints $`E`$ has an injective assignment $`m\mapsto q(m)\in D`$ with $`q(m)\le m`$. Then for every $`X`$,

```math
\sum_{\substack{m\le X\\m\in E}}\frac1m
\le
\sum_{\substack{q\le X\\q\in D}}\frac1q
\le
\sum_{\substack{n\le X\\n\in M(D)}}\frac1n.
```

Consequently,

```math
\boxed{\displaystyle
\overline{\mathop{\mathrm{ld}}}(E)\le\mu(U).}          \tag{11}
```

The endpoint assignment's congruence condition is not even needed for this inequality; injectivity and activation are sufficient.

This means that an injective one-designated-endpoint-per-modulus construction cannot have designated endpoints of upper logarithmic density $`\gamma`$ while its entire completed periodic footprint has measure less than $`\gamma`$, even if different scales' footprints overlap. Wang's construction permits a fixed positive endpoint-density effect with arbitrarily small total footprint, so that feature cannot be retained by such an injective replacement.

More generally, suppose at most $`K`$ designated endpoints are assigned to each modulus, all in its one active residue class. The $`\ell`$th assigned endpoint is at least $`\ell q`$, after ordering the assigned endpoints. The same proof gives

```math
\overline{\mathop{\mathrm{ld}}}(E)\le H_K\mu(U).        \tag{12}
```

This does not prove logarithmic-density existence for the full deletion set: each modulus can delete unboundedly many integers. Nor does it control a tail conditioned on survival of an arbitrary earlier finite sieve. Those are genuine missing steps.

Equations (11)–(12) are deductions from the cited classical theorems, not a new solution or a claimed new theorem of Rogers or Davenport–Erdős.

## 4. Remaining route and separate refinement audit

The [independent refinement analysis](singleton-refinement-barrier.md) proves a different obstruction: any finite-per-source-block subdivision into distinct-modulus subcylinders of Wang's footprints has natural density, even after arbitrary common block dilations and translations. Its period and divisor hypotheses are explicit.

### Why infinitely many refinements inside one fixed block are different

The finite-per-block assumption cannot be discarded as a technicality. As the independent worker observed, arbitrary infinite refinements of one cylinder already contain the full Erdős 25 problem.

Fix $`q\ge1`$ and $`0\le r\lt q`$. Given any singleton system with distinct moduli $`d_i`$ and residues $`b_i`$, replace it by the moduli $`qd_i`$ and residues $`qb_i+r`$. All new cylinders lie inside $`r+q\mathbb Z`$ and refine its modulus $`q`$.

Writing $`n=qm+r`$ gives the exact equivalences

```math
n\ge qd_i\iff m\ge d_i,
\qquad
n\equiv qb_i+r\pmod {qd_i}
\iff m\equiv b_i\pmod {d_i}.
```

For the deleted set $`B`$ of the original system and its image $`B'`$,

```math
\sum_{\substack{n\le X\\n\in B'}}\frac1n
=
\frac1q
\sum_{\substack{m\le(X-r)/q\\m\in B}}\frac1m+O(1),    \tag{13}
```

because $`|1/(qm+r)-1/(qm)|\le r/(q^2m^2)`$. Thus the upper and lower logarithmic densities of deletions are both scaled by $`1/q`$. Existence of logarithmic density is preserved in both directions.

A theorem giving logarithmic density for all infinite singleton refinements of one fixed cylinder would therefore already solve the full target. A natural-density theorem would be even stronger and cannot be inferred from the single-block uniform estimate.

### The positive comparison still under investigation


The restrictions here leave room only for a construction changing the prime-incidence pattern, the finite footprints, or the way many activated points per modulus are used. They also leave open a positive argument controlling the first-kill contribution relative to an arbitrary finite past. The existing Chojecki paper identifies that conditional tail as the unresolved part.

A separate candidate positive comparison under investigation is

```math
\sum_{n\in B}n^{-s}
\le
\zeta(s)\,\mu(U)
\qquad(s>1),                                      \tag{14}
```

for every finite singleton system, where $`B`$ is its activated union and $`U`$ its completed periodic union. It is **unproved here**. Rogers' Haar compression does not by itself establish (14), because the integer-size activation and the weights $`n^{-s}`$ are not Haar product data. Finite numerical diagnostics do not establish it. An incremental proof also fails without extra accounting: Chojecki's tower example makes a single first-kill contribution much larger than its eventual density, so any valid proof must use slack from the earlier classes.

The full target remains unresolved.

