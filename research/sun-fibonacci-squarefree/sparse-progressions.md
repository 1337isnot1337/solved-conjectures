# Progressions with few possible Fibonacci shifts

Write $R(n)$ for the number of Fibonacci values $F_i$ for which $n-F_i$ is positive, odd and squarefree. For every sufficiently large $X$ there is a residue class of odd integers of modulus

```math
M_X\le \exp\!\left(O\!\left(\frac{\log X}{\log\log X}\right)\right)
```

on which every $X<n\le2X$ satisfies $R(n)=O(\log X/\log\log X)$. This gives at least $X^{1-o(1)}$ such integers in the interval. Over all integers in the interval the mean of $R(n)$ has order $\log X$. In particular $\liminf R(n)/\log n=0$. These conclusions permit $R(n)\ge1$ at every positive integer.

**A prime-square identity.** For every $d\ge1$ and $t\ge0$,

```math
F_{(2t+1)d}\equiv(-(-1)^d)^tF_d\pmod{L_d^2},
\qquad L_d=F_{d-1}+F_{d+1}.
```

Set $u_k=F_{kd}$ and $D=(-1)^d$. The stride recurrence is $u_{k+2}=L_d u_{k+1}-D u_k$, from the characteristic polynomial of the $d$th power of the Fibonacci companion matrix. Induct simultaneously on $t$ to see that $L_d\mid u_{2t}$ and $u_{2t+1}\equiv(-D)^t F_d\pmod{L_d^2}$. The induction starts with $u_0=0$ and $u_1=F_d$. Lean checks this identity for unbounded $d,t$, deriving the stride recurrence directly from Fibonacci addition and Cassini’s identity. [Lean source](LucasSquares.lean)

**Choosing a progression.** Fix $T$ large enough that $F_{3j}\le2X$ implies $j\le T$, with $T\asymp\log X$ by Fibonacci growth. We take $n\equiv9\pmod{18}$. Only even Fibonacci values can contribute, hence only indices $3j$. Whenever $4\mid j$, $9\mid F_{3j}$ because $9\mid F_{12}=144$ and $F_{12}\mid F_{12k}$ for $k\ge1$. The same exclusion holds for $F_0=0$.

For each prime $5\le\ell\le\sqrt T$ take Fibonacci primitive prime divisors of ranks $2\ell,4\ell,12\ell$ and denote them by $a,b,c$, respectively. These exist by Carmichael’s primitive divisor theorem. Every rank used is distinct, including across different $\ell$, and none is the rank of 2 or 3. Hence each prime receives only one CRT condition. A primitive prime of rank $2m$ divides $L_m$, since $F_{2m}=F_m L_m$. Also $L_m\mid L_{3m}$ by $L_{3m}=L_m^3-3(-1)^mL_m$. [Yabuta’s proof of Carmichael’s theorem](https://www.fq.math.ca/Scanned/39-5/yabuta.pdf)

* Require $n\equiv F_{3\ell}\pmod{a^2}$. Since $a\mid L_\ell\mid L_{3\ell}$ and $3\ell$ is odd, the identity excludes every odd $j$ divisible by $\ell$.
* Require $n\equiv F_{6\ell}\pmod{b^2}$ and $n\equiv-F_{6\ell}\pmod{c^2}$. Both primes divide $L_{6\ell}$. For $j=2\ell w$ with $w$ odd, the identity gives the first sign when $w\equiv1\pmod4$ and the second sign when $w\equiv3\pmod4$. Thus every such index is excluded.

Each prime of rank $r$ is at most $F_r$, so the logarithm of the full CRT modulus is $O(\sum_{\ell\le\sqrt T}\ell)=O(T/\log T)$ by the standard upper bound for the prime-counting function. The implicit constant is independent of $X$.

**Counting the survivors.** A surviving $j$ has the form $2^s3^t w$, with $s\in\{0,1\}$, where every prime factor of $w$ is larger than $\sqrt T$. Since $j\le T$, $w$ is 1 or a single prime larger than $\sqrt T$. The first case gives $O(\log T)$ indices. For each $s,t$ in the second case the number is at most $O(T/(2^s3^t\log T))$, since the upper endpoint $T/(2^s3^t)$ is at least $\sqrt T$ whenever that range is nonempty. Sum the geometric series to obtain $O(T/\log T)$ candidates. Counting the members of the CRT class in $(X,2X]$ proves the claim.

For the comparison mean, there are $O(\log X)$ Fibonacci values through $2X$, giving the upper bound. For each of the $\asymp\log X$ distinct values $F_i\le X/4$, every odd squarefree $m\in(X,3X/2]$ gives a valid pair at $n=m+F_i$ in the interval. The positive density of odd squarefree numbers gives $\gg X$ such choices for every $i$.

The example script constructs the full CRT class for $T=256$, verifies primality and the exact rank of each auxiliary prime, and checks the claimed form of every surviving index. The proof above applies for arbitrary $T$. [Exact example](sparse_shifts.py)
