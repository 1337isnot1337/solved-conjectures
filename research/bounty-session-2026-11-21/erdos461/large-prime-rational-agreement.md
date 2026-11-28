# Rational comparison using only the larger primes

Fix $`A\ge2`$ and $`0<\varepsilon<1`$. There are positive constants $`\delta,\rho,c`$ such that the following holds for all sufficiently large $`t`$. Suppose $`0\le a\le t^A`$, $`1\le b\le t^{1-\varepsilon}`$, $`\gcd(a,b)=1`$, and
```math
\sum_{\substack{t^\delta\lt p\lt t,\ p\nmid b\\p\nmid bn-a}}\frac1p\le\rho .
\tag{1}
```
Then $`f(n,t)\ge ct`$. All the prime-power information in the [rational comparison](rational-representatives.md) can thus be dropped except for agreement modulo large primes, with the reciprocal allowance in (1). No restriction on the size of $`n`$ is needed.

Put $`m_i=a+bi`$ for $`1\le i\le t`$ and $`M=a+bt`$. Constants may depend on $`A,\varepsilon`$. We first establish some slack in the auxiliary progression for $`M\ge t^{9/8}`$.

## Components exceeding the window by a power

There are $`\gamma,\sigma>0`$ such that for $`M\ge t^{9/8}`$ at least $`\sigma t`$ of the reference components exceed $`t^{1+\gamma}`$. For $`a\le t^{2-\varepsilon/2}`$, the logarithmic mass argument in the [progression estimate](rational-representatives.md#large-components-on-the-auxiliary-progression) gives at least $`(\varepsilon/2-o(1))t`$ fully smooth terms. Remove $`i<\varepsilon t/8`$. Each remaining term satisfies $`m_i\ge(i/t)M\ge (\varepsilon/8)t^{9/8}>t^{1+1/16}`$ eventually.

For $`a>t^{2-\varepsilon/2}`$, extend the band in that proof to $`[t^{1-\eta},t^{1+\eta}]`$. Here is the dependence of the parameters needed for this extension. Start with $`0<\eta\le\varepsilon/8`$ and the same $`\theta=\varepsilon/8`$. Then
```math
S/b\gg t^{3\varepsilon/4},\qquad
\lambda(S/b)^k\asymp_k hx/(\ell bS)\gg_k t^{\varepsilon/4}
```
uniformly, since now $`S\le t^{1+\eta}`$. The previous upper bound on the derivative still holds. The derivative and discrepancy bounds yield a normalized error $`O(t^{-\beta_0})`$ per residue interval for some fixed $`\beta_0>0`$ independent of $`\eta`$. The sum of their lengths over all blocks is $`O(t^{1+\eta})`$. Restricting $`\eta\le\beta_0/2`$ gives the progression count with absolute error $`O(t^{1-\beta_0/2})`$. Choose $`\alpha<\min(\theta/2,\beta_0/16)`$ for the sieve. The harmonic factor now has $`2\eta\log t+O(1)`$ in its numerator. Choosing $`\eta>0`$ sufficiently small after $`\alpha`$, the band still contains at most $`t/4`$ indices.

If fewer than $`t/4`$ exceed the band, at least $`t/2`$ lie below it. Writing $`V`$ for the number above, the sum of the logarithms is then bounded by
```math
(t/2)(1-\eta)\log t+(t/4)(1+\eta)\log t+
(t/4)\log t + A V\log t+O(t).
```
Indeed one may start with $`t\log t`$, subtract $`\eta\log t`$ for each index below the band, add at most $`\eta\log t`$ for each index inside the band, and add at most $`A\log t+O(1)`$ for each above it. The lower bound $`t\log t-O(t\log\log(3t))`$ forces $`V\ge(\eta/(4A)-o(1))t`$. Taking the smaller constants from the two ranges proves the assertion.

For $`y=t^\delta`$, the mean logarithm of the factor of $`m_i`$ supported on primes up to $`y`$ is at most
```math
\sum_{p\le y}\frac{\log p}{p-1}+O_A(\pi(y)\log t/t)
=\delta\log t+O(1)+o(1).
```
Primes of $`b`$ contribute zero, and for every other prime power the count is at most $`t/p^j+1`$. Only powers up to $`2t^A`$ occur. By Markov's inequality, on choosing $`\delta`$ sufficiently small, fewer than $`\sigma t/4`$ indices lose more than $`(\gamma/2)\log t`$ in this logarithm.

Across the whole progression, discard indices for which $`p^2\mid m_i`$ for some $`y<p<t`$, or $`p\mid m_i`$ for a prime in (1). The number discarded is at most
```math
t\sum_{p>y}p^{-2}+t\rho+2\pi(t)=(\rho+o(1))t .
\tag{2}
```
At every remaining position all reference prime factors strictly between $`y`$ and $`t`$ occur simply and divide $`n+i`$. Choosing $`\rho<\sigma/4`$ leaves a positive proportion with actual component exceeding $`t`$. Each such component occurs only once.

## Progressions of height below the cutoff

For $`M<t^{9/8}`$, at most $`(1/8+o(1))t`$ terms have a prime factor at least $`t`$. Indeed each such term loses at least $`\log t`$ from $`\log m_i`$ when taking its reference component, while the sum of component logarithms is at least $`t\log t-O(t\log\log(3t))`$. Discard also the at most $`t/16`$ terms below $`t/16`$.

Compare the prime parts up to $`y`$ at $`n+i`$ and $`a+bi`$, omitting primes of $`b`$ on both sides. For $`\delta`$ sufficiently small, at least $`(1/2-1/16)t`$ indices have the actual part at least the reference part. To apply the [two-translate comparison](aligned-large-primes.md#comparing-the-small-parts-of-two-translates), for every $`p\le y`$ coprime to $`b`$ choose $`J_p`$ with $`p^{J_p}>2t^A`$. By the Chinese remainder theorem choose a nonnegative integer $`v`$ with $`bv\equiv a\pmod{p^{J_p}}`$ for all these primes. Then $`v+i`$ and $`a+bi`$ have exactly the same valuations at these primes because $`m_i<p^{J_p}`$. Apply the comparison to $`n+i,v+i`$, deleting primes dividing $`b`$. The reflection in the independent model still swaps both recorded products. The block-sieve proof already allows deleting arbitrary primes, with the same error bounds. In its fixed initial block one may retain the whole CRT modulus and ignore the unwanted coordinates when deciding the event. The constants therefore remain uniform in $`b`$. The proof works for every sufficiently small fixed $`\delta`$, so the choice can satisfy both height ranges.

After the preceding exclusions and (2), at least $`(1/4-\rho-o(1))t`$ positions survive. Their reference terms are fully smooth and at least $`t/16`$. Their matched large prime factors occur in the actual term. The small-prime comparison now gives $`s_t(n+i)\ge t/16`$. Each such value occurs at most 17 times. Choosing also $`\rho<1/8`$ proves the stated bound.

## How many residues admit these approximants?

Condition (1) cannot hold at every offset, even when the approximant may be chosen separately for each one. In fact, for fixed $`A,\varepsilon`$ and the sufficiently small $`\delta,\rho`$ above, under uniform $`n`$ modulo the finite period the probability that *any* permitted pair works is $`O(\exp(-c_1t^\delta))`$ for some $`c_1>0`$.

For a fixed pair the indicators of $`p\mid bn-a`$ for $`y<p<t`$, $`p\nmid b`$, are independent Bernoulli variables of mean $`1/p`$. Write $`Z`$ for the sum of their weights $`1/p`$. Since $`y/p\le1`$,
```math
\log\mathbb E e^{yZ}
\le\sum_{y\lt p\lt t}\frac{e^{y/p}-1}{p}
\ll y\sum_{m>y}m^{-2}=O(1).
```
The total available weight is $`\log(1/\delta)+o(1)`$ by Mertens' theorem. Omitting the prime divisors of $`b`$ costs at most $`\log b/(y\log y)=o(1)`$. Take $`\delta`$ small enough that $`\log(1/\delta)>2\rho`$. Thus (1) requires $`Z`$ bounded below by a fixed positive constant. Exponential Markov followed by a union bound over $`O(t^{A+1})`$ pairs gives the claim.

Most offsets already obey the desired lower bound by the [separate concentration theorem](conditional-concentration.md). A proof for every offset must still rule out the intersection of its exceptional set with the set missed by the deterministic argument here. The [sponsor's full statement](https://conjectures.io/problems/erdos461-erdos-461) remains open.
