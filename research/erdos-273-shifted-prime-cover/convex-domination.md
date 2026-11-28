# A comparison for the loss when revealing prime coordinates

In searching for an unrestricted cover for [Erdős #273](https://www.erdosproblems.com/273), the following inequality compares every residue assignment with one independent divisibility model. It applies to the convex positive-part loss that appears when the available choices in a coordinate receive a cap on their probability. [Balister, Bollobás, Morris, Sahasrabudhe and Tiba, §3](https://arxiv.org/abs/1811.03547)

Let $L=\prod_{i=1}^s p_i^{a_i}$. Reveal the coordinates $X_i$ modulo $p_i^{a_i}$ in a fixed order. For every history require the conditional mass of any individual value to be at most $c_i/p_i^{a_i}$, with $c_i\ge1$. A procedure may discard mass, with the resulting expectation taken only over its surviving paths. For each divisor $d\mid L$ let $w_d\ge0$ and choose any residue $b_d$ modulo $d$. Take independent integers $V_i$ between zero and $a_i$ with
```math
 \Pr(V_i\ge j)=\min(1,c_i/p_i^j),\qquad 0\le j\le a_i .
```
For every nonnegative nondecreasing convex function $H$ on the nonnegative reals,
```math
 \mathbb E H\left(\sum_d w_d 1_{X\equiv b_d\bmod d}\right)
 \le \mathbb E H\left(\sum_{d\mid\prod_i p_i^{V_i}}w_d\right).
```
The weights may include repeated divisors with different residues by treating the terms separately. When $c_i=1$ this is the usual concentration comparison with classes all aligned at zero. The statement includes history-dependent choices of coordinates.

**Proof.** In the last coordinate, fix the earlier values. Each remaining active constraint occupies $t_j$ cells out of $M=p_s^{a_s}$ with a nonnegative weight $u_j$. Write $z$ for the vector of total cell weights, sorted in decreasing order. Replace each occupied subset by the first $t_j$ cells and call the resulting decreasing weight vector $z'$. For every $k$,
```math
 \sum_{i=1}^k z_i\le \sum_j u_j\min(k,t_j)=\sum_{i=1}^k z_i' .
```
The same prefix inequality holds after applying $H$ entrywise. For $H(x)=\max(0,x-h)$, the left prefix sum is the maximum over $0\le v\le k$ of $\sum_{i=1}^v z_i-vh$, and likewise on the right. On the finite set of values in the two vectors, a nondecreasing convex function can be interpolated by a constant plus a nonnegative combination of a linear term and those positive parts.

The largest expectation under a mass cap $c_s/M$ is attained by filling the highest cells up to the cap and using any remaining mass on the next cell. The prefix inequality, with linear interpolation for a fractional final cell, bounds it by the corresponding expectation on $z'$. Dropped mass cannot improve the upper bound because $H\ge0$. The aligned event from a modulus with last prime exponent $j$ has exactly $M/p_s^j$ cells, so this last expectation is obtained by keeping its term if $j\le V_s$. This synthetic $V_s$ is independent of the preceding coordinates. For each of its possible values, apply the same argument to the remaining coordinates in reverse order. This proves the comparison.

For a family of classes with largest prime $q$, take $w_d$ to be their $q^{-e}$ weights after deleting the factor $q^e$ from their moduli. Previous coordinates supply the residues $b_d$. If the actual fraction blocked in the new coordinate is $\alpha$, then $\alpha\le\sum w_d1_{X\equiv b_d\bmod d}$. The comparison therefore bounds the expected loss $\max(0,\alpha-\delta)/(1-\delta)$ for $0\le\delta<1$. A proof of noncoverage by summing these estimates still needs a total loss below one over the unrestricted shifted-prime pool. The comparison alone gives no such numerical inequality.
