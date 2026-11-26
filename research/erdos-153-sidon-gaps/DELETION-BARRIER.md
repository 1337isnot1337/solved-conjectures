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
