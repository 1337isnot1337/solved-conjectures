# Erdős 51: bounded reuse of prime markers forces reciprocal convergence

21 November 2026. This note proves a uniform obstruction to a proposed construction for the [full inverse-totient target](target-and-prior-audit.md). The target remains open. No numerical cases, bounty resolution, or novelty priority are claimed.

## 1. The exact statement

Let $`\mathcal P`$ be a set of primes. Suppose that for each $`p\in\mathcal P`$ a prime $`r(p)`$ is chosen with $`r(p)\mid p-1`$, and that some fixed integer $`K`$ bounds the number of primes assigned to any one marker:

```math
\#\{p\in\mathcal P:r(p)=r\}\le K
\qquad\text{for every prime }r.                         \tag{1}
```

**Proposition.** Under (1),

```math
\sum_{p\in\mathcal P}\frac1p<\infty.                    \tag{2}
```

More precisely, as $`x\to\infty`$,

```math
\#(\mathcal P\cap[1,x])
\ll K\frac{x}{(\log x)^3}
   +\frac{x\log\log x}{(\log x)^2}.                    \tag{3}
```

The constants in (3) are absolute after fixing a sufficiently large absolute lower threshold for $`x`$. In particular, the result applies to injective assignments, with $`K=1`$. No bound on the cofactors $`(p-1)/r(p)`$ is assumed.

## 2. The uniform sieve input

The input is Kevin Ford, [*Sieve Methods Lecture Notes, Spring 2023*](https://ford126.web.illinois.edu/sieve2023.pdf), Theorem 2.5, printed pp. 19–21. Its upper bound for admissible $`k`$ primitive distinct integer linear forms has an implied constant depending only on $`k`$, not their coefficients. The middle bound in that theorem, specialized to the forms $`t`$ and $`mt+1`$, gives

```math
\#\{r\le y:r\text{ and }mr+1\text{ are prime}\}
\ll \frac{m}{\varphi(m)}\frac{y}{(\log y)^2}
\qquad(m\ge2\text{ even},\ y\ge2).                    \tag{4}
```

Here the determinant parameter is $`\Delta=m`$. At a prime $`\ell\mid m`$ there is one forbidden residue; at every other prime there are two. Evenness of $`m`$ makes the forms admissible at two, and admissibility at odd primes is immediate. The theorem's exceptional-prime factor is exactly $`\prod_{\ell\mid m}(1-1/\ell)^{-1}=m/\varphi(m)`$. This checks coefficient uniformity directly; a theorem for fixed $`m`$ would not suffice for the argument below.

If $`m`$ is odd, an odd prime $`r`$ makes $`mr+1`$ even and larger than two. Only the marker $`r=2`$ is then possible, and (1) allows at most $`K`$ selected primes with that marker.

## 3. An elementary average for the sieve factor

For $`M\ge1`$, the divisor identity

```math
\frac{m}{\varphi(m)}
=\sum_{d\mid m}\frac{\mu^2(d)}{\varphi(d)}
```

follows prime by prime. Consequently

```math
\begin{aligned}
\sum_{m\le M}\frac1{\varphi(m)}
&=\sum_{d\le M}\frac{\mu^2(d)}{d\varphi(d)}
       \sum_{j\le M/d}\frac1j
\\ &\le (1+\log M)\prod_{\ell\text{ prime}}
       \left(1+\frac1{\ell(\ell-1)}\right)
\\ &\le e(1+\log M).
\end{aligned}                                                   \tag{5}
```

The last product bound uses $`1+u\le e^u`$ and
$`\sum_{\ell}1/(\ell(\ell-1))\le\sum_{n\ge2}1/(n(n-1))=1`$.
Thus no nonuniform estimate for $`1/\varphi(m)`$ is needed.

## 4. Counting the selected primes

Put $`R=x/(\log x)^2`$. Selected primes $`p\le x`$ whose marker satisfies $`r(p)\le R`$ number at most

```math
K\pi(R)\ll K\frac{x}{(\log x)^3},                       \tag{6}
```

by the standard elementary prime-count upper bound. For the remaining selected primes, write $`p=mr(p)+1`$. Then

```math
1\le m< (\log x)^2,\qquad r(p)\le x/m.                 \tag{7}
```

For sufficiently large $`x`$, the large-marker case has $`r(p)>2`$, so $`m`$ is even. Also

```math
\log(x/m)\ge\log x-2\log\log x\ge\tfrac12\log x.       \tag{8}
```

Apply (4) with $`y=x/m`$ and sum over even $`m\le(\log x)^2`$. Counting all prime pairs may overcount the chosen assignment, which is harmless for this upper bound. Equations (4)–(5) give

```math
\begin{aligned}
\#\{p\le x:r(p)>R\}
&\ll \frac{x}{(\log x)^2}
       \sum_{m\le(\log x)^2}\frac1{\varphi(m)}
\\ &\ll \frac{x\log\log x}{(\log x)^2}.
\end{aligned}                                                   \tag{9}
```

Combining (6) and (9) proves (3). Partial summation proves (2), since

```math
\int_{x_0}^{\infty}
\left(\frac{K}{t(\log t)^3}
      +\frac{\log\log t}{t(\log t)^2}\right)dt<\infty.    \tag{10}
```

All estimates are uniform in the assignment. The statement is about arbitrary prime sets, not a fixed search range.

## 5. Consequence and remaining E51 obstruction

For a positive integer $`n`$,

```math
\frac{n}{\varphi(n)}=\prod_{p\mid n}(1-1/p)^{-1}.         \tag{11}
```

A construction that accumulates a fixed set of selected primes with bounded marker reuse cannot make this product diverge: (2) makes the product over the entire selected set finite. This applies, in particular, to attempts that use a fresh prime divisor of $`p-1`$ as a private witness whenever a selected prime $`p`$ is introduced. The obstruction allows arbitrary cofactors, rather than only safe primes or a prescribed growth schedule.

The [July 2026 primary attempt](https://github.com/pw/erdosproblemaday-verification/blob/main/51/barrier-and-anatomy/july-report/erdos51_totient_preimage_gap.md) already records the exact full-fiber replication strategy and the convergence obstruction for safe-prime and rapidly growing marker choices. Its inspected content is pinned in the [source manifest](eligibility-snapshot.json). We make no claim that the more general elementary sieve consequence above is previously unknown.

The original target concerns the *smallest* preimage of every chosen totient. To prove it through full-fiber replication, one still needs a sequence of exact replications whose selected-prime reciprocals diverge. Fixed-seed density-one replication theorems do not give such a moving-seed sequence. The proposition rules out bounded reuse of prime markers; it neither proves that every possible replication scheme has bounded reuse nor rules out schemes based on overlapping valuation data. It also does not address constructions unrelated to replication. No full positive or negative answer to Erdős 51 follows.
