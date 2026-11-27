# Erdős’s logarithmic density conjecture for delayed congruences

The [effective-denominator theorem](EFFECTIVE-DENOMINATORS.md) applies to systems that need not have small global denominator lcm and cannot be covered by finitely many affine templates even after discarding a summable reciprocal family. This example separates these sufficient conditions; it is not a counterexample to the conjecture.

Let
```math
 B(X)=\sqrt{\log\log X}\,\log\log\log X
```
for sufficiently large $X$. At stage $t$, choose a new prime $q_t$ exceeding all previously installed moduli and large enough that the reciprocal-weight cost below is at most $2^{-t}$. Install the pair
```math
 n=q_t^2,\qquad a=q_t.
```
Its denominator is $q_t$, and its contribution to the first-moment criterion is $\varphi(q_t)\log q_t/q_t^2\le\log q_t/q_t$. In particular, at $X=q_t^2$ the global least common multiple has logarithm at least $(\log X)/2$, so the earlier global-denominator criterion fails.

After installing that class, wait in the construction until a sufficiently large modulus cutoff that $B(X)$ exceeds $t^2$ times the sum of the accumulated first-moment cost, one, and
```math
 2\sum_{k\le t}\varphi(q_k)\log q_k.
```
For each $1\le k\le t$, in successive disjoint intervals above that cutoff, install a finite set of moduli $n$ divisible by $q_k$, each with $a=n/q_k$, until the newly installed reciprocal mass of that group belongs to $[1,2]$. This is possible by divergence of the reciprocal multiples of each fixed $q_k$. The intervals are chosen successively so there is never a repeated modulus. Their total first-moment cost is at most the displayed sum. Hence during these installations the cumulative first moment divided by $B(X)$ is at most $t^{-2}$. Between installations $B(X)$ only increases, and each new exceptional calibration class adds at most $2^{-t}$. The ratio therefore tends to zero. The effective-denominator theorem gives the logarithmic density conclusion.

For every $k$, infinitely many stages add reciprocal mass at least one to the group having $a=n/q_k$. Its total reciprocal mass diverges. Fix any finite list of affine templates $(b,c)$. Choose $q_k$ not dividing any of their positive $b$ values. For any template and any $n>q_k|c|$ in that group, a congruence $b(n/q_k)\equiv c\pmod n$ would give $b-jq_k=cq_k/n$ for an integer $j$. The left side is a nonzero integer, while the right side has magnitude less than one unless $c=0$, where it is zero. Thus no class in this group beyond a finite cutoff fits any prescribed template. Its divergent reciprocal mass cannot be discarded under the summable-exceptions result.

The construction makes the global lcm large at sparse stages while still allowing unbounded families that genuinely require distinct residue templates. Eligibility at a typical integer, rather than the total number of denominators listed, is the relevant restriction in this example.
