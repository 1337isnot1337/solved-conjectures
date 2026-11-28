# Combining independent polynomial-height starts by prime

Fix $A>1$. For each $t$, partition the primes below $t$ arbitrarily into groups. Give each group $g$ an integer height $t\le X_g\le t^A$. Choose its reference start $N_g$ independently and uniformly among the integers in $[X_g,2X_g)$. Use the Chinese remainder theorem to form one start $n$, using the residues of $N_g$ at the primes in group $g$, to powers at least $t$. The partition, the heights and the number of groups can all change with $t$.

**Theorem.** For some $c_A>0$ and all large $t$, the mean of $f(n,t)/t$ in this construction is at least $c_A$. In particular independent choices of polynomial-height starts, even for a growing number of arbitrarily interleaved prime groups, cannot make the mean fraction tend to zero. Exceptional joint choices remain possible. In fact, singleton groups allow every residue pattern modulo the individual primes when the heights are chosen large enough.

## A second moment calculation

Fix a position $i\in[1,t]$. Put $w_p=\log p/\log t$, and let $Y$ be the sum of $w_p$ over the primes $p<t$ dividing $n+i$. Thus $Y$ is the normalized logarithm of the radical of the smooth component. All the estimates below are uniform in $i$ and the partition. Write $g(p)$ for the group of $p$. Then
```math
 \mathbb E Y=1+o(1),\qquad
 \mathop{\mathrm{Var}}Y\ \ge \sum_{\substack{p,q\lt t,\ pq>t\\g(p)\ne g(q)}}\frac{w_p w_q}{pq}-o(1).
```

For each $p$, the hit probability is $1/p+O(1/t)$, by counting a residue in an interval of length at least $t$. The first moment follows from $\sum_{p<t}\log p/p=\log t+O(1)$ and $\sum_{p<t}\log p=O(t)$. The diagonal in the second moment contributes $1/2+o(1)$ by partial summation. For distinct primes with $pq\le t$, the joint hit probability is $1/(pq)+O(1/t)$, by residue counting within a common group or independence across groups. The total absolute error here is $O(1/\log t)$, since
```math
 \sum_{pq\le t}\log p\log q
 \ll t\sum_{p\le t}\frac{\log p}{p}\ll t\log t .
```
The ordered off-diagonal main term for $pq\le t$ is $1/2+o(1)$. To see it, sum over $q\le t/p$ first, replacing $\sum \log q/q$ by $\log(t/p)+O(1)$, and apply partial summation over $p$. Removing the diagonal costs $o(1)$. For cross-group pairs with $pq>t$ independence gives an error $O(1/(pt)+1/(qt)+1/t^2)$ before weighting. Summing the weighted errors costs $O(1/\log t)$ by the same one-prime estimates. All the unused within-group contributions are nonnegative. Subtracting the squared mean proves the variance bound.

Also $\mathbb E|Y-\mathbb E Y|^4\ll_A1$. In fact the group contributions $Y_g$ are independent and nonnegative, each at most $A+2$ since the product of its hit primes divides $N_g+i\le 3t^A$. For $0\le v\le A+2$ one has $e^v\le1+C_Av$. Thus
```math
 \mathbb E e^Y\le\prod_g(1+C_A\mathbb E Y_g)
 \le \exp(C_A\mathbb E Y).
```
This bounds the required fourth moment independently of the number of groups.

## Two possibilities for the partition

Use the constants $\delta,\rho,c$ of the [large-prime agreement theorem](large-prime-rational-agreement.md) with height exponent $A+2$, denominator one, and the auxiliary parameter $\varepsilon=1/2$. We may decrease $\delta$ to be below $1/2$, since the agreement hypothesis only gets stronger.

If one group misses at most $\rho$ in reciprocal prime mass on $t^\delta<p<t$, every realization agrees with its reference start modulo the required primes. The cited theorem gives $f(n,t)\ge ct$ in every realization.

Otherwise take $t^{1-\delta/2}<p<t$. The primes $t^\delta<q<t$ outside its group have total reciprocal mass greater than $\rho$, have $w_q\ge\delta$, and all satisfy $pq>t$. The sum of $w_p/p$ in the indicated $p$-range tends to $\delta/2$. Hence the variance at every site is bounded below by a positive constant depending only on $A$.

For clarity put $Z=Y-\mathbb EY$. Hölder gives $\mathbb E|Z|\ge (\mathbb E Z^2)^{3/2}/(\mathbb E Z^4)^{1/2}$. Centering therefore gives $\mathbb E Z_+=\mathbb E|Z|/2\ge d_A>0$. By Cauchy–Schwarz, $\mathbb E Z_+\le d_A/2+(\mathbb E Z^2)^{1/2}\Pr(Z>d_A/2)^{1/2}$. The uniform upper moment bound now gives a positive lower bound on this probability. Since $\mathbb EY=1+o(1)$, the event implies $Y>1$ for all sufficiently large $t$.

At such a site the smooth component exceeds $t$ and hence occurs just once in the block. Sum the lower probabilities over all positions. This proves the theorem without any independence assumption across positions. The [full numbered problem](https://www.erdosproblems.com/461) asks for a bound at every start.
