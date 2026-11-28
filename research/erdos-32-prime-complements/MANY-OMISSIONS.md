# Many missing blocks in sparse prime sumsets

**Partial result toward [Erdős Problem 32](https://www.erdosproblems.com/32).** There are absolute constants $c_1,c,C>0$ such that the following holds for every sufficiently large $X$, uniformly in $\mathcal B\subseteq\mathbb Z_{\ge0}$. Put $`M=\#(\mathcal B\cap[0,X])`$. If the integer $H\ge1$ satisfies
```math
U:=H(M+1)\le c\log X\log\log X,
```
then at least
```math
c_1 X\exp\!\left(-\frac{C U}{\log\log X}\right)
\tag{1}
```
distinct integers $N$ have $`\{N+1,\ldots,N+H\}\subseteq[X/2,X]`$ disjoint from $\mathbb P+\mathcal B$. This is a multiplicity refinement of Radomskii's block-existence theorem, not a proof of a stronger threshold on $M$.

For $M\le A\log X$ with any fixed $A>0$, the case $H=1$ gives at least $X\exp[-O_A(\log X/\log\log X)]$ omissions in the dyadic interval. This strengthens both the range of fixed $A$ and the exponent of [Ruzsa, Theorem 2 and §3](https://matwbn.icm.edu.pl/ksiazki/aa/aa86/aa8638.pdf), which gave $X\exp[-O_A(\log X\log\log\log X/\log\log X)]$ for $A<e^\gamma$. In particular, if the number of omissions up to $X$ is at most $X\exp[-\omega(X)\log X/\log\log X]$ for some $\omega(X)\to\infty$, then $M/\log X\to\infty$. This faster-rate density hypothesis is much stronger than asymptotic density one. Neither Ruzsa's density-one Conjecture 1 nor the main $o((\log X)^2)$ completion question is settled here.

## 1. A relaxed large-shift lemma

Use notation and parameters exactly as in [Radomskii, arXiv:2610.14127v3, §3](https://arxiv.org/html/2610.14127v3#S3): $Q=\prod_{p\le x}p$, $z=x^6$, $y=\exp(x/(\log x)^5)$, $D=e^{x/4}$, and $T=\lfloor e^x\rfloor$. His Lemma 3.1 has this variant: for sufficiently large $x$, distinct integer shifts $s_1,\ldots,s_k$ with $1\le k\le\eta x$ and $|s_i|\le e^{x^2}$, and every integer $b$, there is an integer $1\le t\le T$ such that every $b+Qt+s_i$ has a prime divisor in $(z,y]$. Here $\eta>0$ is an absolute sufficiently small constant.

Indeed, the shift-size hypothesis enters his proof only through the upper bound on $\log\Delta$, where $\Delta=\prod_{i<j}|s_i-s_j|$. The relaxed hypothesis gives $\log\Delta=O(x^4)$ and therefore, in place of (3.2),
```math
\sum_{\substack{p>z\\p\mid\Delta}}\frac1p
\le \frac{\log\Delta}{z\log z}
=O\!\left(\frac1{x^2\log x}\right).
```
Omit primes dividing $\Delta$ as in the source. The roots of the forms modulo every remaining prime are still distinct; this is purely a divisibility condition. In the estimate (3.6) the only required conclusion is $B_0-B=o(1)$, and the relaxed bound still gives
```math
B_0-B\ll\frac{\log y}{(\log z)^2}\frac1{x^2\log x}
\ll \frac1{x(\log x)^8}=o(1).
```
Thus $B\asymp1$ as before. Sections 3.2–3.7 use the retained primes' size range, distinct roots modulo each retained prime, this bound on $B$, and $k\le\eta x$. No shifted value needs to be small or positive: all finite averages there count residue classes of $t$ with arbitrary intercept $b$. The same argument therefore proves the variant.

## 2. Apply the lemma repeatedly in a dyadic interval

Write $L=\log X$, $l=\log L$. If $U\le L/4$, every covered starting point $N$ is a number $a+p-j$ for some $a\in\mathcal B\cap[0,X]$, $1\le j\le H$, and prime $p\le X$. There are at most $HM\pi(X)\le (1+o(1))X/4$ such numbers, while the interval of allowable starts has $X/2-O(H+1)$ integers. This gives at least $X/5$ missing starts for large $X$, which suffices.

Suppose now $L/4<U\le cLl$, and choose
```math
x=A U/l,
```
where $A$ is a sufficiently large absolute constant. For all sufficiently large $X$, $x^2\ge L$, $\log x\ge l/2$, and, choosing $c$ sufficiently small after $A$, $x\le L/10$. Take $Q,z,y,T$ as above.

Let $\mathcal S_0$ be the set of distinct shifts $j-a$ with $1\le j\le H$ and $a\in\mathcal B\cap[0,X]$. All shifts have absolute value at most $X$ once $X$ is large, since $H\le cLl$. Average over the residues of $N$ modulo $Q$ to choose one residue $r$ for which at most
```math
|\mathcal S_0|\frac{\varphi(Q)}Q\ll \frac{U}{\log x}\ll U/l
```
shifts $s$ have $(r+s,Q)=1$. By the choice of $A$, their number is at most $\eta x$. In each interval of $S:=Q(T+1)$ consecutive allowable integers for $N$, take its first integer $b\equiv r\pmod Q$. The relaxed lemma on the surviving shifts produces $N=b+Qt$ within this same interval. If none survive, take $N=b$. The other shifts have a prime divisor $\le x$ by the initial residue choice. Thus every $N+s$ has a prime divisor at most $y$.

Choose disjoint such intervals covering as many allowable starts as possible. The prime number theorem gives $\log Q=x+o(x)$, so $S\le e^{3x}$ for large $X$. Since $x\le L/10$ and $H\le cLl$, there are at least $X/(4S)$ full intervals for $N$. They produce that many distinct divisible candidates. A candidate fails to be a missing block only if at least one $N+j-a$ itself equals a prime at most $y$. There are at most $HM\pi(y)\le Ue^x$ such bad starts in the entire range, by counting $(j,a,p)$. This does not require any gap in the shift set around $N$. The bad count is $o(Xe^{-3x})$, uniformly from $U\le cLl$ and $x\le L/10$. Hence at least $Xe^{-3x}/8$ candidates are genuinely missing blocks, proving (1).

## Source scope and priority

Radomskii, [*Additive complements to the primes and large gaps between Romanoff numbers*, arXiv:2610.14127v3](https://arxiv.org/abs/2610.14127v3), Theorem 1.1, proves one missing block in $[X/2,X]$ at the order $H\asymp\log X\log\log X/(M+1)$ when this is at least one. His Theorem 1.2 solves Ruzsa's cofinite-completion Conjecture 2 and the $O(\log X)$ subquestion of Erdős 32. The same paper explicitly leaves Ruzsa's density-one Conjecture 1 and the main $o((\log X)^2)$ completion question open. This note borrows his main weighted sieve lemma; the shifted-size adjustment and its repeated use yield a uniform count. An exact earlier quantitative multiplicity claim was not found in the targeted source searches.
