# Independent review of the Erdős 470 prime-selection attempt

21 November 2026. Reviewed files:

- [Target and prior-work audit](target-and-prior-audit.md), SHA256 `889061414b383f9980daecc6d018875b31c733f1643ad7dcf24d160c84d4b4a4`.
- [Prime-selection gap](prime-selection-gap.md), SHA256 `9965afedee0437ac82a3d5baefdbbc785c9fc5faf76af4caf25f600288d21828`.

The exact divisor criterion and the two conditional calculations pass this written review. They do not establish primitive-weird-number infinitude. No Lean verification, submission, acceptance, or additional bounty completion is reported.

## Prior mechanism and target

I read Theorem 3.1 and its proof in the [author-hosted Amato–Hasler–Melfi–Parton paper](https://www.sci.unich.it/~amato/papers/matparma16.pdf). Its deficient-seed construction uses precisely the gaps between the largest possible sum of at most a given number of prime-weighted divisors and the smallest possible sum using one more. The companion note correctly attributes this sufficient mechanism to prior work. Its close-prime hypothesis is an additional assumption making the two-prime interval union exhaustive; it is not attributed to a new infinitude theorem.

The selected target is the full infinitude of primitive weird numbers. The campaign's direct-payment audit identifies the board's shared problem-470 award and distinguishes it from the historical odd-weird-number offer. I did not independently re-audit the board's payment operator in this mathematical review. No conclusion here depends on treating a conditional theorem or a list of examples as a solution.

## Exact two-prime criterion

With $`M=2^{k+1}-1`$ and primes $`M\lt p\lt q`$, I recomputed

```math
A=\sigma(2^kpq)-2^{k+1}pq=M(p+q+1)-pq.
```

The inequalities $`A\lt pq`$ and $`A\lt Mp`$ follow from the displayed positive expressions in the note. Taking the complement among all proper divisors exchanges a sum equal to the number with a sum equal to its abundance. Since $`A\lt pq`$, no divisor containing both odd primes can occur in the latter sum. The three independent binary digit groups give exactly $`u+vp+wq`$ with coefficients between zero and $`M`$.

For a fixed $`h=v+w\lt M`$, consecutive intervals of possible sums have starting points separated by $`q-p`$ and contain $`M+1`$ integers. The hypothesis $`q-p\le M+1`$ therefore gives every integer from $`hp`$ through $`hq+M`$. The intervals have increasing starts and ends. Their complement below $`Mp`$ consists exactly of the strict gaps

```math
hq+M\lt A<(h+1)p.
```

The strict endpoints are correct: either endpoint is a representable divisor sum. Solving these two inequalities for $`q`$ gives the two stated rational bounds, with positive denominators because $`p>M`$ and $`h\ge0`$.

Deleting either odd prime gives deficiency $`M-q`$ or $`M-p`$. Deleting one factor of two gives abundance $`[A-(p+1)(q+1)]/2<0`$. Every proper divisor divides one of those maximal proper divisors, and the abundancy ratio is nondecreasing under divisibility. Thus all proper divisors are deficient. This verifies the claimed primitivity, rather than merely weirdness.

## Balanced-prime calculation

For $`N=2(M+1)`$, $`p=N-t`$, and $`q=N+t`$, direct substitution gives $`A=t^2-1-3N/2`$. Writing $`t^2/N=r+f`$ and taking $`h=r-2`$ gives exactly

```math
A-hq-M=fN-ht,
\qquad
(h+1)p-A=(1/2-f)N-(h+1)t+1.
```

If $`t\asymp N^\theta`$ with $`1/2<\theta<2/3`$, then $`h\ge0`$ eventually, $`p>M`$, and $`2t\le M+1`$. The error terms divided by $`N`$ are bounded by a constant times $`N^{3\theta-2}`$, which tends to zero. Keeping $`f`$ a fixed positive distance from zero and one half therefore proves both strict inequalities. Distinct dyadic scales have distinct 2-adic valuations in the resulting integers.

The simultaneous primality and fractional-part hypotheses are not proved. Neither the algebra nor an individual prime-gap assertion supplies them. The note labels the implication conditional and does not claim that it weakens the older conditional prime-gap result.

## Three-prime comparison

Expanding $`(B-1)\prod_i(p_i+1)-B\prod_i p_i`$ with $`p_i=3B+a_i`$ reproduces every coefficient of equation (6). The necessary gap estimate follows from $`h(p_3-p_1)\lt p_1-(B-1)`$ and the upper bound $`A<(h+1)p_1`$.

For bounded $`S=a+b+c`$ and spread $`D`$, the offsets are $`O(D)`$ and their squared sum is at least $`D^2/2`$. Therefore the contribution $`-2TB`$ is at least a positive constant times $`BD^2`$ once $`D`$ grows. Under $`\sqrt B=o(D)`$ and $`D=o(B)`$, the other displayed terms are smaller. The permissible gap size is only $`O(B^2/D+B)`$. The proposed sum-only substitution consequently does not imply the divisor criterion in that regime.

This is a failure of a sufficient-condition argument. It does not exclude all three-prime constructions or contradict a theorem about primes with prescribed sum. The unrestricted prime-selection problem remains unresolved.
