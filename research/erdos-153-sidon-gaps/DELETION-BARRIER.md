# Erdős–Sárközy–Sós conjecture: deletion cannot repair the random construction

Partial research for [#783](https://github.com/1337isnot1337/solved-conjectures/issues/783). The [independent endpoint construction](GENUINE-SUMSET-RELAXATION.md) attains bounded mean squared gaps, quadratic diameter, and a slowly growing representation cap. The natural alteration would delete endpoints until the cap is constant. The following argument rules out that alteration with high probability, even allowing an arbitrary global deletion rule. It does not rule out coordinated endpoint choices. The main imported theorem is the linear-system container theorem of [Saxton–Thomason, *Online containers for hypergraphs, with applications to linear equations*, Theorem 4.2](https://arxiv.org/html/1611.01433#S4).

## A uniform sparse host

Fix an integer $g\ge1$. An integer $B_2[g]$ set has at most $g$ unordered representations of any sum, including repetitions of a single summand. For every fixed $C>0$ and $\varepsilon>0$, let $Y_N$ be an independent random subset of $[0,N]$ with all inclusion probabilities at most $C/\sqrt N$. Then
\[
 \Pr\left(\exists B\subseteq Y_N:\ B\text{ is }B_2[g],
                           \ |B|\ge\varepsilon\sqrt N\right)\longrightarrow0.
 \tag{1}
\]
The bound here is not an assertion about the sharp size of the largest Sidon subset in a uniform random set, studied, for example, by [Kohayakawa–Lee–Rödl–Samotij](https://www.math.tau.ac.il/~samotij/papers/Sidon.pdf).

**The linear system.** Put $k=g+1$. Embed $[0,N]$ in $\mathbb F_P$ for a prime $2N<P<4N$ (for large $N$). Consider $k$ pairs of variables subject to
\[
 x_1+y_1=x_2+y_2=\cdots=x_k+y_k.
 \tag{2}
\]
Discount solutions with any repeated coordinate. Every remaining solution inside $[0,N]$ gives $k$ distinct unordered integer representations of an integer sum, since these sums lie in $[0,2N]$. Thus every $B_2[g]$ subset of $[0,N]$ is solution-free for this system.

Use the $k-1$ equations comparing each of the first $k-1$ pair sums to the last one. Their matrix has rank $k-1$ and $k$ distinct column types, each appearing twice: the standard basis vectors and the negative all-ones vector. Any $k-1$ types are independent. Removing two columns eliminates at most one type, so the matrix is abundant in Saxton–Thomason's sense. Among the $P^{k+1}$ unrestricted solutions, each fixed coordinate equality restricts an extra parameter and leaves at most $P^k$ solutions: parametrize by the common sum $s$ and the first coordinates $x_1,\dots,x_k$, with $y_i=s-x_i$. Every coordinate difference between distinct slots is a nonzero linear form in these parameters, using odd characteristic for $x_i-y_i=2x_i-s$. Therefore the discounted set has $O_k(P^k)$ elements, below the theorem's threshold for large $P$.

For a set $J$ of $j\ge2$ removed columns, let $a$ be the number of complete column types removed. The rank drop is $\max(a-1,0)$. In the finite-field parameter of [Definition 4.1](https://arxiv.org/html/1611.01433#S4), the corresponding ratio is
\[
 \frac{j-1}{j-1-\max(a-1,0)}.
\]
For $a\le1$ it is 1. Otherwise $j\ge2a$, so $(a-1)/(j-1)\le(a-1)/(2a-1)$, increasing with $a$. All columns removed attains the maximum at $a=k$. Hence $m_{\mathbb F_P}=(2k-1)/k$ and $1-1/m=(k-1)/(2k-1)<1/2$.

**Small containers.** For any fixed $\delta>0$, every $U\subseteq\mathbb F_P$ of size at least $\delta P$ has $\Omega_{\delta,k}(P^{k+1})$ all-distinct solutions to (2). Indeed the unordered off-diagonal pair counts $R_z$ over the $P$ residues add to $\binom{|U|}{2}\gg_\delta P^2$ and each is at most $P/2$. A positive fraction (depending on $\delta$) of the residues therefore have $R_z\gg_\delta P$. For each such residue, $k$ distinct pairs with that sum are all vertex-disjoint, and supply $\binom{R_z}{k}\gg_{\delta,k}P^k$ configurations. Applying Theorem 4.2 with a sufficiently small solution-density parameter now gives a family of containers with fewer than $\delta P$ vertices each, covering the solution-free sets, whose logarithmic size is
\[
 O_{\delta,k}\!\left(P^{(k-1)/(2k-1)}\log P\right)=o(\sqrt N).
\]

Choose $\delta$ sufficiently small in terms of $C,\varepsilon$. Each container meets $Y_N$ in an independent Bernoulli sum of mean at most $\delta PC/\sqrt N\le4\delta C\sqrt N$. For example choose $4\delta C\le\varepsilon/(4e)$. The probability of at least $\lceil\varepsilon\sqrt N\rceil$ points in it is at most $\bigl(e\mu/\lceil\varepsilon\sqrt N\rceil\bigr)^{\lceil\varepsilon\sqrt N\rceil}\le4^{-\varepsilon\sqrt N}$ by the binomial-moment bound. Sum over the containers. This proves (1).

## Transfer to the cusp host

Let $A_N$ have exactly the law from [the probabilistic gap theorem](GENUINE-SUMSET-RELAXATION.md), including its four planted points. For fixed $g$ and every $\varepsilon>0$,
\[
 \Pr\left(\exists B\subseteq A_N:\ B\text{ is }B_2[g],
                            \ |B|\ge\varepsilon\sqrt N\right)\longrightarrow0.
 \tag{3}
\]
Fix $\rho>0$. Inside $[\rho N,(1-\rho)N]$ the unforced probabilities are at most $\rho^{-1/4}/\sqrt N$. Outside that interval the expected total number of unforced points is $O(\rho^{3/4}\sqrt N)$ by the sum of $j^{-1/4}$. Choose fixed $\rho$ small enough that this expectation is less than $\varepsilon\sqrt N/4$, and apply Chebyshev (variance no larger than the expectation). With probability tending to one the tail contains fewer than $\varepsilon\sqrt N/2$ points, even including the four planted ones. Apply (1) with threshold $\varepsilon/2$ to the bulk unforced points; the planted points are all outside it for large $N$. A $B_2[g]$ subset of size at least $\varepsilon\sqrt N$ would then contradict (1) in the bulk, since the property is hereditary. This proves (3).

Thus the random host can realize the gap objective but typically does not contain a fixed-cap subset of the same cardinality scale. The conclusion is probabilistic: it does not preclude specially conditioned rare outcomes or prove a deterministic restriction on other constructions.

## Bounded-displacement repairs fail too

Fix $L\ge0$. The same obstruction holds for the integer $L$-neighbourhood of the independent host, not merely its subsets. For the uniform host in (1), work in a field of prime order greater than $2(N+2L)$ and apply the same containers to the integer interval $[-L,N+L]$. For a container $D$ of size at most $\delta P$, every point of $D$ that comes from the neighbourhood of $Y_N$ has a parent in $Y_N\cap(D+[-L,L])$. The latter enlargement has at most $(2L+1)\delta P$ possible parents, interpreted modulo $P$, and one parent can produce at most $2L+1$ integer outputs. Thus a container containing $\varepsilon\sqrt N$ points of the neighbourhood needs at least $\varepsilon\sqrt N/(2L+1)$ occupied parents. Choose $\delta$ sufficiently small in terms of $L,C,\varepsilon$ and the same binomial-moment estimate defeats the same number of containers. This allows arbitrary correlated choices of shifts in $[-L,L]$, including multiple outputs per parent.

For the cusp host, the parents in its endpoint tails can yield at most $2L+1$ outputs each. First shrink the fixed $\rho$ used above so their contribution, including descendants of the planted points, is less than $\varepsilon\sqrt N/2$ with probability tending to one. Then apply the uniform-neighbourhood bound to the bulk parents. Consequently no $B_2[g]$ set of size $\varepsilon\sqrt N$ can typically be obtained by radius-$L$ shifts. In particular, no deletion-and-movement repair that keeps that many outputs and has a uniformly bounded average absolute displacement (measured over outputs) works: for a sufficiently large fixed $L$, at least half the retained outputs come from shifts of size at most $L$, and a subset of a $B_2[g]$ set is still $B_2[g]$.

## Polynomially growing movements, with distinct parents

For a repair that assigns **distinct parents** to the retained outputs, the obstruction extends to displacements of size $N^\beta$ for every fixed
\[
 0<\beta<\frac{1}{4k(2k-1)},\qquad k=g+1.
\]
Thus even a repair with average absolute displacement $O(N^\beta)$ cannot typically retain a positive $\sqrt N$ fraction and achieve a fixed representation cap. Distinct parents are used here to prevent a growing neighbourhood at a few planted or tail points from creating many extra outputs.

We give the container estimate with a decaying density parameter. Let $P\asymp N$ be prime greater than twice the length of the output interval. On $\mathbb F_P$ form the simple $r$-uniform hypergraph $H$, $r=2k$, whose edges are the sets of coordinates of all-distinct solutions of (2). The proof of supersaturation above has the stronger bound $e(H[U])\gg_k \delta^{2k}P^{k+1}$ when $|U|\ge\delta P$ and $\delta^2 P$ is sufficiently large. Indeed discrete convexity of $t\mapsto\binom{t}{k}$ gives $\sum_z\binom{R_z}{k}\ge P\binom{\lfloor P^{-1}\sum_z R_z\rfloor}{k}$, and an edge has at most $(2k)!$ orderings. Put $e_0=c_k\delta^{2k}P^{k+1}$ with $c_k$ below that lower-bound constant.

For any $j\ge2$, prescribing $j$ vertices and their slots leaves at most $P^{k+1-j+\max(a-1,0)}$ coordinate completions, where $a$ is the number of whole pairs prescribed. There are only a bounded number of slot choices. The calculation of $m=(2k-1)/k$ above therefore gives the maximum codegree bound $\Delta_j(H)\ll_k P^k(P^{-1/m})^{j-1}$. Every induced $H[U]$ with at least $e_0$ edges has average degree $\gg_k\delta^{2k}P^k$. Take a common parameter $\tau=C_k\delta^{-2k}P^{-1/m}$. Then $\Delta_j(H[U])/(d(H[U])\tau^{j-1})\ll_k C_k^{1-j}\delta^{2k(j-2)}$ for all $j\ge2$. For a large enough constant $C_k$, this ensures the small codegree-function bound of [Saxton–Thomason, Theorem 5.1](https://arxiv.org/html/1611.01433#S5), since that function is bounded by a fixed weighted sum of these ratios. The theorem gives containers with at most $e_0$ edges and hence fewer than $\delta P$ vertices. The log count is $O_k(\log P\cdot P\tau\log(1/\tau))$: there are $O_k(\log(e(H)/e_0)+1)=O_k(\log P)$ terms in the theorem's sum, each at most $P\tau\log(1/\tau)$.

For radius $L=O(N^\beta)$ take $\delta=\eta/(2L+1)$ for a sufficiently small fixed $\eta>0$. Then $\delta^2P\to\infty$ and the log container count is $O(P^{(k-1)/(2k-1)+2k\beta}\log^2 P)=o(\sqrt N)$; in particular $\tau<1/2$ for large $N$. A container with $\varepsilon\sqrt N$ outputs needs as many distinct parents in its $(2L+1)$-fold enlargement, which contains at most $\eta P$ sites. For bulk parents with inclusion probabilities $O_\rho(N^{-1/2})$, choose $\eta$ so the same binomial-moment bound and union bound apply. Given a desired fixed fraction, choose the fixed cutoff $\rho$ to make the cusp tails supply less than half that fraction with high probability; distinct parents ensure no amplification there. Finally truncate an average displacement $O(N^\beta)$ to at most a constant times $N^\beta$ on at least half the outputs by Markov. This proves both versions.
