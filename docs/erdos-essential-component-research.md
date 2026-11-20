# Erdős essential-component conjecture

Let $A=\{2^m3^n:m,n\ge0\}\cup\{0\}$ and write $\sigma(B)=\inf_{N\ge1}|B\cap[1,N]|/N$. The question is whether $\sigma(A+(B\cup\{0\}))\gt\sigma(B)$ for every $B\subseteq\mathbb N$ with $0\lt\sigma(B)\lt1$. Ruzsa records it on p. 147 of his 1999 survey. The zero-adjoined convention is the one used there for Schnirelmann density. The 1999 Budapest booklet, Ge and Lê's later discussion, the problem wiki and searches by the set and the expansion formulation revealed no full answer. [Ruzsa, pp. 146–147](https://doi.org/10.1006/jnth.1999.2395) · [Budapest booklet, Problem 1.19](https://raw.githubusercontent.com/plby/lean-proofs/fbde2f6e550546e6779cb184582463fff7d86e60/favorite/favorite.pdf) · [Ge–Lê](https://home.olemiss.edu/~leth/papers/essential_components.pdf) · [Erdős Problems wiki](https://erdosproblems.ai/wiki/problems/integer_sequences/E1146) · [Research issue](https://github.com/1337isnot1337/solved-conjectures/issues/73)

## Equivalent expansion at half density

Write $S_q$ for the image of $A\cap[0,q]$ in $\mathbb Z/q\mathbb Z$ and let
```math
g_k=\min_{X\subseteq\mathbb Z/2^k\mathbb Z,\ |X|=2^{k-1}}
  \frac{|X+S_{2^k}|-|X|}{2^k}.
```
**Theorem.** The conjecture is equivalent to $\liminf_{k\to\infty}g_k\gt0$. If the liminf is zero, then for every $0\lt\alpha\lt1$ there is a set $B$ for which both $\sigma(B)$ and $\sigma(A+(B\cup\{0\}))$ equal $\alpha$. In that construction both lower asymptotic densities also equal $\alpha$.

**From Schnirelmann density to cyclic groups.** Suppose $\sigma(C)=\sigma(B)=\alpha\in(0,1)$, where $C=A+(B\cup\{0\})$. Since $1\in A$, each finite prefix of $C$ has density strictly greater than $\alpha$. Indeed, if $B$ has a first gap in the prefix, it is preceded by a member of $B$ and is filled by $B+1$. If there is no gap the prefix has density one. Thus there are $N_j\to\infty$ with $|B\cap[1,N_j]|/N_j\to\alpha$ and $|(C\setminus B)\cap[1,N_j]|=o(N_j)$.

These prefixes are asymptotically uniform on the scale $N_j$. To prove it, take a subsequential uniform limit $F$ of their cumulative counts $|B\cap[1,tN_j]|/N_j$ on $0\le t\le1$. Such limits exist after linear interpolation, by the common Lipschitz bound. We have $F(t)\ge\alpha t$ and $F(1)=\alpha$. Consecutive positive elements of $A$ have ratio tending to one by Tijdeman's gap theorem. Thus for every fixed $0\le d\le1$ choose $a_j\in A$ with $a_j/N_j\to d$ and $a_j\le dN_j$. For $t+d\le1$, the translate by $a_j$ of the $B$-prefix of length $\lfloor tN_j\rfloor$ lies in $C$ and contains only $o(N_j)$ points outside $B$. Passing to the limit gives $F(t+d)-F(d)\ge F(t)$. At $d=1-t$ this yields $F(t)\le\alpha-F(1-t)\le\alpha t$. Every limit is therefore $F(t)=\alpha t$. [Tijdeman, Compositio Mathematica 1974](https://www.numdam.org/item/CM_1974__28_2_159_0/)

Choose a power of two $q_j$ with $N_j/4\lt q_j\le N_j/2$. In representatives $1,\ldots,q_j$, let $X_j=B\cap[1,q_j]$ and $Y_j=(B\cap[q_j+1,2q_j])-q_j$. Both sizes are $\alpha q_j+o(q_j)$ by uniformity. Since $q_j\in A$, we also have $|X_j\setminus Y_j|=o(q_j)$, hence $|Y_j\setminus X_j|=o(q_j)$. A new point of $X_j+S_{q_j}$ is obtained by either a nonwrapping sum in $C\setminus B$ or a sum wrapping from $[q_j+1,2q_j]$. In the latter case the original sum is either in $C\setminus B$ or projects into $Y_j\setminus X_j$. These two sets account for at most $o(q_j)$ new points. Thus there are cyclic witnesses of density tending to $\alpha$ and vanishing normalized expansion.

**Changing the density of cyclic witnesses.** Suppose $X_j$ on cyclic groups of orders $q_j$ has density tending to $\beta\in(0,1)$ and normalized expansion $\delta_j\to0$ under $S_{q_j}$. As $1\in S_{q_j}$, shifting $X_j$ by one changes at most $2\delta_j q_j$ points. For a desired density $\alpha\in(0,1)$ choose a fixed $l$ with $\beta^l\lt\alpha\lt1-(1-\beta)^l$. The intersection of $l$ independently shifted copies has expected density tending to $\beta^l$, and the union has expected density tending to $1-(1-\beta)^l$. Thus some intersection is below $\alpha$ and some union is above $\alpha$ for large $j$. Start with all shifts zero. If the starting density is at least $\alpha$, move the shifts one step at a time to the chosen intersection. Otherwise move them to the chosen union. Each step changes density by at most $2\delta_j$, so along the path some set has density in $[\alpha,\alpha+2\delta_j]$. For either intersections or unions, the expansion of the combined set is at most $l\delta_j q_j$, since every newly added point lies in an individual expansion of one of the copies. Delete excess elements to leave exactly $\lceil\alpha q_j\rceil$. Expansion increases by at most the number deleted, which is at most $2\delta_j q_j$. In particular any density bounded away from zero and one yields witnesses at exactly half density along a subsequence of dyadic orders.

**From cyclic groups to an infinite set.** Take the cyclic witnesses at density $\lceil\alpha q_j\rceil/q_j$. Rotate each binary circular pattern to make every prefix have density at least its full density. This is possible by starting just after a minimum of the cumulative sums of the pattern minus its mean. Concatenate the rotated patterns in blocks of lengths $q_j$, passing to a subsequence so fast that $(N_{j-1}+1)(1+\log^2 N_j)=o(q_j)$, where $N_j=N_{j-1}+q_j$ and $N_0=0$. The resulting set $B$ has every prefix of density at least $\alpha$. At endpoint $N_j$, contributions to $C$ from summands of $B$ at most $N_{j-1}$, or from zero, number at most $(N_{j-1}+1)|A\cap[0,N_j]|=o(q_j)$. Contributions using a member of $B$ in the last block can only use shifts less than $q_j$. The points they reach by $N_j$ are contained in the cyclic expansion of that block's pattern, whose size is $\alpha q_j+o(q_j)$. Therefore $|C\cap[1,N_j]|/N_j\to\alpha$, proving the converse and the claim for arbitrary $\alpha$.

## How many intervals a cyclic witness needs

For a half-density set $X$ in a cyclic group of dyadic order $q$, let $R(X)$ count the maximal runs of consecutive occupied residues, and put $E=|X+S_q|-|X|$. Any fixed translate by a sum of $h$ members of $S_q$ adds at most $hE$ points outside $X$, by the triangle inequality for symmetric differences of equal-sized sets. The mean number of points a translate by an arbitrary residue adds is exactly $q/4$, so some residue adds at least that many.

For a fixed positive integer $h$, every $s$ in $[0,q)$ can be approximated from below by a sum of at most $h$ elements of $A$ with error at most $C_h q/(\log q)^{\eta h}$, for some $\eta\gt0$ independent of $h$. Subtract the largest smooth number up to the residual at each step. While the residual is at least $\sqrt q$, Tijdeman's upper gap bound shrinks it by a factor at most $C/(\log q)^\eta$. If it drops below $\sqrt q$, this is already within the stated error bound for each fixed $h$ and large $q$. Changing the translate by $u$ changes at most $2R(X)|u|$ points, because each run is an interval. Therefore
```math
\frac q4\le hE+2C_hR(X)\frac{q}{(\log q)^{\eta h}}.
```
If $E/q\to0$, this forces $R(X)/(\log q)^L\to\infty$ for every fixed $L$. In the opposite direction $R(X)\le E$, since $X+1$ has one new point per run. The exact double-base representation theorem of Dimitrov, Jullien and Miller permits $h=O(\log q/\log\log q)$ with zero error for every $s$, so all half-density sets satisfy $E\gg q\log\log q/\log q$. These estimates leave open the required uniform linear expansion. [Dimitrov–Jullien–Miller, Theorem 1](https://www.acsel-lab.com/arithmetic/arith13/papers/ARITH13_Dimitrov_theory.pdf)

## A Fourier criterion in both directions

For a dyadic order $q$, write $\gamma_q$ for the best lower bound on the nonzero Fourier modes obtained by weighting the shifts. In formulas,
```math
\gamma_q=\max_{\substack{w_s\ge0\\ \sum_{s\in S_q}w_s=1}}\
\min_{j\ne0\bmod q}\
\sum_{s\in S_q}w_s\bigl(1-\cos(2\pi js/q)\bigr).
```
A positive lower bound on $\gamma_q$ for all sufficiently large $q$ proves essentiality. In the other direction, $\gamma_q\log(2|S_q|)\to0$ along a sequence of dyadic orders disproves it. The first argument is the usual Fourier expansion estimate used in the theory of essential components. The second gives a rate at which a small optimum creates a single set with a small **union** of translated boundaries. [Ruzsa, Essential Components](https://doi.org/10.1112/plms/s3-54.1.38) · [Ge–Lê, Lemma 10](https://home.olemiss.edu/~leth/papers/essential_components.pdf)

For a half-density set $X$, let $f=1_X$ and use Fourier coefficients normalized by $1/q$. Parseval gives
```math
\frac1q\sum_{s\in S_q}w_s|(X+s)\setminus X|
=\sum_{j\ne0}|\widehat f(j)|^2\sum_{s\in S_q}w_s(1-\cos(2\pi js/q))
\ge \frac{\gamma_q}{4}
```
when the weights maximize the lower bound. The union of the translated boundaries has at least their weighted mean size.

For the converse, finite minimax gives a probability distribution $\mu$ on the nonzero frequencies such that, for every $s\in S_q$,
```math
\sum_{j\ne0}\mu_j(1-\cos(2\pi js/q))\le\gamma_q.
```
Take independent standard real Gaussian variables $U_j,V_j$ and set
```math
Z_x=\sum_{j\ne0}\sqrt{\mu_j}\bigl(U_j\cos(2\pi jx/q)+V_j\sin(2\pi jx/q)\bigr),\qquad
X=\{x:Z_x\ge0\}.
```
Each $Z_x$ has standard normal law. The process is stationary, and every increment $Z_{x-s}-Z_x$ for $s\in S_q$ has variance at most $2\gamma_q$. For a point in $(X+S_q)\setminus X$, either $|Z_x|\le t$ or some such increment has magnitude at least $t$. Therefore
```math
\mathbb E\frac{|(X+S_q)\setminus X|}{q}
\le O(t)+2|S_q|\exp\bigl(-t^2/(4\gamma_q)\bigr).
```
For $L=\log(2|S_q|)$, choose $t=(\gamma_q L)^{1/4}$. If $\gamma_q L\to0$, both terms tend to zero.

The random density $b=|X|/q$ has a positive probability of staying bounded away from zero and one. Indeed the correlations $r(y)=\mathbb E[Z_x Z_{x+y}]=\sum_{j\ne0}\mu_j\cos(2\pi jy/q)$ have average zero over $y$. At least a third of the shifts have $r(y)\le1/2$, since all correlations are at least $-1$. For such a shift the chance of opposite Gaussian signs is $\arccos(r(y))/\pi\ge1/3$, by rotational invariance of two independent standard Gaussians. Consequently $\mathbb E[2b(1-b)]\ge1/9$, giving a fixed positive probability that $b$ stays in a closed subinterval of $(0,1)$. Markov's inequality on the expansion then gives realizations simultaneously of intermediate density and vanishing normalized expansion. The density adjustment and concatenation above produce an infinite counterexample under the stated spectral hypothesis.
