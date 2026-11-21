# A polynomial-time proper learner with a bounded number of fair coins

The proper agnostic threshold guarantee can be attained with $`O(n\log(n+1))`$ independent fair bits in the worst case. The learner uses $`O(n\log(n+1))`$ comparisons of real features, integer arithmetic on $`O(\log(n+1))`$-bit numbers, and at most one addition of one to a feature for its answer. With binary-encoded rational features this is polynomial bit time in the input length. This addresses the authors’ efficiency provision for the same threshold prize. The authors decide bonus eligibility. [Original offer, Section 3](https://proceedings.mlr.press/v125/steinke20b/steinke20b.pdf) · [Reference implementation for rational features](efficient.py)

### A rational branch rule

Keep the construction and notation of the [all-size proof](PROOF.md). At depth $`j`$ set $`b_j=128\sqrt n\,2^{-j/4}`$ and $`s_j=\lceil b_j\rceil`$. Compute this last positive integer by comparing fourth powers against $`128^4n^2/2^j`$. If the two child minima differ by $`\Delta\ge0`$, take the worse child with probability

```math
 \frac{s_j}{2(s_j+\Delta)}.
```

At a tie choose either with probability one half. First analyze an ideal learner using this rational rule exactly and keeping the continuous tags and uniform cyclic shift of the all-size proof.

The expected increase in empirical loss at a node is at most $`s_j/2`$. Every internal depth satisfies $`2^j<2(n+1)\le4n`$. Thus $`b_j>1`$ and $`s_j/2\le b_j`$. The original telescoping loss bound (6) and tag-rounding estimate (23) follow with the same constants.

For either specified child, the logarithm of its choice probability is 1-Lipschitz in the signed normalized gap $`(m_0-m_1)/s_j`$. On the worse side the log derivative has absolute value $`1/(1+x)`$ for $`x=\Delta/s_j\ge0`$. On the better side it has absolute value $`1/((1+2x)(1+x))`$. The formulas agree at zero. On aligned active nodes the two signed gaps therefore change the log probability by at most $`8/s_j\le8/b_j`$. On inactive nodes the probabilities coincide. These are precisely the branch-rule inputs in (7)–(12) of the all-size proof. The shift, missing-support calculation, tags and properization are unchanged in this ideal learner. It therefore has original iid-pool CMI below 21 nats and expected samplewise empirical excess at most $`2056/\sqrt n`$.

### Finite coins

Let $`b=8+6\lceil\log_2(n+1)\rceil`$ and $`K=2^b`$. Use fresh uniform integers from $`0`$ through $`K-1`$ for all draws. Assign one such tag per observation, returning the fixed threshold zero on a tie of both feature and tag. For tag rounding, use the closed threshold if its tag is below $`K/2`$. Given a draw $`J`$, take the shift $`\lfloor 2(n+1)J/K\rfloor`$; at a branch with prescribed left probability $`p`$, take the left child if $`J/K\lt p`$. This last comparison is exact by integer cross multiplication.

Couple each draw with an independent ideal uniform $`U`$ by $`J=\lfloor KU\rfloor`$. On any fixed sample the ideal and finite outputs can differ only if two tags share a bucket, the shift straddles a rounding boundary, or a visited branch straddles its probability boundary. The tag half decision agrees almost surely. At each branch on the shared path the next uniform is independent of the past. Hence, with $`M=2(n+1)`$,

```math
 \Pr(\text{disagreement})
 \le\delta_n=\frac{\binom n2+M+\lceil\log_2M\rceil}{K}
 \le \frac1{64(n+1)^4}.
```

This bound is uniform over all fixed labeled samples. In the paired-pool experiment let $`O,O'`$ denote the ideal and finite proper parameters, $`T`$ the full pool, $`S`$ the selector and $`E=1[O\ne O']`$. By the information chain rule,

```math
 I(O';S\mid T)
 \le I(O;S\mid T)+\log 2+\Pr(E=1)n\log 2 .
```

Indeed one may reveal $`O,E`$ in addition to $`O'`$. The event bit costs at most $`\log2`$. On agreement $`O'`$ is determined by $`O`$; on disagreement the selector has at most $`n`$ bits. The finite learner thus has CMI below 23 nats. Its expected normalized empirical loss differs from the ideal learner’s by at most $`\delta_n`$, giving excess at most $`2057/\sqrt n`$ on every fixed sample. The single constant 4096 still satisfies the two sponsor inequalities, in nats or bits.

### Implementation costs

Sorting the tagged sample determines every loss in a single subsequent pass. The two child minima can be computed by scanning their intervals. Following one path takes $`O(n)`$ scanned entries because each split at least halves the interval up to rounding. Forming and shifting the folded list, then finding the successor feature if needed, also takes $`O(n)`$ entries. All scales, branch probabilities, tags and ranks have $`O(\log(n+1))`$ bits. There are $`n+1+\lceil\log_2(2(n+1))\rceil`$ draws at most, each with exactly $`b`$ bits. No rejection loop or transcendental-function oracle is required.
