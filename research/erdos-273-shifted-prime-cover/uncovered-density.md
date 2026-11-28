# A uniform positive density survives the single-prime constraints

There is an absolute $\eta>0$ such that, for every finite family of distinct shifted-prime moduli in [Erdős #273](https://www.erdosproblems.com/273), whichever residue is chosen for each modulus, classes whose moduli have at most one prime factor greater than three leave at least density $\eta$ uncovered. Consequently, in any full cover the sum of $1/m$ over the moduli $m$ having at least two distinct prime factors greater than three is at least $\eta$.

## The reciprocal sum for single auxiliary primes converges

For every even 3-smooth integer $d$, the number of primes $q\le X$ for which $dq+1$ is prime is $O(X/(\log X)^2)$, uniformly in $d$ for $X\ge3$. Here is the sieve argument, including why the implied constant is independent of the multiplier.

Put $Q=\lfloor\sqrt X\rfloor$ and discard the at most $Q$ values $q\le Q$. Every remaining candidate avoids the two distinct classes $0$ and $-d^{-1}$ modulo each prime $5\le p\le Q$, since neither $q$ nor $dq+1$ can equal $p$. The arithmetic large sieve bounds their count by $(X+Q^2)/L$, where $L$ is the sum over squarefree $v\le Q$ coprime to six of $\prod_{p\mid v}2/(p-2)$. [Large sieve in residue-class form, Croot and Elsholtz, introduction](https://ecroot.math.gatech.edu/gallagher.pdf)

For completeness, $L\gg(\log Q)^2$. Form $P=\prod_{5\le p\le Y}(1+2/p)$ over primes only, with $Y=Q^{1/10}$. Expand $P$ and normalize its terms to a probability distribution on the squarefree products $v$ that occur. Mertens' estimates give $P\gg(\log Y)^2$ and
```math
 \mathbb E\log v=\sum_{5\le p\le Y}\frac{2\log p}{p+2}\le(2+o(1))\log Y.
```
Markov's inequality leaves more than half the weight on $v\le Q$ for large $Q$. Each of those weights before normalization is at most its summand in $L$. This proves the sieve estimate, after enlarging the constant for bounded $X$. Partial summation now gives $\sum_{q:dq+1\ {\rm prime}}1/q=O(1)$ uniformly in $d$, with $q$ restricted to primes.

Let $B$ be the sum of $1/(dq^e)$ over all even 3-smooth $d$, all primes $q>3$ and $e\ge1$ such that $dq^e+1$ is prime. For $e=1$ the uniform estimate gives $O(\sum_d1/d)=O(1)$. For $e\ge2$ discard the primality condition on the shifted number and bound by $(3/2)\sum_{q>3}1/(q(q-1))$. Thus $B$ is finite.

## From a surviving coordinate to surviving density

Use the [simultaneous base estimate](one-auxiliary-prime.md). Its good base set has proportion $g>1/100$. On it, each forbidden coordinate weight $W_q$ is less than $9/10$. The average of $\sum_qW_q$ over the whole base is at most $B$, so its conditional average on the good set is at most $B/g$. Conditional on a fixed base point, different auxiliary coordinates are independent under uniform counting in the finite least common multiple. The surviving proportion there is at least
```math
 \prod_q(1-W_q)\ge\exp\left(-10\sum_qW_q\right),
```
where the last inequality follows by integration of $1/(1-t)\le10$ on $[0,9/10]$. By Jensen's inequality the total surviving proportion is at least $g\exp(-10B/g)\ge\exp(-1000B)/100$. Take the latter quantity as $\eta$. Periodicity identifies this proportion with natural density. In a full cover the mixed moduli must cover all those integers, so their reciprocal sum is at least $\eta$.
