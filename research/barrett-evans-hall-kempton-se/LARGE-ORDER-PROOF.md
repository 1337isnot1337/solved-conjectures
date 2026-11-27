# Barrett–Evans–Hall–Kempton’s spectrally extreme graph conjecture

**The inequality holds for every sufficiently large order, over all the original weights.** This is not a complete resolution: the proof uses an asymptotic unweighted estimate and does not cover all orders $n\ge5$.

Put $x=\lambda_2(G)$ and $y=\lambda_2(G^c)$. We prove $F(x,y)=x+y-2xy/n\ge1$ for sufficiently large $n$. The starting point is the [one-fractional-edge reduction](ONE-FRACTIONAL-EDGE.md). The new input rules out an unweighted graph with both supports connected and complementary connectivities approaching $(0,1)$ or $(1,0)$, quantitatively. After that a linear interpolation handles the weights.

## A path bound on the coordinate range

Let $K$ be a connected simple graph, $a$ a mean-zero unit vector, and $E=\sum_{ij\in E(K)}(a_i-a_j)^2$. Put $M=\max_i a_i$ and $N=-\min_i a_i$. On a simple path from the maximum to the minimum, denote the positive and negative parts of $a$ by $z_i$ and $w_i$ respectively. Telescoping their squares with opposite orientations gives
\[
M^2+N^2=\sum_i (z_i-z_{i+1})(z_i+z_{i+1})
-\sum_i(w_i-w_{i+1})(w_i+w_{i+1}).
\]
On each edge the sum of squared differences of the positive and negative parts is at most the original squared difference. Also the sum of both sequences of squared adjacent sums is at most $4\sum_i a_i^2-2(M^2+N^2)$, with the sum here restricted to path vertices. Cauchy–Schwarz therefore gives
\[
E\ge \frac{(M^2+N^2)^2}{4-2(M^2+N^2)}
\ge \frac{R^4}{16-4R^2},\qquad R=M+N.
\]
The last step uses $M^2+N^2\ge R^2/2$ and monotonicity of $u^2/(4-2u)$ on $[0,1]$.

## A uniform corner exclusion for connected simple graphs

Let $K$ be simple, $K$ connected, and let $x=\lambda_2(K),y=\lambda_2(K^c)$ with mean-zero unit Fiedler vectors $a,b$. Expanding the complete-pair sum gives
\[
\sum_{i<j}(a_i-a_j)^2(b_i-b_j)^2
=1+n\sum_i a_i^2 b_i^2+2\langle a,b\rangle^2\ge1.
\]
This identity is also used in [Einollahzadeh–Karkhaneei](https://arxiv.org/abs/1901.02047); it does not require orthogonality of $a,b$ to each other. On edges of $K$, use $(b_i-b_j)^2\le2$ since $b$ is unit. On edges of $K^c$, use $(a_i-a_j)^2\le R^2$. Splitting the sum yields $1\le2x+R^2 y$.

Suppose $x<1/20$ and $y\le21/20$. If $y=0$ this is already impossible. Otherwise the last inequality implies $R^2\ge6/7$, and the path bound implies
\[
x\ge\frac{(6/7)^2}{16-4(6/7)}=\frac{9}{154}>\frac1{20},
\]
a contradiction. Thus whenever $K$ is connected and $y\le21/20$, one has $x\ge1/20$. By symmetry the same statement holds with the two graphs swapped and the corresponding connectivity assumption.

## All large unweighted endpoints in the interior have a uniform gap

For every simple $K$ on $n$ vertices, [Einollahzadeh–Karkhaneei’s unweighted maximum theorem](https://arxiv.org/abs/1901.02047) gives
\[
\max\{x,y\}\ge1-O(n^{-1/3}).
\]
For sufficiently large $n$ this is at least $99/100$. If $K,K^c$ are both connected and $x+y<26/25$, the smaller connectivity is then less than $1/20$ and the larger is at most $21/20$. This contradicts the independently proved corner exclusion. Hence for all such $n$ and all simple $K,K^c$ both connected,
\[
x+y\ge26/25.
\]
Take $n\ge52$ as well. Since each coordinate is nonnegative this implies both linear inequalities
\[
(1-2/n)x+y\ge1,\qquad x+(1-2/n)y\ge1.
\]
These lines are sufficient for the nonlinear conjecture on the possible violation domain $0\le x,y<1$: for example $F(x,y)\ge(1-2/n)x+y$ whenever $y\le1$.

## Interpolation to all weighted graphs

By the one-fractional-edge reduction, it suffices to treat $H+t e$, where $H$ is simple, $e$ is a nonedge, and $0\le t\le1$. Suppose $0<t<1$, since the simple case follows from the displayed linear inequalities when both sides are connected, and from a complete join in the other graph otherwise.

If either weighted support is disconnected, its connectivity is zero and the other support contains a complete multipartite graph with unit cross weights; hence the other is at least one. If both weighted supports are connected, the only disconnected unweighted supports possible are $H$ and $(H+e)^c$. If both are disconnected, the [opposite-disconnection classification](ONE-FRACTIONAL-EDGE.md) makes the weighted graph exactly $SE(t)$ and gives equality.

If all unweighted supports are connected, both linear inequalities hold at both endpoints. They persist at the interpolated weights because each connectivity is concave. If only $H$ is disconnected, then its endpoint has $x=0,y\ge1$ and satisfies the first linear inequality, while the other endpoint satisfies both. That one inequality again persists along the segment. If only $(H+e)^c$ is disconnected, the second inequality works symmetrically. In each case a putative violation would have $x,y<1$ and hence is ruled out.

This proves the original inequality uniformly in edge weights for all sufficiently large orders. The argument does not determine the small-order threshold and does not claim the full conjecture or its complete equality characterization.
