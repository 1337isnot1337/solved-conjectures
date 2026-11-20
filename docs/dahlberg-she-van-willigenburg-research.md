# Dahlberg–She–van Willigenburg conjecture

The conjecture says that the chromatic symmetric function $X_T$ of any tree $T$ with a vertex of degree at least four has a negative elementary-basis coefficient. It appears as Conjecture 6.1 of [Dahlberg, She, and van Willigenburg](https://arxiv.org/abs/1901.02468). The problem remains open in the sources checked.

Wolfgang's necessary condition for $e$-positivity is that $T$ admits a connected partition of every type. [Barth and Fournier](https://doi.org/10.1016/j.disc.2006.01.006) and [Tom](https://arxiv.org/abs/2409.12934) exclude degree at least five and degree four with no leaf neighbor. [Zheng](https://arxiv.org/abs/2008.05038) and Tom exclude four-legged spiders. [Tang, Wang, and Wang](https://arxiv.org/abs/2610.39481) recently excluded all caterpillars of maximum degree four. [Li](https://arxiv.org/abs/2503.09484) formulates coefficient tests and related questions.

## Coefficients using one part size with a single exception

Let $d\ge2$, $1\le r\lt d$, and $n=jd+r$ with $j\ge1$. For $v\in V(T)$, let $g_d(v)$ count edges whose component away from $v$ has order divisible by $d$. Then

```math
[e_r e_d^j]X_T=(-1)^j\sum_{v\in V(T)}(1-d)^{g_d(v)}.
\tag{1}
```

There is also a formula for the sum of two coefficients:

```math
[e_{d+r}e_d^{j-1}]X_T+[e_re_d^j]X_T
=r\sum_{S}(-1)^{j-c(S)-h(S)}d^{c(S)}(d-1)^{h(S)}.
\tag{2}
```

Here $S$ ranges over connected vertex sets of order $r$ such that every component of $T-S$ has order divisible by $d$. Write $c(S)$ for the number of components. Write $h(S)$ for the total number of edges within these components whose deletion splits their component into two sets of orders divisible by $d$. Formula (2) evaluates the signed connected-partition sum in Li's Corollary 4.3 via divisibility of single-edge splits.

**Proof of (1).** Specialize to $d$ colors, with $e_d=1$, $e_r=t$, and all other elementary functions zero. At $t=0$ the colors $x_i$ are the distinct roots of $x^d=(-1)^{d-1}$. For a tree of order $k$ rooted at $w$, the sum of proper-coloring weights with root color $x_i$ is $C_w x_i^k$. The constant $C_w$ is a product over edges of $d-1$ if the subtree below that edge has order divisible by $d$, and of $-1$ otherwise. This follows recursively from

```math
\sum_{h\ne i}x_h^\ell =
\begin{cases}
(d-1)x_i^\ell,& d\mid\ell,\\
-x_i^\ell,& d\nmid\ell .
\end{cases}
```

The colors as functions of $t$ are the roots of $x^d+(-1)^r t x^{d-r}+(-1)^d=0$. At zero their derivatives are $(-1)^{r+1}x_i^{1-r}/d$. Differentiate the weight of each coloring by singling out one vertex $v$. Condition on the color of $v$ and root the tree there. This gives a contribution $(-1)^{r+1}C_v\sum_i x_i^{n-r}/d$. Now $C_v=(-1)^{n-1-g_d(v)}(d-1)^{g_d(v)}$ and $x_i^{n-r}=(-1)^{j(d-1)}$, giving (1).

**Proof of (2).** This time specialize $e_d=1$ and $e_{d+r}=t$, with the other elementary functions zero. There are $d$ colors tending to the same nonzero roots as before and $r$ colors tending to zero. At zero the derivative at each nonzero root is the negative of the corresponding derivative in the proof of (1), by implicit differentiation of $x^{d+r}+(-1)^dx^r+(-1)^{d+r}t=0$. Colorings using only these $d$ colors therefore give the negative of (1) at the linear term.

As $t\to0^+$, divide the other $r$ colors by $t^{1/r}$. They are the roots of $y^r=(-1)^{r-1}$ up to $O(t^{d/r})$ by the same polynomial and the simplicity of these limiting roots. For colorings using these colors exactly at the vertex set $S$, the weight sum factors into the two chromatic symmetric functions of $T[S]$ and $T-S$, evaluated on their respective color families. All edges crossing $S$ join distinct families. If $|S|>r$, the contribution is $o(t)$ by homogeneity. If $0\lt|S|\lt r$, simultaneous rotation of the limiting small colors shows that the leading evaluation of $X_{T[S]}$ is zero. The error is $O(t^{(|S|+d)/r})=o(t)$.

For $|S|=r$, the coefficient contributed by the small colors is $[e_r]X_{T[S]}$. It equals $r$ when $T[S]$ is connected and vanishes otherwise. This follows from the power-sum expansion for a tree and multiplicativity over components. Each remaining component contributes zero unless its order is divisible by $d$, again by rotation. For a component of order $dj'$ with $h'$ internal edges splitting it into multiples of $d$, the rooted-color formula gives the value $d(-1)^{j'-1-h'}(d-1)^{h'}$. Multiplying over the components gives (2).

## Matching forms for the coefficients using sizes two and three

Suppose $n$ is odd and $T$ has a matching missing a single vertex $u$. Give vertices in the bipartition class of $u$ sign $+1$ and the others sign $-1$. Use $u$ as root. Then

```math
[e_3 e_2^{(n-3)/2}] X_T =
-1+2^{\deg(u)}
 +\sum_{\substack{w\ne u\\w\ \mathrm{matched\ to\ its\ parent}}}\sigma(w)2^{\deg(w)}.
\tag{3}
```

Indeed, the two-color specialization has $X_T(y,z)=(yz)^{(n-1)/2}(y+z)$, so $[e_1e_2^{(n-1)/2}]X_T=1$. In (2) with $r=1,d=2$, the deletion of a vertex $w\ne u$ leaves components of even order exactly when $u$ and the mate of $w$ lie in the same component. That requires that the mate be the parent of $w$. All other vertices are still matched. At the colors $i,-i$ each even component with balanced bipartition contributes 2. The component containing the two unmatched vertices contributes $-2$ if they lie in the same bipartition class, which happens exactly when $\sigma(w)=-1$. Deleting $u$ leaves a perfectly matched forest and gives $2^{\deg(u)}$. This proves (3).

If $n$ is even and $T$ has a perfect matching $M$, there is a two-vertex formula:

```math
[e_3^2 e_2^{(n-6)/2}]X_T =
n-\sum_{w}2^{\deg(w)-1}
+\sum_{\{u,v\}\in\mathcal P}(-1)^{\operatorname{dist}(u,v)-1}
 2^{\deg(u)+\deg(v)-1}.
\tag{4}
```

This applies for $n\ge6$. The pairs in $\mathcal P$ are nonadjacent vertices whose connecting path starts and ends with edges of $M$.

To see this, use three colors $z,y_1,y_2$ with $y_1+y_2=-z$ and $y_1y_2=1+z^2$. Then $e_1=0$, $e_2=1$, $e_3=z+z^3$, so the coefficient of $z^2$ is the left side. With no vertex colored $z$, the term is $2(1+z^2)^{n/2}$. With just $w$ colored $z$, exactly one component of $T-w$ has one unmatched vertex and it contributes a factor $y_1+y_2=-z$. The other $\deg(w)-1$ components are balanced, giving the second term. With two vertices $u,v$ colored $z$, they must be nonadjacent. At $z=0$ their two mates must lie in the same component or the product of the two-color evaluations is zero. This is exactly the path condition in $\mathcal P$. The component with both mates contributes $2$ if their bipartition classes differ and $-2$ otherwise. The remaining components are balanced. There are $\deg(u)+\deg(v)-1$ components in total, giving (4).

## An obstruction to Li's proposed coefficient test

Problem 4.9 of [Li](https://arxiv.org/abs/2503.09484) asks if $[e_3e_2^{(n-3)/2}]X_T$ is always negative for an odd-order tree of maximum degree four with connected partitions of every type. This is false even for non-spiders.

Use the non-spider caterpillar $G_a$ from Proposition 5.2 of [Tang, Wang, and Wang](https://arxiv.org/abs/2610.39481). It consists of a central vertex $v$ with two leaves, a pendant path of length $a-2$ from $v$, and a neighbor $w$ of $v$ with one leaf and a pendant path of length $a$. Path lengths count the vertices beyond the attaching vertex. The order is $2a+3$. The cited proposition proves that this tree has all connected partition types for $a\equiv2\bmod 4$ and $\gcd(2a+3,15)=1$, including $a=60t+10$ for every $t\ge0$.

Match $v$ to one of its leaves, $w$ to its leaf, and the two even paths in consecutive pairs. The unmatched vertex $u$ is the second leaf of $v$. In (3), $u$ and the other leaf of $v$ contribute $2$ each. The leaf of $w$ contributes $-2$. Along the length-$a$ path the downstairs endpoints of matching edges are in the positive class and contribute $2a-2$. Along the length-$(a-2)$ path they are in the negative class and contribute $-2a+6$. Thus

```math
[e_3 e_2^{a}]X_{G_a}= -1+2+2-2+(2a-2)+(-2a+6)=5.
```

This also explains why the connected-partition information and this particular coefficient can both pass while the chromatic symmetric function has a negative coefficient elsewhere. The general conjecture still requires a sign obstruction for degree-four trees beyond the families already excluded.
