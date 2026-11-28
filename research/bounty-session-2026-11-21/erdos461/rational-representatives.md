# Exponentially large starting residues with a rational representative

For fixed $`A\ge2`$ and $`0<\varepsilon<1`$, consider integers
$`0\le a\le t^A`$ and $`1\le b\le t^{1-\varepsilon}`$ with $`\gcd(a,b)=1`$.
Write $`e_p=\lceil\log_p t\rceil`$ for primes below $`t`$. Given any starting point $`n\ge0`$, define
```math
D_t(n;a,b)=\sum_{\substack{p\lt t,\ p\nmid b\\j=v_p(bn-a)\lt e_p}}p^{-j-1},
\qquad v_p(0)=\infty .
```

**Theorem.** There are positive constants $`c,\rho`$ depending only on $`A,\varepsilon`$ such that
$`D_t(n;a,b)\le\rho`$ implies $`f(n,t)\ge ct`$. Here $`f`$ counts the distinct components supported on primes below $`t`$ in $`n+1,\ldots,n+t`$. In particular, the bound applies when $`bn\equiv a\pmod{p^{e_p}}`$ for every $`p<t`$ not dividing $`b`$. The residues at primes dividing $`b`$ are arbitrary.

For example, take $`a=1,b=2`$ and impose the exact congruences at every odd prime below $`t`$. Then $`2n-1`$ is a multiple of their prime-power product, so even the *least nonnegative* such $`n`$ grows at least exponentially in $`t`$, by the prime number theorem. The same lower bound holds for the distance from any multiple of the full period (apply the congruence to the signed difference). This family lies outside the polynomial starting range even after translation by a period.

## Large components on the auxiliary progression

Put $`m_i=a+bi`$, $`1\le i\le t`$, and let $`s_i`$ be the component of $`m_i`$ supported on primes below $`t`$. We show that at least $`\sigma t`$ indices have $`s_i\ge\kappa t`$, with $`\sigma,\kappa>0`$ uniform in both $`a`$ and $`b`$.

Each prime power $`p^j`$ coprime to $`b`$ divides at least $`\lfloor t/p^j\rfloor`$ terms. Removing the primes of $`b`$ from the factorial estimate gives
```math
\sum_i\log s_i\ge \log((t-1)!)-t\sum_{p\mid b}\frac{\log p}{p-1}
                 \ge t\log t-O(t\log\log(3t)).
```
For the last inequality use Mertens' estimate on primes up to $`\log t`$. The remainder of the prime sum is at most $`\log b/(\log t-1)`$ for $`t`$ large.

First suppose $`a\le t^{2-\varepsilon/2}`$. Then $`m_i\le2t^{2-\varepsilon/2}`$. When $`m_i`$ has a prime divisor at least $`t`$, we have $`s_i\le 2t^{1-\varepsilon/2}`$. Comparing with the logarithmic lower bound forces at least $`(\varepsilon/2-o(1))t`$ fully smooth terms. At most $`\varepsilon t/8`$ terms are smaller than $`\varepsilon t/8`$, since the progression consists of distinct positive integers. We may use $`\kappa=\varepsilon/8`$.

Now take $`a>t^{2-\varepsilon/2}`$. We bound the number of indices with $`t^{1-\eta}\le s_i\le t`$, for a small $`\eta\le\varepsilon/4`$ to be chosen. Let $`I`$ be the union of the dyadic blocks $`[S,2S)`$ meeting this band, where $`S`$ ranges over powers of two. For $`(\ell,b)=1`$, count pairs with $`s\in I`$, $`a<sr\le a+bt`$, $`sr\equiv a\pmod b`$ and $`\ell\mid r`$. Since $`(a,b)=1`$, all these $`s,r`$ are coprime to $`b`$. On writing $`r=\ell k`$, the congruence prescribes $`k\equiv c_u=a(\ell u)^{-1}\pmod b`$ for $`s\equiv u\pmod b`$. For $`b=1`$ take $`c_u=0`$. Thus the count is the sum over coprime $`s\in I`$ of the differences at $`x=a+bt,a`$ of
```math
\left\lfloor \frac{x}{\ell b s}-\frac{c_u}{b}\right\rfloor .
```
With $`\theta=\varepsilon/8`$ there is $`\beta=\beta(A,\varepsilon)>0`$ independent of $`\eta`$ such that, uniformly for $`\ell\le t^\theta`$ coprime to $`b`$, the count equals
```math
N_\ell=\frac{t}{\ell}\sum_{s\in I,\ (s,b)=1}\frac1s+O_{A,\varepsilon}(t^{1-\beta}).
\tag{1}
```

To see this, write $`s=u+bj`$ on a block and put $`Y=S/b\gg t^{3\varepsilon/4}`$. For $`1\le h\le t^\theta`$, the phase is $`hx/(\ell b(u+bj))-hc_u/b`$. On the block its even $`k`$th derivative lies between $`\lambda`$ and $`2^{k+1}\lambda`$, where
```math
\lambda=\frac{k!hx b^{k-1}}{\ell(2S)^{k+1}},\qquad
\lambda Y^k\asymp_k\frac{hx}{\ell bS}.
```
The right-hand side is $`\gg_k t^{3\varepsilon/8}`$, since $`bS\le t^{2-\varepsilon}`$, and is $`O_k(t^{A+1})`$. Choose an even $`k\ge4`$ with $`3k\varepsilon/4>A+3`$. Then $`\lambda\ll_k t^{-1}`$. The fixed-order derivative estimate of [Arias de Reyna](https://arxiv.org/html/2407.02094v1) gives a normalized power saving in $`t`$: its terms are bounded by constant multiples of $`Y^{-2/2^k}`$, $`\lambda^{1/(2^k-2)}`$ and $`(\lambda Y^k)^{-2/2^k}`$. Rounding the endpoints costs $`O(1)`$ per residue, absorbed by decreasing the saving since $`Y\gg t^{3\varepsilon/4}`$. Erdős–Turán with $`\lfloor t^\theta\rfloor`$ frequencies now estimates the mean fractional part by $`1/2+O_{A,\varepsilon}(t^{-\beta})`$ on each residue and block. Subtract the endpoint estimates at the same indices. Their lengths sum to $`O(t)`$ across the classes and blocks, giving (1).

Use the [quadratic upper sieve](polynomial-height.md#sieving-the-cofactor) with $`z=\lfloor t^\alpha\rfloor`$, $`0<\alpha<\min(\theta/2,\beta/8)`$, restricting the indices of the weights to integers coprime to $`b`$. Möbius inversion on divisors preserves this restriction. Its main quadratic form is $`1/G_b(z)`$, with
```math
G_b(z)=\sum_{q\le z,(q,b)=1}\frac{\mu^2(q)}{\varphi(q)}
\ge\frac{\varphi(b)}b G_1(z)\gg\frac{\varphi(b)}b\log z .
```
Indeed, decompose each squarefree $`q`$ in $`G_1`$ into its factors supported on $`b`$ and its coprime part, then remove the cutoff on the former. Its full weight sums to $`b/\varphi(b)`$. Also, for $`I=[U,V)`$,
```math
\sum_{s\in I,(s,b)=1}1/s
=\frac{\varphi(b)}b\big(\log(V/U)+O(b/U)\big)
\le\frac{\varphi(b)}b\big(\eta\log t+O(1)\big).
```
This follows by partial summation, as the count of coprime integers up to any real endpoint differs from its mean by at most $`\varphi(b)`$. Here $`U\ge t^{1-\eta}/2`$. Summing (1) against the weights, whose magnitudes are at most their indices, bounds the number of rough cofactors by
```math
O\!\left(\frac{\eta\log t+O(1)}{\alpha\log t}\,t\right)
+O_{A,\varepsilon}(z^4 t^{1-\beta}).
```
Each index in the band supplies such a pair. The coprime factors cancel, so the constant in the first term is absolute. Choose $`\eta>0`$ sufficiently small after $`\alpha`$ is fixed. At most $`t/4`$ indices then lie in the band for $`t`$ sufficiently large.

Write $`V_+`$ for the number with $`s_i>t`$. If $`V_+<t/4`$, at least $`t/2`$ have $`s_i<t^{1-\eta}`$. All $`s_i\le 2t^A`$. The logarithmic lower bound implies $`V_+\ge (\eta/(2A)-o(1))t`$. Together with the first case this proves the progression assertion for sufficiently large $`t`$.

## Transfer to the starting residue

For $`p<t`$ not dividing $`b`$, put $`j=v_p(bn-a)`$. As $`b(n+i)-(a+bi)=bn-a`$, the valuations of the two terms coincide below $`\min(j,e_p)`$. If $`j\ge e_p`$ and the reference valuation is at least $`e_p`$, then the actual component is already at least $`p^{e_p}\ge t`$. If $`j<e_p`$, a loss of valuation from the reference is possible only on indices with $`p^{j+1}\mid a+bi`$. Such indices form a single residue class modulo $`p^{j+1}`$ and number at most $`t/p^{j+1}+1`$. Primes of $`b`$ never divide the reference term. Consequently, outside at most $`tD_t(n;a,b)+\pi(t)`$ indices, the actual smooth component is at least $`\min(s_i,t)`$.

Take $`\rho=\sigma/4`$. At large $`t`$, this leaves at least $`\sigma t/2`$ indices with actual component at least $`\kappa t`$. A repeated value $`s`$ divides the difference of any two of its positions, so it occurs at most $`1+1/\kappa`$ times there. The desired range bound follows. Reducing $`c`$ uses $`f(n,t)\ge1`$ to handle the finitely many smaller positive $`t`$.

The [checker](check_rational_representatives.py) tests the progression floor counts, coprime sieve normalization and prime-power transfer. The unrestricted prize still asks for all starting residues. No argument above guarantees an approximant of small $`D_t`$ for a given $`n`$. [Erdős problem 461](https://conjectures.io/problems/erdos461-erdos-461)
