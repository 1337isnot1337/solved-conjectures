# Continuity of the separation parameter on circular cliques

For a fixed finite nonempty target graph $H$, let
$
s(H,G)=\min_{w\in\Delta(E(G))}
            \max_{f:V(G)\to V(H)}
               \sum_{uv\in E(G)}w_{uv}\,1_{\{f(u)f(v)\in E(H)\}}.
$
This is the separation parameter of [Engström–Färnqvist–Jonsson–Thapper](https://dmtcs.episciences.org/articles/2118). For $H=K_2$, it is the smallest best cut fraction over arbitrary edge weights, equivalently the reciprocal fractional cut-covering number.

**Theorem.** For every fixed $H$, the function $t\mapsto s(H,K_t)$, initially defined on rational circular clique ratios $t\ge2$, extends continuously to every real $t\ge2$. At any rational $t_0>2$ its deviation from the left is $O_{H,t_0}(1/\log(1/|t-t_0|))$. From the right it is $O_{t_0}(|t-t_0|)$. In particular, for the Andrásfai graphs $A_k=K_{(3k-1)/k}$,
$
2/3\le s(K_2,A_k)\le 2/3+O(1/\log k).
$
Thus no constant fraction strictly greater than $2/3$ of the edge weight can be guaranteed in a random cut on all Andrásfai sizes when arbitrary edge weights are allowed. This is consistent with the vertex-product weighted Heinig result and is not a counterexample to [Erdős #23](https://www.erdosproblems.com/23).

## Circle convention and grid rounding

Write $a=1/t$ and $F(a)=s(H,K_{p/q})$ for $a=q/p$. Put $K_{p/q}$ on the equally spaced $p$-point circle and allow clockwise displacements in the closed interval $[a,1-a]$. Higher $a$ gives higher $F$, by homomorphism monotonicity. For completeness, if $a'\ge a$, floor-rounding a phase to the $p$-grid maps every edge of the $a'$ clique to an edge of the $a$ clique. The rounded displacement in grid units is either the floor or ceiling of its original displacement times $p$, both within $[q,p-q]$. For any homomorphism $G\to G'$, pushing a weight distribution forward and using a maximizing map on $G'$ gives $s(H,G)\ge s(H,G')$.

For $b<a$, use a uniform rotation before flooring vertices to the $p$-grid of $a$. Each edge of the $b$ clique has probability at least $1-p(a-b)$ of becoming an edge of the $a$ clique. If a displacement is slightly below $q/p$, the only possible loss is rounding down, with probability at most $q-pb$; the upper endpoint is symmetric. Displacements in the closed interval always survive. Edge payoffs on the surviving edges can be guaranteed in expectation at rate $F(a)$. Indeed the finite minimax theorem gives a distribution of maps from the $a$ clique to $H$ with each edge successful with probability at least $F(a)$. Composing this distribution with random rounding gives
$
F(b)\ge (1-p(a-b))F(a).
\tag{1}
$
This proves continuity on that side of any rational threshold, including $a=1/2$.

## Averaging across the endpoint from the other side

Fix a rational $a=q/p<1/2$. Let $b=q'/p'>a$ approach $a$, using reduced fractions. For a measurable labeling of the circle by $V(H)$, let $P(z)$ be the probability that a uniform point $x$ and $x+z$ receive adjacent labels of $H$. The real function $P$ is even.

The following estimate holds uniformly over labelings. Let $U>V>0$ and let $y$ have logarithmic-uniform distribution on $[V,U]$, with normalized measure $dy/(y\log(U/V))$. For any fixed positive factors $l_1,l_2$,
$
\left|\mathbb E[P(a+l_1y)-P(a-l_2y)]\right|
 \le \frac{\|A_H\|(8+2|\log(l_1/l_2)|)}{\log(U/V)}.
\tag{2}
$
To prove it, use the vector-valued indicator $g(x)$ of the label. Its correlation is
$
P(z)=\sum_{j\in\mathbb Z} \widehat g(j)^* A_H\widehat g(j)\,e^{2\pi i j z}.
$
The sum of the absolute values of the coefficients is at most $`\|A_H\|`$ by Parseval, since $`\|g(x)\|_2=1`$. For a single frequency, changing the positive scaling from $l_1$ to $l_2$ changes the integral before normalization by at most $2|\log(l_1/l_2)|$, by scaling the interval endpoints under $dy/y$. Reversing the sign at scale $l_2$ contributes twice a sine integral on a positive interval. The absolute value of any such sine integral is at most four: use $|\sin u|\le u$ below one and integrate by parts above one. This proves (2).

Choose a weight vector $w$ attaining the definition of $F(a)$ on $K_{p/q}$, and fix $U=1/(10p^2)$. For $y\in[V,U]$ consider the $p$ vertices at phases $x+i(1/p+y)$, $0\le i<p$, with uniform $x$. Under any labeling their $w$-weighted $H$-success is at most $F(a)$, since their labels constitute a map from the fixed vertex set of $K_{p/q}$ to $H$.

Write $j$ for the positive index difference of an edge in the original clique. If $q\le j<p-q$, retain its displacement $j/p+jy$. The upper-boundary edges at $j=p-q$ instead have success $P(a-(p-q)y)$ by symmetry; replace their displacement by $a+qy$. Formula (2) bounds the effect of all replacements by $O_{H,p,q}(1/\log(U/V))$, independently of the labeling.

Take $V=2(b-a+1/p')/q$. For $b$ sufficiently close to $a$, $V<U$ and all retained or substituted displacements are strictly between $b+1/p'$ and $1-b-1/p'$. For the lower end use $j\ge q$ and $qy\ge qV$; for the upper end the retained differences have $j\le p-q-1$ and $jy\le pU<1/(10p)$. The substituted difference is also the retained $j=q$ displacement, since $q<p-q$.

Now floor all sampled points to the $p'$-grid. These displacement margins ensure every retained or substituted pair is an edge of $K_{p'/q'}$. Their pushforward defines a legitimate probability distribution on those edges. Given any labeling of that grid, extend it as a step function on the circle. Its success under the pushed edge distribution is the retained-and-substituted average just bounded, because flooring is exactly how the step function assigns labels. Hence
$
F(b)\le F(a)+O_{H,p,q}(1/\log(U/V)).
$
Distinct rational thresholds have $1/p'\le p(b-a)$, so $\log(U/V)$ has order $\log(1/(b-a))$. Monotonicity gives $F(b)\ge F(a)$. This is the claimed other-sided continuity and logarithmic estimate at rational thresholds.

## Irrational thresholds

At an irrational $a\in(0,1/2)$, extend $F$ by its right limit among rational thresholds. Choose rational $a_i=q_i/p_i>a$ tending to $a$ with $q_i-p_i a\to0$; ordinary continued fraction convergents from above suffice. For rational $b<a$, apply (1) with $a_i$ in place of $a$, and take $b\uparrow a$ first. The left limit is at least $(1-q_i+p_i a)F(a_i)$. Then let $i\to\infty$: the left limit is at least the right limit, and monotonicity gives the reverse inequality. Thus there are no jumps at irrational thresholds either.

## Relation to earlier work and to bipartization

[Engström–Färnqvist–Jonsson–Thapper](https://dmtcs.episciences.org/articles/2118/download), §§4–6, establish the $H$-cut formulation, exact values, several constant intervals, and jumps when the **source or mapping target** $H$ is varied while the input clique is fixed. The continuity here keeps $H$ fixed and varies the **input clique**. Their identified example $s(K_2,K_{11/4})=17/22<4/5$ already shows that a one-fifth loss cover fails at one Andrásfai size; we do not re-claim that example. The result above gives the limiting obstruction and the general continuity theorem. A targeted check also covered [Šámal's cubical coloring paper](https://dmtcs.episciences.org/en/articles/2134), the [2009 preprint](https://arxiv.org/abs/0904.4600) and [Färnqvist's thesis](https://www.diva-portal.org/smash/get/diva2%3A576178/FULLTEXT01.pdf) on the separation parameter. No prior general input-clique continuity theorem was found in that bounded check.

Finally, $F(1/3)=s(K_2,K_3)=2/3$, since every triangle cut crosses two of the three edges and uniform weights are optimal. Apply the right-in-threshold bound above to $a=k/(3k-1)$. The edge weights constructed here are not constrained to be vertex products, so the result does not challenge the absolute $N^2/25$ bound in Heinig's or Erdős's setting.

[Coordination #1097](https://github.com/1337isnot1337/solved-conjectures/issues/1097).
