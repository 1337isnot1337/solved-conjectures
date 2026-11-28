# Two-center reflection for Erdős’s smooth-component problem

Let $`s_t(m)`$ be the component on primes $`p<t`$. As in [Erdős 461](https://www.erdosproblems.com/461), $`f(n,t)`$ counts its distinct values for $`n<m\le n+t`$. The following deterministic bound allows the large primes to split between two centers, in any proportions.

**Theorem.** Fix $`0<\lambda\le1`$. There are $`c,\delta>0`$ such that the following implies $`f(n,t)\ge ct`$ for all sufficiently large $`t`$. Take $`r,s\in\{1,\ldots,t\}`$ with
```math
J=\{i:1\le i\le t,\ 1\le r+s-i\le t\},\qquad |J|\ge\lambda t.
```
Require only
```math
\sum_{\substack{t^\delta\lt p\lt t\\p\nmid(n+r)(n+s)}}\frac1p\le \frac1{256}.
```
In particular, for centers symmetric about the midpoint of the interval, $`J`$ is the entire interval. The starting residue at every small prime is free.

## Small parts of products of translates

Fix $`k\ge1`$. Compare two lists of $`k`$ integer affine functions of $`i`$, all with slopes $`\pm1`$. Denote them by $`L_j`$ and $`R_j`$. There exist constants $`K,\delta>0`$, depending only on $`k,\lambda`$, such that on every integer interval $`J`$ of length at least $`\lambda t`$ and at most $`t`$, a proportion at least $`1/(8\max(3,k^2))`$ satisfies
```math
\prod_j a_y(|L_j(i)|)\ge K^{-1}\prod_j a_y(|R_j(i)|),
\qquad y=t^\delta,
```
where $`a_y`$ retains primes up to and including $`y`$. Omit zeros of any form. All constants are uniform in the intercepts, even when roots coincide modulo some primes.

To prove this, initially work on primes $`B<p\le y`$ and keep only squarefree contributions. In the independent residue model, let $`Y_p`$ count the number of vanishing left forms minus the number of vanishing right forms at a uniform residue. Its mean is zero since every form has one root modulo $`p`$. Condition on which primes have $`Y_p\ne0`$. On these primes the variables remain independent and centered, and $`1\le |Y_p|\le k`$. Consequently $`\mathbb E Y_p^4\le k^2(\mathbb E Y_p^2)^2`$. For $`S=\sum Y_p\log p`$, expanding the fourth moment using independence gives
```math
\mathbb E S^4\le H(\mathbb E S^2)^2,\qquad H=\max(3,k^2).
```
If the variance is nonzero, Hölder interpolation gives $`\mathbb E|S|\ge(\mathbb E S^2)^{3/2}/\sqrt{\mathbb E S^4}`$. Centering gives $`\mathbb E S_+=\mathbb E|S|/2`$. Applying Cauchy–Schwarz to $`S_+`$ now gives $`\Pr(S\ge0)\ge1/(4H)`$. At zero variance the probability is one. Averaging over the active primes preserves the bound.

The block sieve in the [one-center proof](aligned-large-primes.md) transfers this event on the recorded residues to a uniform integer in $`J`$ with arbitrarily small additive loss. Here use at most $`2k`$ forbidden residues per prime, and take $`B>4k`$. For clarity, the only changes in the estimates are that the model expected log of the product of hit primes is at most $`2k\sum_{p\le y}\log(p)/p`$, and the counting error is bounded by $`(J_0+1)\sum_{d\le D}(2k)^{\omega(d)}`$ for $`J_0`$ blocks. This latter sum without the prefactor is at most $`D(1+\log D)^{2k-1}`$: assign the distinct prime powers of $`d`$ to $`2k`$ ordered factors, and bound the count of all tuples with product at most $`D`$ by summing the last factor first. The block products remain uniformly bounded below. The progression length is now $`\gg_\lambda t^{3/4}`$ after fixing a pattern with hit product at most $`t^{1/4}`$. Thus the same proof with $`D\le t^{1/4}`$ applies for a sufficiently small fixed $`\delta`$.

Square factors on the right for $`B<p\le y`$ cost proportion at most $`k\sum_{p>B}p^{-2}+O_k(y/|J|)`$. Take $`B`$ large enough to make this loss small. For $`p\le B`$, discard sites where $`p^h`$ divides any right form. The cost is at most $`k\sum_{p\le B}p^{-h}+O_k(B/|J|)`$, small for a sufficiently large fixed $`h`$. On remaining sites the contribution of these primes on the right is at most $`K=(\prod_{p\le B}p)^{hk}`$, and the left contribution is at least one. Excluding the finitely many zeros costs $`O_k(1/|J|)`$. Take all losses together below $`1/(8H)`$. This proves the comparison.

## Reflecting large-prime incidences

Apply the comparison with two forms on each side,
```math
n+i,\quad n+r+s-i\qquad\text{and}\qquad i-r,\quad i-s .
```
At least $`|J|/32`$ sites satisfy its conclusion. If $`n\equiv-r\bmod p`$ then the left residues are $`i-r,s-i`$. If $`n\equiv-s\bmod p`$ they are $`i-s,r-i`$. In both cases the counts of vanishing factors on the two sides agree, including when both right factors vanish.

Discard sites with $`|i-r|<\lambda t/2048`$ or $`|i-s|<\lambda t/2048`$. The loss is at most $`|J|/512+O(1)`$. The sites at which an unaligned large prime divides either right factor cost at most $`2|J|/256+2\pi(t)`$. Finally, a square of a prime above $`y`$ dividing a nonzero right factor costs at most $`2|J|\sum_{p>y}1/p^2+O(\sqrt t)=o(|J|)`$. A positive proportion of $`J`$ survives.

Both absolute right factors are strictly less than $`t`$. After these exclusions, all their prime factors above $`y`$ occur with sufficient multiplicity in the product on the left. The small-part comparison therefore gives
```math
 s_t(n+i)s_t(n+r+s-i)\ge K^{-1}|i-r|\,|i-s|\gg_\lambda t^2 .
```
At least one site in each such pair has component $`\gg_\lambda t`$. Reflection is a bijection of $`J`$, so there are $`\gg_\lambda t`$ distinct sites with that property. Each component of this size occurs only $`O_\lambda(1)`$ times, by divisibility of differences. This proves the theorem.

The [finite checker](check_two_centers.py) verifies 2,879 conditional distributions with integer weights and 3,448 reflected large-prime incidences, including colliding roots. The general theorem follows from the proof above. An arbitrary offset can lack an aligned pair. The [sponsor’s universal question](https://conjectures.io/problems/erdos461-erdos-461) remains open.
