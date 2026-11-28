# A quadratic convex sequence with independent choices at positive density

[Erdős #455](https://www.erdosproblems.com/455) asks whether increasing convex sequences of primes always satisfy $q_n/n^2\to\infty$. Richter proved a positive constant lower bound. The [October 2026 research account](https://erdosproblems.ai/wiki/problems/integer_sequences/E0455/claims/2026_10_06_satorunet) describes the known obstruction to improving a finite-prime sieve beyond coefficient one. The construction below gives exponentially many different convex paths at coefficient one for every fixed sieve. All claims here concern integers avoiding specified prime divisors. Primality remains open.

**Proposition.** For every positive integer $W$ there is an odd positive integer $a$ with the following property. Start with $u_n=n(n+1)+a$. For each positive multiple $15j$ of 15, independently choose whether to add 2 at both indices $15j-1,15j$. Every resulting sequence is strictly increasing, has nondecreasing successive gaps, has all terms coprime to $W$, and satisfies $u_n/n^2\to1$. In particular its first $15m$ terms admit at least $2^m$ different patterns with the same $a$.

For an odd prime $p\ge7$, choose $D$ such that $D$ and $D-8$ are both quadratic nonresidues modulo $p$. To see existence, write $\chi$ for the quadratic character with $\chi(0)=0$. The number of such $D$ is

$$
\frac{p-3+\chi(8)+\chi(-8)}4>0.
$$

Indeed, expand $(1-\chi(D))(1-\chi(D-8))$ over $D\ne0,8$. The sum of $\chi(D(D-8))$ is $-1$, since the solutions of $y^2=(D-4)^2-16$ are parametrized by the $p-1$ ordered factor pairs of 16. Choose $a$ modulo $p$ by $1-4a=D$. Both quadratics $n(n+1)+a$ and $n(n+1)+a+2$ then have no root modulo $p$.

For $p=3$ take $a=2$ modulo 3, and for $p=5$ take $a=1$ modulo 5. In each case $1-4a$ is a nonresidue. At either of the two indices where a switch is allowed, $n(n+1)=0$ modulo both primes, and $a+2$ is nonzero. For 2 take $a$ odd. Apply the Chinese remainder theorem to the primes dividing $30W$.

Write $b_n$ for the binary indicator of all chosen index pairs. There are no isolated ones, so $b_{n+1}-2b_n+b_{n-1}\ge-1$. Consequently the second differences of $n(n+1)+a+2b_n$ are nonnegative. Its first differences are at least $2n$ for $n\ge1$. The bounded perturbation preserves the stated asymptotic.

In particular, arbitrarily long prescribed binary strings can be read directly from the positions divisible by 15 while all the congruence exclusions hold. Thus even imposing large word complexity on the allowed paths does not overcome the obstruction for a fixed set of prime divisors.
