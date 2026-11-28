# One convex sequence avoiding a growing set of primes

For a single increasing convex sequence of integers $u_n$, it is possible to have simultaneously

$$
\frac{u_n}{n^2}\longrightarrow1,\qquad
\liminf_{n\to\infty}\frac{P^-(u_n)}{\log u_n}\ge1,
$$

where $P^-(m)$ is the least prime divisor. The construction still permits independent binary choices at one index pair out of every 15 indices. This strengthens the [fixed-prime construction](finite-prime-avoidance.md) by making the set of avoided primes grow along a single sequence. It does not give a sequence of primes.

**Compatible quadratics.** For every multiple $s$ of 30 and every squarefree modulus $W$, there exists a residue class $a$ modulo $30W$ for which $n(n+1)+sn+a+2b_n$ is coprime to $30W$ at every $n$. Here $b_n$ is any of the binary pair patterns in the fixed-prime construction. At 2, 3 and 5 the same choices work because $s=0$ modulo 30. At larger primes choose $a$ so that $(1+s)^2-4a$ and $(1+s)^2-4a-8$ are nonresidues. If $30\mid W$ it suffices to specify $a$ modulo $W$, since only prime divisibility matters.

**Joining the quadratics.** Put $N_j=2^j$ for $j\ge10$ and let $W_j$ be the largest primorial at most $N_j^2/j^4$. Start with the line $L_9(x)=1$ of slope $s_9=0$. Choose increasing slopes by setting

$$
d_j=30\left\lceil\frac{N_j}{30j^2}\right\rceil,\qquad s_j=s_{j-1}+d_j.
$$

Let $L_j(x)=s_jx+a_j$. In the compatible residue class for slope $s_j$ modulo $W_j$, choose the largest $a_j$ at most $a_{j-1}-d_jN_j$, with $a_9=1$. The first primorial used already contains 30. The intersection $T_j$ of the new line and its predecessor satisfies

$$
N_j\le T_j < N_j+W_j/d_j \le N_j(1+j^{-2}).
$$

In particular $T_j<T_{j+1}$. Hence the upper envelope $L(x)$ of these lines equals $L_j(x)$ throughout $[T_j,T_{j+1}]$. This follows by comparing each adjacent pair of lines on the appropriate side of its intersection. The envelope is convex and nondecreasing.

Set $u_n=n(n+1)+L(n)+2b_n$. Its values are integers. Its strict increase and convexity follow by adding the nondecreasing convex function $L$ to the increasing convex sequence $n(n+1)+2b_n$. For $T_j\le n<T_{j+1}$, one has $s_j=O(N_j/j^2)$ by geometric summation, so $1\le L(n)\le1+ns_j=O(1+n^2/j^2)$. Thus $u_n/n^2\to1$. All binary choices use exactly the same envelope.

**Sieve range.** Write $z_j$ for the largest prime in $W_j$. The prime number theorem in the form $\vartheta(x)\sim x$ gives $z_j\sim2\log N_j$: for any fixed $\delta>0$ the primorial through $(2-\delta)\log N_j$ is below the budget for large $j$, and that through $(2+\delta)\log N_j$ is above it. Consecutive primes have ratio tending to one. On interval $j$ the compatible quadratic gives $P^-(u_n)>z_j$. There $\log u_n\sim2\log N_j$, proving the assertion.

Consequently, excluding every prime divisor up to any fixed fraction less than one of $\log u_n$ cannot by itself force superquadratic growth, even along a single sequence with an arbitrary prescribed binary pattern.
