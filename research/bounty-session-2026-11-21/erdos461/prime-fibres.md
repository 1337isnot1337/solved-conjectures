# Prime fibres in Erdős Problem 461

Erdős and Graham ask for a constant lower bound on the fraction of distinct smooth components in every interval, including starts of unrestricted height. Their 1980 monograph, p. 92, reports the lower bound of order $t/\log t$. The [numbered problem](https://www.erdosproblems.com/461), its [discussion](https://www.erdosproblems.com/forum/thread/461) and the [finite minimum computations](https://github.com/arhancanli/quantavane-erdos-results/tree/main/461) concern this same question. The [repository's polynomial-height theorem](polynomial-height.md) covers every fixed polynomial height. The following estimate concerns arbitrary height and tracks where a loss occurs when smaller intervals are counted inside the original interval. [Tracking issue](https://github.com/1337isnot1337/solved-conjectures/issues/1114)

Write $F(L)$ for the minimum number of distinct $L$-smooth components in a block of $L$ consecutive positive integers, using primes strictly below $L$. Write $S$ for the set of $t$-smooth components in the given block of length $t$, and $f=|S|$. Take any set of primes $\mathcal P$ strictly between $\sqrt t$ and $t$. For $s\in S$ let $b(s)$ count primes in $\mathcal P$ dividing $s$. Then
```math
 f + \sum_{s\in S}(b(s)-1)_+
 \ \ge\ \sum_{p\in\mathcal P}F(\lfloor t/p\rfloor).
```

Indeed, division by $p$ takes the multiples of $p$ in the block to consecutive positive integers. There are at least $L=\lfloor t/p\rfloor$ of them. Among the first $L$ quotients there are at least $F(L)$ different $L$-smooth components. Since $L<p<t$, taking the full $t$-smooth components of the original multiples can only distinguish more quotients. Specifically, divide the full component by $p$, then remove its prime factors at least $L$ to recover the smaller component. Thus at least $F(L)$ members of $S$ are divisible by $p$. Summing the incidences gives the inequality, since its left side is the sum of $\max(1,b(s))$ over $s\in S$.

Every positive contribution to the excess on the left belongs to a component greater than $t$: two different primes in $\mathcal P$ already have product greater than $t$. Such a component occurs at exactly one site, because it divides the difference of any two of its sites.

## Size of the accumulated contribution

Take all the primes in the indicated range. For an absolute $c>0$ and all sufficiently large $t$,
```math
 f+\sum_{s\in S}(b(s)-1)_+
 \ \ge\ c\,\frac{t\log\log t}{\log t}.
```

To see this, use the disjoint bins $t/2^{j+1}<p\le t/2^j$ for integers $1\le j\le (\log_2 t)/3$. They lie above $\sqrt t$ for large $t$. The prime number theorem gives at least a constant times $t/(2^j\log t)$ primes in each bin, uniformly because their endpoints tend to infinity uniformly. For these primes $2^j\le L<2^{j+1}$. The reported Erdős–Graham bound gives $F(L)\gg 2^j/(j+1)$, adjusting the constant for small $L$. Summing the products over $j$ gives the displayed estimate.

In particular, if every site has at most $B\ge1$ prime divisors between $\sqrt t$ and $t$, then
```math
 f\gg \frac{t\log\log t}{B\log t}.
```
This makes no restriction on the residues at smaller primes, the exponents, or the prime factors at least $t$. Even without the cap, if $f\le Kt/\log t$ for a fixed $K$, the mean of $\max(1,b(s))$ over **distinct** components is at least a constant times $(\log\log t)/K$. The excess must be carried by singly occurring components. The argument gives neither an upper bound on that excess for arbitrary starts nor the requested linear lower bound.
