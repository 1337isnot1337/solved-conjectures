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
There is an absolute constant $C$ such that
```math
\frac{\gamma_{2^k}}4\le g_k\le C\sqrt{\gamma_{2^k}\log(2|S_{2^k}|)}.
```
A uniform positive lower bound on $\gamma_q$ proves essentiality, while $\gamma_q\log(2|S_q|)\to0$ along a sequence of dyadic orders disproves it. The first argument is the Fourier expansion estimate used in the theory of essential components. The second uses a Gaussian process on a cyclic group to control the one-sided boundary at half density. Reweighted eigenvalues for general directed vertex expansion are studied by Lau, Tung and Wang. [Ruzsa, Essential Components](https://doi.org/10.1112/plms/s3-54.1.38) · [Ge–Lê, Lemma 10](https://home.olemiss.edu/~leth/papers/essential_components.pdf) · [Lau–Tung–Wang](https://arxiv.org/abs/2211.09776)

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
Each $Z_x$ has standard normal law. The process is stationary. Write $r(s)=\mathbb E[Z_xZ_{x-s}]$ and decompose $Z_{x-s}=r(s)Z_x+W_s$ for each fixed $x$. By minimax, $1-r(s)\le\gamma_q$. If $\gamma_q\ge1/2$ the claimed upper bound follows from $g_k\le1/2$, so assume $\gamma_q\lt1/2$. The joint Gaussian vector of residuals $W_s$ is independent of $Z_x$, and each residual has variance $1-r(s)^2\le2\gamma_q$. Membership of $x$ in $(X+S_q)\setminus X$ implies $Z_x\lt0$ and $|Z_x|\le2\max(0,\max_s W_s)$. By independence and the bounded normal density, the probability of this event is at most an absolute constant times $\mathbb E\max(0,\max_s W_s)$. For $u\gt0$ that expectation is at most
```math
\frac{\log(1+|S_q|)}{u}+u\gamma_q.
```
This follows by bounding the exponential of the maximum by the sum of the individual exponentials and applying Jensen's inequality. Optimizing in $u$ bounds the expected normalized expansion by $O(\sqrt{\gamma_q\log(2|S_q|)})$.

The random density $b=|X|/q$ lies in $[1/72,71/72]$ with probability at least $1/6$. Indeed, the correlations $r(y)=\sum_{j\ne0}\mu_j\cos(2\pi jy/q)$ have average zero over $y$. At least a third of the shifts have $r(y)\le1/2$, since all correlations are at least $-1$. For such a shift the chance of opposite Gaussian signs is $\arccos(r(y))/\pi\ge1/3$, by rotational invariance of two independent standard Gaussians. Consequently $\mathbb E[2b(1-b)]\ge1/9$. Outside the stated interval $2b(1-b)\le1/36$, and inside it $2b(1-b)\le1/2$. Markov's inequality then gives a realization in the interval with normalized expansion at most a constant times its expectation. Apply the density adjustment with $\alpha=1/2$ and with $l$ uniform over the interval. This multiplies the expansion by at most an absolute constant and proves the upper bound.

## An unconditional lower bound from short sums of powers

For all sufficiently large $k$,
```math
\gamma_{2^k}\gg \frac{(\log k)^{3/2}}{k},
\qquad
g_k\gg \frac{(\log k)^{3/2}}{k}.
```
This improves the lower bound from exact double-base representations by a factor of order $\sqrt{\log k}$.

For an odd integer $a$, a row of $N$ consecutive powers starting at $3^0$ satisfies
```math
\frac1N\sum_{n=0}^{N-1}\cos(2\pi a3^n/2^h)\le\frac12
\qquad
\bigl(1\le h\le c(\log N)^{3/2}\bigr)
```
for a sufficiently small absolute $c\gt0$ and all large $N$. For $h=1$ each cosine equals $-1$. For $h=2,3$ the mean of a complete period of cosines is zero by direct evaluation. For $h\ge4$ the order of $3$ doubles from modulus $2^{h-1}$ to $2^h$, so a complete period has zero exponential sum by pairing terms whose exponents differ by $2^{h-3}$. Remove complete periods and let $R$ be the remaining length. If $R\le N/2$ the bound follows by counting terms. Otherwise use Korobov's short-sum bound as stated in Fuchs, Lemma 7. The absolute value of this remainder is at most
```math
C R\exp\!\left(-c_1\frac{(\log R)^3}{(h\log 2)^2}\right).
```
Starting at exponent zero instead of one multiplies the odd coefficient by $3^{-1}$ modulo $2^h$, which preserves the bound. Since $R\gt N/2$, shrinking $c$ makes the expression at most $R/2$. [Fuchs, Lemmas 4–7](https://doi.org/10.5802/jtnb.369)

For the modulus $2^k$, the row with first factor $2^m$ has $N_m=1+\lfloor(k-m)\log_3 2\rfloor$ shifts. Put $K=k-\lceil\sqrt{k}\rceil$ and $H=\lfloor c_2(\log k)^{3/2}\rfloor$ with $c_2$ small enough that the row bound holds for every $m\le K$ and $h\le H$. Indeed $N_m\gg\sqrt{k}$ for these rows. Cover the possible denominator exponents $d=1,\ldots,K$ by consecutive blocks of at most $H$ exponents. For the block starting at $d=m+1$, use the uniform probability distribution on the row $2^m3^n$ with $0\le n\lt N_m$. When a nonzero frequency $j/2^k$ reduces to $a/2^d$ with $a$ odd, its cosine mean under that block's distribution is at most $1/2$, using $h=d-m$. For each remaining exponent $d$ with $K\lt d\le k$, include the distribution supported only at $2^{d-1}$, where the cosine for that denominator is $-1$.

Mix these $M=\lceil K/H\rceil+k-K=O(k/(\log k)^{3/2})$ distributions with equal weights. Every nonzero frequency receives a contribution at least $1/(2M)$ to the weighted sum defining $\gamma_{2^k}$, since its own distribution contributes at least that much and the other summands $1-\cos$ are nonnegative. The estimate for $g_k$ follows from Parseval. The bound tends to zero and leaves the uniform expansion question open.

## A binary digit condition necessary for essentiality

Let $T(n)$ count changes between adjacent digits in the ordinary binary expansion of $3^n$. A positive answer to the conjecture would imply
```math
\max_{0\le n\le\lfloor k\log_3 2\rfloor} T(n) \gg \frac{k}{\log k}
```
for every sufficiently large $k$. In particular, a sequence of $k$ along which this maximum is $o(k/\log k)$ would disprove essentiality.

To see this, use the uniform distribution on the $k$ distinct frequencies $j/2^k=1/2^d$, $1\le d\le k$, in the minimax formula for $\gamma_{2^k}$. Write the residue of $s$ in $k$ bits, starting with the least significant bit. For a prefix of length $d$, let $l_d$ be the length of its terminal run of equal digits. The fractional part of $s/2^d$ begins with $l_d$ identical bits, so its distance to the nearest integer is at most $2^{-l_d}$. Therefore
```math
\sum_{d=1}^k\bigl(1-\cos(2\pi s/2^d)\bigr)
\le 2\pi^2\sum_{d=1}^k4^{-l_d}
\le \frac{2\pi^2}{3}\,(\text{number of runs in the }k\text{ bits}).
```
In the last inequality, the successive $l_d$ inside a run are $1,2,\ldots$ up to its length. For $s=2^m3^n\lt2^k$, multiplying by $2^m$ and padding to $k$ bits can add at most two runs to the $T(n)+1$ runs of $3^n$. The zero residue has zero cosine cost. Thus
```math
\gamma_{2^k}\ll\frac{1+\max_{0\le n\le\lfloor k\log_3 2\rfloor}T(n)}{k}.
```
Since $|S_{2^k}|=O(k^2)$, the upper bound on $g_k$ in terms of $\gamma_{2^k}$ proves the digit condition. The lower bound for changes in individual powers from Bugeaud and Kaneko's smooth-number estimate is of order $\log n/\log\log n$. [Bugeaud–Kaneko, Corollary 1.5 and Remark 4.4](https://arxiv.org/abs/1704.00432) · [Stephan, Theorem 1.3](https://arxiv.org/abs/2607.14774)

## A quantitative gain on every sufficiently long prefix

The same bounds give a finite density gain for every $B$ of Schnirelmann density $\alpha\in(0,1)$. There is an absolute $c\gt0$ such that, for all sufficiently large $N$ depending only on $\alpha$,
```math
\frac{|(A+(B\cup\{0\}))\cap[1,N]|}{N}
\ge \alpha+c\,\alpha(1-\alpha)
          \frac{(\log\log N)^{3/2}}{\log N}.
```

Write $C=A+(B\cup\{0\})$, $E=|C\cap[1,N]|-\alpha N$ and $F(t)=|B\cap[1,t]|-\alpha t$ for integers $0\le t\le N$. Then $F(t)\ge0$, $F(N)\le E$, and $|(C\setminus B)\cap[1,N]|\le E$. Fix $h$ large enough that the greedy approximation estimate above has $\eta h\gt2$. Given any $t$, choose a sum $a$ of at most $h$ members of $A$ with $0\le N-t-a\le D$, where $D=O(N/(\log N)^2)$. Translate $B\cap[1,t]$ by the summands one at a time, keeping only points in $B$ at each step. The intermediate sets stay inside $[1,N]$ and each step loses at most $E$ points. Therefore $B\cap[a+1,N]$ contains at least $|B\cap[1,t]|-hE$ points. Adding the prefix of length $a$ yields
```math
0\le F(t)\le (h+1)E+D \qquad (0\le t\le N).
```

Choose the dyadic $q$ with $N/4\lt q\le N/2$, and take $X=B\cap[1,q]$ and $Y=(B\cap[q+1,2q])-q$ as above. Translation by $q$ gives $|X\setminus Y|\le E$. Also $|Y|-|X|=F(2q)-2F(q)\le(h+1)E+D$, so $|Y\setminus X|\le(h+2)E+D$. Every element of $(X+S_q)\setminus X$ lifts to either a point of $(C\setminus B)\cap[1,2q]$ or a point of $Y\setminus X$ after wrapping. Hence $|(X+S_q)\setminus X|\le(h+3)E+D$.

The Fourier lower bound from Parseval at density $\beta=|X|/q$ is $q\gamma_q\beta(1-\beta)$. If $E\ge(1-\alpha)q/(4(h+1))$, the claimed estimate follows at once for sufficiently large $N$. Otherwise the estimate for $F(q)$ and $D=o(q)$ give $\alpha\le\beta\le(1+\alpha)/2$. This gives
```math
(h+3)E+D\ge \frac12q\gamma_q\alpha(1-\alpha).
```
Now $D=o(q\gamma_q)$ by the short-sum lower bound, so the result follows with an absolute constant. The gain on the right still tends to zero. A positive gain uniform in $N$ for each $\alpha$ is the issue in the original conjecture.

## Projecting a small boundary to smaller moduli

Let $1\le r\lt k$, $q=2^k$, $q'=2^{k-r}$ and $S'$ be the projection of $S_q$ to $\mathbb Z/q'\mathbb Z$. If $g_k\le\gamma_{2^r}/16$, then there is a set $X'$ of size $q'/2$ satisfying
```math
\frac{|X'+S'|-|X'|}{q'}\le C g_k
```
with an absolute constant $C$. In particular $g_{k-r}\le Cg_k$, since $S'\supseteq S_{q'}$. The projected set of shifts retains residues of all the smooth numbers up to $2^k$.

Take a minimizing half-density set $X$ modulo $q$ and put $\delta=g_k$. Write $p_c$ for the fraction of a coset $c$ modulo $q'$ occupied by $X$. The shifts in $q'S_{2^r}$ belong to $S_q$ and preserve each coset. Applying the Fourier lower bound inside each coset and averaging yields
```math
\frac1{q'}\sum_c p_c(1-p_c)\le\frac{\delta}{\gamma_{2^r}}.
```
For a coset $c$, the occupied fraction contributed by $X+S_q$ is at least $M_c=\max_{s\in S'}p_{c-s}$. Indeed every translation carrying $c-s$ to $c$ carries all the points of $X$ in that coset. Consequently $q'^{-1}\sum_c(M_c-p_c)\le\delta$. With $X_t=\{c:p_c\ge t\}$, integrating $|(X_t+S')\setminus X_t|/q'$ over $0\le t\le1$ gives exactly $q'^{-1}\sum_c(M_c-p_c)$. Some $t$ in $[1/4,3/4]$ therefore has normalized expansion at most $2\delta$.

For every such $t$ we have $|1_{\{p_c\ge t\}}-p_c|\le4p_c(1-p_c)$, so $|X_t|/q'$ differs from $1/2$ by at most $4\delta/\gamma_{2^r}\le1/4$. Apply the density adjustment with a fixed $l$ for this interval of densities. Since $1\in S'$, it yields $X'$ of exactly half density with the claimed bound. By the short-sum estimate on $\gamma_{2^r}$, whenever $g_k$ is small this propagation applies for all $r\lt k$ up to a constant times $g_k^{-1}(\log(1/g_k))^{3/2}$.
