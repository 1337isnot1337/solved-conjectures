# Erdős 470: the prime-selection gap in a divisor construction

21 November 2026. This is an exact reconstruction and a stopped full-target attempt. The divisor-gap method is prior work of Melfi and Amato–Hasler–Melfi–Parton; no priority claim is made for its specialization below. The infinitude of primitive weird numbers is not proved.

## 1. Exact two-prime criterion

Let $`k\geq1`$, put $`M=2^{k+1}-1`$, and let $`M\lt p\lt q`$ be odd primes. Set

```math
n=2^kpq,
\qquad
A=\sigma(n)-2n=M(p+q+1)-pq.
```

Assume $`A>0`$ and $`q-p\leq M+1`$. Then $`n`$ is primitive weird if and only if there is an integer $`0\leq h\lt M`$ such that

```math
hq+M\lt A<(h+1)p. \tag{1}
```

The sufficient direction of (1) is precisely the two-prime specialization of [Amato–Hasler–Melfi–Parton, Theorem 3.1](https://www.sci.unich.it/~amato/papers/matparma16.pdf). The close-prime hypothesis here also makes the interval description exhaustive, so the converse is included for diagnosing the remaining arithmetic task.

### Proof

Write $`p=M+d`$ and $`q=M+e`$, where $`d,e\geq2`$. Direct calculation gives

```math
pq-A=2pq-M(p+q+1)=M(d+e-1)+2de>0.
```

Also,

```math
A=Mp+M-q(p-M)\lt Mp,
```

because $`q(p-M)>M`$. In particular $`0\lt A\lt pq`$.

For an abundant integer, a subset of proper divisors sums to $`n`$ if and only if the complementary subset sums to $`A=\sigma(n)-2n`$. As $`A\lt pq`$, no divisor divisible by $`pq`$ can occur in such a sum for $`A`$. Its possible summands are therefore

```math
2^j,\quad 2^jp,\quad 2^jq
\qquad(0\leq j\leq k).
```

The powers of two have all subset sums from zero through $`M`$. Thus representability is equivalent to

```math
A=u+vp+wq,
\qquad 0\leq u,v,w\leq M,
```

with integer coefficients. If $`h=v+w`$, then $`A\geq hp`$, so $`A\lt Mp`$ forces $`h\lt M`$. For a fixed $`0\leq h\leq M`$, the possible sums with $`v+w=h`$ are

```math
\bigcup_{w=0}^{h}
\bigl([hp+w(q-p),\ hp+w(q-p)+M]\cap\mathbb Z\bigr).
```

Since $`q-p\leq M+1`$, these integer intervals overlap or are adjacent. Their union is every integer in $`[hp,hq+M]`$. The only gaps below $`Mp`$ are consequently the strict gaps in (1). This proves the weirdness equivalence, including the strict endpoint conventions.

Primitivity also follows under the stated hypotheses. The maximal proper divisors obtained by deleting one prime factor have abundances

```math
\sigma(n/p)-2(n/p)=M-q<0,
\qquad
\sigma(n/q)-2(n/q)=M-p<0,
```

and

```math
\sigma(n/2)-2(n/2)
=\frac{A-(p+1)(q+1)}2<0.
```

Every proper divisor of $`n`$ divides one of these three integers. The abundancy ratio $`\sigma(d)/d`$ is nondecreasing under divisibility, so every proper divisor is deficient. A weird $`n`$ satisfying the hypotheses is therefore primitive weird.

### The exact prime strip

For fixed $`M,p,h`$, inequality (1) is equivalent to

```math
\frac{M+(M-h-1)p}{p-M}
\lt q<
\frac{Mp}{p-M+h}. \tag{2}
```

This is a joint prime-selection condition. A theorem that supplies a prime near a prescribed number separately for each of two intervals does not automatically place both primes in (2). In particular, replacing Melfi's prime-gap hypothesis by a weaker exponent requires a new argument controlling (2), not just the existence of two nearby primes.

## 2. A balanced-prime sufficient condition

The following is a conditional construction, not an infinitude theorem. It does not weaken Melfi's hypothesis: it trades the asymmetric square-root windows for a different, unproved prime-pair condition.

Set $`N=2^{k+2}=2(M+1)`$. Suppose an odd positive integer $`t`$ makes both

```math
p=N-t,\qquad q=N+t
```

prime. Their abundance is

```math
A=t^2-1-\frac32N. \tag{3}
```

Write $`t^2/N=r+f`$, where $`r`$ is an integer and $`0\leq f<1`$, and put $`h=r-2`$. Then the two gaps in (1) become exactly

```math
A-(hq+M)=fN-ht,
```

```math
(h+1)p-A=\left(\frac12-f\right)N-(h+1)t+1. \tag{4}
```

Fix constants $`1/2<\theta<2/3`$ and $`0<\delta<1/4`$. If, for infinitely many dyadic $`N`$, there is an odd $`t`$ satisfying

```math
N^\theta\leq t\leq 2N^\theta,
\qquad
\delta\leq\left\{\frac{t^2}{N}\right\}
\leq\frac12-\delta,
\qquad
N-t\text{ and }N+t\text{ are prime}, \tag{5}
```

then there are infinitely many primitive weird numbers.

Indeed, for all sufficiently large $`N`$, the first condition gives $`h\geq0`$, $`p>M`$, $`q-p=2t\leq M+1`$, and

```math
\frac{(h+1)t}{N}
\leq\frac{t^3}{N^2}
\leq8N^{3\theta-2}\longrightarrow0.
```

Both expressions in (4) are then strictly positive. Equation (1) proves primitive weirdness. Different $`k`$ give different 2-adic valuations, hence different constructed integers.

The unproved content is (5). It includes a representation of each selected $`2N`$ as a sum of two primes with specified proximity and phase. None of the checked primary primitive-weird-number papers establishes (5). Prime-gap bounds for one prime at a time and results about unrestricted prime pairs do not furnish this dyadic, balanced, phase-restricted pair.

No claim is made here that a standard binary Goldbach theorem supplies (5), or that failure to find such a theorem proves (5) inaccessible. The calculation identifies the exact missing assertion.

## 3. Why fixing the sum of three nearby primes is insufficient for this route

An attempted escape from the two-prime condition is to use three primes and a ternary prime-sum theorem. The following exact expansion records the extra data the divisor criterion would still require.

Let $`B=2^{k+1}`$ and write

```math
p_1=3B+a,\qquad p_2=3B+b,\qquad p_3=3B+c,
```

with $`S=a+b+c`$, $`T=ab+ac+bc`$, and $`U=abc`$. For $`w=2^kp_1p_2p_3`$,

```math
\sigma(w)-2w
=(-3S-18)B^2+(-2T-5S-8)B-U-T-S-1. \tag{6}
```

This follows by expanding $`(B-1)\prod_i(p_i+1)-B\prod_i p_i`$.

Let $`D=p_3-p_1>0`$, after ordering the three primes. The gap condition from the 2016 theorem requires, for some nonnegative integer $`h`$,

```math
hp_3+(B-1)<\sigma(w)-2w<(h+1)p_1.
```

In particular it requires

```math
hD\lt p_1-(B-1),
\qquad
0<\sigma(w)-2w
<\left(\frac{p_1-(B-1)}D+1\right)p_1. \tag{7}
```

When the primes are $`3B+o(B)`$, the upper bound has order $`B^2/D+B`$. Prescribing their sum fixes only $`S`$ in (6); the second and third elementary symmetric functions remain. The variance term cannot be omitted because

```math
T=\frac{S^2-(a^2+b^2+c^2)}2.
```

For example, with bounded $`S`$ and offsets of spread $`D`$ satisfying $`\sqrt B=o(D)`$ and $`D=o(B)`$, the positive term $`-2TB`$ has order at least $`BD^2`$, while the other potentially cancelling terms have smaller order. This exceeds the upper bound (7). To check the estimate, bounded $`S`$ gives $`|a|,|b|,|c|=O(D)`$ and $`a^2+b^2+c^2\geq D^2/2`$; the other terms in (6) are $`O(B^2+D^3+BD+D^2)`$. Thus this broad permitted range cannot itself certify (7).

This example is a comparison of sufficient hypotheses, not a counterexample to a prime-distribution theorem. A theorem guaranteeing only a prescribed sum and an upper bound on prime separation does not, without more work, force the additional small-abundance condition (7). No full three-prime construction was obtained.

## 4. Status

The original sources already provide the divisor-gap mechanism. The work above makes its joint arithmetic requirement explicit, including a balanced-prime reformulation and the failed direct ternary substitution. It does not establish infinitely many qualifying prime selections, does not refute primitive infinitude, and does not earn the listed bounty. No finite-case search or Lean completion is presented.
