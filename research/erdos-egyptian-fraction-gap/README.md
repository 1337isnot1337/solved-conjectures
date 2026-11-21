# Erdős’s Egyptian fraction gap conjecture

Erdős and Graham ask whether every representation of one by distinct unit fractions with denominators greater than one has two successive denominators differing by at least three. Call an integer $`M`$ excluded if no counterexample can have largest denominator $`M`$. [Original problem and references](https://www.erdosproblems.com/287) · [Solver bounty](https://conjectures.io/problems/erdos287-erdos-287)

The [logarithmic density theorem](log-density.md) proves that the excluded maxima have logarithmic density one. The argument below supplies the arithmetic obstruction and the prime pairs used in that proof.

**Partial theorem.** There is a constant $`C>1`$ such that, for every sufficiently large real $`X`$, some integer $`y\in[X,CX]`$ has the following property. Every integer $`M`$ from $`y+1`$ through $`\lfloor ey\rfloor`$ is excluded. In particular the excluded maxima have positive lower natural density. The proof is unconditional.

The large-prime obstruction below generalizes the familiar use of a prime $`p`$ and a prime $`(p+1)/2`$. The discussion of #287 records earlier finite certificates, including a reported bound of about $`3.74\cdot10^{60}`$, and a conditional analytic approach. The argument here supplies intervals at arbitrarily large scales. It leaves open whether the intervals cover every sufficiently large maximum. [Problem discussion](https://www.erdosproblems.com/forum/thread/287)

## Excluding multiples of a large prime

Fix a positive integer $`H`$ and put $`L=\mathop{\mathrm{lcm}}(1,\ldots,H)`$. Suppose $`p>HL`$ is prime and $`M\le Hp`$. No set of distinct denominators in $`[1,M]`$ with integral reciprocal sum can contain a multiple of $`p`$.

Indeed, the selected multiples would be $`pj`$ for a nonempty set $`J\subseteq[1,H]`$. Multiply the sum by $`pL`$ and reduce modulo $`p`$, interpreting fractions whose denominators are coprime to $`p`$ by modular inversion. The integral sum and every term from a nonmultiple give zero. The remaining terms give $`\sum_{j\in J}L/j`$, an integer between one and $`HL\lt p`$. This is impossible.

Suppose now that $`y=up`$ and $`y+1=vq`$, for primes $`p,q`$ and $`u,v\le K`$, where $`K`$ is fixed. Set $`H=\lceil eK\rceil`$. For sufficiently large $`y`$ both primes exceed $`H\mathop{\mathrm{lcm}}(1,\ldots,H)`$. Every $`M\le ey`$ satisfies both $`M\le Hp`$ and $`M\le Hq`$. Neither $`y`$ nor $`y+1`$ can occur.

If the smallest denominator is $`N>1`$, then

```math
  1\le\sum_{n=N}^M\frac1n<\int_{N-1}^M\frac{dt}{t}
  =\log\frac{M}{N-1}.
```

For $`y+1\le M\le ey`$ this gives $`N\le y`$. The two omissions lie inside the range between the actual endpoints. Equality with an endpoint is itself impossible. Otherwise the jump across the omissions has size at least three.

## Producing the adjacent multiples on every large scale

Use Maynard’s Theorem 3.4 with $`m=2`$ and, for example, $`\epsilon=1/12`$. It gives a fixed integer $`k`$ such that every fixed admissible family of $`k`$ distinct nonproportional positive integral affine forms, with nonnegative constant terms, has two prime values at the same integer $`t\in[T,T+T^{3/4}]`$ for all sufficiently large $`T`$. The exponent $`3/4`$ exceeds $`7/12+1/12`$. The fixed coefficients satisfy the theorem’s size conditions once $`T`$ is large. [Maynard, *Dense clusters of primes in subsets*, Theorem 3.4](https://arxiv.org/abs/1405.2593)

Construct a set of $`k`$ distinct positive integers $`s_i`$ such that $`|s_i-s_j|`$ divides both $`s_i`$ and $`s_j`$. Start with $`\{1\}`$. Given such a set $`S`$, take $`B`$ a positive common multiple of its elements and form $`\{B\}\cup\{B+s:s\in S\}`$. Each old difference divides $`B`$ and both translated entries. Each difference from the new entry is an element of $`S`$, hence divides $`B`$.

Let $`D=\mathop{\mathrm{lcm}}_i(s_i)`$. The forms $`P_i(t)=(D/s_i)t+1`$ are nonproportional and admissible, since they all equal one at zero. Whenever $`P_i(t),P_j(t)`$ are prime and $`s_i\lt s_j`$, write $`d=s_j-s_i`$. Then

```math
 y=\frac{Dt+s_i}{d}=\frac{s_i}{d}P_i(t),
 \qquad y+1=\frac{Dt+s_j}{d}=\frac{s_j}{d}P_j(t).
```

All cofactors are at most the fixed constant $`K=\max_i s_i`$. Write $`d_{\min},d_{\max}`$ for the smallest and largest differences. For large $`X`$, apply Maynard with $`T=\lceil Xd_{\max}/D\rceil`$. For whichever pair occurs,

```math
 X\le y\le (d_{\max}/d_{\min})X+O_S(X^{3/4}).
```

Thus every $`C>d_{\max}/d_{\min}`$ works. To see the density conclusion directly, fix such a $`C>1`$. Apply the theorem at $`X=Z/(eC)`$. The entire excluded interval is below $`Z`$ and contains at least $`(e-1)Z/(eC)-O(1)`$ integers. Consequently the excluded maxima have lower natural density at least $`(e-1)/(eC)>0`$.
