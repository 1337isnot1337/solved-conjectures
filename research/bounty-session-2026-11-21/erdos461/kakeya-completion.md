# Concentrating the prime fibres near the interval length

The [prime-fibre inequality](prime-fibres.md) counts distinct smooth parts within each prime's multiples. The following construction shows how severely the contributions from different primes can overlap. It uses the quadratic progression construction of [Ben Green and Imre Ruzsa, *On the arithmetic Kakeya conjecture of Katz and Tao*, Section 5](https://arxiv.org/abs/1712.02108). The choice of progression origins is theirs. The application here completes prescribed smooth-component data to a start in [Erdős Problem 461](https://www.erdosproblems.com/461).

**Theorem.** For every sufficiently large block length $t$ there is an integer
```math
 K=\exp\!\left(\Theta\!\left(\frac{\log t}{\log\log t}\right)\right)
```
and a set of $O(t/K)$ positions in $[1,t]$ with the following property. Prescribe arbitrary starting residues at all primes $p\le t/K$, to any finite powers of those primes. There is a common start $n\ge0$ realizing these prescriptions such that every multiple in the block of every prime $t/K<p<t$ belongs to one of the specified positions. The set of positions is independent of the prescriptions.

**Proof.** Take the first $m=\lfloor\log t/(4\log\log t)\rfloor$ odd primes and let $Q$ be their product. The prime number theorem gives $Q\le t^{1/3}$ for sufficiently large $t$, since the logarithm of the $m$-th odd prime is $(1+o(1))\log m$. Set $K=\lfloor(3/2)^{m/2}\rfloor$. In particular $Q<t/K$.

For each integer $0\le j\le K$ take all positions $i\in[1,t]$ for which $4i+j^2$ is a square modulo every prime divisor of $Q$, allowing zero as a square. For fixed $j$ the fraction of qualifying residues modulo $Q$ is exactly
```math
 \prod_{q\mid Q}\frac{q+1}{2q}\le (2/3)^m .
```
Indeed, multiplication by $4$ is invertible at every odd prime. Let $E$ be the union of these sets of positions. Each residue modulo $Q$ occurs at most $t/Q+1$ times, so
```math
 |E|\le (K+1)(t+Q)(2/3)^m\ll t/K.
```

For each prime $t/K<p<t$, let $b_p$ be the representative of $p^2\bmod Q$ in $[1,Q]$. Prescribe $n\equiv-b_p\pmod p$. These congruences are mutually compatible and independent of all the smaller-prime prescriptions. The Chinese remainder theorem gives a nonnegative start. Since $1\le b_p<p$, every position of a multiple of $p$ has the form $i=b_p+jp$ with $0\le j\le K$. At each such position
```math
 4i+j^2\equiv(2p+j)^2\pmod Q .
```
This proves the claim simultaneously for all the primes and all their multiples.

**Consequence for the minimum.** Let $F_y(t)$ be the minimum number of distinct components on a block of length $t$ when retaining only primes $p\le y$. Let $F(t)$ retain all primes strictly below $t$. For the $K$ above,
```math
 0\le F(t)-F_{t/K}(t)\ll t/K .
```
Removing prime coordinates can only merge labels, proving the first inequality. For the other, take a minimizer for the truncated problem and prescribe its start at every retained prime to the least power at least $t$. These residues preserve its equality partition, by the [finite-period argument](README.md). Complete the start by the theorem. Outside $E$ there are no additional prime factors, and at most $|E|$ new labels can come from inside $E$.

In particular these top prime ranges can add fewer than $t/(\log t)^A$ labels to **any prescribed truncated pattern**, for every fixed $A$ and sufficiently large $t$. By summing the dyadic bins from the fibre inequality only up to $j\le\lfloor\log_2 K\rfloor-1$, the within-prime contributions from this very range are still $\gg t\log\log t/\log t$. The construction exhibits actual starts where counting those contributions as different labels across primes fails by an unbounded factor. Primes below $t/K$ still extend to $t^{1-o(1)}$, and the unrestricted linear lower bound remains open.
