# A deterministic linear bound from alignment at the large primes

In [Erdős problem 461](https://www.erdosproblems.com/461), write $`s_t(m)`$ for the part of $`m`$ supported on primes strictly below $`t`$. Let $`f(n,t)`$ count its distinct values for $`n<m\le n+t`$.

**Theorem.** For each $`0<\kappa<1/2`$ there are $`\delta,c>0`$ with the following property for all sufficiently large $`t`$. Suppose some integer $`1\le r\le t`$ satisfies
```math
 \sum_{\substack{t^\delta<p<t\\p\nmid n+r}}\frac1p\le\frac12-\kappa.
```
Then $`f(n,t)\ge ct`$. Every small-prime residue of $`n`$ is unrestricted, and only agreement modulo the prime itself is needed at an aligned large prime. The hypothesis allows arbitrary size for $`n`$. Consequently any sequence violating the conjectured linear bound must eventually fail this condition at every center $`r`$, for each such fixed $`\kappa`$ and its corresponding $`\delta`$.

## Comparing the small parts of two translates

For $`y\ge2`$ let $`a_y`$ denote the component on primes $`p\le y`$. We need the following uniform estimate for $`i`$ chosen uniformly in any interval of $`t`$ consecutive integers. For any $`\xi>0`$ one can choose a fixed $`\delta>0`$ so that for $`y=t^\delta`$ and arbitrary integer shifts $`u,v`$,
```math
\Pr\big(a_y(|i+u|)\ge a_y(|i+v|),\ (i+u)(i+v)\ne0\big)
\ \ge\ 1/2-\xi
```
for all sufficiently large $`t`$. We give the sieve argument to make its uniformity in both shifts explicit. The independent prime-coordinate model is classical in sieve theory. [Ford’s sieve notes](https://ford126.web.illinois.edu/sieve2023.pdf)

First treat primes up to a fixed $`B`$ by taking $`i`$ modulo $`M=\prod_{p\le B}p^h`$ and capping their valuations at $`h`$. For $`B<p\le y`$, record which of the distinct residues $`-u,-v\bmod p`$ is hit, or that neither is hit. These are at most two residues per prime. The recorded data determine the two products with capped small-prime valuations and squarefree contributions above $`B`$. The probability that these differ from the true products, excluding the at most two zeros, is bounded by
```math
2\sum_{p\le B}p^{-h}+2\sum_{p>B}p^{-2}+O\big((\pi(y)+B+1)/t\big).
```
This follows by counting one progression per prime, power and shift, using the threshold $`p^h`$ for small primes and $`p^2`$ for the rest. Choose $`B`$ and then $`h`$ to make this as small as needed.

In the comparison model pick the residue modulo $`M`$ and all residues modulo $`p`$, $`B<p\le y`$, independently uniformly. The simultaneous reflection $`i\mapsto-u-v-i`$ in each coordinate exchanges the two recorded products. Thus the model probability of the weak inequality is at least $`1/2`$. We prove that every event in the recorded data has actual probability at least its model probability minus any prescribed tolerance, by taking $`\delta`$ small enough.

Call $`W`$ the product of primes above $`B`$ at which a residue was hit. In the model $`\mathbb E\log W\le2\sum_{p\le y}\log p/p=O(1+\log y)`$, so the mass of patterns with $`W>t^{1/4}`$ is $`O(\delta)+o(1)`$. Fix one remaining pattern: the residue modulo $`M`$, the hit primes and their specific residues. This leaves an arithmetic progression with modulus $`MW`$. For every remaining prime one must avoid $`\nu_p\in\{1,2\}`$ residues. Before this exclusion the progression has $`H=t/(MW)+O(1)`$ sites. The model probability of the full pattern is $`V/(MW)`$, where $`V=\prod(1-\nu_p/p)`$ runs over the remaining primes.

Here is a uniform elementary lower sieve for that progression. Group the remaining primes in the blocks $`y^{2^{-j-1}}<p\le y^{2^{-j}}`$, stopping at $`B`$. Their number is $`J=O(1+\log\log y)`$. In each block $`\sum\nu_p/p`$ is bounded by an absolute constant $`C`$ by Mertens’ estimate, uniformly after deleting any primes. The block product $`V_j=\prod(1-\nu_p/p)`$ is bounded below by an absolute $`c_0>0`$, taking $`B\ge5`$.

If $`N_j`$ is the number of forbidden hits in a block, put $`k_j=2(K+j)`$ and $`U_j=\sum_{\ell=0}^{k_j}(-1)^\ell\binom{N_j}{\ell}`$, with blocks indexed from 0 and $`K\ge1`$. Bonferroni gives $`0\le 1[N_j=0]\le U_j`$ and $`U_j-1[N_j=0]\le\binom{N_j}{k_j}`$. Telescoping the difference of products gives the pointwise minorant
```math
\prod_j U_j-\sum_j\binom{N_j}{k_j}\prod_{\ell\ne j}U_\ell.
```
In the independent model, $`\mathbb E\binom{N_j}{k_j}\le C^{k_j}/k_j!`$. Writing $`a_j=C^{k_j}/(c_0 k_j!)`$, the expected minorant is at least $`V(1-e^{\sum a_j}\sum a_j)`$. The sum can be made arbitrarily small by choosing the fixed $`K`$ large.

Every term in the expanded minorant counts simultaneous hits at primes of a squarefree modulus $`d\le D=y^{\sum_j2^{-j}k_j}\le y^{4(K+1)}`$. For each of its at most $`2^{\omega(d)}`$ possible residues, counting inside the progression differs from $`H/d`$ by at most one. Each product in the minorant has at most one term per squarefree $`d`$. The absolute difference between the actual sum and $`H`$ times its model expectation is therefore at most
```math
(J+1)\sum_{d\le D}2^{\omega(d)}
\le (J+1)D(1+\log D),
```
using the elementary divisor-sum bound. Choose $`\delta`$ so $`D\le t^{1/4}`$. Since $`H\gg_M t^{3/4}`$ and $`V\gg(1+\log y)^{-O(1)}`$, the rounding error is $`o(HV)`$ uniformly in the pattern. Thus its actual probability is at least $`(1-\tau)V/(MW)`$ for any desired fixed $`\tau>0`$ on choosing $`K`$ and then taking $`t`$ sufficiently large. Summing over the relevant patterns, discarding the model tail of $`W`$, and allowing the clipping error proves the comparison.

## Applying the comparison

Take $`u=n`$, $`v=-r`$, and choose $`\xi=\kappa/4`$. At least $`(1/2-\xi)t`$ sites have $`a_y(n+i)\ge a_y(|i-r|)`$ with nonzero arguments. Discard sites with $`|i-r|<\kappa t/8`$, losing at most $`\kappa t/4+O(1)`$. Also discard sites where $`|i-r|`$ has any unaligned prime factor $`p>y`$, at cost at most
```math
t\sum_{\substack{y<p<t\\p\nmid n+r}}1/p+\pi(t).
```
Finally discard sites where $`p^2\mid i-r`$ for any $`p>y`$ with $`p\le\sqrt{t}`$, at cost $`O(t/y+\sqrt t)`$. The prime number theorem, or the elementary Chebyshev bound, gives $`\pi(t)=o(t)`$.

At each surviving site $`0<|i-r|<t`$. Its prime factors exceeding $`y`$ are distinct and divide $`n+i`$, since each divides $`n+r`$. Its entire smaller-prime component is bounded by that of $`n+i`$. Hence
```math
s_t(n+i)\ge |i-r|\ge\kappa t/8 .
```
At least $`(\kappa/2-o(1))t`$ sites survive. Any one smooth component of this size occurs at most $`1+8/\kappa`$ times, since it divides every difference between its sites. This proves the theorem.

The [finite checker](check_exchange.py) exhausts the CRT reflection for seven shifts modulo 2520, checks the block minorant on 729 triples of hit counts, and verifies the unique-large-component inequality from the [conditional concentration proof](conditional-concentration.md) on all 2520 small windows. These checks supplement the uniform proof. Starts with no sufficiently aligned center remain outside this deterministic bound. [Bounty statement](https://conjectures.io/problems/erdos461-erdos-461)
